@interface HFDebugStateDumpManager
+ (id)sharedInstance;
- (HFDebugStateDumpManager)init;
- (NSMutableDictionary)stateDumpHandlersByName;
- (OS_dispatch_queue)stateHandlerQueue;
- (id)_performStateDump:(BOOL)a3;
- (id)registerStateDumpHandler:(id)a3 withName:(id)a4;
- (int)logStateDumpNotifyToken;
- (void)_listenForAttachmentRequestNotifications;
- (void)_writeStateDump;
- (void)dealloc;
- (void)setStateDumpHandlersByName:(id)a3;
- (void)setStateHandlerQueue:(id)a3;
@end

@implementation HFDebugStateDumpManager

- (id)registerStateDumpHandler:(id)a3 withName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HFDebugStateDumpManager.m", 111, @"Invalid parameter not satisfying: %@", @"stateDumpHandler" object file lineNumber description];
  }
  v9 = (void *)[v7 copy];
  v10 = _Block_copy(v9);
  v11 = [(HFDebugStateDumpManager *)self stateDumpHandlersByName];
  [v11 setObject:v10 forKeyedSubscript:v8];

  objc_initWeak(&location, self);
  v12 = (void *)MEMORY[0x263F58168];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __61__HFDebugStateDumpManager_registerStateDumpHandler_withName___block_invoke;
  v17[3] = &unk_26408DB10;
  objc_copyWeak(&v19, &location);
  id v13 = v8;
  id v18 = v13;
  v14 = [v12 tokenWithCancelationBlock:v17];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v14;
}

- (NSMutableDictionary)stateDumpHandlersByName
{
  return self->_stateDumpHandlersByName;
}

+ (id)sharedInstance
{
  if (_MergedGlobals_268 != -1) {
    dispatch_once(&_MergedGlobals_268, &__block_literal_global_4_8);
  }
  v2 = (void *)qword_26AB2F218;
  return v2;
}

uint64_t __41__HFDebugStateDumpManager_sharedInstance__block_invoke_2()
{
  v0 = objc_alloc_init(HFDebugStateDumpManager);
  uint64_t v1 = qword_26AB2F218;
  qword_26AB2F218 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFDebugStateDumpManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)HFDebugStateDumpManager;
  v2 = [(HFDebugStateDumpManager *)&v14 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Home.HFStateHandlerQueue", 0);
    [(HFDebugStateDumpManager *)v2 setStateHandlerQueue:v3];

    v4 = objc_opt_new();
    [(HFDebugStateDumpManager *)v2 setStateDumpHandlersByName:v4];

    objc_initWeak(&location, v2);
    v5 = MEMORY[0x263EF83A0];
    id v6 = MEMORY[0x263EF83A0];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __31__HFDebugStateDumpManager_init__block_invoke;
    v11 = &unk_26408DD70;
    objc_copyWeak(&v12, &location);
    notify_register_dispatch("com.apple.Home.logStateDump", &v2->_logStateDumpNotifyToken, v5, &v8);

    [(HFDebugStateDumpManager *)v2 _listenForAttachmentRequestNotifications];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setStateHandlerQueue:(id)a3
{
}

- (void)setStateDumpHandlersByName:(id)a3
{
}

- (void)_listenForAttachmentRequestNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleStateDumpRequest, @"HomeDiagnosticExtensionAttachmentRequestNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

void __31__HFDebugStateDumpManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)[WeakRetained _performStateDump:1];
}

- (void)dealloc
{
  notify_cancel([(HFDebugStateDumpManager *)self logStateDumpNotifyToken]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)HFDebugStateDumpManager;
  [(HFDebugStateDumpManager *)&v4 dealloc];
}

void __61__HFDebugStateDumpManager_registerStateDumpHandler_withName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained stateDumpHandlersByName];
  [v2 removeObjectForKey:*(void *)(a1 + 32)];
}

