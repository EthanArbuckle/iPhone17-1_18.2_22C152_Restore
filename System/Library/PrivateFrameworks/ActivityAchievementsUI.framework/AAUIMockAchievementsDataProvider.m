@interface AAUIMockAchievementsDataProvider
- (AAUIMockAchievementsDataProvider)init;
- (id)_ACHDateComponentIntervalWithMonthOffset:(unint64_t)a3;
- (id)_achievementForTemplate:(id)a3 earnedInstanceCount:(int64_t)a4 earnedInstanceOffset:(int64_t)a5 earnedInstanceValue:(int64_t)a6 goalValue:(int64_t)a7 progressValue:(int64_t)a8;
- (id)_currentMonthlyChallengeAchievementForTemplate:(id)a3 localizableSuffix:(id)a4 goalValue:(int64_t)a5 progressValue:(int64_t)a6 isEarned:(BOOL)a7;
- (id)_dateComponentsWithDayOffset:(int64_t)a3;
- (id)_distanceUnitForLocale:(id)a3;
- (id)_fitnessUIAssetsURLWithKey:(id)a3 value:(id)a4;
- (id)_monthStringFromTemplateName:(id)a3;
- (id)achievementAtIndexPath:(id)a3;
- (id)headerStringForSection:(int64_t)a3 isRecentAndRelevant:(BOOL)a4;
- (id)recentAndRelevantAchievementAtIndexPath:(id)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
@end

@implementation AAUIMockAchievementsDataProvider

