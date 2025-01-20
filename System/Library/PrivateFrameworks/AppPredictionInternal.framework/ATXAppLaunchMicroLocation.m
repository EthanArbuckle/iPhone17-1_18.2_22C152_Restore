@interface ATXAppLaunchMicroLocation
- (ATXAppLaunchMicroLocation)init;
- (ATXAppLaunchMicroLocation)initWithDuetHelper:(id)a3 combinedIntentStream:(id)a4 directory:(id)a5 forTesting:(BOOL)a6;
- (BOOL)_loadCorrelationMatrices;
- (double)popularityAtCurrentMicroLocationForActionKey:(id)a3;
- (double)popularityAtCurrentMicroLocationForApp:(id)a3;
- (id)_getActionKeyCorrelationMatrix;
- (id)_getAppLaunchCorrelationMatrix;
- (id)_getHistoricalData;
- (void)_loadCorrelationMatrices;
- (void)_receivedNotificationOfNewMicroLocation;
- (void)_subscribeToDKInsertionEvents;
- (void)_writeAppLaunchCorrelationMatrix:(id)a3 actionKeyCorrelationMatrix:(id)a4;
- (void)train;
- (void)tryLoadCorrelationMatricesImmediately;
@end

@implementation ATXAppLaunchMicroLocation

- (ATXAppLaunchMicroLocation)init
{
  v3 = +[_ATXDuetHelper sharedInstance];
  v4 = objc_opt_new();
  v5 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
  v6 = [(ATXAppLaunchMicroLocation *)self initWithDuetHelper:v3 combinedIntentStream:v4 directory:v5 forTesting:0];

  return v6;
}

- (ATXAppLaunchMicroLocation)initWithDuetHelper:(id)a3 combinedIntentStream:(id)a4 directory:(id)a5 forTesting:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v23.receiver = self;
  v23.super_class = (Class)ATXAppLaunchMicroLocation;
  v14 = [(ATXAppLaunchMicroLocation *)&v23 init];
  if (v14)
  {
    uint64_t v15 = [v13 stringByAppendingPathComponent:@"ATXAppPredictionMicroLocation"];
    path = v14->_path;
    v14->_path = (NSString *)v15;

    objc_storeStrong((id *)&v14->_duetHelper, a3);
    objc_storeStrong((id *)&v14->_combinedIntentStream, a4);
    v17 = [ATXAppLaunchMicroLocationGuardedData alloc];
    v18 = [(_ATXDuetHelper *)v14->_duetHelper getMostRecentMicroLocation];
    v19 = [(ATXAppLaunchMicroLocationGuardedData *)v17 initWithCurrentMicroLocation:v18];

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v19];
    lock = v14->_lock;
    v14->_lock = (_PASLock *)v20;

    if (!a6) {
      [(ATXAppLaunchMicroLocation *)v14 _subscribeToDKInsertionEvents];
    }
    [(ATXAppLaunchMicroLocation *)v14 tryLoadCorrelationMatricesImmediately];
  }
  return v14;
}

- (void)_subscribeToDKInsertionEvents
{
  id v6 = [MEMORY[0x1E4F28C40] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4F5B628];
  v4 = [MEMORY[0x1E4F5B5F8] microLocationVisitStream];
  v5 = [v4 name];
  [v6 addObserver:self selector:sel__receivedNotificationOfNewMicroLocation name:v3 object:v5];
}

- (void)_receivedNotificationOfNewMicroLocation
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__ATXAppLaunchMicroLocation__receivedNotificationOfNewMicroLocation__block_invoke;
  v3[3] = &unk_1E68B5F80;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

void __68__ATXAppLaunchMicroLocation__receivedNotificationOfNewMicroLocation__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = a2;
  id v4 = [v2 getMostRecentMicroLocation];
  [v3 setCurrentMicroLocation:v4];
}

- (double)popularityAtCurrentMicroLocationForApp:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    id v13 = (double *)&v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    lock = self->_lock;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__ATXAppLaunchMicroLocation_popularityAtCurrentMicroLocationForApp___block_invoke;
    v9[3] = &unk_1E68B5FA8;
    id v11 = &v12;
    id v10 = v4;
    [(_PASLock *)lock runWithLockAcquired:v9];
    double v7 = v13[3];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

