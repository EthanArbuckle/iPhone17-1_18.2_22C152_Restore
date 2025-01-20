@interface MTRPluginClientManager
+ (id)sharedInstance;
- (BOOL)removeClientForXPCConnection:(id)a3;
- (MTRPluginClientManager)init;
- (NSMutableArray)clients;
- (double)repeatStateLoggingInterval;
- (id)_findClientForXPCConnection:(id)a3 remove:(BOOL)a4;
- (id)addClientForXPCConnection:(id)a3 sessionID:(id)a4 queue:(id)a5;
- (id)clientForXPCConnection:(id)a3;
- (void)_scheduleNextStateLog;
- (void)_startStateLoggingIfNeeded;
- (void)_stopStateLogging;
- (void)logState;
- (void)setClients:(id)a3;
- (void)setRepeatStateLoggingInterval:(double)a3;
@end

@implementation MTRPluginClientManager

+ (id)sharedInstance
{
  if (sharedInstance_creation_2 != -1) {
    dispatch_once(&sharedInstance_creation_2, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_sInstance_2;
  return v2;
}

uint64_t __40__MTRPluginClientManager_sharedInstance__block_invoke()
{
  sharedInstance_sInstance_2 = objc_alloc_init(MTRPluginClientManager);
  return MEMORY[0x270F9A758]();
}

- (MTRPluginClientManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRPluginClientManager;
  v2 = [(MTRPluginClientManager *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF980] array];
    [(MTRPluginClientManager *)v2 setClients:v3];

    v4 = v2;
  }

  return v2;
}

- (void)_scheduleNextStateLog
{
  v2 = self;
  objc_sync_enter(v2);
  [(MTRPluginClientManager *)v2 repeatStateLoggingInterval];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__MTRPluginClientManager__scheduleNextStateLog__block_invoke;
  block[3] = &unk_2653E66D8;
  block[4] = v2;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
  objc_sync_exit(v2);
}

uint64_t __47__MTRPluginClientManager__scheduleNextStateLog__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) logState];
}

- (void)_startStateLoggingIfNeeded
{
  obj = self;
  objc_sync_enter(obj);
  [(MTRPluginClientManager *)obj repeatStateLoggingInterval];
  if (v2 == 0.0)
  {
    [(MTRPluginClientManager *)obj setRepeatStateLoggingInterval:300.0];
    [(MTRPluginClientManager *)obj _scheduleNextStateLog];
  }
  objc_sync_exit(obj);
}

- (void)_stopStateLogging
{
  obj = self;
  objc_sync_enter(obj);
  [(MTRPluginClientManager *)obj setRepeatStateLoggingInterval:0.0];
  objc_sync_exit(obj);
}

- (id)_findClientForXPCConnection:(id)a3 remove:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v8 = [(MTRPluginClientManager *)v7 clients];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
  BOOL v21 = v4;
  v10 = 0;
  if (v9)
  {
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v14 = [v13 xpcConnection];
        int v15 = [v14 isEqual:v6];

        if (v15)
        {
          id v16 = v13;

          v10 = v16;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v9);
  }

  if (v21)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v7;
      __int16 v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ => Removing tracked client %@", buf, 0x16u);
    }
    v17 = [(MTRPluginClientManager *)v7 clients];
    [v17 removeObject:v10];
  }
  v18 = [(MTRPluginClientManager *)v7 clients];
  BOOL v19 = [v18 count] == 0;

  if (v19) {
    [(MTRPluginClientManager *)v7 _stopStateLogging];
  }
  else {
    [(MTRPluginClientManager *)v7 _startStateLoggingIfNeeded];
  }
  objc_sync_exit(v7);

  return v10;
}

- (id)addClientForXPCConnection:(id)a3 sessionID:(id)a4 queue:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v8 = (MTRPluginClient *)a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  objc_sync_enter(v11);
  v12 = [(MTRPluginClientManager *)v11 _findClientForXPCConnection:v8 remove:0];

  if (v12)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      v17 = v11;
      __int16 v18 = 2112;
      BOOL v19 = v8;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Cannot add client for same xpc connection %@", (uint8_t *)&v16, 0x16u);
    }
    v13 = 0;
  }
  else
  {
    v13 = [[MTRPluginClient alloc] initWithXPCConnection:v8 sessionID:v9 queue:v10];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138413058;
      v17 = v11;
      __int16 v18 = 2112;
      BOOL v19 = v13;
      __int16 v20 = 2112;
      BOOL v21 = v8;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Adding Client %@ for xpc connection %@ queue: %@", (uint8_t *)&v16, 0x2Au);
    }
    v14 = [(MTRPluginClientManager *)v11 clients];
    [v14 addObject:v13];

    [(MTRPluginClientManager *)v11 _startStateLoggingIfNeeded];
  }
  objc_sync_exit(v11);

  return v13;
}

- (BOOL)removeClientForXPCConnection:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MTRPluginClientManager *)v5 _findClientForXPCConnection:v4 remove:1];
  BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v7)
    {
      int v9 = 138412802;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Removing client %@  for xpc connection: %@", (uint8_t *)&v9, 0x20u);
    }
    [v6 invalidate];
  }
  else if (v7)
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Cannot find and remove client for xpc connection %@", (uint8_t *)&v9, 0x16u);
  }

  objc_sync_exit(v5);
  return v6 != 0;
}

- (id)clientForXPCConnection:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MTRPluginClientManager *)v5 _findClientForXPCConnection:v4 remove:0];
  if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    int v9 = v5;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ Cannot find client for xpc connection %@", (uint8_t *)&v8, 0x16u);
  }
  objc_sync_exit(v5);

  return v6;
}

- (void)logState
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  double v2 = self;
  objc_sync_enter(v2);
  double v3 = &_os_log_internal;
  id v4 = &_os_log_internal;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(MTRPluginClientManager *)v2 clients];
    uint64_t v6 = [v5 count];
    BOOL v7 = [(MTRPluginClientManager *)v2 clients];
    int v9 = 138412802;
    __int16 v10 = v2;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@ MTRPlugin active clients: %lu (%@)", (uint8_t *)&v9, 0x20u);
  }
  [(MTRPluginClientManager *)v2 repeatStateLoggingInterval];
  if (v8 > 0.0) {
    [(MTRPluginClientManager *)v2 _scheduleNextStateLog];
  }
  objc_sync_exit(v2);
}

- (NSMutableArray)clients
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setClients:(id)a3
{
}

- (double)repeatStateLoggingInterval
{
  return self->_repeatStateLoggingInterval;
}

- (void)setRepeatStateLoggingInterval:(double)a3
{
  self->_repeatStateLoggingInterval = a3;
}

- (void).cxx_destruct
{
}

@end