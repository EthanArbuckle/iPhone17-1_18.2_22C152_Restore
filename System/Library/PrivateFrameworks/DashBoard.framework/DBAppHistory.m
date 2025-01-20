@interface DBAppHistory
+ (id)availableApplicationContexts;
+ (id)contextForApplicationCategory:(unint64_t)a3;
+ (unint64_t)applicationCategoryForURL:(id)a3;
- (BOOL)_evaluatePolicyForBundleIdentifier:(id)a3 withBlock:(id)a4;
- (BOOL)_isMapsApplicationForBundleIdentifier:(id)a3;
- (BOOL)_isNowPlayingApplicationForBundleIdentifier:(id)a3;
- (BOOL)applicationVisibleInCarPlay:(id)a3 withIconProvider:(id)a4;
- (BOOL)isBundleIdentifierValidForDock:(id)a3;
- (BOOL)nowPlayingIsVisible;
- (CARObserverHashTable)observers;
- (DBAppHistory)init;
- (NSArray)orderedAppHistory;
- (NSArray)sessionAppContextURLs;
- (NSArray)sessionEchoContextURLs;
- (NSMutableDictionary)appHistory;
- (NSMutableDictionary)sessionContextOwners;
- (double)lastActivationTimeForApplication:(id)a3;
- (double)lastActivationTimeForBundleIdentifier:(id)a3;
- (id)_allInstalledApplicationsInCategory:(unint64_t)a3;
- (id)_applicationForBundleIdentifier:(id)a3;
- (id)_orderedAppsForBundleIdentifiers:(id)a3;
- (id)_preferredBundleIdentifierInCategory:(unint64_t)a3;
- (id)orderedAppsMatchingCategory:(unint64_t)a3;
- (id)orderedAppsMatchingDockCategory:(unint64_t)a3;
- (id)orderedBundleIdentifiersMatchingDockCategory:(unint64_t)a3;
- (id)policyForBundleIdentifier:(id)a3;
- (unint64_t)appDockCategoryForBundleIdentifier:(id)a3;
- (unint64_t)applicationCategoryForBundleIdentifier:(id)a3;
- (unint64_t)currentOwnerForContext:(id)a3;
- (void)_bundleIdentifierDidBecomeVisible:(id)a3 previousBundleIdentifier:(id)a4;
- (void)_evaluateUniversalLinksForURL:(id)a3 withIconProvider:(id)a4 completion:(id)a5;
- (void)_nowPlayingWillAppear:(id)a3;
- (void)_nowPlayingWillDisappear:(id)a3;
- (void)_persistSessionUIContextOwnership;
- (void)_sessionDidConnect:(id)a3 environmentConfiguration:(id)a4;
- (void)_sessionDidDisconnect;
- (void)addObserver:(id)a3;
- (void)applySessionAppContexts:(id)a3;
- (void)applySessionEchoContexts:(id)a3;
- (void)dealloc;
- (void)nowPlayingIconTapped;
- (void)openApplicationURL:(id)a3 withIconProvider:(id)a4 activationSettings:(id)a5 completion:(id)a6;
- (void)removeObserver:(id)a3;
- (void)resetAppHistory;
- (void)setAppHistory:(id)a3;
- (void)setDashboardAppOnDisconnect:(id)a3;
- (void)setNowPlayingIsVisible:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setSessionAppContextURLs:(id)a3;
- (void)setSessionContextOwners:(id)a3;
- (void)setSessionEchoContextURLs:(id)a3;
- (void)updateOwner:(unint64_t)a3 forContext:(id)a4;
- (void)workspace:(id)a3 stateDidChangeFromState:(id)a4 toState:(id)a5;
@end

@implementation DBAppHistory

- (BOOL)isBundleIdentifierValidForDock:(id)a3
{
  uint64_t v3 = isBundleIdentifierValidForDock__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isBundleIdentifierValidForDock__onceToken, &__block_literal_global);
  }
  char v5 = [(id)isBundleIdentifierValidForDock__invalidDockBundles containsObject:v4];

  return v5 ^ 1;
}

void __56__DBAppHistory_AppDock__isBundleIdentifierValidForDock___block_invoke()
{
  v2[2] = *MEMORY[0x263EF8340];
  v2[0] = @"com.apple.siri";
  v2[1] = @"com.apple.InCallService";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:2];
  v1 = (void *)isBundleIdentifierValidForDock__invalidDockBundles;
  isBundleIdentifierValidForDock__invalidDockBundles = v0;
}

- (unint64_t)appDockCategoryForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([(DBAppHistory *)self _isNowPlayingApplicationForBundleIdentifier:v4])
  {
    unint64_t v5 = 2;
  }
  else
  {
    unint64_t v5 = [(DBAppHistory *)self _isMapsApplicationForBundleIdentifier:v4];
  }

  return v5;
}

