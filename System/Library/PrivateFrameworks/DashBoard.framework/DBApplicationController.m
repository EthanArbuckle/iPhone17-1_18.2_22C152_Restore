@interface DBApplicationController
+ (id)sharedInstance;
- (BOOL)preflightRequiredForApplication:(id)a3;
- (CARObserverHashTable)observers;
- (CRCarPlayAppPolicyEvaluator)appPolicyEvaluator;
- (DBAppProtectionCoordinator)appProtectionCoordinator;
- (DBApplication)autoSettingsApplication;
- (DBApplication)booksApplication;
- (DBApplication)calendarApplication;
- (DBApplication)carCameraApplication;
- (DBApplication)climateApplication;
- (DBApplication)homeApplication;
- (DBApplication)inCallServiceApplication;
- (DBApplication)mapsApplication;
- (DBApplication)messagesApplication;
- (DBApplication)musicApplication;
- (DBApplication)musicUIServiceApplication;
- (DBApplication)phoneApplication;
- (DBApplication)radioApplication;
- (DBApplication)settingsApplication;
- (DBApplication)siriApplication;
- (DBApplication)templateUIHostApplication;
- (DBApplication)voiceControlApplication;
- (DBApplication)wallpaperApplication;
- (DBApplicationController)init;
- (DBApplicationInfo)dashBoardAppInfo;
- (FBSApplicationLibrary)appLibrary;
- (NSArray)allApplications;
- (NSArray)allPlaceholders;
- (NSMutableDictionary)applicationsByBundleIdentifier;
- (NSMutableDictionary)placeholdersByBundleIdentifier;
- (PDCPreflightManager)preflightManager;
- (id)_lock_applicationWithBundleIdentifier:(id)a3;
- (id)applicationWithBundleIdentifier:(id)a3;
- (void)_didAddApplications:(id)a3;
- (void)_didAddPlaceholders:(id)a3;
- (void)_didCancelPlaceholders:(id)a3;
- (void)_didRemoveApplications:(id)a3;
- (void)_didReplaceApplications:(id)a3;
- (void)_loadApplicationWithInfo:(id)a3;
- (void)_loadApplications:(id)a3 removeApplications:(id)a4;
- (void)_removeApplicationWithBundleIdentifier:(id)a3;
- (void)_updatePolicyForApplication:(id)a3;
- (void)addObserver:(id)a3;
- (void)appProtectionCoordinator:(id)a3 didUpdateBundleIdentifiers:(id)a4;
- (void)removeObserver:(id)a3;
- (void)sessionDidConnect;
- (void)setAppPolicyEvaluator:(id)a3;
- (void)setAppProtectionCoordinator:(id)a3;
- (void)setPreflightManager:(id)a3;
@end

@implementation DBApplicationController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)sharedInstance___applicationController;
  return v2;
}

