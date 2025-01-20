@interface ACHWorkoutAwardingSource
- (ACHAchievementProgressEngine)progressEngine;
- (ACHAwardsClient)client;
- (ACHAwardsWorkoutClient)workoutClient;
- (ACHDataStore)dataStore;
- (ACHEarnedInstanceAwardingEngine)engine;
- (ACHTemplateStore)templateStore;
- (ACHWorkoutAwardingSource)initWithClient:(id)a3 healthStore:(id)a4 awardingEngine:(id)a5 dataStore:(id)a6 templateStore:(id)a7 creatorDevice:(unsigned __int8)a8 progressEngine:(id)a9 workoutUtility:(id)a10;
- (ACHWorkoutAwardingSource)initWithClient:(id)a3 healthStore:(id)a4 awardingEngine:(id)a5 dataStore:(id)a6 templateStore:(id)a7 creatorDevice:(unsigned __int8)a8 progressEngine:(id)a9 workoutUtility:(id)a10 initialResultsHandler:(id)a11;
- (ACHWorkoutAwardingSource)initWithProfile:(id)a3 awardingEngine:(id)a4 dataStore:(id)a5 templateStore:(id)a6 creatorDevice:(unsigned __int8)a7 progressEngine:(id)a8 workoutUtility:(id)a9;
- (ACHWorkoutUtility)workoutUtility;
- (BOOL)_handlesTemplate:(id)a3;
- (BOOL)_isMetricLocale;
- (BOOL)isAppleWatch;
- (HDProfile)profile;
- (HKAnchoredObjectQuery)workoutQuery;
- (HKHealthStore)healthStore;
- (NSArray)dataStorePropertyKeys;
- (NSDate)currentDateOverride;
- (NSDictionary)dataStoreProperties;
- (NSNumber)injectedIsMetricLocale;
- (NSNumber)overrideIsAppleWatch;
- (NSString)uniqueName;
- (NSString)watchCountryCodeOverride;
- (OS_dispatch_queue)internalQueue;
- (double)best10KDuration;
- (double)best5KDuration;
- (double)bestElevationGainedHiking;
- (double)bestHalfMarathonDuration;
- (double)bestMarathonDuration;
- (double)bestWheelchair10KDuration;
- (double)bestWheelchair5KDuration;
- (double)bestWheelchairHalfMarathonDuration;
- (double)bestWheelchairMarathonDuration;
- (id)_bestElevationGainedKeyForActivityType:(unint64_t)a3;
- (id)_client_earnedInstancesForWorkouts:(id)a3;
- (id)_client_earnedInstancesForWorkoutsInDateInterval:(id)a3 error:(id *)a4;
- (id)_daemon_earnedInstancesForWorkouts:(id)a3;
- (id)_earnedInstancesForWorkouts:(id)a3;
- (id)_progressEnvironment;
- (id)_queue_goalQuantityForTemplate:(id)a3 progressEnvironment:(id)a4;
- (id)_queue_progressQuantityForTemplate:(id)a3 progressEnvironment:(id)a4;
- (id)_stringForDate:(id)a3;
- (id)_stringForDuration:(double)a3;
- (id)_stringForExperienceType:(unint64_t)a3;
- (id)currentDate;
- (id)earnedInstancesForHistoricalInterval:(id)a3 databaseContext:(id)a4;
- (id)earnedInstancesForHistoricalInterval:(id)a3 error:(id *)a4;
- (id)initialResultsHandler;
- (id)watchCountryCode;
- (int)protectedDataToken;
- (unsigned)creatorDevice;
- (void)_client_appendEarnedInstancesForWorkout:(id)a3 toSet:(id)a4 templates:(id)a5 calendar:(id)a6 numberOfDaysInWeek:(unint64_t)a7 predicates:(id)a8 firstDayOfFitnessWeek:(int64_t)a9 watchCountryCode:(id)a10;
- (void)_injectIsMetricLocale:(BOOL)a3;
- (void)_lock_startWorkoutQueryWithInitialResultsHandler:(id)a3;
- (void)_progressEnvironment;
- (void)_startWorkoutQueryIfNecessary;
- (void)_stopWorkoutQuery;
- (void)activate;
- (void)daemonReady:(id)a3;
- (void)dataStoreDidClearAllProperties:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)requestAchievementProgressUpdatesForTemplates:(id)a3;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)setBest10KDuration:(double)a3;
- (void)setBest5KDuration:(double)a3;
- (void)setBestElevationGainedHiking:(double)a3;
- (void)setBestHalfMarathonDuration:(double)a3;
- (void)setBestMarathonDuration:(double)a3;
- (void)setBestWheelchair10KDuration:(double)a3;
- (void)setBestWheelchair5KDuration:(double)a3;
- (void)setBestWheelchairHalfMarathonDuration:(double)a3;
- (void)setBestWheelchairMarathonDuration:(double)a3;
- (void)setClient:(id)a3;
- (void)setCreatorDevice:(unsigned __int8)a3;
- (void)setCurrentDateOverride:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setDataStoreProperties:(id)a3;
- (void)setEngine:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setInitialResultsHandler:(id)a3;
- (void)setInjectedIsMetricLocale:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setOverrideIsAppleWatch:(id)a3;
- (void)setProfile:(id)a3;
- (void)setProgressEngine:(id)a3;
- (void)setProtectedDataToken:(int)a3;
- (void)setTemplateStore:(id)a3;
- (void)setWatchCountryCodeOverride:(id)a3;
- (void)setWorkoutClient:(id)a3;
- (void)setWorkoutQuery:(id)a3;
- (void)setWorkoutUtility:(id)a3;
- (void)workoutsAdded:(id)a3;
@end

@implementation ACHWorkoutAwardingSource

void __74__ACHWorkoutAwardingSource_requestAchievementProgressUpdatesForTemplates___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v3 = [*(id *)(a1 + 32) _progressEnvironment];
  id v4 = objc_alloc_init(MEMORY[0x263F236C0]);
  v19 = (void *)v3;
  if (v3)
  {
    v18 = v2;
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
          v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v10 = [v4 validateTemplate:v9];
          if ([v10 isValid])
          {
            v11 = objc_msgSend(*(id *)(a1 + 32), "_queue_goalQuantityForTemplate:progressEnvironment:", v9, v19);
            v12 = objc_msgSend(*(id *)(a1 + 32), "_queue_progressQuantityForTemplate:progressEnvironment:", v9, v19);
            id v13 = objc_alloc(MEMORY[0x263F23640]);
            v14 = [v9 uniqueName];
            v15 = (void *)[v13 initWithTemplateUniqueName:v14 progressQuantity:v12 goalQuantity:v11];

            [v18 addObject:v15];
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v6);
    }

    v16 = [*(id *)(a1 + 32) progressEngine];
    id v2 = v18;
    v17 = (void *)[v18 copy];
    [v16 processAchievementProgressUpdates:v17];
  }
}

- (ACHAchievementProgressEngine)progressEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressEngine);
  return (ACHAchievementProgressEngine *)WeakRetained;
}

- (id)_queue_progressQuantityForTemplate:(id)a3 progressEnvironment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  v9 = [(ACHWorkoutAwardingSource *)self currentDate];
  char IsAvailableForCalendarAndDate = ACHTemplateIsAvailableForCalendarAndDate(v6, v8, v9);

  if (IsAvailableForCalendarAndDate)
  {
    v11 = [v6 graceProgressExpression];
    v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [v6 progressExpression];
    }
    v14 = v13;

    v16 = [MEMORY[0x263F087F0] expressionWithFormat:v14];
    v17 = [v16 expressionValueWithObject:v7 context:0];
    v18 = [v6 canonicalUnit];
    v15 = ACHHKQuantityWithValueAndUnit();
  }
  else
  {
    v14 = [v6 canonicalUnit];
    v15 = ACHHKQuantityWithValueAndUnit();
  }

  return v15;
}

- (id)_queue_goalQuantityForTemplate:(id)a3 progressEnvironment:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 graceGoalExpression];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v5 goalExpression];
  }
  v10 = v9;

  v11 = [MEMORY[0x263F087F0] expressionWithFormat:v10];
  v12 = [v11 expressionValueWithObject:v6 context:0];

  id v13 = [v5 canonicalUnit];
  v14 = ACHHKQuantityWithValueAndUnit();

  return v14;
}

- (id)_progressEnvironment
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  uint64_t v4 = [v3 maximumRangeOfUnit:512];
  uint64_t v6 = v4 + v5;
  id v7 = [(ACHWorkoutAwardingSource *)self currentDate];
  v8 = ACHStartOfFitnessWeekBeforeDateInCalendar();

  id v9 = objc_msgSend(v3, "hk_dateByAddingDays:toDate:", v6, v8);
  v10 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v8 endDate:v9];
  v11 = [(ACHWorkoutAwardingSource *)self workoutClient];

  if (v11)
  {
    v12 = [(ACHWorkoutAwardingSource *)self workoutClient];
    id v18 = 0;
    uint64_t v13 = [v12 numberOfFirstPartyWorkoutsWithDuration:v10 containedInInterval:&v18 error:300.0];
    id v14 = v18;

    if (v14)
    {
      v15 = ACHLogAwardEngine();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ACHWorkoutAwardingSource _progressEnvironment]();
      }
    }
  }
  else
  {
    id v14 = [(ACHWorkoutAwardingSource *)self workoutUtility];
    uint64_t v13 = [v14 numberOfFirstPartyWorkoutsWithDuration:v10 containedInInterval:300.0];
  }

  v16 = [[ACHWorkoutProgressEvaluationEnvironment alloc] initWithNumberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek:v13];
  return v16;
}

- (ACHAwardsWorkoutClient)workoutClient
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workoutClient);
  return (ACHAwardsWorkoutClient *)WeakRetained;
}

- (id)currentDate
{
  uint64_t v3 = [(ACHWorkoutAwardingSource *)self currentDateOverride];

  if (v3) {
    [(ACHWorkoutAwardingSource *)self currentDateOverride];
  }
  else {
  uint64_t v4 = [MEMORY[0x263EFF910] date];
  }
  return v4;
}

- (NSDate)currentDateOverride
{
  return self->_currentDateOverride;
}

- (void)requestAchievementProgressUpdatesForTemplates:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACHWorkoutAwardingSource *)self internalQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__ACHWorkoutAwardingSource_requestAchievementProgressUpdatesForTemplates___block_invoke;
  v7[3] = &unk_264515DE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (BOOL)_handlesTemplate:(id)a3
{
  return ((unint64_t)[a3 triggers] >> 1) & 1;
}

- (ACHWorkoutAwardingSource)initWithClient:(id)a3 healthStore:(id)a4 awardingEngine:(id)a5 dataStore:(id)a6 templateStore:(id)a7 creatorDevice:(unsigned __int8)a8 progressEngine:(id)a9 workoutUtility:(id)a10
{
  return [(ACHWorkoutAwardingSource *)self initWithClient:a3 healthStore:a4 awardingEngine:a5 dataStore:a6 templateStore:a7 creatorDevice:a8 progressEngine:a9 workoutUtility:a10 initialResultsHandler:0];
}

