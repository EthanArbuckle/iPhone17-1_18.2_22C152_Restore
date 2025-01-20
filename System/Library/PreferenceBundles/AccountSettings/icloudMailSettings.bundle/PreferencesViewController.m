@interface PreferencesViewController
- (ACAccount)appleAccount;
- (ACAccountStore)accountStore;
- (AIDAAccountManager)accountManager;
- (BOOL)_hasIcloudMailConfigured;
- (NSString)deeplink;
- (id)mailboxSpecifierProvider;
- (void)_loadBundleIfNeeded:(id)a3;
- (void)_loadMailSettingsBundleIfNeeded;
- (void)_onCustomEmailDomainLoadComplete:(id)a3;
- (void)_onMailCleanupDeeplinkNotificationHandler:(id)a3;
- (void)addSwiftUIView;
- (void)customEmailDomainWasTapped;
- (void)handleDeeplink:(id)a3;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)initAccountInfo;
- (void)mailSettingsStateChangedWithEnabled:(BOOL)a3;
- (void)mailboxBehaviorWasTapped;
- (void)openMailboxBehaviors;
- (void)openSMIME;
- (void)sMimeTapped;
- (void)setAccountManager:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setAppleAccount:(id)a3;
- (void)setDeeplink:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PreferencesViewController

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)PreferencesViewController;
  [(PreferencesViewController *)&v9 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"MAIL_CARD_TITLE" value:&stru_127BF8 table:0];
  [(PreferencesViewController *)self setTitle:v4];

  [(PreferencesViewController *)self initAccountInfo];
  [(PreferencesViewController *)self addSwiftUIView];
  if (self->_deeplink) {
    -[PreferencesViewController handleDeeplink:](self, "handleDeeplink:");
  }
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_onCustomEmailDomainLoadComplete:" name:@"BYOD_SPINNER_CHANGE_NOTIFICATION" object:0];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_onMailCleanupDeeplinkNotificationHandler:" name:@"MAIL_CLEANUP_DEEPLINK_NOTIFICATION" object:0];

  v7 = [*(id *)&self->PSViewController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  v8 = [v7 objectForKeyedSubscript:@"START_MAIL_IMPORT"];

  if ([v8 BOOLValue]) {
    [(MAPreferencesControllerDelegate *)self->swiftUIController presentMailImport];
  }
}

- (void)initAccountInfo
{
  uint64_t v3 = OBJC_IVAR___PSViewController__specifier;
  id v12 = [*(id *)&self->PSViewController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  v4 = [v12 objectForKey:ACUIAccountKey];
  v5 = [v4 parentAccount];
  [(PreferencesViewController *)self setAppleAccount:v5];

  v6 = [(PreferencesViewController *)self appleAccount];

  if (!v6) {
    [(PreferencesViewController *)self setAppleAccount:v4];
  }
  v7 = [v12 objectForKeyedSubscript:@"ACUIAccountManagerKey"];
  [(PreferencesViewController *)self setAccountManager:v7];

  v8 = [(PreferencesViewController *)self accountManager];
  objc_super v9 = [v8 accountStore];
  [(PreferencesViewController *)self setAccountStore:v9];

  v10 = [*(id *)&self->PSViewController_opaque[v3] target];
  mailSpecifier = self->mailSpecifier;
  self->mailSpecifier = v10;
}

- (void)addSwiftUIView
{
  uint64_t v3 = [(PreferencesViewController *)self accountStore];
  v4 = [(PreferencesViewController *)self appleAccount];
  v5 = +[MAPreferencesViewProvider getSwiftUIViewWithAccountStore:v3 appleAccount:v4 delegate:self];
  swiftUIController = self->swiftUIController;
  self->swiftUIController = v5;

  [(PreferencesViewController *)self addChildViewController:self->swiftUIController];
  v7 = [(PreferencesViewController *)self view];
  v8 = [(MAPreferencesControllerDelegate *)self->swiftUIController view];
  [v7 addSubview:v8];

  objc_super v9 = self->swiftUIController;

  [(MAPreferencesControllerDelegate *)v9 didMoveToParentViewController:self];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PreferencesViewController;
  [(PreferencesViewController *)&v13 viewDidLayoutSubviews];
  uint64_t v3 = [(PreferencesViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(MAPreferencesControllerDelegate *)self->swiftUIController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  double v7 = (void (**)(void))a4;
  double v8 = [v6 objectForKey:@"path"];
  double v9 = _MSLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_E3AAC();
  }

  unsigned int v10 = [v8 isEqualToString:@"BYOD_SETTING_SPECIFIER_ID"];
  double v11 = _MSLogSystem();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12) {
      sub_E3A10();
    }

    objc_super v13 = [v6 objectForKey:@"domain"];
    if ([(PreferencesViewController *)self _hasIcloudMailConfigured])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_42DC;
      block[3] = &unk_11F6F0;
      id v28 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      v14 = v28;
    }
    else
    {
      v15 = _MSLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_E39DC();
      }

      v16 = +[NSBundle bundleForClass:objc_opt_class()];
      v17 = [v16 localizedStringForKey:@"BYOD_MEMBER_MAIL_CONFIGURE_ALERT_MESSAGE" value:&stru_127BF8 table:0];
      v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v13);

      v18 = +[NSBundle bundleForClass:objc_opt_class()];
      v19 = [v18 localizedStringForKey:@"BYOD_MEMBER_MAIL_CONFIGURE_ALERT_TITLE" value:&stru_127BF8 table:0];
      v20 = +[UIAlertController alertControllerWithTitle:v19 message:v14 preferredStyle:1];

      v21 = +[NSBundle bundleForClass:objc_opt_class()];
      v22 = [v21 localizedStringForKey:@"OK" value:&stru_127BF8 table:0];
      v23 = +[UIAlertAction actionWithTitle:v22 style:0 handler:0];

      [v20 addAction:v23];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_4340;
      v25[3] = &unk_11F718;
      v25[4] = self;
      id v26 = v20;
      id v24 = v20;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v25);
    }
    if (v7) {
LABEL_16:
    }
      v7[2](v7);
  }
  else
  {
    if (v12) {
      sub_E3A44();
    }

    [(MAPreferencesControllerDelegate *)self->swiftUIController handleUniversalLinkWithUserInfo:v6];
    if (v7) {
      goto LABEL_16;
    }
  }
}

