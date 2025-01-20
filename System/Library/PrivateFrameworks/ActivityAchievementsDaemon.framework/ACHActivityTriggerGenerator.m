@interface ACHActivityTriggerGenerator
+ (unint64_t)allPossibleTriggers;
- ($A5E8A54F69D71102DC6A95EAED28A9DA)_incrementWithInitialState:(SEL)a3 forGoalType:(id *)a4 dataProvider:(int64_t)a5 goalMetHandler:(id)a6;
- (ACHActivityTriggerGenerator)initWithPauseRingsCoordinator:(id)a3;
- (BOOL)_goalTypeIsMoveType:(int64_t)a3;
- (FIPauseRingsCoordinator)pauseRingsCoordinator;
- (unint64_t)_triggersForNewActivityDataWithGoalType:(int64_t)a3 dataProvider:(id)a4 goalMetHandler:(id)a5;
- (unint64_t)triggersForNewExerciseDataWithDataProvider:(id)a3;
- (unint64_t)triggersForNewMoveDataWithDataProvider:(id)a3;
- (unint64_t)triggersForNewMoveTimeDataWithDataProvider:(id)a3;
- (unint64_t)triggersForNewStandDataWithDataProvider:(id)a3;
- (void)setPauseRingsCoordinator:(id)a3;
@end

@implementation ACHActivityTriggerGenerator

+ (unint64_t)allPossibleTriggers
{
  uint64_t v2 = ACHGoalCompletionTrigger(0);
  uint64_t v3 = ACHGoalCompletionTrigger(3);
  uint64_t v4 = ACHGoalCompletionTrigger(1);
  return v2 | v3 | v4 | ACHGoalCompletionTrigger(2) | 0x3C9;
}

- (ACHActivityTriggerGenerator)initWithPauseRingsCoordinator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACHActivityTriggerGenerator;
  v6 = [(ACHActivityTriggerGenerator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pauseRingsCoordinator, a3);
  }

  return v7;
}

- (unint64_t)triggersForNewMoveDataWithDataProvider:(id)a3
{
  return [(ACHActivityTriggerGenerator *)self _triggersForNewActivityDataWithGoalType:0 dataProvider:a3 goalMetHandler:&__block_literal_global_22];
}

BOOL __70__ACHActivityTriggerGenerator_triggersForNewMoveDataWithDataProvider___block_invoke(double a1, double a2)
{
  return a1 >= a2;
}

- (unint64_t)triggersForNewMoveTimeDataWithDataProvider:(id)a3
{
  return [(ACHActivityTriggerGenerator *)self _triggersForNewActivityDataWithGoalType:3 dataProvider:a3 goalMetHandler:&__block_literal_global_279];
}

BOOL __74__ACHActivityTriggerGenerator_triggersForNewMoveTimeDataWithDataProvider___block_invoke(double a1, double a2)
{
  return a1 >= a2;
}

- (unint64_t)triggersForNewExerciseDataWithDataProvider:(id)a3
{
  return [(ACHActivityTriggerGenerator *)self _triggersForNewActivityDataWithGoalType:1 dataProvider:a3 goalMetHandler:&__block_literal_global_281];
}

BOOL __74__ACHActivityTriggerGenerator_triggersForNewExerciseDataWithDataProvider___block_invoke(double a1, double a2)
{
  return a1 >= a2;
}

- (unint64_t)triggersForNewStandDataWithDataProvider:(id)a3
{
  return [(ACHActivityTriggerGenerator *)self _triggersForNewActivityDataWithGoalType:2 dataProvider:a3 goalMetHandler:&__block_literal_global_283];
}

BOOL __71__ACHActivityTriggerGenerator_triggersForNewStandDataWithDataProvider___block_invoke(double a1, double a2)
{
  return (uint64_t)llround(a1) >= (uint64_t)llround(a2);
}