- (ACHWorkoutAwardingSource)initWithClient:(id)a3 healthStore:(id)a4 awardingEngine:(id)a5 dataStore:(id)a6 templateStore:(id)a7 creatorDevice:(unsigned __int8)a8 progressEngine:(id)a9 workoutUtility:(id)a10 initialResultsHandler:(id)a11
{
  id v17 = a3;
  id v33 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  v34.receiver = self;
  v34.super_class = (Class)ACHWorkoutAwardingSource;
  long long v24 = [(ACHWorkoutAwardingSource *)&v34 init];
  v25 = v24;
  if (v24)
  {
    v24->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v24->_client, v17);
    objc_storeStrong((id *)&v25->_healthStore, a4);
    uint64_t v26 = HKCreateSerialDispatchQueue();
    internalQueue = v25->_internalQueue;
    v25->_internalQueue = (OS_dispatch_queue *)v26;

    objc_storeWeak((id *)&v25->_engine, v18);
    objc_storeWeak((id *)&v25->_dataStore, v19);
    objc_storeWeak((id *)&v25->_progressEngine, v21);
    objc_storeWeak((id *)&v25->_templateStore, v20);
    v25->_creatorDevice = a8;
    *(_OWORD *)&v25->_bestElevationGainedHiking = xmmword_21F65F650;
    int64x2_t v28 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *(int64x2_t *)&v25->_best10KDuration = v28;
    *(int64x2_t *)&v25->_bestWheelchair10KDuration = v28;
    *(int64x2_t *)&v25->_bestMarathonDuration = v28;
    v25->_bestWheelchairMarathonDuration = 1.79769313e308;
    id WeakRetained = objc_loadWeakRetained((id *)&v25->_dataStore);
    [WeakRetained addPropertyProvider:v25];

    objc_storeWeak((id *)&v25->_workoutClient, v22);
    uint64_t v30 = MEMORY[0x223C507A0](v23);
    id initialResultsHandler = v25->_initialResultsHandler;
    v25->_id initialResultsHandler = (id)v30;
  }
  return v25;
}

- (void)activate
{
  objc_initWeak(&location, self);
  uint64_t v3 = (const char *)[(id)*MEMORY[0x263F235A8] UTF8String];
  id v4 = MEMORY[0x263EF83A0];
  id v5 = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __36__ACHWorkoutAwardingSource_activate__block_invoke;
  id v9 = &unk_264515D40;
  objc_copyWeak(&v10, &location);
  notify_register_dispatch(v3, &self->_protectedDataToken, v4, &v6);

  [(ACHWorkoutAwardingSource *)self _startWorkoutQueryIfNecessary];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __36__ACHWorkoutAwardingSource_activate__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained client];
  int v4 = [v3 isProtectedDataAvailable];

  id v5 = ACHLogWorkouts();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl(&dword_21F5DA000, v5, OS_LOG_TYPE_DEFAULT, "Workout awarding source received protected data availabilty change to state: %d", (uint8_t *)v7, 8u);
  }

  if (v4)
  {
    id v6 = objc_loadWeakRetained(v1);
    [v6 _startWorkoutQueryIfNecessary];
  }
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_protectedDataToken)) {
    notify_cancel(self->_protectedDataToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)ACHWorkoutAwardingSource;
  [(ACHWorkoutAwardingSource *)&v3 dealloc];
}

- (void)_startWorkoutQueryIfNecessary
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_workoutQuery) {
    [(ACHWorkoutAwardingSource *)self _lock_startWorkoutQueryWithInitialResultsHandler:self->_initialResultsHandler];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_startWorkoutQueryWithInitialResultsHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x263F0A0C8]);
  id v6 = [MEMORY[0x263F0A6E8] workoutType];
  uint64_t v7 = [MEMORY[0x263F0A670] latestAnchor];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __77__ACHWorkoutAwardingSource__lock_startWorkoutQueryWithInitialResultsHandler___block_invoke;
  v16[3] = &unk_264518248;
  objc_copyWeak(&v18, &location);
  id v8 = v4;
  id v17 = v8;
  id v9 = (HKAnchoredObjectQuery *)[v5 initWithType:v6 predicate:0 anchor:v7 limit:0 resultsHandler:v16];
  workoutQuery = self->_workoutQuery;
  self->_workoutQuery = v9;

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__ACHWorkoutAwardingSource__lock_startWorkoutQueryWithInitialResultsHandler___block_invoke_316;
  v14[3] = &unk_264515D90;
  objc_copyWeak(&v15, &location);
  [(HKAnchoredObjectQuery *)self->_workoutQuery setUpdateHandler:v14];
  v11 = ACHLogWorkouts();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_21F5DA000, v11, OS_LOG_TYPE_DEFAULT, "Starting workout query", v13, 2u);
  }

  v12 = [(ACHWorkoutAwardingSource *)self healthStore];
  [v12 executeQuery:self->_workoutQuery];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __77__ACHWorkoutAwardingSource__lock_startWorkoutQueryWithInitialResultsHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v15)
  {
    v16 = ACHLogWorkouts();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __77__ACHWorkoutAwardingSource__lock_startWorkoutQueryWithInitialResultsHandler___block_invoke_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _stopWorkoutQuery];
  }
  uint64_t v18 = *(void *)(a1 + 32);
  if (v18) {
    (*(void (**)(uint64_t, id, id, id, id, id))(v18 + 16))(v18, v11, v12, v13, v14, v15);
  }
}

void __77__ACHWorkoutAwardingSource__lock_startWorkoutQueryWithInitialResultsHandler___block_invoke_316(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8 = a3;
  id v9 = a6;
  if (v9)
  {
    id v10 = ACHLogWorkouts();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __77__ACHWorkoutAwardingSource__lock_startWorkoutQueryWithInitialResultsHandler___block_invoke_316_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _stopWorkoutQuery];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained workoutsAdded:v8];
  }
}

- (void)_stopWorkoutQuery
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(ACHWorkoutAwardingSource *)self healthStore];
  [v4 stopQuery:self->_workoutQuery];

  workoutQuery = self->_workoutQuery;
  self->_workoutQuery = 0;

  os_unfair_lock_unlock(p_lock);
}

- (ACHWorkoutAwardingSource)initWithProfile:(id)a3 awardingEngine:(id)a4 dataStore:(id)a5 templateStore:(id)a6 creatorDevice:(unsigned __int8)a7 progressEngine:(id)a8 workoutUtility:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  v30.receiver = self;
  v30.super_class = (Class)ACHWorkoutAwardingSource;
  id v21 = [(ACHWorkoutAwardingSource *)&v30 init];
  id v22 = v21;
  if (v21)
  {
    v21->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v21->_profile, v15);
    uint64_t v23 = HKCreateSerialDispatchQueue();
    internalQueue = v22->_internalQueue;
    v22->_internalQueue = (OS_dispatch_queue *)v23;

    objc_storeWeak((id *)&v22->_engine, v16);
    objc_storeWeak((id *)&v22->_dataStore, v17);
    objc_storeWeak((id *)&v22->_progressEngine, v19);
    objc_storeWeak((id *)&v22->_templateStore, v18);
    v22->_creatorDevice = a7;
    int64x2_t v25 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *(_OWORD *)&v22->_bestElevationGainedHiking = xmmword_21F65F650;
    *(int64x2_t *)&v22->_best10KDuration = v25;
    *(int64x2_t *)&v22->_bestWheelchair10KDuration = v25;
    *(int64x2_t *)&v22->_bestMarathonDuration = v25;
    v22->_bestWheelchairMarathonDuration = 1.79769313e308;
    objc_storeWeak((id *)&v22->_workoutUtility, v20);
    id WeakRetained = objc_loadWeakRetained((id *)&v22->_dataStore);
    [WeakRetained addPropertyProvider:v22];

    id v27 = objc_loadWeakRetained((id *)&v22->_profile);
    int64x2_t v28 = [v27 daemon];
    [v28 registerForDaemonReady:v22];
  }
  return v22;
}

- (BOOL)isAppleWatch
{
  objc_super v3 = [(ACHWorkoutAwardingSource *)self overrideIsAppleWatch];

  if (v3)
  {
    id v4 = [(ACHWorkoutAwardingSource *)self overrideIsAppleWatch];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    uint64_t v7 = [(ACHWorkoutAwardingSource *)self profile];

    if (v7)
    {
      id v4 = [(ACHWorkoutAwardingSource *)self profile];
      id v8 = [v4 daemon];
      id v9 = [v8 behavior];
      char v6 = [v9 isAppleWatch];

      goto LABEL_6;
    }
    id v4 = [MEMORY[0x263F0A980] sharedBehavior];
    char v5 = [v4 isAppleWatch];
  }
  char v6 = v5;
LABEL_6:

  return v6;
}

- (void)daemonReady:(id)a3
{
  id v6 = [(ACHWorkoutAwardingSource *)self profile];
  id v4 = [v6 dataManager];
  char v5 = [MEMORY[0x263F0A598] workoutType];
  [v4 addObserver:self forDataType:v5];
}

- (NSString)uniqueName
{
  return (NSString *)@"WorkoutAwardingSource";
}

- (id)earnedInstancesForHistoricalInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v13 = 0;
  uint64_t v7 = [(ACHWorkoutAwardingSource *)self _client_earnedInstancesForWorkoutsInDateInterval:v6 error:&v13];
  id v8 = v13;
  if (v8)
  {
    id v9 = ACHLogAwardEngine();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ACHWorkoutAwardingSource earnedInstancesForHistoricalInterval:error:]();
    }

    if (a4) {
      *a4 = v8;
    }
    else {
      _HKLogDroppedError();
    }
    id v10 = objc_alloc_init(MEMORY[0x263EFFA08]);
  }
  else
  {
    id v10 = v7;
  }
  id v11 = v10;

  return v11;
}

- (id)earnedInstancesForHistoricalInterval:(id)a3 databaseContext:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = ACHLogWorkouts();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "WorkoutAwardingSource querying for earned instances in interval: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__28;
  long long v24 = __Block_byref_object_dispose__28;
  id v25 = 0;
  if (!v7)
  {
    id v7 = [MEMORY[0x263F431E0] contextForReadingProtectedData];
  }
  id v9 = [(ACHWorkoutAwardingSource *)self profile];
  id v10 = [v9 database];
  id v11 = (void *)[v7 copyForReadingProtectedData];
  id v20 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __81__ACHWorkoutAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke;
  v17[3] = &unk_264516CA0;
  v17[4] = self;
  id v12 = v6;
  id v18 = v12;
  p_long long buf = &buf;
  [v10 performTransactionWithContext:v11 error:&v20 block:v17 inaccessibilityHandler:0];
  id v13 = v20;

  if (v13)
  {
    id v14 = ACHLogWorkouts();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ACHWorkoutAwardingSource earnedInstancesForHistoricalInterval:databaseContext:]();
    }
  }
  id v15 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v15;
}

uint64_t __81__ACHWorkoutAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) workoutUtility];
  objc_super v3 = [v2 workoutsInDateInterval:*(void *)(a1 + 40)];

  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_25];

  uint64_t v5 = [*(id *)(a1 + 32) _earnedInstancesForWorkouts:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return 1;
}

