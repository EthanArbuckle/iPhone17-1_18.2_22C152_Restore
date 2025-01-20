id Logger()
{
  void *v0;
  uint64_t vars8;

  if (Logger___onceToken != -1) {
    dispatch_once(&Logger___onceToken, &__block_literal_global);
  }
  v0 = (void *)Logger___migrationLogger;
  return v0;
}

uint64_t __Logger_block_invoke()
{
  Logger___migrationLogger = (uint64_t)os_log_create("com.apple.InternationalSupport", "IPWatchLocaleController");
  return MEMORY[0x1F41817F8]();
}

id MigrationLogger()
{
  if (MigrationLogger___onceToken != -1) {
    dispatch_once(&MigrationLogger___onceToken, &__block_literal_global_0);
  }
  v0 = (void *)MigrationLogger___migrationLogger;
  return v0;
}

uint64_t __MigrationLogger_block_invoke()
{
  MigrationLogger___migrationLogger = (uint64_t)os_log_create("com.apple.InternationalSupport", "InternationalSupportMigrator");
  return MEMORY[0x1F41817F8]();
}

id getUMUserManagerClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getUMUserManagerClass_softClass;
  uint64_t v7 = getUMUserManagerClass_softClass;
  if (!getUMUserManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getUMUserManagerClass_block_invoke;
    v3[3] = &unk_1E63BFCF0;
    v3[4] = &v4;
    __getUMUserManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BECAB990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BECABBFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUMUserManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!UserManagementLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __UserManagementLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E63BFD10;
    uint64_t v6 = 0;
    UserManagementLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!UserManagementLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("UMUserManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getUMUserManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getUMUserManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __UserManagementLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UserManagementLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getAKAppleIDAuthenticationControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AuthKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E63BFD48;
    uint64_t v6 = 0;
    AuthKitLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!AuthKitLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("AKAppleIDAuthenticationController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAKAppleIDAuthenticationControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AuthKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AuthKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1BECACD2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void IPLoadUIKitFramework()
{
  if (IPLoadUIKitFramework_onceToken != -1) {
    dispatch_once(&IPLoadUIKitFramework_onceToken, &__block_literal_global_1);
  }
}

void *__IPLoadUIKitFramework_block_invoke()
{
  uint64_t result = dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 1);
  uiKitFramework = (uint64_t)result;
  return result;
}

Class IPUIKeyboardInputModeController()
{
  if (IPLoadUIKitFramework_onceToken != -1) {
    dispatch_once(&IPLoadUIKitFramework_onceToken, &__block_literal_global_1);
  }
  return NSClassFromString(&cfstr_Uikeyboardinpu.isa);
}

Class IPUIKeyboardPreferencesController()
{
  if (IPLoadUIKitFramework_onceToken != -1) {
    dispatch_once(&IPLoadUIKitFramework_onceToken, &__block_literal_global_1);
  }
  return NSClassFromString(&cfstr_Uikeyboardpref.isa);
}

id IPUIKeyboardInputModeGetIdentifierWithKeyboardLayouts(void *a1)
{
  uint64_t v1 = IPLoadUIKitFramework_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&IPLoadUIKitFramework_onceToken, &__block_literal_global_1);
  }
  v3 = (void (*)(id))dlsym((void *)uiKitFramework, "UIKeyboardInputModeGetIdentifierWithKeyboardLayouts");
  uint64_t v4 = v3(v2);

  return v4;
}

id IPUIKeyboardInputModeGetBaseLanguage(void *a1)
{
  uint64_t v1 = IPLoadUIKitFramework_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&IPLoadUIKitFramework_onceToken, &__block_literal_global_1);
  }
  v3 = (void (*)(id))dlsym((void *)uiKitFramework, "UIKeyboardInputModeGetBaseLanguage");
  uint64_t v4 = v3(v2);

  return v4;
}

id IPUIKeyboardCanonicalInputModeName(void *a1)
{
  uint64_t v1 = IPLoadUIKitFramework_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&IPLoadUIKitFramework_onceToken, &__block_literal_global_1);
  }
  v3 = (void (*)(id))dlsym((void *)uiKitFramework, "UIKeyboardCanonicalInputModeName");
  uint64_t v4 = v3(v2);

  return v4;
}

id IPUIKeyboardInputModeGetLanguageWithRegion(void *a1)
{
  uint64_t v1 = IPLoadUIKitFramework_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&IPLoadUIKitFramework_onceToken, &__block_literal_global_1);
  }
  v3 = (void (*)(id))dlsym((void *)uiKitFramework, "UIKeyboardInputModeGetLanguageWithRegion");
  uint64_t v4 = v3(v2);

  return v4;
}

id IPUIKeyboardInputModeGetNormalizedIdentifier(void *a1)
{
  uint64_t v1 = IPLoadUIKitFramework_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&IPLoadUIKitFramework_onceToken, &__block_literal_global_1);
  }
  v3 = (void (*)(id))dlsym((void *)uiKitFramework, "UIKeyboardInputModeGetNormalizedIdentifier");
  uint64_t v4 = v3(v2);

  return v4;
}

