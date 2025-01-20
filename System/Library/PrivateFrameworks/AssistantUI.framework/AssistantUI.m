void OUTLINED_FUNCTION_6(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

double OUTLINED_FUNCTION_1_1()
{
  return v0;
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_22309D1A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22309D8F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AFUICreateDebugController()
{
  if (AFIsInternalInstall())
  {
    double v0 = (void *)[objc_alloc(MEMORY[0x263F086E0]) initWithPath:@"/AppleInternal/Library/Assistant/UIPlugins/Debug.siriUIBundle"];
    [v0 load];

    id v1 = objc_alloc_init(NSClassFromString(&cfstr_Afuidebugcontr.isa));
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

id AFUICreateBugReportPresentingWithDelegate(void *a1)
{
  id v1 = a1;
  if (AFIsInternalInstall())
  {
    v2 = (void *)[objc_alloc(MEMORY[0x263F086E0]) initWithPath:@"/AppleInternal/Library/Assistant/UIPlugins/Debug.siriUIBundle"];
    [v2 load];

    v3 = (void *)[objc_alloc(NSClassFromString(&cfstr_Afuibugreportp.isa)) initWithDelegate:v1];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id AFUICreateInternalDebugController()
{
  if (AFIsInternalInstall())
  {
    double v0 = (void *)[objc_alloc(MEMORY[0x263F086E0]) initWithPath:@"/AppleInternal/Library/Assistant/UIPlugins/Debug.siriUIBundle"];
    [v0 load];

    id v1 = objc_alloc_init(NSClassFromString(&cfstr_Afuiinternalde.isa));
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

void sub_22309FD24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVMVoicemailManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!VisualVoicemailLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __VisualVoicemailLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264691948;
    uint64_t v5 = 0;
    VisualVoicemailLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!VisualVoicemailLibraryCore_frameworkLibrary) {
    __getVMVoicemailManagerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("VMVoicemailManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getVMVoicemailManagerClass_block_invoke_cold_2();
  }
  getVMVoicemailManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisualVoicemailLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VisualVoicemailLibraryCore_frameworkLibrary = result;
  return result;
}

__CFString *AFUIBulletinReadoutResultGetName(unint64_t a1)
{
  if (a1 < 5) {
    return off_264691980[a1];
  }
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    AFUIBulletinReadoutResultGetName_cold_1(a1, v3);
  }
  return 0;
}

void sub_2230A1EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230A2848(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230A4168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230A47C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_2230A495C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230A4AA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230A4F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _LocStr(void *a1)
{
  id v1 = (void *)MEMORY[0x263F086E0];
  id v2 = a1;
  v3 = [v1 bundleForClass:objc_opt_class()];
  long long v4 = [v3 localizedStringForKey:v2 value:0 table:@"Disable"];

  return v4;
}

void sub_2230A5094(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

Class __getSTStorageAppHeaderCellClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!StorageSettingsLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __StorageSettingsLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264691B80;
    uint64_t v5 = 0;
    StorageSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!StorageSettingsLibraryCore_frameworkLibrary) {
    __getSTStorageAppHeaderCellClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("STStorageAppHeaderCell");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSTStorageAppHeaderCellClass_block_invoke_cold_2();
  }
  getSTStorageAppHeaderCellClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __StorageSettingsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  StorageSettingsLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_2230A5ED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230A68A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230A6980(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2230A6B7C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230A6E2C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230A6F70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2230A986C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

id getOptionalPKDarwinNotificationEventInAppPresented()
{
  id v0 = (id)PassKitCoreLibraryCore();
  if (v0)
  {
    uint64_t v4 = 0;
    uint64_t v5 = &v4;
    uint64_t v6 = 0x2020000000;
    id v1 = (id *)getPKDarwinNotificationEventInAppPresentedSymbolLoc_ptr;
    uint64_t v7 = getPKDarwinNotificationEventInAppPresentedSymbolLoc_ptr;
    if (!getPKDarwinNotificationEventInAppPresentedSymbolLoc_ptr)
    {
      v3[0] = MEMORY[0x263EF8330];
      v3[1] = 3221225472;
      v3[2] = __getPKDarwinNotificationEventInAppPresentedSymbolLoc_block_invoke;
      v3[3] = &unk_264691928;
      v3[4] = &v4;
      __getPKDarwinNotificationEventInAppPresentedSymbolLoc_block_invoke((uint64_t)v3);
      id v1 = (id *)v5[3];
    }
    _Block_object_dispose(&v4, 8);
    if (!v1) {
      getOptionalPKDarwinNotificationEventInAppPresented_cold_1();
    }
    id v0 = *v1;
  }

  return v0;
}

void sub_2230AB85C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2230AD798(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

void sub_2230AE3E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
}

void sub_2230AEFB0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_2230AFCA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230B1460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void _authenticationUIPresentedCallBack(uint64_t a1, void *a2, void *a3)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([a3 isEqualToString:@"com.apple.LocalAuthentication.ui.presented"])
    {
      [a2 _localAuthenticationUIPresented];
    }
    else
    {
      uint64_t v5 = getOptionalPKDarwinNotificationEventInAppPresented();
      int v6 = [a3 isEqualToString:v5];

      if (v6)
      {
        [a2 _applePaySheetPresented];
      }
    }
  }
}

void sub_2230B29DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230B3A7C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230B3B64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2230B4698(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_2230B4D8C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2230B5020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230B5248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230B5478(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_2230B5B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
}

void sub_2230B69BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230B6E6C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_2230B71A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230B7784(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2230B8044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2230B8588(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230B95E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t PassKitCoreLibraryCore()
{
  if (!PassKitCoreLibraryCore_frameworkLibrary) {
    PassKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return PassKitCoreLibraryCore_frameworkLibrary;
}

uint64_t __PassKitCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PassKitCoreLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getPKDarwinNotificationEventInAppPresentedSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v4 = 0;
  uint64_t v2 = (void *)PassKitCoreLibraryCore();
  if (!v2) {
    __getPKDarwinNotificationEventInAppPresentedSymbolLoc_block_invoke_cold_1(&v4);
  }
  uint64_t result = dlsym(v2, "PKDarwinNotificationEventInAppPresented");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPKDarwinNotificationEventInAppPresentedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getINStartCallIntentClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!IntentsLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __IntentsLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264692490;
    uint64_t v5 = 0;
    IntentsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IntentsLibraryCore_frameworkLibrary) {
    __getINStartCallIntentClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("INStartCallIntent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getINStartCallIntentClass_block_invoke_cold_2();
  }
  getINStartCallIntentClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __IntentsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IntentsLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t CoreDuetLibraryCore()
{
  if (!CoreDuetLibraryCore_frameworkLibrary) {
    CoreDuetLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return CoreDuetLibraryCore_frameworkLibrary;
}

uint64_t __CoreDuetLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreDuetLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_2230BA204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SetupAssistantLibraryCore()
{
  if (!SetupAssistantLibraryCore_frameworkLibrary) {
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return SetupAssistantLibraryCore_frameworkLibrary;
}

uint64_t __SetupAssistantLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getBYSetupAssistantHasCompletedInitialRunSymbolLoc_block_invoke(uint64_t a1)
{
  long long v4 = 0;
  uint64_t v2 = (void *)SetupAssistantLibraryCore();
  if (!v2) {
    __getBYSetupAssistantHasCompletedInitialRunSymbolLoc_block_invoke_cold_1(&v4);
  }
  uint64_t result = dlsym(v2, "BYSetupAssistantHasCompletedInitialRun");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *AFUISiriSessionEventGetDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xB) {
    return @"AFUISiriSessionEventDirectRequestBegan";
  }
  else {
    return off_264692508[a1 - 1];
  }
}

id AssistantUIBundle()
{
  if (AssistantUIBundle_pred != -1) {
    dispatch_once(&AssistantUIBundle_pred, &__block_literal_global_5);
  }
  id v0 = (void *)AssistantUIBundle___AssistantUIBundle;

  return v0;
}

uint64_t __AssistantUIBundle_block_invoke()
{
  AssistantUIBundle___AssistantUIBundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

__CFString *NSStringFromAFUISiriSAEEffectsViewControllerState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @".Dismissed";
  }
  else {
    return off_264692630[a1 - 1];
  }
}

__CFString *NSStringFromAFUISiriSAEEffectsViewControllerInvocationType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @".Unspecified";
  }
  else {
    return off_264692658[a1 - 1];
  }
}

void sub_2230BD744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230BDAB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230BEAB8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2230BECA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void _handleKeyboardPreferencesChanged(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___handleKeyboardPreferencesChanged_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void sub_2230C05DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_2230C0B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___handleKeyboardPreferencesChanged_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _clearCachedGuide];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 checkGuideUpdate];
}

id AFUISiriRequestHandlingStatusColor(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      uint64_t v3 = objc_msgSend(MEMORY[0x263F825C8], "grayColor", v1);
      goto LABEL_10;
    case 1:
      uint64_t v3 = objc_msgSend(MEMORY[0x263F825C8], "redColor", v1);
      goto LABEL_10;
    case 2:
      uint64_t v3 = objc_msgSend(MEMORY[0x263F825C8], "yellowColor", v1);
      goto LABEL_10;
    case 3:
      uint64_t v3 = objc_msgSend(MEMORY[0x263F825C8], "greenColor", v1);
      goto LABEL_10;
    case 4:
      uint64_t v3 = objc_msgSend(MEMORY[0x263F825C8], "cyanColor", v1);
LABEL_10:
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v3;
}

uint64_t AFUISetLanguageCode()
{
  return MEMORY[0x270F72870]();
}

BOOL AFUIIsDeviceLiveActivitiesSupported()
{
  id v0 = [MEMORY[0x263F82670] currentDevice];
  if ([v0 userInterfaceIdiom])
  {
    uint64_t v1 = [MEMORY[0x263F82670] currentDevice];
    BOOL v2 = [v1 userInterfaceIdiom] == 1;
  }
  else
  {
    BOOL v2 = 1;
  }

  return v2;
}

uint64_t AFUIIsDeviceSystemApertureEnabled()
{
  return MEMORY[0x270F77270]();
}

double DurationForMassStiffnessDamping(double a1, double a2, double a3)
{
  id v6 = objc_alloc_init(MEMORY[0x263F15890]);
  [v6 setMass:a1];
  [v6 setStiffness:a2];
  [v6 setDamping:a3];
  [v6 settlingDuration];
  double v8 = v7;

  return v8;
}

id AFUIDisplayStringForVersionAndAccount(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "rangeOfString:", @"?"));

  id v6 = [v3 label];
  if (![v6 length])
  {
    double v7 = [v3 hostname];

    uint64_t v8 = [v7 rangeOfString:@"https://"];
    uint64_t v10 = v9;
    uint64_t v11 = [v7 rangeOfString:@".siri.apple.com"];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL || v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = v7;
    }
    else
    {
      v12 = [v7 substringToIndex:v11];

      id v6 = [v12 substringFromIndex:v10];
    }
  }
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    [NSString stringWithFormat:@"%@ (%@)", v5, v6];
LABEL_11:
    id v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v14 = v13;
    goto LABEL_13;
  }
  if ([v6 length])
  {
    [NSString stringWithFormat:@"(%@)", v6, v16];
    goto LABEL_11;
  }
  if ([v5 length])
  {
    id v13 = v6;
    goto LABEL_12;
  }
  v14 = 0;
LABEL_13:

  return v14;
}

id AFUICreateAssistantResourcesDirectoryURL()
{
  id v0 = CPSharedResourcesDirectory();
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"Library"];
  BOOL v2 = [v1 stringByAppendingPathComponent:@"Assistant"];

  id v3 = [NSURL fileURLWithPath:v2 isDirectory:1];

  return v3;
}

id AFUIFileURLForConversationWithIdentifier(void *a1)
{
  id v1 = a1;
  BOOL v2 = AFUICreateAssistantResourcesDirectoryURL();
  id v3 = [v2 URLByAppendingPathComponent:v1 isDirectory:0];

  return v3;
}

BOOL AFUIHasUnlockedSinceBoot()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x2020000000;
  id v0 = (unsigned int (*)(void))getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  id v6 = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  if (!getMKBDeviceUnlockedSinceBootSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke;
    v2[3] = &unk_264691928;
    v2[4] = &v3;
    __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke((uint64_t)v2);
    id v0 = (unsigned int (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    AFUIHasUnlockedSinceBoot_cold_1();
  }
  return v0() == 1;
}

void sub_2230C2BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AFUIShowServerVersionOnUI()
{
  id v0 = [MEMORY[0x263F285A0] sharedPreferences];
  if ([v0 showServerOnUI])
  {
    id v1 = [MEMORY[0x263F82438] sharedApplication];
    uint64_t v2 = [v1 isPPTAvailable] ^ 1;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t AFUIGraphicalFloatsEqualForScale(float64x2_t a1, float64_t a2, double a3)
{
  if (a3 <= 0.0)
  {
    unint64_t v9 = *(void *)&a1.f64[0];
    double v10 = a3;
    double v8 = a2;
    id v6 = [MEMORY[0x263F08690] currentHandler];
    double v7 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL AFUIGraphicalFloatsEqualForScale(CGFloat, CGFloat, CGFloat)");
    [v6 handleFailureInFunction:v7 file:@"AFUIUtilities.m" lineNumber:296 description:@"AFUIGraphicalFloatsEqualForScale cannot compute equivalence for scale of 0"];

    a2 = v8;
    *(void *)&a1.f64[0] = v9;
    a3 = v10;
  }
  a1.f64[1] = a2;
  float64x2_t v3 = vcvtq_f64_s64(vcvtq_s64_f64(a1));
  float64x2_t v4 = vaddq_f64(vdivq_f64(vrndaq_f64(vmulq_n_f64(vsubq_f64(a1, v3), a3)), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0)), v3);
  return *(void *)&vmovn_s64(vceqq_f64(v4, (float64x2_t)vdupq_laneq_s64((int64x2_t)v4, 1))) & 1;
}

void *__getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = __MobileKeyBagLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2646927E0;
    uint64_t v6 = 0;
    MobileKeyBagLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
  if (!MobileKeyBagLibraryCore_frameworkLibrary) {
    __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  uint64_t result = dlsym(v2, "MKBDeviceUnlockedSinceBoot");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBDeviceUnlockedSinceBootSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MobileKeyBagLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileKeyBagLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_2230C5634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AFUIPathForDebugOverridePlist()
{
  id v0 = MEMORY[0x223CAE470]();
  id v1 = [v0 stringByAppendingPathComponent:@"/System/Library/Assistant/DebugOverrides.plist"];

  return v1;
}

id AFUIDebugOverrideDictionary()
{
  id v0 = NSDictionary;
  id v1 = AFUIPathForDebugOverridePlist();
  uint64_t v2 = [v0 dictionaryWithContentsOfFile:v1];

  return v2;
}

void sub_2230C8DB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2230C9938(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2230C9C0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_2230C9FA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_2230CA404(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230CAB28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,id location)
{
  objc_destroyWeak(v42);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230CB474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230CB76C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230CBBE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230CBD10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230CBE3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _AFUIRecordSiriBeginEndCoreDuetEvent(NSObject *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___AFUIRecordSiriBeginEndCoreDuetEvent_block_invoke;
  v9[3] = &unk_264692738;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(a1, v9);
}

void _AFUIRecordSiriBeginEndBiomeEvent(NSObject *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___AFUIRecordSiriBeginEndBiomeEvent_block_invoke;
  v9[3] = &unk_264692738;
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(a1, v9);
}

void sub_2230CC7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2230CD4DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230CD978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_2230CDA34(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2230CDFFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230CE6EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230CE80C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2230CE9B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2230CEAE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230CECA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230CEDF4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_2230CF068(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230CF1B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230CF410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230D1E10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2230D26FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230D28DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230D2AA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230D2BBC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2230D2E00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_2230D3160(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2230D37EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230D39F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230D3C0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230D41E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2230D42FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2230D4DB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
}

void sub_2230D5188(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230D52A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2230D547C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_2230D5784(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230D58C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230D7034(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230D7278(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2230D7390(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2230D74A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2230D91E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230D95AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230D9D90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230D9FB8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230DA108(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230DA258(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2230DA480(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2230DA5EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2230DA774(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230DAA74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2230DAB70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2230DAFE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2230DB278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__getSSScreenshotsDisplayModeWillChangeToFullscreenNotificationNameSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!ScreenshotServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = __ScreenshotServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264692CE8;
    uint64_t v6 = 0;
    ScreenshotServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v2 = (void *)ScreenshotServicesLibraryCore_frameworkLibrary;
  if (!ScreenshotServicesLibraryCore_frameworkLibrary) {
    __getSSScreenshotsDisplayModeWillChangeToFullscreenNotificationNameSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  uint64_t result = dlsym(v2, "SSScreenshotsDisplayModeWillChangeToFullscreenNotificationName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSSScreenshotsDisplayModeWillChangeToFullscreenNotificationNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                             + 24);
  return result;
}

uint64_t __ScreenshotServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ScreenshotServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void ___updateContextSiriActiveStatus_block_invoke(uint64_t a1)
{
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  id v1 = [MEMORY[0x263F351B8] userContext];
  uint64_t v2 = [MEMORY[0x263F351D0] keyPathForSiriActiveStatus];
  [v1 setObject:v3 forKeyedSubscript:v2];
}

uint64_t __PeopleSuggesterLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PeopleSuggesterLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getVTStateManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!VoiceTriggerLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __VoiceTriggerLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264692D38;
    uint64_t v5 = 0;
    VoiceTriggerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!VoiceTriggerLibraryCore_frameworkLibrary) {
    __getVTStateManagerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("VTStateManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getVTStateManagerClass_block_invoke_cold_2();
  }
  getVTStateManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VoiceTriggerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VoiceTriggerLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_2230DC6CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_2230DD540(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2230DD84C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2230DD91C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2230DF0C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_2230E0E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
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

void sub_2230E2070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 152), 8);
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

void sub_2230E31B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2230E3324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230E3EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2230E41C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_2230E44AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

Class __getVTUITurnOnSiriViewClass_block_invoke(uint64_t a1)
{
  VoiceTriggerUILibrary();
  Class result = objc_getClass("VTUITurnOnSiriView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getVTUITurnOnSiriViewClass_block_invoke_cold_1();
  }
  getVTUITurnOnSiriViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void VoiceTriggerUILibrary()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0[0] = 0;
  if (!VoiceTriggerUILibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x263EF8330];
    v0[2] = (void *)3221225472;
    v0[3] = __VoiceTriggerUILibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_264692F20;
    uint64_t v2 = 0;
    VoiceTriggerUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!VoiceTriggerUILibraryCore_frameworkLibrary) {
    VoiceTriggerUILibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __VoiceTriggerUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VoiceTriggerUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getVTUISiriDataSharingOptInPresenterClass_block_invoke(uint64_t a1)
{
  VoiceTriggerUILibrary();
  Class result = objc_getClass("VTUISiriDataSharingOptInPresenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getVTUISiriDataSharingOptInPresenterClass_block_invoke_cold_1();
  }
  getVTUISiriDataSharingOptInPresenterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getVTUIVoiceSelectionViewControllerClass_block_invoke(uint64_t a1)
{
  VoiceTriggerUILibrary();
  Class result = objc_getClass("VTUIVoiceSelectionViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getVTUIVoiceSelectionViewControllerClass_block_invoke_cold_1();
  }
  getVTUIVoiceSelectionViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBYFlowSkipControllerClass_block_invoke(uint64_t a1)
{
  SetupAssistantLibrary();
  Class result = objc_getClass("BYFlowSkipController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBYFlowSkipControllerClass_block_invoke_cold_1();
  }
  getBYFlowSkipControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SetupAssistantLibrary()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!SetupAssistantLibraryCore_frameworkLibrary_0)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __SetupAssistantLibraryCore_block_invoke_0;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    void v2[5] = v2;
    long long v3 = xmmword_264692F38;
    uint64_t v4 = 0;
    SetupAssistantLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = SetupAssistantLibraryCore_frameworkLibrary_0;
  if (!SetupAssistantLibraryCore_frameworkLibrary_0) {
    SetupAssistantLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __SetupAssistantLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getBYFlowSkipIdentifierSiriSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SetupAssistantLibrary();
  uint64_t result = dlsym(v2, "BYFlowSkipIdentifierSiri");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYFlowSkipIdentifierSiriSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getOBPrivacyPresenterClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __OnBoardingKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264692F50;
    uint64_t v5 = 0;
    OnBoardingKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!OnBoardingKitLibraryCore_frameworkLibrary) {
    __getOBPrivacyPresenterClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("OBPrivacyPresenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getOBPrivacyPresenterClass_block_invoke_cold_2();
  }
  getOBPrivacyPresenterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __OnBoardingKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  OnBoardingKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_2230E7220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_2230E876C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_2230E8980(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2230E8B08(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

char *AFUISiriCarPlayShockwaveViewController.__allocating_init(safeAreaInsets:)(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = objc_allocWithZone(v4);
  *(void *)&v9[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_shockwaveViewController] = 0;
  v9[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_isDirectActionActivation] = 0;
  v9[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_isVoiceActivation] = 0;
  v9[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_isSteeringWheelActivation] = 0;
  v9[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_isRightHandDrive] = 0;
  id v10 = &v9[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_safeAreaInsets];
  long long v11 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
  *id v10 = *MEMORY[0x263F834E8];
  v10[1] = v11;
  v14.receiver = v9;
  v14.super_class = v4;
  uint64_t result = (char *)objc_msgSendSuper2(&v14, sel_initWithNibName_bundle_, 0, 0);
  uint64_t v13 = (double *)&result[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_safeAreaInsets];
  *uint64_t v13 = a1;
  v13[1] = a2;
  v13[2] = a3;
  v13[3] = a4;
  return result;
}

char *AFUISiriCarPlayShockwaveViewController.init(safeAreaInsets:)(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_shockwaveViewController] = 0;
  v4[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_isDirectActionActivation] = 0;
  v4[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_isVoiceActivation] = 0;
  v4[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_isSteeringWheelActivation] = 0;
  v4[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_isRightHandDrive] = 0;
  uint64_t v9 = &v4[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_safeAreaInsets];
  long long v10 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
  *uint64_t v9 = *MEMORY[0x263F834E8];
  v9[1] = v10;
  v13.receiver = v4;
  v13.super_class = (Class)type metadata accessor for AFUISiriCarPlayShockwaveViewController();
  uint64_t result = (char *)objc_msgSendSuper2(&v13, sel_initWithNibName_bundle_, 0, 0);
  v12 = (double *)&result[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_safeAreaInsets];
  double *v12 = a1;
  v12[1] = a2;
  v12[2] = a3;
  v12[3] = a4;
  return result;
}

uint64_t type metadata accessor for AFUISiriCarPlayShockwaveViewController()
{
  return self;
}

id sub_2230EA100(void *a1)
{
  unsigned __int8 v3 = objc_msgSend(a1, sel_isRightHandDrive);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_isRightHandDrive) = v3;
  BOOL v4 = objc_msgSend(a1, sel_requestSource) == (id)8 || objc_msgSend(a1, sel_requestSource) == (id)12;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_isVoiceActivation) = v4;
  BOOL v5 = objc_msgSend(a1, sel_requestSource) == (id)43;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_isSteeringWheelActivation) = v5;
  id result = objc_msgSend(a1, sel_requestSource);
  if (result == (id)14 || (id result = objc_msgSend(a1, sel_requestSource), result == (id)13))
  {
    BOOL v7 = 1;
  }
  else
  {
    id result = objc_msgSend(a1, sel_requestSource);
    BOOL v7 = result == (id)37;
  }
  *(unsigned char *)(v1 + OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_isDirectActionActivation) = v7;
  return result;
}

void sub_2230EA258()
{
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_isDirectActionActivation) & 1) == 0)
  {
    sub_2230EA4F0();
    uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_shockwaveViewController);
    if (v1)
    {
      id v2 = v1;
      objc_msgSend(v2, sel_setState_, 1);
      sub_2230EA834(2);
    }
  }
}

void sub_2230EA3D8()
{
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for AFUISiriCarPlayShockwaveViewController();
  objc_msgSendSuper2(&v6, sel_viewDidLoad);
  id v1 = objc_msgSend(v0, sel_view);
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v1, sel_setUserInteractionEnabled_, 0);

    id v3 = objc_msgSend(v0, sel_view);
    if (v3)
    {
      BOOL v4 = v3;
      id v5 = objc_msgSend(v3, sel_layer);

      objc_msgSend(v5, sel_setAllowsHitTesting_, 0);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_2230EA4F0()
{
  uint64_t v1 = OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_shockwaveViewController;
  if (*(void *)&v0[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_shockwaveViewController]) {
    sub_2230EA78C();
  }
  id v2 = (double *)&v0[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_safeAreaInsets];
  if (*(double *)&v0[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_safeAreaInsets + 8] > 0.0
    || v2[3] > 0.0
    || (v0[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_isVoiceActivation] & 1) != 0
    || v0[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_isSteeringWheelActivation] == 1)
  {
    if (v0[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_isRightHandDrive]) {
      uint64_t v3 = 8;
    }
    else {
      uint64_t v3 = 2;
    }
  }
  else if (*v2 <= 0.0)
  {
    if (v2[2] <= 0.0) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 4;
    }
  }
  else
  {
    uint64_t v3 = 1;
  }
  id v4 = objc_msgSend(v0, sel_view);
  if (!v4)
  {
    __break(1u);
    goto LABEL_24;
  }
  id v5 = v4;
  objc_msgSend(v4, sel_frame);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7C478]), sel_initWithEdge_shockwaveViewBounds_, v3, v7, v9, v11, v13);
  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7C488]), sel_initWithStyle_, v14);
  uint64_t v16 = *(void **)&v0[v1];
  *(void *)&v0[v1] = v15;
  id v25 = v15;

  objc_msgSend(v0, sel_addChildViewController_, v25);
  id v17 = objc_msgSend(v25, sel_view);
  if (!v17)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v18 = v17;
  objc_msgSend(v17, sel_setFrame_, v7, v9, v11, v13);

  id v19 = objc_msgSend(v25, sel_view);
  if (!v19)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v20 = v19;
  objc_msgSend(v19, sel_setAutoresizingMask_, 18);

  id v21 = objc_msgSend(v0, sel_view);
  if (!v21)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v22 = v21;
  id v23 = objc_msgSend(v25, sel_view);
  if (!v23)
  {
LABEL_27:
    __break(1u);
    return;
  }
  v24 = v23;
  objc_msgSend(v22, sel_addSubview_, v23);

  objc_msgSend(v25, sel_didMoveToParentViewController_, v0);
}

void sub_2230EA78C()
{
  uint64_t v1 = OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_shockwaveViewController;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_shockwaveViewController);
  if (v2)
  {
    id v3 = objc_msgSend(v2, sel_view);
    if (!v3)
    {
      __break(1u);
      return;
    }
    id v4 = v3;
    objc_msgSend(v3, sel_removeFromSuperview);

    id v2 = *(void **)(v0 + v1);
    if (v2)
    {
      objc_msgSend(v2, sel_willMoveToParentViewController_, 0);
      id v2 = *(void **)(v0 + v1);
      if (v2)
      {
        objc_msgSend(v2, sel_removeFromParentViewController);
        id v2 = *(void **)(v0 + v1);
      }
    }
  }
  *(void *)(v0 + v1) = 0;
}

uint64_t sub_2230EA834(uint64_t result)
{
  id v2 = *(void **)(v1 + OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_shockwaveViewController);
  if (v2)
  {
    uint64_t v3 = result;
    uint64_t v4 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v5 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v3;
    *(void *)(v6 + 24) = v5;
    id v14 = sub_2230EB0E0;
    uint64_t v15 = v4;
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 1107296256;
    double v12 = sub_2230EACB8;
    double v13 = &block_descriptor;
    double v7 = _Block_copy(&v10);
    id v8 = v2;
    swift_retain();
    swift_release();
    id v14 = sub_2230EB120;
    uint64_t v15 = v6;
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 1107296256;
    double v12 = sub_2230EAD0C;
    double v13 = &block_descriptor_28;
    double v9 = _Block_copy(&v10);
    swift_retain();
    swift_release();
    objc_msgSend(v8, sel_setState_animated_recommendedNextAction_completion_, v3, 1, v7, v9);
    _Block_release(v9);
    _Block_release(v7);

    swift_release();
    return swift_release();
  }
  return result;
}

void sub_2230EAA20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t v4 = (char *)MEMORY[0x223CAEBD0](v3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void **)&v4[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_shockwaveViewController];
    if (v6)
    {
      uint64_t v7 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v8 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v9 = swift_allocObject();
      *(void *)(v9 + 16) = a1;
      *(void *)(v9 + 24) = v8;
      id v17 = sub_2230EB0E0;
      uint64_t v18 = v7;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v14 = 1107296256;
      uint64_t v15 = sub_2230EACB8;
      uint64_t v16 = &block_descriptor_38;
      uint64_t v10 = _Block_copy(&aBlock);
      id v11 = v6;
      swift_retain();
      swift_release();
      id v17 = sub_2230EB1B8;
      uint64_t v18 = v9;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v14 = 1107296256;
      uint64_t v15 = sub_2230EAD0C;
      uint64_t v16 = &block_descriptor_41;
      double v12 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v11, sel_setState_animated_recommendedNextAction_completion_, a1, 1, v10, v12);
      _Block_release(v12);
      _Block_release(v10);

      swift_release();
      swift_release();
    }
    else
    {
    }
  }
}

void sub_2230EAC44(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a3 <= 5 && ((1 << a3) & 0x2C) != 0)
  {
    uint64_t v4 = a4 + 16;
    swift_beginAccess();
    uint64_t v5 = MEMORY[0x223CAEBD0](v4);
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      sub_2230EA78C();
    }
  }
}

uint64_t sub_2230EACB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_2230EAD0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);

  return swift_release();
}

id AFUISiriCarPlayShockwaveViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_2230F0248();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void AFUISiriCarPlayShockwaveViewController.init(nibName:bundle:)()
{
}

id AFUISiriCarPlayShockwaveViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AFUISiriCarPlayShockwaveViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for AFUISiriCarPlayShockwaveViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AFUISiriCarPlayShockwaveViewController);
}

