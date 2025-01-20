@interface ATXDailyRoutinesTriggerManager
+ (id)_wakeupDateForExitDate:(id)a3 fromDate:(id)a4;
+ (id)convenienceDateFormatter;
+ (id)sharedInstance;
- (ATXDailyRoutinesTriggerManager)initWithCacheBasedPredictor:(id)a3 transitionPredictor:(id)a4 contextStoreWriter:(id)a5;
- (NSDate)now;
- (id)currentTransition;
- (void)_scheduleOneShotJobAfterInterval:(double)a3;
- (void)setNow:(id)a3;
- (void)updateWithActivity:(id)a3;
@end

@implementation ATXDailyRoutinesTriggerManager

+ (id)convenienceDateFormatter
{
  v2 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  v3 = objc_opt_new();
  [v3 setDateStyle:1];
  [v3 setTimeStyle:1];
  [v3 setTimeZone:v2];

  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_0 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_0, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_0;
  return v2;
}

void __48__ATXDailyRoutinesTriggerManager_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  v1 = [MEMORY[0x1E4F935D0] sharedInstance];
  v2 = [[ATXPredictedTransitionsCache alloc] initWithLocationManager:v1];
  v3 = [[ATXCommutePredictor alloc] initWithTransitionsCache:v2 locationManager:v1];
  v4 = [[ATXTransitionPredictorCR alloc] initWithLocationManager:v1 locationPredictionsManager:v1];
  v5 = [MEMORY[0x1E4F5B6A8] userContext];
  v6 = [MEMORY[0x1E4F5B6B8] keyPathForPredictedLocationOfInterestTransitions];
  v7 = [[ATXContextStoreWriter alloc] initWithContext:v5 keyPath:v6];
  v8 = [[ATXDailyRoutinesTriggerManager alloc] initWithCacheBasedPredictor:v3 transitionPredictor:v4 contextStoreWriter:v7];

  v9 = (void *)sharedInstance__pasExprOnceResult_0;
  sharedInstance__pasExprOnceResult_0 = (uint64_t)v8;
}

- (ATXDailyRoutinesTriggerManager)initWithCacheBasedPredictor:(id)a3 transitionPredictor:(id)a4 contextStoreWriter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXDailyRoutinesTriggerManager;
  v12 = [(ATXDailyRoutinesTriggerManager *)&v19 init];
  if (v12)
  {
    uint64_t v13 = [(id)objc_opt_class() convenienceDateFormatter];
    dateFormatter = v12->_dateFormatter;
    v12->_dateFormatter = (NSDateFormatter *)v13;

    objc_storeStrong((id *)&v12->_cachedPredictor, a3);
    objc_storeStrong((id *)&v12->_transitionPredictor, a4);
    objc_storeStrong((id *)&v12->_contextStoreWriter, a5);
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.duetexpertd.ATXDailyRoutinesTriggerManager", v15);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v16;
  }
  return v12;
}

- (NSDate)now
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

- (void)setNow:(id)a3
{
}

