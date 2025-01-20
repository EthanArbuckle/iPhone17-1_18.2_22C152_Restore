@interface GTServiceProvider
- (BOOL)waitForService:(id)a3 error:(id *)a4;
- (GTServiceProvider)init;
- (id)allServices;
- (unint64_t)registerObserver:(id)a3;
- (void)_registerService:(id)a3 forProcess:(id)a4 forPort:(unint64_t)a5;
- (void)deregisterObserver:(unint64_t)a3;
- (void)deregisterObserversForConnection:(id)a3 path:(id)a4;
- (void)deregisterService:(unint64_t)a3;
- (void)disconnectServicePorts:(id)a3;
- (void)notifyServiceListChanged:(id)a3;
- (void)registerDefaultServiceProvider:(id)a3 forProcess:(id)a4;
- (void)registerService:(id)a3 forProcess:(id)a4;
- (void)waitForService:(id)a3 completionHandler:(id)a4;
@end

@implementation GTServiceProvider

- (GTServiceProvider)init
{
  v12.receiver = self;
  v12.super_class = (Class)GTServiceProvider;
  v2 = [(GTServiceProvider *)&v12 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.gputools.transport", "ServiceProvider");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    services = v2->_services;
    v2->_services = v5;

    v2->_nextServiceID = 1;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    waiting = v2->_waiting;
    v2->_waiting = v7;

    uint64_t v9 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (GTObservableService *)v9;
  }
  return v2;
}

- (void)_registerService:(id)a3 forProcess:(id)a4 forPort:(unint64_t)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 deviceUDID];

  if (!v10)
  {
    v11 = +[GTDeviceProperties uniqueDeviceID];
    [v8 setDeviceUDID:v11];
  }
  [v8 setServicePort:a5];
  objc_super v12 = [[GTProcessService alloc] initWithService:v8 processInfo:v9];
  services = self->_services;
  v14 = [NSNumber numberWithUnsignedInteger:a5];
  [(NSMutableDictionary *)services setObject:v12 forKeyedSubscript:v14];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v16 = log;
    id v17 = [v8 protocolName];
    uint64_t v18 = [v17 UTF8String];
    v19 = [v8 deviceUDID];
    *(_DWORD *)buf = 136315650;
    uint64_t v37 = v18;
    __int16 v38 = 2048;
    unint64_t v39 = a5;
    __int16 v40 = 2112;
    v41 = v19;
    _os_log_impl(&dword_23C048000, v16, OS_LOG_TYPE_INFO, "Service Registered name:%s port:%lu udid:%@", buf, 0x20u);
  }
  v20 = [(NSMutableDictionary *)self->_services allValues];
  [(GTServiceProvider *)self notifyServiceListChanged:v20];

  waiting = self->_waiting;
  v22 = [v8 protocolName];
  v23 = [(NSMutableDictionary *)waiting objectForKeyedSubscript:v22];

  if (v23)
  {
    v24 = self->_waiting;
    v25 = [v8 protocolName];
    [(NSMutableDictionary *)v24 removeObjectForKey:v25];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v26 = v23;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v32 != v29) {
            objc_enumerationMutation(v26);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v31 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v31 + 1) + 8 * i));
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v28);
    }
  }
}

- (void)registerDefaultServiceProvider:(id)a3 forProcess:(id)a4
{
}

- (void)registerService:(id)a3 forProcess:(id)a4
{
}

- (id)allServices
{
  return (id)[(NSMutableDictionary *)self->_services allValues];
}

- (void)waitForService:(id)a3 completionHandler:(id)a4
{
  v32[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void))v7;
  if (v6)
  {
    v25 = (void (**)(void, void))v7;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = self->_services;
    uint64_t v10 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      while (2)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [(NSMutableDictionary *)self->_services objectForKeyedSubscript:*(void *)(*((void *)&v26 + 1) + 8 * v13)];
          v15 = [v14 serviceProperties];
          v16 = [v15 protocolName];
          int v17 = [v16 isEqualToString:v6];

          if (v17)
          {
            id v8 = v25;
            v25[2](v25, 0);
            goto LABEL_15;
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    uint64_t v18 = [(NSMutableDictionary *)self->_waiting objectForKeyedSubscript:v6];

    if (!v18)
    {
      id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
      [(NSMutableDictionary *)self->_waiting setObject:v19 forKeyedSubscript:v6];
    }
    id v9 = [(NSMutableDictionary *)self->_waiting objectForKeyedSubscript:v6];
    id v8 = v25;
    v20 = (void *)[v25 copy];
    v21 = (void *)MEMORY[0x23ECDA150]();
    [(NSMutableDictionary *)v9 addObject:v21];
  }
  else
  {
    v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v31 = *MEMORY[0x263F08320];
    v23 = [NSString stringWithFormat:@"Invalid protocol name"];
    v32[0] = v23;
    v24 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    id v9 = [v22 errorWithDomain:@"com.apple.gputools.serviceprovider" code:0 userInfo:v24];

    ((void (**)(void, NSMutableDictionary *))v8)[2](v8, v9);
  }
LABEL_15:
}

- (BOOL)waitForService:(id)a3 error:(id *)a4
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  int v17 = __Block_byref_object_copy__1;
  uint64_t v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42__GTServiceProvider_waitForService_error___block_invoke;
  v11[3] = &unk_264E28C78;
  dispatch_semaphore_t v12 = v7;
  uint64_t v13 = &v14;
  id v8 = v7;
  [(GTServiceProvider *)self waitForService:v6 completionHandler:v11];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a4) {
    *a4 = (id) v15[5];
  }
  BOOL v9 = v15[5] == 0;

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __42__GTServiceProvider_waitForService_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)deregisterService:(unint64_t)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  v6[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [(GTServiceProvider *)self disconnectServicePorts:v5];
}

- (void)deregisterObserver:(unint64_t)a3
{
}

- (unint64_t)registerObserver:(id)a3
{
  return [(GTObservableService *)self->_observers registerObserver:a3];
}

- (void)deregisterObserversForConnection:(id)a3 path:(id)a4
{
}

- (void)disconnectServicePorts:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v22;
    *(void *)&long long v6 = 136315394;
    long long v20 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_services, "objectForKeyedSubscript:", v10, v20);
        dispatch_semaphore_t v12 = [v11 serviceProperties];
        id v13 = [v12 protocolName];
        uint64_t v14 = [v13 UTF8String];

        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          if (v14) {
            uint64_t v16 = (const char *)v14;
          }
          else {
            uint64_t v16 = "";
          }
          int v17 = log;
          uint64_t v18 = [v10 unsignedLongValue];
          *(_DWORD *)buf = v20;
          long long v26 = v16;
          __int16 v27 = 2048;
          uint64_t v28 = v18;
          _os_log_impl(&dword_23C048000, v17, OS_LOG_TYPE_INFO, "Service Unregistered name:%s port:%lu", buf, 0x16u);
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v7);
  }
  [(NSMutableDictionary *)self->_services removeObjectsForKeys:v4];
  id v19 = [(NSMutableDictionary *)self->_services allValues];
  [(GTServiceProvider *)self notifyServiceListChanged:v19];
}

- (void)notifyServiceListChanged:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__GTServiceProvider_notifyServiceListChanged___block_invoke;
  v7[3] = &unk_264E290F8;
  id v8 = v4;
  id v6 = v4;
  [(GTObservableService *)observers notifyAll:v7];
}

uint64_t __46__GTServiceProvider_notifyServiceListChanged___block_invoke(uint64_t a1, void *a2)
{
  return [a2 notifyServiceListChanged:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_waiting, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end