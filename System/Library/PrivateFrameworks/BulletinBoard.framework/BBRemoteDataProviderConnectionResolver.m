@interface BBRemoteDataProviderConnectionResolver
+ (id)resolverWithDelegate:(id)a3;
+ (id)xpcInterface;
- (BBRemoteDataProviderConnectionResolver)initWithDelegate:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)debugDescription;
- (id)dataProviderForSectionID:(id)a3;
- (id)dataProvidersForUniversalSectionID:(id)a3;
- (id)debugDescriptionWithChildren:(unint64_t)a3;
- (void)_registerForPublicationNotification;
- (void)_registerServiceName:(id)a3 appBundleID:(id)a4 completion:(id)a5;
- (void)dataProviderStore:(id)a3 didAddDataProvider:(id)a4 performMigration:(BOOL)a5 completion:(id)a6;
- (void)dataProviderStore:(id)a3 didAddParentSectionFactory:(id)a4;
- (void)dataProviderStore:(id)a3 didRemoveDataProvider:(id)a4;
- (void)dealloc;
- (void)performBlockOnDataProviders:(id)a3;
- (void)registerServiceName:(id)a3 appBundleID:(id)a4 completion:(id)a5;
- (void)remoteDataProviderNeedsToWakeClient:(id)a3;
- (void)removeDataProvider:(id)a3;
- (void)wakeService:(id)a3 bundleID:(id)a4;
@end

@implementation BBRemoteDataProviderConnectionResolver

+ (id)resolverWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDelegate:v3];

  return v4;
}

- (BBRemoteDataProviderConnectionResolver)initWithDelegate:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BBRemoteDataProviderConnectionResolver;
  v6 = [(BBRemoteDataProviderConnectionResolver *)&v24 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dataProviderConnectionsByService = v7->_dataProviderConnectionsByService;
    v7->_dataProviderConnectionsByService = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dataProviderConnectionsBySectionID = v7->_dataProviderConnectionsBySectionID;
    v7->_dataProviderConnectionsBySectionID = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dataProviderConnectionsByUniversalSectionID = v7->_dataProviderConnectionsByUniversalSectionID;
    v7->_dataProviderConnectionsByUniversalSectionID = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    xpcConnectionsByService = v7->_xpcConnectionsByService;
    v7->_xpcConnectionsByService = v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.bulletinboard.BBRemoteDataProviderConnectionResolver", v16);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v17;

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.bulletinboard.BBRemoteDataProviderConnectionResolver.registerQueue", 0);
    registerQueue = v7->_registerQueue;
    v7->_registerQueue = (OS_dispatch_queue *)v19;

    dispatch_set_target_queue((dispatch_object_t)v7->_registerQueue, (dispatch_queue_t)v7->_queue);
    dispatch_suspend((dispatch_object_t)v7->_registerQueue);
    uint64_t v21 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.bulletinboard.dataproviderconnection"];
    listener = v7->_listener;
    v7->_listener = (NSXPCListener *)v21;

    [(NSXPCListener *)v7->_listener setDelegate:v7];
    [(NSXPCListener *)v7->_listener resume];
    [(BBRemoteDataProviderConnectionResolver *)v7 _registerForPublicationNotification];
  }

  return v7;
}

- (void)_registerForPublicationNotification
{
  queue = self->_queue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __77__BBRemoteDataProviderConnectionResolver__registerForPublicationNotification__block_invoke;
  handler[3] = &unk_264296A70;
  handler[4] = self;
  notify_register_dispatch(BBServerListeningForConnectionsKey, &self->_listeningToken, queue, handler);
}

void __77__BBRemoteDataProviderConnectionResolver__registerForPublicationNotification__block_invoke(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  if (state64 == 1) {
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
  }
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  notify_cancel(self->_listeningToken);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = self->_xpcConnectionsByService;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [(NSMutableDictionary *)self->_xpcConnectionsByService objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
        [v8 invalidate];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(NSXPCListener *)self->_listener invalidate];
  v9.receiver = self;
  v9.super_class = (Class)BBRemoteDataProviderConnectionResolver;
  [(BBRemoteDataProviderConnectionResolver *)&v9 dealloc];
}

