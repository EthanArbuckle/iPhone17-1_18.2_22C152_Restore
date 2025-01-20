void sub_235C01BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235C01FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235C023F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_235C0280C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235C02D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235C02FCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235C04410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235C05D44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235C062D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235C0847C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235C08D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235C0C718(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_235C115A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_235C19D14(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

Class __getBKUIPearlEnrollControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!BiometricKitUILibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __BiometricKitUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264C6F0C8;
    uint64_t v5 = 0;
    BiometricKitUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!BiometricKitUILibraryCore_frameworkLibrary) {
    __getBKUIPearlEnrollControllerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("BKUIPearlEnrollController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBKUIPearlEnrollControllerClass_block_invoke_cold_2();
  }
  getBKUIPearlEnrollControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __BiometricKitUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BiometricKitUILibraryCore_frameworkLibrary = result;
  return result;
}

void sub_235C1C680(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

id DSUIBundle()
{
  if (DSUIBundle_onceToken != -1) {
    dispatch_once(&DSUIBundle_onceToken, &__block_literal_global_12);
  }
  v0 = (void *)DSUIBundle__Bundle;
  return v0;
}

uint64_t __DSUIBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v1 = DSUIBundle__Bundle;
  DSUIBundle__Bundle = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

__CFString *DSUIFeatureTable()
{
  return @"DigitalSeparationUI-SYDRO_FEATURES";
}

id DSUILocStringForKey(void *a1)
{
  id v1 = a1;
  uint64_t v2 = DSUIBundle();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:v1 table:@"DigitalSeparationUI"];

  return v3;
}

id DSUIDTOLocStringForKey(void *a1)
{
  id v1 = a1;
  uint64_t v2 = DSUIBundle();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:v1 table:@"DigitalSeparationUI_DTO"];

  return v3;
}

id DSUILocStringForKeyInTable(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = DSUIBundle();
  uint64_t v6 = [v5 localizedStringForKey:v4 value:v4 table:v3];

  return v6;
}

id DSUILocAttributedStringForKey(void *a1)
{
  id v1 = a1;
  uint64_t v2 = DSUIBundle();
  id v3 = [v2 localizedAttributedStringForKey:v1 value:v1 table:@"DigitalSeparationUI"];

  return v3;
}

id sharedWorkQueue()
{
  if (sharedWorkQueue_onceToken != -1) {
    dispatch_once(&sharedWorkQueue_onceToken, &__block_literal_global_298);
  }
  uint64_t v0 = (void *)sharedWorkQueue__sharedWorkQueue;
  return v0;
}

uint64_t __sharedWorkQueue_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("DSUtilitiesBackgroundQueue", 0);
  uint64_t v1 = sharedWorkQueue__sharedWorkQueue;
  sharedWorkQueue__sharedWorkQueue = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_235C1DEF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_235C1E170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBKUIPeriocularEnableSplashViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!BiometricKitUILibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __BiometricKitUILibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264C6F178;
    uint64_t v5 = 0;
    BiometricKitUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!BiometricKitUILibraryCore_frameworkLibrary_0) {
    __getBKUIPearlEnrollControllerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("BKUIPeriocularEnableSplashViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBKUIPeriocularEnableSplashViewControllerClass_block_invoke_cold_2();
  }
  getBKUIPeriocularEnableSplashViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __BiometricKitUILibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  BiometricKitUILibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getCIDVUIBiometricBindingFlowManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!CoreIDVUILibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __CoreIDVUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264C6F190;
    uint64_t v5 = 0;
    CoreIDVUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreIDVUILibraryCore_frameworkLibrary) {
    __getCIDVUIBiometricBindingFlowManagerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CIDVUIBiometricBindingFlowManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCIDVUIBiometricBindingFlowManagerClass_block_invoke_cold_2();
  }
  getCIDVUIBiometricBindingFlowManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreIDVUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreIDVUILibraryCore_frameworkLibrary = result;
  return result;
}

