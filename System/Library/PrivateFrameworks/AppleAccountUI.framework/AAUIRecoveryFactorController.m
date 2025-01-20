@interface AAUIRecoveryFactorController
- (AAUIRecoveryFactorController)initWithAccountManager:(id)a3 presentingViewController:(id)a4;
- (AAUIRecoveryFactorControllerDelegate)delegate;
- (AIDAAccountManager)accountManager;
- (BOOL)forceInlinePresentation;
- (NSString)telemetryFlowID;
- (UIViewController)presentingViewController;
- (id)_cdpHelper;
- (id)_custodianFlowController;
- (id)_stateController;
- (id)_walrusStateController;
- (id)followUpUniqueIdentifier;
- (void)_continueAddingRecoveryContact;
- (void)_custodianFlowControllerWithCompletion:(id)a3;
- (void)_displayCustodianAddNotAllowedAlert;
- (void)_displayRatchetGenericErrorAlert;
- (void)_handleRecoveryKeyOperationResultWithSuccess:(BOOL)a3 error:(id)a4 operationDescription:(id)a5 completion:(id)a6;
- (void)authenticateAndDeleteRecoveryKeyFromAllSystemsWithCompletion:(id)a3;
- (void)authenticateAndGenerateNewRecoveryKeyWithCompletion:(id)a3;
- (void)custodianSetupFlowControllerDidFinish:(id)a3;
- (void)custodianSetupFlowControllerRecoveryContactInviteSent;
- (void)deleteRecoveryKeyFromAllSystems:(id)a3;
- (void)generateRecoveryKeyWithCompletion:(id)a3;
- (void)setAccountManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForceInlinePresentation:(BOOL)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setTelemetryFlowID:(id)a3;
- (void)startAddingDataRecoveryService;
- (void)startAddingRecoveryContact;
- (void)validateRecoveryKeyWithCompletion:(id)a3;
@end

@implementation AAUIRecoveryFactorController

- (AAUIRecoveryFactorController)initWithAccountManager:(id)a3 presentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AAUIRecoveryFactorController;
  v8 = [(AAUIRecoveryFactorController *)&v14 init];
  v9 = v8;
  if (v8)
  {
    [(AAUIRecoveryFactorController *)v8 setAccountManager:v6];
    [(AAUIRecoveryFactorController *)v9 setPresentingViewController:v7];
    id v10 = objc_alloc_init(MEMORY[0x263F29198]);
    v11 = [[AAUIDTOHelper alloc] initWithDTOController:v10];
    dtoHelper = v9->_dtoHelper;
    v9->_dtoHelper = v11;
  }
  return v9;
}

- (void)_displayCustodianAddNotAllowedAlert
{
  id v4 = [(AAUIDTOHelper *)self->_dtoHelper makeCustodianAddOpNotAllowedAlert];
  v3 = [(AAUIRecoveryFactorController *)self presentingViewController];
  [v3 presentViewController:v4 animated:1 completion:0];
}

- (void)_displayRatchetGenericErrorAlert
{
  id v4 = [(AAUIDTOHelper *)self->_dtoHelper makeGenericRatchetFailedAlert];
  v3 = [(AAUIRecoveryFactorController *)self presentingViewController];
  [v3 presentViewController:v4 animated:1 completion:0];
}

- (void)startAddingRecoveryContact
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "appleAccount found nil, returning without adding RC", v2, v3, v4, v5, v6);
}

void __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke(uint64_t a1, int a2)
{
  if (!a2)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_39;
    v13[3] = &unk_263F92168;
    v13[4] = *(void *)(a1 + 32);
    v11 = MEMORY[0x263EF83A0];
    v12 = v13;
LABEL_10:
    dispatch_async(v11, v12);
    return;
  }
  uint64_t v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_cold_2();
  }

  if (![*(id *)(*(void *)(a1 + 32) + 40) isDTOGatingEnabled])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_2;
    block[3] = &unk_263F92168;
    block[4] = *(void *)(a1 + 32);
    v11 = MEMORY[0x263EF83A0];
    v12 = block;
    goto LABEL_10;
  }
  uint64_t v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_cold_1();
  }

  uint64_t v5 = *(void **)(a1 + 32);
  uint8_t v6 = (void *)v5[5];
  id v7 = [v5 presentingViewController];
  v8 = [v6 makeRatchetContextWithPresentationContext:v7 DTOContextType:1];

  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 40);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_35;
  v15[3] = &unk_263F929D0;
  v15[4] = v9;
  [v10 shouldAllowOpForContext:v8 completion:v15];
}

