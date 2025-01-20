@interface DNDSMindfulnessTriggerManager
- (BOOL)_featureEnabled;
- (DNDSMindfulnessTriggerManager)init;
- (DNDSMindfulnessTriggerManagerDataSource)dataSource;
- (void)_configureTriggerWithMode:(id)a3;
- (void)_refreshWithMode:(id)a3 event:(id)a4;
- (void)refresh;
- (void)setDataSource:(id)a3;
@end

@implementation DNDSMindfulnessTriggerManager

- (DNDSMindfulnessTriggerManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)DNDSMindfulnessTriggerManager;
  v2 = [(DNDSMindfulnessTriggerManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[DNDSWorkloop serialQueueTargetingSharedWorkloop:@"com.apple.donotdisturb.private.biome-mindfulness.queue"];
    biomeQueue = v2->_biomeQueue;
    v2->_biomeQueue = (OS_dispatch_queue *)v3;

    if ([(DNDSMindfulnessTriggerManager *)v2 _featureEnabled])
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
  if ([(DNDSMindfulnessTriggerManager *)self _featureEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v4 = [WeakRetained mindfulnessModeForMindfulnessTriggerManager:self];

    [(DNDSMindfulnessTriggerManager *)self _configureTriggerWithMode:v4];
    [(DNDSMindfulnessTriggerManager *)self _refreshWithMode:v4 event:0];
    uint64_t v5 = DNDSLogMindfulnessTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogMindfulnessTrigger, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      objc_super v8 = v4;
      _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Updated assertions for mindfulness trigger: mode=%{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    v6 = DNDSLogMindfulnessTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogMindfulnessTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "No action taken for request to refresh mindfulness trigger; automatic entry not supported",
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
  objc_super v8 = [(DNDSMindfulnessTriggerManager *)self dataSource];
  uint64_t v9 = [v7 modeIdentifier];

  id v58 = 0;
  v10 = [v8 triggerManager:self assertionsWithClientIdentifer:@"com.apple.donotdisturb.private.mindfulness-trigger" error:&v58];
  id v11 = v58;
  if (!v6)
  {
    if ([v10 count])
    {
      v18 = [v10 firstObject];
      id v14 = v18;
      if (v9)
      {
        v19 = [v18 details];
        v20 = [v19 modeIdentifier];
        char v21 = [v9 isEqualToString:v20];

        if (v21)
        {
          id v16 = v11;
        }
        else
        {
          v44 = [v14 details];
          v45 = (void *)[v44 mutableCopy];

          [v45 setModeIdentifier:v9];
          id v56 = v11;
          id v46 = (id)[v8 triggerManager:self takeModeAssertionWithDetails:v45 clientIdentifier:@"com.apple.donotdisturb.private.mindfulness-trigger" error:&v56];
          id v16 = v56;

          v47 = (void *)DNDSLogMindfulnessTrigger;
          if (os_log_type_enabled((os_log_t)DNDSLogMindfulnessTrigger, OS_LOG_TYPE_DEFAULT))
          {
            v48 = v47;
            v49 = [v14 details];
            v50 = [v49 modeIdentifier];
            *(_DWORD *)buf = 138543618;
            v60 = v9;
            __int16 v61 = 2114;
            v62 = v50;
            _os_log_impl(&dword_1D3052000, v48, OS_LOG_TYPE_DEFAULT, "Updating active assertion to new mode identifer for mindfulness session trigger; modeID=%{public}@ previou"
              "sModeID=%{public}@",
              buf,
              0x16u);
          }
        }
      }
      else
      {
        v38 = [v18 UUID];
        id v57 = v11;
        id v39 = (id)[v8 triggerManager:self invalidateModeAssertionWithUUID:v38 reason:2 reasonOverride:0 clientIdentifier:@"com.apple.donotdisturb.private.mindfulness-trigger" error:&v57];
        id v16 = v57;

        v40 = (void *)DNDSLogMindfulnessTrigger;
        if (os_log_type_enabled((os_log_t)DNDSLogMindfulnessTrigger, OS_LOG_TYPE_DEFAULT))
        {
          v41 = v40;
          v42 = [v14 details];
          v43 = [v42 modeIdentifier];
          *(_DWORD *)buf = 138543362;
          v60 = v43;
          _os_log_impl(&dword_1D3052000, v41, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion no mode identifer for mindfulness session trigger; previousModeID=%{public}@",
            buf,
            0xCu);
        }
      }
      goto LABEL_25;
    }
    goto LABEL_19;
  }
  if (v9)
  {
    v12 = [v6 eventBody];
    uint64_t v13 = [v12 stateType];

    if (v13 != 2)
    {
      if (v13 == 1 && ![v10 count])
      {
        id v14 = objc_alloc_init(MEMORY[0x1E4F5F700]);
        [v14 setIdentifier:@"com.apple.donotdisturb.trigger.mindfulness"];
        [v14 setLifetime:0];
        [v14 setModeIdentifier:v9];
        id v55 = v11;
        id v15 = (id)[v8 triggerManager:self takeModeAssertionWithDetails:v14 clientIdentifier:@"com.apple.donotdisturb.private.mindfulness-trigger" error:&v55];
        id v16 = v55;

        v17 = DNDSLogMindfulnessTrigger;
        if (os_log_type_enabled((os_log_t)DNDSLogMindfulnessTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v60 = v9;
          _os_log_impl(&dword_1D3052000, v17, OS_LOG_TYPE_DEFAULT, "Acquiring assertion for mindfulness session trigger in response to event; modeID=%{public}@",
            buf,
            0xCu);
        }
LABEL_25:

        goto LABEL_28;
      }
      goto LABEL_19;
    }
    if ([v10 count])
    {
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __56__DNDSMindfulnessTriggerManager__refreshWithMode_event___block_invoke;
      v53[3] = &unk_1E6973720;
      id v54 = v9;
      v30 = objc_msgSend(v10, "bs_filter:", v53);
      v31 = [v30 firstObject];

      if (v31)
      {
        v32 = [v31 UUID];
        id v52 = v11;
        id v33 = (id)[v8 triggerManager:self invalidateModeAssertionWithUUID:v32 reason:3 reasonOverride:0 clientIdentifier:@"com.apple.donotdisturb.private.mindfulness-trigger" error:&v52];
        id v16 = v52;

        v34 = (void *)DNDSLogMindfulnessTrigger;
        if (os_log_type_enabled((os_log_t)DNDSLogMindfulnessTrigger, OS_LOG_TYPE_DEFAULT))
        {
          v35 = v34;
          v36 = [v31 details];
          v37 = [v36 modeIdentifier];
          *(_DWORD *)buf = 138543362;
          v60 = v37;
          _os_log_impl(&dword_1D3052000, v35, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion for mindfulness session trigger in response to event; previousModeID=%{public}@",
            buf,
            0xCu);
        }
      }
      else
      {
        id v16 = v11;
      }

      goto LABEL_28;
    }
LABEL_19:
    id v16 = v11;
    goto LABEL_28;
  }
  if (![v10 count]) {
    goto LABEL_19;
  }
  v22 = [v10 firstObject];
  v23 = [v22 UUID];
  id v51 = v11;
  id v24 = (id)[v8 triggerManager:self invalidateModeAssertionWithUUID:v23 reason:3 reasonOverride:0 clientIdentifier:@"com.apple.donotdisturb.private.mindfulness-trigger" error:&v51];
  id v16 = v51;

  v25 = (void *)DNDSLogMindfulnessTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogMindfulnessTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v26 = v25;
    v27 = [v10 firstObject];
    v28 = [v27 details];
    v29 = [v28 modeIdentifier];
    *(_DWORD *)buf = 138543362;
    v60 = v29;
    _os_log_impl(&dword_1D3052000, v26, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion for mindfulness session trigger in response to event, trigger is disabled; previousM"
      "odeID=%{public}@",
      buf,
      0xCu);
  }
LABEL_28:
}

uint64_t __56__DNDSMindfulnessTriggerManager__refreshWithMode_event___block_invoke(uint64_t a1, void *a2)
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
    id v7 = DNDSLogMindfulnessTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogMindfulnessTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v4;
      _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Adding biome mindfulness session event monitor; mode=%{public}@",
        buf,
        0xCu);
    }
    objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"com.apple.donotdisturb.mindfulnessTrigger" targetQueue:self->_biomeQueue];
    uint64_t v9 = [MEMORY[0x1E4F504C8] mindfulnessStream];
    v10 = [v9 publisher];
    id v11 = [v10 subscribeOn:v8];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __59__DNDSMindfulnessTriggerManager__configureTriggerWithMode___block_invoke_19;
    id v15 = &unk_1E6974280;
    id v16 = self;
    id v17 = v4;
    id v6 = [v11 sinkWithCompletion:&__block_literal_global_28 receiveInput:&v12];

    [(NSMutableDictionary *)self->_sinks setObject:v6, @"system", v12, v13, v14, v15, v16 forKeyedSubscript];
  }
}

