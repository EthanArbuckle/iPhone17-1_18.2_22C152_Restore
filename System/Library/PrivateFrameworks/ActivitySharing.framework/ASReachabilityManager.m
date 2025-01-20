@interface ASReachabilityManager
+ (id)sharedInstanceForServiceIdentifier:(id)a3;
- (ASReachabilityManager)init;
- (NSString)serviceIdentifier;
- (id)_initWithServiceIdentifier:(id)a3;
- (int64_t)numberOfScheduledQueries;
- (void)_addDestinationsToQuery:(id)a3 updateHandler:(id)a4 completionHandler:(id)a5;
- (void)queryDestinations:(id)a3 updateHandler:(id)a4 completionHandler:(id)a5;
@end

@implementation ASReachabilityManager

uint64_t __60__ASReachabilityManager_sharedInstanceForServiceIdentifier___block_invoke()
{
  sharedInstanceForServiceIdentifier__sharedInstanceByServiceIdentifier = [MEMORY[0x263EFF9A0] dictionary];

  return MEMORY[0x270F9A758]();
}

+ (id)sharedInstanceForServiceIdentifier:(id)a3
{
  id v3 = a3;
  if (sharedInstanceForServiceIdentifier__once != -1) {
    dispatch_once(&sharedInstanceForServiceIdentifier__once, &__block_literal_global_0);
  }
  id v4 = [(id)sharedInstanceForServiceIdentifier__sharedInstanceByServiceIdentifier objectForKey:v3];
  if (!v4)
  {
    id v4 = [[ASReachabilityManager alloc] _initWithServiceIdentifier:v3];
    [(id)sharedInstanceForServiceIdentifier__sharedInstanceByServiceIdentifier setObject:v4 forKey:v3];
  }

  return v4;
}

- (id)_initWithServiceIdentifier:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASReachabilityManager;
  v6 = [(ASReachabilityManager *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceIdentifier, a3);
    v8 = objc_alloc_init(ASReachabilityStatusCache);
    statusCache = v7->_statusCache;
    v7->_statusCache = v8;

    v10 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    queryOperationQueue = v7->_queryOperationQueue;
    v7->_queryOperationQueue = v10;

    [(NSOperationQueue *)v7->_queryOperationQueue setMaxConcurrentOperationCount:1];
    v12 = HKCreateSerialDispatchQueue();
    [(NSOperationQueue *)v7->_queryOperationQueue setUnderlyingQueue:v12];
  }
  return v7;
}

- (ASReachabilityManager)init
{
  return 0;
}

- (void)_addDestinationsToQuery:(id)a3 updateHandler:(id)a4 completionHandler:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (void (**)(id, void *))a4;
  id v10 = a5;
  ASLoggingInitialize();
  v11 = (void *)ASLogDefault;
  if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    *(_DWORD *)buf = 134217984;
    uint64_t v39 = [v8 count];
    _os_log_impl(&dword_21EC60000, v12, OS_LOG_TYPE_DEFAULT, "Reachability: Request for %lu destinations", buf, 0xCu);
  }
  v13 = [(ASReachabilityStatusCache *)self->_statusCache statusesForDestinations:v8];
  if ([v13 count])
  {
    ASLoggingInitialize();
    objc_super v14 = (void *)ASLogDefault;
    if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      uint64_t v16 = [v13 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v39 = v16;
      _os_log_impl(&dword_21EC60000, v15, OS_LOG_TYPE_DEFAULT, "Reachability: Hit %lu destinations in cache first pass", buf, 0xCu);
    }
    v9[2](v9, v13);
  }
  v17 = (void *)MEMORY[0x263F08A98];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __81__ASReachabilityManager__addDestinationsToQuery_updateHandler_completionHandler___block_invoke;
  v35[3] = &unk_2644E81A0;
  id v18 = v13;
  id v36 = v18;
  v19 = [v17 predicateWithBlock:v35];
  v20 = [v8 filteredSetUsingPredicate:v19];

  if ([v20 count])
  {
    v21 = objc_alloc_init(ASReachabilityQueryOperation);
    [(ASReachabilityQueryOperation *)v21 setUpdateHandler:v9];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __81__ASReachabilityManager__addDestinationsToQuery_updateHandler_completionHandler___block_invoke_2;
    v32[3] = &unk_2644E81C8;
    id v33 = v18;
    id v27 = v10;
    id v34 = v10;
    [(ASReachabilityQueryOperation *)v21 setCompletionHandler:v32];
    [(ASReachabilityQueryOperation *)v21 setDestinations:v20];
    [(ASReachabilityQueryOperation *)v21 setStatusCache:self->_statusCache];
    [(ASReachabilityQueryOperation *)v21 setServiceIdentifier:self->_serviceIdentifier];
    [(ASReachabilityQueryOperation *)v21 setQueuePriority:8];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v22 = [(NSOperationQueue *)self->_queryOperationQueue operations];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v29;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v29 != v25) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * v26++) setQueuePriority:-4];
        }
        while (v24 != v26);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v24);
    }

    [(NSOperationQueue *)self->_queryOperationQueue addOperation:v21];
    id v10 = v27;
  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v18);
  }
}

BOOL __81__ASReachabilityManager__addDestinationsToQuery_updateHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKey:a2];
  BOOL v3 = v2 == 0;

  return v3;
}

void __81__ASReachabilityManager__addDestinationsToQuery_updateHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (id)[v3 mutableCopy];
  [v5 addEntriesFromDictionary:v4];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)queryDestinations:(id)a3 updateHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v12 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __75__ASReachabilityManager_queryDestinations_updateHandler_completionHandler___block_invoke;
  v13[3] = &unk_2644E8218;
  id v14 = v8;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__ASReachabilityManager_queryDestinations_updateHandler_completionHandler___block_invoke_3;
  v11[3] = &unk_2644E8218;
  id v9 = v12;
  id v10 = v8;
  [(ASReachabilityManager *)self _addDestinationsToQuery:a3 updateHandler:v13 completionHandler:v11];
}

void __75__ASReachabilityManager_queryDestinations_updateHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __75__ASReachabilityManager_queryDestinations_updateHandler_completionHandler___block_invoke_2;
    v4[3] = &unk_2644E81F0;
    id v6 = *(id *)(a1 + 32);
    id v5 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v4);
  }
}

uint64_t __75__ASReachabilityManager_queryDestinations_updateHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __75__ASReachabilityManager_queryDestinations_updateHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __75__ASReachabilityManager_queryDestinations_updateHandler_completionHandler___block_invoke_4;
    v4[3] = &unk_2644E81F0;
    id v6 = *(id *)(a1 + 32);
    id v5 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v4);
  }
}

uint64_t __75__ASReachabilityManager_queryDestinations_updateHandler_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (int64_t)numberOfScheduledQueries
{
  return [(NSOperationQueue *)self->_queryOperationQueue operationCount];
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_queryOperationQueue, 0);

  objc_storeStrong((id *)&self->_statusCache, 0);
}

@end