uint64_t __41__DBApplicationController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(DBApplicationController);
  uint64_t v1 = sharedInstance___applicationController;
  sharedInstance___applicationController = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (DBApplicationController)init
{
  v66[3] = *MEMORY[0x263EF8340];
  v64.receiver = self;
  v64.super_class = (Class)DBApplicationController;
  v2 = [(DBApplicationController *)&v64 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    applicationsByBundleIdentifier = v3->_applicationsByBundleIdentifier;
    v3->_applicationsByBundleIdentifier = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    placeholdersByBundleIdentifier = v3->_placeholdersByBundleIdentifier;
    v3->_placeholdersByBundleIdentifier = v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26E1A62A0];
    observers = v3->_observers;
    v3->_observers = (CARObserverHashTable *)v8;

    v10 = (CRCarPlayAppPolicyEvaluator *)objc_alloc_init(MEMORY[0x263F30E78]);
    appPolicyEvaluator = v3->_appPolicyEvaluator;
    v3->_appPolicyEvaluator = v10;

    [(CRCarPlayAppPolicyEvaluator *)v3->_appPolicyEvaluator setWantsGeoSupported];
    uint64_t v12 = [objc_alloc(MEMORY[0x263F610B0]) initWithTargetQueue:0];
    preflightManager = v3->_preflightManager;
    v3->_preflightManager = (PDCPreflightManager *)v12;

    if (_os_feature_enabled_impl())
    {
      v14 = objc_alloc_init(DBAppProtectionCoordinator);
      appProtectionCoordinator = v3->_appProtectionCoordinator;
      v3->_appProtectionCoordinator = v14;

      [(DBAppProtectionCoordinator *)v3->_appProtectionCoordinator addObserver:v3];
    }
    v16 = objc_opt_new();
    id v17 = objc_alloc_init(MEMORY[0x263F3F6D8]);
    [v17 setApplicationInfoClass:objc_opt_class()];
    [v17 setApplicationPlaceholderClass:objc_opt_class()];
    [v17 setAllowConcurrentLoading:1];
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __31__DBApplicationController_init__block_invoke;
    v62[3] = &unk_2649B5B00;
    id v43 = v16;
    id v63 = v43;
    [v17 setApplicationIdentityFilter:v62];
    v18 = (void *)[objc_alloc(MEMORY[0x263F3F6D0]) initWithConfiguration:v17];
    v66[0] = @"com.apple.CarPlayTemplateUIHost";
    v66[1] = @"com.apple.springboard";
    v66[2] = @"com.apple.commandandcontrol";
    v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:3];
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __31__DBApplicationController_init__block_invoke_2;
    v60[3] = &unk_2649B4FC8;
    id v19 = v18;
    id v61 = v19;
    [v44 enumerateObjectsUsingBlock:v60];
    objc_storeStrong((id *)&v3->_appLibrary, v18);
    v20 = FBSystemAppBundleID();
    uint64_t v21 = [v19 installedApplicationWithBundleIdentifier:v20];
    dashBoardAppInfo = v3->_dashBoardAppInfo;
    v3->_dashBoardAppInfo = (DBApplicationInfo *)v21;

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v23 = [(FBSApplicationLibrary *)v3->_appLibrary allPlaceholders];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v56 objects:v65 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v57 != v25) {
            objc_enumerationMutation(v23);
          }
          v27 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          v28 = v3->_placeholdersByBundleIdentifier;
          v29 = [v27 bundleIdentifier];
          [(NSMutableDictionary *)v28 setObject:v27 forKey:v29];
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v56 objects:v65 count:16];
      }
      while (v24);
    }

    v30 = DBLogForCategory(1uLL);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_22D6F0000, v30, OS_LOG_TYPE_DEFAULT, "[DBApplicationController] Loading initial applications", (uint8_t *)buf, 2u);
    }

    v31 = [v19 allInstalledApplications];
    [(DBApplicationController *)v3 _loadApplications:v31 removeApplications:0];

    objc_initWeak(buf, v3);
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __31__DBApplicationController_init__block_invoke_125;
    v53[3] = &unk_2649B5B28;
    objc_copyWeak(&v54, buf);
    uint64_t v32 = [v19 observeDidAddPlaceholdersWithBlock:v53];
    addedPlaceholdersToken = v3->_addedPlaceholdersToken;
    v3->_addedPlaceholdersToken = (FBSALOToken *)v32;

    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __31__DBApplicationController_init__block_invoke_3;
    v51[3] = &unk_2649B5B28;
    objc_copyWeak(&v52, buf);
    uint64_t v34 = [v19 observeDidCancelPlaceholdersWithBlock:v51];
    canceledPlaceholdersToken = v3->_canceledPlaceholdersToken;
    v3->_canceledPlaceholdersToken = (FBSALOToken *)v34;

    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __31__DBApplicationController_init__block_invoke_5;
    v49[3] = &unk_2649B5B28;
    objc_copyWeak(&v50, buf);
    uint64_t v36 = [v19 observeDidAddApplicationsWithBlock:v49];
    addedAppsToken = v3->_addedAppsToken;
    v3->_addedAppsToken = (FBSALOToken *)v36;

    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __31__DBApplicationController_init__block_invoke_7;
    v47[3] = &unk_2649B5B50;
    objc_copyWeak(&v48, buf);
    uint64_t v38 = [v19 observeDidReplaceApplicationsWithBlock:v47];
    replacedAppsToken = v3->_replacedAppsToken;
    v3->_replacedAppsToken = (FBSALOToken *)v38;

    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __31__DBApplicationController_init__block_invoke_9;
    v45[3] = &unk_2649B5B28;
    objc_copyWeak(&v46, buf);
    uint64_t v40 = [v19 observeDidRemoveApplicationsWithBlock:v45];
    removedAppsToken = v3->_removedAppsToken;
    v3->_removedAppsToken = (FBSALOToken *)v40;

    objc_destroyWeak(&v46);
    objc_destroyWeak(&v48);
    objc_destroyWeak(&v50);
    objc_destroyWeak(&v52);
    objc_destroyWeak(&v54);
    objc_destroyWeak(buf);
  }
  return v3;
}

