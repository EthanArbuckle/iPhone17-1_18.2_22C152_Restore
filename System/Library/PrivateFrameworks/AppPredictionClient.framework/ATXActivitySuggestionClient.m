@interface ATXActivitySuggestionClient
+ (Class)ATXTriggerClassFromDNDModeConfigurationTrigger:(id)a3;
+ (Class)DNDModeConfigurationTriggerClassFromATXTrigger:(id)a3;
+ (id)sharedInstance;
- (ATXActivitySuggestionClient)init;
- (ATXActivitySuggestionClient)initWithRoutineManager:(id)a3;
- (BOOL)_activityIsEligibleForSetUpSuggestion:(id)a3 modeGlobals:(id)a4;
- (BOOL)_activityIsEligibleForTriggerSuggestion:(id)a3 modeGlobals:(id)a4;
- (BOOL)_shouldSendAutomationSuggestionForMode:(int)a3;
- (BOOL)_shouldSendModeSetUpSuggestionAtEndOfModeToLockScreen:(id)a3 modeGlobals:(id)a4;
- (BOOL)_shouldSendModeTriggerSuggestionAtEndOfModeToLockScreen:(id)a3 modeGlobals:(id)a4;
- (CLCircularRegion)homeRegion;
- (CLCircularRegion)workRegion;
- (id)DNDModeConfigurationTriggersToATXTriggers:(id)a3;
- (id)_activityForEvent:(id)a3;
- (id)_suggestionWithActivity:(id)a3 modeGlobals:(id)a4;
- (id)currentSuggestion;
- (id)localizedSuggestionReasonForBMInferredModeEvent:(id)a3;
- (id)previousSuggestion;
- (id)suggestionWithUUID:(id)a3;
- (id)triggersToDNDModeConfigurationTriggers:(id)a3;
- (void)_fetchAndCacheLOIs;
- (void)_logFeedbackEventForActivitySetUpSuggestionWithSuggestionUUID:(id)a3 eventType:(unint64_t)a4 acceptedTriggers:(id)a5 location:(unint64_t)a6;
- (void)_logFeedbackEventForConfiguredActivitySuggestionWithSuggestionUUID:(id)a3 eventType:(unint64_t)a4 location:(unint64_t)a5;
- (void)_logFeedbackEventForSuggestionUUID:(id)a3 suggestionType:(unint64_t)a4 eventType:(unint64_t)a5 acceptedTriggers:(id)a6 location:(unint64_t)a7;
- (void)_logFeedbackEventForTriggerSuggestionWithSuggestionUUID:(id)a3 eventType:(unint64_t)a4 acceptedTriggers:(id)a5 location:(unint64_t)a6;
- (void)_modeDidChange;
- (void)_setUpPublisherIfNecessary;
- (void)currentSuggestionWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)didShowActivitySetUpSuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4;
- (void)didShowConfiguredActivitySuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4;
- (void)didShowTriggerSuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4;
- (void)registerObserver:(id)a3;
- (void)registerObserver:(id)a3 sendingInitialChangeNotification:(BOOL)a4;
- (void)removeObserver:(id)a3;
- (void)setHomeRegion:(id)a3;
- (void)setWorkRegion:(id)a3;
- (void)userDidAcceptActivitySetUpSuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4;
- (void)userDidAcceptConfiguredActivitySuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4;
- (void)userDidAcceptTriggerSuggestionWithSuggestionUUID:(id)a3 acceptedTriggers:(id)a4 location:(unint64_t)a5;
- (void)userDidFinishActivitySetUpWithSuggestionUUID:(id)a3 acceptedTriggers:(id)a4 location:(unint64_t)a5;
- (void)userDidRejectActivitySetUpSuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4;
- (void)userDidRejectConfiguredActivitySuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4;
- (void)userDidRejectTriggerSuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4;
- (void)userDidSeeActivitySetUpSuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4;
- (void)userDidSeeConfiguredActivitySuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4;
- (void)userDidSeeTriggerSuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4;
@end

@implementation ATXActivitySuggestionClient

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_8 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_8, &__block_literal_global_48);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_9;

  return v2;
}

void __45__ATXActivitySuggestionClient_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_9;
  sharedInstance__pasExprOnceResult_9 = v1;
}

- (ATXActivitySuggestionClient)init
{
  v3 = objc_opt_new();
  v4 = [(ATXActivitySuggestionClient *)self initWithRoutineManager:v3];

  return v4;
}