- (void)handleDeeplink:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = _MSLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v4;
      _os_log_impl(&def_66DD4, v5, OS_LOG_TYPE_DEFAULT, "Deeplink: %@", buf, 0xCu);
    }
    v22 = self;

    id v6 = [objc_alloc((Class)NSURLComponents) initWithString:v4];
    double v7 = [v6 path];
    double v8 = [v7 stringByReplacingOccurrencesOfString:@"com.apple.Dataclass.Mail/" withString:&stru_127BF8];
    double v9 = [v8 stringByReplacingOccurrencesOfString:@"ICLOUD_SERVICE/" withString:&stru_127BF8];

    unsigned int v10 = objc_opt_new();
    [v10 setValue:v9 forKey:@"path"];
    double v11 = _MSLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = [v6 queryItems];
      *(_DWORD *)buf = 138412290;
      id v29 = v12;
      _os_log_impl(&def_66DD4, v11, OS_LOG_TYPE_DEFAULT, "NSURLComponents: %@", buf, 0xCu);
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    objc_super v13 = [v6 queryItems];
    id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v19 = [v18 value];
          v20 = [v18 name];
          [v10 setValue:v19 forKey:v20];
        }
        id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v15);
    }

    v21 = _MSLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v10;
      _os_log_impl(&def_66DD4, v21, OS_LOG_TYPE_DEFAULT, "Handle deeplink: %@", buf, 0xCu);
    }

    [(PreferencesViewController *)v22 handleURL:v10 withCompletion:0];
  }
}

- (BOOL)_hasIcloudMailConfigured
{
  if (![(ACAccount *)self->_appleAccount isProvisionedForDataclass:ACAccountDataclassMail])return 0; {
  uint64_t v3 = [(ACAccount *)self->_appleAccount aa_childMailAccount];
  }
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_onCustomEmailDomainLoadComplete:(id)a3
{
  id v9 = a3;
  BOOL v4 = +[NSNumber numberWithBool:0];
  double v5 = [v9 userInfo];
  id v6 = [v5 valueForKey:@"active"];

  if (v6)
  {
    double v7 = [v9 userInfo];
    uint64_t v8 = [v7 valueForKey:@"active"];

    BOOL v4 = (void *)v8;
  }
  -[MAPreferencesControllerDelegate onCustomEmailDomainEntryPointChangeWithSpinning:](self->swiftUIController, "onCustomEmailDomainEntryPointChangeWithSpinning:", [v4 BOOLValue]);
}

- (void)_onMailCleanupDeeplinkNotificationHandler:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_482C;
  v5[3] = &unk_11F718;
  id v6 = a3;
  double v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)mailSettingsStateChangedWithEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:");
  id v6 = _MSLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    uint64_t v16 = v5;
    _os_log_impl(&def_66DD4, v6, OS_LOG_TYPE_DEFAULT, "[PreferencesViewController] mail dataclass state changed to %@", (uint8_t *)&v15, 0xCu);
  }

  mailSpecifier = self->mailSpecifier;
  if (!mailSpecifier) {
    goto LABEL_7;
  }
  uint64_t v8 = [(MailSettingsSpecifierProvider *)mailSpecifier delegate];
  if (!v8) {
    goto LABEL_7;
  }
  id v9 = (void *)v8;
  unsigned int v10 = [(MailSettingsSpecifierProvider *)self->mailSpecifier delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(MailSettingsSpecifierProvider *)self->mailSpecifier delegate];
    [v12 specifierProvider:self->mailSpecifier dataclassSwitchStateDidChange:v5 withSpecifier:*(void *)&self->PSViewController_opaque[OBJC_IVAR___PSViewController__specifier]];
  }
  else
  {
LABEL_7:
    id v12 = [(ACAccount *)self->_appleAccount copy];
    [v12 setEnabled:v3 forDataclass:ACAccountDataclassMail];
    objc_super v13 = _MSLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&def_66DD4, v13, OS_LOG_TYPE_DEFAULT, "No delegate set to save data class state, saving...", (uint8_t *)&v15, 2u);
    }

    id v14 = +[ACAccountStore defaultStore];
    [v14 saveAccount:v12 withDataclassActions:0 doVerify:0 completion:&stru_11F758];
  }
}

