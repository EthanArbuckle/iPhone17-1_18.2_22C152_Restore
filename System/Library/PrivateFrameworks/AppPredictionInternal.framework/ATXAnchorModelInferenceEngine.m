@interface ATXAnchorModelInferenceEngine
+ (id)sharedInstance;
- (ATXAnchorModelInferenceEngine)init;
- (id)currentDuetEventForAnchor:(id)a3;
- (id)entranceCallbackForAnchor:(id)a3;
- (id)exitCallbackForAnchor:(id)a3;
- (id)exitNotificationIdentifierForAnchor:(id)a3;
- (id)notificationIdentifierForAnchor:(id)a3;
- (id)supportedAnchorsForInference;
- (void)dealloc;
- (void)handleAnchorEventForAnchor:(id)a3;
- (void)handleAnchorEventForGymArrival;
- (void)handleAnchorEventForIdleTimeBegin;
- (void)handleAnchorEventForMicrolocationVisitAnchor;
- (void)handleAnchorExitEventForGymArrival;
- (void)handleInferenceEvent:(id)a3;
- (void)handleLOIEntrance;
- (void)handleLOIExit;
- (void)queueHandleInferenceEvent:(id)a3;
- (void)registerAnchorEventListenerForAnchor:(id)a3;
- (void)registerAnchorEventListeners;
- (void)registerForAnchorEntrance:(id)a3 cdContext:(id)a4;
- (void)registerForAnchorExit:(id)a3 cdContext:(id)a4;
- (void)registerForWakingNotificationForAnchor:(id)a3 cdContext:(id)a4;
- (void)retryPreviouslyIncompleteInference;
- (void)setupContextStoreListenerForAnchor:(id)a3 context:(id)a4;
- (void)start;
- (void)unregisterAnchorEventListenerForAnchor:(id)a3;
- (void)unregisterAnchorEventListeners;
@end

@implementation ATXAnchorModelInferenceEngine

+ (id)sharedInstance
{
  v2 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "Starting Anchor Model Inference Engine.", v5, 2u);
  }

  if (sharedInstance__pasOnceToken7_1 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken7_1, &__block_literal_global_248);
  }
  v3 = (void *)sharedInstance__pasExprOnceResult_55;
  return v3;
}

void __47__ATXAnchorModelInferenceEngine_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_55;
  sharedInstance__pasExprOnceResult_55 = v1;
}

- (ATXAnchorModelInferenceEngine)init
{
  v16.receiver = self;
  v16.super_class = (Class)ATXAnchorModelInferenceEngine;
  v2 = [(ATXAnchorModelInferenceEngine *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v2->_started = 0;
    uint64_t v4 = objc_opt_new();
    predictionScheduler = v3->_predictionScheduler;
    v3->_predictionScheduler = (ATXAnchorModelPredictionScheduler *)v4;

    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    id v7 = objc_claimAutoreleasedReturnValue();
    v8 = (const char *)[v7 UTF8String];
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v10;

    id v12 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v13 = [v12 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    defaults = v3->_defaults;
    v3->_defaults = (NSUserDefaults *)v13;
  }
  return v3;
}

- (void)dealloc
{
  [(ATXAnchorModelInferenceEngine *)self unregisterAnchorEventListeners];
  v3.receiver = self;
  v3.super_class = (Class)ATXAnchorModelInferenceEngine;
  [(ATXAnchorModelInferenceEngine *)&v3 dealloc];
}

- (void)start
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Attempted to start Anchor Model Inference Engine, even though it's already running.", v1, 2u);
}

uint64_t __38__ATXAnchorModelInferenceEngine_start__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) retryPreviouslyIncompleteInference];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v2 scheduleExistingPredictions];
}

- (id)supportedAnchorsForInference
{
  v2 = +[ATXAnchorModelHyperParameters sharedInstance];
  objc_super v3 = [v2 enabledAnchors];
  uint64_t v4 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_22_1);

  return v4;
}

id __61__ATXAnchorModelInferenceEngine_supportedAnchorsForInference__block_invoke(int a1, NSString *aClassName)
{
  NSClassFromString(aClassName);
  v2 = objc_opt_new();
  return v2;
}

