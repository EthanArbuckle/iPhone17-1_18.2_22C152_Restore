@interface CDPToolFakeUIProvider
- (AKInheritanceAccessKey)accessKey;
- (NSString)icsc;
- (NSString)localSecret;
- (NSString)recoveryKey;
- (NSString)recoveryToken;
- (NSString)remoteSecret;
- (void)cdpContext:(id)a3 promptForAdoptionOfMultipleICSC:(id)a4;
- (void)cdpContext:(id)a3 promptForBeneficiaryAccessKeyWithCompletion:(id)a4;
- (void)cdpContext:(id)a3 promptForEDPRecoveryTokenWithValidator:(id)a4 successfulCDPRecoveryContinuationHandler:(id)a5;
- (void)cdpContext:(id)a3 promptForICSCWithIsNumeric:(BOOL)a4 numericLength:(id)a5 isRandom:(BOOL)a6 validator:(id)a7;
- (void)cdpContext:(id)a3 promptForInteractiveAuthenticationWithCompletion:(id)a4;
- (void)cdpContext:(id)a3 promptForLocalSecretWithCompletion:(id)a4;
- (void)cdpContext:(id)a3 promptForRecoveryKeyWithSecretValidator:(id)a4 completion:(id)a5;
- (void)cdpContext:(id)a3 promptForRecoveryKeyWithValidator:(id)a4 completion:(id)a5;
- (void)cdpContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 offeringRemoteApproval:(BOOL)a5 validator:(id)a6;
- (void)cdpRecoveryFlowContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 validator:(id)a5;
- (void)setAccessKey:(id)a3;
- (void)setIcsc:(id)a3;
- (void)setLocalSecret:(id)a3;
- (void)setRecoveryKey:(id)a3;
- (void)setRecoveryToken:(id)a3;
- (void)setRemoteSecret:(id)a3;
- (void)showCustodianProvidedCodeEntryScreen:(id)a3 controller:(id)a4 validator:(id)a5;
- (void)startCustodianRecoveryWithContext:(id)a3 validator:(id)a4;
- (void)validateCode:(id)a3 controller:(id)a4 completion:(id)a5;
@end

@implementation CDPToolFakeUIProvider

- (void)cdpContext:(id)a3 promptForLocalSecretWithCompletion:(id)a4
{
  v5 = (void (**)(id, CDPLocalSecret *, void))a4;
  v6 = +[CDPLocalDevice sharedInstance];
  int v7 = [v6 hasLocalSecret];

  if (!v7)
  {
    uint64_t v13 = 2;
LABEL_8:
    v8 = [[CDPLocalSecret alloc] initWithValidatedSecret:self->_localSecret secretType:v13];
    v5[2](v5, v8, 0);
    goto LABEL_12;
  }
  v8 = [MEMORY[0x263F53C50] sharedConnection];
  localSecret = self->_localSecret;
  id v16 = 0;
  char v10 = [(CDPLocalSecret *)v8 unlockDeviceWithPasscode:localSecret outError:&v16];
  id v11 = v16;
  v12 = v11;
  if (v10)
  {
    printf("Local secret is set and valid");
    int v15 = 0;
    [(CDPLocalSecret *)v8 unlockScreenTypeWithOutSimplePasscodeType:&v15];
    if (v15 == -1) {
      uint64_t v13 = 3;
    }
    else {
      uint64_t v13 = 2;
    }

    goto LABEL_8;
  }
  id v14 = [v11 description];
  printf("Local secret is invalid, error: %s\n", (const char *)[v14 UTF8String]);

  if (v5) {
    ((void (**)(id, CDPLocalSecret *, void *))v5)[2](v5, 0, v12);
  }

LABEL_12:
}

