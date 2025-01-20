@interface HFHomeSettingsVisibilityArbitrator
+ (id)homeManagerConfigurationWithExpandedOptions:(BOOL)a3;
+ (void)initialize;
- (BOOL)homesConfigured;
- (HFHomeSettingsVisibilityArbitrator)init;
- (id)visibilityStateChangeHandler;
- (int)homeKitPreferencesChangeNotifyToken;
- (unint64_t)homeAppInstallState;
- (unint64_t)visibilityState;
- (void)_queryHomeAppInstallStateWithCompletion:(id)a3;
- (void)_reloadVisibilityStateIncludingInstallState:(BOOL)a3;
- (void)_startListeningForManagedConfigurationChanges;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)homeManager:(id)a3 didUpdateThisDeviceIsResidentCapable:(BOOL)a4;
- (void)reloadVisibilityState;
- (void)setHomeAppInstallState:(unint64_t)a3;
- (void)setHomeKitPreferencesChangeNotifyToken:(int)a3;
- (void)setHomesConfigured:(BOOL)a3;
- (void)setVisibilityState:(unint64_t)a3;
- (void)setVisibilityStateChangeHandler:(id)a3;
@end

@implementation HFHomeSettingsVisibilityArbitrator

+ (id)homeManagerConfigurationWithExpandedOptions:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 4075;
  }
  else {
    uint64_t v3 = 0;
  }
  v4 = (void *)[objc_alloc(MEMORY[0x263F0E5A8]) initWithOptions:v3 cachePolicy:1];
  [v4 setDiscretionary:1];
  [v4 setAdaptive:1];
  return v4;
}

+ (void)initialize
{
  id v2 = [a1 homeManagerConfigurationWithExpandedOptions:0];
  +[HFHomeKitDispatcher setConfiguration:v2];
}

- (HFHomeSettingsVisibilityArbitrator)init
{
  v15.receiver = self;
  v15.super_class = (Class)HFHomeSettingsVisibilityArbitrator;
  id v2 = [(HFHomeSettingsVisibilityArbitrator *)&v15 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_visibilityState = 0;
    v4 = [MEMORY[0x263F01880] defaultWorkspace];
    [v4 addObserver:v3];

    v5 = +[HFHomeKitDispatcher sharedDispatcher];
    [v5 addHomeManagerObserver:v3];

    objc_initWeak(&location, v3);
    v6 = (const char *)*MEMORY[0x263F0CBB8];
    v7 = MEMORY[0x263EF83A0];
    id v8 = MEMORY[0x263EF83A0];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __42__HFHomeSettingsVisibilityArbitrator_init__block_invoke;
    handler[3] = &unk_26408DD70;
    objc_copyWeak(&v13, &location);
    notify_register_dispatch(v6, &v3->_homeKitPreferencesChangeNotifyToken, v7, handler);

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __42__HFHomeSettingsVisibilityArbitrator_init__block_invoke_2;
    v10[3] = &unk_26408E550;
    objc_copyWeak(&v11, &location);
    [(HFHomeSettingsVisibilityArbitrator *)v3 _queryHomeAppInstallStateWithCompletion:v10];
    [(HFHomeSettingsVisibilityArbitrator *)v3 _startListeningForManagedConfigurationChanges];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __42__HFHomeSettingsVisibilityArbitrator_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadVisibilityStateIncludingInstallState:0];
}

void __42__HFHomeSettingsVisibilityArbitrator_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadVisibilityStateIncludingInstallState:0];
}

- (void)dealloc
{
  notify_cancel([(HFHomeSettingsVisibilityArbitrator *)self homeKitPreferencesChangeNotifyToken]);
  v3.receiver = self;
  v3.super_class = (Class)HFHomeSettingsVisibilityArbitrator;
  [(HFHomeSettingsVisibilityArbitrator *)&v3 dealloc];
}

