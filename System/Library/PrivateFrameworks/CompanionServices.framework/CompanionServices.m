void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return objc_opt_class();
}

id CPSErrorGetCustomAuthenticationMethod(void *a1)
{
  v1 = [a1 userInfo];
  v2 = objc_msgSend(v1, "bs_safeStringForKey:", @"CPSCustomAuthenticationMethodErrorKey");

  return v2;
}

uint64_t CPSErrorGetCancellationReason(void *a1)
{
  v1 = [a1 userInfo];
  v2 = objc_msgSend(v1, "bs_safeNumberForKey:", @"CPSCancellationReasonErrorKey");
  uint64_t v3 = [v2 integerValue];

  return v3;
}

id CPSErrorMake(uint64_t a1, void *a2)
{
  return CPSErrorUnderlyingMake(a1, 0, a2);
}

id CPSErrorUnderlyingMake(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = [MEMORY[0x263EFF9A0] dictionary];
    [v8 setObject:v5 forKeyedSubscript:*MEMORY[0x263F08608]];
    if (!v7) {
      goto LABEL_8;
    }
    if (v8) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v6)
  {
LABEL_6:
    v8 = [MEMORY[0x263EFF9A0] dictionary];
LABEL_7:
    [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x263F07F80]];
    goto LABEL_8;
  }
  v8 = 0;
LABEL_8:
  v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.CompanionServices.CPSErrorDomain" code:a1 userInfo:v8];

  return v9;
}

id CPSErrorMultipleUnderlyingMake(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    v7 = [MEMORY[0x263EFF9A0] dictionary];
    [v7 setObject:v5 forKeyedSubscript:*MEMORY[0x263F083F0]];
    if (!v6) {
      goto LABEL_8;
    }
    if (v7) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v6)
  {
LABEL_6:
    v7 = [MEMORY[0x263EFF9A0] dictionary];
LABEL_7:
    [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x263F07F80]];
    goto LABEL_8;
  }
  v7 = 0;
LABEL_8:
  v8 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.CompanionServices.CPSErrorDomain" code:a1 userInfo:v7];

  return v8;
}

id cps_daemon_log()
{
  if (DaemonLog_token != -1) {
    dispatch_once(&DaemonLog_token, &__block_literal_global);
  }
  uint64_t v0 = (void *)DaemonLog_log;
  return v0;
}

