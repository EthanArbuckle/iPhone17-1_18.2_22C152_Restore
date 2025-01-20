@interface MailSettingsSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (MailSettingsSpecifierProvider)initWithAccountManager:(id)a3;
- (MailSettingsSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (NSArray)specifiers;
- (id)_dataclassState:(id)a3;
- (id)_isMailEnabled:(id)a3;
- (id)account;
- (void)_loadBundleIfNeeded:(id)a3;
- (void)_loadMailSettingsBundleIfNeeded;
- (void)_mailSpecifierWasTapped:(id)a3;
- (void)_mailStateChanged:(id)a3 withSpecifier:(id)a4;
- (void)_navigateToExistingFlow:(id)a3;
- (void)_navigateToMailPreferences:(id)a3;
- (void)_navigateToSwiftUIFlow:(id)a3;
- (void)_onMailAccountCreated:(BOOL)a3;
- (void)_presentAccountCreationPage;
- (void)onMailTap;
- (void)onMailTapWithDeeplink:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation MailSettingsSpecifierProvider

- (MailSettingsSpecifierProvider)initWithAccountManager:(id)a3
{
  return [(MailSettingsSpecifierProvider *)self initWithAccountManager:a3 presenter:0];
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:AIDAServiceTypeCloud];

  return v3;
}

- (MailSettingsSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  objc_storeStrong((id *)&self->_accountManager, a3);
  id v6 = a4;
  objc_storeWeak((id *)&self->_presenter, v6);

  return self;
}

- (NSArray)specifiers
{
  v3 = +[NSMutableArray array];
  v4 = [(MailSettingsSpecifierProvider *)self account];
  v5 = v4;
  if (v4
    && (uint64_t v6 = ACAccountDataclassMail, [v4 isProvisionedForDataclass:ACAccountDataclassMail]))
  {
    unsigned int v7 = objc_msgSend(v5, "aa_isAccountClass:", AAAccountClassPrimary);
    v8 = _MSLogSystem();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v9) {
        sub_E36E8(v5, v8);
      }

      v10 = +[PSSpecifier acui_linkListCellSpecifierForDataclass:v6 account:v5 target:self set:0 get:"_dataclassState:" detail:0];
      mailSpecifier = self->mailSpecifier;
      self->mailSpecifier = v10;

      v12 = self->mailSpecifier;
      v13 = +[NSBundle bundleForClass:objc_opt_class()];
      v14 = [v13 localizedStringForKey:@"ICLOUD_MAIL_LABEL" value:&stru_127BF8 table:0];
      [(PSSpecifier *)v12 setName:v14];

      [(PSSpecifier *)self->mailSpecifier setControllerLoadAction:"_mailSpecifierWasTapped:"];
      v26[0] = &__kCFBooleanTrue;
      uint64_t v15 = ACUIAccountKey;
      v25[0] = ACUIAlreadyShowedEnableAndDeleteKey;
      v25[1] = ACUIAccountKey;
      v16 = [(AIDAAccountManager *)self->_accountManager accounts];
      v17 = [v16 objectForKeyedSubscript:AIDAServiceTypeCloud];
      v26[1] = v17;
      v18 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
      v19 = +[NSMutableDictionary dictionaryWithDictionary:v18];

      [v19 setObject:&__kCFBooleanTrue forKey:@"MailDetailViewWithBackKey"];
      v20 = objc_msgSend(v5, "aa_childMailAccount");
      if (v20) {
        [v19 setObject:v20 forKey:v15];
      }
      [(PSSpecifier *)self->mailSpecifier setUserInfo:v19];
      [(PSSpecifier *)self->mailSpecifier setObject:self->_accountManager forKeyedSubscript:@"icloudAccountManager"];
      [v3 addObject:self->mailSpecifier];
    }
    else
    {
      if (v9) {
        sub_E3774(v5, v8);
      }

      v23 = +[PSSpecifier acui_specifierForDataclass:v6 account:v5 target:self set:"_mailStateChanged:withSpecifier:" get:"_isMailEnabled:"];
      v24 = self->mailSpecifier;
      self->mailSpecifier = v23;

      [v3 addObject:self->mailSpecifier];
    }
  }
  else
  {
    v21 = _MSLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_E36B4();
    }
  }

  return (NSArray *)v3;
}