- (AAUIMockAchievementsDataProvider)init
{
  v84[7] = *MEMORY[0x263EF8340];
  v78.receiver = self;
  v78.super_class = (Class)AAUIMockAchievementsDataProvider;
  v2 = [(AAUIMockAchievementsDataProvider *)&v78 init];
  if (v2)
  {
    v3 = BestWorkoutEnergyBurnedTemplateForWorkoutActivityType();
    v53 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v3 earnedInstanceCount:1 earnedInstanceOffset:-7 earnedInstanceValue:460 goalValue:0 progressValue:0];

    v57 = [(AAUIMockAchievementsDataProvider *)v2 _ACHDateComponentIntervalWithMonthOffset:0];
    v4 = ACHMonthlyChallengeTypeTotalWorkoutsTemplate();
    uint64_t v5 = [(AAUIMockAchievementsDataProvider *)v2 _currentMonthlyChallengeAchievementForTemplate:v4 localizableSuffix:@"TotalWorkouts" goalValue:29 progressValue:21 isEarned:0];

    v56 = [(AAUIMockAchievementsDataProvider *)v2 _ACHDateComponentIntervalWithMonthOffset:-3];
    v6 = ACHMonthlyChallengeTypeStandRingTemplate();
    v77 = [(AAUIMockAchievementsDataProvider *)v2 _currentMonthlyChallengeAchievementForTemplate:v6 localizableSuffix:@"StandRing" goalValue:21 progressValue:21 isEarned:1];

    v55 = [(AAUIMockAchievementsDataProvider *)v2 _ACHDateComponentIntervalWithMonthOffset:-2];
    v7 = ACHMonthlyChallengeTypeTotalDistanceTemplate();
    v76 = [(AAUIMockAchievementsDataProvider *)v2 _currentMonthlyChallengeAchievementForTemplate:v7 localizableSuffix:@"TotalDistance" goalValue:146 progressValue:146 isEarned:1];

    v54 = [(AAUIMockAchievementsDataProvider *)v2 _ACHDateComponentIntervalWithMonthOffset:-1];
    v8 = ACHMonthlyChallengeTypeMoveRingTemplate();
    v51 = [(AAUIMockAchievementsDataProvider *)v2 _currentMonthlyChallengeAchievementForTemplate:v8 localizableSuffix:@"MoveRing" goalValue:24 progressValue:24 isEarned:1];

    v9 = DailyMoveRecordTemplate();
    v75 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v9 earnedInstanceCount:1 earnedInstanceOffset:-210 earnedInstanceValue:0 goalValue:721 progressValue:0];

    v10 = DailyExerciseRecordTemplate();
    v73 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v10 earnedInstanceCount:1 earnedInstanceOffset:-205 earnedInstanceValue:0 goalValue:53 progressValue:14];

    v11 = MoveGoal200PercentTemplate();
    v74 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v11 earnedInstanceCount:0 earnedInstanceOffset:0 earnedInstanceValue:0 goalValue:500 progressValue:324];

    v12 = MoveGoal300PercentTemplate();
    v68 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v12 earnedInstanceCount:0 earnedInstanceOffset:0 earnedInstanceValue:0 goalValue:500 progressValue:324];

    v13 = MoveGoal400PercentTemplate();
    v72 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v13 earnedInstanceCount:0 earnedInstanceOffset:0 earnedInstanceValue:0 goalValue:500 progressValue:324];

    v14 = LongestMoveStreakTemplate();
    v49 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v14 earnedInstanceCount:1 earnedInstanceOffset:-14 earnedInstanceValue:36 goalValue:0 progressValue:0];

    v15 = PerfectWeekMoveTemplate();
    v71 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v15 earnedInstanceCount:24 earnedInstanceOffset:-14 earnedInstanceValue:0 goalValue:0 progressValue:0];

    v16 = PerfectWeekExerciseTemplate();
    v70 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v16 earnedInstanceCount:32 earnedInstanceOffset:-21 earnedInstanceValue:0 goalValue:0 progressValue:0];

    v17 = PerfectWeekStandTemplate();
    v69 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v17 earnedInstanceCount:17 earnedInstanceOffset:-35 earnedInstanceValue:0 goalValue:0 progressValue:0];

    v18 = PerfectWeekAllTemplate();
    v48 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v18 earnedInstanceCount:15 earnedInstanceOffset:-42 earnedInstanceValue:0 goalValue:0 progressValue:0];

    v19 = HundredMoveGoals();
    v67 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v19 earnedInstanceCount:1 earnedInstanceOffset:-63 earnedInstanceValue:0 goalValue:0 progressValue:0];

    v20 = FiveHundredMoveGoals();
    v66 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v20 earnedInstanceCount:0 earnedInstanceOffset:0 earnedInstanceValue:0 goalValue:0 progressValue:256];

    v21 = ThousandMoveGoals();
    v46 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v21 earnedInstanceCount:0 earnedInstanceOffset:0 earnedInstanceValue:0 goalValue:0 progressValue:256];

    v22 = SevenWorkoutWeekTemplate();
    v65 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v22 earnedInstanceCount:0 earnedInstanceOffset:0 earnedInstanceValue:0 goalValue:0 progressValue:1];

    v23 = FirstWorkoutTemplateForWorkoutActivityType();
    v64 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v23 earnedInstanceCount:1 earnedInstanceOffset:-210 earnedInstanceValue:0 goalValue:0 progressValue:0];

    v24 = FirstWorkoutTemplateForWorkoutActivityType();
    v63 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v24 earnedInstanceCount:1 earnedInstanceOffset:-270 earnedInstanceValue:0 goalValue:0 progressValue:0];

    v25 = FirstWorkoutTemplateForWorkoutActivityType();
    v61 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v25 earnedInstanceCount:1 earnedInstanceOffset:-90 earnedInstanceValue:0 goalValue:0 progressValue:0];

    v26 = FirstWorkoutTemplateForWorkoutActivityType();
    v62 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v26 earnedInstanceCount:1 earnedInstanceOffset:-120 earnedInstanceValue:0 goalValue:0 progressValue:0];

    v27 = FirstWorkoutTemplateForWorkoutActivityType();
    v58 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v27 earnedInstanceCount:1 earnedInstanceOffset:-90 earnedInstanceValue:0 goalValue:0 progressValue:0];

    v28 = FirstWorkoutTemplateForWorkoutActivityType();
    v60 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v28 earnedInstanceCount:1 earnedInstanceOffset:-300 earnedInstanceValue:0 goalValue:0 progressValue:0];

    v29 = BestWorkoutEnergyBurnedTemplateForWorkoutActivityType();
    v59 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v29 earnedInstanceCount:1 earnedInstanceOffset:-14 earnedInstanceValue:441 goalValue:0 progressValue:0];

    v30 = BestWorkoutEnergyBurnedTemplateForWorkoutActivityType();
    v50 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v30 earnedInstanceCount:1 earnedInstanceOffset:-7 earnedInstanceValue:461 goalValue:0 progressValue:0];

    v31 = BestWorkoutEnergyBurnedTemplateForWorkoutActivityType();
    v32 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v31 earnedInstanceCount:1 earnedInstanceOffset:-21 earnedInstanceValue:342 goalValue:0 progressValue:0];

    v33 = BestWorkoutEnergyBurnedTemplateForWorkoutActivityType();
    v47 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v33 earnedInstanceCount:1 earnedInstanceOffset:-28 earnedInstanceValue:205 goalValue:0 progressValue:0];

    v34 = BestWorkoutEnergyBurnedTemplateForWorkoutActivityType();
    v44 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v34 earnedInstanceCount:1 earnedInstanceOffset:-35 earnedInstanceValue:276 goalValue:0 progressValue:0];

    v35 = BestWorkoutEnergyBurnedTemplateForWorkoutActivityType();
    v42 = [(AAUIMockAchievementsDataProvider *)v2 _achievementForTemplate:v35 earnedInstanceCount:1 earnedInstanceOffset:-56 earnedInstanceValue:456 goalValue:0 progressValue:0];

    v83 = v53;
    v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v83 count:1];
    v84[0] = v45;
    v52 = (void *)v5;
    uint64_t v82 = v5;
    v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v82 count:1];
    v84[1] = v43;
    v84[2] = MEMORY[0x263EFFA68];
    v84[3] = MEMORY[0x263EFFA68];
    v81[0] = v77;
    v81[1] = v76;
    v81[2] = v51;
    v81[3] = v5;
    v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:4];
    v84[4] = v36;
    v80[0] = v75;
    v80[1] = v73;
    v80[2] = v74;
    v80[3] = v68;
    v80[4] = v72;
    v80[5] = v49;
    v80[6] = v71;
    v80[7] = v70;
    v80[8] = v69;
    v80[9] = v48;
    v80[10] = v67;
    v80[11] = v66;
    v80[12] = v46;
    v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:13];
    v84[5] = v37;
    v79[0] = v65;
    v79[1] = v64;
    v79[2] = v63;
    v79[3] = v61;
    v79[4] = v62;
    v79[5] = v58;
    v79[6] = v60;
    v79[7] = v59;
    v79[8] = v50;
    v79[9] = v32;
    v79[10] = v47;
    v79[11] = v44;
    v79[12] = v42;
    v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:13];
    v84[6] = v38;
    uint64_t v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:7];
    achievements = v2->_achievements;
    v2->_achievements = (NSArray *)v39;
  }
  return v2;
}

