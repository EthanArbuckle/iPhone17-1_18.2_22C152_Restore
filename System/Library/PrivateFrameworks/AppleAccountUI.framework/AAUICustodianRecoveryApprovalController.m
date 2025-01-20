@interface AAUICustodianRecoveryApprovalController
+ (id)approvalControllerWithPresenter:(id)a3 recoverySessionID:(id)a4 telemetryFlowID:(id)a5;
- (BOOL)isResetEligible;
- (id)_actionsForRecoveryCodeAlert:(id)a3 completion:(id)a4;
- (void)_promptForRecoveryCodeWithCompletion:(id)a3;
- (void)_sendAnalyticsEventWithSelectedOffer:(id)a3;
- (void)_validateRecoveryCode:(id)a3 withCompletion:(id)a4;
- (void)dealloc;
- (void)setIsResetEligible:(BOOL)a3;
- (void)validateRecoveryCodeWithCompletion:(id)a3;
@end

@implementation AAUICustodianRecoveryApprovalController

+ (id)approvalControllerWithPresenter:(id)a3 recoverySessionID:(id)a4 telemetryFlowID:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = _AAUILogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v8;
    _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "Creating Custodian Recovery Approval Controller with Session ID: %@", (uint8_t *)&v18, 0xCu);
  }

  v11 = objc_alloc_init((Class)objc_opt_class());
  v12 = (void *)v11[1];
  v11[1] = v8;
  id v13 = v8;

  v14 = (void *)v11[2];
  v11[2] = v9;
  id v15 = v9;

  v16 = (void *)v11[4];
  v11[4] = v7;

  return v11;
}

- (void)dealloc
{
  v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v3, OS_LOG_TYPE_DEFAULT, "AAUICustodianRecoveryApprovalController dealloc", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)AAUICustodianRecoveryApprovalController;
  [(AAUICustodianRecoveryApprovalController *)&v4 dealloc];
}

- (void)validateRecoveryCodeWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Custodian recovery approval validation was requested", buf, 2u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__AAUICustodianRecoveryApprovalController_validateRecoveryCodeWithCompletion___block_invoke;
  v7[3] = &unk_263F91FF8;
  id v8 = v4;
  id v6 = v4;
  [(AAUICustodianRecoveryApprovalController *)self _promptForRecoveryCodeWithCompletion:v7];
}

void __78__AAUICustodianRecoveryApprovalController_validateRecoveryCodeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 custodianUUID];

  id v8 = _AAUILogSystem();
  id v9 = v8;
  if (v6 || !v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __78__AAUICustodianRecoveryApprovalController_validateRecoveryCodeWithCompletion___block_invoke_cold_1((uint64_t)v6, v9);
    }

    v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Successfully validated custodian recovery code with context: %@", (uint8_t *)&v11, 0xCu);
    }

    v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v10();
}

- (void)_validateRecoveryCode:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x263F257F8];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  [v9 setRecoverySessionID:self->_recoverySessionID];
  [v9 setRecoveryCode:v8];

  id v10 = objc_alloc_init(MEMORY[0x263F257E8]);
  int v11 = [MEMORY[0x263F202A8] analyticsEventWithName:*MEMORY[0x263F347C0] altDSID:0 flowID:self->_telemetryFlowID];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __80__AAUICustodianRecoveryApprovalController__validateRecoveryCode_withCompletion___block_invoke;
  v14[3] = &unk_263F92020;
  id v15 = v11;
  id v16 = v6;
  id v12 = v6;
  id v13 = v11;
  [v10 validateCustodianRecoveryCodeWithContext:v9 completion:v14];
}

void __80__AAUICustodianRecoveryApprovalController__validateRecoveryCode_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *MEMORY[0x263F20330];
  if (v5) {
    [v6 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v7];
  }
  else {
    [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v7];
  }
  id v8 = [MEMORY[0x263F25780] reporter];
  [v8 sendEvent:*(void *)(a1 + 32)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_sendAnalyticsEventWithSelectedOffer:(id)a3
{
  v3 = (void *)MEMORY[0x263F202A8];
  uint64_t v4 = *MEMORY[0x263F25A98];
  telemetryFlowID = self->_telemetryFlowID;
  id v6 = a3;
  id v8 = [v3 analyticsEventWithName:v4 altDSID:0 flowID:telemetryFlowID];
  [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x263F345F8]];

  uint64_t v7 = [MEMORY[0x263F25780] reporter];
  [v7 sendEvent:v8];
}

- (void)_promptForRecoveryCodeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F202A8] analyticsEventWithName:@"com.apple.appleAccount.recoveryContactCodeEntryLanding" altDSID:0 flowID:self->_telemetryFlowID];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v7 = objc_alloc_init(AAUICodeEntryContext);
  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"CUSTODIAN_RECOVERY_CODE_PROMPT_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];
  [(AAUICodeEntryContext *)v7 setPromptTitle:v9];

  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v11 = [v10 localizedStringForKey:@"CUSTODIAN_RECOVERY_CODE_PROMPT_MESSAGE" value:&stru_26BD39CD8 table:@"Localizable"];
  [(AAUICodeEntryContext *)v7 setPromptMessage:v11];

  id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v13 = [v12 localizedStringForKey:@"CUSTODIAN_RECOVERY_CODE_PROMPT_ESCAPE_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];
  [(AAUICodeEntryContext *)v7 setEscapeTitle:v13];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke;
  v24[3] = &unk_263F92048;
  v24[4] = self;
  id v14 = v4;
  id v25 = v14;
  [(AAUICodeEntryContext *)v7 setEscapeAction:v24];
  [v6 addObject:*MEMORY[0x263F348D0]];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_55;
  v22[3] = &unk_263F92048;
  v22[4] = self;
  id v15 = v14;
  id v23 = v15;
  [(AAUICodeEntryContext *)v7 setCancelEntryAction:v22];
  [v6 addObject:*MEMORY[0x263F25BF8]];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_56;
  v20[3] = &unk_263F920C0;
  v20[4] = self;
  id v21 = v15;
  id v16 = v15;
  [(AAUICodeEntryContext *)v7 setCodeEnteredAction:v20];
  [v6 addObject:*MEMORY[0x263F34868]];
  v17 = objc_msgSend(v6, "aaf_arrayAsCommaSeperatedString");
  [v5 setObject:v17 forKeyedSubscript:*MEMORY[0x263F345E8]];

  int v18 = [[AAUICodeEntryViewController alloc] initWithContext:v7];
  [(UIViewController *)self->_presenter presentViewController:v18 animated:1 completion:0];
  id v19 = [MEMORY[0x263F25780] reporter];
  [v19 sendEvent:v5];
}

