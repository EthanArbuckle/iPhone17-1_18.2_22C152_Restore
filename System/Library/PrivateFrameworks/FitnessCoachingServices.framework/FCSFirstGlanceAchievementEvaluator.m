@interface FCSFirstGlanceAchievementEvaluator
- (FCSFirstGlanceAchievementEvaluator)initWithDataSource:(id)a3;
- (FCSFirstGlanceAchievementEvaluatorDataSource)dataSource;
- (id)evaluateYesterdayAchievements:(id)a3 isStandaloneMode:(BOOL)a4;
- (id)progressLocalizationKeyForAchievement:(id)a3 progressMilestone:(id)a4 experienceType:(unint64_t)a5;
- (id)yesterdayLocalizationKeyForAchievement:(id)a3 experienceType:(unint64_t)a4;
- (void)_firstAchievementFromAchievements:(id)a3 passingMilestoneTest:(id)a4 completion:(id)a5;
- (void)_firstAchievementMatchingLifetimeGoalsWithNames:(id)a3 amongstAchievements:(id)a4 experienceType:(unint64_t)a5 reachedMilestoneCompletion:(id)a6;
- (void)progressAchievementAndMilestoneWithCurrentDate:(id)a3 calendar:(id)a4 experienceType:(unint64_t)a5 isStandaloneMode:(BOOL)a6 completion:(id)a7;
- (void)progressAchievementAndMilestoneWithMonthlyChallengeAchievement:(id)a3 achievementsMap:(id)a4 currentDate:(id)a5 calendar:(id)a6 experienceType:(unint64_t)a7 isStandaloneMode:(BOOL)a8 completion:(id)a9;
- (void)setDataSource:(id)a3;
- (void)setLocalizationKeyOverride:(id)a3;
@end

@implementation FCSFirstGlanceAchievementEvaluator

- (FCSFirstGlanceAchievementEvaluator)initWithDataSource:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FCSFirstGlanceAchievementEvaluator;
  v5 = [(FCSFirstGlanceAchievementEvaluator *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dataSource, v4);
  }

  return v6;
}

- (void)progressAchievementAndMilestoneWithCurrentDate:(id)a3 calendar:(id)a4 experienceType:(unint64_t)a5 isStandaloneMode:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v15 = [(FCSFirstGlanceAchievementEvaluator *)self dataSource];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __137__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithCurrentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke;
  v19[3] = &unk_1E69B9E40;
  v19[4] = self;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  unint64_t v23 = a5;
  BOOL v24 = a6;
  id v16 = v13;
  id v17 = v12;
  id v18 = v14;
  [v15 monthlyChallengeForDate:v17 calendar:v16 completion:v19];
}

void __137__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithCurrentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_1D3B55000, v7, OS_LOG_TYPE_DEFAULT, "Error getting monthly challenge %@", buf, 0xCu);
    }
  }
  objc_super v8 = [*(id *)(a1 + 32) dataSource];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __137__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithCurrentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_277;
  v13[3] = &unk_1E69B9E18;
  id v17 = *(id *)(a1 + 56);
  v9 = *(void **)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v14 = v5;
  id v15 = v9;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 64);
  id v16 = v10;
  uint64_t v18 = v11;
  char v19 = *(unsigned char *)(a1 + 72);
  id v12 = v5;
  [v8 achievementsWithNames:&unk_1F2B54BF8 completion:v13];
}

void __137__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithCurrentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_277(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v4();
  }
  else
  {
    objc_msgSend(a2, "hk_mapToDictionary:", &__block_literal_global_0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) progressAchievementAndMilestoneWithMonthlyChallengeAchievement:*(void *)(a1 + 40) achievementsMap:v5 currentDate:*(void *)(a1 + 48) calendar:*(void *)(a1 + 56) experienceType:*(void *)(a1 + 72) isStandaloneMode:*(unsigned __int8 *)(a1 + 80) completion:*(void *)(a1 + 64)];
  }
}

void __137__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithCurrentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_2(uint64_t a1, void *a2, void (**a3)(void, void, void))
{
  id v5 = a3;
  id v6 = a2;
  id v8 = [v6 template];
  v7 = [v8 uniqueName];
  ((void (**)(void, void *, id))a3)[2](v5, v7, v6);
}

