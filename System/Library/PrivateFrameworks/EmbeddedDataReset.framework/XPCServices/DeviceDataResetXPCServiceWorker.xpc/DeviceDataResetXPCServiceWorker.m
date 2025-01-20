void sub_100001880(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    v5 = DDRLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000886C((uint64_t)v4, v5);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id DDRLogForCategory(unint64_t a1)
{
  if (a1 >= 4) {
    sub_1000088E4();
  }
  if (qword_100018668 != -1) {
    dispatch_once(&qword_100018668, &stru_100010600);
  }
  v2 = (void *)qword_100018648[a1];
  return v2;
}

void sub_100001978(id a1)
{
  os_log_t v1 = os_log_create("com.apple.devicedatareset.xpcserviceworker", "DeviceDataResetDefault");
  v2 = (void *)qword_100018648[0];
  qword_100018648[0] = (uint64_t)v1;

  os_log_t v3 = os_log_create("com.apple.devicedatareset.xpcserviceworker", "DeviceDataResetProgress");
  v4 = (void *)qword_100018650;
  qword_100018650 = (uint64_t)v3;

  os_log_t v5 = os_log_create("com.apple.devicedatareset.daemon", "DeviceDataResetDaemon");
  v6 = (void *)qword_100018658;
  qword_100018658 = (uint64_t)v5;

  qword_100018660 = (uint64_t)os_log_create("com.apple.devicedatareset.framework", "DeviceDataResetFramework");
  _objc_release_x1();
}

void sub_100002288(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100002680(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = 0;
  unsigned int v3 = [v2 leaveClique:&v6];
  id v4 = v6;
  os_log_t v5 = DDRLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    unsigned int v8 = v3;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Octagon removal complete. Succeeded: %{BOOL}d, Error: %{public}@", buf, 0x12u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100002930(id a1)
{
  id v1 = +[CLLocationManager sharedManager];
  [v1 resetApps];
}

void sub_100002C50(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  os_log_t v5 = DDRLogForCategory(0);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100008C04((uint64_t)v4, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "sign out Apple Accounts success", v7, 2u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100002DE8(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v2 = *(void **)(a1 + 40);
  return [v2 invalidate];
}

void sub_1000032D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000330C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _incrementCurrentResetTaskProgress];
}

id _locale()
{
  v0 = (void *)CFPreferencesCopyValue(@"AppleLocale", kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  return v0;
}

id _languages()
{
  v0 = (void *)CFPreferencesCopyValue(@"AppleLanguages", kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  return v0;
}

id _keyboards()
{
  v0 = (void *)CFPreferencesCopyValue(@"AppleKeyboards", kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  return v0;
}

uint64_t sub_100004C20()
{
  v0 = +[NSUserDefaults standardUserDefaults];
  [v0 synchronize];

  return CFPreferencesSynchronize(kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
}

void sub_100005120(id a1)
{
  id v1 = DDRLogForCategory(0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "I am invalidated at DDRWorkerServer!", v2, 2u);
  }
}

void sub_10000518C(id a1)
{
  id v1 = DDRLogForCategory(0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "I am interrupted at DDRWorkerServer!", v2, 2u);
  }
}

int main(int argc, const char **argv, const char **envp)
{
  unsigned int v3 = objc_alloc_init(DDRWorkerServer);
  [(DDRWorkerServer *)v3 start];

  return 0;
}

void sub_1000055CC(id a1)
{
  id v1 = +[TUCallCenter sharedInstance];
  [v1 disconnectAllCalls];
}

void sub_100005F30(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100005F50(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (v5) {
    [WeakRetained setFetchError:v5];
  }
  else {
    [WeakRetained setPairedDevice:v8];
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100006294(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    unsigned int v3 = DDRLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100008D88(a1, v3);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void _removeFiles(void *a1)
{
  id v8 = a1;
  id v1 = NSHomeDirectory();
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"Media"];

  unsigned int v3 = (char *)[v8 count];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0;
    id v6 = 0;
    do
    {
      v7 = [v8 objectAtIndex:v5];

      [v7 hasPrefix:v2];
      id v6 = v7;
      [v6 fileSystemRepresentation];
      CPDeleteTree();
      ++v5;
    }
    while (v4 != v5);
  }
}

void removeSubFiles(void *a1, void *a2)
{
  id v19 = a1;
  id v3 = a2;
  id v4 = +[NSFileManager defaultManager];
  id v5 = [v4 contentsOfDirectoryAtPath:v19 error:0];

  id v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = (char *)[v5 count];
  if (v7)
  {
    id v8 = v7;
    __int16 v9 = 0;
    id v10 = 0;
    v11 = 0;
    v12 = 0;
    do
    {
      v13 = v12;
      v14 = v11;
      v12 = [v5 objectAtIndex:v9];

      v11 = [v19 stringByAppendingPathComponent:v12];

      if (!v3 || ([v3 containsObject:v12] & 1) == 0)
      {
        v15 = [v11 stringByAppendingPathExtension:@"old"];

        v16 = (const std::__fs::filesystem::path *)[v11 fileSystemRepresentation];
        id v10 = v15;
        v17 = (const std::__fs::filesystem::path *)[v10 fileSystemRepresentation];
        rename(v16, v17, v18);
        [v6 addObject:v10];
      }
      ++v9;
    }
    while (v8 != v9);
  }
  else
  {
    v12 = 0;
    v11 = 0;
    id v10 = 0;
  }
  _removeFiles(v6);
}

void sub_100008318(uint64_t a1)
{
  uint64_t v2 = DDRLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) identifier];
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Reset with task: %@", (uint8_t *)&v9, 0xCu);
  }
  id v4 = [*(id *)(a1 + 40) progress];
  id v5 = [*(id *)(a1 + 32) identifier];
  [*(id *)(a1 + 32) estimatedTimeOfCompletion];
  objc_msgSend(v4, "noteTaskBeginningWithName:duration:", v5);

  [*(id *)(a1 + 32) run];
  id v6 = DDRLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [*(id *)(a1 + 32) identifier];
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "reset task: %@ finished", (uint8_t *)&v9, 0xCu);
  }
  id v8 = [*(id *)(a1 + 40) progress];
  [v8 noteTaskCompleted];
}

void sub_100008534(uint64_t a1)
{
  uint64_t v2 = DDRLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v6 = 134217984;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "progress report percentage completion: %lf", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) delegate];
  id v5 = [*(id *)(a1 + 32) resetScheduler];
  objc_msgSend(v4, "resetWithMode:didUpdateWithProgress:", objc_msgSend(v5, "mode"), *(double *)(a1 + 40));
}