- (id)_dataclassState:(id)a3
{
  v4 = [(MailSettingsSpecifierProvider *)self account];
  unsigned int v5 = [v4 isEnabledForDataclass:ACAccountDataclassMail];

  if (v5)
  {
    uint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v7 = v6;
    CFStringRef v8 = @"ON";
  }
  else
  {
    BOOL v9 = [(MailSettingsSpecifierProvider *)self account];
    unsigned int v10 = objc_msgSend(v9, "aa_needsEmailConfiguration");

    uint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v7 = v6;
    if (v10) {
      CFStringRef v8 = @"DATACLASS_NEEDS_SETUP";
    }
    else {
      CFStringRef v8 = @"OFF";
    }
  }
  v11 = [v6 localizedStringForKey:v8 value:&stru_127BF8 table:0];

  return v11;
}

- (void)_mailSpecifierWasTapped:(id)a3
{
  id v4 = a3;
  unsigned int v5 = _MSLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_E3800();
  }

  if (_os_feature_enabled_impl()) {
    [(MailSettingsSpecifierProvider *)self _navigateToSwiftUIFlow:v4];
  }
  else {
    [(MailSettingsSpecifierProvider *)self _navigateToExistingFlow:v4];
  }
}

- (void)_navigateToExistingFlow:(id)a3
{
  id v4 = a3;
  [(MailSettingsSpecifierProvider *)self _loadMailSettingsBundleIfNeeded];
  [v4 setDetailControllerClass:NSClassFromString(@"ICloudMailAccountController")];
  [v4 setControllerLoadAction:0];
}

- (void)_navigateToSwiftUIFlow:(id)a3
{
  id v6 = a3;
  id v4 = [(MailSettingsSpecifierProvider *)self account];
  unsigned int v5 = objc_msgSend(v4, "aa_needsEmailConfiguration");

  if (v5) {
    [(MailSettingsSpecifierProvider *)self _presentAccountCreationPage];
  }
  else {
    [(MailSettingsSpecifierProvider *)self _navigateToMailPreferences:v6];
  }
}

- (void)_navigateToMailPreferences:(id)a3
{
  id v4 = a3;
  unsigned int v5 = _MSLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_E3834();
  }

  id v6 = [(MailSettingsSpecifierProvider *)self account];
  if (objc_msgSend(v6, "aa_isAccountClass:", AAAccountClassPrimary))
  {
    unsigned int v7 = [(AIDAAccountManager *)self->_accountManager accounts];
    CFStringRef v8 = [v7 objectForKeyedSubscript:AIDAServiceTypeCloud];
    BOOL v9 = [v4 userInfo];
    uint64_t v10 = ACUIAccountKey;
    [v9 setObject:v8 forKeyedSubscript:ACUIAccountKey];

    v11 = objc_msgSend(v6, "aa_childMailAccount");
    if (v11)
    {
      v12 = [v4 userInfo];
      [v12 setObject:v11 forKeyedSubscript:v10];
    }
  }
  accountManager = self->_accountManager;
  v14 = [v4 userInfo];
  [v14 setObject:accountManager forKeyedSubscript:@"ACUIAccountManagerKey"];

  [v4 setDetailControllerClass:objc_opt_class()];
  [v4 setControllerLoadAction:0];
}

- (void)_presentAccountCreationPage
{
  v3 = _MSLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_E3868();
  }

  objc_initWeak(&location, self);
  id v4 = objc_alloc((Class)iCloudMailAccountProvider);
  unsigned int v5 = [(AIDAAccountManager *)self->_accountManager accountStore];
  id v6 = [(MailSettingsSpecifierProvider *)self account];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  CFStringRef v8 = (iCloudMailAccountProvider *)[v4 initWithAccountStore:v5 appleAccount:v6 presenter:WeakRetained];
  mailAccountProvider = self->mailAccountProvider;
  self->mailAccountProvider = v8;

  uint64_t v10 = self->mailAccountProvider;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_32C4;
  v11[3] = &unk_11F688;
  objc_copyWeak(&v12, &location);
  [(iCloudMailAccountProvider *)v10 presentWithCompletionHandler:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_loadMailSettingsBundleIfNeeded
{
}

- (void)_loadBundleIfNeeded:(id)a3
{
  id v3 = a3;
  id v4 = UISystemRootDirectory();
  unsigned int v5 = [v4 stringByAppendingPathComponent:@"System/Library/PreferenceBundles/AccountSettings"];

  id v6 = [v5 stringByAppendingPathComponent:v3];
  unsigned int v7 = +[NSBundle bundleWithPath:v6];
  if (([v7 isLoaded] & 1) == 0)
  {
    CFStringRef v8 = _MSLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_E389C();
    }

    [v7 load];
  }
}