- (void)progressAchievementAndMilestoneWithMonthlyChallengeAchievement:(id)a3 achievementsMap:(id)a4 currentDate:(id)a5 calendar:(id)a6 experienceType:(unint64_t)a7 isStandaloneMode:(BOOL)a8 completion:(id)a9
{
  BOOL v54 = a8;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v60 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(void))a9;
  uint64_t v78 = 0;
  v79 = (id *)&v78;
  uint64_t v80 = 0x3032000000;
  v81 = __Block_byref_object_copy_;
  v82 = __Block_byref_object_dispose_;
  id v83 = 0;
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x3032000000;
  v75 = __Block_byref_object_copy_;
  v76 = __Block_byref_object_dispose_;
  id v77 = 0;
  v58 = v14;
  v59 = v15;
  uint64_t v55 = FCSFirstGlanceDaysRemainingInFitnessWeek((uint64_t)v14, v15);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke;
  aBlock[3] = &unk_1E69B9E68;
  aBlock[4] = &v78;
  aBlock[5] = &v72;
  id v17 = _Block_copy(aBlock);
  uint64_t v18 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v19 = [v18 persistentDomainForName:*MEMORY[0x1E4F2BEE8]];

  uint64_t v20 = [v19 objectForKey:@"progressAchievementMilestoneOverride"];
  id v21 = (void *)v73[5];
  v73[5] = v20;

  uint64_t v22 = (os_log_t *)MEMORY[0x1E4F29F08];
  if (v73[5])
  {
    _HKInitializeLogging();
    unint64_t v23 = *v22;
    if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v24 = (void *)v73[5];
      *(_DWORD *)buf = 138412290;
      v89 = v24;
      _os_log_impl(&dword_1D3B55000, v23, OS_LOG_TYPE_DEFAULT, "Overriding First Glance progress achievement milestone to '%@'", buf, 0xCu);
    }
  }
  v25 = [v19 objectForKey:@"progressAchievementIdentifierOverride"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    _HKInitializeLogging();
    v26 = *v22;
    if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v89 = v25;
      _os_log_impl(&dword_1D3B55000, v26, OS_LOG_TYPE_DEFAULT, "Overriding First Glance progress achievement identifier to '%@'", buf, 0xCu);
    }
    uint64_t v27 = [v60 objectForKeyedSubscript:v25];
    id v28 = v79[5];
    v79[5] = (id)v27;

    if (!v79[5])
    {
      v29 = [v13 template];
      v30 = [v29 uniqueName];
      int v31 = [v30 isEqualToString:v25];

      if (v31)
      {
        _HKInitializeLogging();
        v32 = *v22;
        if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v89 = v25;
          _os_log_impl(&dword_1D3B55000, v32, OS_LOG_TYPE_DEFAULT, "Overriding First Glance progress monthly achievement identifier to '%@'", buf, 0xCu);
        }
        objc_storeStrong(v79 + 5, a3);
      }
    }
  }
  id v33 = v79[5];
  if (v13 && !v33)
  {
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_283;
    v67[3] = &unk_1E69B9E90;
    id v68 = v59;
    id v69 = v58;
    unint64_t v70 = a7;
    v34 = _Block_copy(v67);
    id v87 = v13;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
    [(FCSFirstGlanceAchievementEvaluator *)self _firstAchievementFromAchievements:v35 passingMilestoneTest:v34 completion:v17];

    id v33 = v79[5];
  }
  if (!v33)
  {
    [(FCSFirstGlanceAchievementEvaluator *)self _firstAchievementMatchingLifetimeGoalsWithNames:&unk_1F2B54B98 amongstAchievements:v60 experienceType:a7 reachedMilestoneCompletion:v17];
    if (!v79[5])
    {
      [(FCSFirstGlanceAchievementEvaluator *)self _firstAchievementMatchingLifetimeGoalsWithNames:&unk_1F2B54BB0 amongstAchievements:v60 experienceType:a7 reachedMilestoneCompletion:v17];
      id v36 = v79[5];
      if (a7 != 3 && !v36)
      {
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_385;
        v66[3] = &__block_descriptor_40_e40___NSString_32__0__ACHAchievement_8d16d24l;
        v66[4] = a7;
        v37 = _Block_copy(v66);
        uint64_t v38 = [v60 objectForKeyedSubscript:@"LongestMoveStreak"];
        v39 = (void *)v38;
        if (v38)
        {
          uint64_t v86 = v38;
          v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
          [(FCSFirstGlanceAchievementEvaluator *)self _firstAchievementFromAchievements:v40 passingMilestoneTest:v37 completion:v17];
        }
        id v36 = v79[5];
      }
      if (!v36 && !v54)
      {
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_2;
        v65[3] = &__block_descriptor_48_e40___NSString_32__0__ACHAchievement_8d16d24l;
        v65[4] = v55;
        v65[5] = a7;
        v41 = _Block_copy(v65);
        uint64_t v42 = [v60 objectForKeyedSubscript:@"PerfectWeekAll"];
        v43 = (void *)v42;
        if (v42)
        {
          uint64_t v85 = v42;
          v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
          [(FCSFirstGlanceAchievementEvaluator *)self _firstAchievementFromAchievements:v44 passingMilestoneTest:v41 completion:v17];
        }
        id v36 = v79[5];
      }
      if (!v36)
      {
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_3;
        v64[3] = &__block_descriptor_48_e40___NSString_32__0__ACHAchievement_8d16d24l;
        v64[4] = v55;
        v64[5] = a7;
        v45 = _Block_copy(v64);
        uint64_t v46 = [v60 objectForKeyedSubscript:@"7WorkoutWeek"];
        v47 = (void *)v46;
        if (v46)
        {
          uint64_t v84 = v46;
          v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
          [(FCSFirstGlanceAchievementEvaluator *)self _firstAchievementFromAchievements:v48 passingMilestoneTest:v45 completion:v17];
        }
        if (!v79[5])
        {
          v63[0] = MEMORY[0x1E4F143A8];
          v63[1] = 3221225472;
          v63[2] = __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_4;
          v63[3] = &__block_descriptor_48_e40___NSString_32__0__ACHAchievement_8d16d24l;
          v63[4] = v55;
          v63[5] = a7;
          v49 = _Block_copy(v63);
          v50 = &unk_1F2B54BE0;
          if (v54) {
            v50 = &unk_1F2B54BC8;
          }
          id v51 = v50;
          v61[0] = MEMORY[0x1E4F143A8];
          v61[1] = 3221225472;
          v61[2] = __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_5;
          v61[3] = &unk_1E69B9EF8;
          id v62 = v60;
          v52 = objc_msgSend(v51, "hk_map:", v61);
          [(FCSFirstGlanceAchievementEvaluator *)self _firstAchievementFromAchievements:v52 passingMilestoneTest:v49 completion:v17];

          if (!v79[5]) {
            goto LABEL_36;
          }
        }
      }
    }
  }
  if (v73[5])
  {
    v16[2](v16);
  }
  else
  {
LABEL_36:
    v53 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:96 userInfo:0];
    ((void (*)(void (**)(void), void, void, void *))v16[2])(v16, 0, 0, v53);
  }
  _Block_object_dispose(&v72, 8);

  _Block_object_dispose(&v78, 8);
}

