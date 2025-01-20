uint64_t sub_1000040A8()
{
  uint64_t result;

  if (qword_10001E1D8 != -1) {
    dispatch_once(&qword_10001E1D8, &stru_1000188B0);
  }
  dispatch_sync((dispatch_queue_t)qword_10001E1E0, &stru_100018870);
  result = dword_10001E1D0;
  if (!dword_10001E1D0)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return dword_10001E1D0;
  }
  return result;
}

void sub_100004134(id a1)
{
  if (!dword_10001E1D0) {
    dword_10001E1D0 = sub_1000041A0("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
  }
}

void sub_100004174(id a1)
{
  qword_10001E1E0 = (uint64_t)dispatch_queue_create("aks-client-queue", 0);
}

uint64_t sub_1000041A0(char *path, const char *a2)
{
  kern_return_t v5;
  CFDictionaryRef v6;
  io_service_t MatchingService;
  io_object_t v8;
  uint64_t result;
  kern_return_t v10;
  io_connect_t connect;

  connect = 0;
  io_service_t v3 = IORegistryEntryFromPath(kIOMasterPortDefault, path);
  if (!v3 || (io_object_t v4 = v3, v5 = IOServiceOpen(v3, mach_task_self_, 0, &connect), IOObjectRelease(v4), v5))
  {
    v6 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v6);
    if (MatchingService)
    {
      v8 = MatchingService;
      IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
      IOObjectRelease(v8);
    }
  }
  result = connect;
  if (connect)
  {
    v10 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    result = connect;
    if (v10)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

uint64_t sub_100004298(int a1, _DWORD *a2)
{
  uint64_t v4 = 3758097084;
  mach_port_t v5 = sub_1000040A8();
  if (v5)
  {
    if (a2)
    {
      uint64_t output = 0;
      uint64_t input = a1;
      uint32_t outputCnt = 1;
      uint64_t v4 = IOConnectCallMethod(v5, 7u, &input, 1u, 0, 0, &output, &outputCnt, 0, 0);
      if (!v4) {
        *a2 = output;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  else
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_lock_state", ":", 824, "", 0, "", "");
  }
  return v4;
}

id sub_100004644(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyListener];
}

id sub_1000046C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onqueueRecheck];
}

void sub_100004904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004924(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _onqueueRecheck];
}

void sub_100004AB4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) listeners];
  [v2 removePointer:*(void *)(a1 + 40)];
}

void sub_100004BBC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) listeners];
  [v2 compact];

  id v3 = [*(id *)(a1 + 32) listeners];
  [v3 addPointer:*(void *)(a1 + 40)];
}

id sub_100004CE4(uint64_t a1, void *a2)
{
  return [a2 handleNotification:*(void *)(a1 + 32)];
}

void sub_100004E2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004E50(uint64_t a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, "Notification");
  if (string)
  {
    uint64_t v4 = string;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained notification:v4];
  }
}

void sub_100004F20(id a1)
{
  qword_10001E1F0 = objc_alloc_init(XPCNotificationDispatcher);

  _objc_release_x1();
}

void sub_1000055F4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = a2;
  id v6 = +[NSNull null];

  if (v6 == v7) {
    [*(id *)(a1 + 32) addObject:v5];
  }
  else {
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v5];
  }
}

id sub_100005698(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_10000E250("processing keys");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "pending:%@", buf, 0xCu);
  }

  id v5 = [*(id *)(a1 + 32) account];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v9 = 0;
  id v7 = [v5 keysChanged:v6 error:&v9];

  return v7;
}

void sub_100005884(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  if (!v3)
  {
    id v3 = +[NSNull null];
  }
  [*(id *)(a1 + 40) setObject:v3 forKey:v4];
}

id sub_100005BB0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unlocked");
}

id sub_100005C2C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_locked");
}

id sub_100005CA8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_storeAccountChanged");
}

id sub_100005D58(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_storeKeysChanged:initial:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

id sub_100005DDC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleNotification:", *(void *)(a1 + 40));
}

void *sub_100005E7C(void *result)
{
  if (!*(unsigned char *)(result[4] + 20))
  {
    v1 = result;
    id v2 = sub_10000E250("event");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = v1[4];
      int v7 = 138412290;
      uint64_t v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ received darwin notification before first NSNotification", (uint8_t *)&v7, 0xCu);
    }

    id v4 = (void *)v1[4];
    id v5 = [v4 copyAllKeyInterests];
    id v6 = [v4 pendKeysAndGetNewlyPended:v5];

    return [(id)v1[4] processPendingKeysForCurrentLockState];
  }
  return result;
}

void sub_1000064F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  uint64_t v9 = a6;
  id v10 = a7;
  id v11 = *(void **)(a1 + 32);
  id v20 = 0;
  unsigned int v12 = [v11 syncWithAllPeers:&v20];
  id v13 = v20;
  if (!v12)
  {
    v14 = sub_10000E250("SecError");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to syncWithAllPeers: %@", buf, 0xCu);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000665C;
  block[3] = &unk_100018EA8;
  id v18 = v13;
  id v19 = v10;
  id v15 = v13;
  id v16 = v10;
  dispatch_async(v9, block);
}

uint64_t sub_10000665C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, *(void *)(a1 + 32));
}

void sub_100006714(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  v14 = a6;
  id v15 = sub_10000E250("syncwith");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    v17 = [v11 allObjects];
    id v18 = [v17 componentsJoinedByString:@" "];
    *(_DWORD *)buf = 138412546;
    uint64_t v46 = v16;
    __int16 v47 = 2112;
    v48 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ syncwith peers: %@", buf, 0x16u);
  }
  id v19 = sub_10000E250("syncwith");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void *)(a1 + 32);
    v21 = [v12 allObjects];
    id v22 = [v21 componentsJoinedByString:@" "];
    *(_DWORD *)buf = 138412546;
    uint64_t v46 = v20;
    __int16 v47 = 2112;
    v48 = v22;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ syncwith backups: %@", buf, 0x16u);
  }
  v23 = *(void **)(a1 + 40);
  id v44 = 0;
  v24 = [v23 syncWithPeers:v11 backups:v12 error:&v44];
  id v25 = v44;
  v26 = sub_10000E250("syncwith");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = v13;
    id v28 = v12;
    v29 = v14;
    id v30 = v11;
    uint64_t v31 = *(void *)(a1 + 32);
    v32 = [v24 allObjects];
    [v32 componentsJoinedByString:@" "];
    v33 = uint64_t v38 = a1;
    *(_DWORD *)buf = 138412546;
    uint64_t v46 = v31;
    id v11 = v30;
    v14 = v29;
    id v12 = v28;
    id v13 = v27;
    __int16 v47 = 2112;
    v48 = v33;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@ syncwith handled: %@", buf, 0x16u);

    a1 = v38;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006A64;
  block[3] = &unk_100018AD0;
  uint64_t v34 = *(void *)(a1 + 32);
  id v40 = v24;
  uint64_t v41 = v34;
  id v42 = v25;
  id v43 = v13;
  id v35 = v25;
  id v36 = v13;
  id v37 = v24;
  dispatch_async(v14, block);
}

uint64_t sub_100006A64(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 40) lockMonitor];
    [v2 recheck];
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v3();
}

void sub_100006B74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  uint64_t v9 = a6;
  id v10 = a7;
  [*(id *)(a1 + 32) setEnsurePeerRegistrationEnqueuedButNotStarted:0];
  id v11 = *(void **)(a1 + 40);
  id v26 = 0;
  unsigned int v12 = [v11 ensurePeerRegistration:&v26];
  id v13 = v26;
  v14 = sub_10000E250("EnsurePeerRegistration");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    CFStringRef v16 = @"failure";
    *(_DWORD *)buf = 138412802;
    if (v12) {
      CFStringRef v16 = @"success";
    }
    uint64_t v28 = v15;
    __int16 v29 = 2112;
    CFStringRef v30 = v16;
    __int16 v31 = 2112;
    id v32 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ ensurePeerRegistration called, %@ (%@)", buf, 0x20u);
  }

  if (v12)
  {
    char v17 = 1;
  }
  else
  {
    id v18 = [*(id *)(a1 + 32) lockMonitor];
    [v18 recheck];

    id v19 = [*(id *)(a1 + 32) lockMonitor];
    char v17 = [v19 locked] ^ 1;
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100006D64;
  v22[3] = &unk_100018A80;
  char v25 = v17;
  id v23 = v13;
  id v24 = v10;
  id v20 = v13;
  id v21 = v10;
  dispatch_async(v9, v22);
}

uint64_t sub_100006D64(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void sub_100006DFC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) ensurePeerRegistration])
  {
    if (!*(unsigned char *)(a1 + 40)
      || ([*(id *)(a1 + 32) lockMonitor],
          id v2 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v3 = [v2 locked],
          v2,
          (v3 & 1) == 0))
    {
      if ([*(id *)(a1 + 32) ensurePeerRegistrationEnqueuedButNotStarted])
      {
        id v4 = sub_10000E250("EnsurePeerRegistration");
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v5 = *(void *)(a1 + 32);
          int v7 = 138412290;
          uint64_t v8 = v5;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ ensurePeerRegistration block already enqueued, not starting a new one", (uint8_t *)&v7, 0xCu);
        }
      }
      else
      {
        id v6 = *(void **)(a1 + 32);
        [v6 doEnsurePeerRegistration];
      }
    }
  }
}

void sub_100006FC8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  id v10 = a2;
  id v11 = a7;
  unsigned int v12 = a6;
  id v13 = sub_10000E250("CloudKeychainProxy");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "send keys: %@", buf, 0xCu);
  }

  uint64_t v14 = *(void *)(a1 + 40);
  id v26 = 0;
  uint64_t v15 = (*(void (**)(void))(v14 + 16))();
  id v16 = v26;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007174;
  block[3] = &unk_100018AD0;
  uint64_t v17 = *(void *)(a1 + 32);
  id v22 = v15;
  uint64_t v23 = v17;
  id v24 = v16;
  id v25 = v11;
  id v18 = v11;
  id v19 = v16;
  id v20 = v15;
  dispatch_async(v12, block);
}

