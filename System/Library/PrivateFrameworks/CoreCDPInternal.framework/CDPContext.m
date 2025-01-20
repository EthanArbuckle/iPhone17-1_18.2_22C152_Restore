@interface CDPContext
@end

@implementation CDPContext

void __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Renew request completed! Error: %@", (uint8_t *)&v16, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v9 = [v5 passwordEquivToken];

    if (v9)
    {
      v10 = _CDPLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke_cold_2(v10);
      }

      v11 = [v5 passwordEquivToken];
      [WeakRetained setPasswordEquivToken:v11];
    }
  }
  int v12 = objc_msgSend(MEMORY[0x263F34350], "isSubsetOfContextTypeSignIn:", objc_msgSend(*(id *)(a1 + 32), "type"));
  if (v6 && v12 && [MEMORY[0x263F34400] isAudioAccessory])
  {
    v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke_cold_1();
    }
  }
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14)
  {
    v15 = [v5 passwordEquivToken];
    (*(void (**)(uint64_t, BOOL, id))(v14 + 16))(v14, v15 != 0, v6);
  }
}

void __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5
    && ([v5 objectForKeyedSubscript:*MEMORY[0x263F28FF0]],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Silent re-authentication succeeded", v14, 2u);
    }

    [*(id *)(a1 + 32) updateWithAuthenticationResults:v5];
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      v10 = *(void (**)(void))(v9 + 16);
LABEL_16:
      v10();
    }
  }
  else
  {
    v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke_19_cold_2();
    }

    if (objc_msgSend(MEMORY[0x263F34350], "isSubsetOfContextTypeSignIn:", objc_msgSend(*(id *)(a1 + 32), "type"))&& objc_msgSend(MEMORY[0x263F34400], "isAudioAccessory"))
    {
      int v12 = _CDPLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke_19_cold_1();
      }
    }
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13)
    {
      v10 = *(void (**)(void))(v13 + 16);
      goto LABEL_16;
    }
  }
}

void __58__CDPContext_Daemon__refreshWithSilentAuthWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (v5)
  {
    [WeakRetained updateWithAuthenticationResults:v5];
    uint64_t v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __58__CDPContext_Daemon__refreshWithSilentAuthWithCompletion___block_invoke_cold_2((uint64_t)v8, v9);
    }

    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      v11 = *(void (**)(void))(v10 + 16);
LABEL_10:
      v11();
    }
  }
  else
  {
    int v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __58__CDPContext_Daemon__refreshWithSilentAuthWithCompletion___block_invoke_cold_1((uint64_t)v6, v12);
    }

    uint64_t v13 = *(void *)(a1 + 32);
    if (v13)
    {
      v11 = *(void (**)(void))(v13 + 16);
      goto LABEL_10;
    }
  }
}

void __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_218640000, v0, OS_LOG_TYPE_FAULT, "CDP Reauthentication on HomePod failed. Error: %@", v1, 0xCu);
}

void __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "Silently re-fetched recovery token", v1, 2u);
}

void __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke_19_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_218640000, v0, OS_LOG_TYPE_FAULT, "CDP Reauth on HomePod failed. Error: %@", v1, 0xCu);
}

void __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke_19_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_218640000, v0, OS_LOG_TYPE_ERROR, "Silent re-authentication failed: %@", v1, 0xCu);
}

void __58__CDPContext_Daemon__refreshWithSilentAuthWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218640000, a2, OS_LOG_TYPE_ERROR, "EDP: Failed to perform silent authentication for repair with error %@", (uint8_t *)&v2, 0xCu);
}

void __58__CDPContext_Daemon__refreshWithSilentAuthWithCompletion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "EDP: Silent auth refresh succeeded. Refreshed context:%@", (uint8_t *)&v2, 0xCu);
}

@end