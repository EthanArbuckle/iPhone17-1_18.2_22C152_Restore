@interface AAUIHealthDataSpecifierProvider
- (AAUIHealthDataSpecifierProvider)initWithAccountManager:(id)a3;
- (AAUISpecifierProviderDelegate)delegate;
- (BOOL)_isHealthDataEnabled:(id)a3;
- (NSArray)specifiers;
- (id)_isHealthDataEnabledString:(id)a3;
- (id)_specifierForHealthData;
- (id)account;
- (id)healthDataIcon;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation AAUIHealthDataSpecifierProvider

- (AAUIHealthDataSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIHealthDataSpecifierProvider;
  v6 = [(AAUIHealthDataSpecifierProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountManager, a3);
  }

  return v7;
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
    uint64_t v4 = [(AAUIHealthDataSpecifierProvider *)self _specifierForHealthData];
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

- (id)_specifierForHealthData
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"HEALTH_DATA_SPECIFIER_NAME" value:&stru_76890 table:@"Localizable"];
  id v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:"_isHealthDataEnabledString:" detail:objc_opt_class() cell:2 edit:0];

  v6 = [(AAUIHealthDataSpecifierProvider *)self healthDataIcon];
  if (v6) {
    [v5 setProperty:v6 forKey:PSIconImageKey];
  }
  uint64_t v7 = ACAccountDataclassHealth;
  [v5 setObject:ACAccountDataclassHealth forKeyedSubscript:PSIDKey];
  [v5 setObject:v7 forKeyedSubscript:@"com.apple.accountsui.dataclass"];
  [v5 setObject:self->_accountManager forKeyedSubscript:@"icloudAccountManager"];

  return v5;
}

- (id)_isHealthDataEnabledString:(id)a3
{
  unsigned int v3 = [(AAUIHealthDataSpecifierProvider *)self _isHealthDataEnabled:a3];
  uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = v4;
  if (v3) {
    CFStringRef v6 = @"ON";
  }
  else {
    CFStringRef v6 = @"OFF";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_76890 table:@"Localizable"];

  return v7;
}

- (BOOL)_isHealthDataEnabled:(id)a3
{
  id v4 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
  {
    v12 = _AAUILogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_48480((id *)p_delegate, v12);
    }

    goto LABEL_7;
  }
  id v8 = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v9 = [v8 specifierProvider:self isDataclassAvailableForSpecifier:v4];

  if ((v9 & 1) == 0)
  {
LABEL_7:
    unsigned __int8 v11 = 0;
    goto LABEL_8;
  }
  v10 = [(AAUIHealthDataSpecifierProvider *)self account];
  unsigned __int8 v11 = [v10 isEnabledForDataclass:ACAccountDataclassHealth];

LABEL_8:
  return v11;
}

- (id)healthDataIcon
{
  v2 = +[PKIconImageCache settingsIconCache];
  unsigned int v3 = [v2 imageForKey:PKHealthDataIconKey];

  return v3;
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