- (void)registerAnchorEventListeners
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = [(ATXAnchorModelInferenceEngine *)self supportedAnchorsForInference];
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
        [(ATXAnchorModelInferenceEngine *)self registerAnchorEventListenerForAnchor:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)registerAnchorEventListenerForAnchor:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(id)objc_opt_class() usesContextStoreForRealTimeNotifications])
  {
    if ([(id)objc_opt_class() anchorType] == 19)
    {
      uint64_t v6 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[ATXAnchorModelInferenceEngine registerAnchorEventListenerForAnchor:]();
      }

      [(id)objc_opt_class() registerForNotificationsWithoutUsingContextStoreForObserver:self enterSelector:sel_handleAnchorEventForMicrolocationVisitAnchor exitSelector:0];
      uint64_t v7 = __atxlog_handle_anchor();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_30;
      }
    }
    else if ([(id)objc_opt_class() anchorType] == 7)
    {
      long long v8 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[ATXAnchorModelInferenceEngine registerAnchorEventListenerForAnchor:]();
      }

      [(id)objc_opt_class() registerForNotificationsWithoutUsingContextStoreForObserver:self enterSelector:sel_handleLOIEntrance exitSelector:0];
      uint64_t v7 = __atxlog_handle_anchor();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_30;
      }
    }
    else
    {
      if ([(id)objc_opt_class() anchorType] != 8)
      {
        if ([(id)objc_opt_class() anchorType] == 3)
        {
          long long v10 = __atxlog_handle_anchor();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            int v13 = 138412290;
            id v14 = v4;
            _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "Inference: (%@) Setting up Anchor Event listener.", (uint8_t *)&v13, 0xCu);
          }

          [(id)objc_opt_class() registerForNotificationsWithoutUsingContextStoreForObserver:self enterSelector:sel_handleAnchorEventForIdleTimeBegin exitSelector:0];
          uint64_t v7 = __atxlog_handle_anchor();
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_30;
          }
          int v13 = 138412290;
          id v14 = v4;
        }
        else
        {
          uint64_t v11 = [(id)objc_opt_class() anchorType];
          id v12 = __atxlog_handle_anchor();
          uint64_t v5 = v12;
          if (v11 != 22)
          {
            if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
              -[ATXAnchorModelInferenceEngine registerAnchorEventListenerForAnchor:].cold.7();
            }
            goto LABEL_3;
          }
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            int v13 = 138412290;
            id v14 = v4;
            _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Inference: (%@) Setting up Anchor Event listener.", (uint8_t *)&v13, 0xCu);
          }

          [(id)objc_opt_class() registerForNotificationsWithoutUsingContextStoreForObserver:self enterSelector:sel_handleAnchorEventForGymArrival exitSelector:sel_handleAnchorExitEventForGymArrival];
          uint64_t v7 = __atxlog_handle_anchor();
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
LABEL_30:

            goto LABEL_31;
          }
          int v13 = 138412290;
          id v14 = v4;
        }
        _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "Inference: (%@) Done registering.", (uint8_t *)&v13, 0xCu);
        goto LABEL_30;
      }
      long long v9 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[ATXAnchorModelInferenceEngine registerAnchorEventListenerForAnchor:]();
      }

      [(id)objc_opt_class() registerForNotificationsWithoutUsingContextStoreForObserver:self enterSelector:sel_handleLOIExit exitSelector:0];
      uint64_t v7 = __atxlog_handle_anchor();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_30;
      }
    }
    -[ATXAnchorModelInferenceEngine registerAnchorEventListenerForAnchor:]();
    goto LABEL_30;
  }
  uint64_t v5 = [(ATXCoreDuetContextHelper *)self->_contextHelper context];
  [(ATXAnchorModelInferenceEngine *)self setupContextStoreListenerForAnchor:v4 context:v5];
LABEL_3:

LABEL_31:
}

