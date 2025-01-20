@interface CDPDDeviceSecretValidator
- (BOOL)_isFailedSecret:(id)a3 forDevice:(id)a4;
- (BOOL)_isInvalidICSCError:(id)a3;
- (BOOL)_shouldInjectEDPStateRepairForResult:(id)a3 error:(id)a4;
- (BOOL)_validSecretHandlerShouldBeWrappedWithEDPFlow;
- (BOOL)isAttemptingRecovery;
- (BOOL)isUsingMultipleICSC;
- (CDPContext)context;
- (CDPDDeviceSecretValidator)init;
- (CDPDDeviceSecretValidator)initWithContext:(id)a3 delegate:(id)a4;
- (CDPDDeviceSecretValidatorDelegate)delegate;
- (id)_failedSecretsForDevice:(id)a3;
- (id)_failedSingleICSCs;
- (id)_handleMultiCSCRecoveryFailureForDevice:(id)a3 recoveryError:(id)a4 secret:(id)a5;
- (id)validSecretHandler;
- (unint64_t)failedAttempts;
- (unint64_t)supportedEscapeOfferMask;
- (void)_attemptToRecoverDevice:(id)a3 withSecret:(id)a4 completion:(id)a5;
- (void)_attemptToRecoverWithRecoveryKey:(id)a3 completion:(id)a4;
- (void)_handleDelegateValidationError:(id)a3;
- (void)_handleMultiCSCRecoveryResults:(id)a3 clique:(id)a4 type:(unint64_t)a5 secret:(id)a6 device:(id)a7 completion:(id)a8;
- (void)_handleRecoveryFailureForFinalDevice:(id)a3 completion:(id)a4;
- (void)_performSingleiCSCRecoveryWithSecret:(id)a3 type:(unint64_t)a4 completion:(id)a5;
- (void)approveFromAnotherDeviceWithCompletion:(id)a3;
- (void)attemptToJoinCircleWithPiggybacking:(id)a3 withCompletion:(id)a4;
- (void)cancelValidationWithError:(id)a3;
- (void)repairEDPStateWithContext:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setIsUsingMultipleICSC:(BOOL)a3;
- (void)setSupportedEscapeOfferMask:(unint64_t)a3;
- (void)setValidSecretHandler:(id)a3;
- (void)supportedEscapeOfferMaskCompletion:(id)a3;
- (void)validateCustodianRecoveryInfo:(id)a3 withCompletion:(id)a4;
- (void)validateEDPRecoveryToken:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)validateRecoveryKey:(id)a3 withCompletion:(id)a4;
- (void)validateSecret:(id)a3 devices:(id)a4 type:(unint64_t)a5 withCompletion:(id)a6;
@end

@implementation CDPDDeviceSecretValidator

- (CDPDDeviceSecretValidator)init
{
  v10.receiver = self;
  v10.super_class = (Class)CDPDDeviceSecretValidator;
  v2 = [(CDPDDeviceSecretValidator *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    failedSecrets = v2->_failedSecrets;
    v2->_failedSecrets = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    recoveryErrors = v2->_recoveryErrors;
    v2->_recoveryErrors = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    failedRecoveryKeys = v2->_failedRecoveryKeys;
    v2->_failedRecoveryKeys = (NSMutableSet *)v7;
  }
  return v2;
}

- (CDPDDeviceSecretValidator)initWithContext:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(CDPDDeviceSecretValidator *)self init];
  objc_super v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)_attemptToRecoverDevice:(id)a3 withSecret:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = (void (**)(id, void, CDPDSecureBackupContext *))a5;
  if ([(CDPDDeviceSecretValidator *)self _isFailedSecret:v9 forDevice:v8])
  {
    v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CDPDDeviceSecretValidator _attemptToRecoverDevice:withSecret:completion:]();
    }

    _CDPStateError();
    v12 = (CDPDSecureBackupContext *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v12);
  }
  else
  {
    v12 = objc_alloc_init(CDPDSecureBackupContext);
    [(CDPDSecureBackupContext *)v12 setDevice:v8];
    [(CDPDSecureBackupContext *)v12 setRecoverySecret:v9];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      id v15 = objc_loadWeakRetained((id *)&self->_delegate);
      [v15 secretValidatorWillAttemptRecovery];
    }
    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __75__CDPDDeviceSecretValidator__attemptToRecoverDevice_withSecret_completion___block_invoke;
    v17[3] = &unk_26432FA90;
    v17[4] = self;
    v18 = v10;
    [v16 secretValidator:self recoverSecureBackupWithContext:v12 completion:v17];
  }
}