void __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

id __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_283(uint64_t a1, void *a2, double a3, double a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  unint64_t v8 = [*(id *)(a1 + 32) component:16 fromDate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) rangeOfUnit:16 inUnit:8 forDate:*(void *)(a1 + 40)];
  if (floor((double)v9 * 0.25) == (double)v8)
  {
    unint64_t v10 = v9;
    id v11 = @"QUARTER_IN";
    if (!v11)
    {
LABEL_9:
      id v14 = ValidMilestoneForExperienceType(v11, *(void *)(a1 + 48));

      goto LABEL_16;
    }
    if (a3 < a4)
    {
      if (ACHMonthlyChallengeAchievementIsDayBased())
      {
        uint64_t v12 = v10 - v8;
        if ((uint64_t)a4 - (uint64_t)a3 > v12)
        {
          _HKInitializeLogging();
          id v13 = *MEMORY[0x1E4F29F08];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
          {
            int v18 = 134218240;
            uint64_t v19 = (uint64_t)a4 - (uint64_t)a3;
            __int16 v20 = 2048;
            double v21 = *(double *)&v12;
            _os_log_impl(&dword_1D3B55000, v13, OS_LOG_TYPE_DEFAULT, "Not coaching to Monthly Challenge - days needed (%ld) exceed days remaining in month (%ld)", (uint8_t *)&v18, 0x16u);
          }

          id v11 = 0;
        }
      }
      goto LABEL_9;
    }
    _HKInitializeLogging();
    id v16 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134218240;
      uint64_t v19 = *(void *)&a3;
      __int16 v20 = 2048;
      double v21 = a4;
      _os_log_impl(&dword_1D3B55000, v16, OS_LOG_TYPE_DEFAULT, "Not coaching to Monthly Challenge - progress (%ff) already matches or exceeds goal (%f).", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    _HKInitializeLogging();
    id v15 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1D3B55000, v15, OS_LOG_TYPE_DEFAULT, "Not coaching for Monthly Challenge progress", (uint8_t *)&v18, 2u);
    }
  }
  id v14 = 0;
