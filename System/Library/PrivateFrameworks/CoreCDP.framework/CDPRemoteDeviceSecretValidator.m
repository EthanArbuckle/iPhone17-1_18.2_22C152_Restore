@interface CDPRemoteDeviceSecretValidator
- (CDPRemoteDeviceSecretValidator)initWithContext:(id)a3 validator:(id)a4;
- (unint64_t)supportedEscapeOfferMask;
- (void)_executeSyncOnMainThreadIfNeeded:(id)a3;
- (void)approveFromAnotherDeviceWithCompletion:(id)a3;
- (void)attemptToJoinCircleWithPiggybacking:(id)a3 withCompletion:(id)a4;
- (void)cancelApproveFromAnotherDevice;
- (void)cancelValidationWithError:(id)a3;
- (void)repairEDPStateWithContext:(id)a3 completion:(id)a4;
- (void)resetAccountCDPState;
- (void)resetAccountCDPStateWithEscapeOptionsOffered:(unint64_t)a3;
- (void)resetAccountCDPStateWithEscapeOptionsOffered:(unint64_t)a3 andSetSecret:(id)a4;
- (void)supportedEscapeOfferMaskCompletion:(id)a3;
- (void)validateCustodianRecoveryInfo:(id)a3 withCompletion:(id)a4;
- (void)validateEDPRecoveryToken:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)validateRecoveryKey:(id)a3 withCompletion:(id)a4;
- (void)validateSecret:(id)a3 devices:(id)a4 type:(unint64_t)a5 withCompletion:(id)a6;
@end

@implementation CDPRemoteDeviceSecretValidator

- (CDPRemoteDeviceSecretValidator)initWithContext:(id)a3 validator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(CDPRemoteDeviceSecretValidator *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_validator, a4);
    objc_storeStrong((id *)&v10->_context, a3);
  }

  return v10;
}

- (void)validateSecret:(id)a3 devices:(id)a4 type:(unint64_t)a5 withCompletion:(id)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = _CDPLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    validator = self->_validator;
    *(_DWORD *)buf = 138412290;
    v20 = validator;
    _os_log_impl(&dword_2182AE000, v13, OS_LOG_TYPE_DEFAULT, "Attempting to validate secret using validator %@", buf, 0xCu);
  }

  v15 = self->_validator;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __77__CDPRemoteDeviceSecretValidator_validateSecret_devices_type_withCompletion___block_invoke;
  v17[3] = &unk_2643176B0;
  v17[4] = self;
  id v18 = v10;
  id v16 = v10;
  [(CDPRemoteDeviceSecretValidatorProtocol *)v15 validateSecret:v12 devices:v11 type:a5 withCompletion:v17];
}

void __77__CDPRemoteDeviceSecretValidator_validateSecret_devices_type_withCompletion___block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v18 = a2;
    __int16 v19 = 1024;
    int v20 = a3;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "Validator returned response of isValid=%i canRetry=%i error=%@ ... dispatching completion block on to main queue", buf, 0x18u);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__CDPRemoteDeviceSecretValidator_validateSecret_devices_type_withCompletion___block_invoke_16;
  v12[3] = &unk_264316FC8;
  v9 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  char v15 = a2;
  char v16 = a3;
  id v13 = v7;
  id v14 = v10;
  id v11 = v7;
  [v9 _executeSyncOnMainThreadIfNeeded:v12];
}

uint64_t __77__CDPRemoteDeviceSecretValidator_validateSecret_devices_type_withCompletion___block_invoke_16(uint64_t a1)
{
  v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __77__CDPRemoteDeviceSecretValidator_validateSecret_devices_type_withCompletion___block_invoke_16_cold_1();
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(void *)(a1 + 32));
  }
  return result;
}

- (void)validateRecoveryKey:(id)a3 withCompletion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    validator = self->_validator;
    *(_DWORD *)buf = 138412290;
    char v15 = validator;
    _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to validate recovery key using validator %@", buf, 0xCu);
  }

  id v10 = self->_validator;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__CDPRemoteDeviceSecretValidator_validateRecoveryKey_withCompletion___block_invoke;
  v12[3] = &unk_2643176B0;
  void v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [(CDPRemoteDeviceSecretValidatorProtocol *)v10 validateRecoveryKey:v7 withCompletion:v12];
}

void __69__CDPRemoteDeviceSecretValidator_validateRecoveryKey_withCompletion___block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __69__CDPRemoteDeviceSecretValidator_validateRecoveryKey_withCompletion___block_invoke_2;
  v11[3] = &unk_264316FC8;
  id v8 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  char v14 = a2;
  char v15 = a3;
  id v12 = v7;
  id v13 = v9;
  id v10 = v7;
  [v8 _executeSyncOnMainThreadIfNeeded:v11];
}