void __75__CDPDDeviceSecretValidator__attemptToRecoverDevice_withSecret_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
      uint64_t v9 = *(void *)(a1 + 32);
      id v13 = 0;
      char v10 = [v8 secretValidator:v9 shouldAcceptRecoveryError:&v13];
      id v11 = v13;

      if ((v10 & 1) == 0)
      {
        v12 = _CDPLogSystem();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          __75__CDPDDeviceSecretValidator__attemptToRecoverDevice_withSecret_completion___block_invoke_cold_1();
        }
      }
    }
    else
    {
      id v11 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_attemptToRecoverWithRecoveryKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  char v7 = (void (**)(id, void, CDPDSecureBackupContext *))a4;
  if ([(NSMutableSet *)self->_failedRecoveryKeys containsObject:v6])
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CDPDDeviceSecretValidator _attemptToRecoverWithRecoveryKey:completion:]();
    }

    _CDPStateError();
    uint64_t v9 = (CDPDSecureBackupContext *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v9);
  }
  else
  {
    uint64_t v9 = objc_alloc_init(CDPDSecureBackupContext);
    [(CDPDSecureBackupContext *)v9 setRecoveryKey:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 secretValidatorWillAttemptRecovery];
    }
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __73__CDPDDeviceSecretValidator__attemptToRecoverWithRecoveryKey_completion___block_invoke;
    v14[3] = &unk_26432FA90;
    v14[4] = self;
    id v15 = v7;
    [v13 secretValidator:self recoverSecureBackupWithContext:v9 completion:v14];
  }
}

void __73__CDPDDeviceSecretValidator__attemptToRecoverWithRecoveryKey_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
      uint64_t v9 = *(void *)(a1 + 32);
      id v13 = 0;
      char v10 = [v8 secretValidator:v9 shouldAcceptRecoveryError:&v13];
      id v11 = v13;

      if ((v10 & 1) == 0)
      {
        id v12 = _CDPLogSystem();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          __75__CDPDDeviceSecretValidator__attemptToRecoverDevice_withSecret_completion___block_invoke_cold_1();
        }
      }
    }
    else
    {
      id v11 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)validateRecoveryKey:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __64__CDPDDeviceSecretValidator_validateRecoveryKey_withCompletion___block_invoke;
    v17[3] = &unk_2643301A0;
    v17[4] = self;
    id v18 = v6;
    id v19 = v7;
    [(CDPDDeviceSecretValidator *)self _attemptToRecoverWithRecoveryKey:v18 completion:v17];
  }
  else
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CDPDDeviceSecretValidator validateRecoveryKey:withCompletion:](v8, v9, v10, v11, v12, v13, v14, v15);
    }

    id v16 = _CDPStateError();
    (*((void (**)(id, void, uint64_t, void *))v7 + 2))(v7, 0, 1, v16);
  }
}

void __64__CDPDDeviceSecretValidator_validateRecoveryKey_withCompletion___block_invoke(void *a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = (id *)a1[4];
  if (v5)
  {
    [v6[4] addObject:a1[5]];
    uint64_t v7 = a1[6];
    if (v7) {
      (*(void (**)(uint64_t, void, uint64_t, id))(v7 + 16))(v7, 0, 1, v5);
    }
  }
  else
  {
    [v6 _handleMultiCSCRecoveryResults:v8 clique:0 type:5 secret:a1[5] device:0 completion:a1[6]];
  }
}

- (void)validateSecret:(id)a3 devices:(id)a4 type:(unint64_t)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(CDPDDeviceSecretValidator *)self isUsingMultipleICSC])
  {
    uint64_t v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[CDPDDeviceSecretValidator validateSecret:devices:type:withCompletion:]();
    }

    self->_isAttemptingRecovery = 1;
    uint64_t v14 = (void *)[v11 mutableCopy];
    uint64_t v15 = [v14 firstObject];
    currentDevice = self->_currentDevice;
    self->_currentDevice = v15;

    v17 = self->_currentDevice;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __72__CDPDDeviceSecretValidator_validateSecret_devices_type_withCompletion___block_invoke;
    v19[3] = &unk_2643301C8;
    v19[4] = self;
    unint64_t v24 = a5;
    id v20 = v10;
    id v23 = v12;
    id v21 = v11;
    id v22 = v14;
    id v18 = v14;
    [(CDPDDeviceSecretValidator *)self _attemptToRecoverDevice:v17 withSecret:v20 completion:v19];
  }
  else
  {
    self->_isAttemptingRecovery = 1;
    [(CDPDDeviceSecretValidator *)self _performSingleiCSCRecoveryWithSecret:v10 type:a5 completion:v12];
  }
}

