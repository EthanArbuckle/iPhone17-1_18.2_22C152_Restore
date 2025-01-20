void sub_10000536C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000539C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) removeSessionWithConnection:WeakRetained];
  __ICOSLogCreate();
  v3 = @"CM";
  if ((unint64_t)[@"CM" length] >= 0x15)
  {
    v4 = objc_msgSend(@"CM", "substringWithRange:", 0, 18);
    v3 = [v4 stringByAppendingString:@".."];
  }
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"xpc-term: [%05d]", [WeakRetained processIdentifier]);
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v3;
    v8 = v6;
    *(_DWORD *)buf = 136446466;
    id v10 = [(__CFString *)v7 UTF8String];
    __int16 v11 = 2114;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
}

void sub_1000069E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000069FC(uint64_t a1)
{
  v2 = [@"/var/mobile/Library/com.apple.imagecapture" stringByAppendingPathComponent:@"externalDeviceAccess.db"];
  v3 = +[NSFileManager defaultManager];
  unsigned __int8 v4 = [v3 fileExistsAtPath:@"/var/mobile/Library/com.apple.imagecapture"];

  if ((v4 & 1) == 0)
  {
    v5 = +[NSFileManager defaultManager];
    uint64_t v11 = 0;
    [v5 createDirectoryAtPath:@"/var/mobile/Library/com.apple.imagecapture" withIntermediateDirectories:0 attributes:0 error:&v11];
  }
  if ([*(id *)(a1 + 32) openDB:v2])
  {
    __ICOSLogCreate();
    v6 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      v7 = objc_msgSend(@"icaccess", "substringWithRange:", 0, 18);
      v6 = [v7 stringByAppendingString:@".."];
    }
    v8 = +[NSString stringWithFormat:@"Failed to open/create database"];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100024DB0();
    }
  }
  else
  {
    errmsg = 0;
    if (!sqlite3_exec((sqlite3 *)[*(id *)(a1 + 32) externalMediaAccessDB], "CREATE TABLE IF NOT EXISTS external_device_access (ID INTEGER PRIMARY KEY AUTOINCREMENT, bundle_id TEXT, date_added INTEGER, read_access INTEGER, write_access INTEGER, control_informed INTEGER)", 0, 0, &errmsg))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      goto LABEL_14;
    }
    __ICOSLogCreate();
    v6 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      v9 = objc_msgSend(@"icaccess", "substringWithRange:", 0, 18);
      v6 = [v9 stringByAppendingString:@".."];
    }
    v8 = +[NSString stringWithFormat:@"Failed to create table: external_device_access - %s", errmsg];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100024DB0();
    }
  }

LABEL_14:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100006DDC(id a1)
{
  qword_1000447C0 = objc_alloc_init(ICDeviceAccessManager);

  _objc_release_x1();
}

void sub_100007EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007ED0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007EE0(uint64_t a1)
{
}

void sub_100007EE8(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  errmsg = 0;
  if (sqlite3_exec((sqlite3 *)[*(id *)(a1 + 32) externalMediaAccessDB], (const char *)objc_msgSend(@"SELECT bundle_id FROM external_device_access;", "UTF8String"),
         (int (__cdecl *)(void *, int, char **, char **))sub_10000803C,
         v2,
         &errmsg))
  {
    __ICOSLogCreate();
    v3 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      unsigned __int8 v4 = objc_msgSend(@"icaccess", "substringWithRange:", 0, 18);
      v3 = [v4 stringByAppendingString:@".."];
    }
    v5 = +[NSString stringWithFormat:@"%s", errmsg];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100024DB0();
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObjectsFromArray:v2];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t sub_10000803C(void *a1, int a2, void *a3)
{
  id v18 = a1;
  if (a2 >= 1)
  {
    uint64_t v5 = a2;
    v6 = (os_log_t *)&_gICOSLog;
    do
    {
      if (*a3)
      {
        v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
        [v18 addObject:v7];
      }
      __ICOSLogCreate();
      v8 = @"adding";
      if ((unint64_t)[@"adding" length] >= 0x15)
      {
        v9 = objc_msgSend(@"adding", "substringWithRange:", 0, 18);
        v8 = [v9 stringByAppendingString:@".."];
      }
      id v10 = +[NSString stringWithFormat:@"%s", *a3];
      os_log_t v11 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v6;
        v13 = v8;
        v14 = v11;
        v15 = v13;
        v6 = v12;
        id v16 = [(__CFString *)v15 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v20 = v16;
        __int16 v21 = 2114;
        v22 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      ++a3;
      --v5;
    }
    while (v5);
  }

  return 0;
}

void sub_1000083CC(uint64_t a1)
{
  id v7 = +[NSDate date];
  uint64_t v2 = *(void *)(a1 + 32);
  [v7 timeIntervalSince1970];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"INSERT INTO external_device_access(bundle_id,date_added,read_access,write_access,control_informed) VALUES ('%@',%lu,%lu,%lu,%lu);",
    v2,
    (unint64_t)v3,
    0,
    0,
  unsigned __int8 v4 = 0);
  uint64_t v5 = (sqlite3 *)[*(id *)(a1 + 40) externalMediaAccessDB];
  id v6 = v4;
  sqlite3_exec(v5, (const char *)[v6 UTF8String], 0, 0, 0);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_1000085C0(uint64_t a1)
{
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"UPDATE external_device_access SET %@ = %lu WHERE bundle_id = '%@';",
    *(void *)(a1 + 32),
    *(void *)(a1 + 64),
  uint64_t v2 = *(void *)(a1 + 40));
  errmsg = 0;
  double v3 = (sqlite3 *)[*(id *)(a1 + 48) externalMediaAccessDB];
  id v4 = v2;
  if (sqlite3_exec(v3, (const char *)[v4 UTF8String], 0, 0, &errmsg))
  {
    __ICOSLogCreate();
    uint64_t v5 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      id v6 = objc_msgSend(@"icaccess", "substringWithRange:", 0, 18);
      uint64_t v5 = [v6 stringByAppendingString:@".."];
    }
    id v7 = +[NSString stringWithFormat:@"%s", errmsg];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100024DB0();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void sub_100008898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000088B0(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT bundle_id, %@ FROM external_device_access;",
    *(void *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)[v3 UTF8String];

  errmsg = 0;
  if (sqlite3_exec((sqlite3 *)[*(id *)(a1 + 40) externalMediaAccessDB], v4, (int (__cdecl *)(void *, int, char **, char **))sub_100008A24, v2, &errmsg))
  {
    __ICOSLogCreate();
    uint64_t v5 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      id v6 = objc_msgSend(@"icaccess", "substringWithRange:", 0, 18);
      uint64_t v5 = [v6 stringByAppendingString:@".."];
    }
    id v7 = +[NSString stringWithFormat:@"%s", errmsg];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100024DB0();
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v2];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

uint64_t sub_100008A24(void *a1, int a2, uint64_t a3, uint64_t a4)
{
  id v13 = a1;
  id v7 = +[NSMutableDictionary dictionary];
  if (a2 >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)(a3 + 8 * v8))
      {
        switch((int)v8)
        {
          case 0:
            v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
            id v10 = +[NSString stringWithFormat:@"%s", *(void *)(a4 + 8 * v8)];
            [v7 setObject:v9 forKeyedSubscript:v10];
            goto LABEL_6;
          case 1:
          case 2:
          case 3:
          case 4:
            v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
            id v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 integerValue]);
            os_log_t v11 = +[NSString stringWithFormat:@"%s", *(void *)(a4 + 8 * v8)];
            [v7 setObject:v10 forKeyedSubscript:v11];

LABEL_6:
            break;
          default:
            break;
        }
      }
      ++v8;
    }
    while (a2 != v8);
  }
  [v13 addObject:v7];

  return 0;
}

void sub_100009000(uint64_t a1)
{
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"DELETE FROM external_device_access WHERE bundle_id IS '%@';",
  id v2 = *(void *)(a1 + 32));
  errmsg = 0;
  id v3 = (sqlite3 *)[*(id *)(a1 + 40) externalMediaAccessDB];
  id v4 = v2;
  if (sqlite3_exec(v3, (const char *)[v4 UTF8String], 0, 0, &errmsg))
  {
    __ICOSLogCreate();
    uint64_t v5 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      id v6 = objc_msgSend(@"icaccess", "substringWithRange:", 0, 18);
      uint64_t v5 = [v6 stringByAppendingString:@".."];
    }
    id v7 = +[NSString stringWithFormat:@"%s", errmsg];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100024DB0();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_100009508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_100009544(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT bundle_id FROM external_device_access WHERE bundle_id IS '%@';",
    *(void *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)[v3 UTF8String];

  errmsg = 0;
  if (sqlite3_exec((sqlite3 *)[*(id *)(a1 + 40) externalMediaAccessDB], v4, (int (__cdecl *)(void *, int, char **, char **))sub_100008A24, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), &errmsg))
  {
    __ICOSLogCreate();
    uint64_t v5 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      id v6 = objc_msgSend(@"icaccess", "substringWithRange:", 0, 18);
      uint64_t v5 = [v6 stringByAppendingString:@".."];
    }
    id v7 = +[NSString stringWithFormat:@"%s", errmsg];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100024DB0();
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v2];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_100009884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10000989C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100009900(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_10000992C()
{
  return [v0 UTF8String];
}

void __ICOSLogCreate()
{
  if (qword_1000447D0 != -1) {
    dispatch_once(&qword_1000447D0, &stru_1000348A0);
  }
}

void sub_10000996C(id a1)
{
  id v6 = +[NSProcessInfo processInfo];
  uint64_t v1 = [v6 processName];
  id v2 = (const char *)[ICLoggingDomain UTF8String];
  id v3 = v1;
  os_log_t v4 = os_log_create(v2, (const char *)[v3 UTF8String]);
  uint64_t v5 = (void *)_gICOSLog;
  _gICOSLog = (uint64_t)v4;
}

uint64_t __ICLogTypeEnabled(uint64_t a1)
{
  return ICLoggingLevel & a1;
}

uint64_t sub_100009A14(void *a1)
{
  uint64_t v1 = [a1 valueForEntitlement:@"com.apple.private.imagecapturecore.authorization_bypass"];
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v1 BOOLValue])
  {
    __ICOSLogCreate();
    id v2 = @"privateBypass";
    if ((unint64_t)[@"privateBypass" length] >= 0x15)
    {
      id v3 = objc_msgSend(@"privateBypass", "substringWithRange:", 0, 18);
      id v2 = [v3 stringByAppendingString:@".."];
    }
    os_log_t v4 = +[NSString stringWithFormat:@"ICAuthorizationBypassEntitlement found"];
    uint64_t v5 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v2;
      id v7 = v5;
      int v10 = 136446466;
      id v11 = [(__CFString *)v6 UTF8String];
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_10000A99C(uint64_t a1)
{
  __ICOSLogCreate();
  id v2 = @"getDeviceList";
  if ((unint64_t)[@"getDeviceList" length] >= 0x15)
  {
    id v3 = objc_msgSend(@"getDeviceList", "substringWithRange:", 0, 18);
    id v2 = [v3 stringByAppendingString:@".."];
  }
  os_log_t v4 = +[NSString stringWithFormat:@"requestDeviceListWithOptions:reply"];
  uint64_t v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v2;
    id v7 = v5;
    *(_DWORD *)buf = 136446466;
    id v22 = [(__CFString *)v6 UTF8String];
    __int16 v23 = 2114;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  uint64_t v8 = +[NSMutableArray array];
  v9 = +[NSMutableDictionary dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v10 = objc_msgSend(*(id *)(a1 + 32), "remoteCameraDevices", 0);
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)v14) deviceContext];
        [v8 addObject:v15];

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  [v9 setObject:v8 forKeyedSubscript:@"ICDeviceContexts"];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000ACC8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteDeviceForUUID:*(void *)(a1 + 40)];
  id v3 = +[NSMutableDictionary dictionary];
  if (!v2) {
    goto LABEL_16;
  }
  os_log_t v4 = [v2 camera];

  if (v4)
  {
    __ICOSLogCreate();
    uint64_t v5 = [*(id *)(a1 + 32) managedObjectName];
    if ((unint64_t)[v5 length] >= 0x15)
    {
      id v6 = objc_msgSend(v5, "substringWithRange:", 0, 18);
      uint64_t v7 = [v6 stringByAppendingString:@".."];

      uint64_t v5 = (void *)v7;
    }
    uint64_t v8 = +[NSString stringWithFormat:@"> Existing Device"];
    v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v5;
      id v11 = v9;
      *(_DWORD *)buf = 136446466;
      id v47 = [v10 UTF8String];
      __int16 v48 = 2114;
      v49 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    id v12 = [v2 uuidString];
    [v3 setObject:v12 forKeyedSubscript:@"ICInternalDeviceUUID"];

    uint64_t v13 = [v2 camera];
    v14 = [v13 endpoint];
    [v3 setObject:v14 forKeyedSubscript:@"ICDeviceEndpoint"];

    v15 = [v2 localizedName];
    [v3 setObject:v15 forKeyedSubscript:@"ICDeviceName"];

    long long v16 = [v2 camera];
    long long v17 = [v16 additionalProperties];

    if (v17)
    {
      long long v18 = [v2 camera];
      long long v19 = [v18 additionalProperties];
      [v3 addEntriesFromDictionary:v19];
    }
    id v20 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_21:
    v20();
    goto LABEL_22;
  }
  __int16 v21 = [*(id *)(a1 + 32) managedObjectName];
  id v22 = objc_alloc(NSClassFromString(v21));
  __int16 v23 = [v2 deviceContext];
  id v24 = [v22 initWithDeviceContext:v23];

  if (!v24)
  {
LABEL_16:
    __ICOSLogCreate();
    v39 = [*(id *)(a1 + 32) managedObjectName];
    if ((unint64_t)[v39 length] >= 0x15)
    {
      v40 = objc_msgSend(v39, "substringWithRange:", 0, 18);
      uint64_t v41 = [v40 stringByAppendingString:@".."];

      v39 = (void *)v41;
    }
    v42 = +[NSString stringWithFormat:@"> Not Found: %@", *(void *)(a1 + 40)];
    v43 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v44 = v39;
      v45 = v43;
      *(_DWORD *)buf = 136446466;
      id v47 = [v44 UTF8String];
      __int16 v48 = 2114;
      v49 = v42;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    id v20 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_21;
  }
  [v24 startListening];
  __ICOSLogCreate();
  v25 = [*(id *)(a1 + 32) managedObjectName];
  if ((unint64_t)[v25 length] >= 0x15)
  {
    v26 = objc_msgSend(v25, "substringWithRange:", 0, 18);
    uint64_t v27 = [v26 stringByAppendingString:@".."];

    v25 = (void *)v27;
  }
  v28 = [v2 localizedName];
  v29 = +[NSString stringWithFormat:@"> New Device: %@", v28];

  v30 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v31 = v25;
    v32 = v30;
    *(_DWORD *)buf = 136446466;
    id v47 = [v31 UTF8String];
    __int16 v48 = 2114;
    v49 = v29;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  [v24 setDelegate:*(void *)(a1 + 32)];
  v33 = [v24 endpoint];
  v34 = [v24 cameraDictionary];
  [v34 setObject:v33 forKeyedSubscript:@"ICDeviceEndpoint"];

  v35 = [v2 uuidString];
  v36 = [v24 cameraDictionary];
  [v36 setObject:v35 forKeyedSubscript:@"ICInternalDeviceUUID"];

  [v2 setCamera:v24];
  uint64_t v37 = *(void *)(a1 + 48);
  v38 = [v24 cameraDictionary];
  (*(void (**)(uint64_t, void *))(v37 + 16))(v37, v38);

