@interface MGClientService
+ (MGClientService)clientServiceWithConnectionProvider:(id)a3;
- (BOOL)shouldAttemptReconnect;
- (MGClientConnectionProviderProtocol)provider;
- (MGClientService)init;
- (MGClientService)initWithConnectionProvider:(id)a3;
- (NSDictionary)queries;
- (NSXPCConnection)connection;
- (void)HomeKitAccessoryOfType:(id)a3 accessoryIdentifier:(id)a4 homeIdentifier:(id)a5 categoryType:(id)a6 name:(id)a7 properties:(id)a8 completion:(id)a9;
- (void)addMember:(id)a3 group:(id)a4 completion:(id)a5;
- (void)connectionProvider:(id)a3 serviceLost:(id)a4;
- (void)connectionProviderServiceAvailable:(id)a3;
- (void)createGroupWithType:(id)a3 name:(id)a4 members:(id)a5 completion:(id)a6;
- (void)deleteGroup:(id)a3 completion:(id)a4;
- (void)query:(id)a3 didUpdate:(id)a4 completion:(id)a5;
- (void)reconnect;
- (void)removeMember:(id)a3 group:(id)a4 completion:(id)a5;
- (void)setConnection:(id)a3;
- (void)setName:(id)a3 group:(id)a4 completion:(id)a5;
- (void)setQueries:(id)a3;
- (void)setShouldAttemptReconnect:(BOOL)a3;
- (void)startQueryWithPredicate:(id)a3 completion:(id)a4;
- (void)startQueryWithQueryData:(void *)a1;
- (void)stopQuery:(id)a3 completion:(id)a4;
@end

@implementation MGClientService

- (MGClientService)initWithConnectionProvider:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v4 = (MGClientConnectionProvider *)a3;
  if (!v4) {
    v4 = objc_alloc_init(MGClientConnectionProvider);
  }
  v10.receiver = self;
  v10.super_class = (Class)MGClientService;
  v5 = [(MGClientService *)&v10 init];
  v6 = v5;
  if (v5)
  {
    queries = v5->_queries;
    v5->_queries = (NSDictionary *)MEMORY[0x263EFFA78];

    objc_storeStrong((id *)&v6->_provider, v4);
    [(MGClientConnectionProviderProtocol *)v6->_provider setDelegate:v6];
    v6->_shouldAttemptReconnect = 1;
    v8 = MGLogForCategory(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v12 = v6;
      __int16 v13 = 2048;
      v14 = v4;
      _os_log_impl(&dword_222D6E000, v8, OS_LOG_TYPE_DEFAULT, "%p service initializing with provider %p", buf, 0x16u);
    }
  }
  return v6;
}

- (MGClientService)init
{
  return [(MGClientService *)self initWithConnectionProvider:0];
}

- (NSXPCConnection)connection
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__MGClientService_connection__block_invoke;
  v4[3] = &unk_26466E8E8;
  v4[4] = self;
  v4[5] = &v5;
  -[MGClientConnectionProvider _withLock:]((os_unfair_lock_s *)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSXPCConnection *)v2;
}

void __29__MGClientService_connection__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 24));
  id v2 = *(void **)(a1 + 32);
  if (!v2[3])
  {
    v3 = [v2 provider];
    uint64_t v4 = [v3 serviceConnection];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v4;

    objc_setAssociatedObject(*(id *)(*(void *)(a1 + 32) + 24), "com.apple.MediaGroups.ClientService", *(id *)(a1 + 32), 0);
    uint64_t v7 = MGLogForCategory(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v13 = 134217984;
      uint64_t v14 = v8;
      _os_log_impl(&dword_222D6E000, v7, OS_LOG_TYPE_DEFAULT, "%p setting up interface", (uint8_t *)&v13, 0xCu);
    }

    MGSetServiceXPCInterfacesOnConnection(*(void **)(*(void *)(a1 + 32) + 24), 0);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setExportedObject:");
    v9 = *(void **)(a1 + 32);
    id v10 = (void *)v9[3];
    v11 = [v9 provider];
    v12 = [v11 dispatchQueue];
    [v10 _setQueue:v12];

    [*(id *)(*(void *)(a1 + 32) + 24) resume];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 24));
  }
}

