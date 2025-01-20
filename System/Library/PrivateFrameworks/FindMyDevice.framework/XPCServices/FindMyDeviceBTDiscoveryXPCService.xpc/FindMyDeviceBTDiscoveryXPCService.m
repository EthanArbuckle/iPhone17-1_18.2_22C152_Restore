uint64_t start()
{
  NSObject *v0;
  void *v1;
  FindMyDeviceBTDiscoveryXPCServer *v2;
  void *v3;
  uint8_t v5[16];

  v0 = sub_100004888();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "FindMyDeviceBTDiscoveryXPCService started", v5, 2u);
  }

  v2 = objc_alloc_init(FindMyDeviceBTDiscoveryXPCServer);
  v3 = +[NSXPCListener serviceListener];
  [v3 setDelegate:v2];
  [v3 resume];

  return 0;
}

void sub_1000045BC(id a1)
{
  id v2 = +[FMSystemInfo sharedInstance];
  unsigned int v1 = [v2 isInternalBuild];
  if (v1) {
    LOBYTE(v1) = +[FMPreferencesUtil BOOLForKey:@"FMDAutomationBluetoothDiscoveryAutomationActiveKey" inDomain:kFMDNotBackedUpPrefDomain];
  }
  byte_1000133E8 = v1;
}

id sub_100004888()
{
  if (qword_1000133F8 != -1) {
    dispatch_once(&qword_1000133F8, &stru_10000C240);
  }
  v0 = (void *)qword_100013400;

  return v0;
}

void sub_1000048DC(id a1)
{
  qword_100013400 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "_");

  _objc_release_x1();
}

id sub_100004920()
{
  if (qword_100013408 != -1) {
    dispatch_once(&qword_100013408, &stru_10000C260);
  }
  v0 = (void *)qword_100013410;

  return v0;
}

void sub_100004974(id a1)
{
  qword_100013410 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "locations");

  _objc_release_x1();
}

id sub_1000049B8()
{
  if (qword_100013418 != -1) {
    dispatch_once(&qword_100013418, &stru_10000C280);
  }
  v0 = (void *)qword_100013420;

  return v0;
}

void sub_100004A0C(id a1)
{
  qword_100013420 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "accessory");

  _objc_release_x1();
}

id sub_100004A50()
{
  if (qword_100013428 != -1) {
    dispatch_once(&qword_100013428, &stru_10000C2A0);
  }
  v0 = (void *)qword_100013430;

  return v0;
}

void sub_100004AA4(id a1)
{
  qword_100013430 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "traffic");

  _objc_release_x1();
}

id sub_100004AE8()
{
  if (qword_100013438 != -1) {
    dispatch_once(&qword_100013438, &stru_10000C2C0);
  }
  v0 = (void *)qword_100013440;

  return v0;
}

void sub_100004B3C(id a1)
{
  qword_100013440 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "encoder");

  _objc_release_x1();
}

id sub_100004B80()
{
  if (qword_100013448 != -1) {
    dispatch_once(&qword_100013448, &stru_10000C2E0);
  }
  v0 = (void *)qword_100013450;

  return v0;
}

void sub_100004BD4(id a1)
{
  qword_100013450 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "bluetoothsession");

  _objc_release_x1();
}

id sub_100004C18()
{
  if (qword_100013458 != -1) {
    dispatch_once(&qword_100013458, &stru_10000C300);
  }
  v0 = (void *)qword_100013460;

  return v0;
}

void sub_100004C6C(id a1)
{
  qword_100013460 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "extensions");

  _objc_release_x1();
}

id sub_100004CB0()
{
  if (qword_100013468 != -1) {
    dispatch_once(&qword_100013468, &stru_10000C320);
  }
  v0 = (void *)qword_100013470;

  return v0;
}

void sub_100004D04(id a1)
{
  qword_100013470 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "extensions_playSound");

  _objc_release_x1();
}

id sub_100004D48()
{
  if (qword_100013478 != -1) {
    dispatch_once(&qword_100013478, &stru_10000C340);
  }
  v0 = (void *)qword_100013480;

  return v0;
}

void sub_100004D9C(id a1)
{
  qword_100013480 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "secureLocations");

  _objc_release_x1();
}

id sub_100004DE0()
{
  if (qword_100013488 != -1) {
    dispatch_once(&qword_100013488, &stru_10000C360);
  }
  v0 = (void *)qword_100013490;

  return v0;
}