void __72__CDPDDeviceSecretValidator_validateSecret_devices_type_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (a3)
  {
    id v6 = [v4 _handleMultiCSCRecoveryFailureForDevice:v4[8] recoveryError:a3 secret:*(void *)(a1 + 40)];
    uint64_t v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "remainingAttempts"));
      int v17 = 138412290;
      id v18 = v8;
      _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Remaining attempts: %@", (uint8_t *)&v17, 0xCu);
    }
    if (![*(id *)(*(void *)(a1 + 32) + 64) remainingAttempts]) {
      *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v9 + 56))
    {
      id v10 = _CDPLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = *(void **)(a1 + 48);
        int v17 = 138412290;
        id v18 = v11;
        _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "Depleted remaining attempts for multiple-iCSC entry (%@)", (uint8_t *)&v17, 0xCu);
      }

      uint64_t v9 = *(void *)(a1 + 32);
    }
    [*(id *)(a1 + 56) removeObject:*(void *)(v9 + 64)];
    id v12 = [*(id *)(a1 + 32) delegate];
    if ([v12 secretValidator:*(void *)(a1 + 32) shouldContinueValidationAfterError:v6])
    {
      uint64_t v13 = [*(id *)(a1 + 56) count];

      if (v13)
      {
        [*(id *)(a1 + 32) validateSecret:*(void *)(a1 + 40) devices:*(void *)(a1 + 56) type:*(void *)(a1 + 72) withCompletion:*(void *)(a1 + 64)];
LABEL_18:

        return;
      }
    }
    else
    {
    }
    [*(id *)(a1 + 32) _handleRecoveryFailureForFinalDevice:*(void *)(*(void *)(a1 + 32) + 64) completion:*(void *)(a1 + 64)];
    goto LABEL_18;
  }
  uint64_t v14 = v4[8];
  uint64_t v16 = *(void *)(a1 + 64);
  uint64_t v15 = *(void *)(a1 + 72);
  [v4 _handleMultiCSCRecoveryResults:a2 clique:0 type:v15 secret:v5 device:v14 completion:v16];
}

- (void)_handleRecoveryFailureForFinalDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Un-set _isAttemptingRecovery to resume acting upon circle changes after failed multiple iCSC recovery", buf, 2u);
  }

  self->_isAttemptingRecovery = 0;
  if (([(CDPContext *)self->_context idmsRecovery] & 1) != 0
    || ([(CDPContext *)self->_context findMyiPhoneUUID],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    id v12 = _CDPLogSystem();
    uint64_t v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "Redirecting error to the delegate", buf, 2u);
      }

      id v14 = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v15 = (void *)[(NSMutableDictionary *)self->_recoveryErrors copy];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __77__CDPDDeviceSecretValidator__handleRecoveryFailureForFinalDevice_completion___block_invoke;
      v31[3] = &unk_26432ED48;
      v31[4] = self;
      id v32 = v7;
      [v14 secretValidator:self didFailRecoveryWithErrors:v15 completion:v31];

      uint64_t v16 = v32;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CDPDDeviceSecretValidator _handleRecoveryFailureForFinalDevice:completion:]();
      }

      validSecretHandler = (void (**)(id, void, void *))self->_validSecretHandler;
      uint64_t v16 = _CDPStateError();
      validSecretHandler[2](validSecretHandler, 0, v16);
    }
  }
  else
  {
    unint64_t v18 = self->_failedAttempts + 1;
    self->_failedAttempts = v18;
    BOOL v19 = v18 > 2;
    uint64_t v20 = -5200;
    if (v19) {
      uint64_t v20 = -5203;
    }
    if (self->_depletedRemainingAttempts) {
      uint64_t v21 = -5206;
    }
    else {
      uint64_t v21 = v20;
    }
    uint64_t v16 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:userInfo:", v21, self->_recoveryErrors);
    id v22 = _CDPLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v22, OS_LOG_TYPE_DEFAULT, "Reaching out to the delegate for error handling", buf, 2u);
    }

    id v23 = objc_loadWeakRetained((id *)&self->_delegate);
    char v24 = objc_opt_respondsToSelector();

    if (v24)
    {
      id v25 = objc_loadWeakRetained((id *)&self->_delegate);
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __77__CDPDDeviceSecretValidator__handleRecoveryFailureForFinalDevice_completion___block_invoke_36;
      v29[3] = &unk_26432ED48;
      v29[4] = self;
      id v30 = v7;
      [v25 secretValidator:self didFailRecovery:v6 withError:v16 completion:v29];

      v26 = v30;
    }
    else
    {
      v27 = _CDPLogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[CDPDDeviceSecretValidator _handleRecoveryFailureForFinalDevice:completion:]();
      }

      v28 = (void (**)(id, void, void *))self->_validSecretHandler;
      v26 = _CDPStateError();
      v28[2](v28, 0, v26);
    }
  }
  [(NSMutableDictionary *)self->_recoveryErrors removeAllObjects];
}

