@interface ATXAnchorModelPredictionScheduler
- (ATXAnchorModelPredictionScheduler)init;
- (ATXAnchorModelPredictionScheduler)initWithPredictionForwarder:(id)a3 hyperParameters:(id)a4 tracker:(id)a5 now:(id)a6 maxPredictions:(unint64_t)a7;
- (BOOL)dateIsInFuture:(id)a3 now:(id)a4;
- (id)_cache;
- (id)_readPredictionsFromCache;
- (id)criteriaForJobOnDate:(id)a3;
- (id)dateOfSoonestUpcomingPredictionChange;
- (id)deduplicatedPredictions:(id)a3;
- (id)earlierDateInFuture:(id)a3 earliestDateSoFar:(id)a4 now:(id)a5;
- (id)now;
- (id)predictions;
- (id)predictionsAfterFilteringInactiveAnchors:(id)a3;
- (id)predictionsValidNow;
- (id)predictionsWithTimeIntervalOverlappingWithCurrentTime;
- (void)clearPredictionsForAnchor:(id)a3;
- (void)forwardPredictionUpdates;
- (void)forwardPredictionUpdatesOnDate:(id)a3;
- (void)initializeLock;
- (void)logPredictionsGeneratedMetricsWithAnchorModelPredictions:(id)a3;
- (void)persistPredictions:(id)a3 anchor:(id)a4;
- (void)registerXPCActivityForPredictionUpdateWithCriteria:(id)a3;
- (void)scheduleNextPredictionUpdate;
- (void)schedulePredictions:(id)a3 anchor:(id)a4;
@end

@implementation ATXAnchorModelPredictionScheduler

- (ATXAnchorModelPredictionScheduler)init
{
  v3 = objc_opt_new();
  v4 = +[ATXAnchorModelHyperParameters sharedInstance];
  v5 = objc_opt_new();
  v6 = [(ATXAnchorModelPredictionScheduler *)self initWithPredictionForwarder:v3 hyperParameters:v4 tracker:v5 now:0 maxPredictions:45];

  return v6;
}

- (ATXAnchorModelPredictionScheduler)initWithPredictionForwarder:(id)a3 hyperParameters:(id)a4 tracker:(id)a5 now:(id)a6 maxPredictions:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v23.receiver = self;
  v23.super_class = (Class)ATXAnchorModelPredictionScheduler;
  v17 = [(ATXAnchorModelPredictionScheduler *)&v23 init];
  v18 = v17;
  if (v17)
  {
    [(ATXAnchorModelPredictionScheduler *)v17 initializeLock];
    objc_storeStrong((id *)&v18->_predictionForwarder, a3);
    objc_storeStrong((id *)&v18->_hyperParameters, a4);
    objc_storeStrong((id *)&v18->_tracker, a5);
    objc_storeStrong((id *)&v18->_now, a6);
    v18->_maxPredictions = a7;
    id v19 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v20 = [v19 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    defaults = v18->_defaults;
    v18->_defaults = (NSUserDefaults *)v20;
  }
  return v18;
}

- (void)initializeLock
{
  id v5 = (id)objc_opt_new();
  v3 = (_PASLock *)[objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v5];
  schedulerLock = self->_schedulerLock;
  self->_schedulerLock = v3;
}

- (id)now
{
  now = self->_now;
  if (now) {
    v3 = now;
  }
  else {
    v3 = (NSDate *)objc_opt_new();
  }
  return v3;
}

- (void)clearPredictionsForAnchor:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Scheduler clearing predictions for anchor %@.", (uint8_t *)&v6, 0xCu);
  }

  [(ATXAnchorModelPredictionScheduler *)self schedulePredictions:MEMORY[0x1E4F1CBF0] anchor:v4];
}

