@interface ACHMindfulMinutesAwardingSource
- (ACHAchievementProgressEngine)progressEngine;
- (ACHAwardsClient)client;
- (ACHAwardsWorkoutClient)workoutClient;
- (ACHEarnedInstanceAwardingEngine)engine;
- (ACHMindfulMinutesAwardingSource)initWithClient:(id)a3 healthStore:(id)a4 workoutClient:(id)a5 awardingEngine:(id)a6 templateStore:(id)a7 creatorDevice:(unsigned __int8)a8 progressEngine:(id)a9;
- (ACHTemplateStore)templateStore;
- (BOOL)isAppleWatch;
- (BOOL)isObservingSummaryUpdates;
- (BOOL)providesProgressForTemplate:(id)a3;
- (HKAnchoredObjectQuery)sampleQuery;
- (HKHealthStore)healthStore;
- (NSArray)dataStorePropertyKeys;
- (NSCalendar)calendar;
- (NSDate)currentDate;
- (NSDate)currentDateOverride;
- (NSDictionary)dataStoreProperties;
- (NSNumber)overrideIsAppleWatch;
- (NSString)overrideWatchCountryCode;
- (NSString)uniqueName;
- (NSString)watchCountryCode;
- (OS_dispatch_queue)internalQueue;
- (id)_progressEnvironement;
- (id)_queue_evaluateSession:(id)a3 shouldLog:(BOOL)a4;
- (id)_queue_goalQuantityForTemplate:(id)a3 progressEnvironment:(id)a4;
- (id)_queue_progressQuantityForTemplate:(id)a3 progressEnvironment:(id)a4;
- (id)_relevantTemplatesForMindfulSession:(id)a3;
- (id)earnedInstancesForHistoricalInterval:(id)a3 databaseContext:(id)a4;
- (id)earnedInstancesForHistoricalInterval:(id)a3 error:(id *)a4;
- (int)protectedDataToken;
- (unsigned)creatorDevice;
- (void)_queue_startSampleQueryIfNecessary;
- (void)_runIncrementalEvaluation:(id)a3;
- (void)_startSampleQuery;
- (void)_stopSampleQuery;
- (void)activate;
- (void)dealloc;
- (void)requestAchievementProgressUpdatesForTemplates:(id)a3;
- (void)sessionAdded:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setClient:(id)a3;
- (void)setCreatorDevice:(unsigned __int8)a3;
- (void)setCurrentDateOverride:(id)a3;
- (void)setEngine:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setIsObservingSummaryUpdates:(BOOL)a3;
- (void)setOverrideIsAppleWatch:(id)a3;
- (void)setOverrideWatchCountryCode:(id)a3;
- (void)setProgressEngine:(id)a3;
- (void)setProtectedDataToken:(int)a3;
- (void)setSampleQuery:(id)a3;
- (void)setTemplateStore:(id)a3;
- (void)setWatchCountryCode:(id)a3;
- (void)setWorkoutClient:(id)a3;
@end

@implementation ACHMindfulMinutesAwardingSource

- (BOOL)providesProgressForTemplate:(id)a3
{
  return ((unint64_t)[a3 triggers] >> 10) & 1;
}

- (ACHMindfulMinutesAwardingSource)initWithClient:(id)a3 healthStore:(id)a4 workoutClient:(id)a5 awardingEngine:(id)a6 templateStore:(id)a7 creatorDevice:(unsigned __int8)a8 progressEngine:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  v28.receiver = self;
  v28.super_class = (Class)ACHMindfulMinutesAwardingSource;
  v21 = [(ACHMindfulMinutesAwardingSource *)&v28 init];
  v22 = v21;
  if (v21)
  {
    objc_storeWeak((id *)&v21->_client, v15);
    objc_storeStrong((id *)&v22->_healthStore, a4);
    objc_storeWeak((id *)&v22->_workoutClient, v17);
    objc_storeWeak((id *)&v22->_engine, v18);
    objc_storeWeak((id *)&v22->_progressEngine, v20);
    objc_storeWeak((id *)&v22->_templateStore, v19);
    v22->_creatorDevice = a8;
    uint64_t v23 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    calendar = v22->_calendar;
    v22->_calendar = (NSCalendar *)v23;

    uint64_t v25 = HKCreateSerialDispatchQueue();
    internalQueue = v22->_internalQueue;
    v22->_internalQueue = (OS_dispatch_queue *)v25;
  }
  return v22;
}

