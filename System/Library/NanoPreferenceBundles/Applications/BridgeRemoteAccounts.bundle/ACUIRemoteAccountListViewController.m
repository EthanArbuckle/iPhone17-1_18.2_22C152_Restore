@interface ACUIRemoteAccountListViewController
- (ACUIRemoteAccountSyncController)syncController;
- (ACUIRemoteAddAccountDataSource)addAccountDataSource;
- (ACUIRemoteDeviceSettingsController)settingsController;
- (BOOL)_accountTypeIsApple:(id)a3;
- (NMCUICloudNotificationAccountDataSource)cloudNotificationDataSource;
- (NMCUISpecifierController)specifierController;
- (NRDevice)device;
- (UIViewController)authController;
- (id)_newSpecifierForAccount:(id)a3;
- (id)specifiers;
- (id)title;
- (void)_displayAlertWithTitle:(id)a3 message:(id)a4;
- (void)_refreshAccounts;
- (void)dealloc;
- (void)setAddAccountDataSource:(id)a3;
- (void)setAuthController:(id)a3;
- (void)setCloudNotificationDataSource:(id)a3;
- (void)setDevice:(id)a3;
- (void)setSettingsController:(id)a3;
- (void)setSpecifierController:(id)a3;
- (void)setSyncController:(id)a3;
- (void)syncControllerAccountsChanged:(id)a3;
- (void)syncControllerAccountsInvalidated:(id)a3;
- (void)syncControllerStateChanged:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ACUIRemoteAccountListViewController

- (id)title
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"MAIL_AND_CALENDAR" value:&stru_187E8 table:@"Localizable"];

  return v4;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  [(ACUIRemoteAccountSyncController *)self->_syncController removeObserver:self];
  v2.receiver = v4;
  v2.super_class = (Class)ACUIRemoteAccountListViewController;
  [(ACUIRemoteAccountListViewController *)&v2 dealloc];
}

- (void)viewDidLoad
{
  v20 = self;
  SEL v19 = a2;
  v12 = [ACUIRemoteAccountSyncController alloc];
  v13 = [(ACUIRemoteAccountListViewController *)v20 device];
  objc_super v2 = -[ACUIRemoteAccountSyncController initWithRemoteDevice:](v12, "initWithRemoteDevice:");
  syncController = v20->_syncController;
  v20->_syncController = v2;

  v14 = [ACUIRemoteDeviceSettingsController alloc];
  v15 = [(ACUIRemoteAccountListViewController *)v20 device];
  v4 = -[ACUIRemoteDeviceSettingsController initWithRemoteDevice:](v14, "initWithRemoteDevice:");
  settingsController = v20->_settingsController;
  v20->_settingsController = v4;

  id v16 = objc_alloc((Class)sub_6894());
  v17 = [[ACUICloudNotificationAccountDataSource alloc] initWithAccountDataSource:v20->_syncController];
  v6 = (NMCUICloudNotificationAccountDataSource *)objc_msgSend(v16, "initWithAccountDataSource:");
  cloudNotificationDataSource = v20->_cloudNotificationDataSource;
  v20->_cloudNotificationDataSource = v6;

  [(NMCUICloudNotificationAccountDataSource *)v20->_cloudNotificationDataSource setShowsAlerts:1];
  v8 = (NMCUISpecifierController *)[objc_alloc((Class)sub_69C8()) initWithListController:v20 dataSource:v20->_cloudNotificationDataSource isTinker:1];
  specifierController = v20->_specifierController;
  v20->_specifierController = v8;

  v10 = [[ACUIRemoteAddAccountDataSource alloc] initWithSyncController:v20->_syncController settingsController:v20->_settingsController];
  addAccountDataSource = v20->_addAccountDataSource;
  v20->_addAccountDataSource = v10;

  [(ACUIRemoteAccountSyncController *)v20->_syncController addObserver:v20];
  v18.receiver = v20;
  v18.super_class = (Class)ACUIRemoteAccountListViewController;
  [(ACUIRemoteAccountListViewController *)&v18 viewDidLoad];
  [(ACUIRemoteAccountListViewController *)v20 reloadSpecifiers];
  [(ACUIRemoteAccountListViewController *)v20 _refreshAccounts];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)ACUIRemoteAccountListViewController;
  [(ACUIRemoteAccountListViewController *)&v3 viewWillAppear:a3];
  [(ACUIRemoteAccountListViewController *)v6 reloadSpecifiers];
}

