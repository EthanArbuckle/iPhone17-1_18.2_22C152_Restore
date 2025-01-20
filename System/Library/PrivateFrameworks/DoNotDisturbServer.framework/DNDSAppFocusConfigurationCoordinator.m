@interface DNDSAppFocusConfigurationCoordinator
- (BOOL)_removeTask:(id)a3 fromGroupWithIdentifier:(id)a4;
- (BOOL)_shouldExecuteActionOnApplicationWithBundleIdentifier:(id)a3;
- (DNDSAppFocusConfigurationCoordinator)initWithAppConfigurationManager:(id)a3 keybagProviding:(id)a4 xpcEventPublisher:(id)a5;
- (DNDSAppFocusConfigurationCoordinatorDelegate)delegate;
- (id)_currentModeIdentifier;
- (id)_groupIdentifierForStateUpdate:(id)a3;
- (void)_addTask:(id)a3 toGroupWithIdentifier:(id)a4;
- (void)_executeAction:(id)a3 orActionIdentifier:(id)a4 withBundleIdentifier:(id)a5 modeIdentifier:(id)a6 groupIdentifier:(id)a7 exiting:(BOOL)a8 metadata:(id)a9;
- (void)_executeAction:(id)a3 orActionIdentifier:(id)a4 withBundleIdentifier:(id)a5 modeIdentifier:(id)a6 groupIdentifier:(id)a7 exiting:(BOOL)a8 metadataProvider:(id)a9;
- (void)_executeAction:(id)a3 withBundleIdentifier:(id)a4 modeIdentifier:(id)a5 groupIdentifier:(id)a6;
- (void)_executeOrQueueTask:(id)a3 completion:(id)a4;
- (void)_executeQueuedTaskFollowingTask:(id)a3;
- (void)_groupWithIdentifierCompleted:(id)a3;
- (void)_incrementTasksExecutedForGroupWithIdentifier:(id)a3;
- (void)_workQueue_handleFirstLaunch;
- (void)_xpcCheckIn;
- (void)appConfigurationManager:(id)a3 didClearActionWithIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6;
- (void)appConfigurationManager:(id)a3 didClearActionsForAppsInModeIdentifiers:(id)a4;
- (void)appConfigurationManager:(id)a3 didSetAction:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6;
- (void)handleStateUpdate:(id)a3;
- (void)keybagDidUnlockForTheFirstTime:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation DNDSAppFocusConfigurationCoordinator

- (DNDSAppFocusConfigurationCoordinator)initWithAppConfigurationManager:(id)a3 keybagProviding:(id)a4 xpcEventPublisher:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)DNDSAppFocusConfigurationCoordinator;
  v12 = [(DNDSAppFocusConfigurationCoordinator *)&v23 init];
  if (v12)
  {
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.donotdisturb.private.app-focus-filter.queue", v13);
    workQueue = v12->_workQueue;
    v12->_workQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v12->_appConfigurationManager, a3);
    [v9 addDelegate:v12];
    objc_storeStrong((id *)&v12->_xpcEventPublisher, a5);
    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    queuedTasksByBundleIdentifier = v12->_queuedTasksByBundleIdentifier;
    v12->_queuedTasksByBundleIdentifier = (NSMutableDictionary *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    taskGroups = v12->_taskGroups;
    v12->_taskGroups = (NSMutableDictionary *)v18;

    uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
    groupDetails = v12->_groupDetails;
    v12->_groupDetails = (NSMutableDictionary *)v20;

    [(DNDSAppFocusConfigurationCoordinator *)v12 _xpcCheckIn];
    objc_storeStrong((id *)&v12->_keybag, a4);
  }

  return v12;
}

- (void)handleStateUpdate:(id)a3
{
  id v4 = a3;
  if ([(DNDSKeybagStateProviding *)self->_keybag hasUnlockedSinceBoot])
  {
    v5 = [v4 previousState];
    v6 = [v5 activeModeConfiguration];
    v7 = [v6 mode];

    v8 = [v4 state];
    id v9 = [v8 activeModeConfiguration];
    id v10 = [v9 mode];

    id v11 = [v7 modeIdentifier];
    uint64_t v12 = [v10 modeIdentifier];
    if (v11 != (void *)v12)
    {
      v13 = (void *)v12;
      uint64_t v14 = [v7 modeIdentifier];
      if (v14)
      {
        v15 = (void *)v14;
        uint64_t v16 = [v10 modeIdentifier];
        if (v16)
        {
          v17 = (void *)v16;
          uint64_t v18 = [v7 modeIdentifier];
          v19 = [v10 modeIdentifier];
          int v23 = [v18 isEqual:v19];

          if (!v23) {
            goto LABEL_14;
          }
LABEL_10:
          v21 = DNDSLogAppFocusConfiguration;
          if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D3052000, v21, OS_LOG_TYPE_DEFAULT, "Ignoring request to coordinate app configurations; from and to mode are the same.",
              buf,
              2u);
          }
          goto LABEL_15;
        }
      }
LABEL_14:
      workQueue = self->_workQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__DNDSAppFocusConfigurationCoordinator_handleStateUpdate___block_invoke;
      block[3] = &unk_1E69735B8;
      id v25 = v4;
      v26 = self;
      dispatch_async(workQueue, block);

LABEL_15:
      goto LABEL_16;
    }

    goto LABEL_10;
  }
  uint64_t v20 = DNDSLogAppFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v20, OS_LOG_TYPE_DEFAULT, "Ignoring request to coordinate app configurations; device has not unlocked since boot.",
      buf,
      2u);
  }
LABEL_16:
}

