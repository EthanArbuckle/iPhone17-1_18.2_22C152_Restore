@interface DASettingsAccountsUIController
- (BOOL)accountIsManaged;
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
- (void)showIdenticalAccountFailureView;
- (void)showSSLFailureView;
- (void)updateDoneButton;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation DASettingsAccountsUIController

- (DAAccount)account
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!self->_account)
  {
    v3 = [(DASettingsAccountsUIController *)self accountFromSpecifier];
    account = self->_account;
    self->_account = v3;

    if (self->_account)
    {
      [(DASettingsAccountsUIController *)self setAttemptedValidation:1];
      [(DASettingsAccountsUIController *)self setValidatedSuccessfully:1];
    }
    else
    {
      [(DASettingsAccountsUIController *)self setIsSettingUpNewAccount:1];
      [(DASettingsAccountsUIController *)self setAccountNeedsAdd:1];
      v5 = [(DASettingsAccountsUIController *)self newDefaultAccount];
      v6 = self->_account;
      self->_account = v5;

      v7 = DALoggingwithCategory();
      os_log_type_t v8 = *(unsigned char *)(MEMORY[0x263F38F90] + 4);
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
        _os_log_impl(&dword_22CA3B000, v7, v8, "Setting _backingAccountInfo.authenticated = YES for Account identifier %@ and username %@", (uint8_t *)&v16, 0x16u);
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
  v3 = [(DASettingsAccountsUIController *)self account];
  [v3 reload];

  id v5 = [(DASettingsAccountsUIController *)self account];
  v4 = [v5 backingAccountInfo];
  [v4 setAuthenticated:1];
}

- (id)accountFromSpecifier
{
  v2 = [(DASettingsAccountsUIController *)self specifier];
  v3 = [v2 userInfo];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F23118]];

  if (v4)
  {
    id v5 = [MEMORY[0x263F38D58] sharedInstance];
    v6 = (objc_class *)[v5 daemonAppropriateAccountClassForACAccount:v4];

    v7 = (void *)[[v6 alloc] initWithBackingAccountInfo:v4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)daAccountWithBackingAccountInfo:(id)a3
{
  v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22CA3B000, v3, v4, "Individual Settings Bundles MUST create their own da accounts", v6, 2u);
  }

  return 0;
}

- (id)newDefaultAccount
{
  v2 = DALoggingwithCategory();
  os_log_type_t v3 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22CA3B000, v2, v3, "Individual Settings Bundles MUST create their own default accounts", v5, 2u);
  }

  return 0;
}

- (id)specifiers
{
  if (![(DASettingsAccountsUIController *)self haveRegisteredForAccountsChanged])
  {
    [(DASettingsAccountsUIController *)self setHaveRegisteredForAccountsChanged:1];
    os_log_type_t v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel__accountsChanged_ name:*MEMORY[0x263EFAE28] object:0];
  }
  uint64_t v4 = (int)*MEMORY[0x263F5FDB8];
  id v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v4);
  if (!v5)
  {
    v6 = [(DASettingsAccountsUIController *)self accountSpecifiers];
    v7 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v4);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v4) = v6;

    id v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v4);
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
  v16.super_class = (Class)DASettingsAccountsUIController;
  id v6 = a4;
  v7 = [(DASettingsAccountsUIController *)&v16 tableView:a3 cellForRowAtIndexPath:v6];
  uint64_t v8 = -[DASettingsAccountsUIController indexForIndexPath:](self, "indexForIndexPath:", v6, v16.receiver, v16.super_class);

  v9 = [(DASettingsAccountsUIController *)self specifierAtIndex:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v9 identifier];
    char v11 = [v10 isEqualToString:@"DESCRIPTION"];

    if ((v11 & 1) == 0)
    {
      v12 = [v7 textField];
      if (v12)
      {
        v13 = [MEMORY[0x263F08A00] defaultCenter];
        [v13 removeObserver:self name:0 object:v12];

        v14 = [MEMORY[0x263F08A00] defaultCenter];
        [v14 addObserver:self selector:sel_propertyValueChanged_ name:*MEMORY[0x263F1D778] object:v12];
      }
    }
  }

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(DASettingsAccountsUIController *)self reloadSpecifiers];
  [(DASettingsAccountsUIController *)self updateDoneButton];
  v5.receiver = self;
  v5.super_class = (Class)DASettingsAccountsUIController;
  [(DASettingsAccountsUIController *)&v5 viewWillAppear:v3];
}

