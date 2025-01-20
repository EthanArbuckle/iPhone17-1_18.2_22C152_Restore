@interface DNDSSystemFocusConfigurationCoordinator
- (DNDSSystemFocusConfigurationCoordinator)initWithAppConfigurationManager:(id)a3;
- (DNDSSystemFocusConfigurationCoordinatorDelegate)delegate;
- (id)_currentModeIdentifier;
- (void)_executeAction:(id)a3;
- (void)appConfigurationManager:(id)a3 didClearSystemAction:(id)a4 modeIdentifier:(id)a5;
- (void)appConfigurationManager:(id)a3 didClearSystemActionsInModeIdentifiers:(id)a4;
- (void)appConfigurationManager:(id)a3 didSetSystemAction:(id)a4 modeIdentifier:(id)a5;
- (void)handleStateUpdate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)workflowRunnerClient:(id)a3 didFinishRunningAction:(id)a4 withReverseAction:(id)a5;
@end

@implementation DNDSSystemFocusConfigurationCoordinator

- (DNDSSystemFocusConfigurationCoordinator)initWithAppConfigurationManager:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DNDSSystemFocusConfigurationCoordinator;
  v6 = [(DNDSSystemFocusConfigurationCoordinator *)&v13 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.donotdisturb.private.system-actions", v7);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    clientToModeIdentifier = v6->_clientToModeIdentifier;
    v6->_clientToModeIdentifier = (NSMapTable *)v10;

    objc_storeStrong((id *)&v6->_appConfigurationManager, a3);
    [v5 addDelegate:v6];
  }

  return v6;
}

- (void)handleStateUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 previousState];
  v6 = [v5 activeModeConfiguration];
  v7 = [v6 mode];

  dispatch_queue_t v8 = [v4 state];
  v9 = [v8 activeModeConfiguration];
  uint64_t v10 = [v9 mode];

  v11 = [v7 modeIdentifier];
  uint64_t v12 = [v10 modeIdentifier];
  if (v11 == (void *)v12)
  {

    goto LABEL_7;
  }
  objc_super v13 = (void *)v12;
  uint64_t v14 = [v7 modeIdentifier];
  if (!v14)
  {
LABEL_10:

LABEL_11:
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__DNDSSystemFocusConfigurationCoordinator_handleStateUpdate___block_invoke;
    block[3] = &unk_1E69735B8;
    id v24 = v4;
    v25 = self;
    dispatch_async(workQueue, block);

    goto LABEL_12;
  }
  v15 = (void *)v14;
  uint64_t v16 = [v10 modeIdentifier];
  if (!v16)
  {

    goto LABEL_10;
  }
  v17 = (void *)v16;
  v18 = [v7 modeIdentifier];
  v19 = [v10 modeIdentifier];
  int v22 = [v18 isEqual:v19];

  if (!v22) {
    goto LABEL_11;
  }
LABEL_7:
  v20 = DNDSLogSystemFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogSystemFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v20, OS_LOG_TYPE_DEFAULT, "Ignoring request to coordinate system configurations; from and to mode are the same.",
      buf,
      2u);
  }
LABEL_12:
}

void __61__DNDSSystemFocusConfigurationCoordinator_handleStateUpdate___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v2 = (void *)DNDSLogSystemFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogSystemFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 state];
    v6 = [v5 activeModeIdentifier];
    v7 = [*(id *)(a1 + 32) previousState];
    dispatch_queue_t v8 = [v7 activeModeIdentifier];
    v9 = [*(id *)(a1 + 40) _currentModeIdentifier];
    *(_DWORD *)buf = 138543874;
    v42 = v6;
    __int16 v43 = 2114;
    v44 = v8;
    __int16 v45 = 2114;
    v46 = v9;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Handling state update: %{public}@; previous: %{public}@ (%{public}@)",
      buf,
      0x20u);
  }
  uint64_t v10 = [*(id *)(a1 + 32) state];
  v11 = [v10 activeModeIdentifier];

  if (v11)
  {
    uint64_t v12 = [*(id *)(*(void *)(a1 + 40) + 16) systemActionsForModeIdentifier:v11 error:0];
    objc_super v13 = objc_msgSend(v12, "bs_filter:", &__block_literal_global_12);
  }
  else
  {
    objc_super v13 = 0;
  }
  uint64_t v14 = [*(id *)(a1 + 32) previousState];
  v15 = [v14 activeModeIdentifier];

  if (v15)
  {
    uint64_t v16 = [*(id *)(*(void *)(a1 + 40) + 16) systemActionsForModeIdentifier:v15 error:0];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v36 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if ([v21 isEnabled])
          {
            int v22 = *(void **)(a1 + 40);
            v23 = [v21 reverseAction];
            [v22 _executeAction:v23];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v18);
    }
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v24 = v13;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v32 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(a1 + 40);
        v30 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * j), "action", (void)v31);
        [v29 _executeAction:v30];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v26);
  }
}

