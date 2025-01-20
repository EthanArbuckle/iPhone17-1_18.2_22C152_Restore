id GetDeviceSpecificDefaults(const __CFString *a1)
{
  void *v1;
  uint64_t vars8;

  v1 = (void *)CFPreferencesCopyAppValue(a1, (CFStringRef)*MEMORY[0x263F28B98]);
  return v1;
}

id HAENotificationsLog()
{
  if (HAENotificationsLog_once != -1) {
    dispatch_once(&HAENotificationsLog_once, &__block_literal_global_11);
  }
  v0 = (void *)HAENotificationsLog_haeNotificationsLog;
  return v0;
}

id __copy_helper_block_e8_40n19_8_8_s0_s8_s16_t24w2(uint64_t a1, uint64_t a2)
{
  return __copy_constructor_8_8_s0_s8_s16_t24w2(a1 + 40, a2 + 40);
}

id __copy_constructor_8_8_s0_s8_s16_t24w2(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(id *)a2;
  *(void *)(a1 + 8) = *(id *)(a2 + 8);
  id result = *(id *)(a2 + 16);
  *(void *)(a1 + 16) = result;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  return result;
}

void __destroy_helper_block_e8_40n11_8_s0_s8_s16(uint64_t a1)
{
}

void __destructor_8_s0_s8_s16(uint64_t a1)
{
  v2 = *(void **)(a1 + 16);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id HAENLocalizationUtilityGetBundle()
{
  if (HAENLocalizationUtilityGetBundle_once != -1) {
    dispatch_once(&HAENLocalizationUtilityGetBundle_once, &__block_literal_global_3);
  }
  v0 = (void *)HAENLocalizationUtilityGetBundle__haeNotificationFrameworkBundle;
  return v0;
}

uint64_t __HAENLocalizationUtilityGetBundle_block_invoke()
{
  HAENLocalizationUtilityGetBundle__haeNotificationFrameworkBundle = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/HAENotifications.framework"];
  return MEMORY[0x270F9A758]();
}

void ReleaseHAENRouteInfo(uint64_t a1)
{
  if (a1)
  {
    v2 = *(const void **)a1;
    if (v2)
    {
      CFRelease(v2);
      *(void *)a1 = 0;
    }
    v3 = *(const void **)(a1 + 8);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(a1 + 8) = 0;
    }
    v4 = *(const void **)(a1 + 16);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(a1 + 16) = 0;
    }
  }
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id NSErrorWithHAENErrorCode(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v2 = [NSDictionary dictionaryWithObject:a2 forKey:*MEMORY[0x263F08320]];
  }
  else
  {
    v2 = 0;
  }
  v3 = [MEMORY[0x263F087E8] errorWithDomain:@"HAENotficiationsError" code:*(void *)"pyt!" userInfo:v2];

  return v3;
}

void settingsChanged(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = HAENotificationsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_21FABA000, v4, OS_LOG_TYPE_DEFAULT, "HAENDefaults received notification: %@", (uint8_t *)&v9, 0xCu);
  }

  if (+[HAENDefaults isCurrentProcessMediaserverd]
    && (([v3 isEqualToString:*MEMORY[0x263F28B78]] & 1) != 0
     || [v3 isEqualToString:*MEMORY[0x263F28B70]]))
  {
    v5 = +[HAENDefaults sharedInstance];
    [v5 updateUserVolumeForVolumeLimit];
  }
  if ([v3 isEqualToString:*MEMORY[0x263F28B60]])
  {
    v6 = +[HAENDefaults sharedInstance];
    [v6 removeAllAdapters];
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F28B80]])
  {
    v6 = +[HAENDefaults sharedInstance];
    [v6 wiredDeviceStatusDidChange];
  }
  else
  {
    int v7 = [v3 isEqualToString:*MEMORY[0x263F28B78]];
    v8 = +[HAENDefaults sharedInstance];
    v6 = v8;
    if (v7)
    {
      [v8 updateRLSSettings];
    }
    else
    {
      [v8 forceReadDefaults];

      v6 = +[HAENUnknownDeviceManager sharedInstance];
      [v6 updateWiredDeviceStatus];
    }
  }
}

