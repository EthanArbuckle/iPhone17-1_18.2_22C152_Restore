int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;

  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 activate];

  return 0;
}

id DSLogSessionAvailability()
{
  if (qword_10001C3A8 != -1) {
    dispatch_once(&qword_10001C3A8, &stru_100014468);
  }
  v0 = (void *)qword_10001C3A0;
  return v0;
}

void sub_10000310C(id a1)
{
  qword_10001C3A0 = (uint64_t)os_log_create("com.apple.DiagnosticsSessionAvailability", "service");
  _objc_release_x1();
}

void sub_100003354(uint64_t a1)
{
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = sub_10000386C;
  v49[4] = sub_10000387C;
  id v50 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = sub_10000386C;
  v47 = sub_10000387C;
  id v48 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v3 = *(void **)(a1 + 32);
  v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472;
  v29 = sub_100003884;
  v30 = &unk_1000144B8;
  v35 = &v39;
  v4 = v2;
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v31 = v4;
  uint64_t v32 = v5;
  id v33 = v6;
  id v34 = *(id *)(a1 + 48);
  v36 = &v51;
  v37 = v49;
  v38 = &v43;
  [v3 _getHasActiveEnhancedLoggingSessionWithCompletionHandler:&v27];
  v7 = *(void **)(a1 + 48);
  if (v7)
  {
    objc_msgSend(v7, "doubleValue", v27, v28, v29, v30, v31, v32, v33);
    double v9 = v8;
  }
  else
  {
    double v9 = 30.0;
  }
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
  if (dispatch_group_wait(v4, v10))
  {
    v11 = DSLogSessionAvailability();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000CC20(v11, v9);
    }

    v12 = DSLogSessionAvailability();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = *(_DWORD *)(a1 + 64);
      *(_DWORD *)buf = 67109120;
      int v56 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Returning timeout error to client PID %d", buf, 8u);
    }

    v14 = +[NSError errorWithDomain:@"com.apple.DiagnosticsSessionAvailability" code:0 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (*((unsigned char *)v40 + 24))
    {
      v15 = DSLogSessionAvailability();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = *(_DWORD *)(a1 + 64);
        *(_DWORD *)buf = 67109120;
        int v56 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Returning status activeEnhancedLogging to client PID %d", buf, 8u);
      }

      uint64_t v17 = 0;
      uint64_t v18 = *(void *)(a1 + 56);
      v19 = &off_100015288;
    }
    else if (*((unsigned char *)v52 + 24))
    {
      unsigned int v20 = [*(id *)(a1 + 32) _getHasActiveDiagnosticsSession];
      v21 = DSLogSessionAvailability();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (v20)
      {
        if (v22)
        {
          int v23 = *(_DWORD *)(a1 + 64);
          *(_DWORD *)buf = 67109120;
          int v56 = v23;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Returning session status activeDiagnostics to client PID %d", buf, 8u);
        }

        uint64_t v17 = 0;
        uint64_t v18 = *(void *)(a1 + 56);
        v19 = &off_1000152A0;
      }
      else
      {
        if (v22)
        {
          int v26 = *(_DWORD *)(a1 + 64);
          *(_DWORD *)buf = 67109120;
          int v56 = v26;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Returning session status available to client PID %d", buf, 8u);
        }

        uint64_t v17 = 0;
        uint64_t v18 = *(void *)(a1 + 56);
        v19 = &off_1000152B8;
      }
    }
    else
    {
      v24 = DSLogSessionAvailability();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = *(_DWORD *)(a1 + 64);
        *(_DWORD *)buf = 67109120;
        int v56 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Returning session status unavailable to client PID %d", buf, 8u);
      }

      uint64_t v18 = *(void *)(a1 + 56);
      uint64_t v17 = v44[5];
      v19 = &off_100015270;
    }
    (*(void (**)(uint64_t, _UNKNOWN **, uint64_t))(v18 + 16))(v18, v19, v17);
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(&v51, 8);
}

void sub_10000381C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000386C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000387C(uint64_t a1)
{
}

