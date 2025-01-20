@interface AAUIDataclassViewController
- (AAUIDataclassViewController)init;
- (AIDAAccountManager)accountManager;
- (BOOL)_isDataclassAvailableForSpecifier:(id)a3;
- (BOOL)_shouldContinueDataclassChangeForSpecifier:(id)a3;
- (BOOL)specifierProvider:(id)a3 isDataclassAvailableForSpecifier:(id)a4;
- (PSSpecifier)activeSpecifier;
- (id)account;
- (id)dataclassSwitchStateForSpecifier:(id)a3;
- (id)loadSpecifierProviderWithClassName:(id)a3 inBundle:(id)a4;
- (id)specifierProvider:(id)a3 dataclassSwitchStateForSpecifier:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (void)_dataclassSwitchStateDidChange:(id)a3 forSpecifier:(id)a4;
- (void)_startObservingAccountStoreChanges;
- (void)_startObservingRestrictionChanges;
- (void)_stopObservingAccountStoreChanges;
- (void)_stopObservingRestrictionChanges;
- (void)_superDataclassSwitchStateDidChange:(id)a3 withSpecifier:(id)a4;
- (void)_validateDataclassAccessForSpecifier:(id)a3 completion:(id)a4;
- (void)accountDidChangeFromAccount:(id)a3 toAccount:(id)a4;
- (void)cleanupDataclassSpecifiers;
- (void)dealloc;
- (void)insertSpecifier:(id)a3 afterSpecifierNamed:(id)a4 animated:(BOOL)a5;
- (void)operationsHelper:(id)a3 didLoadSaveActions:(id)a4 forDataclass:(id)a5 withAccount:(id)a6 error:(id)a7;
- (void)operationsHelper:(id)a3 didSaveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6;
- (void)operationsHelper:(id)a3 willSaveAccount:(id)a4;
- (void)reloadSpecifierForProvider:(id)a3 identifier:(id)a4;
- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5;
- (void)setAccountManager:(id)a3;
- (void)setActiveSpecifier:(id)a3;
- (void)specifierProvider:(id)a3 dataclassSwitchStateDidChange:(id)a4 withSpecifier:(id)a5;
- (void)specifierProvider:(id)a3 didFinishLoadingSpecifier:(id)a4;
- (void)specifierProvider:(id)a3 showViewController:(id)a4;
- (void)specifierProvider:(id)a3 willBeginLoadingSpecifier:(id)a4;
- (void)startSpinnerInSpecifier:(id)a3;
- (void)stopSpinnerInActiveSpecifier;
- (void)validateDataclassAccessForProvider:(id)a3 specifier:(id)a4 completion:(id)a5;
@end

@implementation AAUIDataclassViewController

- (AAUIDataclassViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)AAUIDataclassViewController;
  v2 = [(AAUIDataclassViewController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(AAUIDataclassViewController *)v2 setShouldShowDeleteAccountButton:0];
    [(AAUIDataclassViewController *)v3 setShouldEnableDeleteAccountButton:0];
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appleaccountsettings.accountwork", v4);
    accountWorkQueue = v3->_accountWorkQueue;
    v3->_accountWorkQueue = (OS_dispatch_queue *)v5;
  }
  return v3;
}

- (AIDAAccountManager)accountManager
{
  accountManager = self->_accountManager;
  if (!accountManager)
  {
    v4 = [(AAUIDataclassViewController *)self specifier];

    if (v4)
    {
      dispatch_queue_t v5 = [(AAUIDataclassViewController *)self specifier];
      v6 = [v5 objectForKeyedSubscript:@"icloudAccountManager"];

      v7 = _AAUILogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v6;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "specifierAccountManager %@", buf, 0xCu);
      }

      if (v6) {
        [(AAUIDataclassViewController *)self setAccountManager:v6];
      }
    }
    accountManager = self->_accountManager;
    if (!accountManager)
    {
      objc_super v8 = _AAUILogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_49654(v8);
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1CE84;
      block[3] = &unk_756F8;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      accountManager = self->_accountManager;
    }
  }

  return accountManager;
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
  id v5 = a3;
  v6 = [AAUIDataclassValidationController alloc];
  v7 = [(AAUIDataclassViewController *)self account];
  objc_super v8 = [(AAUIDataclassValidationController *)v6 initWithAccount:v7 presentingViewController:self];
  dataclassValidationController = self->_dataclassValidationController;
  self->_dataclassValidationController = v8;

  [(AAUIDataclassValidationController *)self->_dataclassValidationController setDelegate:self];
  [(AAUIDataclassViewController *)self _startObservingAccountStoreChanges];

  [(AAUIDataclassViewController *)self _startObservingRestrictionChanges];
}

