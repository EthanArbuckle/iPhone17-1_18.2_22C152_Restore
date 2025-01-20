@interface ACHMonthlyChallengeDataSource
- (ACHActivitySummaryIterator)activitySummaryIterator;
- (ACHActivitySummaryUtility)activitySummaryUtility;
- (ACHAwardsWorkoutClient)workoutClient;
- (ACHMonthlyChallengeDataSource)initWithActivitySummaryIterator:(id)a3 workoutClient:(id)a4;
- (ACHMonthlyChallengeDataSource)initWithProfile:(id)a3 activitySummaryUtility:(id)a4 workoutUtility:(id)a5;
- (ACHWorkoutUtility)workoutUtility;
- (BOOL)requiresError;
- (HDDatabaseTransactionContext)databaseContext;
- (HDProfile)profile;
- (double)_dailyAverageValueForMonthlyChallengeWithDailyTargetValue:(double)a3 andDateComponentInterval:(id)a4;
- (double)_numberOfDaysWithQuantity:(id)a3 overThreshold:(double)a4 forDateComponentInterval:(id)a5;
- (double)_numberOfDaysWithQuantity:(id)a3 overThreshold:(double)a4 forDateComponentInterval:(id)a5 error:(id *)a6;
- (double)caloriesDuringDateComponentInterval:(id)a3;
- (double)caloriesDuringDateComponentInterval:(id)a3 error:(id *)a4;
- (double)exerciseMinutesDuringDateComponentInterval:(id)a3;
- (double)exerciseMinutesDuringDateComponentInterval:(id)a3 error:(id *)a4;
- (double)moveTimeDuringDateComponentInterval:(id)a3;
- (double)moveTimeDuringDateComponentInterval:(id)a3 error:(id *)a4;
- (double)numberOfDaysWithAppleMoveTimeOver:(double)a3 forDateComponentInterval:(id)a4 calendar:(id)a5 error:(id *)a6;
- (double)numberOfDaysWithCaloriesBurnedOver:(double)a3 forDateComponentInterval:(id)a4 calendar:(id)a5 error:(id *)a6;
- (double)numberOfDaysWithDistanceOver:(double)a3 forDateComponentInterval:(id)a4 calendar:(id)a5 error:(id *)a6;
- (double)numberOfDaysWithExerciseMinutesOver:(double)a3 forDateComponentInterval:(id)a4 calendar:(id)a5 error:(id *)a6;
- (double)valueForMonthlyChallengeType:(unint64_t)a3 forDateComponentInterval:(id)a4 calendar:(id)a5 error:(id *)a6;
- (double)valueForMonthlyChallengeType:(unint64_t)a3 forDateComponentInterval:(id)a4 inCalendar:(id)a5;
- (double)walkingRunningDistanceDuringDateComponentInterval:(id)a3;
- (double)walkingRunningDistanceDuringDateComponentInterval:(id)a3 error:(id *)a4;
- (id)_inclusiveDateIntervalFor:(id)a3 andDateComponentInterval:(id)a4;
- (int64_t)currentStreakOfType:(unint64_t)a3 duringDateComponentInterval:(id)a4;
- (int64_t)currentStreakOfType:(unint64_t)a3 duringDateComponentInterval:(id)a4 error:(id *)a5;
- (int64_t)longestStreakOfType:(unint64_t)a3 duringDateComponentInterval:(id)a4;
- (int64_t)longestStreakOfType:(unint64_t)a3 duringDateComponentInterval:(id)a4 error:(id *)a5;
- (int64_t)numberOfAllRingsClosedDuringDateComponentInterval:(id)a3;
- (int64_t)numberOfAllRingsClosedDuringDateComponentInterval:(id)a3 error:(id *)a4;
- (int64_t)numberOfCompletedWorkoutsOfType:(unint64_t)a3 andLocation:(unint64_t)a4 duringDateInterval:(id)a5;
- (int64_t)numberOfCompletedWorkoutsOfType:(unint64_t)a3 andLocation:(unint64_t)a4 duringDateInterval:(id)a5 error:(id *)a6;
- (int64_t)numberOfDaysDoublingExerciseGoalDuringDateComponentInterval:(id)a3;
- (int64_t)numberOfDaysDoublingExerciseGoalDuringDateComponentInterval:(id)a3 error:(id *)a4;
- (int64_t)numberOfDaysDoublingMoveGoalDuringDateComponentInterval:(id)a3;
- (int64_t)numberOfDaysDoublingMoveGoalDuringDateComponentInterval:(id)a3 error:(id *)a4;
- (int64_t)numberOfExerciseRingsClosedDuringDateComponentInterval:(id)a3;
- (int64_t)numberOfExerciseRingsClosedDuringDateComponentInterval:(id)a3 error:(id *)a4;
- (int64_t)numberOfMoveRingsClosedDuringDateComponentInterval:(id)a3;
- (int64_t)numberOfMoveRingsClosedDuringDateComponentInterval:(id)a3 error:(id *)a4;
- (int64_t)numberOfStandRingsClosedDuringDateComponentInterval:(id)a3;
- (int64_t)numberOfStandRingsClosedDuringDateComponentInterval:(id)a3 error:(id *)a4;
- (int64_t)numberOfWorkoutsCompletedDuringDateInterval:(id)a3;
- (int64_t)numberOfWorkoutsCompletedDuringDateInterval:(id)a3 error:(id *)a4;
- (void)_getCurrentAndLongestStreakForStreakType:(unint64_t)a3 duringDateComponentInterval:(id)a4 completion:(id)a5;
- (void)_getNoErrorLongestAndCurrentStreakForStreakType:(unint64_t)a3 duringDateComponentInterval:(id)a4 completion:(id)a5;
- (void)setActivitySummaryIterator:(id)a3;
- (void)setActivitySummaryUtility:(id)a3;
- (void)setDatabaseContext:(id)a3;
- (void)setProfile:(id)a3;
- (void)setWorkoutClient:(id)a3;
- (void)setWorkoutUtility:(id)a3;
@end

@implementation ACHMonthlyChallengeDataSource

- (ACHMonthlyChallengeDataSource)initWithActivitySummaryIterator:(id)a3 workoutClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ACHMonthlyChallengeDataSource;
  v9 = [(ACHMonthlyChallengeDataSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activitySummaryIterator, a3);
    objc_storeStrong((id *)&v10->_workoutClient, a4);
  }

  return v10;
}

- (ACHMonthlyChallengeDataSource)initWithProfile:(id)a3 activitySummaryUtility:(id)a4 workoutUtility:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ACHMonthlyChallengeDataSource;
  v11 = [(ACHMonthlyChallengeDataSource *)&v14 init];
  objc_super v12 = v11;
  if (v11)
  {
    [(ACHMonthlyChallengeDataSource *)v11 setProfile:v8];
    [(ACHMonthlyChallengeDataSource *)v12 setActivitySummaryUtility:v9];
    [(ACHMonthlyChallengeDataSource *)v12 setWorkoutUtility:v10];
  }

  return v12;
}

- (BOOL)requiresError
{
  v2 = [(ACHMonthlyChallengeDataSource *)self profile];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)setDatabaseContext:(id)a3
{
  objc_storeStrong((id *)&self->_databaseContext, a3);
  id v5 = a3;
  v6 = [(ACHMonthlyChallengeDataSource *)self activitySummaryUtility];
  [v6 setDatabaseContext:v5];

  id v7 = [(ACHMonthlyChallengeDataSource *)self workoutUtility];
  [v7 setDatabaseContext:v5];
}