void sub_100003884(uint64_t a1, int a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a2;
  if (a2)
  {
    v2 = *(NSObject **)(a1 + 32);
    dispatch_group_leave(v2);
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000396C;
    v6[3] = &unk_100014490;
    long long v8 = *(_OWORD *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 88);
    id v7 = *(id *)(a1 + 32);
    [v3 _getASTSessionStatusForTicketNumber:v4 timeout:v5 completion:v6];
  }
}

void sub_10000396C(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v14 = v7;

  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
  id v13 = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100003B2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4)
  {
    [v4 doubleValue];
    uint64_t v4 = *(void **)(a1 + 32);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  [v4 doubleValue];
  double v7 = v6;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003C08;
  v8[3] = &unk_100014508;
  id v9 = *(id *)(a1 + 48);
  +[ASTSession sessionStatusForIdentities:v3 ticketNumber:v5 timeout:0 requestQueuedSuiteInfo:v8 completionHandler:v7];
}

void sub_100003C08(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = DSLogSessionAvailability();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109634;
    v10[1] = a2;
    __int16 v11 = 2112;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AST sessionExists: %d, info: %@, error: %@", (uint8_t *)v10, 0x1Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100003EE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = DSLogSessionAvailability();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    id v8 = [v3 status];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ELS status: %lu", (uint8_t *)&v7, 0xCu);
  }

  id v5 = [v3 status];
  double v6 = DSLogSessionAvailability();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 67109120;
    LODWORD(v8) = (unint64_t)v5 > 1;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Active Enhanced Logging session: %d", (uint8_t *)&v7, 8u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000424C(uint64_t a1, void *a2)
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100004464;
  v17[3] = &unk_100014580;
  id v18 = *(id *)(a1 + 32);
  [a2 enumerateObjectsUsingBlock:v17];
  uint64_t v4 = DSLogSessionAvailability();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Discovery complete, found: %@", buf, 0xCu);
  }

  double v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [*(id *)(a1 + 32) count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = *(id *)(a1 + 32);
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      __int16 v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = +[ASTIdentity identityWithSerialNumber:](ASTIdentity, "identityWithSerialNumber:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v11), (void)v13);
        [v6 addObject:v12];

        __int16 v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v9);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100004464(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [v12 state];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = [v12 state];
    uint64_t v6 = [v5 serialNumber];
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = [v12 state];
      id v9 = [v8 serialNumber];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_6;
      }
      __int16 v11 = *(void **)(a1 + 32);
      uint64_t v4 = [v12 state];
      uint64_t v5 = [v4 serialNumber];
      [v11 addObject:v5];
    }
  }
LABEL_6:
}

void sub_100004790(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100004944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100004968(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "New devices: %@", (uint8_t *)&v7, 0xCu);
  }

  [WeakRetained setDevices:v3];
  uint64_t v6 = [WeakRetained delegate];
  [v6 observerDidChangeDevices:WeakRetained];
}

void sub_100004BD4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100004BF8(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setDevices:v4];
  uint64_t v5 = [WeakRetained delegate];
  [v5 observerDidChangeDevices:WeakRetained];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005220(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005380(uint64_t a1)
{
  uint64_t v2 = +[NSMutableSet set];
  id v3 = dispatch_group_create();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = a1;
  id v4 = [*(id *)(a1 + 32) observers];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v8);
        dispatch_group_enter(v3);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_10000554C;
        v11[3] = &unk_100014620;
        id v12 = v2;
        long long v13 = v3;
        [v9 oneshotWithHandler:v11];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  (*(void (**)(void))(*(void *)(v10 + 40) + 16))();
}

