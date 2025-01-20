@interface DNDSSmartTriggerManager
- (DNDSSmartTriggerManager)init;
- (DNDSSmartTriggerManagerDataSource)dataSource;
- (void)_configureSmartTriggerWithSupportedModes:(id)a3;
- (void)_refreshIfNeccessaryForEvent:(id)a3;
- (void)_refreshWithSupportedModes:(id)a3 event:(id)a4;
- (void)refresh;
- (void)setDataSource:(id)a3;
@end

@implementation DNDSSmartTriggerManager

- (DNDSSmartTriggerManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)DNDSSmartTriggerManager;
  v2 = [(DNDSSmartTriggerManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[DNDSWorkloop serialQueueTargetingSharedWorkloop:@"com.apple.donotdisturb.private.biome-inferred-mode.queue"];
    biomeQueue = v2->_biomeQueue;
    v2->_biomeQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    sinks = v2->_sinks;
    v2->_sinks = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)refresh
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = [WeakRetained modesSupportingSmartEntryForSmartTriggerManager:self];

  [(DNDSSmartTriggerManager *)self _configureSmartTriggerWithSupportedModes:v4];
  [(DNDSSmartTriggerManager *)self _refreshWithSupportedModes:v4 event:0];
  uint64_t v5 = DNDSLogSmartTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogSmartTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Updated assertions for smart triggers: supportedModes=%{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_refreshWithSupportedModes:(id)a3 event:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DNDSSmartTriggerManager *)self dataSource];
  v9 = [v7 eventBody];
  int v10 = [v9 isStart];

  v11 = [v7 eventBody];
  v12 = [v11 modeUUID];

  if (v12)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F29128]);
    v14 = [v7 eventBody];
    v15 = [v14 modeUUID];
    v16 = (void *)[v13 initWithUUIDString:v15];
  }
  else
  {
    v16 = 0;
  }
  v17 = [v6 allObjects];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __60__DNDSSmartTriggerManager__refreshWithSupportedModes_event___block_invoke;
  v37[3] = &unk_1E6975928;
  id v18 = v16;
  id v38 = v18;
  v19 = objc_msgSend(v17, "bs_firstObjectPassingTest:", v37);

  v20 = [v19 modeIdentifier];
  id v36 = 0;
  v21 = [v8 triggerManager:self assertionsWithClientIdentifer:@"com.apple.donotdisturb.private.smart-trigger" error:&v36];
  id v22 = v36;
  if (v20)
  {
    if (v10)
    {
      id v23 = objc_alloc_init(MEMORY[0x1E4F5F700]);
      [v23 setIdentifier:@"com.apple.donotdisturb.trigger.smart"];
      [v23 setLifetime:0];
      [v23 setModeIdentifier:v20];
      id v35 = v22;
      id v24 = (id)[v8 triggerManager:self takeModeAssertionWithDetails:v23 clientIdentifier:@"com.apple.donotdisturb.private.smart-trigger" error:&v35];
      id v25 = v35;

      id v22 = v25;
    }
    else
    {
      id v31 = v6;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __60__DNDSSmartTriggerManager__refreshWithSupportedModes_event___block_invoke_2;
      v33[3] = &unk_1E6973720;
      id v34 = v20;
      v26 = objc_msgSend(v21, "bs_filter:", v33);
      v27 = [v26 firstObject];

      if (v27)
      {
        v28 = [v27 UUID];
        id v32 = v22;
        id v29 = (id)[v8 triggerManager:self invalidateModeAssertionWithUUID:v28 reason:3 reasonOverride:0 clientIdentifier:@"com.apple.donotdisturb.private.smart-trigger" error:&v32];
        id v30 = v32;

        id v22 = v30;
      }

      id v23 = v34;
      id v6 = v31;
    }
  }
}

uint64_t __60__DNDSSmartTriggerManager__refreshWithSupportedModes_event___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

