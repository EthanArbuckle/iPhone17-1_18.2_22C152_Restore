@interface AAUIMyCustodianActionHandler
- (AALocalContactInfo)contact;
- (AAUIMyCustodianActionHandler)initWithAccountManager:(id)a3 localContact:(id)a4;
- (BOOL)_isWalrusEnabled;
- (id)_recoveryFactorController;
- (void)_addRecoveryContact;
- (void)_checkRecoveryContactAndRecoveryKeyStatus:(id)a3;
- (void)_continueDoingDestructiveAction:(id)a3 specifier:(id)a4 account:(id)a5;
- (void)_dismissAndPopFromRecoveryContactRemovedScreen;
- (void)_dismissAndStartHealthCheck;
- (void)_dismissRecoveryContactRemovedScreenWithCompletion:(id)a3;
- (void)_displayCustodianDeleteNotAllowedAlert;
- (void)_displayRatchetGenericErrorAlert;
- (void)_doCustodianRemove;
- (void)_isWalrusEnabled;
- (void)_performHealthCheck;
- (void)_popToAccountRecoveryScreen;
- (void)_setupRecoveryKey;
- (void)_stopSpinners;
- (void)_updateUIAfterDeleteWithHasRecoveryContact:(BOOL)a3 hasRecoveryKey:(BOOL)a4;
- (void)doDestructiveAction:(id)a3 specifier:(id)a4;
@end

@implementation AAUIMyCustodianActionHandler

- (AAUIMyCustodianActionHandler)initWithAccountManager:(id)a3 localContact:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AAUIMyCustodianActionHandler;
  v9 = [(AAUIMyCustodianActionHandler *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contact, a4);
    objc_storeStrong((id *)&v10->_accountManager, a3);
    uint64_t v11 = objc_opt_new();
    spinnerManager = v10->_spinnerManager;
    v10->_spinnerManager = (AAUISpinnerManager *)v11;

    id v13 = objc_alloc_init(MEMORY[0x263F29198]);
    v14 = [[AAUIDTOHelper alloc] initWithDTOController:v13];
    dtoHelper = v10->_dtoHelper;
    v10->_dtoHelper = v14;
  }
  return v10;
}

- (void)doDestructiveAction:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AIDAAccountManager *)self->_accountManager accounts];
  v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  if (v9)
  {
    dtoHelper = self->_dtoHelper;
    uint64_t v11 = objc_msgSend(v9, "aa_altDSID");
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke;
    v13[3] = &unk_263F94190;
    v13[4] = self;
    id v14 = v6;
    id v15 = v7;
    id v16 = v9;
    [(AAUIDTOHelper *)dtoHelper shouldGateUsingRatchetForAltDSID:v11 completion:v13];
  }
  else
  {
    v12 = _AAUILogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[AAUIRecoveryFactorController startAddingRecoveryContact]();
    }
  }
}

void __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = _AAUILogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_cold_2();
    }

    if ([*(id *)(*(void *)(a1 + 32) + 48) isDTOGatingEnabled])
    {
      v4 = _AAUILogSystem();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_cold_1();
      }

      v5 = [*(id *)(*(void *)(a1 + 32) + 48) makeRatchetContextWithPresentationContext:*(void *)(*(void *)(a1 + 32) + 32) DTOContextType:2];
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(void **)(v6 + 48);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_36;
      v14[3] = &unk_263F94168;
      v14[4] = v6;
      id v15 = *(id *)(a1 + 40);
      id v16 = *(id *)(a1 + 48);
      id v17 = *(id *)(a1 + 56);
      [v7 shouldAllowOpForContext:v5 completion:v14];
    }
    else
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_2;
      v10[3] = &unk_263F94140;
      id v8 = *(void **)(a1 + 40);
      v10[4] = *(void *)(a1 + 32);
      id v11 = v8;
      id v12 = *(id *)(a1 + 48);
      id v13 = *(id *)(a1 + 56);
      dispatch_async(MEMORY[0x263EF83A0], v10);
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_40;
    block[3] = &unk_263F92168;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_36(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_35_cold_1(a2, (uint64_t)v5, v6);
  }

  if (a2)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_37;
    v8[3] = &unk_263F94140;
    id v7 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x263EF83A0], v8);
  }
}

uint64_t __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_37(uint64_t a1)
{
  return [*(id *)(a1 + 32) _continueDoingDestructiveAction:*(void *)(a1 + 40) specifier:*(void *)(a1 + 48) account:*(void *)(a1 + 56)];
}

uint64_t __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_2(uint64_t a1)
{
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_2_cold_1();
  }

  return [*(id *)(a1 + 32) _continueDoingDestructiveAction:*(void *)(a1 + 40) specifier:*(void *)(a1 + 48) account:*(void *)(a1 + 56)];
}