- (void)showAlertWithButtons:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v23 = a6;
  v22 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:a4 message:a5 preferredStyle:1];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        BOOL v18 = (unint64_t)[v10 count] > 1 && v13 + i == 0;
        v19 = (void *)MEMORY[0x263F1C3F0];
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __80__DASettingsAccountsUIController_showAlertWithButtons_title_message_completion___block_invoke;
        v24[3] = &unk_26492BC50;
        id v25 = v23;
        uint64_t v26 = v13 + i;
        uint64_t v20 = [v19 actionWithTitle:v16 style:v18 handler:v24];
        [v22 addAction:v20];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
      v13 += i;
    }
    while (v12);
  }

  [(DASettingsAccountsUIController *)self presentViewController:v22 animated:1 completion:0];
}

uint64_t __80__DASettingsAccountsUIController_showAlertWithButtons_title_message_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

- (BOOL)validateAccount
{
  v2 = DALoggingwithCategory();
  os_log_type_t v3 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_22CA3B000, v2, v3, "Individual Settings Bundles should handle account validation", v5, 2u);
  }

  return 0;
}

- (void)showIdenticalAccountFailureView
{
  v10[1] = *MEMORY[0x263EF8340];
  os_log_type_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"OK" value:&stru_26E020258 table:@"Localizable"];
  v10[0] = v4;
  objc_super v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"ACCOUNT_UNIQUE_CONSTRAINT_FAILED_TITLE" value:&stru_26E020258 table:@"DataAccess"];
  uint64_t v8 = [(DASettingsAccountsUIController *)self account];
  id v9 = [v8 localizedIdenticalAccountFailureMessage];
  [(DASettingsAccountsUIController *)self showAlertWithButtons:v5 title:v7 message:v9 completion:0];
}

- (void)showSSLFailureView
{
  v13[2] = *MEMORY[0x263EF8340];
  uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v11 localizedStringForKey:@"CANCEL" value:&stru_26E020258 table:@"Localizable"];
  v13[0] = v10;
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  os_log_type_t v3 = [v2 localizedStringForKey:@"CONTINUE" value:&stru_26E020258 table:@"Localizable"];
  v13[1] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  objc_super v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"SETUP_WITHOUT_SSL_TITLE" value:&stru_26E020258 table:@"Localizable"];
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"SETUP_WITHOUT_SSL_BODY" value:&stru_26E020258 table:@"Localizable"];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__DASettingsAccountsUIController_showSSLFailureView__block_invoke;
  v12[3] = &unk_26492BC78;
  v12[4] = self;
  [(DASettingsAccountsUIController *)self showAlertWithButtons:v4 title:v6 message:v8 completion:v12];
}

uint64_t __52__DASettingsAccountsUIController_showSSLFailureView__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) didConfirmTryWithoutSSL:a2 != 0];
}

- (void)didConfirmTryWithoutSSL:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = [(DASettingsAccountsUIController *)self specifierForID:@"USE_SSL"];
    id v9 = [v4 properties];

    objc_super v5 = [v9 objectForKeyedSubscript:*MEMORY[0x263F602B0]];
    id v6 = [v5 control];
    [v6 setOn:0 animated:1];

    v7 = [(DASettingsAccountsUIController *)self account];
    [v7 setUseSSL:0];

    [(DASettingsAccountsUIController *)self _beginAccountValidation];
  }
  else
  {
    id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v9 localizedStringForKey:@"ACCOUNT_VERIFICATION_FAILED" value:&stru_26E020258 table:@"Localizable"];
    [(DASettingsAccountsUIController *)self hideProgressWithPrompt:v8];
  }
}