- (id)orderedBundleIdentifiersMatchingDockCategory:(unint64_t)a3
{
  uint64_t v3 = [(DBAppHistory *)self orderedAppsMatchingDockCategory:a3];
  id v4 = objc_msgSend(v3, "db_map:", &__block_literal_global_61);

  return v4;
}

uint64_t __70__DBAppHistory_AppDock__orderedBundleIdentifiersMatchingDockCategory___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

- (id)orderedAppsMatchingDockCategory:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unint64_t v5 = [MEMORY[0x263EFF980] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v6 = [(DBAppHistory *)self orderedAppHistory];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v12 = [v11 bundleIdentifier];
        unint64_t v13 = [(DBAppHistory *)self appDockCategoryForBundleIdentifier:v12];

        if (v13 == a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  v14 = [(DBAppHistory *)self _allInstalledApplicationsInCategory:a3];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __57__DBAppHistory_AppDock__orderedAppsMatchingDockCategory___block_invoke;
  v18[3] = &unk_2649B3C98;
  id v19 = v5;
  id v15 = v5;
  objc_msgSend(v14, "bs_each:", v18);
  v16 = [MEMORY[0x263EFF8C0] arrayWithArray:v15];

  return v16;
}

void __57__DBAppHistory_AppDock__orderedAppsMatchingDockCategory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (BOOL)_evaluatePolicyForBundleIdentifier:(id)a3 withBlock:(id)a4
{
  v6 = (uint64_t (**)(id, void *))a4;
  uint64_t v7 = [(DBAppHistory *)self policyForBundleIdentifier:a3];
  LOBYTE(self) = v6[2](v6, v7);

  return (char)self;
}

- (BOOL)_isNowPlayingApplicationForBundleIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = ([v4 isEqualToString:@"com.apple.Music"] & 1) != 0
    || ([v4 isEqualToString:@"com.apple.CarRadio"] & 1) != 0
    || [(DBAppHistory *)self _evaluatePolicyForBundleIdentifier:v4 withBlock:&__block_literal_global_66];

  return v5;
}

BOOL __69__DBAppHistory_AppDock___isNowPlayingApplicationForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 launchUsingMusicUIService])
  {
    BOOL v3 = 1;
  }
  else if ([v2 launchUsingTemplateUI])
  {
    BOOL v3 = [v2 applicationCategory] == 16;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)_isMapsApplicationForBundleIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = ([v4 isEqualToString:@"com.apple.Maps"] & 1) != 0
    || [(DBAppHistory *)self _evaluatePolicyForBundleIdentifier:v4 withBlock:&__block_literal_global_68];

  return v5;
}

BOOL __63__DBAppHistory_AppDock___isMapsApplicationForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 launchUsingTemplateUI]) {
    BOOL v3 = [v2 applicationCategory] == 8;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)_preferredBundleIdentifierInCategory:(unint64_t)a3
{
  if (_preferredBundleIdentifierInCategory__onceToken != -1) {
    dispatch_once(&_preferredBundleIdentifierInCategory__onceToken, &__block_literal_global_70);
  }
  id v4 = (void *)_preferredBundleIdentifierInCategory__preferredAppsByCategory;
  BOOL v5 = [NSNumber numberWithUnsignedInteger:a3];
  v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

void __62__DBAppHistory_AppDock___preferredBundleIdentifierInCategory___block_invoke()
{
  v3[3] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26E17EA20;
  v2[1] = &unk_26E17EA38;
  v3[0] = @"com.apple.Maps";
  v3[1] = @"com.apple.Music";
  v2[2] = &unk_26E17EA50;
  v3[2] = @"com.apple.MobileSMS";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)_preferredBundleIdentifierInCategory__preferredAppsByCategory;
  _preferredBundleIdentifierInCategory__preferredAppsByCategory = v0;
}

- (id)_allInstalledApplicationsInCategory:(unint64_t)a3
{
  BOOL v5 = +[DBApplicationController sharedInstance];
  v6 = [v5 allApplications];
  uint64_t v7 = (void *)[v6 copy];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__DBAppHistory_AppDock___allInstalledApplicationsInCategory___block_invoke;
  v15[3] = &unk_2649B3CE0;
  v15[4] = self;
  v15[5] = a3;
  uint64_t v8 = objc_msgSend(v7, "bs_filter:", v15);

  uint64_t v9 = [(DBAppHistory *)self _preferredBundleIdentifierInCategory:a3];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__DBAppHistory_AppDock___allInstalledApplicationsInCategory___block_invoke_2;
  v13[3] = &unk_2649B3D08;
  id v14 = v9;
  id v10 = v9;
  v11 = [v8 sortedArrayUsingComparator:v13];

  return v11;
}