- (double)valueForMonthlyChallengeType:(unint64_t)a3 forDateComponentInterval:(id)a4 calendar:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  switch(a3)
  {
    case 1uLL:
      uint64_t v15 = [(ACHMonthlyChallengeDataSource *)self numberOfAllRingsClosedDuringDateComponentInterval:v10 error:a6];
      goto LABEL_16;
    case 2uLL:
      uint64_t v15 = [(ACHMonthlyChallengeDataSource *)self numberOfMoveRingsClosedDuringDateComponentInterval:v10 error:a6];
      goto LABEL_16;
    case 3uLL:
      uint64_t v15 = [(ACHMonthlyChallengeDataSource *)self numberOfExerciseRingsClosedDuringDateComponentInterval:v10 error:a6];
      goto LABEL_16;
    case 4uLL:
      uint64_t v15 = [(ACHMonthlyChallengeDataSource *)self numberOfStandRingsClosedDuringDateComponentInterval:v10 error:a6];
      goto LABEL_16;
    case 5uLL:
      [(ACHMonthlyChallengeDataSource *)self caloriesDuringDateComponentInterval:v10 error:a6];
      goto LABEL_22;
    case 6uLL:
      [(ACHMonthlyChallengeDataSource *)self exerciseMinutesDuringDateComponentInterval:v10 error:a6];
      goto LABEL_22;
    case 7uLL:
      v17 = [(ACHMonthlyChallengeDataSource *)self _inclusiveDateIntervalFor:v11 andDateComponentInterval:v10];
      double v14 = (double)[(ACHMonthlyChallengeDataSource *)self numberOfWorkoutsCompletedDuringDateInterval:v17 error:a6];

      break;
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
      objc_super v12 = [(ACHMonthlyChallengeDataSource *)self _inclusiveDateIntervalFor:v11 andDateComponentInterval:v10];
      uint64_t v13 = ACHWorkoutActivityTypeForMonthlyChallengeType();
      double v14 = (double)[(ACHMonthlyChallengeDataSource *)self numberOfCompletedWorkoutsOfType:v13 andLocation:ACHWorkoutLocationTypeForMonthlyChallengeType() duringDateInterval:v12 error:a6];

      break;
    case 0x14uLL:
      [(ACHMonthlyChallengeDataSource *)self walkingRunningDistanceDuringDateComponentInterval:v10 error:a6];
      goto LABEL_22;
    case 0x15uLL:
      uint64_t v15 = [(ACHMonthlyChallengeDataSource *)self numberOfDaysDoublingMoveGoalDuringDateComponentInterval:v10 error:a6];
      goto LABEL_16;
    case 0x16uLL:
      [(ACHMonthlyChallengeDataSource *)self moveTimeDuringDateComponentInterval:v10 error:a6];
      goto LABEL_22;
    case 0x17uLL:
      uint64_t v15 = [(ACHMonthlyChallengeDataSource *)self numberOfDaysDoublingExerciseGoalDuringDateComponentInterval:v10 error:a6];
      goto LABEL_16;
    case 0x18uLL:
      uint64_t v15 = [(ACHMonthlyChallengeDataSource *)self currentStreakOfType:0 duringDateComponentInterval:v10 error:a6];
LABEL_16:
      double v14 = (double)v15;
      break;
    case 0x19uLL:
      [(ACHMonthlyChallengeDataSource *)self caloriesDuringDateComponentInterval:v10 error:a6];
      goto LABEL_21;
    case 0x1AuLL:
      [(ACHMonthlyChallengeDataSource *)self exerciseMinutesDuringDateComponentInterval:v10 error:a6];
      goto LABEL_21;
    case 0x1BuLL:
      [(ACHMonthlyChallengeDataSource *)self walkingRunningDistanceDuringDateComponentInterval:v10 error:a6];
      goto LABEL_21;
    case 0x1CuLL:
      [(ACHMonthlyChallengeDataSource *)self moveTimeDuringDateComponentInterval:v10 error:a6];
LABEL_21:
      -[ACHMonthlyChallengeDataSource _dailyAverageValueForMonthlyChallengeWithDailyTargetValue:andDateComponentInterval:](self, "_dailyAverageValueForMonthlyChallengeWithDailyTargetValue:andDateComponentInterval:", v10);
LABEL_22:
      double v14 = v16;
      break;
    default:
      double v14 = -1.0;
      break;
  }

  return v14;
}

- (double)_dailyAverageValueForMonthlyChallengeWithDailyTargetValue:(double)a3 andDateComponentInterval:(id)a4
{
  id v5 = a4;
  v6 = [v5 endDateComponents];
  uint64_t v7 = [v6 day];
  id v8 = [v5 startDateComponents];

  uint64_t v9 = v7 - [v8 day] + 1;
  return a3 / (double)v9;
}

- (double)caloriesDuringDateComponentInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(ACHMonthlyChallengeDataSource *)self requiresError])
  {
    uint64_t v7 = [MEMORY[0x263F0A830] kilocalorieUnit];
    uint64_t v25 = 0;
    v26 = (double *)&v25;
    uint64_t v27 = 0x2020000000;
    uint64_t v28 = 0;
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__31;
    v23 = __Block_byref_object_dispose__31;
    id v24 = 0;
    id v8 = [(ACHMonthlyChallengeDataSource *)self activitySummaryIterator];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __75__ACHMonthlyChallengeDataSource_caloriesDuringDateComponentInterval_error___block_invoke;
    v16[3] = &unk_264518428;
    v18 = &v25;
    id v9 = v7;
    id v17 = v9;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __75__ACHMonthlyChallengeDataSource_caloriesDuringDateComponentInterval_error___block_invoke_2;
    v15[3] = &unk_2645167A8;
    v15[4] = &v19;
    [v8 enumerateActivitySummariesForDateComponentInterval:v6 handler:v16 errorHandler:v15];

    id v10 = (id)v20[5];
    id v11 = v10;
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }

    double v13 = v26[3];
    _Block_object_dispose(&v19, 8);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    [(ACHMonthlyChallengeDataSource *)self caloriesDuringDateComponentInterval:v6];
    double v13 = v12;
  }

  return v13;
}

void __75__ACHMonthlyChallengeDataSource_caloriesDuringDateComponentInterval_error___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5 isPaused] & 1) == 0 && objc_msgSend(v5, "activityMoveMode") != 2)
  {
    BOOL v3 = [v5 activeEnergyBurned];
    [v3 doubleValueForUnit:*(void *)(a1 + 32)];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
  }
}

void __75__ACHMonthlyChallengeDataSource_caloriesDuringDateComponentInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (double)moveTimeDuringDateComponentInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(ACHMonthlyChallengeDataSource *)self requiresError])
  {
    uint64_t v7 = [MEMORY[0x263F0A830] minuteUnit];
    uint64_t v25 = 0;
    v26 = (double *)&v25;
    uint64_t v27 = 0x2020000000;
    uint64_t v28 = 0;
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__31;
    v23 = __Block_byref_object_dispose__31;
    id v24 = 0;
    id v8 = [(ACHMonthlyChallengeDataSource *)self activitySummaryIterator];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __75__ACHMonthlyChallengeDataSource_moveTimeDuringDateComponentInterval_error___block_invoke;
    v16[3] = &unk_264518428;
    v18 = &v25;
    id v9 = v7;
    id v17 = v9;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __75__ACHMonthlyChallengeDataSource_moveTimeDuringDateComponentInterval_error___block_invoke_2;
    v15[3] = &unk_2645167A8;
    v15[4] = &v19;
    [v8 enumerateActivitySummariesForDateComponentInterval:v6 handler:v16 errorHandler:v15];

    id v10 = (id)v20[5];
    id v11 = v10;
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }

    double v13 = v26[3];
    _Block_object_dispose(&v19, 8);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    [(ACHMonthlyChallengeDataSource *)self moveTimeDuringDateComponentInterval:v6];
    double v13 = v12;
  }

  return v13;
}