- (void)schedulePredictions:(id)a3 anchor:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", buf, 2u);
  }

  v9 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v6 count];
    *(_DWORD *)buf = 134218242;
    uint64_t v38 = v10;
    __int16 v39 = 2112;
    id v40 = v7;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Scheduler received %lu predictions for anchor %@. Predictions:", buf, 0x16u);
  }

  v11 = (void *)[v6 mutableCopy];
  v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:0];
  v36 = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  [v11 sortUsingDescriptors:v13];

  id v14 = v11;
  id v15 = v14;
  if ([v14 count] > self->_maxPredictions)
  {
    id v15 = [v14 subarrayWithRange:0];

    id v16 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v15 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v38 = v17;
      _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "Scheduler clipping anchor model predictions to the top scoring %lu predictions.", buf, 0xCu);
    }
  }
  v28 = v14;
  v29 = v7;
  v30 = self;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v18 = v15;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        v24 = (void *)MEMORY[0x1D25F6CC0]();
        v25 = __atxlog_handle_anchor();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v38 = v23;
          _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v20);
  }

  v26 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_DEFAULT, "Scheduling...", buf, 2u);
  }

  v27 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v27, OS_LOG_TYPE_DEFAULT, "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", buf, 2u);
  }

  [(ATXAnchorModelPredictionScheduler *)v30 persistPredictions:v18 anchor:v29];
  [(ATXAnchorModelPredictionScheduler *)v30 forwardPredictionUpdates];
  [(ATXAnchorModelPredictionScheduler *)v30 logPredictionsGeneratedMetricsWithAnchorModelPredictions:v18];
}

- (void)persistPredictions:(id)a3 anchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D25F6CC0]();
  schedulerLock = self->_schedulerLock;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__ATXAnchorModelPredictionScheduler_persistPredictions_anchor___block_invoke;
  v12[3] = &unk_1E68ACF48;
  v12[4] = self;
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [(_PASLock *)schedulerLock runWithLockAcquired:v12];
}

void __63__ATXAnchorModelPredictionScheduler_persistPredictions_anchor___block_invoke(id *a1)
{
  id v6 = [a1[4] _readPredictionsFromCache];
  v2 = (void *)[a1[5] copy];
  v3 = [a1[6] anchorTypeString];
  [v6 setObject:v2 forKey:v3];

  id v4 = [a1[4] _cache];
  id v5 = (void *)[v6 copy];
  [v4 storeSecureCodedObject:v5 error:0];
}

- (id)_cache
{
  v2 = [MEMORY[0x1E4F4B650] appPredictionCacheDirectory];
  v3 = [v2 stringByAppendingPathComponent:@"anchorModelSchedulerCurrentPredictions"];

  id v4 = objc_alloc(MEMORY[0x1E4F4B638]);
  id v5 = __atxlog_handle_anchor();
  id v6 = (void *)[v4 initWithCacheFilePath:v3 loggingHandle:v5 debugName:@"cached anchor model predictions"];

  return v6;
}

- (void)scheduleNextPredictionUpdate
{
  id v3 = [(ATXAnchorModelPredictionScheduler *)self dateOfSoonestUpcomingPredictionChange];
  [(ATXAnchorModelPredictionScheduler *)self forwardPredictionUpdatesOnDate:v3];
}

- (id)dateOfSoonestUpcomingPredictionChange
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(ATXAnchorModelPredictionScheduler *)self predictions];
  uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v18 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v18) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v8 = (void *)MEMORY[0x1D25F6CC0]();
        v9 = [v7 dateIntervalForPrediction];
        id v10 = [v9 startDate];
        id v11 = [(ATXAnchorModelPredictionScheduler *)self now];
        v12 = [(ATXAnchorModelPredictionScheduler *)self earlierDateInFuture:v10 earliestDateSoFar:v3 now:v11];

        id v13 = [v7 dateIntervalForPrediction];
        id v14 = [v13 endDate];
        id v15 = [(ATXAnchorModelPredictionScheduler *)self now];
        id v3 = [(ATXAnchorModelPredictionScheduler *)self earlierDateInFuture:v14 earliestDateSoFar:v12 now:v15];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)earlierDateInFuture:(id)a3 earliestDateSoFar:(id)a4 now:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(ATXAnchorModelPredictionScheduler *)self dateIsInFuture:v8 now:a5];
  id v11 = v9;
  if (v10)
  {
    id v12 = [v9 earlierDate:v8];

    if (v12 == v9) {
      id v11 = v9;
    }
    else {
      id v11 = v8;
    }
  }
  id v13 = v11;

  return v13;
}

- (BOOL)dateIsInFuture:(id)a3 now:(id)a4
{
  id v5 = a4;
  id v6 = [v5 earlierDate:a3];

  return v6 == v5;
}

- (id)predictions
{
  id v3 = objc_opt_new();
  schedulerLock = self->_schedulerLock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__ATXAnchorModelPredictionScheduler_predictions__block_invoke;
  v9[3] = &unk_1E68ACF70;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [(_PASLock *)schedulerLock runWithLockAcquired:v9];
  id v6 = v10;
  id v7 = v5;

  return v7;
}