- (unint64_t)_triggersForNewActivityDataWithGoalType:(int64_t)a3 dataProvider:(id)a4 goalMetHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x223C50570]();
  long long v11 = 0uLL;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v46 = 0u;
  if (v8)
  {
    [v8 currentStateForGoalType:a3];
    long long v11 = 0uLL;
  }
  long long v44 = v11;
  long long v45 = v11;
  long long v42 = v11;
  long long v43 = v11;
  long long v40 = v11;
  long long v41 = v11;
  long long v38 = v11;
  long long v39 = v11;
  long long v37 = v11;
  long long v34 = v52;
  long long v35 = v53;
  long long v36 = v54;
  long long v30 = v48;
  long long v31 = v49;
  long long v32 = v50;
  long long v33 = v51;
  long long v28 = v46;
  long long v29 = v47;
  [(ACHActivityTriggerGenerator *)self _incrementWithInitialState:&v28 forGoalType:a3 dataProvider:v8 goalMetHandler:v9];
  long long v34 = v43;
  long long v35 = v44;
  long long v36 = v45;
  long long v30 = v39;
  long long v31 = v40;
  long long v32 = v41;
  long long v33 = v42;
  long long v28 = v37;
  long long v29 = v38;
  [v8 setNewState:&v28 forGoalType:a3];
  v12 = [v8 todayActivitySummary];
  char v13 = [v12 isPaused];

  if ((v13 & 1) == 0)
  {
    if ((_BYTE)v45)
    {
      uint64_t v16 = ACHGoalCompletionTrigger(a3);
      if ([v8 allGoalsMetToday]) {
        uint64_t v17 = v16 | 0x40;
      }
      else {
        uint64_t v17 = v16;
      }
    }
    else
    {
      uint64_t v17 = 0;
    }
    if (a3 == 3 || a3 == 0)
    {
      double v14 = *(double *)&v39;
      if (*(double *)&v39 > 2.22044605e-16)
      {
        double v19 = floor(*((double *)&v38 + 1) / *(double *)&v39);
        double v14 = 1.0;
        BOOL v20 = v19 == floor(*(double *)&v38 / *(double *)&v39) || v19 <= 1.0;
        uint64_t v21 = 8;
        if (v20) {
          uint64_t v21 = 0;
        }
        v17 |= v21;
      }
    }
    switch(a3)
    {
      case 1:
        uint64_t v22 = 256;
        break;
      case 2:
LABEL_37:
        unint64_t v15 = v17 | BYTE1(v45);
        goto LABEL_38;
      case 3:
        uint64_t v22 = 512;
        break;
      default:
        uint64_t v22 = 128;
        break;
    }
    v23 = objc_msgSend(v8, "todayActivitySummary", v14);
    if ([v23 activityMoveMode] == 2
      && [(ACHActivityTriggerGenerator *)self _goalTypeIsMoveType:a3])
    {
      v24 = (double *)&v44;
    }
    else
    {
      v24 = (double *)&v43 + 1;
    }
    double v25 = *v24;

    if (*((double *)&v38 + 1) <= v25) {
      uint64_t v26 = 0;
    }
    else {
      uint64_t v26 = v22;
    }
    v17 |= v26;
    goto LABEL_37;
  }
  unint64_t v15 = 0;
LABEL_38:

  return v15;
}

