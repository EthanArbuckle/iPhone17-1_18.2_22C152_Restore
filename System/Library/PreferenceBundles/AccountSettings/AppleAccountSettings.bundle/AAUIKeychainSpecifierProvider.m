@interface AAUIKeychainSpecifierProvider
- (AAUIKeychainSpecifierProvider)initWithAccountManager:(id)a3;
- (AAUISpecifierProviderDelegate)delegate;
- (NSArray)specifiers;
- (id)_keychainSyncStateForSpecifier:(id)a3;
- (id)_specifierForKeychainSync;
- (id)account;
- (void)_keychainSyncStateDidChange;
- (void)_refreshKeychainState;
- (void)_registerForKeychainSyncStatusChangeNotification;
- (void)_stopListeningForKeychainSyncStatusChangeNotification;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation AAUIKeychainSpecifierProvider

- (AAUIKeychainSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIKeychainSpecifierProvider;
  v6 = [(AAUIKeychainSpecifierProvider *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    v7->_keychainStatus = 0;
    v7->_keychainStatusFetchInProgress = 0;
    [(AAUIKeychainSpecifierProvider *)v7 _registerForKeychainSyncStatusChangeNotification];
  }

  return v7;
}

- (void)dealloc
{
  [(AAUIKeychainSpecifierProvider *)self _stopListeningForKeychainSyncStatusChangeNotification];
  v3.receiver = self;
  v3.super_class = (Class)AAUIKeychainSpecifierProvider;
  [(AAUIKeychainSpecifierProvider *)&v3 dealloc];
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  objc_super v3 = [v2 objectForKeyedSubscript:AIDAServiceTypeCloud];

  return v3;
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    uint64_t v4 = [(AAUIKeychainSpecifierProvider *)self _specifierForKeychainSync];
    id v5 = (void *)v4;
    if (v4)
    {
      uint64_t v9 = v4;
      v6 = +[NSArray arrayWithObjects:&v9 count:1];
      v7 = self->_specifiers;
      self->_specifiers = v6;
    }
    specifiers = self->_specifiers;
  }

  return specifiers;
}

- (id)_specifierForKeychainSync
{
  objc_super v3 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v4 = [v3 isBoolSettingLockedDownByRestrictions:MCFeatureCloudKeychainSyncAllowed];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"KEYCHAIN_SPECIFIER_NAME" value:&stru_76890 table:@"Localizable"];
    id v5 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:"_keychainSyncStateForSpecifier:" detail:objc_opt_class() cell:2 edit:0];

    uint64_t v8 = ACAccountDataclassKeychainSync;
    uint64_t v9 = +[PSSpecifier acui_iconForDataclass:ACAccountDataclassKeychainSync];
    if (v9) {
      [v5 setProperty:v9 forKey:PSIconImageKey];
    }
    [v5 setObject:v8 forKeyedSubscript:PSIDKey];
    [v5 setObject:v8 forKeyedSubscript:@"com.apple.accountsui.dataclass"];
  }

  return v5;
}

- (id)_keychainSyncStateForSpecifier:(id)a3
{
  id v5 = a3;
  unint64_t keychainStatus = self->_keychainStatus;
  switch(keychainStatus)
  {
    case 2uLL:
      v7 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v8 = v7;
      CFStringRef v9 = @"ON";
LABEL_7:
      objc_super v3 = [v7 localizedStringForKey:v9 value:&stru_76890 table:@"Localizable"];

      break;
    case 1uLL:
      v7 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v8 = v7;
      CFStringRef v9 = @"OFF";
      goto LABEL_7;
    case 0uLL:
      [(AAUIKeychainSpecifierProvider *)self _refreshKeychainState];
      objc_super v3 = 0;
      break;
  }

  return v3;
}

- (void)_refreshKeychainState
{
  if (self->_keychainStatusFetchInProgress)
  {
    v2 = _AAUILogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Keychain status fetch is alredy in progress. Bailing!", buf, 2u);
    }
  }
  else
  {
    self->_keychainStatusFetchInProgress = 1;
    unsigned __int8 v4 = dispatch_get_global_queue(-32768, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_11500;
    block[3] = &unk_756F8;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

- (void)_registerForKeychainSyncStatusChangeNotification
{
  objc_initWeak(&location, self);
  objc_super v3 = (const char *)OTTrustStatusChangeNotification;
  unsigned __int8 v4 = dispatch_get_global_queue(2, 0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1195C;
  handler[3] = &unk_75720;
  objc_copyWeak(&v12, &location);
  notify_register_dispatch(v3, &self->_keychainSyncNotificationToken, v4, handler);

  id v5 = (const char *)kSOSCCCircleChangedNotification;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1199C;
  v9[3] = &unk_75720;
  objc_copyWeak(&v10, &location);
  notify_register_dispatch(v5, &self->_keychainSyncNotificationToken, v4, v9);

  v6 = (const char *)kSOSCCViewMembershipChangedNotification;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_119DC;
  v7[3] = &unk_75720;
  objc_copyWeak(&v8, &location);
  notify_register_dispatch(v6, &self->_keychainSyncNotificationToken, v4, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_stopListeningForKeychainSyncStatusChangeNotification
{
}

- (void)_keychainSyncStateDidChange
{
  objc_super v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    int v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%@ received keychain sync state change notification.", (uint8_t *)&v6, 0xCu);
  }
  [(AAUIKeychainSpecifierProvider *)self _refreshKeychainState];
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

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end