void __75__ACHMonthlyChallengeDataSource_moveTimeDuringDateComponentInterval_error___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5 isPaused] & 1) == 0 && objc_msgSend(v5, "activityMoveMode") == 2)
  {
    BOOL v3 = [v5 appleMoveTime];
    [v3 doubleValueForUnit:*(void *)(a1 + 32)];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
  }
}

void __75__ACHMonthlyChallengeDataSource_moveTimeDuringDateComponentInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (double)exerciseMinutesDuringDateComponentInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(ACHMonthlyChallengeDataSource *)self requiresError])
  {
    uint64_t v7 = [MEMORY[0x263F0A830] minuteUnit];
    uint64_t v25 = 0;
    v26 = (double *)&v25;
    uint64_t v27 = 0x2020000000;
    uint64_t v28 = 0;
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__31;
    v23 = __Block_byref_object_dispose__31;
    id v24 = 0;
    id v8 = [(ACHMonthlyChallengeDataSource *)self activitySummaryIterator];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __82__ACHMonthlyChallengeDataSource_exerciseMinutesDuringDateComponentInterval_error___block_invoke;
    v16[3] = &unk_264518428;
    v18 = &v25;
    id v9 = v7;
    id v17 = v9;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __82__ACHMonthlyChallengeDataSource_exerciseMinutesDuringDateComponentInterval_error___block_invoke_2;
    v15[3] = &unk_2645167A8;
    v15[4] = &v19;
    [v8 enumerateActivitySummariesForDateComponentInterval:v6 handler:v16 errorHandler:v15];

    id v10 = (id)v20[5];
    id v11 = v10;
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }

    double v13 = v26[3];
    _Block_object_dispose(&v19, 8);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    [(ACHMonthlyChallengeDataSource *)self exerciseMinutesDuringDateComponentInterval:v6];
    double v13 = v12;
  }

  return v13;
}

void __82__ACHMonthlyChallengeDataSource_exerciseMinutesDuringDateComponentInterval_error___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5 isPaused] & 1) == 0)
  {
    BOOL v3 = [v5 appleExerciseTime];
    [v3 doubleValueForUnit:*(void *)(a1 + 32)];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
  }
}

void __82__ACHMonthlyChallengeDataSource_exerciseMinutesDuringDateComponentInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (double)walkingRunningDistanceDuringDateComponentInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(ACHMonthlyChallengeDataSource *)self requiresError])
  {
    uint64_t v7 = [MEMORY[0x263F0A830] meterUnit];
    uint64_t v25 = 0;
    v26 = (double *)&v25;
    uint64_t v27 = 0x2020000000;
    uint64_t v28 = 0;
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__31;
    v23 = __Block_byref_object_dispose__31;
    id v24 = 0;
    id v8 = [(ACHMonthlyChallengeDataSource *)self activitySummaryIterator];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __89__ACHMonthlyChallengeDataSource_walkingRunningDistanceDuringDateComponentInterval_error___block_invoke;
    v16[3] = &unk_264518428;
    v18 = &v25;
    id v9 = v7;
    id v17 = v9;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __89__ACHMonthlyChallengeDataSource_walkingRunningDistanceDuringDateComponentInterval_error___block_invoke_2;
    v15[3] = &unk_2645167A8;
    v15[4] = &v19;
    [v8 enumerateActivitySummariesForDateComponentInterval:v6 handler:v16 errorHandler:v15];

    id v10 = (id)v20[5];
    id v11 = v10;
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }

    double v13 = v26[3];
    _Block_object_dispose(&v19, 8);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    [(ACHMonthlyChallengeDataSource *)self walkingRunningDistanceDuringDateComponentInterval:v6];
    double v13 = v12;
  }

  return v13;
}

void __89__ACHMonthlyChallengeDataSource_walkingRunningDistanceDuringDateComponentInterval_error___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5 isPaused] & 1) == 0)
  {
    BOOL v3 = [v5 distanceWalkingRunning];
    [v3 doubleValueForUnit:*(void *)(a1 + 32)];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
  }
}

void __89__ACHMonthlyChallengeDataSource_walkingRunningDistanceDuringDateComponentInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (int64_t)numberOfMoveRingsClosedDuringDateComponentInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(ACHMonthlyChallengeDataSource *)self requiresError])
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy__31;
    v18 = __Block_byref_object_dispose__31;
    id v19 = 0;
    uint64_t v7 = [(ACHMonthlyChallengeDataSource *)self activitySummaryIterator];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __90__ACHMonthlyChallengeDataSource_numberOfMoveRingsClosedDuringDateComponentInterval_error___block_invoke;
    v13[3] = &unk_264516A10;
    v13[4] = &v20;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __90__ACHMonthlyChallengeDataSource_numberOfMoveRingsClosedDuringDateComponentInterval_error___block_invoke_2;
    v12[3] = &unk_2645167A8;
    v12[4] = &v14;
    [v7 enumerateActivitySummariesForDateComponentInterval:v6 handler:v13 errorHandler:v12];

    id v8 = (id)v15[5];
    id v9 = v8;
    if (v8)
    {
      if (a4) {
        *a4 = v8;
      }
      else {
        _HKLogDroppedError();
      }
    }

    int64_t v10 = v21[3];
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    int64_t v10 = [(ACHMonthlyChallengeDataSource *)self numberOfMoveRingsClosedDuringDateComponentInterval:v6];
  }

  return v10;
}

uint64_t __90__ACHMonthlyChallengeDataSource_numberOfMoveRingsClosedDuringDateComponentInterval_error___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 isPaused];
  id v4 = v7;
  if ((v3 & 1) == 0)
  {
    uint64_t v3 = [v7 activityMoveMode] == 2
       ? [v7 _moveMinutesCompletionPercentage]
       : [v7 _activeEnergyCompletionPercentage];
    id v4 = v7;
    if (v5 >= 1.0) {
      ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }
  }
  return MEMORY[0x270F9A758](v3, v4);
}

void __90__ACHMonthlyChallengeDataSource_numberOfMoveRingsClosedDuringDateComponentInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (int64_t)numberOfExerciseRingsClosedDuringDateComponentInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(ACHMonthlyChallengeDataSource *)self requiresError])
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy__31;
    v18 = __Block_byref_object_dispose__31;
    id v19 = 0;
    id v7 = [(ACHMonthlyChallengeDataSource *)self activitySummaryIterator];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __94__ACHMonthlyChallengeDataSource_numberOfExerciseRingsClosedDuringDateComponentInterval_error___block_invoke;
    v13[3] = &unk_264516A10;
    v13[4] = &v20;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __94__ACHMonthlyChallengeDataSource_numberOfExerciseRingsClosedDuringDateComponentInterval_error___block_invoke_2;
    v12[3] = &unk_2645167A8;
    v12[4] = &v14;
    [v7 enumerateActivitySummariesForDateComponentInterval:v6 handler:v13 errorHandler:v12];

    id v8 = (id)v15[5];
    id v9 = v8;
    if (v8)
    {
      if (a4) {
        *a4 = v8;
      }
      else {
        _HKLogDroppedError();
      }
    }

    int64_t v10 = v21[3];
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    int64_t v10 = [(ACHMonthlyChallengeDataSource *)self numberOfExerciseRingsClosedDuringDateComponentInterval:v6];
  }

  return v10;
}

void __94__ACHMonthlyChallengeDataSource_numberOfExerciseRingsClosedDuringDateComponentInterval_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([v4 isPaused] & 1) == 0)
  {
    [v4 _exerciseTimeCompletionPercentage];
    if (v3 >= 1.0) {
      ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }
  }
}