void __33__MGClientService_connectionLost__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;
}

- (void)reconnect
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__1;
    v18 = __Block_byref_object_dispose__1;
    id v19 = 0;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __28__MGClientService_reconnect__block_invoke;
    v13[3] = &unk_26466E960;
    v13[4] = a1;
    v13[5] = &v14;
    -[MGClientConnectionProvider _withLock:](a1, v13);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = (id)v15[5];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v24 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v10 != v4) {
            objc_enumerationMutation(v2);
          }
          uint64_t v6 = *(void *)(*((void *)&v9 + 1) + 8 * i);
          uint64_t v7 = MGLogForCategory(2);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v21 = a1;
            __int16 v22 = 2112;
            uint64_t v23 = v6;
            _os_log_impl(&dword_222D6E000, v7, OS_LOG_TYPE_DEFAULT, "%p will retry query %@", buf, 0x16u);
          }

          uint64_t v8 = [(id)v15[5] objectForKey:v6];
          -[MGClientService startQueryWithQueryData:](a1, v8);
        }
        uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v24 count:16];
      }
      while (v3);
    }

    _Block_object_dispose(&v14, 8);
  }
}

void __28__MGClientService_reconnect__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) queries];
  uint64_t v3 = [v2 count];

  uint64_t v4 = *(void **)(a1 + 32);
  if (v4[3])
  {
    uint64_t v5 = MGLogForCategory(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v16 = 134217984;
      uint64_t v17 = v6;
      uint64_t v7 = "%p not reconnecting - already connected";
LABEL_13:
      _os_log_impl(&dword_222D6E000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v16, 0xCu);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (([v4 shouldAttemptReconnect] & 1) == 0)
  {
    uint64_t v5 = MGLogForCategory(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v16 = 134217984;
      uint64_t v17 = v14;
      uint64_t v7 = "%p not reconnecting - already attempted";
      goto LABEL_13;
    }
LABEL_14:

    return;
  }
  uint64_t v5 = MGLogForCategory(2);
  BOOL v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v8)
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 134217984;
      uint64_t v17 = v15;
      uint64_t v7 = "%p not reconnecting - no outstanding queries";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v16 = 134218240;
    uint64_t v17 = v9;
    __int16 v18 = 2048;
    uint64_t v19 = v3;
    _os_log_impl(&dword_222D6E000, v5, OS_LOG_TYPE_DEFAULT, "%p attempting reconnect (%lu queries)", (uint8_t *)&v16, 0x16u);
  }

  [*(id *)(a1 + 32) setShouldAttemptReconnect:0];
  long long v10 = [*(id *)(a1 + 32) queries];
  uint64_t v11 = [v10 copy];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  int v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  [*(id *)(a1 + 32) setQueries:MEMORY[0x263EFFA78]];
}

- (void)startQueryWithQueryData:(void *)a1
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = MGLogForCategory(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      __int16 v18 = a1;
      _os_log_impl(&dword_222D6E000, v4, OS_LOG_TYPE_DEFAULT, "%p initiating query with service...", buf, 0xCu);
    }

    uint64_t v5 = [v3 predicate];
    uint64_t v6 = [v3 handler];
    objc_initWeak((id *)buf, a1);
    uint64_t v7 = [a1 connection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __43__MGClientService_startQueryWithQueryData___block_invoke;
    v15[3] = &unk_26466E9B0;
    id v8 = v6;
    id v16 = v8;
    uint64_t v9 = [v7 remoteObjectProxyWithErrorHandler:v15];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __43__MGClientService_startQueryWithQueryData___block_invoke_2;
    v11[3] = &unk_26466EA00;
    objc_copyWeak(&v14, (id *)buf);
    id v12 = v3;
    id v10 = v8;
    id v13 = v10;
    [v9 startQueryWithPredicate:v5 completion:v11];

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

void __41__MGClientService_updateHandlerForQuery___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) queries];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __41__MGClientService_setQueryData_forQuery___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) queries];
  id v3 = (id)[v2 mutableCopy];

  [v3 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setQueries:v3];
}

