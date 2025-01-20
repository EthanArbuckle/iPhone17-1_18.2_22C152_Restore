void sub_2185CA79C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getSOConfigurationClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSOConfigurationClass_softClass;
  uint64_t v7 = getSOConfigurationClass_softClass;
  if (!getSOConfigurationClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSOConfigurationClass_block_invoke;
    v3[3] = &unk_26432A2A8;
    v3[4] = &v4;
    __getSOConfigurationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2185CA898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SO_LOG_SOConfigurationHost()
{
  if (SO_LOG_SOConfigurationHost_once != -1) {
    dispatch_once(&SO_LOG_SOConfigurationHost_once, &__block_literal_global_207);
  }
  v0 = (void *)SO_LOG_SOConfigurationHost_log;
  return v0;
}

void sub_2185CA984(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getSOAuthorizationResultCoreClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSOAuthorizationResultCoreClass_softClass;
  uint64_t v7 = getSOAuthorizationResultCoreClass_softClass;
  if (!getSOAuthorizationResultCoreClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSOAuthorizationResultCoreClass_block_invoke;
    v3[3] = &unk_26432A2A8;
    v3[4] = &v4;
    __getSOAuthorizationResultCoreClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2185CAB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSOAuthorizationResultCoreClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AppSSOCoreLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AppSSOCoreLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26432A2C8;
    uint64_t v6 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!AppSSOCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SOAuthorizationResultCore");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getSOAuthorizationResultCoreClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSOAuthorizationResultCoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppSSOCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppSSOCoreLibraryCore_frameworkLibrary = result;
  return result;
}

id SO_LOG_SOExtensionServiceConnection()
{
  if (SO_LOG_SOExtensionServiceConnection_once != -1) {
    dispatch_once(&SO_LOG_SOExtensionServiceConnection_once, &__block_literal_global);
  }
  v0 = (void *)SO_LOG_SOExtensionServiceConnection_log;
  return v0;
}

void sub_2185CB2DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_2185CB5B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void __getSOInternalProtocolsClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SOInternalProtocols");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSOInternalProtocolsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSOInternalProtocolsClass_block_invoke_cold_1();
    AppSSOCoreLibrary();
  }
}

void AppSSOCoreLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!AppSSOCoreLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __AppSSOCoreLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_26432A370;
    uint64_t v3 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!AppSSOCoreLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __AppSSOCoreLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AppSSOCoreLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void __getSOErrorHelperClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SOErrorHelper");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSOErrorHelperClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSOErrorHelperClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0();
  }
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_2185CBE60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SO_LOG_SORemoteExtensionContext()
{
  if (SO_LOG_SORemoteExtensionContext_once != -1) {
    dispatch_once(&SO_LOG_SORemoteExtensionContext_once, &__block_literal_global_177);
  }
  v0 = (void *)SO_LOG_SORemoteExtensionContext_log;
  return v0;
}

void sub_2185CBF74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185CC0E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getSOErrorHelperClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSOErrorHelperClass_softClass_0;
  uint64_t v7 = getSOErrorHelperClass_softClass_0;
  if (!getSOErrorHelperClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSOErrorHelperClass_block_invoke_0;
    v3[3] = &unk_26432A2A8;
    v3[4] = &v4;
    __getSOErrorHelperClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2185CC29C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2185CC680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_2185CC830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getASAuthorizationProviderExtensionAuthorizationRequestClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getASAuthorizationProviderExtensionAuthorizationRequestClass_softClass;
  uint64_t v7 = getASAuthorizationProviderExtensionAuthorizationRequestClass_softClass;
  if (!getASAuthorizationProviderExtensionAuthorizationRequestClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getASAuthorizationProviderExtensionAuthorizationRequestClass_block_invoke;
    v3[3] = &unk_26432A2A8;
    v3[4] = &v4;
    __getASAuthorizationProviderExtensionAuthorizationRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2185CCD68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2185CD788(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185CD948(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185CDCCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSOErrorHelperClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AppSSOCoreLibraryCore_frameworkLibrary_1)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AppSSOCoreLibraryCore_block_invoke_1;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26432A450;
    uint64_t v6 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!AppSSOCoreLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SOErrorHelper");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getSOErrorHelperClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSOErrorHelperClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppSSOCoreLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  AppSSOCoreLibraryCore_frameworkLibrary_1 = result;
  return result;
}

Class __getASAuthorizationProviderExtensionAuthorizationRequestClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AuthenticationServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AuthenticationServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26432A468;
    uint64_t v6 = 0;
    AuthenticationServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!AuthenticationServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("ASAuthorizationProviderExtensionAuthorizationRequest");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getASAuthorizationProviderExtensionAuthorizationRequestClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getASAuthorizationProviderExtensionAuthorizationRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                                 + 8)
                                                                                     + 24);
  return result;
}

uint64_t __AuthenticationServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AuthenticationServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_4(uint64_t a1)
{
  return *(void *)a1;
}

void sub_2185CEF3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SO_LOG_SOExtension()
{
  if (SO_LOG_SOExtension_once != -1) {
    dispatch_once(&SO_LOG_SOExtension_once, &__block_literal_global_1);
  }
  v0 = (void *)SO_LOG_SOExtension_log;
  return v0;
}

