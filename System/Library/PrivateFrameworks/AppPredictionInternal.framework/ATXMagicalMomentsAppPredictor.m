@interface ATXMagicalMomentsAppPredictor
+ (id)sharedInstance;
+ (void)sharedInstance;
- (ATXMagicalMomentsAppPredictor)init;
- (id)addNowPlayingEventsToAppLaunches:(id)a3;
- (id)fetchAppLaunchEventsForTraining;
- (id)generateAppLaunchCountedSetFromAppLaunches:(id)a3;
- (void)fetchAppLaunchEventsForTraining;
- (void)trainWithXPCActivity:(id)a3;
@end

@implementation ATXMagicalMomentsAppPredictor

+ (id)sharedInstance
{
  v2 = __atxlog_handle_default();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    +[ATXMagicalMomentsAppPredictor sharedInstance](v2);
  }

  if (sharedInstance__pasOnceToken7_2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken7_2, &__block_literal_global_249);
  }
  v3 = (void *)sharedInstance__pasExprOnceResult_56;
  return v3;
}

void __47__ATXMagicalMomentsAppPredictor_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_56;
  sharedInstance__pasExprOnceResult_56 = v1;
}

- (ATXMagicalMomentsAppPredictor)init
{
  v17.receiver = self;
  v17.super_class = (Class)ATXMagicalMomentsAppPredictor;
  v2 = [(ATXMagicalMomentsAppPredictor *)&v17 init];
  if (v2)
  {
    v3 = __atxlog_handle_default();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_INFO, "ATXMM: Initializing experts.", v16, 2u);
    }

    uint64_t v4 = objc_opt_new();
    contextHelper = v2->_contextHelper;
    v2->_contextHelper = (ATXCoreDuetContextHelper *)v4;

    v6 = [[ATXTimeBucketedRateLimiter alloc] initWithMaxCount:5 perPeriod:600.0];
    rateLimiter = v2->_rateLimiter;
    v2->_rateLimiter = v6;

    v8 = [(ATXCoreDuetContextHelper *)v2->_contextHelper context];
    +[ATXMMAppPredictionExpert setupEventListenerForInferenceWithContext:v8 rateLimiter:v2->_rateLimiter];

    v9 = [(ATXCoreDuetContextHelper *)v2->_contextHelper context];
    +[ATXMMAppPredictionExpert setupEventListenerForInferenceWithContext:v9 rateLimiter:v2->_rateLimiter];

    v10 = [(ATXCoreDuetContextHelper *)v2->_contextHelper context];
    +[ATXMMAppPredictionExpert setupEventListenerForInferenceWithContext:v10 rateLimiter:v2->_rateLimiter];

    v11 = [(ATXCoreDuetContextHelper *)v2->_contextHelper context];
    +[ATXMMAppPredictionExpert setupEventListenerForInferenceWithContext:v11 rateLimiter:v2->_rateLimiter];

    v12 = [(ATXCoreDuetContextHelper *)v2->_contextHelper context];
    +[ATXMMAppPredictionExpert setupEventListenerForInferenceWithContext:v12 rateLimiter:v2->_rateLimiter];

    v13 = [(ATXCoreDuetContextHelper *)v2->_contextHelper context];
    +[ATXMMAppPredictionExpert setupEventListenerForInferenceWithContext:v13 rateLimiter:v2->_rateLimiter];

    v14 = [(ATXCoreDuetContextHelper *)v2->_contextHelper context];
    +[ATXMMAppPredictionExpert setupEventListenerForInferenceWithContext:v14 rateLimiter:v2->_rateLimiter];
  }
  return v2;
}

