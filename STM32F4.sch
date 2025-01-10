EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "STM32F4 Test Board"
Date "2022-04-24"
Rev "v1.0"
Comp "Zach Wilson"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR0101
U 1 1 626659E5
P 3750 7350
F 0 "#PWR0101" H 3750 7100 50  0001 C CNN
F 1 "GND" H 3750 7200 50  0000 C CNN
F 2 "" H 3750 7350 50  0001 C CNN
F 3 "" H 3750 7350 50  0001 C CNN
	1    3750 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 7250 3750 7300
Wire Wire Line
	3750 7300 3850 7300
Wire Wire Line
	3850 7300 3850 7250
Connection ~ 3750 7300
Wire Wire Line
	3750 7300 3750 7350
Wire Wire Line
	3850 7300 3950 7300
Wire Wire Line
	3950 7300 3950 7250
Connection ~ 3850 7300
Wire Wire Line
	4050 3600 4050 3650
Connection ~ 3950 3600
Wire Wire Line
	3950 3600 4050 3600
Connection ~ 3850 3600
Wire Wire Line
	3950 3600 3950 3650
Wire Wire Line
	3850 3600 3950 3600
Connection ~ 3750 3600
Wire Wire Line
	3850 3600 3850 3650
Wire Wire Line
	3750 3600 3850 3600
Wire Wire Line
	3650 3600 3650 3650
Wire Wire Line
	3750 3600 3750 3650
Wire Wire Line
	3650 3600 3750 3600
$Comp
L power:+3.3V #PWR0102
U 1 1 62666808
P 3650 3500
F 0 "#PWR0102" H 3650 3350 50  0001 C CNN
F 1 "+3.3V" H 3650 3650 50  0000 C CNN
F 2 "" H 3650 3500 50  0001 C CNN
F 3 "" H 3650 3500 50  0001 C CNN
	1    3650 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 3500 3650 3600
Connection ~ 3650 3600
$Comp
L power:+3.3VA #PWR0103
U 1 1 62669E53
P 4150 3550
F 0 "#PWR0103" H 4150 3400 50  0001 C CNN
F 1 "+3.3VA" H 4165 3723 50  0000 C CNN
F 2 "" H 4150 3550 50  0001 C CNN
F 3 "" H 4150 3550 50  0001 C CNN
	1    4150 3550
	1    0    0    -1  
$EndComp
Text Notes -5100 1000 0    50   ~ 0
VDDA - This is the supply voltage for the analog portion of this chip (ADCs and DACs).\nThis could be tied to the VDD pins if there are no plans to use the analog portions of\nthe chip, however, for completeness we will add some additonal filtering to this pin for\nfuture use potentially.
Text GLabel 3150 3850 0    50   Input ~ 0
NRST
Text GLabel 3150 4050 0    50   Input ~ 0
BOOT0
Text Notes -5100 300  0    50   ~ 0
VCAP_1 and 2 - per the datasheet these are for the internal regulators\non the chip. They need to be decoupled or bypassed. 2.2uF, low ESR,\nceramic capacitors.
Text Notes -5100 600  0    50   ~ 0
The datasheet calls for low ESR caps per the datasheets, however Phil has picked\nthe basic parts of JLCPCB and they've worked well for him. Doesn't think it's too\ncritical.
Text Notes -5100 1250 0    50   ~ 0
If you pull the NRST pin low, the chip will do a hard reset. The datasheet says the pin\nhas an internal pull up resistor (40ish kOhms). We can use this pin for debugging etc.\n
Text Notes -5100 2150 0    50   ~ 0
HSE_(IN/OUT) - Crystal Oscillator
Text Notes -5100 2350 0    50   ~ 0
For USB_D+ - typing the '+' tells KiCAD this is a differential pair, which helps with\ntrace routing on the PCB.
Text GLabel 4550 4050 2    50   Input ~ 0
LED_STATUS
Text Notes -5100 2550 0    50   ~ 0
Instead of tying unused pins to gnd, we will do that via software. This reduces noise\nas well as power consumption of the board
NoConn ~ 4550 3850
NoConn ~ 4550 3950
NoConn ~ 4550 4150
NoConn ~ 4550 4250
Text Notes -5100 2850 0    50   ~ 0
In KiCAD - if trying to place no connects for example. After you've placed one symbol,\nif you hit 'Insert', it will place the same symbol one position down. This helps speed\nup the process a bit.
$Comp
L Device:C_Small C11
U 1 1 6268C7D3
P 2350 2850
F 0 "C11" H 2442 2896 50  0000 L CNN
F 1 "4u7" H 2442 2805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2350 2850 50  0001 C CNN
F 3 "~" H 2350 2850 50  0001 C CNN
	1    2350 2850
	1    0    0    -1  
$EndComp
Text Notes -5100 3000 0    50   ~ 0
We want one bulk decoupling cap - close to the u-controller.
Text Notes -5100 3100 0    50   ~ 0
Per VDD and per VBAT pin, we want one 100nF decoupling cap.
$Comp
L Device:C_Small C12
U 1 1 6268D1BA
P 2700 2850
F 0 "C12" H 2792 2896 50  0000 L CNN
F 1 "100n" H 2792 2805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2700 2850 50  0001 C CNN
F 3 "~" H 2700 2850 50  0001 C CNN
	1    2700 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C13
U 1 1 6268D4B1
P 3050 2850
F 0 "C13" H 3142 2896 50  0000 L CNN
F 1 "100n" H 3142 2805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3050 2850 50  0001 C CNN
F 3 "~" H 3050 2850 50  0001 C CNN
	1    3050 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C14
U 1 1 6268E3B4
P 3400 2850
F 0 "C14" H 3492 2896 50  0000 L CNN
F 1 "100n" H 3492 2805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3400 2850 50  0001 C CNN
F 3 "~" H 3400 2850 50  0001 C CNN
	1    3400 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C15
U 1 1 6268E69A
P 3750 2850
F 0 "C15" H 3842 2896 50  0000 L CNN
F 1 "100n" H 3842 2805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3750 2850 50  0001 C CNN
F 3 "~" H 3750 2850 50  0001 C CNN
	1    3750 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C16
U 1 1 6268EA6E
P 4100 2850
F 0 "C16" H 4192 2896 50  0000 L CNN
F 1 "100n" H 4192 2805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4100 2850 50  0001 C CNN
F 3 "~" H 4100 2850 50  0001 C CNN
	1    4100 2850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0104
U 1 1 6268ED2B
P 2350 2700
F 0 "#PWR0104" H 2350 2550 50  0001 C CNN
F 1 "+3.3V" H 2350 2850 50  0000 C CNN
F 2 "" H 2350 2700 50  0001 C CNN
F 3 "" H 2350 2700 50  0001 C CNN
	1    2350 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2750 2700 2750
