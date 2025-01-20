void sub_24016EBB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24016ECBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXValidationManagerClass_block_invoke(uint64_t a1)
{
  AccessibilityUtilitiesLibrary();
  Class result = objc_getClass("AXValidationManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXValidationManagerClass_block_invoke_cold_1();
  }
  getAXValidationManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXValidationManagerClass_block_invoke_0(uint64_t a1)
{
  AccessibilityUtilitiesLibrary_1();
  Class result = objc_getClass("AXValidationManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXValidationManagerClass_block_invoke_cold_1();
  }
  getAXValidationManagerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXValidationManagerClass_block_invoke_1(uint64_t a1)
{
  AccessibilityUtilitiesLibrary_4();
  Class result = objc_getClass("AXValidationManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXValidationManagerClass_block_invoke_cold_1();
  }
  getAXValidationManagerClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_24016F1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXBinaryMonitorClass_block_invoke(uint64_t a1)
{
  AccessibilityUtilitiesLibrary_1();
  Class result = objc_getClass("AXBinaryMonitor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXBinaryMonitorClass_block_invoke_cold_1();
  }
  getAXBinaryMonitorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXBinaryMonitorClass_block_invoke_0(uint64_t a1)
{
  AccessibilityUtilitiesLibrary_4();
  Class result = objc_getClass("AXBinaryMonitor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXBinaryMonitorClass_block_invoke_cold_1();
  }
  getAXBinaryMonitorClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL _hasBooleanEntitlement(__SecTask *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = a2;
  CFErrorRef error = 0;
  CFTypeRef v4 = SecTaskCopyValueForEntitlement(a1, v3, &error);
  if (error)
  {
    v5 = GAXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v11 = a1;
      __int16 v12 = 2112;
      v13 = v3;
      __int16 v14 = 2112;
      CFErrorRef v15 = error;
      _os_log_error_impl(&dword_24016D000, v5, OS_LOG_TYPE_ERROR, "Unable to check if task %@ has entitlement %@: %@", buf, 0x20u);
    }

    CFRelease(error);
  }
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    BOOL v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v4) != 0;
    CFRelease(v4);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void sub_24016FE5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AccessibilityUtilitiesLibrary()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __AccessibilityUtilitiesLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_26509DAC8;
    uint64_t v4 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = AccessibilityUtilitiesLibraryCore_frameworkLibrary;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary) {
    AccessibilityUtilitiesLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t AccessibilityUtilitiesLibrary_0()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_0)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __AccessibilityUtilitiesLibraryCore_block_invoke_0;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_26509DB88;
    uint64_t v4 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = AccessibilityUtilitiesLibraryCore_frameworkLibrary_0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_0) {
    AccessibilityUtilitiesLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t AccessibilityUtilitiesLibrary_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_1)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __AccessibilityUtilitiesLibraryCore_block_invoke_1;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_26509DBD0;
    uint64_t v4 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = AccessibilityUtilitiesLibraryCore_frameworkLibrary_1;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_1) {
    AccessibilityUtilitiesLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t AccessibilityUtilitiesLibrary_2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_2)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __AccessibilityUtilitiesLibraryCore_block_invoke_2;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_26509DC68;
    uint64_t v4 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  uint64_t v0 = AccessibilityUtilitiesLibraryCore_frameworkLibrary_2;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_2) {
    AccessibilityUtilitiesLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t AccessibilityUtilitiesLibrary_3()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_3)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __AccessibilityUtilitiesLibraryCore_block_invoke_3;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_26509DD40;
    uint64_t v4 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  }
  uint64_t v0 = AccessibilityUtilitiesLibraryCore_frameworkLibrary_3;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_3) {
    AccessibilityUtilitiesLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t AccessibilityUtilitiesLibrary_4()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_4)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __AccessibilityUtilitiesLibraryCore_block_invoke_4;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_26509DDE0;
    uint64_t v4 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_4 = _sl_dlopen();
  }
  uint64_t v0 = AccessibilityUtilitiesLibraryCore_frameworkLibrary_4;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_4) {
    AccessibilityUtilitiesLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t soft_AXProcessIsSystemApplication()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))getAXProcessIsSystemApplicationSymbolLoc_ptr;
  CFTypeID v6 = getAXProcessIsSystemApplicationSymbolLoc_ptr;
  if (!getAXProcessIsSystemApplicationSymbolLoc_ptr)
  {
    v1 = (void *)AccessibilityUtilitiesLibrary_1();
    v4[3] = (uint64_t)dlsym(v1, "AXProcessIsSystemApplication");
    getAXProcessIsSystemApplicationSymbolLoc_ptr = (_UNKNOWN *)v4[3];
    uint64_t v0 = (uint64_t (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    soft_AXProcessIsSystemApplication_cold_1();
  }
  return v0();
}

void sub_240170538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAXSettingsClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAXSettingsClass_softClass;
  uint64_t v7 = getAXSettingsClass_softClass;
  if (!getAXSettingsClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAXSettingsClass_block_invoke;
    v3[3] = &unk_26509DAA8;
    v3[4] = &v4;
    __getAXSettingsClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_24017061C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAXSettingsClass_0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAXSettingsClass_softClass_0;
  uint64_t v7 = getAXSettingsClass_softClass_0;
  if (!getAXSettingsClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAXSettingsClass_block_invoke_0;
    v3[3] = &unk_26509DAA8;
    v3[4] = &v4;
    __getAXSettingsClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_240170700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXSettingsClass_block_invoke(uint64_t a1)
{
  AccessibilityUtilitiesLibrary();
  Class result = objc_getClass("AXSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXSettingsClass_block_invoke_cold_1();
  }
  getAXSettingsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXSettingsClass_block_invoke_0(uint64_t a1)
{
  AccessibilityUtilitiesLibrary_1();
  Class result = objc_getClass("AXSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXSettingsClass_block_invoke_cold_1();
  }
  getAXSettingsClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_240170D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_240170EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_240171814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getZoomServicesClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getZoomServicesClass_softClass;
  uint64_t v7 = getZoomServicesClass_softClass;
  if (!getZoomServicesClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getZoomServicesClass_block_invoke;
    v3[3] = &unk_26509DAA8;
    v3[4] = &v4;
    __getZoomServicesClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_240171ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXDeviceHasHomeButton()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))getAXDeviceHasHomeButtonSymbolLoc_ptr;
  uint64_t v6 = getAXDeviceHasHomeButtonSymbolLoc_ptr;
  if (!getAXDeviceHasHomeButtonSymbolLoc_ptr)
  {
    id v1 = (void *)AccessibilityUtilitiesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "AXDeviceHasHomeButton");
    getAXDeviceHasHomeButtonSymbolLoc_ptr = (_UNKNOWN *)v4[3];
    uint64_t v0 = (uint64_t (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    soft_AXDeviceHasHomeButton_cold_1();
  }
  return v0();
}

void sub_240171CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXDeviceIsPad()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))getAXDeviceIsPadSymbolLoc_ptr;
  uint64_t v6 = getAXDeviceIsPadSymbolLoc_ptr;
  if (!getAXDeviceIsPadSymbolLoc_ptr)
  {
    id v1 = (void *)AccessibilityUtilitiesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "AXDeviceIsPad");
    getAXDeviceIsPadSymbolLoc_ptr = (_UNKNOWN *)v4[3];
    uint64_t v0 = (uint64_t (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    soft_AXDeviceIsPad_cold_1();
  }
  return v0();
}

void sub_240171DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXProcessIsSpringBoard()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))getAXProcessIsSpringBoardSymbolLoc_ptr;
  uint64_t v6 = getAXProcessIsSpringBoardSymbolLoc_ptr;
  if (!getAXProcessIsSpringBoardSymbolLoc_ptr)
  {
    id v1 = (void *)AccessibilityUtilitiesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "AXProcessIsSpringBoard");
    getAXProcessIsSpringBoardSymbolLoc_ptr = (_UNKNOWN *)v4[3];
    uint64_t v0 = (uint64_t (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    soft_AXProcessIsSpringBoard_cold_1();
  }
  return v0();
}