void *IPUIKeyboardInputMode_Intl()
{
  if (IPLoadUIKitFramework_onceToken != -1) {
    dispatch_once(&IPLoadUIKitFramework_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)uiKitFramework;
  return dlsym(v0, "UIKeyboardInputMode_intl");
}

void sub_1BECAE5F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BECB0880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getNRPairedDeviceRegistryClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getNRPairedDeviceRegistryClass_softClass;
  uint64_t v7 = getNRPairedDeviceRegistryClass_softClass;
  if (!getNRPairedDeviceRegistryClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getNRPairedDeviceRegistryClass_block_invoke;
    v3[3] = &unk_1E63BFCF0;
    v3[4] = &v4;
    __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BECB0970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getNPSManagerClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getNPSManagerClass_softClass;
  uint64_t v7 = getNPSManagerClass_softClass;
  if (!getNPSManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getNPSManagerClass_block_invoke;
    v3[3] = &unk_1E63BFCF0;
    v3[4] = &v4;
    __getNPSManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BECB0A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BECB0BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNRPairedDeviceRegistryClass_block_invoke(uint64_t a1)
{
  NanoRegistryLibrary();
  Class result = objc_getClass("NRPairedDeviceRegistry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getNRPairedDeviceRegistryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getNRPairedDeviceRegistryClass_block_invoke_cold_1();
    return (Class)NanoRegistryLibrary();
  }
  return result;
}

uint64_t NanoRegistryLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __NanoRegistryLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E63BFE78;
    uint64_t v5 = 0;
    NanoRegistryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = NanoRegistryLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!NanoRegistryLibraryCore_frameworkLibrary)
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

uint64_t __NanoRegistryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoRegistryLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getNRWatchOSVersionForRemoteDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)NanoRegistryLibrary();
  uint64_t result = dlsym(v2, "NRWatchOSVersionForRemoteDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __getNPSManagerClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("NPSManager");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getNPSManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getNPSManagerClass_block_invoke_cold_1();
    NanoPreferencesSyncLibrary();
  }
}

void NanoPreferencesSyncLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __NanoPreferencesSyncLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E63BFE90;
    uint64_t v3 = 0;
    NanoPreferencesSyncLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __NanoPreferencesSyncLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoPreferencesSyncLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getPSIsNanoMirroringDomainSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!PreferencesLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __PreferencesLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E63BFEA8;
    uint64_t v7 = 0;
    PreferencesLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    long long v2 = (void *)PreferencesLibraryCore_frameworkLibrary;
    if (PreferencesLibraryCore_frameworkLibrary)
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
  long long v2 = (void *)PreferencesLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "PSIsNanoMirroringDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPSIsNanoMirroringDomainSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PreferencesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PreferencesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getNPSDomainAccessorClass_block_invoke(uint64_t a1)
{
  NanoPreferencesSyncLibrary();
  Class result = objc_getClass("NPSDomainAccessor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getNPSDomainAccessorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getNPSDomainAccessorClass_block_invoke_cold_1();
    return (Class)__32__IntlUtility_sharedIntlUtility__block_invoke(v3);
  }
  return result;
}

void sub_1BECB2080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
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

void sub_1BECB23E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _isChineseLanguageCode(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"zh"] & 1) != 0
    || ([v1 isEqualToString:@"yue"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"wuu"];
  }

  return v2;
}

void sub_1BECB4F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BECB5758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNRPairedDeviceRegistryClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!NanoRegistryLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __NanoRegistryLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E63C00B0;
    uint64_t v6 = 0;
    NanoRegistryLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!NanoRegistryLibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("NRPairedDeviceRegistry");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getNRPairedDeviceRegistryClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getNRPairedDeviceRegistryClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __NanoRegistryLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  NanoRegistryLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_1BECB654C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void IP_hashKeyValue(CC_SHA1_CTX *a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  IP_hashString(a1, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    uint64_t v7 = [v6 allKeys];
    uint64_t v8 = [v7 sortedArrayUsingSelector:sel_compare_];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          IP_hashString(a1, v14);
          uint64_t v15 = (void *)MEMORY[0x1E4F28DB0];
          v16 = objc_msgSend(v6, "objectForKeyedSubscript:", v14, (void)v22);
          v17 = [v15 archivedDataWithRootObject:v16 requiringSecureCoding:0 error:0];

          id v18 = v17;
          CC_SHA1_Update(a1, (const void *)[v18 bytes], objc_msgSend(v18, "length"));
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:0 error:0];
    CC_SHA1_Update(a1, (const void *)[v6 bytes], objc_msgSend(v6, "length"));
LABEL_13:

    goto LABEL_14;
  }
  id v19 = v5;
  v20 = (const void *)[v19 bytes];
  CC_LONG v21 = [v19 length];

  CC_SHA1_Update(a1, v20, v21);
LABEL_14:
}

uint64_t IP_hashString(CC_SHA1_CTX *a1, id a2)
{
  uint64_t v3 = (const char *)[a2 UTF8String];
  CC_LONG v4 = strlen(v3);
  return CC_SHA1_Update(a1, v3, v4);
}

