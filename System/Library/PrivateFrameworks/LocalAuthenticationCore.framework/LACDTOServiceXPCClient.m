@interface LACDTOServiceXPCClient
- (BOOL)isFeatureAvailable;
- (BOOL)isFeatureEnabled;
- (BOOL)isFeatureStrictModeEnabled;
- (BOOL)isFeatureSupported;
- (BOOL)isSensorTrusted;
- (LACDTOServiceXPCClient)initWithEndpointProvider:(id)a3;
- (id)_connectionWithErrorHandler:(id)a3;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)ratchetState;
- (void)_handleConnectionClose;
- (void)cancelPendingEvaluationWithRatchetIdentifier:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)checkCanEnableFeatureWithCompletion:(id)a3;
- (void)checkIsFeatureAvailableWithCompletion:(id)a3;
- (void)checkIsFeatureEnabledWithCompletion:(id)a3;
- (void)checkIsFeatureStrictModeEnabledWithCompletion:(id)a3;
- (void)checkIsFeatureSupportedWithCompletion:(id)a3;
- (void)dealloc;
- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4;
- (void)disableFeatureWithContext:(id)a3 completion:(id)a4;
- (void)enableFeatureActivatingGracePeriodWithCompletion:(id)a3;
- (void)enableFeatureStrictModeWithCompletion:(id)a3;
- (void)enableFeatureWithCompletion:(id)a3;
- (void)ratchetStateCompositeWithCompletion:(id)a3;
- (void)ratchetStateWithCompletion:(id)a3;
@end

@implementation LACDTOServiceXPCClient

- (LACDTOServiceXPCClient)initWithEndpointProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACDTOServiceXPCClient;
  v6 = [(LACDTOServiceXPCClient *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpointProvider, a3);
    v7->_connectionLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)LACDTOServiceXPCClient;
  [(LACDTOServiceXPCClient *)&v3 dealloc];
}

