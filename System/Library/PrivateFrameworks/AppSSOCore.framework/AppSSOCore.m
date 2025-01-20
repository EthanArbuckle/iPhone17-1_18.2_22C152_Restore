BOOL appSSO_willHandle(uint64_t a1, uint64_t a2)
{
  uint64_t vars8;

  if (appSSO_init_onceToken != -1) {
    dispatch_once(&appSSO_init_onceToken, &__block_literal_global_8);
  }
  if (_useAppSSO != 1) {
    return 0;
  }
  return +[SOAuthorizationCore _canPerformAuthorizationWithURL:a1 responseCode:a2 callerBundleIdentifier:0 useInternalExtensions:0];
}

id SO_LOG_SOConfigurationClient()
{
  if (SO_LOG_SOConfigurationClient_once != -1) {
    dispatch_once(&SO_LOG_SOConfigurationClient_once, &__block_literal_global_30);
  }
  v0 = (void *)SO_LOG_SOConfigurationClient_log;
  return v0;
}

id SO_LOG_SOConfigurationVersion()
{
  if (SO_LOG_SOConfigurationVersion_once != -1) {
    dispatch_once(&SO_LOG_SOConfigurationVersion_once, &__block_literal_global_2);
  }
  v0 = (void *)SO_LOG_SOConfigurationVersion_log;
  return v0;
}

id SO_LOG_SOConfiguration()
{
  if (SO_LOG_SOConfiguration_once != -1) {
    dispatch_once(&SO_LOG_SOConfiguration_once, &__block_literal_global_9);
  }
  v0 = (void *)SO_LOG_SOConfiguration_log;
  return v0;
}

void sub_1D72087D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SO_LOG_SOServiceConnection()
{
  if (SO_LOG_SOServiceConnection_once != -1) {
    dispatch_once(&SO_LOG_SOServiceConnection_once, &__block_literal_global_100);
  }
  v0 = (void *)SO_LOG_SOServiceConnection_log;
  return v0;
}

void __appSSO_init_block_invoke()
{
  if (+[SOUtils isAppSSOServiceAvailable])
  {
    v0 = +[SOUtils currentProcessName];
    if ([&unk_1F2EB1D68 containsObject:v0])
    {
      v1 = SO_LOG_SOClientImpl();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
        __appSSO_init_block_invoke_cold_1();
      }
LABEL_5:

      _useAppSSO = 1;
      dispatch_queue_t v2 = dispatch_queue_create("com.apple.AppSSO.client-delegate-queue", MEMORY[0x1E4F14430]);
      v3 = (void *)_delegateQueue;
      _delegateQueue = (uint64_t)v2;

      uint64_t v4 = +[SOErrorHelper silentInternalErrorWithMessage:@"unexpected response from the extension - check type of the extension (redirect/credential)"];
      v5 = (void *)_unexpectedResponseError;
      _unexpectedResponseError = v4;

      uint64_t v6 = +[SOErrorHelper silentInternalErrorWithMessage:@"AppSSO not permitted"];
      v7 = (void *)_noAppSSOError;
      _noAppSSOError = v6;

      v8 = objc_alloc_init(SOAuthorizationPool);
      v9 = (void *)_authorizationPool;
      _authorizationPool = (uint64_t)v8;

      return;
    }
    if ([&unk_1F2EB1D80 containsObject:v0])
    {
      v10 = SO_LOG_SOClientImpl();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __appSSO_init_block_invoke_cold_2();
      }
    }
    else
    {
      v11 = +[SOUtils currentProcessContainerPath];

      if (v11)
      {
        if (!+[SOUtils currentProcessIsSandboxed]
          || +[SOUtils sandboxAllowsXPC:](SOUtils, "sandboxAllowsXPC:", [@"com.apple.AppSSO.service-xpc" UTF8String]))
        {
          v1 = SO_LOG_SOClientImpl();
          if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
            __appSSO_init_block_invoke_cold_4();
          }
          goto LABEL_5;
        }
        v10 = SO_LOG_SOClientImpl();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          __appSSO_init_block_invoke_cold_5();
        }
      }
      else
      {
        v10 = SO_LOG_SOClientImpl();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          __appSSO_init_block_invoke_cold_3();
        }
      }
    }
  }
  else
  {
    v0 = SO_LOG_SOClientImpl();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
      __appSSO_init_block_invoke_cold_6();
    }
  }

  _useAppSSO = 0;
}

