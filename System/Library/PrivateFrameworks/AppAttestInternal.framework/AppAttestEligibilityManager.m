@interface AppAttestEligibilityManager
- (BOOL)isEligibleApplicationExtensionFor:(id *)a3;
- (BOOL)isEligibleApplicationFor:(id *)a3;
- (BOOL)isEligibleDaemonFor:(id *)a3;
- (NSArray)allowlistedDaemons;
- (NSArray)allowlistedExtensions;
- (id)fetchBundleRecordFor:(id *)a3;
- (void)setAllowlistedDaemons:(id)a3;
- (void)setAllowlistedExtensions:(id)a3;
@end

@implementation AppAttestEligibilityManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowlistedExtensions, 0);
  objc_storeStrong((id *)&self->_allowlistedDaemons, 0);
}

- (BOOL)isEligibleApplicationFor:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  v8[0] = *(_OWORD *)a3->var0;
  v8[1] = v3;
  v4 = [(AppAttestEligibilityManager *)self fetchBundleRecordFor:v8];
  if (v4)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    v6 = _DCAALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[AppAttestEligibilityManager isEligibleApplicationFor:]();
    }

    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)fetchBundleRecordFor:(id *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  long long v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v5;
  SecTaskRef v6 = SecTaskCreateWithAuditToken(v4, &token);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __52__AppAttestEligibilityManager_fetchBundleRecordFor___block_invoke;
  v16[3] = &__block_descriptor_40_e5_v8__0l;
  v16[4] = v6;
  v7 = (void (**)(void))MEMORY[0x223C94D20](v16);
  id v15 = 0;
  long long v8 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v8;
  v9 = [MEMORY[0x263F01890] bundleRecordForAuditToken:&token error:&v15];
  id v10 = v15;
  if (v10)
  {
    v11 = _DCAALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = [v10 localizedDescription];
      [(AppAttestEligibilityManager *)v12 fetchBundleRecordFor:v11];
    }
LABEL_4:

    id v13 = 0;
    goto LABEL_7;
  }
  if (!v9)
  {
    v11 = _DCAALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[AppAttestEligibilityManager fetchBundleRecordFor:]();
    }
    goto LABEL_4;
  }
  id v13 = v9;
LABEL_7:

  v7[2](v7);
  return v13;
}

