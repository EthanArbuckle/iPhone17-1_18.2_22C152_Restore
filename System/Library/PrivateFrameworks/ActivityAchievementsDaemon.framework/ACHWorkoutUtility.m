@interface ACHWorkoutUtility
- (ACHWorkoutUtility)initWithProfile:(id)a3;
- (HDDatabaseTransactionContext)databaseContext;
- (HDProfile)profile;
- (HDSQLitePredicate)firstPartyPredicate;
- (double)_sumMindfulMinutesForSessions:(id)a3 dateInterval:(id)a4;
- (id)_predicateWithDuration:(double)a3 withType:(id)a4 startingAtOrAfterDate:(id)a5 endingOnOrBeforeDate:(id)a6 firstPartyOnly:(BOOL)a7;
- (id)_readingContextWithIdentifier:(id)a3;
- (id)bestDistanceForFirstPartyWorkoutsWithType:(unint64_t)a3 endingBeforeDate:(id)a4;
- (id)bestEnergyBurnedForFirstPartyWorkoutsWithType:(unint64_t)a3 endingBeforeDate:(id)a4;
- (id)mindfulMinutesForForDateInterval:(id)a3;
- (id)workoutsInDateInterval:(id)a3;
- (id)workoutsWithDuration:(double)a3 withType:(id)a4 startingAtOrAfterDate:(id)a5 endingOnOrBeforeDate:(id)a6 firstPartyOnly:(BOOL)a7;
- (unint64_t)_countOfSamplesWithPredicate:(id)a3;
- (unint64_t)_countOfSamplesWithPredicate:(id)a3 andLocationType:(unint64_t)a4;
- (unint64_t)numberOfFirstPartyWorkoutsWithDuration:(double)a3 containedInInterval:(id)a4;
- (unint64_t)numberOfFirstPartyWorkoutsWithDuration:(double)a3 withType:(unint64_t)a4 andLocation:(unint64_t)a5 containedInInterval:(id)a6;
- (unint64_t)numberOfFirstPartyWorkoutsWithDuration:(double)a3 withType:(unint64_t)a4 endingOnOrBeforeDate:(id)a5;
- (unint64_t)numberOfWorkoutsWithDuration:(double)a3 containedInInterval:(id)a4;
- (void)_performReadTransaction:(id)a3 error:(id *)a4 block:(id)a5;
- (void)setDatabaseContext:(id)a3;
- (void)setFirstPartyPredicate:(id)a3;
- (void)setProfile:(id)a3;
@end

@implementation ACHWorkoutUtility

- (unint64_t)numberOfFirstPartyWorkoutsWithDuration:(double)a3 containedInInterval:(id)a4
{
  id v6 = a4;
  v7 = [v6 startDate];
  v8 = [v6 endDate];

  v9 = [(ACHWorkoutUtility *)self _predicateWithDuration:0 withType:v7 startingAtOrAfterDate:v8 endingOnOrBeforeDate:1 firstPartyOnly:a3];

  unint64_t v10 = [(ACHWorkoutUtility *)self _countOfSamplesWithPredicate:v9];
  return v10;
}

- (id)_predicateWithDuration:(double)a3 withType:(id)a4 startingAtOrAfterDate:(id)a5 endingOnOrBeforeDate:(id)a6 firstPartyOnly:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v7)
  {
    v15 = [(ACHWorkoutUtility *)self firstPartyPredicate];
    [v14 addObject:v15];
  }
  if (v12)
  {
    v16 = HDSampleEntityPredicateForStartDate();
    [v14 addObject:v16];
  }
  if (v13)
  {
    v17 = HDSampleEntityPredicateForEndDate();
    [v14 addObject:v17];
  }
  if (v11)
  {
    [v11 unsignedIntegerValue];
    v18 = HDWorkoutEntityPredicateForWorkoutActivityType();
    [v14 addObject:v18];
  }
  else
  {
    v18 = HDWorkoutEntityPredicateForWorkoutActivityType();
    v19 = [MEMORY[0x263F434A8] negatedPredicate:v18];
    [v14 addObject:v19];
  }
  v20 = HDWorkoutEntityPredicateForDuration();
  [v14 addObject:v20];
  v21 = [MEMORY[0x263F434A8] predicateMatchingAllPredicates:v14];

  return v21;
}

