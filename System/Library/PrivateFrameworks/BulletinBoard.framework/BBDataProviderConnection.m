@interface BBDataProviderConnection
- (BBDataProviderConnection)initWithServiceName:(id)a3 onQueue:(id)a4;
- (NSString)bundleID;
- (NSString)serviceName;
- (id)_addDataProvider:(id)a3 withCompletionHandler:(id)a4;
- (id)addDataProvider:(id)a3;
- (id)addDataProvider:(id)a3 withCompletionHandler:(id)a4;
- (void)_invalidate;
- (void)_queue_setServerProxy:(id)a3;
- (void)addDataProvider:(id)a3 withCompletion:(id)a4;
- (void)addParentSectionInfo:(id)a3 displayName:(id)a4 icon:(id)a5;
- (void)addParentSectionInfo:(id)a3 displayName:(id)a4 icon:(id)a5 universalSectionID:(id)a6;
- (void)addParentSectionInfo:(id)a3 displayName:(id)a4 icon:(id)a5 unversalSectionID:(id)a6;
- (void)dealloc;
- (void)invalidate;
- (void)ping:(id)a3;
- (void)removeDataProviderWithSectionID:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setServerProxy:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation BBDataProviderConnection

- (BBDataProviderConnection)initWithServiceName:(id)a3 onQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"BBDataProviderConnection.m", 122, @"Invalid parameter not satisfying: %@", @"serviceName" object file lineNumber description];
  }
  v9 = [(BBDataProviderConnection *)self init];
  v10 = v9;
  if (v9)
  {
    [(BBDataProviderConnection *)v9 setServiceName:v7];
    if (v8)
    {
      v11 = (OS_dispatch_queue *)v8;
      clientCalloutQueue = v10->_clientCalloutQueue;
      v10->_clientCalloutQueue = v11;
    }
    else
    {
      clientCalloutQueue = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v13 = dispatch_queue_create("BBRemoteDataProvider.clientQueue", clientCalloutQueue);
      v14 = v10->_clientCalloutQueue;
      v10->_clientCalloutQueue = (OS_dispatch_queue *)v13;
    }
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.bulletinboard.BBDataProviderConnection.connectionQueue", 0);
    connectionQueue = v10->_connectionQueue;
    v10->_connectionQueue = (OS_dispatch_queue *)v15;

    dispatch_suspend((dispatch_object_t)v10->_connectionQueue);
    v10->_connected = 0;
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.bulletinboard.BBDataProviderConnection.queue", v17);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v18;

    dispatch_set_target_queue((dispatch_object_t)v10->_connectionQueue, (dispatch_queue_t)v10->_queue);
    uint64_t v20 = +[BBDataProviderConnectionResolver resolverForConnection:v10];
    connectionResolver = v10->_connectionResolver;
    v10->_connectionResolver = (BBDataProviderConnectionResolver *)v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dataProvidersBySectionID = v10->_dataProvidersBySectionID;
    v10->_dataProvidersBySectionID = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    parentFactoriesBySectionID = v10->_parentFactoriesBySectionID;
    v10->_parentFactoriesBySectionID = v24;
  }
  return v10;
}

- (void)dealloc
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__BBDataProviderConnection_dealloc__block_invoke;
  block[3] = &unk_264295E28;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)BBDataProviderConnection;
  [(BBDataProviderConnection *)&v4 dealloc];
}

uint64_t __35__BBDataProviderConnection_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)setServerProxy:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__BBDataProviderConnection_setServerProxy___block_invoke;
  v7[3] = &unk_264295E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __43__BBDataProviderConnection_setServerProxy___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setServerProxy:", *(void *)(a1 + 40));
}

