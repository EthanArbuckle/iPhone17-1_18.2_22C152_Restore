void sub_100003294(id a1)
{
  uint64_t vars8;

  qword_100011650 = objc_alloc_init(ANNotificationStore);
  _objc_release_x1();
}

void sub_100003604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000361C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000362C(uint64_t a1)
{
}

void sub_100003634(void *a1)
{
  uint64_t v2 = a1[5];
  v3 = *(void **)(a1[4] + 8);
  id v16 = 0;
  v4 = [v3 executeFetchRequest:v2 error:&v16];
  id v5 = v16;
  if (v5)
  {
    v6 = _ANLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100007334();
    }
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "objectForKeyedSubscript:", @"accountTypeID", (void)v12);
          [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

void sub_100003938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003950(void *a1)
{
  uint64_t v2 = a1[5];
  v3 = *(void **)(a1[4] + 8);
  id v19 = 0;
  v4 = [v3 executeFetchRequest:v2 error:&v19];
  id v5 = v19;
  if (v5)
  {
    v6 = _ANLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000073B0();
    }
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v11);
        id v13 = objc_alloc((Class)ANAccountNotification);
        id v14 = objc_msgSend(v13, "initWithManagedObject:", v12, (void)v15);
        if (v14) {
          [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v14];
        }

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v9);
  }
}

void sub_100003C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003C30(uint64_t a1)
{
  uint64_t v2 = +[NSFetchRequest fetchRequestWithEntityName:@"AccountNotification"];
  [v2 setFetchLimit:1];
  v3 = [*(id *)(a1 + 32) identifier];
  v4 = +[NSPredicate predicateWithFormat:@"identifier = %@", v3];
  [v2 setPredicate:v4];

  id v5 = [*(id *)(*(void *)(a1 + 40) + 8) countForFetchRequest:v2 error:0];
  v6 = _ANLogSystem();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000074A8((id *)(a1 + 32), v7);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[ANNotificationStore saveNotification:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 164;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Adding new notification to database.\"", buf, 0x12u);
    }

    id v7 = +[NSEntityDescription insertNewObjectForEntityForName:@"AccountNotification" inManagedObjectContext:*(void *)(*(void *)(a1 + 40) + 8)];
    [v7 takeValuesFromAccountNotification:*(void *)(a1 + 32)];
    id v8 = [*(id *)(a1 + 32) activateAction];
    if (v8)
    {
      id v9 = +[NSEntityDescription insertNewObjectForEntityForName:@"NotificationAction" inManagedObjectContext:*(void *)(*(void *)(a1 + 40) + 8)];
      [v9 takeValuesFromNotificationAction:v8];
      [v9 setNotificationToActivate:v7];
      [v7 setActivateAction:v9];
    }
    uint64_t v10 = [*(id *)(a1 + 32) dismissAction];
    if (v10)
    {
      v11 = +[NSEntityDescription insertNewObjectForEntityForName:@"NotificationAction" inManagedObjectContext:*(void *)(*(void *)(a1 + 40) + 8)];
      [v11 takeValuesFromNotificationAction:v10];
      [v11 setNotificationToDismiss:v7];
      [v7 setDismissAction:v11];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "_unsafe_commitChangesInManagedObjectContext");
  }
}

void sub_1000042B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_1000042EC(void *a1)
{
  uint64_t v2 = a1[5];
  v3 = *(void **)(a1[4] + 8);
  id v7 = 0;
  id v4 = [v3 countForFetchRequest:v2 error:&v7];
  id v5 = v7;
  *(void *)(*(void *)(a1[6] + 8) + 24) = v4;
  if (v5)
  {
    v6 = _ANLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100007554();
    }
  }
}

void sub_100004380(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v16 = 0;
  id v4 = [v3 executeFetchRequest:v2 error:&v16];
  id v5 = v16;
  if (v5)
  {
    v6 = _ANLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000075D0();
    }
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "deleteObject:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        }
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v9);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_unsafe_commitChangesInManagedObjectContext");
  }
}

void sub_1000046C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000046E8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v16 = 0;
  id v4 = [v3 executeFetchRequest:v2 error:&v16];
  id v5 = v16;
  if (v5)
  {
    v6 = _ANLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10000764C();
    }
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "deleteObject:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v11), (void)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v9);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_unsafe_commitChangesInManagedObjectContext");
}