- (ATXActivitySuggestionClient)initWithRoutineManager:(id)a3
{
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)ATXActivitySuggestionClient;
  v6 = [(ATXActivitySuggestionClient *)&v30 init];
  if (v6)
  {
    v7 = __atxlog_handle_modes();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "Creating ATXActivitySuggestionClient", (uint8_t *)buf, 2u);
    }

    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("ATXActivitySuggestionClient.queue", v10);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    v13 = BiomeLibrary();
    v14 = [v13 UserFocus];
    uint64_t v15 = [v14 InferredMode];
    inferredModeStream = v6->_inferredModeStream;
    v6->_inferredModeStream = (BMStream *)v15;

    v17 = [[ATXActivitySuggestionFeedbackStream alloc] initWithStoreConfig:0];
    feedbackStream = v6->_feedbackStream;
    v6->_feedbackStream = v17;

    objc_initWeak(buf, v6);
    id v19 = objc_alloc(MEMORY[0x1E4F93B98]);
    v20 = v6->_queue;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __54__ATXActivitySuggestionClient_initWithRoutineManager___block_invoke;
    v27[3] = &unk_1E5D05748;
    objc_copyWeak(&v28, buf);
    uint64_t v21 = [v19 initWithQueue:v20 operation:v27];
    coalescingTimer = v6->_coalescingTimer;
    v6->_coalescingTimer = (_PASSimpleCoalescingTimer *)v21;

    objc_storeStrong((id *)&v6->_routineManager, a3);
    v23 = (void *)MEMORY[0x1E4F93B10];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __54__ATXActivitySuggestionClient_initWithRoutineManager___block_invoke_2;
    v25[3] = &unk_1E5D05748;
    objc_copyWeak(&v26, buf);
    [v23 runBlockWhenDeviceIsClassCUnlockedWithQoS:25 block:v25];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(buf);
  }

  return v6;
}

void __54__ATXActivitySuggestionClient_initWithRoutineManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _modeDidChange];
}

void __54__ATXActivitySuggestionClient_initWithRoutineManager___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fetchAndCacheLOIs];
}

- (void)dealloc
{
  [(BPSSink *)self->_sink cancel];
  v3.receiver = self;
  v3.super_class = (Class)ATXActivitySuggestionClient;
  [(ATXActivitySuggestionClient *)&v3 dealloc];
}

- (void)_setUpPublisherIfNecessary
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "ATXActivitySuggestionClient: Inferred mode stream is nil, trying again", v2, v3, v4, v5, v6);
}

void __57__ATXActivitySuggestionClient__setUpPublisherIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 state];
  uint64_t v4 = __atxlog_handle_modes();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __57__ATXActivitySuggestionClient__setUpPublisherIfNecessary__block_invoke_cold_1(v2, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint8_t v6 = 0;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: done listening to mode events", v6, 2u);
  }
}

void __57__ATXActivitySuggestionClient__setUpPublisherIfNecessary__block_invoke_22(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = [v3 eventBody];
    int v6 = [v5 isStart];

    if (v6)
    {
      v7 = __atxlog_handle_modes();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __57__ATXActivitySuggestionClient__setUpPublisherIfNecessary__block_invoke_22_cold_2((uint64_t)WeakRetained, v3, v7);
      }

      [WeakRetained[7] runAfterDelaySeconds:1 coalescingBehavior:0.5];
    }
  }
  else
  {
    uint64_t v8 = __atxlog_handle_modes();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __57__ATXActivitySuggestionClient__setUpPublisherIfNecessary__block_invoke_22_cold_1();
    }
  }
}

- (void)registerObserver:(id)a3
{
}

- (void)registerObserver:(id)a3 sendingInitialChangeNotification:(BOOL)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = __atxlog_handle_modes();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: registered %@", buf, 0xCu);
  }

  [(NSHashTable *)v7->_observers addObject:v6];
  v9 = (void *)MEMORY[0x1E4F93B10];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__ATXActivitySuggestionClient_registerObserver_sendingInitialChangeNotification___block_invoke;
  v11[3] = &unk_1E5D05AC0;
  v11[4] = v7;
  BOOL v13 = a4;
  id v10 = v6;
  id v12 = v10;
  [v9 runBlockWhenDeviceIsClassCUnlockedWithQoS:25 block:v11];

  objc_sync_exit(v7);
}

void __81__ATXActivitySuggestionClient_registerObserver_sendingInitialChangeNotification___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__ATXActivitySuggestionClient_registerObserver_sendingInitialChangeNotification___block_invoke_2;
  block[3] = &unk_1E5D05AC0;
  uint64_t v1 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  char v4 = *(unsigned char *)(a1 + 48);
  id v3 = v1;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __81__ATXActivitySuggestionClient_registerObserver_sendingInitialChangeNotification___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setUpPublisherIfNecessary];
  if (*(unsigned char *)(a1 + 48))
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v2 = *(void *)(a1 + 32);
      id v3 = *(NSObject **)(v2 + 32);
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __81__ATXActivitySuggestionClient_registerObserver_sendingInitialChangeNotification___block_invoke_3;
      v4[3] = &unk_1E5D04FC8;
      v4[4] = v2;
      id v5 = *(id *)(a1 + 40);
      dispatch_async(v3, v4);
    }
  }
}

void __81__ATXActivitySuggestionClient_registerObserver_sendingInitialChangeNotification___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentSuggestion];
  [*(id *)(a1 + 40) activitySuggestionClient:*(void *)(a1 + 32) didSuggestActivity:v2];
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  char v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_observers removeObject:v5];
  objc_sync_exit(v4);
}