- (void)setVisibilityState:(unint64_t)a3
{
  if (self->_visibilityState != a3)
  {
    self->_visibilityState = a3;
    v5 = [(HFHomeSettingsVisibilityArbitrator *)self visibilityStateChangeHandler];

    if (v5)
    {
      v6 = [(HFHomeSettingsVisibilityArbitrator *)self visibilityStateChangeHandler];
      v6[2](v6, a3);
    }
  }
}

- (void)reloadVisibilityState
{
}

- (void)_reloadVisibilityStateIncludingInstallState:(BOOL)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (a3)
  {
    objc_initWeak((id *)location, self);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __82__HFHomeSettingsVisibilityArbitrator__reloadVisibilityStateIncludingInstallState___block_invoke;
    v17[3] = &unk_26408E550;
    objc_copyWeak(&v18, (id *)location);
    [(HFHomeSettingsVisibilityArbitrator *)self _queryHomeAppInstallStateWithCompletion:v17];
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)location);
    return;
  }
  [(HFHomeSettingsVisibilityArbitrator *)self setHomesConfigured:CFPreferencesGetAppBooleanValue(@"kHomesConfigured", @"com.apple.homed", 0) != 0];
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"kIncomingInvitesPresent", @"com.apple.homed", 0);
  int v6 = CFPreferencesGetAppBooleanValue(@"kDisplayResetButton", @"com.apple.HomeSettings", 0);
  v7 = HFLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    v9 = NSStringFromSelector(a2);
    *(_DWORD *)id location = 138413314;
    *(void *)&location[4] = v8;
    __int16 v20 = 2112;
    v21 = v9;
    __int16 v22 = 1024;
    BOOL v23 = [(HFHomeSettingsVisibilityArbitrator *)self homesConfigured];
    __int16 v24 = 1024;
    BOOL v25 = AppBooleanValue != 0;
    __int16 v26 = 1024;
    BOOL v27 = v6 != 0;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ homesConfigured: %{BOOL}d invitesExist: %{BOOL}d displayResetButton: %{BOOL}d", location, 0x28u);
  }
  if (!v6)
  {
    BOOL v11 = [(HFHomeSettingsVisibilityArbitrator *)self homeAppInstallState] == 2;
    BOOL v12 = [(HFHomeSettingsVisibilityArbitrator *)self homesConfigured];
    if (v11)
    {
      if (AppBooleanValue) {
        int v13 = 1;
      }
      else {
        int v13 = v12;
      }
      if (v13 != 1)
      {
        uint64_t v10 = 2;
        goto LABEL_22;
      }
      v14 = [(id)objc_opt_class() homeManagerConfigurationWithExpandedOptions:1];
      objc_super v15 = +[HFHomeKitDispatcher sharedDispatcher];
      [v15 updateHomeManagerConfiguration:v14];

      uint64_t v10 = 1;
    }
    else
    {
      if (!v12)
      {
        uint64_t v10 = 0;
        goto LABEL_22;
      }
      v16 = +[HFHomeKitDispatcher sharedDispatcher];
      v14 = [v16 homeManager];

      if (v14)
      {
        if ([v14 isThisDeviceResidentCapable]) {
          uint64_t v10 = 1;
        }
        else {
          uint64_t v10 = 2;
        }
      }
      else
      {
        uint64_t v10 = 0;
      }
    }

    goto LABEL_22;
  }
  uint64_t v10 = 1;
LABEL_22:
  [(HFHomeSettingsVisibilityArbitrator *)self setVisibilityState:v10];
}

void __82__HFHomeSettingsVisibilityArbitrator__reloadVisibilityStateIncludingInstallState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadVisibilityStateIncludingInstallState:0];
}

- (void)_startListeningForManagedConfigurationChanges
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__HFHomeSettingsVisibilityArbitrator__startListeningForManagedConfigurationChanges__block_invoke_2;
  block[3] = &unk_264098FC0;
  id v3 = &__block_literal_global_191;
  if (_startListeningForManagedConfigurationChanges_once != -1) {
    dispatch_once(&_startListeningForManagedConfigurationChanges_once, block);
  }
}