- (HDSQLitePredicate)firstPartyPredicate
{
  firstPartyPredicate = self->_firstPartyPredicate;
  if (!firstPartyPredicate)
  {
    HDDataEntityPredicateForObjectsFromAppleWatchSources();
    v4 = (HDSQLitePredicate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_firstPartyPredicate;
    self->_firstPartyPredicate = v4;

    firstPartyPredicate = self->_firstPartyPredicate;
  }
  return firstPartyPredicate;
}

- (unint64_t)_countOfSamplesWithPredicate:(id)a3 andLocationType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  BOOL v7 = [(ACHWorkoutUtility *)self profile];
  v8 = (void *)MEMORY[0x263F43318];
  if (a4)
  {
    v9 = [MEMORY[0x263F0A6E8] workoutType];
    unint64_t v10 = [v8 entityEnumeratorWithType:v9 profile:v7];

    [v10 setPredicate:v6];
    v16[5] = a4;
    id v17 = 0;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __66__ACHWorkoutUtility__countOfSamplesWithPredicate_andLocationType___block_invoke;
    v16[3] = &unk_2645188A8;
    v16[4] = &v19;
    [v10 enumerateWithError:&v17 handler:v16];
    id v11 = v17;
  }
  else
  {
    unint64_t v10 = [MEMORY[0x263F0A598] workoutType];
    id v18 = 0;
    uint64_t v12 = [v8 countOfSamplesWithType:v10 profile:v7 matchingPredicate:v6 withError:&v18];
    id v11 = v18;
    v20[3] = v12;
  }

  if (v11)
  {
    id v13 = ACHLogWorkouts();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACHWorkoutUtility _countOfSamplesWithPredicate:andLocationType:]((uint64_t)v11, v13);
    }
  }
  unint64_t v14 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v14;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (unint64_t)_countOfSamplesWithPredicate:(id)a3
{
  return [(ACHWorkoutUtility *)self _countOfSamplesWithPredicate:a3 andLocationType:0];
}

- (ACHWorkoutUtility)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ACHWorkoutUtility;
  v5 = [(ACHWorkoutUtility *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_profile, v4);
  }

  return v6;
}

- (id)_readingContextWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(ACHWorkoutUtility *)self profile];
  id v6 = [v5 database];
  id v12 = 0;
  BOOL v7 = +[ACHDatabaseAssertion assertionWithDatabase:v6 identifier:v4 error:&v12];

  id v8 = v12;
  if (v8)
  {
    v9 = ACHLogXPC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ACHAwardsServer _transactionContextForWritingProtectedDataWithIdentifier:]((uint64_t)v8, v9);
    }
  }
  unint64_t v10 = ACHDatabaseContextWithAccessibilityAssertion(v7);
  [v10 setRequiresProtectedData:1];

  return v10;
}

- (id)workoutsInDateInterval:(id)a3
{
  id v4 = a3;
  v5 = [v4 startDate];
  id v6 = [v4 endDate];

  BOOL v7 = [(ACHWorkoutUtility *)self workoutsWithDuration:0 withType:v5 startingAtOrAfterDate:v6 endingOnOrBeforeDate:0 firstPartyOnly:0.0];

  return v7;
}

- (unint64_t)numberOfWorkoutsWithDuration:(double)a3 containedInInterval:(id)a4
{
  id v6 = a4;
  BOOL v7 = [v6 startDate];
  id v8 = [v6 endDate];

  v9 = [(ACHWorkoutUtility *)self _predicateWithDuration:0 withType:v7 startingAtOrAfterDate:v8 endingOnOrBeforeDate:0 firstPartyOnly:a3];

  unint64_t v10 = [(ACHWorkoutUtility *)self _countOfSamplesWithPredicate:v9];
  return v10;
}

- (unint64_t)numberOfFirstPartyWorkoutsWithDuration:(double)a3 withType:(unint64_t)a4 endingOnOrBeforeDate:(id)a5
{
  id v8 = NSNumber;
  id v9 = a5;
  unint64_t v10 = [v8 numberWithUnsignedInteger:a4];
  id v11 = [(ACHWorkoutUtility *)self _predicateWithDuration:v10 withType:0 startingAtOrAfterDate:v9 endingOnOrBeforeDate:1 firstPartyOnly:a3];

  unint64_t v12 = [(ACHWorkoutUtility *)self _countOfSamplesWithPredicate:v11];
  return v12;
}

- (unint64_t)numberOfFirstPartyWorkoutsWithDuration:(double)a3 withType:(unint64_t)a4 andLocation:(unint64_t)a5 containedInInterval:(id)a6
{
  unint64_t v10 = NSNumber;
  id v11 = a6;
  unint64_t v12 = [v10 numberWithUnsignedInteger:a4];
  id v13 = [v11 startDate];
  unint64_t v14 = [v11 endDate];

  v15 = [(ACHWorkoutUtility *)self _predicateWithDuration:v12 withType:v13 startingAtOrAfterDate:v14 endingOnOrBeforeDate:1 firstPartyOnly:a3];

  unint64_t v16 = [(ACHWorkoutUtility *)self _countOfSamplesWithPredicate:v15 andLocationType:a5];
  return v16;
}