- (void)activate
{
  objc_initWeak(&location, self);
  v3 = (const char *)[(id)*MEMORY[0x263F235A8] UTF8String];
  v4 = MEMORY[0x263EF83A0];
  id v5 = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = __43__ACHMindfulMinutesAwardingSource_activate__block_invoke;
  v9 = &unk_264515D40;
  objc_copyWeak(&v10, &location);
  notify_register_dispatch(v3, &self->_protectedDataToken, v4, &v6);

  [(ACHMindfulMinutesAwardingSource *)self _queue_startSampleQueryIfNecessary];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __43__ACHMindfulMinutesAwardingSource_activate__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained client];
  int v4 = [v3 isProtectedDataAvailable];

  id v5 = ACHLogWorkouts();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "[ACHMindfulMinutesAwardingSource] Received protected data availabilty change to state: %d", (uint8_t *)v7, 8u);
  }

  if (v4)
  {
    id v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "_queue_startSampleQueryIfNecessary");
  }
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_protectedDataToken)) {
    notify_cancel(self->_protectedDataToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)ACHMindfulMinutesAwardingSource;
  [(ACHMindfulMinutesAwardingSource *)&v3 dealloc];
}

- (void)_queue_startSampleQueryIfNecessary
{
  if (!self->_sampleQuery)
  {
    objc_initWeak(&location, self);
    objc_super v3 = [(ACHMindfulMinutesAwardingSource *)self internalQueue];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __69__ACHMindfulMinutesAwardingSource__queue_startSampleQueryIfNecessary__block_invoke;
    v4[3] = &unk_264515D68;
    objc_copyWeak(&v5, &location);
    dispatch_async(v3, v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __69__ACHMindfulMinutesAwardingSource__queue_startSampleQueryIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startSampleQuery];
}

- (void)_startSampleQuery
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  objc_super v3 = [MEMORY[0x263F0A6E8] categoryTypeForIdentifier:*MEMORY[0x263F09388]];
  objc_initWeak(&location, self);
  id v4 = objc_alloc(MEMORY[0x263F0A0C8]);
  id v5 = [MEMORY[0x263F0A670] latestAnchor];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__ACHMindfulMinutesAwardingSource__startSampleQuery__block_invoke;
  v10[3] = &unk_264515D90;
  objc_copyWeak(&v11, &location);
  id v6 = (HKAnchoredObjectQuery *)[v4 initWithType:v3 predicate:0 anchor:v5 limit:0 resultsHandler:v10];
  sampleQuery = self->_sampleQuery;
  self->_sampleQuery = v6;

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__ACHMindfulMinutesAwardingSource__startSampleQuery__block_invoke_288;
  v8[3] = &unk_264515D90;
  objc_copyWeak(&v9, &location);
  [(HKAnchoredObjectQuery *)self->_sampleQuery setUpdateHandler:v8];
  [(HKHealthStore *)self->_healthStore executeQuery:self->_sampleQuery];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __52__ACHMindfulMinutesAwardingSource__startSampleQuery__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v7 = a6;
  if (v7)
  {
    uint64_t v8 = ACHLogWorkouts();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __52__ACHMindfulMinutesAwardingSource__startSampleQuery__block_invoke_cold_1((uint64_t)v7, v8);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _stopSampleQuery];
  }
}