- (id)debugDescriptionWithChildren:(unint64_t)a3
{
  uint64_t v5 = [MEMORY[0x263F089D8] stringWithString:&stru_26C7952A0];
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
  uint64_t v7 = (void *)MEMORY[0x263F089D8];
  v8 = (objc_class *)objc_opt_class();
  objc_super v9 = NSStringFromClass(v8);
  long long v10 = [v7 stringWithFormat:@"%@<%@: %p>", v5, v9, self];

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__BBRemoteDataProviderConnectionResolver_debugDescriptionWithChildren___block_invoke;
  block[3] = &unk_2642962B0;
  block[4] = self;
  id v12 = v10;
  id v17 = v12;
  unint64_t v18 = a3;
  dispatch_sync(queue, block);
  long long v13 = v17;
  id v14 = v12;

  return v14;
}

void __71__BBRemoteDataProviderConnectionResolver_debugDescriptionWithChildren___block_invoke(void *a1)
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
          uint64_t v7 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * v6)];
          v8 = (void *)a1[5];
          objc_super v9 = [v7 debugDescriptionWithChildren:a1[6] + 2];
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
  return (NSString *)[(BBRemoteDataProviderConnectionResolver *)self debugDescriptionWithChildren:0];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v6 = (NSXPCListener *)a3;
  id v7 = a4;
  v8 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v9 = v8;
    long long v10 = (objc_class *)objc_opt_class();
    long long v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138543618;
    v25 = v11;
    __int16 v26 = 2114;
    id v27 = v7;
    _os_log_impl(&dword_217675000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ received connection request from %{public}@", buf, 0x16u);
  }
  if (self->_listener == v6)
  {
    long long v13 = [v7 valueForEntitlement:@"com.apple.bulletinboard.dataprovider"];
    int v14 = [v13 BOOLValue];

    if (v14)
    {
      queue = self->_queue;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __77__BBRemoteDataProviderConnectionResolver_listener_shouldAcceptNewConnection___block_invoke;
      v21[3] = &unk_264295E50;
      id v22 = v7;
      v23 = self;
      dispatch_async(queue, v21);

      BOOL v12 = 1;
      goto LABEL_9;
    }
    v16 = (void *)BBLogConnection;
    BOOL v12 = 0;
    if (!os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    id v17 = v16;
    unint64_t v18 = (objc_class *)objc_opt_class();
    dispatch_queue_t v19 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138543618;
    v25 = v19;
    __int16 v26 = 2114;
    id v27 = v7;
    _os_log_impl(&dword_217675000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelling incoming data provider connection because it lacks proper entitlement: %{public}@", buf, 0x16u);
  }
  BOOL v12 = 0;
LABEL_9:

  return v12;
}

uint64_t __77__BBRemoteDataProviderConnectionResolver_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = BBDataProviderConnectionCheckinServerInterface();
  [v2 setExportedInterface:v3];

  [*(id *)(a1 + 32) setExportedObject:*(void *)(a1 + 40)];
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 resume];
}