uint64_t dispatch thunk of AFUISiriCarPlayShockwaveViewController.__allocating_init(safeAreaInsets:)()
{
  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of AFUISiriCarPlayShockwaveViewController.initializeEdgeLightForRequest(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of AFUISiriCarPlayShockwaveViewController.playShockwave()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t sub_2230EAF30(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_2230EAF74(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2230EAF94(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + _Block_object_dispose(&a9, 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
}

void *sub_2230EAFD4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + _Block_object_dispose(&a9, 8) = 0;
  return result;
}

void sub_2230EAFE4(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_2230EAFF0()
{
  *(void *)&v0[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_shockwaveViewController] = 0;
  v0[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_isDirectActionActivation] = 0;
  v0[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_isVoiceActivation] = 0;
  v0[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_isSteeringWheelActivation] = 0;
  v0[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_isRightHandDrive] = 0;
  uint64_t v1 = &v0[OBJC_IVAR____TtC11AssistantUI38AFUISiriCarPlayShockwaveViewController_safeAreaInsets];
  long long v2 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
  *uint64_t v1 = *MEMORY[0x263F834E8];
  v1[1] = v2;

  sub_2230F0278();
  __break(1u);
}

uint64_t sub_2230EB0A8()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2230EB0E0(uint64_t a1)
{
  sub_2230EAA20(a1, v1);
}

uint64_t sub_2230EB0E8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2230EB120(uint64_t a1, uint64_t a2)
{
  sub_2230EAC44(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

void type metadata accessor for ShockwaveState(uint64_t a1)
{
}

void sub_2230EB154(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_2230EB2D4()
{
  uint64_t v34 = sub_2230F0218();
  uint64_t v0 = *(void *)(v34 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v2 = (char *)&v31 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_2230F01F8();
  uint64_t v3 = *(void *)(v32 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2230F0238();
  uint64_t v33 = *(void *)(v6 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  id v11 = (char *)&v31 - v10;
  sub_2230F0208();
  double v12 = self;
  id v13 = objc_msgSend(v12, sel_whiteColor);
  sub_2230F01B8();
  sub_2230F01D8();
  uint64_t v14 = v12;
  uint64_t v15 = v6;
  id v16 = objc_msgSend(v14, sel_whiteColor);
  sub_2230F0188();
  sub_2230F01A8();
  sub_2230F01C8();
  sub_2230F01E8();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F81F40], v32);
  sub_2230F0198();
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, *MEMORY[0x263F81F48], v34);
  id v17 = v35;
  sub_2230F0228();
  objc_msgSend(v17, sel_bounds);
  uint64_t v18 = v33;
  (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v9, v11, v6);
  id v19 = objc_allocWithZone((Class)sub_2230F0178());
  uint64_t v20 = sub_2230F0168();
  uint64_t v21 = OBJC_IVAR____TtC11AssistantUI26AFUISiriCarPlayLatencyView_latencyLightView;
  v22 = *(void **)&v17[OBJC_IVAR____TtC11AssistantUI26AFUISiriCarPlayLatencyView_latencyLightView];
  *(void *)&v17[OBJC_IVAR____TtC11AssistantUI26AFUISiriCarPlayLatencyView_latencyLightView] = v20;

  id v23 = *(void **)&v17[v21];
  if (v23)
  {
    id v24 = v23;
    id v25 = objc_msgSend(v24, sel_layer);
    objc_msgSend(v25, sel_setCornerCurve_, *MEMORY[0x263F15A20]);

    id v26 = objc_msgSend(v24, sel_layer);
    objc_msgSend(v26, sel_setCornerRadius_, 13.0);

    sub_2230F0138();
    sub_2230F0128();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CB00);
    uint64_t v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = xmmword_2230F5F90;
    sub_2230EB920();
    *(void *)(v27 + 32) = sub_2230F0268();
    *(void *)(v27 + 40) = sub_2230F0268();
    *(void *)(v27 + 4_Block_object_dispose(&a9, 8) = sub_2230F0268();
    *(void *)(v27 + 56) = sub_2230F0268();
    *(void *)(v27 + 64) = sub_2230F0268();
    *(void *)(v27 + 72) = sub_2230F0268();
    *(void *)(v27 + 80) = sub_2230F0268();
    uint64_t v36 = v27;
    sub_2230F0258();
    sub_2230F0148();
    swift_bridgeObjectRelease();
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_2230F5FA0;
    *(void *)(v28 + 32) = sub_2230F0268();
    *(void *)(v28 + 40) = sub_2230F0268();
    *(void *)(v28 + 4_Block_object_dispose(&a9, 8) = sub_2230F0268();
    *(void *)(v28 + 56) = sub_2230F0268();
    *(void *)(v28 + 64) = sub_2230F0268();
    uint64_t v36 = v28;
    sub_2230F0258();
    sub_2230F0158();
    swift_bridgeObjectRelease();
    sub_2230F0118();
    id v29 = v24;
    objc_msgSend(v17, sel_bounds);
    objc_msgSend(v29, sel_setFrame_);

    objc_msgSend(v29, sel_setAutoresizingMask_, 18);
    objc_msgSend(v17, sel_addSubview_, v29);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v15);
}

id AFUISiriCarPlayLatencyView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AFUISiriCarPlayLatencyView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AFUISiriCarPlayLatencyView()
{
  return self;
}

uint64_t method lookup function for AFUISiriCarPlayLatencyView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AFUISiriCarPlayLatencyView);
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

unint64_t sub_2230EB920()
{
  unint64_t result = qword_267F9CB08;
  if (!qword_267F9CB08)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267F9CB08);
  }
  return result;
}

uint64_t sub_2230EB960()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void __getVMVoicemailManagerClass_block_invoke_cold_1(void *a1)
{
  objc_super v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *VisualVoicemailLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AFUIVoicemailPlayer.m", 24, @"%s", *a1);

  __break(1u);
}

void __getVMVoicemailManagerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getVMVoicemailManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AFUIVoicemailPlayer.m", 25, @"Unable to find class %s", "VMVoicemailManager");

  __break(1u);
}

void AFUIBulletinReadoutResultGetName_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "AFUIBulletinReadoutResultGetName";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_223099000, a2, OS_LOG_TYPE_ERROR, "%s Unsupported result %li", (uint8_t *)&v2, 0x16u);
}

void __getSTStorageAppHeaderCellClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *StorageSettingsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AFUICloudStorageViewController.m", 22, @"%s", *a1);

  __break(1u);
}

void __getSTStorageAppHeaderCellClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getSTStorageAppHeaderCellClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AFUICloudStorageViewController.m", 23, @"Unable to find class %s", "STStorageAppHeaderCell");

  __break(1u);
}

void getOptionalPKDarwinNotificationEventInAppPresented_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getPKDarwinNotificationEventInAppPresented(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AFUISiriSession.m", 138, @"%s", dlerror());

  __break(1u);
}

void __getPKDarwinNotificationEventInAppPresentedSymbolLoc_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *PassKitCoreLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AFUISiriSession.m", 137, @"%s", *a1);

  __break(1u);
}