uint64_t sub_1BECBC830()
{
  uint64_t v0 = sub_1BECBF950();
  uint64_t v2 = v1;
  uint64_t v3 = sub_1BECBF950();
  _sSo8NSLocaleC15IntlPreferencesE17_sameLocalizationySbSS_SStFZ_0(v0, v2, v3, v4);
  LOBYTE(v0) = v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t sub_1BECBC8A0(uint64_t a1, void (*a2)(char *, uint64_t), uint64_t a3, char *a4)
{
  v161 = a4;
  uint64_t v157 = sub_1BECBF810();
  uint64_t v160 = *(void *)(v157 - 8);
  ((void (*)(void))MEMORY[0x1F4188790])();
  v129 = (char *)&v126 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v154 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1317C8);
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v155 = (uint64_t)&v126 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1317E8);
  ((void (*)(void))MEMORY[0x1F4188790])();
  v151 = (char *)&v126 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = sub_1BECBF8F0();
  uint64_t v143 = *(void *)(v144 - 8);
  ((void (*)(void))MEMORY[0x1F4188790])();
  v142 = (char *)&v126 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v165 = sub_1BECBF900();
  uint64_t v168 = *(void *)(v165 - 8);
  ((void (*)(void))MEMORY[0x1F4188790])();
  v164 = (char *)&v126 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1317D0);
  uint64_t v12 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v130 = (uint64_t)&v126 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v158 = (uint64_t)&v126 - v15;
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  uint64_t v159 = (uint64_t)&v126 - v17;
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  v149 = (char *)&v126 - v19;
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  uint64_t v156 = (uint64_t)&v126 - v21;
  MEMORY[0x1F4188790](v20);
  uint64_t v163 = (uint64_t)&v126 - v22;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1317C0);
  MEMORY[0x1F4188790](v23 - 8);
  v139 = (char *)&v126 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1317F0);
  MEMORY[0x1F4188790](v25 - 8);
  v131 = (char *)&v126 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = sub_1BECBF7C0();
  v134 = *(void **)(v135 - 8);
  MEMORY[0x1F4188790](v135);
  v128 = (char *)&v126 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1317F8);
  uint64_t v29 = v28 - 8;
  MEMORY[0x1F4188790](v28);
  v133 = (char *)&v126 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA131800);
  uint64_t v32 = MEMORY[0x1F4188790](v31 - 8);
  v141 = (char *)&v126 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = MEMORY[0x1F4188790](v32);
  uint64_t v137 = (uint64_t)&v126 - v35;
  uint64_t v36 = MEMORY[0x1F4188790](v34);
  v132 = (char *)&v126 - v37;
  MEMORY[0x1F4188790](v36);
  v39 = (char *)&v126 - v38;
  uint64_t v40 = sub_1BECBF8C0();
  uint64_t v41 = *(void *)(v40 - 8);
  uint64_t v42 = MEMORY[0x1F4188790](v40);
  v145 = (char *)&v126 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = MEMORY[0x1F4188790](v42);
  v140 = (char *)&v126 - v45;
  uint64_t v46 = MEMORY[0x1F4188790](v44);
  v138 = (char *)&v126 - v47;
  uint64_t v48 = MEMORY[0x1F4188790](v46);
  v162 = (char *)&v126 - v49;
  uint64_t v50 = MEMORY[0x1F4188790](v48);
  v52 = (char *)&v126 - v51;
  MEMORY[0x1F4188790](v50);
  v54 = (char *)&v126 - v53;
  uint64_t v153 = sub_1BECBF780();
  uint64_t v152 = *(void *)(v153 - 8);
  uint64_t v55 = MEMORY[0x1F4188790](v153);
  v150 = (char *)&v126 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v55);
  v58 = (char *)&v126 - v57;
  swift_bridgeObjectRetain();
  uint64_t v146 = a1;
  v147 = a2;
  sub_1BECBF730();
  v59 = self;
  uint64_t v148 = a3;
  v60 = (void *)sub_1BECBF940();
  id v61 = objc_msgSend(v59, sel_normalizedLanguageIDFromString_, v60);

  sub_1BECBF950();
  v62 = v54;
  uint64_t v63 = (uint64_t)v39;
  uint64_t v64 = (uint64_t)v133;
  sub_1BECBF850();
  v65 = v58;
  uint64_t v66 = (uint64_t)v132;
  sub_1BECBF720();
  sub_1BECBF860();
  uint64_t v136 = v41;
  uint64_t v67 = v41;
  v68 = v134;
  v69 = *(void (**)(char *, uint64_t))(v67 + 8);
  uint64_t v169 = v40;
  uint64_t v70 = v40;
  uint64_t v71 = v135;
  v166 = v69;
  uint64_t v167 = v67 + 8;
  v69(v52, v70);
  sub_1BECBF860();
  uint64_t v72 = v64 + *(int *)(v29 + 56);
  sub_1BECBF214(v63, v64, &qword_1EA131800);
  sub_1BECBF214(v66, v72, &qword_1EA131800);
  v73 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v68[6];
  if (v73(v64, 1, v71) == 1)
  {
    sub_1BECBF278(v66, &qword_1EA131800);
    sub_1BECBF278(v63, &qword_1EA131800);
    v74 = v65;
    if (v73(v72, 1, v71) == 1)
    {
      sub_1BECBF278(v64, &qword_1EA131800);
      goto LABEL_9;
    }
  }
  else
  {
    sub_1BECBF214(v64, v137, &qword_1EA131800);
    if (v73(v72, 1, v71) != 1)
    {
      v75 = (void (*)(char *, uint64_t, uint64_t))v68[4];
      uint64_t v127 = v63;
      v76 = v128;
      v75(v128, v72, v71);
      sub_1BECBF2D4(&qword_1EA131808, MEMORY[0x1E4F279D8]);
      uint64_t v77 = v137;
      char v78 = sub_1BECBF930();
      v79 = (void (*)(char *, uint64_t))v68[1];
      v79(v76, v71);
      sub_1BECBF278(v66, &qword_1EA131800);
      sub_1BECBF278(v127, &qword_1EA131800);
      v79((char *)v77, v71);
      sub_1BECBF278(v64, &qword_1EA131800);
      v74 = v65;
      if (v78) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    sub_1BECBF278(v66, &qword_1EA131800);
    sub_1BECBF278(v63, &qword_1EA131800);
    ((void (*)(uint64_t, uint64_t))v68[1])(v137, v71);
    v74 = v65;
  }
  sub_1BECBF278(v64, &qword_1EA1317F8);
LABEL_8:
  uint64_t v80 = sub_1BECBF7D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v80 - 8) + 56))(v131, 1, 1, v80);
  sub_1BECBF740();