- (id)account
{
  v2 = [(AAUIDataclassViewController *)self accountManager];
  v3 = [v2 accounts];
  v4 = [v3 objectForKeyedSubscript:AIDAServiceTypeCloud];

  return v4;
}

- (void)dealloc
{
  [(AAUIDataclassViewController *)self _stopObservingRestrictionChanges];
  [(AAUIDataclassViewController *)self _stopObservingAccountStoreChanges];
  v3.receiver = self;
  v3.super_class = (Class)AAUIDataclassViewController;
  [(AAUIDataclassViewController *)&v3 dealloc];
}

- (void)cleanupDataclassSpecifiers
{
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v3 = 0;
  }
}

- (void)startSpinnerInSpecifier:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    p_activeSpecifier = &self->_activeSpecifier;
    if (!*p_activeSpecifier)
    {
      if (objc_msgSend(v5, "aaui_startSpinner")) {
        objc_storeStrong((id *)p_activeSpecifier, a3);
      }
    }
  }

  _objc_release_x1();
}

- (void)stopSpinnerInActiveSpecifier
{
  activeSpecifier = self->_activeSpecifier;
  if (activeSpecifier)
  {
    [(PSSpecifier *)activeSpecifier aaui_stopSpinner];
    v4 = self->_activeSpecifier;
    self->_activeSpecifier = 0;
  }
}

- (void)specifierProvider:(id)a3 showViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  objc_super v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "showViewController for provider %@", (uint8_t *)&v9, 0xCu);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    [(AAUIDataclassViewController *)self presentViewController:v7 animated:1 completion:0];
  }
  else {
    [(AAUIDataclassViewController *)self showViewController:v7 sender:v6];
  }
}

- (void)specifierProvider:(id)a3 willBeginLoadingSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  objc_super v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "willBeginLoadingSpecifier for provider %@", (uint8_t *)&v10, 0xCu);
  }

  if (self->_activeSpecifier)
  {
    int v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_49698((uint64_t)v6, v9);
    }
  }
  else
  {
    [(AAUIDataclassViewController *)self startSpinnerInSpecifier:v7];
  }
}

- (void)specifierProvider:(id)a3 didFinishLoadingSpecifier:(id)a4
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "didFinishLoadingSpecifier for provider %@", (uint8_t *)&v8, 0xCu);
  }

  if (self->_activeSpecifier)
  {
    [(AAUIDataclassViewController *)self stopSpinnerInActiveSpecifier];
  }
  else
  {
    id v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_49710((uint64_t)v5, v7);
    }
  }
}

- (void)insertSpecifier:(id)a3 afterSpecifierNamed:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v9 = _AAUILogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [(AAUIDataclassViewController *)self specifierForID:v8];
    int v16 = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Inserting new specifier %@ after %@", (uint8_t *)&v16, 0x16u);
  }
  if ([*(id *)&self->ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers] containsObject:v7])
  {
    id v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v12 = "Did not insert new specifier because it's already present";
      v13 = v11;
      uint32_t v14 = 2;
LABEL_8:
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, v14);
    }
  }
  else
  {
    v15 = [(AAUIDataclassViewController *)self specifierForID:v8];
    [(AAUIDataclassViewController *)self insertSpecifier:v7 afterSpecifier:v15 animated:1];

    id v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v7;
      v12 = "Inserted new specifier %@";
      v13 = v11;
      uint32_t v14 = 12;
      goto LABEL_8;
    }
  }
}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  int v10 = _AAUILogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v8;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Reloading specifiers for provider %@", (uint8_t *)&v12, 0xCu);
  }

  if ([v9 count])
  {
    id v11 = [v8 specifiers];
    [(AAUIDataclassViewController *)self replaceContiguousSpecifiers:v9 withSpecifiers:v11 animated:v5];
  }
  else
  {
    [(AAUIDataclassViewController *)self reloadSpecifiers];
  }
}

