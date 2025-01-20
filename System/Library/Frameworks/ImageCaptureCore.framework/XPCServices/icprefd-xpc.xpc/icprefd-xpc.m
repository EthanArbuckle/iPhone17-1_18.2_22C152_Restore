void __ICOSLogCreate()
{
  if (qword_100014728 != -1) {
    dispatch_once(&qword_100014728, &stru_10000C3A0);
  }
}

void sub_100002768(id a1)
{
  v1 = [+[NSProcessInfo processInfo] processName];
  _gICOSLog = (uint64_t)os_log_create((const char *)[ICLoggingDomain UTF8String], -[NSString UTF8String](v1, "UTF8String"));
}

id sub_1000027C4(void *a1)
{
  uint64_t v1 = qword_100014738;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_100014738, &stru_10000C3D0);
  }
  v3 = [(id)qword_100014730 localizedStringForKey:v2 value:v2 table:@"ImageCaptureCore"];

  return v3;
}

void sub_10000284C(id a1)
{
  qword_100014730 = +[NSBundle bundleWithPath:@"/System/Library/Frameworks/ImageCaptureCore.framework"];

  _objc_release_x1();
}

void sub_1000029F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100002A10(uint64_t a1)
{
  id v2 = [@"/var/mobile/Library/com.apple.imagecapture" stringByAppendingPathComponent:@"externalDeviceAccess.db"];
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
      sub_100008050();
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
      sub_100008050();
    }
  }

LABEL_14:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100002DF0(id a1)
{
  qword_100014740 = objc_alloc_init(ICDeviceAccessManager);

  _objc_release_x1();
}

void sub_100003ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003EE4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003EF4(uint64_t a1)
{
}

void sub_100003EFC(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  errmsg = 0;
  if (sqlite3_exec((sqlite3 *)[*(id *)(a1 + 32) externalMediaAccessDB], (const char *)objc_msgSend(@"SELECT bundle_id FROM external_device_access;", "UTF8String"),
         (int (__cdecl *)(void *, int, char **, char **))sub_100004050,
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
      sub_100008050();
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObjectsFromArray:v2];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t sub_100004050(void *a1, int a2, void *a3)
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
      v10 = +[NSString stringWithFormat:@"%s", *a3];
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

void sub_1000043E0(uint64_t a1)
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

void sub_1000045D4(uint64_t a1)
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
      sub_100008050();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void sub_1000048AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000048C4(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT bundle_id, %@ FROM external_device_access;",
    *(void *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)[v3 UTF8String];

  errmsg = 0;
  if (sqlite3_exec((sqlite3 *)[*(id *)(a1 + 40) externalMediaAccessDB], v4, (int (__cdecl *)(void *, int, char **, char **))sub_100004A38, v2, &errmsg))
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
      sub_100008050();
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v2];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

uint64_t sub_100004A38(void *a1, int a2, uint64_t a3, uint64_t a4)
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
            v10 = +[NSString stringWithFormat:@"%s", *(void *)(a4 + 8 * v8)];
            [v7 setObject:v9 forKeyedSubscript:v10];
            goto LABEL_6;
          case 1:
          case 2:
          case 3:
          case 4:
            v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
            v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 integerValue]);
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