LABEL_9:
  uint64_t v81 = sub_1BECBF840();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v81 - 8) + 56))(v139, 1, 1, v81);
  sub_1BECBF770();
  swift_bridgeObjectRetain();
  v82 = v164;
  sub_1BECBF7A0();
  uint64_t v83 = v163;
  sub_1BECBF830();
  v84 = *(void (**)(char *, uint64_t))(v168 + 8);
  v168 += 8;
  v147 = v84;
  v84(v82, v165);
  v85 = *(void (**)(char *, char *, uint64_t))(v136 + 16);
  v86 = v162;
  uint64_t v87 = v169;
  v85(v162, v62, v169);
  uint64_t v88 = v156;
  sub_1BECBF214(v83, v156, &qword_1EA1317D0);
  sub_1BECBF890();
  v85(v138, v86, v87);
  v89 = v142;
  sub_1BECBF8D0();
  sub_1BECBF8E0();
  (*(void (**)(char *, uint64_t))(v143 + 8))(v89, v144);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v91 = (void *)sub_1BECBF940();
  v92 = (void *)sub_1BECBF940();
  swift_bridgeObjectRelease();
  LOBYTE(v85) = objc_msgSend(ObjCClassFromMetadata, sel__language_usesSameLocalizationAs_, v91, v92);

  sub_1BECBF214(v83, v88, &qword_1EA1317D0);
  if ((v85 & 1) == 0)
  {
    sub_1BECBF760();
    sub_1BECBF880();
  }
  v93 = (void (*)(char *, void))sub_1BECBF710();
  sub_1BECBF890();
  v93(v170, 0);
  uint64_t v94 = v160;
  sub_1BECBF860();
  v95 = (void (*)(char *, void))sub_1BECBF710();
  sub_1BECBF870();
  v95(v170, 0);
  v161 = v62;
  sub_1BECBF8A0();
  v96 = (void (*)(char *, void))sub_1BECBF710();
  sub_1BECBF8B0();
  v96(v170, 0);
  v97 = v140;
  sub_1BECBF720();
  uint64_t v98 = (uint64_t)v149;
  sub_1BECBF880();
  v166(v97, v169);
  v99 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v94 + 48);
  uint64_t v100 = v157;
  LODWORD(v97) = v99(v98, 1, v157);
  sub_1BECBF278(v98, &qword_1EA1317D0);
  if (v97 == 1)
  {
    sub_1BECBF800();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v94 + 56))(v88, 0, 1, v100);
    v101 = (void (*)(char *, void))sub_1BECBF710();
    sub_1BECBF890();
    v101(v170, 0);
  }
  uint64_t v102 = v159;
  sub_1BECBF750();
  v103 = v145;
  sub_1BECBF720();
  uint64_t v104 = v158;
  sub_1BECBF880();
  v166(v103, v169);
  uint64_t v105 = v155;
  uint64_t v106 = v155 + *(int *)(v154 + 48);
  sub_1BECBF214(v102, v155, &qword_1EA1317D0);
  sub_1BECBF214(v104, v106, &qword_1EA1317D0);
  if (v99(v105, 1, v100) == 1)
  {
    sub_1BECBF278(v104, &qword_1EA1317D0);
    sub_1BECBF278(v102, &qword_1EA1317D0);
    int v107 = v99(v106, 1, v100);
    v108 = v161;
    if (v107 == 1)
    {
      sub_1BECBF278(v105, &qword_1EA1317D0);
      uint64_t v109 = v160;
      uint64_t v110 = v157;
LABEL_20:
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v109 + 56))(v88, 1, 1, v110);
      sub_1BECBF760();
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  uint64_t v111 = v130;
  sub_1BECBF214(v105, v130, &qword_1EA1317D0);
  if (v99(v106, 1, v100) == 1)
  {
    sub_1BECBF278(v158, &qword_1EA1317D0);
    sub_1BECBF278(v159, &qword_1EA1317D0);
    (*(void (**)(uint64_t, uint64_t))(v160 + 8))(v111, v100);
    v108 = v161;
LABEL_18:
    sub_1BECBF278(v105, &qword_1EA1317C8);
    goto LABEL_21;
  }
  uint64_t v109 = v160;
  v112 = v129;
  (*(void (**)(char *, uint64_t, uint64_t))(v160 + 32))(v129, v106, v100);
  sub_1BECBF2D4(&qword_1EA1317D8, MEMORY[0x1E4F27A00]);
  char v113 = sub_1BECBF930();
  v114 = *(void (**)(char *, uint64_t))(v109 + 8);
  v115 = v112;
  uint64_t v88 = v156;
  v114(v115, v100);
  sub_1BECBF278(v158, &qword_1EA1317D0);
  sub_1BECBF278(v159, &qword_1EA1317D0);
  v114((char *)v111, v100);
  sub_1BECBF278(v105, &qword_1EA1317D0);
  uint64_t v110 = v100;
  v108 = v161;
  if (v113) {
    goto LABEL_20;
  }
