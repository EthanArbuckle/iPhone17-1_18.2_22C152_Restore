@interface AAUICDPWebSpecifierProvider
- (AAUICDPWebSpecifierProvider)initWithAccountManager:(id)a3;
- (AAUICDPWebSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (AAUISpecifierProviderDelegate)delegate;
- (BOOL)_isWebAccessEnabled;
- (NSArray)specifiers;
- (id)_cdpWebGroupSpecifier;
- (id)_cdpWebSpecifier;
- (id)_webAccessEnabled:(id)a3;
- (id)account;
- (void)_loadRemoteUIForEnablingWebAccessState:(BOOL)a3 specifier:(id)a4;
- (void)_reloadSpecifiers;
- (void)_setWebAccessEnabled:(id)a3 specifier:(id)a4;
- (void)_showLearnMoreSheet:(id)a3;
- (void)_startObservingADPStateChangeNotification;
- (void)_startObservingNotifications;
- (void)_startObservingWebAccessChangeNotification;
- (void)_stopObservingADPStateChangeNotification;
- (void)_stopObservingNotifications;
- (void)dealloc;
- (void)remoteUIDidDismiss:(id)a3;
- (void)remoteUIDidEndFlow:(id)a3;
- (void)remoteUIDidReceiveHTTPResponse:(id)a3;
- (void)remoteUIRequestComplete:(id)a3 error:(id)a4;
- (void)setADPState:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation AAUICDPWebSpecifierProvider

- (AAUICDPWebSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAUICDPWebSpecifierProvider;
  v9 = [(AAUICDPWebSpecifierProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_listController, v8);
    v10->_isADPEnabled = 0;
    [(AAUICDPWebSpecifierProvider *)v10 _startObservingNotifications];
  }

  return v10;
}

- (void)setADPState:(BOOL)a3
{
  self->_isADPEnabled = a3;
}

- (AAUICDPWebSpecifierProvider)initWithAccountManager:(id)a3
{
  return [(AAUICDPWebSpecifierProvider *)self initWithAccountManager:a3 presenter:0];
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:AIDAServiceTypeCloud];

  return v3;
}

- (void)dealloc
{
  [(AAUICDPWebSpecifierProvider *)self _stopObservingNotifications];
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_49810(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  v11.receiver = self;
  v11.super_class = (Class)AAUICDPWebSpecifierProvider;
  [(AAUICDPWebSpecifierProvider *)&v11 dealloc];
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    uint64_t v4 = [(AAUICDPWebSpecifierProvider *)self _cdpWebGroupSpecifier];
    v10[0] = v4;
    uint64_t v5 = [(AAUICDPWebSpecifierProvider *)self _cdpWebSpecifier];
    v10[1] = v5;
    uint64_t v6 = +[NSArray arrayWithObjects:v10 count:2];
    uint64_t v7 = self->_specifiers;
    self->_specifiers = v6;

    specifiers = self->_specifiers;
  }
  uint64_t v8 = specifiers;

  return v8;
}

- (id)_cdpWebGroupSpecifier
{
  v3 = +[PSSpecifier groupSpecifierWithID:@"ICLOUD_CDP_WEB_SPECIFIER_NAME"];
  uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"ICLOUD_CDP_LEARN_MORE" value:&stru_76890 table:@"Localizable"];

  BOOL isADPEnabled = self->_isADPEnabled;
  uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v8 = v7;
  if (isADPEnabled) {
    CFStringRef v9 = @"ICLOUD_CDP_WEB_FOOTER_W_ENABLED";
  }
  else {
    CFStringRef v9 = @"ICLOUD_CDP_WEB_FOOTER_W_DISABLED";
  }
  uint64_t v10 = [v7 localizedStringForKey:v9 value:&stru_76890 table:@"Localizable"];

  objc_super v11 = +[NSString stringWithFormat:@"%@ %@", v10, v5];
  id v12 = [v11 rangeOfString:v5];
  NSUInteger v14 = v13;
  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  [v3 setObject:v16 forKeyedSubscript:PSFooterCellClassGroupKey];

  [v3 setObject:v11 forKeyedSubscript:PSFooterHyperlinkViewTitleKey];
  v22.location = (NSUInteger)v12;
  v22.length = v14;
  v17 = NSStringFromRange(v22);
  [v3 setObject:v17 forKeyedSubscript:PSFooterHyperlinkViewLinkRangeKey];

  v18 = +[NSValue valueWithNonretainedObject:self];
  [v3 setObject:v18 forKeyedSubscript:PSFooterHyperlinkViewTargetKey];

  v19 = NSStringFromSelector("_showLearnMoreSheet:");
  [v3 setObject:v19 forKeyedSubscript:PSFooterHyperlinkViewActionKey];

  return v3;
}

