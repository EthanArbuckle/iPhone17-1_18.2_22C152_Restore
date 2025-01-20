@interface AKAccountRecoveryStepiCloudSecurityCode
- (BOOL)canProcessResponse:(id)a3;
- (id)_promptForPasscodeWithModel:(id)a3;
- (id)_promptForRecoveryKeyWithModel:(id)a3;
- (void)_beginICloudSecurityCodeWithResponse:(id)a3 model:(id)a4 completion:(id)a5;
- (void)_verifyClientInfoWithResponse:(id)a3 model:(id)a4 completion:(id)a5;
- (void)_verifyLocalSecretWithModel:(id)a3 completion:(id)a4;
- (void)_verifyPinViewWithResponse:(id)a3 model:(id)a4 completion:(id)a5;
- (void)_verifyRemoteSecretWithRecoveryContext:(id)a3 recoveredInfo:(id)a4 recoveryError:(id)a5 model:(id)a6 completion:(id)a7;
- (void)_verifyRemoteSecretWithServerInfo:(id)a3 model:(id)a4 completion:(id)a5;
- (void)cdpContext:(id)a3 presentRecoveryKeyWithValidator:(id)a4 completion:(id)a5;
- (void)cdpContext:(id)a3 promptForAdoptionOfMultipleICSC:(id)a4;
- (void)cdpContext:(id)a3 promptForBeneficiaryAccessKeyWithCompletion:(id)a4;
- (void)cdpContext:(id)a3 promptForICSCWithIsNumeric:(BOOL)a4 numericLength:(id)a5 isRandom:(BOOL)a6 validator:(id)a7;
- (void)cdpContext:(id)a3 promptForInteractiveAuthenticationWithCompletion:(id)a4;
- (void)cdpContext:(id)a3 promptForRecoveryKeyWithSecretValidator:(id)a4 completion:(id)a5;
- (void)cdpContext:(id)a3 promptForRecoveryKeyWithValidator:(id)a4 completion:(id)a5;
- (void)cdpContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 offeringRemoteApproval:(BOOL)a5 validator:(id)a6;
- (void)cdpRecoveryFlowContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 validator:(id)a5;
- (void)processResponse:(id)a3 model:(id)a4 withCompletion:(id)a5;
@end

@implementation AKAccountRecoveryStepiCloudSecurityCode

- (void)processResponse:(id)a3 model:(id)a4 withCompletion:(id)a5
{
  v8 = (AKAccountRecoveryModel *)a4;
  id v9 = a5;
  id v14 = a3;
  v10 = (void *)MEMORY[0x1996FE880](v9);
  id completion = self->_completion;
  self->_id completion = v10;

  model = self->_model;
  self->_model = v8;
  v13 = v8;

  [(AKAccountRecoveryStepiCloudSecurityCode *)self _beginICloudSecurityCodeWithResponse:v14 model:v13 completion:v9];
}

- (BOOL)canProcessResponse:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 data];
  v5 = +[AKAppleIDAuthenticationCommandLineContext ruiElementsAttributesWithName:@"navigationBar" data:v4 error:0];

  v6 = [v5 firstObject];
  v7 = [v6 objectForKeyedSubscript:@"title"];
  v8 = [v7 lowercaseString];
  LOBYTE(v4) = [v8 containsString:@"passcode"];

  id v9 = [v3 httpResponse];
  v10 = [v9 allHeaderFields];
  v11 = [v10 objectForKey:@"X-Apple-AK-Action"];
  char v12 = [v11 isEqualToString:@"start-icsc"];

  v13 = [v3 httpResponse];
  id v14 = [v13 allHeaderFields];
  v15 = [v14 objectForKey:@"X-Apple-AK-Auth-Type"];
  char v16 = [v15 isEqualToString:@"hsa2"];

  v17 = [v3 httpResponse];

  v18 = [v17 allHeaderFields];
  v19 = [v18 objectForKey:@"X-Apple-AK-Action"];
  char v20 = [v19 isEqualToString:@"mk-validation"];

  if (v4) {
    char v21 = 1;
  }
  else {
    char v21 = (v12 | v20) & v16;
  }

  return v21;
}

- (void)cdpContext:(id)a3 promptForAdoptionOfMultipleICSC:(id)a4
{
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AKAccountRecoveryStepiCloudSecurityCode cdpContext:promptForAdoptionOfMultipleICSC:]();
  }

  id completion = self->_completion;
  if (completion)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7014);
    (*((void (**)(id, void, void, void, void, void *))completion + 2))(completion, 0, 0, 0, 0, v7);
  }
}