- (id)ratchetState
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__LACDTOServiceXPCClient_ratchetState__block_invoke;
  v6[3] = &unk_2653B6A28;
  v6[4] = &v7;
  v2 = [(LACDTOServiceXPCClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__LACDTOServiceXPCClient_ratchetState__block_invoke_3;
  v5[3] = &unk_2653B6A50;
  v5[4] = &v7;
  [v2 ratchetStateWithCompletion:v5];

  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

void __38__LACDTOServiceXPCClient_ratchetState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = LACLogDTO();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__LACDTOServiceXPCClient_ratchetState__block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

void __38__LACDTOServiceXPCClient_ratchetState__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = LACLogDTO();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __38__LACDTOServiceXPCClient_ratchetState__block_invoke_3_cold_1();
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

- (BOOL)isFeatureEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__LACDTOServiceXPCClient_isFeatureEnabled__block_invoke;
  v5[3] = &unk_2653B6A28;
  v5[4] = &v6;
  v2 = [(LACDTOServiceXPCClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v5];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__LACDTOServiceXPCClient_isFeatureEnabled__block_invoke_5;
  v4[3] = &unk_2653B6A78;
  v4[4] = &v6;
  [v2 checkIsFeatureEnabledWithCompletion:v4];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __42__LACDTOServiceXPCClient_isFeatureEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = LACLogDTO();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__LACDTOServiceXPCClient_ratchetState__block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

void __42__LACDTOServiceXPCClient_isFeatureEnabled__block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = LACLogDTO();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __42__LACDTOServiceXPCClient_isFeatureEnabled__block_invoke_5_cold_1();
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (BOOL)isFeatureSupported
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__LACDTOServiceXPCClient_isFeatureSupported__block_invoke;
  v5[3] = &unk_2653B6A28;
  v5[4] = &v6;
  v2 = [(LACDTOServiceXPCClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v5];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__LACDTOServiceXPCClient_isFeatureSupported__block_invoke_7;
  v4[3] = &unk_2653B6A78;
  v4[4] = &v6;
  [v2 checkIsFeatureSupportedWithCompletion:v4];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __44__LACDTOServiceXPCClient_isFeatureSupported__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = LACLogDTO();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__LACDTOServiceXPCClient_ratchetState__block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

void __44__LACDTOServiceXPCClient_isFeatureSupported__block_invoke_7(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = LACLogDTO();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __44__LACDTOServiceXPCClient_isFeatureSupported__block_invoke_7_cold_1();
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (BOOL)isFeatureAvailable
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__LACDTOServiceXPCClient_isFeatureAvailable__block_invoke;
  v5[3] = &unk_2653B6A28;
  v5[4] = &v6;
  v2 = [(LACDTOServiceXPCClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v5];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__LACDTOServiceXPCClient_isFeatureAvailable__block_invoke_8;
  v4[3] = &unk_2653B6A78;
  v4[4] = &v6;
  [v2 checkIsFeatureAvailableWithCompletion:v4];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __44__LACDTOServiceXPCClient_isFeatureAvailable__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = LACLogDTO();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__LACDTOServiceXPCClient_ratchetState__block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

void __44__LACDTOServiceXPCClient_isFeatureAvailable__block_invoke_8(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = LACLogDTO();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __44__LACDTOServiceXPCClient_isFeatureAvailable__block_invoke_8_cold_1();
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (BOOL)isFeatureStrictModeEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__LACDTOServiceXPCClient_isFeatureStrictModeEnabled__block_invoke;
  v5[3] = &unk_2653B6A28;
  v5[4] = &v6;
  v2 = [(LACDTOServiceXPCClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v5];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__LACDTOServiceXPCClient_isFeatureStrictModeEnabled__block_invoke_9;
  v4[3] = &unk_2653B6A78;
  v4[4] = &v6;
  [v2 checkIsFeatureStrictModeEnabledWithCompletion:v4];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __52__LACDTOServiceXPCClient_isFeatureStrictModeEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = LACLogDTO();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__LACDTOServiceXPCClient_ratchetState__block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

void __52__LACDTOServiceXPCClient_isFeatureStrictModeEnabled__block_invoke_9(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = LACLogDTO();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __52__LACDTOServiceXPCClient_isFeatureStrictModeEnabled__block_invoke_9_cold_1();
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (BOOL)isSensorTrusted
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__LACDTOServiceXPCClient_isSensorTrusted__block_invoke;
  v5[3] = &unk_2653B6A28;
  v5[4] = &v6;
  v2 = [(LACDTOServiceXPCClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v5];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__LACDTOServiceXPCClient_isSensorTrusted__block_invoke_10;
  v4[3] = &unk_2653B6A78;
  v4[4] = &v6;
  [v2 checkIsSensorTrustedWithCompletion:v4];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __41__LACDTOServiceXPCClient_isSensorTrusted__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = LACLogDTO();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__LACDTOServiceXPCClient_ratchetState__block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

void __41__LACDTOServiceXPCClient_isSensorTrusted__block_invoke_10(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = LACLogDTO();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __41__LACDTOServiceXPCClient_isSensorTrusted__block_invoke_10_cold_1();
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (void)ratchetStateWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__LACDTOServiceXPCClient_ratchetStateWithCompletion___block_invoke;
  v7[3] = &unk_2653B5838;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = [(LACDTOServiceXPCClient *)self _remoteObjectProxyWithErrorHandler:v7];
  [v6 ratchetStateWithCompletion:v5];
}

uint64_t __53__LACDTOServiceXPCClient_ratchetStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ratchetStateCompositeWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__LACDTOServiceXPCClient_ratchetStateCompositeWithCompletion___block_invoke;
  v7[3] = &unk_2653B5838;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = [(LACDTOServiceXPCClient *)self _remoteObjectProxyWithErrorHandler:v7];
  [v6 ratchetStateCompositeWithCompletion:v5];
}

uint64_t __62__LACDTOServiceXPCClient_ratchetStateCompositeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkIsFeatureEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__LACDTOServiceXPCClient_checkIsFeatureEnabledWithCompletion___block_invoke;
  v7[3] = &unk_2653B5838;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = [(LACDTOServiceXPCClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v7];
  [v6 checkIsFeatureEnabledWithCompletion:v5];
}

uint64_t __62__LACDTOServiceXPCClient_checkIsFeatureEnabledWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkIsFeatureSupportedWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__LACDTOServiceXPCClient_checkIsFeatureSupportedWithCompletion___block_invoke;
  v7[3] = &unk_2653B5838;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = [(LACDTOServiceXPCClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v7];
  [v6 checkIsFeatureSupportedWithCompletion:v5];
}

uint64_t __64__LACDTOServiceXPCClient_checkIsFeatureSupportedWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkIsFeatureAvailableWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__LACDTOServiceXPCClient_checkIsFeatureAvailableWithCompletion___block_invoke;
  v7[3] = &unk_2653B5838;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = [(LACDTOServiceXPCClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v7];
  [v6 checkIsFeatureAvailableWithCompletion:v5];
}

uint64_t __64__LACDTOServiceXPCClient_checkIsFeatureAvailableWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkIsFeatureStrictModeEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__LACDTOServiceXPCClient_checkIsFeatureStrictModeEnabledWithCompletion___block_invoke;
  v7[3] = &unk_2653B5838;
  id v8 = v4;
  id v5 = v4;
  uint64_t v6 = [(LACDTOServiceXPCClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v7];
  [v6 checkIsFeatureStrictModeEnabledWithCompletion:v5];
}

uint64_t __72__LACDTOServiceXPCClient_checkIsFeatureStrictModeEnabledWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)disableFeatureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LACDTOServiceXPCClient *)self _remoteObjectProxyWithErrorHandler:v6];
  [v8 disableFeatureWithContext:v7 completion:v6];
}

- (void)checkCanEnableFeatureWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__LACDTOServiceXPCClient_checkCanEnableFeatureWithCompletion___block_invoke;
  v7[3] = &unk_2653B5838;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(LACDTOServiceXPCClient *)self _remoteObjectProxyWithErrorHandler:v7];
  [v6 checkCanEnableFeatureWithCompletion:v5];
}

uint64_t __62__LACDTOServiceXPCClient_checkCanEnableFeatureWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enableFeatureWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__LACDTOServiceXPCClient_enableFeatureWithCompletion___block_invoke;
  v7[3] = &unk_2653B5838;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(LACDTOServiceXPCClient *)self _remoteObjectProxyWithErrorHandler:v7];
  [v6 enableFeatureWithCompletion:v5];
}

uint64_t __54__LACDTOServiceXPCClient_enableFeatureWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enableFeatureActivatingGracePeriodWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__LACDTOServiceXPCClient_enableFeatureActivatingGracePeriodWithCompletion___block_invoke;
  v7[3] = &unk_2653B5838;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(LACDTOServiceXPCClient *)self _remoteObjectProxyWithErrorHandler:v7];
  [v6 enableFeatureActivatingGracePeriodWithCompletion:v5];
}