void __59__DNDSMindfulnessTriggerManager__configureTriggerWithMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)DNDSLogMindfulnessTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogMindfulnessTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = a2;
    uint64_t v6 = [v5 state];
    id v7 = [v5 error];

    int v8 = 134218242;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    id v11 = v7;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Mindfulness session subscription completed: state=%ld error=%{public}@", (uint8_t *)&v8, 0x16u);
  }
}

void __59__DNDSMindfulnessTriggerManager__configureTriggerWithMode___block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)DNDSLogMindfulnessTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogMindfulnessTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    uint64_t v6 = [v3 eventBody];
    uint64_t v7 = [v6 stateType];
    if ((unint64_t)(v7 - 1) > 3) {
      int v8 = @"unspecified";
    }
    else {
      int v8 = off_1E6975190[v7 - 1];
    }
    int v16 = 138543362;
    id v17 = v8;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Received mindfulness session event: eventType=%{public}@", (uint8_t *)&v16, 0xCu);
  }
  [*(id *)(a1 + 32) _refreshWithMode:*(void *)(a1 + 40) event:v3];
  uint64_t v9 = (id)DNDSLogMindfulnessTrigger;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = [v3 eventBody];
    unint64_t v11 = [v10 stateType] - 1;
    if (v11 > 3) {
      uint64_t v12 = @"unspecified";
    }
    else {
      uint64_t v12 = off_1E6975190[v11];
    }
    uint64_t v13 = [v3 eventBody];
    unint64_t v14 = [v13 sessionType];
    if (v14 > 2) {
      id v15 = @"unspecified";
    }
    else {
      id v15 = off_1E69751B0[v14];
    }
    int v16 = 138543618;
    id v17 = v12;
    __int16 v18 = 2114;
    id v19 = v15;
    _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "Updated assertions for mindfulness session event: eventType=%{public}@ sessionType=%{public}@", (uint8_t *)&v16, 0x16u);
  }
}

- (BOOL)_featureEnabled
{
  return 1;
}

- (DNDSMindfulnessTriggerManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (DNDSMindfulnessTriggerManagerDataSource *)WeakRetained;
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