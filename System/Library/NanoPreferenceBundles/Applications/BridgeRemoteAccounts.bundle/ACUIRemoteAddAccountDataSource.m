@interface ACUIRemoteAddAccountDataSource
- (ACUIRemoteAccountSyncController)syncController;
- (ACUIRemoteAddAccountDataSource)initWithSyncController:(id)a3 settingsController:(id)a4;
- (ACUIRemoteDeviceSettingsController)settingsController;
- (BOOL)shouldAddSpecifierForAccountTypeID:(id)a3;
- (Class)controllerClassForCreatingAccountWithType:(id)a3 withViewProviderManager:(id)a4;
- (Class)viewControllerClassForCreatingAccountWithType:(id)a3 withViewProviderManager:(id)a4;
- (Class)viewControllerClassForCreatingOtherAccountTypes;
- (NSArray)accounts;
- (void)accountControllerCompletedWithAccount:(id)a3 action:(int64_t)a4 data:(id)a5 specifier:(id)a6 viewController:(id)a7 completion:(id)a8;
- (void)configureAccountCreationController:(id)a3;
- (void)configureSpecifierForOtherAccountSpecifier:(id)a3;
- (void)hasAccountWithType:(id)a3 accountStore:(id)a4 completion:(id)a5;
- (void)setSettingsController:(id)a3;
- (void)setSyncController:(id)a3;
@end

@implementation ACUIRemoteAddAccountDataSource

- (ACUIRemoteAddAccountDataSource)initWithSyncController:(id)a3 settingsController:(id)a4
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  v4 = v12;
  v12 = 0;
  v9.receiver = v4;
  v9.super_class = (Class)ACUIRemoteAddAccountDataSource;
  v8 = [(ACUIRemoteAddAccountDataSource *)&v9 init];
  v12 = v8;
  objc_storeStrong((id *)&v12, v8);
  if (v8)
  {
    [(ACUIRemoteAddAccountDataSource *)v12 setSyncController:location[0]];
    [(ACUIRemoteAddAccountDataSource *)v12 setSettingsController:v10];
  }
  v6 = v12;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v6;
}

- (NSArray)accounts
{
  return [(ACUIRemoteAccountSyncController *)self->_syncController accounts];
}

- (BOOL)shouldAddSpecifierForAccountTypeID:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = +[ACUIAccountViewProvidersManager sharedInstance];
  BOOL v5 = [(ACUIAccountViewProvidersManager *)v4 controllerClassForCreatingRemoteAccountWithType:location[0]] != 0;

  objc_storeStrong(location, 0);
  return v5;
}

- (Class)viewControllerClassForCreatingOtherAccountTypes
{
  return (Class)objc_opt_class();
}

- (void)configureSpecifierForOtherAccountSpecifier:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] setProperty:v4 forKey:ACUIAddAccountDataSourceKey];
  objc_storeStrong(location, 0);
}

- (Class)viewControllerClassForCreatingAccountWithType:(id)a3 withViewProviderManager:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v6 = [v7 controllerClassForCreatingRemoteAccountWithType:location[0]];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);

  return (Class)v6;
}

- (Class)controllerClassForCreatingAccountWithType:(id)a3 withViewProviderManager:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v6 = [v7 controllerClassForCreatingRemoteAccountWithType:location[0]];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);

  return (Class)v6;
}

- (void)hasAccountWithType:(id)a3 accountStore:(id)a4 completion:(id)a5
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  id v18 = 0;
  objc_storeStrong(&v18, a5);
  memset(__b, 0, sizeof(__b));
  v13 = [(ACUIRemoteAccountSyncController *)v21->_syncController accounts];
  id v14 = [(NSArray *)v13 countByEnumeratingWithState:__b objects:v22 count:16];
  if (v14)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    id v10 = v14;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(v13);
      }
      id v17 = *(id *)(__b[1] + 8 * v9);
      id v5 = [v17 accountType];
      unsigned __int8 v6 = [v5 isEqual:location[0]];

      if (v6) {
        break;
      }
      ++v9;
      if (v7 + 1 >= (unint64_t)v10)
      {
        uint64_t v9 = 0;
        id v10 = [(NSArray *)v13 countByEnumeratingWithState:__b objects:v22 count:16];
        if (!v10) {
          goto LABEL_9;
        }
      }
    }
    (*((void (**)(id, id))v18 + 2))(v18, v17);
    int v15 = 1;
  }
  else
  {
LABEL_9:
    int v15 = 0;
  }

  if (!v15) {
    (*((void (**)(id, void))v18 + 2))(v18, 0);
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (void)configureAccountCreationController:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (objc_opt_respondsToSelector()) {
    [location[0] setHost:v4];
  }
  objc_storeStrong(location, 0);
}

- (void)accountControllerCompletedWithAccount:(id)a3 action:(int64_t)a4 data:(id)a5 specifier:(id)a6 viewController:(id)a7 completion:(id)a8
{
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v24 = a4;
  id v23 = 0;
  objc_storeStrong(&v23, a5);
  id v22 = 0;
  objc_storeStrong(&v22, a6);
  id v21 = 0;
  objc_storeStrong(&v21, a7);
  id v20 = 0;
  objc_storeStrong(&v20, a8);
  if (v24 == 1)
  {
    id v19 = objc_alloc_init(ACUIRemoteAccountDataclassViewController);
    [(ACUIRemoteAccountDataclassViewController *)v19 setAccount:location[0]];
    [(ACUIRemoteAccountDataclassViewController *)v19 setSyncController:v26->_syncController];
    [(ACUIRemoteAccountDataclassViewController *)v19 setSettingsController:v26->_settingsController];
    [(ACUIRemoteAccountDataclassViewController *)v19 setIsFirstTimeSetup:1];
    [(ACUIRemoteAccountDataclassViewController *)v19 setShowDeleteButton:0];
    id v9 = [v21 parentController];
    -[ACUIRemoteAccountDataclassViewController setParentController:](v19, "setParentController:");

    id v10 = [v21 rootController];
    -[ACUIRemoteAccountDataclassViewController setRootController:](v19, "setRootController:");

    id v11 = [v22 name];
    id v18 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);

    [(ACUIRemoteAccountDataclassViewController *)v19 setSpecifier:v18];
    id v17 = (id)_ACUILogSystem();
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
    {
      sub_2C84((uint64_t)v27, (uint64_t)"-[ACUIRemoteAddAccountDataSource accountControllerCompletedWithAccount:action:data:specifier:viewController:completion:]", 93);
      _os_log_impl(&def_10DA8, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Presenting new account data class configuration\"", v27, 0x12u);
    }
    objc_storeStrong(&v17, 0);
    id v8 = [v21 navigationController];
    [v8 pushViewController:v19 animated:1];

    objc_storeStrong(&v18, 0);
    objc_storeStrong((id *)&v19, 0);
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
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

- (void).cxx_destruct
{
}

@end