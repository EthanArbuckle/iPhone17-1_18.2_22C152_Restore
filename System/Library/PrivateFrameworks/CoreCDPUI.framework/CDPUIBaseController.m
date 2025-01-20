@interface CDPUIBaseController
- (CDPUIBaseController)initWithPresentingViewController:(id)a3;
- (UIViewController)presentingViewController;
- (void)cdpContext:(id)a3 promptForAdoptionOfMultipleICSC:(id)a4;
- (void)cdpContext:(id)a3 promptForICSCWithIsNumeric:(BOOL)a4 numericLength:(id)a5 isRandom:(BOOL)a6 validator:(id)a7;
- (void)cdpContext:(id)a3 promptForInteractiveAuthenticationWithCompletion:(id)a4;
- (void)cdpContext:(id)a3 promptForLocalSecretWithCompletion:(id)a4;
- (void)cdpContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 offeringRemoteApproval:(BOOL)a5 validator:(id)a6;
- (void)cdpContext:(id)a3 showError:(id)a4 withCompletion:(id)a5;
- (void)cdpContext:(id)a3 showError:(id)a4 withDefaultIndex:(int64_t)a5 withCompletion:(id)a6;
- (void)cdpRecoveryFlowContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 validator:(id)a5;
- (void)createLocalSecretWithCompletion:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation CDPUIBaseController

- (CDPUIBaseController)initWithPresentingViewController:(id)a3
{
  id v4 = a3;
  v5 = [(CDPUIBaseController *)self init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_presentingViewController, v4);
  }

  return v6;
}

- (void)cdpContext:(id)a3 promptForInteractiveAuthenticationWithCompletion:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 appleID];

  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F292A8]);
    v10 = [v6 appleID];
    [v9 setUsername:v10];

    v11 = [v6 altDSID];
    [v9 setAltDSID:v11];

    v12 = [v6 dsid];
    v13 = [v12 stringValue];
    [v9 setDSID:v13];

    [v9 setAuthenticationType:2];
    objc_msgSend(v9, "setIgnorePasswordCache:", objc_msgSend(v6, "ignorePasswordCache"));
    v14 = [v6 interactiveAuthDefaultButtonString];
    uint64_t v15 = [v14 length];

    if (v15)
    {
      [v9 setEnablePasscodeAuth:0];
      v16 = [v6 interactiveAuthDefaultButtonString];
      [v9 setDefaultButtonString:v16];
    }
    [v9 setAnticipateEscrowAttempt:1];
    [v9 setIsUsernameEditable:0];
    [v9 setSupportsPiggybacking:1];
    [v9 setShouldOfferSecurityUpgrade:1];
    v17 = [(CDPUIBaseController *)self presentingViewController];
    v18 = [v17 presentedViewController];
    if (v18)
    {
      [v9 setPresentingViewController:v18];
    }
    else
    {
      v19 = [(CDPUIBaseController *)self presentingViewController];
      [v9 setPresentingViewController:v19];
    }
    if ([v6 type] == 6)
    {
      v20 = NSString;
      v21 = [MEMORY[0x263F343B8] builderForKey:@"LOCAL_SECRET_PASSWORD_PROMPT"];
      v22 = [v21 localizedString];
      v23 = [v6 appleID];
      v24 = [v20 stringWithValidatedFormat:v22, @"%@", 0, v23 validFormatSpecifiers error];
      [v9 setReason:v24];
    }
    v25 = _CDPLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [v6 appleID];
      v27 = [v9 presentingViewController];
      *(_DWORD *)buf = 138412546;
      v32 = v26;
      __int16 v33 = 2112;
      v34 = v27;
      _os_log_impl(&dword_2187CF000, v25, OS_LOG_TYPE_DEFAULT, "Attempting to perform an interactive authentication for %@... using %@", buf, 0x16u);
    }
    id v28 = objc_alloc_init(MEMORY[0x263F29118]);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __83__CDPUIBaseController_cdpContext_promptForInteractiveAuthenticationWithCompletion___block_invoke;
    v29[3] = &unk_26433D880;
    id v30 = v7;
    [v28 authenticateWithContext:v9 completion:v29];

    goto LABEL_14;
  }
  if (v7)
  {
    _CDPStateError();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v9);
LABEL_14:
  }
}

uint64_t __83__CDPUIBaseController_cdpContext_promptForInteractiveAuthenticationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)cdpContext:(id)a3 showError:(id)a4 withCompletion:(id)a5
{
}