LABEL_22:
}

void sub_10000B528(id a1)
{
  id v12 = objc_alloc((Class)NSSet);
  uint64_t v11 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  qword_1000447D8 = (uint64_t)objc_msgSend(v12, "initWithObjects:", v11, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);

  _objc_release_x1();
}

void sub_10000BC8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000BCD0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000BCE0(uint64_t a1)
{
}

void sub_10000BCE8(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v1)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v3 = v1;
    objc_msgSend(v3, "removeRemoteManagerConnectionWithProcessIdentifier:", objc_msgSend(v2, "intValue"));
  }
}

void sub_10000CBFC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cameraDictionary];
  id v3 = [v2 objectForKeyedSubscript:@"ICDeviceStarted"];

  if (v3) {
    goto LABEL_22;
  }
  uint64_t v4 = [*(id *)(a1 + 32) url];
  uint64_t v5 = [v4 path];

  [*(id *)(a1 + 32) setPreflightCount:0];
  id v49 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:@"/System/Library/Frameworks/ImageCaptureCore.framework/DeviceMatchingInfo.plist"];
  id v50 = 0;
  int v6 = sub_100022358(v5, &v50, v49);
  id v7 = v50;
  if (v6)
  {
    uint64_t v8 = [*(id *)(a1 + 32) mediaPaths];
    [v8 addObjectsFromArray:v7];

    __ICOSLogCreate();
    uint64_t v9 = @"Volume";
    if ((unint64_t)[@"Volume" length] >= 0x15)
    {
      uint64_t v10 = objc_msgSend(@"Volume", "substringWithRange:", 0, 18);
      uint64_t v9 = [v10 stringByAppendingString:@".."];
    }
    uint64_t v11 = +[NSString stringWithFormat:@"❎ Added: %@", v7];
    id v12 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
  }
  else
  {
    __ICOSLogCreate();
    uint64_t v9 = @"Volume";
    if ((unint64_t)[@"Volume" length] >= 0x15)
    {
      uint64_t v13 = objc_msgSend(@"Volume", "substringWithRange:", 0, 18);
      uint64_t v9 = [v13 stringByAppendingString:@".."];
    }
    uint64_t v11 = +[NSString stringWithFormat:@"⚠️ No camera created media paths: %@", v5];
    id v12 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
  }
  uint64_t v9 = v9;
  v14 = v12;
  id v15 = [(__CFString *)v9 UTF8String];
  buf.f_bsize = 136446466;
  *(void *)&buf.f_iosize = v15;
  WORD2(buf.f_blocks) = 2114;
  *(uint64_t *)((char *)&buf.f_blocks + 6) = (uint64_t)v11;
  _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&buf, 0x16u);

LABEL_11:
  __ICOSLogCreate();
  long long v16 = @"session";
  if ((unint64_t)[@"session" length] >= 0x15)
  {
    long long v17 = objc_msgSend(@"session", "substringWithRange:", 0, 18);
    long long v16 = [v17 stringByAppendingString:@".."];
  }
  long long v18 = [*(id *)(a1 + 32) cameraDictionary];
  long long v19 = +[NSString stringWithFormat:@"MSCameraDevice Properties: %@", v18];

  id v20 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v21 = v16;
    id v22 = v20;
    id v23 = [(__CFString *)v21 UTF8String];
    buf.f_bsize = 136446466;
    *(void *)&buf.f_iosize = v23;
    WORD2(buf.f_blocks) = 2114;
    *(uint64_t *)((char *)&buf.f_blocks + 6) = (uint64_t)v19;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&buf, 0x16u);
  }
  memset(&buf, 0, 512);
  id v24 = v5;
  statfs((const char *)[v24 fileSystemRepresentation], &buf);
  __ICOSLogCreate();
  v25 = @"fsInfo";
  if ((unint64_t)[@"fsInfo" length] >= 0x15)
  {
    v26 = objc_msgSend(@"fsInfo", "substringWithRange:", 0, 18);
    v25 = [v26 stringByAppendingString:@".."];
  }
  uint64_t v27 = +[NSString stringWithFormat:@"flags: %d, typename: %s, mntonname: %s, mntfromname: %s", buf.f_flags, buf.f_fstypename, buf.f_mntonname, buf.f_mntfromname];
  v28 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v29 = v25;
    v30 = v28;
    id v31 = [(__CFString *)v29 UTF8String];
    *(_DWORD *)v51 = 136446466;
    id v52 = v31;
    __int16 v53 = 2114;
    v54 = v27;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", v51, 0x16u);
  }
  char f_flags = buf.f_flags;
  uint64_t v33 = buf.f_flags & 1;
  v34 = +[NSNumber numberWithBool:0];
  v35 = [*(id *)(a1 + 32) cameraDictionary];
  [v35 setObject:v34 forKeyedSubscript:@"ICDeviceEjectable"];

  v36 = [*(id *)(a1 + 32) cameraDictionary];
  [v36 setObject:@"ICTransportTypeMassStorage" forKeyedSubscript:@"ICDeviceTransportType"];

  uint64_t v37 = +[NSNumber numberWithBool:v33];
  v38 = [*(id *)(a1 + 32) cameraDictionary];
  [v38 setObject:v37 forKeyedSubscript:@"ICDeviceLocked"];

  v39 = [*(id *)(a1 + 32) cameraDictionary];
  [v39 setObject:v24 forKeyedSubscript:@"ICDeviceVolumePath"];

  v40 = [*(id *)(a1 + 32) cameraDictionary];
  [v40 setObject:@"sdcard" forKeyedSubscript:@"ICDeviceSystemSymbolName"];

  uint64_t v41 = [*(id *)(a1 + 32) cameraDictionary];
  [v41 setObject:@"Camera" forKeyedSubscript:@"ICDeviceType"];

  v42 = [*(id *)(a1 + 32) cameraDictionary];
  [v42 setObject:@"Camera" forKeyedSubscript:@"ICDeviceProductKind"];

  v43 = [*(id *)(a1 + 32) cameraDictionary];
  [v43 setObject:&__kCFBooleanTrue forKeyedSubscript:@"ICDeviceStarted"];

  id v44 = +[NSMutableArray array];
  v45 = v44;
  if ((f_flags & 1) == 0) {
    [v44 addObject:@"ICCameraDeviceCanDeleteOneFile"];
  }
  v46 = [*(id *)(a1 + 32) cameraDictionary];
  [v46 setObject:v45 forKeyedSubscript:@"ICDeviceCapabilities"];

LABEL_22:
  uint64_t v47 = *(void *)(a1 + 40);
  __int16 v48 = [*(id *)(a1 + 32) cameraDictionary];
  (*(void (**)(uint64_t, void *))(v47 + 16))(v47, v48);
}

void sub_10000D448(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "cameraItemWithObjectID:", objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"));
  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    id v3 = [v2 name];
    if ((unint64_t)[v3 length] >= 0x15)
    {
      uint64_t v4 = objc_msgSend(v3, "substringWithRange:", 0, 18);
      uint64_t v5 = [v4 stringByAppendingString:@".."];

      id v3 = (void *)v5;
    }
    int v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"requestMetadataForObjectHandle: %d", [*(id *)(a1 + 40) intValue]);
    id v7 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v3;
      uint64_t v9 = v7;
      *(_DWORD *)statfs buf = 136446466;
      id v13 = [v8 UTF8String];
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  if (v2)
  {
    [v2 metadataWithOptions:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v10 = +[NSMutableDictionary dictionary];
    uint64_t v11 = +[NSNumber numberWithInteger:-21450];
    [v10 setObject:v11 forKeyedSubscript:@"errCode"];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_10000D758(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "cameraItemWithObjectID:", objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"));
  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    id v3 = [v2 name];
    if ((unint64_t)[v3 length] >= 0x15)
    {
      uint64_t v4 = objc_msgSend(v3, "substringWithRange:", 0, 18);
      uint64_t v5 = [v4 stringByAppendingString:@".."];

      id v3 = (void *)v5;
    }
    int v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"requestThumbnailDataForObjectHandle: %d", [*(id *)(a1 + 40) intValue]);
    id v7 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v3;
      uint64_t v9 = v7;
      *(_DWORD *)statfs buf = 136446466;
      id v13 = [v8 UTF8String];
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  if (v2)
  {
    [v2 thumbnailDataWithOptions:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v10 = +[NSMutableDictionary dictionary];
    uint64_t v11 = +[NSNumber numberWithInteger:-21450];
    [v10 setObject:v11 forKeyedSubscript:@"errCode"];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_10000DA3C(uint64_t a1)
{
  id v3 = +[NSMutableDictionary dictionary];
  [v3 addEntriesFromDictionary:*(void *)(a1 + 32)];
  uint64_t v2 = +[NSNumber numberWithInteger:-9934];
  [v3 setObject:v2 forKeyedSubscript:@"errCode"];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000DBE0(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "cameraItemWithObjectID:", objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"));
  id v5 = v2;
  if (v2)
  {
    [v2 readDataWithOptions:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
  }
  else
  {
    id v3 = +[NSMutableDictionary dictionary];
    uint64_t v4 = +[NSNumber numberWithInteger:-21450];
    [v3 setObject:v4 forKeyedSubscript:@"errCode"];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_10000DDE0(uint64_t a1)
{
  [*(id *)(a1 + 32) holdPowerAssertion];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "cameraItemWithObjectID:", objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"));
  __ICOSLogCreate();
  id v3 = @"delete";
  if ((unint64_t)[@"delete" length] >= 0x15)
  {
    uint64_t v4 = objc_msgSend(@"delete", "substringWithRange:", 0, 18);
    id v3 = [v4 stringByAppendingString:@".."];
  }
  id v5 = [v2 name];
  int v6 = +[NSString stringWithFormat:@"MSCamera - %@", v5];

  id v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v3;
    uint64_t v9 = v7;
    *(_DWORD *)statfs buf = 136446466;
    id v28 = [(__CFString *)v8 UTF8String];
    __int16 v29 = 2114;
    v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  if (v2)
  {
    unsigned int v10 = [*(id *)(a1 + 32) deleteFile:v2];
    if (v10) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = -9941;
    }
    id v12 = +[NSMutableDictionary dictionary];
    [v12 addEntriesFromDictionary:*(void *)(a1 + 48)];
    id v13 = +[NSNumber numberWithInteger:v11];
    [v12 setObject:v13 forKeyedSubscript:@"errCode"];

    __ICOSLogCreate();
    __int16 v14 = @"delete";
    if ((unint64_t)[@"delete" length] >= 0x15)
    {
      id v15 = objc_msgSend(@"delete", "substringWithRange:", 0, 18);
      __int16 v14 = [v15 stringByAppendingString:@".."];
    }
    long long v16 = +[NSString stringWithFormat:@"MSCamera reply - %@", v12];
    long long v17 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      long long v18 = v14;
      long long v19 = v17;
      id v20 = [(__CFString *)v18 UTF8String];
      *(_DWORD *)statfs buf = 136446466;
      id v28 = v20;
      __int16 v29 = 2114;
      v30 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    if (v10)
    {
      __int16 v21 = *(void **)(a1 + 32);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10000E1F4;
      v24[3] = &unk_100034808;
      v24[4] = v21;
      id v25 = *(id *)(a1 + 56);
      id v26 = *(id *)(a1 + 40);
      id v22 = +[NSBlockOperation blockOperationWithBlock:v24];
      [v21 addInteractiveOperation:v22];
    }
  }
  else
  {
    id v12 = +[NSMutableDictionary dictionary];
    id v23 = +[NSNumber numberWithInteger:-21450];
    [v12 setObject:v23 forKeyedSubscript:@"errCode"];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }

  [*(id *)(a1 + 32) releasePowerAssertion];
}

void sub_10000E1F4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) allConnections];
  id v3 = [v2 mutableCopy];

  if (v3)
  {
    [v3 removeObject:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(a1 + 48);
    CFStringRef v7 = @"ICObjectIDArray";
    uint64_t v4 = +[NSArray arrayWithObjects:&v6 count:1];
    id v8 = v4;
    id v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

    [*(id *)(a1 + 32) sendRemovedItemsNotification:v5 toConnections:v3];
  }
}

void sub_10000E3FC(uint64_t a1)
{
  [*(id *)(a1 + 32) holdPowerAssertion];
  uint64_t v2 = +[NSMutableDictionary dictionary];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "cameraItemWithObjectID:", objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"));
  __ICOSLogCreate();
  uint64_t v4 = @"scopedURL";
  if ((unint64_t)[@"scopedURL" length] >= 0x15)
  {
    id v5 = objc_msgSend(@"scopedURL", "substringWithRange:", 0, 18);
    uint64_t v4 = [v5 stringByAppendingString:@".."];
  }
  uint64_t v6 = [v3 name];
  CFStringRef v7 = +[NSString stringWithFormat:@"MSCamera - %@", v6];

  id v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v4;
    unsigned int v10 = v8;
    *(_DWORD *)statfs buf = 136446466;
    *(void *)&uint8_t buf[4] = [(__CFString *)v9 UTF8String];
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  memset(buf, 0, 32);
  uint64_t v11 = *(void **)(a1 + 48);
  if (v11) {
    [v11 auditToken];
  }
  id v12 = [v3 path];
  [v12 UTF8String];
  long long v25 = *(_OWORD *)buf;
  long long v26 = *(_OWORD *)&buf[16];
  id v13 = (const char *)sandbox_extension_issue_file_to_process();

  if (v13)
  {
    __int16 v14 = [v3 path];
    id v15 = +[NSURL fileURLWithPath:v14];

    size_t v16 = strlen(v13);
    CFDataRef v17 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v13, v16 + 1);
    _CFURLAttachSecurityScopeToFileURL();
    id v18 = [objc_alloc((Class)NSSecurityScopedURLWrapper) initWithURL:v15 readonly:1 scope:v17];
    [v2 setObject:v18 forKeyedSubscript:@"ICSecurityScopedWrappedURL"];
    CFRelease(v17);
    uint64_t v19 = 0;
  }
  else
  {
    __ICOSLogCreate();
    id v15 = @"scopedURL";
    if ((unint64_t)[@"scopedURL" length] >= 0x15)
    {
      id v20 = objc_msgSend(@"scopedURL", "substringWithRange:", 0, 18);
      id v15 = [v20 stringByAppendingString:@".."];
    }
    uint64_t v21 = *(void *)(a1 + 32);
    id v22 = __error();
    id v18 = +[NSString stringWithFormat:@"Could not create sandbox read extension for file URL %@, error: %s", v21, strerror(*v22), v25, v26];
    id v23 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100024E40(v15, v23);
    }
    uint64_t v19 = -21450;
  }

  id v24 = +[NSNumber numberWithInteger:v19];
  [v2 setObject:v24 forKeyedSubscript:@"errCode"];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 32) releasePowerAssertion];
}

void sub_10000E8AC(uint64_t a1)
{
  [*(id *)(a1 + 32) holdPowerAssertion];
  uint64_t v2 = +[NSMutableDictionary dictionary];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "cameraItemWithObjectID:", objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"));
  id v8 = 0;
  uint64_t v4 = [v3 fingerprintWithError:&v8];
  id v5 = v8;
  if (v4) {
    [v2 setObject:v4 forKeyedSubscript:@"ICCameraFileFingerprint"];
  }
  if (v5) {
    id v6 = [v5 code];
  }
  else {
    id v6 = 0;
  }
  CFStringRef v7 = +[NSNumber numberWithInteger:v6];
  [v2 setObject:v7 forKeyedSubscript:@"errCode"];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) releasePowerAssertion];
}

