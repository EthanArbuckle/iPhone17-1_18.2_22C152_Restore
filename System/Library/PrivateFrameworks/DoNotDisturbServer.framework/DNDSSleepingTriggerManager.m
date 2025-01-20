@interface DNDSSleepingTriggerManager
- (BOOL)_featureEnabled;
- (DNDSSleepingTriggerManager)init;
- (DNDSSleepingTriggerManagerDataSource)dataSource;
- (void)_configureSleepingTriggerWithMode:(id)a3;
- (void)_refreshWithMode:(id)a3 event:(id)a4;
- (void)refresh;
- (void)setDataSource:(id)a3;
@end

@implementation DNDSSleepingTriggerManager

- (DNDSSleepingTriggerManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)DNDSSleepingTriggerManager;
  v2 = [(DNDSSleepingTriggerManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[DNDSWorkloop serialQueueTargetingSharedWorkloop:@"com.apple.donotdisturb.private.biome-sleeping.queue"];
    biomeQueue = v2->_biomeQueue;
    v2->_biomeQueue = (OS_dispatch_queue *)v3;

    if ([(DNDSSleepingTriggerManager *)v2 _featureEnabled])
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
  if ([(DNDSSleepingTriggerManager *)self _featureEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v4 = [WeakRetained sleepingModeForSleepingTriggerManager:self];

    [(DNDSSleepingTriggerManager *)self _configureSleepingTriggerWithMode:v4];
    [(DNDSSleepingTriggerManager *)self _refreshWithMode:v4 event:0];
    uint64_t v5 = DNDSLogSleepingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      objc_super v8 = v4;
      _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Updated assertions for sleeping trigger: mode=%{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    v6 = DNDSLogSleepingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "No action taken for request to refresh sleeping trigger; automatic entry not supported",
        (uint8_t *)&v7,
        2u);
    }
  }
}

- (void)_refreshWithMode:(id)a3 event:(id)a4
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(DNDSSleepingTriggerManager *)self dataSource];
  uint64_t v9 = [v6 modeIdentifier];
  id v115 = 0;
  v10 = [v8 triggerManager:self assertionsWithClientIdentifer:@"com.apple.donotdisturb.private.sleeping-trigger" error:&v115];
  id v11 = v115;
  v12 = [v10 firstObject];
  if (v7)
  {
    v13 = [v7 eventBody];
    uint64_t v14 = [v13 sleepModeChangeReason];

    if ((unint64_t)(v14 - 7) <= 1)
    {
      v15 = (id)DNDSLogSleepingTrigger;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v94 = v10;
        v85 = v8;
        v16 = [v7 eventBody];
        unint64_t v17 = [v16 sleepModeChangeReason];
        if (v17 > 9) {
          v18 = @"unspecified";
        }
        else {
          v18 = off_1E69749F0[v17];
        }
        id v96 = v6;
        v93 = v9;
        v55 = [v7 eventBody];
        unint64_t v56 = [v55 sleepModeState];
        v57 = v12;
        if (v56 > 2) {
          v58 = @"unspecified";
        }
        else {
          v58 = off_1E6974A40[v56];
        }
        v59 = [v7 eventBody];
        v60 = [v59 expectedEndDate];
        *(_DWORD *)buf = 138543874;
        v118 = v18;
        __int16 v119 = 2114;
        v120 = v58;
        __int16 v121 = 2114;
        v122 = v60;
        _os_log_impl(&dword_1D3052000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring event: reason=%{public}@ state=%{public}@ expectedEnd=%{public}@", buf, 0x20u);

        objc_super v8 = v85;
        uint64_t v9 = v93;
        v10 = v94;
        v12 = v57;
LABEL_37:
        id v6 = v96;
      }
LABEL_54:

      goto LABEL_55;
    }
    if (v9)
    {
      v95 = v10;
      v91 = v7;
      id v112 = v11;
      v23 = [v8 triggerManager:self assertionsWithClientIdentifer:@"com.apple.focus.activity-manager" error:&v112];
      id v84 = v112;

      v110[0] = MEMORY[0x1E4F143A8];
      v110[1] = 3221225472;
      v110[2] = __53__DNDSSleepingTriggerManager__refreshWithMode_event___block_invoke;
      v110[3] = &unk_1E6973720;
      v24 = v9;
      v111 = v24;
      v25 = objc_msgSend(v23, "bs_filter:", v110);

      if (v12)
      {
        if ([v25 count])
        {
          v26 = DNDSLogSleepingTrigger;
          if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            v118 = (__CFString *)v24;
            __int16 v119 = 2114;
            v120 = v12;
            __int16 v121 = 2114;
            v122 = v25;
            _os_log_error_impl(&dword_1D3052000, v26, OS_LOG_TYPE_ERROR, "Existing assertions found for sleeping trigger manager and activity manager; modeID=%{public}@ assertion=%"
              "{public}@ userAssertion=%{public}@",
              buf,
              0x20u);
          }
        }
      }
      v86 = v12;
      uint64_t v27 = [v25 count];
      v83 = objc_msgSend(v25, "bs_compactMap:", &__block_literal_global_19);
      v28 = [v91 eventBody];
      uint64_t v29 = [v28 sleepModeState];

      if ((unint64_t)(v29 - 1) > 1)
      {
        v12 = v86;
        if (!v86 && !v27)
        {
          id v7 = v91;
          id v46 = v83;
          id v45 = v84;
LABEL_53:

          v15 = v111;
          id v11 = v45;
          goto LABEL_54;
        }
        v90 = self;
        v92 = v9;
        v71 = DNDSLogSleepingTrigger;
        if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v118 = (__CFString *)v24;
          __int16 v119 = 2114;
          v120 = v86;
          _os_log_impl(&dword_1D3052000, v71, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion for sleeping trigger in response to event; previousModeID=%{public}@ assertion=%{public}@",
            buf,
            0x16u);
        }
        long long v103 = 0u;
        long long v104 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        v82 = v25;
        id v72 = v25;
        uint64_t v73 = [v72 countByEnumeratingWithState:&v101 objects:v116 count:16];
        if (v73)
        {
          uint64_t v74 = v73;
          uint64_t v75 = *(void *)v102;
          do
          {
            for (uint64_t i = 0; i != v74; ++i)
            {
              if (*(void *)v102 != v75) {
                objc_enumerationMutation(v72);
              }
              v77 = DNDSLogSleepingTrigger;
              if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
              {
                v78 = *(__CFString **)(*((void *)&v101 + 1) + 8 * i);
                *(_DWORD *)buf = 138543618;
                v118 = (__CFString *)v24;
                __int16 v119 = 2114;
                v120 = v78;
                _os_log_impl(&dword_1D3052000, v77, OS_LOG_TYPE_DEFAULT, "Invalidating active user assertion for associated mode in response to event; previousModeID=%{public}@"
                  " assertion=%{public}@",
                  buf,
                  0x16u);
              }
            }
            uint64_t v74 = [v72 countByEnumeratingWithState:&v101 objects:v116 count:16];
          }
          while (v74);
        }

        v79 = [v83 arrayByAddingObject:@"com.apple.donotdisturb.private.sleeping-trigger"];

        v98[0] = MEMORY[0x1E4F143A8];
        v98[1] = 3221225472;
        v98[2] = __53__DNDSSleepingTriggerManager__refreshWithMode_event___block_invoke_17;
        v98[3] = &unk_1E6973798;
        id v46 = v79;
        id v99 = v46;
        v100 = v24;
        id v80 = (id)[v8 triggerManager:v90 performModeAssertionUpdatesWithHandler:v98];

        id v68 = v99;
        v10 = v95;
        v12 = v86;
        id v45 = v84;
      }
      else
      {
        v81 = v25;
        v92 = v9;
        BOOL v30 = v27 != 0;
        id v31 = objc_alloc_init(MEMORY[0x1E4F5F700]);
        [v31 setIdentifier:@"com.apple.donotdisturb.trigger.sleeping"];
        [v31 setModeIdentifier:v24];
        v32 = [v91 eventBody];
        v33 = [v32 expectedEndDate];
        [v31 setUserVisibleEndDate:v33];

        v34 = [v91 eventBody];
        unint64_t v35 = [v34 sleepModeChangeReason] - 1;
        v12 = v86;
        if (v35 > 7) {
          uint64_t v36 = 0;
        }
        else {
          uint64_t v36 = qword_1D3122038[v35];
        }
        id v45 = v84;
        objc_msgSend(v31, "setReason:", v36, v81);

        v105[0] = MEMORY[0x1E4F143A8];
        v105[1] = 3221225472;
        v105[2] = __53__DNDSSleepingTriggerManager__refreshWithMode_event___block_invoke_2;
        v105[3] = &unk_1E6974468;
        BOOL v109 = v30;
        id v106 = v83;
        v107 = v24;
        id v108 = v31;
        id v68 = v31;
        v69 = self;
        id v46 = v106;
        id v70 = (id)[v8 triggerManager:v69 performModeAssertionUpdatesWithHandler:v105];
      }
      id v7 = v91;
      uint64_t v9 = v92;
      v25 = v82;
      goto LABEL_53;
    }
    if ([v10 count])
    {
      v87 = self;
      v37 = (void *)DNDSLogSleepingTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v38 = v37;
        v39 = [(__CFString *)v12 details];
        [v39 modeIdentifier];
        id v40 = v6;
        v41 = v12;
        v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v118 = v42;
        _os_log_impl(&dword_1D3052000, v38, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion no mode identifer for sleeping trigger in response to event; previousModeID=%{public}@",
          buf,
          0xCu);

        v12 = v41;
        id v6 = v40;
      }
      v15 = [(__CFString *)v12 UUID];
      id v97 = v11;
      id v43 = (id)[v8 triggerManager:v87 invalidateModeAssertionWithUUID:v15 reason:3 reasonOverride:0 clientIdentifier:@"com.apple.donotdisturb.private.sleeping-trigger" error:&v97];
      v44 = v97;