void sub_10000554C(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  id v4 = *(void **)(a1 + 32);
  id v5 = [v6 allObjects];
  [v4 addObjectsFromArray:v5];

  objc_sync_exit(v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1000055E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005B88(uint64_t a1)
{
  if (NSClassFromString(@"DADeviceLocal"))
  {
    uint64_t v2 = objc_opt_new();
  }
  else
  {
    id v3 = (void *)MGCopyAnswer();
    id v6 = [[DADeviceRepresentation alloc] initWithSerialNumber:v3 isLocal:1 attributes:&__NSDictionary0__struct];

    uint64_t v2 = (uint64_t)v6;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = (id)v2;
  id v5 = +[NSSet setWithObject:v2];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
}

void sub_10000712C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000071F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000072B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007378(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000743C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007500(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000075C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000772C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000077F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000078B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007978(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007C10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007CF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007F5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_100008260(uint64_t a1)
{
  uint64_t v2 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  CFStringRef v6 = @"info";
  uint64_t v7 = v3;
  id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"com.apple.Diagnostics.deviceStateChangedNotification" object:v4 userInfo:v5];
}

void sub_100008DD8(id a1)
{
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  qword_10001C3B0 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);
  _objc_release_x1();
}

void sub_1000092CC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _fetchDevices];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_10000941C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 48) copy];
  id v3 = objc_retainBlock(v2);
  uint64_t v4 = [*(id *)(a1 + 32) handlers];
  [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v5 = *(void **)(a1 + 32);
  return [v5 _beginObserving];
}

void sub_100009548(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handlers];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) handlers];
  id v4 = [v3 count];

  if (!v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    [v5 _endObserving];
  }
}

void sub_100009A0C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) devices];
  id v12 = [v2 copy];

  id v3 = [*(id *)(a1 + 32) _fetchDevices];
  id v4 = [*(id *)(a1 + 32) devices];
  id v5 = [v4 mutableCopy];

  [v5 minusSet:v3];
  id v6 = [v3 mutableCopy];
  uint64_t v7 = [*(id *)(a1 + 32) devices];
  [v6 minusSet:v7];

  id v8 = [*(id *)(a1 + 32) devices];
  [v8 minusSet:v5];

  uint64_t v9 = [*(id *)(a1 + 32) devices];
  [v9 unionSet:v6];

  uint64_t v10 = [*(id *)(a1 + 32) devices];
  unsigned __int8 v11 = [v12 isEqual:v10];

  if ((v11 & 1) == 0) {
    [*(id *)(a1 + 32) _updateHandlers];
  }
}

void sub_100009F5C(id a1)
{
  qword_10001C3C0 = +[NSSet setWithObjects:@"Accessory.SmartBatteryCase", 0];
  _objc_release_x1();
}

void sub_10000A560(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A624(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A7CC(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:"_nanoRegistryDevicePaired:" name:NRPairedDeviceRegistryDeviceDidPairNotification object:0];

  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:*(void *)(a1 + 32) selector:"_nanoRegistryDeviceUnpaired:" name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];
}

id sub_10000A878(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDevicesWithSerialNumber:0];
}

void sub_10000A938(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:NRPairedDeviceRegistryDevice];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) _createDeviceWithNanoDevice:v3];
    if (v4)
    {
      id v5 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [v4 state];
        uint64_t v7 = [v6 serialNumber];
        int v9 = 138412290;
        uint64_t v10 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] Nano device connected", (uint8_t *)&v9, 0xCu);
      }
      id v8 = [*(id *)(a1 + 40) devices];
      [v8 addObject:v4];

      [*(id *)(a1 + 40) _updateHandlers];
    }
  }
}

void sub_10000AB3C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:NRPairedDeviceRegistryDevice];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) _createDeviceWithNanoDevice:v3];
    if (v4)
    {
      id v5 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [v4 state];
        uint64_t v7 = [v6 serialNumber];
        int v9 = 138412290;
        uint64_t v10 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] Nano device disconnected", (uint8_t *)&v9, 0xCu);
      }
      id v8 = [*(id *)(a1 + 40) devices];
      [v8 removeObject:v4];

      [*(id *)(a1 + 40) _updateHandlers];
    }
  }
}

void sub_10000AE08(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 removeObserver:*(void *)(a1 + 32)];
}