BOOL __61__DBAppHistory_AppDock___allInstalledApplicationsInCategory___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = [a2 bundleIdentifier];
  uint64_t v5 = [v3 appDockCategoryForBundleIdentifier:v4];

  return v5 == *(void *)(a1 + 40);
}

uint64_t __61__DBAppHistory_AppDock___allInstalledApplicationsInCategory___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 bundleIdentifier];
  char v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    uint64_t v9 = -1;
  }
  else
  {
    id v10 = [v6 bundleIdentifier];
    char v11 = [v10 isEqualToString:*(void *)(a1 + 32)];

    if (v11)
    {
      uint64_t v9 = 1;
    }
    else
    {
      int v12 = [v5 isFirstParty];
      unsigned int v13 = [v6 isFirstParty];
      if (v12) {
        uint64_t v9 = -1;
      }
      else {
        uint64_t v9 = v13;
      }
    }
  }

  return v9;
}

- (DBAppHistory)init
{
  v22.receiver = self;
  v22.super_class = (Class)DBAppHistory;
  id v2 = [(DBAppHistory *)&v22 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    appHistory = v2->_appHistory;
    v2->_appHistory = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF8C0] array];
    sessionAppContextURLs = v2->_sessionAppContextURLs;
    v2->_sessionAppContextURLs = (NSArray *)v5;

    uint64_t v7 = [MEMORY[0x263EFF8C0] array];
    sessionEchoContextURLs = v2->_sessionEchoContextURLs;
    v2->_sessionEchoContextURLs = (NSArray *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    sessionContextOwners = v2->_sessionContextOwners;
    v2->_sessionContextOwners = (NSMutableDictionary *)v9;

    char v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v12 = [v11 dictionaryForKey:@"CARRecentAppHistory"];
    unsigned int v13 = [v11 dictionaryForKey:@"CARLastSessionUIContextOwners"];
    if (v13)
    {
      id v14 = [(DBAppHistory *)v2 sessionContextOwners];
      [v14 setDictionary:v13];
    }
    if (v12)
    {
      id v15 = [(DBAppHistory *)v2 appHistory];
      [v15 setDictionary:v12];
    }
    else
    {
      id v15 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.springboard"];
      v16 = [v15 arrayForKey:@"CarDisplayRecentlyUsedApps"];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __20__DBAppHistory_init__block_invoke;
      v20[3] = &unk_2649B4FC8;
      long long v21 = v2;
      [v16 enumerateObjectsWithOptions:2 usingBlock:v20];
    }
    v17 = [MEMORY[0x263F087C8] defaultCenter];
    [v17 addObserver:v2 selector:sel__nowPlayingWillAppear_ name:@"MCDNowPlayingWillAppearNotification" object:0 suspensionBehavior:4];

    v18 = [MEMORY[0x263F087C8] defaultCenter];
    [v18 addObserver:v2 selector:sel__nowPlayingWillDisappear_ name:@"MCDNowPlayingWillDisappearNotification" object:0 suspensionBehavior:4];
  }
  return v2;
}

void __20__DBAppHistory_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = NSNumber;
  id v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a2;
  id v8 = [v4 date];
  [v8 timeIntervalSince1970];
  id v6 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v7 = [*(id *)(a1 + 32) appHistory];
  [v7 setObject:v6 forKeyedSubscript:v5];
}

- (void)addObserver:(id)a3
{
  id v7 = a3;
  if (!self->_observers)
  {
    id v4 = (CARObserverHashTable *)[objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26E1E1CA8];
    observers = self->_observers;
    self->_observers = v4;
  }
  id v6 = [(DBAppHistory *)self observers];
  [v6 addObserver:v7];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBAppHistory *)self observers];
  [v5 removeObserver:v4];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)DBAppHistory;
  [(DBAppHistory *)&v4 dealloc];
}

- (void)resetAppHistory
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(DBAppHistory *)self setAppHistory:v3];

  id v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  objc_super v4 = [NSDictionary dictionary];
  [v5 setObject:v4 forKey:@"CARRecentAppHistory"];
}

- (void)nowPlayingIconTapped
{
}

