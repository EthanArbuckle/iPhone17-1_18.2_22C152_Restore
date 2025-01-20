void sub_100002FCC(id a1)
{
  byte_100011150 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/BiometricKit.framework/BiometricKit" UTF8String], 1) != 0;
}

void sub_1000030AC(id a1)
{
  byte_100011151 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/NearField.framework/NearField" UTF8String], 1) != 0;
}

void sub_10000318C(id a1)
{
  byte_100011152 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/NearFieldAccessory.framework/NearFieldAccessory" UTF8String], 1) != 0;
}

void sub_10000326C(id a1)
{
  byte_100011153 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/CoreRepairKit.framework/CoreRepairKit" UTF8String], 1) != 0;
}

void sub_1000036F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003720(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003730(uint64_t a1)
{
}

intptr_t sub_100003738(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = [WeakRetained device];
  id v5 = objc_loadWeakRetained(v2);
  if ([v5 isMagSafe]) {
    uint64_t v6 = 135;
  }
  else {
    uint64_t v6 = 13;
  }
  uint64_t v7 = [v4 stringFromHIDReport:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  v10 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v10);
}

void sub_100003BBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003BE4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003BF4(uint64_t a1)
{
}

intptr_t sub_100003BFC(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = [WeakRetained hidDevice];
  id v5 = objc_loadWeakRetained(v2);
  if ([v5 isMagSafe]) {
    uint64_t v6 = 135;
  }
  else {
    uint64_t v6 = 13;
  }
  uint64_t v7 = [v4 stringFromHIDReport:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  v10 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v10);
}

id stringOrNull(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = +[NSNull null];
  }
  v4 = v3;

  return v4;
}

id numberOrNull(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = +[NSNull null];
  }
  v4 = v3;

  return v4;
}