uint64_t __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_40(uint64_t a1)
{
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_39_cold_1();
  }

  return [*(id *)(a1 + 32) _displayCustodianDeleteNotAllowedAlert];
}

- (void)_continueDoingDestructiveAction:(id)a3 specifier:(id)a4 account:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _AAUILogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(AALocalContactInfo *)self->_contact handle];
    *(_DWORD *)buf = 138412290;
    v22 = v12;
    _os_log_impl(&dword_209754000, v11, OS_LOG_TYPE_DEFAULT, "Removing custodian %@.", buf, 0xCu);
  }
  spinnerManager = self->_spinnerManager;
  id v14 = [v9 identifier];
  [(AAUISpinnerManager *)spinnerManager startSpinnerInSpecifier:v9 forKey:v14];

  objc_initWeak((id *)buf, self);
  BOOL v15 = [(AAUIMyCustodianActionHandler *)self _isWalrusEnabled];
  id v16 = objc_opt_new();
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __82__AAUIMyCustodianActionHandler__continueDoingDestructiveAction_specifier_account___block_invoke;
  v18[3] = &unk_263F941B8;
  objc_copyWeak(&v20, (id *)buf);
  v18[4] = self;
  id v17 = v8;
  id v19 = v17;
  objc_msgSend(v16, "aaui_authenticateAccount:forceInteraction:presentingViewController:completion:", v10, v15, v17, v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

void __82__AAUIMyCustodianActionHandler__continueDoingDestructiveAction_specifier_account___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = _AAUILogSystem();
  id v8 = v7;
  if (!a2 || v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __82__AAUIMyCustodianActionHandler__continueDoingDestructiveAction_specifier_account___block_invoke_cold_1();
    }

    [WeakRetained _stopSpinners];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Authentication successful, continue removing custodian...", v9, 2u);
    }

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
    [WeakRetained _doCustodianRemove];
  }
}

- (void)_doCustodianRemove
{
  objc_initWeak(&location, self);
  v3 = objc_opt_new();
  v4 = [(AALocalContactInfo *)self->_contact custodianID];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__AAUIMyCustodianActionHandler__doCustodianRemove__block_invoke;
  v5[3] = &unk_263F92BC8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  [v3 removeCustodian:v4 completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __50__AAUIMyCustodianActionHandler__doCustodianRemove__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    id v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __50__AAUIMyCustodianActionHandler__doCustodianRemove__block_invoke_cold_1();
    }

    [WeakRetained _stopSpinners];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__AAUIMyCustodianActionHandler__doCustodianRemove__block_invoke_45;
    block[3] = &unk_263F94208;
    block[4] = *(void *)(a1 + 32);
    objc_copyWeak(&v7, (id *)(a1 + 40));
    void block[5] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v7);
  }
}

void __50__AAUIMyCustodianActionHandler__doCustodianRemove__block_invoke_45(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isWalrusEnabled])
  {
    v2 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __50__AAUIMyCustodianActionHandler__doCustodianRemove__block_invoke_2;
    v5[3] = &unk_263F941E0;
    objc_copyWeak(&v6, (id *)(a1 + 48));
    [v2 _checkRecoveryContactAndRecoveryKeyStatus:v5];
    objc_destroyWeak(&v6);
  }
  else
  {
    [*(id *)(*(void *)(a1 + 40) + 8) stopAllSpinners];
    id v4 = [*(id *)(*(void *)(a1 + 32) + 32) navigationController];
    id v3 = (id)[v4 popViewControllerAnimated:1];
  }
}

void __50__AAUIMyCustodianActionHandler__doCustodianRemove__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    [WeakRetained _updateUIAfterDeleteWithHasRecoveryContact:a2 hasRecoveryKey:a3];
    id WeakRetained = v6;
  }
}

- (id)_recoveryFactorController
{
  recoveryFactorController = self->_recoveryFactorController;
  if (!recoveryFactorController)
  {
    id v4 = [[AAUIRecoveryFactorController alloc] initWithAccountManager:self->_accountManager presentingViewController:self->_presentingViewController];
    id v5 = self->_recoveryFactorController;
    self->_recoveryFactorController = v4;

    [(AAUIRecoveryFactorController *)self->_recoveryFactorController setDelegate:self];
    [(AAUIRecoveryFactorController *)self->_recoveryFactorController setForceInlinePresentation:0];
    recoveryFactorController = self->_recoveryFactorController;
  }
  return recoveryFactorController;
}

- (BOOL)_isWalrusEnabled
{
  id v2 = objc_alloc_init(MEMORY[0x263F34408]);
  id v8 = 0;
  uint64_t v3 = [v2 walrusStatus:&v8];
  id v4 = v8;
  if (v4)
  {
    id v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[AAUIMyCustodianActionHandler _isWalrusEnabled]();
    }

    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = v3 == 1;
  }

  return v6;
}