- (id)_cdpWebSpecifier
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"ICLOUD_CDP_WEB_SPECIFIER_NAME" value:&stru_76890 table:@"Localizable"];
  uint64_t v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"_setWebAccessEnabled:specifier:" get:"_webAccessEnabled:" detail:0 cell:6 edit:0];

  [v5 setIdentifier:@"ICLOUD_CDP_WEB_SPECIFIER_NAME"];
  [v5 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  [v5 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];

  return v5;
}

- (void)_showLearnMoreSheet:(id)a3
{
  uint64_t v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    objc_super v11 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%@: Showing learn more sheet", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v5 = +[AKURLBag sharedBag];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = +[UIApplication sharedApplication];
    uint64_t v8 = +[AKURLBag sharedBag];
    CFStringRef v9 = [v8 webAccessKBURL];

    if ([v7 canOpenURL:v9]) {
      [v7 openURL:v9 withCompletionHandler:0];
    }
  }
}

- (id)_webAccessEnabled:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(AAUICDPWebSpecifierProvider *)self _isWebAccessEnabled];
  char v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "CDP web access state: %d", (uint8_t *)v11, 8u);
  }

  uint64_t v7 = (char *)[v4 cellType];
  if (v7 == (unsigned char *)&dword_4 + 2) {
    unsigned int v8 = v5;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 == 1)
  {
    CFStringRef v9 = +[NSNumber numberWithBool:1];
  }
  else
  {
    CFStringRef v9 = &off_79D88;
  }

  return v9;
}

- (void)_setWebAccessEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (char *)[v7 cellType];
  CFStringRef v9 = _AAUILogSystem();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8 == (unsigned char *)&dword_4 + 2)
  {
    if (v10)
    {
      objc_super v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      int v13 = 138412546;
      NSUInteger v14 = v12;
      __int16 v15 = 1024;
      unsigned int v16 = [v6 BOOLValue];
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%@ Starting CDP web access setup with value: %d", (uint8_t *)&v13, 0x12u);
    }
    -[AAUICDPWebSpecifierProvider _loadRemoteUIForEnablingWebAccessState:specifier:](self, "_loadRemoteUIForEnablingWebAccessState:specifier:", [v6 BOOLValue], v7);
  }
  else
  {
    if (v10)
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "CDP web access specifier type mismatch.", (uint8_t *)&v13, 2u);
    }
  }
}

- (void)_startObservingNotifications
{
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_49848(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  [(AAUICDPWebSpecifierProvider *)self _startObservingADPStateChangeNotification];
  [(AAUICDPWebSpecifierProvider *)self _startObservingWebAccessChangeNotification];
}

- (void)_stopObservingNotifications
{
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_49880(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  [(AAUICDPWebSpecifierProvider *)self _stopObservingADPStateChangeNotification];
  objc_super v11 = +[NSNotificationCenter defaultCenter];
  [v11 removeObserver:@"AAUIWebAccessChangeNotification"];
}

- (void)_startObservingADPStateChangeNotification
{
  if (!self->_ADPStateChangeNotificationObserver)
  {
    objc_initWeak(&location, self);
    v3 = +[NSNotificationCenter defaultCenter];
    uint64_t v4 = +[NSOperationQueue mainQueue];
    uint64_t v5 = [v3 addObserverForName:CDPWalrusStateChangeNotification object:0 queue:v4 usingBlock:&stru_75BD8];
    id ADPStateChangeNotificationObserver = self->_ADPStateChangeNotificationObserver;
    self->_id ADPStateChangeNotificationObserver = v5;

    objc_destroyWeak(&location);
  }
}

- (void)_stopObservingADPStateChangeNotification
{
  id v5 = self->_ADPStateChangeNotificationObserver;
  if (v5)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:v5];
  }
  id ADPStateChangeNotificationObserver = self->_ADPStateChangeNotificationObserver;
  self->_id ADPStateChangeNotificationObserver = 0;
}

