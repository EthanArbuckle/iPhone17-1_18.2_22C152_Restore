@interface AAUICDPRecoveryKeyHook
+ (id)helperWithPresenter:(id)a3 forceInline:(BOOL)a4;
- (BOOL)_shouldMatchAction:(id)a3;
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (void)_deleteRecoveryKey:(id)a3;
- (void)_generateRecoveryKeyWithType:(int64_t)a3 attributes:(id)a4 completion:(id)a5;
- (void)_verifyRecoveryKeyWithType:(int64_t)a3 attributes:(id)a4 completion:(id)a5;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation AAUICDPRecoveryKeyHook

- (BOOL)shouldMatchElement:(id)a3
{
  v4 = [a3 name];
  LOBYTE(self) = [(AAUICDPRecoveryKeyHook *)self _shouldMatchAction:v4];

  return (char)self;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 clientInfo];

  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F63818]];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  BOOL v8 = [(AAUICDPRecoveryKeyHook *)self _shouldMatchAction:v7];
  return v8;
}

- (BOOL)_shouldMatchAction:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"rk:regenerate"] & 1) != 0
    || ([v3 isEqualToString:@"rk:enable"] & 1) != 0
    || ([v3 isEqualToString:@"rk:disable"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"rk:verify"];
  }

  return v4;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v19 = a3;
  id v9 = a4;
  id v10 = a6;
  v11 = [v19 name];
  int v12 = [v11 isEqualToString:@"rk:regenerate"];

  if (v12)
  {
    v13 = self;
    uint64_t v14 = 4;
LABEL_5:
    [(AAUICDPRecoveryKeyHook *)v13 _generateRecoveryKeyWithType:v14 attributes:v9 completion:v10];
    goto LABEL_6;
  }
  v15 = [v19 name];
  int v16 = [v15 isEqualToString:@"rk:enable"];

  if (v16)
  {
    v13 = self;
    uint64_t v14 = 5;
    goto LABEL_5;
  }
  v17 = [v19 name];
  int v18 = [v17 isEqualToString:@"rk:disable"];

  if (v18) {
    [(AAUICDPRecoveryKeyHook *)self _deleteRecoveryKey:v10];
  }
LABEL_6:
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  objc_opt_class();
  id v7 = [v13 clientInfo];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F63818]];
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  if ([v9 isEqualToString:@"rk:regenerate"])
  {
    id v10 = [v13 clientInfo];
    v11 = self;
    uint64_t v12 = 4;
LABEL_8:
    [(AAUICDPRecoveryKeyHook *)v11 _generateRecoveryKeyWithType:v12 attributes:v10 completion:v6];
LABEL_9:

    goto LABEL_10;
  }
  if ([v9 isEqualToString:@"rk:enable"])
  {
    id v10 = [v13 clientInfo];
    v11 = self;
    uint64_t v12 = 5;
    goto LABEL_8;
  }
  if ([v9 isEqualToString:@"rk:verify"])
  {
    id v10 = [v13 clientInfo];
    [(AAUICDPRecoveryKeyHook *)self _verifyRecoveryKeyWithType:8 attributes:v10 completion:v6];
    goto LABEL_9;
  }
  if ([v9 isEqualToString:@"rk:disable"]) {
    [(AAUICDPRecoveryKeyHook *)self _deleteRecoveryKey:v6];
  }
LABEL_10:
}

- (void)_deleteRecoveryKey:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F343F0]);
  v5 = +[AAUICDPHelper cdpContextForPrimaryAccount];
  id v6 = (void *)[v4 initWithContext:v5];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__AAUICDPRecoveryKeyHook__deleteRecoveryKey___block_invoke;
  v8[3] = &unk_263F92B30;
  id v9 = v3;
  id v7 = v3;
  [v6 deleteRecoveryKey:v8];
}

void __45__AAUICDPRecoveryKeyHook__deleteRecoveryKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __45__AAUICDPRecoveryKeyHook__deleteRecoveryKey___block_invoke_cold_1();
    }
  }
  else
  {
    if (!a2) {
      goto LABEL_7;
    }
    id v6 = objc_alloc_init(MEMORY[0x263F257E8]);
    [v6 startHealthCheckWithCompletion:&__block_literal_global_6];
  }

LABEL_7:
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

void __45__AAUICDPRecoveryKeyHook__deleteRecoveryKey___block_invoke_49(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _AAUILogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __115__AAUIRecoveryFactorController__handleRecoveryKeyOperationResultWithSuccess_error_operationDescription_completion___block_invoke_cold_1();
    }
  }
}