void __52__ACHMindfulMinutesAwardingSource__startSampleQuery__block_invoke_288(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8 = a3;
  id v9 = a6;
  if (v9)
  {
    id v10 = ACHLogAwardEngine();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __52__ACHMindfulMinutesAwardingSource__startSampleQuery__block_invoke_288_cold_1((uint64_t)v9, v10);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _stopSampleQuery];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained sessionAdded:v8];
  }
}

- (void)_stopSampleQuery
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__ACHMindfulMinutesAwardingSource__stopSampleQuery__block_invoke;
  block[3] = &unk_264515DB8;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __51__ACHMindfulMinutesAwardingSource__stopSampleQuery__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) stopQuery:*(void *)(*(void *)(a1 + 32) + 112)];
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 112);
  *(void *)(v2 + 112) = 0;
}

- (void)sessionAdded:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _DWORD v7[2] = __48__ACHMindfulMinutesAwardingSource_sessionAdded___block_invoke;
  v7[3] = &unk_264515DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __48__ACHMindfulMinutesAwardingSource_sessionAdded___block_invoke(uint64_t a1)
{
  int IsAppleWatch = ACHConfigurationSupportsIncrementalEvaluationWithIsAppleWatch([*(id *)(a1 + 32) isAppleWatch]);
  objc_super v3 = *(id **)(a1 + 32);
  if (IsAppleWatch)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 _runIncrementalEvaluation:v4];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(v3 + 6);
    [WeakRetained requestProgressUpdateForProgressProvider:*(void *)(a1 + 32)];
  }
}

- (BOOL)isAppleWatch
{
  objc_super v3 = [(ACHMindfulMinutesAwardingSource *)self overrideIsAppleWatch];

  if (v3)
  {
    uint64_t v4 = [(ACHMindfulMinutesAwardingSource *)self overrideIsAppleWatch];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263F0A980] sharedBehavior];
    char v5 = [v4 isAppleWatch];
  }
  BOOL v6 = v5;

  return v6;
}

- (NSString)watchCountryCode
{
  objc_super v3 = [(ACHMindfulMinutesAwardingSource *)self overrideWatchCountryCode];

  if (v3) {
    [(ACHMindfulMinutesAwardingSource *)self overrideWatchCountryCode];
  }
  else {
  uint64_t v4 = ACHPairedWatchCountryCode();
  }
  return (NSString *)v4;
}

- (NSDate)currentDate
{
  objc_super v3 = [(ACHMindfulMinutesAwardingSource *)self currentDateOverride];

  if (v3) {
    [(ACHMindfulMinutesAwardingSource *)self currentDateOverride];
  }
  else {
  uint64_t v4 = [MEMORY[0x263EFF910] date];
  }
  return (NSDate *)v4;
}

- (id)_progressEnvironement
{
  objc_super v3 = [ACHMindfulMinutesAwardingEnvironment alloc];
  healthStore = self->_healthStore;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workoutClient);
  calendar = self->_calendar;
  id v7 = [(ACHMindfulMinutesAwardingSource *)self currentDate];
  id v8 = [(ACHMindfulMinutesAwardingEnvironment *)v3 initWithHealthStore:healthStore workoutClient:WeakRetained calendar:calendar currentDate:v7];

  return v8;
}

- (id)_relevantTemplatesForMindfulSession:(id)a3
{
  id v4 = a3;
  char v5 = [(ACHMindfulMinutesAwardingSource *)self watchCountryCode];
  calendar = self->_calendar;
  id v7 = [v4 endDate];

  id v8 = [(NSCalendar *)calendar components:28 fromDate:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_templateStore);
  id v10 = [WeakRetained availableTemplatesForDateComponents:v8 countryCode:v5];

  id v11 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global];
  v12 = [v10 filteredArrayUsingPredicate:v11];

  return v12;
}

unint64_t __71__ACHMindfulMinutesAwardingSource__relevantTemplatesForMindfulSession___block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 triggers] >> 10) & 1;
}

