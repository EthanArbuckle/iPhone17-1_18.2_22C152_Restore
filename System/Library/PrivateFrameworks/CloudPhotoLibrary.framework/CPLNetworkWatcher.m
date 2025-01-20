@interface CPLNetworkWatcher
- (BOOL)_isRestrictedPath:(id)a3 policies:(id)a4;
- (CPLNetworkState)networkState;
- (CPLNetworkWatcher)initWithQueue:(id)a3;
- (CPLNetworkWatcherDelegate)delegate;
- (NSString)endPoint;
- (void)_getCellularPolicyWithClient:(network_usage_policy_client_s *)a3;
- (void)_updateAirplaneMode;
- (void)_updateCellularPolicy:(id)a3;
- (void)_updateCellularPolicyFromPolicies:(id)a3;
- (void)_updateNetworkState:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation CPLNetworkWatcher

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_networkState, 0);
  objc_storeStrong((id *)&self->_endPoint, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setDelegate:(id)a3
{
}

- (CPLNetworkWatcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CPLNetworkWatcherDelegate *)WeakRetained;
}

- (CPLNetworkState)networkState
{
  return self->_networkState;
}

- (NSString)endPoint
{
  return self->_endPoint;
}

- (void)stop
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __25__CPLNetworkWatcher_stop__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_1771;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __25__CPLNetworkWatcher_stop__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    if (!_CPLSilentLogging)
    {
      v2 = __CPLNetworkOSLogDomain();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "Stopping monitoring network path", v10, 2u);
      }
    }
    v3 = [[CPLNetworkState alloc] initWithNetworkPath:0 cellularRestricted:0 inAirplaneMode:0];
    uint64_t v4 = *(void *)(a1 + 32);
    dispatch_block_t v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;

    nw_path_monitor_cancel(*(nw_path_monitor_t *)(*(void *)(a1 + 32) + 16));
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = 0;

    network_usage_policy_destroy_client();
    *(void *)(*(void *)(a1 + 32) + 24) = 0;
    [*(id *)(*(void *)(a1 + 32) + 32) setDelegate:0];
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = 0;
  }
}

- (void)dealloc
{
  if (*(_OWORD *)&self->_monitor != 0)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v4 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Network watcher has not been stopped before deallocation", buf, 2u);
      }
    }
    dispatch_block_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLNetworkWatcher.m"];
    v7 = @"Network watcher has not been stopped before deallocation";
    uint64_t v8 = v5;
    SEL v9 = a2;
    v10 = self;
    v11 = v6;
    uint64_t v12 = 199;
LABEL_14:
    [v8 handleFailureInMethod:v9 object:v10 file:v11 lineNumber:v12 description:v7];

    abort();
  }
  if (self->_radiosPreferences)
  {
    if (!_CPLSilentLogging)
    {
      v13 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_ERROR, "Radios preferences was not nullified before deallocation", buf, 2u);
      }
    }
    dispatch_block_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLNetworkWatcher.m"];
    v7 = @"Radios preferences was not nullified before deallocation";
    uint64_t v8 = v5;
    SEL v9 = a2;
    v10 = self;
    v11 = v6;
    uint64_t v12 = 200;
    goto LABEL_14;
  }
  v14.receiver = self;
  v14.super_class = (Class)CPLNetworkWatcher;
  [(CPLNetworkWatcher *)&v14 dealloc];
}