uint64_t __31__DBApplicationController_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F30E68] requiredEntitlementKeys];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v11 = [v10 isEqualToString:@"com.apple.developer.carplay-protocols"];
        uint64_t v12 = [v3 entitlements];
        if (v11)
        {
          uint64_t v13 = objc_opt_class();
          v14 = [v12 objectForKey:v10 ofClass:v13 valuesOfClass:objc_opt_class()];
          int v15 = v14 != 0;
        }
        else
        {
          v14 = [v12 objectForKey:v10 ofClass:objc_opt_class()];
          int v15 = [v14 BOOLValue];
        }

        v7 |= v15;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }
  else
  {
    int v7 = 0;
  }
  v16 = *(void **)(a1 + 32);
  id v17 = [v3 bundleIdentifier];
  LODWORD(v16) = [v16 containsBundleIdentifier:v17];

  return v7 & (v16 ^ 1);
}

void __31__DBApplicationController_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F01878];
  id v4 = a2;
  id v6 = (id)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

  uint64_t v5 = [v6 applicationState];
  LODWORD(v4) = [v5 isValid];

  if (v4) {
    [*(id *)(a1 + 32) addApplicationRecord:v6];
  }
}

void __31__DBApplicationController_init__block_invoke_125(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__DBApplicationController_init__block_invoke_2_126;
  v5[3] = &unk_2649B49E0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __31__DBApplicationController_init__block_invoke_2_126(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didAddPlaceholders:*(void *)(a1 + 32)];
}

void __31__DBApplicationController_init__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__DBApplicationController_init__block_invoke_4;
  v5[3] = &unk_2649B49E0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __31__DBApplicationController_init__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didCancelPlaceholders:*(void *)(a1 + 32)];
}

void __31__DBApplicationController_init__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__DBApplicationController_init__block_invoke_6;
  v5[3] = &unk_2649B49E0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __31__DBApplicationController_init__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didAddApplications:*(void *)(a1 + 32)];
}

void __31__DBApplicationController_init__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__DBApplicationController_init__block_invoke_8;
  v5[3] = &unk_2649B49E0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __31__DBApplicationController_init__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didReplaceApplications:*(void *)(a1 + 32)];
}

void __31__DBApplicationController_init__block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__DBApplicationController_init__block_invoke_10;
  v5[3] = &unk_2649B49E0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __31__DBApplicationController_init__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didRemoveApplications:*(void *)(a1 + 32)];
}

- (NSArray)allApplications
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(DBApplicationController *)self applicationsByBundleIdentifier];
  uint64_t v5 = [v4 allValues];

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (NSArray)allPlaceholders
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(DBApplicationController *)self placeholdersByBundleIdentifier];
  uint64_t v5 = [v4 allValues];

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (id)applicationWithBundleIdentifier:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    id v6 = [(DBApplicationController *)self _lock_applicationWithBundleIdentifier:v5];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBApplicationController *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBApplicationController *)self observers];
  [v5 removeObserver:v4];
}