- (void)mailboxBehaviorWasTapped
{
  BOOL v3 = _MSLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_E3C2C();
  }

  [(PreferencesViewController *)self openMailboxBehaviors];
}

- (void)customEmailDomainWasTapped
{
  v2 = _MSLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_E3C60();
  }

  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"BYOD_HANDLE_URL_NOTIFICATION" object:0 userInfo:&__NSDictionary0__struct];
}

- (void)sMimeTapped
{
  BOOL v3 = _MSLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_E3C94();
  }

  [(PreferencesViewController *)self openSMIME];
}

- (void)openMailboxBehaviors
{
  v2 = [(PreferencesViewController *)self mailboxSpecifierProvider];
  BOOL v3 = [v2 specifiers];
  id v4 = objc_msgSend(v3, "ac_filter:", &stru_11F798);
  double v5 = [v4 firstObject];

  if (v5)
  {
    [v5 performControllerLoadAction];
  }
  else
  {
    id v6 = _MSLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_E3CC8();
    }
  }
}

- (void)openSMIME
{
  v2 = [(PreferencesViewController *)self mailboxSpecifierProvider];
  BOOL v3 = [v2 specifiers];
  id v4 = objc_msgSend(v3, "ac_filter:", &stru_11F7B8);
  double v5 = [v4 firstObject];

  if (v5)
  {
    [v5 performControllerLoadAction];
  }
  else
  {
    id v6 = _MSLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_E3CFC();
    }
  }
}

- (id)mailboxSpecifierProvider
{
  mailboxSpecifierProvider = self->_mailboxSpecifierProvider;
  if (!mailboxSpecifierProvider)
  {
    [(PreferencesViewController *)self _loadMailSettingsBundleIfNeeded];
    Class v4 = NSClassFromString(@"iCloudMailboxSpecifierProvider");
    unsigned int v5 = [(objc_class *)v4 conformsToProtocol:&OBJC_PROTOCOL___AAUISpecifierProvider];
    id v6 = _MSLogSystem();
    double v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        accountManager = self->_accountManager;
        *(_DWORD *)buf = 138412290;
        v22 = accountManager;
        _os_log_impl(&def_66DD4, v7, OS_LOG_TYPE_DEFAULT, "AccountManager: %@", buf, 0xCu);
      }

      if (!self->_accountManager)
      {
        id v9 = _MSLogSystem();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_E3D30();
        }

        id v10 = objc_alloc((Class)AIDAAccountManager);
        char v11 = +[ACAccountStore defaultStore];
        id v12 = (AIDAAccountManager *)[v10 initWithAccountStore:v11];
        objc_super v13 = self->_accountManager;
        self->_accountManager = v12;

        id v14 = +[ACAccountStore defaultStore];
        int v15 = objc_msgSend(v14, "aa_primaryAppleAccount");
        v20 = v15;
        uint64_t v16 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];

        [(AIDAAccountManager *)self->_accountManager setAccounts:v16];
      }
      v17 = (AAUISpecifierProvider *)[[v4 alloc] initWithAccountManager:self->_accountManager presenter:self];
      double v7 = self->_mailboxSpecifierProvider;
      self->_mailboxSpecifierProvider = v17;
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      sub_E3D64(v7);
    }

    mailboxSpecifierProvider = self->_mailboxSpecifierProvider;
  }

  return mailboxSpecifierProvider;
}

- (void)_loadMailSettingsBundleIfNeeded
{
}

- (void)_loadBundleIfNeeded:(id)a3
{
  id v3 = a3;
  Class v4 = UISystemRootDirectory();
  unsigned int v5 = [v4 stringByAppendingPathComponent:@"System/Library/PreferenceBundles/AccountSettings"];

  id v6 = [v5 stringByAppendingPathComponent:v3];
  double v7 = +[NSBundle bundleWithPath:v6];
  if (([v7 isLoaded] & 1) == 0)
  {
    uint64_t v8 = _MSLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_E3DE8();
    }

    [v7 load];
  }
}

- (NSString)deeplink
{
  return self->_deeplink;
}

- (void)setDeeplink:(id)a3
{
}

- (ACAccount)appleAccount
{
  return self->_appleAccount;
}

- (void)setAppleAccount:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_deeplink, 0);
  objc_storeStrong((id *)&self->_mailboxSpecifierProvider, 0);
  objc_storeStrong((id *)&self->mailSpecifier, 0);

  objc_storeStrong((id *)&self->swiftUIController, 0);
}

@end