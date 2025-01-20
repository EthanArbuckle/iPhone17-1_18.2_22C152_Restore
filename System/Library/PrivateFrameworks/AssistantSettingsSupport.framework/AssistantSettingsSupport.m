void sub_220C27B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220C28E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220C292D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220C293F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_220C298F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_220C29AD4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t tccPreferencesChangedCallback(uint64_t a1, void *a2)
{
  return [a2 tccPreferencesChanged];
}

void sub_220C2B574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_220C2D540(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void *__getAnalyticsSendEventLazySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = __CoreAnalyticsLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26457D0B8;
    uint64_t v6 = 0;
    CoreAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v2 = (void *)CoreAnalyticsLibraryCore_frameworkLibrary;
  if (!CoreAnalyticsLibraryCore_frameworkLibrary) {
    __getAnalyticsSendEventLazySymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  result = dlsym(v2, "AnalyticsSendEventLazy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAnalyticsSendEventLazySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreAnalyticsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreAnalyticsLibraryCore_frameworkLibrary = result;
  return result;
}

id getPETEventPropertyClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getPETEventPropertyClass_softClass;
  uint64_t v7 = getPETEventPropertyClass_softClass;
  if (!getPETEventPropertyClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getPETEventPropertyClass_block_invoke;
    v3[3] = &unk_26457D098;
    v3[4] = &v4;
    __getPETEventPropertyClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_220C2DD08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPETScalarEventTrackerClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getPETScalarEventTrackerClass_softClass;
  uint64_t v7 = getPETScalarEventTrackerClass_softClass;
  if (!getPETScalarEventTrackerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getPETScalarEventTrackerClass_block_invoke;
    v3[3] = &unk_26457D098;
    v3[4] = &v4;
    __getPETScalarEventTrackerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_220C2E300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void doAsync(void *a1)
{
  if (a1)
  {
    uint64_t v2 = dispatch_get_global_queue(-32768, 0);
    dispatch_async(v2, a1);
  }
}

Class __getPETEventPropertyClass_block_invoke(uint64_t a1)
{
  ProactiveEventTrackerLibrary();
  Class result = objc_getClass("PETEventProperty");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPETEventPropertyClass_block_invoke_cold_1();
  }
  getPETEventPropertyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ProactiveEventTrackerLibrary()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0[0] = 0;
  if (!ProactiveEventTrackerLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x263EF8330];
    v0[2] = (void *)3221225472;
    v0[3] = __ProactiveEventTrackerLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_26457D190;
    uint64_t v2 = 0;
    ProactiveEventTrackerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ProactiveEventTrackerLibraryCore_frameworkLibrary) {
    ProactiveEventTrackerLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __ProactiveEventTrackerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ProactiveEventTrackerLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getPETScalarEventTrackerClass_block_invoke(uint64_t a1)
{
  ProactiveEventTrackerLibrary();
  Class result = objc_getClass("PETScalarEventTracker");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getPETScalarEventTrackerClass_block_invoke_cold_1();
  }
  getPETScalarEventTrackerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_220C3080C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220C31544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220C3182C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220C31C60(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

Class __getVTUIGMEnrollmentViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!VoiceTriggerUILibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __VoiceTriggerUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26457D240;
    uint64_t v5 = 0;
    VoiceTriggerUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!VoiceTriggerUILibraryCore_frameworkLibrary) {
    __getVTUIGMEnrollmentViewControllerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("VTUIGMEnrollmentViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getVTUIGMEnrollmentViewControllerClass_block_invoke_cold_2();
  }
  getVTUIGMEnrollmentViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VoiceTriggerUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VoiceTriggerUILibraryCore_frameworkLibrary = result;
  return result;
}

void sub_220C32870(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_220C33A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getVTUIEnrollTrainingViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!VoiceTriggerUILibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __VoiceTriggerUILibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26457D258;
    uint64_t v5 = 0;
    VoiceTriggerUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!VoiceTriggerUILibraryCore_frameworkLibrary_0) {
    __getVTUIEnrollTrainingViewControllerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("VTUIEnrollTrainingViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getVTUIEnrollTrainingViewControllerClass_block_invoke_cold_2();
  }
  getVTUIEnrollTrainingViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VoiceTriggerUILibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  VoiceTriggerUILibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_220C342D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = __SpringBoardServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26457D290;
    uint64_t v6 = 0;
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
  if (!SpringBoardServicesLibraryCore_frameworkLibrary) {
    __getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  uint64_t result = dlsym(v2, "SBSCopyDisplayIdentifiers");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBSCopyDisplayIdentifiersSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpringBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpringBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_220C357EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220C35C5C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

Class __getCKKnowledgeStoreClass_block_invoke(uint64_t a1)
{
  CoreKnowledgeLibrary();
  Class result = objc_getClass("CKKnowledgeStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCKKnowledgeStoreClass_block_invoke_cold_1();
  }
  getCKKnowledgeStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void CoreKnowledgeLibrary()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0[0] = 0;
  if (!CoreKnowledgeLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x263EF8330];
    v0[2] = (void *)3221225472;
    v0[3] = __CoreKnowledgeLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_26457D2A8;
    uint64_t v2 = 0;
    CoreKnowledgeLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreKnowledgeLibraryCore_frameworkLibrary) {
    CoreKnowledgeLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __CoreKnowledgeLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreKnowledgeLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCKPermanentEventStoreClass_block_invoke(uint64_t a1)
{
  CoreKnowledgeLibrary();
  Class result = objc_getClass("CKPermanentEventStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCKPermanentEventStoreClass_block_invoke_cold_1();
  }
  getCKPermanentEventStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCKEventClass_block_invoke(uint64_t a1)
{
  CoreKnowledgeLibrary();
  Class result = objc_getClass("CKEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCKEventClass_block_invoke_cold_1();
  }
  getCKEventClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_220C37ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220C38418(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_220C3B9BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getCKKnowledgeStoreClass_block_invoke_0(uint64_t a1)
{
  CoreKnowledgeLibrary_0();
  Class result = objc_getClass("CKKnowledgeStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCKKnowledgeStoreClass_block_invoke_cold_1_0();
  }
  getCKKnowledgeStoreClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void CoreKnowledgeLibrary_0()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0[0] = 0;
  if (!CoreKnowledgeLibraryCore_frameworkLibrary_0)
  {
    v0[1] = (void *)MEMORY[0x263EF8330];
    v0[2] = (void *)3221225472;
    v0[3] = __CoreKnowledgeLibraryCore_block_invoke_0;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_26457D470;
    uint64_t v2 = 0;
    CoreKnowledgeLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!CoreKnowledgeLibraryCore_frameworkLibrary_0) {
    CoreKnowledgeLibrary_cold_1_0(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __CoreKnowledgeLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  CoreKnowledgeLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getCKPermanentEventStoreClass_block_invoke_0(uint64_t a1)
{
  CoreKnowledgeLibrary_0();
  Class result = objc_getClass("CKPermanentEventStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCKPermanentEventStoreClass_block_invoke_cold_1_0();
  }
  getCKPermanentEventStoreClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCKEventClass_block_invoke_0(uint64_t a1)
{
  CoreKnowledgeLibrary_0();
  Class result = objc_getClass("CKEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCKEventClass_block_invoke_cold_1_0();
  }
  getCKEventClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_220C3CD7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220C3DDA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_220C3E0CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_220C3ED8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220C414B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getNRPairedDeviceRegistryClass_block_invoke;
    v3[3] = &unk_26457D098;
    v3[4] = &v4;
    __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_220C4159C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getNRDevicePropertySystemVersion()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)getNRDevicePropertySystemVersionSymbolLoc_ptr;
  uint64_t v7 = getNRDevicePropertySystemVersionSymbolLoc_ptr;
  if (!getNRDevicePropertySystemVersionSymbolLoc_ptr)
  {
    id v1 = (void *)NanoRegistryLibrary();
    v5[3] = (uint64_t)dlsym(v1, "NRDevicePropertySystemVersion");
    getNRDevicePropertySystemVersionSymbolLoc_ptr = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getNRDevicePropertySystemVersion_cold_1();
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_220C416A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220C41AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220C4204C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220C4251C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 112));
  _Unwind_Resume(a1);
}

void sub_220C42B24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 112));
  _Unwind_Resume(a1);
}

void sub_220C43140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  objc_destroyWeak(v12);
  objc_destroyWeak((id *)(v13 - 112));
  _Unwind_Resume(a1);
}

void sub_220C43CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220C441A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_220C45AB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220C46B7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 104));
  _Unwind_Resume(a1);
}

void sub_220C46DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getVTUIEnrollTrainingViewControllerClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getVTUIEnrollTrainingViewControllerClass_softClass_0;
  uint64_t v7 = getVTUIEnrollTrainingViewControllerClass_softClass_0;
  if (!getVTUIEnrollTrainingViewControllerClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getVTUIEnrollTrainingViewControllerClass_block_invoke_0;
    v3[3] = &unk_26457D098;
    v3[4] = &v4;
    __getVTUIEnrollTrainingViewControllerClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_220C47170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220C47880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220C481E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_220C48378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_220C48C34(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_220C49124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
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

void VoiceTriggerUILibrary()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0[0] = 0;
  if (!VoiceTriggerUILibraryCore_frameworkLibrary_1)
  {
    v0[1] = (void *)MEMORY[0x263EF8330];
    v0[2] = (void *)3221225472;
    v0[3] = __VoiceTriggerUILibraryCore_block_invoke_1;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_26457D848;
    uint64_t v2 = 0;
    VoiceTriggerUILibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!VoiceTriggerUILibraryCore_frameworkLibrary_1) {
    VoiceTriggerUILibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __VoiceTriggerUILibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  VoiceTriggerUILibraryCore_frameworkLibrary_1 = result;
  return result;
}

Class __getNRPairedDeviceRegistryClass_block_invoke(uint64_t a1)
{
  NanoRegistryLibrary();
  Class result = objc_getClass("NRPairedDeviceRegistry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getNRPairedDeviceRegistryClass_block_invoke_cold_1();
  }
  getNRPairedDeviceRegistryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t NanoRegistryLibrary()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __NanoRegistryLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_26457D860;
    uint64_t v4 = 0;
    NanoRegistryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = NanoRegistryLibraryCore_frameworkLibrary;
  if (!NanoRegistryLibraryCore_frameworkLibrary) {
    NanoRegistryLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __NanoRegistryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoRegistryLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getNRDevicePropertySystemNameSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)NanoRegistryLibrary();
  uint64_t result = dlsym(v2, "NRDevicePropertySystemName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRDevicePropertySystemNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getNRDevicePropertySystemVersionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)NanoRegistryLibrary();
  uint64_t result = dlsym(v2, "NRDevicePropertySystemVersion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRDevicePropertySystemVersionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
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
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __SetupAssistantLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_26457D878;
    uint64_t v4 = 0;
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = SetupAssistantLibraryCore_frameworkLibrary;
  if (!SetupAssistantLibraryCore_frameworkLibrary) {
    SetupAssistantLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __SetupAssistantLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantLibraryCore_frameworkLibrary = result;
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

Class __getVTUIEnrollTrainingViewControllerClass_block_invoke_0(uint64_t a1)
{
  VoiceTriggerUILibrary();
  Class result = objc_getClass("VTUIEnrollTrainingViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getVTUIEnrollTrainingViewControllerClass_block_invoke_cold_1_0();
  }
  getVTUIEnrollTrainingViewControllerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_220C4DB3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_220C4EA88(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_220C4EE3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_220C50568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void *__getSPGetDisabledBundleSetSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SearchLibrary();
  Class result = dlsym(v2, "SPGetDisabledBundleSet");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSPGetDisabledBundleSetSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SearchLibrary()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!SearchLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __SearchLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_26457D9B8;
    uint64_t v4 = 0;
    SearchLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = SearchLibraryCore_frameworkLibrary;
  if (!SearchLibraryCore_frameworkLibrary) {
    SearchLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __SearchLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SearchLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getSPGetDisabledDomainSetSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SearchLibrary();
  uint64_t result = dlsym(v2, "SPGetDisabledDomainSet");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSPGetDisabledDomainSetSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t static ExternalAIModelSettings.available()()
{
  return sub_220C748E0() & 1;
}

uint64_t static ExternalAIModelSettings.controllerClass()()
{
  uint64_t v0 = sub_220C748F0();
  if (sub_220C748E0()) {
    return v0;
  }
  else {
    return 0;
  }
}

id ExternalAIModelSettings.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id ExternalAIModelSettings.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExternalAIModelSettings();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for ExternalAIModelSettings()
{
  return self;
}

id ExternalAIModelSettings.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExternalAIModelSettings();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_220C50A94(uint64_t a1, uint64_t a2)
{
  return sub_220C50C14(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_220C50AC0(uint64_t a1, id *a2)
{
  uint64_t result = sub_220C74DE0();
  *a2 = 0;
  return result;
}

uint64_t sub_220C50B38(uint64_t a1, id *a2)
{
  char v3 = sub_220C74DF0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_220C50BB8@<X0>(uint64_t *a1@<X8>)
{
  sub_220C74E00();
  uint64_t v2 = sub_220C74DD0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_220C50BFC(uint64_t a1, uint64_t a2)
{
  return sub_220C50C14(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_220C50C14(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_220C74E00();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_220C50C58()
{
  sub_220C74E00();
  sub_220C74E20();

  return swift_bridgeObjectRelease();
}

uint64_t sub_220C50CAC()
{
  sub_220C74E00();
  sub_220C751A0();
  sub_220C74E20();
  uint64_t v0 = sub_220C751C0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_220C50D24()
{
  uint64_t v0 = sub_220C74E00();
  uint64_t v2 = v1;
  if (v0 == sub_220C74E00() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_220C75140();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_220C50DB4(uint64_t a1)
{
  uint64_t v2 = sub_220C510A0(&qword_267F2BAF0, type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v3 = sub_220C510A0(&qword_267F2BAF8, type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_220C50E70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_220C74DD0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_220C50EB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_220C74E00();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_220C50EE4(uint64_t a1)
{
  uint64_t v2 = sub_220C510A0(&qword_267F2BAE0, type metadata accessor for Key);
  uint64_t v3 = sub_220C510A0(&qword_267F2BAE8, type metadata accessor for Key);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

void type metadata accessor for Key(uint64_t a1)
{
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
}

void sub_220C50FC8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_220C51010()
{
  return sub_220C510A0(&qword_267F2BAB0, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_220C51058()
{
  return sub_220C510A0(&qword_267F2BAB8, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_220C510A0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_220C510E8()
{
  return sub_220C510A0(&qword_267F2BAC0, type metadata accessor for Key);
}

uint64_t sub_220C51130()
{
  return sub_220C510A0(&qword_267F2BAC8, type metadata accessor for Key);
}

uint64_t sub_220C51178()
{
  return sub_220C510A0(&qword_267F2BAD0, type metadata accessor for Key);
}

uint64_t sub_220C511C0()
{
  return sub_220C510A0(&qword_267F2BAD8, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_220C51268()
{
  sub_220C748B0();
  uint64_t v0 = (void *)MEMORY[0x223C70E10]();
  char v1 = sub_220C74880();

  return v1 & 1;
}

void sub_220C51324()
{
  sub_220C748B0();
  id v0 = (id)MEMORY[0x223C70E10]();
  sub_220C74890();
}

void sub_220C51384(unsigned char *a1@<X8>)
{
  sub_220C748B0();
  uint64_t v2 = (void *)MEMORY[0x223C70E10]();
  char v3 = sub_220C74880();

  *a1 = v3 & 1;
}

void sub_220C513D4()
{
  sub_220C748B0();
  id v0 = (id)MEMORY[0x223C70E10]();
  sub_220C74890();
}

void (*sub_220C51434(uint64_t a1))()
{
  *(void *)a1 = sub_220C748B0();
  uint64_t v2 = (void *)MEMORY[0x223C70E10]();
  char v3 = sub_220C74880();

  *(unsigned char *)(a1 + 8) = v3 & 1;
  return sub_220C514A4;
}

void sub_220C514A4()
{
  id v0 = (id)MEMORY[0x223C70E10]();
  sub_220C74890();
}

id GMOptInStatusProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id GMOptInStatusProvider.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GMOptInStatusProvider();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for GMOptInStatusProvider()
{
  return self;
}

id GMOptInStatusProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GMOptInStatusProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void (*sub_220C515FC(void *a1))(void *a1)
{
  objc_super v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_220C51434((uint64_t)v2);
  return sub_220C5164C;
}

void sub_220C5164C(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t dispatch thunk of GMOptInStatusProviding.userOptInStatus.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of GMOptInStatusProviding.userOptInStatus.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of GMOptInStatusProviding.userOptInStatus.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t method lookup function for GMOptInStatusProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GMOptInStatusProvider);
}

uint64_t dispatch thunk of GMOptInStatusProvider.userOptInStatus.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x50))();
}

uint64_t dispatch thunk of GMOptInStatusProvider.userOptInStatus.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of GMOptInStatusProvider.userOptInStatus.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

ValueMetadata *type metadata accessor for BetaBadge()
{
  return &type metadata for BetaBadge;
}

uint64_t sub_220C5179C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220C517B8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BB08);
  MEMORY[0x270FA5388]();
  id v1 = (char *)v16 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BB10);
  MEMORY[0x270FA5388]();
  char v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BB18);
  MEMORY[0x270FA5388]();
  char v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BB20);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BB28);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220C74560();
  v16[0] = swift_getKeyPath();
  swift_getKeyPath();
  sub_220C74C10();
  uint64_t v10 = sub_220C74C20();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 0, 1, v10);
  sub_220C74C30();
  uint64_t v11 = sub_220C74C40();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v5, 0, 1, v11);
  sub_220C74C50();
  uint64_t v12 = sub_220C74C60();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v3, 0, 1, v12);
  uint64_t v13 = sub_220C74C00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v1, 1, 1, v13);
  sub_220C74CF0();
  sub_220C74C70();
  uint64_t v14 = sub_220C74C80();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 0, 1, v14);
  sub_220C52004();
  return sub_220C74550();
}

uint64_t sub_220C51B3C()
{
  return sub_220C74DC0() & 1;
}

double sub_220C51B98@<D0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BB00);
  MEMORY[0x270FA5388]();
  char v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220C74570();
  MEMORY[0x270FA5388]();
  sub_220C517B8();
  uint64_t v4 = sub_220C74C90();
  uint64_t v33 = v5;
  uint64_t v34 = v4;
  int v32 = v6;
  uint64_t v35 = v7;
  sub_220C74D30();
  sub_220C74B20();
  uint64_t v8 = v36;
  char v9 = v37;
  uint64_t v10 = v38;
  char v11 = v39;
  uint64_t v30 = v41;
  uint64_t v31 = v40;
  sub_220C74BE0();
  uint64_t v12 = *MEMORY[0x263F1A610];
  uint64_t v13 = sub_220C74BD0();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 104))(v3, v12, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v3, 0, 1, v13);
  uint64_t v15 = sub_220C74BF0();
  sub_220C51ED4((uint64_t)v3);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v17 = sub_220C74D00();
  uint64_t v18 = swift_getKeyPath();
  LOBYTE(v14) = sub_220C74BA0();
  sub_220C74B10();
  char v19 = v32 & 1;
  uint64_t v20 = v33;
  *(void *)a1 = v34;
  *(void *)(a1 + 8) = v20;
  *(unsigned char *)(a1 + 16) = v19;
  *(_DWORD *)(a1 + 17) = *(_DWORD *)v45;
  *(_DWORD *)(a1 + 20) = *(_DWORD *)&v45[3];
  *(void *)(a1 + 24) = v35;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = v9;
  int v21 = *(_DWORD *)v44;
  *(_DWORD *)(a1 + 44) = *(_DWORD *)&v44[3];
  *(_DWORD *)(a1 + 41) = v21;
  *(void *)(a1 + 48) = v10;
  *(unsigned char *)(a1 + 56) = v11;
  int v22 = *(_DWORD *)v43;
  *(_DWORD *)(a1 + 60) = *(_DWORD *)&v43[3];
  *(_DWORD *)(a1 + 57) = v22;
  uint64_t v23 = v30;
  *(void *)(a1 + 64) = v31;
  *(void *)(a1 + 72) = v23;
  *(void *)(a1 + 80) = KeyPath;
  *(void *)(a1 + 88) = v15;
  *(void *)(a1 + 96) = v18;
  *(void *)(a1 + 104) = v17;
  *(unsigned char *)(a1 + 112) = v14;
  LODWORD(v23) = *(_DWORD *)v42;
  *(_DWORD *)(a1 + 116) = *(_DWORD *)&v42[3];
  *(_DWORD *)(a1 + 113) = v23;
  *(void *)(a1 + 120) = v24;
  *(void *)(a1 + 128) = v25;
  *(void *)(a1 + 136) = v26;
  *(void *)(a1 + 144) = v27;
  *(unsigned char *)(a1 + 152) = 0;
  LODWORD(v23) = *(_DWORD *)v46;
  *(_DWORD *)(a1 + 156) = *(_DWORD *)&v46[3];
  *(_DWORD *)(a1 + 153) = v23;
  double result = 17.0;
  *(_OWORD *)(a1 + 160) = xmmword_220C78760;
  return result;
}

uint64_t sub_220C51E70()
{
  return sub_220C74CD0();
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

uint64_t sub_220C51ED4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BB00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_220C51F34@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_220C74B50();
  *a1 = result;
  return result;
}

uint64_t sub_220C51F60()
{
  return sub_220C74B60();
}

uint64_t sub_220C51F8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_220C74B30();
  *a1 = result;
  return result;
}

uint64_t sub_220C51FB8()
{
  return sub_220C74B40();
}

void sub_220C51FE4()
{
}

unint64_t sub_220C52004()
{
  unint64_t result = qword_267F2BB30;
  if (!qword_267F2BB30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F2BB30);
  }
  return result;
}

void sub_220C52058()
{
}

uint64_t sub_220C52080()
{
  return 8;
}

uint64_t sub_220C5208C()
{
  return swift_release();
}

uint64_t sub_220C52094(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_220C520A4()
{
  return sub_220C74DB0();
}

void *sub_220C520EC(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_220C520F8()
{
  return sub_220C521B4(&qword_267F2BB40, &qword_267F2BB48, (void (*)(void))sub_220C52184);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_220C52184()
{
  return sub_220C521B4(&qword_267F2BB50, &qword_267F2BB58, (void (*)(void))sub_220C52230);
}

uint64_t sub_220C521B4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_220C52230()
{
  unint64_t result = qword_267F2BB60;
  if (!qword_267F2BB60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F2BB68);
    sub_220C522BC();
    sub_220C523BC(&qword_267F2BBA0, &qword_267F2BBA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F2BB60);
  }
  return result;
}

unint64_t sub_220C522BC()
{
  unint64_t result = qword_267F2BB70;
  if (!qword_267F2BB70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F2BB78);
    sub_220C52348();
    sub_220C523BC(&qword_267F2BB90, &qword_267F2BB98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F2BB70);
  }
  return result;
}

unint64_t sub_220C52348()
{
  unint64_t result = qword_267F2BB80;
  if (!qword_267F2BB80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F2BB88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F2BB80);
  }
  return result;
}

uint64_t sub_220C523BC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_220C5240C()
{
  id v1 = v0;
  uint64_t v2 = sub_220C745F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BC18);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  char v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v36 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v36 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v36 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v36 - v19;
  id v21 = objc_msgSend(v1, sel_window);
  if (!v21
    || (int v22 = v21,
        id v23 = objc_msgSend(v21, sel_rootViewController),
        v22,
        !v23))
  {
    id v26 = objc_msgSend(self, sel_currentDevice);
    objc_msgSend(v26, sel_userInterfaceIdiom);

    sub_220C745E0();
    sub_220C54F3C((uint64_t)v12, (uint64_t)v9, &qword_267F2BC18);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v9, 1, v2) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v9, v2);
      id v27 = objc_msgSend(self, sel_sharedApplication);
      v28 = (void *)sub_220C745C0();
      sub_220C52978(MEMORY[0x263F8EE78]);
      type metadata accessor for OpenExternalURLOptionsKey(0);
      sub_220C54EF4(&qword_267F2BAF0, type metadata accessor for OpenExternalURLOptionsKey);
      uint64_t v29 = (void *)sub_220C74D80();
      swift_bridgeObjectRelease();
      objc_msgSend(v27, sel_openURL_options_completionHandler_, v28, v29, 0);

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    uint64_t v30 = (uint64_t)v12;
    goto LABEL_17;
  }
  sub_220C54B2C();
  if (v24)
  {
    uint64_t v25 = (void *)sub_220C74DD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v25 = 0;
  }
  uint64_t v31 = self;
  id v32 = objc_msgSend(v31, sel_URLWithTopicID_, v25);

  if (v32)
  {
    sub_220C745D0();

    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v18, 0, 1, v2);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v18, 1, 1, v2);
  }
  sub_220C54CDC((uint64_t)v18, (uint64_t)v20, &qword_267F2BC18);
  sub_220C54F3C((uint64_t)v20, (uint64_t)v15, &qword_267F2BC18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v15, 1, v2) == 1)
  {
    uint64_t v33 = 0;
  }
  else
  {
    uint64_t v33 = (void *)sub_220C745C0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v15, v2);
  }
  id v34 = objc_msgSend(v31, sel_helpViewControllerWithURL_, v33);

  if (v34)
  {
    objc_msgSend(v34, sel_setShowTopicViewOnLoad_, 1);
    id v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F829B8]), sel_initWithRootViewController_, v34);
    objc_msgSend(v35, sel_setModalPresentationStyle_, 1);
    objc_msgSend(v23, sel_presentViewController_animated_completion_, v35, 1, 0);

    uint64_t v30 = (uint64_t)v20;
LABEL_17:
    sub_220C54404(v30, &qword_267F2BC18);
    return;
  }
  sub_220C54404((uint64_t)v20, &qword_267F2BC18);
}

unint64_t sub_220C52978(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BC20);
  uint64_t v2 = sub_220C750F0();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_220C54F3C(v6, (uint64_t)&v13, &qword_267F2BC28);
    uint64_t v7 = v13;
    unint64_t result = sub_220C54460(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_220C54D40(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_220C52AA8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BC60);
  uint64_t v2 = sub_220C750F0();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_220C54F3C(v6, (uint64_t)&v13, &qword_267F2BC68);
    uint64_t v7 = v13;
    unint64_t result = sub_220C54460(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_220C54D40(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_220C52BD8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BC70);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BC78);
  uint64_t v6 = sub_220C750F0();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_220C54F3C(v12, (uint64_t)v5, &qword_267F2BC70);
    unint64_t result = sub_220C54538((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_220C74710();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(void *)(v7[7] + 8 * v16) = *(void *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_220C52DCC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BC80);
  uint64_t v2 = (void *)sub_220C750F0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    sub_220C749A0();
    id v8 = v7;
    unint64_t result = sub_220C545D0(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_220C52EE8(void *a1)
{
  if (qword_26AD53290 != -1) {
    swift_once();
  }
  uint64_t v2 = (uint64_t *)(qword_26AD53210 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
  swift_beginAccess();
  sub_220C6F424(*v2, (uint64_t)&unk_26D2AA650);
  type metadata accessor for GMFooterUtility();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v4 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v5 = sub_220C74580();
  uint64_t v7 = v6;

  id v8 = objc_msgSend(self, sel_currentDevice, 0xE000000000000000);
  objc_msgSend(v8, sel_sf_isiPad);

  uint64_t v9 = (uint64_t *)(qword_26AD53210 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
  swift_beginAccess();
  if (sub_220C6F424(*v9, (uint64_t)&unk_26D2AA680))
  {
    swift_bridgeObjectRelease();
    id v10 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    sub_220C74580();
  }
  else
  {
    id v11 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    sub_220C74580();

    swift_bridgeObjectRelease();
  }
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a1;
  v12[3] = v5;
  v12[4] = v7;
  swift_allocObject();
  swift_unknownObjectWeakInit();
  id v13 = a1;
  sub_220C749A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BBD0);
  sub_220C542A0();
  return sub_220C74D70();
}

id sub_220C532F0(void *a1, uint64_t a2, double a3)
{
  uint64_t v6 = sub_220C74D40();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_220C74D60();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = objc_msgSend(a1, sel_specifier);
  if (result)
  {
    char v15 = result;
    id v16 = objc_msgSend(result, sel_target);
    uint64_t v45 = v10;
    uint64_t v46 = v7;
    id v43 = v15;
    uint64_t v44 = v11;
    uint64_t v42 = a2;
    if (v16)
    {
      self;
      uint64_t v17 = (void *)swift_dynamicCastObjCClass();
      if (v17)
      {
        id v41 = v17;
        id v40 = objc_msgSend(v17, sel_navigationItem);
LABEL_7:
        id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
        uint64_t v19 = self;
        BOOL v20 = (void *)sub_220C74DD0();
        id v21 = objc_msgSend(v19, sel_preferredFontForTextStyle_, v20);

        objc_msgSend(v18, sel_setFont_, v21);
        __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BC30);
        uint64_t inited = swift_initStackObject();
        id v23 = (void **)MEMORY[0x263F81500];
        *(_OWORD *)(inited + 16) = xmmword_220C788B0;
        uint64_t v24 = *v23;
        *(void *)(inited + 32) = *v23;
        uint64_t v25 = self;
        sub_220C749A0();
        id v26 = v24;
        id v27 = objc_msgSend(v25, sel_labelColor);
        id v28 = objc_msgSend(v27, sel_colorWithAlphaComponent_, a3);

        *(void *)(inited + 64) = sub_220C54D50(0, &qword_267F2BC38);
        *(void *)(inited + 40) = v28;
        sub_220C52AA8(inited);
        id v29 = objc_allocWithZone(MEMORY[0x263F086A0]);
        uint64_t v30 = (void *)sub_220C74DD0();
        swift_bridgeObjectRelease();
        type metadata accessor for Key(0);
        sub_220C54EF4(&qword_267F2BAE0, type metadata accessor for Key);
        uint64_t v31 = (void *)sub_220C74D80();
        swift_bridgeObjectRelease();
        id v32 = objc_msgSend(v29, sel_initWithString_attributes_, v30, v31);

        objc_msgSend(v18, sel_setAttributedText_, v32);
        sub_220C54D50(0, &qword_267F2BC40);
        uint64_t v33 = (void *)sub_220C74F80();
        uint64_t v34 = swift_allocObject();
        id v35 = v40;
        *(void *)(v34 + 16) = v40;
        *(void *)(v34 + 24) = v18;
        aBlock[4] = sub_220C54DCC;
        aBlock[5] = v34;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_220C538D0;
        aBlock[3] = &block_descriptor_3;
        uint64_t v36 = _Block_copy(aBlock);
        id v37 = v35;
        id v38 = v18;
        swift_release();
        sub_220C74D50();
        aBlock[0] = MEMORY[0x263F8EE78];
        sub_220C54EF4(&qword_267F2BC48, MEMORY[0x263F8F030]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BC50);
        sub_220C54E00(&qword_267F2BC58, &qword_267F2BC50);
        sub_220C75010();
        MEMORY[0x223C71500](0, v13, v9, v36);
        _Block_release(v36);

        (*(void (**)(char *, uint64_t))(v46 + 8))(v9, v6);
        return (id)(*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v13, v45);
      }
      swift_unknownObjectRelease();
    }
    id v40 = 0;
    id v41 = 0;
    goto LABEL_7;
  }
  return result;
}

uint64_t sub_220C538D0(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_220C53914(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x223C72420](v2);
  if (v3)
  {
    id v4 = (void *)v3;
    sub_220C5240C();
  }
}

uint64_t sub_220C53968@<X0>(uint64_t a1@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BC10);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BBF8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BBE8);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  id v13 = (char *)&v24 - v12;
  if (qword_26AD53290 != -1) {
    swift_once();
  }
  uint64_t v14 = (uint64_t *)(qword_26AD53210 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
  swift_beginAccess();
  char v15 = sub_220C6F424(*v14, (uint64_t)&unk_26D2AA6B0);
  id v16 = objc_allocWithZone(MEMORY[0x263F4B540]);
  if (v15)
  {
    uint64_t v17 = (void *)sub_220C74DD0();
    objc_msgSend(v16, sel_initWithBundleIdentifier_, v17, v24);

    sub_220C74810();
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v3, v7, v4);
    swift_storeEnumTagMultiPayload();
    sub_220C54340();
    sub_220C54E00(&qword_267F2BBF0, &qword_267F2BBF8);
    sub_220C74B70();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    uint64_t v19 = (void *)sub_220C74DD0();
    objc_msgSend(v16, sel_initWithType_, v19, v24);

    sub_220C74810();
    uint64_t v20 = sub_220C74D20();
    uint64_t v22 = v21;
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v11, v7, v4);
    id v23 = (uint64_t *)&v11[*(int *)(v8 + 36)];
    uint64_t *v23 = v20;
    v23[1] = v22;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_220C54CDC((uint64_t)v11, (uint64_t)v13, &qword_267F2BBE8);
    sub_220C54F3C((uint64_t)v13, (uint64_t)v3, &qword_267F2BBE8);
    swift_storeEnumTagMultiPayload();
    sub_220C54340();
    sub_220C54E00(&qword_267F2BBF0, &qword_267F2BBF8);
    sub_220C74B70();
    return sub_220C54404((uint64_t)v13, &qword_267F2BBE8);
  }
}

id sub_220C53F4C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    uint64_t v10 = (void *)sub_220C74DD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v14.receiver = v5;
  v14.super_class = ObjectType;
  id v11 = objc_msgSendSuper2(&v14, sel_initWithStyle_reuseIdentifier_specifier_, a1, v10, a4);

  id v12 = v11;
  if (v12) {

  }
  return v12;
}

id sub_220C5414C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AssistantPlacardCell()
{
  return self;
}

uint64_t sub_220C541A8()
{
  return sub_220C52EE8(*(void **)(v0 + 16));
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_220C54214()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

id sub_220C54254(double a1)
{
  return sub_220C532F0(*(void **)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_220C54260()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_220C54298(uint64_t a1)
{
  sub_220C53914(a1, v1);
}

unint64_t sub_220C542A0()
{
  unint64_t result = qword_267F2BBD8;
  if (!qword_267F2BBD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F2BBD0);
    sub_220C54340();
    sub_220C54E00(&qword_267F2BBF0, &qword_267F2BBF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F2BBD8);
  }
  return result;
}

unint64_t sub_220C54340()
{
  unint64_t result = qword_267F2BBE0;
  if (!qword_267F2BBE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F2BBE8);
    sub_220C54E00(&qword_267F2BBF0, &qword_267F2BBF8);
    sub_220C54E00(&qword_267F2BC00, &qword_267F2BC08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F2BBE0);
  }
  return result;
}

uint64_t sub_220C54404(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_220C54460(uint64_t a1)
{
  sub_220C74E00();
  sub_220C751A0();
  sub_220C74E20();
  uint64_t v2 = sub_220C751C0();
  swift_bridgeObjectRelease();

  return sub_220C54648(a1, v2);
}

unint64_t sub_220C544F4(uint64_t a1)
{
  uint64_t v2 = sub_220C75020();

  return sub_220C547C0(a1, v2);
}

unint64_t sub_220C54538(uint64_t a1)
{
  sub_220C74710();
  sub_220C54EF4((unint64_t *)&qword_26AD531D8, MEMORY[0x263F410F8]);
  uint64_t v2 = sub_220C74DA0();

  return sub_220C54888(a1, v2);
}

unint64_t sub_220C545D0(uint64_t a1, uint64_t a2)
{
  sub_220C751A0();
  sub_220C74E20();
  uint64_t v4 = sub_220C751C0();

  return sub_220C54A48(a1, a2, v4);
}

unint64_t sub_220C54648(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_220C74E00();
    uint64_t v8 = v7;
    if (v6 == sub_220C74E00() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_220C75140();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_220C74E00();
          uint64_t v15 = v14;
          if (v13 == sub_220C74E00() && v15 == v16) {
            break;
          }
          char v18 = sub_220C75140();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_220C547C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_220C54E44(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x223C715A0](v9, a1);
      sub_220C54EA0((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_220C54888(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_220C74710();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    char v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_220C54EF4(&qword_26AD531E0, MEMORY[0x263F410F8]);
      char v15 = sub_220C74DC0();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

unint64_t sub_220C54A48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_220C75140() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_220C75140() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_220C54B2C()
{
  id v0 = objc_msgSend(self, sel_currentDevice);
  id v1 = objc_msgSend(v0, sel_userInterfaceIdiom);

  if (v1)
  {
    if (qword_26AD53290 != -1) {
      swift_once();
    }
    uint64_t v2 = (uint64_t *)(qword_26AD53210 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
    swift_beginAccess();
    if (sub_220C6F424(*v2, (uint64_t)&unk_26D2AA620)) {
      return 0x3265346664617069;
    }
    else {
      return 0x3430356564617069;
    }
  }
  else
  {
    if (qword_26AD53290 != -1) {
      swift_once();
    }
    uint64_t v4 = (uint64_t *)(qword_26AD53210 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
    swift_beginAccess();
    if (sub_220C6F424(*v4, (uint64_t)&unk_26D2AA5F0)) {
      return 0x3738383461687069;
    }
    else {
      return 0x3236383263687069;
    }
  }
}

uint64_t sub_220C54CDC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

_OWORD *sub_220C54D40(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_220C54D50(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_220C54D8C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_220C54DCC()
{
  id result = *(id *)(v0 + 16);
  if (result) {
    return objc_msgSend(result, sel_setTitleView_, *(void *)(v0 + 24));
  }
  return result;
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

uint64_t sub_220C54E00(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_220C54E44(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_220C54EA0(uint64_t a1)
{
  return a1;
}

uint64_t sub_220C54EF4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_220C54F3C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

id sub_220C54FA0()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TipsManager()), sel_init);
  qword_267F2BC88 = (uint64_t)result;
  return result;
}

id TipsManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id static TipsManager.shared.getter()
{
  if (qword_267F2BA70 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_267F2BC88;

  return v0;
}

uint64_t sub_220C55104()
{
  id v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_shouldShowTip);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_220C55198(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_shouldShowTip);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_220C551E4())()
{
  return j__swift_endAccess;
}

uint64_t sub_220C55244(void *a1)
{
  uint64_t v3 = sub_220C74A20();
  uint64_t v24 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_220C74A80();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_220C74A50();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t result = MEMORY[0x270FA5388](v10);
  BOOL v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((byte_267F2BC90 & 1) == 0)
  {
    uint64_t v19 = v7;
    uint64_t v20 = v6;
    uint64_t v21 = v5;
    uint64_t v22 = v3;
    char v15 = *(void **)(v1 + OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_hostController);
    uint64_t v23 = v1;
    *(void *)(v1 + OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_hostController) = a1;
    id v16 = a1;

    __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BCA8);
    sub_220C74AA0();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_220C788F0;
    sub_220C74A40();
    sub_220C74A60();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    sub_220C74A70();
    sub_220C74A90();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v20);
    uint64_t v17 = v21;
    sub_220C74A10();
    sub_220C74A30();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v17, v22);
    sub_220C74B00();
    swift_bridgeObjectRelease();
    byte_267F2BC90 = 1;
    return sub_220C5561C();
  }
  return result;
}

uint64_t sub_220C5561C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53248);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = &v0[OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_shouldShowTip];
  swift_beginAccess();
  *uint64_t v4 = 0;
  uint64_t v5 = sub_220C74EA0();
  uint64_t v6 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  v6(v3, 1, 1, v5);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v0;
  uint64_t v8 = v0;
  *(void *)&v8[OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_appleIntelligenceTipObservationTask] = sub_220C5CE88((uint64_t)v3, (uint64_t)&unk_267F2BCD8, (uint64_t)v7);
  swift_release();
  v6(v3, 1, 1, v5);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v8;
  uint64_t v10 = v8;
  *(void *)&v10[OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_imageCreateTipObservationTask] = sub_220C5CE88((uint64_t)v3, (uint64_t)&unk_267F2BCE8, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_220C557DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[18] = a4;
  uint64_t v5 = sub_220C75080();
  v4[19] = v5;
  v4[20] = *(void *)(v5 - 8);
  v4[21] = swift_task_alloc();
  v4[22] = swift_task_alloc();
  uint64_t v6 = sub_220C750A0();
  v4[23] = v6;
  v4[24] = *(void *)(v6 - 8);
  v4[25] = swift_task_alloc();
  uint64_t v7 = sub_220C74AE0();
  v4[26] = v7;
  v4[27] = *(void *)(v7 - 8);
  v4[28] = swift_task_alloc();
  v4[29] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BCF0);
  v4[30] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BCF8);
  v4[31] = v8;
  v4[32] = *(void *)(v8 - 8);
  v4[33] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BD00);
  v4[34] = v9;
  v4[35] = *(void *)(v9 - 8);
  v4[36] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_220C55A64, 0, 0);
}

uint64_t sub_220C55A64()
{
  uint64_t v2 = *(void *)(v0 + 256);
  uint64_t v1 = *(void *)(v0 + 264);
  uint64_t v3 = *(void *)(v0 + 248);
  *(void *)(v0 + 296) = sub_220C57EA0();
  sub_220C74930();
  sub_220C74EE0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_tipToDisplay;
  *(void *)(v0 + 304) = OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_shouldShowTip;
  *(void *)(v0 + 312) = v4;
  *(void *)(v0 + 320) = OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_hostController;
  swift_beginAccess();
  *(_DWORD *)(v0 + 124) = *MEMORY[0x263F1C050];
  uint64_t v5 = (_DWORD *)MEMORY[0x263F1C040];
  *(_DWORD *)(v0 + 384) = *MEMORY[0x263F1C020];
  *(_DWORD *)(v0 + 388) = *v5;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 328) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_220C55BD8;
  uint64_t v7 = *(void *)(v0 + 272);
  uint64_t v8 = *(void *)(v0 + 240);
  return MEMORY[0x270FA1F68](v8, 0, 0, v7);
}

uint64_t sub_220C55BD8()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_220C55CD4, 0, 0);
}

uint64_t sub_220C55CD4()
{
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v2 = *(void *)(v0 + 216);
  if ((*(unsigned int (**)(void, uint64_t, uint64_t))(v2 + 48))(*(void *)(v0 + 240), 1, v1) == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 280) + 8))(*(void *)(v0 + 288), *(void *)(v0 + 272));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return v3();
  }
  else
  {
    uint64_t v5 = *(unsigned int *)(v0 + 124);
    uint64_t v36 = *(void *)(v0 + 304);
    uint64_t v7 = *(void *)(v0 + 224);
    uint64_t v6 = *(void *)(v0 + 232);
    uint64_t v8 = *(void *)(v0 + 144);
    sub_220C74950();
    id v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 104);
    v37(v7, v5, v1);
    LOBYTE(v5) = sub_220C74AD0();
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
    v9(v7, v1);
    v9(v6, v1);
    *(unsigned char *)(v8 + v36) = v5 & 1;
    if (v5)
    {
      uint64_t v10 = *(void *)(v0 + 296);
      uint64_t v11 = *(void *)(v0 + 144) + *(void *)(v0 + 312);
      *(void *)(v0 + 40) = &type metadata for AppleIntelligenceTip;
      *(void *)(v0 + 48) = v10;
      swift_beginAccess();
      sub_220C57E38(v0 + 16, v11);
      swift_endAccess();
    }
    uint64_t v12 = *(unsigned int *)(v0 + 388);
    uint64_t v13 = *(unsigned int *)(v0 + 384);
    uint64_t v15 = *(void *)(v0 + 224);
    uint64_t v14 = *(void *)(v0 + 232);
    uint64_t v16 = *(void *)(v0 + 208);
    sub_220C74950();
    uint64_t v17 = sub_220C74A00();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 104))(v15, v13, v17);
    v37(v15, v12, v16);
    LOBYTE(v12) = sub_220C74AD0();
    v9(v15, v16);
    v9(v14, v16);
    if (v12)
    {
      uint64_t v19 = *(void *)(v0 + 160);
      uint64_t v18 = *(void *)(v0 + 168);
      uint64_t v20 = *(void *)(v0 + 152);
      uint64_t v21 = sub_220C751D0();
      uint64_t v23 = v22;
      sub_220C75090();
      *(void *)(v0 + 128) = v21;
      *(void *)(v0 + 136) = v23;
      *(void *)(v0 + 112) = 0;
      *(void *)(v0 + 104) = 0;
      *(unsigned char *)(v0 + 120) = 1;
      uint64_t v24 = sub_220C57DF0(&qword_267F2BD10, MEMORY[0x263F8F710]);
      sub_220C75170();
      sub_220C57DF0(&qword_267F2BD18, MEMORY[0x263F8F6D8]);
      sub_220C750B0();
      uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
      *(void *)(v0 + 336) = v25;
      *(void *)(v0 + 344) = (v19 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v25(v18, v20);
      id v26 = (void *)swift_task_alloc();
      *(void *)(v0 + 352) = v26;
      *id v26 = v0;
      v26[1] = sub_220C56240;
      uint64_t v28 = *(void *)(v0 + 176);
      uint64_t v27 = *(void *)(v0 + 184);
      return MEMORY[0x270FA2380](v28, v0 + 104, v27, v24);
    }
    else
    {
      id v29 = *(void **)(*(void *)(v0 + 144) + *(void *)(v0 + 320));
      *(void *)(v0 + 368) = v29;
      if (v29)
      {
        sub_220C74E80();
        id v30 = v29;
        *(void *)(v0 + 376) = sub_220C74E70();
        uint64_t v32 = sub_220C74E50();
        return MEMORY[0x270FA2498](sub_220C56684, v32, v31);
      }
      else
      {
        sub_220C54404(*(void *)(v0 + 240), &qword_267F2BCF0);
        uint64_t v33 = (void *)swift_task_alloc();
        *(void *)(v0 + 328) = v33;
        *uint64_t v33 = v0;
        v33[1] = sub_220C55BD8;
        uint64_t v34 = *(void *)(v0 + 272);
        uint64_t v35 = *(void *)(v0 + 240);
        return MEMORY[0x270FA1F68](v35, 0, 0, v34);
      }
    }
  }
}

