@interface DNDSDrivingTriggerManager
- (BOOL)_featureEnabled;
- (DNDSDrivingTriggerManager)init;
- (DNDSDrivingTriggerManagerDataSource)dataSource;
- (void)_configureDrivingTriggerWithMode:(id)a3;
- (void)_refreshWithMode:(id)a3 event:(id)a4;
- (void)refresh;
- (void)setDataSource:(id)a3;
@end

@implementation DNDSDrivingTriggerManager

- (DNDSDrivingTriggerManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)DNDSDrivingTriggerManager;
  v2 = [(DNDSDrivingTriggerManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[DNDSWorkloop serialQueueTargetingSharedWorkloop:@"com.apple.donotdisturb.private.biome-driving.queue"];
    biomeQueue = v2->_biomeQueue;
    v2->_biomeQueue = (OS_dispatch_queue *)v3;

    if ([(DNDSDrivingTriggerManager *)v2 _featureEnabled])
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
      sinks = v2->_sinks;
      v2->_sinks = (NSMutableDictionary *)v5;

      v2->_lock._os_unfair_lock_opaque = 0;
      v7 = (CARAutomaticDNDStatus *)objc_alloc_init(MEMORY[0x1E4F57EC8]);
      status = v2->_status;
      v2->_status = v7;

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)DNDDrivingTriggerObserverCallback, (CFStringRef)*MEMORY[0x1E4F57E98], 0, CFNotificationSuspensionBehaviorCoalesce);
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)DNDDrivingTriggerObserverCallback, (CFStringRef)*MEMORY[0x1E4F57EA0], 0, CFNotificationSuspensionBehaviorCoalesce);
    }
  }
  return v2;
}

- (void)refresh
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F57EC8] isAutomaticDNDAvailable]
    && [(DNDSDrivingTriggerManager *)self _featureEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v4 = [WeakRetained drivingModeForDrivingTriggerManager:self];

    [(DNDSDrivingTriggerManager *)self _configureDrivingTriggerWithMode:v4];
    [(DNDSDrivingTriggerManager *)self _refreshWithMode:v4 event:0];
    uint64_t v5 = DNDSLogDrivingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Updated assertions for driving trigger: mode=%{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    v6 = DNDSLogDrivingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "No action taken for request to refresh driving trigger; automatic entry not supported",
        (uint8_t *)&v7,
        2u);
    }
  }
}

