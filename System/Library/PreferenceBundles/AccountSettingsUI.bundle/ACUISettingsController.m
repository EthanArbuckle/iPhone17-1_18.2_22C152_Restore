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
    id v2 = objc_alloc_init((Class)NSMutableArray);
    v3 = (void *)*((void *)v13 + 25);
    *((void *)v13 + 25) = v2;

    dispatch_group_t v4 = dispatch_group_create();
    v5 = (void *)*((void *)v13 + 37);
    *((void *)v13 + 37) = v4;

    dispatch_group_enter(*((dispatch_group_t *)v13 + 37));
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    v7 = (void *)*((void *)v13 + 30);
    *((void *)v13 + 30) = v6;

    v10 = +[NSNotificationCenter defaultCenter];
    -[NSNotificationCenter addObserver:selector:name:object:](v10, "addObserver:selector:name:object:", v13, "_lowPowerModeChangedNotification:", NSProcessInfoPowerStateDidChangeNotification);
    [(NSNotificationCenter *)v10 addObserver:v13 selector:"_effectiveSettingsChangedNotification:" name:MCEffectiveSettingsChangedNotification object:0];
    objc_storeStrong((id *)&v10, 0);
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
  id v3 = [(ACUISettingsController *)v8 specifier];
  id v4 = [v3 propertyForKey:PSAppSettingsBundleIDKey];

  +[ACUIUtils emitNavigationEventForSubPane:subPath:account:inHostAppBundleID:](ACUIUtils, "emitNavigationEventForSubPane:subPath:account:inHostAppBundleID:", v8, @"root");
  objc_storeStrong(&v4, 0);
}