void sub_24017219C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2401722CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t soft___ax_verbose_encode_with_type_encoding_group_class(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v2 = (uint64_t (*)(uint64_t, const char *))get__ax_verbose_encode_with_type_encoding_group_classSymbolLoc_ptr;
  v8 = get__ax_verbose_encode_with_type_encoding_group_classSymbolLoc_ptr;
  if (!get__ax_verbose_encode_with_type_encoding_group_classSymbolLoc_ptr)
  {
    uint64_t v3 = (void *)AccessibilityUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v3, "__ax_verbose_encode_with_type_encoding_group_class");
    get__ax_verbose_encode_with_type_encoding_group_classSymbolLoc_ptr = (_UNKNOWN *)v6[3];
    v2 = (uint64_t (*)(uint64_t, const char *))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2) {
    soft___ax_verbose_encode_with_type_encoding_group_class_cold_1();
  }
  return v2(a1, "__CGPoint__");
}

void sub_240172994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXProcessIsInCallService()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))getAXProcessIsInCallServiceSymbolLoc_ptr;
  uint64_t v6 = getAXProcessIsInCallServiceSymbolLoc_ptr;
  if (!getAXProcessIsInCallServiceSymbolLoc_ptr)
  {
    id v1 = (void *)AccessibilityUtilitiesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "AXProcessIsInCallService");
    getAXProcessIsInCallServiceSymbolLoc_ptr = (_UNKNOWN *)v4[3];
    uint64_t v0 = (uint64_t (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    soft_AXProcessIsInCallService_cold_1();
  }
  return v0();
}

void sub_240172A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_240172BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXUIKeyboardIsOnScreen()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))getAXUIKeyboardIsOnScreenSymbolLoc_ptr;
  uint64_t v6 = getAXUIKeyboardIsOnScreenSymbolLoc_ptr;
  if (!getAXUIKeyboardIsOnScreenSymbolLoc_ptr)
  {
    id v1 = (void *)AccessibilityUIUtilitiesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "AXUIKeyboardIsOnScreen");
    getAXUIKeyboardIsOnScreenSymbolLoc_ptr = (_UNKNOWN *)v4[3];
    uint64_t v0 = (uint64_t (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    soft_AXUIKeyboardIsOnScreen_cold_1();
  }
  return v0();
}