- (id)_queue_evaluateSession:(id)a3 shouldLog:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(ACHMindfulMinutesAwardingSource *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  calendar = self->_calendar;
  id v9 = [v6 startDate];
  v48 = [(NSCalendar *)calendar components:28 fromDate:v9];

  id v47 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v10 = [(ACHMindfulMinutesAwardingSource *)self _relevantTemplatesForMindfulSession:v6];
  BOOL v46 = v4;
  if (v4)
  {
    id v11 = ACHLogAwardEngine();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = ACHTriggerOptionsToString();
      v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      v14 = [v6 UUID];
      *(_DWORD *)buf = 138413058;
      id v58 = v12;
      __int16 v59 = 2114;
      v60 = v13;
      __int16 v61 = 2114;
      v62 = v48;
      __int16 v63 = 2112;
      v64 = v14;
      _os_log_impl(&dword_21F5DA000, v11, OS_LOG_TYPE_DEFAULT, "[ACHMindfulMinutesAwardingSource] Evaluating triggers %@ for %{public}@ templates using activity summary with date %{public}@, values: %@", buf, 0x2Au);
    }
  }
  id v15 = [ACHMindfulMinutesAwardingEnvironment alloc];
  healthStore = self->_healthStore;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workoutClient);
  id v18 = self->_calendar;
  v45 = v6;
  id v19 = [v6 endDate];
  v51 = [(ACHMindfulMinutesAwardingEnvironment *)v15 initWithHealthStore:healthStore workoutClient:WeakRetained calendar:v18 currentDate:v19];

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v10;
  uint64_t v20 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  BOOL v21 = v46;
  if (v20)
  {
    uint64_t v22 = v20;
    uint64_t v23 = *(void *)v53;
    unint64_t v24 = 0x263F08000uLL;
    do
    {
      uint64_t v25 = 0;
      uint64_t v49 = v22;
      do
      {
        if (*(void *)v53 != v23) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v52 + 1) + 8 * v25);
        v27 = [v26 gracePredicate];
        objc_super v28 = v27;
        if (v27)
        {
          id v29 = v27;
        }
        else
        {
          id v29 = [v26 predicate];
        }
        v30 = v29;

        v31 = [*(id *)(v24 + 2712) predicateWithFormat:v30];
        [v31 allowEvaluation];
        if ([v31 evaluateWithObject:v51])
        {
          id v32 = objc_alloc_init(MEMORY[0x263F236B8]);
          v33 = [v26 uniqueName];
          [v32 setTemplateUniqueName:v33];

          [v48 year];
          [v48 month];
          [v48 day];
          v34 = ACHDateComponentsForYearMonthDay();
          [v32 setEarnedDateComponents:v34];

          v35 = [v26 graceValueExpression];
          if (v35 || ([v26 valueExpression], (v35 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v36 = [v26 canonicalUnit];

            if (v36)
            {
              v37 = [MEMORY[0x263F087F0] expressionWithFormat:v35];
              v38 = [v37 expressionValueWithObject:v51 context:0];
              if (v38)
              {
                v39 = (void *)MEMORY[0x263F0A630];
                v40 = [v26 canonicalUnit];
                [v38 doubleValue];
                v41 = objc_msgSend(v39, "quantityWithUnit:doubleValue:", v40);
                [v32 setValue:v41];

                BOOL v21 = v46;
              }
            }
          }
          if (v21)
          {
            v42 = ACHLogAwardEngine();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v58 = v32;
              _os_log_impl(&dword_21F5DA000, v42, OS_LOG_TYPE_DEFAULT, "[ACHMindfulMinutesAwardingSource] Created earned instance: %@", buf, 0xCu);
            }

            [(ACHMindfulMinutesAwardingEnvironment *)v51 logValues];
          }
          [v47 addObject:v32];

          unint64_t v24 = 0x263F08000;
          uint64_t v22 = v49;
        }

        ++v25;
      }
      while (v22 != v25);
      uint64_t v22 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v22);
  }

  v43 = (void *)[v47 copy];
  return v43;
}

