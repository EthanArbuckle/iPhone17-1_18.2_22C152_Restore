void AFDispatchAsync(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void v7[4];
  id v8;

  v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __AFDispatchAsync_block_invoke;
  v7[3] = &unk_265247D10;
  v8 = v3;
  v4 = v3;
  v5 = a1;
  v6 = (void *)MEMORY[0x24C589840](v7);
  if (_block_count(void)::once_token != -1) {
    dispatch_once(&_block_count(void)::once_token, &__block_literal_global);
  }
  atomic_fetch_add((atomic_ullong *volatile)&_block_count(void)::count, 1uLL);
  dispatch_async(v5, v6);
}

void __AFDispatchAsync_block_invoke(uint64_t a1)
{
  if (_block_count(void)::once_token != -1) {
    dispatch_once(&_block_count(void)::once_token, &__block_literal_global);
  }
  atomic_fetch_add((atomic_ullong *volatile)&_block_count(void)::count, 0xFFFFFFFFFFFFFFFFLL);
}

void ___ZL12_block_countv_block_invoke()
{
}

void sub_248A81090(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_248A814B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_248A81C1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_248A82028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_248A8319C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void InputContextLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!InputContextLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __InputContextLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_265247EC0;
    uint64_t v3 = 0;
    InputContextLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!InputContextLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __InputContextLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  InputContextLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getSFSafariCreditCardStoreClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!SafariFoundationLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __SafariFoundationLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_265247EF8;
    uint64_t v6 = 0;
    SafariFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!SafariFoundationLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("SFSafariCreditCardStore");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getSFSafariCreditCardStoreClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSFSafariCreditCardStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SafariFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SafariFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getWBSCreditCardTypeLocalizedNameForGeneratingCardNamesSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)SafariCoreLibrary();
  uint64_t result = dlsym(v2, "WBSCreditCardTypeLocalizedNameForGeneratingCardNames");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWBSCreditCardTypeLocalizedNameForGeneratingCardNamesSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32)
                                                                                                  + 8)
                                                                                      + 24);
  return result;
}

uint64_t SafariCoreLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SafariCoreLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __SafariCoreLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_265247F10;
    uint64_t v5 = 0;
    SafariCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = SafariCoreLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!SafariCoreLibraryCore_frameworkLibrary)
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

uint64_t __SafariCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SafariCoreLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getWBSCreditCardTypeFromNumberSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)SafariCoreLibrary();
  uint64_t result = dlsym(v2, "WBSCreditCardTypeFromNumber");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWBSCreditCardTypeFromNumberSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  ManagedConfigurationLibrary();
  Class result = objc_getClass("MCProfileConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMCProfileConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMCProfileConnectionClass_block_invoke_cold_1();
    return (Class)ManagedConfigurationLibrary();
  }
  return result;
}

uint64_t ManagedConfigurationLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __ManagedConfigurationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_265247F28;
    uint64_t v5 = 0;
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = ManagedConfigurationLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
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

uint64_t __ManagedConfigurationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ManagedConfigurationLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)ManagedConfigurationLibrary();
  uint64_t result = dlsym(v2, "MCFeatureAuthenticationBeforeAutoFillRequired");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

Class __getLAContextClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!LocalAuthenticationLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __LocalAuthenticationLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_265247F40;
    uint64_t v6 = 0;
    LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!LocalAuthenticationLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("LAContext");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getLAContextClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getLAContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __LocalAuthenticationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LocalAuthenticationLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, v5, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_debug_impl(a1, v11, OS_LOG_TYPE_DEBUG, a4, &buf, 0xCu);
}