- (BOOL)preflightRequiredForApplication:(id)a3
{
  id v4 = a3;
  id v5 = [v4 info];
  id v6 = [v5 applicationIdentity];
  if (v6)
  {
    id v7 = [(DBApplicationController *)self preflightManager];
    uint64_t v8 = [v4 info];
    v9 = [v8 applicationIdentity];
    char v10 = [v7 requiresPreflightForApplication:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)sessionDidConnect
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = [(DBApplicationController *)self _appPolicyEvaluator];
  [v3 updateGeoSupported];

  long long v22 = [MEMORY[0x263EFF9C0] set];
  long long v21 = [MEMORY[0x263EFF9C0] set];
  id v4 = [(DBApplicationController *)self allApplications];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        char v10 = [v9 appPolicy];
        char v11 = [v10 applicationCategory];

        if ((v11 & 0x20) != 0)
        {
          os_unfair_lock_lock(&self->_lock);
          uint64_t v12 = [v9 appPolicy];
          int v13 = [v12 isCarPlaySupported];

          [(DBApplicationController *)self _updatePolicyForApplication:v9];
          v14 = [v9 appPolicy];
          int v15 = [v14 isCarPlaySupported];

          os_unfair_lock_unlock(&self->_lock);
          if (v13 != v15)
          {
            if (v13) {
              v16 = v21;
            }
            else {
              v16 = v22;
            }
            [v16 addObject:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }
  if ([v22 count] || objc_msgSend(v21, "count"))
  {
    id v17 = [(DBApplicationController *)self observers];
    v18 = (void *)[v22 copy];
    id v19 = [MEMORY[0x263EFFA08] set];
    long long v20 = (void *)[v21 copy];
    [v17 applicationController:self addedApplications:v18 updatedApplications:v19 removedApplications:v20];
  }
}

- (DBApplication)booksApplication
{
  return (DBApplication *)[(DBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.iBooks"];
}

- (DBApplication)calendarApplication
{
  return (DBApplication *)[(DBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.mobilecal"];
}

- (DBApplication)homeApplication
{
  return (DBApplication *)[(DBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.Home"];
}

- (DBApplication)inCallServiceApplication
{
  return (DBApplication *)[(DBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.InCallService"];
}

- (DBApplication)mapsApplication
{
  return (DBApplication *)[(DBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.Maps"];
}

- (DBApplication)messagesApplication
{
  return (DBApplication *)[(DBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.MobileSMS"];
}

- (DBApplication)musicApplication
{
  return (DBApplication *)[(DBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.Music"];
}

- (DBApplication)musicUIServiceApplication
{
  return (DBApplication *)[(DBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.MusicUIService"];
}

- (DBApplication)phoneApplication
{
  return (DBApplication *)[(DBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.mobilephone"];
}

- (DBApplication)settingsApplication
{
  return (DBApplication *)[(DBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.CarPlaySettings"];
}

- (DBApplication)siriApplication
{
  return (DBApplication *)[(DBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.siri"];
}

- (DBApplication)templateUIHostApplication
{
  return (DBApplication *)[(DBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.CarPlayTemplateUIHost"];
}

- (DBApplication)voiceControlApplication
{
  return (DBApplication *)[(DBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.commandandcontrol"];
}

- (DBApplication)wallpaperApplication
{
  return (DBApplication *)[(DBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.CarPlayWallpaper"];
}

- (DBApplication)autoSettingsApplication
{
  return (DBApplication *)[(DBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.AutoSettings"];
}

- (DBApplication)carCameraApplication
{
  return (DBApplication *)[(DBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.CarCamera"];
}

- (DBApplication)climateApplication
{
  return (DBApplication *)[(DBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.CarClimate"];
}

- (DBApplication)radioApplication
{
  return (DBApplication *)[(DBApplicationController *)self applicationWithBundleIdentifier:@"com.apple.CarRadio"];
}

- (void)appProtectionCoordinator:(id)a3 didUpdateBundleIdentifiers:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = DBLogForCategory(1uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = v7;
    _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "[DBApplicationController] Protected apps did update: %{public}@", buf, 0xCu);
  }

  id v9 = objc_alloc_init(MEMORY[0x263F30E78]);
  [(DBApplicationController *)self setAppPolicyEvaluator:v9];

  char v10 = [(DBApplicationController *)self appPolicyEvaluator];
  [v10 setWantsGeoSupported];

  os_unfair_lock_lock(&self->_lock);
  char v11 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v7, "count"));
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __79__DBApplicationController_appProtectionCoordinator_didUpdateBundleIdentifiers___block_invoke;
  v19[3] = &unk_2649B5B78;
  v19[4] = self;
  id v20 = v6;
  id v12 = v11;
  id v21 = v12;
  id v13 = v6;
  [v7 enumerateObjectsUsingBlock:v19];
  os_unfair_lock_unlock(&self->_lock);
  v14 = DBLogForCategory(1uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = v12;
    _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_DEFAULT, "[DBApplicationController] Updated apps: %{public}@", buf, 0xCu);
  }

  int v15 = [(DBApplicationController *)self observers];
  v16 = [MEMORY[0x263EFFA08] set];
  id v17 = (void *)[v12 copy];
  v18 = [MEMORY[0x263EFFA08] set];
  [v15 applicationController:self addedApplications:v16 updatedApplications:v17 removedApplications:v18];
}

void __79__DBApplicationController_appProtectionCoordinator_didUpdateBundleIdentifiers___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] applicationsByBundleIdentifier];
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];

  if (v5)
  {
    [a1[4] _updatePolicyForApplication:v5];
    objc_msgSend(v5, "setLockedOrHidden:", objc_msgSend(a1[5], "applicationBundleIdentifierIsLockedOrHidden:", v3));
    [a1[6] addObject:v5];
  }
  else
  {
    id v6 = DBLogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __79__DBApplicationController_appProtectionCoordinator_didUpdateBundleIdentifiers___block_invoke_cold_1();
    }
  }
}

- (void)_updatePolicyForApplication:(id)a3
{
  id v8 = a3;
  id v4 = [v8 info];
  uint64_t v5 = [v4 carPlayDeclaration];

  if (v5)
  {
    id v6 = [(DBApplicationController *)self appPolicyEvaluator];
    id v7 = [v6 effectivePolicyForAppDeclaration:v5];
  }
  else
  {
    id v7 = 0;
  }
  [v8 setAppPolicy:v7];
}

- (void)_loadApplications:(id)a3 removeApplications:(id)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = a4;
  id v9 = [v7 setWithArray:v6];
  char v10 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v6, "count"));
  char v11 = [MEMORY[0x263EFF9C0] setWithArray:v8];

  id v12 = [(DBApplicationController *)self dashBoardAppInfo];

  if (v12)
  {
    id v13 = [(DBApplicationController *)self dashBoardAppInfo];
    [v9 removeObject:v13];
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __64__DBApplicationController__loadApplications_removeApplications___block_invoke;
  v23[3] = &unk_2649B5BA0;
  v23[4] = self;
  id v24 = v9;
  id v25 = v10;
  id v14 = v10;
  id v15 = v9;
  [v6 enumerateObjectsUsingBlock:v23];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __64__DBApplicationController__loadApplications_removeApplications___block_invoke_2;
  v22[3] = &unk_2649B5BC8;
  v22[4] = self;
  [v11 enumerateObjectsUsingBlock:v22];
  v16 = [MEMORY[0x263EFF9C0] setWithSet:v15];
  [v16 unionSet:v14];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __64__DBApplicationController__loadApplications_removeApplications___block_invoke_3;
  v21[3] = &unk_2649B5BC8;
  v21[4] = self;
  [v16 enumerateObjectsUsingBlock:v21];
  id v17 = [(DBApplicationController *)self observers];
  v18 = (void *)[v15 copy];
  id v19 = (void *)[v14 copy];
  id v20 = (void *)[v11 copy];
  [v17 applicationController:self addedApplications:v18 updatedApplications:v19 removedApplications:v20];
}

void __64__DBApplicationController__loadApplications_removeApplications___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1[4];
  id v10 = v3;
  uint64_t v5 = [v3 bundleIdentifier];
  uint64_t v6 = [v4 applicationWithBundleIdentifier:v5];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [a1[4] dashBoardAppInfo];

    id v9 = v10;
    if (v8 == v10) {
      goto LABEL_6;
    }
    [a1[5] removeObject:v10];
    [a1[6] addObject:v10];
  }
  else
  {
  }
  id v9 = v10;
LABEL_6:
}

void __64__DBApplicationController__loadApplications_removeApplications___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 bundleIdentifier];
  [v2 _removeApplicationWithBundleIdentifier:v3];
}

uint64_t __64__DBApplicationController__loadApplications_removeApplications___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _loadApplicationWithInfo:a2];
}

- (void)_loadApplicationWithInfo:(id)a3
{
  id v4 = a3;
  id v12 = [v4 bundleIdentifier];
  uint64_t v5 = -[DBApplicationController applicationWithBundleIdentifier:](self, "applicationWithBundleIdentifier:");
  if (v5) {
    [(DBApplicationController *)self _removeApplicationWithBundleIdentifier:v12];
  }
  uint64_t v6 = [[DBApplication alloc] initWithApplicationInfo:v4];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(DBApplicationController *)self _updatePolicyForApplication:v6];
  id v8 = [(DBApplicationController *)self placeholdersByBundleIdentifier];
  id v9 = [v8 objectForKeyedSubscript:v12];

  [(DBApplication *)v6 setPlaceholder:v9];
  if (_os_feature_enabled_impl())
  {
    id v10 = [(DBApplicationController *)self appProtectionCoordinator];
    -[DBApplication setLockedOrHidden:](v6, "setLockedOrHidden:", [v10 applicationBundleIdentifierIsLockedOrHidden:v12]);
  }
  char v11 = [(DBApplicationController *)self applicationsByBundleIdentifier];
  [v11 setObject:v6 forKeyedSubscript:v12];

  os_unfair_lock_unlock(p_lock);
}

- (void)_removeApplicationWithBundleIdentifier:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    uint64_t v6 = [(DBApplicationController *)self applicationsByBundleIdentifier];
    [v6 setObject:0 forKeyedSubscript:v5];

    os_unfair_lock_unlock(p_lock);
  }
}

- (id)_lock_applicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(DBApplicationController *)self applicationsByBundleIdentifier];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)_didAddPlaceholders:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DBLogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = [v4 count];
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "[DBApplicationController] Added %ld placeholders", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__DBApplicationController__didAddPlaceholders___block_invoke;
  v6[3] = &unk_2649B5BF0;
  v6[4] = self;
  [v4 enumerateObjectsUsingBlock:v6];
  os_unfair_lock_unlock(&self->_lock);
}

void __47__DBApplicationController__didAddPlaceholders___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 bundleIdentifier];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) placeholdersByBundleIdentifier];
    uint64_t v6 = [v3 bundleIdentifier];
    [v5 setObject:v3 forKeyedSubscript:v6];

    id v7 = [*(id *)(a1 + 32) applicationsByBundleIdentifier];
    uint64_t v8 = [v3 bundleIdentifier];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];

    [v9 setPlaceholder:v3];
  }
  else
  {
    id v10 = DBLogForCategory(1uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __47__DBApplicationController__didAddPlaceholders___block_invoke_cold_1();
    }
  }
}

- (void)_didCancelPlaceholders:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DBLogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = [v4 count];
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "[DBApplicationController] Canceled %ld placeholders", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__DBApplicationController__didCancelPlaceholders___block_invoke;
  v6[3] = &unk_2649B5BF0;
  v6[4] = self;
  [v4 enumerateObjectsUsingBlock:v6];
  os_unfair_lock_unlock(&self->_lock);
}

void __50__DBApplicationController__didCancelPlaceholders___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 bundleIdentifier];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) placeholdersByBundleIdentifier];
    uint64_t v6 = [v3 bundleIdentifier];
    [v5 setObject:0 forKeyedSubscript:v6];

    id v7 = [*(id *)(a1 + 32) applicationsByBundleIdentifier];
    uint64_t v8 = [v3 bundleIdentifier];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];

    [v9 setPlaceholder:0];
  }
  else
  {
    id v10 = DBLogForCategory(1uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __47__DBApplicationController__didAddPlaceholders___block_invoke_cold_1();
    }
  }
}