- (void)didConfirmSaveUnvalidatedAccount:(BOOL)a3
{
  if (a3)
  {
    [(DASettingsAccountsUIController *)self setConfirmedUnvalidatedAccount:1];
    id v4 = [(DASettingsAccountsUIController *)self account];
    [(DASettingsAccountsUIController *)self account:v4 isValid:1 validationError:0];
  }
}

- (void)_confirmSaveUnvalidatedAccount
{
  v11[2] = *MEMORY[0x263EF8340];
  os_log_type_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"SAVE" value:&stru_26E020258 table:@"Localizable"];
  v11[0] = v4;
  objc_super v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"EDIT" value:&stru_26E020258 table:@"Localizable"];
  v11[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  uint64_t v8 = [(DASettingsAccountsUIController *)self localizedConfirmSaveUnvalidatedAccountTitleString];
  id v9 = [(DASettingsAccountsUIController *)self localizedConfirmSaveUnvalidatedAccountMessageString];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __64__DASettingsAccountsUIController__confirmSaveUnvalidatedAccount__block_invoke;
  v10[3] = &unk_26492BC78;
  v10[4] = self;
  [(ACUIViewController *)self showConfirmationWithButtons:v7 title:v8 message:v9 destructive:0 completion:v10];
}

uint64_t __64__DASettingsAccountsUIController__confirmSaveUnvalidatedAccount__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) didConfirmSaveUnvalidatedAccount:a2 == 0];
}

- (void)_beginAccountValidation
{
  if ([(DASettingsAccountsUIController *)self validateAccount])
  {
    [(ACUIViewController *)self setTaskCompletionAssertionEnabled:1];
  }
}

- (void)account:(id)a3 isValid:(BOOL)a4 validationError:(id)a5
{
  if (a4)
  {
    if ([(DASettingsAccountsUIController *)self validatedSuccessfully]
      && ![(DASettingsAccountsUIController *)self confirmedUnvalidatedAccount]
      && ([(DASettingsAccountsUIController *)self transitionsAfterInitialSetup]
       || [(DASettingsAccountsUIController *)self dismissesAfterInitialSetup]))
    {
      [(ACUIViewController *)self setCellsChecked:1];
    }
    [(DASettingsAccountsUIController *)self setTransitioningToFinishedAccountSetup:1];
    id v6 = [(ACUIViewController *)self doneButton];
    [v6 setEnabled:0];

    [(DASettingsAccountsUIController *)self performSelector:sel_finishedAccountSetup withObject:0 afterDelay:1.0];
  }

  [(ACUIViewController *)self setTaskCompletionAssertionEnabled:0];
}

- (void)finishedAccountSetup
{
  [(DASettingsAccountsUIController *)self setTransitioningToFinishedAccountSetup:0];
  [MEMORY[0x263F38D78] reportActiveExchangeOAuthAccountsCount];
  if ([(DASettingsAccountsUIController *)self isSettingUpNewAccount]
    && ![(DASettingsAccountsUIController *)self dismissesAfterInitialSetup])
  {
    if ([(DASettingsAccountsUIController *)self isSettingUpNewAccount]
      && ![(DASettingsAccountsUIController *)self transitionsAfterInitialSetup])
    {
      [(DASettingsAccountsUIController *)self updateDoneButton];
    }
    else if ([(DASettingsAccountsUIController *)self transitionsAfterInitialSetup])
    {
      os_log_type_t v3 = [(DASettingsAccountsUIController *)self parentController];
      char v4 = objc_opt_respondsToSelector();

      if (v4)
      {
        id v7 = [(DASettingsAccountsUIController *)self parentController];
        objc_super v5 = [(DASettingsAccountsUIController *)self account];
        id v6 = [v5 backingAccountInfo];
        [v7 controller:self didFinishSettingUpAccount:v6];
      }
    }
  }
  else
  {
    [(DASettingsAccountsUIController *)self doneButtonTapped:self];
  }
}

