@interface BRObservableFile
+ (id)observerForKey:(id)a3 onFileURL:(id)a4;
+ (void)_applicationDidBecomeActive:(id)a3;
+ (void)_applicationWillResignActive:(id)a3;
+ (void)_deregisterInstance:(id)a3;
+ (void)_registerForApplicationLifecycleNotifications;
+ (void)_registerInstance:(id)a3;
- (BRObservableFile)initWithKey:(id)a3 fileURL:(id)a4;
- (NSString)key;
- (_BRObservableFilePresenter)presenter;
- (id)addObserverBlock:(id)a3;
- (void)_presenterDidChange;
- (void)dealloc;
- (void)setKey:(id)a3;
- (void)setPresenter:(id)a3;
@end

@implementation BRObservableFile

+ (void)_registerForApplicationLifecycleNotifications
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__BRObservableFile__registerForApplicationLifecycleNotifications__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_registerForApplicationLifecycleNotifications_onceToken != -1) {
    dispatch_once(&_registerForApplicationLifecycleNotifications_onceToken, block);
  }
}

void __65__BRObservableFile__registerForApplicationLifecycleNotifications__block_invoke(uint64_t a1)
{
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:*(void *)(a1 + 32) selector:sel__applicationWillResignActive_ name:*MEMORY[0x263F1D0D8] object:0];
  [v6 addObserver:*(void *)(a1 + 32) selector:sel__applicationDidBecomeActive_ name:*MEMORY[0x263F1D038] object:0];
  id v2 = objc_alloc(MEMORY[0x263F088B0]);
  v3 = [MEMORY[0x263F08A90] pointerFunctionsWithOptions:5];
  uint64_t v4 = [v2 initWithPointerFunctions:v3 capacity:0];
  v5 = (void *)_BRObservableFileInstances;
  _BRObservableFileInstances = v4;
}

+ (void)_registerInstance:(id)a3
{
  id v4 = a3;
  id v3 = (id)_BRObservableFileInstances;
  objc_sync_enter(v3);
  [(id)_BRObservableFileInstances addObject:v4];
  objc_sync_exit(v3);
}

+ (void)_deregisterInstance:(id)a3
{
  id v4 = a3;
  id v3 = (id)_BRObservableFileInstances;
  objc_sync_enter(v3);
  [(id)_BRObservableFileInstances removeObject:v4];
  objc_sync_exit(v3);
}

+ (void)_applicationWillResignActive:(id)a3
{
  objc_msgSend(MEMORY[0x263F08AB0], "processInfo", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 performExpiringActivityWithReason:@"Deregister file presenters" usingBlock:&__block_literal_global_5];
}

void __49__BRObservableFile__applicationWillResignActive___block_invoke(uint64_t a1, char a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v2 = cdui_default_log();
    id v3 = v2;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      __49__BRObservableFile__applicationWillResignActive___block_invoke_cold_1(v2);
      id v3 = v2;
    }
  }
  else
  {
    v15 = (id)_BRObservableFileInstances;
    objc_sync_enter(v15);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = (id)_BRObservableFileInstances;
    uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v27 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v18 != v5) {
            objc_enumerationMutation(obj);
          }
          v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v8 = cdui_default_log();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            id v9 = (id)objc_opt_class();
            v10 = [v7 presenter];
            v11 = [v10 presentedItemURL];
            v12 = [v11 path];
            *(_DWORD *)buf = 138412802;
            id v22 = v9;
            __int16 v23 = 2048;
            v24 = v7;
            __int16 v25 = 2112;
            v26 = v12;
            _os_log_impl(&dword_22CA47000, v8, OS_LOG_TYPE_INFO, "[INFO] Removing (<%@: %p>, %@) as file presenter due to application deactivation", buf, 0x20u);
          }
          v13 = (void *)MEMORY[0x263F08830];
          v14 = [v7 presenter];
          [v13 removeFilePresenter:v14];
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v27 count:16];
      }
      while (v4);
    }

    id v3 = v15;
    objc_sync_exit(v15);
  }
}

+ (void)_applicationDidBecomeActive:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = (id)_BRObservableFileInstances;
  objc_sync_enter(v15);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = (id)_BRObservableFileInstances;
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v18 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v7 = cdui_default_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          id v8 = (id)objc_opt_class();
          id v9 = objc_msgSend(v6, "presenter", v14);
          v10 = [v9 presentedItemURL];
          v11 = [v10 path];
          *(_DWORD *)buf = 138412802;
          id v22 = v8;
          __int16 v23 = 2048;
          v24 = v6;
          __int16 v25 = 2112;
          v26 = v11;
          _os_log_impl(&dword_22CA47000, v7, OS_LOG_TYPE_INFO, "[INFO] Re-adding (<%@: %p>, %@) as file presenter due to application activation", buf, 0x20u);
        }
        v12 = (void *)MEMORY[0x263F08830];
        v13 = [v6 presenter];
        [v12 addFilePresenter:v13];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v3);
  }

  objc_sync_exit(v15);
}

