@interface CDPKeychainSync
+ (BOOL)isUserVisibleKeychainSyncEnabled;
+ (void)removeNonViewAwarePeersFromCircleWithContext:(id)a3 completion:(id)a4;
+ (void)setUserVisibleKeychainSyncEnabled:(BOOL)a3 withCompletion:(id)a4;
+ (void)synchronizeKeychainSyncForContext:(id)a3 withCompletion:(id)a4;
@end

@implementation CDPKeychainSync

+ (BOOL)isUserVisibleKeychainSyncEnabled
{
  v2 = _os_activity_create(&dword_2182AE000, "cdp: Keychain Status Check", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  v3 = objc_alloc_init(CDPDaemonConnection);
  v4 = [(CDPDaemonConnection *)v3 synchronousDaemonWithErrorHandler:&__block_literal_global_10];
  v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2182AE000, v5, OS_LOG_TYPE_DEFAULT, "Checking user-visible keychain sync status", buf, 2u);
  }

  *(void *)buf = 0;
  v10 = buf;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__CDPKeychainSync_isUserVisibleKeychainSyncEnabled__block_invoke_17;
  v8[3] = &unk_264317818;
  v8[4] = buf;
  [v4 isUserVisibleKeychainSyncEnabledWithCompletion:v8];
  v6 = [(CDPDaemonConnection *)v3 connection];
  [v6 invalidate];

  LOBYTE(v6) = v10[24];
  _Block_object_dispose(buf, 8);

  os_activity_scope_leave(&state);
  return (char)v6;
}

void __51__CDPKeychainSync_isUserVisibleKeychainSyncEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __51__CDPKeychainSync_isUserVisibleKeychainSyncEnabled__block_invoke_cold_1();
  }
}

