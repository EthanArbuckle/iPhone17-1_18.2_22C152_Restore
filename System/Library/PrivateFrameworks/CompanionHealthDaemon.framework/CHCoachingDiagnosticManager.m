@interface CHCoachingDiagnosticManager
- (BOOL)_queue_performRingCompletionDiagnostics;
- (BOOL)periodicActivityRequiresProtectedData:(id)a3;
- (CHCoachingDiagnosticManager)initWithProfile:(id)a3;
- (id)_queue_lastSubmittedDate;
- (id)diagnosticDescription;
- (int64_t)_queue_lastRingCompletionSubmittedIndex;
- (void)_queue_lastRingCompletionSubmittedIndex;
- (void)_queue_lastSubmittedDate;
- (void)_queue_performRingCompletionDiagnostics;
- (void)_queue_setLastRingCompletionSubmittedIndex:(int64_t)a3;
- (void)_queue_setLastSubmittedDate:(id)a3;
- (void)dealloc;
- (void)performPeriodicActivity:(id)a3 completion:(id)a4;
- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
@end

@implementation CHCoachingDiagnosticManager

- (CHCoachingDiagnosticManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHCoachingDiagnosticManager;
  v5 = [(CHCoachingDiagnosticManager *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialUtilityDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = [MEMORY[0x263F43498] sharedDiagnosticManager];
    [v9 addObject:v6];

    [v4 registerProfileReadyObserver:v6 queue:v6->_queue];
  }

  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F43498] sharedDiagnosticManager];
  [v3 removeObject:self];

  v4.receiver = self;
  v4.super_class = (Class)CHCoachingDiagnosticManager;
  [(CHCoachingDiagnosticManager *)&v4 dealloc];
}

- (void)profileDidBecomeReady:(id)a3
{
  objc_super v4 = (objc_class *)MEMORY[0x263F432C8];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = (HDPeriodicActivity *)[v6 initWithProfile:v5 name:@"com.apple.healthd.coaching-diagnostic" interval:self delegate:*MEMORY[0x263F098D8] loggingCategory:(double)(uint64_t)*MEMORY[0x263EF8220]];

  scheduler = self->_scheduler;
  self->_scheduler = v7;
}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  objc_super v4 = (const char *)*MEMORY[0x263EF8180];
  xpc_object_t xdict = a4;
  xpc_dictionary_set_BOOL(xdict, v4, 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8288]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x263EF82A8], 1);
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__CHCoachingDiagnosticManager_performPeriodicActivity_completion___block_invoke;
  v8[3] = &unk_26471FDA0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __66__CHCoachingDiagnosticManager_performPeriodicActivity_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_performRingCompletionDiagnostics") ^ 1;
  v3 = *(uint64_t (**)(uint64_t, uint64_t, void, __n128))(*(void *)(a1 + 40) + 16);
  v4.n128_u64[0] = 0;
  uint64_t v5 = *(void *)(a1 + 40);

  return v3(v5, v2, 0, v4);
}

- (BOOL)periodicActivityRequiresProtectedData:(id)a3
{
  return 1;
}

- (BOOL)_queue_performRingCompletionDiagnostics
{
  if (!FIIsFitnessTrackingEnabled()) {
    return 1;
  }
  v3 = [MEMORY[0x263F0A980] sharedBehavior];
  int v4 = [v3 isStandalonePhoneFitnessMode];

  if (!v4) {
    return 1;
  }
  uint64_t v5 = activitySummaryIndexForReporting();
  int64_t v6 = [(CHCoachingDiagnosticManager *)self _queue_lastRingCompletionSubmittedIndex];
  _HKInitializeLogging();
  BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_DEBUG);
  if (v5 == v6)
  {
    if (v7) {
      -[CHCoachingDiagnosticManager _queue_performRingCompletionDiagnostics]();
    }
    return 1;
  }
  if (v7) {
    -[CHCoachingDiagnosticManager _queue_performRingCompletionDiagnostics]();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_super v11 = FIActivitySummaryAnalyticsPayloadForProfileAndSummaryCacheIndex();

  BOOL v8 = v11 != 0;
  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t HasCompletedWorkoutWithProfile = FIActivitySummaryAnalyticsHasCompletedWorkoutWithProfile();

    v14 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v11];
    v15 = [NSNumber numberWithBool:HasCompletedWorkoutWithProfile];
    [v14 setObject:v15 forKey:@"hasCompletedWorkout"];

    FIActivityAnalyticsSubmissionWithPayload();
    [(CHCoachingDiagnosticManager *)self _queue_setLastRingCompletionSubmittedIndex:v5];
    v16 = [MEMORY[0x263EFF910] date];
    [(CHCoachingDiagnosticManager *)self _queue_setLastSubmittedDate:v16];
  }
  return v8;
}