void __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_35(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint8_t v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_35_cold_1(a2, (uint64_t)v5, v6);
  }

  if (a2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_36;
    block[3] = &unk_263F92168;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_36(uint64_t a1)
{
  return [*(id *)(a1 + 32) _continueAddingRecoveryContact];
}

uint64_t __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_2_cold_1();
  }

  return [*(id *)(a1 + 32) _continueAddingRecoveryContact];
}

uint64_t __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_39(uint64_t a1)
{
  uint64_t v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_39_cold_1();
  }

  return [*(id *)(a1 + 32) _displayCustodianAddNotAllowedAlert];
}

- (void)_continueAddingRecoveryContact
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __62__AAUIRecoveryFactorController__continueAddingRecoveryContact__block_invoke;
  v2[3] = &unk_263F92AE0;
  v2[4] = self;
  [(AAUIRecoveryFactorController *)self _custodianFlowControllerWithCompletion:v2];
}

void __62__AAUIRecoveryFactorController__continueAddingRecoveryContact__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v12 && v7)
  {
    uint64_t v9 = [*(id *)(a1 + 32) telemetryFlowID];
    [v7 setTelemetryFlowID:v9];

    [v7 start];
    if ([v12 forceInlinePresentation]) {
      goto LABEL_7;
    }
    id v10 = [v7 navigationController];
    v11 = [v12 presentingViewController];
    [v11 presentViewController:v10 animated:1 completion:0];
  }
  else
  {
    id v10 = [v12 delegate];
    [v10 recoveryFactorController:v12 didFinishAddingRecoveryContactWithError:v8];
  }

LABEL_7:
}

- (void)authenticateAndGenerateNewRecoveryKeyWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(AAUIRecoveryFactorController *)self _stateController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AAUIRecoveryFactorController *)self _stateController];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __84__AAUIRecoveryFactorController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke;
    v10[3] = &unk_263F92B08;
    objc_copyWeak(&v12, &location);
    id v11 = v4;
    [v7 authenticateAndGenerateNewRecoveryKeyWithCompletion:v10];

    objc_destroyWeak(&v12);
  }
  else
  {
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AAUIRecoveryFactorController authenticateAndGenerateNewRecoveryKeyWithCompletion:]();
    }

    if (v4)
    {
      uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -3);
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);
    }
  }
  objc_destroyWeak(&location);
}

void __84__AAUIRecoveryFactorController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleRecoveryKeyOperationResultWithSuccess:a2 error:v6 operationDescription:@"recovery key generation" completion:*(void *)(a1 + 32)];
}

- (void)generateRecoveryKeyWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(AAUIRecoveryFactorController *)self _stateController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__AAUIRecoveryFactorController_generateRecoveryKeyWithCompletion___block_invoke;
  v7[3] = &unk_263F92B08;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 generateNewRecoveryKey:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __66__AAUIRecoveryFactorController_generateRecoveryKeyWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleRecoveryKeyOperationResultWithSuccess:a2 error:v6 operationDescription:@"recovery key generation" completion:*(void *)(a1 + 32)];
}

- (void)validateRecoveryKeyWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F34350] contextForPrimaryAccount];
  [v5 setType:9];
  id v6 = [(AAUIRecoveryFactorController *)self _cdpHelper];
  id v7 = [v6 cdpStateControllerWithContext:v5];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__AAUIRecoveryFactorController_validateRecoveryKeyWithCompletion___block_invoke;
  v9[3] = &unk_263F92B30;
  id v10 = v4;
  id v8 = v4;
  [v7 verifyRecoveryKey:v9];
}

void __66__AAUIRecoveryFactorController_validateRecoveryKeyWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = _AAUILogSystem();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __66__AAUIRecoveryFactorController_validateRecoveryKeyWithCompletion___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __66__AAUIRecoveryFactorController_validateRecoveryKeyWithCompletion___block_invoke_cold_1();
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (void)deleteRecoveryKeyFromAllSystems:(id)a3
{
  id v4 = (void *)MEMORY[0x263F34350];
  id v5 = a3;
  id v8 = [v4 contextForPrimaryAccount];
  id v6 = [(AAUIRecoveryFactorController *)self _cdpHelper];
  id v7 = [v6 cdpStateControllerWithContext:v8];

  [v7 deleteRecoveryKey:v5];
}

- (void)authenticateAndDeleteRecoveryKeyFromAllSystemsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(AAUIRecoveryFactorController *)self _stateController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AAUIRecoveryFactorController *)self _stateController];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __93__AAUIRecoveryFactorController_authenticateAndDeleteRecoveryKeyFromAllSystemsWithCompletion___block_invoke;
    v10[3] = &unk_263F92B08;
    objc_copyWeak(&v12, &location);
    id v11 = v4;
    [v7 authenticateAndDeleteRecoveryKeyWithCompletion:v10];

    objc_destroyWeak(&v12);
  }
  else
  {
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AAUIRecoveryFactorController authenticateAndDeleteRecoveryKeyFromAllSystemsWithCompletion:]();
    }

    if (v4)
    {
      id v9 = objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -3);
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);
    }
  }
  objc_destroyWeak(&location);
}