- (id)workoutsWithDuration:(double)a3 withType:(id)a4 startingAtOrAfterDate:(id)a5 endingOnOrBeforeDate:(id)a6 firstPartyOnly:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [(ACHWorkoutUtility *)self _predicateWithDuration:v12 withType:v13 startingAtOrAfterDate:v14 endingOnOrBeforeDate:v7 firstPartyOnly:a3];
  unint64_t v16 = [(ACHWorkoutUtility *)self profile];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__34;
  v36 = __Block_byref_object_dispose__34;
  id v37 = 0;
  v30 = &v32;
  id v31 = 0;
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  v26 = __109__ACHWorkoutUtility_workoutsWithDuration_withType_startingAtOrAfterDate_endingOnOrBeforeDate_firstPartyOnly___block_invoke;
  v27 = &unk_264515F30;
  id v17 = v16;
  id v28 = v17;
  id v18 = v15;
  id v29 = v18;
  [(ACHWorkoutUtility *)self _performReadTransaction:@"WorkoutsWithDuration" error:&v31 block:&v24];
  id v19 = v31;
  if (v19)
  {
    v20 = ACHLogWorkouts();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_msgSend(MEMORY[0x263F0A8F8], "_stringFromWorkoutActivityType:", objc_msgSend(v12, "unsignedIntegerValue", v24, v25, v26, v27, v28));
      *(_DWORD *)buf = 67110402;
      BOOL v39 = v7;
      __int16 v40 = 2048;
      uint64_t v41 = (uint64_t)a3;
      __int16 v42 = 2114;
      v43 = v23;
      __int16 v44 = 2114;
      id v45 = v13;
      __int16 v46 = 2114;
      id v47 = v14;
      __int16 v48 = 2114;
      id v49 = v19;
      _os_log_error_impl(&dword_21F5DA000, v20, OS_LOG_TYPE_ERROR, "Failed to fetch workouts with firstPartyOnly: %{BOOL}d, duration: %ld, type: %{public}@, date interval: (%{public}@, %{public}@): %{public}@", buf, 0x3Au);
    }
    id v21 = 0;
  }
  else
  {
    id v21 = (id)v33[5];
  }

  _Block_object_dispose(&v32, 8);
  return v21;
}

uint64_t __109__ACHWorkoutUtility_workoutsWithDuration_withType_startingAtOrAfterDate_endingOnOrBeforeDate_firstPartyOnly___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  v5 = (void *)MEMORY[0x263F43318];
  id v6 = [MEMORY[0x263F0A598] workoutType];
  uint64_t v7 = [v5 samplesWithType:v6 profile:a1[4] encodingOptions:0 predicate:a1[5] limit:0 anchor:0 error:a3];
  uint64_t v8 = *(void *)(a1[6] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return 1;
}

- (id)bestEnergyBurnedForFirstPartyWorkoutsWithType:(unint64_t)a3 endingBeforeDate:(id)a4
{
  v33[4] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = HDSampleEntityPredicateForEndDate();
  uint64_t v7 = HDWorkoutEntityPredicateForWorkoutActivityType();
  uint64_t v8 = [MEMORY[0x263F0A948] workoutType];
  id v9 = HDSampleEntityPredicateForDataType();

  unint64_t v10 = (void *)MEMORY[0x263F434A8];
  v33[0] = v6;
  v33[1] = v7;
  v33[2] = v9;
  id v11 = [(ACHWorkoutUtility *)self firstPartyPredicate];
  v33[3] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
  id v13 = [v10 predicateMatchingAllPredicates:v12];

  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__34;
  id v31 = __Block_byref_object_dispose__34;
  id v32 = 0;
  uint64_t v25 = &v27;
  id v26 = 0;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __84__ACHWorkoutUtility_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate___block_invoke;
  v23 = &unk_264516D18;
  id v14 = v13;
  id v24 = v14;
  [(ACHWorkoutUtility *)self _performReadTransaction:@"BestWorkoutEnergyBurned" error:&v26 block:&v20];
  id v15 = v26;
  if (v15)
  {
    unint64_t v16 = ACHLogWorkouts();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ACHWorkoutUtility bestEnergyBurnedForFirstPartyWorkoutsWithType:endingBeforeDate:]();
    }
    id v17 = 0;
  }
  else
  {
    id v18 = (void *)MEMORY[0x263F0A630];
    unint64_t v16 = objc_msgSend(MEMORY[0x263F0A830], "kilocalorieUnit", v20, v21, v22, v23);
    [(id)v28[5] doubleValue];
    id v17 = objc_msgSend(v18, "quantityWithUnit:doubleValue:", v16);
  }

  _Block_object_dispose(&v27, 8);
  return v17;
}

