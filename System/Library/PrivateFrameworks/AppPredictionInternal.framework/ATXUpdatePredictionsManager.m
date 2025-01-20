@interface ATXUpdatePredictionsManager
+ (BOOL)shouldOverrideRefreshRateForDisabledConsumerSubTypesForReason:(unint64_t)a3;
+ (id)homeScreenPageConfigs;
+ (id)sharedInstance;
+ (void)homeScreenPageConfigs;
- (ATXMLActionProducer)actionProducer;
- (ATXServer)atxServer;
- (ATXUpdatePredictionsLogger)updatePredictionsLogger;
- (ATXUpdatePredictionsManager)init;
- (ATXUpdatePredictionsManager)initWithATXServer:(id)a3 actionProducer:(id)a4 updateSources:(id)a5 updatePredictionsLogger:(id)a6;
- (ATXUpdatePredictionsSources)updateSources;
- (id)_stringArrayFromBoxedConsumerSubTypeArray:(id)a3;
- (id)actionConsumerSubTypesToUpdateWithRefreshRate:(double)a3 disabledConsumerSubTypes:(id)a4 shouldOverrideRefreshRateForDisabledConsumerSubTypes:(BOOL)a5;
- (id)appConsumerSubTypesToUpdateWithRefreshRate:(double)a3 disabledConsumerSubTypes:(id)a4 shouldOverrideRefreshRateForDisabledConsumerSubTypes:(BOOL)a5;
- (id)disabledConsumerSubTypes;
- (id)disabledConsumerSubTypesWithHomeScreenPageConfigs:(id)a3;
- (void)logPredictionUpdatesForBoxedAppConsumerSubTypes:(id)a3 actionConsumerSubTypes:(id)a4 reason:(unint64_t)a5;
- (void)processAppDirectoryFeedback;
- (void)processAppDirectoryFeedbackNoSync;
- (void)processHomeScreenFeedback;
- (void)processHomeScreenFeedbackNoSync;
- (void)processLockscreenFeedback;
- (void)processLockscreenFeedbackNoSync;
- (void)processSpotlightActionFeedback;
- (void)processSpotlightActionFeedbackNoSync;
- (void)processSpotlightAppFeedback;
- (void)processSpotlightAppFeedbackNoSync;
- (void)refreshActionPredictionsWithConsumerSubTypes:(id)a3 featureCache:(id)a4;
- (void)refreshAppPredictionsWithConsumerSubTypes:(id)a3 featureCache:(id)a4;
- (void)setAtxServer:(id)a3;
- (void)updateBehavioralPredictionsIfOlderThan:(double)a3 reason:(unint64_t)a4;
@end

@implementation ATXUpdatePredictionsManager

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_42 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_42, &__block_literal_global_250);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_57;
  return v2;
}

void __45__ATXUpdatePredictionsManager_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_57;
  sharedInstance__pasExprOnceResult_57 = v1;
}

- (ATXUpdatePredictionsManager)init
{
  if ([MEMORY[0x1E4F4AFB8] shouldComputeActions]) {
    v3 = objc_opt_new();
  }
  else {
    v3 = 0;
  }
  v4 = +[ATXServer sharedInstance];
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = [(ATXUpdatePredictionsManager *)self initWithATXServer:v4 actionProducer:v3 updateSources:v5 updatePredictionsLogger:v6];

  return v7;
}

- (ATXUpdatePredictionsManager)initWithATXServer:(id)a3 actionProducer:(id)a4 updateSources:(id)a5 updatePredictionsLogger:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ATXUpdatePredictionsManager;
  v15 = [(ATXUpdatePredictionsManager *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_atxServer, a3);
    objc_storeStrong((id *)&v16->_actionProducer, a4);
    objc_storeStrong((id *)&v16->_updateSources, a5);
    objc_storeStrong((id *)&v16->_updatePredictionsLogger, a6);
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    id v18 = objc_claimAutoreleasedReturnValue();
    v19 = (const char *)[v18 UTF8String];
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create(v19, v20);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v21;
  }
  return v16;
}

- (void)updateBehavioralPredictionsIfOlderThan:(double)a3 reason:(unint64_t)a4
{
  sel_getName(a2);
  v7 = (void *)os_transaction_create();
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__ATXUpdatePredictionsManager_updateBehavioralPredictionsIfOlderThan_reason___block_invoke;
  v10[3] = &unk_1E68AE9E0;
  id v11 = v7;
  unint64_t v12 = a4;
  double v13 = a3;
  v10[4] = self;
  id v9 = v7;
  dispatch_sync(queue, v10);
}

