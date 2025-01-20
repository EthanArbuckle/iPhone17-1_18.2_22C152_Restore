@interface ESSettingsAccountsUIController
- (BOOL)accountNeedsAdd;
- (BOOL)attemptedValidation;
- (BOOL)confirmedUnvalidatedAccount;
- (BOOL)didSetFullHostURL;
- (BOOL)dismissesAfterInitialSetup;
- (BOOL)haveEnoughValues;
- (BOOL)haveRegisteredForAccountsChanged;
- (BOOL)isRunningFromMobileMailApp;
- (BOOL)isSettingUpNewAccount;
- (BOOL)needsSave;
- (BOOL)transitioningToFinishedAccountSetup;
- (BOOL)transitionsAfterInitialSetup;
- (BOOL)validateAccount;
- (BOOL)validatedSuccessfully;
- (DAAccount)account;
- (id)_defaultAccountDescription;
- (id)accountBooleanPropertyWithSpecifier:(id)a3;
- (id)accountFromSpecifier;
- (id)accountPropertyWithSpecifier:(id)a3;
- (id)accountSpecifiers;
- (id)currentlyEditingCell;
- (id)daAccountWithBackingAccountInfo:(id)a3;
- (id)lastGroupSpecifierInSpecifiers:(id)a3;
- (id)localizedAccountSetupTitleString;
- (id)localizedAccountTitleString;
- (id)localizedConfirmSaveUnvalidatedAccountMessageString;
- (id)localizedValidationFailureTitleString;
- (id)newDefaultAccount;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int)indexOfCurrentlyEditingCell;
- (void)_beginAccountValidation;
- (void)_confirmSaveUnvalidatedAccount;
- (void)_deleteAccount;
- (void)_dismissAndUpdateParent;
- (void)_finishSaveAccountDismissWhenDone:(BOOL)a3;
- (void)_saveAccountDismissWhenDone:(BOOL)a3;
- (void)account:(id)a3 isValid:(BOOL)a4 validationError:(id)a5;
- (void)cancelButtonTapped:(id)a3;
- (void)dealloc;
- (void)deleteAccountButtonTapped;
- (void)didConfirmSaveUnvalidatedAccount:(BOOL)a3;
- (void)didConfirmTryWithoutSSL:(BOOL)a3;
- (void)doneButtonTapped:(id)a3;
- (void)finishedAccountSetup;
- (void)hideProgressWithPrompt:(id)a3;
- (void)operationsHelper:(id)a3 didRemoveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6;
- (void)operationsHelper:(id)a3 didSaveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6;
- (void)propertyValueChanged:(id)a3;
- (void)reloadAccount;
- (void)setAccount:(id)a3;
- (void)setAccountBooleanProperty:(id)a3 withSpecifier:(id)a4;
- (void)setAccountNeedsAdd:(BOOL)a3;
- (void)setAccountProperty:(id)a3 withSpecifier:(id)a4;
- (void)setAttemptedValidation:(BOOL)a3;
- (void)setConfirmedUnvalidatedAccount:(BOOL)a3;
- (void)setDidSetFullHostURL:(BOOL)a3;
- (void)setHaveRegisteredForAccountsChanged:(BOOL)a3;
- (void)setHostString:(id)a3;
- (void)setIsSettingUpNewAccount:(BOOL)a3;
- (void)setNeedsSave:(BOOL)a3;
- (void)setNeedsSaveAndValidation:(BOOL)a3;
- (void)setTransitioningToFinishedAccountSetup:(BOOL)a3;
- (void)setValidatedSuccessfully:(BOOL)a3;
- (void)showAlertWithButtons:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6;
- (void)showCanSaveAccountFailureView;
- (void)showIdenticalAccountFailureView;
- (void)showSSLFailureView;
- (void)updateDoneButton;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ESSettingsAccountsUIController

- (DAAccount)account
{
  if (!self->_account)
  {
    v3 = [(ESSettingsAccountsUIController *)self accountFromSpecifier];
    account = self->_account;
    self->_account = v3;

    if (self->_account)
    {
      [(ESSettingsAccountsUIController *)self setAttemptedValidation:1];
      [(ESSettingsAccountsUIController *)self setValidatedSuccessfully:1];
    }
    else
    {
      [(ESSettingsAccountsUIController *)self setIsSettingUpNewAccount:1];
      [(ESSettingsAccountsUIController *)self setAccountNeedsAdd:1];
      v5 = [(ESSettingsAccountsUIController *)self newDefaultAccount];
      v6 = self->_account;
      self->_account = v5;

      v7 = DALoggingwithCategory();
      os_log_type_t v8 = _CPLog_to_os_log_type[4];
      if (os_log_type_enabled(v7, v8))
      {
        v9 = [(DAAccount *)self->_account backingAccountInfo];
        v10 = [v9 identifier];
        v11 = [(DAAccount *)self->_account backingAccountInfo];
        v12 = [v11 username];
        int v16 = 138412546;
        v17 = v10;
        __int16 v18 = 2112;
        v19 = v12;
        _os_log_impl(&dword_0, v7, v8, "Setting _backingAccountInfo.authenticated = YES for Account identifier %@ and username %@", (uint8_t *)&v16, 0x16u);
      }
      v13 = [(DAAccount *)self->_account backingAccountInfo];
      [v13 setAuthenticated:1];
    }
  }
  v14 = self->_account;

  return v14;
}

