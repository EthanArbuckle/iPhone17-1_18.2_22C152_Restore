@interface AXSSEventManager
- (AXSSActionManager)actionManager;
- (AXSSEventManager)initWithActionManager:(id)a3;
- (AXSSEventManager)initWithActionManager:(id)a3 commandMap:(id)a4;
- (AXSSKeyFilterDelegate)filterDelegate;
- (AXSSKeyboardCommandInfo)_lastDownAndUpCommandInfo;
- (AXSSKeyboardCommandMap)commandMap;
- (BOOL)_handleCommand:(id)a3 event:(id)a4;
- (BOOL)_handleEvent:(id)a3 forCaptureOnly:(BOOL)a4;
- (BOOL)_performDownActionForCommand:(id)a3 info:(id)a4;
- (BOOL)_performedActionWhileTabComboPressed;
- (BOOL)_tabKeyPressed;
- (BOOL)isPassthroughModeEnabled;
- (BOOL)processKeyboardCommand:(id)a3;
- (BOOL)processKeyboardEvent:(id)a3;
- (BOOL)shouldCaptureEvent:(id)a3;
- (BOOL)shouldSuppressCommands;
- (NSDictionary)_commandInfos;
- (double)_lastTabPressTime;
- (double)minimumDelayUntilRepeat;
- (id)_tabbedKeyChordForKeyChord:(id)a3;
- (unint64_t)searchType;
- (void)_handleTabComboEvent:(id)a3;
- (void)_handleTabEvent:(id)a3;
- (void)_handleTabRepeatOrUpWithCommand:(id)a3;
- (void)handleFKAEvent:(id)a3;
- (void)setActionManager:(id)a3;
- (void)setCommandMap:(id)a3;
- (void)setFilterDelegate:(id)a3;
- (void)setMinimumDelayUntilRepeat:(double)a3;
- (void)setPassthroughModeEnabled:(BOOL)a3;
- (void)setSearchType:(unint64_t)a3;
- (void)setShouldSuppressCommands:(BOOL)a3;
- (void)set_lastDownAndUpCommandInfo:(id)a3;
- (void)set_lastTabPressTime:(double)a3;
- (void)set_performedActionWhileTabComboPressed:(BOOL)a3;
- (void)set_tabKeyPressed:(BOOL)a3;
@end

@implementation AXSSEventManager

- (AXSSEventManager)initWithActionManager:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(AXSSEventManager *)self initWithActionManager:v4 commandMap:v5];

  return v6;
}