void sub_235C20380(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

Class __getBiometricKitUIClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!BiometricKitUILibraryCore_frameworkLibrary_1)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __BiometricKitUILibraryCore_block_invoke_1;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264C6F1F8;
    uint64_t v5 = 0;
    BiometricKitUILibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!BiometricKitUILibraryCore_frameworkLibrary_1) {
    __getBiometricKitUIClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("BiometricKitUI");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBiometricKitUIClass_block_invoke_cold_2();
  }
  getBiometricKitUIClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __BiometricKitUILibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  BiometricKitUILibraryCore_frameworkLibrary_1 = result;
  return result;
}

void sub_235C27770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_235C2B0DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_235C2B8BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235C2BEC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235C2C8B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_235C2F938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235C31134(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_235C323E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_235C36EB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_235C37A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235C37E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t static AppDistributorWrapper.handleEmergencyReset()()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  void *v1 = v0;
  v1[1] = sub_235C38328;
  return MEMORY[0x270EF59D8]();
}

uint64_t sub_235C38328()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 40) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_235C3845C, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_235C3845C()
{
  uint64_t v1 = *(void **)(v0 + 40);
  *(void *)(v0 + 16) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268835D58);
  sub_235C38568();
  if (swift_dynamicCast())
  {

    swift_willThrow();
  }

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
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

unint64_t sub_235C38568()
{
  unint64_t result = qword_268835D60;
  if (!qword_268835D60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268835D60);
  }
  return result;
}

uint64_t sub_235C38708(const void *a1)
{
  *(void *)(v1 + 32) = _Block_copy(a1);
  id v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 40) = v2;
  *id v2 = v1;
  v2[1] = sub_235C387A0;
  return MEMORY[0x270EF59D8]();
}

uint64_t sub_235C387A0()
{
  id v2 = (void *)*v1;
  v2[6] = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_235C388F4, 0, 0);
  }
  else
  {
    uint64_t v3 = (void (**)(void, void))v2[4];
    v3[2](v3, 0);
    _Block_release(v3);
    uint64_t v4 = (uint64_t (*)(void))v2[1];
    return v4();
  }
}

uint64_t sub_235C388F4()
{
  uint64_t v1 = *(void **)(v0 + 48);
  *(void *)(v0 + 16) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268835D58);
  sub_235C38568();
  int v3 = swift_dynamicCast();
  uint64_t v4 = *(void **)(v0 + 48);
  if (v3)
  {

    uint64_t v4 = *(void **)(v0 + 24);
    swift_willThrow();
  }
  uint64_t v5 = *(void (***)(void, void))(v0 + 32);

  uint64_t v6 = (void *)sub_235C3C060();
  ((void (**)(void, void *))v5)[2](v5, v6);

  _Block_release(v5);
  v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

id AppDistributorWrapper.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id AppDistributorWrapper.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDistributorWrapper();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for AppDistributorWrapper()
{
  return self;
}

id AppDistributorWrapper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDistributorWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_235C38AF4()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_235C38B2C()
{
  objc_super v2 = *(const void **)(v0 + 16);
  int v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *int v3 = v1;
  v3[1] = sub_235C38BD8;
  uint64_t v4 = (uint64_t (*)(const void *))((char *)&dword_268835D70 + dword_268835D70);
  return v4(v2);
}

uint64_t sub_235C38BD8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_235C38CCC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_235C39500;
  return v6();
}

uint64_t sub_235C38D9C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_235C39500;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_268835D80 + dword_268835D80);
  return v6(v2, v3, v4);
}

uint64_t sub_235C38E5C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_235C39500;
  return v7();
}

uint64_t objectdestroy_6Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_235C38F6C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_235C39500;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_268835D90 + dword_268835D90);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_235C39038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_235C3C0C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_235C3C0B0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_235C391DC(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_235C3C0A0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_235C391DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268835D68);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_235C3923C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_235C39318;
  return v6(a1);
}

uint64_t sub_235C39318()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_235C39410()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_235C39448(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_235C38BD8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268835DA0 + dword_268835DA0);
  return v6(a1, v4);
}

uint64_t sub_235C39504()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

id sub_235C39514()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_268835F60 = (uint64_t)result;
  return result;
}