void sub_100004E34(id a1)
{
  qword_100013490 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "healUCRT");

  _objc_release_x1();
}

id sub_100004E78()
{
  if (qword_100013498 != -1) {
    dispatch_once(&qword_100013498, &stru_10000C380);
  }
  v0 = (void *)qword_1000134A0;

  return v0;
}

void sub_100004ECC(id a1)
{
  qword_1000134A0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "repairDevice");

  _objc_release_x1();
}

id sub_100004F10()
{
  if (qword_1000134A8 != -1) {
    dispatch_once(&qword_1000134A8, &stru_10000C3A0);
  }
  v0 = (void *)qword_1000134B0;

  return v0;
}

void sub_100004F64(id a1)
{
  qword_1000134B0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "ALFailureAnalytics");

  _objc_release_x1();
}

id sub_100004FA8()
{
  if (qword_1000134B8 != -1) {
    dispatch_once(&qword_1000134B8, &stru_10000C3C0);
  }
  v0 = (void *)qword_1000134C0;

  return v0;
}

void sub_100004FFC(id a1)
{
  qword_1000134C0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "disableLocationDisplay");

  _objc_release_x1();
}

id sub_100005040()
{
  if (qword_1000134C8 != -1) {
    dispatch_once(&qword_1000134C8, &stru_10000C3E0);
  }
  v0 = (void *)qword_1000134D0;

  return v0;
}

void sub_100005094(id a1)
{
  qword_1000134D0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "accountRatchet");

  _objc_release_x1();
}

id sub_1000050D8()
{
  if (qword_1000134D8 != -1) {
    dispatch_once(&qword_1000134D8, &stru_10000C400);
  }
  v0 = (void *)qword_1000134E0;

  return v0;
}

void sub_10000512C(id a1)
{
  qword_1000134E0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "ownerAuthentication");

  _objc_release_x1();
}

id sub_100005170()
{
  if (qword_1000134E8 != -1) {
    dispatch_once(&qword_1000134E8, &stru_10000C420);
  }
  v0 = (void *)qword_1000134F0;

  return v0;
}

void sub_1000051C4(id a1)
{
  if (+[FMPreferencesUtil BOOLForKey:@"ShowAutomationLogs" inDomain:@"com.apple.icloud.findmydeviced.notbackedup"])
  {
    qword_1000134F0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "automation");
    _objc_release_x1();
  }
}

void sub_100005FD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

void sub_10000600C(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = [WeakRetained delegate];
  [v4 didEndDiscoveryWithError:v3];
}

void sub_100006078(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = [WeakRetained delegate];
  v5 = [[FMDBluetoothDiscoveryXPCAdapterDevice alloc] initWithBluetoothDevice:v3];

  [v4 didDiscoverDevice:v5];
}

void sub_10000610C(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = [WeakRetained delegate];
  v5 = [[FMDBluetoothDiscoveryXPCAdapterDevice alloc] initWithBluetoothDevice:v3];

  [v4 didLoseDevice:v5];
}

void sub_1000062E0(id a1)
{
  qword_1000134F8 = objc_alloc_init(FMDAutomationHelperFactory);

  _objc_release_x1();
}

void sub_1000069FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 80));
  _Unwind_Resume(a1);
}

void sub_100006A4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100004888();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000075A8();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained processDeviceInformation:v3 lost:0];
}

void sub_100006AC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100004888();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000075DC();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained processDeviceInformation:v3 lost:0];
}

void sub_100006B3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100004888();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100007610();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained processDeviceInformation:v3 lost:1];
}

void sub_100006BB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100004888();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000076BC();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    v6 = sub_100004888();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100007644((uint64_t)v3, v6);
    }

    [WeakRetained stopBLEDiscovery];
    [WeakRetained finishDiscoveringWithError:v3];
  }
}

void sub_100006D6C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) didLoseDevice];

  if (v5)
  {
    v6 = sub_100004888();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100007724();
    }

    v7 = [*(id *)(a1 + 32) didLoseDevice];
    ((void (**)(void, id))v7)[2](v7, v4);
  }
}

void sub_100007490(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1000074B8(os_log_t log)
{
  *(_WORD *)unsigned int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Entitlement not found", v1, 2u);
}

void sub_1000074FC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not find class %@ in the automation bundle", (uint8_t *)&v2, 0xCu);
}