LABEL_28:
      id v54 = v44;

      id v11 = v54;
      goto LABEL_54;
    }
  }
  else if ([v10 count])
  {
    if (!v9)
    {
      v88 = self;
      v47 = (void *)DNDSLogSleepingTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v48 = v47;
        v49 = [(__CFString *)v12 details];
        [v49 modeIdentifier];
        id v50 = v6;
        v51 = v12;
        v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v118 = v52;
        _os_log_impl(&dword_1D3052000, v48, OS_LOG_TYPE_DEFAULT, "Invalidating active assertion no mode identifer for sleeping trigger; previousModeID=%{public}@",
          buf,
          0xCu);

        v12 = v51;
        id v6 = v50;
      }
      v15 = [(__CFString *)v12 UUID];
      id v114 = v11;
      id v53 = (id)[v8 triggerManager:v88 invalidateModeAssertionWithUUID:v15 reason:2 reasonOverride:0 clientIdentifier:@"com.apple.donotdisturb.private.sleeping-trigger" error:&v114];
      v44 = v114;
      goto LABEL_28;
    }
    id v96 = v6;
    v19 = [(__CFString *)v12 details];
    v20 = [v19 modeIdentifier];
    v21 = v12;
    char v22 = [(__CFString *)v9 isEqualToString:v20];

    if ((v22 & 1) == 0)
    {
      v89 = self;
      v61 = [(__CFString *)v21 details];
      v15 = [v61 mutableCopy];

      [v15 setModeIdentifier:v9];
      v62 = (void *)DNDSLogSleepingTrigger;
      v12 = v21;
      if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v63 = v62;
        v64 = [(__CFString *)v21 details];
        v65 = [v64 modeIdentifier];
        *(_DWORD *)buf = 138543618;
        v118 = v9;
        __int16 v119 = 2114;
        v120 = v65;
        _os_log_impl(&dword_1D3052000, v63, OS_LOG_TYPE_DEFAULT, "Updating active assertion to new mode identifer for sleeping trigger; modeID=%{public}@ previousModeID=%{public}@",
          buf,
          0x16u);

        v12 = v21;
      }
      id v113 = v11;
      id v66 = (id)[v8 triggerManager:v89 takeModeAssertionWithDetails:v15 clientIdentifier:@"com.apple.donotdisturb.private.sleeping-trigger" error:&v113];
      id v67 = v113;

      id v11 = v67;
      goto LABEL_37;
    }
    v12 = v21;
    id v6 = v96;
  }