void sub_1000086AC(uint64_t a1)
{
  uint64_t v2 = DDRLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "progress report completed all tasks", v6, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  id v4 = [*(id *)(a1 + 32) resetScheduler];
  objc_msgSend(v3, "resetWithMode:didUpdateWithProgress:", objc_msgSend(v4, "mode"), 1.0);

  id v5 = [*(id *)(a1 + 32) completionBlock];
  v5[2](v5, 0);
}

void sub_10000886C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error terminating application: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000088E4()
{
}

void sub_100008910(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "error creating mainPrefs", v1, 2u);
}

void sub_100008954()
{
  int v0 = SCError();
  SCErrorString(v0);
  sub_1000022A8();
  sub_100002288((void *)&_mh_execute_header, v1, v2, "SCPreferencesLock failed: %{public}s", v3, v4, v5, v6, v7);
}

void sub_1000089D0()
{
  int v0 = SCError();
  SCErrorString(v0);
  sub_1000022A8();
  sub_100002288((void *)&_mh_execute_header, v1, v2, "SCPreferencesPathSetValue failed %{public}s", v3, v4, v5, v6, v7);
}

void sub_100008A4C()
{
  int v0 = SCError();
  SCErrorString(v0);
  sub_1000022A8();
  sub_100002288((void *)&_mh_execute_header, v1, v2, "SCPreferencesCommitChanges failed: %{public}s", v3, v4, v5, v6, v7);
}