void __68__ATXAppLaunchMicroLocation_popularityAtCurrentMicroLocationForApp___block_invoke(uint64_t a1, void *a2)
{
  v5 = a2;
  id v3 = [v5 getCurrentMicroLocation];
  if (v3) {
    [v5[4] launchProbabilityForEvent:*(void *)(a1 + 32) atLocationsWithProbabilities:v3];
  }
  else {
    uint64_t v4 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
}

- (double)popularityAtCurrentMicroLocationForActionKey:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    id v13 = (double *)&v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    lock = self->_lock;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__ATXAppLaunchMicroLocation_popularityAtCurrentMicroLocationForActionKey___block_invoke;
    v9[3] = &unk_1E68B5FA8;
    id v11 = &v12;
    id v10 = v4;
    [(_PASLock *)lock runWithLockAcquired:v9];
    double v7 = v13[3];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

void __74__ATXAppLaunchMicroLocation_popularityAtCurrentMicroLocationForActionKey___block_invoke(uint64_t a1, void *a2)
{
  v5 = a2;
  id v3 = [v5 getCurrentMicroLocation];
  if (v3) {
    [v5[5] launchProbabilityForEvent:*(void *)(a1 + 32) atLocationsWithProbabilities:v3];
  }
  else {
    uint64_t v4 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
}

- (void)train
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v47 = v5;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "%@ - starting training of micro locations", buf, 0xCu);
  }
  id v6 = __atxlog_handle_default();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  v8 = __atxlog_handle_default();
  v9 = v8;
  unint64_t v36 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 136446210;
    v47 = "ATXAppLaunchMicroLocation";
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Train", "Component=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);
  }
  os_signpost_id_t spid = v7;

  context = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v10 = [(ATXAppLaunchMicroLocation *)self _getHistoricalData];
  id v11 = (void *)v10;
  uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  if (v10) {
    id v13 = (void *)v10;
  }
  else {
    id v13 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v14 = v13;

  uint64_t v15 = objc_opt_new();
  v16 = (void *)MEMORY[0x1D25F6CC0]();
  v17 = [MEMORY[0x1E4F1C9C8] date];
  v18 = [v17 dateByAddingTimeInterval:-2419200.0];
  uint64_t v19 = [(_ATXDuetHelper *)self->_duetHelper getAppLaunchesBetweenStartDate:v18 endDate:v17 batchSize:800];
  uint64_t v20 = (void *)v19;
  if (v19) {
    v21 = (void *)v19;
  }
  else {
    v21 = v12;
  }
  id v22 = v21;

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __34__ATXAppLaunchMicroLocation_train__block_invoke;
  v44[3] = &unk_1E68B5FD0;
  id v23 = v15;
  id v45 = v23;
  +[ATXEvent joinLaunchEvents:v22 withVisits:v14 block:v44];

  v24 = objc_opt_new();
  v25 = (void *)MEMORY[0x1D25F6CC0]();
  v26 = [(ATXCombinedIntentStream *)self->_combinedIntentStream getActivityAndIntentEventsFromLastMonth];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __34__ATXAppLaunchMicroLocation_train__block_invoke_2;
  v41[3] = &unk_1E68B5FF8;
  SEL v43 = a2;
  v41[4] = self;
  id v27 = v24;
  id v42 = v27;
  +[ATXEvent joinLaunchEvents:v26 withVisits:v14 block:v41];

  lock = self->_lock;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __34__ATXAppLaunchMicroLocation_train__block_invoke_3;
  v37[3] = &unk_1E68B6020;
  id v38 = v23;
  id v39 = v27;
  v40 = self;
  id v29 = v27;
  id v30 = v23;
  [(_PASLock *)lock runWithLockAcquired:v37];

  v31 = __atxlog_handle_default();
  v32 = v31;
  if (v36 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_DWORD *)buf = 136446210;
    v47 = "ATXAppLaunchMicroLocation";
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v32, OS_SIGNPOST_INTERVAL_END, spid, "Train", "Component=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);
  }
}

void __34__ATXAppLaunchMicroLocation_train__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a2 bundleId];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  os_signpost_id_t v7 = objc_msgSend(v5, "event", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
        id v13 = [v5 event];
        id v14 = [v13 objectForKeyedSubscript:v12];
        [v14 doubleValue];
        double v16 = v15;

        [*(id *)(a1 + 32) addVisitForLocation:v12 event:v6 value:v16];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

void __34__ATXAppLaunchMicroLocation_train__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"ATXAppLaunchMicroLocation.m" lineNumber:171 description:@"Expected ATXIntentEvent class"];
  }
  os_signpost_id_t v7 = [v5 action];
  uint64_t v8 = [v7 actionKey];

  if (v8)
  {
    id v20 = v5;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = [v6 event];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * v13);
          double v15 = [v6 event];
          double v16 = [v15 objectForKeyedSubscript:v14];
          [v16 doubleValue];
          double v18 = v17;

          [*(id *)(a1 + 40) addVisitForLocation:v14 event:v8 value:v18];
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    id v5 = v20;
  }
}