- (void)doneButtonTapped:(id)a3
{
  char v4 = [(DASettingsAccountsUIController *)self table];
  objc_super v5 = [v4 firstResponder];
  [v5 resignFirstResponder];

  if ([(DASettingsAccountsUIController *)self attemptedValidation])
  {
    if ([(DASettingsAccountsUIController *)self validatedSuccessfully])
    {
      if (self->_needsSave)
      {
        [(DASettingsAccountsUIController *)self _saveAccountDismissWhenDone:1];
      }
      else
      {
        [(ACUIViewController *)self dismissAnimated:1];
      }
    }
    else
    {
      [(DASettingsAccountsUIController *)self _confirmSaveUnvalidatedAccount];
    }
  }
  else
  {
    [(DASettingsAccountsUIController *)self setAttemptedValidation:1];
    [(DASettingsAccountsUIController *)self _beginAccountValidation];
  }
}

- (void)cancelButtonTapped:(id)a3
{
  if ([(DASettingsAccountsUIController *)self isSettingUpNewAccount])
  {
    char v4 = [(DASettingsAccountsUIController *)self account];
    [v4 cleanupAccountFiles];
  }
  objc_super v5 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) firstResponder];
  [v5 resignFirstResponder];

  id v6 = [(DASettingsAccountsUIController *)self account];
  [v6 reload];

  [(ACUIViewController *)self dismissAnimated:1];
}

- (void)setNeedsSaveAndValidation:(BOOL)a3
{
  if (a3) {
    self->_attemptedValidation = 0;
  }
  self->_needsSave = 1;
  [(DASettingsAccountsUIController *)self updateDoneButton];
}

- (void)updateDoneButton
{
  if (self->_attemptedValidation || [(DASettingsAccountsUIController *)self haveEnoughValues]) {
    uint64_t v3 = [(DASettingsAccountsUIController *)self transitioningToFinishedAccountSetup] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(DASettingsAccountsUIController *)self isSettingUpNewAccount])
  {
    BOOL attemptedValidation = self->_attemptedValidation;
    objc_super v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = v5;
    if (attemptedValidation) {
      id v7 = @"SAVE";
    }
    else {
      id v7 = @"NEXT";
    }
  }
  else
  {
    objc_super v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = v5;
    id v7 = @"DONE";
  }
  uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_26E020258 table:@"Localizable"];
  id v9 = [(ACUIViewController *)self doneButton];
  [v9 setTitle:v8];

  id v10 = [(ACUIViewController *)self doneButton];
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
  os_log_type_t v3 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_22CA3B000, v2, v3, "Individual Settings Bundles should know if they have enough values", v5, 2u);
  }

  return 0;
}

- (void)propertyValueChanged:(id)a3
{
  [(DASettingsAccountsUIController *)self setAttemptedValidation:0];

  [(DASettingsAccountsUIController *)self updateDoneButton];
}

- (id)_defaultAccountDescription
{
  return 0;
}

- (void)setHostString:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(DASettingsAccountsUIController *)self setDidSetFullHostURL:0];
  uint64_t v5 = [v4 rangeOfString:@"/"];
  uint64_t v6 = [v4 rangeOfString:@":"];
  if (![v4 length] || v5 == 0x7FFFFFFFFFFFFFFFLL && v6 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_11;
  }
  id v7 = [NSURL URLWithString:v4];
  uint64_t v8 = [v7 host];
  if (v8) {
    goto LABEL_7;
  }
  if (([v4 hasPrefix:@"http"] & 1) == 0)
  {
    uint64_t v8 = [NSString stringWithFormat:@"https://%@", v4];
    uint64_t v9 = [NSURL URLWithString:v8];

    id v7 = (void *)v9;
LABEL_7:
  }
  id v10 = [v7 host];

  if (v10)
  {
    uint64_t v11 = [(DASettingsAccountsUIController *)self account];
    [v11 setPrincipalURL:v7];

    [(DASettingsAccountsUIController *)self setDidSetFullHostURL:1];
    uint64_t v12 = [(DASettingsAccountsUIController *)self account];
    [v12 setShouldDoInitialAutodiscovery:0];
  }