- (void)cdpContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 offeringRemoteApproval:(BOOL)a5 validator:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = v11;
  remoteSecret = self->_remoteSecret;
  if (remoteSecret)
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __102__CDPToolFakeUIProvider_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke;
    v23[3] = &unk_2643178B8;
    id v24 = v11;
    [v24 validateSecret:remoteSecret devices:v10 type:2 withCompletion:v23];
    id v14 = v24;
  }
  else
  {
    recoveryKey = self->_recoveryKey;
    if (!recoveryKey)
    {
      objc_initWeak(&location, self);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __102__CDPToolFakeUIProvider_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke_3;
      v16[3] = &unk_2643178E0;
      objc_copyWeak(&v19, &location);
      id v17 = v12;
      id v18 = v9;
      [v17 supportedEscapeOfferMaskCompletion:v16];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
      goto LABEL_6;
    }
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __102__CDPToolFakeUIProvider_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke_2;
    v21[3] = &unk_2643178B8;
    id v22 = v11;
    [v22 validateRecoveryKey:recoveryKey withCompletion:v21];
    id v14 = v22;
  }

LABEL_6:
}

uint64_t __102__CDPToolFakeUIProvider_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = result;
    puts("Remote secret is invalid... cancelling prompt/validation");
    v4 = *(void **)(v3 + 32);
    return [v4 cancelValidationWithError:0];
  }
  return result;
}

uint64_t __102__CDPToolFakeUIProvider_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = result;
    puts("Recovery key is invalid... cancelling prompt/validation");
    v4 = *(void **)(v3 + 32);
    return [v4 cancelValidationWithError:0];
  }
  return result;
}

void __102__CDPToolFakeUIProvider_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke_3(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_4;
  }
  if ((a2 & 0x40) == 0)
  {
    puts("A remote secret or recovery key is required to attempt backup recovery (use -remote <secret> OR -mk <recoveryKey>)");
LABEL_4:
    [*(id *)(a1 + 32) cancelValidationWithError:0];
    goto LABEL_6;
  }
  [WeakRetained startCustodianRecoveryWithContext:*(void *)(a1 + 40) validator:*(void *)(a1 + 32)];
LABEL_6:
}

- (void)startCustodianRecoveryWithContext:(id)a3 validator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [[CDPCustodianRecoveryController alloc] initWithContext:v6];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__CDPToolFakeUIProvider_startCustodianRecoveryWithContext_validator___block_invoke;
  v12[3] = &unk_264317908;
  objc_copyWeak(&v16, &location);
  id v9 = v6;
  id v13 = v9;
  id v10 = v8;
  id v14 = v10;
  id v11 = v7;
  id v15 = v11;
  [(CDPCustodianRecoveryController *)v10 startRecoverySessionWithCompletion:v12];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __69__CDPToolFakeUIProvider_startCustodianRecoveryWithContext_validator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_2182AE000, v7, OS_LOG_TYPE_DEFAULT, "Custodian recovery session started sessionID: %@, error: %@", (uint8_t *)&v9, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained showCustodianProvidedCodeEntryScreen:*(void *)(a1 + 32) controller:*(void *)(a1 + 40) validator:*(void *)(a1 + 48)];
}

- (void)showCustodianProvidedCodeEntryScreen:(id)a3 controller:(id)a4 validator:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  int v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2182AE000, v9, OS_LOG_TYPE_DEFAULT, "CLI: Enter the recovery code provided by your custodian...", buf, 2u);
  }

  printf("Enter the recovery code provided by your custodian: ");
  scanf("%s", v16);
  id v10 = [NSString stringWithUTF8String:v16];
  __int16 v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CDPToolFakeUIProvider showCustodianProvidedCodeEntryScreen:controller:validator:]();
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __83__CDPToolFakeUIProvider_showCustodianProvidedCodeEntryScreen_controller_validator___block_invoke;
  v13[3] = &unk_264317958;
  id v14 = v7;
  id v12 = v7;
  [(CDPToolFakeUIProvider *)self validateCode:v10 controller:v8 completion:v13];
}

void __83__CDPToolFakeUIProvider_showCustodianProvidedCodeEntryScreen_controller_validator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _CDPLogSystem();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __83__CDPToolFakeUIProvider_showCustodianProvidedCodeEntryScreen_controller_validator___block_invoke_cold_1();
    }

    id v9 = [v6 description];
    printf("Error: %s\n", (const char *)[v9 UTF8String]);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "CLI: Recovery code validated. Validating recovery info...", buf, 2u);
    }

    puts("Recovery code validated.");
    puts("Validating recovery info...");
    id v10 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __83__CDPToolFakeUIProvider_showCustodianProvidedCodeEntryScreen_controller_validator___block_invoke_33;
    v11[3] = &unk_264317930;
    id v12 = 0;
    [v10 validateCustodianRecoveryInfo:v5 withCompletion:v11];
    id v9 = v12;
  }
}