uint64_t __84__ACHWorkoutUtility_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:objc_opt_class()];

  uint64_t v7 = [MEMORY[0x263F43458] maxValueForProperty:@"total_energy_burned" predicate:*(void *)(a1 + 32) database:v6 error:a3];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return 1;
}

- (id)bestDistanceForFirstPartyWorkoutsWithType:(unint64_t)a3 endingBeforeDate:(id)a4
{
  v33[4] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = HDSampleEntityPredicateForEndDate();
  uint64_t v7 = HDWorkoutEntityPredicateForWorkoutActivityType();
  uint64_t v8 = [MEMORY[0x263F0A948] workoutType];
  id v9 = HDSampleEntityPredicateForDataType();

  unint64_t v10 = (void *)MEMORY[0x263F434A8];
  v33[0] = v6;
  v33[1] = v7;
  v33[2] = v9;
  id v11 = [(ACHWorkoutUtility *)self firstPartyPredicate];
  v33[3] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
  id v13 = [v10 predicateMatchingAllPredicates:v12];

  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__34;
  id v31 = __Block_byref_object_dispose__34;
  id v32 = 0;
  uint64_t v25 = &v27;
  id v26 = 0;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __80__ACHWorkoutUtility_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate___block_invoke;
  v23 = &unk_264516D18;
  id v14 = v13;
  id v24 = v14;
  [(ACHWorkoutUtility *)self _performReadTransaction:@"BestWorkoutDistance" error:&v26 block:&v20];
  id v15 = v26;
  if (v15)
  {
    unint64_t v16 = ACHLogWorkouts();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ACHWorkoutUtility bestDistanceForFirstPartyWorkoutsWithType:endingBeforeDate:]();
    }
    id v17 = 0;
  }
  else
  {
    id v18 = (void *)MEMORY[0x263F0A630];
    unint64_t v16 = objc_msgSend(MEMORY[0x263F0A830], "meterUnitWithMetricPrefix:", 9, v20, v21, v22, v23);
    [(id)v28[5] doubleValue];
    id v17 = objc_msgSend(v18, "quantityWithUnit:doubleValue:", v16);
  }

  _Block_object_dispose(&v27, 8);
  return v17;
}

uint64_t __80__ACHWorkoutUtility_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 databaseForEntityClass:objc_opt_class()];

  uint64_t v7 = [MEMORY[0x263F43458] maxValueForProperty:@"total_distance" predicate:*(void *)(a1 + 32) database:v6 error:a3];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return 1;
}

- (id)mindfulMinutesForForDateInterval:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 startDate];
  v23 = [v5 dateByAddingTimeInterval:-86400.0];

  id v6 = [v4 endDate];
  uint64_t v7 = [v6 dateByAddingTimeInterval:86400.0];

  uint64_t v8 = HDSampleEntityPredicateForStartDate();
  id v9 = [MEMORY[0x263EFFA68] arrayByAddingObject:v8];
  unint64_t v10 = HDSampleEntityPredicateForEndDate();
  id v11 = [v9 arrayByAddingObject:v10];

  id v12 = [MEMORY[0x263F434A8] predicateMatchingAllPredicates:v11];
  id v13 = [(ACHWorkoutUtility *)self profile];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__34;
  v33 = __Block_byref_object_dispose__34;
  id v34 = 0;
  uint64_t v27 = &v29;
  id v28 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __54__ACHWorkoutUtility_mindfulMinutesForForDateInterval___block_invoke;
  v24[3] = &unk_264515F30;
  id v14 = v13;
  id v25 = v14;
  id v15 = v12;
  id v26 = v15;
  [(ACHWorkoutUtility *)self _performReadTransaction:@"MindfulSessionWithinDateInterval" error:&v28 block:v24];
  id v16 = v28;
  if (v16)
  {
    id v17 = ACHLogWorkouts();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v36 = v23;
      __int16 v37 = 2114;
      v38 = v7;
      __int16 v39 = 2114;
      id v40 = v16;
      _os_log_error_impl(&dword_21F5DA000, v17, OS_LOG_TYPE_ERROR, "Failed to fetch mindful sessions for date interval: (%{public}@, %{public}@): %{public}@", buf, 0x20u);
    }
    id v18 = 0;
  }
  else
  {
    [(ACHWorkoutUtility *)self _sumMindfulMinutesForSessions:v30[5] dateInterval:v4];
    double v20 = v19;
    uint64_t v21 = (void *)MEMORY[0x263F0A630];
    id v17 = [MEMORY[0x263F0A830] secondUnit];
    id v18 = [v21 quantityWithUnit:v17 doubleValue:v20];
  }

  _Block_object_dispose(&v29, 8);
  return v18;
}