- (id)suggestionWithUUID:(id)a3
{
  char v4 = (objc_class *)MEMORY[0x1E4F93658];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithStream:self->_inferredModeStream];
  v7 = [v6 inferredModeEventWithSuggestionUUID:v5];

  if (v7)
  {
    uint64_t v8 = [(ATXActivitySuggestionClient *)self _activityForEvent:v7];
    if (v8)
    {
      v9 = +[ATXModeGlobals sharedInstance];
      id v10 = [(ATXActivitySuggestionClient *)self _suggestionWithActivity:v8 modeGlobals:v9];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)previousSuggestion
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F93658]) initWithStream:self->_inferredModeStream];
  char v4 = [v3 previousModeEvent];
  id v5 = [v4 eventBody];
  id v6 = [(ATXActivitySuggestionClient *)self _activityForEvent:v5];

  return v6;
}

- (id)currentSuggestion
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F93658]) initWithStream:self->_inferredModeStream];
  char v4 = [v3 currentMode];
  id v5 = [(ATXActivitySuggestionClient *)self _activityForEvent:v4];

  return v5;
}

- (id)_activityForEvent:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (-[ATXActivitySuggestionClient _shouldSendAutomationSuggestionForMode:](self, "_shouldSendAutomationSuggestionForMode:", [v4 modeType]))
    {
      id v6 = [[ATXActivity alloc] initWithBiomeInferredModeEvent:v5];
      goto LABEL_10;
    }
    v7 = __atxlog_handle_modes();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      uint64_t v13 = (int)[v5 modeType];
      uint64_t v8 = "ATXActivitySuggestionClient: last mode is not supported, not sending automation suggestion for mode of type: %lu";
      v9 = v7;
      uint32_t v10 = 12;
      goto LABEL_8;
    }
  }
  else
  {
    v7 = __atxlog_handle_modes();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      uint64_t v8 = "ATXActivitySuggestionClient: no Biome event";
      v9 = v7;
      uint32_t v10 = 2;
LABEL_8:
      _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
    }
  }

  id v6 = 0;
LABEL_10:

  return v6;
}

- (void)currentSuggestionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__ATXActivitySuggestionClient_currentSuggestionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5D064C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __70__ATXActivitySuggestionClient_currentSuggestionWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) currentSuggestion];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)localizedSuggestionReasonForBMInferredModeEvent:(id)a3
{
  id v3 = a3;
  id v4 = [[ATXActivity alloc] initWithBMInferredModeEvent:v3];

  id v5 = [(ATXActivity *)v4 localizedSuggestionReason];

  return v5;
}

- (void)didShowActivitySetUpSuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4
{
}

- (void)userDidSeeActivitySetUpSuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4
{
}

- (void)userDidAcceptActivitySetUpSuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4
{
}

- (void)userDidFinishActivitySetUpWithSuggestionUUID:(id)a3 acceptedTriggers:(id)a4 location:(unint64_t)a5
{
}

- (void)userDidRejectActivitySetUpSuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4
{
}

- (void)didShowTriggerSuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4
{
}

- (void)userDidSeeTriggerSuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4
{
}

- (void)userDidAcceptTriggerSuggestionWithSuggestionUUID:(id)a3 acceptedTriggers:(id)a4 location:(unint64_t)a5
{
}

- (void)userDidRejectTriggerSuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4
{
}

- (void)didShowConfiguredActivitySuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4
{
}

- (void)userDidSeeConfiguredActivitySuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4
{
}

- (void)userDidAcceptConfiguredActivitySuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4
{
}

- (void)userDidRejectConfiguredActivitySuggestionWithSuggestionUUID:(id)a3 location:(unint64_t)a4
{
}

- (void)_logFeedbackEventForActivitySetUpSuggestionWithSuggestionUUID:(id)a3 eventType:(unint64_t)a4 acceptedTriggers:(id)a5 location:(unint64_t)a6
{
}

- (void)_logFeedbackEventForTriggerSuggestionWithSuggestionUUID:(id)a3 eventType:(unint64_t)a4 acceptedTriggers:(id)a5 location:(unint64_t)a6
{
}

- (void)_logFeedbackEventForConfiguredActivitySuggestionWithSuggestionUUID:(id)a3 eventType:(unint64_t)a4 location:(unint64_t)a5
{
}

- (void)_logFeedbackEventForSuggestionUUID:(id)a3 suggestionType:(unint64_t)a4 eventType:(unint64_t)a5 acceptedTriggers:(id)a6 location:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a6;
  queue = self->_queue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __117__ATXActivitySuggestionClient__logFeedbackEventForSuggestionUUID_suggestionType_eventType_acceptedTriggers_location___block_invoke;
  v17[3] = &unk_1E5D07EA8;
  v17[4] = self;
  id v18 = v12;
  id v19 = v13;
  unint64_t v20 = a5;
  unint64_t v21 = a4;
  unint64_t v22 = a7;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(queue, v17);
}