uint64_t __69__CDPRemoteDeviceSecretValidator_validateRecoveryKey_withCompletion___block_invoke_2(uint64_t a1)
{
  v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __69__CDPRemoteDeviceSecretValidator_validateRecoveryKey_withCompletion___block_invoke_2_cold_1();
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(void *)(a1 + 32));
  }
  return result;
}

- (void)validateCustodianRecoveryInfo:(id)a3 withCompletion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    validator = self->_validator;
    *(_DWORD *)buf = 138412290;
    char v15 = validator;
    _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to validate custodian recovery info using validator %@", buf, 0xCu);
  }

  id v10 = self->_validator;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __79__CDPRemoteDeviceSecretValidator_validateCustodianRecoveryInfo_withCompletion___block_invoke;
  v12[3] = &unk_264317700;
  void v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [(CDPRemoteDeviceSecretValidatorProtocol *)v10 validateCustodianRecoveryInfo:v7 withCompletion:v12];
}

void __79__CDPRemoteDeviceSecretValidator_validateCustodianRecoveryInfo_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__CDPRemoteDeviceSecretValidator_validateCustodianRecoveryInfo_withCompletion___block_invoke_2;
  v9[3] = &unk_2643176D8;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  [v6 _executeSyncOnMainThreadIfNeeded:v9];
}

uint64_t __79__CDPRemoteDeviceSecretValidator_validateCustodianRecoveryInfo_withCompletion___block_invoke_2(uint64_t a1)
{
  v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2182AE000, v2, OS_LOG_TYPE_DEFAULT, "InvokingvalidateCustodianRecoveryInfo:withCompletion: completion block on the main queue", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)attemptToJoinCircleWithPiggybacking:(id)a3 withCompletion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    validator = self->_validator;
    *(_DWORD *)buf = 138412290;
    char v15 = validator;
    _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to join circle with piggybacking using validator %@", buf, 0xCu);
  }

  id v10 = self->_validator;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __85__CDPRemoteDeviceSecretValidator_attemptToJoinCircleWithPiggybacking_withCompletion___block_invoke;
  v12[3] = &unk_264317700;
  void v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [(CDPRemoteDeviceSecretValidatorProtocol *)v10 attemptToJoinCircleWithPiggybacking:v7 withCompletion:v12];
}

void __85__CDPRemoteDeviceSecretValidator_attemptToJoinCircleWithPiggybacking_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __85__CDPRemoteDeviceSecretValidator_attemptToJoinCircleWithPiggybacking_withCompletion___block_invoke_2;
  v9[3] = &unk_2643176D8;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  [v6 _executeSyncOnMainThreadIfNeeded:v9];
}

uint64_t __85__CDPRemoteDeviceSecretValidator_attemptToJoinCircleWithPiggybacking_withCompletion___block_invoke_2(uint64_t a1)
{
  v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2182AE000, v2, OS_LOG_TYPE_DEFAULT, "Invoking attemptToJoinCircleWithPiggybacking:withCompletion: completion block on the main queue", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)approveFromAnotherDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CDPRemoteDeviceSecretValidator approveFromAnotherDeviceWithCompletion:]();
  }

  validator = self->_validator;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__CDPRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke;
  v8[3] = &unk_264317700;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(CDPRemoteDeviceSecretValidatorProtocol *)validator approveFromAnotherDeviceWithCompletion:v8];
}

void __73__CDPRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73__CDPRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2;
  v9[3] = &unk_2643176D8;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  [v6 _executeSyncOnMainThreadIfNeeded:v9];
}

uint64_t __73__CDPRemoteDeviceSecretValidator_approveFromAnotherDeviceWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)cancelApproveFromAnotherDevice
{
  v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2182AE000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling request for remote approval...", v4, 2u);
  }

  [(CDPRemoteDeviceSecretValidatorProtocol *)self->_validator cancelApproveFromAnotherDevice];
}

- (void)resetAccountCDPState
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_2182AE000, v0, OS_LOG_TYPE_ERROR, "External clients should not perform RPD.", v1, 2u);
}

- (void)resetAccountCDPStateWithEscapeOptionsOffered:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    unint64_t v7 = a3;
    _os_log_impl(&dword_2182AE000, v5, OS_LOG_TYPE_DEFAULT, "Requesting reset of CDP account state with escape offers presented: %lu", (uint8_t *)&v6, 0xCu);
  }

  [(CDPRemoteDeviceSecretValidatorProtocol *)self->_validator resetAccountCDPStateWithEscapeOptionsOffered:a3];
}