uint64_t __81__ACHWorkoutAwardingSource_earnedInstancesForHistoricalInterval_databaseContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 endDate];
  uint64_t v6 = [v4 endDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)workoutsAdded:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ACHWorkoutAwardingSource *)self progressEngine];
  [v5 requestProgressUpdateForProgressProvider:self];

  uint64_t v6 = [MEMORY[0x263F0A980] sharedBehavior];
  int IsAppleWatch = ACHConfigurationSupportsIncrementalEvaluationWithIsAppleWatch([v6 isAppleWatch]);

  if (IsAppleWatch)
  {
    id v8 = ACHLogWorkouts();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v15 = [v4 count];
      _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "WorkoutAwardingProvider found %lu new workout samples, requesting incremental evaluation", buf, 0xCu);
    }

    id v9 = [(ACHWorkoutAwardingSource *)self engine];
    id v10 = [(ACHWorkoutAwardingSource *)self uniqueName];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __42__ACHWorkoutAwardingSource_workoutsAdded___block_invoke;
    v11[3] = &unk_264515E50;
    id v12 = v4;
    id v13 = self;
    [v9 requestIncrementalEvaluationForSource:v10 evaluationBlock:v11];
  }
}

id __42__ACHWorkoutAwardingSource_workoutsAdded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ACHLogWorkouts();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) count];
    int v8 = 138543618;
    id v9 = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v5;
    _os_log_impl(&dword_21F5DA000, v4, OS_LOG_TYPE_DEFAULT, "WorkoutAwardingProvider starting incremental evaluation for date range: %{public}@, %lu workout samples", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v6 = [*(id *)(a1 + 40) _earnedInstancesForWorkouts:*(void *)(a1 + 32)];

  return v6;
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(ACHWorkoutAwardingSource *)self progressEngine];
  [v6 requestProgressUpdateForProgressProvider:self];

  if (ACHConfigurationSupportsIncrementalEvaluationWithIsAppleWatch([(ACHWorkoutAwardingSource *)self isAppleWatch]))
  {
    uint64_t v7 = ACHLogWorkouts();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v14 = [v5 count];
      _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "WorkoutAwardingProvider found %lu new workout samples, requesting incremental evaluation", buf, 0xCu);
    }

    int v8 = [(ACHWorkoutAwardingSource *)self engine];
    id v9 = [(ACHWorkoutAwardingSource *)self uniqueName];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __48__ACHWorkoutAwardingSource_samplesAdded_anchor___block_invoke;
    v10[3] = &unk_264515E50;
    id v11 = v5;
    uint64_t v12 = self;
    [v8 requestIncrementalEvaluationForSource:v9 evaluationBlock:v10];
  }
}

id __48__ACHWorkoutAwardingSource_samplesAdded_anchor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ACHLogWorkouts();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) count];
    int v8 = 138543618;
    id v9 = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v5;
    _os_log_impl(&dword_21F5DA000, v4, OS_LOG_TYPE_DEFAULT, "WorkoutAwardingProvider starting incremental evaluation for date range: %{public}@, %lu workout samples", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v6 = [*(id *)(a1 + 40) _earnedInstancesForWorkouts:*(void *)(a1 + 32)];

  return v6;
}

- (id)_bestElevationGainedKeyForActivityType:(unint64_t)a3
{
  id v3 = NSString;
  id v4 = [MEMORY[0x263F0A8F8] _stringFromWorkoutActivityType:a3];
  uint64_t v5 = [v3 stringWithFormat:@"%@-%@", @"BestElevationGained", v4];

  return v5;
}

- (NSArray)dataStorePropertyKeys
{
  v5[9] = *MEMORY[0x263EF8340];
  id v2 = [(ACHWorkoutAwardingSource *)self _bestElevationGainedKeyForActivityType:24];
  v5[0] = v2;
  v5[1] = @"Best5KDuration";
  v5[2] = @"Best10KDuration";
  v5[3] = @"BestWheelchair5KDuration";
  v5[4] = @"BestWheelchair10KDuration";
  v5[5] = @"BestHalfMarathonDuration";
  v5[6] = @"BestMarathonDuration";
  v5[7] = @"BestWheelchairHalfMarathonDuration";
  v5[8] = @"BestWheelchairMarathonDuration";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:9];

  return (NSArray *)v3;
}

- (NSDictionary)dataStoreProperties
{
  v17[9] = *MEMORY[0x263EF8340];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v14 = [(ACHWorkoutAwardingSource *)self _bestElevationGainedKeyForActivityType:24];
  v16[0] = v14;
  id v3 = [NSNumber numberWithDouble:self->_bestElevationGainedHiking];
  v17[0] = v3;
  v16[1] = @"Best5KDuration";
  id v4 = [NSNumber numberWithDouble:self->_best5KDuration];
  v17[1] = v4;
  v16[2] = @"Best10KDuration";
  uint64_t v5 = [NSNumber numberWithDouble:self->_best10KDuration];
  v17[2] = v5;
  v16[3] = @"BestWheelchair5KDuration";
  uint64_t v6 = [NSNumber numberWithDouble:self->_bestWheelchair5KDuration];
  v17[3] = v6;
  void v16[4] = @"BestWheelchair10KDuration";
  uint64_t v7 = [NSNumber numberWithDouble:self->_bestWheelchair10KDuration];
  v17[4] = v7;
  v16[5] = @"BestHalfMarathonDuration";
  int v8 = [NSNumber numberWithDouble:self->_bestHalfMarathonDuration];
  void v17[5] = v8;
  v16[6] = @"BestMarathonDuration";
  id v9 = [NSNumber numberWithDouble:self->_bestMarathonDuration];
  v17[6] = v9;
  v16[7] = @"BestWheelchairHalfMarathonDuration";
  __int16 v10 = [NSNumber numberWithDouble:self->_bestWheelchairHalfMarathonDuration];
  v17[7] = v10;
  v16[8] = @"BestWheelchairMarathonDuration";
  uint64_t v11 = [NSNumber numberWithDouble:self->_bestWheelchairMarathonDuration];
  v17[8] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:9];

  os_unfair_lock_unlock(lock);
  return (NSDictionary *)v12;
}

- (void)setDataStoreProperties:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_t lock = p_lock;
  os_unfair_lock_lock(p_lock);
  id v25 = [(ACHWorkoutAwardingSource *)self _bestElevationGainedKeyForActivityType:24];
  uint64_t v6 = objc_msgSend(v5, "objectForKeyedSubscript:");
  uint64_t v7 = [v5 objectForKeyedSubscript:@"Best5KDuration"];
  uint64_t v23 = [v5 objectForKeyedSubscript:@"Best10KDuration"];
  int v8 = [v5 objectForKeyedSubscript:@"BestWheelchair5KDuration"];
  id v9 = [v5 objectForKeyedSubscript:@"BestWheelchair10KDuration"];
  __int16 v10 = [v5 objectForKeyedSubscript:@"BestHalfMarathonDuration"];
  uint64_t v11 = [v5 objectForKeyedSubscript:@"BestMarathonDuration"];
  uint64_t v12 = [v5 objectForKeyedSubscript:@"BestWheelchairHalfMarathonDuration"];
  id v13 = [v5 objectForKeyedSubscript:@"BestWheelchairMarathonDuration"];

  if (v6) {
    [v6 doubleValue];
  }
  else {
    double v14 = 2.22507386e-308;
  }
  self->_bestElevationGainedHiking = v14;
  if (v7) {
    [v7 doubleValue];
  }
  else {
    double v15 = 1.79769313e308;
  }
  self->_best5KDuration = v15;
  if (v23) {
    [v23 doubleValue];
  }
  else {
    double v16 = 1.79769313e308;
  }
  self->_best10KDuration = v16;
  if (v8) {
    [v8 doubleValue];
  }
  else {
    double v17 = 1.79769313e308;
  }
  self->_bestWheelchair5KDuration = v17;
  if (v9) {
    [v9 doubleValue];
  }
  else {
    double v18 = 1.79769313e308;
  }
  self->_bestWheelchair10KDuration = v18;
  if (v10) {
    [v10 doubleValue];
  }
  else {
    double v19 = 1.79769313e308;
  }
  self->_bestHalfMarathonDuration = v19;
  if (v11) {
    [v11 doubleValue];
  }
  else {
    double v20 = 1.79769313e308;
  }
  self->_bestMarathonDuration = v20;
  if (v12) {
    [v12 doubleValue];
  }
  else {
    double v21 = 1.79769313e308;
  }
  self->_bestWheelchairHalfMarathonDuration = v21;
  if (v13) {
    [v13 doubleValue];
  }
  else {
    double v22 = 1.79769313e308;
  }
  self->_bestWheelchairMarathonDuration = v22;
  os_unfair_lock_unlock(lock);
}

- (void)dataStoreDidClearAllProperties:(id)a3 completion:(id)a4
{
  p_os_unfair_lock_t lock = &self->_lock;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  os_unfair_lock_lock(p_lock);
  *(_OWORD *)&self->_bestElevationGainedHiking = xmmword_21F65F650;
  int64x2_t v6 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *(int64x2_t *)&self->_best10KDuration = v6;
  *(int64x2_t *)&self->_bestWheelchair10KDuration = v6;
  *(int64x2_t *)&self->_bestMarathonDuration = v6;
  self->_bestWheelchairMarathonDuration = 1.79769313e308;
  os_unfair_lock_unlock(p_lock);
  v7[2](v7, 1);
}

- (id)_earnedInstancesForWorkouts:(id)a3
{
  id v4 = a3;
  id v5 = [(ACHWorkoutAwardingSource *)self workoutClient];

  if (v5) {
    [(ACHWorkoutAwardingSource *)self _client_earnedInstancesForWorkouts:v4];
  }
  else {
  int64x2_t v6 = [(ACHWorkoutAwardingSource *)self _daemon_earnedInstancesForWorkouts:v4];
  }

  return v6;
}

- (id)_stringForDuration:(double)a3
{
  if (a3 == 1.79769313e308)
  {
    id v4 = @"No Record Set";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lf seconds", *(void *)&a3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_stringForExperienceType:(unint64_t)a3
{
  if (a3 > 3) {
    return @"UNKNOWN";
  }
  else {
    return off_2645182B0[a3];
  }
}

- (id)_stringForDate:(id)a3
{
  uint64_t v3 = _stringForDate__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_stringForDate__onceToken, &__block_literal_global_366);
  }
  id v5 = [(id)_stringForDate__formatter stringFromDate:v4];

  return v5;
}

uint64_t __43__ACHWorkoutAwardingSource__stringForDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)_stringForDate__formatter;
  _stringForDate__formatter = (uint64_t)v0;

  id v2 = (void *)_stringForDate__formatter;
  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
}