void sub_10000EAA4(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "cameraItemWithObjectID:", objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"));
  id v3 = +[NSMutableDictionary dictionary];
  if (v2)
  {
    uint64_t v4 = +[NSMutableDictionary dictionary];
    id v5 = [v2 refreshInfo:v4];
    if ([v4 count])
    {
      uint64_t v9 = *(void *)(a1 + 40);
      unsigned int v10 = v4;
      id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      [v3 setObject:v6 forKeyedSubscript:@"ICObjectInfoUpdate"];

      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = -9922;
    }
  }
  else
  {
    uint64_t v7 = -9922;
  }
  id v8 = +[NSNumber numberWithInteger:v7];
  [v3 setObject:v8 forKeyedSubscript:@"errCode"];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000F040(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) indexedFolders];
  __ICOSLogCreate();
  uint64_t v2 = @"FolderCount";
  if ((unint64_t)[@"FolderCount" length] >= 0x15)
  {
    id v3 = objc_msgSend(@"FolderCount", "substringWithRange:", 0, 18);
    uint64_t v2 = [v3 stringByAppendingString:@".."];
  }
  uint64_t v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v1 count]);
  id v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v2;
    uint64_t v7 = v5;
    id v8 = [(__CFString *)v6 UTF8String];
    *(_DWORD *)statfs buf = 136446466;
    id v72 = v8;
    __int16 v73 = 2114;
    v74 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  if (v1)
  {
    id v9 = objc_alloc_init((Class)NSMutableArray);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    unsigned int v10 = v1;
    id v11 = v1;
    id v12 = [v11 countByEnumeratingWithState:&v58 objects:v70 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v59;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v59 != v14) {
            objc_enumerationMutation(v11);
          }
          size_t v16 = [*(id *)(*((void *)&v58 + 1) + 8 * i) info];
          CFDataRef v17 = [v16 content];
          [v9 addObject:v17];
        }
        id v13 = [v11 countByEnumeratingWithState:&v58 objects:v70 count:16];
      }
      while (v13);
    }

    CFStringRef v68 = @"ICMSObjectInfoArray";
    id v69 = v9;
    id v18 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
    uint64_t v19 = *(void **)(a1 + 32);
    uint64_t v67 = *(void *)(a1 + 40);
    id v20 = +[NSArray arrayWithObjects:&v67 count:1];
    [v19 sendAddedItemsNotification:v18 toConnections:v20];

    uint64_t v1 = v10;
  }
  uint64_t v21 = [*(id *)(a1 + 32) indexedFiles];
  __ICOSLogCreate();
  id v22 = @"FileCount";
  if ((unint64_t)[@"FileCount" length] >= 0x15)
  {
    id v23 = objc_msgSend(@"FileCount", "substringWithRange:", 0, 18);
    id v22 = [v23 stringByAppendingString:@".."];
  }
  id v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v21 count]);
  long long v25 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    long long v26 = v22;
    uint64_t v27 = v25;
    id v28 = [(__CFString *)v26 UTF8String];
    *(_DWORD *)statfs buf = 136446466;
    id v72 = v28;
    __int16 v73 = 2114;
    v74 = v24;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  if (v21)
  {
    v45 = v21;
    v46 = v1;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v29 = [v21 copyGroupIntoDictionary:&stru_100034A28];
    id v49 = [v29 countByEnumeratingWithState:&v54 objects:v66 count:16];
    if (v49)
    {
      uint64_t v47 = *(void *)v55;
      do
      {
        for (j = 0; j != v49; j = (char *)j + 1)
        {
          if (*(void *)v55 != v47) {
            objc_enumerationMutation(v29);
          }
          uint64_t v31 = *(void *)(*((void *)&v54 + 1) + 8 * (void)j);
          id v32 = objc_alloc_init((Class)NSMutableArray);
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          uint64_t v33 = [v29 objectForKeyedSubscript:v31];
          id v34 = [v33 countByEnumeratingWithState:&v50 objects:v65 count:16];
          if (v34)
          {
            id v35 = v34;
            uint64_t v36 = *(void *)v51;
            do
            {
              for (k = 0; k != v35; k = (char *)k + 1)
              {
                if (*(void *)v51 != v36) {
                  objc_enumerationMutation(v33);
                }
                v38 = *(void **)(*((void *)&v50 + 1) + 8 * (void)k);
                v40 = [v38 info];
                uint64_t v41 = [v40 content];
                [v32 addObject:v41];
              }
              id v35 = [v33 countByEnumeratingWithState:&v50 objects:v65 count:16];
            }
            while (v35);
          }

          CFStringRef v63 = @"ICMSObjectInfoArray";
          id v64 = v32;
          v42 = +[NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
          v43 = *(void **)(a1 + 32);
          uint64_t v62 = *(void *)(a1 + 40);
          id v44 = +[NSArray arrayWithObjects:&v62 count:1];
          [v43 sendAddedItemsNotification:v42 toConnections:v44];
        }
        id v49 = [v29 countByEnumeratingWithState:&v54 objects:v66 count:16];
      }
      while (v49);
    }

    uint64_t v21 = v45;
    uint64_t v1 = v46;
  }
}

NSCopying *__cdecl sub_10000F61C(id a1, MSCameraItem *a2)
{
  return (NSCopying *)[(MSCameraItem *)a2 valueForKey:@"baseName"];
}

void sub_100010B68(uint64_t a1)
{
  v92 = +[NSMutableArray array];
  uint64_t v2 = [*(id *)(a1 + 32) cameraDictionary];
  uint64_t v107 = a1;
  if (!v2) {
    goto LABEL_12;
  }
  id v3 = (void *)v2;
  uint64_t v4 = [*(id *)(a1 + 32) cameraDictionary];
  id v5 = [v4 objectForKeyedSubscript:@"ICDeviceVolumePath"];

  if (!v5) {
    goto LABEL_12;
  }
  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  id obj = [*(id *)(a1 + 32) mediaPaths];
  id v6 = [obj countByEnumeratingWithState:&v138 objects:v155 count:16];
  if (!v6)
  {
LABEL_11:

LABEL_12:
    id obj = [*(id *)(a1 + 32) copyIndexedFoldersAndFilesURLs];
    id v20 = +[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:");
    v90 = +[NSMutableSet setWithArray:v92];
    objc_msgSend(v20, "minusSet:");
    uint64_t v21 = +[NSMutableArray array];
    long long v133 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    id v101 = v20;
    id v22 = [v101 countByEnumeratingWithState:&v133 objects:v154 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v134;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v134 != v24) {
            objc_enumerationMutation(v101);
          }
          long long v26 = objc_getAssociatedObject(*(id *)(*((void *)&v133 + 1) + 8 * i), "ICObjectHandle");
          objc_msgSend(*(id *)(a1 + 32), "removeCameraItemFromIndex:", (int)objc_msgSend(v26, "intValue"));
          [v21 addObject:v26];
        }
        id v23 = [v101 countByEnumeratingWithState:&v133 objects:v154 count:16];
      }
      while (v23);
    }

    if ([v21 count])
    {
      uint64_t v27 = *(void **)(a1 + 32);
      v130[0] = _NSConcreteStackBlock;
      v130[1] = 3221225472;
      v130[2] = sub_1000116A0;
      v130[3] = &unk_100034A50;
      id v28 = v21;
      uint64_t v29 = *(void *)(a1 + 32);
      id v131 = v28;
      uint64_t v132 = v29;
      v30 = +[NSBlockOperation blockOperationWithBlock:v130];
      [v27 addInteractiveOperation:v30];
    }
    v88 = +[NSMutableSet setWithArray:obj];
    objc_msgSend(v90, "minusSet:");
    uint64_t v31 = [v90 allObjects];
    __ICOSLogCreate();
    id v32 = @"MSCamera";
    if ((unint64_t)[@"MSCamera" length] >= 0x15)
    {
      uint64_t v33 = objc_msgSend(@"MSCamera", "substringWithRange:", 0, 18);
      id v32 = [v33 stringByAppendingString:@".."];
    }
    id v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%5lu] Added, [%5lu] Removed", [v31 count], objc_msgSend(v21, "count"));
    id v35 = (void *)_gICOSLog;
    v89 = v31;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = v32;
      uint64_t v37 = v35;
      id v38 = [(__CFString *)v36 UTF8String];
      *(_DWORD *)statfs buf = 136446466;
      id v151 = v38;
      __int16 v152 = 2114;
      v153 = v34;
      uint64_t v31 = v89;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    if ([v31 count])
    {
      v96 = [*(id *)(a1 + 32) indexedFolders];
      v39 = +[NSMutableArray array];
      v104 = +[NSMutableArray array];
      long long v126 = 0u;
      long long v127 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      id v40 = v31;
      id v41 = [v40 countByEnumeratingWithState:&v126 objects:v149 count:16];
      v100 = v21;
      if (v41)
      {
        id v42 = v41;
        uint64_t v43 = *(void *)v127;
        NSURLResourceKey v44 = NSURLIsDirectoryKey;
        id v94 = v40;
        v95 = v39;
        uint64_t v93 = *(void *)v127;
        do
        {
          v45 = 0;
          id v97 = v42;
          do
          {
            if (*(void *)v127 != v43) {
              objc_enumerationMutation(v40);
            }
            v46 = *(void **)(*((void *)&v126 + 1) + 8 * (void)v45);
            id v125 = 0;
            unsigned int v47 = [v46 getResourceValue:&v125 forKey:v44 error:0];
            id v102 = v125;
            if (v47 && [v102 BOOLValue])
            {
              v98 = v45;
              __int16 v48 = [v46 path];
              id v49 = [v48 stringByDeletingLastPathComponent];

              long long v123 = 0u;
              long long v124 = 0u;
              long long v121 = 0u;
              long long v122 = 0u;
              id v105 = v96;
              id v50 = [v105 countByEnumeratingWithState:&v121 objects:v148 count:16];
              if (v50)
              {
                id v51 = v50;
                uint64_t v52 = *(void *)v122;
                do
                {
                  for (j = 0; j != v51; j = (char *)j + 1)
                  {
                    if (*(void *)v122 != v52) {
                      objc_enumerationMutation(v105);
                    }
                    long long v54 = *(void **)(*((void *)&v121 + 1) + 8 * (void)j);
                    long long v55 = [v54 path];
                    unsigned int v56 = [v49 hasSuffix:v55];

                    if (v56)
                    {
                      long long v57 = [MSCameraFolder alloc];
                      long long v58 = [v46 path];
                      long long v59 = [v58 lastPathComponent];
                      long long v60 = [(MSCameraFolder *)v57 initWithFSURL:v46 name:v59 parent:v54 device:*(void *)(a1 + 32)];

                      if (v60)
                      {
                        [*(id *)(a1 + 32) addCameraFolderToIndex:v60];
                        CFStringRef v146 = @"ICMSObjectInfoArray";
                        long long v61 = [(MSCameraItem *)v60 info];
                        uint64_t v62 = [v61 content];
                        v145 = v62;
                        CFStringRef v63 = +[NSArray arrayWithObjects:&v145 count:1];
                        v147 = v63;
                        id v64 = +[NSDictionary dictionaryWithObjects:&v147 forKeys:&v146 count:1];

                        v65 = *(void **)(v107 + 32);
                        v66 = [v65 allConnections];
                        [v65 sendAddedItemsNotification:v64 toConnections:v66];

                        [(MSCameraFolder *)v60 enumerateContentWithOptions:0];
                        uint64_t v67 = [(MSCameraItem *)v60 path];
                        [v104 addObject:v67];

                        a1 = v107;
                      }
                    }
                  }
                  id v51 = [v105 countByEnumeratingWithState:&v121 objects:v148 count:16];
                }
                while (v51);
              }

              v45 = v98;
              uint64_t v21 = v100;
              id v40 = v94;
              v39 = v95;
              NSURLResourceKey v44 = NSURLIsDirectoryKey;
              uint64_t v43 = v93;
              id v42 = v97;
            }
            else
            {
              [v39 addObject:v46];
            }

            v45 = (char *)v45 + 1;
          }
          while (v45 != v42);
          id v42 = [v40 countByEnumeratingWithState:&v126 objects:v149 count:16];
        }
        while (v42);
      }

      v99 = [*(id *)(a1 + 32) indexedFolders];

      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      id v103 = v39;
      id v108 = [v103 countByEnumeratingWithState:&v117 objects:v144 count:16];
      if (v108)
      {
        id v106 = *(id *)v118;
        do
        {
          for (k = 0; k != v108; k = (char *)k + 1)
          {
            if (*(id *)v118 != v106) {
              objc_enumerationMutation(v103);
            }
            id v69 = *(void **)(*((void *)&v117 + 1) + 8 * (void)k);
            long long v113 = 0u;
            long long v114 = 0u;
            long long v115 = 0u;
            long long v116 = 0u;
            id v70 = v104;
            id v71 = [v70 countByEnumeratingWithState:&v113 objects:v143 count:16];
            if (v71)
            {
              id v72 = v71;
              uint64_t v73 = *(void *)v114;
LABEL_55:
              uint64_t v74 = 0;
              while (1)
              {
                if (*(void *)v114 != v73) {
                  objc_enumerationMutation(v70);
                }
                uint64_t v75 = *(void *)(*((void *)&v113 + 1) + 8 * v74);
                v76 = [v69 path];
                v77 = [v76 stringByDeletingLastPathComponent];
                LOBYTE(v75) = [v77 isEqualToString:v75];

                if (v75) {
                  break;
                }
                if (v72 == (id)++v74)
                {
                  id v72 = [v70 countByEnumeratingWithState:&v113 objects:v143 count:16];
                  if (v72) {
                    goto LABEL_55;
                  }
                  goto LABEL_61;
                }
              }
            }
            else
            {
LABEL_61:

              v78 = [v69 path];
              id v70 = [v78 stringByDeletingLastPathComponent];

              long long v111 = 0u;
              long long v112 = 0u;
              long long v109 = 0u;
              long long v110 = 0u;
              id v79 = v99;
              id v80 = [v79 countByEnumeratingWithState:&v109 objects:v142 count:16];
              if (v80)
              {
                id v81 = v80;
                uint64_t v82 = *(void *)v110;
                do
                {
                  for (m = 0; m != v81; m = (char *)m + 1)
                  {
                    if (*(void *)v110 != v82) {
                      objc_enumerationMutation(v79);
                    }
                    v84 = *(void **)(*((void *)&v109 + 1) + 8 * (void)m);
                    v85 = [v84 path];
                    unsigned int v86 = [v70 isEqualToString:v85];

                    if (v86) {
                      id v87 = [v84 createAssetFromURL:v69 notify:1 preflight:0];
                    }
                  }
                  id v81 = [v79 countByEnumeratingWithState:&v109 objects:v142 count:16];
                }
                while (v81);
              }

              uint64_t v21 = v100;
            }
          }
          id v108 = [v103 countByEnumeratingWithState:&v117 objects:v144 count:16];
        }
        while (v108);
      }

      uint64_t v31 = v89;
    }

    goto LABEL_75;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v139;