- (void)_mailStateChanged:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = _MSLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_E3908();
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v10 = WeakRetained;
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_delegate);
      [v13 specifierProvider:self dataclassSwitchStateDidChange:v6 withSpecifier:v7];
    }
  }
}

- (id)_isMailEnabled:(id)a3
{
  id v3 = [(AIDAAccountManager *)self->_accountManager accounts];
  id v4 = [v3 objectForKeyedSubscript:AIDAServiceTypeCloud];

  unsigned int v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isEnabledForDataclass:ACAccountDataclassMail]);

  return v5;
}

- (void)_onMailAccountCreated:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = _MSLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_E39A8();
  }

  id v6 = [(MailSettingsSpecifierProvider *)self account];
  id v7 = objc_msgSend(v6, "aa_childMailAccount");

  id v8 = [(MailSettingsSpecifierProvider *)self specifiers];
  if (v7)
  {
    BOOL v9 = [(PSSpecifier *)self->mailSpecifier userInfo];
    [v9 setObject:v7 forKeyedSubscript:ACUIAccountKey];
  }
  uint64_t v10 = _MSLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_E3974();
  }

  id v11 = +[NSNumber numberWithBool:v3];
  char v12 = [(PSSpecifier *)self->mailSpecifier userInfo];
  [v12 setObject:v11 forKeyedSubscript:@"START_MAIL_IMPORT"];

  id v13 = objc_alloc_init(PreferencesViewController);
  accountManager = self->_accountManager;
  uint64_t v15 = [(PSSpecifier *)self->mailSpecifier userInfo];
  [v15 setObject:accountManager forKeyedSubscript:@"ACUIAccountManagerKey"];

  [(PreferencesViewController *)v13 setSpecifier:self->mailSpecifier];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  v17 = [WeakRetained navigationController];
  [v17 pushViewController:v13 animated:1];
}

- (void)onMailTapWithDeeplink:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MailSettingsSpecifierProvider *)self account];
  id v6 = v5;
  if (v5 && [v5 isProvisionedForDataclass:ACAccountDataclassMail])
  {
    if (objc_msgSend(v6, "aa_needsEmailConfiguration"))
    {
      [(MailSettingsSpecifierProvider *)self _presentAccountCreationPage];
    }
    else
    {
      id v7 = [(MailSettingsSpecifierProvider *)self specifiers];
      id v8 = objc_alloc_init(PreferencesViewController);
      if (objc_msgSend(v6, "aa_isManagedAppleID")
        && (objc_msgSend(v6, "aa_isAccountClass:", AAAccountClassPrimary) & 1) == 0)
      {
        v18[0] = &__kCFBooleanTrue;
        uint64_t v9 = ACUIAccountKey;
        v17[0] = ACUIAlreadyShowedEnableAndDeleteKey;
        v17[1] = ACUIAccountKey;
        uint64_t v10 = [(AIDAAccountManager *)self->_accountManager accounts];
        id v11 = [v10 objectForKeyedSubscript:AIDAServiceTypeCloud];
        v18[1] = v11;
        char v12 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
        id v13 = +[NSMutableDictionary dictionaryWithDictionary:v12];

        [v13 setObject:&__kCFBooleanTrue forKey:@"MailDetailViewWithBackKey"];
        v14 = objc_msgSend(v6, "aa_childMailAccount");
        if (v14) {
          [v13 setObject:v14 forKey:v9];
        }
        [(PSSpecifier *)self->mailSpecifier setUserInfo:v13];
      }
      [(PreferencesViewController *)v8 setSpecifier:self->mailSpecifier];
      if (v4) {
        [(PreferencesViewController *)v8 setDeeplink:v4];
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
      v16 = [WeakRetained navigationController];
      [v16 pushViewController:v8 animated:1];
    }
  }
}

- (void)onMailTap
{
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mailSpecifier, 0);
  objc_storeStrong((id *)&self->mailAccountProvider, 0);
  objc_destroyWeak((id *)&self->_presenter);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end