- (void)_client_appendEarnedInstancesForWorkout:(id)a3 toSet:(id)a4 templates:(id)a5 calendar:(id)a6 numberOfDaysInWeek:(unint64_t)a7 predicates:(id)a8 firstDayOfFitnessWeek:(int64_t)a9 watchCountryCode:(id)a10
{
  uint64_t v237 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a10;
  double v21 = ACHLogWorkouts();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v233 = v15;
    _os_log_impl(&dword_21F5DA000, v21, OS_LOG_TYPE_DEFAULT, "Evaluating workout %@", buf, 0xCu);
  }
  id v214 = v19;

  uint64_t v22 = *MEMORY[0x263F234C0];
  uint64_t v23 = [v15 endDate];
  uint64_t v211 = v22;
  long long v24 = [v18 components:v22 fromDate:v23];

  v197 = v24;
  v198 = v20;
  id v25 = ACHAvailableTemplatesForDateComponentsAndCountryCodeInTemplates(v24, v20, v17);
  uint64_t v26 = ACHLogWorkouts();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    -[ACHWorkoutAwardingSource _client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:].cold.6(v25, v15, v26);
  }
  v217 = v25;

  id v27 = [(ACHWorkoutAwardingSource *)self workoutClient];
  uint64_t v28 = [v15 workoutActivityType];
  v29 = [v15 endDate];
  id v231 = 0;
  uint64_t v221 = [v27 numberOfFirstPartyWorkoutsWithDuration:v28 withType:v29 endingOnOrBeforeDate:&v231 error:300.0];
  id v30 = v231;

  if (v30)
  {
    v31 = ACHLogAwardEngine();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[ACHWorkoutAwardingSource _client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:].cold.5();
    }
  }
  v32 = [v15 endDate];
  uint64_t v33 = ACHStartOfFitnessWeekBeforeDateWithFirstWeekdayInCalendar();

  objc_super v34 = objc_msgSend(v18, "hk_dateByAddingDays:toDate:", a7, v33);
  v35 = [v15 endDate];
  v195 = v34;
  uint64_t v36 = [v34 earlierDate:v35];

  v196 = (void *)v33;
  v194 = (void *)v36;
  v37 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v33 endDate:v36];

  v38 = [(ACHWorkoutAwardingSource *)self workoutClient];
  id v230 = 0;
  uint64_t v219 = [v38 numberOfFirstPartyWorkoutsWithDuration:v37 containedInInterval:&v230 error:300.0];
  id v39 = v230;

  if (v39)
  {
    v40 = ACHLogAwardEngine();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      -[ACHWorkoutAwardingSource _client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:].cold.4();
    }
  }
  v41 = [(ACHWorkoutAwardingSource *)self workoutClient];
  uint64_t v42 = [v15 workoutActivityType];
  v43 = [v15 endDate];
  id v229 = 0;
  v204 = [v41 bestEnergyBurnedForFirstPartyWorkoutsWithType:v42 endingBeforeDate:v43 error:&v229];
  id v44 = v229;

  if (v44)
  {
    v45 = ACHLogAwardEngine();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      -[ACHWorkoutAwardingSource _client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:]();
    }
  }
  v46 = [MEMORY[0x263F0A830] kilocalorieUnit];
  [v204 doubleValueForUnit:v46];
  double v48 = v47;

  v49 = [(ACHWorkoutAwardingSource *)self workoutClient];
  uint64_t v50 = [v15 workoutActivityType];
  v51 = [v15 endDate];
  id v228 = 0;
  v203 = [v49 bestDistanceForFirstPartyWorkoutsWithType:v50 endingBeforeDate:v51 error:&v228];
  id v52 = v228;

  if (v52)
  {
    v53 = ACHLogAwardEngine();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      -[ACHWorkoutAwardingSource _client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:]();
    }
  }
  v54 = [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:9];
  [v203 doubleValueForUnit:v54];
  double v56 = v55;

  v57 = [(ACHWorkoutAwardingSource *)self healthStore];
  v58 = [v15 endDate];
  id v227 = 0;
  uint64_t v59 = ACHExperienceTypeForDateWithHealthStore(v57, v18, v58, &v227);
  id v60 = v227;

  if (v60)
  {
    v61 = ACHLogWorkouts();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      -[ACHWorkoutAwardingSource _client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:]();
    }

    uint64_t v59 = 3;
  }
  BOOL v212 = [(ACHWorkoutAwardingSource *)self _isMetricLocale];
  os_unfair_lock_lock(&self->_lock);
  id v207 = v16;
  v199 = v18;
  v200 = v17;
  v192 = v60;
  if ([v15 workoutActivityType] == 24) {
    double bestElevationGainedHiking = self->_bestElevationGainedHiking;
  }
  else {
    double bestElevationGainedHiking = 2.22507386e-308;
  }
  id v208 = v15;
  v202 = objc_msgSend(MEMORY[0x263F0A8F8], "_stringFromWorkoutActivityType:", objc_msgSend(v15, "workoutActivityType"));
  v206 = NSString;
  uint64_t v215 = v59;
  v191 = [(ACHWorkoutAwardingSource *)self _stringForExperienceType:v59];
  v210 = [v37 startDate];
  v190 = [(ACHWorkoutAwardingSource *)self _stringForDate:v210];
  v193 = v37;
  v209 = [v37 endDate];
  v63 = [(ACHWorkoutAwardingSource *)self _stringForDate:v209];
  v64 = [(ACHWorkoutAwardingSource *)self _stringForDuration:self->_best5KDuration];
  v65 = [(ACHWorkoutAwardingSource *)self _stringForDuration:self->_best10KDuration];
  v66 = [(ACHWorkoutAwardingSource *)self _stringForDuration:self->_bestWheelchair5KDuration];
  v67 = [(ACHWorkoutAwardingSource *)self _stringForDuration:self->_bestWheelchair10KDuration];
  v68 = [(ACHWorkoutAwardingSource *)self _stringForDuration:self->_bestHalfMarathonDuration];
  v69 = [(ACHWorkoutAwardingSource *)self _stringForDuration:self->_bestMarathonDuration];
  v70 = [(ACHWorkoutAwardingSource *)self _stringForDuration:self->_bestWheelchairHalfMarathonDuration];
  v71 = [(ACHWorkoutAwardingSource *)self _stringForDuration:self->_bestWheelchairMarathonDuration];
  objc_msgSend(v206, "stringWithFormat:", @"Using the following values for evaluation:\nWorkout Type: %@\nExperience Type: %@\nPrevious workouts of type over 5 minutes: %lu\nWorkouts of any type this week over 5 minutes (week is %@ - %@): %lu\nBest Energy Burned value for workout type: %lf kcal\nBest Distance for workout type: %lf km\nBest Elevation Gain: %lf cm\nBest 5K Duration: %@\nBest 10K Duration: %@\nBest Wheelchair 5k Duration: %@\nBest Wheelchair 10k Duration: %@\nBest Half Marathon Duration: %@\nBest Marathon Duration: %@\nBest Wheelchair Half Marathon Duration: %@\nBest Wheelchair Marathon Duration: %@", v202, v191, v221, v190, v63, v219, *(void *)&v48, *(void *)&v56, *(void *)&bestElevationGainedHiking, v64, v65, v66, v67, v68, v69, v70,
  v201 = v71);

  v72 = ACHLogWorkouts();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v233 = v201;
    _os_log_impl(&dword_21F5DA000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  v73 = v208;
  v74 = -[ACHWorkoutEvaluationEnvironment initWithWorkout:numberOfFirstPartyWorkoutsOver5MinutesWithType:numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek:bestKilocaloriesForType:bestKilometersForType:bestElevationGainedForType:best5KDuration:best10KDuration:bestWheelchair5KDuration:bestWheelchair10KDuration:bestHalfMarathonDuration:bestMarathonDuration:bestWheelchairHalfMarathonDuration:bestWheelchairMarathonDuration:experienceType:isMetricLocale:]([ACHWorkoutEvaluationEnvironment alloc], "initWithWorkout:numberOfFirstPartyWorkoutsOver5MinutesWithType:numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek:bestKilocaloriesForType:bestKilometersForType:bestElevationGainedForType:best5KDuration:best10KDuration:bestWheelchair5KDuration:bestWheelchair10KDuration:bestHalfMarathonDuration:bestMarathonDuration:bestWheelchairHalfMarathonDuration:bestWheelchairMarathonDuration:experienceType:isMetricLocale:", v208, v221, v219, v215, v212, v48, v56, bestElevationGainedHiking, self->_best5KDuration, self->_best10KDuration, self->_bestWheelchair5KDuration, self->_bestWheelchair10KDuration, self->_bestHalfMarathonDuration, *(void *)&self->_bestMarathonDuration,
          *(void *)&self->_bestWheelchairHalfMarathonDuration,
          *(void *)&self->_bestWheelchairMarathonDuration);
  id v220 = objc_alloc_init(MEMORY[0x263F236C0]);
  long long v223 = 0u;
  long long v224 = 0u;
  long long v225 = 0u;
  long long v226 = 0u;
  id v75 = v217;
  v76 = v207;
  v77 = v214;
  v213 = v75;
  v216 = v74;
  uint64_t v222 = [v75 countByEnumeratingWithState:&v223 objects:v236 count:16];
  if (v222)
  {
    uint64_t v218 = *(void *)v224;
    do
    {
      for (uint64_t i = 0; i != v222; ++i)
      {
        if (*(void *)v224 != v218) {
          objc_enumerationMutation(v75);
        }
        v79 = *(void **)(*((void *)&v223 + 1) + 8 * i);
        v80 = [v220 validateTemplate:v79];
        if ([v80 isValid])
        {
          v81 = [v79 uniqueName];
          v82 = [v77 objectForKeyedSubscript:v81];

          if (!v82)
          {
            v83 = [v79 gracePredicate];
            v84 = v83;
            if (v83)
            {
              id v85 = v83;
            }
            else
            {
              id v85 = [v79 predicate];
            }
            v82 = [MEMORY[0x263F08A98] predicateWithFormat:v85];
            v87 = [v79 uniqueName];
            [v77 setObject:v82 forKeyedSubscript:v87];

            v74 = v216;
          }
          if ([v82 evaluateWithObject:v74])
          {
            v88 = ACHLogWorkouts();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
            {
              v89 = [v79 uniqueName];
              *(_DWORD *)long long buf = 138543618;
              id v233 = v89;
              __int16 v234 = 2112;
              id v235 = v73;
              _os_log_impl(&dword_21F5DA000, v88, OS_LOG_TYPE_DEFAULT, "Template %{public}@ evaluated to true for workout %@", buf, 0x16u);
            }
            v90 = ACHLogWorkouts();
            if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138543362;
              id v233 = v79;
              _os_log_debug_impl(&dword_21F5DA000, v90, OS_LOG_TYPE_DEBUG, "full template: %{public}@", buf, 0xCu);
            }

            id v91 = objc_alloc_init(MEMORY[0x263F236B8]);
            v92 = [v79 uniqueName];
            [v91 setTemplateUniqueName:v92];

            v93 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
            v94 = [v73 endDate];
            v95 = [v93 components:v211 fromDate:v94];
            [v91 setEarnedDateComponents:v95];

            v96 = [v73 UUID];
            v97 = [v96 UUIDString];
            [v91 setExternalIdentifier:v97];

            v98 = [v79 graceValueExpression];
            if (v98)
            {
              id v99 = v98;

              goto LABEL_51;
            }
            id v99 = [v79 valueExpression];

            if (v99)
            {
LABEL_51:
              v100 = [MEMORY[0x263F087F0] expressionWithFormat:v99];
              v101 = [v100 expressionValueWithObject:v216 context:0];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v101 doubleValue];
                double v103 = v102;
                v104 = (void *)MEMORY[0x263F0A630];
                v105 = [v79 canonicalUnit];
                v106 = [v104 quantityWithUnit:v105 doubleValue:v103];
                [v91 setValue:v106];

                v73 = v208;
                v76 = v207;
              }
            }
            [v76 addObject:v91];
            v107 = ACHLogWorkouts();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
            {
              v108 = [v79 uniqueName];
              *(_DWORD *)long long buf = 138543618;
              id v233 = v108;
              __int16 v234 = 2112;
              id v235 = v91;
              _os_log_impl(&dword_21F5DA000, v107, OS_LOG_TYPE_DEFAULT, "Earned instance created for template %{public}@: %@", buf, 0x16u);
            }
            id v75 = v213;
            v77 = v214;
            v74 = v216;
          }
        }
        else
        {
          v82 = ACHLogAwardEngine();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
          {
            v86 = [v79 uniqueName];
            *(_DWORD *)long long buf = 138412290;
            id v233 = v86;
            _os_log_impl(&dword_21F5DA000, v82, OS_LOG_TYPE_DEFAULT, "Template has invalid predicates, skipping: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v222 = [v75 countByEnumeratingWithState:&v223 objects:v236 count:16];
    }
    while (v222);
  }

  if ([v73 workoutActivityType] == 24)
  {
    v109 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
    [v109 elevationGained];
    double v111 = v110;
    double v112 = self->_bestElevationGainedHiking;

    if (v111 > v112)
    {
      v113 = ACHLogWorkouts();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
      {
        v114 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
        [v114 elevationGained];
        *(_DWORD *)long long buf = 134217984;
        id v233 = v115;
        _os_log_impl(&dword_21F5DA000, v113, OS_LOG_TYPE_DEFAULT, "Updated best elevation gain to %lf cm", buf, 0xCu);
      }
      v116 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
      [v116 elevationGained];
      self->_double bestElevationGainedHiking = v117;
    }
  }
  v118 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
  [v118 best5KDuration];
  double v120 = v119;
  double best5KDuration = self->_best5KDuration;

  if (v120 < best5KDuration)
  {
    v122 = ACHLogWorkouts();
    if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
    {
      v123 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
      [v123 best5KDuration];
      -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:");
      id v124 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 138412290;
      id v233 = v124;
      _os_log_impl(&dword_21F5DA000, v122, OS_LOG_TYPE_DEFAULT, "Updated best 5K duration to %@", buf, 0xCu);

      v74 = v216;
    }

    v125 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
    [v125 best5KDuration];
    self->_double best5KDuration = v126;
  }
  v127 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
  [v127 best10KDuration];
  double v129 = v128;
  double best10KDuration = self->_best10KDuration;

  if (v129 < best10KDuration)
  {
    v131 = ACHLogWorkouts();
    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
    {
      v132 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
      [v132 best10KDuration];
      -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:");
      id v133 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 138412290;
      id v233 = v133;
      _os_log_impl(&dword_21F5DA000, v131, OS_LOG_TYPE_DEFAULT, "Updated best 10K duration to %@", buf, 0xCu);

      v74 = v216;
    }

    v134 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
    [v134 best10KDuration];
    self->_double best10KDuration = v135;
  }
  v136 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
  [v136 bestWheelchair5KDuration];
  double v138 = v137;
  double bestWheelchair5KDuration = self->_bestWheelchair5KDuration;

  if (v138 < bestWheelchair5KDuration)
  {
    v140 = ACHLogWorkouts();
    if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
    {
      v141 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
      [v141 bestWheelchair5KDuration];
      -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:");
      id v142 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 138412290;
      id v233 = v142;
      _os_log_impl(&dword_21F5DA000, v140, OS_LOG_TYPE_DEFAULT, "Updated best Wheelchair 5K duration to %@", buf, 0xCu);

      v74 = v216;
    }

    v143 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
    [v143 bestWheelchair5KDuration];
    self->_double bestWheelchair5KDuration = v144;
  }
  v145 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
  [v145 bestWheelchair10KDuration];
  double v147 = v146;
  double bestWheelchair10KDuration = self->_bestWheelchair10KDuration;

  if (v147 < bestWheelchair10KDuration)
  {
    v149 = ACHLogWorkouts();
    if (os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT))
    {
      v150 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
      [v150 bestWheelchair10KDuration];
      -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:");
      id v151 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 138412290;
      id v233 = v151;
      _os_log_impl(&dword_21F5DA000, v149, OS_LOG_TYPE_DEFAULT, "Updated best Wheelchair 10K duration to %@", buf, 0xCu);

      v74 = v216;
    }

    v152 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
    [v152 bestWheelchair10KDuration];
    self->_double bestWheelchair10KDuration = v153;
  }
  v154 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
  [v154 bestHalfMarathonDuration];
  double v156 = v155;
  double bestHalfMarathonDuration = self->_bestHalfMarathonDuration;

  if (v156 < bestHalfMarathonDuration)
  {
    v158 = ACHLogWorkouts();
    if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
    {
      v159 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
      [v159 bestHalfMarathonDuration];
      -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:");
      id v160 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 138412290;
      id v233 = v160;
      _os_log_impl(&dword_21F5DA000, v158, OS_LOG_TYPE_DEFAULT, "Updated best Half Marathon duration to %@", buf, 0xCu);

      v74 = v216;
    }

    v161 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
    [v161 bestHalfMarathonDuration];
    self->_double bestHalfMarathonDuration = v162;
  }
  v163 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
  [v163 bestMarathonDuration];
  double v165 = v164;
  double bestMarathonDuration = self->_bestMarathonDuration;

  if (v165 < bestMarathonDuration)
  {
    v167 = ACHLogWorkouts();
    if (os_log_type_enabled(v167, OS_LOG_TYPE_DEFAULT))
    {
      v168 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
      [v168 bestMarathonDuration];
      -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:");
      id v169 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 138412290;
      id v233 = v169;
      _os_log_impl(&dword_21F5DA000, v167, OS_LOG_TYPE_DEFAULT, "Updated best Marathon duration to %@", buf, 0xCu);

      v74 = v216;
    }

    v170 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
    [v170 bestMarathonDuration];
    self->_double bestMarathonDuration = v171;
  }
  v172 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
  [v172 bestWheelchairHalfMarathonDuration];
  double v174 = v173;
  double bestWheelchairHalfMarathonDuration = self->_bestWheelchairHalfMarathonDuration;

  if (v174 < bestWheelchairHalfMarathonDuration)
  {
    v176 = ACHLogWorkouts();
    if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
    {
      v177 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
      [v177 bestWheelchairHalfMarathonDuration];
      -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:");
      id v178 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 138412290;
      id v233 = v178;
      _os_log_impl(&dword_21F5DA000, v176, OS_LOG_TYPE_DEFAULT, "Updated best Wheelchair Half Marathon duration to %@", buf, 0xCu);

      v74 = v216;
    }

    v179 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
    [v179 bestWheelchairHalfMarathonDuration];
    self->_double bestWheelchairHalfMarathonDuration = v180;
  }
  v181 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
  [v181 bestWheelchairMarathonDuration];
  double v183 = v182;
  double bestWheelchairMarathonDuration = self->_bestWheelchairMarathonDuration;

  if (v183 < bestWheelchairMarathonDuration)
  {
    v185 = ACHLogWorkouts();
    if (os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT))
    {
      v186 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
      [v186 bestWheelchairMarathonDuration];
      -[ACHWorkoutAwardingSource _stringForDuration:](self, "_stringForDuration:");
      id v187 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 138412290;
      id v233 = v187;
      _os_log_impl(&dword_21F5DA000, v185, OS_LOG_TYPE_DEFAULT, "Updated best Wheelchair Marathon duration to %@", buf, 0xCu);

      v74 = v216;
    }

    v188 = [(ACHWorkoutEvaluationEnvironment *)v74 workout];
    [v188 bestWheelchairMarathonDuration];
    self->_double bestWheelchairMarathonDuration = v189;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)_client_earnedInstancesForWorkoutsInDateInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v46 = 0;
  double v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__28;
  uint64_t v50 = __Block_byref_object_dispose__28;
  id v51 = [MEMORY[0x263EFF9C0] set];
  uint64_t v7 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  uint64_t v28 = a4;
  uint64_t v8 = [v7 maximumRangeOfUnit:512];
  uint64_t v10 = v9;
  v29 = v6;
  uint64_t v11 = [(ACHWorkoutAwardingSource *)self templateStore];
  uint64_t v12 = [v11 allTemplates];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __83__ACHWorkoutAwardingSource__client_earnedInstancesForWorkoutsInDateInterval_error___block_invoke;
  v45[3] = &unk_264517400;
  v45[4] = self;
  id v13 = objc_msgSend(v12, "hk_filter:", v45);

  double v14 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
  uint64_t v15 = HKFirstDayOfWeekForWeeklyGoalCalculations();
  id v16 = [(ACHWorkoutAwardingSource *)self watchCountryCode];
  id v17 = [ACHWorkoutIterator alloc];
  id v18 = [(ACHWorkoutAwardingSource *)self healthStore];
  id v19 = [(ACHWorkoutIterator *)v17 initWithHealthStore:v18];

  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = __Block_byref_object_copy__28;
  v43 = __Block_byref_object_dispose__28;
  id v44 = 0;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __83__ACHWorkoutAwardingSource__client_earnedInstancesForWorkoutsInDateInterval_error___block_invoke_2;
  v31[3] = &unk_264518290;
  v31[4] = self;
  uint64_t v36 = &v46;
  id v20 = v13;
  id v32 = v20;
  id v21 = v7;
  id v33 = v21;
  uint64_t v37 = v8 + v10;
  id v22 = v14;
  id v34 = v22;
  uint64_t v38 = v15;
  id v23 = v16;
  id v35 = v23;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __83__ACHWorkoutAwardingSource__client_earnedInstancesForWorkoutsInDateInterval_error___block_invoke_3;
  v30[3] = &unk_2645167A8;
  v30[4] = &v39;
  [(ACHWorkoutIterator *)v19 enumerateWorkoutsForDateInterval:v29 handler:v31 errorHandler:v30];
  id v24 = (id)v40[5];
  id v25 = v24;
  if (v24)
  {
    if (v28) {
      *uint64_t v28 = v24;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v26 = (id)v47[5];
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v46, 8);
  return v26;
}

