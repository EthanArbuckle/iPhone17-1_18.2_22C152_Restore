@interface ARDaemonServiceListener
- (ARDaemonServiceListener)initWithDelegate:(id)a3 daemonConfiguration:(id)a4 watchdogMonitor:(id)a5;
- (ARDaemonServiceListenerDelegate)delegate;
- (BOOL)addServiceByName:(id)a3 serviceClass:(Class)a4;
- (BOOL)addServiceWithQueueByName:(id)a3 serviceClass:(Class)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)createService:(id)a3;
- (id)listenerForServiceNamed:(id)a3;
@end

@implementation ARDaemonServiceListener

- (ARDaemonServiceListener)initWithDelegate:(id)a3 daemonConfiguration:(id)a4 watchdogMonitor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)ARDaemonServiceListener;
  v11 = [(ARDaemonServiceListener *)&v23 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v12->_daemonConfiguration, a4);
    uint64_t v13 = objc_opt_new();
    xpcListeners = v12->_xpcListeners;
    v12->_xpcListeners = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    serviceClasses = v12->_serviceClasses;
    v12->_serviceClasses = (NSMutableDictionary *)v15;

    uint64_t v17 = ARCreateFixedPriorityDispatchQueue();
    serviceQueue = v12->_serviceQueue;
    v12->_serviceQueue = (OS_dispatch_queue *)v17;

    [v10 addQueue:v12->_serviceQueue hangPolicy:0];
    v19 = v12->_serviceQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__ARDaemonServiceListener_initWithDelegate_daemonConfiguration_watchdogMonitor___block_invoke;
    block[3] = &unk_265206E30;
    v22 = v12;
    dispatch_sync(v19, block);
  }
  return v12;
}

void __80__ARDaemonServiceListener_initWithDelegate_daemonConfiguration_watchdogMonitor___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_opt_class();
  ARGetSubclassesForClass();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        id v8 = (void *)MEMORY[0x24C54B300](v3);
        id v9 = objc_msgSend(v7, "performSelector:", sel_serviceName, (void)v10);
        if (v9) {
          [*(id *)(a1 + 32) addServiceByName:v9 serviceClass:v7];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v4 = v3;
    }
    while (v3);
  }
}

- (id)listenerForServiceNamed:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serviceQueue);
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__ARDaemonServiceListener_listenerForServiceNamed___block_invoke;
  block[3] = &unk_265206E58;
  id v10 = v4;
  long long v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(serviceQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __51__ARDaemonServiceListener_listenerForServiceNamed___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  return MEMORY[0x270F9A758]();
}

- (BOOL)addServiceWithQueueByName:(id)a3 serviceClass:(Class)a4
{
  id v6 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serviceQueue);
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  serviceQueue = self->_serviceQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__ARDaemonServiceListener_addServiceWithQueueByName_serviceClass___block_invoke;
  v10[3] = &unk_265206E80;
  v10[4] = self;
  id v11 = v6;
  uint64_t v12 = &v14;
  Class v13 = a4;
  id v8 = v6;
  dispatch_sync(serviceQueue, v10);
  LOBYTE(self) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

uint64_t __66__ARDaemonServiceListener_addServiceWithQueueByName_serviceClass___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) addServiceByName:*(void *)(a1 + 40) serviceClass:*(void *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)addServiceByName:(id)a3 serviceClass:(Class)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  id v7 = _ARLogDaemon_2();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v17 = 138544130;
    v18 = v9;
    __int16 v19 = 2048;
    v20 = self;
    __int16 v21 = 2112;
    Class v22 = a4;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_24719A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Adding listener for service: <%@:%@>", (uint8_t *)&v17, 0x2Au);
  }
  id v10 = [(NSMutableDictionary *)self->_serviceClasses allKeys];
  int v11 = [v10 containsObject:v6];

  if (v11)
  {
    uint64_t v12 = _ARLogDaemon_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      Class v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      int v17 = 138544130;
      v18 = v14;
      __int16 v19 = 2048;
      v20 = self;
      __int16 v21 = 2112;
      Class v22 = a4;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_24719A000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Duplicate service names are not allowed: <%@:%@>", (uint8_t *)&v17, 0x2Au);
    }
  }
  else
  {
    [(NSMutableDictionary *)self->_serviceClasses setObject:a4 forKey:v6];
    if ([(ARDaemonConfiguration *)self->_daemonConfiguration isInProcess])
    {
      uint64_t v15 = [MEMORY[0x263F08D88] anonymousListener];
    }
    else
    {
      uint64_t v15 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:v6];
    }
    uint64_t v12 = v15;
    [v15 setDelegate:self];
    [v12 _setQueue:self->_serviceQueue];
    [(NSMutableDictionary *)self->_xpcListeners setObject:v12 forKey:v6];
    [v12 resume];
  }

  return v11 ^ 1;
}