void __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_209754000, v2, OS_LOG_TYPE_DEFAULT, "Custodian Recovery Code Attempt: User elected for escape action!", v6, 2u);
  }

  id v3 = objc_loadWeakRetained(&location);
  [v3 _sendAnalyticsEventWithSelectedOffer:*MEMORY[0x263F348D0]];

  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F25640] code:-9007 userInfo:0];
  (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);

  objc_destroyWeak(&location);
}

void __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_55(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_55_cold_1();
  }

  id v3 = objc_loadWeakRetained(&location);
  [v3 _sendAnalyticsEventWithSelectedOffer:*MEMORY[0x263F25BF8]];

  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F25640] code:-9003 userInfo:0];
  (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);

  objc_destroyWeak(&location);
}

void __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_56(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) _sendAnalyticsEventWithSelectedOffer:*MEMORY[0x263F34868]];
  uint64_t v7 = _AAUILogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "Custodian Recovery Code Attempt: Code Entered: %@", buf, 0xCu);
  }

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_57;
  v10[3] = &unk_263F92098;
  id v11 = v6;
  id v8 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v9 = v6;
  [v8 _validateRecoveryCode:v5 withCompletion:v10];
}

void __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_57(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_57_cold_2((uint64_t)v6, v7);
    }

    char v8 = objc_msgSend(v6, "aa_isAACustodianRecoveryErrorWithCode:", -9002);
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    if (v8)
    {
      v9();
      goto LABEL_13;
    }
    v9();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_58;
    block[3] = &unk_263F92070;
    id v17 = *(id *)(a1 + 40);
    id v16 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);

    id v10 = v17;
LABEL_9:

    goto LABEL_13;
  }
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_59;
    v12[3] = &unk_263F92048;
    id v13 = v5;
    id v14 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], v12);

    id v10 = v13;
    goto LABEL_9;
  }
  id v11 = _AAUILogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_57_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_13:
}

uint64_t __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_58(uint64_t a1)
{
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_58_cold_1();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_59(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_209754000, v2, OS_LOG_TYPE_DEFAULT, "Custodian Recovery Code Attempt: Code validation success! Custodian with context: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_actionsForRecoveryCodeAlert:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83__AAUICustodianRecoveryApprovalController__actionsForRecoveryCodeAlert_completion___block_invoke;
  v15[3] = &unk_263F920E8;
  id v8 = v6;
  id v16 = v8;
  objc_msgSend(v7, "setAk_cancelAction:", v15);
  objc_initWeak(&location, v5);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __83__AAUICustodianRecoveryApprovalController__actionsForRecoveryCodeAlert_completion___block_invoke_63;
  v11[3] = &unk_263F92110;
  objc_copyWeak(&v13, &location);
  id v9 = v8;
  id v12 = v9;
  [v7 setCodeEnteredAction:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v7;
}

void __83__AAUICustodianRecoveryApprovalController__actionsForRecoveryCodeAlert_completion___block_invoke(uint64_t a1)
{
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __83__AAUICustodianRecoveryApprovalController__actionsForRecoveryCodeAlert_completion___block_invoke_cold_1();
  }

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F25640] code:-9003 userInfo:0];
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
}

void __83__AAUICustodianRecoveryApprovalController__actionsForRecoveryCodeAlert_completion___block_invoke_63(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "User entered recovery code %@.", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained setPasscodeFieldDisabled:1];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isResetEligible
{
  return self->_isResetEligible;
}

- (void)setIsResetEligible:(BOOL)a3
{
  self->_isResetEligible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_storeStrong((id *)&self->_recoverySessionID, 0);
}

void __78__AAUICustodianRecoveryApprovalController_validateRecoveryCodeWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_209754000, a2, OS_LOG_TYPE_ERROR, "Failed to validate recovery code from user, bailing: %@", (uint8_t *)&v2, 0xCu);
}

void __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_55_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Custodian Recovery Code Attempt: User Cancelled Code Entry!", v2, v3, v4, v5, v6);
}

void __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_57_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Custodian Recovery Code Attempt: Failed with no error or context", v2, v3, v4, v5, v6);
}

void __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_57_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_209754000, a2, OS_LOG_TYPE_ERROR, "Custodian Recovery Code Attempt: Code validation failed: %@", (uint8_t *)&v2, 0xCu);
}

void __80__AAUICustodianRecoveryApprovalController__promptForRecoveryCodeWithCompletion___block_invoke_58_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Custodian Recovery Code Attempt: Failed with unrecoverable error. bailing....", v2, v3, v4, v5, v6);
}

void __83__AAUICustodianRecoveryApprovalController__actionsForRecoveryCodeAlert_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "User canceled recovery code entry!", v2, v3, v4, v5, v6);
}

@end