void __83__CDPToolFakeUIProvider_showCustodianProvidedCodeEntryScreen_controller_validator___block_invoke_33(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _CDPLogSystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2182AE000, v7, OS_LOG_TYPE_DEFAULT, "Custodian recovery info validated, safe to dismiss the view", buf, 2u);
    }

    puts("Recovery completed");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __83__CDPToolFakeUIProvider_showCustodianProvidedCodeEntryScreen_controller_validator___block_invoke_33_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);
    }

    id v14 = [v5 description];
    printf("Recovery failed with error: %s", (const char *)[v14 UTF8String]);
  }
}

- (void)validateCode:(id)a3 controller:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "CLI: Validating the recovery code...", (uint8_t *)buf, 2u);
  }

  puts("Validating the recovery code...");
  objc_initWeak(buf, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__CDPToolFakeUIProvider_validateCode_controller_completion___block_invoke;
  v14[3] = &unk_264317980;
  objc_copyWeak(&v17, buf);
  id v12 = v10;
  id v16 = v12;
  id v13 = v9;
  id v15 = v13;
  [v13 validateRecoveryCode:v8 withCompletion:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(buf);
}

void __60__CDPToolFakeUIProvider_validateCode_controller_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if ([v6 code] == -9002)
    {
      id v8 = _CDPLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "CLI: The recovery code is not valid", buf, 2u);
      }

      puts("The recovery code is not valid");
      id v9 = _CDPLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v15 = 0;
        _os_log_impl(&dword_2182AE000, v9, OS_LOG_TYPE_DEFAULT, "CLI: Reenter the recovery code provided by your custodian...", v15, 2u);
      }

      printf("Reenter the recovery code provided by your custodian: ");
      scanf("%s", v14);
      id v10 = [NSString stringWithUTF8String:v14];
      uint64_t v11 = _CDPLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __60__CDPToolFakeUIProvider_validateCode_controller_completion___block_invoke_cold_1();
      }

      [WeakRetained validateCode:v10 controller:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = [MEMORY[0x263F087E8] errorWithDomain:@"CDPStateError" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
  }
}

- (void)cdpRecoveryFlowContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 validator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [v10 context];
  uint64_t v11 = [v10 hasPeersForRemoteApproval];

  [(CDPToolFakeUIProvider *)self cdpContext:v12 promptForRemoteSecretWithDevices:v9 offeringRemoteApproval:v11 validator:v8];
}

- (void)cdpContext:(id)a3 promptForICSCWithIsNumeric:(BOOL)a4 numericLength:(id)a5 isRandom:(BOOL)a6 validator:(id)a7
{
  id v8 = a7;
  id v9 = v8;
  icsc = self->_icsc;
  if (icsc)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __96__CDPToolFakeUIProvider_cdpContext_promptForICSCWithIsNumeric_numericLength_isRandom_validator___block_invoke;
    v11[3] = &unk_2643178B8;
    id v12 = v8;
    [v12 validateSecret:icsc devices:0 type:0 withCompletion:v11];
  }
  else
  {
    puts("An iCSC is required to attempt backup recovery (use -icsc <iCSC>)");
    [v9 cancelValidationWithError:0];
  }
}

uint64_t __96__CDPToolFakeUIProvider_cdpContext_promptForICSCWithIsNumeric_numericLength_isRandom_validator___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = result;
    puts("ICSC is invalid... cancelling prompt/validation");
    v4 = *(void **)(v3 + 32);
    return [v4 cancelValidationWithError:0];
  }
  return result;
}

- (void)cdpContext:(id)a3 promptForRecoveryKeyWithValidator:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(CDPToolFakeUIProvider *)self recoveryKey];
  [v8 confirmRecoveryKey:v9 completion:v7];
}

- (void)cdpContext:(id)a3 promptForAdoptionOfMultipleICSC:(id)a4
{
  if (a4) {
    (*((void (**)(id, uint64_t, void))a4 + 2))(a4, 1, 0);
  }
}

- (void)cdpContext:(id)a3 promptForInteractiveAuthenticationWithCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0, 0);
  }
}

