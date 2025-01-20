@interface FACreateChildController
- (ACAccount)appleAccount;
- (FACreateChildController)initWithAppleAccount:(id)a3;
- (FACreateChildControllerDelegate)delegate;
- (FANavigationController)navController;
- (UIViewController)presentingViewController;
- (id)_createChildAuthContext;
- (id)_repairAuthContextWithAuthResults:(id)a3;
- (id)_repairFAContextWithAuthResults:(id)a3;
- (id)_repairParametersFromAuthResults:(id)a3;
- (void)_dismissPresentedViewControllerWithCompletion:(id)a3;
- (void)_setupPresentedViewController;
- (void)createChildAccountWithCompletion:(id)a3;
- (void)navigationController:(id)a3 didPresentInitialViewController:(id)a4;
- (void)navigationController:(id)a3 presentViewController:(id)a4;
- (void)repairChildAccountWithAuthenticationResults:(id)a3 completion:(id)a4;
- (void)setAppleAccount:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNavController:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation FACreateChildController

- (FACreateChildController)initWithAppleAccount:(id)a3
{
  id v5 = a3;
  v6 = [(FACreateChildController *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appleAccount, a3);
  }

  return v7;
}

- (void)createChildAccountWithCompletion:(id)a3
{
  id v4 = a3;
  [(FACreateChildController *)self _setupPresentedViewController];
  id v5 = [(FACreateChildController *)self _createChildAuthContext];
  id v6 = objc_alloc_init(MEMORY[0x263F29118]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__FACreateChildController_createChildAccountWithCompletion___block_invoke;
  v8[3] = &unk_264348F80;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 authenticateWithContext:v5 completion:v8];
}

void __60__FACreateChildController_createChildAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _FALogSystem();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __60__FACreateChildController_createChildAccountWithCompletion___block_invoke_cold_2();
    }

    [*(id *)(a1 + 32) repairChildAccountWithAuthenticationResults:v5 completion:*(void *)(a1 + 40)];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__FACreateChildController_createChildAccountWithCompletion___block_invoke_cold_1((uint64_t)v6, v8);
    }

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __60__FACreateChildController_createChildAccountWithCompletion___block_invoke_34;
    v10[3] = &unk_264348F58;
    id v9 = *(void **)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    id v11 = v6;
    [v9 _dismissPresentedViewControllerWithCompletion:v10];
  }
}

void __60__FACreateChildController_createChildAccountWithCompletion___block_invoke_34(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(MEMORY[0x263F087E8], "fa_familyErrorWithCode:underlyingError:", -1006, *(void *)(a1 + 32));
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

- (void)repairChildAccountWithAuthenticationResults:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(FACreateChildController *)self _setupPresentedViewController];
  v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[FACreateChildController repairChildAccountWithAuthenticationResults:completion:]();
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke;
  aBlock[3] = &unk_264348FA8;
  id v9 = v7;
  id v24 = v9;
  v10 = _Block_copy(aBlock);
  id v11 = [(FACreateChildController *)self _repairFAContextWithAuthResults:v6];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = [[FACircleStateController alloc] initWithPresenter:self->_navController];
  id v12 = (void *)v18[5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke_40;
  v14[3] = &unk_264349048;
  v16 = &v17;
  v14[4] = self;
  id v13 = v10;
  id v15 = v13;
  [v12 performOperationWithContext:v11 completion:v14];

  _Block_object_dispose(&v17, 8);
}

uint64_t __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke_40(void *a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke_40_cold_1(a2, (uint64_t)v5, v8);
  }

  id v9 = (void *)MEMORY[0x263F3BF10];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke_48;
  v11[3] = &unk_264349020;
  v10 = (void *)a1[5];
  v11[4] = a1[4];
  id v12 = v10;
  char v13 = a2;
  [v9 handleDidSetupFamilyWithCompletion:v11];
}

void __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke_48(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke_2;
  v8[3] = &unk_264348FF8;
  id v5 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v6 = v5;
  char v11 = *(unsigned char *)(a1 + 48);
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke_3;
  v3[3] = &unk_264348FD0;
  id v5 = *(id *)(a1 + 48);
  char v6 = *(unsigned char *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  [v2 _dismissPresentedViewControllerWithCompletion:v3];
}

uint64_t __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (id)_createChildAuthContext
{
  id v3 = objc_alloc_init(MEMORY[0x263F292A8]);
  id v4 = [(ACAccount *)self->_appleAccount aa_altDSID];
  [v3 setAltDSID:v4];

  id v5 = [(ACAccount *)self->_appleAccount username];
  [v3 setUsername:v5];

  [v3 setIsUsernameEditable:0];
  [v3 setNeedsNewChildAccount:1];
  [v3 setAppProvidedContext:@"parent"];
  [v3 setServiceType:1];
  [v3 setPresentingViewController:self->_navController];
  [v3 setForceInlinePresentation:1];
  return v3;
}

- (void)_setupPresentedViewController
{
  if (!self->_navController)
  {
    id v3 = objc_alloc_init(FANavigationController);
    navController = self->_navController;
    self->_navController = v3;

    [(FANavigationController *)self->_navController setFamilyDelegate:self];
    id v5 = self->_navController;
    char v6 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = -2;
    }
    [(FANavigationController *)v5 setModalPresentationStyle:v8];
  }
}

- (void)_dismissPresentedViewControllerWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = [(FANavigationController *)self->_navController presentingViewController];

  if (v5)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __73__FACreateChildController__dismissPresentedViewControllerWithCompletion___block_invoke;
    v6[3] = &unk_264349070;
    v6[4] = self;
    uint64_t v7 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
  else
  {
    v4[2](v4);
  }
}

