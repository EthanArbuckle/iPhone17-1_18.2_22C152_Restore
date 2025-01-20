@interface AAUIBaseDataclassDetailViewController
- (AAUIBaseDataclassDetailViewController)initWithBundleID:(id)a3 account:(id)a4;
- (AIDAAccountManager)accountManager;
- (AIDAServiceOwnerProtocol)serviceOwnersManager;
- (BOOL)_shouldShowDataclassSwitchForAppBundleID:(id)a3;
- (NSString)bundleID;
- (id)_notesDataclassDetailViewController;
- (id)accountsForAccountManager:(id)a3;
- (id)specifiers;
- (void)_loadNotesDetailViewController;
- (void)setAccountManager:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setServiceOwnersManager:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AAUIBaseDataclassDetailViewController

- (AAUIBaseDataclassDetailViewController)initWithBundleID:(id)a3 account:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AAUIBaseDataclassDetailViewController;
  v9 = [(AAUIBaseDataclassDetailViewController *)&v17 init];
  if (v9)
  {
    uint64_t v10 = +[ACAccountStore defaultStore];
    accountStore = v9->_accountStore;
    v9->_accountStore = (ACAccountStore *)v10;

    v12 = (AIDAServiceOwnerProtocol *)[objc_alloc((Class)AIDAServiceOwnersManager) initWithAccountStore:v9->_accountStore];
    serviceOwnersManager = v9->_serviceOwnersManager;
    v9->_serviceOwnersManager = v12;

    v14 = (AIDAAccountManager *)[objc_alloc((Class)AIDAAccountManager) initWithAccountStore:v9->_accountStore];
    accountManager = v9->_accountManager;
    v9->_accountManager = v14;

    [(AIDAAccountManager *)v9->_accountManager setDelegate:v9];
    objc_storeStrong((id *)&v9->_bundleID, a3);
    [(AAUIBaseDataclassDetailViewController *)v9 setAccount:v8];
  }

  return v9;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AAUIBaseDataclassDetailViewController;
  [(AAUIBaseDataclassDetailViewController *)&v5 viewWillAppear:a3];
  v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_48598((uint64_t)self, v4);
  }

  if ([(NSString *)self->_bundleID isEqualToString:@"com.apple.mobilenotes"]) {
    [(AAUIBaseDataclassDetailViewController *)self _loadNotesDetailViewController];
  }
}

- (void)_loadNotesDetailViewController
{
  id v15 = [(AAUIBaseDataclassDetailViewController *)self _notesDataclassDetailViewController];
  [(AAUIBaseDataclassDetailViewController *)self addChildViewController:v15];
  v3 = [(AAUIBaseDataclassDetailViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [v15 view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = [(AAUIBaseDataclassDetailViewController *)self view];
  v14 = [v15 view];
  [v13 addSubview:v14];

  [v15 didMoveToParentViewController:self];
}

- (id)_notesDataclassDetailViewController
{
  return +[ICSViewBuilder buildViewControllerWithAccountManager:self->_accountManager dataclass:ACAccountDataclassNotes];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  if (!*(void *)&self->ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    double v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      bundleID = self->_bundleID;
      int v16 = 138412290;
      objc_super v17 = bundleID;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "AAUIBaseDataclassDetailViewController is loading specifier for bundle id: %@", (uint8_t *)&v16, 0xCu);
    }

    if ([(AAUIBaseDataclassDetailViewController *)self _shouldShowDataclassSwitchForAppBundleID:self->_bundleID])
    {
      id v6 = objc_alloc_init((Class)NSMutableArray);
      double v7 = +[NSBundle bundleForClass:objc_opt_class()];
      double v8 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"DATACLASS_CELL_TITLE"];
      double v9 = [v7 localizedStringForKey:v8 value:&stru_76890 table:@"Localizable"];
      double v10 = +[PSSpecifier groupSpecifierWithID:@"DATACLASS_SWITCH_GROUP" name:v9];

      [v6 addObject:v10];
      if ([(NSString *)self->_bundleID isEqualToString:@"com.apple.reminders"])
      {
        double v11 = &ACAccountDataclassReminders;
      }
      else
      {
        if (![(NSString *)self->_bundleID isEqualToString:@"com.apple.MobileAddressBook"])
        {
LABEL_10:
          v13 = *(void **)&self->ACUIDataclassConfigurationViewController_opaque[v3];
          *(void *)&self->ACUIDataclassConfigurationViewController_opaque[v3] = v6;

          goto LABEL_11;
        }
        double v11 = &ACAccountDataclassContacts;
      }
      v12 = [(AAUIBaseDataclassDetailViewController *)self specifierForDataclass:*v11];
      [v6 addObject:v12];

      goto LABEL_10;
    }
  }
LABEL_11:
  v14 = *(void **)&self->ACUIDataclassConfigurationViewController_opaque[v3];

  return v14;
}

- (BOOL)_shouldShowDataclassSwitchForAppBundleID:(id)a3
{
  return [&off_79CF0 containsObject:a3];
}

- (id)accountsForAccountManager:(id)a3
{
  double v4 = objc_opt_new();
  uint64_t v5 = AIDAServiceTypeCloud;
  id v6 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager accountForService:AIDAServiceTypeCloud];
  if (v6) {
    [v4 setObject:v6 forKeyedSubscript:v5];
  }
  id v7 = [v4 copy];

  return v7;
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (AIDAServiceOwnerProtocol)serviceOwnersManager
{
  return self->_serviceOwnersManager;
}

- (void)setServiceOwnersManager:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);

  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end