- (void)_runIncrementalEvaluation:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = ACHLogAwardEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v12 = [v4 count];
    _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "[ACHMindfulMinutesAwardingSource] Running incremental evaluation for %lu sessions", buf, 0xCu);
  }

  id v6 = [(ACHMindfulMinutesAwardingSource *)self engine];
  id v7 = [(ACHMindfulMinutesAwardingSource *)self uniqueName];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__ACHMindfulMinutesAwardingSource__runIncrementalEvaluation___block_invoke;
  v9[3] = &unk_264515E50;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v6 requestIncrementalEvaluationForSource:v7 evaluationBlock:v9];
}

id __61__ACHMindfulMinutesAwardingSource__runIncrementalEvaluation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) internalQueue];
  dispatch_assert_queue_not_V2(v4);

  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy_;
  id v19 = __Block_byref_object_dispose_;
  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  char v5 = [*(id *)(a1 + 32) internalQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__ACHMindfulMinutesAwardingSource__runIncrementalEvaluation___block_invoke_299;
  block[3] = &unk_264515E28;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v12 = v6;
  uint64_t v13 = v7;
  v14 = &v15;
  dispatch_sync(v5, block);

  id v8 = [MEMORY[0x263EFFA08] setWithArray:v16[5]];
  id v9 = [*(id *)(a1 + 32) progressEngine];
  [v9 requestProgressUpdateForProgressProvider:*(void *)(a1 + 32)];

  _Block_object_dispose(&v15, 8);
  return v8;
}

void __61__ACHMindfulMinutesAwardingSource__runIncrementalEvaluation___block_invoke_299(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(a1 + 40), "_queue_evaluateSession:shouldLog:", *(void *)(*((void *)&v8 + 1) + 8 * v6), 1, (void)v8);
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObjectsFromArray:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (NSString)uniqueName
{
  return (NSString *)@"MindfulMinutesSource";
}

- (id)earnedInstancesForHistoricalInterval:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(ACHMindfulMinutesAwardingSource *)self internalQueue];
  dispatch_assert_queue_not_V2(v7);

  long long v8 = ACHLogAwardEngine();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    long long v9 = [v6 description];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "[ACHMindfulMinutesAwardingSource] Running historical evaluation for date interval %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000;
  unint64_t v24 = __Block_byref_object_copy_;
  uint64_t v25 = __Block_byref_object_dispose_;
  id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
  internalQueue = self->_internalQueue;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __78__ACHMindfulMinutesAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke;
  uint64_t v17 = &unk_264515EC0;
  id v18 = self;
  id v11 = v6;
  id v19 = v11;
  p_long long buf = &buf;
  BOOL v21 = a4;
  dispatch_sync(internalQueue, &v14);
  id v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", *(void *)(*((void *)&buf + 1) + 40), v14, v15, v16, v17, v18);

  _Block_object_dispose(&buf, 8);
  return v12;
}

void __78__ACHMindfulMinutesAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke(void *a1)
{
  id v2 = [[ACHMindfulSessionIterator alloc] initWithHealthStore:*(void *)(a1[4] + 24)];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78__ACHMindfulMinutesAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke_2;
  v6[3] = &unk_264515E78;
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  v6[4] = a1[4];
  v6[5] = v4;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __78__ACHMindfulMinutesAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke_3;
  v5[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v5[4] = a1[7];
  [(ACHMindfulSessionIterator *)v2 enumerateMindfulSessionsForDateInterval:v3 handler:v6 errorHandler:v5];
}

void __78__ACHMindfulMinutesAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = (void *)MEMORY[0x223C50570]();
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "_queue_evaluateSession:shouldLog:", v5, 1);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObjectsFromArray:v4];
}