Wire Wire Line
	2700 2750 3050 2750
Connection ~ 2700 2750
Wire Wire Line
	3050 2750 3400 2750
Connection ~ 3050 2750
Wire Wire Line
	3400 2750 3750 2750
Connection ~ 3400 2750
Wire Wire Line
	3750 2750 4100 2750
Connection ~ 3750 2750
$Comp
L power:GND #PWR0105
U 1 1 62690F91
P 2350 2950
F 0 "#PWR0105" H 2350 2700 50  0001 C CNN
F 1 "GND" H 2350 2800 50  0000 C CNN
F 2 "" H 2350 2950 50  0001 C CNN
F 3 "" H 2350 2950 50  0001 C CNN
	1    2350 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2950 2700 2950
Connection ~ 2350 2950
Wire Wire Line
	2700 2950 3050 2950
Connection ~ 2700 2950
Wire Wire Line
	3050 2950 3400 2950
Connection ~ 3050 2950
Wire Wire Line
	3400 2950 3750 2950
Connection ~ 3400 2950
Wire Wire Line
	3750 2950 4100 2950
Connection ~ 3750 2950
$Comp
L Device:L_Small L2
U 1 1 626A127A
P 4900 2950
F 0 "L2" V 5085 2950 50  0000 C CNN
F 1 "39n" V 4994 2950 50  0000 C CNN
F 2 "Inductor_SMD:L_0402_1005Metric" H 4900 2950 50  0001 C CNN
F 3 "~" H 4900 2950 50  0001 C CNN
	1    4900 2950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4650 2900 4650 2950
Wire Wire Line
	4650 2950 4800 2950
$Comp
L Device:C_Small C9
U 1 1 626A2C7B
P 5100 3050
F 0 "C9" H 5192 3096 50  0000 L CNN
F 1 "1u" H 5192 3005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 5100 3050 50  0001 C CNN
F 3 "~" H 5100 3050 50  0001 C CNN
	1    5100 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C10
U 1 1 626A3087
P 5400 3050
F 0 "C10" H 5492 3096 50  0000 L CNN
F 1 "10n" H 5492 3005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 5400 3050 50  0001 C CNN
F 3 "~" H 5400 3050 50  0001 C CNN
	1    5400 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2950 5100 2950
Wire Wire Line
	5100 3150 5400 3150
$Comp
L power:GND #PWR0106
U 1 1 626A511D
P 5100 3150
F 0 "#PWR0106" H 5100 2900 50  0001 C CNN
F 1 "GND" H 5100 3000 50  0000 C CNN
F 2 "" H 5100 3150 50  0001 C CNN
F 3 "" H 5100 3150 50  0001 C CNN
	1    5100 3150
	1    0    0    -1  
$EndComp
Connection ~ 5100 3150
Text Notes 2750 2600 0    50   ~ 0
De-coupling caps
Text Notes 1050 7350 0    50   ~ 0
Cload = 2 * (CL - Cstray)
Text Notes -5100 3900 0    50   Italic 10
Crystal Circuit:
Text Notes -5100 2050 0    50   ~ 0
BOOT0 - in the datasheet, section 2.2.13 Boot modes on page 23. It shows the BOOT0\npin must be pulled low or high, cannot be left floating. \n- If the pin is pulled low, the chip is in a run state. It will run a program from flash memory.\n- If the pin is pulled high, (3.3v), the chip will be put into program mode. It can be programmed\nvia UART, USB, etc.\nIf you are using Serial Wire Debug (SWD), or any sort of debugger, you always want to\nhave the BOOT0 pin pulled low. It can override that essentially. \nSince we are going to use USB, and we may want to program it via UART, we will make\nit switchable by adding a switch
$Comp
L Switch:SW_SPDT SW1
U 1 1 62671487
P 1650 3800
F 0 "SW1" H 1650 4085 50  0000 C CNN
F 1 "SW_SPDT" H 1650 3994 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPDT_PCM12" H 1650 3800 50  0001 C CNN
F 3 "~" H 1650 3800 50  0001 C CNN
	1    1650 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R9
U 1 1 62671F41
P 1250 3800
F 0 "R9" V 1150 3800 50  0000 C CNN
F 1 "10k" V 1350 3800 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 1250 3800 50  0001 C CNN
F 3 "~" H 1250 3800 50  0001 C CNN
	1    1250 3800
	0    1    1    0   
$EndComp
Wire Wire Line
	1350 3800 1450 3800
$Comp
L power:+3.3V #PWR0108
U 1 1 626733E1
P 1950 3650
F 0 "#PWR0108" H 1950 3500 50  0001 C CNN
F 1 "+3.3V" H 1950 3800 50  0000 C CNN
F 2 "" H 1950 3650 50  0001 C CNN
F 3 "" H 1950 3650 50  0001 C CNN
	1    1950 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 3650 1950 3700
Wire Wire Line
	1950 3700 1850 3700
$Comp
L power:GND #PWR0109
U 1 1 62673D71
P 1950 3950
F 0 "#PWR0109" H 1950 3700 50  0001 C CNN
F 1 "GND" H 1950 3800 50  0000 C CNN
F 2 "" H 1950 3950 50  0001 C CNN
F 3 "" H 1950 3950 50  0001 C CNN
	1    1950 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 3950 1950 3900
Wire Wire Line
	1950 3900 1850 3900
Text GLabel 1100 3800 0    50   Input ~ 0
BOOT0
Wire Wire Line
	1100 3800 1150 3800
$Comp
L power:+3.3V #PWR0110
U 1 1 626A1E57
P 4650 2900
F 0 "#PWR0110" H 4650 2750 50  0001 C CNN
F 1 "+3.3V" H 4650 3050 50  0000 C CNN
F 2 "" H 4650 2900 50  0001 C CNN
F 3 "" H 4650 2900 50  0001 C CNN
	1    4650 2900
	1    0    0    -1  
$EndComp
Text Notes 4500 2600 0    50   ~ 0
Small amount of filtering for VDDA pin
Text Notes 550  2500 0    50   ~ 10
STM32 F405 Micro-Controller
$Comp
L power:+12V #PWR0111
U 1 1 626C2111
P 800 1150
F 0 "#PWR0111" H 800 1000 50  0001 C CNN
F 1 "+12V" H 815 1323 50  0000 C CNN
F 2 "" H 800 1150 50  0001 C CNN
F 3 "" H 800 1150 50  0001 C CNN
	1    800  1150
	1    0    0    -1  
