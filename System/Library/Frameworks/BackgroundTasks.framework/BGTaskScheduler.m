@interface BGTaskScheduler
+ (BGTaskScheduler)sharedScheduler;
+ (BOOL)_hasExtensionEntitlement;
+ (BOOL)_isNotApplication;
+ (BOOL)_isRunningInExtension;
+ (BOOL)_isRunningInNonExtensionOrApplication;
+ (id)_log;
+ (id)_sharedSchedulerIfExists;
+ (void)_applicationDidFinishLaunching:(id)a3;
+ (void)initialize;
+ (void)load;
- (BGTaskScheduler)init;
- (BOOL)_isRunningTaskOfClass:(Class)a3;
- (BOOL)_unsafe_registerForTaskWithIdentifier:(id)a3 usingQueue:(id)a4 launchHandler:(id)a5;
- (BOOL)_unsafe_submitTaskRequest:(id)a3 error:(id *)a4;
- (BOOL)registerForTaskWithIdentifier:(NSString *)identifier usingQueue:(dispatch_queue_t)queue launchHandler:(void *)launchHandler;
- (BOOL)submitTaskRequest:(BGTaskRequest *)taskRequest error:(NSError *)error;
- (NSMapTable)_runningTasksMap;
- (NSMutableDictionary)_registrations;
- (NSMutableSet)_queuedExpiredLaunchActivities;
- (NSMutableSet)_queuedLaunchActivities;
- (NSSet)_permittedIdentifiers;
- (_DASActivityBackgroundTasksScheduler)_scheduler;
- (id)_init;
- (id)_queueForRegistration:(id)a3;
- (id)_runningTasks;
- (id)_unsafe_registrationForIdentifier:(id)a3;
- (os_unfair_lock_s)_lock;
- (void)_callExpirationHandlersForActivities:(id)a3 shouldQueue:(BOOL)a4;
- (void)_callRegisteredHandlersForActivities:(id)a3;
- (void)_handleAppLaunch;
- (void)_runTask:(id)a3 registration:(id)a4;
- (void)_setLock:(os_unfair_lock_s)a3;
- (void)_setPermittedIdentifiers:(id)a3;
- (void)_setQueuedExpiredLaunchActivities:(id)a3;
- (void)_setQueuedLaunchActivities:(id)a3;
- (void)_setRegistrations:(id)a3;
- (void)_setRunningTasksMap:(id)a3;
- (void)_setScheduler:(id)a3;
- (void)_simulateExpirationForTaskWithIdentifier:(id)a3;
- (void)_simulateLaunchForTaskWithIdentifier:(id)a3;
- (void)cancelAllTaskRequests;
- (void)cancelTaskRequestWithIdentifier:(NSString *)identifier;
- (void)getPendingTaskRequestsWithCompletionHandler:(void *)completionHandler;
- (void)scheduler:(id)a3 handleLaunchForActivities:(id)a4;
- (void)scheduler:(id)a3 willExpireActivities:(id)a4;
@end

@implementation BGTaskScheduler

- (void)cancelAllTaskRequests
{
  v3 = +[BGTaskScheduler _log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21C7BC000, v3, OS_LOG_TYPE_DEFAULT, "cancelAllTaskRequests", v5, 2u);
  }

  v4 = [(BGTaskScheduler *)self _scheduler];
  [v4 cancelAllTaskRequests];
}

uint64_t __34__BGTaskScheduler_sharedScheduler__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isRunningInExtension])
  {
    v2 = [MEMORY[0x263F08A00] defaultCenter];
    [v2 removeObserver:*(void *)(a1 + 32)];
  }
  atomic_store(1u, sharedSchedulerCreated);
  sharedScheduler_sharedScheduler = [[BGTaskScheduler alloc] _init];

  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)BGTaskScheduler;
  v2 = [(BGTaskScheduler *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->__lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    registrations = v3->__registrations;
    v3->__registrations = v4;

    uint64_t v6 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    runningTasksMap = v3->__runningTasksMap;
    v3->__runningTasksMap = (NSMapTable *)v6;

    uint64_t v8 = [MEMORY[0x263F3AFD8] sharedScheduler];
    scheduler = v3->__scheduler;
    v3->__scheduler = (_DASActivityBackgroundTasksScheduler *)v8;
  }
  return v3;
}

- (BOOL)registerForTaskWithIdentifier:(NSString *)identifier usingQueue:(dispatch_queue_t)queue launchHandler:(void *)launchHandler
{
  uint64_t v8 = identifier;
  v9 = launchHandler;
  v10 = queue;
  objc_super v11 = +[BGTaskScheduler _log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[BGTaskScheduler registerForTaskWithIdentifier:usingQueue:launchHandler:]((uint64_t)v8, v11);
  }

  p_lock = &self->__lock;
  os_unfair_lock_lock(&self->__lock);
  BOOL v13 = [(BGTaskScheduler *)self _unsafe_registerForTaskWithIdentifier:v8 usingQueue:v10 launchHandler:v9];

  os_unfair_lock_unlock(p_lock);
  return v13;
}