void sub_10000AEE8(uint64_t a1)
{
  id v2 = +[NRPairedDeviceRegistry sharedInstance];
  id v3 = [v2 getPairedDevices];

  id v4 = +[NRPairedDeviceRegistry sharedInstance];
  id v5 = +[NRPairedDeviceRegistry pairedDevicesSelectorBlock];
  id v6 = [v4 getAllDevicesWithArchivedAltAccountDevicesMatching:v5];

  if ([v6 count])
  {
    uint64_t v7 = [v3 arrayByAddingObjectsFromArray:v6];

    id v3 = (void *)v7;
  }
  int v25 = v6;
  id v8 = [*(id *)(a1 + 32) devices];
  int v9 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v8 count]);

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v3;
  id v11 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = [*(id *)(a1 + 32) _createDeviceWithNanoDevice:*(void *)(*((void *)&v26 + 1) + 8 * i)];
        long long v16 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          long long v17 = [v15 state];
          id v18 = [v17 serialNumber];
          *(_DWORD *)buf = 138412290;
          uint64_t v31 = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%@] Nano device connected", buf, 0xCu);
        }
        [v9 addObject:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v12);
  }

  v19 = [*(id *)(a1 + 32) devices];
  id v20 = [v19 mutableCopy];

  [v20 minusSet:v9];
  id v21 = [v9 mutableCopy];
  BOOL v22 = [*(id *)(a1 + 32) devices];
  [v21 minusSet:v22];

  int v23 = [*(id *)(a1 + 32) devices];
  [v23 minusSet:v20];

  v24 = [*(id *)(a1 + 32) devices];
  [v24 unionSet:v21];

  [*(id *)(a1 + 32) _updateHandlers];
}

void sub_10000B89C(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.Diagnostics.airpodsObservationQueue", 0);
  id v2 = (void *)qword_10001C3D8;
  qword_10001C3D8 = (uint64_t)v1;

  uint64_t v3 = qword_10001C3D8;
  +[BluetoothManager setSharedInstanceQueue:v3];
}

void sub_10000B8F4(uint64_t a1)
{
  id v2 = +[BluetoothManager sharedInstance];
  [*(id *)(a1 + 32) setBtManager:v2];
}

void sub_10000B9EC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) btManager];
  if (!v2
    || (uint64_t v3 = (void *)v2,
        [*(id *)(a1 + 32) btManager],
        id v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 available],
        v4,
        v3,
        (v5 & 1) == 0))
  {
    id v6 = [*(id *)(a1 + 32) btManagerAvailableSemaphore];
    dispatch_time_t v7 = dispatch_time(0, 3000000000);
    dispatch_semaphore_wait(v6, v7);
  }
  [*(id *)(a1 + 32) _ensureInitialDevicesFetched];
  [*(id *)(a1 + 32) _updateHandlers];
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [*(id *)(a1 + 32) devices];
  (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);
}

id sub_10000BBBC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 48) copy];
  id v3 = objc_retainBlock(v2);
  id v4 = [*(id *)(a1 + 32) handlers];
  [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];

  unsigned __int8 v5 = *(void **)(a1 + 32);
  return [v5 _beginObserving];
}

void sub_10000BCE8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handlers];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) handlers];
  id v4 = [v3 count];

  if (!v4)
  {
    unsigned __int8 v5 = *(void **)(a1 + 32);
    [v5 _endObserving];
  }
}

void sub_10000C574(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C77C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000CB9C(os_log_t log)
{
  int v1 = 138412290;
  CFStringRef v2 = @"com.apple.private.DiagnosticsSessionAvailability.client";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Rejecting connection due to missing entitlement %@", (uint8_t *)&v1, 0xCu);
}

void sub_10000CC20(os_log_t log, double a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Request timed out after %f seconds", (uint8_t *)&v2, 0xCu);
}

void sub_10000CC9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CD14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CD8C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CE04(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Unhandled ELSStatus case: %lu", (uint8_t *)&v2, 0xCu);
}

void sub_10000CE7C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "No serial numbers are present for paired airpods device %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000CEF4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to add Bluetooth device: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000CF6C(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to decorate Airpods device with UI. Tests requiring UI will fail.", v1, 2u);
}

