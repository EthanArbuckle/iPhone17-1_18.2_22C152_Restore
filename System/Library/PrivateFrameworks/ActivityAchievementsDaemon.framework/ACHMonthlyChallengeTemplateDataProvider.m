@interface ACHMonthlyChallengeTemplateDataProvider
- (ACHAchievementStoring)achievementStore;
- (ACHActivitySummaryIterator)activitySummaryIterator;
- (ACHActivitySummaryUtility)activitySummaryUtility;
- (ACHEarnedInstanceStore)earnedInstanceStore;
- (ACHMonthlyChallengeTemplateDataProvider)initWithHealthStore:(id)a3 earnedInstanceStore:(id)a4 templateStore:(id)a5 activitySummaryIterator:(id)a6;
- (ACHMonthlyChallengeTemplateDataProvider)initWithProfile:(id)a3 achievementStore:(id)a4 activitySummaryUtility:(id)a5;
- (ACHTemplateStore)templateStore;
- (BOOL)hasMinimumActiveDays;
- (BOOL)hasMinimumActiveDaysWithError:(id *)a3;
- (BOOL)isDate:(id)a3 betweenStartDate:(id)a4 andEndDate:(id)a5;
- (BOOL)isUsingNewAwardingSystem;
- (BOOL)isWheelchairUser;
- (BOOL)isWheelchairUserWithError:(id *)a3;
- (BOOL)monthlyChallengeExistsForMonth:(id)a3;
- (HDProfile)profile;
- (HKHealthStore)healthStore;
- (NSCalendar)currentCalendar;
- (NSDate)currentDate;
- (id)existingMonthlyChallengeTemplates;
- (int64_t)currentActivityMoveMode;
- (int64_t)currentActivityMoveModeWithError:(id *)a3;
- (int64_t)numberOfEarnedInstancesOfTemplateWithUniqueName:(id)a3 inDateComponentInterval:(id)a4 withCalendar:(id)a5 error:(id *)a6;
- (unint64_t)currentExperienceType;
- (unint64_t)currentExperienceTypeWithError:(id *)a3;
- (unint64_t)monthlyChallengeTypeForMonth:(id)a3;
- (void)setAchievementStore:(id)a3;
- (void)setActivitySummaryIterator:(id)a3;
- (void)setActivitySummaryUtility:(id)a3;
- (void)setCurrentCalendar:(id)a3;
- (void)setCurrentCalendarOverride:(id)a3;
- (void)setCurrentDate:(id)a3;
- (void)setCurrentDateOverride:(id)a3;
- (void)setEarnedInstanceStore:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setMoveModeOverride:(int64_t)a3;
- (void)setProfile:(id)a3;
- (void)setTemplateStore:(id)a3;
@end

@implementation ACHMonthlyChallengeTemplateDataProvider

- (ACHMonthlyChallengeTemplateDataProvider)initWithHealthStore:(id)a3 earnedInstanceStore:(id)a4 templateStore:(id)a5 activitySummaryIterator:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ACHMonthlyChallengeTemplateDataProvider;
  v15 = [(ACHMonthlyChallengeTemplateDataProvider *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_healthStore, a3);
    objc_storeStrong((id *)&v16->_earnedInstanceStore, a4);
    objc_storeStrong((id *)&v16->_templateStore, a5);
    uint64_t v17 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendarWithLocalTimeZone");
    currentCalendar = v16->_currentCalendar;
    v16->_currentCalendar = (NSCalendar *)v17;

    uint64_t v19 = [MEMORY[0x263EFF910] date];
    currentDate = v16->_currentDate;
    v16->_currentDate = (NSDate *)v19;

    objc_storeStrong((id *)&v16->_activitySummaryIterator, a6);
  }

  return v16;
}

