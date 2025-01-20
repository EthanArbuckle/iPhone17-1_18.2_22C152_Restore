@interface BYODSpecifierProvider
+ (id)log;
- (AAUISpecifierProviderDelegate)delegate;
- (BYODSpecifierProvider)initWithAccountManager:(id)a3;
- (BYODSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (NSArray)specifiers;
- (void)_customDomainSpecifierWasTapped:(id)a3;
- (void)_getCustomEmailDomain:(id)a3 account:(id)a4 callback:(id)a5;
- (void)_loadDomainInfo:(id)a3 notification:(BOOL)a4;
- (void)_loadDomainInfo:(id)a3 notification:(BOOL)a4 targetDomain:(id)a5 domainState:(id)a6;
- (void)_performHSAUpgradeWithAttributes:(id)a3 completion:(id)a4;
- (void)_refreshByodState:(id)a3;
- (void)_upgradeAccountIfNeeded:(id)a3 withCompletion:(id)a4;
- (void)dealloc;
- (void)handleURLNotification:(id)a3;
- (void)loadDomain:(id)a3 withState:(id)a4 completion:(id)a5;
- (void)onByodSpinnerChange:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)showViewController:(id)a3;
@end

@implementation BYODSpecifierProvider

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_638D4;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D74B8 != -1) {
    dispatch_once(&qword_D74B8, block);
  }
  v2 = (void *)qword_D74B0;

  return v2;
}

- (BYODSpecifierProvider)initWithAccountManager:(id)a3
{
  return [(BYODSpecifierProvider *)self initWithAccountManager:a3 presenter:0];
}

- (BYODSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BYODSpecifierProvider;
  v9 = [(BYODSpecifierProvider *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_presenter, v8);
    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v10 selector:"handleURLNotification:" name:@"BYOD_HANDLE_URL_NOTIFICATION" object:0];
  }
  return v10;
}

- (NSArray)specifiers
{
  v3 = [(AIDAAccountManager *)self->_accountManager accounts];
  v4 = [v3 objectForKeyedSubscript:AIDAServiceTypeCloud];

  if ((objc_msgSend(v4, "aa_needsEmailConfiguration") & 1) != 0
    || ([v4 propertiesForDataclass:@"com.apple.Dataclass.PremiumMailSettings"],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKeyedSubscript:@"customDomainEnabled"],
        v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v6 BOOLValue],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    v18 = 0;
  }
  else
  {
    specifiers = self->_specifiers;
    if (!specifiers)
    {
      id v9 = objc_alloc_init((Class)NSMutableArray);
      v10 = +[NSBundle bundleForClass:objc_opt_class()];
      v11 = [v10 localizedStringForKey:@"CUSTOM_EMAIL_DOMAIN" value:&stru_B9F70 table:@"AccountPreferences"];
      v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:1 edit:0];
      customDomainSpecifier = self->_customDomainSpecifier;
      self->_customDomainSpecifier = v12;

      [(PSSpecifier *)self->_customDomainSpecifier setIdentifier:@"BYOD_SETTING_SPECIFIER_ID"];
      [(PSSpecifier *)self->_customDomainSpecifier setControllerLoadAction:"_customDomainSpecifierWasTapped:"];
      v14 = +[NSBundle bundleForClass:objc_opt_class()];
      v15 = +[UIImage imageNamed:@"CustomDomainRowIcon.png" inBundle:v14];

      [(PSSpecifier *)self->_customDomainSpecifier setProperty:v15 forKey:PSIconImageKey];
      [v9 addObject:self->_customDomainSpecifier];
      v16 = (NSArray *)[v9 copy];
      v17 = self->_specifiers;
      self->_specifiers = v16;

      specifiers = self->_specifiers;
    }
    v18 = specifiers;
  }

  return v18;
}

- (void)loadDomain:(id)a3 withState:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(AIDAAccountManager *)self->_accountManager accounts];
  v12 = [v11 objectForKeyedSubscript:AIDAServiceTypeCloud];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_super v13 = objc_msgSend(v12, "aa_altDSID");
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_63ED4;
  v17[3] = &unk_B9850;
  objc_copyWeak(&v21, &location);
  id v14 = v8;
  id v18 = v14;
  id v15 = v9;
  id v19 = v15;
  id v16 = v10;
  id v20 = v16;
  [(BYODSpecifierProvider *)self _upgradeAccountIfNeeded:v13 withCompletion:v17];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)_customDomainSpecifierWasTapped:(id)a3
{
  id v4 = a3;
  v5 = +[BYODSpecifierProvider log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "custom domain specifier tapped", buf, 2u);
  }

  accountManager = self->_accountManager;
  if (!accountManager)
  {
    unsigned __int8 v7 = +[BYODSpecifierProvider log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "account manager is nil", buf, 2u);
    }

    accountManager = self->_accountManager;
  }
  id v8 = [(AIDAAccountManager *)accountManager accounts];
  id v9 = [v8 objectForKeyedSubscript:AIDAServiceTypeCloud];

  id v10 = objc_msgSend(v9, "aa_altDSID");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_64300;
  v12[3] = &unk_B9878;
  v12[4] = self;
  id v11 = v4;
  id v13 = v11;
  [(BYODSpecifierProvider *)self _upgradeAccountIfNeeded:v10 withCompletion:v12];
}

