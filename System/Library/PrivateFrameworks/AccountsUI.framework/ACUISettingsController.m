@interface ACUISettingsController
- (ACUISettingsController)init;
- (BOOL)_isAccount:(id)a3 inList:(id)a4;
- (BOOL)_isAccountList:(id)a3 identicalToAccountList:(id)a4;
- (BOOL)_isAccountModificationDisabledByRestrictions;
- (BOOL)isShowDataclassDetailFromAppsEnabled;
- (BOOL)prepareHandlingURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 animatePush:(BOOL *)a5 withCompletion:(id)a6;
- (id)_accountGroupIdentifier:(id)a3 ignoringGroups:(id)a4;
- (id)_accountStore;
- (id)_addAccountSpecifier;
- (id)_scheduleSettingsModeForSpecifier:(id)a3;
- (id)_settingsPluginManager;
- (id)_specifierForAccount:(id)a3;
- (id)_specifierForCollectionCellLinkingToAccounts:(id)a3 withGroupIdentifier:(id)a4 underParentGroup:(id)a5;
- (id)_specifierForScheduleSettings;
- (id)_specifiersForLoadingMessage;
- (id)_specifiersForSettingsProvidedByPlugin:(id)a3;
- (id)navigationItem;
- (id)specifiers;
- (void)_accountCellWasTappedWithSpecifier:(id)a3;
- (void)_accountStoreDidChange;
- (void)_accountsWithCompletion:(id)a3;
- (void)_effectiveSettingsChangedNotification:(id)a3;
- (void)_fetchLazyLoadedSpecifiers;
- (void)_filterAccounts:(id)a3 toTopLevel:(id)a4 grouped:(id)a5 ignoringGroups:(id)a6;
- (void)_loadAccountsWithCompletion:(id)a3;
- (void)_lowPowerModeChangedNotification:(id)a3;
- (void)_scheduleSettingsCellWasTappedWithSpecifier:(id)a3;
- (void)_specifiersForAccountsGroupWithCompletion:(id)a3;
- (void)accountWasAdded:(id)a3;
- (void)accountWasModified:(id)a3;
- (void)accountWasRemoved:(id)a3;
- (void)dealloc;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)setSpecifier:(id)a3;
- (void)specifiersDidChangeForPlugin:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewController:(id)a3 didFinishRemovingAccountWithSuccess:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ACUISettingsController

- (ACUISettingsController)init
{
  SEL v12 = a2;
  id v13 = 0;
  v11.receiver = self;
  v11.super_class = (Class)ACUISettingsController;
  id v13 = [(ACUISettingsController *)&v11 init];
  objc_storeStrong(&v13, v13);
  if (v13)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3 = (void *)*((void *)v13 + 175);
    *((void *)v13 + 175) = v2;

    dispatch_group_t v4 = dispatch_group_create();
    v5 = (void *)*((void *)v13 + 187);
    *((void *)v13 + 187) = v4;

    dispatch_group_enter(*((dispatch_group_t *)v13 + 187));
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7 = (void *)*((void *)v13 + 180);
    *((void *)v13 + 180) = v6;

    id v10 = (id)[MEMORY[0x1E4F28EB8] defaultCenter];
    objc_msgSend(v10, "addObserver:selector:name:object:", v13, sel__lowPowerModeChangedNotification_, *MEMORY[0x1E4F287E8]);
    [v10 addObserver:v13 selector:sel__effectiveSettingsChangedNotification_ name:*MEMORY[0x1E4F73EC0] object:0];
    objc_storeStrong(&v10, 0);
  }
  v9 = (ACUISettingsController *)v13;
  objc_storeStrong(&v13, 0);
  return v9;
}

- (void)viewDidAppear:(BOOL)a3
{
  v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ACUISettingsController;
  [(ACUISettingsController *)&v5 viewDidAppear:a3];
  id v3 = (id)[(ACUISettingsController *)v8 specifier];
  id v4 = (id)[v3 propertyForKey:*MEMORY[0x1E4F93078]];

  +[ACUIUtils emitNavigationEventForSubPane:subPath:account:inHostAppBundleID:](ACUIUtils, "emitNavigationEventForSubPane:subPath:account:inHostAppBundleID:", v8, @"root");
  objc_storeStrong(&v4, 0);
}

- (void)_lowPowerModeChangedNotification:(id)a3
{
  objc_super v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x1E4F14428];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  SEL v7 = __59__ACUISettingsController__lowPowerModeChangedNotification___block_invoke;
  v8 = &unk_1E6D20118;
  v9 = v11;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __59__ACUISettingsController__lowPowerModeChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifierID:animated:", @"FETCH_NEW_DATA", 1, a1, a1);
}

- (void)_effectiveSettingsChangedNotification:(id)a3
{
  objc_super v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x1E4F14428];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  SEL v7 = __64__ACUISettingsController__effectiveSettingsChangedNotification___block_invoke;
  v8 = &unk_1E6D20118;
  v9 = v11;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __64__ACUISettingsController__effectiveSettingsChangedNotification___block_invoke(uint64_t result)
{
  if ((*(unsigned char *)(*(void *)(result + 32) + 1488) & 1) != 1) {
    return [*(id *)(result + 32) reloadSpecifiers];
  }
  *(unsigned char *)(*(void *)(result + 32) + 1488) = 0;
  return result;
}

- (void)dealloc
{
  uint64_t v4 = self;
  v3[1] = (id)a2;
  if (self->_accountStore) {
    [(ACMonitoredAccountStore *)v4->_accountStore removeDelegate:v4];
  }
  [(ACUISettingsPluginManager *)v4->_settingsPluginManager parentViewControllerWillDisappear];
  v3[0] = (id)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v3[0] removeObserver:v4];
  objc_storeStrong(v3, 0);
  v2.receiver = v4;
  v2.super_class = (Class)ACUISettingsController;
  [(ACUISettingsController *)&v2 dealloc];
}

- (id)navigationItem
{
  v7[2] = self;
  v7[1] = (id)a2;
  v6.receiver = self;
  v6.super_class = (Class)ACUISettingsController;
  v7[0] = [(ACUISettingsController *)&v6 navigationItem];
  id v4 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = (id)[v4 localizedStringForKey:@"ACCOUNTS" value:&stru_1F39EF5C0 table:@"Localizable"];
  objc_msgSend(v7[0], "setBackButtonTitle:");

  id v5 = v7[0];
  objc_storeStrong(v7, 0);
  return v5;
}

- (void)setSpecifier:(id)a3
{
  SEL v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)ACUISettingsController;
  [(ACUISettingsController *)&v5 setSpecifier:location[0]];
  id v3 = (NSString *)(id)[location[0] propertyForKey:*MEMORY[0x1E4F93058]];
  filteredDataclass = v7->_filteredDataclass;
  v7->_filteredDataclass = v3;

  objc_storeStrong(location, 0);
}

- (BOOL)prepareHandlingURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 animatePush:(BOOL *)a5 withCompletion:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  v22[1] = a5;
  v22[0] = 0;
  objc_storeStrong(v22, a6);
  if (v25->_specifierLoadGroup)
  {
    id v21 = _ACUILogSystem();
    os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v27, (uint64_t)"-[ACUISettingsController prepareHandlingURLForSpecifierID:resourceDictionary:animatePush:withCompletion:]", 233, (uint64_t)v23);
      _os_log_debug_impl(&dword_1DDFE5000, (os_log_t)v21, v20, "%s (%d) \"Deferring URL load for resources %@\"", v27, 0x1Cu);
    }
    objc_storeStrong(&v21, 0);
    group = v25->_specifierLoadGroup;
    queue = MEMORY[0x1E4F14428];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    int v13 = -1073741824;
    int v14 = 0;
    v15 = __105__ACUISettingsController_prepareHandlingURLForSpecifierID_resourceDictionary_animatePush_withCompletion___block_invoke;
    v16 = &unk_1E6D20628;
    v17 = v25;
    id v18 = v23;
    id v19 = v22[0];
    dispatch_group_notify(group, queue, &v12);

    char v26 = 0;
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong((id *)&v17, 0);
  }
  else
  {
    char v26 = 1;
  }
  objc_storeStrong(v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  return v26 & 1;
}