- (ACHMonthlyChallengeTemplateDataProvider)initWithProfile:(id)a3 achievementStore:(id)a4 activitySummaryUtility:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ACHMonthlyChallengeTemplateDataProvider;
  id v11 = [(ACHMonthlyChallengeTemplateDataProvider *)&v16 init];
  id v12 = v11;
  if (v11)
  {
    [(ACHMonthlyChallengeTemplateDataProvider *)v11 setProfile:v8];
    [(ACHMonthlyChallengeTemplateDataProvider *)v12 setAchievementStore:v9];
    id v13 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendarWithLocalTimeZone");
    [(ACHMonthlyChallengeTemplateDataProvider *)v12 setCurrentCalendar:v13];

    id v14 = [MEMORY[0x263EFF910] date];
    [(ACHMonthlyChallengeTemplateDataProvider *)v12 setCurrentDate:v14];

    [(ACHMonthlyChallengeTemplateDataProvider *)v12 setActivitySummaryUtility:v10];
  }

  return v12;
}

- (BOOL)isUsingNewAwardingSystem
{
  v2 = [(ACHMonthlyChallengeTemplateDataProvider *)self healthStore];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)numberOfEarnedInstancesOfTemplateWithUniqueName:(id)a3 inDateComponentInterval:(id)a4 withCalendar:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  if ([(ACHMonthlyChallengeTemplateDataProvider *)self isUsingNewAwardingSystem])
  {
    id v13 = [(ACHMonthlyChallengeTemplateDataProvider *)self earnedInstanceStore];
    int64_t v14 = [v13 countOfEarnedInstancesForTemplateUniqueName:v10 inDateComponentInterval:v12 withCalendar:v11 error:a6];
  }
  else
  {
    v15 = [MEMORY[0x263EFF980] array];
    objc_super v16 = [(ACHMonthlyChallengeTemplateDataProvider *)self achievementStore];
    uint64_t v17 = [v16 allAchievements];
    v18 = [v17 allObjects];

    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __134__ACHMonthlyChallengeTemplateDataProvider_numberOfEarnedInstancesOfTemplateWithUniqueName_inDateComponentInterval_withCalendar_error___block_invoke;
    v37[3] = &unk_264516EB8;
    id v38 = v10;
    uint64_t v19 = objc_msgSend(v18, "hk_filter:", v37);
    v20 = [v12 startDateComponents];
    v21 = [v11 dateFromComponents:v20];

    objc_super v22 = [v12 endDateComponents];

    v23 = [v11 dateFromComponents:v22];

    uint64_t v28 = MEMORY[0x263EF8330];
    uint64_t v29 = 3221225472;
    v30 = __134__ACHMonthlyChallengeTemplateDataProvider_numberOfEarnedInstancesOfTemplateWithUniqueName_inDateComponentInterval_withCalendar_error___block_invoke_2;
    v31 = &unk_2645173B8;
    id v32 = v11;
    v33 = self;
    id v34 = v21;
    id v35 = v23;
    id v36 = v15;
    id v24 = v15;
    id v25 = v23;
    id v26 = v21;
    [v19 enumerateObjectsUsingBlock:&v28];
    int64_t v14 = objc_msgSend(v24, "count", v28, v29, v30, v31);
  }
  return v14;
}

uint64_t __134__ACHMonthlyChallengeTemplateDataProvider_numberOfEarnedInstancesOfTemplateWithUniqueName_inDateComponentInterval_withCalendar_error___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 template];
  v4 = [v3 uniqueName];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

void __134__ACHMonthlyChallengeTemplateDataProvider_numberOfEarnedInstancesOfTemplateWithUniqueName_inDateComponentInterval_withCalendar_error___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 earnedInstances];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __134__ACHMonthlyChallengeTemplateDataProvider_numberOfEarnedInstancesOfTemplateWithUniqueName_inDateComponentInterval_withCalendar_error___block_invoke_3;
  id v11 = &unk_264517390;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  id v12 = v4;
  uint64_t v13 = v5;
  id v14 = v6;
  id v15 = *(id *)(a1 + 56);
  v7 = objc_msgSend(v3, "hk_filter:", &v8);
  objc_msgSend(*(id *)(a1 + 64), "addObjectsFromArray:", v7, v8, v9, v10, v11);
}