void __58__DNDSAppFocusConfigurationCoordinator_handleStateUpdate___block_invoke(uint64_t a1)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  v2 = (void *)DNDSLogAppFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    id v4 = v2;
    v5 = [v3 state];
    v6 = [v5 activeModeIdentifier];
    v7 = [*(id *)(a1 + 32) previousState];
    v8 = [v7 activeModeIdentifier];
    *(_DWORD *)buf = 138543618;
    v77 = v6;
    __int16 v78 = 2114;
    v79 = v8;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Handling state update: %{public}@; previous: %{public}@",
      buf,
      0x16u);
  }
  id v9 = [*(id *)(a1 + 32) state];
  v55 = [v9 activeModeIdentifier];

  id v10 = [*(id *)(a1 + 40) _groupIdentifierForStateUpdate:*(void *)(a1 + 32)];
  id v54 = objc_alloc_init(MEMORY[0x1E4F72CD8]);
  id v11 = [*(id *)(a1 + 32) state];
  uint64_t v12 = [v11 activeModeIdentifier];

  uint64_t v56 = a1;
  v47 = (void *)v12;
  if (v12)
  {
    v13 = [*(id *)(*(void *)(a1 + 40) + 40) appActionsForModeIdentifier:v12 error:0];
    uint64_t v14 = (void *)[v13 mutableCopy];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v69 objects:v75 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v70 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v69 + 1) + 8 * i);
          v21 = [v15 objectForKeyedSubscript:v20];
          v22 = objc_msgSend(v21, "bs_filter:", &__block_literal_global_25);
          [v14 setObject:v22 forKeyedSubscript:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v69 objects:v75 count:16];
      }
      while (v17);
    }

    int v23 = (void *)[v14 copy];
  }
  else
  {
    int v23 = 0;
  }
  v24 = [*(id *)(a1 + 32) previousState];
  id v25 = [v24 activeModeIdentifier];

  if (v25)
  {
    v46 = v25;
    [*(id *)(*(void *)(a1 + 40) + 40) appActionsForModeIdentifier:v25 error:0];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = [v26 countByEnumeratingWithState:&v65 objects:v74 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v66;
      id v49 = v26;
      v50 = v23;
      uint64_t v48 = *(void *)v66;
      do
      {
        uint64_t v30 = 0;
        uint64_t v51 = v28;
        do
        {
          if (*(void *)v66 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v65 + 1) + 8 * v30);
          v32 = (void *)MEMORY[0x1D9430630]();
          v33 = [v23 objectForKeyedSubscript:v31];
          if (![v33 count])
          {
            v52 = v32;
            uint64_t v53 = v30;
            long long v63 = 0u;
            long long v64 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            v34 = [v26 objectForKeyedSubscript:v31];
            uint64_t v35 = [v34 countByEnumeratingWithState:&v61 objects:v73 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v62;
              do
              {
                for (uint64_t j = 0; j != v36; ++j)
                {
                  if (*(void *)v62 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  v39 = *(void **)(*((void *)&v61 + 1) + 8 * j);
                  if ([v39 isEnabled])
                  {
                    [*(id *)(v56 + 40) _incrementTasksExecutedForGroupWithIdentifier:v10];
                    v40 = *(void **)(v56 + 40);
                    v41 = [v39 action];
                    v42 = [v31 bundleID];
                    [v40 _executeAction:v41 orActionIdentifier:0 withBundleIdentifier:v42 modeIdentifier:v55 groupIdentifier:v10 exiting:1 metadataProvider:v54];
                  }
                }
                uint64_t v36 = [v34 countByEnumeratingWithState:&v61 objects:v73 count:16];
              }
              while (v36);
            }

            id v26 = v49;
            int v23 = v50;
            uint64_t v29 = v48;
            uint64_t v28 = v51;
            v32 = v52;
            uint64_t v30 = v53;
          }

          ++v30;
        }
        while (v30 != v28);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v65 objects:v74 count:16];
      }
      while (v28);
    }

    id v25 = v46;
    a1 = v56;
  }
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __58__DNDSAppFocusConfigurationCoordinator_handleStateUpdate___block_invoke_2;
  v57[3] = &unk_1E6974DC0;
  v57[4] = *(void *)(a1 + 40);
  id v58 = v10;
  id v59 = v55;
  id v60 = v54;
  id v43 = v54;
  id v44 = v55;
  id v45 = v10;
  [v23 enumerateKeysAndObjectsUsingBlock:v57];
}

uint64_t __58__DNDSAppFocusConfigurationCoordinator_handleStateUpdate___block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 isEnabled];
}

void __58__DNDSAppFocusConfigurationCoordinator_handleStateUpdate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x1D9430630]();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * v12);
        [*(id *)(a1 + 32) _incrementTasksExecutedForGroupWithIdentifier:*(void *)(a1 + 40)];
        uint64_t v14 = *(void **)(a1 + 32);
        id v15 = [v13 action];
        uint64_t v16 = [v5 bundleID];
        [v14 _executeAction:v15 orActionIdentifier:0 withBundleIdentifier:v16 modeIdentifier:*(void *)(a1 + 48) groupIdentifier:*(void *)(a1 + 40) exiting:0 metadataProvider:*(void *)(a1 + 56)];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

- (void)appConfigurationManager:(id)a3 didClearActionWithIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  workQueue = self->_workQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __133__DNDSAppFocusConfigurationCoordinator_appConfigurationManager_didClearActionWithIdentifier_forApplicationIdentifier_modeIdentifier___block_invoke;
  v16[3] = &unk_1E6974180;
  v16[4] = self;
  id v17 = v11;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(workQueue, v16);
}

void __133__DNDSAppFocusConfigurationCoordinator_appConfigurationManager_didClearActionWithIdentifier_forApplicationIdentifier_modeIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _currentModeIdentifier];
  int v3 = [v2 isEqualToString:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = (void *)DNDSLogAppFocusConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      id v5 = *(void **)(a1 + 56);
      v7 = v4;
      id v8 = [v5 bundleID];
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v16 = v6;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Running default action due to action deletion in active mode. identifier=%@; bundle=%@; mode=%@",
        buf,
        0x20u);
    }
    id v10 = [MEMORY[0x1E4F29128] UUID];
    id v11 = objc_alloc_init(MEMORY[0x1E4F72CD8]);
    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = [*(id *)(a1 + 56) bundleID];
    [v12 _executeAction:0 orActionIdentifier:v13 withBundleIdentifier:v14 modeIdentifier:*(void *)(a1 + 40) groupIdentifier:v10 exiting:1 metadataProvider:v11];
  }
}

- (void)appConfigurationManager:(id)a3 didSetAction:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  workQueue = self->_workQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __117__DNDSAppFocusConfigurationCoordinator_appConfigurationManager_didSetAction_forApplicationIdentifier_modeIdentifier___block_invoke;
  v16[3] = &unk_1E6974180;
  v16[4] = self;
  id v17 = v11;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(workQueue, v16);
}