uint64_t __61__DNDSSystemFocusConfigurationCoordinator_handleStateUpdate___block_invoke_47(uint64_t a1, void *a2)
{
  return [a2 isEnabled];
}

- (void)_executeAction:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB4888]) initWithContextualAction:v4];
    clientToModeIdentifier = self->_clientToModeIdentifier;
    v7 = [(DNDSSystemFocusConfigurationCoordinator *)self _currentModeIdentifier];
    [(NSMapTable *)clientToModeIdentifier setObject:v7 forKey:v5];

    [v5 setDelegate:self];
    dispatch_queue_t v8 = DNDSLogSystemFocusConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogSystemFocusConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218242;
      uint64_t v10 = v5;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Running system action: runner=%p; action=%{public}@",
        (uint8_t *)&v9,
        0x16u);
    }
    [v5 start];
  }
}

- (void)appConfigurationManager:(id)a3 didClearSystemAction:(id)a4 modeIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  int v9 = [(DNDSSystemFocusConfigurationCoordinator *)self _currentModeIdentifier];
  if ([v9 isEqualToString:v8])
  {
    uint64_t v10 = [v7 reverseAction];

    if (v10)
    {
      workQueue = self->_workQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __103__DNDSSystemFocusConfigurationCoordinator_appConfigurationManager_didClearSystemAction_modeIdentifier___block_invoke;
      block[3] = &unk_1E69734A0;
      id v13 = v7;
      id v14 = v8;
      v15 = self;
      dispatch_async(workQueue, block);
    }
  }
  else
  {
  }
}

void __103__DNDSSystemFocusConfigurationCoordinator_appConfigurationManager_didClearSystemAction_modeIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)DNDSLogSystemFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogSystemFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 identifier];
    uint64_t v6 = *(void *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Running reverse action due to action deletion in active mode. identifier=%{public}@; mode=%{public}@",
      (uint8_t *)&v9,
      0x16u);
  }
  id v7 = *(void **)(a1 + 48);
  id v8 = [*(id *)(a1 + 32) reverseAction];
  [v7 _executeAction:v8];
}

- (void)appConfigurationManager:(id)a3 didSetSystemAction:(id)a4 modeIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  int v9 = [(DNDSSystemFocusConfigurationCoordinator *)self _currentModeIdentifier];
  int v10 = [v9 isEqualToString:v8];

  if (v10)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __101__DNDSSystemFocusConfigurationCoordinator_appConfigurationManager_didSetSystemAction_modeIdentifier___block_invoke;
    block[3] = &unk_1E69734A0;
    id v13 = v7;
    id v14 = v8;
    v15 = self;
    dispatch_async(workQueue, block);
  }
}

void __101__DNDSSystemFocusConfigurationCoordinator_appConfigurationManager_didSetSystemAction_modeIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = (void *)DNDSLogSystemFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogSystemFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    id v4 = v2;
    if ([v3 isEnabled]) {
      id v5 = &stru_1F2A2D288;
    }
    else {
      id v5 = @" reverse";
    }
    uint64_t v6 = [*(id *)(a1 + 32) identifier];
    uint64_t v7 = *(void *)(a1 + 40);
    int v12 = 138543874;
    id v13 = v5;
    __int16 v14 = 2114;
    v15 = v6;
    __int16 v16 = 2114;
    uint64_t v17 = v7;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Running%{public}@ action due to action update in active mode. identifier=%{public}@; mode=%{public}@",
      (uint8_t *)&v12,
      0x20u);
  }
  int v8 = [*(id *)(a1 + 32) isEnabled];
  int v9 = *(void **)(a1 + 48);
  int v10 = *(void **)(a1 + 32);
  if (v8) {
    [v10 action];
  }
  else {
  __int16 v11 = [v10 reverseAction];
  }
  [v9 _executeAction:v11];
}

