@interface HKHealthDataclassSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (HKHealthDataclassSpecifierProvider)initWithAccountManager:(id)a3;
- (NSArray)specifiers;
- (id)_account;
- (id)switchStateForSpecifier:(id)a3;
- (void)_persistHealthDataclassEnablementState:(BOOL)a3;
- (void)_presentHealthDatabaseObliterationAlert;
- (void)_reloadAccount;
- (void)_reloadDataclassSpecifier;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)switchStateDidChange:(id)a3 withSpecifier:(id)a4;
@end

@implementation HKHealthDataclassSpecifierProvider

- (HKHealthDataclassSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHealthDataclassSpecifierProvider;
  v6 = [(HKHealthDataclassSpecifierProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountManager, a3);
  }

  return v7;
}

- (id)_account
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
    id v4 = objc_alloc_init((Class)NSMutableArray);
    id v5 = +[_HKBehavior sharedBehavior];
    unsigned int v6 = [v5 isDeviceSupported];

    if (v6)
    {
      if (+[AAUIFeatureFlags isTobleroneEnabled])
      {
        uint64_t v7 = ACAccountDataclassHealth;
        v8 = +[PSSpecifier preferenceSpecifierNamed:ACAccountDataclassHealth target:self set:"switchStateDidChange:withSpecifier:" get:"switchStateForSpecifier:" detail:0 cell:6 edit:0];
        dataclassSpecifier = self->_dataclassSpecifier;
        self->_dataclassSpecifier = v8;

        [(PSSpecifier *)self->_dataclassSpecifier setObject:&__kCFBooleanTrue forKeyedSubscript:PSEnabledKey];
        [(PSSpecifier *)self->_dataclassSpecifier setObject:v7 forKeyedSubscript:PSIDKey];
        [(PSSpecifier *)self->_dataclassSpecifier setObject:v7 forKeyedSubscript:@"com.apple.accountsui.dataclass"];
      }
      else
      {
        uint64_t v10 = kAccountDataclassHealth;
        v11 = [(HKHealthDataclassSpecifierProvider *)self _account];
        v12 = +[PSSpecifier acui_specifierForDataclass:v10 account:v11 target:self set:"switchStateDidChange:withSpecifier:" get:"switchStateForSpecifier:"];
        v13 = self->_dataclassSpecifier;
        self->_dataclassSpecifier = v12;
      }
      [v4 addObject:self->_dataclassSpecifier];
    }
    v14 = (NSArray *)[v4 copy];
    v15 = self->_specifiers;
    self->_specifiers = v14;

    specifiers = self->_specifiers;
  }
  return specifiers;
}

- (void)switchStateDidChange:(id)a3 withSpecifier:(id)a4
{
  if ([a3 BOOLValue])
  {
    [(HKHealthDataclassSpecifierProvider *)self _persistHealthDataclassEnablementState:1];
  }
  else
  {
    id v5 = HKHealthDataclassOwnerBundle();
    unsigned int v6 = [v5 localizedStringForKey:@"DISABLE_TITLE" value:&stru_8500 table:@"Localizable"];
    uint64_t v7 = HKHealthDataclassOwnerBundle();
    v8 = [v7 localizedStringForKey:@"DISABLE_MESSAGE" value:&stru_8500 table:@"Localizable"];
    objc_super v9 = +[UIAlertController alertControllerWithTitle:v6 message:v8 preferredStyle:0];

    uint64_t v10 = HKHealthDataclassOwnerBundle();
    v11 = [v10 localizedStringForKey:@"DISABLE_CONFIRM" value:&stru_8500 table:@"Localizable"];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_5AD8;
    v18[3] = &unk_82E0;
    v18[4] = self;
    char v19 = 0;
    v12 = +[UIAlertAction actionWithTitle:v11 style:2 handler:v18];
    [v9 addAction:v12];

    v13 = HKHealthDataclassOwnerBundle();
    v14 = [v13 localizedStringForKey:@"DISABLE_CANCEL" value:&stru_8500 table:@"Localizable"];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_5B18;
    v17[3] = &unk_8308;
    v17[4] = self;
    v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:v17];
    [v9 addAction:v15];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained specifierProvider:self showViewController:v9];
  }
}

- (id)switchStateForSpecifier:(id)a3
{
  v3 = [(HKHealthDataclassSpecifierProvider *)self _account];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isEnabledForDataclass:kAccountDataclassHealth]);

  return v4;
}

- (void)_reloadDataclassSpecifier
{
  id v4 = [(HKHealthDataclassSpecifierProvider *)self switchStateForSpecifier:self->_dataclassSpecifier];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained specifierProvider:self dataclassSwitchStateDidChange:v4 withSpecifier:self->_dataclassSpecifier];
}

- (void)_persistHealthDataclassEnablementState:(BOOL)a3
{
  id v5 = [(HKHealthDataclassSpecifierProvider *)self _account];
  unsigned int v6 = [(AIDAAccountManager *)self->_accountManager accountStore];
  uint64_t v7 = dispatch_get_global_queue(2, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_5CEC;
  v10[3] = &unk_8380;
  BOOL v14 = a3;
  id v11 = v5;
  v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

- (void)_reloadAccount
{
  v3 = [(HKHealthDataclassSpecifierProvider *)self _account];
  [v3 refresh];

  [(HKHealthDataclassSpecifierProvider *)self _reloadDataclassSpecifier];
}

- (void)_presentHealthDatabaseObliterationAlert
{
  v3 = HKHealthDataclassOwnerBundle();
  id v4 = [v3 localizedStringForKey:@"OBLITERATION_TITLE" value:&stru_8500 table:@"Localizable"];

  id v5 = HKHealthDataclassOwnerBundle();
  unsigned int v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"OBLITERATION_MESSAGE"];
  uint64_t v7 = [v5 localizedStringForKey:v6 value:&stru_8500 table:@"Localizable"];

  id v8 = HKHealthDataclassOwnerBundle();
  id v9 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"OBLITERATION_KEEP_DATA"];
  uint64_t v10 = [v8 localizedStringForKey:v9 value:&stru_8500 table:@"Localizable"];

  id v11 = HKHealthDataclassOwnerBundle();
  v12 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"OBLITERATION_DELETE_DATA"];
  id v13 = [v11 localizedStringForKey:v12 value:&stru_8500 table:@"Localizable"];

  BOOL v14 = +[UIAlertController alertControllerWithTitle:v4 message:v7 preferredStyle:0];
  v15 = +[UIAlertAction actionWithTitle:v10 style:0 handler:&stru_83C0];
  [v14 addAction:v15];

  v16 = +[UIAlertAction actionWithTitle:v13 style:2 handler:&stru_83E0];
  [v14 addAction:v16];

  v17 = HKHealthDataclassOwnerBundle();
  v18 = [v17 localizedStringForKey:@"DISABLE_CANCEL" value:&stru_8500 table:@"Localizable"];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_6504;
  v21[3] = &unk_8308;
  v21[4] = self;
  char v19 = +[UIAlertAction actionWithTitle:v18 style:1 handler:v21];
  [v14 addAction:v19];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained specifierProvider:self showViewController:v14];
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
  objc_storeStrong((id *)&self->_dataclassSpecifier, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end