- (BOOL)_unsafe_registerForTaskWithIdentifier:(id)a3 usingQueue:(id)a4 launchHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (([(id)objc_opt_class() _isNotApplication] & 1) != 0
    || ([(BGTaskScheduler *)self _permittedIdentifiers],
        v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 containsObject:v9],
        v12,
        v13))
  {
    unsigned __int8 v14 = atomic_load(appHasLaunched);
    if ((v14 & 1) != 0 && ([(id)objc_opt_class() _isNotApplication] & 1) == 0)
    {
      v17 = [MEMORY[0x263F08690] currentHandler];
      [(_BGTaskSchedulerRegistration *)v17 handleFailureInMethod:a2, self, @"BGTaskScheduler.m", 225, @"All launch handlers must be registered before application finishes launching", v24 object file lineNumber description];
    }
    else
    {
      v15 = [(BGTaskScheduler *)self _registrations];
      v16 = [v15 objectForKeyedSubscript:v9];

      if (!v16)
      {
        v19 = [(BGTaskScheduler *)self _registrations];
        uint64_t v20 = [v19 count];

        if (!v20)
        {
          v21 = [(BGTaskScheduler *)self _scheduler];
          [v21 setBackgroundTasksSchedulerDelegate:self];
        }
        v17 = [[_BGTaskSchedulerRegistration alloc] initWithIdentifier:v9 queue:v10 launchHandler:v11];
        v22 = [(BGTaskScheduler *)self _registrations];
        [v22 setObject:v17 forKeyedSubscript:v9];

        BOOL v18 = 1;
        goto LABEL_13;
      }
      v17 = [MEMORY[0x263F08690] currentHandler];
      [(_BGTaskSchedulerRegistration *)v17 handleFailureInMethod:a2, self, @"BGTaskScheduler.m", 229, @"Launch handler for task with identifier %@ has already been registered", v9 object file lineNumber description];
    }
    BOOL v18 = 0;
LABEL_13:

    goto LABEL_14;
  }
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (NSMutableDictionary)_registrations
{
  return self->__registrations;
}

+ (void)initialize
{
  if ([a1 _isNotApplication])
  {
    atomic_store(1u, appHasLaunched);
    id v3 = [a1 _sharedSchedulerIfExists];
    [v3 _handleAppLaunch];
  }
}

+ (BOOL)_isNotApplication
{
  v2 = [MEMORY[0x263F64570] currentProcess];
  char v3 = [v2 isApplication] ^ 1;

  return v3;
}

- (NSSet)_permittedIdentifiers
{
  permittedIdentifiers = self->__permittedIdentifiers;
  if (!permittedIdentifiers)
  {
    v4 = [MEMORY[0x263F086E0] mainBundle];
    v5 = [v4 infoDictionary];
    uint64_t v6 = [v5 objectForKey:@"BGTaskSchedulerPermittedIdentifiers"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v6 = (void *)MEMORY[0x263EFFA68];
    }
    v7 = [MEMORY[0x263EFFA08] setWithArray:v6];
    uint64_t v8 = self->__permittedIdentifiers;
    self->__permittedIdentifiers = v7;

    permittedIdentifiers = self->__permittedIdentifiers;
  }

  return permittedIdentifiers;
}

- (void)cancelTaskRequestWithIdentifier:(NSString *)identifier
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4 = identifier;
  v5 = +[BGTaskScheduler _log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    uint64_t v8 = v4;
    _os_log_impl(&dword_21C7BC000, v5, OS_LOG_TYPE_DEFAULT, "cancelTaskRequestWithIdentifier: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = [(BGTaskScheduler *)self _scheduler];
  [v6 cancelTaskRequestWithIdentifier:v4];
}

- (_DASActivityBackgroundTasksScheduler)_scheduler
{
  return self->__scheduler;
}

- (void)_handleAppLaunch
{
  char v3 = +[BGTaskScheduler _log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_21C7BC000, v3, OS_LOG_TYPE_DEFAULT, "Handling app launch", v12, 2u);
  }

  os_unfair_lock_lock(&self->__lock);
  v4 = [(BGTaskScheduler *)self _queuedLaunchActivities];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = [(BGTaskScheduler *)self _queuedLaunchActivities];
    int v7 = (void *)[v6 copy];

    [(BGTaskScheduler *)self _setQueuedLaunchActivities:0];
  }
  else
  {
    int v7 = 0;
  }
  uint64_t v8 = [(BGTaskScheduler *)self _queuedExpiredLaunchActivities];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id v10 = [(BGTaskScheduler *)self _queuedExpiredLaunchActivities];
    id v11 = (void *)[v10 copy];

    [(BGTaskScheduler *)self _setQueuedExpiredLaunchActivities:0];
  }
  else
  {
    id v11 = 0;
  }
  [(BGTaskScheduler *)self _setPermittedIdentifiers:0];
  os_unfair_lock_unlock(&self->__lock);
  if ([v7 count]) {
    [(BGTaskScheduler *)self _callRegisteredHandlersForActivities:v7];
  }
  if ([v11 count]) {
    [(BGTaskScheduler *)self _callExpirationHandlersForActivities:v11 shouldQueue:0];
  }
}

- (void)_setPermittedIdentifiers:(id)a3
{
}