void sub_100004A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004A6C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v10 = 0;
  id v4 = [v3 executeFetchRequest:v2 error:&v10];
  id v5 = v10;
  v6 = [v4 firstObject];

  if (v5)
  {
    id v7 = _ANLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000076C8();
    }
  }
  else if (v6)
  {
    [*(id *)(*(void *)(a1 + 32) + 8) deleteObject:v6];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_unsafe_commitChangesInManagedObjectContext");
  }
  else
  {
    id v8 = _ANLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136315650;
      long long v12 = "-[ANNotificationStore removeNotificationWithIdentifier:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 283;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Notification with ID %@ seems to be gone already.\"", buf, 0x1Cu);
    }
  }
}

id sub_100004EA8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setPersistentStoreCoordinator:*(void *)(*(void *)(a1 + 32) + 16)];
}

void sub_100004F08(id a1)
{
  v1 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v1 pathForResource:@"AccountNotificationStore" ofType:@"momd"];

  uint64_t v2 = +[NSURL fileURLWithPath:v5];
  id v3 = [objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v2];
  id v4 = (void *)qword_100011660;
  qword_100011660 = (uint64_t)v3;
}

void sub_1000050C8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_1000053D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _ANLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100007954((uint64_t)v3, v4);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000058E0(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "ac_mapNullable:", &stru_10000C438);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100005948(id a1, UNNotification *a2, unint64_t a3, BOOL *a4)
{
  id v4 = [(UNNotification *)a2 request];
  id v5 = [v4 content];
  v6 = [v5 userInfo];
  id v7 = [v6 objectForKeyedSubscript:@"ANAccountNotificationDictionaryRepresentationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = [objc_alloc((Class)ANAccountNotification) initWithDictionaryRepresentation:v7];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

void sub_100005EE8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_100005F58(id a1)
{
  qword_100011670 = objc_alloc_init(ANDaemon);
  _objc_release_x1();
}

void sub_100006364(uint64_t a1)
{
  uint64_t v2 = _ANLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100007CE8(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

void sub_1000063B0(uint64_t a1)
{
  uint64_t v2 = _ANLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 136315650;
    uint64_t v5 = "-[ANDaemon listener:shouldAcceptNewConnection:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 92;
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Connection from %@ was invalidated.\"", (uint8_t *)&v4, 0x1Cu);
  }
}

uint64_t start()
{
  v1 = _ANLogSystem();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "main";
    __int16 v8 = 1024;
    int v9 = 17;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "%s (%d) \"and is starting up...\"", (uint8_t *)&v6, 0x12u);
  }

  uint64_t v2 = +[ANDaemon sharedInstance];
  [v2 start];

  uint64_t v3 = +[NSRunLoop mainRunLoop];
  [v3 run];

  int v4 = _ANLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "main";
    __int16 v8 = 1024;
    int v9 = 22;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s (%d) \"and is shutting down...\"", (uint8_t *)&v6, 0x12u);
  }

  return 0;
}

void sub_100006870(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  uint64_t v5 = +[NSPredicate predicateWithFormat:@"eventIdentifier == %@", v3];
  int v6 = [v4 filteredArrayUsingPredicate:v5];

  int v7 = _ANLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = a1[4];
    *(_DWORD *)buf = 136315906;
    v11 = "-[ANNotificationController removeNotificationsWithEventID:completion:]_block_invoke";
    __int16 v12 = 1024;
    int v13 = 61;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    long long v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Notifications for %@: %@\"", buf, 0x26u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006A0C;
  v9[3] = &unk_10000C4A8;
  v9[4] = a1[5];
  [v6 enumerateObjectsUsingBlock:v9];
  (*(void (**)(void))(a1[6] + 16))();
}

void sub_100006A0C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = [a2 identifier];
  [v2 removeNotificationWithIdentifier:v3];
}

void sub_100006BC0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) callbackMachService];

  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) callbackMachService];
    id v7 = [v3 _clientSideNotifierWithMachServiceName:v4];

    [v7 notificationWasActivated:*(void *)(a1 + 32)];
LABEL_5:

    return;
  }
  uint64_t v5 = [*(id *)(a1 + 32) activateAction];

  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) activateAction];
    [v7 perform];
    goto LABEL_5;
  }
  int v6 = _ANLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v9 = "-[ANNotificationController notificationProvider:didActivateNotification:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = 84;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) \"No value for callbackMachService or activateAction. Ignoring bulletin's activation.\"", buf, 0x12u);
  }
}

void sub_100006E98(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) callbackMachService];

  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) callbackMachService];
    id v7 = [v3 _clientSideNotifierWithMachServiceName:v4];

    [v7 notificationWasDismissed:*(void *)(a1 + 32)];