- (void)_sessionDidConnect:(id)a3 environmentConfiguration:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 configuration];
  uint64_t v9 = [v8 lastOnDisplayUIContextURLs];

  id v10 = [v6 configuration];
  char v11 = [v10 nowOnDisplayUIContextURLs];

  int v12 = DBLogForCategory(0);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v9;
      _os_log_impl(&dword_22D6F0000, v12, OS_LOG_TYPE_DEFAULT, "Applying session UI contexts: %@", buf, 0xCu);
    }

    [(DBAppHistory *)self applySessionAppContexts:v9];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __60__DBAppHistory__sessionDidConnect_environmentConfiguration___block_invoke;
    v16[3] = &unk_2649B48C0;
    v16[4] = self;
    id v17 = v6;
    [v7 fetchEnhancedIntegrationStatusWithCompletion:v16];
  }
  else
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v12, OS_LOG_TYPE_DEFAULT, "No available session UI contexts.", buf, 2u);
    }
  }
  id v14 = DBLogForCategory(0);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v11;
      _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_DEFAULT, "Applying session echo contexts: %@", buf, 0xCu);
    }

    [(DBAppHistory *)self applySessionEchoContexts:v11];
  }
  else
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_DEFAULT, "No available session echo contexts.", buf, 2u);
    }
  }
}

void __60__DBAppHistory__sessionDidConnect_environmentConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 != 2)
  {
    objc_super v4 = DBLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "No enhanced integration consent for launch UI Contexts.", buf, 2u);
    }
  }
  BOOL v5 = a2 == 2;
  id v6 = [*(id *)(a1 + 32) sessionAppContextURLs];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__DBAppHistory__sessionDidConnect_environmentConfiguration___block_invoke_200;
  v8[3] = &unk_2649B4FF0;
  id v7 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  BOOL v10 = v5;
  id v9 = v7;
  [v6 enumerateObjectsUsingBlock:v8];
}

void __60__DBAppHistory__sessionDidConnect_environmentConfiguration___block_invoke_200(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_super v4 = [*(id *)(a1 + 32) sessionContextOwners];
  BOOL v5 = [v4 objectForKey:v3];

  if (!v5)
  {
    char v11 = DBLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v3;
      int v12 = "No known context owner for context %{public}@, defaulting to accessory.";
LABEL_11:
      _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
    }
LABEL_12:

    goto LABEL_13;
  }
  if ([v5 unsignedIntegerValue] != 1)
  {
    char v11 = DBLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v3;
      int v12 = "Accessory is already owner of context %{public}@";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  int v6 = *(unsigned __int8 *)(a1 + 48);
  id v7 = DBLogForCategory(0);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v3;
      _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "Notifying accessory for iOS ownership of context %{public}@", buf, 0xCu);
    }

    id v9 = *(void **)(a1 + 40);
    BOOL v13 = @"url";
    id v14 = v3;
    BOOL v10 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [v9 sendCommand:@"changeUIContext" withParameters:v10];
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v3;
      _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "Reverting context %{public}@ to accessory ownership.", buf, 0xCu);
    }

    [*(id *)(a1 + 32) updateOwner:0 forContext:v3];
  }
LABEL_13:
}

- (void)_sessionDidDisconnect
{
  uint64_t v3 = MEMORY[0x263EFFA68];
  [(DBAppHistory *)self setSessionAppContextURLs:MEMORY[0x263EFFA68]];
  [(DBAppHistory *)self setSessionEchoContextURLs:v3];
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  [(DBAppHistory *)self setSessionContextOwners:v4];
}

- (id)policyForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[DBApplicationController sharedInstance];
  BOOL v5 = [v4 applicationWithBundleIdentifier:v3];

  int v6 = [v5 appPolicy];

  return v6;
}

- (BOOL)applicationVisibleInCarPlay:(id)a3 withIconProvider:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(DBAppHistory *)self policyForBundleIdentifier:v6];
  if (([v8 isCarPlaySupported] & 1) == 0)
  {
    id v9 = DBLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Application %@ does not support CarPlay.", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_11;
  }
  id v9 = [v7 iconForIdentifier:v6];
  if (([v6 isEqualToString:@"com.apple.InCallService"] & 1) == 0
    && (!v9 || ([v7 isIconVisible:v9] & 1) == 0))
  {
    char v11 = DBLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "Application %@ is not available in the current layout.", (uint8_t *)&v13, 0xCu);
    }

LABEL_11:
    BOOL v10 = 0;
    goto LABEL_12;
  }
  BOOL v10 = 1;
LABEL_12:

  return v10;
}

- (void)_evaluateUniversalLinksForURL:(id)a3 withIconProvider:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = (void *)MEMORY[0x263F01850];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__DBAppHistory__evaluateUniversalLinksForURL_withIconProvider_completion___block_invoke;
  v15[3] = &unk_2649B5068;
  id v16 = v8;
  uint64_t v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  [v11 getAppLinksWithURL:v14 completionHandler:v15];
}