void sub_2185CF0BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185CF18C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2185CF49C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getSOErrorHelperClass_0()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSOErrorHelperClass_softClass_1;
  uint64_t v7 = getSOErrorHelperClass_softClass_1;
  if (!getSOErrorHelperClass_softClass_1)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSOErrorHelperClass_block_invoke_1;
    v3[3] = &unk_26432A2A8;
    v3[4] = &v4;
    __getSOErrorHelperClass_block_invoke_1((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2185CF584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2185CF754(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185CF894(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185CFA54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185D109C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185D1368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_2185D1530(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185D1664(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185D1C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2185D2250(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185D23F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185D3968(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185D3D1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class __getSOErrorHelperClass_block_invoke_1(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AppSSOCoreLibraryCore_frameworkLibrary_2)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AppSSOCoreLibraryCore_block_invoke_2;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26432A898;
    uint64_t v6 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!AppSSOCoreLibraryCore_frameworkLibrary_2)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SOErrorHelper");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getSOErrorHelperClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSOErrorHelperClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppSSOCoreLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  AppSSOCoreLibraryCore_frameworkLibrary_2 = result;
  return result;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_2185D6434(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getSOAuthorizationParametersCoreClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AppSSOCoreLibraryCore_frameworkLibrary_3)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AppSSOCoreLibraryCore_block_invoke_3;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26432A8B0;
    uint64_t v6 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_3 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!AppSSOCoreLibraryCore_frameworkLibrary_3)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SOAuthorizationParametersCore");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getSOAuthorizationParametersCoreClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSOAuthorizationParametersCoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppSSOCoreLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  AppSSOCoreLibraryCore_frameworkLibrary_3 = result;
  return result;
}

id SO_LOG_SOExtensionManager()
{
  if (SO_LOG_SOExtensionManager_once != -1) {
    dispatch_once(&SO_LOG_SOExtensionManager_once, &__block_literal_global_77);
  }
  v0 = (void *)SO_LOG_SOExtensionManager_log;
  return v0;
}

void sub_2185D70AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2185D727C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_2185D76A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185D77B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2185D79B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185D7BE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class __getSOErrorHelperClass_block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AppSSOCoreLibraryCore_frameworkLibrary_4)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AppSSOCoreLibraryCore_block_invoke_4;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26432A970;
    uint64_t v6 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_4 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!AppSSOCoreLibraryCore_frameworkLibrary_4)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SOErrorHelper");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getSOErrorHelperClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSOErrorHelperClass_softClass_2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppSSOCoreLibraryCore_block_invoke_4()
{
  uint64_t result = _sl_dlopen();
  AppSSOCoreLibraryCore_frameworkLibrary_4 = result;
  return result;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void sub_2185D99F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185D9AA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185D9CB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SO_LOG_SORequestQueue()
{
  if (SO_LOG_SORequestQueue_once != -1) {
    dispatch_once(&SO_LOG_SORequestQueue_once, &__block_literal_global_37);
  }
  v0 = (void *)SO_LOG_SORequestQueue_log;
  return v0;
}

void sub_2185D9E04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185DA0D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185DA3FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185DA46C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185DA4F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185DA5BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185DA71C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185DA794(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_3(uint64_t result, int a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_2185DB1BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSOUtilsClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSOUtilsClass_softClass;
  uint64_t v7 = getSOUtilsClass_softClass;
  if (!getSOUtilsClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSOUtilsClass_block_invoke;
    v3[3] = &unk_26432A2A8;
    v3[4] = &v4;
    __getSOUtilsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2185DB2A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getSOUtilsClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SOUtils");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSOUtilsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSOUtilsClass_block_invoke_cold_1();
    AppSSOCoreLibrary_0();
  }
}

void AppSSOCoreLibrary_0()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!AppSSOCoreLibraryCore_frameworkLibrary_5)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __AppSSOCoreLibraryCore_block_invoke_5;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_26432A9E0;
    uint64_t v3 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_5 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!AppSSOCoreLibraryCore_frameworkLibrary_5)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __AppSSOCoreLibraryCore_block_invoke_5()
{
  uint64_t result = _sl_dlopen();
  AppSSOCoreLibraryCore_frameworkLibrary_5 = result;
  return result;
}

Class __getSOErrorHelperClass_block_invoke_3(uint64_t a1)
{
  AppSSOCoreLibrary_0();
  Class result = objc_getClass("SOErrorHelper");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSOErrorHelperClass_softClass_3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)__getSOErrorHelperClass_block_invoke_cold_1();
    return (Class)+[SOPreferences BOOLValueForKey:v5 defaultValue:v6];
  }
  return result;
}

id getSOUtilsClass_0()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSOUtilsClass_softClass_0;
  uint64_t v7 = getSOUtilsClass_softClass_0;
  if (!getSOUtilsClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSOUtilsClass_block_invoke_0;
    v3[3] = &unk_26432A2A8;
    v3[4] = &v4;
    __getSOUtilsClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2185DB800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SO_LOG_SOPreferences()
{
  if (SO_LOG_SOPreferences_once != -1) {
    dispatch_once(&SO_LOG_SOPreferences_once, &__block_literal_global_5);
  }
  v0 = (void *)SO_LOG_SOPreferences_log;
  return v0;
}

Class __getSOUtilsClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AppSSOCoreLibraryCore_frameworkLibrary_6)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AppSSOCoreLibraryCore_block_invoke_6;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26432A9F8;
    uint64_t v6 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_6 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!AppSSOCoreLibraryCore_frameworkLibrary_6)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SOUtils");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getSOUtilsClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSOUtilsClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppSSOCoreLibraryCore_block_invoke_6()
{
  uint64_t result = _sl_dlopen();
  AppSSOCoreLibraryCore_frameworkLibrary_6 = result;
  return result;
}