id cps_service_log()
{
  if (ServiceLog_token != -1) {
    dispatch_once(&ServiceLog_token, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)ServiceLog_log;
  return v0;
}

id cps_session_log()
{
  if (SessionLog_token != -1) {
    dispatch_once(&SessionLog_token, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)SessionLog_log;
  return v0;
}

id cps_service_connection_log()
{
  if (ServiceConnectionLog_token != -1) {
    dispatch_once(&ServiceConnectionLog_token, &__block_literal_global_10);
  }
  uint64_t v0 = (void *)ServiceConnectionLog_log;
  return v0;
}

id cps_service_listener_log()
{
  if (ServiceListenerLog_token != -1) {
    dispatch_once(&ServiceListenerLog_token, &__block_literal_global_13);
  }
  uint64_t v0 = (void *)ServiceListenerLog_log;
  return v0;
}

id cps_signpost_log()
{
  if (SignpostLog_token != -1) {
    dispatch_once(&SignpostLog_token, &__block_literal_global_16);
  }
  uint64_t v0 = (void *)SignpostLog_log;
  return v0;
}

uint64_t __DaemonLog_block_invoke()
{
  DaemonLog_log = (uint64_t)os_log_create("com.apple.CompanionServices", "Daemon");
  return MEMORY[0x270F9A758]();
}

uint64_t __ServiceLog_block_invoke()
{
  ServiceLog_log = (uint64_t)os_log_create("com.apple.CompanionServices", "Service");
  return MEMORY[0x270F9A758]();
}

uint64_t __SessionLog_block_invoke()
{
  SessionLog_log = (uint64_t)os_log_create("com.apple.CompanionServices", "Session");
  return MEMORY[0x270F9A758]();
}

uint64_t __ServiceConnectionLog_block_invoke()
{
  ServiceConnectionLog_log = (uint64_t)os_log_create("com.apple.CompanionServices", "ServiceConnection");
  return MEMORY[0x270F9A758]();
}

uint64_t __ServiceListenerLog_block_invoke()
{
  ServiceListenerLog_log = (uint64_t)os_log_create("com.apple.CompanionServices", "ServiceListener");
  return MEMORY[0x270F9A758]();
}

uint64_t __SignpostLog_block_invoke()
{
  SignpostLog_log = (uint64_t)os_log_create("com.apple.CompanionServices", "Signpost");
  return MEMORY[0x270F9A758]();
}

id ClientSessionLog()
{
  if (ClientSessionLog_token != -1) {
    dispatch_once(&ClientSessionLog_token, &__block_literal_global_0);
  }
  uint64_t v0 = (void *)ClientSessionLog_log;
  return v0;
}

uint64_t __ClientSessionLog_block_invoke()
{
  ClientSessionLog_log = (uint64_t)os_log_create("com.apple.CompanionServices", "ClientSession");
  return MEMORY[0x270F9A758]();
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_24A68B02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getASAuthorizationAppleIDRequestClass_block_invoke(uint64_t a1)
{
  AuthenticationServicesLibrary();
  Class result = objc_getClass("ASAuthorizationAppleIDRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getASAuthorizationAppleIDRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getASAuthorizationAppleIDRequestClass_block_invoke_cold_1();
    return (Class)AuthenticationServicesLibrary();
  }
  return result;
}

uint64_t AuthenticationServicesLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AuthenticationServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __AuthenticationServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_26528A1C0;
    uint64_t v5 = 0;
    AuthenticationServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = AuthenticationServicesLibraryCore_frameworkLibrary;
  v1 = (void *)v3[0];
  if (!AuthenticationServicesLibraryCore_frameworkLibrary)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __AuthenticationServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AuthenticationServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getASAuthorizationScopeEmailSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AuthenticationServicesLibrary();
  uint64_t result = dlsym(v2, "ASAuthorizationScopeEmail");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getASAuthorizationScopeEmailSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getASAuthorizationScopeFullNameSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AuthenticationServicesLibrary();
  uint64_t result = dlsym(v2, "ASAuthorizationScopeFullName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getASAuthorizationScopeFullNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getASAuthorizationPasswordRequestClass_block_invoke(uint64_t a1)
{
  AuthenticationServicesLibrary();
  Class result = objc_getClass("ASAuthorizationPasswordRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getASAuthorizationPasswordRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)__getASAuthorizationPasswordRequestClass_block_invoke_cold_1();
    return (Class)+[CPSDedicatedCameraResponse supportsSecureCoding];
  }
  return result;
}

uint64_t CPSMetricsSessionResultWithCustomMethod(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"other"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"restore_purchase"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"video_subscriber_account"])
  {
    uint64_t v2 = 9;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_24A68D850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

id __copy_helper_block_e8_32n11_8_8_s0_t8w8(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a2 + 32);
  *(void *)(a1 + 32) = result;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return result;
}

void __destroy_helper_block_e8_32n4_8_s0(uint64_t a1)
{
}

uint64_t __MetricsLog_block_invoke()
{
  MetricsLog_log = (uint64_t)os_log_create("com.apple.CompanionServices", "Metrics");
  return MEMORY[0x270F9A758]();
}

uint64_t AppleMediaServicesLibraryCore()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = AppleMediaServicesLibraryCore_frameworkLibrary;
  uint64_t v5 = AppleMediaServicesLibraryCore_frameworkLibrary;
  if (!AppleMediaServicesLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_26528A3B0;
    long long v7 = *(_OWORD *)&off_26528A3C0;
    v3[3] = _sl_dlopen();
    AppleMediaServicesLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_24A68EDE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __AppleMediaServicesLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  AppleMediaServicesLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AppleMediaServicesLibrary()
{
  uint64_t v0 = AppleMediaServicesLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getAMSDelegatePurchaseRequestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAMSDelegatePurchaseRequestClass_softClass;
  uint64_t v7 = getAMSDelegatePurchaseRequestClass_softClass;
  if (!getAMSDelegatePurchaseRequestClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAMSDelegatePurchaseRequestClass_block_invoke;
    v3[3] = &unk_26528A1A0;
    v3[4] = &v4;
    __getAMSDelegatePurchaseRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_24A68EFB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAMSDelegatePurchaseRequestClass_block_invoke(uint64_t a1)
{
  AppleMediaServicesLibrary();
  Class result = objc_getClass("AMSDelegatePurchaseRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAMSDelegatePurchaseRequestClass_block_invoke_cold_1();
  }
  getAMSDelegatePurchaseRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getAMSDelegatePurchaseResultClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAMSDelegatePurchaseResultClass_softClass;
  uint64_t v7 = getAMSDelegatePurchaseResultClass_softClass;
  if (!getAMSDelegatePurchaseResultClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAMSDelegatePurchaseResultClass_block_invoke;
    v3[3] = &unk_26528A1A0;
    v3[4] = &v4;
    __getAMSDelegatePurchaseResultClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_24A68F0F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAMSDelegatePurchaseResultClass_block_invoke(uint64_t a1)
{
  AppleMediaServicesLibrary();
  Class result = objc_getClass("AMSDelegatePurchaseResult");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAMSDelegatePurchaseResultClass_block_invoke_cold_1();
  }
  getAMSDelegatePurchaseResultClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getAMSDelegateAuthenticateRequestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAMSDelegateAuthenticateRequestClass_softClass;
  uint64_t v7 = getAMSDelegateAuthenticateRequestClass_softClass;
  if (!getAMSDelegateAuthenticateRequestClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAMSDelegateAuthenticateRequestClass_block_invoke;
    v3[3] = &unk_26528A1A0;
    v3[4] = &v4;
    __getAMSDelegateAuthenticateRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_24A68F22C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAMSDelegateAuthenticateRequestClass_block_invoke(uint64_t a1)
{
  AppleMediaServicesLibrary();
  Class result = objc_getClass("AMSDelegateAuthenticateRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAMSDelegateAuthenticateRequestClass_block_invoke_cold_1();
  }
  getAMSDelegateAuthenticateRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getAMSDelegateAuthenticateResultClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAMSDelegateAuthenticateResultClass_softClass;
  uint64_t v7 = getAMSDelegateAuthenticateResultClass_softClass;
  if (!getAMSDelegateAuthenticateResultClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAMSDelegateAuthenticateResultClass_block_invoke;
    v3[3] = &unk_26528A1A0;
    v3[4] = &v4;
    __getAMSDelegateAuthenticateResultClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_24A68F368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAMSDelegateAuthenticateResultClass_block_invoke(uint64_t a1)
{
  AppleMediaServicesLibrary();
  Class result = objc_getClass("AMSDelegateAuthenticateResult");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAMSDelegateAuthenticateResultClass_block_invoke_cold_1();
  }
  getAMSDelegateAuthenticateResultClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getACAccountStoreClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getACAccountStoreClass_softClass;
  uint64_t v7 = getACAccountStoreClass_softClass;
  if (!getACAccountStoreClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getACAccountStoreClass_block_invoke;
    v3[3] = &unk_26528A1A0;
    v3[4] = &v4;
    __getACAccountStoreClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_24A68F4A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getACAccountStoreClass_block_invoke(uint64_t a1)
{
  AppleMediaServicesLibrary();
  Class result = objc_getClass("ACAccountStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getACAccountStoreClass_block_invoke_cold_1();
  }
  getACAccountStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getAMSAccountMediaTypeProductionSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getAMSAccountMediaTypeProductionSymbolLoc_ptr;
  uint64_t v6 = getAMSAccountMediaTypeProductionSymbolLoc_ptr;
  if (!getAMSAccountMediaTypeProductionSymbolLoc_ptr)
  {
    id v1 = (void *)AppleMediaServicesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "AMSAccountMediaTypeProduction");
    getAMSAccountMediaTypeProductionSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_24A68F5EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAMSAccountMediaTypeProductionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AppleMediaServicesLibrary();
  Class result = dlsym(v2, "AMSAccountMediaTypeProduction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAMSAccountMediaTypeProductionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getAMSAccountMediaTypeProduction()
{
  AMSAccountMediaTypeProductionSymbolLoc = (void **)getAMSAccountMediaTypeProductionSymbolLoc();
  if (AMSAccountMediaTypeProductionSymbolLoc)
  {
    id v1 = *AMSAccountMediaTypeProductionSymbolLoc;
    return v1;
  }
  else
  {
    ___CPSAKAuthorizationRequestFromASAuthorizationAppleIDRequest_block_invoke_cold_1();
    return (id)AuthenticationServicesLibraryCore();
  }
}

uint64_t AuthenticationServicesLibraryCore()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = AuthenticationServicesLibraryCore_frameworkLibrary_0;
  uint64_t v5 = AuthenticationServicesLibraryCore_frameworkLibrary_0;
  if (!AuthenticationServicesLibraryCore_frameworkLibrary_0)
  {
    long long v6 = xmmword_26528A3F8;
    long long v7 = *(_OWORD *)&off_26528A408;
    v3[3] = _sl_dlopen();
    AuthenticationServicesLibraryCore_frameworkLibrary_0 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_24A68F798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __AuthenticationServicesLibraryCore_block_invoke_0(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  AuthenticationServicesLibraryCore_frameworkLibrary_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AuthenticationServicesLibrary_0()
{
  uint64_t v0 = AuthenticationServicesLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getASPasswordCredentialClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getASPasswordCredentialClass_softClass;
  uint64_t v7 = getASPasswordCredentialClass_softClass;
  if (!getASPasswordCredentialClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getASPasswordCredentialClass_block_invoke;
    v3[3] = &unk_26528A1A0;
    v3[4] = &v4;
    __getASPasswordCredentialClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_24A68F968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getASPasswordCredentialClass_block_invoke(uint64_t a1)
{
  AuthenticationServicesLibrary_0();
  Class result = objc_getClass("ASPasswordCredential");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getASPasswordCredentialClass_block_invoke_cold_1();
  }
  getASPasswordCredentialClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PassKitCoreLibraryCore()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = PassKitCoreLibraryCore_frameworkLibrary;
  uint64_t v5 = PassKitCoreLibraryCore_frameworkLibrary;
  if (!PassKitCoreLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_26528A418;
    long long v7 = *(_OWORD *)&off_26528A428;
    v3[3] = _sl_dlopen();
    PassKitCoreLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_24A68FAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PassKitCoreLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  PassKitCoreLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PassKitCoreLibrary()
{
  uint64_t v0 = PassKitCoreLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getPKPaymentRequestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPKPaymentRequestClass_softClass;
  uint64_t v7 = getPKPaymentRequestClass_softClass;
  if (!getPKPaymentRequestClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getPKPaymentRequestClass_block_invoke;
    v3[3] = &unk_26528A1A0;
    v3[4] = &v4;
    __getPKPaymentRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_24A68FCB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPKPaymentRequestClass_block_invoke(uint64_t a1)
{
  PassKitCoreLibrary();
  Class result = objc_getClass("PKPaymentRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPKPaymentRequestClass_block_invoke_cold_1();
  }
  getPKPaymentRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t UIKitLibraryCore()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = UIKitLibraryCore_frameworkLibrary;
  uint64_t v5 = UIKitLibraryCore_frameworkLibrary;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_26528A438;
    long long v7 = *(_OWORD *)&off_26528A448;
    v3[3] = _sl_dlopen();
    UIKitLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_24A68FE38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __UIKitLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  UIKitLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t UIKitLibrary()
{
  uint64_t v0 = UIKitLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getUIImageClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getUIImageClass_softClass;
  uint64_t v7 = getUIImageClass_softClass;
  if (!getUIImageClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getUIImageClass_block_invoke;
    v3[3] = &unk_26528A1A0;
    v3[4] = &v4;
    __getUIImageClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_24A690008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIImageClass_block_invoke(uint64_t a1)
{
  UIKitLibrary();
  Class result = objc_getClass("UIImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getUIImageClass_block_invoke_cold_1();
  }
  getUIImageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

unint64_t static CPSConstants.logSubsystem.getter()
{
  return 0xD00000000000001BLL;
}

ValueMetadata *type metadata accessor for CPSConstants()
{
  return &type metadata for CPSConstants;
}

uint64_t __getASAuthorizationAppleIDRequestClass_block_invoke_cold_1()
{
  return ___CPSAKAuthorizationRequestFromASAuthorizationAppleIDRequest_block_invoke_cold_1();
}

uint64_t __getASAuthorizationPasswordRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[CPSWebRequest initWithURL:callbackScheme:additionalHeaderFields:](v0);
}

void __getAMSDelegatePurchaseRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getAMSDelegatePurchaseResultClass_block_invoke_cold_1(v0);
}

void __getAMSDelegatePurchaseResultClass_block_invoke_cold_1()
{
}

void __getAMSDelegateAuthenticateRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getAMSDelegateAuthenticateResultClass_block_invoke_cold_1(v0);
}

void __getAMSDelegateAuthenticateResultClass_block_invoke_cold_1()
{
}

void __getACAccountStoreClass_block_invoke_cold_1()
{
}

void __getASPasswordCredentialClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getPKPaymentRequestClass_block_invoke_cold_1(v0);
}

void __getPKPaymentRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getUIImageClass_block_invoke_cold_1(v0);
}

void __getUIImageClass_block_invoke_cold_1()
{
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x270F10778]();
}

uint64_t CUPrintFlags64()
{
  return MEMORY[0x270F23FB0]();
}

uint64_t CUPrintNSObjectMasked()
{
  return MEMORY[0x270F23FE0]();
}

uint64_t GestaltCopyAnswer()
{
  return MEMORY[0x270F24180]();
}

uint64_t GestaltGetBoolean()
{
  return MEMORY[0x270F24188]();
}

uint64_t GestaltProductTypeStringToDeviceClass()
{
  return MEMORY[0x270F241A8]();
}

uint64_t NSErrorF()
{
  return MEMORY[0x270F24490]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t SBSIsSystemApertureAvailable()
{
  return MEMORY[0x270F77180]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x270F109A8]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}