uint64_t sub_100007174(void *a1)
{
  if (!a1[4])
  {
    id v2 = sub_10000E250("SecError");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = a1[5];
      uint64_t v4 = a1[6];
      int v6 = 138412546;
      uint64_t v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ ensurePeerRegistration failed: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

void sub_1000072FC(uint64_t a1)
{
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_100007578;
  id v27 = sub_100007588;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_100007578;
  id v21 = sub_100007588;
  id v22 = 0;
  uint64_t v11 = 0;
  unsigned int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_100007578;
  uint64_t v15 = sub_100007588;
  id v16 = 0;
  uint64_t v7 = 0;
  __int16 v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = -86;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  char v6 = -86;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 176);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007590;
  block[3] = &unk_1000189E0;
  void block[4] = v2;
  block[5] = &v23;
  block[6] = &v17;
  block[7] = &v11;
  block[8] = &v7;
  block[9] = v5;
  dispatch_sync(v3, block);
  (*(void (**)(void, uint64_t, uint64_t, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v24[5], v18[5], v12[5], *((unsigned __int8 *)v8 + 24), *(void *)(*(void *)(a1 + 32) + 176));
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
}

void sub_100007530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Block_object_dispose((const void *)(v33 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007578(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007588(uint64_t a1)
{
}

uint64_t sub_100007590(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 88) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(*(void *)(a1 + 32) + 120) copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = [*(id *)(*(void *)(a1 + 32) + 136) copy];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 21);
  uint64_t v11 = [*(id *)(a1 + 32) lockMonitor];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v11 locked];

  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  uint64_t v12 = +[NSMutableSet set];
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void **)(v13 + 96);
  *(void *)(v13 + 96) = v12;

  uint64_t v15 = +[NSMutableSet set];
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void **)(v16 + 128);
  *(void *)(v16 + 128) = v15;

  *(void *)(*(void *)(a1 + 32) + 144) = +[NSMutableSet set];

  return _objc_release_x1();
}

void sub_1000076B8(uint64_t a1, void *a2, void *a3, int a4, uint64_t a5)
{
  id v9 = a2;
  id v10 = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  uint64_t v11 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v11 + 21)) {
    BOOL v12 = a4 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  BOOL v13 = v12 || *(unsigned char *)(v11 + 23) != 0;
  *(unsigned char *)(v11 + 21) = v13;
  *(unsigned char *)(*(void *)(a1 + 32) + 23) = 0;
  unsigned int v14 = 1;
  [*(id *)(a1 + 32) handlePendingEnsurePeerRegistrationRequests:1];
  if ([*(id *)(*(void *)(a1 + 32) + 128) isEmpty]) {
    unsigned int v14 = [*(id *)(*(void *)(a1 + 32) + 144) isEmpty] ^ 1;
  }
  if (v10)
  {
    [*(id *)(*(void *)(a1 + 32) + 120) minusSet:v10];
    [*(id *)(*(void *)(a1 + 32) + 136) minusSet:v10];
    if (([v10 isEmpty] & 1) == 0)
    {
      uint64_t v15 = sub_10000E250("sync-ids");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = [v10 logIDs];
        *(_DWORD *)buf = 138412290;
        v73 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "handled syncIDs: %@", buf, 0xCu);
      }
      uint64_t v17 = sub_10000E250("sync-ids");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [*(id *)(*(void *)(a1 + 32) + 120) logIDs];
        *(_DWORD *)buf = 138412290;
        v73 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "remaining peerIDs: %@", buf, 0xCu);
      }
      uint64_t v19 = sub_10000E250("sync-ids");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [*(id *)(*(void *)(a1 + 32) + 136) logIDs];
        *(_DWORD *)buf = 138412290;
        v73 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "remaining backupIDs: %@", buf, 0xCu);
      }
      if (v14)
      {
        id v21 = sub_10000E250("sync-ids");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = [*(id *)(*(void *)(a1 + 32) + 128) logIDs];
          *(_DWORD *)buf = 138412290;
          v73 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "signaled peerIDs: %@", buf, 0xCu);
        }
        uint64_t v23 = sub_10000E250("sync-ids");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = [*(id *)(*(void *)(a1 + 32) + 144) logIDs];
          *(_DWORD *)buf = 138412290;
          v73 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "signaled backupIDs: %@", buf, 0xCu);
        }
      }
    }
    uint64_t v25 = *(void *)(a1 + 32);
    id v26 = *(void **)(v25 + 128);
    *(void *)(v25 + 128) = 0;

    uint64_t v27 = *(void *)(a1 + 32);
    id v28 = *(void **)(v27 + 144);
    *(void *)(v27 + 144) = 0;
  }
  __int16 v29 = *(void **)(*(void *)(a1 + 32) + 88);
  CFStringRef v30 = +[NSNull null];
  [v29 removeObject:v30];

  [*(id *)(*(void *)(a1 + 32) + 88) minusSet:v9];
  id v31 = [*(id *)(*(void *)(a1 + 32) + 96) count];
  id v32 = *(id *)(*(void *)(a1 + 32) + 96);
  uint64_t v33 = *(void *)(a1 + 32);
  uint64_t v34 = *(void **)(v33 + 96);
  *(void *)(v33 + 96) = 0;

  v71 = v32;
  id v35 = [*(id *)(a1 + 32) pendKeysAndGetPendingForCurrentLockState:v32];
  id v36 = sub_10000E250("keytrace");
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    id v37 = v10;
    uint64_t v38 = *(void **)(a1 + 32);
    [v9 allObjects];
    id v67 = v31;
    id v40 = v39 = a5;
    id v69 = v9;
    [v40 componentsJoinedByString:@" "];
    uint64_t v41 = v68 = v14;
    id v42 = [v35 allObjects];
    id v43 = [v42 componentsJoinedByString:@" "];
    *(_DWORD *)buf = 138412802;
    v73 = v38;
    id v10 = v37;
    __int16 v74 = 2112;
    *(void *)v75 = v41;
    *(_WORD *)&v75[8] = 2112;
    v76 = v43;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%@ account handled: %@ pending: %@", buf, 0x20u);

    a5 = v39;
    id v31 = v67;

    id v9 = v69;
    unsigned int v14 = v68;
  }

  [*(id *)(a1 + 32) persistState];
  if (v14)
  {
    id v44 = [*(id *)(a1 + 32) lockMonitor];
    unsigned __int8 v45 = [v44 locked];

    if ((v45 & 1) == 0)
    {
      uint64_t v46 = sub_10000E250("event");
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v47 = *(void **)(a1 + 32);
        unsigned int v48 = [v47 hasPendingSyncIDs];
        v49 = *(unsigned __int8 **)(a1 + 32);
        id v50 = v31;
        id v51 = v10;
        int v52 = v49[24];
        [v49 lockMonitor];
        v70 = v35;
        v54 = uint64_t v53 = a5;
        unsigned int v55 = [v54 locked];
        *(_DWORD *)buf = 138413058;
        v73 = v47;
        __int16 v74 = 1024;
        *(_DWORD *)v75 = v48;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v52;
        id v10 = v51;
        id v31 = v50;
        LOWORD(v76) = 1024;
        *(_DWORD *)((char *)&v76 + 2) = v55;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%@ syncWithPeersPending: %d inCallout: %d isLocked: %d", buf, 0x1Eu);

        a5 = v53;
        id v35 = v70;
      }

      if ([*(id *)(a1 + 32) hasPendingSyncIDs])
      {
        v56 = *(unsigned char **)(a1 + 32);
        if (!v56[24])
        {
          v57 = [v56 lockMonitor];
          unsigned __int8 v58 = [v57 locked];

          if ((v58 & 1) == 0) {
            [*(id *)(a1 + 32) doSyncWithPendingPeers];
          }
        }
      }
    }
  }
  uint64_t v59 = *(void *)(a1 + 32);
  if (v31) {
    goto LABEL_35;
  }
  v61 = [*(id *)(a1 + 32) lockMonitor];
  if ([v61 locked])
  {
LABEL_39:

    uint64_t v59 = *(void *)(a1 + 32);
    goto LABEL_40;
  }
  int v66 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

  uint64_t v59 = *(void *)(a1 + 32);
  if (v66)
  {
LABEL_35:
    id v60 = [(id)v59 copyValues:v35];
    [(id)v59 processKeyChangedEvent:v60];

    uint64_t v59 = *(void *)(a1 + 32);
    if (!*(void *)(v59 + 184)) {
      goto LABEL_40;
    }
    v61 = sub_10000E250("SecError");
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Flush block is not null and sending new keys", buf, 2u);
    }
    goto LABEL_39;
  }
LABEL_40:
  v62 = *(void **)(v59 + 184);
  if (v62)
  {
    dispatch_async(*(dispatch_queue_t *)(v59 + 168), v62);
    uint64_t v63 = *(void *)(a1 + 32);
    v64 = *(void **)(v63 + 184);
    *(void *)(v63 + 184) = 0;
  }
  if (a5)
  {
    v65 = [*(id *)(a1 + 32) lockMonitor];
    [v65 recheck];
  }
  xpc_transaction_end();
}

void sub_100008560(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_10000E250("proxy");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "removing from KVS store: %@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = [*(id *)(a1 + 32) store];
  [v5 removeObjectForKey:v3];
}

uint64_t sub_100008920(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(unsigned __int8 *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100008B14(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sub_10000E250("fresh");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "EFRESH";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s WFS Done", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100008BF4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) store];
  id v11 = 0;
  unsigned __int8 v3 = [v2 pullUpdates:&v11];
  id v4 = v11;

  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(NSObject **)(v5 + 176);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100008CC8;
  v8[3] = &unk_100018990;
  unsigned __int8 v10 = v3;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

id sub_100008CC8(uint64_t a1)
{
  return [*(id *)(a1 + 32) waitForSyncDone:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
}

void sub_100009094(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6
    || (+[NSNull null],
        id v7 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        v7 == v6))
  {
    BOOL v13 = [*(id *)(a1 + 32) store];
    [v13 removeObjectForKey:v5];
  }
  else
  {
    if ([v5 hasPrefix:@"ak|"])
    {
      id v8 = [*(id *)(a1 + 32) store];
      id v9 = [v8 objectForKey:v5];

      if ([v9 isEqual:v6])
      {
        unsigned __int8 v10 = sub_10000E250("keytrace");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 138412290;
          id v15 = v5;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "forcing resend of key write: %@", (uint8_t *)&v14, 0xCu);
        }

        id v11 = [*(id *)(a1 + 32) store];
        [v11 removeObjectForKey:v5];
      }
    }
    BOOL v12 = [*(id *)(a1 + 32) store];
    [v12 addOneToOutGoing];

    BOOL v13 = [*(id *)(a1 + 32) store];
    [v13 setObject:v6 forKey:v5];
  }
}

void sub_10000A598(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:v3];
  id v5 = sub_10000E250("xpcproxy");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412546;
    id v11 = v3;
    __int16 v12 = 2112;
    BOOL v13 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "get: key: %@, object: %@", (uint8_t *)&v10, 0x16u);
  }

  if (v4) {
    uint64_t v6 = _CFXPCCreateXPCObjectFromCFObject();
  }
  else {
    uint64_t v6 = (uint64_t)xpc_null_create();
  }
  id v7 = (void *)v6;
  id v8 = *(void **)(a1 + 40);
  id v9 = v3;
  xpc_dictionary_set_value(v8, (const char *)[v9 UTF8String], v7);
}

