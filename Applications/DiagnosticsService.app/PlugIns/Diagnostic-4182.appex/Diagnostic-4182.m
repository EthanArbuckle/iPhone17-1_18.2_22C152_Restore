void sub_100001AD4(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t vars8;

  v3 = [*(id *)(a1 + 32) inputs];
  [v3 runDelay];
  v2 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(void *)(a1 + 32), "runDiagnostic", 0, 1);
  [*(id *)(a1 + 32) setRunTimer:v2];
}

void sub_100001C90(uint64_t a1)
{
  id v14 = +[TouchIDManager runTouchIDDiagnostic:2 options:&__NSDictionary0__struct];
  v2 = [*(id *)(a1 + 32) allResults];
  v3 = [v14 objectForKeyedSubscript:@"testStatus"];
  [v2 addObject:v3];

  v4 = [*(id *)(a1 + 32) result];
  v5 = [v4 statusCode];
  if ([v5 integerValue] != (id)900)
  {
    v6 = [*(id *)(a1 + 32) result];
    v7 = [v6 statusCode];
    if ([v7 integerValue] == (id)-901)
    {
    }
    else
    {
      v8 = [*(id *)(a1 + 32) result];
      v9 = [v8 statusCode];
      id v10 = [v9 integerValue];

      if (v10 == (id)-2) {
        goto LABEL_7;
      }
      v4 = [v14 objectForKeyedSubscript:@"testStatus"];
      v5 = [*(id *)(a1 + 32) result];
      [v5 setStatusCode:v4];
    }
  }

LABEL_7:
  [*(id *)(a1 + 32) setRunCount:[*(id *)(a1 + 32) runCount] + 1];
  unsigned int v11 = [*(id *)(a1 + 32) runCount];
  v12 = [*(id *)(a1 + 32) inputs];
  unsigned int v13 = [v12 numberOfRuns];

  if (v11 == v13) {
    [*(id *)(a1 + 32) finish];
  }
}

void sub_10000263C(id a1)
{
  byte_100008B48 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/BiometricKit.framework/BiometricKit" UTF8String], 1) != 0;
}

void sub_10000271C(id a1)
{
  byte_100008B58 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/NearField.framework/NearField" UTF8String], 1) != 0;
}

void sub_1000027FC(id a1)
{
  byte_100008B68 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/NearFieldAccessory.framework/NearFieldAccessory" UTF8String], 1) != 0;
}

void sub_1000028DC(id a1)
{
  byte_100008B78 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/CoreRepairKit.framework/CoreRepairKit" UTF8String], 1) != 0;
}

void sub_100002978(int a1, NSObject *a2)
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allResults(void *a1, const char *a2, ...)
{
  return [a1 allResults];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_finish(void *a1, const char *a2, ...)
{
  return [a1 finish];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
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

id objc_msgSend_numberOfRuns(void *a1, const char *a2, ...)
{
  return [a1 numberOfRuns];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_runCount(void *a1, const char *a2, ...)
{
  return [a1 runCount];
}

id objc_msgSend_runDelay(void *a1, const char *a2, ...)
{
  return [a1 runDelay];
}

id objc_msgSend_runTimer(void *a1, const char *a2, ...)
{
  return [a1 runTimer];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}