- (void)start
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__CPLNetworkWatcher_start__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_1771;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __26__CPLNetworkWatcher_start__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 16))
  {
    nw_path_monitor_t v2 = nw_path_monitor_create();
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v2);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(NSObject **)(v3 + 16);
    update_handler[0] = MEMORY[0x1E4F143A8];
    update_handler[1] = 3221225472;
    update_handler[2] = __26__CPLNetworkWatcher_start__block_invoke_2;
    update_handler[3] = &unk_1E60A71A0;
    update_handler[4] = v3;
    dispatch_block_t v5 = v2;
    v16 = v5;
    nw_path_monitor_set_update_handler(v4, update_handler);
    nw_path_monitor_set_queue(*(nw_path_monitor_t *)(*(void *)(a1 + 32) + 16), *(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
    if (!_CPLSilentLogging)
    {
      uint64_t v6 = __CPLNetworkOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEFAULT, "Starting monitoring network path", buf, 2u);
      }
    }
    nw_path_monitor_start(*(nw_path_monitor_t *)(*(void *)(a1 + 32) + 16));
    uint64_t client = network_usage_policy_create_client();
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = *(void *)(a1 + 32);
    network_usage_policy_set_changed_handler();
    *(void *)(*(void *)(a1 + 32) + 24) = client;
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4BE78]), "initWithQueue:", *(void *)(*(void *)(a1 + 32) + 8), v12, 3221225472, __26__CPLNetworkWatcher_start__block_invoke_7, &unk_1E60A7178, v13, client);
    [v8 setDelegate:*(void *)(a1 + 32)];
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = *(void **)(v9 + 32);
    *(void *)(v9 + 32) = v8;
    id v11 = v8;

    [*(id *)(*(void *)(a1 + 32) + 32) refresh];
    [*(id *)(a1 + 32) _updateAirplaneMode];
  }
}

void __26__CPLNetworkWatcher_start__block_invoke_2(uint64_t a1, void *a2)
{
  if (*(void *)(*(void *)(a1 + 32) + 16) == *(void *)(a1 + 40))
  {
    id v3 = a2;
    uint64_t v4 = -[CPLNetworkState initWithNetworkPath:cellularRestricted:inAirplaneMode:]([CPLNetworkState alloc], "initWithNetworkPath:cellularRestricted:inAirplaneMode:", v3, [*(id *)(*(void *)(a1 + 32) + 48) isCellularRestricted], objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "isInAirplaneMode"));

    [*(id *)(a1 + 32) _updateNetworkState:v4];
  }
}

void *__26__CPLNetworkWatcher_start__block_invoke_7(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 32;
  result = *(void **)(a1 + 32);
  if (*(void *)(v3 + 8) == result[3]) {
    return (void *)[result _updateCellularPolicyFromPolicies:a2];
  }
  return result;
}

- (void)_updateAirplaneMode
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(RadiosPreferences *)self->_radiosPreferences airplaneMode];
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLNetworkOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_block_t v5 = "not in airplane mode";
      if (v3) {
        dispatch_block_t v5 = "in airplane mode";
      }
      int v9 = 136315138;
      v10 = v5;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Updated airplane mode: %s", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v6 = [CPLNetworkState alloc];
  v7 = [(CPLNetworkState *)self->_networkState networkPath];
  id v8 = [(CPLNetworkState *)v6 initWithNetworkPath:v7 cellularRestricted:[(CPLNetworkState *)self->_networkState isCellularRestricted] inAirplaneMode:v3];

  [(CPLNetworkWatcher *)self _updateNetworkState:v8];
}

- (void)_getCellularPolicyWithClient:(network_usage_policy_client_s *)a3
{
  if (!_CPLSilentLogging)
  {
    uint64_t v3 = __CPLNetworkOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Getting cellular policy", buf, 2u);
    }
  }
  network_usage_policy_get_for_bundle();
}

uint64_t __50__CPLNetworkWatcher__getCellularPolicyWithClient___block_invoke(uint64_t a1, void *a2)
{
  id count = a2;
  id v4 = count;
  if (count)
  {
    if (*(void *)(a1 + 40) == *(void *)(*(void *)(a1 + 32) + 24))
    {
      xpc_object_t xarray = count;
      id count = (id)MEMORY[0x1BA9943E0](count);
      id v4 = xarray;
      if (count == (id)MEMORY[0x1E4F14568])
      {
        id count = (id)xpc_array_get_count(xarray);
        id v4 = xarray;
        if (count)
        {
          dispatch_block_t v5 = xpc_array_get_value(xarray, 0);
          [*(id *)(a1 + 32) _updateCellularPolicy:v5];

          id v4 = xarray;
        }
      }
    }
  }
  return MEMORY[0x1F41817F8](count, v4);
}