void sub_21FAC453C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id errorForIOKitFailure(unsigned int a1)
{
  v14[1] = *MEMORY[0x263EF8340];
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"system=%#x subsystem=%#x code=%#x", a1 >> 26, (a1 >> 14) & 0xFFF, a1 & 0x3FFF);
  id v3 = objc_alloc(MEMORY[0x263F087E8]);
  uint64_t v4 = *MEMORY[0x263F08350];
  uint64_t v13 = *MEMORY[0x263F08320];
  v14[0] = v2;
  v5 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v6 = (void *)[v3 initWithDomain:v4 code:(int)a1 userInfo:v5];

  if (a1 == -536870183) {
    unsigned int v7 = 1;
  }
  else {
    unsigned int v7 = 3;
  }
  uint64_t v11 = *MEMORY[0x263F08608];
  v12 = v6;
  v8 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  uint64_t v9 = makeError(v8, v7);

  return v9;
}

id errorForBadDeviceInfo(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v1 = [NSString stringWithFormat:@"Bad value for device info %@", a1];
  uint64_t v5 = *MEMORY[0x263F08320];
  v6[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v3 = makeError(v2, 4u);

  return v3;
}

id makeError(void *a1, unsigned int a2)
{
  id v3 = (objc_class *)MEMORY[0x263F087E8];
  id v4 = a1;
  id v5 = [v3 alloc];
  v6 = (void *)[v5 initWithDomain:HAENAccessoryInfoErrorDomain code:a2 userInfo:v4];

  return v6;
}

void GeoLocationDidChange(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = HAENotificationsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_21FABA000, v4, OS_LOG_TYPE_DEFAULT, "HAENLocationGating Received Darwin Notification: %@", (uint8_t *)&v6, 0xCu);
  }

  if ([v3 isEqualToString:*MEMORY[0x263F28B68]])
  {
    id v5 = +[HAENLocationGatingHelper sharedInstance];
    [v5 deviceDataDispositionDidChange];
  }
  else
  {
    id v5 = HAENotificationsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      GeoLocationDidChange_cold_1((uint64_t)v3, v5);
    }
  }
}

uint64_t SyncDeviceSpecificDomain()
{
  return CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x263F28B98]);
}

void RemoveDeviceSpecificDefaultsFor(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v1 = a1;
  v2 = HAENotificationsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    id v4 = v1;
    _os_log_impl(&dword_21FABA000, v2, OS_LOG_TYPE_DEFAULT, "removing key: %@", (uint8_t *)&v3, 0xCu);
  }

  CFPreferencesSetAppValue(v1, 0, (CFStringRef)*MEMORY[0x263F28B98]);
}

void SetDeviceSpecificDefaultsFor(__CFString *a1, const void *a2)
{
  if (a2) {
    CFPreferencesSetAppValue(a1, a2, (CFStringRef)*MEMORY[0x263F28B98]);
  }
  else {
    RemoveDeviceSpecificDefaultsFor(a1);
  }
}

uint64_t __HAENotificationsLog_block_invoke()
{
  HAENotificationsLog_haeNotificationsLog = (uint64_t)os_log_create("com.apple.coreaudio.haenotifications", "ADAM");
  return MEMORY[0x270F9A758]();
}

void GeoLocationDidChange_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FABA000, a2, OS_LOG_TYPE_ERROR, "HAENLocationGating action %@ not handled", (uint8_t *)&v2, 0xCu);
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return MEMORY[0x270EE2230]();
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

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x270EE4CB8](keysToFetch, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x270EE54B8](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE5500](userNotification, responseFlags, timeout);
}

uint64_t CMSessionManagerPerformVolumeOperationWithSequenceNumber()
{
  return MEMORY[0x270F49AD0]();
}

uint64_t CMSessionMgrCopyDeviceRouteForRouteConfiguration()
{
  return MEMORY[0x270F49AD8]();
}

uint64_t IOAccessoryManagerCopyDeviceInfo()
{
  return MEMORY[0x270F92560]();
}

uint64_t IOAccessoryManagerGetServiceWithPrimaryPort()
{
  return MEMORY[0x270F92598]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x270EF49D0](*(void *)&entry, properties, allocator, *(void *)&options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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