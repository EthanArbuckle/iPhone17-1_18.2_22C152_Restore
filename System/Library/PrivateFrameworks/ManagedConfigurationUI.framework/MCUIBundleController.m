@interface MCUIBundleController
+ (id)sharedInstance;
- (BOOL)_swizzlingFromSpecifier:(id)a3;
- (BOOL)_updateTopLevelSpecifier;
- (MCUIBundleController)initWithParentListController:(id)a3 dataManager:(id)a4;
- (MCUIBundleController)initWithParentListController:(id)a3 properties:(id)a4;
- (MCUIDataManagerProtocol)dataManager;
- (OS_dispatch_queue)queue;
- (PSListController)parentController;
- (PSSpecifier)specifier;
- (id)_detailsFromSpecifier:(id)a3;
- (id)_initWithDataManager:(id)a3;
- (id)specifiersWithSpecifier:(id)a3;
- (void)_mcuiUpdated;
- (void)_reloadTopLevelSpecifier;
- (void)_sharedInitWithDataManager:(id)a3;
- (void)dealloc;
- (void)setDataManager:(id)a3;
- (void)setParentController:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)unload;
@end

@implementation MCUIBundleController

- (id)_detailsFromSpecifier:(id)a3
{
  v3 = [a3 userInfo];
  v4 = [v3 objectForKey:@"kMCUISpecifierDetails"];

  return v4;
}

- (MCUIBundleController)initWithParentListController:(id)a3 properties:(id)a4
{
  id v5 = a3;
  v6 = +[MCUIBundleController sharedInstance];
  v7 = [v6 queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__MCUIBundleController_initWithParentListController_properties___block_invoke;
  v13[3] = &unk_1E6EAD458;
  id v8 = v6;
  id v14 = v8;
  id v15 = v5;
  id v9 = v5;
  dispatch_async_and_wait(v7, v13);

  v10 = v15;
  v11 = (MCUIBundleController *)v8;

  return v11;
}

- (id)specifiersWithSpecifier:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MCUIBundleController *)self dataManager];
  int v6 = [v5 isDeviceManagementHidden];

  if (v6)
  {
    NSLog(&cfstr_McuiBundleCont_1.isa);
  }
  else
  {
    if ([(MCUIBundleController *)self _updateTopLevelSpecifier]
      || [(MCUIBundleController *)self _swizzlingFromSpecifier:v4])
    {
      v7 = [(MCUIBundleController *)self specifier];
      id v8 = [v7 name];
      id v9 = [(MCUIBundleController *)self specifier];
      v10 = [v9 userInfo];
      NSLog(&cfstr_McuiBundleCont_2.isa, v8, v10);

      v11 = [(MCUIBundleController *)self specifier];
      v14[0] = v11;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

      goto LABEL_8;
    }
    NSLog(&cfstr_McuiBundleCont_3.isa);
  }
  v12 = 0;
LABEL_8:

  return v12;
}

- (id)_initWithDataManager:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCUIBundleController;
  id v5 = [(MCUIBundleController *)&v9 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("MCUIBundleController_dispatch_queue", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    [(MCUIBundleController *)v5 _sharedInitWithDataManager:v4];
  }

  return v5;
}

- (PSSpecifier)specifier
{
  v3 = [(MCUIBundleController *)self dataManager];
  char v4 = [v3 isDeviceManagementHidden];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    specifier = self->_specifier;
    if (!specifier)
    {
      v7 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:self set:0 get:sel__detailsFromSpecifier_ detail:objc_opt_class() cell:2 edit:0];
      id v8 = self->_specifier;
      self->_specifier = v7;

      [(PSSpecifier *)self->_specifier setProperty:*MEMORY[0x1E4F74280] forKey:*MEMORY[0x1E4F93188]];
      specifier = self->_specifier;
    }
    id v5 = specifier;
  }
  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

- (MCUIDataManagerProtocol)dataManager
{
  return self->_dataManager;
}

- (void)dealloc
{
  NSLog(&cfstr_McuiBundleCont_0.isa, a2);
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)MCUIBundleController;
  [(MCUIBundleController *)&v5 dealloc];
}

void __38__MCUIBundleController_sharedInstance__block_invoke()
{
  v0 = [MCUIBundleController alloc];
  id v3 = +[MCUIDataManager sharedManager];
  uint64_t v1 = [(MCUIBundleController *)v0 _initWithDataManager:v3];
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v1;
}

id __64__MCUIBundleController_initWithParentListController_properties___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setParentController:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 40);
  id v3 = (id *)(*(void *)(a1 + 32) + (int)*MEMORY[0x1E4F92EE8]);
  return objc_storeWeak(v3, v2);
}

- (MCUIBundleController)initWithParentListController:(id)a3 dataManager:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MCUIBundleController;
  v7 = [(MCUIBundleController *)&v10 initWithParentListController:a3];
  id v8 = v7;
  if (v7) {
    [(MCUIBundleController *)v7 _sharedInitWithDataManager:v6];
  }

  return v8;
}

