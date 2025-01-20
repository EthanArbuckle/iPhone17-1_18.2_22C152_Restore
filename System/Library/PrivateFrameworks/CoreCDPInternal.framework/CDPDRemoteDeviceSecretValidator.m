@interface CDPDRemoteDeviceSecretValidator
- (id)_decoratedDelegate;
- (void)_decoratedDelegate;
- (void)_retriableValidateCustodianRecoveryInfo:(id)a3 withCompletion:(id)a4;
- (void)approveFromAnotherDeviceWithCompletion:(id)a3;
- (void)attemptToJoinCircleWithPiggybacking:(id)a3 withCompletion:(id)a4;
- (void)cancelApproveFromAnotherDevice;
- (void)resetAccountCDPStateWithEscapeOptionsOffered:(unint64_t)a3;
- (void)resetAccountCDPStateWithEscapeOptionsOffered:(unint64_t)a3 andSetSecret:(id)a4;
- (void)setValidSecretHandler:(id)a3;
- (void)supportedEscapeOfferMaskCompletion:(id)a3;
- (void)validateCustodianRecoveryInfo:(id)a3 withCompletion:(id)a4;
@end

@implementation CDPDRemoteDeviceSecretValidator

- (void)setValidSecretHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__CDPDRemoteDeviceSecretValidator_setValidSecretHandler___block_invoke;
  v7[3] = &unk_26432F978;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v8 = v5;
  v6.receiver = self;
  v6.super_class = (Class)CDPDRemoteDeviceSecretValidator;
  [(CDPDDeviceSecretValidator *)&v6 setValidSecretHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __57__CDPDRemoteDeviceSecretValidator_setValidSecretHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (!v5) {
    [WeakRetained cancelApproveFromAnotherDevice];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

- (void)approveFromAnotherDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CDPDRemoteDeviceSecretValidator approveFromAnotherDeviceWithCompletion:]();
  }

  objc_super v6 = _Block_copy(v4);
  id requestToJoinCompletion = self->_requestToJoinCompletion;
  self->_id requestToJoinCompletion = v6;

  self->_isWaitingForRemoteApproval = 1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke;
  aBlock[3] = &unk_26432F9A0;
  aBlock[4] = self;
  uint64_t v8 = _Block_copy(aBlock);
  id v9 = [(CDPDRemoteDeviceSecretValidator *)self _decoratedDelegate];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2;
  v11[3] = &unk_26432EDC0;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 remoteSecretValidator:self applyToJoinCircleWithJoinHandler:v11];
}

void __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 112);
  if (v3)
  {
    (*(void (**)(uint64_t, void, uint64_t))(v3 + 16))(v3, 0, a2);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 112);
    *(void *)(v4 + 112) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 120) = 0;
  }
}

void __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!a2)
  {
    v16 = _CDPLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2_cold_4((uint64_t)v5, v16);
    }

    if (v5)
    {
      uint64_t v19 = *MEMORY[0x263F08608];
      v20[0] = v5;
      v14 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    }
    else
    {
      v14 = 0;
    }
    uint64_t v17 = *(void *)(a1 + 40);
    v18 = _CDPStateError();
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);

    goto LABEL_19;
  }
  char v6 = [*(id *)(a1 + 32) isAttemptingRecovery];
  v7 = *(unsigned char **)(a1 + 32);
  if ((v6 & 1) != 0 || !v7[120])
  {
    if ([v7 isAttemptingRecovery])
    {
      _CDPLogSystem();
      v14 = (CDPDRemoteSecretValidationResult *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEBUG)) {
        __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2_cold_1();
      }
    }
    else
    {
      if (*(unsigned char *)(*(void *)(a1 + 32) + 120)) {
        goto LABEL_20;
      }
      _CDPLogSystem();
      v14 = (CDPDRemoteSecretValidationResult *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEBUG)) {
        __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2_cold_2();
      }
    }
    goto LABEL_19;
  }
  v7[120] = 0;
  uint64_t v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2_cold_3();
  }

  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = v9[14];
  if (v10)
  {
    (*(void (**)(void, uint64_t, void))(v10 + 16))(v9[14], 1, 0);
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 112);
    *(void *)(v11 + 112) = 0;

    id v9 = *(void **)(a1 + 32);
  }
  v13 = [v9 validSecretHandler];

  if (v13)
  {
    v14 = objc_alloc_init(CDPDRemoteSecretValidationResult);
    [(CDPDRemoteSecretValidationResult *)v14 setSecretType:4];
    v15 = [*(id *)(a1 + 32) validSecretHandler];
    ((void (**)(void, CDPDRemoteSecretValidationResult *, void))v15)[2](v15, v14, 0);

LABEL_19:
  }
LABEL_20:
}