void __117__ATXActivitySuggestionClient__logFeedbackEventForSuggestionUUID_suggestionType_eventType_acceptedTriggers_location___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F93658]) initWithStream:*(void *)(*(void *)(a1 + 32) + 8)];
  id v3 = [v2 inferredModeEventWithSuggestionUUID:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) _activityForEvent:v3];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) DNDModeConfigurationTriggersToATXTriggers:*(void *)(a1 + 48)];
    id v6 = [ATXActivitySuggestionFeedbackEvent alloc];
    v7 = [MEMORY[0x1E4F1C9C8] now];
    id v8 = [(ATXActivitySuggestionFeedbackEvent *)v6 initWithEventDate:v7 activity:v4 acceptedTriggers:v5 eventType:*(void *)(a1 + 56) suggestionType:*(void *)(a1 + 64) location:*(void *)(a1 + 72)];

    v9 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v8;
      _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: Sending feedback event to Biome: %@", (uint8_t *)&v11, 0xCu);
    }

    uint32_t v10 = [*(id *)(*(void *)(a1 + 32) + 16) source];
    [v10 sendEvent:v8];

    +[ATXActivitySuggestionFeedbackLogUploader sendActivitySuggestionEventToCoreAnalytics:v8];
  }
  else
  {
    id v5 = __atxlog_handle_modes();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __117__ATXActivitySuggestionClient__logFeedbackEventForSuggestionUUID_suggestionType_eventType_acceptedTriggers_location___block_invoke_cold_1((uint64_t *)(a1 + 40), (uint64_t)v3, v5);
    }
  }
}

- (BOOL)_shouldSendAutomationSuggestionForMode:(int)a3
{
  if ((a3 - 1) >= 0x11)
  {
    id v5 = __atxlog_handle_modes();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[ATXActivitySuggestionClient _shouldSendAutomationSuggestionForMode:](a3, v5);
    }

    LOBYTE(v3) = 0;
  }
  else
  {
    return (0x1EFFDu >> (a3 - 1)) & 1;
  }
  return v3;
}

- (id)_suggestionWithActivity:(id)a3 modeGlobals:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ATXActivitySuggestionClient *)self _activityIsEligibleForSetUpSuggestion:v6 modeGlobals:v7])
  {
    id v8 = ATXActivitySetUpSuggestion;
  }
  else
  {
    if ([(ATXActivitySuggestionClient *)self _activityIsEligibleForTriggerSuggestion:v6 modeGlobals:v7])
    {
      v9 = [[ATXActivityTriggerSuggestion alloc] initWithActivity:v6 activitySuggestionClient:self];
      goto LABEL_7;
    }
    id v8 = ATXActivitySuggestion;
  }
  v9 = (ATXActivityTriggerSuggestion *)[[v8 alloc] initWithActivity:v6];
LABEL_7:
  uint32_t v10 = v9;

  return v10;
}

