void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  uint64_t v4;
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void nph_ensure_on_main_queue(void *a1)
{
  v1 = (void *)MEMORY[0x263F08B88];
  block = a1;
  if ([v1 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

id nph_general_log()
{
  if (nph_general_log_onceToken != -1) {
    dispatch_once(&nph_general_log_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)nph_general_log_logger;
  return v0;
}

void sub_235447204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __nph_general_log_block_invoke()
{
  nph_general_log_logger = (uint64_t)os_log_create("com.apple.NanoPhone", "general");
  return MEMORY[0x270F9A758]();
}

id CTSUServerQueue()
{
  if (CTSUServerQueue_onceToken != -1) {
    dispatch_once(&CTSUServerQueue_onceToken, &__block_literal_global);
  }
  v0 = (void *)CTSUServerQueue_sCTServerQueue;
  return v0;
}

void __CTSUServerQueue_block_invoke()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.bridge.nanophone.ctserverqueue", 0);
  v1 = (void *)CTSUServerQueue_sCTServerQueue;
  CTSUServerQueue_sCTServerQueue = (uint64_t)v0;

  if (!CTSUServerQueue_sCTServerQueue)
  {
    v2 = nph_general_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315138;
      v4 = "dispatch_queue_t CTSUServerQueue(void)_block_invoke";
      _os_log_impl(&dword_235444000, v2, OS_LOG_TYPE_DEFAULT, "%s - unable to create sCTServerQueue", (uint8_t *)&v3, 0xCu);
    }
  }
}

uint64_t CTSUServerConnectionRef()
{
  if (CTSUServerConnectionRef_onceToken != -1) {
    dispatch_once(&CTSUServerConnectionRef_onceToken, &__block_literal_global_3);
  }
  return CTSUServerConnectionRef_sCTServerConnectionRef;
}

void __CTSUServerConnectionRef_block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  _CTServerConnectionAddIdentifierException();
  dispatch_queue_t v0 = CTSUServerQueue();
  CTSUServerConnectionRef_sCTServerConnectionRef = _CTServerConnectionCreateOnTargetQueue();

  if (!CTSUServerConnectionRef_sCTServerConnectionRef)
  {
    v1 = nph_general_log();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      int v2 = 136315138;
      int v3 = "CTServerConnectionRef CTSUServerConnectionRef(void)_block_invoke";
      _os_log_impl(&dword_235444000, v1, OS_LOG_TYPE_DEFAULT, "%s - unable to create sCTServerConnectionRef", (uint8_t *)&v2, 0xCu);
    }
  }
}

void __CTSUServerConnectionRef_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    v7 = "CTServerConnectionRef CTSUServerConnectionRef(void)_block_invoke_2";
    __int16 v8 = 2112;
    uint64_t v9 = a2;
    __int16 v10 = 2112;
    uint64_t v11 = a3;
    _os_log_impl(&dword_235444000, v5, OS_LOG_TYPE_DEFAULT, "%s notification:%@ info:%@", (uint8_t *)&v6, 0x20u);
  }
}

void sub_235449D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCTCellularPlanErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CellularPlanManagerLibrary();
  result = dlsym(v2, "CTCellularPlanErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCTCellularPlanErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CellularPlanManagerLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!CellularPlanManagerLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __CellularPlanManagerLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264C537F8;
    uint64_t v5 = 0;
    CellularPlanManagerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = CellularPlanManagerLibraryCore_frameworkLibrary;
  v1 = (void *)v3[0];
  if (!CellularPlanManagerLibraryCore_frameworkLibrary)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __CellularPlanManagerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CellularPlanManagerLibraryCore_frameworkLibrary = result;
  return result;
}

void __getCTCellularPlanManagerClass_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  CellularPlanManagerLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CTCellularPlanManager");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCTCellularPlanManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCTCellularPlanManagerClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_23544FE60(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2354501BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235450328(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t IsCurrentDevicePairing()
{
  uint64_t v0 = [MEMORY[0x263F2BBA0] shared];
  uint64_t v1 = [v0 inWatchSetupFlow];

  return v1;
}

uint64_t _NRPairedWatchDidBecomeActive(uint64_t a1, void *a2)
{
  return [a2 _nrPairedWatchDidBecomeActive];
}

void sub_235451498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2354515C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_235452814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t NPHIsDebugBuild()
{
  return 0;
}

uint64_t NPHDeviceOSIsInternalInstall()
{
  if (NPHDeviceOSIsInternalInstall_onceToken != -1) {
    dispatch_once(&NPHDeviceOSIsInternalInstall_onceToken, &__block_literal_global_3);
  }
  return __NPHInternalOS;
}

uint64_t __NPHDeviceOSIsInternalInstall_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  __NPHInternalOS = result;
  return result;
}

uint64_t NPHDeviceHasBaseband()
{
  if (NPHDeviceHasBaseband_onceToken != -1) {
    dispatch_once(&NPHDeviceHasBaseband_onceToken, &__block_literal_global_15);
  }
  return NPHDeviceHasBaseband_isCellularDevice;
}

uint64_t __NPHDeviceHasBaseband_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  NPHDeviceHasBaseband_isCellularDevice = result;
  return result;
}

uint64_t NPHIsWalkaboutEnabled()
{
  if (NPHIsWalkaboutEnabled_onceToken != -1) {
    dispatch_once(&NPHIsWalkaboutEnabled_onceToken, &__block_literal_global_20);
  }
  return __NPHWalkaboutEnabled;
}

