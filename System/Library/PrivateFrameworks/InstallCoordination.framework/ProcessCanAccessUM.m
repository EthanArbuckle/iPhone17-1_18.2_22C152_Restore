@interface ProcessCanAccessUM
@end

@implementation ProcessCanAccessUM

void ___ProcessCanAccessUM_block_invoke()
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v30 = 0;
  int v0 = _ClientProcessLookupMachPortName((uint64_t)"com.apple.mobile.usermanagerd.xpc", &v30);
  id v1 = v30;
  id v29 = 0;
  int v2 = _ClientProcessLookupMachPortName((uint64_t)"com.apple.mobile.keybagd.UserManager.xpc", &v29);
  id v3 = v29;
  *(void *)error = 0;
  v4 = SecTaskCreateFromSelf(0);
  if (!v4)
  {
    v11 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      ___ProcessCanAccessUM_block_invoke_cold_1();
    }

    v13 = _CreateError((uint64_t)"_ProcessHasUMEntitlement", 272, @"IXErrorDomain", 1uLL, 0, 0, @"SecTaskCreateFromSelf returned NULL when attempting to fetch UM entitlement", v12, v28);
    goto LABEL_14;
  }
  v5 = v4;
  v6 = (void *)SecTaskCopyValueForEntitlement(v4, @"com.apple.usermanagerd.persona.fetch", (CFErrorRef *)error);
  if (!v6)
  {
    v14 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      ___ProcessCanAccessUM_block_invoke_cold_2((void **)error);
    }

    v15 = *(void **)error;
    v13 = _CreateError((uint64_t)"_ProcessHasUMEntitlement", 278, @"IXErrorDomain", 1uLL, *(void **)error, 0, @"SecTaskCopyValueForEntitlement returned NULL when attempting to fetch the value for the entitlement \"com.apple.usermanagerd.persona.fetch\" in the current process.", v16, v28);

    CFRelease(v5);
LABEL_14:
    id v9 = v13;

    int v10 = 0;
    goto LABEL_15;
  }
  v7 = v6;
  int v8 = IXBooleanValue(v6, 0);

  if (v8)
  {
    CFRelease(v5);
    id v9 = 0;
    int v10 = 1;
    goto LABEL_15;
  }
  v17 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    ___ProcessCanAccessUM_block_invoke_cold_3();
  }

  int v10 = 1;
  v19 = _CreateError((uint64_t)"_ProcessHasUMEntitlement", 284, @"IXErrorDomain", 1uLL, 0, 0, @"Client process has a value other than true for the entitlement \"com.apple.usermanagerd.persona.fetch\".", v18, v28);

  CFRelease(v5);
  v13 = 0;
  id v9 = 0;
  if (!v19) {
    goto LABEL_14;
  }
LABEL_15:
  id v20 = v9;
  if (v0)
  {
    _ProcessCanAccessUM_canQueryUM = v2 & v10;
    if (v2 & v10) {
      goto LABEL_24;
    }
  }
  else
  {
    _ProcessCanAccessUM_canQueryUM = 0;
  }
  v21 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)error = 136316930;
    *(void *)&error[4] = "_ProcessCanAccessUM_block_invoke";
    __int16 v32 = 1024;
    if (v0) {
      uint64_t v22 = 89;
    }
    else {
      uint64_t v22 = 78;
    }
    int v33 = v22;
    if (v2) {
      int v26 = 89;
    }
    else {
      int v26 = 78;
    }
    __int16 v34 = 1024;
    if (v10) {
      int v27 = 89;
    }
    else {
      int v27 = 78;
    }
    int v35 = v26;
    __int16 v36 = 1024;
    int v37 = v27;
    __int16 v38 = 2112;
    id v39 = v1;
    __int16 v40 = 2112;
    id v41 = v3;
    __int16 v42 = 2112;
    id v43 = v20;
    __int16 v44 = 2112;
    uint64_t v45 = 0;
    _os_log_error_impl(&dword_1A7B2D000, v21, OS_LOG_TYPE_ERROR, "%s: This process can't access UM (mach-lookup com.apple.mobile.usermanagerd.xpc: %c, mach-lookup com.apple.mobile.keybagd.UserManager.xpc: %c, entitlement com.apple.usermanagerd.persona.fetch: %c): (%@, %@, %@) : %@", error, 0x46u);
  }
  else if (v0)
  {
    uint64_t v22 = 89;
  }
  else
  {
    uint64_t v22 = 78;
  }

  uint64_t v24 = _CreateError((uint64_t)"_ProcessCanAccessUM_block_invoke", 344, @"IXErrorDomain", 1uLL, 0, 0, @"This process can't access UM (mach-lookup com.apple.mobile.usermanagerd.xpc: %c, mach-lookup com.apple.mobile.keybagd.UserManager.xpc: %c, entitlement com.apple.usermanagerd.persona.fetch: %c): (%@, %@, %@)", v23, v22);
  v25 = (void *)_ProcessCanAccessUM_error;
  _ProcessCanAccessUM_error = v24;

LABEL_24:
}

void ___ProcessCanAccessUM_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: SecTaskCreateFromSelf returned NULL when attempting to fetch UM entitlement : %@", v2, v3, v4, v5, 2u);
}

void ___ProcessCanAccessUM_block_invoke_cold_2(void **a1)
{
  uint64_t v1 = *a1;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v2, v3, "%s: SecTaskCopyValueForEntitlement returned NULL when attempting to fetch the value for the entitlement \"com.apple.usermanagerd.persona.fetch\" in the current process. : %@", v4, v5, v6, v7, 2u);
}

void ___ProcessCanAccessUM_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Client process has a value other than true for the entitlement \"com.apple.usermanagerd.persona.fetch\". : %@", v2, v3, v4, v5, 2u);
}

@end