void sub_100008AC8()
{
  int v0 = SCError();
  SCErrorString(v0);
  sub_1000022A8();
  sub_100002288((void *)&_mh_execute_header, v1, v2, "SCPreferencesApplyChanges failed: %{public}s", v3, v4, v5, v6, v7);
}

void sub_100008B44()
{
  int v0 = SCError();
  SCErrorString(v0);
  sub_1000022A8();
  sub_100002288((void *)&_mh_execute_header, v1, v2, "SCPreferencesUnlock failed: %{public}s", v3, v4, v5, v6, v7);
}

void sub_100008BC0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timed out waiting for Octagon removal", v1, 2u);
}

void sub_100008C04(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Apple Account signout failed with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100008C7C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to create CFServerConnection. Telephony state may be incorrect.", v1, 2u);
}

void sub_100008CC0(int a1, int a2, NSObject *a3)
{
  uint64_t v6 = +[NSThread callStackReturnAddresses];
  v7[0] = 67109634;
  v7[1] = a1;
  __int16 v8 = 1024;
  int v9 = a2;
  __int16 v10 = 2114;
  v11 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "CTServerConnection returned error: (%i, %i). Destroying connection. (Callstack: %{public}@)", (uint8_t *)v7, 0x18u);
}

void sub_100008D88(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed removing pairedpeer %@", (uint8_t *)&v3, 0xCu);
}

void sub_100008E04(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error create CTServerConnection", v1, 2u);
}

void sub_100008E48(int a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "_ResetAdHocCerts: SecItemDelete failed: %ld", (uint8_t *)&v2, 0xCu);
}

void sub_100008EC4(int a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "_ResetWISPr: SecItemDelete failed: %ld", (uint8_t *)&v2, 0xCu);
}

