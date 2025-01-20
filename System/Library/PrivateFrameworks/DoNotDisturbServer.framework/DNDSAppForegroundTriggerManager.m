@interface DNDSAppForegroundTriggerManager
- (DNDSAppForegroundTriggerManager)init;
- (DNDSAppForegroundTriggerManagerDataSource)dataSource;
- (void)_coalescingQueue_coalesceWithTriggerConfiguration:(id)a3 event:(id)a4;
- (void)_coalescingQueue_refreshWithTriggerConfiguration:(id)a3;
- (void)_coalescingQueue_resetCoalescingTimer;
- (void)_configureAppForegroundTriggerWithConfiguration:(id)a3;
- (void)_refreshIfNeccessaryForEvent:(id)a3;
- (void)_refreshWithTriggerConfiguration:(id)a3 event:(id)a4;
- (void)refresh;
- (void)setDataSource:(id)a3;
@end

@implementation DNDSAppForegroundTriggerManager

- (DNDSAppForegroundTriggerManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)DNDSAppForegroundTriggerManager;
  v2 = [(DNDSAppForegroundTriggerManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[DNDSWorkloop serialQueueTargetingSharedWorkloop:@"com.apple.donotdisturb.private.biome-app-launch.queue"];
    biomeQueue = v2->_biomeQueue;
    v2->_biomeQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.donotdisturb.appForeground.coalescing", v5);
    coalescingQueue = v2->_coalescingQueue;
    v2->_coalescingQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    sinks = v2->_sinks;
    v2->_sinks = (NSMutableDictionary *)v8;
  }
  return v2;
}

- (void)refresh
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = [WeakRetained appForegroundTriggerConfigurationForAppForegroundTriggerManager:self];

  [(DNDSAppForegroundTriggerManager *)self _configureAppForegroundTriggerWithConfiguration:v4];
  [(DNDSAppForegroundTriggerManager *)self _refreshWithTriggerConfiguration:v4 event:0];
  v5 = DNDSLogAppForegroundTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogAppForegroundTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Updated assertions for app launch triggers: configuration=%@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_refreshWithTriggerConfiguration:(id)a3 event:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v43 = a4;
  [(DNDSAppForegroundTriggerManager *)self dataSource];
  id v57 = 0;
  v46 = v45 = self;
  v7 = [v46 triggerManager:self assertionsWithClientIdentifer:@"com.apple.donotdisturb.private.app-launch" error:&v57];
  id v8 = v57;
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  v44 = v6;
  v10 = [v6 triggeringBundleIdentifiers];
  v47 = [v9 setWithArray:v10];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v54 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        v17 = [v16 source];
        v18 = [v17 deviceIdentifier];

        if (!v18)
        {
          v19 = [v16 details];
          v20 = [v19 identifier];

          if ([v20 hasSuffix:@".donotdisturb.trigger"])
          {
            v21 = [v20 stringByReplacingOccurrencesOfString:@".donotdisturb.trigger" withString:&stru_1F2A2D288];

            if (([v47 containsObject:v21] & 1) == 0)
            {
              v22 = DNDSLogAppForegroundTrigger;
              if (os_log_type_enabled((os_log_t)DNDSLogAppForegroundTrigger, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v59 = v21;
                _os_log_impl(&dword_1D3052000, v22, OS_LOG_TYPE_DEFAULT, "Don't have trigger for identifier '%@'. Invalidating...", buf, 0xCu);
              }
              v23 = [v16 UUID];
              id v52 = v8;
              id v24 = (id)[v46 triggerManager:v45 invalidateModeAssertionWithUUID:v23 reason:3 reasonOverride:0 clientIdentifier:@"com.apple.donotdisturb.private.app-launch" error:&v52];
              id v25 = v52;

              id v8 = v25;
            }
          }
          else
          {
            v21 = v20;
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v53 objects:v60 count:16];
    }
    while (v13);
  }

  if (v43)
  {
    v26 = DNDSLogAppForegroundTrigger;
    v27 = v44;
    if (os_log_type_enabled((os_log_t)DNDSLogAppForegroundTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v59 = v43;
      _os_log_impl(&dword_1D3052000, v26, OS_LOG_TYPE_DEFAULT, "Refreshing with event %@", buf, 0xCu);
    }
    v28 = [v43 eventBody];
    int v29 = [v28 isStarting];

    v30 = [v43 eventBody];
    v31 = [v30 bundleID];

    v32 = [v44 modeIdentifierForBundleIdentifier:v31];
    v33 = v32;
    if (v29)
    {
      id v34 = objc_alloc_init(MEMORY[0x1E4F5F700]);
      v35 = [v31 stringByAppendingString:@".donotdisturb.trigger"];
      [v34 setIdentifier:v35];

      [v34 setLifetime:0];
      [v34 setModeIdentifier:v33];
      [v34 setReason:3];
      id v51 = v8;
      id v36 = (id)[v46 triggerManager:v45 takeModeAssertionWithDetails:v34 clientIdentifier:@"com.apple.donotdisturb.private.app-launch" error:&v51];
      id v37 = v51;

      id v8 = v37;
    }
    else
    {
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __74__DNDSAppForegroundTriggerManager__refreshWithTriggerConfiguration_event___block_invoke;
      v49[3] = &unk_1E6973720;
      id v50 = v32;
      v38 = objc_msgSend(v11, "bs_filter:", v49);
      v39 = [v38 firstObject];

      if (v39)
      {
        v40 = [v39 UUID];
        id v48 = v8;
        id v41 = (id)[v46 triggerManager:v45 invalidateModeAssertionWithUUID:v40 reason:3 reasonOverride:0 clientIdentifier:@"com.apple.donotdisturb.private.app-launch" error:&v48];
        id v42 = v48;

        id v8 = v42;
      }

      id v34 = v50;
    }
  }
  else
  {
    v27 = v44;
  }
}