uint64_t sub_220C56240()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)v1 + 336);
  uint64_t v4 = *(void *)(*(void *)v1 + 176);
  uint64_t v5 = *(void *)(*(void *)v1 + 152);
  *(void *)(*(void *)v1 + 360) = v0;
  swift_task_dealloc();
  v3(v4, v5);
  if (v0)
  {
    uint64_t v6 = sub_220C56514;
  }
  else
  {
    (*(void (**)(void, void))(v2[24] + 8))(v2[25], v2[23]);
    uint64_t v6 = sub_220C563D8;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_220C563D8()
{
  uint64_t v1 = *(void **)(v0[18] + v0[40]);
  v0[46] = v1;
  if (v1)
  {
    sub_220C74E80();
    id v2 = v1;
    v0[47] = sub_220C74E70();
    uint64_t v4 = sub_220C74E50();
    return MEMORY[0x270FA2498](sub_220C56684, v4, v3);
  }
  else
  {
    sub_220C54404(v0[30], &qword_267F2BCF0);
    uint64_t v5 = (void *)swift_task_alloc();
    v0[41] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_220C55BD8;
    uint64_t v6 = v0[34];
    uint64_t v7 = v0[30];
    return MEMORY[0x270FA1F68](v7, 0, 0, v6);
  }
}

uint64_t sub_220C56514()
{
  uint64_t v2 = *(void *)(v0 + 192);
  uint64_t v1 = *(void *)(v0 + 200);
  uint64_t v3 = *(void *)(v0 + 184);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = *(void **)(*(void *)(v0 + 144) + *(void *)(v0 + 320));
  *(void *)(v0 + 368) = v4;
  if (v4)
  {
    sub_220C74E80();
    id v5 = v4;
    *(void *)(v0 + 376) = sub_220C74E70();
    uint64_t v7 = sub_220C74E50();
    return MEMORY[0x270FA2498](sub_220C56684, v7, v6);
  }
  else
  {
    sub_220C54404(*(void *)(v0 + 240), &qword_267F2BCF0);
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 328) = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_220C55BD8;
    uint64_t v9 = *(void *)(v0 + 272);
    uint64_t v10 = *(void *)(v0 + 240);
    return MEMORY[0x270FA1F68](v10, 0, 0, v9);
  }
}

uint64_t sub_220C56684()
{
  uint64_t v1 = *(void **)(v0 + 368);
  swift_release();
  objc_msgSend(v1, sel_reloadSpecifiers);

  return MEMORY[0x270FA2498](sub_220C56700, 0, 0);
}

uint64_t sub_220C56700()
{
  sub_220C54404(v0[30], &qword_267F2BCF0);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[41] = (uint64_t)v1;
  void *v1 = v0;
  v1[1] = sub_220C55BD8;
  uint64_t v2 = v0[34];
  uint64_t v3 = v0[30];
  return MEMORY[0x270FA1F68](v3, 0, 0, v2);
}

uint64_t sub_220C567B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[18] = a4;
  uint64_t v5 = sub_220C75080();
  v4[19] = v5;
  v4[20] = *(void *)(v5 - 8);
  v4[21] = swift_task_alloc();
  v4[22] = swift_task_alloc();
  uint64_t v6 = sub_220C750A0();
  v4[23] = v6;
  v4[24] = *(void *)(v6 - 8);
  v4[25] = swift_task_alloc();
  uint64_t v7 = sub_220C74AE0();
  v4[26] = v7;
  v4[27] = *(void *)(v7 - 8);
  v4[28] = swift_task_alloc();
  v4[29] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BCF0);
  v4[30] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BCF8);
  v4[31] = v8;
  v4[32] = *(void *)(v8 - 8);
  v4[33] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BD00);
  v4[34] = v9;
  v4[35] = *(void *)(v9 - 8);
  v4[36] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_220C56A40, 0, 0);
}

uint64_t sub_220C56A40()
{
  uint64_t v2 = *(void *)(v0 + 256);
  uint64_t v1 = *(void *)(v0 + 264);
  uint64_t v3 = *(void *)(v0 + 248);
  *(void *)(v0 + 296) = sub_220C57D9C();
  sub_220C74930();
  sub_220C74EE0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_tipToDisplay;
  *(void *)(v0 + 304) = OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_shouldShowTip;
  *(void *)(v0 + 312) = v4;
  *(void *)(v0 + 320) = OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_hostController;
  swift_beginAccess();
  *(_DWORD *)(v0 + 124) = *MEMORY[0x263F1C050];
  uint64_t v5 = (_DWORD *)MEMORY[0x263F1C040];
  *(_DWORD *)(v0 + 384) = *MEMORY[0x263F1C020];
  *(_DWORD *)(v0 + 388) = *v5;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 328) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_220C56BB4;
  uint64_t v7 = *(void *)(v0 + 272);
  uint64_t v8 = *(void *)(v0 + 240);
  return MEMORY[0x270FA1F68](v8, 0, 0, v7);
}

uint64_t sub_220C56BB4()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_220C56CB0, 0, 0);
}

uint64_t sub_220C56CB0()
{
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v2 = *(void *)(v0 + 216);
  if ((*(unsigned int (**)(void, uint64_t, uint64_t))(v2 + 48))(*(void *)(v0 + 240), 1, v1) == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 280) + 8))(*(void *)(v0 + 288), *(void *)(v0 + 272));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return v3();
  }
  else
  {
    uint64_t v5 = *(unsigned int *)(v0 + 124);
    uint64_t v36 = *(void *)(v0 + 304);
    uint64_t v7 = *(void *)(v0 + 224);
    uint64_t v6 = *(void *)(v0 + 232);
    uint64_t v8 = *(void *)(v0 + 144);
    sub_220C74950();
    id v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 104);
    v37(v7, v5, v1);
    LOBYTE(v5) = sub_220C74AD0();
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
    v9(v7, v1);
    v9(v6, v1);
    *(unsigned char *)(v8 + v36) = v5 & 1;
    if (v5)
    {
      uint64_t v10 = *(void *)(v0 + 296);
      uint64_t v11 = *(void *)(v0 + 144) + *(void *)(v0 + 312);
      *(void *)(v0 + 40) = &type metadata for ImageCreationTip;
      *(void *)(v0 + 48) = v10;
      swift_beginAccess();
      sub_220C57E38(v0 + 16, v11);
      swift_endAccess();
    }
    uint64_t v12 = *(unsigned int *)(v0 + 388);
    uint64_t v13 = *(unsigned int *)(v0 + 384);
    uint64_t v15 = *(void *)(v0 + 224);
    uint64_t v14 = *(void *)(v0 + 232);
    uint64_t v16 = *(void *)(v0 + 208);
    sub_220C74950();
    uint64_t v17 = sub_220C74A00();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 104))(v15, v13, v17);
    v37(v15, v12, v16);
    LOBYTE(v12) = sub_220C74AD0();
    v9(v15, v16);
    v9(v14, v16);
    if (v12)
    {
      uint64_t v19 = *(void *)(v0 + 160);
      uint64_t v18 = *(void *)(v0 + 168);
      uint64_t v20 = *(void *)(v0 + 152);
      uint64_t v21 = sub_220C751D0();
      uint64_t v23 = v22;
      sub_220C75090();
      *(void *)(v0 + 128) = v21;
      *(void *)(v0 + 136) = v23;
      *(void *)(v0 + 112) = 0;
      *(void *)(v0 + 104) = 0;
      *(unsigned char *)(v0 + 120) = 1;
      uint64_t v24 = sub_220C57DF0(&qword_267F2BD10, MEMORY[0x263F8F710]);
      sub_220C75170();
      sub_220C57DF0(&qword_267F2BD18, MEMORY[0x263F8F6D8]);
      sub_220C750B0();
      uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
      *(void *)(v0 + 336) = v25;
      *(void *)(v0 + 344) = (v19 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v25(v18, v20);
      id v26 = (void *)swift_task_alloc();
      *(void *)(v0 + 352) = v26;
      *id v26 = v0;
      v26[1] = sub_220C5721C;
      uint64_t v28 = *(void *)(v0 + 176);
      uint64_t v27 = *(void *)(v0 + 184);
      return MEMORY[0x270FA2380](v28, v0 + 104, v27, v24);
    }
    else
    {
      id v29 = *(void **)(*(void *)(v0 + 144) + *(void *)(v0 + 320));
      *(void *)(v0 + 368) = v29;
      if (v29)
      {
        sub_220C74E80();
        id v30 = v29;
        *(void *)(v0 + 376) = sub_220C74E70();
        uint64_t v32 = sub_220C74E50();
        return MEMORY[0x270FA2498](sub_220C57660, v32, v31);
      }
      else
      {
        sub_220C54404(*(void *)(v0 + 240), &qword_267F2BCF0);
        uint64_t v33 = (void *)swift_task_alloc();
        *(void *)(v0 + 328) = v33;
        *uint64_t v33 = v0;
        v33[1] = sub_220C56BB4;
        uint64_t v34 = *(void *)(v0 + 272);
        uint64_t v35 = *(void *)(v0 + 240);
        return MEMORY[0x270FA1F68](v35, 0, 0, v34);
      }
    }
  }
}

uint64_t sub_220C5721C()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)v1 + 336);
  uint64_t v4 = *(void *)(*(void *)v1 + 176);
  uint64_t v5 = *(void *)(*(void *)v1 + 152);
  *(void *)(*(void *)v1 + 360) = v0;
  swift_task_dealloc();
  v3(v4, v5);
  if (v0)
  {
    uint64_t v6 = sub_220C574F0;
  }
  else
  {
    (*(void (**)(void, void))(v2[24] + 8))(v2[25], v2[23]);
    uint64_t v6 = sub_220C573B4;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_220C573B4()
{
  uint64_t v1 = *(void **)(v0[18] + v0[40]);
  v0[46] = v1;
  if (v1)
  {
    sub_220C74E80();
    id v2 = v1;
    v0[47] = sub_220C74E70();
    uint64_t v4 = sub_220C74E50();
    return MEMORY[0x270FA2498](sub_220C57660, v4, v3);
  }
  else
  {
    sub_220C54404(v0[30], &qword_267F2BCF0);
    uint64_t v5 = (void *)swift_task_alloc();
    v0[41] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_220C56BB4;
    uint64_t v6 = v0[34];
    uint64_t v7 = v0[30];
    return MEMORY[0x270FA1F68](v7, 0, 0, v6);
  }
}

uint64_t sub_220C574F0()
{
  uint64_t v2 = *(void *)(v0 + 192);
  uint64_t v1 = *(void *)(v0 + 200);
  uint64_t v3 = *(void *)(v0 + 184);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = *(void **)(*(void *)(v0 + 144) + *(void *)(v0 + 320));
  *(void *)(v0 + 368) = v4;
  if (v4)
  {
    sub_220C74E80();
    id v5 = v4;
    *(void *)(v0 + 376) = sub_220C74E70();
    uint64_t v7 = sub_220C74E50();
    return MEMORY[0x270FA2498](sub_220C57660, v7, v6);
  }
  else
  {
    sub_220C54404(*(void *)(v0 + 240), &qword_267F2BCF0);
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 328) = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_220C56BB4;
    uint64_t v9 = *(void *)(v0 + 272);
    uint64_t v10 = *(void *)(v0 + 240);
    return MEMORY[0x270FA1F68](v10, 0, 0, v9);
  }
}

uint64_t sub_220C57660()
{
  uint64_t v1 = *(void **)(v0 + 368);
  swift_release();
  objc_msgSend(v1, sel_reloadSpecifiers);

  return MEMORY[0x270FA2498](sub_220C576DC, 0, 0);
}

uint64_t sub_220C576DC()
{
  sub_220C54404(v0[30], &qword_267F2BCF0);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[41] = (uint64_t)v1;
  void *v1 = v0;
  v1[1] = sub_220C56BB4;
  uint64_t v2 = v0[34];
  uint64_t v3 = v0[30];
  return MEMORY[0x270FA1F68](v3, 0, 0, v2);
}

id TipsManager.init()()
{
  v0[OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_shouldShowTip] = 0;
  uint64_t v1 = &v0[OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_tipToDisplay];
  *(_OWORD *)uint64_t v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((void *)v1 + 4) = 0;
  *(void *)&v0[OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_appleIntelligenceTipObservationTask] = 0;
  *(void *)&v0[OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_imageCreateTipObservationTask] = 0;
  *(void *)&v0[OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_hostController] = 0;
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for TipsManager();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for TipsManager()
{
  return self;
}

id TipsManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipsManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_220C578F0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  objc_super v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_shouldShowTip);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_220C57944(char *a1, void *a2)
{
  char v2 = *a1;
  objc_super v3 = (unsigned char *)(*a2 + OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_shouldShowTip);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

uint64_t method lookup function for TipsManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TipsManager);
}

uint64_t dispatch thunk of TipsManager.shouldShowTip.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of TipsManager.shouldShowTip.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of TipsManager.shouldShowTip.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of TipsManager.configureTips(controller:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t sub_220C57AFC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_220C57EF4;
  return sub_220C557DC(a1, v4, v5, v6);
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_220C57BF4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_220C57CA8;
  return sub_220C567B8(a1, v4, v5, v6);
}

uint64_t sub_220C57CA8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_220C57D9C()
{
  unint64_t result = qword_267F2BD08;
  if (!qword_267F2BD08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F2BD08);
  }
  return result;
}

uint64_t sub_220C57DF0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_220C57E38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BCC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_220C57EA0()
{
  unint64_t result = qword_267F2BD20;
  if (!qword_267F2BD20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F2BD20);
  }
  return result;
}

uint64_t sub_220C57EF8()
{
  id v0 = objc_msgSend(self, sel_assistantLanguageTitlesDictionary);
  if (!v0 || (v1 = v0, uint64_t v2 = sub_220C74D90(), v1, !v2))
  {
    long long v7 = 0u;
    long long v8 = 0u;
LABEL_11:
    sub_220C5803C((uint64_t)&v7);
    return 0;
  }
  sub_220C749A0();
  sub_220C75040();
  if (*(void *)(v2 + 16) && (unint64_t v3 = sub_220C544F4((uint64_t)&v6), (v4 & 1) != 0))
  {
    sub_220C5809C(*(void *)(v2 + 56) + 32 * v3, (uint64_t)&v7);
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_220C54EA0((uint64_t)&v6);
  if (!*((void *)&v8 + 1)) {
    goto LABEL_11;
  }
  if (swift_dynamicCast()) {
    return v6;
  }
  return 0;
}

uint64_t sub_220C5803C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BD28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_220C5809C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t GMAnalyticsAction.init(rawValue:)(unint64_t a1)
{
  return sub_220C59ADC(a1);
}

BOOL sub_220C58118(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_220C5812C()
{
  return sub_220C751C0();
}

uint64_t sub_220C58174()
{
  return sub_220C751B0();
}

uint64_t sub_220C581A0()
{
  return sub_220C751C0();
}

unint64_t sub_220C581E4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_220C59ADC(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_220C58218(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_220C58224()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BD68);
  id v0 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2BC70) - 8);
  uint64_t v1 = *(void *)(*(void *)v0 + 72);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v0 + 80);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_220C78930;
  unint64_t v3 = v17 + v2;
  uint64_t v4 = v0[14];
  uint64_t v5 = *MEMORY[0x263F41068];
  uint64_t v6 = sub_220C74710();
  long long v7 = *(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104);
  v7(v3, v5, v6);
  *(void *)(v3 + v4) = 1;
  uint64_t v8 = v0[14];
  v7(v3 + v1, *MEMORY[0x263F410D8], v6);
  *(void *)(v3 + v1 + v8) = 4;
  uint64_t v9 = v0[14];
  v7(v3 + 2 * v1, *MEMORY[0x263F410E8], v6);
  *(void *)(v3 + 2 * v1 + v9) = 4;
  uint64_t v10 = v0[14];
  v7(v3 + 3 * v1, *MEMORY[0x263F41088], v6);
  *(void *)(v3 + 3 * v1 + v10) = 2;
  uint64_t v11 = v0[14];
  v7(v3 + 4 * v1, *MEMORY[0x263F41080], v6);
  *(void *)(v3 + 4 * v1 + v11) = 2;
  uint64_t v12 = v0[14];
  v7(v3 + 5 * v1, *MEMORY[0x263F410C0], v6);
  *(void *)(v3 + 5 * v1 + v12) = 2;
  uint64_t v13 = v0[14];
  v7(v3 + 6 * v1, *MEMORY[0x263F410B0], v6);
  *(void *)(v3 + 6 * v1 + v13) = 8;
  unint64_t v14 = v3 + 7 * v1;
  uint64_t v15 = v0[14];
  v7(v14, *MEMORY[0x263F410F0], v6);
  *(void *)(v14 + v15) = 16;
  unint64_t result = (void *)sub_220C52BD8(v17);
  off_267F2BD30 = result;
  return result;
}

id GMAnalyticsProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id GMAnalyticsProvider.init()()
{
  uint64_t v1 = sub_220C74780();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_220C74800();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_220C74760();
  uint64_t v17 = &off_26D2AABE0;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v15);
  uint64_t v9 = v0;
  sub_220C74770();
  sub_220C747F0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_220C74790();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_220C59AF4(&v15, (uint64_t)&v9[OBJC_IVAR___GMAnalyticsProvider_gmAvailabilityProvider]);
  uint64_t v10 = (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))&v9[OBJC_IVAR___GMAnalyticsProvider_sendFunction];
  char *v10 = sub_220C58700;
  v10[1] = 0;

  uint64_t v11 = (objc_class *)type metadata accessor for GMAnalyticsProvider();
  v14.receiver = v9;
  v14.super_class = v11;
  return objc_msgSendSuper2(&v14, sel_init);
}

uint64_t sub_220C58700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void *)sub_220C74DD0();
  v10[4] = a3;
  v10[5] = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_220C587C0;
  v10[3] = &block_descriptor_4;
  uint64_t v7 = _Block_copy(v10);
  swift_retain();
  uint64_t v8 = AnalyticsSendEventLazy();

  _Block_release(v7);
  swift_release();
  return v8;
}

id sub_220C587C0(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_220C54D50(0, &qword_267F2BD60);
    uint64_t v4 = (void *)sub_220C74D80();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void *sub_220C58880@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_220C5888C(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_220C58894@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_220C588A8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_220C588BC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_220C588D0(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_220C58900@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_220C5892C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_220C58950(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_220C58964(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_220C58978(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_220C5898C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_220C589A0(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_220C589B4(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_220C589C8(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_220C589DC()
{
  return *v0 == 0;
}

uint64_t sub_220C589EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_220C58A04(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_220C58A18@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_220C58A28@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_220C59E40(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_220C58A68(uint64_t a1)
{
  uint64_t v3 = *(uint64_t (**)(unint64_t, unint64_t, uint64_t (*)(), uint64_t))&v1[OBJC_IVAR___GMAnalyticsProvider_sendFunction];
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = v1;
  uint64_t v5 = v1;
  LOBYTE(a1) = v3(0xD00000000000002CLL, 0x8000000220C7EE70, sub_220C59B68, v4);
  swift_release();
  return a1 & 1;
}

uint64_t sub_220C58B14(unint64_t a1, uint64_t a2)
{
  uint64_t v96 = a2;
  uint64_t v3 = sub_220C74710();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v75 - v8;
  uint64_t v10 = sub_220C74760();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  v89 = (char *)v75 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_220C74730();
  uint64_t v13 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388](v81);
  v80 = (char *)v75 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BD50);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_220C788B0;
  *(void *)(inited + 32) = 7627617;
  *(void *)(inited + 40) = 0xE300000000000000;
  *(void *)(inited + 48) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, a1);
  unint64_t v90 = sub_220C52DCC(inited);
  uint64_t v16 = sub_220C59A7C(a1);
  uint64_t v88 = *(void *)(v16 + 16);
  if (!v88)
  {
    sub_220C749A0();
LABEL_63:
    swift_bridgeObjectRelease();
    return v90;
  }
  v87 = (void *)(v96 + OBJC_IVAR___GMAnalyticsProvider_gmAvailabilityProvider);
  v86 = (void (**)(char *, void *, uint64_t))(v11 + 16);
  v85 = (uint64_t (**)(char *, uint64_t))(v11 + 88);
  int v84 = *MEMORY[0x263F40FA8];
  v79 = (void (**)(char *, uint64_t))(v11 + 8);
  v78 = (void (**)(char *, uint64_t))(v11 + 96);
  v77 = (void (**)(char *, char *, uint64_t))(v13 + 32);
  v76 = (void (**)(char *, uint64_t))(v13 + 8);
  uint64_t v95 = v4 + 32;
  uint64_t v96 = v4 + 16;
  uint64_t v17 = (void (**)(char *, uint64_t))(v4 + 8);
  v75[1] = v16;
  swift_bridgeObjectRetain_n();
  uint64_t v18 = 0;
  uint64_t v83 = MEMORY[0x263F8EE58] + 8;
  uint64_t v82 = v10;
  uint64_t v19 = v89;
  while (1)
  {
    uint64_t v92 = v18;
    uint64_t v21 = __swift_project_boxed_opaque_existential_1(v87, v87[3]);
    (*v86)(v19, v21, v10);
    int v22 = (*v85)(v19, v10);
    if (v22 == v84)
    {
      (*v78)(v19, v10);
      uint64_t v23 = v80;
      uint64_t v24 = v81;
      (*v77)(v80, v19, v81);
      uint64_t v25 = sub_220C74720();
      (*v76)(v23, v24);
    }
    else
    {
      (*v79)(v19, v10);
      uint64_t v25 = MEMORY[0x263F8EE88];
    }
    uint64_t v26 = *(void *)(v25 + 56);
    uint64_t v94 = v25 + 56;
    uint64_t v27 = 1 << *(unsigned char *)(v25 + 32);
    if (v27 < 64) {
      uint64_t v28 = ~(-1 << v27);
    }
    else {
      uint64_t v28 = -1;
    }
    unint64_t v29 = v28 & v26;
    int64_t v30 = (unint64_t)(v27 + 63) >> 6;
    sub_220C749A0();
    int64_t v31 = 0;
    for (i = (int8x16_t *)MEMORY[0x263F8EE78]; v29; v45[v43 + 4] = v91)
    {
      while (1)
      {
        unint64_t v32 = __clz(__rbit64(v29));
        v29 &= v29 - 1;
        unint64_t v33 = v32 | (v31 << 6);
LABEL_32:
        (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v9, *(void *)(v25 + 48) + *(void *)(v4 + 72) * v33, v3);
        (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v9, v3);
        if (qword_267F2BA78 != -1) {
          swift_once();
        }
        id v37 = off_267F2BD30;
        if (*((void *)off_267F2BD30 + 2))
        {
          unint64_t v38 = sub_220C54538((uint64_t)v7);
          if (v39) {
            break;
          }
        }
        (*v17)(v7, v3);
        if (!v29) {
          goto LABEL_16;
        }
      }
      uint64_t v40 = *(void *)(v37[7] + 8 * v38);
      (*v17)(v7, v3);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v91 = v40;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        i = (int8x16_t *)sub_220C6021C(0, i[1].i64[0] + 1, 1, i);
      }
      unint64_t v43 = i[1].u64[0];
      unint64_t v42 = i[1].u64[1];
      unint64_t v44 = v43 + 1;
      if (v43 >= v42 >> 1)
      {
        v75[0] = v43 + 1;
        uint64_t v46 = (int8x16_t *)sub_220C6021C((void *)(v42 > 1), v43 + 1, 1, i);
        unint64_t v44 = v75[0];
        i = v46;
      }
      uint64_t v45 = (uint64_t *)i;
      i[1].i64[0] = v44;
    }
LABEL_16:
    int64_t v34 = v31 + 1;
    if (__OFADD__(v31, 1))
    {
      __break(1u);
      goto LABEL_65;
    }
    if (v34 < v30)
    {
      unint64_t v35 = *(void *)(v94 + 8 * v34);
      ++v31;
      if (v35) {
        goto LABEL_31;
      }
      int64_t v31 = v34 + 1;
      if (v34 + 1 < v30)
      {
        unint64_t v35 = *(void *)(v94 + 8 * v31);
        if (v35) {
          goto LABEL_31;
        }
        int64_t v31 = v34 + 2;
        if (v34 + 2 < v30)
        {
          unint64_t v35 = *(void *)(v94 + 8 * v31);
          if (v35) {
            goto LABEL_31;
          }
          int64_t v31 = v34 + 3;
          if (v34 + 3 < v30)
          {
            unint64_t v35 = *(void *)(v94 + 8 * v31);
            if (v35) {
              goto LABEL_31;
            }
            int64_t v36 = v34 + 4;
            if (v36 < v30) {
              break;
            }
          }
        }
      }
    }
LABEL_42:
    swift_release();
    swift_bridgeObjectRelease();
    unint64_t v47 = i[1].u64[0];
    if (!v47)
    {
      int8x8_t v49 = 0;
      uint64_t v10 = v82;
      goto LABEL_51;
    }
    uint64_t v10 = v82;
    if (v47 < 4)
    {
      uint64_t v48 = 0;
      int8x8_t v49 = 0;
LABEL_49:
      unint64_t v55 = v47 - v48;
      v56 = &i[2].i64[v48];
      do
      {
        uint64_t v57 = *v56++;
        *(void *)&v49 |= v57;
        --v55;
      }
      while (v55);
      goto LABEL_51;
    }
    uint64_t v48 = v47 & 0x7FFFFFFFFFFFFFFCLL;
    v50 = i + 3;
    int8x16_t v51 = 0uLL;
    uint64_t v52 = v47 & 0x7FFFFFFFFFFFFFFCLL;
    int8x16_t v53 = 0uLL;
    do
    {
      int8x16_t v51 = vorrq_s8(v50[-1], v51);
      int8x16_t v53 = vorrq_s8(*v50, v53);
      v50 += 2;
      v52 -= 4;
    }
    while (v52);
    int8x16_t v54 = vorrq_s8(v53, v51);
    int8x8_t v49 = vorr_s8(*(int8x8_t *)v54.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v54, v54, 8uLL));
    if (v47 != v48) {
      goto LABEL_49;
    }
LABEL_51:
    swift_bridgeObjectRelease();
    v58 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInteger_, *(void *)&v49);
    uint64_t v99 = sub_220C54D50(0, (unint64_t *)&qword_267F2BD58);
    v98 = v58;
    sub_220C54D50(0, &qword_267F2BD60);
    if (swift_dynamicCast())
    {
      id v59 = v97;
      unint64_t v60 = v90;
      LODWORD(v94) = swift_isUniquelyReferenced_nonNull_native();
      v98 = (void *)v60;
      unint64_t v62 = sub_220C545D0(7631717, 0xE300000000000000);
      uint64_t v63 = *(void *)(v60 + 16);
      BOOL v64 = (v61 & 1) == 0;
      uint64_t v65 = v63 + v64;
      if (__OFADD__(v63, v64)) {
        goto LABEL_66;
      }
      char v66 = v61;
      if (*(void *)(v60 + 24) >= v65)
      {
        if ((v94 & 1) == 0) {
          sub_220C598C8();
        }
      }
      else
      {
        sub_220C595B8(v65, v94);
        unint64_t v67 = sub_220C545D0(7631717, 0xE300000000000000);
        if ((v66 & 1) != (v68 & 1)) {
          goto LABEL_68;
        }
        unint64_t v62 = v67;
      }
      v69 = v98;
      unint64_t v90 = (unint64_t)v98;
      if (v66)
      {
        uint64_t v20 = v98[7];

        *(void *)(v20 + 8 * v62) = v59;
      }
      else
      {
        v98[(v62 >> 6) + 8] |= 1 << v62;
        v70 = (void *)(v69[6] + 16 * v62);
        void *v70 = 7631717;
        v70[1] = 0xE300000000000000;
        *(void *)(v69[7] + 8 * v62) = v59;
        uint64_t v71 = v69[2];
        BOOL v72 = __OFADD__(v71, 1);
        uint64_t v73 = v71 + 1;
        if (v72) {
          goto LABEL_67;
        }
        v69[2] = v73;
      }

      swift_bridgeObjectRelease();
    }
    uint64_t v19 = v89;
    uint64_t v18 = v92 + 1;
    if (v92 + 1 == v88)
    {
      swift_bridgeObjectRelease();
      goto LABEL_63;
    }
  }
  unint64_t v35 = *(void *)(v94 + 8 * v36);
  if (v35)
  {
    int64_t v31 = v36;
LABEL_31:
    unint64_t v29 = (v35 - 1) & v35;
    unint64_t v33 = __clz(__rbit64(v35)) + (v31 << 6);
    goto LABEL_32;
  }
  while (1)
  {
    int64_t v31 = v36 + 1;
    if (__OFADD__(v36, 1)) {
      break;
    }
    if (v31 >= v30) {
      goto LABEL_42;
    }
    unint64_t v35 = *(void *)(v94 + 8 * v31);
    ++v36;
    if (v35) {
      goto LABEL_31;
    }
  }
LABEL_65:
  __break(1u);
LABEL_66:
  __break(1u);
LABEL_67:
  __break(1u);
LABEL_68:
  uint64_t result = sub_220C75160();
  __break(1u);
  return result;
}

id GMAnalyticsProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GMAnalyticsProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_220C595B8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BC80);
  char v38 = a2;
  uint64_t v6 = sub_220C750E0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  unint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    int v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    unint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      sub_220C749A0();
      id v33 = v32;
    }
    sub_220C751A0();
    sub_220C74E20();
    uint64_t result = sub_220C751C0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  int v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

id sub_220C598C8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BC80);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_220C750D0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    sub_220C749A0();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_220C59A7C(unint64_t a1)
{
  if (a1 < 0xE && ((0x3FBFu >> a1) & 1) != 0) {
    return (uint64_t)*(&off_26457DB08 + a1);
  }
  uint64_t result = sub_220C75150();
  __break(1u);
  return result;
}

unint64_t sub_220C59ADC(unint64_t result)
{
  if (result > 0xD || result == 6) {
    return 0;
  }
  return result;
}

uint64_t sub_220C59AF4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t type metadata accessor for GMAnalyticsProvider()
{
  return self;
}

uint64_t sub_220C59B30()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_220C59B68()
{
  return sub_220C58B14(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

unint64_t sub_220C59B74()
{
  unint64_t result = qword_267F2BD48;
  if (!qword_267F2BD48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F2BD48);
  }
  return result;
}

ValueMetadata *type metadata accessor for GMAnalyticsAction()
{
  return &type metadata for GMAnalyticsAction;
}

uint64_t method lookup function for GMAnalyticsProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GMAnalyticsProvider);
}

uint64_t dispatch thunk of GMAnalyticsProvider.sendAction(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for GMAnalyticsProvider.Eligibility()
{
  return &type metadata for GMAnalyticsProvider.Eligibility;
}

unint64_t sub_220C59CE4()
{
  unint64_t result = qword_267F2BD70;
  if (!qword_267F2BD70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F2BD70);
  }
  return result;
}

unint64_t sub_220C59D3C()
{
  unint64_t result = qword_267F2BD78;
  if (!qword_267F2BD78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F2BD78);
  }
  return result;
}

unint64_t sub_220C59D94()
{
  unint64_t result = qword_267F2BD80;
  if (!qword_267F2BD80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F2BD80);
  }
  return result;
}

unint64_t sub_220C59DEC()
{
  unint64_t result = qword_267F2BD88;
  if (!qword_267F2BD88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F2BD88);
  }
  return result;
}

uint64_t sub_220C59E40(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

ValueMetadata *type metadata accessor for ImageCreationTip()
{
  return &type metadata for ImageCreationTip;
}

uint64_t sub_220C59E9C()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_220C59EA8@<X0>(uint64_t *a1@<X8>)
{
  a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BDB0);
  a1[4] = sub_220C5A880(&qword_267F2BDB8);
  __swift_allocate_boxed_opaque_existential_1(a1);
  sub_220C5A880(&qword_267F2BDC0);
  return sub_220C74590();
}

unint64_t sub_220C59F4C()
{
  return 0xD00000000000002CLL;
}

uint64_t sub_220C59F68()
{
  return sub_220C74940();
}

uint64_t sub_220C59F90()
{
  type metadata accessor for GMFooterUtility();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);

  return MEMORY[0x270F04738](0xD000000000000014, 0x8000000220C7EF60, v1);
}

uint64_t sub_220C5A010()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BDA8);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  long long v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_220C74AB0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267F2BA80 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v0, (uint64_t)qword_267F2D390);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v8, v0);
  sub_220C74AC0();
  sub_220C74990();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v9 = sub_220C749A0();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_220C5A208()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BD98);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  long long v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_220C749E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BDA0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220C749F0();
  uint64_t v12 = MEMORY[0x263F1C010];
  MEMORY[0x223C70F20](v7, v4, MEMORY[0x263F1C010]);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v16 = v4;
  uint64_t v17 = v12;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x223C70F40](v11, v8, OpaqueTypeConformance2);
  uint64_t v16 = v8;
  uint64_t v17 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v14 = sub_220C749C0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v14;
}

void sub_220C5A4A4(void *a1@<X8>)
{
  *a1 = 0xD00000000000002CLL;
  a1[1] = 0x8000000220C7EF80;
}

unint64_t sub_220C5A4C8()
{
  unint64_t result = qword_267F2BD90;
  if (!qword_267F2BD90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F2BD90);
  }
  return result;
}

uint64_t sub_220C5A51C()
{
  uint64_t v18 = sub_220C74780();
  uint64_t v0 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_220C74800();
  uint64_t v3 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_220C74760();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v16 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BDA8);
  __swift_allocate_value_buffer(v13, qword_267F2D390);
  __swift_project_value_buffer(v13, (uint64_t)qword_267F2D390);
  sub_220C74770();
  sub_220C747F0();
  (*(void (**)(char *, uint64_t))(v0 + 8))(v2, v18);
  sub_220C74790();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v17);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, *MEMORY[0x263F41150], v6);
  LOBYTE(v3) = sub_220C74750();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v7 + 8);
  v14(v10, v6);
  v14(v12, v6);
  char v19 = v3 & 1;
  return sub_220C74AF0();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_220C5A880(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F2BDB0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_220C5A92C(uint64_t a1)
{
  return sub_220C5A978(a1, qword_267F2D3A8);
}

uint64_t sub_220C5A950(uint64_t a1)
{
  return sub_220C5A978(a1, qword_26AD53298);
}

uint64_t sub_220C5A978(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_220C74920();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  sub_220C749A0();
  return sub_220C74910();
}

uint64_t sub_220C5AA00()
{
  type metadata accessor for GMDownloadUtility();
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = v0 + OBJC_IVAR____TtC24AssistantSettingsSupport17GMDownloadUtility____lazy_storage___progress;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BDF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC24AssistantSettingsSupport17GMDownloadUtility_continuation;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BE08);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(unsigned char *)(v0 + OBJC_IVAR____TtC24AssistantSettingsSupport17GMDownloadUtility_downloading) = 0;
  qword_267F2D3C0 = v0;
  return result;
}

uint64_t sub_220C5AAE8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BE48);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v17[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BE50);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = &v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v17[-v11];
  uint64_t v13 = v1 + OBJC_IVAR____TtC24AssistantSettingsSupport17GMDownloadUtility____lazy_storage___progress;
  swift_beginAccess();
  sub_220C54F3C(v13, (uint64_t)v12, &qword_267F2BE50);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BDF8);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14) != 1) {
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v15 + 32))(a1, v12, v14);
  }
  sub_220C54404((uint64_t)v12, &qword_267F2BE50);
  sub_220C5C4FC();
  (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F8F580], v3);
  sub_220C74F00();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v15 + 16))(v10, a1, v14);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v15 + 56))(v10, 0, 1, v14);
  swift_beginAccess();
  sub_220C5C5AC((uint64_t)v10, v13, &qword_267F2BE50);
  return swift_endAccess();
}

uint64_t sub_220C5ADA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BE08);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BE20);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v20 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v20 - v15;
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v17((char *)&v20 - v15, a1, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v16, 0, 1, v4);
  sub_220C5C544((uint64_t)v16, (uint64_t)v14);
  uint64_t v18 = a2 + OBJC_IVAR____TtC24AssistantSettingsSupport17GMDownloadUtility_continuation;
  swift_beginAccess();
  sub_220C5C5AC((uint64_t)v14, v18, &qword_267F2BE20);
  swift_endAccess();
  sub_220C54F3C(v18, (uint64_t)v11, &qword_267F2BE20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v11, 1, v4)) {
    return sub_220C54404((uint64_t)v11, &qword_267F2BE20);
  }
  v17(v7, (uint64_t)v11, v4);
  sub_220C54404((uint64_t)v11, &qword_267F2BE20);
  swift_retain();
  sub_220C74EB0();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_220C5B03C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BE20);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BE08);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = a2 + OBJC_IVAR____TtC24AssistantSettingsSupport17GMDownloadUtility_continuation;
  swift_beginAccess();
  sub_220C5C5AC((uint64_t)v5, v7, &qword_267F2BE20);
  return swift_endAccess();
}

void sub_220C5B134()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53248);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC24AssistantSettingsSupport17GMDownloadUtility_downloading))
  {
    if (qword_26AD53240 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_220C74920();
    __swift_project_value_buffer(v4, (uint64_t)qword_26AD53298);
    int64_t v22 = sub_220C74900();
    os_log_type_t v5 = sub_220C74F30();
    if (os_log_type_enabled(v22, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      uint64_t v24 = v7;
      *(_DWORD *)uint64_t v6 = 136315138;
      uint64_t v23 = sub_220C6043C(0x29287472617473, 0xE700000000000000, &v24);
      sub_220C74FD0();
      _os_log_impl(&dword_220C23000, v22, v5, "%s #GMS Already downloading", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C72360](v7, -1, -1);
      MEMORY[0x223C72360](v6, -1, -1);
    }
    else
    {
      uint64_t v20 = v22;
    }
  }
  else
  {
    if (qword_26AD53240 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_220C74920();
    __swift_project_value_buffer(v8, (uint64_t)qword_26AD53298);
    uint64_t v9 = sub_220C74900();
    os_log_type_t v10 = sub_220C74F30();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v24 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      uint64_t v23 = sub_220C6043C(0x29287472617473, 0xE700000000000000, &v24);
      sub_220C74FD0();
      _os_log_impl(&dword_220C23000, v9, v10, "%s #GMS Starting download", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C72360](v12, -1, -1);
      MEMORY[0x223C72360](v11, -1, -1);
    }

    uint64_t v13 = sub_220C74EA0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v3, 1, 1, v13);
    uint64_t v14 = (void *)swift_allocObject();
    v14[2] = 0;
    v14[3] = 0;
    v14[4] = v0;
    swift_retain();
    sub_220C5C068((uint64_t)v3, (uint64_t)&unk_267F2BE18, (uint64_t)v14);
    swift_release();
    id v15 = objc_msgSend(self, sel_sharedManager);
    uint64_t v16 = (void *)sub_220C74DD0();
    objc_msgSend(v15, sel_updateAssetsForSubscriber_subscriptionName_policies_queue_progress_completion_, v16, 0, 0, 0, 0, 0);

    uint64_t v17 = sub_220C74900();
    os_log_type_t v18 = sub_220C74F30();
    if (os_log_type_enabled(v17, v18))
    {
      char v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v19 = 0;
      _os_log_impl(&dword_220C23000, v17, v18, "#GMS Availability: Forcing download of NL Router", v19, 2u);
      MEMORY[0x223C72360](v19, -1, -1);
    }
  }
}

uint64_t sub_220C5B5E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[8] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BE08);
  v4[9] = v5;
  v4[10] = *(void *)(v5 - 8);
  v4[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BE20);
  v4[12] = swift_task_alloc();
  v4[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BE28);
  v4[14] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BE30);
  v4[15] = v6;
  v4[16] = *(void *)(v6 - 8);
  v4[17] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BE38);
  v4[18] = v7;
  v4[19] = *(void *)(v7 - 8);
  v4[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_220C5B7DC, 0, 0);
}

uint64_t sub_220C5B7DC()
{
  sub_220C746D0();
  swift_allocObject();
  v0[21] = sub_220C746C0();
  sub_220C746B0();
  uint64_t v1 = v0[8];
  uint64_t v2 = OBJC_IVAR____TtC24AssistantSettingsSupport17GMDownloadUtility_downloading;
  v0[22] = OBJC_IVAR____TtC24AssistantSettingsSupport17GMDownloadUtility_downloading;
  *(unsigned char *)(v1 + v2) = 1;
  sub_220C74EE0();
  v0[23] = OBJC_IVAR____TtC24AssistantSettingsSupport17GMDownloadUtility_continuation;
  swift_beginAccess();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[24] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_220C5B9B4;
  uint64_t v4 = v0[15];
  return MEMORY[0x270FA1F68](v0 + 5, 0, 0, v4);
}

uint64_t sub_220C5B9B4()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_220C5BAB0, 0, 0);
}

uint64_t sub_220C5BAB0()
{
  if (*(unsigned char *)(v0 + 48))
  {
    (*(void (**)(void, void))(*(void *)(v0 + 128) + 8))(*(void *)(v0 + 136), *(void *)(v0 + 120));
    if (qword_26AD53240 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_220C74920();
    __swift_project_value_buffer(v1, (uint64_t)qword_26AD53298);
    uint64_t v2 = sub_220C74900();
    os_log_type_t v3 = sub_220C74F30();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_220C23000, v2, v3, "#GMS Availability: Models Downloaded", v4, 2u);
      MEMORY[0x223C72360](v4, -1, -1);
    }
    uint64_t v6 = *(void *)(v0 + 176);
    uint64_t v5 = *(void *)(v0 + 184);
    uint64_t v7 = *(void *)(v0 + 96);
    uint64_t v8 = *(void *)(v0 + 72);
    uint64_t v9 = *(void *)(v0 + 80);
    uint64_t v10 = *(void *)(v0 + 64);

    *(unsigned char *)(v10 + v6) = 0;
    sub_220C54F3C(v10 + v5, v7, &qword_267F2BE20);
    int v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
    uint64_t v12 = *(void *)(v0 + 160);
    uint64_t v13 = *(void *)(v0 + 144);
    uint64_t v14 = *(void *)(v0 + 152);
    uint64_t v15 = *(void *)(v0 + 96);
    if (v11)
    {
      (*(void (**)(void, void))(v14 + 8))(*(void *)(v0 + 160), *(void *)(v0 + 144));
      swift_release();
      sub_220C54404(v15, &qword_267F2BE20);
    }
    else
    {
      uint64_t v33 = *(void *)(v0 + 80);
      uint64_t v32 = *(void *)(v0 + 88);
      uint64_t v34 = *(void *)(v0 + 72);
      (*(void (**)(uint64_t, void, uint64_t))(v33 + 16))(v32, *(void *)(v0 + 96), v34);
      sub_220C54404(v15, &qword_267F2BE20);
      sub_220C74ED0();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v32, v34);
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v35 = *(uint64_t (**)(void))(v0 + 8);
    return v35();
  }
  else
  {
    sub_220C5C4FC();
    uint64_t v16 = (void *)sub_220C74FA0();
    if (qword_26AD53240 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_220C74920();
    __swift_project_value_buffer(v17, (uint64_t)qword_26AD53298);
    os_log_type_t v18 = v16;
    char v19 = sub_220C74900();
    os_log_type_t v20 = sub_220C74F30();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      int64_t v22 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 138412290;
      *(void *)(v21 + 4) = v18;
      void *v22 = v18;

      _os_log_impl(&dword_220C23000, v19, v20, "#GMS download percentage: %@", (uint8_t *)v21, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53250);
      swift_arrayDestroy();
      MEMORY[0x223C72360](v22, -1, -1);
      MEMORY[0x223C72360](v21, -1, -1);
    }
    else
    {

      char v19 = v18;
    }
    uint64_t v23 = *(void *)(v0 + 184);
    uint64_t v24 = *(void *)(v0 + 104);
    uint64_t v25 = *(void *)(v0 + 72);
    uint64_t v26 = *(void *)(v0 + 80);
    uint64_t v27 = *(void *)(v0 + 64);

    sub_220C54F3C(v27 + v23, v24, &qword_267F2BE20);
    int v28 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25);
    uint64_t v29 = *(void *)(v0 + 104);
    uint64_t v30 = *(void *)(v0 + 112);
    if (v28)
    {

      sub_220C54404(v29, &qword_267F2BE20);
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BE40);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v30, 1, 1, v31);
    }
    else
    {
      uint64_t v38 = *(void *)(v0 + 80);
      uint64_t v37 = *(void *)(v0 + 88);
      uint64_t v39 = *(void *)(v0 + 72);
      (*(void (**)(uint64_t, void, uint64_t))(v38 + 16))(v37, *(void *)(v0 + 104), v39);
      sub_220C54404(v29, &qword_267F2BE20);
      *(void *)(v0 + 56) = v18;
      sub_220C74EC0();
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v39);
      uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BE40);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v30, 0, 1, v40);
    }
    sub_220C54404(*(void *)(v0 + 112), &qword_267F2BE28);
    id v41 = (void *)swift_task_alloc();
    *(void *)(v0 + 192) = v41;
    *id v41 = v0;
    v41[1] = sub_220C5B9B4;
    uint64_t v42 = *(void *)(v0 + 120);
    return MEMORY[0x270FA1F68](v0 + 40, 0, 0, v42);
  }
}

uint64_t sub_220C5C068(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_220C74EA0();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_220C74E90();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_220C54404(a1, &qword_26AD53248);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_220C74E50();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_220C5C1F0()
{
  sub_220C54404(v0 + OBJC_IVAR____TtC24AssistantSettingsSupport17GMDownloadUtility____lazy_storage___progress, &qword_267F2BE50);
  sub_220C54404(v0 + OBJC_IVAR____TtC24AssistantSettingsSupport17GMDownloadUtility_continuation, &qword_267F2BE20);

  return swift_deallocClassInstance();
}

uint64_t sub_220C5C274()
{
  return type metadata accessor for GMDownloadUtility();
}

uint64_t type metadata accessor for GMDownloadUtility()
{
  uint64_t result = qword_267F2BDE0;
  if (!qword_267F2BDE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_220C5C2C8()
{
  sub_220C5C3B8(319, &qword_267F2BDF0, &qword_267F2BDF8);
  if (v0 <= 0x3F)
  {
    sub_220C5C3B8(319, &qword_267F2BE00, &qword_267F2BE08);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_220C5C3B8(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_220C74FC0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_220C5C408()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_220C5C448(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_220C57CA8;
  return sub_220C5B5E8(a1, v4, v5, v6);
}

unint64_t sub_220C5C4FC()
{
  unint64_t result = qword_267F2BD58;
  if (!qword_267F2BD58)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267F2BD58);
  }
  return result;
}

uint64_t sub_220C5C53C(uint64_t a1)
{
  return sub_220C5ADA8(a1, v1);
}

uint64_t sub_220C5C544(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BE20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_220C5C5AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_220C5C610(uint64_t a1)
{
  return sub_220C5B03C(a1, v1);
}

uint64_t sub_220C5C618(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BE70);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = *(void *)(a1 + OBJC_IVAR____TtC24AssistantSettingsSupport16AssistantTipCell_tipsManager)
     + OBJC_IVAR____TtC24AssistantSettingsSupport11TipsManager_tipToDisplay;
  swift_beginAccess();
  sub_220C5CE20(v6, (uint64_t)v10);
  sub_220C74980();
  id v7 = objc_msgSend(self, sel_clearColor);
  v10[0] = MEMORY[0x223C71250](v7);
  sub_220C54E00(&qword_267F2BE78, &qword_267F2BE70);
  sub_220C74CA0();
  swift_release();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
}

id sub_220C5C830(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v10 = OBJC_IVAR____TtC24AssistantSettingsSupport16AssistantTipCell_tipsManager;
  uint64_t v11 = qword_267F2BA70;
  uint64_t v12 = v5;
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v13 = (void *)qword_267F2BC88;
  *(void *)&v5[v10] = qword_267F2BC88;
  id v14 = v13;

  if (a3)
  {
    uint64_t v15 = (void *)sub_220C74DD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = 0;
  }
  v19.receiver = v12;
  v19.super_class = ObjectType;
  id v16 = objc_msgSendSuper2(&v19, sel_initWithStyle_reuseIdentifier_specifier_, a1, v15, a4);

  id v17 = v16;
  if (v17) {

  }
  return v17;
}

uint64_t type metadata accessor for AssistantTipCell()
{
  return self;
}

uint64_t sub_220C5CBC4()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BE60);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  objc_msgSend(v1, sel_setSelectionStyle_, 0);
  uint64_t v11 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BE68);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F2BE70);
  uint64_t v7 = sub_220C54E00(&qword_267F2BE78, &qword_267F2BE70);
  v12[0] = v6;
  v12[1] = MEMORY[0x263F1B440];
  v12[2] = v7;
  uint64_t v13 = MEMORY[0x263F1B420];
  swift_getOpaqueTypeConformance2();
  sub_220C74B90();
  LOBYTE(v6) = sub_220C74BA0();
  unsigned __int8 v8 = sub_220C74BC0();
  sub_220C74BB0();
  sub_220C74BB0();
  if (sub_220C74BB0() != v6) {
    sub_220C74BB0();
  }
  sub_220C74BB0();
  if (sub_220C74BB0() != v8) {
    sub_220C74BB0();
  }
  uint64_t v13 = v2;
  uint64_t v14 = sub_220C54E00(&qword_267F2BE80, &qword_267F2BE60);
  __swift_allocate_boxed_opaque_existential_1(v12);
  sub_220C74B80();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  return MEMORY[0x223C714E0](v12);
}

