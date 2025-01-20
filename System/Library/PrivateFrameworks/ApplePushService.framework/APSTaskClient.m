@interface APSTaskClient
- (APSTaskClient)initWithEnvironment:(id)a3 queue:(id)a4;
- (id)_findDNSRequestForHostname:(id)a3;
- (id)resolveDNS:(id)a3;
- (void)_clearOutstandingTasks:(int64_t)a3;
- (void)_timeoutOutstandingRequests;
- (void)dealloc;
@end

@implementation APSTaskClient

- (APSTaskClient)initWithEnvironment:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)APSTaskClient;
  v8 = [(APSTaskClient *)&v20 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    environment = v8->_environment;
    v8->_environment = (NSString *)v9;

    objc_storeStrong((id *)&v8->_clientQueue, a4);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.apsd.nsxpc" options:0];
    connection = v8->_connection;
    v8->_connection = (NSXPCConnection *)v11;

    v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF035498];
    [(NSXPCConnection *)v8->_connection setRemoteObjectInterface:v13];

    [(NSXPCConnection *)v8->_connection _setQueue:v7];
    objc_initWeak(&location, v8);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __43__APSTaskClient_initWithEnvironment_queue___block_invoke;
    v17[3] = &unk_1E59822F8;
    objc_copyWeak(&v18, &location);
    [(NSXPCConnection *)v8->_connection setInterruptionHandler:v17];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __43__APSTaskClient_initWithEnvironment_queue___block_invoke_46;
    v15[3] = &unk_1E59822F8;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)v8->_connection setInvalidationHandler:v15];
    [(NSXPCConnection *)v8->_connection resume];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __43__APSTaskClient_initWithEnvironment_queue___block_invoke(uint64_t a1)
{
  v2 = +[APSLog taskManager];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __43__APSTaskClient_initWithEnvironment_queue___block_invoke_cold_1(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _clearOutstandingTasks:4097];
}

void __43__APSTaskClient_initWithEnvironment_queue___block_invoke_46(uint64_t a1)
{
  v2 = +[APSLog taskManager];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __43__APSTaskClient_initWithEnvironment_queue___block_invoke_46_cold_1(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _clearOutstandingTasks:4099];
}

- (void)dealloc
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  environment = self->_environment;
  self->_environment = 0;

  outstandingDNSRequests = self->_outstandingDNSRequests;
  self->_outstandingDNSRequests = 0;

  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  v6.receiver = self;
  v6.super_class = (Class)APSTaskClient;
  [(APSTaskClient *)&v6 dealloc];
}

- (void)_clearOutstandingTasks:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obj = self->_outstandingDNSRequests;
  uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    uint64_t v8 = *MEMORY[0x1E4F281F8];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:v8 code:a3 userInfo:0];
        v12 = [v10 responseBlock];
        ((void (**)(void, void, void *))v12)[2](v12, 0, v11);
        [(NSMutableArray *)self->_outstandingDNSRequests removeObject:v10];

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  outstandingDNSRequests = self->_outstandingDNSRequests;
  self->_outstandingDNSRequests = 0;
}

- (id)_findDNSRequestForHostname:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_outstandingDNSRequests;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "hostname", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_timeoutOutstandingRequests
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1C9C8] date];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v20 = self;
  obj = self->_outstandingDNSRequests;
  uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    uint64_t v7 = *MEMORY[0x1E4F28798];
    uint64_t v8 = *MEMORY[0x1E4F28568];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        char v11 = objc_msgSend(v10, "requestStartTime", v20);
        [v3 timeIntervalSinceDate:v11];
        double v13 = v12;
        [v10 timeout];
        double v15 = v14;

        if (v13 > v15)
        {
          long long v16 = [v10 responseBlock];
          id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v26 = v8;
          v27 = @"DNS Request timed out";
          uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
          v19 = (void *)[v17 initWithDomain:v7 code:60 userInfo:v18];
          ((void (**)(void, void, void *))v16)[2](v16, 0, v19);

          [(NSMutableArray *)v20->_outstandingDNSRequests removeObject:v10];
        }
      }
      uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v5);
  }
}