$EndComp
$Comp
L Device:Polyfuse_Small F1
U 1 1 626C717E
P 1850 1300
F 0 "F1" V 1750 1300 50  0000 C CNN
F 1 "250mA" V 1950 1300 50  0000 C CNN
F 2 "Fuse:Fuse_1206_3216Metric" H 1900 1100 50  0001 L CNN
F 3 "~" H 1850 1300 50  0001 C CNN
	1    1850 1300
	0    1    1    0   
$EndComp
Wire Wire Line
	800  1300 950  1300
$Comp
L Device:Ferrite_Bead_Small FB1
U 1 1 626D0C7F
P 2450 1300
F 0 "FB1" V 2213 1300 50  0000 C CNN
F 1 "600 @ 600 MHz" V 2300 1450 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric" V 2380 1300 50  0001 C CNN
F 3 "~" H 2450 1300 50  0001 C CNN
	1    2450 1300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 626D1F7E
P 2700 1600
F 0 "#PWR0112" H 2700 1350 50  0001 C CNN
F 1 "GND" H 2700 1450 50  0000 C CNN
F 2 "" H 2700 1600 50  0001 C CNN
F 3 "" H 2700 1600 50  0001 C CNN
	1    2700 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 626D2777
P 2700 1500
F 0 "C1" H 2792 1546 50  0000 L CNN
F 1 "10u" H 2792 1455 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2700 1500 50  0001 C CNN
F 3 "~" H 2700 1500 50  0001 C CNN
	1    2700 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 1300 2700 1300
Text GLabel 2700 1300 2    50   Input ~ 0
BUCK_IN
Wire Wire Line
	2700 1400 2700 1300
Text Notes -5100 5200 0    50   ~ 10
Buck Converter
Wire Wire Line
	3800 1350 3800 1400
Connection ~ 3800 1350
Wire Wire Line
	3800 1350 4100 1350
Text GLabel 4100 1350 2    50   Input ~ 0
BUCK_EN
$Comp
L power:GND #PWR0113
U 1 1 626E4248
P 3800 1600
F 0 "#PWR0113" H 3800 1350 50  0001 C CNN
F 1 "GND" H 3800 1450 50  0000 C CNN
F 2 "" H 3800 1600 50  0001 C CNN
F 3 "" H 3800 1600 50  0001 C CNN
	1    3800 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1100 3800 1100
Wire Wire Line
	3800 1300 3800 1350
Text GLabel 3650 1100 0    50   Input ~ 0
BUCK_IN
$Comp
L Device:R_Small R2
U 1 1 626DCD47
P 3800 1500
F 0 "R2" H 3859 1546 50  0000 L CNN
F 1 "68k" H 3859 1455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3800 1500 50  0001 C CNN
F 3 "~" H 3800 1500 50  0001 C CNN
	1    3800 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 626DC40B
P 3800 1200
F 0 "R1" H 3859 1246 50  0000 L CNN
F 1 "100k" H 3859 1155 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3800 1200 50  0001 C CNN
F 3 "~" H 3800 1200 50  0001 C CNN
	1    3800 1200
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:AO3401A Q1
U 1 1 626CBFD1
P 1150 1400
F 0 "Q1" V 1492 1400 50  0000 C CNN
F 1 "AO3401A" V 1401 1400 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 1350 1325 50  0001 L CIN
F 3 "http://www.aosmd.com/pdfs/datasheet/AO3401A.pdf" H 1150 1400 50  0001 L CNN
	1    1150 1400
	0    -1   -1   0   
$EndComp
Text GLabel 6550 1100 0    50   Input ~ 0
BUCK_IN
Text GLabel 6550 1200 0    50   Input ~ 0
BUCK_EN
Text GLabel 7250 1100 2    50   Input ~ 0
BUCK_BST
Text GLabel 7250 1200 2    50   Input ~ 0
BUCK_SW
Text GLabel 7250 1300 2    50   Input ~ 0
BUCK_FB
$Comp
L power:GND #PWR0114
U 1 1 626C1AFC
P 6900 1600
F 0 "#PWR0114" H 6900 1350 50  0001 C CNN
F 1 "GND" H 6905 1427 50  0000 C CNN
F 2 "" H 6900 1600 50  0001 C CNN
F 3 "" H 6900 1600 50  0001 C CNN
	1    6900 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 626F892E
P 8450 1200
F 0 "C2" V 8600 1150 50  0000 L CNN
F 1 "10n" V 8300 1100 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 8450 1200 50  0001 C CNN
F 3 "~" H 8450 1200 50  0001 C CNN
	1    8450 1200
	0    -1   -1   0   
$EndComp
Text GLabel 8350 1200 0    50   Input ~ 0
BUCK_BST
Text GLabel 8550 1200 2    50   Input ~ 0
BUCK_SW
Text GLabel 9700 900  0    50   Input ~ 0
BUCK_SW
$Comp
L Device:D_Schottky_Small D2
U 1 1 626F9C37
P 9800 1000
F 0 "D2" V 9754 1070 50  0000 L CNN
F 1 "B5819W" V 9845 1070 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" V 9800 1000 50  0001 C CNN
F 3 "~" V 9800 1000 50  0001 C CNN
	1    9800 1000
	0    1    1    0   
$EndComp
Wire Wire Line
	9700 900  9800 900 
$Comp
L power:GND #PWR0115
U 1 1 626FBE54
P 10200 1250
F 0 "#PWR0115" H 10200 1000 50  0001 C CNN
F 1 "GND" H 10205 1077 50  0000 C CNN
F 2 "" H 10200 1250 50  0001 C CNN
F 3 "" H 10200 1250 50  0001 C CNN
	1    10200 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:L_Small L1
U 1 1 626FCB5B
P 10200 900
F 0 "L1" V 10385 900 50  0000 C CNN
F 1 "10uH" V 10294 900 50  0000 C CNN
F 2 "Inductor_SMD:L_Sunlord_MWSA0518_5.4x5.2mm" H 10200 900 50  0001 C CNN
F 3 "~" H 10200 900 50  0001 C CNN
	1    10200 900 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9800 900  10100 900 
Connection ~ 9800 900 
$Comp
L Device:C_Small C3
U 1 1 626FF984
P 10400 1000
F 0 "C3" H 10492 1046 50  0000 L CNN
F 1 "10u" H 10492 955 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 10400 1000 50  0001 C CNN
F 3 "~" H 10400 1000 50  0001 C CNN
	1    10400 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 62700B05
P 10750 1000
F 0 "C4" H 10842 1046 50  0000 L CNN
F 1 "10u" H 10842 955 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 10750 1000 50  0001 C CNN
F 3 "~" H 10750 1000 50  0001 C CNN
	1    10750 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 900  10400 900 
Wire Wire Line
	10400 900  10750 900 
Connection ~ 10400 900 
Wire Wire Line
	10750 1100 10750 1200