- ($A5E8A54F69D71102DC6A95EAED28A9DA)_incrementWithInitialState:(SEL)a3 forGoalType:(id *)a4 dataProvider:(int64_t)a5 goalMetHandler:(id)a6
{
  uint64_t v139 = *MEMORY[0x263EF8340];
  id v92 = a6;
  v90 = (void (**)(void, double, double))a7;
  int64_t v83 = a5;
  v89 = ACHGoalDisplayName(a5);
  if (![v92 todayIndex])
  {
    long long v28 = *(_OWORD *)&a4->var14;
    *(_OWORD *)&retstr->var12 = *(_OWORD *)&a4->var12;
    *(_OWORD *)&retstr->var14 = v28;
    *(_OWORD *)&retstr->var16 = *(_OWORD *)&a4->var16;
    long long v29 = *(_OWORD *)&a4->var6;
    *(_OWORD *)&retstr->var4 = *(_OWORD *)&a4->var4;
    *(_OWORD *)&retstr->var6 = v29;
    long long v30 = *(_OWORD *)&a4->var10;
    *(_OWORD *)&retstr->var8 = *(_OWORD *)&a4->var8;
    *(_OWORD *)&retstr->var10 = v30;
    long long v31 = *(_OWORD *)&a4->var2;
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&a4->var0;
    *(_OWORD *)&retstr->var2 = v31;
    goto LABEL_58;
  }
  uint64_t v121 = 0;
  v122 = (double *)&v121;
  long long v11 = *(_OWORD *)&a4->var14;
  long long v131 = *(_OWORD *)&a4->var12;
  long long v132 = v11;
  long long v133 = *(_OWORD *)&a4->var16;
  long long v12 = *(_OWORD *)&a4->var6;
  long long v127 = *(_OWORD *)&a4->var4;
  long long v128 = v12;
  long long v13 = *(_OWORD *)&a4->var10;
  long long v129 = *(_OWORD *)&a4->var8;
  long long v130 = v13;
  long long v14 = *(_OWORD *)&a4->var2;
  long long v125 = *(_OWORD *)&a4->var0;
  long long v126 = v14;
  v124 = &unk_21F67425F;
  uint64_t v91 = *((void *)&v125 + 1) - v125;
  uint64_t v123 = 0xB010000000;
  if ((unint64_t)(*((void *)&v125 + 1) - v125 + 86399) >= 0x2A2FF) {
    *(void *)&long long v126 = 0;
  }
  v88 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  [v92 todayIndex];
  v93 = _HKActivityCacheDateComponentsFromCacheIndex();
  unint64_t v15 = objc_msgSend(v88, "dateFromComponents:");
  uint64_t v16 = objc_msgSend(v88, "hk_dateBySubtractingDays:fromDate:", 1, v15);
  uint64_t v17 = _HKCacheIndexFromDate();
  [v93 year];
  [v93 month];
  v87 = ACHDateComponentsForYearMonthDay();
  uint64_t v18 = ACHStartOfFitnessWeekBeforeDateInCalendar();
  double v19 = [v88 components:28 fromDate:v18];
  v75 = (void *)v16;
  v76 = (void *)v18;
  BOOL v20 = [MEMORY[0x263F0A980] sharedBehavior];
  uint64_t v21 = [v20 features];
  int v22 = [v21 pauseRings];

  v90[2](v90, v122[9], v122[10]);
  int v78 = v23;
  char v24 = ((uint64_t (*)(void, double, double))v90[2])(v90, v122[6], v122[8]);
  int v85 = ((uint64_t (*)(void, double, double))v90[2])(v90, v122[7], v122[8]);
  if (v22)
  {
    int v86 = [v92 ringsPausedToday];
    if (v17 >= *((void *)v122 + 4)) {
      uint64_t v25 = *((void *)v122 + 4);
    }
    else {
      uint64_t v25 = v17;
    }
    uint64_t v26 = [(ACHActivityTriggerGenerator *)self pauseRingsCoordinator];
    int v27 = [v26 isPausedForActivitySummaryCacheIndexStart:v25 end:v17];

    char v77 = v86;
    if ((v24 & 1) == 0)
    {
LABEL_9:
      int v81 = v85 & (v86 ^ 1);
      goto LABEL_16;
    }
  }
  else
  {
    int v27 = 0;
    int v86 = 0;
    char v77 = 0;
    if (v17 >= *((void *)v122 + 4)) {
      uint64_t v25 = *((void *)v122 + 4);
    }
    else {
      uint64_t v25 = v17;
    }
    if ((v24 & 1) == 0) {
      goto LABEL_9;
    }
  }
  int v81 = 0;
LABEL_16:
  uint64_t v33 = [v19 year];
  if (v33 == [v93 year] && (uint64_t v34 = objc_msgSend(v19, "month"), v34 == objc_msgSend(v93, "month")))
  {
    uint64_t v35 = [v19 day];
    BOOL v82 = v35 == [v93 day];
  }
  else
  {
    BOOL v82 = 0;
  }
  uint64_t v36 = [v87 year];
  if (v36 == [v93 year] && (uint64_t v37 = objc_msgSend(v87, "month"), v37 == objc_msgSend(v93, "month")))
  {
    uint64_t v38 = [v87 day];
    BOOL v80 = v38 == [v93 day];
  }
  else
  {
    BOOL v80 = 0;
  }
  long long v39 = ACHLogAwardEngine();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v40 = [v92 todayIndex];
    *(_DWORD *)buf = 134217984;
    *(void *)v135 = v40;
    _os_log_impl(&dword_21F5DA000, v39, OS_LOG_TYPE_DEFAULT, "[ACHActivityTriggerGenerator] Today's Index: %ld", buf, 0xCu);
  }

  long long v41 = ACHLogAwardEngine();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v135 = v93;
    _os_log_impl(&dword_21F5DA000, v41, OS_LOG_TYPE_DEFAULT, "[ACHActivityTriggerGenerator] Today's Date Components: %@", buf, 0xCu);
  }

  long long v42 = ACHLogAwardEngine();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    long long v43 = @"NO";
    if (v22) {
      long long v43 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    *(void *)v135 = v43;
    _os_log_impl(&dword_21F5DA000, v42, OS_LOG_TYPE_DEFAULT, "[ACHActivityTriggerGenerator] Pause Rings Feature Enabled: %@", buf, 0xCu);
  }

  long long v44 = ACHLogAwardEngine();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    long long v45 = @"NO";
    if (v86) {
      long long v45 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    *(void *)v135 = v45;
    _os_log_impl(&dword_21F5DA000, v44, OS_LOG_TYPE_DEFAULT, "[ACHActivityTriggerGenerator] Today is paused: %@", buf, 0xCu);
  }

  long long v46 = ACHLogAwardEngine();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v47 = *((void *)v122 + 4);
    *(_DWORD *)buf = 134217984;
    *(void *)v135 = v47;
    _os_log_impl(&dword_21F5DA000, v46, OS_LOG_TYPE_DEFAULT, "[ACHActivityTriggerGenerator] Last Checked Summary Index: %lld", buf, 0xCu);
  }

  long long v48 = ACHLogAwardEngine();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    long long v49 = @"NO";
    *(_DWORD *)buf = 134218498;
    *(void *)v135 = v25;
    if (v27) {
      long long v49 = @"YES";
    }
    *(_WORD *)&v135[8] = 2048;
    uint64_t v136 = v17;
    __int16 v137 = 2112;
    v138 = v49;
    _os_log_impl(&dword_21F5DA000, v48, OS_LOG_TYPE_DEFAULT, "[ACHActivityTriggerGenerator] Paused since last checked index (%lld -> %lld): %@", buf, 0x20u);
  }

  long long v50 = ACHLogAwardEngine();
  BOOL v32 = v91 > 172799;
  int v51 = (v32 | ~v78) & (v27 ^ 1);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v135 = (v32 | ~v78) & (v27 ^ 1);
    *(_WORD *)&v135[4] = 1024;
    *(_DWORD *)&v135[6] = v82;
    LOWORD(v136) = 1024;
    *(_DWORD *)((char *)&v136 + 2) = v80;
    _os_log_impl(&dword_21F5DA000, v50, OS_LOG_TYPE_DEFAULT, "[ACHActivityTriggerGenerator] Should Reset Streak [All, Week, Month]: [%{BOOL}d, %{BOOL}d, %{BOOL}d]", buf, 0x14u);
  }

  v117[0] = MEMORY[0x263EF8330];
  v117[1] = 3221225472;
  v117[2] = __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke;
  v117[3] = &unk_264517A48;
  id v52 = v89;
  id v118 = v52;
  v119 = &v121;
  uint64_t v120 = v91 / 86400;
  v79 = (void (**)(void))MEMORY[0x223C507A0](v117);
  v111[0] = MEMORY[0x263EF8330];
  v111[1] = 3221225472;
  v111[2] = __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_292;
  v111[3] = &unk_264517A70;
  id v53 = v52;
  id v112 = v53;
  v115 = &v121;
  uint64_t v116 = v91 / 86400;
  id v54 = v15;
  id v113 = v54;
  id v74 = v19;
  id v114 = v74;
  v55 = (void (**)(void))MEMORY[0x223C507A0](v111);
  v105[0] = MEMORY[0x263EF8330];
  v105[1] = 3221225472;
  v105[2] = __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_293;
  v105[3] = &unk_264517A70;
  id v56 = v53;
  id v106 = v56;
  v109 = &v121;
  uint64_t v110 = v91 / 86400;
  id v57 = v54;
  id v107 = v57;
  id v58 = v87;
  id v108 = v58;
  v59 = (void (**)(void))MEMORY[0x223C507A0](v105);
  v102[0] = MEMORY[0x263EF8330];
  v102[1] = 3221225472;
  v102[2] = __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_294;
  v102[3] = &unk_264516580;
  v104 = &v121;
  id v103 = v56;
  v60 = (void (**)(void))MEMORY[0x223C507A0](v102);
  v99[0] = MEMORY[0x263EF8330];
  v99[1] = 3221225472;
  v99[2] = __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_295;
  v99[3] = &unk_264517A98;
  char v100 = v85;
  v99[4] = &v121;
  char v101 = v77;
  v61 = (void (**)(void))MEMORY[0x223C507A0](v99);
  v94[0] = MEMORY[0x263EF8330];
  v94[1] = 3221225472;
  v94[2] = __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_2;
  v94[3] = &unk_264515EC0;
  id v62 = v92;
  id v95 = v62;
  v96 = self;
  v97 = &v121;
  int64_t v98 = v83;
  v63 = (void (**)(void))MEMORY[0x223C507A0](v94);
  if (v91 > 86399)
  {
    if (v51) {
      v79[2]();
    }
    if ((v86 & 1) == 0)
    {
      ++*((void *)v122 + 16);
      v63[2](v63);
    }
  }
  if (v80) {
    v59[2](v59);
  }
  if (v82) {
    v55[2](v55);
  }
  if (v81) {
    v60[2](v60);
  }
  v61[2](v61);
  uint64_t v64 = [v62 todayIndex];
  v65 = v122;
  v66 = v122;
  *((void *)v122 + 4) = v64;
  v67 = v66 + 4;
  char v68 = v85;
  if (v85) {
    char v68 = v81 & (v86 ^ 1);
  }
  *((unsigned char *)v65 + 160) = v68;
  *((unsigned char *)v65 + 161) = (unint64_t)(v91 - 86400) < 0x15180;
  long long v69 = v67[7];
  *(_OWORD *)&retstr->var12 = v67[6];
  *(_OWORD *)&retstr->var14 = v69;
  long long v70 = v67[3];
  *(_OWORD *)&retstr->var4 = v67[2];
  *(_OWORD *)&retstr->var6 = v70;
  long long v71 = v67[5];
  *(_OWORD *)&retstr->var8 = v67[4];
  *(_OWORD *)&retstr->var10 = v71;
  long long v72 = v67[1];
  *(_OWORD *)&retstr->var0 = *v67;
  *(_OWORD *)&retstr->var2 = v72;
  *(_OWORD *)&retstr->var16 = v67[8];

  _Block_object_dispose(&v121, 8);
