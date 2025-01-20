@interface ATXCandidateRelevanceModelServerCoordinator
+ (id)sharedInstance;
+ (id)userDefaultsKeyForLastCacheUpdateDateForConfig:(id)a3;
- (ATXCandidateRelevanceModelServerCoordinator)init;
- (ATXCandidateRelevanceModelServerCoordinator)initWithContextHelper:(id)a3 configs:(id)a4 defaults:(id)a5;
- (id)callbackForAnchor:(id)a3;
- (id)currentDuetEventForAnchor:(id)a3;
- (id)exitNotificationIdentifierForAnchor:(id)a3;
- (id)lastCacheUpdateDateForConfig:(id)a3;
- (id)notificationIdentifierForAnchor:(id)a3;
- (id)supportedAnchorsForNotifications;
- (void)_syncForTests;
- (void)dealloc;
- (void)handleAnchorNotificationForAnchor:(id)a3;
- (void)handleLOIEntranceNotification;
- (void)handleLOIExitNotification;
- (void)handleMicrolocationVisitNotification;
- (void)registerAnchorEventNotificationsForAnchor:(id)a3;
- (void)registerForSupportedAnchorNotificatons;
- (void)sendSuggestionsToBlendingForConfig:(id)a3;
- (void)sendSuggestionsToBlendingForEachConfigIfCacheIsOlderThan:(double)a3;
- (void)sendSuggestionsToBlendingForEachConfigImmediately;
- (void)setCacheUpdateDate:(id)a3 forConfig:(id)a4;
- (void)unregisterAnchorEventListenerForAnchor:(id)a3;
- (void)unregisterAnchorEventListeners;
@end

@implementation ATXCandidateRelevanceModelServerCoordinator

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_45);
  }
  v2 = (void *)sharedInstance_modelServerCoordinator;
  return v2;
}

uint64_t __61__ATXCandidateRelevanceModelServerCoordinator_sharedInstance__block_invoke()
{
  sharedInstance_modelServerCoordinator = objc_alloc_init(ATXCandidateRelevanceModelServerCoordinator);
  return MEMORY[0x1F41817F8]();
}

- (ATXCandidateRelevanceModelServerCoordinator)init
{
  v3 = objc_opt_new();
  v4 = allRelevanceModelConfigs();
  id v5 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v6 = (void *)[v5 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  v7 = [(ATXCandidateRelevanceModelServerCoordinator *)self initWithContextHelper:v3 configs:v4 defaults:v6];

  return v7;
}

- (ATXCandidateRelevanceModelServerCoordinator)initWithContextHelper:(id)a3 configs:(id)a4 defaults:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ATXCandidateRelevanceModelServerCoordinator;
  v12 = [(ATXCandidateRelevanceModelServerCoordinator *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contextHelper, a3);
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("ATXCandidateRelevanceModelServerCoordinator.updateQueue", v14);
    updateQueue = v13->_updateQueue;
    v13->_updateQueue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v13->_configs, a4);
    objc_storeStrong((id *)&v13->_defaults, a5);
    v17 = [[ATXTimeBucketedRateLimiter alloc] initWithMaxCount:5 perPeriod:600.0];
    rateLimiter = v13->_rateLimiter;
    v13->_rateLimiter = v17;
  }
  return v13;
}

- (void)dealloc
{
  [(ATXCandidateRelevanceModelServerCoordinator *)self unregisterAnchorEventListeners];
  v3.receiver = self;
  v3.super_class = (Class)ATXCandidateRelevanceModelServerCoordinator;
  [(ATXCandidateRelevanceModelServerCoordinator *)&v3 dealloc];
}

- (void)registerForSupportedAnchorNotificatons
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = [(ATXCandidateRelevanceModelServerCoordinator *)self supportedAnchorsForNotifications];
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
        [(ATXCandidateRelevanceModelServerCoordinator *)self registerAnchorEventNotificationsForAnchor:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)supportedAnchorsForNotifications
{
  v14[10] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = objc_opt_new();
  v14[0] = v13;
  v2 = objc_opt_new();
  v14[1] = v2;
  objc_super v3 = objc_opt_new();
  v14[2] = v3;
  uint64_t v4 = objc_opt_new();
  v14[3] = v4;
  uint64_t v5 = objc_opt_new();
  v14[4] = v5;
  uint64_t v6 = objc_opt_new();
  v14[5] = v6;
  uint64_t v7 = objc_opt_new();
  v14[6] = v7;
  long long v8 = objc_opt_new();
  v14[7] = v8;
  long long v9 = objc_opt_new();
  v14[8] = v9;
  long long v10 = objc_opt_new();
  v14[9] = v10;
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];

  return v11;
}