- (NSMutableSet)_queuedLaunchActivities
{
  return self->__queuedLaunchActivities;
}

- (NSMutableSet)_queuedExpiredLaunchActivities
{
  return self->__queuedExpiredLaunchActivities;
}

void __50__BGTaskScheduler__applicationDidFinishLaunching___block_invoke(uint64_t a1)
{
  atomic_store(1u, appHasLaunched);
  id v1 = [*(id *)(a1 + 32) _sharedSchedulerIfExists];
  [v1 _handleAppLaunch];
}

+ (id)_sharedSchedulerIfExists
{
  unsigned __int8 v2 = atomic_load(sharedSchedulerCreated);
  if (v2)
  {
    char v3 = [a1 sharedScheduler];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

+ (BGTaskScheduler)sharedScheduler
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__BGTaskScheduler_sharedScheduler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedScheduler_onceToken != -1) {
    dispatch_once(&sharedScheduler_onceToken, block);
  }
  unsigned __int8 v2 = (void *)sharedScheduler_sharedScheduler;

  return (BGTaskScheduler *)v2;
}

+ (void)_applicationDidFinishLaunching:(id)a3
{
  v4 = +[BGTaskScheduler _log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[BGTaskScheduler _applicationDidFinishLaunching:](v4);
  }

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:a1];

  if (([a1 _isRunningInExtension] & 1) == 0)
  {
    unsigned __int8 v6 = atomic_load(appHasLaunched);
    if ((v6 & 1) == 0)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __50__BGTaskScheduler__applicationDidFinishLaunching___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

+ (id)_log
{
  if (_log_onceToken != -1) {
    dispatch_once(&_log_onceToken, &__block_literal_global_85);
  }
  unsigned __int8 v2 = (void *)_log_log;

  return v2;
}

+ (void)load
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:a1 selector:sel__applicationDidFinishLaunching_ name:@"UIApplicationDidFinishLaunchingNotification" object:0];
}

+ (BOOL)_isRunningInExtension
{
  if (_isRunningInExtension_once != -1) {
    dispatch_once(&_isRunningInExtension_once, &__block_literal_global_0);
  }
  return _isRunningInExtension_result;
}

void __40__BGTaskScheduler__isRunningInExtension__block_invoke()
{
  id v5 = [MEMORY[0x263F086E0] mainBundle];
  v0 = [v5 infoDictionary];
  id v1 = [v0 objectForKey:@"NSExtension"];
  if (v1)
  {
    _isRunningInExtension_result = 1;
  }
  else
  {
    unsigned __int8 v2 = [MEMORY[0x263F086E0] mainBundle];
    id v3 = [v2 infoDictionary];
    v4 = [v3 objectForKey:@"PlugInKit"];
    _isRunningInExtension_result = v4 != 0;
  }
}

uint64_t __23__BGTaskScheduler__log__block_invoke()
{
  _log_log = (uint64_t)os_log_create("com.apple.BackgroundTasks", "Framework");

  return MEMORY[0x270F9A758]();
}

+ (BOOL)_isRunningInNonExtensionOrApplication
{
  if (_isRunningInNonExtensionOrApplication_once != -1) {
    dispatch_once(&_isRunningInNonExtensionOrApplication_once, &__block_literal_global_50);
  }
  return _isRunningInNonExtensionOrApplication_result;
}

void __56__BGTaskScheduler__isRunningInNonExtensionOrApplication__block_invoke()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v0 = +[BGTaskScheduler _log];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    id v1 = [MEMORY[0x263F086E0] mainBundle];
    unsigned __int8 v2 = [v1 infoDictionary];
    int v5 = 138412290;
    unsigned __int8 v6 = v2;
    _os_log_impl(&dword_21C7BC000, v0, OS_LOG_TYPE_DEFAULT, "Main Bundle: %@", (uint8_t *)&v5, 0xCu);
  }
  id v3 = [MEMORY[0x263F086E0] mainBundle];
  v4 = [v3 infoDictionary];
  _isRunningInNonExtensionOrApplication_result = [v4 count] == 0;
}

+ (BOOL)_hasExtensionEntitlement
{
  return 1;
}

- (BGTaskScheduler)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"BGTaskScheduler.m" lineNumber:150 description:@"Do not directly instantiate; use the shared scheduler instead"];

  return 0;
}