- (void)cdpContext:(id)a3 promptForBeneficiaryAccessKeyWithCompletion:(id)a4
{
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AKAccountRecoveryStepiCloudSecurityCode cdpContext:promptForAdoptionOfMultipleICSC:]();
  }

  id completion = self->_completion;
  if (completion)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7014);
    (*((void (**)(id, void, void, void, void, void *))completion + 2))(completion, 0, 0, 0, 0, v7);
  }
}

- (void)cdpContext:(id)a3 promptForICSCWithIsNumeric:(BOOL)a4 numericLength:(id)a5 isRandom:(BOOL)a6 validator:(id)a7
{
  v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AKAccountRecoveryStepiCloudSecurityCode cdpContext:promptForAdoptionOfMultipleICSC:]();
  }

  id completion = self->_completion;
  if (completion)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7014);
    (*((void (**)(id, void, void, void, void, void *))completion + 2))(completion, 0, 0, 0, 0, v10);
  }
}

- (void)cdpContext:(id)a3 promptForInteractiveAuthenticationWithCompletion:(id)a4
{
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AKAccountRecoveryStepiCloudSecurityCode cdpContext:promptForAdoptionOfMultipleICSC:]();
  }

  id completion = self->_completion;
  if (completion)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7014);
    (*((void (**)(id, void, void, void, void, void *))completion + 2))(completion, 0, 0, 0, 0, v7);
  }
}

- (void)cdpContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 offeringRemoteApproval:(BOOL)a5 validator:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(AKAccountRecoveryStepiCloudSecurityCode *)self _promptForPasscodeWithModel:self->_model];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __120__AKAccountRecoveryStepiCloudSecurityCode_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke;
  v17[3] = &unk_1E5760648;
  v17[4] = self;
  id v18 = v10;
  BOOL v21 = a5;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  [v14 validateSecret:v13 devices:v15 type:0 withCompletion:v17];
}

void __120__AKAccountRecoveryStepiCloudSecurityCode_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  if (a2)
  {
    v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __120__AKAccountRecoveryStepiCloudSecurityCode_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else if (a3)
  {
    [*(id *)(a1 + 32) cdpContext:*(void *)(a1 + 40) promptForRemoteSecretWithDevices:*(void *)(a1 + 48) offeringRemoteApproval:*(unsigned __int8 *)(a1 + 64) validator:*(void *)(a1 + 56)];
  }
  else
  {
    id v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __120__AKAccountRecoveryStepiCloudSecurityCode_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke_cold_2((uint64_t)v7, v16, v17, v18, v19, v20, v21, v22);
    }

    uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 8);
    if (v23) {
      (*(void (**)(uint64_t, void, void, void, void, id))(v23 + 16))(v23, 0, 0, 0, 0, v7);
    }
  }
}

- (void)cdpRecoveryFlowContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 validator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(AKAccountRecoveryStepiCloudSecurityCode *)self _promptForPasscodeWithModel:self->_model];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __109__AKAccountRecoveryStepiCloudSecurityCode_cdpRecoveryFlowContext_promptForRemoteSecretWithDevices_validator___block_invoke;
  v15[3] = &unk_1E5760670;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v12 validateSecret:v11 devices:v13 type:0 withCompletion:v15];
}

void __109__AKAccountRecoveryStepiCloudSecurityCode_cdpRecoveryFlowContext_promptForRemoteSecretWithDevices_validator___block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  if (a2)
  {
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __120__AKAccountRecoveryStepiCloudSecurityCode_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else if (a3)
  {
    [*(id *)(a1 + 32) cdpRecoveryFlowContext:*(void *)(a1 + 40) promptForRemoteSecretWithDevices:*(void *)(a1 + 48) validator:*(void *)(a1 + 56)];
  }
  else
  {
    id v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __120__AKAccountRecoveryStepiCloudSecurityCode_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke_cold_2((uint64_t)v7, v16, v17, v18, v19, v20, v21, v22);
    }

    uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 8);
    if (v23) {
      (*(void (**)(uint64_t, void, void, void, void, id))(v23 + 16))(v23, 0, 0, 0, 0, v7);
    }
  }
}

- (void)cdpContext:(id)a3 presentRecoveryKeyWithValidator:(id)a4 completion:(id)a5
{
  id v7 = a5;
  model = self->_model;
  id v9 = a4;
  uint64_t v10 = [(AKAccountRecoveryStepiCloudSecurityCode *)self _promptForRecoveryKeyWithModel:model];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __97__AKAccountRecoveryStepiCloudSecurityCode_cdpContext_presentRecoveryKeyWithValidator_completion___block_invoke;
  v12[3] = &unk_1E575EF90;
  id v13 = v7;
  id v11 = v7;
  [v9 confirmRecoveryKey:v10 completion:v12];
}