Wire Wire Line
	10400 1200 10400 1100
Wire Wire Line
	10400 1200 10750 1200
Wire Wire Line
	10400 1200 10200 1200
Wire Wire Line
	9800 1200 9800 1100
Connection ~ 10400 1200
Wire Wire Line
	10200 1200 10200 1250
Connection ~ 10200 1200
Wire Wire Line
	10200 1200 9800 1200
$Comp
L power:+3.3V #PWR0116
U 1 1 6270BB81
P 10750 850
F 0 "#PWR0116" H 10750 700 50  0001 C CNN
F 1 "+3.3V" H 10750 1000 50  0000 C CNN
F 2 "" H 10750 850 50  0001 C CNN
F 3 "" H 10750 850 50  0001 C CNN
	1    10750 850 
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0117
U 1 1 6270C772
P 4800 800
F 0 "#PWR0117" H 4800 650 50  0001 C CNN
F 1 "+3.3V" H 4800 950 50  0000 C CNN
F 2 "" H 4800 800 50  0001 C CNN
F 3 "" H 4800 800 50  0001 C CNN
	1    4800 800 
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 6270CB38
P 4800 950
F 0 "R3" H 4859 996 50  0000 L CNN
F 1 "47k" H 4859 905 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4800 950 50  0001 C CNN
F 3 "~" H 4800 950 50  0001 C CNN
	1    4800 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 6270D104
P 4800 1250
F 0 "R4" H 4859 1296 50  0000 L CNN
F 1 "15k" H 4859 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4800 1250 50  0001 C CNN
F 3 "~" H 4800 1250 50  0001 C CNN
	1    4800 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R5
U 1 1 6270D24B
P 4800 1450
F 0 "R5" H 4859 1496 50  0000 L CNN
F 1 "270" H 4859 1405 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4800 1450 50  0001 C CNN
F 3 "~" H 4800 1450 50  0001 C CNN
	1    4800 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 1050 4800 1100
$Comp
L power:GND #PWR0118
U 1 1 6270FB48
P 4800 1550
F 0 "#PWR0118" H 4800 1300 50  0001 C CNN
F 1 "GND" H 4805 1377 50  0000 C CNN
F 2 "" H 4800 1550 50  0001 C CNN
F 3 "" H 4800 1550 50  0001 C CNN
	1    4800 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 1100 5000 1100
Connection ~ 4800 1100
Wire Wire Line
	4800 1100 4800 1150
Text GLabel 5000 1100 2    50   Input ~ 0
BUCK_FB
Text Notes 5150 1400 0    50   ~ 0
To avoid extended \nparts on JLCPCB
Wire Notes Line
	5000 1200 5100 1200
Wire Notes Line
	5100 1200 5100 1550
Wire Notes Line
	5100 1550 5000 1550
Text Notes 850  1950 0    50   ~ 0
Fusing, Reverse Polarity Protection, and Filtering
Text Notes 3150 1950 0    50   ~ 0
Voltage Divider for 6V Enable
Text Notes 4650 1950 0    50   ~ 0
Voltage Divider for Feedback
Text Notes 8200 1600 0    50   ~ 0
Bootstrap Cap
Text Notes 9950 1650 0    50   ~ 0
Output Circuitry
Wire Notes Line
	450  2350 11250 2350
Text Notes 550  650  0    50   ~ 10
Buck Converter
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 62744107
P 7300 3000
F 0 "J1" H 7380 2992 50  0000 L CNN
F 1 "Power Connector" H 7380 2901 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-2-3.5-H_1x02_P3.50mm_Horizontal" H 7300 3000 50  0001 C CNN
F 3 "~" H 7300 3000 50  0001 C CNN
	1    7300 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 627452DC
P 7100 3100
F 0 "#PWR0119" H 7100 2850 50  0001 C CNN
F 1 "GND" H 7105 2927 50  0000 C CNN
F 2 "" H 7100 3100 50  0001 C CNN
F 3 "" H 7100 3100 50  0001 C CNN
	1    7100 3100
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0120
U 1 1 62745804
P 7100 3000
F 0 "#PWR0120" H 7100 2850 50  0001 C CNN
F 1 "+12V" H 7115 3173 50  0000 C CNN
F 2 "" H 7100 3000 50  0001 C CNN
F 3 "" H 7100 3000 50  0001 C CNN
	1    7100 3000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J5
U 1 1 62746935
P 8800 3150
F 0 "J5" H 8850 3450 50  0000 C CNN
F 1 "SWD" H 8850 2850 50  0000 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x05_P1.27mm_Vertical_SMD" H 8800 3150 50  0001 C CNN
F 3 "~" H 8800 3150 50  0001 C CNN
	1    8800 3150
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0121
U 1 1 62749610
P 8500 2850
F 0 "#PWR0121" H 8500 2700 50  0001 C CNN
F 1 "+3.3V" H 8515 3023 50  0000 C CNN
F 2 "" H 8500 2850 50  0001 C CNN
F 3 "" H 8500 2850 50  0001 C CNN
	1    8500 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 2950 8600 2950
$Comp
L power:GND #PWR0122
U 1 1 6274C815
P 8500 3400
F 0 "#PWR0122" H 8500 3150 50  0001 C CNN
F 1 "GND" H 8505 3227 50  0000 C CNN
F 2 "" H 8500 3400 50  0001 C CNN
F 3 "" H 8500 3400 50  0001 C CNN
	1    8500 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 3350 8500 3350
Wire Wire Line
	8500 3350 8500 3400
Wire Wire Line
	8600 3150 8500 3150
Wire Wire Line
	8500 3150 8500 3350
Connection ~ 8500 3350
Wire Wire Line
	8600 3050 8500 3050
Wire Wire Line
	8500 3050 8500 3150