- (id)resolveDNS:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  [v4 setEnvironment:self->_environment];
  if (!self->_outstandingDNSRequests)
  {
    uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    outstandingDNSRequests = self->_outstandingDNSRequests;
    self->_outstandingDNSRequests = v5;
  }
  uint64_t v7 = +[APSLog taskManager];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v4 hostname];
    [v4 timeout];
    uint64_t v10 = v9;
    char v11 = [v4 environment];
    *(_DWORD *)buf = 138412802;
    v27 = v8;
    __int16 v28 = 2048;
    uint64_t v29 = v10;
    __int16 v30 = 2112;
    v31 = v11;
    _os_log_impl(&dword_19DC4C000, v7, OS_LOG_TYPE_DEFAULT, "Starting DNS resolution for hostname %@ timeout %f environment %@", buf, 0x20u);
  }
  [(NSMutableArray *)self->_outstandingDNSRequests addObject:v4];
  double v12 = [MEMORY[0x1E4F1C9C8] date];
  [v4 setRequestStartTime:v12];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __28__APSTaskClient_resolveDNS___block_invoke;
  v25[3] = &unk_1E5982320;
  v25[4] = self;
  double v13 = (void *)MEMORY[0x19F3B0300](v25);
  connection = self->_connection;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __28__APSTaskClient_resolveDNS___block_invoke_2;
  v22[3] = &unk_1E5982348;
  id v23 = v4;
  long long v24 = self;
  id v15 = v4;
  long long v16 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v22];
  [v15 timeout];
  dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
  clientQueue = self->_clientQueue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __28__APSTaskClient_resolveDNS___block_invoke_56;
  v21[3] = &unk_1E5982370;
  v21[4] = self;
  dispatch_after(v18, clientQueue, v21);
  [v16 resolveDNS:v15 reply:v13];

  return 0;
}

void __28__APSTaskClient_resolveDNS___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v18 = a3;
  id v8 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v15 = [v14 hostname];
        int v16 = [v15 isEqualToString:v7];

        if (v16)
        {
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 24));
          double v17 = [v14 responseBlock];
          ((void (**)(void, id, id))v17)[2](v17, v18, v8);
          [*(id *)(*(void *)(a1 + 32) + 16) removeObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
}

void __28__APSTaskClient_resolveDNS___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[APSLog taskManager];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __28__APSTaskClient_resolveDNS___block_invoke_2_cold_2((uint64_t)v3, v4);
  }

  id v5 = *(id *)(a1 + 32);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 40) + 24));
  if ([*(id *)(*(void *)(a1 + 40) + 16) indexOfObject:v5] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = +[APSLog taskManager];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __28__APSTaskClient_resolveDNS___block_invoke_2_cold_1(v5, v6);
    }

    id v7 = [v5 responseBlock];
    ((void (**)(void, void, id))v7)[2](v7, 0, v3);
    [*(id *)(*(void *)(a1 + 40) + 16) removeObject:v5];
  }
}

uint64_t __28__APSTaskClient_resolveDNS___block_invoke_56(uint64_t a1)
{
  return [*(id *)(a1 + 32) _timeoutOutstandingRequests];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_outstandingDNSRequests, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __43__APSTaskClient_initWithEnvironment_queue___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19DC4C000, log, OS_LOG_TYPE_ERROR, "XPC connection is interrupted", v1, 2u);
}

void __43__APSTaskClient_initWithEnvironment_queue___block_invoke_46_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19DC4C000, log, OS_LOG_TYPE_ERROR, "XPC connection is invalidated", v1, 2u);
}

void __28__APSTaskClient_resolveDNS___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 hostname];
  int v5 = 138412546;
  uint64_t v6 = v4;
  __int16 v7 = 2112;
  id v8 = a1;
  _os_log_error_impl(&dword_19DC4C000, a2, OS_LOG_TYPE_ERROR, "Removing hostname %@ DNS request %@ from list of outstanding DNS requests", (uint8_t *)&v5, 0x16u);
}

void __28__APSTaskClient_resolveDNS___block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19DC4C000, a2, OS_LOG_TYPE_ERROR, "NSXPC error encountered while resolving DNS: %@", (uint8_t *)&v2, 0xCu);
}

@end