void __77__CDPDDeviceSecretValidator__handleRecoveryFailureForFinalDevice_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __77__CDPDDeviceSecretValidator__handleRecoveryFailureForFinalDevice_completion___block_invoke_cold_1();
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, void, uint64_t, id))(v7 + 16))(v7, 0, a2, v5);
  }
  if ((a2 & 1) == 0 && (objc_msgSend(v5, "cdp_isCDPErrorWithCode:", -5206) & 1) == 0)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 88);
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    id v10 = [v5 domain];
    char v11 = objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, objc_msgSend(v5, "code"), 0);
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v11);
  }
}

void __77__CDPDDeviceSecretValidator__handleRecoveryFailureForFinalDevice_completion___block_invoke_36(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __77__CDPDDeviceSecretValidator__handleRecoveryFailureForFinalDevice_completion___block_invoke_cold_1();
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, void, uint64_t, id))(v7 + 16))(v7, 0, a2, v5);
  }
  uint64_t v8 = [v5 domain];
  int v9 = [v8 isEqualToString:*MEMORY[0x263F342B0]];

  if (v9)
  {
    uint64_t v10 = [v5 code];
    if (v10 == -5308)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 88);
      id v12 = _CDPStateError();
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
    }
    else if (v10 == -5222 || v10 == -5307)
    {
      [*(id *)(a1 + 32) cancelValidationWithError:v5];
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
}

- (void)cancelValidationWithError:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "cancelValidationWithError was called", buf, 2u);
  }

  if ([v4 isLoginHardLimit])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      currentDevice = self->_currentDevice;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __55__CDPDDeviceSecretValidator_cancelValidationWithError___block_invoke;
      v13[3] = &unk_26432ECF8;
      v13[4] = self;
      [v8 secretValidator:self didFailRecovery:currentDevice withError:v4 completion:v13];
LABEL_10:

      goto LABEL_11;
    }
  }
  uint64_t v10 = [(CDPDDeviceSecretValidator *)self validSecretHandler];

  if (v10)
  {
    uint64_t v11 = objc_alloc_init(CDPDRemoteSecretValidationResult);
    id v8 = v11;
    if (v4) {
      [(CDPDRemoteSecretValidationResult *)v11 setUserDidCancel:1];
    }
    id v12 = [(CDPDDeviceSecretValidator *)self validSecretHandler];
    ((void (**)(void, id, id))v12)[2](v12, v8, v4);

    goto LABEL_10;
  }
LABEL_11:
}

uint64_t __55__CDPDDeviceSecretValidator_cancelValidationWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDelegateValidationError:");
}