uint64_t __34__ATXAppLaunchMicroLocation_train__block_invoke_3(uint64_t a1, id *a2)
{
  objc_storeStrong(a2 + 4, *(id *)(a1 + 32));
  uint64_t v4 = a2;
  objc_storeStrong(v4 + 5, *(id *)(a1 + 40));

  uint64_t v6 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  return [v5 _writeAppLaunchCorrelationMatrix:v7 actionKeyCorrelationMatrix:v6];
}

- (void)_writeAppLaunchCorrelationMatrix:(id)a3 actionKeyCorrelationMatrix:(id)a4
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D25F6CC0]();
  v18[0] = @"appLaunchMatrix";
  v18[1] = @"actionKeyMatrix";
  v19[0] = v6;
  v19[1] = v7;
  v18[2] = @"modelVersion";
  v19[2] = &unk_1F27F29E8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  id v17 = 0;
  uint64_t v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v17];
  id v11 = v17;
  if (v10)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_path];
    id v16 = v11;
    char v13 = [v10 writeToURL:v12 options:805306369 error:&v16];
    id v14 = v16;

    if ((v13 & 1) == 0)
    {
      double v15 = __atxlog_handle_default();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ATXAppLaunchMicroLocation _writeAppLaunchCorrelationMatrix:actionKeyCorrelationMatrix:]();
      }
    }
  }
  else
  {
    uint64_t v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXAppLaunchMicroLocation _writeAppLaunchCorrelationMatrix:actionKeyCorrelationMatrix:]();
    }
    id v14 = v11;
  }
}

- (void)tryLoadCorrelationMatricesImmediately
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [MEMORY[0x1E4F93B10] lockState] - 3;
  uint64_t v4 = __atxlog_handle_default();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 > 0xFFFFFFFD)
  {
    if (v5)
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138412290;
      id v14 = v10;
      _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "%@ - loading correlation matrices, detected that device is Class B Locked", buf, 0xCu);
    }
    lock = self->_lock;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__ATXAppLaunchMicroLocation_tryLoadCorrelationMatricesImmediately__block_invoke;
    v12[3] = &unk_1E68B5F80;
    v12[4] = self;
    [(_PASLock *)lock runWithLockAcquired:v12];
  }
  else
  {
    if (v5)
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "%@ - loading correlation matrices, device is NOT Class B Locked", buf, 0xCu);
    }
    uint64_t v8 = (void *)MEMORY[0x1D25F6CC0]();
    [(ATXAppLaunchMicroLocation *)self _loadCorrelationMatrices];
  }
}

void __66__ATXAppLaunchMicroLocation_tryLoadCorrelationMatricesImmediately__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = a2;
  if (v3[1])
  {
    uint64_t v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "%@ - skipping second registration for unlock notification token", buf, 0xCu);
    }
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v7 = (void *)MEMORY[0x1E4F93B10];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__ATXAppLaunchMicroLocation_tryLoadCorrelationMatricesImmediately__block_invoke_70;
    v13[3] = &unk_1E68B0380;
    objc_copyWeak(&v14, &location);
    v13[4] = *(void *)(a1 + 32);
    uint64_t v8 = [v7 registerForLockStateChangeNotifications:v13];
    uint64_t v9 = (void *)v3[1];
    v3[1] = v8;

    uint64_t v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138412290;
      id v17 = v12;
      _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "%@ - started listening for lock state changed notifications", buf, 0xCu);
    }
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __66__ATXAppLaunchMicroLocation_tryLoadCorrelationMatricesImmediately__block_invoke_70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = (void *)*((void *)WeakRetained + 1);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__ATXAppLaunchMicroLocation_tryLoadCorrelationMatricesImmediately__block_invoke_2;
    v6[3] = &unk_1E68B5F80;
    v6[4] = *(void *)(a1 + 32);
    BOOL v5 = (void *)MEMORY[0x1D25F6CC0]([v4 runWithLockAcquired:v6]);
    [v3 _loadCorrelationMatrices];
  }
}

void __66__ATXAppLaunchMicroLocation_tryLoadCorrelationMatricesImmediately__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = (void *)MEMORY[0x1E4F93B10];
  uint64_t v4 = a2[1];
  BOOL v5 = a2;
  [v3 unregisterForLockStateChangeNotifications:v4];
  id v6 = (void *)a2[1];
  a2[1] = 0;

  id v7 = __atxlog_handle_default();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    int v10 = 138412290;
    id v11 = v9;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "%@ - stopped listening for lock state changed notifications", (uint8_t *)&v10, 0xCu);
  }
}

