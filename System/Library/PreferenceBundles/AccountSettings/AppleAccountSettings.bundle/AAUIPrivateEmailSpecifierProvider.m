@interface AAUIPrivateEmailSpecifierProvider
- (AAUIPrivateEmailSpecifierProvider)initWithAccountManager:(id)a3;
- (AAUIPrivateEmailSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (AAUISpecifierProviderDelegate)delegate;
- (BOOL)handleURL:(id)a3;
- (NSArray)specifiers;
- (UIViewController)presenter;
- (id)account;
- (void)_fetchCloudStorageSummary;
- (void)_privateEmailSpecifierWasTapped:(id)a3;
- (void)_reloadPrivateEmailSpecifier;
- (void)remoteUIRequestComplete:(id)a3 error:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation AAUIPrivateEmailSpecifierProvider

- (AAUIPrivateEmailSpecifierProvider)initWithAccountManager:(id)a3
{
  return [(AAUIPrivateEmailSpecifierProvider *)self initWithAccountManager:a3 presenter:0];
}

- (AAUIPrivateEmailSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  objc_storeStrong((id *)&self->_accountManager, a3);
  id v6 = a4;
  objc_storeWeak((id *)&self->_presenter, v6);

  [(AAUIPrivateEmailSpecifierProvider *)self _fetchCloudStorageSummary];
  return self;
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:AIDAServiceTypeCloud];

  return v3;
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    v4 = +[NSMutableArray array];
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"PRIVATE_EMAIL_ADDRESSES" value:&stru_76890 table:@"Localizable"];
    v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:1 edit:0];
    privateEmailSpecifier = self->privateEmailSpecifier;
    self->privateEmailSpecifier = v7;

    [(PSSpecifier *)self->privateEmailSpecifier setControllerLoadAction:"_privateEmailSpecifierWasTapped:"];
    [(PSSpecifier *)self->privateEmailSpecifier setIdentifier:@"PRIVATE_EMAIL_MANAGE"];
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = +[UIImage imageNamed:@"privateEmailAddressIcon.png" inBundle:v9];

    [(PSSpecifier *)self->privateEmailSpecifier setProperty:v10 forKey:PSIconImageKey];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      storageSummary = self->_storageSummary;
      if (!storageSummary)
      {

        goto LABEL_9;
      }
      v13 = [(ICQCloudStorageSummary *)storageSummary subscriptionInfo];
      unsigned __int8 v14 = [v13 isiCloudPlusSubscriber];

      if (v14) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    [v4 addObject:self->privateEmailSpecifier];
LABEL_9:
    v15 = (NSArray *)[v4 copy];
    v16 = self->_specifiers;
    self->_specifiers = v15;

    specifiers = self->_specifiers;
  }

  return specifiers;
}

- (void)_reloadPrivateEmailSpecifier
{
  id v5 = [(NSArray *)self->_specifiers copy];
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadSpecifiersForProvider:self oldSpecifiers:v5 animated:0];
}

- (void)_privateEmailSpecifierWasTapped:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained specifierProvider:self willBeginLoadingSpecifier:v5];

  v7 = +[AKURLBag bagForAltDSID:0];
  uint64_t v8 = [v7 privateEmailManageURL];

  id v9 = objc_alloc_init((Class)NSMutableURLRequest);
  v24 = (void *)v8;
  [v9 setURL:v8];
  [v9 setHTTPMethod:@"GET"];
  v10 = _AAUILogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_49BE8((uint64_t)v9, v10);
  }

  v11 = objc_alloc_init(AAUIMatterhornUpsellHook);
  id v12 = objc_alloc_init((Class)AAUIPrivateEmailUpdateCacheHook);
  v13 = [(AIDAAccountManager *)self->_accountManager accounts];
  unsigned __int8 v14 = [v13 objectForKeyedSubscript:AIDAServiceTypeCloud];

  id v15 = objc_alloc((Class)AAUIDeviceToDeviceEncryptionHook);
  v16 = objc_msgSend(v14, "aa_altDSID");
  id v17 = [v15 initWithAltDSID:v16 upgradeContext:AKSecurityUpgradeContextGeneric];

  v25[0] = v11;
  v25[1] = v12;
  v25[2] = v17;
  v18 = +[NSArray arrayWithObjects:v25 count:3];
  id v19 = objc_alloc((Class)AAUIGrandSlamRemoteUIPresenter);
  accountManager = self->_accountManager;
  id v21 = objc_loadWeakRetained((id *)&self->_presenter);
  v22 = (AAUIGrandSlamRemoteUIPresenter *)[v19 initWithAccountManager:accountManager presenter:v21 hooks:v18];
  privateEmailPresenter = self->_privateEmailPresenter;
  self->_privateEmailPresenter = v22;

  [(AAUIGrandSlamRemoteUIPresenter *)self->_privateEmailPresenter setDelegate:self];
  [(AAUIGrandSlamRemoteUIPresenter *)self->_privateEmailPresenter loadRequest:v9];
}

- (void)remoteUIRequestComplete:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = _AAUILogSystem();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_49C60((uint64_t)v5, v7);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "private email specifier provider success", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_22AB0;
  block[3] = &unk_756F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_fetchCloudStorageSummary
{
  id v3 = objc_alloc((Class)ICQCloudStorageDataController);
  v4 = [(AAUIPrivateEmailSpecifierProvider *)self account];
  id v5 = [v3 initWithAccount:v4];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_22C10;
  v6[3] = &unk_75CA0;
  v6[4] = self;
  [v5 fetchStorageSummaryWithCompletion:v6];
}

- (BOOL)handleURL:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"path"];
  unsigned int v5 = [v4 isEqualToString:@"PRIVATE_EMAIL_MANAGE"];
  if (v5) {
    [(AAUIPrivateEmailSpecifierProvider *)self _privateEmailSpecifierWasTapped:self->privateEmailSpecifier];
  }

  return v5;
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

- (UIViewController)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  return (UIViewController *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_storageSummary, 0);
  objc_storeStrong((id *)&self->privateEmailSpecifier, 0);
  objc_storeStrong((id *)&self->_privateEmailPresenter, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end