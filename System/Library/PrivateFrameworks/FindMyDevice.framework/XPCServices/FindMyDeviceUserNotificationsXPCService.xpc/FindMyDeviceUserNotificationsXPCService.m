void sub_100002D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002DC4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002DD4(uint64_t a1)
{
}

void sub_100002DDC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = sub_100003894();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v5;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "geocoding _placemarks = %@, error = %@", buf, 0x16u);
  }

  if (!v6)
  {
    uint64_t v18 = 0;
    uint64_t v19 = a1;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v14 = sub_100003894();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v26 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "geocoding _placemark = %@", buf, 0xCu);
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    id v6 = 0;
    a1 = v19;
  }
  uint64_t v15 = objc_msgSend(v5, "firstObject", v18, v19);
  uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100002FE4(uint64_t a1)
{
  v2 = +[NSMutableDictionary dictionary];
  v3 = [*(id *)(a1 + 32) deviceId];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) deviceId];
    [v2 setObject:v4 forKeyedSubscript:@"deviceId"];
  }
  id v5 = [*(id *)(a1 + 32) serialNumber];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) serialNumber];
    [v2 setObject:v6 forKeyedSubscript:@"serialNumber"];
  }
  id v7 = objc_alloc_init((Class)UNMutableNotificationContent);
  id v8 = [*(id *)(a1 + 32) title];
  [v7 setTitle:v8];

  id v9 = [*(id *)(a1 + 32) body];
  [v7 setBody:v9];

  id v10 = [*(id *)(a1 + 32) categoryIdentifier];
  [v7 setCategoryIdentifier:v10];

  [v7 setUserInfo:v2];
  uint64_t v11 = +[UNNotificationSound defaultSound];
  [v7 setSound:v11];

  objc_msgSend(v7, "setInterruptionLevel:", objc_msgSend(*(id *)(a1 + 32), "interruptionLevel"));
  v12 = sub_100003894();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [*(id *)(a1 + 32) categoryIdentifier];
    *(_DWORD *)buf = 138412546;
    id v24 = v13;
    __int16 v25 = 2048;
    id v26 = [v7 interruptionLevel];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "category id = %@ %lu", buf, 0x16u);
  }
  v14 = [*(id *)(a1 + 32) identifier];
  if (!v14)
  {
    uint64_t v15 = +[NSUUID UUID];
    v14 = [v15 UUIDString];
  }
  uint64_t v16 = +[UNNotificationRequest requestWithIdentifier:v14 content:v7 trigger:0];
  id v17 = objc_alloc((Class)UNUserNotificationCenter);
  id v18 = [v17 initWithBundleIdentifier:kFMIPAppBundleIdentifier];
  uint64_t v19 = sub_100003894();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v16;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "UNNotificationRequest = %@", buf, 0xCu);
  }

  long long v20 = sub_100003894();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "UNUserNotificationCenter = %@", buf, 0xCu);
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000033A0;
  v21[3] = &unk_100008C28;
  id v22 = *(id *)(a1 + 40);
  [v18 addNotificationRequest:v16 withCompletionHandler:v21];
}

void sub_1000033A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = sub_100003894();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unable to present user notification %@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void sub_1000036F0(uint64_t a1)
{
  id v2 = objc_alloc((Class)UNUserNotificationCenter);
  id v3 = [v2 initWithBundleIdentifier:kFMIPAppBundleIdentifier];
  uint64_t v7 = *(void *)(a1 + 32);
  v4 = +[NSArray arrayWithObjects:&v7 count:1];
  [v3 removeDeliveredNotificationsWithIdentifiers:v4];

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [v3 removePendingNotificationRequestsWithIdentifiers:v5];
}

uint64_t start()
{
  v0 = sub_100003894();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "FindMyDeviceUserNotificationsXPCService started", v5, 2u);
  }

  id v2 = objc_alloc_init(FindMyDeviceUserNotificationsXPCServer);
  id v3 = +[NSXPCListener serviceListener];
  [v3 setDelegate:v2];
  [v3 resume];

  return 0;
}

id sub_100003894()
{
  if (qword_10000CDA8 != -1) {
    dispatch_once(&qword_10000CDA8, &stru_100008CC8);
  }
  v0 = (void *)qword_10000CDB0;

  return v0;
}

void sub_1000038E8(id a1)
{
  qword_10000CDB0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "_");

  _objc_release_x1();
}

id sub_10000392C()
{
  if (qword_10000CDB8 != -1) {
    dispatch_once(&qword_10000CDB8, &stru_100008CE8);
  }
  v0 = (void *)qword_10000CDC0;

  return v0;
}

void sub_100003980(id a1)
{
  qword_10000CDC0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "locations");

  _objc_release_x1();
}

id sub_1000039C4()
{
  if (qword_10000CDC8 != -1) {
    dispatch_once(&qword_10000CDC8, &stru_100008D08);
  }
  v0 = (void *)qword_10000CDD0;

  return v0;
}

void sub_100003A18(id a1)
{
  qword_10000CDD0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "accessory");

  _objc_release_x1();
}

id sub_100003A5C()
{
  if (qword_10000CDD8 != -1) {
    dispatch_once(&qword_10000CDD8, &stru_100008D28);
  }
  v0 = (void *)qword_10000CDE0;

  return v0;
}