- (void)_refreshWithMode:(id)a3 event:(id)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [(DNDSDrivingTriggerManager *)self dataSource];
  uint64_t v9 = [v6 eventBody];

  int v10 = [v9 isStart];
  objc_super v11 = [v7 modeIdentifier];

  id v75 = 0;
  v12 = [v8 triggerManager:self assertionsWithClientIdentifer:@"com.apple.donotdisturb.private.driving-trigger" error:&v75];
  id v13 = v75;
  v14 = [v12 firstObject];
  if (!v6)
  {
    if ([v12 count])
    {
      if (!v11)
      {
        v45 = (void *)DNDSLogDrivingTrigger;
        if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
        {
          v46 = v45;
          v47 = [v14 details];
          v48 = [v47 modeIdentifier];
          *(_DWORD *)buf = 138543362;
          id v77 = v48;
          _os_log_impl(&dword_1D3052000, v46, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion no mode identifer for driving trigger; previousModeID=%{public}@",
            buf,
            0xCu);
        }
        v30 = [v14 UUID];
        id v74 = v13;
        id v49 = (id)[v8 triggerManager:self invalidateModeAssertionWithUUID:v30 reason:2 reasonOverride:0 clientIdentifier:@"com.apple.donotdisturb.private.driving-trigger" error:&v74];
        v36 = v74;
        goto LABEL_21;
      }
      v26 = [v14 details];
      v27 = [v26 modeIdentifier];
      char v28 = [v11 isEqualToString:v27];

      if ((v28 & 1) == 0)
      {
        v29 = [v14 details];
        v30 = (void *)[v29 mutableCopy];

        [v30 setModeIdentifier:v11];
        v31 = (void *)DNDSLogDrivingTrigger;
        if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
        {
          v32 = v31;
          v33 = [v14 details];
          v34 = [v33 modeIdentifier];
          *(_DWORD *)buf = 138543618;
          id v77 = v11;
          __int16 v78 = 2114;
          v79 = v34;
          _os_log_impl(&dword_1D3052000, v32, OS_LOG_TYPE_DEFAULT, "Updating active assertion to new mode identifer for driving trigger; modeID=%{public}@ previousModeID=%{public}@",
            buf,
            0x16u);
        }
        id v73 = v13;
        id v35 = (id)[v8 triggerManager:self takeModeAssertionWithDetails:v30 clientIdentifier:@"com.apple.donotdisturb.private.driving-trigger" error:&v73];
        v36 = v73;
LABEL_21:
        id v25 = v36;

        goto LABEL_34;
      }
    }
LABEL_17:
    id v25 = v13;
    goto LABEL_34;
  }
  if (v11)
  {
    id v72 = v13;
    v15 = [v8 triggerManager:self assertionsWithClientIdentifer:@"com.apple.focus.activity-manager" error:&v72];
    id v16 = v72;

    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __52__DNDSDrivingTriggerManager__refreshWithMode_event___block_invoke;
    v70[3] = &unk_1E6973720;
    id v17 = v11;
    id v71 = v17;
    v18 = objc_msgSend(v15, "bs_filter:", v70);

    v61 = v18;
    uint64_t v19 = [v18 firstObject];
    v20 = (void *)v19;
    if (v14
      && v19
      && (v21 = DNDSLogDrivingTrigger,
          os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_ERROR)))
    {
      *(_DWORD *)buf = 138543874;
      id v77 = v17;
      __int16 v78 = 2114;
      v79 = v14;
      __int16 v80 = 2114;
      v81 = v20;
      _os_log_error_impl(&dword_1D3052000, v21, OS_LOG_TYPE_ERROR, "Existing assertions found for driving trigger manager and activity manager; modeID=%{public}@ assertion=%{public"
        "}@ userAssertion=%{public}@",
        buf,
        0x20u);
      if (v10) {
        goto LABEL_7;
      }
    }
    else if (v10)
    {
LABEL_7:
      id v22 = objc_alloc_init(MEMORY[0x1E4F5F700]);
      [v22 setIdentifier:@"com.apple.donotdisturb.trigger.driving"];
      [v22 setLifetime:0];
      [v22 setModeIdentifier:v17];
      [v22 setReason:3];
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __52__DNDSDrivingTriggerManager__refreshWithMode_event___block_invoke_32;
      v65[3] = &unk_1E6974468;
      BOOL v69 = v20 != 0;
      id v66 = v20;
      id v67 = v17;
      id v68 = v22;
      id v23 = v22;
      id v24 = (id)[v8 triggerManager:self performModeAssertionUpdatesWithHandler:v65];

      id v25 = v66;
      goto LABEL_32;
    }
    if (v20)
    {
      v50 = (void *)DNDSLogDrivingTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v51 = v50;
        v52 = [v20 details];
        v53 = [v52 modeIdentifier];
        *(_DWORD *)buf = 138543362;
        id v77 = v53;
        _os_log_impl(&dword_1D3052000, v51, OS_LOG_TYPE_DEFAULT, "Invalidating active user assertion in driving trigger in response to event; previousModeID=%{public}@",
          buf,
          0xCu);
      }
      v54 = [v20 UUID];
      id v64 = v16;
      id v55 = (id)[v8 triggerManager:self invalidateModeAssertionWithUUID:v54 reason:3 reasonOverride:0 clientIdentifier:@"com.apple.donotdisturb.private.driving-trigger" error:&v64];
      id v25 = v64;

      if (!v14) {
        goto LABEL_33;
      }
    }
    else
    {
      id v25 = v16;
      if (!v14)
      {
LABEL_33:

        goto LABEL_34;
      }
    }
    v56 = (void *)DNDSLogDrivingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v57 = v56;
      v58 = [v14 details];
      v59 = [v58 modeIdentifier];
      *(_DWORD *)buf = 138543362;
      id v77 = v59;
      _os_log_impl(&dword_1D3052000, v57, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion in driving trigger in response to event; previousModeID=%{public}@",
        buf,
        0xCu);
    }
    id v23 = [v14 UUID];
    id v63 = v25;
    id v60 = (id)[v8 triggerManager:self invalidateModeAssertionWithUUID:v23 reason:3 reasonOverride:0 clientIdentifier:@"com.apple.donotdisturb.private.driving-trigger" error:&v63];
    id v16 = v63;