- (void)reloadAccount
{
  v3 = [(ESSettingsAccountsUIController *)self account];
  [v3 reload];

  id v5 = [(ESSettingsAccountsUIController *)self account];
  v4 = [v5 backingAccountInfo];
  [v4 setAuthenticated:1];
}

- (id)accountFromSpecifier
{
  v2 = [(ESSettingsAccountsUIController *)self specifier];
  v3 = [v2 userInfo];
  v4 = [v3 objectForKeyedSubscript:ACUIAccountKey];

  if (v4)
  {
    id v5 = +[DAAccountLoader sharedInstance];
    v6 = (objc_class *)[v5 daemonAppropriateAccountClassForACAccount:v4];

    id v7 = [[v6 alloc] initWithBackingAccountInfo:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)daAccountWithBackingAccountInfo:(id)a3
{
  v3 = DALoggingwithCategory();
  os_log_type_t v4 = _CPLog_to_os_log_type[3];
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_0, v3, v4, "Individual Settings Bundles MUST create their own da accounts", v6, 2u);
  }

  return 0;
}

- (id)newDefaultAccount
{
  v2 = DALoggingwithCategory();
  os_log_type_t v3 = _CPLog_to_os_log_type[3];
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v2, v3, "Individual Settings Bundles MUST create their own default accounts", v5, 2u);
  }

  return 0;
}

- (id)specifiers
{
  if (![(ESSettingsAccountsUIController *)self haveRegisteredForAccountsChanged])
  {
    [(ESSettingsAccountsUIController *)self setHaveRegisteredForAccountsChanged:1];
    os_log_type_t v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"_accountsChanged:" name:ACAccountStoreDidChangeNotification object:0];
  }
  uint64_t v4 = OBJC_IVAR___PSListController__specifiers;
  id v5 = *(void **)&self->ACUIViewController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v5)
  {
    uint64_t v6 = [(ESSettingsAccountsUIController *)self accountSpecifiers];
    id v7 = *(void **)&self->ACUIViewController_opaque[v4];
    *(void *)&self->ACUIViewController_opaque[v4] = v6;

    id v5 = *(void **)&self->ACUIViewController_opaque[v4];
  }

  return v5;
}

- (id)accountSpecifiers
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)ESSettingsAccountsUIController;
  id v6 = a4;
  id v7 = [(ESSettingsAccountsUIController *)&v16 tableView:a3 cellForRowAtIndexPath:v6];
  id v8 = -[ESSettingsAccountsUIController indexForIndexPath:](self, "indexForIndexPath:", v6, v16.receiver, v16.super_class);

  v9 = [(ESSettingsAccountsUIController *)self specifierAtIndex:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v9 identifier];
    unsigned __int8 v11 = [v10 isEqualToString:@"DESCRIPTION"];

    if ((v11 & 1) == 0)
    {
      v12 = [v7 textField];
      if (v12)
      {
        v13 = +[NSNotificationCenter defaultCenter];
        [v13 removeObserver:self name:0 object:v12];

        v14 = +[NSNotificationCenter defaultCenter];
        [v14 addObserver:self selector:"propertyValueChanged:" name:UITextFieldTextDidChangeNotification object:v12];
      }
    }
  }

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(ESSettingsAccountsUIController *)self reloadSpecifiers];
  [(ESSettingsAccountsUIController *)self updateDoneButton];
  v5.receiver = self;
  v5.super_class = (Class)ESSettingsAccountsUIController;
  [(ESSettingsAccountsUIController *)&v5 viewWillAppear:v3];
}

- (void)showAlertWithButtons:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v22 = a6;
  v21 = +[UIAlertController alertControllerWithTitle:a4 message:a5 preferredStyle:1];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        BOOL v18 = (unint64_t)[v10 count] > 1 && (char *)i + v13 == 0;
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_6D00;
        v23[3] = &unk_30808;
        id v24 = v22;
        v25 = (char *)i + v13;
        v19 = +[UIAlertAction actionWithTitle:v16 style:v18 handler:v23];
        [v21 addAction:v19];
      }
      id v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
      v13 += (uint64_t)i;
    }
    while (v12);
  }

  [(ESSettingsAccountsUIController *)self presentViewController:v21 animated:1 completion:0];
}

