void sub_25C0(id a1)
{
  uint64_t vars8;

  qword_CF88 = objc_alloc_init(EAWiFiUnconfiguredAccessoryBrowserManager);

  _objc_release_x1();
}

void sub_26B4(id a1)
{
}

void sub_2B2C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 128));
  _Unwind_Resume(a1);
}

void sub_2B98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 40)) {
    NSLog(@"WAC: BrowserManager: Extension completed request, items: %@", a3);
  }
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained setRemoteViewController:0];

  id v6 = objc_loadWeakRetained(v4);
  [v6 setCurrentRequestIdentifier:0];
}

void sub_2C1C(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(unsigned char *)(a1 + 40))
  {
    v4 = [a3 localizedDescription];
    NSLog(@"WAC: BrowserManager: Extension cancelled request, error: %@", v4);
  }
  uint64_t v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained setRemoteViewController:0];

  id v7 = objc_loadWeakRetained(v5);
  [v7 setCurrentRequestIdentifier:0];
}

void sub_2CB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40)) {
    NSLog(@"WAC: BrowserManager: WACUI Interrupted, attempting setup again.");
  }
  dispatch_async((dispatch_queue_t)workQueue, &stru_8310);
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained setCurrentRequestIdentifier:0];

  id v6 = objc_loadWeakRetained(v4);
  [v6 setExtension:0];

  id v7 = objc_loadWeakRetained(v4);
  [v7 setRemoteViewController:0];

  id v8 = objc_loadWeakRetained(v4);
  [v8 purgeAccessoriesSet];

  id v9 = objc_loadWeakRetained(v4);
  v10 = (char *)[v9 currentBrowserState];

  if (v10 == (unsigned char *)&dword_0 + 3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_2E9C;
    block[3] = &unk_8338;
    objc_copyWeak(&v15, v4);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v15);
  }
  id v11 = objc_loadWeakRetained(v4);
  [v11 updateState:1];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_2EE8;
  v12[3] = &unk_8338;
  objc_copyWeak(&v13, v4);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
  objc_destroyWeak(&v13);
}

void sub_2E88(id a1)
{
}

void sub_2E9C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissWithStatus:2];
}

void sub_2EE8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setup];
}

intptr_t sub_2F28(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained setRemoteViewController:v6];

  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = objc_loadWeakRetained(v5);
  id v11 = [v10 remoteViewController];
  [v11 setParent:v9];

  id v12 = objc_loadWeakRetained(v5);
  [v12 setCurrentRequestIdentifier:v7];

  if (*(unsigned char *)(a1 + 48)) {
    NSLog(@"WAC: BrowserManager: WACUI setup complete");
  }
  id v13 = setupSemaphore;

  return dispatch_semaphore_signal(v13);
}

void sub_3004(id a1)
{
}

void sub_3024(id a1)
{
}

void sub_3044(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8)) {
    NSLog(@"### WAC XPC: Error: %@", a2);
  }
}

void sub_3184(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    NSLog(@"### WAC XPC:%s:%d", "-[EAWiFiUnconfiguredAccessoryBrowserManager startSearchingForUnconfiguredAccessories]_block_invoke", 292);
    uint64_t v1 = *(void *)(a1 + 32);
  }
  id v3 = *(void **)(v1 + 80);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_323C;
  v5[3] = &unk_83F0;
  v5[4] = v1;
  v4 = [v3 remoteObjectProxyWithErrorHandler:v5];
  [v4 startSearchForAccessoriesNeedingReprovisioning];
}

void sub_323C(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8)) {
    NSLog(@"### WAC XPC: Error: %@", a2);
  }
}

void sub_3274(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteViewController];
  uint64_t v1 = [v2 serviceViewControllerProxy];
  [v1 backendStartSearch];
}

void sub_3380(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteViewController];
  uint64_t v1 = [v2 serviceViewControllerProxy];
  [v1 backendStopSearch];
}

void sub_3470(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteViewController];
  uint64_t v1 = [v2 serviceViewControllerProxy];
  [v1 cancelActiveConfiguration];
}