uint64_t __54__ACHWorkoutUtility_mindfulMinutesForForDateInterval___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x263F43318];
  id v6 = [MEMORY[0x263F0A6E8] categoryTypeForIdentifier:*MEMORY[0x263F09388]];
  uint64_t v7 = [v5 samplesWithType:v6 profile:a1[4] encodingOptions:0 predicate:a1[5] limit:0 anchor:0 error:a3];
  uint64_t v8 = *(void *)(a1[6] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return 1;
}

- (double)_sumMindfulMinutesForSessions:(id)a3 dateInterval:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
    double v10 = 0.0;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v13 = [v12 endDate];
        if ([v6 containsDate:v13])
        {
          id v14 = [v12 startDate];
          char v15 = [v6 containsDate:v14];

          if ((v15 & 1) == 0)
          {
            id v16 = [v6 startDate];
            uint64_t v17 = [v12 startDate];
LABEL_14:
            uint64_t v21 = (void *)v17;
            [v16 timeIntervalSinceDate:v17];
            double v23 = v22;

            id v24 = [v12 endDate];
            id v25 = [v12 startDate];
            [v24 timeIntervalSinceDate:v25];
            double v27 = v26;

            double v10 = v10 + v27 - v23;
            continue;
          }
        }
        else
        {
        }
        id v18 = [v12 endDate];
        if ([v6 containsDate:v18])
        {
        }
        else
        {
          double v19 = [v12 startDate];
          int v20 = [v6 containsDate:v19];

          if (v20)
          {
            id v16 = [v12 endDate];
            uint64_t v17 = [v6 endDate];
            goto LABEL_14;
          }
        }
        id v28 = [v12 endDate];
        if ([v6 containsDate:v28])
        {
          uint64_t v29 = [v12 startDate];
          int v30 = [v6 containsDate:v29];

          if (v30)
          {
            uint64_t v31 = [v12 endDate];
            id v32 = [v12 startDate];
            [v31 timeIntervalSinceDate:v32];
            double v34 = v33;

            double v10 = v10 + v34;
          }
        }
        else
        {
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (!v8) {
        goto LABEL_23;
      }
    }
  }
  double v10 = 0.0;
LABEL_23:

  return v10;
}

- (void)_performReadTransaction:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = [(ACHWorkoutUtility *)self profile];
  id v11 = [(ACHWorkoutUtility *)self databaseContext];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [(ACHWorkoutUtility *)self _readingContextWithIdentifier:v8];
  }
  id v14 = v13;

  char v15 = (void *)MEMORY[0x263F43318];
  id v16 = [v10 database];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __57__ACHWorkoutUtility__performReadTransaction_error_block___block_invoke;
  v18[3] = &unk_264518880;
  id v19 = v9;
  id v17 = v9;
  [v15 performReadTransactionWithHealthDatabase:v16 context:v14 error:a4 block:v18];
}

uint64_t __57__ACHWorkoutUtility__performReadTransaction_error_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__ACHWorkoutUtility__countOfSamplesWithPredicate_andLocationType___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 metadata];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F09AA0]];
  int v5 = [v4 BOOLValue];

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6 == 1) {
    int v7 = v5;
  }
  else {
    int v7 = 0;
  }
  if (v6 == 2) {
    char v8 = v5;
  }
  else {
    char v8 = 1;
  }
  if (v7 == 1 || (v8 & 1) == 0) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return 1;
}

- (HDDatabaseTransactionContext)databaseContext
{
  return self->_databaseContext;
}

- (void)setDatabaseContext:(id)a3
{
}

- (void)setProfile:(id)a3
{
}

- (void)setFirstPartyPredicate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstPartyPredicate, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_databaseContext, 0);
}

- (void)bestEnergyBurnedForFirstPartyWorkoutsWithType:endingBeforeDate:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v0, v1, "Failed to fetch the best energy burned before date %{public}@ with error %{public}@");
}

- (void)bestDistanceForFirstPartyWorkoutsWithType:endingBeforeDate:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v0, v1, "Failed to fetch the best distance before date %{public}@ with error %{public}@");
}

- (void)_countOfSamplesWithPredicate:(uint64_t)a1 andLocationType:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_ERROR, "Failed to obtain the sample count due to error %{public}@", (uint8_t *)&v2, 0xCu);
}

@end