uint64_t __60__DNDSSmartTriggerManager__refreshWithSupportedModes_event___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 details];
  uint64_t v4 = [v3 modeIdentifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (void)_configureSmartTriggerWithSupportedModes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_sinks objectForKeyedSubscript:@"system"];
  if (![v4 count] || v5)
  {
    if (![v4 count] && v5)
    {
      [v5 cancel];
      [(NSMutableDictionary *)self->_sinks removeObjectForKey:@"system"];
    }
  }
  else
  {
    id v6 = (void *)DNDSLogSmartTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogSmartTrigger, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      uint64_t v8 = [v4 allObjects];
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Adding biome inferred mode event monitor for %{public}@", buf, 0xCu);
    }
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"com.apple.donotdisturb.smartTrigger" targetQueue:self->_biomeQueue];
    id v10 = objc_alloc_init(MEMORY[0x1E4F50388]);
    v11 = [v10 publisher];
    v12 = [v11 filterWithKeyPath:@"eventBody.isAutomationEnabled" value:MEMORY[0x1E4F1CC38]];
    id v13 = [v12 subscribeOn:v9];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __68__DNDSSmartTriggerManager__configureSmartTriggerWithSupportedModes___block_invoke_24;
    v14[3] = &unk_1E6973768;
    v14[4] = self;
    uint64_t v5 = [v13 sinkWithCompletion:&__block_literal_global_41 receiveInput:v14];

    [(NSMutableDictionary *)self->_sinks setObject:v5 forKeyedSubscript:@"system"];
  }
}

void __68__DNDSSmartTriggerManager__configureSmartTriggerWithSupportedModes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)DNDSLogSmartTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogSmartTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = a2;
    uint64_t v6 = [v5 state];
    id v7 = [v5 error];

    int v8 = 134218242;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "InferredMode subscription completed: state=%ld error=%{public}@", (uint8_t *)&v8, 0x16u);
  }
}

void __68__DNDSSmartTriggerManager__configureSmartTriggerWithSupportedModes___block_invoke_24(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)DNDSLogSmartTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogSmartTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    uint64_t v6 = [v3 eventBody];
    id v7 = [v6 modeUUID];
    int v8 = [v3 eventBody];
    int v9 = [v8 isStart];
    __int16 v10 = @"N";
    if (v9) {
      __int16 v10 = @"Y";
    }
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Received inferred mode event: modeIdentifier=%{public}@ starting=%{public}@", (uint8_t *)&v11, 0x16u);
  }
  [*(id *)(a1 + 32) _refreshIfNeccessaryForEvent:v3];
}

- (void)_refreshIfNeccessaryForEvent:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v6 = [WeakRetained modesSupportingSmartEntryForSmartTriggerManager:self];

  id v7 = objc_alloc(MEMORY[0x1E4F29128]);
  int v8 = [v4 eventBody];
  int v9 = [v8 modeUUID];
  __int16 v10 = (void *)[v7 initWithUUIDString:v9];

  int v11 = [v6 allObjects];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__DNDSSmartTriggerManager__refreshIfNeccessaryForEvent___block_invoke;
  v18[3] = &unk_1E6975928;
  id v12 = v10;
  id v19 = v12;
  LODWORD(v9) = objc_msgSend(v11, "bs_containsObjectPassingTest:", v18);

  if (v9)
  {
    [(DNDSSmartTriggerManager *)self _refreshWithSupportedModes:v6 event:v4];
    __int16 v13 = (void *)DNDSLogSmartTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogSmartTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      uint64_t v15 = [v4 eventBody];
      *(_DWORD *)buf = 138543362;
      v21 = v15;
      v16 = "Updated assertions for inferred mode event: event=%{public}@";
LABEL_6:
      _os_log_impl(&dword_1D3052000, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
    }
  }
  else
  {
    uint64_t v17 = (void *)DNDSLogSmartTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogSmartTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v17;
      uint64_t v15 = [v4 eventBody];
      *(_DWORD *)buf = 138543362;
      v21 = v15;
      v16 = "Ignored automatic entry for unsupported inferred mode event: event=%{public}@";
      goto LABEL_6;
    }
  }
}

uint64_t __56__DNDSSmartTriggerManager__refreshIfNeccessaryForEvent___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

- (DNDSSmartTriggerManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (DNDSSmartTriggerManagerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_sinks, 0);
  objc_storeStrong((id *)&self->_biomeQueue, 0);
}

@end