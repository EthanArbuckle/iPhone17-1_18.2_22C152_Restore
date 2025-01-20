@interface ACUISetupViewController
+ (id)_specifierForDataclassEditControllerClass:(Class)a3 withName:(id)a4 account:(id)a5;
+ (void)showAlternateCreationControllerForAccountType:(id)a3 username:(id)a4 fromViewController:(id)a5 specifier:(id)a6 completion:(id)a7;
+ (void)showDataclassConfigurationControllerForAccount:(id)a3 name:(id)a4 fromViewController:(id)a5 specifier:(id)a6 completion:(id)a7;
- (void)_dismissAndNotifyParent;
- (void)controller:(id)a3 didFinishSettingUpAccount:(id)a4;
- (void)finishedAccountSetup;
@end

@implementation ACUISetupViewController

- (void)controller:(id)a3 didFinishSettingUpAccount:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v36 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v34 = 0;
  objc_storeStrong(&v34, a4);
  id v33 = _ACUILogSystem();
  os_log_type_t v32 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = objc_opt_class();
    id v19 = (id)[v34 username];
    __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v39, (uint64_t)"-[ACUISetupViewController controller:didFinishSettingUpAccount:]", 52, v18, (uint64_t)v19);
    _os_log_debug_impl(&dword_1DDFE5000, (os_log_t)v33, v32, "%s (%d) \"Controller %@ reports being finished with setting up account %@.\"", v39, 0x26u);
  }
  objc_storeStrong(&v33, 0);
  char v31 = 0;
  if (!v36->_didAttemptDataclassSetup)
  {
    v36->_didAttemptDataclassSetup = 1;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = (id)[location[0] specifier];
      id v30 = (id)[v15 userInfo];

      id v16 = (id)[v30 objectForKeyedSubscript:@"ACUIForceMailSetupKey"];
      BOOL v17 = ([v16 BOOLValue] & 1) != 1;

      if (!v17) {
        v36->_shouldForceMailSetup = 1;
      }
      objc_storeStrong(&v30, 0);
    }
    id v29 = +[ACUIAccountViewProvidersManager sharedInstance];
    Class v28 = (Class)[v29 viewControllerClassForViewingAccount:v34];
    id v27 = _ACUILogSystem();
    os_log_type_t v26 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
    {
      id v14 = (id)[v34 username];
      __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v38, (uint64_t)"-[ACUISetupViewController controller:didFinishSettingUpAccount:]", 73, (uint64_t)v14, (uint64_t)v28);
      _os_log_debug_impl(&dword_1DDFE5000, (os_log_t)v27, v26, "%s (%d) \"Dataclass configuration VC class for account %@ identified as %@\"", v38, 0x26u);
    }
    objc_storeStrong(&v27, 0);
    if ([(objc_class *)v28 isSubclassOfClass:objc_opt_class()])
    {
      id v25 = (id)[(ACUISetupViewController *)v36 topViewController];
      Class v11 = v28;
      id v13 = (id)[v25 specifier];
      id v12 = (id)[v13 name];
      id v24 = +[ACUISetupViewController _specifierForDataclassEditControllerClass:withName:account:](ACUISetupViewController, "_specifierForDataclassEditControllerClass:withName:account:", v11);

      id v23 = objc_alloc_init(v28);
      [v23 setFirstTimeSetup:1];
      if (v36->_shouldForceMailSetup) {
        [v23 forceMailSetup];
      }
      id v9 = (id)[location[0] specifier];
      id v22 = (id)[v9 userInfo];

      id v4 = (id)[v22 objectForKeyedSubscript:@"ACUIPreEnabledDataclasses"];
      BOOL v10 = v4 == 0;

      if (!v10)
      {
        id v8 = (id)[v22 objectForKeyedSubscript:@"ACUIPreEnabledDataclasses"];
        objc_msgSend(v23, "setPreEnabledDataclasses:");
      }
      [v23 setParentController:v25];
      id v6 = v23;
      id v7 = [(PSRootController *)v36 rootController];
      objc_msgSend(v6, "setRootController:");

      [v23 setSpecifier:v24];
      [v25 pushController:v23];
      char v31 = 1;
      objc_storeStrong(&v22, 0);
      objc_storeStrong(&v23, 0);
      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v25, 0);
    }
    objc_storeStrong(&v29, 0);
  }
  os_log_t oslog = (os_log_t)_ACUILogSystem();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    if (v31) {
      v5 = @"NO";
    }
    else {
      v5 = @"YES";
    }
    __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v37, (uint64_t)"-[ACUISetupViewController controller:didFinishSettingUpAccount:]", 107, (uint64_t)v5);
    _os_log_debug_impl(&dword_1DDFE5000, oslog, OS_LOG_TYPE_DEBUG, "%s (%d) \"Deciding wether to dismiss self: %@\"", v37, 0x1Cu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if ((v31 & 1) == 0) {
    [(ACUISetupViewController *)v36 _dismissAndNotifyParent];
  }
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
}