void sub_240172ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInside()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))getAXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInsideSymbolLoc_ptr;
  uint64_t v6 = getAXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInsideSymbolLoc_ptr;
  if (!getAXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInsideSymbolLoc_ptr)
  {
    id v1 = (void *)AccessibilityUIUtilitiesLibrary();
    v4[3] = (uint64_t)dlsym(v1, "AXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInside");
    getAXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInsideSymbolLoc_ptr = (_UNKNOWN *)v4[3];
    uint64_t v0 = (uint64_t (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    soft_AXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInside_cold_1();
  }
  return v0();
}

void sub_240172FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id soft_AXUIKeyboardWindow()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void (*)(void))getAXUIKeyboardWindowSymbolLoc_ptr;
  uint64_t v7 = getAXUIKeyboardWindowSymbolLoc_ptr;
  if (!getAXUIKeyboardWindowSymbolLoc_ptr)
  {
    id v1 = (void *)AccessibilityUIUtilitiesLibrary();
    v5[3] = (uint64_t)dlsym(v1, "AXUIKeyboardWindow");
    getAXUIKeyboardWindowSymbolLoc_ptr = (_UNKNOWN *)v5[3];
    uint64_t v0 = (void (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    soft_AXUIKeyboardWindow_cold_1();
  }
  v2 = v0();

  return v2;
}

void sub_2401730DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double soft_AXUIConvertRectFromScreenToContextSpace(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  uint64_t v14 = 0;
  CFErrorRef v15 = &v14;
  uint64_t v16 = 0x2020000000;
  v10 = (double (*)(id, double, double, double, double))getAXUIConvertRectFromScreenToContextSpaceSymbolLoc_ptr;
  v17 = getAXUIConvertRectFromScreenToContextSpaceSymbolLoc_ptr;
  if (!getAXUIConvertRectFromScreenToContextSpaceSymbolLoc_ptr)
  {
    v11 = (void *)AccessibilityUIUtilitiesLibrary();
    v15[3] = (uint64_t)dlsym(v11, "AXUIConvertRectFromScreenToContextSpace");
    getAXUIConvertRectFromScreenToContextSpaceSymbolLoc_ptr = (_UNKNOWN *)v15[3];
    v10 = (double (*)(id, double, double, double, double))v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v10) {
    soft_AXUIConvertRectFromScreenToContextSpace_cold_1();
  }
  double v12 = v10(v9, a2, a3, a4, a5);

  return v12;
}

void sub_2401736AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_240173960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAXBackBoardServerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAXBackBoardServerClass_softClass;
  uint64_t v7 = getAXBackBoardServerClass_softClass;
  if (!getAXBackBoardServerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAXBackBoardServerClass_block_invoke;
    v3[3] = &unk_26509DAA8;
    v3[4] = &v4;
    __getAXBackBoardServerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_240173AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_240174580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

void soft_AXPerformSafeBlock(void *a1)
{
  id v1 = a1;
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v2 = (void (*)(id))getAXPerformSafeBlockSymbolLoc_ptr;
  uint64_t v7 = getAXPerformSafeBlockSymbolLoc_ptr;
  if (!getAXPerformSafeBlockSymbolLoc_ptr)
  {
    uint64_t v3 = (void *)AccessibilityUtilitiesLibrary();
    v5[3] = (uint64_t)dlsym(v3, "AXPerformSafeBlock");
    getAXPerformSafeBlockSymbolLoc_ptr = (_UNKNOWN *)v5[3];
    v2 = (void (*)(id))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v2) {
    soft_AXPerformSafeBlock_cold_1();
  }
  v2(v1);
}

void sub_24017469C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id soft___UIAccessibilityCastAsClass(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v6 = (void (*)(uint64_t, id, uint64_t, uint64_t))get__UIAccessibilityCastAsClassSymbolLoc_ptr;
  v13 = get__UIAccessibilityCastAsClassSymbolLoc_ptr;
  if (!get__UIAccessibilityCastAsClassSymbolLoc_ptr)
  {
    uint64_t v7 = (void *)AccessibilityUtilitiesLibrary();
    v11[3] = (uint64_t)dlsym(v7, "__UIAccessibilityCastAsClass");
    get__UIAccessibilityCastAsClassSymbolLoc_ptr = (_UNKNOWN *)v11[3];
    uint64_t v6 = (void (*)(uint64_t, id, uint64_t, uint64_t))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v6) {
    soft___UIAccessibilityCastAsClass_cold_1();
  }
  v8 = v6(a1, v5, 1, a3);

  return v8;
}

void sub_240175774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id soft_AXSafeClassFromString(void *a1)
{
  id v1 = a1;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v2 = (void (*)(id))getAXSafeClassFromStringSymbolLoc_ptr;
  id v9 = getAXSafeClassFromStringSymbolLoc_ptr;
  if (!getAXSafeClassFromStringSymbolLoc_ptr)
  {
    uint64_t v3 = (void *)AccessibilityUtilitiesLibrary();
    v7[3] = (uint64_t)dlsym(v3, "AXSafeClassFromString");
    getAXSafeClassFromStringSymbolLoc_ptr = (_UNKNOWN *)v7[3];
    v2 = (void (*)(id))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2) {
    soft_AXSafeClassFromString_cold_1();
  }
  uint64_t v4 = v2(v1);

  return v4;
}

void sub_2401758A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_240175EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_240176164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAXProcessIsAXUIServerSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary();
  Class result = dlsym(v2, "AXProcessIsAXUIServer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXProcessIsAXUIServerSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getZoomServicesClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!operator||)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __ZoomServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26509DB00;
    uint64_t v5 = 0;
    operator|| = _sl_dlopen();
  }
  if (!operator||) {
    __getZoomServicesClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("ZoomServices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getZoomServicesClass_block_invoke_cold_2();
  }
  getZoomServicesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ZoomServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  operator|| = result;
  return result;
}

void *__getAXDeviceHasHomeButtonSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary();
  uint64_t result = dlsym(v2, "AXDeviceHasHomeButton");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXDeviceHasHomeButtonSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXDeviceIsPadSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary();
  uint64_t result = dlsym(v2, "AXDeviceIsPad");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXDeviceIsPadSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXProcessIsSpringBoardSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary();
  uint64_t result = dlsym(v2, "AXProcessIsSpringBoard");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXProcessIsSpringBoardSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__get__ax_verbose_encode_with_type_encoding_group_classSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary();
  uint64_t result = dlsym(v2, "__ax_verbose_encode_with_type_encoding_group_class");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get__ax_verbose_encode_with_type_encoding_group_classSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32)
                                                                                                + 8)
                                                                                    + 24);
  return result;
}

void *__getAXProcessIsInCallServiceSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary();
  uint64_t result = dlsym(v2, "AXProcessIsInCallService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXProcessIsInCallServiceSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXPerformValidationChecksSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary();
  uint64_t result = dlsym(v2, "AXPerformValidationChecks");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXPerformValidationChecksSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXUIKeyboardIsOnScreenSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUIUtilitiesLibrary();
  uint64_t result = dlsym(v2, "AXUIKeyboardIsOnScreen");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXUIKeyboardIsOnScreenSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AccessibilityUIUtilitiesLibrary()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!AccessibilityUIUtilitiesLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __AccessibilityUIUtilitiesLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_26509DB18;
    uint64_t v4 = 0;
    AccessibilityUIUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = AccessibilityUIUtilitiesLibraryCore_frameworkLibrary;
  if (!AccessibilityUIUtilitiesLibraryCore_frameworkLibrary) {
    AccessibilityUIUtilitiesLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __AccessibilityUIUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUIUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInsideSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUIUtilitiesLibrary();
  uint64_t result = dlsym(v2, "AXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInside");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInsideSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXUIKeyboardWindowSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUIUtilitiesLibrary();
  uint64_t result = dlsym(v2, "AXUIKeyboardWindow");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXUIKeyboardWindowSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXUIConvertRectFromScreenToContextSpaceSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUIUtilitiesLibrary();
  uint64_t result = dlsym(v2, "AXUIConvertRectFromScreenToContextSpace");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXUIConvertRectFromScreenToContextSpaceSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXUIRectForZoomFocusChangeNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUIUtilitiesLibrary();
  uint64_t result = dlsym(v2, "AXUIRectForZoomFocusChangeNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXUIRectForZoomFocusChangeNotificationSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXBackBoardServerClass_block_invoke(uint64_t a1)
{
  AccessibilityUtilitiesLibrary();
  Class result = objc_getClass("AXBackBoardServer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXBackBoardServerClass_block_invoke_cold_1();
  }
  getAXBackBoardServerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXPerformSafeBlockSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary();
  Class result = dlsym(v2, "AXPerformSafeBlock");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXPerformSafeBlockSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXSafeClassFromStringSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary();
  Class result = dlsym(v2, "AXSafeClassFromString");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXSafeClassFromStringSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_240176CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSpeakTypingServicesClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSpeakTypingServicesClass_softClass;
  uint64_t v7 = getSpeakTypingServicesClass_softClass;
  if (!getSpeakTypingServicesClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSpeakTypingServicesClass_block_invoke;
    v3[3] = &unk_26509DAA8;
    v3[4] = &v4;
    __getSpeakTypingServicesClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_240176F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24017725C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2401773AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTTSSpeechSynthesizerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!TextToSpeechLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __TextToSpeechLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26509DB58;
    uint64_t v5 = 0;
    TextToSpeechLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!TextToSpeechLibraryCore_frameworkLibrary) {
    __getTTSSpeechSynthesizerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("TTSSpeechSynthesizer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getTTSSpeechSynthesizerClass_block_invoke_cold_2();
  }
  getTTSSpeechSynthesizerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __TextToSpeechLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TextToSpeechLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getSpeakTypingServicesClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SpeakTypingServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __SpeakTypingServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26509DB70;
    uint64_t v5 = 0;
    SpeakTypingServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SpeakTypingServicesLibraryCore_frameworkLibrary) {
    __getSpeakTypingServicesClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("SpeakTypingServices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSpeakTypingServicesClass_block_invoke_cold_2();
  }
  getSpeakTypingServicesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpeakTypingServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpeakTypingServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAXSafeClassFromStringSymbolLoc_block_invoke_0(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary_0();
  uint64_t result = dlsym(v2, "AXSafeClassFromString");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXSafeClassFromStringSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getAXLanguageCanonicalFormToGeneralLanguageSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary_0();
  uint64_t result = dlsym(v2, "AXLanguageCanonicalFormToGeneralLanguage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXLanguageCanonicalFormToGeneralLanguageSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

void sub_240177B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAXBackBoardServerClass_0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getAXBackBoardServerClass_softClass_0;
  uint64_t v7 = getAXBackBoardServerClass_softClass_0;
  if (!getAXBackBoardServerClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAXBackBoardServerClass_block_invoke_0;
    v3[3] = &unk_26509DAA8;
    v3[4] = &v4;
    __getAXBackBoardServerClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_240177BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_240177EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXProcessIsSpringBoard_0()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))getAXProcessIsSpringBoardSymbolLoc_ptr_0;
  uint64_t v6 = getAXProcessIsSpringBoardSymbolLoc_ptr_0;
  if (!getAXProcessIsSpringBoardSymbolLoc_ptr_0)
  {
    id v1 = (void *)AccessibilityUtilitiesLibrary_1();
    v4[3] = (uint64_t)dlsym(v1, "AXProcessIsSpringBoard");
    getAXProcessIsSpringBoardSymbolLoc_ptr_0 = (_UNKNOWN *)v4[3];
    uint64_t v0 = (uint64_t (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    soft_AXProcessIsSpringBoard_cold_1();
  }
  return v0();
}

void sub_240177FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_240178284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXResourceLoaderClass_block_invoke(uint64_t a1)
{
  AccessibilityUtilitiesLibrary_1();
  Class result = objc_getClass("AXResourceLoader");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXResourceLoaderClass_block_invoke_cold_1();
  }
  getAXResourceLoaderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void *__getAXProcessIsSystemApplicationSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary_1();
  uint64_t result = dlsym(v2, "AXProcessIsSystemApplication");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXProcessIsSystemApplicationSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXBackBoardServerClass_block_invoke_0(uint64_t a1)
{
  AccessibilityUtilitiesLibrary_1();
  Class result = objc_getClass("AXBackBoardServer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXBackBoardServerClass_block_invoke_cold_1();
  }
  getAXBackBoardServerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXProcessIsSpringBoardSymbolLoc_block_invoke_0(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary_1();
  Class result = dlsym(v2, "AXProcessIsSpringBoard");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXProcessIsSpringBoardSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXCurrentProcessExistsInLoginSessionSBOnlySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary_1();
  Class result = dlsym(v2, "AXCurrentProcessExistsInLoginSessionSBOnly");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXCurrentProcessExistsInLoginSessionSBOnlySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

void *__getAXDeviceHasHomeButtonSymbolLoc_block_invoke_0(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary_1();
  Class result = dlsym(v2, "AXDeviceHasHomeButton");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXDeviceHasHomeButtonSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXDeviceIsPhoneSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary_1();
  Class result = dlsym(v2, "AXDeviceIsPhone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXDeviceIsPhoneSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXProcessIsSetupSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary_1();
  Class result = dlsym(v2, "AXProcessIsSetup");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXProcessIsSetupSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXProcessIsPreBoardSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary_1();
  Class result = dlsym(v2, "AXProcessIsPreBoard");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXProcessIsPreBoardSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXProcessIsCheckerBoardSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary_1();
  Class result = dlsym(v2, "AXProcessIsCheckerBoard");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXProcessIsCheckerBoardSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXLoadAccessibilityDebuggerIfNeededSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary_1();
  Class result = dlsym(v2, "AXLoadAccessibilityDebuggerIfNeeded");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXLoadAccessibilityDebuggerIfNeededSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXPerformValidationChecksSymbolLoc_block_invoke_0(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary_1();
  Class result = dlsym(v2, "AXPerformValidationChecks");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXPerformValidationChecksSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkMADisplayFilterSettingsChangedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!MediaAccessibilityLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = __MediaAccessibilityLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26509DBE8;
    uint64_t v6 = 0;
    MediaAccessibilityLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v2 = (void *)MediaAccessibilityLibraryCore_frameworkLibrary;
  if (!MediaAccessibilityLibraryCore_frameworkLibrary) {
    __getkMADisplayFilterSettingsChangedNotificationSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  Class result = dlsym(v2, "kMADisplayFilterSettingsChangedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMADisplayFilterSettingsChangedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

uint64_t __MediaAccessibilityLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaAccessibilityLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAXSpringBoardUserChangedAudioRouteNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary_1();
  uint64_t result = dlsym(v2, "AXSpringBoardUserChangedAudioRouteNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXSpringBoardUserChangedAudioRouteNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

void _handleGuidedAccessActiveStatusDidChangeBroadcastNotification()
{
  uint64_t v0 = (void *)MEMORY[0x2455E0E60]();
  id v1 = [MEMORY[0x263F08A00] defaultCenter];
  [v1 postNotificationName:*MEMORY[0x263F1CE08] object:0];
}

void sub_240178C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_240178D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_240178ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXReplayerClass_block_invoke(uint64_t a1)
{
  AccessibilityUtilitiesLibrary_2();
  Class result = objc_getClass("AXReplayer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXReplayerClass_block_invoke_cold_1();
  }
  getAXReplayerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary_2 = result;
  return result;
}

Class __getAXBackBoardServerClass_block_invoke_1(uint64_t a1)
{
  AccessibilityUtilitiesLibrary_2();
  Class result = objc_getClass("AXBackBoardServer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXBackBoardServerClass_block_invoke_cold_1();
  }
  getAXBackBoardServerClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXProcessIsSpringBoardSymbolLoc_block_invoke_1(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary_2();
  Class result = dlsym(v2, "AXProcessIsSpringBoard");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXProcessIsSpringBoardSymbolLoc_ptr_1 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void _axSettingsHandlePreferenceChanged(int a1, int a2, CFStringRef theString1)
{
  if (CFStringCompare(theString1, (CFStringRef)*MEMORY[0x263F8B1F0], 0))
  {
    if (CFStringCompare(theString1, (CFStringRef)*MEMORY[0x263F8B1F8], 0)) {
      return;
    }
    uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    long long v5 = (void *)getAXMFiHearingDeviceStreamingEarDidChangeNotificationSymbolLoc_ptr;
    uint64_t v11 = getAXMFiHearingDeviceStreamingEarDidChangeNotificationSymbolLoc_ptr;
    if (!getAXMFiHearingDeviceStreamingEarDidChangeNotificationSymbolLoc_ptr)
    {
      uint64_t v6 = (void *)AccessibilityLibrary();
      v9[3] = (uint64_t)dlsym(v6, "AXMFiHearingDeviceStreamingEarDidChangeNotification");
      getAXMFiHearingDeviceStreamingEarDidChangeNotificationSymbolLoc_ptr = v9[3];
      long long v5 = (void *)v9[3];
    }
    _Block_object_dispose(&v8, 8);
    if (!v5) {
      _axSettingsHandlePreferenceChanged_cold_2();
    }
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    long long v5 = (void *)getAXMFiHearingDevicePairedUUIDsDidChangeNotificationSymbolLoc_ptr;
    uint64_t v11 = getAXMFiHearingDevicePairedUUIDsDidChangeNotificationSymbolLoc_ptr;
    if (!getAXMFiHearingDevicePairedUUIDsDidChangeNotificationSymbolLoc_ptr)
    {
      uint64_t v7 = (void *)AccessibilityLibrary();
      v9[3] = (uint64_t)dlsym(v7, "AXMFiHearingDevicePairedUUIDsDidChangeNotification");
      getAXMFiHearingDevicePairedUUIDsDidChangeNotificationSymbolLoc_ptr = v9[3];
      long long v5 = (void *)v9[3];
    }
    _Block_object_dispose(&v8, 8);
    if (!v5) {
      _axSettingsHandlePreferenceChanged_cold_1();
    }
  }
  [v4 postNotificationName:*v5 object:0];
}

void sub_24017961C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAXMFiHearingDevicePairedUUIDsDidChangeNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityLibrary();
  Class result = dlsym(v2, "AXMFiHearingDevicePairedUUIDsDidChangeNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXMFiHearingDevicePairedUUIDsDidChangeNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                 + 24);
  return result;
}

uint64_t AccessibilityLibrary()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!AccessibilityLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __AccessibilityLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_26509DC80;
    uint64_t v4 = 0;
    AccessibilityLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = AccessibilityLibraryCore_frameworkLibrary;
  if (!AccessibilityLibraryCore_frameworkLibrary) {
    AccessibilityLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __AccessibilityLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAXMFiHearingDeviceStreamingEarDidChangeNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityLibrary();
  uint64_t result = dlsym(v2, "AXMFiHearingDeviceStreamingEarDidChangeNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXMFiHearingDeviceStreamingEarDidChangeNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 24);
  return result;
}

id getSpeakThisServicesClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSpeakThisServicesClass_softClass;
  uint64_t v7 = getSpeakThisServicesClass_softClass;
  if (!getSpeakThisServicesClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSpeakThisServicesClass_block_invoke;
    v3[3] = &unk_26509DAA8;
    v3[4] = &v4;
    __getSpeakThisServicesClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_240179B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSpeakThisServicesClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SpeakThisServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __SpeakThisServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26509DCB8;
    uint64_t v5 = 0;
    SpeakThisServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SpeakThisServicesLibraryCore_frameworkLibrary) {
    __getSpeakThisServicesClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("SpeakThisServices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSpeakThisServicesClass_block_invoke_cold_2();
  }
  getSpeakThisServicesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpeakThisServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpeakThisServicesLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t _handleInvertColorsPreload()
{
  uint64_t v0 = AXLogInvertColorsLoadBundles();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_24016D000, v0, OS_LOG_TYPE_INFO, "Handling invert colors pre-load", v2, 2u);
  }

  _AXSInvertColorsReloadPreferenceImmediately();
  +[AXInvertColorsController loadInvertColorsBundle];
  return _AXSInvertColorsMarkInvertColorsPreloadComplete();
}

void sub_24017A50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24017ABB8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXProcessIsAssistiveTouch()
{
  uint64_t v3 = 0;
  long long v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))getAXProcessIsAssistiveTouchSymbolLoc_ptr;
  uint64_t v6 = getAXProcessIsAssistiveTouchSymbolLoc_ptr;
  if (!getAXProcessIsAssistiveTouchSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)AccessibilityUtilitiesLibrary_3();
    v4[3] = (uint64_t)dlsym(v1, "AXProcessIsAssistiveTouch");
    getAXProcessIsAssistiveTouchSymbolLoc_ptr = (_UNKNOWN *)v4[3];
    uint64_t v0 = (uint64_t (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    soft_AXProcessIsAssistiveTouch_cold_1();
  }
  return v0();
}

void sub_24017ACB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXProcessIsSpringBoard_1()
{
  uint64_t v3 = 0;
  long long v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))getAXProcessIsSpringBoardSymbolLoc_ptr_2;
  uint64_t v6 = getAXProcessIsSpringBoardSymbolLoc_ptr_2;
  if (!getAXProcessIsSpringBoardSymbolLoc_ptr_2)
  {
    uint64_t v1 = (void *)AccessibilityUtilitiesLibrary_3();
    v4[3] = (uint64_t)dlsym(v1, "AXProcessIsSpringBoard");
    getAXProcessIsSpringBoardSymbolLoc_ptr_2 = (_UNKNOWN *)v4[3];
    uint64_t v0 = (uint64_t (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    soft_AXProcessIsSpringBoard_cold_1();
  }
  return v0();
}

void sub_24017ADA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _accessibilityASTEnabled()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void *__getAXUIKeyboardIsOnScreenSymbolLoc_block_invoke_0(uint64_t a1)
{
  v2 = (void *)AccessibilityUIUtilitiesLibrary_0();
  uint64_t result = dlsym(v2, "AXUIKeyboardIsOnScreen");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXUIKeyboardIsOnScreenSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AccessibilityUIUtilitiesLibrary_0()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!AccessibilityUIUtilitiesLibraryCore_frameworkLibrary_0)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __AccessibilityUIUtilitiesLibraryCore_block_invoke_0;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_26509DD28;
    uint64_t v4 = 0;
    AccessibilityUIUtilitiesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = AccessibilityUIUtilitiesLibraryCore_frameworkLibrary_0;
  if (!AccessibilityUIUtilitiesLibraryCore_frameworkLibrary_0) {
    AccessibilityUIUtilitiesLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __AccessibilityUIUtilitiesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUIUtilitiesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getAXUIKeyboardScreenFrameSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUIUtilitiesLibrary_0();
  uint64_t result = dlsym(v2, "AXUIKeyboardScreenFrame");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXUIKeyboardScreenFrameSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXProcessIsAssistiveTouchSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary_3();
  uint64_t result = dlsym(v2, "AXProcessIsAssistiveTouch");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXProcessIsAssistiveTouchSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary_3 = result;
  return result;
}

void *__getAXProcessIsSpringBoardSymbolLoc_block_invoke_2(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary_3();
  uint64_t result = dlsym(v2, "AXProcessIsSpringBoard");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXProcessIsSpringBoardSymbolLoc_ptr_2 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXProcessIsSpotlightSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary_3();
  uint64_t result = dlsym(v2, "AXProcessIsSpotlight");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXProcessIsSpotlightSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXProcessIsSetupSymbolLoc_block_invoke_0(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary_3();
  uint64_t result = dlsym(v2, "AXProcessIsSetup");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXProcessIsSetupSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___accessibilityASTEnabled_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enable];
}

void typingFeedback()
{
  id v0 = +[SpeakTypingManager sharedInstance];
  [v0 updateForCurrentTypingFeedbackStatus];
}

void quickTypePredictionFeedback()
{
  id v0 = +[SpeakTypingManager sharedInstance];
  [v0 updateForCurrentQuickTypeFeedbackStatus];
}

void wordFeedback()
{
  id v0 = +[SpeakTypingManager sharedInstance];
  [v0 updateForCurrentWordFeedbackStatus];
}

id getSpeakTypingServicesClass_0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getSpeakTypingServicesClass_softClass_0;
  uint64_t v7 = getSpeakTypingServicesClass_softClass_0;
  if (!getSpeakTypingServicesClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSpeakTypingServicesClass_block_invoke_0;
    v3[3] = &unk_26509DAA8;
    v3[4] = &v4;
    __getSpeakTypingServicesClass_block_invoke_0((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_24017B978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void soft_AXPerformSafeBlock_0(void *a1)
{
  id v1 = a1;
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v2 = (void (*)(id))getAXPerformSafeBlockSymbolLoc_ptr_0;
  uint64_t v7 = getAXPerformSafeBlockSymbolLoc_ptr_0;
  if (!getAXPerformSafeBlockSymbolLoc_ptr_0)
  {
    long long v3 = (void *)AccessibilityUtilitiesLibrary_4();
    v5[3] = (uint64_t)dlsym(v3, "AXPerformSafeBlock");
    getAXPerformSafeBlockSymbolLoc_ptr_0 = (_UNKNOWN *)v5[3];
    v2 = (void (*)(id))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v2) {
    soft_AXPerformSafeBlock_cold_1();
  }
  v2(v1);
}

void sub_24017BA94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24017BCC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24017BF5C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_24017C090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAXValidationManagerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getAXValidationManagerClass_softClass_1;
  uint64_t v7 = getAXValidationManagerClass_softClass_1;
  if (!getAXValidationManagerClass_softClass_1)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAXValidationManagerClass_block_invoke_1;
    v3[3] = &unk_26509DAA8;
    v3[4] = &v4;
    __getAXValidationManagerClass_block_invoke_1((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_24017C174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXPerformValidationChecks()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  id v0 = (uint64_t (*)(void))getAXPerformValidationChecksSymbolLoc_ptr_1;
  uint64_t v6 = getAXPerformValidationChecksSymbolLoc_ptr_1;
  if (!getAXPerformValidationChecksSymbolLoc_ptr_1)
  {
    id v1 = (void *)AccessibilityUtilitiesLibrary_4();
    v4[3] = (uint64_t)dlsym(v1, "AXPerformValidationChecks");
    getAXPerformValidationChecksSymbolLoc_ptr_1 = (_UNKNOWN *)v4[3];
    id v0 = (uint64_t (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    __54__ZoomServicesUI__installZoomUISafeCategoriesIfNeeded__block_invoke_3_cold_1();
  }
  return v0();
}

void sub_24017C398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSpeakTypingServicesClass_block_invoke_0(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SpeakTypingServicesLibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __SpeakTypingServicesLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26509DDC8;
    uint64_t v5 = 0;
    SpeakTypingServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!SpeakTypingServicesLibraryCore_frameworkLibrary_0) {
    __getSpeakTypingServicesClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("SpeakTypingServices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSpeakTypingServicesClass_block_invoke_cold_2();
  }
  getSpeakTypingServicesClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpeakTypingServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SpeakTypingServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getAXPerformSafeBlockSymbolLoc_block_invoke_0(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary_4();
  uint64_t result = dlsym(v2, "AXPerformSafeBlock");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXPerformSafeBlockSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke_4()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary_4 = result;
  return result;
}

void *__getAXUIApplicationWindowsSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUIUtilitiesLibrary_1();
  uint64_t result = dlsym(v2, "AXUIApplicationWindows");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXUIApplicationWindowsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AccessibilityUIUtilitiesLibrary_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!AccessibilityUIUtilitiesLibraryCore_frameworkLibrary_1)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __AccessibilityUIUtilitiesLibraryCore_block_invoke_1;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_26509DDF8;
    uint64_t v4 = 0;
    AccessibilityUIUtilitiesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = AccessibilityUIUtilitiesLibraryCore_frameworkLibrary_1;
  if (!AccessibilityUIUtilitiesLibraryCore_frameworkLibrary_1) {
    AccessibilityUIUtilitiesLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __AccessibilityUIUtilitiesLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUIUtilitiesLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void *__getAXUIKeyboardWindowSymbolLoc_block_invoke_0(uint64_t a1)
{
  v2 = (void *)AccessibilityUIUtilitiesLibrary_1();
  uint64_t result = dlsym(v2, "AXUIKeyboardWindow");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXUIKeyboardWindowSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXProcessIsSafariSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary_4();
  uint64_t result = dlsym(v2, "AXProcessIsSafari");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXProcessIsSafariSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXResourceLoaderClass_block_invoke_0(uint64_t a1)
{
  AccessibilityUtilitiesLibrary_4();
  Class result = objc_getClass("AXResourceLoader");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXResourceLoaderClass_block_invoke_cold_1();
  }
  getAXResourceLoaderClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXPerformValidationChecksSymbolLoc_block_invoke_1(uint64_t a1)
{
  v2 = (void *)AccessibilityUtilitiesLibrary_4();
  Class result = dlsym(v2, "AXPerformValidationChecks");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXPerformValidationChecksSymbolLoc_ptr_1 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_24017D598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAXSpringBoardUserChangedAudioRouteNotificationSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_5)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = __AccessibilityUtilitiesLibraryCore_block_invoke_5;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26509DE10;
    uint64_t v6 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_5 = _sl_dlopen();
  }
  v2 = (void *)AccessibilityUtilitiesLibraryCore_frameworkLibrary_5;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_5) {
    __getAXSpringBoardUserChangedAudioRouteNotificationSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  Class result = dlsym(v2, "AXSpringBoardUserChangedAudioRouteNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXSpringBoardUserChangedAudioRouteNotificationSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                               + 24);
  return result;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke_5()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary_5 = result;
  return result;
}

void soft_AXDeviceHasHomeButton_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"BOOL soft_AXDeviceHasHomeButton(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 65, @"%s", dlerror());

  __break(1u);
}

void soft_AXDeviceIsPad_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"BOOL soft_AXDeviceIsPad(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 64, @"%s", dlerror());

  __break(1u);
}

void soft_AXProcessIsSpringBoard_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"BOOL soft_AXProcessIsSpringBoard(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 68, @"%s", dlerror());

  __break(1u);
}

void soft___ax_verbose_encode_with_type_encoding_group_class_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = objc_msgSend(NSString, "stringWithUTF8String:", "char *soft___ax_verbose_encode_with_type_encoding_group_class(__unsafe_unretained Class, const char *)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 74, @"%s", dlerror());

  __break(1u);
}

void soft_AXProcessIsInCallService_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"BOOL soft_AXProcessIsInCallService(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 66, @"%s", dlerror());

  __break(1u);
}

void soft_AXUIKeyboardIsOnScreen_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"BOOL soft_AXUIKeyboardIsOnScreen(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 39, @"%s", dlerror());

  __break(1u);
}

void soft_AXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInside_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"CGRect soft_AXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInside(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 41, @"%s", dlerror());

  __break(1u);
}

void soft_AXUIKeyboardWindow_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"UIWindow *soft_AXUIKeyboardWindow(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 40, @"%s", dlerror());

  __break(1u);
}

void soft_AXUIConvertRectFromScreenToContextSpace_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = objc_msgSend(NSString, "stringWithUTF8String:", "CGRect soft_AXUIConvertRectFromScreenToContextSpace(UIWindow *__strong, CGRect)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 42, @"%s", dlerror());

  __break(1u);
}

void soft_AXPerformSafeBlock_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"void soft_AXPerformSafeBlock(__strong dispatch_block_t)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 72, @"%s", dlerror());

  __break(1u);
}

void soft___UIAccessibilityCastAsClass_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = objc_msgSend(NSString, "stringWithUTF8String:", "id soft___UIAccessibilityCastAsClass(__unsafe_unretained Class, __strong id, BOOL, BOOL *)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 73, @"%s", dlerror());

  __break(1u);
}

void soft_AXSafeClassFromString_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class soft_AXSafeClassFromString(NSString *__strong)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 70, @"%s", dlerror());

  __break(1u);
}

void AccessibilityUtilitiesLibrary_cold_1(void *a1)
{
  v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *AccessibilityUtilitiesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXSettingsLoaderSoftLinkages.h", 32, @"%s", *a1);

  __break(1u);
}

void __getZoomServicesClass_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *ZoomServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXSettingsLoaderSoftLinkages.h", 27, @"%s", *a1);

  __break(1u);
}

void __getZoomServicesClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getZoomServicesClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 96, @"Unable to find class %s", "ZoomServices");

  __break(1u);
}

void __getAXValidationManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getAXValidationManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 52, @"Unable to find class %s", "AXValidationManager");

  __break(1u);
}

void AccessibilityUIUtilitiesLibrary_cold_1(void *a1)
{
  v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *AccessibilityUIUtilitiesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXSettingsLoaderSoftLinkages.h", 23, @"%s", *a1);

  __break(1u);
}

void __getAXBackBoardServerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getAXBackBoardServerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 54, @"Unable to find class %s", "AXBackBoardServer");

  __break(1u);
}

void __getAXSettingsClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getAXSettingsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 50, @"Unable to find class %s", "AXSettings");

  __break(1u);
}

void __getTTSSpeechSynthesizerClass_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *TextToSpeechLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXSettingsLoaderSoftLinkages.h", 22, @"%s", *a1);

  __break(1u);
}

void __getTTSSpeechSynthesizerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getTTSSpeechSynthesizerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 89, @"Unable to find class %s", "TTSSpeechSynthesizer");

  __break(1u);
}

void __getSpeakTypingServicesClass_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *SpeakTypingServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXSettingsLoaderSoftLinkages.h", 24, @"%s", *a1);

  __break(1u);
}

