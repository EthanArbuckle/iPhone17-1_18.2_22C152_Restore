@interface CLKComplicationClientManager
+ (id)sharedClientManager;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CLKComplicationClientManager)init;
- (NSDictionary)clientsByIdentifier;
- (id)clientRegistrationHandler;
- (id)clientUnregistrationHandler;
- (id)waitForClientWithIdentifier:(id)a3 handler:(id)a4;
- (void)_addClient:(id)a3;
- (void)_removeClient:(id)a3;
- (void)dealloc;
- (void)enumerateClientsWithBlock:(id)a3;
- (void)setClientRegistrationHandler:(id)a3;
- (void)setClientUnregistrationHandler:(id)a3;
- (void)stopWaitingForClientWithIdentifier:(id)a3 forToken:(id)a4;
@end

@implementation CLKComplicationClientManager

+ (id)sharedClientManager
{
  if (sharedClientManager_onceToken != -1) {
    dispatch_once(&sharedClientManager_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)sharedClientManager___sharedClientManager;

  return v2;
}

uint64_t __51__CLKComplicationClientManager_sharedClientManager__block_invoke()
{
  v0 = objc_alloc_init(CLKComplicationClientManager);
  v1 = (void *)sharedClientManager___sharedClientManager;
  sharedClientManager___sharedClientManager = (uint64_t)v0;

  uint64_t result = CLKIsClockFaceApp();
  if (result)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.ClockKit.complicationserver"];
    v4 = (void *)sharedClientManager___listener;
    sharedClientManager___listener = v3;

    [(id)sharedClientManager___listener setDelegate:sharedClientManager___sharedClientManager];
    [(id)sharedClientManager___listener resume];
    v5 = (const char *)[@"com.apple.ClockKit.complicationservicedidstart" UTF8String];
    return notify_post(v5);
  }
  return result;
}

- (CLKComplicationClientManager)init
{
  v22.receiver = self;
  v22.super_class = (Class)CLKComplicationClientManager;
  v2 = [(CLKComplicationClientManager *)&v22 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    clientsByIdentifier = v2->_clientsByIdentifier;
    v2->_clientsByIdentifier = v3;

    v5 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    clientsByIdentifierLock = v2->_clientsByIdentifierLock;
    v2->_clientsByIdentifierLock = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    waitForClientRegistriesByIdentifier = v2->_waitForClientRegistriesByIdentifier;
    v2->_waitForClientRegistriesByIdentifier = v7;

    v9 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    waitForClientRegistriesByIdentifierLock = v2->_waitForClientRegistriesByIdentifierLock;
    v2->_waitForClientRegistriesByIdentifierLock = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    anonymousClients = v2->_anonymousClients;
    v2->_anonymousClients = v11;

    v13 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    anonymousClientsLock = v2->_anonymousClientsLock;
    v2->_anonymousClientsLock = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    clientPIDs = v2->_clientPIDs;
    v2->_clientPIDs = v15;

    v17 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    clientPIDsLock = v2->_clientPIDsLock;
    v2->_clientPIDsLock = v17;

    v19 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    nextWaitForClientTokenValueLock = v2->_nextWaitForClientTokenValueLock;
    v2->_nextWaitForClientTokenValueLock = v19;
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CLKComplicationClientManager;
  [(CLKComplicationClientManager *)&v2 dealloc];
}

- (NSDictionary)clientsByIdentifier
{
  [(NSLock *)self->_clientsByIdentifierLock lock];
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_clientsByIdentifier copy];
  [(NSLock *)self->_clientsByIdentifierLock unlock];

  return (NSDictionary *)v3;
}