void __77__ATXUpdatePredictionsManager_updateBehavioralPredictionsIfOlderThan_reason___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)objc_opt_class() shouldOverrideRefreshRateForDisabledConsumerSubTypesForReason:*(void *)(a1 + 48)];
  v3 = [*(id *)(a1 + 32) disabledConsumerSubTypes];
  v4 = [*(id *)(a1 + 32) appConsumerSubTypesToUpdateWithRefreshRate:v3 disabledConsumerSubTypes:v2 shouldOverrideRefreshRateForDisabledConsumerSubTypes:*(double *)(a1 + 56)];
  v5 = [*(id *)(a1 + 32) actionConsumerSubTypesToUpdateWithRefreshRate:v3 disabledConsumerSubTypes:v2 shouldOverrideRefreshRateForDisabledConsumerSubTypes:*(double *)(a1 + 56)];
  v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    id v9 = [*(id *)(a1 + 32) _stringArrayFromBoxedConsumerSubTypeArray:v4];
    int v25 = 138543874;
    v26 = v8;
    __int16 v27 = 2080;
    v28 = "-[ATXUpdatePredictionsManager updateBehavioralPredictionsIfOlderThan:reason:]_block_invoke";
    __int16 v29 = 2114;
    v30 = v9;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ - %s: app consumerSubTypes to refresh: %{public}@", (uint8_t *)&v25, 0x20u);
  }
  v10 = __atxlog_handle_default();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (objc_class *)objc_opt_class();
    unint64_t v12 = NSStringFromClass(v11);
    double v13 = [*(id *)(a1 + 32) _stringArrayFromBoxedConsumerSubTypeArray:v5];
    int v25 = 138543874;
    v26 = v12;
    __int16 v27 = 2080;
    v28 = "-[ATXUpdatePredictionsManager updateBehavioralPredictionsIfOlderThan:reason:]_block_invoke";
    __int16 v29 = 2114;
    v30 = v13;
    _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - %s: action consumerSubTypes to refresh: %{public}@", (uint8_t *)&v25, 0x20u);
  }
  if ([v4 count] || objc_msgSend(v5, "count"))
  {
    id v14 = (void *)MEMORY[0x1D25F6CC0]();
    [*(id *)(a1 + 32) processLockscreenFeedbackNoSync];
    v15 = (void *)MEMORY[0x1D25F6CC0]();
    [*(id *)(a1 + 32) processHomeScreenFeedbackNoSync];
    v16 = (void *)MEMORY[0x1D25F6CC0]();
    [*(id *)(a1 + 32) processSpotlightAppFeedbackNoSync];
    v17 = (void *)MEMORY[0x1D25F6CC0]();
    [*(id *)(a1 + 32) processSpotlightActionFeedbackNoSync];
    id v18 = (void *)MEMORY[0x1D25F6CC0]();
    [*(id *)(a1 + 32) processAppDirectoryFeedbackNoSync];
  }
  v19 = objc_opt_new();
  if ([v4 count])
  {
    [*(id *)(a1 + 32) refreshAppPredictionsWithConsumerSubTypes:v4 featureCache:v19];
    v20 = [*(id *)(a1 + 32) atxServer];
    [v20 updateBlendingLayerForAllConsumerSubTypes];
  }
  if ([v5 count])
  {
    [*(id *)(a1 + 32) refreshActionPredictionsWithConsumerSubTypes:v5 featureCache:v19];
    dispatch_queue_t v21 = [*(id *)(a1 + 32) actionProducer];
    [v21 updateBlendingLayerForAllConsumerSubTypes];
  }
  [*(id *)(a1 + 32) logPredictionUpdatesForBoxedAppConsumerSubTypes:v4 actionConsumerSubTypes:v5 reason:*(void *)(a1 + 48)];
  v22 = +[_ATXFeedback sharedInstance];
  [v22 unloadCachedHistograms];

  v23 = +[ATXActionFeedback sharedInstance];
  [v23 unloadCachedHistograms];

  id v24 = self;
}

+ (BOOL)shouldOverrideRefreshRateForDisabledConsumerSubTypesForReason:(unint64_t)a3
{
  if (a3 >= 0x18)
  {
    v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[ATXUpdatePredictionsManager shouldOverrideRefreshRateForDisabledConsumerSubTypesForReason:](a3, v5);
    }

    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"shouldOverrideRefreshRateForDisabledConsumerSubTypesForReason called with invalid ATXUpdatePredictionsReason value of %lu", a3);
    LOBYTE(v4) = 0;
  }
  else
  {
    return (0x8Fu >> a3) & 1;
  }
  return v4;
}