- (void)appConfigurationManager:(id)a3 didClearSystemActionsInModeIdentifiers:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(DNDSSystemFocusConfigurationCoordinator *)self _currentModeIdentifier];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106__DNDSSystemFocusConfigurationCoordinator_appConfigurationManager_didClearSystemActionsInModeIdentifiers___block_invoke;
    block[3] = &unk_1E69734A0;
    id v10 = v5;
    id v11 = v6;
    int v12 = self;
    dispatch_async(workQueue, block);
  }
}

void __106__DNDSSystemFocusConfigurationCoordinator_appConfigurationManager_didClearSystemActionsInModeIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  v3 = (void *)DNDSLogSystemFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogSystemFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = v3;
    uint64_t v6 = [v2 valueForKey:@"identifier"];
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v4;
    __int16 v23 = 2114;
    id v24 = v6;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Running reverse actions due to action deletion in active mode. mode=%{public}@; identifiers=%{public}@",
      buf,
      0x16u);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v2;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "reverseAction", (void)v16);

        if (v13)
        {
          __int16 v14 = *(void **)(a1 + 48);
          v15 = [v12 reverseAction];
          [v14 _executeAction:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningAction:(id)a4 withReverseAction:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = DNDSLogSystemFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogSystemFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    id v21 = v8;
    __int16 v22 = 2114;
    id v23 = v9;
    __int16 v24 = 2114;
    id v25 = v10;
    _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_DEFAULT, "Finished running system action: runner=%p; action=%{public}@; reverse=%{public}@",
      buf,
      0x20u);
  }
  workQueue = self->_workQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __105__DNDSSystemFocusConfigurationCoordinator_workflowRunnerClient_didFinishRunningAction_withReverseAction___block_invoke;
  v16[3] = &unk_1E6974180;
  v16[4] = self;
  id v17 = v8;
  id v18 = v10;
  id v19 = v9;
  id v13 = v9;
  id v14 = v10;
  id v15 = v8;
  dispatch_sync(workQueue, v16);
}

void __105__DNDSSystemFocusConfigurationCoordinator_workflowRunnerClient_didFinishRunningAction_withReverseAction___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    if (*(void *)(a1 + 48)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      && ([*(id *)(a1 + 32) _currentModeIdentifier],
          v3 = objc_claimAutoreleasedReturnValue(),
          int v4 = [v2 isEqualToString:v3],
          v3,
          v4))
    {
      id v5 = *(id *)(a1 + 48);
    }
    else
    {
      id v5 = 0;
    }
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 16);
    id v7 = [*(id *)(a1 + 56) identifier];
    id v8 = (id)[v6 updateSystemActionWithReverseAction:v5 actionIdentifier:v7 modeIdentifier:v2];
  }
  else
  {
    id v9 = (void *)DNDSLogSystemFocusConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogSystemFocusConfiguration, OS_LOG_TYPE_ERROR)) {
      __105__DNDSSystemFocusConfigurationCoordinator_workflowRunnerClient_didFinishRunningAction_withReverseAction___block_invoke_cold_1(a1, v9);
    }
  }
}

- (id)_currentModeIdentifier
{
  v3 = [(DNDSSystemFocusConfigurationCoordinator *)self delegate];
  int v4 = [v3 currentStateForSystemFocusConfigurationCoordinator:self];
  id v5 = [v4 activeModeIdentifier];

  return v5;
}

- (DNDSSystemFocusConfigurationCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DNDSSystemFocusConfigurationCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientToModeIdentifier, 0);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __105__DNDSSystemFocusConfigurationCoordinator_workflowRunnerClient_didFinishRunningAction_withReverseAction___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 56);
  int v4 = a2;
  id v5 = [v3 identifier];
  uint64_t v6 = *(void *)(a1 + 56);
  int v7 = 138543618;
  id v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1D3052000, v4, OS_LOG_TYPE_ERROR, "Lost track of mode associated with action. identifier=%{public}@; action=%{public}@",
    (uint8_t *)&v7,
    0x16u);
}

@end