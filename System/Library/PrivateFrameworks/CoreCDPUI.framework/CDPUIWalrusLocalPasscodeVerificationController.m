@interface CDPUIWalrusLocalPasscodeVerificationController
- (CDPUIWalrusLocalPasscodeVerificationController)initWithTitle:(id)a3 presentWithViewController:(id)a4 presentationType:(unint64_t)a5;
- (void)_setupControllers;
- (void)finishWalrusLocalPasscodeVerificationWithCompletion:(id)a3;
- (void)uiController:(id)a3 prepareAlertContext:(id)a4;
- (void)uiController:(id)a3 preparePresentationContext:(id)a4;
@end

@implementation CDPUIWalrusLocalPasscodeVerificationController

- (CDPUIWalrusLocalPasscodeVerificationController)initWithTitle:(id)a3 presentWithViewController:(id)a4 presentationType:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CDPUIWalrusLocalPasscodeVerificationController;
  v11 = [(CDPUIWalrusLocalPasscodeVerificationController *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a3);
    uint64_t v13 = [MEMORY[0x263F34350] contextForPrimaryAccount];
    context = v12->_context;
    v12->_context = (CDPContext *)v13;

    objc_storeStrong((id *)&v12->_viewController, a4);
    v12->_presentationType = a5;
  }
  [(CDPUIWalrusLocalPasscodeVerificationController *)v12 _setupControllers];

  return v12;
}

- (void)_setupControllers
{
  v3 = (CDPStateController *)[objc_alloc(MEMORY[0x263F343F0]) initWithContext:self->_context];
  stateController = self->_stateController;
  self->_stateController = v3;

  v5 = objc_alloc_init(CDPUIController);
  uiController = self->_uiController;
  self->_uiController = v5;

  [(CDPUIController *)self->_uiController setForceInlinePresentation:1];
  if (self->_presentationType == 2) {
    [(CDPUIController *)self->_uiController setForceInlinePresentation:0];
  }
  [(CDPUIBaseController *)self->_uiController setPresentingViewController:self->_viewController];
  [(CDPUIController *)self->_uiController setTitleText:self->_title];
  [(CDPUIController *)self->_uiController setDelegate:self];
  v7 = self->_uiController;
  v8 = self->_stateController;

  [(CDPStateController *)v8 setUiProvider:v7];
}

- (void)finishWalrusLocalPasscodeVerificationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F202A8]);
  v6 = (void *)[v5 initWithEventName:*MEMORY[0x263F34670] eventCategory:*MEMORY[0x263F34830] initData:0];
  v7 = [(CDPContext *)self->_context telemetryFlowID];

  if (v7)
  {
    v8 = [(CDPContext *)self->_context telemetryFlowID];
    [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x263F20348]];
  }
  id v9 = [(CDPContext *)self->_context telemetryDeviceSessionID];

  if (v9)
  {
    id v10 = [(CDPContext *)self->_context telemetryDeviceSessionID];
    [v6 setObject:v10 forKeyedSubscript:*MEMORY[0x263F20320]];
  }
  uiController = self->_uiController;
  context = self->_context;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __102__CDPUIWalrusLocalPasscodeVerificationController_finishWalrusLocalPasscodeVerificationWithCompletion___block_invoke;
  v15[3] = &unk_26433CC00;
  id v16 = v6;
  v17 = self;
  id v18 = v4;
  id v13 = v4;
  id v14 = v6;
  [(CDPUIController *)uiController cdpContext:context promptForLocalSecretWithCompletion:v15];
}

void __102__CDPUIWalrusLocalPasscodeVerificationController_finishWalrusLocalPasscodeVerificationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = _CDPLogSystem();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v18 = "-[CDPUIWalrusLocalPasscodeVerificationController finishWalrusLocalPasscodeVerificationWithCompletion:]_block_invoke";
      _os_log_impl(&dword_2187CF000, v8, OS_LOG_TYPE_DEFAULT, "%s Validated local secret successfully.", buf, 0xCu);
    }

    [*(id *)(a1 + 32) setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F34558]];
    id v9 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
    [v9 sendEvent:*(void *)(a1 + 32)];

    uint64_t v10 = *(void *)(a1 + 40);
    v11 = *(void **)(v10 + 16);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __102__CDPUIWalrusLocalPasscodeVerificationController_finishWalrusLocalPasscodeVerificationWithCompletion___block_invoke_35;
    v14[3] = &unk_26433CBD8;
    v14[4] = v10;
    id v15 = v5;
    id v16 = *(id *)(a1 + 48);
    [v11 shouldPerformRepairWithOptionForceFetch:1 completion:v14];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __102__CDPUIWalrusLocalPasscodeVerificationController_finishWalrusLocalPasscodeVerificationWithCompletion___block_invoke_cold_1((uint64_t)v6, v8);
    }

    [*(id *)(a1 + 32) setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F34558]];
    [*(id *)(a1 + 32) populateUnderlyingErrorsStartingWithRootError:v6];
    v12 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
    [v12 sendEvent:*(void *)(a1 + 32)];

    uint64_t v13 = *(void *)(a1 + 48);
    if (v13) {
      (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v6);
    }
  }
}

void __102__CDPUIWalrusLocalPasscodeVerificationController_finishWalrusLocalPasscodeVerificationWithCompletion___block_invoke_35(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(*(void *)(a1 + 32) + 16);
    v7 = [*(id *)(a1 + 40) validatedSecret];
    uint64_t v8 = [*(id *)(a1 + 40) secretType];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __102__CDPUIWalrusLocalPasscodeVerificationController_finishWalrusLocalPasscodeVerificationWithCompletion___block_invoke_2;
    v10[3] = &unk_26433CBB0;
    id v11 = *(id *)(a1 + 48);
    [v6 localSecretChangedTo:v7 secretType:v8 completion:v10];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, uint64_t, void))(v9 + 16))(v9, 1, 0);
    }
  }
}

uint64_t __102__CDPUIWalrusLocalPasscodeVerificationController_finishWalrusLocalPasscodeVerificationWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)uiController:(id)a3 preparePresentationContext:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)uiController:(id)a3 prepareAlertContext:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_uiController, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_stateController, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

void __102__CDPUIWalrusLocalPasscodeVerificationController_finishWalrusLocalPasscodeVerificationWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "-[CDPUIWalrusLocalPasscodeVerificationController finishWalrusLocalPasscodeVerificationWithCompletion:]_block_invoke_3";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_2187CF000, a2, OS_LOG_TYPE_ERROR, "%s: Failed to validate local secret with error %@", (uint8_t *)&v2, 0x16u);
}

@end