- (void)validateCustodianRecoveryInfo:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F203F8]) initWithMaxRetries:1];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__CDPDRemoteDeviceSecretValidator_validateCustodianRecoveryInfo_withCompletion___block_invoke;
  aBlock[3] = &unk_26432F9C8;
  objc_copyWeak(&v19, &location);
  id v9 = v6;
  id v18 = v9;
  uint64_t v10 = _Block_copy(aBlock);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__CDPDRemoteDeviceSecretValidator_validateCustodianRecoveryInfo_withCompletion___block_invoke_2;
  v13[3] = &unk_26432F9F0;
  objc_copyWeak(&v16, &location);
  id v11 = v7;
  id v15 = v11;
  id v12 = v8;
  id v14 = v12;
  [v12 scheduleTask:v10 shouldRetry:0 completionHandler:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __80__CDPDRemoteDeviceSecretValidator_validateCustodianRecoveryInfo_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _retriableValidateCustodianRecoveryInfo:*(void *)(a1 + 32) withCompletion:v4];
}

void __80__CDPDRemoteDeviceSecretValidator_validateCustodianRecoveryInfo_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412546;
    id v19 = v5;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Circle join using custodian recovery info result: %@, %@", (uint8_t *)&v18, 0x16u);
  }

  objc_opt_class();
  id v9 = v5;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  if (WeakRetained)
  {
    id v11 = [WeakRetained validSecretHandler];

    if (v11)
    {
      int v12 = [v10 BOOLValue];
      v13 = _CDPLogSystem();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "Joining to circle succeed", (uint8_t *)&v18, 2u);
        }

        id v15 = objc_alloc_init(CDPDRemoteSecretValidationResult);
        [(CDPDRemoteSecretValidationResult *)v15 setSecretType:6];
        id v16 = [WeakRetained validSecretHandler];
        ((void (**)(void, CDPDRemoteSecretValidationResult *, void))v16)[2](v16, v15, 0);
      }
      else
      {
        if (v14)
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "Joining to circle failed", (uint8_t *)&v18, 2u);
        }

        id v15 = [WeakRetained validSecretHandler];
        ((void (*)(CDPDRemoteSecretValidationResult *, void, id))v15->_secretType)(v15, 0, v6);
      }
    }
    else
    {
      _CDPLogSystem();
      id v15 = (CDPDRemoteSecretValidationResult *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_DEBUG)) {
        __80__CDPDRemoteDeviceSecretValidator_validateCustodianRecoveryInfo_withCompletion___block_invoke_2_cold_2();
      }
    }
  }
  else
  {
    _CDPLogSystem();
    id v15 = (CDPDRemoteSecretValidationResult *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_DEBUG)) {
      __80__CDPDRemoteDeviceSecretValidator_validateCustodianRecoveryInfo_withCompletion___block_invoke_2_cold_1();
    }
  }

  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, uint64_t, id))(v17 + 16))(v17, [v10 BOOLValue], v6);
  }
}

- (void)_retriableValidateCustodianRecoveryInfo:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263F202A8];
  id v8 = a3;
  id v9 = [(CDPDDeviceSecretValidator *)self context];
  id v10 = [v7 analyticsEventWithContext:v9 eventName:*MEMORY[0x263F347B8] category:*MEMORY[0x263F34830]];

  id v11 = [(CDPDRemoteDeviceSecretValidator *)self _decoratedDelegate];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __90__CDPDRemoteDeviceSecretValidator__retriableValidateCustodianRecoveryInfo_withCompletion___block_invoke;
  v14[3] = &unk_26432EDC0;
  id v15 = v10;
  id v16 = v6;
  id v12 = v6;
  id v13 = v10;
  [v11 remoteSecretValidator:self attemptCustodianRecoveryWithInfo:v8 completion:v14];
}

void __90__CDPDRemoteDeviceSecretValidator__retriableValidateCustodianRecoveryInfo_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id v5 = [NSNumber numberWithBool:a2];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:*MEMORY[0x263F34558]];

  [*(id *)(a1 + 32) populateUnderlyingErrorsStartingWithRootError:v9];
  id v6 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v6 sendEvent:*(void *)(a1 + 32)];

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    id v8 = [NSNumber numberWithBool:a2];
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v9);
  }
}

- (void)attemptToJoinCircleWithPiggybacking:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CDPDRemoteDeviceSecretValidator *)self _decoratedDelegate];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __86__CDPDRemoteDeviceSecretValidator_attemptToJoinCircleWithPiggybacking_withCompletion___block_invoke;
  v10[3] = &unk_26432EDC0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 remoteSecretValidator:self attemptCircleJoinWithPiggybackingContext:v7 completion:v10];
}