- (void)unregisterAnchorEventListeners
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = [(ATXAnchorModelInferenceEngine *)self supportedAnchorsForInference];
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
        [(ATXAnchorModelInferenceEngine *)self unregisterAnchorEventListenerForAnchor:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
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
     || [(id)objc_opt_class() anchorType] == 7
     || [(id)objc_opt_class() anchorType] == 3
     || [(id)objc_opt_class() anchorType] == 22))
  {
    uint64_t v5 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ATXAnchorModelInferenceEngine unregisterAnchorEventListenerForAnchor:]();
    }

    [(id)objc_opt_class() unregisterForNotificationsWithoutUsingContextStoreForObserver:self];
    uint64_t v6 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[ATXAnchorModelInferenceEngine unregisterAnchorEventListenerForAnchor:]();
    }
  }
}

- (void)handleLOIEntrance
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ATXAnchorModelInferenceEngine_handleLOIEntrance__block_invoke;
  block[3] = &unk_1E68AB818;
  block[4] = self;
  dispatch_async(queue, block);
}

void __50__ATXAnchorModelInferenceEngine_handleLOIEntrance__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (id)objc_opt_new();
  [v1 handleAnchorEventForAnchor:v2];
}

- (void)handleLOIExit
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__ATXAnchorModelInferenceEngine_handleLOIExit__block_invoke;
  block[3] = &unk_1E68AB818;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__ATXAnchorModelInferenceEngine_handleLOIExit__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (id)objc_opt_new();
  [v1 handleAnchorEventForAnchor:v2];
}

- (void)setupContextStoreListenerForAnchor:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelInferenceEngine registerAnchorEventListenerForAnchor:]();
  }

  [(ATXAnchorModelInferenceEngine *)self registerForWakingNotificationForAnchor:v6 cdContext:v7];
}

- (void)registerForWakingNotificationForAnchor:(id)a3 cdContext:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v8 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_INFO, "Inference: (%@) Registering with ContextStore for Anchor Event callbacks.", (uint8_t *)&v10, 0xCu);
  }

  [(ATXAnchorModelInferenceEngine *)self registerForAnchorEntrance:v6 cdContext:v7];
  [(ATXAnchorModelInferenceEngine *)self registerForAnchorExit:v6 cdContext:v7];

  long long v9 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Inference: (%@) Done registering with the ContextStore.", (uint8_t *)&v10, 0xCu);
  }
}

- (void)registerForAnchorEntrance:(id)a3 cdContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelInferenceEngine registerForAnchorEntrance:cdContext:]();
  }

  long long v9 = objc_opt_class();
  int v10 = [(ATXAnchorModelInferenceEngine *)self entranceCallbackForAnchor:v6];
  id v11 = [(ATXAnchorModelInferenceEngine *)self notificationIdentifierForAnchor:v6];
  [v9 registerWithContextStoreForAnchorEntranceWithCallback:v10 notificationId:v11 registrationPersistenceContext:v7];

  uint64_t v12 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelInferenceEngine registerForAnchorEntrance:cdContext:]();
  }
}

- (void)registerForAnchorExit:(id)a3 cdContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelInferenceEngine registerForAnchorExit:cdContext:]();
  }

  long long v9 = [(id)objc_opt_class() invalidationPredicateForContextStoreRegistration];
  if (v9)
  {
    int v10 = objc_opt_class();
    id v11 = [(ATXAnchorModelInferenceEngine *)self exitCallbackForAnchor:v6];
    uint64_t v12 = [(ATXAnchorModelInferenceEngine *)self exitNotificationIdentifierForAnchor:v6];
    [v10 registerWithContextStoreForAnchorExitWithCallback:v11 notificationId:v12 registrationPersistenceContext:v7];

    uint64_t v13 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[ATXAnchorModelInferenceEngine registerForAnchorExit:cdContext:]();
    }
  }
  else
  {
    uint64_t v13 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[ATXAnchorModelInferenceEngine registerForAnchorExit:cdContext:]();
    }
  }
}