void sub_36E8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_36FC(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  unsigned __int8 v4 = [WeakRetained isConfiguring];

  if ((v4 & 1) == 0)
  {
    id v5 = objc_loadWeakRetained(v2);
    [v5 setIsConfiguring:1];

    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = objc_loadWeakRetained(v2);
    [v7 setAccessoryBeingConfigured:v6];

    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = objc_loadWeakRetained(v2);
    [v9 setTargetViewController:v8];

    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = *(void **)(v10 + 80);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_38D8;
    v19[3] = &unk_83F0;
    v19[4] = v10;
    id v12 = [v11 remoteObjectProxyWithErrorHandler:v19];
    id v13 = *(void **)(*(void *)(a1 + 48) + 88);
    v14 = [*(id *)(a1 + 32) macAddress];
    id v15 = [v13 objectForKey:v14];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_3910;
    v16[3] = &unk_8440;
    v16[4] = *(void *)(a1 + 48);
    id v17 = *(id *)(a1 + 32);
    objc_copyWeak(&v18, v2);
    [v12 reconfigureAccessory:v15 withReply:v16];

    objc_destroyWeak(&v18);
  }
}

void sub_38C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_38D8(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8)) {
    NSLog(@"### WAC XPC: Error: %@", a2);
  }
}

void sub_3910(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v17 = v5;
  if (a2 != 3)
  {
    if (a2 == 1)
    {
      uint64_t v6 = a1[4];
      if (v6[8])
      {
        NSLog(@"### WAC: %s:%d: Reprovisioning not required for this device", "-[EAWiFiUnconfiguredAccessoryBrowserManager configureAccessory:withConfigurationUIOnViewController:]_block_invoke_3", 375);
LABEL_15:
        uint64_t v6 = a1[4];
      }
    }
    else
    {
      if (!a2)
      {
        uint64_t v6 = a1[4];
        if (v6[8])
        {
          NSLog(@"### WAC: %s:%d: Reprovision Success", "-[EAWiFiUnconfiguredAccessoryBrowserManager configureAccessory:withConfigurationUIOnViewController:]_block_invoke_3", 354);
          uint64_t v6 = a1[4];
        }
        id v7 = (unsigned int *)&kErrorNone;
        goto LABEL_17;
      }
      id v15 = v5;
      uint64_t v6 = a1[4];
      if (v6[8])
      {
        NSLog(@"### WAC: %s:%d: status: %d: error: %@", "-[EAWiFiUnconfiguredAccessoryBrowserManager configureAccessory:withConfigurationUIOnViewController:]_block_invoke_3", 381, a2, v15);
        goto LABEL_15;
      }
    }
    id v7 = (unsigned int *)&kErrorUnexpected;
LABEL_17:
    [v6 dismissWithStatus:*v7];
    goto LABEL_20;
  }
  uint64_t v8 = a1[4];
  if (v8[8])
  {
    NSLog(@"### WAC: %s:%d: Accessory is SecureWAC/HomeKit but not part of user homes", "-[EAWiFiUnconfiguredAccessoryBrowserManager configureAccessory:withConfigurationUIOnViewController:]_block_invoke_3", 359);
    uint64_t v8 = a1[4];
  }
  id v9 = (void *)*((void *)v8 + 11);
  uint64_t v10 = [a1[5] macAddress];
  id v11 = [v9 objectForKey:v10];
  [a1[4] setUnconfiguredDeviceID:v11];

  if (MGGetBoolAnswer())
  {
    id v12 = [a1[5] name];
    id v13 = +[NSString stringWithFormat:@"%@ is an unconfigured Home Accessory", v12];
    CFStringRef v14 = @"SECURE_WAC_WLAN_MESSAGE";
  }
  else
  {
    NSLog(@"### WAC: %s:%d Other Region SKU", "-[EAWiFiUnconfiguredAccessoryBrowserManager configureAccessory:withConfigurationUIOnViewController:]_block_invoke_3", 368);
    id v12 = [a1[5] name];
    id v13 = +[NSString stringWithFormat:@"%@ is an unconfigured Home Accessory", v12];
    CFStringRef v14 = @"SECURE_WAC_WIFI_MESSAGE";
  }
  +[EAPostAlert EANotificationPostAccessoryNotification:v13 forMsg:v14 forDefaultButton:@"OKAY_STRING" withAlternateButton:@"CANCEL_STRING" forNotification:&qword_CF90 withCallback:sub_3B84 andTimeout:0.0];

LABEL_20:
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [WeakRetained setIsConfiguring:0];
}

void sub_3B84(const void *a1, uint64_t a2)
{
  NSLog(@"### WAC: %s:%d responseFlags: %lx", "_notificationCleanup", 42, a2);
  printf("### WAC: %s:%d responseFlags: %lx", "_notificationCleanup", 43, a2);
  if ((const void *)qword_CF90 == a1)
  {
    CFRelease(a1);
    qword_CF90 = 0;
  }
  if (a2 == 1)
  {
    id v4 = +[EAWiFiUnconfiguredAccessoryBrowserManager sharedInstance];
    [v4 dismissWithStatus:4294960573];
  }
  else
  {
    if (a2) {
      return;
    }
    id v4 = +[EAWiFiUnconfiguredAccessoryBrowserManager sharedInstance];
    [v4 openHomeAppForConfiguration];
  }
}