void __52__AppAttestEligibilityManager_fetchBundleRecordFor___block_invoke(uint64_t a1)
{
  v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

- (NSArray)allowlistedDaemons
{
  allowlistedDaemons = self->_allowlistedDaemons;
  if (!allowlistedDaemons)
  {
    CFAllocatorRef v4 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.DeviceCheck"];
    if ([v4 BOOLForKey:@"addTestDaemonToAllowlist"])
    {
      long long v5 = [&unk_26D48E1C8 arrayByAddingObject:@"com.apple.dctestd"];
    }
    else
    {
      long long v5 = &unk_26D48E1C8;
    }
    SecTaskRef v6 = (NSArray *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v5];
    v7 = self->_allowlistedDaemons;
    self->_allowlistedDaemons = v6;

    allowlistedDaemons = self->_allowlistedDaemons;
  }
  return allowlistedDaemons;
}

- (NSArray)allowlistedExtensions
{
  allowlistedExtensions = self->_allowlistedExtensions;
  if (!allowlistedExtensions)
  {
    CFAllocatorRef v4 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.DeviceCheck"];
    if ([v4 BOOLForKey:@"addTestExtensionToAllowlist"])
    {
      long long v5 = [&unk_26D48E1E0 arrayByAddingObject:@"com.apple.DCAppContainer.Extension"];
    }
    else
    {
      long long v5 = &unk_26D48E1E0;
    }
    SecTaskRef v6 = (NSArray *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v5];
    v7 = self->_allowlistedExtensions;
    self->_allowlistedExtensions = v6;

    allowlistedExtensions = self->_allowlistedExtensions;
  }
  return allowlistedExtensions;
}

- (BOOL)isEligibleApplicationExtensionFor:(id *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v5;
  SecTaskRef v6 = [(AppAttestEligibilityManager *)self fetchBundleRecordFor:&token];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      long long v9 = *(_OWORD *)&a3->var0[4];
      *(_OWORD *)token.val = *(_OWORD *)a3->var0;
      *(_OWORD *)&token.val[4] = v9;
      id v10 = SecTaskCreateWithAuditToken(v8, &token);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __65__AppAttestEligibilityManager_isEligibleApplicationExtensionFor___block_invoke;
      v27[3] = &__block_descriptor_40_e5_v8__0l;
      v27[4] = v10;
      v11 = (void (**)(void))MEMORY[0x223C94D20](v27);
      v25[4] = 0;
      CFErrorRef error = 0;
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __65__AppAttestEligibilityManager_isEligibleApplicationExtensionFor___block_invoke_2;
      v25[3] = &__block_descriptor_40_e5_v8__0l;
      v12 = (void (**)(void))MEMORY[0x223C94D20](v25);
      id v13 = (void *)SecTaskCopyValueForEntitlement(v10, @"com.apple.devicecheck.extension-client", &error);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __65__AppAttestEligibilityManager_isEligibleApplicationExtensionFor___block_invoke_3;
      v24[3] = &__block_descriptor_40_e5_v8__0l;
      v24[4] = v13;
      v14 = (void (**)(void))MEMORY[0x223C94D20](v24);
      if (error)
      {
        id v15 = _DCAALogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v16 = [(__CFError *)error localizedDescription];
          [(AppAttestEligibilityManager *)v16 isEligibleApplicationExtensionFor:v15];
        }
      }
      else
      {
        if ([v13 intValue] == 1)
        {
          uint64_t v18 = [v7 teamIdentifier];
          char v19 = [(id)v18 isEqualToString:@"0000000000"];

          uint64_t v20 = [v7 bundleIdentifier];
          LOBYTE(v18) = [(id)v20 hasPrefix:@"com.apple."];

          v21 = [(AppAttestEligibilityManager *)self allowlistedExtensions];
          v22 = [v7 bundleIdentifier];
          LOBYTE(v20) = [v21 containsObject:v22];

          char v17 = v19 & v18 & v20;
LABEL_17:
          v14[2](v14);

          v12[2](v12);
          v11[2](v11);

          goto LABEL_18;
        }
        id v15 = _DCAALogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[AppAttestEligibilityManager isEligibleApplicationExtensionFor:]();
        }
      }

      char v17 = 0;
      goto LABEL_17;
    }
    v7 = _DCAALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[AppAttestEligibilityManager isEligibleApplicationExtensionFor:].cold.4();
    }
  }
  else
  {
    v7 = _DCAALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[AppAttestEligibilityManager isEligibleApplicationExtensionFor:]();
    }
  }
  char v17 = 0;
LABEL_18:

  return v17;
}

void __65__AppAttestEligibilityManager_isEligibleApplicationExtensionFor___block_invoke(uint64_t a1)
{
  v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

void __65__AppAttestEligibilityManager_isEligibleApplicationExtensionFor___block_invoke_2(uint64_t a1)
{
  v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

void __65__AppAttestEligibilityManager_isEligibleApplicationExtensionFor___block_invoke_3(uint64_t a1)
{
  v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

- (BOOL)isEligibleDaemonFor:(id *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  long long v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v5;
  SecTaskRef v6 = SecTaskCreateWithAuditToken(v4, &token);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __51__AppAttestEligibilityManager_isEligibleDaemonFor___block_invoke;
  v23[3] = &__block_descriptor_40_e5_v8__0l;
  v23[4] = v6;
  v7 = (void (**)(void))MEMORY[0x223C94D20](v23);
  v21[4] = 0;
  CFErrorRef error = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __51__AppAttestEligibilityManager_isEligibleDaemonFor___block_invoke_2;
  v21[3] = &__block_descriptor_40_e5_v8__0l;
  CFAllocatorRef v8 = (void (**)(void))MEMORY[0x223C94D20](v21);
  long long v9 = (void *)SecTaskCopyValueForEntitlement(v6, @"com.apple.devicecheck.daemon-client", &error);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __51__AppAttestEligibilityManager_isEligibleDaemonFor___block_invoke_3;
  v20[3] = &__block_descriptor_40_e5_v8__0l;
  v20[4] = v9;
  id v10 = (void (**)(void))MEMORY[0x223C94D20](v20);
  if (error)
  {
    uint64_t v11 = _DCAALogSystem();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = [(__CFError *)error localizedDescription];
      [(AppAttestEligibilityManager *)v12 isEligibleDaemonFor:v11];
    }
LABEL_11:
    LOBYTE(v16) = 0;
    goto LABEL_12;
  }
  if ([v9 intValue] != 1)
  {
    uint64_t v11 = _DCAALogSystem();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG)) {
      -[AppAttestEligibilityManager isEligibleDaemonFor:].cold.4();
    }
    goto LABEL_11;
  }
  id v13 = (void *)SecTaskCopyValueForEntitlement(v6, @"application-identifier", &error);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __51__AppAttestEligibilityManager_isEligibleDaemonFor___block_invoke_47;
  v19[3] = &__block_descriptor_40_e5_v8__0l;
  v19[4] = v13;
  uint64_t v11 = MEMORY[0x223C94D20](v19);
  if (v13)
  {
    v14 = v13;
    id v15 = [(AppAttestEligibilityManager *)self allowlistedDaemons];
    int v16 = [v15 containsObject:v14];

    if (v16)
    {
      char v17 = _DCAALogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[AppAttestEligibilityManager isEligibleDaemonFor:]((uint64_t)v14, v17);
      }
    }
    else
    {
      char v17 = _DCAALogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[AppAttestEligibilityManager isEligibleDaemonFor:]((uint64_t)v14, v17);
      }
    }
  }
  else
  {
    v14 = _DCAALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[AppAttestEligibilityManager isEligibleDaemonFor:]();
    }
    LOBYTE(v16) = 0;
  }

  (*(void (**)(uint64_t))(v11 + 16))(v11);
