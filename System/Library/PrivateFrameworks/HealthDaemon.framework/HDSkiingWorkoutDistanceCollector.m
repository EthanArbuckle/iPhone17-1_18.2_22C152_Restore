@interface HDSkiingWorkoutDistanceCollector
+ (Class)sensorDatumClass;
+ (id)domain;
+ (id)observedType;
- (BOOL)requiresSampleAggregation;
- (HDSkiingWorkoutDistanceCollector)initWithProfile:(id)a3;
- (id)generateDownhillSnowSportsDistanceSampleForDistance:(double)a3 startDate:(id)a4 endDate:(id)a5;
- (id)hkObjectsFromSensorData:(id)a3 baseSensorDatum:(id)a4 startDate:(id)a5 endDate:(id)a6;
- (void)beginUpdatesFromDatum:(id)a3 withHandler:(id)a4;
- (void)fetchHistoricalSensorDataSinceDatum:(id)a3 databaseIdentifier:(id)a4 completion:(id)a5;
- (void)stopPerformingUpdatesWithErrorEncountered:(BOOL)a3;
@end

@implementation HDSkiingWorkoutDistanceCollector

- (HDSkiingWorkoutDistanceCollector)initWithProfile:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDSkiingWorkoutDistanceCollector;
  v5 = [(HDAggregateDataCollector *)&v10 initWithProfile:v4];
  if (v5)
  {
    v6 = [v4 workoutManager];
    uint64_t v7 = [v6 newCMSkiTracker];
    skiTracker = v5->_skiTracker;
    v5->_skiTracker = (CMSkiTracker *)v7;
  }
  return v5;
}

+ (id)observedType
{
  return (id)[MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7B8]];
}

- (void)stopPerformingUpdatesWithErrorEncountered:(BOOL)a3
{
  BOOL v3 = a3;
  [(CMSkiTracker *)self->_skiTracker stopUpdates];
  if (v3)
  {
    skiTracker = self->_skiTracker;
    self->_skiTracker = 0;
  }
}

+ (Class)sensorDatumClass
{
  return (Class)objc_opt_class();
}

+ (id)domain
{
  return @"DISTANCE_DOWNHILL_SNOW_SPORTS_INGESTION";
}

- (void)beginUpdatesFromDatum:(id)a3 withHandler:(id)a4
{
  id v5 = a4;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "Registering for skiing distance updates", buf, 2u);
  }
  skiTracker = self->_skiTracker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__HDSkiingWorkoutDistanceCollector_beginUpdatesFromDatum_withHandler___block_invoke;
  v9[3] = &unk_1E62FBAF0;
  id v10 = v5;
  id v8 = v5;
  [(CMSkiTracker *)skiTracker startUpdatesFromRecord:0 handler:v9];
}

uint64_t __70__HDSkiingWorkoutDistanceCollector_beginUpdatesFromDatum_withHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0);
}

- (void)fetchHistoricalSensorDataSinceDatum:(id)a3 databaseIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  _HKInitializeLogging();
  v11 = *MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = v8;
    __int16 v17 = 2114;
    id v18 = v9;
    _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_INFO, "Fetching historical skiing distance data since datum: %{public}@ for database: %{public}@", buf, 0x16u);
  }
  skiTracker = self->_skiTracker;
  if (skiTracker)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __102__HDSkiingWorkoutDistanceCollector_fetchHistoricalSensorDataSinceDatum_databaseIdentifier_completion___block_invoke;
    v13[3] = &unk_1E62FBAF0;
    id v14 = v10;
    [(CMSkiTracker *)skiTracker querySkiUpdatesFromRecord:v8 handler:v13];
  }
  else
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, MEMORY[0x1E4F1CBF0], 0);
  }
}

uint64_t __102__HDSkiingWorkoutDistanceCollector_fetchHistoricalSensorDataSinceDatum_databaseIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)hkObjectsFromSensorData:(id)a3 baseSensorDatum:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 count])
  {
    id v41 = v13;
    id v42 = v12;
    id v43 = v11;
    id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v14 = [(HDAggregateDataCollector *)self _queue_lastReceivedSensorDatum];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v44 = v10;
    id v15 = v10;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      v46 = self;
      uint64_t v18 = *(void *)v49;
      uint64_t v19 = (os_log_t *)MEMORY[0x1E4F29FB8];
      v20 = &dword_1BCB7D000;
      do
      {
        uint64_t v21 = 0;
        uint64_t v47 = v17;
        do
        {
          if (*(void *)v49 != v18) {
            objc_enumerationMutation(v15);
          }
          v22 = *(void **)(*((void *)&v48 + 1) + 8 * v21);
          _HKInitializeLogging();
          v23 = *v19;
          if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v54 = v22;
            _os_log_impl(v20, v23, OS_LOG_TYPE_DEFAULT, "Processing ski distance data: %@", buf, 0xCu);
          }
          unint64_t v24 = [v22 recordId];
          if (v24 > [v14 recordId])
          {
            [v22 runDistance];
            double v26 = v25;
            [v14 runDistance];
            double v28 = v26 - v27;
            if (v28 > 2.22044605e-16)
            {
              uint64_t v29 = v18;
              v30 = v19;
              id v31 = v15;
              v32 = v20;
              v33 = [v22 startDate];
              v34 = [v22 endDate];
              v35 = [(HDSkiingWorkoutDistanceCollector *)v46 generateDownhillSnowSportsDistanceSampleForDistance:v33 startDate:v34 endDate:v28];

              if (v35) {
                [v45 addObject:v35];
              }

              v20 = v32;
              id v15 = v31;
              uint64_t v19 = v30;
              uint64_t v18 = v29;
              uint64_t v17 = v47;
            }
            id v36 = v22;

            id v14 = v36;
          }
          ++v21;
        }
        while (v17 != v21);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v17);
    }

    id v11 = v43;
    id v10 = v44;
    id v13 = v41;
    id v12 = v42;
  }
  else
  {
    _HKInitializeLogging();
    v37 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
    {
      v39 = v37;
      *(_DWORD *)buf = 138412546;
      id v54 = (id)objc_opt_class();
      __int16 v55 = 2112;
      id v56 = v10;
      id v40 = v54;
      _os_log_error_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_ERROR, "%@: Received ski data array (%@) with no elememts", buf, 0x16u);
    }
    id v45 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v45;
}

- (id)generateDownhillSnowSportsDistanceSampleForDistance:(double)a3 startDate:(id)a4 endDate:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if (objc_msgSend(v8, "hk_isBeforeDate:", v7))
  {
    _HKInitializeLogging();
    id v9 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_FAULT))
    {
      int v18 = 138543618;
      id v19 = v7;
      __int16 v20 = 2114;
      id v21 = v8;
      _os_log_fault_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_FAULT, "Out-of-order CMSkiData samples: %{public}@, %{public}@", (uint8_t *)&v18, 0x16u);
    }
    id v10 = 0;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7B8]];
    id v12 = (void *)MEMORY[0x1E4F2B370];
    id v13 = [MEMORY[0x1E4F2B618] meterUnit];
    id v14 = [v12 quantityWithUnit:v13 doubleValue:a3];

    id v15 = (void *)MEMORY[0x1E4F2B388];
    uint64_t v16 = [MEMORY[0x1E4F2AEF8] localDevice];
    id v10 = [v15 quantitySampleWithType:v11 quantity:v14 startDate:v7 endDate:v8 device:v16 metadata:0];
  }

  return v10;
}

- (BOOL)requiresSampleAggregation
{
  return 0;
}

- (void).cxx_destruct
{
}

@end