- (id)appConsumerSubTypesToUpdateWithRefreshRate:(double)a3 disabledConsumerSubTypes:(id)a4 shouldOverrideRefreshRateForDisabledConsumerSubTypes:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [(ATXUpdatePredictionsManager *)self atxServer];
  v10 = [v9 consumerSubTypesToUpdateWithRefreshRate:v8 disabledConsumerSubTypes:v5 shouldOverrideRefreshRateForDisabledConsumerSubTypes:a3];

  return v10;
}

- (id)actionConsumerSubTypesToUpdateWithRefreshRate:(double)a3 disabledConsumerSubTypes:(id)a4 shouldOverrideRefreshRateForDisabledConsumerSubTypes:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [(ATXUpdatePredictionsManager *)self actionProducer];

  if (v9)
  {
    v10 = [(ATXUpdatePredictionsManager *)self actionProducer];
    id v11 = [v10 consumerSubTypesToInvalidateForTTL:v8 disabledConsumerSubTypes:v5 shouldOverrideRefreshRateForDisabledConsumerSubTypes:a3];
  }
  else
  {
    id v11 = objc_opt_new();
  }

  return v11;
}

- (id)disabledConsumerSubTypes
{
  v3 = [(id)objc_opt_class() homeScreenPageConfigs];
  BOOL v4 = [(ATXUpdatePredictionsManager *)self disabledConsumerSubTypesWithHomeScreenPageConfigs:v3];

  return v4;
}

- (id)disabledConsumerSubTypesWithHomeScreenPageConfigs:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    __int16 v29 = self;
    v36 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", &unk_1F27F2A60, &unk_1F27F2A78, 0);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v30 = v4;
    obuint64_t j = v4;
    uint64_t v33 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
    if (v33)
    {
      uint64_t v32 = *(void *)v46;
      uint64_t v5 = *MEMORY[0x1E4F4B5F8];
LABEL_4:
      uint64_t v6 = 0;
      while (1)
      {
        if (*(void *)v46 != v32) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v45 + 1) + 8 * v6);
        if (![v36 count]) {
          break;
        }
        uint64_t v34 = v6;
        id v8 = [v7 panels];
        uint64_t v9 = [v8 count];

        if (v9) {
          [v36 removeObject:&unk_1F27F2A78];
        }
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v35 = [v7 stacks];
        uint64_t v10 = [v35 countByEnumeratingWithState:&v41 objects:v56 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v42 != v12) {
                objc_enumerationMutation(v35);
              }
              id v14 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              long long v37 = 0u;
              long long v38 = 0u;
              long long v39 = 0u;
              long long v40 = 0u;
              v15 = [v14 widgets];
              uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v55 count:16];
              if (v16)
              {
                uint64_t v17 = v16;
                uint64_t v18 = *(void *)v38;
                while (2)
                {
                  for (uint64_t j = 0; j != v17; ++j)
                  {
                    if (*(void *)v38 != v18) {
                      objc_enumerationMutation(v15);
                    }
                    v20 = [*(id *)(*((void *)&v37 + 1) + 8 * j) extensionBundleId];
                    int v21 = [v20 isEqualToString:v5];

                    if (v21)
                    {
                      [v36 removeObject:&unk_1F27F2A60];
                      [v36 removeObject:&unk_1F27F2A78];
                      goto LABEL_25;
                    }
                  }
                  uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v55 count:16];
                  if (v17) {
                    continue;
                  }
                  break;
                }
              }
LABEL_25:
            }
            uint64_t v11 = [v35 countByEnumeratingWithState:&v41 objects:v56 count:16];
          }
          while (v11);
        }

        uint64_t v6 = v34 + 1;
        if (v34 + 1 == v33)
        {
          uint64_t v33 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
          if (v33) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    v22 = __atxlog_handle_default();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (objc_class *)objc_opt_class();
      id v24 = NSStringFromClass(v23);
      int v25 = [v36 allObjects];
      v26 = [(ATXUpdatePredictionsManager *)v29 _stringArrayFromBoxedConsumerSubTypeArray:v25];
      *(_DWORD *)buf = 138412802;
      v50 = v24;
      __int16 v51 = 2080;
      v52 = "-[ATXUpdatePredictionsManager disabledConsumerSubTypesWithHomeScreenPageConfigs:]";
      __int16 v53 = 2112;
      v54 = v26;
      _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, "%@ - %s: %@", buf, 0x20u);
    }
    __int16 v27 = (void *)[v36 copy];

    id v4 = v30;
  }
  else
  {
    __int16 v27 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v27;
}