LABEL_55:
}

uint64_t __53__DNDSSleepingTriggerManager__refreshWithMode_event___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 details];
  v4 = [v3 modeIdentifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

id __53__DNDSSleepingTriggerManager__refreshWithMode_event___block_invoke_9(uint64_t a1, void *a2)
{
  v2 = [a2 source];
  uint64_t v3 = [v2 clientIdentifier];

  return v3;
}

uint64_t __53__DNDSSleepingTriggerManager__refreshWithMode_event___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 56))
  {
    v4 = +[DNDSModeAssertionInvalidationPredicate predicateForAssertionClientIdentifiers:*(void *)(a1 + 32)];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F5F650]) initWithClientIdentifier:@"com.apple.donotdisturb.private.sleeping-trigger" deviceIdentifier:0];
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    id v7 = +[DNDSModeAssertionInvalidationRequest requestWithPredicate:v4 requestDate:v6 details:0 source:v5 reason:4 reasonOverride:0];

    objc_super v8 = (void *)DNDSLogSleepingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v9 = *(void **)(a1 + 48);
      id v11 = v8;
      v12 = [v9 lifetime];
      int v24 = 138543618;
      uint64_t v25 = v10;
      __int16 v26 = 2114;
      uint64_t v27 = v12;
      _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_DEFAULT, "Invalidating user assertion(s) for mode in response to event; modeID=%{public}@ lifetime=%{public}@",
        (uint8_t *)&v24,
        0x16u);
    }
    id v13 = (id)[v3 invalidateAssertionsForRequest:v7];
  }
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F5F650]) initWithClientIdentifier:@"com.apple.donotdisturb.private.sleeping-trigger" deviceIdentifier:0];
  v15 = (void *)DNDSLogSleepingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 40);
    v16 = *(void **)(a1 + 48);
    v18 = v15;
    v19 = [v16 lifetime];
    int v24 = 138543618;
    uint64_t v25 = v17;
    __int16 v26 = 2114;
    uint64_t v27 = v19;
    _os_log_impl(&dword_1D3052000, v18, OS_LOG_TYPE_DEFAULT, "Acquiring assertion for sleeping trigger in response to event; modeID=%{public}@ lifetime=%{public}@",
      (uint8_t *)&v24,
      0x16u);
  }
  uint64_t v20 = *(void *)(a1 + 48);
  v21 = [MEMORY[0x1E4F1C9C8] date];
  id v22 = (id)[v3 takeAssertionWithDetails:v20 source:v14 startDate:v21];

  return 1;
}