void __48__ATXAnchorModelPredictionScheduler_predictions__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _readPredictionsFromCache];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(v2, "allValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 40) addObjectsFromArray:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)_readPredictionsFromCache
{
  v2 = [(ATXAnchorModelPredictionScheduler *)self _cache];
  id v3 = (void *)MEMORY[0x1D25F6CC0]();
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  long long v8 = objc_msgSend(v4, "initWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  long long v9 = [v2 readSecureCodedObjectWithMaxValidAge:v8 allowableClasses:0 error:-1.0];
  long long v10 = (void *)[v9 mutableCopy];
  long long v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)objc_opt_new();
  }
  uint64_t v13 = v12;

  return v13;
}

- (void)forwardPredictionUpdatesOnDate:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ATXAnchorModelPredictionScheduler *)self now];
  BOOL v6 = [(ATXAnchorModelPredictionScheduler *)self dateIsInFuture:v4 now:v5];

  if (v6)
  {
    uint64_t v7 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_INFO, "Scheduler scheduling next update on %@", (uint8_t *)&v9, 0xCu);
    }

    long long v8 = [(ATXAnchorModelPredictionScheduler *)self criteriaForJobOnDate:v4];
    [(ATXAnchorModelPredictionScheduler *)self registerXPCActivityForPredictionUpdateWithCriteria:v8];
  }
  else
  {
    [(ATXAnchorModelPredictionScheduler *)self forwardPredictionUpdates];
  }
}

- (void)registerXPCActivityForPredictionUpdateWithCriteria:(id)a3
{
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __88__ATXAnchorModelPredictionScheduler_registerXPCActivityForPredictionUpdateWithCriteria___block_invoke;
  handler[3] = &unk_1E68ACF98;
  handler[4] = self;
  xpc_activity_register("com.apple.duetexpertd.anchor-model-prediction-scheduler", a3, handler);
}

void __88__ATXAnchorModelPredictionScheduler_registerXPCActivityForPredictionUpdateWithCriteria___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state(v3) == 2 && ([MEMORY[0x1E4F93B10] isClassCLocked] & 1) == 0)
  {
    id v4 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "Forwarding Anchor Model prediction updates due to scheduled update.", v6, 2u);
    }

    uint64_t v5 = (void *)MEMORY[0x1D25F6CC0]();
    [*(id *)(a1 + 32) forwardPredictionUpdates];
  }
}

- (id)criteriaForJobOnDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATXAnchorModelPredictionScheduler *)self now];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v8, (const char *)*MEMORY[0x1E4F14170], (uint64_t)v7);
  xpc_dictionary_set_int64(v8, (const char *)*MEMORY[0x1E4F141A8], 60);
  xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E4F14320], 1);
  xpc_dictionary_set_string(v8, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E4F142F8], 0);
  return v8;
}

- (void)forwardPredictionUpdates
{
  id v3 = [(ATXAnchorModelPredictionScheduler *)self predictionsValidNow];
  [(ATXAnchorModelPredictionForwarderProtocol *)self->_predictionForwarder forwardPredictions:v3];
  id v4 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "Scheduler forwarded predictions.", v5, 2u);
  }

  [(ATXAnchorModelPredictionScheduler *)self scheduleNextPredictionUpdate];
}

- (id)predictionsValidNow
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(ATXAnchorModelPredictionScheduler *)self predictionsWithTimeIntervalOverlappingWithCurrentTime];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(ATXAnchorModelPredictionScheduler *)self predictionsAfterFilteringInactiveAnchors:v4];
  double v6 = (void *)[v5 mutableCopy];

  double v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:0];
  v11[0] = v7;
  xpc_object_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v6 sortUsingDescriptors:v8];

  int v9 = [(ATXAnchorModelPredictionScheduler *)self deduplicatedPredictions:v6];

  return v9;
}

- (id)predictionsWithTimeIntervalOverlappingWithCurrentTime
{
  id v3 = [(ATXAnchorModelPredictionScheduler *)self predictions];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90__ATXAnchorModelPredictionScheduler_predictionsWithTimeIntervalOverlappingWithCurrentTime__block_invoke;
  v6[3] = &unk_1E68ACFC0;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "_pas_filteredArrayWithTest:", v6);

  return v4;
}

uint64_t __90__ATXAnchorModelPredictionScheduler_predictionsWithTimeIntervalOverlappingWithCurrentTime__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v5 = [v3 dateIntervalForPrediction];
  double v6 = [*(id *)(a1 + 32) now];
  uint64_t v7 = [v5 containsDate:v6];

  return v7;
}