void __74__DBAppHistory__evaluateUniversalLinksForURL_withIconProvider_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 count])
  {
    id v7 = DBLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "No available application for URL %@", (uint8_t *)&buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __74__DBAppHistory__evaluateUniversalLinksForURL_withIconProvider_completion___block_invoke_207;
    v17[3] = &unk_2649B5040;
    id v9 = *(void **)(a1 + 48);
    v17[4] = *(void *)(a1 + 40);
    id v18 = v9;
    p_long long buf = &buf;
    id v19 = *(id *)(a1 + 32);
    id v20 = *(id *)(a1 + 56);
    [v5 enumerateObjectsUsingBlock:v17];
    if (!*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      id v10 = DBLogForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __74__DBAppHistory__evaluateUniversalLinksForURL_withIconProvider_completion___block_invoke_cold_1(a1 + 32, v10, v11, v12, v13, v14, v15, v16);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }

    _Block_object_dispose(&buf, 8);
  }
}

void __74__DBAppHistory__evaluateUniversalLinksForURL_withIconProvider_completion___block_invoke_207(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = [v6 targetApplicationRecord];
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = [v7 bundleIdentifier];
  LODWORD(v8) = [v8 applicationVisibleInCarPlay:v9 withIconProvider:*(void *)(a1 + 40)];

  if (v8)
  {
    id v10 = DBLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v17 = v7;
      _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "Resolved universal link to %@", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    *a4 = 1;
    uint64_t v11 = objc_opt_new();
    uint64_t v12 = [MEMORY[0x263F3F790] dashboardEndpoint];
    [v11 setTargetConnectionEndpoint:v12];

    [v11 setReferrerURL:*(void *)(a1 + 48)];
    [v11 setIgnoreAppLinkEnabledProperty:1];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __74__DBAppHistory__evaluateUniversalLinksForURL_withIconProvider_completion___block_invoke_210;
    v13[3] = &unk_2649B5018;
    id v14 = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 56);
    [v6 openWithConfiguration:v11 completionHandler:v13];
  }
}

void __74__DBAppHistory__evaluateUniversalLinksForURL_withIconProvider_completion___block_invoke_210(uint64_t a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = DBLogForCategory(0);
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __74__DBAppHistory__evaluateUniversalLinksForURL_withIconProvider_completion___block_invoke_210_cold_2((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v21 = 138412290;
      uint64_t v22 = v14;
      _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "Opened a universal link for %@", (uint8_t *)&v21, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __74__DBAppHistory__evaluateUniversalLinksForURL_withIconProvider_completion___block_invoke_210_cold_1(a1, v7, v15, v16, v17, v18, v19, v20);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)openApplicationURL:(id)a3 withIconProvider:(id)a4 activationSettings:(id)a5 completion:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = DBLogForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v26 = v10;
    _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_DEFAULT, "Evaluating application URL %@", buf, 0xCu);
  }

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __82__DBAppHistory_openApplicationURL_withIconProvider_activationSettings_completion___block_invoke;
  v19[3] = &unk_2649B5090;
  id v23 = v12;
  id v24 = v13;
  id v20 = v10;
  int v21 = self;
  id v22 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  [(DBAppHistory *)self _evaluateUniversalLinksForURL:v17 withIconProvider:v16 completion:v19];
}

void __82__DBAppHistory_openApplicationURL_withIconProvider_activationSettings_completion___block_invoke(void *a1, int a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(a1[8] + 16))();
  }
  else
  {
    id v6 = [MEMORY[0x263F01880] defaultWorkspace];
    uint64_t v21 = [v6 URLOverrideForURL:a1[4]];
    objc_msgSend(v6, "applicationsAvailableForOpeningURL:");
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
LABEL_5:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
        id v13 = (void *)a1[5];
        uint64_t v14 = [v12 bundleIdentifier];
        LOBYTE(v13) = [v13 applicationVisibleInCarPlay:v14 withIconProvider:a1[6]];

        if (v13) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
          if (v9) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
      id v15 = +[DBApplicationController sharedInstance];
      id v16 = [v12 bundleIdentifier];
      id v17 = [v15 applicationWithBundleIdentifier:v16];

      if (!v17) {
        goto LABEL_16;
      }
      id v18 = DBLogForCategory(0);
      uint64_t v19 = (void *)v21;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v27 = v17;
        _os_log_impl(&dword_22D6F0000, v18, OS_LOG_TYPE_DEFAULT, "Resolved URL to %@", buf, 0xCu);
      }

      id v20 = +[DBApplicationLaunchInfo launchInfoForApplication:v17 withActivationSettings:a1[7]];
      (*(void (**)(void))(a1[8] + 16))();
    }
    else
    {
LABEL_11:

LABEL_16:
      (*(void (**)(void))(a1[8] + 16))();
      uint64_t v19 = (void *)v21;
    }
  }
}