- (void)enumerateClientsWithBlock:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_clientsByIdentifierLock lock];
  v5 = (void *)[(NSMutableDictionary *)self->_clientsByIdentifier copy];
  [(NSLock *)self->_clientsByIdentifierLock unlock];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__CLKComplicationClientManager_enumerateClientsWithBlock___block_invoke;
  v7[3] = &unk_26440E998;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __58__CLKComplicationClientManager_enumerateClientsWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)waitForClientWithIdentifier:(id)a3 handler:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  [(NSLock *)self->_clientsByIdentifierLock lock];
  id v8 = [(NSMutableDictionary *)self->_clientsByIdentifier objectForKey:v6];
  [(NSLock *)self->_clientsByIdentifierLock unlock];
  if (v8)
  {
    v7[2](v7, v8);
    v9 = 0;
  }
  else
  {
    [(NSLock *)self->_nextWaitForClientTokenValueLock lock];
    v9 = [NSNumber numberWithUnsignedInteger:self->_nextWaitForClientTokenValue];
    nextWaitForClientTokenValueLock = self->_nextWaitForClientTokenValueLock;
    ++self->_nextWaitForClientTokenValue;
    [(NSLock *)nextWaitForClientTokenValueLock unlock];
    v11 = CLKLoggingObjectForDomain(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_21C599000, v11, OS_LOG_TYPE_DEFAULT, "Waiting for client with identifier %@ (token = %@)...", (uint8_t *)&v16, 0x16u);
    }

    [(NSLock *)self->_waitForClientRegistriesByIdentifierLock lock];
    id v12 = [(NSMutableDictionary *)self->_waitForClientRegistriesByIdentifier objectForKey:v6];
    if (!v12)
    {
      id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      [(NSMutableDictionary *)self->_waitForClientRegistriesByIdentifier setObject:v12 forKey:v6];
    }
    [(NSLock *)self->_waitForClientRegistriesByIdentifierLock unlock];
    v13 = (void *)[v7 copy];
    v14 = (void *)MEMORY[0x21D4AACC0]();
    [v12 setObject:v14 forKey:v9];
  }

  return v9;
}

- (void)stopWaitingForClientWithIdentifier:(id)a3 forToken:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = CLKLoggingObjectForDomain(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v6;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl(&dword_21C599000, v8, OS_LOG_TYPE_DEFAULT, "Stop waiting for client with identifier %@ (token = %@)...", (uint8_t *)&v10, 0x16u);
    }

    [(NSLock *)self->_waitForClientRegistriesByIdentifierLock lock];
    v9 = [(NSMutableDictionary *)self->_waitForClientRegistriesByIdentifier objectForKey:v6];
    [(NSLock *)self->_waitForClientRegistriesByIdentifierLock unlock];
    [v9 removeObjectForKey:v7];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__CLKComplicationClientManager_listener_shouldAcceptNewConnection___block_invoke;
  v8[3] = &unk_26440E608;
  id v9 = v5;
  int v10 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v8);

  return 1;
}

void __67__CLKComplicationClientManager_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  objc_super v2 = [[CLKComplicationClient alloc] initWithConnection:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 48) lock];
  [*(id *)(*(void *)(a1 + 40) + 40) addObject:v2];
  [*(id *)(*(void *)(a1 + 40) + 48) unlock];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__CLKComplicationClientManager_listener_shouldAcceptNewConnection___block_invoke_2;
  v4[3] = &unk_26440E9C0;
  v4[4] = *(void *)(a1 + 40);
  [(CLKComplicationClient *)v2 setCheckinHandler:v4];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __67__CLKComplicationClientManager_listener_shouldAcceptNewConnection___block_invoke_3;
  v3[3] = &unk_26440E9C0;
  v3[4] = *(void *)(a1 + 40);
  [(CLKComplicationClient *)v2 setInvalidationHandler:v3];
  [*(id *)(a1 + 32) resume];
}

void __67__CLKComplicationClientManager_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 48);
  id v4 = a2;
  [v3 lock];
  [*(id *)(*(void *)(a1 + 32) + 40) removeObject:v4];
  [*(id *)(*(void *)(a1 + 32) + 48) unlock];
  [*(id *)(a1 + 32) _addClient:v4];
}

void __67__CLKComplicationClientManager_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 48);
  id v4 = a2;
  [v3 lock];
  [*(id *)(*(void *)(a1 + 32) + 40) removeObject:v4];
  [*(id *)(*(void *)(a1 + 32) + 48) unlock];
  [*(id *)(a1 + 32) _removeClient:v4];
}

