@interface AAUIKeychainSyncViewController
- (BOOL)_isLocalizedForWLAN;
- (id)_isKeychainSyncEnabledForSpecifier:(id)a3;
- (id)_specifierForKeychainSwitchCell;
- (id)_tobleroneKeychainSpecifiers;
- (id)specifiers;
- (void)_beginManateeUpgradeAndEnableKeychain;
- (void)_keychainSyncStatusDidChange;
- (void)_registerForKeychainSyncStatusChangeNotification;
- (void)_reloadParentSpecifier;
- (void)_setKeychainSyncEnabled:(id)a3 withSpecifier:(id)a4;
- (void)_startSpinnerInSpecifier:(id)a3;
- (void)_stopListeningForKeychainSyncStatusChangeNotification;
- (void)_stopSpinnerInActiveSpecifier:(id)a3;
- (void)dealloc;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AAUIKeychainSyncViewController

- (void)dealloc
{
  [(AAUIKeychainSyncViewController *)self _stopListeningForKeychainSyncStatusChangeNotification];
  v3.receiver = self;
  v3.super_class = (Class)AAUIKeychainSyncViewController;
  [(AAUIKeychainSyncViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)AAUIKeychainSyncViewController;
  [(AAUIKeychainSyncViewController *)&v5 viewDidLoad];
  objc_super v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"KEYCHAIN_NAV_BAR_TITLE" value:&stru_76890 table:@"Localizable"];
  [(AAUIKeychainSyncViewController *)self setTitle:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)AAUIKeychainSyncViewController;
  [(AAUIKeychainSyncViewController *)&v12 viewDidAppear:a3];
  [(AAUIKeychainSyncViewController *)self _registerForKeychainSyncStatusChangeNotification];
  objc_initWeak(&location, self);
  v4 = +[NSNotificationCenter defaultCenter];
  objc_super v5 = +[NSOperationQueue mainQueue];
  uint64_t v6 = MCRestrictionChangedNotification;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_D020;
  v9[3] = &unk_75640;
  objc_copyWeak(&v10, &location);
  v7 = [v4 addObserverForName:v6 object:0 queue:v5 usingBlock:v9];
  id restrictionChangeNotificationObserver = self->_restrictionChangeNotificationObserver;
  self->_id restrictionChangeNotificationObserver = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self->_restrictionChangeNotificationObserver];

  id restrictionChangeNotificationObserver = self->_restrictionChangeNotificationObserver;
  self->_id restrictionChangeNotificationObserver = 0;

  v7.receiver = self;
  v7.super_class = (Class)AAUIKeychainSyncViewController;
  [(AAUIKeychainSyncViewController *)&v7 viewDidDisappear:v3];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = [(AAUIKeychainSyncViewController *)self _tobleroneKeychainSpecifiers];
    uint64_t v6 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)_tobleroneKeychainSpecifiers
{
  uint64_t v3 = +[PSSpecifier groupSpecifierWithID:@"DATACLASS_HEADER_GROUP"];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"KEYCHAIN_DATACLASS_TITLE" value:&stru_76890 table:@"Localizable"];
  uint64_t v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:-1 edit:0];

  [v6 setProperty:objc_opt_class() forKey:PSCellClassKey];
  objc_super v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"KEYCHAIN_DATACLASS_TITLE" value:&stru_76890 table:@"Localizable"];
  [v6 setProperty:v8 forKey:PSTitleKey];

  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"KEYCHAIN_DATACLASS_SUBTITLE" value:&stru_76890 table:@"Localizable"];
  [v6 setProperty:v10 forKey:PSTableCellSubtitleTextKey];

  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v12 = [v11 localizedStringForKey:@"ICLOUD_KEYCHAIN_KB_LINK" value:&stru_76890 table:@"Localizable"];
  [v6 setObject:v12 forKeyedSubscript:AAUIDataclassAttributedLink];

  v13 = +[NSBundle bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"LEARN_MORE_CTA" value:&stru_76890 table:@"Localizable"];
  [v6 setObject:v14 forKeyedSubscript:AAUIDataclassAttributedLinkText];

  [v6 setProperty:&off_79D58 forKey:PSAlignmentKey];
  v15 = +[UIImage imageForDataclassWithType:@"com.apple.graphic-icon.passwords"];
  [v6 setProperty:v15 forKey:PSIconImageKey];

  v16 = +[NSBundle bundleForClass:objc_opt_class()];
  v17 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"DATACLASS_CELL_TITLE"];
  v18 = [v16 localizedStringForKey:v17 value:&stru_76890 table:@"Localizable"];

  v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:"_setKeychainSyncEnabled:withSpecifier:" get:"_isKeychainSyncEnabledForSpecifier:" detail:0 cell:6 edit:0];
  switchCellSpecifier = self->_switchCellSpecifier;
  self->_switchCellSpecifier = v19;

  uint64_t v21 = PSEnabledKey;
  [(PSSpecifier *)self->_switchCellSpecifier setObject:&__kCFBooleanTrue forKeyedSubscript:PSEnabledKey];
  v22 = +[MCProfileConnection sharedConnection];
  LODWORD(v17) = [v22 isBoolSettingLockedDownByRestrictions:MCFeatureCloudKeychainSyncAllowed];

  if (v17) {
    [(PSSpecifier *)self->_switchCellSpecifier setObject:&__kCFBooleanFalse forKeyedSubscript:v21];
  }
  [(PSSpecifier *)self->_switchCellSpecifier setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
  uint64_t v23 = ACAccountDataclassKeychainSync;
  [(PSSpecifier *)self->_switchCellSpecifier setObject:ACAccountDataclassKeychainSync forKeyedSubscript:PSIDKey];
  [(PSSpecifier *)self->_switchCellSpecifier setObject:v23 forKeyedSubscript:@"com.apple.accountsui.dataclass"];
  v26[0] = v3;
  v26[1] = v6;
  v26[2] = self->_switchCellSpecifier;
  v24 = +[NSArray arrayWithObjects:v26 count:3];

  return v24;
}