uint64_t sub_235C39568(uint64_t a1)
{
  return sub_235C39DF4(a1, qword_268836010);
}

uint64_t sub_235C3958C()
{
  return sub_235C39EBC(&qword_268835F68, (uint64_t)qword_268836010);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_235C395E8@<X0>(uint64_t a1@<X8>)
{
  return sub_235C39F34(&qword_268835F68, (uint64_t)qword_268836010, a1);
}

uint64_t sub_235C3960C(uint64_t a1)
{
  return sub_235C39DF4(a1, qword_268836028);
}

uint64_t sub_235C39630()
{
  return sub_235C39EBC(&qword_268835F70, (uint64_t)qword_268836028);
}

uint64_t sub_235C39654@<X0>(uint64_t a1@<X8>)
{
  return sub_235C39F34(&qword_268835F70, (uint64_t)qword_268836028, a1);
}

uint64_t sub_235C39678(uint64_t a1)
{
  return sub_235C39DF4(a1, qword_268836040);
}

uint64_t sub_235C39698()
{
  return sub_235C39EBC(&qword_268835F78, (uint64_t)qword_268836040);
}

uint64_t sub_235C396BC@<X0>(uint64_t a1@<X8>)
{
  return sub_235C39F34(&qword_268835F78, (uint64_t)qword_268836040, a1);
}

uint64_t sub_235C396E0(uint64_t a1)
{
  return sub_235C39DF4(a1, qword_268836058);
}

uint64_t sub_235C396FC()
{
  return sub_235C39EBC(&qword_268835F80, (uint64_t)qword_268836058);
}

uint64_t sub_235C39720@<X0>(uint64_t a1@<X8>)
{
  return sub_235C39F34(&qword_268835F80, (uint64_t)qword_268836058, a1);
}

uint64_t sub_235C39744(uint64_t a1)
{
  return sub_235C39DF4(a1, qword_268836070);
}

uint64_t sub_235C39764()
{
  return sub_235C39EBC(&qword_268835F88, (uint64_t)qword_268836070);
}

uint64_t sub_235C39788@<X0>(uint64_t a1@<X8>)
{
  return sub_235C39F34(&qword_268835F88, (uint64_t)qword_268836070, a1);
}

uint64_t sub_235C397AC(uint64_t a1)
{
  return sub_235C39DF4(a1, qword_268836088);
}

uint64_t sub_235C397C8()
{
  return sub_235C39EBC(&qword_268835F90, (uint64_t)qword_268836088);
}

uint64_t sub_235C397EC@<X0>(uint64_t a1@<X8>)
{
  return sub_235C39F34(&qword_268835F90, (uint64_t)qword_268836088, a1);
}

uint64_t sub_235C39810(uint64_t a1)
{
  return sub_235C39DF4(a1, qword_2688360A0);
}

uint64_t sub_235C3982C()
{
  return sub_235C39EBC(&qword_268835F98, (uint64_t)qword_2688360A0);
}

uint64_t sub_235C39850@<X0>(uint64_t a1@<X8>)
{
  return sub_235C39F34(&qword_268835F98, (uint64_t)qword_2688360A0, a1);
}

uint64_t sub_235C39874(uint64_t a1)
{
  return sub_235C39DF4(a1, qword_2688360B8);
}

uint64_t sub_235C3988C()
{
  return sub_235C39EBC(&qword_268835FA0, (uint64_t)qword_2688360B8);
}

uint64_t sub_235C398B0@<X0>(uint64_t a1@<X8>)
{
  return sub_235C39F34(&qword_268835FA0, (uint64_t)qword_2688360B8, a1);
}

uint64_t sub_235C398D4(uint64_t a1)
{
  return sub_235C39DF4(a1, qword_2688360D0);
}

uint64_t sub_235C398FC()
{
  return sub_235C39EBC(&qword_268835FA8, (uint64_t)qword_2688360D0);
}

uint64_t sub_235C39920@<X0>(uint64_t a1@<X8>)
{
  return sub_235C39F34(&qword_268835FA8, (uint64_t)qword_2688360D0, a1);
}

uint64_t sub_235C39944(uint64_t a1)
{
  return sub_235C39DF4(a1, qword_2688360E8);
}

uint64_t sub_235C39964()
{
  return sub_235C39EBC(&qword_268835FB0, (uint64_t)qword_2688360E8);
}

uint64_t sub_235C39988@<X0>(uint64_t a1@<X8>)
{
  return sub_235C39F34(&qword_268835FB0, (uint64_t)qword_2688360E8, a1);
}

uint64_t sub_235C399AC(uint64_t a1)
{
  return sub_235C39DF4(a1, qword_268836100);
}

uint64_t sub_235C399D8()
{
  return sub_235C39EBC(&qword_268835FB8, (uint64_t)qword_268836100);
}

uint64_t sub_235C399FC@<X0>(uint64_t a1@<X8>)
{
  return sub_235C39F34(&qword_268835FB8, (uint64_t)qword_268836100, a1);
}

uint64_t sub_235C39A20(uint64_t a1)
{
  return sub_235C39DF4(a1, qword_268836118);
}

uint64_t sub_235C39A38()
{
  return sub_235C39EBC(&qword_268835FC0, (uint64_t)qword_268836118);
}

uint64_t sub_235C39A5C@<X0>(uint64_t a1@<X8>)
{
  return sub_235C39F34(&qword_268835FC0, (uint64_t)qword_268836118, a1);
}

uint64_t sub_235C39A80(uint64_t a1)
{
  return sub_235C39DF4(a1, qword_268836130);
}

uint64_t sub_235C39AA4()
{
  return sub_235C39EBC(&qword_268835FC8, (uint64_t)qword_268836130);
}

uint64_t sub_235C39AC8@<X0>(uint64_t a1@<X8>)
{
  return sub_235C39F34(&qword_268835FC8, (uint64_t)qword_268836130, a1);
}

uint64_t sub_235C39AEC(uint64_t a1)
{
  return sub_235C39DF4(a1, qword_268836148);
}

uint64_t sub_235C39B08()
{
  return sub_235C39EBC(&qword_268835FD0, (uint64_t)qword_268836148);
}

uint64_t sub_235C39B2C@<X0>(uint64_t a1@<X8>)
{
  return sub_235C39F34(&qword_268835FD0, (uint64_t)qword_268836148, a1);
}

uint64_t sub_235C39B50(uint64_t a1)
{
  return sub_235C39DF4(a1, qword_268836160);
}

uint64_t sub_235C39B74()
{
  return sub_235C39EBC(&qword_268835FD8, (uint64_t)qword_268836160);
}

uint64_t sub_235C39B98@<X0>(uint64_t a1@<X8>)
{
  return sub_235C39F34(&qword_268835FD8, (uint64_t)qword_268836160, a1);
}

uint64_t sub_235C39BBC(uint64_t a1)
{
  return sub_235C39DF4(a1, qword_268836178);
}

uint64_t sub_235C39BD8()
{
  return sub_235C39EBC(&qword_268835FE0, (uint64_t)qword_268836178);
}

uint64_t sub_235C39BFC@<X0>(uint64_t a1@<X8>)
{
  return sub_235C39F34(&qword_268835FE0, (uint64_t)qword_268836178, a1);
}

uint64_t sub_235C39C20(uint64_t a1)
{
  return sub_235C39DF4(a1, qword_268836190);
}

uint64_t sub_235C39C44()
{
  return sub_235C39EBC(&qword_268835FE8, (uint64_t)qword_268836190);
}

uint64_t sub_235C39C68@<X0>(uint64_t a1@<X8>)
{
  return sub_235C39F34(&qword_268835FE8, (uint64_t)qword_268836190, a1);
}

uint64_t sub_235C39C8C(uint64_t a1)
{
  return sub_235C39DF4(a1, qword_2688361A8);
}

uint64_t sub_235C39CA8()
{
  return sub_235C39EBC(&qword_268835FF0, (uint64_t)qword_2688361A8);
}

uint64_t sub_235C39CCC@<X0>(uint64_t a1@<X8>)
{
  return sub_235C39F34(&qword_268835FF0, (uint64_t)qword_2688361A8, a1);
}

uint64_t sub_235C39CF0(uint64_t a1)
{
  return sub_235C39DF4(a1, qword_2688361C0);
}

uint64_t sub_235C39D14()
{
  return sub_235C39EBC(&qword_268835FF8, (uint64_t)qword_2688361C0);
}

uint64_t sub_235C39D38@<X0>(uint64_t a1@<X8>)
{
  return sub_235C39F34(&qword_268835FF8, (uint64_t)qword_2688361C0, a1);
}

uint64_t sub_235C39D5C(uint64_t a1)
{
  return sub_235C39DF4(a1, qword_2688361D8);
}

uint64_t sub_235C39D80()
{
  return sub_235C39EBC(&qword_268836000, (uint64_t)qword_2688361D8);
}

uint64_t sub_235C39DA4@<X0>(uint64_t a1@<X8>)
{
  return sub_235C39F34(&qword_268836000, (uint64_t)qword_2688361D8, a1);
}

uint64_t sub_235C39DC8(uint64_t a1)
{
  return sub_235C39DF4(a1, qword_2688361F0);
}

uint64_t sub_235C39DF4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_235C3C090();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_268835F58 != -1) {
    swift_once();
  }
  id v4 = (id)qword_268835F60;
  return sub_235C3C080();
}

