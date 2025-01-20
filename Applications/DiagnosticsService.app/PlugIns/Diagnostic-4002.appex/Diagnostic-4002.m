void sub_1000043D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004424(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v7)
    {
      v9 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000059C0((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      goto LABEL_18;
    }
    [v6 setDelegate:WeakRetained];
    v16 = [WeakRetained _appletAID];
    v17 = [v6 appletWithIdentifier:v16];

    if (v17)
    {
      if ([v6 setActiveApplet:v17])
      {
        if ([v6 startCardEmulation])
        {
          objc_storeStrong((id *)WeakRetained + 6, a2);
          char v18 = 1;
LABEL_17:
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v18;

LABEL_18:
          dispatch_semaphore_signal(*((dispatch_semaphore_t *)WeakRetained + 1));
          goto LABEL_19;
        }
        v19 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_100005958();
        }
      }
      else
      {
        v19 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_10000598C();
        }
      }
    }
    else
    {
      v19 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000058E0(v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }

    char v18 = 0;
    goto LABEL_17;
  }
LABEL_19:
}

void sub_1000046AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = [(objc_class *)+[DASoftLinking nearFieldClass:@"NFHardwareManager"] sharedHardwareManager];
    v4 = [WeakRetained contactlessSession];

    if (v4)
    {
      v5 = [WeakRetained contactlessSession];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10000485C;
      v18[3] = &unk_100008238;
      v18[4] = WeakRetained;
      [v5 endSessionWithCompletion:v18];
    }
    double v7 = *(double *)(a1 + 48);
    uint64_t v6 = a1 + 48;
    v8 = *(NSObject **)(*(void *)(v6 - 16) + 16);
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    if (dispatch_semaphore_wait(v8, v9))
    {
      uint64_t v10 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100005A60(v6, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    v17 = [WeakRetained contactlessSession];
    [v17 setDelegate:0];

    [WeakRetained setContactlessSession:0];
    [WeakRetained setSessionController:0];
    [v3 invalidateConnection];
  }
  else
  {
    v3 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100005A2C();
    }
  }
}

intptr_t sub_10000485C(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 16));
}

void sub_1000052A4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000052C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000532C(id a1)
{
  byte_10000CCA8 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/BiometricKit.framework/BiometricKit" UTF8String], 1) != 0;
}

void sub_10000540C(id a1)
{
  byte_10000CCB8 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/NearField.framework/NearField" UTF8String], 1) != 0;
}

void sub_1000054EC(id a1)
{
  byte_10000CCC8 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/NearFieldAccessory.framework/NearFieldAccessory" UTF8String], 1) != 0;
}

void sub_1000055CC(id a1)
{
  byte_10000CCD8 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/CoreRepairKit.framework/CoreRepairKit" UTF8String], 1) != 0;
}

BOOL isValidSerialNumber(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  BOOL v2 = (objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v1 length] > 3;

  return v2;
}

void sub_1000056C8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "NSError variable was nil.  New unsaved error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100005740(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "NSError variable was previously assigned.  New unsaved error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000057B8(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Hardware state error: %u. not supported, dont retry", (uint8_t *)v1, 8u);
}

void sub_100005838()
{
  sub_1000052DC();
  sub_1000052A4((void *)&_mh_execute_header, v0, v1, "Timeout occurred trying to start Echo Applet!", v2, v3, v4, v5, v6);
}

void sub_10000586C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000058E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005958()
{
  sub_1000052DC();
  sub_1000052A4((void *)&_mh_execute_header, v0, v1, "Could not start card emulation!", v2, v3, v4, v5, v6);
}

void sub_10000598C()
{
  sub_1000052DC();
  sub_1000052A4((void *)&_mh_execute_header, v0, v1, "Could not set applet!", v2, v3, v4, v5, v6);
}

void sub_1000059C0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005A2C()
{
  sub_1000052DC();
  sub_1000052A4((void *)&_mh_execute_header, v0, v1, "Unable to stop card emulation - failed to preserve self into dispatch_sync", v2, v3, v4, v5, v6);
}