void sub_10000A6C4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    uint64_t v6 = _CFXPCCreateXPCObjectFromCFObject();
  }
  else {
    uint64_t v6 = (uint64_t)xpc_null_create();
  }
  xpc_object_t value = (xpc_object_t)v6;
  id v7 = *(void **)(a1 + 32);
  id v8 = v5;
  id v9 = (const char *)[v8 UTF8String];

  xpc_dictionary_set_value(v7, v9, value);
}

void sub_10000B1E8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sub_10000E250("xpcproxy");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v20 = 136315394;
    *(void *)&v20[4] = "EFRESH";
    *(_WORD *)&v20[12] = 2112;
    *(void *)&v20[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Result from [Proxy waitForSynchronization:]: %@", v20, 0x16u);
  }

  uint64_t v6 = *(void **)(a1 + 32);
  if (v6)
  {
    if (v4)
    {
      xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
      CFStringRef Domain = CFErrorGetDomain(v4);
      *(void *)id v20 = _NSConcreteStackBlock;
      *(void *)&v20[8] = 0x40000000;
      *(void *)&v20[16] = sub_100011270;
      id v21 = &unk_100019110;
      xpc_object_t v22 = v7;
      uint64_t v23 = "domain";
      sub_10000E94C(Domain, (uint64_t)v20);
      int64_t Code = CFErrorGetCode(v4);
      xpc_dictionary_set_int64(v7, "code", Code);
      CFStringRef v10 = (const __CFString *)CFErrorCopyUserInfo(v4);
      size_t v14 = sub_10000F104(v10, 0, v11, v12, v13);
      if (v14)
      {
        size_t v15 = v14;
        uint64_t v16 = (UInt8 *)malloc_type_malloc(v14, 0x4ABABCFuLL);
        unint64_t v17 = (unint64_t)&v16[v15];
        id v18 = (const void *)sub_10000F398(v10, 0, 0, v16, v17);
        if (v18) {
          xpc_dictionary_set_data(v7, "userinfo", v18, v17 - (void)v18);
        }
        free(v16);
      }
      CFRelease(v10);
      id v19 = v7;
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "error", v19);
    }
    else
    {
      xpc_dictionary_set_string(v6, "value", "ACK");
    }
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  }
}

void sub_10000B414(uint64_t a1)
{
  [*(id *)(a1 + 32) sendAckResponse:*(void *)(a1 + 40) forEvent:*(void *)(a1 + 48)];
  v1 = sub_10000E250("xpcproxy");
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v2 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "flush reply sent", v2, 2u);
  }
}

void sub_10000B498(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  xpc_object_t xdict = xpc_dictionary_create_reply(v3);
  id v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  xpc_dictionary_set_value(xdict, "value", v5);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), xdict);
}

void sub_10000B6B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000B6D0(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id result = [a2 isNSString];
  if ((result & 1) == 0)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

void sub_10000BAC4(id a1)
{
  v1 = sub_10000E250("xpcproxy");
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "exiting due to SIGTERM", v2, 2u);
  }

  xpc_transaction_exit_clean();
}

void sub_10000BB38(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_connection)
  {
    id v4 = xpc_connection_copy_entitlement_value();
    id v3 = v4;
    if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v3))
    {
      id v5 = +[CloudKeychainProxy sharedObject];
      uint64_t v6 = [v5 proxyID];
      xpc_object_t v7 = objc_msgSend(v6, "ckdkvsproxy_queue");
      xpc_connection_set_target_queue(v2, v7);

      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10000BD64;
      v10[3] = &unk_100018D90;
      id v8 = v2;
      uint64_t v11 = v8;
      xpc_connection_set_event_handler(v8, v10);
      xpc_connection_resume(v8);
    }
    else
    {
      id v9 = sub_10000E250("xpcproxy");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v10[0]) = 67109120;
        HIDWORD(v10[0]) = xpc_connection_get_pid(v2);
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "cloudkeychainproxy_event_handler: rejected client %d", (uint8_t *)v10, 8u);
      }

      xpc_connection_cancel(v2);
    }
  }
  else
  {
    id v3 = sub_10000E250("xpcproxy");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10[0]) = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "expected XPC_TYPE_CONNECTION", (uint8_t *)v10, 2u);
    }
  }
}

void sub_10000BD64(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v3 = +[CloudKeychainProxy sharedObject];
    objc_msgSend(v3, "cloudkeychainproxy_peer_dictionary_handler:forEvent:", *(void *)(a1 + 32), v4);
  }
}

void sub_10000BDE0()
{
  v0 = sub_10000E250("xpcproxy");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v3 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "finalize_connection", v3, 2u);
  }

  v1 = +[CloudKeychainProxy sharedObject];
  id v2 = [v1 proxyID];
  [v2 synchronizeStore];

  xpc_transaction_end();
}

void sub_10000BED8(id a1)
{
  qword_10001E1F8 = objc_opt_new();

  _objc_release_x1();
}

int main(int argc, const char **argv, const char **envp)
{
  id v4 = sub_10000E250("xpcproxy");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v21 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Starting CloudKeychainProxy", v21, 2u);
  }

  uint64_t v6 = +[CloudKeychainProxy sharedObject];
  xpc_object_t v7 = v6;
  if (argc < 2)
  {
    if (SOSCompatibilityModeEnabled())
    {
      int out_token = -1;
      uint64_t v11 = (const char *)kSOSCCSOSIsNowOFF;
      uint64_t v12 = dispatch_get_global_queue(17, 0);
      notify_register_dispatch(v11, &out_token, v12, &stru_100018D68);
    }
    if ((SOSCCIsSOSTrustAndSyncingEnabledCachedValue() & 1) == 0)
    {
      uint64_t v13 = sub_10000E250("xpcproxy");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SOS is currently not supported or enabled; exiting when possible",
          buf,
          2u);
      }

      xpc_transaction_exit_clean();
    }
    if (v7)
    {
      size_t v14 = sub_10000E250("xpcproxy");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id v18 = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Starting mainRunLoop", v18, 2u);
      }

      size_t v15 = +[NSRunLoop mainRunLoop];
      [v15 run];
    }
    uint64_t v16 = sub_10000E250("xpcproxy");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Exiting CloudKeychainProxy", v17, 2u);
    }

    return 1;
  }
  else
  {
    id v8 = [v6 proxyID];
    id v9 = [v8 copyAsDictionary];

    NSLog(@"All: %@", v9);
    return 0;
  }
}

void sub_10000C16C(id a1, int a2)
{
  id v2 = sub_10000E250("xpcproxy");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SOS has been turned off! Exiting when clean 🖖", v3, 2u);
  }

  xpc_transaction_exit_clean();
}

void *sub_10000C690(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) perfCounters];
  ++result[3];
  return result;
}

id sub_10000C768(uint64_t a1)
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_10000C8D8;
  uint64_t v12 = sub_10000C8E8;
  id v13 = 0;
  id v2 = *(void **)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C8F0;
  v7[3] = &unk_100018ED0;
  v7[4] = &v8;
  [v2 perfCounters:v7];
  id v3 = [*(id *)(a1 + 32) perfQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000C900;
  v6[3] = &unk_100018E08;
  v6[4] = *(void *)(a1 + 32);
  dispatch_sync(v3, v6);

  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void sub_10000C8C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000C8D8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000C8E8(uint64_t a1)
{
}

void sub_10000C8F0(uint64_t a1, void *a2)
{
}

double sub_10000C900(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) perfCounters];
  double result = 0.0;
  _OWORD *v1 = 0u;
  v1[1] = 0u;
  v1[2] = 0u;
  *((void *)v1 + 6) = 0;
  return result;
}

void sub_10000C9E0(uint64_t a1)
{
  v11[0] = CKDKVSPerfCounterSynchronize;
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(void *)[*(id *)(a1 + 32) perfCounters]);
  v12[0] = v3;
  v11[1] = CKDKVSPerfCounterSynchronizeWithCompletionHandler;
  id v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *((void *)[*(id *)(a1 + 32) perfCounters] + 1));
  v12[1] = v4;
  v11[2] = CKDKVSPerfCounterIncomingMessages;
  id v5 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *((void *)[*(id *)(a1 + 32) perfCounters] + 2));
  v12[2] = v5;
  v11[3] = CKDKVSPerfCounterOutgoingMessages;
  uint64_t v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *((void *)[*(id *)(a1 + 32) perfCounters] + 3));
  v12[3] = v6;
  v11[4] = CKDKVSPerfCounterTotalWaitTimeSynchronize;
  xpc_object_t v7 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *((void *)[*(id *)(a1 + 32) perfCounters] + 4));
  v12[4] = v7;
  v11[5] = CKDKVSPerfCounterLongestWaitTimeSynchronize;
  uint64_t v8 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *((void *)[*(id *)(a1 + 32) perfCounters] + 5));
  v12[5] = v8;
  v11[6] = CKDKVSPerfCounterSynchronizeFailures;
  id v9 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *((void *)[*(id *)(a1 + 32) perfCounters] + 6));
  v12[6] = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:7];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v10);
}

void sub_10000CE6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_10000CE8C(uint64_t a1)
{
  double result = [*(id *)(a1 + 32) perfCounters];
  ++result[1];
  return result;
}