- (void)_generateRecoveryKeyWithType:(int64_t)a3 attributes:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = _AAUILogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to generate recovery key", buf, 2u);
  }

  objc_opt_class();
  id v11 = [v8 objectForKeyedSubscript:*MEMORY[0x263F63828]];
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  *(void *)buf = 0;
  v23 = buf;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  id v13 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v15 = [WeakRetained presentationContextForHook:self];
  objc_msgSend(v13, "helperWithPresenter:forceInline:", v15, objc_msgSend(v12, "BOOLValue"));
  id v27 = (id)objc_claimAutoreleasedReturnValue();

  int v16 = [*((id *)v23 + 5) cdpStateControllerForPrimaryAccount];
  v17 = [v16 context];
  [v17 setType:a3];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __77__AAUICDPRecoveryKeyHook__generateRecoveryKeyWithType_attributes_completion___block_invoke;
  v19[3] = &unk_263F92C28;
  id v18 = v9;
  id v20 = v18;
  v21 = buf;
  [v16 generateNewRecoveryKey:v19];

  _Block_object_dispose(buf, 8);
}

void __77__AAUICDPRecoveryKeyHook__generateRecoveryKeyWithType_attributes_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __77__AAUICDPRecoveryKeyHook__generateRecoveryKeyWithType_attributes_completion___block_invoke_cold_1();
    }
  }
  else
  {
    if (!a2) {
      goto LABEL_7;
    }
    id v6 = objc_alloc_init(MEMORY[0x263F257E8]);
    [v6 startHealthCheckWithCompletion:&__block_literal_global_54];
  }

LABEL_7:
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

void __77__AAUICDPRecoveryKeyHook__generateRecoveryKeyWithType_attributes_completion___block_invoke_52(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _AAUILogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __115__AAUIRecoveryFactorController__handleRecoveryKeyOperationResultWithSuccess_error_operationDescription_completion___block_invoke_cold_1();
    }
  }
}

- (void)_verifyRecoveryKeyWithType:(int64_t)a3 attributes:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = _AAUILogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to verify recovery key", buf, 2u);
  }

  objc_opt_class();
  id v11 = [v8 objectForKeyedSubscript:*MEMORY[0x263F63828]];
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  *(void *)buf = 0;
  id v27 = buf;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__3;
  v30 = __Block_byref_object_dispose__3;
  id v13 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v15 = [WeakRetained presentationContextForHook:self];
  objc_msgSend(v13, "helperWithPresenter:forceInline:", v15, objc_msgSend(v12, "BOOLValue"));
  id v31 = (id)objc_claimAutoreleasedReturnValue();

  int v16 = [*((id *)v27 + 5) cdpStateControllerForPrimaryAccount];
  id v25 = 0;
  LOBYTE(v15) = [v16 isRecoveryKeyAvailableWithError:&v25];
  id v17 = v25;
  if (v15)
  {
    id v18 = [v16 context];
    [v18 setType:a3];

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __75__AAUICDPRecoveryKeyHook__verifyRecoveryKeyWithType_attributes_completion___block_invoke;
    v20[3] = &unk_263F92C50;
    v20[4] = self;
    id v21 = v8;
    id v22 = v9;
    v23 = buf;
    [v16 verifyRecoveryKey:v20];
  }
  else
  {
    id v19 = _AAUILogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_209754000, v19, OS_LOG_TYPE_DEFAULT, "Recovery key missing - returning early, nothing to verify", v24, 2u);
    }

    if (!v17)
    {
      id v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F342B0] code:-5211 userInfo:0];
    }
    (*((void (**)(id, void, id))v9 + 2))(v9, 0, v17);
  }

  _Block_object_dispose(buf, 8);
}

void __75__AAUICDPRecoveryKeyHook__verifyRecoveryKeyWithType_attributes_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109378;
    v11[1] = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "_verifyRecoveryKeyWithType completed with: %d, %@", (uint8_t *)v11, 0x12u);
  }

  if (objc_msgSend(v5, "cdp_isCDPErrorWithCode:", -5308))
  {
    uint64_t v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "User reported forgot recovery key in verify recovery flow - will attempt to generate a recovery key", (uint8_t *)v11, 2u);
    }

    [*(id *)(a1 + 32) _generateRecoveryKeyWithType:4 attributes:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
}

+ (id)helperWithPresenter:(id)a3 forceInline:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [NSNumber numberWithBool:v4];
    int v11 = 138412290;
    __int16 v12 = v7;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "creating controller with inline forced: %@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v8 = +[AAUICDPHelper helperWithPresenter:v5];
  if (v4)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  [v8 setForceInline:isKindOfClass & 1];

  return v8;
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
}

void __45__AAUICDPRecoveryKeyHook__deleteRecoveryKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Error deleting the recovery key: %@", v2, v3, v4, v5, v6);
}

void __77__AAUICDPRecoveryKeyHook__generateRecoveryKeyWithType_attributes_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Error generating recovery key: %@", v2, v3, v4, v5, v6);
}

@end