void __94__ACHMonthlyChallengeDataSource_numberOfExerciseRingsClosedDuringDateComponentInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (int64_t)numberOfStandRingsClosedDuringDateComponentInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(ACHMonthlyChallengeDataSource *)self requiresError])
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy__31;
    v18 = __Block_byref_object_dispose__31;
    id v19 = 0;
    id v7 = [(ACHMonthlyChallengeDataSource *)self activitySummaryIterator];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __91__ACHMonthlyChallengeDataSource_numberOfStandRingsClosedDuringDateComponentInterval_error___block_invoke;
    v13[3] = &unk_264516A10;
    v13[4] = &v20;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __91__ACHMonthlyChallengeDataSource_numberOfStandRingsClosedDuringDateComponentInterval_error___block_invoke_2;
    v12[3] = &unk_2645167A8;
    v12[4] = &v14;
    [v7 enumerateActivitySummariesForDateComponentInterval:v6 handler:v13 errorHandler:v12];

    id v8 = (id)v15[5];
    id v9 = v8;
    if (v8)
    {
      if (a4) {
        *a4 = v8;
      }
      else {
        _HKLogDroppedError();
      }
    }

    int64_t v10 = v21[3];
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    int64_t v10 = [(ACHMonthlyChallengeDataSource *)self numberOfStandRingsClosedDuringDateComponentInterval:v6];
  }

  return v10;
}

void __91__ACHMonthlyChallengeDataSource_numberOfStandRingsClosedDuringDateComponentInterval_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([v4 isPaused] & 1) == 0)
  {
    [v4 _standHoursCompletionPercentage];
    if (v3 >= 1.0) {
      ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }
  }
}

void __91__ACHMonthlyChallengeDataSource_numberOfStandRingsClosedDuringDateComponentInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (int64_t)numberOfAllRingsClosedDuringDateComponentInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(ACHMonthlyChallengeDataSource *)self requiresError])
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy__31;
    v18 = __Block_byref_object_dispose__31;
    id v19 = 0;
    id v7 = [(ACHMonthlyChallengeDataSource *)self activitySummaryIterator];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __89__ACHMonthlyChallengeDataSource_numberOfAllRingsClosedDuringDateComponentInterval_error___block_invoke;
    v13[3] = &unk_264516A10;
    v13[4] = &v20;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __89__ACHMonthlyChallengeDataSource_numberOfAllRingsClosedDuringDateComponentInterval_error___block_invoke_2;
    v12[3] = &unk_2645167A8;
    v12[4] = &v14;
    [v7 enumerateActivitySummariesForDateComponentInterval:v6 handler:v13 errorHandler:v12];

    id v8 = (id)v15[5];
    id v9 = v8;
    if (v8)
    {
      if (a4) {
        *a4 = v8;
      }
      else {
        _HKLogDroppedError();
      }
    }

    int64_t v10 = v21[3];
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    int64_t v10 = [(ACHMonthlyChallengeDataSource *)self numberOfAllRingsClosedDuringDateComponentInterval:v6];
  }

  return v10;
}

void __89__ACHMonthlyChallengeDataSource_numberOfAllRingsClosedDuringDateComponentInterval_error___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (([v8 isPaused] & 1) == 0)
  {
    if ([v8 activityMoveMode] == 2) {
      [v8 _moveMinutesCompletionPercentage];
    }
    else {
      [v8 _activeEnergyCompletionPercentage];
    }
    double v4 = v3;
    [v8 _exerciseTimeCompletionPercentage];
    double v6 = v5;
    [v8 _standHoursCompletionPercentage];
    if (v4 >= 1.0 && v6 >= 1.0 && v7 >= 1.0) {
      ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }
  }
}

void __89__ACHMonthlyChallengeDataSource_numberOfAllRingsClosedDuringDateComponentInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (int64_t)numberOfDaysDoublingMoveGoalDuringDateComponentInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(ACHMonthlyChallengeDataSource *)self requiresError])
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy__31;
    v18 = __Block_byref_object_dispose__31;
    id v19 = 0;
    double v7 = [(ACHMonthlyChallengeDataSource *)self activitySummaryIterator];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __95__ACHMonthlyChallengeDataSource_numberOfDaysDoublingMoveGoalDuringDateComponentInterval_error___block_invoke;
    v13[3] = &unk_264516A10;
    v13[4] = &v20;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __95__ACHMonthlyChallengeDataSource_numberOfDaysDoublingMoveGoalDuringDateComponentInterval_error___block_invoke_2;
    v12[3] = &unk_2645167A8;
    v12[4] = &v14;
    [v7 enumerateActivitySummariesForDateComponentInterval:v6 handler:v13 errorHandler:v12];

    id v8 = (id)v15[5];
    id v9 = v8;
    if (v8)
    {
      if (a4) {
        *a4 = v8;
      }
      else {
        _HKLogDroppedError();
      }
    }

    int64_t v10 = v21[3];
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    int64_t v10 = [(ACHMonthlyChallengeDataSource *)self numberOfDaysDoublingMoveGoalDuringDateComponentInterval:v6];
  }

  return v10;
}

uint64_t __95__ACHMonthlyChallengeDataSource_numberOfDaysDoublingMoveGoalDuringDateComponentInterval_error___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 isPaused];
  id v4 = v7;
  if ((v3 & 1) == 0)
  {
    uint64_t v3 = [v7 activityMoveMode] == 2
       ? [v7 _moveMinutesCompletionPercentage]
       : [v7 _activeEnergyCompletionPercentage];
    id v4 = v7;
    if (v5 >= 2.0) {
      ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }
  }
  return MEMORY[0x270F9A758](v3, v4);
}

void __95__ACHMonthlyChallengeDataSource_numberOfDaysDoublingMoveGoalDuringDateComponentInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (int64_t)numberOfDaysDoublingExerciseGoalDuringDateComponentInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(ACHMonthlyChallengeDataSource *)self requiresError])
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy__31;
    v18 = __Block_byref_object_dispose__31;
    id v19 = 0;
    id v7 = [(ACHMonthlyChallengeDataSource *)self activitySummaryIterator];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __99__ACHMonthlyChallengeDataSource_numberOfDaysDoublingExerciseGoalDuringDateComponentInterval_error___block_invoke;
    v13[3] = &unk_264516A10;
    v13[4] = &v20;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __99__ACHMonthlyChallengeDataSource_numberOfDaysDoublingExerciseGoalDuringDateComponentInterval_error___block_invoke_2;
    v12[3] = &unk_2645167A8;
    v12[4] = &v14;
    [v7 enumerateActivitySummariesForDateComponentInterval:v6 handler:v13 errorHandler:v12];

    id v8 = (id)v15[5];
    id v9 = v8;
    if (v8)
    {
      if (a4) {
        *a4 = v8;
      }
      else {
        _HKLogDroppedError();
      }
    }

    int64_t v10 = v21[3];
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    int64_t v10 = [(ACHMonthlyChallengeDataSource *)self numberOfDaysDoublingExerciseGoalDuringDateComponentInterval:v6];
  }

  return v10;
}

void __99__ACHMonthlyChallengeDataSource_numberOfDaysDoublingExerciseGoalDuringDateComponentInterval_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([v4 isPaused] & 1) == 0)
  {
    [v4 _exerciseTimeCompletionPercentage];
    if (v3 >= 2.0) {
      ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }
  }
}

void __99__ACHMonthlyChallengeDataSource_numberOfDaysDoublingExerciseGoalDuringDateComponentInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (int64_t)numberOfWorkoutsCompletedDuringDateInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(ACHMonthlyChallengeDataSource *)self requiresError])
  {
    id v7 = [(ACHMonthlyChallengeDataSource *)self workoutClient];
    int64_t v8 = [v7 numberOfWorkoutsWithDuration:v6 containedInInterval:a4 error:300.0];
  }
  else
  {
    int64_t v8 = [(ACHMonthlyChallengeDataSource *)self numberOfWorkoutsCompletedDuringDateInterval:v6];
  }

  return v8;
}