void __93__AAUIRecoveryFactorController_authenticateAndDeleteRecoveryKeyFromAllSystemsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleRecoveryKeyOperationResultWithSuccess:a2 error:v6 operationDescription:@"recovery key deletion" completion:*(void *)(a1 + 32)];
}

- (void)_handleRecoveryKeyOperationResultWithSuccess:(BOOL)a3 error:(id)a4 operationDescription:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, BOOL, id))a6;
  if (v8)
  {
    id v12 = objc_alloc_init(MEMORY[0x263F257E8]);
    [v12 startHealthCheckWithCompletion:&__block_literal_global_4];
  }
  else
  {
    id v12 = _AAUILogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[AAUIRecoveryFactorController _handleRecoveryKeyOperationResultWithSuccess:error:operationDescription:completion:]();
    }
  }

  if (v11) {
    v11[2](v11, v8, v9);
  }
}

void __115__AAUIRecoveryFactorController__handleRecoveryKeyOperationResultWithSuccess_error_operationDescription_completion___block_invoke(uint64_t a1, void *a2)
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

- (void)startAddingDataRecoveryService
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __62__AAUIRecoveryFactorController_startAddingDataRecoveryService__block_invoke;
  v2[3] = &unk_263F92AE0;
  v2[4] = self;
  [(AAUIRecoveryFactorController *)self _custodianFlowControllerWithCompletion:v2];
}

void __62__AAUIRecoveryFactorController_startAddingDataRecoveryService__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7 && [v8 isWalrusEnabled])
  {
    id v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "Starting to add iCDRS after verifying that walrus is enabled", v13, 2u);
    }

    id v11 = [v7 presentingViewController];
    [v8 startAddingDataRecoveryService:v11];
  }
  else
  {
    id v12 = _AALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __62__AAUIRecoveryFactorController_startAddingDataRecoveryService__block_invoke_cold_1();
    }

    id v11 = [v7 delegate];
    [v11 recoveryFactorController:*(void *)(a1 + 32) didFinishAddingRecoveryContactWithError:v9];
  }
}

- (void)setForceInlinePresentation:(BOOL)a3
{
  BOOL v3 = a3;
  self->_forceInlinePresentation = a3;
  id v5 = [(AAUIRecoveryFactorController *)self _cdpHelper];
  [v5 setForceInline:v3];

  id v6 = [(AAUIRecoveryFactorController *)self _custodianFlowController];
  [v6 setForceInlinePresentation:v3];
}

- (id)_custodianFlowController
{
  if (!self->_custodianFlowController)
  {
    BOOL v3 = [AAUICustodianSetupFlowController alloc];
    id v4 = [(AAUIRecoveryFactorController *)self accountManager];
    id v5 = [(AAUICustodianSetupFlowController *)v3 initWithAccountManager:v4];
    custodianFlowController = self->_custodianFlowController;
    self->_custodianFlowController = v5;

    [(AAUICustodianSetupFlowController *)self->_custodianFlowController setDelegate:self];
    if ([(AAUIRecoveryFactorController *)self forceInlinePresentation])
    {
      id v7 = [(AAUIRecoveryFactorController *)self presentingViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v9 = [(AAUIRecoveryFactorController *)self presentingViewController];
        [(AAUICustodianSetupFlowController *)self->_custodianFlowController setNavigationController:v9];
      }
    }
  }
  id v10 = self->_custodianFlowController;
  return v10;
}

- (void)_custodianFlowControllerWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _AALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AAUIRecoveryFactorController _custodianFlowControllerWithCompletion:]();
  }

  objc_initWeak(&location, self);
  id v6 = [(AAUIRecoveryFactorController *)self _walrusStateController];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__AAUIRecoveryFactorController__custodianFlowControllerWithCompletion___block_invoke;
  v8[3] = &unk_263F92BA0;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  [v6 walrusStatusWithCompletion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __71__AAUIRecoveryFactorController__custodianFlowControllerWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__AAUIRecoveryFactorController__custodianFlowControllerWithCompletion___block_invoke_2;
  v10[3] = &unk_263F92B78;
  uint64_t v14 = a2;
  id v7 = *(id *)(a1 + 32);
  id v12 = WeakRetained;
  id v13 = v7;
  id v11 = v5;
  id v8 = WeakRetained;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

void __71__AAUIRecoveryFactorController__custodianFlowControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    id v2 = [*(id *)(a1 + 40) _custodianFlowController];
    [v2 setIsWalrusEnabled:*(void *)(a1 + 56) == 1];

    uint64_t v5 = a1 + 40;
    BOOL v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(v5 + 8);
    id v7 = [v3 _custodianFlowController];
    (*(void (**)(uint64_t, void *, id, void))(v4 + 16))(v4, v3, v7, 0);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
}

