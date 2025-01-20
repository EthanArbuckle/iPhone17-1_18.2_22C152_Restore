void sub_100002CC8(id a1)
{
  byte_1000153D8 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/BiometricKit.framework/BiometricKit" UTF8String], 1) != 0;
}

void sub_100002DA8(id a1)
{
  byte_1000153D9 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/NearField.framework/NearField" UTF8String], 1) != 0;
}

void sub_100002E88(id a1)
{
  byte_1000153DA = dlopen((const char *)[@"/System/Library/PrivateFrameworks/NearFieldAccessory.framework/NearFieldAccessory" UTF8String], 1) != 0;
}

void sub_100002F68(id a1)
{
  byte_1000153DB = dlopen((const char *)[@"/System/Library/PrivateFrameworks/CoreRepairKit.framework/CoreRepairKit" UTF8String], 1) != 0;
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

void sub_100004EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004ED8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004EE8(uint64_t a1)
{
}

void sub_100004EF0(uint64_t a1)
{
  id v5 = +[UIDevice currentDevice];
  uint64_t v2 = [v5 systemVersion];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100006300(id a1)
{
  id v1 = (id)MGCopyAnswer();
  if ([v1 isEqualToString:@"Beta"]) {
    byte_100015400 = 1;
  }
}

void sub_1000063A4(id a1)
{
  byte_100015401 = os_variant_has_internal_content();
}

void sub_100008564(uint64_t a1)
{
  uint64_t v2 = +[BluetoothManager sharedInstance];
  [*(id *)(a1 + 32) setBtManager:v2];

  uint64_t v3 = [*(id *)(a1 + 32) btManager];
  unsigned int v4 = [v3 available];

  if (v4)
  {
    [*(id *)(a1 + 32) bluetoothManagerDidBecomeAvailable];
    v7 = [*(id *)(a1 + 32) btManagerAvailableSemaphore];
    dispatch_semaphore_signal(v7);
  }
  else
  {
    id v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Bluetooth manager is not available on init. Waiting for availability before retrieving devices.", buf, 2u);
    }

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:*(void *)(a1 + 32) selector:"bluetoothManagerDidBecomeAvailable" name:BluetoothAvailabilityChangedNotification object:0];
  }
}

void sub_1000091CC(id a1)
{
  qword_100015418 = (uint64_t)objc_alloc_init((Class)BCBatteryDeviceController);

  _objc_release_x1();
}

void sub_100009ABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v25 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100009AF4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100009B04(uint64_t a1)
{
}