uint64_t __74__DNDSAppForegroundTriggerManager__refreshWithTriggerConfiguration_event___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 details];
  v4 = [v3 modeIdentifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (void)_configureAppForegroundTriggerWithConfiguration:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 triggeringBundleIdentifiers];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1C978] array];
  }
  v9 = v8;

  v10 = [(DNDSAppForegroundTriggerConfiguration *)self->_currentTriggerConfiguration triggeringBundleIdentifiers];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1C978] array];
  }
  uint64_t v13 = v12;

  uint64_t v14 = [(NSMutableDictionary *)self->_sinks objectForKeyedSubscript:@"system"];
  if (([v9 isEqual:v13] & 1) == 0)
  {
    [(NSMutableDictionary *)self->_sinks setObject:0 forKeyedSubscript:@"system"];
    [v14 cancel];

    objc_storeStrong((id *)&self->_currentTriggerConfiguration, a3);
    uint64_t v14 = 0;
  }
  if (![v9 count] || v14)
  {
    if (![v9 count] && v14)
    {
      [v14 cancel];
      [(NSMutableDictionary *)self->_sinks removeObjectForKey:@"system"];
    }
  }
  else
  {
    id v22 = v5;
    v15 = DNDSLogAppForegroundTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogAppForegroundTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v9;
      _os_log_impl(&dword_1D3052000, v15, OS_LOG_TYPE_DEFAULT, "Adding biome app launch event monitor for %{public}@", buf, 0xCu);
    }
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"com.apple.donotdisturb.appLaunch" targetQueue:self->_biomeQueue];
    v17 = [MEMORY[0x1E4F504C8] appLaunch];
    v18 = [v17 publisher];
    v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
    v20 = [v18 filterWithKeyPath:@"eventBody.bundleID" comparison:3 value:v19];
    v21 = [v20 subscribeOn:v16];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __83__DNDSAppForegroundTriggerManager__configureAppForegroundTriggerWithConfiguration___block_invoke_28;
    v23[3] = &unk_1E6973768;
    v23[4] = self;
    uint64_t v14 = [v21 sinkWithCompletion:&__block_literal_global_1 receiveInput:v23];

    [(NSMutableDictionary *)self->_sinks setObject:v14 forKeyedSubscript:@"system"];
    id v5 = v22;
  }
}

void __83__DNDSAppForegroundTriggerManager__configureAppForegroundTriggerWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)DNDSLogAppForegroundTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogAppForegroundTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    id v5 = a2;
    uint64_t v6 = [v5 state];
    v7 = [v5 error];

    int v8 = 134218242;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    id v11 = v7;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "AppLaunch subscription completed: state=%ld error=%{public}@", (uint8_t *)&v8, 0x16u);
  }
}

void __83__DNDSAppForegroundTriggerManager__configureAppForegroundTriggerWithConfiguration___block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)DNDSLogAppForegroundTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogAppForegroundTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    uint64_t v6 = [v3 eventBody];
    v7 = [v6 bundleID];
    int v8 = [v3 eventBody];
    if ([v8 isStarting]) {
      uint64_t v9 = @"Y";
    }
    else {
      uint64_t v9 = @"N";
    }
    __int16 v10 = [v3 eventBody];
    int v11 = 138543874;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    __int16 v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Received app launch event: bundleID=%{public}@ starting=%{public}@ event=%{public}@", (uint8_t *)&v11, 0x20u);
  }
  [*(id *)(a1 + 32) _refreshIfNeccessaryForEvent:v3];
}

