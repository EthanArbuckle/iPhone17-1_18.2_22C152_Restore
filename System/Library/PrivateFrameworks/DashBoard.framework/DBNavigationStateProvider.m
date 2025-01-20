@interface DBNavigationStateProvider
- (CARActiveNavigationIdentifiersObserver)activeNavigationIdentifiersObserver;
- (CARObserverHashTable)observers;
- (DBAppHistoryAppDockProviding)appHistoryAppDockProvider;
- (DBIconProviding)iconProvider;
- (DBNavigationAppInfoProviding)infoProvider;
- (DBNavigationStateProvider)init;
- (NSArray)navigatingIdentifiers;
- (NSString)mostRecentClusterNavigatingApp;
- (NSString)mostRecentDashboardNavigatingApp;
- (NSString)mostRecentNavigatingApp;
- (NSString)mostRecentlyActivatedClusterApp;
- (NSString)mostRecentlyActivatedDashboardApp;
- (id)_initWithActiveNavigationIdentifiersObserver:(id)a3;
- (void)_updateMostRecentClusterApp;
- (void)_updateMostRecentDockApp;
- (void)activeNavigationIdentifiersObserver:(id)a3 updatedActiveNavigationIdentifiers:(id)a4;
- (void)addObserver:(id)a3;
- (void)appHistory:(id)a3 mostRecentHomeScreenUpdatedTo:(id)a4;
- (void)appHistory:(id)a3 mostRecentNavigationAppUpdatedTo:(id)a4;
- (void)appHistory:(id)a3 mostRecentOtherAppUpdatedTo:(id)a4;
- (void)applicationController:(id)a3 addedApplications:(id)a4 updatedApplications:(id)a5 removedApplications:(id)a6;
- (void)invalidate;
- (void)removeObserver:(id)a3;
- (void)setActiveNavigationIdentifiersObserver:(id)a3;
- (void)setAppHistoryAppDockProvider:(id)a3;
- (void)setIconProvider:(id)a3;
- (void)setInfoProvider:(id)a3;
- (void)setMostRecentlyActivatedClusterApp:(id)a3;
- (void)setMostRecentlyActivatedDashboardApp:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation DBNavigationStateProvider

- (DBNavigationStateProvider)init
{
  id v3 = objc_alloc_init(MEMORY[0x263F30DE8]);
  v4 = [(DBNavigationStateProvider *)self _initWithActiveNavigationIdentifiersObserver:v3];

  return v4;
}

- (id)_initWithActiveNavigationIdentifiersObserver:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DBNavigationStateProvider;
  v6 = [(DBNavigationStateProvider *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26E1BA520];
    observers = v6->_observers;
    v6->_observers = (CARObserverHashTable *)v7;

    objc_storeStrong((id *)&v6->_activeNavigationIdentifiersObserver, a3);
    [(CARActiveNavigationIdentifiersObserver *)v6->_activeNavigationIdentifiersObserver addObserver:v6];
    v9 = +[DBApplicationController sharedInstance];
    [v9 addObserver:v6];
  }
  return v6;
}

- (void)setIconProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconProvider);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_iconProvider, obj);
    if (DBIsInternalInstall_onceToken_3 != -1) {
      dispatch_once(&DBIsInternalInstall_onceToken_3, &__block_literal_global_160);
    }
    if (!DBIsInternalInstall_isInternal_3
      || ([MEMORY[0x263EFFA40] standardUserDefaults],
          id v5 = objc_claimAutoreleasedReturnValue(),
          char v6 = [v5 BOOLForKey:@"CARDisableAutoLaunchNavigation"],
          v5,
          (v6 & 1) == 0))
    {
      [(DBNavigationStateProvider *)self _updateMostRecentDockApp];
      [(DBNavigationStateProvider *)self _updateMostRecentClusterApp];
      uint64_t v7 = [(DBNavigationStateProvider *)self observers];
      v8 = [(DBNavigationStateProvider *)self activeNavigationIdentifiersObserver];
      v9 = [v8 activeNavigationIdentifiers];
      [v7 navigationStateProvider:self navigatingIdentifiersDidChange:v9];
    }
  }
}

- (void)addObserver:(id)a3
{
  id v8 = a3;
  v4 = [(DBNavigationStateProvider *)self observers];
  [v4 addObserver:v8];

  if (DBIsInternalInstall_onceToken_3 != -1) {
    dispatch_once(&DBIsInternalInstall_onceToken_3, &__block_literal_global_160);
  }
  if (!DBIsInternalInstall_isInternal_3
    || ([MEMORY[0x263EFFA40] standardUserDefaults],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 BOOLForKey:@"CARDisableAutoLaunchNavigation"],
        v5,
        (v6 & 1) == 0))
  {
    uint64_t v7 = [(DBNavigationStateProvider *)self navigatingIdentifiers];
    [v8 navigationStateProvider:self navigatingIdentifiersDidChange:v7];
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBNavigationStateProvider *)self observers];
  [v5 removeObserver:v4];
}