uint64_t sub_235C39E98()
{
  return sub_235C39EBC(&qword_268836008, (uint64_t)qword_2688361F0);
}

uint64_t sub_235C39EBC(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_235C3C090();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_235C39F10@<X0>(uint64_t a1@<X8>)
{
  return sub_235C39F34(&qword_268836008, (uint64_t)qword_2688361F0, a1);
}

uint64_t sub_235C39F34@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_235C3C090();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
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

void __getBKUIPearlEnrollControllerClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *BiometricKitUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BiometricSoftLink.h", 22, @"%s", *a1);

  __break(1u);
}

void __getBKUIPearlEnrollControllerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getBKUIPearlEnrollControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BiometricSoftLink.h", 24, @"Unable to find class %s", "BKUIPearlEnrollController");

  __break(1u);
}

void __getBKUIPeriocularEnableSplashViewControllerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getBKUIPeriocularEnableSplashViewControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BiometricSoftLink.h", 23, @"Unable to find class %s", "BKUIPeriocularEnableSplashViewController");

  __break(1u);
}

void __getCIDVUIBiometricBindingFlowManagerClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CoreIDVUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BiometricSoftLink.h", 15, @"%s", *a1);

  __break(1u);
}

void __getCIDVUIBiometricBindingFlowManagerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCIDVUIBiometricBindingFlowManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BiometricSoftLink.h", 16, @"Unable to find class %s", "CIDVUIBiometricBindingFlowManager");

  __break(1u);
}

