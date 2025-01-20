@interface AAUIADPSpecifierProvider
- (AAUIADPSpecifierProvider)initWithAccountManager:(id)a3;
- (AAUIADPSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (id)account;
- (void)_harvestWebAccessDataFromResponse:(id)a3;
- (void)_loadRemoteUIForADPSpecifier:(id)a3;
- (void)_walrusStateDidChange;
- (void)beginEnablementFlow:(id)a3;
- (void)dealloc;
- (void)presentAccountRecoveryFlow;
- (void)remoteUIDidDismiss:(id)a3;
- (void)remoteUIDidEndFlow:(id)a3;
- (void)remoteUIDidReceiveHTTPResponse:(id)a3;
- (void)remoteUIRequestComplete:(id)a3 error:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation AAUIADPSpecifierProvider

- (AAUIADPSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAUIADPSpecifierProvider;
  v9 = [(AAUIADPSpecifierProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_listController, v8);
  }

  return v10;
}

- (void)setDelegate:(id)a3
{
}

- (AAUIADPSpecifierProvider)initWithAccountManager:(id)a3
{
  return [(AAUIADPSpecifierProvider *)self initWithAccountManager:a3 presenter:0];
}

- (void)dealloc
{
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    self;
    v4 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "dealloc %@", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)AAUIADPSpecifierProvider;
  [(AAUIADPSpecifierProvider *)&v6 dealloc];
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:AIDAServiceTypeCloud];

  return v3;
}

- (void)beginEnablementFlow:(id)a3
{
  id v4 = a3;
  v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%@ Starting Advanced Data Protection flow.", (uint8_t *)&v8, 0xCu);
  }
  [(AAUIADPSpecifierProvider *)self _loadRemoteUIForADPSpecifier:v4];
}

- (void)presentAccountRecoveryFlow
{
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_4A29C();
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  +[AAUISettingsHelper showAccountRecoveryFromViewController:WeakRetained accountManager:self->_accountManager];
}

- (void)_walrusStateDidChange
{
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    int v5 = 138412290;
    objc_super v6 = v4;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%@: Received walrus status change notification", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_harvestWebAccessDataFromResponse:(id)a3
{
  id v4 = a3;
  int v5 = [v4 allHeaderFields];
  objc_super v6 = [v5 objectForKeyedSubscript:@"X-Apple-I-Web-Access"];

  if (v6)
  {
    id v7 = [(AAUIADPSpecifierProvider *)self account];
    int v8 = objc_msgSend(v7, "aa_altDSID");

    v9 = +[AKAccountManager sharedInstance];
    v10 = [v9 authKitAccountWithAltDSID:v8];

    [v10 setAccountProperty:v6 forKey:@"webAccessEnabled"];
    objc_initWeak(&location, self);
    v11 = [v10 accountStore];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_2F340;
    v12[3] = &unk_75C50;
    objc_copyWeak(&v13, &location);
    [v11 saveAccount:v10 withCompletionHandler:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)_loadRemoteUIForADPSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)AAUIGrandSlamRemoteUIPresenter);
  accountManager = self->_accountManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  int v8 = (AAUIGrandSlamRemoteUIPresenter *)[v5 initWithAccountManager:accountManager hookType:2 presenter:WeakRetained];
  grandSlamPresenter = self->_grandSlamPresenter;
  self->_grandSlamPresenter = v8;

  [(AAUIGrandSlamRemoteUIPresenter *)self->_grandSlamPresenter setDelegate:self];
  id v10 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v4];
  [v10 setHTTPMethod:@"GET"];
  v11 = _AAUILogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_4A3FC();
  }

  objc_copyWeak(&to, (id *)&self->_adpStateManager);
  objc_initWeak(&location, self);
  objc_super v12 = self->_grandSlamPresenter;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_2F674;
  v14[3] = &unk_75C28;
  objc_copyWeak(&v16, &to);
  objc_copyWeak(&v17, &location);
  id v13 = v10;
  id v15 = v13;
  [(AAUIGrandSlamRemoteUIPresenter *)v12 loadRequest:v13 completion:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&to);
}

- (void)remoteUIDidReceiveHTTPResponse:(id)a3
{
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_4A54C();
  }

  if ([v4 statusCode] != (char *)&stru_158.reloff + 1)
  {
    objc_super v6 = (char *)[v4 statusCode];
    if (v4)
    {
      if (v6 != (unsigned char *)&stru_108.addr + 6)
      {
        id v7 = _AAUILogSystem();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 138477827;
          id v15 = v4;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Harvesting data from response: %{private}@", (uint8_t *)&v14, 0xCu);
        }

        [(AAUIADPSpecifierProvider *)self _harvestWebAccessDataFromResponse:v4];
        int v8 = [v4 allHeaderFields];
        v9 = [v8 objectForKeyedSubscript:@"X-Apple-AK-Advanced-ICloud-Data-Protection"];

        if (v9)
        {
          id v10 = _AAUILogSystem();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v11 = (objc_class *)objc_opt_class();
            objc_super v12 = NSStringFromClass(v11);
            unsigned int v13 = [v9 BOOLValue];
            int v14 = 138412546;
            id v15 = v12;
            __int16 v16 = 1024;
            unsigned int v17 = v13;
            _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%@: ADP isEnabled: %d", (uint8_t *)&v14, 0x12u);
          }
        }
      }
    }
  }
}

- (void)remoteUIRequestComplete:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    objc_super v12 = [v6 debugDescription];
    int v13 = 138412803;
    int v14 = v11;
    __int16 v15 = 2112;
    __int16 v16 = v12;
    __int16 v17 = 2113;
    id v18 = v7;
    _os_log_debug_impl(&dword_0, v8, OS_LOG_TYPE_DEBUG, "%@: Request %@ completed with error: %{private}@", (uint8_t *)&v13, 0x20u);
  }
  if (v7)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_adpStateManager);
    [WeakRetained setNetworkError];
  }
}

- (void)remoteUIDidEndFlow:(id)a3
{
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%@: RemoteUI flow done.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)remoteUIDidDismiss:(id)a3
{
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_4A5B4();
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  id v6 = [WeakRetained navigationController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2FC28;
  v7[3] = &unk_756F8;
  v7[4] = self;
  [v6 dismissViewControllerAnimated:1 completion:v7];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_adpStateManager);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_grandSlamPresenter, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end