@interface BRCBuddyFlowObserver
+ (id)sharedBuddyFlowObserver;
- (BOOL)doesBuddyFlowNeedsToRun;
- (BOOL)observeBuddyIfNecessaryWithKey:(id)a3 block:(id)a4 description:(id)a5;
- (id)_init;
- (void)_registerForBYSetupAssistantFinishedNotification;
- (void)_stopObservingBuddyAndExecuteCallbacks;
- (void)_unregisterForBYSetupAssistantFinishedNotification;
- (void)logStatus;
- (void)stopObservingBuddyWithKey:(id)a3;
@end

@implementation BRCBuddyFlowObserver

+ (id)sharedBuddyFlowObserver
{
  if (sharedBuddyFlowObserver_onceToken != -1) {
    dispatch_once(&sharedBuddyFlowObserver_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)sharedBuddyFlowObserver_obj;
  return v2;
}

void __47__BRCBuddyFlowObserver_sharedBuddyFlowObserver__block_invoke()
{
  id v0 = [[BRCBuddyFlowObserver alloc] _init];
  v1 = (void *)sharedBuddyFlowObserver_obj;
  sharedBuddyFlowObserver_obj = (uint64_t)v0;
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)BRCBuddyFlowObserver;
  v2 = [(BRCBuddyFlowObserver *)&v7 init];
  p_isa = (id *)&v2->super.isa;
  if (v2)
  {
    v2->_waitingForBuddy = 0;
    id v4 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    id v5 = p_isa[3];
    p_isa[3] = v4;

    [p_isa[3] setMaxConcurrentOperationCount:1];
  }
  return p_isa;
}

- (BOOL)doesBuddyFlowNeedsToRun
{
  return MEMORY[0x1F414B088](self, a2);
}

- (void)_registerForBYSetupAssistantFinishedNotification
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v3;
    _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] Register for BYSetupAssistantFinishedDarwinNotification%@", buf, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_buddyHasFinished, (CFStringRef)*MEMORY[0x1E4F9AA18], 0, CFNotificationSuspensionBehaviorDrop);
  v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  objc_super v7 = dispatch_queue_attr_make_with_autorelease_frequency(v6, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v8 = dispatch_queue_create("com.apple.bird.buddy-flow-observer-refresh-queue", v7);

  objc_initWeak((id *)buf, self);
  id v9 = objc_alloc(MEMORY[0x1E4F59570]);
  v10 = +[BRCUserDefaults defaultsForMangledID:0];
  [v10 buddyFlowObserverRefreshTimerInterval];
  double v12 = v11;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__BRCBuddyFlowObserver__registerForBYSetupAssistantFinishedNotification__block_invoke;
  v16[3] = &unk_1E69949E8;
  objc_copyWeak(&v17, (id *)buf);
  uint64_t v13 = [v9 initWithName:@"buddy-flow-observer" interval:v8 callbackQueue:v16 block:v12];
  timer = self->_timer;
  p_timer = (id *)&self->_timer;
  id *p_timer = (id)v13;

  [*p_timer start];
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

uint64_t __72__BRCBuddyFlowObserver__registerForBYSetupAssistantFinishedNotification__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_5;
  }
  if (([WeakRetained doesBuddyFlowNeedsToRun] & 1) == 0)
  {
    [v2 _stopObservingBuddyAndExecuteCallbacks];
LABEL_5:
    uint64_t v3 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 1;
LABEL_6:

  return v3;
}

- (void)_unregisterForBYSetupAssistantFinishedNotification
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    objc_super v7 = v3;
    _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] Unregister for BYSetupAssistantFinishedDarwinNotification%@", (uint8_t *)&v6, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4F9AA18], 0);
}