void __43__MGClientService_removeQueryDataForQuery___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) queries];
  id v3 = (id)[v2 mutableCopy];

  [v3 removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setQueries:v3];
}

+ (MGClientService)clientServiceWithConnectionProvider:(id)a3
{
  id v4 = a3;
  id v5 = [v4 serviceConnection];
  uint64_t v6 = objc_getAssociatedObject(v5, "com.apple.MediaGroups.ClientService");

  if (!v6) {
    uint64_t v6 = (void *)[objc_alloc((Class)a1) initWithConnectionProvider:v4];
  }

  return (MGClientService *)v6;
}

- (void)createGroupWithType:(id)a3 name:(id)a4 members:(id)a5 completion:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = MGLogForCategory(2);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v24 = self;
    _os_log_impl(&dword_222D6E000, v14, OS_LOG_TYPE_DEFAULT, "%p creating group...", buf, 0xCu);
  }

  uint64_t v15 = [(MGClientService *)self connection];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __63__MGClientService_createGroupWithType_name_members_completion___block_invoke;
  v21[3] = &unk_26466E9B0;
  id v16 = v10;
  id v22 = v16;
  uint64_t v17 = [v15 remoteObjectProxyWithErrorHandler:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __63__MGClientService_createGroupWithType_name_members_completion___block_invoke_2;
  v19[3] = &unk_26466E9D8;
  v19[4] = self;
  id v20 = v16;
  id v18 = v16;
  [v17 createGroupWithType:v13 name:v12 members:v11 completion:v19];
}

uint64_t __63__MGClientService_createGroupWithType_name_members_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__MGClientService_createGroupWithType_name_members_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v7 forceSetClientService:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deleteGroup:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = MGLogForCategory(2);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = self;
    _os_log_impl(&dword_222D6E000, v8, OS_LOG_TYPE_DEFAULT, "%p deleting group...", buf, 0xCu);
  }

  uint64_t v9 = [(MGClientService *)self connection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__MGClientService_deleteGroup_completion___block_invoke;
  v12[3] = &unk_26466E9B0;
  id v13 = v6;
  id v10 = v6;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v12];
  [v11 deleteGroup:v7 completion:v10];
}

uint64_t __42__MGClientService_deleteGroup_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)HomeKitAccessoryOfType:(id)a3 accessoryIdentifier:(id)a4 homeIdentifier:(id)a5 categoryType:(id)a6 name:(id)a7 properties:(id)a8 completion:(id)a9
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v16 = a9;
  id v27 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v22 = MGLogForCategory(2);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v33 = self;
    _os_log_impl(&dword_222D6E000, v22, OS_LOG_TYPE_DEFAULT, "%p requesting HomeKit alias...", buf, 0xCu);
  }

  uint64_t v23 = [(MGClientService *)self connection];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __117__MGClientService_HomeKitAccessoryOfType_accessoryIdentifier_homeIdentifier_categoryType_name_properties_completion___block_invoke;
  v30[3] = &unk_26466E9B0;
  id v24 = v16;
  id v31 = v24;
  uint64_t v25 = [v23 remoteObjectProxyWithErrorHandler:v30];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __117__MGClientService_HomeKitAccessoryOfType_accessoryIdentifier_homeIdentifier_categoryType_name_properties_completion___block_invoke_2;
  v28[3] = &unk_26466E9D8;
  v28[4] = self;
  id v29 = v24;
  id v26 = v24;
  [v25 HomeKitAccessoryOfType:v21 accessoryIdentifier:v20 homeIdentifier:v19 categoryType:v18 name:v17 properties:v27 completion:v28];
}

uint64_t __117__MGClientService_HomeKitAccessoryOfType_accessoryIdentifier_homeIdentifier_categoryType_name_properties_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __117__MGClientService_HomeKitAccessoryOfType_accessoryIdentifier_homeIdentifier_categoryType_name_properties_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v7 forceSetClientService:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setName:(id)a3 group:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = MGLogForCategory(2);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v21 = self;
    _os_log_impl(&dword_222D6E000, v11, OS_LOG_TYPE_DEFAULT, "%p performing name change...", buf, 0xCu);
  }

  id v12 = [(MGClientService *)self connection];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __44__MGClientService_setName_group_completion___block_invoke;
  v18[3] = &unk_26466E9B0;
  id v13 = v8;
  id v19 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __44__MGClientService_setName_group_completion___block_invoke_2;
  v16[3] = &unk_26466E9D8;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 setName:v10 group:v9 completion:v16];
}