- (NSArray)navigatingIdentifiers
{
  v2 = [(DBNavigationStateProvider *)self activeNavigationIdentifiersObserver];
  id v3 = [v2 activeNavigationIdentifiers];
  id v4 = (void *)[v3 copy];

  return (NSArray *)v4;
}

- (NSString)mostRecentClusterNavigatingApp
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__DBNavigationStateProvider_mostRecentClusterNavigatingApp__block_invoke;
  aBlock[3] = &unk_2649B60F8;
  aBlock[4] = self;
  id v3 = _Block_copy(aBlock);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  id v5 = [(DBNavigationStateProvider *)self appHistoryAppDockProvider];
  char v6 = [v5 orderedBundleIdentifiersMatchingDockCategory:1];
  [v4 addObjectsFromArray:v6];

  uint64_t v7 = [(DBNavigationStateProvider *)self navigatingIdentifiers];
  [v4 addObjectsFromArray:v7];

  id v8 = [v4 array];
  v9 = objc_msgSend(v8, "db_map:", v3);

  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5;
  v18 = __Block_byref_object_dispose__5;
  v10 = [(DBNavigationStateProvider *)self mostRecentlyActivatedClusterApp];
  if (v10) {
    [(DBNavigationStateProvider *)self mostRecentlyActivatedClusterApp];
  }
  else {
  id v19 = [v9 firstObject];
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__DBNavigationStateProvider_mostRecentClusterNavigatingApp__block_invoke_76;
  v13[3] = &unk_2649B6120;
  v13[4] = self;
  v13[5] = &v14;
  [v9 enumerateObjectsUsingBlock:v13];
  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (NSString *)v11;
}

id __59__DBNavigationStateProvider_mostRecentClusterNavigatingApp__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) infoProvider];
  if ([v4 bundleIdentifierSupportsInstrumentCluster:v3])
  {
    id v5 = [*(id *)(a1 + 32) iconProvider];
    int v6 = [v5 isIconVisibleForIdentifier:v3];

    if (v6)
    {
      id v7 = v3;
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v7 = 0;
LABEL_6:

  return v7;
}

void __59__DBNavigationStateProvider_mostRecentClusterNavigatingApp__block_invoke_76(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  int v6 = [*(id *)(a1 + 32) navigatingIdentifiers];
  int v7 = [v6 containsObject:v11];

  if (v7)
  {
    uint64_t v8 = [v11 copy];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

- (NSString)mostRecentDashboardNavigatingApp
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__DBNavigationStateProvider_mostRecentDashboardNavigatingApp__block_invoke;
  aBlock[3] = &unk_2649B60F8;
  aBlock[4] = self;
  id v3 = _Block_copy(aBlock);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  id v5 = [(DBNavigationStateProvider *)self appHistoryAppDockProvider];
  int v6 = [v5 orderedBundleIdentifiersMatchingDockCategory:1];
  [v4 addObjectsFromArray:v6];

  int v7 = [(DBNavigationStateProvider *)self navigatingIdentifiers];
  [v4 addObjectsFromArray:v7];

  uint64_t v8 = [v4 indexesOfObjectsPassingTest:&__block_literal_global_26];
  [v4 removeObjectsAtIndexes:v8];
  uint64_t v9 = [v4 array];
  v10 = objc_msgSend(v9, "db_map:", v3);

  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5;
  id v19 = __Block_byref_object_dispose__5;
  id v11 = [(DBNavigationStateProvider *)self mostRecentlyActivatedDashboardApp];
  if (v11) {
    [(DBNavigationStateProvider *)self mostRecentlyActivatedDashboardApp];
  }
  else {
  id v20 = [v10 firstObject];
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61__DBNavigationStateProvider_mostRecentDashboardNavigatingApp__block_invoke_3;
  v14[3] = &unk_2649B6120;
  v14[4] = self;
  v14[5] = &v15;
  [v10 enumerateObjectsUsingBlock:v14];
  id v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return (NSString *)v12;
}

id __61__DBNavigationStateProvider_mostRecentDashboardNavigatingApp__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) infoProvider];
  if ([v4 bundleIdentifierSupportsDashboard:v3])
  {
    id v5 = [*(id *)(a1 + 32) iconProvider];
    int v6 = [v5 isIconVisibleForIdentifier:v3];

    if (v6)
    {
      id v7 = v3;
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v7 = 0;
LABEL_6:

  return v7;
}

uint64_t __61__DBNavigationStateProvider_mostRecentDashboardNavigatingApp__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[DBApplicationController sharedInstance];
  id v4 = [v3 applicationWithBundleIdentifier:v2];

  uint64_t v5 = [v4 isLockedOrHidden];
  return v5;
}

void __61__DBNavigationStateProvider_mostRecentDashboardNavigatingApp__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  int v6 = [*(id *)(a1 + 32) navigatingIdentifiers];
  int v7 = [v6 containsObject:v11];

  if (v7)
  {
    uint64_t v8 = [v11 copy];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

- (NSString)mostRecentNavigatingApp
{
  id v2 = [(DBNavigationStateProvider *)self navigatingIdentifiers];
  id v3 = [v2 lastObject];

  return (NSString *)v3;
}

- (void)_updateMostRecentDockApp
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__DBNavigationStateProvider__updateMostRecentDockApp__block_invoke;
  aBlock[3] = &unk_2649B60F8;
  aBlock[4] = self;
  id v3 = _Block_copy(aBlock);
  id v4 = [(DBNavigationStateProvider *)self navigatingIdentifiers];
  uint64_t v5 = objc_msgSend(v4, "db_map:", v3);

  int v6 = [v5 lastObject];
  int v7 = v6;
  if (v6)
  {
    uint64_t v8 = (void *)[v6 copy];
    [(DBNavigationStateProvider *)self setMostRecentlyActivatedDashboardApp:v8];

    uint64_t v9 = DBLogForCategory(0x13uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v7;
      _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_INFO, "Updated most recently activated dashboard app to %{public}@", buf, 0xCu);
    }
  }
}