- (id)_specifierForKeychainSwitchCell
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"ICLOUD_KEYCHAIN_LABEL" value:&stru_76890 table:@"Localizable"];
  uint64_t v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"_setKeychainSyncEnabled:withSpecifier:" get:"_isKeychainSyncEnabledForSpecifier:" detail:0 cell:6 edit:0];

  [v5 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];

  return v5;
}

- (void)_startSpinnerInSpecifier:(id)a3
{
}

- (void)_stopSpinnerInActiveSpecifier:(id)a3
{
}

- (BOOL)_isLocalizedForWLAN
{
  return _MGGetBoolAnswer(@"wapi", a2);
}

- (id)_isKeychainSyncEnabledForSpecifier:(id)a3
{
  BOOL v3 = +[AAUIKeychainSyncController isKeychainSyncEnabled];

  return +[NSNumber numberWithBool:v3];
}

- (void)_setKeychainSyncEnabled:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  [(AAUIKeychainSyncViewController *)self _startSpinnerInSpecifier:a4];
  if (+[UIApplication isRunningInStoreDemoMode])
  {
    objc_super v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"KEYCHAIN_NOT_AVAILABLE_IN_DEMO_MODE" value:&stru_76890 table:@"Localizable"];
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"OK" value:&stru_76890 table:@"Localizable"];
    +[AAUserNotification showUserNotificationWithTitle:v8 message:0 cancelButtonTitle:v10 otherButtonTitle:0 withCompletionBlock:&stru_75680];

    [(AAUIKeychainSyncViewController *)self _keychainSyncStatusDidChange];
  }
  else
  {
    self->_isTogglingKeychainSync = 1;
    if ([v6 BOOLValue])
    {
      id v11 = objc_alloc((Class)CDPStateController);
      objc_super v12 = +[CDPContext contextForPrimaryAccount];
      id v13 = [v11 initWithContext:v12];

      id v18 = 0;
      unsigned __int8 v14 = [v13 isManateeAvailable:&v18];
      id v15 = v18;
      if (v14)
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_D9C0;
        v17[3] = &unk_756A8;
        v17[4] = self;
        +[CDPKeychainSync setUserVisibleKeychainSyncEnabled:1 withCompletion:v17];
      }
      else
      {
        [(AAUIKeychainSyncViewController *)self _beginManateeUpgradeAndEnableKeychain];
      }
    }
    else
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_DA70;
      v16[3] = &unk_756A8;
      v16[4] = self;
      +[CDPKeychainSync setUserVisibleKeychainSyncEnabled:0 withCompletion:v16];
    }
  }
}