- (void)_handleDelegateValidationError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F342B0]];

  if (!v6)
  {
LABEL_6:
    id v8 = [(CDPDDeviceSecretValidator *)self validSecretHandler];

    if (!v8) {
      goto LABEL_9;
    }
    uint64_t v9 = [(CDPDDeviceSecretValidator *)self validSecretHandler];
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v4);
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v7 = [v4 code];
  if (v7 == -5210)
  {
    uint64_t v9 = _CDPLogSystem();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_218640000, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "Event handled, skipping call to valid secret handler", v13, 2u);
    }
    goto LABEL_8;
  }
  if (v7 != -5208)
  {
    if (v7 == -5209)
    {
      [(CDPDDeviceSecretValidator *)self approveFromAnotherDeviceWithCompletion:0];
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  uint64_t v10 = objc_alloc_init(CDPDRemoteSecretValidationResult);
  [(CDPDRemoteSecretValidationResult *)v10 setUserDidReset:1];
  uint64_t v11 = [(CDPDDeviceSecretValidator *)self validSecretHandler];

  if (v11)
  {
    id v12 = [(CDPDDeviceSecretValidator *)self validSecretHandler];
    ((void (**)(void, CDPDRemoteSecretValidationResult *, id))v12)[2](v12, v10, v4);
  }
LABEL_9:
}

- (id)_handleMultiCSCRecoveryFailureForDevice:(id)a3 recoveryError:(id)a4 secret:(id)a5
{
  v19[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  if ([(CDPDDeviceSecretValidator *)self _isInvalidICSCError:v11])
  {
    objc_msgSend(v8, "setRemainingAttempts:", objc_msgSend(v8, "remainingAttempts") - 1);
    id v12 = [(CDPDDeviceSecretValidator *)self _failedSecretsForDevice:v8];
    [v12 addObject:v10];
    uint64_t v13 = [v11 domain];
    char v14 = [v13 isEqualToString:*MEMORY[0x263F342B0]];

    uint64_t v15 = v11;
    if ((v14 & 1) == 0)
    {
      uint64_t v18 = *MEMORY[0x263F08608];
      v19[0] = v11;
      uint64_t v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
      uint64_t v15 = _CDPStateError();
    }
  }
  else if ([v11 code] == 14 || (uint64_t v15 = v11, objc_msgSend(v11, "code") == 14))
  {
    [v8 setRemainingAttempts:0];
    uint64_t v15 = v11;
  }
  [(NSMutableDictionary *)self->_recoveryErrors setObject:v15 forKey:v8];

  return v15;
}

- (id)_failedSecretsForDevice:(id)a3
{
  id v4 = [a3 recordID];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_failedSecrets objectForKey:v4];
    if (!v5)
    {
      id v5 = [MEMORY[0x263EFF9C0] set];
      [(NSMutableDictionary *)self->_failedSecrets setObject:v5 forKeyedSubscript:v4];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_failedSingleICSCs
{
  failedSingleICSCs = self->_failedSingleICSCs;
  if (!failedSingleICSCs)
  {
    id v4 = [MEMORY[0x263EFF9C0] set];
    id v5 = self->_failedSingleICSCs;
    self->_failedSingleICSCs = v4;

    failedSingleICSCs = self->_failedSingleICSCs;
  }
  return failedSingleICSCs;
}

- (BOOL)_isFailedSecret:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 recordID];

  if (v8)
  {
    failedSecrets = self->_failedSecrets;
    id v10 = [v7 recordID];
    id v11 = [(NSMutableDictionary *)failedSecrets objectForKeyedSubscript:v10];
    char v12 = [v11 containsObject:v6];
  }
  else
  {
    char v12 = [(NSMutableSet *)self->_failedSingleICSCs containsObject:v6];
  }

  return v12;
}

- (void)_handleMultiCSCRecoveryResults:(id)a3 clique:(id)a4 type:(unint64_t)a5 secret:(id)a6 device:(id)a7 completion:(id)a8
{
  id v19 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = a8;
  [(NSMutableDictionary *)self->_recoveryErrors removeAllObjects];
  if (v15) {
    (*((void (**)(id, uint64_t, void, void))v15 + 2))(v15, 1, 0, 0);
  }
  if (self->_validSecretHandler)
  {
    uint64_t v16 = objc_alloc_init(CDPDRemoteSecretValidationResult);
    [(CDPDRemoteSecretValidationResult *)v16 setDevice:v14];
    [(CDPDRemoteSecretValidationResult *)v16 setValidSecret:v13];
    [(CDPDRemoteSecretValidationResult *)v16 setSecretType:a5];
    int v17 = [v19 recoveredInfo];
    [(CDPDRemoteSecretValidationResult *)v16 setRecoveredInfo:v17];

    uint64_t v18 = [v19 recoveredClique];
    [(CDPDRemoteSecretValidationResult *)v16 setRecoveredClique:v18];

    (*((void (**)(void))self->_validSecretHandler + 2))();
  }
}

- (void)_performSingleiCSCRecoveryWithSecret:(id)a3 type:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__CDPDDeviceSecretValidator__performSingleiCSCRecoveryWithSecret_type_completion___block_invoke;
  v12[3] = &unk_2643301F0;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  unint64_t v15 = a4;
  id v10 = v8;
  id v11 = v9;
  [(CDPDDeviceSecretValidator *)self _attemptToRecoverDevice:0 withSecret:v10 completion:v12];
}