void sub_10000CEB4(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = [*(id *)(a1 + 32) perfQueue];
  uint64_t v6 = v5;
  if (v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D0EC;
    block[3] = &unk_100018E08;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(v5, block);

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    xpc_object_t v7 = sub_10000E250("fresh");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = "EFRESH";
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      id v20 = v4;
      id v9 = "%s RETURNING FROM syncdefaultsd SWCH: %@: %@";
      uint64_t v10 = v7;
      uint32_t v11 = 32;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000D114;
    v13[3] = &unk_100018E08;
    v13[4] = *(void *)(a1 + 32);
    dispatch_async(v5, v13);

    xpc_object_t v7 = sub_10000E250("fresh");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "EFRESH";
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      id v9 = "%s RETURNING FROM syncdefaultsd SWCH: %@";
      uint64_t v10 = v7;
      uint32_t v11 = 22;
      goto LABEL_6;
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void *sub_10000D0EC(uint64_t a1)
{
  double result = [*(id *)(a1 + 32) perfCounters];
  ++result[6];
  return result;
}

void *sub_10000D114(uint64_t a1)
{
  double result = [*(id *)(a1 + 32) perfCounters];
  ++*result;
  return result;
}

void sub_10000D1E0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) proxy];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) userInfo];
    id v4 = [v3 objectForKey:NSUbiquitousKeyValueStoreChangeReasonKey];
    id v5 = [v3 objectForKey:NSUbiquitousKeyValueStoreChangedKeysKey];
    if (v5)
    {
      uint64_t v6 = +[NSSet setWithArray:v5];
      if (!v4) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v6 = 0;
      if (!v4)
      {
LABEL_16:

        goto LABEL_17;
      }
    }
    switch((unint64_t)[v4 integerValue])
    {
      case 0uLL:
        xpc_object_t v7 = v2;
        uint64_t v8 = v6;
        uint64_t v9 = 0;
        goto LABEL_9;
      case 1uLL:
        xpc_object_t v7 = v2;
        uint64_t v8 = v6;
        uint64_t v9 = 1;
LABEL_9:
        [v7 storeKeysChanged:v8 initial:v9];
        goto LABEL_16;
      case 2uLL:
        uint64_t v10 = sub_10000E250("SecCritical");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v11) = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received NSUbiquitousKeyValueStoreQuotaViolationChange", (uint8_t *)&v11, 2u);
        }
        goto LABEL_15;
      case 3uLL:
        [v2 storeAccountChanged];
        goto LABEL_16;
      default:
        uint64_t v10 = sub_10000E250("kvsstore");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          int v11 = 138412290;
          uint64_t v12 = v4;
          _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "ignoring unknown notification: %@", (uint8_t *)&v11, 0xCu);
        }
LABEL_15:

        break;
    }
    goto LABEL_16;
  }
LABEL_17:
}

void *sub_10000D5A4(uint64_t a1)
{
  double result = [*(id *)(a1 + 32) perfCounters];
  ++result[2];
  return result;
}

id sub_10000D5CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) kvsStoreChanged:*(void *)(a1 + 40)];
}

void sub_10000D82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D844(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)sRingPrefix;
  id v8 = v3;
  if ([v3 containsString:sRingPrefix]) {
    goto LABEL_4;
  }
  id v5 = (void *)sCirclePrefix;
  if ([v8 containsString:sCirclePrefix])
  {

LABEL_4:
LABEL_5:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    goto LABEL_6;
  }
  uint64_t v6 = (void *)kSOSKVSKeyParametersKey;
  unsigned __int8 v7 = [v8 containsString:kSOSKVSKeyParametersKey];

  if (v7) {
    goto LABEL_5;
  }
LABEL_6:
}

void sub_10000DA54(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v10 = 0;
  unsigned int v2 = [v1 pullUpdates:&v10];
  id v3 = v10;
  id v4 = v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    uint64_t v6 = sub_10000E250("pushWrites");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unsigned __int8 v7 = "successfully synced with KVS!";
      id v8 = v6;
      uint32_t v9 = 2;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v6 = sub_10000E250("SecError");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v4;
      unsigned __int8 v7 = "pushWrites: failed to synchronize with KVS: %@";
      id v8 = v6;
      uint32_t v9 = 12;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    }
  }
}

void *sub_10000DB74(uint64_t a1)
{
  double result = [*(id *)(a1 + 32) perfCounters];
  ++*result;
  return result;
}

void sub_10000DC60(uint64_t a1, void *a2)
{
  unsigned int v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 cloudStore];
  [v4 removeObjectForKey:v3];
}

id sub_10000DE00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

const void *sub_10000E100(const __CFString *a1)
{
  if (a1) {
    CFStringRef v1 = a1;
  }
  else {
    CFStringRef v1 = @"logging";
  }
  os_unfair_lock_lock_with_options();
  CFDictionaryRef Mutable = (const __CFDictionary *)qword_10001E210;
  if (!qword_10001E210)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFCopyStringDictionaryKeyCallBacks, 0);
    qword_10001E210 = (uint64_t)Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, v1);
  if (!Value)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 0x40000000;
    v5[2] = sub_10000E200;
    void v5[3] = &unk_100018F18;
    v5[4] = v1;
    sub_10000E94C(v1, (uint64_t)v5);
    Value = CFDictionaryGetValue((CFDictionaryRef)qword_10001E210, v1);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10001E208);
  return Value;
}

void sub_10000E200(uint64_t a1, const char *a2)
{
  unsigned int v2 = (__CFDictionary *)qword_10001E210;
  id v3 = *(const void **)(a1 + 32);
  os_log_t v4 = os_log_create("com.apple.securityd", a2);

  CFDictionaryAddValue(v2, v3, v4);
}

const void *sub_10000E250(const char *a1)
{
  pthread_mutex_lock(&stru_10001E188);
  pthread_mutex_unlock(&stru_10001E188);
  if (a1)
  {
    CFStringRef v2 = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x600u);
    id v3 = sub_10000E100(v2);
    if (v2) {
      CFRelease(v2);
    }
    return v3;
  }
  else
  {
    return sub_10000E100(0);
  }
}

uint64_t sub_10000E2E0(const __CFDictionary *a1, uint64_t a2)
{
  long long v3 = xmmword_1000141B0;
  LOBYTE(v3) = 1;
  uint64_t v4 = a2;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)sub_10000E34C, &v3);
  if ((_BYTE)v3) {
    return ccder_sizeof();
  }
  else {
    return 0;
  }
}

uint64_t sub_10000E34C(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)a3)
  {
    double result = sub_10000E394(result, a2, *(CFTypeRef **)(a3 + 16));
    if (result) {
      *(void *)(a3 + 8) += result;
    }
    else {
      *(unsigned char *)a3 = 0;
    }
  }
  return result;
}

uint64_t sub_10000E394(uint64_t a1, uint64_t a2, CFTypeRef *a3)
{
  if (sub_10000F104(a1, a3) && sub_10000F104(a2, a3))
  {
    return ccder_sizeof();
  }
  else
  {
    sub_10000F034(-6, v5, v6, a3, v7, @"null input");
    return 0;
  }
}

uint64_t sub_10000E424(const __CFDictionary *a1, CFTypeRef *a2, char a3)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  v14[0] = 0xAAAAAAAAAAAAAA01;
  v14[1] = a2;
  BYTE1(v14[0]) = a3;
  v14[2] = Mutable;
  v14[3] = 0;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)sub_10000E668, v14);
  if (!LOBYTE(v14[0]))
  {
    if (Mutable) {
      CFRelease(Mutable);
    }
    return 0;
  }
  v15.length = CFArrayGetCount(Mutable);
  v15.location = 0;
  CFArraySortValues(Mutable, v15, (CFComparatorFunction)sub_10000E5A0, 0);
  CFIndex Count = CFArrayGetCount(Mutable);
  if (Count >= 1)
  {
    unint64_t v8 = Count + 1;
    do
    {
      CFDataRef ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(Mutable, v8 - 2);
      CFDataGetLength(ValueAtIndex);
      CFDataGetBytePtr(ValueAtIndex);
      ccder_encode_body();
      --v8;
    }
    while (v8 > 1);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  uint64_t result = ccder_encode_constructed_tl();
  if (!result)
  {
    sub_10000F034(-7, v11, v12, a2, v13, @"ccder failed to encode");
    return 0;
  }
  return result;
}

uint64_t sub_10000E5A0(const __CFData *a1, const __CFData *a2)
{
  CFIndex Length = CFDataGetLength(a1);
  CFIndex v5 = CFDataGetLength(a2);
  unint64_t v6 = v5;
  if (Length < 0 || v5 < 0)
  {
    if (Length >= v5) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = -1;
    }
    if (Length <= v5) {
      return v12;
    }
    else {
      return 1;
    }
  }
  else
  {
    if (Length >= v5) {
      size_t v7 = v5;
    }
    else {
      size_t v7 = Length;
    }
    BytePtr = CFDataGetBytePtr(a1);
    uint32_t v9 = CFDataGetBytePtr(a2);
    int v10 = memcmp(BytePtr, v9, v7);
    if (v10 <= 0 && (v10 || Length <= v6))
    {
      LODWORD(v13) = v10 == 0;
      if (Length >= v6) {
        LODWORD(v13) = 0;
      }
      if (v10 < 0) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = v13;
      }
      return v13 << 63 >> 63;
    }
    else
    {
      return 1;
    }
  }
}

void sub_10000E668(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)a3)
  {
    CFIndex v6 = sub_10000E394(a1, a2, *(CFTypeRef **)(a3 + 8));
    if (!v6)
    {
      *(unsigned char *)a3 = 0;
      return;
    }
    CFIndex v7 = v6;
    CFMutableArrayRef Mutable = CFDataCreateMutable(*(CFAllocatorRef *)(a3 + 24), v6);
    CFDataSetLength(Mutable, v7);
    MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
    int v10 = &MutableBytePtr[v7];
    uint64_t v11 = *(CFTypeRef **)(a3 + 8);
    uint64_t v12 = *(unsigned __int8 *)(a3 + 1);
    uint64_t v13 = sub_10000F398(a2, v11, v12, MutableBytePtr, v10);
    sub_10000F398(a1, v11, v12, MutableBytePtr, v13);
    uint64_t v14 = ccder_encode_constructed_tl();
    if (v14)
    {
      v19.length = v14 - (void)MutableBytePtr;
      v19.location = 0;
      CFDataDeleteBytes(Mutable, v19);
      CFArrayAppendValue(*(CFMutableArrayRef *)(a3 + 16), Mutable);
      if (!Mutable) {
        return;
      }
    }
    else
    {
      sub_10000F034(-7, v15, v16, v11, v17, @"ccder failed to encode");
      *(unsigned char *)a3 = 0;
      if (!Mutable) {
        return;
      }
    }
    CFRelease(Mutable);
  }
}