- (BOOL)validateAccount
{
  v2 = DALoggingwithCategory();
  os_log_type_t v3 = _CPLog_to_os_log_type[3];
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_0, v2, v3, "Individual Settings Bundles should handle account validation", v5, 2u);
  }

  return 0;
}

- (void)showIdenticalAccountFailureView
{
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  CFStringRef v3 = (const __CFString *)[v7 localizedStringForKey:@"ACCOUNT_UNIQUE_CONSTRAINT_FAILED_TITLE" value:&stru_30C50 table:@"DataAccess"];
  uint64_t v4 = [(ESSettingsAccountsUIController *)self account];
  CFStringRef v5 = (const __CFString *)[v4 localizedIdenticalAccountFailureMessage];
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  CFUserNotificationDisplayNotice(0.0, 3uLL, 0, 0, 0, v3, v5, (CFStringRef)[v6 localizedStringForKey:@"OK" value:&stru_30C50 table:@"Localizable"]);
}

- (void)showCanSaveAccountFailureView
{
  CFStringRef v3 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"OK" value:&stru_30C50 table:@"Localizable"];
  id v10 = v4;
  CFStringRef v5 = +[NSArray arrayWithObjects:&v10 count:1];
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"ACCOUNT_CANSAVE_FAILED_TITLE" value:&stru_30C50 table:@"DataAccess"];
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"ACCOUNT_CANSAVE_FAILED_BODY_FORMAT_EXCHANGE" value:&stru_30C50 table:@"DataAccess"];
  [(ESSettingsAccountsUIController *)self showAlertWithButtons:v5 title:v7 message:v9 completion:0];
}

- (void)showSSLFailureView
{
  id v11 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v11 localizedStringForKey:@"CANCEL" value:&stru_30C50 table:@"Localizable"];
  v13[0] = v10;
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  CFStringRef v3 = [v2 localizedStringForKey:@"CONTINUE" value:&stru_30C50 table:@"Localizable"];
  v13[1] = v3;
  uint64_t v4 = +[NSArray arrayWithObjects:v13 count:2];
  CFStringRef v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"SETUP_WITHOUT_SSL_TITLE" value:&stru_30C50 table:@"Localizable"];
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"SETUP_WITHOUT_SSL_BODY" value:&stru_30C50 table:@"Localizable"];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_727C;
  v12[3] = &unk_30830;
  v12[4] = self;
  [(ESSettingsAccountsUIController *)self showAlertWithButtons:v4 title:v6 message:v8 completion:v12];
}

- (void)didConfirmTryWithoutSSL:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = [(ESSettingsAccountsUIController *)self specifierForID:@"USE_SSL"];
    id v9 = [v4 properties];

    CFStringRef v5 = [v9 objectForKeyedSubscript:PSTableCellKey];
    id v6 = [v5 control];
    [v6 setOn:0 animated:1];

    id v7 = [(ESSettingsAccountsUIController *)self account];
    [v7 setUseSSL:0];

    [(ESSettingsAccountsUIController *)self _beginAccountValidation];
  }
  else
  {
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = [v9 localizedStringForKey:@"ACCOUNT_VERIFICATION_FAILED" value:&stru_30C50 table:@"Localizable"];
    [(ESSettingsAccountsUIController *)self hideProgressWithPrompt:v8];
  }
}

- (void)didConfirmSaveUnvalidatedAccount:(BOOL)a3
{
  if (a3)
  {
    [(ESSettingsAccountsUIController *)self setConfirmedUnvalidatedAccount:1];
    id v4 = [(ESSettingsAccountsUIController *)self account];
    [(ESSettingsAccountsUIController *)self account:v4 isValid:1 validationError:0];
  }
}

- (void)_confirmSaveUnvalidatedAccount
{
  CFStringRef v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"SAVE" value:&stru_30C50 table:@"Localizable"];
  v11[0] = v4;
  CFStringRef v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"EDIT" value:&stru_30C50 table:@"Localizable"];
  v11[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v11 count:2];
  id v8 = [(ESSettingsAccountsUIController *)self localizedConfirmSaveUnvalidatedAccountTitleString];
  id v9 = [(ESSettingsAccountsUIController *)self localizedConfirmSaveUnvalidatedAccountMessageString];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_75EC;
  v10[3] = &unk_30830;
  v10[4] = self;
  [(ESSettingsAccountsUIController *)self showConfirmationWithButtons:v7 title:v8 message:v9 destructive:0 completion:v10];
}

- (void)_beginAccountValidation
{
  if ([(ESSettingsAccountsUIController *)self validateAccount])
  {
    [(ESSettingsAccountsUIController *)self setTaskCompletionAssertionEnabled:1];
  }
}

