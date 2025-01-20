@interface ACUIAddMailAccountViewController
- (id)giantSpecifierWithName:(id)a3 forAccountTypeID:(id)a4;
- (id)specifierForOtherAccounts;
- (void)nonModalDataclassConfigurationControllerDidCompleteWithSuccess:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ACUIAddMailAccountViewController

- (void)viewWillAppear:(BOOL)a3
{
  v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ACUIAddMailAccountViewController;
  [(ACUIAddAccountViewController *)&v6 viewWillAppear:a3];
  if (([MEMORY[0x1E4F42738] shouldMakeUIForDefaultPNG] & 1) == 0)
  {
    id v5 = (id)[(ACUIAddMailAccountViewController *)v9 navigationItem];
    id v4 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v3 = (id)[v4 localizedStringForKey:@"WELCOME_TO_MAIL" value:&stru_1F39EF5C0 table:@"Localizable"];
    objc_msgSend(v5, "setTitle:");
  }
}

- (id)giantSpecifierWithName:(id)a3 forAccountTypeID:(id)a4
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  v9.receiver = v13;
  v9.super_class = (Class)ACUIAddMailAccountViewController;
  id v10 = [(ACUIAddAccountViewController *)&v9 giantSpecifierWithName:location[0] forAccountTypeID:v11];
  id v7 = (id)[v10 userInfo];
  id v8 = (id)[v7 mutableCopy];

  if (!v8)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  [v8 setObject:MEMORY[0x1E4F1CC38] forKey:@"ACUIForceMailSetupKey"];
  [v10 setUserInfo:v8];
  id v5 = v10;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)specifierForOtherAccounts
{
  v14 = self;
  v13[1] = (id)a2;
  id v4 = (void *)MEMORY[0x1E4F92E70];
  id v6 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = (id)[v6 localizedStringForKey:@"OTHER" value:&stru_1F39EF5C0 table:@"Localizable"];
  v13[0] = (id)[v4 preferenceSpecifierNamed:v5 target:v14 set:0 get:0 detail:objc_opt_class() cell:11 edit:0];

  Class v12 = 0;
  id v7 = [(ACUIAddAccountViewController *)v14 viewProvidersManager];
  id v8 = (void *)MEMORY[0x1E4F177E8];
  Class v12 = [(ACUIAccountViewProvidersManager *)v7 viewControllerClassForCreatingAccountWithType:*MEMORY[0x1E4F177E8]];

  objc_super v9 = [(ACUIAddAccountViewController *)v14 viewProvidersManager];
  id location = [(ACUIAccountViewProvidersManager *)v9 configurationInfoForCreatingAccountWithType:*v8];

  id v10 = NSStringFromClass(v12);
  objc_msgSend(v13[0], "setProperty:forKey:");

  if (location) {
    [v13[0] setUserInfo:location];
  }
  id v3 = v13[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v13, 0);
  return v3;
}

- (void)nonModalDataclassConfigurationControllerDidCompleteWithSuccess:(BOOL)a3
{
  if (!a3)
  {
    id v4 = (id)[(ACUIAddMailAccountViewController *)self navigationController];
    id v3 = (id)[v4 popToViewController:self animated:1];
  }
}

@end