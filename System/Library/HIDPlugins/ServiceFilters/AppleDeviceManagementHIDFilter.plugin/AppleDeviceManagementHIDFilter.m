uint64_t crc16_reset()
{
  return 0;
}

uint64_t crc16_updateByte(unsigned int a1, char a2)
{
  return word_9A78[(a1 ^ a2)] ^ (a1 >> 8);
}

uint64_t crc16_updateBuffer(uint64_t result, char *a2, int a3)
{
  for (; a3; --a3)
  {
    char v3 = *a2++;
    LODWORD(result) = word_9A78[(v3 ^ result)] ^ ((unsigned __int16)(result & 0xFF00) >> 8);
  }
  return (unsigned __int16)result;
}

uint64_t crc16_compute(char *a1, int a2)
{
  for (LOWORD(v2) = 0; a2; --a2)
  {
    char v3 = *a1++;
    int v2 = word_9A78[(v3 ^ v2)] ^ ((unsigned __int16)(v2 & 0xFF00) >> 8);
  }
  return (unsigned __int16)v2;
}

void sub_3D64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3D8C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  v10 = (id *)(a1 + 32);
  id v11 = a6;
  id v12 = a2;
  id WeakRetained = objc_loadWeakRetained(v10);
  [WeakRetained inputReportHandler:v12 timestamp:a3 type:a4 reportID:a5 report:v11];
}

id sub_4280(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v3 = 0;
  return [v1 extractCrashlogsWithError:&v3];
}

void sub_54D4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_5500()
{
  return v0;
}

void sub_550C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_5528(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sub_5548(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_5A48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_5A64(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cleanupTimerFired];
}

void sub_5AA4(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained crashlogExtractedAction:v3];
}

void sub_6858(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_6D40(id a1)
{
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  id v4 = objc_claimAutoreleasedReturnValue();
  os_log_t v2 = os_log_create("com.apple.hid.AppleTopCase", (const char *)[v4 UTF8String]);
  id v3 = (void *)qword_11328;
  qword_11328 = (uint64_t)v2;
}

void sub_75F0(void *a1, const char *a2)
{
  id v3 = a1;
  id v4 = NSStringFromSelector(a2);
  sub_54F4();
  _os_log_debug_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "%@", v5, 0xCu);
}

void sub_7698(uint64_t *a1, NSObject *a2)
{
  if (a1) {
    uint64_t v2 = *a1;
  }
  else {
    uint64_t v2 = 0;
  }
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "get report failed when trying to get crashlog info report: error %@", (uint8_t *)&v3, 0xCu);
}

void sub_7720(void *a1)
{
  id v2 = a1;
  int v3 = (const char *)sub_5500();
  uint64_t v4 = NSStringFromSelector(v3);
  sub_54F4();
  sub_54D4(&dword_0, v5, v6, "%@", v7, v8, v9, v10, v11);
}

void sub_77B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_77E8(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Calling crashlog extracted callback...", buf, 2u);
}

void sub_7828(char a1, int *a2, os_log_t log)
{
  CFStringRef v3 = @"unsuccessfully";
  int v4 = *a2;
  if (a1) {
    CFStringRef v3 = @"sucessfully";
  }
  int v5 = 138412546;
  CFStringRef v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Payload size was %@ received, using payload size of %d", (uint8_t *)&v5, 0x12u);
}

void sub_78CC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_7904(void *a1, const char *a2, uint64_t a3)
{
  int v5 = a1;
  CFStringRef v6 = NSStringFromSelector(a2);
  sub_54F4();
  __int16 v8 = 2112;
  uint64_t v9 = a3;
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%@ infoEntry: %@", v7, 0x16u);
}

void sub_79C0(unsigned __int8 a1, uint64_t *a2, NSObject *a3)
{
  if (a2) {
    uint64_t v3 = *a2;
  }
  else {
    uint64_t v3 = 0;
  }
  LODWORD(v4) = 67109378;
  HIDWORD(v4) = a1;
  LOWORD(v5) = 2112;
  *(void *)((char *)&v5 + 2) = v3;
  sub_5548(&dword_0, (uint64_t)a2, a3, "set report failed when trying to clear crashlog with ID %d: error %@", v4, (void)v5, HIWORD(v3));
}

void sub_7A4C(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  sub_54F4();
  sub_5528(&dword_0, v5, v6, "%@, crashlog ID %u", v7, v8, v9, v10, v11);
}

void sub_7AFC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_7B34(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  if (a1) {
    uint64_t v3 = *a1;
  }
  else {
    uint64_t v3 = 0;
  }
  LODWORD(v4) = 67109378;
  HIDWORD(v4) = a2;
  LOWORD(v5) = 2112;
  *(void *)((char *)&v5 + 2) = v3;
  sub_5548(&dword_0, a2, a3, "set report failed when trying to set payload size to %d: error %@", v4, (void)v5, HIWORD(v3));
}

void sub_7BBC(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  sub_54F4();
  sub_5528(&dword_0, v5, v6, "%@, size %u", v7, v8, v9, v10, v11);
}

void sub_7C68(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  int v3 = 136315650;
  uint64_t v4 = "YES";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2048;
  uint64_t v8 = v2;
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Service matched: %s, service: %@, score: %ld", (uint8_t *)&v3, 0x20u);
}

void sub_7D0C(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  sub_54F4();
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@", v2, 0xCu);
}

void sub_7DA0(void *a1, id *a2)
{
  int v3 = a1;
  id WeakRetained = objc_loadWeakRetained(a2);
  sub_54F4();
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "Failed to find hid device for service %@", v5, 0xCu);
}