- (void)cdpContext:(id)a3 showError:(id)a4 withDefaultIndex:(int64_t)a5 withCompletion:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  v11 = (void *)MEMORY[0x263F82418];
  v12 = [v9 localizedDescription];
  v13 = [v9 localizedFailureReason];
  v14 = [v11 alertControllerWithTitle:v12 message:v13 preferredStyle:1];

  uint64_t v15 = [v9 localizedRecoveryOptions];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __76__CDPUIBaseController_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke;
  v31[3] = &unk_26433DB40;
  id v16 = v10;
  id v34 = v16;
  id v17 = v14;
  id v32 = v17;
  int64_t v35 = a5;
  id v18 = v9;
  id v33 = v18;
  [v15 enumerateObjectsUsingBlock:v31];

  v19 = [v17 actions];
  uint64_t v20 = [v19 count];

  if (!v20)
  {
    v21 = (void *)MEMORY[0x263F82400];
    v22 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_ERROR_DEFAULT_BUTTON"];
    v23 = [v22 localizedString];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __76__CDPUIBaseController_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke_3;
    v29[3] = &unk_26433D010;
    id v30 = v16;
    v24 = [v21 actionWithTitle:v23 style:0 handler:v29];

    [v17 addAction:v24];
  }
  v25 = [(CDPUIBaseController *)self presentingViewController];
  v26 = [v25 presentedViewController];
  v27 = v26;
  if (v26)
  {
    [v26 presentViewController:v17 animated:1 completion:0];
  }
  else
  {
    id v28 = [(CDPUIBaseController *)self presentingViewController];
    [v28 presentViewController:v17 animated:1 completion:0];
  }
}

void __76__CDPUIBaseController_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = (void *)MEMORY[0x263F82400];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __76__CDPUIBaseController_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke_2;
  v13 = &unk_26433DB18;
  id v14 = *(id *)(a1 + 48);
  uint64_t v15 = a3;
  id v7 = [v6 actionWithTitle:a2 style:0 handler:&v10];
  objc_msgSend(*(id *)(a1 + 32), "addAction:", v7, v10, v11, v12, v13);
  if (*(void *)(a1 + 56) == a3)
  {
    if (![MEMORY[0x263F34400] isICSCHarmonizationEnabled]
      || ([*(id *)(a1 + 40) localizedRecoveryOptions],
          v8 = objc_claimAutoreleasedReturnValue(),
          unint64_t v9 = [v8 count],
          v8,
          v9 <= 2))
    {
      [*(id *)(a1 + 32) setPreferredAction:v7];
    }
  }
}

uint64_t __76__CDPUIBaseController_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __76__CDPUIBaseController_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cdpContext:(id)a3 promptForLocalSecretWithCompletion:(id)a4
{
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CDPUIBaseController cdpContext:promptForLocalSecretWithCompletion:]();
  }
}

- (void)cdpContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 offeringRemoteApproval:(BOOL)a5 validator:(id)a6
{
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[CDPUIBaseController cdpContext:promptForLocalSecretWithCompletion:]();
  }
}

- (void)cdpRecoveryFlowContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 validator:(id)a5
{
  v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    -[CDPUIBaseController cdpRecoveryFlowContext:promptForRemoteSecretWithDevices:validator:]();
  }
}

- (void)cdpContext:(id)a3 promptForICSCWithIsNumeric:(BOOL)a4 numericLength:(id)a5 isRandom:(BOOL)a6 validator:(id)a7
{
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[CDPUIBaseController cdpContext:promptForLocalSecretWithCompletion:]();
  }
}

- (void)cdpContext:(id)a3 promptForAdoptionOfMultipleICSC:(id)a4
{
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CDPUIBaseController cdpContext:promptForLocalSecretWithCompletion:]();
  }
}

- (void)createLocalSecretWithCompletion:(id)a3
{
  v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[CDPUIBaseController cdpContext:promptForLocalSecretWithCompletion:]();
  }
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)cdpContext:promptForLocalSecretWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_2187CF000, v0, v1, "Not implemented", v2, v3, v4, v5, v6);
}

- (void)cdpRecoveryFlowContext:promptForRemoteSecretWithDevices:validator:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_2187CF000, v0, OS_LOG_TYPE_FAULT, "Not implemented", v1, 2u);
}

@end