LABEL_12:

  v10[2](v10);
  v8[2](v8);

  v7[2](v7);
  return v16;
}

void __51__AppAttestEligibilityManager_isEligibleDaemonFor___block_invoke(uint64_t a1)
{
  v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

void __51__AppAttestEligibilityManager_isEligibleDaemonFor___block_invoke_2(uint64_t a1)
{
  v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

void __51__AppAttestEligibilityManager_isEligibleDaemonFor___block_invoke_3(uint64_t a1)
{
  v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

void __51__AppAttestEligibilityManager_isEligibleDaemonFor___block_invoke_47(uint64_t a1)
{
  v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

- (void)setAllowlistedDaemons:(id)a3
{
}

- (void)setAllowlistedExtensions:(id)a3
{
}

- (void)isEligibleApplicationFor:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Failed to fetch bundle record, ineligible application.", v2, v3, v4, v5, v6);
}

- (void)isEligibleApplicationExtensionFor:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Failed to fetch bundle record, ineligible application extension.", v2, v3, v4, v5, v6);
}

- (void)isEligibleApplicationExtensionFor:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Extension client entitlement not set.", v2, v3, v4, v5, v6);
}

- (void)isEligibleApplicationExtensionFor:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2_0(&dword_22216A000, a2, a3, "Failed to fetch extension entitlement. { error=%@ }", (uint8_t *)a2);
}

- (void)isEligibleApplicationExtensionFor:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Bundle record is not of application extension type.", v2, v3, v4, v5, v6);
}

- (void)isEligibleDaemonFor:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Daemon client is missing application identifier entitlement.", v2, v3, v4, v5, v6);
}

- (void)isEligibleDaemonFor:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22216A000, a2, OS_LOG_TYPE_DEBUG, "Daemon client connection is eligible client. { daemon=%@ }", (uint8_t *)&v2, 0xCu);
}

- (void)isEligibleDaemonFor:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22216A000, a2, OS_LOG_TYPE_DEBUG, "Daemon client connection is not eligible client. { daemon=%@ }", (uint8_t *)&v2, 0xCu);
}

- (void)isEligibleDaemonFor:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Daemon client entitlement not set.", v2, v3, v4, v5, v6);
}

- (void)isEligibleDaemonFor:(NSObject *)a3 .cold.5(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2_0(&dword_22216A000, a2, a3, "Failed to fetch daemon entitlement. { error=%@ }", (uint8_t *)a2);
}

- (void)fetchBundleRecordFor:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22216A000, v0, v1, "Failed to construct bundle record from audit token.", v2, v3, v4, v5, v6);
}

- (void)fetchBundleRecordFor:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2_0(&dword_22216A000, a2, a3, "Failed to fetch bundle record. { error=%@ }", (uint8_t *)a2);
}

@end