void __getSpeakTypingServicesClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getSpeakTypingServicesClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 47, @"Unable to find class %s", "SpeakTypingServices");

  __break(1u);
}

void soft_AXProcessIsSystemApplication_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"BOOL soft_AXProcessIsSystemApplication(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 77, @"%s", dlerror());

  __break(1u);
}

void __getAXResourceLoaderClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getAXResourceLoaderClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 56, @"Unable to find class %s", "AXResourceLoader");

  __break(1u);
}

void __getAXBinaryMonitorClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getAXBinaryMonitorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 60, @"Unable to find class %s", "AXBinaryMonitor");

  __break(1u);
}

void __getkMADisplayFilterSettingsChangedNotificationSymbolLoc_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *MediaAccessibilityLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXSettingsLoaderSoftLinkages.h", 19, @"%s", *a1);

  __break(1u);
}

void __getAXReplayerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getAXReplayerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 58, @"Unable to find class %s", "AXReplayer");

  __break(1u);
}

void _axSettingsHandlePreferenceChanged_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSNotificationName getAXMFiHearingDevicePairedUUIDsDidChangeNotification(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 37, @"%s", dlerror());

  __break(1u);
}

void _axSettingsHandlePreferenceChanged_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSNotificationName getAXMFiHearingDeviceStreamingEarDidChangeNotification(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 36, @"%s", dlerror());

  __break(1u);
}