uint64_t __83__ACHWorkoutAwardingSource__client_earnedInstancesForWorkoutsInDateInterval_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handlesTemplate:a2];
}

void __83__ACHWorkoutAwardingSource__client_earnedInstancesForWorkoutsInDateInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = (void *)MEMORY[0x223C50570]();
  objc_msgSend(*(id *)(a1 + 32), "_client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:", v4, *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 80), *(void *)(a1 + 56), *(void *)(a1 + 88), *(void *)(a1 + 64));
}

void __83__ACHWorkoutAwardingSource__client_earnedInstancesForWorkoutsInDateInterval_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)_client_earnedInstancesForWorkouts:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v27 = [MEMORY[0x263EFF9C0] set];
  id v26 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  uint64_t v5 = [v26 maximumRangeOfUnit:512];
  uint64_t v7 = v6;
  uint64_t v8 = [(ACHWorkoutAwardingSource *)self templateStore];
  uint64_t v9 = [v8 allTemplates];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __63__ACHWorkoutAwardingSource__client_earnedInstancesForWorkouts___block_invoke;
  v32[3] = &unk_264517400;
  v32[4] = self;
  uint64_t v10 = objc_msgSend(v9, "hk_filter:", v32);

  id v25 = v10;
  uint64_t v11 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  uint64_t v12 = HKFirstDayOfWeekForWeeklyGoalCalculations();
  id v13 = self;
  double v14 = [(ACHWorkoutAwardingSource *)self watchCountryCode];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v4;
  uint64_t v15 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = v5 + v7;
    uint64_t v18 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v21 = (void *)MEMORY[0x223C50570]();
        [(ACHWorkoutAwardingSource *)v13 _client_appendEarnedInstancesForWorkout:v20 toSet:v27 templates:v25 calendar:v26 numberOfDaysInWeek:v17 predicates:v11 firstDayOfFitnessWeek:v12 watchCountryCode:v14];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v16);
  }

  id v22 = [MEMORY[0x263EFFA08] setWithSet:v27];

  return v22;
}