- (AXSSEventManager)initWithActionManager:(id)a3 commandMap:(id)a4
{
  uint64_t v4 = MEMORY[0x1F4188790](self, a2, a3, a4);
  v6 = v5;
  v8 = v7;
  v9 = (void *)v4;
  v389[71] = *MEMORY[0x1E4F143B8];
  id v156 = v7;
  id v155 = v6;
  v387.receiver = v9;
  v387.super_class = (Class)AXSSEventManager;
  val = [(AXSSEventManager *)&v387 init];
  if (val)
  {
    objc_storeStrong((id *)&val->_actionManager, v8);
    objc_storeStrong((id *)&val->_commandMap, v6);
    objc_initWeak(&v386, val);
    v388[0] = @"GoToNextElement";
    v383[0] = MEMORY[0x1E4F143A8];
    v383[1] = 3221225472;
    v383[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke;
    v383[3] = &unk_1E606DAF0;
    objc_copyWeak(&v385, &v386);
    id v10 = v156;
    id v384 = v10;
    v139 = +[AXSSKeyboardCommandInfo infoWithHandler:v383];
    v389[0] = v139;
    v388[1] = @"GoToPreviousElement";
    v380[0] = MEMORY[0x1E4F143A8];
    v380[1] = 3221225472;
    v380[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_2;
    v380[3] = &unk_1E606DAF0;
    objc_copyWeak(&v382, &v386);
    id v11 = v10;
    id v381 = v11;
    v138 = +[AXSSKeyboardCommandInfo infoWithHandler:v380];
    v389[1] = v138;
    v388[2] = @"EnterContainer";
    v377[0] = MEMORY[0x1E4F143A8];
    v377[1] = 3221225472;
    v377[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_3;
    v377[3] = &unk_1E606DAF0;
    objc_copyWeak(&v379, &v386);
    id v12 = v11;
    id v378 = v12;
    v137 = +[AXSSKeyboardCommandInfo infoWithHandler:v377];
    v389[2] = v137;
    v388[3] = @"ExitContainer";
    v374[0] = MEMORY[0x1E4F143A8];
    v374[1] = 3221225472;
    v374[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_4;
    v374[3] = &unk_1E606DAF0;
    objc_copyWeak(&v376, &v386);
    id v13 = v12;
    id v375 = v13;
    v136 = +[AXSSKeyboardCommandInfo infoWithHandler:v374];
    v389[3] = v136;
    v388[4] = @"GoToNextSection";
    v371[0] = MEMORY[0x1E4F143A8];
    v371[1] = 3221225472;
    v371[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_5;
    v371[3] = &unk_1E606DAF0;
    objc_copyWeak(&v373, &v386);
    id v14 = v13;
    id v372 = v14;
    v135 = +[AXSSKeyboardCommandInfo infoWithHandler:v371];
    v389[4] = v135;
    v388[5] = @"GoToPreviousSection";
    v368[0] = MEMORY[0x1E4F143A8];
    v368[1] = 3221225472;
    v368[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_6;
    v368[3] = &unk_1E606DAF0;
    objc_copyWeak(&v370, &v386);
    id v15 = v14;
    id v369 = v15;
    v154 = +[AXSSKeyboardCommandInfo infoWithHandler:v368];
    v389[5] = v154;
    v388[6] = @"PressAndLift";
    v366[0] = MEMORY[0x1E4F143A8];
    v366[1] = 3221225472;
    v366[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_7;
    v366[3] = &unk_1E606C8C0;
    id v367 = v15;
    v364[0] = MEMORY[0x1E4F143A8];
    v364[1] = 3221225472;
    v364[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_8;
    v364[3] = &unk_1E606C8C0;
    id v16 = v367;
    id v365 = v16;
    v134 = +[AXSSKeyboardCommandInfo infoWithDownHandler:v366 upHandler:v364];
    v389[6] = v134;
    v388[7] = @"ActivateSiri";
    v361[0] = MEMORY[0x1E4F143A8];
    v361[1] = 3221225472;
    v361[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_9;
    v361[3] = &unk_1E606DAF0;
    objc_copyWeak(&v363, &v386);
    id v17 = v16;
    id v362 = v17;
    v133 = +[AXSSKeyboardCommandInfo infoWithHandler:v361];
    v389[7] = v133;
    v388[8] = @"MoveLeft";
    v358[0] = MEMORY[0x1E4F143A8];
    v358[1] = 3221225472;
    v358[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_10;
    v358[3] = &unk_1E606DAF0;
    objc_copyWeak(&v360, &v386);
    id v18 = v17;
    id v359 = v18;
    v132 = +[AXSSKeyboardCommandInfo infoWithHandler:v358];
    v389[8] = v132;
    v388[9] = @"GoToFirstElement";
    v355[0] = MEMORY[0x1E4F143A8];
    v355[1] = 3221225472;
    v355[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_11;
    v355[3] = &unk_1E606DAF0;
    objc_copyWeak(&v357, &v386);
    id v19 = v18;
    id v356 = v19;
    v153 = +[AXSSKeyboardCommandInfo infoWithHandler:v355];
    v389[9] = v153;
    v388[10] = @"SwipeLeft";
    v353[0] = MEMORY[0x1E4F143A8];
    v353[1] = 3221225472;
    v353[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_12;
    v353[3] = &unk_1E606C8C0;
    id v354 = v19;
    v351[0] = MEMORY[0x1E4F143A8];
    v351[1] = 3221225472;
    v351[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_13;
    v351[3] = &unk_1E606C8C0;
    id v20 = v354;
    id v352 = v20;
    v152 = +[AXSSKeyboardCommandInfo infoWithDownHandler:v353 upHandler:v351];
    v389[10] = v152;
    v388[11] = @"TwoFingerSwipeLeft";
    v349[0] = MEMORY[0x1E4F143A8];
    v349[1] = 3221225472;
    v349[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_14;
    v349[3] = &unk_1E606C8C0;
    id v350 = v20;
    v347[0] = MEMORY[0x1E4F143A8];
    v347[1] = 3221225472;
    v347[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_15;
    v347[3] = &unk_1E606C8C0;
    id v21 = v350;
    id v348 = v21;
    v151 = +[AXSSKeyboardCommandInfo infoWithDownHandler:v349 upHandler:v347];
    v389[11] = v151;
    v388[12] = @"RotateLeft";
    v345[0] = MEMORY[0x1E4F143A8];
    v345[1] = 3221225472;
    v345[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_16;
    v345[3] = &unk_1E606C8C0;
    id v346 = v21;
    v343[0] = MEMORY[0x1E4F143A8];
    v343[1] = 3221225472;
    v343[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_17;
    v343[3] = &unk_1E606C8C0;
    id v22 = v346;
    id v344 = v22;
    v131 = +[AXSSKeyboardCommandInfo infoWithDownHandler:v345 upHandler:v343];
    v389[12] = v131;
    v388[13] = @"MoveRight";
    v340[0] = MEMORY[0x1E4F143A8];
    v340[1] = 3221225472;
    v340[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_18;
    v340[3] = &unk_1E606DAF0;
    objc_copyWeak(&v342, &v386);
    id v23 = v22;
    id v341 = v23;
    v130 = +[AXSSKeyboardCommandInfo infoWithHandler:v340];
    v389[13] = v130;
    v388[14] = @"GoToLastElement";
    v337[0] = MEMORY[0x1E4F143A8];
    v337[1] = 3221225472;
    v337[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_19;
    v337[3] = &unk_1E606DAF0;
    objc_copyWeak(&v339, &v386);
    id v24 = v23;
    id v338 = v24;
    v150 = +[AXSSKeyboardCommandInfo infoWithHandler:v337];
    v389[14] = v150;
    v388[15] = @"SwipeRight";
    v335[0] = MEMORY[0x1E4F143A8];
    v335[1] = 3221225472;
    v335[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_20;
    v335[3] = &unk_1E606C8C0;
    id v336 = v24;
    v333[0] = MEMORY[0x1E4F143A8];
    v333[1] = 3221225472;
    v333[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_21;
    v333[3] = &unk_1E606C8C0;
    id v25 = v336;
    id v334 = v25;
    v149 = +[AXSSKeyboardCommandInfo infoWithDownHandler:v335 upHandler:v333];
    v389[15] = v149;
    v388[16] = @"TwoFingerSwipeRight";
    v331[0] = MEMORY[0x1E4F143A8];
    v331[1] = 3221225472;
    v331[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_22;
    v331[3] = &unk_1E606C8C0;
    id v332 = v25;
    v329[0] = MEMORY[0x1E4F143A8];
    v329[1] = 3221225472;
    v329[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_23;
    v329[3] = &unk_1E606C8C0;
    id v26 = v332;
    id v330 = v26;
    v148 = +[AXSSKeyboardCommandInfo infoWithDownHandler:v331 upHandler:v329];
    v389[16] = v148;
    v388[17] = @"RotateRight";
    v327[0] = MEMORY[0x1E4F143A8];
    v327[1] = 3221225472;
    v327[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_24;
    v327[3] = &unk_1E606C8C0;
    id v328 = v26;
    v325[0] = MEMORY[0x1E4F143A8];
    v325[1] = 3221225472;
    v325[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_25;
    v325[3] = &unk_1E606C8C0;
    id v27 = v328;
    id v326 = v27;
    v129 = +[AXSSKeyboardCommandInfo infoWithDownHandler:v327 upHandler:v325];
    v389[17] = v129;
    v388[18] = @"MoveUp";
    v322[0] = MEMORY[0x1E4F143A8];
    v322[1] = 3221225472;
    v322[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_26;
    v322[3] = &unk_1E606DAF0;
    objc_copyWeak(&v324, &v386);
    id v28 = v27;
    id v323 = v28;
    v147 = +[AXSSKeyboardCommandInfo infoWithHandler:v322];
    v389[18] = v147;
    v388[19] = @"SwipeUp";
    v320[0] = MEMORY[0x1E4F143A8];
    v320[1] = 3221225472;
    v320[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_27;
    v320[3] = &unk_1E606C8C0;
    id v321 = v28;
    v318[0] = MEMORY[0x1E4F143A8];
    v318[1] = 3221225472;
    v318[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_28;
    v318[3] = &unk_1E606C8C0;
    id v29 = v321;
    id v319 = v29;
    v146 = +[AXSSKeyboardCommandInfo infoWithDownHandler:v320 upHandler:v318];
    v389[19] = v146;
    v388[20] = @"TwoFingerSwipeUp";
    v316[0] = MEMORY[0x1E4F143A8];
    v316[1] = 3221225472;
    v316[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_29;
    v316[3] = &unk_1E606C8C0;
    id v317 = v29;
    v314[0] = MEMORY[0x1E4F143A8];
    v314[1] = 3221225472;
    v314[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_30;
    v314[3] = &unk_1E606C8C0;
    id v30 = v317;
    id v315 = v30;
    v145 = +[AXSSKeyboardCommandInfo infoWithDownHandler:v316 upHandler:v314];
    v389[20] = v145;
    v388[21] = @"PinchOut";
    v312[0] = MEMORY[0x1E4F143A8];
    v312[1] = 3221225472;
    v312[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_31;
    v312[3] = &unk_1E606C8C0;
    id v313 = v30;
    v310[0] = MEMORY[0x1E4F143A8];
    v310[1] = 3221225472;
    v310[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_32;
    v310[3] = &unk_1E606C8C0;
    id v31 = v313;
    id v311 = v31;
    v128 = +[AXSSKeyboardCommandInfo infoWithDownHandler:v312 upHandler:v310];
    v389[21] = v128;
    v388[22] = @"MoveDown";
    v307[0] = MEMORY[0x1E4F143A8];
    v307[1] = 3221225472;
    v307[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_33;
    v307[3] = &unk_1E606DAF0;
    objc_copyWeak(&v309, &v386);
    id v32 = v31;
    id v308 = v32;
    v127 = +[AXSSKeyboardCommandInfo infoWithHandler:v307];
    v389[22] = v127;
    v388[23] = @"MoveInsideNext";
    v304[0] = MEMORY[0x1E4F143A8];
    v304[1] = 3221225472;
    v304[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_34;
    v304[3] = &unk_1E606DAF0;
    objc_copyWeak(&v306, &v386);
    id v33 = v32;
    id v305 = v33;
    v126 = +[AXSSKeyboardCommandInfo infoWithHandler:v304];
    v389[23] = v126;
    v388[24] = @"MoveInsidePrevious";
    v301[0] = MEMORY[0x1E4F143A8];
    v301[1] = 3221225472;
    v301[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_35;
    v301[3] = &unk_1E606DAF0;
    objc_copyWeak(&v303, &v386);
    id v34 = v33;
    id v302 = v34;
    v144 = +[AXSSKeyboardCommandInfo infoWithHandler:v301];
    v389[24] = v144;
    v388[25] = @"SwipeDown";
    v299[0] = MEMORY[0x1E4F143A8];
    v299[1] = 3221225472;
    v299[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_36;
    v299[3] = &unk_1E606C8C0;
    id v300 = v34;
    v297[0] = MEMORY[0x1E4F143A8];
    v297[1] = 3221225472;
    v297[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_37;
    v297[3] = &unk_1E606C8C0;
    id v35 = v300;
    id v298 = v35;
    v143 = +[AXSSKeyboardCommandInfo infoWithDownHandler:v299 upHandler:v297];
    v389[25] = v143;
    v388[26] = @"TwoFingerSwipeDown";
    v295[0] = MEMORY[0x1E4F143A8];
    v295[1] = 3221225472;
    v295[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_38;
    v295[3] = &unk_1E606C8C0;
    id v296 = v35;
    v293[0] = MEMORY[0x1E4F143A8];
    v293[1] = 3221225472;
    v293[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_39;
    v293[3] = &unk_1E606C8C0;
    id v36 = v296;
    id v294 = v36;
    v142 = +[AXSSKeyboardCommandInfo infoWithDownHandler:v295 upHandler:v293];
    v389[26] = v142;
    v388[27] = @"PinchIn";
    v291[0] = MEMORY[0x1E4F143A8];
    v291[1] = 3221225472;
    v291[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_40;
    v291[3] = &unk_1E606C8C0;
    id v292 = v36;
    v289[0] = MEMORY[0x1E4F143A8];
    v289[1] = 3221225472;
    v289[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_41;
    v289[3] = &unk_1E606C8C0;
    id v37 = v292;
    id v290 = v37;
    v141 = +[AXSSKeyboardCommandInfo infoWithDownHandler:v291 upHandler:v289];
    v389[27] = v141;
    v388[28] = @"TwoFingerPressAndLift";
    v287[0] = MEMORY[0x1E4F143A8];
    v287[1] = 3221225472;
    v287[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_42;
    v287[3] = &unk_1E606C8C0;
    id v288 = v37;
    v285[0] = MEMORY[0x1E4F143A8];
    v285[1] = 3221225472;
    v285[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_43;
    v285[3] = &unk_1E606C8C0;
    id v38 = v288;
    id v286 = v38;
    v125 = +[AXSSKeyboardCommandInfo infoWithDownHandler:v287 upHandler:v285];
    v389[28] = v125;
    v388[29] = @"PerformDefaultAction";
    v282[0] = MEMORY[0x1E4F143A8];
    v282[1] = 3221225472;
    v282[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_44;
    v282[3] = &unk_1E606DAF0;
    objc_copyWeak(&v284, &v386);
    id v39 = v38;
    id v283 = v39;
    v124 = +[AXSSKeyboardCommandInfo infoWithHandler:v282];
    v389[29] = v124;
    v388[30] = @"GoHome";
    v279[0] = MEMORY[0x1E4F143A8];
    v279[1] = 3221225472;
    v279[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_45;
    v279[3] = &unk_1E606DAF0;
    objc_copyWeak(&v281, &v386);
    id v40 = v39;
    id v280 = v40;
    v123 = +[AXSSKeyboardCommandInfo infoWithHandler:v279];
    v389[30] = v123;
    v388[31] = @"OpenContextualMenu";
    v276[0] = MEMORY[0x1E4F143A8];
    v276[1] = 3221225472;
    v276[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_46;
    v276[3] = &unk_1E606DAF0;
    objc_copyWeak(&v278, &v386);
    id v41 = v40;
    id v277 = v41;
    v122 = +[AXSSKeyboardCommandInfo infoWithHandler:v276];
    v389[31] = v122;
    v388[32] = @"ShowAccessibilityActions";
    v273[0] = MEMORY[0x1E4F143A8];
    v273[1] = 3221225472;
    v273[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_47;
    v273[3] = &unk_1E606DAF0;
    objc_copyWeak(&v275, &v386);
    id v42 = v41;
    id v274 = v42;
    v121 = +[AXSSKeyboardCommandInfo infoWithHandler:v273];
    v389[32] = v121;
    v388[33] = @"ToggleAppSwitcher";
    v270[0] = MEMORY[0x1E4F143A8];
    v270[1] = 3221225472;
    v270[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_48;
    v270[3] = &unk_1E606DAF0;
    objc_copyWeak(&v272, &v386);
    id v43 = v42;
    id v271 = v43;
    v120 = +[AXSSKeyboardCommandInfo infoWithHandler:v270];
    v389[33] = v120;
    v388[34] = @"ToggleAppLibrary";
    v267[0] = MEMORY[0x1E4F143A8];
    v267[1] = 3221225472;
    v267[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_49;
    v267[3] = &unk_1E606DAF0;
    objc_copyWeak(&v269, &v386);
    id v44 = v43;
    id v268 = v44;
    v119 = +[AXSSKeyboardCommandInfo infoWithHandler:v267];
    v389[34] = v119;
    v388[35] = @"ToggleQuickNote";
    v264[0] = MEMORY[0x1E4F143A8];
    v264[1] = 3221225472;
    v264[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_50;
    v264[3] = &unk_1E606DAF0;
    objc_copyWeak(&v266, &v386);
    id v45 = v44;
    id v265 = v45;
    v118 = +[AXSSKeyboardCommandInfo infoWithHandler:v264];
    v389[35] = v118;
    v388[36] = @"ActivateAccessibilityShortcut";
    v261[0] = MEMORY[0x1E4F143A8];
    v261[1] = 3221225472;
    v261[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_51;
    v261[3] = &unk_1E606DAF0;
    objc_copyWeak(&v263, &v386);
    id v46 = v45;
    id v262 = v46;
    v117 = +[AXSSKeyboardCommandInfo infoWithHandler:v261];
    v389[36] = v117;
    v388[37] = @"ToggleControlCenter";
    v258[0] = MEMORY[0x1E4F143A8];
    v258[1] = 3221225472;
    v258[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_52;
    v258[3] = &unk_1E606DAF0;
    objc_copyWeak(&v260, &v386);
    id v47 = v46;
    id v259 = v47;
    v116 = +[AXSSKeyboardCommandInfo infoWithHandler:v258];
    v389[37] = v116;
    v388[38] = @"ToggleDock";
    v255[0] = MEMORY[0x1E4F143A8];
    v255[1] = 3221225472;
    v255[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_53;
    v255[3] = &unk_1E606DAF0;
    objc_copyWeak(&v257, &v386);
    id v48 = v47;
    id v256 = v48;
    v115 = +[AXSSKeyboardCommandInfo infoWithHandler:v255];
    v389[38] = v115;
    v388[39] = @"PerformEscape";
    v252[0] = MEMORY[0x1E4F143A8];
    v252[1] = 3221225472;
    v252[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_54;
    v252[3] = &unk_1E606DAF0;
    objc_copyWeak(&v254, &v386);
    id v49 = v48;
    id v253 = v49;
    v114 = +[AXSSKeyboardCommandInfo infoWithHandler:v252];
    v389[39] = v114;
    v388[40] = @"PerformSysdiagnose";
    v249[0] = MEMORY[0x1E4F143A8];
    v249[1] = 3221225472;
    v249[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_55;
    v249[3] = &unk_1E606DAF0;
    objc_copyWeak(&v251, &v386);
    id v50 = v49;
    id v250 = v50;
    v113 = +[AXSSKeyboardCommandInfo infoWithHandler:v249];
    v389[40] = v113;
    v388[41] = @"LockScreen";
    v246[0] = MEMORY[0x1E4F143A8];
    v246[1] = 3221225472;
    v246[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_56;
    v246[3] = &unk_1E606DAF0;
    objc_copyWeak(&v248, &v386);
    id v51 = v50;
    id v247 = v51;
    v112 = +[AXSSKeyboardCommandInfo infoWithHandler:v246];
    v389[41] = v112;
    v388[42] = @"ToggleNotificationCenter";
    v243[0] = MEMORY[0x1E4F143A8];
    v243[1] = 3221225472;
    v243[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_57;
    v243[3] = &unk_1E606DAF0;
    objc_copyWeak(&v245, &v386);
    id v52 = v51;
    id v244 = v52;
    v111 = +[AXSSKeyboardCommandInfo infoWithHandler:v243];
    v389[42] = v111;
    v388[43] = @"ArmApplePay";
    v240[0] = MEMORY[0x1E4F143A8];
    v240[1] = 3221225472;
    v240[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_58;
    v240[3] = &unk_1E606DAF0;
    objc_copyWeak(&v242, &v386);
    id v53 = v52;
    id v241 = v53;
    v110 = +[AXSSKeyboardCommandInfo infoWithHandler:v240];
    v389[43] = v110;
    v388[44] = @"RotateDevice";
    v237[0] = MEMORY[0x1E4F143A8];
    v237[1] = 3221225472;
    v237[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_59;
    v237[3] = &unk_1E606DAF0;
    objc_copyWeak(&v239, &v386);
    id v54 = v53;
    id v238 = v54;
    v109 = +[AXSSKeyboardCommandInfo infoWithHandler:v237];
    v389[44] = v109;
    v388[45] = @"RebootDevice";
    v234[0] = MEMORY[0x1E4F143A8];
    v234[1] = 3221225472;
    v234[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_60;
    v234[3] = &unk_1E606DAF0;
    objc_copyWeak(&v236, &v386);
    id v55 = v54;
    id v235 = v55;
    v108 = +[AXSSKeyboardCommandInfo infoWithHandler:v234];
    v389[45] = v108;
    v388[46] = @"ToggleMenuBar";
    v231[0] = MEMORY[0x1E4F143A8];
    v231[1] = 3221225472;
    v231[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_61;
    v231[3] = &unk_1E606DAF0;
    objc_copyWeak(&v233, &v386);
    id v56 = v55;
    id v232 = v56;
    v107 = +[AXSSKeyboardCommandInfo infoWithHandler:v231];
    v389[46] = v107;
    v388[47] = @"ActivateSOS";
    v228[0] = MEMORY[0x1E4F143A8];
    v228[1] = 3221225472;
    v228[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_62;
    v228[3] = &unk_1E606DAF0;
    objc_copyWeak(&v230, &v386);
    id v57 = v56;
    id v229 = v57;
    v106 = +[AXSSKeyboardCommandInfo infoWithHandler:v228];
    v389[47] = v106;
    v388[48] = @"ActivateTypeahead";
    v225[0] = MEMORY[0x1E4F143A8];
    v225[1] = 3221225472;
    v225[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_63;
    v225[3] = &unk_1E606DAF0;
    objc_copyWeak(&v227, &v386);
    id v58 = v57;
    id v226 = v58;
    v105 = +[AXSSKeyboardCommandInfo infoWithHandler:v225];
    v389[48] = v105;
    v388[49] = @"TogglePassthroughMode";
    v222[0] = MEMORY[0x1E4F143A8];
    v222[1] = 3221225472;
    v222[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_64;
    v222[3] = &unk_1E606DAF0;
    objc_copyWeak(&v224, &v386);
    id v59 = v58;
    id v223 = v59;
    v104 = +[AXSSKeyboardCommandInfo infoWithHandler:v222];
    v389[49] = v104;
    v388[50] = @"Gestures";
    v219[0] = MEMORY[0x1E4F143A8];
    v219[1] = 3221225472;
    v219[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_65;
    v219[3] = &unk_1E606DAF0;
    objc_copyWeak(&v221, &v386);
    id v60 = v59;
    id v220 = v60;
    v103 = +[AXSSKeyboardCommandInfo infoWithHandler:v219];
    v389[50] = v103;
    v388[51] = @"Help";
    v216[0] = MEMORY[0x1E4F143A8];
    v216[1] = 3221225472;
    v216[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_66;
    v216[3] = &unk_1E606DAF0;
    objc_copyWeak(&v218, &v386);
    id v61 = v60;
    id v217 = v61;
    v140 = +[AXSSKeyboardCommandInfo infoWithHandler:v216];
    v389[51] = v140;
    v388[52] = @"3DTouch";
    v214[0] = MEMORY[0x1E4F143A8];
    v214[1] = 3221225472;
    v214[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_67;
    v214[3] = &unk_1E606C8C0;
    id v215 = v61;
    v212[0] = MEMORY[0x1E4F143A8];
    v212[1] = 3221225472;
    v212[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_68;
    v212[3] = &unk_1E606C8C0;
    id v62 = v215;
    id v213 = v62;
    v102 = +[AXSSKeyboardCommandInfo infoWithDownHandler:v214 upHandler:v212];
    v389[52] = v102;
    v388[53] = @"MovePointerToFocus";
    v209[0] = MEMORY[0x1E4F143A8];
    v209[1] = 3221225472;
    v209[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_69;
    v209[3] = &unk_1E606DAF0;
    objc_copyWeak(&v211, &v386);
    id v63 = v62;
    id v210 = v63;
    v101 = +[AXSSKeyboardCommandInfo infoWithHandler:v209];
    v389[53] = v101;
    v388[54] = @"WindowList";
    v206[0] = MEMORY[0x1E4F143A8];
    v206[1] = 3221225472;
    v206[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_70;
    v206[3] = &unk_1E606DAF0;
    objc_copyWeak(&v208, &v386);
    id v64 = v63;
    id v207 = v64;
    v100 = +[AXSSKeyboardCommandInfo infoWithHandler:v206];
    v389[54] = v100;
    v388[55] = @"ApplicationList";
    v203[0] = MEMORY[0x1E4F143A8];
    v203[1] = 3221225472;
    v203[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_71;
    v203[3] = &unk_1E606DAF0;
    objc_copyWeak(&v205, &v386);
    id v65 = v64;
    id v204 = v65;
    v99 = +[AXSSKeyboardCommandInfo infoWithHandler:v203];
    v389[55] = v99;
    v388[56] = @"NextButton";
    v200[0] = MEMORY[0x1E4F143A8];
    v200[1] = 3221225472;
    v200[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_72;
    v200[3] = &unk_1E606DAF0;
    objc_copyWeak(&v202, &v386);
    id v66 = v65;
    id v201 = v66;
    v98 = +[AXSSKeyboardCommandInfo infoWithHandler:v200];
    v389[56] = v98;
    v388[57] = @"PreviousButton";
    v197[0] = MEMORY[0x1E4F143A8];
    v197[1] = 3221225472;
    v197[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_73;
    v197[3] = &unk_1E606DAF0;
    objc_copyWeak(&v199, &v386);
    id v67 = v66;
    id v198 = v67;
    v97 = +[AXSSKeyboardCommandInfo infoWithHandler:v197];
    v389[57] = v97;
    v388[58] = @"NextCheckbox";
    v194[0] = MEMORY[0x1E4F143A8];
    v194[1] = 3221225472;
    v194[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_74;
    v194[3] = &unk_1E606DAF0;
    objc_copyWeak(&v196, &v386);
    id v68 = v67;
    id v195 = v68;
    v96 = +[AXSSKeyboardCommandInfo infoWithHandler:v194];
    v389[58] = v96;
    v388[59] = @"PreviousCheckbox";
    v191[0] = MEMORY[0x1E4F143A8];
    v191[1] = 3221225472;
    v191[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_75;
    v191[3] = &unk_1E606DAF0;
    objc_copyWeak(&v193, &v386);
    id v69 = v68;
    id v192 = v69;
    v95 = +[AXSSKeyboardCommandInfo infoWithHandler:v191];
    v389[59] = v95;
    v388[60] = @"NextTable";
    v188[0] = MEMORY[0x1E4F143A8];
    v188[1] = 3221225472;
    v188[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_76;
    v188[3] = &unk_1E606DAF0;
    objc_copyWeak(&v190, &v386);
    id v70 = v69;
    id v189 = v70;
    v94 = +[AXSSKeyboardCommandInfo infoWithHandler:v188];
    v389[60] = v94;
    v388[61] = @"PreviousTable";
    v185[0] = MEMORY[0x1E4F143A8];
    v185[1] = 3221225472;
    v185[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_77;
    v185[3] = &unk_1E606DAF0;
    objc_copyWeak(&v187, &v386);
    id v71 = v70;
    id v186 = v71;
    v93 = +[AXSSKeyboardCommandInfo infoWithHandler:v185];
    v389[61] = v93;
    v388[62] = @"NextImage";
    v182[0] = MEMORY[0x1E4F143A8];
    v182[1] = 3221225472;
    v182[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_78;
    v182[3] = &unk_1E606DAF0;
    objc_copyWeak(&v184, &v386);
    id v72 = v71;
    id v183 = v72;
    v92 = +[AXSSKeyboardCommandInfo infoWithHandler:v182];
    v389[62] = v92;
    v388[63] = @"PreviousImage";
    v179[0] = MEMORY[0x1E4F143A8];
    v179[1] = 3221225472;
    v179[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_79;
    v179[3] = &unk_1E606DAF0;
    objc_copyWeak(&v181, &v386);
    id v73 = v72;
    id v180 = v73;
    v91 = +[AXSSKeyboardCommandInfo infoWithHandler:v179];
    v389[63] = v91;
    v388[64] = @"NextLink";
    v176[0] = MEMORY[0x1E4F143A8];
    v176[1] = 3221225472;
    v176[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_80;
    v176[3] = &unk_1E606DAF0;
    objc_copyWeak(&v178, &v386);
    id v74 = v73;
    id v177 = v74;
    v75 = +[AXSSKeyboardCommandInfo infoWithHandler:v176];
    v389[64] = v75;
    v388[65] = @"PreviousLink";
    v173[0] = MEMORY[0x1E4F143A8];
    v173[1] = 3221225472;
    v173[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_81;
    v173[3] = &unk_1E606DAF0;
    objc_copyWeak(&v175, &v386);
    id v76 = v74;
    id v174 = v76;
    v77 = +[AXSSKeyboardCommandInfo infoWithHandler:v173];
    v389[65] = v77;
    v388[66] = @"NextHeading";
    v170[0] = MEMORY[0x1E4F143A8];
    v170[1] = 3221225472;
    v170[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_82;
    v170[3] = &unk_1E606DAF0;
    objc_copyWeak(&v172, &v386);
    id v78 = v76;
    id v171 = v78;
    v79 = +[AXSSKeyboardCommandInfo infoWithHandler:v170];
    v389[66] = v79;
    v388[67] = @"PreviousHeading";
    v167[0] = MEMORY[0x1E4F143A8];
    v167[1] = 3221225472;
    v167[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_83;
    v167[3] = &unk_1E606DAF0;
    objc_copyWeak(&v169, &v386);
    id v80 = v78;
    id v168 = v80;
    v81 = +[AXSSKeyboardCommandInfo infoWithHandler:v167];
    v389[67] = v81;
    v388[68] = @"NextTextField";
    v164[0] = MEMORY[0x1E4F143A8];
    v164[1] = 3221225472;
    v164[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_84;
    v164[3] = &unk_1E606DAF0;
    objc_copyWeak(&v166, &v386);
    id v82 = v80;
    id v165 = v82;
    v83 = +[AXSSKeyboardCommandInfo infoWithHandler:v164];
    v389[68] = v83;
    v388[69] = @"PreviousTextField";
    v161[0] = MEMORY[0x1E4F143A8];
    v161[1] = 3221225472;
    v161[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_85;
    v161[3] = &unk_1E606DAF0;
    objc_copyWeak(&v163, &v386);
    id v84 = v82;
    id v162 = v84;
    v85 = +[AXSSKeyboardCommandInfo infoWithHandler:v161];
    v389[69] = v85;
    v388[70] = @"Escape";
    v158[0] = MEMORY[0x1E4F143A8];
    v158[1] = 3221225472;
    v158[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_86;
    v158[3] = &unk_1E606DAF0;
    objc_copyWeak(&v160, &v386);
    id v159 = v84;
    v86 = +[AXSSKeyboardCommandInfo infoWithHandler:v158];
    v389[70] = v86;
    uint64_t v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v389 forKeys:v388 count:71];
    commandInfos = val->__commandInfos;
    val->__commandInfos = (NSDictionary *)v87;

    _AXSKeyRepeatDelay();
    val->_minimumDelayUntilRepeat = v89;

    objc_destroyWeak(&v160);
    objc_destroyWeak(&v163);

    objc_destroyWeak(&v166);
    objc_destroyWeak(&v169);

    objc_destroyWeak(&v172);
    objc_destroyWeak(&v175);

    objc_destroyWeak(&v178);
    objc_destroyWeak(&v181);

    objc_destroyWeak(&v184);
    objc_destroyWeak(&v187);

    objc_destroyWeak(&v190);
    objc_destroyWeak(&v193);

    objc_destroyWeak(&v196);
    objc_destroyWeak(&v199);

    objc_destroyWeak(&v202);
    objc_destroyWeak(&v205);

    objc_destroyWeak(&v208);
    objc_destroyWeak(&v211);

    objc_destroyWeak(&v218);
    objc_destroyWeak(&v221);

    objc_destroyWeak(&v224);
    objc_destroyWeak(&v227);

    objc_destroyWeak(&v230);
    objc_destroyWeak(&v233);

    objc_destroyWeak(&v236);
    objc_destroyWeak(&v239);

    objc_destroyWeak(&v242);
    objc_destroyWeak(&v245);

    objc_destroyWeak(&v248);
    objc_destroyWeak(&v251);

    objc_destroyWeak(&v254);
    objc_destroyWeak(&v257);

    objc_destroyWeak(&v260);
    objc_destroyWeak(&v263);

    objc_destroyWeak(&v266);
    objc_destroyWeak(&v269);

    objc_destroyWeak(&v272);
    objc_destroyWeak(&v275);

    objc_destroyWeak(&v278);
    objc_destroyWeak(&v281);

    objc_destroyWeak(&v284);
    objc_destroyWeak(&v303);

    objc_destroyWeak(&v306);
    objc_destroyWeak(&v309);

    objc_destroyWeak(&v324);
    objc_destroyWeak(&v339);

    objc_destroyWeak(&v342);
    objc_destroyWeak(&v357);

    objc_destroyWeak(&v360);
    objc_destroyWeak(&v363);

    objc_destroyWeak(&v370);
    objc_destroyWeak(&v373);

    objc_destroyWeak(&v376);
    objc_destroyWeak(&v379);

    objc_destroyWeak(&v382);
    objc_destroyWeak(&v385);
    objc_destroyWeak(&v386);
  }

  return val;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"GoToNextElement"];
  objc_msgSend(*(id *)(a1 + 32), "goToNextElementOfType:", objc_msgSend(WeakRetained, "searchType"));
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"GoToNextElement"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"GoToPreviousElement"];
  objc_msgSend(*(id *)(a1 + 32), "goToPreviousElementOfType:", objc_msgSend(WeakRetained, "searchType"));
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"GoToPreviousElement"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"EnterContainer"];
  [*(id *)(a1 + 32) enterContainer];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"EnterContainer"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"ExitContainer"];
  [*(id *)(a1 + 32) exitContainer];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"ExitContainer"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"GoToNextSection"];
  [*(id *)(a1 + 32) goToNextSection];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"GoToNextSection"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"GoToPreviousSection"];
  [*(id *)(a1 + 32) goToPreviousSection];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"GoToPreviousSection"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"PressAndLift"];
  v2 = *(void **)(a1 + 32);

  return [v2 press];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) lift];
  v2 = *(void **)(a1 + 32);

  return [v2 didPerformStandardCommandWithIdentifier:@"PressAndLift"];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"ActivateSiri"];
  [*(id *)(a1 + 32) activateSiri];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"ActivateSiri"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"MoveLeft"];
  [*(id *)(a1 + 32) moveLeft];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"MoveLeft"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"GoToFirstElement"];
  [*(id *)(a1 + 32) goToFirstElement];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"GoToFirstElement"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_12(uint64_t a1)
{
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"SwipeLeft"];
  v2 = *(void **)(a1 + 32);

  return [v2 beginSwipeLeft];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_13(uint64_t a1)
{
  [*(id *)(a1 + 32) endSwipe];
  v2 = *(void **)(a1 + 32);

  return [v2 didPerformStandardCommandWithIdentifier:@"SwipeLeft"];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_14(uint64_t a1)
{
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"TwoFingerSwipeLeft"];
  v2 = *(void **)(a1 + 32);

  return [v2 beginTwoFingerSwipeLeft];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_15(uint64_t a1)
{
  [*(id *)(a1 + 32) endSwipe];
  v2 = *(void **)(a1 + 32);

  return [v2 didPerformStandardCommandWithIdentifier:@"TwoFingerSwipeLeft"];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_16(uint64_t a1)
{
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"RotateLeft"];
  v2 = *(void **)(a1 + 32);

  return [v2 beginRotateLeft];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_17(uint64_t a1)
{
  [*(id *)(a1 + 32) endRotate];
  v2 = *(void **)(a1 + 32);

  return [v2 didPerformStandardCommandWithIdentifier:@"RotateLeft"];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"MoveRight"];
  [*(id *)(a1 + 32) moveRight];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"MoveRight"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_19(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"GoToLastElement"];
  [*(id *)(a1 + 32) goToLastElement];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"GoToLastElement"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_20(uint64_t a1)
{
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"SwipeRight"];
  v2 = *(void **)(a1 + 32);

  return [v2 beginSwipeRight];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_21(uint64_t a1)
{
  [*(id *)(a1 + 32) endSwipe];
  v2 = *(void **)(a1 + 32);

  return [v2 didPerformStandardCommandWithIdentifier:@"SwipeRight"];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_22(uint64_t a1)
{
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"TwoFingerSwipeRight"];
  v2 = *(void **)(a1 + 32);

  return [v2 beginTwoFingerSwipeRight];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_23(uint64_t a1)
{
  [*(id *)(a1 + 32) endSwipe];
  v2 = *(void **)(a1 + 32);

  return [v2 didPerformStandardCommandWithIdentifier:@"TwoFingerSwipeRight"];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_24(uint64_t a1)
{
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"RotateRight"];
  v2 = *(void **)(a1 + 32);

  return [v2 beginRotateRight];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_25(uint64_t a1)
{
  [*(id *)(a1 + 32) endRotate];
  v2 = *(void **)(a1 + 32);

  return [v2 didPerformStandardCommandWithIdentifier:@"RotateRight"];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_26(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"MoveUp"];
  [*(id *)(a1 + 32) moveUp];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"MoveUp"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_27(uint64_t a1)
{
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"SwipeUp"];
  v2 = *(void **)(a1 + 32);

  return [v2 beginSwipeUp];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_28(uint64_t a1)
{
  [*(id *)(a1 + 32) endSwipe];
  v2 = *(void **)(a1 + 32);

  return [v2 didPerformStandardCommandWithIdentifier:@"SwipeUp"];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_29(uint64_t a1)
{
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"TwoFingerSwipeUp"];
  v2 = *(void **)(a1 + 32);

  return [v2 beginTwoFingerSwipeUp];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_30(uint64_t a1)
{
  [*(id *)(a1 + 32) endSwipe];
  v2 = *(void **)(a1 + 32);

  return [v2 didPerformStandardCommandWithIdentifier:@"TwoFingerSwipeUp"];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_31(uint64_t a1)
{
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"PinchOut"];
  v2 = *(void **)(a1 + 32);

  return [v2 beginPinchOut];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_32(uint64_t a1)
{
  [*(id *)(a1 + 32) endPinch];
  v2 = *(void **)(a1 + 32);

  return [v2 didPerformStandardCommandWithIdentifier:@"PinchOut"];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_33(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"MoveDown"];
  [*(id *)(a1 + 32) moveDown];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"MoveDown"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"MoveInsideNext"];
  [*(id *)(a1 + 32) moveInsideNext];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"MoveInsideNext"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_35(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"MoveInsidePrevious"];
  [*(id *)(a1 + 32) moveInsidePrevious];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"MoveInsidePrevious"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_36(uint64_t a1)
{
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"SwipeDown"];
  v2 = *(void **)(a1 + 32);

  return [v2 beginSwipeDown];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_37(uint64_t a1)
{
  [*(id *)(a1 + 32) endSwipe];
  v2 = *(void **)(a1 + 32);

  return [v2 didPerformStandardCommandWithIdentifier:@"SwipeDown"];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_38(uint64_t a1)
{
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"TwoFingerSwipeDown"];
  v2 = *(void **)(a1 + 32);

  return [v2 beginTwoFingerSwipeDown];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_39(uint64_t a1)
{
  [*(id *)(a1 + 32) endSwipe];
  v2 = *(void **)(a1 + 32);

  return [v2 didPerformStandardCommandWithIdentifier:@"TwoFingerSwipeDown"];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_40(uint64_t a1)
{
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"PinchIn"];
  v2 = *(void **)(a1 + 32);

  return [v2 beginPinchIn];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_41(uint64_t a1)
{
  [*(id *)(a1 + 32) endPinch];
  v2 = *(void **)(a1 + 32);

  return [v2 didPerformStandardCommandWithIdentifier:@"PinchIn"];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_42(uint64_t a1)
{
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"TwoFingerPressAndLift"];
  v2 = *(void **)(a1 + 32);

  return [v2 twoFingerPress];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_43(uint64_t a1)
{
  [*(id *)(a1 + 32) twoFingerLift];
  v2 = *(void **)(a1 + 32);

  return [v2 didPerformStandardCommandWithIdentifier:@"TwoFingerPressAndLift"];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"PerformDefaultAction"];
  [*(id *)(a1 + 32) performDefaultAction];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"PerformDefaultAction"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_45(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"GoHome"];
  [*(id *)(a1 + 32) goHome];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"GoHome"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_46(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"OpenContextualMenu"];
  [*(id *)(a1 + 32) openContextualMenu];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"OpenContextualMenu"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_47(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"ShowAccessibilityActions"];
  [*(id *)(a1 + 32) showAccessibilityActions];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"ShowAccessibilityActions"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_48(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"ToggleAppSwitcher"];
  [*(id *)(a1 + 32) toggleAppSwitcher];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"ToggleAppSwitcher"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_49(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"ToggleAppLibrary"];
  [*(id *)(a1 + 32) toggleAppLibrary];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"ToggleAppLibrary"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_50(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"ToggleQuickNote"];
  [*(id *)(a1 + 32) toggleQuickNote];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"ToggleQuickNote"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_51(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"ActivateAccessibilityShortcut"];
  [*(id *)(a1 + 32) activateAccessibilityShortcut];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"ActivateAccessibilityShortcut"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_52(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"ToggleControlCenter"];
  [*(id *)(a1 + 32) toggleControlCenter];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"ToggleControlCenter"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_53(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"ToggleDock"];
  [*(id *)(a1 + 32) toggleDock];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"ToggleDock"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"PerformEscape"];
  [*(id *)(a1 + 32) performEscape];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"PerformEscape"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_55(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"PerformSysdiagnose"];
  [*(id *)(a1 + 32) performSysdiagnose];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"PerformSysdiagnose"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_56(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"LockScreen"];
  [*(id *)(a1 + 32) lockScreen];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"LockScreen"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_57(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"ToggleNotificationCenter"];
  [*(id *)(a1 + 32) toggleNotificationCenter];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"ToggleNotificationCenter"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_58(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"ArmApplePay"];
  [*(id *)(a1 + 32) armApplePay];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"ArmApplePay"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_59(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"RotateDevice"];
  [*(id *)(a1 + 32) rotateDevice];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"RotateDevice"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_60(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"RebootDevice"];
  [*(id *)(a1 + 32) rebootDevice];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"RebootDevice"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_61(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"ToggleMenuBar"];
  [*(id *)(a1 + 32) toggleMenuBar];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"ToggleMenuBar"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_62(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"ActivateSOS"];
  [*(id *)(a1 + 32) activateSOS];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"ActivateSOS"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_63(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"ActivateTypeahead"];
  [*(id *)(a1 + 32) activateTypeahead];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"ActivateTypeahead"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_64(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"TogglePassthroughMode"];
  [*(id *)(a1 + 32) togglePassthroughMode];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"TogglePassthroughMode"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_65(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"Gestures"];
  [*(id *)(a1 + 32) toggleGesturesMode];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"Gestures"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_66(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"Help"];
  [*(id *)(a1 + 32) toggleHelp];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"Help"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_67(uint64_t a1)
{
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"3DTouch"];
  v2 = *(void **)(a1 + 32);

  return [v2 begin3DTouch];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_68(uint64_t a1)
{
  [*(id *)(a1 + 32) end3DTouch];
  v2 = *(void **)(a1 + 32);

  return [v2 didPerformStandardCommandWithIdentifier:@"3DTouch"];
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_69(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"MovePointerToFocus"];
  [*(id *)(a1 + 32) movePointerToFocus];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"MovePointerToFocus"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"WindowList"];
  [*(id *)(a1 + 32) toggleWindowList];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"WindowList"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_71(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"ApplicationList"];
  [*(id *)(a1 + 32) toggleApplicationList];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"ApplicationList"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_72(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"NextButton"];
  [*(id *)(a1 + 32) nextButton];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"NextButton"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_73(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"PreviousButton"];
  [*(id *)(a1 + 32) previousButton];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"PreviousButton"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_74(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"NextCheckbox"];
  [*(id *)(a1 + 32) nextCheckbox];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"NextCheckbox"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_75(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"PreviousCheckbox"];
  [*(id *)(a1 + 32) previousCheckbox];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"PreviousCheckbox"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_76(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"NextTable"];
  [*(id *)(a1 + 32) nextTable];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"NextTable"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_77(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"PreviousTable"];
  [*(id *)(a1 + 32) previousTable];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"PreviousTable"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"NextImage"];
  [*(id *)(a1 + 32) nextImage];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"NextImage"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_79(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"PreviousImage"];
  [*(id *)(a1 + 32) previousImage];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"PreviousImage"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"NextLink"];
  [*(id *)(a1 + 32) nextLink];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"NextLink"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_81(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"PreviousLink"];
  [*(id *)(a1 + 32) previousLink];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"PreviousLink"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_82(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"NextHeading"];
  [*(id *)(a1 + 32) nextHeading];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"NextHeading"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_83(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"PreviousHeading"];
  [*(id *)(a1 + 32) previousHeading];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"PreviousHeading"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_84(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"NextTextField"];
  [*(id *)(a1 + 32) nextTextField];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"NextTextField"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_85(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"PreviousTextField"];
  [*(id *)(a1 + 32) previousTextField];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"PreviousTextField"];

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_86(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) willPerformStandardCommandWithIdentifier:@"Escape"];
  uint64_t v3 = [*(id *)(a1 + 32) handleEscapeKey];
  [*(id *)(a1 + 32) didPerformStandardCommandWithIdentifier:@"Escape"];

  return v3;
}

- (BOOL)processKeyboardEvent:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AXSSEventManager *)self shouldCaptureEvent:v4];
  if (v5) {
    [(AXSSEventManager *)self handleFKAEvent:v4];
  }

  return v5;
}

- (BOOL)processKeyboardCommand:(id)a3
{
  return [(AXSSEventManager *)self _handleCommand:a3 event:0];
}

- (BOOL)_performDownActionForCommand:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AXSSEventManager *)self shouldSuppressCommands])
  {
    v8 = [(AXSSEventManager *)self actionManager];
    [v8 didSuppressCommand:v6];

    char v9 = 0;
  }
  else if ([v7 handlesBothDownAndUp])
  {
    id v10 = [v7 downHandler];
    v10[2]();

    [(AXSSEventManager *)self set_lastDownAndUpCommandInfo:v7];
    char v9 = 1;
  }
  else
  {
    id v11 = [v7 handler];
    char v9 = v11[2]();
  }
  return v9;
}

- (BOOL)_handleEvent:(id)a3 forCaptureOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v4)
  {
    uint64_t v7 = [(AXSSEventManager *)self _lastDownAndUpCommandInfo];
    if (v7)
    {
      v8 = (void *)v7;
      char v9 = [v6 isDownEvent];

      if ((v9 & 1) == 0)
      {
        id v10 = [(AXSSEventManager *)self _lastDownAndUpCommandInfo];
        id v11 = [v10 upHandler];
        v11[2]();

        [(AXSSEventManager *)self set_lastDownAndUpCommandInfo:0];
      }
    }
  }
  uint64_t v12 = [v6 keyCode];
  uint64_t v13 = [v6 modifierMask];
  if (v12 != 43 || (uint64_t v14 = v13, [(AXSSEventManager *)self isPassthroughModeEnabled]))
  {
    if ([(AXSSEventManager *)self _tabKeyPressed])
    {
      if (!v4 && [v6 isDownEvent]) {
        [(AXSSEventManager *)self _handleTabComboEvent:v6];
      }
      goto LABEL_19;
    }
    id v15 = [v6 keyChord];
    if (v15)
    {
      id v16 = [(AXSSEventManager *)self commandMap];
      id v17 = [v16 commandForKeyChord:v15];

      if (v17)
      {
        if (v4) {
          goto LABEL_14;
        }
      }
      else
      {
        id v22 = [(AXSSEventManager *)self commandMap];
        id v23 = [v6 backupKeyChord];
        id v17 = [v22 commandForKeyChord:v23];

        if (v4)
        {
LABEL_14:
          if ([(AXSSEventManager *)self isPassthroughModeEnabled])
          {
            id v18 = [v17 standardCommandIdentifier];
            char v19 = [v18 isEqualToString:@"TogglePassthroughMode"];
          }
          else
          {
            char v19 = v17 != 0;
          }
LABEL_27:

          goto LABEL_28;
        }
      }
      if ([v6 isDownEvent]) {
        [(AXSSEventManager *)self _handleCommand:v17 event:v6];
      }
      char v19 = 0;
      goto LABEL_27;
    }
    char v19 = 0;
LABEL_28:

    goto LABEL_29;
  }
  if (!v4)
  {
    [(AXSSEventManager *)self _handleTabEvent:v6];
    char v19 = 0;
    goto LABEL_29;
  }
  if (v14)
  {
    id v20 = [(AXSSEventManager *)self commandMap];
    id v21 = [v6 keyChord];
    id v15 = [v20 commandForKeyChord:v21];

    char v19 = v15 != 0;
    goto LABEL_28;
  }
LABEL_19:
  char v19 = 1;
LABEL_29:

  return v19;
}

- (void)handleFKAEvent:(id)a3
{
}

- (BOOL)shouldCaptureEvent:(id)a3
{
  return [(AXSSEventManager *)self _handleEvent:a3 forCaptureOnly:1];
}

- (void)_handleTabRepeatOrUpWithCommand:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    if ([(AXSSEventManager *)self shouldSuppressCommands])
    {
      BOOL v5 = [(AXSSEventManager *)self actionManager];
      [v5 didSuppressCommand:v11];
    }
    else
    {
      id v6 = [v11 type];
      int v7 = [v6 isEqualToString:@"Standard"];

      if (v7)
      {
        v8 = [(AXSSEventManager *)self _commandInfos];
        char v9 = [v11 standardCommandIdentifier];
        BOOL v5 = [v8 objectForKeyedSubscript:v9];

        if (v5 && ([v5 handlesBothDownAndUp] & 1) == 0)
        {
          id v10 = [v5 handler];
          v10[2]();
        }
      }
      else
      {
        BOOL v5 = [(AXSSEventManager *)self actionManager];
        [v5 handleCommand:v11];
      }
    }

    id v4 = v11;
  }
}

- (void)_handleTabEvent:(id)a3
{
  id v18 = a3;
  id v4 = [v18 keyChord];
  BOOL v5 = [(AXSSEventManager *)self commandMap];
  id v6 = [v5 commandForKeyChord:v4];

  int v7 = [v18 isDownEvent];
  int v8 = [v18 isRepeatEvent];
  int v9 = v8;
  if (v7 && (v8 & 1) == 0)
  {
    [(AXSSEventManager *)self set_lastTabPressTime:CFAbsoluteTimeGetCurrent()];
    [(AXSSEventManager *)self set_tabKeyPressed:1];
  }
  if ([v18 modifierMask])
  {
    if (v7)
    {
      if (![(AXSSEventManager *)self _handleCommand:v6 event:v18]) {
        goto LABEL_19;
      }
      uint64_t v10 = 1;
      goto LABEL_18;
    }
LABEL_17:
    [(AXSSEventManager *)self set_tabKeyPressed:0];
    uint64_t v10 = 0;
LABEL_18:
    [(AXSSEventManager *)self set_performedActionWhileTabComboPressed:v10];
    goto LABEL_19;
  }
  if ([(AXSSEventManager *)self _performedActionWhileTabComboPressed] || !v6)
  {
LABEL_16:
    if (v7) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  if (v9)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [(AXSSEventManager *)self _lastTabPressTime];
    double v13 = Current - v12;
    [(AXSSEventManager *)self minimumDelayUntilRepeat];
    if (v13 <= v14) {
      goto LABEL_16;
    }
  }
  else if (v7)
  {
    goto LABEL_19;
  }
  id v15 = [(AXSSEventManager *)self filterDelegate];
  int v16 = [v15 eventManager:self shouldRepostEvent:v18];

  if (v16)
  {
    id v17 = [(AXSSEventManager *)self filterDelegate];
    [v17 eventManager:self repostEvent:v18];

    goto LABEL_16;
  }
  [(AXSSEventManager *)self _handleTabRepeatOrUpWithCommand:v6];
  if ((v7 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_19:
}

- (id)_tabbedKeyChordForKeyChord:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
    id v4 = [a3 keys];
    BOOL v5 = [v3 arrayWithArray:v4];

    [v5 addObject:@"⇥"];
    id v6 = +[AXSSKeyChord keyChordWithKeys:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_handleTabComboEvent:(id)a3
{
  id v12 = a3;
  id v4 = [v12 keyChord];
  if (!v4) {
    goto LABEL_3;
  }
  BOOL v5 = [(AXSSEventManager *)self _tabbedKeyChordForKeyChord:v4];
  id v6 = [(AXSSEventManager *)self commandMap];
  int v7 = [v6 commandForKeyChord:v5];

  if (!v7)
  {
LABEL_3:
    uint64_t v8 = [v12 backupKeyChord];
    if (!v8)
    {
      int v7 = 0;
      goto LABEL_8;
    }
    int v9 = (void *)v8;
    uint64_t v10 = [(AXSSEventManager *)self _tabbedKeyChordForKeyChord:v8];
    id v11 = [(AXSSEventManager *)self commandMap];
    int v7 = [v11 commandForKeyChord:v10];

    if (!v7) {
      goto LABEL_8;
    }
  }
  if ([(AXSSEventManager *)self _handleCommand:v7 event:0]) {
    [(AXSSEventManager *)self set_performedActionWhileTabComboPressed:1];
  }
LABEL_8:
}

- (BOOL)_handleCommand:(id)a3 event:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_6;
  }
  uint64_t v8 = [v6 type];
  int v9 = [v8 isEqualToString:@"Standard"];

  if (v9)
  {
    if (v7)
    {
      uint64_t v10 = [(AXSSEventManager *)self filterDelegate];
      int v11 = [v10 eventManager:self shouldRepostEvent:v7];

      if (v11)
      {
        id v12 = [(AXSSEventManager *)self filterDelegate];
        [v12 eventManager:self repostEvent:v7];

LABEL_6:
        BOOL v13 = 0;
        goto LABEL_21;
      }
    }
    id v17 = [(AXSSEventManager *)self _commandInfos];
    id v18 = [v6 standardCommandIdentifier];
    char v19 = [v17 objectForKeyedSubscript:v18];

    if (v19)
    {
      if ([(AXSSEventManager *)self _performDownActionForCommand:v6 info:v19])
      {
        BOOL v13 = 1;
LABEL_20:

        goto LABEL_21;
      }
      id v21 = [v6 standardCommandIdentifier];
      int v22 = [v21 isEqualToString:@"Escape"];

      if (v22)
      {
        id v23 = [(AXSSEventManager *)self filterDelegate];
        [v23 eventManager:self repostEvent:v7];
      }
    }
    else
    {
      id v20 = FKALogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[AXSSEventManager _handleCommand:event:]((uint64_t)v6, v20);
      }
    }
    BOOL v13 = 0;
    goto LABEL_20;
  }
  BOOL v14 = [(AXSSEventManager *)self shouldSuppressCommands];
  id v15 = [(AXSSEventManager *)self actionManager];
  int v16 = v15;
  if (v14) {
    [v15 didSuppressCommand:v6];
  }
  else {
    [v15 handleCommand:v6];
  }

  BOOL v13 = 1;
LABEL_21:

  return v13;
}

- (AXSSActionManager)actionManager
{
  return self->_actionManager;
}

- (void)setActionManager:(id)a3
{
}

- (unint64_t)searchType
{
  return self->_searchType;
}

- (void)setSearchType:(unint64_t)a3
{
  self->_searchType = a3;
}

- (AXSSKeyboardCommandMap)commandMap
{
  return self->_commandMap;
}

- (void)setCommandMap:(id)a3
{
}

- (AXSSKeyFilterDelegate)filterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterDelegate);

  return (AXSSKeyFilterDelegate *)WeakRetained;
}

- (void)setFilterDelegate:(id)a3
{
}

- (BOOL)shouldSuppressCommands
{
  return self->_shouldSuppressCommands;
}

- (void)setShouldSuppressCommands:(BOOL)a3
{
  self->_shouldSuppressCommands = a3;
}

- (BOOL)isPassthroughModeEnabled
{
  return self->_passthroughModeEnabled;
}

- (void)setPassthroughModeEnabled:(BOOL)a3
{
  self->_passthroughModeEnabled = a3;
}

- (NSDictionary)_commandInfos
{
  return self->__commandInfos;
}

- (BOOL)_tabKeyPressed
{
  return self->__tabKeyPressed;
}

- (void)set_tabKeyPressed:(BOOL)a3
{
  self->__tabKeyPressed = a3;
}

- (BOOL)_performedActionWhileTabComboPressed
{
  return self->__performedActionWhileTabComboPressed;
}

- (void)set_performedActionWhileTabComboPressed:(BOOL)a3
{
  self->__performedActionWhileTabComboPressed = a3;
}

- (double)_lastTabPressTime
{
  return self->__lastTabPressTime;
}

- (void)set_lastTabPressTime:(double)a3
{
  self->__lastTabPressTime = a3;
}

- (AXSSKeyboardCommandInfo)_lastDownAndUpCommandInfo
{
  return self->__lastDownAndUpCommandInfo;
}

- (void)set_lastDownAndUpCommandInfo:(id)a3
{
}

- (double)minimumDelayUntilRepeat
{
  return self->_minimumDelayUntilRepeat;
}

- (void)setMinimumDelayUntilRepeat:(double)a3
{
  self->_minimumDelayUntilRepeat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__lastDownAndUpCommandInfo, 0);
  objc_storeStrong((id *)&self->__commandInfos, 0);
  objc_destroyWeak((id *)&self->_filterDelegate);
  objc_storeStrong((id *)&self->_commandMap, 0);

  objc_storeStrong((id *)&self->_actionManager, 0);
}

- (void)_handleCommand:(uint64_t)a1 event:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_ERROR, "Found standard command with no info: %@", (uint8_t *)&v2, 0xCu);
}

@end