void __getINStartCallIntentClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *IntentsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AFUISiriSession.m", 63, @"%s", *a1);

  __break(1u);
}

void __getINStartCallIntentClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getINStartCallIntentClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AFUISiriSession.m", 64, @"Unable to find class %s", "INStartCallIntent");

  __break(1u);
}

void __getBYSetupAssistantHasCompletedInitialRunSymbolLoc_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SetupAssistantLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AFUISiriLanguage.m", 13, @"%s", *a1);

  __break(1u);
}

void AFUIHasUnlockedSinceBoot_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"int soft_MKBDeviceUnlockedSinceBoot(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AFUIUtilities.m", 31, @"%s", dlerror());

  __break(1u);
}

void __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *MobileKeyBagLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AFUIUtilities.m", 30, @"%s", *a1);

  __break(1u);
}

void __getSSScreenshotsDisplayModeWillChangeToFullscreenNotificationNameSymbolLoc_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *ScreenshotServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AFUISiriViewController.m", 135, @"%s", *a1);

  __break(1u);
}

void __getVTStateManagerClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *VoiceTriggerLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AFUISiriViewController.m", 142, @"%s", *a1);

  __break(1u);
}

void __getVTStateManagerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getVTStateManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AFUISiriViewController.m", 143, @"Unable to find class %s", "VTStateManager");

  __break(1u);
}

void __getVTUITurnOnSiriViewClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getVTUITurnOnSiriViewClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AFUISiriSetupViewController.m", 56, @"Unable to find class %s", "VTUITurnOnSiriView");

  __break(1u);
}

void VoiceTriggerUILibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *VoiceTriggerUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AFUISiriSetupViewController.m", 55, @"%s", *a1);

  __break(1u);
}

void __getVTUISiriDataSharingOptInPresenterClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getVTUISiriDataSharingOptInPresenterClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AFUISiriSetupViewController.m", 57, @"Unable to find class %s", "VTUISiriDataSharingOptInPresenter");

  __break(1u);
}

void __getVTUIVoiceSelectionViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getVTUIVoiceSelectionViewControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AFUISiriSetupViewController.m", 58, @"Unable to find class %s", "VTUIVoiceSelectionViewController");

  __break(1u);
}

void __getBYFlowSkipControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getBYFlowSkipControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AFUISiriSetupViewController.m", 40, @"Unable to find class %s", "BYFlowSkipController");

  __break(1u);
}

void SetupAssistantLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SetupAssistantLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AFUISiriSetupViewController.m", 39, @"%s", *a1);

  __break(1u);
}

void __getOBPrivacyPresenterClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *OnBoardingKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AFUISiriSetupViewController.m", 29, @"%s", *a1);

  __break(1u);
}

void __getOBPrivacyPresenterClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getOBPrivacyPresenterClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AFUISiriSetupViewController.m", 30, @"Unable to find class %s", "OBPrivacyPresenter");

  __break(1u);
}

uint64_t sub_2230F0118()
{
  return MEMORY[0x270F81B60]();
}

uint64_t sub_2230F0128()
{
  return MEMORY[0x270F81B68]();
}

uint64_t sub_2230F0138()
{
  return MEMORY[0x270F81B70]();
}

uint64_t sub_2230F0148()
{
  return MEMORY[0x270F81B78]();
}

uint64_t sub_2230F0158()
{
  return MEMORY[0x270F81B80]();
}

uint64_t sub_2230F0168()
{
  return MEMORY[0x270F81B88]();
}

uint64_t sub_2230F0178()
{
  return MEMORY[0x270F81B90]();
}

uint64_t sub_2230F0188()
{
  return MEMORY[0x270F81EF8]();
}

uint64_t sub_2230F0198()
{
  return MEMORY[0x270F81F00]();
}

uint64_t sub_2230F01A8()
{
  return MEMORY[0x270F81F08]();
}

uint64_t sub_2230F01B8()
{
  return MEMORY[0x270F81F10]();
}

uint64_t sub_2230F01C8()
{
  return MEMORY[0x270F81F18]();
}

