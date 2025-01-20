@interface CNFRegDisabledController
- (id)_rightButtonItem;
- (id)getAccountNameForSpecifier:(id)a3;
- (id)specifierList;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_activateSpinner;
- (void)_deactivateSpinner;
- (void)_setupAccountHandlersForDisabledOperation;
- (void)turnOnTapped:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CNFRegDisabledController

- (id)specifierList
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (v3) {
    goto LABEL_20;
  }
  uint64_t v26 = (int)*MEMORY[0x263F5FDB8];
  uint64_t v4 = 1496;
  turnOnButton = self->_turnOnButton;
  self->_turnOnButton = 0;

  spinner = self->_spinner;
  self->_spinner = 0;

  v7 = CNFRegLoadSpecifiersFromPlist(self, @"CNFRegDisabled", self);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v8) {
    goto LABEL_17;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v30;
  uint64_t v27 = *MEMORY[0x263F602D0];
  v28 = v7;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v30 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      v13 = [v12 identifier];
      int v14 = [v13 isEqual:@"FACETIME_DISABLED_SPINNER_ID"];

      if (v14)
      {
        v15 = v12;
        v16 = self->_spinner;
        self->_spinner = v15;
      }
      else
      {
        v17 = [v12 identifier];
        int v18 = [v17 isEqual:@"FACETIME_DISABLED_TURN_ON_ID"];

        if (v18)
        {
          v19 = v12;
          v16 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v4);
          *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v4) = v19;
        }
        else
        {
          v16 = [v12 identifier];
          if ([v16 isEqualToString:@"FACETIME_ACCOUNT_ID"])
          {
            int v20 = _os_feature_enabled_impl();

            if (!v20) {
              continue;
            }
            v21 = CommunicationsSetupUIBundle();
            CNFRegStringTableName();
            v23 = uint64_t v22 = v4;
            v16 = [v21 localizedStringForKey:@"\"FACETIME_SETTINGS_ACCOUNT_LABEL_APPLEACCOUNT\"" value:&stru_26D05D4F8 table:v23];

            uint64_t v4 = v22;
            v7 = v28;

            [v12 setProperty:v16 forKey:v27];
            [v12 setName:v16];
          }
        }
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  }
  while (v9);
LABEL_17:
  if (self->_spinner) {
    objc_msgSend(v7, "removeObjectAtIndex:", objc_msgSend(v7, "indexOfObject:"));
  }
  v24 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v26);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v26) = (Class)v7;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v26);
LABEL_20:
  return v3;
}

- (id)_rightButtonItem
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CNFRegDisabledController;
  uint64_t v4 = [(CNFRegDisabledController *)&v6 tableView:a3 cellForRowAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setSelectionStyle:1];
  }
  return v4;
}

- (void)_activateSpinner
{
  if (self->_spinner
    && self->_turnOnButton
    && -[CNFRegDisabledController containsSpecifier:](self, "containsSpecifier:"))
  {
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObject:self->_turnOnButton];
    v3 = [MEMORY[0x263EFF8C0] arrayWithObject:self->_spinner];
    [(CNFRegDisabledController *)self replaceContiguousSpecifiers:v4 withSpecifiers:v3 animated:1];
  }
}

- (void)_deactivateSpinner
{
  if (self->_turnOnButton
    && self->_spinner
    && -[CNFRegDisabledController containsSpecifier:](self, "containsSpecifier:"))
  {
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObject:self->_spinner];
    v3 = [MEMORY[0x263EFF8C0] arrayWithObject:self->_turnOnButton];
    [(CNFRegDisabledController *)self replaceContiguousSpecifiers:v4 withSpecifiers:v3 animated:1];
  }
}

- (void)turnOnTapped:(id)a3
{
  [(CNFRegDisabledController *)self _setupAccountHandlersForDisabledOperation];
  [(CNFRegDisabledController *)self _activateSpinner];
  id v4 = [(CNFRegListController *)self regController];
  [v4 activateAccounts];
}