uint64_t __75__LACDTOServiceXPCClient_enableFeatureActivatingGracePeriodWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enableFeatureStrictModeWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__LACDTOServiceXPCClient_enableFeatureStrictModeWithCompletion___block_invoke;
  v7[3] = &unk_2653B5838;
  id v8 = v4;
  id v5 = v4;
  id v6 = [(LACDTOServiceXPCClient *)self _remoteObjectProxyWithErrorHandler:v7];
  [v6 enableFeatureStrictModeWithCompletion:v5];
}

uint64_t __64__LACDTOServiceXPCClient_enableFeatureStrictModeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__LACDTOServiceXPCClient_disableFeatureStrictModeWithContext_completion___block_invoke;
  v10[3] = &unk_2653B5838;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  char v9 = [(LACDTOServiceXPCClient *)self _remoteObjectProxyWithErrorHandler:v10];
  [v9 disableFeatureStrictModeWithContext:v8 completion:v7];
}

uint64_t __73__LACDTOServiceXPCClient_disableFeatureStrictModeWithContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelPendingEvaluationWithRatchetIdentifier:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __89__LACDTOServiceXPCClient_cancelPendingEvaluationWithRatchetIdentifier_reason_completion___block_invoke;
  v13[3] = &unk_2653B5838;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(LACDTOServiceXPCClient *)self _remoteObjectProxyWithErrorHandler:v13];
  [v12 cancelPendingEvaluationWithRatchetIdentifier:v11 reason:v10 completion:v9];
}