+ (id)homeScreenPageConfigs
{
  uint64_t v2 = objc_opt_new();
  id v9 = 0;
  v3 = [v2 loadHomeScreenAndTodayPageConfigurationsWithError:&v9];
  id v4 = v9;
  uint64_t v5 = v4;
  if (v3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (!v6)
  {
    v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      +[ATXUpdatePredictionsManager homeScreenPageConfigs];
    }
  }
  return v3;
}

- (void)refreshAppPredictionsWithConsumerSubTypes:(id)a3 featureCache:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ATXUpdatePredictionsManager *)self atxServer];
  [v8 updateAppPredictionsWithConsumerSubTypes:v7 featureCache:v6];
}

- (void)refreshActionPredictionsWithConsumerSubTypes:(id)a3 featureCache:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ATXUpdatePredictionsManager *)self actionProducer];
  [v8 invalidateCacheForConsumerSubTypes:v7 featureCache:v6];
}

- (void)processLockscreenFeedback
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ATXUpdatePredictionsManager_processLockscreenFeedback__block_invoke;
  block[3] = &unk_1E68AB818;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __56__ATXUpdatePredictionsManager_processLockscreenFeedback__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processLockscreenFeedbackNoSync];
}

- (void)processHomeScreenFeedback
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ATXUpdatePredictionsManager_processHomeScreenFeedback__block_invoke;
  block[3] = &unk_1E68AB818;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __56__ATXUpdatePredictionsManager_processHomeScreenFeedback__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processHomeScreenFeedbackNoSync];
}

- (void)processSpotlightAppFeedback
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ATXUpdatePredictionsManager_processSpotlightAppFeedback__block_invoke;
  block[3] = &unk_1E68AB818;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __58__ATXUpdatePredictionsManager_processSpotlightAppFeedback__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processSpotlightAppFeedbackNoSync];
}

- (void)processSpotlightActionFeedback
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__ATXUpdatePredictionsManager_processSpotlightActionFeedback__block_invoke;
  block[3] = &unk_1E68AB818;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __61__ATXUpdatePredictionsManager_processSpotlightActionFeedback__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processSpotlightActionFeedbackNoSync];
}

- (void)processAppDirectoryFeedback
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ATXUpdatePredictionsManager_processAppDirectoryFeedback__block_invoke;
  block[3] = &unk_1E68AB818;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __58__ATXUpdatePredictionsManager_processAppDirectoryFeedback__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processAppDirectoryFeedbackNoSync];
}

- (void)processLockscreenFeedbackNoSync
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  sel_getName(a2);
  id v4 = (void *)os_transaction_create();
  uint64_t v5 = objc_opt_new();
  id v6 = [v5 clientModelIdsWithFeedbackListeners];
  id v7 = objc_alloc(MEMORY[0x1E4F1CB10]);
  id v8 = [MEMORY[0x1E4F4B650] feedbackRootDirectory];
  id v9 = [v8 stringByAppendingPathComponent:@"blendingFeedback-ATXConsumerSubTypeActionLockScreen"];
  uint64_t v10 = (void *)[v7 initFileURLWithPath:v9];

  uint64_t v11 = [[ATXProactiveSuggestioniOSUIFeedbackQuery alloc] initWithClientModelIds:v6 consumerSubTypeToConsider:22 startDateForResults:0 bookmarkURLPath:v10];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__ATXUpdatePredictionsManager_processLockscreenFeedbackNoSync__block_invoke;
  v14[3] = &unk_1E68B6560;
  id v15 = v5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__ATXUpdatePredictionsManager_processLockscreenFeedbackNoSync__block_invoke_2;
  v13[3] = &unk_1E68B36D8;
  v13[4] = self;
  id v12 = v5;
  [(ATXProactiveSuggestionUIFeedbackQuery *)v11 enumerateUIFeedbackResultsWithBlock:v14 completionBlock:v13];
}

uint64_t __62__ATXUpdatePredictionsManager_processLockscreenFeedbackNoSync__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleNewFeedbackResult:a2];
}

