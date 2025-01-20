@interface AAUIPrivateEmailUpdateCacheHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (void)_removePrivateEmailKey:(id)a3 withCompletion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation AAUIPrivateEmailUpdateCacheHook

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = [a4 objectForKeyedSubscript:@"privateEmailKey"];
  [(AAUIPrivateEmailUpdateCacheHook *)self _removePrivateEmailKey:v9 withCompletion:v8];
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [a3 clientInfo];
  id v8 = [v7 objectForKeyedSubscript:@"privateEmailKey"];

  [(AAUIPrivateEmailUpdateCacheHook *)self _removePrivateEmailKey:v8 withCompletion:v6];
}

- (void)_removePrivateEmailKey:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F29240]);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__AAUIPrivateEmailUpdateCacheHook__removePrivateEmailKey_withCompletion___block_invoke;
  v10[3] = &unk_263F92DC8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 removePrivateEmailKey:v9 completion:v10];
}

void __73__AAUIPrivateEmailUpdateCacheHook__removePrivateEmailKey_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = _AAUILogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __73__AAUIPrivateEmailUpdateCacheHook__removePrivateEmailKey_withCompletion___block_invoke_cold_1(a1, (uint64_t)v3, v5);
    }

    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      id v7 = *(void (**)(void))(v6 + 16);
LABEL_10:
      v7();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "private email remove for key %@ is success", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      id v7 = *(void (**)(void))(v9 + 16);
      goto LABEL_10;
    }
  }
}

- (BOOL)shouldMatchElement:(id)a3
{
  id v3 = [a3 name];
  char v4 = [@"action:hideMyEmailUpdateCache" isEqualToString:v3];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v3 = [a3 clientInfo];
  char v4 = [v3 objectForKeyedSubscript:@"action"];
  char v5 = [@"action:hideMyEmailUpdateCache" isEqualToString:v4];

  return v5;
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

void __73__AAUIPrivateEmailUpdateCacheHook__removePrivateEmailKey_withCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "private email remove for key %@ failed with error %@", (uint8_t *)&v4, 0x16u);
}

@end