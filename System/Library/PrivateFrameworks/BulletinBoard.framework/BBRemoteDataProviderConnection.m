@interface BBRemoteDataProviderConnection
- (BBRemoteDataProviderConnection)initWithServiceName:(id)a3 bundleID:(id)a4 delegate:(id)a5;
- (BOOL)isConnected;
- (NSString)bundleID;
- (NSString)debugDescription;
- (NSString)serviceName;
- (id)dataProviderForSectionID:(id)a3;
- (id)dataProvidersForUniversalSectionID:(id)a3;
- (id)debugDescriptionWithChildren:(unint64_t)a3;
- (void)_queue_removeDataProvider:(id)a3;
- (void)addDataProviderWithSectionID:(id)a3 clientProxy:(id)a4 identity:(id)a5 completion:(id)a6;
- (void)addParentSectionFactory:(id)a3;
- (void)clientIsReady:(id)a3;
- (void)performBlockOnDataProviders:(id)a3;
- (void)remoteDataProviderNeedsToWakeClient:(id)a3;
- (void)removeDataProvider:(id)a3;
- (void)removeDataProviderWithSectionID:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setConnected:(BOOL)a3 completion:(id)a4;
- (void)setServiceName:(id)a3;
@end

@implementation BBRemoteDataProviderConnection

- (BBRemoteDataProviderConnection)initWithServiceName:(id)a3 bundleID:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"BBRemoteDataProviderConnection.m", 38, @"Invalid parameter not satisfying: %@", @"serviceName" object file lineNumber description];
  }
  v12 = [(BBRemoteDataProviderConnection *)self init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_delegate, a5);
    v13->_connected = 0;
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.bulletinboard.BBRemoteDataProviderConnection.queue", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dataProvidersBySectionID = v13->_dataProvidersBySectionID;
    v13->_dataProvidersBySectionID = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dataProvidersByUniversalSectionID = v13->_dataProvidersByUniversalSectionID;
    v13->_dataProvidersByUniversalSectionID = v19;

    [(BBRemoteDataProviderConnection *)v13 setServiceName:v9];
    [(BBRemoteDataProviderConnection *)v13 setBundleID:v10];
    v13->_clientReady = 0;
  }

  return v13;
}

- (id)debugDescriptionWithChildren:(unint64_t)a3
{
  v5 = [MEMORY[0x263F089D8] stringWithString:&stru_26C7952A0];
  if (a3)
  {
    unint64_t v6 = a3;
    do
    {
      [v5 appendString:@"    "];
      --v6;
    }
    while (v6);
  }
  v7 = (void *)MEMORY[0x263F089D8];
  v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  id v10 = objc_msgSend(v7, "stringWithFormat:", @"%@<%@: %p> (%@"), v5, v9, self, self->_serviceName;

  if (self->_bundleID) {
    [v10 appendFormat:@", %@", self->_bundleID];
  }
  [v10 appendString:@""]);
  if (self->_connected) {
    id v11 = @" [CONNECTED]";
  }
  else {
    id v11 = @" [DISCONNECTED]";
  }
  [v10 appendString:v11];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__BBRemoteDataProviderConnection_debugDescriptionWithChildren___block_invoke;
  block[3] = &unk_2642962B0;
  block[4] = self;
  id v13 = v10;
  id v18 = v13;
  unint64_t v19 = a3;
  dispatch_sync(queue, block);
  v14 = v18;
  id v15 = v13;

  return v15;
}

void __63__BBRemoteDataProviderConnection_debugDescriptionWithChildren___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1[4] + 32) count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v2 = *(id *)(a1[4] + 32);
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
          v7 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * v6)];
          v8 = (void *)a1[5];
          id v9 = [v7 debugDescriptionWithChildren:a1[6] + 1];
          [v8 appendFormat:@"\n%@", v9];

          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v4);
    }
  }
}

- (NSString)debugDescription
{
  return (NSString *)[(BBRemoteDataProviderConnection *)self debugDescriptionWithChildren:0];
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__BBRemoteDataProviderConnection_setConnected_completion___block_invoke;
  block[3] = &unk_264297068;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __58__BBRemoteDataProviderConnection_setConnected_completion___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(a1 + 48);
  if (*(unsigned __int8 *)(v2 + 8) == v3) {
    goto LABEL_19;
  }
  *(unsigned char *)(v2 + 8) = v3;
  int v4 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = (void *)BBLogConnection;
  BOOL v6 = os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6) {
      goto LABEL_19;
    }
    v7 = v5;
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 56);
    *(_DWORD *)buf = 138543618;
    v30 = v9;
    __int16 v31 = 2114;
    uint64_t v32 = v10;
    _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ CONNECTED", buf, 0x16u);
  }
  else
  {
    if (v6)
    {
      BOOL v11 = v5;
      long long v12 = (objc_class *)objc_opt_class();
      long long v13 = NSStringFromClass(v12);
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 56);
      *(_DWORD *)buf = 138543618;
      v30 = v13;
      __int16 v31 = 2114;
      uint64_t v32 = v14;
      _os_log_impl(&dword_217675000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ DISCONNECTED", buf, 0x16u);
    }
    uint64_t v15 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v15 + 48))
    {
      v16 = BBLogConnection;
      if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(void **)(*(void *)(a1 + 32) + 56);
        *(_DWORD *)buf = 138543362;
        v30 = v17;
        _os_log_impl(&dword_217675000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ suspending access queue", buf, 0xCu);
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
      uint64_t v15 = *(void *)(a1 + 32);
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v7 = *(id *)(v15 + 32);
    uint64_t v18 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v7);
          }
          v22 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(void *)(*((void *)&v24 + 1) + 8 * v21), (void)v24);
          [v22 setClientProxy:0 completion:0];

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v19);
    }
  }