- (BOOL)submitTaskRequest:(BGTaskRequest *)taskRequest error:(NSError *)error
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unsigned __int8 v6 = taskRequest;
  uint64_t v7 = +[BGTaskScheduler _log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v6;
    _os_log_impl(&dword_21C7BC000, v7, OS_LOG_TYPE_DEFAULT, "submitTaskRequest: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  os_unfair_lock_lock(&self->__lock);
  BOOL v8 = [(BGTaskScheduler *)self _unsafe_submitTaskRequest:v6 error:error];
  os_unfair_lock_unlock(&self->__lock);

  return v8;
}

- (BOOL)_unsafe_submitTaskRequest:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (![(id)objc_opt_class() _correspondingTaskClass])
  {
LABEL_23:
    BOOL v13 = 0;
    goto LABEL_24;
  }
  if (([(id)objc_opt_class() _isRunningInExtension] & 1) == 0)
  {
    BOOL v8 = [v7 identifier];
    uint64_t v9 = [(BGTaskScheduler *)self _unsafe_registrationForIdentifier:v8];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (!v9 && (isKindOfClass & 1) == 0)
      {
        uint64_t v20 = [MEMORY[0x263F086E0] mainBundle];
        v21 = [v20 infoDictionary];
        v22 = [v21 objectForKey:@"BGTaskSchedulerPermittedIdentifiers"];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ([v7 identifier],
              v23 = objc_claimAutoreleasedReturnValue(),
              char v24 = [v22 containsObject:v23],
              v23,
              (v24 & 1) != 0))
        {
          v25 = [MEMORY[0x263F08690] currentHandler];
          v26 = [v7 identifier];
          [v25 handleFailureInMethod:a2, self, @"BGTaskScheduler.m", 274, @"No launch handler registered for task with identifier %@", v26 object file lineNumber description];
        }
        else if (a4)
        {
          *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"BGTaskSchedulerErrorDomain" code:3 userInfo:0];
        }

        goto LABEL_23;
      }
    }
  }
  scheduler = self->__scheduler;
  id v11 = [v7 _activity];
  uint64_t v12 = [(_DASActivityBackgroundTasksScheduler *)scheduler submitTaskRequest:v11];

  BOOL v13 = v12 == 0;
  if (v12)
  {
    unsigned __int8 v14 = +[BGTaskScheduler _log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v29 = v7;
      __int16 v30 = 2114;
      v31 = v12;
      _os_log_impl(&dword_21C7BC000, v14, OS_LOG_TYPE_DEFAULT, "Error submitting task request: %{public}@, error: %{public}@", buf, 0x16u);
    }

    if (a4)
    {
      v15 = [v12 domain];
      int v16 = [v15 isEqualToString:*MEMORY[0x263F3B000]];

      if (v16 && (uint64_t v17 = [v12 code], (unint64_t)(v17 - 2) <= 2)) {
        uint64_t v18 = qword_21C7C5638[v17 - 2];
      }
      else {
        uint64_t v18 = 1;
      }
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"BGTaskSchedulerErrorDomain" code:v18 userInfo:0];
    }
  }

LABEL_24:
  return v13;
}

- (id)_unsafe_registrationForIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(BGTaskScheduler *)self _registrations];
  unsigned __int8 v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)_queueForRegistration:(id)a3
{
  id v3 = a3;
  id v4 = [v3 queue];
  if (!v4)
  {
    int v5 = NSString;
    unsigned __int8 v6 = [v3 identifier];
    id v7 = [v5 stringWithFormat:@"com.apple.BGTaskScheduler (%@)", v6];
    BOOL v8 = (const char *)[v7 cStringUsingEncoding:4];
    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_BACKGROUND, 0);
    id v4 = dispatch_queue_create(v8, v10);
  }

  return v4;
}

- (void)getPendingTaskRequestsWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  int v5 = +[BGTaskScheduler _log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C7BC000, v5, OS_LOG_TYPE_DEFAULT, "Getting pending task requests", buf, 2u);
  }

  unsigned __int8 v6 = [(BGTaskScheduler *)self _scheduler];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__BGTaskScheduler_getPendingTaskRequestsWithCompletionHandler___block_invoke;
  v8[3] = &unk_2644219F8;
  id v9 = v4;
  id v7 = v4;
  [v6 getPendingTaskRequestsWithCompletionHandler:v8];
}

void __63__BGTaskScheduler_getPendingTaskRequestsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[BGTaskScheduler _log];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v6;
      _os_log_impl(&dword_21C7BC000, v7, OS_LOG_TYPE_DEFAULT, "Error fetching activities: %{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v5;
      _os_log_impl(&dword_21C7BC000, v7, OS_LOG_TYPE_DEFAULT, "Found pending activities: %{public}@", buf, 0xCu);
    }

    id v9 = [MEMORY[0x263EFF980] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = +[BGTaskRequest _requestFromActivity:](BGTaskRequest, "_requestFromActivity:", *(void *)(*((void *)&v18 + 1) + 8 * v14), (void)v18);
          if (v15) {
            [v9 addObject:v15];
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = (void *)[v9 copy];
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);
  }
}

- (id)_runningTasks
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9C0] set];
  os_unfair_lock_lock(&self->__lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(BGTaskScheduler *)self _runningTasksMap];
  id v5 = [v4 keyEnumerator];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [(BGTaskScheduler *)self _runningTasksMap];
        uint64_t v12 = [v11 objectForKey:v10];
        [v3 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->__lock);
  uint64_t v13 = (void *)[v3 copy];

  return v13;
}

