@interface CDPRecoveryKeySecretValidatorProxyImpl
- (CDPRecoveryKeySecretValidatorProxyImpl)initWithRemoteObject:(id)a3;
- (unint64_t)supportedEscapeOfferMask;
- (void)approveFromAnotherDeviceWithCompletion:(id)a3;
- (void)cancelApproveFromAnotherDevice;
- (void)cancelValidationWithError:(id)a3;
- (void)resetAccountCDPStateWithEscapeOptionsOffered:(unint64_t)a3;
- (void)resetAccountCDPStateWithEscapeOptionsOffered:(unint64_t)a3 andSetSecret:(id)a4;
- (void)setSupportedEscapeOfferMask:(unint64_t)a3;
- (void)supportedEscapeOfferMaskCompletion:(id)a3;
- (void)validateCustodianRecoveryInfo:(id)a3 withCompletion:(id)a4;
- (void)validateRecoveryKey:(id)a3 withCompletion:(id)a4;
- (void)validateSecret:(id)a3 devices:(id)a4 type:(unint64_t)a5 withCompletion:(id)a6;
@end

@implementation CDPRecoveryKeySecretValidatorProxyImpl

- (CDPRecoveryKeySecretValidatorProxyImpl)initWithRemoteObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDPRecoveryKeySecretValidatorProxyImpl;
  v6 = [(CDPRecoveryKeySecretValidatorProxyImpl *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_validator, a3);
  }

  return v7;
}

- (void)approveFromAnotherDeviceWithCompletion:(id)a3
{
  v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[CDPRecoveryKeySecretValidatorProxyImpl approveFromAnotherDeviceWithCompletion:]();
  }
}

- (void)cancelApproveFromAnotherDevice
{
  v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[CDPRecoveryKeySecretValidatorProxyImpl approveFromAnotherDeviceWithCompletion:]();
  }
}

- (void)cancelValidationWithError:(id)a3
{
  v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[CDPRecoveryKeySecretValidatorProxyImpl approveFromAnotherDeviceWithCompletion:]();
  }
}

- (void)resetAccountCDPStateWithEscapeOptionsOffered:(unint64_t)a3
{
  v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[CDPRecoveryKeySecretValidatorProxyImpl approveFromAnotherDeviceWithCompletion:]();
  }
}

- (void)resetAccountCDPStateWithEscapeOptionsOffered:(unint64_t)a3 andSetSecret:(id)a4
{
  v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CDPRecoveryKeySecretValidatorProxyImpl approveFromAnotherDeviceWithCompletion:]();
  }
}

- (void)supportedEscapeOfferMaskCompletion:(id)a3
{
  v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[CDPRecoveryKeySecretValidatorProxyImpl approveFromAnotherDeviceWithCompletion:]();
  }
}

- (void)validateCustodianRecoveryInfo:(id)a3 withCompletion:(id)a4
{
  v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CDPRecoveryKeySecretValidatorProxyImpl approveFromAnotherDeviceWithCompletion:]();
  }
}

- (void)validateRecoveryKey:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  validator = self->_validator;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__CDPRecoveryKeySecretValidatorProxyImpl_validateRecoveryKey_withCompletion___block_invoke;
  v9[3] = &unk_264316FF0;
  id v10 = v6;
  id v8 = v6;
  [(CDPRemoteDeviceSecretValidatorProtocol *)validator validateRecoveryKey:a3 withCompletion:v9];
}

void __77__CDPRecoveryKeySecretValidatorProxyImpl_validateRecoveryKey_withCompletion___block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__CDPRecoveryKeySecretValidatorProxyImpl_validateRecoveryKey_withCompletion___block_invoke_2;
  block[3] = &unk_264316FC8;
  id v8 = *(id *)(a1 + 32);
  char v13 = a2;
  char v14 = a3;
  id v11 = v7;
  id v12 = v8;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __77__CDPRecoveryKeySecretValidatorProxyImpl_validateRecoveryKey_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(void *)(a1 + 32));
  }
  return result;
}

- (void)validateSecret:(id)a3 devices:(id)a4 type:(unint64_t)a5 withCompletion:(id)a6
{
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[CDPRecoveryKeySecretValidatorProxyImpl approveFromAnotherDeviceWithCompletion:]();
  }
}

- (unint64_t)supportedEscapeOfferMask
{
  return self->supportedEscapeOfferMask;
}

- (void)setSupportedEscapeOfferMask:(unint64_t)a3
{
  self->supportedEscapeOfferMask = a3;
}

- (void).cxx_destruct
{
}

- (void)approveFromAnotherDeviceWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_12(&dword_2182AE000, v0, v1, "Not implemented", v2, v3, v4, v5, v6);
}

@end