- (void)_didAddApplications:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DBLogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = [v4 count];
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "[DBApplicationController] Added %ld applications", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__DBApplicationController__didAddApplications___block_invoke;
  v6[3] = &unk_2649B5C18;
  v6[4] = self;
  [v4 enumerateObjectsUsingBlock:v6];
  os_unfair_lock_unlock(&self->_lock);
  [(DBApplicationController *)self _loadApplications:v4 removeApplications:0];
}

void __47__DBApplicationController__didAddApplications___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 bundleIdentifier];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) placeholdersByBundleIdentifier];
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) placeholdersByBundleIdentifier];
      [v7 setObject:0 forKeyedSubscript:v4];
    }
  }
  else
  {
    uint64_t v8 = DBLogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __47__DBApplicationController__didAddApplications___block_invoke_cold_1();
    }
  }
}

- (void)_didReplaceApplications:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DBLogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v10 = [v4 count];
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "[DBApplicationController] Replaced %ld applications", buf, 0xCu);
  }

  uint64_t v6 = [v4 objectEnumerator];
  id v7 = [v6 allObjects];

  os_unfair_lock_lock(&self->_lock);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__DBApplicationController__didReplaceApplications___block_invoke;
  v8[3] = &unk_2649B5C18;
  v8[4] = self;
  [v7 enumerateObjectsUsingBlock:v8];
  os_unfair_lock_unlock(&self->_lock);
  [(DBApplicationController *)self _loadApplications:v7 removeApplications:0];
}