LABEL_5:
  id v9 = 0;
  while (1)
  {
    if (*(void *)v139 != v8) {
      objc_enumerationMutation(obj);
    }
    uint64_t v10 = *(void *)(*((void *)&v138 + 1) + 8 * (void)v9);
    id v11 = [*(id *)(a1 + 32) cameraDictionary];
    id v12 = [v11 objectForKeyedSubscript:@"ICDeviceVolumePath"];

    id v13 = [v12 stringByAppendingPathComponent:v10];
    uint64_t v14 = +[NSURL fileURLWithPath:v13];

    [v92 addObject:v14];
    id v15 = *(void **)(a1 + 32);
    id v16 = [v12 stringByAppendingPathComponent:v10];
    id v17 = [v16 fileSystemRepresentation];
    uint64_t v137 = 0;
    id v18 = [v15 reflight:v17 error:&v137];
    uint64_t v19 = v137;
    [v92 addObjectsFromArray:v18];

    if (v19) {
      break;
    }
    id v9 = (char *)v9 + 1;
    a1 = v107;
    if (v7 == v9)
    {
      id v7 = [obj countByEnumeratingWithState:&v138 objects:v155 count:16];
      if (v7) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
LABEL_75:
}

void sub_1000116A0(uint64_t a1)
{
  __ICOSLogCreate();
  uint64_t v2 = @"removing";
  if ((unint64_t)[@"removing" length] >= 0x15)
  {
    id v3 = objc_msgSend(@"removing", "substringWithRange:", 0, 18);
    uint64_t v2 = [v3 stringByAppendingString:@".."];
  }
  uint64_t v4 = +[NSString stringWithFormat:@"--> Removed %@", *(void *)(a1 + 32)];
  id v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v2;
    id v7 = v5;
    *(_DWORD *)statfs buf = 136446466;
    id v15 = [(__CFString *)v6 UTF8String];
    __int16 v16 = 2114;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  CFStringRef v12 = @"ICObjectIDArray";
  uint64_t v13 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  uint64_t v10 = *(void **)(a1 + 40);
  id v11 = [v10 allConnections];
  [v10 sendRemovedItemsNotification:v9 toConnections:v11];
}

void sub_100011CFC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) reflightPauseSource];

  if (v2)
  {
    __ICOSLogCreate();
    id v3 = [*(id *)(a1 + 32) name];
    if ((unint64_t)[v3 length] >= 0x15)
    {
      uint64_t v4 = objc_msgSend(v3, "substringWithRange:", 0, 18);
      uint64_t v5 = [v4 stringByAppendingString:@".."];

      id v3 = (void *)v5;
    }
    id v6 = +[NSString stringWithFormat:@"Reflight Timer - Existing & Boosted"];
    id v7 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v3;
      id v9 = v7;
      *(_DWORD *)statfs buf = 136446466;
      *(void *)&uint8_t buf[4] = [v8 UTF8String];
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    uint64_t v10 = [*(id *)(a1 + 32) reflightPauseSource];
    dispatch_time_t v11 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  }
  else
  {
    CFStringRef v12 = [*(id *)(a1 + 32) deviceOperationQueue];
    uint64_t v13 = [v12 underlyingQueue];
    dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v13);
    [*(id *)(a1 + 32) setReflightPauseSource:v14];

    id v15 = [*(id *)(a1 + 32) reflightPauseSource];
    dispatch_time_t v16 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);

    *(void *)statfs buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v31 = sub_100012130;
    id v32 = sub_100012140;
    id v33 = *(id *)(a1 + 32);
    id v17 = [*(id *)(a1 + 32) reflightPauseSource];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100012148;
    handler[3] = &unk_100034AA0;
    handler[4] = buf;
    dispatch_source_set_event_handler(v17, handler);

    id v18 = [*(id *)(a1 + 32) reflightPauseSource];
    dispatch_resume(v18);

    __ICOSLogCreate();
    uint64_t v19 = [*(id *)(a1 + 32) name];
    if ((unint64_t)[v19 length] >= 0x15)
    {
      id v20 = objc_msgSend(v19, "substringWithRange:", 0, 18);
      uint64_t v21 = [v20 stringByAppendingString:@".."];

      uint64_t v19 = (void *)v21;
    }
    id v22 = +[NSString stringWithFormat:@"Reflight Timer - Created & Resumed"];
    id v23 = (id)_gICOSLog;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = [v19 UTF8String];
      *(_DWORD *)long long v26 = 136446466;
      id v27 = v24;
      __int16 v28 = 2114;
      uint64_t v29 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", v26, 0x16u);
    }

    _Block_object_dispose(buf, 8);
  }
}

void sub_100012104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012130(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100012140(uint64_t a1)
{
}

void sub_100012148(uint64_t a1)
{
  id v1 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = [v1 reflightPauseSource];

    if (v3)
    {
      uint64_t v4 = [v2 reflightPauseSource];
      dispatch_source_cancel(v4);

      [v2 setReflightPauseSource:0];
      __ICOSLogCreate();
      uint64_t v5 = [v2 name];
      if ((unint64_t)[v5 length] >= 0x15)
      {
        id v6 = objc_msgSend(v5, "substringWithRange:", 0, 18);
        uint64_t v7 = [v6 stringByAppendingString:@".."];

        uint64_t v5 = (void *)v7;
      }
      id v8 = +[NSString stringWithFormat:@"Reflight Timer - Unpaused & Destroyed"];
      id v9 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = v5;
        dispatch_time_t v11 = v9;
        int v12 = 136446466;
        id v13 = [v10 UTF8String];
        __int16 v14 = 2114;
        id v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v12, 0x16u);
      }
    }
  }
}

BOOL sub_100012F74(unsigned char *a1, uint64_t a2, int a3)
{
  BOOL v3 = 0;
  if (a1 && a2)
  {
    if (*a1)
    {
      if (qword_1000447F8 != -1) {
        dispatch_once(&qword_1000447F8, &stru_100034AC0);
      }
      if (qword_100044800 != -1) {
        dispatch_once(&qword_100044800, &stru_100034AE0);
      }
      id v6 = &qword_1000447F0;
      if (!a3) {
        id v6 = &qword_1000447E8;
      }
      id v7 = (id)*v6;
      id v8 = +[NSString stringWithUTF8String:a1];
      id v9 = [v8 uppercaseString];

      BOOL v3 = v9
        && [v9 length]
        && objc_msgSend(v7, "numberOfMatchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length")) != 0;
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

void sub_1000130A4(id a1)
{
  id v4 = 0;
  uint64_t v1 = +[NSRegularExpression regularExpressionWithPattern:@"^[\\w]{4}(E|O|A){0,1}(\\d){4}\\.([\\w]){3,5}$" options:16 error:&v4];
  id v2 = v4;
  BOOL v3 = (void *)qword_1000447E8;
  qword_1000447E8 = v1;
}

void sub_100013110(id a1)
{
  id v4 = 0;
  uint64_t v1 = +[NSRegularExpression regularExpressionWithPattern:@"^([1-9]{1}[\\d]{2}[\\w]{5})$|^((?i)\\bDCIM\\b)$" options:16 error:&v4];
  id v2 = v4;
  BOOL v3 = (void *)qword_1000447F0;
  qword_1000447F0 = v1;
}

void sub_10001317C(void *a1, void *a2, void *a3, void *a4)
{
  id v13 = a1;
  id v7 = [v13 objectForKeyedSubscript:kCGImagePropertyOrientation];
  if (!v7)
  {
    id v7 = [v13 objectForKeyedSubscript:kCGImagePropertyTIFFOrientation];
    if (!v7) {
      id v7 = &off_100039218;
    }
  }
  id v8 = v7;
  *a2 = v8;
  id v9 = [v13 objectForKeyedSubscript:@"RawPixelWidth"];
  if (!v9)
  {
    id v9 = [v13 objectForKeyedSubscript:kCGImagePropertyPixelWidth];
    if (!v9)
    {
      id v9 = [v13 objectForKeyedSubscript:kCGImagePropertyExifPixelXDimension];
    }
  }
  id v10 = v9;
  *a3 = v10;
  dispatch_time_t v11 = [v13 objectForKeyedSubscript:@"RawPixelHeight"];
  if (!v11)
  {
    dispatch_time_t v11 = [v13 objectForKeyedSubscript:kCGImagePropertyPixelHeight];
    if (!v11)
    {
      dispatch_time_t v11 = [v13 objectForKeyedSubscript:kCGImagePropertyExifPixelYDimension];
    }
  }
  id v12 = v11;
  *a4 = v12;
}

id sub_1000132D4(void *a1)
{
  memset(&v3, 0, sizeof(v3));
  strptime_l((const char *)objc_msgSend(a1, "UTF8String", 0, 0, 0, 0, 0, 0, 0), "%Y:%m:%d %H:%M:%S", &v3, 0);
  uint64_t v1 = +[NSDate dateWithTimeIntervalSince1970:(double)mktime(&v3)];

  return v1;
}

id sub_100013738(uint64_t a1)
{
  [*(id *)(a1 + 32) setReading:1];
  id v2 = *(void **)(a1 + 32);

  return [v2 readQueue];
}

id sub_1000137EC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setReading:0];
}

void sub_100013884(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) readOffset];
  id v29 = [*(id *)(a1 + 32) msFile];
  if (v2 == [v29 size])
  {
  }
  else
  {
    tm v3 = [*(id *)(a1 + 32) availSlots];
    id v4 = [v3 count];

    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 32) availSlots];
      id v6 = [v5 firstObject];

      id v7 = [*(id *)(a1 + 32) availSlots];
      [v7 removeObject:v6];

      __ICOSLogCreate();
      if (__ICLogTypeEnabled(4))
      {
        id v8 = @"--slot";
        if ((unint64_t)[@"--slot" length] >= 0x15)
        {
          id v9 = objc_msgSend(@"--slot", "substringWithRange:", 0, 18);
          id v8 = [v9 stringByAppendingString:@".."];
        }
        id v10 = [*(id *)(a1 + 32) availSlots];
        dispatch_time_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Slots Available: %lu", [v10 count]);

        id v12 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = v8;
          __int16 v14 = v12;
          *(_DWORD *)statfs buf = 136446466;
          id v33 = [(__CFString *)v13 UTF8String];
          __int16 v34 = 2114;
          id v35 = v11;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
      }
      id v15 = objc_msgSend(*(id *)(a1 + 32), "bufferAtSlot:", objc_msgSend(v6, "unsignedIntValue"));
      dispatch_time_t v16 = [*(id *)(a1 + 32) msFile];
      id v17 = (char *)objc_msgSend(v16, "readStream:size:offset:", v15, 0x200000, objc_msgSend(*(id *)(a1 + 32), "readOffset"));

      if (!v17) {
        goto LABEL_14;
      }
      id v18 = [*(id *)(a1 + 32) bufDict];
      uint64_t v19 = [*(id *)(a1 + 32) msFile];
      id v20 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v19 size]);
      uint64_t v21 = [v18 objectForKeyedSubscript:v20];

      if (v21) {
LABEL_14:
      }
        [*(id *)(a1 + 32) setReading:0];
      v30 = v6;
      id v22 = +[NSNumber numberWithUnsignedLongLong:v17];
      uint64_t v31 = v22;
      id v23 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      id v24 = [*(id *)(a1 + 32) bufDict];
      long long v25 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*(id *)(a1 + 32) readOffset]);
      [v24 setObject:v23 forKeyedSubscript:v25];

      objc_msgSend(*(id *)(a1 + 32), "setReadOffset:", &v17[(void)objc_msgSend(*(id *)(a1 + 32), "readOffset")]);
      long long v26 = [*(id *)(a1 + 32) addSemaphore];
      dispatch_semaphore_signal(v26);

      id v27 = [*(id *)(a1 + 32) bufDict];
      if ((unint64_t)[v27 count] > 4)
      {
      }
      else
      {
        unsigned int v28 = [*(id *)(a1 + 32) reading];

        if (v28) {
          [*(id *)(a1 + 32) readQueue];
        }
      }
    }
  }
}

void sub_100013DC8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) bufDict];
  tm v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  id v4 = [v2 objectForKeyedSubscript:v3];

  uint64_t v5 = [v4 allKeys];
  id v6 = [v5 firstObject];
  id v7 = [v4 objectForKeyedSubscript:v6];
  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    id v8 = @"++deq";
    if ((unint64_t)[@"++deq" length] >= 0x15)
    {
      id v9 = objc_msgSend(@"++deq", "substringWithRange:", 0, 18);
      id v8 = [v9 stringByAppendingString:@".."];
    }
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Dequeing Slot: %u", [v6 unsignedIntValue]);
    dispatch_time_t v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v8;
      id v13 = v11;
      *(_DWORD *)statfs buf = 136446466;
      id v28 = [(__CFString *)v12 UTF8String];
      __int16 v29 = 2114;
      v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  if (v7)
  {
    **(void **)(a1 + 56) = [v7 length];
    if ([v7 length])
    {
      __int16 v14 = *(void **)(a1 + 64);
      id v15 = v7;
      memcpy(v14, [v15 bytes], (size_t)objc_msgSend(v15, "length"));
    }
  }
  dispatch_time_t v16 = [*(id *)(a1 + 32) bufDict];
  id v17 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  [v16 removeObjectForKey:v17];

  id v18 = [*(id *)(a1 + 32) availSlots];
  [v18 addObject:v6];

  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    uint64_t v19 = @"++slot";
    if ((unint64_t)[@"++slot" length] >= 0x15)
    {
      id v20 = objc_msgSend(@"++slot", "substringWithRange:", 0, 18);
      uint64_t v19 = [v20 stringByAppendingString:@".."];
    }
    uint64_t v21 = [*(id *)(a1 + 32) availSlots];
    id v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Slots Available: %lu", [v21 count]);

    id v23 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = v19;
      long long v25 = v23;
      id v26 = [(__CFString *)v24 UTF8String];
      *(_DWORD *)statfs buf = 136446466;
      id v28 = v26;
      __int16 v29 = 2114;
      v30 = v22;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  [*(id *)(a1 + 32) readQueue];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100014214(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) bufDict];
  tm v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  id v4 = [v2 objectForKeyedSubscript:v3];

  uint64_t v5 = [v4 allKeys];
  id v6 = [v5 firstObject];
  if (objc_msgSend(*(id *)(a1 + 32), "resetBufferAtSlot:", (int)objc_msgSend(v6, "intValue")) == (id)-1)
  {
    __ICOSLogCreate();
    id v10 = [*(id *)(a1 + 32) msFile];
    dispatch_time_t v11 = [v10 name];

    if ((unint64_t)[v11 length] >= 0x15)
    {
      id v12 = objc_msgSend(v11, "substringWithRange:", 0, 18);
      uint64_t v13 = [v12 stringByAppendingString:@".."];

      dispatch_time_t v11 = (void *)v13;
    }
    __int16 v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"mmap failed for slot: %d", [v6 intValue]);
    id v15 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100024E40(v11, v15);
    }
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) bufDict];
    id v8 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
    [v7 removeObjectForKey:v8];

    id v9 = [*(id *)(a1 + 32) availSlots];
    [v9 addObject:v6];

    [*(id *)(a1 + 32) readQueue];
  }
}