LABEL_21:
  v116 = self;
  uint64_t v117 = v152;
  uint64_t v118 = v153;
  (*(void (**)(char *, char *, uint64_t))(v152 + 16))(v150, v74, v153);
  v119 = v164;
  sub_1BECBF790();
  sub_1BECBF7B0();
  v147(v119, v165);
  v120 = (void *)sub_1BECBF940();
  swift_bridgeObjectRelease();
  id v121 = objc_msgSend(v116, sel_canonicalLocaleIdentifierFromString_, v120);

  uint64_t v122 = sub_1BECBF950();
  uint64_t v123 = v169;
  v124 = v166;
  v166(v162, v169);
  sub_1BECBF278(v163, &qword_1EA1317D0);
  v124(v108, v123);
  (*(void (**)(char *, uint64_t))(v117 + 8))(v74, v118);
  return v122;
}

id sub_1BECBDB48()
{
  uint64_t v0 = sub_1BECBF950();
  uint64_t v2 = v1;
  uint64_t v3 = sub_1BECBF950();
  char v5 = v4;
  swift_getObjCClassMetadata();
  sub_1BECBC8A0(v0, v2, v3, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v6 = (void *)sub_1BECBF940();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t static NSLocale._localeIdentifierForRegionChange(from:to:)(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v98 = a3;
  uint64_t v99 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1317C0);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v83 = &v76[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v97 = sub_1BECBF900();
  uint64_t v88 = *(void *)(v97 - 8);
  MEMORY[0x1F4188790](v97);
  uint64_t v94 = &v76[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1317C8);
  uint64_t v7 = v6 - 8;
  MEMORY[0x1F4188790](v6);
  v84 = &v76[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1317D0);
  uint64_t v10 = MEMORY[0x1F4188790](v9 - 8);
  v82 = &v76[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v80 = &v76[-v13];
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v16 = &v76[-v15];
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = &v76[-v17];
  uint64_t v19 = sub_1BECBF810();
  uint64_t v20 = *(void **)(v19 - 8);
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  v79 = &v76[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v21);
  uint64_t v24 = &v76[-v23];
  uint64_t v25 = sub_1BECBF780();
  uint64_t v95 = *(void *)(v25 - 8);
  uint64_t v96 = v25;
  uint64_t v26 = MEMORY[0x1F4188790](v25);
  v93 = &v76[-((v27 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v28 = MEMORY[0x1F4188790](v26);
  v91 = &v76[-v29];
  MEMORY[0x1F4188790](v28);
  uint64_t v31 = &v76[-v30];
  uint64_t v32 = sub_1BECBF7B0();
  uint64_t v34 = v33;
  uint64_t v35 = self;
  uint64_t v81 = v32;
  uint64_t v85 = v34;
  uint64_t v36 = (void *)sub_1BECBF940();
  id v86 = v35;
  id v37 = objc_msgSend(v35, sel_addLikelySubtagsForLocaleIdentifier_, v36);

  sub_1BECBF950();
  sub_1BECBF730();
  swift_bridgeObjectRetain();
  sub_1BECBF820();
  v39 = v20 + 2;
  uint64_t v38 = (void (*)(unsigned char *, unsigned char *, uint64_t))v20[2];
  uint64_t v98 = v24;
  v89 = v38;
  v38(v18, v24, v19);
  v90 = (void (*)(unsigned char *, uint64_t, uint64_t, uint64_t))v20[7];
  v90(v18, 0, 1, v19);
  uint64_t v87 = v31;
  uint64_t v40 = v19;
  uint64_t v41 = (uint64_t)v84;
  sub_1BECBF750();
  uint64_t v42 = v41 + *(int *)(v7 + 56);
  sub_1BECBF214((uint64_t)v18, v41, &qword_1EA1317D0);
  sub_1BECBF214((uint64_t)v16, v42, &qword_1EA1317D0);
  v92 = v20;
  uint64_t v43 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v20[6];
  uint64_t v99 = v40;
  if (v43(v41, 1, v40) == 1)
  {
    sub_1BECBF278((uint64_t)v16, &qword_1EA1317D0);
    sub_1BECBF278((uint64_t)v18, &qword_1EA1317D0);
    int v44 = v43(v42, 1, v99);
    uint64_t v46 = v96;
    uint64_t v45 = v97;
    if (v44 == 1)
    {
      sub_1BECBF278(v41, &qword_1EA1317D0);
LABEL_8:
      swift_bridgeObjectRelease();
      v52 = v87;
      uint64_t v53 = v88;
      uint64_t v54 = v95;
      goto LABEL_12;
    }
    goto LABEL_6;
  }
  uint64_t v47 = v80;
  sub_1BECBF214(v41, (uint64_t)v80, &qword_1EA1317D0);
  if (v43(v42, 1, v99) == 1)
  {
    sub_1BECBF278((uint64_t)v16, &qword_1EA1317D0);
    sub_1BECBF278((uint64_t)v18, &qword_1EA1317D0);
    ((void (*)(unsigned char *, uint64_t))v92[1])(v47, v99);
    uint64_t v46 = v96;
    uint64_t v45 = v97;
LABEL_6:
    sub_1BECBF278(v41, &qword_1EA1317C8);
    goto LABEL_9;
  }
  uint64_t v48 = v92;
  uint64_t v49 = v79;
  uint64_t v50 = v99;
  ((void (*)(unsigned char *, uint64_t, uint64_t))v92[4])(v79, v42, v99);
  sub_1BECBF2D4(&qword_1EA1317D8, MEMORY[0x1E4F27A00]);
  int v77 = sub_1BECBF930();
  uint64_t v51 = (void (*)(unsigned char *, uint64_t))v48[1];
  v51(v49, v50);
  sub_1BECBF278((uint64_t)v16, &qword_1EA1317D0);
  sub_1BECBF278((uint64_t)v18, &qword_1EA1317D0);
  v51(v47, v50);
  sub_1BECBF278(v41, &qword_1EA1317D0);
  uint64_t v46 = v96;
  uint64_t v45 = v97;
  if (v77) {
    goto LABEL_8;
  }
LABEL_9:
  swift_bridgeObjectRetain();
  uint64_t v55 = v91;
  sub_1BECBF730();
  uint64_t v56 = v46;
  uint64_t v57 = v82;
  char v78 = v39;
  uint64_t v58 = v99;
  v89(v82, v98, v99);
  v90(v57, 0, 1, v58);
  v59 = (void (*)(unsigned char *, void))sub_1BECBF710();
  sub_1BECBF890();
  v59(v100, 0);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v95 + 16))(v93, v55, v56);
  v60 = v94;
  sub_1BECBF790();
  sub_1BECBF7B0();
  uint64_t v53 = v88;
  (*(void (**)(unsigned char *, uint64_t))(v88 + 8))(v60, v45);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v62 = (void *)sub_1BECBF940();
  swift_bridgeObjectRelease();
  uint64_t v63 = (void *)sub_1BECBF940();
  swift_bridgeObjectRelease();
  uint64_t v64 = v90;
  LODWORD(v59) = objc_msgSend(ObjCClassFromMetadata, sel__language_usesSameLocalizationAs_, v62, v63);

  v89(v57, v98, v58);
  v64(v57, 0, 1, v58);
  v52 = v87;
  if (v59)
  {
    v65 = (void (*)(unsigned char *, void))sub_1BECBF710();
    sub_1BECBF890();
    v65(v100, 0);
    v64(v57, 1, 1, v99);
  }
  sub_1BECBF760();
  uint64_t v66 = sub_1BECBF840();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56))(v83, 1, 1, v66);
  sub_1BECBF770();
  uint64_t v54 = v95;
  uint64_t v46 = v96;
  (*(void (**)(unsigned char *, uint64_t))(v95 + 8))(v91, v96);
  uint64_t v45 = v97;
LABEL_12:
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v54 + 16))(v93, v52, v46);
  uint64_t v67 = v94;
  sub_1BECBF790();
  sub_1BECBF7B0();
  (*(void (**)(unsigned char *, uint64_t))(v53 + 8))(v67, v45);
  v68 = (void *)sub_1BECBF940();
  swift_bridgeObjectRelease();
  id v69 = v86;
  id v70 = objc_msgSend(v86, sel_componentsFromLocaleIdentifier_, v68);

  uint64_t v71 = sub_1BECBF920();
  sub_1BECBE6D8(v71);
  swift_bridgeObjectRelease();
  uint64_t v72 = (void *)sub_1BECBF910();
  swift_bridgeObjectRelease();
  id v73 = objc_msgSend(v69, sel_canonicalLocaleIdentifierWithValidCalendarForComponents_, v72);

  uint64_t v74 = sub_1BECBF950();
  ((void (*)(unsigned char *, uint64_t))v92[1])(v98, v99);
  (*(void (**)(unsigned char *, uint64_t))(v54 + 8))(v52, v46);
  return v74;
}