id SO_LOG_SOConfigurationManager()
{
  if (SO_LOG_SOConfigurationManager_once != -1) {
    dispatch_once(&SO_LOG_SOConfigurationManager_once, &__block_literal_global_7);
  }
  v0 = (void *)SO_LOG_SOConfigurationManager_log;
  return v0;
}

id SO_LOG_SOAuthorizationRequest()
{
  if (SO_LOG_SOAuthorizationRequest_once != -1) {
    dispatch_once(&SO_LOG_SOAuthorizationRequest_once, &__block_literal_global_7);
  }
  v0 = (void *)SO_LOG_SOAuthorizationRequest_log;
  return v0;
}

id getSOErrorHelperClass_1()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSOErrorHelperClass_softClass_4;
  uint64_t v7 = getSOErrorHelperClass_softClass_4;
  if (!getSOErrorHelperClass_softClass_4)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSOErrorHelperClass_block_invoke_4;
    v3[3] = &unk_26432A2A8;
    v3[4] = &v4;
    __getSOErrorHelperClass_block_invoke_4((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2185DC34C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSOAuthorizationCredentialClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSOAuthorizationCredentialClass_softClass;
  uint64_t v7 = getSOAuthorizationCredentialClass_softClass;
  if (!getSOAuthorizationCredentialClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSOAuthorizationCredentialClass_block_invoke;
    v3[3] = &unk_26432A2A8;
    v3[4] = &v4;
    __getSOAuthorizationCredentialClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2185DC9A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getASAuthorizationErrorDomain()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getASAuthorizationErrorDomainSymbolLoc_ptr;
  uint64_t v8 = getASAuthorizationErrorDomainSymbolLoc_ptr;
  if (!getASAuthorizationErrorDomainSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __getASAuthorizationErrorDomainSymbolLoc_block_invoke;
    v4[3] = &unk_26432A2A8;
    v4[4] = &v5;
    __getASAuthorizationErrorDomainSymbolLoc_block_invoke((uint64_t)v4);
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    ASAuthorizationErrorDomain_cold_1 = (_Unwind_Exception *)getASAuthorizationErrorDomain_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(ASAuthorizationErrorDomain_cold_1);
  }
  id v1 = *v0;
  return v1;
}

void sub_2185DDC24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185DDD50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185DE2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSOErrorHelperClass_block_invoke_4(uint64_t a1)
{
  AppSSOCoreLibrary_1();
  Class result = objc_getClass("SOErrorHelper");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSOErrorHelperClass_softClass_4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSOErrorHelperClass_block_invoke_cold_1();
    return (Class)AppSSOCoreLibrary_1();
  }
  return result;
}

uint64_t AppSSOCoreLibrary_1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AppSSOCoreLibraryCore_frameworkLibrary_7)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __AppSSOCoreLibraryCore_block_invoke_7;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26432AA60;
    uint64_t v5 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_7 = _sl_dlopen();
  }
  uint64_t v0 = AppSSOCoreLibraryCore_frameworkLibrary_7;
  id v1 = (void *)v3[0];
  if (!AppSSOCoreLibraryCore_frameworkLibrary_7)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __AppSSOCoreLibraryCore_block_invoke_7()
{
  uint64_t result = _sl_dlopen();
  AppSSOCoreLibraryCore_frameworkLibrary_7 = result;
  return result;
}

Class __getSOAuthorizationCredentialClass_block_invoke(uint64_t a1)
{
  AppSSOCoreLibrary_1();
  Class result = objc_getClass("SOAuthorizationCredential");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSOAuthorizationCredentialClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSOAuthorizationCredentialClass_block_invoke_cold_1();
    return (Class)__getASAuthorizationErrorDomainSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getASAuthorizationErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!AuthenticationServicesLibraryCore_frameworkLibrary_0)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __AuthenticationServicesLibraryCore_block_invoke_0;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_26432AA78;
    uint64_t v7 = 0;
    AuthenticationServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    long long v2 = (void *)AuthenticationServicesLibraryCore_frameworkLibrary_0;
    if (AuthenticationServicesLibraryCore_frameworkLibrary_0)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  long long v2 = (void *)AuthenticationServicesLibraryCore_frameworkLibrary_0;