void __51__DBApplicationController__didReplaceApplications___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 bundleIdentifier];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) placeholdersByBundleIdentifier];
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) placeholdersByBundleIdentifier];
      [v7 setObject:0 forKeyedSubscript:v4];
    }
  }
  else
  {
    uint64_t v8 = DBLogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __47__DBApplicationController__didAddApplications___block_invoke_cold_1();
    }
  }
}

- (void)_didRemoveApplications:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DBLogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = [v4 count];
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "[DBApplicationController] Removed %ld applications", buf, 0xCu);
  }

  uint64_t v6 = (void *)[v4 mutableCopy];
  os_unfair_lock_lock(&self->_lock);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __50__DBApplicationController__didRemoveApplications___block_invoke;
  uint64_t v11 = &unk_2649B5C40;
  id v12 = self;
  id v13 = v6;
  id v7 = v6;
  [v4 enumerateObjectsUsingBlock:&v8];
  os_unfair_lock_unlock(&self->_lock);
  -[DBApplicationController _loadApplications:removeApplications:](self, "_loadApplications:removeApplications:", 0, v7, v8, v9, v10, v11, v12);
}

void __50__DBApplicationController__didRemoveApplications___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 bundleIdentifier];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v3 bundleIdentifier];
    id v7 = objc_msgSend(v5, "_lock_applicationWithBundleIdentifier:", v6);

    if (!v7) {
      [*(id *)(a1 + 40) removeObject:v3];
    }
  }
  else
  {
    uint64_t v8 = DBLogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __47__DBApplicationController__didAddApplications___block_invoke_cold_1();
    }
  }
}