uint64_t __NPHIsWalkaboutEnabled_block_invoke()
{
  CFPropertyListRef v0 = CFPreferencesCopyAppValue(@"ExperimentGroup", @"com.apple.da");
  if (v0)
  {
    int v2 = (void *)v0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v2 isEqualToString:@"walkabout"])
      {
        if (NPHDeviceOSIsInternalInstall_onceToken != -1) {
          dispatch_once(&NPHDeviceOSIsInternalInstall_onceToken, &__block_literal_global_3);
        }
        __NPHWalkaboutEnabled = __NPHInternalOS;
      }
    }
  }
  return MEMORY[0x270F9A758]();
}

id NPHWiFiStringKey(void *a1)
{
  id v1 = a1;
  if (MGGetBoolAnswer()) {
    int v2 = @"_WLAN";
  }
  else {
    int v2 = @"_WIFI";
  }
  int v3 = [v1 stringByAppendingString:v2];

  return v3;
}

uint64_t NPHDeriveProgramName(char *a1)
{
  int v2 = strrchr(a1, 47);
  if (v2) {
    int v3 = v2 + 1;
  }
  else {
    int v3 = a1;
  }
  programName = [NSString stringWithUTF8String:v3];
  return MEMORY[0x270F9A758]();
}

void NPHSetTmpDirPrefix()
{
  CFPropertyListRef v0 = [MEMORY[0x263F086E0] mainBundle];
  id v1 = [v0 bundleIdentifier];
  [v1 cStringUsingEncoding:4];
  char v2 = _set_user_dir_suffix();

  if ((v2 & 1) == 0)
  {
    int v3 = nph_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      NPHSetTmpDirPrefix_cold_1(v3);
    }
  }
}

uint64_t NPHSharedUtilitiesLocaleHaptic()
{
  return 0xFFFFFFFFLL;
}

uint64_t NPHSharedUtilitiesLocaleHapticDucked()
{
  return 0xFFFFFFFFLL;
}

id NPHSharedUtilitiesAppendBuildVersion(void *a1)
{
  id v1 = a1;
  uint64_t v2 = MGCopyAnswer();
  int v3 = (void *)v2;
  long long v4 = @"unknown";
  if (v2) {
    long long v4 = (__CFString *)v2;
  }
  uint64_t v5 = v4;

  uint64_t v6 = [NSString stringWithFormat:@"%@.%@.", v1, v5];

  return v6;
}

__CFString *NSStringFromTUCallDisconnectedReason(unsigned int a1)
{
  if (a1 < 0x1A && ((0x3EFFFFFu >> a1) & 1) != 0)
  {
    id v1 = off_264C53C50[a1];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unhadled TUCallDisconnectedReason in %s", "NSString *NSStringFromTUCallDisconnectedReason(TUCallDisconnectedReason)");
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

double mach_time_elapsed_to_seconds(uint64_t a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  return (double)(info.numer * a1 / info.denom) / 1000000000.0;
}

os_log_t define_nph_log(char *category)
{
  os_log_t v1 = os_log_create("com.apple.NanoPhone", category);
  return v1;
}

id nph_sos_general_log()
{
  if (nph_sos_general_log_onceToken != -1) {
    dispatch_once(&nph_sos_general_log_onceToken, &__block_literal_global_4);
  }
  CFPropertyListRef v0 = (void *)nph_sos_general_log_logger;
  return v0;
}

uint64_t __nph_sos_general_log_block_invoke()
{
  nph_sos_general_log_logger = (uint64_t)os_log_create("com.apple.NanoPhone", "sos_general");
  return MEMORY[0x270F9A758]();
}

id nph_sos_newton_log()
{
  if (nph_sos_newton_log_onceToken != -1) {
    dispatch_once(&nph_sos_newton_log_onceToken, &__block_literal_global_7_0);
  }
  CFPropertyListRef v0 = (void *)nph_sos_newton_log_logger;
  return v0;
}

uint64_t __nph_sos_newton_log_block_invoke()
{
  nph_sos_newton_log_logger = (uint64_t)os_log_create("com.apple.NanoPhone", "sos_newton");
  return MEMORY[0x270F9A758]();
}

void sub_23545B48C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_23545B750(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23545B824(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __getCTCellularPlanManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __72__NPHCellularBridgeUIManager__updateSIMStatusForAllSubscriptionContexts__block_invoke_104_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

void NPHSetTmpDirPrefix_cold_1(NSObject *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = *__error();
  int v3 = 136315394;
  uint64_t v4 = "void NPHSetTmpDirPrefix(void)";
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_error_impl(&dword_235444000, a1, OS_LOG_TYPE_ERROR, "%s: failed, errno: %d", (uint8_t *)&v3, 0x12u);
}

void AudioServicesPlaySystemSound(SystemSoundID inSystemSoundID)
{
}

uint64_t BPSBridgeTintColor()
{
  return MEMORY[0x270F12828]();
}

uint64_t BPSPresentGizmoUnreachableServiceAlertWithDismissalHandler()
{
  return MEMORY[0x270F12868]();
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

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t TUFormattedPhoneNumber()
{
  return MEMORY[0x270F7CB38]();
}

uint64_t TUHomeCountryCode()
{
  return MEMORY[0x270F7CB60]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CTServerConnectionAddIdentifierException()
{
  return MEMORY[0x270EE8748]();
}

uint64_t _CTServerConnectionCanSetCapabilityExtended()
{
  return MEMORY[0x270EE8750]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x270EE87C0]();
}

uint64_t _CTServerConnectionSetCellularDataIsEnabled()
{
  return MEMORY[0x270EE8890]();
}

uint64_t _CTServerConnectionShouldWarnDisabledLteMayImpactService()
{
  return MEMORY[0x270EE88C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x270ED8150]();
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

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}