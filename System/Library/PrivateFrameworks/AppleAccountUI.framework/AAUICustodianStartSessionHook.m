@interface AAUICustodianStartSessionHook
- (AAUICustodianStartSessionHook)initWithTelemetryFlowID:(id)a3;
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (void)_startSessionWithServerAttributes:(id)a3 completion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation AAUICustodianStartSessionHook

- (AAUICustodianStartSessionHook)initWithTelemetryFlowID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUICustodianStartSessionHook;
  v6 = [(AAUICustodianStartSessionHook *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_telemetryFlowID, a3);
  }

  return v7;
}

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"custodian:startSession"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  char v4 = [v3 objectForKey:@"action"];
  char v5 = [v4 isEqualToString:@"custodian:startSession"];

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 clientInfo];
  [(AAUICustodianStartSessionHook *)self _startSessionWithServerAttributes:v7 completion:v6];
}

- (void)_startSessionWithServerAttributes:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"appleId"];
  objc_super v9 = [v6 objectForKeyedSubscript:@"sessionId"];
  if ([v8 length] && objc_msgSend(v9, "length"))
  {
    v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "Starting custodian recovery session for Apple ID: %@, Session ID: %@", buf, 0x16u);
    }

    id v11 = objc_alloc_init(MEMORY[0x263F257F8]);
    [v11 setOwnerAppleID:v8];
    [v11 setRecoverySessionID:v9];
    v12 = [MEMORY[0x263F202A8] analyticsEventWithName:@"com.apple.appleAccount.recoveryContactRecoveryLanding" altDSID:0 flowID:self->_telemetryFlowID];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v23 = __Block_byref_object_copy__5;
    v24 = __Block_byref_object_dispose__5;
    id v25 = objc_alloc_init(MEMORY[0x263F257E8]);
    v13 = *(void **)(*(void *)&buf[8] + 40);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __78__AAUICustodianStartSessionHook__startSessionWithServerAttributes_completion___block_invoke;
    v16[3] = &unk_263F92FE0;
    id v14 = v12;
    id v17 = v14;
    id v18 = v9;
    id v20 = v7;
    id v19 = v8;
    v21 = buf;
    [v13 startCustodianRecoveryWithContext:v11 completion:v16];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v15 = _AAUILogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[AAUICustodianStartSessionHook _startSessionWithServerAttributes:completion:]((uint64_t)v8, (uint64_t)v9, v15);
    }

    id v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F25638] code:-7008 userInfo:0];
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v11);
  }
}

void __78__AAUICustodianStartSessionHook__startSessionWithServerAttributes_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 length])
  {
    [*(id *)(a1 + 32) setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F20330]];
    id v7 = [MEMORY[0x263F25780] reporter];
    [v7 sendEvent:*(void *)(a1 + 32)];

    v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __78__AAUICustodianStartSessionHook__startSessionWithServerAttributes_completion___block_invoke_cold_1(a1, (uint64_t)v6, v8);
    }

    uint64_t v9 = *(void *)(a1 + 56);
    if (v6)
    {
      (*(void (**)(void, void, id))(v9 + 16))(*(void *)(a1 + 56), 0, v6);
    }
    else
    {
      id v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F25638] code:-9004 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v14);
    }
  }
  else
  {
    v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      int v17 = 138412802;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "Custodian recovery session started for Apple ID: %@, Session ID: %@, IDMS Session ID: %@", (uint8_t *)&v17, 0x20u);
    }

    [*(id *)(a1 + 32) setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F20330]];
    v13 = [MEMORY[0x263F25780] reporter];
    [v13 sendEvent:*(void *)(a1 + 32)];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = 0;
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
}

- (void)_startSessionWithServerAttributes:(NSObject *)a3 completion:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_2(&dword_209754000, a2, a3, "Unable to start recovery session, server missing Apple ID (%@) or Session ID (%@)", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __78__AAUICustodianStartSessionHook__startSessionWithServerAttributes_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_2(&dword_209754000, a2, a3, "Failed to start custodian recovery session (%@) with error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end