LABEL_11:
  if (![(DASettingsAccountsUIController *)self didSetFullHostURL])
  {
    uint64_t v13 = DALoggingwithCategory();
    os_log_type_t v14 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_22CA3B000, v13, v14, "Couldn't parse host string \"%@\" into a URL. Using it directly", buf, 0xCu);
    }

    v15 = [(DASettingsAccountsUIController *)self account];
    [v15 setHost:v4];

    uint64_t v16 = [(DASettingsAccountsUIController *)self account];
    [v16 setShouldDoInitialAutodiscovery:0];
  }
}

- (void)setAccountProperty:(id)a3 withSpecifier:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  id v7 = [v6 identifier];
  uint64_t v8 = [(DASettingsAccountsUIController *)self accountPropertyWithSpecifier:v6];

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
      uint64_t v11 = [(DASettingsAccountsUIController *)self account];
      [v11 setEmailAddress:v26];

      uint64_t v12 = [(DASettingsAccountsUIController *)self account];
      uint64_t v13 = [v12 accountDescription];
      uint64_t v14 = [v13 length];

      if (v14) {
        goto LABEL_19;
      }
      id v10 = [(DASettingsAccountsUIController *)self _defaultAccountDescription];
      v15 = [(ACUIViewController *)self accountStore];
      int v16 = [v15 hasAccountWithDescription:v10];

      if (v16)
      {
        id v17 = v26;

        id v10 = v17;
      }
      id v18 = [(DASettingsAccountsUIController *)self account];
      [v18 setAccountDescription:v10];

      [(DASettingsAccountsUIController *)self reloadSpecifierID:@"DESCRIPTION"];
      goto LABEL_18;
    }
  }
  if ([v7 isEqualToString:@"HOST"])
  {
    [(DASettingsAccountsUIController *)self setHostString:v26];
    goto LABEL_19;
  }
  if ([v7 isEqualToString:@"USERNAME"])
  {
    id v10 = [(DASettingsAccountsUIController *)self account];
    [v10 setUsername:v26];
LABEL_18:

    goto LABEL_19;
  }
  if ([v7 isEqualToString:@"PASSWORD"])
  {
    id v10 = [(DASettingsAccountsUIController *)self account];
    [v10 setPassword:v26];
    goto LABEL_18;
  }
  if ([v7 isEqualToString:@"DESCRIPTION"])
  {
    uint64_t v19 = [(DASettingsAccountsUIController *)self account];
    uint64_t v20 = [v19 accountDescription];
    char v21 = [v26 isEqualToString:v20];

    if ((v21 & 1) == 0)
    {
      v22 = [(DASettingsAccountsUIController *)self account];
      [v22 setAccountDescription:v26];

      id v10 = [(DASettingsAccountsUIController *)self rootController];
      id v23 = [v10 topViewController];
      if (v23 != self)
      {

        goto LABEL_18;
      }
      BOOL v24 = [(DASettingsAccountsUIController *)self isSettingUpNewAccount];

      if (!v24)
      {
        id v10 = [(DASettingsAccountsUIController *)self navigationItem];
        id v25 = [(DASettingsAccountsUIController *)self localizedAccountTitleString];
        [v10 setTitle:v25];

        goto LABEL_18;
      }
    }
  }
LABEL_19:
  [(DASettingsAccountsUIController *)self setNeedsSaveAndValidation:0];
}