- (void)cdpContext:(id)a3 promptForBeneficiaryAccessKeyWithCompletion:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = [(CDPToolFakeUIProvider *)self accessKey];
    (*((void (**)(id, id, void))a4 + 2))(v6, v7, 0);
  }
}

- (void)cdpContext:(id)a3 promptForRecoveryKeyWithSecretValidator:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [[CDPRecoveryKeySecretValidatorProxyImpl alloc] initWithRemoteObject:v7];
  recoveryKey = self->_recoveryKey;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __87__CDPToolFakeUIProvider_cdpContext_promptForRecoveryKeyWithSecretValidator_completion___block_invoke;
  v13[3] = &unk_2643176B0;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  [(CDPRecoveryKeySecretValidatorProxyImpl *)v9 validateRecoveryKey:recoveryKey withCompletion:v13];
}

void __87__CDPToolFakeUIProvider_cdpContext_promptForRecoveryKeyWithSecretValidator_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a4;
  [v5 cancelValidationWithError:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)cdpContext:(id)a3 promptForEDPRecoveryTokenWithValidator:(id)a4 successfulCDPRecoveryContinuationHandler:(id)a5
{
  id v8 = (void (**)(void))a5;
  id v9 = v8;
  recoveryToken = self->_recoveryToken;
  if (recoveryToken)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __116__CDPToolFakeUIProvider_cdpContext_promptForEDPRecoveryTokenWithValidator_successfulCDPRecoveryContinuationHandler___block_invoke;
    v11[3] = &unk_2643171D0;
    id v12 = v8;
    [a4 validateEDPRecoveryToken:recoveryToken withContext:a3 completion:v11];
  }
  else
  {
    printf("A recovery token is required to repair EDP");
    if (v9) {
      v9[2](v9);
    }
  }
}

void __116__CDPToolFakeUIProvider_cdpContext_promptForEDPRecoveryTokenWithValidator_successfulCDPRecoveryContinuationHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _CDPLogSystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_2182AE000, v7, OS_LOG_TYPE_DEFAULT, "Recovery token was valid!", v9, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __116__CDPToolFakeUIProvider_cdpContext_promptForEDPRecoveryTokenWithValidator_successfulCDPRecoveryContinuationHandler___block_invoke_cold_1();
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
}

- (NSString)localSecret
{
  return self->_localSecret;
}

- (void)setLocalSecret:(id)a3
{
}

- (NSString)remoteSecret
{
  return self->_remoteSecret;
}

- (void)setRemoteSecret:(id)a3
{
}

- (NSString)icsc
{
  return self->_icsc;
}

- (void)setIcsc:(id)a3
{
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void)setRecoveryKey:(id)a3
{
}

- (AKInheritanceAccessKey)accessKey
{
  return self->_accessKey;
}

- (void)setAccessKey:(id)a3
{
}

- (NSString)recoveryToken
{
  return self->_recoveryToken;
}

- (void)setRecoveryToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryToken, 0);
  objc_storeStrong((id *)&self->_accessKey, 0);
  objc_storeStrong((id *)&self->_recoveryKey, 0);
  objc_storeStrong((id *)&self->_icsc, 0);
  objc_storeStrong((id *)&self->_remoteSecret, 0);
  objc_storeStrong((id *)&self->_localSecret, 0);
}

- (void)showCustodianProvidedCodeEntryScreen:controller:validator:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_2182AE000, v0, OS_LOG_TYPE_DEBUG, "CLI: Entered recovery code: %@", v1, 0xCu);
}

void __83__CDPToolFakeUIProvider_showCustodianProvidedCodeEntryScreen_controller_validator___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "CLI: Validate recovery code failed with error: %@", v2, v3, v4, v5, v6);
}

void __83__CDPToolFakeUIProvider_showCustodianProvidedCodeEntryScreen_controller_validator___block_invoke_33_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60__CDPToolFakeUIProvider_validateCode_controller_completion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_2182AE000, v0, OS_LOG_TYPE_DEBUG, "CLI: Reentered recovery code: %@", v1, 0xCu);
}

void __116__CDPToolFakeUIProvider_cdpContext_promptForEDPRecoveryTokenWithValidator_successfulCDPRecoveryContinuationHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to validate token with error: %@", v2, v3, v4, v5, v6);
}

@end