@interface ISIconManager
+ (ISIconManager)sharedInstance;
+ (id)serviceName;
- (ISIconCache)iconCache;
- (NSHashTable)iconRegistry;
- (NSHashTable)observers;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)internalQueue;
- (id)_init;
- (id)findOrRegisterIcon:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setConnection:(id)a3;
- (void)setIconCache:(id)a3;
- (void)setIconRegistry:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation ISIconManager

void __36__ISIconManager_findOrRegisterIcon___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) member:*(void *)(a1 + 40)];
  uint64_t v3 = a1 + 48;
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v2;

  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void *)(v6 + 40);
  v7 = (id *)(v6 + 40);
  if (!v8)
  {
    objc_storeStrong(v7, *(id *)(a1 + 40));
    [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
    v9 = _ISDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __36__ISIconManager_findOrRegisterIcon___block_invoke_cold_1(v3, v9);
    }
  }
}

+ (ISIconManager)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_27);
  }
  uint64_t v2 = (void *)sharedInstance_sharedInstance_4;
  return (ISIconManager *)v2;
}

- (ISIconCache)iconCache
{
  return (ISIconCache *)objc_getProperty(self, a2, 16, 1);
}

- (id)findOrRegisterIcon:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__ISIconManager_findOrRegisterIcon___block_invoke;
  block[3] = &unk_1E5F093E0;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __22__ISIconManager__init__block_invoke_12(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    v5 = [[ISIconCache alloc] initWithConfiguration:v3];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setIconCache:v5];
  }
}

- (void)setIconCache:(id)a3
{
}

uint64_t __31__ISIconManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_4 = [[ISIconManager alloc] _init];
  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v29.receiver = self;
  v29.super_class = (Class)ISIconManager;
  uint64_t v2 = [(ISIconManager *)&v29 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    iconRegistry = v2->_iconRegistry;
    v2->_iconRegistry = (NSHashTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    v2->_lock._os_unfair_lock_opaque = 0;
    id v7 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v8 = +[ISIconManager serviceName];
    uint64_t v9 = [v7 initWithMachServiceName:v8 options:0];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v9;

    v11 = objc_msgSend(MEMORY[0x1E4F29280], "_IS_iconCacheServiceInterface");
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v11];
    uint64_t v12 = v2->_connection;
    id v13 = +[ISIconManager serviceName];
    uint64_t v14 = (const char *)[v13 UTF8String];
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = dispatch_get_global_queue(21, 2uLL);
    dispatch_queue_t v17 = dispatch_queue_create_with_target_V2(v14, v15, v16);
    [(NSXPCConnection *)v12 _setQueue:v17];

    [(NSXPCConnection *)v2->_connection resume];
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("Icon manager internal queue", v18);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v19;

    objc_initWeak(&location, v2);
    v21 = v2->_connection;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __22__ISIconManager__init__block_invoke;
    v26[3] = &unk_1E5F09390;
    objc_copyWeak(&v27, &location);
    v22 = [(NSXPCConnection *)v21 synchronousRemoteObjectProxyWithErrorHandler:v26];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __22__ISIconManager__init__block_invoke_12;
    v24[3] = &unk_1E5F093B8;
    objc_copyWeak(&v25, &location);
    [v22 fetchCacheConfigurationWithReply:v24];
    objc_destroyWeak(&v25);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return v2;
}

+ (id)serviceName
{
  uint64_t v2 = +[ISDefaults sharedInstance];
  uint64_t v3 = [v2 serviceName];

  return v3;
}

void __22__ISIconManager__init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _ISDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __22__ISIconManager__init__block_invoke_cold_1((uint64_t)v3, v4);
  }

  uint64_t v5 = +[ISIconCache defaultIconCache];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIconCache:v5];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ISIconManager;
  [(ISIconManager *)&v2 dealloc];
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (NSHashTable)iconRegistry
{
  return (NSHashTable *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIconRegistry:(id)a3
{
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObservers:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInternalQueue:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_iconRegistry, 0);
  objc_storeStrong((id *)&self->_iconCache, 0);
}

void __22__ISIconManager__init__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1AE771000, a2, OS_LOG_TYPE_FAULT, "Failed to get the icon cache path with error: %@", (uint8_t *)&v2, 0xCu);
}

void __36__ISIconManager_findOrRegisterIcon___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1AE771000, a2, OS_LOG_TYPE_DEBUG, "Registered %@", (uint8_t *)&v3, 0xCu);
}

@end