uint64_t __53__DNDSSleepingTriggerManager__refreshWithMode_event___block_invoke_17(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[DNDSModeAssertionInvalidationPredicate predicateForAssertionClientIdentifiers:*(void *)(a1 + 32)];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F5F650]) initWithClientIdentifier:@"com.apple.donotdisturb.private.sleeping-trigger" deviceIdentifier:0];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = +[DNDSModeAssertionInvalidationRequest requestWithPredicate:v4 requestDate:v6 details:0 source:v5 reason:3 reasonOverride:0];

  objc_super v8 = DNDSLogSleepingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    int v12 = 138543362;
    uint64_t v13 = v9;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Invalidating assertion(s) for mode in response to event; modeID=%{public}@",
      (uint8_t *)&v12,
      0xCu);
  }
  id v10 = (id)[v3 invalidateAssertionsForRequest:v7];

  return 1;
}

- (void)_configureSleepingTriggerWithMode:(id)a3
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
    id v7 = DNDSLogSleepingTrigger;
    if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v4;
      _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Adding biome sleeping event monitor; mode=%{public}@",
        buf,
        0xCu);
    }
    objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"com.apple.donotdisturb.sleepingTrigger" targetQueue:self->_biomeQueue];
    uint64_t v9 = [MEMORY[0x1E4F504C8] sleepModeStream];
    id v10 = [v9 publisher];
    id v11 = [v10 subscribeOn:v8];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __64__DNDSSleepingTriggerManager__configureSleepingTriggerWithMode___block_invoke_29;
    v15 = &unk_1E6974280;
    v16 = self;
    id v17 = v4;
    id v6 = [v11 sinkWithCompletion:&__block_literal_global_28 receiveInput:&v12];

    [(NSMutableDictionary *)self->_sinks setObject:v6, @"system", v12, v13, v14, v15, v16 forKeyedSubscript];
  }
}