void sub_100004F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004F84(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004F94(uint64_t a1)
{
}

void sub_100004F9C(uint64_t a1)
{
  id v5 = +[UIDevice currentDevice];
  uint64_t v2 = [v5 systemVersion];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1000063AC(id a1)
{
  id v1 = (id)MGCopyAnswer();
  if ([v1 isEqualToString:@"Beta"]) {
    byte_100011178 = 1;
  }
}

void sub_100006450(id a1)
{
  byte_100011179 = os_variant_has_internal_content();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

uint64_t DiagnosticLogSubmissionEnabled()
{
  return _DiagnosticLogSubmissionEnabled();
}

uint64_t MAECopyActivationRecordWithError()
{
  return _MAECopyActivationRecordWithError();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetSInt64Answer()
{
  return _MGGetSInt64Answer();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t SBGetBatteryUsageTimesInSeconds()
{
  return _SBGetBatteryUsageTimesInSeconds();
}

uint64_t SBSSpringBoardServerPort()
{
  return _SBSSpringBoardServerPort();
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return _SecKeyCopyExternalRepresentation(key, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return _SecKeyCopyPublicKey(key);
}

uint64_t SecKeyCopySystemKey()
{
  return _SecKeyCopySystemKey();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return __AXSVoiceOverTouchEnabled();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return _dispatch_queue_get_label(queue);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

id objc_msgSend_ECID(void *a1, const char *a2, ...)
{
  return [a1 ECID];
}

id objc_msgSend_UDID(void *a1, const char *a2, ...)
{
  return [a1 UDID];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__setupTelephonyClient(void *a1, const char *a2, ...)
{
  return [a1 _setupTelephonyClient];
}

id objc_msgSend_activationConfigurationInformation(void *a1, const char *a2, ...)
{
  return [a1 activationConfigurationInformation];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_batterySerialNumber(void *a1, const char *a2, ...)
{
  return [a1 batterySerialNumber];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return [a1 buildVersion];
}

id objc_msgSend_carrierBundleVersion(void *a1, const char *a2, ...)
{
  return [a1 carrierBundleVersion];
}

id objc_msgSend_carrierName(void *a1, const char *a2, ...)
{
  return [a1 carrierName];
}

id objc_msgSend_carrierName2(void *a1, const char *a2, ...)
{
  return [a1 carrierName2];
}

id objc_msgSend_chipID(void *a1, const char *a2, ...)
{
  return [a1 chipID];
}

id objc_msgSend_component(void *a1, const char *a2, ...)
{
  return [a1 component];
}

id objc_msgSend_componentIdentity(void *a1, const char *a2, ...)
{
  return [a1 componentIdentity];
}

id objc_msgSend_cpuArchitecture(void *a1, const char *a2, ...)
{
  return [a1 cpuArchitecture];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentStandbyTime(void *a1, const char *a2, ...)
{
  return [a1 currentStandbyTime];
}

id objc_msgSend_currentUsageTime(void *a1, const char *a2, ...)
{
  return [a1 currentUsageTime];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceColor(void *a1, const char *a2, ...)
{
  return [a1 deviceColor];
}

id objc_msgSend_deviceModel(void *a1, const char *a2, ...)
{
  return [a1 deviceModel];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return [a1 deviceType];
}

id objc_msgSend_deviceVersion(void *a1, const char *a2, ...)
{
  return [a1 deviceVersion];
}

id objc_msgSend_diagnosticsBuild(void *a1, const char *a2, ...)
{
  return [a1 diagnosticsBuild];
}

id objc_msgSend_diagnosticsVersion(void *a1, const char *a2, ...)
{
  return [a1 diagnosticsVersion];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_hidDevice(void *a1, const char *a2, ...)
{
  return [a1 hidDevice];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_information(void *a1, const char *a2, ...)
{
  return [a1 information];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isBetaBuild(void *a1, const char *a2, ...)
{
  return [a1 isBetaBuild];
}

id objc_msgSend_isBiometricKitFrameworkAvailable(void *a1, const char *a2, ...)
{
  return [a1 isBiometricKitFrameworkAvailable];
}

id objc_msgSend_isCheckerBoardActive(void *a1, const char *a2, ...)
{
  return [a1 isCheckerBoardActive];
}

id objc_msgSend_isCoreRepairFrameworkAvailable(void *a1, const char *a2, ...)
{
  return [a1 isCoreRepairFrameworkAvailable];
}

id objc_msgSend_isGreenTeaDevice(void *a1, const char *a2, ...)
{
  return [a1 isGreenTeaDevice];
}

id objc_msgSend_isInBoxUpdateEligibleMode(void *a1, const char *a2, ...)
{
  return [a1 isInBoxUpdateEligibleMode];
}

id objc_msgSend_isInDiagnosticsMode(void *a1, const char *a2, ...)
{
  return [a1 isInDiagnosticsMode];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isInternalInstall];
}

id objc_msgSend_isMagSafe(void *a1, const char *a2, ...)
{
  return [a1 isMagSafe];
}

id objc_msgSend_isNearFieldAccessoryFrameworkAvailable(void *a1, const char *a2, ...)
{
  return [a1 isNearFieldAccessoryFrameworkAvailable];
}

id objc_msgSend_isNearFieldFrameworkAvailable(void *a1, const char *a2, ...)
{
  return [a1 isNearFieldFrameworkAvailable];
}

id objc_msgSend_isPasscodeLocked(void *a1, const char *a2, ...)
{
  return [a1 isPasscodeLocked];
}

id objc_msgSend_isPasscodeSet(void *a1, const char *a2, ...)
{
  return [a1 isPasscodeSet];
}

id objc_msgSend_isPresent(void *a1, const char *a2, ...)
{
  return [a1 isPresent];
}

id objc_msgSend_isProdDevice(void *a1, const char *a2, ...)
{
  return [a1 isProdDevice];
}

id objc_msgSend_isServicePart(void *a1, const char *a2, ...)
{
  return [a1 isServicePart];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return [a1 languageCode];
}

id objc_msgSend_lastEraseDate(void *a1, const char *a2, ...)
{
  return [a1 lastEraseDate];
}

id objc_msgSend_lastRestoreDate(void *a1, const char *a2, ...)
{
  return [a1 lastRestoreDate];
}

id objc_msgSend_lastUpdateDate(void *a1, const char *a2, ...)
{
  return [a1 lastUpdateDate];
}

id objc_msgSend_latestUserLog(void *a1, const char *a2, ...)
{
  return [a1 latestUserLog];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localTime(void *a1, const char *a2, ...)
{
  return [a1 localTime];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return [a1 localTimeZone];
}

id objc_msgSend_localeCode(void *a1, const char *a2, ...)
{
  return [a1 localeCode];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localeIdentifier];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_marketingProductNumber(void *a1, const char *a2, ...)
{
  return [a1 marketingProductNumber];
}

id objc_msgSend_marketingVersion(void *a1, const char *a2, ...)
{
  return [a1 marketingVersion];
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return [a1 modelNumber];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_productVersionExtra(void *a1, const char *a2, ...)
{
  return [a1 productVersionExtra];
}

id objc_msgSend_psDevice(void *a1, const char *a2, ...)
{
  return [a1 psDevice];
}

id objc_msgSend_regulatoryModelNumber(void *a1, const char *a2, ...)
{
  return [a1 regulatoryModelNumber];
}

id objc_msgSend_restoreDate(void *a1, const char *a2, ...)
{
  return [a1 restoreDate];
}

id objc_msgSend_rootCreationDate(void *a1, const char *a2, ...)
{
  return [a1 rootCreationDate];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_setupAssistantCompletionDate(void *a1, const char *a2, ...)
{
  return [a1 setupAssistantCompletionDate];
}

id objc_msgSend_setupCompletedDate(void *a1, const char *a2, ...)
{
  return [a1 setupCompletedDate];
}

id objc_msgSend_sharedFormatter(void *a1, const char *a2, ...)
{
  return [a1 sharedFormatter];
}

id objc_msgSend_sikPublicKey(void *a1, const char *a2, ...)
{
  return [a1 sikPublicKey];
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return [a1 slotID];
}

id objc_msgSend_storeDemoModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 storeDemoModeEnabled];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subscriptionInfo(void *a1, const char *a2, ...)
{
  return [a1 subscriptionInfo];
}

id objc_msgSend_subscriptions(void *a1, const char *a2, ...)
{
  return [a1 subscriptions];
}

id objc_msgSend_subscriptionsInUse(void *a1, const char *a2, ...)
{
  return [a1 subscriptionsInUse];
}

id objc_msgSend_supplementalBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 supplementalBuildVersion];
}

id objc_msgSend_supportsInductiveCharging(void *a1, const char *a2, ...)
{
  return [a1 supportsInductiveCharging];
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return [a1 systemUptime];
}

id objc_msgSend_systemVersion(void *a1, const char *a2, ...)
{
  return [a1 systemVersion];
}

id objc_msgSend_telephonyClient(void *a1, const char *a2, ...)
{
  return [a1 telephonyClient];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_updateDate(void *a1, const char *a2, ...)
{
  return [a1 updateDate];
}