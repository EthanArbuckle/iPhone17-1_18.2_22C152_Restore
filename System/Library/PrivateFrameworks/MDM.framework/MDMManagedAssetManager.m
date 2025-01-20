@interface MDMManagedAssetManager
+ (void)_promptUserForiTunesAccount:(id)a3 accountNameEditable:(BOOL)a4 canCreateNewAccount:(BOOL)a5 assertion:(id)a6 completionBlock:(id)a7;
+ (void)promptUserToLoginToiTunesIfNeededTitle:(id)a3 message:(id)a4 assertion:(id)a5 completionBlock:(id)a6;
@end

@implementation MDMManagedAssetManager

+ (void)promptUserToLoginToiTunesIfNeededTitle:(id)a3 message:(id)a4 assertion:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [MEMORY[0x263F7B0E8] defaultStore];
  v15 = [v14 activeAccount];

  if (v15)
  {
    if (v13)
    {
      v16 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __99__MDMManagedAssetManager_promptUserToLoginToiTunesIfNeededTitle_message_assertion_completionBlock___block_invoke;
      block[3] = &unk_264B9D0E8;
      id v27 = v13;
      id v26 = v12;
      dispatch_async(v16, block);

      v17 = v27;
LABEL_10:
    }
  }
  else
  {
    if (!+[MDMMCInterface isLimitedAppsMode])
    {
      v19 = (void *)MEMORY[0x263F38B30];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __99__MDMManagedAssetManager_promptUserToLoginToiTunesIfNeededTitle_message_assertion_completionBlock___block_invoke_3;
      v20[3] = &unk_264B9D680;
      id v22 = v13;
      id v23 = a1;
      id v21 = v12;
      [v19 promptUserToLogIntoiTunesWithTitle:v10 message:v11 assertion:v21 completion:v20];

      v17 = v22;
      goto LABEL_10;
    }
    v18 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230A49000, v18, OS_LOG_TYPE_ERROR, "Cannot prompt login to iTunes because device is in a limited apps mode", buf, 2u);
    }
    if (v13) {
      (*((void (**)(id, void))v13 + 2))(v13, 0);
    }
  }
}

uint64_t __99__MDMManagedAssetManager_promptUserToLoginToiTunesIfNeededTitle_message_assertion_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __99__MDMManagedAssetManager_promptUserToLoginToiTunesIfNeededTitle_message_assertion_completionBlock___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2)
  {
    v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      int v12 = a2;
      _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_ERROR, "User rejected app installation with response: %{public}u", buf, 8u);
    }
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __99__MDMManagedAssetManager_promptUserToLoginToiTunesIfNeededTitle_message_assertion_completionBlock___block_invoke_4;
    v8[3] = &unk_264B9D658;
    v7 = *(void **)(a1 + 48);
    id v10 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 32);
    [v7 _promptUserForiTunesAccount:0 accountNameEditable:1 canCreateNewAccount:1 assertion:v6 completionBlock:v8];
  }
}

void __99__MDMManagedAssetManager_promptUserToLoginToiTunesIfNeededTitle_message_assertion_completionBlock___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = *(NSObject **)(DMCLogObjects() + 8);
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      id v12 = v5;
      _os_log_impl(&dword_230A49000, v7, OS_LOG_TYPE_ERROR, "Login failed. Error: %{public}@", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      id v9 = *(void (**)(void))(v8 + 16);
LABEL_10:
      v9();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_230A49000, v7, OS_LOG_TYPE_DEFAULT, "Login successful.", (uint8_t *)&v11, 2u);
    }
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      id v9 = *(void (**)(void))(v10 + 16);
      goto LABEL_10;
    }
  }
}

+ (void)_promptUserForiTunesAccount:(id)a3 accountNameEditable:(BOOL)a4 canCreateNewAccount:(BOOL)a5 assertion:(id)a6 completionBlock:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a7;
  id v12 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v12;
    v14 = DMCStringForBool();
    *(_DWORD *)buf = 138543618;
    id v22 = v10;
    __int16 v23 = 2114;
    v24 = v14;
    _os_log_impl(&dword_230A49000, v13, OS_LOG_TYPE_DEFAULT, "Prompting user to log in to iTunes store using account: %{public}@. Can create new account: %{public}@.", buf, 0x16u);
  }
  if (v10)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x263F7B288]) initWithAccount:v10];
  }
  else
  {
    v15 = [MEMORY[0x263F7B288] contextForSignIn];
  }
  v16 = v15;
  [v15 setPromptStyle:0];
  [v16 setAccountNameEditable:v9];
  [v16 setCanCreateNewAccount:v8];
  v17 = +[MDMSSAuthenticationRequestDelegate instanceWithAuthenticationContext:v16];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __120__MDMManagedAssetManager__promptUserForiTunesAccount_accountNameEditable_canCreateNewAccount_assertion_completionBlock___block_invoke;
  v19[3] = &unk_264B9D6A8;
  id v20 = v11;
  id v18 = v11;
  [v17 startWithCompletionBlock:v19];
}

void __120__MDMManagedAssetManager__promptUserForiTunesAccount_accountNameEditable_canCreateNewAccount_assertion_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = *(NSObject **)(DMCLogObjects() + 8);
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = v7;
      BOOL v9 = [v5 DMCVerboseDescription];
      int v11 = 138543362;
      id v12 = v9;
      _os_log_impl(&dword_230A49000, v8, OS_LOG_TYPE_ERROR, "Log in request failed. Error: %{public}@", (uint8_t *)&v11, 0xCu);
    }
    id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v6;
      _os_log_impl(&dword_230A49000, v7, OS_LOG_TYPE_DEFAULT, "Log in successful. Account: %{public}@", (uint8_t *)&v11, 0xCu);
    }
    id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v10();
}

@end