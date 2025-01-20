@interface ACUIDefaultAddAccountDataSource
- (BOOL)shouldAddSpecifierForAccountTypeID:(id)a3;
- (Class)controllerClassForCreatingAccountWithType:(id)a3 withViewProviderManager:(id)a4;
- (Class)viewControllerClassForCreatingAccountWithType:(id)a3 withViewProviderManager:(id)a4;
- (Class)viewControllerClassForCreatingOtherAccountTypes;
- (void)accountControllerCompletedWithAccount:(id)a3 action:(int64_t)a4 data:(id)a5 specifier:(id)a6 viewController:(id)a7 completion:(id)a8;
- (void)configureAccountCreationController:(id)a3;
- (void)configureSpecifierForOtherAccountSpecifier:(id)a3;
- (void)hasAccountWithType:(id)a3 accountStore:(id)a4 completion:(id)a5;
@end

@implementation ACUIDefaultAddAccountDataSource

- (BOOL)shouldAddSpecifierForAccountTypeID:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (Class)viewControllerClassForCreatingOtherAccountTypes
{
  return (Class)objc_opt_class();
}

- (void)configureSpecifierForOtherAccountSpecifier:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (Class)viewControllerClassForCreatingAccountWithType:(id)a3 withViewProviderManager:(id)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v6 = (id)[v7 viewControllerClassForCreatingAccountWithType:location[0]];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return (Class)v6;
}

- (Class)controllerClassForCreatingAccountWithType:(id)a3 withViewProviderManager:(id)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v6 = (id)[v7 controllerClassForCreatingAccountWithType:location[0]];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return (Class)v6;
}

- (void)hasAccountWithType:(id)a3 accountStore:(id)a4 completion:(id)a5
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v15 = 0;
  objc_storeStrong(&v15, a5);
  id v8 = v16;
  id v7 = location[0];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  int v10 = -1073741824;
  int v11 = 0;
  v12 = __78__ACUIDefaultAddAccountDataSource_hasAccountWithType_accountStore_completion___block_invoke;
  v13 = &unk_1E6D1FF58;
  id v14 = v15;
  objc_msgSend(v8, "accountsWithAccountType:completion:", v7);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

void __78__ACUIDefaultAddAccountDataSource_hasAccountWithType_accountStore_completion___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = 0;
  objc_storeStrong(&v7, a3);
  uint64_t v5 = a1[4];
  id v6 = (id)[location[0] firstObject];
  (*(void (**)(void))(v5 + 16))();

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)configureAccountCreationController:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)accountControllerCompletedWithAccount:(id)a3 action:(int64_t)a4 data:(id)a5 specifier:(id)a6 viewController:(id)a7 completion:(id)a8
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v22 = a4;
  id v21 = 0;
  objc_storeStrong(&v21, a5);
  id v20 = 0;
  objc_storeStrong(&v20, a6);
  id v19 = 0;
  objc_storeStrong(&v19, a7);
  id v18 = 0;
  objc_storeStrong(&v18, a8);
  if (location[0] && v22 == 1)
  {
    id v10 = location[0];
    id v11 = (id)[v20 name];
    +[ACUISetupViewController showDataclassConfigurationControllerForAccount:name:fromViewController:specifier:completion:](ACUISetupViewController, "showDataclassConfigurationControllerForAccount:name:fromViewController:specifier:completion:", v10);
  }
  else if (!location[0] && v22 == 2)
  {
    id v17 = (id)[v21 objectForKeyedSubscript:@"Username"];
    id v9 = (id)[location[0] accountType];
    id v8 = (id)[v9 identifier];
    +[ACUISetupViewController showAlternateCreationControllerForAccountType:username:fromViewController:specifier:completion:](ACUISetupViewController, "showAlternateCreationControllerForAccountType:username:fromViewController:specifier:completion:");

    objc_storeStrong(&v17, 0);
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

@end