uint64_t BYSetupAssistantHasCompletedInitialRun()
{
  return _BYSetupAssistantHasCompletedInitialRun();
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return _BYSetupAssistantNeedsToRun();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
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

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return _xpc_copy_entitlement_for_token();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend__accessoryIdentifiersToPromote(void *a1, const char *a2, ...)
{
  return [a1 _accessoryIdentifiersToPromote];
}

id objc_msgSend__beginObserving(void *a1, const char *a2, ...)
{
  return [a1 _beginObserving];
}

id objc_msgSend__endObserving(void *a1, const char *a2, ...)
{
  return [a1 _endObserving];
}

id objc_msgSend__enhancedLoggingStatusOverride(void *a1, const char *a2, ...)
{
  return [a1 _enhancedLoggingStatusOverride];
}

id objc_msgSend__ensureInitialDevicesFetched(void *a1, const char *a2, ...)
{
  return [a1 _ensureInitialDevicesFetched];
}

id objc_msgSend__fetchDevices(void *a1, const char *a2, ...)
{
  return [a1 _fetchDevices];
}

id objc_msgSend__forceDiscoverAllDevices(void *a1, const char *a2, ...)
{
  return [a1 _forceDiscoverAllDevices];
}

id objc_msgSend__getHasActiveDiagnosticsSession(void *a1, const char *a2, ...)
{
  return [a1 _getHasActiveDiagnosticsSession];
}

id objc_msgSend__purgeUnpairedDevices(void *a1, const char *a2, ...)
{
  return [a1 _purgeUnpairedDevices];
}

id objc_msgSend__sendChangeNotification(void *a1, const char *a2, ...)
{
  return [a1 _sendChangeNotification];
}

id objc_msgSend__sendChangeNotificationIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _sendChangeNotificationIfNeeded];
}

id objc_msgSend__sessionStatusOverride(void *a1, const char *a2, ...)
{
  return [a1 _sessionStatusOverride];
}

id objc_msgSend__updateDevices(void *a1, const char *a2, ...)
{
  return [a1 _updateDevices];
}

id objc_msgSend__updateHandlers(void *a1, const char *a2, ...)
{
  return [a1 _updateHandlers];
}

id objc_msgSend__waitUntilFirstResponse(void *a1, const char *a2, ...)
{
  return [a1 _waitUntilFirstResponse];
}

id objc_msgSend_acceptableValueClasses(void *a1, const char *a2, ...)
{
  return [a1 acceptableValueClasses];
}

id objc_msgSend_accessoryInfo(void *a1, const char *a2, ...)
{
  return [a1 accessoryInfo];
}

id objc_msgSend_accessoryObservationQueue(void *a1, const char *a2, ...)
{
  return [a1 accessoryObservationQueue];
}