LABEL_58:

  return result;
}

void __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = ACHLogAwardEngine();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_cold_1();
  }

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 88) = 0;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 96) = 0;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 104) = 0;
}

void __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_292(uint64_t a1)
{
  uint64_t v2 = ACHLogAwardEngine();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_292_cold_1();
  }

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 96) = 0;
}

void __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_293(uint64_t a1)
{
  uint64_t v2 = ACHLogAwardEngine();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_293_cold_1();
  }

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 104) = 0;
}

double __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_294(uint64_t a1)
{
  uint64_t v1 = a1 + 40;
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 88);
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 96);
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 104);
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 120);
  uint64_t v2 = ACHLogAwardEngine();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_294_cold_3();
  }

  uint64_t v3 = *(void *)(*(void *)v1 + 8);
  if (*(void *)(v3 + 88) > *(void *)(v3 + 112))
  {
    uint64_t v4 = ACHLogAwardEngine();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_294_cold_2();
    }

    *(void *)(*(void *)(*(void *)v1 + 8) + 112) = *(void *)(*(void *)(*(void *)v1 + 8) + 88);
    uint64_t v3 = *(void *)(*(void *)v1 + 8);
  }
  double result = *(double *)(v3 + 64);
  if (result > *(double *)(v3 + 152))
  {
    v6 = ACHLogAwardEngine();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_294_cold_1();
    }

    uint64_t v7 = *(void *)(*(void *)v1 + 8);
    double result = *(double *)(v7 + 64);
    *(double *)(v7 + 152) = result;
  }
  return result;
}