- (void)_refreshIfNeccessaryForEvent:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v6 = [WeakRetained appForegroundTriggerConfigurationForAppForegroundTriggerManager:self];

  coalescingQueue = self->_coalescingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__DNDSAppForegroundTriggerManager__refreshIfNeccessaryForEvent___block_invoke;
  block[3] = &unk_1E69734A0;
  block[4] = self;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(coalescingQueue, block);
}

uint64_t __64__DNDSAppForegroundTriggerManager__refreshIfNeccessaryForEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_coalescingQueue_coalesceWithTriggerConfiguration:event:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_coalescingQueue_refreshWithTriggerConfiguration:(id)a3
{
}

- (void)_coalescingQueue_coalesceWithTriggerConfiguration:(id)a3 event:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  latestEvent = self->_latestEvent;
  if (latestEvent)
  {
    id v9 = [(BMStoreEvent *)latestEvent eventBody];
    __int16 v10 = [v9 bundleID];
    id v11 = [v7 eventBody];
    id v12 = [v11 bundleID];
    char v13 = [v10 isEqualToString:v12];

    if ((v13 & 1) == 0)
    {
      [(DNDSAppForegroundTriggerManager *)self _coalescingQueue_resetCoalescingTimer];
      [(DNDSAppForegroundTriggerManager *)self _coalescingQueue_refreshWithTriggerConfiguration:v6];
      uint64_t v14 = (void *)DNDSLogAppForegroundTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogAppForegroundTrigger, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v15 = self->_latestEvent;
        v16 = v14;
        uint64_t v17 = [(BMStoreEvent *)v15 eventBody];
        *(_DWORD *)buf = 138543362;
        v28 = v17;
        _os_log_impl(&dword_1D3052000, v16, OS_LOG_TYPE_DEFAULT, "reset coalescing timer due to bundleID change; updated assertions for app launch event: event=%{public}@",
          buf,
          0xCu);
      }
    }
  }
  objc_storeStrong((id *)&self->_latestEvent, a4);
  if (!self->_coalescingTimer)
  {
    v18 = (OS_os_transaction *)os_transaction_create();
    eventCoalescingTransaction = self->_eventCoalescingTransaction;
    self->_eventCoalescingTransaction = v18;

    v20 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_coalescingQueue);
    coalescingTimer = self->_coalescingTimer;
    self->_coalescingTimer = v20;

    id v22 = self->_coalescingTimer;
    dispatch_time_t v23 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(v22, v23, 0xFFFFFFFFFFFFFFFFLL, 0);
    id v24 = self->_coalescingTimer;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __91__DNDSAppForegroundTriggerManager__coalescingQueue_coalesceWithTriggerConfiguration_event___block_invoke;
    v25[3] = &unk_1E69735B8;
    v25[4] = self;
    id v26 = v6;
    dispatch_source_set_event_handler(v24, v25);
    dispatch_resume((dispatch_object_t)self->_coalescingTimer);
  }
}

uint64_t __91__DNDSAppForegroundTriggerManager__coalescingQueue_coalesceWithTriggerConfiguration_event___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "_coalescingQueue_refreshWithTriggerConfiguration:", *(void *)(a1 + 40));
  v2 = (void *)DNDSLogAppForegroundTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogAppForegroundTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 48);
    id v4 = v2;
    id v5 = [v3 eventBody];
    int v9 = 138543362;
    __int16 v10 = v5;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "coalescing timer fired; updated assertions for app launch event: event=%{public}@",
      (uint8_t *)&v9,
      0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_coalescingQueue_resetCoalescingTimer");
}

- (void)_coalescingQueue_resetCoalescingTimer
{
  coalescingTimer = self->_coalescingTimer;
  if (coalescingTimer)
  {
    dispatch_source_cancel(coalescingTimer);
    id v4 = self->_coalescingTimer;
    self->_coalescingTimer = 0;

    eventCoalescingTransaction = self->_eventCoalescingTransaction;
    self->_eventCoalescingTransaction = 0;
  }
}

- (DNDSAppForegroundTriggerManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (DNDSAppForegroundTriggerManagerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_eventCoalescingTransaction, 0);
  objc_storeStrong((id *)&self->_latestEvent, 0);
  objc_storeStrong((id *)&self->_currentTriggerConfiguration, 0);
  objc_storeStrong((id *)&self->_sinks, 0);
  objc_storeStrong((id *)&self->_coalescingQueue, 0);
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
  objc_storeStrong((id *)&self->_biomeQueue, 0);
}

@end