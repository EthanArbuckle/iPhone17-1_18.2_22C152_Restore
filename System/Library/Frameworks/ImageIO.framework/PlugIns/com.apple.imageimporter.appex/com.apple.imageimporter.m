void sub_1000013FC(id a1)
{
  qword_100008470 = (uint64_t)objc_alloc_init((Class)NSNumberFormatter);
  qword_100008478 = (uint64_t)objc_alloc_init((Class)NSNumberFormatter);
  qword_100008480 = (uint64_t)objc_alloc_init((Class)NSNumberFormatter);
}

void sub_1000014C4(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  qword_100008490 = (uint64_t)v1;

  [v1 setDateFormat:@"yyyy:MM:dd HH:mm:ss"];
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return _CFMakeCollectable(cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCopyPropertiesAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithURL(url, options);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_contentCreationDate(void *a1, const char *a2, ...)
{
  return [a1 contentCreationDate];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_fractionString(void *a1, const char *a2, ...)
{
  return [a1 fractionString];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_pixelHeight(void *a1, const char *a2, ...)
{
  return [a1 pixelHeight];
}

id objc_msgSend_pixelWidth(void *a1, const char *a2, ...)
{
  return [a1 pixelWidth];
}

id objc_msgSend_updateAttributes_withTIFFProperties_forISR_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAttributes:withTIFFProperties:forISR:");
}