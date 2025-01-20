@interface IRXPCServicesManager
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (IRXPCServicesManager)init;
- (void)_createServices;
- (void)_setupXPCListeners;
- (void)startServices;
@end

@implementation IRXPCServicesManager

- (IRXPCServicesManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)IRXPCServicesManager;
  v2 = [(IRXPCServicesManager *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.intelligentroutingd.xpcQueue", v3);
    xpcQueue = v2->_xpcQueue;
    v2->_xpcQueue = (OS_dispatch_queue *)v4;

    [(IRXPCServicesManager *)v2 _createServices];
    [(IRXPCServicesManager *)v2 _setupXPCListeners];
  }
  return v2;
}

- (void)startServices
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = self->_listeners;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v15;
    objc_super v7 = (os_log_t *)MEMORY[0x263F50090];
    *(void *)&long long v4 = 138412290;
    long long v13 = v4;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
        os_log_t v10 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          v11 = v10;
          v12 = [v9 serviceName];
          *(_DWORD *)buf = v13;
          v19 = v12;
          _os_log_impl(&dword_25418E000, v11, OS_LOG_TYPE_DEFAULT, "[IRXPCServicesManager] resuming listener for mach service: %@", buf, 0xCu);
        }
        objc_msgSend(v9, "resume", v13, (void)v14);
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v5);
  }
}

- (void)_createServices
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  machServices = self->_machServices;
  self->_machServices = v3;

  uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  listeners = self->_listeners;
  self->_listeners = v5;

  objc_super v7 = +[IRRecommendationService serviceWithQueue:self->_xpcQueue];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [v7 machServicesNames];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v19;
    long long v13 = (os_log_t *)MEMORY[0x263F50090];
    *(void *)&long long v10 = 138412290;
    long long v17 = v10;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v14);
        long long v16 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v17;
          uint64_t v23 = v15;
          _os_log_impl(&dword_25418E000, v16, OS_LOG_TYPE_DEFAULT, "[IRXPCServicesManager] creating recommendation mach service with name: %@", buf, 0xCu);
        }
        -[NSMutableDictionary setObject:forKey:](self->_machServices, "setObject:forKey:", v7, v15, v17);
        ++v14;
      }
      while (v11 != v14);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v11);
  }
}

- (void)_setupXPCListeners
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = (os_log_t *)MEMORY[0x263F50090];
  long long v4 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25418E000, v4, OS_LOG_TYPE_DEFAULT, "[IRXPCServicesManager] setting up XPC listeners", buf, 2u);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_machServices allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v18 = v10;
          _os_log_impl(&dword_25418E000, v11, OS_LOG_TYPE_DEFAULT, "[IRXPCServicesManager] setting up XPC listener for mach service: %@", buf, 0xCu);
        }
        uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:v10];
        [v12 setDelegate:self];
        [(NSMutableArray *)self->_listeners addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_t *)MEMORY[0x263F50090];
  uint64_t v9 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v7;
    _os_log_impl(&dword_25418E000, v9, OS_LOG_TYPE_DEFAULT, "[IRXPCServicesManager] listener shouldAcceptNewConnection. Connection: %@", (uint8_t *)&v16, 0xCu);
  }
  machServices = self->_machServices;
  uint64_t v11 = [v7 serviceName];
  uint64_t v12 = [(NSMutableDictionary *)machServices objectForKey:v11];

  if (v12)
  {
    char v13 = [v12 shouldAcceptNewConnection:v7];
  }
  else
  {
    os_log_t v14 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
      -[IRXPCServicesManager listener:shouldAcceptNewConnection:](v14, v7);
    }
    char v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_listeners, 0);

  objc_storeStrong((id *)&self->_machServices, 0);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  long long v4 = [a2 serviceName];
  int v5 = 138412546;
  id v6 = v4;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_25418E000, v3, OS_LOG_TYPE_ERROR, "[ErrorId - Service listener  error] [IRXPCServicesManager] no service listening for %@, connection: %@", (uint8_t *)&v5, 0x16u);
}

@end