- (void)retryPreviouslyIncompleteInference
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_opt_new();
  id v4 = [v3 inferenceEventsToTryAgain];

  uint64_t v5 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = [v4 count];
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Retrieved %lu incomplete inference events from Inference Tracker.", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x1D25F6CC0]();
        uint64_t v13 = __atxlog_handle_anchor();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v21 = v11;
          _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "Retrying inference event: %@", buf, 0xCu);
        }

        [(ATXAnchorModelInferenceEngine *)self handleInferenceEvent:v11];
        id v14 = __atxlog_handle_anchor();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v21 = v11;
          _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "Sucessfully finished retrying inference event: %@", buf, 0xCu);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)handleAnchorEventForMicrolocationVisitAnchor
{
  objc_super v3 = objc_opt_new();
  id v4 = [(ATXAnchorModelInferenceEngine *)self currentDuetEventForAnchor:v3];

  if (v4)
  {
    uint64_t v5 = [v4 identifier];
    id v6 = [(NSUserDefaults *)self->_defaults stringForKey:@"ATXMicrolocationAnchorLastIdentifierKey"];
    int v7 = [v5 isEqualToString:v6];

    if (v7)
    {
      uint64_t v8 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Received a high confidence anchor event, but ignoring since it's the same event as what we received last time.", v14, 2u);
      }
    }
    else
    {
      defaults = self->_defaults;
      int v10 = [v4 identifier];
      [(NSUserDefaults *)defaults setValue:v10 forKey:@"ATXMicrolocationAnchorLastIdentifierKey"];

      uint64_t v11 = [ATXAnchorModelIncompleteInferenceEvent alloc];
      uint64_t v12 = objc_opt_new();
      uint64_t v13 = [(ATXAnchorModelIncompleteInferenceEvent *)v11 initWithAnchor:v12 anchorEvent:v4];

      [(ATXAnchorModelInferenceEngine *)self queueHandleInferenceEvent:v13];
    }
  }
}

- (void)handleAnchorEventForIdleTimeBegin
{
  objc_super v3 = [ATXScreenLockStateDuetEvent alloc];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:10800.0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:21600.0];
  uint64_t v9 = [(ATXScreenLockStateDuetEvent *)v3 initWithScreenLockState:1 startDate:v4 endDate:v5];

  id v6 = [ATXAnchorModelIncompleteInferenceEvent alloc];
  int v7 = objc_opt_new();
  uint64_t v8 = [(ATXAnchorModelIncompleteInferenceEvent *)v6 initWithAnchor:v7 anchorEvent:v9];

  [(ATXAnchorModelInferenceEngine *)self queueHandleInferenceEvent:v8];
}

- (void)handleAnchorEventForGymArrival
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_opt_new();
  id v4 = [(ATXAnchorModelInferenceEngine *)self currentDuetEventForAnchor:v3];
  if (v4)
  {
    uint64_t v5 = [[ATXAnchorModelIncompleteInferenceEvent alloc] initWithAnchor:v3 anchorEvent:v4];
    [(ATXAnchorModelInferenceEngine *)self queueHandleInferenceEvent:v5];
  }
  else
  {
    id v6 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      uint64_t v8 = v3;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "Unable to retrieve current event for anchor: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)handleAnchorExitEventForGymArrival
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_opt_new();
  id v4 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    int v7 = v3;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "Removing suggestions for anchor due to exit event: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = objc_opt_new();
  [v5 clearAllIncompleteInferenceEvents];

  [(ATXAnchorModelPredictionScheduler *)self->_predictionScheduler clearPredictionsForAnchor:v3];
}

- (void)handleAnchorEventForAnchor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATXAnchorModelInferenceEngine *)self currentDuetEventForAnchor:v4];
  if (v5)
  {
    int v6 = [[ATXAnchorModelIncompleteInferenceEvent alloc] initWithAnchor:v4 anchorEvent:v5];
    [(ATXAnchorModelInferenceEngine *)self handleInferenceEvent:v6];
  }
  else
  {
    int v7 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[ATXAnchorModelInferenceEngine handleAnchorEventForAnchor:]();
    }
  }
}