uint64_t __134__ACHMonthlyChallengeTemplateDataProvider_numberOfEarnedInstancesOfTemplateWithUniqueName_inDateComponentInterval_withCalendar_error___block_invoke_3(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = [a2 earnedDateComponents];
  uint64_t v5 = [v3 dateFromComponents:v4];

  uint64_t v6 = [*(id *)(a1 + 40) isDate:v5 betweenStartDate:*(void *)(a1 + 48) andEndDate:*(void *)(a1 + 56)];
  return v6;
}

- (id)existingMonthlyChallengeTemplates
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ([(ACHMonthlyChallengeTemplateDataProvider *)self isUsingNewAwardingSystem])
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v4 = [(ACHMonthlyChallengeTemplateDataProvider *)self templateStore];
    uint64_t v5 = [v4 allTemplates];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if (ACHTemplateIsMonthlyChallenge()) {
            objc_msgSend(v3, "addObject:", v11, (void)v18);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    id v12 = (void *)[v3 copy];
  }
  else
  {
    uint64_t v13 = [(ACHMonthlyChallengeTemplateDataProvider *)self achievementStore];
    id v14 = [v13 allAchievements];
    id v15 = [v14 allObjects];

    objc_super v16 = objc_msgSend(v15, "hk_map:", &__block_literal_global_18);
    id v12 = [MEMORY[0x263EFFA08] setWithArray:v16];
  }
  return v12;
}

id __76__ACHMonthlyChallengeTemplateDataProvider_existingMonthlyChallengeTemplates__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 template];
  int IsMonthlyChallenge = ACHTemplateIsMonthlyChallenge();

  if (IsMonthlyChallenge)
  {
    uint64_t v5 = [v2 template];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)monthlyChallengeTypeForMonth:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHMonthlyChallengeTemplateDataProvider *)self existingMonthlyChallengeTemplates];
  id v6 = NSString;
  uint64_t v7 = [v4 year];
  uint64_t v8 = [v4 month];

  uint64_t v9 = objc_msgSend(v6, "stringWithFormat:", @"%04ld_%02ld", v7, v8);
  id v10 = [v5 allObjects];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __72__ACHMonthlyChallengeTemplateDataProvider_monthlyChallengeTypeForMonth___block_invoke;
  v17[3] = &unk_264517400;
  id v18 = v9;
  id v11 = v9;
  id v12 = objc_msgSend(v10, "hk_firstObjectPassingTest:", v17);

  if (v12)
  {
    uint64_t v13 = [v12 uniqueName];
    unint64_t v14 = ACHMonthlyChallengeTypeFromTemplateUniqueName();
  }
  else
  {
    uint64_t v13 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v13, OS_LOG_TYPE_DEFAULT, "No monthly challenge created last month", buf, 2u);
    }
    unint64_t v14 = 0;
  }

  return v14;
}

uint64_t __72__ACHMonthlyChallengeTemplateDataProvider_monthlyChallengeTypeForMonth___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueName];
  uint64_t v4 = [v3 containsString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)monthlyChallengeExistsForMonth:(id)a3
{
  return [(ACHMonthlyChallengeTemplateDataProvider *)self monthlyChallengeTypeForMonth:a3] != 0;
}