- (id)accountPropertyWithSpecifier:(id)a3
{
  id v4 = [a3 identifier];
  if ([v4 isEqualToString:@"EMAIL"])
  {
    uint64_t v5 = [(DASettingsAccountsUIController *)self account];
    uint64_t v6 = [v5 emailAddress];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"HOST"])
  {
    BOOL v7 = [(DASettingsAccountsUIController *)self didSetFullHostURL];
    uint64_t v8 = [(DASettingsAccountsUIController *)self account];
    uint64_t v5 = v8;
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
    uint64_t v5 = [(DASettingsAccountsUIController *)self account];
    uint64_t v6 = [v5 username];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"PASSWORD"])
  {
    uint64_t v5 = [(DASettingsAccountsUIController *)self account];
    uint64_t v6 = [v5 passwordWithExpected:0];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"DESCRIPTION"])
  {
    uint64_t v5 = [(DASettingsAccountsUIController *)self account];
    uint64_t v6 = [v5 accountDescription];
    goto LABEL_13;
  }
  id v10 = 0;
LABEL_15:
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = &stru_26E020258;
  }
  uint64_t v12 = v11;

  return v12;
}

- (void)setAccountBooleanProperty:(id)a3 withSpecifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 BOOLValue];
  id v10 = [v6 identifier];

  uint64_t v8 = [v10 isEqualToString:@"USE_SSL"];
  if (v8)
  {
    BOOL v9 = [(DASettingsAccountsUIController *)self account];
    [v9 setUseSSL:v7];
  }
  [(DASettingsAccountsUIController *)self setNeedsSaveAndValidation:v8];
}

- (id)accountBooleanPropertyWithSpecifier:(id)a3
{
  id v4 = [a3 identifier];
  if ([v4 isEqualToString:@"USE_SSL"])
  {
    uint64_t v5 = [(DASettingsAccountsUIController *)self account];
    uint64_t v6 = [v5 useSSL];
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [NSNumber numberWithBool:v6];

  return v7;
}

- (void)_dismissAndUpdateParent
{
  [(ACUIViewController *)self removeParentSpecifier];

  [(ACUIViewController *)self dismissAnimated:1];
}

- (void)_deleteAccount
{
  [(ACUIViewController *)self setTaskCompletionAssertionEnabled:1];
  os_log_type_t v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_22CA3B000, v3, v4, "Requesting delete from ACAccountStore", v8, 2u);
  }

  uint64_t v5 = [(ACUIViewController *)self accountOperationsHelper];
  uint64_t v6 = [(DASettingsAccountsUIController *)self account];
  uint64_t v7 = [v6 backingAccountInfo];
  [v5 removeAccount:v7];
}

- (void)operationsHelper:(id)a3 didRemoveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = dataaccess_get_global_queue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__DASettingsAccountsUIController_operationsHelper_didRemoveAccount_withSuccess_error___block_invoke;
  block[3] = &unk_26492BCA0;
  BOOL v19 = v6;
  id v17 = v10;
  id v18 = self;
  id v14 = v10;
  dispatch_async(v13, block);

  v15.receiver = self;
  v15.super_class = (Class)DASettingsAccountsUIController;
  [(ACUIViewController *)&v15 operationsHelper:v12 didRemoveAccount:v11 withSuccess:v6 error:v14];
}

uint64_t __86__DASettingsAccountsUIController_operationsHelper_didRemoveAccount_withSuccess_error___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a1 + 48))
  {
    v2 = DALoggingwithCategory();
    os_log_type_t v3 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_22CA3B000, v2, v3, "Couldn't remove the account: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  [*(id *)(a1 + 40) setTaskCompletionAssertionEnabled:0];
  return [*(id *)(a1 + 40) performSelector:sel__dismissAndUpdateParent withObject:0 afterDelay:1.0];
}

- (void)_finishSaveAccountDismissWhenDone:(BOOL)a3
{
  BOOL v3 = a3;
  [(ACUIViewController *)self reloadParentSpecifier];
  [(ACUIViewController *)self setTaskCompletionAssertionEnabled:0];
  if (v3)
  {
    uint64_t v5 = [(DASettingsAccountsUIController *)self parentController];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v9 = [(DASettingsAccountsUIController *)self parentController];
      uint64_t v7 = [(DASettingsAccountsUIController *)self account];
      uint64_t v8 = [v7 backingAccountInfo];
      [v9 controller:self didFinishSettingUpAccount:v8];
    }
    else
    {
      [(ACUIViewController *)self dismissAnimated:1];
    }
  }
}