void sub_248A83F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSFSafariCredentialStoreClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSFSafariCredentialStoreClass_softClass;
  uint64_t v7 = getSFSafariCredentialStoreClass_softClass;
  if (!getSFSafariCredentialStoreClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSFSafariCredentialStoreClass_block_invoke;
    v3[3] = &unk_265247EA0;
    v3[4] = &v4;
    __getSFSafariCredentialStoreClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_248A843FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_248A85028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

id getSFAutoFillFeatureManagerClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSFAutoFillFeatureManagerClass_softClass;
  uint64_t v7 = getSFAutoFillFeatureManagerClass_softClass;
  if (!getSFAutoFillFeatureManagerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSFAutoFillFeatureManagerClass_block_invoke;
    v3[3] = &unk_265247EA0;
    v3[4] = &v4;
    __getSFAutoFillFeatureManagerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_248A85154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

id getSFAutoFillPasskeyClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSFAutoFillPasskeyClass_softClass;
  uint64_t v7 = getSFAutoFillPasskeyClass_softClass;
  if (!getSFAutoFillPasskeyClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSFAutoFillPasskeyClass_block_invoke;
    v3[3] = &unk_265247EA0;
    v3[4] = &v4;
    __getSFAutoFillPasskeyClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_248A85300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_248A85870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_248A86418(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose(&STACK[0x218], 8);
  _Unwind_Resume(a1);
}

id getAKPrivateEmailContextClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAKPrivateEmailContextClass_softClass;
  uint64_t v7 = getAKPrivateEmailContextClass_softClass;
  if (!getAKPrivateEmailContextClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAKPrivateEmailContextClass_block_invoke;
    v3[3] = &unk_265247EA0;
    v3[4] = &v4;
    __getAKPrivateEmailContextClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_248A868D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_248A86BF4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_248A87CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void __getSFAppAutoFillPasskeyProviderClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SFAppAutoFillPasskeyProvider");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSFAppAutoFillPasskeyProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSFAppAutoFillPasskeyProviderClass_block_invoke_cold_1();
    SafariFoundationLibrary();
  }
}

void SafariFoundationLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!SafariFoundationLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __SafariFoundationLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_265248180;
    uint64_t v3 = 0;
    SafariFoundationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!SafariFoundationLibraryCore_frameworkLibrary_0)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __SafariFoundationLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SafariFoundationLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getSFAppAutoFillOneTimeCodeProviderClass_block_invoke(uint64_t a1)
{
  SafariFoundationLibrary();
  Class result = objc_getClass("SFAppAutoFillOneTimeCodeProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSFAppAutoFillOneTimeCodeProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSFAppAutoFillOneTimeCodeProviderClass_block_invoke_cold_1();
    return (Class)__getSFSafariCredentialStoreClass_block_invoke(v3);
  }
  return result;
}

Class __getSFSafariCredentialStoreClass_block_invoke(uint64_t a1)
{
  SafariFoundationLibrary();
  Class result = objc_getClass("SFSafariCredentialStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSFSafariCredentialStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSFSafariCredentialStoreClass_block_invoke_cold_1();
    return (Class)__getSFAutoFillFeatureManagerClass_block_invoke(v3);
  }
  return result;
}

Class __getSFAutoFillFeatureManagerClass_block_invoke(uint64_t a1)
{
  SafariFoundationLibrary();
  Class result = objc_getClass("SFAutoFillFeatureManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSFAutoFillFeatureManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSFAutoFillFeatureManagerClass_block_invoke_cold_1();
    return (Class)__isSystemAutoFillBundle_block_invoke(v3);
  }
  return result;
}

uint64_t __isSystemAutoFillBundle_block_invoke()
{
  isSystemAutoFillBundle_autoFillPanelIdentifiers = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.AutoFillPanel", @"com.apple.AutoFillPanelService", @"com.apple.InputUI", 0);
  return MEMORY[0x270F9A758]();
}

Class __getSFSafariCredentialClass_block_invoke(uint64_t a1)
{
  SafariFoundationLibrary();
  Class result = objc_getClass("SFSafariCredential");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSFSafariCredentialClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSFSafariCredentialClass_block_invoke_cold_1();
    return __getSFAutoFillPasskeyClass_block_invoke(v3);
  }
  return result;
}

Class __getSFAutoFillPasskeyClass_block_invoke(uint64_t a1)
{
  SafariFoundationLibrary();
  Class result = objc_getClass("SFAutoFillPasskey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSFAutoFillPasskeyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSFAutoFillPasskeyClass_block_invoke_cold_1();
    return (Class)__getSFSuggestedUserProviderClass_block_invoke(v3);
  }
  return result;
}

Class __getSFSuggestedUserProviderClass_block_invoke(uint64_t a1)
{
  SafariFoundationLibrary();
  Class result = objc_getClass("SFSuggestedUserProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSFSuggestedUserProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSFSuggestedUserProviderClass_block_invoke_cold_1();
    return (Class)__getAKAccountManagerClass_block_invoke(v3);
  }
  return result;
}

void __getAKAccountManagerClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AKAccountManager");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAKAccountManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAKAccountManagerClass_block_invoke_cold_1();
    AuthKitLibrary();
  }
}

void AuthKitLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __AuthKitLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_265248198;
    uint64_t v3 = 0;
    AuthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __AuthKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AuthKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAKPrivateEmailControllerClass_block_invoke(uint64_t a1)
{
  AuthKitLibrary();
  Class result = objc_getClass("AKPrivateEmailController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAKPrivateEmailControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getAKPrivateEmailControllerClass_block_invoke_cold_1();
    return __getAKPrivateEmailContextClass_block_invoke(v3);
  }
  return result;
}

Class __getAKPrivateEmailContextClass_block_invoke(uint64_t a1)
{
  AuthKitLibrary();
  Class result = objc_getClass("AKPrivateEmailContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAKPrivateEmailContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getAKPrivateEmailContextClass_block_invoke_cold_1();
    return (Class)__getCSFFeatureManagerClass_block_invoke(v3);
  }
  return result;
}