- (id)createService:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  serviceClasses = self->_serviceClasses;
  id v6 = [v4 serviceName];
  id v7 = (objc_class *)(id)[(NSMutableDictionary *)serviceClasses objectForKey:v6];

  if (v7)
  {
    id v8 = [[v7 alloc] initWithConnection:v4];
    id v9 = _ARLogDaemon_2();
    id v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = (objc_class *)objc_opt_class();
        uint64_t v12 = NSStringFromClass(v11);
        Class v13 = [v4 serviceName];
        int v22 = 138544130;
        __int16 v23 = v12;
        __int16 v24 = 2048;
        uint64_t v25 = self;
        __int16 v26 = 2112;
        v27 = v7;
        __int16 v28 = 2112;
        v29 = v13;
        _os_log_impl(&dword_24719A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Created %@ for service name: %@", (uint8_t *)&v22, 0x2Au);
      }
      id v8 = v8;
      uint64_t v14 = v8;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v18 = (objc_class *)objc_opt_class();
        __int16 v19 = NSStringFromClass(v18);
        v20 = [v4 serviceName];
        int v22 = 138543874;
        __int16 v23 = v19;
        __int16 v24 = 2048;
        uint64_t v25 = self;
        __int16 v26 = 2112;
        v27 = v20;
        _os_log_impl(&dword_24719A000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create service for service name: %@", (uint8_t *)&v22, 0x20u);
      }
      uint64_t v14 = 0;
    }
  }
  else
  {
    id v8 = _ARLogDaemon_2();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      int v17 = [v4 serviceName];
      int v22 = 138543874;
      __int16 v23 = v16;
      __int16 v24 = 2048;
      uint64_t v25 = self;
      __int16 v26 = 2112;
      v27 = v17;
      _os_log_impl(&dword_24719A000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to find service class for service name: %@", (uint8_t *)&v22, 0x20u);
    }
    uint64_t v14 = 0;
  }

  return v14;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  if ([(ARDaemonConfiguration *)self->_daemonConfiguration isInProcess])
  {
    id v8 = [v7 serviceName];

    if (!v8)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v9 = [(NSMutableDictionary *)self->_xpcListeners allKeys];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v47 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v34;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v34 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            id v15 = [(NSMutableDictionary *)self->_xpcListeners objectForKeyedSubscript:v14];

            if (v15 == v6)
            {
              [v7 setValue:v14 forKey:@"_serviceName"];
              goto LABEL_13;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v47 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
  }
  uint64_t v16 = _ARLogDaemon_2();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    __int16 v19 = objc_msgSend(v7, "ar_processName");
    int v20 = [v7 processIdentifier];
    __int16 v21 = [v7 serviceName];
    *(_DWORD *)buf = 138544386;
    v38 = v18;
    __int16 v39 = 2048;
    v40 = self;
    __int16 v41 = 2114;
    v42 = v19;
    __int16 v43 = 1024;
    int v44 = v20;
    __int16 v45 = 2114;
    v46 = v21;
    _os_log_impl(&dword_24719A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Listener received request from process: %{public}@ (%d) to accept connection for service: %{public}@", buf, 0x30u);
  }
  int v22 = [(ARDaemonServiceListener *)self createService:v7];
  __int16 v23 = _ARLogDaemon_2();
  __int16 v24 = v23;
  if (v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = (objc_class *)objc_opt_class();
      __int16 v26 = NSStringFromClass(v25);
      v27 = [v7 serviceName];
      *(_DWORD *)buf = 138543874;
      v38 = v26;
      __int16 v39 = 2048;
      v40 = self;
      __int16 v41 = 2112;
      v42 = v27;
      _os_log_impl(&dword_24719A000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Accepting connection for service: %@", buf, 0x20u);
    }
    __int16 v28 = [(ARDaemonServiceListener *)self delegate];
    [v28 didDiscoverService:v22];

    [v7 resume];
  }
  else
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v29 = (objc_class *)objc_opt_class();
      uint64_t v30 = NSStringFromClass(v29);
      v31 = [v7 serviceName];
      *(_DWORD *)buf = 138543874;
      v38 = v30;
      __int16 v39 = 2048;
      v40 = self;
      __int16 v41 = 2112;
      v42 = v31;
      _os_log_impl(&dword_24719A000, v24, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to accept connection for service: %@", buf, 0x20u);
    }
  }

  return v22 != 0;
}

- (ARDaemonServiceListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ARDaemonServiceListenerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_serviceClasses, 0);
  objc_storeStrong((id *)&self->_xpcListeners, 0);
  objc_storeStrong((id *)&self->_daemonConfiguration, 0);
}

@end