uint64_t __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_295(uint64_t result)
{
  if (*(unsigned char *)(result + 40))
  {
    uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
    double v2 = *(double *)(v1 + 64);
    if (v2 > *(double *)(v1 + 152) && !*(unsigned char *)(result + 41)) {
      *(double *)(v1 + 152) = v2;
    }
  }
  return result;
}

void __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) yesterdayActivitySummary];
  if ([v2 activityMoveMode] == 2)
  {
    int v3 = [*(id *)(a1 + 40) _goalTypeIsMoveType:*(void *)(a1 + 56)];

    if (v3)
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
      double v5 = *(double *)(v4 + 72);
      if (v5 > *(double *)(v4 + 144) + 2.22044605e-16) {
        *(double *)(v4 + 144) = v5;
      }
      return;
    }
  }
  else
  {
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  double v7 = *(double *)(v6 + 72);
  if (v7 > *(double *)(v6 + 136) + 2.22044605e-16) {
    *(double *)(v6 + 136) = v7;
  }
}

- (BOOL)_goalTypeIsMoveType:(int64_t)a3
{
  return !a3 || a3 == 3;
}

- (FIPauseRingsCoordinator)pauseRingsCoordinator
{
  return self->_pauseRingsCoordinator;
}

- (void)setPauseRingsCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
}