uint64_t __63__ACHWorkoutAwardingSource__client_earnedInstancesForWorkouts___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handlesTemplate:a2];
}

- (id)_daemon_earnedInstancesForWorkouts:(id)a3
{
  uint64_t v222 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF9C0] set];
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  uint64_t v7 = [v6 maximumRangeOfUnit:512];
  uint64_t v9 = v8;
  uint64_t v10 = [(ACHWorkoutAwardingSource *)self templateStore];
  uint64_t v11 = [v10 allTemplates];
  v204[0] = MEMORY[0x263EF8330];
  v204[1] = 3221225472;
  v204[2] = __63__ACHWorkoutAwardingSource__daemon_earnedInstancesForWorkouts___block_invoke;
  v204[3] = &unk_264517400;
  v204[4] = self;
  uint64_t v12 = objc_msgSend(v11, "hk_filter:", v204);

  v172 = v12;
  id v13 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
  HKFirstDayOfWeekForWeeklyGoalCalculations();
  double v171 = [(ACHWorkoutAwardingSource *)self watchCountryCode];
  long long v200 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  long long v203 = 0u;
  id obj = v4;
  uint64_t v173 = [obj countByEnumeratingWithState:&v200 objects:v221 count:16];
  if (v173)
  {
    uint64_t v168 = v7 + v9;
    os_unfair_lock_t lock = &self->_lock;
    uint64_t v166 = *(void *)v201;
    id location = (id *)&self->_profile;
    uint64_t v187 = *MEMORY[0x263F234C0];
    v186 = v5;
    id v169 = self;
    v170 = v6;
    v188 = v13;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v201 != v166) {
          objc_enumerationMutation(obj);
        }
        uint64_t v182 = v14;
        uint64_t v15 = *(void **)(*((void *)&v200 + 1) + 8 * v14);
        context = (void *)MEMORY[0x223C50570]();
        uint64_t v16 = ACHLogWorkouts();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          double v216 = *(double *)&v15;
          _os_log_debug_impl(&dword_21F5DA000, v16, OS_LOG_TYPE_DEBUG, "Evaluating workout %@", buf, 0xCu);
        }

        uint64_t v17 = [v15 endDate];
        uint64_t v18 = [v6 components:v187 fromDate:v17];

        double v180 = v18;
        id v19 = ACHAvailableTemplatesForDateComponentsAndCountryCodeInTemplates(v18, v171, v172);
        uint64_t v20 = ACHLogWorkouts();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v157 = [v19 count];
          v158 = [v15 endDate];
          id v159 = [v19 valueForKey:@"uniqueName"];
          *(_DWORD *)long long buf = 134218498;
          double v216 = *(double *)&v157;
          __int16 v217 = 2114;
          uint64_t v218 = (uint64_t)v158;
          __int16 v219 = 2114;
          id v220 = v159;
          _os_log_debug_impl(&dword_21F5DA000, v20, OS_LOG_TYPE_DEBUG, "Found %lu templates for date %{public}@: %{public}@", buf, 0x20u);
        }
        id v21 = [(ACHWorkoutAwardingSource *)self workoutUtility];
        uint64_t v22 = [v15 workoutActivityType];
        id v23 = [v15 endDate];
        uint64_t v24 = [v21 numberOfFirstPartyWorkoutsWithDuration:v22 withType:v23 endingOnOrBeforeDate:300.0];

        id v25 = ACHLogWorkouts();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x263F0A8F8], "_stringFromWorkoutActivityType:", objc_msgSend(v15, "workoutActivityType"));
          id v160 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)long long buf = 134218242;
          double v216 = *(double *)&v24;
          __int16 v217 = 2114;
          uint64_t v218 = (uint64_t)v160;
          _os_log_debug_impl(&dword_21F5DA000, v25, OS_LOG_TYPE_DEBUG, "Found %lu previous workouts of type %{public}@ over 5 minutes", buf, 0x16u);
        }
        id v26 = [v15 endDate];
        uint64_t v27 = ACHStartOfFitnessWeekBeforeDateWithFirstWeekdayInCalendar();

        long long v28 = objc_msgSend(v6, "hk_dateByAddingDays:toDate:", v168, v27);
        long long v29 = [v15 endDate];
        id v178 = v28;
        uint64_t v30 = [v28 earlierDate:v29];

        v179 = (void *)v27;
        v177 = (void *)v30;
        uint64_t v31 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v27 endDate:v30];
        id v32 = [(ACHWorkoutAwardingSource *)self workoutUtility];
        uint64_t v33 = [v32 numberOfFirstPartyWorkoutsWithDuration:v31 containedInInterval:300.0];

        uint64_t v34 = ACHLogWorkouts();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 134218242;
          double v216 = *(double *)&v33;
          __int16 v217 = 2114;
          uint64_t v218 = v31;
          _os_log_debug_impl(&dword_21F5DA000, v34, OS_LOG_TYPE_DEBUG, "Found %lu workouts this week over 5 minutes (week is %{public}@)", buf, 0x16u);
        }
        v176 = (void *)v31;

        id v35 = [(ACHWorkoutAwardingSource *)self workoutUtility];
        uint64_t v36 = [v15 workoutActivityType];
        [v15 endDate];
        uint64_t v37 = v190 = v15;
        uint64_t v38 = [v35 bestEnergyBurnedForFirstPartyWorkoutsWithType:v36 endingBeforeDate:v37];

        uint64_t v39 = [MEMORY[0x263F0A830] kilocalorieUnit];
        v175 = v38;
        [v38 doubleValueForUnit:v39];
        double v41 = v40;

        uint64_t v42 = ACHLogWorkouts();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x263F0A8F8], "_stringFromWorkoutActivityType:", objc_msgSend(v15, "workoutActivityType"));
          id v161 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)long long buf = 134218242;
          double v216 = v41;
          __int16 v217 = 2114;
          uint64_t v218 = (uint64_t)v161;
          _os_log_debug_impl(&dword_21F5DA000, v42, OS_LOG_TYPE_DEBUG, "Found %lf kcal as best energy value for workout type %{public}@", buf, 0x16u);
        }
        v43 = [(ACHWorkoutAwardingSource *)self workoutUtility];
        uint64_t v44 = [v15 workoutActivityType];
        v45 = [v15 endDate];
        uint64_t v46 = [v43 bestDistanceForFirstPartyWorkoutsWithType:v44 endingBeforeDate:v45];

        double v47 = [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:9];
        double v174 = v46;
        [v46 doubleValueForUnit:v47];
        double v49 = v48;

        uint64_t v50 = ACHLogWorkouts();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x263F0A8F8], "_stringFromWorkoutActivityType:", objc_msgSend(v15, "workoutActivityType"));
          id v162 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)long long buf = 134218242;
          double v216 = v49;
          __int16 v217 = 2114;
          uint64_t v218 = (uint64_t)v162;
          _os_log_debug_impl(&dword_21F5DA000, v50, OS_LOG_TYPE_DEBUG, "Found %lf km as best distance for workout type %{public}@", buf, 0x16u);
        }
        id WeakRetained = objc_loadWeakRetained(location);
        id v52 = [v15 endDate];
        id v199 = 0;
        uint64_t v53 = ACHExperienceTypeForDateWithProfile(WeakRetained, v6, v52, &v199);
        id v54 = v199;

        v185 = v54;
        if (v54)
        {
          double v55 = ACHLogWorkouts();
          id v13 = v188;
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            double v216 = *(double *)&v54;
            _os_log_impl(&dword_21F5DA000, v55, OS_LOG_TYPE_DEFAULT, "WorkoutAwardingSource failed to get date of birth with error %@, defaulting to FIExperienceTypeSimplified", buf, 0xCu);
          }

          uint64_t v53 = 3;
        }
        else
        {
          id v13 = v188;
        }
        BOOL v56 = [(ACHWorkoutAwardingSource *)self _isMetricLocale];
        os_unfair_lock_lock(lock);
        if ([v190 workoutActivityType] == 24) {
          double bestElevationGainedHiking = self->_bestElevationGainedHiking;
        }
        else {
          double bestElevationGainedHiking = 2.22507386e-308;
        }
        v184 = [NSString stringWithFormat:@"Best Elevation Gain: %lf, Best 5K: %lf, Best 10K: %lf, Best Wheelchair 5k: %lf, Best Wheelchair 10k: %lf, Best Half Marathon: %lf, Best Marathon: %lf, Best Wheelchair Half Marathon: %lf, Best Wheelchair Marathon: %lf", *(void *)&bestElevationGainedHiking, *(void *)&self->_best5KDuration, *(void *)&self->_best10KDuration, *(void *)&self->_bestWheelchair5KDuration, *(void *)&self->_bestWheelchair10KDuration, *(void *)&self->_bestHalfMarathonDuration, *(void *)&self->_bestMarathonDuration, *(void *)&self->_bestWheelchairHalfMarathonDuration, *(void *)&self->_bestWheelchairMarathonDuration];
        v58 = ACHLogWorkouts();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          double v216 = *(double *)&v184;
          _os_log_debug_impl(&dword_21F5DA000, v58, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        uint64_t v59 = -[ACHWorkoutEvaluationEnvironment initWithWorkout:numberOfFirstPartyWorkoutsOver5MinutesWithType:numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek:bestKilocaloriesForType:bestKilometersForType:bestElevationGainedForType:best5KDuration:best10KDuration:bestWheelchair5KDuration:bestWheelchair10KDuration:bestHalfMarathonDuration:bestMarathonDuration:bestWheelchairHalfMarathonDuration:bestWheelchairMarathonDuration:experienceType:isMetricLocale:]([ACHWorkoutEvaluationEnvironment alloc], "initWithWorkout:numberOfFirstPartyWorkoutsOver5MinutesWithType:numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek:bestKilocaloriesForType:bestKilometersForType:bestElevationGainedForType:best5KDuration:best10KDuration:bestWheelchair5KDuration:bestWheelchair10KDuration:bestHalfMarathonDuration:bestMarathonDuration:bestWheelchairHalfMarathonDuration:bestWheelchairMarathonDuration:experienceType:isMetricLocale:", v190, v24, v33, v53, v56, v41, v49, bestElevationGainedHiking, self->_best5KDuration, self->_best10KDuration, self->_bestWheelchair5KDuration, self->_bestWheelchair10KDuration, self->_bestHalfMarathonDuration, *(void *)&self->_bestMarathonDuration,
                *(void *)&self->_bestWheelchairHalfMarathonDuration,
                *(void *)&self->_bestWheelchairMarathonDuration);
        id v60 = objc_alloc_init(MEMORY[0x263F236C0]);
        long long v195 = 0u;
        long long v196 = 0u;
        long long v197 = 0u;
        long long v198 = 0u;
        id v61 = v19;
        v62 = v60;
        id v63 = v61;
        unint64_t v64 = 0x263EFF000uLL;
        id v189 = v61;
        uint64_t v194 = [v61 countByEnumeratingWithState:&v195 objects:v214 count:16];
        if (v194)
        {
          v192 = v59;
          uint64_t v193 = *(void *)v196;
          id v191 = v60;
          do
          {
            for (uint64_t i = 0; i != v194; ++i)
            {
              if (*(void *)v196 != v193) {
                objc_enumerationMutation(v63);
              }
              v66 = *(void **)(*((void *)&v195 + 1) + 8 * i);
              v67 = [v62 validateTemplate:v66];
              if ([v67 isValid])
              {
                v68 = [v66 uniqueName];
                v69 = [v13 objectForKeyedSubscript:v68];

                if (!v69)
                {
                  v70 = [v66 gracePredicate];
                  v71 = v70;
                  if (v70)
                  {
                    id v72 = v70;
                  }
                  else
                  {
                    id v72 = [v66 predicate];
                  }
                  v74 = v72;

                  v69 = [MEMORY[0x263F08A98] predicateWithFormat:v74];
                  id v75 = [v66 uniqueName];
                  [v13 setObject:v69 forKeyedSubscript:v75];

                  uint64_t v59 = v192;
                }
                if ([v69 evaluateWithObject:v59])
                {
                  v76 = ACHLogWorkouts();
                  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                  {
                    v77 = [v66 uniqueName];
                    *(_DWORD *)long long buf = 138543618;
                    double v216 = *(double *)&v77;
                    __int16 v217 = 2112;
                    uint64_t v218 = (uint64_t)v190;
                    _os_log_impl(&dword_21F5DA000, v76, OS_LOG_TYPE_DEFAULT, "Template %{public}@ evaluated to true for workout %@", buf, 0x16u);
                  }
                  v78 = ACHLogWorkouts();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)long long buf = 138543362;
                    double v216 = *(double *)&v66;
                    _os_log_debug_impl(&dword_21F5DA000, v78, OS_LOG_TYPE_DEBUG, "full template: %{public}@", buf, 0xCu);
                  }

                  id v79 = objc_alloc_init(MEMORY[0x263F236B8]);
                  v80 = [v66 uniqueName];
                  [v79 setTemplateUniqueName:v80];

                  v81 = objc_msgSend(*(id *)(v64 + 2288), "hk_gregorianCalendar");
                  v82 = [v190 endDate];
                  v83 = [v81 components:v187 fromDate:v82];
                  [v79 setEarnedDateComponents:v83];

                  id v84 = [v66 graceValueExpression];
                  if (v84
                    || ([v66 valueExpression],
                        id v84 = (id)objc_claimAutoreleasedReturnValue(),
                        v84,
                        v84))
                  {
                    id v85 = [MEMORY[0x263F087F0] expressionWithFormat:v84];
                    v86 = [v85 expressionValueWithObject:v192 context:0];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      [v86 doubleValue];
                      double v88 = v87;
                      v89 = (void *)MEMORY[0x263F0A630];
                      v90 = [v66 canonicalUnit];
                      id v91 = [v89 quantityWithUnit:v90 doubleValue:v88];
                      [v79 setValue:v91];

                      unint64_t v64 = 0x263EFF000;
                      uint64_t v5 = v186;
                    }
                  }
                  [v5 addObject:v79];
                  v92 = ACHLogWorkouts();
                  id v13 = v188;
                  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
                  {
                    v93 = [v66 uniqueName];
                    *(_DWORD *)long long buf = 138543618;
                    double v216 = *(double *)&v93;
                    __int16 v217 = 2112;
                    uint64_t v218 = (uint64_t)v79;
                    _os_log_impl(&dword_21F5DA000, v92, OS_LOG_TYPE_DEFAULT, "Earned instance created for template %{public}@: %@", buf, 0x16u);
                  }
                  id v63 = v189;
                  uint64_t v59 = v192;
                }
                v62 = v191;
              }
              else
              {
                v69 = ACHLogAwardEngine();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                {
                  v73 = [v66 uniqueName];
                  *(_DWORD *)long long buf = 138412290;
                  double v216 = *(double *)&v73;
                  _os_log_impl(&dword_21F5DA000, v69, OS_LOG_TYPE_DEFAULT, "Template has invalid predicates, skipping: %@", buf, 0xCu);
                }
              }
            }
            uint64_t v194 = [v63 countByEnumeratingWithState:&v195 objects:v214 count:16];
          }
          while (v194);
        }

        self = v169;
        if ([v190 workoutActivityType] == 24)
        {
          v94 = [(ACHWorkoutEvaluationEnvironment *)v59 workout];
          [v94 elevationGained];
          double v96 = v95;
          double v97 = v169->_bestElevationGainedHiking;

          if (v96 > v97)
          {
            v98 = ACHLogWorkouts();
            if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG)) {
              -[ACHWorkoutAwardingSource _daemon_earnedInstancesForWorkouts:].cold.9((uint64_t)v213, (uint64_t)v59);
            }

            id v99 = [(ACHWorkoutEvaluationEnvironment *)v59 workout];
            [v99 elevationGained];
            v169->_double bestElevationGainedHiking = v100;
          }
        }
        v101 = [(ACHWorkoutEvaluationEnvironment *)v59 workout];
        [v101 best5KDuration];
        double v103 = v102;
        double best5KDuration = v169->_best5KDuration;

        if (v103 < best5KDuration)
        {
          v105 = ACHLogWorkouts();
          if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG)) {
            -[ACHWorkoutAwardingSource _daemon_earnedInstancesForWorkouts:].cold.8((uint64_t)v212, (uint64_t)v59);
          }

          v106 = [(ACHWorkoutEvaluationEnvironment *)v59 workout];
          [v106 best5KDuration];
          v169->_double best5KDuration = v107;
        }
        v108 = [(ACHWorkoutEvaluationEnvironment *)v59 workout];
        [v108 best10KDuration];
        double v110 = v109;
        double best10KDuration = v169->_best10KDuration;

        uint64_t v6 = v170;
        if (v110 < best10KDuration)
        {
          double v112 = ACHLogWorkouts();
          if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG)) {
            -[ACHWorkoutAwardingSource _daemon_earnedInstancesForWorkouts:].cold.7((uint64_t)v211, (uint64_t)v59);
          }

          v113 = [(ACHWorkoutEvaluationEnvironment *)v59 workout];
          [v113 best10KDuration];
          v169->_double best10KDuration = v114;
        }
        v115 = [(ACHWorkoutEvaluationEnvironment *)v59 workout];
        [v115 bestWheelchair5KDuration];
        double v117 = v116;
        double bestWheelchair5KDuration = v169->_bestWheelchair5KDuration;

        if (v117 < bestWheelchair5KDuration)
        {
          double v119 = ACHLogWorkouts();
          if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG)) {
            -[ACHWorkoutAwardingSource _daemon_earnedInstancesForWorkouts:].cold.6((uint64_t)v210, (uint64_t)v59);
          }

          double v120 = [(ACHWorkoutEvaluationEnvironment *)v59 workout];
          [v120 bestWheelchair5KDuration];
          v169->_double bestWheelchair5KDuration = v121;
        }
        v122 = [(ACHWorkoutEvaluationEnvironment *)v59 workout];
        [v122 bestWheelchair10KDuration];
        double v124 = v123;
        double bestWheelchair10KDuration = v169->_bestWheelchair10KDuration;

        if (v124 < bestWheelchair10KDuration)
        {
          double v126 = ACHLogWorkouts();
          if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG)) {
            -[ACHWorkoutAwardingSource _daemon_earnedInstancesForWorkouts:].cold.5((uint64_t)v209, (uint64_t)v59);
          }

          v127 = [(ACHWorkoutEvaluationEnvironment *)v59 workout];
          [v127 bestWheelchair10KDuration];
          v169->_double bestWheelchair10KDuration = v128;
        }
        double v129 = [(ACHWorkoutEvaluationEnvironment *)v59 workout];
        [v129 bestHalfMarathonDuration];
        double v131 = v130;
        double bestHalfMarathonDuration = v169->_bestHalfMarathonDuration;

        if (v131 < bestHalfMarathonDuration)
        {
          id v133 = ACHLogWorkouts();
          if (os_log_type_enabled(v133, OS_LOG_TYPE_DEBUG)) {
            -[ACHWorkoutAwardingSource _daemon_earnedInstancesForWorkouts:].cold.4((uint64_t)v208, (uint64_t)v59);
          }

          v134 = [(ACHWorkoutEvaluationEnvironment *)v59 workout];
          [v134 bestHalfMarathonDuration];
          v169->_double bestHalfMarathonDuration = v135;
        }
        v136 = [(ACHWorkoutEvaluationEnvironment *)v59 workout];
        [v136 bestMarathonDuration];
        double v138 = v137;
        double bestMarathonDuration = v169->_bestMarathonDuration;

        if (v138 < bestMarathonDuration)
        {
          v140 = ACHLogWorkouts();
          if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG)) {
            -[ACHWorkoutAwardingSource _daemon_earnedInstancesForWorkouts:]((uint64_t)v207, (uint64_t)v59);
          }

          v141 = [(ACHWorkoutEvaluationEnvironment *)v59 workout];
          [v141 bestMarathonDuration];
          v169->_double bestMarathonDuration = v142;
        }
        v143 = [(ACHWorkoutEvaluationEnvironment *)v59 workout];
        [v143 bestWheelchairHalfMarathonDuration];
        double v145 = v144;
        double bestWheelchairHalfMarathonDuration = v169->_bestWheelchairHalfMarathonDuration;

        if (v145 < bestWheelchairHalfMarathonDuration)
        {
          double v147 = ACHLogWorkouts();
          if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG)) {
            -[ACHWorkoutAwardingSource _daemon_earnedInstancesForWorkouts:]((uint64_t)v206, (uint64_t)v59);
          }

          v148 = [(ACHWorkoutEvaluationEnvironment *)v59 workout];
          [v148 bestWheelchairHalfMarathonDuration];
          v169->_double bestWheelchairHalfMarathonDuration = v149;
        }
        v150 = [(ACHWorkoutEvaluationEnvironment *)v59 workout];
        [v150 bestWheelchairMarathonDuration];
        double v152 = v151;
        double bestWheelchairMarathonDuration = v169->_bestWheelchairMarathonDuration;

        if (v152 < bestWheelchairMarathonDuration)
        {
          v154 = ACHLogWorkouts();
          if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG)) {
            -[ACHWorkoutAwardingSource _daemon_earnedInstancesForWorkouts:]((uint64_t)v205, (uint64_t)v59);
          }

          double v155 = [(ACHWorkoutEvaluationEnvironment *)v59 workout];
          [v155 bestWheelchairMarathonDuration];
          v169->_double bestWheelchairMarathonDuration = v156;
        }
        os_unfair_lock_unlock(lock);

        uint64_t v14 = v182 + 1;
      }
      while (v182 + 1 != v173);
      uint64_t v173 = [obj countByEnumeratingWithState:&v200 objects:v221 count:16];
    }
    while (v173);
  }

  v163 = [MEMORY[0x263EFFA08] setWithSet:v5];

  return v163;
}

