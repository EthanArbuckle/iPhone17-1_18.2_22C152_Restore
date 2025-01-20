@interface LSDefaults
@end

@implementation LSDefaults

void __37___LSDefaults_preferredLocalizations__block_invoke_2()
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v0 = [v2 preferredLocalizations];
  v1 = (void *)preferredLocalizations_bundleLocalizations;
  preferredLocalizations_bundleLocalizations = v0;
}

void __37___LSDefaults_preferredLocalizations__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v0 objectForInfoDictionaryKey:@"CFBundleAllowMixedLocalizations"];

  v1 = v4;
  if (v4)
  {
    char v2 = objc_opt_respondsToSelector();
    v1 = v4;
    if (v2)
    {
      char v3 = [v4 BOOLValue];
      v1 = v4;
      preferredLocalizations_useUserLangList = v3;
    }
  }
}

uint64_t __45___LSDefaults_proxyUIDForCurrentEffectiveUID__block_invoke(uint64_t a1)
{
  if (getuid() || (uint64_t result = [*(id *)(a1 + 32) isInXCTestRigInsecure], result))
  {
    uint64_t result = _CFGetEUID();
    proxyUIDForCurrentEffectiveUID_euid = result;
    proxyUIDForCurrentEffectiveUID_hasEUID = 1;
  }
  return result;
}

void __48___LSDefaults_markLocalizationsStoredInDatabase__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isAppleInternal])
  {
    id v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    markLocalizationsStoredInDatabase_uint64_t result = [v1 BOOLForKey:@"LSMarkLocalizationsStoredInDatabase"];
  }
}

id __33___LSDefaults_systemContainerURL__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 75))
  {
    id v1 = _LSDefaultsBaseSystemContainerURL();
    char v2 = [v1 URLByAppendingPathComponent:@"Library/Caches" isDirectory:1];

    if (v2)
    {
      char v3 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v3 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:0 error:0];
    }
  }
  else
  {
    emitSandboxExceptionAndMaybeAbortForSneakyURLUsage();
    char v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/"];
  }

  return v2;
}

id __31___LSDefaults_userContainerURL__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 75))
  {
    emitSandboxExceptionAndMaybeAbortForSneakyURLUsage();
    v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/"];
    goto LABEL_24;
  }
  if (!container_query_create()) {
    goto LABEL_33;
  }
  container_query_set_class();
  container_query_set_persona_unique_string();
  container_query_operation_set_flags();
  if (!container_query_get_single_result())
  {
    container_query_get_last_error();
    v25 = (void *)container_error_copy_unlocalized_description();
    v26 = _LSDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      __31___LSDefaults_userContainerURL__block_invoke_cold_2((uint64_t)v25, v26, v27, v28, v29, v30, v31, v32);
    }

    free(v25);
    goto LABEL_33;
  }
  uint64_t path = container_get_path();
  char v2 = _LSDefaultLog();
  char v3 = v2;
  if (!path)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __31___LSDefaults_userContainerURL__block_invoke_cold_3(v3, v33, v34, v35, v36, v37, v38, v39);
    }

LABEL_33:
    container_query_free();
    goto LABEL_34;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __31___LSDefaults_userContainerURL__block_invoke_cold_8(path, v3);
  }

  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithFileSystemRepresentation:path isDirectory:1 relativeToURL:0];
  v5 = [v4 URLByAppendingPathComponent:@"Library/Caches" isDirectory:1];

  uint64_t v6 = container_copy_sandbox_token();
  if (v6)
  {
    v7 = (void *)v6;
    uint64_t v8 = sandbox_extension_consume();
    if (v8 < 0)
    {
      int v19 = *__error();
      v10 = _LSDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __31___LSDefaults_userContainerURL__block_invoke_cold_7(v19, v10);
      }
    }
    else
    {
      uint64_t v9 = v8;
      v10 = _LSDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __31___LSDefaults_userContainerURL__block_invoke_cold_6(v9, v10);
      }
    }

    free(v7);
  }
  else
  {
    v11 = _LSDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __31___LSDefaults_userContainerURL__block_invoke_cold_5(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  container_query_free();
  if (!v5)
  {
LABEL_34:
    v40 = _LSDefaultLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      __31___LSDefaults_userContainerURL__block_invoke_cold_1(v40);
    }

    abort();
  }
  v20 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v41 = 0;
  char v21 = [v20 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v41];
  id v22 = v41;

  if ((v21 & 1) == 0)
  {
    v23 = _LSDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __31___LSDefaults_userContainerURL__block_invoke_cold_4((uint64_t)v22, v23);
    }
  }
LABEL_24:

  return v5;
}

id __38___LSDefaults_systemGroupContainerURL__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 75))
  {
    uint64_t v7 = 1;
    uint64_t v1 = container_system_group_path_for_identifier();
    if (v1)
    {
      char v2 = (void *)v1;
      char v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithFileSystemRepresentation:v1 isDirectory:1 relativeToURL:0];
      v4 = [v3 URLByAppendingPathComponent:@"Library/Caches" isDirectory:1];

      free(v2);
    }
    else
    {
      v5 = _LSDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __38___LSDefaults_systemGroupContainerURL__block_invoke_cold_1(&v7, v5);
      }

      v4 = 0;
    }
  }
  else
  {
    emitSandboxExceptionAndMaybeAbortForSneakyURLUsage();
    v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/"];
  }

  return v4;
}