- (void)_modeDidChange
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v3 = +[ATXModeGlobals sharedInstance];
  id v4 = [(ATXActivitySuggestionClient *)self previousSuggestion];
  id v5 = [(ATXActivitySuggestionClient *)self currentSuggestion];
  id v6 = __atxlog_handle_modes();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 modeUUID];
    uint64_t v15 = [v5 activityType];
    [v5 activityType];
    id v8 = ATXActivityTypeToString();
    v9 = [v4 modeUUID];
    uint64_t v10 = [v4 activityType];
    [v4 activityType];
    int v11 = ATXActivityTypeToString();
    *(_DWORD *)buf = 138544642;
    unint64_t v21 = v7;
    __int16 v22 = 2048;
    uint64_t v23 = v15;
    __int16 v24 = 2114;
    v25 = v8;
    __int16 v26 = 2114;
    v27 = v9;
    __int16 v28 = 2048;
    uint64_t v29 = v10;
    __int16 v30 = 2114;
    v31 = v11;
    _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: mode did change to: (uuid: %{public}@, modeType: %lu, string: %{public}@) from (uuid: %{public}@, modeType: %lu, string: %{public}@)", buf, 0x3Eu);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ATXActivitySuggestionClient__modeDidChange__block_invoke;
  block[3] = &unk_1E5D07ED0;
  block[4] = self;
  id v17 = v5;
  id v18 = v4;
  id v19 = v3;
  id v12 = v3;
  id v13 = v4;
  id v14 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __45__ATXActivitySuggestionClient__modeDidChange__block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v31 = *(id *)(a1 + 32);
  objc_sync_enter(v31);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v2 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v34 != v3) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v6 = __atxlog_handle_modes();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            id v7 = [*(id *)(a1 + 40) modeUUID];
            uint64_t v8 = [*(id *)(a1 + 40) activityType];
            *(_DWORD *)buf = 138543618;
            v38 = v7;
            __int16 v39 = 2048;
            uint64_t v40 = v8;
            _os_log_impl(&dword_1A790D000, v6, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: didSuggestActivity: %{public}@ (modeType: %lu)", buf, 0x16u);
          }
          [v5 activitySuggestionClient:*(void *)(a1 + 32) didSuggestActivity:*(void *)(a1 + 40)];
        }
        if (objc_opt_respondsToSelector())
        {
          v9 = [*(id *)(a1 + 40) modeUUID];

          if (v9)
          {
            uint64_t v10 = __atxlog_handle_modes();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              int v11 = [*(id *)(a1 + 40) modeUUID];
              uint64_t v12 = [*(id *)(a1 + 40) activityType];
              *(_DWORD *)buf = 138543618;
              v38 = v11;
              __int16 v39 = 2048;
              uint64_t v40 = v12;
              _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: didSuggestConfiguredActivity: %{public}@ (modeType: %lu)", buf, 0x16u);
            }
            id v13 = [[ATXActivitySuggestion alloc] initWithActivity:*(void *)(a1 + 40)];
            [v5 activitySuggestionClient:*(void *)(a1 + 32) didSuggestConfiguredActivity:v13];
          }
          else
          {
            id v14 = [*(id *)(a1 + 48) modeUUID];

            if (v14)
            {
              uint64_t v15 = __atxlog_handle_modes();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A790D000, v15, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: didSuggestConfiguredActivity: nil", buf, 2u);
              }

              [v5 activitySuggestionClient:*(void *)(a1 + 32) didSuggestConfiguredActivity:0];
            }
          }
        }
        if [*(id *)(a1 + 32) _shouldSendModeSetUpSuggestionAtEndOfModeToLockScreen:*(void *)(a1 + 48) modeGlobals:*(void *)(a1 + 56)]&& (objc_opt_respondsToSelector())
        {
          id v16 = __atxlog_handle_modes();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = [*(id *)(a1 + 48) modeUUID];
            uint64_t v18 = [*(id *)(a1 + 48) activityType];
            *(_DWORD *)buf = 138543618;
            v38 = v17;
            __int16 v39 = 2048;
            uint64_t v40 = v18;
            _os_log_impl(&dword_1A790D000, v16, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: didSuggestSettingUpActivity: %{public}@ (modeType: %lu)", buf, 0x16u);
          }
          id v19 = [[ATXActivitySetUpSuggestion alloc] initWithActivity:*(void *)(a1 + 48)];
          [v5 activitySuggestionClient:*(void *)(a1 + 32) didSuggestSettingUpActivity:v19];
LABEL_41:

          continue;
        }
        if [*(id *)(a1 + 32) _shouldSendModeTriggerSuggestionAtEndOfModeToLockScreen:*(void *)(a1 + 48) modeGlobals:*(void *)(a1 + 56)]&& (objc_opt_respondsToSelector())
        {
          unint64_t v20 = __atxlog_handle_modes();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v21 = [*(id *)(a1 + 48) modeUUID];
            uint64_t v22 = [*(id *)(a1 + 48) activityType];
            *(_DWORD *)buf = 138543618;
            v38 = v21;
            __int16 v39 = 2048;
            uint64_t v40 = v22;
            _os_log_impl(&dword_1A790D000, v20, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: didSuggestTriggersForConfiguredActivity: %{public}@ (modeType: %lu)", buf, 0x16u);
          }
          id v19 = [[ATXActivityTriggerSuggestion alloc] initWithActivity:*(void *)(a1 + 48) activitySuggestionClient:*(void *)(a1 + 32)];
          [v5 activitySuggestionClient:*(void *)(a1 + 32) didSuggestTriggersForConfiguredActivity:v19];
          goto LABEL_41;
        }
        if [*(id *)(a1 + 32) _activityIsEligibleForSetUpSuggestion:*(void *)(a1 + 40) modeGlobals:*(void *)(a1 + 56)]&& (objc_msgSend(*(id *)(a1 + 32), "_shouldSendModeSetUpSuggestionAtEndOfModeToLockScreen:modeGlobals:", *(void *)(a1 + 40), *(void *)(a1 + 56)) & 1) == 0&& (objc_opt_respondsToSelector())
        {
          uint64_t v23 = __atxlog_handle_modes();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v24 = [*(id *)(a1 + 40) modeUUID];
            uint64_t v25 = [*(id *)(a1 + 40) activityType];
            *(_DWORD *)buf = 138543618;
            v38 = v24;
            __int16 v39 = 2048;
            uint64_t v40 = v25;
            _os_log_impl(&dword_1A790D000, v23, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: didSuggestSettingUpActivity: %{public}@ (modeType: %lu)", buf, 0x16u);
          }
          id v19 = [[ATXActivitySetUpSuggestion alloc] initWithActivity:*(void *)(a1 + 40)];
          [v5 activitySuggestionClient:*(void *)(a1 + 32) didSuggestSettingUpActivity:v19];
          goto LABEL_41;
        }
        if [*(id *)(a1 + 32) _activityIsEligibleForTriggerSuggestion:*(void *)(a1 + 40) modeGlobals:*(void *)(a1 + 56)]&& (objc_msgSend(*(id *)(a1 + 32), "_shouldSendModeTriggerSuggestionAtEndOfModeToLockScreen:modeGlobals:", *(void *)(a1 + 40), *(void *)(a1 + 56)) & 1) == 0&& (objc_opt_respondsToSelector())
        {
          __int16 v26 = __atxlog_handle_modes();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = [*(id *)(a1 + 40) modeUUID];
            uint64_t v28 = [*(id *)(a1 + 40) activityType];
            *(_DWORD *)buf = 138543618;
            v38 = v27;
            __int16 v39 = 2048;
            uint64_t v40 = v28;
            _os_log_impl(&dword_1A790D000, v26, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: didSuggestTriggersForConfiguredActivity: %{public}@ (modeType: %lu)", buf, 0x16u);
          }
          id v19 = [[ATXActivityTriggerSuggestion alloc] initWithActivity:*(void *)(a1 + 40) activitySuggestionClient:*(void *)(a1 + 32)];
          [v5 activitySuggestionClient:*(void *)(a1 + 32) didSuggestTriggersForConfiguredActivity:v19];
          goto LABEL_41;
        }
        if [*(id *)(a1 + 32) _activityIsEligibleForSetUpSuggestion:*(void *)(a1 + 48) modeGlobals:*(void *)(a1 + 56)]&& (objc_opt_respondsToSelector())
        {
          uint64_t v29 = __atxlog_handle_modes();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A790D000, v29, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: didSuggestSettingUpActivity: nil", buf, 2u);
          }

          [v5 activitySuggestionClient:*(void *)(a1 + 32) didSuggestSettingUpActivity:0];
        }
        else if [*(id *)(a1 + 32) _activityIsEligibleForTriggerSuggestion:*(void *)(a1 + 48) modeGlobals:*(void *)(a1 + 56)]&& (objc_opt_respondsToSelector())
        {
          __int16 v30 = __atxlog_handle_modes();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A790D000, v30, OS_LOG_TYPE_DEFAULT, "ATXActivitySuggestionClient: didSuggestTriggersForConfiguredActivity: nil", buf, 2u);
          }

          [v5 activitySuggestionClient:*(void *)(a1 + 32) didSuggestTriggersForConfiguredActivity:0];
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v2);
  }

  objc_sync_exit(v31);
}