void sub_100005014(uint64_t a1)
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
      sub_100008050();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10000551C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_100005558(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT bundle_id FROM external_device_access WHERE bundle_id IS '%@';",
    *(void *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)[v3 UTF8String];

  errmsg = 0;
  if (sqlite3_exec((sqlite3 *)[*(id *)(a1 + 40) externalMediaAccessDB], v4, (int (__cdecl *)(void *, int, char **, char **))sub_100004A38, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), &errmsg))
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
      sub_100008050();
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v2];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_100005898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_1000058B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100005914(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_100005940()
{
  return [v0 UTF8String];
}

uint64_t sub_100005958(void *a1)
{
  uint64_t result = (uint64_t)[a1 valueForEntitlement:@"com.apple.private.imagecapturecore.authorization_bypass"];
  if (result)
  {
    id v2 = (void *)result;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t result = (uint64_t)[v2 BOOLValue];
      if (result)
      {
        __ICOSLogCreate();
        id v3 = @"privateBypass";
        if ((unint64_t)[@"privateBypass" length] >= 0x15) {
          id v3 = (__CFString *)objc_msgSend(objc_msgSend(@"privateBypass", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
        }
        id v4 = +[NSString stringWithFormat:@"ICAuthorizationBypassEntitlement found"];
        uint64_t v5 = _gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          int v6 = 136446466;
          id v7 = [(__CFString *)v3 UTF8String];
          __int16 v8 = 2114;
          v9 = v4;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v6, 0x16u);
        }
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_100005DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005E28(uint64_t a1, uint64_t a2)
{
}

void sub_100005E38(uint64_t a1)
{
}

id sub_100005E44(id result)
{
  uint64_t v1 = *(void **)(*(void *)(*((void *)result + 5) + 8) + 40);
  if (v1)
  {
    id v2 = result;
    uint64_t result = objc_msgSend(v1, "removeRemoteManagerConnectionWithProcessIdentifier:", objc_msgSend(*((id *)result + 4), "processIdentifier"));
    *(void *)(*(void *)(v2[5] + 8) + 40) = 0;
  }
  return result;
}

void sub_100006194(id a1)
{
  id v11 = objc_alloc((Class)NSSet);
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
  qword_100014750 = (uint64_t)objc_msgSend(v11, "initWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
}

intptr_t sub_100007A70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    __ICOSLogCreate();
    uint64_t v4 = @"fbservice";
    if ((unint64_t)[@"fbservice" length] >= 0x15) {
      uint64_t v4 = (__CFString *)objc_msgSend(objc_msgSend(@"fbservice", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
    }
    uint64_t v5 = +[NSString stringWithFormat:@"Couldn't send to Settings?"];
    uint64_t v6 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136446466;
      id v9 = [(__CFString *)v4 UTF8String];
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t start()
{
  __ICOSLogCreate();
  uint64_t v1 = @"icprefd[xpc]";
  if ((unint64_t)[@"icprefd[xpc]" length] >= 0x15) {
    uint64_t v1 = (__CFString *)objc_msgSend(objc_msgSend(@"icprefd[xpc]", "substringWithRange:", 0, 18), "stringByAppendingString:", @"..");
  }
  uint64_t v2 = +[NSString stringWithFormat:@"%@", @"Launching icprefd [xpc]"];
  uint64_t v3 = _gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v8 = [(__CFString *)v1 UTF8String];
    __int16 v9 = 2114;
    __int16 v10 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  uint64_t v4 = objc_alloc_init(ICRemotePrefManager);
  uint64_t v5 = +[NSXPCListener serviceListener];
  [(NSXPCListener *)v5 setDelegate:v4];
  [(NSXPCListener *)v5 resume];
  [+[NSRunLoop currentRunLoop] run];

  return 0;
}

void sub_100008050()
{
  sub_100005934();
  id v2 = v1;
  id v3 = v0;
  sub_100005940();
  sub_1000058FC();
  sub_100005914((void *)&_mh_execute_header, v4, v5, "%{public}20s ! %{public}@", v6, v7, v8, v9, v10);
}

void CFRelease(CFTypeRef cf)
{
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t TCCAccessCheckAuditToken()
{
  return _TCCAccessCheckAuditToken();
}

uint64_t TCCAccessPreflightWithAuditToken()
{
  return _TCCAccessPreflightWithAuditToken();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_msgSend_allBundleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 allBundleIdentifiers];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
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

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceAccessQueue(void *a1, const char *a2, ...)
{
  return [a1 deviceAccessQueue];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_externalMediaAccessDB(void *a1, const char *a2, ...)
{
  return [a1 externalMediaAccessDB];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidationHandler(void *a1, const char *a2, ...)
{
  return [a1 invalidationHandler];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_osTransactions(void *a1, const char *a2, ...)
{
  return [a1 osTransactions];
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

id objc_msgSend_sharedAccessManager(void *a1, const char *a2, ...)
{
  return [a1 sharedAccessManager];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}