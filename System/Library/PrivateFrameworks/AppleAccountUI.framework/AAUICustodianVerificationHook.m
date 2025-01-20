@interface AAUICustodianVerificationHook
- (AAUICustodianVerificationHook)initWithAccountManager:(id)a3;
- (BOOL)_shouldPresentInline;
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (void)_cancelFlow;
- (void)_dismissUI;
- (void)_displayCustodianFetchErrorAlert;
- (void)_displayListOfCustodiansWithContacts:(id)a3;
- (void)_processAttributes:(id)a3;
- (void)_verifyCustodianWithServerAttributes:(id)a3 completion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)tableWelcomeViewControllerDidTapPrimaryButton;
- (void)tableWelcomeViewControllerDidTapSecondaryButton;
@end

@implementation AAUICustodianVerificationHook

- (AAUICustodianVerificationHook)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUICustodianVerificationHook;
  v6 = [(AAUICustodianVerificationHook *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountManager, a3);
  }

  return v7;
}

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"custodian:verify"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  char v4 = [v3 objectForKey:*MEMORY[0x263F63818]];
  char v5 = [v4 isEqualToString:@"custodian:verify"];

  return v5;
}

- (void)_processAttributes:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F63828]];

  id v7 = v5;
  if (objc_opt_isKindOfClass()) {
    id v6 = v7;
  }
  else {
    id v6 = 0;
  }

  self->_forceInline = [v6 BOOLValue];
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a3;
  [(AAUICustodianVerificationHook *)self _processAttributes:a4];
  id v11 = [v10 name];

  [(AAUICustodianVerificationHook *)self _verifyCustodianWithServerAttributes:v11 completion:v9];
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 clientInfo];
  [(AAUICustodianVerificationHook *)self _processAttributes:v8];

  id v10 = [v7 clientInfo];

  id v9 = [v10 objectForKeyedSubscript:@"custodian:verify"];
  [(AAUICustodianVerificationHook *)self _verifyCustodianWithServerAttributes:v9 completion:v6];
}

- (void)_verifyCustodianWithServerAttributes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AAUICustodianVerificationHook _verifyCustodianWithServerAttributes:completion:]((uint64_t)v6, v8);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v10 = [WeakRetained presentationContextForHook:self];
  presentingViewController = self->_presentingViewController;
  self->_presentingViewController = v10;

  objc_initWeak(&location, self);
  v12 = objc_alloc_init(AAUIContactsProvider);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __81__AAUICustodianVerificationHook__verifyCustodianWithServerAttributes_completion___block_invoke;
  v14[3] = &unk_263F93768;
  objc_copyWeak(&v16, &location);
  id v13 = v7;
  v14[4] = self;
  id v15 = v13;
  [(AAContactsProvider *)v12 fetchMyWalrusEligibleCustodians:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __81__AAUICustodianVerificationHook__verifyCustodianWithServerAttributes_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (a3)
  {
    id v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __81__AAUICustodianVerificationHook__verifyCustodianWithServerAttributes_completion___block_invoke_cold_2();
    }

    if (WeakRetained)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __81__AAUICustodianVerificationHook__verifyCustodianWithServerAttributes_completion___block_invoke_38;
      block[3] = &unk_263F92168;
      block[4] = WeakRetained;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F25638];
    uint64_t v11 = -7000;
LABEL_7:
    v12 = [v9 errorWithDomain:v10 code:v11 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v12);

    goto LABEL_8;
  }
  if (![v5 count])
  {
    v17 = _AAUILogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __81__AAUICustodianVerificationHook__verifyCustodianWithServerAttributes_completion___block_invoke_cold_1();
    }

    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F25638];
    uint64_t v11 = -7003;
    goto LABEL_7;
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (WeakRetained)
  {
    uint64_t v14 = [*(id *)(a1 + 40) copy];
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = *(void **)(v15 + 8);
    *(void *)(v15 + 8) = v14;

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __81__AAUICustodianVerificationHook__verifyCustodianWithServerAttributes_completion___block_invoke_41;
    v19[3] = &unk_263F926B8;
    v19[4] = WeakRetained;
    id v20 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v19);
  }
  else
  {
    v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F25638] code:-7000 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v18);
  }
LABEL_8:
}

uint64_t __81__AAUICustodianVerificationHook__verifyCustodianWithServerAttributes_completion___block_invoke_38(uint64_t a1)
{
  return [*(id *)(a1 + 32) _displayCustodianFetchErrorAlert];
}