uint64_t sub_1BECBE6D8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA131810);
    uint64_t v2 = sub_1BECBF990();
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4FBC868];
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_1BECBF31C(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_1BECBF31C(v35, v36);
    sub_1BECBF31C(v36, &v32);
    uint64_t result = sub_1BECBF980();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_1BECBF31C(&v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_1BECBF32C();
    return v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

id sub_1BECBEA98()
{
  uint64_t v0 = sub_1BECBF900();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BECBF7F0();
  uint64_t v4 = sub_1BECBF950();
  uint64_t v6 = v5;
  swift_getObjCClassMetadata();
  static NSLocale._localeIdentifierForRegionChange(from:to:)((uint64_t)v3, v4, v6);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v7 = (void *)sub_1BECBF940();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_1BECBEBE0()
{
  uint64_t v0 = sub_1BECBF900();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1317E0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(self, sel_preferredLocale);
  if (v7)
  {
    int64_t v8 = v7;
    sub_1BECBF7F0();

    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v6, v3, v0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v1 + 56))(v6, 0, 1, v0);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 48))(v6, 1, v0);
    if (result != 1)
    {
      ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
      unint64_t v11 = (void *)sub_1BECBF7E0();
      (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
      unint64_t v12 = (void *)sub_1BECBF940();
      id v13 = objc_msgSend(ObjCClassFromMetadata, sel__localeIdentifierForRegionChangeFrom_to_, v11, v12);

      uint64_t v14 = sub_1BECBF950();
      return v14;
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v6, 1, 1, v0);
  }
  __break(1u);
  return result;
}