- (void)setDashboardAppOnDisconnect:(id)a3
{
  if (a3)
  {
    id v4 = NSNumber;
    id v5 = (void *)MEMORY[0x263EFF910];
    id v6 = a3;
    id v7 = [v5 date];
    [v7 timeIntervalSince1970];
    uint64_t v8 = objc_msgSend(v4, "numberWithDouble:");
    uint64_t v9 = [(DBAppHistory *)self appHistory];
    [v9 setObject:v8 forKeyedSubscript:v6];

    id v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v10 = NSDictionary;
    uint64_t v11 = [(DBAppHistory *)self appHistory];
    id v12 = [v10 dictionaryWithDictionary:v11];
    [v13 setObject:v12 forKey:@"CARRecentAppHistory"];
  }
}

- (unint64_t)applicationCategoryForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x263F31298]])
  {
    unint64_t v5 = 64;
  }
  else
  {
    id v6 = [(DBAppHistory *)self policyForBundleIdentifier:v4];
    unint64_t v5 = [v6 applicationCategory];
  }
  return v5;
}

- (NSArray)orderedAppHistory
{
  id v3 = [(DBAppHistory *)self appHistory];
  id v4 = [v3 allKeys];
  unint64_t v5 = [(DBAppHistory *)self _orderedAppsForBundleIdentifiers:v4];

  return (NSArray *)v5;
}

- (id)orderedAppsMatchingCategory:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(DBAppHistory *)self appHistory];
  id v7 = [v6 allKeys];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (-[DBAppHistory applicationCategoryForBundleIdentifier:](self, "applicationCategoryForBundleIdentifier:", v12) == a3)[v5 addObject:v12]; {
      }
        }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  id v13 = [(DBAppHistory *)self _orderedAppsForBundleIdentifiers:v5];

  return v13;
}

- (double)lastActivationTimeForApplication:(id)a3
{
  id v4 = [a3 bundleIdentifier];
  [(DBAppHistory *)self lastActivationTimeForBundleIdentifier:v4];
  double v6 = v5;

  return v6;
}

- (double)lastActivationTimeForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (![v4 isEqualToString:*MEMORY[0x263F31298]]
    || (double v5 = 0.0, ![(DBAppHistory *)self nowPlayingIsVisible]))
  {
    double v6 = [(DBAppHistory *)self appHistory];
    id v7 = [v6 objectForKeyedSubscript:v4];

    if (v7)
    {
      [v7 doubleValue];
      double v5 = v8;
    }
    else
    {
      double v5 = -1.0;
    }
  }
  return v5;
}

- (void)workspace:(id)a3 stateDidChangeFromState:(id)a4 toState:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a4;
  double v8 = [a5 activeBundleIdentifier];
  if (v8)
  {
    uint64_t v9 = DBLogForCategory(4uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      long long v18 = v8;
      _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Workspace did change to active app %@", buf, 0xCu);
    }

    if ([v8 isEqualToString:@"com.apple.InCallService"])
    {
      uint64_t v10 = @"com.apple.mobilephone";

      double v8 = v10;
    }
    if ([(DBAppHistory *)self isBundleIdentifierValidForDock:v8])
    {
      uint64_t v11 = [(DBAppHistory *)self _applicationForBundleIdentifier:v8];
      if (v11)
      {
        uint64_t v12 = [v7 activeBundleIdentifier];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __58__DBAppHistory_workspace_stateDidChangeFromState_toState___block_invoke;
        block[3] = &unk_2649B3ED8;
        block[4] = self;
        id v15 = v8;
        id v16 = v12;
        id v13 = v12;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
      else
      {
        id v13 = [(DBAppHistory *)self observers];
        [v13 appHistory:self mostRecentHomeScreenUpdatedTo:v8];
      }
    }
  }
}

uint64_t __58__DBAppHistory_workspace_stateDidChangeFromState_toState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _bundleIdentifierDidBecomeVisible:*(void *)(a1 + 40) previousBundleIdentifier:*(void *)(a1 + 48)];
}