- (void)registerAnchorEventNotificationsForAnchor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ATXCandidateRelevanceModelServerCoordinator registerAnchorEventNotificationsForAnchor:].cold.4();
  }

  int v6 = [(id)objc_opt_class() usesContextStoreForRealTimeNotifications];
  uint64_t v7 = objc_opt_class();
  long long v8 = v7;
  if (v6)
  {
    long long v9 = [(ATXCandidateRelevanceModelServerCoordinator *)self callbackForAnchor:v4];
    long long v10 = [(ATXCandidateRelevanceModelServerCoordinator *)self notificationIdentifierForAnchor:v4];
    long long v11 = [(ATXCoreDuetContextHelper *)self->_contextHelper context];
    [v8 registerWithContextStoreForAnchorEntranceWithCallback:v9 notificationId:v10 registrationPersistenceContext:v11];

    if ([(id)objc_opt_class() anchorType] == 18)
    {
      v12 = [(id)objc_opt_class() invalidationPredicateForContextStoreRegistration];

      if (v12)
      {
        uint64_t v13 = __atxlog_handle_relevance_model();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[ATXCandidateRelevanceModelServerCoordinator registerAnchorEventNotificationsForAnchor:]();
        }

        v14 = objc_opt_class();
        dispatch_queue_t v15 = [(ATXCandidateRelevanceModelServerCoordinator *)self callbackForAnchor:v4];
        v16 = [(ATXCandidateRelevanceModelServerCoordinator *)self exitNotificationIdentifierForAnchor:v4];
        v17 = [(ATXCoreDuetContextHelper *)self->_contextHelper context];
        [v14 registerWithContextStoreForAnchorExitWithCallback:v15 notificationId:v16 registrationPersistenceContext:v17];
      }
    }
    goto LABEL_16;
  }
  uint64_t v18 = [v7 anchorType];
  v19 = objc_opt_class();
  if (v18 == 19)
  {
    objc_super v20 = sel_handleMicrolocationVisitNotification;
LABEL_15:
    [v19 registerForNotificationsWithoutUsingContextStoreForObserver:self enterSelector:v20 exitSelector:0];
    goto LABEL_16;
  }
  uint64_t v21 = [v19 anchorType];
  v19 = objc_opt_class();
  if (v21 == 7)
  {
    objc_super v20 = sel_handleLOIEntranceNotification;
    goto LABEL_15;
  }
  if ([v19 anchorType] == 8)
  {
    v19 = objc_opt_class();
    objc_super v20 = sel_handleLOIExitNotification;
    goto LABEL_15;
  }
  v23 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
    -[ATXCandidateRelevanceModelServerCoordinator registerAnchorEventNotificationsForAnchor:]();
  }

LABEL_16:
  v22 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[ATXCandidateRelevanceModelServerCoordinator registerAnchorEventNotificationsForAnchor:]();
  }
}

- (id)callbackForAnchor:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__ATXCandidateRelevanceModelServerCoordinator_callbackForAnchor___block_invoke;
  v9[3] = &unk_1E68AB980;
  v9[4] = self;
  id v10 = v4;
  id v5 = v4;
  objc_copyWeak(&v11, &location);
  int v6 = _Block_copy(v9);
  uint64_t v7 = _Block_copy(v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v7;
}

void __65__ATXCandidateRelevanceModelServerCoordinator_callbackForAnchor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    int v6 = NSStringFromClass(v5);
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 138412802;
    id v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "%@ - (%@) Anchor Event notification received, %@. Generating new predictions.", (uint8_t *)&v9, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && [(id)objc_opt_class() shouldProcessContextStoreNotification]) {
    [WeakRetained handleAnchorNotificationForAnchor:*(void *)(a1 + 40)];
  }
}