- (id)addNowPlayingEventsToAppLaunches:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-2592000.0];
  v6 = objc_opt_new();
  v7 = [v4 playbackEventsAfterSecondsOfInactivity:v5 betweenStartDate:v6 endDate:300.0];

  v8 = [v4 convertNowPlayingEventsToAppLaunchEvents:v7];
  [v3 addObjectsFromArray:v8];
  v9 = __atxlog_handle_default();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = [v8 count];
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "ATXMM: Added %lu Now Playing Events as App Launch Events.", buf, 0xCu);
  }

  v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
  v14 = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v12 = [v3 sortedArrayUsingDescriptors:v11];

  return v12;
}

- (id)fetchAppLaunchEventsForTraining
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v4 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithStringValue:@"com.apple.Preferences"];
  v5 = [v3 notPredicateWithSubpredicate:v4];

  v6 = objc_opt_new();
  v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2592000.0];
  v8 = [MEMORY[0x1E4F1C9C8] date];
  v18[0] = v5;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v10 = [v6 fetchEventsBetweenStartDate:v7 andEndDate:v8 withPredicates:v9];
  v11 = (void *)[v10 mutableCopy];

  v12 = __atxlog_handle_default();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v16 = 134217984;
    uint64_t v17 = [v11 count];
    _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_INFO, "ATXMM: Retrieved %lu App Launch Events.", (uint8_t *)&v16, 0xCu);
  }

  v13 = __atxlog_handle_default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    [(ATXMagicalMomentsAppPredictor *)v11 fetchAppLaunchEventsForTraining];
  }

  v14 = [(ATXMagicalMomentsAppPredictor *)self addNowPlayingEventsToAppLaunches:v11];

  return v14;
}

- (id)generateAppLaunchCountedSetFromAppLaunches:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1D25F6CC0](v6);
        v12 = objc_msgSend(v10, "identifier", (void)v14);
        [v4 addObject:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }

  return v4;
}

- (void)trainWithXPCActivity:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  uint64_t v6 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v7 = __atxlog_handle_default();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v34 = 0;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "ATXMM: Starting training of MagicalMoments App Predictor.", v34, 2u);
  }

  uint64_t v8 = [(ATXMagicalMomentsAppPredictor *)self fetchAppLaunchEventsForTraining];
  uint64_t v9 = [(ATXMagicalMomentsAppPredictor *)self generateAppLaunchCountedSetFromAppLaunches:v8];
  if (v8 && [v8 count] && v9 && objc_msgSend(v9, "count"))
  {
    int v10 = [v4 didDefer];
    v11 = __atxlog_handle_default();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_WORD *)v34 = 0;
        v13 = "ATXMM: MagicalMoments App Predictor was asked to defer, exiting early...";
