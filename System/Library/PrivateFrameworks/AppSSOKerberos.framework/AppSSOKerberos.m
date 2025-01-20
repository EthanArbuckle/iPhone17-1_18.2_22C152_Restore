void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_8(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id SO_LOG_SOSmartcard()
{
  if (SO_LOG_SOSmartcard_once != -1) {
    dispatch_once(&SO_LOG_SOSmartcard_once, &__block_literal_global);
  }
  v0 = (void *)SO_LOG_SOSmartcard_log;
  return v0;
}

id SO_LOG_SOKerberosSettingsManager()
{
  if (SO_LOG_SOKerberosSettingsManager_once != -1) {
    dispatch_once(&SO_LOG_SOKerberosSettingsManager_once, &__block_literal_global_0);
  }
  v0 = (void *)SO_LOG_SOKerberosSettingsManager_log;
  return v0;
}

void sub_221307BF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SO_LOG_SOLDAPHelper()
{
  if (SO_LOG_SOLDAPHelper_once != -1) {
    dispatch_once(&SO_LOG_SOLDAPHelper_once, &__block_literal_global_1);
  }
  v0 = (void *)SO_LOG_SOLDAPHelper_log;
  return v0;
}

id SO_LOG_SOKerberosServer()
{
  if (SO_LOG_SOKerberosServer_once != -1) {
    dispatch_once(&SO_LOG_SOKerberosServer_once, &__block_literal_global_2);
  }
  v0 = (void *)SO_LOG_SOKerberosServer_log;
  return v0;
}

void sub_221309D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SO_LOG_SOADSiteDiscovery()
{
  if (SO_LOG_SOADSiteDiscovery_once != -1) {
    dispatch_once(&SO_LOG_SOADSiteDiscovery_once, &__block_literal_global_3);
  }
  v0 = (void *)SO_LOG_SOADSiteDiscovery_log;
  return v0;
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

void sub_22130A088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
}

void sub_22130A8D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id SO_LOG_SOKerberosRealmSettings()
{
  if (SO_LOG_SOKerberosRealmSettings_once != -1) {
    dispatch_once(&SO_LOG_SOKerberosRealmSettings_once, &__block_literal_global_4);
  }
  v0 = (void *)SO_LOG_SOKerberosRealmSettings_log;
  return v0;
}

void sub_22130D0E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22130D194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_22130D214(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22130D418(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22130D5E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22130D7C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22130D9A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22130DAC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SO_LOG_SOKeychainHelper()
{
  if (SO_LOG_SOKeychainHelper_once != -1) {
    dispatch_once(&SO_LOG_SOKeychainHelper_once, &__block_literal_global_5);
  }
  v0 = (void *)SO_LOG_SOKeychainHelper_log;
  return v0;
}

id SO_LOG_SOKerberosContext()
{
  if (SO_LOG_SOKerberosContext_once != -1) {
    dispatch_once(&SO_LOG_SOKerberosContext_once, &__block_literal_global_6);
  }
  v0 = (void *)SO_LOG_SOKerberosContext_log;
  return v0;
}

void sub_221310DF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221310EEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SO_LOG_SOAsynchronousLDAPOperation()
{
  if (SO_LOG_SOAsynchronousLDAPOperation_once != -1) {
    dispatch_once(&SO_LOG_SOAsynchronousLDAPOperation_once, &__block_literal_global_7);
  }
  v0 = (void *)SO_LOG_SOAsynchronousLDAPOperation_log;
  return v0;
}

id SO_LOG_SOKerberosExtensionProcess()
{
  if (SO_LOG_SOKerberosExtensionProcess_once != -1) {
    dispatch_once(&SO_LOG_SOKerberosExtensionProcess_once, &__block_literal_global_8);
  }
  v0 = (void *)SO_LOG_SOKerberosExtensionProcess_log;
  return v0;
}

void sub_2213136F4(_Unwind_Exception *a1)
{
}

void sub_221313AB0(_Unwind_Exception *a1)
{
}

void *__getASAuthorizationOperationLogoutSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AuthenticationServicesLibrary();
  result = dlsym(v2, "ASAuthorizationOperationLogout");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getASAuthorizationOperationLogoutSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
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
    long long v4 = xmmword_2645A2410;
    uint64_t v5 = 0;
    AuthenticationServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = AuthenticationServicesLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!AuthenticationServicesLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
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

void *__getASAuthorizationProviderAuthorizationOperationConfigurationRemovedSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AuthenticationServicesLibrary();
  uint64_t result = dlsym(v2, "ASAuthorizationProviderAuthorizationOperationConfigurationRemoved");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getASAuthorizationProviderAuthorizationOperationConfigurationRemovedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                                + 24);
  return result;
}

void *__getASAuthorizationOperationLoginSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AuthenticationServicesLibrary();
  uint64_t result = dlsym(v2, "ASAuthorizationOperationLogin");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getASAuthorizationOperationLoginSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id SO_LOG_SOKerberosHeimdalPluginSettings()
{
  if (SO_LOG_SOKerberosHeimdalPluginSettings_once != -1) {
    dispatch_once(&SO_LOG_SOKerberosHeimdalPluginSettings_once, &__block_literal_global_9);
  }
  uint64_t v0 = (void *)SO_LOG_SOKerberosHeimdalPluginSettings_log;
  return v0;
}

void sub_221318F68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SO_LOG_SOKerberosAuthentication()
{
  if (SO_LOG_SOKerberosAuthentication_once != -1) {
    dispatch_once(&SO_LOG_SOKerberosAuthentication_once, &__block_literal_global_140);
  }
  uint64_t v0 = (void *)SO_LOG_SOKerberosAuthentication_log;
  return v0;
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

void sub_22131A638(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22131A87C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22131B338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_22131BE04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SO_LOG_SONetworkIdentity()
{
  if (SO_LOG_SONetworkIdentity_once != -1) {
    dispatch_once(&SO_LOG_SONetworkIdentity_once, &__block_literal_global_11);
  }
  uint64_t v0 = (void *)SO_LOG_SONetworkIdentity_log;
  return v0;
}

void sub_22131C5E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22131CC50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

id SO_LOG_SOKerberosFileManager()
{
  if (SO_LOG_SOKerberosFileManager_once != -1) {
    dispatch_once(&SO_LOG_SOKerberosFileManager_once, &__block_literal_global_12);
  }
  uint64_t v0 = (void *)SO_LOG_SOKerberosFileManager_log;
  return v0;
}

id SO_LOG_SOKerberosHelper()
{
  if (SO_LOG_SOKerberosHelper_once != -1) {
    dispatch_once(&SO_LOG_SOKerberosHelper_once, &__block_literal_global_53);
  }
  uint64_t v0 = (void *)SO_LOG_SOKerberosHelper_log;
  return v0;
}

void sub_22131F71C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
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

id SO_LOG_SODNSSRVQuery()
{
  if (SO_LOG_SODNSSRVQuery_once != -1) {
    dispatch_once(&SO_LOG_SODNSSRVQuery_once, &__block_literal_global_14);
  }
  uint64_t v0 = (void *)SO_LOG_SODNSSRVQuery_log;
  return v0;
}

void sub_22131FC44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_2213201A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

uint64_t ndrdata_get_uint64(unsigned int *a1, void *a2)
{
  if (!a1) {
    return 1;
  }
  v3 = (void *)*((void *)a1 + 2);
  if (!v3) {
    return 1;
  }
  uint64_t v4 = *a1;
  if (!v4) {
    return 1;
  }
  uint64_t v5 = a1 + 2;
  uint64_t v6 = *((void *)a1 + 1);
  uint64_t result = 1;
  if (v6)
  {
    if (a1 + 20 <= &v5[2 * v4])
    {
      uint64_t result = 0;
      *a2 = *v3;
      *((void *)a1 + 2) = v3 + 1;
    }
  }
  return result;
}

uint64_t ndrdata_get_uint32(unsigned int *a1, _DWORD *a2)
{
  if (!a1) {
    return 1;
  }
  v3 = (_DWORD *)*((void *)a1 + 2);
  if (!v3) {
    return 1;
  }
  uint64_t v4 = *a1;
  if (!v4) {
    return 1;
  }
  uint64_t v5 = a1 + 2;
  uint64_t v6 = *((void *)a1 + 1);
  uint64_t result = 1;
  if (v6)
  {
    if (a1 + 12 <= &v5[2 * v4])
    {
      uint64_t result = 0;
      *a2 = *v3;
      *((void *)a1 + 2) = v3 + 1;
    }
  }
  return result;
}

uint64_t ndrdata_get_uint16(unsigned int *a1, _WORD *a2)
{
  if (!a1) {
    return 1;
  }
  v3 = (_WORD *)*((void *)a1 + 2);
  if (!v3) {
    return 1;
  }
  uint64_t v4 = *a1;
  if (!v4) {
    return 1;
  }
  uint64_t v5 = a1 + 2;
  uint64_t v6 = *((void *)a1 + 1);
  uint64_t result = 1;
  if (v6)
  {
    if (a1 + 8 <= &v5[2 * v4])
    {
      uint64_t result = 0;
      *a2 = *v3;
      *((void *)a1 + 2) = v3 + 1;
    }
  }
  return result;
}

uint64_t ndrdata_get_uint8(unsigned int *a1, unsigned char *a2)
{
  if (!a1) {
    return 1;
  }
  v3 = (unsigned char *)*((void *)a1 + 2);
  if (!v3) {
    return 1;
  }
  uint64_t v4 = *a1;
  if (!v4) {
    return 1;
  }
  uint64_t v5 = a1 + 2;
  uint64_t v6 = *((void *)a1 + 1);
  uint64_t result = 1;
  if (v6)
  {
    if (a1 + 6 <= &v5[2 * v4])
    {
      uint64_t result = 0;
      *a2 = *v3;
      ++*((void *)a1 + 2);
    }
  }
  return result;
}

uint64_t ndrdata_get_buffer(unsigned int *a1, void *__dst, size_t __n)
{
  if (!a1) {
    return 1;
  }
  uint64_t v4 = a1 + 4;
  v3 = (const void *)*((void *)a1 + 2);
  if (!v3) {
    return 1;
  }
  uint64_t v5 = *a1;
  if (!v5) {
    return 1;
  }
  uint64_t v6 = a1 + 2;
  if (!*((void *)a1 + 1)) {
    return 1;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if (__dst && __n)
  {
    if (&v4[__n] <= (void *)&v6[2 * v5])
    {
      uint64_t v8 = __n;
      memcpy(__dst, v3, __n);
      uint64_t result = 0;
      *v4 += v8;
      return result;
    }
    return 1;
  }
  return result;
}

uint64_t ndrdata_init(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *(void *)(a1 + 8) = a2;
      *(void *)(a1 + 16) = a2;
      *(_DWORD *)a1 = a3;
    }
  }
  return result;
}

void free_kerbvalidationinfo(void *a1)
{
  v2 = (void *)a1[9];
  if (v2)
  {
    free(v2);
    a1[9] = 0;
  }
  v3 = (void *)a1[13];
  if (v3)
  {
    free(v3);
    a1[13] = 0;
  }
  uint64_t v4 = (void *)a1[17];
  if (v4)
  {
    free(v4);
    a1[17] = 0;
  }
  uint64_t v5 = (void *)a1[21];
  if (v5)
  {
    free(v5);
    a1[21] = 0;
  }
  uint64_t v6 = (void *)a1[25];
  if (v6)
  {
    free(v6);
    a1[25] = 0;
  }
  v7 = (void *)a1[29];
  if (v7)
  {
    free(v7);
    a1[29] = 0;
  }
  uint64_t v8 = (void *)a1[37];
  if (v8)
  {
    free(v8);
    a1[37] = 0;
  }
  uint64_t v9 = (void *)a1[41];
  if (v9)
  {
    free(v9);
    a1[41] = 0;
  }
  uint64_t v10 = (void *)a1[33];
  if (v10)
  {
    free(v10);
    a1[33] = 0;
  }
}

uint64_t get_kerbvalidationinfo(uint64_t a1, int a2, uint64_t a3)
{
  memset(count, 0, sizeof(count));
  memset(v10, 0, sizeof(v10));
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = ndrdata_init((uint64_t)v10, a1, a2);
      if (result != 1)
      {
        uint64_t result = ndrdata_get_uint64((unsigned int *)v10, &count[1]);
        if (result != 1)
        {
          uint64_t result = ndrdata_get_uint64((unsigned int *)v10, &count[1]);
          if (result != 1)
          {
            uint64_t result = ndrdata_get_uint32((unsigned int *)v10, count);
            if (result != 1)
            {
              uint64_t result = ndrdata_get_uint64((unsigned int *)v10, (void *)a3);
              if (result != 1)
              {
                uint64_t result = ndrdata_get_uint64((unsigned int *)v10, (void *)(a3 + 8));
                if (result != 1)
                {
                  uint64_t result = ndrdata_get_uint64((unsigned int *)v10, (void *)(a3 + 16));
                  if (result != 1)
                  {
                    uint64_t result = ndrdata_get_uint64((unsigned int *)v10, (void *)(a3 + 24));
                    if (result != 1)
                    {
                      uint64_t result = ndrdata_get_uint64((unsigned int *)v10, (void *)(a3 + 32));
                      if (result != 1)
                      {
                        uint64_t result = ndrdata_get_uint64((unsigned int *)v10, (void *)(a3 + 40));
                        if (result != 1)
                        {
                          uint64_t result = get_unicode_string((uint64_t)v10, a3 + 48);
                          if (result != 1)
                          {
                            uint64_t result = get_unicode_string((uint64_t)v10, a3 + 80);
                            if (result != 1)
                            {
                              uint64_t result = get_unicode_string((uint64_t)v10, a3 + 112);
                              if (result != 1)
                              {
                                uint64_t result = get_unicode_string((uint64_t)v10, a3 + 144);
                                if (result != 1)
                                {
                                  uint64_t result = get_unicode_string((uint64_t)v10, a3 + 176);
                                  if (result != 1)
                                  {
                                    uint64_t result = get_unicode_string((uint64_t)v10, a3 + 208);
                                    if (result != 1)
                                    {
                                      uint64_t result = ndrdata_get_uint16((unsigned int *)v10, (_WORD *)(a3 + 240));
                                      if (result != 1)
                                      {
                                        uint64_t result = ndrdata_get_uint16((unsigned int *)v10, (_WORD *)(a3 + 242));
                                        if (result != 1)
                                        {
                                          uint64_t result = ndrdata_get_uint32((unsigned int *)v10, (_DWORD *)(a3 + 244));
                                          if (result != 1)
                                          {
                                            uint64_t result = ndrdata_get_uint32((unsigned int *)v10, (_DWORD *)(a3 + 248));
                                            if (result != 1)
                                            {
                                              uint64_t result = ndrdata_get_uint32((unsigned int *)v10, (_DWORD *)(a3 + 252));
                                              if (result != 1)
                                              {
                                                uint64_t result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                if (result != 1)
                                                {
                                                  uint64_t result = ndrdata_get_uint32((unsigned int *)v10, (_DWORD *)(a3 + 256));
                                                  if (result != 1)
                                                  {
                                                    uint64_t result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                    if (result != 1)
                                                    {
                                                      uint64_t result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                      if (result != 1)
                                                      {
                                                        uint64_t result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                        if (result != 1)
                                                        {
                                                          uint64_t result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                          if (result != 1)
                                                          {
                                                            uint64_t result = get_unicode_string((uint64_t)v10, a3 + 272);
                                                            if (result != 1)
                                                            {
                                                              uint64_t result = get_unicode_string((uint64_t)v10, a3 + 304);
                                                              if (result != 1)
                                                              {
                                                                uint64_t result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                if (result != 1)
                                                                {
                                                                  uint64_t result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                  if (result != 1)
                                                                  {
                                                                    uint64_t result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                    if (result != 1)
                                                                    {
                                                                      uint64_t result = ndrdata_get_uint32((unsigned int *)v10, (_DWORD *)(a3 + 336));
                                                                      if (result != 1)
                                                                      {
                                                                        uint64_t result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                        if (result != 1)
                                                                        {
                                                                          uint64_t result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                          if (result != 1)
                                                                          {
                                                                            uint64_t result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                            if (result != 1)
                                                                            {
                                                                              uint64_t result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                              if (result != 1)
                                                                              {
                                                                                uint64_t result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                                if (result != 1)
                                                                                {
                                                                                  uint64_t result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                                  if (result != 1)
                                                                                  {
                                                                                    uint64_t result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                                    if (result != 1)
                                                                                    {
                                                                                      uint64_t result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                                      if (result != 1)
                                                                                      {
                                                                                        uint64_t result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                                        if (result != 1)
                                                                                        {
                                                                                          uint64_t result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                                          if (result != 1)
                                                                                          {
                                                                                            uint64_t result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                                            if (result != 1)
                                                                                            {
                                                                                              uint64_t result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                                              if (result != 1)
                                                                                              {
                                                                                                uint64_t result = get_unicode_buffer((unsigned int *)v10, a3 + 48);
                                                                                                if (result != 1)
                                                                                                {
                                                                                                  uint64_t result = get_unicode_buffer((unsigned int *)v10, a3 + 80);
                                                                                                  if (result != 1)
                                                                                                  {
                                                                                                    uint64_t result = get_unicode_buffer((unsigned int *)v10, a3 + 112);
                                                                                                    if (result != 1)
                                                                                                    {
                                                                                                      uint64_t result = get_unicode_buffer((unsigned int *)v10, a3 + 144);
                                                                                                      if (result != 1)
                                                                                                      {
                                                                                                        uint64_t result = get_unicode_buffer((unsigned int *)v10, a3 + 176);
                                                                                                        if (result != 1)
                                                                                                        {
                                                                                                          uint64_t result = get_unicode_buffer((unsigned int *)v10, a3 + 208);
                                                                                                          if (result != 1)
                                                                                                          {
                                                                                                            uint64_t result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                                                            if (result != 1)
                                                                                                            {
                                                                                                              uint64_t v7 = count[0];
                                                                                                              if (count[0])
                                                                                                              {
                                                                                                                uint64_t v8 = (char *)malloc_type_calloc(count[0], 8uLL, 0x100004000313F17uLL);
                                                                                                                uint64_t v9 = 0;
                                                                                                                while (1)
                                                                                                                {
                                                                                                                  uint64_t result = ndrdata_get_uint32((unsigned int *)v10, &v8[v9]);
                                                                                                                  if (result == 1) {
                                                                                                                    break;
                                                                                                                  }
                                                                                                                  uint64_t result = ndrdata_get_uint32((unsigned int *)v10, &v8[v9 + 4]);
                                                                                                                  if (result == 1) {
                                                                                                                    break;
                                                                                                                  }
                                                                                                                  v9 += 8;
                                                                                                                  if (8 * v7 == v9)
                                                                                                                  {
                                                                                                                    *(void *)(a3 + 264) = v8;
                                                                                                                    goto LABEL_61;
                                                                                                                  }
                                                                                                                }
                                                                                                              }
                                                                                                              else
                                                                                                              {
LABEL_61:
                                                                                                                uint64_t result = get_unicode_buffer((unsigned int *)v10, a3 + 272);
                                                                                                                if (result != 1) {
                                                                                                                  return get_unicode_buffer((unsigned int *)v10, a3 + 304) == 1;
                                                                                                                }
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t get_unicode_string(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 16)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = ndrdata_get_uint16((unsigned int *)a1, (_WORD *)a2);
  if (result != 1)
  {
    uint64_t result = ndrdata_get_uint16((unsigned int *)a1, (_WORD *)(a2 + 2));
    if (result != 1)
    {
      return ndrdata_get_uint32((unsigned int *)a1, (_DWORD *)(a2 + 4));
    }
  }
  return result;
}

uint64_t get_unicode_buffer(unsigned int *a1, uint64_t a2)
{
  __int16 v11 = 0;
  v2 = (const void **)(a1 + 4);
  if (!*((void *)a1 + 2)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = ndrdata_get_uint32(a1, (_DWORD *)(a2 + 16));
  if (result != 1)
  {
    uint64_t result = ndrdata_get_uint32(a1, (_DWORD *)(a2 + 12));
    if (result != 1)
    {
      uint64_t result = ndrdata_get_uint32(a1, (_DWORD *)(a2 + 8));
      if (result != 1)
      {
        if (!*v2) {
          return 1;
        }
        uint64_t v6 = *a1;
        if (!v6 || !*((void *)a1 + 1)) {
          return 1;
        }
        int v7 = *(_DWORD *)(a2 + 8);
        if (v7)
        {
          int v8 = 2 * v7;
          if (&v2[v8] <= (const void **)&a1[2 * v6 + 2])
          {
            size_t v9 = v8;
            uint64_t v10 = malloc_type_calloc(1uLL, v8 | 1, 0xED4E4555uLL);
            *(void *)(a2 + 24) = v10;
            memcpy(v10, *v2, v9);
            void *v2 = (char *)*v2 + v9;
            if (*(unsigned char *)(a2 + 8)) {
              return ndrdata_get_uint16(a1, &v11);
            }
            else {
              return 0;
            }
          }
          return 1;
        }
        *(void *)(a2 + 24) = 0;
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x270EE5478](alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x270EE54A8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

gss_cred_id_t GSSCreateCredentialFromUUID(CFUUIDRef uuid)
{
  return (gss_cred_id_t)MEMORY[0x270EF2CC8](uuid);
}

CFErrorRef GSSCreateError(gss_const_OID mech, OM_uint32 major_status, OM_uint32 minor_status)
{
  return (CFErrorRef)MEMORY[0x270EF2CD0](mech, *(void *)&major_status, *(void *)&minor_status);
}

gss_name_t GSSCreateName(CFTypeRef name, gss_const_OID name_type, CFErrorRef *error)
{
  return (gss_name_t)MEMORY[0x270EF2CD8](name, name_type, error);
}

gss_name_t GSSCredentialCopyName(gss_cred_id_t cred)
{
  return (gss_name_t)MEMORY[0x270EF2CE0](cred);
}

CFUUIDRef GSSCredentialCopyUUID(gss_cred_id_t credential)
{
  return (CFUUIDRef)MEMORY[0x270EF2CE8](credential);
}

OM_uint32 GSSCredentialGetLifetime(gss_cred_id_t cred)
{
  return MEMORY[0x270EF2CF0](cred);
}

CFStringRef GSSNameCreateDisplayString(gss_name_t name)
{
  return (CFStringRef)MEMORY[0x270EF2CF8](name);
}

uint64_t HeimCredCopyAttributes()
{
  return MEMORY[0x270F39570]();
}

uint64_t HeimCredCopyQuery()
{
  return MEMORY[0x270F39580]();
}

uint64_t HeimCredCreate()
{
  return MEMORY[0x270F39588]();
}

uint64_t HeimCredDelete()
{
  return MEMORY[0x270F39590]();
}

uint64_t HeimCredDeleteQuery()
{
  return MEMORY[0x270F395A0]();
}

uint64_t HeimCredGetUUID()
{
  return MEMORY[0x270F395B8]();
}

uint64_t HeimCredSetAttribute()
{
  return MEMORY[0x270F395D0]();
}

uint64_t HeimCredSetImpersonateAuditToken()
{
  return MEMORY[0x270F395D8]();
}

uint64_t HeimCredSetImpersonateBundle()
{
  return MEMORY[0x270F395E0]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

CFDictionaryRef SCDynamicStoreCopyMultiple(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return (CFDictionaryRef)MEMORY[0x270F054F8](store, keys, patterns);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x270F05508](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x270F05540](allocator, domain, serviceID, entity);
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x270EFD650](allocator, protection, flags, error);
}

uint64_t SecCertificateCopyIssuerSummary()
{
  return MEMORY[0x270EFD748]();
}

uint64_t SecCertificateCopyNTPrincipalNames()
{
  return MEMORY[0x270EFD760]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x270EFD948](identityRef, certificateRef);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __ApplePrivate_gsskrb5_set_default_realm()
{
  return MEMORY[0x270EF2D18]();
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

uint64_t decode_Ticket()
{
  return MEMORY[0x270F39650]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
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

void free(void *a1)
{
}

uint64_t free_Ticket()
{
  return MEMORY[0x270F39658]();
}

OM_uint32 gss_aapl_change_password(gss_name_t name, gss_const_OID mech, CFDictionaryRef attributes, CFErrorRef *error)
{
  return MEMORY[0x270EF2D20](name, mech, attributes, error);
}

OM_uint32 gss_aapl_initial_cred(gss_name_t desired_name, gss_const_OID desired_mech, CFDictionaryRef attributes, gss_cred_id_t *output_cred_handle, CFErrorRef *error)
{
  return MEMORY[0x270EF2D28](desired_name, desired_mech, attributes, output_cred_handle, error);
}

OM_uint32 gss_acquire_cred(OM_uint32 *minor_status, gss_name_t desired_name, OM_uint32 time_req, gss_OID_set desired_mechs, gss_cred_usage_t cred_usage, gss_cred_id_t *output_cred_handle, gss_OID_set *actual_mechs, OM_uint32 *time_rec)
{
  return MEMORY[0x270EF2D30](minor_status, desired_name, *(void *)&time_req, desired_mechs, *(void *)&cred_usage, output_cred_handle, actual_mechs, time_rec);
}

OM_uint32 gss_add_oid_set_member(OM_uint32 *minor_status, gss_const_OID member_oid, gss_OID_set *oid_set)
{
  return MEMORY[0x270EF2D38](minor_status, member_oid, oid_set);
}

OM_uint32 gss_create_empty_oid_set(OM_uint32 *minor_status, gss_OID_set *oid_set)
{
  return MEMORY[0x270EF2D40](minor_status, oid_set);
}

OM_uint32 gss_destroy_cred(OM_uint32 *min_stat, gss_cred_id_t *cred_handle)
{
  return MEMORY[0x270EF2D58](min_stat, cred_handle);
}

OM_uint32 gss_import_name(OM_uint32 *minor_status, gss_buffer_t input_name_buffer, gss_const_OID input_name_type, gss_name_t *output_name)
{
  return MEMORY[0x270EF2D68](minor_status, input_name_buffer, input_name_type, output_name);
}

OM_uint32 gss_init_sec_context(OM_uint32 *minor_status, gss_cred_id_t initiator_cred_handle, gss_ctx_id_t *context_handle, gss_name_t target_name, gss_OID input_mech_type, OM_uint32 req_flags, OM_uint32 time_req, gss_channel_bindings_t input_chan_bindings, gss_buffer_t input_token, gss_OID *actual_mech_type, gss_buffer_t output_token, OM_uint32 *ret_flags, OM_uint32 *time_rec)
{
  return MEMORY[0x270EF2D70](minor_status, initiator_cred_handle, context_handle, target_name, input_mech_type, *(void *)&req_flags, *(void *)&time_req, input_chan_bindings);
}

OM_uint32 gss_inquire_cred(OM_uint32 *minor_status, gss_cred_id_t cred_handle, gss_name_t *name_ret, OM_uint32 *lifetime, gss_cred_usage_t *cred_usage, gss_OID_set *mechanisms)
{
  return MEMORY[0x270EF2D78](minor_status, cred_handle, name_ret, lifetime, cred_usage, mechanisms);
}

OM_uint32 gss_iter_creds(OM_uint32 *min_stat, OM_uint32 flags, gss_const_OID mech, void *useriter)
{
  return MEMORY[0x270EF2D88](min_stat, *(void *)&flags, mech, useriter);
}

OM_uint32 gss_release_buffer(OM_uint32 *minor_status, gss_buffer_t buffer)
{
  return MEMORY[0x270EF2DA8](minor_status, buffer);
}

OM_uint32 gss_release_cred(OM_uint32 *minor_status, gss_cred_id_t *cred_handle)
{
  return MEMORY[0x270EF2DB8](minor_status, cred_handle);
}

OM_uint32 gss_release_name(OM_uint32 *minor_status, gss_name_t *input_name)
{
  return MEMORY[0x270EF2DC0](minor_status, input_name);
}

OM_uint32 gss_release_oid_set(OM_uint32 *minor_status, gss_OID_set *set)
{
  return MEMORY[0x270EF2DC8](minor_status, set);
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return (char *)MEMORY[0x270ED9EB8](*(void *)&a1.s_addr);
}

uint64_t krb5_cc_clear_mcred()
{
  return MEMORY[0x270F39878]();
}

krb5_error_code krb5_cc_close(krb5_context context, krb5_ccache cache)
{
  return MEMORY[0x270F39880](context, cache);
}

krb5_error_code krb5_cc_get_principal(krb5_context context, krb5_ccache cache, krb5_principal *principal)
{
  return MEMORY[0x270F398E0](context, cache, principal);
}

uint64_t krb5_cc_resolve_by_uuid()
{
  return MEMORY[0x270F39928]();
}

krb5_error_code krb5_cc_retrieve_cred(krb5_context context, krb5_ccache cache, krb5_flags flags, krb5_creds *mcreds, krb5_creds *creds)
{
  return MEMORY[0x270F39930](context, cache, *(void *)&flags, mcreds, creds);
}

uint64_t krb5_data_free()
{
  return MEMORY[0x270F39A08]();
}

uint64_t krb5_data_zero()
{
  return MEMORY[0x270F39A10]();
}

uint64_t krb5_decrypt_ticket()
{
  return MEMORY[0x270F39A38]();
}

void krb5_free_context(krb5_context a1)
{
}

void krb5_free_cred_contents(krb5_context a1, krb5_creds *a2)
{
}

void krb5_free_creds(krb5_context a1, krb5_creds *a2)
{
}

void krb5_free_principal(krb5_context a1, krb5_principal a2)
{
}

void krb5_free_ticket(krb5_context a1, krb5_ticket *a2)
{
}

uint64_t krb5_get_creds()
{
  return MEMORY[0x270F39AE8]();
}

uint64_t krb5_get_creds_opt_add_options()
{
  return MEMORY[0x270F39AF0]();
}

uint64_t krb5_get_creds_opt_alloc()
{
  return MEMORY[0x270F39AF8]();
}

uint64_t krb5_get_creds_opt_free()
{
  return MEMORY[0x270F39B00]();
}

uint64_t krb5_get_creds_opt_set_impersonate()
{
  return MEMORY[0x270F39B08]();
}

uint64_t krb5_get_creds_opt_set_ticket()
{
  return MEMORY[0x270F39B10]();
}

const char *__cdecl krb5_get_error_message(krb5_context a1, krb5_error_code a2)
{
  return (const char *)MEMORY[0x270F39B28](a1, *(void *)&a2);
}

krb5_error_code krb5_get_init_creds_opt_alloc(krb5_context context, krb5_get_init_creds_opt **opt)
{
  return MEMORY[0x270F39B40](context, opt);
}

void krb5_get_init_creds_opt_free(krb5_context context, krb5_get_init_creds_opt *opt)
{
}

uint64_t krb5_get_init_creds_opt_set_default_flags()
{
  return MEMORY[0x270F39B58]();
}

void krb5_get_init_creds_opt_set_forwardable(krb5_get_init_creds_opt *opt, int forwardable)
{
}

uint64_t krb5_get_init_creds_opt_set_pac_request()
{
  return MEMORY[0x270F39B68]();
}

uint64_t krb5_get_init_creds_opt_set_win2k()
{
  return MEMORY[0x270F39B90]();
}

krb5_error_code krb5_get_init_creds_password(krb5_context context, krb5_creds *creds, krb5_principal client, char *password, krb5_prompter_fct prompter, void *data, krb5_deltat start_time, char *in_tkt_service, krb5_get_init_creds_opt *k5_gic_options)
{
  return MEMORY[0x270F39B98](context, creds, client, password, prompter, data, *(void *)&start_time, in_tkt_service);
}

krb5_error_code krb5_init_context(krb5_context *a1)
{
  return MEMORY[0x270F39BD0](a1);
}

uint64_t krb5_make_principal()
{
  return MEMORY[0x270F39CC8]();
}

uint64_t krb5_pac_free()
{
  return MEMORY[0x270F39CF0]();
}

uint64_t krb5_pac_get_buffer()
{
  return MEMORY[0x270F39CF8]();
}

uint64_t krb5_pac_parse()
{
  return MEMORY[0x270F39D00]();
}

uint64_t krb5_pac_verify()
{
  return MEMORY[0x270F39D08]();
}

krb5_error_code krb5_parse_name(krb5_context a1, const char *a2, krb5_principal *a3)
{
  return MEMORY[0x270F39D10](a1, a2, a3);
}

krb5_error_code krb5_parse_name_flags(krb5_context a1, const char *a2, int a3, krb5_principal *a4)
{
  return MEMORY[0x270F39D18](a1, a2, *(void *)&a3, a4);
}

uint64_t krb5_principal_get_realm()
{
  return MEMORY[0x270F39D38]();
}

uint64_t krb5_ticket_get_authorization_data_type()
{
  return MEMORY[0x270F39F28]();
}

uint64_t ldap_connection_add_credential()
{
  return MEMORY[0x270F0E430]();
}

uint64_t ldap_connection_create_with_hostname()
{
  return MEMORY[0x270F0E438]();
}

uint64_t ldap_connection_create_with_socket()
{
  return MEMORY[0x270F0E440]();
}

uint64_t ldap_connection_create_with_socket_and_hostname()
{
  return MEMORY[0x270F0E448]();
}

uint64_t ldap_connection_disconnect()
{
  return MEMORY[0x270F0E458]();
}

uint64_t ldap_connection_query_create()
{
  return MEMORY[0x270F0E460]();
}

uint64_t ldap_connection_set_disconnect_handler()
{
  return MEMORY[0x270F0E470]();
}

uint64_t ldap_connection_set_source_application_by_bundle()
{
  return MEMORY[0x270F0E478]();
}

uint64_t ldap_connection_set_tls()
{
  return MEMORY[0x270F0E480]();
}

uint64_t ldap_connection_start()
{
  return MEMORY[0x270F0E488]();
}

uint64_t ldap_operation_copy_error_string()
{
  return MEMORY[0x270F0E498]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

uint64_t ne_session_cancel()
{
  return MEMORY[0x270EDA628]();
}

uint64_t ne_session_create()
{
  return MEMORY[0x270EDA630]();
}

uint64_t ne_session_get_status()
{
  return MEMORY[0x270EDA640]();
}

uint64_t ne_session_release()
{
  return MEMORY[0x270EDA650]();
}

uint64_t ne_session_set_event_handler()
{
  return MEMORY[0x270EDA660]();
}

uint64_t ne_session_start()
{
  return MEMORY[0x270EDA670]();
}

uint64_t ne_session_status_to_string()
{
  return MEMORY[0x270EDA678]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x270EDA798](*(void *)&token, state64);
}

uint64_t nw_array_apply()
{
  return MEMORY[0x270EF7A60]();
}

void nw_connection_cancel(nw_connection_t connection)
{
}

uint64_t nw_connection_copy_connected_remote_endpoint()
{
  return MEMORY[0x270EF7B68]();
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x270EF7BA8](endpoint, parameters);
}

uint64_t nw_connection_get_connected_socket()
{
  return MEMORY[0x270EF7BF0]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
}

void nw_connection_start(nw_connection_t connection)
{
}

uint64_t nw_endpoint_copy_parent_endpoint()
{
  return MEMORY[0x270EF7E68]();
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x270EF7EB0](hostname, port);
}

uint64_t nw_endpoint_create_host_with_numeric_port()
{
  return MEMORY[0x270EF7EB8]();
}

uint64_t nw_endpoint_create_srv()
{
  return MEMORY[0x270EF7EC8]();
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x270EF7F30](endpoint);
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return MEMORY[0x270EF7F48](endpoint);
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x270EF7F68](endpoint);
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x270EF8380](interface);
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return MEMORY[0x270EF83A0](interface);
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x270EF8518]();
}

uint64_t nw_parameters_create_legacy_tcp_socket()
{
  return MEMORY[0x270EF8538]();
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x270EF8550](configure_tls, configure_tcp);
}

uint64_t nw_parameters_set_required_netagent_classes()
{
  return MEMORY[0x270EF8728]();
}

uint64_t nw_parameters_set_source_application()
{
  return MEMORY[0x270EF8748]();
}

uint64_t nw_parameters_set_source_application_by_bundle_id()
{
  return MEMORY[0x270EF8758]();
}

uint64_t nw_parameters_set_traffic_class()
{
  return MEMORY[0x270EF8770]();
}

uint64_t nw_path_copy_interface()
{
  return MEMORY[0x270EF87B8]();
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x270EF87E8]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x270EF8810]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x270EF8928](path);
}

uint64_t nw_path_get_vpn_config_id()
{
  return MEMORY[0x270EF8948]();
}

uint64_t nw_path_is_per_app_vpn()
{
  return MEMORY[0x270EF89D0]();
}

uint64_t nw_resolver_cancel()
{
  return MEMORY[0x270EF93A8]();
}

uint64_t nw_resolver_create_with_path()
{
  return MEMORY[0x270EF9480]();
}

uint64_t nw_resolver_set_update_handler()
{
  return MEMORY[0x270EF9498]();
}

uint64_t nwi_ifstate_get_flags()
{
  return MEMORY[0x270EDA7B0]();
}

uint64_t nwi_ifstate_get_signature()
{
  return MEMORY[0x270EDA7D8]();
}

uint64_t nwi_ifstate_get_vpn_server()
{
  return MEMORY[0x270EDA7E0]();
}

uint64_t nwi_state_copy()
{
  return MEMORY[0x270EDA7E8]();
}

uint64_t nwi_state_get_ifstate()
{
  return MEMORY[0x270EDA800]();
}

uint64_t nwi_state_release()
{
  return MEMORY[0x270EDA820]();
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

void objc_enumerationMutation(id obj)
{
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
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

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}