void __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_cold_1()
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v7 = 2114;
  uint64_t v8 = v0;
  __int16 v9 = v1;
  uint64_t v10 = v2;
  __int16 v11 = 2114;
  uint64_t v12 = v0;
  __int16 v13 = v1;
  uint64_t v14 = v3;
  __int16 v15 = v1;
  uint64_t v16 = v4;
  _os_log_debug_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEBUG, "[ACHActivityTriggerGenerator] Resetting current %{public}@ streak of %ld days, current week %{public}@ streak of %ld days, and current month %{public}@ streak of %ld after advancing %ld days", v6, 0x48u);
}

void __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_292_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(&dword_21F5DA000, v0, OS_LOG_TYPE_DEBUG, "[ACHActivityTriggerGenerator] Resetting current Week %{public}@ streak of %ld days after advancing %ld days. Today = %@, startOfFitnessWeekDate = %@", v1, 0x34u);
}

void __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_293_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(&dword_21F5DA000, v0, OS_LOG_TYPE_DEBUG, "[ACHActivityTriggerGenerator] Resetting current Month %{public}@ streak of %ld days after advancing %ld days. Today = %@, start of month = %@", v1, 0x34u);
}

void __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_294_cold_1()
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4_0(&dword_21F5DA000, v0, v1, "%{public}@: best goal value achieved! New: %f; Old: %f");
}

void __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_294_cold_2()
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4_0(&dword_21F5DA000, v0, v1, "%{public}@: best streak value achieved! New: %ld; Old: %ld");
}

void __98__ACHActivityTriggerGenerator__incrementWithInitialState_forGoalType_dataProvider_goalMetHandler___block_invoke_294_cold_3()
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  __int16 v7 = v0;
  uint64_t v8 = v1;
  __int16 v9 = v0;
  uint64_t v10 = v2;
  __int16 v11 = v0;
  uint64_t v12 = v3;
  __int16 v13 = 2114;
  uint64_t v14 = v4;
  _os_log_debug_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEBUG, "[ACHActivityTriggerGenerator] %{public}@: streak extended to %ld days (week streak to %ld days, monthy streak to %ld days), %ld total %{public}@ goals made", v6, 0x3Eu);
}

@end