- (id)recentAndRelevantAchievementAtIndexPath:(id)a3
{
  achievements = self->_achievements;
  id v4 = a3;
  uint64_t v5 = -[NSArray objectAtIndexedSubscript:](achievements, "objectAtIndexedSubscript:", [v4 section]);
  uint64_t v6 = [v4 row];

  v7 = [v5 objectAtIndexedSubscript:v6];

  return v7;
}

- (id)achievementAtIndexPath:(id)a3
{
  achievements = self->_achievements;
  id v4 = a3;
  uint64_t v5 = -[NSArray objectAtIndexedSubscript:](achievements, "objectAtIndexedSubscript:", [v4 section]);
  uint64_t v6 = [v4 row];

  v7 = [v5 objectAtIndexedSubscript:v6];

  return v7;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  v3 = [(NSArray *)self->_achievements objectAtIndexedSubscript:a3];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)numberOfSections
{
  return [(NSArray *)self->_achievements count];
}

- (id)headerStringForSection:(int64_t)a3 isRecentAndRelevant:(BOOL)a4
{
  v23[7] = *MEMORY[0x263EF8340];
  v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v21 = [v22 localizedStringForKey:@"RECENT" value:&stru_26DD6AF88 table:@"Localizable"];
  v20 = [v21 localizedUppercaseString];
  v23[0] = v20;
  v23[1] = &stru_26DD6AF88;
  v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v17 = [v19 localizedStringForKey:*MEMORY[0x263F23420] value:&stru_26DD6AF88 table:@"Localizable"];
  v16 = [v17 localizedUppercaseString];
  v23[2] = v16;
  v23[3] = &stru_26DD6AF88;
  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int64_t v4 = [v15 localizedStringForKey:*MEMORY[0x263F23438] value:&stru_26DD6AF88 table:@"Localizable"];
  uint64_t v5 = [v4 localizedUppercaseString];
  v23[4] = v5;
  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:*MEMORY[0x263F23418] value:&stru_26DD6AF88 table:@"Localizable"];
  v8 = [v7 localizedUppercaseString];
  v23[5] = v8;
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:*MEMORY[0x263F23440] value:&stru_26DD6AF88 table:@"Localizable"];
  v11 = [v10 localizedUppercaseString];
  v23[6] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:7];
  v13 = [v12 objectAtIndexedSubscript:a3];

  return v13;
}