uint64_t sub_10000E7B0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (qword_10001E228 != -1) {
    dispatch_once(&qword_10001E228, &stru_100018FF0);
  }
  uint64_t v2 = qword_10001E230;
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

void sub_10000E81C(id a1)
{
  qword_10001E230 = (uint64_t)CFCalendarCreateWithIdentifier(kCFAllocatorDefault, kCFGregorianCalendar);
  CFTimeZoneRef v1 = CFTimeZoneCreateWithTimeIntervalFromGMT(kCFAllocatorDefault, 0.0);
  CFCalendarSetTimeZone((CFCalendarRef)qword_10001E230, v1);
  if (v1)
  {
    CFRelease(v1);
  }
}

void sub_10000E8A0(id a1)
{
  qword_10001E220 = (uint64_t)dispatch_queue_create("ZuluCalendar", 0);
}

uint64_t sub_10000E8CC(uint64_t result, int a2, UInt8 *buffer)
{
  if (buffer)
  {
    uint64_t v4 = result;
    CFStringRef v5 = *(const __CFString **)(result + 40);
    CFRange v8 = *(CFRange *)(v4 + 48);
    CFIndex v6 = *(void *)(v4 + 64);
    CFIndex usedBufLen = 0xAAAAAAAAAAAAAAAALL;
    CFStringGetBytes(v5, v8, 0x8000100u, 0, 0, buffer, v6, &usedBufLen);
    buffer[usedBufLen] = 0;
    return (*(uint64_t (**)(void))(*(void *)(v4 + 32) + 16))();
  }
  return result;
}

void sub_10000E94C(const __CFString *a1, uint64_t a2)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 0x40000000;
  CFRange v8 = sub_10000EA94;
  uint32_t v9 = &unk_100018F90;
  uint64_t v10 = a2;
  CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr)
  {
    uint64_t v4 = CStringPtr;
    size_t v5 = strlen(CStringPtr);
    ((void (*)(void *, const char *, size_t))v8)(v7, v4, v5);
  }
  else
  {
    CFIndex usedBufLen = 0;
    CFIndex Length = CFStringGetLength(a1);
    v13.location = 0;
    v13.length = Length;
    CFStringGetBytes(a1, v13, 0x8000100u, 0, 0, 0, 0, &usedBufLen);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 0x40000000;
    v11[2] = sub_10000E8CC;
    v11[3] = &unk_100018F68;
    v11[6] = 0;
    void v11[7] = Length;
    v11[8] = usedBufLen;
    v11[4] = v7;
    v11[5] = a1;
    sub_1000110E8(usedBufLen + 1, (uint64_t)v11);
  }
}

uint64_t sub_10000EA94(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000EAA4(uint64_t a1, CFCalendarRef calendar)
{
  uint64_t result = CFCalendarDecomposeAbsoluteTime(calendar, *(CFAbsoluteTime *)(a1 + 40), "yMdHms", *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result != 0;
  return result;
}

uint64_t sub_10000EB08(const __CFNumber *a1, CFTypeRef *a2)
{
  uint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
  if (CFNumberGetValue(a1, kCFNumberLongLongType, &valuePtr))
  {
    if ((HIBYTE(valuePtr) + 1) <= 1u)
    {
      uint64_t v6 = 9;
      uint64_t v7 = 48;
      do
      {
        if ((unint64_t)(v6 - 2) < 2) {
          break;
        }
        uint64_t v8 = valuePtr >> v7;
        --v6;
        v7 -= 8;
      }
      while (HIBYTE(valuePtr) == v8);
    }
    return ccder_sizeof();
  }
  else
  {
    sub_10000F034(-4, v3, v4, a2, v5, @"Unable to get number from data");
    return 0;
  }
}

uint64_t sub_10000EBDC(const __CFNumber *a1, CFTypeRef *a2, uint64_t a3, uint64_t a4)
{
  uint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
  if (!CFNumberGetValue(a1, kCFNumberLongLongType, &valuePtr))
  {
    sub_10000F034(-4, v7, v8, a2, v9, @"Unable to get number from data");
    return 0;
  }
  uint64_t v10 = valuePtr;
  unint64_t v11 = HIBYTE(valuePtr);
  if ((HIBYTE(valuePtr) + 1) > 1u)
  {
    uint64_t v16 = 8;
    if (!a4) {
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v12 = 9;
    uint64_t v13 = 48;
    uint64_t v14 = 1;
    while ((unint64_t)(v12 - 2) >= 2)
    {
      uint64_t v15 = valuePtr >> v13;
      --v12;
      v13 -= 8;
      if (v11 != v15)
      {
        uint64_t v14 = v12 - 1;
        goto LABEL_11;
      }
    }
    uint64_t v12 = 2;
LABEL_11:
    if ((((valuePtr >> (8 * v14 - 8)) ^ v11) & 0x80) != 0) {
      uint64_t v16 = v12;
    }
    else {
      uint64_t v16 = v14;
    }
    if (!a4) {
      goto LABEL_22;
    }
  }
  if (a4 - a3 < v16)
  {
LABEL_22:
    sub_10000F034(-3, v16, v8, a2, v9, @"Unknown size");
    return 0;
  }
  if ((unint64_t)v16 <= 1) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = v16;
  }
  do
  {
    *(unsigned char *)--a4 = v10;
    v10 >>= 8;
    --v17;
  }
  while (v17);
  uint64_t valuePtr = v10;
  uint64_t result = ccder_encode_tl();
  if (!result)
  {
    sub_10000F034(-7, v19, v20, a2, v21, @"ccder failed to encode");
    return 0;
  }
  return result;
}

BOOL sub_10000ED18(int a1, CFTypeRef *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1 && a2)
  {
    uint64_t v10 = (__CFString *)*a2;
    *a2 = 0;
    sub_10000ED84(a1, kCFErrorDomainMach, v10, a2, @"aks_get_lock_state failed: %x", &a9);
  }
  return a1 == 0;
}

void sub_10000ED84(CFIndex a1, const __CFString *a2, __CFString *cf, CFTypeRef *a4, CFStringRef format, va_list arguments)
{
  if (!a4) {
    return;
  }
  if (*a4)
  {
    if (cf && *a4 != cf)
    {
      CFRelease(cf);
    }
    return;
  }
  CFStringRef v10 = CFStringCreateWithFormatAndArguments(0, 0, format, arguments);
  uint64_t v28 = 0;
  if (!cf) {
    goto LABEL_30;
  }
  CFDictionaryRef v11 = CFErrorCopyUserInfo((CFErrorRef)cf);
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v11, kCFErrorDescriptionKey);
  if (Value)
  {
    BOOL v13 = CFEqual(v10, Value);
    if (!v11) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  BOOL v13 = 0;
  if (v11) {
LABEL_11:
  }
    CFRelease(v11);
LABEL_12:
  CFIndex Code = CFErrorGetCode((CFErrorRef)cf);
  CFStringRef Domain = CFErrorGetDomain((CFErrorRef)cf);
  CFComparisonResult v16 = CFStringCompare(a2, Domain, 0);
  BOOL v18 = Code == a1 && v16 == kCFCompareEqualTo && v13;
  uint64_t v19 = cf;
  if (v18) {
    goto LABEL_19;
  }
  CFDictionaryRef v21 = CFErrorCopyUserInfo((CFErrorRef)cf);
  if (v21)
  {
    CFDictionaryRef v22 = v21;
    uint64_t v23 = (const void *)kSOSCountKey;
    if (CFDictionaryContainsKey(v21, kSOSCountKey) == 1)
    {
      CFNumberRef v24 = (const __CFNumber *)CFDictionaryGetValue(v22, v23);
      if (v24)
      {
        uint64_t valuePtr = 0;
        CFNumberGetValue(v24, kCFNumberLongType, &valuePtr);
        if (valuePtr > 199)
        {
          CFRelease(v22);
          uint64_t v19 = cf;
LABEL_19:
          CFRetain(v19);
          *a4 = cf;
          CFRelease(cf);
          if (!v10) {
            return;
          }
          CFStringRef v20 = v10;
          goto LABEL_44;
        }
        uint64_t v28 = valuePtr + 1;
      }
    }
    CFRelease(v22);
  }
LABEL_30:
  CFNumberRef v25 = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongType, &v28);
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  uint64_t v27 = Mutable;
  if (cf) {
    CFDictionaryAddValue(Mutable, kCFErrorUnderlyingErrorKey, cf);
  }
  if (v25) {
    CFDictionaryAddValue(v27, kSOSCountKey, v25);
  }
  if (v10) {
    CFDictionaryAddValue(v27, kCFErrorDescriptionKey, v10);
  }
  *a4 = CFErrorCreate(kCFAllocatorDefault, a2, a1, v27);
  if (v25) {
    CFRelease(v25);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v27) {
    CFRelease(v27);
  }
  if (cf)
  {
    CFStringRef v20 = cf;
LABEL_44:
    CFRelease(v20);
  }
}

void sub_10000F034(CFIndex a1, uint64_t a2, uint64_t a3, CFTypeRef *a4, uint64_t a5, CFStringRef format, ...)
{
  va_start(va, format);
  sub_10000ED84(a1, @"com.apple.security.cfder.error", 0, a4, format, va);
}

void sub_10000F070(uint64_t a1, __CFString **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFTypeRef cf = 0;
  if (a2)
  {
    sub_10000ED84(-1, kCFErrorDomainOSStatus, *a2, &cf, @"Invalid date: %i, %i, %i, %i, %i, %i, %i", &a9);
    *a2 = (__CFString *)cf;
  }
  else
  {
    sub_10000ED84(-1, kCFErrorDomainOSStatus, 0, &cf, @"Invalid date: %i, %i, %i, %i, %i, %i, %i", &a9);
    CFTypeRef v10 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v10);
    }
  }
}