- (BOOL)_activityIsEligibleForSetUpSuggestion:(id)a3 modeGlobals:(id)a4
{
  id v5 = a3;
  int v6 = [a4 isSetupSuggestionsForFocusEnabled];
  BOOL v7 = 0;
  if (v5 && v6)
  {
    uint64_t v8 = [v5 modeUUID];

    BOOL v7 = v8 == 0;
  }

  return v7;
}

- (BOOL)_activityIsEligibleForTriggerSuggestion:(id)a3 modeGlobals:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [a4 isAutomationTriggerSuggestionsForFocusEnabled];
  LOBYTE(a4) = 0;
  if (v5)
  {
    if (v6)
    {
      a4 = [v5 modeUUID];

      if (a4)
      {
        if ([v5 shouldSuggestTriggers])
        {
          unint64_t v8 = [v5 activityType];
          LOBYTE(a4) = 1;
          if (v8 <= 0x11 && ((1 << v8) & 0x2EF38) != 0)
          {
            v9 = [v5 triggers];
            uint64_t v10 = [(ATXActivitySuggestionClient *)self triggersToDNDModeConfigurationTriggers:v9];

            long long v19 = 0u;
            long long v20 = 0u;
            long long v17 = 0u;
            long long v18 = 0u;
            id v11 = v10;
            uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v14 = *(void *)v18;
              while (2)
              {
                for (uint64_t i = 0; i != v13; ++i)
                {
                  if (*(void *)v18 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    __atxlog_handle_modes();
                    a4 = (id)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_ERROR)) {
                      -[ATXActivitySuggestionClient _activityIsEligibleForTriggerSuggestion:modeGlobals:](v5, a4);
                    }

                    LOBYTE(a4) = 0;
                    goto LABEL_20;
                  }
                }
                uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
                if (v13) {
                  continue;
                }
                break;
              }
            }
            LOBYTE(a4) = 1;
LABEL_20:
          }
        }
        else
        {
          LOBYTE(a4) = 0;
        }
      }
    }
  }

  return (char)a4;
}