void __117__DNDSAppFocusConfigurationCoordinator_appConfigurationManager_didSetAction_forApplicationIdentifier_modeIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _currentModeIdentifier];
  int v3 = [v2 isEqualToString:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 48) isEnabled] ^ 1;
    id v5 = (void *)DNDSLogAppFocusConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void **)(a1 + 48);
      v7 = v5;
      id v8 = [v6 identifier];
      id v9 = [*(id *)(a1 + 56) bundleID];
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Running action due to action update in active mode. identifier=%@; bundle=%@; mode=%@",
        buf,
        0x20u);
    }
    id v11 = [MEMORY[0x1E4F29128] UUID];
    id v12 = objc_alloc_init(MEMORY[0x1E4F72CD8]);
    id v13 = *(void **)(a1 + 32);
    id v14 = [*(id *)(a1 + 48) action];
    id v15 = [*(id *)(a1 + 56) bundleID];
    [v13 _executeAction:v14 orActionIdentifier:0 withBundleIdentifier:v15 modeIdentifier:*(void *)(a1 + 40) groupIdentifier:v11 exiting:v4 metadataProvider:v12];
  }
}

- (void)appConfigurationManager:(id)a3 didClearActionsForAppsInModeIdentifiers:(id)a4
{
  id v5 = a4;
  workQueue = self->_workQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __104__DNDSAppFocusConfigurationCoordinator_appConfigurationManager_didClearActionsForAppsInModeIdentifiers___block_invoke;
  v8[3] = &unk_1E69735B8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(workQueue, v8);
}

void __104__DNDSAppFocusConfigurationCoordinator_appConfigurationManager_didClearActionsForAppsInModeIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _currentModeIdentifier];
  int v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:v2];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:v2];
    id v5 = DNDSLogAppFocusConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v48 = v2;
      __int16 v49 = 2112;
      id v50 = v4;
      _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Running default actions due to deletion of active mode. mode=%@; apps=%@",
        buf,
        0x16u);
    }
    id v29 = objc_alloc_init(MEMORY[0x1E4F72CD8]);
    uint64_t v35 = [MEMORY[0x1E4F29128] UUID];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    obuint64_t j = v4;
    uint64_t v30 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v30)
    {
      uint64_t v28 = *(void *)v42;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v42 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = v6;
          id v7 = *(void **)(*((void *)&v41 + 1) + 8 * v6);
          context = (void *)MEMORY[0x1D9430630]();
          id v8 = [v7 bundleID];
          id v9 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v10 = [MEMORY[0x1E4F72DD8] focusConfigurationProtocol];
          id v11 = [v9 setWithObject:v10];
          id v40 = 0;
          id v12 = [v29 actionsConformingToSystemProtocols:v11 logicalType:1 bundleIdentifier:v8 error:&v40];
          id v13 = v40;

          if (v13)
          {
            id v14 = DNDSLogAppFocusConfiguration;
            if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v48 = v8;
              __int16 v49 = 2114;
              id v50 = v13;
              _os_log_error_impl(&dword_1D3052000, v14, OS_LOG_TYPE_ERROR, "Failed to find actions for %{public}@: %{public}@", buf, 0x16u);
            }
          }
          v31 = v13;
          v32 = v12;
          id v15 = [v12 objectForKeyedSubscript:v8];
          uint64_t v16 = [v15 allValues];

          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v17 = v16;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v45 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                uint64_t v22 = v2;
                if (*(void *)v37 != v20) {
                  objc_enumerationMutation(v17);
                }
                int v23 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                v24 = *(void **)(a1 + 32);
                id v25 = [v23 identifier];
                id v26 = v23;
                v2 = v22;
                [v24 _executeAction:0 orActionIdentifier:v25 withBundleIdentifier:v8 modeIdentifier:v22 groupIdentifier:v35 exiting:1 metadata:v26];
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v45 count:16];
            }
            while (v19);
          }

          uint64_t v6 = v34 + 1;
        }
        while (v34 + 1 != v30);
        uint64_t v30 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v30);
    }
  }
}

- (void)keybagDidUnlockForTheFirstTime:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__DNDSAppFocusConfigurationCoordinator_keybagDidUnlockForTheFirstTime___block_invoke;
  block[3] = &unk_1E6973540;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __71__DNDSAppFocusConfigurationCoordinator_keybagDidUnlockForTheFirstTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workQueue_handleFirstLaunch");
}

- (id)_currentModeIdentifier
{
  int v3 = [(DNDSAppFocusConfigurationCoordinator *)self delegate];
  uint64_t v4 = [v3 currentStateForAppFocusConfigurationCoordinator:self];
  id v5 = [v4 activeModeIdentifier];

  return v5;
}

- (void)_executeAction:(id)a3 orActionIdentifier:(id)a4 withBundleIdentifier:(id)a5 modeIdentifier:(id)a6 groupIdentifier:(id)a7 exiting:(BOOL)a8 metadataProvider:(id)a9
{
  BOOL v24 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  if (v14)
  {
    uint64_t v20 = [v14 identifier];

    id v15 = (id)v20;
  }
  id v25 = 0;
  uint64_t v21 = [v19 actionForBundleIdentifier:v16 andActionIdentifier:v15 error:&v25];
  id v22 = v25;
  if (v22)
  {
    int v23 = (void *)DNDSLogAppFocusConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDSAppFocusConfigurationCoordinator _executeAction:orActionIdentifier:withBundleIdentifier:modeIdentifier:groupIdentifier:exiting:metadataProvider:]((uint64_t)v16, v23, v22);
    }
  }
  [(DNDSAppFocusConfigurationCoordinator *)self _executeAction:v14 orActionIdentifier:v15 withBundleIdentifier:v16 modeIdentifier:v17 groupIdentifier:v18 exiting:v24 metadata:v21];
}

- (void)_executeAction:(id)a3 orActionIdentifier:(id)a4 withBundleIdentifier:(id)a5 modeIdentifier:(id)a6 groupIdentifier:(id)a7 exiting:(BOOL)a8 metadata:(id)a9
{
  BOOL v47 = a8;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v14)
  {
    uint64_t v20 = [v14 identifier];

    id v15 = (id)v20;
  }
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F72C18]) initWithType:0 bundleIdentifier:v16];
  BOOL v22 = [(DNDSAppFocusConfigurationCoordinator *)self _shouldExecuteActionOnApplicationWithBundleIdentifier:v16];
  if (!v19)
  {
    uint64_t v34 = DNDSLogAppFocusConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v59 = v15;
      __int16 v60 = 2114;
      id v61 = v21;
      __int16 v62 = 2114;
      uint64_t v63 = 0;
      _os_log_impl(&dword_1D3052000, v34, OS_LOG_TYPE_DEFAULT, "Failed to find metadata for action. The app may not be installed. action=%{public}@; bundle=%{public}@; %{public}@",
        buf,
        0x20u);
    }
    goto LABEL_32;
  }
  BOOL v23 = v22;
  id v45 = v18;
  id v46 = v14;
  BOOL v24 = [v19 effectiveBundleIdentifiers];
  id v25 = v24;
  if (v23 && [v24 containsObject:v21])
  {
    id v26 = DNDSLogAppFocusConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v59 = v15;
      __int16 v60 = 2114;
      id v61 = v21;
      _os_log_impl(&dword_1D3052000, v26, OS_LOG_TYPE_DEFAULT, "Application is running; will use for action %{public}@: %{public}@",
        buf,
        0x16u);
    }
    goto LABEL_26;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v27 = v25;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    id v43 = v17;
    id v44 = v16;
    uint64_t v30 = *(void *)v55;