- (FBSApplicationLibrary)appLibrary
{
  return self->_appLibrary;
}

- (CRCarPlayAppPolicyEvaluator)appPolicyEvaluator
{
  return self->_appPolicyEvaluator;
}

- (void)setAppPolicyEvaluator:(id)a3
{
}

- (PDCPreflightManager)preflightManager
{
  return self->_preflightManager;
}

- (void)setPreflightManager:(id)a3
{
}

- (DBAppProtectionCoordinator)appProtectionCoordinator
{
  return self->_appProtectionCoordinator;
}

- (void)setAppProtectionCoordinator:(id)a3
{
}

- (DBApplicationInfo)dashBoardAppInfo
{
  return self->_dashBoardAppInfo;
}

- (NSMutableDictionary)applicationsByBundleIdentifier
{
  return self->_applicationsByBundleIdentifier;
}

- (NSMutableDictionary)placeholdersByBundleIdentifier
{
  return self->_placeholdersByBundleIdentifier;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_placeholdersByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_dashBoardAppInfo, 0);
  objc_storeStrong((id *)&self->_appProtectionCoordinator, 0);
  objc_storeStrong((id *)&self->_preflightManager, 0);
  objc_storeStrong((id *)&self->_appPolicyEvaluator, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_removedAppsToken, 0);
  objc_storeStrong((id *)&self->_replacedAppsToken, 0);
  objc_storeStrong((id *)&self->_addedAppsToken, 0);
  objc_storeStrong((id *)&self->_canceledPlaceholdersToken, 0);
  objc_storeStrong((id *)&self->_addedPlaceholdersToken, 0);
}

void __79__DBApplicationController_appProtectionCoordinator_didUpdateBundleIdentifiers___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_22D6F0000, v0, v1, "[DBApplicationController] Received update for unknown app: %{public}@", v2, v3, v4, v5, v6);
}

void __47__DBApplicationController__didAddPlaceholders___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_22D6F0000, v0, v1, "[DBApplicationController] Received placeholder with no bundle identifier: %{public}@", v2, v3, v4, v5, v6);
}

void __47__DBApplicationController__didAddApplications___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_22D6F0000, v0, v1, "[DBApplicationController] Received application with no bundle identifier: %{public}@", v2, v3, v4, v5, v6);
}

@end