LABEL_19:
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_queue_removeDataProvider:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 sectionIdentifier];
  if (v5)
  {
    [v4 setClientProxy:0 completion:0];
    [(NSMutableDictionary *)self->_dataProvidersBySectionID removeObjectForKey:v5];
    BOOL v6 = [v4 universalSectionIdentifier];
    if (v6)
    {
      v7 = [(NSMutableDictionary *)self->_dataProvidersByUniversalSectionID objectForKey:v6];
      [v7 removeObject:v4];
      if (![v7 count]) {
        [(NSMutableDictionary *)self->_dataProvidersByUniversalSectionID removeObjectForKey:v6];
      }
    }
    [(BBRemoteDataProviderStoreDelegate *)self->_delegate dataProviderStore:self didRemoveDataProvider:v4];
    goto LABEL_9;
  }
  id v8 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = v8;
    id v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    int v11 = 138543618;
    long long v12 = v10;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Asked to remove a data provider (%@) without a sectionID. Ignoring.", (uint8_t *)&v11, 0x16u);

LABEL_9:
  }
}

- (void)addDataProviderWithSectionID:(id)a3 clientProxy:(id)a4 identity:(id)a5 completion:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    serviceName = self->_serviceName;
    *(_DWORD *)buf = 138543618;
    long long v27 = serviceName;
    __int16 v28 = 2114;
    id v29 = v10;
    _os_log_impl(&dword_217675000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ updating data provider proxy for section %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__BBRemoteDataProviderConnection_addDataProviderWithSectionID_clientProxy_identity_completion___block_invoke;
  block[3] = &unk_2642965E8;
  block[4] = self;
  id v22 = v10;
  id v23 = v12;
  id v24 = v11;
  id v25 = v13;
  id v17 = v13;
  id v18 = v11;
  id v19 = v12;
  id v20 = v10;
  dispatch_async(queue, block);
}

void __95__BBRemoteDataProviderConnection_addDataProviderWithSectionID_clientProxy_identity_completion___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8))
  {
    id v4 = [*(id *)(v2 + 32) objectForKey:*(void *)(a1 + 40)];
    BOOL v5 = v4 == 0;
    BOOL v6 = BBLogConnection;
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR)) {
        __95__BBRemoteDataProviderConnection_addDataProviderWithSectionID_clientProxy_identity_completion___block_invoke_cold_1();
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(*(void *)v3 + 56);
        uint64_t v9 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v20 = v8;
        __int16 v21 = 2114;
        uint64_t v22 = v9;
        _os_log_impl(&dword_217675000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ adding new data provider proxy for section %{public}@", buf, 0x16u);
      }
      id v4 = [[BBRemoteDataProvider alloc] initWithSectionID:*(void *)(a1 + 40) delegate:*(void *)(a1 + 32)];
      [*(id *)(*(void *)(a1 + 32) + 32) setObject:v4 forKey:*(void *)(a1 + 40)];
      id v10 = [*(id *)(a1 + 48) universalSectionIdentifier];
      if (v10)
      {
        id v11 = [*(id *)(*(void *)v3 + 40) objectForKey:v10];
        if (!v11) {
          id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        }
        [v11 addObject:v4];
        [*(id *)(*(void *)v3 + 40) setObject:v11 forKey:v10];
      }
    }
    [(BBDataProvider *)v4 setIdentity:*(void *)(a1 + 48)];
    objc_initWeak((id *)buf, v4);
    uint64_t v12 = *(void *)(a1 + 56);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __95__BBRemoteDataProviderConnection_addDataProviderWithSectionID_clientProxy_identity_completion___block_invoke_37;
    v14[3] = &unk_264297090;
    objc_copyWeak(&v17, (id *)buf);
    BOOL v18 = v5;
    id v13 = *(void **)(a1 + 40);
    v14[4] = *(void *)(a1 + 32);
    id v15 = v13;
    id v16 = *(id *)(a1 + 64);
    [(BBRemoteDataProvider *)v4 setClientProxy:v12 completion:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v7 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v7();
  }
}