void __getBiometricKitUIClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *BiometricKitUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"DSTouchIDController.m", 26, @"%s", *a1);

  __break(1u);
}

void __getBiometricKitUIClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getBiometricKitUIClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"DSTouchIDController.m", 27, @"Unable to find class %s", "BiometricKitUI");

  __break(1u);
}

uint64_t sub_235C3C060()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_235C3C080()
{
  return MEMORY[0x270EEB1D0]();
}

uint64_t sub_235C3C090()
{
  return MEMORY[0x270EEB1E0]();
}

uint64_t sub_235C3C0A0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_235C3C0B0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_235C3C0C0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

uint64_t DSLocStringForKey()
{
  return MEMORY[0x270F26118]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t PSIsPearlAvailable()
{
  return MEMORY[0x270F55248]();
}

uint64_t PSSupportsMesa()
{
  return MEMORY[0x270F55310]();
}

uint64_t SecPasswordIsPasswordWeak2()
{
  return MEMORY[0x270EFDAF8]();
}

uint64_t TCCAccessResetForBundleId()
{
  return MEMORY[0x270F79638]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x270ED8EF8](*(void *)&__clock_id);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t displayNameForApp()
{
  return MEMORY[0x270F26120]();
}

void free(void *a1)
{
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA0]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x270EF8928](path);
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x270EF8A08]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}