LABEL_5:
  Class result = dlsym(v2, "ASAuthorizationErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getASAuthorizationErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AuthenticationServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AuthenticationServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getSOAuthorizationOptionCoreNoUserInterfaceSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)AppSSOCoreLibrary_1();
  uint64_t result = dlsym(v2, "SOAuthorizationOptionCoreNoUserInterface");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSOAuthorizationOptionCoreNoUserInterfaceSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPOLoginManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!PlatformSSOLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __PlatformSSOLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_26432AA90;
    uint64_t v6 = 0;
    PlatformSSOLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!PlatformSSOLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("POLoginManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getPOLoginManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getPOLoginManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PlatformSSOLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PlatformSSOLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(_DWORD *)(a2 + 4) = result & 1;
  *(_WORD *)(a2 + _Block_object_dispose(&location, 8) = 1024;
  *(_DWORD *)(a2 + 10) = a3;
  return result;
}

id SO_LOG_SOAuthorization()
{
  if (SO_LOG_SOAuthorization_once != -1) {
    dispatch_once(&SO_LOG_SOAuthorization_once, &__block_literal_global_8);
  }
  uint64_t v0 = (void *)SO_LOG_SOAuthorization_log;
  return v0;
}

id getSOAuthorizationCoreClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSOAuthorizationCoreClass_softClass;
  uint64_t v7 = getSOAuthorizationCoreClass_softClass;
  if (!getSOAuthorizationCoreClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSOAuthorizationCoreClass_block_invoke;
    v3[3] = &unk_26432A2A8;
    v3[4] = &v4;
    __getSOAuthorizationCoreClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2185DEC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2185DF350(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185DF3CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185DF438(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185DF4B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185DF50C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185DF580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2185DFFB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSOErrorHelperClass_2()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSOErrorHelperClass_softClass_5;
  uint64_t v7 = getSOErrorHelperClass_softClass_5;
  if (!getSOErrorHelperClass_softClass_5)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSOErrorHelperClass_block_invoke_5;
    v3[3] = &unk_26432A2A8;
    v3[4] = &v4;
    __getSOErrorHelperClass_block_invoke_5((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2185E06A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2185E0E3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getSOAuthorizationCredentialCoreClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSOAuthorizationCredentialCoreClass_softClass;
  uint64_t v7 = getSOAuthorizationCredentialCoreClass_softClass;
  if (!getSOAuthorizationCredentialCoreClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSOAuthorizationCredentialCoreClass_block_invoke;
    v3[3] = &unk_26432A2A8;
    v3[4] = &v4;
    __getSOAuthorizationCredentialCoreClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2185E0FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2185E142C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_2185E229C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AppSSOCoreLibraryCore()
{
  if (!AppSSOCoreLibraryCore_frameworkLibrary_8) {
    AppSSOCoreLibraryCore_frameworkLibrary_8 = _sl_dlopen();
  }
  return AppSSOCoreLibraryCore_frameworkLibrary_8;
}

uint64_t __AppSSOCoreLibraryCore_block_invoke_8()
{
  uint64_t result = _sl_dlopen();
  AppSSOCoreLibraryCore_frameworkLibrary_8 = result;
  return result;
}

void __getSOAuthorizationCoreClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SOAuthorizationCore");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSOAuthorizationCoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSOAuthorizationCoreClass_block_invoke_cold_1();
    AppSSOCoreLibrary_2();
  }
}

void AppSSOCoreLibrary_2()
{
  if (!AppSSOCoreLibraryCore())
  {
    uint64_t v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getSOAuthorizationRequestParametersCoreClass_block_invoke(uint64_t a1)
{
  AppSSOCoreLibrary_2();
  Class result = objc_getClass("SOAuthorizationRequestParametersCore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSOAuthorizationRequestParametersCoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSOAuthorizationRequestParametersCoreClass_block_invoke_cold_1();
    return __getSOErrorHelperClass_block_invoke_5(v3);
  }
  return result;
}

Class __getSOErrorHelperClass_block_invoke_5(uint64_t a1)
{
  AppSSOCoreLibrary_2();
  Class result = objc_getClass("SOErrorHelper");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSOErrorHelperClass_softClass_5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSOErrorHelperClass_block_invoke_cold_1();
    return (Class)__getSOAuthorizationCredentialCoreClass_block_invoke(v3);
  }
  return result;
}

Class __getSOAuthorizationCredentialCoreClass_block_invoke(uint64_t a1)
{
  AppSSOCoreLibrary_2();
  Class result = objc_getClass("SOAuthorizationCredentialCore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSOAuthorizationCredentialCoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSOAuthorizationCredentialCoreClass_block_invoke_cold_1();
    return (Class)__getSOConfigurationClientClass_block_invoke(v3);
  }
  return result;
}

Class __getSOConfigurationClientClass_block_invoke(uint64_t a1)
{
  AppSSOCoreLibrary_2();
  Class result = objc_getClass("SOConfigurationClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSOConfigurationClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSOConfigurationClientClass_block_invoke_cold_1();
    return (Class)__getSOUIAuthorizationViewControllerClass_block_invoke(v3);
  }
  return result;
}

Class __getSOUIAuthorizationViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AppSSOUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AppSSOUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_26432AD08;
    uint64_t v6 = 0;
    AppSSOUILibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!AppSSOUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SOUIAuthorizationViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getSOUIAuthorizationViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSOUIAuthorizationViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppSSOUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppSSOUILibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_1_3(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&location, 8) = a1;
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_8_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

id SO_LOG_SOExtensionViewService()
{
  if (SO_LOG_SOExtensionViewService_once != -1) {
    dispatch_once(&SO_LOG_SOExtensionViewService_once, &__block_literal_global_9);
  }
  uint64_t v0 = (void *)SO_LOG_SOExtensionViewService_log;
  return v0;
}

void sub_2185E388C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2185E3B54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getSOErrorHelperClass_3()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSOErrorHelperClass_softClass_6;
  uint64_t v7 = getSOErrorHelperClass_softClass_6;
  if (!getSOErrorHelperClass_softClass_6)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSOErrorHelperClass_block_invoke_6;
    v3[3] = &unk_26432A2A8;
    v3[4] = &v4;
    __getSOErrorHelperClass_block_invoke_6((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2185E3C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2185E3E70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185E4098(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getSOFullProfileClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSOFullProfileClass_softClass;
  uint64_t v7 = getSOFullProfileClass_softClass;
  if (!getSOFullProfileClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSOFullProfileClass_block_invoke;
    v3[3] = &unk_26432A2A8;
    v3[4] = &v4;
    __getSOFullProfileClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2185E4188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2185E43E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185E460C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185E4804(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185E5468(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185E5854(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185E5A60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185E5AD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2185E6148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_2185E627C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185E6410(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185E6568(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185E6E50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_2185E7600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2185E7F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id obj, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
}

void sub_2185E840C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185E8828(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185E8B50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185E8F30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2185E91E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __getSOConfigurationVersionClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SOConfigurationVersion");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSOConfigurationVersionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSOConfigurationVersionClass_block_invoke_cold_1();
    AppSSOCoreLibrary_3();
  }
}

void AppSSOCoreLibrary_3()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!AppSSOCoreLibraryCore_frameworkLibrary_9)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __AppSSOCoreLibraryCore_block_invoke_9;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_26432AD50;
    uint64_t v3 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_9 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!AppSSOCoreLibraryCore_frameworkLibrary_9)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __AppSSOCoreLibraryCore_block_invoke_9()
{
  uint64_t result = _sl_dlopen();
  AppSSOCoreLibraryCore_frameworkLibrary_9 = result;
  return result;
}

Class __getSOErrorHelperClass_block_invoke_6(uint64_t a1)
{
  AppSSOCoreLibrary_3();
  Class result = objc_getClass("SOErrorHelper");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSOErrorHelperClass_softClass_6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSOErrorHelperClass_block_invoke_cold_1();
    return __getSOConfigurationClass_block_invoke(v3);
  }
  return result;
}

Class __getSOConfigurationClass_block_invoke(uint64_t a1)
{
  AppSSOCoreLibrary_3();
  Class result = objc_getClass("SOConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSOConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSOConfigurationClass_block_invoke_cold_1();
    return (Class)__getSOFullProfileClass_block_invoke(v3);
  }
  return result;
}

void __getSOFullProfileClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SOFullProfile");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSOFullProfileClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSOFullProfileClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_4_2();
  }
}

uint64_t OUTLINED_FUNCTION_10_0(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

void sub_2185E9CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

id SO_LOG_SOHostExtensionContext()
{
  if (SO_LOG_SOHostExtensionContext_once != -1) {
    dispatch_once(&SO_LOG_SOHostExtensionContext_once, &__block_literal_global_115);
  }
  uint64_t v0 = (void *)SO_LOG_SOHostExtensionContext_log;
  return v0;
}

void sub_2185EAA84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSOFullProfileClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AppSSOCoreLibraryCore_frameworkLibrary_10)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AppSSOCoreLibraryCore_block_invoke_10;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_26432ADB8;
    uint64_t v6 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_10 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!AppSSOCoreLibraryCore_frameworkLibrary_10)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SOFullProfile");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getSOFullProfileClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSOFullProfileClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppSSOCoreLibraryCore_block_invoke_10()
{
  uint64_t result = _sl_dlopen();
  AppSSOCoreLibraryCore_frameworkLibrary_10 = result;
  return result;
}

void appSSO_init()
{
  if (AppSSOCoreLibraryCore_0())
  {
    uint64_t v4 = 0;
    long long v5 = &v4;
    uint64_t v6 = 0x2020000000;
    uint64_t v0 = (void (*)(void))getappSSO_initSymbolLoc_ptr;
    uint64_t v7 = getappSSO_initSymbolLoc_ptr;
    if (!getappSSO_initSymbolLoc_ptr)
    {
      id v1 = (void *)AppSSOCoreLibrary_4();
      v5[3] = (uint64_t)dlsym(v1, "appSSO_init");
      getappSSO_initSymbolLoc_ptr = (_UNKNOWN *)v5[3];
      uint64_t v0 = (void (*)(void))v5[3];
    }
    _Block_object_dispose(&v4, 8);
    if (!v0)
    {
      ASAuthorizationErrorDomain_cold_1 = (_Unwind_Exception *)getASAuthorizationErrorDomain_cold_1();
      _Block_object_dispose(&v4, 8);
      _Unwind_Resume(ASAuthorizationErrorDomain_cold_1);
    }
    v0();
  }
  else
  {
    long long v2 = SO_LOG_AppSSOClientImpl();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:]();
    }
  }
}

id SO_LOG_AppSSOClientImpl()
{
  if (SO_LOG_AppSSOClientImpl_once != -1) {
    dispatch_once(&SO_LOG_AppSSOClientImpl_once, &__block_literal_global_13);
  }
  uint64_t v0 = (void *)SO_LOG_AppSSOClientImpl_log;
  return v0;
}

uint64_t appSSO_willPerform(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (AppSSOCoreLibraryCore_0())
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))getappSSO_willPerformSymbolLoc_ptr;
    v16 = getappSSO_willPerformSymbolLoc_ptr;
    if (!getappSSO_willPerformSymbolLoc_ptr)
    {
      uint64_t v9 = (void *)AppSSOCoreLibrary_4();
      v14[3] = (uint64_t)dlsym(v9, "appSSO_willPerform");
      getappSSO_willPerformSymbolLoc_ptr = (_UNKNOWN *)v14[3];
      uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v14[3];
    }
    _Block_object_dispose(&v13, 8);
    if (!v8)
    {
      ASAuthorizationErrorDomain_cold_1 = (_Unwind_Exception *)getASAuthorizationErrorDomain_cold_1();
      _Block_object_dispose(&v13, 8);
      _Unwind_Resume(ASAuthorizationErrorDomain_cold_1);
    }
    return v8(a1, a2, a3, a4);
  }
  else
  {
    v11 = SO_LOG_AppSSOClientImpl();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:]();
    }

    return 0;
  }
}

void appSSO_performResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v11 = a6;
  if (AppSSOCoreLibraryCore_0())
  {
    id v12 = v11;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v13 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))getappSSO_performResponseSymbolLoc_ptr;
    v21 = getappSSO_performResponseSymbolLoc_ptr;
    if (!getappSSO_performResponseSymbolLoc_ptr)
    {
      v14 = (void *)AppSSOCoreLibrary_4();
      v19[3] = (uint64_t)dlsym(v14, "appSSO_performResponse");
      getappSSO_performResponseSymbolLoc_ptr = (_UNKNOWN *)v19[3];
      uint64_t v13 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))v19[3];
    }
    _Block_object_dispose(&v18, 8);
    if (!v13)
    {
      ASAuthorizationErrorDomain_cold_1 = (_Unwind_Exception *)getASAuthorizationErrorDomain_cold_1();
      _Block_object_dispose(&v18, 8);
      _Unwind_Resume(ASAuthorizationErrorDomain_cold_1);
    }
    v13(a1, a2, a3, a4, a5, v12);
  }
  else
  {
    uint64_t v15 = SO_LOG_AppSSOClientImpl();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:]();
    }

    if (v11)
    {
      uint64_t v16 = [getSOErrorHelperClass_4() silentInternalErrorWithMessage:@"AppSSOCore is not available"];
      (*((void (**)(id, void, void, uint64_t))v11 + 2))(v11, 0, 0, v16);
    }
  }
}