- (void)_reloadSpecifiers
{
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_212BC;
  block[3] = &unk_75610;
  objc_copyWeak(&v4, &location);
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (BOOL)_isWebAccessEnabled
{
  v2 = [(AAUICDPWebSpecifierProvider *)self account];
  v3 = objc_msgSend(v2, "aa_altDSID");

  id v4 = +[AKAccountManager sharedInstance];
  id v5 = [v4 authKitAccountWithAltDSID:v3];

  uint64_t v6 = [v5 accountPropertyForKey:@"webAccessEnabled"];
  uint64_t v7 = v6;
  if (v6) {
    unsigned __int8 v8 = [v6 BOOLValue];
  }
  else {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)_startObservingWebAccessChangeNotification
{
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_498F8((uint64_t)self, v3);
  }

  objc_initWeak(&location, self);
  id v4 = +[NSNotificationCenter defaultCenter];
  id v5 = +[NSOperationQueue mainQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_21634;
  v7[3] = &unk_75640;
  objc_copyWeak(&v8, &location);
  id v6 = [v4 addObserverForName:@"AAUIWebAccessChangeNotification" object:0 queue:v5 usingBlock:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_loadRemoteUIForEnablingWebAccessState:(BOOL)a3 specifier:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  objc_msgSend(v6, "aaui_startSpinner");
  uint64_t v7 = +[AKURLBag bagForAltDSID:0];
  id v8 = v7;
  if (a3) {
    [v7 webAccessEnableURL];
  }
  else {
  uint64_t v9 = [v7 webAccessDisableURL];
  }
  if (v9)
  {
    id v10 = objc_alloc((Class)AAUIGrandSlamRemoteUIPresenter);
    accountManager = self->_accountManager;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    int v13 = objc_opt_new();
    v27 = v13;
    NSUInteger v14 = +[NSArray arrayWithObjects:&v27 count:1];
    __int16 v15 = (AAUIGrandSlamRemoteUIPresenter *)[v10 initWithAccountManager:accountManager presenter:WeakRetained hooks:v14];
    grandSlamPresenter = self->_grandSlamPresenter;
    self->_grandSlamPresenter = v15;

    [(AAUIGrandSlamRemoteUIPresenter *)self->_grandSlamPresenter setDelegate:self];
    id v17 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v9];
    [v17 setHTTPMethod:@"GET"];
    v18 = _AAUILogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_49A20();
    }

    objc_initWeak(&location, v6);
    objc_initWeak(&from, self);
    v19 = self->_grandSlamPresenter;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_21954;
    v21[3] = &unk_75C28;
    objc_copyWeak(&v23, &location);
    objc_copyWeak(&v24, &from);
    v20 = v17;
    NSRange v22 = v20;
    [(AAUIGrandSlamRemoteUIPresenter *)v19 loadRequest:v20 completion:v21];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    v20 = _AAUILogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_4998C((uint64_t)self, v20);
    }
  }
}

- (void)remoteUIDidReceiveHTTPResponse:(id)a3
{
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_49B7C();
  }

  if ([v4 statusCode] != (char *)&stru_158.reloff + 1)
  {
    id v6 = (char *)[v4 statusCode];
    if (v4)
    {
      if (v6 != (unsigned char *)&stru_108.addr + 6)
      {
        uint64_t v7 = _AAUILogSystem();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          id v18 = v4;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Harvesting data from response: %{private}@", buf, 0xCu);
        }

        id v8 = [v4 allHeaderFields];
        uint64_t v9 = [v8 objectForKeyedSubscript:@"X-Apple-I-Web-Access"];

        if (v9)
        {
          id v10 = [(AAUICDPWebSpecifierProvider *)self account];
          objc_super v11 = objc_msgSend(v10, "aa_altDSID");

          id v12 = +[AKAccountManager sharedInstance];
          int v13 = [v12 authKitAccountWithAltDSID:v11];

          [v13 setAccountProperty:v9 forKey:@"webAccessEnabled"];
          objc_initWeak((id *)buf, self);
          NSUInteger v14 = [v13 accountStore];
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_21CF8;
          v15[3] = &unk_75C50;
          objc_copyWeak(&v16, (id *)buf);
          [v14 saveAccount:v13 withCompletionHandler:v15];

          objc_destroyWeak(&v16);
          objc_destroyWeak((id *)buf);
        }
      }
    }
  }
}

- (void)remoteUIRequestComplete:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    objc_super v11 = [v6 debugDescription];
    *(_DWORD *)buf = 138412803;
    id v17 = v10;
    __int16 v18 = 2112;
    v19 = v11;
    __int16 v20 = 2113;
    id v21 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%@: Request %@ completed with error: %{private}@", buf, 0x20u);
  }
  if (v7)
  {
    objc_initWeak((id *)buf, self);
    objc_copyWeak(&to, (id *)&self->_listController);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_21FE0;
    v12[3] = &unk_75C78;
    objc_copyWeak(&v13, (id *)buf);
    objc_copyWeak(&v14, &to);
    v12[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&to);
    objc_destroyWeak((id *)buf);
  }
}

- (void)remoteUIDidEndFlow:(id)a3
{
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%@: RemoteUI flow done.", (uint8_t *)&v7, 0xCu);
  }
  [(AAUICDPWebSpecifierProvider *)self _reloadSpecifiers];
}

- (void)remoteUIDidDismiss:(id)a3
{
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%@: RemoteUI dimiss flow.", (uint8_t *)&v7, 0xCu);
  }
  [(AAUICDPWebSpecifierProvider *)self _reloadSpecifiers];
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
  objc_storeStrong(&self->_ADPStateChangeNotificationObserver, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_grandSlamPresenter, 0);
  objc_storeStrong((id *)&self->_idmsAccount, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end