- (int64_t)numberOfCompletedWorkoutsOfType:(unint64_t)a3 andLocation:(unint64_t)a4 duringDateInterval:(id)a5 error:(id *)a6
{
  id v10 = a5;
  if ([(ACHMonthlyChallengeDataSource *)self requiresError])
  {
    id v11 = [(ACHMonthlyChallengeDataSource *)self workoutClient];
    int64_t v12 = [v11 numberOfFirstPartyWorkoutsWithDuration:a3 withType:a4 andLocation:v10 containedInInterval:a6 error:300.0];
  }
  else
  {
    int64_t v12 = [(ACHMonthlyChallengeDataSource *)self numberOfCompletedWorkoutsOfType:a3 andLocation:a4 duringDateInterval:v10];
  }

  return v12;
}

- (int64_t)longestStreakOfType:(unint64_t)a3 duringDateComponentInterval:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ([(ACHMonthlyChallengeDataSource *)self requiresError])
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    int v23 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy__31;
    v18 = __Block_byref_object_dispose__31;
    id v19 = 0;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __87__ACHMonthlyChallengeDataSource_longestStreakOfType_duringDateComponentInterval_error___block_invoke;
    v13[3] = &unk_264518450;
    v13[4] = &v14;
    void v13[5] = &v20;
    [(ACHMonthlyChallengeDataSource *)self _getCurrentAndLongestStreakForStreakType:a3 duringDateComponentInterval:v8 completion:v13];
    id v9 = (id)v15[5];
    id v10 = v9;
    if (v9)
    {
      if (a5) {
        *a5 = v9;
      }
      else {
        _HKLogDroppedError();
      }
    }

    int64_t v11 = *((int *)v21 + 6);
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    int64_t v11 = [(ACHMonthlyChallengeDataSource *)self longestStreakOfType:a3 duringDateComponentInterval:v8];
  }

  return v11;
}

void __87__ACHMonthlyChallengeDataSource_longestStreakOfType_duringDateComponentInterval_error___block_invoke(uint64_t a1, int a2, int a3, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v7 = obj;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
}

- (int64_t)currentStreakOfType:(unint64_t)a3 duringDateComponentInterval:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ([(ACHMonthlyChallengeDataSource *)self requiresError])
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    int v23 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy__31;
    v18 = __Block_byref_object_dispose__31;
    id v19 = 0;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __87__ACHMonthlyChallengeDataSource_currentStreakOfType_duringDateComponentInterval_error___block_invoke;
    v13[3] = &unk_264518450;
    v13[4] = &v14;
    void v13[5] = &v20;
    [(ACHMonthlyChallengeDataSource *)self _getCurrentAndLongestStreakForStreakType:a3 duringDateComponentInterval:v8 completion:v13];
    id v9 = (id)v15[5];
    id v10 = v9;
    if (v9)
    {
      if (a5) {
        *a5 = v9;
      }
      else {
        _HKLogDroppedError();
      }
    }

    int64_t v11 = *((int *)v21 + 6);
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    int64_t v11 = [(ACHMonthlyChallengeDataSource *)self currentStreakOfType:a3 duringDateComponentInterval:v8];
  }

  return v11;
}

void __87__ACHMonthlyChallengeDataSource_currentStreakOfType_duringDateComponentInterval_error___block_invoke(uint64_t a1, int a2, int a3, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v7 = obj;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)_getCurrentAndLongestStreakForStreakType:(unint64_t)a3 duringDateComponentInterval:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__31;
  id v17 = __Block_byref_object_dispose__31;
  id v18 = 0;
  id v10 = [(ACHMonthlyChallengeDataSource *)self activitySummaryIterator];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __113__ACHMonthlyChallengeDataSource__getCurrentAndLongestStreakForStreakType_duringDateComponentInterval_completion___block_invoke;
  v12[3] = &unk_264518478;
  void v12[5] = &v19;
  v12[6] = a3;
  v12[4] = &v23;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __113__ACHMonthlyChallengeDataSource__getCurrentAndLongestStreakForStreakType_duringDateComponentInterval_completion___block_invoke_2;
  v11[3] = &unk_2645167A8;
  v11[4] = &v13;
  [v10 enumerateActivitySummariesForDateComponentInterval:v8 handler:v12 errorHandler:v11];

  (*((void (**)(id, void, void, uint64_t))v9 + 2))(v9, *((unsigned int *)v24 + 6), *((unsigned int *)v20 + 6), v14[5]);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
}

void __113__ACHMonthlyChallengeDataSource__getCurrentAndLongestStreakForStreakType_duringDateComponentInterval_completion___block_invoke(void *a1, void *a2)
{
  id v12 = a2;
  if ([v12 isPaused]) {
    goto LABEL_15;
  }
  uint64_t v3 = a1[6];
  if (v3 == 2)
  {
    [v12 _standHoursCompletionPercentage];
  }
  else if (v3 == 1)
  {
    [v12 _exerciseTimeCompletionPercentage];
  }
  else
  {
    if (v3)
    {
LABEL_9:
      uint64_t v8 = *(void *)(a1[5] + 8);
      int v9 = *(_DWORD *)(*(void *)(a1[4] + 8) + 24);
      if (*(_DWORD *)(v8 + 24) > v9) {
        int v9 = *(_DWORD *)(v8 + 24);
      }
      *(_DWORD *)(v8 + 24) = v9;
      *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = 0;
      goto LABEL_15;
    }
    [v12 _activeEnergyCompletionPercentage];
    double v5 = v4;
    [v12 _moveMinutesCompletionPercentage];
    double v7 = v5 + v6;
  }
  if (v7 < 1.0) {
    goto LABEL_9;
  }
  ++*(_DWORD *)(*(void *)(a1[4] + 8) + 24);
  uint64_t v10 = *(void *)(a1[5] + 8);
  int v11 = *(_DWORD *)(*(void *)(a1[4] + 8) + 24);
  if (*(_DWORD *)(v10 + 24) > v11) {
    int v11 = *(_DWORD *)(v10 + 24);
  }
  *(_DWORD *)(v10 + 24) = v11;
LABEL_15:
}

void __113__ACHMonthlyChallengeDataSource__getCurrentAndLongestStreakForStreakType_duringDateComponentInterval_completion___block_invoke_2(uint64_t a1, void *a2)
{
}

- (double)numberOfDaysWithCaloriesBurnedOver:(double)a3 forDateComponentInterval:(id)a4 calendar:(id)a5 error:(id *)a6
{
  id v9 = a4;
  if ([(ACHMonthlyChallengeDataSource *)self requiresError]) {
    [(ACHMonthlyChallengeDataSource *)self _numberOfDaysWithQuantity:&__block_literal_global_28 overThreshold:v9 forDateComponentInterval:a6 error:a3];
  }
  else {
    [(ACHMonthlyChallengeDataSource *)self _numberOfDaysWithQuantity:&__block_literal_global_28 overThreshold:v9 forDateComponentInterval:a3];
  }
  double v11 = v10;

  return v11;
}

uint64_t __108__ACHMonthlyChallengeDataSource_numberOfDaysWithCaloriesBurnedOver_forDateComponentInterval_calendar_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 activeEnergyBurned];
}

- (double)numberOfDaysWithExerciseMinutesOver:(double)a3 forDateComponentInterval:(id)a4 calendar:(id)a5 error:(id *)a6
{
  id v9 = a4;
  if ([(ACHMonthlyChallengeDataSource *)self requiresError]) {
    [(ACHMonthlyChallengeDataSource *)self _numberOfDaysWithQuantity:&__block_literal_global_285_0 overThreshold:v9 forDateComponentInterval:a6 error:a3];
  }
  else {
    [(ACHMonthlyChallengeDataSource *)self _numberOfDaysWithQuantity:&__block_literal_global_285_0 overThreshold:v9 forDateComponentInterval:a3];
  }
  double v11 = v10;

  return v11;
}