- (void)_dismissAndPopFromRecoveryContactRemovedScreen
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __78__AAUIMyCustodianActionHandler__dismissAndPopFromRecoveryContactRemovedScreen__block_invoke;
  v2[3] = &unk_263F92168;
  v2[4] = self;
  [(AAUIMyCustodianActionHandler *)self _dismissRecoveryContactRemovedScreenWithCompletion:v2];
}

uint64_t __78__AAUIMyCustodianActionHandler__dismissAndPopFromRecoveryContactRemovedScreen__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _popToAccountRecoveryScreen];
}

- (void)_performHealthCheck
{
  id v2 = objc_alloc_init(MEMORY[0x263F257E8]);
  [v2 startHealthCheckWithCompletion:&__block_literal_global_20];
}

void __51__AAUIMyCustodianActionHandler__performHealthCheck__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = _AAUILogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __115__AAUIRecoveryFactorController__handleRecoveryKeyOperationResultWithSuccess_error_operationDescription_completion___block_invoke_cold_1();
    }
  }
}

- (void)_dismissAndStartHealthCheck
{
  [(AAUIMyCustodianActionHandler *)self _dismissAndPopFromRecoveryContactRemovedScreen];
  [(AAUIMyCustodianActionHandler *)self _performHealthCheck];
}

- (void)_popToAccountRecoveryScreen
{
  id v3 = [(UIViewController *)self->_presentingViewController navigationController];
  id v2 = (id)[v3 popViewControllerAnimated:0];
}

- (void)_dismissRecoveryContactRemovedScreenWithCompletion:(id)a3
{
  id v4 = a3;
  recoveryContactRemovedNavigationController = self->_recoveryContactRemovedNavigationController;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__AAUIMyCustodianActionHandler__dismissRecoveryContactRemovedScreenWithCompletion___block_invoke;
  v7[3] = &unk_263F920E8;
  id v8 = v4;
  id v6 = v4;
  [(OBNavigationController *)recoveryContactRemovedNavigationController dismissViewControllerAnimated:1 completion:v7];
}

uint64_t __83__AAUIMyCustodianActionHandler__dismissRecoveryContactRemovedScreenWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_addRecoveryContact
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __51__AAUIMyCustodianActionHandler__addRecoveryContact__block_invoke;
  v2[3] = &unk_263F92168;
  v2[4] = self;
  [(AAUIMyCustodianActionHandler *)self _dismissRecoveryContactRemovedScreenWithCompletion:v2];
}

void __51__AAUIMyCustodianActionHandler__addRecoveryContact__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _recoveryFactorController];
  [v1 startAddingRecoveryContact];
}

- (void)_setupRecoveryKey
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __49__AAUIMyCustodianActionHandler__setupRecoveryKey__block_invoke;
  v2[3] = &unk_263F92168;
  v2[4] = self;
  [(AAUIMyCustodianActionHandler *)self _dismissRecoveryContactRemovedScreenWithCompletion:v2];
}

void __49__AAUIMyCustodianActionHandler__setupRecoveryKey__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = [*(id *)(a1 + 32) _recoveryFactorController];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__AAUIMyCustodianActionHandler__setupRecoveryKey__block_invoke_2;
  v3[3] = &unk_263F93B20;
  objc_copyWeak(&v4, &location);
  [v2 generateRecoveryKeyWithCompletion:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __49__AAUIMyCustodianActionHandler__setupRecoveryKey__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4)
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __49__AAUIMyCustodianActionHandler__setupRecoveryKey__block_invoke_2_cold_1();
    }
  }
  [WeakRetained _popToAccountRecoveryScreen];
}

- (void)_checkRecoveryContactAndRecoveryKeyStatus:(id)a3
{
  id v3 = a3;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  id v4 = objc_opt_new();
  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __74__AAUIMyCustodianActionHandler__checkRecoveryContactAndRecoveryKeyStatus___block_invoke;
  v17[3] = &unk_263F94230;
  id v19 = v22;
  id v6 = v5;
  v18 = v6;
  [v4 fetchMyHealthyCustodians:v17];
  id v7 = objc_opt_new();
  dispatch_group_enter(v6);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74__AAUIMyCustodianActionHandler__checkRecoveryContactAndRecoveryKeyStatus___block_invoke_2;
  v14[3] = &unk_263F94258;
  id v16 = v20;
  id v8 = v6;
  BOOL v15 = v8;
  [v7 isWalrusRecoveryKeyAvailableWithCompletion:v14];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__AAUIMyCustodianActionHandler__checkRecoveryContactAndRecoveryKeyStatus___block_invoke_53;
  block[3] = &unk_263F94280;
  id v11 = v3;
  id v12 = v22;
  id v13 = v20;
  id v9 = v3;
  dispatch_group_notify(v8, MEMORY[0x263EF83A0], block);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
}