- (id)_stateController
{
  stateController = self->_stateController;
  if (!stateController)
  {
    uint64_t v4 = [(AAUIRecoveryFactorController *)self _cdpHelper];
    uint64_t v5 = [v4 cdpStateControllerForPrimaryAccount];
    id v6 = self->_stateController;
    self->_stateController = v5;

    stateController = self->_stateController;
  }
  return stateController;
}

- (id)_cdpHelper
{
  cdpHelper = self->_cdpHelper;
  if (!cdpHelper)
  {
    uint64_t v4 = [(AAUIRecoveryFactorController *)self presentingViewController];
    uint64_t v5 = +[AAUICDPHelper helperWithPresenter:v4];
    id v6 = self->_cdpHelper;
    self->_cdpHelper = v5;

    cdpHelper = self->_cdpHelper;
  }
  return cdpHelper;
}

- (id)_walrusStateController
{
  walrusStateController = self->_walrusStateController;
  if (!walrusStateController)
  {
    uint64_t v4 = (CDPWalrusStateController *)objc_alloc_init(MEMORY[0x263F34408]);
    uint64_t v5 = self->_walrusStateController;
    self->_walrusStateController = v4;

    walrusStateController = self->_walrusStateController;
  }
  return walrusStateController;
}

- (void)custodianSetupFlowControllerDidFinish:(id)a3
{
  if (![(AAUIRecoveryFactorController *)self forceInlinePresentation])
  {
    uint64_t v4 = [(AAUIRecoveryFactorController *)self presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
  id v5 = [(AAUIRecoveryFactorController *)self delegate];
  [v5 recoveryFactorController:self didFinishAddingRecoveryContactWithError:0];
}

- (id)followUpUniqueIdentifier
{
  return 0;
}

- (void)custodianSetupFlowControllerRecoveryContactInviteSent
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Unimplemented", v2, v3, v4, v5, v6);
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
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

- (AAUIRecoveryFactorControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUIRecoveryFactorControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)forceInlinePresentation
{
  return self->_forceInlinePresentation;
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_dtoHelper, 0);
  objc_storeStrong((id *)&self->_walrusStateController, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_cdpHelper, 0);
  objc_storeStrong((id *)&self->_custodianFlowController, 0);
}

void __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "DTO enabled, IdMS says RC add is allowed, proceeding to ratchet auth", v2, v3, v4, v5, v6);
}

void __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "IdMS says RC add is allowed on this device, proceeding to check if DTO is enabled", v2, v3, v4, v5, v6);
}

void __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_35_cold_1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_debug_impl(&dword_209754000, log, OS_LOG_TYPE_DEBUG, "Ratchet auth returned with success: %d, error: %@,", (uint8_t *)v3, 0x12u);
}

void __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "DTO disabled, proceeding with usual flow without auth", v2, v3, v4, v5, v6);
}

void __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_39_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "IdMS says RC add is not allowed on weak device, proceeding to show error alert", v2, v3, v4, v5, v6);
}

- (void)authenticateAndGenerateNewRecoveryKeyWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_209754000, v0, OS_LOG_TYPE_ERROR, "CDP change has not been integrated for authenticateAndGenerateNewRecoveryKeyWithCompletion", v1, 2u);
}

void __66__AAUIRecoveryFactorController_validateRecoveryKeyWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Verified Recovery key successfully", v2, v3, v4, v5, v6);
}

void __66__AAUIRecoveryFactorController_validateRecoveryKeyWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Error verifying recovery key: %@", v2, v3, v4, v5, v6);
}

- (void)authenticateAndDeleteRecoveryKeyFromAllSystemsWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_209754000, v0, OS_LOG_TYPE_ERROR, "CDP change has not been integrated for authenticateAndDeleteRecoveryKeyWithCompletion", v1, 2u);
}

- (void)_handleRecoveryKeyOperationResultWithSuccess:error:operationDescription:completion:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_209754000, v1, OS_LOG_TYPE_ERROR, "Recovery Key operation '%@' was not successful. MaybeError: %@", v2, 0x16u);
}

void __115__AAUIRecoveryFactorController__handleRecoveryKeyOperationResultWithSuccess_error_operationDescription_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Health check failed with error: %@", v2, v3, v4, v5, v6);
}

void __62__AAUIRecoveryFactorController_startAddingDataRecoveryService__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Unable to add iCDRS since walrus not determined to be enabled: %@", v2, v3, v4, v5, v6);
}

- (void)_custodianFlowControllerWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Determining walrus status for custodian flow controller", v2, v3, v4, v5, v6);
}

@end