void sub_100003AB0(id a1)
{
  qword_10000CDE0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "traffic");

  _objc_release_x1();
}

id sub_100003AF4()
{
  if (qword_10000CDE8 != -1) {
    dispatch_once(&qword_10000CDE8, &stru_100008D48);
  }
  v0 = (void *)qword_10000CDF0;

  return v0;
}

void sub_100003B48(id a1)
{
  qword_10000CDF0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "encoder");

  _objc_release_x1();
}

id sub_100003B8C()
{
  if (qword_10000CDF8 != -1) {
    dispatch_once(&qword_10000CDF8, &stru_100008D68);
  }
  v0 = (void *)qword_10000CE00;

  return v0;
}

void sub_100003BE0(id a1)
{
  qword_10000CE00 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "bluetoothsession");

  _objc_release_x1();
}

id sub_100003C24()
{
  if (qword_10000CE08 != -1) {
    dispatch_once(&qword_10000CE08, &stru_100008D88);
  }
  v0 = (void *)qword_10000CE10;

  return v0;
}

void sub_100003C78(id a1)
{
  qword_10000CE10 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "extensions");

  _objc_release_x1();
}

id sub_100003CBC()
{
  if (qword_10000CE18 != -1) {
    dispatch_once(&qword_10000CE18, &stru_100008DA8);
  }
  v0 = (void *)qword_10000CE20;

  return v0;
}

void sub_100003D10(id a1)
{
  qword_10000CE20 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "extensions_playSound");

  _objc_release_x1();
}

id sub_100003D54()
{
  if (qword_10000CE28 != -1) {
    dispatch_once(&qword_10000CE28, &stru_100008DC8);
  }
  v0 = (void *)qword_10000CE30;

  return v0;
}

void sub_100003DA8(id a1)
{
  qword_10000CE30 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "secureLocations");

  _objc_release_x1();
}

id sub_100003DEC()
{
  if (qword_10000CE38 != -1) {
    dispatch_once(&qword_10000CE38, &stru_100008DE8);
  }
  v0 = (void *)qword_10000CE40;

  return v0;
}

void sub_100003E40(id a1)
{
  qword_10000CE40 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "healUCRT");

  _objc_release_x1();
}

id sub_100003E84()
{
  if (qword_10000CE48 != -1) {
    dispatch_once(&qword_10000CE48, &stru_100008E08);
  }
  v0 = (void *)qword_10000CE50;

  return v0;
}

void sub_100003ED8(id a1)
{
  qword_10000CE50 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "repairDevice");

  _objc_release_x1();
}

id sub_100003F1C()
{
  if (qword_10000CE58 != -1) {
    dispatch_once(&qword_10000CE58, &stru_100008E28);
  }
  v0 = (void *)qword_10000CE60;

  return v0;
}

void sub_100003F70(id a1)
{
  qword_10000CE60 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "ALFailureAnalytics");

  _objc_release_x1();
}

id sub_100003FB4()
{
  if (qword_10000CE68 != -1) {
    dispatch_once(&qword_10000CE68, &stru_100008E48);
  }
  v0 = (void *)qword_10000CE70;

  return v0;
}

void sub_100004008(id a1)
{
  qword_10000CE70 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "disableLocationDisplay");

  _objc_release_x1();
}

id sub_10000404C()
{
  if (qword_10000CE78 != -1) {
    dispatch_once(&qword_10000CE78, &stru_100008E68);
  }
  v0 = (void *)qword_10000CE80;

  return v0;
}

void sub_1000040A0(id a1)
{
  qword_10000CE80 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "accountRatchet");

  _objc_release_x1();
}

id sub_1000040E4()
{
  if (qword_10000CE88 != -1) {
    dispatch_once(&qword_10000CE88, &stru_100008E88);
  }
  v0 = (void *)qword_10000CE90;

  return v0;
}

void sub_100004138(id a1)
{
  qword_10000CE90 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "ownerAuthentication");

  _objc_release_x1();
}

id sub_10000417C()
{
  if (qword_10000CE98 != -1) {
    dispatch_once(&qword_10000CE98, &stru_100008EA8);
  }
  v0 = (void *)qword_10000CEA0;

  return v0;
}

void sub_1000041D0(id a1)
{
  if (+[FMPreferencesUtil BOOLForKey:@"ShowAutomationLogs" inDomain:@"com.apple.icloud.findmydeviced.notbackedup"])
  {
    qword_10000CEA0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "automation");
    _objc_release_x1();
  }
}

void sub_1000049C8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return [a1 body];
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 categoryIdentifier];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_defaultSound(void *a1, const char *a2, ...)
{
  return [a1 defaultSound];
}

id objc_msgSend_deviceId(void *a1, const char *a2, ...)
{
  return [a1 deviceId];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_interruptionLevel(void *a1, const char *a2, ...)
{
  return [a1 interruptionLevel];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_locationMessage(void *a1, const char *a2, ...)
{
  return [a1 locationMessage];
}

id objc_msgSend_locationTitle(void *a1, const char *a2, ...)
{
  return [a1 locationTitle];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}