- (BOOL)_isRunningTaskOfClass:(Class)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  p_lock = &self->__lock;
  os_unfair_lock_lock(&self->__lock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(BGTaskScheduler *)self _runningTasksMap];
  uint64_t v6 = [v5 keyEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [(BGTaskScheduler *)self _runningTasksMap];
        uint64_t v13 = [v12 objectForKey:v11];
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          BOOL v15 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (void)_runTask:(id)a3 registration:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[BGTaskScheduler _log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v42 = v6;
    _os_log_impl(&dword_21C7BC000, v8, OS_LOG_TYPE_DEFAULT, "Running task: %{public}@", buf, 0xCu);
  }

  uint64_t v9 = [(BGTaskScheduler *)self _queueForRegistration:v7];
  [v6 _setHandlerQueue:v9];

  uint64_t v10 = [v6 _activity];
  uint64_t v11 = [v6 identifier];
  os_unfair_lock_lock(&self->__lock);
  uint64_t v12 = [(BGTaskScheduler *)self _runningTasksMap];
  uint64_t v13 = [v6 identifier];
  [v12 setObject:v6 forKey:v13];

  os_unfair_lock_unlock(&self->__lock);
  uint64_t v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 postNotificationName:@"_BGTaskSchedulerRunningTasksDidChangeNotification" object:self];

  objc_initWeak((id *)buf, v6);
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __41__BGTaskScheduler__runTask_registration___block_invoke;
  v36[3] = &unk_264421A20;
  objc_copyWeak(&v40, (id *)buf);
  id v15 = v10;
  id v37 = v15;
  v38 = self;
  id v16 = v11;
  id v39 = v16;
  [v6 _setCompletionHandler:v36];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v6;
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __41__BGTaskScheduler__runTask_registration___block_invoke_91;
    v34[3] = &unk_264421A48;
    v34[4] = self;
    id v35 = v15;
    [v17 _setProgressHandler:v34];
    long long v18 = &v35;
LABEL_7:

    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v6;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __41__BGTaskScheduler__runTask_registration___block_invoke_2;
    v32[3] = &unk_264421A48;
    v32[4] = self;
    id v20 = v15;
    id v33 = v20;
    [v19 _setProgressHandler:v32];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __41__BGTaskScheduler__runTask_registration___block_invoke_3;
    v29[3] = &unk_264421A70;
    id v30 = v20;
    v31 = self;
    [v19 _setDescriptionUpdateHandler:v29];

    long long v18 = &v33;
    goto LABEL_7;
  }
LABEL_8:
  long long v21 = [v6 _handlerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__BGTaskScheduler__runTask_registration___block_invoke_4;
  block[3] = &unk_264421A98;
  id v26 = v15;
  id v27 = v6;
  id v28 = v7;
  id v22 = v7;
  id v23 = v6;
  id v24 = v15;
  dispatch_async(v21, block);

  objc_destroyWeak(&v40);
  objc_destroyWeak((id *)buf);
}

void __41__BGTaskScheduler__runTask_registration___block_invoke(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = +[BGTaskScheduler _log];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v12 = 138543618;
      id v13 = WeakRetained;
      __int16 v14 = 1024;
      int v15 = a2;
      _os_log_impl(&dword_21C7BC000, v6, OS_LOG_TYPE_DEFAULT, "Marking task %{public}@ complete with success: %d", (uint8_t *)&v12, 0x12u);
    }

    id v6 = [*(id *)(a1 + 40) _scheduler];
    [v6 completeTaskRequest:*(void *)(a1 + 32)];
  }
  else if (v7)
  {
    int v12 = 138412290;
    id v13 = WeakRetained;
    _os_log_impl(&dword_21C7BC000, v6, OS_LOG_TYPE_DEFAULT, "Marking simulated task complete: %@", (uint8_t *)&v12, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
  uint64_t v8 = [*(id *)(a1 + 40) _runningTasksMap];
  id v9 = [v8 objectForKey:*(void *)(a1 + 48)];

  if (!WeakRetained || WeakRetained == v9)
  {
    uint64_t v10 = [*(id *)(a1 + 40) _runningTasksMap];
    [v10 removeObjectForKey:*(void *)(a1 + 48)];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
  uint64_t v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 postNotificationName:@"_BGTaskSchedulerRunningTasksDidChangeNotification" object:*(void *)(a1 + 40)];
}

void __41__BGTaskScheduler__runTask_registration___block_invoke_91(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 _scheduler];
  [v5 updateProgress:v4 forOngoingTask:*(void *)(a1 + 40)];
}

void __41__BGTaskScheduler__runTask_registration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 _scheduler];
  [v5 updateProgress:v4 forOngoingTask:*(void *)(a1 + 40)];
}

void __41__BGTaskScheduler__runTask_registration___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setClientProvidedTitle:a2];
  [*(id *)(a1 + 32) setClientProvidedReason:v6];

  id v7 = [*(id *)(a1 + 40) _scheduler];
  [v7 updateOngoingTask:*(void *)(a1 + 32)];
}

void __41__BGTaskScheduler__runTask_registration___block_invoke_4(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = +[BGTaskScheduler _log];
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v9 = 138543362;
      uint64_t v10 = v5;
      id v6 = "Starting task: %{public}@";
LABEL_6:
      _os_log_impl(&dword_21C7BC000, v3, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v4)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 138543362;
    uint64_t v10 = v7;
    id v6 = "Starting simulated task: %{public}@";
    goto LABEL_6;
  }

  uint64_t v8 = [*(id *)(a1 + 48) launchHandler];
  v8[2](v8, *(void *)(a1 + 40));
}