uint64_t sub_10000F104(const __CFString *a1, CFTypeRef *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a1)
  {
    sub_10000F034(-5, (uint64_t)a2, a3, a2, a5, @"Null CFType");
    return 0;
  }
  CFTypeID v7 = CFGetTypeID(a1);
  if (CFArrayGetTypeID() == v7)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
    if (Count >= 1)
    {
      uint64_t v9 = 0;
      unint64_t v10 = Count + 1;
      do
      {
        CFDataRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v10 - 2);
        v9 += sub_10000F104(ValueAtIndex, a2);
        --v10;
      }
      while (v10 > 1);
    }
    goto LABEL_14;
  }
  if (CFBooleanGetTypeID() == v7)
  {
LABEL_14:
    return ccder_sizeof();
  }
  if (CFDataGetTypeID() == v7)
  {
    CFIndex Length = CFDataGetLength((CFDataRef)a1);
    return _ccder_sizeof_raw_octet_string(Length);
  }
  if (CFDateGetTypeID() == v7)
  {
    CFDateGetAbsoluteTime((CFDateRef)a1);
    __dtoa();
    __freedtoa();
    goto LABEL_14;
  }
  if (CFDictionaryGetTypeID() == v7)
  {
    return sub_10000E2E0((const __CFDictionary *)a1, (uint64_t)a2);
  }
  if (CFSetGetTypeID() == v7)
  {
    return sub_100010868((const __CFSet *)a1, (uint64_t)a2);
  }
  if (CFStringGetTypeID() == v7)
  {
    return sub_10000FE88(a1);
  }
  if (CFNumberGetTypeID() != v7)
  {
    if (CFNullGetTypeID() == v7) {
      goto LABEL_14;
    }
    sub_10000F034(-5, v14, v15, a2, v16, @"Unsupported CFType");
    return 0;
  }

  return sub_10000EB08((const __CFNumber *)a1, a2);
}

uint64_t sub_10000F398(const __CFString *a1, CFTypeRef *a2, uint64_t a3, UInt8 *a4, unint64_t a5)
{
  if (!a1)
  {
    sub_10000F034(-5, (uint64_t)a2, a3, a2, a5, @"Null CFType");
    return 0;
  }
  CFTypeID v10 = CFGetTypeID(a1);
  if (CFArrayGetTypeID() == v10)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
    if (Count >= 1)
    {
      unint64_t v12 = Count + 1;
      uint64_t v13 = a5;
      do
      {
        CFDataRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v12 - 2);
        uint64_t v13 = sub_10000F398(ValueAtIndex, a2, a3, a4, v13);
        --v12;
      }
      while (v12 > 1);
    }
LABEL_6:
    uint64_t v15 = ccder_encode_constructed_tl();
    goto LABEL_14;
  }
  if (CFBooleanGetTypeID() == v10)
  {
    buf[0] = CFBooleanGetValue((CFBooleanRef)a1);
    ccder_encode_body();
LABEL_13:
    uint64_t v15 = ccder_encode_tl();
LABEL_14:
    uint64_t v19 = v15;
    if (!v15) {
      sub_10000F034(-7, v16, v17, a2, v18, @"ccder failed to encode");
    }
    return v19;
  }
  if (CFDataGetTypeID() == v10)
  {
    CFDataGetLength((CFDataRef)a1);
    CFDataGetBytePtr((CFDataRef)a1);
    ccder_encode_body();
    goto LABEL_13;
  }
  if (CFDateGetTypeID() == v10)
  {
    double AbsoluteTime = CFDateGetAbsoluteTime((CFDateRef)a1);
    uint64_t v69 = 0;
    uint64_t v70 = 0;
    uint64_t v68 = 0;
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x2000000000;
    char v74 = -86;
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 0x40000000;
    *(void *)&buf[16] = sub_10000EAA4;
    v78 = &unk_100019018;
    v79 = &v71;
    double v80 = AbsoluteTime;
    v81 = (char *)&v70 + 4;
    v82 = &v70;
    v83 = (char *)&v69 + 4;
    v84 = &v69;
    v85 = (char *)&v68 + 4;
    v86 = &v68;
    if (qword_10001E218 != -1) {
      dispatch_once(&qword_10001E218, &stru_100018FB0);
    }
    block[0] = (__CFString *)_NSConcreteStackBlock;
    block[1] = (__CFString *)0x40000000;
    block[2] = (__CFString *)sub_10000E7B0;
    block[3] = (__CFString *)&unk_100018F40;
    void block[4] = (__CFString *)buf;
    dispatch_sync((dispatch_queue_t)qword_10001E220, block);
    if (*((unsigned char *)v72 + 24))
    {
      _Block_object_dispose(&v71, 8);
    }
    else
    {
      sub_10000F034(-1, v22, v23, a2, v24, @"Failed to encode date.");
      int v32 = *((unsigned __int8 *)v72 + 24);
      _Block_object_dispose(&v71, 8);
      if (!v32)
      {
        id v37 = sub_10000E250("SecError");
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          if (a2) {
            CFTypeRef v38 = *a2;
          }
          else {
            CFTypeRef v38 = 0;
          }
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v38;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "der: unable to encode date: %@", buf, 0xCu);
        }
        goto LABEL_6;
      }
    }
    block[0] = 0;
    int v33 = HIDWORD(v70);
    if ((v70 & 0x300000000) != 0)
    {
      BOOL v34 = 0;
    }
    else
    {
      HIDWORD(v35) = -1030792151 * HIDWORD(v70) + 85899344;
      LODWORD(v35) = HIDWORD(v35);
      if ((v35 >> 2) <= 0x28F5C28)
      {
        HIDWORD(v39) = -1030792151 * HIDWORD(v70) + 85899344;
        LODWORD(v39) = HIDWORD(v39);
        BOOL v34 = (v39 >> 4) < 0xA3D70B;
      }
      else
      {
        BOOL v34 = 1;
      }
    }
    int v41 = HIDWORD(v69);
    int v40 = v70;
    int v42 = HIDWORD(v68);
    if ((int)v68 > 61
      || SHIDWORD(v68) > 59
      || (int)v69 > 23
      || (v70 - 13) < 0xFFFFFFF4
      || (HIDWORD(v69) - 32) < 0xFFFFFFE1
      || v70 == 2 && (v34 | 0x1Cu) < HIDWORD(v69))
    {
      goto LABEL_57;
    }
    if (v70 == 2)
    {
      int v40 = 2;
      goto LABEL_68;
    }
    if (dword_100014208[v70] - dword_100014208[(v70 - 1)] < SHIDWORD(v69))
    {
LABEL_57:
      sub_10000F070(v25, block, v26, v27, v28, v29, v30, v31, SBYTE4(v70));
      id v43 = (__CFString *)CFErrorCopyDescription((CFErrorRef)block[0]);
      sub_100010C48(v43, 0x53C00002u);
      if (v43) {
        CFRelease(v43);
      }
      id v44 = sub_10000E250("SecError");
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v45 = "continuing";
        if (a3) {
          unsigned __int8 v45 = "setting default value";
        }
        *(_DWORD *)buf = 138412546;
        *(__CFString **)&uint8_t buf[4] = block[0];
        *(_WORD *)&uint8_t buf[12] = 2080;
        *(void *)&buf[14] = v45;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "der: invalid date: %@; %s", buf, 0x16u);
      }
      uint64_t v46 = block[0];
      if (block[0])
      {
        block[0] = 0;
        CFRelease(v46);
      }
      if (a3)
      {
        int v33 = 2001;
        int v42 = 1;
        uint64_t v70 = 0x7D100000001;
        HIDWORD(v69) = 1;
        HIDWORD(v68) = 1;
        int v41 = 1;
        int v40 = 1;
      }
      else
      {
        int v40 = v70;
        int v33 = HIDWORD(v70);
        int v41 = HIDWORD(v69);
        int v42 = HIDWORD(v68);
      }
    }
LABEL_68:
    if ((unint64_t)(a4 + 1) <= a5)
    {
      *(unsigned char *)(a5 - 1) = 90;
      unint64_t v47 = a5 - 1;
    }
    else
    {
      unint64_t v47 = 0;
    }
    int v66 = v69;
    int v67 = v68;
    LODWORD(v71) = -1431655766;
    int v75 = -1431655766;
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v48 = __dtoa();
    int v49 = v71;
    uint64_t v50 = *(void *)buf;
    if (AbsoluteTime < 0.0)
    {
      unint64_t v51 = v48 + (v71 & ~((int)v71 >> 31));
      if (v51 < *(void *)buf)
      {
        int v52 = (unsigned char *)(*(void *)buf - 1);
        for (*int v52 = 106 - *(unsigned char *)(*(void *)buf - 1); (unint64_t)v52 > v51; *int v52 = 105 - v53)
          char v53 = *--v52;
      }
      int v49 = v71;
      uint64_t v50 = *(void *)buf;
    }
    if (v50 - v48 <= v49) {
      goto LABEL_92;
    }
    if (v49 < 0)
    {
      int v65 = v33;
      ccder_encode_body();
      size_t v54 = -(uint64_t)(int)v71;
      unsigned int v55 = (void *)ccder_encode_body_nocopy();
      unint64_t v47 = (unint64_t)v55;
      if (!v55)
      {
        int v33 = v65;
        goto LABEL_92;
      }
      if (AbsoluteTime >= 0.0) {
        int v56 = 48;
      }
      else {
        int v56 = 57;
      }
      memset(v55, v56, v54);
      int v33 = v65;
    }
    else
    {
      unint64_t v47 = ccder_encode_body();
    }
    if ((unint64_t)(a4 + 1) <= v47) {
      *(unsigned char *)--unint64_t v47 = 46;
    }
    else {
      unint64_t v47 = 0;
    }
