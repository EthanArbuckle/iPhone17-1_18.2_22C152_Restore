void sub_1DC5411E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,char a25)
{
  _Block_object_dispose(&a25, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DC541764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _AXAssetMakeError(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v10 = (objc_class *)NSString;
  id v11 = a2;
  id v12 = [v10 alloc];
  v13 = AXAssetLocalizedString(v11);

  v14 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  v15 = (void *)[v12 initWithFormat:v13 locale:v14 arguments:&a9];

  v16 = AXAssetMakeError_(a1, v15);

  return v16;
}

id AXAssetMakeError_(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = a2;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a2;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v3 errorWithDomain:@"AXAssetLoader" code:a1 userInfo:v6];

  return v7;
}

id AXAssetMakeErrorForQueryResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _AXAssetMakeError(a1 + 3000, @"generic.error", a3, a4, a5, a6, a7, a8, a9);
}

id AXAssetLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = AXAssetBundle();
  v3 = [v2 localizedStringForKey:v1 value:&stru_1F367E168 table:@"AXAssetLocalizedStrings"];

  return v3;
}

id AXAssetBundle()
{
  if (AXAssetBundle_onceToken != -1) {
    dispatch_once(&AXAssetBundle_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)AXAssetBundle__Bundle;
  return v0;
}

void sub_1DC541B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC541F10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location,id a41)
{
}

void sub_1DC542248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MAStringForMADownloadResultSoft(uint64_t a1)
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v2 = (void (*)(uint64_t))getMAStringForMADownloadResultSymbolLoc_ptr;
  v10 = getMAStringForMADownloadResultSymbolLoc_ptr;
  if (!getMAStringForMADownloadResultSymbolLoc_ptr)
  {
    v3 = (void *)MobileAssetLibrary_2();
    v8[3] = (uint64_t)dlsym(v3, "MAStringForMADownloadResult");
    getMAStringForMADownloadResultSymbolLoc_ptr = (_UNKNOWN *)v8[3];
    v2 = (void (*)(uint64_t))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    v6 = (_Unwind_Exception *)-[AXAudiogramIngestionAssetPolicy init]();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  v4 = v2(a1);
  return v4;
}

void sub_1DC543214(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DC5433CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC5436C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXSettingsClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AccessibilityUtilitiesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6C41EE8;
    uint64_t v6 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("AXSettings");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getAXSettingsClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAXSettingsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getASServerURLForAssetTypeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileAssetLibrary();
  uint64_t result = dlsym(v2, "ASServerURLForAssetType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getASServerURLForAssetTypeSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MobileAssetLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!MobileAssetLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __MobileAssetLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E6C41F20;
    uint64_t v5 = 0;
    MobileAssetLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = MobileAssetLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!MobileAssetLibraryCore_frameworkLibrary)
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

uint64_t __MobileAssetLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileAssetLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getMASetServerUrlOverrideSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileAssetLibrary();
  uint64_t result = dlsym(v2, "MASetServerUrlOverride");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMASetServerUrlOverrideSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getAXSettingsClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAXSettingsClass_softClass_0;
  uint64_t v7 = getAXSettingsClass_softClass_0;
  if (!getAXSettingsClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAXSettingsClass_block_invoke_0;
    v3[3] = &unk_1E6C41EC8;
    v3[4] = &v4;
    __getAXSettingsClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DC544668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC544884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXSettingsClass_block_invoke_0(uint64_t a1)
{
  AccessibilityUtilitiesLibrary();
  Class result = objc_getClass("AXSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAXSettingsClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAXSettingsClass_block_invoke_cold_1();
    return (Class)AccessibilityUtilitiesLibrary();
  }
  return result;
}

uint64_t AccessibilityUtilitiesLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __AccessibilityUtilitiesLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6C41F38;
    uint64_t v5 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = AccessibilityUtilitiesLibraryCore_frameworkLibrary_0;
  id v1 = (void *)v3[0];
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_0)
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

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getSCATSwitchSourceSoundSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AccessibilityUtilitiesLibrary();
  uint64_t result = dlsym(v2, "SCATSwitchSourceSound");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSCATSwitchSourceSoundSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DC546560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXSettingsClass_block_invoke_1(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_1)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __AccessibilityUtilitiesLibraryCore_block_invoke_1;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6C42020;
    uint64_t v6 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_1)
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
    Class result = objc_getClass("AXSettings");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getAXSettingsClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAXSettingsClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void sub_1DC546D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_1DC547068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC547280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DC547650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DC548F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1DC549354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC549768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMAAssetQueryClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MAAssetQuery");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMAAssetQueryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMAAssetQueryClass_block_invoke_cold_1();
    MobileAssetLibrary_0();
  }
}

void MobileAssetLibrary_0()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!MobileAssetLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __MobileAssetLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6C42318;
    uint64_t v3 = 0;
    MobileAssetLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!MobileAssetLibraryCore_frameworkLibrary_0)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __MobileAssetLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  MobileAssetLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getMADownloadOptionsClass_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  MobileAssetLibrary_0();
  Class result = objc_getClass("MADownloadOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMADownloadOptionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v11 = __getMADownloadOptionsClass_block_invoke_cold_1();
    return (Class)AXAssetMakeErrorForDownloadResult(v11, v12, v13, v14, v15, v16, v17, v18, a9);
  }
  return result;
}

id AXAssetMakeErrorForDownloadResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _AXAssetMakeError(a1 + 1000, @"generic.download.error", a3, a4, a5, a6, a7, a8, a9);
}

id AXAssetMakeErrorForPurgeResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _AXAssetMakeError(a1 + 2000, @"generic.error", a3, a4, a5, a6, a7, a8, a9);
}

void sub_1DC54C6F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
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

void *__getASAttributeContentVersionSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MobileAssetLibrary_1();
  Class result = dlsym(v2, "ASAttributeContentVersion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getASAttributeContentVersionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MobileAssetLibrary_1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!MobileAssetLibraryCore_frameworkLibrary_1)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __MobileAssetLibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6C42358;
    uint64_t v5 = 0;
    MobileAssetLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = MobileAssetLibraryCore_frameworkLibrary_1;
  id v1 = (void *)v3[0];
  if (!MobileAssetLibraryCore_frameworkLibrary_1)
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

uint64_t __MobileAssetLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  MobileAssetLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void *__getASAttributeCompatibilityVersionSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MobileAssetLibrary_1();
  uint64_t result = dlsym(v2, "ASAttributeCompatibilityVersion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getASAttributeCompatibilityVersionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getASAttributeDownloadSizeSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MobileAssetLibrary_1();
  uint64_t result = dlsym(v2, "ASAttributeDownloadSize");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getASAttributeDownloadSizeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getASAttributeUnarchivedSizeSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MobileAssetLibrary_1();
  uint64_t result = dlsym(v2, "ASAttributeUnarchivedSize");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getASAttributeUnarchivedSizeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t __AXAssetBundle_block_invoke()
{
  AXAssetBundle__Bundle = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  return MEMORY[0x1F41817F8]();
}

void sub_1DC54EB68(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t _AXCreateAXAssetsServiceInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3684B90];
}

void sub_1DC54F910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DC54FD3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_1DC550080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC5502C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC5509AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1DC550CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC550DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC5510BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC5523CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,id a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DC5529B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_1DC552D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_1DC55348C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMAStringForMADownloadResultSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MobileAssetLibrary_2();
  uint64_t result = dlsym(v2, "MAStringForMADownloadResult");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMAStringForMADownloadResultSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MobileAssetLibrary_2()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!MobileAssetLibraryCore_frameworkLibrary_2)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __MobileAssetLibraryCore_block_invoke_2;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6C42730;
    uint64_t v5 = 0;
    MobileAssetLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  uint64_t v0 = MobileAssetLibraryCore_frameworkLibrary_2;
  id v1 = (void *)v3[0];
  if (!MobileAssetLibraryCore_frameworkLibrary_2)
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

uint64_t __MobileAssetLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  MobileAssetLibraryCore_frameworkLibrary_2 = result;
  return result;
}

Class __getMAAssetClass_block_invoke(uint64_t a1)
{
  MobileAssetLibrary_2();
  Class result = objc_getClass("MAAsset");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getMAAssetClass_block_invoke_cold_1();
  }
  getMAAssetClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getMADownloadConfigClass_block_invoke(uint64_t a1)
{
  MobileAssetLibrary_2();
  Class result = objc_getClass("MADownloadConfig");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getMADownloadConfigClass_block_invoke_cold_1();
  }
  getMADownloadConfigClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getASServerURLForAssetTypeSymbolLoc_block_invoke_0(uint64_t a1)
{
  long long v2 = (void *)MobileAssetLibrary_2();
  Class result = dlsym(v2, "ASServerURLForAssetType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getASServerURLForAssetTypeSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getASSetAssetServerURLForAssetTypeSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MobileAssetLibrary_2();
  Class result = dlsym(v2, "ASSetAssetServerURLForAssetType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getASSetAssetServerURLForAssetTypeSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getAXSettingsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXTTSResourceAssetPolicy shouldDownloadAsset:withInstalledAssets:](v0);
}

uint64_t __getMAAssetQueryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getMADownloadOptionsClass_block_invoke_cold_1(v0);
}

uint64_t __getMADownloadOptionsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXAsset copyLocally](v0);
}

void __getMAAssetClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMADownloadConfigClass_block_invoke_cold_1(v0);
}

void __getMADownloadConfigClass_block_invoke_cold_1()
{
}

uint64_t AXCUProcessIsAXUIServer()
{
  return MEMORY[0x1F4105E60]();
}

uint64_t AXCUProcessIsAssistiveTouch()
{
  return MEMORY[0x1F4105E68]();
}

uint64_t AXCUProcessIsMagnifierAngel()
{
  return MEMORY[0x1F4105E70]();
}

uint64_t AXCUProcessIsPreferences()
{
  return MEMORY[0x1F4105E78]();
}

uint64_t AXCUProcessIsVoiceOverTouch()
{
  return MEMORY[0x1F4105E80]();
}

uint64_t AXCUProcessIsVoiceOverUtilityApp()
{
  return MEMORY[0x1F4105E88]();
}

uint64_t AXLogAssetLoader()
{
  return MEMORY[0x1F4105FB0]();
}

uint64_t AXLogAudiogram()
{
  return MEMORY[0x1F4105FB8]();
}

uint64_t AXLogCharacterVoices()
{
  return MEMORY[0x1F4105FD8]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x1F4105FE0]();
}

uint64_t AXLogSoundActions()
{
  return MEMORY[0x1F4106078]();
}

uint64_t AXLogUltron()
{
  return MEMORY[0x1F41060D8]();
}

uint64_t AXProcessIsAXAssetsd()
{
  return MEMORY[0x1F41061C0]();
}

uint64_t AXRuntimeCheck_SupportsMedina()
{
  return MEMORY[0x1F4106278]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1F40E7228]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1F40CD658]();
}