- (BOOL)_shouldSendModeSetUpSuggestionAtEndOfModeToLockScreen:(id)a3 modeGlobals:(id)a4
{
  id v6 = a3;
  if (-[ATXActivitySuggestionClient _activityIsEligibleForSetUpSuggestion:modeGlobals:](self, "_activityIsEligibleForSetUpSuggestion:modeGlobals:", v6, a4)&& ([v6 location] & 2) != 0)
  {
    uint64_t v8 = [v6 activityType];
    BOOL v7 = v8 == 4 || v8 == 13;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldSendModeTriggerSuggestionAtEndOfModeToLockScreen:(id)a3 modeGlobals:(id)a4
{
  id v6 = a3;
  if (-[ATXActivitySuggestionClient _activityIsEligibleForTriggerSuggestion:modeGlobals:](self, "_activityIsEligibleForTriggerSuggestion:modeGlobals:", v6, a4)&& ([v6 location] & 2) != 0)
  {
    uint64_t v8 = [v6 activityType];
    BOOL v7 = v8 == 4 || v8 == 13;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_fetchAndCacheLOIs
{
  objc_initWeak(&location, self);
  routineManager = self->_routineManager;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__ATXActivitySuggestionClient__fetchAndCacheLOIs__block_invoke;
  v7[3] = &unk_1E5D07EF8;
  objc_copyWeak(&v8, &location);
  [(RTRoutineManager *)routineManager fetchLocationsOfInterestOfType:0 withHandler:v7];
  id v4 = self->_routineManager;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__ATXActivitySuggestionClient__fetchAndCacheLOIs__block_invoke_47;
  v5[3] = &unk_1E5D07EF8;
  objc_copyWeak(&v6, &location);
  [(RTRoutineManager *)v4 fetchLocationsOfInterestOfType:1 withHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __49__ATXActivitySuggestionClient__fetchAndCacheLOIs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 firstObject];
  BOOL v7 = __atxlog_handle_modes();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v17 = 0;
      _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "Cached Routine Home LOI", v17, 2u);
    }

    id v9 = objc_alloc(MEMORY[0x1E4F1E5A8]);
    id v8 = [v6 location];
    [v8 latitude];
    CLLocationDegrees v11 = v10;
    uint64_t v12 = [v6 location];
    [v12 longitude];
    CLLocationCoordinate2D v14 = CLLocationCoordinate2DMake(v11, v13);
    uint64_t v15 = objc_msgSend(v9, "initWithCenter:radius:identifier:", @"home", v14.latitude, v14.longitude, 500.0);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setHomeRegion:v15];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __49__ATXActivitySuggestionClient__fetchAndCacheLOIs__block_invoke_cold_1();
  }
}

void __49__ATXActivitySuggestionClient__fetchAndCacheLOIs__block_invoke_47(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 firstObject];
  BOOL v7 = __atxlog_handle_modes();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v17 = 0;
      _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "Cached Routine Work LOI", v17, 2u);
    }

    id v9 = objc_alloc(MEMORY[0x1E4F1E5A8]);
    id v8 = [v6 location];
    [v8 latitude];
    CLLocationDegrees v11 = v10;
    uint64_t v12 = [v6 location];
    [v12 longitude];
    CLLocationCoordinate2D v14 = CLLocationCoordinate2DMake(v11, v13);
    uint64_t v15 = objc_msgSend(v9, "initWithCenter:radius:identifier:", @"work", v14.latitude, v14.longitude, 500.0);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setWorkRegion:v15];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __49__ATXActivitySuggestionClient__fetchAndCacheLOIs__block_invoke_47_cold_1();
  }
}

- (id)triggersToDNDModeConfigurationTriggers:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 count])
  {
    id v5 = objc_opt_new();
    v12[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    goto LABEL_5;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__ATXActivitySuggestionClient_triggersToDNDModeConfigurationTriggers___block_invoke;
  v10[3] = &unk_1E5D07F20;
  v10[4] = self;
  id v5 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v10);
  if ([v5 count])
  {
    id v6 = v5;
LABEL_5:
    BOOL v7 = v6;
    goto LABEL_7;
  }
  id v8 = objc_opt_new();
  CLLocationDegrees v11 = v8;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];

LABEL_7:

  return v7;
}

id __70__ATXActivitySuggestionClient_triggersToDNDModeConfigurationTriggers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[(id)objc_opt_class() DNDModeConfigurationTriggerClassFromATXTrigger:v3];
  if (!v4) {
    goto LABEL_18;
  }
  if (![v4 isEqual:objc_opt_class()]) {
    goto LABEL_8;
  }
  uint64_t v5 = [v3 namedLOI];
  if (v5)
  {
    if (v5 == 2)
    {
      if (*(void *)(*(void *)(a1 + 32) + 80))
      {
        id v6 = objc_alloc(MEMORY[0x1E4F5F678]);
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 80);
        goto LABEL_11;
      }
      double v10 = __atxlog_handle_modes();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __70__ATXActivitySuggestionClient_triggersToDNDModeConfigurationTriggers___block_invoke_cold_2();
      }
      goto LABEL_17;
    }
    if (v5 == 1)
    {
      if (*(void *)(*(void *)(a1 + 32) + 72))
      {
        id v6 = objc_alloc(MEMORY[0x1E4F5F678]);
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 72);
LABEL_11:
        uint64_t v8 = [v6 initWithRegion:v7 detail:0 enabledSetting:2];
        goto LABEL_12;
      }
      double v10 = __atxlog_handle_modes();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __70__ATXActivitySuggestionClient_triggersToDNDModeConfigurationTriggers___block_invoke_cold_1();
      }
LABEL_17:

      goto LABEL_18;
    }
LABEL_8:
    uint64_t v8 = objc_opt_new();
LABEL_12:
    id v9 = (void *)v8;
    goto LABEL_19;
  }
LABEL_18:
  id v9 = 0;
LABEL_19:

  return v9;
}

- (id)DNDModeConfigurationTriggersToATXTriggers:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__ATXActivitySuggestionClient_DNDModeConfigurationTriggersToATXTriggers___block_invoke;
  v5[3] = &unk_1E5D07F48;
  void v5[4] = self;
  id v3 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v5);

  return v3;
}