+ (void)showAlternateCreationControllerForAccountType:(id)a3 username:(id)a4 fromViewController:(id)a5 specifier:(id)a6 completion:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = 0;
  objc_storeStrong(&v26, a4);
  id v25 = 0;
  objc_storeStrong(&v25, a5);
  id v24 = 0;
  objc_storeStrong(&v24, a6);
  id v23 = 0;
  objc_storeStrong(&v23, a7);
  id v22 = _ACUILogSystem();
  os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_3_8_32_4_0_8_66((uint64_t)v28, (uint64_t)"+[ACUISetupViewController showAlternateCreationControllerForAccountType:username:fromViewController:specifier:completion:]", 115, (uint64_t)location[0]);
    _os_log_impl(&dword_1DDFE5000, (os_log_t)v22, v21, "%s (%d) \"Showing Alternate Creation Controller for '%{public}@'\"", v28, 0x1Cu);
  }
  objc_storeStrong(&v22, 0);
  id v9 = (id)[v24 userInfo];
  id v20 = (id)[v9 mutableCopy];

  objc_storeStrong(location, (id)*MEMORY[0x1E4F177E8]);
  BOOL v10 = (void *)MEMORY[0x1E4F92E70];
  id v11 = (id)[v24 name];
  id v19 = (id)[v10 preferenceSpecifierNamed:v11 target:0 set:0 get:0 detail:objc_opt_class() cell:10 edit:0];

  [v20 setValue:@"YahooAccount" forKey:@"specifierAccount"];
  [v20 setValue:getIMAPAccountClass() forKey:@"class"];
  if (v26) {
    [v20 setValue:v26 forKey:@"Username"];
  }
  [v19 setUserInfo:v20];
  uint64_t v18 = +[ACUIAccountViewProvidersManager sharedInstance];
  Class v17 = 0;
  Class v17 = [(ACUIAccountViewProvidersManager *)v18 viewControllerClassForCreatingAccountWithType:location[0]];
  id v7 = v19;
  id v8 = NSStringFromClass(v17);
  objc_msgSend(v7, "setProperty:forKey:");

  id v16 = (id)[v25 controllerForSpecifier:v19];
  [v25 showController:v16];
  objc_storeStrong(&v16, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

+ (void)showDataclassConfigurationControllerForAccount:(id)a3 name:(id)a4 fromViewController:(id)a5 specifier:(id)a6 completion:(id)a7
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v38 = 0;
  objc_storeStrong(&v38, a4);
  id v37 = 0;
  objc_storeStrong(&v37, a5);
  id v36 = 0;
  objc_storeStrong(&v36, a6);
  id v35 = 0;
  objc_storeStrong(&v35, a7);
  id v33 = (id)[v36 userInfo];
  id v19 = (id)[v33 objectForKeyedSubscript:@"ACUIForceMailSetupKey"];
  BOOL v20 = ([v19 BOOLValue] & 1) != 1;

  BOOL v34 = !v20;
  id v32 = +[ACUIAccountViewProvidersManager sharedInstance];
  Class v31 = (Class)[v32 viewControllerClassForViewingAccount:location[0]];
  id v30 = _ACUILogSystem();
  os_log_type_t v29 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEBUG))
  {
    id v14 = (id)[location[0] username];
    __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v40, (uint64_t)"+[ACUISetupViewController showDataclassConfigurationControllerForAccount:name:fromViewController:specifier:completion:]", 160, (uint64_t)v14, (uint64_t)v31);
    _os_log_debug_impl(&dword_1DDFE5000, (os_log_t)v30, v29, "%s (%d) \"Dataclass configuration VC class for account %@ identified as %@\"", v40, 0x26u);
  }
  objc_storeStrong(&v30, 0);
  if ([(objc_class *)v31 isSubclassOfClass:objc_opt_class()])
  {
    id v28 = (id)[(id)objc_opt_class() _specifierForDataclassEditControllerClass:v31 withName:v38 account:location[0]];
    id v27 = objc_alloc_init(v31);
    [v27 setFirstTimeSetup:1];
    if (v34) {
      [v27 forceMailSetup];
    }
    id v7 = (id)[v33 objectForKeyedSubscript:@"ACUIPreEnabledDataclasses"];
    BOOL v13 = v7 == 0;

    if (!v13)
    {
      id v12 = (id)[v33 objectForKeyedSubscript:@"ACUIPreEnabledDataclasses"];
      objc_msgSend(v27, "setPreEnabledDataclasses:");
    }
    uint64_t v21 = MEMORY[0x1E4F143A8];
    int v22 = -1073741824;
    int v23 = 0;
    id v24 = __119__ACUISetupViewController_showDataclassConfigurationControllerForAccount_name_fromViewController_specifier_completion___block_invoke;
    id v25 = &unk_1E6D20258;
    id v26 = v35;
    [v27 setConfigurationCompletion:&v21];
    id v8 = v27;
    id v9 = (id)[v37 parentController];
    objc_msgSend(v8, "setParentController:");

    id v10 = v27;
    id v11 = (id)[v37 rootController];
    objc_msgSend(v10, "setRootController:");

    [v27 setSpecifier:v28];
    [v37 pushController:v27];
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
  }
  else
  {
    (*((void (**)(id, void))v35 + 2))(v35, 0);
  }
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
}