void __97__AKAccountRecoveryStepiCloudSecurityCode_cdpContext_presentRecoveryKeyWithValidator_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __97__AKAccountRecoveryStepiCloudSecurityCode_cdpContext_presentRecoveryKeyWithValidator_completion___block_invoke_cold_1();
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)cdpContext:(id)a3 promptForRecoveryKeyWithValidator:(id)a4 completion:(id)a5
{
  id v7 = a5;
  model = self->_model;
  id v9 = a4;
  uint64_t v10 = [(AKAccountRecoveryStepiCloudSecurityCode *)self _promptForRecoveryKeyWithModel:model];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __99__AKAccountRecoveryStepiCloudSecurityCode_cdpContext_promptForRecoveryKeyWithValidator_completion___block_invoke;
  v12[3] = &unk_1E575EF90;
  id v13 = v7;
  id v11 = v7;
  [v9 confirmRecoveryKey:v10 completion:v12];
}

void __99__AKAccountRecoveryStepiCloudSecurityCode_cdpContext_promptForRecoveryKeyWithValidator_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __97__AKAccountRecoveryStepiCloudSecurityCode_cdpContext_presentRecoveryKeyWithValidator_completion___block_invoke_cold_1();
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)cdpContext:(id)a3 promptForRecoveryKeyWithSecretValidator:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(AKAccountRecoveryStepiCloudSecurityCode *)self _promptForRecoveryKeyWithModel:self->_model];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __105__AKAccountRecoveryStepiCloudSecurityCode_cdpContext_promptForRecoveryKeyWithSecretValidator_completion___block_invoke;
  v15[3] = &unk_1E5760698;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v13 validateRecoveryKey:v11 withCompletion:v15];
}

void __105__AKAccountRecoveryStepiCloudSecurityCode_cdpContext_promptForRecoveryKeyWithSecretValidator_completion___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v7 = a4;
  if (v7 && a3)
  {
    [*(id *)(a1 + 32) cdpContext:*(void *)(a1 + 40) promptForRecoveryKeyWithSecretValidator:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __97__AKAccountRecoveryStepiCloudSecurityCode_cdpContext_presentRecoveryKeyWithValidator_completion___block_invoke_cold_1();
    }

    uint64_t v9 = *(void *)(a1 + 56);
    if (v9) {
      (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v7);
    }
  }
}

- (void)_beginICloudSecurityCodeWithResponse:(id)a3 model:(id)a4 completion:(id)a5
{
  id v21 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v21 data];
  id v11 = +[AKAppleIDAuthenticationCommandLineContext ruiElementsAttributesWithName:@"alert" data:v10 error:0];

  id v12 = [v21 data];
  id v13 = +[AKAppleIDAuthenticationCommandLineContext ruiElementsAttributesWithName:@"button" data:v12 error:0];

  if ([v11 count] == 1
    && [v13 count] == 1
    && ([v11 firstObject],
        id v14 = objc_claimAutoreleasedReturnValue(),
        [v14 objectForKeyedSubscript:@"id"],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v15 isEqualToString:@"forgotpasscode"],
        v15,
        v14,
        v16))
  {
    id v17 = [v8 cliUtilities];
    id v18 = [v8 configuration];
    uint64_t v19 = [v13 firstObject];
    uint64_t v20 = [v21 httpResponse];
    [v17 updateConfiguration:v18 fromXMLAttributes:v19 response:v20];

    [(AKAccountRecoveryStepiCloudSecurityCode *)self _verifyLocalSecretWithModel:v8 completion:v9];
  }
  else
  {
    [(AKAccountRecoveryStepiCloudSecurityCode *)self _verifyClientInfoWithResponse:v21 model:v8 completion:v9];
  }
}

- (void)_verifyClientInfoWithResponse:(id)a3 model:(id)a4 completion:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [v9 data];
  id v11 = +[AKAppleIDAuthenticationCommandLineContext ruiElementsAttributesWithName:@"clientInfo" data:v10 error:0];

  if ([v11 count] == 1)
  {
    id v12 = [v9 httpResponse];

    id v13 = [v12 allHeaderFields];
    id v14 = [v11 firstObject];
    objc_msgSend(v13, "aaf_dictionaryByAddingEntriesFromDictionary:", v14);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    [(AKAccountRecoveryStepiCloudSecurityCode *)self _verifyRemoteSecretWithServerInfo:v9 model:v15 completion:v8];
  }
  else
  {
    [(AKAccountRecoveryStepiCloudSecurityCode *)self _verifyPinViewWithResponse:v9 model:v15 completion:v8];
  }
}