LABEL_5:

    return;
  }
  uint64_t v5 = [*(id *)(a1 + 32) dismissAction];

  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) dismissAction];
    [v7 perform];
    goto LABEL_5;
  }
  int v6 = _ANLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v9 = "-[ANNotificationController notificationProvider:didDismissNotification:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = 99;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) \"No value for callbackMachService or dismissAction. Ignoring bulletin's dismissal.\"", buf, 0x12u);
  }
}

void sub_100007228()
{
  v0 = _ANLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_100007D7C();
  }
}

void sub_100007274()
{
  v0 = _ANLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    sub_100007E10();
  }
}

void sub_1000072C0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = _ANLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100007EA4((uint64_t)v2, v3);
  }
}

void sub_100007334()
{
  sub_1000050B8();
  sub_1000050A4();
  sub_1000050C8((void *)&_mh_execute_header, v0, v1, "%s (%d) \"Core Data fetch failed with error: %@\"", v2, v3, v4, v5, 2u);
}

void sub_1000073B0()
{
  sub_1000050B8();
  sub_1000050A4();
  sub_1000050C8((void *)&_mh_execute_header, v0, v1, "%s (%d) \"Core Data fetch failed with error: %@\"", v2, v3, v4, v5, 2u);
}

void sub_10000742C()
{
  sub_1000050B8();
  sub_1000050A4();
  sub_1000050C8((void *)&_mh_execute_header, v0, v1, "%s (%d) \"Will not save notification lacking ID or account type: %@\"", v2, v3, v4, v5, 2u);
}

void sub_1000074A8(id *a1, NSObject *a2)
{
  uint64_t v3 = [*a1 identifier];
  v4[0] = 136315650;
  sub_1000050B8();
  sub_1000050A4();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s (%d) \"Duplicate notification found in DB for identifier: %@\"", (uint8_t *)v4, 0x1Cu);
}

void sub_100007554()
{
  sub_1000050B8();
  sub_1000050A4();
  sub_1000050C8((void *)&_mh_execute_header, v0, v1, "%s (%d) \"MOC fetch failed! Error: %@\"", v2, v3, v4, v5, 2u);
}

void sub_1000075D0()
{
  sub_1000050B8();
  sub_1000050A4();
  sub_1000050C8((void *)&_mh_execute_header, v0, v1, "%s (%d) \"MOC fetch failed! Error: %@\"", v2, v3, v4, v5, 2u);
}

void sub_10000764C()
{
  sub_1000050B8();
  sub_1000050A4();
  sub_1000050C8((void *)&_mh_execute_header, v0, v1, "%s (%d) \"MOC fetch failed! Error: %@\"", v2, v3, v4, v5, 2u);
}

void sub_1000076C8()
{
  sub_1000050B8();
  sub_1000050A4();
  sub_1000050C8((void *)&_mh_execute_header, v0, v1, "%s (%d) \"MOC fetch failed! Error: %@\"", v2, v3, v4, v5, 2u);
}

void sub_100007744()
{
  v1[0] = 136315394;
  sub_1000050B8();
  *(_DWORD *)((char *)&v1[3] + 2) = 302;
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s (%d) \"Core Data save succeeded!\"", (uint8_t *)v1, 0x12u);
}

void sub_1000077D0()
{
  sub_1000050B8();
  sub_1000050A4();
  sub_1000050C8((void *)&_mh_execute_header, v0, v1, "%s (%d) \"Core Data save failed! Error: %@\"", v2, v3, v4, v5, 2u);
}

void sub_10000784C()
{
  v1[0] = 136315394;
  sub_1000050B8();
  *(_DWORD *)((char *)&v1[3] + 2) = 316;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s (%d) \"BIG PROBLEM: Failed to create NSPersistentStoreCoordinator! Good luck everyone.\"", (uint8_t *)v1, 0x12u);
}

void sub_1000078D8()
{
  sub_1000050B8();
  sub_1000050A4();
  sub_1000050C8((void *)&_mh_execute_header, v0, v1, "%s (%d) \"BIG PROBLEM: Failed to add SQL store to coordinator! Error: %@\"", v2, v3, v4, v5, 2u);
}

void sub_100007954(uint64_t a1, NSObject *a2)
{
  int v2 = 136315650;
  uint64_t v3 = "-[ANNotificationProvider postNotification:completion:]_block_invoke";
  __int16 v4 = 1024;
  int v5 = 75;
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s (%d) \"Error posting notification %@\"", (uint8_t *)&v2, 0x1Cu);
}