- (void)scheduler:(id)a3 handleLaunchForActivities:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = +[BGTaskScheduler _log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v5;
    _os_log_impl(&dword_21C7BC000, v6, OS_LOG_TYPE_DEFAULT, "Application launched for activities: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  p_lock = &self->__lock;
  os_unfair_lock_lock(&self->__lock);
  unsigned __int8 v8 = atomic_load(appHasLaunched);
  if (v8)
  {
    os_unfair_lock_unlock(&self->__lock);
    [(BGTaskScheduler *)self _callRegisteredHandlersForActivities:v5];
  }
  else
  {
    int v9 = [(BGTaskScheduler *)self _queuedLaunchActivities];

    if (!v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      [(BGTaskScheduler *)self _setQueuedLaunchActivities:v10];
    }
    uint64_t v11 = [(BGTaskScheduler *)self _queuedLaunchActivities];
    [v11 unionSet:v5];

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)_callRegisteredHandlersForActivities:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[BGTaskScheduler _log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v39 = v4;
    _os_log_impl(&dword_21C7BC000, v5, OS_LOG_TYPE_DEFAULT, "Calling handlers for activities: %{public}@", buf, 0xCu);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    uint64_t v32 = *MEMORY[0x263F3B028];
    uint64_t v29 = *MEMORY[0x263F3B048];
    uint64_t v28 = *MEMORY[0x263F3B038];
    uint64_t v27 = *MEMORY[0x263F3B040];
    uint64_t v26 = *MEMORY[0x263F3B030];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v11 = [v10 clientProvidedIdentifier];
        os_unfair_lock_lock(&self->__lock);
        int v12 = [(BGTaskScheduler *)self _unsafe_registrationForIdentifier:v11];
        os_unfair_lock_unlock(&self->__lock);
        if (!v12)
        {
          uint64_t v25 = [MEMORY[0x263F08690] currentHandler];
          [v25 handleFailureInMethod:a2, self, @"BGTaskScheduler.m", 546, @"No launch handler registered for task with identifier %@", v11 object file lineNumber description];
          goto LABEL_17;
        }
        id v13 = [v10 launchReason];
        char v14 = [v13 isEqualToString:v32];

        int v15 = off_264421798;
        if (v14) {
          goto LABEL_23;
        }
        uint64_t v16 = [v10 launchReason];
        char v17 = [v16 isEqualToString:v29];

        int v15 = off_264421788;
        if (v17) {
          goto LABEL_23;
        }
        long long v18 = [v10 launchReason];
        char v19 = [v18 isEqualToString:v28];

        int v15 = off_264421778;
        if (v19) {
          goto LABEL_23;
        }
        id v20 = [v10 launchReason];
        char v21 = [v20 isEqualToString:v27];

        int v15 = off_264421838;
        if ((v21 & 1) != 0
          || ([v10 launchReason],
              id v22 = objc_claimAutoreleasedReturnValue(),
              int v23 = [v22 isEqualToString:v26],
              v22,
              int v15 = off_264421768,
              v23))
        {
LABEL_23:
          uint64_t v24 = [objc_alloc(*v15) _initWithIdentifier:v11 activity:v10];
          if (v24)
          {
            uint64_t v25 = (void *)v24;
            [(BGTaskScheduler *)self _runTask:v24 registration:v12];
LABEL_17:
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v7);
  }
}

- (void)_callExpirationHandlersForActivities:(id)a3 shouldQueue:(BOOL)a4
{
  LODWORD(v70) = a4;
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = +[BGTaskScheduler _log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v102 = v5;
    _os_log_impl(&dword_21C7BC000, v6, OS_LOG_TYPE_DEFAULT, "Calling expiration handlers for activities: %{public}@", buf, 0xCu);
  }

  uint64_t v7 = [MEMORY[0x263EFF9C0] set];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v92 objects:v100 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v93;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v93 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v92 + 1) + 8 * i), "uuid", v70);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v92 objects:v100 count:16];
    }
    while (v10);
  }
  v73 = v8;

  v74 = [MEMORY[0x263EFF9C0] set];
  locuint64_t k = &self->__lock;
  os_unfair_lock_lock(&self->__lock);
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  char v14 = [(BGTaskScheduler *)self _runningTasksMap];
  int v15 = [v14 keyEnumerator];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v88 objects:v99 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v89;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v89 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v88 + 1) + 8 * j);
        char v21 = [(BGTaskScheduler *)self _runningTasksMap];
        id v22 = [v21 objectForKey:v20];

        if (v22)
        {
          int v23 = [v22 _activity];
          uint64_t v24 = [v23 uuid];
          int v25 = [v7 containsObject:v24];

          if (v25)
          {
            [v74 addObject:v22];
            uint64_t v26 = [v22 _activity];
            uint64_t v27 = [v26 uuid];
            [v7 removeObject:v27];
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v88 objects:v99 count:16];
    }
    while (v17);
  }

  if (v70)
  {
    unsigned __int8 v28 = atomic_load(appHasLaunched);
    if ((v28 & 1) == 0)
    {
      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id v29 = v73;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v84 objects:v98 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v85;
        do
        {
          for (uint64_t k = 0; k != v31; ++k)
          {
            if (*(void *)v85 != v32) {
              objc_enumerationMutation(v29);
            }
            long long v34 = *(void **)(*((void *)&v84 + 1) + 8 * k);
            long long v35 = objc_msgSend(v34, "uuid", v70);
            int v36 = [v7 containsObject:v35];

            if (v36)
            {
              id v37 = [(BGTaskScheduler *)self _queuedExpiredLaunchActivities];

              if (!v37)
              {
                v38 = [MEMORY[0x263EFF9C0] set];
                [(BGTaskScheduler *)self _setQueuedExpiredLaunchActivities:v38];
              }
              id v39 = [(BGTaskScheduler *)self _queuedExpiredLaunchActivities];
              [v39 addObject:v34];

              uint64_t v40 = [v34 uuid];
              [v7 removeObject:v40];
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v84 objects:v98 count:16];
        }
        while (v31);
      }

      v41 = [(BGTaskScheduler *)self _queuedExpiredLaunchActivities];
      uint64_t v42 = [v41 count];

      if (v42)
      {
        uint64_t v43 = +[BGTaskScheduler _log];
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v44 = [(BGTaskScheduler *)self _queuedExpiredLaunchActivities];
          *(_DWORD *)buf = 138543362;
          id v102 = v44;
          _os_log_impl(&dword_21C7BC000, v43, OS_LOG_TYPE_DEFAULT, "Queued activities for expiration: %{public}@", buf, 0xCu);
        }
      }
    }
  }
  v71 = self;
  os_unfair_lock_unlock(lock);
  v45 = +[BGTaskScheduler _log];
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v102 = v74;
    _os_log_impl(&dword_21C7BC000, v45, OS_LOG_TYPE_DEFAULT, "Calling expiration handlers for tasks: %{public}@", buf, 0xCu);
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v46 = v74;
  uint64_t v47 = [v46 countByEnumeratingWithState:&v80 objects:v97 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v81;
    do
    {
      for (uint64_t m = 0; m != v48; ++m)
      {
        if (*(void *)v81 != v49) {
          objc_enumerationMutation(v46);
        }
        uint64_t v51 = *(void *)(*((void *)&v80 + 1) + 8 * m);
        v52 = dispatch_get_global_queue(-32768, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __68__BGTaskScheduler__callExpirationHandlersForActivities_shouldQueue___block_invoke;
        block[3] = &unk_264421AC0;
        void block[4] = v51;
        dispatch_async(v52, block);
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v80 objects:v97 count:16];
    }
    while (v48);
  }

  if ([v7 count])
  {
    v53 = +[BGTaskScheduler _log];
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      -[BGTaskScheduler _callExpirationHandlersForActivities:shouldQueue:]((uint64_t)v7, v53, v54, v55, v56, v57, v58, v59);
    }

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v60 = v73;
    uint64_t v61 = [v60 countByEnumeratingWithState:&v75 objects:v96 count:16];
    v62 = v71;
    if (v61)
    {
      uint64_t v63 = v61;
      uint64_t v64 = *(void *)v76;
      do
      {
        for (uint64_t n = 0; n != v63; ++n)
        {
          if (*(void *)v76 != v64) {
            objc_enumerationMutation(v60);
          }
          v66 = *(void **)(*((void *)&v75 + 1) + 8 * n);
          v67 = objc_msgSend(v66, "uuid", v71);
          int v68 = [v7 containsObject:v67];

          if (v68)
          {
            v69 = [(BGTaskScheduler *)v62 _scheduler];
            [v69 completeTaskRequest:v66];
          }
        }
        uint64_t v63 = [v60 countByEnumeratingWithState:&v75 objects:v96 count:16];
      }
      while (v63);
    }
  }
}