- (id)specifiers
{
  v37 = (id *)self;
  v36[1] = (id)a2;
  if (!*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    v36[0] = (id)objc_opt_new();
    v27 = +[NSBundle bundleForClass:objc_opt_class()];
    v26 = [(NSBundle *)v27 localizedStringForKey:@"ACCOUNTS" value:&stru_187E8 table:@"Localizable"];
    id v35 = +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:");

    [v36[0] addObject:v35];
    id v34 = [v37[24] topLevelAccounts];
    if ([v37[24] reloading])
    {
      v25 = +[NSBundle bundleForClass:objc_opt_class()];
      v24 = [(NSBundle *)v25 localizedStringForKey:@"LOADING" value:&stru_187E8 table:@"Localizable"];
      id v33 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);

      [v33 setProperty:objc_opt_class() forKey:PSCellClassKey];
      [v36[0] addObject:v33];
      objc_storeStrong(&v33, 0);
    }
    else
    {
      memset(__b, 0, sizeof(__b));
      id v22 = v34;
      id v23 = [v22 countByEnumeratingWithState:__b objects:v40 count:16];
      if (v23)
      {
        uint64_t v19 = *(void *)__b[2];
        uint64_t v20 = 0;
        id v21 = v23;
        while (1)
        {
          uint64_t v18 = v20;
          if (*(void *)__b[2] != v19) {
            objc_enumerationMutation(v22);
          }
          uint64_t v32 = *(void *)(__b[1] + 8 * v20);
          id v16 = v36[0];
          id v17 = [v37 _newSpecifierForAccount:v32];
          objc_msgSend(v16, "addObject:");

          ++v20;
          if (v18 + 1 >= (unint64_t)v21)
          {
            uint64_t v20 = 0;
            id v21 = [v22 countByEnumeratingWithState:__b objects:v40 count:16];
            if (!v21) {
              break;
            }
          }
        }
      }

      if (v37[26])
      {
        v15 = +[NSBundle bundleForClass:objc_opt_class()];
        v14 = [(NSBundle *)v15 localizedStringForKey:@"ADD_ACCOUNT_TITLE" value:&stru_187E8 table:@"Localizable"];
        id v30 = +[PSSpecifier preferenceSpecifierNamed:v14 target:v37 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

        [v30 setTarget:v37];
        [v30 setProperty:v37[26] forKey:ACUIAddAccountDataSourceKey];
        [v36[0] addObject:v30];
        objc_storeStrong(&v30, 0);
      }
      id v29 = +[PSSpecifier groupSpecifierWithID:@"fetch-frequency"];
      v8 = +[NSBundle bundleForClass:objc_opt_class()];
      v7 = [(NSBundle *)v8 localizedStringForKey:@"FETCH" value:&stru_187E8 table:@"Localizable"];
      id v28 = +[PSSpecifier preferenceSpecifierNamed:v7 target:v37 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

      uint64_t v38 = ACUIRemoteSettingsControllerKey;
      id v10 = [v37 settingsController];
      id v39 = v10;
      v9 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      objc_msgSend(v28, "setUserInfo:");

      [v36[0] addObject:v29];
      [v36[0] addObject:v28];
      id v11 = v36[0];
      id v13 = [v37 specifierController];
      id v12 = [v13 specifiers];
      objc_msgSend(v11, "addObjectsFromArray:");

      objc_storeStrong(&v28, 0);
      objc_storeStrong(&v29, 0);
    }
    id v2 = [v36[0] copy];
    objc_super v3 = (id *)((char *)v37 + OBJC_IVAR___PSListController__specifiers);
    BOOL v4 = *v3;
    NSBundle *v3 = v2;

    objc_storeStrong(&v34, 0);
    objc_storeStrong(&v35, 0);
    objc_storeStrong(v36, 0);
  }
  SEL v5 = *(id *)((char *)v37 + OBJC_IVAR___PSListController__specifiers);

  return v5;
}

- (id)_newSpecifierForAccount:(id)a3
{
  uint64_t v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = v18;
  id v11 = [location[0] accountType];
  unsigned __int8 v12 = -[ACUIRemoteAccountListViewController _accountTypeIsApple:](v10, "_accountTypeIsApple:");

  char v16 = v12 & 1;
  uint64_t v15 = 0;
  if (v12) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = objc_opt_class();
  }
  uint64_t v15 = v9;
  id v8 = [location[0] copy];
  id v14 = +[ACUIAccountSummaryCell specifierWithStyle:account:detailControllerClass:presentationStyle:](ACUIAccountSummaryCell, "specifierWithStyle:account:detailControllerClass:presentationStyle:", 3);

  char v13 = 1;
  if (v16)
  {
    [v14 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
    char v13 = 0;
  }
  v19[0] = ACUIAccountKey;
  id v6 = [location[0] copy];
  v20[0] = v6;
  v19[1] = ACUIShowDeleteButtonKey;
  SEL v5 = +[NSNumber numberWithBool:v13 & 1];
  v20[1] = v5;
  v19[2] = ACUIRemoteSyncControllerKey;
  v20[2] = v18->_syncController;
  BOOL v4 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
  objc_msgSend(v14, "setUserInfo:");

  id v7 = v14;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (BOOL)_accountTypeIsApple:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [location[0] identifier];
  char v6 = 0;
  unsigned __int8 v5 = 1;
  if (([v4 isEqualToString:ACAccountTypeIdentifierAppleAccount] & 1) == 0)
  {
    id v7 = [location[0] identifier];
    char v6 = 1;
    unsigned __int8 v5 = [v7 isEqualToString:ACAccountTypeIdentifierAppleIDAuthentication];
  }
  char v9 = v5 & 1;
  if (v6) {

  }
  objc_storeStrong(location, 0);
  return v9 & 1;
}

- (void)_refreshAccounts
{
  id v10 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  id v2 = [(ACUIRemoteAccountListViewController *)v10 syncController];
  objc_super v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  char v6 = sub_782C;
  id v7 = &unk_18430;
  objc_copyWeak(v8, location);
  [(ACUIRemoteAccountSyncController *)v2 fetchRemoteAccounts:&v3];

  objc_destroyWeak(v8);
  objc_destroyWeak(location);
}

- (void)_displayAlertWithTitle:(id)a3 message:(id)a4
{
  unsigned __int8 v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  char v9 = +[UIAlertController alertControllerWithTitle:location[0] message:v10 preferredStyle:1];
  int v5 = v9;
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [(NSBundle *)v8 localizedStringForKey:@"OK" value:&stru_187E8 table:@"Localizable"];
  char v6 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:");
  -[UIAlertController addAction:](v5, "addAction:");

  [(ACUIRemoteAccountListViewController *)v12 presentViewController:v9 animated:1 completion:0];
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (NRDevice)device
{
  if (!self->_device)
  {
    id v8 = +[NRPairedDeviceRegistry sharedInstance];
    id v7 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    id v6 = -[NRPairedDeviceRegistry getAllDevicesWithArchivedAltAccountDevicesMatching:](v8, "getAllDevicesWithArchivedAltAccountDevicesMatching:");
    id v2 = (NRDevice *)[v6 firstObject];
    device = self->_device;
    self->_device = v2;
  }
  int v4 = self->_device;

  return v4;
}

- (void)syncControllerStateChanged:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_queue_t queue = &_dispatch_main_q;
  int v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_7E20;
  id v8 = &unk_18408;
  char v9 = v11;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)syncControllerAccountsChanged:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_queue_t queue = &_dispatch_main_q;
  int v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_7F48;
  id v8 = &unk_18408;
  char v9 = v11;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)syncControllerAccountsInvalidated:(id)a3
{
  int v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(ACUIRemoteAccountListViewController *)v4 _refreshAccounts];
  objc_storeStrong(location, 0);
}

- (void)setDevice:(id)a3
{
}

- (ACUIRemoteAccountSyncController)syncController
{
  return self->_syncController;
}

- (void)setSyncController:(id)a3
{
}

- (ACUIRemoteDeviceSettingsController)settingsController
{
  return self->_settingsController;
}

- (void)setSettingsController:(id)a3
{
}

- (ACUIRemoteAddAccountDataSource)addAccountDataSource
{
  return self->_addAccountDataSource;
}

- (void)setAddAccountDataSource:(id)a3
{
}

- (NMCUICloudNotificationAccountDataSource)cloudNotificationDataSource
{
  return self->_cloudNotificationDataSource;
}

- (void)setCloudNotificationDataSource:(id)a3
{
}

- (NMCUISpecifierController)specifierController
{
  return self->_specifierController;
}

- (void)setSpecifierController:(id)a3
{
}

- (UIViewController)authController
{
  return self->_authController;
}

- (void)setAuthController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end