- (void)unregisterAnchorEventListeners
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(ATXCandidateRelevanceModelServerCoordinator *)self supportedAnchorsForNotifications];
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
        [(ATXCandidateRelevanceModelServerCoordinator *)self unregisterAnchorEventListenerForAnchor:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)unregisterAnchorEventListenerForAnchor:(id)a3
{
  id v4 = a3;
  if (([(id)objc_opt_class() usesContextStoreForRealTimeNotifications] & 1) == 0
    && ([(id)objc_opt_class() anchorType] == 19
     || [(id)objc_opt_class() anchorType] == 8
     || [(id)objc_opt_class() anchorType] == 7))
  {
    uint64_t v5 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ATXCandidateRelevanceModelServerCoordinator unregisterAnchorEventListenerForAnchor:]();
    }

    [(id)objc_opt_class() unregisterForNotificationsWithoutUsingContextStoreForObserver:self];
    uint64_t v6 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[ATXCandidateRelevanceModelServerCoordinator unregisterAnchorEventListenerForAnchor:]();
    }
  }
}

- (id)notificationIdentifierForAnchor:(id)a3
{
  id v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 anchorTypeString];

  uint64_t v7 = (void *)[v5 initWithFormat:@"com.apple.duetexpertd.ATXCandidateRelevanceModelServerCoordinator.%@", v6];
  return v7;
}

- (id)exitNotificationIdentifierForAnchor:(id)a3
{
  id v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 anchorTypeString];

  uint64_t v7 = (void *)[v5 initWithFormat:@"com.apple.duetexpertd.ATXCandidateRelevanceModelServerCoordinator.invalidation.%@", v6];
  return v7;
}

- (void)handleLOIEntranceNotification
{
  id v3 = (id)objc_opt_new();
  [(ATXCandidateRelevanceModelServerCoordinator *)self handleAnchorNotificationForAnchor:v3];
}

- (void)handleLOIExitNotification
{
  id v3 = (id)objc_opt_new();
  [(ATXCandidateRelevanceModelServerCoordinator *)self handleAnchorNotificationForAnchor:v3];
}

- (void)handleMicrolocationVisitNotification
{
  id v3 = objc_opt_new();
  id v4 = [(ATXCandidateRelevanceModelServerCoordinator *)self currentDuetEventForAnchor:v3];

  if (v4)
  {
    id v5 = [(NSUserDefaults *)self->_defaults stringForKey:@"ATXCandidateRelevanceModelServer-ATXMicrolocationAnchorLastIdentifierKey"];
    if (v5
      && ([v4 identifier],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v6 isEqualToString:v5],
          v6,
          v7))
    {
      long long v8 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Received a high confidence anchor event, but ignoring since it's the same event as what we received last time.", v12, 2u);
      }
    }
    else
    {
      defaults = self->_defaults;
      long long v10 = [v4 identifier];
      [(NSUserDefaults *)defaults setValue:v10 forKey:@"ATXCandidateRelevanceModelServer-ATXMicrolocationAnchorLastIdentifierKey"];

      long long v11 = objc_opt_new();
      [(ATXCandidateRelevanceModelServerCoordinator *)self handleAnchorNotificationForAnchor:v11];
    }
  }
}

- (id)currentDuetEventForAnchor:(id)a3
{
  id v3 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedDuetDataProviderClass"), "supportedDuetEventClass")), "initWithCurrentContextStoreValues");
  return v3;
}

- (void)handleAnchorNotificationForAnchor:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    long long v8 = [v4 anchorTypeString];
    int v9 = 138412546;
    long long v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%@ - %@ Anchor notification received. Updating suggestions immediately.", (uint8_t *)&v9, 0x16u);
  }
  [(ATXCandidateRelevanceModelServerCoordinator *)self sendSuggestionsToBlendingForEachConfigImmediately];
}

- (void)sendSuggestionsToBlendingForEachConfigImmediately
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(ATXTimeBucketedRateLimiter *)self->_rateLimiter tryToIncrementCountAndReturnSuccess])
  {
    updateQueue = self->_updateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__ATXCandidateRelevanceModelServerCoordinator_sendSuggestionsToBlendingForEachConfigImmediately__block_invoke;
    block[3] = &unk_1E68AB818;
    block[4] = self;
    dispatch_sync(updateQueue, block);
  }
  else
  {
    id v4 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      *(_DWORD *)buf = 138412290;
      int v9 = v6;
      _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "%@ - Encountered rate limit. Not updating predictions immediately.", buf, 0xCu);
    }
  }
}

uint64_t __96__ATXCandidateRelevanceModelServerCoordinator_sendSuggestionsToBlendingForEachConfigImmediately__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendSuggestionsToBlendingForEachConfigIfCacheIsOlderThan:0.0];
}