- (void)_updateCellularPolicyFromPolicies:(id)a3
{
  xpc_object_t xarray = a3;
  id v4 = (void *)MEMORY[0x1BA993DF0]();
  if (xarray)
  {
    if (MEMORY[0x1BA9943E0](xarray) == MEMORY[0x1E4F14568])
    {
      size_t count = xpc_array_get_count(xarray);
      uint64_t v6 = xarray;
      if (count)
      {
        size_t v7 = 0;
        while (1)
        {
          id v8 = xpc_array_get_value(v6, v7);
          bundle_from_policy = (const char *)network_usage_policy_get_bundle_from_policy();
          if (bundle_from_policy)
          {
            if (!strcmp(bundle_from_policy, "com.apple.mobileslideshow")) {
              break;
            }
          }

          ++v7;
          uint64_t v6 = xarray;
          if (count == v7) {
            goto LABEL_3;
          }
        }
        [(CPLNetworkWatcher *)self _updateCellularPolicy:v8];
      }
    }
  }
LABEL_3:
}

- (void)_updateCellularPolicy:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t bundle_from_policy = network_usage_policy_get_bundle_from_policy();
  int cell_data_allowed_from_policy = network_usage_policy_get_cell_data_allowed_from_policy();

  if (!_CPLSilentLogging)
  {
    size_t v7 = __CPLNetworkOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = "restricted";
      if (cell_data_allowed_from_policy) {
        id v8 = "not restricted";
      }
      int v12 = 136315394;
      uint64_t v13 = bundle_from_policy;
      __int16 v14 = 2080;
      v15 = v8;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Updated cellular policy for %s: %s", (uint8_t *)&v12, 0x16u);
    }
  }
  int v9 = [CPLNetworkState alloc];
  v10 = [(CPLNetworkState *)self->_networkState networkPath];
  uint64_t v11 = [(CPLNetworkState *)v9 initWithNetworkPath:v10 cellularRestricted:cell_data_allowed_from_policy ^ 1u inAirplaneMode:[(CPLNetworkState *)self->_networkState isInAirplaneMode]];

  [(CPLNetworkWatcher *)self _updateNetworkState:v11];
}

- (void)_updateNetworkState:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [v5 isFunctionallyEqual:self->_networkState];
  objc_storeStrong((id *)&self->_networkState, a3);
  if ((v6 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      size_t v7 = __CPLNetworkOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        networkState = self->_networkState;
        int v10 = 138543362;
        uint64_t v11 = networkState;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Network path did change to '%{public}@'", (uint8_t *)&v10, 0xCu);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained watcher:self stateDidChangeToNetworkState:self->_networkState];
  }
}

- (BOOL)_isRestrictedPath:(id)a3 policies:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
LABEL_5:
    char cell_data_allowed_from_policy = 0;
    goto LABEL_6;
  }
  BOOL v7 = nw_path_uses_interface_type(v5, nw_interface_type_cellular);
  char cell_data_allowed_from_policy = 0;
  if (v6 && v7)
  {
    if (MEMORY[0x1BA9943E0](v6) == MEMORY[0x1E4F14568] && xpc_array_get_count(v6))
    {
      int v10 = xpc_array_get_value(v6, 0);
      char cell_data_allowed_from_policy = network_usage_policy_get_cell_data_allowed_from_policy();

      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_6:

  return cell_data_allowed_from_policy;
}

- (CPLNetworkWatcher)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLNetworkWatcher;
  id v6 = [(CPLNetworkWatcher *)&v11 init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    id v8 = [[CPLNetworkState alloc] initWithNetworkPath:0 cellularRestricted:0 inAirplaneMode:0];
    networkState = v7->_networkState;
    v7->_networkState = v8;
  }
  return v7;
}

@end