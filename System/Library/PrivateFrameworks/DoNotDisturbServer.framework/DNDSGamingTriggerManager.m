@interface DNDSGamingTriggerManager
- (BOOL)_featureEnabled;
- (DNDSGamingTriggerManager)init;
- (DNDSGamingTriggerManagerDataSource)dataSource;
- (void)_configureTriggerWithMode:(id)a3;
- (void)_refreshWithMode:(id)a3 event:(id)a4;
- (void)refresh;
- (void)setDataSource:(id)a3;
@end

@implementation DNDSGamingTriggerManager

- (DNDSGamingTriggerManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)DNDSGamingTriggerManager;
  v2 = [(DNDSGamingTriggerManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[DNDSWorkloop serialQueueTargetingSharedWorkloop:@"com.apple.donotdisturb.private.biome-gaming.queue"];
    biomeQueue = v2->_biomeQueue;
    v2->_biomeQueue = (OS_dispatch_queue *)v3;

    if ([(DNDSGamingTriggerManager *)v2 _featureEnabled])
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
      sinks = v2->_sinks;
      v2->_sinks = (NSMutableDictionary *)v5;
    }
  }
  return v2;
}

- (void)refresh
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(DNDSGamingTriggerManager *)self _featureEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v4 = [WeakRetained gamingModeForGamingTriggerManager:self];

    [(DNDSGamingTriggerManager *)self _configureTriggerWithMode:v4];
    [(DNDSGamingTriggerManager *)self _refreshWithMode:v4 event:0];
    uint64_t v5 = DNDSLogGamingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogGamingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      objc_super v8 = v4;
      _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Updated assertions for gaming trigger: mode=%{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    v6 = DNDSLogGamingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogGamingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "No action taken for request to refresh gaming trigger; automatic entry not supported",
        (uint8_t *)&v7,
        2u);
    }
  }
}

- (void)_refreshWithMode:(id)a3 event:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(DNDSGamingTriggerManager *)self dataSource];
  uint64_t v9 = [v7 modeIdentifier];

  id v58 = 0;
  v10 = [v8 triggerManager:self assertionsWithClientIdentifer:@"com.apple.donotdisturb.private.gaming-trigger" error:&v58];
  id v11 = v58;
  if (!v6)
  {
    if (![v10 count]) {
      goto LABEL_16;
    }
    v23 = [v10 firstObject];
    id v24 = v23;
    if (v9)
    {
      v25 = [v23 details];
      v26 = [v25 modeIdentifier];
      char v27 = [v9 isEqualToString:v26];

      if (v27)
      {
        id v18 = v11;
      }
      else
      {
        v44 = [v24 details];
        v45 = (void *)[v44 mutableCopy];

        [v45 setModeIdentifier:v9];
        id v56 = v11;
        id v46 = (id)[v8 triggerManager:self takeModeAssertionWithDetails:v45 clientIdentifier:@"com.apple.donotdisturb.private.gaming-trigger" error:&v56];
        id v18 = v56;

        v47 = (void *)DNDSLogGamingTrigger;
        if (os_log_type_enabled((os_log_t)DNDSLogGamingTrigger, OS_LOG_TYPE_DEFAULT))
        {
          v48 = v47;
          v49 = [v24 details];
          v50 = [v49 modeIdentifier];
          *(_DWORD *)buf = 138543618;
          v60 = v9;
          __int16 v61 = 2114;
          v62 = v50;
          _os_log_impl(&dword_1D3052000, v48, OS_LOG_TYPE_DEFAULT, "Updating active assertion to new mode identifer for game controller trigger; modeID=%{public}@ previousModeID=%{public}@",
            buf,
            0x16u);
        }
      }
    }
    else
    {
      v36 = [v23 UUID];
      id v57 = v11;
      id v37 = (id)[v8 triggerManager:self invalidateModeAssertionWithUUID:v36 reason:2 reasonOverride:0 clientIdentifier:@"com.apple.donotdisturb.private.gaming-trigger" error:&v57];
      id v18 = v57;

      v38 = (void *)DNDSLogGamingTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogGamingTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v39 = v38;
        v40 = [v24 details];
        v41 = [v40 modeIdentifier];
        *(_DWORD *)buf = 138543362;
        v60 = v41;
        _os_log_impl(&dword_1D3052000, v39, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion no mode identifer for game controller trigger; previousModeID=%{public}@",
          buf,
          0xCu);
      }
    }
    goto LABEL_26;
  }
  if (v9)
  {
    v12 = [v6 eventBody];
    int v13 = [v12 isControllerConnected];

    if (!v13 || [v10 count])
    {
      if ([v10 count])
      {
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __51__DNDSGamingTriggerManager__refreshWithMode_event___block_invoke;
        v53[3] = &unk_1E6973720;
        id v54 = v9;
        v14 = objc_msgSend(v10, "bs_filter:", v53);
        v15 = [v14 firstObject];

        if (v15)
        {
          v16 = [v15 UUID];
          id v52 = v11;
          id v17 = (id)[v8 triggerManager:self invalidateModeAssertionWithUUID:v16 reason:3 reasonOverride:0 clientIdentifier:@"com.apple.donotdisturb.private.gaming-trigger" error:&v52];
          id v18 = v52;

          v19 = (void *)DNDSLogGamingTrigger;
          if (os_log_type_enabled((os_log_t)DNDSLogGamingTrigger, OS_LOG_TYPE_DEFAULT))
          {
            v20 = v19;
            v21 = [v15 details];
            v22 = [v21 modeIdentifier];
            *(_DWORD *)buf = 138543362;
            v60 = v22;
            _os_log_impl(&dword_1D3052000, v20, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion for game controller trigger in response to event; previousModeID=%{public}@",
              buf,
              0xCu);
          }
        }
        else
        {
          id v18 = v11;
        }

        goto LABEL_27;
      }
LABEL_16:
      id v18 = v11;
      goto LABEL_27;
    }
    id v24 = objc_alloc_init(MEMORY[0x1E4F5F700]);
    [v24 setIdentifier:@"com.apple.donotdisturb.trigger.gaming"];
    [v24 setLifetime:0];
    [v24 setModeIdentifier:v9];
    id v55 = v11;
    id v42 = (id)[v8 triggerManager:self takeModeAssertionWithDetails:v24 clientIdentifier:@"com.apple.donotdisturb.private.gaming-trigger" error:&v55];
    id v18 = v55;

    v43 = DNDSLogGamingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogGamingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v60 = v9;
      _os_log_impl(&dword_1D3052000, v43, OS_LOG_TYPE_DEFAULT, "Acquiring assertion for game controller trigger in response to event; modeID=%{public}@",
        buf,
        0xCu);
    }