- (id)currentDuetEventForAnchor:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedDuetDataProviderClass"), "supportedDuetEventClass")), "initWithCurrentContextStoreValues");
  if (([(id)objc_opt_class() anchorType] & 0xFFFFFFFFFFFFFFFELL) != 0x14)
  {
LABEL_9:
    id v5 = v4;
    goto LABEL_10;
  }
  if (![(id)objc_opt_class() isActive])
  {
    int v6 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v7 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[ATXAnchorModelInferenceEngine currentDuetEventForAnchor:]();
    }

    goto LABEL_9;
  }
  [(id)objc_opt_class() secondsOfInfluence];
  objc_msgSend(v4, "convertToUpcomingCommuteEventWithWindowDuration:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  int v6 = v5;
LABEL_11:

  return v6;
}

- (void)queueHandleInferenceEvent:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ATXAnchorModelInferenceEngine_queueHandleInferenceEvent___block_invoke;
  v7[3] = &unk_1E68AB870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __59__ATXAnchorModelInferenceEngine_queueHandleInferenceEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleInferenceEvent:*(void *)(a1 + 40)];
}

- (void)handleInferenceEvent:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 anchor];

  if (v5)
  {
    id v6 = objc_opt_new();
    [v6 trackInferenceStartedForInferenceEvent:v4];

    int v7 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 anchor];
      uint64_t v9 = [v4 anchorEvent];
      int v21 = 138412546;
      uint64_t v22 = (uint64_t)v8;
      __int16 v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "Inference: Handling anchor event for anchor: %@, anchorEvent: %@", (uint8_t *)&v21, 0x16u);
    }
    int v10 = [ATXAnchorModelAnchorEventHandler alloc];
    uint64_t v11 = [v4 anchor];
    uint64_t v12 = [v4 anchorEvent];
    uint64_t v13 = [(ATXAnchorModelAnchorEventHandler *)v10 initWithAnchor:v11 anchorEvent:v12];

    id v14 = [v13 predictionsForAnchorEvent];
    long long v15 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v14 count];
      int v21 = 134217984;
      uint64_t v22 = v16;
      _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "Inference: Generated %lu anchor model predictions. Sending predictions to the scheduler...", (uint8_t *)&v21, 0xCu);
    }

    predictionScheduler = self->_predictionScheduler;
    long long v18 = [v4 anchor];
    [(ATXAnchorModelPredictionScheduler *)predictionScheduler schedulePredictions:v14 anchor:v18];

    v19 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, "Inference: Sent predictions to scheduler. [Done]", (uint8_t *)&v21, 2u);
    }

    v20 = objc_opt_new();
    [v20 trackInferenceFinishedForInferenceEvent:v4];
  }
  else
  {
    uint64_t v13 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[ATXAnchorModelInferenceEngine handleInferenceEvent:]();
    }
  }
}

- (id)notificationIdentifierForAnchor:(id)a3
{
  id v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 anchorTypeString];

  int v7 = (void *)[v5 initWithFormat:@"com.apple.duetexpertd.ATXAnchorModel.%@", v6];
  return v7;
}

- (id)exitNotificationIdentifierForAnchor:(id)a3
{
  id v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 anchorTypeString];

  int v7 = (void *)[v5 initWithFormat:@"com.apple.duetexpertd.ATXAnchorModel.invalidate.%@", v6];
  return v7;
}

- (id)entranceCallbackForAnchor:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__ATXAnchorModelInferenceEngine_entranceCallbackForAnchor___block_invoke;
  aBlock[3] = &unk_1E68B64C0;
  id v10 = v4;
  id v5 = v4;
  objc_copyWeak(&v11, &location);
  id v6 = _Block_copy(aBlock);
  int v7 = _Block_copy(v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v7;
}