Connection ~ 8500 3150
NoConn ~ 8600 3250
Text GLabel 9100 2950 2    50   Input ~ 0
SWDIO
Text GLabel 9100 3050 2    50   Input ~ 0
SWCLK
Text GLabel 9100 3150 2    50   Input ~ 0
SWO
Text Notes -5100 6350 0    50   ~ 0
Would be good to add inline 22 Ohm Res. for short circuit current lim\non the SWD lines (Didn't in the video for time saving purposes)
NoConn ~ 9100 3250
Text GLabel 9100 3350 2    50   Input ~ 0
NRST
Text Notes -5100 6550 0    50   ~ 0
For NRST - would be good to feed into low value resistor + Cap\nfor a low pass filter for debounce from parasitic resets
Wire Wire Line
	2400 4250 3150 4250
Text Notes -5100 6100 0    50   ~ 10
Serial Wire Debug Connector: Conn_02x05_Odd_Even
Text Notes -5100 5950 0    50   ~ 0
Need an output cap (Between BUCK_SW and 3.3V). Should be around 20uF\nBut can use two in parallel to have lower ESR
Text Notes -5100 5750 0    50   ~ 0
P Channel Mosfet is for reverse polarity protection.\nFerrite Bead becomes resistor of 600 Ohms at 600 MHz\nBuck_EN cannot handle more than 6V\n
Text Notes -5100 5450 0    50   ~ 0
Buck Converter is: MP2359DJ-LF-Z from JLCPB.\nCannot download datasheet for some reason
Wire Notes Line
	6150 7800 6150 2350
$Comp
L power:GND #PWR0123
U 1 1 627149F6
P 1200 5150
F 0 "#PWR0123" H 1200 4900 50  0001 C CNN
F 1 "GND" H 1200 5000 50  0000 C CNN
F 2 "" H 1200 5150 50  0001 C CNN
F 3 "" H 1200 5150 50  0001 C CNN
	1    1200 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R10
U 1 1 62714663
P 1200 5050
F 0 "R10" H 1259 5096 50  0000 L CNN
F 1 "1k5" H 1259 5005 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 1200 5050 50  0001 C CNN
F 3 "~" H 1200 5050 50  0001 C CNN
	1    1200 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 4650 1200 4750
Text GLabel 1200 4650 2    50   Input ~ 0
LED_STATUS
$Comp
L Device:LED_Small D4
U 1 1 62711A71
P 1200 4850
F 0 "D4" V 1246 4780 50  0000 R CNN
F 1 "BLUE" V 1155 4780 50  0000 R CNN
F 2 "Diode_SMD:D_0603_1608Metric" V 1200 4850 50  0001 C CNN
F 3 "~" V 1200 4850 50  0001 C CNN
	1    1200 4850
	0    -1   -1   0   
$EndComp
Text Notes -5100 4600 0    50   ~ 0
Load Caps depend on the PCB layout and stray capacitance - see equation near circuit.\nFeed resistor is 47 Ohms ~ is not always needed. All it does is limit the drive level from\nthe ucontroller. If the drive level is too high, it well overdrive the crystal which\ngenerates harmonics and overall noise. This is found in the application notes "AN2867"\nPhil's done the calculation, and anywhere from 10 to 47 ohms is fine.\n\nA good idea is to make it a zero ohm resistor, so you can add it and change if needed.\nIt's very difficult to do, but can be found through experimentation.
Text Notes -5100 5050 0    50   ~ 0
Cload = 2 * (CL - Cstray)\nCload = Load Capacitors\nCL = Load Capacitance of Crystal (12pF)\nCstray = Stray Capacitance of the u-controller - Rough Estimate for \nCstray is about 5 or 6 pF
Wire Wire Line
	1850 5850 1850 6000
Text GLabel 1850 5850 0    50   Input ~ 0
HSE_OUT
Connection ~ 1850 6250
Wire Wire Line
	1850 6200 1850 6250
Connection ~ 1250 6250
Wire Wire Line
	1250 6100 1250 6250
Text GLabel 1250 6100 0    50   Input ~ 0
HSE_IN
$Comp
L Device:R_Small R11
U 1 1 626AE5D6
P 1850 6100
F 0 "R11" H 1909 6146 50  0000 L CNN
F 1 "47" H 1909 6055 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 1850 6100 50  0001 C CNN
F 3 "~" H 1850 6100 50  0001 C CNN
	1    1850 6100
	1    0    0    -1  
$EndComp
Text Notes 850  7200 0    50   ~ 0
This is not from reading the crystal design \nguide, it's from Phil's tutorial
Wire Wire Line
	1850 6250 1650 6250
Wire Wire Line
	1850 6550 1850 6250
Wire Wire Line
	1250 6250 1450 6250
Wire Wire Line
	1250 6550 1250 6250
Wire Wire Line
	1550 6800 1850 6800
Connection ~ 1550 6800
$Comp
L power:GND #PWR0124
U 1 1 626ABDCA
P 1550 6800
F 0 "#PWR0124" H 1550 6550 50  0001 C CNN
F 1 "GND" H 1550 6650 50  0000 C CNN
F 2 "" H 1550 6800 50  0001 C CNN
F 3 "" H 1550 6800 50  0001 C CNN
	1    1550 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 6800 1850 6750
Wire Wire Line
	1250 6800 1550 6800
Wire Wire Line
	1250 6750 1250 6800
$Comp
L power:GND #PWR0125
U 1 1 626A9B86
P 1550 6150
F 0 "#PWR0125" H 1550 5900 50  0001 C CNN
F 1 "GND" H 1550 6000 50  0000 C CNN
F 2 "" H 1550 6150 50  0001 C CNN
F 3 "" H 1550 6150 50  0001 C CNN
	1    1550 6150
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 626A8A30
P 1550 6350
F 0 "#PWR0126" H 1550 6100 50  0001 C CNN
F 1 "GND" H 1550 6200 50  0000 C CNN
F 2 "" H 1550 6350 50  0001 C CNN
F 3 "" H 1550 6350 50  0001 C CNN
	1    1550 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 626A861F
P 1850 6650
F 0 "C6" H 1942 6696 50  0000 L CNN
F 1 "12p" H 1942 6605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1850 6650 50  0001 C CNN
F 3 "~" H 1850 6650 50  0001 C CNN
	1    1850 6650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 626A8100
P 1250 6650
F 0 "C5" H 1342 6696 50  0000 L CNN
F 1 "12p" H 1342 6605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1250 6650 50  0001 C CNN
F 3 "~" H 1250 6650 50  0001 C CNN
	1    1250 6650
	1    0    0    -1  
$EndComp
Text Notes -5100 3750 0    50   ~ 0
Reference - "https://www.st.com/resource/en/application_note/an2867-oscillator-\ndesign-guide-for-stm8afals-stm32-mcus-and-mpus-stmicroelectronics.pdf" for a\nguide on how to connect crystal oscillators to STM32 u-controllers.\n- Reference Section 3.1 to start
Text Notes -5100 3350 0    50   ~ 0
Chose 'GND24' for crystal since in the datasheet, the crystal pins are 1 and 3, while\nthe GND pins are 2 and 4.
$Comp
L Device:Crystal_GND24_Small Y1
U 1 1 626A6622
P 1550 6250
F 0 "Y1" H 1350 6200 50  0000 L CNN
F 1 "16MHz" H 1300 6100 50  0000 L CNN
F 2 "Crystal:Crystal_SMD_3225-4Pin_3.2x2.5mm" H 1550 6250 50  0001 C CNN
F 3 "~" H 1550 6250 50  0001 C CNN
	1    1550 6250
	1    0    0    -1  
$EndComp
NoConn ~ 3150 7050
NoConn ~ 3150 6950
NoConn ~ 3150 6850
NoConn ~ 3150 6750
NoConn ~ 3150 6650
NoConn ~ 3150 6550
NoConn ~ 3150 6450
NoConn ~ 3150 6350
NoConn ~ 3150 6250
NoConn ~ 3150 6150
NoConn ~ 3150 6050
NoConn ~ 3150 5950
NoConn ~ 3150 5850
NoConn ~ 3150 5750
NoConn ~ 3150 5650
NoConn ~ 3150 5550
NoConn ~ 3150 5350
NoConn ~ 4550 7050
NoConn ~ 4550 6950
NoConn ~ 4550 6850
NoConn ~ 4550 6750
NoConn ~ 4550 6450
NoConn ~ 4550 6350
NoConn ~ 4550 6050
NoConn ~ 4550 5950
NoConn ~ 4550 5750
NoConn ~ 4550 5650
NoConn ~ 4550 5550
NoConn ~ 4550 5350
NoConn ~ 4550 4850
NoConn ~ 4550 4750
NoConn ~ 4550 4650
NoConn ~ 4550 4550
NoConn ~ 4550 4450
NoConn ~ 4550 4350
Text GLabel 4550 6650 2    50   Input ~ 0
USART3_RX
Text GLabel 4550 6550 2    50   Input ~ 0
USART3_TX
Text GLabel 4550 6250 2    50   Input ~ 0
I2C1_SDA
Text GLabel 4550 6150 2    50   Input ~ 0
I2C1_SCL
Text GLabel 4550 4950 2    50   Input ~ 0
USB_D-
Text GLabel 4550 5050 2    50   Input ~ 0
USB_D+
Text GLabel 4550 5850 2    50   Input ~ 0
SWO
Text GLabel 4550 5250 2    50   Input ~ 0
SWCLK
Text GLabel 4550 5150 2    50   Input ~ 0
SWDIO
Text GLabel 3150 5150 0    50   Input ~ 0
HSE_OUT
Text GLabel 3150 5050 0    50   Input ~ 0
HSE_IN
$Comp
L power:GND #PWR0127
U 1 1 626705A6
P 2400 4600
F 0 "#PWR0127" H 2400 4350 50  0001 C CNN
F 1 "GND" H 2400 4450 50  0000 C CNN
F 2 "" H 2400 4600 50  0001 C CNN
F 3 "" H 2400 4600 50  0001 C CNN
	1    2400 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0128
U 1 1 626700B3
P 2750 4600
F 0 "#PWR0128" H 2750 4350 50  0001 C CNN
F 1 "GND" H 2750 4450 50  0000 C CNN
F 2 "" H 2750 4600 50  0001 C CNN
F 3 "" H 2750 4600 50  0001 C CNN
	1    2750 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 4400 2400 4250
$Comp
L Device:C_Small C7
U 1 1 6266F7BF
P 2400 4500
F 0 "C7" H 2492 4546 50  0000 L CNN
F 1 "2u2" H 2492 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2400 4500 50  0001 C CNN
F 3 "~" H 2400 4500 50  0001 C CNN
	1    2400 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 6266DE57
P 2750 4500
F 0 "C8" H 2842 4546 50  0000 L CNN
F 1 "2u2" H 2842 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2750 4500 50  0001 C CNN
F 3 "~" H 2750 4500 50  0001 C CNN
	1    2750 4500
	1    0    0    -1  
$EndComp
$Comp
L MCU_ST_STM32F4:STM32F405RGTx U3
U 1 1 626619CB
P 3850 5450
F 0 "U3" H 4350 7250 50  0000 C CNN
F 1 "STM32F405RGT6" H 4350 3650 50  0000 C CNN
F 2 "Package_QFP:LQFP-64_10x10mm_P0.5mm" H 3250 3750 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00037051.pdf" H 3850 5450 50  0001 C CNN
	1    3850 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R8
U 1 1 6276CC98
P 5500 6950
F 0 "R8" H 5400 6900 50  0000 C CNN
F 1 "2k2" H 5400 7000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5500 6950 50  0001 C CNN
F 3 "~" H 5500 6950 50  0001 C CNN
	1    5500 6950
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R7
U 1 1 6276F73B
P 5800 6950
F 0 "R7" H 5700 6900 50  0000 C CNN
F 1 "2k2" H 5700 7000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5800 6950 50  0001 C CNN
F 3 "~" H 5800 6950 50  0001 C CNN
	1    5800 6950
	-1   0    0    1   
$EndComp
Text GLabel 5400 7150 0    50   Input ~ 0
I2C1_SCL
Text GLabel 5400 7300 0    50   Input ~ 0
I2C1_SDA
Wire Wire Line
	5400 7150 5500 7150
Wire Wire Line
	5500 7150 5500 7050
Wire Wire Line
	5400 7300 5800 7300
Wire Wire Line
	5800 7300 5800 7050
$Comp
L power:+3.3V #PWR0129
U 1 1 627750CF
P 5500 6850
F 0 "#PWR0129" H 5500 6700 50  0001 C CNN
F 1 "+3.3V" H 5515 7023 50  0000 C CNN
F 2 "" H 5500 6850 50  0001 C CNN
F 3 "" H 5500 6850 50  0001 C CNN
	1    5500 6850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0130
U 1 1 627758F2
P 5800 6850
F 0 "#PWR0130" H 5800 6700 50  0001 C CNN
F 1 "+3.3V" H 5815 7023 50  0000 C CNN
F 2 "" H 5800 6850 50  0001 C CNN
F 3 "" H 5800 6850 50  0001 C CNN
	1    5800 6850
	1    0    0    -1  
$EndComp
Text Notes -5100 6700 0    50   ~ 10
I2C Pull Up Resistors
Text Notes -5100 7300 0    50   ~ 0
I2C spec gives recommended values for pull up resistors.\nFor 3.3V - especially if you're using fast mode, Phil uses 2.2k\n     That's typically a really suitable value\nYou basically pull the data and clk lines high.\nIf you're worried about power consumption, you can use 4.7k or\neven 10k if needed. Make sure whatever you connect to externally\ndoesn't have additional pull up resistors
Wire Wire Line
	7300 4350 7300 4400
Wire Wire Line
	7400 4350 7300 4350
Wire Wire Line
	7300 4050 7400 4050
Wire Wire Line
	7300 4000 7300 4050
Text GLabel 7400 4250 0    50   Input ~ 0
I2C1_SDA
Text GLabel 7400 4150 0    50   Input ~ 0
I2C1_SCL
$Comp
L power:GND #PWR0131
U 1 1 6277C307
P 7300 4400
F 0 "#PWR0131" H 7300 4150 50  0001 C CNN
F 1 "GND" H 7305 4227 50  0000 C CNN
F 2 "" H 7300 4400 50  0001 C CNN
F 3 "" H 7300 4400 50  0001 C CNN
	1    7300 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0132
U 1 1 6277BE17
P 7300 4000
F 0 "#PWR0132" H 7300 3850 50  0001 C CNN
F 1 "+3.3V" H 7315 4173 50  0000 C CNN
F 2 "" H 7300 4000 50  0001 C CNN
F 3 "" H 7300 4000 50  0001 C CNN
	1    7300 4000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 6277AF60
P 7600 4150
F 0 "J2" H 7680 4142 50  0000 L CNN
F 1 "I2C" H 7680 4051 50  0000 L CNN
F 2 "Connector_Molex:Molex_PicoBlade_53048-0410_1x04_P1.25mm_Horizontal" H 7600 4150 50  0001 C CNN
F 3 "~" H 7600 4150 50  0001 C CNN
	1    7600 4150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J4
U 1 1 6278C843
P 9050 4100
F 0 "J4" H 9130 4092 50  0000 L CNN
F 1 "USART" H 9130 4001 50  0000 L CNN
F 2 "Connector_Molex:Molex_PicoBlade_53048-0410_1x04_P1.25mm_Horizontal" H 9050 4100 50  0001 C CNN
F 3 "~" H 9050 4100 50  0001 C CNN
	1    9050 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0133
U 1 1 6278DE2E
P 8750 3950
F 0 "#PWR0133" H 8750 3800 50  0001 C CNN
F 1 "+3.3V" H 8765 4123 50  0000 C CNN
F 2 "" H 8750 3950 50  0001 C CNN
F 3 "" H 8750 3950 50  0001 C CNN
	1    8750 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0134
U 1 1 6278E2B2
P 8750 4350
F 0 "#PWR0134" H 8750 4100 50  0001 C CNN
F 1 "GND" H 8755 4177 50  0000 C CNN
F 2 "" H 8750 4350 50  0001 C CNN
F 3 "" H 8750 4350 50  0001 C CNN
	1    8750 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 4300 8750 4300
Wire Wire Line
	8750 4300 8750 4350
Wire Wire Line
	8750 3950 8750 4000
Wire Wire Line
	8750 4000 8850 4000
Text GLabel 8850 4100 0    50   Input ~ 0
USART3_TX
Text GLabel 8850 4200 0    50   Input ~ 0
USART3_RX
$Comp
L Connector:USB_B_Micro J3
U 1 1 6279FB94
P 7350 5500
F 0 "J3" H 7407 5967 50  0000 C CNN
F 1 "USB_B_Micro" H 7407 5876 50  0000 C CNN
F 2 "Connector_USB:USB_Micro-B_Molex-105017-0001" H 7500 5450 50  0001 C CNN
F 3 "~" H 7500 5450 50  0001 C CNN
	1    7350 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0135
U 1 1 627A0E44
P 7350 5900
F 0 "#PWR0135" H 7350 5650 50  0001 C CNN
F 1 "GND" H 7355 5727 50  0000 C CNN
F 2 "" H 7350 5900 50  0001 C CNN
F 3 "" H 7350 5900 50  0001 C CNN
	1    7350 5900
	1    0    0    -1  
$EndComp
NoConn ~ 7250 5900
$Comp
L Power_Protection:USBLC6-2SC6 U2
U 1 1 627AB1CD
P 10000 5650
F 0 "U2" H 10250 6000 50  0000 C CNN
F 1 "USBLC6-2SC6" H 10350 5300 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 10000 5150 50  0001 C CNN
F 3 "https://www.st.com/resource/en/datasheet/usblc6-2.pdf" H 10200 6000 50  0001 C CNN
	1    10000 5650
	1    0    0    -1  
$EndComp
Text Notes -5100 7450 0    50   ~ 10
Allowing USB OR Screw Terminal Power Input
$Comp
L Device:D_Schottky_Small D1
U 1 1 627B49B3
P 1550 1200
F 0 "D1" V 1750 1050 50  0000 R CNN
F 1 "B5819W" V 1650 1150 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-123" V 1550 1200 50  0001 C CNN
F 3 "~" V 1550 1200 50  0001 C CNN
	1    1550 1200
	0    -1   -1   0   
$EndComp
Text Notes -5100 7800 0    50   ~ 0
Adding the schottky diode allows an OR gate essentially.\nSince USB will be 5V, and the power input is 12V... when 12V\nis present, it biases the diode and will utilize the 12V. When\n12V is gone, the 5V from USB will be used
Wire Wire Line
	1950 1300 2350 1300
Wire Wire Line
	1350 1300 1550 1300
$Comp
L power:+5V #PWR0136
U 1 1 627B7651
P 1550 1100
F 0 "#PWR0136" H 1550 950 50  0001 C CNN
F 1 "+5V" H 1565 1273 50  0000 C CNN
F 2 "" H 1550 1100 50  0001 C CNN
F 3 "" H 1550 1100 50  0001 C CNN
	1    1550 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 5300 7800 5300
Wire Wire Line
	7800 5300 7800 5250
NoConn ~ 7650 5700
Text Notes -5100 7950 0    50   ~ 10
USB
Text Notes -5100 8150 0    50   ~ 0
ID pin is left NC since this is not a host\nShield is left floating - Some people use resistors etc. to gnd. Phil does not and it works
Text GLabel 7700 5500 2    50   Input ~ 0
USB_CONN_D+
Text GLabel 7700 5600 2    50   Input ~ 0
USB_CONN_D-
Text Notes -5100 8300 0    50   ~ 0
USB_CONN_D+/- allows to distinguish between the connector side and uc side
Text GLabel 9600 5750 0    50   Input ~ 0
USB_CONN_D-
Text GLabel 10400 5750 2    50   Input ~ 0
USB_CONN_D+
Text GLabel 9600 5550 0    50   Input ~ 0
USB_D-
Text GLabel 10400 5550 2    50   Input ~ 0
USB_D+
$Comp
L power:+5V #PWR0137
U 1 1 627B7B24
P 7800 5250
F 0 "#PWR0137" H 7800 5100 50  0001 C CNN
F 1 "+5V" H 7815 5423 50  0000 C CNN
F 2 "" H 7800 5250 50  0001 C CNN
F 3 "" H 7800 5250 50  0001 C CNN
	1    7800 5250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0138
U 1 1 627CF923
P 10000 5250
F 0 "#PWR0138" H 10000 5100 50  0001 C CNN
F 1 "+5V" H 10015 5423 50  0000 C CNN
F 2 "" H 10000 5250 50  0001 C CNN
F 3 "" H 10000 5250 50  0001 C CNN
	1    10000 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0139
U 1 1 627CFBBE
P 10000 6050
F 0 "#PWR0139" H 10000 5800 50  0001 C CNN
F 1 "GND" H 10005 5877 50  0000 C CNN
F 2 "" H 10000 6050 50  0001 C CNN
F 3 "" H 10000 6050 50  0001 C CNN
	1    10000 6050
	1    0    0    -1  
$EndComp
Text Notes -5100 8550 0    50   ~ 0
The STM32F405 does all the pull up resistors etc. internally. See the application\nnote "USB hardware and PCB guidelines using STM32 MCUs" for information (AN4879).
Text Notes 6250 2500 0    50   ~ 10
Connectors and USB
$Comp
L power:GND #PWR0140
U 1 1 627F0A24
P 10650 2100
F 0 "#PWR0140" H 10650 1850 50  0001 C CNN
F 1 "GND" H 10800 2100 50  0000 C CNN
F 2 "" H 10650 2100 50  0001 C CNN
F 3 "" H 10650 2100 50  0001 C CNN
	1    10650 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R6
U 1 1 627F0A2A
P 10400 2100
F 0 "R6" V 10500 2050 50  0000 L CNN
F 1 "1k" V 10300 2050 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 10400 2100 50  0001 C CNN
F 3 "~" H 10400 2100 50  0001 C CNN
	1    10400 2100
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_Small D3
U 1 1 627F0A32
P 10050 2100
F 0 "D3" H 10200 2050 50  0000 R CNN
F 1 "RED" H 10250 2150 50  0000 R CNN
F 2 "Diode_SMD:D_0603_1608Metric" V 10050 2100 50  0001 C CNN
F 3 "~" V 10050 2100 50  0001 C CNN
	1    10050 2100
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR0141
U 1 1 627F425A
P 9650 2050
F 0 "#PWR0141" H 9650 1900 50  0001 C CNN
F 1 "+3.3V" H 9650 2200 50  0000 C CNN
F 2 "" H 9650 2050 50  0001 C CNN
F 3 "" H 9650 2050 50  0001 C CNN
	1    9650 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 2050 9650 2100
Wire Wire Line
	9650 2100 9950 2100
Wire Wire Line
	10650 2100 10500 2100
Wire Wire Line
	10300 2100 10150 2100
Text Notes 9950 1900 0    50   ~ 0
Power Indicator
Text Notes 5650 -400 0    59   Italic 12
1:16 mins into video.\nNeed to:\n     - Finish Assigning footprints\n     - PCB Layout\n     - Gerber Files ready for Production (probably won't print this board)
Text Notes -4650 -200 0    118  Italic 24
--- NOTES ---
$Comp
L power:+3.3VA #PWR0107
U 1 1 626A5667
P 5400 2900
F 0 "#PWR0107" H 5400 2750 50  0001 C CNN
F 1 "+3.3VA" H 5415 3073 50  0000 C CNN
F 2 "" H 5400 2900 50  0001 C CNN
F 3 "" H 5400 2900 50  0001 C CNN
	1    5400 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 2950 5400 2950
Connection ~ 5100 2950
Wire Wire Line
	2350 2750 2350 2700
Connection ~ 2350 2750
Wire Wire Line
	8500 2850 8500 2950
Wire Wire Line
	7650 5500 7700 5500
Wire Wire Line
	7650 5600 7700 5600
Wire Wire Line
	4150 3650 4150 3550
Wire Wire Line
	10750 900  10750 850 
Connection ~ 10750 900 
Wire Wire Line
	5400 2950 5400 2900
Connection ~ 5400 2950
Wire Wire Line
	2750 4350 3150 4350
Wire Wire Line
	2750 4350 2750 4400
Wire Wire Line
	4800 850  4800 800 
$Comp
L power:GND #PWR0142
U 1 1 6271CE72
P 1150 1600
F 0 "#PWR0142" H 1150 1350 50  0001 C CNN
F 1 "GND" H 1155 1427 50  0000 C CNN
F 2 "" H 1150 1600 50  0001 C CNN
F 3 "" H 1150 1600 50  0001 C CNN
	1    1150 1600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 6271F206
P 10050 3150
F 0 "H1" V 10004 3300 50  0000 L CNN
F 1 "MountingHole_Pad" V 10095 3300 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4_Pad_Via" H 10050 3150 50  0001 C CNN
F 3 "~" H 10050 3150 50  0001 C CNN
	1    10050 3150
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 62734A6F
P 10050 3400
F 0 "H2" V 10004 3550 50  0000 L CNN
F 1 "MountingHole_Pad" V 10095 3550 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4_Pad_Via" H 10050 3400 50  0001 C CNN
F 3 "~" H 10050 3400 50  0001 C CNN
	1    10050 3400
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 62734D24
P 10050 3650
F 0 "H3" V 10004 3800 50  0000 L CNN
F 1 "MountingHole_Pad" V 10095 3800 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4_Pad_Via" H 10050 3650 50  0001 C CNN
F 3 "~" H 10050 3650 50  0001 C CNN
	1    10050 3650
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 62734EDC
P 10050 3900
F 0 "H4" V 10004 4050 50  0000 L CNN
F 1 "MountingHole_Pad" V 10095 4050 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4_Pad_Via" H 10050 3900 50  0001 C CNN
F 3 "~" H 10050 3900 50  0001 C CNN
	1    10050 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	9950 3150 9950 3400
Wire Wire Line
	9950 3650 9950 3400
Connection ~ 9950 3400
Wire Wire Line
	9950 3900 9950 3650
Connection ~ 9950 3650
Wire Wire Line
	9950 3900 9850 3900
Connection ~ 9950 3900
Wire Wire Line
	9850 4000 9850 3900
$Comp
L power:GND #PWR0143
U 1 1 6274BFB5
P 9850 4000
F 0 "#PWR0143" H 9850 3750 50  0001 C CNN
F 1 "GND" H 9855 3827 50  0000 C CNN
F 2 "" H 9850 4000 50  0001 C CNN
F 3 "" H 9850 4000 50  0001 C CNN
	1    9850 4000
	1    0    0    -1  
$EndComp
$Comp
L Random_Library:MP2359DJ-LF-Z U1
U 1 1 6274100B
P 6900 1250
F 0 "U1" H 6900 1665 50  0000 C CNN
F 1 "MP2359DJ-LF-Z" H 6900 1574 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 6900 1250 50  0001 C CNN
F 3 "" H 6900 1250 50  0001 C CNN
	1    6900 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  1150 800  1300
Wire Wire Line
	1750 1300 1550 1300
Connection ~ 1550 1300
$EndSCHEMATC
