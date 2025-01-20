@interface CDPUIStatusChangeController
+ (id)controllerWithTargetWalrusStatus:(unint64_t)a3;
+ (id)controllerWithTargetWalrusStatus:(unint64_t)a3 altDSID:(id)a4;
+ (id)controllerWithTargetWebAccessStatus:(unint64_t)a3;
- (CDPUIStatusChangeController)initWithModel:(id)a3;
- (CDPUIStatusChangeModel)model;
- (id)_configureAlertController;
- (id)_configurePasscodeVerificationControllerWithViewController:(id)a3 presentationType:(unint64_t)a4;
- (id)completionCallback;
- (id)userActionCallback;
- (void)_alertWithViewController:(id)a3;
- (void)_handleUserChoice:(unint64_t)a3;
- (void)_handleUserChoice:(unint64_t)a3 error:(id)a4;
- (void)_passcodeVerificationflowWithViewController:(id)a3 presentationType:(unint64_t)a4;
- (void)authenticate:(id)a3 completionHandler:(id)a4;
- (void)presentWithViewController:(id)a3 presentationType:(unint64_t)a4;
- (void)setCompletionCallback:(id)a3;
- (void)setUserActionCallback:(id)a3;
@end

@implementation CDPUIStatusChangeController

- (CDPUIStatusChangeController)initWithModel:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CDPUIStatusChangeController;
  v6 = [(CDPUIStatusChangeController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    v8 = [MEMORY[0x263F34370] sharedInstance];
    [v8 fetchConfig];
  }
  return v7;
}

- (void)_handleUserChoice:(unint64_t)a3
{
}

- (void)_handleUserChoice:(unint64_t)a3 error:(id)a4
{
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [(CDPUIStatusChangeModel *)self->_model _reportUserChoice:a3 error:v6];
  }
  v7 = [(CDPUIStatusChangeController *)self userActionCallback];

  if (v7)
  {
    v8 = [(CDPUIStatusChangeController *)self userActionCallback];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__CDPUIStatusChangeController__handleUserChoice_error___block_invoke;
    block[3] = &unk_26433DBB8;
    id v21 = v8;
    unint64_t v22 = a3;
    id v9 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  objc_super v10 = [(CDPUIStatusChangeController *)self completionCallback];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __55__CDPUIStatusChangeController__handleUserChoice_error___block_invoke_2;
  v17 = &unk_26433DC08;
  id v11 = v10;
  id v18 = v11;
  unint64_t v19 = a3;
  v12 = _Block_copy(&v14);
  v13 = v12;
  if (a3 - 1 < 2)
  {
    -[CDPUIStatusChangeModel _updateUnderlyingValue:](self->_model, "_updateUnderlyingValue:", v12, v14, v15, v16, v17);
  }
  else if (!a3 || a3 == 3)
  {
    (*((void (**)(void *, void))v12 + 2))(v12, 0);
  }
}

uint64_t __55__CDPUIStatusChangeController__handleUserChoice_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __55__CDPUIStatusChangeController__handleUserChoice_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__CDPUIStatusChangeController__handleUserChoice_error___block_invoke_3;
    block[3] = &unk_26433DBE0;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v8 = v4;
    uint64_t v9 = v5;
    id v7 = v3;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __55__CDPUIStatusChangeController__handleUserChoice_error___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (id)userActionCallback
{
  return self->_userActionCallback;
}

- (void)setUserActionCallback:(id)a3
{
}

- (id)completionCallback
{
  return self->_completionCallback;
}

- (void)setCompletionCallback:(id)a3
{
}

- (CDPUIStatusChangeModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong(&self->_completionCallback, 0);

  objc_storeStrong(&self->_userActionCallback, 0);
}

+ (id)controllerWithTargetWalrusStatus:(unint64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F34408]);
  uint64_t v5 = [[CDPUIWalrusStatusChangeModel alloc] initWithTargetStatus:a3 statusProvider:v4 statusUpdater:v4];
  id v6 = [[CDPUIStatusChangeController alloc] initWithModel:v5];

  return v6;
}