id __73__ATXActivitySuggestionClient_DNDModeConfigurationTriggersToATXTriggers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![(id)objc_opt_class() ATXTriggerClassFromDNDModeConfigurationTrigger:v3])
  {
    uint64_t v12 = 0;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = objc_opt_new();
    goto LABEL_15;
  }
  id v4 = [v3 region];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 80);
  if (v6)
  {
    [v6 center];
    if (objc_msgSend(v4, "containsCoordinate:"))
    {
      id v7 = objc_alloc(MEMORY[0x1E4F935C0]);
      uint64_t v8 = [v4 identifier];
      id v9 = v7;
      double v10 = v8;
      uint64_t v11 = 2;
      goto LABEL_12;
    }
    uint64_t v5 = *(void *)(a1 + 32);
  }
  CLLocationDegrees v13 = *(void **)(v5 + 72);
  if (!v13 || ([v13 center], !objc_msgSend(v4, "containsCoordinate:")))
  {
    uint64_t v12 = 0;
    goto LABEL_14;
  }
  id v14 = objc_alloc(MEMORY[0x1E4F935C0]);
  uint64_t v8 = [v4 identifier];
  id v9 = v14;
  double v10 = v8;
  uint64_t v11 = 1;
LABEL_12:
  uint64_t v12 = (void *)[v9 initWithLocationIdentifier:v10 namedLOI:v11];

LABEL_14:
LABEL_15:

  return v12;
}

+ (Class)DNDModeConfigurationTriggerClassFromATXTrigger:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_8:
    id v4 = objc_opt_class();
  }
  else
  {
    id v4 = 0;
  }

  return (Class)v4;
}

+ (Class)ATXTriggerClassFromDNDModeConfigurationTrigger:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = objc_opt_class();
  }
  else
  {
    id v4 = 0;
  }

  return (Class)v4;
}

- (CLCircularRegion)workRegion
{
  return (CLCircularRegion *)objc_getProperty(self, a2, 72, 1);
}

- (void)setWorkRegion:(id)a3
{
}

- (CLCircularRegion)homeRegion
{
  return (CLCircularRegion *)objc_getProperty(self, a2, 80, 1);
}

- (void)setHomeRegion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeRegion, 0);
  objc_storeStrong((id *)&self->_workRegion, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_feedbackStream, 0);

  objc_storeStrong((id *)&self->_inferredModeStream, 0);
}

void __57__ATXActivitySuggestionClient__setUpPublisherIfNecessary__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 error];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_13(&dword_1A790D000, a2, v4, "ATXActivitySuggestionClient: error listening to mode events: %@", v5);
}

void __57__ATXActivitySuggestionClient__setUpPublisherIfNecessary__block_invoke_22_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "ATXActivitySuggestionClient: self is nil", v2, v3, v4, v5, v6);
}

void __57__ATXActivitySuggestionClient__setUpPublisherIfNecessary__block_invoke_22_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 eventBody];
  uint8_t v6 = [v5 absoluteTimestamp];
  [v6 timeIntervalSinceReferenceDate];
  int v8 = 134218240;
  uint64_t v9 = a1;
  __int16 v10 = 2048;
  uint64_t v11 = v7;
  _os_log_debug_impl(&dword_1A790D000, a3, OS_LOG_TYPE_DEBUG, "ATXActivitySuggestionClient %p: mode changed from Biome publisher: %f", (uint8_t *)&v8, 0x16u);
}

void __117__ATXActivitySuggestionClient__logFeedbackEventForSuggestionUUID_suggestionType_eventType_acceptedTriggers_location___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 136315650;
  uint64_t v5 = "-[ATXActivitySuggestionClient _logFeedbackEventForSuggestionUUID:suggestionType:eventType:acceptedTriggers:locati"
       "on:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "%s: Could not get ATXActivity for suggestionUUID: %@, modeEvent: %@", (uint8_t *)&v4, 0x20u);
}

- (void)_shouldSendAutomationSuggestionForMode:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "BMUserFocusInferredModeType: %lu not handled in switch statement", (uint8_t *)&v2, 0xCu);
}

- (void)_activityIsEligibleForTriggerSuggestion:(void *)a1 modeGlobals:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 activityType];
  uint64_t v3 = ATXActivityTypeToString();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_13(&dword_1A790D000, a2, v4, "ATXActivitySuggestionClient: %@ Focus Mode returned eligible to trigger Smart Activation Suggestion", v5);
}

void __49__ATXActivitySuggestionClient__fetchAndCacheLOIs__block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_13(&dword_1A790D000, v0, v1, "No Routine Home LOIs: %{public}@", v2);
}

void __49__ATXActivitySuggestionClient__fetchAndCacheLOIs__block_invoke_47_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_13(&dword_1A790D000, v0, v1, "No Routine Work LOIs: %{public}@", v2);
}

void __70__ATXActivitySuggestionClient_triggersToDNDModeConfigurationTriggers___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "Predicted work LOI trigger but there is no LOI info", v2, v3, v4, v5, v6);
}

void __70__ATXActivitySuggestionClient_triggersToDNDModeConfigurationTriggers___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "Predicted home LOI trigger but there is no LOI info", v2, v3, v4, v5, v6);
}

@end