void __62__ATXUpdatePredictionsManager_processLockscreenFeedbackNoSync__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "%@ - finished processing lockscreen feedback with error: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)processHomeScreenFeedbackNoSync
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  sel_getName(a2);
  id v4 = (void *)os_transaction_create();
  uint64_t v5 = objc_opt_new();
  int v6 = [v5 clientModelIdsWithFeedbackListeners];
  id v7 = objc_alloc(MEMORY[0x1E4F1CB10]);
  __int16 v8 = [MEMORY[0x1E4F4B650] feedbackRootDirectory];
  id v9 = [v8 stringByAppendingPathComponent:@"blendingFeedback-ATXConsumerSubTypeSuggestionHomeScreen"];
  uint64_t v10 = (void *)[v7 initFileURLWithPath:v9];

  uint64_t v11 = [(ATXProactiveSuggestioniOSUIFeedbackQuery *)[ATXProactiveSuggestioniOSPartialIntentUIFeedbackQuery alloc] initWithClientModelIds:v6 consumerSubTypeToConsider:34 startDateForResults:0 bookmarkURLPath:v10];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__ATXUpdatePredictionsManager_processHomeScreenFeedbackNoSync__block_invoke;
  v14[3] = &unk_1E68B6560;
  id v15 = v5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__ATXUpdatePredictionsManager_processHomeScreenFeedbackNoSync__block_invoke_2;
  v13[3] = &unk_1E68B36D8;
  v13[4] = self;
  id v12 = v5;
  [(ATXProactiveSuggestionUIFeedbackQuery *)v11 enumerateUIFeedbackResultsWithBlock:v14 completionBlock:v13];
}

uint64_t __62__ATXUpdatePredictionsManager_processHomeScreenFeedbackNoSync__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleNewFeedbackResult:a2];
}

void __62__ATXUpdatePredictionsManager_processHomeScreenFeedbackNoSync__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "%@ - finished processing homescreen feedback with error: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)processSpotlightAppFeedbackNoSync
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  sel_getName(a2);
  id v4 = (void *)os_transaction_create();
  uint64_t v5 = objc_opt_new();
  int v6 = [v5 clientModelIdsWithFeedbackListeners];
  id v7 = objc_alloc(MEMORY[0x1E4F1CB10]);
  __int16 v8 = [MEMORY[0x1E4F4B650] feedbackRootDirectory];
  id v9 = [v8 stringByAppendingPathComponent:@"blendingFeedback-ATXConsumerSubTypeSpotlightUnknown"];
  uint64_t v10 = (void *)[v7 initFileURLWithPath:v9];

  uint64_t v11 = [[ATXProactiveSuggestioniOSUIFeedbackQuery alloc] initWithClientModelIds:v6 consumerSubTypeToConsider:9 startDateForResults:0 bookmarkURLPath:v10];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__ATXUpdatePredictionsManager_processSpotlightAppFeedbackNoSync__block_invoke;
  v14[3] = &unk_1E68B6560;
  id v15 = v5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__ATXUpdatePredictionsManager_processSpotlightAppFeedbackNoSync__block_invoke_2;
  v13[3] = &unk_1E68B36D8;
  v13[4] = self;
  id v12 = v5;
  [(ATXProactiveSuggestionUIFeedbackQuery *)v11 enumerateUIFeedbackResultsWithBlock:v14 completionBlock:v13];
}

uint64_t __64__ATXUpdatePredictionsManager_processSpotlightAppFeedbackNoSync__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleNewFeedbackResult:a2];
}

void __64__ATXUpdatePredictionsManager_processSpotlightAppFeedbackNoSync__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "%@ - finished processing spotlight app feedback with error: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)processSpotlightActionFeedbackNoSync
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  sel_getName(a2);
  id v4 = (void *)os_transaction_create();
  uint64_t v5 = objc_opt_new();
  int v6 = [v5 clientModelIdsWithFeedbackListeners];
  id v7 = objc_alloc(MEMORY[0x1E4F1CB10]);
  __int16 v8 = [MEMORY[0x1E4F4B650] feedbackRootDirectory];
  id v9 = [v8 stringByAppendingPathComponent:@"blendingFeedback-ATXConsumerSubTypeActionSpotlightUnknown"];
  uint64_t v10 = (void *)[v7 initFileURLWithPath:v9];

  uint64_t v11 = [(ATXProactiveSuggestioniOSUIFeedbackQuery *)[ATXProactiveSuggestioniOSPartialIntentUIFeedbackQuery alloc] initWithClientModelIds:v6 consumerSubTypeToConsider:21 startDateForResults:0 bookmarkURLPath:v10];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__ATXUpdatePredictionsManager_processSpotlightActionFeedbackNoSync__block_invoke;
  v14[3] = &unk_1E68B6560;
  id v15 = v5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__ATXUpdatePredictionsManager_processSpotlightActionFeedbackNoSync__block_invoke_2;
  v13[3] = &unk_1E68B36D8;
  v13[4] = self;
  id v12 = v5;
  [(ATXProactiveSuggestionUIFeedbackQuery *)v11 enumerateUIFeedbackResultsWithBlock:v14 completionBlock:v13];
}