- (void)reloadSpecifierForProvider:(id)a3 identifier:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Reloading specifier with ID: %@", (uint8_t *)&v7, 0xCu);
  }

  [(AAUIDataclassViewController *)self reloadSpecifierID:v5];
}

- (void)specifierProvider:(id)a3 dataclassSwitchStateDidChange:(id)a4 withSpecifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(AAUIDataclassViewController *)self _dataclassSwitchStateDidChange:v8 forSpecifier:v7];
}

- (void)validateDataclassAccessForProvider:(id)a3 specifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _AAUILogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "validateDataclassAccessForProvider. provider: %@, specifier: %@", (uint8_t *)&v12, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(AAUIDataclassViewController *)self _validateDataclassAccessForSpecifier:v9 completion:v10];
}

- (BOOL)specifierProvider:(id)a3 isDataclassAvailableForSpecifier:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  LOBYTE(self) = [(AAUIDataclassViewController *)self _isDataclassAvailableForSpecifier:v5];

  return (char)self;
}

- (id)specifierProvider:(id)a3 dataclassSwitchStateForSpecifier:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if ([(AAUIDataclassViewController *)self _isDataclassAvailableForSpecifier:v5])
  {
    id v6 = objc_msgSend(v5, "acui_dataclass");
    id v7 = [(AAUIDataclassViewController *)self account];
    id v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 isEnabledForDataclass:v6]);
  }
  else
  {
    id v8 = &__kCFBooleanFalse;
  }

  return v8;
}

- (id)dataclassSwitchStateForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "acui_dataclass");
  if ([(AAUIDataclassValidationController *)self->_dataclassValidationController isDataclassAvailable:v5])
  {
    v8.receiver = self;
    v8.super_class = (Class)AAUIDataclassViewController;
    id v6 = [(AAUIDataclassViewController *)&v8 dataclassSwitchStateForSpecifier:v4];
  }
  else
  {
    id v6 = &__kCFBooleanFalse;
  }

  return v6;
}