id getSOErrorHelperClass_4()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSOErrorHelperClass_softClass_7;
  uint64_t v7 = getSOErrorHelperClass_softClass_7;
  if (!getSOErrorHelperClass_softClass_7)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSOErrorHelperClass_block_invoke_7;
    v3[3] = &unk_26432A2A8;
    v3[4] = &v4;
    __getSOErrorHelperClass_block_invoke_7((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2185EB1D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void appSSO_performResponseCredential(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  if (AppSSOCoreLibraryCore_0())
  {
    id v10 = v9;
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    id v11 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, id))getappSSO_performResponseCredentialSymbolLoc_ptr;
    v19 = getappSSO_performResponseCredentialSymbolLoc_ptr;
    if (!getappSSO_performResponseCredentialSymbolLoc_ptr)
    {
      id v12 = (void *)AppSSOCoreLibrary_4();
      v17[3] = (uint64_t)dlsym(v12, "appSSO_performResponseCredential");
      getappSSO_performResponseCredentialSymbolLoc_ptr = (_UNKNOWN *)v17[3];
      id v11 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, id))v17[3];
    }
    _Block_object_dispose(&v16, 8);
    if (!v11)
    {
      ASAuthorizationErrorDomain_cold_1 = (_Unwind_Exception *)getASAuthorizationErrorDomain_cold_1();
      _Block_object_dispose(&v16, 8);
      _Unwind_Resume(ASAuthorizationErrorDomain_cold_1);
    }
    v11(a1, a2, a3, a4, v10);
  }
  else
  {
    uint64_t v13 = SO_LOG_AppSSOClientImpl();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:]();
    }

    if (v9)
    {
      uint64_t v14 = [getSOErrorHelperClass_4() silentInternalErrorWithMessage:@"AppSSOCore is not available"];
      (*((void (**)(id, void, uint64_t))v9 + 2))(v9, 0, v14);
    }
  }
}