LABEL_32:

    id v25 = v16;
    goto LABEL_33;
  }
  if (![v12 count]) {
    goto LABEL_17;
  }
  v37 = [v12 firstObject];
  v38 = [v37 UUID];
  id v62 = v13;
  id v39 = (id)[v8 triggerManager:self invalidateModeAssertionWithUUID:v38 reason:3 reasonOverride:0 clientIdentifier:@"com.apple.donotdisturb.private.driving-trigger" error:&v62];
  id v25 = v62;

  v40 = (void *)DNDSLogDrivingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v41 = v40;
    v42 = [v12 firstObject];
    v43 = [v42 details];
    v44 = [v43 modeIdentifier];
    *(_DWORD *)buf = 138543362;
    id v77 = v44;
    _os_log_impl(&dword_1D3052000, v41, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion no mode identifer for driving trigger in response to event; previousModeID=%{public}@",
      buf,
      0xCu);
  }
LABEL_34:
}

uint64_t __52__DNDSDrivingTriggerManager__refreshWithMode_event___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 details];
  v4 = [v3 modeIdentifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

uint64_t __52__DNDSDrivingTriggerManager__refreshWithMode_event___block_invoke_32(uint64_t a1, void *a2)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 56))
  {
    v4 = [*(id *)(a1 + 32) source];
    uint64_t v5 = [v4 clientIdentifier];
    v28[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    id v7 = +[DNDSModeAssertionInvalidationPredicate predicateForAssertionClientIdentifiers:v6];

    v8 = (void *)[objc_alloc(MEMORY[0x1E4F5F650]) initWithClientIdentifier:@"com.apple.donotdisturb.private.driving-trigger" deviceIdentifier:0];
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
    int v10 = +[DNDSModeAssertionInvalidationRequest requestWithPredicate:v7 requestDate:v9 details:0 source:v8 reason:4 reasonOverride:0];

    objc_super v11 = (void *)DNDSLogDrivingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      v12 = *(void **)(a1 + 48);
      v14 = v11;
      v15 = [v12 lifetime];
      int v24 = 138543618;
      uint64_t v25 = v13;
      __int16 v26 = 2114;
      v27 = v15;
      _os_log_impl(&dword_1D3052000, v14, OS_LOG_TYPE_DEFAULT, "Invalidating user assertion for mode in response to event; modeID=%{public}@ lifetime=%{public}@",
        (uint8_t *)&v24,
        0x16u);
    }
    id v16 = (id)[v3 invalidateAssertionsForRequest:v10];
  }
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F5F650]) initWithClientIdentifier:@"com.apple.donotdisturb.private.driving-trigger" deviceIdentifier:0];
  v18 = DNDSLogDrivingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 40);
    int v24 = 138543362;
    uint64_t v25 = v19;
    _os_log_impl(&dword_1D3052000, v18, OS_LOG_TYPE_DEFAULT, "Acquiring assertion for driving trigger in response to event; modeID=%{public}@",
      (uint8_t *)&v24,
      0xCu);
  }
  uint64_t v20 = *(void *)(a1 + 48);
  v21 = [MEMORY[0x1E4F1C9C8] date];
  id v22 = (id)[v3 takeAssertionWithDetails:v20 source:v17 startDate:v21];

  return 1;
}

- (void)_configureDrivingTriggerWithMode:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
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
    id v7 = DNDSLogDrivingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v4;
      _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Adding biome driving event monitor; mode=%{public}@",
        buf,
        0xCu);
    }
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"com.apple.donotdisturb.drivingTrigger" targetQueue:self->_biomeQueue];
    uint64_t v9 = [MEMORY[0x1E4F504C8] doNotDisturbWhileDrivingStream];
    int v10 = [v9 publisher];
    objc_super v11 = [v10 subscribeOn:v8];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62__DNDSDrivingTriggerManager__configureDrivingTriggerWithMode___block_invoke_48;
    v19[3] = &unk_1E6974280;
    v19[4] = self;
    id v12 = v4;
    id v20 = v12;
    uint64_t v13 = [v11 sinkWithCompletion:&__block_literal_global_16 receiveInput:v19];

    [(NSMutableDictionary *)self->_sinks setObject:v13 forKeyedSubscript:@"system"];
    v14 = [MEMORY[0x1E4F504C8] doNotDisturbWhileDrivingStream];
    v15 = [v14 publisherFromStartTime:CFAbsoluteTimeGetCurrent() + -2.0];
    id v16 = [v15 last];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__DNDSDrivingTriggerManager__configureDrivingTriggerWithMode___block_invoke_59;
    v17[3] = &unk_1E6974280;
    v17[4] = self;
    id v18 = v12;
    id v6 = [v16 sinkWithCompletion:&__block_literal_global_58_0 receiveInput:v17];
  }
  os_unfair_lock_unlock(&self->_lock);
}