- (void)registerServiceName:(id)a3 appBundleID:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    [(BBRemoteDataProviderConnectionResolver *)self _registerServiceName:v8 appBundleID:v9 completion:v10];
  }
  else
  {
    long long v11 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = v11;
      long long v13 = (objc_class *)objc_opt_class();
      int v14 = NSStringFromClass(v13);
      int v15 = 138543618;
      v16 = v14;
      __int16 v17 = 2114;
      id v18 = v9;
      _os_log_impl(&dword_217675000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to register for app bundle identifier %{public}@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)_registerServiceName:(id)a3 appBundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [MEMORY[0x263F08D68] currentConnection];
  registerQueue = self->_registerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__BBRemoteDataProviderConnectionResolver__registerServiceName_appBundleID_completion___block_invoke;
  block[3] = &unk_2642965E8;
  block[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v11;
  id v21 = v10;
  id v13 = v10;
  id v14 = v11;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(registerQueue, block);
}

void __86__BBRemoteDataProviderConnectionResolver__registerServiceName_appBundleID_completion___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = (void *)BBLogConnection;
  BOOL v4 = os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = v3;
      uint64_t v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      __int16 v26 = v7;
      __int16 v27 = 2114;
      uint64_t v28 = v8;
      _os_log_impl(&dword_217675000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received checkin from %{public}@ [KNOWN]", buf, 0x16u);
    }
  }
  else
  {
    if (v4)
    {
      id v9 = v3;
      id v10 = (objc_class *)objc_opt_class();
      long long v11 = NSStringFromClass(v10);
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      __int16 v26 = v11;
      __int16 v27 = 2114;
      uint64_t v28 = v12;
      _os_log_impl(&dword_217675000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ received checkin from %{public}@ [NEW]", buf, 0x16u);
    }
    id v2 = [[BBRemoteDataProviderConnection alloc] initWithServiceName:*(void *)(a1 + 40) bundleID:*(void *)(a1 + 48) delegate:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  objc_initWeak(&location, *(id *)(a1 + 56));
  objc_initWeak(&from, v2);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __86__BBRemoteDataProviderConnectionResolver__registerServiceName_appBundleID_completion___block_invoke_20;
  v18[3] = &unk_264296AC0;
  id v19 = *(id *)(a1 + 40);
  objc_copyWeak(&v20, (id *)buf);
  objc_copyWeak(&v21, &location);
  objc_copyWeak(&v22, &from);
  id v13 = (void *)MEMORY[0x21D44A270](v18);
  [*(id *)(a1 + 56) setInvalidationHandler:v13];
  [*(id *)(a1 + 56) setInterruptionHandler:v13];
  id v14 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v14 invalidate];
  [*(id *)(*(void *)(a1 + 32) + 56) setObject:*(void *)(a1 + 56) forKeyedSubscript:*(void *)(a1 + 40)];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __86__BBRemoteDataProviderConnectionResolver__registerServiceName_appBundleID_completion___block_invoke_2;
  v15[3] = &unk_264296AE8;
  id v16 = *(id *)(a1 + 64);
  objc_copyWeak(&v17, &from);
  [(BBRemoteDataProviderConnection *)v2 setConnected:1 completion:v15];
  objc_destroyWeak(&v17);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

void __86__BBRemoteDataProviderConnectionResolver__registerServiceName_appBundleID_completion___block_invoke_20(id *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    *(_DWORD *)buf = 138543362;
    id v12 = v3;
    _os_log_impl(&dword_217675000, v2, OS_LOG_TYPE_DEFAULT, "Remote data provider XPC connection for service '%{public}@' has been interrupted or invalidated", buf, 0xCu);
  }
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 5);
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[2];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __86__BBRemoteDataProviderConnectionResolver__registerServiceName_appBundleID_completion___block_invoke_21;
    v7[3] = &unk_264296A98;
    objc_copyWeak(&v9, a1 + 6);
    v7[4] = v5;
    id v8 = a1[4];
    objc_copyWeak(&v10, a1 + 7);
    dispatch_async(v6, v7);
    objc_destroyWeak(&v10);

    objc_destroyWeak(&v9);
  }
}

void __86__BBRemoteDataProviderConnectionResolver__registerServiceName_appBundleID_completion___block_invoke_21(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:*(void *)(a1 + 40)];

    id WeakRetained = v5;
    if (v5 == v3)
    {
      id v4 = objc_loadWeakRetained((id *)(a1 + 56));
      [v4 setConnected:0 completion:0];

      [*(id *)(*(void *)(a1 + 32) + 56) removeObjectForKey:*(void *)(a1 + 40)];
      id WeakRetained = v5;
    }
  }
}

void __86__BBRemoteDataProviderConnectionResolver__registerServiceName_appBundleID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);
}

+ (id)xpcInterface
{
  if (xpcInterface_onceToken != -1) {
    dispatch_once(&xpcInterface_onceToken, &__block_literal_global_6);
  }
  id v2 = (void *)xpcInterface___interface;
  return v2;
}

uint64_t __54__BBRemoteDataProviderConnectionResolver_xpcInterface__block_invoke()
{
  xpcInterface___interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C7BABC8];
  return MEMORY[0x270F9A758]();
}

- (void)remoteDataProviderNeedsToWakeClient:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = [a3 sectionIdentifier];
  id v5 = [(NSMutableDictionary *)self->_dataProviderConnectionsBySectionID objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 serviceName];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    uint64_t v13 = [v5 serviceName];
    id v14 = [v5 bundleID];
    [(BBRemoteDataProviderConnectionResolver *)self wakeService:v13 bundleID:v14];

LABEL_13:
    goto LABEL_14;
  }
  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    id v10 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = v10;
      long long v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      int v15 = 138543618;
      id v16 = v12;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl(&dword_217675000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ unable to wake client with no serviceName for sectionID %{public}@", (uint8_t *)&v15, 0x16u);

      goto LABEL_13;
    }
  }
LABEL_14:
}