uint64_t appSSO_willHandle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (AppSSOCoreLibraryCore_0())
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))getappSSO_willHandleSymbolLoc_ptr;
    uint64_t v16 = getappSSO_willHandleSymbolLoc_ptr;
    if (!getappSSO_willHandleSymbolLoc_ptr)
    {
      id v9 = (void *)AppSSOCoreLibrary_4();
      v14[3] = (uint64_t)dlsym(v9, "appSSO_willHandle");
      getappSSO_willHandleSymbolLoc_ptr = (_UNKNOWN *)v14[3];
      uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v14[3];
    }
    _Block_object_dispose(&v13, 8);
    if (!v8)
    {
      ASAuthorizationErrorDomain_cold_1 = (_Unwind_Exception *)getASAuthorizationErrorDomain_cold_1();
      _Block_object_dispose(&v13, 8);
      _Unwind_Resume(ASAuthorizationErrorDomain_cold_1);
    }
    return v8(a1, a2, a3, a4);
  }
  else
  {
    id v11 = SO_LOG_AppSSOClientImpl();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:]();
    }

    return 0;
  }
}

void appSSO_handleResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v11 = a6;
  if (AppSSOCoreLibraryCore_0())
  {
    id v12 = v11;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v13 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))getappSSO_handleResponseSymbolLoc_ptr;
    v21 = getappSSO_handleResponseSymbolLoc_ptr;
    if (!getappSSO_handleResponseSymbolLoc_ptr)
    {
      uint64_t v14 = (void *)AppSSOCoreLibrary_4();
      v19[3] = (uint64_t)dlsym(v14, "appSSO_handleResponse");
      getappSSO_handleResponseSymbolLoc_ptr = (_UNKNOWN *)v19[3];
      uint64_t v13 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))v19[3];
    }
    _Block_object_dispose(&v18, 8);
    if (!v13)
    {
      ASAuthorizationErrorDomain_cold_1 = (_Unwind_Exception *)getASAuthorizationErrorDomain_cold_1();
      _Block_object_dispose(&v18, 8);
      _Unwind_Resume(ASAuthorizationErrorDomain_cold_1);
    }
    v13(a1, a2, a3, a4, a5, v12);
  }
  else
  {
    uint64_t v15 = SO_LOG_AppSSOClientImpl();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:]();
    }

    if (v11)
    {
      uint64_t v16 = [getSOErrorHelperClass_4() silentInternalErrorWithMessage:@"AppSSOCore is not available"];
      (*((void (**)(id, void, void, uint64_t))v11 + 2))(v11, 0, 0, v16);
    }
  }
}

