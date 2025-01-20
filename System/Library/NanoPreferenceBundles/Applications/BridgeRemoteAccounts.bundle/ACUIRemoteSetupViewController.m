@interface ACUIRemoteSetupViewController
- (void)controller:(id)a3 didFinishSettingUpAccount:(id)a4;
@end

@implementation ACUIRemoteSetupViewController

- (void)controller:(id)a3 didFinishSettingUpAccount:(id)a4
{
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = 0;
  objc_storeStrong(&v26, a4);
  id v25 = (id)_ACUILogSystem();
  os_log_type_t v24 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = objc_opt_class();
    id v12 = [v26 username];
    sub_9610((uint64_t)v30, (uint64_t)"-[ACUIRemoteSetupViewController controller:didFinishSettingUpAccount:]", 23, v11, (uint64_t)v12);
    _os_log_debug_impl(&def_10DA8, (os_log_t)v25, v24, "%s (%d) \"Controller %@ reports being finished with setting up account %@.\"", v30, 0x26u);
  }
  objc_storeStrong(&v25, 0);
  char v23 = 0;
  if (!v28->_didAttemptDataclassSetup)
  {
    v28->_didAttemptDataclassSetup = 1;
    id v22 = [(ACUIRemoteSetupViewController *)v28 topViewController];
    uint64_t v7 = objc_opt_class();
    id v9 = [v22 specifier];
    id v8 = [v9 name];
    id v21 = +[ACUISetupViewController _specifierForDataclassEditControllerClass:withName:account:](ACUISetupViewController, "_specifierForDataclassEditControllerClass:withName:account:", v7);

    id v10 = [location[0] specifier];
    id v20 = [v10 propertyForKey:ACUIAddAccountDataSourceKey];

    if (v20)
    {
      id v6 = v20;
      id v5 = v26;
      oslog[1] = (os_log_t)_NSConcreteStackBlock;
      int v15 = -1073741824;
      int v16 = 0;
      v17 = sub_9690;
      v18 = &unk_184B8;
      v19 = v28;
      objc_msgSend(v6, "accountControllerCompletedWithAccount:action:data:specifier:viewController:completion:", v5, 1);
      objc_storeStrong((id *)&v19, 0);
    }
    char v23 = 1;
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v22, 0);
  }
  oslog[0] = (os_log_t)(id)_ACUILogSystem();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    if (v23) {
      CFStringRef v4 = @"NO";
    }
    else {
      CFStringRef v4 = @"YES";
    }
    sub_96D0((uint64_t)v29, (uint64_t)"-[ACUIRemoteSetupViewController controller:didFinishSettingUpAccount:]", 47, (uint64_t)v4);
    _os_log_debug_impl(&def_10DA8, oslog[0], OS_LOG_TYPE_DEBUG, "%s (%d) \"Deciding wether to dismiss self: %@\"", v29, 0x1Cu);
  }
  objc_storeStrong((id *)oslog, 0);
  if ((v23 & 1) == 0) {
    [(ACUIRemoteSetupViewController *)v28 _dismissAndNotifyParent];
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

@end