uint64_t __105__ACUISettingsController_prepareHandlingURLForSpecifierID_resourceDictionary_animatePush_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleURL:withCompletion:", *(void *)(a1 + 40), *(void *)(a1 + 48), a1, a1);
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v15 = _ACUILogSystem();
  os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v20, (uint64_t)"-[ACUISettingsController handleURL:withCompletion:]", 245, (uint64_t)location[0]);
    _os_log_debug_impl(&dword_1DDFE5000, (os_log_t)v15, v14, "%s (%d) \"Handling URL load for resources %@\"", v20, 0x1Cu);
  }
  objc_storeStrong(&v15, 0);
  v18->_isInHandleURL = 1;
  v13.receiver = v18;
  v13.super_class = (Class)ACUISettingsController;
  [(ACUISettingsController *)&v13 handleURL:location[0] withCompletion:&__block_literal_global_8];
  v18->_isInHandleURL = 0;
  if (v18->_viewControllerPushedByControllerLoadActionDuringHandleURL)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = (id)[location[0] objectForKey:@"path"];
      objc_super v6 = (void *)MEMORY[0x1E4F1CA48];
      id v7 = (id)[v12 pathComponents];
      id v11 = (id)objc_msgSend(v6, "arrayWithArray:");

      if ([v11 count])
      {
        [v11 removeObjectAtIndex:0];
        id v4 = (id)[NSString pathWithComponents:v11];
        id v5 = v12;
        id v12 = v4;

        id v10 = (id)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:location[0]];
        [v10 setObject:v12 forKey:@"path"];
        [(PSViewController *)v18->_viewControllerPushedByControllerLoadActionDuringHandleURL handleURL:v10 withCompletion:v16];
        objc_storeStrong(&v10, 0);
      }
      else if (v16)
      {
        (*((void (**)(void))v16 + 2))();
      }
      objc_storeStrong(&v11, 0);
      objc_storeStrong(&v12, 0);
    }
    objc_storeStrong((id *)&v18->_viewControllerPushedByControllerLoadActionDuringHandleURL, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)_ACUILogSystem();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v19, (uint64_t)"-[ACUISettingsController handleURL:withCompletion:]", 272, (uint64_t)location[0]);
      _os_log_error_impl(&dword_1DDFE5000, oslog, OS_LOG_TYPE_ERROR, "%s (%d) \"No subview to display matching dictionary %@\"", v19, 0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v16) {
      (*((void (**)(void))v16 + 2))();
    }
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (id)_accountStore
{
  if (!self->_accountStore)
  {
    objc_super v2 = (ACMonitoredAccountStore *)+[ACUIViewController acuiAccountStore];
    accountStore = self->_accountStore;
    self->_accountStore = v2;

    [(ACMonitoredAccountStore *)self->_accountStore addDelegate:self];
  }
  id v4 = self->_accountStore;
  return v4;
}

- (void)_accountsWithCompletion:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v12->_accounts)
  {
    if (location[0]) {
      (*((void (**)(id, NSArray *))location[0] + 2))(location[0], v12->_accounts);
    }
  }
  else
  {
    id v3 = v12;
    uint64_t v4 = MEMORY[0x1E4F143A8];
    int v5 = -1073741824;
    int v6 = 0;
    id v7 = __50__ACUISettingsController__accountsWithCompletion___block_invoke;
    v8 = &unk_1E6D20650;
    v9 = v12;
    id v10 = location[0];
    [(ACUISettingsController *)v3 _loadAccountsWithCompletion:&v4];
    objc_storeStrong(&v10, 0);
    objc_storeStrong((id *)&v9, 0);
  }
  objc_storeStrong(location, 0);
}

void __50__ACUISettingsController__accountsWithCompletion___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  int v5 = MEMORY[0x1E4F14428];
  dispatch_assert_queue_V2(v5);

  uint64_t v2 = [location[0] copy];
  id v3 = (void **)(a1[4] + 1392);
  uint64_t v4 = *v3;
  ACUISettingsController *v3 = (void *)v2;

  if (a1[5]) {
    (*(void (**)(void))(a1[5] + 16))();
  }
  objc_storeStrong(location, 0);
}

- (void)_loadAccountsWithCompletion:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v53 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v51 = 0;
  id v50 = (id)[MEMORY[0x1E4F1CA48] array];
  memset(__b, 0, sizeof(__b));
  id v17 = [(ACUISettingsController *)v53 _accountStore];
  id obj = (id)[v17 monitoredAccounts];

  uint64_t v19 = [obj countByEnumeratingWithState:__b objects:v54 count:16];
  if (v19)
  {
    uint64_t v14 = *(void *)__b[2];
    uint64_t v15 = 0;
    unint64_t v16 = v19;
    while (1)
    {
      uint64_t v13 = v15;
      if (*(void *)__b[2] != v14) {
        objc_enumerationMutation(obj);
      }
      id v49 = *(id *)(__b[1] + 8 * v15);
      if ([v49 isVisible])
      {
        id v3 = (id)[v49 parentAccount];
        BOOL v12 = v3 == 0;

        if (v12)
        {
          id v4 = (id)[v49 enabledDataclasses];
          if (v53->_filteredDataclass)
          {
            id v11 = (id)[v49 provisionedDataclasses];
            uint64_t v41 = MEMORY[0x1E4F143A8];
            int v42 = -1073741824;
            int v43 = 0;
            v44 = __54__ACUISettingsController__loadAccountsWithCompletion___block_invoke;
            v45 = &unk_1E6D20678;
            v46 = v53;
            id v47 = (id)[v11 objectsPassingTest:&v41];

            if (![v47 count])
            {
              id v10 = (id)[v49 accountType];
              id v9 = (id)[v10 supportedDataclasses];
              uint64_t v35 = MEMORY[0x1E4F143A8];
              int v36 = -1073741824;
              int v37 = 0;
              v38 = __54__ACUISettingsController__loadAccountsWithCompletion___block_invoke_2;
              v39 = &unk_1E6D20678;
              v40 = v53;
              id v5 = (id)[v9 objectsPassingTest:&v35];
              id v6 = v47;
              id v47 = v5;

              objc_storeStrong((id *)&v40, 0);
            }
            if ([v47 count]) {
              [v50 addObject:v49];
            }
            objc_storeStrong(&v47, 0);
            objc_storeStrong((id *)&v46, 0);
          }
          else
          {
            [v50 addObject:v49];
          }
        }
      }
      ++v15;
      if (v13 + 1 >= v16)
      {
        uint64_t v15 = 0;
        unint64_t v16 = [obj countByEnumeratingWithState:__b objects:v54 count:16];
        if (!v16) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v51, v50);
  id v34 = ACUISortedAccountTypes();
  id v7 = v51;
  uint64_t v27 = MEMORY[0x1E4F143A8];
  int v28 = -1073741824;
  int v29 = 0;
  v30 = __54__ACUISettingsController__loadAccountsWithCompletion___block_invoke_3;
  v31 = &unk_1E6D205D0;
  id v32 = v34;
  id v33 = (id)[v7 sortedArrayUsingComparator:&v27];
  queue = MEMORY[0x1E4F14428];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  int v21 = -1073741824;
  int v22 = 0;
  id v23 = __54__ACUISettingsController__loadAccountsWithCompletion___block_invoke_4;
  v24 = &unk_1E6D1FFD0;
  id v26 = location[0];
  id v25 = v33;
  dispatch_async(queue, &v20);

  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(location, 0);
}

uint64_t __54__ACUISettingsController__loadAccountsWithCompletion___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  char v6 = 0;
  if (objc_opt_isKindOfClass()) {
    char v6 = [location[0] hasPrefix:*(void *)(a1[4] + 1480)];
  }
  *a3 = v6 & 1;
  objc_storeStrong(location, 0);
  return v6 & 1;
}

uint64_t __54__ACUISettingsController__loadAccountsWithCompletion___block_invoke_2(void *a1, void *a2, unsigned char *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  char v6 = 0;
  if (objc_opt_isKindOfClass()) {
    char v6 = [location[0] hasPrefix:*(void *)(a1[4] + 1480)];
  }
  *a3 = v6 & 1;
  objc_storeStrong(location, 0);
  return v6 & 1;
}

uint64_t __54__ACUISettingsController__loadAccountsWithCompletion___block_invoke_3(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v14 = 0;
  objc_storeStrong(&v14, a3);
  v13[1] = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v4 = (id)[location[0] accountType];
    v13[0] = (id)[v4 identifier];

    id v5 = (id)[v14 accountType];
    id v12 = (id)[v5 identifier];

    uint64_t v11 = [a1[4] indexOfObject:v13[0]];
    uint64_t v10 = [a1[4] indexOfObject:v12];
    id v7 = (id)[NSNumber numberWithInteger:v11];
    id v6 = (id)[NSNumber numberWithInteger:v10];
    uint64_t v16 = objc_msgSend(v7, "compare:");

    objc_storeStrong(&v12, 0);
    objc_storeStrong(v13, 0);
  }
  else
  {
    uint64_t v16 = 0;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v16;
}