void sub_7E44(void *a1, const char *a2, uint64_t a3)
{
  __int16 v5 = a1;
  uint64_t v6 = NSStringFromSelector(a2);
  sub_6844();
  uint64_t v9 = a3;
  sub_6858(&dword_0, v5, v7, "%@, service %@", v8);
}

void sub_7EF4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Palmspring crashlogs are not supported, cannot trigger extraction", v1, 2u);
}

void sub_7F38(void *a1, char a2, NSObject *a3)
{
  CFStringRef v3 = @"YES";
  if (*a1) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  if (a2) {
    CFStringRef v3 = @"NO";
  }
  int v5 = 138412546;
  CFStringRef v6 = v4;
  __int16 v7 = 2112;
  CFStringRef v8 = v3;
  sub_6858(&dword_0, a3, (uint64_t)a3, "Cannot collect palmspring crashlog error stats (crashlogs supported %@, authenticated %@)", (uint8_t *)&v5);
}

void sub_7FDC(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to start crashlog manager", v1, 2u);
}

void sub_8020()
{
  sub_6844();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "Failed to write crashlog %@ to file, dropping crashlog: err %@", v2, 0x16u);
}

void sub_809C(void *a1, const char *a2, uint64_t a3)
{
  int v5 = a1;
  CFStringRef v6 = NSStringFromSelector(a2);
  sub_6844();
  uint64_t v9 = a3;
  sub_6858(&dword_0, v5, v7, "%@, crashlog %@", v8);
}

void sub_8148(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Crashlog save path was found but it is a file, not a directory", v1, 2u);
}

void sub_818C(os_log_t log)
{
  int v1 = 138412290;
  CFStringRef v2 = @"/Library/Logs/hidfw-crashlogs";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "%@ does not exist, no cleanup necessary", (uint8_t *)&v1, 0xCu);
}

void sub_8210()
{
  sub_6844();
  CFStringRef v3 = @"/Library/Logs/hidfw-crashlogs";
  sub_6858(&dword_0, v0, v1, "Cleanup timer triggered, deleting crashlogs older than %@ in %@", v2);
}

void sub_8288(void *a1, void *a2)
{
  CFStringRef v3 = a1;
  [a2 length];
  sub_54F4();
  __int16 v5 = 2048;
  uint64_t v6 = 5;
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "Crashlog info did not contain the report ID and full header (bytes: %ld, report ID + header size: %lu)", v4, 0x16u);
}

void sub_8330(void *a1, void *a2, int a3)
{
  __int16 v5 = a1;
  [a2 length];
  sub_54F4();
  __int16 v7 = 1024;
  int v8 = a3;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Received crashlog info report does not contain the expected amount of bytes based on the header (received %ld, expected %d)", v6, 0x12u);
}

void sub_83E0(void *a1, const char *a2)
{
  CFStringRef v3 = a1;
  CFStringRef v4 = NSStringFromSelector(a2);
  sub_54F4();
  _os_log_debug_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "%@", v5, 0xCu);
}

void sub_8484(void *a1, NSObject *a2)
{
  v4[0] = 67109632;
  v4[1] = [a1 uniqueID];
  __int16 v5 = 2048;
  uint64_t v6 = 8;
  __int16 v7 = 1024;
  unsigned int v8 = [a1 headerAndRawBlobSize];
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Crashlog (%d) does not have a full header: header size %ld, crashlog header+blob size %d", (uint8_t *)v4, 0x18u);
}

void sub_8544(void *a1, unsigned __int8 *a2, NSObject *a3)
{
  unsigned int v5 = [a1 uniqueID];
  int v6 = *a2;
  int v7 = a2[1];
  int v8 = *(_DWORD *)(a2 + 2);
  int v9 = *((unsigned __int16 *)a2 + 3);
  v10[0] = 67110144;
  v10[1] = v5;
  __int16 v11 = 1024;
  int v12 = v6;
  __int16 v13 = 1024;
  int v14 = v7;
  __int16 v15 = 1024;
  int v16 = v8;
  __int16 v17 = 1024;
  int v18 = v9;
  _os_log_debug_impl(&dword_0, a3, OS_LOG_TYPE_DEBUG, "Crashlog (%d) header: blob version %d, type %d, blob size %d, crc16 0x%04x", (uint8_t *)v10, 0x20u);
}

void sub_8608(const char *a1, NSObject *a2)
{
  CFStringRef v3 = NSStringFromSelector(a1);
  sub_54F4();
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "%@", v4, 0xCu);
}

void sub_869C()
{
  sub_54F4();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "Failed to create directory %@: error %@", v2, 0x16u);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotificationWithOptions(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, CFOptionFlags options)
{
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return _IORegistryEntryCreateIterator(entry, plane, options, iterator);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return _IORegistryEntryIDMatching(entryID);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
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

void dispatch_activate(dispatch_object_t object)
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return _xpc_copy_entitlement_for_token();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_autoExtract(void *a1, const char *a2, ...)
{
  return [a1 autoExtract];
}

id objc_msgSend_blobVersion(void *a1, const char *a2, ...)
{
  return [a1 blobVersion];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cleanupTimerFired(void *a1, const char *a2, ...)
{
  return [a1 cleanupTimerFired];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_crashlogPathExtension(void *a1, const char *a2, ...)
{
  return [a1 crashlogPathExtension];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
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

id objc_msgSend_extractionHistory(void *a1, const char *a2, ...)
{
  return [a1 extractionHistory];
}

id objc_msgSend_headerAndRawBlobSize(void *a1, const char *a2, ...)
{
  return [a1 headerAndRawBlobSize];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_lastCrashlog(void *a1, const char *a2, ...)
{
  return [a1 lastCrashlog];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_maxInfoReportSize(void *a1, const char *a2, ...)
{
  return [a1 maxInfoReportSize];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_serviceID(void *a1, const char *a2, ...)
{
  return [a1 serviceID];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}