- (int64_t)_queue_lastRingCompletionSubmittedIndex
{
  int64_t result = self->_lastRingCompletionSubmittedIndex;
  if (!result)
  {
    int v4 = (void *)MEMORY[0x263F432E0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v8 = 0;
    int64_t v6 = [v4 numberForKey:@"CHCoachingDiagnosticLastRingCompletionSubmittedIndexKey" domain:@"com.apple.healthd.coaching-diagnostic" category:100 profile:WeakRetained entity:0 error:&v8];
    id v7 = v8;
    self->_lastRingCompletionSubmittedIndex = [v6 longLongValue];

    if (!self->_lastRingCompletionSubmittedIndex && v7)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_ERROR)) {
        -[CHCoachingDiagnosticManager _queue_lastRingCompletionSubmittedIndex]();
      }
    }

    return self->_lastRingCompletionSubmittedIndex;
  }
  return result;
}

- (void)_queue_setLastRingCompletionSubmittedIndex:(int64_t)a3
{
  self->_lastRingCompletionSubmittedIndex = a3;
  int v4 = (void *)MEMORY[0x263F432E0];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithLongLong:");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = 0;
  LOBYTE(v4) = [v4 setNumber:v5 forKey:@"CHCoachingDiagnosticLastRingCompletionSubmittedIndexKey" domain:@"com.apple.healthd.coaching-diagnostic" category:100 profile:WeakRetained error:&v8];
  id v7 = v8;

  if ((v4 & 1) == 0)
  {
    if (v7)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_ERROR)) {
        -[CHCoachingDiagnosticManager _queue_setLastRingCompletionSubmittedIndex:]();
      }
    }
  }
}

- (id)_queue_lastSubmittedDate
{
  cachedLastSubmittedDate = self->_cachedLastSubmittedDate;
  if (!cachedLastSubmittedDate)
  {
    int v4 = (void *)MEMORY[0x263F432E0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v11 = 0;
    int64_t v6 = [v4 dateForKey:@"HDCoachingDiagnosticLastSubmittedDateKey" domain:@"com.apple.healthd.coaching-diagnostic" category:100 profile:WeakRetained entity:0 error:&v11];
    id v7 = v11;
    id v8 = self->_cachedLastSubmittedDate;
    self->_cachedLastSubmittedDate = v6;

    if (!self->_cachedLastSubmittedDate)
    {
      if (v7)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_ERROR)) {
          -[CHCoachingDiagnosticManager _queue_lastSubmittedDate]();
        }
      }
    }

    cachedLastSubmittedDate = self->_cachedLastSubmittedDate;
  }
  id v9 = cachedLastSubmittedDate;

  return v9;
}

- (void)_queue_setLastSubmittedDate:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_cachedLastSubmittedDate, a3);
  int64_t v6 = (void *)MEMORY[0x263F432E0];
  cachedLastSubmittedDate = self->_cachedLastSubmittedDate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v10 = 0;
  LOBYTE(cachedLastSubmittedDate) = [v6 setDate:cachedLastSubmittedDate forKey:@"HDCoachingDiagnosticLastSubmittedDateKey" domain:@"com.apple.healthd.coaching-diagnostic" category:100 profile:WeakRetained error:&v10];
  id v9 = v10;

  if ((cachedLastSubmittedDate & 1) == 0)
  {
    if (v9)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D8], OS_LOG_TYPE_ERROR)) {
        -[CHCoachingDiagnosticManager _queue_setLastRingCompletionSubmittedIndex:]();
      }
    }
  }
}

- (id)diagnosticDescription
{
  v3 = [(HDPeriodicActivity *)self->_scheduler lastSuccessfulRunDate];
  int v4 = [(HDPeriodicActivity *)self->_scheduler isWaitingToRun];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__CHCoachingDiagnosticManager_diagnosticDescription__block_invoke;
  block[3] = &unk_26471FDC8;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(queue, block);
  id v6 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v7 = MEMORY[0x22A62F650](v3);
  [v6 appendFormat:@"\n\tLast run: %@", v7];

  [v6 appendFormat:@"\n\tLast submitted date: %@", v12[5]];
  id v8 = @"Not waiting to run";
  if (v4) {
    id v8 = @"Waiting for next unlock to run";
  }
  [v6 appendFormat:@"\n\t%@", v8];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __52__CHCoachingDiagnosticManager_diagnosticDescription__block_invoke(uint64_t a1)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedLastSubmittedDate, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_profile);
}

- (void)_queue_performRingCompletionDiagnostics
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_225615000, v0, OS_LOG_TYPE_DEBUG, "Submitting activity summary index %ld", v1, 0xCu);
}

- (void)_queue_lastRingCompletionSubmittedIndex
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_225615000, v0, v1, "Could not read last ring completion submitted index: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_queue_setLastRingCompletionSubmittedIndex:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_225615000, v0, v1, "Could not write last submitted date: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_queue_lastSubmittedDate
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_225615000, v0, v1, "Could not read last submitted date: %{public}@", v2, v3, v4, v5, v6);
}

@end