uint64_t __54__ACUISettingsController__loadAccountsWithCompletion___block_invoke_4(uint64_t result)
{
  if (*(void *)(result + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 40) + 16))();
  }
  return result;
}

- (void)_accountStoreDidChange
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = self;
  location[1] = (id)a2;
  location[0] = _ACUILogSystem();
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_32_4_0((uint64_t)v12, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]", 370);
    _os_log_impl(&dword_1DDFE5000, (os_log_t)location[0], v9, "%s (%d) \"ACUISettingsController received monitored account delegate call.\"", v12, 0x12u);
  }
  objc_storeStrong(location, 0);
  uint64_t v2 = v11;
  uint64_t v3 = MEMORY[0x1E4F143A8];
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = __48__ACUISettingsController__accountStoreDidChange__block_invoke;
  id v7 = &unk_1E6D206C8;
  v8 = v11;
  [(ACUISettingsController *)v2 _loadAccountsWithCompletion:&v3];
  objc_storeStrong((id *)&v8, 0);
}

void __48__ACUISettingsController__accountStoreDidChange__block_invoke(id *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v14[1] = a1;
  if ([a1[4] _isAccountList:location[0] identicalToAccountList:*((void *)a1[4] + 174)])
  {
    v14[0] = _ACUILogSystem();
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v14[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v16, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]_block_invoke", 374);
      _os_log_impl(&dword_1DDFE5000, (os_log_t)v14[0], v13, "%s (%d) \"ACUISettingsController will ignore monitored account delegate call because the account list has not changed.\"", v16, 0x12u);
    }
    objc_storeStrong(v14, 0);
    int v12 = 1;
  }
  else
  {
    objc_storeStrong((id *)a1[4] + 174, location[0]);
    id v11 = (id)[*((id *)a1[4] + 175) copy];
    id v2 = a1[4];
    uint64_t v4 = MEMORY[0x1E4F143A8];
    int v5 = -1073741824;
    int v6 = 0;
    id v7 = __48__ACUISettingsController__accountStoreDidChange__block_invoke_65;
    v8 = &unk_1E6D206A0;
    id v9 = v11;
    id v10 = a1[4];
    [v2 _specifiersForAccountsGroupWithCompletion:&v4];
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v11, 0);
    int v12 = 0;
  }
  objc_storeStrong(location, 0);
}

void __48__ACUISettingsController__accountStoreDidChange__block_invoke_65(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v23[1] = (os_log_t)a1;
  if ([*(id *)(a1 + 32) count])
  {
    if ([location[0] count])
    {
      os_log_t oslog = (os_log_t)_ACUILogSystem();
      os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_2_8_32_4_0((uint64_t)v29, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]_block_invoke", 390);
        _os_log_debug_impl(&dword_1DDFE5000, oslog, v18, "%s (%d) \"ACUISettingsController _accountStoreDidChange: BEGIN UPDATES!\"", v29, 0x12u);
      }
      objc_storeStrong((id *)&oslog, 0);
      [*(id *)(a1 + 40) beginUpdates];
      os_log_t v17 = (os_log_t)_ACUILogSystem();
      os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v28, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]_block_invoke", 393, *(void *)(a1 + 32));
        _os_log_debug_impl(&dword_1DDFE5000, v17, v16, "%s (%d) \"ACUISettingsController _accountStoreDidChange: removing specifiers %@\"", v28, 0x1Cu);
      }
      objc_storeStrong((id *)&v17, 0);
      memset(__b, 0, sizeof(__b));
      id obj = (id)[*(id *)(a1 + 32) reverseObjectEnumerator];
      uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
      if (v9)
      {
        uint64_t v5 = *(void *)__b[2];
        uint64_t v6 = 0;
        unint64_t v7 = v9;
        while (1)
        {
          uint64_t v4 = v6;
          if (*(void *)__b[2] != v5) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(id *)(__b[1] + 8 * v6);
          id v2 = *(void **)(a1 + 40);
          id v3 = (id)[v15 identifier];
          objc_msgSend(v2, "removeSpecifierID:");

          ++v6;
          if (v4 + 1 >= v7)
          {
            uint64_t v6 = 0;
            unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
            if (!v7) {
              break;
            }
          }
        }
      }

      os_log_t v13 = (os_log_t)_ACUILogSystem();
      os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v26, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]_block_invoke", 398, (uint64_t)location[0], *(void *)(*(void *)(a1 + 40) + 1408));
        _os_log_debug_impl(&dword_1DDFE5000, v13, v12, "%s (%d) \"ACUISettingsController _accountStoreDidChange: inserting specifiers %@ after specifier %@\"", v26, 0x26u);
      }
      objc_storeStrong((id *)&v13, 0);
      [*(id *)(a1 + 40) insertContiguousSpecifiers:location[0] afterSpecifier:*(void *)(*(void *)(a1 + 40) + 1408)];
      os_log_t v11 = (os_log_t)_ACUILogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_2_8_32_4_0((uint64_t)v25, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]_block_invoke", 401);
        _os_log_debug_impl(&dword_1DDFE5000, v11, OS_LOG_TYPE_DEBUG, "%s (%d) \"ACUISettingsController _accountStoreDidChange: END UPDATES!\"", v25, 0x12u);
      }
      objc_storeStrong((id *)&v11, 0);
      [*(id *)(a1 + 40) endUpdates];
    }
    else
    {
      id v21 = _ACUILogSystem();
      os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v30, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]_block_invoke", 386, *(void *)(a1 + 32));
        _os_log_debug_impl(&dword_1DDFE5000, (os_log_t)v21, v20, "%s (%d) \"ACUISettingsController _accountStoreDidChange: removing specifiers %@\"", v30, 0x1Cu);
      }
      objc_storeStrong(&v21, 0);
      [*(id *)(a1 + 40) removeContiguousSpecifiers:*(void *)(a1 + 32) animated:0];
    }
  }
  else
  {
    v23[0] = (os_log_t)_ACUILogSystem();
    os_log_type_t type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v23[0], OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v31, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]_block_invoke", 383, (uint64_t)location[0], *(void *)(*(void *)(a1 + 40) + 1408));
      _os_log_debug_impl(&dword_1DDFE5000, v23[0], type, "%s (%d) \"ACUISettingsController _accountStoreDidChange: inserting specifiers %@ after specifier %@\"", v31, 0x26u);
    }
    objc_storeStrong((id *)v23, 0);
    [*(id *)(a1 + 40) insertContiguousSpecifiers:location[0] afterSpecifier:*(void *)(*(void *)(a1 + 40) + 1408)];
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_isAccountList:(id)a3 identicalToAccountList:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  os_log_type_t v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  uint64_t v12 = [location[0] count];
  if (v12 == [v16 count])
  {
    memset(__b, 0, sizeof(__b));
    id v9 = location[0];
    uint64_t v10 = [v9 countByEnumeratingWithState:__b objects:v20 count:16];
    if (v10)
    {
      uint64_t v6 = *(void *)__b[2];
      uint64_t v7 = 0;
      unint64_t v8 = v10;
      while (1)
      {
        uint64_t v5 = v7;
        if (*(void *)__b[2] != v6) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(__b[1] + 8 * v7);
        if (![(ACUISettingsController *)v18 _isAccount:v14 inList:v16]) {
          break;
        }
        ++v7;
        if (v5 + 1 >= v8)
        {
          uint64_t v7 = 0;
          unint64_t v8 = [v9 countByEnumeratingWithState:__b objects:v20 count:16];
          if (!v8) {
            goto LABEL_11;
          }
        }
      }
      char v19 = 0;
      int v15 = 1;
    }
    else
    {
LABEL_11:
      int v15 = 0;
    }

    if (!v15)
    {
      char v19 = 1;
      int v15 = 1;
    }
  }
  else
  {
    char v19 = 0;
    int v15 = 1;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v19 & 1;
}