uint64_t __68__BGTaskScheduler__callExpirationHandlersForActivities_shouldQueue___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[BGTaskScheduler _log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_21C7BC000, v2, OS_LOG_TYPE_DEFAULT, "Expiring task: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) _callExpirationHandler];
}

- (void)scheduler:(id)a3 willExpireActivities:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = +[BGTaskScheduler _log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_21C7BC000, v6, OS_LOG_TYPE_DEFAULT, "Will expire activities: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  [(BGTaskScheduler *)self _callExpirationHandlersForActivities:v5 shouldQueue:1];
}

- (void)_simulateLaunchForTaskWithIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = +[BGTaskScheduler _log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v5;
    _os_log_impl(&dword_21C7BC000, v6, OS_LOG_TYPE_DEFAULT, "Simulating launch for task with identifier %{public}@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__BGTaskScheduler__simulateLaunchForTaskWithIdentifier___block_invoke;
  v8[3] = &unk_264421AE8;
  id v9 = v5;
  uint64_t v10 = self;
  SEL v11 = a2;
  id v7 = v5;
  [(BGTaskScheduler *)self getPendingTaskRequestsWithCompletionHandler:v8];
}

void __56__BGTaskScheduler__simulateLaunchForTaskWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (!v4) {
    goto LABEL_9;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v25;
  while (2)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v25 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      id v9 = [v8 identifier];
      char v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

      if (v10)
      {
        SEL v11 = v8;

        if (!v11) {
          goto LABEL_16;
        }
        os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
        int v12 = [*(id *)(a1 + 40) _runningTasksMap];
        id v13 = [v12 objectForKey:*(void *)(a1 + 32)];

        if (v13)
        {
          uint64_t v14 = +[BGTaskScheduler _log];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543362;
            uint64_t v29 = v15;
            _os_log_impl(&dword_21C7BC000, v14, OS_LOG_TYPE_DEFAULT, "Task with identifier %{public}@ is already running", buf, 0xCu);
          }

          os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
        }
        else
        {
          uint64_t v16 = objc_msgSend(*(id *)(a1 + 40), "_unsafe_registrationForIdentifier:", *(void *)(a1 + 32));
          os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
          if (v16)
          {
            int v23 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_correspondingTaskClass")), "_initWithIdentifier:activity:", *(void *)(a1 + 32), 0);
            if (v23)
            {
              [*(id *)(a1 + 40) cancelTaskRequestWithIdentifier:*(void *)(a1 + 32)];
              [*(id *)(a1 + 40) _runTask:v23 registration:v16];
            }

            goto LABEL_22;
          }
        }
        uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
        [v16 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 40), @"BGTaskScheduler.m", 665, @"No launch handler registered for task with identifier %@", *(void *)(a1 + 32) object file lineNumber description];
LABEL_22:

        goto LABEL_23;
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v5) {
      continue;
    }
    break;
  }