LABEL_92:
    __freedtoa();
    if (!v47) {
      goto LABEL_100;
    }
    unint64_t v63 = (unint64_t)(a4 + 2);
    if ((unint64_t)(a4 + 2) > v47) {
      goto LABEL_100;
    }
    *(unsigned char *)(v47 - 2) = v67 / 10 + 48;
    *(unsigned char *)(v47 - 1) = v67 % 10 + 48;
    if (v63 > v47 - 2) {
      goto LABEL_100;
    }
    *(unsigned char *)(v47 - 4) = v42 / 10 + 48;
    *(unsigned char *)(v47 - 3) = v42 % 10 + 48;
    if (v63 > v47 - 4) {
      goto LABEL_100;
    }
    *(unsigned char *)(v47 - 6) = v66 / 10 + 48;
    *(unsigned char *)(v47 - 5) = v66 % 10 + 48;
    if (v63 > v47 - 6) {
      goto LABEL_100;
    }
    *(unsigned char *)(v47 - 8) = v41 / 10 + 48;
    *(unsigned char *)(v47 - 7) = v41 % 10 + 48;
    if (v63 <= v47 - 8
      && (*(unsigned char *)(v47 - 10) = v40 / 10 + 48, *(unsigned char *)(v47 - 9) = v40 % 10 + 48, v63 <= v47 - 10)
      && (unsigned int v64 = (((103 * (v33 % 100)) >> 15) & 1) + ((103 * (v33 % 100)) >> 10),
          *(unsigned char *)(v47 - 12) = v64 + 48,
          *(unsigned char *)(v47 - 11) = v33 % 100 - 10 * v64 + 48,
          v63 <= v47 - 12))
    {
      *(unsigned char *)(v47 - 14) = v33 / 1000 + 48;
      *(unsigned char *)(v47 - 13) = v33 / 100 % 10 + 48;
    }
    else
    {
LABEL_100:
      sub_10000F034(-7, v60, v61, a2, v62, @"ccder failed to encode");
    }
    goto LABEL_6;
  }
  if (CFDictionaryGetTypeID() == v10)
  {
    return sub_10000E424((const __CFDictionary *)a1, a2, a3);
  }
  if (CFSetGetTypeID() == v10)
  {
    return sub_10001091C((const __CFSet *)a1, a2, a3);
  }
  if (CFStringGetTypeID() == v10)
  {
    return sub_10000FF08(a1, a2, a4, a5, v36);
  }
  if (CFNumberGetTypeID() == v10)
  {
    return sub_10000EBDC((const __CFNumber *)a1, a2, (uint64_t)a4, a5);
  }
  if (CFNullGetTypeID() != v10)
  {
    sub_10000F034(-5, v57, v58, a2, v59, @"Unsupported CFType");
    return 0;
  }

  return sub_100010814(a2);
}

uint64_t sub_10000FE88(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  CFIndex usedBufLen = 0;
  v6.location = 0;
  v6.length = Length;
  CFStringGetBytes(a1, v6, 0x8000100u, 0, 0, 0, MaximumSizeForEncoding, &usedBufLen);
  return ccder_sizeof();
}

uint64_t sub_10000FF08(const __CFString *a1, CFTypeRef *a2, UInt8 *a3, uint64_t a4, uint64_t a5)
{
  if (a4)
  {
    CFIndex Length = CFStringGetLength(a1);
    CFIndex usedBufLen = 0;
    v18.location = 0;
    v18.length = Length;
    if (CFStringGetBytes(a1, v18, 0x8000100u, 0, 0, a3, a4 - (void)a3, &usedBufLen) == Length)
    {
      ccder_encode_body();
      uint64_t result = ccder_encode_tl();
      if (result) {
        return result;
      }
      sub_10000F034(-7, v14, v15, a2, v16, @"ccder failed to encode");
    }
    else
    {
      sub_10000F034(-5, v10, v11, a2, v12, @"String extraction failed");
    }
  }
  else
  {
    sub_10000F034(-6, (uint64_t)a2, (uint64_t)a3, a2, a5, @"null input");
  }
  return 0;
}

void sub_100010190(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v7;
  }
  else
  {
    id v3 = [v7 description];
  }
  uint64_t v4 = v3;
  unint64_t v5 = *(void *)(a1 + 40);
  if (v5 && v5 < (unint64_t)[v3 length])
  {
    uint64_t v6 = [v4 substringToIndex:*(void *)(a1 + 40)];

    uint64_t v4 = (void *)v6;
  }
  [*(id *)(a1 + 32) insertObject:v4 atIndex:0];
}

void sub_100010334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001034C(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id result = [*(id *)(a1 + 32) containsObject:a2];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void sub_1000104E8(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [a2 stringByAppendingString:@":"];
  [v5 addObject:v7];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v9 = *(void **)(a1 + 32);
  if (isKindOfClass) {
    [v6 componentsJoinedByString:@" "];
  }
  else {
  id v10 = +[NSString stringWithFormat:@"%@", v6];
  }

  [v9 addObject:v10];
}

uint64_t sub_100010814(CFTypeRef *a1)
{
  uint64_t v5 = ccder_encode_tl();
  if (!v5) {
    sub_10000F034(-7, v2, v3, a1, v4, @"ccder failed to encode");
  }
  return v5;
}

uint64_t sub_100010868(const __CFSet *a1, uint64_t a2)
{
  long long v3 = xmmword_1000141B0;
  LOBYTE(v3) = 1;
  uint64_t v4 = a2;
  CFSetApplyFunction(a1, (CFSetApplierFunction)sub_1000108D4, &v3);
  if ((_BYTE)v3) {
    return ccder_sizeof();
  }
  else {
    return 0;
  }
}

uint64_t sub_1000108D4(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)a2)
  {
    id result = sub_10000F104(result, *(void *)(a2 + 16));
    if (result) {
      *(void *)(a2 + 8) += result;
    }
    else {
      *(unsigned char *)a2 = 0;
    }
  }
  return result;
}

uint64_t sub_10001091C(const __CFSet *a1, CFTypeRef *a2, char a3)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  v14[0] = 0xAAAAAAAAAAAAAA01;
  v14[1] = a2;
  BYTE1(v14[0]) = a3;
  v14[2] = Mutable;
  v14[3] = 0;
  CFSetApplyFunction(a1, (CFSetApplierFunction)sub_100010B60, v14);
  if (!LOBYTE(v14[0]))
  {
    if (Mutable) {
      CFRelease(Mutable);
    }
    return 0;
  }
  v15.length = CFArrayGetCount(Mutable);
  v15.location = 0;
  CFArraySortValues(Mutable, v15, (CFComparatorFunction)sub_100010A98, 0);
  CFIndex Count = CFArrayGetCount(Mutable);
  if (Count >= 1)
  {
    unint64_t v8 = Count + 1;
    do
    {
      CFDataRef ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(Mutable, v8 - 2);
      CFDataGetLength(ValueAtIndex);
      CFDataGetBytePtr(ValueAtIndex);
      ccder_encode_body();
      --v8;
    }
    while (v8 > 1);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  uint64_t result = ccder_encode_constructed_tl();
  if (!result)
  {
    sub_10000F034(-7, v11, v12, a2, v13, @"ccder failed to encode");
    return 0;
  }
  return result;
}

uint64_t sub_100010A98(const __CFData *a1, const __CFData *a2)
{
  CFIndex Length = CFDataGetLength(a1);
  CFIndex v5 = CFDataGetLength(a2);
  unint64_t v6 = v5;
  if (Length < 0 || v5 < 0)
  {
    if (Length >= v5) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = -1;
    }
    if (Length <= v5) {
      return v12;
    }
    else {
      return 1;
    }
  }
  else
  {
    if (Length >= v5) {
      size_t v7 = v5;
    }
    else {
      size_t v7 = Length;
    }
    BytePtr = CFDataGetBytePtr(a1);
    uint64_t v9 = CFDataGetBytePtr(a2);
    int v10 = memcmp(BytePtr, v9, v7);
    if (v10 <= 0 && (v10 || Length <= v6))
    {
      LODWORD(v13) = v10 == 0;
      if (Length >= v6) {
        LODWORD(v13) = 0;
      }
      if (v10 < 0) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = v13;
      }
      return v13 << 63 >> 63;
    }
    else
    {
      return 1;
    }
  }
}

void sub_100010B60(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(unsigned char *)a2)
  {
    CFIndex v7 = sub_10000F104(a1, *(CFTypeRef **)(a2 + 8), a3, a4, a5);
    if (!v7)
    {
      *(unsigned char *)a2 = 0;
      return;
    }
    CFIndex v8 = v7;
    CFMutableArrayRef Mutable = CFDataCreateMutable(*(CFAllocatorRef *)(a2 + 24), v7);
    CFDataSetLength(Mutable, v8);
    MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
    uint64_t v11 = sub_10000F398(a1, *(void *)(a2 + 8), *(unsigned __int8 *)(a2 + 1), MutableBytePtr, &MutableBytePtr[v8]);
    if (v11)
    {
      v13.length = v11 - (void)MutableBytePtr;
      v13.location = 0;
      CFDataDeleteBytes(Mutable, v13);
      CFArrayAppendValue(*(CFMutableArrayRef *)(a2 + 16), Mutable);
      if (!Mutable) {
        return;
      }
    }
    else
    {
      *(unsigned char *)a2 = 0;
      if (!Mutable) {
        return;
      }
    }
    CFRelease(Mutable);
  }
}

void sub_100010C48(void *a1, unsigned int a2)
{
  uint64_t v4 = sub_10000E250("SecError");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = a1;
    *(_WORD *)&uint8_t buf[12] = 1024;
    *(_DWORD *)&buf[14] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Simulating crash, reason: %@, code=%08x", buf, 0x12u);
  }

  int v5 = dword_10001E1C8;
  if (dword_10001E1C8 != -1) {
    goto LABEL_4;
  }
  if (!sub_100010EA4())
  {
    int v5 = dword_10001E1C8;
LABEL_4:
    dword_10001E1C8 = v5 + 1;
    return;
  }
  uint64_t v6 = getpid();
  id v7 = a1;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  CFIndex v8 = (void (*)(uint64_t, void, id))off_10001E240;
  uint64_t v16 = off_10001E240;
  if (!off_10001E240)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100010F74;
    CFRange v18 = &unk_1000190F0;
    uint64_t v19 = &v13;
    uint64_t v9 = sub_100010FC4();
    int v10 = dlsym(v9, "SimulateCrash");
    *(void *)(v19[1] + 24) = v10;
    off_10001E240 = *(_UNKNOWN **)(v19[1] + 24);
    CFIndex v8 = (void (*)(uint64_t, void, id))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v8)
  {
    uint64_t v11 = +[NSAssertionHandler currentHandler];
    uint64_t v12 = +[NSString stringWithUTF8String:"BOOL soft_SimulateCrash(pid_t, mach_exception_data_type_t, NSString *__strong)"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"simulate_crash.m", 22, @"%s", dlerror());

    __break(1u);
  }
  v8(v6, a2, v7);
}

void sub_100010E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100010EA4()
{
  if (!qword_10001E238) {
    qword_10001E238 = _sl_dlopen();
  }
  return qword_10001E238;
}