- (BOOL)_isAccount:(id)a3 inList:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v33 = 0;
  objc_storeStrong(&v33, a4);
  memset(__b, 0, sizeof(__b));
  id v12 = v33;
  uint64_t v13 = [v12 countByEnumeratingWithState:__b objects:v36 count:16];
  if (v13)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    unint64_t v10 = v13;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(v12);
      }
      id v32 = *(id *)(__b[1] + 8 * v9);
      int v5 = [v32 isAuthenticated] & 1;
      char v29 = 0;
      char v27 = 0;
      char v25 = 0;
      char v23 = 0;
      char v21 = 0;
      char v19 = 0;
      char v17 = 0;
      char v15 = 0;
      char v6 = 0;
      if (v5 == ([location[0] isAuthenticated] & 1))
      {
        id v30 = (id)[v32 identifier];
        char v29 = 1;
        id v28 = (id)[location[0] identifier];
        char v27 = 1;
        char v6 = 0;
        if (objc_msgSend(v30, "isEqualToString:"))
        {
          id v26 = (id)[v32 accountDescription];
          char v25 = 1;
          id v24 = (id)[location[0] accountDescription];
          char v23 = 1;
          char v6 = 0;
          if (objc_msgSend(v26, "isEqualToString:"))
          {
            id v22 = (id)[v32 enabledDataclasses];
            char v21 = 1;
            id v20 = (id)[location[0] enabledDataclasses];
            char v19 = 1;
            char v6 = 0;
            if (objc_msgSend(v22, "isEqualToSet:"))
            {
              id v18 = (id)[v32 provisionedDataclasses];
              char v17 = 1;
              id v16 = (id)[location[0] provisionedDataclasses];
              char v15 = 1;
              char v6 = objc_msgSend(v18, "isEqualToSet:");
            }
          }
        }
      }
      if (v15) {

      }
      if (v17) {
      if (v19)
      }

      if (v21) {
      if (v23)
      }

      if (v25) {
      if (v27)
      }

      if (v29) {
      if (v6)
      }
        break;
      ++v9;
      if (v7 + 1 >= v10)
      {
        uint64_t v9 = 0;
        unint64_t v10 = [v12 countByEnumeratingWithState:__b objects:v36 count:16];
        if (!v10) {
          goto LABEL_30;
        }
      }
    }
    char v35 = 1;
    int v14 = 1;
  }
  else
  {
LABEL_30:
    int v14 = 0;
  }

  if (!v14) {
    char v35 = 0;
  }
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
  return v35 & 1;
}

- (id)_settingsPluginManager
{
  if (!self->_settingsPluginManager)
  {
    id v2 = [[ACUISettingsPluginManager alloc] initWithParentViewController:self];
    settingsPluginManager = self->_settingsPluginManager;
    self->_settingsPluginManager = v2;
  }
  uint64_t v4 = self->_settingsPluginManager;
  return v4;
}

- (void)_filterAccounts:(id)a3 toTopLevel:(id)a4 grouped:(id)a5 ignoringGroups:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = 0;
  objc_storeStrong(&v26, a4);
  id v25 = 0;
  objc_storeStrong(&v25, a5);
  id v24 = 0;
  objc_storeStrong(&v24, a6);
  memset(__b, 0, sizeof(__b));
  id v18 = location[0];
  uint64_t v19 = [v18 countByEnumeratingWithState:__b objects:v29 count:16];
  if (v19)
  {
    uint64_t v12 = *(void *)__b[2];
    uint64_t v13 = 0;
    unint64_t v14 = v19;
    while (1)
    {
      uint64_t v11 = v13;
      if (*(void *)__b[2] != v12) {
        objc_enumerationMutation(v18);
      }
      uint64_t v23 = *(void *)(__b[1] + 8 * v13);
      id v21 = [(ACUISettingsController *)v28 _accountGroupIdentifier:v23 ignoringGroups:v24];
      if (v21)
      {
        id v10 = (id)[v25 objectForKey:v21];
        id v20 = (id)[v10 mutableCopy];

        if (!v20)
        {
          id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v7 = v20;
          id v20 = v6;
        }
        [v20 addObject:v23];
        id v8 = v25;
        id v9 = (id)[v20 copy];
        objc_msgSend(v8, "setObject:forKey:");

        objc_storeStrong(&v20, 0);
      }
      else
      {
        [v26 addObject:v23];
      }
      objc_storeStrong(&v21, 0);
      ++v13;
      if (v11 + 1 >= v14)
      {
        uint64_t v13 = 0;
        unint64_t v14 = [v18 countByEnumeratingWithState:__b objects:v29 count:16];
        if (!v14) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (id)_accountGroupIdentifier:(id)a3 ignoringGroups:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v8 = (id)[location[0] accountType];
  id v7 = (id)[v8 identifier];
  char v9 = [v7 isEqualToString:*MEMORY[0x1E4F17858]];

  if (v9 & 1) == 0 || ([v10 containsObject:*MEMORY[0x1E4F17858]]) {
    id v12 = 0;
  }
  else {
    id v12 = (id)*MEMORY[0x1E4F17858];
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  uint64_t v4 = v12;
  return v4;
}

- (id)specifiers
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v30 = self;
  location[1] = (id)a2;
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]))
  {
    location[0] = _ACUILogSystem();
    os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v31, (uint64_t)"-[ACUISettingsController specifiers]", 477);
      _os_log_impl(&dword_1DDFE5000, (os_log_t)location[0], v28, "%s (%d) \"ACUISettingsController is loading specifiers.\"", v31, 0x12u);
    }
    objc_storeStrong(location, 0);
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v13 = (void *)MEMORY[0x1E4F92E70];
    id v15 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v14 = (id)[v15 localizedStringForKey:@"ACCOUNTS" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v2 = (PSSpecifier *)(id)objc_msgSend(v13, "groupSpecifierWithName:");
    accountGroupSpecifier = v30->_accountGroupSpecifier;
    v30->_accountGroupSpecifier = v2;

    [v27 addObject:v30->_accountGroupSpecifier];
    id v26 = (id)[MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
    BOOL v25 = 0;
    BOOL v25 = v30->_accounts == 0;
    if (v25) {
      [v27 addObject:v26];
    }
    id v12 = v30;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    int v17 = -1073741824;
    int v18 = 0;
    uint64_t v19 = __36__ACUISettingsController_specifiers__block_invoke;
    id v20 = &unk_1E6D206F0;
    BOOL v24 = v25;
    id v21 = v30;
    id v22 = v26;
    id v23 = v27;
    [(ACUISettingsController *)v12 _specifiersForAccountsGroupWithCompletion:&v16];
    if ((ACUIIsSharedIPadMode() & 1) == 0)
    {
      id v10 = v27;
      id v11 = [(ACUISettingsController *)v30 _addAccountSpecifier];
      objc_msgSend(v10, "addObject:");
    }
    id v6 = v27;
    id v7 = (id)[MEMORY[0x1E4F92E70] emptyGroupSpecifier];
    objc_msgSend(v6, "addObject:");

    id v8 = v27;
    id v9 = [(ACUISettingsController *)v30 _specifierForScheduleSettings];
    objc_msgSend(v8, "addObject:");

    objc_storeStrong((id *)((char *)&v30->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]), v27);
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong((id *)&v21, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
  }
  uint64_t v4 = *(Class *)((char *)&v30->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  return v4;
}

void __36__ACUISettingsController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v2 = MEMORY[0x1E4F14428];
  dispatch_assert_queue_V2(v2);

  if (*(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 32) insertContiguousSpecifiers:location[0] afterSpecifier:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) removeSpecifier:*(void *)(a1 + 40)];
    if (*(void *)(*(void *)(a1 + 32) + 1496))
    {
      dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 1496));
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 1496), 0);
    }
  }
  else
  {
    [*(id *)(a1 + 48) addObjectsFromArray:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)_specifiersForAccountsGroupWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = _ACUILogSystem();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_32_4_0((uint64_t)v19, (uint64_t)"-[ACUISettingsController _specifiersForAccountsGroupWithCompletion:]", 532);
    _os_log_impl(&dword_1DDFE5000, (os_log_t)v14, v13, "%s (%d) \"ACUISettingsController _specifiersForAccountsGroup called.\"", v19, 0x12u);
  }
  objc_storeStrong(&v14, 0);
  int v18 = (dispatch_once_t *)&_specifiersForAccountsGroupWithCompletion__onceToken;
  id v17 = 0;
  objc_storeStrong(&v17, &__block_literal_global_69);
  if (*v18 != -1) {
    dispatch_once(v18, v17);
  }
  objc_storeStrong(&v17, 0);
  BOOL v12 = 1;
  if ((_specifiersForAccountsGroupWithCompletion__pluginsHandleModificationRestriction & 1) == 0) {
    BOOL v12 = ![(ACUISettingsController *)v16 _isAccountModificationDisabledByRestrictions];
  }
  id v3 = v16;
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __68__ACUISettingsController__specifiersForAccountsGroupWithCompletion___block_invoke_2;
  id v8 = &unk_1E6D20718;
  id v9 = v16;
  BOOL v11 = v12;
  id v10 = location[0];
  [(ACUISettingsController *)v3 _accountsWithCompletion:&v4];
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __68__ACUISettingsController__specifiersForAccountsGroupWithCompletion___block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  if (result) {
    _specifiersForAccountsGroupWithCompletion__pluginsHandleModificationRestriction = 1;
  }
  return result;
}