void sub_100014598(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) bufDict];
  tm v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  id v9 = [v2 objectForKeyedSubscript:v3];

  id v4 = [v9 allKeys];
  uint64_t v5 = [v4 firstObject];
  id v6 = [v9 objectForKeyedSubscript:v5];
  id v7 = objc_msgSend(*(id *)(a1 + 32), "bufferAtSlot:", objc_msgSend(v5, "unsignedIntValue"));
  if (v7)
  {
    id v8 = v7;
    **(void **)(a1 + 64) = [v6 unsignedLongValue];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_1000149A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000149B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    uint64_t v5 = v4;
    if (v4)
    {
      [v4 preferredTransform];
    }
    else
    {
      long long v8 = 0u;
      long long v9 = 0u;
      long long v7 = 0u;
    }
    id v6 = *(_OWORD **)(*(void *)(a1 + 40) + 8);
    v6[2] = v7;
    v6[3] = v8;
    v6[4] = v9;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100014BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100014C1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v33;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v33 != v7) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v32 + 1) + 8 * i) isDecodable]) {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v6);
    }

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      id v9 = [v4 objectAtIndexedSubscript:0];
      id v10 = [v9 formatDescriptions];
      if ([v10 count])
      {
        dispatch_time_t v11 = [v10 objectAtIndexedSubscript:0];

        *(CGSize *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = CMVideoFormatDescriptionGetPresentationDimensions((CMVideoFormatDescriptionRef)v11, 1u, 1u);
        uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
        if (v9)
        {
          [v9 preferredTransform];
          float64x2_t v13 = v30;
          float64x2_t v14 = v31;
        }
        else
        {
          float64x2_t v13 = 0uLL;
          float64x2_t v14 = 0uLL;
        }
        *(float64x2_t *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = vmlaq_n_f64(vmulq_n_f64(v14, *(double *)(v12 + 40)), v13, *(double *)(v12 + 32));
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = *(void *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                                + 32);
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = *(void *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                                + 40);
        **(void **)(a1 + 72) = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        **(void **)(a1 + 80) = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32);
        goto LABEL_32;
      }
      __ICOSLogCreate();
      id v18 = *(id *)(a1 + 32);
      if ((unint64_t)[v18 length] >= 0x15)
      {
        id v23 = -[NSObject substringWithRange:](v18, "substringWithRange:", 0, 18);
        uint64_t v24 = [v23 stringByAppendingString:@".."];

        id v18 = v24;
      }
      long long v25 = +[NSString stringWithFormat:@"AVAsset: missing format descriptions"];
      id v26 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = v18;
        id v28 = v26;
        id v29 = [v27 UTF8String];
        *(_DWORD *)statfs buf = 136446466;
        id v37 = v29;
        __int16 v38 = 2114;
        v39 = v25;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
LABEL_29:

      goto LABEL_32;
    }
    __ICOSLogCreate();
    id v9 = *(id *)(a1 + 32);
    if ((unint64_t)[v9 length] >= 0x15)
    {
      uint64_t v19 = objc_msgSend(v9, "substringWithRange:", 0, 18);
      uint64_t v20 = [v19 stringByAppendingString:@".."];

      id v9 = (id)v20;
    }
    id v10 = +[NSString stringWithFormat:@"AVAsset: is not decodable"];
    uint64_t v21 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v9;
      id v18 = v21;
      id v22 = [v9 UTF8String];
      *(_DWORD *)statfs buf = 136446466;
      id v37 = v22;
      __int16 v38 = 2114;
      v39 = v10;
      goto LABEL_23;
    }
  }
  else
  {
    __ICOSLogCreate();
    id v9 = *(id *)(a1 + 32);
    if ((unint64_t)[v9 length] >= 0x15)
    {
      id v15 = objc_msgSend(v9, "substringWithRange:", 0, 18);
      uint64_t v16 = [v15 stringByAppendingString:@".."];

      id v9 = (id)v16;
    }
    id v10 = +[NSString stringWithFormat:@"AVAsset: contains no tracks"];
    id v17 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v9;
      id v18 = v17;
      *(_DWORD *)statfs buf = 136446466;
      id v37 = [v9 UTF8String];
      __int16 v38 = 2114;
      v39 = v10;
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      goto LABEL_29;
    }
  }
LABEL_32:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10001607C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v27 = 0;
  id v3 = [v2 statusOfValueForKey:@"duration" error:&v27];
  id v4 = v27;
  if (v3 != (id)2)
  {
    __ICOSLogCreate();
    id v18 = [*(id *)(a1 + 40) name];
    if ((unint64_t)[v18 length] >= 0x15)
    {
      uint64_t v19 = objc_msgSend(v18, "substringWithRange:", 0, 18);
      uint64_t v20 = [v19 stringByAppendingString:@".."];

      id v18 = (void *)v20;
    }
    uint64_t v21 = +[NSString stringWithFormat:@"AVAsset: loadValuesAsynchronously failed to return the duration"];
    id v22 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = v18;
      uint64_t v24 = v22;
      id v25 = [v23 UTF8String];
      LODWORD(buf.value) = 136446466;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v25;
      LOWORD(buf.flags) = 2114;
      *(void *)((char *)&buf.flags + 2) = v21;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&buf, 0x16u);
    }
    goto LABEL_12;
  }
  memset(&buf, 0, sizeof(buf));
  id v5 = *(void **)(a1 + 32);
  if (v5) {
    [v5 duration];
  }
  CMTime v26 = buf;
  float Seconds = CMTimeGetSeconds(&v26);
  uint64_t v7 = [*(id *)(a1 + 40) metadata];
  long long v8 = [v7 objectForKeyedSubscript:@"VideoDuration"];
  [v8 floatValue];
  float v10 = v9;

  if (v10 != Seconds)
  {
    CMTime v26 = buf;
    Float64 v11 = CMTimeGetSeconds(&v26);
    *(float *)&Float64 v11 = v11;
    uint64_t v12 = +[NSNumber numberWithFloat:v11];
    float64x2_t v13 = [*(id *)(a1 + 40) metadata];
    [v13 setObject:v12 forKeyedSubscript:@"VideoDuration"];

    CMTime v26 = buf;
    Float64 v14 = CMTimeGetSeconds(&v26);
    *(float *)&Float64 v14 = v14;
    id v15 = +[NSNumber numberWithFloat:v14];
    uint64_t v16 = [*(id *)(a1 + 40) metadata];
    [v16 setObject:v15 forKeyedSubscript:@"Duration"];

    if (*(void *)(a1 + 48))
    {
      CMTime v26 = buf;
      Float64 v17 = CMTimeGetSeconds(&v26);
      *(float *)&Float64 v17 = v17;
      id v18 = +[NSNumber numberWithFloat:v17];
      [*(id *)(a1 + 48) setObject:v18 forKeyedSubscript:@"ICMediaDuration"];
LABEL_12:
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

id sub_100016E14(uint64_t a1)
{
  return [*(id *)(a1 + 32) rawImageMinimumProperties];
}

void sub_100019258(id a1)
{
  id v3 = (id)CGImageSourceCopyTypeExtensions();
  id v1 = [objc_alloc((Class)NSSet) initWithArray:v3];
  id v2 = (void *)qword_100044838;
  qword_100044838 = (uint64_t)v1;
}

void sub_10001936C(id a1)
{
  id v3 = (id)CGImageSourceCopyTypeExtensions();
  id v1 = [objc_alloc((Class)NSMutableSet) initWithArray:v3];
  id v2 = (void *)qword_100044840;
  qword_100044840 = (uint64_t)v1;

  [(id)qword_100044840 removeObject:@"tif"];
}

void sub_10001AB80(id *a1)
{
  if ([a1[4] fullMetadata])
  {
    id v2 = a1[5];
    id v66 = 0;
    id v3 = [v2 statusOfValueForKey:@"duration" error:&v66];
    id v4 = v66;
    if (v3 == (id)2)
    {
      memset(&buf, 0, sizeof(buf));
      id v5 = a1[5];
      if (v5) {
        [v5 duration];
      }
      CMTime time = buf;
      Float64 Seconds = CMTimeGetSeconds(&time);
      *(float *)&Float64 Seconds = Seconds;
      uint64_t v7 = +[NSNumber numberWithFloat:Seconds];
      [a1[6] setObject:v7 forKeyedSubscript:@"VideoDuration"];

      CMTime time = buf;
      Float64 v8 = CMTimeGetSeconds(&time);
      *(float *)&Float64 v8 = v8;
      float v9 = +[NSNumber numberWithFloat:v8];
      [a1[6] setObject:v9 forKeyedSubscript:@"Duration"];
    }
    else
    {
      __ICOSLogCreate();
      float v9 = [a1[4] name];
      if ((unint64_t)[v9 length] >= 0x15)
      {
        float v10 = objc_msgSend(v9, "substringWithRange:", 0, 18);
        uint64_t v11 = [v10 stringByAppendingString:@".."];

        float v9 = (void *)v11;
      }
      uint64_t v12 = +[NSString stringWithFormat:@"AVAsset: loadValuesAsynchronously failed to return the duration"];
      float64x2_t v13 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = v9;
        id v15 = v13;
        id v16 = [v14 UTF8String];
        LODWORD(buf.value) = 136446466;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v16;
        LOWORD(buf.flags) = 2114;
        *(void *)((char *)&buf.flags + 2) = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
  }
  else
  {
    id v4 = 0;
  }
  id v17 = objc_alloc_init((Class)NSMutableDictionary);
  id v59 = objc_alloc_init((Class)NSMutableDictionary);
  id v18 = a1[5];
  id v64 = v4;
  id v56 = [v18 statusOfValueForKey:@"tracks" error:&v64];
  id v57 = v64;

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = a1;
  uint64_t v19 = [a1[5] commonMetadata];
  id v20 = [v19 countByEnumeratingWithState:&v60 objects:v67 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v61;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v61 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        id v25 = [v24 commonKey];
        unsigned int v26 = [v25 isEqualToString:@"model"];

        if (v26)
        {
          id v27 = [v24 stringValue];
          id v28 = v17;
          id v29 = v27;
          CFStringRef v30 = @"Model";
        }
        else
        {
          float64x2_t v31 = [v24 commonKey];
          unsigned int v32 = [v31 isEqualToString:@"software"];

          if (v32)
          {
            id v27 = [v24 stringValue];
            id v28 = v17;
            id v29 = v27;
            CFStringRef v30 = @"Software";
          }
          else
          {
            long long v33 = [v24 commonKey];
            unsigned int v34 = [v33 isEqualToString:@"make"];

            if (v34)
            {
              id v27 = [v24 stringValue];
              id v28 = v17;
              id v29 = v27;
              CFStringRef v30 = @"Make";
            }
            else
            {
              long long v35 = [v24 commonKey];
              unsigned int v36 = [v35 isEqualToString:@"identifier"];

              if (v36)
              {
                id v27 = [v24 stringValue];
                id v28 = v59;
                id v29 = v27;
                CFStringRef v30 = @"17";
              }
              else
              {
                id v37 = [v24 commonKey];
                unsigned int v38 = [v37 isEqualToString:@"creationDate"];

                if (v38)
                {
                  v39 = [v24 stringValue];
                  [v17 setObject:v39 forKeyedSubscript:kCGImagePropertyTIFFDateTime];

                  id v27 = objc_alloc_init((Class)NSDateFormatter);
                  [v27 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
                  id v40 = [v24 stringValue];
                  id v41 = [v27 dateFromString:v40];

                  if (v41)
                  {
                    [v41 timeIntervalSince1970];
                    [v58[4] setCaptureDate:(unint64_t)v42];
                  }

                  goto LABEL_33;
                }
                uint64_t v43 = [v24 commonKey];
                unsigned int v44 = [v43 isEqualToString:@"location"];

                if (!v44) {
                  continue;
                }
                id v27 = [v24 stringValue];
                id v28 = v58[6];
                id v29 = v27;
                CFStringRef v30 = @"GPSString";
              }
            }
          }
        }
        [v28 setObject:v29 forKeyedSubscript:v30];
LABEL_33:
      }
      id v21 = [v19 countByEnumeratingWithState:&v60 objects:v67 count:16];
    }
    while (v21);
  }

  [v58[6] setObject:v17 forKeyedSubscript:@"{TIFF}"];
  [v58[6] setObject:v59 forKeyedSubscript:@"{MakerApple}"];
  if (v56 != (id)2)
  {
    __ICOSLogCreate();
    __int16 v48 = [v58[4] name];
    if ((unint64_t)[v48 length] >= 0x15)
    {
      id v49 = objc_msgSend(v48, "substringWithRange:", 0, 18);
      uint64_t v50 = [v49 stringByAppendingString:@".."];

      __int16 v48 = (void *)v50;
    }
    id v51 = +[NSString stringWithFormat:@"AVAsset: could not be loaded"];
    uint64_t v52 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v53 = v48;
      long long v54 = v52;
      id v55 = [v53 UTF8String];
      LODWORD(buf.value) = 136446466;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v55;
      LOWORD(buf.flags) = 2114;
      *(void *)((char *)&buf.flags + 2) = v51;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&buf, 0x16u);
    }
    goto LABEL_46;
  }
  buf.value = 0;
  time.value = 0;
  id v45 = v58[5];
  v46 = [v58[4] name];
  LODWORD(v45) = [v45 decodableVideoNamed:v46 width:&time height:&buf];

  if (v45 && *(double *)&time.value != 0.0 && *(double *)&buf.value != 0.0)
  {
    unsigned int v47 = +[NSNumber numberWithInt:(int)*(double *)&buf.value];
    [v58[6] setObject:v47 forKeyedSubscript:kCGImagePropertyPixelHeight];

    __int16 v48 = +[NSNumber numberWithInt:(int)*(double *)&time.value];
    [v58[6] setObject:v48 forKeyedSubscript:kCGImagePropertyPixelWidth];
LABEL_46:
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)v58[7]);
}

void sub_10001C318(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id sub_10001C358(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_10001C384(uint64_t a1)
{
}

intptr_t sub_10001C38C(uint64_t a1, int a2, CGImageRef image, uint64_t a4, uint64_t a5)
{
  if (!image || a5)
  {
    __ICOSLogCreate();
    id v6 = [*(id *)(a1 + 32) name];
    if ((unint64_t)[v6 length] >= 0x15)
    {
      uint64_t v7 = objc_msgSend(v6, "substringWithRange:", 0, 18);
      uint64_t v8 = [v7 stringByAppendingString:@".."];

      id v6 = (void *)v8;
    }
    float v9 = +[NSString stringWithFormat:@"AVAsset: failed to generate a preview thumbnail"];
    float v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100024E40(v6, v10);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = CGImageCreateCopy(image);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

int64_t sub_10001CC8C(id a1, ICMediaItemProtocol *a2, ICMediaItemProtocol *a3)
{
  id v4 = a3;
  id v5 = [(ICMediaItemProtocol *)a2 unsignedIntegerValue];
  id v6 = [(ICMediaItemProtocol *)v4 unsignedIntegerValue];

  int64_t v7 = -1;
  if (v6 <= v5) {
    int64_t v7 = 1;
  }
  if (v6 == v5) {
    return 0;
  }
  else {
    return v7;
  }
}

int64_t sub_10001D1F0(id a1, NSNumber *a2, NSNumber *a3)
{
  id v4 = a3;
  NSUInteger v5 = [(NSNumber *)a2 unsignedIntegerValue];
  id v6 = [(NSNumber *)v4 unsignedIntegerValue];

  int64_t v7 = -1;
  if ((unint64_t)v6 <= v5) {
    int64_t v7 = 1;
  }
  if (v6 == (id)v5) {
    return 0;
  }
  else {
    return v7;
  }
}

void sub_10001E028(id a1)
{
  id v12 = objc_alloc((Class)NSSet);
  uint64_t v11 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  qword_100044818 = (uint64_t)objc_msgSend(v12, "initWithObjects:", v11, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);

  _objc_release_x1();
}

void sub_10001E524(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) sessionManager];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = +[NSXPCConnection currentConnection];
  [v4 addNotifications:v2 toSessionWithConnection:v3];
}

void sub_10001E658(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) sessionManager];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = +[NSXPCConnection currentConnection];
  [v4 remNotifications:v2 fromSessionWithConnection:v3];
}

void sub_10001F338(uint64_t a1)
{
  __ICOSLogCreate();
  uint64_t v2 = [*(id *)(a1 + 32) name];
  if ((unint64_t)[v2 length] >= 0x15)
  {
    uint64_t v3 = objc_msgSend(v2, "substringWithRange:", 0, 18);
    uint64_t v4 = [v3 stringByAppendingString:@".."];

    uint64_t v2 = (void *)v4;
  }
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [v5 reflightCount];
  [v5 setReflightCount:(v6 + 1)];
  uint64_t v7 = +[NSString stringWithFormat:@"Issuing Immediate Reflight: %d", v6];
  uint64_t v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v2;
    uint64_t v10 = v8;
    *(_DWORD *)CMTime buf = 136446466;
    id v13 = [v9 UTF8String];
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  uint64_t v11 = [*(id *)(a1 + 32) device];
  [v11 reflight];
}

