@interface ACHMonthlyChallengeEvaluationEnvironment
- (ACHDateComponentInterval)dateComponentInterval;
- (ACHMonthlyChallengeDataSource)dataSource;
- (ACHMonthlyChallengeEvaluationEnvironment)initWithMonthlyChallengeDataSource:(id)a3 dateComponentInterval:(id)a4 calendar:(id)a5;
- (NSCalendar)calendar;
- (double)_valueForMonthlyChallengeType:(unint64_t)a3;
- (double)currentMoveStreakInCurrentMonth;
- (double)longestMoveStreakInCurrentMonth;
- (double)numberOfDaysClosingAllThreeRingsInCurrentMonth;
- (double)numberOfDaysClosingExerciseRingInCurrentMonth;
- (double)numberOfDaysClosingMoveRingInCurrentMonth;
- (double)numberOfDaysClosingStandRingInCurrentMonth;
- (double)numberOfDaysDoublingExerciseGoalInCurrentMonth;
- (double)numberOfDaysDoublingMoveGoalInCurrentMonth;
- (double)numberOfWorkoutsCompletedInCurrentMonth;
- (double)totalEnergyBurnInCurrentMonth;
- (double)totalExerciseMinutesInCurrentMonth;
- (double)totalMoveTimeInCurrentMonth;
- (double)totalWalkingRunningDistanceInCurrentMonth;
- (id)eligibleSpecificWorkoutChallengeType;
- (id)numberOfCompletedWorkoutsInCurrentMonthForChallengeType:(id)a3;
- (id)numberOfDaysWithAppleMoveTimeOver:(id)a3;
- (id)numberOfDaysWithCaloriesBurnedOver:(id)a3;
- (id)numberOfDaysWithDistanceOver:(id)a3;
- (id)numberOfDaysWithExerciseMinutesOver:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDateComponentInterval:(id)a3;
@end

@implementation ACHMonthlyChallengeEvaluationEnvironment

- (ACHMonthlyChallengeEvaluationEnvironment)initWithMonthlyChallengeDataSource:(id)a3 dateComponentInterval:(id)a4 calendar:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ACHMonthlyChallengeEvaluationEnvironment;
  v11 = [(ACHMonthlyChallengeEvaluationEnvironment *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_dataSource, v8);
    objc_storeStrong((id *)&v12->_dateComponentInterval, a4);
    objc_storeStrong((id *)&v12->_calendar, a5);
  }

  return v12;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v3 = a3;
  v4 = ACHLogMonthlyChallenges();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[ACHMonthlyChallengeEvaluationEnvironment valueForUndefinedKey:]((uint64_t)v3, v4);
  }

  return 0;
}

- (double)numberOfDaysClosingAllThreeRingsInCurrentMonth
{
  [(ACHMonthlyChallengeEvaluationEnvironment *)self _valueForMonthlyChallengeType:1];
  return result;
}

- (double)numberOfDaysClosingMoveRingInCurrentMonth
{
  [(ACHMonthlyChallengeEvaluationEnvironment *)self _valueForMonthlyChallengeType:2];
  return result;
}

- (double)numberOfDaysClosingExerciseRingInCurrentMonth
{
  [(ACHMonthlyChallengeEvaluationEnvironment *)self _valueForMonthlyChallengeType:3];
  return result;
}

- (double)numberOfDaysClosingStandRingInCurrentMonth
{
  [(ACHMonthlyChallengeEvaluationEnvironment *)self _valueForMonthlyChallengeType:4];
  return result;
}

- (double)totalEnergyBurnInCurrentMonth
{
  [(ACHMonthlyChallengeEvaluationEnvironment *)self _valueForMonthlyChallengeType:5];
  return result;
}

- (double)totalMoveTimeInCurrentMonth
{
  [(ACHMonthlyChallengeEvaluationEnvironment *)self _valueForMonthlyChallengeType:22];
  return result;
}

- (double)totalExerciseMinutesInCurrentMonth
{
  [(ACHMonthlyChallengeEvaluationEnvironment *)self _valueForMonthlyChallengeType:6];
  return result;
}

- (double)numberOfWorkoutsCompletedInCurrentMonth
{
  [(ACHMonthlyChallengeEvaluationEnvironment *)self _valueForMonthlyChallengeType:7];
  return result;
}