uint64_t __109__ACHMonthlyChallengeDataSource_numberOfDaysWithExerciseMinutesOver_forDateComponentInterval_calendar_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 appleExerciseTime];
}

- (double)numberOfDaysWithDistanceOver:(double)a3 forDateComponentInterval:(id)a4 calendar:(id)a5 error:(id *)a6
{
  id v9 = a4;
  if ([(ACHMonthlyChallengeDataSource *)self requiresError]) {
    [(ACHMonthlyChallengeDataSource *)self _numberOfDaysWithQuantity:&__block_literal_global_287_0 overThreshold:v9 forDateComponentInterval:a6 error:a3];
  }
  else {
    [(ACHMonthlyChallengeDataSource *)self _numberOfDaysWithQuantity:&__block_literal_global_287_0 overThreshold:v9 forDateComponentInterval:a3];
  }
  double v11 = v10;

  return v11;
}

uint64_t __102__ACHMonthlyChallengeDataSource_numberOfDaysWithDistanceOver_forDateComponentInterval_calendar_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 distanceWalkingRunning];
}

- (double)numberOfDaysWithAppleMoveTimeOver:(double)a3 forDateComponentInterval:(id)a4 calendar:(id)a5 error:(id *)a6
{
  id v9 = a4;
  if ([(ACHMonthlyChallengeDataSource *)self requiresError]) {
    [(ACHMonthlyChallengeDataSource *)self _numberOfDaysWithQuantity:&__block_literal_global_289_0 overThreshold:v9 forDateComponentInterval:a6 error:a3];
  }
  else {
    [(ACHMonthlyChallengeDataSource *)self _numberOfDaysWithQuantity:&__block_literal_global_289_0 overThreshold:v9 forDateComponentInterval:a3];
  }
  double v11 = v10;

  return v11;
}

uint64_t __107__ACHMonthlyChallengeDataSource_numberOfDaysWithAppleMoveTimeOver_forDateComponentInterval_calendar_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 appleMoveTime];
}

- (double)_numberOfDaysWithQuantity:(id)a3 overThreshold:(double)a4 forDateComponentInterval:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v29 = 0;
  v30 = (double *)&v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  int v26 = __Block_byref_object_copy__31;
  uint64_t v27 = __Block_byref_object_dispose__31;
  id v28 = 0;
  id v12 = [(ACHMonthlyChallengeDataSource *)self activitySummaryIterator];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __104__ACHMonthlyChallengeDataSource__numberOfDaysWithQuantity_overThreshold_forDateComponentInterval_error___block_invoke;
  v19[3] = &unk_2645184C0;
  id v13 = v10;
  double v22 = a4;
  id v20 = v13;
  uint64_t v21 = &v29;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __104__ACHMonthlyChallengeDataSource__numberOfDaysWithQuantity_overThreshold_forDateComponentInterval_error___block_invoke_2;
  v18[3] = &unk_2645167A8;
  v18[4] = &v23;
  [v12 enumerateActivitySummariesForDateComponentInterval:v11 handler:v19 errorHandler:v18];

  id v14 = (id)v24[5];
  uint64_t v15 = v14;
  if (v14)
  {
    if (a6) {
      *a6 = v14;
    }
    else {
      _HKLogDroppedError();
    }
  }

  double v16 = v30[3];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v16;
}

void __104__ACHMonthlyChallengeDataSource__numberOfDaysWithQuantity_overThreshold_forDateComponentInterval_error___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (([v7 isPaused] & 1) == 0)
  {
    uint64_t v3 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    [v3 _value];
    double v5 = v4;
    double v6 = *(double *)(a1 + 48);

    if (v5 >= v6) {
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
    }
                                                                              + 24)
                                                                  + 1.0;
  }
}

void __104__ACHMonthlyChallengeDataSource__numberOfDaysWithQuantity_overThreshold_forDateComponentInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (double)_numberOfDaysWithQuantity:(id)a3 overThreshold:(double)a4 forDateComponentInterval:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v18 = 0;
  uint64_t v19 = (double *)&v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  id v10 = [(ACHMonthlyChallengeDataSource *)self activitySummaryUtility];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __98__ACHMonthlyChallengeDataSource__numberOfDaysWithQuantity_overThreshold_forDateComponentInterval___block_invoke;
  v14[3] = &unk_2645184E8;
  id v11 = v8;
  double v17 = a4;
  id v15 = v11;
  double v16 = &v18;
  [v10 enumerateActivitySummariesForDateComponentInterval:v9 handler:v14];

  double v12 = v19[3];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __98__ACHMonthlyChallengeDataSource__numberOfDaysWithQuantity_overThreshold_forDateComponentInterval___block_invoke(uint64_t a1)
{
  v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [v2 _value];
  double v4 = v3;
  double v5 = *(double *)(a1 + 48);

  if (v4 >= v5) {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
  }
                                                                            + 24)
                                                                + 1.0;
}

- (double)valueForMonthlyChallengeType:(unint64_t)a3 forDateComponentInterval:(id)a4 inCalendar:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  switch(a3)
  {
    case 1uLL:
      uint64_t v13 = [(ACHMonthlyChallengeDataSource *)self numberOfAllRingsClosedDuringDateComponentInterval:v8];
      goto LABEL_16;
    case 2uLL:
      uint64_t v13 = [(ACHMonthlyChallengeDataSource *)self numberOfMoveRingsClosedDuringDateComponentInterval:v8];
      goto LABEL_16;
    case 3uLL:
      uint64_t v13 = [(ACHMonthlyChallengeDataSource *)self numberOfExerciseRingsClosedDuringDateComponentInterval:v8];
      goto LABEL_16;
    case 4uLL:
      uint64_t v13 = [(ACHMonthlyChallengeDataSource *)self numberOfStandRingsClosedDuringDateComponentInterval:v8];
      goto LABEL_16;
    case 5uLL:
      [(ACHMonthlyChallengeDataSource *)self caloriesDuringDateComponentInterval:v8];
      goto LABEL_22;
    case 6uLL:
      [(ACHMonthlyChallengeDataSource *)self exerciseMinutesDuringDateComponentInterval:v8];
      goto LABEL_22;
    case 7uLL:
      id v15 = [(ACHMonthlyChallengeDataSource *)self _inclusiveDateIntervalFor:v9 andDateComponentInterval:v8];
      double v12 = (double)[(ACHMonthlyChallengeDataSource *)self numberOfWorkoutsCompletedDuringDateInterval:v15];

      break;
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
      id v10 = [(ACHMonthlyChallengeDataSource *)self _inclusiveDateIntervalFor:v9 andDateComponentInterval:v8];
      uint64_t v11 = ACHWorkoutActivityTypeForMonthlyChallengeType();
      double v12 = (double)[(ACHMonthlyChallengeDataSource *)self numberOfCompletedWorkoutsOfType:v11 andLocation:ACHWorkoutLocationTypeForMonthlyChallengeType() duringDateInterval:v10];

      break;
    case 0x14uLL:
      [(ACHMonthlyChallengeDataSource *)self walkingRunningDistanceDuringDateComponentInterval:v8];
      goto LABEL_22;
    case 0x15uLL:
      uint64_t v13 = [(ACHMonthlyChallengeDataSource *)self numberOfDaysDoublingMoveGoalDuringDateComponentInterval:v8];
      goto LABEL_16;
    case 0x16uLL:
      [(ACHMonthlyChallengeDataSource *)self moveTimeDuringDateComponentInterval:v8];
      goto LABEL_22;
    case 0x17uLL:
      uint64_t v13 = [(ACHMonthlyChallengeDataSource *)self numberOfDaysDoublingExerciseGoalDuringDateComponentInterval:v8];
      goto LABEL_16;
    case 0x18uLL:
      uint64_t v13 = [(ACHMonthlyChallengeDataSource *)self currentStreakOfType:0 duringDateComponentInterval:v8];
LABEL_16:
      double v12 = (double)v13;
      break;
    case 0x19uLL:
      [(ACHMonthlyChallengeDataSource *)self caloriesDuringDateComponentInterval:v8];
      goto LABEL_21;
    case 0x1AuLL:
      [(ACHMonthlyChallengeDataSource *)self exerciseMinutesDuringDateComponentInterval:v8];
      goto LABEL_21;
    case 0x1BuLL:
      [(ACHMonthlyChallengeDataSource *)self walkingRunningDistanceDuringDateComponentInterval:v8];
      goto LABEL_21;
    case 0x1CuLL:
      [(ACHMonthlyChallengeDataSource *)self moveTimeDuringDateComponentInterval:v8];
LABEL_21:
      -[ACHMonthlyChallengeDataSource _dailyAverageValueForMonthlyChallengeWithDailyTargetValue:andDateComponentInterval:](self, "_dailyAverageValueForMonthlyChallengeWithDailyTargetValue:andDateComponentInterval:", v8);
LABEL_22:
      double v12 = v14;
      break;
    default:
      double v12 = -1.0;
      break;
  }

  return v12;
}