LABEL_10:
    uint64_t v31 = 0;
    while (1)
    {
      if (*(void *)v55 != v30) {
        objc_enumerationMutation(v27);
      }
      v32 = *(void **)(*((void *)&v54 + 1) + 8 * v31);
      if ((objc_msgSend(v32, "isEqual:", v21, v43, v44) & 1) == 0 && objc_msgSend(v32, "type") == 1) {
        break;
      }
      if (v29 == ++v31)
      {
        uint64_t v29 = [v27 countByEnumeratingWithState:&v54 objects:v64 count:16];
        if (v29) {
          goto LABEL_10;
        }
        id v33 = v21;
        goto LABEL_23;
      }
    }
    id v33 = (id)[v32 copy];

    uint64_t v35 = DNDSLogAppFocusConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v59 = v15;
      __int16 v60 = 2114;
      id v61 = v33;
      _os_log_impl(&dword_1D3052000, v35, OS_LOG_TYPE_DEFAULT, "Found extension for action %{public}@: %{public}@", buf, 0x16u);
      id v17 = v43;
      id v16 = v44;
      goto LABEL_24;
    }
LABEL_23:
    id v17 = v43;
    id v16 = v44;
  }
  else
  {
    id v33 = v21;
  }
LABEL_24:

  if ([v33 type] == 1)
  {
    uint64_t v21 = v33;
LABEL_26:

    if (v47)
    {
      id v36 = objc_alloc(MEMORY[0x1E4F72C98]);
      [v21 bundleIdentifier];
      v38 = long long v37 = v17;
      long long v39 = (void *)[v36 initWithActionIdentifier:v15 bundleIdentifier:v38];

      id v17 = v37;
      id v40 = (void *)[objc_alloc(MEMORY[0x1E4F72AB8]) initWithActionIdentifier:v39 actionMetadata:v19];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __143__DNDSAppFocusConfigurationCoordinator__executeAction_orActionIdentifier_withBundleIdentifier_modeIdentifier_groupIdentifier_exiting_metadata___block_invoke;
      v48[3] = &unk_1E6974DE8;
      id v33 = v21;
      id v49 = v33;
      id v50 = self;
      id v51 = v37;
      id v52 = v45;
      id v53 = v15;
      [v40 loadDefaultValuesWithCompletionHandler:v48];

      id v18 = v45;
      id v14 = v46;
      goto LABEL_33;
    }
    long long v42 = [v21 bundleIdentifier];
    id v18 = v45;
    id v14 = v46;
    [(DNDSAppFocusConfigurationCoordinator *)self _executeAction:v46 withBundleIdentifier:v42 modeIdentifier:v17 groupIdentifier:v45];

LABEL_32:
    id v33 = v21;
    goto LABEL_33;
  }
  long long v41 = DNDSLogAppFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v59 = v33;
    __int16 v60 = 2114;
    id v61 = v15;
    _os_log_impl(&dword_1D3052000, v41, OS_LOG_TYPE_DEFAULT, "No extension for action in app; background update unavailable. app=%{public}@; action=%{public}@",
      buf,
      0x16u);
  }

  id v18 = v45;
  id v14 = v46;
LABEL_33:
}

void __143__DNDSAppFocusConfigurationCoordinator__executeAction_orActionIdentifier_withBundleIdentifier_modeIdentifier_groupIdentifier_exiting_metadata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = DNDSLogAppFocusConfiguration;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *(void **)(a1 + 32);
      id v9 = v7;
      uint64_t v10 = [v8 bundleIdentifier];
      *(_DWORD *)buf = 138543618;
      id v19 = v10;
      __int16 v20 = 2114;
      id v21 = v5;
      _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "Found default action for %{public}@. action=%{public}@", buf, 0x16u);
    }
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = *(NSObject **)(v11 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __143__DNDSAppFocusConfigurationCoordinator__executeAction_orActionIdentifier_withBundleIdentifier_modeIdentifier_groupIdentifier_exiting_metadata___block_invoke_19;
    block[3] = &unk_1E6974768;
    void block[4] = v11;
    id v14 = v5;
    id v15 = *(id *)(a1 + 32);
    id v16 = *(id *)(a1 + 48);
    id v17 = *(id *)(a1 + 56);
    dispatch_async(v12, block);
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_ERROR))
  {
    __143__DNDSAppFocusConfigurationCoordinator__executeAction_orActionIdentifier_withBundleIdentifier_modeIdentifier_groupIdentifier_exiting_metadata___block_invoke_cold_1(a1, (uint64_t)v6, v7);
  }
}

void __143__DNDSAppFocusConfigurationCoordinator__executeAction_orActionIdentifier_withBundleIdentifier_modeIdentifier_groupIdentifier_exiting_metadata___block_invoke_19(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) bundleIdentifier];
  [v2 _executeAction:v3 withBundleIdentifier:v4 modeIdentifier:*(void *)(a1 + 56) groupIdentifier:*(void *)(a1 + 64)];
}