id SO_LOG_SOClientImpl()
{
  if (SO_LOG_SOClientImpl_once != -1) {
    dispatch_once(&SO_LOG_SOClientImpl_once, &__block_literal_global_86);
  }
  v0 = (void *)SO_LOG_SOClientImpl_log;
  return v0;
}

void sub_1D7209358(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D7209E18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SO_LOG_SOUtils()
{
  if (SO_LOG_SOUtils_once != -1) {
    dispatch_once(&SO_LOG_SOUtils_once, &__block_literal_global_78);
  }
  v0 = (void *)SO_LOG_SOUtils_log;
  return v0;
}

void sub_1D720A53C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SO_LOG_SOClient()
{
  if (SO_LOG_SOClient_once != -1) {
    dispatch_once(&SO_LOG_SOClient_once, &__block_literal_global_94);
  }
  v0 = (void *)SO_LOG_SOClient_log;
  return v0;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

id SO_LOG_SOErrorHelper()
{
  if (SO_LOG_SOErrorHelper_once != -1) {
    dispatch_once(&SO_LOG_SOErrorHelper_once, &__block_literal_global_0);
  }
  v0 = (void *)SO_LOG_SOErrorHelper_log;
  return v0;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1D720CA04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D720CB78(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1D720E63C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D720E6B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D720E708(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _isStaticCodeSignedBy(const __SecCode *a1, uint64_t a2, uint64_t a3)
{
  CFErrorRef errors = 0;
  SecRequirementRef requirement = 0;
  CFStringRef v5 = @"anchor apple";
  switch(a2)
  {
    case 1:
      break;
    case 2:
      CFStringRef v5 = @"anchor apple generic and certificate leaf[field.1.2.840.113635.100.6.1.9] exists";
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_6;
    case 4:
      CFStringRef v5 = @"anchor apple generic and certificate leaf[field.1.2.840.113635.100.6.2.6] exists and certificate leaf[field.1.2.840.113635.100.6.1.13] exists";
      break;
    case 8:
      CFStringRef v5 = @"anchor apple generic and certificate leaf[field.1.2.840.113635.100.6.1.7] exists";
      break;
    default:
      if (a2 == 16)
      {
        CFStringRef v5 = @"anchor apple generic and certificate leaf[field.1.2.840.113635.100.6.1.4] exists";
      }
      else if (a2 == 32)
      {
        CFStringRef v5 = @"anchor apple generic and certificate leaf[field.1.2.840.113635.100.6.1.12] exists";
      }
      else
      {
LABEL_6:
        CFStringRef v5 = 0;
      }
      break;
  }
  if (SecRequirementCreateWithStringAndErrors(v5, 0, &errors, &requirement))
  {
    if (!a3) {
      goto LABEL_17;
    }
    [NSString stringWithFormat:@"SecRequirementCreateWithStringAndErros(%@) failed with %@", v5, errors];
    goto LABEL_13;
  }
  OSStatus v7 = SecStaticCodeCheckValidityWithErrors(a1, 0, requirement, &errors);
  if (v7)
  {
    if (v7 == -67050) {
      goto LABEL_16;
    }
    if (a3)
    {
      [NSString stringWithFormat:@"SecStaticCodeCheckValidityWithErrors() failed with %@", errors, v9];
      uint64_t v6 = LABEL_13:;
      *(void *)a3 = +[SOErrorHelper internalErrorWithMessage:v6];

LABEL_16:
      a3 = 0;
    }
  }
  else
  {
    a3 = 1;
  }
LABEL_17:
  if (requirement) {
    CFRelease(requirement);
  }
  if (errors) {
    CFRelease(errors);
  }
  return a3;
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_1D7210664(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D72107E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SO_LOG_SOFullProfile()
{
  if (SO_LOG_SOFullProfile_once != -1) {
    dispatch_once(&SO_LOG_SOFullProfile_once, &__block_literal_global_6);
  }
  v0 = (void *)SO_LOG_SOFullProfile_log;
  return v0;
}

id SO_LOG_SOAuthorizationCore()
{
  if (SO_LOG_SOAuthorizationCore_once != -1) {
    dispatch_once(&SO_LOG_SOAuthorizationCore_once, &__block_literal_global_134);
  }
  v0 = (void *)SO_LOG_SOAuthorizationCore_log;
  return v0;
}

void sub_1D7214CEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D72155D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7215894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void appSSO_init()
{
  if (appSSO_init_onceToken != -1) {
    dispatch_once(&appSSO_init_onceToken, &__block_literal_global_8);
  }
}

BOOL appSSO_willPerform(uint64_t a1, uint64_t a2)
{
  if (appSSO_init_onceToken != -1) {
    dispatch_once(&appSSO_init_onceToken, &__block_literal_global_8);
  }
  if (_useAppSSO != 1) {
    return 0;
  }
  return +[SOAuthorizationCore _canPerformAuthorizationWithURL:a1 responseCode:a2 callerBundleIdentifier:0 useInternalExtensions:0];
}

void appSSO_performResponse(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, void *a6)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  v12 = v11;
  if (_useAppSSO)
  {
    v13 = objc_alloc_init(SOAuthorizationParametersCore);
    [(SOAuthorizationParametersCore *)v13 setUrl:a1];
    [(SOAuthorizationParametersCore *)v13 setHttpHeaders:a2];
    [(SOAuthorizationParametersCore *)v13 setHttpBody:a3];
    [(SOAuthorizationParametersCore *)v13 setAuditTokenData:a5];
    [(SOAuthorizationParametersCore *)v13 setUseInternalExtensions:0];
    [(SOAuthorizationParametersCore *)v13 setResponseCode:0];
    [(SOAuthorizationParametersCore *)v13 setCfNetworkInterception:1];
    v14 = objc_alloc_init(SOAuthorizationCore);
    v15 = objc_alloc_init(SOAuthorizationResultClientImpl);
    [(SOAuthorizationResultClientImpl *)v15 setAuthorizationHandleResponseCompletion:v12];
    if (a4)
    {
      v17 = @"noUserInterface";
      v18[0] = MEMORY[0x1E4F1CC38];
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      [(SOAuthorizationCore *)v14 setAuthorizationOptions:v16];
    }
    else
    {
      [(SOAuthorizationCore *)v14 setAuthorizationOptions:MEMORY[0x1E4F1CC08]];
    }
    [(SOAuthorizationCore *)v14 setEnableUserInteraction:(a4 & 2) == 0];
    [(SOAuthorizationCore *)v14 setDelegate:v15];
    [(SOAuthorizationCore *)v14 setDelegateDispatchQueue:_delegateQueue];
    [(id)_authorizationPool addAuthorization:v14 delegate:v15];
    [(SOAuthorizationCore *)v14 beginAuthorizationWithParameters:v13];
  }
  else if (v11)
  {
    (*((void (**)(id, void, void, uint64_t))v11 + 2))(v11, 0, 0, _noAppSSOError);
  }
}

void appSSO_performResponseCredential(uint64_t a1, uint64_t a2, char a3, uint64_t a4, void *a5)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  uint64_t v10 = v9;
  if (_useAppSSO)
  {
    id v11 = objc_alloc_init(SOAuthorizationParametersCore);
    [(SOAuthorizationParametersCore *)v11 setUrl:a1];
    [(SOAuthorizationParametersCore *)v11 setHttpHeaders:a2];
    v12 = [MEMORY[0x1E4F1C9B8] data];
    [(SOAuthorizationParametersCore *)v11 setHttpBody:v12];

    [(SOAuthorizationParametersCore *)v11 setAuditTokenData:a4];
    [(SOAuthorizationParametersCore *)v11 setUseInternalExtensions:0];
    [(SOAuthorizationParametersCore *)v11 setResponseCode:401];
    [(SOAuthorizationParametersCore *)v11 setCfNetworkInterception:1];
    v13 = objc_alloc_init(SOAuthorizationCore);
    v14 = objc_alloc_init(SOAuthorizationResultClientImpl);
    [(SOAuthorizationResultClientImpl *)v14 setAuthorizationHandleCredentialCompletion:v10];
    if (a3)
    {
      v16 = @"noUserInterface";
      v17[0] = MEMORY[0x1E4F1CC38];
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      [(SOAuthorizationCore *)v13 setAuthorizationOptions:v15];
    }
    else
    {
      [(SOAuthorizationCore *)v13 setAuthorizationOptions:MEMORY[0x1E4F1CC08]];
    }
    [(SOAuthorizationCore *)v13 setEnableUserInteraction:(a3 & 2) == 0];
    [(SOAuthorizationCore *)v13 setDelegate:v14];
    [(SOAuthorizationCore *)v13 setDelegateDispatchQueue:_delegateQueue];
    [(id)_authorizationPool addAuthorization:v13 delegate:v14];
    [(SOAuthorizationCore *)v13 beginAuthorizationWithParameters:v11];
  }
  else if (v9)
  {
    (*((void (**)(id, void, uint64_t))v9 + 2))(v9, 0, _noAppSSOError);
  }
}

void appSSO_handleResponse(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, void *a6)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  v12 = v11;
  if (_useAppSSO)
  {
    v13 = objc_alloc_init(SOAuthorizationParametersCore);
    [(SOAuthorizationParametersCore *)v13 setUrl:a1];
    [(SOAuthorizationParametersCore *)v13 setHttpHeaders:a2];
    [(SOAuthorizationParametersCore *)v13 setHttpBody:a3];
    [(SOAuthorizationParametersCore *)v13 setAuditTokenData:a5];
    [(SOAuthorizationParametersCore *)v13 setUseInternalExtensions:0];
    [(SOAuthorizationParametersCore *)v13 setResponseCode:0];
    [(SOAuthorizationParametersCore *)v13 setCfNetworkInterception:1];
    v14 = objc_alloc_init(SOAuthorizationCore);
    v15 = objc_alloc_init(SOAuthorizationResultClientImpl);
    [(SOAuthorizationResultClientImpl *)v15 setAuthorizationHandleResponseCompletion:v12];
    if (a4)
    {
      v17 = @"noUserInterface";
      v18[0] = MEMORY[0x1E4F1CC38];
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      [(SOAuthorizationCore *)v14 setAuthorizationOptions:v16];
    }
    else
    {
      [(SOAuthorizationCore *)v14 setAuthorizationOptions:MEMORY[0x1E4F1CC08]];
    }
    [(SOAuthorizationCore *)v14 setEnableUserInteraction:(a4 & 2) == 0];
    [(SOAuthorizationCore *)v14 setDelegate:v15];
    [(SOAuthorizationCore *)v14 setDelegateDispatchQueue:_delegateQueue];
    [(id)_authorizationPool addAuthorization:v14 delegate:v15];
    [(SOAuthorizationCore *)v14 beginAuthorizationWithParameters:v13];
  }
  else if (v11)
  {
    (*((void (**)(id, void, void, uint64_t))v11 + 2))(v11, 0, 0, _noAppSSOError);
  }
}

void appSSO_handleResponseCredential(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, void *a7)
{
}

void appSSO_handleResponseImpersonationCredential(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, void *a8)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v15 = a8;
  v16 = (void (**)(void, void, void))v15;
  if (_useAppSSO)
  {
    if (a4 < 3)
    {
      v19 = objc_alloc_init(SOAuthorizationParametersCore);
      [(SOAuthorizationParametersCore *)v19 setUrl:a1];
      [(SOAuthorizationParametersCore *)v19 setHttpHeaders:a2];
      v20 = [MEMORY[0x1E4F1C9B8] data];
      [(SOAuthorizationParametersCore *)v19 setHttpBody:v20];

      [(SOAuthorizationParametersCore *)v19 setAuditTokenData:a6];
      [(SOAuthorizationParametersCore *)v19 setUseInternalExtensions:0];
      [(SOAuthorizationParametersCore *)v19 setResponseCode:a3];
      [(SOAuthorizationParametersCore *)v19 setCfNetworkInterception:1];
      [(SOAuthorizationParametersCore *)v19 setImpersonationBundleIdentifier:a7];
      v21 = objc_alloc_init(SOAuthorizationCore);
      v22 = objc_alloc_init(SOAuthorizationResultClientImpl);
      [(SOAuthorizationResultClientImpl *)v22 setAuthorizationHandleCredentialCompletion:v16];
      if (a5)
      {
        v24 = @"noUserInterface";
        v25[0] = MEMORY[0x1E4F1CC38];
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
        [(SOAuthorizationCore *)v21 setAuthorizationOptions:v23];
      }
      else
      {
        [(SOAuthorizationCore *)v21 setAuthorizationOptions:MEMORY[0x1E4F1CC08]];
      }
      [(SOAuthorizationCore *)v21 setEnableUserInteraction:(a5 & 2) == 0];
      [(SOAuthorizationCore *)v21 setDelegate:v22];
      [(SOAuthorizationCore *)v21 setDelegateDispatchQueue:_delegateQueue];
      [(id)_authorizationPool addAuthorization:v21 delegate:v22];
      [(SOAuthorizationCore *)v21 beginAuthorizationWithParameters:v19];
    }
    else
    {
      v17 = SO_LOG_SOClientImpl();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        appSSO_handleResponseImpersonationCredential_cold_1(v17);
      }

      if (v16)
      {
        id v18 = +[SOErrorHelper errorWithCode:-1];
LABEL_9:
        ((void (**)(void, void, id))v16)[2](v16, 0, v18);
      }
    }
  }
  else if (v15)
  {
    id v18 = (id)_noAppSSOError;
    goto LABEL_9;
  }
}

void __appSSO_init_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1D7206000, v0, v1, "is using AppSSO (allowList)", v2, v3, v4, v5, v6);
}