void AccessibilityLibrary_cold_1(void *a1)
{
  v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *AccessibilityLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXSettingsLoaderSoftLinkages.h", 20, @"%s", *a1);

  __break(1u);
}

void __getSpeakThisServicesClass_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *SpeakThisServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXSettingsLoaderSoftLinkages.h", 31, @"%s", *a1);

  __break(1u);
}

void __getSpeakThisServicesClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getSpeakThisServicesClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 100, @"Unable to find class %s", "SpeakThisServices");

  __break(1u);
}

void soft_AXProcessIsAssistiveTouch_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"BOOL soft_AXProcessIsAssistiveTouch(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 75, @"%s", dlerror());

  __break(1u);
}

void __getAXSpringBoardUserChangedAudioRouteNotificationSymbolLoc_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *AccessibilityUtilitiesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MPAVRoutingControllerAccessibility.m", 12, @"%s", *a1);

  __break(1u);
  ASTLogCommon();
}

uint64_t ASTLogCommon()
{
  return MEMORY[0x270F09ED0]();
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x270F09ED8]();
}

uint64_t AXDisallowsUIBasedAccessibilityFeatures()
{
  return MEMORY[0x270F90510]();
}

uint64_t AXLogAppAccessibility()
{
  return MEMORY[0x270F0A1B8]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F0A1C8]();
}