void sub_1000079F0()
{
  sub_100005ED4();
  sub_100005EE8((void *)&_mh_execute_header, v0, v1, "%s (%d) \"No user info found on content\"", v2, v3, v4, v5, v6);
}

void sub_100007A6C()
{
  sub_100005ED4();
  sub_100005EE8((void *)&_mh_execute_header, v0, v1, "%s (%d) \"No cached representation of notification found\"", v2, v3, v4, v5, v6);
}

void sub_100007AE8()
{
  sub_100005ED4();
  sub_100005EE8((void *)&_mh_execute_header, v0, v1, "%s (%d) \"No note object, nothing to do\"", v2, v3, v4, v5, v6);
}

void sub_100007B64()
{
  sub_100005ED4();
  sub_100005EE8((void *)&_mh_execute_header, v0, v1, "%s (%d) \"Unknown action identifier\"", v2, v3, v4, v5, v6);
}

void sub_100007BE0()
{
  sub_1000050A4();
  sub_1000050C8((void *)&_mh_execute_header, v0, v1, "%s (%d) \"Rejecting connection from %@ because of bad/missing entitlement!\"", v2, v3, v4, v5, 2u);
}

void sub_100007C64()
{
  sub_1000050A4();
  sub_1000050C8((void *)&_mh_execute_header, v0, v1, "%s (%d) \"Rejecting connection from %@ because of bad/missing entitlement!\"", v2, v3, v4, v5, 2u);
}

void sub_100007CE8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100007D7C()
{
  int v1 = 136315650;
  uint64_t v2 = "-[ANNotificationController _clientSideNotifierWithMachServiceName:]_block_invoke";
  __int16 v3 = 1024;
  sub_100007320();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s (%d) \"XPC connection to %@ was interrupted!\"", (uint8_t *)&v1, 0x1Cu);
}

void sub_100007E10()
{
  int v1 = 136315650;
  uint64_t v2 = "-[ANNotificationController _clientSideNotifierWithMachServiceName:]_block_invoke";
  __int16 v3 = 1024;
  sub_100007320();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s (%d) \"XPC connection to %@ was invalidated.\"", (uint8_t *)&v1, 0x1Cu);
}

void sub_100007EA4(uint64_t a1, NSObject *a2)
{
  int v2 = 136315650;
  __int16 v3 = "-[ANNotificationController _clientSideNotifierWithMachServiceName:]_block_invoke";
  __int16 v4 = 1024;
  int v5 = 125;
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s (%d) \"XPC error encounterd while calling back to ANAccountNotifier: %@\"", (uint8_t *)&v2, 0x1Cu);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return _CFCopyHomeDirectoryURLForUser();
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return _CFURLCopyFileSystemPath(anURL, pathStyle);
}

uint64_t CPFileBuildDirectoriesToPath()
{
  return _CPFileBuildDirectoriesToPath();
}

uint64_t _ANLogSystem()
{
  return __ANLogSystem();
}

void _Block_object_dispose(const void *a1, const int a2)
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

id objc_msgSend_XPCInterface(void *a1, const char *a2, ...)
{
  return [a1 XPCInterface];
}

id objc_msgSend__copyPersistentStoreFilePath(void *a1, const char *a2, ...)
{
  return [a1 _copyPersistentStoreFilePath];
}

id objc_msgSend__createManagedObjectContext(void *a1, const char *a2, ...)
{
  return [a1 _createManagedObjectContext];
}

id objc_msgSend__defaultNotificationCategories(void *a1, const char *a2, ...)
{
  return [a1 _defaultNotificationCategories];
}

id objc_msgSend__managedObjectModel(void *a1, const char *a2, ...)
{
  return [a1 _managedObjectModel];
}

id objc_msgSend_accountTypeID(void *a1, const char *a2, ...)
{
  return [a1 accountTypeID];
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 actionIdentifier];
}

id objc_msgSend_activateAction(void *a1, const char *a2, ...)
{
  return [a1 activateAction];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_callbackMachService(void *a1, const char *a2, ...)
{
  return [a1 callbackMachService];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultSound(void *a1, const char *a2, ...)
{
  return [a1 defaultSound];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_dismissAction(void *a1, const char *a2, ...)
{
  return [a1 dismissAction];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return [a1 notification];
}

id objc_msgSend_perform(void *a1, const char *a2, ...)
{
  return [a1 perform];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return [a1 setWantsNotificationResponsesDelivered];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}