void __appSSO_init_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1D7206000, v0, v1, "not using AppSSO (denyList)", v2, v3, v4, v5, v6);
}

void __appSSO_init_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1D7206000, v0, v1, "not using AppSSO (no app container)", v2, v3, v4, v5, v6);
}

void __appSSO_init_block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1D7206000, v0, v1, "is using AppSSO", v2, v3, v4, v5, v6);
}

void __appSSO_init_block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1D7206000, v0, v1, "not using AppSSO (sandbox)", v2, v3, v4, v5, v6);
}

void __appSSO_init_block_invoke_cold_6()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1D7206000, v0, v1, "not using AppSSO (service not available)", v2, v3, v4, v5, v6);
}

void appSSO_handleResponseImpersonationCredential_cold_1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = 3;
  _os_log_error_impl(&dword_1D7206000, log, OS_LOG_TYPE_ERROR, "Authorization retry limit (%d) exceeded.", (uint8_t *)v1, 8u);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x1F41092C0]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

OSStatus SecCodeCopySigningInformation(SecStaticCodeRef code, SecCSFlags flags, CFDictionaryRef *information)
{
  return MEMORY[0x1F40F6D48](code, *(void *)&flags, information);
}

OSStatus SecRequirementCreateWithStringAndErrors(CFStringRef text, SecCSFlags flags, CFErrorRef *errors, SecRequirementRef *requirement)
{
  return MEMORY[0x1F40F7100](text, *(void *)&flags, errors, requirement);
}

OSStatus SecStaticCodeCheckValidityWithErrors(SecStaticCodeRef staticCode, SecCSFlags flags, SecRequirementRef requirement, CFErrorRef *errors)
{
  return MEMORY[0x1F40F7118](staticCode, *(void *)&flags, requirement, errors);
}

OSStatus SecStaticCodeCreateWithPath(CFURLRef path, SecCSFlags flags, SecStaticCodeRef *staticCode)
{
  return MEMORY[0x1F40F7120](path, *(void *)&flags, staticCode);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1F40F7128](task, error);
}

uint64_t SecTaskCopyTeamIdentifier()
{
  return MEMORY[0x1F40F7130]();
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1F40F7210](trust, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2E8](atoken);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1F40CA548](*(void *)&bp, service_name, sp);
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x1F40CA568](*(void *)&r);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD888](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

uint64_t sandbox_container_path_for_pid()
{
  return MEMORY[0x1F40CDDE8]();
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CDFE0](a1, *(void *)&a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE230](__s, *(void *)&__c);
}