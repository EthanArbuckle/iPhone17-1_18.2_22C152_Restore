os_log_t define_nph_log(char *category)
{
  os_log_t v1;
  uint64_t vars8;

  v1 = os_log_create("com.apple.NanoPhone", category);

  return v1;
}

id nph_general_log()
{
  if (qword_C658 != -1) {
    dispatch_once(&qword_C658, &stru_82B0);
  }
  v0 = (void *)qword_C650;

  return v0;
}

void sub_393C(id a1)
{
  qword_C650 = (uint64_t)os_log_create("com.apple.NanoPhone", "general");

  _objc_release_x1();
}

id nph_sos_general_log()
{
  if (qword_C668 != -1) {
    dispatch_once(&qword_C668, &stru_82D0);
  }
  v0 = (void *)qword_C660;

  return v0;
}

void sub_39D4(id a1)
{
  qword_C660 = (uint64_t)os_log_create("com.apple.NanoPhone", "sos_general");

  _objc_release_x1();
}

id nph_sos_newton_log()
{
  if (qword_C678 != -1) {
    dispatch_once(&qword_C678, &stru_82F0);
  }
  v0 = (void *)qword_C670;

  return v0;
}

void sub_3A6C(id a1)
{
  qword_C670 = (uint64_t)os_log_create("com.apple.NanoPhone", "sos_newton");

  _objc_release_x1();
}

uint64_t NPHIsDebugBuild()
{
  return 0;
}

uint64_t NPHDeviceOSIsInternalInstall()
{
  if (qword_C680 != -1) {
    dispatch_once(&qword_C680, &stru_8318);
  }
  return byte_C688;
}

void sub_3AFC(id a1)
{
  byte_C688 = MGGetBoolAnswer();
}

uint64_t NPHDeviceHasBaseband()
{
  if (qword_C690 != -1) {
    dispatch_once(&qword_C690, &stru_8338);
  }
  return byte_C698;
}

void sub_3B68(id a1)
{
  byte_C698 = MGGetBoolAnswer();
}

uint64_t NPHIsWalkaboutEnabled()
{
  if (qword_C6A0 != -1) {
    dispatch_once(&qword_C6A0, &stru_8358);
  }
  return byte_C6A8;
}

void sub_3BD4(id a1)
{
  CFPropertyListRef v1 = CFPreferencesCopyAppValue(@"ExperimentGroup", @"com.apple.da");
  if (v1)
  {
    v2 = (void *)v1;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v2 isEqualToString:@"walkabout"])
      {
        if (qword_C680 != -1) {
          dispatch_once(&qword_C680, &stru_8318);
        }
        byte_C6A8 = byte_C688;
      }
    }
  }

  _objc_release_x1();
}

id NPHWiFiStringKey(void *a1)
{
  id v1 = a1;
  if (MGGetBoolAnswer()) {
    CFStringRef v2 = @"_WLAN";
  }
  else {
    CFStringRef v2 = @"_WIFI";
  }
  v3 = [v1 stringByAppendingString:v2];

  return v3;
}

uint64_t NPHDeriveProgramName(char *a1)
{
  CFStringRef v2 = strrchr(a1, 47);
  if (v2) {
    v3 = v2 + 1;
  }
  else {
    v3 = a1;
  }
  qword_C6B0 = +[NSString stringWithUTF8String:v3];

  return _objc_release_x1();
}

void NPHSetTmpDirPrefix()
{
  v0 = +[NSBundle mainBundle];
  id v1 = [v0 bundleIdentifier];
  [v1 cStringUsingEncoding:4];
  char v2 = _set_user_dir_suffix();

  if ((v2 & 1) == 0)
  {
    v3 = nph_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_5C8C(v3);
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
  v3 = (void *)v2;
  v4 = @"unknown";
  if (v2) {
    v4 = (__CFString *)v2;
  }
  v5 = v4;

  v6 = +[NSString stringWithFormat:@"%@.%@.", v1, v5];

  return v6;
}

id NSStringFromTUCallDisconnectedReason(unsigned int a1)
{
  if (a1 < 0x1A && ((0x3EFFFFFu >> a1) & 1) != 0)
  {
    id v1 = *(&off_8400 + (int)a1);
  }
  else
  {
    id v1 = +[NSString stringWithFormat:@"unhadled TUCallDisconnectedReason in %s", "NSString *NSStringFromTUCallDisconnectedReason(TUCallDisconnectedReason)"];
  }

  return v1;
}

void sub_4038(id a1)
{
  id v1 = +[NRDevice activeDevice];
  byte_C6C0 = [v1 hasHomeButton];
}

void sub_41E0(id a1)
{
  id v1 = +[NSBundle bundleWithIdentifier:@"com.apple.private.NanoPhoneUI"];
  v8[0] = @"CALL_SERVICE_FACETIME_AUDIO";
  uint64_t v2 = objc_msgSend(v1, "localizedStringForKey:value:table:");
  v9[0] = v2;
  v8[1] = @"CALL_SERVICE_FACETIME_VIDEO";
  v3 = objc_msgSend(v1, "localizedStringForKey:value:table:");
  v9[1] = v3;
  v8[2] = @"CALL_SERVICE_FACETIME_AUDIO_UPPERCASE";
  v4 = objc_msgSend(v1, "localizedStringForKey:value:table:");
  v9[2] = v4;
  v8[3] = @"CALL_SERVICE_FACETIME_VIDEO_UPPERCASE";
  v5 = objc_msgSend(v1, "localizedStringForKey:value:table:");
  v9[3] = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];
  v7 = (void *)qword_C6C8;
  qword_C6C8 = v6;
}