uint64_t sub_220C5CE18()
{
  return sub_220C5C618(*(void *)(v0 + 16));
}

uint64_t sub_220C5CE20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BCC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_220C5CE88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_220C74EA0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_220C74E90();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_220C54404(a1, &qword_26AD53248);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_220C74E50();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_220C5D034(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v14 = MEMORY[0x263F8EE78];
    sub_220C60A94(0, v1, 0);
    uint64_t v2 = v14;
    uint64_t v4 = (uint64_t *)(a1 + 40);
    uint64_t v5 = MEMORY[0x263F8D310];
    do
    {
      uint64_t v7 = *(v4 - 1);
      uint64_t v6 = *v4;
      uint64_t v14 = v2;
      unint64_t v8 = *(void *)(v2 + 16);
      unint64_t v9 = *(void *)(v2 + 24);
      sub_220C749A0();
      if (v8 >= v9 >> 1)
      {
        sub_220C60A94(v9 > 1, v8 + 1, 1);
        uint64_t v2 = v14;
      }
      v4 += 2;
      uint64_t v12 = v5;
      unint64_t v13 = sub_220C61FF0();
      *(void *)&long long v11 = v7;
      *((void *)&v11 + 1) = v6;
      *(void *)(v2 + 16) = v8 + 1;
      sub_220C59AF4(&v11, v2 + 40 * v8 + 32);
      --v1;
    }
    while (v1);
  }
  return v2;
}

id GMFooterUtility.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id GMFooterUtility.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC24AssistantSettingsSupport15GMFooterUtility_downloading] = 0;
  uint64_t v1 = OBJC_IVAR____TtC24AssistantSettingsSupport15GMFooterUtility_inCompatibleEnglishVariants;
  uint64_t v2 = v0;
  uint64_t v3 = sub_220C611CC((uint64_t)&unk_26D2AA8E8);
  swift_arrayDestroy();
  *(void *)&v0[v1] = v3;

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for GMFooterUtility();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t sub_220C5D220()
{
  return sub_220C749A0();
}

void sub_220C5D294(void *a1, void *a2, int a3, char a4)
{
  objc_super v5 = v4;
  int v98 = a3;
  id v97 = a2;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53248);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v96 = (char *)&v94 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AD53290 != -1) {
    swift_once();
  }
  uint64_t v10 = (uint64_t *)(qword_26AD53210 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
  swift_beginAccess();
  uint64_t v11 = *v10;
  if (qword_267F2BA88 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_220C74920();
  __swift_project_value_buffer(v12, (uint64_t)qword_267F2D3A8);
  unint64_t v13 = sub_220C74900();
  os_log_type_t v14 = sub_220C74F60();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v94 = a1;
    uint64_t v95 = v4;
    uint64_t v16 = v15;
    uint64_t v17 = swift_slowAlloc();
    v101[0] = v17;
    *(_DWORD *)uint64_t v16 = 136315394;
    uint64_t v100 = sub_220C6043C(0xD00000000000003ALL, 0x8000000220C7F390, v101);
    sub_220C74FD0();
    *(_WORD *)(v16 + 12) = 2080;
    os_log_type_t v18 = (uint64_t *)(qword_26AD53210 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
    swift_beginAccess();
    unint64_t v19 = GMEligibilityContext.description.getter(*v18);
    uint64_t v99 = sub_220C6043C(v19, v20, v101);
    sub_220C74FD0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_220C23000, v13, v14, "%s Choosing footer for eligibility: %s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x223C72360](v17, -1, -1);
    uint64_t v21 = v16;
    a1 = v94;
    objc_super v5 = v95;
    MEMORY[0x223C72360](v21, -1, -1);
  }

  switch(v11)
  {
    case 2:
    case 6:
    case 14:
    case 19:
      type metadata accessor for GMFooterUtility();
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      id v49 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
      goto LABEL_49;
    case 3:
    case 4:
    case 10:
    case 11:
      id v29 = objc_msgSend(self, sel_currentDevice);
      objc_msgSend(v29, sel_sf_isiPad);

      type metadata accessor for GMFooterUtility();
      uint64_t v30 = swift_getObjCClassFromMetadata();
      id v31 = objc_msgSend(self, sel_bundleForClass_, v30);
      sub_220C74580();

      uint64_t v32 = (void *)sub_220C74DD0();
      swift_bridgeObjectRelease();
      objc_msgSend(a1, sel_setProperty_forKey_, v32, *MEMORY[0x263F600F8]);

      goto LABEL_55;
    case 5:
      type metadata accessor for GMFooterUtility();
      uint64_t v40 = swift_getObjCClassFromMetadata();
      id v41 = objc_msgSend(self, sel_bundleForClass_, v40);
      goto LABEL_48;
    case 7:
    case 8:
    case 9:
      type metadata accessor for GMFooterUtility();
      uint64_t v42 = swift_getObjCClassFromMetadata();
      id v43 = objc_msgSend(self, sel_bundleForClass_, v42);
      uint64_t v44 = sub_220C74580();
      uint64_t v46 = v45;

      sub_220C5EBF8(v44, v46, a1);
      goto LABEL_55;
    case 12:
      id v47 = objc_msgSend(self, sel_currentDevice);
      objc_msgSend(v47, sel_sf_isiPad);

      type metadata accessor for GMFooterUtility();
      uint64_t v48 = swift_getObjCClassFromMetadata();
      id v49 = objc_msgSend(self, sel_bundleForClass_, v48);
      goto LABEL_49;
    case 15:
      id v55 = objc_msgSend(self, sel_currentDevice);
      objc_msgSend(v55, sel_sf_isiPad);

      uint64_t v56 = sub_220C60D44();
      if (v57)
      {
        uint64_t v58 = v56;
        uint64_t v59 = v57;
        __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BE98);
        uint64_t v60 = swift_allocObject();
        *(_OWORD *)(v60 + 16) = xmmword_220C788B0;
        *(void *)(v60 + 32) = v58;
        *(void *)(v60 + 40) = v59;
      }
      else
      {
        uint64_t v60 = MEMORY[0x263F8EE78];
      }
      type metadata accessor for GMFooterUtility();
      uint64_t v84 = swift_getObjCClassFromMetadata();
      id v85 = objc_msgSend(self, sel_bundleForClass_, v84);
      sub_220C74580();

      if (*(void *)(v60 + 16))
      {
        sub_220C5D034(v60);
        sub_220C74E10();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      v86 = (void *)sub_220C74DD0();
      swift_bridgeObjectRelease();
      objc_msgSend(a1, sel_setProperty_forKey_, v86, *MEMORY[0x263F600F8]);

      swift_bridgeObjectRelease();
      goto LABEL_55;
    case 16:
      id v61 = objc_msgSend(self, sel_sharedPreferences);
      id v62 = objc_msgSend(v61, sel_languageCode);

      if (!v62) {
        goto LABEL_47;
      }
      uint64_t v63 = sub_220C74E00();
      uint64_t v65 = v64;

      if (sub_220C5E610(v63, v65, *(void *)&v5[OBJC_IVAR____TtC24AssistantSettingsSupport15GMFooterUtility_inCompatibleEnglishVariants]))
      {
        swift_bridgeObjectRelease();
        id v66 = objc_msgSend(self, sel_currentDevice);
        objc_msgSend(v66, sel_sf_isiPad);

        goto LABEL_36;
      }
      uint64_t v81 = sub_220C57EF8();
      uint64_t v83 = v87;
      swift_bridgeObjectRelease();
      if (v83) {
        goto LABEL_46;
      }
      uint64_t v88 = MEMORY[0x263F8EE78];
      goto LABEL_52;
    case 17:
      unint64_t v67 = self;
      id v68 = objc_msgSend(v67, sel_sharedPreferences);
      id v69 = objc_msgSend(v68, sel_languageCode);

      if (v69
        && (uint64_t v70 = sub_220C74E00(),
            uint64_t v72 = v71,
            v69,
            LOBYTE(v70) = sub_220C5E610(v70, v72, *(void *)&v5[OBJC_IVAR____TtC24AssistantSettingsSupport15GMFooterUtility_inCompatibleEnglishVariants]), swift_bridgeObjectRelease(), (v70 & 1) != 0))
      {
        id v73 = objc_msgSend(self, sel_currentDevice);
        objc_msgSend(v73, sel_sf_isiPad);

LABEL_36:
        type metadata accessor for GMFooterUtility();
        uint64_t v74 = swift_getObjCClassFromMetadata();
        id v75 = objc_msgSend(self, sel_bundleForClass_, v74);
        uint64_t v76 = sub_220C74580();
        uint64_t v78 = v77;

        swift_bridgeObjectRelease();
        sub_220C5EF08(v76, v78, a1);
      }
      else
      {
        id v79 = objc_msgSend(v67, sel_sharedPreferences);
        id v80 = objc_msgSend(v79, sel_languageCode);

        if (!v80)
        {
LABEL_47:
          type metadata accessor for GMFooterUtility();
          uint64_t v89 = swift_getObjCClassFromMetadata();
          id v41 = objc_msgSend(self, sel_bundleForClass_, v89);
LABEL_48:
          id v49 = v41;
LABEL_49:
          sub_220C74580();

          unint64_t v90 = (void *)sub_220C74DD0();
          swift_bridgeObjectRelease();
          objc_msgSend(a1, sel_setProperty_forKey_, v90, *MEMORY[0x263F600F8]);

          return;
        }
        sub_220C74E00();

        uint64_t v81 = sub_220C57EF8();
        uint64_t v83 = v82;
        swift_bridgeObjectRelease();
        if (v83)
        {
LABEL_46:
          __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BE98);
          uint64_t v88 = swift_allocObject();
          *(_OWORD *)(v88 + 16) = xmmword_220C788B0;
          *(void *)(v88 + 32) = v81;
          *(void *)(v88 + 40) = v83;
        }
        else
        {
          uint64_t v88 = MEMORY[0x263F8EE78];
        }
LABEL_52:
        type metadata accessor for GMFooterUtility();
        uint64_t v91 = swift_getObjCClassFromMetadata();
        id v92 = objc_msgSend(self, sel_bundleForClass_, v91);
        sub_220C74580();

        if (*(void *)(v88 + 16))
        {
          sub_220C5D034(v88);
          sub_220C74E10();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        v93 = (void *)sub_220C74DD0();
        swift_bridgeObjectRelease();
        objc_msgSend(a1, sel_setProperty_forKey_, v93, *MEMORY[0x263F600F8]);
      }
      goto LABEL_55;
    case 21:
    case 23:
    case 24:
      if (v98)
      {
        uint64_t v22 = sub_220C74EA0();
        uint64_t v23 = (uint64_t)v96;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v96, 1, 1, v22);
        uint64_t v24 = (void *)swift_allocObject();
        v24[2] = 0;
        v24[3] = 0;
        v24[4] = a1;
        v24[5] = v5;
        uint64_t v25 = v97;
        v24[6] = v97;
        id v26 = a1;
        uint64_t v27 = v5;
        id v28 = v25;
        *(void *)&v27[OBJC_IVAR____TtC24AssistantSettingsSupport15GMFooterUtility_downloading] = sub_220C5CE88(v23, (uint64_t)aUy, (uint64_t)v24);
        swift_release();
      }
      else
      {
        id v33 = objc_msgSend(self, sel_currentDevice);
        unsigned int v34 = objc_msgSend(v33, sel_sf_isiPad);

        if (v34) {
          uint64_t v35 = 0xD000000000000021;
        }
        else {
          uint64_t v35 = 0xD00000000000001CLL;
        }
        if (v34) {
          uint64_t v36 = 0x8000000220C7F280;
        }
        else {
          uint64_t v36 = 0x8000000220C7F260;
        }
        v101[0] = v35;
        v101[1] = v36;
        if (a4) {
          sub_220C74E30();
        }
        type metadata accessor for GMFooterUtility();
        uint64_t v37 = swift_getObjCClassFromMetadata();
        id v38 = objc_msgSend(self, sel_bundleForClass_, v37);
        sub_220C74580();

        uint64_t v39 = (void *)sub_220C74DD0();
        swift_bridgeObjectRelease();
        objc_msgSend(a1, sel_setProperty_forKey_, v39, *MEMORY[0x263F600F8]);

LABEL_55:
        swift_bridgeObjectRelease();
      }
      return;
    default:
      v50 = sub_220C74900();
      os_log_type_t v51 = sub_220C74F60();
      if (os_log_type_enabled(v50, v51))
      {
        uint64_t v52 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v52 = 0;
        _os_log_impl(&dword_220C23000, v50, v51, "Defaulting to empty", v52, 2u);
        MEMORY[0x223C72360](v52, -1, -1);
      }

      type metadata accessor for GMFooterUtility();
      uint64_t v53 = swift_getObjCClassFromMetadata();
      id v41 = objc_msgSend(self, sel_bundleForClass_, v53);
      goto LABEL_48;
  }
}

uint64_t sub_220C5E610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_220C751A0();
    sub_220C74E20();
    uint64_t v6 = sub_220C751C0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_220C75140() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_220C75140() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_220C5E748(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_220C74710();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a2 + 16)
    && (sub_220C61BF0((unint64_t *)&qword_26AD531D8, MEMORY[0x263F410F8]),
        uint64_t v7 = sub_220C74DA0(),
        uint64_t v8 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v9 = v7 & ~v8,
        uint64_t v10 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0))
  {
    uint64_t v17 = ~v8;
    uint64_t v18 = a2;
    uint64_t v11 = v4 + 16;
    BOOL v12 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    uint64_t v13 = *(void *)(v11 + 56);
    uint64_t v14 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      v12(v6, *(void *)(v18 + 48) + v13 * v9, v3);
      sub_220C61BF0(&qword_26AD531E0, MEMORY[0x263F410F8]);
      char v15 = sub_220C74DC0();
      (*v14)(v6, v3);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v17;
    }
    while (((*(void *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_220C5E95C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_220C746E0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a2 + 16)
    && (sub_220C61BF0(&qword_267F2BEB0, MEMORY[0x263F40FE8]),
        uint64_t v7 = sub_220C74DA0(),
        uint64_t v8 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v9 = v7 & ~v8,
        uint64_t v10 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0))
  {
    uint64_t v17 = ~v8;
    uint64_t v18 = a2;
    uint64_t v11 = v4 + 16;
    BOOL v12 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    uint64_t v13 = *(void *)(v11 + 56);
    uint64_t v14 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      v12(v6, *(void *)(v18 + 48) + v13 * v9, v3);
      sub_220C61BF0(&qword_267F2BEB8, MEMORY[0x263F40FE8]);
      char v15 = sub_220C74DC0();
      (*v14)(v6, v3);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v17;
    }
    while (((*(void *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

id sub_220C5EBF8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BEE8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GMFooterUtility();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v12 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v13 = sub_220C74580();
  uint64_t v15 = v14;

  uint64_t v32 = a1;
  uint64_t v33 = a2;
  sub_220C749A0();
  sub_220C74E30();
  sub_220C74E30();
  uint64_t v17 = v32;
  uint64_t v16 = v33;
  sub_220C749A0();
  uint64_t v18 = (void *)sub_220C74DD0();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setProperty_forKey_, v18, *MEMORY[0x263F600F8]);

  sub_220C62044();
  unint64_t v19 = (objc_class *)swift_getObjCClassFromMetadata();
  unint64_t v20 = NSStringFromClass(v19);
  if (!v20)
  {
    sub_220C74E00();
    unint64_t v20 = (NSString *)sub_220C74DD0();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(a3, sel_setProperty_forKey_, v20, *MEMORY[0x263F600C0]);

  uint64_t v32 = v17;
  uint64_t v33 = v16;
  uint64_t v30 = v13;
  uint64_t v31 = v15;
  uint64_t v21 = sub_220C746A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v10, 1, 1, v21);
  sub_220C62084();
  uint64_t v22 = sub_220C74FF0();
  uint64_t v24 = v23;
  char v26 = v25;
  sub_220C54404((uint64_t)v10, &qword_267F2BEE8);
  swift_bridgeObjectRelease();
  if (v26) {
    return (id)swift_bridgeObjectRelease();
  }
  uint64_t v32 = v22;
  uint64_t v33 = v24;
  uint64_t v30 = v17;
  uint64_t v31 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BF00);
  sub_220C620D8();
  uint64_t v27 = sub_220C74FB0();
  return objc_msgSend(a3, sel_addFooterHyperlinkWithRange_target_action_, v27, v28, v4, sel_openStorageManagement);
}

id sub_220C5EF08(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BEE8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v58 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GMFooterUtility();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v11 = self;
  id v12 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v13 = sub_220C74580();
  uint64_t v15 = v14;

  uint64_t v61 = a1;
  uint64_t v62 = a2;
  sub_220C749A0();
  sub_220C74E30();
  uint64_t v57 = v13;
  sub_220C74E30();
  uint64_t v16 = v62;
  uint64_t v56 = v61;
  id v17 = objc_msgSend(self, sel_sharedPreferences);
  id v18 = objc_msgSend(v17, sel_languageCode);

  if (!v18)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return (id)swift_bridgeObjectRelease();
  }
  id v55 = a3;
  sub_220C74E00();

  uint64_t v19 = sub_220C60D44();
  if (!v20 || (uint64_t v21 = v19, v22 = v20, v54 = sub_220C57EF8(), v24 = v23, swift_bridgeObjectRelease(), !v24))
  {
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  uint64_t v52 = v4;
  uint64_t v53 = v16;
  char v25 = sub_220C6032C(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v27 = v25[2];
  unint64_t v26 = v25[3];
  int64_t v28 = v26 >> 1;
  unint64_t v29 = v27 + 1;
  if (v26 >> 1 <= v27)
  {
    char v25 = sub_220C6032C((void *)(v26 > 1), v27 + 1, 1, v25);
    unint64_t v26 = v25[3];
    int64_t v28 = v26 >> 1;
  }
  v25[2] = v29;
  uint64_t v30 = &v25[2 * v27];
  v30[4] = v21;
  v30[5] = v22;
  if (v28 < (uint64_t)(v27 + 2)) {
    char v25 = sub_220C6032C((void *)(v26 > 1), v27 + 2, 1, v25);
  }
  uint64_t v31 = v54;
  v25[2] = v27 + 2;
  uint64_t v32 = &v25[2 * v29];
  v32[4] = v31;
  v32[5] = v24;
  sub_220C749A0();
  id v33 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_220C74580();

  if (v25[2])
  {
    sub_220C5D034((uint64_t)v25);
    sub_220C74E10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  unsigned int v34 = (void *)sub_220C74DD0();
  swift_bridgeObjectRelease();
  id v35 = v55;
  objc_msgSend(v55, sel_setProperty_forKey_, v34, *MEMORY[0x263F600F8]);

  swift_bridgeObjectRelease();
  sub_220C62044();
  uint64_t v36 = (objc_class *)swift_getObjCClassFromMetadata();
  uint64_t v37 = NSStringFromClass(v36);
  if (!v37)
  {
    sub_220C74E00();
    uint64_t v37 = (NSString *)sub_220C74DD0();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v35, sel_setProperty_forKey_, v37, *MEMORY[0x263F600C0]);

  sub_220C5D034((uint64_t)v25);
  swift_bridgeObjectRelease();
  uint64_t v38 = sub_220C74E10();
  uint64_t v40 = v39;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v61 = v38;
  uint64_t v62 = v40;
  uint64_t v59 = v57;
  uint64_t v60 = v15;
  uint64_t v41 = sub_220C746A0();
  uint64_t v42 = (uint64_t)v58;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v58, 1, 1, v41);
  sub_220C62084();
  sub_220C749A0();
  uint64_t v43 = sub_220C74FF0();
  uint64_t v45 = v44;
  char v47 = v46;
  sub_220C54404(v42, &qword_267F2BEE8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v47 & 1) == 0)
  {
    uint64_t v61 = v43;
    uint64_t v62 = v45;
    uint64_t v59 = v38;
    uint64_t v60 = v40;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BF00);
    sub_220C620D8();
    uint64_t v48 = sub_220C74FB0();
    return objc_msgSend(v35, sel_addFooterHyperlinkWithRange_target_action_, v48, v49, v52, sel_openAppleIntelligenceURL);
  }
  return (id)swift_bridgeObjectRelease();
}

uint64_t sub_220C5F4C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BED0);
  v6[6] = v7;
  v6[7] = *(void *)(v7 - 8);
  v6[8] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BDF8);
  v6[9] = v8;
  v6[10] = *(void *)(v8 - 8);
  v6[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_220C5F5E8, 0, 0);
}

uint64_t sub_220C5F5E8()
{
  if (qword_26AD53240 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_220C74920();
  v0[12] = __swift_project_value_buffer(v1, (uint64_t)qword_26AD53298);
  uint64_t v2 = sub_220C74900();
  os_log_type_t v3 = sub_220C74F30();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_220C23000, v2, v3, "#GMFooterUtility: Checking progress", v4, 2u);
    MEMORY[0x223C72360](v4, -1, -1);
  }

  v0[13] = self;
  v0[14] = sub_220C74E80();
  v0[15] = sub_220C74E70();
  uint64_t v6 = sub_220C74E50();
  return MEMORY[0x270FA2498](sub_220C5F750, v6, v5);
}

uint64_t sub_220C5F750()
{
  uint64_t v1 = *(void **)(v0 + 104);
  swift_release();
  *(void *)(v0 + 128) = objc_msgSend(v1, sel_currentDevice);
  return MEMORY[0x270FA2498](sub_220C5F7D8, 0, 0);
}

uint64_t sub_220C5F7D8()
{
  *(void *)(v0 + 136) = sub_220C74E70();
  uint64_t v2 = sub_220C74E50();
  return MEMORY[0x270FA2498](sub_220C5F864, v2, v1);
}

uint64_t sub_220C5F864()
{
  uint64_t v1 = *(void **)(v0 + 128);
  swift_release();
  *(unsigned char *)(v0 + 168) = objc_msgSend(v1, sel_sf_isiPad);

  return MEMORY[0x270FA2498](sub_220C5F8E4, 0, 0);
}

uint64_t sub_220C5F8E4()
{
  uint64_t v1 = (void *)v0[3];
  type metadata accessor for GMFooterUtility();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_220C74580();

  uint64_t v4 = (void *)sub_220C74DD0();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setProperty_forKey_, v4, *MEMORY[0x263F600F8], 0xE000000000000000);
  swift_bridgeObjectRelease();

  if (qword_267F2BA90 != -1) {
    swift_once();
  }
  sub_220C5AAE8(v0[11]);
  sub_220C74EE0();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[18] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_220C5FAFC;
  uint64_t v6 = v0[6];
  return MEMORY[0x270FA1F68](v0 + 2, 0, 0, v6);
}

uint64_t sub_220C5FAFC()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_220C5FBF8, 0, 0);
}

uint64_t sub_220C5FBF8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  *(void *)(v0 + 152) = v1;
  if (v1)
  {
    sub_220C61D2C(v1, *(void **)(v0 + 24));
    *(void *)(v0 + 160) = sub_220C74E70();
    uint64_t v3 = sub_220C74E50();
    return MEMORY[0x270FA2498](sub_220C5FDB0, v3, v2);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 56) + 8))(*(void *)(v0 + 64), *(void *)(v0 + 48));
    uint64_t v4 = sub_220C74900();
    os_log_type_t v5 = sub_220C74F30();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_220C23000, v4, v5, "#GMFooterUtility: Models Downloaded", v6, 2u);
      MEMORY[0x223C72360](v6, -1, -1);
    }
    uint64_t v8 = *(void *)(v0 + 80);
    uint64_t v7 = *(void *)(v0 + 88);
    uint64_t v9 = *(void *)(v0 + 72);
    uint64_t v10 = *(void *)(v0 + 32);

    *(void *)(v10 + OBJC_IVAR____TtC24AssistantSettingsSupport15GMFooterUtility_downloading) = 0;
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
}

uint64_t sub_220C5FDB0()
{
  uint64_t v1 = *(void **)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 24);
  swift_release();
  objc_msgSend(v1, sel_reloadSpecifier_, v2);
  return MEMORY[0x270FA2498](sub_220C5FE34, 0, 0);
}

uint64_t sub_220C5FE34()
{
  id v1 = *(id *)(v0 + 152);
  uint64_t v2 = sub_220C74900();
  os_log_type_t v3 = sub_220C74F30();
  BOOL v4 = os_log_type_enabled(v2, v3);
  os_log_type_t v5 = *(NSObject **)(v0 + 152);
  if (v4)
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    *(void *)(v6 + 4) = v5;
    *uint64_t v7 = v5;
    _os_log_impl(&dword_220C23000, v2, v3, "#GMFooter Availability progress: %@", (uint8_t *)v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53250);
    swift_arrayDestroy();
    MEMORY[0x223C72360](v7, -1, -1);
    MEMORY[0x223C72360](v6, -1, -1);
  }
  else
  {

    uint64_t v2 = v5;
  }

  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_220C5FAFC;
  uint64_t v9 = *(void *)(v0 + 48);
  return MEMORY[0x270FA1F68](v0 + 16, 0, 0, v9);
}

id GMFooterUtility.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GMFooterUtility();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_220C60048(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  BOOL v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *BOOL v4 = v2;
  v4[1] = sub_220C60124;
  return v6(a1);
}

uint64_t sub_220C60124()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *sub_220C6021C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(qword_267F2BF30);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_220C60C58(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_220C6032C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BE98);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_220C6152C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_220C6043C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_220C60510(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_220C5809C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_220C5809C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    sub_220C749A0();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_220C60510(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_220C74FE0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_220C606CC(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_220C75070();
  if (!v8)
  {
    sub_220C750C0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_220C75100();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_220C606CC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_220C60764(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_220C60944(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_220C60944(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_220C60764(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_220C608DC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_220C75060();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_220C750C0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_220C74E40();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_220C75100();
    __break(1u);
LABEL_14:
    uint64_t result = sub_220C750C0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_220C608DC(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53260);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_220C60944(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53260);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_220C75100();
  __break(1u);
  return result;
}

uint64_t sub_220C60A94(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_220C60AB4(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_220C60AB4(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BED8);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BF20);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_220C75100();
  __break(1u);
  return result;
}

char *sub_220C60C58(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    size_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    int64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_220C75100();
  __break(1u);
  return result;
}

uint64_t sub_220C60D44()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BF10);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v38 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_220C74680();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  size_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v34 - v7;
  uint64_t v9 = sub_220C746A0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v36 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v34 - v14;
  MEMORY[0x270FA5388](v13);
  id v17 = (char *)&v34 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BF18);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220C74650();
  sub_220C74690();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v39 = v9;
  uint64_t v37 = v21;
  v21(v17, v9);
  sub_220C74660();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v3 + 8);
  v22(v8, v2);
  uint64_t v23 = sub_220C74610();
  uint64_t v24 = *(void *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v20, 1, v23) == 1)
  {
    char v25 = &qword_267F2BF18;
  }
  else
  {
    uint64_t v34 = sub_220C74600();
    uint64_t v35 = v26;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v20, v23);
    sub_220C74650();
    sub_220C74690();
    uint64_t v27 = v39;
    int64_t v28 = v37;
    v37(v15, v39);
    uint64_t v20 = v38;
    sub_220C74670();
    v22(v6, v2);
    uint64_t v29 = sub_220C74640();
    uint64_t v30 = *(void *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v20, 1, v29) != 1)
    {
      sub_220C74600();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v20, v29);
      uint64_t v32 = v36;
      sub_220C74650();
      uint64_t v40 = v34;
      uint64_t v41 = v35;
      sub_220C74E30();
      sub_220C74E30();
      swift_bridgeObjectRelease();
      uint64_t v31 = sub_220C74620();
      swift_bridgeObjectRelease();
      v28(v32, v27);
      return v31;
    }
    swift_bridgeObjectRelease();
    char v25 = &qword_267F2BF10;
  }
  sub_220C54404((uint64_t)v20, v25);
  return 0;
}

uint64_t sub_220C611CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BF28);
    uint64_t v3 = sub_220C75050();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      size_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_220C751A0();
      sub_220C749A0();
      sub_220C74E20();
      uint64_t result = sub_220C751C0();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (uint64_t result = sub_220C75140(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            uint64_t result = sub_220C75140();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      void *v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t type metadata accessor for GMFooterUtility()
{
  return self;
}

uint64_t sub_220C61394()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_220C613E4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_220C57CA8;
  return sub_220C5F4C0(a1, v4, v5, v6, v7, v8);
}

uint64_t method lookup function for GMFooterUtility(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GMFooterUtility);
}

uint64_t dispatch thunk of GMFooterUtility.fetchEnglishVariants()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of GMFooterUtility.updateFooter(specifier:settings:wifiAvailable:isChinaSKU:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t sub_220C6152C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_220C75100();
  __break(1u);
  return result;
}

uint64_t sub_220C61BF0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_220C61C3C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_220C61C74(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_220C57CA8;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267F2BEC0 + dword_267F2BEC0);
  return v6(a1, v4);
}

uint64_t sub_220C61D2C(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(self, sel_localizedStringFromNumber_numberStyle_, a1, 3);
  uint64_t v3 = sub_220C74E00();
  uint64_t v5 = v4;

  type metadata accessor for GMFooterUtility();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v7 = self;
  id v8 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_220C74580();

  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BED8);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_220C788B0;
  *(void *)(v9 + 56) = MEMORY[0x263F8D310];
  *(void *)(v9 + 64) = sub_220C61FF0();
  *(void *)(v9 + 32) = v3;
  *(void *)(v9 + 40) = v5;
  sub_220C74E10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(self, sel_currentDevice, 0xE000000000000000);
  objc_msgSend(v10, sel_sf_isiPad);

  id v11 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_220C74580();

  sub_220C74E30();
  sub_220C74E30();
  swift_bridgeObjectRelease();
  sub_220C749A0();
  unint64_t v12 = (void *)sub_220C74DD0();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setProperty_forKey_, v12, *MEMORY[0x263F600F8], 0xE000000000000000);

  return swift_bridgeObjectRelease();
}

unint64_t sub_220C61FF0()
{
  unint64_t result = qword_267F2BEE0;
  if (!qword_267F2BEE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F2BEE0);
  }
  return result;
}

unint64_t sub_220C62044()
{
  unint64_t result = qword_267F2BEF0;
  if (!qword_267F2BEF0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267F2BEF0);
  }
  return result;
}

unint64_t sub_220C62084()
{
  unint64_t result = qword_267F2BEF8;
  if (!qword_267F2BEF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F2BEF8);
  }
  return result;
}