uint64_t APSClearLegacyAirPlayPairingInfo()
{
  return _APSClearLegacyAirPlayPairingInfo();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return _BSDispatchQueueCreateWithQualityOfService();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CPDeleteTree()
{
  return _CPDeleteTree();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

void NSLog(NSString *format, ...)
{
}

int SCError(void)
{
  return _SCError();
}

const char *__cdecl SCErrorString(int status)
{
  return _SCErrorString(status);
}

SCNetworkInterfaceRef SCNetworkInterfaceGetInterface(SCNetworkInterfaceRef interface)
{
  return _SCNetworkInterfaceGetInterface(interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return _SCNetworkInterfaceGetInterfaceType(interface);
}

SCNetworkServiceRef SCNetworkServiceCopy(SCPreferencesRef prefs, CFStringRef serviceID)
{
  return _SCNetworkServiceCopy(prefs, serviceID);
}

CFArrayRef SCNetworkServiceCopyAll(SCPreferencesRef prefs)
{
  return _SCNetworkServiceCopyAll(prefs);
}

SCNetworkInterfaceRef SCNetworkServiceGetInterface(SCNetworkServiceRef service)
{
  return _SCNetworkServiceGetInterface(service);
}

CFStringRef SCNetworkServiceGetServiceID(SCNetworkServiceRef service)
{
  return _SCNetworkServiceGetServiceID(service);
}

Boolean SCNetworkServiceRemove(SCNetworkServiceRef service)
{
  return _SCNetworkServiceRemove(service);
}

CFArrayRef SCNetworkSetCopyAll(SCPreferencesRef prefs)
{
  return _SCNetworkSetCopyAll(prefs);
}

SCNetworkSetRef SCNetworkSetCopyCurrent(SCPreferencesRef prefs)
{
  return _SCNetworkSetCopyCurrent(prefs);
}

uint64_t SCNetworkSetCopySelectedVPNService()
{
  return _SCNetworkSetCopySelectedVPNService();
}

CFArrayRef SCNetworkSetCopyServices(SCNetworkSetRef set)
{
  return _SCNetworkSetCopyServices(set);
}

Boolean SCNetworkSetRemoveService(SCNetworkSetRef set, SCNetworkServiceRef service)
{
  return _SCNetworkSetRemoveService(set, service);
}

uint64_t SCNetworkSetSetSelectedVPNService()
{
  return _SCNetworkSetSetSelectedVPNService();
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return _SCPreferencesApplyChanges(prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return _SCPreferencesCommitChanges(prefs);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return _SCPreferencesCreateWithAuthorization(allocator, name, prefsID, authorization);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return _SCPreferencesLock(prefs, wait);
}

CFDictionaryRef SCPreferencesPathGetValue(SCPreferencesRef prefs, CFStringRef path)
{
  return _SCPreferencesPathGetValue(prefs, path);
}

Boolean SCPreferencesPathSetValue(SCPreferencesRef prefs, CFStringRef path, CFDictionaryRef value)
{
  return _SCPreferencesPathSetValue(prefs, path, value);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return _SCPreferencesUnlock(prefs);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

uint64_t SecTrustIncrementExceptionResetCount()
{
  return _SecTrustIncrementExceptionResetCount();
}

uint64_t WiFiManagerClientCreate()
{
  return _WiFiManagerClientCreate();
}

uint64_t WiFiManagerClientResetNetworkSettings()
{
  return _WiFiManagerClientResetNetworkSettings();
}

uint64_t _CFPreferencesFlushCachesForIdentifier()
{
  return __CFPreferencesFlushCachesForIdentifier();
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return __CTServerConnectionCreateWithIdentifier();
}

uint64_t _CTServerConnectionDisableRegistration()
{
  return __CTServerConnectionDisableRegistration();
}

uint64_t _CTServerConnectionEraseAllUserProfiles()
{
  return __CTServerConnectionEraseAllUserProfiles();
}

uint64_t _CTServerConnectionEraseBasebandSettings()
{
  return __CTServerConnectionEraseBasebandSettings();
}

uint64_t _CTServerConnectionEraseCommCentersPreferences()
{
  return __CTServerConnectionEraseCommCentersPreferences();
}

uint64_t _CTServerConnectionEraseNetworkSettings()
{
  return __CTServerConnectionEraseNetworkSettings();
}

uint64_t _NETRBClientCreate()
{
  return __NETRBClientCreate();
}

uint64_t _NETRBClientSetGlobalServiceState()
{
  return __NETRBClientSetGlobalServiceState();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t lockdown_connect()
{
  return _lockdown_connect();
}

uint64_t lockdown_remove_value()
{
  return _lockdown_remove_value();
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

id objc_msgSend__incrementCurrentResetTaskProgress(void *a1, const char *a2, ...)
{
  return [a1 _incrementCurrentResetTaskProgress];
}

id objc_msgSend__run(void *a1, const char *a2, ...)
{
  return [a1 _run];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allResetTasks(void *a1, const char *a2, ...)
{
  return [a1 allResetTasks];
}

id objc_msgSend_allResetTasksCompleted(void *a1, const char *a2, ...)
{
  return [a1 allResetTasksCompleted];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_callStackReturnAddresses(void *a1, const char *a2, ...)
{
  return [a1 callStackReturnAddresses];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_completedProgress(void *a1, const char *a2, ...)
{
  return [a1 completedProgress];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return [a1 completionBlock];
}

id objc_msgSend_configure(void *a1, const char *a2, ...)
{
  return [a1 configure];
}

id objc_msgSend_configureTasks(void *a1, const char *a2, ...)
{
  return [a1 configureTasks];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentResetTask(void *a1, const char *a2, ...)
{
  return [a1 currentResetTask];
}

id objc_msgSend_currentTaskEstimate(void *a1, const char *a2, ...)
{
  return [a1 currentTaskEstimate];
}

id objc_msgSend_currentTaskProgress(void *a1, const char *a2, ...)
{
  return [a1 currentTaskProgress];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaults(void *a1, const char *a2, ...)
{
  return [a1 defaults];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_devicedataresetdConnection(void *a1, const char *a2, ...)
{
  return [a1 devicedataresetdConnection];
}

id objc_msgSend_didCompleteAllTasks(void *a1, const char *a2, ...)
{
  return [a1 didCompleteAllTasks];
}

id objc_msgSend_disconnectAllCalls(void *a1, const char *a2, ...)
{
  return [a1 disconnectAllCalls];
}

id objc_msgSend_eraseDataPlan(void *a1, const char *a2, ...)
{
  return [a1 eraseDataPlan];
}

id objc_msgSend_estimatedTimeOfCompletion(void *a1, const char *a2, ...)
{
  return [a1 estimatedTimeOfCompletion];
}

id objc_msgSend_estimatedTimeToResetApplePay(void *a1, const char *a2, ...)
{
  return [a1 estimatedTimeToResetApplePay];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_hasSeenCaseLatchCover(void *a1, const char *a2, ...)
{
  return [a1 hasSeenCaseLatchCover];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_keyboards(void *a1, const char *a2, ...)
{
  return [a1 keyboards];
}

id objc_msgSend_languages(void *a1, const char *a2, ...)
{
  return [a1 languages];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_locale(void *a1, const char *a2, ...)
{
  return [a1 locale];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_managedSystemConfigurationServiceIDs(void *a1, const char *a2, ...)
{
  return [a1 managedSystemConfigurationServiceIDs];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_noteTaskCompleted(void *a1, const char *a2, ...)
{
  return [a1 noteTaskCompleted];
}

id objc_msgSend_numberOfTaskRemaining(void *a1, const char *a2, ...)
{
  return [a1 numberOfTaskRemaining];
}

id objc_msgSend_numberOfTotalTask(void *a1, const char *a2, ...)
{
  return [a1 numberOfTotalTask];
}

id objc_msgSend_oldLimit(void *a1, const char *a2, ...)
{
  return [a1 oldLimit];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_passLibrary(void *a1, const char *a2, ...)
{
  return [a1 passLibrary];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_performTask(void *a1, const char *a2, ...)
{
  return [a1 performTask];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_radioPreference(void *a1, const char *a2, ...)
{
  return [a1 radioPreference];
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return [a1 refresh];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_resetAllSettingsToDefaults(void *a1, const char *a2, ...)
{
  return [a1 resetAllSettingsToDefaults];
}

id objc_msgSend_resetApps(void *a1, const char *a2, ...)
{
  return [a1 resetApps];
}

id objc_msgSend_resetScheduler(void *a1, const char *a2, ...)
{
  return [a1 resetScheduler];
}

id objc_msgSend_resetTasks(void *a1, const char *a2, ...)
{
  return [a1 resetTasks];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_schedule(void *a1, const char *a2, ...)
{
  return [a1 schedule];
}

id objc_msgSend_scheduledTasks(void *a1, const char *a2, ...)
{
  return [a1 scheduledTasks];
}

id objc_msgSend_serverConnection(void *a1, const char *a2, ...)
{
  return [a1 serverConnection];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return [a1 sharedAVSystemController];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByExpandingTildeInPath];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_tickInterval(void *a1, const char *a2, ...)
{
  return [a1 tickInterval];
}

id objc_msgSend_tickTimer(void *a1, const char *a2, ...)
{
  return [a1 tickTimer];
}

id objc_msgSend_totalEstimateTimeOfCompletion(void *a1, const char *a2, ...)
{
  return [a1 totalEstimateTimeOfCompletion];
}

id objc_msgSend_worker(void *a1, const char *a2, ...)
{
  return [a1 worker];
}

id objc_msgSend_workerQueue(void *a1, const char *a2, ...)
{
  return [a1 workerQueue];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}