- (id)_achievementForTemplate:(id)a3 earnedInstanceCount:(int64_t)a4 earnedInstanceOffset:(int64_t)a5 earnedInstanceValue:(int64_t)a6 goalValue:(int64_t)a7 progressValue:(int64_t)a8
{
  id v14 = a3;
  if (ACHShouldUseNewAwardsSystem())
  {
    if (a4 < 1)
    {
      id v15 = 0;
    }
    else
    {
      id v15 = objc_alloc_init(MEMORY[0x263F236B8]);
      v16 = [v14 uniqueName];
      [v15 setTemplateUniqueName:v16];

      v17 = [(AAUIMockAchievementsDataProvider *)self _dateComponentsWithDayOffset:a5];
      [v15 setEarnedDateComponents:v17];

      v18 = [NSNumber numberWithInteger:a6];
      v19 = [v14 canonicalUnit];
      v20 = ACHHKQuantityWithValueAndUnit();
      [v15 setValue:v20];
    }
    v35 = (void *)[objc_alloc(MEMORY[0x263F23630]) initWithTemplate:v14 relevantEarnedInstance:v15 earnedInstanceCount:a4];
    v51 = [NSNumber numberWithInteger:a7];
    v52 = [v14 canonicalUnit];
    v53 = ACHHKQuantityWithValueAndUnit();
    [v35 setGoal:v53];

    v54 = [NSNumber numberWithInteger:a8];
    v55 = [v14 canonicalUnit];
    v56 = ACHHKQuantityWithValueAndUnit();
    [v35 setProgress:v56];

    v57 = [v35 template];
    v58 = [v57 uniqueName];
    v59 = [(AAUIMockAchievementsDataProvider *)self _fitnessUIAssetsURLWithKey:@"%@/localization/" value:v58];
    [v35 setLocalizationBundleURL:v59];

    v60 = [v35 template];
    v61 = [v60 uniqueName];
    v62 = [(AAUIMockAchievementsDataProvider *)self _fitnessUIAssetsURLWithKey:@"%@/badgemodel/" value:v61];
    [v35 setResourceBundleURL:v62];

    v48 = [v35 template];
    v49 = [v48 uniqueName];
    v50 = [(AAUIMockAchievementsDataProvider *)self _fitnessUIAssetsURLWithKey:@"%@/badgeproperties/" value:v49];
    [v35 setPropertyListBundleURL:v50];
  }
  else
  {
    int64_t v64 = a7;
    int64_t v65 = a8;
    id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v15 = v21;
    unint64_t v22 = 0x263F08000uLL;
    v23 = v14;
    v67 = self;
    if (a4 >= 1)
    {
      unsigned int v24 = 0;
      v66 = v21;
      do
      {
        id v25 = objc_alloc_init(MEMORY[0x263F236B8]);
        v26 = [v23 uniqueName];
        [v25 setTemplateUniqueName:v26];

        v27 = [(AAUIMockAchievementsDataProvider *)v67 _dateComponentsWithDayOffset:a5 - v24];
        [v25 setEarnedDateComponents:v27];

        v28 = [*(id *)(v22 + 2584) numberWithInteger:a6];
        [v23 canonicalUnit];
        v29 = v23;
        int64_t v30 = a5;
        int64_t v31 = a6;
        v33 = unint64_t v32 = v22;
        v34 = ACHHKQuantityWithValueAndUnit();
        [v25 setValue:v34];

        unint64_t v22 = v32;
        a6 = v31;
        a5 = v30;
        v23 = v29;

        id v15 = v66;
        [v66 insertObject:v25 atIndex:0];

        v24 += 7;
        --a4;
      }
      while (a4);
    }
    v35 = (void *)[objc_alloc(MEMORY[0x263F23630]) initWithTemplate:v23 earnedInstances:v15];
    v36 = [*(id *)(v22 + 2584) numberWithInteger:v64];
    v37 = [v23 canonicalUnit];
    v38 = ACHHKQuantityWithValueAndUnit();
    [v35 setGoal:v38];

    uint64_t v39 = [*(id *)(v22 + 2584) numberWithInteger:v65];
    v40 = [v23 canonicalUnit];
    v41 = ACHHKQuantityWithValueAndUnit();
    [v35 setProgress:v41];

    v42 = [v35 template];
    v43 = [v42 uniqueName];
    v44 = [(AAUIMockAchievementsDataProvider *)v67 _fitnessUIAssetsURLWithKey:@"%@/localization/" value:v43];
    [v35 setLocalizationBundleURL:v44];

    v45 = [v35 template];
    v46 = [v45 uniqueName];
    v47 = [(AAUIMockAchievementsDataProvider *)v67 _fitnessUIAssetsURLWithKey:@"%@/badgemodel/" value:v46];
    [v35 setResourceBundleURL:v47];

    v48 = [v35 template];
    v49 = [v48 uniqueName];
    v50 = [(AAUIMockAchievementsDataProvider *)v67 _fitnessUIAssetsURLWithKey:@"%@/badgeproperties/" value:v49];
    [v35 setPropertyListBundleURL:v50];
    id v14 = v23;
  }

  ACHApplyBadgePropertiesToAchievement();
  return v35;
}