- (void)_executeAction:(id)a3 withBundleIdentifier:(id)a4 modeIdentifier:(id)a5 groupIdentifier:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [[DNDSAppFocusConfigurationTask alloc] initWithAction:v10 bundleIdentifier:v11];
  id v15 = [(DNDSAppFocusConfigurationTask *)v14 taskIdentifier];
  id v16 = (void *)DNDSLogAppFocusConfiguration;
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v16;
      id v18 = [(DNDSAppFocusConfigurationTask *)v14 taskIdentifier];
      *(_DWORD *)buf = 138543618;
      id v27 = v18;
      __int16 v28 = 2114;
      id v29 = v13;
      _os_log_impl(&dword_1D3052000, v17, OS_LOG_TYPE_DEFAULT, "Added action execution task=%{public}@ for group=%{public}@", buf, 0x16u);
    }
    [(DNDSAppFocusConfigurationCoordinator *)self _addTask:v14 toGroupWithIdentifier:v13];
    objc_initWeak((id *)buf, self);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __107__DNDSAppFocusConfigurationCoordinator__executeAction_withBundleIdentifier_modeIdentifier_groupIdentifier___block_invoke;
    v21[3] = &unk_1E6974E38;
    objc_copyWeak(&v25, (id *)buf);
    id v22 = v11;
    id v23 = v12;
    id v24 = v13;
    [(DNDSAppFocusConfigurationCoordinator *)self _executeOrQueueTask:v14 completion:v21];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_ERROR))
  {
    id v19 = v16;
    __int16 v20 = [v10 identifier];
    *(_DWORD *)buf = 138544130;
    id v27 = v20;
    __int16 v28 = 2114;
    id v29 = v11;
    __int16 v30 = 2114;
    id v31 = v12;
    __int16 v32 = 2114;
    id v33 = v13;
    _os_log_error_impl(&dword_1D3052000, v19, OS_LOG_TYPE_ERROR, "Unable to add action execution task; actionIdentifier=%{public}@ bundleIdentifier=%{public}@ modeIdentifier=%{publ"
      "ic}@ group=%{public}@",
      buf,
      0x2Au);
  }
}

void __107__DNDSAppFocusConfigurationCoordinator__executeAction_withBundleIdentifier_modeIdentifier_groupIdentifier___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v8 = WeakRetained[1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __107__DNDSAppFocusConfigurationCoordinator__executeAction_withBundleIdentifier_modeIdentifier_groupIdentifier___block_invoke_2;
  v11[3] = &unk_1E6974E10;
  objc_copyWeak(&v17, a1 + 7);
  id v12 = a1[4];
  id v13 = a1[5];
  id v14 = v6;
  id v15 = v5;
  id v16 = a1[6];
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v17);
}

void __107__DNDSAppFocusConfigurationCoordinator__executeAction_withBundleIdentifier_modeIdentifier_groupIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v3 = _DNDSPrimaryBundleIdentifier(*(void **)(a1 + 32));
  id v4 = _DNDSContainingBundleIdentifier(*(void **)(a1 + 32));
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  id v6 = (const char *)*MEMORY[0x1E4F5F530];
  id v7 = v4;
  xpc_dictionary_set_string(v5, v6, (const char *)[v7 UTF8String]);
  [WeakRetained[6] broadcastEvent:v5];
  if (*(void *)(a1 + 40))
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:v3];
    id v9 = [*(id *)(a1 + 48) actionAppContext];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      id v11 = [*(id *)(a1 + 48) action];
      id v12 = [v11 identifier];

      id v13 = DNDSLogAppFocusConfiguration;
      if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        id v38 = v10;
        __int16 v39 = 2114;
        id v40 = v8;
        __int16 v41 = 2114;
        long long v42 = v12;
        __int16 v43 = 2114;
        uint64_t v44 = v14;
        _os_log_impl(&dword_1D3052000, v13, OS_LOG_TYPE_DEFAULT, "Retrieved App Context %{public}@ for bundleIdentifier=%{public}@ actionIdentifier=%{public}@ modeIdentifier=%{public}@", buf, 0x2Au);
      }
      id v33 = v10;
      uint64_t v34 = v3;
      id v15 = [v10 notificationFilterPredicate];
      id v32 = v7;
      if (v15)
      {
        id v35 = 0;
        id v36 = 0;
        id v30 = objc_alloc_init(MEMORY[0x1E4F5F738]);
        char v16 = [v30 validatePredicate:v15 compileTimeIssues:&v36 runTimeIssues:&v35];
        id v17 = v36;
        id v31 = v35;
        if (v16)
        {
          id v18 = v17;
        }
        else
        {
          id v19 = DNDSLogAppFocusConfiguration;
          if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_ERROR))
          {
            id v28 = v31;
            if (v17) {
              id v28 = v17;
            }
            uint64_t v29 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138544130;
            id v38 = v28;
            __int16 v39 = 2114;
            id v40 = v8;
            __int16 v41 = 2114;
            long long v42 = v12;
            __int16 v43 = 2114;
            uint64_t v44 = v29;
            _os_log_error_impl(&dword_1D3052000, v19, OS_LOG_TYPE_ERROR, "Notification filter predicate from App Context did not validate, issues=%{public}@ bundleIdentifier=%{public}@ actionIdentifier=%{public}@ modeIdentifier=%{public}@", buf, 0x2Au);
          }
          id v18 = v17;

          id v15 = 0;
        }
        id v10 = v33;
      }
      id v20 = (id)[WeakRetained[5] setPredicate:v15 forActionIdentifier:v12 forApplicationIdentifier:v8 modeIdentifier:*(void *)(a1 + 40)];
      id v21 = WeakRetained[5];
      [v10 targetContentIdentifierPrefix];
      id v23 = v22 = v10;
      id v24 = (id)[v21 setTargetContentIdentifierPrefix:v23 forActionIdentifier:v12 forApplicationIdentifier:v8 modeIdentifier:*(void *)(a1 + 40)];

      uint64_t v3 = v34;
      id v7 = v32;
    }
  }
  if ([WeakRetained _removeTask:*(void *)(a1 + 56) fromGroupWithIdentifier:*(void *)(a1 + 64)])
  {
    id v25 = DNDSLogAppFocusConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 138543362;
      id v38 = v26;
      _os_log_impl(&dword_1D3052000, v25, OS_LOG_TYPE_DEFAULT, "Completed action execution(s) for group=%{public}@", buf, 0xCu);
    }
    [WeakRetained _groupWithIdentifierCompleted:*(void *)(a1 + 64)];
    id v27 = [WeakRetained delegate];
    [v27 appFocusConfigurationCoordinator:WeakRetained didUpdateAppConfigurationContextForModeIdentifier:*(void *)(a1 + 40)];
  }
  [WeakRetained _executeQueuedTaskFollowingTask:*(void *)(a1 + 56)];
}