uint64_t __89__LACDTOServiceXPCClient_cancelPendingEvaluationWithRatchetIdentifier_reason_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(LACDTOServiceXPCClient *)self _connectionWithErrorHandler:v4];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(LACDTOServiceXPCClient *)self _connectionWithErrorHandler:v4];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)_connectionWithErrorHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  os_unfair_lock_lock(&self->_connectionLock);
  if (self->_connection)
  {
    uint64_t v5 = 0;
  }
  else
  {
    endpointProvider = self->_endpointProvider;
    id v17 = 0;
    id v7 = [(LACDTOServiceXPCEndpointProvider *)endpointProvider endpoint:&v17];
    uint64_t v5 = (uint64_t)v17;
    if (v7)
    {
      id v8 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:v7];
      connection = self->_connection;
      self->_connection = v8;

      id v10 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270438FE0];
      [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v10];

      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __54__LACDTOServiceXPCClient__connectionWithErrorHandler___block_invoke;
      aBlock[3] = &unk_2653B59C8;
      objc_copyWeak(&v15, &location);
      id v11 = _Block_copy(aBlock);
      [(NSXPCConnection *)self->_connection setInvalidationHandler:v11];
      [(NSXPCConnection *)self->_connection setInterruptionHandler:v11];
      [(NSXPCConnection *)self->_connection resume];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }

    if (!((uint64_t)self->_connection | v5))
    {
      uint64_t v5 = +[LACError errorWithCode:-1000 debugDescription:@"XPC connection to LACDTOServiceXPC could not be created"];
    }
    if (v5) {
      v4[2](v4, v5);
    }
  }
  os_unfair_lock_unlock(&self->_connectionLock);
  id v12 = self->_connection;

  return v12;
}

void __54__LACDTOServiceXPCClient__connectionWithErrorHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionClose];
}

- (void)_handleConnectionClose
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_254F14000, log, OS_LOG_TYPE_ERROR, "XPC connection to LACDTOServiceXPC endpoint closed", v1, 2u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_endpointProvider, 0);
}

void __38__LACDTOServiceXPCClient_ratchetState__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "Could not get synchronous remote object proxy (%{public}@)", v2, v3, v4, v5, v6);
}

void __38__LACDTOServiceXPCClient_ratchetState__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "Could not fetch ratchet state (%{public}@)", v2, v3, v4, v5, v6);
}

void __42__LACDTOServiceXPCClient_isFeatureEnabled__block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "Could not fetch feature enabled status (%{public}@)", v2, v3, v4, v5, v6);
}

void __44__LACDTOServiceXPCClient_isFeatureSupported__block_invoke_7_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "Could not fetch feature supported status (%{public}@)", v2, v3, v4, v5, v6);
}

void __44__LACDTOServiceXPCClient_isFeatureAvailable__block_invoke_8_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "Could not fetch feature available status (%{public}@)", v2, v3, v4, v5, v6);
}

void __52__LACDTOServiceXPCClient_isFeatureStrictModeEnabled__block_invoke_9_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "Could not fetch feature strict mode status (%{public}@)", v2, v3, v4, v5, v6);
}

void __41__LACDTOServiceXPCClient_isSensorTrusted__block_invoke_10_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "Could not fetch sensor trust status (%{public}@)", v2, v3, v4, v5, v6);
}

@end