void __62__DNDSDrivingTriggerManager__configureDrivingTriggerWithMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)DNDSLogDrivingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = a2;
    uint64_t v6 = [v5 state];
    id v7 = [v5 error];

    int v8 = 134218242;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    objc_super v11 = v7;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Driving subscription completed: state=%ld error=%{public}@", (uint8_t *)&v8, 0x16u);
  }
}

void __62__DNDSDrivingTriggerManager__configureDrivingTriggerWithMode___block_invoke_48(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)DNDSLogDrivingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    uint64_t v6 = [v3 eventBody];
    unint64_t v7 = [v6 reason];
    if (v7 > 6) {
      int v8 = @"unspecified";
    }
    else {
      int v8 = off_1E6974488[v7];
    }
    uint64_t v9 = [v3 eventBody];
    if ([v9 isStart]) {
      __int16 v10 = @"Y";
    }
    else {
      __int16 v10 = @"N";
    }
    int v18 = 138543618;
    uint64_t v19 = v8;
    __int16 v20 = 2114;
    v21 = v10;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Received driving event: reason=%{public}@ starting=%{public}@", (uint8_t *)&v18, 0x16u);
  }
  [*(id *)(a1 + 32) _refreshWithMode:*(void *)(a1 + 40) event:v3];
  objc_super v11 = (void *)DNDSLogDrivingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    uint64_t v13 = [v3 eventBody];
    unint64_t v14 = [v13 reason];
    if (v14 > 6) {
      v15 = @"unspecified";
    }
    else {
      v15 = off_1E6974488[v14];
    }
    id v16 = [v3 eventBody];
    if ([v16 isStart]) {
      id v17 = @"Y";
    }
    else {
      id v17 = @"N";
    }
    int v18 = 138543618;
    uint64_t v19 = v15;
    __int16 v20 = 2114;
    v21 = v17;
    _os_log_impl(&dword_1D3052000, v12, OS_LOG_TYPE_DEFAULT, "Updated assertions for driving event: reason=%{public}@ starting=%{public}@", (uint8_t *)&v18, 0x16u);
  }
}

void __62__DNDSDrivingTriggerManager__configureDrivingTriggerWithMode___block_invoke_56(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)DNDSLogDrivingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = a2;
    uint64_t v6 = [v5 state];
    unint64_t v7 = [v5 error];

    int v8 = 134218242;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    objc_super v11 = v7;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Driving most recent event in the past 2s completed: state=%ld error=%{public}@", (uint8_t *)&v8, 0x16u);
  }
}

void __62__DNDSDrivingTriggerManager__configureDrivingTriggerWithMode___block_invoke_59(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)DNDSLogDrivingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      uint64_t v6 = [v3 eventBody];
      unint64_t v7 = [v6 reason];
      if (v7 > 6) {
        int v8 = @"unspecified";
      }
      else {
        int v8 = off_1E6974488[v7];
      }
      uint64_t v9 = [v3 eventBody];
      if ([v9 isStart]) {
        __int16 v10 = @"Y";
      }
      else {
        __int16 v10 = @"N";
      }
      int v18 = 138543618;
      uint64_t v19 = v8;
      __int16 v20 = 2114;
      v21 = v10;
      _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Received last driving event in the prior 2s: reason=%{public}@ starting=%{public}@", (uint8_t *)&v18, 0x16u);
    }
    [*(id *)(a1 + 32) _refreshWithMode:*(void *)(a1 + 40) event:v3];
    objc_super v11 = (void *)DNDSLogDrivingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogDrivingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v11;
      uint64_t v13 = [v3 eventBody];
      unint64_t v14 = [v13 reason];
      if (v14 > 6) {
        v15 = @"unspecified";
      }
      else {
        v15 = off_1E6974488[v14];
      }
      id v16 = [v3 eventBody];
      if ([v16 isStart]) {
        id v17 = @"Y";
      }
      else {
        id v17 = @"N";
      }
      int v18 = 138543618;
      uint64_t v19 = v15;
      __int16 v20 = 2114;
      v21 = v17;
      _os_log_impl(&dword_1D3052000, v12, OS_LOG_TYPE_DEFAULT, "Updated assertions for last driving event in the prior 2s: reason=%{public}@ starting=%{public}@", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (BOOL)_featureEnabled
{
  return 1;
}

- (DNDSDrivingTriggerManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (DNDSDrivingTriggerManagerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_sinks, 0);
  objc_storeStrong((id *)&self->_biomeQueue, 0);
}

@end