- (void)_executeOrQueueTask:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 bundleIdentifier];
  id v9 = _DNDSPrimaryBundleIdentifier(v8);

  id v10 = [(NSMutableDictionary *)self->_queuedTasksByBundleIdentifier objectForKeyedSubscript:v9];
  id v11 = (void *)[v10 mutableCopy];

  if (!v11)
  {
    id v11 = [MEMORY[0x1E4F1CA48] array];
  }
  [v6 prepareWithCompletion:v7];
  [v11 addObject:v6];
  [(NSMutableDictionary *)self->_queuedTasksByBundleIdentifier setObject:v11 forKeyedSubscript:v9];
  id v12 = (void *)DNDSLogAppFocusConfigurationTask;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfigurationTask, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    uint64_t v14 = [v6 taskIdentifier];
    int v18 = 138543874;
    id v19 = v14;
    __int16 v20 = 2114;
    id v21 = v9;
    __int16 v22 = 2048;
    uint64_t v23 = [v11 count];
    _os_log_impl(&dword_1D3052000, v13, OS_LOG_TYPE_DEFAULT, "Queued task=%{public}@ for bundleIdentifier=%{public}@ queuedTasks=%lu", (uint8_t *)&v18, 0x20u);
  }
  if ([v11 count] == 1)
  {
    id v15 = (void *)DNDSLogAppFocusConfigurationTask;
    if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfigurationTask, OS_LOG_TYPE_DEFAULT))
    {
      char v16 = v15;
      id v17 = [v6 taskIdentifier];
      int v18 = 138543362;
      id v19 = v17;
      _os_log_impl(&dword_1D3052000, v16, OS_LOG_TYPE_DEFAULT, "Immediately executing task=%{public}@", (uint8_t *)&v18, 0xCu);
    }
    [v6 execute];
  }
}

- (void)_executeQueuedTaskFollowingTask:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  xpc_object_t v5 = [v4 bundleIdentifier];
  id v6 = _DNDSPrimaryBundleIdentifier(v5);

  id v7 = [(NSMutableDictionary *)self->_queuedTasksByBundleIdentifier objectForKeyedSubscript:v6];
  id v8 = (void *)[v7 mutableCopy];

  if (v8 && [v8 count])
  {
    id v9 = [v8 firstObject];
    if (!v9) {
      goto LABEL_11;
    }
    id v10 = [v4 taskIdentifier];
    id v11 = [v9 taskIdentifier];
    int v12 = [v10 isEqual:v11];

    if (v12)
    {
      [v8 removeObject:v9];
      [(NSMutableDictionary *)self->_queuedTasksByBundleIdentifier setObject:v8 forKeyedSubscript:v6];
      id v13 = (void *)DNDSLogAppFocusConfigurationTask;
      if (!os_log_type_enabled((os_log_t)DNDSLogAppFocusConfigurationTask, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      uint64_t v14 = v13;
      id v15 = [v4 taskIdentifier];
      int v26 = 138543874;
      id v27 = v15;
      __int16 v28 = 2114;
      uint64_t v29 = v6;
      __int16 v30 = 2048;
      uint64_t v31 = [v8 count];
      _os_log_impl(&dword_1D3052000, v14, OS_LOG_TYPE_DEFAULT, "Removed completed task=%{public}@ for bundleIdentifier=%{public}@ queuedTasks=%lu", (uint8_t *)&v26, 0x20u);
    }
    else
    {
      int v18 = (void *)DNDSLogAppFocusConfigurationTask;
      if (!os_log_type_enabled((os_log_t)DNDSLogAppFocusConfigurationTask, OS_LOG_TYPE_ERROR))
      {
LABEL_11:
        id v17 = [v8 firstObject];
        id v19 = (void *)DNDSLogAppFocusConfigurationTask;
        BOOL v20 = os_log_type_enabled((os_log_t)DNDSLogAppFocusConfigurationTask, OS_LOG_TYPE_DEFAULT);
        if (v17)
        {
          if (v20)
          {
            id v21 = v19;
            __int16 v22 = [v4 taskIdentifier];
            uint64_t v23 = [v9 taskIdentifier];
            int v26 = 138543618;
            id v27 = v22;
            __int16 v28 = 2114;
            uint64_t v29 = v23;
            _os_log_impl(&dword_1D3052000, v21, OS_LOG_TYPE_DEFAULT, "Executing task=%{public}@ queued behind task=%{public}@", (uint8_t *)&v26, 0x16u);
          }
          [v17 execute];
        }
        else if (v20)
        {
          uint64_t v24 = v19;
          id v25 = [v9 taskIdentifier];
          int v26 = 138543618;
          id v27 = v6;
          __int16 v28 = 2114;
          uint64_t v29 = v25;
          _os_log_impl(&dword_1D3052000, v24, OS_LOG_TYPE_DEFAULT, "Task queue for bundleIdentifier=%{public}@ empty following completion of task=%{public}@", (uint8_t *)&v26, 0x16u);
        }
        goto LABEL_17;
      }
      uint64_t v14 = v18;
      id v15 = [v4 taskIdentifier];
      int v26 = 138543874;
      id v27 = v15;
      __int16 v28 = 2114;
      uint64_t v29 = v6;
      __int16 v30 = 2048;
      uint64_t v31 = [v8 count];
      _os_log_error_impl(&dword_1D3052000, v14, OS_LOG_TYPE_ERROR, "Completed task=%{public}@ for bundleIdentifier=%{public}@ was not the tracked 'current' task queuedTasks=%lu", (uint8_t *)&v26, 0x20u);
    }

    goto LABEL_11;
  }
  char v16 = (void *)DNDSLogAppFocusConfigurationTask;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfigurationTask, OS_LOG_TYPE_ERROR))
  {
    id v9 = v16;
    id v17 = [v4 taskIdentifier];
    int v26 = 138543874;
    id v27 = v17;
    __int16 v28 = 2114;
    uint64_t v29 = v6;
    __int16 v30 = 2048;
    uint64_t v31 = [v8 count];
    _os_log_error_impl(&dword_1D3052000, v9, OS_LOG_TYPE_ERROR, "Completed task=%{public}@ for bundleIdentifier=%{public}@ was not the tracked queuedTasks=%lu", (uint8_t *)&v26, 0x20u);
LABEL_17:
  }
}

- (id)_groupIdentifierForStateUpdate:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = [v4 UUID];
  id v9 = @"stateUpdate";
  v10[0] = v5;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [(NSMutableDictionary *)self->_groupDetails setObject:v7 forKey:v6];

  return v6;
}

