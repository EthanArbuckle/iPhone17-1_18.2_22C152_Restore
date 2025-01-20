@interface AAUIAppsSyncingToiCloudViewController
- (id)_specifiersForAppsSyncingToDrive;
- (id)account;
- (id)specifiers;
- (void)dealloc;
- (void)setSpecifier:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AAUIAppsSyncingToiCloudViewController

- (id)account
{
  v2 = [(AAUIDataclassViewController *)self accountManager];
  v3 = [v2 accounts];
  v4 = [v3 objectForKeyedSubscript:AIDAServiceTypeCloud];

  return v4;
}

- (void)dealloc
{
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "AAUISyncingToiCloudViewController dealloc %@", buf, 0xCu);
  }

  [(AAUIAppsSyncingToDriveSpecifierProvider *)self->_appsSyncingToDriveSpecifierProvider setDelegate:0];
  appsSyncingToDriveSpecifierProvider = self->_appsSyncingToDriveSpecifierProvider;
  self->_appsSyncingToDriveSpecifierProvider = 0;

  v5.receiver = self;
  v5.super_class = (Class)AAUIAppsSyncingToiCloudViewController;
  [(AAUIDataclassViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)AAUIAppsSyncingToiCloudViewController;
  [(AAUIAppsSyncingToiCloudViewController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AAUIAppsSyncingToiCloudViewController;
  [(AAUIAppsSyncingToiCloudViewController *)&v7 viewWillAppear:a3];
  v4 = [(AAUIAppsSyncingToiCloudViewController *)self navigationItem];
  objc_super v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"APPS_SYNCING_TO_ICLOUD_TITLE" value:&stru_76890 table:@"Localizable"];
  [v4 setTitle:v6];
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AAUIAppsSyncingToiCloudViewController;
  [(AAUIAppsSyncingToiCloudViewController *)&v11 setSpecifier:v4];
  objc_super v5 = [AAUIAppsSyncingToDriveSpecifierProvider alloc];
  v6 = [(AAUIDataclassViewController *)self accountManager];
  objc_super v7 = [(AAUIAppsSyncingToDriveSpecifierProvider *)v5 initWithAccountManager:v6 presenter:self];
  appsSyncingToDriveSpecifierProvider = self->_appsSyncingToDriveSpecifierProvider;
  self->_appsSyncingToDriveSpecifierProvider = v7;

  [(AAUIAppsSyncingToDriveSpecifierProvider *)self->_appsSyncingToDriveSpecifierProvider setDelegate:self];
  v9 = [v4 objectForKeyedSubscript:@"icloudAccountManager"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    sub_48F90();
  }
  if (!v9)
  {
    v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_48F4C(v10);
    }
  }
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  if (!*(void *)&self->super.ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    id v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "AAUISyncingToiCloudViewController is loading specifiers.", (uint8_t *)&v16, 2u);
    }

    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = +[PSSpecifier groupSpecifierWithID:@"THIRD_PARTY_APPS"];
    objc_super v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"APPS_SYNCING_TO_ICLOUD_DESC" value:&stru_76890 table:@"Localizable"];
    [v6 setProperty:v8 forKey:PSFooterTextGroupKey];

    [v5 addObject:v6];
    if (self->_appsSyncingToDriveSpecifierProvider)
    {
      v9 = [(AAUIAppsSyncingToiCloudViewController *)self _specifiersForAppsSyncingToDrive];
      [v5 addObjectsFromArray:v9];
    }
    id v10 = [v5 copy];
    objc_super v11 = *(void **)&self->super.ACUIDataclassConfigurationViewController_opaque[v3];
    *(void *)&self->super.ACUIDataclassConfigurationViewController_opaque[v3] = v10;
  }
  v12 = _AAUILogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)&self->super.ACUIDataclassConfigurationViewController_opaque[v3];
    int v16 = 138412290;
    uint64_t v17 = v13;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "AAUISyncingToiCloudViewController specifiers: returning %@", (uint8_t *)&v16, 0xCu);
  }

  v14 = *(void **)&self->super.ACUIDataclassConfigurationViewController_opaque[v3];

  return v14;
}

- (id)_specifiersForAppsSyncingToDrive
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if (self->_appsSyncingToDriveSpecifierProvider)
  {
    id v4 = +[PSSpecifier groupSpecifierWithID:@"APPS SYNCING"];
    [v3 addObject:v4];

    id v5 = [(AAUIAppsSyncingToDriveSpecifierProvider *)self->_appsSyncingToDriveSpecifierProvider specifiers];
    [v3 addObjectsFromArray:v5];
  }
  id v6 = [v3 copy];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsSyncingToDriveSpecifierProvider, 0);

  objc_storeStrong((id *)&self->_ubiquitySpecifierProvider, 0);
}

@end