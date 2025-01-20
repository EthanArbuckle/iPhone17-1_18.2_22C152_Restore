int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;

  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_1000036C0(id a1)
{
  qword_100008708 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  int valuePtr = 1065353216;
  CFNumberRef v1 = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloatType, &valuePtr);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_100008708, kCGImageDestinationLossyCompressionQuality, v1);
  CFRelease(v1);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return _CGImageDestinationCreateWithData(data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return _CGImageDestinationFinalize(idst);
}

void CGImageDestinationSetProperties(CGImageDestinationRef idst, CFDictionaryRef properties)
{
}

uint64_t _UICreateScreenUIImageWithRotation()
{
  return __UICreateScreenUIImageWithRotation();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

CGImage *objc_msgSend_CGImage(id obj, SEL sel, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

[objc_msgSend_serviceListener(a1, a2, ...);
{
  return [a1 serviceListener];
}

[objc_msgSend_setExportedObject_ setExportedObject:];
{
  return [a1 setExportedObject:];
}