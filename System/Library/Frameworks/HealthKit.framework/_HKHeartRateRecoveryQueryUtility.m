@interface _HKHeartRateRecoveryQueryUtility
+ (id)_recoveryEndDateWithStartDate:(id)a3;
+ (id)perMinuteWorkoutRecoveryHeartRateFromReadings:(id)a3 workoutEndDate:(id)a4;
+ (id)predicateForWorkoutRecoveryTimeWithWorkout:(id)a3;
+ (id)recoveryDateIntervalWithWorkout:(id)a3;
+ (id)workoutRecoveryDateIntervalForWorkout:(id)a3 overlappingWorkouts:(id)a4;
+ (id)workoutRecoveryHeartRatesForWorkout:(id)a3 recoveryDateInterval:(id)a4 readings:(id)a5;
- (_HKHeartRateRecoveryQueryUtility)initWithHealthStore:(id)a3 workout:(id)a4 handler:(id)a5;
- (void)_heartRatesPostWorkout:(id)a3 workoutRecoveryTimePredicate:(id)a4 completionHandler:(id)a5;
- (void)_setupQueries;
- (void)dealloc;
- (void)execute;
- (void)stop;
@end

@implementation _HKHeartRateRecoveryQueryUtility

- (_HKHeartRateRecoveryQueryUtility)initWithHealthStore:(id)a3 workout:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_HKHeartRateRecoveryQueryUtility;
  v12 = [(_HKHeartRateRecoveryQueryUtility *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_healthStore, a3);
    objc_storeStrong((id *)&v13->_workout, a4);
    uint64_t v14 = [v11 copy];
    id handler = v13->_handler;
    v13->_id handler = (id)v14;

    [(_HKHeartRateRecoveryQueryUtility *)v13 _setupQueries];
  }

  return v13;
}

- (void)dealloc
{
  [(_HKSampleQueryUtility *)self->_workoutQueryUtility stop];
  [(HKHealthStore *)self->_healthStore stopQuery:self->_heartRateQuery];
  v3.receiver = self;
  v3.super_class = (Class)_HKHeartRateRecoveryQueryUtility;
  [(_HKHeartRateRecoveryQueryUtility *)&v3 dealloc];
}

- (void)execute
{
}

- (void)stop
{
  [(_HKSampleQueryUtility *)self->_workoutQueryUtility stop];
  if (self->_heartRateQuery)
  {
    -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:");
    heartRateQuery = self->_heartRateQuery;
    self->_heartRateQuery = 0;
  }
}

- (void)_setupQueries
{
  objc_super v3 = [(id)objc_opt_class() predicateForWorkoutRecoveryTimeWithWorkout:self->_workout];
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  v4 = [_HKSampleQueryUtility alloc];
  healthStore = self->_healthStore;
  v6 = +[HKObjectType workoutType];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49___HKHeartRateRecoveryQueryUtility__setupQueries__block_invoke;
  v10[3] = &unk_1E58C28E8;
  v10[4] = self;
  v12 = v13;
  id v7 = v3;
  id v11 = v7;
  v8 = [(_HKSampleQueryUtility *)v4 initWithHealthStore:healthStore sampleType:v6 predicate:v7 resultsHandler:v10];
  workoutQueryUtility = self->_workoutQueryUtility;
  self->_workoutQueryUtility = v8;

  [(_HKSampleQueryUtility *)self->_workoutQueryUtility setSortStartDateAscending:1];
  _Block_object_dispose(v13, 8);
}

- (void)_heartRatesPostWorkout:(id)a3 workoutRecoveryTimePredicate:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(id)objc_opt_class() recoveryDateIntervalWithWorkout:v10];

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v13 = [HKQuantitySeriesSampleQuery alloc];
  char v14 = +[HKObjectType quantityTypeForIdentifier:@"HKQuantityTypeIdentifierHeartRate"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __106___HKHeartRateRecoveryQueryUtility__heartRatesPostWorkout_workoutRecoveryTimePredicate_completionHandler___block_invoke;
  v20[3] = &unk_1E58C2910;
  id v21 = v11;
  id v22 = v12;
  id v23 = v8;
  id v15 = v8;
  id v16 = v12;
  id v17 = v11;
  v18 = [(HKQuantitySeriesSampleQuery *)v13 initWithQuantityType:v14 predicate:v9 quantityHandler:v20];

  heartRateQuery = self->_heartRateQuery;
  self->_heartRateQuery = v18;

  [(HKHealthStore *)self->_healthStore executeQuery:self->_heartRateQuery];
}