void sub_3C80(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  unsigned __int8 v4 = [WeakRetained isConfiguring];

  if ((v4 & 1) == 0)
  {
    id v5 = objc_loadWeakRetained(v2);
    [v5 setIsConfiguring:1];

    dispatch_async((dispatch_queue_t)workQueue, &stru_8488);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = objc_loadWeakRetained(v2);
    [v7 setAccessoryBeingConfigured:v6];

    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = objc_loadWeakRetained(v2);
    [v9 setTargetViewController:v8];

    id v10 = objc_loadWeakRetained(v2);
    id v11 = [v10 remoteViewController];
    id v12 = [v11 serviceViewControllerProxy];
    id v13 = [*(id *)(a1 + 32) macAddress];
    [v12 backendConfigureAirPortAssistantWithTargetMACAddress:v13];

    id v14 = objc_loadWeakRetained(v2);
    id v15 = [v14 remoteViewController];
    [v15 setModalPresentationStyle:2];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_3E40;
    v16[3] = &unk_84B0;
    objc_copyWeak(&v17, v2);
    v16[4] = *(void *)(a1 + 48);
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v16);
    objc_destroyWeak(&v17);
  }
}

void sub_3E2C(id a1)
{
}

void sub_3E40(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained targetViewController];
  id v3 = [*(id *)(a1 + 32) remoteViewController];
  [v2 presentViewController:v3 animated:1 completion:0];
}

void *sub_4AA0(void *result, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v3 = result;
    NSLog(@"%s: failed to launch URL %@, error: %@", "-[EAWiFiUnconfiguredAccessoryBrowserManager openURL:]_block_invoke", result[4], a3);
    unsigned __int8 v4 = (void *)v3[5];
    return [v4 dismissWithStatus:4294960560];
  }
  return result;
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

void NSLog(NSString *format, ...)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

int printf(const char *a1, ...)
{
  return _printf(a1);
}

id objc_msgSend__signalPresentationComplete(void *a1, const char *a2, ...)
{
  return [a1 _signalPresentationComplete];
}

id objc_msgSend_accessoryBeingConfigured(void *a1, const char *a2, ...)
{
  return [a1 accessoryBeingConfigured];
}

id objc_msgSend_backendStartSearch(void *a1, const char *a2, ...)
{
  return [a1 backendStartSearch];
}

id objc_msgSend_backendStopSearch(void *a1, const char *a2, ...)
{
  return [a1 backendStopSearch];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cancelActiveConfiguration(void *a1, const char *a2, ...)
{
  return [a1 cancelActiveConfiguration];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentBrowserState(void *a1, const char *a2, ...)
{
  return [a1 currentBrowserState];
}

id objc_msgSend_currentRequestIdentifier(void *a1, const char *a2, ...)
{
  return [a1 currentRequestIdentifier];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_extension(void *a1, const char *a2, ...)
{
  return [a1 extension];
}

id objc_msgSend_isConfiguring(void *a1, const char *a2, ...)
{
  return [a1 isConfiguring];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_macAddress(void *a1, const char *a2, ...)
{
  return [a1 macAddress];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_openHomeAppForConfiguration(void *a1, const char *a2, ...)
{
  return [a1 openHomeAppForConfiguration];
}

id objc_msgSend_purgeAccessoriesSet(void *a1, const char *a2, ...)
{
  return [a1 purgeAccessoriesSet];
}

id objc_msgSend_remoteViewController(void *a1, const char *a2, ...)
{
  return [a1 remoteViewController];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 serviceViewControllerProxy];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return [a1 setup];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startSearchForAccessoriesNeedingReprovisioning(void *a1, const char *a2, ...)
{
  return [a1 startSearchForAccessoriesNeedingReprovisioning];
}

id objc_msgSend_stopSearchingForUnconfiguredAccessories(void *a1, const char *a2, ...)
{
  return [a1 stopSearchingForUnconfiguredAccessories];
}

id objc_msgSend_targetViewController(void *a1, const char *a2, ...)
{
  return [a1 targetViewController];
}

id objc_msgSend_unconfiguredDeviceID(void *a1, const char *a2, ...)
{
  return [a1 unconfiguredDeviceID];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_wifiDidShutdown(void *a1, const char *a2, ...)
{
  return [a1 wifiDidShutdown];
}