- (void)_lowPowerModeChangedNotification:(id)a3
{
  objc_super v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_queue_t queue = &_dispatch_main_q;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  SEL v7 = sub_47B4;
  v8 = &unk_102F8;
  v9 = v11;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_effectiveSettingsChangedNotification:(id)a3
{
  objc_super v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_queue_t queue = &_dispatch_main_q;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  SEL v7 = sub_48EC;
  v8 = &unk_102F8;
  v9 = v11;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)dealloc
{
  id v4 = self;
  v3[1] = (id)a2;
  if (self->_accountStore) {
    [(ACMonitoredAccountStore *)v4->_accountStore removeDelegate:v4];
  }
  [(ACUISettingsPluginManager *)v4->_settingsPluginManager parentViewControllerWillDisappear];
  v3[0] = +[NSNotificationCenter defaultCenter];
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
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [(NSBundle *)v4 localizedStringForKey:@"ACCOUNTS" value:&stru_106B8 table:@"Localizable"];
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
  id v3 = (NSString *)[location[0] propertyForKey:PSAccountsClientDataclassFilterKey];
  filteredDataclass = v7->_filteredDataclass;
  v7->_filteredDataclass = v3;

  objc_storeStrong(location, 0);
}

- (BOOL)prepareHandlingURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 animatePush:(BOOL *)a5 withCompletion:(id)a6
{
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
    id v21 = (id)_ACUILogSystem();
    os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEBUG))
    {
      sub_4EF4((uint64_t)v27, (uint64_t)"-[ACUISettingsController prepareHandlingURLForSpecifierID:resourceDictionary:animatePush:withCompletion:]", 233, (uint64_t)v23);
      _os_log_debug_impl(&dword_0, (os_log_t)v21, v20, "%s (%d) \"Deferring URL load for resources %@\"", v27, 0x1Cu);
    }
    objc_storeStrong(&v21, 0);
    group = v25->_specifierLoadGroup;
    dispatch_queue_t queue = &_dispatch_main_q;
    SEL v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    v15 = sub_4F64;
    v16 = &unk_10320;
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

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = (id)_ACUILogSystem();
  os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG))
  {
    sub_4EF4((uint64_t)v19, (uint64_t)"-[ACUISettingsController handleURL:withCompletion:]", 245, (uint64_t)location[0]);
    _os_log_debug_impl(&dword_0, (os_log_t)v14, v13, "%s (%d) \"Handling URL load for resources %@\"", v19, 0x1Cu);
  }
  objc_storeStrong(&v14, 0);
  v17->_isInHandleURL = 1;
  v12.receiver = v17;
  v12.super_class = (Class)ACUISettingsController;
  [(ACUISettingsController *)&v12 handleURL:location[0] withCompletion:&stru_10360];
  v17->_isInHandleURL = 0;
  if (v17->_viewControllerPushedByControllerLoadActionDuringHandleURL)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = [location[0] objectForKey:@"path"];
      id v6 = [v11 pathComponents];
      id v10 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:");

      if ([v10 count])
      {
        [v10 removeObjectAtIndex:0];
        id v4 = +[NSString pathWithComponents:v10];
        id v5 = v11;
        id v11 = v4;

        v9 = +[NSMutableDictionary dictionaryWithDictionary:location[0]];
        [(NSMutableDictionary *)v9 setObject:v11 forKey:@"path"];
        [(PSViewController *)v17->_viewControllerPushedByControllerLoadActionDuringHandleURL handleURL:v9 withCompletion:v15];
        objc_storeStrong((id *)&v9, 0);
      }
      else if (v15)
      {
        (*((void (**)(void))v15 + 2))();
      }
      objc_storeStrong(&v10, 0);
      objc_storeStrong(&v11, 0);
    }
    objc_storeStrong((id *)&v17->_viewControllerPushedByControllerLoadActionDuringHandleURL, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_ACUILogSystem();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_4EF4((uint64_t)v18, (uint64_t)"-[ACUISettingsController handleURL:withCompletion:]", 272, (uint64_t)location[0]);
      _os_log_error_impl(&dword_0, oslog, OS_LOG_TYPE_ERROR, "%s (%d) \"No subview to display matching dictionary %@\"", v18, 0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v15) {
      (*((void (**)(void))v15 + 2))();
    }
  }
  objc_storeStrong(&v15, 0);
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
  objc_super v12 = self;
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
    id v4 = _NSConcreteStackBlock;
    int v5 = -1073741824;
    int v6 = 0;
    SEL v7 = sub_561C;
    v8 = &unk_10388;
    v9 = v12;
    id v10 = location[0];
    [(ACUISettingsController *)v3 _loadAccountsWithCompletion:&v4];
    objc_storeStrong(&v10, 0);
    objc_storeStrong((id *)&v9, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_loadAccountsWithCompletion:(id)a3
{
  v53 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v51 = 0;
  id v50 = +[NSMutableArray array];
  memset(__b, 0, sizeof(__b));
  id v17 = [(ACUISettingsController *)v53 _accountStore];
  id obj = [v17 monitoredAccounts];

  id v19 = [obj countByEnumeratingWithState:__b objects:v54 count:16];
  if (v19)
  {
    uint64_t v14 = *(void *)__b[2];
    uint64_t v15 = 0;
    id v16 = v19;
    while (1)
    {
      uint64_t v13 = v15;
      if (*(void *)__b[2] != v14) {
        objc_enumerationMutation(obj);
      }
      id v49 = *(id *)(__b[1] + 8 * v15);
      if ([v49 isVisible])
      {
        id v3 = [v49 parentAccount];
        BOOL v12 = v3 == 0;

        if (v12)
        {
          id v4 = [v49 enabledDataclasses];
          if (v53->_filteredDataclass)
          {
            id v11 = [v49 provisionedDataclasses];
            v41 = _NSConcreteStackBlock;
            int v42 = -1073741824;
            int v43 = 0;
            v44 = sub_5D40;
            v45 = &unk_103B0;
            v46 = v53;
            id v47 = [v11 objectsPassingTest:&v41];

            if (![v47 count])
            {
              id v10 = [v49 accountType];
              id v9 = [v10 supportedDataclasses];
              v35 = _NSConcreteStackBlock;
              int v36 = -1073741824;
              int v37 = 0;
              v38 = sub_5E1C;
              v39 = &unk_103B0;
              v40 = v53;
              id v5 = [v9 objectsPassingTest:&v35];
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
      if (v13 + 1 >= (unint64_t)v16)
      {
        uint64_t v15 = 0;
        id v16 = [obj countByEnumeratingWithState:__b objects:v54 count:16];
        if (!v16) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v51, v50);
  id v34 = (id)ACUISortedAccountTypes();
  id v7 = v51;
  v27 = _NSConcreteStackBlock;
  int v28 = -1073741824;
  int v29 = 0;
  v30 = sub_5EF8;
  v31 = &unk_103D8;
  id v32 = v34;
  id v33 = [v7 sortedArrayUsingComparator:&v27];
  dispatch_queue_t queue = &_dispatch_main_q;
  os_log_type_t v20 = _NSConcreteStackBlock;
  int v21 = -1073741824;
  int v22 = 0;
  id v23 = sub_6110;
  v24 = &unk_10400;
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

- (void)_accountStoreDidChange
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = (id)_ACUILogSystem();
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_62EC((uint64_t)v12, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]", 370);
    _os_log_impl(&dword_0, (os_log_t)location[0], v9, "%s (%d) \"ACUISettingsController received monitored account delegate call.\"", v12, 0x12u);
  }
  objc_storeStrong(location, 0);
  objc_super v2 = v11;
  id v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_6340;
  id v7 = &unk_10450;
  v8 = v11;
  [(ACUISettingsController *)v2 _loadAccountsWithCompletion:&v3];
  objc_storeStrong((id *)&v8, 0);
}

- (BOOL)_isAccountList:(id)a3 identicalToAccountList:(id)a4
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v12 = [location[0] count];
  if (v12 == [v16 count])
  {
    memset(__b, 0, sizeof(__b));
    id v9 = location[0];
    id v10 = [v9 countByEnumeratingWithState:__b objects:v20 count:16];
    if (v10)
    {
      uint64_t v6 = *(void *)__b[2];
      uint64_t v7 = 0;
      id v8 = v10;
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
        if (v5 + 1 >= (unint64_t)v8)
        {
          uint64_t v7 = 0;
          id v8 = [v9 countByEnumeratingWithState:__b objects:v20 count:16];
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
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v33 = 0;
  objc_storeStrong(&v33, a4);
  memset(__b, 0, sizeof(__b));
  id v12 = v33;
  id v13 = [v12 countByEnumeratingWithState:__b objects:v36 count:16];
  if (v13)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    id v10 = v13;
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
      unsigned __int8 v6 = 0;
      if (v5 == ([location[0] isAuthenticated] & 1))
      {
        id v30 = [v32 identifier];
        char v29 = 1;
        id v28 = [location[0] identifier];
        char v27 = 1;
        unsigned __int8 v6 = 0;
        if (objc_msgSend(v30, "isEqualToString:"))
        {
          id v26 = [v32 accountDescription];
          char v25 = 1;
          id v24 = [location[0] accountDescription];
          char v23 = 1;
          unsigned __int8 v6 = 0;
          if (objc_msgSend(v26, "isEqualToString:"))
          {
            id v22 = [v32 enabledDataclasses];
            char v21 = 1;
            id v20 = [location[0] enabledDataclasses];
            char v19 = 1;
            unsigned __int8 v6 = 0;
            if (objc_msgSend(v22, "isEqualToSet:"))
            {
              id v18 = [v32 provisionedDataclasses];
              char v17 = 1;
              id v16 = [location[0] provisionedDataclasses];
              char v15 = 1;
              unsigned __int8 v6 = objc_msgSend(v18, "isEqualToSet:");
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
      if (v7 + 1 >= (unint64_t)v10)
      {
        uint64_t v9 = 0;
        id v10 = [v12 countByEnumeratingWithState:__b objects:v36 count:16];
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
    objc_super v2 = (ACUISettingsPluginManager *)[objc_alloc((Class)ACUISettingsPluginManager) initWithParentViewController:self];
    settingsPluginManager = self->_settingsPluginManager;
    self->_settingsPluginManager = v2;
  }
  int v4 = self->_settingsPluginManager;

  return v4;
}

- (void)_filterAccounts:(id)a3 toTopLevel:(id)a4 grouped:(id)a5 ignoringGroups:(id)a6
{
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
  id v19 = [v18 countByEnumeratingWithState:__b objects:v29 count:16];
  if (v19)
  {
    uint64_t v12 = *(void *)__b[2];
    uint64_t v13 = 0;
    id v14 = v19;
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
        id v10 = [v25 objectForKey:v21];
        id v20 = [v10 mutableCopy];

        if (!v20)
        {
          id v6 = objc_alloc_init((Class)NSMutableArray);
          id v7 = v20;
          id v20 = v6;
        }
        [v20 addObject:v23];
        id v8 = v25;
        id v9 = [v20 copy];
        objc_msgSend(v8, "setObject:forKey:");

        objc_storeStrong(&v20, 0);
      }
      else
      {
        [v26 addObject:v23];
      }
      objc_storeStrong(&v21, 0);
      ++v13;
      if (v11 + 1 >= (unint64_t)v14)
      {
        uint64_t v13 = 0;
        id v14 = [v18 countByEnumeratingWithState:__b objects:v29 count:16];
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
  id v8 = [location[0] accountType];
  id v7 = [v8 identifier];
  unsigned __int8 v9 = [v7 isEqualToString:ACAccountTypeIdentifierSubscribedCalendar];

  if ((v9 & 1) == 0
    || ([v10 containsObject:ACAccountTypeIdentifierSubscribedCalendar] & 1) != 0)
  {
    id v12 = 0;
  }
  else
  {
    id v12 = ACAccountTypeIdentifierSubscribedCalendar;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  int v4 = v12;

  return v4;
}

- (id)specifiers
{
  char v29 = self;
  location[1] = (id)a2;
  if (!*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    location[0] = (id)_ACUILogSystem();
    os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_62EC((uint64_t)v30, (uint64_t)"-[ACUISettingsController specifiers]", 477);
      _os_log_impl(&dword_0, (os_log_t)location[0], v27, "%s (%d) \"ACUISettingsController is loading specifiers.\"", v30, 0x12u);
    }
    objc_storeStrong(location, 0);
    id v26 = objc_alloc_init((Class)NSMutableArray);
    id v14 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v13 = [(NSBundle *)v14 localizedStringForKey:@"ACCOUNTS" value:&stru_106B8 table:@"Localizable"];
    objc_super v2 = (PSSpecifier *)+[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:");
    accountGroupSpecifier = v29->_accountGroupSpecifier;
    v29->_accountGroupSpecifier = v2;

    [v26 addObject:v29->_accountGroupSpecifier];
    id v25 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
    BOOL v24 = 0;
    BOOL v24 = v29->_accounts == 0;
    if (v24) {
      [v26 addObject:v25];
    }
    id v12 = v29;
    char v15 = _NSConcreteStackBlock;
    int v16 = -1073741824;
    int v17 = 0;
    id v18 = sub_7E54;
    id v19 = &unk_10478;
    BOOL v23 = v24;
    id v20 = v29;
    id v21 = v25;
    id v22 = v26;
    [(ACUISettingsController *)v12 _specifiersForAccountsGroupWithCompletion:&v15];
    if ((ACUIIsSharedIPadMode() & 1) == 0)
    {
      id v10 = v26;
      id v11 = [(ACUISettingsController *)v29 _addAccountSpecifier];
      objc_msgSend(v10, "addObject:");
    }
    id v6 = v26;
    id v7 = +[PSSpecifier emptyGroupSpecifier];
    objc_msgSend(v6, "addObject:");

    id v8 = v26;
    id v9 = [(ACUISettingsController *)v29 _specifierForScheduleSettings];
    objc_msgSend(v8, "addObject:");

    objc_storeStrong((id *)&v29->PSListController_opaque[OBJC_IVAR___PSListController__specifiers], v26);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong((id *)&v20, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
  }
  int v4 = *(void **)&v29->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];

  return v4;
}

- (void)_specifiersForAccountsGroupWithCompletion:(id)a3
{
  int v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = (id)_ACUILogSystem();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    sub_62EC((uint64_t)v19, (uint64_t)"-[ACUISettingsController _specifiersForAccountsGroupWithCompletion:]", 532);
    _os_log_impl(&dword_0, (os_log_t)v14, v13, "%s (%d) \"ACUISettingsController _specifiersForAccountsGroup called.\"", v19, 0x12u);
  }
  objc_storeStrong(&v14, 0);
  id v18 = (dispatch_once_t *)&unk_14D10;
  id v17 = 0;
  objc_storeStrong(&v17, &stru_10498);
  if (*v18 != -1) {
    dispatch_once(v18, v17);
  }
  objc_storeStrong(&v17, 0);
  BOOL v12 = 1;
  if ((byte_14D18 & 1) == 0) {
    BOOL v12 = ![(ACUISettingsController *)v16 _isAccountModificationDisabledByRestrictions];
  }
  id v3 = v16;
  int v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_8238;
  id v8 = &unk_104C0;
  id v9 = v16;
  BOOL v11 = v12;
  id v10 = location[0];
  [(ACUISettingsController *)v3 _accountsWithCompletion:&v4];
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (id)_specifierForCollectionCellLinkingToAccounts:(id)a3 withGroupIdentifier:(id)a4 underParentGroup:(id)a5
{
  v55 = self;
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
  id v34 = [v33 countByEnumeratingWithState:__b objects:v60 count:16];
  if (v34)
  {
    uint64_t v28 = *(void *)__b[2];
    uint64_t v29 = 0;
    id v30 = v34;
    while (1)
    {
      uint64_t v27 = v29;
      if (*(void *)__b[2] != v28) {
        objc_enumerationMutation(v33);
      }
      id v50 = *(id *)(__b[1] + 8 * v29);
      id v25 = [v50 identifier];
      unsigned __int8 v26 = [v25 isEqualToString:v53];

      if (v26) {
        break;
      }
      ++v29;
      if (v27 + 1 >= (unint64_t)v30)
      {
        uint64_t v29 = 0;
        id v30 = [v33 countByEnumeratingWithState:__b objects:v60 count:16];
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

  id v47 = objc_alloc_init((Class)NSMutableArray);
  id v46 = objc_alloc_init((Class)NSMutableDictionary);
  id v45 = +[NSMutableSet setWithObject:v53];
  if (v52) {
    [v45 addObject:v52];
  }
  [(ACUISettingsController *)v55 _filterAccounts:location[0] toTopLevel:v47 grouped:v46 ignoringGroups:v45];
  id v44 = objc_alloc_init((Class)NSMutableArray);
  memset(v42, 0, sizeof(v42));
  id v23 = v47;
  id v24 = [v23 countByEnumeratingWithState:v42 objects:v59 count:16];
  if (v24)
  {
    uint64_t v20 = *(void *)v42[2];
    uint64_t v21 = 0;
    id v22 = v24;
    while (1)
    {
      uint64_t v19 = v21;
      if (*(void *)v42[2] != v20) {
        objc_enumerationMutation(v23);
      }
      id v43 = *(id *)(v42[1] + 8 * v21);
      id v17 = [v43 identifier];
      unsigned __int8 v18 = [v17 isEqualToString:v53];

      if ((v18 & 1) == 0)
      {
        id v41 = [(ACUISettingsController *)v55 _specifierForAccount:v43];
        [v44 addObject:v41];
        objc_storeStrong(&v41, 0);
      }
      ++v21;
      if (v19 + 1 >= (unint64_t)v22)
      {
        uint64_t v21 = 0;
        id v22 = [v23 countByEnumeratingWithState:v42 objects:v59 count:16];
        if (!v22) {
          break;
        }
      }
    }
  }

  memset(v39, 0, sizeof(v39));
  id v15 = [v46 allKeys];
  id v16 = [v15 countByEnumeratingWithState:v39 objects:v58 count:16];
  if (v16)
  {
    uint64_t v12 = *(void *)v39[2];
    uint64_t v13 = 0;
    id v14 = v16;
    while (1)
    {
      uint64_t v11 = v13;
      if (*(void *)v39[2] != v12) {
        objc_enumerationMutation(v15);
      }
      uint64_t v40 = *(void *)(v39[1] + 8 * v13);
      id v38 = [v46 objectForKey:v40];
      id v37 = [(ACUISettingsController *)v55 _specifierForCollectionCellLinkingToAccounts:v38 withGroupIdentifier:v40 underParentGroup:v53];
      if (v37) {
        [v44 addObject:v37];
      }
      objc_storeStrong(&v37, 0);
      objc_storeStrong(&v38, 0);
      ++v13;
      if (v11 + 1 >= (unint64_t)v14)
      {
        uint64_t v13 = 0;
        id v14 = [v15 countByEnumeratingWithState:v39 objects:v58 count:16];
        if (!v14) {
          break;
        }
      }
    }
  }

  if ([v53 isEqualToString:ACAccountTypeIdentifierSubscribedCalendar])
  {
    id v10 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [(NSBundle *)v10 localizedStringForKey:@"SUBSCRIBED_CALENDARS" value:&stru_106B8 table:@"Localizable"];
    id v36 = +[ACUIAccountCollectionLinkCell specifierWithTitle:accounts:](ACUIAccountCollectionLinkCell, "specifierWithTitle:accounts:");

    id v56 = v36;
    int v48 = 1;
    objc_storeStrong(&v36, 0);
  }
  else if (v51)
  {
    [v51 setProperty:v44 forKey:ACUIAccountCollectionSpecifiersKey];
    id v56 = v51;
    int v48 = 1;
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_ACUILogSystem();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_4EF4((uint64_t)v57, (uint64_t)"-[ACUISettingsController _specifierForCollectionCellLinkingToAccounts:withGroupIdentifier:underParentGroup:]", 650, (uint64_t)location[0]);
      _os_log_error_impl(&dword_0, oslog, OS_LOG_TYPE_ERROR, "%s (%d) \"No principle account specifier found, grouping can not be made for accounts %@\"", v57, 0x1Cu);
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
  id v7 = v56;

  return v7;
}

- (id)_specifierForAccount:(id)a3
{
  uint64_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [location[0] copy];
  id v9 = +[ACUIAccountSummaryCell specifierWithStyle:account:target:controllerLoadAction:](ACUIAccountSummaryCell, "specifierWithStyle:account:target:controllerLoadAction:", 3);

  id v5 = v9;
  id v7 = [(ACUISettingsController *)v11 specifier];
  id v6 = [v7 propertyForKey:PSAppSettingsBundleIDKey];
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
    uint64_t v12 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v11 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:");
    objc_super v2 = (PSSpecifier *)+[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
    addAccountSpecifier = self->_addAccountSpecifier;
    self->_addAccountSpecifier = v2;

    [(PSSpecifier *)self->_addAccountSpecifier setProperty:@"ADD_ACCOUNT" forKey:PSIDKey];
    if (self->_filteredDataclass) {
      [(PSSpecifier *)self->_addAccountSpecifier setProperty:self->_filteredDataclass forKey:PSAccountsClientDataclassFilterKey];
    }
  }
  unsigned __int8 v13 = ![(ACUISettingsController *)self _isAccountModificationDisabledByRestrictions];
  id v6 = self->_addAccountSpecifier;
  id v7 = +[NSNumber numberWithBool:v13];
  -[PSSpecifier setProperty:forKey:](v6, "setProperty:forKey:");

  id v8 = self->_addAccountSpecifier;
  id v10 = [(ACUISettingsController *)self specifier];
  id v9 = [v10 propertyForKey:PSAppSettingsBundleIDKey];
  -[PSSpecifier setProperty:forKey:](v8, "setProperty:forKey:");

  id v4 = self->_addAccountSpecifier;

  return v4;
}

- (id)_specifierForScheduleSettings
{
  id v7 = self;
  v6[1] = (id)a2;
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:");
  v6[0] = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);

  [v6[0] setProperty:@"FETCH_NEW_DATA" forKey:PSIDKey];
  [v6[0] setControllerLoadAction:"_scheduleSettingsCellWasTappedWithSpecifier:"];
  if ([(ACUISettingsController *)v7 _isAccountModificationDisabledByRestrictions])
  {
    [v6[0] setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
  }
  id v3 = v6[0];
  objc_storeStrong(v6, 0);

  return v3;
}

- (void)_scheduleSettingsCellWasTappedWithSpecifier:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  id v10 = (dispatch_once_t *)&unk_14D28;
  id v9 = 0;
  objc_storeStrong(&v9, &stru_104E0);
  if (*v10 != -1) {
    dispatch_once(v10, v9);
  }
  objc_storeStrong(&v9, 0);
  id v3 = objc_alloc_init((Class)[(id)qword_14D20 principalClass]);
  id v4 = v6;
  id v6 = v3;

  if (v6)
  {
    [v6 setSpecifier:location[0]];
    [v6 setParentController:v8];
    id v5 = [(ACUISettingsController *)v8 rootController];
    objc_msgSend(v6, "setRootController:");

    [(ACUISettingsController *)v8 showController:v6 animate:1];
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (id)_scheduleSettingsModeForSpecifier:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  unsigned __int8 v13 = +[NSProcessInfo processInfo];
  unsigned __int8 v14 = [(NSProcessInfo *)v13 isLowPowerModeEnabled];

  if (v14)
  {
    uint64_t v12 = +[NSBundle bundleForClass:objc_opt_class()];
    id v3 = [(NSBundle *)v12 localizedStringForKey:@"OFF" value:&stru_106B8 table:@"Localizable"];
    id v4 = v15;
    id v15 = v3;

    id v17 = v15;
  }
  else
  {
    if (PCSettingsGetClassPushEnabled())
    {
      uint64_t v11 = +[NSBundle bundleForClass:objc_opt_class()];
      id v5 = [(NSBundle *)v11 localizedStringForKey:@"PUSH" value:&stru_106B8 table:@"Localizable"];
      id v6 = v15;
      id v15 = v5;
    }
    else
    {
      PCSettingsGetClassPollInterval();
      id v7 = (id)ACUIFetchSettingTitle();
      id v8 = v15;
      id v15 = v7;
    }
    id v17 = v15;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  id v9 = v17;

  return v9;
}

- (void)_fetchLazyLoadedSpecifiers
{
  id v9 = self;
  v8[1] = (id)a2;
  if (!self->_isLazyLoadingPluginSpecifiers)
  {
    v9->_isLazyLoadingPluginSpecifiers = 1;
    dispatch_queue_t queue = dispatch_get_global_queue(-32768, 0);
    id v3 = _NSConcreteStackBlock;
    int v4 = -1073741824;
    int v5 = 0;
    id v6 = sub_9EFC;
    id v7 = &unk_102F8;
    v8[0] = v9;
    dispatch_async(queue, &v3);

    objc_storeStrong(v8, 0);
  }
}

- (id)_specifiersForSettingsProvidedByPlugin:(id)a3
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = objc_alloc_init((Class)NSMutableArray);
  id v13 = [location[0] specifiers];
  if ([v13 count])
  {
    id v12 = [v13 mutableCopy];
    id v10 = [location[0] headerText];
    id v11 = +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:");

    [v12 insertObject:v11 atIndex:0];
    if (objc_opt_respondsToSelector())
    {
      id v9 = [location[0] footerText];
      objc_msgSend(v11, "setProperty:forKey:");
    }
    pluginToSpecifiersMap = v16->_pluginToSpecifiersMap;
    id v6 = v12;
    id v3 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v3);
    -[NSMutableDictionary setObject:forKey:](pluginToSpecifiersMap, "setObject:forKey:", v6);

    [v14 addObjectsFromArray:v12];
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v12, 0);
  }
  id v5 = v14;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);

  return v5;
}

- (id)_specifiersForLoadingMessage
{
  id v10 = self;
  v9[1] = (id)a2;
  if (!self->_loadingInProgressSpecifiers)
  {
    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [(NSBundle *)v7 localizedStringForKey:@"LOADING_CONTACTS_CALENDARS" value:&stru_106B8 table:@"Localizable"];
    v9[0] = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);

    [v9[0] setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
    id v8 = +[PSSpecifier emptyGroupSpecifier];
    v11[0] = v8;
    v11[1] = v9[0];
    objc_super v2 = +[NSArray arrayWithObjects:v11 count:2];
    loadingInProgressSpecifiers = v10->_loadingInProgressSpecifiers;
    v10->_loadingInProgressSpecifiers = v2;

    objc_storeStrong(v9, 0);
  }
  int v4 = v10->_loadingInProgressSpecifiers;

  return v4;
}

- (void)_accountCellWasTappedWithSpecifier:(id)a3
{
  id v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = [location[0] propertyForKey:ACUIAccountKey];
  if (v31)
  {
    char v26 = 0;
    char v24 = 0;
    char v22 = 0;
    unsigned __int8 v13 = 0;
    if ([(ACUISettingsController *)v33 isShowDataclassDetailFromAppsEnabled])
    {
      id v27 = [v31 accountType];
      char v26 = 1;
      id v25 = [v27 identifier];
      char v24 = 1;
      unsigned __int8 v13 = 0;
      if ([v25 isEqualToString:ACAccountTypeIdentifierAppleAccount])
      {
        id v23 = [v31 objectForKeyedSubscript:@"accountClass"];
        char v22 = 1;
        unsigned __int8 v13 = [v23 isEqualToString:@"primary"];
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
    id v9 = [(ACUISettingsController *)v33 navigationController];
    id v8 = [v9 viewControllers];
    id v21 = [v8 lastObject];

    id v11 = [(ACUISettingsController *)v33 specifier];
    id v10 = [v11 propertyForKey:PSAppSettingsBundleIDKey];
    unsigned __int8 v12 = [v10 isEqualToString:@"com.apple.mobilemail"];

    if (v12)
    {
      sub_B264();
      id v20 = [objc_alloc((Class)sub_B39C()) initWithPresenter:v21];
      objc_msgSend(v20, "navigateToiCloudMailSettingsWithDeeplink:");
      int v28 = 1;
      objc_storeStrong(&v20, 0);
    }
    else
    {
      id v6 = [(ACUISettingsController *)v33 specifier];
      id v5 = [v6 propertyForKey:PSAppSettingsBundleIDKey];
      unsigned __int8 v7 = [v5 isEqualToString:@"com.apple.mobilecal"];

      if (v7)
      {
        sub_B4D0();
        id v19 = [objc_alloc((Class)sub_B608()) initWithPresenter:v21];
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
      int v4 = +[ACUIAccountViewProvidersManager sharedInstance];
      unsigned __int8 v18 = (objc_class *)[(ACUIAccountViewProvidersManager *)v4 viewControllerClassForViewingAccount:v31];

      if (v18)
      {
        id v15 = objc_alloc_init(v18);
        [v15 setSpecifier:location[0]];
        [v15 setAccountChangeObserver:v33];
        if (([(objc_class *)v18 isSubclassOfClass:objc_opt_class()] & 1) != 0
          || ([(objc_class *)v18 isSubclassOfClass:objc_opt_class()] & 1) != 0)
        {
          [v15 setParentController:v33];
          id v3 = [(ACUISettingsController *)v33 rootController];
          objc_msgSend(v15, "setRootController:");

          [(ACUISettingsController *)v33 showController:v15 animate:1];
        }
        else
        {
          id v14 = [objc_alloc((Class)PSSetupController) initWithRootViewController:v15];
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
        id v17 = (id)_ACUILogSystem();
        os_log_type_t v16 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
        {
          sub_4EF4((uint64_t)v34, (uint64_t)"-[ACUISettingsController _accountCellWasTappedWithSpecifier:]", 878, (uint64_t)v31);
          _os_log_error_impl(&dword_0, (os_log_t)v17, v16, "%s (%d) \"No view controller available for account %@\"", v34, 0x1Cu);
        }
        objc_storeStrong(&v17, 0);
        int v28 = 1;
      }
    }
  }
  else
  {
    id v30 = (id)_ACUILogSystem();
    os_log_type_t v29 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
    {
      sub_4EF4((uint64_t)v35, (uint64_t)"-[ACUISettingsController _accountCellWasTappedWithSpecifier:]", 850, (uint64_t)location[0]);
      _os_log_error_impl(&dword_0, (os_log_t)v30, v29, "%s (%d) \"An account cell was tapped but had no account associated with it! %@\"", v35, 0x1Cu);
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
  id v6 = objc_msgSend(*(id *)&v9->PSListController_opaque[OBJC_IVAR___PSListController__specifiers], "objectAtIndex:", -[ACUISettingsController indexForIndexPath:](v9, "indexForIndexPath:", v7));
  [*(id *)&v9->PSListController_opaque[OBJC_IVAR___PSListController__table] deselectRowAtIndexPath:v7 animated:1];
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
    id v26 = [(ACUISettingsController *)v37 navigationController];
    id v27 = (ACUISettingsController *)[v26 topViewController];
    char v33 = 0;
    char v31 = 0;
    char isKindOfClass = 0;
    if (v27 != v37)
    {
      id v34 = [(ACUISettingsController *)v37 navigationController];
      char v33 = 1;
      id v32 = [v34 topViewController];
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
      id v22 = [(ACUISettingsController *)v37 navigationController];
      id v30 = [v22 topViewController];

      id v24 = [v30 specifiers];
      id v23 = [location[0] specifier];
      unsigned __int8 v25 = objc_msgSend(v24, "containsObject:");

      if (v25)
      {
        id v18 = [location[0] specifier];
        id v38 = 0;
        id v19 = +[UIDevice currentDevice];
        id v20 = [(UIDevice *)v19 userInterfaceIdiom];

        id v38 = v20;
        BOOL v21 = 1;
        if (v20 != (unsigned char *)&dword_0 + 1) {
          BOOL v21 = v38 == (unsigned char *)&dword_4 + 1;
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
      id v16 = [(ACUISettingsController *)v37 navigationController];
      id v15 = [v16 viewControllers];
      unsigned __int8 v17 = [v15 containsObject:v37];

      if (v17)
      {
        id v14 = [(ACUISettingsController *)v37 navigationController];
        id v4 = [v14 popToViewController:v37 animated:1];
      }
      else
      {
        id v12 = [(ACUISettingsController *)v37 navigationController];
        id v11 = [v12 viewControllers];
        id v10 = [(ACUISettingsController *)v37 parentViewController];
        unsigned __int8 v13 = objc_msgSend(v11, "containsObject:");

        if (v13)
        {
          id v9 = [(ACUISettingsController *)v37 navigationController];
          id v8 = [(ACUISettingsController *)v37 parentViewController];
          id v5 = objc_msgSend(v9, "popToViewController:animated:");
        }
        else
        {
          id v7 = [(ACUISettingsController *)v37 navigationController];
          id v6 = [v7 popToRootViewControllerAnimated:1];
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
  id v3 = +[MCProfileConnection sharedConnection];
  BOOL v4 = [v3 effectiveBoolValueForSetting:MCFeatureAccountModificationAllowed] == 2;

  return v4;
}

- (void)specifiersDidChangeForPlugin:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  pluginToSpecifiersMap = v10->_pluginToSpecifiersMap;
  id v3 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v3);
  id v8 = -[NSMutableDictionary objectForKey:](pluginToSpecifiersMap, "objectForKey:");

  id v7 = [(ACUISettingsController *)v10 _specifiersForSettingsProvidedByPlugin:location[0]];
  os_log_t oslog = (os_log_t)(id)_ACUILogSystem();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_6C00((uint64_t)v11, (uint64_t)"-[ACUISettingsController specifiersDidChangeForPlugin:]", 979, (uint64_t)v8, (uint64_t)v7);
    _os_log_debug_impl(&dword_0, oslog, OS_LOG_TYPE_DEBUG, "%s (%d) \"replacing specifiers %@ with specifiers %@\"", v11, 0x26u);
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