void __82__CDPDDeviceSecretValidator__performSingleiCSCRecoveryWithSecret_type_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if ([*(id *)(a1 + 32) _isInvalidICSCError:v6])
    {
      id v7 = [*(id *)(a1 + 32) _failedSingleICSCs];
      [v7 addObject:*(void *)(a1 + 40)];
    }
    ++*(void *)(*(void *)(a1 + 32) + 16);
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __82__CDPDDeviceSecretValidator__performSingleiCSCRecoveryWithSecret_type_completion___block_invoke_cold_2();
    }

    if (*(void *)(a1 + 48))
    {
      if (*(void *)(*(void *)(a1 + 32) + 16) <= 2uLL) {
        uint64_t v9 = -5200;
      }
      else {
        uint64_t v9 = -5203;
      }
      id v10 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", v9);
      (*(void (**)(void, void, BOOL, void *))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0, *(void *)(*(void *)(a1 + 32) + 16) < 3uLL, v10);
    }
    if (*(void *)(*(void *)(a1 + 32) + 16) >= 3uLL)
    {
      id v11 = _CDPLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __82__CDPDDeviceSecretValidator__performSingleiCSCRecoveryWithSecret_type_completion___block_invoke_cold_1();
      }

      if (*(void *)(*(void *)(a1 + 32) + 88))
      {
        CDPLocalizedString();
        char v12 = (CDPDRemoteSecretValidationResult *)objc_claimAutoreleasedReturnValue();
        id v13 = CDPLocalizedString();
        id v14 = [MEMORY[0x263EFF9A0] dictionary];
        unint64_t v15 = v14;
        if (v12) {
          [v14 setObject:v12 forKeyedSubscript:*MEMORY[0x263F08320]];
        }
        if (v13) {
          [v15 setObject:v13 forKeyedSubscript:*MEMORY[0x263F08338]];
        }
        uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 88);
        int v17 = (void *)[v15 copy];
        uint64_t v18 = _CDPStateError();
        (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v18);

        goto LABEL_24;
      }
    }
  }
  else
  {
    uint64_t v19 = *(void *)(a1 + 48);
    if (v19) {
      (*(void (**)(uint64_t, uint64_t, void, void))(v19 + 16))(v19, 1, 0, 0);
    }
    if (*(void *)(*(void *)(a1 + 32) + 88))
    {
      char v12 = objc_alloc_init(CDPDRemoteSecretValidationResult);
      [(CDPDRemoteSecretValidationResult *)v12 setValidSecret:*(void *)(a1 + 40)];
      [(CDPDRemoteSecretValidationResult *)v12 setSecretType:*(void *)(a1 + 56)];
      uint64_t v20 = [v5 recoveredInfo];
      [(CDPDRemoteSecretValidationResult *)v12 setRecoveredInfo:v20];

      uint64_t v21 = [v5 recoveredClique];
      [(CDPDRemoteSecretValidationResult *)v12 setRecoveredClique:v21];

      (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 88) + 16))();
LABEL_24:
    }
  }
}

- (void)repairEDPStateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CDPDDeviceSecretValidator *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(CDPDDeviceSecretValidator *)self delegate];
    [v10 secretValidator:self didRequestRepairEDPStateWithContext:v6 completion:v7];
  }
  else
  {
    id v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[CDPDDeviceSecretValidator repairEDPStateWithContext:completion:](self);
    }

    if (v7)
    {
      char v12 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5000);
      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v12);
    }
  }
}

- (void)validateEDPRecoveryToken:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = [(CDPDDeviceSecretValidator *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [(CDPDDeviceSecretValidator *)self delegate];
    [v13 secretValidator:self didRequestValidateEDPRecoveryToken:v8 withContext:v9 completion:v10];
  }
  else
  {
    id v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[CDPDDeviceSecretValidator validateEDPRecoveryToken:withContext:completion:](self);
    }

    if (v10)
    {
      unint64_t v15 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5000);
      v10[2](v10, 0, v15);
    }
  }
}

- (void)setValidSecretHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[CDPDDeviceSecretValidator setValidSecretHandler:]";
    __int16 v17 = 1024;
    int v18 = 512;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) called", buf, 0x12u);
  }

  if ([(CDPDDeviceSecretValidator *)self _validSecretHandlerShouldBeWrappedWithEDPFlow])
  {
    id v6 = (void *)os_transaction_create();
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__CDPDDeviceSecretValidator_setValidSecretHandler___block_invoke;
    aBlock[3] = &unk_264330268;
    aBlock[4] = self;
    id v13 = v6;
    id v14 = v4;
    id v7 = v6;
    id v8 = _Block_copy(aBlock);
    id validSecretHandler = self->_validSecretHandler;
    self->_id validSecretHandler = v8;
  }
  else
  {
    id v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "setValidSecretHandler: Not wrapping", buf, 2u);
    }

    id v11 = _Block_copy(v4);
    id v7 = self->_validSecretHandler;
    self->_id validSecretHandler = v11;
  }
}

void __51__CDPDDeviceSecretValidator_setValidSecretHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([a1[4] _shouldInjectEDPStateRepairForResult:v5 error:v6])
  {
    id v7 = a1[4];
    uint64_t v8 = v7[13];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __51__CDPDDeviceSecretValidator_setValidSecretHandler___block_invoke_2;
    v11[3] = &unk_264330240;
    id v16 = a1[6];
    id v12 = v5;
    id v13 = v6;
    id v9 = a1[5];
    id v10 = a1[4];
    id v14 = v9;
    id v15 = v10;
    [v7 repairEDPStateWithContext:v8 completion:v11];
  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __51__CDPDDeviceSecretValidator_setValidSecretHandler___block_invoke_2(id *a1, uint64_t a2, char a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = _CDPLogSystem();
  id v6 = v5;
  if (a3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[CDPDDeviceSecretValidator setValidSecretHandler:]_block_invoke";
      _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "%s: Recovery token is needed. Prompting user.", buf, 0xCu);
    }

    id v7 = [a1[7] delegate];
    uint64_t v8 = a1[7];
    uint64_t v9 = v8[13];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    void v19[2] = __51__CDPDDeviceSecretValidator_setValidSecretHandler___block_invoke_51;
    v19[3] = &unk_264330218;
    id v24 = a1[8];
    id v20 = a1[4];
    id v21 = a1[5];
    id v10 = a1[6];
    id v11 = a1[7];
    id v22 = v10;
    id v23 = v11;
    [v7 secretValidator:v8 didRequestEDPRecoveryTokenRepairWithContext:v9 successfulCDPRecoveryContinuationHandler:v19];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __51__CDPDDeviceSecretValidator_setValidSecretHandler___block_invoke_2_cold_1(v6, v12, v13, v14, v15, v16, v17, v18);
    }

    (*((void (**)(void))a1[8] + 2))();
  }
}

