@interface LSSettingsStore
+ (id)sharedInstance;
- (BOOL)resetUserElectionsWithError:(id *)a3;
- (BOOL)setUserElection:(unsigned __int8)a3 forExtensionKey:(id)a4 error:(id *)a5;
- (NSMutableSet)observerSet;
- (OS_dispatch_queue)observerQueue;
- (id)_init;
- (id)addChangeObserver:(id)a3;
- (id)settingsStoreConfigurationForProcessWithAuditToken:(id *)a3;
- (unsigned)userElectionForExtensionKey:(id)a3;
- (void)removeChangeObserver:(id)a3;
@end

@implementation LSSettingsStore

- (id)addChangeObserver:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  uint64_t v6 = MEMORY[0x18530F950](v4);
  v7 = (void *)v5[1];
  v5[1] = v6;

  SharedInstance = (void *)__LSDefaultsGetSharedInstance();
  v9 = [SharedInstance settingsUpdateNotificationNameForUserID:geteuid()];
  observerQueue = self->_observerQueue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __37__LSSettingsStore_addChangeObserver___block_invoke;
  v20[3] = &unk_1E522DCE8;
  id v11 = v9;
  id v21 = v11;
  v12 = v5;
  v22 = v12;
  LaunchServices::notifyd::NotifyToken::RegisterDispatch(v11, observerQueue, v20, &v23);
  LaunchServices::notifyd::NotifyToken::operator=(v12 + 4, (atomic_uint *)&v23);
  LaunchServices::notifyd::NotifyToken::~NotifyToken((LaunchServices::notifyd::NotifyToken *)&v23);
  v13 = self->_observerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__LSSettingsStore_addChangeObserver___block_invoke_40;
  block[3] = &unk_1E522DCE8;
  block[4] = self;
  v14 = v12;
  v19 = v14;
  dispatch_sync(v13, block);
  v15 = v19;
  v16 = v14;

  return v16;
}

+ (id)sharedInstance
{
  if (+[LSSettingsStore sharedInstance]::onceToken != -1) {
    dispatch_once(&+[LSSettingsStore sharedInstance]::onceToken, &__block_literal_global_44);
  }
  v2 = (void *)+[LSSettingsStore sharedInstance]::store;

  return v2;
}

uint64_t __37__LSSettingsStore_addChangeObserver___block_invoke_40(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

void __33__LSSettingsStore_sharedInstance__block_invoke()
{
  int v0 = [(id)__LSDefaultsGetSharedInstance() isServer];
  v1 = off_1E522B438;
  if (!v0) {
    v1 = off_1E522B3E8;
  }
  id v2 = objc_alloc_init(*v1);
  v3 = (void *)+[LSSettingsStore sharedInstance]::store;
  +[LSSettingsStore sharedInstance]::store = (uint64_t)v2;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)LSSettingsStore;
  id v2 = [(LSSettingsStore *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.launchservices._LSSettingsInProcessStore.notification", v3);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    observerSet = v2->_observerSet;
    v2->_observerSet = (NSMutableSet *)v6;
  }
  return v2;
}

- (BOOL)setUserElection:(unsigned __int8)a3 forExtensionKey:(id)a4 error:(id *)a5
{
  if (a5)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[LSSettingsStore setUserElection:forExtensionKey:error:]", 204, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)resetUserElectionsWithError:(id *)a3
{
  if (a3)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -54, (uint64_t)"-[LSSettingsStore resetUserElectionsWithError:]", 211, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

uint64_t __37__LSSettingsStore_addChangeObserver___block_invoke(uint64_t a1)
{
  id v2 = _LSDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __37__LSSettingsStore_addChangeObserver___block_invoke_cold_1();
  }

  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 40) + 8) + 16))();
}

- (void)removeChangeObserver:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"LSSettingsStore.mm", 238, @"Unexpected class %@", v10 object file lineNumber description];
  }
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__LSSettingsStore_removeChangeObserver___block_invoke;
  block[3] = &unk_1E522D3E8;
  id v12 = v5;
  id v7 = v5;
  dispatch_sync(observerQueue, block);
}

uint64_t __40__LSSettingsStore_removeChangeObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  dispatch_queue_t v4 = (atomic_uint *)(*(void *)(a1 + 32) + 16);

  return LaunchServices::notifyd::NotifyToken::cancel(v4);
}

- (OS_dispatch_queue)observerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableSet)observerSet
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerSet, 0);

  objc_storeStrong((id *)&self->_observerQueue, 0);
}

- (unsigned)userElectionForExtensionKey:(id)a3
{
  return 0;
}

- (id)settingsStoreConfigurationForProcessWithAuditToken:(id *)a3
{
  return 0;
}

void __37__LSSettingsStore_addChangeObserver___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "NotifyToken::Received(%{public}@)", v2, v3, v4, v5, 2u);
}

@end