- (void)resetAccountCDPStateWithEscapeOptionsOffered:(unint64_t)a3 andSetSecret:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v6 = a4;
  unint64_t v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    unint64_t v9 = a3;
    _os_log_impl(&dword_2182AE000, v7, OS_LOG_TYPE_DEFAULT, "Requesting reset of CDP account state with escape offers presented: %lu, and setting secret...", (uint8_t *)&v8, 0xCu);
  }

  [(CDPRemoteDeviceSecretValidatorProtocol *)self->_validator resetAccountCDPStateWithEscapeOptionsOffered:a3 andSetSecret:v6];
}

- (void)cancelValidationWithError:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CDPRemoteDeviceSecretValidator cancelValidationWithError:]((uint64_t)v4, v5);
  }

  [(CDPRemoteDeviceSecretValidatorProtocol *)self->_validator cancelValidationWithError:v4];
}

- (unint64_t)supportedEscapeOfferMask
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  validator = self->_validator;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__CDPRemoteDeviceSecretValidator_supportedEscapeOfferMask__block_invoke;
  v10[3] = &unk_264317728;
  char v12 = &v13;
  id v5 = v3;
  id v11 = v5;
  [(CDPRemoteDeviceSecretValidatorProtocol *)validator supportedEscapeOfferMaskCompletion:v10];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v14[3];
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = v7;
    _os_log_impl(&dword_2182AE000, v6, OS_LOG_TYPE_DEFAULT, "Supported Escape Offers: %lu", buf, 0xCu);
  }

  unint64_t v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

intptr_t __58__CDPRemoteDeviceSecretValidator_supportedEscapeOfferMask__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)supportedEscapeOfferMaskCompletion:(id)a3
{
  id v4 = a3;
  validator = self->_validator;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__CDPRemoteDeviceSecretValidator_supportedEscapeOfferMaskCompletion___block_invoke;
  v7[3] = &unk_264317778;
  id v8 = v4;
  id v6 = v4;
  [(CDPRemoteDeviceSecretValidatorProtocol *)validator supportedEscapeOfferMaskCompletion:v7];
}

void __69__CDPRemoteDeviceSecretValidator_supportedEscapeOfferMaskCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __69__CDPRemoteDeviceSecretValidator_supportedEscapeOfferMaskCompletion___block_invoke_2;
  v3[3] = &unk_264317750;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __69__CDPRemoteDeviceSecretValidator_supportedEscapeOfferMaskCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

- (void)repairEDPStateWithContext:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[CDPRemoteDeviceSecretValidator repairEDPStateWithContext:completion:]";
    _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "%s: Calling into daemon validator to repair EDP state", (uint8_t *)&v9, 0xCu);
  }

  [(CDPRemoteDeviceSecretValidatorProtocol *)self->_validator repairEDPStateWithContext:v7 completion:v6];
}

- (void)validateEDPRecoveryToken:(id)a3 withContext:(id)a4 completion:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[CDPRemoteDeviceSecretValidator validateEDPRecoveryToken:withContext:completion:]";
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "%s: Calling into daemon validator to validate recovery token", (uint8_t *)&v12, 0xCu);
  }

  [(CDPRemoteDeviceSecretValidatorProtocol *)self->_validator validateEDPRecoveryToken:v10 withContext:v9 completion:v8];
}

- (void)_executeSyncOnMainThreadIfNeeded:(id)a3
{
  dispatch_semaphore_t v3 = (void (**)(void))a3;
  if (v3)
  {
    block = v3;
    if ([MEMORY[0x263F08B88] isMainThread]) {
      block[2]();
    }
    else {
      dispatch_sync(MEMORY[0x263EF83A0], block);
    }
    dispatch_semaphore_t v3 = block;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_validator, 0);
}

void __77__CDPRemoteDeviceSecretValidator_validateSecret_devices_type_withCompletion___block_invoke_16_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Invoking validateSecret:devices:type:withCompletion: completion block on the main queue", v2, v3, v4, v5, v6);
}

void __69__CDPRemoteDeviceSecretValidator_validateRecoveryKey_withCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Invoking validateRecoveryKey:withCompletion: completion block on the main queue", v2, v3, v4, v5, v6);
}

- (void)approveFromAnotherDeviceWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Requesting approval from another device...", v2, v3, v4, v5, v6);
}

- (void)cancelValidationWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "Cancelling validation with error %@", (uint8_t *)&v2, 0xCu);
}

@end