void __68__ACUISettingsController__specifiersForAccountsGroupWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v51[1] = (id)a1;
  v51[0] = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [*(id *)(a1 + 32) _filterAccounts:location[0] toTopLevel:v51[0] grouped:v50 ignoringGroups:0];
  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  memset(__b, 0, sizeof(__b));
  id obj = v51[0];
  uint64_t v31 = [obj countByEnumeratingWithState:__b objects:v55 count:16];
  if (v31)
  {
    uint64_t v26 = *(void *)__b[2];
    uint64_t v27 = 0;
    unint64_t v28 = v31;
    while (1)
    {
      uint64_t v25 = v27;
      if (*(void *)__b[2] != v26) {
        objc_enumerationMutation(obj);
      }
      id v48 = *(id *)(__b[1] + 8 * v27);
      id v46 = (id)[*(id *)(a1 + 32) _specifierForAccount:v48];
      if (v46)
      {
        if ((_specifiersForAccountsGroupWithCompletion__pluginsHandleModificationRestriction & 1) == 0)
        {
          char v45 = 0;
          id v22 = (id)[v48 accountType];
          id v23 = (id)[v22 identifier];
          LOBYTE(v24) = 0;
          if ([v23 isEqualToString:*MEMORY[0x1E4F177C0]]) {
            int v24 = [v48 isAuthenticated] ^ 1;
          }

          char v45 = v24 & 1;
          char v44 = 0;
          id v19 = (id)[v48 accountType];
          id v20 = (id)[v19 identifier];
          char v2 = [v20 isEqualToString:*MEMORY[0x1E4F17798]];
          char v42 = 0;
          char v40 = 0;
          char v21 = 1;
          if ((v2 & 1) == 0)
          {
            id v43 = (id)[v48 accountType];
            char v42 = 1;
            id v41 = (id)[v43 identifier];
            char v40 = 1;
            char v21 = [v41 isEqualToString:*MEMORY[0x1E4F177D0]];
          }
          if (v40) {

          }
          if (v42) {
          char v44 = v21 & 1;
          }
          id v17 = v46;
          char v18 = 1;
          if ((*(unsigned char *)(a1 + 48) & 1) == 0)
          {
            char v18 = 1;
            if ((v45 & 1) == 0) {
              char v18 = v44;
            }
          }
          id v16 = (id)[NSNumber numberWithInt:v18 & 1];
          objc_msgSend(v17, "setProperty:forKey:");
        }
        id v13 = (id)[v48 accountType];
        id v14 = (id)[v13 identifier];
        char v3 = [v14 isEqualToString:*MEMORY[0x1E4F17750]];
        char v38 = 0;
        char v15 = 0;
        if (v3)
        {
          id v39 = (id)[v48 objectForKeyedSubscript:@"primaryAccount"];
          char v38 = 1;
          char v15 = [v39 BOOLValue];
        }
        if (v38) {

        }
        if (v15)
        {
          os_log_t oslog = (os_log_t)_ACUILogSystem();
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            log = oslog;
            __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v54, (uint64_t)"-[ACUISettingsController _specifiersForAccountsGroupWithCompletion:]_block_invoke_2", 573, (uint64_t)v48);
            _os_log_impl(&dword_1DDFE5000, log, type, "%s (%d) \"Hit our primary account, lets ensure this is at the top - %@\"", v54, 0x1Cu);
          }
          objc_storeStrong((id *)&oslog, 0);
          [v49 insertObject:v46 atIndex:0];
        }
        else
        {
          [v49 addObject:v46];
        }
      }
      objc_storeStrong(&v46, 0);
      ++v27;
      if (v25 + 1 >= v28)
      {
        uint64_t v27 = 0;
        unint64_t v28 = [obj countByEnumeratingWithState:__b objects:v55 count:16];
        if (!v28) {
          break;
        }
      }
    }
  }

  memset(v34, 0, sizeof(v34));
  id v10 = (id)[v50 allKeys];
  uint64_t v11 = [v10 countByEnumeratingWithState:v34 objects:v53 count:16];
  if (v11)
  {
    uint64_t v7 = *(void *)v34[2];
    uint64_t v8 = 0;
    unint64_t v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)v34[2] != v7) {
        objc_enumerationMutation(v10);
      }
      uint64_t v35 = *(void *)(v34[1] + 8 * v8);
      id v33 = (id)[v50 objectForKey:v35];
      id v32 = (id)[*(id *)(a1 + 32) _specifierForCollectionCellLinkingToAccounts:v33 withGroupIdentifier:v35 underParentGroup:0];
      if (v32)
      {
        if ((_specifiersForAccountsGroupWithCompletion__pluginsHandleModificationRestriction & 1) == 0)
        {
          id v4 = v32;
          id v5 = (id)[NSNumber numberWithBool:*(unsigned char *)(a1 + 48) & 1];
          objc_msgSend(v4, "setProperty:forKey:");
        }
        [v49 addObject:v32];
      }
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
      ++v8;
      if (v6 + 1 >= v9)
      {
        uint64_t v8 = 0;
        unint64_t v9 = [v10 countByEnumeratingWithState:v34 objects:v53 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  if (*(void *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1400), v49);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(v51, 0);
  objc_storeStrong(location, 0);
}

- (id)_specifierForCollectionCellLinkingToAccounts:(id)a3 withGroupIdentifier:(id)a4 underParentGroup:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v55 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v53 = 0;
  objc_storeStrong(&v53, a4);
  id v52 = 0;
  objc_storeStrong(&v52, a5);
  id v51 = 0;
  memset(__b, 0, sizeof(__b));
  id v33 = location[0];
  uint64_t v34 = [v33 countByEnumeratingWithState:__b objects:v60 count:16];
  if (v34)
  {
    uint64_t v28 = *(void *)__b[2];
    uint64_t v29 = 0;
    unint64_t v30 = v34;
    while (1)
    {
      uint64_t v27 = v29;
      if (*(void *)__b[2] != v28) {
        objc_enumerationMutation(v33);
      }
      id v50 = *(id *)(__b[1] + 8 * v29);
      id v25 = (id)[v50 identifier];
      char v26 = [v25 isEqualToString:v53];

      if (v26) {
        break;
      }
      ++v29;
      if (v27 + 1 >= v30)
      {
        uint64_t v29 = 0;
        unint64_t v30 = [v33 countByEnumeratingWithState:__b objects:v60 count:16];
        if (!v30) {
          goto LABEL_9;
        }
      }
    }
    id v5 = [(ACUISettingsController *)v55 _specifierForAccount:v50];
    id v6 = v51;
    id v51 = v5;

    int v48 = 2;
  }
  else
  {
LABEL_9:
    int v48 = 0;
  }

  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v45 = (id)[MEMORY[0x1E4F1CA80] setWithObject:v53];
  if (v52) {
    [v45 addObject:v52];
  }
  [(ACUISettingsController *)v55 _filterAccounts:location[0] toTopLevel:v47 grouped:v46 ignoringGroups:v45];
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  memset(v42, 0, sizeof(v42));
  id v23 = v47;
  uint64_t v24 = [v23 countByEnumeratingWithState:v42 objects:v59 count:16];
  if (v24)
  {
    uint64_t v20 = *(void *)v42[2];
    uint64_t v21 = 0;
    unint64_t v22 = v24;
    while (1)
    {
      uint64_t v19 = v21;
      if (*(void *)v42[2] != v20) {
        objc_enumerationMutation(v23);
      }
      id v43 = *(id *)(v42[1] + 8 * v21);
      id v17 = (id)[v43 identifier];
      char v18 = [v17 isEqualToString:v53];

      if ((v18 & 1) == 0)
      {
        id v41 = [(ACUISettingsController *)v55 _specifierForAccount:v43];
        [v44 addObject:v41];
        objc_storeStrong(&v41, 0);
      }
      ++v21;
      if (v19 + 1 >= v22)
      {
        uint64_t v21 = 0;
        unint64_t v22 = [v23 countByEnumeratingWithState:v42 objects:v59 count:16];
        if (!v22) {
          break;
        }
      }
    }
  }

  memset(v39, 0, sizeof(v39));
  id v15 = (id)[v46 allKeys];
  uint64_t v16 = [v15 countByEnumeratingWithState:v39 objects:v58 count:16];
  if (v16)
  {
    uint64_t v12 = *(void *)v39[2];
    uint64_t v13 = 0;
    unint64_t v14 = v16;
    while (1)
    {
      uint64_t v11 = v13;
      if (*(void *)v39[2] != v12) {
        objc_enumerationMutation(v15);
      }
      uint64_t v40 = *(void *)(v39[1] + 8 * v13);
      id v38 = (id)[v46 objectForKey:v40];
      id v37 = [(ACUISettingsController *)v55 _specifierForCollectionCellLinkingToAccounts:v38 withGroupIdentifier:v40 underParentGroup:v53];
      if (v37) {
        [v44 addObject:v37];
      }
      objc_storeStrong(&v37, 0);
      objc_storeStrong(&v38, 0);
      ++v13;
      if (v11 + 1 >= v14)
      {
        uint64_t v13 = 0;
        unint64_t v14 = [v15 countByEnumeratingWithState:v39 objects:v58 count:16];
        if (!v14) {
          break;
        }
      }
    }
  }

  if ([v53 isEqualToString:*MEMORY[0x1E4F17858]])
  {
    id v10 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v9 = (id)[v10 localizedStringForKey:@"SUBSCRIBED_CALENDARS" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v36 = +[ACUIAccountCollectionLinkCell specifierWithTitle:accounts:](ACUIAccountCollectionLinkCell, "specifierWithTitle:accounts:");

    id v56 = v36;
    int v48 = 1;
    objc_storeStrong(&v36, 0);
  }
  else if (v51)
  {
    [v51 setProperty:v44 forKey:@"ACUIAccountCollectionSpecifiers"];
    id v56 = v51;
    int v48 = 1;
  }
  else
  {
    os_log_t oslog = (os_log_t)_ACUILogSystem();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v57, (uint64_t)"-[ACUISettingsController _specifierForCollectionCellLinkingToAccounts:withGroupIdentifier:underParentGroup:]", 650, (uint64_t)location[0]);
      _os_log_error_impl(&dword_1DDFE5000, oslog, OS_LOG_TYPE_ERROR, "%s (%d) \"No principle account specifier found, grouping can not be made for accounts %@\"", v57, 0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v56 = 0;
    int v48 = 1;
  }
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(location, 0);
  uint64_t v7 = v56;
  return v7;
}

- (id)_specifierForAccount:(id)a3
{
  uint64_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (id)[location[0] copy];
  id v9 = +[ACUIAccountSummaryCell specifierWithStyle:account:target:controllerLoadAction:](ACUIAccountSummaryCell, "specifierWithStyle:account:target:controllerLoadAction:", 3);

  id v5 = v9;
  id v7 = (id)[(ACUISettingsController *)v11 specifier];
  id v6 = (id)[v7 propertyForKey:*MEMORY[0x1E4F93078]];
  objc_msgSend(v5, "setProperty:forKey:");

  id v8 = v9;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)_addAccountSpecifier
{
  if (!self->_addAccountSpecifier)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F92E70];
    id v13 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v12 = (id)objc_msgSend(v13, "localizedStringForKey:value:table:");
    char v2 = (PSSpecifier *)(id)[v11 preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
    addAccountSpecifier = self->_addAccountSpecifier;
    self->_addAccountSpecifier = v2;

    [(PSSpecifier *)self->_addAccountSpecifier setProperty:@"ADD_ACCOUNT" forKey:*MEMORY[0x1E4F93188]];
    if (self->_filteredDataclass) {
      [(PSSpecifier *)self->_addAccountSpecifier setProperty:self->_filteredDataclass forKey:*MEMORY[0x1E4F93058]];
    }
  }
  unsigned __int8 v14 = ![(ACUISettingsController *)self _isAccountModificationDisabledByRestrictions];
  id v6 = self->_addAccountSpecifier;
  id v7 = (id)[NSNumber numberWithBool:v14];
  -[PSSpecifier setProperty:forKey:](v6, "setProperty:forKey:");

  id v8 = self->_addAccountSpecifier;
  id v10 = (id)[(ACUISettingsController *)self specifier];
  id v9 = (id)[v10 propertyForKey:*MEMORY[0x1E4F93078]];
  -[PSSpecifier setProperty:forKey:](v8, "setProperty:forKey:");

  id v4 = self->_addAccountSpecifier;
  return v4;
}

