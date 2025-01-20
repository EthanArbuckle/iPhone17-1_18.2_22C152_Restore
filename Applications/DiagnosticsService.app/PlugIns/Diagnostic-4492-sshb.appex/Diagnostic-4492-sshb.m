id deviceConnectedCallback(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return [a1 deviceConnected:a4];
}

id deviceRemovedCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [a1 deviceDisconnected:a4];
}

void sub_100002380(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 deviceWasAdded:*(void *)(a1 + 32)];
  }
}

id sub_1000023E0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return [a1 hidReportCallback:a3 result:a2 type:a4 reportID:a5 report:a6 reportLength:a7];
}

void sub_10000253C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 deviceWasRemoved:*(void *)(a1 + 32)];
  }
}

void sub_100002C3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 hidReportCallback:*(void *)(a1 + 32) result:*(unsigned int *)(a1 + 56) type:*(unsigned int *)(a1 + 60) reportID:*(unsigned int *)(a1 + 64) report:*(void *)(a1 + 40) reportLength:*(void *)(a1 + 48)];
  }
}

void sub_100004B0C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100006DD0(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Device not connected, cannot get report.", v1, 2u);
}

void sub_100006E14(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Device not connected, cannot set report.", v1, 2u);
}

void sub_100006E58()
{
  sub_100004B28();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Unable to disable gap subtraction with error %@", v2, v3, v4, v5, v6);
}

void sub_100006EC0()
{
  sub_100004B28();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Unable to enable frequent sampling with error %@", v2, v3, v4, v5, v6);
}

void sub_100006F28()
{
  sub_100004B28();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Unable to re-enable gap subtraction with error %@", v2, v3, v4, v5, v6);
}

void sub_100006F90()
{
  sub_100004B28();
  sub_100004B0C((void *)&_mh_execute_header, v0, v1, "Unable to re-disable frequent sampling with error %@", v2, v3, v4, v5, v6);
}

void sub_100006FF8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Turtle disconnected!", v1, 2u);
}

void sub_10000703C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 description];
  sub_100004B28();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Turtle Packet:\n{\n%@\n}", v4, 0xCu);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return _IOHIDDeviceGetProperty(device, key);
}

IOReturn IOHIDDeviceGetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, uint8_t *report, CFIndex *pReportLength)
{
  return _IOHIDDeviceGetReport(device, reportType, reportID, report, pReportLength);
}

void IOHIDDeviceRegisterInputReportCallback(IOHIDDeviceRef device, uint8_t *report, CFIndex reportLength, IOHIDReportCallback callback, void *context)
{
}

IOReturn IOHIDDeviceSetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength)
{
  return _IOHIDDeviceSetReport(device, reportType, reportID, report, reportLength);
}

IOReturn IOHIDManagerClose(IOHIDManagerRef manager, IOOptionBits options)
{
  return _IOHIDManagerClose(manager, options);
}

CFSetRef IOHIDManagerCopyDevices(IOHIDManagerRef manager)
{
  return _IOHIDManagerCopyDevices(manager);
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return _IOHIDManagerCreate(allocator, options);
}

IOReturn IOHIDManagerOpen(IOHIDManagerRef manager, IOOptionBits options)
{
  return _IOHIDManagerOpen(manager, options);
}

void IOHIDManagerRegisterDeviceMatchingCallback(IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
}

void IOHIDManagerRegisterDeviceRemovalCallback(IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
}