void sub_10001F4D0(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) reflightRequested];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = [v3 reflightQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001F5B0;
    block[3] = &unk_100034A78;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v4, block);

    [*(id *)(a1 + 32) setReflightRequested:0];
  }
  else
  {
    uint64_t v5 = [v3 reflightTimer];
    dispatch_source_cancel(v5);
  }
}

void sub_10001F5B0(uint64_t a1)
{
  __ICOSLogCreate();
  unsigned int v2 = [*(id *)(a1 + 32) name];
  if ((unint64_t)[v2 length] >= 0x15)
  {
    uint64_t v3 = objc_msgSend(v2, "substringWithRange:", 0, 18);
    uint64_t v4 = [v3 stringByAppendingString:@".."];

    unsigned int v2 = (void *)v4;
  }
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [v5 reflightCount];
  [v5 setReflightCount:(v6 + 1)];
  uint64_t v7 = +[NSString stringWithFormat:@"Issuing Queued Reflight: %d", v6];
  uint64_t v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v2;
    uint64_t v10 = v8;
    *(_DWORD *)CMTime buf = 136446466;
    id v13 = [v9 UTF8String];
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  uint64_t v11 = [*(id *)(a1 + 32) device];
  [v11 reflight];
}

id sub_10001F748(uint64_t a1)
{
  __ICOSLogCreate();
  unsigned int v2 = [*(id *)(a1 + 32) name];
  if ((unint64_t)[v2 length] >= 0x15)
  {
    uint64_t v3 = objc_msgSend(v2, "substringWithRange:", 0, 18);
    uint64_t v4 = [v3 stringByAppendingString:@".."];

    unsigned int v2 = (void *)v4;
  }
  uint64_t v5 = +[NSString stringWithFormat:@"Reflight Timer Canceled"];
  id v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v2;
    uint64_t v8 = v6;
    int v10 = 136446466;
    id v11 = [v7 UTF8String];
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v10, 0x16u);
  }
  [*(id *)(a1 + 32) setReflightRequested:0];
  return [*(id *)(a1 + 32) setReflightTimer:0];
}

void sub_10001FB24(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) reflightQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FBB4;
  block[3] = &unk_100034A78;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void sub_10001FBB4(uint64_t a1)
{
  __ICOSLogCreate();
  unsigned int v2 = [*(id *)(a1 + 32) name];
  if ((unint64_t)[v2 length] >= 0x15)
  {
    uint64_t v3 = objc_msgSend(v2, "substringWithRange:", 0, 18);
    uint64_t v4 = [v3 stringByAppendingString:@".."];

    unsigned int v2 = (void *)v4;
  }
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [v5 reflightCount];
  [v5 setReflightCount:(v6 + 1)];
  id v7 = +[NSString stringWithFormat:@"Issuing Queued Reflight: %d", v6];
  uint64_t v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v2;
    int v10 = v8;
    *(_DWORD *)CMTime buf = 136446466;
    id v13 = [v9 UTF8String];
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  id v11 = [*(id *)(a1 + 32) device];
  [v11 reflight];
}

void sub_10001FFF4(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) filesystemChangeSource];
  char data = dispatch_source_get_data(v2);

  if ((data & 2) != 0)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 issueReflight];
  }
}

uint64_t sub_100020060(uint64_t a1)
{
  int v1 = [*(id *)(a1 + 32) filesystemChangeDescriptor];

  return close(v1);
}

void sub_100020224(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ICEnumerationChronologicalOrder"];
  id v102 = v2;
  if (v2) {
    uint64_t v3 = (uint64_t)[v2 integerValue];
  }
  else {
    uint64_t v3 = -1;
  }
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  dword_10004484C = 0;
  *(float *)&dword_10004484C = (float)mach_absolute_time();
  uint64_t v4 = [*(id *)(a1 + 40) path];
  +[NSURL fileURLWithPath:v4];
  uint64_t v5 = v106 = a1;

  id v6 = +[NSFileManager defaultManager];
  NSURLResourceKey v132 = NSURLContentModificationDateKey;
  id v7 = +[NSArray arrayWithObjects:&v132 count:1];
  v100 = v6;
  id v101 = (void *)v5;
  uint64_t v8 = v5;
  uint64_t v9 = v106;
  int v10 = [v6 contentsOfDirectoryAtURL:v8 includingPropertiesForKeys:v7 options:4 error:0];

  v118[0] = _NSConcreteStackBlock;
  v118[1] = 3221225472;
  v118[2] = sub_100020F80;
  v118[3] = &unk_100034D18;
  v118[4] = v3;
  v98 = +[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:v3 != 0 comparator:v118];
  id v131 = v98;
  id v11 = +[NSArray arrayWithObjects:&v131 count:1];
  v99 = v10;
  __int16 v12 = [v10 sortedArrayUsingDescriptors:v11];
  id v13 = [v12 mutableCopy];

  __ICOSLogCreate();
  __int16 v14 = [*(id *)(v106 + 40) name];
  if ((unint64_t)[v14 length] >= 0x15)
  {
    id v15 = objc_msgSend(v14, "substringWithRange:", 0, 18);
    uint64_t v16 = [v15 stringByAppendingString:@".."];

    __int16 v14 = (void *)v16;
  }
  id v17 = +[NSString stringWithFormat:@"--> Entering Enumeration"];
  id v18 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = v14;
    id v20 = v18;
    id v21 = v19;
    uint64_t v9 = v106;
    id v22 = [v21 UTF8String];
    buf.st_dev = 136446466;
    *(void *)&buf.st_mode = v22;
    WORD2(buf.st_ino) = 2114;
    *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v17;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&buf, 0x16u);
  }
  id v23 = [*(id *)(v9 + 40) name];
  unsigned int v24 = [v23 isEqualToString:@"DCIM"];

  id v25 = [*(id *)(v9 + 40) name];
  unsigned int v26 = [v25 isEqualToString:@"MP_ROOT"];

  id v103 = [v13 copyGroupIntoDictionary:&stru_100034D58];
  if ([v13 count])
  {
    uint64_t v113 = 0;
    int v110 = v24 | v26;
    id v109 = v13;
    while (1)
    {
      id v27 = [v13 firstObject];
      uint64_t v28 = [v27 baseNameKey];

      v104 = (void *)v28;
      id v105 = objc_alloc_init((Class)NSMutableArray);
      long long v114 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      id obj = [v103 objectForKeyedSubscript:v28];
      id v112 = [obj countByEnumeratingWithState:&v114 objects:v130 count:16];
      if (!v112) {
        goto LABEL_54;
      }
      uint64_t v111 = *(void *)v115;
      do
      {
        for (i = 0; i != v112; i = (char *)i + 1)
        {
          if (*(void *)v115 != v111) {
            objc_enumerationMutation(obj);
          }
          CFStringRef v30 = *(void **)(*((void *)&v114 + 1) + 8 * i);
          unsigned int v32 = [v30 lastPathComponent];
          memset(&buf, 0, sizeof(buf));
          id v33 = [v30 path];
          int v34 = lstat((const char *)[v33 UTF8String], &buf);

          if (v34) {
            BOOL v35 = 0;
          }
          else {
            BOOL v35 = (buf.st_mode & 0xF000) == 0x4000;
          }
          int v36 = v35;
          if (v110)
          {
            if (!v36
              || (id v37 = v32,
                  !sub_100012F74([v37 UTF8String], (uint64_t)objc_msgSend(v37, "length"), 1)))
            {
              __ICOSLogCreate();
              id v55 = @"Dumped";
              if ((unint64_t)[@"Dumped" length] >= 0x15)
              {
                id v56 = objc_msgSend(@"Dumped", "substringWithRange:", 0, 18);
                id v55 = [v56 stringByAppendingString:@".."];
              }
              if ((unint64_t)[v32 length] <= 0x12)
              {
                long long v58 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%18s] - DCIM can only contain subdirectories", [v32 UTF8String]);
              }
              else
              {
                objc_msgSend(v32, "substringWithRange:", 0, 17);
                id v57 = objc_claimAutoreleasedReturnValue();
                long long v58 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%18s] - DCIM can only contain subdirectories", [v57 UTF8String]);
              }
              id v70 = (void *)_gICOSLog;
              if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
              {
                id v71 = v55;
                id v72 = v70;
                id v73 = [(__CFString *)v71 UTF8String];
                *(_DWORD *)long long v122 = 136446466;
                id v123 = v73;
                __int16 v124 = 2114;
                id v125 = v58;
                _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", v122, 0x16u);
              }
              ++v113;

LABEL_51:
              id v13 = v109;
              goto LABEL_52;
            }
            unsigned int v38 = [MSCameraFolder alloc];
            v39 = *(void **)(v106 + 40);
            id v40 = [v39 device];
            id v41 = [(MSCameraFolder *)v38 initWithFSURL:v30 name:v37 parent:v39 device:v40];

            if (v41)
            {
              double v42 = [*(id *)(v106 + 40) device];
              [v42 addCameraFolderToIndex:v41];

              CFStringRef v127 = @"ICMSObjectInfoArray";
              uint64_t v43 = [(MSCameraItem *)v41 info];
              unsigned int v44 = [v43 content];
              long long v126 = v44;
              id v45 = +[NSArray arrayWithObjects:&v126 count:1];
              long long v128 = v45;
              v46 = +[NSDictionary dictionaryWithObjects:&v128 forKeys:&v127 count:1];

              unsigned int v47 = [*(id *)(v106 + 40) device];
              __int16 v48 = [*(id *)(v106 + 40) device];
              id v49 = [v48 allConnections];
              [v47 sendAddedItemsNotification:v46 toConnections:v49];

              [(MSCameraFolder *)v41 enumerateContentWithOptions:*(void *)(v106 + 32)];
            }

            id v13 = v109;
          }
          else
          {
            if ((v36 & 1) != 0
              || (id v50 = v32,
                  !sub_100012F74([v50 UTF8String], (uint64_t)objc_msgSend(v50, "length"), 0)))
            {
              __ICOSLogCreate();
              id v59 = @"Dumped";
              if ((unint64_t)[@"Dumped" length] >= 0x15)
              {
                long long v60 = objc_msgSend(@"Dumped", "substringWithRange:", 0, 18);
                id v59 = [v60 stringByAppendingString:@".."];
              }
              id v61 = [v32 length];
              long long v62 = v32;
              if ((unint64_t)v61 >= 0x13)
              {
                long long v62 = objc_msgSend(v32, "substringWithRange:", 0, 17);
                uint64_t v107 = v62;
              }
              id v63 = [v62 UTF8String];
              id v64 = "File Name";
              if (v36) {
                id v64 = "Directory";
              }
              v65 = +[NSString stringWithFormat:@"[%18s] - Unexpected %s", v63, v64];
              if ((unint64_t)v61 >= 0x13) {

              }
              id v66 = (void *)_gICOSLog;
              if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v67 = v59;
                CFStringRef v68 = v66;
                id v69 = [(__CFString *)v67 UTF8String];
                *(_DWORD *)long long v122 = 136446466;
                id v123 = v69;
                __int16 v124 = 2114;
                id v125 = v65;
                _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", v122, 0x16u);
              }
              ++v113;
              goto LABEL_51;
            }
            id v51 = [*(id *)(v106 + 40) createAssetFromURL:v30 notify:0 preflight:1];
            uint64_t v52 = v51;
            if (v51)
            {
              id v53 = [v51 info];
              long long v54 = [v53 content];
              [v105 addObject:v54];
            }
          }
LABEL_52:

          [v13 removeObject:v30];
        }
        id v112 = [obj countByEnumeratingWithState:&v114 objects:v130 count:16];
      }
      while (v112);
LABEL_54:

      if ([v105 count])
      {
        CFStringRef v120 = @"ICMSObjectInfoArray";
        id v121 = v105;
        uint64_t v74 = +[NSDictionary dictionaryWithObjects:&v121 forKeys:&v120 count:1];
        uint64_t v75 = [*(id *)(v106 + 40) device];
        v76 = [*(id *)(v106 + 40) device];
        v77 = [v76 allConnections];
        [v75 sendAddedItemsNotification:v74 toConnections:v77];
      }
      if (![v13 count])
      {
        uint64_t v9 = v106;
        if (v113)
        {
          __ICOSLogCreate();
          v78 = [*(id *)(v106 + 40) name];
          if ((unint64_t)[v78 length] >= 0x15)
          {
            id v79 = objc_msgSend(v78, "substringWithRange:", 0, 18);
            uint64_t v80 = [v79 stringByAppendingString:@".."];

            v78 = (void *)v80;
            uint64_t v9 = v106;
          }
          id v81 = +[NSString stringWithFormat:@"[%05lu] Non-compliant DCF objects", v113];
          uint64_t v82 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            id v83 = v78;
            v84 = v82;
            v85 = v83;
            uint64_t v9 = v106;
            id v86 = [v85 UTF8String];
            buf.st_dev = 136446466;
            *(void *)&buf.st_mode = v86;
            WORD2(buf.st_ino) = 2114;
            *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v81;
            _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&buf, 0x16u);
          }
        }
        break;
      }
    }
  }
  float v87 = (float)((float)((float)((float)mach_absolute_time() - *(float *)&dword_10004484C) * (float)info.numer)
              / (float)info.denom)
      / 1000000.0;
  __ICOSLogCreate();
  v88 = [*(id *)(v9 + 40) name];
  if ((unint64_t)[v88 length] >= 0x15)
  {
    v89 = objc_msgSend(v88, "substringWithRange:", 0, 18);
    uint64_t v90 = [v89 stringByAppendingString:@".."];

    v88 = (void *)v90;
  }
  if (v87 <= 300.0) {
    CFStringRef v91 = @"𝚫";
  }
  else {
    CFStringRef v91 = @"⊗";
  }
  v92 = +[NSString stringWithFormat:@"Total Enumeration Time"];
  uint64_t v93 = +[NSString stringWithFormat:@"%@[%4.0f ms] %@", v91, v87, v92];

  id v94 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v95 = v88;
    v96 = v94;
    id v97 = [v95 UTF8String];
    buf.st_dev = 136446466;
    *(void *)&buf.st_mode = v97;
    WORD2(buf.st_ino) = 2114;
    *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v93;
    _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&buf, 0x16u);
  }
  dword_100044848 = LODWORD(v87);
}

uint64_t sub_100020F80(uint64_t a1, void *a2, void *a3)
{
  id v20 = 0;
  id v19 = 0;
  id v5 = a3;
  [a2 getResourceValue:&v20 forKey:NSURLContentModificationDateKey error:&v19];
  id v6 = v20;
  id v7 = v19;
  id v17 = 0;
  id v18 = 0;
  [v5 getResourceValue:&v18 forKey:NSURLContentModificationDateKey error:&v17];

  uint64_t v8 = v18;
  id v9 = v17;
  id v10 = v8;
  [v6 timeIntervalSince1970];
  double v12 = v11;
  [v10 timeIntervalSince1970];
  double v14 = v13;

  if (v12 < v14) {
    uint64_t v15 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v15 = -*(void *)(a1 + 32);
  }

  return v15;
}

NSCopying *__cdecl sub_100021074(id a1, NSURL *a2)
{
  return (NSCopying *)[(NSURL *)a2 valueForKey:@"baseNameKey"];
}