id sub_1BECBEE2C()
{
  sub_1BECBF950();
  swift_getObjCClassMetadata();
  sub_1BECBEBE0();
  swift_bridgeObjectRelease();
  uint64_t v0 = (void *)sub_1BECBF940();
  swift_bridgeObjectRelease();
  return v0;
}

void _sSo8NSLocaleC15IntlPreferencesE17_sameLocalizationySbSS_SStFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int64_t v8 = (void *)sub_1BECBF940();
  uint64_t v9 = self;
  id v10 = objc_msgSend(v9, sel_bundleWithIdentifier_, v8);

  if (!v10)
  {
    __break(1u);
    return;
  }
  id v11 = objc_msgSend(v10, sel_localizations);

  unint64_t v12 = v11;
  id v13 = v11;
  if (!v11)
  {
    sub_1BECBF970();
    id v13 = (void *)sub_1BECBF960();
    swift_bridgeObjectRelease();
    sub_1BECBF970();
    unint64_t v12 = (void *)sub_1BECBF960();
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA131818);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1BECC1290;
  *(void *)(v14 + 32) = a1;
  *(void *)(v14 + 40) = a2;
  id v15 = v11;
  swift_bridgeObjectRetain();
  int64_t v16 = (void *)sub_1BECBF960();
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(v9, sel_preferredLocalizationsFromArray_forPreferences_, v13, v16);

  uint64_t v18 = (void *)sub_1BECBF970();
  if (v18[2])
  {
    uint64_t v20 = v18[4];
    uint64_t v19 = v18[5];
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v19 = 0;
  }
  swift_bridgeObjectRelease();
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_1BECC1290;
  *(void *)(v21 + 32) = a3;
  *(void *)(v21 + 40) = a4;
  swift_bridgeObjectRetain();
  char v22 = (void *)sub_1BECBF960();
  swift_bridgeObjectRelease();
  id v23 = objc_msgSend(v9, sel_preferredLocalizationsFromArray_forPreferences_, v12, v22);

  BOOL v24 = (void *)sub_1BECBF970();
  if (!v24[2])
  {
    swift_bridgeObjectRelease();
    if (!v19) {
      return;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v26 = v24[4];
  uint64_t v25 = v24[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v19)
  {
    if (v25)
    {
      if (v20 == v26 && v19 == v25)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_1BECBF9A0();
        swift_bridgeObjectRelease();
      }
    }
    goto LABEL_18;
  }
  if (v25) {
    goto LABEL_18;
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1BECBF214(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BECBF278(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1BECBF2D4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

_OWORD *sub_1BECBF31C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1BECBF32C()
{
  return swift_release();
}

uint64_t __getUMUserManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[NSPersonNameComponentsFormatterPreferences _syncronizeGizmoDefaultWithKey:value:](v0);
}

uint64_t __getNRPairedDeviceRegistryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getNPSManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getNPSManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getNPSDomainAccessorClass_block_invoke_cold_1(v0);
}

uint64_t __getNPSDomainAccessorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[IPLanguageListManager systemDisplayLanguage](v0);
}

uint64_t sub_1BECBF710()
{
  return MEMORY[0x1F40E5468]();
}

uint64_t sub_1BECBF720()
{
  return MEMORY[0x1F40E5478]();
}

uint64_t sub_1BECBF730()
{
  return MEMORY[0x1F40E5490]();
}

uint64_t sub_1BECBF740()
{
  return MEMORY[0x1F40E54A0]();
}

uint64_t sub_1BECBF750()
{
  return MEMORY[0x1F40E54B0]();
}

uint64_t sub_1BECBF760()
{
  return MEMORY[0x1F40E54B8]();
}

uint64_t sub_1BECBF770()
{
  return MEMORY[0x1F40E54C0]();
}

uint64_t sub_1BECBF780()
{
  return MEMORY[0x1F40E54D8]();
}

uint64_t sub_1BECBF790()
{
  return MEMORY[0x1F40E54E8]();
}

uint64_t sub_1BECBF7A0()
{
  return MEMORY[0x1F40E5500]();
}

uint64_t sub_1BECBF7B0()
{
  return MEMORY[0x1F40E5510]();
}

uint64_t sub_1BECBF7C0()
{
  return MEMORY[0x1F40E5578]();
}

uint64_t sub_1BECBF7D0()
{
  return MEMORY[0x1F40E55C0]();
}

uint64_t sub_1BECBF7E0()
{
  return MEMORY[0x1F40E5648]();
}

uint64_t sub_1BECBF7F0()
{
  return MEMORY[0x1F40E5698]();
}

uint64_t sub_1BECBF800()
{
  return MEMORY[0x1F40E56C0]();
}

uint64_t sub_1BECBF810()
{
  return MEMORY[0x1F40E56C8]();
}

uint64_t sub_1BECBF820()
{
  return MEMORY[0x1F40E56D8]();
}

uint64_t sub_1BECBF830()
{
  return MEMORY[0x1F40E5718]();
}

uint64_t sub_1BECBF840()
{
  return MEMORY[0x1F40E5720]();
}

uint64_t sub_1BECBF850()
{
  return MEMORY[0x1F40E5768]();
}

uint64_t sub_1BECBF860()
{
  return MEMORY[0x1F40E5788]();
}

uint64_t sub_1BECBF870()
{
  return MEMORY[0x1F40E5798]();
}

uint64_t sub_1BECBF880()
{
  return MEMORY[0x1F40E57A0]();
}

uint64_t sub_1BECBF890()
{
  return MEMORY[0x1F40E57A8]();
}

uint64_t sub_1BECBF8A0()
{
  return MEMORY[0x1F40E57B0]();
}

uint64_t sub_1BECBF8B0()
{
  return MEMORY[0x1F40E57B8]();
}

uint64_t sub_1BECBF8C0()
{
  return MEMORY[0x1F40E57C8]();
}

uint64_t sub_1BECBF8D0()
{
  return MEMORY[0x1F40E57D0]();
}

uint64_t sub_1BECBF8E0()
{
  return MEMORY[0x1F40E5808]();
}

uint64_t sub_1BECBF8F0()
{
  return MEMORY[0x1F40E5840]();
}

uint64_t sub_1BECBF900()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1BECBF910()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1BECBF920()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1BECBF930()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1BECBF940()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1BECBF950()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1BECBF960()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1BECBF970()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1BECBF980()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1BECBF990()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1BECBF9A0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9740](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFStringRef CTFontCopyName(CTFontRef font, CFStringRef nameKey)
{
  return (CFStringRef)MEMORY[0x1F40DF2E0](font, nameKey);
}

CTFontRef CTFontCreateForString(CTFontRef currentFont, CFStringRef string, CFRange range)
{
  return (CTFontRef)MEMORY[0x1F40DF360](currentFont, string, range.location, range.length);
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x1F40DF370](*(void *)&uiType, language, size);
}