uint64_t __44__MGClientService_setName_group_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __44__MGClientService_setName_group_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v7 forceSetClientService:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)addMember:(id)a3 group:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = MGLogForCategory(2);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    id v21 = self;
    __int16 v22 = 2048;
    id v23 = v8;
    __int16 v24 = 2048;
    id v25 = v9;
    _os_log_impl(&dword_222D6E000, v11, OS_LOG_TYPE_DEFAULT, "%p adding %p to %p...", buf, 0x20u);
  }

  id v12 = [(MGClientService *)self connection];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __46__MGClientService_addMember_group_completion___block_invoke;
  v18[3] = &unk_26466E9B0;
  id v13 = v10;
  id v19 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __46__MGClientService_addMember_group_completion___block_invoke_2;
  v16[3] = &unk_26466E9D8;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 addMember:v8 group:v9 completion:v16];
}

uint64_t __46__MGClientService_addMember_group_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __46__MGClientService_addMember_group_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v7 forceSetClientService:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removeMember:(id)a3 group:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = MGLogForCategory(2);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    id v21 = self;
    __int16 v22 = 2048;
    id v23 = v8;
    __int16 v24 = 2048;
    id v25 = v9;
    _os_log_impl(&dword_222D6E000, v11, OS_LOG_TYPE_DEFAULT, "%p removing %p from %p...", buf, 0x20u);
  }

  id v12 = [(MGClientService *)self connection];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __49__MGClientService_removeMember_group_completion___block_invoke;
  v18[3] = &unk_26466E9B0;
  id v13 = v10;
  id v19 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __49__MGClientService_removeMember_group_completion___block_invoke_2;
  v16[3] = &unk_26466E9D8;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 removeMember:v8 group:v9 completion:v16];
}

uint64_t __49__MGClientService_removeMember_group_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__MGClientService_removeMember_group_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v7 forceSetClientService:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __43__MGClientService_startQueryWithQueryData___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __43__MGClientService_startQueryWithQueryData___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v12 = a2;
  id v6 = a4;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v6)
    {
      id v8 = *(id *)(a1 + 32);
      id v9 = v12;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __41__MGClientService_setQueryData_forQuery___block_invoke;
      v13[3] = &unk_26466E988;
      v13[4] = WeakRetained;
      id v10 = v8;
      id v14 = v10;
      id v11 = v9;
      id v15 = v11;
      -[MGClientConnectionProvider _withLock:](WeakRetained, v13);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)startQueryWithPredicate:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = MGLogForCategory(2);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    id v11 = self;
    _os_log_impl(&dword_222D6E000, v8, OS_LOG_TYPE_DEFAULT, "%p starting query...", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [[MGClientServiceQueryData alloc] initWithPredicate:v7 updateHandler:v6];
  -[MGClientService startQueryWithQueryData:](self, v9);
}

- (void)stopQuery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(MGClientService *)self connection];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __40__MGClientService_stopQuery_completion___block_invoke;
  v15[3] = &unk_26466E9B0;
  id v9 = v7;
  id v16 = v9;
  int v10 = [v8 remoteObjectProxyWithErrorHandler:v15];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __40__MGClientService_stopQuery_completion___block_invoke_2;
  v12[3] = &unk_26466EA28;
  objc_copyWeak(&v14, &location);
  id v11 = v6;
  id v13 = v11;
  [v10 stopQuery:v11 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

uint64_t __40__MGClientService_stopQuery_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __40__MGClientService_stopQuery_completion___block_invoke_2(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = *(id *)(a1 + 32);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __43__MGClientService_removeQueryDataForQuery___block_invoke;
    v5[3] = &unk_26466E910;
    v5[4] = WeakRetained;
    id v3 = v2;
    id v6 = v3;
    -[MGClientConnectionProvider _withLock:](WeakRetained, v5);
  }
}