LABEL_26:

    goto LABEL_27;
  }
  if (![v10 count]) {
    goto LABEL_16;
  }
  v28 = [v10 firstObject];
  v29 = [v28 UUID];
  id v51 = v11;
  id v30 = (id)[v8 triggerManager:self invalidateModeAssertionWithUUID:v29 reason:3 reasonOverride:0 clientIdentifier:@"com.apple.donotdisturb.private.gaming-trigger" error:&v51];
  id v18 = v51;

  v31 = (void *)DNDSLogGamingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogGamingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v32 = v31;
    v33 = [v10 firstObject];
    v34 = [v33 details];
    v35 = [v34 modeIdentifier];
    *(_DWORD *)buf = 138543362;
    v60 = v35;
    _os_log_impl(&dword_1D3052000, v32, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion for game controller trigger in response to event, trigger is disabled; previousModeID=%{public}@",
      buf,
      0xCu);
  }
LABEL_27:
}

uint64_t __51__DNDSGamingTriggerManager__refreshWithMode_event___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 details];
  v4 = [v3 modeIdentifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (void)_configureTriggerWithMode:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_sinks objectForKeyedSubscript:@"system"];
  id v6 = v5;
  if (!v4 || v5)
  {
    if (!v4 && v5)
    {
      [v5 cancel];
      [(NSMutableDictionary *)self->_sinks removeObjectForKey:@"system"];
    }
  }
  else
  {
    id v7 = DNDSLogGamingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogGamingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v4;
      _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Adding biome game controller event monitor; mode=%{public}@",
        buf,
        0xCu);
    }
    objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"com.apple.donotdisturb.gamingTrigger" targetQueue:self->_biomeQueue];
    uint64_t v9 = [MEMORY[0x1E4F504C8] gameControllerStream];
    v10 = [v9 publisher];
    id v11 = [v10 subscribeOn:v8];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __54__DNDSGamingTriggerManager__configureTriggerWithMode___block_invoke_19;
    v15 = &unk_1E6974280;
    v16 = self;
    id v17 = v4;
    id v6 = [v11 sinkWithCompletion:&__block_literal_global_35 receiveInput:&v12];

    [(NSMutableDictionary *)self->_sinks setObject:v6, @"system", v12, v13, v14, v15, v16 forKeyedSubscript];
  }
}

void __54__DNDSGamingTriggerManager__configureTriggerWithMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)DNDSLogGamingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogGamingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = a2;
    uint64_t v6 = [v5 state];
    id v7 = [v5 error];

    int v8 = 134218242;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    id v11 = v7;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Game controller subscription completed: state=%ld error=%{public}@", (uint8_t *)&v8, 0x16u);
  }
}

void __54__DNDSGamingTriggerManager__configureTriggerWithMode___block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)DNDSLogGamingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogGamingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    uint64_t v6 = [v3 eventBody];
    int v7 = [v6 isControllerConnected];
    int v8 = [v3 eventBody];
    int v15 = 67109376;
    int v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = [v8 numberOfControllersConnected];
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Received controller event: isControllerConnected=%{BOOL}d number=%lu", (uint8_t *)&v15, 0x12u);
  }
  [*(id *)(a1 + 32) _refreshWithMode:*(void *)(a1 + 40) event:v3];
  uint64_t v9 = (void *)DNDSLogGamingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogGamingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = v9;
    id v11 = [v3 eventBody];
    int v12 = [v11 isControllerConnected];
    uint64_t v13 = [v3 eventBody];
    uint64_t v14 = [v13 numberOfControllersConnected];
    int v15 = 67109376;
    int v16 = v12;
    __int16 v17 = 2048;
    uint64_t v18 = v14;
    _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_DEFAULT, "Updated assertions for controller event: isControllerConnected=%{BOOL}d number=%lu", (uint8_t *)&v15, 0x12u);
  }
}

- (BOOL)_featureEnabled
{
  return 1;
}

- (DNDSGamingTriggerManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (DNDSGamingTriggerManagerDataSource *)WeakRetained;
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