@interface HFHomeAppInstallStateArbiter
+ (HFHomeAppInstallStateArbiter)sharedInstance;
- (BOOL)_fastPath_isHomeAppInstalled;
- (HFHomeAppInstallStateArbiter)init;
- (NAFuture)homeAppInstalledFuture;
- (NSHashTable)observers;
- (NSURL)homeAppBundleURL;
- (void)_applications:(id)a3 didInstall:(BOOL)a4;
- (void)addObserver:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsWillUninstall:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setHomeAppInstalledFuture:(id)a3;
@end

@implementation HFHomeAppInstallStateArbiter

+ (HFHomeAppInstallStateArbiter)sharedInstance
{
  if (_MergedGlobals_321 != -1) {
    dispatch_once(&_MergedGlobals_321, &__block_literal_global_3_34);
  }
  v2 = (void *)qword_26AB2FE40;
  return (HFHomeAppInstallStateArbiter *)v2;
}

- (NAFuture)homeAppInstalledFuture
{
  homeAppInstalledFuture = self->_homeAppInstalledFuture;
  if (!homeAppInstalledFuture)
  {
    v4 = (void *)MEMORY[0x263F58190];
    v5 = [MEMORY[0x263F581B8] globalAsyncScheduler];
    v6 = [v4 futureWithBlock:&__block_literal_global_9_12 scheduler:v5];
    v7 = [MEMORY[0x263F581B8] mainThreadScheduler];
    v8 = [v6 reschedule:v7];
    v9 = self->_homeAppInstalledFuture;
    self->_homeAppInstalledFuture = v8;

    homeAppInstalledFuture = self->_homeAppInstalledFuture;
  }
  return homeAppInstalledFuture;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeAppInstallStateArbiter *)self observers];
  [v5 addObject:v4];
}

- (NSHashTable)observers
{
  return self->_observers;
}

uint64_t __46__HFHomeAppInstallStateArbiter_sharedInstance__block_invoke_2()
{
  v0 = objc_alloc_init(HFHomeAppInstallStateArbiter);
  uint64_t v1 = qword_26AB2FE40;
  qword_26AB2FE40 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFHomeAppInstallStateArbiter)init
{
  v7.receiver = self;
  v7.super_class = (Class)HFHomeAppInstallStateArbiter;
  v2 = [(HFHomeAppInstallStateArbiter *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    if ([(HFHomeAppInstallStateArbiter *)v2 _fastPath_isHomeAppInstalled])
    {
      id v5 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA88]];
      [(HFHomeAppInstallStateArbiter *)v2 setHomeAppInstalledFuture:v5];
    }
    else
    {
      id v5 = [MEMORY[0x263F01880] defaultWorkspace];
      [v5 addObserver:v2];
    }
  }
  return v2;
}

- (void)setHomeAppInstalledFuture:(id)a3
{
}

- (BOOL)_fastPath_isHomeAppInstalled
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];
  id v4 = HFPlatformSpecificHomeAppBundleID();
  int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    v6 = HFLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "We are running in Home.app; using fast path for install check",
        buf,
        2u);
    }
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    v8 = [MEMORY[0x263F01888] bundleProxyForCurrentProcess];
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    v6 = v9;

    if (!v6) {
      goto LABEL_13;
    }
    v10 = [v6 containingBundle];
    v11 = [v10 bundleIdentifier];
    v12 = HFPlatformSpecificHomeAppBundleID();
    int v13 = [v11 isEqualToString:v12];

    if (v13)
    {
      v14 = HFLogForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "We are contained in Home.app's bundle; using fast path for install check",
          v17,
          2u);
      }
      BOOL v7 = 1;
    }
    else
    {
LABEL_13:
      v14 = HFLogForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "Fast path for Home.app install check is not available", v16, 2u);
      }
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFHomeAppInstallStateArbiter *)self observers];
  [v5 removeObject:v4];
}

void __54__HFHomeAppInstallStateArbiter_homeAppInstalledFuture__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F01868];
  id v3 = a2;
  id v4 = HFPlatformSpecificHomeAppBundleID();
  id v5 = [v2 applicationProxyForIdentifier:v4];

  v6 = [v5 appState];
  uint64_t v7 = [v6 isInstalled];

  v8 = HFLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v7;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Initializing Home.app install state to: %{BOOL}d", (uint8_t *)v10, 8u);
  }

  v9 = [NSNumber numberWithBool:v7];
  [v3 finishWithResult:v9];
}

- (void)_applications:(id)a3 didInstall:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (objc_msgSend(a3, "na_any:", &__block_literal_global_15_13))
  {
    v6 = HFLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v10 = v4;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Home.app install state changed: %d", buf, 8u);
    }

    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __57__HFHomeAppInstallStateArbiter__applications_didInstall___block_invoke_16;
    v7[3] = &unk_26409A760;
    v7[4] = self;
    BOOL v8 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

uint64_t __57__HFHomeAppInstallStateArbiter__applications_didInstall___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __HFHomeApplicationBundleIdentifiers_block_invoke();
  BOOL v4 = [v2 bundleIdentifier];

  uint64_t v5 = [v3 containsObject:v4];
  return v5;
}

void __57__HFHomeAppInstallStateArbiter__applications_didInstall___block_invoke_16(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F58190];
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  BOOL v4 = [v2 futureWithResult:v3];
  [*(id *)(a1 + 32) setHomeAppInstalledFuture:v4];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) installStateArbiter:*(void *)(a1 + 32) installStateDidChange:*(unsigned __int8 *)(a1 + 40)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSURL)homeAppBundleURL
{
  id v2 = (void *)MEMORY[0x263F01868];
  id v3 = HFPlatformSpecificHomeAppBundleID();
  BOOL v4 = [v2 applicationProxyForIdentifier:v3];

  uint64_t v5 = [v4 bundleURL];

  return (NSURL *)v5;
}

- (void)applicationsWillUninstall:(id)a3
{
}

- (void)applicationsDidInstall:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_homeAppInstalledFuture, 0);
}

@end