+ (id)workoutRecoveryDateIntervalForWorkout:(id)a3 overlappingWorkouts:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 endDate];
  id v9 = [a1 _recoveryEndDateWithStartDate:v8];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __94___HKHeartRateRecoveryQueryUtility_workoutRecoveryDateIntervalForWorkout_overlappingWorkouts___block_invoke;
  v37[3] = &unk_1E58C2938;
  id v10 = v6;
  id v38 = v10;
  id v11 = v9;
  id v39 = v11;
  id v31 = v8;
  v32 = v7;
  id v40 = v31;
  id v12 = objc_msgSend(v7, "hk_filter:", v37);
  v13 = [MEMORY[0x1E4F1C9C8] distantFuture];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v20 = [v19 startDate];
        int v21 = objc_msgSend(v20, "hk_isBeforeOrEqualToDate:", v13);

        if (v21)
        {
          uint64_t v22 = [v19 startDate];

          v13 = (void *)v22;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v16);
  }

  if (objc_msgSend(v13, "hk_isBeforeOrEqualToDate:", v11)) {
    id v23 = v13;
  }
  else {
    id v23 = v11;
  }
  id v24 = v23;
  v25 = [v10 endDate];
  uint64_t v26 = [v25 compare:v24];

  if (v26 == 1)
  {
    v27 = 0;
  }
  else
  {
    id v28 = objc_alloc(MEMORY[0x1E4F28C18]);
    v29 = [v10 endDate];
    v27 = (void *)[v28 initWithStartDate:v29 endDate:v24];
  }

  return v27;
}

+ (id)workoutRecoveryHeartRatesForWorkout:(id)a3 recoveryDateInterval:(id)a4 readings:(id)a5
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __102___HKHeartRateRecoveryQueryUtility_workoutRecoveryHeartRatesForWorkout_recoveryDateInterval_readings___block_invoke;
  v10[3] = &unk_1E58C2960;
  id v11 = v6;
  id v7 = v6;
  id v8 = objc_msgSend(a5, "hk_filter:", v10);

  return v8;
}

+ (id)perMinuteWorkoutRecoveryHeartRateFromReadings:(id)a3 workoutEndDate:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v9 = [a1 _recoveryEndDateWithStartDate:v7];
  uint64_t v26 = (void *)[v8 initWithStartDate:v7 endDate:v9];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v6;
  uint64_t v27 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v27)
  {
    uint64_t v25 = *(void *)v33;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v10;
        v30 = *(void **)(*((void *)&v32 + 1) + 8 * v10);
        id v11 = [v30 date];
        if ([v26 containsDate:v11])
        {
          int v12 = 0;
          for (uint64_t i = 0; i != 3; ++i)
          {
            id v14 = [v7 dateByAddingTimeInterval:(double)v12];
            [v11 timeIntervalSinceDate:v14];
            double v16 = fabs(v15);
            uint64_t v17 = [NSNumber numberWithInt:i];
            v18 = [v31 objectForKeyedSubscript:v17];

            if (v16 < 20.0)
            {
              if (!v18 || ([v18 doubleValue], v16 < v19))
              {
                v20 = [NSNumber numberWithDouble:v16];
                int v21 = [NSNumber numberWithInt:i];
                [v31 setObject:v20 forKeyedSubscript:v21];

                uint64_t v22 = [NSNumber numberWithInt:i];
                [v29 setObject:v30 forKeyedSubscript:v22];
              }
            }

            v12 += 60;
          }
        }

        uint64_t v10 = v28 + 1;
      }
      while (v28 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v27);
  }

  return v29;
}

+ (id)_recoveryEndDateWithStartDate:(id)a3
{
  return (id)[a3 dateByAddingTimeInterval:200.0];
}

+ (id)predicateForWorkoutRecoveryTimeWithWorkout:(id)a3
{
  objc_super v3 = [a1 recoveryDateIntervalWithWorkout:a3];
  v4 = [v3 startDate];
  v5 = [v3 endDate];
  id v6 = +[HKQuery predicateForSamplesWithStartDate:v4 endDate:v5 inclusiveEndDates:1 options:0];

  return v6;
}

+ (id)recoveryDateIntervalWithWorkout:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F28C18];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [v5 endDate];
  id v8 = [v5 endDate];

  id v9 = [a1 _recoveryEndDateWithStartDate:v8];
  uint64_t v10 = (void *)[v6 initWithStartDate:v7 endDate:v9];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartRateReadings, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_workoutQueryUtility, 0);
  objc_storeStrong((id *)&self->_heartRateQuery, 0);
  objc_storeStrong((id *)&self->_workout, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end