id __53__DBNavigationStateProvider__updateMostRecentDockApp__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) infoProvider];
  if ([v4 bundleIdentifierSupportsDashboard:v3])
  {
    uint64_t v5 = [*(id *)(a1 + 32) iconProvider];
    int v6 = [v5 isIconVisibleForIdentifier:v3];

    if (v6)
    {
      id v7 = v3;
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v7 = 0;
LABEL_6:

  return v7;
}

- (void)_updateMostRecentClusterApp
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__DBNavigationStateProvider__updateMostRecentClusterApp__block_invoke;
  aBlock[3] = &unk_2649B60F8;
  aBlock[4] = self;
  id v3 = _Block_copy(aBlock);
  id v4 = [(DBNavigationStateProvider *)self navigatingIdentifiers];
  uint64_t v5 = objc_msgSend(v4, "db_map:", v3);

  int v6 = [v5 lastObject];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = (void *)[v6 copy];
    [(DBNavigationStateProvider *)self setMostRecentlyActivatedClusterApp:v8];

    uint64_t v9 = DBLogForCategory(0x13uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v7;
      _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_INFO, "Updated most recently activated cluster app to %{public}@", buf, 0xCu);
    }
  }
}

id __56__DBNavigationStateProvider__updateMostRecentClusterApp__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) infoProvider];
  if ([v4 bundleIdentifierSupportsInstrumentCluster:v3])
  {
    uint64_t v5 = [*(id *)(a1 + 32) iconProvider];
    int v6 = [v5 isIconVisibleForIdentifier:v3];

    if (v6)
    {
      id v7 = v3;
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v7 = 0;
LABEL_6:

  return v7;
}

- (void)appHistory:(id)a3 mostRecentHomeScreenUpdatedTo:(id)a4
{
  [(DBNavigationStateProvider *)self _updateMostRecentDockApp];
  [(DBNavigationStateProvider *)self _updateMostRecentClusterApp];
}

- (void)appHistory:(id)a3 mostRecentNavigationAppUpdatedTo:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = DBLogForCategory(0x13uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v14 = 138543362;
    id v15 = v5;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_INFO, "Most recent navigation app updated to %{public}@", (uint8_t *)&v14, 0xCu);
  }

  id v7 = [(DBNavigationStateProvider *)self infoProvider];
  if ([v7 bundleIdentifierSupportsDashboard:v5])
  {
    uint64_t v8 = [(DBNavigationStateProvider *)self iconProvider];
    int v9 = [v8 isIconVisibleForIdentifier:v5];

    if (v9) {
      [(DBNavigationStateProvider *)self setMostRecentlyActivatedDashboardApp:v5];
    }
  }
  else
  {
  }
  v10 = [(DBNavigationStateProvider *)self infoProvider];
  if ([v10 bundleIdentifierSupportsInstrumentCluster:v5])
  {
    id v11 = [(DBNavigationStateProvider *)self iconProvider];
    int v12 = [v11 isIconVisibleForIdentifier:v5];

    if (v12) {
      [(DBNavigationStateProvider *)self setMostRecentlyActivatedClusterApp:v5];
    }
  }
  else
  {
  }
  uint64_t v13 = [(DBNavigationStateProvider *)self observers];
  [v13 navigationStateProvider:self frontmostIdentifierDidChange:v5];
}