void __64__DNDSSleepingTriggerManager__configureSleepingTriggerWithMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)DNDSLogSleepingTrigger;
  if (os_log_type_enabled((os_log_t)DNDSLogSleepingTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = a2;
    uint64_t v6 = [v5 state];
    id v7 = [v5 error];

    int v8 = 134218242;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    id v11 = v7;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Sleeping subscription completed: state=%ld error=%{public}@", (uint8_t *)&v8, 0x16u);
  }
}

void __64__DNDSSleepingTriggerManager__configureSleepingTriggerWithMode___block_invoke_29(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id)DNDSLogSleepingTrigger;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 eventBody];
    unint64_t v6 = [v5 sleepModeChangeReason];
    if (v6 > 9) {
      id v7 = @"unspecified";
    }
    else {
      id v7 = off_1E69749F0[v6];
    }
    int v8 = [v3 eventBody];
    unint64_t v9 = [v8 sleepModeState];
    if (v9 > 2) {
      __int16 v10 = @"unspecified";
    }
    else {
      __int16 v10 = off_1E6974A40[v9];
    }
    id v11 = [v3 eventBody];
    uint64_t v12 = [v11 expectedEndDate];
    [v3 timestamp];
    int v23 = 138544130;
    int v24 = v7;
    __int16 v25 = 2114;
    __int16 v26 = v10;
    __int16 v27 = 2114;
    uint64_t v28 = v12;
    __int16 v29 = 2048;
    uint64_t v30 = v13;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Received sleeping event: reason=%{public}@ state=%{public}@ expectedEnd=%{public}@ timestamp:%f", (uint8_t *)&v23, 0x2Au);
  }
  [*(id *)(a1 + 32) _refreshWithMode:*(void *)(a1 + 40) event:v3];
  uint64_t v14 = (id)DNDSLogSleepingTrigger;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v3 eventBody];
    unint64_t v16 = [v15 sleepModeChangeReason];
    if (v16 > 9) {
      id v17 = @"unspecified";
    }
    else {
      id v17 = off_1E69749F0[v16];
    }
    v18 = [v3 eventBody];
    unint64_t v19 = [v18 sleepModeState];
    if (v19 > 2) {
      uint64_t v20 = @"unspecified";
    }
    else {
      uint64_t v20 = off_1E6974A40[v19];
    }
    v21 = [v3 eventBody];
    id v22 = [v21 expectedEndDate];
    int v23 = 138543874;
    int v24 = v17;
    __int16 v25 = 2114;
    __int16 v26 = v20;
    __int16 v27 = 2114;
    uint64_t v28 = v22;
    _os_log_impl(&dword_1D3052000, v14, OS_LOG_TYPE_DEFAULT, "Processed sleeping event: reason=%{public}@ state=%{public}@ expectedEnd=%{public}@", (uint8_t *)&v23, 0x20u);
  }
}

- (BOOL)_featureEnabled
{
  return 1;
}

- (DNDSSleepingTriggerManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (DNDSSleepingTriggerManagerDataSource *)WeakRetained;
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