- (void)_queue_setServerProxy:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  v5 = (BBDataProviderConnectionServerProxy *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  val = self;
  serverProxy = self->_serverProxy;
  p_serverProxy = &self->_serverProxy;
  id v6 = serverProxy;
  if (serverProxy != v5)
  {
    v30 = v5;
    BOOL v29 = v6 != 0;
    objc_storeStrong((id *)p_serverProxy, a3);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v9 = val->_dataProvidersBySectionID;
    uint64_t v10 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v53 != v11) {
            objc_enumerationMutation(v9);
          }
          dispatch_queue_t v13 = [(NSMutableDictionary *)val->_dataProvidersBySectionID objectForKey:*(void *)(*((void *)&v52 + 1) + 8 * i)];
          [v13 setServerProxy:0];
        }
        uint64_t v10 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v10);
    }

    if (v30)
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      v14 = [(NSMutableDictionary *)val->_parentFactoriesBySectionID allValues];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v57 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v49;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v49 != v16) {
              objc_enumerationMutation(v14);
            }
            [(BBDataProviderConnectionServerProxy *)*p_serverProxy addParentSectionFactory:*(void *)(*((void *)&v48 + 1) + 8 * j)];
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v57 count:16];
        }
        while (v15);
      }

      objc_initWeak(&location, val);
      objc_initWeak(&from, val->_serverProxy);
      dispatch_queue_t v18 = dispatch_group_create();
      v19 = (void *)[(NSMutableDictionary *)val->_dataProvidersBySectionID copy];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v20 = v19;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v42 objects:v56 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v43;
        do
        {
          for (uint64_t k = 0; k != v21; ++k)
          {
            if (*(void *)v43 != v22) {
              objc_enumerationMutation(v20);
            }
            uint64_t v24 = *(void *)(*((void *)&v42 + 1) + 8 * k);
            dispatch_group_enter(v18);
            v25 = [v20 objectForKey:v24];
            v37[0] = MEMORY[0x263EF8330];
            v37[1] = 3221225472;
            v37[2] = __50__BBDataProviderConnection__queue_setServerProxy___block_invoke;
            v37[3] = &unk_264295EA0;
            objc_copyWeak(&v40, &location);
            objc_copyWeak(&v41, &from);
            v37[4] = v24;
            id v26 = v25;
            id v38 = v26;
            v39 = v18;
            [v26 updateIdentity:v37];

            objc_destroyWeak(&v41);
            objc_destroyWeak(&v40);
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v42 objects:v56 count:16];
        }
        while (v21);
      }

      queue = val->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __50__BBDataProviderConnection__queue_setServerProxy___block_invoke_3;
      block[3] = &unk_264295EC8;
      objc_copyWeak(&v34, &location);
      objc_copyWeak(&v35, &from);
      BOOL v36 = v29;
      id v33 = v20;
      id v28 = v20;
      dispatch_group_notify(v18, queue, block);

      objc_destroyWeak(&v35);
      objc_destroyWeak(&v34);

      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      v5 = v30;
    }
    else
    {
      v5 = 0;
      if (v6) {
        dispatch_suspend((dispatch_object_t)val->_connectionQueue);
      }
    }
  }
}

void __50__BBDataProviderConnection__queue_setServerProxy___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = objc_loadWeakRetained((id *)(a1 + 64));
  id v6 = v5;
  if (WeakRetained && v5 && (id)WeakRetained[4] == v5)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __50__BBDataProviderConnection__queue_setServerProxy___block_invoke_2;
    v9[3] = &unk_264295E78;
    id v10 = v7;
    id v11 = *(id *)(a1 + 48);
    [v6 addDataProviderWithSectionID:v8 clientProxy:v10 identity:v3 completion:v9];
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __50__BBDataProviderConnection__queue_setServerProxy___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setServerProxy:a2];
  id v3 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v3);
}

void __50__BBDataProviderConnection__queue_setServerProxy___block_invoke_3(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_object_t v3 = (dispatch_object_t)objc_loadWeakRetained((id *)(a1 + 48));
  dispatch_object_t v4 = v3;
  if (WeakRetained && v3 && WeakRetained[4] == v3)
  {
    if (!*(unsigned char *)(a1 + 56)) {
      dispatch_resume(WeakRetained[5]);
    }
    *((unsigned char *)WeakRetained + 48) = 1;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(a1 + 32) objectForKey:*(void *)(*((void *)&v13 + 1) + 8 * v9)];
          [v10 dataProviderDidLoad];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    dispatch_object_t v11 = WeakRetained[4];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __50__BBDataProviderConnection__queue_setServerProxy___block_invoke_4;
    v12[3] = &unk_264295E28;
    v12[4] = WeakRetained;
    [v11 clientIsReady:v12];
  }
}

void __50__BBDataProviderConnection__queue_setServerProxy___block_invoke_4(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_object_t v3 = v2;
    dispatch_object_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 72);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: %@ CONNECTED", (uint8_t *)&v7, 0x16u);
  }
}

- (void)addDataProvider:(id)a3 withCompletion:(id)a4
{
  id v4 = [(BBDataProviderConnection *)self _addDataProvider:a3 withCompletionHandler:a4];
}

- (id)addDataProvider:(id)a3
{
  return [(BBDataProviderConnection *)self addDataProvider:a3 withCompletionHandler:0];
}

- (id)addDataProvider:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__BBDataProviderConnection_addDataProvider_withCompletionHandler___block_invoke;
  v10[3] = &unk_264295EF0;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = [(BBDataProviderConnection *)self _addDataProvider:a3 withCompletionHandler:v10];

  return v8;
}