void __95__BBRemoteDataProviderConnection_addDataProviderWithSectionID_clientProxy_identity_completion___block_invoke_37(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (*(unsigned char *)(a1 + 64)) {
    BOOL v4 = WeakRetained == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4
    && ([*(id *)(a1 + 32) dataProviderForSectionID:*(void *)(a1 + 40)],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5 == v3))
  {
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEBUG)) {
      __95__BBRemoteDataProviderConnection_addDataProviderWithSectionID_clientProxy_identity_completion___block_invoke_37_cold_1();
    }
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __95__BBRemoteDataProviderConnection_addDataProviderWithSectionID_clientProxy_identity_completion___block_invoke_38;
    v8[3] = &unk_2642964F8;
    id v9 = v3;
    id v10 = *(id *)(a1 + 48);
    [v7 dataProviderStore:v6 didAddDataProvider:v9 performMigration:0 completion:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __95__BBRemoteDataProviderConnection_addDataProviderWithSectionID_clientProxy_identity_completion___block_invoke_38(uint64_t a1)
{
  [*(id *)(a1 + 32) setServerIsReady:1];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)remoteDataProviderNeedsToWakeClient:(id)a3
{
}

- (void)removeDataProviderWithSectionID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__BBRemoteDataProviderConnection_removeDataProviderWithSectionID___block_invoke;
  v7[3] = &unk_264295E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __66__BBRemoteDataProviderConnection_removeDataProviderWithSectionID___block_invoke(uint64_t a1)
{
  v1 = *(id **)(a1 + 32);
  id v2 = [v1[4] objectForKeyedSubscript:*(void *)(a1 + 40)];
  objc_msgSend(v1, "_queue_removeDataProvider:", v2);
}

- (void)addParentSectionFactory:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    serviceName = self->_serviceName;
    v7 = v5;
    id v8 = [v4 sectionIdentifier];
    int v9 = 138543618;
    id v10 = serviceName;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ adding parent section factory for section %{public}@", (uint8_t *)&v9, 0x16u);
  }
  if (objc_opt_respondsToSelector()) {
    [(BBRemoteDataProviderStoreDelegate *)self->_delegate dataProviderStore:self didAddParentSectionFactory:v4];
  }
}

- (void)clientIsReady:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void))a3;
  if (!self->_clientReady)
  {
    BOOL v5 = BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      serviceName = self->_serviceName;
      int v7 = 138543362;
      id v8 = serviceName;
      _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ told client is ready", (uint8_t *)&v7, 0xCu);
    }
    self->_clientReady = 1;
  }
  v4[2](v4);
}

- (id)dataProviderForSectionID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__8;
  id v16 = __Block_byref_object_dispose__8;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__BBRemoteDataProviderConnection_dataProviderForSectionID___block_invoke;
  block[3] = &unk_264296198;
  id v10 = v4;
  __int16 v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __59__BBRemoteDataProviderConnection_dataProviderForSectionID___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  return MEMORY[0x270F9A758]();
}

- (id)dataProvidersForUniversalSectionID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__8;
  id v16 = __Block_byref_object_dispose__8;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__BBRemoteDataProviderConnection_dataProvidersForUniversalSectionID___block_invoke;
  block[3] = &unk_264296198;
  id v10 = v4;
  __int16 v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __69__BBRemoteDataProviderConnection_dataProvidersForUniversalSectionID___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];
  return MEMORY[0x270F9A758]();
}

- (void)removeDataProvider:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"BBRemoteDataProviderConnection.m" lineNumber:247 description:@"BBRemoteDataProviderConnection was asked to remove a data provider that isn't a BBRemoteDataProvider"];
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__BBRemoteDataProviderConnection_removeDataProvider___block_invoke;
  v9[3] = &unk_264295E50;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(queue, v9);
}

uint64_t __53__BBRemoteDataProviderConnection_removeDataProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeDataProvider:", *(void *)(a1 + 40));
}

- (void)performBlockOnDataProviders:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"BBRemoteDataProviderConnection.m", 254, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__BBRemoteDataProviderConnection_performBlockOnDataProviders___block_invoke;
  block[3] = &unk_2642964F8;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __62__BBRemoteDataProviderConnection_performBlockOnDataProviders___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * v7)];
        [v2 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v2;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_dataProvidersByUniversalSectionID, 0);
  objc_storeStrong((id *)&self->_dataProvidersBySectionID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

void __95__BBRemoteDataProviderConnection_addDataProviderWithSectionID_clientProxy_identity_completion___block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_217675000, v1, OS_LOG_TYPE_ERROR, "%{public}@ already have data provider for section %{public}@; using existing one",
    v2,
    0x16u);
}

void __95__BBRemoteDataProviderConnection_addDataProviderWithSectionID_clientProxy_identity_completion___block_invoke_37_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_217675000, v1, OS_LOG_TYPE_DEBUG, "ADDING REMOTE %{public}@, %{public}@", v2, 0x16u);
}

@end