void __86__CDPDRemoteDeviceSecretValidator_attemptToJoinCircleWithPiggybacking_withCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __86__CDPDRemoteDeviceSecretValidator_attemptToJoinCircleWithPiggybacking_withCompletion___block_invoke_cold_1();
    }

    id v7 = [*(id *)(a1 + 32) validSecretHandler];

    if (v7)
    {
      id v8 = objc_alloc_init(CDPDRemoteSecretValidationResult);
      [(CDPDRemoteSecretValidationResult *)v8 setSecretType:7];
      id v9 = [*(id *)(a1 + 32) validSecretHandler];
      ((void (**)(void, CDPDRemoteSecretValidationResult *, void))v9)[2](v9, v8, 0);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_decoratedDelegate
{
  uint64_t v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(CDPDRemoteDeviceSecretValidator *)self _decoratedDelegate];
  }

  id v4 = [(CDPDDeviceSecretValidator *)self delegate];
  int v5 = [v4 conformsToProtocol:&unk_26C9D7308];

  if (v5)
  {
    id v6 = [(CDPDDeviceSecretValidator *)self delegate];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)cancelApproveFromAnotherDevice
{
  self->_isWaitingForRemoteApproval = 0;
  uint64_t v3 = [(CDPDRemoteDeviceSecretValidator *)self _decoratedDelegate];
  [v3 cancelRemoteSecretValidatorApplicationToJoinCircle:self];

  id requestToJoinCompletion = self->_requestToJoinCompletion;
  if (requestToJoinCompletion)
  {
    int v5 = (void (*)(void))*((void *)requestToJoinCompletion + 2);
    v5();
  }
}

- (void)resetAccountCDPStateWithEscapeOptionsOffered:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[CDPDRemoteDeviceSecretValidator resetAccountCDPStateWithEscapeOptionsOffered:]";
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "%s: was called", (uint8_t *)&v6, 0xCu);
  }

  [(CDPDRemoteDeviceSecretValidator *)self resetAccountCDPStateWithEscapeOptionsOffered:a3 andSetSecret:0];
}

- (void)resetAccountCDPStateWithEscapeOptionsOffered:(unint64_t)a3 andSetSecret:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    id v15 = "-[CDPDRemoteDeviceSecretValidator resetAccountCDPStateWithEscapeOptionsOffered:andSetSecret:]";
    _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "%s: was called", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v8 = [(CDPDDeviceSecretValidator *)self validSecretHandler];

  if (v8)
  {
    id v9 = objc_alloc_init(CDPDRemoteSecretValidationResult);
    [(CDPDRemoteSecretValidationResult *)v9 setUserDidReset:1];
    [(CDPDRemoteSecretValidationResult *)v9 setRequiredEscapeOffers:[(CDPDDeviceSecretValidator *)self supportedEscapeOfferMask]];
    [(CDPDRemoteSecretValidationResult *)v9 setEscapeOffersPresentedMask:a3];
    if (v6)
    {
      id v10 = objc_alloc(MEMORY[0x263F343B0]);
      id v11 = [v6 validatedSecret];
      id v12 = objc_msgSend(v10, "initWithValidatedSecret:secretType:", v11, objc_msgSend(v6, "secretType"));
      [(CDPDRemoteSecretValidationResult *)v9 setCachedSecretForReenrollment:v12];
    }
    id v13 = [(CDPDDeviceSecretValidator *)self validSecretHandler];
    ((void (**)(void, CDPDRemoteSecretValidationResult *, void))v13)[2](v13, v9, 0);
  }
}

- (void)supportedEscapeOfferMaskCompletion:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    (*((void (**)(id, unint64_t))a3 + 2))(v5, [(CDPDDeviceSecretValidator *)self supportedEscapeOfferMask]);
  }
}

- (void).cxx_destruct
{
}

- (void)approveFromAnotherDeviceWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Attempting to join the circle using remote approval...", v2, v3, v4, v5, v6);
}

void __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Ignoring circle state change because a recovery is in progress", v2, v3, v4, v5, v6);
}

void __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Ignoring circle state change because we're not supposed to be waiting for remote approval", v2, v3, v4, v5, v6);
}

void __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Circle join was approved from another device", v2, v3, v4, v5, v6);
}

void __74__CDPDRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2_cold_4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218640000, a2, OS_LOG_TYPE_ERROR, "Failed to request circle join approval from another device - %@", (uint8_t *)&v2, 0xCu);
}

void __80__CDPDRemoteDeviceSecretValidator_validateCustodianRecoveryInfo_withCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "validator deallocated", v2, v3, v4, v5, v6);
}

void __80__CDPDRemoteDeviceSecretValidator_validateCustodianRecoveryInfo_withCompletion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "validSecretHandler not called - found nil.", v2, v3, v4, v5, v6);
}

void __86__CDPDRemoteDeviceSecretValidator_attemptToJoinCircleWithPiggybacking_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Circle join was successfull with piggybacking recovery", v2, v3, v4, v5, v6);
}

- (void)_decoratedDelegate
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 delegate];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "Fetching decorated delegate: %@", (uint8_t *)&v4, 0xCu);
}

@end