- (void)account:(id)a3 isValid:(BOOL)a4 validationError:(id)a5
{
  if (a4)
  {
    if ([(ESSettingsAccountsUIController *)self validatedSuccessfully]
      && ![(ESSettingsAccountsUIController *)self confirmedUnvalidatedAccount]
      && ([(ESSettingsAccountsUIController *)self transitionsAfterInitialSetup]
       || [(ESSettingsAccountsUIController *)self dismissesAfterInitialSetup]))
    {
      [(ESSettingsAccountsUIController *)self setCellsChecked:1];
    }
    [(ESSettingsAccountsUIController *)self setTransitioningToFinishedAccountSetup:1];
    id v6 = [(ESSettingsAccountsUIController *)self doneButton];
    [v6 setEnabled:0];

    [(ESSettingsAccountsUIController *)self performSelector:"finishedAccountSetup" withObject:0 afterDelay:1.0];
  }

  [(ESSettingsAccountsUIController *)self setTaskCompletionAssertionEnabled:0];
}

- (void)finishedAccountSetup
{
  [(ESSettingsAccountsUIController *)self setTransitioningToFinishedAccountSetup:0];
  +[DAAggDReporter reportActiveExchangeOAuthAccountsCount];
  if ([(ESSettingsAccountsUIController *)self isSettingUpNewAccount]
    && ![(ESSettingsAccountsUIController *)self dismissesAfterInitialSetup])
  {
    if ([(ESSettingsAccountsUIController *)self isSettingUpNewAccount]
      && ![(ESSettingsAccountsUIController *)self transitionsAfterInitialSetup])
    {
      [(ESSettingsAccountsUIController *)self updateDoneButton];
    }
    else if ([(ESSettingsAccountsUIController *)self transitionsAfterInitialSetup])
    {
      CFStringRef v3 = [(ESSettingsAccountsUIController *)self parentController];
      char v4 = objc_opt_respondsToSelector();

      if (v4)
      {
        id v7 = [(ESSettingsAccountsUIController *)self parentController];
        CFStringRef v5 = [(ESSettingsAccountsUIController *)self account];
        id v6 = [v5 backingAccountInfo];
        [v7 controller:self didFinishSettingUpAccount:v6];
      }
    }
  }
  else
  {
    [(ESSettingsAccountsUIController *)self doneButtonTapped:self];
  }
}

- (void)doneButtonTapped:(id)a3
{
  char v4 = [(ESSettingsAccountsUIController *)self table];
  CFStringRef v5 = [v4 firstResponder];
  [v5 resignFirstResponder];

  if ([(ESSettingsAccountsUIController *)self attemptedValidation])
  {
    if ([(ESSettingsAccountsUIController *)self validatedSuccessfully])
    {
      if (self->_needsSave)
      {
        -[ESSettingsAccountsUIController _saveAccountDismissWhenDone:](self, "_saveAccountDismissWhenDone:");
      }
      else
      {
        [(ESSettingsAccountsUIController *)self dismissAnimated:1];
      }
    }
    else
    {
      [(ESSettingsAccountsUIController *)self _confirmSaveUnvalidatedAccount];
    }
  }
  else
  {
    [(ESSettingsAccountsUIController *)self setAttemptedValidation:1];
    [(ESSettingsAccountsUIController *)self _beginAccountValidation];
  }
}

- (void)cancelButtonTapped:(id)a3
{
  if ([(ESSettingsAccountsUIController *)self isSettingUpNewAccount])
  {
    char v4 = [(ESSettingsAccountsUIController *)self account];
    [v4 cleanupAccountFiles];
  }
  CFStringRef v5 = [*(id *)&self->ACUIViewController_opaque[OBJC_IVAR___PSListController__table] firstResponder];
  [v5 resignFirstResponder];

  id v6 = [(ESSettingsAccountsUIController *)self account];
  [v6 reload];

  [(ESSettingsAccountsUIController *)self dismissAnimated:1];
}

- (void)setNeedsSaveAndValidation:(BOOL)a3
{
  if (a3) {
    self->_attemptedValidation = 0;
  }
  self->_needsSave = 1;
  [(ESSettingsAccountsUIController *)self updateDoneButton];
}

- (void)updateDoneButton
{
  if (self->_attemptedValidation || [(ESSettingsAccountsUIController *)self haveEnoughValues]) {
    uint64_t v3 = [(ESSettingsAccountsUIController *)self transitioningToFinishedAccountSetup] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(ESSettingsAccountsUIController *)self isSettingUpNewAccount])
  {
    BOOL attemptedValidation = self->_attemptedValidation;
    CFStringRef v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = v5;
    if (attemptedValidation) {
      CFStringRef v7 = @"SAVE";
    }
    else {
      CFStringRef v7 = @"NEXT";
    }
  }
  else
  {
    CFStringRef v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = v5;
    CFStringRef v7 = @"DONE";
  }
  id v8 = [v5 localizedStringForKey:v7 value:&stru_30C50 table:@"Localizable"];
  id v9 = [(ESSettingsAccountsUIController *)self doneButton];
  [v9 setTitle:v8];

  id v10 = [(ESSettingsAccountsUIController *)self doneButton];
  [v10 setEnabled:v3];
}