- (void)_verifyPinViewWithResponse:(id)a3 model:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 data];
  id v12 = +[AKAppleIDAuthenticationCommandLineContext ruiElementsAttributesWithName:@"pinView" data:v11 error:0];

  if ([v12 count] == 1)
  {
    id v13 = [v9 cliUtilities];
    id v14 = [v9 configuration];
    id v15 = [v12 firstObject];
    int v16 = [v8 httpResponse];
    [v13 updateConfiguration:v14 fromXMLAttributes:v15 response:v16];

    [(AKAccountRecoveryStepiCloudSecurityCode *)self _verifyLocalSecretWithModel:v9 completion:v10];
  }
  else
  {
    id v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[AKAccountRecoveryStepiCloudSecurityCode _verifyPinViewWithResponse:model:completion:]();
    }

    if (v10)
    {
      id v18 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7027);
      (*((void (**)(id, void, void, void, void, void *))v10 + 2))(v10, 0, 0, 0, 0, v18);
    }
  }
}

- (void)_verifyLocalSecretWithModel:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[AKDevice currentDevice];
  char v8 = [v7 isProtectedWithPasscode];

  if (v8)
  {
    id v9 = [v5 configuration];
    id v10 = v9;
    if (v9)
    {
      id v11 = [v9 request];
      id v12 = (void *)[v11 mutableCopy];

      id v13 = [v5 cliUtilities];
      [v13 signXMLRequest:v12 withPostbackDictionary:MEMORY[0x1E4F1CC08]];

      id v14 = [v10 resourceLoadDelegate];
      [v14 signRequest:v12];

      id v15 = [v5 cliUtilities];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __82__AKAccountRecoveryStepiCloudSecurityCode__verifyLocalSecretWithModel_completion___block_invoke;
      v17[3] = &unk_1E575F4C0;
      id v18 = v6;
      [v15 beginDataTaskWithRequest:v12 completionHandler:v17];
    }
    else
    {
      int v16 = _AKLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[AKAccountRecoveryStepSMSVerificationCode _beginSMSCodeVerificationWithResponse:model:completion:]();
      }

      if (!v6) {
        goto LABEL_11;
      }
      id v12 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7014);
      (*((void (**)(id, void, void, void, void, void *))v6 + 2))(v6, 0, 0, 0, 0, v12);
    }

LABEL_11:
    goto LABEL_12;
  }
  if (v6)
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7080);
    (*((void (**)(id, void, void, void, void, void *))v6 + 2))(v6, 0, 0, 0, 0, v10);
    goto LABEL_11;
  }
LABEL_12:
}

uint64_t __82__AKAccountRecoveryStepiCloudSecurityCode__verifyLocalSecretWithModel_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, void))(result + 16))(result, 1, a2, a3, 0, 0);
  }
  return result;
}

- (void)_verifyRemoteSecretWithServerInfo:(id)a3 model:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = +[AKAccountRecoveryContext recoveryContextWithServerInfo:a3];
  if ([v10 isValid])
  {
    id v11 = [[AKNativeAccountRecoveryController alloc] initWithContext:v10 uiProvider:self flowID:0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __94__AKAccountRecoveryStepiCloudSecurityCode__verifyRemoteSecretWithServerInfo_model_completion___block_invoke;
    v13[3] = &unk_1E57606C0;
    v13[4] = self;
    id v14 = v10;
    id v15 = v8;
    id v16 = v9;
    [(AKNativeAccountRecoveryController *)v11 presentNativeRecoveryUIWithCompletion:v13];

LABEL_7:
    goto LABEL_8;
  }
  id v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[AKAccountRecoveryStepiCloudSecurityCode _verifyRemoteSecretWithServerInfo:model:completion:]();
  }

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7059);
    id v11 = (AKNativeAccountRecoveryController *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, void, void, AKNativeAccountRecoveryController *))v9 + 2))(v9, 0, 0, 0, 0, v11);
    goto LABEL_7;
  }
LABEL_8:
}