uint64_t __83__HFHomeSettingsVisibilityArbitrator__startListeningForManagedConfigurationChanges__block_invoke()
{
  return CFPreferencesSynchronize(@"com.apple.HomeSettings", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
}

void __83__HFHomeSettingsVisibilityArbitrator__startListeningForManagedConfigurationChanges__block_invoke_2(uint64_t a1)
{
  id v2 = dispatch_get_global_queue(17, 0);
  notify_register_dispatch("com.apple.ManagedConfiguration.profileListChanged", (int *)&_startListeningForManagedConfigurationChanges_token, v2, *(notify_handler_t *)(a1 + 32));
}

- (void)_queryHomeAppInstallStateWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__HFHomeSettingsVisibilityArbitrator__queryHomeAppInstallStateWithCompletion___block_invoke;
  block[3] = &unk_264093660;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __78__HFHomeSettingsVisibilityArbitrator__queryHomeAppInstallStateWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F01868] applicationProxyForIdentifier:@"com.apple.Home"];
  id v3 = [v2 appState];
  char v4 = [v3 isInstalled];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__HFHomeSettingsVisibilityArbitrator__queryHomeAppInstallStateWithCompletion___block_invoke_2;
  block[3] = &unk_26409A068;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  char v8 = v4;
  id v6 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v7);
}

uint64_t __78__HFHomeSettingsVisibilityArbitrator__queryHomeAppInstallStateWithCompletion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = 2;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setHomeAppInstallState:v2];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__HFHomeSettingsVisibilityArbitrator_applicationsDidUninstall___block_invoke;
  v6[3] = &unk_26408D450;
  id v7 = v4;
  char v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __63__HFHomeSettingsVisibilityArbitrator_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) indexOfObjectPassingTest:&__block_literal_global_26_3];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 40) setHomeAppInstallState:2];
    id v3 = *(void **)(a1 + 40);
    return [v3 _reloadVisibilityStateIncludingInstallState:0];
  }
  return result;
}

uint64_t __63__HFHomeSettingsVisibilityArbitrator_applicationsDidUninstall___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 applicationIdentifier];
  uint64_t v3 = [v2 isEqualToString:@"com.apple.Home"];

  return v3;
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__HFHomeSettingsVisibilityArbitrator_applicationsDidInstall___block_invoke;
  v6[3] = &unk_26408D450;
  id v7 = v4;
  char v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __61__HFHomeSettingsVisibilityArbitrator_applicationsDidInstall___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) indexOfObjectPassingTest:&__block_literal_global_28_6];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 40) setHomeAppInstallState:1];
    uint64_t v3 = *(void **)(a1 + 40);
    return [v3 _reloadVisibilityStateIncludingInstallState:0];
  }
  return result;
}

uint64_t __61__HFHomeSettingsVisibilityArbitrator_applicationsDidInstall___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 applicationIdentifier];
  uint64_t v3 = [v2 isEqualToString:@"com.apple.Home"];

  return v3;
}

- (void)homeManager:(id)a3 didUpdateThisDeviceIsResidentCapable:(BOOL)a4
{
}

- (unint64_t)visibilityState
{
  return self->_visibilityState;
}

- (id)visibilityStateChangeHandler
{
  return self->_visibilityStateChangeHandler;
}

- (void)setVisibilityStateChangeHandler:(id)a3
{
}

- (BOOL)homesConfigured
{
  return self->_homesConfigured;
}

- (void)setHomesConfigured:(BOOL)a3
{
  self->_homesConfigured = a3;
}

- (unint64_t)homeAppInstallState
{
  return self->_homeAppInstallState;
}

- (void)setHomeAppInstallState:(unint64_t)a3
{
  self->_homeAppInstallState = a3;
}

- (int)homeKitPreferencesChangeNotifyToken
{
  return self->_homeKitPreferencesChangeNotifyToken;
}

- (void)setHomeKitPreferencesChangeNotifyToken:(int)a3
{
  self->_homeKitPreferencesChangeNotifyToken = a3;
}

- (void).cxx_destruct
{
}

@end