uint64_t __81__AAUICustodianVerificationHook__verifyCustodianWithServerAttributes_completion___block_invoke_41(uint64_t a1)
{
  return [*(id *)(a1 + 32) _displayListOfCustodiansWithContacts:*(void *)(a1 + 40)];
}

- (void)_displayCustodianFetchErrorAlert
{
  v3 = (void *)MEMORY[0x263F82418];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"CANNOT_ADD_ADP_ALERT_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"ERROR_DISPLAYING_HEALTHY_CUSTODIANS" value:&stru_26BD39CD8 table:@"Localizable"];
  id v11 = [v3 alertWithTitle:v5 message:v7];

  uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"OK" value:&stru_26BD39CD8 table:@"Localizable"];

  uint64_t v10 = [MEMORY[0x263F82400] actionWithTitle:v9 style:0 handler:&__block_literal_global_14];
  [v11 addAction:v10];

  [(UIViewController *)self->_presentingViewController presentViewController:v11 animated:1 completion:0];
}

void __65__AAUICustodianVerificationHook__displayCustodianFetchErrorAlert__block_invoke()
{
  v0 = _AAUILogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_209754000, v0, OS_LOG_TYPE_DEFAULT, "User tapped on OK button of custodian error alert.", v1, 2u);
  }
}

- (void)_displayListOfCustodiansWithContacts:(id)a3
{
  id v4 = a3;
  uint64_t v14 = [[AAUICustodiansListViewController alloc] initWithContacts:v4];

  id v5 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelFlow];
  id v6 = [(OBBaseWelcomeController *)v14 navigationItem];
  [v6 setLeftBarButtonItem:v5];

  [(AAUIOBTableWelcomeController *)v14 setDelegate:self];
  id v7 = [AAUINavigationItemSpinnerController alloc];
  uint64_t v8 = [(OBBaseWelcomeController *)v14 navigationItem];
  id v9 = [(AAUINavigationItemSpinnerController *)v7 initWithNavigationItem:v8 hideBackButton:1];
  spinnerController = self->_spinnerController;
  self->_spinnerController = v9;

  if ([(AAUICustodianVerificationHook *)self _shouldPresentInline])
  {
    [(UIViewController *)self->_presentingViewController showViewController:v14 sender:self];
  }
  else
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v14];
    v12 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v13 = [v12 userInterfaceIdiom];

    if (v13 == 1) {
      [v11 setModalPresentationStyle:2];
    }
    [(UIViewController *)self->_presentingViewController presentViewController:v11 animated:1 completion:0];
  }
}

- (void)_cancelFlow
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "AAUICustodianVerificationHook: user tapped cancel button", v2, v3, v4, v5, v6);
}

- (BOOL)_shouldPresentInline
{
  return (objc_opt_isKindOfClass() & 1) != 0 && self->_forceInline;
}

- (void)_dismissUI
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_209754000, a2, OS_LOG_TYPE_DEBUG, "Dismissing custodian verification UI, was modally presented: %d", (uint8_t *)v2, 8u);
}

- (void)tableWelcomeViewControllerDidTapPrimaryButton
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "tableWelcomeViewControllerDidTapPrimaryButton: user tapped continue button", v2, v3, v4, v5, v6);
}

- (void)tableWelcomeViewControllerDidTapSecondaryButton
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "tableWelcomeViewControllerDidTapSecondaryButton: user tapped Manage recovery contacts button", v2, v3, v4, v5, v6);
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_spinnerController, 0);
  objc_storeStrong(&self->_hookCompletion, 0);
}

- (void)_verifyCustodianWithServerAttributes:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_209754000, a2, OS_LOG_TYPE_DEBUG, "custodian action received - %@, getting custodians", (uint8_t *)&v2, 0xCu);
}

void __81__AAUICustodianVerificationHook__verifyCustodianWithServerAttributes_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_209754000, v0, OS_LOG_TYPE_ERROR, "AAUICustodianVerificationHook: No custodians found, returning early.", v1, 2u);
}

void __81__AAUICustodianVerificationHook__verifyCustodianWithServerAttributes_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_209754000, v0, OS_LOG_TYPE_ERROR, "AAUICustodianVerificationHook: Error occurred in fetching custodians, displaying alert and returning early.", v1, 2u);
}

@end