void __31___LSDefaults_simulatorRootURL__block_invoke()
{
  uint64_t v0 = getenv("SIMULATOR_ROOT");
  if (v0)
  {
    uint64_t v1 = [objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithFileSystemRepresentation:v0 isDirectory:1 relativeToURL:0];
    char v2 = (void *)simulatorRootURL_result;
    simulatorRootURL_uint64_t result = v1;
  }
}

void __38___LSDefaults_simulatorRuntimeVersion__block_invoke()
{
  uint64_t v0 = getenv("SIMULATOR_RUNTIME_VERSION");
  if (v0)
  {
    uint64_t v1 = [NSString stringWithUTF8String:v0];
    char v2 = (void *)simulatorRuntimeVersion_result;
    simulatorRuntimeVersion_uint64_t result = v1;
  }
}

void __43___LSDefaults_simulatorRuntimeBuildVersion__block_invoke()
{
  uint64_t v0 = getenv("SIMULATOR_RUNTIME_BUILD_VERSION");
  if (v0)
  {
    uint64_t v1 = [NSString stringWithUTF8String:v0];
    char v2 = (void *)simulatorRuntimeBuildVersion_result;
    simulatorRuntimeBuildVersion_uint64_t result = v1;
  }
}

const char *__41___LSDefaults_classesWithNameForXCTests___block_invoke(uint64_t a1, Class cls)
{
  uint64_t result = class_getName(cls);
  if (result)
  {
    Name = class_getName(cls);
    uint64_t result = (const char *)strcmp(Name, *(const char **)(a1 + 40));
    if (!result) {
      return (const char *)(id)[*(id *)(a1 + 32) setByAddingObject:cls];
    }
  }
  return result;
}

void __42___LSDefaults_alwaysUseDebugOpenWithMenus__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isAppleInternal])
  {
    id v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    alwaysUseDebugOpenWithMenus_uint64_t result = [v1 BOOLForKey:@"LSAlwaysUseDebugOpenWithMenus"];
  }
}

void __28___LSDefaults_isRegionChina__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x18530F680]();
  id v1 = (void *)MGCopyAnswer();
  char v2 = v1;
  if (v1)
  {
    BOOL v3 = [v1 caseInsensitiveCompare:@"CH"] == 0;
    isRegionChina_uint64_t result = v3;
    if (v3) {
      goto LABEL_9;
    }
  }
  else if (isRegionChina_result)
  {
    goto LABEL_9;
  }
  if (__LSDefaultsGetSharedInstance_onceToken != -1) {
    dispatch_once(&__LSDefaultsGetSharedInstance_onceToken, &__block_literal_global_27);
  }
  if ([(id)__LSDefaultsGetSharedInstance_sharedInstance isAppleInternal])
  {
    v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    isRegionChina_uint64_t result = [v4 BOOLForKey:@"LSLocalizeLikeChina"];
  }
LABEL_9:
}

id __25___LSDefaults_HMACSecret__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], 0x20uLL, bytes);
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:bytes length:32];

  return v0;
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "Could not get user container URL! Must abort.", v1, 2u);
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_4(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136446466;
  uint64_t v3 = "NSURL *_LSDefaultsUserContainerURL(void)";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "%{public}s: NSFileManager failed to create user container URL directory: %{public}@", (uint8_t *)&v2, 0x16u);
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_6(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136446466;
  uint64_t v3 = "NSURL *_LSDefaultsUserContainerURL(void)";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_182959000, a2, OS_LOG_TYPE_DEBUG, "%{public}s: consumed sandbox token for container, handle = %llu", (uint8_t *)&v2, 0x16u);
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_7(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136446466;
  uint64_t v3 = "NSURL *_LSDefaultsUserContainerURL(void)";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "%{public}s: Failed to consume container sandbox token, errno = %{darwin.errno}d", (uint8_t *)&v2, 0x12u);
}

void __31___LSDefaults_userContainerURL__block_invoke_cold_8(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136446467;
  uint64_t v3 = "NSURL *_LSDefaultsUserContainerURL(void)";
  __int16 v4 = 2081;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_182959000, a2, OS_LOG_TYPE_DEBUG, "%{public}s: got user container URL %{private}s from containermanagerd", (uint8_t *)&v2, 0x16u);
}

void __38___LSDefaults_systemGroupContainerURL__block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 136446722;
  uint64_t v5 = "NSURL *_LSDefaultsSystemGroupContainerURL(void)";
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  __int16 v8 = 2082;
  uint64_t error_description = container_get_error_description();
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "%{public}s: error %llu getting container path: %{public}s", (uint8_t *)&v4, 0x20u);
}

@end