- (void)sendSuggestionsToBlendingForEachConfigIfCacheIsOlderThan:(double)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v29 = (void *)os_transaction_create();
  id v5 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138412290;
    v36 = v7;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%@ - Beginning model serving for all configs.", buf, 0xCu);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v8 = self->_configs;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    unint64_t v12 = 0x1E4F1C000uLL;
    v30 = self;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v15 = [(ATXCandidateRelevanceModelServerCoordinator *)self lastCacheUpdateDateForConfig:v14];
        [v15 timeIntervalSinceNow];
        double v17 = -v16;
        if (v15) {
          BOOL v18 = v17 <= a3;
        }
        else {
          BOOL v18 = 0;
        }
        if (v18)
        {
          objc_super v20 = __atxlog_handle_relevance_model();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v21 = (objc_class *)objc_opt_class();
            v22 = NSStringFromClass(v21);
            v23 = [v14 clientModel];
            [v23 clientModelId];
            uint64_t v24 = v10;
            uint64_t v25 = v11;
            v26 = v8;
            v28 = unint64_t v27 = v12;
            *(_DWORD *)buf = 138412802;
            v36 = v22;
            __int16 v37 = 2048;
            double v38 = v17;
            __int16 v39 = 2112;
            v40 = v28;
            _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEFAULT, "%@ - Skipping model serving due to recent cache update %f seconds ago for model id %@", buf, 0x20u);

            unint64_t v12 = v27;
            long long v8 = v26;
            uint64_t v11 = v25;
            uint64_t v10 = v24;
            self = v30;
          }
        }
        else
        {
          v19 = [*(id *)(v12 + 2504) now];
          [(ATXCandidateRelevanceModelServerCoordinator *)self setCacheUpdateDate:v19 forConfig:v14];

          [(ATXCandidateRelevanceModelServerCoordinator *)self sendSuggestionsToBlendingForConfig:v14];
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v31 objects:v41 count:16];
    }
    while (v10);
  }
}

- (void)sendSuggestionsToBlendingForConfig:(id)a3
{
  id v3 = a3;
  id v4 = [[ATXCandidateRelevanceModelServer alloc] initWithConfig:v3];

  [(ATXCandidateRelevanceModelServer *)v4 sendSuggestionsToBlending];
}

+ (id)userDefaultsKeyForLastCacheUpdateDateForConfig:(id)a3
{
  id v3 = a3;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 clientModel];

  int v7 = [v6 clientModelId];
  long long v8 = [@"ATXCandidateRelevanceModelServerCoordinator-ClientModelLastCacheUpdateDate" stringByAppendingFormat:@"-%@-%@", v5, v7];

  return v8;
}

- (id)lastCacheUpdateDateForConfig:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() userDefaultsKeyForLastCacheUpdateDateForConfig:v4];

  uint64_t v6 = [(NSUserDefaults *)self->_defaults objectForKey:v5];

  return v6;
}

- (void)setCacheUpdateDate:(id)a3 forConfig:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() userDefaultsKeyForLastCacheUpdateDateForConfig:v6];

  [(NSUserDefaults *)self->_defaults setObject:v7 forKey:v8];
}

- (void)_syncForTests
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_configs, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_contextHelper, 0);
}

- (void)registerAnchorEventNotificationsForAnchor:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ - (%@) Done registering.", v4, v5, v6, v7, v8);
}

- (void)registerAnchorEventNotificationsForAnchor:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ - (%@) Setting up Anchor Event invalidation listener.", v4, v5, v6, v7, v8);
}

- (void)registerAnchorEventNotificationsForAnchor:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1 = (objc_class *)objc_opt_class();
  uint64_t v2 = NSStringFromClass(v1);
  OUTLINED_FUNCTION_0_1();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "%@ - (%@) Tried to register for real-time notifications, but the Anchor doesn't support the ContextStore and it's not another known anchor.", v3, 0x16u);
}

- (void)registerAnchorEventNotificationsForAnchor:.cold.4()
{
  OUTLINED_FUNCTION_2_0();
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ - (%@) Setting up Anchor Event listener.", v4, v5, v6, v7, v8);
}

- (void)unregisterAnchorEventListenerForAnchor:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ - (%@) Done unregistering.", v4, v5, v6, v7, v8);
}

- (void)unregisterAnchorEventListenerForAnchor:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ - (%@) Unregistering Anchor Event listener.", v4, v5, v6, v7, v8);
}

@end