void sub_10002186C(uint64_t a1)
{
  unsigned int v2 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[*(id *)(a1 + 32) unsignedIntegerValue] - 1);
  uint64_t v3 = [*(id *)(a1 + 40) device];
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_100021978;
  id v10 = &unk_100034D80;
  uint64_t v4 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = v4;
  id v13 = v2;
  char v14 = *(unsigned char *)(a1 + 56);
  id v5 = v2;
  id v6 = +[NSBlockOperation blockOperationWithBlock:&v7];
  objc_msgSend(v3, "addInitiatedOperation:", v6, v7, v8, v9, v10, v11);
}

id sub_100021978(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "createValidAssetFromURL:attemptCount:notify:preflight:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "intValue"), 1, *(unsigned __int8 *)(a1 + 56));
}

void sub_100021B9C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100021BC0(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 32);
  id v23 = 0;
  id v3 = [v2 statusOfValueForKey:@"tracks" error:&v23];
  id v4 = v23;
  if (v3 == (id)2)
  {
    double v21 = 0.0;
    double v22 = 0.0;
    if ([*(id *)(a1 + 32) decodableVideoNamed:*(void *)(a1 + 40) width:&v21 height:&v22]&& v21 != 0.0&& v22 != 0.0)
    {
      __ICOSLogCreate();
      id v5 = *(id *)(a1 + 40);
      if ((unint64_t)[v5 length] >= 0x15)
      {
        id v6 = objc_msgSend(v5, "substringWithRange:", 0, 18);
        uint64_t v7 = [v6 stringByAppendingString:@".."];

        id v5 = (id)v7;
      }
      uint64_t v8 = +[NSString stringWithFormat:@"Read %fw x %fh", *(void *)&v21, *(void *)&v22];
      id v9 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = v5;
        uint64_t v11 = v9;
        id v12 = [v10 UTF8String];
        *(_DWORD *)stat buf = 136446466;
        id v25 = v12;
        __int16 v26 = 2114;
        id v27 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  else
  {
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      id v13 = *(id *)(a1 + 40);
      if ((unint64_t)[v13 length] >= 0x15)
      {
        char v14 = objc_msgSend(v13, "substringWithRange:", 0, 18);
        uint64_t v15 = [v14 stringByAppendingString:@".."];

        id v13 = (id)v15;
      }
      uint64_t v16 = +[NSString stringWithFormat:@"AVAsset: could not be loaded"];
      id v17 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = v13;
        id v19 = v17;
        id v20 = [v18 UTF8String];
        *(_DWORD *)stat buf = 136446466;
        id v25 = v20;
        __int16 v26 = 2114;
        id v27 = v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

uint64_t sub_100022358(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  uint64_t v7 = +[NSMutableArray arrayWithCapacity:0];
  uint64_t v8 = (void *)v7;
  unsigned int v38 = v5;
  if (!v5)
  {
    uint64_t v16 = 0;
    if (!a2) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  if (v6)
  {
    id v37 = (void *)v7;
    [v6 objectForKeyedSubscript:@"cameraClasses"];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v9 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v46;
LABEL_5:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v45 + 1) + 8 * v12);
        char v14 = [v13 objectForKeyedSubscript:@"class"];
        unsigned __int8 v15 = [v14 isEqualToString:@"MSCameraDeviceManager"];

        if (v15) {
          break;
        }
        if (v10 == (id)++v12)
        {
          id v10 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
          if (v10) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
      id v17 = [v13 objectForKeyedSubscript:@"volumeInfo"];

      if (v17) {
        goto LABEL_16;
      }
    }
    else
    {
LABEL_11:
    }
    id v17 = &off_10003DD38;
LABEL_16:
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v18 = v17;
    id v19 = [(__CFString *)v18 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v19)
    {
      id v20 = v19;
      id v33 = v6;
      int v34 = a2;
      double v21 = 0;
      char v36 = 0;
      uint64_t v22 = *(void *)v42;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          unsigned int v24 = v21;
          if (*(void *)v42 != v22) {
            objc_enumerationMutation(v18);
          }
          uint64_t v25 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          double v21 = objc_msgSend(v38, "stringByAppendingPathComponent:", v25, v33, v34);

          __int16 v26 = +[NSURL fileURLWithPath:v21];
          id v39 = 0;
          id v40 = 0;
          [v26 getResourceValue:&v40 forKey:NSURLIsDirectoryKey error:&v39];
          id v27 = v40;
          id v28 = v39;
          if (!v28 && [v27 BOOLValue])
          {
            [v37 addObject:v25];
            char v36 = 1;
          }
        }
        id v20 = [(__CFString *)v18 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v20);

      id v6 = v33;
      a2 = v34;
      char v29 = v36;
    }
    else
    {
      char v29 = 0;
    }

    uint64_t v8 = v37;
  }
  else
  {
    __ICOSLogCreate();
    id v18 = @"matchPlist";
    if ((unint64_t)[@"matchPlist" length] >= 0x15)
    {
      CFStringRef v30 = objc_msgSend(@"matchPlist", "substringWithRange:", 0, 18);
      id v18 = [v30 stringByAppendingString:@".."];
    }
    id obj = +[NSString stringWithFormat:@"Missing Match Plist"];
    float64x2_t v31 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100024F54(v18, v31, (uint64_t)obj);
    }
    char v29 = 0;
  }

  uint64_t v16 = v29 & 1;
  if (a2) {
LABEL_35:
  }
    *a2 = v8;
LABEL_36:

  return v16;
}

uint64_t start()
{
  __ICOSLogCreate();
  uint64_t v1 = @"mscamera[xpc]";
  if ((unint64_t)[@"mscamera[xpc]" length] >= 0x15)
  {
    unsigned int v2 = objc_msgSend(@"mscamera[xpc]", "substringWithRange:", 0, 18);
    uint64_t v1 = [v2 stringByAppendingString:@".."];
  }
  id v3 = +[NSString stringWithFormat:@"%@", @"Launching mscamera [xpc]"];
  id v4 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v1;
    id v6 = v4;
    *(_DWORD *)stat buf = 136446466;
    id v12 = [(__CFString *)v5 UTF8String];
    __int16 v13 = 2114;
    char v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  uint64_t v7 = objc_alloc_init(MSRemoteCameraDeviceManager);
  [(MSRemoteCameraDeviceManager *)v7 startMSDeviceNotifications];
  uint64_t v8 = +[NSXPCListener serviceListener];
  [v8 setDelegate:v7];
  [v8 resume];
  id v9 = +[NSRunLoop currentRunLoop];
  [v9 run];

  return 0;
}

uint64_t sub_100022DF8(void *a1)
{
  uint64_t v1 = *(unsigned __int16 *)*a1;
  *a1 += 2;
  return v1;
}

_WORD **sub_100022E0C(_WORD **result, __int16 a2)
{
  *(*result)++ = a2;
  return result;
}

uint64_t sub_100022E24(void *a1)
{
  uint64_t v1 = *(unsigned int *)*a1;
  *a1 += 4;
  return v1;
}

_DWORD **sub_100022E38(_DWORD **result, int a2)
{
  *(*result)++ = a2;
  return result;
}

uint64_t sub_100022E50(void **a1)
{
  return *(*a1)++;
}

void **sub_100022E64(void **result, uint64_t a2)
{
  *(*result)++ = a2;
  return result;
}

id sub_100022E7C(const void **a1)
{
  uint64_t v1 = *(unsigned __int8 *)*a1;
  *a1 = (char *)*a1 + 1;
  if (v1)
  {
    id v3 = malloc_type_malloc(2 * v1, 0x8B4C94EFuLL);
    memcpy(v3, *a1, 2 * v1);
    *a1 = (char *)*a1 + 2 * v1;
    id v4 = [objc_alloc((Class)NSString) initWithBytesNoCopy:v3 length:(2 * v1 - 2) encoding:CFStringConvertEncodingToNSStringEncoding(0x14000100u) freeWhenDone:1];
  }
  else
  {
    id v4 = [&stru_100035448 copy];
  }

  return v4;
}

id sub_100022F3C(const void **a1, unint64_t a2)
{
  if ((unint64_t)*a1 + *(unsigned __int8 *)*a1 <= a2)
  {
    unsigned int v2 = sub_100022E7C(a1);
  }
  else
  {
    unsigned int v2 = 0;
  }

  return v2;
}

void sub_100022F84(unsigned char **a1, void *a2)
{
  id v9 = a2;
  unsigned int v3 = [v9 length];
  if (v3)
  {
    id v4 = [v9 dataUsingEncoding:CFStringConvertEncodingToNSStringEncoding(0x14000100u)];
    unsigned int v5 = v3 + 1;
    **a1 = v3 + 1;
    id v6 = *a1 + 1;
    *a1 = v6;
    id v7 = v4;
    memcpy(v6, [v7 bytes], 2 * v3);
    uint64_t v8 = *a1;
    do
    {
      v8 += 2;
      --v3;
    }
    while (v3);
    *(_WORD *)uint64_t v8 = 0;
    *a1 += 2 * v5;
  }
  else
  {
    *(*a1)++ = 0;
  }
}

void sub_10002339C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  unsigned int v32 = v5;
  id v33 = a3;
  if (v33)
  {
    __ICOSLogCreate();
    id v6 = @"FPProviderDomain";
    if ((unint64_t)[@"FPProviderDomain" length] >= 0x15)
    {
      id v7 = objc_msgSend(@"FPProviderDomain", "substringWithRange:", 0, 18);
      id v6 = [v7 stringByAppendingString:@".."];
    }
    uint64_t v8 = +[NSString stringWithFormat:@"Monitoring error: %@\n", v33];
    id v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100024F54(v6, v9, (uint64_t)v8);
    }

    id v10 = v6;
  }
  else
  {
    id v10 = +[NSMutableArray array];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v11 = v5;
    id v12 = [v11 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v46;
      id v35 = v11;
      uint64_t v36 = a1;
      uint64_t v34 = *(void *)v46;
      do
      {
        unsigned __int8 v15 = 0;
        id v37 = v13;
        do
        {
          if (*(void *)v46 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v15);
          id v17 = [v11 objectForKeyedSubscript:v16];
          if ([v16 containsString:@"UserFS"])
          {
            unsigned int v38 = v17;
            id v39 = v15;
            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            id obj = [v17 storageURLs];
            id v18 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
            if (v18)
            {
              id v19 = v18;
              uint64_t v20 = *(void *)v42;
              do
              {
                for (i = 0; i != v19; i = (char *)i + 1)
                {
                  if (*(void *)v42 != v20) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v22 = *(void *)(*((void *)&v41 + 1) + 8 * i);
                  __ICOSLogCreate();
                  id v23 = @"providerList";
                  if ((unint64_t)[@"providerList" length] >= 0x15)
                  {
                    unsigned int v24 = objc_msgSend(@"providerList", "substringWithRange:", 0, 18);
                    id v23 = [v24 stringByAppendingString:@".."];
                  }
                  uint64_t v25 = +[NSString stringWithFormat:@"Adding: %@", v22];
                  __int16 v26 = (void *)_gICOSLog;
                  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
                  {
                    id v27 = v10;
                    id v28 = v23;
                    char v29 = v26;
                    CFStringRef v30 = v28;
                    id v10 = v27;
                    id v31 = [(__CFString *)v30 UTF8String];
                    *(_DWORD *)stat buf = 136446466;
                    id v50 = v31;
                    __int16 v51 = 2114;
                    uint64_t v52 = v25;
                    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
                  }
                  [v10 addObject:v22];
                }
                id v19 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
              }
              while (v19);
            }

            id v11 = v35;
            a1 = v36;
            uint64_t v14 = v34;
            id v13 = v37;
            id v17 = v38;
            unsigned __int8 v15 = v39;
          }

          unsigned __int8 v15 = (char *)v15 + 1;
        }
        while (v15 != v13);
        id v13 = [v11 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v13);
    }

    [*(id *)(a1 + 32) processMountURLs:v10];
  }
}

void sub_1000239C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100024520(uint64_t a1)
{
  if ((dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32)) & 2) != 0)
  {
    unsigned int v2 = [*(id *)(a1 + 40) domainsByURLEnabled];
    unsigned int v3 = +[NSURL fileURLWithPath:*(void *)(a1 + 48)];
    id v4 = [v2 objectForKeyedSubscript:v3];

    id v5 = *(void **)(a1 + 48);
    id v6 = [*(id *)(a1 + 40) deviceMatchingInfo];
    uint64_t v7 = sub_100022358(v5, 0, v6);

    __ICOSLogCreate();
    uint64_t v8 = @"-> Photos";
    if ((unint64_t)[@"-> Photos" length] >= 0x15)
    {
      id v9 = objc_msgSend(@"-> Photos", "substringWithRange:", 0, 18);
      uint64_t v8 = [v9 stringByAppendingString:@".."];
    }
    CFStringRef v10 = @"✅";
    if (!v7) {
      CFStringRef v10 = @"🆘";
    }
    id v11 = +[NSString stringWithFormat:@"%@ : %@", v10, *(void *)(a1 + 48)];
    id v12 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v8;
      uint64_t v14 = v12;
      *(_DWORD *)stat buf = 136446466;
      id v29 = [(__CFString *)v13 UTF8String];
      __int16 v30 = 2114;
      id v31 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    unsigned __int8 v15 = [v4 objectForKeyedSubscript:@"ICProviderEnabled"];
    unsigned int v16 = [v15 BOOLValue];

    id v17 = +[NSNumber numberWithBool:v7];
    [v4 setObject:v17 forKeyedSubscript:@"ICProviderEnabled"];

    if (!v7 || (v16 & 1) != 0)
    {
      if ((v7 | v16 ^ 1))
      {
LABEL_14:

        return;
      }
      unsigned int v24 = *(void **)(a1 + 40);
      id v19 = +[NSURL fileURLWithPath:*(void *)(a1 + 48)];
      uint64_t v25 = v19;
      uint64_t v20 = +[NSArray arrayWithObjects:&v25 count:1];
      double v21 = v24;
      uint64_t v22 = 0;
      id v23 = v20;
    }
    else
    {
      id v18 = *(void **)(a1 + 40);
      id v19 = +[NSURL fileURLWithPath:*(void *)(a1 + 48)];
      __int16 v26 = v19;
      id v27 = v4;
      uint64_t v20 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      double v21 = v18;
      uint64_t v22 = v20;
      id v23 = 0;
    }
    [v21 updatedWithAddedMountPoints:v22 andRemovedMountPoints:v23];

    goto LABEL_14;
  }
}