uint64_t __66__BBDataProviderConnection_addDataProvider_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_addDataProvider:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__0;
  uint64_t v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__BBDataProviderConnection__addDataProvider_withCompletionHandler___block_invoke;
  v13[3] = &unk_264295F90;
  id v14 = v6;
  long long v15 = self;
  id v16 = v7;
  v17 = &v18;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v13);
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __67__BBDataProviderConnection__addDataProvider_withCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sectionIdentifier];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 56) objectForKey:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v6 = [[BBDataProviderProxy alloc] initWithDataProvider:*(void *)(a1 + 32) clientReplyQueue:*(void *)(*(void *)(a1 + 40) + 16)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    [*(id *)(*(void *)(a1 + 40) + 56) setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKey:v2];
  }
  objc_initWeak(&location, *(id *)(*(void *)(a1 + 40) + 40));
  objc_initWeak(&from, *(id *)(*(void *)(a1 + 40) + 32));
  id v9 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__BBDataProviderConnection__addDataProvider_withCompletionHandler___block_invoke_2;
  v13[3] = &unk_264295F68;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  id v10 = v2;
  id v14 = v10;
  long long v12 = *(_OWORD *)(a1 + 48);
  id v11 = (id)v12;
  long long v15 = v12;
  [v9 updateIdentity:v13];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __67__BBDataProviderConnection__addDataProvider_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__BBDataProviderConnection__addDataProvider_withCompletionHandler___block_invoke_3;
    block[3] = &unk_264295F40;
    objc_copyWeak(&v12, (id *)(a1 + 64));
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    id v8 = v5;
    uint64_t v11 = v6;
    id v9 = v3;
    id v10 = *(id *)(a1 + 40);
    dispatch_async(WeakRetained, block);

    objc_destroyWeak(&v12);
  }
}

void __67__BBDataProviderConnection__addDataProvider_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(*(void *)(v3 + 8) + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__BBDataProviderConnection__addDataProvider_withCompletionHandler___block_invoke_4;
  v7[3] = &unk_264295F18;
  uint64_t v9 = v3;
  id v8 = *(id *)(a1 + 48);
  [WeakRetained addDataProviderWithSectionID:v5 clientProxy:v4 identity:v6 completion:v7];
}

uint64_t __67__BBDataProviderConnection__addDataProvider_withCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setServerProxy:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) dataProviderDidLoad];
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)addParentSectionInfo:(id)a3 displayName:(id)a4 icon:(id)a5
{
}

- (void)addParentSectionInfo:(id)a3 displayName:(id)a4 icon:(id)a5 unversalSectionID:(id)a6
{
}

- (void)addParentSectionInfo:(id)a3 displayName:(id)a4 icon:(id)a5 universalSectionID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__BBDataProviderConnection_addParentSectionInfo_displayName_icon_universalSectionID___block_invoke;
  block[3] = &unk_264295FB8;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  uint64_t v24 = self;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(connectionQueue, block);
}

void __85__BBDataProviderConnection_addParentSectionInfo_displayName_icon_universalSectionID___block_invoke(uint64_t a1)
{
  id v5 = (id)[*(id *)(a1 + 32) copy];
  [v5 setDisplayName:*(void *)(a1 + 40)];
  [v5 setIcon:*(void *)(a1 + 48)];
  v2 = +[BBParentSectionDataProviderFactory factoryFromSectionInfo:v5];
  [v2 setUniversalSectionIdentifier:*(void *)(a1 + 56)];
  uint64_t v3 = *(void **)(*(void *)(a1 + 64) + 64);
  uint64_t v4 = [v2 sectionIdentifier];
  [v3 setObject:v2 forKey:v4];

  [*(id *)(*(void *)(a1 + 64) + 32) addParentSectionFactory:v2];
}

- (void)removeDataProviderWithSectionID:(id)a3
{
  id v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__BBDataProviderConnection_removeDataProviderWithSectionID___block_invoke;
  v7[3] = &unk_264295E50;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionQueue, v7);
}

void __60__BBDataProviderConnection_removeDataProviderWithSectionID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 56) removeObjectForKey:*(void *)(a1 + 40)];
  [v2 setServerProxy:0];
  [*(id *)(*(void *)(a1 + 32) + 32) removeDataProviderWithSectionID:*(void *)(a1 + 40)];
}

- (void)_invalidate
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_dataProvidersBySectionID allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = [(NSMutableDictionary *)self->_dataProvidersBySectionID objectForKeyedSubscript:v8];
        [v9 setServerProxy:0];
        [(BBDataProviderConnectionServerProxy *)self->_serverProxy removeDataProviderWithSectionID:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_dataProvidersBySectionID removeAllObjects];
  serverProxy = self->_serverProxy;
  self->_serverProxy = 0;

  [(BBDataProviderConnectionResolver *)self->_connectionResolver invalidate];
  self->_connected = 0;
  id v11 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    serviceName = self->_serviceName;
    *(_DWORD *)buf = 138543362;
    id v18 = serviceName;
    _os_log_impl(&dword_217675000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ has been invalidated", buf, 0xCu);
  }
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__BBDataProviderConnection_invalidate__block_invoke;
  block[3] = &unk_264295E28;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __38__BBDataProviderConnection_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)ping:(id)a3
{
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
  objc_storeStrong((id *)&self->_parentFactoriesBySectionID, 0);
  objc_storeStrong((id *)&self->_dataProvidersBySectionID, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_serverProxy, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientCalloutQueue, 0);
  objc_storeStrong((id *)&self->_connectionResolver, 0);
}

@end