void __78__ACHMindfulMinutesAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = ACHLogAwardEngine();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __78__ACHMindfulMinutesAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke_3_cold_1(v3, v4);
  }

  id v5 = *(void **)(a1 + 32);
  id v6 = v3;
  if (v6)
  {
    if (v5) {
      *id v5 = v6;
    }
    else {
      _HKLogDroppedError();
    }
  }
}

- (id)earnedInstancesForHistoricalInterval:(id)a3 databaseContext:(id)a4
{
  id v4 = objc_alloc_init(MEMORY[0x263EFFA08]);
  return v4;
}

- (void)requestAchievementProgressUpdatesForTemplates:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHMindfulMinutesAwardingSource *)self internalQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _DWORD v7[2] = __81__ACHMindfulMinutesAwardingSource_requestAchievementProgressUpdatesForTemplates___block_invoke;
  v7[3] = &unk_264515DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __81__ACHMindfulMinutesAwardingSource_requestAchievementProgressUpdatesForTemplates___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v3 = [*(id *)(a1 + 32) _progressEnvironement];
  id v4 = objc_alloc_init(MEMORY[0x263F236C0]);
  id v19 = (void *)v3;
  if (v3)
  {
    id v18 = v2;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = *(id *)(a1 + 40);
    uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(obj);
          }
          long long v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          long long v10 = [v4 validateTemplate:v9];
          if ([v10 isValid])
          {
            id v11 = objc_msgSend(*(id *)(a1 + 32), "_queue_goalQuantityForTemplate:progressEnvironment:", v9, v19);
            id v12 = objc_msgSend(*(id *)(a1 + 32), "_queue_progressQuantityForTemplate:progressEnvironment:", v9, v19);
            id v13 = objc_alloc(MEMORY[0x263F23640]);
            uint64_t v14 = [v9 uniqueName];
            uint64_t v15 = (void *)[v13 initWithTemplateUniqueName:v14 progressQuantity:v12 goalQuantity:v11];

            [v18 addObject:v15];
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v6);
    }

    id v16 = [*(id *)(a1 + 32) progressEngine];
    id v2 = v18;
    uint64_t v17 = (void *)[v18 copy];
    [v16 processAchievementProgressUpdates:v17];
  }
}

- (id)_queue_goalQuantityForTemplate:(id)a3 progressEnvironment:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 graceGoalExpression];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v5 goalExpression];
  }
  long long v10 = v9;

  id v11 = [MEMORY[0x263F087F0] expressionWithFormat:v10];
  [v11 allowEvaluation];
  id v12 = [v11 expressionValueWithObject:v6 context:0];

  if (v12)
  {
    id v13 = (void *)MEMORY[0x263F0A630];
    uint64_t v14 = [v5 canonicalUnit];
    [v12 doubleValue];
    uint64_t v15 = objc_msgSend(v13, "quantityWithUnit:doubleValue:", v14);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)_queue_progressQuantityForTemplate:(id)a3 progressEnvironment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  id v9 = [(ACHMindfulMinutesAwardingSource *)self currentDate];
  char IsAvailableForCalendarAndDate = ACHTemplateIsAvailableForCalendarAndDate(v6, v8, v9);

  if (IsAvailableForCalendarAndDate)
  {
    id v11 = [v6 graceProgressExpression];
    id v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [v6 progressExpression];
    }
    uint64_t v14 = v13;

    id v16 = [MEMORY[0x263F087F0] expressionWithFormat:v14];
    [v16 allowEvaluation];
    uint64_t v17 = [v16 expressionValueWithObject:v7 context:0];
    if (v17)
    {
      id v18 = (void *)MEMORY[0x263F0A630];
      id v19 = [v6 canonicalUnit];
      [v17 doubleValue];
      uint64_t v15 = objc_msgSend(v18, "quantityWithUnit:doubleValue:", v19);
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v14 = [v6 canonicalUnit];
    uint64_t v15 = ACHHKQuantityWithValueAndUnit();
  }

  return v15;
}