- (id)_currentMonthlyChallengeAchievementForTemplate:(id)a3 localizableSuffix:(id)a4 goalValue:(int64_t)a5 progressValue:(int64_t)a6 isEarned:(BOOL)a7
{
  BOOL v7 = a7;
  v44[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  if (ACHShouldUseNewAwardsSystem())
  {
    if (v7)
    {
      id v14 = objc_alloc_init(MEMORY[0x263F236B8]);
      id v15 = [v12 uniqueName];
      [v14 setTemplateUniqueName:v15];

      v16 = [v12 availabilityEnd];
      [v14 setEarnedDateComponents:v16];

      v17 = [v12 canonicalUnit];
      if ([v17 _isMetricDistance])
      {
        v18 = [MEMORY[0x263EFF960] currentLocale];
        v19 = [(AAUIMockAchievementsDataProvider *)self _distanceUnitForLocale:v18];
      }
      else
      {
        v19 = [v12 canonicalUnit];
      }

      v27 = [NSNumber numberWithInteger:a6];
      v28 = ACHHKQuantityWithValueAndUnit();
      [v14 setValue:v28];
    }
    else
    {
      id v14 = 0;
    }
    v29 = (void *)[objc_alloc(MEMORY[0x263F23630]) initWithTemplate:v12 relevantEarnedInstance:v14 earnedInstanceCount:v14 != 0];
    unint64_t v20 = 0x263F08000;
  }
  else
  {
    unint64_t v20 = 0x263F08000uLL;
    if (v7)
    {
      id v21 = objc_alloc_init(MEMORY[0x263F236B8]);
      unint64_t v22 = [v12 uniqueName];
      [v21 setTemplateUniqueName:v22];

      v23 = [v12 availabilityEnd];
      [v21 setEarnedDateComponents:v23];

      unsigned int v24 = [v12 canonicalUnit];
      if ([v24 _isMetricDistance])
      {
        id v25 = [MEMORY[0x263EFF960] currentLocale];
        v26 = [(AAUIMockAchievementsDataProvider *)self _distanceUnitForLocale:v25];
      }
      else
      {
        v26 = [v12 canonicalUnit];
      }

      int64_t v30 = [NSNumber numberWithInteger:a6];
      int64_t v31 = ACHHKQuantityWithValueAndUnit();
      [v21 setValue:v31];

      v44[0] = v21;
      id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:1];
    }
    else
    {
      id v14 = (id)MEMORY[0x263EFFA68];
    }
    v29 = (void *)[objc_alloc(MEMORY[0x263F23630]) initWithTemplate:v12 earnedInstances:v14];
  }
  unint64_t v32 = [*(id *)(v20 + 2584) numberWithInteger:a5];
  v33 = [v12 canonicalUnit];
  v34 = ACHHKQuantityWithValueAndUnit();
  [v29 setGoal:v34];

  v35 = [*(id *)(v20 + 2584) numberWithInteger:a6];
  v36 = [v12 canonicalUnit];
  v37 = ACHHKQuantityWithValueAndUnit();
  [v29 setProgress:v37];

  v38 = [v12 uniqueName];
  uint64_t v39 = [(AAUIMockAchievementsDataProvider *)self _monthStringFromTemplateName:v38];

  v40 = [(AAUIMockAchievementsDataProvider *)self _fitnessUIAssetsURLWithKey:@"MonthlyAchievements/localization/challenge/%@/" value:v13];

  [v29 setLocalizationBundleURL:v40];
  v41 = [(AAUIMockAchievementsDataProvider *)self _fitnessUIAssetsURLWithKey:@"MonthlyAchievements/models/%@/badgemodel/" value:v39];
  [v29 setResourceBundleURL:v41];

  v42 = [(AAUIMockAchievementsDataProvider *)self _fitnessUIAssetsURLWithKey:@"MonthlyAchievements/models/%@/badgeproperties/challenge/" value:v39];
  [v29 setPropertyListBundleURL:v42];

  ACHApplyBadgePropertiesToAchievement();
  return v29;
}