- (BOOL)isDate:(id)a3 betweenStartDate:(id)a4 andEndDate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (objc_msgSend(v7, "hk_isAfterOrEqualToDate:", a4)) {
    char v9 = objc_msgSend(v7, "hk_isBeforeOrEqualToDate:", v8);
  }
  else {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)hasMinimumActiveDaysWithError:(id *)a3
{
  if ([(ACHMonthlyChallengeTemplateDataProvider *)self isUsingNewAwardingSystem])
  {
    uint64_t v5 = [(ACHMonthlyChallengeTemplateDataProvider *)self currentCalendar];
    id v6 = [(ACHMonthlyChallengeTemplateDataProvider *)self currentDate];
    id v7 = objc_msgSend(v5, "hk_dateByAddingDays:toDate:", -35, v6);

    id v8 = [(ACHMonthlyChallengeTemplateDataProvider *)self currentCalendar];
    uint64_t v9 = *MEMORY[0x263F234C0];
    id v10 = [v8 components:*MEMORY[0x263F234C0] fromDate:v7];

    id v11 = [(ACHMonthlyChallengeTemplateDataProvider *)self currentCalendar];
    id v12 = [(ACHMonthlyChallengeTemplateDataProvider *)self currentDate];
    uint64_t v13 = [v11 components:v9 fromDate:v12];

    unint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F236B0]) initWithStartDateComponents:v10 endDateComponents:v13];
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    id v25 = __Block_byref_object_copy__19;
    id v26 = __Block_byref_object_dispose__19;
    id v27 = 0;
    id v15 = [(ACHMonthlyChallengeTemplateDataProvider *)self activitySummaryIterator];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __73__ACHMonthlyChallengeTemplateDataProvider_hasMinimumActiveDaysWithError___block_invoke;
    v21[3] = &unk_264516A10;
    v21[4] = &v28;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __73__ACHMonthlyChallengeTemplateDataProvider_hasMinimumActiveDaysWithError___block_invoke_2;
    v20[3] = &unk_2645167A8;
    v20[4] = &v22;
    [v15 enumerateActivitySummariesForDateComponentInterval:v14 handler:v21 errorHandler:v20];

    id v16 = (id)v23[5];
    uint64_t v17 = v16;
    if (v16)
    {
      if (a3) {
        *a3 = v16;
      }
      else {
        _HKLogDroppedError();
      }
    }

    BOOL v19 = v29[3] > 13;
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
    return v19;
  }
  else
  {
    return [(ACHMonthlyChallengeTemplateDataProvider *)self hasMinimumActiveDays];
  }
}

void __73__ACHMonthlyChallengeTemplateDataProvider_hasMinimumActiveDaysWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 activityMoveMode] == 2) {
    [v3 appleMoveTime];
  }
  else {
  id v7 = [v3 activeEnergyBurned];
  }
  uint64_t v4 = [v3 activityMoveMode];

  if (v4 == 2) {
    [MEMORY[0x263F0A830] minuteUnit];
  }
  else {
  uint64_t v5 = [MEMORY[0x263F0A830] kilocalorieUnit];
  }
  [v7 doubleValueForUnit:v5];
  if (v6 > 2.22044605e-16) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

void __73__ACHMonthlyChallengeTemplateDataProvider_hasMinimumActiveDaysWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)isWheelchairUserWithError:(id *)a3
{
  if ([(ACHMonthlyChallengeTemplateDataProvider *)self isUsingNewAwardingSystem])
  {
    uint64_t v5 = [(ACHMonthlyChallengeTemplateDataProvider *)self healthStore];
    double v6 = [v5 wheelchairUseWithError:a3];

    if (v6) {
      BOOL v7 = [v6 wheelchairUse] == 2;
    }
    else {
      BOOL v7 = 0;
    }

    return v7;
  }
  else
  {
    return [(ACHMonthlyChallengeTemplateDataProvider *)self isWheelchairUser];
  }
}

- (int64_t)currentActivityMoveModeWithError:(id *)a3
{
  moveModeOverride = self->_moveModeOverride;
  if (moveModeOverride) {
    return [(NSNumber *)moveModeOverride intValue];
  }
  if ([(ACHMonthlyChallengeTemplateDataProvider *)self isUsingNewAwardingSystem])
  {
    BOOL v7 = [(ACHMonthlyChallengeTemplateDataProvider *)self healthStore];
    id v8 = [v7 activityMoveModeWithError:a3];

    if (v8) {
      int64_t v5 = [v8 activityMoveMode];
    }
    else {
      int64_t v5 = 1;
    }

    return v5;
  }
  return [(ACHMonthlyChallengeTemplateDataProvider *)self currentActivityMoveMode];
}