+ (id)controllerWithTargetWalrusStatus:(unint64_t)a3 altDSID:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x263F34350];
  id v6 = a4;
  id v7 = [v5 contextForAccountWithAltDSID:v6];
  id v8 = [MEMORY[0x263F08C38] UUID];
  uint64_t v9 = [v8 UUIDString];
  [v7 setTelemetryFlowID:v9];

  objc_super v10 = [MEMORY[0x263F290F0] sharedInstance];
  id v11 = [v10 authKitAccountWithAltDSID:v6];

  v12 = [MEMORY[0x263F290F0] sharedInstance];
  v13 = [v12 telemetryDeviceSessionIDForAccount:v11];
  [v7 setTelemetryDeviceSessionID:v13];

  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F34408]) initWithContext:v7];
  uint64_t v15 = [[CDPUIWalrusStatusChangeModel alloc] initWithTargetStatus:a3 statusProvider:v14 statusUpdater:v14 context:v7];
  v16 = [[CDPUIStatusChangeController alloc] initWithModel:v15];

  return v16;
}

+ (id)controllerWithTargetWebAccessStatus:(unint64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F34410]);
  id v5 = objc_alloc_init(MEMORY[0x263F34408]);
  id v6 = [[CDPUIWebAccessStatusChangeModel alloc] initWithTargetStatus:a3 statusProvider:v4 statusUpdater:v4 walrusStatusProvider:v5];
  id v7 = [[CDPUIStatusChangeController alloc] initWithModel:v6];

  return v7;
}

- (id)_configureAlertController
{
  id v3 = (void *)MEMORY[0x263F82418];
  id v4 = [(CDPUIStatusChangeController *)self model];
  id v5 = [v4 titleText];
  id v6 = [(CDPUIStatusChangeController *)self model];
  id v7 = [v6 messageText];
  id v8 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  uint64_t v9 = (void *)MEMORY[0x263F82400];
  objc_super v10 = [(CDPUIStatusChangeController *)self model];
  id v11 = [v10 primaryButtonText];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __70__CDPUIStatusChangeController_Presentation___configureAlertController__block_invoke;
  v19[3] = &unk_26433D3A8;
  v19[4] = self;
  v12 = [v9 actionWithTitle:v11 style:0 handler:v19];

  [v8 addAction:v12];
  v13 = (void *)MEMORY[0x263F82400];
  uint64_t v14 = [(CDPUIStatusChangeController *)self model];
  uint64_t v15 = [v14 cancelButtonText];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __70__CDPUIStatusChangeController_Presentation___configureAlertController__block_invoke_18;
  v18[3] = &unk_26433D3A8;
  v18[4] = self;
  v16 = [v13 actionWithTitle:v15 style:1 handler:v18];

  [v8 addAction:v16];

  return v8;
}

uint64_t __70__CDPUIStatusChangeController_Presentation___configureAlertController__block_invoke(uint64_t a1)
{
  v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __70__CDPUIStatusChangeController_Presentation___configureAlertController__block_invoke_cold_1(v2);
  }

  return [*(id *)(a1 + 32) _handleUserChoice:1];
}

uint64_t __70__CDPUIStatusChangeController_Presentation___configureAlertController__block_invoke_18(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleUserChoice:0];
}

- (id)_configurePasscodeVerificationControllerWithViewController:(id)a3 presentationType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [CDPUIWalrusLocalPasscodeVerificationController alloc];
  id v8 = [(CDPUIStatusChangeController *)self model];
  uint64_t v9 = [v8 titleText];
  objc_super v10 = [(CDPUIWalrusLocalPasscodeVerificationController *)v7 initWithTitle:v9 presentWithViewController:v6 presentationType:a4];

  return v10;
}

- (void)presentWithViewController:(id)a3 presentationType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CDPUIStatusChangeController(Presentation) presentWithViewController:presentationType:]();
  }

  id v8 = [(CDPUIStatusChangeController *)self model];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __88__CDPUIStatusChangeController_Presentation__presentWithViewController_presentationType___block_invoke;
  v10[3] = &unk_26433DCC8;
  v10[4] = self;
  id v11 = v6;
  unint64_t v12 = a4;
  id v9 = v6;
  [v8 _checkCurrentStatus:v10];
}

void __88__CDPUIStatusChangeController_Presentation__presentWithViewController_presentationType___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = v2;
  uint64_t v25 = v3;
  uint64_t v26 = v4;
  switch(a2)
  {
    case 0:
      id v6 = _CDPLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __88__CDPUIStatusChangeController_Presentation__presentWithViewController_presentationType___block_invoke_cold_1();
      }

      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = 3;
      goto LABEL_8;
    case 1:
      id v9 = _CDPLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __88__CDPUIStatusChangeController_Presentation__presentWithViewController_presentationType___block_invoke_cold_2();
      }

      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = 2;