void __59__ATXAnchorModelInferenceEngine_entranceCallbackForAnchor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "Inference: (%@) Anchor Event listener called, %@. Generating new predictions", buf, 0x16u);
  }

  id v6 = (void *)os_transaction_create();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && [(id)objc_opt_class() shouldProcessContextStoreNotification])
  {
    id v8 = WeakRetained[4];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__ATXAnchorModelInferenceEngine_entranceCallbackForAnchor___block_invoke_54;
    block[3] = &unk_1E68AC320;
    block[4] = WeakRetained;
    id v10 = *(id *)(a1 + 32);
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

id __59__ATXAnchorModelInferenceEngine_entranceCallbackForAnchor___block_invoke_54(uint64_t a1)
{
  return self;
}

- (id)exitCallbackForAnchor:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__ATXAnchorModelInferenceEngine_exitCallbackForAnchor___block_invoke;
  aBlock[3] = &unk_1E68B64C0;
  id v10 = v4;
  id v5 = v4;
  objc_copyWeak(&v11, &location);
  id v6 = _Block_copy(aBlock);
  int v7 = _Block_copy(v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v7;
}

void __55__ATXAnchorModelInferenceEngine_exitCallbackForAnchor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "Inference: (%@) Exit Anchor Event listener called, %@. Clearing predictions.", buf, 0x16u);
  }

  id v6 = (void *)os_transaction_create();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && [(id)objc_opt_class() shouldProcessContextStoreNotification])
  {
    id v8 = WeakRetained[4];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__ATXAnchorModelInferenceEngine_exitCallbackForAnchor___block_invoke_56;
    block[3] = &unk_1E68AC320;
    block[4] = WeakRetained;
    id v10 = *(id *)(a1 + 32);
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

id __55__ATXAnchorModelInferenceEngine_exitCallbackForAnchor___block_invoke_56(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = objc_opt_new();
  [v2 clearAllIncompleteInferenceEvents];

  [*(id *)(*(void *)(a1 + 32) + 16) clearPredictionsForAnchor:*(void *)(a1 + 40)];
  id v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "Inference: (%@) Done clearing predictions.", (uint8_t *)&v6, 0xCu);
  }

  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_predictionScheduler, 0);
  objc_storeStrong((id *)&self->_contextHelper, 0);
}

- (void)registerAnchorEventListenerForAnchor:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Inference: (%@) Done registering.", v2, v3, v4, v5, v6);
}

- (void)registerAnchorEventListenerForAnchor:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Inference: (%@) Setting up Anchor Event listener.", v2, v3, v4, v5, v6);
}

- (void)registerAnchorEventListenerForAnchor:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "Inference: (%@) Tried to register for real-time notifications, but the Anchor doesn't support the ContextStore and it's not another known anchor.", v2, v3, v4, v5, v6);
}

- (void)unregisterAnchorEventListenerForAnchor:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Inference: (%@) Done unregistering.", v2, v3, v4, v5, v6);
}

- (void)unregisterAnchorEventListenerForAnchor:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Inference: (%@) Unregistering Anchor Event listener.", v2, v3, v4, v5, v6);
}

- (void)registerForAnchorEntrance:cdContext:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Inference: (%@) ...done registering for anchor context entrance.", v2, v3, v4, v5, v6);
}

- (void)registerForAnchorEntrance:cdContext:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Inference: (%@) registering for anchor context entrance...", v2, v3, v4, v5, v6);
}

- (void)registerForAnchorExit:cdContext:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Inference: (%@) ...anchor doesn't have an invalidation predicate. Not registering for exit. Done.", v2, v3, v4, v5, v6);
}

- (void)registerForAnchorExit:cdContext:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Inference: (%@) ...done registering for anchor context exit.", v2, v3, v4, v5, v6);
}

- (void)registerForAnchorExit:cdContext:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Inference: (%@) registering for anchor context exit...", v2, v3, v4, v5, v6);
}

- (void)handleAnchorEventForAnchor:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "Inference: (%@) - handleAnchorEventForAnchor. Failed to initialize a DuetEvent for the Anchor Event from the ContextStore. Exiting early, and dropping the Anchor Event on the floor.", v2, v3, v4, v5, v6);
}

- (void)currentDuetEventForAnchor:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "Upcoming commute anchor retrieved an event that wasn't ATXTripDuetEvent: %@", v2, v3, v4, v5, v6);
}

- (void)handleInferenceEvent:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "Unable to handle inference event because anchor was nil. Inference event: %@", v2, v3, v4, v5, v6);
}

@end