- (unint64_t)currentExperienceTypeWithError:(id *)a3
{
  if ([(ACHMonthlyChallengeTemplateDataProvider *)self isUsingNewAwardingSystem])
  {
    int64_t v5 = [(ACHMonthlyChallengeTemplateDataProvider *)self healthStore];
    double v6 = [v5 dateOfBirthComponentsWithError:a3];

    if (v6)
    {
      BOOL v7 = [(ACHMonthlyChallengeTemplateDataProvider *)self currentCalendar];
      id v8 = [(ACHMonthlyChallengeTemplateDataProvider *)self currentDate];
      unint64_t v9 = FIExperienceTypeForBirthDateComponentsWithCurrentDateAndCalendar();
    }
    else
    {
      unint64_t v9 = 0;
    }

    return v9;
  }
  else
  {
    return [(ACHMonthlyChallengeTemplateDataProvider *)self currentExperienceType];
  }
}

- (BOOL)isWheelchairUser
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F0A598] characteristicTypeForIdentifier:*MEMORY[0x263F09478]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  int64_t v5 = [WeakRetained userCharacteristicsManager];
  id v12 = 0;
  double v6 = [v5 userCharacteristicForType:v3 error:&v12];
  id v7 = v12;
  uint64_t v8 = [v6 integerValue];

  if (v7)
  {
    unint64_t v9 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_21F5DA000, v9, OS_LOG_TYPE_DEFAULT, "Cannot determine if user is wheelchair user with error %@", buf, 0xCu);
    }

    BOOL v10 = 0;
  }
  else
  {
    BOOL v10 = v8 == 2;
  }

  return v10;
}

- (int64_t)currentActivityMoveMode
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F0A598] characteristicTypeForIdentifier:*MEMORY[0x263F09450]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  int64_t v5 = [WeakRetained userCharacteristicsManager];
  id v11 = 0;
  double v6 = [v5 userCharacteristicForType:v3 error:&v11];
  id v7 = v11;

  if (v6)
  {
    int64_t v8 = [v6 integerValue];
  }
  else
  {
    unint64_t v9 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v7;
      _os_log_impl(&dword_21F5DA000, v9, OS_LOG_TYPE_DEFAULT, "Cannot determine user activity move mode with error [%{public}@], falling back to active energy.", buf, 0xCu);
    }

    int64_t v8 = 1;
  }

  return v8;
}

- (unint64_t)currentExperienceType
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F0A598] characteristicTypeForIdentifier:*MEMORY[0x263F09468]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  int64_t v5 = [WeakRetained userCharacteristicsManager];
  id v12 = 0;
  double v6 = [v5 userCharacteristicForType:v3 error:&v12];
  id v7 = v12;

  if (v6)
  {
    int64_t v8 = [(ACHMonthlyChallengeTemplateDataProvider *)self currentCalendar];
    unint64_t v9 = [(ACHMonthlyChallengeTemplateDataProvider *)self currentDate];
    unint64_t v10 = FIExperienceTypeForBirthDateComponentsWithCurrentDateAndCalendar();
  }
  else
  {
    if (!v7)
    {
      unint64_t v10 = 3;
      goto LABEL_8;
    }
    int64_t v8 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "MonthlyChallengeDataProvider failed to get date of birth when determining current exprience type: %@", buf, 0xCu);
    }
    unint64_t v10 = 3;
  }

LABEL_8:
  return v10;
}