void appSSO_handleResponseCredential(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v13 = a7;
  if (AppSSOCoreLibraryCore_0())
  {
    id v14 = v13;
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v15 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))getappSSO_handleResponseCredentialSymbolLoc_ptr;
    v23 = getappSSO_handleResponseCredentialSymbolLoc_ptr;
    if (!getappSSO_handleResponseCredentialSymbolLoc_ptr)
    {
      uint64_t v16 = (void *)AppSSOCoreLibrary_4();
      v21[3] = (uint64_t)dlsym(v16, "appSSO_handleResponseCredential");
      getappSSO_handleResponseCredentialSymbolLoc_ptr = (_UNKNOWN *)v21[3];
      uint64_t v15 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))v21[3];
    }
    _Block_object_dispose(&v20, 8);
    if (!v15)
    {
      ASAuthorizationErrorDomain_cold_1 = (_Unwind_Exception *)getASAuthorizationErrorDomain_cold_1();
      _Block_object_dispose(&v20, 8);
      _Unwind_Resume(ASAuthorizationErrorDomain_cold_1);
    }
    v15(a1, a2, a3, a4, a5, a6, v14);
  }
  else
  {
    v17 = SO_LOG_AppSSOClientImpl();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:]();
    }

    if (v13)
    {
      uint64_t v18 = [getSOErrorHelperClass_4() silentInternalErrorWithMessage:@"AppSSOCore is not available"];
      (*((void (**)(id, void, uint64_t))v13 + 2))(v13, 0, v18);
    }
  }
}

void appSSO_handleResponseImpersonationCredential(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v15 = a8;
  if (AppSSOCoreLibraryCore_0())
  {
    id v16 = v15;
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    v17 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))getappSSO_handleResponseImpersonationCredentialSymbolLoc_ptr;
    v25 = getappSSO_handleResponseImpersonationCredentialSymbolLoc_ptr;
    if (!getappSSO_handleResponseImpersonationCredentialSymbolLoc_ptr)
    {
      uint64_t v18 = (void *)AppSSOCoreLibrary_4();
      v23[3] = (uint64_t)dlsym(v18, "appSSO_handleResponseImpersonationCredential");
      getappSSO_handleResponseImpersonationCredentialSymbolLoc_ptr = (_UNKNOWN *)v23[3];
      v17 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))v23[3];
    }
    _Block_object_dispose(&v22, 8);
    if (!v17)
    {
      ASAuthorizationErrorDomain_cold_1 = (_Unwind_Exception *)getASAuthorizationErrorDomain_cold_1();
      _Block_object_dispose(&v22, 8);
      _Unwind_Resume(ASAuthorizationErrorDomain_cold_1);
    }
    v17(a1, a2, a3, a4, a5, a6, a7, v16);
  }
  else
  {
    v19 = SO_LOG_AppSSOClientImpl();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:]();
    }

    if (v15)
    {
      uint64_t v20 = [getSOErrorHelperClass_4() silentInternalErrorWithMessage:@"AppSSOCore is not available"];
      (*((void (**)(id, void, uint64_t))v15 + 2))(v15, 0, v20);
    }
  }
}

uint64_t AppSSOCoreLibraryCore_0()
{
  if (!AppSSOCoreLibraryCore_frameworkLibrary_11) {
    AppSSOCoreLibraryCore_frameworkLibrary_11 = _sl_dlopen();
  }
  return AppSSOCoreLibraryCore_frameworkLibrary_11;
}

uint64_t __AppSSOCoreLibraryCore_block_invoke_11()
{
  uint64_t result = _sl_dlopen();
  AppSSOCoreLibraryCore_frameworkLibrary_11 = result;
  return result;
}