- (void)_setupAccountHandlersForDisabledOperation
{
  v3 = [(CNFRegListController *)self regController];
  [v3 removeAllHandlers];
  objc_initWeak(&location, v3);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__CNFRegDisabledController__setupAccountHandlersForDisabledOperation__block_invoke;
  v4[3] = &unk_2644F10F0;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [v3 setAccountRegistrationBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __69__CNFRegDisabledController__setupAccountHandlersForDisabledOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v28 = a2;
  id v5 = a3;
  if ([v28 CNFRegSignInComplete])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setServiceEnabled:1];

    id v7 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v8 = [v7 accountState];

    [*(id *)(a1 + 32) dismissWithState:v8];
    [*(id *)(a1 + 32) _deactivateSpinner];
  }
  else if ([v28 CNFRegSignInFailed])
  {
    id v9 = objc_loadWeakRetained((id *)(a1 + 40));
    [v9 setServiceEnabled:1];

    uint64_t v10 = [CNFRegSignInController alloc];
    id v11 = objc_loadWeakRetained((id *)(a1 + 40));
    v12 = [(CNFRegFirstRunController *)v10 initWithRegController:v11];

    v13 = [*(id *)(a1 + 32) rootController];
    [(CNFRegSignInController *)v12 setRootController:v13];

    int v14 = [*(id *)(a1 + 32) rootController];
    [(CNFRegSignInController *)v12 setParentController:v14];

    v15 = [*(id *)(a1 + 32) delegate];
    [(CNFRegFirstRunController *)v12 setDelegate:v15];

    v16 = [*(id *)(a1 + 32) rootController];
    [v16 showController:v12];

    [*(id *)(a1 + 32) _deactivateSpinner];
  }
  if (v5)
  {
    [*(id *)(a1 + 32) _deactivateSpinner];
    v17 = [*(id *)(a1 + 32) regController];
    int v18 = [v17 shouldShowAlertForError:v5];

    if (v18)
    {
      v19 = CommunicationsSetupUIBundle();
      int v20 = CNFRegStringTableName();
      v21 = [v19 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_TITLE" value:&stru_26D05D4F8 table:v20];

      uint64_t v22 = [v5 localizedDescription];
      v23 = CommunicationsSetupUIBundle();
      v24 = CNFRegStringTableName();
      v25 = [v23 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v24];

      uint64_t v26 = [MEMORY[0x263F82418] alertControllerWithTitle:v21 message:v22 preferredStyle:1];
      uint64_t v27 = [MEMORY[0x263F82400] actionWithTitle:v25 style:0 handler:0];
      [v26 addAction:v27];

      [*(id *)(a1 + 32) presentViewController:v26 animated:1 completion:0];
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CNFRegDisabledController *)self _deactivateSpinner];
  v5.receiver = self;
  v5.super_class = (Class)CNFRegDisabledController;
  [(CNFRegFirstRunController *)&v5 viewWillDisappear:v3];
}

- (id)getAccountNameForSpecifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [(CNFRegListController *)self regController];
  int v4 = _os_feature_enabled_impl();
  objc_super v5 = CommunicationsSetupUIBundle();
  objc_super v6 = CNFRegStringTableName();
  if (v4) {
    id v7 = @"FACETIME_ACCOUNT_INFO_UNAVAILABLE_APPLEACCOUNT";
  }
  else {
    id v7 = @"FACETIME_ACCOUNT_INFO_UNAVAILABLE";
  }
  uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_26D05D4F8 table:v6];

  memset(v12, 0, sizeof(v12));
  id v9 = objc_msgSend(v3, "appleIDAccounts", 0);
  if ([v9 countByEnumeratingWithState:v12 objects:v13 count:16])
  {
    uint64_t v10 = [**((id **)&v12[0] + 1) loginDisplayString];

    uint64_t v8 = (void *)v10;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnOnButton, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end