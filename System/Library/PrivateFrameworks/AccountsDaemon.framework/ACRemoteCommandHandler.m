@interface ACRemoteCommandHandler
- (ACRemoteCommandHandler)init;
- (void)_addAccount:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)_authenticateAccount:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)_deleteAccount:(id)a3 withCompletion:(id)a4;
- (void)_fetchAccountsWithCompletion:(id)a3 options:(id)a4;
- (void)_invalidateFetchedAccountsCacheWithCompletion:(id)a3;
- (void)_promptUserForAccountCredential:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)_removeAllAccountsWithCompletion:(id)a3;
- (void)_saveAccount:(id)a3 completion:(id)a4;
- (void)_updateAccount:(id)a3 withCompletion:(id)a4;
- (void)handleCommand:(id)a3 forAccount:(id)a4 options:(id)a5 completion:(id)a6;
@end

@implementation ACRemoteCommandHandler

- (ACRemoteCommandHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACRemoteCommandHandler;
  v2 = [(ACRemoteCommandHandler *)&v6 init];
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x263EFB210]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;
  }
  return v2;
}

- (void)handleCommand:(id)a3 forAccount:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = _ACLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ACRemoteCommandHandler handleCommand:forAccount:options:completion:]();
  }

  if ([v10 isEqualToString:*MEMORY[0x263EFB178]])
  {
    [(ACRemoteCommandHandler *)self _addAccount:v11 withOptions:v12 completion:v13];
  }
  else if ([v10 isEqualToString:*MEMORY[0x263EFB1A8]])
  {
    [(ACRemoteCommandHandler *)self _updateAccount:v11 withCompletion:v13];
  }
  else if ([v10 isEqualToString:*MEMORY[0x263EFB1A0]])
  {
    [(ACRemoteCommandHandler *)self _promptUserForAccountCredential:v11 withOptions:v12 completion:v13];
  }
  else if ([v10 isEqualToString:*MEMORY[0x263EFB180]])
  {
    [(ACRemoteCommandHandler *)self _deleteAccount:v11 withCompletion:v13];
  }
  else if ([v10 isEqualToString:*MEMORY[0x263EFB1B0]])
  {
    [(ACRemoteCommandHandler *)self _authenticateAccount:v11 withOptions:v12 completion:v13];
  }
  else if ([v10 isEqualToString:*MEMORY[0x263EFB188]])
  {
    [(ACRemoteCommandHandler *)self _removeAllAccountsWithCompletion:v13];
  }
  else if ([v10 isEqualToString:*MEMORY[0x263EFB190]])
  {
    [(ACRemoteCommandHandler *)self _fetchAccountsWithCompletion:v13 options:v12];
  }
  else if ([v10 isEqualToString:*MEMORY[0x263EFB198]])
  {
    [(ACRemoteCommandHandler *)self _invalidateFetchedAccountsCacheWithCompletion:v13];
  }
}

- (void)_removeAllAccountsWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, void, void, void))a3 + 2))(a3, 0, 0, 0);
  }
}

- (void)_addAccount:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, void, void, void))a5 + 2))(a5, 0, 0, 0);
  }
}

- (void)_saveAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accountStore = self->_accountStore;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__ACRemoteCommandHandler__saveAccount_completion___block_invoke;
  v11[3] = &unk_2643209D0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(ACAccountStore *)accountStore saveVerifiedAccount:v10 withCompletionHandler:v11];
}

void __50__ACRemoteCommandHandler__saveAccount_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = _ACLogSystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __50__ACRemoteCommandHandler__saveAccount_completion___block_invoke_cold_1(a1, v7);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __50__ACRemoteCommandHandler__saveAccount_completion___block_invoke_cold_2((uint64_t)v5, v7);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, void, id))(v8 + 16))(v8, a2, 0, v5);
  }
}

- (void)_updateAccount:(id)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, void, void))a4 + 2))(a4, 0, 0, 0);
  }
}

- (void)_authenticateAccount:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, void, void, void))a5 + 2))(a5, 0, 0, 0);
  }
}