void sub_100007574()
{
  sub_1000074AC();
  sub_100007490((void *)&_mh_execute_header, v0, v1, "FMDBluetoothDiscovery discovery already running.. continuing.", v2, v3, v4, v5, v6);
}

void sub_1000075A8()
{
  sub_1000074AC();
  sub_100007490((void *)&_mh_execute_header, v0, v1, "FMDBluetoothManager SFDeviceDiscovery deviceFoundHandler", v2, v3, v4, v5, v6);
}

void sub_1000075DC()
{
  sub_1000074AC();
  sub_100007490((void *)&_mh_execute_header, v0, v1, "FMDBluetoothManager SFDeviceDiscovery deviceChangedHandler", v2, v3, v4, v5, v6);
}

void sub_100007610()
{
  sub_1000074AC();
  sub_100007490((void *)&_mh_execute_header, v0, v1, "FMDBluetoothManager SFDeviceDiscovery deviceLostHandler", v2, v3, v4, v5, v6);
}

void sub_100007644(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "BLE Scanning started with error %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000076BC()
{
  sub_1000074AC();
  sub_100007490((void *)&_mh_execute_header, v0, v1, "BLE Scanning started", v2, v3, v4, v5, v6);
}

void sub_1000076F0()
{
  sub_1000074AC();
  sub_100007490((void *)&_mh_execute_header, v0, v1, "FMDBluetoothDiscovery stopping BLE Scanning", v2, v3, v4, v5, v6);
}

void sub_100007724()
{
  sub_1000074AC();
  sub_100007490((void *)&_mh_execute_header, v0, v1, "FMDBluetoothDiscovery final update with all lost btle beacons", v2, v3, v4, v5, v6);
}

void sub_100007758()
{
  sub_1000074AC();
  sub_100007490((void *)&_mh_execute_header, v0, v1, "FMDBluetoothDiscovery found change was significant", v2, v3, v4, v5, v6);
}

void sub_10000778C()
{
  sub_1000074AC();
  sub_100007490((void *)&_mh_execute_header, v0, v1, "FMDBluetoothDiscovery failed to get keyForDevice.", v2, v3, v4, v5, v6);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
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

{
}

{
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__isDiscoveryActive(void *a1, const char *a2, ...)
{
  return [a1 _isDiscoveryActive];
}

id objc_msgSend_advertisementFields(void *a1, const char *a2, ...)
{
  return [a1 advertisementFields];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_automationHelperBundle(void *a1, const char *a2, ...)
{
  return [a1 automationHelperBundle];
}

id objc_msgSend_bleDevice(void *a1, const char *a2, ...)
{
  return [a1 bleDevice];
}

id objc_msgSend_bluetoothAddress(void *a1, const char *a2, ...)
{
  return [a1 bluetoothAddress];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceDiscovery(void *a1, const char *a2, ...)
{
  return [a1 deviceDiscovery];
}

id objc_msgSend_devicesByIdentifier(void *a1, const char *a2, ...)
{
  return [a1 devicesByIdentifier];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didDiscoverDevice(void *a1, const char *a2, ...)
{
  return [a1 didDiscoverDevice];
}

id objc_msgSend_didEndDiscovery(void *a1, const char *a2, ...)
{
  return [a1 didEndDiscovery];
}

id objc_msgSend_didLoseDevice(void *a1, const char *a2, ...)
{
  return [a1 didLoseDevice];
}

id objc_msgSend_discovery(void *a1, const char *a2, ...)
{
  return [a1 discovery];
}

id objc_msgSend_hasAttemptedLoad(void *a1, const char *a2, ...)
{
  return [a1 hasAttemptedLoad];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAutomationActive(void *a1, const char *a2, ...)
{
  return [a1 isAutomationActive];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return [a1 isInternalBuild];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rssi(void *a1, const char *a2, ...)
{
  return [a1 rssi];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedFactory(void *a1, const char *a2, ...)
{
  return [a1 sharedFactory];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_startDiscovery(void *a1, const char *a2, ...)
{
  return [a1 startDiscovery];
}

id objc_msgSend_stopBLEDiscovery(void *a1, const char *a2, ...)
{
  return [a1 stopBLEDiscovery];
}

id objc_msgSend_stopDiscovery(void *a1, const char *a2, ...)
{
  return [a1 stopDiscovery];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}