- (id)_inclusiveDateIntervalFor:(id)a3 andDateComponentInterval:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 startDateComponents];
  id v8 = [v6 dateFromComponents:v7];
  id v9 = [v6 startOfDayForDate:v8];

  id v10 = [v5 endDateComponents];

  uint64_t v11 = [v6 dateFromComponents:v10];
  double v12 = [v6 startOfDayForDate:v11];

  uint64_t v13 = objc_msgSend(v6, "hk_dateByAddingDays:toDate:", 1, v12);

  double v14 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v9 endDate:v13];
  return v14;
}

- (double)caloriesDuringDateComponentInterval:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F0A830] kilocalorieUnit];
  uint64_t v13 = 0;
  double v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  id v6 = [(ACHMonthlyChallengeDataSource *)self activitySummaryUtility];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__ACHMonthlyChallengeDataSource_caloriesDuringDateComponentInterval___block_invoke;
  v10[3] = &unk_264518510;
  double v12 = &v13;
  id v7 = v5;
  id v11 = v7;
  [v6 enumerateActivitySummariesForDateComponentInterval:v4 handler:v10];

  double v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __69__ACHMonthlyChallengeDataSource_caloriesDuringDateComponentInterval___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 activityMoveMode] != 2)
  {
    double v3 = [v5 activeEnergyBurned];
    [v3 doubleValueForUnit:*(void *)(a1 + 32)];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
  }
}

- (double)moveTimeDuringDateComponentInterval:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F0A830] minuteUnit];
  uint64_t v13 = 0;
  double v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  id v6 = [(ACHMonthlyChallengeDataSource *)self activitySummaryUtility];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__ACHMonthlyChallengeDataSource_moveTimeDuringDateComponentInterval___block_invoke;
  v10[3] = &unk_264518510;
  double v12 = &v13;
  id v7 = v5;
  id v11 = v7;
  [v6 enumerateActivitySummariesForDateComponentInterval:v4 handler:v10];

  double v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __69__ACHMonthlyChallengeDataSource_moveTimeDuringDateComponentInterval___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 activityMoveMode] == 2)
  {
    double v3 = [v5 appleMoveTime];
    [v3 doubleValueForUnit:*(void *)(a1 + 32)];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
  }
}

- (double)exerciseMinutesDuringDateComponentInterval:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F0A830] minuteUnit];
  uint64_t v13 = 0;
  double v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  id v6 = [(ACHMonthlyChallengeDataSource *)self activitySummaryUtility];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__ACHMonthlyChallengeDataSource_exerciseMinutesDuringDateComponentInterval___block_invoke;
  v10[3] = &unk_264518510;
  double v12 = &v13;
  id v7 = v5;
  id v11 = v7;
  [v6 enumerateActivitySummariesForDateComponentInterval:v4 handler:v10];

  double v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __76__ACHMonthlyChallengeDataSource_exerciseMinutesDuringDateComponentInterval___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 appleExerciseTime];
  [v4 doubleValueForUnit:*(void *)(a1 + 32)];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
}

- (double)walkingRunningDistanceDuringDateComponentInterval:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F0A830] meterUnit];
  uint64_t v13 = 0;
  double v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  id v6 = [(ACHMonthlyChallengeDataSource *)self activitySummaryUtility];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__ACHMonthlyChallengeDataSource_walkingRunningDistanceDuringDateComponentInterval___block_invoke;
  v10[3] = &unk_264518510;
  double v12 = &v13;
  id v7 = v5;
  id v11 = v7;
  [v6 enumerateActivitySummariesForDateComponentInterval:v4 handler:v10];

  double v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __83__ACHMonthlyChallengeDataSource_walkingRunningDistanceDuringDateComponentInterval___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 distanceWalkingRunning];
  [v4 doubleValueForUnit:*(void *)(a1 + 32)];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
}

- (int64_t)numberOfMoveRingsClosedDuringDateComponentInterval:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  id v5 = [(ACHMonthlyChallengeDataSource *)self activitySummaryUtility];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__ACHMonthlyChallengeDataSource_numberOfMoveRingsClosedDuringDateComponentInterval___block_invoke;
  v8[3] = &unk_264517368;
  v8[4] = &v9;
  [v5 enumerateActivitySummariesForDateComponentInterval:v4 handler:v8];

  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __84__ACHMonthlyChallengeDataSource_numberOfMoveRingsClosedDuringDateComponentInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 activityMoveMode] == 2) {
    [v3 _moveMinutesCompletionPercentage];
  }
  else {
    [v3 _activeEnergyCompletionPercentage];
  }
  double v5 = v4;

  if (v5 >= 1.0) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (int64_t)numberOfExerciseRingsClosedDuringDateComponentInterval:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  double v5 = [(ACHMonthlyChallengeDataSource *)self activitySummaryUtility];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __88__ACHMonthlyChallengeDataSource_numberOfExerciseRingsClosedDuringDateComponentInterval___block_invoke;
  v8[3] = &unk_264517368;
  v8[4] = &v9;
  [v5 enumerateActivitySummariesForDateComponentInterval:v4 handler:v8];

  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __88__ACHMonthlyChallengeDataSource_numberOfExerciseRingsClosedDuringDateComponentInterval___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 _exerciseTimeCompletionPercentage];
  if (v4 >= 1.0) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

- (int64_t)numberOfStandRingsClosedDuringDateComponentInterval:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  double v5 = [(ACHMonthlyChallengeDataSource *)self activitySummaryUtility];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__ACHMonthlyChallengeDataSource_numberOfStandRingsClosedDuringDateComponentInterval___block_invoke;
  v8[3] = &unk_264517368;
  v8[4] = &v9;
  [v5 enumerateActivitySummariesForDateComponentInterval:v4 handler:v8];

  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __85__ACHMonthlyChallengeDataSource_numberOfStandRingsClosedDuringDateComponentInterval___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 _standHoursCompletionPercentage];
  if (v4 >= 1.0) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