uint64_t sub_2230F01D8()
{
  return MEMORY[0x270F81F20]();
}

uint64_t sub_2230F01E8()
{
  return MEMORY[0x270F81F28]();
}

uint64_t sub_2230F01F8()
{
  return MEMORY[0x270F81F30]();
}

uint64_t sub_2230F0208()
{
  return MEMORY[0x270F81F38]();
}

uint64_t sub_2230F0218()
{
  return MEMORY[0x270F81F40]();
}

uint64_t sub_2230F0228()
{
  return MEMORY[0x270F81F48]();
}

uint64_t sub_2230F0238()
{
  return MEMORY[0x270F81F50]();
}

uint64_t sub_2230F0248()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2230F0258()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2230F0268()
{
  return MEMORY[0x270EF2170]();
}

uint64_t sub_2230F0278()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x270F0B6B0]();
}

uint64_t AFDeviceSupportsDisablingServerFallbackWhenMissingAsset()
{
  return MEMORY[0x270F0ECA8]();
}

uint64_t AFDeviceSupportsSystemAssistantExperience()
{
  return MEMORY[0x270F0ECF0]();
}

uint64_t AFGetMachAbsoluteTimeFromTimeInterval()
{
  return MEMORY[0x270F0ED50]();
}

uint64_t AFHasUnlockedSinceBoot()
{
  return MEMORY[0x270F0ED68]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x270F0EDD0]();
}