uint64_t __63__ACHWorkoutAwardingSource__daemon_earnedInstancesForWorkouts___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handlesTemplate:a2];
}

- (BOOL)_isMetricLocale
{
  uint64_t v3 = [(ACHWorkoutAwardingSource *)self injectedIsMetricLocale];
  if (v3)
  {
    id v4 = [(ACHWorkoutAwardingSource *)self injectedIsMetricLocale];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    id v4 = [MEMORY[0x263EFF960] currentLocale];
    char v5 = [v4 usesMetricSystem];
  }
  BOOL v6 = v5;

  return v6;
}

- (id)watchCountryCode
{
  uint64_t v3 = [(ACHWorkoutAwardingSource *)self watchCountryCodeOverride];

  if (v3) {
    [(ACHWorkoutAwardingSource *)self watchCountryCodeOverride];
  }
  else {
  id v4 = ACHPairedWatchCountryCode();
  }
  return v4;
}

- (void)_injectIsMetricLocale:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(ACHWorkoutAwardingSource *)self setInjectedIsMetricLocale:v4];
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

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
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

- (ACHDataStore)dataStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataStore);
  return (ACHDataStore *)WeakRetained;
}

- (void)setDataStore:(id)a3
{
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

- (void)setWorkoutClient:(id)a3
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

- (HKAnchoredObjectQuery)workoutQuery
{
  return self->_workoutQuery;
}

- (void)setWorkoutQuery:(id)a3
{
}

- (void)setInternalQueue:(id)a3
{
}

- (NSNumber)overrideIsAppleWatch
{
  return self->_overrideIsAppleWatch;
}

- (void)setOverrideIsAppleWatch:(id)a3
{
}

- (double)bestElevationGainedHiking
{
  return self->_bestElevationGainedHiking;
}

- (void)setBestElevationGainedHiking:(double)a3
{
  self->_double bestElevationGainedHiking = a3;
}

- (double)best5KDuration
{
  return self->_best5KDuration;
}

- (void)setBest5KDuration:(double)a3
{
  self->_double best5KDuration = a3;
}

- (double)best10KDuration
{
  return self->_best10KDuration;
}

- (void)setBest10KDuration:(double)a3
{
  self->_double best10KDuration = a3;
}

- (double)bestWheelchair5KDuration
{
  return self->_bestWheelchair5KDuration;
}

- (void)setBestWheelchair5KDuration:(double)a3
{
  self->_double bestWheelchair5KDuration = a3;
}

- (double)bestWheelchair10KDuration
{
  return self->_bestWheelchair10KDuration;
}

- (void)setBestWheelchair10KDuration:(double)a3
{
  self->_double bestWheelchair10KDuration = a3;
}

- (double)bestHalfMarathonDuration
{
  return self->_bestHalfMarathonDuration;
}

- (void)setBestHalfMarathonDuration:(double)a3
{
  self->_double bestHalfMarathonDuration = a3;
}

- (double)bestMarathonDuration
{
  return self->_bestMarathonDuration;
}

- (void)setBestMarathonDuration:(double)a3
{
  self->_double bestMarathonDuration = a3;
}

- (double)bestWheelchairHalfMarathonDuration
{
  return self->_bestWheelchairHalfMarathonDuration;
}

- (void)setBestWheelchairHalfMarathonDuration:(double)a3
{
  self->_double bestWheelchairHalfMarathonDuration = a3;
}

- (double)bestWheelchairMarathonDuration
{
  return self->_bestWheelchairMarathonDuration;
}

- (void)setBestWheelchairMarathonDuration:(double)a3
{
  self->_double bestWheelchairMarathonDuration = a3;
}

- (int)protectedDataToken
{
  return self->_protectedDataToken;
}

- (void)setProtectedDataToken:(int)a3
{
  self->_protectedDataToken = a3;
}

- (id)initialResultsHandler
{
  return self->_initialResultsHandler;
}

- (void)setInitialResultsHandler:(id)a3
{
}

- (void)setCurrentDateOverride:(id)a3
{
}

- (NSString)watchCountryCodeOverride
{
  return self->_watchCountryCodeOverride;
}

- (void)setWatchCountryCodeOverride:(id)a3
{
}

- (NSNumber)injectedIsMetricLocale
{
  return self->_injectedIsMetricLocale;
}

- (void)setInjectedIsMetricLocale:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_injectedIsMetricLocale, 0);
  objc_storeStrong((id *)&self->_watchCountryCodeOverride, 0);
  objc_storeStrong((id *)&self->_currentDateOverride, 0);
  objc_storeStrong(&self->_initialResultsHandler, 0);
  objc_storeStrong((id *)&self->_overrideIsAppleWatch, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_workoutQuery, 0);
  objc_destroyWeak((id *)&self->_workoutUtility);
  objc_destroyWeak((id *)&self->_workoutClient);
  objc_destroyWeak((id *)&self->_templateStore);
  objc_destroyWeak((id *)&self->_progressEngine);
  objc_destroyWeak((id *)&self->_dataStore);
  objc_destroyWeak((id *)&self->_engine);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_destroyWeak((id *)&self->_client);
}