- (NSArray)dataStorePropertyKeys
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (NSDictionary)dataStoreProperties
{
  return (NSDictionary *)MEMORY[0x263EFFA78];
}

- (ACHAwardsClient)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  return (ACHAwardsClient *)WeakRetained;
}

- (void)setClient:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (ACHAwardsWorkoutClient)workoutClient
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workoutClient);
  return (ACHAwardsWorkoutClient *)WeakRetained;
}

- (void)setWorkoutClient:(id)a3
{
}

- (ACHEarnedInstanceAwardingEngine)engine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  return (ACHEarnedInstanceAwardingEngine *)WeakRetained;
}

- (void)setEngine:(id)a3
{
}

- (ACHAchievementProgressEngine)progressEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressEngine);
  return (ACHAchievementProgressEngine *)WeakRetained;
}

- (void)setProgressEngine:(id)a3
{
}

- (ACHTemplateStore)templateStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_templateStore);
  return (ACHTemplateStore *)WeakRetained;
}

- (void)setTemplateStore:(id)a3
{
}

- (unsigned)creatorDevice
{
  return self->_creatorDevice;
}

- (void)setCreatorDevice:(unsigned __int8)a3
{
  self->_creatorDevice = a3;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (NSString)overrideWatchCountryCode
{
  return self->_overrideWatchCountryCode;
}

- (void)setOverrideWatchCountryCode:(id)a3
{
}

- (void)setWatchCountryCode:(id)a3
{
}

- (NSNumber)overrideIsAppleWatch
{
  return self->_overrideIsAppleWatch;
}

- (void)setOverrideIsAppleWatch:(id)a3
{
}

- (NSDate)currentDateOverride
{
  return self->_currentDateOverride;
}

- (void)setCurrentDateOverride:(id)a3
{
}

- (BOOL)isObservingSummaryUpdates
{
  return self->_isObservingSummaryUpdates;
}

- (void)setIsObservingSummaryUpdates:(BOOL)a3
{
  self->_isObservingSummaryUpdates = a3;
}

- (HKAnchoredObjectQuery)sampleQuery
{
  return self->_sampleQuery;
}

- (void)setSampleQuery:(id)a3
{
}

- (int)protectedDataToken
{
  return self->_protectedDataToken;
}

- (void)setProtectedDataToken:(int)a3
{
  self->_protectedDataToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleQuery, 0);
  objc_storeStrong((id *)&self->_currentDateOverride, 0);
  objc_storeStrong((id *)&self->_overrideIsAppleWatch, 0);
  objc_storeStrong((id *)&self->_watchCountryCode, 0);
  objc_storeStrong((id *)&self->_overrideWatchCountryCode, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_destroyWeak((id *)&self->_templateStore);
  objc_destroyWeak((id *)&self->_progressEngine);
  objc_destroyWeak((id *)&self->_engine);
  objc_destroyWeak((id *)&self->_workoutClient);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_destroyWeak((id *)&self->_client);
}

void __52__ACHMindfulMinutesAwardingSource__startSampleQuery__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_ERROR, "[ACHMindfulMinutesAwardingSource] Error starting sample query: %@", (uint8_t *)&v2, 0xCu);
}

void __52__ACHMindfulMinutesAwardingSource__startSampleQuery__block_invoke_288_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_ERROR, "[ACHMindfulMinutesAwardingSource] Error from sample query update: %@", (uint8_t *)&v2, 0xCu);
}

void __78__ACHMindfulMinutesAwardingSource_earnedInstancesForHistoricalInterval_error___block_invoke_3_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_ERROR, "[ACHMindfulMinutesAwardingSource] Failed to query all mindfulness sessions: %@", (uint8_t *)&v4, 0xCu);
}

@end