@interface STScreenTimeConfigurationObserver
- (NSXPCConnection)xpcConnection;
- (STScreenTimeConfiguration)configuration;
- (STScreenTimeConfigurationObserver)initWithUpdateQueue:(dispatch_queue_t)updateQueue;
- (int)notificationToken;
- (void)_requestConfiguration;
- (void)_updateWithConfiguration:(id)a3;
- (void)dealloc;
- (void)setConfiguration:(id)a3;
- (void)setNotificationToken:(int)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation STScreenTimeConfigurationObserver

- (STScreenTimeConfigurationObserver)initWithUpdateQueue:(dispatch_queue_t)updateQueue
{
  v8.receiver = self;
  v8.super_class = (Class)STScreenTimeConfigurationObserver;
  v3 = updateQueue;
  v4 = [(STScreenTimeConfigurationObserver *)&v8 init];
  v5 = +[STScreenTimeAgentConnection newConnection];
  xpcConnection = v4->_xpcConnection;
  v4->_xpcConnection = v5;

  [(NSXPCConnection *)v4->_xpcConnection _setQueue:v3];
  [(NSXPCConnection *)v4->_xpcConnection resume];
  v4->_notificationToken = -1;
  return v4;
}

- (void)dealloc
{
}

- (void)startObserving
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_fault_impl(&dword_2249CB000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Failed to register darwin notification %@, %u", buf, 0x12u);
}

void __51__STScreenTimeConfigurationObserver_startObserving__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _requestConfiguration];
}

- (void)_requestConfiguration
{
}

void __58__STScreenTimeConfigurationObserver__requestConfiguration__block_invoke(uint64_t a1, void *a2)
{
}

void __58__STScreenTimeConfigurationObserver__requestConfiguration__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = [*(id *)(a1 + 32) configuration];

    objc_super v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _updateWithConfiguration:v5];
    }
    else {
      [v8 setConfiguration:v5];
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    __58__STScreenTimeConfigurationObserver__requestConfiguration__block_invoke_2_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
  }
}

void __58__STScreenTimeConfigurationObserver__requestConfiguration__block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __58__STScreenTimeConfigurationObserver__requestConfiguration__block_invoke_2_39;
    v14[3] = &unk_2646E72D0;
    v14[4] = *(void *)(a1 + 32);
    [v5 requestConfigurationWithReplyHandler:v14];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    __58__STScreenTimeConfigurationObserver__requestConfiguration__block_invoke_2_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  }
}

void __58__STScreenTimeConfigurationObserver__requestConfiguration__block_invoke_2_39(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [*(id *)(a1 + 32) configuration];

    uint64_t v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _updateWithConfiguration:v5];
    }
    else {
      [v8 setConfiguration:v5];
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    __58__STScreenTimeConfigurationObserver__requestConfiguration__block_invoke_2_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
  }
}

- (void)_updateWithConfiguration:(id)a3
{
  id v4 = a3;
  id v6 = [(STScreenTimeConfigurationObserver *)self configuration];
  uint64_t v5 = [v4 enforcesChildRestrictions];

  if (v5 != [v6 enforcesChildRestrictions]) {
    [v6 setEnforcesChildRestrictions:v5];
  }
}

- (void)stopObserving
{
  int v3 = [(STScreenTimeConfigurationObserver *)self notificationToken];
  if (v3 != -1)
  {
    uint64_t v4 = notify_cancel(v3);
    if (v4)
    {
      uint64_t v5 = v4;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        [(STScreenTimeConfigurationObserver *)v5 dealloc];
      }
    }
    [(STScreenTimeConfigurationObserver *)self setNotificationToken:0xFFFFFFFFLL];
  }
}

- (STScreenTimeConfiguration)configuration
{
  return (STScreenTimeConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (int)notificationToken
{
  return self->_notificationToken;
}

- (void)setNotificationToken:(int)a3
{
  self->_notificationToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

void __58__STScreenTimeConfigurationObserver__requestConfiguration__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end