- (BOOL)dismissesAfterInitialSetup
{
  return 0;
}

- (BOOL)transitionsAfterInitialSetup
{
  return 0;
}

- (BOOL)haveEnoughValues
{
  v2 = DALoggingwithCategory();
  os_log_type_t v3 = _CPLog_to_os_log_type[3];
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)CFStringRef v5 = 0;
    _os_log_impl(&dword_0, v2, v3, "Individual Settings Bundles should know if they have enough values", v5, 2u);
  }

  return 0;
}

- (void)propertyValueChanged:(id)a3
{
  [(ESSettingsAccountsUIController *)self setAttemptedValidation:0];

  [(ESSettingsAccountsUIController *)self updateDoneButton];
}

- (id)_defaultAccountDescription
{
  return 0;
}

- (void)setHostString:(id)a3
{
  id v4 = a3;
  [(ESSettingsAccountsUIController *)self setDidSetFullHostURL:0];
  id v5 = [v4 rangeOfString:@"/"];
  id v6 = [v4 rangeOfString:@":"];
  if (![v4 length] || v5 == (id)0x7FFFFFFFFFFFFFFFLL && v6 == (id)0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_11;
  }
  CFStringRef v7 = +[NSURL URLWithString:v4];
  id v8 = [v7 host];
  if (v8) {
    goto LABEL_7;
  }
  if (([v4 hasPrefix:@"http"] & 1) == 0)
  {
    id v8 = +[NSString stringWithFormat:@"https://%@", v4];
    uint64_t v9 = +[NSURL URLWithString:v8];

    CFStringRef v7 = (void *)v9;
LABEL_7:
  }
  id v10 = [v7 host];

  if (v10)
  {
    id v11 = [(ESSettingsAccountsUIController *)self account];
    [v11 setPrincipalURL:v7];

    [(ESSettingsAccountsUIController *)self setDidSetFullHostURL:1];
    id v12 = [(ESSettingsAccountsUIController *)self account];
    [v12 setShouldDoInitialAutodiscovery:0];
  }
LABEL_11:
  if (![(ESSettingsAccountsUIController *)self didSetFullHostURL])
  {
    uint64_t v13 = DALoggingwithCategory();
    os_log_type_t v14 = _CPLog_to_os_log_type[6];
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_0, v13, v14, "Couldn't parse host string \"%@\" into a URL. Using it directly", buf, 0xCu);
    }

    v15 = [(ESSettingsAccountsUIController *)self account];
    [v15 setHost:v4];

    uint64_t v16 = [(ESSettingsAccountsUIController *)self account];
    [v16 setShouldDoInitialAutodiscovery:0];
  }
}

- (void)setAccountProperty:(id)a3 withSpecifier:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  CFStringRef v7 = [v6 identifier];
  id v8 = [(ESSettingsAccountsUIController *)self accountPropertyWithSpecifier:v6];

  if ([v26 isEqualToString:v8])
  {
    [v7 isEqualToString:@"EMAIL"];
  }
  else
  {
    if ([v26 length]) {
      BOOL v9 = 0;
    }
    else {
      BOOL v9 = [v8 length] == 0;
    }
    if ([v7 isEqualToString:@"EMAIL"] && !v9)
    {
      id v11 = [(ESSettingsAccountsUIController *)self account];
      [v11 setEmailAddress:v26];

      id v12 = [(ESSettingsAccountsUIController *)self account];
      uint64_t v13 = [v12 accountDescription];
      id v14 = [v13 length];

      if (v14) {
        goto LABEL_19;
      }
      id v10 = [(ESSettingsAccountsUIController *)self _defaultAccountDescription];
      v15 = [(ESSettingsAccountsUIController *)self accountStore];
      unsigned int v16 = [v15 hasAccountWithDescription:v10];

      if (v16)
      {
        id v17 = v26;

        id v10 = v17;
      }
      id v18 = [(ESSettingsAccountsUIController *)self account];
      [v18 setAccountDescription:v10];

      [(ESSettingsAccountsUIController *)self reloadSpecifierID:@"DESCRIPTION"];
      goto LABEL_18;
    }
  }
  if ([v7 isEqualToString:@"HOST"])
  {
    [(ESSettingsAccountsUIController *)self setHostString:v26];
    goto LABEL_19;
  }
  if ([v7 isEqualToString:@"USERNAME"])
  {
    id v10 = [(ESSettingsAccountsUIController *)self account];
    [v10 setUsername:v26];
LABEL_18:

    goto LABEL_19;
  }
  if ([v7 isEqualToString:@"PASSWORD"])
  {
    id v10 = [(ESSettingsAccountsUIController *)self account];
    [v10 setPassword:v26];
    goto LABEL_18;
  }
  if ([v7 isEqualToString:@"DESCRIPTION"])
  {
    v19 = [(ESSettingsAccountsUIController *)self account];
    v20 = [v19 accountDescription];
    unsigned __int8 v21 = [v26 isEqualToString:v20];

    if ((v21 & 1) == 0)
    {
      id v22 = [(ESSettingsAccountsUIController *)self account];
      [v22 setAccountDescription:v26];

      id v10 = [(ESSettingsAccountsUIController *)self rootController];
      v23 = [v10 topViewController];
      if (v23 != self)
      {

        goto LABEL_18;
      }
      unsigned __int8 v24 = [(ESSettingsAccountsUIController *)self isSettingUpNewAccount];

      if ((v24 & 1) == 0)
      {
        id v10 = [(ESSettingsAccountsUIController *)self navigationItem];
        v25 = [(ESSettingsAccountsUIController *)self localizedAccountTitleString];
        [v10 setTitle:v25];

        goto LABEL_18;
      }
    }
  }