- (id)_specifierForScheduleSettings
{
  id v8 = self;
  v7[1] = (id)a2;
  id v4 = (void *)MEMORY[0x1E4F92E70];
  id v6 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = (id)objc_msgSend(v6, "localizedStringForKey:value:table:");
  v7[0] = (id)objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);

  [v7[0] setProperty:@"FETCH_NEW_DATA" forKey:*MEMORY[0x1E4F93188]];
  [v7[0] setControllerLoadAction:sel__scheduleSettingsCellWasTappedWithSpecifier_];
  if ([(ACUISettingsController *)v8 _isAccountModificationDisabledByRestrictions])
  {
    [v7[0] setProperty:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F93130]];
  }
  id v3 = v7[0];
  objc_storeStrong(v7, 0);
  return v3;
}

- (void)_scheduleSettingsCellWasTappedWithSpecifier:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  id v10 = (dispatch_once_t *)&_scheduleSettingsCellWasTappedWithSpecifier__onceToken;
  id v9 = 0;
  objc_storeStrong(&v9, &__block_literal_global_92);
  if (*v10 != -1) {
    dispatch_once(v10, v9);
  }
  objc_storeStrong(&v9, 0);
  id v3 = objc_alloc_init((Class)[(id)_scheduleSettingsCellWasTappedWithSpecifier___scheduleSettingsBundle principalClass]);
  id v4 = v6;
  id v6 = v3;

  if (v6)
  {
    [v6 setSpecifier:location[0]];
    [v6 setParentController:v8];
    id v5 = (id)[(ACUISettingsController *)v8 rootController];
    objc_msgSend(v6, "setRootController:");

    [(ACUISettingsController *)v8 showController:v6 animate:1];
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

void __70__ACUISettingsController__scheduleSettingsCellWasTappedWithSpecifier___block_invoke(void *a1)
{
  id v3[2] = a1;
  v3[1] = a1;
  v3[0] = @"/System/Library/PreferenceBundles/ScheduleSettings.bundle";
  id v1 = (id)[MEMORY[0x1E4F28B50] bundleWithPath:v3[0]];
  char v2 = (void *)_scheduleSettingsCellWasTappedWithSpecifier___scheduleSettingsBundle;
  _scheduleSettingsCellWasTappedWithSpecifier___scheduleSettingsBundle = (uint64_t)v1;

  objc_storeStrong(v3, 0);
}

- (id)_scheduleSettingsModeForSpecifier:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  id v13 = (id)[MEMORY[0x1E4F28F80] processInfo];
  char v14 = [v13 isLowPowerModeEnabled];

  if (v14)
  {
    id v12 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v3 = (id)[v12 localizedStringForKey:@"OFF" value:&stru_1F39EF5C0 table:@"Localizable"];
    id v4 = v16;
    id v16 = v3;

    id v18 = v16;
  }
  else
  {
    if (PCSettingsGetClassPushEnabled())
    {
      id v11 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v5 = (id)[v11 localizedStringForKey:@"PUSH" value:&stru_1F39EF5C0 table:@"Localizable"];
      id v6 = v16;
      id v16 = v5;
    }
    else
    {
      int ClassPollInterval = PCSettingsGetClassPollInterval();
      id v7 = ACUIFetchSettingTitle(ClassPollInterval);
      id v8 = v16;
      id v16 = v7;
    }
    id v18 = v16;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  id v9 = v18;
  return v9;
}

- (void)_fetchLazyLoadedSpecifiers
{
  id v9 = self;
  v8[1] = (id)a2;
  if (!self->_isLazyLoadingPluginSpecifiers)
  {
    v9->_isLazyLoadingPluginSpecifiers = 1;
    queue = dispatch_get_global_queue(-32768, 0);
    uint64_t v3 = MEMORY[0x1E4F143A8];
    int v4 = -1073741824;
    int v5 = 0;
    id v6 = __52__ACUISettingsController__fetchLazyLoadedSpecifiers__block_invoke;
    id v7 = &unk_1E6D20118;
    v8[0] = v9;
    dispatch_async(queue, &v3);

    objc_storeStrong(v8, 0);
  }
}

void __52__ACUISettingsController__fetchLazyLoadedSpecifiers__block_invoke(id *a1)
{
  v19[2] = a1;
  v19[1] = a1;
  id v4 = a1[4];
  id v6 = (id)[v4 _settingsPluginManager];
  id v5 = (id)[v6 contactsSettingsPlugin];
  v19[0] = (id)objc_msgSend(v4, "_specifiersForSettingsProvidedByPlugin:");

  id v7 = a1[4];
  id v9 = (id)[v7 _settingsPluginManager];
  id v8 = (id)[v9 calendarSettingsPlugin];
  id v18 = (id)objc_msgSend(v7, "_specifiersForSettingsProvidedByPlugin:");

  id v1 = (id)[v19[0] arrayByAddingObjectsFromArray:v18];
  char v2 = (void **)((char *)a1[4] + 1432);
  uint64_t v3 = *v2;
  *char v2 = v1;

  queue = MEMORY[0x1E4F14428];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  int v13 = -1073741824;
  int v14 = 0;
  id v15 = __52__ACUISettingsController__fetchLazyLoadedSpecifiers__block_invoke_2;
  id v16 = &unk_1E6D20118;
  id v17 = a1[4];
  dispatch_async(queue, &v12);

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v19, 0);
}