uint64_t sub_4604(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

double mach_time_elapsed_to_seconds(uint64_t a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  return (double)(info.numer * a1 / info.denom) / 1000000000.0;
}

void nph_ensure_on_main_queue(void *a1)
{
  block = a1;
  if (+[NSThread isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_4998(uint64_t a1)
{
  id v2 = [objc_alloc((Class)NSMutableArray) initWithCapacity:3];
  v3 = (void *)qword_C6E0;
  qword_C6E0 = (uint64_t)v2;

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:*(void *)(a1 + 32) selector:"_NPHIdleTimeNotification:" name:@"NPHIdleNotification" object:0];
}

id NPHBSFrameworkBundle()
{
  if (qword_C6F0 != -1) {
    dispatch_once(&qword_C6F0, &stru_84D8);
  }
  v0 = (void *)qword_C6E8;

  return v0;
}

void sub_4D98(id a1)
{
  qword_C6E8 = +[NSBundle bundleWithIdentifier:@"com.apple.PhoneBridgeSettings"];

  _objc_release_x1();
}

id sub_54F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_5C8C(NSObject *a1)
{
  int v2 = *__error();
  int v3 = 136315394;
  id v4 = "void NPHSetTmpDirPrefix(void)";
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_error_impl(&dword_0, a1, OS_LOG_TYPE_ERROR, "%s: failed, errno: %d", (uint8_t *)&v3, 0x12u);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

id objc_msgSend_NPHRequestIdleTimeNotification(void *a1, const char *a2, ...)
{
  return [a1 NPHRequestIdleTimeNotification];
}

id objc_msgSend__activeWatchHasTelephony(void *a1, const char *a2, ...)
{
  return [a1 _activeWatchHasTelephony];
}

id objc_msgSend__activeWatchIsProvisioned(void *a1, const char *a2, ...)
{
  return [a1 _activeWatchIsProvisioned];
}

id objc_msgSend__removeThumperItems(void *a1, const char *a2, ...)
{
  return [a1 _removeThumperItems];
}

id objc_msgSend_accountsMatchForSecondaryCalling(void *a1, const char *a2, ...)
{
  return [a1 accountsMatchForSecondaryCalling];
}

id objc_msgSend_activeDevice(void *a1, const char *a2, ...)
{
  return [a1 activeDevice];
}

id objc_msgSend_allowsNotifications(void *a1, const char *a2, ...)
{
  return [a1 allowsNotifications];
}

id objc_msgSend_bbSectionInfo(void *a1, const char *a2, ...)
{
  return [a1 bbSectionInfo];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_cellularPlanIsSetUp(void *a1, const char *a2, ...)
{
  return [a1 cellularPlanIsSetUp];
}

id objc_msgSend_cellularPlans(void *a1, const char *a2, ...)
{
  return [a1 cellularPlans];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultQueue(void *a1, const char *a2, ...)
{
  return [a1 defaultQueue];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_hasHomeButton(void *a1, const char *a2, ...)
{
  return [a1 hasHomeButton];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isThumperCallingAllowedOnDefaultPairedSecondaryDevice(void *a1, const char *a2, ...)
{
  return [a1 isThumperCallingAllowedOnDefaultPairedSecondaryDevice];
}

id objc_msgSend_isThumperCallingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isThumperCallingEnabled];
}

id objc_msgSend_isTinker(void *a1, const char *a2, ...)
{
  return [a1 isTinker];
}

id objc_msgSend_localizedUppercaseString(void *a1, const char *a2, ...)
{
  return [a1 localizedUppercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_preferencesURL(void *a1, const char *a2, ...)
{
  return [a1 preferencesURL];
}

id objc_msgSend_settingsMode(void *a1, const char *a2, ...)
{
  return [a1 settingsMode];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedToneManager(void *a1, const char *a2, ...)
{
  return [a1 sharedToneManager];
}

id objc_msgSend_sharedVibrationManager(void *a1, const char *a2, ...)
{
  return [a1 sharedVibrationManager];
}

id objc_msgSend_showAlerts(void *a1, const char *a2, ...)
{
  return [a1 showAlerts];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_valueWithNonretainedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithNonretainedObject:");
}