LABEL_8:
      [v7 _handleUserChoice:v8];
      return;
    case 2:
      objc_super v10 = _CDPLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __88__CDPUIStatusChangeController_Presentation__presentWithViewController_presentationType___block_invoke_cold_3();
      }

      [*(id *)(a1 + 32) _alertWithViewController:*(void *)(a1 + 40)];
      return;
    case 3:
      id v11 = _CDPLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __88__CDPUIStatusChangeController_Presentation__presentWithViewController_presentationType___block_invoke_cold_4();
      }

      [*(id *)(a1 + 32) _passcodeVerificationflowWithViewController:*(void *)(a1 + 40) presentationType:*(void *)(a1 + 48)];
      return;
    case 4:
      v13 = *(void **)(a1 + 32);
      unint64_t v12 = *(void **)(a1 + 40);
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __88__CDPUIStatusChangeController_Presentation__presentWithViewController_presentationType___block_invoke_20;
      v22[3] = &unk_26433CC30;
      v22[4] = v13;
      id v23 = v12;
      [v13 authenticate:v23 completionHandler:v22];
      uint64_t v14 = v23;
      goto LABEL_17;
    case 5:
      v16 = *(void **)(a1 + 32);
      uint64_t v15 = *(void **)(a1 + 40);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __88__CDPUIStatusChangeController_Presentation__presentWithViewController_presentationType___block_invoke_2;
      v19[3] = &unk_26433D060;
      v19[4] = v16;
      id v17 = v15;
      uint64_t v18 = *(void *)(a1 + 48);
      id v20 = v17;
      uint64_t v21 = v18;
      [v16 authenticate:v17 completionHandler:v19];
      uint64_t v14 = v20;
LABEL_17:

      break;
    default:
      return;
  }
}

uint64_t __88__CDPUIStatusChangeController_Presentation__presentWithViewController_presentationType___block_invoke_20(uint64_t a1)
{
  return [*(id *)(a1 + 32) _alertWithViewController:*(void *)(a1 + 40)];
}

uint64_t __88__CDPUIStatusChangeController_Presentation__presentWithViewController_presentationType___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _passcodeVerificationflowWithViewController:*(void *)(a1 + 40) presentationType:*(void *)(a1 + 48)];
}

- (void)authenticate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CDPUIStatusChangeController *)self model];
  id v9 = [v8 uiProvider];

  [v9 setPresentingViewController:v6];
  objc_super v10 = [(CDPUIStatusChangeController *)self model];
  id v11 = [v10 cdpContext];
  [v11 setIgnorePasswordCache:1];

  unint64_t v12 = [(CDPUIStatusChangeController *)self model];
  v13 = [v12 cdpContext];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __76__CDPUIStatusChangeController_Presentation__authenticate_completionHandler___block_invoke;
  v16[3] = &unk_26433DCF0;
  v16[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v14 = v7;
  id v15 = v6;
  [v9 cdpContext:v13 promptForInteractiveAuthenticationWithCompletion:v16];
}

void __76__CDPUIStatusChangeController_Presentation__authenticate_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 domain];
  if ([v7 isEqualToString:*MEMORY[0x263F28F30]])
  {
    uint64_t v8 = [v6 code];

    if (v8 == -7003)
    {
      id v9 = _CDPLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __76__CDPUIStatusChangeController_Presentation__authenticate_completionHandler___block_invoke_cold_1((uint64_t)v6, v9);
      }
      goto LABEL_10;
    }
  }
  else
  {
  }
  if (v6)
  {
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __76__CDPUIStatusChangeController_Presentation__authenticate_completionHandler___block_invoke_cold_2((uint64_t)v6, v9);
    }
  }
  else
  {
    objc_super v10 = (void *)[objc_alloc(MEMORY[0x263F34350]) initWithAuthenticationResults:v5];
    id v11 = [a1[4] model];
    [v11 setAuthenticatedContext:v10];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __76__CDPUIStatusChangeController_Presentation__authenticate_completionHandler___block_invoke_24;
    v12[3] = &unk_26433CEF8;
    v13 = a1[5];
    id v14 = a1[6];
    dispatch_async(MEMORY[0x263EF83A0], v12);

    id v9 = v13;
  }