- (int64_t)numberOfAllRingsClosedDuringDateComponentInterval:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  double v5 = [(ACHMonthlyChallengeDataSource *)self activitySummaryUtility];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __83__ACHMonthlyChallengeDataSource_numberOfAllRingsClosedDuringDateComponentInterval___block_invoke;
  v8[3] = &unk_264517368;
  v8[4] = &v9;
  [v5 enumerateActivitySummariesForDateComponentInterval:v4 handler:v8];

  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __83__ACHMonthlyChallengeDataSource_numberOfAllRingsClosedDuringDateComponentInterval___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if ([v10 activityMoveMode] == 2) {
    [v10 _moveMinutesCompletionPercentage];
  }
  else {
    [v10 _activeEnergyCompletionPercentage];
  }
  double v4 = v3;
  [v10 _exerciseTimeCompletionPercentage];
  double v6 = v5;
  [v10 _standHoursCompletionPercentage];
  if (v4 >= 1.0 && v6 >= 1.0 && v7 >= 1.0) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (int64_t)numberOfDaysDoublingMoveGoalDuringDateComponentInterval:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  double v5 = [(ACHMonthlyChallengeDataSource *)self activitySummaryUtility];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __89__ACHMonthlyChallengeDataSource_numberOfDaysDoublingMoveGoalDuringDateComponentInterval___block_invoke;
  v8[3] = &unk_264517368;
  v8[4] = &v9;
  [v5 enumerateActivitySummariesForDateComponentInterval:v4 handler:v8];

  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __89__ACHMonthlyChallengeDataSource_numberOfDaysDoublingMoveGoalDuringDateComponentInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 activityMoveMode] == 2) {
    [v3 _moveMinutesCompletionPercentage];
  }
  else {
    [v3 _activeEnergyCompletionPercentage];
  }
  double v5 = v4;

  if (v5 >= 2.0) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (int64_t)numberOfDaysDoublingExerciseGoalDuringDateComponentInterval:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  double v5 = [(ACHMonthlyChallengeDataSource *)self activitySummaryUtility];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __93__ACHMonthlyChallengeDataSource_numberOfDaysDoublingExerciseGoalDuringDateComponentInterval___block_invoke;
  v8[3] = &unk_264517368;
  v8[4] = &v9;
  [v5 enumerateActivitySummariesForDateComponentInterval:v4 handler:v8];

  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __93__ACHMonthlyChallengeDataSource_numberOfDaysDoublingExerciseGoalDuringDateComponentInterval___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 _exerciseTimeCompletionPercentage];
  if (v4 >= 2.0) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

- (int64_t)numberOfWorkoutsCompletedDuringDateInterval:(id)a3
{
  id v4 = a3;
  double v5 = [(ACHMonthlyChallengeDataSource *)self workoutUtility];
  int64_t v6 = [v5 numberOfWorkoutsWithDuration:v4 containedInInterval:300.0];

  return v6;
}

- (int64_t)numberOfCompletedWorkoutsOfType:(unint64_t)a3 andLocation:(unint64_t)a4 duringDateInterval:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(ACHMonthlyChallengeDataSource *)self workoutUtility];
  int64_t v10 = [v9 numberOfFirstPartyWorkoutsWithDuration:a3 withType:a4 andLocation:v8 containedInInterval:300.0];

  return v10;
}

- (int64_t)longestStreakOfType:(unint64_t)a3 duringDateComponentInterval:(id)a4
{
  id v6 = a4;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__ACHMonthlyChallengeDataSource_longestStreakOfType_duringDateComponentInterval___block_invoke;
  v9[3] = &unk_264518538;
  v9[4] = &v10;
  [(ACHMonthlyChallengeDataSource *)self _getNoErrorLongestAndCurrentStreakForStreakType:a3 duringDateComponentInterval:v6 completion:v9];
  int64_t v7 = *((int *)v11 + 6);
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __81__ACHMonthlyChallengeDataSource_longestStreakOfType_duringDateComponentInterval___block_invoke(uint64_t result, uint64_t a2, int a3)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
  return result;
}

- (int64_t)currentStreakOfType:(unint64_t)a3 duringDateComponentInterval:(id)a4
{
  id v6 = a4;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__ACHMonthlyChallengeDataSource_currentStreakOfType_duringDateComponentInterval___block_invoke;
  v9[3] = &unk_264518538;
  v9[4] = &v10;
  [(ACHMonthlyChallengeDataSource *)self _getNoErrorLongestAndCurrentStreakForStreakType:a3 duringDateComponentInterval:v6 completion:v9];
  int64_t v7 = *((int *)v11 + 6);
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __81__ACHMonthlyChallengeDataSource_currentStreakOfType_duringDateComponentInterval___block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)_getNoErrorLongestAndCurrentStreakForStreakType:(unint64_t)a3 duringDateComponentInterval:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v16 = 0;
  double v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  uint64_t v10 = [(ACHMonthlyChallengeDataSource *)self activitySummaryUtility];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __120__ACHMonthlyChallengeDataSource__getNoErrorLongestAndCurrentStreakForStreakType_duringDateComponentInterval_completion___block_invoke;
  v11[3] = &unk_264518560;
  void v11[5] = &v12;
  v11[6] = a3;
  v11[4] = &v16;
  [v10 enumerateActivitySummariesForDateComponentInterval:v8 handler:v11];

  (*((void (**)(id, void, void))v9 + 2))(v9, *((unsigned int *)v17 + 6), *((unsigned int *)v13 + 6));
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
}

void __120__ACHMonthlyChallengeDataSource__getNoErrorLongestAndCurrentStreakForStreakType_duringDateComponentInterval_completion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[6];
  if (v4 == 2)
  {
    id v13 = v3;
    [v3 _standHoursCompletionPercentage];
  }
  else if (v4 == 1)
  {
    id v13 = v3;
    [v3 _exerciseTimeCompletionPercentage];
  }
  else
  {
    if (v4)
    {
LABEL_8:
      uint64_t v9 = *(void *)(a1[5] + 8);
      int v10 = *(_DWORD *)(*(void *)(a1[4] + 8) + 24);
      if (*(_DWORD *)(v9 + 24) > v10) {
        int v10 = *(_DWORD *)(v9 + 24);
      }
      *(_DWORD *)(v9 + 24) = v10;
      *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = 0;
      goto LABEL_14;
    }
    id v13 = v3;
    [v3 _activeEnergyCompletionPercentage];
    double v6 = v5;
    [v13 _moveMinutesCompletionPercentage];
    double v8 = v6 + v7;
  }
  id v3 = v13;
  if (v8 < 1.0) {
    goto LABEL_8;
  }
  ++*(_DWORD *)(*(void *)(a1[4] + 8) + 24);
  uint64_t v11 = *(void *)(a1[5] + 8);
  int v12 = *(_DWORD *)(*(void *)(a1[4] + 8) + 24);
  if (*(_DWORD *)(v11 + 24) > v12) {
    int v12 = *(_DWORD *)(v11 + 24);
  }
  *(_DWORD *)(v11 + 24) = v12;
LABEL_14:
}

- (HDDatabaseTransactionContext)databaseContext
{
  return self->_databaseContext;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (ACHWorkoutUtility)workoutUtility
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workoutUtility);
  return (ACHWorkoutUtility *)WeakRetained;
}

- (void)setWorkoutUtility:(id)a3
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

- (ACHAwardsWorkoutClient)workoutClient
{
  return self->_workoutClient;
}

- (void)setWorkoutClient:(id)a3
{
}

- (ACHActivitySummaryIterator)activitySummaryIterator
{
  return self->_activitySummaryIterator;
}

- (void)setActivitySummaryIterator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitySummaryIterator, 0);
  objc_storeStrong((id *)&self->_workoutClient, 0);
  objc_destroyWeak((id *)&self->_activitySummaryUtility);
  objc_destroyWeak((id *)&self->_workoutUtility);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_databaseContext, 0);
}

@end