void __52__ACUISettingsController__fetchLazyLoadedSpecifiers__block_invoke_2(NSObject *a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  oslog[2] = a1;
  oslog[1] = a1;
  oslog[0] = (os_log_t)_ACUILogSystem();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v31, (uint64_t)"-[ACUISettingsController _fetchLazyLoadedSpecifiers]_block_invoke_2", 775, *((void *)a1[4].isa + 178));
    _os_log_debug_impl(&dword_1DDFE5000, oslog[0], type, "%s (%d) \"ACUISettingsController is removing loading-in-progress specifiers: %@\"", v31, 0x1Cu);
  }
  objc_storeStrong((id *)oslog, 0);
  [(objc_class *)a1[4].isa removeContiguousSpecifiers:*((void *)a1[4].isa + 178)];
  id v25 = (id)[MEMORY[0x1E4F1CA48] array];
  id location = (id)[*(id *)((char *)a1[4].isa + (int)*MEMORY[0x1E4F92F08]) lastObject];
  memset(__b, 0, sizeof(__b));
  id obj = *((id *)a1[4].isa + 179);
  uint64_t v15 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
  if (v15)
  {
    uint64_t v11 = *(void *)__b[2];
    uint64_t v12 = 0;
    unint64_t v13 = v15;
    while (1)
    {
      uint64_t v10 = v12;
      if (*(void *)__b[2] != v11) {
        objc_enumerationMutation(obj);
      }
      id v23 = *(char **)(__b[1] + 8 * v12);
      BOOL v1 = *(void *)&v23[*MEMORY[0x1E4F92F28]] != 0;
      char v20 = 0;
      BOOL v9 = 0;
      if (!v1)
      {
        id v8 = v23;
        id v21 = (id)[*((id *)a1[4].isa + 179) objectAtIndexedSubscript:0];
        char v20 = 1;
        BOOL v9 = v8 != v21;
      }
      if (v20) {

      }
      if (v9)
      {
        os_log_t v19 = (os_log_t)_ACUILogSystem();
        os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          id v7 = v19;
          __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v29, (uint64_t)"-[ACUISettingsController _fetchLazyLoadedSpecifiers]_block_invoke", 783, (uint64_t)v25, (uint64_t)location);
          _os_log_debug_impl(&dword_1DDFE5000, v7, v18, "%s (%d) \"ACUISettingsController is inserting specifiers: %@ after specifier: %@\"", v29, 0x26u);
        }
        objc_storeStrong((id *)&v19, 0);
        [(objc_class *)a1[4].isa insertContiguousSpecifiers:v25 afterSpecifier:location animated:0];
        id v2 = (id)[v25 lastObject];
        id v3 = location;
        id location = v2;

        [v25 removeAllObjects];
      }
      [v25 addObject:v23];
      ++v12;
      if (v10 + 1 >= v13)
      {
        uint64_t v12 = 0;
        unint64_t v13 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
        if (!v13) {
          break;
        }
      }
    }
  }

  if ([v25 count])
  {
    os_log_t v17 = (os_log_t)_ACUILogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v28, (uint64_t)"-[ACUISettingsController _fetchLazyLoadedSpecifiers]_block_invoke", 793, (uint64_t)v25, (uint64_t)location);
      _os_log_debug_impl(&dword_1DDFE5000, v17, OS_LOG_TYPE_DEBUG, "%s (%d) \"ACUISettingsController is inserting specifiers: %@ after specifier: %@\"", v28, 0x26u);
    }
    objc_storeStrong((id *)&v17, 0);
    [(objc_class *)a1[4].isa insertContiguousSpecifiers:v25 afterSpecifier:location animated:0];
  }
  objc_msgSend(*(id *)((char *)a1[4].isa + (int)*MEMORY[0x1E4F92F10]), "contentOffset", MEMORY[0x1E4F92F10]);
  objc_msgSend(*(id *)((char *)a1[4].isa + *v6), "setContentOffset:animated:", 0, v4, v5);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v25, 0);
}

- (id)_specifiersForSettingsProvidedByPlugin:(id)a3
{
  os_log_t v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v14 = (id)[location[0] specifiers];
  if ([v14 count])
  {
    id v13 = (id)[v14 mutableCopy];
    uint64_t v10 = (void *)MEMORY[0x1E4F92E70];
    id v11 = (id)[location[0] headerText];
    id v12 = (id)objc_msgSend(v10, "groupSpecifierWithName:");

    [v13 insertObject:v12 atIndex:0];
    if (objc_opt_respondsToSelector())
    {
      id v9 = (id)[location[0] footerText];
      objc_msgSend(v12, "setProperty:forKey:");
    }
    pluginToSpecifiersMap = v17->_pluginToSpecifiersMap;
    id v6 = v13;
    id v3 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v3);
    -[NSMutableDictionary setObject:forKey:](pluginToSpecifiersMap, "setObject:forKey:", v6);

    [v15 addObjectsFromArray:v13];
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v13, 0);
  }
  id v5 = v15;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)_specifiersForLoadingMessage
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v11 = self;
  v10[1] = (id)a2;
  if (!self->_loadingInProgressSpecifiers)
  {
    id v6 = (void *)MEMORY[0x1E4F92E70];
    id v8 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v7 = (id)[v8 localizedStringForKey:@"LOADING_CONTACTS_CALENDARS" value:&stru_1F39EF5C0 table:@"Localizable"];
    v10[0] = (id)objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);

    [v10[0] setProperty:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F93130]];
    id v9 = (id)[MEMORY[0x1E4F92E70] emptyGroupSpecifier];
    v12[0] = v9;
    v12[1] = v10[0];
    id v2 = (NSArray *)(id)[MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    loadingInProgressSpecifiers = v11->_loadingInProgressSpecifiers;
    v11->_loadingInProgressSpecifiers = v2;

    objc_storeStrong(v10, 0);
  }
  double v4 = v11->_loadingInProgressSpecifiers;
  return v4;
}