Class __getCSFFeatureManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!CloudSubscriptionFeaturesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __CloudSubscriptionFeaturesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2652481B0;
    uint64_t v6 = 0;
    CloudSubscriptionFeaturesLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!CloudSubscriptionFeaturesLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("CSFFeatureManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getCSFFeatureManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCSFFeatureManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CloudSubscriptionFeaturesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CloudSubscriptionFeaturesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getMCProfileConnectionClass_block_invoke_0(uint64_t a1)
{
  ManagedConfigurationLibrary_0();
  Class result = objc_getClass("MCProfileConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMCProfileConnectionClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMCProfileConnectionClass_block_invoke_cold_1();
    return (Class)ManagedConfigurationLibrary_0();
  }
  return result;
}

uint64_t ManagedConfigurationLibrary_0()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __ManagedConfigurationLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_2652481C8;
    uint64_t v5 = 0;
    ManagedConfigurationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = ManagedConfigurationLibraryCore_frameworkLibrary_0;
  uint64_t v1 = (void *)v3[0];
  if (!ManagedConfigurationLibraryCore_frameworkLibrary_0)
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

uint64_t __ManagedConfigurationLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  ManagedConfigurationLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_block_invoke_0(uint64_t a1)
{
  long long v2 = (void *)ManagedConfigurationLibrary_0();
  uint64_t result = dlsym(v2, "MCFeatureAuthenticationBeforeAutoFillRequired");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24);
  return result;
}

Class __getLAContextClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!LocalAuthenticationLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __LocalAuthenticationLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2652481E0;
    uint64_t v6 = 0;
    LocalAuthenticationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!LocalAuthenticationLibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("LAContext");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getLAContextClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getLAContextClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __LocalAuthenticationLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  LocalAuthenticationLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0xCu);
}

id AFCredentialManagerOSLogFacility()
{
  if (AFCredentialManagerOSLogFacility_onceToken != -1) {
    dispatch_once(&AFCredentialManagerOSLogFacility_onceToken, &__block_literal_global_3);
  }
  uint64_t v0 = (void *)AFCredentialManagerOSLogFacility_logFacility;
  return v0;
}

uint64_t __AFCredentialManagerOSLogFacility_block_invoke()
{
  AFCredentialManagerOSLogFacility_logFacility = (uint64_t)os_log_create("com.apple.AutoFillCore", "AFCredentialManager");
  return MEMORY[0x270F9A758]();
}

id AFLocalizationManagerOSLogFacility()
{
  if (AFLocalizationManagerOSLogFacility_onceToken != -1) {
    dispatch_once(&AFLocalizationManagerOSLogFacility_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)AFLocalizationManagerOSLogFacility_logFacility;
  return v0;
}

uint64_t __AFLocalizationManagerOSLogFacility_block_invoke()
{
  AFLocalizationManagerOSLogFacility_logFacility = (uint64_t)os_log_create("com.apple.AutoFillCore", "AFLocalizationManager");
  return MEMORY[0x270F9A758]();
}

id AFSuggestionGenerationManagerOSLogFacility()
{
  if (AFSuggestionGenerationManagerOSLogFacility_onceToken != -1) {
    dispatch_once(&AFSuggestionGenerationManagerOSLogFacility_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)AFSuggestionGenerationManagerOSLogFacility_logFacility;
  return v0;
}

uint64_t __AFSuggestionGenerationManagerOSLogFacility_block_invoke()
{
  AFSuggestionGenerationManagerOSLogFacility_logFacility = (uint64_t)os_log_create("com.apple.AutoFillCore", "ProactiveQuickType");
  return MEMORY[0x270F9A758]();
}

uint64_t __getSFSafariCreditCardStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __get_ICProactiveTriggerClass_block_invoke_cold_1(v0);
}

uint64_t __getMCProfileConnectionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getLAContextClass_block_invoke_cold_1(v0);
}

uint64_t __getLAContextClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AFCredentialManager obtainApplicationIdentifierFromConnection:](v0);
}

uint64_t __getSFAppAutoFillPasskeyProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSFAppAutoFillOneTimeCodeProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getSFAppAutoFillOneTimeCodeProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSFSafariCredentialStoreClass_block_invoke_cold_1(v0);
}

uint64_t __getSFSafariCredentialStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSFAutoFillFeatureManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getSFAutoFillFeatureManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSFSafariCredentialClass_block_invoke_cold_1(v0);
}

uint64_t __getSFSafariCredentialClass_block_invoke_cold_1()
{
  return __getSFAutoFillPasskeyClass_block_invoke_cold_1();
}

uint64_t __getSFAutoFillPasskeyClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSFSuggestedUserProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getSFSuggestedUserProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAKAccountManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getAKAccountManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAKPrivateEmailControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getAKPrivateEmailControllerClass_block_invoke_cold_1()
{
  return __getAKPrivateEmailContextClass_block_invoke_cold_1();
}

uint64_t __getAKPrivateEmailContextClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCSFFeatureManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getCSFFeatureManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AFLocalizationManager accessibilityLabelsForSecureHeaders:secureContents:truncationSentinel:](v0);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x270F0CD10]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9280](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
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

void objc_enumerationMutation(id obj)
{
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}