uint64_t __51__CDPDDeviceSecretValidator_setValidSecretHandler___block_invoke_51(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[8] + 16))(a1[8], a1[4], a1[5]);
}

- (BOOL)_validSecretHandlerShouldBeWrappedWithEDPFlow
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (([MEMORY[0x263F34400] isGuitarfishEnabled] & 1) == 0)
  {
    id v6 = _CDPLogSystem();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    LOWORD(v12) = 0;
    id v7 = "setValidSecretHandler: feature flag off";
    uint64_t v8 = v6;
    uint32_t v9 = 2;
LABEL_9:
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, v9);
    goto LABEL_10;
  }
  if ([(CDPContext *)self->_context edpState] != 2)
  {
    id v6 = _CDPLogSystem();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    uint64_t v10 = [(CDPContext *)self->_context edpState];
    int v12 = 136315394;
    uint64_t v13 = "-[CDPDDeviceSecretValidator _validSecretHandlerShouldBeWrappedWithEDPFlow]";
    __int16 v14 = 2048;
    uint64_t v15 = v10;
    id v7 = "%s: Will not check if EDP state repair is needed because EDP state is not eligible. Found %lu";
    uint64_t v8 = v6;
    uint32_t v9 = 22;
    goto LABEL_9;
  }
  uint64_t v3 = [(CDPDDeviceSecretValidator *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4) {
    return 1;
  }
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(CDPDDeviceSecretValidator *)self delegate];
    int v12 = 136315394;
    uint64_t v13 = "-[CDPDDeviceSecretValidator _validSecretHandlerShouldBeWrappedWithEDPFlow]";
    __int16 v14 = 2112;
    uint64_t v15 = (uint64_t)v11;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "%s: Delegate %@ does not respond to EDP token repair", (uint8_t *)&v12, 0x16u);
  }
LABEL_10:

  return 0;
}

- (BOOL)_shouldInjectEDPStateRepairForResult:(id)a3 error:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v5 userDidCancel];
    int v9 = [v5 userDidReset];
    uint64_t v10 = [v5 validSecret];
    int v16 = 136316418;
    uint64_t v17 = "-[CDPDDeviceSecretValidator _shouldInjectEDPStateRepairForResult:error:]";
    __int16 v18 = 1024;
    BOOL v19 = v8;
    __int16 v20 = 1024;
    int v21 = v9;
    __int16 v22 = 1024;
    BOOL v23 = v10 != 0;
    __int16 v24 = 2048;
    uint64_t v25 = [v5 secretType];
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "%s: userDidCancel=%{BOOL}d, userDidReset=%{BOOL}d, validSecret=%{BOOL}d, secretType=%lu, error=%@", (uint8_t *)&v16, 0x32u);
  }
  if (([v5 userDidCancel] & 1) != 0
    || (objc_msgSend(v6, "cdp_isCDPErrorWithCode:", -5308) & 1) != 0
    || objc_msgSend(v6, "cdp_isCDPErrorWithCode:", -5307))
  {
    id v11 = _CDPLogSystem();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      LOBYTE(v13) = 0;
      goto LABEL_10;
    }
    int v16 = 136315138;
    uint64_t v17 = "-[CDPDDeviceSecretValidator _shouldInjectEDPStateRepairForResult:error:]";
    int v12 = "%s: User cancelled or skipped a CDP recovery factor. No need to inject EDP state repair flow.";
LABEL_8:
    _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, 0xCu);
    goto LABEL_9;
  }
  if ([v5 userDidReset])
  {
    id v11 = _CDPLogSystem();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v16 = 136315138;
    uint64_t v17 = "-[CDPDDeviceSecretValidator _shouldInjectEDPStateRepairForResult:error:]";
    int v12 = "%s: User requested account reset. Not injecting EDP state repair flow.";
    goto LABEL_8;
  }
  uint64_t v15 = [v5 validSecret];
  BOOL v13 = v15
     || [v5 secretType] == 6
     || [v5 secretType] == 7
     || [v5 secretType] == 5;

  id v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315394;
    uint64_t v17 = "-[CDPDDeviceSecretValidator _shouldInjectEDPStateRepairForResult:error:]";
    __int16 v18 = 1024;
    BOOL v19 = v13;
    _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "%s: shouldInject=%{BOOL}d", (uint8_t *)&v16, 0x12u);
  }
