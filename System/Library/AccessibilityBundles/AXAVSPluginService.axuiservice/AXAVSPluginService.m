void sub_1594(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_15B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateDisplayOnState];
    id WeakRetained = v2;
  }
}

void sub_17DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1804(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _monitorAVSSupport];
}

void sub_1844(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if ((byte_8B50 & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        return;
      }
      AXPerformBlockAsynchronouslyOnMainThread();
    }
    byte_8B50 = 1;
  }
}

void sub_1C98(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  v6 = +[AXUIDisplayManager sharedDisplayManager];
  id v7 = [v6 showAlertWithText:v5 subtitleText:v8 iconImage:0 type:6 priority:30 duration:*(void *)(a1 + 32) forService:3.0];
}

id sub_1E90(uint64_t a1)
{
  return [*(id *)(a1 + 32) _monitorAVSPausingSupport];
}

id sub_2194(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) avsShouldBeOn];
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 _monitorAVSSupport];
  }
  return result;
}

void sub_21E0(uint64_t a1, void *a2, NSObject *a3)
{
  id v5 = +[NSNumber numberWithInt:a1];
  v6 = +[NSNumber numberWithUnsignedLongLong:*a2];
  int v7 = 138412546;
  id v8 = v5;
  __int16 v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "Display status ambiguous: notify_get_state status %@ != NOTIFY_STATUS_OK and state == %@", (uint8_t *)&v7, 0x16u);
}

void sub_22B4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Fail to register for screen state change", v1, 2u);
}

void sub_22F8(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Received message: Startup", v1, 2u);
}

void sub_233C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Error reading file into buffer", v1, 2u);
}

uint64_t AXLogAVS()
{
  return _AXLogAVS();
}

uint64_t AXLogCommon()
{
  return _AXLogCommon();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return _AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t AXkMobileKeyBagLockStatusNotificationID()
{
  return _AXkMobileKeyBagLockStatusNotificationID();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return _notify_is_valid_token(val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

id objc_msgSend__deviceSupportsVoiceTriggersWhileDisplayOff(void *a1, const char *a2, ...)
{
  return [a1 _deviceSupportsVoiceTriggersWhileDisplayOff];
}

id objc_msgSend__hideContentViewController(void *a1, const char *a2, ...)
{
  return [a1 _hideContentViewController];
}

id objc_msgSend__monitorAVSSupport(void *a1, const char *a2, ...)
{
  return [a1 _monitorAVSSupport];
}

id objc_msgSend__queryIsDisplayOn(void *a1, const char *a2, ...)
{
  return [a1 _queryIsDisplayOn];
}

id objc_msgSend__registerForSpringboardNotifications(void *a1, const char *a2, ...)
{
  return [a1 _registerForSpringboardNotifications];
}

id objc_msgSend__stopMonitoring(void *a1, const char *a2, ...)
{
  return [a1 _stopMonitoring];
}

id objc_msgSend__updateDisplayOnState(void *a1, const char *a2, ...)
{
  return [a1 _updateDisplayOnState];
}

id objc_msgSend_avsShouldBeOn(void *a1, const char *a2, ...)
{
  return [a1 avsShouldBeOn];
}

id objc_msgSend_batteryState(void *a1, const char *a2, ...)
{
  return [a1 batteryState];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_displayOnMonitor(void *a1, const char *a2, ...)
{
  return [a1 displayOnMonitor];
}

id objc_msgSend_isAdaptiveVoiceShortcutsEnabled(void *a1, const char *a2, ...)
{
  return [a1 isAdaptiveVoiceShortcutsEnabled];
}

id objc_msgSend_isBatteryMonitoringEnabled(void *a1, const char *a2, ...)
{
  return [a1 isBatteryMonitoringEnabled];
}

id objc_msgSend_isDisplayOn(void *a1, const char *a2, ...)
{
  return [a1 isDisplayOn];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_notifyToken(void *a1, const char *a2, ...)
{
  return [a1 notifyToken];
}

id objc_msgSend_pauseListening(void *a1, const char *a2, ...)
{
  return [a1 pauseListening];
}

id objc_msgSend_processingFormat(void *a1, const char *a2, ...)
{
  return [a1 processingFormat];
}

id objc_msgSend_resumeListening(void *a1, const char *a2, ...)
{
  return [a1 resumeListening];
}

id objc_msgSend_sampleRate(void *a1, const char *a2, ...)
{
  return [a1 sampleRate];
}

id objc_msgSend_sharedDisplayManager(void *a1, const char *a2, ...)
{
  return [a1 sharedDisplayManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shortcuts(void *a1, const char *a2, ...)
{
  return [a1 shortcuts];
}

id objc_msgSend_startListening(void *a1, const char *a2, ...)
{
  return [a1 startListening];
}

id objc_msgSend_stopListening(void *a1, const char *a2, ...)
{
  return [a1 stopListening];
}