- (BOOL)hasMinimumActiveDays
{
  id v3 = [(ACHMonthlyChallengeTemplateDataProvider *)self currentCalendar];
  uint64_t v4 = [(ACHMonthlyChallengeTemplateDataProvider *)self currentDate];
  int64_t v5 = objc_msgSend(v3, "hk_dateByAddingDays:toDate:", -35, v4);

  double v6 = [(ACHMonthlyChallengeTemplateDataProvider *)self currentCalendar];
  uint64_t v7 = *MEMORY[0x263F234C0];
  int64_t v8 = [v6 components:*MEMORY[0x263F234C0] fromDate:v5];

  unint64_t v9 = [(ACHMonthlyChallengeTemplateDataProvider *)self currentCalendar];
  unint64_t v10 = [(ACHMonthlyChallengeTemplateDataProvider *)self currentDate];
  id v11 = [v9 components:v7 fromDate:v10];

  id v12 = (void *)[objc_alloc(MEMORY[0x263F236B0]) initWithStartDateComponents:v8 endDateComponents:v11];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  id v13 = [(ACHMonthlyChallengeTemplateDataProvider *)self activitySummaryUtility];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __63__ACHMonthlyChallengeTemplateDataProvider_hasMinimumActiveDays__block_invoke;
  v15[3] = &unk_264517368;
  v15[4] = &v16;
  [v13 enumerateActivitySummariesForDateComponentInterval:v12 handler:v15];

  LOBYTE(v13) = v17[3] > 13;
  _Block_object_dispose(&v16, 8);

  return (char)v13;
}

void __63__ACHMonthlyChallengeTemplateDataProvider_hasMinimumActiveDays__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 activityMoveMode] == 2) {
    [v3 appleMoveTime];
  }
  else {
  id v7 = [v3 activeEnergyBurned];
  }
  uint64_t v4 = [v3 activityMoveMode];

  if (v4 == 2) {
    [MEMORY[0x263F0A830] minuteUnit];
  }
  else {
  int64_t v5 = [MEMORY[0x263F0A830] kilocalorieUnit];
  }
  [v7 doubleValueForUnit:v5];
  if (v6 > 2.22044605e-16) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (void)setCurrentDateOverride:(id)a3
{
}

- (void)setCurrentCalendarOverride:(id)a3
{
}

- (void)setMoveModeOverride:(int64_t)a3
{
  uint64_t v4 = [NSNumber numberWithInteger:a3];
  moveModeOverride = self->_moveModeOverride;
  self->_moveModeOverride = v4;
  MEMORY[0x270F9A758](v4, moveModeOverride);
}

- (NSDate)currentDate
{
  currentDateOverride = self->_currentDateOverride;
  if (currentDateOverride)
  {
    id v3 = currentDateOverride;
  }
  else
  {
    id v3 = [MEMORY[0x263EFF910] date];
  }
  return v3;
}

- (NSCalendar)currentCalendar
{
  currentCalendarOverride = self->_currentCalendarOverride;
  if (currentCalendarOverride)
  {
    id v3 = currentCalendarOverride;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendarWithLocalTimeZone");
    id v3 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (ACHActivitySummaryIterator)activitySummaryIterator
{
  return self->_activitySummaryIterator;
}

- (void)setActivitySummaryIterator:(id)a3
{
}

- (ACHAchievementStoring)achievementStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_achievementStore);
  return (ACHAchievementStoring *)WeakRetained;
}

- (void)setAchievementStore:(id)a3
{
}

- (ACHEarnedInstanceStore)earnedInstanceStore
{
  return self->_earnedInstanceStore;
}

- (void)setEarnedInstanceStore:(id)a3
{
}

- (ACHTemplateStore)templateStore
{
  return self->_templateStore;
}

- (void)setTemplateStore:(id)a3
{
}

- (void)setCurrentCalendar:(id)a3
{
}

- (void)setCurrentDate:(id)a3
{
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (ACHActivitySummaryUtility)activitySummaryUtility
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activitySummaryUtility);
  return (ACHActivitySummaryUtility *)WeakRetained;
}

- (void)setActivitySummaryUtility:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activitySummaryUtility);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_templateStore, 0);
  objc_storeStrong((id *)&self->_earnedInstanceStore, 0);
  objc_destroyWeak((id *)&self->_achievementStore);
  objc_storeStrong((id *)&self->_activitySummaryIterator, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_moveModeOverride, 0);
  objc_storeStrong((id *)&self->_currentCalendarOverride, 0);
  objc_storeStrong((id *)&self->_currentDateOverride, 0);
}

@end