LABEL_10:

  return v13;
}

- (void)supportedEscapeOfferMaskCompletion:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    (*((void (**)(id, unint64_t))a3 + 2))(v5, [(CDPDDeviceSecretValidator *)self supportedEscapeOfferMask]);
  }
}

- (void)approveFromAnotherDeviceWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0, 0);
  }
}

- (void)validateCustodianRecoveryInfo:(id)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0, 0);
  }
}

- (void)attemptToJoinCircleWithPiggybacking:(id)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0, 0);
  }
}

- (BOOL)_isInvalidICSCError:(id)a3
{
  id v3 = a3;
  char v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x263F32A28]]) {
    BOOL v5 = [v3 code] == 26;
  }
  else {
    BOOL v5 = 0;
  }

  char v6 = objc_msgSend(v3, "cdp_isCDPErrorWithCode:", -5205);
  return v6 | v5;
}

- (BOOL)isAttemptingRecovery
{
  return self->_isAttemptingRecovery;
}

- (unint64_t)failedAttempts
{
  return self->_failedAttempts;
}

- (unint64_t)supportedEscapeOfferMask
{
  return self->supportedEscapeOfferMask;
}

- (void)setSupportedEscapeOfferMask:(unint64_t)a3
{
  self->supportedEscapeOfferMask = a3;
}

- (BOOL)isUsingMultipleICSC
{
  return self->_isUsingMultipleICSC;
}

- (void)setIsUsingMultipleICSC:(BOOL)a3
{
  self->_isUsingMultipleICSC = a3;
}

- (id)validSecretHandler
{
  return self->_validSecretHandler;
}

- (CDPDDeviceSecretValidatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CDPDDeviceSecretValidatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CDPContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_validSecretHandler, 0);
  objc_storeStrong((id *)&self->_currentDevice, 0);
  objc_storeStrong((id *)&self->_recoveryErrors, 0);
  objc_storeStrong((id *)&self->_failedSingleICSCs, 0);
  objc_storeStrong((id *)&self->_failedRecoveryKeys, 0);
  objc_storeStrong((id *)&self->_failedSecrets, 0);
}

- (void)_attemptToRecoverDevice:withSecret:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Multiple-ICSC secret is known to be bad, skipping validation", v2, v3, v4, v5, v6);
}

void __75__CDPDDeviceSecretValidator__attemptToRecoverDevice_withSecret_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_218640000, v0, v1, "Recovery delegate rejected recovery with error. %@", v2, v3, v4, v5, v6);
}

- (void)_attemptToRecoverWithRecoveryKey:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Recovery key is known to be bad, skipping validation", v2, v3, v4, v5, v6);
}

- (void)validateRecoveryKey:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)validateSecret:devices:type:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Set _isAttemptingRecovery to suppress acting on change in circle state", v2, v3, v4, v5, v6);
}

- (void)_handleRecoveryFailureForFinalDevice:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_218640000, v0, OS_LOG_TYPE_ERROR, "Unsupported delegate", v1, 2u);
}

void __77__CDPDDeviceSecretValidator__handleRecoveryFailureForFinalDevice_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Delegate finished handling the error and returned: %@", v2, v3, v4, v5, v6);
}

void __82__CDPDDeviceSecretValidator__performSingleiCSCRecoveryWithSecret_type_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Exceeded maximum attempts for iCSC entry", v2, v3, v4, v5, v6);
}

void __82__CDPDDeviceSecretValidator__performSingleiCSCRecoveryWithSecret_type_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Un-set _isAttemptingRecovery to resume acting upon circle changes after failed single iCSC recovery", v2, v3, v4, v5, v6);
}

- (void)repairEDPStateWithContext:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v1 = [a1 delegate];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6_2(&dword_218640000, v2, v3, "%s: Delegate %@ does not respond to selector to repair EDP state.", v4, v5, v6, v7, 2u);
}

- (void)validateEDPRecoveryToken:(void *)a1 withContext:completion:.cold.1(void *a1)
{
  uint64_t v1 = [a1 delegate];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6_2(&dword_218640000, v2, v3, "%s: Delegate %@ does not respond to selector for validating EDP recovery token.", v4, v5, v6, v7, 2u);
}

void __51__CDPDDeviceSecretValidator_setValidSecretHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end