CTFontDescriptorRef CTFontDescriptorCreateMatchingFontDescriptor(CTFontDescriptorRef descriptor, CFSetRef mandatoryAttributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF3F0](descriptor, mandatoryAttributes);
}

CTFontDescriptorRef CTFontDescriptorCreateWithNameAndSize(CFStringRef name, CGFloat size)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF418](name, size);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return MEMORY[0x1F40D8F58]();
}

uint64_t _CFPreferencesSetValueWithContainer()
{
  return MEMORY[0x1F40D8FD0]();
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x1F40D9490]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
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

uint64_t self
{
  return MEMORY[0x1F41817D0]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

uint64_t os_eligibility_set_input()
{
  return MEMORY[0x1F40CD2C0]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

UBool u_isalpha(UChar32 c)
{
  return MEMORY[0x1F417F7B8](*(void *)&c);
}

UBool u_ispunct(UChar32 c)
{
  return MEMORY[0x1F417F7E0](*(void *)&c);
}

UBool u_isspace(UChar32 c)
{
  return MEMORY[0x1F417F7E8](*(void *)&c);
}

uint64_t ualoc_getAppleParent()
{
  return MEMORY[0x1F417F8F8]();
}

uint64_t ubrk_close()
{
  return MEMORY[0x1F417FA30]();
}

uint64_t ubrk_first()
{
  return MEMORY[0x1F417FA48]();
}

uint64_t ubrk_next()
{
  return MEMORY[0x1F417FA78]();
}

uint64_t ubrk_open()
{
  return MEMORY[0x1F417FA80]();
}

uint64_t ucal_close()
{
  return MEMORY[0x1F417FAC8]();
}

uint64_t ucal_getKeywordValuesForLocale()
{
  return MEMORY[0x1F417FB10]();
}

uint64_t ucal_getType()
{
  return MEMORY[0x1F417FB50]();
}

uint64_t ucal_open()
{
  return MEMORY[0x1F417FB70]();
}

uint64_t uenum_close()
{
  return MEMORY[0x1F417FFD8]();
}

uint64_t uenum_next()
{
  return MEMORY[0x1F417FFE8]();
}

uint64_t uldn_close()
{
  return MEMORY[0x1F4180088]();
}

uint64_t uldn_localeDisplayName()
{
  return MEMORY[0x1F41800A0]();
}

uint64_t uldn_openForContext()
{
  return MEMORY[0x1F41800B0]();
}

uint64_t uloc_addLikelySubtags()
{
  return MEMORY[0x1F4180108]();
}

uint64_t uloc_getBaseName()
{
  return MEMORY[0x1F4180130]();
}

uint64_t uloc_getISO3Language()
{
  return MEMORY[0x1F4180178]();
}

uint64_t unumsys_close()
{
  return MEMORY[0x1F41803D0]();
}

uint64_t unumsys_getName()
{
  return MEMORY[0x1F41803E0]();
}

uint64_t unumsys_getRadix()
{
  return MEMORY[0x1F41803E8]();
}

uint64_t unumsys_isAlgorithmic()
{
  return MEMORY[0x1F41803F0]();
}

uint64_t unumsys_open()
{
  return MEMORY[0x1F41803F8]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1F40CEF20]();
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1F40CF250]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}