- (void)_incrementTasksExecutedForGroupWithIdentifier:(id)a3
{
  groupDetails = self->_groupDetails;
  id v5 = a3;
  id v6 = [(NSMutableDictionary *)groupDetails objectForKey:v5];
  id v13 = (id)[v6 mutableCopy];

  id v7 = [v13 objectForKey:@"tasksExecuted"];
  id v8 = v7;
  if (v7) {
    uint64_t v9 = [v7 integerValue] + 1;
  }
  else {
    uint64_t v9 = 1;
  }
  id v10 = [NSNumber numberWithInteger:v9];
  [v13 setObject:v10 forKey:@"tasksExecuted"];

  id v11 = self->_groupDetails;
  int v12 = (void *)[v13 copy];
  [(NSMutableDictionary *)v11 setObject:v12 forKey:v5];
}

- (void)_groupWithIdentifierCompleted:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_groupDetails objectForKey:v4];
  id v6 = [v5 objectForKey:@"stateUpdate"];
  id v7 = [v5 objectForKey:@"tasksExecuted"];
  uint64_t v8 = [v7 integerValue];

  if (v6)
  {
    uint64_t v9 = [v6 state];
    id v10 = [v9 activeModeIdentifier];

    if (v10
      && ([v9 activeModeConfiguration], (id v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int v12 = v11;
      id v13 = [v11 mode];
      unint64_t v14 = DNDSPowerLogFocusModeSemanticTypeForDNDModeSemanticType([v13 semanticType]);
    }
    else
    {
      unint64_t v14 = -2;
    }
    BOOL updated = DNDSPowerLogFocusUpdateSourceForDNDStateUpdateSource([v6 source]);
    uint64_t v16 = DNDSPowerLogFocusUpdateReasonForDNDStateUpdateReason([v6 reason]);
    id v17 = DNDSLogMetrics;
    if (os_log_type_enabled((os_log_t)DNDSLogMetrics, OS_LOG_TYPE_INFO))
    {
      int v19 = 134218752;
      BOOL v20 = updated;
      __int16 v21 = 2048;
      uint64_t v22 = v16;
      __int16 v23 = 2048;
      unint64_t v24 = v14;
      __int16 v25 = 2048;
      uint64_t v26 = v8;
      _os_log_impl(&dword_1D3052000, v17, OS_LOG_TYPE_INFO, "Notifying PowerLog of Focus filter perform event: source=%ld reason=%ld semanticType=%ld extensionsLaunched=%ld", (uint8_t *)&v19, 0x2Au);
    }
    int v18 = [MEMORY[0x1E4F1C9C8] date];
    DNDSPowerLogFocusFilterPerformEvent(v18, updated, v16, v14, v8);

    [(NSMutableDictionary *)self->_groupDetails removeObjectForKey:v4];
  }
}

- (void)_addTask:(id)a3 toGroupWithIdentifier:(id)a4
{
  id v10 = a3;
  taskGroups = self->_taskGroups;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)taskGroups objectForKeyedSubscript:v7];
  uint64_t v9 = (void *)[v8 mutableCopy];

  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
  }
  [v9 addObject:v10];
  [(NSMutableDictionary *)self->_taskGroups setObject:v9 forKey:v7];
}

- (BOOL)_removeTask:(id)a3 fromGroupWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->_taskGroups objectForKeyedSubscript:v7];
  uint64_t v9 = (void *)[v8 mutableCopy];

  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
  }
  [v9 removeObject:v6];
  uint64_t v10 = [v9 count];
  taskGroups = self->_taskGroups;
  if (v10) {
    [(NSMutableDictionary *)taskGroups setObject:v9 forKey:v7];
  }
  else {
    [(NSMutableDictionary *)taskGroups removeObjectForKey:v7];
  }
  BOOL v12 = [v9 count] == 0;

  return v12;
}

- (BOOL)_shouldExecuteActionOnApplicationWithBundleIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifier:v3];
  id v5 = [MEMORY[0x1E4F96448] descriptor];
  id v18 = 0;
  id v6 = [MEMORY[0x1E4F96438] statesForPredicate:v4 withDescriptor:v5 error:&v18];
  id v7 = v18;
  if (!v7)
  {
    if (![v6 count])
    {
      uint64_t v16 = DNDSLogAppFocusConfiguration;
      if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_ERROR)) {
        -[DNDSAppFocusConfigurationCoordinator _shouldExecuteActionOnApplicationWithBundleIdentifier:]((uint64_t)v3, v16);
      }
      goto LABEL_4;
    }
    if ([v6 count] != 1)
    {
      if ((unint64_t)[v6 count] >= 2)
      {
        id v17 = DNDSLogAppFocusConfiguration;
        if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_ERROR)) {
          -[DNDSAppFocusConfigurationCoordinator _shouldExecuteActionOnApplicationWithBundleIdentifier:]((uint64_t)v3, v17);
        }
      }
      goto LABEL_4;
    }
    id v11 = [v6 firstObject];
    int v12 = [v11 taskState];
    id v13 = DNDSLogAppFocusConfiguration;
    BOOL v14 = os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT);
    BOOL v9 = v12 == 4;
    if (v9)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v3;
        id v15 = "Found process state running scheduled for application bundle; will use application if available. bundle=%{public}@";
LABEL_19:
        _os_log_impl(&dword_1D3052000, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
      }
    }
    else if (v14)
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v3;
      id v15 = "Found process state other than running scheduled for application bundle; will use extension if available. bundle=%{public}@";
      goto LABEL_19;
    }

    goto LABEL_5;
  }
  uint64_t v8 = DNDSLogAppFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_ERROR)) {
    [(DNDSAppFocusConfigurationCoordinator *)(uint64_t)v3 _shouldExecuteActionOnApplicationWithBundleIdentifier:v8];
  }
LABEL_4:
  BOOL v9 = 0;
LABEL_5:

  return v9;
}