- (void)_loadDomainInfo:(id)a3 notification:(BOOL)a4
{
}

- (void)_loadDomainInfo:(id)a3 notification:(BOOL)a4 targetDomain:(id)a5 domainState:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!v8
    || ([(BYODListDomain *)self->_domainList domains],
        id v13 = objc_claimAutoreleasedReturnValue(),
        id v14 = [v13 count],
        v13,
        !v14))
  {
    objc_msgSend(v10, "byod_startSpinner");
    [(BYODSpecifierProvider *)self onByodSpinnerChange:1];
    id v15 = [(AIDAAccountManager *)self->_accountManager accounts];
    id v16 = [v15 objectForKeyedSubscript:AIDAServiceTypeCloud];

    v17 = [BYODListDomainRequest alloc];
    id v18 = [v16 accountStore];
    id v19 = [(BYODListDomainRequest *)v17 initWithAccount:v16 accountStore:v18];

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_646FC;
    v21[3] = &unk_B9990;
    objc_copyWeak(&v26, &location);
    id v22 = v10;
    id v20 = v16;
    id v23 = v20;
    id v24 = v11;
    id v25 = v12;
    [(BYODListDomainRequest *)v19 performRequestWithCallback:v21];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
}

- (void)showViewController:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = objc_loadWeakRetained((id *)&self->_presenter);
  if (WeakRetained)
  {
    [WeakRetained specifierProvider:self showViewController:v8];
  }
  else
  {
    if (pthread_main_np() != 1)
    {
      unsigned __int8 v7 = +[NSAssertionHandler currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"BYODSpecifierProvider.m" lineNumber:238 description:@"Current thread must be main"];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      [v6 presentViewController:v8 animated:1 completion:0];
    }
    else {
      [v6 showViewController:v8 sender:self];
    }
  }
}

- (void)_getCustomEmailDomain:(id)a3 account:(id)a4 callback:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = objc_alloc_init(MatterhornUpsellManager);
  upsellManager = self->_upsellManager;
  self->_upsellManager = v9;

  id v11 = self->_upsellManager;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_65B48;
  v14[3] = &unk_B99E0;
  id v12 = v7;
  id v15 = v12;
  id v16 = self;
  id v13 = v8;
  id v17 = v13;
  [(MatterhornUpsellManager *)v11 matterhornUpsell:@"settingsCustomDomain" forFeatureId:@"mail.custom-domains.transfer" withCompletion:v14];
}

- (void)_upgradeAccountIfNeeded:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = +[AKAccountManager sharedInstance];
  id v9 = [v8 primaryAuthKitAccount];
  id v10 = (int *)[v8 securityLevelForAccount:v9];

  id v11 = +[BYODSpecifierProvider log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v15 = v10 == &dword_4;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "The account is HSA: %{BOOL}d.", buf, 8u);
  }

  if (v10 == &dword_4)
  {
    v7[2](v7, 1, 0);
  }
  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_65EA4;
    v12[3] = &unk_B8EB0;
    id v13 = v7;
    [(BYODSpecifierProvider *)self _performHSAUpgradeWithAttributes:v6 completion:v12];
  }
}

- (void)_performHSAUpgradeWithAttributes:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)CDPUIDeviceToDeviceEncryptionFlowContext) initWithAltDSID:v12];
  [v7 setDeviceToDeviceEncryptionUpgradeUIStyle:0];
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"CUSTOM_EMAIL_DOMAIN_2FA_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  [v7 setFeatureName:v9];

  [v7 setDeviceToDeviceEncryptionUpgradeType:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  [v7 setPresentingViewController:WeakRetained];

  id v11 = [objc_alloc((Class)CDPUIDeviceToDeviceEncryptionHelper) initWithContext:v7];
  [v11 performDeviceToDeviceEncryptionStateRepairWithCompletion:v6];
}

- (void)_refreshByodState:(id)a3
{
}

- (void)handleURLNotification:(id)a3
{
  id v8 = a3;
  id v4 = [v8 userInfo];
  v5 = [v4 objectForKey:@"domain"];

  id v6 = [v8 userInfo];
  id v7 = [v6 objectForKey:@"domainState"];

  [(BYODSpecifierProvider *)self loadDomain:v5 withState:v7 completion:&stru_B9A20];
}

- (void)onByodSpinnerChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[NSNotificationCenter defaultCenter];
  CFStringRef v7 = @"active";
  v5 = +[NSNumber numberWithBool:v3];
  id v8 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v4 postNotificationName:@"BYOD_SPINNER_CHANGE_NOTIFICATION" object:0 userInfo:v6];
}

- (void)dealloc
{
  BOOL v3 = +[BYODSpecifierProvider log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_7B7EC(v3);
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)BYODSpecifierProvider;
  [(BYODSpecifierProvider *)&v5 dealloc];
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
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_upsellManager, 0);
  objc_storeStrong((id *)&self->_domainList, 0);
  objc_storeStrong((id *)&self->_customDomainSpecifier, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end