void *sub_100010F74(uint64_t a1)
{
  uint64_t v2 = sub_100010FC4();
  uint64_t result = dlsym(v2, "SimulateCrash");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10001E240 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100010FC4()
{
  uint64_t v0 = sub_100010EA4();
  if (v0) {
    return (void *)v0;
  }
  CFTimeZoneRef v1 = +[NSAssertionHandler currentHandler];
  long long v3 = +[NSString stringWithUTF8String:"void *CrashReporterSupportLibrary(void)"];
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v3, @"simulate_crash.m", 18, @"%s", 0);

  __break(1u);
  free(v4);
  return v1;
}

uint64_t sub_100011074()
{
  uint64_t result = _sl_dlopen();
  qword_10001E238 = result;
  return result;
}

void sub_1000110E8(size_t size, uint64_t a2)
{
  if (size)
  {
    if (size > 0x800)
    {
      int v5 = malloc_type_malloc(size, 0x9C1A2F70uLL);
      (*(void (**)(uint64_t, size_t, void *))(a2 + 16))(a2, size, v5);
      if (v5)
      {
        free(v5);
      }
    }
    else
    {
      __chkstk_darwin();
      memset((char *)&v6 - ((size + 15) & 0xFFFFFFFFFFFFFFF0), 170, size);
      (*(void (**)(uint64_t, size_t, char *))(a2 + 16))(a2, size, (char *)&v6 - ((size + 15) & 0xFFFFFFFFFFFFFFF0));
    }
  }
  else
  {
    uint64_t v4 = *(void (**)(uint64_t, void, void))(a2 + 16);
    v4(a2, 0, 0);
  }
}

void sub_100011270(uint64_t a1, char *string)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return _CFCalendarCreateWithIdentifier(allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  va_start(va, componentDesc);
  long long v3 = va_arg(va, const char *);
  return _CFCalendarDecomposeAbsoluteTime(calendar, at, v3);
}

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz)
{
}

CFURLRef CFCopyHomeDirectoryURL(void)
{
  return _CFCopyHomeDirectoryURL();
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range)
{
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return _CFDataGetMutableBytePtr(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  return _CFDateGetAbsoluteTime(theDate);
}

CFTypeID CFDateGetTypeID(void)
{
  return _CFDateGetTypeID();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return _CFErrorCopyDescription(err);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return _CFErrorCopyUserInfo(err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return _CFErrorCreate(allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return _CFErrorGetDomain(err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNullGetTypeID(void)
{
  return _CFNullGetTypeID();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFTypeID CFSetGetTypeID(void)
{
  return _CFSetGetTypeID();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return _CFStringCreateWithFormatAndArguments(alloc, formatOptions, format, arguments);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFTimeZoneRef CFTimeZoneCreateWithTimeIntervalFromGMT(CFAllocatorRef allocator, CFTimeInterval ti)
{
  return _CFTimeZoneCreateWithTimeIntervalFromGMT(allocator, ti);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return _CFURLCreateCopyAppendingPathComponent(allocator, url, pathComponent, isDirectory);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

void NSLog(NSString *format, ...)
{
}

uint64_t OctagonPlatformSupportsSOS()
{
  return _OctagonPlatformSupportsSOS();
}

uint64_t SOSCCIsSOSTrustAndSyncingEnabledCachedValue()
{
  return _SOSCCIsSOSTrustAndSyncingEnabledCachedValue();
}

uint64_t SOSCCProcessEnsurePeerRegistration()
{
  return _SOSCCProcessEnsurePeerRegistration();
}

uint64_t SOSCCProcessSyncWithAllPeers()
{
  return _SOSCCProcessSyncWithAllPeers();
}

uint64_t SOSCCProcessSyncWithPeers()
{
  return _SOSCCProcessSyncWithPeers();
}

uint64_t SOSCompatibilityModeEnabled()
{
  return _SOSCompatibilityModeEnabled();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

uint64_t _SecKeychainSyncUpdateMessage()
{
  return __SecKeychainSyncUpdateMessage();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __dtoa()
{
  return ___dtoa();
}

uint64_t __freedtoa()
{
  return ___freedtoa();
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t ccder_encode_body()
{
  return _ccder_encode_body();
}

uint64_t ccder_encode_body_nocopy()
{
  return _ccder_encode_body_nocopy();
}

uint64_t ccder_encode_constructed_tl()
{
  return _ccder_encode_constructed_tl();
}

uint64_t ccder_encode_tl()
{
  return _ccder_encode_tl();
}

uint64_t ccder_sizeof()
{
  return _ccder_sizeof();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

uid_t geteuid(void)
{
  return _geteuid();
}

pid_t getpid(void)
{
  return _getpid();
}

uid_t getuid(void)
{
  return _getuid();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return _os_unfair_lock_lock_with_options();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

void syslog(int a1, const char *a2, ...)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_null_create(void)
{
  return _xpc_null_create();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

void xpc_transaction_begin(void)
{
}

void xpc_transaction_end(void)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__onqueueRecheck(void *a1, const char *a2, ...)
{
  return [a1 _onqueueRecheck];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountUUID(void *a1, const char *a2, ...)
{
  return [a1 accountUUID];
}

id objc_msgSend_addOneToOutGoing(void *a1, const char *a2, ...)
{
  return [a1 addOneToOutGoing];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_clearStore(void *a1, const char *a2, ...)
{
  return [a1 clearStore];
}

id objc_msgSend_cloudStore(void *a1, const char *a2, ...)
{
  return [a1 cloudStore];
}

id objc_msgSend_compact(void *a1, const char *a2, ...)
{
  return [a1 compact];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyAllKeyInterests(void *a1, const char *a2, ...)
{
  return [a1 copyAllKeyInterests];
}

id objc_msgSend_copyAsDictionary(void *a1, const char *a2, ...)
{
  return [a1 copyAsDictionary];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_dispatcher(void *a1, const char *a2, ...)
{
  return [a1 dispatcher];
}

id objc_msgSend_doSyncWithPendingPeers(void *a1, const char *a2, ...)
{
  return [a1 doSyncWithPendingPeers];
}

id objc_msgSend_ensurePeerRegistration(void *a1, const char *a2, ...)
{
  return [a1 ensurePeerRegistration];
}

id objc_msgSend_ensurePeerRegistrationEnqueuedButNotStarted(void *a1, const char *a2, ...)
{
  return [a1 ensurePeerRegistrationEnqueuedButNotStarted];
}

id objc_msgSend_forceSynchronizeWithKVS(void *a1, const char *a2, ...)
{
  return [a1 forceSynchronizeWithKVS];
}

id objc_msgSend_freshnessCompletions(void *a1, const char *a2, ...)
{
  return [a1 freshnessCompletions];
}

id objc_msgSend_hasPendingNonShadowSyncIDs(void *a1, const char *a2, ...)
{
  return [a1 hasPendingNonShadowSyncIDs];
}

id objc_msgSend_hasPendingShadowSyncIDs(void *a1, const char *a2, ...)
{
  return [a1 hasPendingShadowSyncIDs];
}

id objc_msgSend_hasPendingSyncIDs(void *a1, const char *a2, ...)
{
  return [a1 hasPendingSyncIDs];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isEmpty(void *a1, const char *a2, ...)
{
  return [a1 isEmpty];
}

id objc_msgSend_keysForCurrentLockState(void *a1, const char *a2, ...)
{
  return [a1 keysForCurrentLockState];
}

id objc_msgSend_kvsInterface(void *a1, const char *a2, ...)
{
  return [a1 kvsInterface];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_listeners(void *a1, const char *a2, ...)
{
  return [a1 listeners];
}

id objc_msgSend_lockMonitor(void *a1, const char *a2, ...)
{
  return [a1 lockMonitor];
}

id objc_msgSend_locked(void *a1, const char *a2, ...)
{
  return [a1 locked];
}

id objc_msgSend_logIDs(void *a1, const char *a2, ...)
{
  return [a1 logIDs];
}

id objc_msgSend_logger(void *a1, const char *a2, ...)
{
  return [a1 logger];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_monitor(void *a1, const char *a2, ...)
{
  return [a1 monitor];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_pendingKeys(void *a1, const char *a2, ...)
{
  return [a1 pendingKeys];
}

id objc_msgSend_pendingKeysForCurrentLockState(void *a1, const char *a2, ...)
{
  return [a1 pendingKeysForCurrentLockState];
}

id objc_msgSend_perfCounters(void *a1, const char *a2, ...)
{
  return [a1 perfCounters];
}

id objc_msgSend_perfQueue(void *a1, const char *a2, ...)
{
  return [a1 perfQueue];
}

id objc_msgSend_persistState(void *a1, const char *a2, ...)
{
  return [a1 persistState];
}

id objc_msgSend_persistenceURL(void *a1, const char *a2, ...)
{
  return [a1 persistenceURL];
}

id objc_msgSend_persistentData(void *a1, const char *a2, ...)
{
  return [a1 persistentData];
}

id objc_msgSend_processPendingKeysForCurrentLockState(void *a1, const char *a2, ...)
{
  return [a1 processPendingKeysForCurrentLockState];
}

id objc_msgSend_proxy(void *a1, const char *a2, ...)
{
  return [a1 proxy];
}

id objc_msgSend_proxyID(void *a1, const char *a2, ...)
{
  return [a1 proxyID];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_readPlist(void *a1, const char *a2, ...)
{
  return [a1 readPlist];
}

id objc_msgSend_recheck(void *a1, const char *a2, ...)
{
  return [a1 recheck];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_requestEnsurePeerRegistration(void *a1, const char *a2, ...)
{
  return [a1 requestEnsurePeerRegistration];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_securitydAccount(void *a1, const char *a2, ...)
{
  return [a1 securitydAccount];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setupSamplers(void *a1, const char *a2, ...)
{
  return [a1 setupSamplers];
}

id objc_msgSend_shadowPendingKeys(void *a1, const char *a2, ...)
{
  return [a1 shadowPendingKeys];
}

id objc_msgSend_sharedObject(void *a1, const char *a2, ...)
{
  return [a1 sharedObject];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_storeAccountChanged(void *a1, const char *a2, ...)
{
  return [a1 storeAccountChanged];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_synchronizeStore(void *a1, const char *a2, ...)
{
  return [a1 synchronizeStore];
}

id objc_msgSend_unlocked(void *a1, const char *a2, ...)
{
  return [a1 unlocked];
}

id objc_msgSend_unlockedSinceBoot(void *a1, const char *a2, ...)
{
  return [a1 unlockedSinceBoot];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_weakObjectsPointerArray(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsPointerArray];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}