- (void)_sharedInitWithDataManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataManager, a3);
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel__mcuiUpdated name:@"kMCUIUpdatedNotification" object:0];
}

- (void)unload
{
  NSLog(&cfstr_McuiBundleCont.isa, a2);
  id v3 = [(MCUIBundleController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__MCUIBundleController_unload__block_invoke;
  block[3] = &unk_1E6EAD1D0;
  block[4] = self;
  dispatch_async_and_wait(v3, block);
}

id __30__MCUIBundleController_unload__block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 24), 0);
}

- (BOOL)_swizzlingFromSpecifier:(id)a3
{
  id v3 = [a3 propertyForKey:@"URLDictionary"];
  NSLog(&cfstr_McuiBundleCont_4.isa, v3);
  if (v3)
  {
    char v4 = [v3 objectForKey:@"path"];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 pathComponents];
      if ([v6 count])
      {
        v7 = [v6 objectAtIndex:0];
        char v8 = [v7 isEqualToString:*MEMORY[0x1E4F74280]];
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      NSLog(&cfstr_McuiBundleCont_5.isa);
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)_updateTopLevelSpecifier
{
  id v3 = +[MCUIWatchManager shared];

  if (v3)
  {
    char v4 = +[MCUIWatchManager shared];
    uint64_t v5 = [v4 profileCount];

    if (v5 == 1) {
      id v6 = @"SINGULAR_BLOBS_DESIGNATION";
    }
    else {
      id v6 = @"PLURAL_BLOBS_DESIGNATION";
    }
    v7 = MCUILocalizedString(v6);
    char v8 = (void *)MEMORY[0x1E4F28EE0];
    objc_super v9 = [NSNumber numberWithInteger:v5];
    objc_super v10 = [v8 localizedStringFromNumber:v9 numberStyle:0];

    BOOL v11 = v5 > 0;
  }
  else
  {
    if (ne_session_dns_settings_configs_present()) {
      v12 = @"DEVICE_MANAGEMENT_VPN_DNS";
    }
    else {
      v12 = @"DEVICE_MANAGEMENT_VPN";
    }
    v7 = MCUILocalizedString(v12);
    objc_super v10 = 0;
    BOOL v11 = 1;
  }
  v13 = [(MCUIBundleController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MCUIBundleController__updateTopLevelSpecifier__block_invoke;
  block[3] = &unk_1E6EAD610;
  block[4] = self;
  id v18 = v7;
  id v19 = v10;
  id v14 = v10;
  id v15 = v7;
  dispatch_async_and_wait(v13, block);

  return v11;
}

void __48__MCUIBundleController__updateTopLevelSpecifier__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) specifier];
  [v2 setName:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) specifier];
  char v4 = [v3 userInfo];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v9 = v6;

  if (*(void *)(a1 + 48)) {
    v7 = *(__CFString **)(a1 + 48);
  }
  else {
    v7 = &stru_1F40ADA78;
  }
  [v9 setObject:v7 forKey:@"kMCUISpecifierDetails"];
  char v8 = [*(id *)(a1 + 32) specifier];
  [v8 setUserInfo:v9];
}

- (void)_mcuiUpdated
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __36__MCUIBundleController__mcuiUpdated__block_invoke;
  v2[3] = &unk_1E6EAD1F8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __36__MCUIBundleController__mcuiUpdated__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 3);

    if (v2)
    {
      id v3 = [v5 dataManager];
      int v4 = [v3 isDeviceManagementHidden];

      if (v4) {
        NSLog(&cfstr_McuiBundleCont_7.isa);
      }
      else {
        [v5 _reloadTopLevelSpecifier];
      }
    }
    else
    {
      NSLog(&cfstr_McuiBundleCont_6.isa);
    }
    WeakRetained = v5;
  }
}

- (void)_reloadTopLevelSpecifier
{
  [(MCUIBundleController *)self _updateTopLevelSpecifier];
  uint64_t v3 = *MEMORY[0x1E4F74280];
  p_parentController = &self->_parentController;
  id WeakRetained = objc_loadWeakRetained((id *)p_parentController);
  id v6 = [WeakRetained specifierForID:v3];

  if (v6)
  {
    NSLog(&cfstr_McuiBundleCont_8.isa, v3);
    id v7 = objc_loadWeakRetained((id *)p_parentController);
    [v7 reloadSpecifierID:v3 animated:1];
  }
  else
  {
    NSLog(&cfstr_McuiBundleCont_9.isa, v3);
    id v7 = objc_loadWeakRetained((id *)p_parentController);
    [v7 reloadSpecifiers];
  }
}

- (void)setDataManager:(id)a3
{
}

- (PSListController)parentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  return (PSListController *)WeakRetained;
}

- (void)setParentController:(id)a3
{
}

- (void)setSpecifier:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_destroyWeak((id *)&self->_parentController);
  objc_storeStrong((id *)&self->_dataManager, 0);
}

@end