- (void)wakeService:(id)a3 bundleID:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v33 = [MEMORY[0x263F08690] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"BBRemoteDataProviderConnectionResolver.m", 213, @"Invalid parameter not satisfying: %@", @"serviceName" object file lineNumber description];
  }
  BOOL v9 = dispatch_group_create();
  id v10 = v9;
  uint64_t v42 = 0;
  v43 = (id *)&v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__5;
  v46 = __Block_byref_object_dispose__5;
  id v47 = 0;
  if (v8)
  {
    dispatch_group_enter(v9);
    long long v11 = (void *)MEMORY[0x263F64570];
    id v12 = [MEMORY[0x263F645D8] predicateMatchingBundleIdentifier:v8];
    uint64_t v13 = v43;
    id obj = 0;
    id v14 = [v11 handleForPredicate:v12 error:&obj];
    objc_storeStrong(v13 + 5, obj);

    if (v43[5])
    {
      int v15 = (id)BBLogConnection;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (objc_class *)objc_opt_class();
        __int16 v17 = NSStringFromClass(v16);
        id v18 = v43[5];
        *(_DWORD *)buf = 138543874;
        id v49 = v17;
        __int16 v50 = 2114;
        id v51 = v8;
        __int16 v52 = 2114;
        id v53 = v18;
        _os_log_impl(&dword_217675000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to get process handle for %{public}@; %{public}@",
          buf,
          0x20u);
      }
      id v19 = v43[5];
      v43[5] = 0;

      dispatch_group_leave(v10);
    }
    else
    {
      id v20 = [v14 currentState];
      id v21 = [v20 process];

      if (!v21 || [v21 pid] == -1)
      {
        __int16 v26 = NSDictionary;
        __int16 v27 = [NSNumber numberWithBool:1];
        uint64_t v28 = [v26 dictionaryWithObject:v27 forKey:*MEMORY[0x263F3F598]];

        uint64_t v29 = [MEMORY[0x263F3F778] optionsWithDictionary:v28];
        v30 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __63__BBRemoteDataProviderConnectionResolver_wakeService_bundleID___block_invoke;
        v38[3] = &unk_264296B10;
        v40 = &v42;
        v39 = v10;
        [v30 openApplication:v8 withOptions:v29 completion:v38];
      }
      else
      {
        id v22 = (id)BBLogConnection;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          id v24 = (id)objc_claimAutoreleasedReturnValue();
          int v25 = [v21 pid];
          *(_DWORD *)buf = 138543874;
          id v49 = v24;
          __int16 v50 = 2114;
          id v51 = v8;
          __int16 v52 = 1024;
          LODWORD(v53) = v25;
          _os_log_impl(&dword_217675000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ will not launch %{public}@ because it is already running with a pid of %d", buf, 0x1Cu);
        }
        dispatch_group_leave(v10);
      }
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__BBRemoteDataProviderConnectionResolver_wakeService_bundleID___block_invoke_42;
  block[3] = &unk_264296198;
  v36 = self;
  v37 = &v42;
  id v35 = v7;
  id v32 = v7;
  dispatch_group_notify(v10, queue, block);

  _Block_object_dispose(&v42, 8);
}

void __63__BBRemoteDataProviderConnectionResolver_wakeService_bundleID___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__BBRemoteDataProviderConnectionResolver_wakeService_bundleID___block_invoke_42(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v2 = (void *)BBLogConnection;
    if (!os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    id v3 = v2;
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    uint64_t v15 = v6;
    _os_log_impl(&dword_217675000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to wake %{public}@", buf, 0x16u);
  }
  else
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:*(void *)(a1 + 32) options:0];
    id v8 = [(id)objc_opt_class() xpcInterface];
    [v7 setRemoteObjectInterface:v8];

    [v7 resume];
    BOOL v9 = [v7 remoteObjectProxy];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __63__BBRemoteDataProviderConnectionResolver_wakeService_bundleID___block_invoke_2;
    v10[3] = &unk_264295E28;
    id v11 = v7;
    id v3 = v7;
    [v9 ping:v10];
  }
}

uint64_t __63__BBRemoteDataProviderConnectionResolver_wakeService_bundleID___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (id)dataProviderForSectionID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__5;
  uint64_t v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__BBRemoteDataProviderConnectionResolver_dataProviderForSectionID___block_invoke;
  block[3] = &unk_264296B38;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __67__BBRemoteDataProviderConnectionResolver_dataProviderForSectionID___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];
  uint64_t v2 = [v5 dataProviderForSectionID:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)dataProvidersForUniversalSectionID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__BBRemoteDataProviderConnectionResolver_dataProvidersForUniversalSectionID___block_invoke;
  block[3] = &unk_264296418;
  void block[4] = self;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  dispatch_sync(queue, block);
  BOOL v9 = v14;
  id v10 = v7;

  return v10;
}