unint64_t sub_220C620D8()
{
  unint64_t result = qword_267F2BF08;
  if (!qword_267F2BF08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F2BF00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F2BF08);
  }
  return result;
}

uint64_t sub_220C62134@<X0>(uint64_t a1@<X8>)
{
  return sub_220C622EC(&OBJC_IVAR____TtC24AssistantSettingsSupport22GMAvailabilityProvider_provider, a1);
}

uint64_t sub_220C62140@<X0>(void *a1@<X0>, void *a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v4 = *a1 + *a2;
  swift_beginAccess();
  uint64_t v5 = sub_220C74800();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a3, v4, v5);
}

uint64_t sub_220C621C4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = sub_220C74800();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  uint64_t v12 = *a2 + *a5;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 40))(v12, v11, v8);
  return swift_endAccess();
}

uint64_t sub_220C622E0@<X0>(uint64_t a1@<X8>)
{
  return sub_220C622EC(&OBJC_IVAR____TtC24AssistantSettingsSupport22GMAvailabilityProvider_diffusionModelProvider, a1);
}

uint64_t sub_220C622EC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *a1;
  swift_beginAccess();
  uint64_t v5 = sub_220C74800();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, v4, v5);
}

id GMAvailabilityProvider.__allocating_init(provider:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return GMAvailabilityProvider.init(provider:)(a1);
}

id GMAvailabilityProvider.init(provider:)(uint64_t a1)
{
  uint64_t v2 = sub_220C74780();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53208);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_220C74800();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v23 - v14;
  uint64_t v23 = a1;
  sub_220C626BC(a1, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    uint64_t v16 = v24;
    sub_220C74770();
    sub_220C747F0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_220C62724((uint64_t)v8);
    BOOL v17 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  }
  else
  {
    BOOL v17 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v17(v15, v8, v9);
    uint64_t v18 = v24;
  }
  uint64_t v19 = v24;
  v17(&v24[OBJC_IVAR____TtC24AssistantSettingsSupport22GMAvailabilityProvider_provider], v15, v9);
  sub_220C74770();
  sub_220C747F0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v17(&v19[OBJC_IVAR____TtC24AssistantSettingsSupport22GMAvailabilityProvider_diffusionModelProvider], v13, v9);

  uint64_t v20 = (objc_class *)type metadata accessor for GMAvailabilityProvider();
  v25.receiver = v19;
  v25.super_class = v20;
  id v21 = objc_msgSendSuper2(&v25, sel_init);
  sub_220C62724(v23);
  return v21;
}

uint64_t sub_220C626BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53208);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_220C62724(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53208);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for GMAvailabilityProvider()
{
  uint64_t result = qword_26AD53230;
  if (!qword_26AD53230) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_220C627D0()
{
  return MEMORY[0x270FA2498](sub_220C627EC, 0, 0);
}

uint64_t sub_220C627EC()
{
  uint64_t v1 = self;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_220C628F4;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_220C62A4C;
  v0[13] = &block_descriptor;
  v0[14] = v2;
  objc_msgSend(v1, sel_currentAvailabilityWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_220C628F4()
{
  return MEMORY[0x270FA2498](sub_220C629D4, 0, 0);
}

uint64_t sub_220C629D4()
{
  uint64_t v1 = *(void **)(v0 + 120);
  id v2 = objc_msgSend(v1, sel_status);

  uint64_t v3 = *(uint64_t (**)(id))(v0 + 8);
  return v3(v2);
}

uint64_t sub_220C62A4C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  **(void **)(*(void *)(v2 + 64) + 40) = a2;
  id v3 = a2;

  return MEMORY[0x270FA2400](v2);
}

uint64_t sub_220C62AA0()
{
  return MEMORY[0x270FA2498](sub_220C62ABC, 0, 0);
}

uint64_t sub_220C62ABC()
{
  uint64_t v1 = self;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_220C62BC4;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_220C62A4C;
  v0[13] = &block_descriptor_1;
  v0[14] = v2;
  objc_msgSend(v1, sel_currentAvailabilityWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_220C62BC4()
{
  return MEMORY[0x270FA2498](sub_220C62CA4, 0, 0);
}

uint64_t sub_220C62CA4()
{
  uint64_t v1 = *(void **)(v0 + 120);
  id v2 = objc_msgSend(v1, sel_unavailabiltyReasons);

  id v3 = *(uint64_t (**)(id))(v0 + 8);
  return v3(v2);
}

uint64_t sub_220C62D1C()
{
  uint64_t v1 = sub_220C74800();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = v0 + OBJC_IVAR____TtC24AssistantSettingsSupport22GMAvailabilityProvider_provider;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  sub_220C74790();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

id GMAvailabilityProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void GMAvailabilityProvider.init()()
{
}

id GMAvailabilityProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GMAvailabilityProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_220C62FA8()
{
  return MEMORY[0x270FA2498](sub_220C62FC4, 0, 0);
}

uint64_t sub_220C62FC4()
{
  id v1 = self;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_220C628F4;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_220C62A4C;
  v0[13] = &block_descriptor_14;
  v0[14] = v2;
  objc_msgSend(v1, sel_currentAvailabilityWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_220C630CC()
{
  return MEMORY[0x270FA2498](sub_220C630E8, 0, 0);
}

uint64_t sub_220C630E8()
{
  id v1 = self;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_220C62BC4;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_220C62A4C;
  v0[13] = &block_descriptor_13;
  v0[14] = v2;
  objc_msgSend(v1, sel_currentAvailabilityWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_220C631F0()
{
  uint64_t v1 = sub_220C74800();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0 + OBJC_IVAR____TtC24AssistantSettingsSupport22GMAvailabilityProvider_provider;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  sub_220C74790();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_220C63308@<X0>(uint64_t a1@<X8>)
{
  return sub_220C63320(&OBJC_IVAR____TtC24AssistantSettingsSupport22GMAvailabilityProvider_provider, a1);
}

uint64_t sub_220C63314@<X0>(uint64_t a1@<X8>)
{
  return sub_220C63320(&OBJC_IVAR____TtC24AssistantSettingsSupport22GMAvailabilityProvider_diffusionModelProvider, a1);
}

uint64_t sub_220C63320@<X0>(void *a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = *v2 + *a1;
  swift_beginAccess();
  uint64_t v5 = sub_220C74800();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_220C633A4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_220C62140(a1, &OBJC_IVAR____TtC24AssistantSettingsSupport22GMAvailabilityProvider_provider, a2);
}

uint64_t sub_220C633C4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_220C621C4(a1, a2, a3, a4, &OBJC_IVAR____TtC24AssistantSettingsSupport22GMAvailabilityProvider_provider);
}

uint64_t sub_220C633E4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_220C62140(a1, &OBJC_IVAR____TtC24AssistantSettingsSupport22GMAvailabilityProvider_diffusionModelProvider, a2);
}

uint64_t sub_220C63404(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_220C621C4(a1, a2, a3, a4, &OBJC_IVAR____TtC24AssistantSettingsSupport22GMAvailabilityProvider_diffusionModelProvider);
}

uint64_t dispatch thunk of GMAvailabilityProviding.availabilityStatus()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 8) + **(int **)(a2 + 8));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_220C63AA4;
  return v7(a1, a2);
}

uint64_t dispatch thunk of GMAvailabilityProviding.unavailabilityReason()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 16) + **(int **)(a2 + 16));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_220C63AA4;
  return v7(a1, a2);
}

uint64_t dispatch thunk of GMAvailabilityProviding.availability()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of GMAvailabilityProviding.provider.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of GMAvailabilityProviding.diffusionModelProvider.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_220C63640()
{
  return type metadata accessor for GMAvailabilityProvider();
}

uint64_t sub_220C63648()
{
  uint64_t result = sub_220C74800();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for GMAvailabilityProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GMAvailabilityProvider);
}

uint64_t dispatch thunk of GMAvailabilityProvider.provider.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of GMAvailabilityProvider.diffusionModelProvider.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of GMAvailabilityProvider.__allocating_init(provider:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of GMAvailabilityProvider.availabilityStatus()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x98);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_220C63870;
  return v5();
}

uint64_t sub_220C63870(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of GMAvailabilityProvider.unavailabilityReason()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0xA0);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_220C63AA4;
  return v5();
}

uint64_t dispatch thunk of GMAvailabilityProvider.availability()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t sub_220C63AA8()
{
  *(void *)(v1 + 160) = v0;
  return MEMORY[0x270FA2498](sub_220C63AC8, 0, 0);
}

uint64_t sub_220C63AC8()
{
  uint64_t v1 = self;
  uint64_t v2 = sub_220C74DD0();
  v0[21] = v2;
  v0[2] = v0;
  v0[7] = v0 + 18;
  v0[3] = sub_220C63C00;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_220C63FC8;
  v0[13] = &block_descriptor_0;
  v0[14] = v3;
  objc_msgSend(v1, sel_getTicketForFeature_completionHandler_, v2, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_220C63C00()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 176) = v1;
  if (v1) {
    uint64_t v2 = sub_220C63D84;
  }
  else {
    uint64_t v2 = sub_220C63D10;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_220C63D10()
{
  uint64_t v1 = *(void **)(v0 + 144);

  uint64_t v2 = sub_220C74870();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_220C63D84()
{
  uint64_t v19 = v0;
  uint64_t v1 = (void *)v0[21];
  swift_willThrow();

  if (qword_26AD53240 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)v0[22];
  uint64_t v3 = sub_220C74920();
  __swift_project_value_buffer(v3, (uint64_t)qword_26AD53298);
  id v4 = v2;
  id v5 = v2;
  uint64_t v6 = sub_220C74900();
  os_log_type_t v7 = sub_220C74F50();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = (void *)v0[22];
  if (v8)
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v18 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    swift_getErrorValue();
    uint64_t v12 = sub_220C75190();
    v0[10] = sub_220C6043C(v12, v13, &v18);
    sub_220C74FD0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_220C23000, v6, v7, "#gmenrollment Error trying to enroll into queue %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C72360](v11, -1, -1);
    MEMORY[0x223C72360](v10, -1, -1);
  }
  else
  {
  }
  uint64_t v14 = (void *)v0[22];
  sub_220C74860();
  uint64_t v15 = sub_220C74820();

  uint64_t v16 = (uint64_t (*)(uint64_t))v0[1];
  return v16(v15);
}

uint64_t sub_220C63FCC()
{
  *(void *)(v1 + 160) = v0;
  return MEMORY[0x270FA2498](sub_220C63FEC, 0, 0);
}

uint64_t sub_220C63FEC()
{
  uint64_t v1 = self;
  uint64_t v2 = sub_220C74DD0();
  v0[21] = v2;
  v0[2] = v0;
  v0[7] = v0 + 18;
  v0[3] = sub_220C64124;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_220C63FC8;
  v0[13] = &block_descriptor_1_0;
  v0[14] = v3;
  objc_msgSend(v1, sel_getTicketStatusForFeature_completionHandler_, v2, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_220C64124()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 176) = v1;
  if (v1) {
    uint64_t v2 = sub_220C6429C;
  }
  else {
    uint64_t v2 = sub_220C64234;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_220C64234()
{
  uint64_t v1 = *(void *)(v0 + 144);

  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_220C6429C()
{
  uint64_t v19 = v0;
  uint64_t v1 = (void *)v0[21];
  swift_willThrow();

  if (qword_26AD53240 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)v0[22];
  uint64_t v3 = sub_220C74920();
  __swift_project_value_buffer(v3, (uint64_t)qword_26AD53298);
  id v4 = v2;
  id v5 = v2;
  uint64_t v6 = sub_220C74900();
  os_log_type_t v7 = sub_220C74F50();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = (void *)v0[22];
  if (v8)
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v18 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    swift_getErrorValue();
    uint64_t v12 = sub_220C75190();
    v0[10] = sub_220C6043C(v12, v13, &v18);
    sub_220C74FD0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_220C23000, v6, v7, "#gmenrollment Error trying to get ticket status %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C72360](v11, -1, -1);
    MEMORY[0x223C72360](v10, -1, -1);
  }
  else
  {
  }
  uint64_t v14 = (void *)v0[22];
  sub_220C74860();
  uint64_t v15 = sub_220C74820();

  uint64_t v16 = (uint64_t (*)(uint64_t))v0[1];
  return v16(v15);
}

uint64_t sub_220C644E0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BFC0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return MEMORY[0x270FA2408](a1);
  }
}

id GMEnrollmentProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id GMEnrollmentProvider.init()()
{
  id v1 = &v0[OBJC_IVAR____TtC24AssistantSettingsSupport20GMEnrollmentProvider_featureName];
  *(void *)id v1 = 0x6C6C2E64756F6C63;
  *((void *)v1 + 1) = 0xE90000000000006DLL;
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for GMEnrollmentProvider();
  return objc_msgSendSuper2(&v3, sel_init);
}

id GMEnrollmentProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GMEnrollmentProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_220C646E0()
{
  uint64_t v2 = *v0;
  objc_super v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *objc_super v3 = v1;
  v3[1] = sub_220C63AA4;
  v3[20] = v2;
  return MEMORY[0x270FA2498](sub_220C63AC8, 0, 0);
}

uint64_t sub_220C6478C()
{
  uint64_t v2 = *v0;
  objc_super v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *objc_super v3 = v1;
  v3[1] = sub_220C63AA4;
  v3[20] = v2;
  return MEMORY[0x270FA2498](sub_220C63FEC, 0, 0);
}

uint64_t type metadata accessor for GMEnrollmentProvider()
{
  return self;
}

uint64_t dispatch thunk of GMEnrollmentProviding.enroll()(uint64_t a1, uint64_t a2)
{
  id v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 8) + **(int **)(a2 + 8));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_220C63AA4;
  return v7(a1, a2);
}

uint64_t dispatch thunk of GMEnrollmentProviding.status()(uint64_t a1, uint64_t a2)
{
  id v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 16) + **(int **)(a2 + 16));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_220C63AA4;
  return v7(a1, a2);
}

uint64_t method lookup function for GMEnrollmentProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GMEnrollmentProvider);
}

uint64_t dispatch thunk of GMEnrollmentProvider.enroll()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x58);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  objc_super v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *objc_super v3 = v1;
  v3[1] = sub_220C63870;
  return v5();
}

uint64_t dispatch thunk of GMEnrollmentProvider.status()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x60);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  objc_super v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *objc_super v3 = v1;
  v3[1] = sub_220C63AA4;
  return v5();
}

uint64_t sub_220C64C5C()
{
  uint64_t v1 = sub_220C74730();
  uint64_t v19 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  objc_super v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_220C74710();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_220C74720();
  uint64_t v9 = *MEMORY[0x263F41050];
  BOOL v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v17(v7, v9, v4);
  char v10 = sub_220C5E748((uint64_t)v7, v8);
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void (**)(char *, uint64_t))(v5 + 8);
  v11(v7, v4);
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  uint64_t v18 = v1;
  v12(v3, v0, v1);
  if (v10)
  {
    char v13 = 1;
  }
  else
  {
    uint64_t v14 = sub_220C74720();
    v17(v7, *MEMORY[0x263F410A8], v4);
    char v13 = sub_220C5E748((uint64_t)v7, v14);
    swift_bridgeObjectRelease();
    v11(v7, v4);
  }
  (*(void (**)(char *, uint64_t))(v19 + 8))(v3, v18);
  return v13 & 1;
}

unint64_t GMEligibilityContext.init(rawValue:)(unint64_t a1)
{
  return sub_220C65FE0(a1);
}

unint64_t sub_220C64EBC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_220C65FE0(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

unint64_t GMEligibilityContext.description.getter(uint64_t a1)
{
  unint64_t result = 0x6E776F6E6B6E75;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      unint64_t result = 0x6E6564646968;
      break;
    case 2:
      unint64_t result = 0xD000000000000019;
      break;
    case 3:
      unint64_t result = 0xD000000000000013;
      break;
    case 4:
      unint64_t result = 0x6465756575716E65;
      break;
    case 5:
      unint64_t result = 0x6E45657669746361;
      break;
    case 6:
      unint64_t result = 0x646574696D696CLL;
      break;
    case 7:
      unint64_t result = 0xD000000000000019;
      break;
    case 8:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 9:
      unint64_t result = 0xD000000000000017;
      break;
    case 10:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 11:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 12:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 13:
    case 18:
    case 21:
      unint64_t result = 0xD000000000000010;
      break;
    case 14:
      unint64_t result = 0xD000000000000019;
      break;
    case 15:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 16:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 17:
      unint64_t result = 0xD000000000000030;
      break;
    case 19:
      unint64_t result = 0x5049646572616873;
      break;
    case 20:
      unint64_t result = 0x646574704F746F6ELL;
      break;
    case 22:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 23:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 24:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      sub_220C75150();
      __break(1u);
      JUMPOUT(0x220C651D4);
  }
  return result;
}

unint64_t sub_220C65238()
{
  return GMEligibilityContext.description.getter(*v0);
}

uint64_t sub_220C65240(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_220C74730();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AD53240 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_220C74920();
  __swift_project_value_buffer(v8, (uint64_t)qword_26AD53298);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  id v9 = a2;
  char v10 = sub_220C74900();
  os_log_type_t v11 = sub_220C74F40();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    uint64_t v41 = v39;
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v38 = v12 + 4;
    sub_220C74720();
    sub_220C74710();
    sub_220C66058();
    uint64_t v13 = sub_220C74F20();
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    uint64_t v40 = sub_220C6043C(v13, v15, &v41);
    sub_220C74FD0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v16 = sub_220C74850();
    uint64_t v40 = sub_220C6043C(v16, v17, &v41);
    sub_220C74FD0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_220C23000, v10, v11, "Getting context for Unavailability: %s TicketStatus: %s", (uint8_t *)v12, 0x16u);
    uint64_t v18 = v39;
    swift_arrayDestroy();
    MEMORY[0x223C72360](v18, -1, -1);
    MEMORY[0x223C72360](v12, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v19 = sub_220C74850();
  uint64_t v21 = v20;
  sub_220C74860();
  uint64_t v22 = (void *)sub_220C74820();
  uint64_t v23 = sub_220C74850();
  uint64_t v25 = v24;

  if (v23 == v19 && v25 == v21)
  {
    swift_bridgeObjectRelease_n();
    return 3;
  }
  else
  {
    char v27 = sub_220C75140();
    swift_bridgeObjectRelease();
    if (v27)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      int64_t v28 = (void *)sub_220C74840();
      uint64_t v29 = sub_220C74850();
      uint64_t v31 = v30;

      if (v29 == v19 && v31 == v21)
      {
        swift_bridgeObjectRelease_n();
        return 4;
      }
      else
      {
        char v32 = sub_220C75140();
        swift_bridgeObjectRelease();
        if (v32)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          id v33 = (void *)sub_220C74830();
          uint64_t v34 = sub_220C74850();
          uint64_t v36 = v35;

          if (v34 == v19 && v36 == v21)
          {
            swift_bridgeObjectRelease_n();
            return 5;
          }
          else
          {
            char v37 = sub_220C75140();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v37) {
              return 5;
            }
            else {
              return 3;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_220C656C8(uint64_t a1)
{
  uint64_t v2 = sub_220C74710();
  uint64_t v65 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_220C74730();
  uint64_t v68 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v62 = (char *)v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v63 = (char *)v58 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v58 - v11;
  MEMORY[0x270FA5388](v10);
  unint64_t v14 = (char *)v58 - v13;
  if (qword_26AD53240 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_220C74920();
  __swift_project_value_buffer(v15, (uint64_t)qword_26AD53298);
  id v66 = *(void (**)(char *, uint64_t, uint64_t))(v68 + 16);
  uint64_t v67 = v68 + 16;
  v66(v14, a1, v5);
  uint64_t v16 = sub_220C74900();
  os_log_type_t v17 = sub_220C74F40();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v64 = v2;
  if (v18)
  {
    os_log_t v61 = v16;
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v60 = swift_slowAlloc();
    uint64_t v70 = v60;
    *(_DWORD *)uint64_t v19 = 136315138;
    v58[1] = v19 + 4;
    uint64_t v59 = v19;
    sub_220C74720();
    sub_220C66058();
    uint64_t v20 = v5;
    uint64_t v21 = a1;
    uint64_t v22 = v4;
    uint64_t v23 = sub_220C74F20();
    unint64_t v25 = v24;
    swift_bridgeObjectRelease();
    uint64_t v26 = v23;
    uint64_t v4 = v22;
    a1 = v21;
    uint64_t v5 = v20;
    uint64_t v27 = v68;
    uint64_t v69 = sub_220C6043C(v26, v25, &v70);
    sub_220C74FD0();
    swift_bridgeObjectRelease();
    int64_t v28 = *(void (**)(char *, uint64_t))(v27 + 8);
    v28(v14, v20);
    uint64_t v16 = v61;
    os_log_type_t v29 = v17;
    uint64_t v30 = v59;
    _os_log_impl(&dword_220C23000, v61, v29, "Getting context for Unavailability: %s", v59, 0xCu);
    uint64_t v31 = v60;
    swift_arrayDestroy();
    MEMORY[0x223C72360](v31, -1, -1);
    MEMORY[0x223C72360](v30, -1, -1);
  }
  else
  {
    int64_t v28 = *(void (**)(char *, uint64_t))(v68 + 8);
    v28(v14, v5);
  }

  char v32 = sub_220C64C5C();
  v66(v12, a1, v5);
  id v33 = v63;
  if (v32)
  {
    uint64_t v34 = sub_220C74720();
    uint64_t v36 = v64;
    uint64_t v35 = v65;
    (*(void (**)(char *, void, uint64_t))(v65 + 104))(v4, *MEMORY[0x263F41048], v64);
    char v37 = sub_220C5E748((uint64_t)v4, v34);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v4, v36);
    v28(v12, v5);
    if (v37)
    {
      sub_220C748D0();
      BOOL v38 = (sub_220C748C0() & 1) == 0;
      uint64_t v39 = 7;
      uint64_t v40 = 9;
      goto LABEL_24;
    }
  }
  else
  {
    v28(v12, v5);
    uint64_t v36 = v64;
  }
  char v41 = sub_220C64C5C();
  v66(v33, a1, v5);
  if (v41)
  {
    uint64_t v42 = sub_220C74720();
    uint64_t v43 = v65;
    (*(void (**)(char *, void, uint64_t))(v65 + 104))(v4, *MEMORY[0x263F41030], v36);
    char v44 = sub_220C5E748((uint64_t)v4, v42);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v4, v36);
    v28(v33, v5);
    if (v44)
    {
      sub_220C748D0();
      BOOL v38 = (sub_220C748C0() & 1) == 0;
      uint64_t v39 = 21;
LABEL_23:
      uint64_t v40 = 12;
LABEL_24:
      if (v38) {
        return v39;
      }
      else {
        return v40;
      }
    }
  }
  else
  {
    v28(v33, v5);
  }
  char v45 = sub_220C64C5C();
  char v46 = v62;
  v66(v62, a1, v5);
  if (v45)
  {
    uint64_t v47 = sub_220C74720();
    uint64_t v48 = v65;
    (*(void (**)(char *, void, uint64_t))(v65 + 104))(v4, *MEMORY[0x263F41030], v36);
    char v49 = sub_220C5E748((uint64_t)v4, v47);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v4, v36);
    v28(v46, v5);
    if ((v49 & 1) == 0) {
      return 24;
    }
  }
  else
  {
    v28(v46, v5);
  }
  uint64_t v51 = sub_220C74720();
  uint64_t v52 = v65;
  uint64_t v53 = *(void (**)(char *, void, uint64_t))(v65 + 104);
  v53(v4, *MEMORY[0x263F41060], v36);
  char v54 = sub_220C5E748((uint64_t)v4, v51);
  swift_bridgeObjectRelease();
  id v55 = *(void (**)(char *, uint64_t))(v52 + 8);
  v55(v4, v36);
  if ((v54 & 1) == 0)
  {
    uint64_t v56 = sub_220C74720();
    v53(v4, *MEMORY[0x263F41030], v36);
    char v57 = sub_220C5E748((uint64_t)v4, v56);
    swift_bridgeObjectRelease();
    v55(v4, v36);
    BOOL v38 = (v57 & 1) == 0;
    uint64_t v39 = 5;
    goto LABEL_23;
  }
  sub_220C748D0();
  if (sub_220C748C0()) {
    return 11;
  }
  else {
    return 10;
  }
}

uint64_t sub_220C65E24()
{
  uint64_t v0 = sub_220C74850();
  uint64_t v2 = v1;
  sub_220C74860();
  uint64_t v3 = (void *)sub_220C74830();
  uint64_t v4 = sub_220C74850();
  uint64_t v6 = v5;

  if (v4 == v0 && v6 == v2)
  {
    swift_bridgeObjectRelease_n();
    return 5;
  }
  else
  {
    char v8 = sub_220C75140();
    swift_bridgeObjectRelease();
    if (v8)
    {
      swift_bridgeObjectRelease();
      return 5;
    }
    else
    {
      uint64_t v9 = (void *)sub_220C74840();
      uint64_t v10 = sub_220C74850();
      uint64_t v12 = v11;

      if (v10 == v0 && v12 == v2)
      {
        swift_bridgeObjectRelease_n();
        return 4;
      }
      else
      {
        char v13 = sub_220C75140();
        swift_bridgeObjectRelease();
        if (v13)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          unint64_t v14 = (void *)sub_220C74820();
          uint64_t v15 = sub_220C74850();
          uint64_t v17 = v16;

          if (v15 == v0 && v17 == v2)
          {
            swift_bridgeObjectRelease_n();
            return 3;
          }
          else
          {
            char v18 = sub_220C75140();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v18) {
              return 3;
            }
            else {
              return 0;
            }
          }
        }
      }
    }
  }
}

unint64_t sub_220C65FE0(unint64_t result)
{
  if (result > 0x18) {
    return 0;
  }
  return result;
}

unint64_t sub_220C65FF4()
{
  unint64_t result = qword_267F2BFC8;
  if (!qword_267F2BFC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F2BFC8);
  }
  return result;
}

ValueMetadata *type metadata accessor for GMEligibilityContext()
{
  return &type metadata for GMEligibilityContext;
}

unint64_t sub_220C66058()
{
  unint64_t result = qword_26AD531D8;
  if (!qword_26AD531D8)
  {
    sub_220C74710();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD531D8);
  }
  return result;
}

uint64_t sub_220C6610C()
{
  uint64_t v1 = v0 + OBJC_IVAR___GMSpecifierController_delegate;
  swift_beginAccess();
  return MEMORY[0x223C72420](v1);
}

uint64_t sub_220C661AC()
{
  return swift_unknownObjectRelease();
}

void (*sub_220C66208(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___GMSpecifierController_delegate;
  v3[4] = v1;
  void v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x223C72420](v5);
  return sub_220C6628C;
}

void sub_220C6628C(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }

  free(v3);
}

id GMSpecifierController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id GMSpecifierController.init()()
{
  uint64_t v1 = sub_220C74760();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53208);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR___GMSpecifierController_availabilityNotifications] = 0;
  uint64_t v8 = sub_220C74800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = (objc_class *)type metadata accessor for GMAvailabilityProvider();
  objc_allocWithZone(v9);
  uint64_t v10 = v0;
  id v11 = GMAvailabilityProvider.init(provider:)((uint64_t)v7);
  uint64_t v12 = &v10[OBJC_IVAR___GMSpecifierController_availabilityProvider];
  *((void *)v12 + 3) = v9;
  *((void *)v12 + 4) = &protocol witness table for GMAvailabilityProvider;
  *(void *)uint64_t v12 = v11;
  __swift_project_boxed_opaque_existential_1(v12, (uint64_t)v9);
  off_26D2AAD38[0]();
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(&v10[OBJC_IVAR___GMSpecifierController_availability], v4, v1);
  char v13 = (objc_class *)type metadata accessor for GMOptInStatusProvider();
  id v14 = objc_msgSend(objc_allocWithZone(v13), sel_init);
  uint64_t v15 = &v10[OBJC_IVAR___GMSpecifierController_optInStatusProvider];
  *((void *)v15 + 3) = v13;
  *((void *)v15 + 4) = &protocol witness table for GMOptInStatusProvider;
  *(void *)uint64_t v15 = v14;
  uint64_t v16 = (objc_class *)type metadata accessor for GMEnrollmentProvider();
  id v17 = objc_msgSend(objc_allocWithZone(v16), sel_init);
  char v18 = &v10[OBJC_IVAR___GMSpecifierController_enrollmentProvider];
  *((void *)v18 + 3) = v16;
  *((void *)v18 + 4) = &protocol witness table for GMEnrollmentProvider;
  *(void *)char v18 = v17;
  *(void *)&v10[OBJC_IVAR___GMSpecifierController_analytics] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for GMAnalyticsProvider()), sel_init);

  uint64_t v19 = (objc_class *)type metadata accessor for GMSpecifierController();
  v22.receiver = v10;
  v22.super_class = v19;
  id v20 = objc_msgSendSuper2(&v22, sel_init);
  sub_220C6AE80();
  sub_220C6BB7C();

  return v20;
}

uint64_t type metadata accessor for GMSpecifierController()
{
  uint64_t result = qword_26AD53220;
  if (!qword_26AD53220) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id GMSpecifierController.__allocating_init(availabilityProvider:optInStatus:enrollmentProvider:analytics:)(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v9 = objc_allocWithZone(v4);
  id v10 = sub_220C6D810(a1, a2, a3, a4);

  return v10;
}

id GMSpecifierController.init(availabilityProvider:optInStatus:enrollmentProvider:analytics:)(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = sub_220C6D810(a1, a2, a3, a4);

  return v5;
}

uint64_t sub_220C6671C()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_220C6673C, 0, 0);
}

uint64_t sub_220C6673C()
{
  uint64_t v1 = (void *)(*(void *)(v0 + 16) + OBJC_IVAR___GMSpecifierController_enrollmentProvider);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 8) + **(int **)(v3 + 8));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_220C66848;
  return v6(v2, v3);
}

uint64_t sub_220C66848(uint64_t a1)
{
  *(void *)(*(void *)v1 + 32) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_220C66948, 0, 0);
}

uint64_t sub_220C66948()
{
  uint64_t v1 = *(void **)(v0 + 32);
  uint64_t v2 = sub_220C65E24();

  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_220C66B20(const void *a1, void *a2)
{
  *(void *)(v2 + 16) = a2;
  *(void *)(v2 + 24) = _Block_copy(a1);
  id v4 = a2;
  return MEMORY[0x270FA2498](sub_220C66B98, 0, 0);
}

uint64_t sub_220C66B98()
{
  uint64_t v1 = (void *)(*(void *)(v0 + 16) + OBJC_IVAR___GMSpecifierController_enrollmentProvider);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 8) + **(int **)(v3 + 8));
  id v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v4;
  *id v4 = v0;
  v4[1] = sub_220C66CA4;
  return v6(v2, v3);
}

uint64_t sub_220C66CA4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 40) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_220C66DA4, 0, 0);
}

uint64_t sub_220C66DA4()
{
  uint64_t v1 = (void *)v0[5];
  uint64_t v3 = (void *)v0[2];
  uint64_t v2 = (void (**)(void, void))v0[3];
  uint64_t v4 = sub_220C65E24();

  v2[2](v2, v4);
  _Block_release(v2);
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_220C66E3C(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 32) = a1;
  return MEMORY[0x270FA2498](sub_220C66E60, 0, 0);
}

uint64_t sub_220C66E60()
{
  if (*(unsigned char *)(v0 + 32) == 1) {
    sub_220C69EB4();
  }
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  void *v1 = v0;
  v1[1] = sub_220C66F04;
  return sub_220C673E4();
}