LABEL_19:
  [(ESSettingsAccountsUIController *)self setNeedsSaveAndValidation:0];
}

- (id)accountPropertyWithSpecifier:(id)a3
{
  id v4 = [a3 identifier];
  if ([v4 isEqualToString:@"EMAIL"])
  {
    id v5 = [(ESSettingsAccountsUIController *)self account];
    uint64_t v6 = [v5 emailAddress];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"HOST"])
  {
    unsigned int v7 = [(ESSettingsAccountsUIController *)self didSetFullHostURL];
    id v8 = [(ESSettingsAccountsUIController *)self account];
    id v5 = v8;
    if (v7)
    {
      BOOL v9 = [v8 principalURL];
      id v10 = [v9 absoluteString];

LABEL_14:
      goto LABEL_15;
    }
    uint64_t v6 = [v8 host];
LABEL_13:
    id v10 = (__CFString *)v6;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"USERNAME"])
  {
    id v5 = [(ESSettingsAccountsUIController *)self account];
    uint64_t v6 = [v5 username];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"PASSWORD"])
  {
    id v5 = [(ESSettingsAccountsUIController *)self account];
    uint64_t v6 = [v5 passwordWithExpected:0];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"DESCRIPTION"])
  {
    id v5 = [(ESSettingsAccountsUIController *)self account];
    uint64_t v6 = [v5 accountDescription];
    goto LABEL_13;
  }
  id v10 = 0;
LABEL_15:
  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = &stru_30C50;
  }
  id v12 = v11;

  return v12;
}

- (void)setAccountBooleanProperty:(id)a3 withSpecifier:(id)a4
{
  id v6 = a4;
  id v7 = [a3 BOOLValue];
  id v10 = [v6 identifier];

  id v8 = [v10 isEqualToString:@"USE_SSL"];
  if (v8)
  {
    BOOL v9 = [(ESSettingsAccountsUIController *)self account];
    [v9 setUseSSL:v7];
  }
  [(ESSettingsAccountsUIController *)self setNeedsSaveAndValidation:v8];
}

- (id)accountBooleanPropertyWithSpecifier:(id)a3
{
  id v4 = [a3 identifier];
  if ([v4 isEqualToString:@"USE_SSL"])
  {
    id v5 = [(ESSettingsAccountsUIController *)self account];
    id v6 = [v5 useSSL];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = +[NSNumber numberWithBool:v6];

  return v7;
}

- (void)_dismissAndUpdateParent
{
  [(ESSettingsAccountsUIController *)self removeParentSpecifier];

  [(ESSettingsAccountsUIController *)self dismissAnimated:1];
}

- (void)_deleteAccount
{
  [(ESSettingsAccountsUIController *)self setTaskCompletionAssertionEnabled:1];
  os_log_type_t v3 = DALoggingwithCategory();
  os_log_type_t v4 = _CPLog_to_os_log_type[6];
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_0, v3, v4, "Requesting delete from ACAccountStore", v8, 2u);
  }

  id v5 = [(ESSettingsAccountsUIController *)self accountOperationsHelper];
  id v6 = [(ESSettingsAccountsUIController *)self account];
  id v7 = [v6 backingAccountInfo];
  [v5 removeAccount:v7];
}