- (id)_fitnessUIAssetsURLWithKey:(id)a3 value:(id)a4
{
  id v5 = a3;
  id v15 = 0;
  uint64_t v6 = [NSString stringWithValidatedFormat:v5, @"%@", &v15, a4 validFormatSpecifiers error];
  id v7 = v15;
  v8 = v7;
  if (v6) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (!v9)
  {
    v10 = ACHLogDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AAUIMockAchievementsDataProvider _fitnessUIAssetsURLWithKey:value:]((uint64_t)v5, (uint64_t)v8, v10);
    }
  }
  v11 = NSURL;
  id v12 = [@"file:///System/Library/Health/Assets/FitnessUIAssets.bundle/ActivityAchievements/" stringByAppendingString:v6];
  id v13 = [v11 URLWithString:v12];

  return v13;
}

- (id)_dateComponentsWithDayOffset:(int64_t)a3
{
  int64_t v4 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v5 = [MEMORY[0x263EFF910] date];
  uint64_t v6 = objc_msgSend(v4, "hk_startOfDateByAddingDays:toDate:", a3, v5);
  id v7 = [v4 components:*MEMORY[0x263F234C0] fromDate:v6];

  return v7;
}

- (id)_ACHDateComponentIntervalWithMonthOffset:(unint64_t)a3
{
  int64_t v4 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v5 = [MEMORY[0x263EFF910] date];
  uint64_t v6 = objc_msgSend(v4, "hk_startOfMonthForDate:addingMonths:", v5, a3);
  id v7 = objc_msgSend(v4, "hk_startOfMonthForDate:addingMonths:", v5, a3 + 1);
  v8 = objc_msgSend(v4, "hk_startOfDateBySubtractingDays:fromDate:", 1, v7);
  uint64_t v9 = *MEMORY[0x263F234C0];
  v10 = [v4 components:*MEMORY[0x263F234C0] fromDate:v6];
  v11 = [v4 components:v9 fromDate:v8];
  id v12 = (void *)[objc_alloc(MEMORY[0x263F236B0]) initWithStartDateComponents:v10 endDateComponents:v11];

  return v12;
}

- (id)_monthStringFromTemplateName:(id)a3
{
  v3 = [a3 componentsSeparatedByString:@"_"];
  int64_t v4 = NSString;
  id v5 = [v3 objectAtIndexedSubscript:1];
  uint64_t v6 = [v3 objectAtIndexedSubscript:2];
  id v7 = [v4 stringWithFormat:@"%@_%@", v5, v6];

  return v7;
}

- (id)_distanceUnitForLocale:(id)a3
{
  v3 = [a3 objectForKey:*MEMORY[0x263EFF560]];
  int v4 = [v3 BOOLValue];

  if (v4) {
    [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:9];
  }
  else {
  id v5 = [MEMORY[0x263F0A830] mileUnit];
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (void)_fitnessUIAssetsURLWithKey:(os_log_t)log value:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_229290000, log, OS_LOG_TYPE_ERROR, "Error formatting assets URL with key (%@): %@", (uint8_t *)&v3, 0x16u);
}

@end