LABEL_9:

LABEL_16:
  SEL v11 = +[BGTaskScheduler _log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    __56__BGTaskScheduler__simulateLaunchForTaskWithIdentifier___block_invoke_cold_1(a1, v11, v17, v18, v19, v20, v21, v22);
  }
LABEL_23:
}

- (void)_simulateExpirationForTaskWithIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[BGTaskScheduler _log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v4;
    _os_log_impl(&dword_21C7BC000, v5, OS_LOG_TYPE_DEFAULT, "Simulating expiration for task with identifier %{public}@", buf, 0xCu);
  }

  p_locuint64_t k = &self->__lock;
  os_unfair_lock_lock(&self->__lock);
  id v7 = [(BGTaskScheduler *)self _runningTasksMap];
  id v8 = [v7 objectForKey:v4];

  os_unfair_lock_unlock(p_lock);
  if (v8 && ([v8 _activity], id v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    uint64_t v17 = dispatch_get_global_queue(-32768, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__BGTaskScheduler__simulateExpirationForTaskWithIdentifier___block_invoke;
    block[3] = &unk_264421AC0;
    uint64_t v19 = v8;
    dispatch_async(v17, block);

    char v10 = v19;
  }
  else
  {
    char v10 = +[BGTaskScheduler _log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[BGTaskScheduler _simulateExpirationForTaskWithIdentifier:]((uint64_t)v4, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

void __60__BGTaskScheduler__simulateExpirationForTaskWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v1 = (id *)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 32) expirationHandler];

  id v3 = +[BGTaskScheduler _log];
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *v1;
      int v12 = 138543362;
      id v13 = v5;
      _os_log_impl(&dword_21C7BC000, v4, OS_LOG_TYPE_DEFAULT, "Expiring simulated task: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    [*v1 _callExpirationHandler];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __60__BGTaskScheduler__simulateExpirationForTaskWithIdentifier___block_invoke_cold_1((uint64_t)v1, v4, v6, v7, v8, v9, v10, v11);
    }
  }
}

- (void)_setScheduler:(id)a3
{
}

- (void)_setQueuedLaunchActivities:(id)a3
{
}

- (void)_setQueuedExpiredLaunchActivities:(id)a3
{
}

- (os_unfair_lock_s)_lock
{
  return self->__lock;
}

- (void)_setLock:(os_unfair_lock_s)a3
{
  self->__locuint64_t k = a3;
}

- (void)_setRegistrations:(id)a3
{
}

- (NSMapTable)_runningTasksMap
{
  return self->__runningTasksMap;
}

- (void)_setRunningTasksMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__runningTasksMap, 0);
  objc_storeStrong((id *)&self->__permittedIdentifiers, 0);
  objc_storeStrong((id *)&self->__registrations, 0);
  objc_storeStrong((id *)&self->__queuedExpiredLaunchActivities, 0);
  objc_storeStrong((id *)&self->__queuedLaunchActivities, 0);

  objc_storeStrong((id *)&self->__scheduler, 0);
}

+ (void)_applicationDidFinishLaunching:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_21C7BC000, log, OS_LOG_TYPE_DEBUG, "Application finished launching", v1, 2u);
}

- (void)registerForTaskWithIdentifier:(uint64_t)a1 usingQueue:(NSObject *)a2 launchHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21C7BC000, a2, OS_LOG_TYPE_DEBUG, "registerForTaskWithIdentifier: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_callExpirationHandlersForActivities:(uint64_t)a3 shouldQueue:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__BGTaskScheduler__simulateLaunchForTaskWithIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_simulateExpirationForTaskWithIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60__BGTaskScheduler__simulateExpirationForTaskWithIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end