- (void)appHistory:(id)a3 mostRecentOtherAppUpdatedTo:(id)a4
{
  id v8 = a4;
  id v5 = [(DBNavigationStateProvider *)self infoProvider];
  if ([v5 bundleIdentifierIsCertificationApp:v8])
  {
    int v6 = [(DBNavigationStateProvider *)self infoProvider];
    int v7 = [v6 bundleIdentifierSupportsInstrumentCluster:v8];

    if (!v7) {
      goto LABEL_5;
    }
    id v5 = [(DBNavigationStateProvider *)self observers];
    [v5 navigationStateProvider:self frontmostIdentifierDidChange:v8];
  }

LABEL_5:
}

- (void)activeNavigationIdentifiersObserver:(id)a3 updatedActiveNavigationIdentifiers:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = DBLogForCategory(0x13uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v7;
    _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Active navigation identifiers changed: %{public}@", buf, 0xCu);
  }

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __100__DBNavigationStateProvider_activeNavigationIdentifiersObserver_updatedActiveNavigationIdentifiers___block_invoke;
  v10[3] = &unk_2649B3D30;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

void __100__DBNavigationStateProvider_activeNavigationIdentifiersObserver_updatedActiveNavigationIdentifiers___block_invoke(uint64_t a1)
{
  if (DBIsInternalInstall_onceToken_3 != -1) {
    dispatch_once(&DBIsInternalInstall_onceToken_3, &__block_literal_global_160);
  }
  if (!DBIsInternalInstall_isInternal_3
    || ([MEMORY[0x263EFFA40] standardUserDefaults],
        id v2 = objc_claimAutoreleasedReturnValue(),
        char v3 = [v2 BOOLForKey:@"CARDisableAutoLaunchNavigation"],
        v2,
        (v3 & 1) == 0))
  {
    [*(id *)(a1 + 32) _updateMostRecentDockApp];
    [*(id *)(a1 + 32) _updateMostRecentClusterApp];
    id v6 = [*(id *)(a1 + 32) observers];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) activeNavigationIdentifiers];
    [v6 navigationStateProvider:v4 navigatingIdentifiersDidChange:v5];
  }
}

- (void)applicationController:(id)a3 addedApplications:(id)a4 updatedApplications:(id)a5 removedApplications:(id)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (DBIsInternalInstall_onceToken_3 != -1) {
    dispatch_once(&DBIsInternalInstall_onceToken_3, &__block_literal_global_160);
  }
  if (!DBIsInternalInstall_isInternal_3
    || ([MEMORY[0x263EFFA40] standardUserDefaults],
        id v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = [v13 BOOLForKey:@"CARDisableAutoLaunchNavigation"],
        v13,
        (v14 & 1) == 0))
  {
    [(DBNavigationStateProvider *)self _updateMostRecentDockApp];
    [(DBNavigationStateProvider *)self _updateMostRecentClusterApp];
    id v15 = [(DBNavigationStateProvider *)self observers];
    uint64_t v16 = [(DBNavigationStateProvider *)self activeNavigationIdentifiersObserver];
    uint64_t v17 = [v16 activeNavigationIdentifiers];
    [v15 navigationStateProvider:self navigatingIdentifiersDidChange:v17];
  }
}

- (void)invalidate
{
}

- (DBIconProviding)iconProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconProvider);
  return (DBIconProviding *)WeakRetained;
}

- (DBNavigationAppInfoProviding)infoProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_infoProvider);
  return (DBNavigationAppInfoProviding *)WeakRetained;
}

- (void)setInfoProvider:(id)a3
{
}

- (DBAppHistoryAppDockProviding)appHistoryAppDockProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appHistoryAppDockProvider);
  return (DBAppHistoryAppDockProviding *)WeakRetained;
}

- (void)setAppHistoryAppDockProvider:(id)a3
{
}

- (CARActiveNavigationIdentifiersObserver)activeNavigationIdentifiersObserver
{
  return self->_activeNavigationIdentifiersObserver;
}

- (void)setActiveNavigationIdentifiersObserver:(id)a3
{
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSString)mostRecentlyActivatedDashboardApp
{
  return self->_mostRecentlyActivatedDashboardApp;
}

- (void)setMostRecentlyActivatedDashboardApp:(id)a3
{
}

- (NSString)mostRecentlyActivatedClusterApp
{
  return self->_mostRecentlyActivatedClusterApp;
}

- (void)setMostRecentlyActivatedClusterApp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentlyActivatedClusterApp, 0);
  objc_storeStrong((id *)&self->_mostRecentlyActivatedDashboardApp, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_activeNavigationIdentifiersObserver, 0);
  objc_destroyWeak((id *)&self->_appHistoryAppDockProvider);
  objc_destroyWeak((id *)&self->_infoProvider);
  objc_destroyWeak((id *)&self->_iconProvider);
}

@end