LABEL_10:
}

void __76__CDPUIStatusChangeController_Presentation__authenticate_completionHandler___block_invoke_24(uint64_t a1)
{
  id v4 = *(id *)(a1 + 32);
  id v2 = (id)[v4 popViewControllerAnimated:1];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

- (void)_passcodeVerificationflowWithViewController:(id)a3 presentationType:(unint64_t)a4
{
  id v5 = [(CDPUIStatusChangeController *)self _configurePasscodeVerificationControllerWithViewController:a3 presentationType:a4];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __106__CDPUIStatusChangeController_Presentation___passcodeVerificationflowWithViewController_presentationType___block_invoke;
  v6[3] = &unk_26433D988;
  v6[4] = self;
  [v5 finishWalrusLocalPasscodeVerificationWithCompletion:v6];
}

void __106__CDPUIStatusChangeController_Presentation___passcodeVerificationflowWithViewController_presentationType___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __106__CDPUIStatusChangeController_Presentation___passcodeVerificationflowWithViewController_presentationType___block_invoke_cold_2(a1, v5);
    }

    [*(id *)(a1 + 32) _handleUserChoice:0 error:v5];
  }
  else if (a2)
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __106__CDPUIStatusChangeController_Presentation___passcodeVerificationflowWithViewController_presentationType___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) _handleUserChoice:1];
  }
}

- (void)_alertWithViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(CDPUIStatusChangeController *)self _configureAlertController];
  [v4 presentViewController:v5 animated:1 completion:0];
}

void __70__CDPUIStatusChangeController_Presentation___configureAlertController__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2187CF000, log, OS_LOG_TYPE_DEBUG, "User tapped on turn off button, moving ahead with disabling ADP", v1, 2u);
}

void __88__CDPUIStatusChangeController_Presentation__presentWithViewController_presentationType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  v1 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = [(id)OUTLINED_FUNCTION_4_0() model];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_2187CF000, v3, v4, "%@: Skipping user prompt for %@ because no change was needed.", v5, v6, v7, v8, v9);
}

void __88__CDPUIStatusChangeController_Presentation__presentWithViewController_presentationType___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  v1 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = [(id)OUTLINED_FUNCTION_4_0() model];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_2187CF000, v3, v4, "%@: Skipping user prompt for %@ user interaction was not needed.", v5, v6, v7, v8, v9);
}

void __88__CDPUIStatusChangeController_Presentation__presentWithViewController_presentationType___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3_0();
  v1 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = [(id)OUTLINED_FUNCTION_4_0() model];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_2187CF000, v3, v4, "%@: Presenting alert for %@.", v5, v6, v7, v8, v9);
}

void __88__CDPUIStatusChangeController_Presentation__presentWithViewController_presentationType___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_3_0();
  v1 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = [(id)OUTLINED_FUNCTION_4_0() model];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_2187CF000, v3, v4, "%@: Presenting passcode entry for %@.", v5, v6, v7, v8, v9);
}

void __76__CDPUIStatusChangeController_Presentation__authenticate_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2187CF000, a2, OS_LOG_TYPE_ERROR, "User cancelled ADP disablement...Nothing to do... %@", (uint8_t *)&v2, 0xCu);
}

void __76__CDPUIStatusChangeController_Presentation__authenticate_completionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2187CF000, a2, OS_LOG_TYPE_ERROR, "Interactive auth failed: %@", (uint8_t *)&v2, 0xCu);
}

void __106__CDPUIStatusChangeController_Presentation___passcodeVerificationflowWithViewController_presentationType___block_invoke_cold_1()
{
  v0 = (objc_class *)OUTLINED_FUNCTION_2_1();
  v1 = NSStringFromClass(v0);
  uint64_t v8 = [0 localizedDescription];
  OUTLINED_FUNCTION_0_3(&dword_2187CF000, v2, v3, "%@: Updated local secret successfully %@.", v4, v5, v6, v7, 2u);
}

void __106__CDPUIStatusChangeController_Presentation___passcodeVerificationflowWithViewController_presentationType___block_invoke_cold_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)OUTLINED_FUNCTION_2_1();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = [a2 localizedDescription];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_2187CF000, v6, v7, "%@: Error in updating local secret %@.", v8, v9, v10, v11, v12);
}

@end