void __51__CDPKeychainSync_isUserVisibleKeychainSyncEnabled__block_invoke_17(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = @"DISABLED";
    if (a2) {
      v5 = @"ENABLED";
    }
    int v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_2182AE000, v4, OS_LOG_TYPE_DEFAULT, "User-visible keychain sync status is %@", (uint8_t *)&v6, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

+ (void)setUserVisibleKeychainSyncEnabled:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = _os_activity_create(&dword_2182AE000, "cdp: Keychain Status Change", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  v7 = objc_alloc_init(CDPDaemonConnection);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __68__CDPKeychainSync_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke;
  v18[3] = &unk_264317090;
  id v8 = v5;
  id v19 = v8;
  v9 = [(CDPDaemonConnection *)v7 daemonWithErrorHandler:v18];
  v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = @"DISABLED";
    if (v4) {
      uint64_t v11 = @"ENABLED";
    }
    *(_DWORD *)buf = 138412290;
    v22 = v11;
    _os_log_impl(&dword_2182AE000, v10, OS_LOG_TYPE_DEFAULT, "Setting user-visible keychain sync to %@", buf, 0xCu);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__CDPKeychainSync_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_25;
  v14[3] = &unk_264317868;
  BOOL v17 = v4;
  id v12 = v8;
  id v16 = v12;
  v13 = v7;
  v15 = v13;
  [v9 setUserVisibleKeychainSyncEnabled:v4 withCompletion:v14];

  os_activity_scope_leave(&state);
}

void __68__CDPKeychainSync_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51__CDPKeychainSync_isUserVisibleKeychainSyncEnabled__block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __68__CDPKeychainSync_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_25(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = _CDPLogSystem();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 48)) {
        id v8 = @"ENABLED";
      }
      else {
        id v8 = @"DISABLED";
      }
      *(_DWORD *)buf = 138412290;
      BOOL v17 = v8;
      _os_log_impl(&dword_2182AE000, v7, OS_LOG_TYPE_DEFAULT, "User-visibile keychain sync set to %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __68__CDPKeychainSync_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_25_cold_1(a1, (uint64_t)v5, v7);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__CDPKeychainSync_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_26;
  v11[3] = &unk_264317840;
  id v9 = *(id *)(a1 + 40);
  char v15 = a2;
  id v14 = v9;
  id v12 = v5;
  id v13 = *(id *)(a1 + 32);
  id v10 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

void __68__CDPKeychainSync_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_26(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  id v3 = [*(id *)(a1 + 40) connection];
  [v3 invalidate];
}

+ (void)removeNonViewAwarePeersFromCircleWithContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = _os_activity_create(&dword_2182AE000, "cdp: Remove Legacy Peers", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = objc_alloc_init(CDPDaemonConnection);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke;
  v17[3] = &unk_264317090;
  id v9 = v6;
  id v18 = v9;
  id v10 = [(CDPDaemonConnection *)v8 daemonWithErrorHandler:v17];
  uint64_t v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    +[CDPKeychainSync removeNonViewAwarePeersFromCircleWithContext:completion:]();
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_29;
  v14[3] = &unk_264317890;
  id v12 = v9;
  id v16 = v12;
  id v13 = v8;
  char v15 = v13;
  [v10 removeNonViewAwarePeersFromCircleWithContext:v5 completion:v14];

  os_activity_scope_leave(&state);
}

void __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_29(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _CDPLogSystem();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_29_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_29_cold_2();
  }

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_30;
  v10[3] = &unk_264317840;
  id v8 = *(id *)(a1 + 40);
  char v14 = a2;
  id v13 = v8;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

void __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_30(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  id v3 = [*(id *)(a1 + 40) connection];
  [v3 invalidate];
}

+ (void)synchronizeKeychainSyncForContext:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = _os_activity_create(&dword_2182AE000, "cdp: Synchronize Keychain State", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = objc_alloc_init(CDPDaemonConnection);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke;
  v17[3] = &unk_264317090;
  id v9 = v6;
  id v18 = v9;
  id v10 = [(CDPDaemonConnection *)v8 daemonWithErrorHandler:v17];
  id v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    +[CDPKeychainSync removeNonViewAwarePeersFromCircleWithContext:completion:]();
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke_31;
  v14[3] = &unk_264317890;
  id v12 = v9;
  id v16 = v12;
  id v13 = v8;
  char v15 = v13;
  [v10 synchronizeUserVisibleKeychainSyncEligibilityForContext:v5 completion:v14];

  os_activity_scope_leave(&state);
}

void __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke_31(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _CDPLogSystem();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke_31_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke_31_cold_2();
  }

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke_32;
  v10[3] = &unk_264317840;
  id v8 = *(id *)(a1 + 40);
  char v14 = a2;
  id v13 = v8;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

void __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke_32(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  id v3 = [*(id *)(a1 + 40) connection];
  [v3 invalidate];
}

void __51__CDPKeychainSync_isUserVisibleKeychainSyncEnabled__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC Error while checking if user-visible keychain sync is enabled: %@", v2, v3, v4, v5, v6);
}

void __68__CDPKeychainSync_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_25_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = @"ENABLED";
  if (!*(unsigned char *)(a1 + 48)) {
    uint64_t v3 = @"DISABLED";
  }
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_2182AE000, log, OS_LOG_TYPE_ERROR, "Failed to set user-visibile keychain sync set to %@: %@", (uint8_t *)&v4, 0x16u);
}

+ (void)removeNonViewAwarePeersFromCircleWithContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Removing non-view-aware peers from the circle", v2, v3, v4, v5, v6);
}

void __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC Error while remove non-view-aware peers: %@", v2, v3, v4, v5, v6);
}

void __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_29_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Successfully removed non-view-aware peers from the circle", v2, v3, v4, v5, v6);
}

void __75__CDPKeychainSync_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_29_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to remove non-view-aware peers from the circle: %@", v2, v3, v4, v5, v6);
}

void __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "XPC Error while synchronizing keychain state: %@", v2, v3, v4, v5, v6);
}

void __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke_31_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Successfully synchronized keychain state", v2, v3, v4, v5, v6);
}

void __68__CDPKeychainSync_synchronizeKeychainSyncForContext_withCompletion___block_invoke_31_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Failed to synchronize keychain state with error: %@", v2, v3, v4, v5, v6);
}

@end