uint64_t __67__ATXUpdatePredictionsManager_processSpotlightActionFeedbackNoSync__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleNewFeedbackResult:a2];
}

void __67__ATXUpdatePredictionsManager_processSpotlightActionFeedbackNoSync__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "%@ - finished processing spotlight action feedback with error: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)processAppDirectoryFeedbackNoSync
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  sel_getName(a2);
  id v4 = (void *)os_transaction_create();
  uint64_t v5 = objc_opt_new();
  int v6 = [v5 clientModelIdsWithFeedbackListeners];
  id v7 = objc_alloc(MEMORY[0x1E4F1CB10]);
  __int16 v8 = [MEMORY[0x1E4F4B650] feedbackRootDirectory];
  id v9 = [v8 stringByAppendingPathComponent:@"blendingFeedback-ATXConsumerSubTypeAppDirectory"];
  uint64_t v10 = (void *)[v7 initFileURLWithPath:v9];

  uint64_t v11 = [[ATXProactiveSuggestioniOSUIFeedbackQuery alloc] initWithClientModelIds:v6 consumerSubTypeToConsider:35 startDateForResults:0 bookmarkURLPath:v10];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__ATXUpdatePredictionsManager_processAppDirectoryFeedbackNoSync__block_invoke;
  v14[3] = &unk_1E68B6560;
  id v15 = v5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__ATXUpdatePredictionsManager_processAppDirectoryFeedbackNoSync__block_invoke_2;
  v13[3] = &unk_1E68B36D8;
  v13[4] = self;
  id v12 = v5;
  [(ATXProactiveSuggestionUIFeedbackQuery *)v11 enumerateUIFeedbackResultsWithBlock:v14 completionBlock:v13];
}

uint64_t __64__ATXUpdatePredictionsManager_processAppDirectoryFeedbackNoSync__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleNewFeedbackResult:a2];
}

void __64__ATXUpdatePredictionsManager_processAppDirectoryFeedbackNoSync__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "%@ - finished processing app directory feedback with error: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)logPredictionUpdatesForBoxedAppConsumerSubTypes:(id)a3 actionConsumerSubTypes:(id)a4 reason:(unint64_t)a5
{
  id v8 = a4;
  if ([a3 containsObject:&unk_1F27F2A90]) {
    [(ATXUpdatePredictionsLogger *)self->_updatePredictionsLogger countPredictionUpdateWithReason:a5 client:0];
  }
  if ([v8 containsObject:&unk_1F27F2AA8]) {
    [(ATXUpdatePredictionsLogger *)self->_updatePredictionsLogger countPredictionUpdateWithReason:a5 client:1];
  }
}

- (id)_stringArrayFromBoxedConsumerSubTypeArray:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
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
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "unsignedIntegerValue", (void)v14);
        uint64_t v11 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v10];
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = (void *)[v4 copy];
  return v12;
}

- (ATXServer)atxServer
{
  return self->_atxServer;
}

- (void)setAtxServer:(id)a3
{
}

- (ATXMLActionProducer)actionProducer
{
  return self->_actionProducer;
}

- (ATXUpdatePredictionsSources)updateSources
{
  return self->_updateSources;
}

- (ATXUpdatePredictionsLogger)updatePredictionsLogger
{
  return self->_updatePredictionsLogger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatePredictionsLogger, 0);
  objc_storeStrong((id *)&self->_updateSources, 0);
  objc_storeStrong((id *)&self->_actionProducer, 0);
  objc_storeStrong((id *)&self->_atxServer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (void)shouldOverrideRefreshRateForDisabledConsumerSubTypesForReason:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "shouldOverrideRefreshRateForDisabledConsumerSubTypesForReason called with invalid ATXUpdatePredictionsReason value of %lu", (uint8_t *)&v2, 0xCu);
}

+ (void)homeScreenPageConfigs
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Unable to fetch HomeScreen Page Configs with error: %@", (uint8_t *)&v2, 0xCu);
}

@end