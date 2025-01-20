void sub_100001698(uint64_t a1, void *a2)
{
  id v2;
  uint64_t vars8;

  if (a2)
  {
    v2 = a2;
    if (objc_opt_respondsToSelector()) {
      [v2 shouldCheckWiFiPowerStatus];
    }
  }
}

void sub_1000018EC(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[32])
  {
    NSLog(@"Plugin: signalling presentation complete");
    v2 = *(unsigned char **)(a1 + 32);
  }
  id v3 = [v2 _remoteViewControllerProxy];
  [v3 _signalPresentationComplete];
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void NSLog(NSString *format, ...)
{
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t WiFiDeviceClientGetPower()
{
  return _WiFiDeviceClientGetPower();
}

uint64_t WiFiDeviceClientRegisterPowerCallback()
{
  return _WiFiDeviceClientRegisterPowerCallback();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return _WiFiManagerClientCopyDevices();
}

uint64_t WiFiManagerClientCreate()
{
  return _WiFiManagerClientCreate();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return _WiFiManagerClientScheduleWithRunLoop();
}

uint64_t WiFiManagerClientSetType()
{
  return _WiFiManagerClientSetType();
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

void objc_destroyWeak(id *location)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_msgSend__hostAuditToken(void *a1, const char *a2, ...)
{
  return [a1 _hostAuditToken];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__signalPresentationComplete(void *a1, const char *a2, ...)
{
  return [a1 _signalPresentationComplete];
}

id objc_msgSend_airportAssistantController(void *a1, const char *a2, ...)
{
  return [a1 airportAssistantController];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_hostIsEntitled(void *a1, const char *a2, ...)
{
  return [a1 hostIsEntitled];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_main(void *a1, const char *a2, ...)
{
  return [a1 main];
}

id objc_msgSend_nav(void *a1, const char *a2, ...)
{
  return [a1 nav];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldCheckWiFiPowerStatus(void *a1, const char *a2, ...)
{
  return [a1 shouldCheckWiFiPowerStatus];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_stopSearchingForUnconfiguredAccessories(void *a1, const char *a2, ...)
{
  return [a1 stopSearchingForUnconfiguredAccessories];
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return [a1 viewController];
}

id objc_msgSend_wifiDidShutdown(void *a1, const char *a2, ...)
{
  return [a1 wifiDidShutdown];
}