- (double)totalWalkingRunningDistanceInCurrentMonth
{
  [(ACHMonthlyChallengeEvaluationEnvironment *)self _valueForMonthlyChallengeType:20];
  return result;
}

- (double)numberOfDaysDoublingMoveGoalInCurrentMonth
{
  [(ACHMonthlyChallengeEvaluationEnvironment *)self _valueForMonthlyChallengeType:21];
  return result;
}

- (double)numberOfDaysDoublingExerciseGoalInCurrentMonth
{
  [(ACHMonthlyChallengeEvaluationEnvironment *)self _valueForMonthlyChallengeType:23];
  return result;
}

- (double)longestMoveStreakInCurrentMonth
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(ACHMonthlyChallengeEvaluationEnvironment *)self dataSource];
  v4 = [(ACHMonthlyChallengeEvaluationEnvironment *)self dateComponentInterval];
  id v9 = 0;
  uint64_t v5 = [v3 longestStreakOfType:0 duringDateComponentInterval:v4 error:&v9];
  id v6 = v9;

  if (v6)
  {
    v7 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Error fetching longestMoveStreakInCurrentMonth value: %@", buf, 0xCu);
    }
  }
  return (double)v5;
}

- (double)currentMoveStreakInCurrentMonth
{
  [(ACHMonthlyChallengeEvaluationEnvironment *)self _valueForMonthlyChallengeType:24];
  return result;
}

- (id)numberOfCompletedWorkoutsInCurrentMonthForChallengeType:(id)a3
{
  -[ACHMonthlyChallengeEvaluationEnvironment _valueForMonthlyChallengeType:](self, "_valueForMonthlyChallengeType:", [a3 integerValue]);
  id v3 = NSNumber;
  return (id)objc_msgSend(v3, "numberWithDouble:");
}

- (id)eligibleSpecificWorkoutChallengeType
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __80__ACHMonthlyChallengeEvaluationEnvironment_eligibleSpecificWorkoutChallengeType__block_invoke;
  v6[3] = &unk_264517180;
  v6[4] = self;
  v2 = (void (**)(void, void))MEMORY[0x223C507A0](v6, a2);
  id v3 = v2[2](v2, 5);
  if (!v3)
  {
    id v3 = v2[2](v2, 3);
  }
  id v4 = v3;

  return v4;
}

id __80__ACHMonthlyChallengeEvaluationEnvironment_eligibleSpecificWorkoutChallengeType__block_invoke(uint64_t a1, uint64_t a2)
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  int v13 = 0x7FFFFFFF;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__14;
  id v10 = __Block_byref_object_dispose__14;
  id v11 = 0;
  v2 = (void *)*MEMORY[0x263F23558];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __80__ACHMonthlyChallengeEvaluationEnvironment_eligibleSpecificWorkoutChallengeType__block_invoke_277;
  v5[3] = &unk_264517158;
  v5[4] = *(void *)(a1 + 32);
  v5[5] = v12;
  v5[6] = &v6;
  v5[7] = a2;
  [v2 enumerateObjectsUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(v12, 8);
  return v3;
}

void __80__ACHMonthlyChallengeEvaluationEnvironment_eligibleSpecificWorkoutChallengeType__block_invoke_277(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "numberOfCompletedWorkoutsInCurrentMonthForChallengeType:");
  uint64_t v5 = v4;
  if (v4) {
    int v6 = [v4 intValue];
  }
  else {
    int v6 = 0;
  }
  if (*(void *)(a1 + 56) <= v6 && v6 < *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  }
}

- (id)numberOfDaysWithCaloriesBurnedOver:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ACHMonthlyChallengeEvaluationEnvironment *)self dataSource];
  [v4 doubleValue];
  double v7 = v6;

  uint64_t v8 = [(ACHMonthlyChallengeEvaluationEnvironment *)self dateComponentInterval];
  id v9 = [(ACHMonthlyChallengeEvaluationEnvironment *)self calendar];
  id v16 = 0;
  [v5 numberOfDaysWithCaloriesBurnedOver:v8 forDateComponentInterval:v9 calendar:&v16 error:v7];
  double v11 = v10;
  id v12 = v16;

  if (v12)
  {
    int v13 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v12;
      _os_log_impl(&dword_21F5DA000, v13, OS_LOG_TYPE_DEFAULT, "Error fetching value for ACHMonthlyChallengeTypeDailyEnergyBurnTarget challenge: %@", buf, 0xCu);
    }
  }
  objc_super v14 = [NSNumber numberWithDouble:v11];

  return v14;
}