- (void)_dataclassSwitchStateDidChange:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 BOOLValue]
    && ![(AAUIDataclassViewController *)self _shouldContinueDataclassChangeForSpecifier:v7])
  {
    [(AAUIDataclassViewController *)self reloadSpecifier:v7];
  }
  else
  {
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1DD2C;
    v8[3] = &unk_75B08;
    objc_copyWeak(&v11, &location);
    id v9 = v6;
    id v10 = v7;
    [(AAUIDataclassViewController *)self _validateDataclassAccessForSpecifier:v10 completion:v8];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (BOOL)_shouldContinueDataclassChangeForSpecifier:(id)a3
{
  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  v21 = sub_1DF64;
  v22 = &unk_75108;
  v23 = self;
  id v4 = a3;
  id v24 = v4;
  id v5 = objc_retainBlock(&v19);
  id v6 = objc_msgSend(v4, "acui_dataclass", v19, v20, v21, v22, v23);
  if ([v6 isEqualToString:ACAccountDataclassMail])
  {
    id v7 = [(AAUIDataclassViewController *)self account];
    unsigned int v8 = objc_msgSend(v7, "aa_needsEmailConfiguration");
  }
  else
  {
    unsigned int v8 = 0;
  }

  id v9 = objc_msgSend(v4, "acui_dataclass");
  if ([v9 isEqualToString:ACAccountDataclassNotes])
  {
    id v10 = [(AAUIDataclassViewController *)self account];
    if (objc_msgSend(v10, "aa_isPrimaryAccount"))
    {
      unsigned int v11 = 0;
    }
    else
    {
      int v12 = [(AAUIDataclassViewController *)self account];
      unsigned int v11 = objc_msgSend(v12, "aa_needsEmailConfiguration");
    }
  }
  else
  {
    unsigned int v11 = 0;
  }

  int v13 = v8 | v11;
  if (v13 == 1)
  {
    __int16 v14 = [AAUIMailConfigController alloc];
    id v15 = [(AAUIDataclassViewController *)self account];
    int v16 = [(AAUIMailConfigController *)v14 initWithAccount:v15 presenter:self];
    mailConfigController = self->_mailConfigController;
    self->_mailConfigController = v16;

    [(AAUIMailConfigController *)self->_mailConfigController presentCreateFreeEmailPromptWithCompletion:v5 isForNotes:v8 ^ 1];
  }

  return v13 ^ 1;
}

- (void)_validateDataclassAccessForSpecifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (self->_activeSpecifier)
  {
    [(AAUIDataclassViewController *)self reloadSpecifier:v6];
    v7[2](v7, 0);
  }
  else
  {
    [(AAUIDataclassViewController *)self startSpinnerInSpecifier:v6];
    objc_initWeak(&location, self);
    unsigned int v8 = objc_msgSend(v6, "acui_dataclass");
    dataclassValidationController = self->_dataclassValidationController;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1E190;
    v10[3] = &unk_75B58;
    objc_copyWeak(&v13, &location);
    id v11 = v6;
    int v12 = v7;
    [(AAUIDataclassValidationController *)dataclassValidationController validateAccessForDataclass:v8 completion:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)_superDataclassSwitchStateDidChange:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if ([v6 BOOLValue]) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    id v10 = [v7 name];
    *(_DWORD *)buf = 138412546;
    CFStringRef v13 = v9;
    __int16 v14 = 2112;
    id v15 = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Dataclass switch state changed to %@: %@", buf, 0x16u);
  }
  v11.receiver = self;
  v11.super_class = (Class)AAUIDataclassViewController;
  [(AAUIDataclassViewController *)&v11 dataclassSwitchStateDidChange:v6 withSpecifier:v7];
}

- (BOOL)_isDataclassAvailableForSpecifier:(id)a3
{
  id v4 = objc_msgSend(a3, "acui_dataclass");
  LOBYTE(self) = [(AAUIDataclassValidationController *)self->_dataclassValidationController isDataclassAvailable:v4];

  return (char)self;
}

- (id)loadSpecifierProviderWithClassName:(id)a3 inBundle:(id)a4
{
  id v6 = (NSString *)a3;
  id v7 = a4;
  unsigned int v8 = NSClassFromString(v6);
  if ([(objc_class *)v8 conformsToProtocol:&OBJC_PROTOCOL___AAUISpecifierProvider])
  {
    id v9 = [v8 alloc];
    id v10 = [(AAUIDataclassViewController *)self accountManager];
    id v11 = [v9 initWithAccountManager:v10];

    [v11 setDelegate:self];
  }
  else
  {
    int v12 = _AAUILogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_49788((uint64_t)v6, (uint64_t)v7, v12);
    }

    id v11 = 0;
  }

  return v11;
}

- (void)operationsHelper:(id)a3 willSaveAccount:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)AAUIDataclassViewController;
  [(AAUIDataclassViewController *)&v4 operationsHelper:a3 willSaveAccount:a4];
}

- (void)operationsHelper:(id)a3 didSaveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  CFStringRef v13 = _AAUILogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v14 = @"NO";
    if (v7) {
      CFStringRef v14 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v24 = v14;
    __int16 v25 = 2112;
    id v26 = v12;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Operations helper did save account with success? %@, error: %@", buf, 0x16u);
  }

  if (v12)
  {
    id v15 = [v11 enabledDataclasses];
    id v16 = [v15 mutableCopy];

    id v17 = [(AAUIDataclassViewController *)self accountStore];
    __int16 v18 = [v17 enabledDataclassesForAccount:v11];

    [v16 minusSet:v18];
    accountSaveErrorHandler = self->_accountSaveErrorHandler;
    if (!accountSaveErrorHandler)
    {
      uint64_t v20 = [[AAUIAccountSaveErrorHandler alloc] initWithPresenter:self];
      v21 = self->_accountSaveErrorHandler;
      self->_accountSaveErrorHandler = v20;

      accountSaveErrorHandler = self->_accountSaveErrorHandler;
    }
    [(AAUIAccountSaveErrorHandler *)accountSaveErrorHandler handleAccountSaveError:v12 forAccount:v11 failedDataclasses:v16];
  }
  v22.receiver = self;
  v22.super_class = (Class)AAUIDataclassViewController;
  [(AAUIDataclassViewController *)&v22 operationsHelper:v10 didSaveAccount:v11 withSuccess:v7 error:v12];
}

