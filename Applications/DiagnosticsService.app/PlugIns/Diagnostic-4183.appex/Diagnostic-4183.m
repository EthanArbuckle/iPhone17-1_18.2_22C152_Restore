void sub_100002B54(id a1)
{
  byte_1000083C0 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/BiometricKit.framework/BiometricKit" UTF8String], 1) != 0;
}

void sub_100002C34(id a1)
{
  byte_1000083D0 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/NearField.framework/NearField" UTF8String], 1) != 0;
}

void sub_100002D14(id a1)
{
  byte_1000083E0 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/NearFieldAccessory.framework/NearFieldAccessory" UTF8String], 1) != 0;
}

void sub_100002DF4(id a1)
{
  byte_1000083F0 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/CoreRepairKit.framework/CoreRepairKit" UTF8String], 1) != 0;
}

void sub_1000033F8(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "BiometricKit diagnostic encountered unexpected error code: %d", (uint8_t *)v2, 8u);
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
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

void objc_release(id a1)
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

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_isBiometricKitFrameworkAvailable(void *a1, const char *a2, ...)
{
  return [a1 isBiometricKitFrameworkAvailable];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isCoreRepairFrameworkAvailable(void *a1, const char *a2, ...)
{
  return [a1 isCoreRepairFrameworkAvailable];
}

id objc_msgSend_isNearFieldAccessoryFrameworkAvailable(void *a1, const char *a2, ...)
{
  return [a1 isNearFieldAccessoryFrameworkAvailable];
}

id objc_msgSend_isNearFieldFrameworkAvailable(void *a1, const char *a2, ...)
{
  return [a1 isNearFieldFrameworkAvailable];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}