- (id)_performStateDump:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = HFLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[HFExecutionEnvironment sharedInstance];
    int v10 = 138413058;
    v11 = self;
    __int16 v12 = 2080;
    id v13 = "-[HFDebugStateDumpManager _performStateDump:]";
    __int16 v14 = 1024;
    BOOL v15 = v3;
    __int16 v16 = 2048;
    uint64_t v17 = [v6 hostProcess];
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "(%@:%s) logToConsole = %{BOOL}d. Process = %lu", (uint8_t *)&v10, 0x26u);
  }
  id v7 = [(HFDebugStateDumpManager *)self stateDumpHandlersByName];
  uint64_t v8 = objc_msgSend(v7, "na_dictionaryByMappingValues:", &__block_literal_global_24_5);

  if (v3
    && +[HFExecutionEnvironment isHomeRelatedProcess])
  {
    [v8 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_27_7];
  }
  return v8;
}

id __45__HFDebugStateDumpManager__performStateDump___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v3 = (*(void (**)(uint64_t))(a3 + 16))(a3);
  objc_super v4 = HFPrunePropertyList(v3);

  return v4;
}

void __45__HFDebugStateDumpManager__performStateDump___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  id v6 = HFLogForCategory(0x41uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "State dump %@:", (uint8_t *)&v7, 0xCu);
  }

  _HFLogStateDumpNode(v5, &stru_26C081158, 0);
}

- (void)_writeStateDump
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (+[HFUtilities isInternalInstall])
  {
    BOOL v3 = HFLogForCategory(0x41uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [MEMORY[0x263F086E0] mainBundle];
      id v5 = [v4 bundleIdentifier];
      *(_DWORD *)buf = 138412290;
      id v24 = v5;
      _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to write state dump from %@", buf, 0xCu);
    }
    id v6 = [MEMORY[0x263F08850] defaultManager];
    int v7 = [(HFDebugStateDumpManager *)self stateDumpHandlersByName];
    id v8 = objc_msgSend(v7, "na_dictionaryByMappingValues:", &__block_literal_global_35_0);

    uint64_t v9 = [MEMORY[0x263F086E0] mainBundle];
    int v10 = [v9 bundleIdentifier];

    id v11 = objc_alloc_init(MEMORY[0x263F08790]);
    [v11 setDateFormat:@"MM-dd-yyyy_HH:mm:ss"];
    __int16 v12 = [MEMORY[0x263EFF910] now];
    id v13 = [v11 stringFromDate:v12];

    __int16 v14 = [NSString stringWithFormat:@"home_state_dump_%@_%@.plist", v10, v13];
    if ([v6 fileExistsAtPath:@"/var/mobile/Library/Caches/com.apple.home"])
    {
      id v15 = 0;
    }
    else
    {
      id v22 = 0;
      [v6 createDirectoryAtPath:@"/var/mobile/Library/Caches/com.apple.home" withIntermediateDirectories:1 attributes:0 error:&v22];
      id v15 = v22;
      if (v15)
      {
        __int16 v16 = HFLogForCategory(0x41uLL);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v15;
          _os_log_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEFAULT, "State dump Directory Creation Error: %@", buf, 0xCu);
        }
      }
    }
    uint64_t v17 = [NSURL fileURLWithPath:@"/var/mobile/Library/Caches/com.apple.home" isDirectory:1 relativeToURL:0];
    uint64_t v18 = [v17 URLByAppendingPathComponent:v14];
    id v21 = v15;
    [v8 writeToURL:v18 error:&v21];
    id v19 = v21;

    if (v19)
    {
      v20 = HFLogForCategory(0x41uLL);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v19;
        _os_log_impl(&dword_20B986000, v20, OS_LOG_TYPE_DEFAULT, "State dump Write Error: %@", buf, 0xCu);
      }
    }
  }
}

id __42__HFDebugStateDumpManager__writeStateDump__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v3 = (*(void (**)(uint64_t))(a3 + 16))(a3);
  id v4 = HFPrunePropertyList(v3);

  return v4;
}

- (OS_dispatch_queue)stateHandlerQueue
{
  return self->_stateHandlerQueue;
}

- (int)logStateDumpNotifyToken
{
  return self->_logStateDumpNotifyToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateDumpHandlersByName, 0);
  objc_storeStrong((id *)&self->_stateHandlerQueue, 0);
}

@end