- (void)_workQueue_handleFirstLaunch
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = [(DNDSAppFocusConfigurationCoordinator *)self _currentModeIdentifier];
  id v4 = DNDSLogAppFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v66 = v3;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Handling first launch/unlock: current=%{public}@", buf, 0xCu);
  }
  id v5 = [MEMORY[0x1E4F29128] UUID];
  id v36 = objc_alloc_init(MEMORY[0x1E4F72CD8]);
  if (v3)
  {
    id v6 = [(DNDSAppConfigurationManager *)self->_appConfigurationManager appActionsForModeIdentifier:v3 error:0];
    uint64_t v44 = (void *)[v6 mutableCopy];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v58 objects:v64 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v59 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v58 + 1) + 8 * i);
          id v13 = [v7 objectForKeyedSubscript:v12];
          BOOL v14 = objc_msgSend(v13, "bs_filter:", &__block_literal_global_41_0);
          [v44 setObject:v14 forKeyedSubscript:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v58 objects:v64 count:16];
      }
      while (v9);
    }

    __int16 v43 = (void *)[v44 copy];
  }
  else
  {
    __int16 v43 = 0;
  }
  id v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = [MEMORY[0x1E4F72DD8] focusConfigurationProtocol];
  id v17 = [v15 setWithObject:v16];
  id v18 = [v36 actionsConformingToSystemProtocols:v17 logicalType:1 bundleIdentifier:0 error:0];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v19 = v18;
  uint64_t v45 = [v19 countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v45)
  {
    uint64_t v42 = *(void *)v55;
    id v37 = v19;
    do
    {
      for (uint64_t j = 0; j != v45; ++j)
      {
        if (*(void *)v55 != v42) {
          objc_enumerationMutation(v19);
        }
        uint64_t v21 = *(void *)(*((void *)&v54 + 1) + 8 * j);
        uint64_t v22 = [v19 objectForKeyedSubscript:v21];
        __int16 v23 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:v21];
        unint64_t v24 = (void *)MEMORY[0x1D9430630]();
        __int16 v25 = [v43 objectForKeyedSubscript:v23];

        if (!v25)
        {
          id v38 = v24;
          __int16 v39 = v23;
          id v40 = v22;
          uint64_t v41 = j;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          uint64_t v26 = [v22 allValues];
          uint64_t v27 = [v26 countByEnumeratingWithState:&v50 objects:v62 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v51;
            do
            {
              for (uint64_t k = 0; k != v28; ++k)
              {
                if (*(void *)v51 != v29) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v31 = *(void **)(*((void *)&v50 + 1) + 8 * k);
                uint64_t v32 = [v31 identifier];
                [(DNDSAppFocusConfigurationCoordinator *)self _executeAction:0 orActionIdentifier:v32 withBundleIdentifier:v21 modeIdentifier:v3 groupIdentifier:v5 exiting:1 metadata:v31];
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v50 objects:v62 count:16];
            }
            while (v28);
          }

          id v19 = v37;
          unint64_t v24 = v38;
          uint64_t v22 = v40;
          uint64_t j = v41;
          __int16 v23 = v39;
        }
      }
      uint64_t v45 = [v19 countByEnumeratingWithState:&v54 objects:v63 count:16];
    }
    while (v45);
  }

  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __68__DNDSAppFocusConfigurationCoordinator__workQueue_handleFirstLaunch__block_invoke_2;
  v46[3] = &unk_1E6974DC0;
  v46[4] = self;
  id v47 = v3;
  id v48 = v5;
  id v49 = v36;
  id v33 = v36;
  id v34 = v5;
  id v35 = v3;
  [v43 enumerateKeysAndObjectsUsingBlock:v46];
}

uint64_t __68__DNDSAppFocusConfigurationCoordinator__workQueue_handleFirstLaunch__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEnabled];
}

void __68__DNDSAppFocusConfigurationCoordinator__workQueue_handleFirstLaunch__block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9430630]();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = (void *)a1[4];
        BOOL v14 = [*(id *)(*((void *)&v16 + 1) + 8 * v12) action];
        id v15 = [v5 bundleID];
        [v13 _executeAction:v14 orActionIdentifier:0 withBundleIdentifier:v15 modeIdentifier:a1[5] groupIdentifier:a1[6] exiting:0 metadataProvider:a1[7]];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (void)_xpcCheckIn
{
  v2 = (void *)*MEMORY[0x1E4F14158];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __51__DNDSAppFocusConfigurationCoordinator__xpcCheckIn__block_invoke;
  handler[3] = &unk_1E6974E60;
  handler[4] = self;
  xpc_activity_register("com.apple.donotdisturbd.app-focus-filters.first-launch", v2, handler);
}

void __51__DNDSAppFocusConfigurationCoordinator__xpcCheckIn__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3) == 2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(NSObject **)(v4 + 8);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__DNDSAppFocusConfigurationCoordinator__xpcCheckIn__block_invoke_2;
    v6[3] = &unk_1E69735B8;
    v6[4] = v4;
    id v7 = v3;
    dispatch_sync(v5, v6);
  }
}

uint64_t __51__DNDSAppFocusConfigurationCoordinator__xpcCheckIn__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_workQueue_handleFirstLaunch");
  uint64_t v2 = *(void *)(a1 + 40);
  return MEMORY[0x1F40CE9B0](v2, 0);
}

- (DNDSAppFocusConfigurationCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DNDSAppFocusConfigurationCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_xpcEventPublisher, 0);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
  objc_storeStrong((id *)&self->_groupDetails, 0);
  objc_storeStrong((id *)&self->_taskGroups, 0);
  objc_storeStrong((id *)&self->_queuedTasksByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)_executeAction:(void *)a3 orActionIdentifier:withBundleIdentifier:modeIdentifier:groupIdentifier:exiting:metadataProvider:.cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [a3 localizedDescription];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1D3052000, v5, OS_LOG_TYPE_ERROR, "Error fetching actionMetadata for bundle %@: %@", (uint8_t *)&v7, 0x16u);
}

void __143__DNDSAppFocusConfigurationCoordinator__executeAction_orActionIdentifier_withBundleIdentifier_modeIdentifier_groupIdentifier_exiting_metadata___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1D3052000, log, OS_LOG_TYPE_ERROR, "Failed to load default values for action. action=%{public}@; bundle=%{public}@; %{public}@",
    (uint8_t *)&v5,
    0x20u);
}

- (void)_shouldExecuteActionOnApplicationWithBundleIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3052000, a2, OS_LOG_TYPE_ERROR, "Failed to find process state for application bundle; will use extension if available. bundle=%{public}@",
    (uint8_t *)&v2,
    0xCu);
}

- (void)_shouldExecuteActionOnApplicationWithBundleIdentifier:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3052000, a2, OS_LOG_TYPE_ERROR, "Found multiple process states for application bundle; will use extension if available. bundle=%{public}@",
    (uint8_t *)&v2,
    0xCu);
}

- (void)_shouldExecuteActionOnApplicationWithBundleIdentifier:(os_log_t)log .cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D3052000, log, OS_LOG_TYPE_ERROR, "Failed to determine process state for application bundle; will use extension if available. bundle=%{public}@; %{public}@",
    (uint8_t *)&v3,
    0x16u);
}

@end