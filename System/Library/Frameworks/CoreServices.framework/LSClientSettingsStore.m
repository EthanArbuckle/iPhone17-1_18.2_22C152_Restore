@interface LSClientSettingsStore
@end

@implementation LSClientSettingsStore

void __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  id v9 = 0;
  uint64_t v3 = objc_msgSend(v2, "__internalQueue_xpcConnectionWithError:", &v9);
  id v4 = v9;
  uint64_t v5 = *(void *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  uint64_t v7 = *(void *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v4;
}

void __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_219(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = _LSExtensionsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_219_cold_1();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

void __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _LSExtensionsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke_cold_1(v7, [v3 code], v4);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke_216(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a2);
  }
  else
  {
    uint64_t v8 = _LSExtensionsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke_cold_1(v9, [v7 code], v8);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

void __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke_218(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;
}

void __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _LSExtensionsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_2_cold_1();
  }
}

void __64___LSClientSettingsStore_setUserElection_forExtensionKey_error___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  id v9 = 0;
  uint64_t v3 = objc_msgSend(v2, "__internalQueue_xpcConnectionWithError:", &v9);
  id v4 = v9;
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  uint64_t v7 = *(void *)(a1[6] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v4;
}

void __64___LSClientSettingsStore_setUserElection_forExtensionKey_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _LSExtensionsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
}

void __64___LSClientSettingsStore_setUserElection_forExtensionKey_error___block_invoke_221(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = _LSExtensionsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_2_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    char v6 = 0;
  }
  else
  {
    char v6 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
}

void __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  id v9 = 0;
  uint64_t v3 = objc_msgSend(v2, "__internalQueue_xpcConnectionWithError:", &v9);
  id v4 = v9;
  uint64_t v5 = *(void *)(a1[5] + 8);
  char v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  uint64_t v7 = *(void *)(a1[6] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v4;
}

void __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _LSExtensionsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  char v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke_222(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = _LSExtensionsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke_2_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    char v6 = 0;
  }
  else
  {
    char v6 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
}

void __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke_cold_1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_fault_impl(&dword_182959000, log, OS_LOG_TYPE_FAULT, "Failed to get settings store from 'lsd' with error code: %ld", buf, 0xCu);
}

void __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_182959000, v0, v1, "Failed to set user election for key '%@' error: %@");
}

void __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_219_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_182959000, v0, v1, "Failed to retrieve user election for key '%@' error: %@");
}

void __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "Failed to reset user elections error: %@", v2, v3, v4, v5, v6);
}

@end