void sub_100005A60(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005AD0()
{
  sub_1000052DC();
  sub_1000052A4((void *)&_mh_execute_header, v0, v1, "Unable to capture user NFC Enabled state. Not overriding enablement", v2, v3, v4, v5, v6);
}

void sub_100005B04(void *a1, uint64_t a2, NSObject *a3)
{
  int v5 = 134218242;
  id v6 = [a1 userNfcEnabledState];
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to restore NFC radio state to %ld! Error: %@", (uint8_t *)&v5, 0x16u);
}

void sub_100005BA0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005C0C()
{
  sub_1000052DC();
  sub_1000052A4((void *)&_mh_execute_header, v0, v1, "Could not get reference to secure element when attempting to determine appropriate applet ID", v2, v3, v4, v5, v6);
}

void sub_100005C40(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__appletAID(void *a1, const char *a2, ...)
{
  return [a1 _appletAID];
}

id objc_msgSend_checkPresence(void *a1, const char *a2, ...)
{
  return [a1 checkPresence];
}

id objc_msgSend_contactlessSession(void *a1, const char *a2, ...)
{
  return [a1 contactlessSession];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_embeddedSecureElement(void *a1, const char *a2, ...)
{
  return [a1 embeddedSecureElement];
}

id objc_msgSend_endSession(void *a1, const char *a2, ...)
{
  return [a1 endSession];
}

id objc_msgSend_getHwSupport(void *a1, const char *a2, ...)
{
  return [a1 getHwSupport];
}

id objc_msgSend_hwType(void *a1, const char *a2, ...)
{
  return [a1 hwType];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_invalidateConnection(void *a1, const char *a2, ...)
{
  return [a1 invalidateConnection];
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

id objc_msgSend_isInIORegistry(void *a1, const char *a2, ...)
{
  return [a1 isInIORegistry];
}

id objc_msgSend_isNearFieldAccessoryFrameworkAvailable(void *a1, const char *a2, ...)
{
  return [a1 isNearFieldAccessoryFrameworkAvailable];
}

id objc_msgSend_isNearFieldFrameworkAvailable(void *a1, const char *a2, ...)
{
  return [a1 isNearFieldFrameworkAvailable];
}

id objc_msgSend_isNfcDisabledByProfile(void *a1, const char *a2, ...)
{
  return [a1 isNfcDisabledByProfile];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_nearField(void *a1, const char *a2, ...)
{
  return [a1 nearField];
}

id objc_msgSend_osdStockholmDidDetectField(void *a1, const char *a2, ...)
{
  return [a1 osdStockholmDidDetectField];
}

id objc_msgSend_osdStockholmDidEndUnexpectedly(void *a1, const char *a2, ...)
{
  return [a1 osdStockholmDidEndUnexpectedly];
}

id objc_msgSend_osdStockholmDidSelectEchoApplet(void *a1, const char *a2, ...)
{
  return [a1 osdStockholmDidSelectEchoApplet];
}

id objc_msgSend_overrideNfcEnabledState(void *a1, const char *a2, ...)
{
  return [a1 overrideNfcEnabledState];
}

id objc_msgSend_registrationInfo(void *a1, const char *a2, ...)
{
  return [a1 registrationInfo];
}

id objc_msgSend_restoreNfcEnabledState(void *a1, const char *a2, ...)
{
  return [a1 restoreNfcEnabledState];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_sharedHardwareManager(void *a1, const char *a2, ...)
{
  return [a1 sharedHardwareManager];
}

id objc_msgSend_sharedRemoteAdminManager(void *a1, const char *a2, ...)
{
  return [a1 sharedRemoteAdminManager];
}

id objc_msgSend_shouldOverrideUserNFC(void *a1, const char *a2, ...)
{
  return [a1 shouldOverrideUserNFC];
}

id objc_msgSend_startCardEmulation(void *a1, const char *a2, ...)
{
  return [a1 startCardEmulation];
}

id objc_msgSend_updateUserNfcEnabledState(void *a1, const char *a2, ...)
{
  return [a1 updateUserNfcEnabledState];
}

id objc_msgSend_userNfcEnabledState(void *a1, const char *a2, ...)
{
  return [a1 userNfcEnabledState];
}

id objc_msgSend_userNfcEnabledStateCaptured(void *a1, const char *a2, ...)
{
  return [a1 userNfcEnabledStateCaptured];
}