uint64_t AXLogInvertColorsLoadBundles()
{
  return MEMORY[0x270F0A1E0]();
}

uint64_t AXLogSpeakScreen()
{
  return MEMORY[0x270F0A1F8]();
}

uint64_t AXLogSpeakTyping()
{
  return MEMORY[0x270F0A200]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x270F0A248]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F0A258]();
}

uint64_t AXSystemRootDirectory()
{
  return MEMORY[0x270F0A328]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
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

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B98]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t GAXLogCommon()
{
  return MEMORY[0x270F0A3C8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSRect NSRectFromString(NSString *aString)
{
  MEMORY[0x270EF2BB0](aString);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F05EA0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x270EF2C30]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return MEMORY[0x270F05F18]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x270F05F20]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F05F58]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x270F062A8]();
}

uint64_t ZOOMLogCommon()
{
  return MEMORY[0x270F0A3E0]();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x270F90590]();
}

uint64_t _AXSGuidedAccessRequiresApplicationAccessibility()
{
  return MEMORY[0x270F907B0]();
}

uint64_t _AXSInvertColorsMarkInvertColorsPreloadComplete()
{
  return MEMORY[0x270F90888]();
}

uint64_t _AXSInvertColorsReloadPreferenceImmediately()
{
  return MEMORY[0x270F90890]();
}

uint64_t _AXSLetterFeedbackEnabled()
{
  return MEMORY[0x270F908B0]();
}

uint64_t _AXSPhoneticFeedbackEnabled()
{
  return MEMORY[0x270F90938]();
}

uint64_t _AXSQuickTypePredictionFeedbackEnabled()
{
  return MEMORY[0x270F90980]();
}

uint64_t _AXSShouldLoadInvertBundles()
{
  return MEMORY[0x270F90AB8]();
}

uint64_t _AXSSpeakThisEnabled()
{
  return MEMORY[0x270F90AE0]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x270F90B78]();
}

uint64_t _AXSWordFeedbackEnabled()
{
  return MEMORY[0x270F90C08]();
}

uint64_t _AXSZoomTouchEnabled()
{
  return MEMORY[0x270F90C10]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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
  return MEMORY[0x270F76310]();
}

void abort(void)
{
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
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

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}