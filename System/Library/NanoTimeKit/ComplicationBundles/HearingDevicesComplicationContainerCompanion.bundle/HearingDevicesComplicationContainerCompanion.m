void sub_4664(id a1)
{
  +[HearingDevicesComplicationBundleDataSource _requeryHUHearingAidSettingsForPairedHearingAids];
}

id sub_4670(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requeryHUHearingAidSettingsForPairedHearingAids];
}

void sub_4678(id a1)
{
}

id sub_4684(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requeryHANanoSettingsForPairedHearingAids];
}

void sub_46E0(id a1)
{
  qword_C9A8 = (uint64_t)dispatch_queue_create("com.apple.HearingDevicesDataSource.Requery", 0);

  _objc_release_x1();
}

void sub_47C8(uint64_t a1)
{
  v2 = +[HUHearingAidSettings sharedInstance];
  v3 = [v2 pairedHearingAids];
  BOOL v4 = v3 != 0;

  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  byte_C9B8 = v4;
  objc_sync_exit(obj);
}

void sub_4900(uint64_t a1)
{
  v2 = +[HANanoSettings sharedInstance];
  v3 = [v2 pairedHearingAids];
  BOOL v4 = v3 != 0;

  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  byte_C9B9 = v4;
  objc_sync_exit(obj);
}

void sub_4BD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_4BFC(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained hearingDevicesDidChange:v3];
}

void sub_4C58(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained hearingDevicesDidChange:v3];
}

void sub_4CB4(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained hearingDevicePropertiesDidUpdate:v3];
}

void sub_5130(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v4, "setValue:forProperty:", v5, objc_msgSend(a2, "unsignedLongLongValue"));
}

uint64_t AXFormatFloat()
{
  return _AXFormatFloat();
}

uint64_t HAInitializeLogging()
{
  return _HAInitializeLogging();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return _dispatch_block_create_with_qos_class(flags, qos_class, relative_priority, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

uint64_t hearingLocString()
{
  return _hearingLocString();
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
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
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

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__requeryQueue(void *a1, const char *a2, ...)
{
  return [a1 _requeryQueue];
}

id objc_msgSend_adjustsIndependentlyEnabled(void *a1, const char *a2, ...)
{
  return [a1 adjustsIndependentlyEnabled];
}

id objc_msgSend_availableEars(void *a1, const char *a2, ...)
{
  return [a1 availableEars];
}

id objc_msgSend_batteryLevel(void *a1, const char *a2, ...)
{
  return [a1 batteryLevel];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_complicationPreferredDisplayMode(void *a1, const char *a2, ...)
{
  return [a1 complicationPreferredDisplayMode];
}

id objc_msgSend_complicationTemplate(void *a1, const char *a2, ...)
{
  return [a1 complicationTemplate];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHearingDevices(void *a1, const char *a2, ...)
{
  return [a1 currentHearingDevices];
}

id objc_msgSend_currentTimelineEntry(void *a1, const char *a2, ...)
{
  return [a1 currentTimelineEntry];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return [a1 deviceName];
}

id objc_msgSend_deviceUUID(void *a1, const char *a2, ...)
{
  return [a1 deviceUUID];
}

id objc_msgSend_entryDate(void *a1, const char *a2, ...)
{
  return [a1 entryDate];
}

id objc_msgSend_family(void *a1, const char *a2, ...)
{
  return [a1 family];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_headerTextProvider(void *a1, const char *a2, ...)
{
  return [a1 headerTextProvider];
}

id objc_msgSend_hearingDevice(void *a1, const char *a2, ...)
{
  return [a1 hearingDevice];
}

id objc_msgSend_hearingEar(void *a1, const char *a2, ...)
{
  return [a1 hearingEar];
}

id objc_msgSend_independentHearingAidSettings(void *a1, const char *a2, ...)
{
  return [a1 independentHearingAidSettings];
}

id objc_msgSend_invalidateEntries(void *a1, const char *a2, ...)
{
  return [a1 invalidateEntries];
}

id objc_msgSend_isiCloudPaired(void *a1, const char *a2, ...)
{
  return [a1 isiCloudPaired];
}

id objc_msgSend_leftBatteryLevel(void *a1, const char *a2, ...)
{
  return [a1 leftBatteryLevel];
}

id objc_msgSend_leftMicrophoneVolume(void *a1, const char *a2, ...)
{
  return [a1 leftMicrophoneVolume];
}

id objc_msgSend_leftMicrophoneVolumeSteps(void *a1, const char *a2, ...)
{
  return [a1 leftMicrophoneVolumeSteps];
}

id objc_msgSend_leftMixedVolume(void *a1, const char *a2, ...)
{
  return [a1 leftMixedVolume];
}

id objc_msgSend_leftMixedVolumeSteps(void *a1, const char *a2, ...)
{
  return [a1 leftMixedVolumeSteps];
}

id objc_msgSend_leftPrograms(void *a1, const char *a2, ...)
{
  return [a1 leftPrograms];
}

id objc_msgSend_leftSelectedProgram(void *a1, const char *a2, ...)
{
  return [a1 leftSelectedProgram];
}

id objc_msgSend_loadRequiredProperties(void *a1, const char *a2, ...)
{
  return [a1 loadRequiredProperties];
}

id objc_msgSend_micLevel(void *a1, const char *a2, ...)
{
  return [a1 micLevel];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_pairedHearingAids(void *a1, const char *a2, ...)
{
  return [a1 pairedHearingAids];
}

id objc_msgSend_rightBatteryLevel(void *a1, const char *a2, ...)
{
  return [a1 rightBatteryLevel];
}

id objc_msgSend_rightMicrophoneVolume(void *a1, const char *a2, ...)
{
  return [a1 rightMicrophoneVolume];
}

id objc_msgSend_rightMicrophoneVolumeSteps(void *a1, const char *a2, ...)
{
  return [a1 rightMicrophoneVolumeSteps];
}

id objc_msgSend_rightMixedVolume(void *a1, const char *a2, ...)
{
  return [a1 rightMixedVolume];
}

id objc_msgSend_rightMixedVolumeSteps(void *a1, const char *a2, ...)
{
  return [a1 rightMixedVolumeSteps];
}

id objc_msgSend_rightPrograms(void *a1, const char *a2, ...)
{
  return [a1 rightPrograms];
}

id objc_msgSend_rightSelectedProgram(void *a1, const char *a2, ...)
{
  return [a1 rightSelectedProgram];
}

id objc_msgSend_selectedMode(void *a1, const char *a2, ...)
{
  return [a1 selectedMode];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shortDeviceName(void *a1, const char *a2, ...)
{
  return [a1 shortDeviceName];
}

id objc_msgSend_shortDeviceNameColon(void *a1, const char *a2, ...)
{
  return [a1 shortDeviceNameColon];
}

id objc_msgSend_shouldShowHearingComplicationsUI(void *a1, const char *a2, ...)
{
  return [a1 shouldShowHearingComplicationsUI];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_utilitarianSmallFlatForHearingDeviceDataProvider_adjustsIndependently_preferredDisplayMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "utilitarianSmallFlatForHearingDeviceDataProvider:adjustsIndependently:preferredDisplayMode:");
}