void __94__AKAccountRecoveryStepiCloudSecurityCode__verifyRemoteSecretWithServerInfo_model_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __94__AKAccountRecoveryStepiCloudSecurityCode__verifyRemoteSecretWithServerInfo_model_completion___block_invoke_cold_1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
    }

    [*(id *)(a1 + 32) _verifyRemoteSecretWithRecoveryContext:*(void *)(a1 + 40) recoveredInfo:v5 recoveryError:v6 model:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 56);
    if (v14) {
      (*(void (**)(uint64_t, void, void, void, void, id))(v14 + 16))(v14, 0, 0, 0, 0, v6);
    }
  }
}

- (void)_verifyRemoteSecretWithRecoveryContext:(id)a3 recoveredInfo:(id)a4 recoveryError:(id)a5 model:(id)a6 completion:(id)a7
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [v14 configuration];
  if (v16)
  {
    id v17 = +[AKNativeAccountRecoveryController requestForRecoveryCompletionWithContext:v11 recoveredInfo:v12 recoveryError:v13];
    [v16 setRequest:v17];
    id v18 = [v16 request];
    uint64_t v19 = (void *)[v18 mutableCopy];

    uint64_t v20 = [v14 cliUtilities];
    v34[0] = @"appleid";
    [v11 authContext];
    id v21 = v30 = v14;
    [v21 username];
    uint64_t v22 = v31 = v12;
    v34[1] = @"status";
    v35[0] = v22;
    v35[1] = @"success";
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    uint64_t v23 = v15;
    id v24 = v11;
    v26 = id v25 = v13;
    [v20 signXMLRequest:v19 withPostbackDictionary:v26];

    id v13 = v25;
    id v11 = v24;
    id v15 = v23;

    id v14 = v30;
    v27 = [v16 resourceLoadDelegate];
    [v27 signRequest:v19];

    v28 = [v30 cliUtilities];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __127__AKAccountRecoveryStepiCloudSecurityCode__verifyRemoteSecretWithRecoveryContext_recoveredInfo_recoveryError_model_completion___block_invoke;
    v32[3] = &unk_1E575F4C0;
    id v33 = v23;
    [v28 beginDataTaskWithRequest:v19 completionHandler:v32];

    id v12 = v31;
LABEL_7:

    goto LABEL_8;
  }
  v29 = _AKLogSystem();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
    -[AKAccountRecoveryStepSMSVerificationCode _beginSMSCodeVerificationWithResponse:model:completion:]();
  }

  if (v15)
  {
    id v17 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7014);
    (*((void (**)(id, void, void, void, void, void *))v15 + 2))(v15, 0, 0, 0, 0, v17);
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __127__AKAccountRecoveryStepiCloudSecurityCode__verifyRemoteSecretWithRecoveryContext_recoveredInfo_recoveryError_model_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, void))(result + 16))(result, 1, a2, a3, 0, 0);
  }
  return result;
}

- (id)_promptForPasscodeWithModel:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 context];
  id v5 = [v4 localSecret];

  if (![v5 length])
  {
    AKPrint(@"Enter device passcode: ", v6, v7, v8, v9, v10, v11, v12, v16);
    uint64_t v13 = AKReadLine(1024);

    if (v13)
    {
      id v14 = [v3 context];
      [v14 setLocalSecret:v13];

      id v5 = (void *)v13;
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)_promptForRecoveryKeyWithModel:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 context];
  id v5 = [v4 recoveryKey];

  if ([v5 length])
  {
    uint64_t v13 = v5;
  }
  else
  {
    AKPrint(@"Enter recovery key: ", v6, v7, v8, v9, v10, v11, v12, v16);
    uint64_t v13 = AKReadLine(1024);

    if ([v13 length])
    {
      id v14 = [v3 context];
      [v14 setRecoveryKey:v13];
    }
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong(&self->_completion, 0);
}

- (void)cdpContext:promptForAdoptionOfMultipleICSC:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Failed verify security code step. Unsupported recovery method.", v2, v3, v4, v5, v6);
}

void __120__AKAccountRecoveryStepiCloudSecurityCode_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __120__AKAccountRecoveryStepiCloudSecurityCode_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __97__AKAccountRecoveryStepiCloudSecurityCode_cdpContext_presentRecoveryKeyWithValidator_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_3(&dword_193494000, v0, v1, "RK validated - %d", v2, v3, v4, v5, v6);
}

- (void)_verifyPinViewWithResponse:model:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Failed verify security code step with unexpected data", v2, v3, v4, v5, v6);
}

- (void)_verifyRemoteSecretWithServerInfo:model:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Recovery context is invalid...", v2, v3, v4, v5, v6);
}

void __94__AKAccountRecoveryStepiCloudSecurityCode__verifyRemoteSecretWithServerInfo_model_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end