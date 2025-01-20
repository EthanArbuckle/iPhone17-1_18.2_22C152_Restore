@interface AAUICDPSpecifierProvider
- (AAUICDPSpecifierProvider)initWithAccountManager:(id)a3;
- (AAUICDPSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (AAUISpecifierProviderDelegate)delegate;
- (NSArray)specifiers;
- (id)_cdpGroupSpecifier;
- (id)_cdpSpecifier;
- (id)_dataclassState:(id)a3;
- (id)_detailViewController;
- (id)_idmsAccount;
- (id)account;
- (void)_cdpSpecifierTapped:(id)a3;
- (void)_reloadSpecifiers;
- (void)setADPState:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation AAUICDPSpecifierProvider

- (AAUICDPSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAUICDPSpecifierProvider;
  v9 = [(AAUICDPSpecifierProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_listController, v8);
    v10->_isADPEnabled = 0;
  }

  return v10;
}

- (AAUICDPSpecifierProvider)initWithAccountManager:(id)a3
{
  return [(AAUICDPSpecifierProvider *)self initWithAccountManager:a3 presenter:0];
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:AIDAServiceTypeCloud];

  return v3;
}

- (void)setADPState:(BOOL)a3
{
  self->_isADPEnabled = a3;
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    v4 = [(AAUICDPSpecifierProvider *)self _cdpGroupSpecifier];
    v10[0] = v4;
    v5 = [(AAUICDPSpecifierProvider *)self _cdpSpecifier];
    v10[1] = v5;
    v6 = +[NSArray arrayWithObjects:v10 count:2];
    id v7 = self->_specifiers;
    self->_specifiers = v6;

    specifiers = self->_specifiers;
  }
  id v8 = specifiers;

  return v8;
}

- (id)_cdpGroupSpecifier
{
  return +[PSSpecifier groupSpecifierWithID:@"ICLOUD_CDP_SPECIFIER_NAME"];
}

- (id)_cdpSpecifier
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"ICLOUD_CDP_SPECIFIER_NAME" value:&stru_76890 table:@"Localizable"];
  v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:"_dataclassState:" detail:0 cell:2 edit:0];

  [v5 setIdentifier:@"ICLOUD_ADP_SPECIFIER_NAME"];
  v6 = +[NSNumber numberWithInteger:1];
  [v5 setProperty:v6 forKey:PSEnabledKey];

  [v5 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [v5 setControllerLoadAction:"_cdpSpecifierTapped:"];

  return v5;
}

- (id)_dataclassState:(id)a3
{
  BOOL isADPEnabled = self->_isADPEnabled;
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = v4;
  if (isADPEnabled) {
    CFStringRef v6 = @"ICLOUD_CDP_STATE_ON";
  }
  else {
    CFStringRef v6 = @"ICLOUD_CDP_STATE_OFF";
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_76890 table:@"Localizable"];

  return v7;
}

- (void)_cdpSpecifierTapped:(id)a3
{
  id v4 = a3;
  v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%@: Entering CDP from the iCloud.", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v4);
  objc_copyWeak(&to, (id *)&self->_listController);
  objc_msgSend(v4, "aaui_startSpinner");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_B5DC;
  v9[3] = &unk_755E8;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &to);
  objc_copyWeak(&v12, (id *)buf);
  v9[4] = self;
  +[AAUISettingsHelper repairPrimaryAppleAccountInViewController:WeakRetained completion:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&to);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

- (id)_idmsAccount
{
  idmsAccount = self->_idmsAccount;
  if (!idmsAccount)
  {
    id v4 = [(AAUICDPSpecifierProvider *)self account];
    v5 = objc_msgSend(v4, "aa_altDSID");

    CFStringRef v6 = +[AKAccountManager sharedInstance];
    id v7 = [v6 authKitAccountWithAltDSID:v5];
    id v8 = self->_idmsAccount;
    self->_idmsAccount = v7;

    idmsAccount = self->_idmsAccount;
  }

  return idmsAccount;
}

- (id)_detailViewController
{
  detailViewController = self->_detailViewController;
  if (!detailViewController)
  {
    id v4 = [AAUIADPSpecifierProvider alloc];
    accountManager = self->_accountManager;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    id v7 = [(AAUIADPSpecifierProvider *)v4 initWithAccountManager:accountManager presenter:WeakRetained];
    adpViewHandler = self->_adpViewHandler;
    self->_adpViewHandler = v7;

    v9 = [(AAUICDPSpecifierProvider *)self account];
    id v10 = objc_msgSend(v9, "aa_altDSID");
    id v11 = +[CDPAccount contextForAccountWithAltDSID:v10];

    id v12 = objc_opt_new();
    v13 = self->_adpViewHandler;
    id v14 = objc_loadWeakRetained((id *)&self->_listController);
    v15 = [v12 makeSwiftUIViewWithCdpContext:v11 advancedDataProtectionViewModelDelegate:v13 presentingViewController:v14];

    v16 = self->_detailViewController;
    self->_detailViewController = v15;

    detailViewController = self->_detailViewController;
  }

  return detailViewController;
}

- (void)_reloadSpecifiers
{
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BC44;
  block[3] = &unk_75610;
  objc_copyWeak(&v4, &location);
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
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
  objc_storeStrong((id *)&self->_adpViewHandler, 0);
  objc_storeStrong((id *)&self->_detailViewController, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_idmsAccount, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end