void __77__ACHWorkoutAwardingSource__lock_startWorkoutQueryWithInitialResultsHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error starting workout query: %@", v2, v3, v4, v5, v6);
}

void __77__ACHWorkoutAwardingSource__lock_startWorkoutQueryWithInitialResultsHandler___block_invoke_316_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error from workouts query update: %@", v2, v3, v4, v5, v6);
}

- (void)earnedInstancesForHistoricalInterval:error:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_21F5DA000, v1, OS_LOG_TYPE_ERROR, "Error performing historical run for workouts in date interval %{public}@: %{public}@", v2, 0x16u);
}

- (void)earnedInstancesForHistoricalInterval:databaseContext:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "WorkoutAwardingSource error in database transaction: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_progressEnvironment
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error counting workouts in fitness week: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "WorkoutAwardingSource failed to get date of birth with error %@, defaulting to FIExperienceTypeSimplified", v2, v3, v4, v5, v6);
}

- (void)_client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error getting best workout distance: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error getting best workout energy: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error counting first party workouts in fitness week: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_client_appendEarnedInstancesForWorkout:toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error counting first party workouts: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_client_appendEarnedInstancesForWorkout:(NSObject *)a3 toSet:templates:calendar:numberOfDaysInWeek:predicates:firstDayOfFitnessWeek:watchCountryCode:.cold.6(void *a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 count];
  uint64_t v7 = [a2 endDate];
  id v8 = [a1 valueForKey:@"uniqueName"];
  int v9 = 134218498;
  uint64_t v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = v7;
  __int16 v13 = 2114;
  id v14 = v8;
  _os_log_debug_impl(&dword_21F5DA000, a3, OS_LOG_TYPE_DEBUG, "Found %lu templates for date %{public}@: %{public}@", (uint8_t *)&v9, 0x20u);
}

- (void)_daemon_earnedInstancesForWorkouts:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "workout");
  [v2 bestWheelchairMarathonDuration];
  OUTLINED_FUNCTION_4_1(v3, 3.852e-34);
  OUTLINED_FUNCTION_0_3(&dword_21F5DA000, v4, v5, "Updated best Wheelchair Marathon duration to %lf");
}

- (void)_daemon_earnedInstancesForWorkouts:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "workout");
  [v2 bestWheelchairHalfMarathonDuration];
  OUTLINED_FUNCTION_4_1(v3, 3.852e-34);
  OUTLINED_FUNCTION_0_3(&dword_21F5DA000, v4, v5, "Updated best Wheelchair Half Marathon duration to %lf");
}

- (void)_daemon_earnedInstancesForWorkouts:(uint64_t)a1 .cold.3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "workout");
  [v2 bestMarathonDuration];
  OUTLINED_FUNCTION_4_1(v3, 3.852e-34);
  OUTLINED_FUNCTION_0_3(&dword_21F5DA000, v4, v5, "Updated best Marathon duration to %lf");
}

- (void)_daemon_earnedInstancesForWorkouts:(uint64_t)a1 .cold.4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "workout");
  [v2 bestHalfMarathonDuration];
  OUTLINED_FUNCTION_4_1(v3, 3.852e-34);
  OUTLINED_FUNCTION_0_3(&dword_21F5DA000, v4, v5, "Updated best Half Marathon duration to %lf");
}

- (void)_daemon_earnedInstancesForWorkouts:(uint64_t)a1 .cold.5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "workout");
  [v2 bestWheelchair10KDuration];
  OUTLINED_FUNCTION_4_1(v3, 3.852e-34);
  OUTLINED_FUNCTION_0_3(&dword_21F5DA000, v4, v5, "Updated best Wheelchair 10K duration to %lf");
}

- (void)_daemon_earnedInstancesForWorkouts:(uint64_t)a1 .cold.6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "workout");
  [v2 bestWheelchair5KDuration];
  OUTLINED_FUNCTION_4_1(v3, 3.852e-34);
  OUTLINED_FUNCTION_0_3(&dword_21F5DA000, v4, v5, "Updated best Wheelchair 5K duration to %lf");
}

- (void)_daemon_earnedInstancesForWorkouts:(uint64_t)a1 .cold.7(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "workout");
  [v2 best10KDuration];
  OUTLINED_FUNCTION_4_1(v3, 3.852e-34);
  OUTLINED_FUNCTION_0_3(&dword_21F5DA000, v4, v5, "Updated best 10K duration to %lf");
}

- (void)_daemon_earnedInstancesForWorkouts:(uint64_t)a1 .cold.8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "workout");
  [v2 best5KDuration];
  OUTLINED_FUNCTION_4_1(v3, 3.852e-34);
  OUTLINED_FUNCTION_0_3(&dword_21F5DA000, v4, v5, "Updated best 5K duration to %lf");
}

- (void)_daemon_earnedInstancesForWorkouts:(uint64_t)a1 .cold.9(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "workout");
  [v2 elevationGained];
  OUTLINED_FUNCTION_4_1(v3, 3.852e-34);
  OUTLINED_FUNCTION_0_3(&dword_21F5DA000, v4, v5, "Updated best elevation gain to %lf");
}

@end