- (BOOL)observeBuddyIfNecessaryWithKey:(id)a3 block:(id)a4 description:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(BRCBuddyFlowObserver *)self doesBuddyFlowNeedsToRun])
  {
    double v11 = self;
    objc_sync_enter(v11);
    if ([(BRCBuddyFlowObserver *)v11 doesBuddyFlowNeedsToRun])
    {
      if (!v11->_waitingForBuddy)
      {
        v11->_waitingForBuddy = 1;
        [(BRCBuddyFlowObserver *)v11 _registerForBYSetupAssistantFinishedNotification];
      }
      brc_bread_crumbs();
      double v12 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      uint64_t v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v10;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        *(_WORD *)&buf[22] = 2112;
        v45 = v12;
        _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, "[NOTICE] We are in Buddy. Register block [%@] with key [%@]%@", buf, 0x20u);
      }

      if (!v11->_registerdKeyToToken)
      {
        uint64_t v14 = objc_opt_new();
        registerdKeyToToken = v11->_registerdKeyToToken;
        v11->_registerdKeyToToken = (NSMutableDictionary *)v14;
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v45 = __Block_byref_object_copy__6;
      v46 = __Block_byref_object_dispose__6;
      id v47 = 0;
      if (v8)
      {
        uint64_t v16 = [(NSMutableDictionary *)v11->_registerdKeyToToken objectForKeyedSubscript:v8];
        id v17 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v16;

        if (*(void *)(*(void *)&buf[8] + 40))
        {
          v18 = brc_bread_crumbs();
          v19 = brc_default_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v40 = 138412546;
            id v41 = v8;
            __int16 v42 = 2112;
            v43 = v18;
            _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEFAULT, "[NOTICE] Key %@ already registered%@", v40, 0x16u);
          }
        }
        else
        {
          v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
          observersQueue = v11->_observersQueue;
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __73__BRCBuddyFlowObserver_observeBuddyIfNecessaryWithKey_block_description___block_invoke;
          v35[3] = &unk_1E6994A10;
          id v36 = v10;
          v37 = v11;
          id v27 = v8;
          id v38 = v27;
          id v39 = v9;
          uint64_t v28 = [v25 addObserverForName:@"com.apple.clouddocs.buddy-flow-done" object:0 queue:observersQueue usingBlock:v35];
          v29 = *(void **)(*(void *)&buf[8] + 40);
          *(void *)(*(void *)&buf[8] + 40) = v28;

          [(NSMutableDictionary *)v11->_registerdKeyToToken setObject:*(void *)(*(void *)&buf[8] + 40) forKeyedSubscript:v27];
          v18 = v36;
        }
      }
      else
      {
        v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v22 = v11->_observersQueue;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __73__BRCBuddyFlowObserver_observeBuddyIfNecessaryWithKey_block_description___block_invoke_13;
        v31[3] = &unk_1E6994A38;
        id v32 = v10;
        v34 = buf;
        id v33 = v9;
        uint64_t v23 = [v21 addObserverForName:@"com.apple.clouddocs.buddy-flow-done" object:0 queue:v22 usingBlock:v31];
        v24 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v23;

        v18 = v32;
      }

      if (![(BRCBuddyFlowObserver *)v11 doesBuddyFlowNeedsToRun]) {
        [(BRCBuddyFlowObserver *)v11 _stopObservingBuddyAndExecuteCallbacks];
      }
      BOOL v20 = *(void *)(*(void *)&buf[8] + 40) != 0;
      _Block_object_dispose(buf, 8);
    }
    else
    {
      BOOL v20 = 0;
    }
    objc_sync_exit(v11);
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

uint64_t __73__BRCBuddyFlowObserver_observeBuddyIfNecessaryWithKey_block_description___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] Buddy has finished. Execute block [%@]%@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) stopObservingBuddyWithKey:*(void *)(a1 + 48)];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __73__BRCBuddyFlowObserver_observeBuddyIfNecessaryWithKey_block_description___block_invoke_13(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    int v7 = 138412546;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] Buddy has finished. Execute block [%@]%@", (uint8_t *)&v7, 0x16u);
  }

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:*(void *)(*(void *)(a1[6] + 8) + 40)];

  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)logStatus
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = @"yes";
    if (!v2->_waitingForBuddy) {
      id v5 = @"no";
    }
    int v6 = 138412546;
    int v7 = v5;
    __int16 v8 = 2112;
    __int16 v9 = v3;
    _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] Waiting for buddy to complete: %@%@", (uint8_t *)&v6, 0x16u);
  }

  objc_sync_exit(v2);
}

- (void)_stopObservingBuddyAndExecuteCallbacks
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_waitingForBuddy)
  {
    obj = self;
    objc_sync_enter(obj);
    if (self->_waitingForBuddy)
    {
      brc_bread_crumbs();
      uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v4 = brc_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v10 = v3;
        _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] Unregister for BYSetupAssistantFinishedDarwinNotification%@", buf, 0xCu);
      }

      self->_waitingForBuddy = 0;
      [(BRCBuddyFlowObserver *)obj _unregisterForBYSetupAssistantFinishedNotification];
      objc_sync_exit(obj);

      id v5 = brc_bread_crumbs();
      int v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v10 = @"com.apple.clouddocs.buddy-flow-done";
        __int16 v11 = 2112;
        double v12 = v5;
        _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] Trigger %@%@", buf, 0x16u);
      }

      int v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 postNotificationName:@"com.apple.clouddocs.buddy-flow-done" object:0 userInfo:0];
    }
    else
    {
      objc_sync_exit(obj);
    }
  }
}

- (void)stopObservingBuddyWithKey:(id)a3
{
  id v8 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  id v5 = [(NSMutableDictionary *)v4->_registerdKeyToToken objectForKeyedSubscript:v8];
  if (v5)
  {
    [(NSMutableDictionary *)v4->_registerdKeyToToken removeObjectForKey:v8];
    if (![(NSMutableDictionary *)v4->_registerdKeyToToken count])
    {
      registerdKeyToToken = v4->_registerdKeyToToken;
      v4->_registerdKeyToToken = 0;
    }
    int v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 removeObserver:v5];
  }
  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_observersQueue, 0);
  objc_storeStrong((id *)&self->_registerdKeyToToken, 0);
}

@end