- (id)predictionsAfterFilteringInactiveAnchors:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__ATXAnchorModelPredictionScheduler_predictionsAfterFilteringInactiveAnchors___block_invoke;
  v5[3] = &unk_1E68ACFC0;
  v5[4] = self;
  id v3 = objc_msgSend(a3, "_pas_filteredArrayWithTest:", v5);
  return v3;
}

uint64_t __78__ATXAnchorModelPredictionScheduler_predictionsAfterFilteringInactiveAnchors___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 anchorType];
  +[ATXAnchor anchorClassFromAnchorTypeString:v4];
  uint64_t v5 = objc_opt_new();

  uint64_t v6 = [(id)objc_opt_class() isActive];
  if ((v6 & 1) == 0)
  {
    uint64_t v7 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "Filtering out Anchor Model prediction because the anchor is no longer active. Prediction %@", (uint8_t *)&v9, 0xCu);
    }

    [*(id *)(a1 + 32) clearPredictionsForAnchor:v5];
  }

  return v6;
}

- (id)deduplicatedPredictions:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = objc_opt_new();
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __61__ATXAnchorModelPredictionScheduler_deduplicatedPredictions___block_invoke;
  uint64_t v13 = &unk_1E68ACFE8;
  id v14 = v4;
  id v15 = v5;
  id v6 = v5;
  id v7 = v4;
  [v3 enumerateObjectsUsingBlock:&v10];
  xpc_object_t v8 = objc_msgSend(v3, "objectsAtIndexes:", v6, v10, v11, v12, v13);

  return v8;
}

void __61__ATXAnchorModelPredictionScheduler_deduplicatedPredictions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v10 = v5;
  id v7 = [v5 candidateId];
  LOBYTE(v6) = [v6 containsObject:v7];

  if ((v6 & 1) == 0)
  {
    [*(id *)(a1 + 40) addIndex:a3];
    xpc_object_t v8 = *(void **)(a1 + 32);
    int v9 = [v10 candidateId];
    [v8 addObject:v9];
  }
}

- (void)logPredictionsGeneratedMetricsWithAnchorModelPredictions:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v47 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    id v25 = v4;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v29 + 1) + 8 * v8);
        id v10 = objc_opt_new();
        uint64_t v11 = [v9 anchorType];
        [v10 setAnchorType:v11];

        [v9 score];
        objc_msgSend(v10, "setScore:");
        id v12 = [v9 candidateType];
        [v10 setCandidateType:v12];

        uint64_t v13 = [v9 offsetFromAnchorToShowPrediction];
        [v13 startSecondsAfterAnchor];
        [v10 setSecondsAfterAnchorStart:(int)v14];

        id v15 = [v9 offsetFromAnchorToShowPrediction];
        [v15 endSecondsAfterAnchor];
        [v10 setSecondsAfterAnchorEnd:(int)v16];

        uint64_t v17 = [(ATXAnchorModelHyperParameters *)self->_hyperParameters abGroup];
        [v10 setAbGroup:v17];

        [(ATXPETEventTracker2Protocol *)self->_tracker logMessage:v10];
        uint64_t v18 = __atxlog_handle_metrics();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          long long v19 = (objc_class *)objc_opt_class();
          v28 = NSStringFromClass(v19);
          long long v20 = [v10 anchorType];
          long long v21 = [v10 candidateType];
          [v10 score];
          uint64_t v23 = v22;
          int v27 = [v10 secondsAfterAnchorStart];
          int v26 = [v10 secondsAfterAnchorEnd];
          uint64_t v24 = [v10 abGroup];
          *(_DWORD *)buf = 138413826;
          long long v34 = v28;
          __int16 v35 = 2112;
          v36 = v20;
          __int16 v37 = 2112;
          uint64_t v38 = v21;
          __int16 v39 = 2048;
          uint64_t v40 = v23;
          __int16 v41 = 1024;
          int v42 = v27;
          __int16 v43 = 1024;
          int v44 = v26;
          __int16 v45 = 2112;
          v46 = v24;
          _os_log_debug_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBAnchorModelPredictionsGeneratedTracker with anchorType: %@ candidateType: %@ score: %f secondsAfterAnchorStart: %u secondsAfterAnchorEnd: %u abGroup: %@", buf, 0x40u);

          id v4 = v25;
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v47 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_predictionForwarder, 0);
  objc_storeStrong((id *)&self->_schedulerLock, 0);
}

@end