- (void)_saveAccountDismissWhenDone:(BOOL)a3
{
  BOOL v3 = a3;
  [(ACUIViewController *)self setTaskCompletionAssertionEnabled:1];
  if (v3)
  {
    uint64_t v5 = DALoggingwithCategory();
    os_log_type_t v6 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_22CA3B000, v5, v6, "Requesting account save from ACAccountStore", v11, 2u);
    }

    uint64_t v7 = [(DASettingsAccountsUIController *)self account];
    [v7 saveModifiedPropertiesOnBackingAccount];

    uint64_t v8 = [(ACUIViewController *)self accountOperationsHelper];
    id v9 = [(DASettingsAccountsUIController *)self account];
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
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__DASettingsAccountsUIController_operationsHelper_didSaveAccount_withSuccess_error___block_invoke;
  block[3] = &unk_26492BCA0;
  BOOL v19 = v6;
  id v17 = v10;
  id v18 = self;
  id v14 = v10;
  dispatch_async(v13, block);

  v15.receiver = self;
  v15.super_class = (Class)DASettingsAccountsUIController;
  [(ACUIViewController *)&v15 operationsHelper:v12 didSaveAccount:v11 withSuccess:v6 error:v14];
}

uint64_t __84__DASettingsAccountsUIController_operationsHelper_didSaveAccount_withSuccess_error___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 48);
  BOOL v3 = DALoggingwithCategory();
  uint64_t v4 = v3;
  if (v2)
  {
    os_log_type_t v5 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
    if (os_log_type_enabled(v3, v5))
    {
      LOWORD(v13) = 0;
      BOOL v6 = "ACAccountStore saved my account, dismissing";
      uint64_t v7 = v4;
      os_log_type_t v8 = v5;
      uint32_t v9 = 2;
LABEL_6:
      _os_log_impl(&dword_22CA3B000, v7, v8, v6, (uint8_t *)&v13, v9);
    }
  }
  else
  {
    int v10 = *(unsigned __int8 *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v3, *(os_log_type_t *)(MEMORY[0x263F38F90] + 3)))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v13 = 138412290;
      uint64_t v14 = v11;
      BOOL v6 = "Couldn't save the account: %@";
      uint64_t v7 = v4;
      os_log_type_t v8 = v10;
      uint32_t v9 = 12;
      goto LABEL_6;
    }
  }

  return [*(id *)(a1 + 40) _finishSaveAccountDismissWhenDone:1];
}

- (BOOL)isRunningFromMobileMailApp
{
  int v2 = [MEMORY[0x263F086E0] mainBundle];
  BOOL v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.mobilemail"];

  return v4;
}