- (void)_accountCellWasTappedWithSpecifier:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = (id)[location[0] propertyForKey:@"account"];
  if (v31)
  {
    char v26 = 0;
    char v24 = 0;
    char v22 = 0;
    char v13 = 0;
    if ([(ACUISettingsController *)v33 isShowDataclassDetailFromAppsEnabled])
    {
      id v27 = (id)[v31 accountType];
      char v26 = 1;
      id v25 = (id)[v27 identifier];
      char v24 = 1;
      char v13 = 0;
      if ([v25 isEqualToString:*MEMORY[0x1E4F17750]])
      {
        id v23 = (id)[v31 objectForKeyedSubscript:@"accountClass"];
        char v22 = 1;
        char v13 = [v23 isEqualToString:@"primary"];
      }
    }
    if (v22) {

    }
    if (v24) {
    if (v26)
    }

    if ((v13 & 1) == 0) {
      goto LABEL_21;
    }
    id v9 = (id)[(ACUISettingsController *)v33 navigationController];
    id v8 = (id)[v9 viewControllers];
    id v21 = (id)[v8 lastObject];

    id v11 = (id)[(ACUISettingsController *)v33 specifier];
    id v10 = (id)[v11 propertyForKey:*MEMORY[0x1E4F93078]];
    char v12 = [v10 isEqualToString:@"com.apple.mobilemail"];

    if (v12)
    {
      iCloudMailUnifiedSettingsLibrary();
      id v20 = (id)[objc_alloc((Class)getiCloudMailUnifiedSettingsProviderObjcClass()) initWithPresenter:v21];
      objc_msgSend(v20, "navigateToiCloudMailSettingsWithDeeplink:");
      int v28 = 1;
      objc_storeStrong(&v20, 0);
    }
    else
    {
      id v6 = (id)[(ACUISettingsController *)v33 specifier];
      id v5 = (id)[v6 propertyForKey:*MEMORY[0x1E4F93078]];
      char v7 = [v5 isEqualToString:@"com.apple.mobilecal"];

      if (v7)
      {
        iCloudCalendarUnifiedSettingsLibrary();
        id v19 = (id)[objc_alloc((Class)getiCloudCalendarUnifiedSettingsProviderObjcClass()) initWithPresenter:v21];
        objc_msgSend(v19, "navigateToiCloudCalendarSettingsWithDeeplink:");
        int v28 = 1;
        objc_storeStrong(&v19, 0);
      }
      else
      {
        int v28 = 0;
      }
    }
    objc_storeStrong(&v21, 0);
    if (!v28)
    {
LABEL_21:
      double v4 = +[ACUIAccountViewProvidersManager sharedInstance];
      Class v18 = [(ACUIAccountViewProvidersManager *)v4 viewControllerClassForViewingAccount:v31];

      if (v18)
      {
        id v15 = objc_alloc_init(v18);
        [v15 setSpecifier:location[0]];
        [v15 setAccountChangeObserver:v33];
        if (([(objc_class *)v18 isSubclassOfClass:objc_opt_class()] & 1) != 0
          || ([(objc_class *)v18 isSubclassOfClass:objc_opt_class()] & 1) != 0)
        {
          [v15 setParentController:v33];
          id v3 = (id)[(ACUISettingsController *)v33 rootController];
          objc_msgSend(v15, "setRootController:");

          [(ACUISettingsController *)v33 showController:v15 animate:1];
        }
        else
        {
          id v14 = (id)[objc_alloc(MEMORY[0x1E4F92E68]) initWithRootViewController:v15];
          [v14 setSpecifier:location[0]];
          [v14 setParentController:v33];
          [v15 setParentController:v14];
          [v15 setRootController:v14];
          [(ACUISettingsController *)v33 showController:v14 animate:1];
          objc_storeStrong(&v14, 0);
        }
        if (v33->_isInHandleURL) {
          objc_storeStrong((id *)&v33->_viewControllerPushedByControllerLoadActionDuringHandleURL, v15);
        }
        objc_storeStrong(&v15, 0);
        int v28 = 0;
      }
      else
      {
        id v17 = _ACUILogSystem();
        os_log_type_t v16 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v34, (uint64_t)"-[ACUISettingsController _accountCellWasTappedWithSpecifier:]", 878, (uint64_t)v31);
          _os_log_error_impl(&dword_1DDFE5000, (os_log_t)v17, v16, "%s (%d) \"No view controller available for account %@\"", v34, 0x1Cu);
        }
        objc_storeStrong(&v17, 0);
        int v28 = 1;
      }
    }
  }
  else
  {
    id v30 = _ACUILogSystem();
    os_log_type_t v29 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v35, (uint64_t)"-[ACUISettingsController _accountCellWasTappedWithSpecifier:]", 850, (uint64_t)location[0]);
      _os_log_error_impl(&dword_1DDFE5000, (os_log_t)v30, v29, "%s (%d) \"An account cell was tapped but had no account associated with it! %@\"", v35, 0x1Cu);
    }
    objc_storeStrong(&v30, 0);
    int v28 = 1;
  }
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isShowDataclassDetailFromAppsEnabled
{
  return _os_feature_enabled_impl() & 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v6 = (id)objc_msgSend(*(id *)((char *)&v9->super.super.super.super.super.isa+ (int)*MEMORY[0x1E4F92F08]), "objectAtIndex:", -[ACUISettingsController indexForIndexPath:](v9, "indexForIndexPath:", v7));
  [*(id *)((char *)&v9->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F10]) deselectRowAtIndexPath:v7 animated:1];
  v5.receiver = v9;
  v5.super_class = (Class)ACUISettingsController;
  [(ACUISettingsController *)&v5 tableView:location[0] didSelectRowAtIndexPath:v7];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)viewController:(id)a3 didFinishRemovingAccountWithSuccess:(BOOL)a4
{
  id v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v35 = a4;
  if (a4)
  {
    id v26 = (id)[(ACUISettingsController *)v37 navigationController];
    id v27 = (ACUISettingsController *)(id)[v26 topViewController];
    char v33 = 0;
    char v31 = 0;
    char isKindOfClass = 0;
    if (v27 != v37)
    {
      id v34 = (id)[(ACUISettingsController *)v37 navigationController];
      char v33 = 1;
      id v32 = (id)[v34 topViewController];
      char v31 = 1;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    if (v31) {

    }
    if (v33) {
    if (isKindOfClass)
    }
    {
      id v22 = (id)[(ACUISettingsController *)v37 navigationController];
      id v30 = (id)[v22 topViewController];

      id v24 = (id)[v30 specifiers];
      id v23 = (id)[location[0] specifier];
      char v25 = objc_msgSend(v24, "containsObject:");

      if (v25)
      {
        id v18 = (id)[location[0] specifier];
        uint64_t v38 = 0;
        id v19 = (id)[MEMORY[0x1E4F42948] currentDevice];
        uint64_t v20 = [v19 userInterfaceIdiom];

        uint64_t v38 = v20;
        BOOL v21 = 1;
        if (v20 != 1) {
          BOOL v21 = v38 == 5;
        }
        [v30 removeSpecifier:v18 animated:v21];
      }
      objc_storeStrong(&v30, 0);
    }
    objc_msgSend(location[0], "setParentController:");
    [location[0] setRootController:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = (id)[(ACUISettingsController *)v37 navigationController];
      id v15 = (id)[v16 viewControllers];
      char v17 = [v15 containsObject:v37];

      if (v17)
      {
        id v14 = (id)[(ACUISettingsController *)v37 navigationController];
        id v4 = (id)[v14 popToViewController:v37 animated:1];
      }
      else
      {
        id v12 = (id)[(ACUISettingsController *)v37 navigationController];
        id v11 = (id)[v12 viewControllers];
        id v10 = (id)[(ACUISettingsController *)v37 parentViewController];
        char v13 = objc_msgSend(v11, "containsObject:");

        if (v13)
        {
          id v9 = (id)[(ACUISettingsController *)v37 navigationController];
          id v8 = (id)[(ACUISettingsController *)v37 parentViewController];
          id v5 = (id)objc_msgSend(v9, "popToViewController:animated:");
        }
        else
        {
          id v7 = (id)[(ACUISettingsController *)v37 navigationController];
          id v6 = (id)[v7 popToRootViewControllerAnimated:1];
        }
      }
    }
    else
    {
      [(ACUISettingsController *)v37 dismissViewControllerAnimated:1 completion:0];
    }
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_isAccountModificationDisabledByRestrictions
{
  id v3 = (id)[MEMORY[0x1E4F74230] sharedConnection];
  BOOL v4 = [v3 effectiveBoolValueForSetting:*MEMORY[0x1E4F73ED0]] == 2;

  return v4;
}

- (void)specifiersDidChangeForPlugin:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  pluginToSpecifiersMap = v10->_pluginToSpecifiersMap;
  id v3 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v3);
  id v8 = (id)-[NSMutableDictionary objectForKey:](pluginToSpecifiersMap, "objectForKey:");

  id v7 = [(ACUISettingsController *)v10 _specifiersForSettingsProvidedByPlugin:location[0]];
  os_log_t oslog = (os_log_t)_ACUILogSystem();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v11, (uint64_t)"-[ACUISettingsController specifiersDidChangeForPlugin:]", 979, (uint64_t)v8, (uint64_t)v7);
    _os_log_debug_impl(&dword_1DDFE5000, oslog, OS_LOG_TYPE_DEBUG, "%s (%d) \"replacing specifiers %@ with specifiers %@\"", v11, 0x26u);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(ACUISettingsController *)v10 replaceContiguousSpecifiers:v8 withSpecifiers:v7 animated:0];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)accountWasAdded:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(ACUISettingsController *)v4 _accountStoreDidChange];
  objc_storeStrong(location, 0);
}

- (void)accountWasModified:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(ACUISettingsController *)v4 _accountStoreDidChange];
  objc_storeStrong(location, 0);
}

- (void)accountWasRemoved:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(ACUISettingsController *)v4 _accountStoreDidChange];
  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
}

@end