LABEL_16:

  return v14;
}

id __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_385(uint64_t a1, double a2, double a3)
{
  if ((uint64_t)a2 == vcvtmd_s64_f64(a3 * 0.75))
  {
    id v4 = &FCSFirstGlanceAchievementProgressThreeQuartersIn;
LABEL_5:
    id v5 = *v4;
    goto LABEL_7;
  }
  if ((uint64_t)a3 - (uint64_t)a2 == 3)
  {
    id v4 = FCSFirstGlanceAchievementProgressThreeDaysAway;
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:
  id v6 = ValidMilestoneForExperienceType(v5, *(void *)(a1 + 32));

  return v6;
}

id __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_2(uint64_t a1, double a2, double a3)
{
  uint64_t v4 = (uint64_t)a3 - (uint64_t)a2;
  if (v4 == 1)
  {
    if (*(void *)(a1 + 32) == 1)
    {
      id v5 = FCSFirstGlanceAchievementProgressOneDayAway;
      goto LABEL_7;
    }
  }
  else if (v4 == 3 && *(void *)(a1 + 32) == 3)
  {
    id v5 = FCSFirstGlanceAchievementProgressThreeDaysAway;
LABEL_7:
    id v6 = *v5;
    goto LABEL_9;
  }
  id v6 = 0;
LABEL_9:
  id v7 = ValidMilestoneForExperienceType(v6, *(void *)(a1 + 40));

  return v7;
}

id __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_3(uint64_t a1, double a2, double a3)
{
  uint64_t v4 = (uint64_t)a3 - (uint64_t)a2;
  if (v4 == 1)
  {
    id v5 = FCSFirstGlanceAchievementProgressOneDayAway;
  }
  else
  {
    if (v4 != 3 || *(uint64_t *)(a1 + 32) < 3)
    {
      id v6 = 0;
      goto LABEL_8;
    }
    id v5 = FCSFirstGlanceAchievementProgressThreeDaysAway;
  }
  id v6 = *v5;
LABEL_8:
  id v7 = ValidMilestoneForExperienceType(v6, *(void *)(a1 + 40));

  return v7;
}

id __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_4(uint64_t a1, double a2, double a3)
{
  if ((uint64_t)a3 - (uint64_t)a2 == 1 && *(void *)(a1 + 32) == 1) {
    uint64_t v4 = @"ONE_AWAY";
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = ValidMilestoneForExperienceType(v4, *(void *)(a1 + 40));

  return v5;
}

uint64_t __181__FCSFirstGlanceAchievementEvaluator_progressAchievementAndMilestoneWithMonthlyChallengeAchievement_achievementsMap_currentDate_calendar_experienceType_isStandaloneMode_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

- (id)progressLocalizationKeyForAchievement:(id)a3 progressMilestone:(id)a4 experienceType:(unint64_t)a5
{
  progressLocalizationKeyOverride = self->_progressLocalizationKeyOverride;
  if (progressLocalizationKeyOverride)
  {
    id v6 = progressLocalizationKeyOverride;
  }
  else
  {
    id v8 = a4;
    unint64_t v9 = FCSFirstGlanceAchievementLocalizationBundle(a3);
    unint64_t v10 = [NSString stringWithFormat:@"ACHIEVEMENT_UNACHIEVED_PROGRESS_%@_DESC", v8];

    id v11 = FILocalizationTableForExperienceType();
    FIRandomKeyForPrefixWithTableName();
    id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)yesterdayLocalizationKeyForAchievement:(id)a3 experienceType:(unint64_t)a4
{
  yesterdayLocalizationKeyOverride = self->_yesterdayLocalizationKeyOverride;
  if (yesterdayLocalizationKeyOverride)
  {
    id v5 = yesterdayLocalizationKeyOverride;
  }
  else
  {
    id v6 = a3;
    id v7 = FCSFirstGlanceAchievementLocalizationBundle(v6);
    id v8 = @"ACHIEVEMENT_YESTERDAY_DESC";
    int IsLongestMoveStreakAchievement = FCSFirstGlanceAchievementIsLongestMoveStreakAchievement(v6);
    int IsMultipleOfTargetValue = FCSFirstGlanceAchievementValueIsMultipleOfTargetValue(v6, 50);

    if (IsLongestMoveStreakAchievement && IsMultipleOfTargetValue)
    {
      uint64_t v11 = [(__CFString *)v8 stringByAppendingString:@"_MILESTONE"];

      id v8 = (__CFString *)v11;
    }
    uint64_t v12 = FILocalizationTableForExperienceType();
    FIRandomKeyForPrefixWithTableName();
    id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)evaluateYesterdayAchievements:(id)a3 isStandaloneMode:(BOOL)a4
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__FCSFirstGlanceAchievementEvaluator_evaluateYesterdayAchievements_isStandaloneMode___block_invoke;
  v12[3] = &__block_descriptor_33_e24_B16__0__ACHAchievement_8l;
  BOOL v13 = a4;
  id v5 = objc_msgSend(a3, "hk_filter:", v12);
  id v6 = objc_msgSend(v5, "hk_filter:", &__block_literal_global_419);

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__FCSFirstGlanceAchievementEvaluator_evaluateYesterdayAchievements_isStandaloneMode___block_invoke_3;
  v10[3] = &__block_descriptor_33_e43_q24__0__ACHAchievement_8__ACHAchievement_16l;
  BOOL v11 = a4;
  id v7 = [v6 sortedArrayUsingComparator:v10];
  id v8 = [v7 firstObject];

  return v8;
}

BOOL __85__FCSFirstGlanceAchievementEvaluator_evaluateYesterdayAchievements_isStandaloneMode___block_invoke(uint64_t a1, void *a2)
{
  v2 = FCSFirstGlanceRankingForAchievement(a2, *(unsigned __int8 *)(a1 + 32));
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __85__FCSFirstGlanceAchievementEvaluator_evaluateYesterdayAchievements_isStandaloneMode___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  int IsLongestMoveStreakAchievement = FCSFirstGlanceAchievementIsLongestMoveStreakAchievement(v2);
  int IsLessThanTargetValue = FCSFirstGlanceAchievementValueIsLessThanTargetValue(v2, 50);
  unsigned int IsMultipleOfTargetValue = FCSFirstGlanceAchievementValueIsMultipleOfTargetValue(v2, 50);

  return IsLongestMoveStreakAchievement ^ 1 | IsLessThanTargetValue | IsMultipleOfTargetValue;
}

uint64_t __85__FCSFirstGlanceAchievementEvaluator_evaluateYesterdayAchievements_isStandaloneMode___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  int v5 = *(unsigned __int8 *)(a1 + 32);
  id v6 = a3;
  id v7 = FCSFirstGlanceRankingForAchievement(a2, v5);
  id v8 = FCSFirstGlanceRankingForAchievement(v6, *(unsigned __int8 *)(a1 + 32));

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

- (void)_firstAchievementMatchingLifetimeGoalsWithNames:(id)a3 amongstAchievements:(id)a4 experienceType:(unint64_t)a5 reachedMilestoneCompletion:(id)a6
{
  id v10 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __148__FCSFirstGlanceAchievementEvaluator__firstAchievementMatchingLifetimeGoalsWithNames_amongstAchievements_experienceType_reachedMilestoneCompletion___block_invoke;
  aBlock[3] = &__block_descriptor_40_e40___NSString_32__0__ACHAchievement_8d16d24l;
  aBlock[4] = a5;
  id v11 = a6;
  id v12 = a3;
  BOOL v13 = _Block_copy(aBlock);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  int v18 = __148__FCSFirstGlanceAchievementEvaluator__firstAchievementMatchingLifetimeGoalsWithNames_amongstAchievements_experienceType_reachedMilestoneCompletion___block_invoke_2;
  uint64_t v19 = &unk_1E69B9EF8;
  id v20 = v10;
  id v14 = v10;
  id v15 = objc_msgSend(v12, "hk_map:", &v16);

  -[FCSFirstGlanceAchievementEvaluator _firstAchievementFromAchievements:passingMilestoneTest:completion:](self, "_firstAchievementFromAchievements:passingMilestoneTest:completion:", v15, v13, v11, v16, v17, v18, v19);
}

id __148__FCSFirstGlanceAchievementEvaluator__firstAchievementMatchingLifetimeGoalsWithNames_amongstAchievements_experienceType_reachedMilestoneCompletion___block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v4 = (uint64_t)a3 - (uint64_t)a2;
  if (v4 == 3)
  {
    int v5 = FCSFirstGlanceAchievementProgressThreeDaysAway;
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    int v5 = FCSFirstGlanceAchievementProgressOneDayAway;
LABEL_5:
    id v6 = *v5;
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:
  id v7 = ValidMilestoneForExperienceType(v6, *(void *)(a1 + 32));

  return v7;
}

id __148__FCSFirstGlanceAchievementEvaluator__firstAchievementMatchingLifetimeGoalsWithNames_amongstAchievements_experienceType_reachedMilestoneCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if ([v2 earnedInstanceCount]) {
    id v3 = 0;
  }
  else {
    id v3 = v2;
  }

  return v3;
}

- (void)_firstAchievementFromAchievements:(id)a3 passingMilestoneTest:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void *, double, double))a4;
  id v29 = a5;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v31;
    id v28 = &v35;
    BOOL v13 = (os_log_t *)MEMORY[0x1E4F29F08];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "template", v28);
        uint64_t v17 = [v16 canonicalUnit];

        if (v17)
        {
          int v18 = [v15 goal];
          [v18 doubleValueForUnit:v17];
          double v20 = v19;

          double v21 = [v15 progress];
          [v21 doubleValueForUnit:v17];
          double v23 = v22;

          if (FCSFirstGlanceAchievementCanCoachWithProgressAndGoal((uint64_t)v23, (uint64_t)v20))
          {
            uint64_t v24 = v8[2](v8, v15, v23, v20);
            if (v24)
            {
              v26 = (void *)v24;
              uint64_t v27 = v29;
              (*((void (**)(id, void *, uint64_t))v29 + 2))(v29, v15, v24);

              goto LABEL_15;
            }
          }
        }
        else
        {
          _HKInitializeLogging();
          os_log_t v25 = *v13;
          if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR)) {
            -[FCSFirstGlanceAchievementEvaluator _firstAchievementFromAchievements:passingMilestoneTest:completion:](v34, v25, v15, v28);
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v11);
  }

  uint64_t v27 = v29;
  (*((void (**)(id, void, void))v29 + 2))(v29, 0, 0);
LABEL_15:
}

- (void)setLocalizationKeyOverride:(id)a3
{
  int v5 = (NSString *)a3;
  objc_storeStrong((id *)&self->_progressLocalizationKeyOverride, a3);
  yesterdayLocalizationKeyOverride = self->_yesterdayLocalizationKeyOverride;
  self->_yesterdayLocalizationKeyOverride = v5;
}

- (FCSFirstGlanceAchievementEvaluatorDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (FCSFirstGlanceAchievementEvaluatorDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_yesterdayLocalizationKeyOverride, 0);
  objc_storeStrong((id *)&self->_progressLocalizationKeyOverride, 0);
}

- (void)_firstAchievementFromAchievements:(void *)a3 passingMilestoneTest:(void *)a4 completion:.cold.1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = [a3 template];
  id v9 = [v8 uniqueName];
  *(_DWORD *)a1 = 138543362;
  *a4 = v9;
  _os_log_error_impl(&dword_1D3B55000, v7, OS_LOG_TYPE_ERROR, "Achievement missing canonical unit, can't evaluating for coaching: %{public}@", a1, 0xCu);
}

@end