uint64_t sub_220C66F04(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_220C67178(char a1, void *aBlock, void *a3)
{
  *(void *)(v3 + 16) = a3;
  *(unsigned char *)(v3 + 40) = a1;
  *(void *)(v3 + 24) = _Block_copy(aBlock);
  id v5 = a3;
  return MEMORY[0x270FA2498](sub_220C671F8, 0, 0);
}

uint64_t sub_220C671F8()
{
  if (*(unsigned char *)(v0 + 40) == 1) {
    sub_220C69EB4();
  }
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  void *v1 = v0;
  v1[1] = sub_220C6729C;
  return sub_220C673E4();
}

uint64_t sub_220C6729C(uint64_t a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 24);
  uint64_t v4 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  v3[2](v3, a1);
  _Block_release(v3);
  id v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

uint64_t sub_220C673E4()
{
  v1[10] = v0;
  uint64_t v2 = sub_220C74700();
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  uint64_t v3 = sub_220C74730();
  v1[15] = v3;
  v1[16] = *(void *)(v3 - 8);
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  uint64_t v4 = sub_220C74760();
  v1[19] = v4;
  v1[20] = *(void *)(v4 - 8);
  v1[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_220C6757C, 0, 0);
}

uint64_t sub_220C6757C()
{
  uint64_t v65 = v0;
  uint64_t v2 = v0[20];
  uint64_t v1 = v0[21];
  uint64_t v3 = v0[19];
  uint64_t v4 = v0[10] + OBJC_IVAR___GMSpecifierController_availability;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  if (v5 == *MEMORY[0x263F40F98])
  {
    uint64_t v6 = v0[21];
    uint64_t v7 = v0[14];
    uint64_t v9 = v0[11];
    uint64_t v8 = v0[12];
    (*(void (**)(uint64_t, void))(v0[20] + 96))(v6, v0[19]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v7, v6, v9);
    if (qword_26AD53240 != -1) {
      swift_once();
    }
    uint64_t v11 = v0[13];
    uint64_t v10 = v0[14];
    uint64_t v13 = v0[11];
    uint64_t v12 = v0[12];
    uint64_t v14 = sub_220C74920();
    __swift_project_value_buffer(v14, (uint64_t)qword_26AD53298);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v10, v13);
    uint64_t v15 = sub_220C74900();
    os_log_type_t v16 = sub_220C74F40();
    BOOL v17 = os_log_type_enabled(v15, v16);
    uint64_t v19 = v0[12];
    uint64_t v18 = v0[13];
    uint64_t v20 = v0[11];
    if (v17)
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t type = swift_slowAlloc();
      uint64_t v64 = type;
      *(_DWORD *)uint64_t v21 = 136315394;
      v0[6] = sub_220C6043C(0x6174536863746566, 0xED00002928737574, &v64);
      sub_220C74FD0();
      *(_WORD *)(v21 + 12) = 2080;
      sub_220C6EBF0(&qword_267F2C020, MEMORY[0x263F41000]);
      uint64_t v22 = sub_220C75120();
      v0[7] = sub_220C6043C(v22, v23, &v64);
      sub_220C74FD0();
      swift_bridgeObjectRelease();
      uint64_t v26 = *(void (**)(void, void))(v19 + 8);
      uint64_t v25 = v19 + 8;
      unint64_t v24 = v26;
      v26(v18, v20);
      _os_log_impl(&dword_220C23000, v15, v16, "%s Availability Provider says GM is restricted: %s", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x223C72360](type, -1, -1);
      MEMORY[0x223C72360](v21, -1, -1);
    }
    else
    {
      uint64_t v48 = *(void (**)(void, void))(v19 + 8);
      uint64_t v25 = v19 + 8;
      unint64_t v24 = v48;
      v48(v0[13], v0[11]);
    }

    v0[26] = v25;
    v0[27] = v24;
    char v49 = (void *)swift_task_alloc();
    v0[28] = v49;
    *char v49 = v0;
    v49[1] = sub_220C67FD4;
    uint64_t v50 = v0[14];
    return sub_220C6DA04(v50);
  }
  else if (v5 == *MEMORY[0x263F40FA8])
  {
    uint64_t v27 = v0[21];
    uint64_t v28 = v0[18];
    uint64_t v30 = v0[15];
    uint64_t v29 = v0[16];
    (*(void (**)(uint64_t, void))(v0[20] + 96))(v27, v0[19]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 32))(v28, v27, v30);
    if (qword_26AD53240 != -1) {
      swift_once();
    }
    uint64_t v32 = v0[17];
    uint64_t v31 = v0[18];
    uint64_t v34 = v0[15];
    uint64_t v33 = v0[16];
    uint64_t v35 = sub_220C74920();
    __swift_project_value_buffer(v35, (uint64_t)qword_26AD53298);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16))(v32, v31, v34);
    uint64_t v36 = sub_220C74900();
    os_log_type_t v37 = sub_220C74F40();
    BOOL v38 = os_log_type_enabled(v36, v37);
    uint64_t v40 = v0[16];
    uint64_t v39 = v0[17];
    uint64_t v41 = v0[15];
    if (v38)
    {
      uint64_t v42 = swift_slowAlloc();
      uint64_t v62 = swift_slowAlloc();
      uint64_t v64 = v62;
      *(_DWORD *)uint64_t v42 = 136315394;
      v0[8] = sub_220C6043C(0x6174536863746566, 0xED00002928737574, &v64);
      sub_220C74FD0();
      *(_WORD *)(v42 + 12) = 2080;
      sub_220C6EBF0(&qword_26AD531E8, MEMORY[0x263F41110]);
      uint64_t v43 = sub_220C75120();
      v0[9] = sub_220C6043C(v43, v44, &v64);
      sub_220C74FD0();
      swift_bridgeObjectRelease();
      uint64_t v47 = *(void (**)(void, void))(v40 + 8);
      uint64_t v46 = v40 + 8;
      char v45 = v47;
      v47(v39, v41);
      _os_log_impl(&dword_220C23000, v36, v37, "%s Availability Provider says GM is unavailable: %s", (uint8_t *)v42, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x223C72360](v62, -1, -1);
      MEMORY[0x223C72360](v42, -1, -1);
    }
    else
    {
      uint64_t v58 = *(void (**)(void, void))(v40 + 8);
      uint64_t v46 = v40 + 8;
      char v45 = v58;
      v58(v0[17], v0[15]);
    }

    v0[22] = v46;
    v0[23] = v45;
    uint64_t v59 = (void *)swift_task_alloc();
    v0[24] = v59;
    *uint64_t v59 = v0;
    v59[1] = sub_220C67E1C;
    uint64_t v60 = v0[18];
    return sub_220C69498(v60);
  }
  else if (v5 == *MEMORY[0x263F41150])
  {
    if (qword_26AD53240 != -1) {
      swift_once();
    }
    uint64_t v52 = sub_220C74920();
    __swift_project_value_buffer(v52, (uint64_t)qword_26AD53298);
    uint64_t v53 = sub_220C74900();
    os_log_type_t v54 = sub_220C74F40();
    if (os_log_type_enabled(v53, v54))
    {
      id v55 = (uint8_t *)swift_slowAlloc();
      uint64_t v56 = swift_slowAlloc();
      uint64_t v64 = v56;
      *(_DWORD *)id v55 = 136315138;
      v0[5] = sub_220C6043C(0x6174536863746566, 0xED00002928737574, &v64);
      sub_220C74FD0();
      _os_log_impl(&dword_220C23000, v53, v54, "%s Availability Provider says GM is available.", v55, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C72360](v56, -1, -1);
      MEMORY[0x223C72360](v55, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    char v57 = (uint64_t (*)(uint64_t))v0[1];
    return v57(5);
  }
  else
  {
    uint64_t v61 = v0[19];
    return MEMORY[0x270F9F7C8](v61, v61);
  }
}

uint64_t sub_220C67E1C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 200) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_220C67F1C, 0, 0);
}

uint64_t sub_220C67F1C()
{
  (*(void (**)(void, void))(v0 + 184))(*(void *)(v0 + 144), *(void *)(v0 + 120));
  uint64_t v1 = *(void *)(v0 + 200);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_220C67FD4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 232) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_220C680D4, 0, 0);
}

uint64_t sub_220C680D4()
{
  (*(void (**)(void, void))(v0 + 216))(*(void *)(v0 + 112), *(void *)(v0 + 88));
  uint64_t v1 = *(void *)(v0 + 232);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_220C682F4(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_220C6ECF0;
  return sub_220C673E4();
}

uint64_t sub_220C6839C(uint64_t a1)
{
  v2[27] = a1;
  v2[28] = v1;
  uint64_t v3 = sub_220C74700();
  v2[29] = v3;
  v2[30] = *(void *)(v3 - 8);
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  uint64_t v4 = sub_220C74730();
  v2[33] = v4;
  v2[34] = *(void *)(v4 - 8);
  v2[35] = swift_task_alloc();
  v2[36] = swift_task_alloc();
  uint64_t v5 = sub_220C74760();
  v2[37] = v5;
  v2[38] = *(void *)(v5 - 8);
  v2[39] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_220C68534, 0, 0);
}

uint64_t sub_220C68534()
{
  os_log_type_t v37 = v0;
  uint64_t v1 = v0[28] + OBJC_IVAR___GMSpecifierController_delegate;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x223C72420](v1);
  v0[40] = v2;
  if (!v2)
  {
    if (qword_26AD53240 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_220C74920();
    __swift_project_value_buffer(v15, (uint64_t)qword_26AD53298);
    os_log_type_t v16 = sub_220C74900();
    os_log_type_t v17 = sub_220C74F40();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v36 = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      v0[25] = sub_220C6043C(0xD000000000000015, 0x8000000220C7FE00, &v36);
      sub_220C74FD0();
      _os_log_impl(&dword_220C23000, v16, v17, "%s Delegate is not set. Bailing.", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C72360](v19, -1, -1);
      MEMORY[0x223C72360](v18, -1, -1);
    }

    goto LABEL_11;
  }
  uint64_t v4 = v0[38];
  uint64_t v3 = v0[39];
  uint64_t v5 = v0[37];
  uint64_t v6 = v0[27];
  sub_220C69EB4();
  v0[21] = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
  int v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 88))(v3, v5);
  if (v7 == *MEMORY[0x263F40F98])
  {
    uint64_t v8 = v0[39];
    uint64_t v9 = v0[32];
    uint64_t v10 = v0[29];
    uint64_t v11 = v0[30];
    (*(void (**)(uint64_t, void))(v0[38] + 96))(v8, v0[37]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v9, v8, v10);
    uint64_t v12 = (void *)swift_task_alloc();
    v0[43] = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_220C69000;
    uint64_t v13 = v0[32];
    return sub_220C6DA04(v13);
  }
  if (v7 == *MEMORY[0x263F40FA8])
  {
    uint64_t v21 = v0[39];
    uint64_t v22 = v0[36];
    uint64_t v23 = v0[33];
    uint64_t v24 = v0[34];
    (*(void (**)(uint64_t, void))(v0[38] + 96))(v21, v0[37]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32))(v22, v21, v23);
    uint64_t v25 = (void *)swift_task_alloc();
    v0[41] = v25;
    *uint64_t v25 = v0;
    v25[1] = sub_220C68B68;
    uint64_t v26 = v0[36];
    return sub_220C69498(v26);
  }
  if (v7 == *MEMORY[0x263F41150])
  {
    v0[21] = 5;
    if (qword_26AD53240 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_220C74920();
    __swift_project_value_buffer(v27, (uint64_t)qword_26AD53298);
    uint64_t v28 = sub_220C74900();
    os_log_type_t v29 = sub_220C74F40();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 136315394;
      uint64_t v36 = v31;
      v0[17] = sub_220C6043C(0xD000000000000015, 0x8000000220C7FE00, &v36);
      sub_220C74FD0();
      *(_WORD *)(v30 + 12) = 2080;
      swift_beginAccess();
      unint64_t v32 = GMEligibilityContext.description.getter(v0[21]);
      v0[18] = sub_220C6043C(v32, v33, &v36);
      sub_220C74FD0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_220C23000, v28, v29, "%s Availability Provider says GM is available. Context: %s", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x223C72360](v31, -1, -1);
      MEMORY[0x223C72360](v30, -1, -1);
    }

    uint64_t v34 = (void *)v0[40];
    swift_beginAccess();
    objc_msgSend(v34, sel_updateWithContext_, v0[21]);
    swift_unknownObjectRelease();
LABEL_11:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v20 = (uint64_t (*)(void))v0[1];
    return v20();
  }
  uint64_t v35 = v0[37];
  return MEMORY[0x270F9F7C8](v35, v35);
}

uint64_t sub_220C68B68(uint64_t a1)
{
  *(void *)(*(void *)v1 + 336) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_220C68C68, 0, 0);
}

uint64_t sub_220C68C68()
{
  uint64_t v27 = v0;
  v0[21] = v0[42];
  if (qword_26AD53240 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[35];
  uint64_t v1 = v0[36];
  uint64_t v3 = v0[33];
  uint64_t v4 = v0[34];
  uint64_t v5 = sub_220C74920();
  __swift_project_value_buffer(v5, (uint64_t)qword_26AD53298);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  uint64_t v6 = sub_220C74900();
  os_log_type_t v7 = sub_220C74F40();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[35];
  uint64_t v10 = v0[36];
  uint64_t v11 = v0[33];
  uint64_t v12 = v0[34];
  if (v8)
  {
    uint64_t v25 = v0[36];
    os_log_type_t type = v7;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v26 = v24;
    *(_DWORD *)uint64_t v13 = 136315650;
    v0[23] = sub_220C6043C(0xD000000000000015, 0x8000000220C7FE00, &v26);
    sub_220C74FD0();
    *(_WORD *)(v13 + 12) = 2080;
    sub_220C6EBF0(&qword_26AD531E8, MEMORY[0x263F41110]);
    uint64_t v14 = sub_220C75120();
    v0[24] = sub_220C6043C(v14, v15, &v26);
    sub_220C74FD0();
    swift_bridgeObjectRelease();
    os_log_type_t v16 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v16(v9, v11);
    *(_WORD *)(v13 + 22) = 2080;
    swift_beginAccess();
    unint64_t v17 = GMEligibilityContext.description.getter(v0[21]);
    v0[26] = sub_220C6043C(v17, v18, &v26);
    sub_220C74FD0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_220C23000, v6, type, "%s Availability Provider says GM is unavailable: %s context: %s", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x223C72360](v24, -1, -1);
    MEMORY[0x223C72360](v13, -1, -1);

    v16(v25, v11);
  }
  else
  {

    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v19(v9, v11);
    v19(v10, v11);
  }
  uint64_t v20 = (void *)v0[40];
  swift_beginAccess();
  objc_msgSend(v20, sel_updateWithContext_, v0[21]);
  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_220C69000(uint64_t a1)
{
  *(void *)(*(void *)v1 + 352) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_220C69100, 0, 0);
}

uint64_t sub_220C69100()
{
  uint64_t v27 = v0;
  v0[21] = v0[44];
  if (qword_26AD53240 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[31];
  uint64_t v1 = v0[32];
  uint64_t v3 = v0[29];
  uint64_t v4 = v0[30];
  uint64_t v5 = sub_220C74920();
  __swift_project_value_buffer(v5, (uint64_t)qword_26AD53298);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  uint64_t v6 = sub_220C74900();
  os_log_type_t v7 = sub_220C74F40();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[31];
  uint64_t v10 = v0[32];
  uint64_t v11 = v0[29];
  uint64_t v12 = v0[30];
  if (v8)
  {
    uint64_t v25 = v0[32];
    os_log_type_t type = v7;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v26 = v24;
    *(_DWORD *)uint64_t v13 = 136315650;
    v0[19] = sub_220C6043C(0xD000000000000015, 0x8000000220C7FE00, &v26);
    sub_220C74FD0();
    *(_WORD *)(v13 + 12) = 2080;
    sub_220C6EBF0(&qword_267F2C020, MEMORY[0x263F41000]);
    uint64_t v14 = sub_220C75120();
    v0[20] = sub_220C6043C(v14, v15, &v26);
    sub_220C74FD0();
    swift_bridgeObjectRelease();
    os_log_type_t v16 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v16(v9, v11);
    *(_WORD *)(v13 + 22) = 2080;
    swift_beginAccess();
    unint64_t v17 = GMEligibilityContext.description.getter(v0[21]);
    v0[22] = sub_220C6043C(v17, v18, &v26);
    sub_220C74FD0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_220C23000, v6, type, "%s Availability Provider says GM is restricted: %s context: %s", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x223C72360](v24, -1, -1);
    MEMORY[0x223C72360](v13, -1, -1);

    v16(v25, v11);
  }
  else
  {

    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v19(v9, v11);
    v19(v10, v11);
  }
  uint64_t v20 = (void *)v0[40];
  swift_beginAccess();
  objc_msgSend(v20, sel_updateWithContext_, v0[21]);
  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_220C69498(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v3 = sub_220C74710();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  uint64_t v4 = sub_220C74730();
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_220C695B4, 0, 0);
}

uint64_t sub_220C695B4()
{
  uint64_t v69 = v0;
  if (qword_26AD53240 != -1) {
    swift_once();
  }
  uint64_t v2 = v0 + 3;
  uint64_t v1 = v0[3];
  uint64_t v3 = v0[9];
  uint64_t v4 = v0[10];
  uint64_t v5 = v0[8];
  uint64_t v6 = sub_220C74920();
  __swift_project_value_buffer(v6, (uint64_t)qword_26AD53298);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v1, v5);
  os_log_type_t v7 = sub_220C74900();
  os_log_type_t v8 = sub_220C74F40();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v11 = v0[9];
  uint64_t v10 = v0[10];
  if (v9)
  {
    uint64_t v63 = v0[8];
    os_log_type_t typea = v8;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v64 = swift_slowAlloc();
    uint64_t v68 = v64;
    *(_DWORD *)uint64_t v12 = 136315138;
    sub_220C74720();
    sub_220C6EBF0((unint64_t *)&qword_26AD531D8, MEMORY[0x263F410F8]);
    uint64_t v13 = sub_220C74F20();
    unint64_t v15 = v14;
    uint64_t v2 = v0 + 3;
    swift_bridgeObjectRelease();
    v0[2] = sub_220C6043C(v13, v15, &v68);
    sub_220C74FD0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v63);
    _os_log_impl(&dword_220C23000, v7, typea, "Unavailability reasons: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C72360](v64, -1, -1);
    MEMORY[0x223C72360](v12, -1, -1);
  }
  else
  {
    (*(void (**)(void, void))(v11 + 8))(v0[10], v0[8]);
  }

  uint64_t v17 = v0[6];
  uint64_t v16 = v0[7];
  uint64_t v18 = v0[5];
  uint64_t v19 = sub_220C74720();
  uint64_t v20 = *(void (**)(uint64_t, void, uint64_t))(v17 + 104);
  v20(v16, *MEMORY[0x263F41068], v18);
  char v21 = sub_220C5E748(v16, v19);
  swift_bridgeObjectRelease();
  uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
  v22(v16, v18);
  if (v21)
  {
    uint64_t v23 = 18;
LABEL_25:
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v62 = (uint64_t (*)(uint64_t))v0[1];
    return v62(v23);
  }
  uint64_t v24 = v0[7];
  uint64_t v25 = v0[5];
  uint64_t v26 = sub_220C74720();
  v20(v24, *MEMORY[0x263F41040], v25);
  char v27 = sub_220C5E748(v24, v26);
  swift_bridgeObjectRelease();
  v22(v24, v25);
  if (v27)
  {
    uint64_t v23 = 19;
    goto LABEL_25;
  }
  uint64_t v28 = v0[7];
  uint64_t v29 = v0[5];
  uint64_t v30 = sub_220C74720();
  v20(v28, *MEMORY[0x263F41088], v29);
  char v31 = sub_220C5E748(v28, v30);
  swift_bridgeObjectRelease();
  v22(v28, v29);
  if (v31)
  {
    uint64_t v23 = 13;
    goto LABEL_25;
  }
  os_log_type_t type = v2;
  uint64_t v33 = v0[5];
  uint64_t v32 = v0[6];
  uint64_t v34 = sub_220C74720();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53258);
  uint64_t v35 = *(void *)(v32 + 72);
  unint64_t v36 = (*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_220C78F10;
  unint64_t v38 = v37 + v36;
  v20(v38, *MEMORY[0x263F410C0], v33);
  v20(v38 + v35, *MEMORY[0x263F41080], v33);
  uint64_t v39 = sub_220C6CF7C(v37, v34);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v40 = *(void *)(v39 + 16);
  swift_release();
  if (v40)
  {
    uint64_t v23 = 14;
    goto LABEL_25;
  }
  uint64_t v41 = v0[7];
  uint64_t v42 = v0[5];
  uint64_t v43 = sub_220C74720();
  v20(v41, *MEMORY[0x263F410D8], v42);
  char v44 = sub_220C5E748(v41, v43);
  swift_bridgeObjectRelease();
  v22(v41, v42);
  if (v44)
  {
    uint64_t v23 = 15;
    goto LABEL_25;
  }
  uint64_t v45 = v0[7];
  uint64_t v46 = v0[5];
  uint64_t v47 = sub_220C74720();
  v20(v45, *MEMORY[0x263F410E8], v46);
  char v48 = sub_220C5E748(v45, v47);
  swift_bridgeObjectRelease();
  v22(v45, v46);
  if (v48)
  {
    uint64_t v23 = 16;
    goto LABEL_25;
  }
  uint64_t v49 = v0[7];
  uint64_t v50 = v0[5];
  uint64_t v51 = sub_220C74720();
  v20(v49, *MEMORY[0x263F41020], v50);
  char v52 = sub_220C5E748(v49, v51);
  swift_bridgeObjectRelease();
  v22(v49, v50);
  if (v52)
  {
    uint64_t v23 = 17;
    goto LABEL_25;
  }
  uint64_t v53 = v0[7];
  uint64_t v54 = v0[5];
  uint64_t v55 = sub_220C74720();
  v20(v53, *MEMORY[0x263F41060], v54);
  char v56 = sub_220C5E748(v53, v55);
  swift_bridgeObjectRelease();
  v22(v53, v54);
  if ((v56 & 1) == 0)
  {
    uint64_t v23 = sub_220C656C8(*type);
    goto LABEL_25;
  }
  char v57 = (void *)(v0[4] + OBJC_IVAR___GMSpecifierController_enrollmentProvider);
  uint64_t v58 = v57[3];
  uint64_t v59 = v57[4];
  __swift_project_boxed_opaque_existential_1(v57, v58);
  uint64_t v65 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v59 + 16) + **(int **)(v59 + 16));
  uint64_t v60 = (void *)swift_task_alloc();
  v0[11] = v60;
  *uint64_t v60 = v0;
  v60[1] = sub_220C69D2C;
  return v65(v58, v59);
}

uint64_t sub_220C69D2C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 96) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_220C69E2C, 0, 0);
}

uint64_t sub_220C69E2C()
{
  uint64_t v1 = (void *)v0[12];
  uint64_t v2 = sub_220C65240(v0[3], v1);

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t))v0[1];
  return v3(v2);
}

void sub_220C69EB4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_220C74760();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = &v0[OBJC_IVAR___GMSpecifierController_availability];
  swift_beginAccess();
  os_log_type_t v7 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v7(v5, v6, v2);
  char v8 = sub_220C74740();
  BOOL v9 = *(void (**)(char *, uint64_t))(v3 + 8);
  v9(v5, v2);
  if (v8)
  {
    if (qword_26AD53240 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_220C74920();
    __swift_project_value_buffer(v10, (uint64_t)qword_26AD53298);
    id v26 = v1;
    uint64_t v11 = sub_220C74900();
    os_log_type_t v12 = sub_220C74F40();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v25 = v9;
      uint64_t v14 = v13;
      uint64_t v24 = swift_slowAlloc();
      uint64_t v28 = v24;
      *(_DWORD *)uint64_t v14 = 136315394;
      uint64_t v27 = sub_220C6043C(0xD000000000000012, 0x8000000220C7FE20, &v28);
      sub_220C74FD0();
      *(_WORD *)(v14 + 12) = 1024;
      v7(v5, v6, v2);
      char v15 = sub_220C74740();
      v25(v5, v2);
      LODWORD(v27) = v15 & 1;
      sub_220C74FD0();

      _os_log_impl(&dword_220C23000, v11, v12, "%s Forcing download, isOkayToHaveAsset:%{BOOL}d.", (uint8_t *)v14, 0x12u);
      uint64_t v16 = v24;
      swift_arrayDestroy();
      MEMORY[0x223C72360](v16, -1, -1);
      MEMORY[0x223C72360](v14, -1, -1);
    }
    else
    {
    }
    if (qword_267F2BA90 != -1) {
      swift_once();
    }
    sub_220C5B134();
  }
  else
  {
    if (qword_26AD53240 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_220C74920();
    __swift_project_value_buffer(v17, (uint64_t)qword_26AD53298);
    id v26 = v1;
    uint64_t v18 = sub_220C74900();
    os_log_type_t v19 = sub_220C74F40();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v25 = v9;
      uint64_t v21 = v20;
      uint64_t v24 = swift_slowAlloc();
      uint64_t v28 = v24;
      *(_DWORD *)uint64_t v21 = 136315394;
      uint64_t v27 = sub_220C6043C(0xD000000000000012, 0x8000000220C7FE20, &v28);
      sub_220C74FD0();
      *(_WORD *)(v21 + 12) = 1024;
      v7(v5, v6, v2);
      char v22 = sub_220C74740();
      v25(v5, v2);
      LODWORD(v27) = v22 & 1;
      sub_220C74FD0();

      _os_log_impl(&dword_220C23000, v18, v19, "%s skipping download, isOkayToHaveAsset:%{BOOL}d.", (uint8_t *)v21, 0x12u);
      uint64_t v23 = v24;
      swift_arrayDestroy();
      MEMORY[0x223C72360](v23, -1, -1);
      MEMORY[0x223C72360](v21, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_220C6A398()
{
  uint64_t v1 = v0 + OBJC_IVAR___GMSpecifierController_optInStatusProvider;
  swift_beginAccess();
  sub_220C6EAD4(v1, (uint64_t)v5);
  uint64_t v2 = v6;
  uint64_t v3 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v2 & 1;
}

uint64_t sub_220C6A4E0(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR___GMSpecifierController_optInStatusProvider;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 24);
  uint64_t v5 = *(void *)(v3 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v3, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, v4, v5);
  return swift_endAccess();
}

uint64_t sub_220C6A61C()
{
  return MEMORY[0x270FA2498](sub_220C6A638, 0, 0);
}

uint64_t sub_220C6A638()
{
  uint64_t v1 = self;
  v0[2] = v0;
  v0[3] = sub_220C6A738;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_220C6A8CC;
  v0[13] = &block_descriptor_1;
  v0[14] = v2;
  objc_msgSend(v1, sel_clearCFUWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_220C6A738()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 120) = v1;
  if (v1) {
    uint64_t v2 = sub_220C6A860;
  }
  else {
    uint64_t v2 = sub_220C6A848;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_220C6A848()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_220C6A860()
{
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_220C6A8CC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BFC0);
    uint64_t v4 = swift_allocError();
    *uint64_t v5 = a2;
    id v6 = a2;
    return MEMORY[0x270FA2410](v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return MEMORY[0x270FA2408](v7);
  }
}

uint64_t sub_220C6AACC(const void *a1, void *a2)
{
  *(void *)(v2 + 120) = a2;
  *(void *)(v2 + 128) = _Block_copy(a1);
  id v4 = a2;
  return MEMORY[0x270FA2498](sub_220C6AB44, 0, 0);
}

uint64_t sub_220C6AB44()
{
  uint64_t v1 = self;
  v0[2] = v0;
  v0[3] = sub_220C6AC44;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_220C6A8CC;
  v0[13] = &block_descriptor_39;
  v0[14] = v2;
  objc_msgSend(v1, sel_clearCFUWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_220C6AC44()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 136) = v1;
  if (v1) {
    uint64_t v2 = sub_220C6ADD0;
  }
  else {
    uint64_t v2 = sub_220C6AD54;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_220C6AD54()
{
  uint64_t v1 = *(void *)(v0 + 128);

  (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
  _Block_release(*(const void **)(v0 + 128));
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_220C6ADD0()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void **)(v0 + 136);
  uint64_t v3 = *(void **)(v0 + 120);
  swift_willThrow();

  uint64_t v4 = (void *)sub_220C745B0();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);

  _Block_release(*(const void **)(v0 + 128));
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_220C6AE80()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53248);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AD53240 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_220C74920();
  __swift_project_value_buffer(v5, (uint64_t)qword_26AD53298);
  uint64_t v6 = sub_220C74900();
  os_log_type_t v7 = sub_220C74F40();
  if (os_log_type_enabled(v6, v7))
  {
    char v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v8 = 0;
    _os_log_impl(&dword_220C23000, v6, v7, "Adding AFM Availability listeners", v8, 2u);
    MEMORY[0x223C72360](v8, -1, -1);
  }

  uint64_t v9 = sub_220C74EA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 1, 1, v9);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v1;
  id v11 = v1;
  sub_220C5CE88((uint64_t)v4, (uint64_t)&unk_267F2C120, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_220C6B038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a4;
  uint64_t v5 = sub_220C74760();
  v4[7] = v5;
  v4[8] = *(void *)(v5 - 8);
  v4[9] = swift_task_alloc();
  v4[10] = swift_task_alloc();
  v4[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD531F8);
  v4[12] = swift_task_alloc();
  uint64_t v6 = sub_220C747C0();
  v4[13] = v6;
  v4[14] = *(void *)(v6 - 8);
  v4[15] = swift_task_alloc();
  uint64_t v7 = sub_220C74800();
  v4[16] = v7;
  v4[17] = *(void *)(v7 - 8);
  v4[18] = swift_task_alloc();
  uint64_t v8 = sub_220C747B0();
  v4[19] = v8;
  v4[20] = *(void *)(v8 - 8);
  v4[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_220C6B258, 0, 0);
}

uint64_t sub_220C6B258()
{
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v5 = v0[14];
  uint64_t v14 = v0[13];
  uint64_t v6 = (void *)(v0[6] + OBJC_IVAR___GMSpecifierController_availabilityProvider);
  uint64_t v7 = v6[3];
  uint64_t v8 = v6[4];
  __swift_project_boxed_opaque_existential_1(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(v7, v8);
  sub_220C747E0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_220C747A0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v14);
  v0[22] = OBJC_IVAR___GMSpecifierController_availability;
  uint64_t v9 = sub_220C6EBF0(&qword_26AD53200, MEMORY[0x263F41180]);
  uint64_t v10 = (void *)swift_task_alloc();
  v0[23] = v10;
  void *v10 = v0;
  v10[1] = sub_220C6B3FC;
  uint64_t v11 = v0[19];
  uint64_t v12 = v0[12];
  return MEMORY[0x270FA1E80](v12, v11, v9);
}

uint64_t sub_220C6B3FC()
{
  *(void *)(*(void *)v1 + 192) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_220C6B904;
  }
  else {
    uint64_t v2 = sub_220C6B510;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_220C6B510()
{
  uint64_t v32 = v0;
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[8];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(v0[20] + 8))(v0[21], v0[19]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(v0[11], v1, v2);
    if (qword_26AD53240 != -1) {
      swift_once();
    }
    uint64_t v6 = v0[10];
    uint64_t v7 = v0[11];
    uint64_t v8 = v0[7];
    uint64_t v9 = v0[8];
    uint64_t v10 = sub_220C74920();
    __swift_project_value_buffer(v10, (uint64_t)qword_26AD53298);
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
    v11(v6, v7, v8);
    uint64_t v12 = sub_220C74900();
    os_log_type_t v13 = sub_220C74F40();
    BOOL v14 = os_log_type_enabled(v12, v13);
    uint64_t v15 = v0[10];
    uint64_t v16 = v0[7];
    uint64_t v17 = (void (**)(uint64_t, uint64_t))(v0[8] + 8);
    if (v14)
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v30 = v11;
      uint64_t v31 = swift_slowAlloc();
      uint64_t v19 = v31;
      *(_DWORD *)uint64_t v18 = 136315394;
      *(void *)(v18 + 4) = sub_220C6043C(0xD00000000000001BLL, 0x8000000220C7FE60, &v31);
      *(_WORD *)(v18 + 12) = 2080;
      sub_220C6EBF0(&qword_26AD531F0, MEMORY[0x263F41158]);
      uint64_t v20 = sub_220C75120();
      *(void *)(v18 + 14) = sub_220C6043C(v20, v21, &v31);
      swift_bridgeObjectRelease();
      char v22 = *v17;
      (*v17)(v15, v16);
      _os_log_impl(&dword_220C23000, v12, v13, "%s Availability changes notification received. %s", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      uint64_t v23 = v19;
      uint64_t v11 = v30;
      MEMORY[0x223C72360](v23, -1, -1);
      MEMORY[0x223C72360](v18, -1, -1);
    }
    else
    {
      char v22 = *v17;
      (*v17)(v0[10], v0[7]);
    }

    v0[25] = v22;
    uint64_t v25 = v0[8];
    uint64_t v24 = v0[9];
    uint64_t v26 = v0[7];
    uint64_t v27 = v0[6] + v0[22];
    v11(v24, v0[11], v26);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 40))(v27, v24, v26);
    swift_endAccess();
    uint64_t v28 = (void *)swift_task_alloc();
    v0[26] = v28;
    void *v28 = v0;
    v28[1] = sub_220C6B988;
    uint64_t v29 = v0[11];
    return sub_220C6839C(v29);
  }
}

uint64_t sub_220C6B904()
{
  *(void *)(v0 + 40) = *(void *)(v0 + 192);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BFC0);
  uint64_t v1 = MEMORY[0x263F8E628];
  uint64_t v2 = swift_dynamicCast();
  uint64_t v3 = MEMORY[0x263F8E658];
  return MEMORY[0x270FA0678](v2, v1, v3);
}