- (void)operationsHelper:(id)a3 didRemoveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = dataaccess_get_global_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8754;
  block[3] = &unk_30858;
  BOOL v19 = v6;
  id v17 = v10;
  id v18 = self;
  id v14 = v10;
  dispatch_async(v13, block);

  v15.receiver = self;
  v15.super_class = (Class)ESSettingsAccountsUIController;
  [(ESSettingsAccountsUIController *)&v15 operationsHelper:v12 didRemoveAccount:v11 withSuccess:v6 error:v14];
}

- (void)_finishSaveAccountDismissWhenDone:(BOOL)a3
{
  BOOL v3 = a3;
  [(ESSettingsAccountsUIController *)self reloadParentSpecifier];
  [(ESSettingsAccountsUIController *)self setTaskCompletionAssertionEnabled:0];
  if (v3)
  {
    id v5 = [(ESSettingsAccountsUIController *)self parentController];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v9 = [(ESSettingsAccountsUIController *)self parentController];
      id v7 = [(ESSettingsAccountsUIController *)self account];
      id v8 = [v7 backingAccountInfo];
      [v9 controller:self didFinishSettingUpAccount:v8];
    }
    else
    {
      [(ESSettingsAccountsUIController *)self dismissAnimated:1];
    }
  }
}

- (void)_saveAccountDismissWhenDone:(BOOL)a3
{
  BOOL v3 = a3;
  [(ESSettingsAccountsUIController *)self setTaskCompletionAssertionEnabled:1];
  if (v3)
  {
    id v5 = DALoggingwithCategory();
    os_log_type_t v6 = _CPLog_to_os_log_type[6];
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_0, v5, v6, "Requesting account save from ACAccountStore", v11, 2u);
    }

    id v7 = [(ESSettingsAccountsUIController *)self account];
    [v7 saveModifiedPropertiesOnBackingAccount];

    id v8 = [(ESSettingsAccountsUIController *)self accountOperationsHelper];
    id v9 = [(ESSettingsAccountsUIController *)self account];
    id v10 = [v9 backingAccountInfo];
    [v8 saveAccount:v10 requireVerification:0];
  }
}

- (void)operationsHelper:(id)a3 didSaveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = dataaccess_get_global_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8B48;
  block[3] = &unk_30858;
  BOOL v19 = v6;
  id v17 = v10;
  id v18 = self;
  id v14 = v10;
  dispatch_async(v13, block);

  v15.receiver = self;
  v15.super_class = (Class)ESSettingsAccountsUIController;
  [(ESSettingsAccountsUIController *)&v15 operationsHelper:v12 didSaveAccount:v11 withSuccess:v6 error:v14];
}

- (BOOL)isRunningFromMobileMailApp
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 bundleIdentifier];
  unsigned __int8 v4 = [v3 isEqualToString:@"com.apple.mobilemail"];

  return v4;
}

