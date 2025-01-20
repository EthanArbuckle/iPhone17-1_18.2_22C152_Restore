void sub_22315CB2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _adasPreferenceDidChange(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a2 _adasPreferenceDidChange:a5];
}

Class __getHAENDefaultsClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!HAENotificationsLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __HAENotificationsLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264699898;
    uint64_t v5 = 0;
    HAENotificationsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!HAENotificationsLibraryCore_frameworkLibrary) {
    __getHAENDefaultsClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("HAENDefaults");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getHAENDefaultsClass_block_invoke_cold_2();
  }
  getHAENDefaultsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HAENotificationsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HAENotificationsLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

const char *HHHearingLogCategoryForCategory(unint64_t a1)
{
  if (a1 >= 0xE) {
    HHHearingLogCategoryForCategory_cold_1();
  }
  if (a1 - 1 > 0xC) {
    return "default";
  }
  else {
    return off_264699920[a1 - 1];
  }
}

id HHHearingLogForCategory(unint64_t a1)
{
  if (a1 >= 0xE) {
    HHHearingLogForCategory_cold_1();
  }
  if (HHHearingLogForCategory_onceToken != -1) {
    dispatch_once(&HHHearingLogForCategory_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)HHHearingLogForCategory_logObjects[a1];
  return v2;
}

void __HHHearingLogForCategory_block_invoke()
{
  for (unint64_t i = 0; i != 14; ++i)
  {
    v1 = (const char *)HHHearingLogSubsystem;
    v2 = HHHearingLogCategoryForCategory(i);
    os_log_t v3 = os_log_create(v1, v2);
    uint64_t v4 = (void *)HHHearingLogForCategory_logObjects[i];
    HHHearingLogForCategory_logObjects[i] = v3;
  }
}

uint64_t HKHeadphoneAudioExposureType()
{
  return [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09E28]];
}

uint64_t HKHeadphoneAudioExposureEventType()
{
  return [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09300]];
}

id HKNRDeviceCapabilityEnvironmentalDosimetry()
{
  v0 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"F5C2DAD0-38FB-4B3B-86D3-B264F4F8CBDA"];
  return v0;
}

uint64_t HKHeadphoneAudioExposureControlClientInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D633090];
}

uint64_t HKHeadphoneAudioExposureControlServerInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D635608];
}

void __getHAENDefaultsClass_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x263F08690] currentHandler];
  os_log_t v3 = [NSString stringWithUTF8String:"void *HAENotificationsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"HKHearingFeatures.m", 28, @"%s", *a1);

  __break(1u);
}

void __getHAENDefaultsClass_block_invoke_cold_2()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class getHAENDefaultsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKHearingFeatures.m", 29, @"Unable to find class %s", "HAENDefaults");

  __break(1u);
}

void HHHearingLogCategoryForCategory_cold_1()
{
}

void HHHearingLogForCategory_cold_1()
{
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

uint64_t HKStringFromBool()
{
  return MEMORY[0x270EF3860]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x270EF3970]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x270EF3978]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A460](cls, name);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void method_exchangeImplementations(Method m1, Method m2)
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