uint64_t __119__ACUISetupViewController_showDataclassConfigurationControllerForAccount_name_fromViewController_specifier_completion___block_invoke(uint64_t a1)
{
  id v2 = (id)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ACUIAccountSetupDidFinish" object:0];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)finishedAccountSetup
{
}

- (void)_dismissAndNotifyParent
{
  id v5 = (id)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"ACUIAccountSetupDidFinish" object:0];

  if (!self->_shouldForceMailSetup) {
    [(PSSetupController *)self dismissAnimated:1];
  }
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa
                                            + (int)*MEMORY[0x1E4F92F20]));
  char v4 = [WeakRetained conformsToProtocol:&unk_1F3A141B0];

  if (v4)
  {
    id v2 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F20]));
    [v2 setupViewControllerDidDismiss:self];
  }
}

+ (id)_specifierForDataclassEditControllerClass:(Class)a3 withName:(id)a4 account:(id)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v15 = a1;
  SEL v14 = a2;
  Class v13 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v11 = 0;
  objc_storeStrong(&v11, a5);
  id v10 = (id)[MEMORY[0x1E4F92E70] preferenceSpecifierNamed:location target:0 set:0 get:0 detail:v13 cell:1 edit:0];
  v16[0] = @"account";
  v17[0] = v11;
  v16[1] = @"ACUISpecifierAccountIdentifier";
  id v7 = (id)[v11 identifier];
  v17[1] = v7;
  id v9 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  [v10 setUserInfo:v9];
  id v8 = v10;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
  return v8;
}

@end