void *__getappSSO_initSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)AppSSOCoreLibrary_4();
  uint64_t result = dlsym(v2, "appSSO_init");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getappSSO_initSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AppSSOCoreLibrary_4()
{
  uint64_t v0 = AppSSOCoreLibraryCore_0();
  if (!v0)
  {
    long long v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *__getappSSO_willPerformSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)AppSSOCoreLibrary_4();
  uint64_t result = dlsym(v2, "appSSO_willPerform");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getappSSO_willPerformSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSOErrorHelperClass_block_invoke_7(uint64_t a1)
{
  AppSSOCoreLibrary_4();
  Class result = objc_getClass("SOErrorHelper");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSOErrorHelperClass_softClass_7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSOErrorHelperClass_block_invoke_cold_1();
    return (Class)__getappSSO_performResponseSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getappSSO_performResponseSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)AppSSOCoreLibrary_4();
  Class result = dlsym(v2, "appSSO_performResponse");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getappSSO_performResponseSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getappSSO_performResponseCredentialSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)AppSSOCoreLibrary_4();
  Class result = dlsym(v2, "appSSO_performResponseCredential");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getappSSO_performResponseCredentialSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getappSSO_willHandleSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)AppSSOCoreLibrary_4();
  Class result = dlsym(v2, "appSSO_willHandle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getappSSO_willHandleSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getappSSO_handleResponseSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)AppSSOCoreLibrary_4();
  Class result = dlsym(v2, "appSSO_handleResponse");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getappSSO_handleResponseSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getappSSO_handleResponseCredentialSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)AppSSOCoreLibrary_4();
  Class result = dlsym(v2, "appSSO_handleResponseCredential");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getappSSO_handleResponseCredentialSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getappSSO_handleResponseImpersonationCredentialSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)AppSSOCoreLibrary_4();
  Class result = dlsym(v2, "appSSO_handleResponseImpersonationCredential");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getappSSO_handleResponseImpersonationCredentialSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24);
  return result;
}

id SO_LOG_SOExtensionFinder()
{
  if (SO_LOG_SOExtensionFinder_once != -1) {
    dispatch_once(&SO_LOG_SOExtensionFinder_once, &__block_literal_global_14);
  }
  uint64_t v0 = (void *)SO_LOG_SOExtensionFinder_log;
  return v0;
}

id getSOErrorHelperClass_5()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSOErrorHelperClass_softClass_8;
  uint64_t v7 = getSOErrorHelperClass_softClass_8;
  if (!getSOErrorHelperClass_softClass_8)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSOErrorHelperClass_block_invoke_8;
    v3[3] = &unk_26432A2A8;
    v3[4] = &v4;
    __getSOErrorHelperClass_block_invoke_8((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2185EC73C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2185EC974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getSOErrorHelperClass_block_invoke_8(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AppSSOCoreLibraryCore_frameworkLibrary_12)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AppSSOCoreLibraryCore_block_invoke_12;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_26432AE10;
    uint64_t v6 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_12 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!AppSSOCoreLibraryCore_frameworkLibrary_12)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SOErrorHelper");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getSOErrorHelperClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSOErrorHelperClass_softClass_8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppSSOCoreLibraryCore_block_invoke_12()
{
  uint64_t result = _sl_dlopen();
  AppSSOCoreLibraryCore_frameworkLibrary_12 = result;
  return result;
}

uint64_t __getSOAuthorizationResultCoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SOExtensionServiceConnection initWithListenerEndpoint:](v0);
}

uint64_t __getSOInternalProtocolsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSOErrorHelperClass_block_invoke_cold_1(v0);
}

uint64_t __getSOErrorHelperClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SORemoteExtensionContext extensionAuthorizationRequestHandlerWithError:](v0);
}

uint64_t __getASAuthorizationProviderExtensionAuthorizationRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __30__SOExtension__setupExtension__block_invoke_2_cold_1(v0);
}

uint64_t __getSOAuthorizationParametersCoreClass_block_invoke_cold_1()
{
  int v0 = abort_report_np();
  return __56__SOExtensionManager_loadExtensionWithBundleIdentifier___block_invoke_cold_1(v0, v1, v2);
}

uint64_t __getSOUtilsClass_block_invoke_cold_1()
{
  int v0 = abort_report_np();
  return +[SOConfigurationManager defaultManager](v0);
}

uint64_t getASAuthorizationErrorDomain_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __81__SOAuthorizationRequest_presentAuthorizationViewControllerWithHints_completion___block_invoke_cold_1(v0);
}

uint64_t __getSOAuthorizationCredentialClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPOLoginManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getPOLoginManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[SOAuthorization canPerformAuthorizationWithURL:responseCode:](v0);
}

uint64_t __getSOAuthorizationCoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSOAuthorizationRequestParametersCoreClass_block_invoke_cold_1(v0);
}

uint64_t __getSOAuthorizationRequestParametersCoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSOAuthorizationCredentialCoreClass_block_invoke_cold_1(v0);
}

uint64_t __getSOAuthorizationCredentialCoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSOConfigurationClientClass_block_invoke_cold_1(v0);
}

uint64_t __getSOConfigurationClientClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSOUIAuthorizationViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getSOUIAuthorizationViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SOExtensionViewService connectToContextWithSessionID:completion:](v0);
}

uint64_t __getSOConfigurationVersionClass_block_invoke_cold_1()
{
  return __getSOConfigurationClass_block_invoke_cold_1();
}

uint64_t __getSOConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSOFullProfileClass_block_invoke_cold_1(v0);
}

uint64_t __getSOFullProfileClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __49__SOHostExtensionContext_remoteContextWithError___block_invoke_cold_1(v0);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x270EF2A20](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

CFTypeID SecKeyGetTypeID(void)
{
  return MEMORY[0x270EFDAA0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x270EE5648]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

void free(void *a1)
{
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA0]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
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

uint64_t rootless_check_datavault_flag()
{
  return MEMORY[0x270EDB270]();
}

uint64_t rootless_convert_to_datavault()
{
  return MEMORY[0x270EDB278]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}