uint64_t sub_220C6B988()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_220C6BA84, 0, 0);
}

uint64_t sub_220C6BA84()
{
  (*(void (**)(void, void))(v0 + 200))(*(void *)(v0 + 88), *(void *)(v0 + 56));
  uint64_t v1 = sub_220C6EBF0(&qword_26AD53200, MEMORY[0x263F41180]);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 184) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_220C6B3FC;
  uint64_t v3 = *(void *)(v0 + 152);
  uint64_t v4 = *(void *)(v0 + 96);
  return MEMORY[0x270FA1E80](v4, v3, v1);
}

uint64_t sub_220C6BB7C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53248);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_220C74800();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v42 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_220C74760();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v43 = (char *)v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AD53240 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_220C74920();
  __swift_project_value_buffer(v10, (uint64_t)qword_26AD53298);
  uint64_t v11 = sub_220C74900();
  os_log_type_t v12 = sub_220C74F40();
  if (os_log_type_enabled(v11, v12))
  {
    os_log_type_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v13 = 0;
    _os_log_impl(&dword_220C23000, v11, v12, "Adding ADM Availability listeners", v13, 2u);
    MEMORY[0x223C72360](v13, -1, -1);
  }

  BOOL v14 = v0;
  uint64_t v15 = sub_220C74900();
  os_log_type_t v16 = sub_220C74F40();
  int v17 = v16;
  if (os_log_type_enabled(v15, v16))
  {
    os_log_t v41 = v15;
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    uint64_t v45 = v40;
    v37[0] = v4;
    uint64_t v39 = v18;
    *(_DWORD *)uint64_t v18 = 136315138;
    v37[1] = v18 + 4;
    uint64_t v19 = v7;
    uint64_t v20 = v3;
    uint64_t v22 = *(void *)&v14[OBJC_IVAR___GMSpecifierController_availabilityProvider + 24];
    uint64_t v21 = *(void *)&v14[OBJC_IVAR___GMSpecifierController_availabilityProvider + 32];
    __swift_project_boxed_opaque_existential_1(&v14[OBJC_IVAR___GMSpecifierController_availabilityProvider], v22);
    uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v21 + 40);
    uint64_t v24 = v42;
    int v38 = v17;
    uint64_t v25 = v22;
    uint64_t v3 = v20;
    v23(v25, v21);
    uint64_t v26 = v43;
    sub_220C74790();
    (*(void (**)(char *, void))(v5 + 8))(v24, v37[0]);
    sub_220C6EBF0(&qword_26AD531F0, MEMORY[0x263F41158]);
    uint64_t v27 = sub_220C75120();
    unint64_t v29 = v28;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v26, v19);
    uint64_t v44 = sub_220C6043C(v27, v29, &v45);
    sub_220C74FD0();

    swift_bridgeObjectRelease();
    os_log_t v30 = v41;
    uint64_t v31 = v39;
    _os_log_impl(&dword_220C23000, v41, (os_log_type_t)v38, "current adm status: %s", v39, 0xCu);
    uint64_t v32 = v40;
    swift_arrayDestroy();
    MEMORY[0x223C72360](v32, -1, -1);
    MEMORY[0x223C72360](v31, -1, -1);
  }
  else
  {
  }
  uint64_t v33 = sub_220C74EA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v3, 1, 1, v33);
  uint64_t v34 = (void *)swift_allocObject();
  v34[2] = 0;
  v34[3] = 0;
  v34[4] = v14;
  uint64_t v35 = v14;
  sub_220C5CE88((uint64_t)v3, (uint64_t)aE, (uint64_t)v34);
  return swift_release();
}

uint64_t sub_220C6C04C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a4;
  uint64_t v5 = sub_220C74760();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  v4[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD531F8);
  v4[12] = swift_task_alloc();
  uint64_t v6 = sub_220C747C0();
  v4[13] = v6;
  v4[14] = *(void *)(v6 - 8);
  v4[15] = swift_task_alloc();
  uint64_t v7 = sub_220C74800();
  v4[16] = v7;
  v4[17] = *(void *)(v7 - 8);
  v4[18] = swift_task_alloc();
  uint64_t v8 = sub_220C747B0();
  v4[19] = v8;
  v4[20] = *(void *)(v8 - 8);
  v4[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_220C6C260, 0, 0);
}

uint64_t sub_220C6C260()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v5 = v0[14];
  uint64_t v14 = v0[13];
  uint64_t v6 = v0[7];
  uint64_t v7 = *(void *)(v6 + OBJC_IVAR___GMSpecifierController_availabilityProvider + 24);
  uint64_t v8 = *(void *)(v6 + OBJC_IVAR___GMSpecifierController_availabilityProvider + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v6 + OBJC_IVAR___GMSpecifierController_availabilityProvider), v7);
  (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v7, v8);
  sub_220C747E0();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  sub_220C747A0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v14);
  v0[22] = OBJC_IVAR___GMSpecifierController_delegate;
  swift_beginAccess();
  uint64_t v9 = sub_220C6EBF0(&qword_26AD53200, MEMORY[0x263F41180]);
  uint64_t v10 = (void *)swift_task_alloc();
  v0[23] = v10;
  void *v10 = v0;
  v10[1] = sub_220C6C420;
  uint64_t v11 = v0[19];
  uint64_t v12 = v0[12];
  return MEMORY[0x270FA1E80](v12, v11, v9);
}

uint64_t sub_220C6C420()
{
  *(void *)(*(void *)v1 + 192) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_220C6B904;
  }
  else {
    uint64_t v2 = sub_220C6C534;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_220C6C534()
{
  os_log_t v41 = v0;
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(v0[20] + 8))(v0[21], v0[19]);
    goto LABEL_15;
  }
  (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(v0[11], v1, v2);
  if (qword_26AD53240 != -1) {
    swift_once();
  }
  uint64_t v4 = v0[10];
  uint64_t v5 = v0[11];
  uint64_t v7 = v0[8];
  uint64_t v6 = v0[9];
  uint64_t v8 = sub_220C74920();
  __swift_project_value_buffer(v8, (uint64_t)qword_26AD53298);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v5, v7);
  uint64_t v9 = sub_220C74900();
  os_log_type_t v10 = sub_220C74F40();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v12 = v0[10];
  uint64_t v13 = v0[8];
  uint64_t v14 = (void (**)(uint64_t, uint64_t))(v0[9] + 8);
  if (v11)
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v40 = v16;
    *(_DWORD *)uint64_t v15 = 136315394;
    *(void *)(v15 + 4) = sub_220C6043C(0xD00000000000001CLL, 0x8000000220C7FE40, &v40);
    *(_WORD *)(v15 + 12) = 2080;
    sub_220C6EBF0(&qword_26AD531F0, MEMORY[0x263F41158]);
    uint64_t v17 = sub_220C75120();
    *(void *)(v15 + 14) = sub_220C6043C(v17, v18, &v40);
    swift_bridgeObjectRelease();
    uint64_t v19 = *v14;
    (*v14)(v12, v13);
    _os_log_impl(&dword_220C23000, v9, v10, "%s ADM availability changes notification received. %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x223C72360](v16, -1, -1);
    MEMORY[0x223C72360](v15, -1, -1);
  }
  else
  {
    uint64_t v19 = *v14;
    (*v14)(v0[10], v0[8]);
  }

  uint64_t v20 = (void *)MEMORY[0x223C72420](v0[7] + v0[22]);
  if (!v20)
  {
    uint64_t v27 = sub_220C74900();
    os_log_type_t v28 = sub_220C74F40();
    BOOL v29 = os_log_type_enabled(v27, v28);
    uint64_t v31 = v0[20];
    uint64_t v30 = v0[21];
    uint64_t v32 = v0[19];
    uint64_t v33 = v0[11];
    uint64_t v39 = v0[8];
    if (v29)
    {
      uint64_t v38 = v0[21];
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v40 = v35;
      *(_DWORD *)uint64_t v34 = 136315138;
      v0[6] = sub_220C6043C(0xD00000000000001CLL, 0x8000000220C7FE40, &v40);
      sub_220C74FD0();
      _os_log_impl(&dword_220C23000, v27, v28, "%s ADM delegate is not set. Bailing.", v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C72360](v35, -1, -1);
      MEMORY[0x223C72360](v34, -1, -1);

      v19(v33, v39);
      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v38, v32);
    }
    else
    {

      v19(v33, v39);
      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
    }
LABEL_15:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v36 = (uint64_t (*)(void))v0[1];
    return v36();
  }
  uint64_t v21 = v0[11];
  uint64_t v22 = v0[8];
  objc_msgSend(v20, sel_updateADMState);
  swift_unknownObjectRelease();
  v19(v21, v22);
  uint64_t v23 = sub_220C6EBF0(&qword_26AD53200, MEMORY[0x263F41180]);
  uint64_t v24 = (void *)swift_task_alloc();
  v0[23] = v24;
  *uint64_t v24 = v0;
  v24[1] = sub_220C6C420;
  uint64_t v25 = v0[19];
  uint64_t v26 = v0[12];
  return MEMORY[0x270FA1E80](v26, v25, v23);
}

uint64_t sub_220C6CAD8()
{
  return sub_220C748C0() & 1;
}

id GMSpecifierController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GMSpecifierController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_220C6CC40(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_220C57EF4;
  return v6();
}

uint64_t sub_220C6CD0C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_220C57EF4;
  return v7();
}

uint64_t sub_220C6CDD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_220C74EA0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_220C74E90();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_220C6E670(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_220C74E50();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_220C6CF7C(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x263EF8340];
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    uint64_t v7 = sub_220C6D104((void *)((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0)), v5, v3, a2);
    swift_release();
  }
  else
  {
    uint64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_220C6D104((unint64_t *)v8, v5, v3, a2);
    swift_release();
    MEMORY[0x223C72360](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_220C6D104(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v37 = a1;
  uint64_t v9 = sub_220C74710();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v33 - v14;
  uint64_t v16 = *(void *)(a3 + 16);
  uint64_t v43 = a4;
  uint64_t v40 = v16;
  if (v16)
  {
    uint64_t v34 = a2;
    uint64_t v35 = v5;
    uint64_t v42 = a4 + 56;
    unint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    uint64_t v17 = v10 + 16;
    uint64_t v45 = v18;
    uint64_t v39 = a3 + ((*(unsigned __int8 *)(v17 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 64));
    uint64_t v44 = *(void *)(v17 + 56);
    uint64_t v19 = (void (**)(char *, uint64_t))(v17 - 8);
    uint64_t v33 = a3;
    sub_220C749A0();
    uint64_t v36 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = a4;
    while (1)
    {
      uint64_t v41 = v20;
      v45(v15, v39 + v44 * v20, v9);
      sub_220C6EBF0((unint64_t *)&qword_26AD531D8, MEMORY[0x263F410F8]);
      uint64_t v23 = sub_220C74DA0();
      uint64_t v24 = -1 << *(unsigned char *)(v21 + 32);
      unint64_t v25 = v23 & ~v24;
      if ((*(void *)(v42 + ((v25 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v25))
      {
        uint64_t v38 = (unint64_t)v19 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        uint64_t v26 = ~v24;
        while (1)
        {
          v45(v13, *(void *)(v43 + 48) + v25 * v44, v9);
          sub_220C6EBF0(&qword_26AD531E0, MEMORY[0x263F410F8]);
          char v27 = sub_220C74DC0();
          uint64_t v22 = *v19;
          (*v19)(v13, v9);
          if (v27) {
            break;
          }
          unint64_t v25 = (v25 + 1) & v26;
          if (((*(void *)(v42 + ((v25 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v25) & 1) == 0)
          {
            uint64_t v21 = v43;
            goto LABEL_4;
          }
        }
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v22)(v15, v9);
        uint64_t v29 = (v25 >> 3) & 0x1FFFFFFFFFFFFFF8;
        uint64_t v30 = *(unint64_t *)((char *)v37 + v29);
        *(unint64_t *)((char *)v37 + v29) = v30 | (1 << v25);
        if ((v30 & (1 << v25)) != 0)
        {
          uint64_t v21 = v43;
        }
        else
        {
          uint64_t v21 = v43;
          if (__OFADD__(v36, 1))
          {
            __break(1u);
            return result;
          }
          ++v36;
        }
      }
      else
      {
        uint64_t v22 = *v19;
LABEL_4:
        v22(v15, v9);
      }
      uint64_t v20 = v41 + 1;
      if (v41 + 1 == v40)
      {
        swift_bridgeObjectRelease();
        a2 = v34;
        uint64_t v31 = v36;
        goto LABEL_17;
      }
    }
  }
  uint64_t v31 = 0;
LABEL_17:
  uint64_t v32 = v43;
  swift_retain();
  return sub_220C6D484(v37, a2, v31, v32);
}

uint64_t sub_220C6D484(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v34 = a1;
  uint64_t v7 = sub_220C74710();
  uint64_t v37 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2C100);
  uint64_t result = sub_220C75050();
  uint64_t v10 = result;
  uint64_t v33 = a2;
  if (a2 < 1) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = *v34;
  }
  uint64_t v13 = 0;
  uint64_t v14 = result + 56;
  uint64_t v35 = (uint64_t (**)(unint64_t, char *, uint64_t))(v37 + 32);
  uint64_t v36 = v37 + 16;
  while (1)
  {
    if (v12)
    {
      unint64_t v15 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v16 = v15 | (v13 << 6);
    }
    else
    {
      uint64_t v17 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_40;
      }
      if (v17 >= v33)
      {
LABEL_37:
        swift_release();
        return v10;
      }
      unint64_t v18 = v34[v17];
      ++v13;
      if (!v18)
      {
        uint64_t v13 = v17 + 1;
        if (v17 + 1 >= v33) {
          goto LABEL_37;
        }
        unint64_t v18 = v34[v13];
        if (!v18)
        {
          uint64_t v13 = v17 + 2;
          if (v17 + 2 >= v33) {
            goto LABEL_37;
          }
          unint64_t v18 = v34[v13];
          if (!v18)
          {
            uint64_t v19 = v17 + 3;
            if (v19 >= v33) {
              goto LABEL_37;
            }
            unint64_t v18 = v34[v19];
            if (!v18)
            {
              while (1)
              {
                uint64_t v13 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_37;
                }
                unint64_t v18 = v34[v13];
                ++v19;
                if (v18) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v13 = v19;
          }
        }
      }
LABEL_24:
      unint64_t v12 = (v18 - 1) & v18;
      unint64_t v16 = __clz(__rbit64(v18)) + (v13 << 6);
    }
    uint64_t v20 = a4;
    uint64_t v21 = *(void *)(a4 + 48);
    uint64_t v22 = *(void *)(v37 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v37 + 16))(v9, v21 + v22 * v16, v7);
    sub_220C6EBF0((unint64_t *)&qword_26AD531D8, MEMORY[0x263F410F8]);
    uint64_t result = sub_220C74DA0();
    uint64_t v23 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v26 = __clz(__rbit64((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v29 = v25 == v28;
        if (v25 == v28) {
          unint64_t v25 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v14 + 8 * v25);
      }
      while (v30 == -1);
      unint64_t v26 = __clz(__rbit64(~v30)) + (v25 << 6);
    }
    *(void *)(v14 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
    uint64_t result = (*v35)(*(void *)(v10 + 48) + v26 * v22, v9, v7);
    ++*(void *)(v10 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    a4 = v20;
    if (!a3) {
      goto LABEL_37;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

id sub_220C6D810(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v21 = a2;
  uint64_t v20 = sub_220C74760();
  uint64_t v6 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  *(void *)&v4[OBJC_IVAR___GMSpecifierController_availabilityNotifications] = 0;
  sub_220C6EAD4((uint64_t)a1, (uint64_t)&v4[OBJC_IVAR___GMSpecifierController_availabilityProvider]);
  uint64_t v10 = a1[3];
  uint64_t v9 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v10);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v9 + 24);
  unint64_t v12 = v4;
  v11(v10, v9);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v12[OBJC_IVAR___GMSpecifierController_availability], v8, v20);
  uint64_t v13 = v21;
  sub_220C6EAD4(v21, (uint64_t)&v12[OBJC_IVAR___GMSpecifierController_optInStatusProvider]);
  uint64_t v14 = v22;
  sub_220C6EAD4(v22, (uint64_t)&v12[OBJC_IVAR___GMSpecifierController_enrollmentProvider]);
  unint64_t v15 = v23;
  *(void *)&v12[OBJC_IVAR___GMSpecifierController_analytics] = v23;
  id v16 = v15;

  uint64_t v17 = (objc_class *)type metadata accessor for GMSpecifierController();
  v24.receiver = v12;
  v24.super_class = v17;
  id v18 = objc_msgSendSuper2(&v24, sel_init);
  sub_220C6AE80();
  sub_220C6BB7C();

  __swift_destroy_boxed_opaque_existential_1(v14);
  __swift_destroy_boxed_opaque_existential_1(v13);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v18;
}

uint64_t sub_220C6DA04(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_220C746E0();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_220C6DAC4, 0, 0);
}

uint64_t sub_220C6DAC4()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  uint64_t v4 = sub_220C746F0();
  uint64_t v5 = *(void (**)(uint64_t, void, uint64_t))(v2 + 104);
  v5(v1, *MEMORY[0x263F40FC0], v3);
  char v6 = sub_220C5E95C(v1, v4);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v7(v1, v3);
  if ((v6 & 1) != 0
    || (uint64_t v8 = v0[5],
        uint64_t v9 = v0[3],
        uint64_t v10 = sub_220C746F0(),
        v5(v8, *MEMORY[0x263F40FE0], v9),
        char v11 = sub_220C5E95C(v8, v10),
        swift_bridgeObjectRelease(),
        v7(v8, v9),
        (v11 & 1) != 0))
  {
    uint64_t v12 = 21;
  }
  else
  {
    uint64_t v13 = v0[5];
    uint64_t v14 = v0[3];
    uint64_t v15 = sub_220C746F0();
    v5(v13, *MEMORY[0x263F40FB8], v14);
    char v16 = sub_220C5E95C(v13, v15);
    swift_bridgeObjectRelease();
    v7(v13, v14);
    if (v16) {
      uint64_t v12 = 9;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(uint64_t))v0[1];
  return v17(v12);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_220C6DCCC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR___GMSpecifierController_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x223C72420](v3);
  *a2 = result;
  return result;
}

uint64_t sub_220C6DD24()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_220C6DD7C()
{
  return type metadata accessor for GMSpecifierController();
}

uint64_t sub_220C6DD84()
{
  uint64_t result = sub_220C74760();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for GMSpecifierController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GMSpecifierController);
}

uint64_t dispatch thunk of GMSpecifierController.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of GMSpecifierController.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of GMSpecifierController.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of GMSpecifierController.__allocating_init(availabilityProvider:optInStatus:enrollmentProvider:analytics:)()
{
  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of GMSpecifierController.gmFFEnabled()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of GMSpecifierController.enroll()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0xF8);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_220C63AA4;
  return v5();
}

uint64_t dispatch thunk of GMSpecifierController.fetchStatus(forceDownloadIfNeeded:)(uint64_t a1)
{
  uint64_t v4 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x100);
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_220C63870;
  return v7(a1);
}

uint64_t dispatch thunk of GMSpecifierController.fetchStatus()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x108);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_220C63AA4;
  return v5();
}

uint64_t dispatch thunk of GMSpecifierController.featureOptInStatus()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of GMSpecifierController.setFeatureOptInStatus(enabled:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of GMSpecifierController.clearCFU()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x140);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_220C57CA8;
  return v5();
}

uint64_t dispatch thunk of GMSpecifierController.hasEngagedCFU()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t sub_220C6E430()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_220C57EF4;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_267F2C060 + dword_267F2C060);
  return v5(v2, v3);
}

uint64_t sub_220C6E4E0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_220C57EF4;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_267F2C070 + dword_267F2C070);
  return v6(v2, v3, v4);
}

uint64_t sub_220C6E5A4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_220C57EF4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_267F2C080 + dword_267F2C080);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_220C6E670(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53248);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_220C6E6D0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_220C6E708(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_220C57EF4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267F2C090 + dword_267F2C090);
  return v6(a1, v4);
}

uint64_t sub_220C6E7C4()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_220C57EF4;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_267F2C0A0 + dword_267F2C0A0);
  return v5(v2, v3);
}

uint64_t sub_220C6E878()
{
  _Block_release(*(const void **)(v0 + 24));

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_220C6E8B8()
{
  char v2 = *(unsigned char *)(v0 + 16);
  uint64_t v4 = *(void **)(v0 + 24);
  uint64_t v3 = *(void **)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_220C57CA8;
  uint64_t v6 = (uint64_t (*)(char, void *, void *))((char *)&dword_267F2C0C0 + dword_267F2C0C0);
  return v6(v2, v4, v3);
}

uint64_t objectdestroyTm_0()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_220C6E9B8()
{
  char v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_220C57EF4;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_267F2C0E0 + dword_267F2C0E0);
  return v5(v2, v3);
}

uint64_t objectdestroy_25Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_220C6EAAC(uint64_t a1)
{
  return a1;
}

uint64_t sub_220C6EAD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_220C6EB3C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_220C57EF4;
  return sub_220C6C04C(a1, v4, v5, v6);
}

uint64_t sub_220C6EBF0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_220C6EC3C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_220C57EF4;
  return sub_220C6B038(a1, v4, v5, v6);
}

uint64_t sub_220C6ED3C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_220C6EDD0(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_220C6EE1C())()
{
  return j__swift_endAccess;
}

uint64_t sub_220C6EEC0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_requestState;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_220C6EF54(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_requestState);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_220C6EFA0())()
{
  return j_j__swift_endAccess;
}

id sub_220C6EFFC()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for GMEligibilityProvider()), sel_init);
  qword_26AD53210 = (uint64_t)result;
  return result;
}

id GMEligibilityProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id static GMEligibilityProvider.shared.getter()
{
  if (qword_26AD53290 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26AD53210;

  return v0;
}

void *sub_220C6F164()
{
  id v1 = (void **)(v0 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_220C6F214(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

void sub_220C6F268(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = (void **)(*a2 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = v2;
  id v5 = v2;
}

uint64_t (*sub_220C6F2CC())()
{
  return j_j__swift_endAccess;
}

uint64_t GMEligibilityProvider.gmSpecifierController.getter()
{
  return swift_unknownObjectRetain();
}

BOOL sub_220C6F3C8()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
  swift_beginAccess();
  return (sub_220C6F424(*v1, (uint64_t)&unk_26D2AA9A8) & 1) == 0;
}

uint64_t sub_220C6F424(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

id sub_220C6F4FC()
{
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
  swift_beginAccess();
  if (*v1 == 5) {
    return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_gmSpecifierController), sel_featureOptInStatus);
  }
  else {
    return 0;
  }
}

id sub_220C6F584()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_gmSpecifierController), sel_featureOptInStatus);
}

uint64_t sub_220C6F608()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
  swift_beginAccess();
  return sub_220C6F424(*v1, (uint64_t)&unk_26D2AA9D8) & 1;
}

char *GMEligibilityProvider.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility] = 0;
  *(void *)&v0[OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_requestState] = 0;
  *(void *)&v0[OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter] = 0;
  v0[OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_shouldForceDownloadIfNeededOnFetch] = 0;
  id v1 = objc_allocWithZone((Class)type metadata accessor for GMSpecifierController());
  uint64_t v2 = v0;
  id v3 = objc_msgSend(v1, sel_init);
  *(void *)&v2[OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_gmSpecifierController] = v3;

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for GMEligibilityProvider();
  uint64_t v4 = (char *)objc_msgSendSuper2(&v6, sel_init);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_gmSpecifierController], sel_setDelegate_, v4);
  return v4;
}

uint64_t type metadata accessor for GMEligibilityProvider()
{
  return self;
}

uint64_t sub_220C6F770(void *a1)
{
  *(unsigned char *)(v1 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_shouldForceDownloadIfNeededOnFetch) = 1;
  return sub_220C6F800(a1);
}

uint64_t sub_220C6F800(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53248);
  MEMORY[0x270FA5388](v4 - 8);
  objc_super v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AD53240 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_220C74920();
  __swift_project_value_buffer(v7, (uint64_t)qword_26AD53298);
  id v8 = a1;
  uint64_t v9 = sub_220C74900();
  os_log_type_t v10 = sub_220C74F40();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v22 = v2;
    char v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    *(_DWORD *)char v11 = 138412290;
    if (a1)
    {
      id v23 = v8;
      id v13 = v8;
    }
    else
    {
      id v23 = 0;
    }
    sub_220C74FD0();
    *uint64_t v12 = a1;

    _os_log_impl(&dword_220C23000, v9, v10, "Fetch status called with presenter. %@", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53250);
    swift_arrayDestroy();
    MEMORY[0x223C72360](v12, -1, -1);
    MEMORY[0x223C72360](v11, -1, -1);

    uint64_t v2 = v22;
  }
  else
  {
  }
  uint64_t v14 = (void **)&v2[OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter];
  swift_beginAccess();
  uint64_t v15 = *v14;
  char *v14 = a1;
  id v16 = v8;

  uint64_t v17 = sub_220C74EA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v6, 1, 1, v17);
  id v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v2;
  uint64_t v19 = v2;
  sub_220C5CE88((uint64_t)v6, (uint64_t)&unk_267F2C158, (uint64_t)v18);
  return swift_release();
}

uint64_t sub_220C6FAE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53248);
  v4[7] = swift_task_alloc();
  objc_super v6 = (void *)swift_task_alloc();
  v4[8] = v6;
  *objc_super v6 = v4;
  v6[1] = sub_220C6FBC8;
  v6[30] = a4;
  return MEMORY[0x270FA2498](sub_220C70104, 0, 0);
}

uint64_t sub_220C6FBC8()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_220C6FCC4, 0, 0);
}

uint64_t sub_220C6FCC4()
{
  uint64_t v19 = v0;
  uint64_t v1 = (void **)(v0[6] + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter);
  swift_beginAccess();
  uint64_t v2 = *v1;
  if (*v1)
  {
    uint64_t v3 = qword_26AD53240;
    id v4 = v2;
    if (v3 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_220C74920();
    __swift_project_value_buffer(v5, (uint64_t)qword_26AD53298);
    objc_super v6 = sub_220C74900();
    os_log_type_t v7 = sub_220C74F40();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v18 = v9;
      *(_DWORD *)uint64_t v8 = 136315138;
      v0[5] = sub_220C6043C(0xD000000000000017, 0x8000000220C80110, &v18);
      sub_220C74FD0();
      _os_log_impl(&dword_220C23000, v6, v7, "%s Attempt to reload specifiers.", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C72360](v9, -1, -1);
      MEMORY[0x223C72360](v8, -1, -1);
    }

    uint64_t v10 = v0[7];
    uint64_t v11 = sub_220C74EA0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
    sub_220C74E80();
    id v12 = v4;
    uint64_t v13 = sub_220C74E70();
    uint64_t v14 = (void *)swift_allocObject();
    uint64_t v15 = MEMORY[0x263F8F500];
    v14[2] = v13;
    v14[3] = v15;
    v14[4] = v12;
    sub_220C5CE88(v10, (uint64_t)&unk_267F2C198, (uint64_t)v14);

    swift_release();
  }
  swift_task_dealloc();
  id v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_220C6FF70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_220C74E80();
  *(void *)(v4 + 24) = sub_220C74E70();
  uint64_t v6 = sub_220C74E50();
  return MEMORY[0x270FA2498](sub_220C70008, v6, v5);
}

uint64_t sub_220C70008()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_release();
  objc_msgSend(v1, sel_reloadSpecifiers);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_220C700E4()
{
  *(void *)(v1 + 240) = v0;
  return MEMORY[0x270FA2498](sub_220C70104, 0, 0);
}

uint64_t sub_220C70104()
{
  uint64_t v1 = v0[30];
  uint64_t v2 = OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility;
  v0[31] = OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility;
  uint64_t v3 = (uint64_t *)(v1 + v2);
  swift_beginAccess();
  uint64_t v4 = *v3;
  v0[32] = *v3;
  if (v4 == 18)
  {
LABEL_8:
    id v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
  uint64_t v5 = v0[30];
  uint64_t v6 = OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_requestState;
  v0[33] = OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_requestState;
  os_log_type_t v7 = (void *)(v5 + v6);
  swift_beginAccess();
  if (*v7 == 1)
  {
    if (qword_26AD53240 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_220C74920();
    __swift_project_value_buffer(v8, (uint64_t)qword_26AD53298);
    uint64_t v9 = sub_220C74900();
    os_log_type_t v10 = sub_220C74F60();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_220C23000, v9, v10, "Enrollment request is already in progress. Bailing.", v11, 2u);
      MEMORY[0x223C72360](v11, -1, -1);
    }

    goto LABEL_8;
  }
  uint64_t v14 = v0[30];
  *os_log_type_t v7 = 1;
  uint64_t v15 = v0 + 29;
  id v16 = *(void **)(v14 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_gmSpecifierController);
  if (*(unsigned char *)(v14
                + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_shouldForceDownloadIfNeededOnFetch) == 1)
  {
    uint64_t v17 = v0 + 2;
    v0[2] = v0;
    v0[7] = v15;
    v0[3] = sub_220C7041C;
    uint64_t v18 = swift_continuation_init();
    v0[18] = MEMORY[0x263EF8330];
    v0[19] = 0x40000000;
    v0[20] = sub_220C70930;
    v0[21] = &block_descriptor_20;
    v0[22] = v18;
    objc_msgSend(v16, sel_fetchStatusWithForceDownloadIfNeeded_completionHandler_, 1, v0 + 18);
  }
  else
  {
    uint64_t v17 = v0 + 10;
    v0[10] = v0;
    v0[15] = v15;
    v0[11] = sub_220C70850;
    uint64_t v19 = swift_continuation_init();
    v0[18] = MEMORY[0x263EF8330];
    v0[19] = 0x40000000;
    v0[20] = sub_220C70930;
    v0[21] = &block_descriptor_2;
    v0[22] = v19;
    objc_msgSend(v16, sel_fetchStatusWithCompletionHandler_, v0 + 18);
  }
  return MEMORY[0x270FA23F0](v17);
}