- (void)query:(id)a3 didUpdate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void))a5;
  v10[2](v10, 0);
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__MGClientService_query_didUpdate_completion___block_invoke;
  v14[3] = &unk_26466EA50;
  objc_copyWeak(&v15, &location);
  [v9 enumerateObjectsUsingBlock:v14];
  id v11 = v8;
  uint64_t v12 = v11;
  if (self)
  {
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = __Block_byref_object_copy__1;
    __int16 v24 = __Block_byref_object_dispose__1;
    id v25 = 0;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __41__MGClientService_updateHandlerForQuery___block_invoke;
    v17[3] = &unk_26466EAA0;
    id v19 = &v20;
    v17[4] = self;
    id v13 = v11;
    id v18 = v13;
    -[MGClientConnectionProvider _withLock:]((os_unfair_lock_s *)self, v17);
    self = [(id)v21[5] handler];

    _Block_object_dispose(&v20, 8);
    if (self) {
      ((void (*)(MGClientService *, id, id, void))self->_provider)(self, v13, v9, 0);
    }
  }
  else
  {
  }
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __46__MGClientService_query_didUpdate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [v3 forceSetClientService:WeakRetained];
}

- (void)connectionProvider:(id)a3 serviceLost:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__MGClientService_connectionProvider_serviceLost___block_invoke;
  v11[3] = &unk_26466EA78;
  id v8 = v6;
  id v12 = v8;
  id v13 = self;
  id v9 = v7;
  id v14 = v9;
  id v15 = &v16;
  -[MGClientConnectionProvider _withLock:]((os_unfair_lock_s *)self, v11);
  if (*((unsigned char *)v17 + 24) && self)
  {
    int v10 = MGLogForCategory(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = self;
      _os_log_error_impl(&dword_222D6E000, v10, OS_LOG_TYPE_ERROR, "%p lost connection to service", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    id v21 = __33__MGClientService_connectionLost__block_invoke;
    uint64_t v22 = &unk_26466E8C0;
    id v23 = self;
    -[MGClientConnectionProvider _withLock:]((os_unfair_lock_s *)self, &buf);
    -[MGClientService reconnect]((os_unfair_lock_s *)self);
  }

  _Block_object_dispose(&v16, 8);
}

void *__50__MGClientService_connectionProvider_serviceLost___block_invoke(void *result)
{
  uint64_t v1 = result[5];
  if (result[4] == *(void *)(v1 + 16) && result[6] == *(void *)(v1 + 24)) {
    *(unsigned char *)(*(void *)(result[7] + 8) + 24) = 1;
  }
  return result;
}

- (void)connectionProviderServiceAvailable:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__MGClientService_connectionProviderServiceAvailable___block_invoke;
  v6[3] = &unk_26466EAA0;
  id v5 = v4;
  id v7 = v5;
  id v8 = self;
  id v9 = &v10;
  -[MGClientConnectionProvider _withLock:]((os_unfair_lock_s *)self, v6);
  if (*((unsigned char *)v11 + 24)) {
    -[MGClientService reconnect]((os_unfair_lock_s *)self);
  }

  _Block_object_dispose(&v10, 8);
}

void *__54__MGClientService_connectionProviderServiceAvailable___block_invoke(void *result)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (result[4] == *(void *)(result[5] + 16))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(result[6] + 8) + 24) = 1;
    id v2 = MGLogForCategory(2);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = v1[5];
      int v4 = 134217984;
      uint64_t v5 = v3;
      _os_log_impl(&dword_222D6E000, v2, OS_LOG_TYPE_DEFAULT, "%p service should be available", (uint8_t *)&v4, 0xCu);
    }

    return (void *)[(id)v1[5] setShouldAttemptReconnect:1];
  }
  return result;
}

- (MGClientConnectionProviderProtocol)provider
{
  return self->_provider;
}

- (void)setConnection:(id)a3
{
}

- (BOOL)shouldAttemptReconnect
{
  return self->_shouldAttemptReconnect;
}

- (void)setShouldAttemptReconnect:(BOOL)a3
{
  self->_shouldAttemptReconnect = a3;
}

- (NSDictionary)queries
{
  return self->_queries;
}

- (void)setQueries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

@end