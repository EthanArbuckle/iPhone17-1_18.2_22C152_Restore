uint64_t sub_1000014A0(uint64_t a1)
{
  uint64_t vars8;

  qword_100008A18 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100001F38(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100001F60(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100001F7C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100002684()
{
  sub_100001F98();
  sub_100001F7C((void *)&_mh_execute_header, v0, v1, "Class %s not found", v2, v3, v4, v5, v6);
}

void sub_1000026EC()
{
  sub_100001F98();
  sub_100001F7C((void *)&_mh_execute_header, v0, v1, "IO service for %s not found", v2, v3, v4, v5, v6);
}

void sub_100002754()
{
  sub_100001F98();
  sub_100001F7C((void *)&_mh_execute_header, v0, v1, "ioreg entry %@ does not exist", v2, v3, v4, v5, v6);
}

void sub_1000027BC()
{
  sub_100001F54();
  sub_100001F60((void *)&_mh_execute_header, v0, v1, "   Got CFData", v2, v3, v4, v5, v6);
}

void sub_1000027F0()
{
  sub_100001F54();
  sub_100001F60((void *)&_mh_execute_header, v0, v1, "   Got CFString", v2, v3, v4, v5, v6);
}

void sub_100002824()
{
  sub_100001F54();
  sub_100001F38((void *)&_mh_execute_header, v0, v1, "Unsupported type from ioreg", v2, v3, v4, v5, v6);
}

void sub_100002858()
{
  sub_100001F54();
  sub_100001F38((void *)&_mh_execute_header, v0, v1, "Class/name not found", v2, v3, v4, v5, v6);
}

void sub_10000288C()
{
  sub_100001F54();
  sub_100001F38((void *)&_mh_execute_header, v0, v1, "IO service not found", v2, v3, v4, v5, v6);
}

void sub_1000028C0()
{
  sub_100001F54();
  sub_100001F38((void *)&_mh_execute_header, v0, v1, "ioreg entry does not exist", v2, v3, v4, v5, v6);
}

void sub_1000028F4()
{
  sub_100001F54();
  sub_100001F60((void *)&_mh_execute_header, v0, v1, "   Got Boolean", v2, v3, v4, v5, v6);
}

void sub_100002928()
{
  sub_100001F54();
  sub_100001F60((void *)&_mh_execute_header, v0, v1, "   Got Float", v2, v3, v4, v5, v6);
}

void sub_10000295C()
{
  sub_100001F98();
  sub_100001F7C((void *)&_mh_execute_header, v0, v1, "[ERROR] Could not find the service matched by: %@", v2, v3, v4, v5, v6);
}

void sub_1000029C4()
{
  sub_100001F54();
  sub_100001F38((void *)&_mh_execute_header, v0, v1, "[ERROR] Could not create properties", v2, v3, v4, v5, v6);
}

void sub_1000029F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100002A30(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100002A68(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return _CFNumberIsFloatType(number);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return _IOServiceNameMatching(name);
}

uint64_t MFAAComponentAuthCreateSignature()
{
  return _MFAAComponentAuthCreateSignature();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_challenge(void *a1, const char *a2, ...)
{
  return [a1 challenge];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_keyIndex(void *a1, const char *a2, ...)
{
  return [a1 keyIndex];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}