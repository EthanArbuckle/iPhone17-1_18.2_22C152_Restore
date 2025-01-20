@interface DAVSettingsAdvancedController
- (BOOL)isReloadingProperties;
- (DAAccount)account;
- (DAVSettingsAccountsUIController)accountController;
- (NSString)placeHolder;
- (id)accountBooleanPropertyWithSpecifier:(id)a3;
- (id)accountPropertyWithSpecifier:(id)a3;
- (id)specifiers;
- (void)setAccount:(id)a3;
- (void)setAccountBooleanProperty:(id)a3 withSpecifier:(id)a4;
- (void)setAccountController:(id)a3;
- (void)setAccountProperty:(id)a3 withSpecifier:(id)a4;
- (void)setIsReloadingProperties:(BOOL)a3;
- (void)setPlaceHolder:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation DAVSettingsAdvancedController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v6 = (id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController];
    id WeakRetained = objc_loadWeakRetained(v6);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v24 = +[NSAssertionHandler currentHandler];
      id v25 = objc_loadWeakRetained(v6);
      [v24 handleFailureInMethod:a2, self, @"DAVSettingsAdvancedController.m", 31, @"My parent is of unknown origin, is class %@", objc_opt_class() object file lineNumber description];
    }
    id v9 = objc_loadWeakRetained(v6);
    objc_storeWeak((id *)&self->_accountController, v9);

    v10 = [(DAVSettingsAdvancedController *)self specifier];
    id v11 = [v10 propertyForKey:@"DAVAdvancedControllerAccountKey"];

    id v12 = objc_loadWeakRetained((id *)&self->_account);
    if (v11 != v12) {
      objc_storeWeak((id *)&self->_account, v11);
    }
    uint64_t v13 = [(DAVSettingsAdvancedController *)self loadSpecifiersFromPlistName:@"DAVAdvancedSetup" target:self];
    v14 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v13;

    v15 = [v11 backingAccountInfo];
    v16 = [v15 mcBackingProfile];

    if (v16)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v17 = *(id *)&self->PSListController_opaque[v3];
      id v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v27;
        uint64_t v21 = PSEnabledKey;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v27 != v20) {
              objc_enumerationMutation(v17);
            }
            [*(id *)(*((void *)&v26 + 1) + 8 * i) setProperty:&__kCFBooleanFalse forKey:v21];
          }
          id v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v19);
      }
    }
    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)setAccountProperty:(id)a3 withSpecifier:(id)a4
{
  id v15 = a3;
  v6 = [a4 identifier];
  if ([v6 isEqualToString:@"PORT"])
  {
    uint64_t v7 = (int)[v15 intValue];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_account);
    [WeakRetained setPort:v7];

    if (!self->_isReloadingProperties)
    {
      self->_isReloadingProperties = 1;
      [(DAVSettingsAdvancedController *)self reloadSpecifierID:@"ACCOUNT_URL" animated:0];
      self->_isReloadingProperties = 0;
    }
  }
  else if ([v6 isEqualToString:@"ACCOUNT_URL"])
  {
    if (v15)
    {
      id v9 = +[NSURL URLWithString:](NSURL, "URLWithString:");
    }
    else
    {
      id v9 = 0;
    }
    id v10 = objc_loadWeakRetained((id *)&self->_account);
    [v10 setPrincipalURL:v9];

    id v11 = objc_loadWeakRetained((id *)&self->_account);
    [v11 setShouldDoInitialAutodiscovery:0];

    if (!self->_isReloadingProperties)
    {
      self->_isReloadingProperties = 1;
      [(DAVSettingsAdvancedController *)self reloadSpecifierID:@"PORT" animated:0];
      [(DAVSettingsAdvancedController *)self reloadSpecifierID:@"USE_SSL" animated:0];
      self->_isReloadingProperties = 0;
    }
  }
  p_accountController = &self->_accountController;
  id v13 = objc_loadWeakRetained((id *)p_accountController);
  [v13 setNeedsSave:1];

  id v14 = objc_loadWeakRetained((id *)p_accountController);
  [v14 setAttemptedValidation:0];
}

- (void)setAccountBooleanProperty:(id)a3 withSpecifier:(id)a4
{
  id v6 = a4;
  id v7 = [a3 BOOLValue];
  id v13 = [v6 identifier];

  if ([v13 isEqualToString:@"USE_SSL"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_account);
    [WeakRetained setUseSSL:v7];

    id v9 = objc_loadWeakRetained((id *)&self->_account);
    [v9 setPort:0];

    if (!self->_isReloadingProperties)
    {
      self->_isReloadingProperties = 1;
      [(DAVSettingsAdvancedController *)self reloadSpecifierID:@"PORT" animated:0];
      [(DAVSettingsAdvancedController *)self reloadSpecifierID:@"ACCOUNT_URL" animated:0];
      self->_isReloadingProperties = 0;
    }
  }
  p_accountController = &self->_accountController;
  id v11 = objc_loadWeakRetained((id *)p_accountController);
  [v11 setNeedsSave:1];

  id v12 = objc_loadWeakRetained((id *)p_accountController);
  [v12 setAttemptedValidation:0];
}

- (id)accountPropertyWithSpecifier:(id)a3
{
  v4 = [a3 identifier];
  if ([v4 isEqualToString:@"PORT"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_account);
    id v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [WeakRetained port]);
    id v7 = [v6 stringValue];
LABEL_5:

    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"ACCOUNT_URL"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_account);
    id v6 = [WeakRetained principalURL];
    v8 = objc_msgSend(v6, "da_urlByRemovingUsername");
    id v7 = [v8 absoluteString];

    goto LABEL_5;
  }
  id v7 = 0;
LABEL_7:

  return v7;
}

- (id)accountBooleanPropertyWithSpecifier:(id)a3
{
  v4 = [a3 identifier];
  if ([v4 isEqualToString:@"USE_SSL"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_account);
    id v6 = [WeakRetained useSSL];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = +[NSNumber numberWithBool:v6];

  return v7;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__table] firstResponder];
  [v5 resignFirstResponder];

  v6.receiver = self;
  v6.super_class = (Class)DAVSettingsAdvancedController;
  [(DAVSettingsAdvancedController *)&v6 viewWillDisappear:v3];
}

- (DAAccount)account
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_account);

  return (DAAccount *)WeakRetained;
}

- (void)setAccount:(id)a3
{
}

- (DAVSettingsAccountsUIController)accountController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountController);

  return (DAVSettingsAccountsUIController *)WeakRetained;
}

- (void)setAccountController:(id)a3
{
}

- (NSString)placeHolder
{
  return self->_placeHolder;
}

- (void)setPlaceHolder:(id)a3
{
}

- (BOOL)isReloadingProperties
{
  return self->_isReloadingProperties;
}

- (void)setIsReloadingProperties:(BOOL)a3
{
  self->_isReloadingProperties = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeHolder, 0);
  objc_destroyWeak((id *)&self->_accountController);

  objc_destroyWeak((id *)&self->_account);
}

@end