- (BOOL)_loadCorrelationMatrices
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  path = self->_path;
  id v35 = 0;
  BOOL v5 = (void *)[v3 initWithContentsOfFile:path options:0 error:&v35];
  id v6 = v35;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    id v11 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    uint64_t v12 = (void *)MEMORY[0x1D25F6CC0]();
    id v34 = v6;
    char v13 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v11 fromData:v5 error:&v34];
    id v14 = v34;

    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v15 = [v13 objectForKeyedSubscript:@"modelVersion"];
      uint64_t v16 = [v15 integerValue];

      if (v16 == 1)
      {
        lock = self->_lock;
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __53__ATXAppLaunchMicroLocation__loadCorrelationMatrices__block_invoke;
        v32[3] = &unk_1E68B5F80;
        v33 = v13;
        [(_PASLock *)lock runWithLockAcquired:v32];
        uint64_t v18 = __atxlog_handle_default();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          long long v19 = (objc_class *)objc_opt_class();
          id v20 = NSStringFromClass(v19);
          *(_DWORD *)buf = 138412290;
          v37 = v20;
          _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "%@ - successfully loaded correlation matrices", buf, 0xCu);
        }
        BOOL v21 = 1;
        long long v22 = v33;
        goto LABEL_12;
      }
      long long v22 = __atxlog_handle_default();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        [(ATXAppLaunchMicroLocation *)(uint64_t)self _loadCorrelationMatrices];
      }
    }
    else
    {
      long long v23 = __atxlog_handle_default();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v29 = (objc_class *)objc_opt_class();
        id v30 = NSStringFromClass(v29);
        v31 = self->_path;
        *(_DWORD *)buf = 138412802;
        v37 = v30;
        __int16 v38 = 2112;
        id v39 = v31;
        __int16 v40 = 2112;
        id v41 = v14;
        _os_log_error_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_ERROR, "%@ - Error unarchiving model at %@: %@", buf, 0x20u);
      }
      long long v22 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v22 removeItemAtPath:self->_path error:0];
    }
    BOOL v21 = 0;
LABEL_12:

    goto LABEL_16;
  }
  long long v24 = __atxlog_handle_default();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (objc_class *)objc_opt_class();
    uint64_t v26 = NSStringFromClass(v25);
    id v27 = self->_path;
    *(_DWORD *)buf = 138412802;
    v37 = v26;
    __int16 v38 = 2112;
    id v39 = v27;
    __int16 v40 = 2112;
    id v41 = v6;
    _os_log_impl(&dword_1D0FA3000, v24, OS_LOG_TYPE_DEFAULT, "%@ - Could not open model at %@: %@", buf, 0x20u);
  }
  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v11 removeItemAtPath:self->_path error:0];
  BOOL v21 = 0;
  id v14 = v6;
LABEL_16:

  return v21;
}

void __53__ATXAppLaunchMicroLocation__loadCorrelationMatrices__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = a2;
  uint64_t v5 = [v3 objectForKeyedSubscript:@"appLaunchMatrix"];
  id v6 = (void *)v4[4];
  v4[4] = v5;

  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"actionKeyMatrix"];
  id v8 = (id)v4[5];
  v4[5] = v7;
}

- (id)_getHistoricalData
{
  return [(_ATXDuetHelper *)self->_duetHelper getMicroLocationsFromLastMonth];
}

- (id)_getAppLaunchCorrelationMatrix
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__104;
  uint64_t v10 = __Block_byref_object_dispose__104;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__ATXAppLaunchMicroLocation__getAppLaunchCorrelationMatrix__block_invoke;
  v5[3] = &unk_1E68B6048;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __59__ATXAppLaunchMicroLocation__getAppLaunchCorrelationMatrix__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a2 + 32) copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

- (id)_getActionKeyCorrelationMatrix
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__104;
  uint64_t v10 = __Block_byref_object_dispose__104;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__ATXAppLaunchMicroLocation__getActionKeyCorrelationMatrix__block_invoke;
  v5[3] = &unk_1E68B6048;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __59__ATXAppLaunchMicroLocation__getActionKeyCorrelationMatrix__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a2 + 40) copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_combinedIntentStream, 0);
  objc_storeStrong((id *)&self->_duetHelper, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)_writeAppLaunchCorrelationMatrix:actionKeyCorrelationMatrix:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v2, v3, "%@ - Error archiving micro-location correlation matrices: %@", v4, v5, v6, v7, v8);
}

- (void)_writeAppLaunchCorrelationMatrix:actionKeyCorrelationMatrix:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v2, v3, "%@ - Error writing micro-location correlation matrices: %@", v4, v5, v6, v7, v8);
}

- (void)_loadCorrelationMatrices
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  int v7 = 138412802;
  uint8_t v8 = v6;
  __int16 v9 = 1024;
  int v10 = 1;
  __int16 v11 = 1024;
  int v12 = a2;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "%@ - Expected model version %i, got %i", (uint8_t *)&v7, 0x18u);
}

@end