- (void)_promptUserForAccountCredential:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _ACLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ACRemoteCommandHandler _promptUserForAccountCredential:withOptions:completion:]();
  }

  id v12 = +[ACRemoteUtilities localAccountMatchingRemoteAccount:v8 inAccountStore:self->_accountStore];
  if (v12)
  {
    id v13 = (id)[v9 mutableCopy];
    if (!v13) {
      id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    [v13 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263EFB398]];
    accountStore = self->_accountStore;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __81__ACRemoteCommandHandler__promptUserForAccountCredential_withOptions_completion___block_invoke;
    v16[3] = &unk_2643209F8;
    id v18 = v10;
    id v17 = v12;
    [(ACAccountStore *)accountStore renewCredentialsForAccount:v17 options:v13 completion:v16];

    goto LABEL_11;
  }
  v15 = _ACLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[ACRemoteCommandHandler _promptUserForAccountCredential:withOptions:completion:](v15);
  }

  if (v10)
  {
    id v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:6 userInfo:0];
    (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v13);
LABEL_11:
  }
}

void __81__ACRemoteCommandHandler__promptUserForAccountCredential_withOptions_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _ACLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [NSNumber numberWithInteger:a2];
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_2183AD000, v6, OS_LOG_TYPE_DEFAULT, "\"Renewal completed with result: %@. Error: %@\"", (uint8_t *)&v12, 0x16u);
  }
  if (*(void *)(a1 + 40))
  {
    id v8 = [*(id *)(a1 + 32) credential];
    id v9 = [v8 credentialItemForKey:*MEMORY[0x263EFB170]];

    if (!v9)
    {
      id v10 = [*(id *)(a1 + 32) credential];
      id v9 = [v10 credentialItemForKey:*MEMORY[0x263EFB0F8]];
    }
    (*(void (**)(void, BOOL, void *, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2 == 0, v9, v5);
  }
  id v11 = _ACLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    __81__ACRemoteCommandHandler__promptUserForAccountCredential_withOptions_completion___block_invoke_cold_1();
  }
}

- (void)_deleteAccount:(id)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, void, void))a4 + 2))(a4, 0, 0, 0);
  }
}

- (void)_fetchAccountsWithCompletion:(id)a3 options:(id)a4
{
  id v6 = (void (**)(id, uint64_t, void *, void))a3;
  id v7 = a4;
  id v8 = _ACLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ACRemoteCommandHandler _fetchAccountsWithCompletion:options:]();
  }

  accountStore = self->_accountStore;
  id v10 = [v7 objectForKeyedSubscript:*MEMORY[0x263EFB1C8]];

  id v11 = [(ACAccountStore *)accountStore accountsWithAccountTypeIdentifiers:0 preloadedProperties:v10 error:0];

  if (v6) {
    v6[2](v6, 1, v11, 0);
  }
}

- (void)_invalidateFetchedAccountsCacheWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = _ACLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[ACRemoteCommandHandler _invalidateFetchedAccountsCacheWithCompletion:]();
  }

  id v5 = +[ACDPairedDeviceAccountCache sharedInstance];
  [v5 invalidate];

  if (v3) {
    (*((void (**)(id, uint64_t, void, void))v3 + 2))(v3, 1, 0, 0);
  }
  id v6 = _ACLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ACRemoteCommandHandler _invalidateFetchedAccountsCacheWithCompletion:]();
  }
}

- (void).cxx_destruct
{
}

- (void)handleCommand:forAccount:options:completion:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136381443;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_2183AD000, v2, OS_LOG_TYPE_DEBUG, "%{private}s:%{public}d called (%@, %@)", (uint8_t *)v3, 0x26u);
}

void __50__ACRemoteCommandHandler__saveAccount_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_2183AD000, a2, OS_LOG_TYPE_DEBUG, "\"Saved verified account %@\"", (uint8_t *)&v3, 0xCu);
}

void __50__ACRemoteCommandHandler__saveAccount_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2183AD000, a2, OS_LOG_TYPE_ERROR, "\"Save verified account failed: %@\"", (uint8_t *)&v2, 0xCu);
}

- (void)_promptUserForAccountCredential:(os_log_t)log withOptions:completion:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2183AD000, log, OS_LOG_TYPE_ERROR, "\"Couldn't find matching account\"", v1, 2u);
}

- (void)_promptUserForAccountCredential:withOptions:completion:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136381187;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_2183AD000, v0, OS_LOG_TYPE_DEBUG, "%{private}s:%{public}d called (%@)", (uint8_t *)v1, 0x1Cu);
}

void __81__ACRemoteCommandHandler__promptUserForAccountCredential_withOptions_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2183AD000, v0, v1, "%{private}s:%{public}d is returning", v2, v3, v4, v5, 3u);
}

- (void)_fetchAccountsWithCompletion:options:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
}

- (void)_invalidateFetchedAccountsCacheWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2183AD000, v0, v1, "%{private}s:%{public}d is returning", v2, v3, v4, v5, 3u);
}

- (void)_invalidateFetchedAccountsCacheWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
}

@end