void IOHIDManagerScheduleWithRunLoop(IOHIDManagerRef manager, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

void IOHIDManagerSetDeviceMatching(IOHIDManagerRef manager, CFDictionaryRef matching)
{
}

void IOHIDManagerUnscheduleFromRunLoop(IOHIDManagerRef manager, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_acceptedDeviation(void *a1, const char *a2, ...)
{
  return [a1 acceptedDeviation];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_brightnesschange(void *a1, const char *a2, ...)
{
  return [a1 brightnesschange];
}

id objc_msgSend_buffer(void *a1, const char *a2, ...)
{
  return [a1 buffer];
}

id objc_msgSend_bufferSize(void *a1, const char *a2, ...)
{
  return [a1 bufferSize];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cacheDevices(void *a1, const char *a2, ...)
{
  return [a1 cacheDevices];
}

id objc_msgSend_capValue(void *a1, const char *a2, ...)
{
  return [a1 capValue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_cookie(void *a1, const char *a2, ...)
{
  return [a1 cookie];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_csv(void *a1, const char *a2, ...)
{
  return [a1 csv];
}

id objc_msgSend_current(void *a1, const char *a2, ...)
{
  return [a1 current];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_descriptionDictionary(void *a1, const char *a2, ...)
{
  return [a1 descriptionDictionary];
}

id objc_msgSend_detectionMask(void *a1, const char *a2, ...)
{
  return [a1 detectionMask];
}

id objc_msgSend_deviceManager(void *a1, const char *a2, ...)
{
  return [a1 deviceManager];
}

id objc_msgSend_deviceUsageMap(void *a1, const char *a2, ...)
{
  return [a1 deviceUsageMap];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disableGapSubtraction(void *a1, const char *a2, ...)
{
  return [a1 disableGapSubtraction];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_forceValue(void *a1, const char *a2, ...)
{
  return [a1 forceValue];
}

id objc_msgSend_frameNumber(void *a1, const char *a2, ...)
{
  return [a1 frameNumber];
}

id objc_msgSend_frequentSampling(void *a1, const char *a2, ...)
{
  return [a1 frequentSampling];
}

id objc_msgSend_gapValue(void *a1, const char *a2, ...)
{
  return [a1 gapValue];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hidManager(void *a1, const char *a2, ...)
{
  return [a1 hidManager];
}

id objc_msgSend_humidity(void *a1, const char *a2, ...)
{
  return [a1 humidity];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isDownEvent(void *a1, const char *a2, ...)
{
  return [a1 isDownEvent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return [a1 level];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mesaFd(void *a1, const char *a2, ...)
{
  return [a1 mesaFd];
}

id objc_msgSend_mesaFdStuck(void *a1, const char *a2, ...)
{
  return [a1 mesaFdStuck];
}

id objc_msgSend_mesaTemperature(void *a1, const char *a2, ...)
{
  return [a1 mesaTemperature];
}

id objc_msgSend_mesaTemperatureProcessed(void *a1, const char *a2, ...)
{
  return [a1 mesaTemperatureProcessed];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return [a1 orientation];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_primaryUsage(void *a1, const char *a2, ...)
{
  return [a1 primaryUsage];
}

id objc_msgSend_primaryUsagePage(void *a1, const char *a2, ...)
{
  return [a1 primaryUsagePage];
}

id objc_msgSend_rawchannel0(void *a1, const char *a2, ...)
{
  return [a1 rawchannel0];
}

id objc_msgSend_rawchannel1(void *a1, const char *a2, ...)
{
  return [a1 rawchannel1];
}

id objc_msgSend_rawchannel2(void *a1, const char *a2, ...)
{
  return [a1 rawchannel2];
}

id objc_msgSend_rawchannel3(void *a1, const char *a2, ...)
{
  return [a1 rawchannel3];
}

id objc_msgSend_removeSample(void *a1, const char *a2, ...)
{
  return [a1 removeSample];
}

id objc_msgSend_reportID(void *a1, const char *a2, ...)
{
  return [a1 reportID];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_sampleDuration(void *a1, const char *a2, ...)
{
  return [a1 sampleDuration];
}

id objc_msgSend_sendRawData(void *a1, const char *a2, ...)
{
  return [a1 sendRawData];
}

id objc_msgSend_sequence(void *a1, const char *a2, ...)
{
  return [a1 sequence];
}

id objc_msgSend_statusCodeSet(void *a1, const char *a2, ...)
{
  return [a1 statusCodeSet];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_temperature(void *a1, const char *a2, ...)
{
  return [a1 temperature];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_turtle(void *a1, const char *a2, ...)
{
  return [a1 turtle];
}

id objc_msgSend_turtleData(void *a1, const char *a2, ...)
{
  return [a1 turtleData];
}

id objc_msgSend_turtleRef(void *a1, const char *a2, ...)
{
  return [a1 turtleRef];
}

id objc_msgSend_turtleWasConnected(void *a1, const char *a2, ...)
{
  return [a1 turtleWasConnected];
}

id objc_msgSend_turtleWasDisconnected(void *a1, const char *a2, ...)
{
  return [a1 turtleWasDisconnected];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_usageDeviceMap(void *a1, const char *a2, ...)
{
  return [a1 usageDeviceMap];
}

id objc_msgSend_usageSubscribers(void *a1, const char *a2, ...)
{
  return [a1 usageSubscribers];
}

id objc_msgSend_voltage(void *a1, const char *a2, ...)
{
  return [a1 voltage];
}

id objc_msgSend_wattage(void *a1, const char *a2, ...)
{
  return [a1 wattage];
}

id objc_msgSend_x(void *a1, const char *a2, ...)
{
  return [a1 x];
}

id objc_msgSend_y(void *a1, const char *a2, ...)
{
  return [a1 y];
}

id objc_msgSend_z(void *a1, const char *a2, ...)
{
  return [a1 z];
}