- (void)hideProgressWithPrompt:(id)a3
{
  id v13 = a3;
  char v4 = [(DASettingsAccountsUIController *)self localizedAccountSetupTitleString];
  [(ACUIViewController *)self stopValidationWithPrompt:v4 showButtons:1];

  [(DASettingsAccountsUIController *)self updateDoneButton];
  if (![(DASettingsAccountsUIController *)self isRunningFromMobileMailApp]) {
    [(id)*MEMORY[0x263F1D020] setStatusBarShowsProgress:0];
  }
  os_log_type_t v5 = v13;
  if (v13)
  {
    BOOL v6 = (void *)MEMORY[0x263F1C3F8];
    uint64_t v7 = [(DASettingsAccountsUIController *)self localizedValidationFailureTitleString];
    os_log_type_t v8 = [v6 alertControllerWithTitle:v7 message:v13 preferredStyle:1];

    uint32_t v9 = (void *)MEMORY[0x263F1C3F0];
    int v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v11 = [v10 localizedStringForKey:@"OK" value:&stru_26E020258 table:@"Localizable"];
    id v12 = [v9 actionWithTitle:v11 style:0 handler:&__block_literal_global];

    [v8 addAction:v12];
    [(DASettingsAccountsUIController *)self presentViewController:v8 animated:1 completion:0];

    os_log_type_t v5 = v13;
  }
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)DASettingsAccountsUIController;
  [(ACUIViewController *)&v4 dealloc];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  os_log_type_t v5 = [MEMORY[0x263F1C408] sharedApplication];
  char v6 = [v5 isSuspended];

  uint64_t v7 = [(DASettingsAccountsUIController *)self rootController];
  char v8 = [v7 deallocating];

  uint32_t v9 = [(DASettingsAccountsUIController *)self rootController];
  int v10 = [v9 viewControllers];
  int v11 = [v10 containsObject:self];

  if ((v6 & 1) != 0 || (v8 & 1) != 0 || !v11)
  {
    if ([(ACUIViewController *)self validationInProgress])
    {
      [(DASettingsAccountsUIController *)self updateDoneButton];
      [(DASettingsAccountsUIController *)self hideProgressWithPrompt:0];
    }
    else if ([(DASettingsAccountsUIController *)self accountNeedsAdd])
    {
      id v12 = [(DASettingsAccountsUIController *)self account];
      [v12 cleanupAccountFiles];
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)DASettingsAccountsUIController;
  [(DASettingsAccountsUIController *)&v13 viewWillDisappear:v3];
}

- (int)indexOfCurrentlyEditingCell
{
  BOOL v3 = [(DASettingsAccountsUIController *)self currentlyEditingCell];
  if (v3
    && ([*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) indexPathForCell:v3], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    os_log_type_t v5 = (void *)v4;
    int v6 = [(DASettingsAccountsUIController *)self indexForIndexPath:v4];
  }
  else
  {
    int v6 = -1;
  }

  return v6;
}

- (id)currentlyEditingCell
{
  int v2 = [(DASettingsAccountsUIController *)self view];
  BOOL v3 = [v2 window];
  uint64_t v4 = [v3 firstResponder];

  id v5 = v4;
  int v6 = v5;
  if (v5)
  {
    uint64_t v7 = v5;
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

      uint64_t v7 = (void *)v8;
    }
    while (v8);
  }
  uint64_t v7 = 0;
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
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v5 = v4 + 1;
    int v6 = (int *)MEMORY[0x263F5FE10];
    while (1)
    {
      uint64_t v7 = [v3 objectAtIndexedSubscript:(v5 - 2)];
      uint64_t v8 = v7;
      if (!*(void *)&v7[*v6]) {
        break;
      }

      if ((unint64_t)--v5 <= 1) {
        goto LABEL_5;
      }
    }
  }

  return v8;
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
  id v3 = [(DASettingsAccountsUIController *)self account];
  int v4 = [v3 accountDescription];

  if ([v4 length])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(DASettingsAccountsUIController *)self localizedAccountSetupTitleString];
  }
  int v6 = v5;

  return v6;
}

- (void)deleteAccountButtonTapped
{
  id v3 = [(DASettingsAccountsUIController *)self account];
  int v4 = [v3 backingAccountInfo];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__DASettingsAccountsUIController_deleteAccountButtonTapped__block_invoke;
  v5[3] = &unk_26492BC78;
  v5[4] = self;
  [(ACUIViewController *)self showConfirmationForDeletingAccount:v4 completion:v5];
}

uint64_t __59__DASettingsAccountsUIController_deleteAccountButtonTapped__block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return [*(id *)(result + 32) _deleteAccount];
  }
  return result;
}

- (BOOL)accountIsManaged
{
  id v3 = [(DASettingsAccountsUIController *)self account];
  int v4 = [v3 backingAccountInfo];
  id v5 = [v4 managingOwnerIdentifier];

  if (v5) {
    return 1;
  }
  uint64_t v7 = [(DASettingsAccountsUIController *)self account];
  uint64_t v8 = [v7 backingAccountInfo];
  uint32_t v9 = [v8 mcBackingProfile];
  BOOL v6 = v9 != 0;

  return v6;
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