void __73__FACreateChildController__dismissPresentedViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentingViewController];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __73__FACreateChildController__dismissPresentedViewControllerWithCompletion___block_invoke_2;
  v3[3] = &unk_264348EC0;
  id v4 = *(id *)(a1 + 40);
  [v2 dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __73__FACreateChildController__dismissPresentedViewControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_repairFAContextWithAuthResults:(id)a3
{
  id v4 = a3;
  id v5 = [[FACircleContext alloc] initWithEventType:@"FACircleEventTypeFamilyRepair"];
  char v6 = [(FACreateChildController *)self _repairParametersFromAuthResults:v4];
  [(FACircleContext *)v5 setAdditionalParameters:v6];

  uint64_t v7 = [(FACreateChildController *)self _repairAuthContextWithAuthResults:v4];

  [(FACircleContext *)v5 setAuthContext:v7];
  return v5;
}

- (id)_repairParametersFromAuthResults:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v5 = *MEMORY[0x263F28F80];
  char v6 = [v3 objectForKeyedSubscript:*MEMORY[0x263F28F80]];

  if (v6)
  {
    uint64_t v7 = [v3 objectForKeyedSubscript:v5];
    [v4 setObject:v7 forKeyedSubscript:@"memberId"];
  }
  else
  {
    uint64_t v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[FACreateChildController _repairParametersFromAuthResults:]();
    }
  }

  uint64_t v8 = *MEMORY[0x263F28F58];
  id v9 = [v3 objectForKeyedSubscript:*MEMORY[0x263F28F58]];

  if (v9)
  {
    id v10 = [v3 objectForKeyedSubscript:v8];
    [v4 setObject:v10 forKeyedSubscript:@"altDSID"];
  }
  else
  {
    id v10 = _FALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[FACreateChildController _repairParametersFromAuthResults:]();
    }
  }

  char v11 = [v3 objectForKeyedSubscript:*MEMORY[0x263F28FB0]];
  uint64_t v12 = *MEMORY[0x263F26D60];
  char v13 = [v11 objectForKeyedSubscript:*MEMORY[0x263F26D60]];

  if (v13)
  {
    v14 = [v11 objectForKeyedSubscript:v12];
    [v4 setObject:v14 forKeyedSubscript:v12];
  }
  else
  {
    v14 = _FALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[FACreateChildController _repairParametersFromAuthResults:]();
    }
  }

  return v4;
}

- (id)_repairAuthContextWithAuthResults:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F29110];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setNeedsNewAppleID:1];
  char v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F29010]];

  [v5 setUsername:v6];
  return v5;
}

- (void)navigationController:(id)a3 didPresentInitialViewController:(id)a4
{
  id v5 = a3;
  char v6 = [v5 presentingViewController];

  if (!v6)
  {
    uint64_t v7 = [(FACreateChildController *)self presentingViewController];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __80__FACreateChildController_navigationController_didPresentInitialViewController___block_invoke;
    v8[3] = &unk_2643489F8;
    v8[4] = self;
    [v7 presentViewController:v5 animated:1 completion:v8];
  }
}

void __80__FACreateChildController_navigationController_didPresentInitialViewController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 createChildControllerDidPresentInitialViewController:*(void *)(a1 + 32)];
}

- (void)navigationController:(id)a3 presentViewController:(id)a4
{
  id v5 = a4;
  char v6 = [(FACreateChildController *)self presentingViewController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__FACreateChildController_navigationController_presentViewController___block_invoke;
  v7[3] = &unk_2643489F8;
  v7[4] = self;
  [v6 presentViewController:v5 animated:1 completion:v7];
}

void __70__FACreateChildController_navigationController_presentViewController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 createChildControllerDidPresentInitialViewController:*(void *)(a1 + 32)];
}

- (FACreateChildControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FACreateChildControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (ACAccount)appleAccount
{
  return self->_appleAccount;
}

- (void)setAppleAccount:(id)a3
{
}

- (FANavigationController)navController
{
  return self->_navController;
}

- (void)setNavController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_delegate);
}

void __60__FACreateChildController_createChildAccountWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2189F0000, a2, OS_LOG_TYPE_ERROR, "Failed to creating new child account %@", (uint8_t *)&v2, 0xCu);
}

void __60__FACreateChildController_createChildAccountWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_2189F0000, v0, OS_LOG_TYPE_DEBUG, "Successfully created the child account", v1, 2u);
}

- (void)repairChildAccountWithAuthenticationResults:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_2189F0000, v0, OS_LOG_TYPE_DEBUG, "Starting child account repair flow.", v1, 2u);
}

void __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke_40_cold_1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = @"YES";
  if ((a1 & 1) == 0) {
    uint64_t v3 = @"NO";
  }
  int v4 = 138412546;
  id v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_2189F0000, log, OS_LOG_TYPE_DEBUG, "Child account repair flow %@ error: %@", (uint8_t *)&v4, 0x16u);
}

- (void)_repairParametersFromAuthResults:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2189F0000, v0, v1, "child account repair Family GS token was nil", v2, v3, v4, v5, v6);
}

- (void)_repairParametersFromAuthResults:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2189F0000, v0, v1, "child account repair altDSID was nil", v2, v3, v4, v5, v6);
}

- (void)_repairParametersFromAuthResults:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2189F0000, v0, v1, "child account repair memberId/AKAuthenticationDSIDKey was nil", v2, v3, v4, v5, v6);
}

@end