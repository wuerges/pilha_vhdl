library IEEE;
use IEEE.std_logic_1164.all;

entity pilha is
  Port ( 
			RESET :In std_logic;
			DATA_IN : In std_logic_vector(7 downto 0);
			POP : In std_logic;
			PUSH : In std_logic;
			cheio: out std_logic;
			vazio : out std_logic;
			leds : out std_logic_vector(7 downto 0);
			DATA_OUT : out std_logic_vector(7 downto 0));
end entity;


-- 1 - Ponteiro n eh incrementado dps do pusH
-- 2 - EMPTY e FULL colocados por primeiro mas nunca em 0 -- precisa de dois if e else um para cada um deles
-- 3 - inicializar o datA_IN e datA_OUT
-- 4 - atribuir data out no topo da pilha 


architecture principal of pilha is

	type DATA_ARRAY is array (integer range <>) of std_logic_vector(0 to 7);
	signal DATA: DATA_ARRAY (0 to 7);
	signal FULL: std_logic;
	signal EMPTY: std_logic;
	
		begin
				process(RESET, DATA_IN, POP, PUSH, FULL, EMPTY)
				variable PTR: integer;
                variable P : std_logic;
				begin
                    FULL <= PTR = 8;
                    EMPTY <= PTR = 0;

                    -- SAÍDA PARA O BCD----------	
                    DATA_OUT <= DATA(PTR);
                    ------------------------------
									
					if RESET = '0' then 
						PTR:= 0;
                        P <= '0';
						DATA <=(others =>(others => '0'));
						DATA_OUT <=(others => '0');
						leds(0) <= '0';
						leds(1) <= '0';
						leds(2) <= '0';
						leds(3) <= '0';
						leds(4) <= '0';
						leds(5) <= '0';
						leds(6) <= '0';
						
						
					elsif PUSH = '1' and FULL = '0' and P = '0' then 
						DATA(PTR) <= DATA_IN;
                        P <= '1';
						
						PTR:=(PTR+1);
							
					elsif POP = '1' and EMPTY = '0' and P = '0' then					
                        P <= '1';
						PTR := (PTR - 1);
                    elsif PUSH = '0' and POP = '0' and P = '1' then
                        P <= '0';
                    else then

					end if;								
                    
					
				-----------------------------------------
				
			--COND. P/ ANALISAR SAIDA NOS LEDS DO PONTEIRO---
				--if PTR = 1 then
--------			leds(0) <= '1';
--------		
--------		elsif PTR = 2 then
--------			leds(1) <= '1';
--------			
--------		elsif PTR = 3 then
--------			leds(2) <= '1';
--------		
--------		elsif PTR = 4 then
--------			leds(3) <= '1';
--------			
--------		elsif PTR = 5 then
--------			leds(4) <= '1';
--------			
--------		elsif PTR = 6 then
--------			leds(5) <= '1';

--------		elsif PTR = 7 then
--------			leds(6) <= '1';
--------			
--------		elsif PTR = 8 then
--------			leds(7) <= '1';
--------		end if;
				------------------------------
			end process;
end architecture;
