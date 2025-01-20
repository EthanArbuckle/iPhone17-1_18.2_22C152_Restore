@interface AAUIiCloudBackupSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (AAUIiCloudBackupSpecifierProvider)initWithAccountManager:(id)a3;
- (AAUIiCloudBackupSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (ACAccount)account;
- (BOOL)_shouldShowBackupSpecifier;
- (NSArray)specifiers;
- (id)_dataclassState:(id)a3;
- (id)_iCloudBackupSpecifier;
- (id)_loadSpecifierProviderWithClassName:(id)a3 inBundle:(id)a4;
- (void)_backupSpecifierWasTapped:(id)a3;
- (void)_showBackupController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation AAUIiCloudBackupSpecifierProvider

- (AAUIiCloudBackupSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAUIiCloudBackupSpecifierProvider;
  v9 = [(AAUIiCloudBackupSpecifierProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_listController, v8);
  }

  return v10;
}

- (AAUIiCloudBackupSpecifierProvider)initWithAccountManager:(id)a3
{
  return [(AAUIiCloudBackupSpecifierProvider *)self initWithAccountManager:a3 presenter:0];
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    uint64_t v4 = [(AAUIiCloudBackupSpecifierProvider *)self _iCloudBackupSpecifier];
    v5 = (void *)v4;
    if (v4)
    {
      uint64_t v9 = v4;
      v6 = +[NSArray arrayWithObjects:&v9 count:1];
      id v7 = self->_specifiers;
      self->_specifiers = v6;
    }
    specifiers = self->_specifiers;
  }

  return specifiers;
}

- (ACAccount)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:AIDAServiceTypeCloud];

  return (ACAccount *)v3;
}

- (id)_iCloudBackupSpecifier
{
  if ([(AAUIiCloudBackupSpecifierProvider *)self _shouldShowBackupSpecifier])
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v4 = [v3 localizedStringForKey:@"ICLOUD_BACKUP_SPECIFIER_NAME" value:&stru_76890 table:@"Localizable"];
    v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:"_dataclassState:" detail:0 cell:2 edit:0];

    [v5 setControllerLoadAction:"_backupSpecifierWasTapped:"];
    [v5 setObject:@"BACKUP" forKeyedSubscript:PSIDKey];
    v6 = +[PKIconImageCache settingsIconCache];
    id v7 = [v6 imageForKey:PKiCloudBackupIconKey];

    [v5 setObject:v7 forKeyedSubscript:PSIconImageKey];
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"BACKUP_CELL_LABEL" value:&stru_76890 table:@"Localizable"];
    [v5 setName:v9];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldShowBackupSpecifier
{
  v3 = [(AAUIiCloudBackupSpecifierProvider *)self account];
  unsigned __int8 v4 = objc_msgSend(v3, "aa_isAccountClass:", AAAccountClassBasic);

  if (v4) {
    return 0;
  }
  v6 = [(AAUIiCloudBackupSpecifierProvider *)self account];
  unsigned __int8 v7 = [v6 isProvisionedForDataclass:ACAccountDataclassBackup];

  return v7;
}

- (id)_dataclassState:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned int v8 = [v7 specifierProvider:self isDataclassAvailableForSpecifier:v4];

    if (v8)
    {
      uint64_t v9 = [(AAUIiCloudBackupSpecifierProvider *)self account];
      unsigned __int8 v10 = [v9 isEnabledForDataclass:ACAccountDataclassBackup];

      if (v10)
      {
        v11 = +[NSBundle bundleForClass:objc_opt_class()];
        objc_super v12 = v11;
        CFStringRef v13 = @"ON";
        goto LABEL_9;
      }
    }
  }
  else
  {
    v14 = _AAUILogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_48480((id *)&self->_delegate, v14);
    }
  }
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v12 = v11;
  CFStringRef v13 = @"OFF";
LABEL_9:
  v15 = [v11 localizedStringForKey:v13 value:&stru_76890 table:@"Localizable"];

  return v15;
}

- (void)_backupSpecifierWasTapped:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_16784;
    v8[3] = &unk_759F0;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    [v7 validateDataclassAccessForProvider:self specifier:v9 completion:v8];

    objc_destroyWeak(&v10);
  }
  objc_destroyWeak(&location);
}

- (void)_showBackupController:(id)a3
{
  id v12 = a3;
  id v4 = objc_alloc((Class)ICQBackupController);
  v5 = [(AAUIiCloudBackupSpecifierProvider *)self account];
  id v6 = [v4 initWithAccount:v5];

  if (v6)
  {
    [v6 setSpecifier:v12];
    p_listController = &self->_listController;
    id WeakRetained = objc_loadWeakRetained((id *)p_listController);
    [v6 setParentController:WeakRetained];

    id v9 = objc_loadWeakRetained((id *)p_listController);
    id v10 = [v9 rootController];
    [v6 setRootController:v10];

    id v11 = objc_loadWeakRetained((id *)p_listController);
    [v11 showController:v6 animate:1];
  }
}

- (id)_loadSpecifierProviderWithClassName:(id)a3 inBundle:(id)a4
{
  id v6 = (NSString *)a3;
  id v7 = a4;
  unsigned int v8 = NSClassFromString(v6);
  if ([(objc_class *)v8 conformsToProtocol:&OBJC_PROTOCOL___AAUISpecifierProvider])
  {
    id v9 = [[v8 alloc] initWithAccountManager:self->_accountManager];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    [v9 setDelegate:WeakRetained];
  }
  else
  {
    id v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543874;
      v14 = self;
      __int16 v15 = 2114;
      v16 = v6;
      __int16 v17 = 2114;
      id v18 = v7;
      _os_log_error_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load %{public}@ from bundle: %{public}@", (uint8_t *)&v13, 0x20u);
    }

    id v9 = 0;
  }

  return v9;
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
  objc_destroyWeak((id *)&self->_listController);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end