- (void)hideProgressWithPrompt:(id)a3
{
  CFStringRef alertMessage = (const __CFString *)a3;
  unsigned __int8 v4 = [(ESSettingsAccountsUIController *)self localizedAccountSetupTitleString];
  [(ESSettingsAccountsUIController *)self stopValidationWithPrompt:v4 showButtons:1];

  [(ESSettingsAccountsUIController *)self updateDoneButton];
  if (![(ESSettingsAccountsUIController *)self isRunningFromMobileMailApp]) {
    [UIApp setStatusBarShowsProgress:0];
  }
  id v5 = (__CFString *)alertMessage;
  if (alertMessage)
  {
    CFStringRef v6 = [(ESSettingsAccountsUIController *)self localizedValidationFailureTitleString];
    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    CFUserNotificationDisplayNotice(0.0, 3uLL, 0, 0, 0, v6, alertMessage, (CFStringRef)[v7 localizedStringForKey:@"OK" value:&stru_30C50 table:@"Localizable"]);

    id v5 = (__CFString *)alertMessage;
  }
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ESSettingsAccountsUIController;
  [(ESSettingsAccountsUIController *)&v4 dealloc];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[UIApplication sharedApplication];
  unsigned __int8 v6 = [v5 isSuspended];

  id v7 = [(ESSettingsAccountsUIController *)self rootController];
  unsigned __int8 v8 = [v7 deallocating];

  id v9 = [(ESSettingsAccountsUIController *)self rootController];
  id v10 = [v9 viewControllers];
  unsigned int v11 = [v10 containsObject:self];

  if ((v6 & 1) != 0 || (v8 & 1) != 0 || !v11)
  {
    if ([(ESSettingsAccountsUIController *)self validationInProgress])
    {
      [(ESSettingsAccountsUIController *)self updateDoneButton];
      [(ESSettingsAccountsUIController *)self hideProgressWithPrompt:0];
    }
    else if ([(ESSettingsAccountsUIController *)self accountNeedsAdd])
    {
      id v12 = [(ESSettingsAccountsUIController *)self account];
      [v12 cleanupAccountFiles];
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)ESSettingsAccountsUIController;
  [(ESSettingsAccountsUIController *)&v13 viewWillDisappear:v3];
}

- (int)indexOfCurrentlyEditingCell
{
  BOOL v3 = [(ESSettingsAccountsUIController *)self currentlyEditingCell];
  if (v3
    && ([*(id *)&self->ACUIViewController_opaque[OBJC_IVAR___PSListController__table] indexPathForCell:v3], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = (void *)v4;
    int v6 = [(ESSettingsAccountsUIController *)self indexForIndexPath:v4];
  }
  else
  {
    int v6 = -1;
  }

  return v6;
}

- (id)currentlyEditingCell
{
  v2 = [(ESSettingsAccountsUIController *)self view];
  BOOL v3 = [v2 window];
  uint64_t v4 = [v3 firstResponder];

  id v5 = v4;
  int v6 = v5;
  if (v5)
  {
    id v7 = v5;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_8;
      }
      uint64_t v8 = [v7 superview];

      id v7 = (void *)v8;
    }
    while (v8);
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

- (id)lastGroupSpecifierInSpecifiers:(id)a3
{
  id v3 = a3;
  int v4 = [v3 count];
  if (v4 < 1)
  {
LABEL_5:
    id v7 = 0;
  }
  else
  {
    uint64_t v5 = v4 + 1;
    while (1)
    {
      int v6 = [v3 objectAtIndexedSubscript:(v5 - 2)];
      id v7 = v6;
      if (!*(void *)&v6[OBJC_IVAR___PSSpecifier_cellType]) {
        break;
      }

      if ((unint64_t)--v5 <= 1) {
        goto LABEL_5;
      }
    }
  }

  return v7;
}

- (id)localizedValidationFailureTitleString
{
  return 0;
}

- (id)localizedConfirmSaveUnvalidatedAccountMessageString
{
  return 0;
}

- (id)localizedAccountSetupTitleString
{
  return 0;
}

- (id)localizedAccountTitleString
{
  id v3 = [(ESSettingsAccountsUIController *)self account];
  int v4 = [v3 accountDescription];

  if ([v4 length])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(ESSettingsAccountsUIController *)self localizedAccountSetupTitleString];
  }
  int v6 = v5;

  return v6;
}

- (void)deleteAccountButtonTapped
{
  id v3 = [(ESSettingsAccountsUIController *)self account];
  int v4 = [v3 backingAccountInfo];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_9288;
  v5[3] = &unk_30830;
  v5[4] = self;
  [(ESSettingsAccountsUIController *)self showConfirmationForDeletingAccount:v4 completion:v5];
}

- (BOOL)didSetFullHostURL
{
  return self->_didSetFullHostURL;
}

- (void)setDidSetFullHostURL:(BOOL)a3
{
  self->_didSetFullHostURL = a3;
}

- (BOOL)needsSave
{
  return self->_needsSave;
}

- (void)setNeedsSave:(BOOL)a3
{
  self->_needsSave = a3;
}

- (BOOL)attemptedValidation
{
  return self->_attemptedValidation;
}

- (void)setAttemptedValidation:(BOOL)a3
{
  self->_BOOL attemptedValidation = a3;
}

- (void)setAccount:(id)a3
{
}

- (BOOL)isSettingUpNewAccount
{
  return self->_isSettingUpNewAccount;
}

- (void)setIsSettingUpNewAccount:(BOOL)a3
{
  self->_isSettingUpNewAccount = a3;
}

- (BOOL)accountNeedsAdd
{
  return self->_accountNeedsAdd;
}

- (void)setAccountNeedsAdd:(BOOL)a3
{
  self->_accountNeedsAdd = a3;
}

- (BOOL)validatedSuccessfully
{
  return self->_validatedSuccessfully;
}

- (void)setValidatedSuccessfully:(BOOL)a3
{
  self->_validatedSuccessfully = a3;
}

- (BOOL)confirmedUnvalidatedAccount
{
  return self->_confirmedUnvalidatedAccount;
}

- (void)setConfirmedUnvalidatedAccount:(BOOL)a3
{
  self->_confirmedUnvalidatedAccount = a3;
}

- (BOOL)haveRegisteredForAccountsChanged
{
  return self->_haveRegisteredForAccountsChanged;
}

- (void)setHaveRegisteredForAccountsChanged:(BOOL)a3
{
  self->_haveRegisteredForAccountsChanged = a3;
}

- (BOOL)transitioningToFinishedAccountSetup
{
  return self->_transitioningToFinishedAccountSetup;
}

- (void)setTransitioningToFinishedAccountSetup:(BOOL)a3
{
  self->_transitioningToFinishedAccountSetup = a3;
}

- (void).cxx_destruct
{
}

@end