+ (id)observerForKey:(id)a3 onFileURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithKey:v7 fileURL:v6];

  return v8;
}

- (BRObservableFile)initWithKey:(id)a3 fileURL:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)BRObservableFile;
  id v8 = [(BRObservableFile *)&v23 init];
  if (v8)
  {
    [(id)objc_opt_class() _registerForApplicationLifecycleNotifications];
    [(BRObservableFile *)v8 setKey:v6];
    id v9 = objc_opt_new();
    [(BRObservableFile *)v8 setPresenter:v9];

    v10 = [(BRObservableFile *)v8 presenter];
    [v10 setPresentedItemURL:v7];

    v11 = objc_opt_new();
    v12 = [(BRObservableFile *)v8 presenter];
    [v12 setPresentedItemOperationQueue:v11];

    v13 = [(BRObservableFile *)v8 presenter];
    [v13 setParent:v8];

    [(id)objc_opt_class() _registerInstance:v8];
    id v14 = (void *)MEMORY[0x263F08830];
    id v15 = [(BRObservableFile *)v8 presenter];
    [v14 addFilePresenter:v15];

    v16 = cdui_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      long long v17 = objc_opt_class();
      id v18 = v17;
      long long v19 = [(BRObservableFile *)v8 presenter];
      long long v20 = [v19 presentedItemURL];
      v21 = [v20 path];
      *(_DWORD *)buf = 138412802;
      __int16 v25 = v17;
      __int16 v26 = 2048;
      v27 = v8;
      __int16 v28 = 2112;
      v29 = v21;
      _os_log_impl(&dword_22CA47000, v16, OS_LOG_TYPE_INFO, "[INFO] Adding (<%@: %p>, %@) as file presenter", buf, 0x20u);
    }
    [(BRObservableFile *)v8 _presenterDidChange];
  }

  return v8;
}

- (id)addObserverBlock:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BRObservableFile;
  uint64_t v4 = [(BRObservableFile *)&v6 addObserverBlock:a3];
  [(BRObservableFile *)self _presenterDidChange];

  return v4;
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [(id)objc_opt_class() _deregisterInstance:self];
  uint64_t v3 = cdui_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = objc_opt_class();
    id v5 = v4;
    objc_super v6 = [(BRObservableFile *)self presenter];
    id v7 = [v6 presentedItemURL];
    id v8 = [v7 path];
    *(_DWORD *)buf = 138412802;
    v13 = v4;
    __int16 v14 = 2048;
    id v15 = self;
    __int16 v16 = 2112;
    long long v17 = v8;
    _os_log_impl(&dword_22CA47000, v3, OS_LOG_TYPE_INFO, "[INFO] Removing (<%@: %p>, %@) as file presenter due to dealloc", buf, 0x20u);
  }
  id v9 = (void *)MEMORY[0x263F08830];
  v10 = [(BRObservableFile *)self presenter];
  [v9 removeFilePresenter:v10];

  v11.receiver = self;
  v11.super_class = (Class)BRObservableFile;
  [(BRObservableFile *)&v11 dealloc];
}

- (void)_presenterDidChange
{
  key = self->_key;
  id v12 = [(BRObservableFile *)self presenter];
  uint64_t v4 = [v12 presentedItemURL];
  if (key)
  {
    id v5 = [(BRObservableFile *)self key];
    [v4 removeCachedResourceValueForKey:v5];

    objc_super v6 = [(BRObservableFile *)self presenter];
    id v7 = [v6 presentedItemURL];
    id v14 = 0;
    id v8 = [(BRObservableFile *)self key];
    id v13 = 0;
    int v9 = [v7 getPromisedItemResourceValue:&v14 forKey:v8 error:&v13];
    id v10 = v14;
    id v11 = v13;

    if (v9) {
      [(BRObservableFile *)self receiveObservedValue:v10];
    }
    else {
      [(BRObservableFile *)self receiveObservedError:v11];
    }
  }
  else
  {
    [(BRObservableFile *)self receiveObservedValue:v4];
  }
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (_BRObservableFilePresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenter, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

void __49__BRObservableFile__applicationWillResignActive___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22CA47000, log, OS_LOG_TYPE_FAULT, "[ERROR] Background activity for deregistering file presenters expired. This may result in the app being jetsamed while in the background.", v1, 2u);
}

@end