- (void)_bundleIdentifierDidBecomeVisible:(id)a3 previousBundleIdentifier:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  -[DBAppHistory setNowPlayingIsVisible:](self, "setNowPlayingIsVisible:", [v6 isEqualToString:*MEMORY[0x263F31298]]);
  if (v6)
  {
    double v8 = NSNumber;
    uint64_t v9 = [MEMORY[0x263EFF910] date];
    [v9 timeIntervalSince1970];
    uint64_t v10 = objc_msgSend(v8, "numberWithDouble:");
    uint64_t v11 = [(DBAppHistory *)self appHistory];
    [v11 setObject:v10 forKeyedSubscript:v6];
  }
  uint64_t v12 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v13 = NSDictionary;
  uint64_t v14 = [(DBAppHistory *)self appHistory];
  id v15 = [v13 dictionaryWithDictionary:v14];
  [v12 setObject:v15 forKey:@"CARRecentAppHistory"];

  id v16 = [MEMORY[0x263EFF9A0] dictionary];
  if (v7)
  {
    unint64_t v17 = [(DBAppHistory *)self applicationCategoryForBundleIdentifier:v7];
    long long v18 = [NSNumber numberWithUnsignedInteger:v17];
    [v16 setObject:v18 forKeyedSubscript:*MEMORY[0x263F31280]];
  }
  if (v6)
  {
    unint64_t v19 = [(DBAppHistory *)self applicationCategoryForBundleIdentifier:v6];
    uint64_t v20 = [NSNumber numberWithUnsignedInteger:v19];
    [v16 setObject:v20 forKeyedSubscript:*MEMORY[0x263F31270]];
  }
  uint64_t v21 = DBLogForCategory(4uLL);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    id v26 = v16;
    _os_log_impl(&dword_22D6F0000, v21, OS_LOG_TYPE_DEFAULT, "Workspace change event %@", (uint8_t *)&v25, 0xCu);
  }

  unint64_t v22 = [(DBAppHistory *)self appDockCategoryForBundleIdentifier:v6];
  switch(v22)
  {
    case 2uLL:
      long long v23 = [(DBAppHistory *)self observers];
      [v23 appHistory:self mostRecentAudioAppUpdatedTo:v6];
      goto LABEL_15;
    case 1uLL:
      long long v23 = [(DBAppHistory *)self observers];
      [v23 appHistory:self mostRecentNavigationAppUpdatedTo:v6];
      goto LABEL_15;
    case 0uLL:
      long long v23 = [(DBAppHistory *)self observers];
      [v23 appHistory:self mostRecentOtherAppUpdatedTo:v6];
LABEL_15:

      break;
  }
  long long v24 = [MEMORY[0x263F087C8] defaultCenter];
  [v24 postNotificationName:*MEMORY[0x263F31278] object:0 userInfo:v16];
}

- (void)_nowPlayingWillAppear:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__DBAppHistory__nowPlayingWillAppear___block_invoke;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __38__DBAppHistory__nowPlayingWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _bundleIdentifierDidBecomeVisible:*MEMORY[0x263F31298] previousBundleIdentifier:0];
}

- (void)_nowPlayingWillDisappear:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__DBAppHistory__nowPlayingWillDisappear___block_invoke;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __41__DBAppHistory__nowPlayingWillDisappear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _bundleIdentifierDidBecomeVisible:0 previousBundleIdentifier:*MEMORY[0x263F31298]];
}

- (id)_applicationForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[DBApplicationController sharedInstance];
  double v5 = [v4 applicationWithBundleIdentifier:v3];

  return v5;
}

- (id)_orderedAppsForBundleIdentifiers:(id)a3
{
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__DBAppHistory__orderedAppsForBundleIdentifiers___block_invoke;
  v10[3] = &unk_2649B50B8;
  v10[4] = self;
  id v4 = [a3 sortedArrayUsingComparator:v10];
  double v5 = objc_msgSend(v4, "bs_filter:", &__block_literal_global_6);

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__DBAppHistory__orderedAppsForBundleIdentifiers___block_invoke_3;
  v9[3] = &unk_2649B5100;
  v9[4] = self;
  id v6 = objc_msgSend(v5, "bs_mapNoNulls:", v9);
  id v7 = objc_msgSend(v6, "bs_reverse");

  return v7;
}

uint64_t __49__DBAppHistory__orderedAppsForBundleIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  double v8 = [v5 appHistory];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  uint64_t v10 = [*(id *)(a1 + 32) appHistory];
  uint64_t v11 = [v10 objectForKeyedSubscript:v6];

  uint64_t v12 = [v9 compare:v11];
  return v12;
}

uint64_t __49__DBAppHistory__orderedAppsForBundleIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEqualToString:@"com.apple.siri"]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2 isEqualToString:@"com.apple.InCallService"] ^ 1;
  }

  return v3;
}

uint64_t __49__DBAppHistory__orderedAppsForBundleIdentifiers___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _applicationForBundleIdentifier:a2];
}

- (void)_persistSessionUIContextOwnership
{
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v3 = [(DBAppHistory *)self sessionContextOwners];
  [v4 setObject:v3 forKey:@"CARLastSessionUIContextOwners"];
}

- (NSArray)sessionAppContextURLs
{
  return self->_sessionAppContextURLs;
}

- (void)setSessionAppContextURLs:(id)a3
{
}

- (NSArray)sessionEchoContextURLs
{
  return self->_sessionEchoContextURLs;
}

- (void)setSessionEchoContextURLs:(id)a3
{
}

- (NSMutableDictionary)sessionContextOwners
{
  return self->_sessionContextOwners;
}