LABEL_12:
        _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, v13, v34, 2u);
      }
    }
    else
    {
      if (v12)
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "ATXMM: Starting training of MagicalMoments experts.", v34, 2u);
      }

      long long v14 = __atxlog_handle_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "\n\nATXMM: ** Training BT Connected MagicalMoments Expert. ** \n", v34, 2u);
      }

      long long v15 = (void *)MEMORY[0x1D25F6CC0]();
      +[ATXMMAppPredictionExpert trainExpertWithAppLaunchEvents:v8 appLaunchCountedSet:v9];
      int v16 = [v4 didDefer];
      v11 = __atxlog_handle_default();
      BOOL v17 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (!v17) {
          goto LABEL_13;
        }
        *(_WORD *)v34 = 0;
        v13 = "ATXMM: MagicalMoments App Predictor was asked to defer, exiting early...";
        goto LABEL_12;
      }
      if (v17)
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "\n\nATXMM: ** Training BT Disconnected MagicalMoments Expert. ** \n", v34, 2u);
      }

      v18 = (void *)MEMORY[0x1D25F6CC0]();
      +[ATXMMAppPredictionExpert trainExpertWithAppLaunchEvents:v8 appLaunchCountedSet:v9];
      int v19 = [v4 didDefer];
      v11 = __atxlog_handle_default();
      BOOL v20 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v19)
      {
        if (!v20) {
          goto LABEL_13;
        }
        *(_WORD *)v34 = 0;
        v13 = "ATXMM: MagicalMoments App Predictor was asked to defer, exiting early...";
        goto LABEL_12;
      }
      if (v20)
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "\n\nATXMM: ** Training CarPlay Connected MagicalMoments Expert. ** \n", v34, 2u);
      }

      v21 = (void *)MEMORY[0x1D25F6CC0]();
      +[ATXMMAppPredictionExpert trainExpertWithAppLaunchEvents:v8 appLaunchCountedSet:v9];
      int v22 = [v4 didDefer];
      v11 = __atxlog_handle_default();
      BOOL v23 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v22)
      {
        if (!v23) {
          goto LABEL_13;
        }
        *(_WORD *)v34 = 0;
        v13 = "ATXMM: MagicalMoments App Predictor was asked to defer, exiting early...";
        goto LABEL_12;
      }
      if (v23)
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "\n\nATXMM: ** Training CarPlay Disconnected MagicalMoments Expert. ** \n", v34, 2u);
      }

      v24 = (void *)MEMORY[0x1D25F6CC0]();
      +[ATXMMAppPredictionExpert trainExpertWithAppLaunchEvents:v8 appLaunchCountedSet:v9];
      int v25 = [v4 didDefer];
      v11 = __atxlog_handle_default();
      BOOL v26 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v25)
      {
        if (!v26) {
          goto LABEL_13;
        }
        *(_WORD *)v34 = 0;
        v13 = "ATXMM: MagicalMoments App Predictor was asked to defer, exiting early...";
        goto LABEL_12;
      }
      if (v26)
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "\n\nATXMM: ** Training Audio Connected MagicalMoments Expert. ** \n", v34, 2u);
      }

      v27 = (void *)MEMORY[0x1D25F6CC0]();
      +[ATXMMAppPredictionExpert trainExpertWithAppLaunchEvents:v8 appLaunchCountedSet:v9];
      int v28 = [v4 didDefer];
      v11 = __atxlog_handle_default();
      BOOL v29 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v28)
      {
        if (!v29) {
          goto LABEL_13;
        }
        *(_WORD *)v34 = 0;
        v13 = "ATXMM: MagicalMoments App Predictor was asked to defer, exiting early...";
        goto LABEL_12;
      }
      if (v29)
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "\n\nATXMM: ** Training Audio Disconnected MagicalMoments Expert. ** \n", v34, 2u);
      }

      v30 = (void *)MEMORY[0x1D25F6CC0]();
      +[ATXMMAppPredictionExpert trainExpertWithAppLaunchEvents:v8 appLaunchCountedSet:v9];
      int v31 = [v4 didDefer];
      v11 = __atxlog_handle_default();
      BOOL v32 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v31)
      {
        if (!v32) {
          goto LABEL_13;
        }
        *(_WORD *)v34 = 0;
        v13 = "ATXMM: MagicalMoments App Predictor was asked to defer, exiting early...";
        goto LABEL_12;
      }
      if (v32)
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "\n\nATXMM: ** Training Idle Time End MagicalMoments Expert. ** \n", v34, 2u);
      }

      v33 = (void *)MEMORY[0x1D25F6CC0]();
      +[ATXMMAppPredictionExpert trainExpertWithAppLaunchEvents:v8 appLaunchCountedSet:v9];
      v11 = __atxlog_handle_default();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v34 = 0;
        v13 = "ATXMM: Done training MagicalMoments experts.";
        goto LABEL_12;
      }
    }
  }
  else
  {
    v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v34 = 0;
      v13 = "ATXMM: Didn't retrieve any app launches. Exiting training early.";
      goto LABEL_12;
    }
  }
LABEL_13:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_contextHelper, 0);
}

+ (void)sharedInstance
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "ATXMM: Creating SharedInstance of MagicalMomentsAppPredictor", v1, 2u);
}

- (void)fetchAppLaunchEventsForTraining
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 lastObject];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "ATXMM: Last App Launch Event: %@", (uint8_t *)&v4, 0xCu);
}

@end