- (void)_addClient:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 clientIdentifier];
  id v6 = CLKLoggingObjectForDomain(1);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v5;
      _os_log_impl(&dword_21C599000, v6, OS_LOG_TYPE_DEFAULT, "Adding client with identifier %@", buf, 0xCu);
    }

    [(NSLock *)self->_clientPIDsLock lock];
    clientPIDs = self->_clientPIDs;
    id v9 = [v4 pid];
    [(NSMutableSet *)clientPIDs addObject:v9];

    [(NSLock *)self->_clientPIDsLock unlock];
    [(NSLock *)self->_clientsByIdentifierLock lock];
    [(NSMutableDictionary *)self->_clientsByIdentifier setObject:v4 forKey:v5];
    [(NSLock *)self->_clientsByIdentifierLock unlock];
    clientRegistrationHandler = (void (**)(id, id))self->_clientRegistrationHandler;
    if (clientRegistrationHandler) {
      clientRegistrationHandler[2](clientRegistrationHandler, v4);
    }
    [(NSLock *)self->_waitForClientRegistriesByIdentifierLock lock];
    id v11 = [(NSMutableDictionary *)self->_waitForClientRegistriesByIdentifier objectForKey:v5];
    [(NSMutableDictionary *)self->_waitForClientRegistriesByIdentifier removeObjectForKey:v5];
    [(NSLock *)self->_waitForClientRegistriesByIdentifierLock unlock];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    __int16 v12 = objc_msgSend(v11, "allValues", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * v16++) + 16))();
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v14);
    }
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v4;
      _os_log_impl(&dword_21C599000, v6, OS_LOG_TYPE_DEFAULT, "Invalidating client due to no identifier %@", buf, 0xCu);
    }

    [v4 invalidate];
  }
}

- (void)_removeClient:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 clientIdentifier];
    int v20 = 138412290;
    v21 = v6;
    _os_log_impl(&dword_21C599000, v5, OS_LOG_TYPE_DEFAULT, "Removing client with identifier %@", (uint8_t *)&v20, 0xCu);
  }
  clientUnregistrationHandler = (void (**)(id, id))self->_clientUnregistrationHandler;
  if (clientUnregistrationHandler) {
    clientUnregistrationHandler[2](clientUnregistrationHandler, v4);
  }
  [(NSLock *)self->_clientsByIdentifierLock lock];
  clientsByIdentifier = self->_clientsByIdentifier;
  id v9 = [v4 clientIdentifier];
  id v10 = [(NSMutableDictionary *)clientsByIdentifier objectForKey:v9];

  if (v10 == v4)
  {
    uint64_t v16 = self->_clientsByIdentifier;
    long long v17 = [v4 clientIdentifier];
    [(NSMutableDictionary *)v16 removeObjectForKey:v17];

    [(NSLock *)self->_clientPIDsLock lock];
    clientPIDs = self->_clientPIDs;
    long long v19 = [v4 pid];
    [(NSMutableSet *)clientPIDs removeObject:v19];

    [(NSLock *)self->_clientPIDsLock unlock];
  }
  else
  {
    id v11 = CLKLoggingObjectForDomain(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = [v4 clientIdentifier];
      uint64_t v13 = self->_clientsByIdentifier;
      uint64_t v14 = [v4 clientIdentifier];
      uint64_t v15 = [(NSMutableDictionary *)v13 objectForKey:v14];
      int v20 = 138412802;
      v21 = v12;
      __int16 v22 = 2112;
      id v23 = v4;
      __int16 v24 = 2112;
      v25 = v15;
      _os_log_impl(&dword_21C599000, v11, OS_LOG_TYPE_DEFAULT, "Attempting to remove wrong CLKComplicationClient with identifier %@ (%@ for %@)", (uint8_t *)&v20, 0x20u);
    }
  }
  [(NSLock *)self->_clientsByIdentifierLock unlock];
}

- (id)clientRegistrationHandler
{
  return self->_clientRegistrationHandler;
}

- (void)setClientRegistrationHandler:(id)a3
{
}

- (id)clientUnregistrationHandler
{
  return self->_clientUnregistrationHandler;
}

- (void)setClientUnregistrationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientUnregistrationHandler, 0);
  objc_storeStrong(&self->_clientRegistrationHandler, 0);
  objc_storeStrong((id *)&self->_nextWaitForClientTokenValueLock, 0);
  objc_storeStrong((id *)&self->_clientPIDsLock, 0);
  objc_storeStrong((id *)&self->_clientPIDs, 0);
  objc_storeStrong((id *)&self->_anonymousClientsLock, 0);
  objc_storeStrong((id *)&self->_anonymousClients, 0);
  objc_storeStrong((id *)&self->_waitForClientRegistriesByIdentifierLock, 0);
  objc_storeStrong((id *)&self->_waitForClientRegistriesByIdentifier, 0);
  objc_storeStrong((id *)&self->_clientsByIdentifierLock, 0);

  objc_storeStrong((id *)&self->_clientsByIdentifier, 0);
}

@end