void sub_100009B0C(uint64_t a1, void *a2)
{
  id v31 = a2;
  uint64_t v3 = [v31 bluetoothUUID];
  unsigned int v4 = [*(id *)(a1 + 32) identifier];
  unsigned int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v7 = WeakRetained;
      v8 = +[DSDateFormatter sharedFormatter];
      v9 = [v8 formatterWithType:0];

      v10 = [v31 lastMeasurementTimestampLeft];
      if (v10)
      {
        v11 = [v9 stringFromDate:v10];
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v11 forKeyedSubscript:@"lastMeasurementTimestampLeft"];
      }
      v12 = [v31 lastMeasurementTimestampRight];
      if (v12)
      {
        v13 = [v9 stringFromDate:v12];
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v13 forKeyedSubscript:@"lastMeasurementTimestampRight"];
      }
      v14 = [v31 version];
      [v7 addObjectIfNotNil:v14 forKey:@"version" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

      v15 = [v31 daysSinceLastMeasurementLeft];
      [v7 addObjectIfNotNil:v15 forKey:@"daysSinceLastCalLeft" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

      v16 = [v31 daysSinceLastMeasurementRight];
      [v7 addObjectIfNotNil:v16 forKey:@"daysSinceLastCalRight" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

      v17 = [v31 daysSinceLastHarmonicMeasurementLeft];
      [v7 addObjectIfNotNil:v17 forKey:@"daysSinceLastHarmonicLeft" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

      v18 = [v31 daysSinceLastHarmonicMeasurementRight];
      [v7 addObjectIfNotNil:v18 forKey:@"daysSinceLastHarmonicRight" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

      [v7 addEnumValueIfNotZero:(int)[v31 errMicStatusLeft] forKey:@"errMicStatusLeft" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [v7 addEnumValueIfNotZero:(int)[v31 errMicStatusRight] forKey:@"errMicStatusRight" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [v7 addEnumValueIfNotZero:((int)[v31 generalSystemStatusLeft]) forKey:@"generalSystemStatusLeft" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [v7 addEnumValueIfNotZero:(int)[v31 generalSystemStatusRight] forKey:@"generalSystemStatusRight" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [v7 addEnumValueIfNotZero:(int)[v31 frontVentStatusLeft] forKey:@"frontVentStatusLeft" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [v7 addEnumValueIfNotZero:(int)[v31 frontVentStatusRight] forKey:@"frontVentStatusRight" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [v7 addEnumValueIfNotZero:(int)[v31 latestMeasurementResultLeft] forKey:@"latestMeasurementResultLeft" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [v7 addEnumValueIfNotZero:((int)[v31 latestMeasurementResultRight]) forKey:@"latestMeasurementResultRight" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v31, "rearVentStatusLeft"), @"rearVentStatusLeft", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
      [v7 addEnumValueIfNotZero:(int)[v31 rearVentStatusRight] forKey:@"rearVentStatusRight" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [v7 addEnumValueIfNotZero:(int)[v31 refMicStatusLeft] forKey:@"refMicStatusLeft" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [v7 addEnumValueIfNotZero:((int)[v31 refMicStatusRight]) forKey:@"refMicStatusRight" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [v7 addEnumValueIfNotZero:(int)[v31 speakerStatusLeft] forKey:@"speakerStatusLeft" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [v7 addEnumValueIfNotZero:(int)[v31 speakerStatusRight] forKey:@"speakerStatusRight" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [v7 addEnumValueIfNotZero:(int)[v31 vceMicStatusLeft] forKey:@"vceMicStatusLeft" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [v7 addEnumValueIfNotZero:(int)[v31 vceMicStatusRight] forKey:@"vceMicStatusRight" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      unsigned int v19 = [v31 ancLossTypeLeft];
      if (v19 > 3) {
        v20 = "?";
      }
      else {
        v20 = (&off_1000105F0)[v19];
      }
      v21 = +[NSString stringWithUTF8String:v20];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v21 forKeyedSubscript:@"ancLossTypeLeft"];

      unsigned int v22 = [v31 ancLossTypeRight];
      if (v22 > 3) {
        v23 = "?";
      }
      else {
        v23 = (&off_1000105F0)[v22];
      }
      v24 = +[NSString stringWithUTF8String:v23];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v24 forKeyedSubscript:@"ancLossTypeRight"];

      uint64_t v25 = [v31 ancCleanLossScoreLeft];
      [v7 addObjectIfNotNil:v25 forKey:@"ancCleanLossScoreLeft" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

      v26 = [v31 ancCleanLossScoreRight];
      [v7 addObjectIfNotNil:v26 forKey:@"ancCleanLossScoreRight" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

      v27 = [v31 ancFullLossScoreLeft];
      [v7 addObjectIfNotNil:v27 forKey:@"ancFullLossScoreLeft" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

      v28 = [v31 ancFullLossScoreRight];
      [v7 addObjectIfNotNil:v28 forKey:@"ancFullLossScoreRight" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

      v29 = [v31 ancSevereLossScoreLeft];
      [v7 addObjectIfNotNil:v29 forKey:@"ancSevereLossScoreLeft" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

      v30 = [v31 ancSevereLossScoreRight];
      [v7 addObjectIfNotNil:v30 forKey:@"ancSevereLossScoreRight" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

      [v7 addEnumValueIfNotZero:((int)[v31 totalHarmonicDistortionLeft]) forKey:@"totalHarmonicDistortionLeft" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [v7 addEnumValueIfNotZero:(int)[v31 totalHarmonicDistortionRight] forKey:@"totalHarmonicDistortionRight" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [v7 addEnumValueIfNotZero:((int)[v31 frequencyAccuracyLeft]) forKey:@"frequencyAccuracyLeft" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [v7 addEnumValueIfNotZero:(int)[v31 frequencyAccuracyRight] forKey:@"frequencyAccuracyRight" toDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    }
  }
}

void sub_10000A290(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    unsigned int v4 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      unsigned int v5 = [v3 localizedDescription];
      int v6 = 138412290;
      v7 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Unable to activate HMServiceClient with error: %@", (uint8_t *)&v6, 0xCu);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
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

id objc_msgSend_accessoryInfo(void *a1, const char *a2, ...)
{
  return [a1 accessoryInfo];
}

id objc_msgSend_activationConfigurationInformation(void *a1, const char *a2, ...)
{
  return [a1 activationConfigurationInformation];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_ancCleanLossScoreLeft(void *a1, const char *a2, ...)
{
  return [a1 ancCleanLossScoreLeft];
}

id objc_msgSend_ancCleanLossScoreRight(void *a1, const char *a2, ...)
{
  return [a1 ancCleanLossScoreRight];
}

id objc_msgSend_ancFullLossScoreLeft(void *a1, const char *a2, ...)
{
  return [a1 ancFullLossScoreLeft];
}

id objc_msgSend_ancFullLossScoreRight(void *a1, const char *a2, ...)
{
  return [a1 ancFullLossScoreRight];
}

id objc_msgSend_ancLossTypeLeft(void *a1, const char *a2, ...)
{
  return [a1 ancLossTypeLeft];
}

id objc_msgSend_ancLossTypeRight(void *a1, const char *a2, ...)
{
  return [a1 ancLossTypeRight];
}

id objc_msgSend_ancSevereLossScoreLeft(void *a1, const char *a2, ...)
{
  return [a1 ancSevereLossScoreLeft];
}

id objc_msgSend_ancSevereLossScoreRight(void *a1, const char *a2, ...)
{
  return [a1 ancSevereLossScoreRight];
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return [a1 available];
}

id objc_msgSend_bluetoothManagerDidBecomeAvailable(void *a1, const char *a2, ...)
{
  return [a1 bluetoothManagerDidBecomeAvailable];
}

id objc_msgSend_bluetoothUUID(void *a1, const char *a2, ...)
{
  return [a1 bluetoothUUID];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_btManager(void *a1, const char *a2, ...)
{
  return [a1 btManager];
}

id objc_msgSend_btManagerAvailableSemaphore(void *a1, const char *a2, ...)
{
  return [a1 btManagerAvailableSemaphore];
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

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return [a1 connected];
}

id objc_msgSend_connectedDevices(void *a1, const char *a2, ...)
{
  return [a1 connectedDevices];
}

id objc_msgSend_connectingDevices(void *a1, const char *a2, ...)
{
  return [a1 connectingDevices];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
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

id objc_msgSend_daysSinceLastHarmonicMeasurementLeft(void *a1, const char *a2, ...)
{
  return [a1 daysSinceLastHarmonicMeasurementLeft];
}

id objc_msgSend_daysSinceLastHarmonicMeasurementRight(void *a1, const char *a2, ...)
{
  return [a1 daysSinceLastHarmonicMeasurementRight];
}

id objc_msgSend_daysSinceLastMeasurementLeft(void *a1, const char *a2, ...)
{
  return [a1 daysSinceLastMeasurementLeft];
}

id objc_msgSend_daysSinceLastMeasurementRight(void *a1, const char *a2, ...)
{
  return [a1 daysSinceLastMeasurementRight];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
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

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_errMicStatusLeft(void *a1, const char *a2, ...)
{
  return [a1 errMicStatusLeft];
}

id objc_msgSend_errMicStatusRight(void *a1, const char *a2, ...)
{
  return [a1 errMicStatusRight];
}

id objc_msgSend_frequencyAccuracyLeft(void *a1, const char *a2, ...)
{
  return [a1 frequencyAccuracyLeft];
}

id objc_msgSend_frequencyAccuracyRight(void *a1, const char *a2, ...)
{
  return [a1 frequencyAccuracyRight];
}

id objc_msgSend_frontVentStatusLeft(void *a1, const char *a2, ...)
{
  return [a1 frontVentStatusLeft];
}

id objc_msgSend_frontVentStatusRight(void *a1, const char *a2, ...)
{
  return [a1 frontVentStatusRight];
}

id objc_msgSend_gapaFlags(void *a1, const char *a2, ...)
{
  return [a1 gapaFlags];
}

id objc_msgSend_generalSystemStatusLeft(void *a1, const char *a2, ...)
{
  return [a1 generalSystemStatusLeft];
}

id objc_msgSend_generalSystemStatusRight(void *a1, const char *a2, ...)
{
  return [a1 generalSystemStatusRight];
}

id objc_msgSend_getAdaptiveVolumeMode(void *a1, const char *a2, ...)
{
  return [a1 getAdaptiveVolumeMode];
}

id objc_msgSend_getAdaptiveVolumeSupport(void *a1, const char *a2, ...)
{
  return [a1 getAdaptiveVolumeSupport];
}

id objc_msgSend_getCBDevices(void *a1, const char *a2, ...)
{
  return [a1 getCBDevices];
}

id objc_msgSend_getConversationDetectMode(void *a1, const char *a2, ...)
{
  return [a1 getConversationDetectMode];
}

id objc_msgSend_getConversationDetectSupport(void *a1, const char *a2, ...)
{
  return [a1 getConversationDetectSupport];
}

id objc_msgSend_getPairedAppleAudioDevices(void *a1, const char *a2, ...)
{
  return [a1 getPairedAppleAudioDevices];
}

id objc_msgSend_getSpatialAudioPlatformSupport(void *a1, const char *a2, ...)
{
  return [a1 getSpatialAudioPlatformSupport];
}

id objc_msgSend_gyroInformation(void *a1, const char *a2, ...)
{
  return [a1 gyroInformation];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inEarDetectEnabled(void *a1, const char *a2, ...)
{
  return [a1 inEarDetectEnabled];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isAppleAudioDevice(void *a1, const char *a2, ...)
{
  return [a1 isAppleAudioDevice];
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

id objc_msgSend_isGenuineAirPods(void *a1, const char *a2, ...)
{
  return [a1 isGenuineAirPods];
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

id objc_msgSend_isTemporaryPaired(void *a1, const char *a2, ...)
{
  return [a1 isTemporaryPaired];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return [a1 languageCode];
}

id objc_msgSend_lastEraseDate(void *a1, const char *a2, ...)
{
  return [a1 lastEraseDate];
}

id objc_msgSend_lastMeasurementTimestampLeft(void *a1, const char *a2, ...)
{
  return [a1 lastMeasurementTimestampLeft];
}

id objc_msgSend_lastMeasurementTimestampRight(void *a1, const char *a2, ...)
{
  return [a1 lastMeasurementTimestampRight];
}

id objc_msgSend_lastRestoreDate(void *a1, const char *a2, ...)
{
  return [a1 lastRestoreDate];
}

id objc_msgSend_lastUpdateDate(void *a1, const char *a2, ...)
{
  return [a1 lastUpdateDate];
}

id objc_msgSend_latestMeasurementResultLeft(void *a1, const char *a2, ...)
{
  return [a1 latestMeasurementResultLeft];
}

id objc_msgSend_latestMeasurementResultRight(void *a1, const char *a2, ...)
{
  return [a1 latestMeasurementResultRight];
}

id objc_msgSend_latestUserLog(void *a1, const char *a2, ...)
{
  return [a1 latestUserLog];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listeningMode(void *a1, const char *a2, ...)
{
  return [a1 listeningMode];
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

id objc_msgSend_pairedDevices(void *a1, const char *a2, ...)
{
  return [a1 pairedDevices];
}

id objc_msgSend_parts(void *a1, const char *a2, ...)
{
  return [a1 parts];
}

id objc_msgSend_percentCharge(void *a1, const char *a2, ...)
{
  return [a1 percentCharge];
}

id objc_msgSend_productId(void *a1, const char *a2, ...)
{
  return [a1 productId];
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return [a1 productName];
}

id objc_msgSend_productVersionExtra(void *a1, const char *a2, ...)
{
  return [a1 productVersionExtra];
}

id objc_msgSend_rearVentStatusLeft(void *a1, const char *a2, ...)
{
  return [a1 rearVentStatusLeft];
}

id objc_msgSend_rearVentStatusRight(void *a1, const char *a2, ...)
{
  return [a1 rearVentStatusRight];
}

id objc_msgSend_refMicStatusLeft(void *a1, const char *a2, ...)
{
  return [a1 refMicStatusLeft];
}

id objc_msgSend_refMicStatusRight(void *a1, const char *a2, ...)
{
  return [a1 refMicStatusRight];
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

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sikPublicKey(void *a1, const char *a2, ...)
{
  return [a1 sikPublicKey];
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return [a1 slotID];
}

id objc_msgSend_spatialAudioEnabled(void *a1, const char *a2, ...)
{
  return [a1 spatialAudioEnabled];
}

id objc_msgSend_speakerStatusLeft(void *a1, const char *a2, ...)
{
  return [a1 speakerStatusLeft];
}

id objc_msgSend_speakerStatusRight(void *a1, const char *a2, ...)
{
  return [a1 speakerStatusRight];
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

id objc_msgSend_totalHarmonicDistortionLeft(void *a1, const char *a2, ...)
{
  return [a1 totalHarmonicDistortionLeft];
}

id objc_msgSend_totalHarmonicDistortionRight(void *a1, const char *a2, ...)
{
  return [a1 totalHarmonicDistortionRight];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_updateDate(void *a1, const char *a2, ...)
{
  return [a1 updateDate];
}

id objc_msgSend_vceMicStatusLeft(void *a1, const char *a2, ...)
{
  return [a1 vceMicStatusLeft];
}

id objc_msgSend_vceMicStatusRight(void *a1, const char *a2, ...)
{
  return [a1 vceMicStatusRight];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}