void __74__AAUIMyCustodianActionHandler__checkRecoveryContactAndRecoveryKeyStatus___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 count] != 0;
  id v3 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v3);
}

void __74__AAUIMyCustodianActionHandler__checkRecoveryContactAndRecoveryKeyStatus___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __74__AAUIMyCustodianActionHandler__checkRecoveryContactAndRecoveryKeyStatus___block_invoke_2_cold_1();
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __74__AAUIMyCustodianActionHandler__checkRecoveryContactAndRecoveryKeyStatus___block_invoke_53(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24));
}

- (void)_updateUIAfterDeleteWithHasRecoveryContact:(BOOL)a3 hasRecoveryKey:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(AAUISpinnerManager *)self->_spinnerManager stopAllSpinners];
  id v19 = [[AAUIWalrusRecoveryContactRemovedScreenModel alloc] initWithHasRecoveryContact:v5 hasRecoveryKey:v4];
  id v7 = [[AAUIOBWelcomeController alloc] initWithViewModel:v19];
  id v8 = v7;
  if (v5 || v4)
  {
    BOOL v15 = [(AAUIOBWelcomeController *)v7 primaryButton];
    [v15 addTarget:self action:sel__dismissAndPopFromRecoveryContactRemovedScreen forControlEvents:64];

    id v14 = [(OBBaseWelcomeController *)v8 navigationItem];
    [v14 setHidesBackButton:1];
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x263F824A8]);
    id v10 = [(AAWalrusRecoveryContactRemovedScreenModel *)v19 leftBarButton];
    id v11 = (void *)[v9 initWithTitle:v10 style:0 target:self action:sel__dismissAndStartHealthCheck];
    id v12 = [(OBBaseWelcomeController *)v8 navigationItem];
    [v12 setLeftBarButtonItem:v11];

    id v13 = [(AAUIOBWelcomeController *)v8 primaryButton];
    [v13 addTarget:self action:sel__addRecoveryContact forControlEvents:64];

    id v14 = [(AAUIOBWelcomeController *)v8 secondaryButton];
    [v14 addTarget:self action:sel__setupRecoveryKey forControlEvents:64];
  }

  id v16 = (OBNavigationController *)[objc_alloc(MEMORY[0x263F5B8E0]) initWithRootViewController:v8];
  recoveryContactRemovedNavigationController = self->_recoveryContactRemovedNavigationController;
  self->_recoveryContactRemovedNavigationController = v16;

  v18 = [(UIViewController *)self->_presentingViewController navigationController];
  [v18 presentViewController:self->_recoveryContactRemovedNavigationController animated:1 completion:0];
}

- (void)_stopSpinners
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __45__AAUIMyCustodianActionHandler__stopSpinners__block_invoke;
  v2[3] = &unk_263F92AB8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __45__AAUIMyCustodianActionHandler__stopSpinners__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[1] stopAllSpinners];
}

- (void)_displayCustodianDeleteNotAllowedAlert
{
  id v3 = [(AAUIDTOHelper *)self->_dtoHelper makeCustodianDeleteOpNotAllowedAlert];
  [(UIViewController *)self->_presentingViewController presentViewController:v3 animated:1 completion:0];
}

- (void)_displayRatchetGenericErrorAlert
{
  id v3 = [(AAUIDTOHelper *)self->_dtoHelper makeGenericRatchetFailedAlert];
  [(UIViewController *)self->_presentingViewController presentViewController:v3 animated:1 completion:0];
}

- (AALocalContactInfo)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_dtoHelper, 0);
  objc_storeStrong((id *)&self->_recoveryFactorController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_recoveryContactRemovedNavigationController, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_spinnerManager, 0);
}

void __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "DTO enabled, IdMS says RC delete is allowed, proceeding to ratchet auth", v2, v3, v4, v5, v6);
}

void __62__AAUIMyCustodianActionHandler_doDestructiveAction_specifier___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "IdMS says RC delete is allowed on this device, proceeding to check if DTO is enabled", v2, v3, v4, v5, v6);
}

void __82__AAUIMyCustodianActionHandler__continueDoingDestructiveAction_specifier_account___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Unable to authenticate: %@", v2, v3, v4, v5, v6);
}

void __50__AAUIMyCustodianActionHandler__doCustodianRemove__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Error removing Custodian - %@", v2, v3, v4, v5, v6);
}

- (void)_isWalrusEnabled
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Error while fetching walrus status: %@", v2, v3, v4, v5, v6);
}

void __49__AAUIMyCustodianActionHandler__setupRecoveryKey__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Error generating recovery key - %@", v2, v3, v4, v5, v6);
}

void __74__AAUIMyCustodianActionHandler__checkRecoveryContactAndRecoveryKeyStatus___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Error determining recovery key state: %@", v2, v3, v4, v5, v6);
}

@end