- (void)_beginManateeUpgradeAndEnableKeychain
{
  self->_isTogglingKeychainSync = 1;
  id v3 = [objc_alloc((Class)AAUISpinnerViewController) initWithNibName:0 bundle:0];
  id v4 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v3];
  id v5 = objc_alloc((Class)CDPUIDeviceToDeviceEncryptionFlowContext);
  id v6 = +[CDPAccount sharedInstance];
  objc_super v7 = [v6 primaryAccountAltDSID];
  id v8 = [v5 initWithAltDSID:v7];

  [v8 setDeviceToDeviceEncryptionUpgradeUIStyle:0];
  [v8 setDeviceToDeviceEncryptionUpgradeType:0];
  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"UPGRADE_ACCOUNT_SECURITY_FEATURE_KEYCHAIN" value:&stru_76890 table:@"Localizable"];
  [v8 setFeatureName:v10];

  [v8 setPresentingViewController:self];
  id v11 = [objc_alloc((Class)CDPUIDeviceToDeviceEncryptionHelper) initWithContext:v8];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_DC58;
  v13[3] = &unk_756D0;
  id v14 = v4;
  id v15 = self;
  id v12 = v4;
  [v11 performDeviceToDeviceEncryptionStateRepairWithCompletion:v13];
}

- (void)_reloadParentSpecifier
{
  id v4 = [(AAUIKeychainSyncViewController *)self parentController];
  id v3 = [(AAUIKeychainSyncViewController *)self specifier];
  [v4 reloadSpecifier:v3];
}

- (void)_keychainSyncStatusDidChange
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_DE24;
  block[3] = &unk_756F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_registerForKeychainSyncStatusChangeNotification
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Registering for Keychain Sync status change notification.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v4 = (const char *)OTTrustStatusChangeNotification;
  id v5 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_E178;
  handler[3] = &unk_75720;
  objc_copyWeak(&v13, buf);
  notify_register_dispatch(v4, &self->_keychainSyncNotificationToken, (dispatch_queue_t)&_dispatch_main_q, handler);

  id v6 = (const char *)kSOSCCCircleChangedNotification;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_E1B8;
  v10[3] = &unk_75720;
  objc_copyWeak(&v11, buf);
  notify_register_dispatch(v6, &self->_keychainSyncNotificationToken, (dispatch_queue_t)&_dispatch_main_q, v10);

  objc_super v7 = (const char *)kSOSCCViewMembershipChangedNotification;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_E1F8;
  v8[3] = &unk_75720;
  objc_copyWeak(&v9, buf);
  notify_register_dispatch(v7, &self->_keychainViewNotificationToken, (dispatch_queue_t)&_dispatch_main_q, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);
}

- (void)_stopListeningForKeychainSyncStatusChangeNotification
{
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Unregistering for Keychain Sync status change notification.", v4, 2u);
  }

  notify_cancel(self->_keychainSyncNotificationToken);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_restrictionChangeNotificationObserver, 0);

  objc_storeStrong((id *)&self->_switchCellSpecifier, 0);
}

@end