uint64_t sub_220C7041C()
{
  return MEMORY[0x270FA2498](sub_220C704FC, 0, 0);
}

uint64_t sub_220C704FC()
{
  uint64_t v21 = v0;
  uint64_t v1 = v0[29];
  *(void *)(v0[30] + v0[33]) = 2;
  if (qword_26AD53240 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_220C74920();
  __swift_project_value_buffer(v2, (uint64_t)qword_26AD53298);
  uint64_t v3 = sub_220C74900();
  os_log_type_t v4 = sub_220C74F40();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = v0[32];
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315650;
    uint64_t v20 = v7;
    v0[18] = sub_220C6043C(0xD000000000000011, 0x8000000220C800F0, &v20);
    sub_220C74FD0();
    *(_WORD *)(v6 + 12) = 2080;
    unint64_t v8 = GMEligibilityContext.description.getter(v5);
    v0[18] = sub_220C6043C(v8, v9, &v20);
    sub_220C74FD0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 22) = 2080;
    unint64_t v10 = GMEligibilityContext.description.getter(v1);
    v0[18] = sub_220C6043C(v10, v11, &v20);
    sub_220C74FD0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_220C23000, v3, v4, "%s Previous Status: %s New Status: %s", (uint8_t *)v6, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x223C72360](v7, -1, -1);
    MEMORY[0x223C72360](v6, -1, -1);
  }

  if (v1 != v0[32])
  {
    *(void *)(v0[30] + v0[31]) = v1;
    id v12 = sub_220C74900();
    os_log_type_t v13 = sub_220C74F60();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v20 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      unint64_t v16 = GMEligibilityContext.description.getter(v1);
      v0[18] = sub_220C6043C(v16, v17, &v20);
      sub_220C74FD0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_220C23000, v12, v13, "Status: %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C72360](v15, -1, -1);
      MEMORY[0x223C72360](v14, -1, -1);
    }
  }
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_220C70850()
{
  return MEMORY[0x270FA2498](sub_220C71E54, 0, 0);
}

uint64_t sub_220C70930(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return MEMORY[0x270FA2400]();
}

void sub_220C70954(uint64_t a1)
{
  uint64_t v2 = v1;
  v38[3] = *MEMORY[0x263EF8340];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53248);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AD53240 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_220C74920();
  uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)qword_26AD53298);
  unint64_t v9 = v2;
  unint64_t v10 = sub_220C74900();
  os_log_type_t v11 = sub_220C74F60();
  if (os_log_type_enabled(v10, v11))
  {
    v32[1] = v8;
    uint64_t v34 = v6;
    uint64_t v12 = swift_slowAlloc();
    os_log_type_t v13 = (void *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    v38[0] = v14;
    *(_DWORD *)uint64_t v12 = 136315650;
    uint64_t v37 = sub_220C6043C(0xD000000000000010, 0x8000000220C7FE80, v38);
    sub_220C74FD0();
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v33 = a1;
    unint64_t v15 = GMEligibilityContext.description.getter(a1);
    uint64_t v37 = sub_220C6043C(v15, v16, v38);
    sub_220C74FD0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 22) = 2112;
    unint64_t v17 = (void **)&v9[OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter];
    swift_beginAccess();
    uint64_t v18 = *v17;
    if (*v17)
    {
      uint64_t v37 = (uint64_t)*v17;
      id v19 = v18;
    }
    else
    {
      uint64_t v37 = 0;
    }
    sub_220C74FD0();
    *os_log_type_t v13 = v18;

    _os_log_impl(&dword_220C23000, v10, v11, "%s Updating eligibility with %s do we have a presenter? %@", (uint8_t *)v12, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53250);
    swift_arrayDestroy();
    MEMORY[0x223C72360](v13, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x223C72360](v14, -1, -1);
    MEMORY[0x223C72360](v12, -1, -1);

    a1 = v33;
    uint64_t v6 = v34;
  }
  else
  {
  }
  uint64_t v20 = (uint64_t *)&v9[OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility];
  swift_beginAccess();
  *uint64_t v20 = a1;
  uint64_t v21 = (id *)&v9[OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter];
  swift_beginAccess();
  if (*v21)
  {
    id v22 = *v21;
    id v23 = sub_220C74900();
    os_log_type_t v24 = sub_220C74F40();
    if (os_log_type_enabled(v23, v24))
    {
      unint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v36 = v26;
      *(_DWORD *)unint64_t v25 = 136315138;
      uint64_t v35 = sub_220C6043C(0xD000000000000010, 0x8000000220C7FE80, &v36);
      sub_220C74FD0();
      _os_log_impl(&dword_220C23000, v23, v24, "%s Attempting to reload specifiers.", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C72360](v26, -1, -1);
      MEMORY[0x223C72360](v25, -1, -1);
    }

    uint64_t v27 = sub_220C74EA0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v6, 1, 1, v27);
    sub_220C74E80();
    id v28 = v22;
    uint64_t v29 = sub_220C74E70();
    uint64_t v30 = (void *)swift_allocObject();
    uint64_t v31 = MEMORY[0x263F8F500];
    v30[2] = v29;
    v30[3] = v31;
    v30[4] = v28;
    sub_220C5CE88((uint64_t)v6, (uint64_t)&unk_267F2C168, (uint64_t)v30);
    swift_release();
  }
}

uint64_t sub_220C70E68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_220C74E80();
  *(void *)(v4 + 24) = sub_220C74E70();
  uint64_t v6 = sub_220C74E50();
  return MEMORY[0x270FA2498](sub_220C71E4C, v6, v5);
}

void sub_220C70F54()
{
  uint64_t v1 = v0;
  v33[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53248);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AD53240 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_220C74920();
  uint64_t v6 = __swift_project_value_buffer(v5, (uint64_t)qword_26AD53298);
  uint64_t v7 = v1;
  uint64_t v8 = sub_220C74900();
  os_log_type_t v9 = sub_220C74F60();
  unint64_t v10 = &unk_267F2C000;
  if (os_log_type_enabled(v8, v9))
  {
    v28[1] = v6;
    uint64_t v29 = v4;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    v33[0] = v13;
    *(_DWORD *)uint64_t v11 = 136315394;
    uint64_t v31 = sub_220C6043C(0xD000000000000010, 0x8000000220C7FEA0, v33);
    sub_220C74FD0();
    *(_WORD *)(v11 + 12) = 2112;
    uint64_t v14 = (void **)&v7[OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter];
    swift_beginAccess();
    unint64_t v15 = *v14;
    if (*v14)
    {
      uint64_t v32 = (uint64_t)*v14;
      id v16 = v15;
      unint64_t v10 = (void *)&unk_267F2C000;
    }
    else
    {
      uint64_t v32 = 0;
    }
    sub_220C74FD0();
    *uint64_t v12 = v15;

    _os_log_impl(&dword_220C23000, v8, v9, "%s Fetching ADM waitlist status do we have a presenter? %@", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD53250);
    swift_arrayDestroy();
    MEMORY[0x223C72360](v12, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x223C72360](v13, -1, -1);
    MEMORY[0x223C72360](v11, -1, -1);

    uint64_t v4 = v29;
  }
  else
  {
  }
  unint64_t v17 = (id *)&v7[v10[39]];
  swift_beginAccess();
  if (*v17)
  {
    id v18 = *v17;
    id v19 = sub_220C74900();
    os_log_type_t v20 = sub_220C74F40();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v32 = v22;
      *(_DWORD *)uint64_t v21 = 136315138;
      uint64_t v30 = sub_220C6043C(0xD000000000000010, 0x8000000220C7FEA0, &v32);
      sub_220C74FD0();
      _os_log_impl(&dword_220C23000, v19, v20, "%s Attempting to fetch current waitlist status and reload image creation specifier.", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C72360](v22, -1, -1);
      MEMORY[0x223C72360](v21, -1, -1);
    }

    uint64_t v23 = sub_220C74EA0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v4, 1, 1, v23);
    sub_220C74E80();
    id v24 = v18;
    uint64_t v25 = sub_220C74E70();
    uint64_t v26 = (void *)swift_allocObject();
    uint64_t v27 = MEMORY[0x263F8F500];
    v26[2] = v25;
    v26[3] = v27;
    v26[4] = v24;
    sub_220C5CE88((uint64_t)v4, (uint64_t)aVe, (uint64_t)v26);
    swift_release();
  }
}

uint64_t sub_220C713FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_220C74E80();
  *(void *)(v4 + 24) = sub_220C74E70();
  uint64_t v6 = sub_220C74E50();
  return MEMORY[0x270FA2498](sub_220C71494, v6, v5);
}

uint64_t sub_220C71494()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_release();
  uint64_t v2 = (void *)sub_220C74DD0();
  objc_msgSend(v1, sel_reloadSpecifierID_, v2);

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

id GMEligibilityProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GMEligibilityProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t GMRequestState.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

uint64_t *sub_220C71610@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

uint64_t sub_220C71630(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_220C57CA8;
  return sub_220C6FAE8(a1, v4, v5, v6);
}

uint64_t sub_220C716E8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_220C57EF4;
  return sub_220C70E68(a1, v4, v5, v6);
}

uint64_t sub_220C717A0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_220C57EF4;
  return sub_220C713FC(a1, v4, v5, v6);
}

unint64_t sub_220C71858()
{
  unint64_t result = qword_267F2C180;
  if (!qword_267F2C180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_267F2C180);
  }
  return result;
}

uint64_t sub_220C718AC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility, a2);
}

uint64_t sub_220C718B8(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
}

uint64_t sub_220C718C4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_requestState, a2);
}

uint64_t keypath_getTm@<X0>(void *a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  uint64_t v4 = (void *)(*a1 + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_220C71920(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_requestState);
}

uint64_t keypath_setTm(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *a1;
  uint64_t v6 = (void *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  *uint64_t v6 = v5;
  return result;
}

id sub_220C71978@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  BOOL v3 = (void **)(*a1 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;

  return v4;
}

uint64_t method lookup function for GMEligibilityProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GMEligibilityProvider);
}

uint64_t dispatch thunk of GMEligibilityProvider.eligibility.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of GMEligibilityProvider.eligibility.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of GMEligibilityProvider.eligibility.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of GMEligibilityProvider.requestState.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of GMEligibilityProvider.requestState.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of GMEligibilityProvider.requestState.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of GMEligibilityProvider.presenter.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of GMEligibilityProvider.presenter.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of GMEligibilityProvider.presenter.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of GMEligibilityProvider.deviceSupported.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of GMEligibilityProvider.activeEnabled.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of GMEligibilityProvider.optedIn.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of GMEligibilityProvider.onWaitlist.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of GMEligibilityProvider.fetchStatusAndForceDownloadIfNeeded(presenter:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of GMEligibilityProvider.fetchStatus(presenter:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of GMEligibilityProvider.update(context:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of GMEligibilityProvider.updateADMState()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

ValueMetadata *type metadata accessor for GMRequestState()
{
  return &type metadata for GMRequestState;
}

uint64_t sub_220C71D98(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_220C57EF4;
  return sub_220C6FF70(a1, v4, v5, v6);
}

ValueMetadata *type metadata accessor for AppleIntelligenceTip()
{
  return &type metadata for AppleIntelligenceTip;
}

unint64_t sub_220C71E68()
{
  return 0xD00000000000001DLL;
}

uint64_t sub_220C71E84()
{
  type metadata accessor for GMFooterUtility();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);

  return MEMORY[0x270F04738](0xD000000000000015, 0x8000000220C80240, v1);
}

uint64_t sub_220C71F00()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BDA8);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  BOOL v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_220C74AB0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267F2BA98 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v0, (uint64_t)qword_267F2D3E0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v8, v0);
  sub_220C74AC0();
  sub_220C74990();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v9 = sub_220C749A0();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_220C720F8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BD98);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  BOOL v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_220C749E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BDA0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220C749F0();
  uint64_t v12 = MEMORY[0x263F1C010];
  MEMORY[0x223C70F20](v7, v4, MEMORY[0x263F1C010]);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v16 = v4;
  uint64_t v17 = v12;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  MEMORY[0x223C70F40](v11, v8, OpaqueTypeConformance2);
  uint64_t v16 = v8;
  uint64_t v17 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v14 = sub_220C749C0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v14;
}

void sub_220C72394(void *a1@<X8>)
{
  *a1 = 0xD00000000000001DLL;
  a1[1] = 0x8000000220C80260;
}

unint64_t sub_220C723B8()
{
  unint64_t result = qword_267F2C1A0;
  if (!qword_267F2C1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F2C1A0);
  }
  return result;
}

uint64_t sub_220C7240C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BDA8);
  __swift_allocate_value_buffer(v0, qword_267F2D3E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_267F2D3E0);
  if (qword_26AD53290 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26AD53210;
  uint64_t v2 = (void *)(qword_26AD53210 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
  swift_beginAccess();
  if (*v2 == 5) {
    objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_gmSpecifierController), sel_featureOptInStatus);
  }
  return sub_220C74AF0();
}

uint64_t sub_220C7254C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void __getAnalyticsSendEventLazySymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *CoreAnalyticsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AssistantVoiceMetrics.m", 19, @"%s", *a1);

  __break(1u);
}

void __getPETEventPropertyClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPETEventPropertyClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AssistantMetrics.m", 39, @"Unable to find class %s", "PETEventProperty");

  __break(1u);
}

void ProactiveEventTrackerLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *ProactiveEventTrackerLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AssistantMetrics.m", 37, @"%s", *a1);

  __break(1u);
}

void __getPETScalarEventTrackerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getPETScalarEventTrackerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AssistantMetrics.m", 42, @"Unable to find class %s", "PETScalarEventTracker");

  __break(1u);
}

void __getVTUIGMEnrollmentViewControllerClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *VoiceTriggerUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"GMSpecifierProvider.m", 23, @"%s", *a1);

  __break(1u);
}

void __getVTUIGMEnrollmentViewControllerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getVTUIGMEnrollmentViewControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"GMSpecifierProvider.m", 24, @"Unable to find class %s", "VTUIGMEnrollmentViewController");

  __break(1u);
}

void __getVTUIEnrollTrainingViewControllerClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *VoiceTriggerUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AssistantActivationController.m", 28, @"%s", *a1);

  __break(1u);
}

void __getVTUIEnrollTrainingViewControllerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getVTUIEnrollTrainingViewControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AssistantActivationController.m", 29, @"Unable to find class %s", "VTUIEnrollTrainingViewController");

  __break(1u);
}

void __getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *SpringBoardServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ASTLockScreenSuggestionSpecifier.m", 17, @"%s", *a1);

  __break(1u);
}

void __getCKKnowledgeStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCKKnowledgeStoreClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AssistantLanguageController.m", 37, @"Unable to find class %s", "CKKnowledgeStore");

  __break(1u);
}

void CoreKnowledgeLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *CoreKnowledgeLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AssistantLanguageController.m", 34, @"%s", *a1);

  __break(1u);
}

void __getCKPermanentEventStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCKPermanentEventStoreClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AssistantLanguageController.m", 39, @"Unable to find class %s", "CKPermanentEventStore");

  __break(1u);
}

void __getCKEventClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCKEventClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AssistantLanguageController.m", 35, @"Unable to find class %s", "CKEvent");

  __break(1u);
}

void __getCKKnowledgeStoreClass_block_invoke_cold_1_0()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCKKnowledgeStoreClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AssistantVoiceController.m", 39, @"Unable to find class %s", "CKKnowledgeStore");

  __break(1u);
}

void CoreKnowledgeLibrary_cold_1_0(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *CoreKnowledgeLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AssistantVoiceController.m", 36, @"%s", *a1);

  __break(1u);
}

void __getCKPermanentEventStoreClass_block_invoke_cold_1_0()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCKPermanentEventStoreClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AssistantVoiceController.m", 41, @"Unable to find class %s", "CKPermanentEventStore");

  __break(1u);
}

void __getCKEventClass_block_invoke_cold_1_0()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCKEventClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AssistantVoiceController.m", 37, @"Unable to find class %s", "CKEvent");

  __break(1u);
}

void getNRDevicePropertySystemVersion_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertySystemVersion(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AssistantController.m", 133, @"%s", dlerror());

  __break(1u);
}

void __getVTUISiriDataSharingOptInPresenterClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getVTUISiriDataSharingOptInPresenterClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AssistantController.m", 124, @"Unable to find class %s", "VTUISiriDataSharingOptInPresenter");

  __break(1u);
}

void VoiceTriggerUILibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *VoiceTriggerUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AssistantController.m", 121, @"%s", *a1);

  __break(1u);
}

void __getNRPairedDeviceRegistryClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getNRPairedDeviceRegistryClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AssistantController.m", 131, @"Unable to find class %s", "NRPairedDeviceRegistry");

  __break(1u);
}

void NanoRegistryLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *NanoRegistryLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AssistantController.m", 130, @"%s", *a1);

  __break(1u);
}

void __getBYFlowSkipControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getBYFlowSkipControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AssistantController.m", 142, @"Unable to find class %s", "BYFlowSkipController");

  __break(1u);
}

void SetupAssistantLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *SetupAssistantLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AssistantController.m", 141, @"%s", *a1);

  __break(1u);
}

void __getVTUIVoiceSelectionViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getVTUIVoiceSelectionViewControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AssistantController.m", 126, @"Unable to find class %s", "VTUIVoiceSelectionViewController");

  __break(1u);
}

void __getVTUIEnrollTrainingViewControllerClass_block_invoke_cold_1_0()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getVTUIEnrollTrainingViewControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AssistantController.m", 122, @"Unable to find class %s", "VTUIEnrollTrainingViewController");

  __break(1u);
}

void SearchLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  BOOL v3 = [NSString stringWithUTF8String:"void *SearchLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AssistantAppsSettingsController.m", 31, @"%s", *a1);

  __break(1u);
  sub_220C74540();
}

uint64_t sub_220C74540()
{
  return MEMORY[0x270EFEAC8]();
}

uint64_t sub_220C74550()
{
  return MEMORY[0x270EEEB18]();
}

uint64_t sub_220C74560()
{
  return MEMORY[0x270EEEB40]();
}

uint64_t sub_220C74570()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_220C74580()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_220C74590()
{
  return MEMORY[0x270EEF750]();
}

uint64_t sub_220C745A0()
{
  return MEMORY[0x270EFEB28]();
}

uint64_t sub_220C745B0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_220C745C0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_220C745D0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_220C745E0()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_220C745F0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_220C74600()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_220C74610()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_220C74620()
{
  return MEMORY[0x270EF0E30]();
}

uint64_t sub_220C74630()
{
  return MEMORY[0x270EF0F48]();
}

uint64_t sub_220C74640()
{
  return MEMORY[0x270EF0F70]();
}

uint64_t sub_220C74650()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_220C74660()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_220C74670()
{
  return MEMORY[0x270EF1050]();
}

uint64_t sub_220C74680()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_220C74690()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_220C746A0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_220C746B0()
{
  return MEMORY[0x270F4BC78]();
}

uint64_t sub_220C746C0()
{
  return MEMORY[0x270F4BC98]();
}

uint64_t sub_220C746D0()
{
  return MEMORY[0x270F4BCA0]();
}

uint64_t sub_220C746E0()
{
  return MEMORY[0x270F2F860]();
}

uint64_t sub_220C746F0()
{
  return MEMORY[0x270F2F898]();
}

uint64_t sub_220C74700()
{
  return MEMORY[0x270F2F8B0]();
}

uint64_t sub_220C74710()
{
  return MEMORY[0x270F2F8C8]();
}

uint64_t sub_220C74720()
{
  return MEMORY[0x270F2F900]();
}

uint64_t sub_220C74730()
{
  return MEMORY[0x270F2F910]();
}

uint64_t sub_220C74740()
{
  return MEMORY[0x270F2F920]();
}

uint64_t sub_220C74750()
{
  return MEMORY[0x270F2F928]();
}

uint64_t sub_220C74760()
{
  return MEMORY[0x270F2F948]();
}

uint64_t sub_220C74770()
{
  return MEMORY[0x270F2F950]();
}

uint64_t sub_220C74780()
{
  return MEMORY[0x270F2F990]();
}

uint64_t sub_220C74790()
{
  return MEMORY[0x270F2F9A8]();
}

uint64_t sub_220C747A0()
{
  return MEMORY[0x270F2F9C8]();
}

uint64_t sub_220C747B0()
{
  return MEMORY[0x270F2F9D0]();
}

uint64_t sub_220C747C0()
{
  return MEMORY[0x270F2F9D8]();
}

uint64_t sub_220C747D0()
{
  return MEMORY[0x270F2FA58]();
}

uint64_t sub_220C747E0()
{
  return MEMORY[0x270F2FA78]();
}

uint64_t sub_220C747F0()
{
  return MEMORY[0x270F2FA88]();
}

uint64_t sub_220C74800()
{
  return MEMORY[0x270F2FA98]();
}

uint64_t sub_220C74810()
{
  return MEMORY[0x270F87508]();
}

uint64_t sub_220C74820()
{
  return MEMORY[0x270F16D98]();
}

uint64_t sub_220C74830()
{
  return MEMORY[0x270F16DA0]();
}

uint64_t sub_220C74840()
{
  return MEMORY[0x270F16DA8]();
}

uint64_t sub_220C74850()
{
  return MEMORY[0x270F16DB0]();
}

uint64_t sub_220C74860()
{
  return MEMORY[0x270F16DB8]();
}

uint64_t sub_220C74870()
{
  return MEMORY[0x270F16DF0]();
}

uint64_t sub_220C74880()
{
  return MEMORY[0x270F16DF8]();
}

uint64_t sub_220C74890()
{
  return MEMORY[0x270F16E00]();
}

uint64_t sub_220C748A0()
{
  return MEMORY[0x270F16E08]();
}

uint64_t sub_220C748B0()
{
  return MEMORY[0x270F16E10]();
}

uint64_t sub_220C748C0()
{
  return MEMORY[0x270F16E20]();
}

uint64_t sub_220C748D0()
{
  return MEMORY[0x270F16E38]();
}

uint64_t sub_220C748E0()
{
  return MEMORY[0x270F2ECA8]();
}

uint64_t sub_220C748F0()
{
  return MEMORY[0x270F2ECB0]();
}

uint64_t sub_220C74900()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_220C74910()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_220C74920()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_220C74930()
{
  return MEMORY[0x270F05B48]();
}

uint64_t sub_220C74940()
{
  return MEMORY[0x270F05B70]();
}

uint64_t sub_220C74950()
{
  return MEMORY[0x270F05B78]();
}

uint64_t sub_220C74960()
{
  return MEMORY[0x270F05B80]();
}

uint64_t sub_220C74970()
{
  return MEMORY[0x270F05B88]();
}

uint64_t sub_220C74980()
{
  return MEMORY[0x270F05BB8]();
}

uint64_t sub_220C74990()
{
  return MEMORY[0x270F05BE0]();
}

uint64_t sub_220C749A0()
{
  return MEMORY[0x270F05BF0]();
}

uint64_t sub_220C749B0()
{
  return MEMORY[0x270F05C30]();
}

uint64_t sub_220C749C0()
{
  return MEMORY[0x270F05C38]();
}

uint64_t sub_220C749D0()
{
  return MEMORY[0x270F05C48]();
}

uint64_t sub_220C749E0()
{
  return MEMORY[0x270F05C78]();
}

uint64_t sub_220C749F0()
{
  return MEMORY[0x270F05C80]();
}

uint64_t sub_220C74A00()
{
  return MEMORY[0x270F05C88]();
}

uint64_t sub_220C74A10()
{
  return MEMORY[0x270F05C90]();
}

uint64_t sub_220C74A20()
{
  return MEMORY[0x270F05C98]();
}

uint64_t sub_220C74A30()
{
  return MEMORY[0x270F05CA0]();
}

uint64_t sub_220C74A40()
{
  return MEMORY[0x270F05CA8]();
}

uint64_t sub_220C74A50()
{
  return MEMORY[0x270F05CB8]();
}

uint64_t sub_220C74A60()
{
  return MEMORY[0x270F05CC0]();
}

uint64_t sub_220C74A70()
{
  return MEMORY[0x270F05CD0]();
}

uint64_t sub_220C74A80()
{
  return MEMORY[0x270F05CD8]();
}

uint64_t sub_220C74A90()
{
  return MEMORY[0x270F05CE0]();
}

uint64_t sub_220C74AA0()
{
  return MEMORY[0x270F05CE8]();
}

uint64_t sub_220C74AB0()
{
  return MEMORY[0x270F05D00]();
}

uint64_t sub_220C74AC0()
{
  return MEMORY[0x270F05D10]();
}

uint64_t sub_220C74AD0()
{
  return MEMORY[0x270F05D58]();
}

uint64_t sub_220C74AE0()
{
  return MEMORY[0x270F05D60]();
}

uint64_t sub_220C74AF0()
{
  return MEMORY[0x270F05D78]();
}

uint64_t sub_220C74B00()
{
  return MEMORY[0x270F05D80]();
}

uint64_t sub_220C74B10()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_220C74B20()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_220C74B30()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_220C74B40()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_220C74B50()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_220C74B60()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_220C74B70()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_220C74B80()
{
  return MEMORY[0x270F01E18]();
}

uint64_t sub_220C74B90()
{
  return MEMORY[0x270F01E28]();
}

uint64_t sub_220C74BA0()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_220C74BB0()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_220C74BC0()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_220C74BD0()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_220C74BE0()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_220C74BF0()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_220C74C00()
{
  return MEMORY[0x270F02F80]();
}

uint64_t sub_220C74C10()
{
  return MEMORY[0x270F02F90]();
}

uint64_t sub_220C74C20()
{
  return MEMORY[0x270F02F98]();
}

uint64_t sub_220C74C30()
{
  return MEMORY[0x270F02FA0]();
}

uint64_t sub_220C74C40()
{
  return MEMORY[0x270F02FA8]();
}

uint64_t sub_220C74C50()
{
  return MEMORY[0x270F02FB0]();
}

uint64_t sub_220C74C60()
{
  return MEMORY[0x270F02FC0]();
}

uint64_t sub_220C74C70()
{
  return MEMORY[0x270F02FC8]();
}

uint64_t sub_220C74C80()
{
  return MEMORY[0x270F02FD0]();
}

uint64_t sub_220C74C90()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_220C74CA0()
{
  return MEMORY[0x270F05DA0]();
}

uint64_t sub_220C74CB0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_220C74CC0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_220C74CD0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_220C74CE0()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_220C74CF0()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_220C74D00()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_220C74D20()
{
  return MEMORY[0x270F05048]();
}

uint64_t sub_220C74D30()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_220C74D40()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_220C74D50()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_220C74D60()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_220C74D70()
{
  return MEMORY[0x270F5D0D0]();
}

uint64_t sub_220C74D80()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_220C74D90()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_220C74DA0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_220C74DB0()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_220C74DC0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_220C74DD0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_220C74DE0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_220C74DF0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_220C74E00()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_220C74E10()
{
  return MEMORY[0x270EF1A38]();
}

uint64_t sub_220C74E20()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_220C74E30()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_220C74E40()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_220C74E50()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_220C74E70()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_220C74E80()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_220C74E90()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_220C74EA0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_220C74EB0()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t sub_220C74EC0()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_220C74ED0()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_220C74EE0()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_220C74F00()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_220C74F10()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_220C74F20()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_220C74F30()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_220C74F40()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_220C74F50()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_220C74F60()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_220C74F70()
{
  return MEMORY[0x270F824A0]();
}

uint64_t sub_220C74F80()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_220C74F90()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_220C74FA0()
{
  return MEMORY[0x270EF2170]();
}

uint64_t sub_220C74FB0()
{
  return MEMORY[0x270EF2210]();
}

uint64_t sub_220C74FC0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_220C74FD0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_220C74FE0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_220C74FF0()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_220C75010()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_220C75020()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_220C75030()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_220C75040()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_220C75050()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_220C75060()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_220C75070()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_220C75080()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_220C75090()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_220C750A0()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_220C750B0()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_220C750C0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_220C750D0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_220C750E0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_220C750F0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_220C75100()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_220C75120()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_220C75140()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_220C75150()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_220C75160()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_220C75170()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_220C75190()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_220C751A0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_220C751B0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_220C751C0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_220C751D0()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x270F0B6B0]();
}

uint64_t AFAssistantRestricted()
{
  return MEMORY[0x270F0EC38]();
}

uint64_t AFDeviceSupportsANE()
{
  return MEMORY[0x270F0ECA0]();
}

uint64_t AFDeviceSupportsEchoCancellation()
{
  return MEMORY[0x270F0ECB0]();
}

uint64_t AFGryphonAssetsExistForLanguage()
{
  return MEMORY[0x270F0ED58]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x270F0EDD0]();
}

uint64_t AFMontaraRestricted()
{
  return MEMORY[0x270F0EE38]();
}

uint64_t AFOutputVoiceLanguageForRecognitionLanguage()
{
  return MEMORY[0x270F0EE78]();
}

uint64_t AFPreferencesSupportedLanguages()
{
  return MEMORY[0x270F0EEB8]();
}

uint64_t AFSiriDataSharingOptInStatusGetName()
{
  return MEMORY[0x270F0EF60]();
}

uint64_t AFSupportsSiriInCall()
{
  return MEMORY[0x270F0EFB0]();
}

uint64_t AFVoiceGenderGetName()
{
  return MEMORY[0x270F0EFE8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x270EE4548](bundle);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x270EE45B8](allocator, bundleURL);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x270EE45C8](bundleID);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x270EE45E8](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x270EE45F0](bundle);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
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

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t PSApplicationSpecifierForAssistantSection()
{
  return MEMORY[0x270F551C8]();
}

uint64_t PSBundlePathForPreferenceBundle()
{
  return MEMORY[0x270F551E8]();
}

uint64_t PSResetCachedSiriKitTCCEnabledAppIds()
{
  return MEMORY[0x270F552D0]();
}

uint64_t PSTableSectionFooterBottomPad()
{
  return MEMORY[0x270F55318]();
}

uint64_t PSTextViewInsets()
{
  return MEMORY[0x270F55328]();
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return MEMORY[0x270F5D188]();
}

uint64_t TCCAccessCopyInformation()
{
  return MEMORY[0x270F795C0]();
}

uint64_t TCCAccessSetForBundle()
{
  return MEMORY[0x270F79658]();
}

uint64_t VSPreferencesSetSpokenLanguageIdentifier()
{
  return MEMORY[0x270F84540]();
}

uint64_t _AXSHomeButtonAssistant()
{
  return MEMORY[0x270F90830]();
}

uint64_t _AXSSetHomeButtonAssistant()
{
  return MEMORY[0x270F90A30]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
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

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint64_t nw_path_create_default_evaluator()
{
  return MEMORY[0x270EF87D8]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x270EF8810]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x270EF8928](path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x270EF89B8](path);
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x270EF8A58](path, *(void *)&interface_type);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}