- (void)setSessionContextOwners:(id)a3
{
}

- (NSMutableDictionary)appHistory
{
  return self->_appHistory;
}

- (void)setAppHistory:(id)a3
{
}

- (BOOL)nowPlayingIsVisible
{
  return self->_nowPlayingIsVisible;
}

- (void)setNowPlayingIsVisible:(BOOL)a3
{
  self->_nowPlayingIsVisible = a3;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_appHistory, 0);
  objc_storeStrong((id *)&self->_sessionContextOwners, 0);
  objc_storeStrong((id *)&self->_sessionEchoContextURLs, 0);
  objc_storeStrong((id *)&self->_sessionAppContextURLs, 0);
}

+ (id)availableApplicationContexts
{
  if (availableApplicationContexts_onceToken != -1) {
    dispatch_once(&availableApplicationContexts_onceToken, &__block_literal_global_31);
  }
  id v2 = (void *)availableApplicationContexts___contexts;
  return v2;
}

void __54__DBAppHistory_Contexts__availableApplicationContexts__block_invoke()
{
  v2[4] = *MEMORY[0x263EF8340];
  v2[0] = @"maps:";
  v2[1] = @"mobilephone:";
  v2[2] = @"nowplaying:";
  void v2[3] = @"messages:";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:4];
  v1 = (void *)availableApplicationContexts___contexts;
  availableApplicationContexts___contexts = v0;
}

+ (unint64_t)applicationCategoryForURL:(id)a3
{
  id v3 = a3;
  if (([v3 hasPrefix:@"maps:"] & 1) != 0
    || ([v3 hasPrefix:@"maps:/car/destinations"] & 1) != 0)
  {
    unint64_t v4 = 8;
  }
  else if ([v3 hasPrefix:@"nowplaying:"])
  {
    unint64_t v4 = 64;
  }
  else if ([v3 hasPrefix:@"music:"])
  {
    unint64_t v4 = 16;
  }
  else if ([v3 hasPrefix:@"mobilephone:"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 hasPrefix:@"messages:"])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)contextForApplicationCategory:(unint64_t)a3
{
  if ((uint64_t)a3 <= 7)
  {
    unint64_t v4 = @"mobilephone:";
    if (a3 != 4) {
      unint64_t v4 = 0;
    }
    if (a3 == 2) {
      return @"messages:";
    }
    else {
      return v4;
    }
  }
  else if (a3 == 8)
  {
    return @"maps:";
  }
  else if (a3 == 64 || a3 == 16)
  {
    return @"nowplaying:";
  }
  else
  {
    return 0;
  }
}

- (void)applySessionAppContexts:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v15 = self;
  double v5 = [(id)objc_opt_class() availableApplicationContexts];
  id v6 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if ([v5 containsObject:v12])
        {
          [v6 addObject:v12];
        }
        else
        {
          id v13 = DBLogForCategory(0);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543362;
            uint64_t v21 = v12;
            _os_log_impl(&dword_22D6F0000, v13, OS_LOG_TYPE_DEFAULT, "Received unknown app URL %{public}@ not included in master list", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v9);
  }

  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithArray:v6];
  [(DBAppHistory *)v15 setSessionAppContextURLs:v14];
}

- (void)applySessionEchoContexts:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v15 = self;
  double v5 = [(id)objc_opt_class() availableApplicationContexts];
  id v6 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if ([v5 containsObject:v12])
        {
          [v6 addObject:v12];
        }
        else
        {
          id v13 = DBLogForCategory(0);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543362;
            uint64_t v21 = v12;
            _os_log_impl(&dword_22D6F0000, v13, OS_LOG_TYPE_DEFAULT, "Received unknown echo URL %{public}@ not included in master list", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v9);
  }

  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithArray:v6];
  [(DBAppHistory *)v15 setSessionEchoContextURLs:v14];
}

- (unint64_t)currentOwnerForContext:(id)a3
{
  id v4 = a3;
  double v5 = [(DBAppHistory *)self sessionContextOwners];
  id v6 = [v5 objectForKey:v4];

  unint64_t v7 = [v6 unsignedIntegerValue];
  return v7;
}

- (void)updateOwner:(unint64_t)a3 forContext:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(DBAppHistory *)self sessionContextOwners];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
  [v7 setObject:v8 forKey:v6];

  [(DBAppHistory *)self _persistSessionUIContextOwnership];
}

void __74__DBAppHistory__evaluateUniversalLinksForURL_withIconProvider_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __74__DBAppHistory__evaluateUniversalLinksForURL_withIconProvider_completion___block_invoke_210_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __74__DBAppHistory__evaluateUniversalLinksForURL_withIconProvider_completion___block_invoke_210_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end