uint64_t sub_100024814(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void sub_100024DB0()
{
  sub_100009920();
  id v2 = v1;
  id v3 = v0;
  sub_10000992C();
  sub_1000098E8();
  sub_100009900((void *)&_mh_execute_header, v4, v5, "%{public}20s ! %{public}@", v6, v7, v8, v9, v10);
}

void sub_100024E40(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  [v3 UTF8String];
  sub_1000098E8();
  sub_100009900((void *)&_mh_execute_header, v5, v6, "%{public}20s ! %{public}@", v7, v8, v9, v10, v11);
}

void sub_100024EDC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100024F54(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = a2;
  int v7 = 136446466;
  id v8 = [v5 UTF8String];
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}20s ! %{public}@", (uint8_t *)&v7, 0x16u);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

void CFRelease(CFTypeRef cf)
{
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return _CFStringConvertEncodingToNSStringEncoding(encoding);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

CFUUIDRef CFUUIDCreateWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDCreateWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t CGCopyBasicPropertiesOfImageAtPath()
{
  return _CGCopyBasicPropertiesOfImageAtPath();
}

CGImageRef CGImageCreateCopy(CGImageRef image)
{
  return _CGImageCreateCopy(image);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return _CGImageDestinationCreateWithData(data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return _CGImageDestinationFinalize(idst);
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return _CGImageSourceCopyProperties(isrc, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCopyPropertiesAtIndex(isrc, index, options);
}

uint64_t CGImageSourceCopyTypeExtensions()
{
  return _CGImageSourceCopyTypeExtensions();
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithData(data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithURL(url, options);
}

uint64_t CGImageSourceGetTypeWithExtension()
{
  return _CGImageSourceGetTypeWithExtension();
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

CGSize CMVideoFormatDescriptionGetPresentationDimensions(CMVideoFormatDescriptionRef videoDesc, Boolean usePixelAspectRatio, Boolean useCleanAperture)
{
  CGSize PresentationDimensions = _CMVideoFormatDescriptionGetPresentationDimensions(videoDesc, usePixelAspectRatio, useCleanAperture);
  double height = PresentationDimensions.height;
  double width = PresentationDimensions.width;
  result.double height = height;
  result.double width = width;
  return result;
}

uint64_t CPPowerAssertionCreate()
{
  return _CPPowerAssertionCreate();
}

uint64_t MMCSSignatureAndSchemeSize()
{
  return _MMCSSignatureAndSchemeSize();
}

uint64_t MMCSSignatureGeneratorCreateWithBoundaryKey()
{
  return _MMCSSignatureGeneratorCreateWithBoundaryKey();
}

uint64_t MMCSSignatureGeneratorFinish()
{
  return _MMCSSignatureGeneratorFinish();
}

uint64_t MMCSSignatureGeneratorUpdate()
{
  return _MMCSSignatureGeneratorUpdate();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return __CFURLAttachSecurityScopeToFileURL();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
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

int close(int a1)
{
  return _close(a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return _dispatch_data_create(buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return _dispatch_source_get_data(source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

time_t mktime(tm *a1)
{
  return _mktime(a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return _sandbox_extension_issue_file_to_process();
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return _sqlite3_open(filename, ppDb);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strptime_l(const char *a1, const char *a2, tm *a3, locale_t a4)
{
  return _strptime_l(a1, a2, a3, a4);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__createSignatureGenerator(void *a1, const char *a2, ...)
{
  return [a1 _createSignatureGenerator];
}

id objc_msgSend_addSemaphore(void *a1, const char *a2, ...)
{
  return [a1 addSemaphore];
}

id objc_msgSend_addedBundles(void *a1, const char *a2, ...)
{
  return [a1 addedBundles];
}

id objc_msgSend_additionalProperties(void *a1, const char *a2, ...)
{
  return [a1 additionalProperties];
}

id objc_msgSend_allBundleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 allBundleIdentifiers];
}

id objc_msgSend_allConnections(void *a1, const char *a2, ...)
{
  return [a1 allConnections];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return [a1 anonymousListener];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_availSlots(void *a1, const char *a2, ...)
{
  return [a1 availSlots];
}

id objc_msgSend_baseNameKey(void *a1, const char *a2, ...)
{
  return [a1 baseNameKey];
}

id objc_msgSend_beingEjected(void *a1, const char *a2, ...)
{
  return [a1 beingEjected];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bufDict(void *a1, const char *a2, ...)
{
  return [a1 bufDict];
}

id objc_msgSend_bufferCache(void *a1, const char *a2, ...)
{
  return [a1 bufferCache];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_camera(void *a1, const char *a2, ...)
{
  return [a1 camera];
}

id objc_msgSend_cameraDictionary(void *a1, const char *a2, ...)
{
  return [a1 cameraDictionary];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return [a1 cancelAllOperations];
}

id objc_msgSend_cancelReflight(void *a1, const char *a2, ...)
{
  return [a1 cancelReflight];
}

id objc_msgSend_cancelSource(void *a1, const char *a2, ...)
{
  return [a1 cancelSource];
}

id objc_msgSend_captureDate(void *a1, const char *a2, ...)
{
  return [a1 captureDate];
}

id objc_msgSend_clearDevice(void *a1, const char *a2, ...)
{
  return [a1 clearDevice];
}

id objc_msgSend_closeDevice(void *a1, const char *a2, ...)
{
  return [a1 closeDevice];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_closeStream(void *a1, const char *a2, ...)
{
  return [a1 closeStream];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_commonKey(void *a1, const char *a2, ...)
{
  return [a1 commonKey];
}

id objc_msgSend_commonMetadata(void *a1, const char *a2, ...)
{
  return [a1 commonMetadata];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_connections(void *a1, const char *a2, ...)
{
  return [a1 connections];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyIndexedFoldersAndFilesURLs(void *a1, const char *a2, ...)
{
  return [a1 copyIndexedFoldersAndFilesURLs];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createBufferCache(void *a1, const char *a2, ...)
{
  return [a1 createBufferCache];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentSessionCount(void *a1, const char *a2, ...)
{
  return [a1 currentSessionCount];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_decrementStreamCount(void *a1, const char *a2, ...)
{
  return [a1 decrementStreamCount];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deniedBundles(void *a1, const char *a2, ...)
{
  return [a1 deniedBundles];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destroyBufferCache(void *a1, const char *a2, ...)
{
  return [a1 destroyBufferCache];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceAccessQueue(void *a1, const char *a2, ...)
{
  return [a1 deviceAccessQueue];
}

id objc_msgSend_deviceContext(void *a1, const char *a2, ...)
{
  return [a1 deviceContext];
}

id objc_msgSend_deviceMatchingInfo(void *a1, const char *a2, ...)
{
  return [a1 deviceMatchingInfo];
}

id objc_msgSend_deviceOperationQueue(void *a1, const char *a2, ...)
{
  return [a1 deviceOperationQueue];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainsByURLEnabled(void *a1, const char *a2, ...)
{
  return [a1 domainsByURLEnabled];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_exifCreationDateTime(void *a1, const char *a2, ...)
{
  return [a1 exifCreationDateTime];
}

id objc_msgSend_exifModificationDateTime(void *a1, const char *a2, ...)
{
  return [a1 exifModificationDateTime];
}

id objc_msgSend_externalMediaAccessDB(void *a1, const char *a2, ...)
{
  return [a1 externalMediaAccessDB];
}

id objc_msgSend_fd(void *a1, const char *a2, ...)
{
  return [a1 fd];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_filename(void *a1, const char *a2, ...)
{
  return [a1 filename];
}

id objc_msgSend_filesystemChangeDescriptor(void *a1, const char *a2, ...)
{
  return [a1 filesystemChangeDescriptor];
}

id objc_msgSend_filesystemChangeSource(void *a1, const char *a2, ...)
{
  return [a1 filesystemChangeSource];
}

id objc_msgSend_filledStorageCache(void *a1, const char *a2, ...)
{
  return [a1 filledStorageCache];
}

id objc_msgSend_fingerprint(void *a1, const char *a2, ...)
{
  return [a1 fingerprint];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_formatDescriptions(void *a1, const char *a2, ...)
{
  return [a1 formatDescriptions];
}

id objc_msgSend_fullMetadata(void *a1, const char *a2, ...)
{
  return [a1 fullMetadata];
}

id objc_msgSend_hasMetadata(void *a1, const char *a2, ...)
{
  return [a1 hasMetadata];
}

id objc_msgSend_holdPowerAssertion(void *a1, const char *a2, ...)
{
  return [a1 holdPowerAssertion];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imageHeight(void *a1, const char *a2, ...)
{
  return [a1 imageHeight];
}

id objc_msgSend_imageIOSupported(void *a1, const char *a2, ...)
{
  return [a1 imageIOSupported];
}

id objc_msgSend_imageOrientation(void *a1, const char *a2, ...)
{
  return [a1 imageOrientation];
}

id objc_msgSend_imagePixHeight(void *a1, const char *a2, ...)
{
  return [a1 imagePixHeight];
}

id objc_msgSend_imagePixWidth(void *a1, const char *a2, ...)
{
  return [a1 imagePixWidth];
}

id objc_msgSend_imageWidth(void *a1, const char *a2, ...)
{
  return [a1 imageWidth];
}

id objc_msgSend_incrementStreamCount(void *a1, const char *a2, ...)
{
  return [a1 incrementStreamCount];
}

id objc_msgSend_indexedFiles(void *a1, const char *a2, ...)
{
  return [a1 indexedFiles];
}

id objc_msgSend_indexedFolders(void *a1, const char *a2, ...)
{
  return [a1 indexedFolders];
}

id objc_msgSend_indexedMediaSet(void *a1, const char *a2, ...)
{
  return [a1 indexedMediaSet];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_internalUUID(void *a1, const char *a2, ...)
{
  return [a1 internalUUID];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidationHandler(void *a1, const char *a2, ...)
{
  return [a1 invalidationHandler];
}

id objc_msgSend_isDecodable(void *a1, const char *a2, ...)
{
  return [a1 isDecodable];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_locked(void *a1, const char *a2, ...)
{
  return [a1 locked];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_managedObjectName(void *a1, const char *a2, ...)
{
  return [a1 managedObjectName];
}

id objc_msgSend_mediaItemCount(void *a1, const char *a2, ...)
{
  return [a1 mediaItemCount];
}

id objc_msgSend_mediaItemType(void *a1, const char *a2, ...)
{
  return [a1 mediaItemType];
}

id objc_msgSend_mediaPaths(void *a1, const char *a2, ...)
{
  return [a1 mediaPaths];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_metadataDict(void *a1, const char *a2, ...)
{
  return [a1 metadataDict];
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return [a1 modificationDate];
}

id objc_msgSend_mountURLs(void *a1, const char *a2, ...)
{
  return [a1 mountURLs];
}

id objc_msgSend_msFile(void *a1, const char *a2, ...)
{
  return [a1 msFile];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_notifyDeviceReadyObjectCount(void *a1, const char *a2, ...)
{
  return [a1 notifyDeviceReadyObjectCount];
}

id objc_msgSend_notifyDeviceReadyPreflightCount(void *a1, const char *a2, ...)
{
  return [a1 notifyDeviceReadyPreflightCount];
}

id objc_msgSend_objHandle(void *a1, const char *a2, ...)
{
  return [a1 objHandle];
}

id objc_msgSend_objectCompressedSize(void *a1, const char *a2, ...)
{
  return [a1 objectCompressedSize];
}

id objc_msgSend_objectHandle(void *a1, const char *a2, ...)
{
  return [a1 objectHandle];
}

id objc_msgSend_openStream(void *a1, const char *a2, ...)
{
  return [a1 openStream];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return [a1 orderedSet];
}

id objc_msgSend_osTransactions(void *a1, const char *a2, ...)
{
  return [a1 osTransactions];
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return [a1 parent];
}

id objc_msgSend_parentObject(void *a1, const char *a2, ...)
{
  return [a1 parentObject];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pauseReflight(void *a1, const char *a2, ...)
{
  return [a1 pauseReflight];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_preferredTransform(void *a1, const char *a2, ...)
{
  return [a1 preferredTransform];
}

id objc_msgSend_preflight(void *a1, const char *a2, ...)
{
  return [a1 preflight];
}

id objc_msgSend_preflightCount(void *a1, const char *a2, ...)
{
  return [a1 preflightCount];
}

id objc_msgSend_primaryIdentifierString(void *a1, const char *a2, ...)
{
  return [a1 primaryIdentifierString];
}

id objc_msgSend_prioritizeSpeed(void *a1, const char *a2, ...)
{
  return [a1 prioritizeSpeed];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_protectionStatus(void *a1, const char *a2, ...)
{
  return [a1 protectionStatus];
}

id objc_msgSend_providerDisplayName(void *a1, const char *a2, ...)
{
  return [a1 providerDisplayName];
}

id objc_msgSend_rawImageSupported(void *a1, const char *a2, ...)
{
  return [a1 rawImageSupported];
}

id objc_msgSend_readOffset(void *a1, const char *a2, ...)
{
  return [a1 readOffset];
}

id objc_msgSend_readQueue(void *a1, const char *a2, ...)
{
  return [a1 readQueue];
}

id objc_msgSend_reading(void *a1, const char *a2, ...)
{
  return [a1 reading];
}

id objc_msgSend_reflight(void *a1, const char *a2, ...)
{
  return [a1 reflight];
}

id objc_msgSend_reflightCount(void *a1, const char *a2, ...)
{
  return [a1 reflightCount];
}

id objc_msgSend_reflightPauseSource(void *a1, const char *a2, ...)
{
  return [a1 reflightPauseSource];
}

id objc_msgSend_reflightPaused(void *a1, const char *a2, ...)
{
  return [a1 reflightPaused];
}

id objc_msgSend_reflightQueue(void *a1, const char *a2, ...)
{
  return [a1 reflightQueue];
}

id objc_msgSend_reflightRequested(void *a1, const char *a2, ...)
{
  return [a1 reflightRequested];
}

id objc_msgSend_reflightTimer(void *a1, const char *a2, ...)
{
  return [a1 reflightTimer];
}

id objc_msgSend_releasePowerAssertion(void *a1, const char *a2, ...)
{
  return [a1 releasePowerAssertion];
}

id objc_msgSend_remoteCameraDevices(void *a1, const char *a2, ...)
{
  return [a1 remoteCameraDevices];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeAllSessions(void *a1, const char *a2, ...)
{
  return [a1 removeAllSessions];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sessionManager(void *a1, const char *a2, ...)
{
  return [a1 sessionManager];
}

id objc_msgSend_sessions(void *a1, const char *a2, ...)
{
  return [a1 sessions];
}

id objc_msgSend_sharedAccessManager(void *a1, const char *a2, ...)
{
  return [a1 sharedAccessManager];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_smallestEncoding(void *a1, const char *a2, ...)
{
  return [a1 smallestEncoding];
}

id objc_msgSend_startListening(void *a1, const char *a2, ...)
{
  return [a1 startListening];
}

id objc_msgSend_startMSDeviceNotifications(void *a1, const char *a2, ...)
{
  return [a1 startMSDeviceNotifications];
}

id objc_msgSend_stopReading(void *a1, const char *a2, ...)
{
  return [a1 stopReading];
}

id objc_msgSend_storageURLs(void *a1, const char *a2, ...)
{
  return [a1 storageURLs];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_thumbCompressedSize(void *a1, const char *a2, ...)
{
  return [a1 thumbCompressedSize];
}

id objc_msgSend_thumbHeight(void *a1, const char *a2, ...)
{
  return [a1 thumbHeight];
}

id objc_msgSend_thumbOffset(void *a1, const char *a2, ...)
{
  return [a1 thumbOffset];
}

id objc_msgSend_thumbPixHeight(void *a1, const char *a2, ...)
{
  return [a1 thumbPixHeight];
}

id objc_msgSend_thumbPixWidth(void *a1, const char *a2, ...)
{
  return [a1 thumbPixWidth];
}

id objc_msgSend_thumbSize(void *a1, const char *a2, ...)
{
  return [a1 thumbSize];
}

id objc_msgSend_thumbWidth(void *a1, const char *a2, ...)
{
  return [a1 thumbWidth];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_underlyingQueue(void *a1, const char *a2, ...)
{
  return [a1 underlyingQueue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_updateBasicMetadata(void *a1, const char *a2, ...)
{
  return [a1 updateBasicMetadata];
}

id objc_msgSend_updatedBasicMetadata(void *a1, const char *a2, ...)
{
  return [a1 updatedBasicMetadata];
}

id objc_msgSend_updatedExpensiveMetadata(void *a1, const char *a2, ...)
{
  return [a1 updatedExpensiveMetadata];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_uuidString(void *a1, const char *a2, ...)
{
  return [a1 uuidString];
}

id objc_msgSend_videoOrientation(void *a1, const char *a2, ...)
{
  return [a1 videoOrientation];
}

id objc_msgSend_waitUntilAllOperationsAreFinished(void *a1, const char *a2, ...)
{
  return [a1 waitUntilAllOperationsAreFinished];
}