void __77__BBRemoteDataProviderConnectionResolver_dataProvidersForUniversalSectionID___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:*(void *)(a1 + 40)];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v8 + 1) + 8 * v6) dataProvidersForUniversalSectionID:*(void *)(a1 + 40)];
        [*(id *)(a1 + 48) unionSet:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)removeDataProvider:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__BBRemoteDataProviderConnectionResolver_removeDataProvider___block_invoke;
  v7[3] = &unk_264295E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __61__BBRemoteDataProviderConnectionResolver_removeDataProvider___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = [*(id *)(a1 + 40) sectionIdentifier];
  id v4 = [v2 objectForKeyedSubscript:v3];

  [v4 removeDataProvider:*(void *)(a1 + 40)];
}

- (void)performBlockOnDataProviders:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"BBRemoteDataProviderConnectionResolver.m", 304, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__BBRemoteDataProviderConnectionResolver_performBlockOnDataProviders___block_invoke;
  block[3] = &unk_2642964F8;
  void block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __70__BBRemoteDataProviderConnectionResolver_performBlockOnDataProviders___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(void *)(*((void *)&v8 + 1) + 8 * v6), (void)v8);
        [v7 performBlockOnDataProviders:*(void *)(a1 + 40)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)dataProviderStore:(id)a3 didAddDataProvider:(id)a4 performMigration:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __107__BBRemoteDataProviderConnectionResolver_dataProviderStore_didAddDataProvider_performMigration_completion___block_invoke;
  block[3] = &unk_264296688;
  void block[4] = self;
  id v18 = v11;
  BOOL v21 = a5;
  id v19 = v10;
  id v20 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(queue, block);
}

void __107__BBRemoteDataProviderConnectionResolver_dataProviderStore_didAddDataProvider_performMigration_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v4 = [*(id *)(a1 + 40) sectionIdentifier];
  [v3 setObject:v2 forKeyedSubscript:v4];

  uint64_t v5 = [*(id *)(a1 + 40) universalSectionIdentifier];
  id v7 = (id)v5;
  if (v5)
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:v5];
    if (!v6)
    {
      id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      [*(id *)(*(void *)(a1 + 32) + 48) setObject:v6 forKey:v7];
    }
    [v6 addObject:*(void *)(a1 + 48)];
  }
  [*(id *)(*(void *)(a1 + 32) + 64) dataProviderStore:*(void *)(a1 + 32) didAddDataProvider:*(void *)(a1 + 40) performMigration:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 56)];
}

- (void)dataProviderStore:(id)a3 didRemoveDataProvider:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __82__BBRemoteDataProviderConnectionResolver_dataProviderStore_didRemoveDataProvider___block_invoke;
  v8[3] = &unk_264295E50;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __82__BBRemoteDataProviderConnectionResolver_dataProviderStore_didRemoveDataProvider___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = [*(id *)(a1 + 40) sectionIdentifier];
  id v8 = [v2 objectForKey:v3];

  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 40);
  id v5 = [*(id *)(a1 + 40) sectionIdentifier];
  [v4 removeObjectForKey:v5];

  id v6 = [*(id *)(a1 + 40) universalSectionIdentifier];
  if (v6)
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:v6];
    [v7 removeObject:v8];
    if (![v7 count]) {
      [*(id *)(*(void *)(a1 + 32) + 48) removeObjectForKey:v6];
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 64) dataProviderStore:*(void *)(a1 + 32) didRemoveDataProvider:*(void *)(a1 + 40)];
}

- (void)dataProviderStore:(id)a3 didAddParentSectionFactory:(id)a4
{
  id v5 = a4;
  if (objc_opt_respondsToSelector()) {
    [(BBDataProviderStoreDelegate *)self->_delegate dataProviderStore:self didAddParentSectionFactory:v5];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_xpcConnectionsByService, 0);
  objc_storeStrong((id *)&self->_dataProviderConnectionsByUniversalSectionID, 0);
  objc_storeStrong((id *)&self->_dataProviderConnectionsBySectionID, 0);
  objc_storeStrong((id *)&self->_dataProviderConnectionsByService, 0);
  objc_storeStrong((id *)&self->_registerQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end