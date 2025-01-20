@interface AAUIiCloudAppListViewController
- (AIDAServiceOwnerProtocol)serviceOwnersManager;
- (BOOL)_shouldDisableiCloudUI;
- (id)_specifiersForAppsGroup;
- (id)dataClassSpecifierProvider;
- (id)specifiers;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (void)accountDidChangeFromAccount:(id)a3 toAccount:(id)a4;
- (void)cleanupDataclassSpecifiers;
- (void)dealloc;
- (void)setAccountManager:(id)a3;
- (void)setServiceOwnersManager:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AAUIiCloudAppListViewController

- (void)setAccountManager:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AAUIiCloudAppListViewController;
  [(AAUIDataclassViewController *)&v3 setAccountManager:a3];
}

- (void)dealloc
{
  objc_super v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "AAUIiCloudAppListViewController dealloc %@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)AAUIiCloudAppListViewController;
  [(AAUIDataclassViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)AAUIiCloudAppListViewController;
  [(AAUIiCloudAppListViewController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AAUIiCloudAppListViewController;
  [(AAUIiCloudAppListViewController *)&v7 viewWillAppear:a3];
  objc_super v4 = [(AAUIiCloudAppListViewController *)self navigationItem];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"APP_LIST_VIEW_TITLE" value:&stru_76890 table:@"Localizable"];
  [v4 setTitle:v6];
}

- (id)dataClassSpecifierProvider
{
  dataClassSpecifierProvider = self->_dataClassSpecifierProvider;
  if (!dataClassSpecifierProvider)
  {
    objc_super v4 = [AAUIDataclassSpecifierProvider alloc];
    v5 = [(AAUIDataclassViewController *)self accountManager];
    v6 = [(AAUIDataclassSpecifierProvider *)v4 initWithAccountManager:v5 presenter:self];
    objc_super v7 = self->_dataClassSpecifierProvider;
    self->_dataClassSpecifierProvider = v6;

    [(AAUIDataclassSpecifierProvider *)self->_dataClassSpecifierProvider setDelegate:self];
    dataClassSpecifierProvider = self->_dataClassSpecifierProvider;
  }

  return dataClassSpecifierProvider;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  if (!*(void *)&self->super.ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    objc_super v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "AAUIiCloudAppListViewController is loading specifiers.", buf, 2u);
    }

    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = [(AAUIiCloudAppListViewController *)self _specifiersForAppsGroup];
    [v5 addObjectsFromArray:v6];

    id v7 = [v5 copy];
    v8 = *(void **)&self->super.ACUIDataclassConfigurationViewController_opaque[v3];
    *(void *)&self->super.ACUIDataclassConfigurationViewController_opaque[v3] = v7;
  }
  if ([(AAUIiCloudAppListViewController *)self _shouldDisableiCloudUI])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = *(id *)&self->super.ACUIDataclassConfigurationViewController_opaque[v3];
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      uint64_t v13 = PSEnabledKey;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v14), "setObject:forKeyedSubscript:", &__kCFBooleanFalse, v13, (void)v19);
          v14 = (char *)v14 + 1;
        }
        while (v11 != v14);
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v11);
    }
  }
  v15 = _AAUILogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)&self->super.ACUIDataclassConfigurationViewController_opaque[v3];
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = v16;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "AAUIiCloudAppListViewController specifiers: returning %@", buf, 0xCu);
  }

  v17 = *(void **)&self->super.ACUIDataclassConfigurationViewController_opaque[v3];

  return v17;
}

- (void)cleanupDataclassSpecifiers
{
  uint64_t v3 = *(void **)&self->super.ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->super.ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers] = 0;

  appSpecifiers = self->_appSpecifiers;
  self->_appSpecifiers = 0;
}

- (id)_specifiersForAppsGroup
{
  appSpecifiers = self->_appSpecifiers;
  if (!appSpecifiers)
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    id v5 = [(AAUIiCloudAppListViewController *)self dataClassSpecifierProvider];
    v6 = [v5 specifiers];
    [v4 addObjectsFromArray:v6];

    id v7 = (NSMutableArray *)[v4 copy];
    v8 = self->_appSpecifiers;
    self->_appSpecifiers = v7;

    appSpecifiers = self->_appSpecifiers;
  }

  return appSpecifiers;
}

- (BOOL)_shouldDisableiCloudUI
{
  uint64_t v3 = [(AAUIDataclassViewController *)self account];
  if (objc_msgSend(v3, "aa_needsToVerifyTerms"))
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    id v5 = [(AAUIDataclassViewController *)self account];
    if (objc_msgSend(v5, "aa_isPrimaryEmailVerified"))
    {
      v6 = [(AAUIDataclassViewController *)self account];
      id v7 = objc_msgSend(v6, "aa_suspensionInfo");
      unsigned __int8 v4 = [v7 isiCloudSuspended];
    }
    else
    {
      unsigned __int8 v4 = 1;
    }
  }
  return v4;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(AAUIDataclassViewController *)self activeSpecifier];

  if (v6) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }

  return v7;
}

- (void)accountDidChangeFromAccount:(id)a3 toAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)AAUIiCloudAppListViewController;
  [(AAUIDataclassViewController *)&v23 accountDidChangeFromAccount:v6 toAccount:v7];
  v8 = [v6 enabledDataclasses];
  id v9 = [v7 enabledDataclasses];
  unsigned __int8 v10 = [v8 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    id v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v22 = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Account enabled dataclasses changed. Will reload specifiers.", v22, 2u);
    }

    if (v7)
    {
      uint64_t v12 = ACAccountDataclassMail;
      unsigned int v13 = [v6 isEnabledForDataclass:ACAccountDataclassMail];
      if (v13 != [v7 isEnabledForDataclass:v12])
      {
        v14 = [(AAUIiCloudAppListViewController *)self dataClassSpecifierProvider];
        v15 = [v14 ubiquitySpecifierProvider];
        uint64_t v16 = [v15 ubiquityAccessManager];
        objc_msgSend(v16, "setAppAccessGranted:forBundleID:", objc_msgSend(v7, "isEnabledForDataclass:", v12), @"com.apple.mobilemail");
      }
      uint64_t v17 = ACAccountDataclassBookmarks;
      unsigned int v18 = [v6 isEnabledForDataclass:ACAccountDataclassBookmarks];
      if (v18 != [v7 isEnabledForDataclass:v17])
      {
        long long v19 = [(AAUIiCloudAppListViewController *)self dataClassSpecifierProvider];
        long long v20 = [v19 ubiquitySpecifierProvider];
        long long v21 = [v20 ubiquityAccessManager];
        objc_msgSend(v21, "setAppAccessGranted:forBundleID:", objc_msgSend(v7, "isEnabledForDataclass:", v17), @"com.apple.mobilesafari");
      }
    }
  }
}

- (AIDAServiceOwnerProtocol)serviceOwnersManager
{
  return self->_serviceOwnersManager;
}

- (void)setServiceOwnersManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->_dataClassSpecifierProvider, 0);

  objc_storeStrong((id *)&self->_appSpecifiers, 0);
}

@end