uint64_t AFLogDirectory()
{
  return MEMORY[0x270F0EE08]();
}

uint64_t AFMachAbsoluteTimeAddTimeInterval()
{
  return MEMORY[0x270F0EE18]();
}

uint64_t AFPreferencesATVStopRecordingDelay()
{
  return MEMORY[0x270F0EE88]();
}

uint64_t AFRecordCoreDuetEventWithStream()
{
  return MEMORY[0x270F0EF00]();
}

uint64_t AFRequestCancellationReasonGetName()
{
  return MEMORY[0x270F0EF10]();
}

uint64_t CAColorMatrixMakeMultiplyColor()
{
  return MEMORY[0x270EFB778]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x270EE4570](locArray, prefArray);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x270EE4580]();
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x270EE45C8](bundleID);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x270F0CDD0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x270EF2BF8]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F82BC0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F82BC8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x270F82BD8](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t SASCarPlayEnhancedVoiceTriggerModeToSISchemaEnhancedVoiceTriggerMode()
{
  return MEMORY[0x270F638D0]();
}

uint64_t SASCarPlayTransportTypeToSISchemaCarPlayConnection()
{
  return MEMORY[0x270F638D8]();
}

uint64_t SASDismissalReasonGetName()
{
  return MEMORY[0x270F638E8]();
}

uint64_t SASDismissalReasonToSISchemaDismissalReason()
{
  return MEMORY[0x270F638F0]();
}

uint64_t SASRequestSourceGetName()
{
  return MEMORY[0x270F638F8]();
}

uint64_t SBFWindowForViewControllerTransition()
{
  return MEMORY[0x270F77090]();
}

uint64_t SRUIFConstructLaunchContextForLaunchStarted()
{
  return MEMORY[0x270F72810]();
}

uint64_t SRUIFGetLanguageCode()
{
  return MEMORY[0x270F72818]();
}

uint64_t SRUIFInstrumentButtonLaunchSignpost()
{
  return MEMORY[0x270F72828]();
}

uint64_t SRUIFInstrumentQuickTypeGestureLaunchSignpost()
{
  return MEMORY[0x270F72850]();
}

uint64_t SRUIFInstrumentVoiceLaunchSignpost()
{
  return MEMORY[0x270F72858]();
}

uint64_t SRUIFInvokeOnMainQueue()
{
  return MEMORY[0x270F72860]();
}

uint64_t SRUIFShouldInstrumentLaunchContextForAceCommand()
{
  return MEMORY[0x270F72878]();
}

uint64_t SRUIFSiriSessionEventGetDescription()
{
  return MEMORY[0x270F72880]();
}

uint64_t SRUIFSiriSessionStateGetDescription()
{
  return MEMORY[0x270F72888]();
}

uint64_t SRUIFStringForUserAttentionGainEvent()
{
  return MEMORY[0x270F72890]();
}

uint64_t SRUIFStringForUserAttentionLossEvent()
{
  return MEMORY[0x270F72898]();
}

uint64_t ShouldShowWeibo()
{
  return MEMORY[0x270F55390]();
}

uint64_t SiriLanguageIsRTL()
{
  return MEMORY[0x270F727B8]();
}

uint64_t SiriSharedUIGestureEventDescription()
{
  return MEMORY[0x270F71080]();
}

uint64_t SiriSharedUIGestureEventRegionDescription()
{
  return MEMORY[0x270F71088]();
}

uint64_t SiriUIDeviceIsPad()
{
  return MEMORY[0x270F727C0]();
}

uint64_t SiriUIDeviceIsZoomed()
{
  return MEMORY[0x270F727C8]();
}

uint64_t SiriUIDeviceShouldDeferFlamesView()
{
  return MEMORY[0x270F727D0]();
}

uint64_t SiriUIDismissalReasonStringFromReason()
{
  return MEMORY[0x270F727D8]();
}

uint64_t SiriUIInvokeOnMainQueue()
{
  return MEMORY[0x270F727E0]();
}

uint64_t SiriUIIsAllOrientationsSupported()
{
  return MEMORY[0x270F727E8]();
}

uint64_t SiriUIIsCompactWidth()
{
  return MEMORY[0x270F727F0]();
}

uint64_t SiriUINSStringFromSiriUIViewMode()
{
  return MEMORY[0x270F727F8]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x270F82C48]();
}

uint64_t UIApplicationSceneDeactivationReasonMaskDescriptionComponents()
{
  return MEMORY[0x270F82CB0]();
}

uint64_t UICreateScreenImage()
{
  return MEMORY[0x270F82CE0]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F82EB8]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x270F82F18]();
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x270F82F28]();
}

uint64_t VSPreferencesSetSpokenLanguageIdentifier()
{
  return MEMORY[0x270F84540]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_suspend(dispatch_object_t object)
{
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

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x270EDAC68](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addopen(posix_spawn_file_actions_t *a1, int a2, const char *a3, int a4, mode_t a5)
{
  return MEMORY[0x270EDAC90](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x270EDAC98](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x270EDACA0](a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return MEMORY[0x270EDACA8](a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return MEMORY[0x270EDACB8](a1);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return MEMORY[0x270EDACC8](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

void sync(void)
{
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x270EDBB48](*(void *)&a1, a2, *(void *)&a3);
}