- (void)updateWithActivity:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__ATXDailyRoutinesTriggerManager_updateWithActivity___block_invoke;
  v7[3] = &unk_1E68AB870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __53__ATXDailyRoutinesTriggerManager_updateWithActivity___block_invoke(uint64_t a1)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 24) getNextTransitionOnActivity:*(void *)(a1 + 40)];
  if (([*(id *)(a1 + 40) didDefer] & 1) == 0)
  {
    if (v2)
    {
      [*(id *)(*(void *)(a1 + 32) + 16) prewarmOnActivity:*(void *)(a1 + 40)];
    }
    else
    {
      v3 = __atxlog_handle_dailyroutines();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "No predicted transition received. Attempting to load from cache", (uint8_t *)&v27, 2u);
      }

      v2 = [*(id *)(*(void *)(a1 + 32) + 16) getNextTransitionOnActivity:*(void *)(a1 + 40)];
    }
    if (([*(id *)(a1 + 40) didDefer] & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v5 = v4;
      uint64_t v6 = *(void *)(a1 + 32);
      if (v2)
      {
        v29 = @"transition";
        v30[0] = v2;
        v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
        [v5 postNotificationName:@"com.apple.duetexpertd.dailyroutines" object:v6 userInfo:v7];

        id v8 = __atxlog_handle_dailyroutines();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 138412290;
          v28 = v2;
          _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Using the following transition: %@", (uint8_t *)&v27, 0xCu);
        }

        id v9 = __atxlog_handle_dailyroutines();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = *(void **)(*(void *)(a1 + 32) + 8);
          id v11 = [v2 date];
          v12 = [v10 stringFromDate:v11];
          int v27 = 138412290;
          v28 = v12;
          _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Transition time: %@", (uint8_t *)&v27, 0xCu);
        }
        uint64_t v13 = *(void **)(a1 + 32);
        v14 = (void *)v13[4];
        v15 = [v13 now];
        dispatch_queue_t v16 = [v2 transitionArrayForDate:v15];
        int v17 = [v14 setWithObject:v16];

        v18 = __atxlog_handle_dailyroutines();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 67109120;
          LODWORD(v28) = v17;
          _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "Context store updated: %{BOOL}d", (uint8_t *)&v27, 8u);
        }

        objc_super v19 = objc_opt_class();
        v20 = [v2 date];
        v21 = [*(id *)(a1 + 32) now];
        v22 = [v19 _wakeupDateForExitDate:v20 fromDate:v21];

        v23 = __atxlog_handle_dailyroutines();
        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        if (v22)
        {
          if (v24)
          {
            v25 = [*(id *)(*(void *)(a1 + 32) + 8) stringFromDate:v22];
            int v27 = 138412290;
            v28 = v25;
            _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_DEFAULT, "Scheduling one shot job for %@", (uint8_t *)&v27, 0xCu);
          }
          v26 = *(void **)(a1 + 32);
          v23 = [v26 now];
          [v22 timeIntervalSinceDate:v23];
          objc_msgSend(v26, "_scheduleOneShotJobAfterInterval:");
        }
        else if (v24)
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_DEFAULT, "Declined to schedule an trigger manager update", (uint8_t *)&v27, 2u);
        }
      }
      else
      {
        [v4 postNotificationName:@"com.apple.duetexpertd.dailyroutines" object:*(void *)(a1 + 32)];

        v22 = __atxlog_handle_dailyroutines();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, "No transition found", (uint8_t *)&v27, 2u);
        }
        v2 = 0;
      }
    }
  }
}

- (id)currentTransition
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__ATXDailyRoutinesTriggerManager_currentTransition__block_invoke;
  v5[3] = &unk_1E68AB898;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __51__ATXDailyRoutinesTriggerManager_currentTransition__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) getNextTransitionOnActivity:0];
  if (!v2)
  {
    id v3 = __atxlog_handle_dailyroutines();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "No predicted transition received. Attempting to load from cache", v6, 2u);
    }

    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) getNextTransitionOnActivity:0];
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v2;
}

+ (id)_wakeupDateForExitDate:(id)a3 fromDate:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = +[_ATXGlobals sharedInstance];
  uint64_t v8 = [v7 triggerPresetMinutes];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __66__ATXDailyRoutinesTriggerManager__wakeupDateForExitDate_fromDate___block_invoke;
  v23[3] = &unk_1E68AB8C0;
  id v9 = v5;
  id v24 = v9;
  id v10 = objc_msgSend(v8, "_pas_mappedArrayWithTransform:", v23);
  id v11 = [v10 sortedArrayUsingSelector:sel_compare_];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v11;
  id v13 = (id)[v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v12);
        }
        dispatch_queue_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v16, "timeIntervalSinceDate:", v6, (void)v19);
        if (v17 > 0.0)
        {
          id v13 = v16;
          goto LABEL_11;
        }
      }
      id v13 = (id)[v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v13;
}

uint64_t __66__ATXDailyRoutinesTriggerManager__wakeupDateForExitDate_fromDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = (double)-(int)[a2 intValue] * 60.0;
  return [v2 dateByAddingTimeInterval:v3];
}

- (void)_scheduleOneShotJobAfterInterval:(double)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3 >= 120.0)
  {
    uint64_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F142F8], 0);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14138], 1);
    xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E4F14170], (uint64_t)a3);
    xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E4F141A8], *MEMORY[0x1E4F14200]);
    xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67__ATXDailyRoutinesTriggerManager__scheduleOneShotJobAfterInterval___block_invoke;
    v6[3] = &unk_1E68AB3F0;
    v6[4] = self;
    atxRegisterCTSJobHandlerForNonClassCLocked("com.apple.duetexpertd.dailyroutines-trigger", v4, v6);
  }
  else
  {
    uint64_t v4 = __atxlog_handle_dailyroutines();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v8 = a3;
      _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "Interval %f too soon, not scheduling one shot update", buf, 0xCu);
    }
  }
}

void __67__ATXDailyRoutinesTriggerManager__scheduleOneShotJobAfterInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = __atxlog_handle_dailyroutines();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "Running Daily Routines one-shot job...", v5, 2u);
  }

  [*(id *)(a1 + 32) updateWithActivity:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_contextStoreWriter, 0);
  objc_storeStrong((id *)&self->_transitionPredictor, 0);
  objc_storeStrong((id *)&self->_cachedPredictor, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end