id objc_msgSend_accessoryRegistrationQueue(void *a1, const char *a2, ...)
{
  return [a1 accessoryRegistrationQueue];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_airpodsDevice(void *a1, const char *a2, ...)
{
  return [a1 airpodsDevice];
}

id objc_msgSend_airpodsRegistrationQueue(void *a1, const char *a2, ...)
{
  return [a1 airpodsRegistrationQueue];
}

id objc_msgSend_allDevices(void *a1, const char *a2, ...)
{
  return [a1 allDevices];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allowCellularSizeThreshold(void *a1, const char *a2, ...)
{
  return [a1 allowCellularSizeThreshold];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return [a1 available];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_btManager(void *a1, const char *a2, ...)
{
  return [a1 btManager];
}

id objc_msgSend_btManagerAvailableSemaphore(void *a1, const char *a2, ...)
{
  return [a1 btManagerAvailableSemaphore];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultObserverClasses(void *a1, const char *a2, ...)
{
  return [a1 defaultObserverClasses];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return [a1 deviceClass];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifier];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_diagnosticEventID(void *a1, const char *a2, ...)
{
  return [a1 diagnosticEventID];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_displayDeviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 displayDeviceIdentifier];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_durationRemaining(void *a1, const char *a2, ...)
{
  return [a1 durationRemaining];
}

id objc_msgSend_enclosureColor(void *a1, const char *a2, ...)
{
  return [a1 enclosureColor];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_errors(void *a1, const char *a2, ...)
{
  return [a1 errors];
}

id objc_msgSend_firstResponseLock(void *a1, const char *a2, ...)
{
  return [a1 firstResponseLock];
}

id objc_msgSend_firstResponseSent(void *a1, const char *a2, ...)
{
  return [a1 firstResponseSent];
}

id objc_msgSend_fullscreenPromptsEnabled(void *a1, const char *a2, ...)
{
  return [a1 fullscreenPromptsEnabled];
}

id objc_msgSend_getPairedDevices(void *a1, const char *a2, ...)
{
  return [a1 getPairedDevices];
}

id objc_msgSend_handlers(void *a1, const char *a2, ...)
{
  return [a1 handlers];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_history(void *a1, const char *a2, ...)
{
  return [a1 history];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_information(void *a1, const char *a2, ...)
{
  return [a1 information];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initialDevicesFetched(void *a1, const char *a2, ...)
{
  return [a1 initialDevicesFetched];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAppleAudioDevice(void *a1, const char *a2, ...)
{
  return [a1 isAppleAudioDevice];
}

id objc_msgSend_isCheckerBoardActive(void *a1, const char *a2, ...)
{
  return [a1 isCheckerBoardActive];
}

id objc_msgSend_isTemporaryPaired(void *a1, const char *a2, ...)
{
  return [a1 isTemporaryPaired];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nanoObservationQueue(void *a1, const char *a2, ...)
{
  return [a1 nanoObservationQueue];
}

id objc_msgSend_nanoRegistrationQueue(void *a1, const char *a2, ...)
{
  return [a1 nanoRegistrationQueue];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_observer(void *a1, const char *a2, ...)
{
  return [a1 observer];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return [a1 observers];
}

id objc_msgSend_paired(void *a1, const char *a2, ...)
{
  return [a1 paired];
}

id objc_msgSend_pairedDevices(void *a1, const char *a2, ...)
{
  return [a1 pairedDevices];
}

id objc_msgSend_pairedDevicesSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 pairedDevicesSelectorBlock];
}

id objc_msgSend_phase(void *a1, const char *a2, ...)
{
  return [a1 phase];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_productId(void *a1, const char *a2, ...)
{
  return [a1 productId];
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return [a1 productType];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_registerForLocalNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForLocalNotifications];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sessionSettings(void *a1, const char *a2, ...)
{
  return [a1 sessionSettings];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return [a1 sharedAccessoryManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return [a1 signal];
}

id objc_msgSend_skipped(void *a1, const char *a2, ...)
{
  return [a1 skipped];
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return [a1 snapshot];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_suiteDescription(void *a1, const char *a2, ...)
{
  return [a1 suiteDescription];
}

id objc_msgSend_suiteID(void *a1, const char *a2, ...)
{
  return [a1 suiteID];
}

id objc_msgSend_suiteName(void *a1, const char *a2, ...)
{
  return [a1 suiteName];
}

id objc_msgSend_suitesAvailable(void *a1, const char *a2, ...)
{
  return [a1 suitesAvailable];
}

id objc_msgSend_supportedDeviceAllowList(void *a1, const char *a2, ...)
{
  return [a1 supportedDeviceAllowList];
}

id objc_msgSend_testSuiteName(void *a1, const char *a2, ...)
{
  return [a1 testSuiteName];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unregisterForLocalNotifications(void *a1, const char *a2, ...)
{
  return [a1 unregisterForLocalNotifications];
}

id objc_msgSend_useSupportedDeviceAllowList(void *a1, const char *a2, ...)
{
  return [a1 useSupportedDeviceAllowList];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return [a1 wait];
}