- (id)numberOfDaysWithExerciseMinutesOver:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ACHMonthlyChallengeEvaluationEnvironment *)self dataSource];
  [v4 doubleValue];
  double v7 = v6;

  uint64_t v8 = [(ACHMonthlyChallengeEvaluationEnvironment *)self dateComponentInterval];
  id v9 = [(ACHMonthlyChallengeEvaluationEnvironment *)self calendar];
  id v16 = 0;
  [v5 numberOfDaysWithExerciseMinutesOver:v8 forDateComponentInterval:v9 calendar:&v16 error:v7];
  double v11 = v10;
  id v12 = v16;

  if (v12)
  {
    int v13 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v12;
      _os_log_impl(&dword_21F5DA000, v13, OS_LOG_TYPE_DEFAULT, "Error fetching value for ACHMonthlyChallengeTypeDailyExerciseMinutesTarget challenge: %@", buf, 0xCu);
    }
  }
  objc_super v14 = [NSNumber numberWithDouble:v11];

  return v14;
}

- (id)numberOfDaysWithDistanceOver:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ACHMonthlyChallengeEvaluationEnvironment *)self dataSource];
  [v4 doubleValue];
  double v7 = v6;

  uint64_t v8 = [(ACHMonthlyChallengeEvaluationEnvironment *)self dateComponentInterval];
  id v9 = [(ACHMonthlyChallengeEvaluationEnvironment *)self calendar];
  id v16 = 0;
  [v5 numberOfDaysWithDistanceOver:v8 forDateComponentInterval:v9 calendar:&v16 error:v7];
  double v11 = v10;
  id v12 = v16;

  if (v12)
  {
    int v13 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v12;
      _os_log_impl(&dword_21F5DA000, v13, OS_LOG_TYPE_DEFAULT, "Error fetching value for ACHMonthlyChallengeTypeDailyDistanceTarget challenge: %@", buf, 0xCu);
    }
  }
  objc_super v14 = [NSNumber numberWithDouble:v11];

  return v14;
}

- (id)numberOfDaysWithAppleMoveTimeOver:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ACHMonthlyChallengeEvaluationEnvironment *)self dataSource];
  [v4 doubleValue];
  double v7 = v6;

  uint64_t v8 = [(ACHMonthlyChallengeEvaluationEnvironment *)self dateComponentInterval];
  id v9 = [(ACHMonthlyChallengeEvaluationEnvironment *)self calendar];
  id v16 = 0;
  [v5 numberOfDaysWithAppleMoveTimeOver:v8 forDateComponentInterval:v9 calendar:&v16 error:v7];
  double v11 = v10;
  id v12 = v16;

  if (v12)
  {
    int v13 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v12;
      _os_log_impl(&dword_21F5DA000, v13, OS_LOG_TYPE_DEFAULT, "Error fetching value for ACHMonthlyChallengeTypeDailyAppleMoveTimeTarget challenge: %@", buf, 0xCu);
    }
  }
  objc_super v14 = [NSNumber numberWithDouble:v11];

  return v14;
}

- (double)_valueForMonthlyChallengeType:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(ACHMonthlyChallengeEvaluationEnvironment *)self dataSource];
  double v6 = [(ACHMonthlyChallengeEvaluationEnvironment *)self dateComponentInterval];
  double v7 = [(ACHMonthlyChallengeEvaluationEnvironment *)self calendar];
  id v13 = 0;
  [v5 valueForMonthlyChallengeType:a3 forDateComponentInterval:v6 calendar:v7 error:&v13];
  double v9 = v8;
  id v10 = v13;

  if (v10)
  {
    double v11 = ACHLogMonthlyChallenges();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v15 = a3;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl(&dword_21F5DA000, v11, OS_LOG_TYPE_DEFAULT, "Error fetching value for monthly challenge type %lu: %@", buf, 0x16u);
    }
  }
  return v9;
}

- (ACHMonthlyChallengeDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (ACHMonthlyChallengeDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (ACHDateComponentInterval)dateComponentInterval
{
  return self->_dateComponentInterval;
}

- (void)setDateComponentInterval:(id)a3
{
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_dateComponentInterval, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)valueForUndefinedKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_FAULT, "Monthly Challenge Evaluation environment asked for key it doesn't support: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end