- (void)operationsHelper:(id)a3 didLoadSaveActions:(id)a4 forDataclass:(id)a5 withAccount:(id)a6 error:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = _AAUILogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138413058;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v13;
    __int16 v26 = 2112;
    id v27 = v14;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Operations helper did load save actions: %@ forDataclass: %@ withAccount: %@ error: %@", (uint8_t *)&v20, 0x2Au);
  }

  if (v14)
  {
    id v16 = +[NSSet setWithObject:v12];
    accountSaveErrorHandler = self->_accountSaveErrorHandler;
    if (!accountSaveErrorHandler)
    {
      __int16 v18 = [[AAUIAccountSaveErrorHandler alloc] initWithPresenter:self];
      v19 = self->_accountSaveErrorHandler;
      self->_accountSaveErrorHandler = v18;

      accountSaveErrorHandler = self->_accountSaveErrorHandler;
    }
    [(AAUIAccountSaveErrorHandler *)accountSaveErrorHandler handleAccountSaveError:v14 forAccount:v13 failedDataclasses:v16];
  }
}

- (void)_startObservingAccountStoreChanges
{
  objc_initWeak(&location, self);
  objc_super v3 = [(AAUIDataclassViewController *)self accountManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1E95C;
  v4[3] = &unk_75B80;
  objc_copyWeak(&v5, &location);
  [v3 addAccountChangeObserver:self handler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_stopObservingAccountStoreChanges
{
  accountManager = self->_accountManager;
  if (accountManager) {
    [(AIDAAccountManager *)accountManager removeAccountChangeObserver:self];
  }
}

- (void)accountDidChangeFromAccount:(id)a3 toAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = (id)objc_opt_class();
    id v9 = v18;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%@: account did change.", buf, 0xCu);
  }
  accountWorkQueue = self->_accountWorkQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1EB9C;
  block[3] = &unk_75520;
  id v14 = v6;
  id v15 = v7;
  id v16 = self;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(accountWorkQueue, block);
}

- (void)_startObservingRestrictionChanges
{
  if (!self->_restrictionChangeNotificationObserver)
  {
    objc_initWeak(&location, self);
    objc_super v3 = +[NSNotificationCenter defaultCenter];
    objc_super v4 = +[NSOperationQueue mainQueue];
    uint64_t v5 = MCRestrictionChangedNotification;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1EF64;
    v8[3] = &unk_75640;
    objc_copyWeak(&v9, &location);
    id v6 = [v3 addObserverForName:v5 object:0 queue:v4 usingBlock:v8];
    id restrictionChangeNotificationObserver = self->_restrictionChangeNotificationObserver;
    self->_id restrictionChangeNotificationObserver = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_stopObservingRestrictionChanges
{
  if (self->_restrictionChangeNotificationObserver)
  {
    objc_super v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_restrictionChangeNotificationObserver];

    id restrictionChangeNotificationObserver = self->_restrictionChangeNotificationObserver;
    self->_id restrictionChangeNotificationObserver = 0;
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(AAUIDataclassViewController *)self activeSpecifier];

  if (v6) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }

  return v7;
}

- (PSSpecifier)activeSpecifier
{
  return self->_activeSpecifier;
}

- (void)setActiveSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSpecifier, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_mailConfigController, 0);
  objc_storeStrong((id *)&self->_dataclassValidationController, 0);
  objc_storeStrong((id *)&self->_accountSaveErrorHandler, 0);
  objc_storeStrong((id *)&self->_accountWorkQueue, 0);

  objc_storeStrong(&self->_restrictionChangeNotificationObserver, 0);
}

@end