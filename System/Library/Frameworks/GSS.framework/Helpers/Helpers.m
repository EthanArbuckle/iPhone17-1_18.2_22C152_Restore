uint64_t start(unsigned int a1, void *a2)
{
  ManagedAppManager *v2;
  void *v3;
  dispatch_queue_t v4;
  void *v5;
  xpc_connection_t mach_service;
  id v7;
  dispatch_source_t v8;
  NSObject *v9;
  NSRunLoop *v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *v14;
  os_log_type_t v15;
  NSObject *log;
  os_log_type_t type;
  void *v18;
  void **handler;
  int v20;
  int v21;
  void (*v22)(unsigned char *);
  void *v23;
  char v24;
  uint8_t v25[7];
  char v26;
  id v27;
  uint8_t v28[7];
  char v29;
  id v30;
  uint8_t v31[15];
  char v32;
  id location;
  NSObject *v34;
  char v35;
  id v36[2];
  uint64_t v37;

  v37 = a1;
  v36[1] = a2;
  v36[0] = 0;
  v35 = 0;
  os_log_set_client_type();
  umask(0x3Fu);
  _set_user_dir_suffix();
  v34 = 0;
  location = sub_10001120C();
  v32 = 1;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
  {
    log = location;
    type = v32;
    sub_100003CE0(v31);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Starting GSSCred", v31, 2u);
  }
  objc_storeStrong(&location, 0);
  off_100028F20 = (uint64_t (*)(void))sub_100013328;
  off_100028EC8 = sub_1000133E0;
  v2 = objc_alloc_init(ManagedAppManager);
  v3 = (void *)qword_100028F08;
  qword_100028F08 = (uint64_t)v2;

  off_100028ED0 = sub_100013554;
  off_100028ED8 = &xpc_connection_get_euid;
  off_100028EE0 = &xpc_connection_get_asid;
  off_100028EE8 = sub_10001902C;
  off_100028EF0 = sub_1000194F4;
  *(void *)algn_100028EF8 = sub_100013604;
  off_100028F00 = sub_100013660;
  off_100028F18 = (uint64_t (*)(void, void))sub_100013678;
  byte_100028EC0 = sub_1000136B8() & 1;
  byte_100028F10 = sub_100013738() & 1;
  qword_100028F28 = (uint64_t)sub_1000174FC;
  qword_100028F30 = (uint64_t)sub_100016B90;
  qword_100028F38 = (uint64_t)sub_1000180F0;
  qword_100028F40 = (uint64_t)sub_100003A70;
  qword_100028F48 = sub_1000137B8();
  byte_100028F11 = sub_100013878() & 1;
  qword_100028F50 = objc_opt_class();
  off_100028F58 = (uint64_t (*)(void))sub_1000138F8;
  qword_100028F90 = (uint64_t)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!qword_100028F90) {
    heim_abort();
  }
  qword_100028F98 = (uint64_t)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!qword_100028F98) {
    heim_abort();
  }
  qword_100028FA0 = (uint64_t)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!qword_100028FA0) {
    heim_abort();
  }
  sub_100002F70();
  sub_10000E4DC();
  sub_1000031E8();
  sub_1000112E8();
  sub_1000126A8();
  sub_100019958();
  nullsub_1();
  if (qword_100028FA0)
  {
    CFRelease((CFTypeRef)qword_100028FA0);
    qword_100028FA0 = 0;
  }
  objc_storeStrong((id *)&qword_100028EB8, @"/var/db/heim-credential-store.archive");
  v4 = dispatch_queue_create("com.apple.GSSCred", 0);
  v5 = (void *)qword_100029010;
  qword_100029010 = (uint64_t)v4;

  if (!qword_100029010) {
    heim_abort();
  }
  heim_ipc_init_globals();
  sub_100012AB8();
  sub_100003D44();
  sub_10001394C();
  mach_service = xpc_connection_create_mach_service("com.apple.GSSCred", (dispatch_queue_t)qword_100029010, 1uLL);
  v7 = v36[0];
  v36[0] = mach_service;

  xpc_connection_set_event_handler((xpc_connection_t)v36[0], &stru_100025008);
  heim_ipc_resume_events();
  xpc_connection_resume((xpc_connection_t)v36[0]);
  if (v35)
  {
    v30 = sub_10001AEC8();
    v29 = 1;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_INFO))
    {
      v14 = v30;
      v15 = v29;
      sub_100003CE0(v28);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Starting run loop", v28, 2u);
    }
    objc_storeStrong(&v30, 0);
  }
  else
  {
    v27 = sub_10001120C();
    v26 = 1;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_INFO))
    {
      v12 = v27;
      v13 = v26;
      sub_100003CE0(v25);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Starting run loop", v25, 2u);
    }
    objc_storeStrong(&v27, 0);
  }
  v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)qword_100029010);
  v9 = v34;
  v34 = v8;

  handler = _NSConcreteStackBlock;
  v20 = -1073741824;
  v21 = 0;
  v22 = sub_100013EC8;
  v23 = &unk_100025028;
  v24 = v35 & 1;
  dispatch_source_set_event_handler(v34, &handler);
  dispatch_activate(v34);
  signal(15, (void (__cdecl *)(int))1);
  v11 = +[NSRunLoop currentRunLoop];
  [(NSRunLoop *)v11 run];

  HIDWORD(v37) = 0;
  objc_storeStrong((id *)&v34, 0);
  objc_storeStrong(v36, 0);
  return HIDWORD(v37);
}

void heim_ipc_init_globals()
{
  if (qword_1000290D8 != -1) {
    dispatch_once(&qword_1000290D8, &stru_100025310);
  }
}

void sub_100002F70()
{
  Mutable = CFSetCreateMutable(0, 0, &kCFTypeSetCallBacks);
  value = sub_10000D8E0(@"kHEIMObjectGeneric");
  CFSetAddValue(Mutable, value);
  if (value) {
    CFRelease(value);
  }
  sub_10000D590(@"kHEIMTypeGeneric", Mutable, (uint64_t)sub_10000DB44, 0, 0, (uint64_t)sub_10000E040, 0, 0);
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void sub_100003074(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  if (!*(void *)(a2 + 32)) {
    heim_abort();
  }
  if (!CFDictionaryGetValue(a3, @"kHEIMAttrParentCredential"))
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), *(const void **)(*(void *)(a2 + 32) + 16));
    CFBooleanRef BOOLean = (const __CFBoolean *)CFDictionaryGetValue(a3, @"kHEIMAttrDefaultCredential");
    if (BOOLean)
    {
      if (CFBooleanGetValue(BOOLean))
      {
        if (Value) {
          sub_10000F378(Value, a1, 0);
        }
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), *(const void **)(*(void *)(a2 + 32) + 16), *(const void **)(a2 + 16));
        if (*(void *)(*(void *)(a2 + 32) + 40)) {
          (*(void (**)(void))(*(void *)(a2 + 32) + 40))();
        }
      }
    }
  }
}

void sub_1000031E8()
{
  Mutable = CFSetCreateMutable(0, 0, &kCFTypeSetCallBacks);
  v0 = sub_10000D8E0(@"kHEIMObjectKerberos");
  CFDictionarySetValue(v0, @"kHEIMAttrTransient", @"b");
  CFDictionarySetValue(v0, @"kHEIMAttrStatus", @"n");
  CFDictionarySetValue(v0, @"kHEIMAttrAuthTime", @"t");
  CFDictionarySetValue(v0, @"kHEIMAttrExpire", @"t");
  CFDictionarySetValue(v0, @"kHEIMAttrRenewTill", @"t");
  CFDictionarySetValue(v0, @"kHEIMAttrKerberosTicketGrantingTicket", @"b");
  CFSetAddValue(Mutable, v0);
  if (v0) {
    CFRelease(v0);
  }
  sub_10000D590(@"kHEIMTypeKerberos", Mutable, (uint64_t)sub_10000DB44, 0, qword_100028F40, (uint64_t)sub_10000E040, 0, 0);
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void sub_100003398()
{
  char v2 = 0;
  id v3 = objc_alloc_init((Class)NSMutableDictionary);

  CFDictionaryApplyFunction((CFDictionaryRef)qword_100028F80, (CFDictionaryApplierFunction)sub_1000035D8, v3);
  id location = objc_alloc_init((Class)NSMutableDictionary);
  CFDictionaryApplyFunction((CFDictionaryRef)qword_100028F88, (CFDictionaryApplierFunction)sub_100003808, location);
  [v3 setObject:location forKeyedSubscript:off_100028D68];
  +[HeimCredDecoder archiveRootObject:v3 toFile:qword_100028EB8];
  objc_storeStrong(&location, 0);
  if (v2) {
    objc_exception_rethrow();
  }
  objc_storeStrong(&v3, 0);
}

void sub_1000035D8(uint64_t a1, uint64_t a2, void *a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19, id a20)
{
  uint64_t v24 = a1;
  uint64_t v23 = a2;
  v22[1] = a3;
  v22[0] = a3;
  id location = objc_alloc_init((Class)NSMutableDictionary);

  CFDictionaryApplyFunction(*(CFDictionaryRef *)(v23 + 24), (CFDictionaryApplierFunction)sub_100003808, location);
  v20 = +[NSNumber numberWithInt:*(unsigned int *)(v23 + 16)];
  objc_msgSend(v22[0], "setObject:forKey:", location);

  objc_storeStrong(&location, 0);
  objc_storeStrong(v22, 0);
}

void sub_100003808(uint64_t a1, char *a2, void *a3)
{
  uint64_t v15 = a1;
  v14 = a2;
  v13[1] = a3;
  v13[0] = a3;
  v12 = v14;
  CFRetain(v14);
  id v11 = +[HeimCredDecoder copyCF2NS:v15];
  id v10 = 0;
  if (sub_10000F2F4((uint64_t)v14))
  {
    pthread_mutex_lock((pthread_mutex_t *)(v12 + 40));
    CFDateRef value = CFDateCreate(0, (double)*((uint64_t *)v12 + 16) - kCFAbsoluteTimeIntervalSince1970);
    CFNumberRef cf = CFNumberCreate(0, kCFNumberIntType, v12 + 144);
    pthread_mutex_unlock((pthread_mutex_t *)(v12 + 40));
    theDict = CFDictionaryCreateMutableCopy(0, 0, *((CFDictionaryRef *)v12 + 3));
    CFDictionarySetValue(theDict, @"kHEIMAttrExpire", value);
    CFDictionarySetValue(theDict, @"kHEIMAttrStatus", cf);
    id v3 = +[HeimCredDecoder copyCF2NS:theDict];
    id v4 = v10;
    id v10 = v3;

    if (theDict) {
      CFRelease(theDict);
    }
    if (value) {
      CFRelease(value);
    }
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    id v5 = +[HeimCredDecoder copyCF2NS:*((void *)v12 + 3)];
    id v6 = v10;
    id v10 = v5;
  }
  CFRelease(v12);
  [v13[0] setObject:v10 forKey:v11];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(v13, 0);
}

void sub_100003A70()
{
  id v0 = &_dispatch_main_q;
  dispatch_async((dispatch_queue_t)v0, &stru_1000249F0);
}

void sub_100003AB8(id a1)
{
  id v11 = a1;
  id v10 = a1;
  unint64_t v9 = 0;
  unint64_t v8 = 0;
  if (!dword_100028FB8)
  {
    unint64_t v9 = sub_100003C68();
    if (v9 >= qword_100028FB0) {
      unint64_t v8 = v9 - qword_100028FB0;
    }
    else {
      unint64_t v8 = 500000000;
    }
    id location = sub_10001120C();
    char v6 = 2;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      log = location;
      os_log_type_t type = v6;
      sub_100003CE0(v5);
      _os_log_debug_impl((void *)&_mh_execute_header, log, type, "sending cache changed notification", v5, 2u);
    }
    objc_storeStrong(&location, 0);
    if (v8 < 0x1DCD6500)
    {
      dword_100028FB8 = 1;
      dispatch_time_t when = dispatch_time(0, 500000000 - v8);
      id v2 = &_dispatch_main_q;
      dispatch_after(when, (dispatch_queue_t)v2, &stru_100024A10);
    }
    else
    {
      notify_post("com.apple.Kerberos.cache.changed");
      qword_100028FB0 = v9;
    }
  }
}

uint64_t sub_100003C68()
{
  uint64_t v2 = mach_absolute_time();
  if (!qword_100028FC0)
  {
    mach_timebase_info v1 = 0;
    mach_timebase_info(&v1);
    qword_100028FC0 = v1.numer / v1.denom;
  }
  return v2 * qword_100028FC0;
}

unsigned char *sub_100003CE0(unsigned char *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

void sub_100003CFC(id a1)
{
  dword_100028FB8 = 0;
  qword_100028FB0 = sub_100003C68();
  notify_post("com.apple.Kerberos.cache.changed");
}

uint64_t sub_100003D44()
{
  id v9 = 0;
  uint64_t v8 = 0x100000;
  id v3 = +[NSFileManager defaultManager];
  id v7 = [(NSFileManager *)v3 attributesOfItemAtPath:qword_100028EB8 error:0];

  id v6 = [v7 objectForKeyedSubscript:NSFileSize];
  if ((uint64_t)[v6 longLongValue] <= 0x100000)
  {
    id v2 = +[HeimCredDecoder copyUnarchiveObjectWithFileSecureEncoding:qword_100028EB8];
    id v0 = v9;
    id v9 = v2;

    if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v9 enumerateKeysAndObjectsUsingBlock:&stru_100024A50];
      unsigned int v10 = 0;
    }
    else
    {
      unsigned int v10 = 1;
    }
  }
  else
  {
    id location = sub_10001120C();
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      sub_100004238((uint64_t)v11, (uint64_t)v6, v8);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)location, OS_LOG_TYPE_ERROR, "The archive file size %@ exceeds the max limit of %lld. Aborting the load.", v11, 0x16u);
    }
    objc_storeStrong(&location, 0);
    unsigned int v10 = 2;
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v9, 0);
  return v10;
}

void sub_100004228()
{
  _Unwind_Resume(v0);
}

uint64_t sub_100004238(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_100004288(id a1, id a2, id a3, BOOL *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v15 = 0;
  objc_storeStrong(&v15, a3);
  v14 = a4;
  id v13 = a1;
  unsigned int valuePtr = [location[0] intValue];
  if (valuePtr == [off_100028D68 intValue])
  {
    id v11 = v15;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v11 enumerateKeysAndObjectsUsingBlock:&stru_100024A70];
      int v10 = 1;
    }
    else
    {
      int v10 = 1;
    }
    objc_storeStrong(&v11, 0);
  }
  else if (byte_100028F10 & 1) != 0 || (off_100028F00(valuePtr))
  {
    id v9 = (CFDictionaryRef *)sub_100004A54(valuePtr);
    if (v9)
    {
      id v8 = v15;
      if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:");
        CFDictionaryApplyFunction((CFDictionaryRef)qword_100028F90, (CFDictionaryApplierFunction)sub_100005180, v9);
        if (CFDictionaryGetCount(v9[3]))
        {
          CFRelease(v9);
        }
        else
        {
          CFNumberRef key = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
          CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_100028F80, key);
          CFRelease(v9);
          id v9 = 0;
          if (key) {
            CFRelease(key);
          }
        }
        int v10 = 0;
      }
      else
      {
        CFRelease(v9);
        id v9 = 0;
        int v10 = 1;
      }
      objc_storeStrong(&v8, 0);
      if (!v10) {
        int v10 = 0;
      }
    }
    else
    {
      int v10 = 1;
    }
  }
  else
  {
    int v10 = 1;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

void sub_100004630(id a1, id a2, id a3, BOOL *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v8 = 0;
  objc_storeStrong(&v8, a3);
  id v7 = +[HeimCredDecoder copyNS2CF:location[0]];
  CFTypeRef cf = +[HeimCredDecoder copyNS2CF:v8];
  if (v7 && cf)
  {
    CFDateRef value = (void *)sub_100013270(v7);
    if (value)
    {
      if (sub_10000481C((uint64_t)value, (const __CFDictionary *)cf))
      {
        *((void *)value + 3) = CFRetain(cf);
        if (!sub_10000496C((CFDictionaryRef *)value)) {
          CFDictionarySetValue((CFMutableDictionaryRef)qword_100028F88, *((const void **)value + 2), value);
        }
      }
    }
    if (value) {
      CFRelease(value);
    }
  }
  if (v7) {
    CFRelease(v7);
  }
  if (cf) {
    CFRelease(cf);
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

uint64_t sub_10000481C(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t v9 = a1;
  CFDictionaryRef v8 = a2;
  if (*(void *)(a1 + 32)) {
    heim_abort();
  }
  CFTypeRef v7 = 0;
  CFDictionaryRef v4 = v8;
  CFTypeID TypeID = CFStringGetTypeID();
  CFTypeRef key = sub_10000D4D0(v4, @"kHEIMAttrType", TypeID, (uint64_t)&v7);
  if (key && (Value = CFDictionaryGetValue((CFDictionaryRef)qword_100028F90, key)) != 0)
  {
    *(void *)(v9 + 32) = Value;
    char v10 = 1;
  }
  else
  {
    if (v7)
    {
      CFRelease(v7);
      CFTypeRef v7 = 0;
    }
    char v10 = 0;
  }
  return v10 & 1;
}

BOOL sub_10000496C(CFDictionaryRef *a1)
{
  v5[1] = a1;
  v5[0] = (id)(id)CFDictionaryGetValue(a1[3], @"kHEIMAttrStoreTime");
  id v3 = +[NSDate date];
  id v2 = [v5[0] dateByAddingTimeInterval:(double)heim_ntlm_time_skew];
  id v4 = -[NSDate compare:](v3, "compare:");

  objc_storeStrong(v5, 0);
  return v4 == (id)1;
}

const void *sub_100004A54(int a1)
{
  int valuePtr = a1;
  CFNumberRef v2 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  if (!v2) {
    heim_abort();
  }
  Value = CFDictionaryGetValue((CFDictionaryRef)qword_100028F80, v2);
  if (Value)
  {
    if (v2) {
      CFRelease(v2);
    }
    CFRetain(Value);
    return Value;
  }
  else
  {
    if (!sub_10000D454()) {
      heim_abort();
    }
    uint64_t Instance = _CFRuntimeCreateInstance();
    if (!Instance) {
      heim_abort();
    }
    *(_DWORD *)(Instance + 16) = valuePtr;
    *(void *)(Instance + 24) = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    *(void *)(Instance + 32) = qword_100028F88;
    CFRetain(*(CFTypeRef *)(Instance + 32));
    *(void *)(Instance + 40) = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    *(_DWORD *)(Instance + 48) = 0;
    CFDictionarySetValue((CFMutableDictionaryRef)qword_100028F80, v2, (const void *)Instance);
    if (v2) {
      CFRelease(v2);
    }
    return (const void *)Instance;
  }
}

void sub_100004C88(uint64_t *a1, void *a2, void *a3, uint64_t a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v14 = 0;
  objc_storeStrong(&v14, a3);
  uint64_t v13 = a4;
  v12 = a1;
  id v11 = +[HeimCredDecoder copyNS2CF:location[0]];
  CFDictionaryRef v10 = +[HeimCredDecoder copyNS2CF:v14];
  if (v11 && v10)
  {
    CFTypeRef cf = (CFTypeRef)sub_100013270(v11);
    if (byte_100028F10)
    {
      id v8 = (id)CFDictionaryGetValue(v10, @"kHEIMAttrASID");
      if ((!v8 || (((uint64_t (*)(id))off_100028F00)([v8 intValue]) & 1) == 0) && cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      objc_storeStrong(&v8, 0);
    }
    if (cf && (sub_10000481C((uint64_t)cf, v10) & 1) != 0)
    {
      CFTypeRef v4 = CFRetain(v10);
      *((void *)cf + 3) = v4;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1[4] + 24), *((const void **)cf + 2), cf);
      if (!sub_100004F5C(*((const __CFDictionary **)cf + 3))) {
        sub_100003074(a1[4], (uint64_t)cf, *((const __CFDictionary **)cf + 3));
      }
      sub_100004FE4((uint64_t)cf, a1[4]);
    }
    if (cf) {
      CFRelease(cf);
    }
  }
  if (v11)
  {
    CFRelease(v11);
    id v11 = 0;
  }
  if (v10)
  {
    CFRelease(v10);
    CFDictionaryRef v10 = 0;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

BOOL sub_100004F5C(const __CFDictionary *a1)
{
  BOOL v2 = 0;
  if (CFDictionaryContainsKey(a1, @"kHEIMAttrTemporaryCache")) {
    return CFDictionaryGetValue(a1, @"kHEIMAttrTemporaryCache") == kCFBooleanTrue;
  }
  return v2;
}

void sub_100004FE4(uint64_t a1, uint64_t a2)
{
  if (CFEqual(*(CFTypeRef *)(*(void *)(a1 + 32) + 16), @"kHEIMTypeKerberos")
    || CFEqual(*(CFTypeRef *)(*(void *)(a1 + 32) + 16), @"kHEIMTypeKerberosAcquireCred"))
  {
    *(_DWORD *)(a1 + 148) = *(_DWORD *)(a2 + 16);
    CFTypeRef cf = (CFTypeRef)sub_100012B18(a1);
    *(void *)(a1 + 168) = CFRetain(cf);
    *(void *)(a1 + 136) = heim_ipc_event_cf_create_f(qword_100028F28, cf);
    if (cf) {
      CFRelease(cf);
    }
    CFTypeRef v2 = (CFTypeRef)sub_100012B18(a1);
    *(void *)(a1 + 160) = CFRetain(v2);
    *(void *)(a1 + 112) = heim_ipc_event_cf_create_f(qword_100028F30, v2);
    if (v2) {
      CFRelease(v2);
    }
    heim_ipc_event_set_final_f(*(void *)(a1 + 112), qword_100028F38);
    heim_ipc_event_set_final_f(*(void *)(a1 + 136), qword_100028F38);
    sub_100009314(a1);
  }
}

void sub_100005180(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = a1;
  uint64_t v18 = a2;
  uint64_t v17 = a3;
  uint64_t v16 = a2;
  uint64_t v15 = a3;
  id v14 = 0;
  id v14 = CFDictionaryGetValue(*(CFDictionaryRef *)(a3 + 40), *(const void **)(a2 + 16));
  if (v14)
  {
    if (CFDictionaryGetValue(*(CFDictionaryRef *)(v15 + 24), v14)) {
      return;
    }
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v15 + 40), *(const void **)(v16 + 16));
    id location = sub_10001120C();
    os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      sub_100006434((uint64_t)v21, *(void *)(v16 + 16));
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)location, v12, "The default credential for %@ does not exist.", v21, 0xCu);
    }
    objc_storeStrong(&location, 0);
  }
  id v11 = *(id *)(v15 + 24);
  oslog[1] = (os_log_t)_NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  CFTypeRef v7 = sub_10000F478;
  id v8 = &unk_100024B40;
  uint64_t v9 = v15;
  uint64_t v10 = v16;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:");
  id v14 = CFDictionaryGetValue(*(CFDictionaryRef *)(v15 + 40), *(const void **)(v16 + 16));
  if (!v14)
  {
    oslog[0] = (os_log_t)sub_10001120C();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
    {
      sub_100006434((uint64_t)v20, *(void *)(v16 + 16));
      _os_log_debug_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEBUG, "A default credential for %@ could not be identified.", v20, 0xCu);
    }
    objc_storeStrong((id *)oslog, 0);
    CFUUIDRef value = CFUUIDCreate(0);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(v15 + 40), *(const void **)(v16 + 16), value);
    if (value) {
      CFRelease(value);
    }
  }
  if (*(void *)(v16 + 40)) {
    (*(void (**)(void))(v16 + 40))();
  }
  objc_storeStrong(&v11, 0);
}

uint64_t sub_1000054B8(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 32;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_100005508(void *a1, void *a2, void *a3)
{
  v48 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v46 = 0;
  objc_storeStrong(&v46, a3);
  MutableCopy = 0;
  uint64_t v44 = 0;
  v43 = 0;
  char v42 = 0;
  v41 = 0;
  CFBooleanRef v40 = 0;
  BOOL v39 = 0;
  id v38 = sub_10001120C();
  os_log_type_t v37 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEBUG))
  {
    sub_100006434((uint64_t)v55, (uint64_t)location);
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v38, v37, "Begin Create Cred: %@", v55, 0xCu);
  }
  objc_storeStrong(&v38, 0);
  id v13 = location;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  CFDictionaryRef v36 = (const __CFDictionary *)sub_100012950(v13, "attributes", TypeID);
  if (v36)
  {
    if ((sub_100006474(v36, (__CFError *)&v41) & 1) == 0)
    {
LABEL_33:
      sub_1000066C8(v46, v41);
      goto LABEL_75;
    }
    BOOL v12 = 1;
    if (!sub_100004F5C(v36)) {
      BOOL v12 = sub_1000067A0(v48[7], v36);
    }
    BOOL v39 = v12;
    v35 = CFDictionaryGetValue(v36, @"kHEIMAttrParentCredential");
    if (!v35 || (sub_100006894(v48, v35, &v42) & 1) != 0)
    {
      v43 = CFDictionaryGetValue(v36, @"kHEIMAttrUUID");
      if (v43)
      {
        CFRetain(v43);
        CFTypeID v11 = CFGetTypeID(v43);
        if (v11 != CFUUIDGetTypeID() || CFDictionaryGetValue(*(CFDictionaryRef *)(v48[7] + 24), v43)) {
          goto LABEL_75;
        }
      }
      else
      {
        v43 = CFUUIDCreate(0);
        if (!v43) {
          goto LABEL_75;
        }
      }
      if ((sub_1000071B8(v48, v36, (__CFError *)&v41) & 1) == 0) {
        goto LABEL_33;
      }
      uint64_t v44 = sub_100013270(v43);
      if (v44)
      {
        MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v36);
        if (MutableCopy)
        {
          char v34 = sub_100007A5C((uint64_t)v48, MutableCopy) & 1;
          if (v34)
          {
            if ((sub_100007C0C((uint64_t)v48) & 1) == 0)
            {
              CFTypeRef v33 = CFDictionaryGetValue(MutableCopy, @"kHEIMAttrBundleIdentifierACL");
              if (!v33 || (CFTypeID v10 = CFGetTypeID(v33), v10 != CFArrayGetTypeID()) || CFArrayGetCount((CFArrayRef)v33) != 1)
              {
                id v32 = sub_10001120C();
                os_log_type_t v31 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
                {
                  id v8 = v32;
                  os_log_type_t v9 = v31;
                  sub_100003CE0(v30);
                  _os_log_error_impl((void *)&_mh_execute_header, v8, v9, "peer sent more then one bundle id and is not accountsd", v30, 2u);
                }
                objc_storeStrong(&v32, 0);
                goto LABEL_75;
              }
            }
          }
          if ((v42 & 1) == 0 && (v34 & 1) == 0)
          {
            values = 0;
            values = (void *)v48[1];
            CFUUIDRef value = CFArrayCreate(0, (const void **)&values, 1, &kCFTypeArrayCallBacks);
            if (!value) {
              heim_abort();
            }
            CFDictionarySetValue(MutableCopy, @"kHEIMAttrBundleIdentifierACL", value);
            if (value)
            {
              CFRelease(value);
              CFUUIDRef value = 0;
            }
          }
          CFDictionarySetValue(MutableCopy, @"kHEIMAttrUUID", v43);
          if ((sub_100006474(MutableCopy, (__CFError *)&v41) & 1) == 0) {
            goto LABEL_33;
          }
          if (sub_10000481C(v44, MutableCopy))
          {
            sub_100007C88(v44, MutableCopy);
            if (!v39) {
              sub_100003074(v48[7], v44, MutableCopy);
            }
            if ((byte_100028EC0 & 1) == 0) {
              goto LABEL_43;
            }
            id v6 = (id)off_100028EC8();
            id v49 = 0;
            objc_storeStrong(&v49, v6);
            id v7 = v49;
            objc_storeStrong(&v49, 0);

            CFTypeRef cf = v7;
            if (v7)
            {
              CFDictionarySetValue(MutableCopy, @"kHEIMAttrAltDSID", cf);
              CFRelease(cf);
              CFTypeRef cf = 0;
LABEL_43:
              if (byte_100028F10)
              {
                int v24 = 0;
                int v24 = off_100028ED8(*v48);
                CFTypeRef v23 = CFNumberCreate(0, kCFNumberIntType, &v24);
                if (v24) {
                  CFDictionarySetValue(MutableCopy, @"kHEIMAttrUserID", v23);
                }
                if (v23)
                {
                  CFRelease(v23);
                  CFTypeRef v23 = 0;
                }
                int v22 = 0;
                int v22 = off_100028EE0(*v48);
                CFTypeRef v21 = CFNumberCreate(0, kCFNumberIntType, &v22);
                CFDictionarySetValue(MutableCopy, @"kHEIMAttrASID", v21);
                if (v21)
                {
                  CFRelease(v21);
                  CFTypeRef v21 = 0;
                }
              }
              if (!v35) {
                CFDictionarySetValue(MutableCopy, @"kHEIMAttrRetainStatus", &off_100026360);
              }
              *(void *)(v44 + 24) = CFRetain(MutableCopy);
              CFDictionarySetValue(*(CFMutableDictionaryRef *)(v48[7] + 24), *(const void **)(v44 + 16), (const void *)v44);
              if (CFDictionaryGetValue(*(CFDictionaryRef *)(v44 + 24), @"kHEIMAttrLeadCredential") == kCFBooleanTrue
                && *(void *)(*(void *)(v44 + 32) + 40))
              {
                (*(void (**)(void))(*(void *)(v44 + 32) + 40))();
              }
              byte_100028FAC = 1;
              if (!*(void *)(v44 + 32)) {
                heim_abort();
              }
              CFTypeRef key = 0;
              CFTypeRef key = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(v48[7] + 40), *(const void **)(*(void *)(v44 + 32) + 16));
              if (!v39 && (!key || !CFDictionaryGetValue(*(CFDictionaryRef *)(v48[7] + 24), key)))
              {
                CFBooleanRef v40 = (CFBooleanRef)CFDictionaryGetValue(*(CFDictionaryRef *)(v44 + 24), @"kHEIMAttrLeadCredential");
                if (v40)
                {
                  if (CFBooleanGetValue(v40))
                  {
                    *(_DWORD *)(v48[7] + 48) = 1;
                    sub_100007D9C((uint64_t)v48);
                  }
                }
              }
              sub_100004FE4(v44, v48[7]);
              CFTypeRef v19 = 0;
              CFTypeRef v19 = sub_100007E18(*(const __CFDictionary **)(v44 + 24), (__CFError *)&v41);
              if (v41)
              {
                os_log_t v18 = (os_log_t)sub_10001120C();
                os_log_type_t v17 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  sub_100006434((uint64_t)v51, (uint64_t)v41);
                  _os_log_error_impl((void *)&_mh_execute_header, v18, v17, "error filtering attributes: %@", v51, 0xCu);
                }
                objc_storeStrong((id *)&v18, 0);
                if (v41)
                {
                  CFRelease(v41);
                  v41 = 0;
                }
              }
              sub_100012A28(v46, "attributes");
              if (v19)
              {
                CFRelease(v19);
                CFTypeRef v19 = 0;
              }
              if (*(void *)(*(void *)(v44 + 32) + 24))
              {
                CFTypeRef v16 = 0;
                CFTypeRef v16 = (CFTypeRef)(*(uint64_t (**)(uint64_t))(*(void *)(v44 + 32) + 24))(v44);
                os_log_t v15 = (os_log_t)sub_10001120C();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
                {
                  sub_100007FF4((uint64_t)v50, (uint64_t)v16);
                  _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "End Create Cred: %{private}@", v50, 0xCu);
                }
                objc_storeStrong((id *)&v15, 0);
                if (v16)
                {
                  CFRelease(v16);
                  CFTypeRef v16 = 0;
                }
              }
              goto LABEL_75;
            }
            os_log_t oslog = (os_log_t)sub_10001120C();
            os_log_type_t v26 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              CFTypeRef v4 = oslog;
              os_log_type_t v5 = v26;
              sub_100003CE0(v25);
              _os_log_error_impl((void *)&_mh_execute_header, v4, v5, "the device is multiuser and is missing the altDSID", v25, 2u);
            }
            objc_storeStrong((id *)&oslog, 0);
            CFStringRef v53 = @"CommonErrorCode";
            CFBooleanRef v52 = kCFBooleanTrue;
            sub_100007D24((CFErrorRef)&v41, 564486, (const void *const *)&v53, (const void *const *)&v52, 1);
            sub_1000066C8(v46, v41);
          }
        }
      }
    }
  }
LABEL_75:
  if (MutableCopy)
  {
    CFRelease(MutableCopy);
    MutableCopy = 0;
  }
  if (v36)
  {
    CFRelease(v36);
    CFDictionaryRef v36 = 0;
  }
  if (v44)
  {
    CFRelease((CFTypeRef)v44);
    uint64_t v44 = 0;
  }
  if (v43)
  {
    CFRelease(v43);
    v43 = 0;
  }
  if (v41)
  {
    CFRelease(v41);
    v41 = 0;
  }
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&location, 0);
}

uint64_t sub_100006434(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t sub_100006474(const __CFDictionary *a1, __CFError *a2)
{
  CFDictionaryRef v10 = a1;
  CFErrorRef v9 = a2;
  if (!a2) {
    heim_abort();
  }
  memset(__b, 0, sizeof(__b));
  __b[0] = 0;
  __b[1] = v10;
  __b[2] = 0;
  __b[3] = v9;
  LOBYTE(__b[4]) = 1;
  CFDictionaryRef v6 = v10;
  CFTypeID TypeID = CFStringGetTypeID();
  CFTypeRef v7 = sub_10000D4D0(v6, @"kHEIMObjectType", TypeID, (uint64_t)v9);
  if (v7)
  {
    CFDictionaryRef v5 = (const __CFDictionary *)qword_100028F98;
    CFTypeID v3 = CFDictionaryGetTypeID();
    __b[0] = (CFDictionaryRef)sub_10000D4D0(v5, v7, v3, (uint64_t)v9);
    if (__b[0])
    {
      CFDictionaryApplyFunction(v10, (CFDictionaryApplierFunction)sub_100010518, __b);
      CFDictionaryApplyFunction(__b[0], (CFDictionaryApplierFunction)sub_1000106AC, __b);
      char v11 = (uint64_t)__b[4] & 1;
    }
    else
    {
      CFStringRef v13 = @"CommonErrorCode";
      CFBooleanRef v12 = kCFBooleanTrue;
      sub_100007D24(v9, 564482, (const void *const *)&v13, (const void *const *)&v12, 1);
      char v11 = 0;
    }
  }
  else
  {
    CFStringRef v15 = @"CommonErrorCode";
    CFBooleanRef v14 = kCFBooleanTrue;
    sub_100007D24(v9, 564481, (const void *const *)&v15, (const void *const *)&v14, 1);
    char v11 = 0;
  }
  return v11 & 1;
}

void sub_1000066C8(void *a1, __CFError *a2)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  CFErrorRef v7 = a2;
  if (a2)
  {
    id v5 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t xdict = v5;
    int64_t Code = CFErrorGetCode(v7);
    xpc_dictionary_set_int64(xdict, "error-code", Code);
    xpc_dictionary_set_value(location, "error", v5);
    objc_storeStrong(&v5, 0);
    int v6 = 0;
  }
  else
  {
    int v6 = 1;
  }
  objc_storeStrong(&location, 0);
}

BOOL sub_1000067A0(uint64_t a1, const __CFDictionary *a2)
{
  BOOL v5 = 0;
  CFTypeRef key = (void *)CFDictionaryGetValue(a2, @"kHEIMAttrParentCredential");
  if (key)
  {
    Value = (CFDictionaryRef *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), key);
    if (Value)
    {
      if (CFDictionaryContainsKey(Value[3], @"kHEIMAttrTemporaryCache")) {
        return CFDictionaryGetValue(Value[3], @"kHEIMAttrTemporaryCache") == kCFBooleanTrue;
      }
    }
  }
  return v5;
}

uint64_t sub_100006894(void *a1, const void *a2, unsigned char *a3)
{
  v47 = a1;
  id v46 = a2;
  v45 = a3;
  int v44 = 10;
  char v43 = 0;
  if (a3) {
    unsigned char *v45 = 0;
  }
  CFTypeID v17 = CFGetTypeID(v46);
  if (v17 == CFUUIDGetTypeID())
  {
    while (1)
    {
      Value = 0;
      Value = (CFDictionaryRef *)CFDictionaryGetValue(*(CFDictionaryRef *)(v47[7] + 24), v46);
      CFTypeRef v41 = 0;
      if (!Value)
      {
LABEL_58:
        char v43 = 1;
        return v43 & 1;
      }
      CFTypeID v16 = CFGetTypeID(Value);
      if (v16 != sub_10001324C()) {
        heim_abort();
      }
      int v3 = v44--;
      if (v3 < 0) {
        return v43 & 1;
      }
      if (byte_100028EC0)
      {
        int v40 = 0;
        int v40 = off_100028ED8(*v47);
        if (!v40) {
          goto LABEL_58;
        }
        BOOL v39 = 0;
        if (!v47[9])
        {
          id v38 = (id)off_100028EC8();
          id location = 0;
          objc_storeStrong(&location, v38);
          id v15 = location;
          objc_storeStrong(&location, 0);
          v47[9] = v15;
          objc_storeStrong(&v38, 0);
        }
        CFStringRef v37 = 0;
        CFStringRef v37 = (CFStringRef)CFDictionaryGetValue(Value[3], @"kHEIMAttrAltDSID");
        if (v37 && v47[9]) {
          BOOL v39 = CFEqual(v37, (CFStringRef)v47[9]);
        }
        if (!v39) {
          return v43 & 1;
        }
      }
      if (byte_100028F10)
      {
        int v36 = 0;
        int v36 = off_100028EE0(*v47);
        CFNumberRef v35 = 0;
        CFNumberRef v35 = CFNumberCreate(0, kCFNumberIntType, &v36);
        CFTypeRef v34 = 0;
        CFTypeRef v34 = CFDictionaryGetValue(Value[3], @"kHEIMAttrASID");
        BOOL v33 = 0;
        if (v35 && v34) {
          BOOL v33 = CFEqual(v35, v34) != 0;
        }
        int v32 = 0;
        int v32 = off_100028ED8(*v47);
        CFTypeRef v31 = 0;
        CFTypeRef v31 = CFDictionaryGetValue(Value[3], @"kHEIMAttrUserID");
        CFNumberRef v30 = 0;
        CFNumberRef v30 = CFNumberCreate(0, kCFNumberIntType, &v32);
        BOOL v29 = 0;
        if (v31 && v30) {
          BOOL v29 = CFEqual(v31, v30) != 0;
        }
        if (v30)
        {
          CFRelease(v30);
          CFNumberRef v30 = 0;
        }
        if (v35)
        {
          CFRelease(v35);
          CFNumberRef v35 = 0;
        }
        if (!v29 && !v33) {
          return v43 & 1;
        }
      }
      CFTypeRef v28 = 0;
      CFTypeRef v28 = CFDictionaryGetValue(Value[3], @"kHEIMAttrBundleIdentifierACL");
      if (v28) {
        break;
      }
      CFTypeRef v41 = CFDictionaryGetValue(Value[3], @"kHEIMAttrParentCredential");
      if (!v41) {
        return v43 & 1;
      }
      if (CFEqual(v41, v46)) {
        goto LABEL_58;
      }
      id v46 = v41;
    }
    CFIndex i = 0;
    CFIndex Count = 0;
    if (v45) {
      unsigned char *v45 = 1;
    }
    CFTypeID v14 = CFGetTypeID(v28);
    if (v14 == CFArrayGetTypeID())
    {
      CFIndex Count = CFArrayGetCount((CFArrayRef)v28);
      for (CFIndex i = 0; i < Count; ++i)
      {
        CFTypeRef cf = 0;
        CFTypeRef cf = CFArrayGetValueAtIndex((CFArrayRef)v28, i);
        CFTypeID v13 = CFGetTypeID(cf);
        if (v13 != CFStringGetTypeID()) {
          break;
        }
        if (CFEqual((CFTypeRef)v47[1], cf)) {
          goto LABEL_58;
        }
        id v24 = +[NSPredicate predicateWithFormat:@"self like %@", cf];
        char v23 = 0;
        char v23 = [v24 evaluateWithObject:v47[1]] & 1;
        if (v23)
        {
          int v18 = 5;
        }
        else
        {
          if (!CFEqual(cf, @"com.apple.private.gssapi.allowmanagedapps")) {
            goto LABEL_51;
          }
          if (v47[8])
          {
            os_log_t oslog = (os_log_t)sub_10001120C();
            os_log_type_t type = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              log = oslog;
              os_log_type_t v12 = type;
              CStringPtr = CFStringGetCStringPtr((CFStringRef)v47[1], 0x8000100u);
              sub_10000F7A4((uint64_t)v50, (uint64_t)CStringPtr);
              _os_log_debug_impl((void *)&_mh_execute_header, log, v12, "checking managed app status for: %{private}s", v50, 0xCu);
            }
            objc_storeStrong((id *)&oslog, 0);
            uint64_t v5 = v47[1];
            v20[0] = *(_OWORD *)(v47 + 3);
            v20[1] = *(_OWORD *)(v47 + 5);
            unsigned __int8 v6 = [(id)qword_100028F08 isManagedApp:v5 auditToken:v20];
            *((unsigned char *)v47 + 65) = v6 & 1;
            *((unsigned char *)v47 + 64) = 0;
            os_log_t v19 = (os_log_t)sub_10001120C();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              CFDictionaryRef v10 = v19;
              CFErrorRef v7 = CFStringGetCStringPtr((CFStringRef)v47[1], 0x8000100u);
              if (*((unsigned char *)v47 + 65)) {
                id v8 = "is managed";
              }
              else {
                id v8 = "is not managed";
              }
              sub_10000F7E4((uint64_t)v49, (uint64_t)v7, (uint64_t)v8);
              _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "app %{private}s %s", v49, 0x16u);
            }
            objc_storeStrong((id *)&v19, 0);
          }
          if (*((unsigned char *)v47 + 65)) {
            int v18 = 5;
          }
          else {
LABEL_51:
          }
            int v18 = 0;
        }
        objc_storeStrong(&v24, 0);
        if (v18) {
          goto LABEL_58;
        }
      }
    }
  }
  return v43 & 1;
}

uint64_t sub_1000071B8(void *a1, const __CFDictionary *a2, __CFError *a3)
{
  CFTypeRef v41 = a1;
  CFDictionaryRef v40 = a2;
  CFErrorRef v39 = a3;
  id v38 = 0;
  CFTypeRef v37 = CFDictionaryGetValue(a2, @"kHEIMObjectType");
  if (CFEqual(v37, @"kHEIMObjectKerberos")
    || CFEqual(v37, @"kHEIMObjectConfiguration")
    || CFEqual(v37, @"kHEIMObjectKerberosAcquireCred"))
  {
    int v36 = CFDictionaryGetValue(v40, @"kHEIMAttrParentCredential");
    CFNumberRef v35 = CFDictionaryGetValue(v40, @"kHEIMAttrClientName");
    CFTypeRef v34 = CFDictionaryGetValue(v40, @"kHEIMAttrServerName");
    if (!v36 || !v35 || !v34)
    {
      char v42 = 1;
      int v33 = 1;
      goto LABEL_38;
    }
    v49[0] = @"kHEIMObjectType";
    v50[0] = v37;
    v49[1] = @"kHEIMAttrParentCredential";
    v50[1] = v36;
    v49[2] = @"kHEIMAttrClientName";
    v50[2] = v35;
    v49[3] = @"kHEIMAttrServerName";
    v50[3] = v34;
    CFTypeID v14 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:4];
    id v3 = [(NSDictionary *)v14 mutableCopy];
    id v4 = v38;
    id v38 = v3;
  }
  else if (CFEqual(v37, @"kHEIMObjectNTLM"))
  {
    int v32 = CFDictionaryGetValue(v40, @"kHEIMAttrNTLMUsername");
    CFTypeRef v31 = CFDictionaryGetValue(v40, @"kHEIMAttrNTLMDomain");
    CFNumberRef v30 = CFDictionaryGetValue(v40, @"kHEIMAttrParentCredential");
    v47[0] = @"kHEIMObjectType";
    v48[0] = v37;
    v47[1] = @"kHEIMAttrNTLMUsername";
    v48[1] = v32;
    v47[2] = @"kHEIMAttrNTLMDomain";
    v48[2] = v31;
    v47[3] = @"kHEIMAttrData";
    v48[3] = @"kHEIMObjectAny";
    CFTypeID v13 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:4];
    id v5 = [(NSDictionary *)v13 mutableCopy];
    id v6 = v38;
    id v38 = v5;

    if (v30) {
      [v38 setObject:v30 forKeyedSubscript:@"kHEIMAttrParentCredential"];
    }
  }
  else
  {
    if (!CFEqual(v37, @"kHEIMObjectSCRAM"))
    {
      char v42 = 1;
      int v33 = 1;
      goto LABEL_38;
    }
    BOOL v29 = CFDictionaryGetValue(v40, @"kHEIMAttrSCRAMUsername");
    v45[0] = @"kHEIMObjectType";
    v46[0] = v37;
    v45[1] = @"kHEIMAttrSCRAMUsername";
    v46[1] = v29;
    os_log_type_t v12 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
    id v7 = [(NSDictionary *)v12 mutableCopy];
    id v8 = v38;
    id v38 = v7;
  }
  if ((byte_100028EC0 & 1) == 0) {
    goto LABEL_23;
  }
  id location = (id)off_100028EC8();
  if (location)
  {
    [v38 setObject:location forKeyedSubscript:@"kHEIMAttrAltDSID"];
    int v33 = 0;
  }
  else
  {
    os_log_t oslog = (os_log_t)sub_10001120C();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v11 = type;
      sub_100003CE0(v25);
      _os_log_error_impl((void *)&_mh_execute_header, log, v11, "the device is multiuser and is missing the altDSID", v25, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    CFStringRef v44 = @"CommonErrorCode";
    CFBooleanRef v43 = kCFBooleanTrue;
    sub_100007D24(v39, 564486, (const void *const *)&v44, (const void *const *)&v43, 1);
    char v42 = 0;
    int v33 = 1;
  }
  objc_storeStrong(&location, 0);
  if (!v33)
  {
LABEL_23:
    if (byte_100028F10)
    {
      int v24 = 0;
      int v24 = off_100028ED8(*v41);
      CFTypeRef cf = CFNumberCreate(0, kCFNumberIntType, &v24);
      if (v24) {
        [v38 setObject:cf forKeyedSubscript:@"kHEIMAttrUserID"];
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      int v22 = 0;
      int v22 = off_100028EE0(*v41);
      CFTypeRef v21 = CFNumberCreate(0, kCFNumberIntType, &v22);
      [v38 setObject:v21 forKeyedSubscript:@"kHEIMAttrASID"];
      if (v21)
      {
        CFRelease(v21);
        CFTypeRef v21 = 0;
      }
    }
    xpc_object_t value = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject();
    xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(xdict, "command", "removeduplicates");
    xpc_dictionary_set_value(xdict, "query", value);
    CFArrayRef theArray = (const __CFArray *)sub_100008254(v41, xdict, "query");
    CFIndex Count = CFArrayGetCount(theArray);
    for (CFIndex idx = 0; idx < Count; ++idx)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, idx);
      sub_1000086E4((uint64_t)ValueAtIndex, (uint64_t)v41);
    }
    if (Count > 0) {
      byte_100028FAC = 1;
    }
    if (theArray) {
      CFRelease(theArray);
    }
    char v42 = 1;
    int v33 = 1;
    objc_storeStrong(&xdict, 0);
    objc_storeStrong(&value, 0);
  }
LABEL_38:
  objc_storeStrong(&v38, 0);
  return v42 & 1;
}

uint64_t sub_100007A5C(uint64_t a1, const __CFDictionary *a2)
{
  CFTypeRef cf = CFDictionaryGetValue(a2, @"kHEIMAttrBundleIdentifierACL");
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 == CFArrayGetTypeID())
    {
      CFIndex range_8 = CFArrayGetCount((CFArrayRef)cf);
      v10.id location = 0;
      v10.length = range_8;
      if (!CFArrayContainsValue((CFArrayRef)cf, v10, *(const void **)(a1 + 8)))
      {
        MutableCopy = CFArrayCreateMutableCopy(0, 0, (CFArrayRef)cf);
        if (!MutableCopy)
        {
          char v9 = 0;
          return v9 & 1;
        }
        CFArrayAppendValue(MutableCopy, *(const void **)(a1 + 8));
        CFDictionarySetValue(a2, @"kHEIMAttrBundleIdentifierACL", MutableCopy);
        CFRelease(MutableCopy);
      }
      char v9 = 1;
      return v9 & 1;
    }
  }
  char v9 = 0;
  return v9 & 1;
}

uint64_t sub_100007C0C(uint64_t a1)
{
  char v2 = 1;
  if (CFStringCompare(@"com.apple.accountsd", *(CFStringRef *)(a1 + 16), 0)) {
    char v2 = off_100028ED0(a1, "com.apple.private.gssapi.allowwildcardacl");
  }
  return v2 & 1;
}

void sub_100007C88(uint64_t a1, __CFDictionary *a2)
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFDateRef value = CFDateCreate(0, Current);
  if (value)
  {
    CFDictionarySetValue(a2, @"kHEIMAttrStoreTime", value);
    CFRelease(value);
  }
}

CFErrorRef sub_100007D24(CFErrorRef result, CFIndex a2, const void *const *a3, const void *const *a4, CFIndex a5)
{
  id v5 = result;
  if (!*(void *)result)
  {
    result = CFErrorCreateWithUserInfoKeysAndValues(0, @"com.apple.GSS.credential-store", a2, a3, a4, a5);
    *id v5 = result;
  }
  return result;
}

void sub_100007D9C(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(a1 + 56) + 48))
  {
    *(_DWORD *)(*(void *)(a1 + 56) + 48) = 0;
    CFDictionaryApplyFunction((CFDictionaryRef)qword_100028F90, (CFDictionaryApplierFunction)sub_100005180, *(void **)(a1 + 56));
  }
}

CFMutableDictionaryRef sub_100007E18(const __CFDictionary *a1, __CFError *a2)
{
  CFDictionaryRef v12 = a1;
  CFErrorRef v11 = a2;
  CFDictionaryRef theDict = 0;
  CFMutableDictionaryRef MutableCopy = 0;
  CFRange v10 = a2;
  CFTypeID TypeID = CFStringGetTypeID();
  CFTypeRef v7 = sub_10000D4D0(a1, @"kHEIMObjectType", TypeID, (uint64_t)v11);
  if (v7)
  {
    CFDictionaryRef v5 = (const __CFDictionary *)qword_100028F98;
    CFTypeID v3 = CFDictionaryGetTypeID();
    CFDictionaryRef theDict = (CFDictionaryRef)sub_10000D4D0(v5, v7, v3, (uint64_t)v11);
    if (theDict)
    {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v12);
      CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_1000102E0, &theDict);
      return MutableCopy;
    }
    else
    {
      CFStringRef v15 = @"CommonErrorCode";
      CFBooleanRef v14 = kCFBooleanTrue;
      sub_100007D24(v11, 564482, (const void *const *)&v15, (const void *const *)&v14, 1);
      return 0;
    }
  }
  else
  {
    CFStringRef v17 = @"CommonErrorCode";
    CFBooleanRef v16 = kCFBooleanTrue;
    sub_100007D24(v11, 564481, (const void *const *)&v17, (const void *const *)&v16, 1);
    return 0;
  }
}

uint64_t sub_100007FF4(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 3;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 65;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_100008034(void *a1, void *a2, void *a3)
{
  CFErrorRef v11 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v9 = 0;
  objc_storeStrong(&v9, a3);
  CFTypeRef cf = 0;
  CFArrayRef theArray = (const __CFArray *)sub_100008254(v11, location, "query");
  if (theArray && CFArrayGetCount(theArray))
  {
    CFIndex Count = CFArrayGetCount(theArray);
    for (CFIndex idx = 0; idx < Count; ++idx)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, idx);
      sub_1000086E4((uint64_t)ValueAtIndex, (uint64_t)v11);
    }
    byte_100028FAC = 1;
  }
  else
  {
    CFStringRef v13 = @"CommonErrorCode";
    CFBooleanRef v12 = kCFBooleanTrue;
    sub_100007D24((CFErrorRef)&cf, 564483, (const void *const *)&v13, (const void *const *)&v12, 1);
  }
  if (cf)
  {
    sub_1000066C8(v9, (__CFError *)cf);
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
  }
  if (theArray) {
    CFRelease(theArray);
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
}

uint64_t sub_100008254(void *a1, void *a2, const char *a3)
{
  CFTypeRef v28 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  os_log_type_t v26 = a3;
  memset(__b, 0, sizeof(__b));
  __b[0] = v28;
  CFTypeRef v24 = 0;
  __b[6] = xpc_dictionary_get_string(location, "command");
  if (__b[6])
  {
    id v13 = location;
    CFBooleanRef v12 = v26;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    __b[2] = sub_100012950(v13, v12, TypeID);
    if (__b[2])
    {
      __b[3] = CFDictionaryGetCount((CFDictionaryRef)__b[2]);
      if (__b[3] == 1
        && (v20 = CFDictionaryGetValue((CFDictionaryRef)__b[2], @"kHEIMAttrUUID")) != 0
        && (CFTypeID v11 = CFGetTypeID(v20), v11 == CFUUIDGetTypeID()))
      {
        if (sub_100006894(v28, v20, 0))
        {
          Value = (uint64_t *)CFDictionaryGetValue(*(CFDictionaryRef *)(v28[7] + 24), v20);
          if (Value)
          {
            CFTypeID v10 = CFGetTypeID(Value);
            if (v10 != sub_10001324C()) {
              heim_abort();
            }
            if (sub_10000A6C4(Value[4], __b[6]))
            {
              __b[1] = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
              CFArrayAppendValue((CFMutableArrayRef)__b[1], Value);
            }
          }
        }
      }
      else
      {
        __b[1] = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
        CFDictionaryRef v8 = (const __CFDictionary *)__b[2];
        CFTypeID v4 = CFStringGetTypeID();
        CFTypeRef v18 = sub_10000D4D0(v8, @"kHEIMObjectType", v4, (uint64_t)&v24);
        CFDictionaryRef v9 = (const __CFDictionary *)__b[2];
        CFTypeID v5 = CFStringGetTypeID();
        CFTypeRef cf1 = sub_10000D4D0(v9, @"kHEIMAttrType", v5, (uint64_t)&v24);
        if (v18 && !CFEqual(v18, @"kHEIMObjectAny") && cf1 && CFEqual(cf1, @"kHEIMTypeSchema")) {
          CFDictionaryApplyFunction((CFDictionaryRef)qword_100028F98, (CFDictionaryApplierFunction)sub_10000F83C, __b);
        }
        else {
          CFDictionaryApplyFunction(*(CFDictionaryRef *)(v28[7] + 24), (CFDictionaryApplierFunction)sub_10000F968, __b);
        }
      }
    }
  }
  else
  {
    id v23 = sub_10001120C();
    char v22 = 16;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    {
      log = v23;
      os_log_type_t type = v22;
      sub_100003CE0(v21);
      _os_log_error_impl((void *)&_mh_execute_header, log, type, "query is missing command", v21, 2u);
    }
    objc_storeStrong(&v23, 0);
  }
  if (v24)
  {
    CFRelease(v24);
    CFTypeRef v24 = 0;
  }
  if (__b[2])
  {
    CFRelease((CFTypeRef)__b[2]);
    __b[2] = 0;
  }
  uint64_t v7 = __b[1];
  objc_storeStrong(&location, 0);
  return v7;
}

void sub_1000086E4(uint64_t a1, uint64_t a2)
{
  CFTypeID v2 = CFGetTypeID((CFTypeRef)a1);
  if (v2 != sub_10001324C()) {
    heim_abort();
  }
  if (!CFEqual(*(CFTypeRef *)(*(void *)(a1 + 32) + 16), @"kHEIMTypeNTLMRelfection"))
  {
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(void *)(a2 + 56) + 24), *(const void **)(a1 + 16));
    sub_10000BD34(*(CFDictionaryRef **)(a2 + 56), *(void *)(a1 + 16));
    if (*(void *)(*(void *)(a1 + 32) + 40)) {
      (*(void (**)(void))(*(void *)(a1 + 32) + 40))();
    }
    sub_10000FC54(a2, a1);
  }
}

void sub_1000087E8(void *a1, void *a2, void *a3)
{
  CFErrorRef v39 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v37 = 0;
  objc_storeStrong(&v37, a3);
  CFTypeRef cf = sub_1000128CC(location, "uuid");
  CFTypeRef MutableCopy = 0;
  CFTypeRef v34 = 0;
  id v33 = 0;
  if (cf)
  {
    if (sub_100006894(v39, cf, 0))
    {
      CFTypeRef Value = 0;
      CFTypeRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v39[7] + 24), cf);
      CFRelease(cf);
      CFTypeRef cf = 0;
      if (Value)
      {
        CFTypeID v19 = CFGetTypeID(Value);
        if (v19 != sub_10001324C()) {
          heim_abort();
        }
        if (*((void *)Value + 3))
        {
          CFTypeRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, *((CFDictionaryRef *)Value + 3));
          if (!MutableCopy)
          {
            int v32 = 1;
            goto LABEL_75;
          }
        }
        else
        {
          CFTypeRef MutableCopy = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        }
        id v18 = location;
        CFTypeID TypeID = CFDictionaryGetTypeID();
        CFDictionaryRef theDict = (CFDictionaryRef)sub_100012950(v18, "attributes", TypeID);
        if (theDict)
        {
          v49[0] = @"kHEIMObjectType";
          v49[1] = @"kHEIMAttrType";
          v49[2] = @"kHEIMAttrAltDSID";
          v49[3] = @"kHEIMAttrUserID";
          void v49[4] = @"kHEIMAttrRetainStatus";
          v49[5] = @"kHEIMAttrUUID";
          CFTypeID v4 = +[NSArray arrayWithObjects:v49 count:6];
          id v5 = v33;
          id v33 = v4;

          memset(__b, 0, sizeof(__b));
          id v16 = v33;
          id v17 = [v16 countByEnumeratingWithState:__b objects:v48 count:16];
          if (v17)
          {
            uint64_t v13 = *(void *)__b[2];
            uint64_t v14 = 0;
            id v15 = v17;
            while (1)
            {
              uint64_t v12 = v14;
              if (*(void *)__b[2] != v13) {
                objc_enumerationMutation(v16);
              }
              CFTypeRef key = *(void **)(__b[1] + 8 * v14);
              if (CFDictionaryContainsKey(theDict, key)) {
                break;
              }
              ++v14;
              if (v12 + 1 >= (unint64_t)v15)
              {
                uint64_t v14 = 0;
                id v15 = [v16 countByEnumeratingWithState:__b objects:v48 count:16];
                if (!v15) {
                  goto LABEL_30;
                }
              }
            }
            CFStringRef v47 = @"CommonErrorCode";
            CFBooleanRef v46 = kCFBooleanTrue;
            sub_100007D24((CFErrorRef)&v34, 564487, (const void *const *)&v47, (const void *const *)&v46, 1);
            sub_1000066C8(v37, (__CFError *)v34);
            if (MutableCopy)
            {
              CFRelease(MutableCopy);
              CFTypeRef MutableCopy = 0;
            }
            if (theDict)
            {
              CFRelease(theDict);
              CFDictionaryRef theDict = 0;
            }
            int v32 = 8;
          }
          else
          {
LABEL_30:
            int v32 = 0;
          }

          if (v32)
          {
            if (v32 != 8) {
              goto LABEL_75;
            }
          }
          else if (CFEqual(*(CFTypeRef *)(*((void *)Value + 4) + 16), @"kHEIMTypeNTLMRelfection"))
          {
            CFStringRef v45 = @"CommonErrorCode";
            CFBooleanRef v44 = kCFBooleanTrue;
            sub_100007D24((CFErrorRef)&v34, 564487, (const void *const *)&v45, (const void *const *)&v44, 1);
            sub_1000066C8(v37, (__CFError *)v34);
            if (MutableCopy)
            {
              CFRelease(MutableCopy);
              CFTypeRef MutableCopy = 0;
            }
            if (theDict)
            {
              CFRelease(theDict);
              CFDictionaryRef theDict = 0;
            }
          }
          else
          {
            CFBooleanRef BOOLean = (CFBooleanRef)CFDictionaryGetValue(theDict, @"kHEIMAttrDefaultCredential");
            BOOL v26 = 0;
            BOOL v11 = 1;
            if (!sub_100004F5C(*((const __CFDictionary **)Value + 3))) {
              BOOL v11 = sub_1000067A0(v39[7], *((const __CFDictionary **)Value + 3));
            }
            BOOL v26 = v11;
            if (v11 && BOOLean && CFBooleanGetValue(BOOLean))
            {
              CFStringRef v43 = @"CommonErrorCode";
              CFBooleanRef v42 = kCFBooleanTrue;
              sub_100007D24((CFErrorRef)&v34, 564487, (const void *const *)&v43, (const void *const *)&v42, 1);
              sub_1000066C8(v37, (__CFError *)v34);
              if (MutableCopy)
              {
                CFRelease(MutableCopy);
                CFTypeRef MutableCopy = 0;
              }
              if (theDict)
              {
                CFRelease(theDict);
                CFDictionaryRef theDict = 0;
              }
            }
            else
            {
              BOOL v25 = 0;
              CFTypeRef v24 = CFDictionaryGetValue(theDict, @"kHEIMAttrBundleIdentifierACL");
              v25 = v24 && (CFTypeID v10 = CFGetTypeID(v24), v10 == CFArrayGetTypeID());
              if (!v25
                || (sub_100007C0C((uint64_t)v39) & 1) != 0
                || CFArrayGetCount((CFArrayRef)v24) == 1
                && (CFTypeRef cf1 = (CFTypeRef)v39[1],
                    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v24, 0),
                    CFEqual(cf1, ValueAtIndex)))
              {
                CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_1000092D0, (void *)MutableCopy);
                if (theDict)
                {
                  CFRelease(theDict);
                  CFDictionaryRef theDict = 0;
                }
                if (sub_100006474((const __CFDictionary *)MutableCopy, (__CFError *)&v34))
                {
                  sub_100003074(v39[7], (uint64_t)Value, (const __CFDictionary *)MutableCopy);
                  sub_100007A5C((uint64_t)v39, (const __CFDictionary *)MutableCopy);
                  if (*((void *)Value + 3))
                  {
                    CFRelease(*((CFTypeRef *)Value + 3));
                    *((void *)Value + 3) = 0;
                  }
                  *((void *)Value + 3) = MutableCopy;
                  byte_100028FAC = 1;
                  sub_100009314((uint64_t)Value);
                }
                else
                {
                  sub_1000066C8(v37, (__CFError *)v34);
                }
              }
              else
              {
                os_log_t oslog = (os_log_t)sub_10001120C();
                os_log_type_t type = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
                {
                  log = oslog;
                  os_log_type_t v8 = type;
                  sub_100003CE0(v21);
                  _os_log_error_impl((void *)&_mh_execute_header, log, v8, "peer sent more then one bundle id and is not allowed if the acl does not match the app bundle id.", v21, 2u);
                }
                objc_storeStrong((id *)&oslog, 0);
                CFStringRef v41 = @"CommonErrorCode";
                CFBooleanRef v40 = kCFBooleanTrue;
                sub_100007D24((CFErrorRef)&v34, 564487, (const void *const *)&v41, (const void *const *)&v40, 1);
                sub_1000066C8(v37, (__CFError *)v34);
                if (MutableCopy)
                {
                  CFRelease(MutableCopy);
                  CFTypeRef MutableCopy = 0;
                }
                if (theDict)
                {
                  CFRelease(theDict);
                  CFDictionaryRef theDict = 0;
                }
              }
            }
          }
        }
        else if (MutableCopy)
        {
          CFRelease(MutableCopy);
          CFTypeRef MutableCopy = 0;
        }
        if (v34)
        {
          CFRelease(v34);
          CFTypeRef v34 = 0;
        }
        int v32 = 0;
      }
      else
      {
        int v32 = 1;
      }
    }
    else
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
      int v32 = 1;
    }
  }
  else
  {
    int v32 = 1;
  }
LABEL_75:
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&location, 0);
}

void sub_1000092D0(const void *a1, const void *a2, __CFDictionary *a3)
{
}

void sub_100009314(uint64_t a1)
{
  uint64_t v4 = a1;
  uint64_t v3 = 0;
  id location = (id)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), @"kHEIMAttrExpire");
  [location timeIntervalSince1970];
  uint64_t v3 = (uint64_t)v1;
  pthread_mutex_lock((pthread_mutex_t *)(v4 + 40));
  *(void *)(v4 + 128) = v3;
  if (location && sub_10000FD08(v4)) {
    sub_100017E04(v4, *(void *)(v4 + 128));
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v4 + 40));
  objc_storeStrong(&location, 0);
}

void sub_1000093DC(void *a1, void *a2, void *a3)
{
  id v18 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v16 = 0;
  objc_storeStrong(&v16, a3);
  uint64_t v15 = 0;
  CFUUIDRef v14 = sub_1000128CC(location, "uuid");
  if (v14)
  {
    if (sub_100006894(v18, v14, 0))
    {
      CFTypeRef Value = 0;
      CFTypeRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v18[7] + 24), v14);
      CFRelease(v14);
      CFUUIDRef v14 = 0;
      if (Value)
      {
        id v6 = location;
        CFTypeID TypeID = CFDictionaryGetTypeID();
        CFTypeRef cf = sub_100012950(v6, "attributes", TypeID);
        if (cf)
        {
          if (*(void *)(Value[4] + 32))
          {
            uint64_t v15 = (*(uint64_t (**)(void *, void *, CFTypeRef))(Value[4] + 32))(v18, Value, cf);
            if (v15) {
              sub_100012A28(v16, "attributes");
            }
          }
          else
          {
            os_log_t oslog = (os_log_t)sub_10001120C();
            os_log_type_t type = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              log = oslog;
              os_log_type_t v5 = type;
              sub_100003CE0(v8);
              _os_log_error_impl((void *)&_mh_execute_header, log, v5, "no HeimCredAuthCallback defined for mech", v8, 2u);
            }
            objc_storeStrong((id *)&oslog, 0);
          }
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          int v13 = 0;
        }
        else
        {
          int v13 = 1;
        }
      }
      else
      {
        int v13 = 1;
      }
    }
    else
    {
      CFRelease(v14);
      CFUUIDRef v14 = 0;
      int v13 = 1;
    }
  }
  else
  {
    int v13 = 1;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&location, 0);
}

void sub_1000096C0(void *a1, void *a2, void *a3)
{
  id v18 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v16 = 0;
  objc_storeStrong(&v16, a3);
  uint64_t v15 = 0;
  CFUUIDRef v14 = sub_1000128CC(location, "uuid");
  if (v14)
  {
    if (sub_100006894(v18, v14, 0))
    {
      CFTypeRef Value = 0;
      CFTypeRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v18[7] + 24), v14);
      CFRelease(v14);
      CFUUIDRef v14 = 0;
      if (Value)
      {
        id v6 = location;
        CFTypeID TypeID = CFDictionaryGetTypeID();
        CFTypeRef cf = sub_100012950(v6, "attributes", TypeID);
        if (cf)
        {
          if (*(void *)(Value[4] + 32))
          {
            uint64_t v15 = (*(uint64_t (**)(void *, void *, CFTypeRef))(Value[4] + 32))(v18, Value, cf);
            if (v15) {
              sub_100012A28(v16, "attributes");
            }
          }
          else
          {
            os_log_t oslog = (os_log_t)sub_10001120C();
            os_log_type_t type = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              log = oslog;
              os_log_type_t v5 = type;
              sub_100003CE0(v8);
              _os_log_error_impl((void *)&_mh_execute_header, log, v5, "no HeimCredAuthCallback defined for mech", v8, 2u);
            }
            objc_storeStrong((id *)&oslog, 0);
          }
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          int v13 = 0;
        }
        else
        {
          int v13 = 1;
        }
      }
      else
      {
        int v13 = 1;
      }
    }
    else
    {
      CFRelease(v14);
      CFUUIDRef v14 = 0;
      int v13 = 1;
    }
  }
  else
  {
    int v13 = 1;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&location, 0);
}

void sub_10000998C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v15 = 0;
  objc_storeStrong(&v15, a3);
  CFTypeRef cf = 0;
  id v13 = 0;
  CFDateRef value = 0;
  CFTypeRef v11 = 0;
  id v9 = location;
  CFTypeID TypeID = CFDataGetTypeID();
  id v19 = (id)sub_100012950(v9, "challenge", TypeID);
  id v10 = v19;
  if (v10)
  {
    if ((unint64_t)[v10 length] <= 8)
    {
      CFTypeRef v11 = CFUUIDCreate(0);
      if (v11)
      {
        CFDateRef value = (void *)sub_100013270(v11);
        if (value)
        {
          v20[0] = @"kHEIMObjectType";
          v21[0] = @"kHEIMObjectNTLMReflection";
          v20[1] = @"kHEIMAttrType";
          v21[1] = @"kHEIMTypeNTLMRelfection";
          _OWORD v20[2] = @"kHEIMAttrData";
          v21[2] = v10;
          uint64_t v7 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
          id v4 = [(NSDictionary *)v7 mutableCopy];
          id v5 = v13;
          id v13 = v4;

          if (sub_100006474((const __CFDictionary *)v13, (__CFError *)&cf))
          {
            if (sub_10000481C((uint64_t)value, (const __CFDictionary *)v13))
            {
              if (!*((void *)value + 4)) {
                heim_abort();
              }
              sub_100007C88((uint64_t)value, (__CFDictionary *)v13);
              id v18 = 0;
              objc_storeStrong(&v18, v13);
              id v6 = v18;
              objc_storeStrong(&v18, 0);
              *((void *)value + 3) = v6;
              CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(void *)(v17 + 56) + 32), *((const void **)value + 2), value);
              byte_100028FAC = 1;
            }
          }
          else
          {
            sub_1000066C8(v15, (__CFError *)cf);
            if (cf)
            {
              CFRelease(cf);
              CFTypeRef cf = 0;
            }
          }
        }
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      if (value)
      {
        CFRelease(value);
        CFDateRef value = 0;
      }
      if (v11)
      {
        CFRelease(v11);
        CFTypeRef v11 = 0;
      }
    }
    else
    {
      sub_100007D24((CFErrorRef)&cf, 564488, 0, 0, 0);
      sub_1000066C8(v15, (__CFError *)cf);
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
    }
  }
  else
  {
    sub_100007D24((CFErrorRef)&cf, 564486, 0, 0, 0);
    sub_1000066C8(v15, (__CFError *)cf);
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&location, 0);
}

uint64_t sub_100009E20(void *a1, uint64_t a2)
{
  id v19 = a1;
  uint64_t v18 = a2;
  uint64_t v13 = 0;
  CFUUIDRef v14 = &v13;
  int v15 = 0x20000000;
  int v16 = 32;
  char v17 = 0;
  if (byte_100028F11)
  {
    char v20 = 0;
    int v12 = 1;
  }
  else
  {
    id v11 = +[NSData dataWithBytes:v18 length:8];
    if (v11)
    {
      if (*(void *)(v19[7] + 32))
      {
        id v10 = *(id *)(v19[7] + 32);
        id v3 = v10;
        id v4 = _NSConcreteStackBlock;
        int v5 = -1073741824;
        int v6 = 0;
        uint64_t v7 = sub_10000A060;
        os_log_type_t v8 = &unk_100024AE8;
        v9[2] = v19;
        v9[0] = v11;
        v9[1] = &v13;
        [v3 enumerateKeysAndObjectsUsingBlock:&v4];
        char v20 = v14[3] & 1;
        int v12 = 1;
        objc_storeStrong(v9, 0);
        objc_storeStrong(&v10, 0);
      }
      else
      {
        char v20 = 0;
        int v12 = 1;
      }
    }
    else
    {
      char v20 = 0;
      int v12 = 1;
    }
    objc_storeStrong(&v11, 0);
  }
  _Block_object_dispose(&v13, 8);
  return v20 & 1;
}

void sub_10000A060(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v11 = 0;
  objc_storeStrong(&v11, a3);
  id v10 = a4;
  uint64_t v9 = a1;
  id v8 = v11;
  if (sub_10000496C((CFDictionaryRef *)v11))
  {
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(void *)(*(void *)(a1 + 48) + 56) + 32), *((const void **)v8 + 2));
    byte_100028FAC = 1;
  }
  id v7 = (id)CFDictionaryGetValue(*((CFDictionaryRef *)v8 + 3), @"kHEIMAttrData");
  if ([*(id *)(a1 + 32) isEqualToData:v7])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *id v10 = 1;
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

void sub_10000A18C(void *a1, void *a2, void *a3)
{
  id v10 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v8 = 0;
  objc_storeStrong(&v8, a3);
  id v7 = 0;
  id v5 = location;
  CFTypeID TypeID = CFDataGetTypeID();
  id v11 = (id)sub_100012950(v5, "challenge", TypeID);
  id v6 = v11;
  if (v6)
  {
    if ((unint64_t)[v6 length] <= 8)
    {
      if (sub_100009E20(v10, (uint64_t)[v6 bytes]))
      {
        sub_100007D24((CFErrorRef)&v7, 564489, 0, 0, 0);
        sub_1000066C8(v8, v7);
        if (v7)
        {
          CFRelease(v7);
          id v7 = 0;
        }
      }
      else
      {
        sub_100012A28(v8, "challenge-result");
      }
    }
    else
    {
      sub_100007D24((CFErrorRef)&v7, 564488, 0, 0, 0);
      sub_1000066C8(v8, v7);
      if (v7)
      {
        CFRelease(v7);
        id v7 = 0;
      }
    }
  }
  else
  {
    sub_100007D24((CFErrorRef)&v7, 564486, 0, 0, 0);
    sub_1000066C8(v8, v7);
    if (v7)
    {
      CFRelease(v7);
      id v7 = 0;
    }
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&location, 0);
}

void sub_10000A3DC(void *a1, void *a2, void *a3)
{
  int v12 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v10 = 0;
  objc_storeStrong(&v10, a3);
  CFUUIDRef v9 = sub_1000128CC(location, "uuid");
  if (v9)
  {
    if (sub_100006894(v12, v9, 0))
    {
      CFTypeRef Value = 0;
      CFTypeRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v12[7] + 24), v9);
      CFRelease(v9);
      CFUUIDRef v9 = 0;
      if (Value)
      {
        if (sub_10000A6C4(*((void *)Value + 4), (uint64_t)"fetch"))
        {
          CFTypeRef cf = 0;
          CFTypeRef v5 = 0;
          CFTypeRef v5 = sub_100007E18(*((const __CFDictionary **)Value + 3), (__CFError *)&cf);
          if (cf)
          {
            os_log_t oslog = (os_log_t)sub_10001120C();
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              sub_100006434((uint64_t)v13, (uint64_t)cf);
              _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "error filtering attributes: %@", v13, 0xCu);
            }
            objc_storeStrong((id *)&oslog, 0);
            if (cf)
            {
              CFRelease(cf);
              CFTypeRef cf = 0;
            }
          }
          sub_100012A28(v10, "attributes");
          if (v5)
          {
            CFRelease(v5);
            CFTypeRef v5 = 0;
          }
          int v8 = 0;
        }
        else
        {
          int v8 = 1;
        }
      }
      else
      {
        int v8 = 1;
      }
    }
    else
    {
      CFRelease(v9);
      CFUUIDRef v9 = 0;
      int v8 = 1;
    }
  }
  else
  {
    int v8 = 1;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&location, 0);
}

BOOL sub_10000A6C4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a1;
  uint64_t v4 = a2;
  if (!a1) {
    heim_abort();
  }
  if (!v4) {
    heim_abort();
  }
  id location = +[NSString stringWithCString:v4 encoding:4];
  BOOL v6 = (*(unsigned char *)(v5 + 56) & 1) == 0
    || !*(void *)(v5 + 64)
    || ([*(id *)(v5 + 64) containsObject:location] & 1) == 0;
  objc_storeStrong(&location, 0);
  return v6;
}

void sub_10000A7F8(void *a1, void *a2, void *a3)
{
  int v12 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v10 = 0;
  objc_storeStrong(&v10, a3);
  CFMutableArrayRef Mutable = 0;
  CFTypeRef cf = 0;
  sub_100007D9C((uint64_t)v12);
  CFArrayRef theArray = (const __CFArray *)sub_100008254(v12, location, "query");
  if (theArray)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      uint64_t Count = CFArrayGetCount(theArray);
      if (Count > 1)
      {
        uint64_t v14 = 0;
        uint64_t v13 = Count;
        uint64_t v15 = 0;
        uint64_t v16 = Count;
        v19.id location = 0;
        v19.length = Count;
        CFArraySortValues(theArray, v19, (CFComparatorFunction)sub_10000AB1C, 0);
      }
      for (CFIndex idx = 0; idx < Count; ++idx)
      {
        ValueAtIndex = (const void **)CFArrayGetValueAtIndex(theArray, idx);
        CFArrayAppendValue(Mutable, ValueAtIndex[2]);
      }
      CFRelease(theArray);
      CFArrayRef theArray = 0;
      sub_100012A28(v10, "items");
    }
  }
  else
  {
    CFStringRef v18 = @"CommonErrorCode";
    CFBooleanRef v17 = kCFBooleanTrue;
    sub_100007D24((CFErrorRef)&cf, 564483, (const void *const *)&v18, (const void *const *)&v17, 1);
  }
  if (cf)
  {
    sub_1000066C8(v10, (__CFError *)cf);
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
  }
  if (Mutable)
  {
    CFRelease(Mutable);
    CFMutableArrayRef Mutable = 0;
  }
  if (theArray) {
    CFRelease(theArray);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&location, 0);
}

CFComparisonResult sub_10000AB1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = a1;
  uint64_t v19 = a2;
  uint64_t v18 = a3;
  uint64_t v17 = a1;
  uint64_t v16 = a2;
  CFTypeRef Value = 0;
  CFTypeRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), @"kHEIMAttrParentCredential");
  CFTypeRef v14 = 0;
  CFTypeRef v14 = CFDictionaryGetValue(*(CFDictionaryRef *)(v16 + 24), @"kHEIMAttrParentCredential");
  if (Value && v14 && CFEqual(Value, v14))
  {
    CFBooleanRef v13 = 0;
    CFBooleanRef v13 = (CFBooleanRef)CFDictionaryGetValue(*(CFDictionaryRef *)(v17 + 24), @"kHEIMAttrLeadCredential");
    CFBooleanRef v12 = 0;
    CFBooleanRef v12 = (CFBooleanRef)CFDictionaryGetValue(*(CFDictionaryRef *)(v16 + 24), @"kHEIMAttrLeadCredential");
    if (v13 && CFBooleanGetValue(v13)) {
      return -1;
    }
    if (v12 && CFBooleanGetValue(v12)) {
      return 1;
    }
  }
  CFTypeRef cf = 0;
  CFDictionaryRef v7 = *(const __CFDictionary **)(v17 + 24);
  CFTypeID TypeID = CFDateGetTypeID();
  CFDateRef theDate = (const __CFDate *)sub_10000D4D0(v7, @"kHEIMAttrStoreTime", TypeID, (uint64_t)&cf);
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  CFDictionaryRef v6 = *(const __CFDictionary **)(v16 + 24);
  CFTypeID v4 = CFDateGetTypeID();
  CFDateRef otherDate = (const __CFDate *)sub_10000D4D0(v6, @"kHEIMAttrStoreTime", v4, (uint64_t)&cf);
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (theDate && otherDate) {
    return CFDateCompare(theDate, otherDate, 0);
  }
  int64_t v8 = CFHash(*(CFTypeRef *)(v17 + 16));
  if (v8 >= (uint64_t)CFHash(*(CFTypeRef *)(v16 + 16))) {
    return 1;
  }
  else {
    return -1;
  }
}

void sub_10000AE10(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v8 = 0;
  objc_storeStrong(&v8, a3);
  CFDictionaryRef v7 = 0;
  sub_100007D9C(v10);
  id v5 = location;
  CFTypeID TypeID = CFStringGetTypeID();
  CFTypeRef key = sub_100012950(v5, "mech", TypeID);
  if (key
    && (CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(v10 + 56) + 40), key)
     || (*(_DWORD *)(*(void *)(v10 + 56) + 48) = 1,
         sub_100007D9C(v10),
         CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(v10 + 56) + 40), key))))
  {
    sub_100012A28(v8, "default");
  }
  else
  {
    sub_100007D24((CFErrorRef)&v7, 564483, 0, 0, 0);
  }
  if (v7)
  {
    sub_1000066C8(v8, v7);
    if (v7)
    {
      CFRelease(v7);
      CFDictionaryRef v7 = 0;
    }
  }
  if (key) {
    CFRelease(key);
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&location, 0);
}

void sub_10000B024(void *a1, void *a2, void *a3)
{
  v48 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v46 = 0;
  objc_storeStrong(&v46, a3);
  CFStringRef v45 = 0;
  id v16 = location;
  CFTypeID v3 = CFUUIDGetTypeID();
  CFTypeRef v44 = sub_100012950(v16, "from", v3);
  id v17 = location;
  CFTypeID v4 = CFUUIDGetTypeID();
  CFTypeRef v43 = sub_100012950(v17, "to", v4);
  if (v44 && v43 && !CFEqual(v44, v43))
  {
    if (sub_100006894(v48, v44, 0) & 1) != 0 && (sub_100006894(v48, v43, 0))
    {
      CFNumberRef v35 = 0;
      CFNumberRef v35 = CFDictionaryGetValue(*(CFDictionaryRef *)(v48[7] + 24), v44);
      CFTypeRef v34 = 0;
      CFTypeRef v34 = CFDictionaryGetValue(*(CFDictionaryRef *)(v48[7] + 24), v43);
      uint64_t v33 = 0;
      if (v35)
      {
        if (v35 == v34) {
          heim_abort();
        }
        if (!v34 || CFEqual(*(CFTypeRef *)(*((void *)v35 + 4) + 16), *(CFTypeRef *)(*((void *)v34 + 4) + 16)))
        {
          if (CFEqual(*(CFTypeRef *)(*((void *)v35 + 4) + 16), @"kHEIMTypeNTLMRelfection"))
          {
            os_log_t v26 = (os_log_t)sub_10001120C();
            os_log_type_t v25 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              id v5 = v26;
              os_log_type_t v6 = v25;
              sub_100003CE0(v24);
              _os_log_error_impl((void *)&_mh_execute_header, v5, v6, "moving NTLM Reflection objects is not allowed", v24, 2u);
            }
            objc_storeStrong((id *)&v26, 0);
            CFStringRef v50 = @"CommonErrorCode";
            CFBooleanRef v49 = kCFBooleanTrue;
            sub_100007D24((CFErrorRef)&v45, 564487, (const void *const *)&v50, (const void *const *)&v49, 1);
            sub_1000066C8(v46, v45);
            if (v45)
            {
              CFRelease(v45);
              CFStringRef v45 = 0;
            }
            if (v44)
            {
              CFRelease(v44);
              CFTypeRef v44 = 0;
            }
            if (v43)
            {
              CFRelease(v43);
              CFTypeRef v43 = 0;
            }
          }
          CFMutableDictionaryRef theDict = 0;
          CFMutableDictionaryRef theDict = CFDictionaryCreateMutableCopy(0, 0, *((CFDictionaryRef *)v35 + 3));
          CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v48[7] + 24), v44);
          CFNumberRef v35 = 0;
          if (sub_100004F5C(theDict) && (!v34 || !sub_100004F5C(*((const __CFDictionary **)v34 + 3)))) {
            CFDictionaryRemoveValue(theDict, @"kHEIMAttrTemporaryCache");
          }
          CFDictionarySetValue(theDict, @"kHEIMAttrUUID", v43);
          if (v34)
          {
            CFDateRef value = 0;
            CFDateRef value = (void *)CFDictionaryGetValue(*((CFDictionaryRef *)v34 + 3), @"kHEIMAttrParentCredential");
            if (value) {
              CFDictionarySetValue(theDict, @"kHEIMAttrParentCredential", value);
            }
            CFBooleanRef BOOLean = 0;
            CFBooleanRef BOOLean = (CFBooleanRef)CFDictionaryGetValue(*((CFDictionaryRef *)v34 + 3), @"kHEIMAttrDefaultCredential");
            if (BOOLean && CFBooleanGetValue(BOOLean)) {
              CFDictionarySetValue(theDict, @"kHEIMAttrDefaultCredential", kCFBooleanTrue);
            }
            CFBooleanRef v20 = (CFBooleanRef)CFDictionaryGetValue(theDict, @"kHEIMAttrDefaultCredential");
            if (v20 && CFBooleanGetValue(v20)) {
              CFDictionarySetValue(*(CFMutableDictionaryRef *)(v48[7] + 40), *(const void **)(*((void *)v34 + 4) + 16), *((const void **)v34 + 2));
            }
            if (*((void *)v34 + 3))
            {
              CFRelease(*((CFTypeRef *)v34 + 3));
              *((void *)v34 + 3) = 0;
            }
            *((void *)v34 + 3) = theDict;
            uint64_t v33 = *((void *)v34 + 4);
          }
          else
          {
            CFTypeRef v34 = (const void *)sub_100013270(v43);
            if (!v34) {
              heim_abort();
            }
            sub_10000481C((uint64_t)v34, theDict);
            *((void *)v34 + 3) = theDict;
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(v48[7] + 24), *((const void **)v34 + 2), v34);
            uint64_t v33 = *((void *)v34 + 4);
            if (v34)
            {
              CFRelease(v34);
              CFTypeRef v34 = 0;
            }
          }
          sub_10000BD34((CFDictionaryRef *)v48[7], (uint64_t)v43);
          context[0] = v44;
          context[1] = v43;
          CFDictionaryApplyFunction(*(CFDictionaryRef *)(v48[7] + 24), (CFDictionaryApplierFunction)sub_10000BE58, context);
          if (v33 && *(void *)(v33 + 40)) {
            (*(void (**)(void))(v33 + 40))();
          }
          byte_100028FAC = 1;
          if (v33)
          {
            CFTypeRef key = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(v48[7] + 40), *(const void **)(v33 + 16));
            if (!key || !CFDictionaryGetValue(*(CFDictionaryRef *)(v48[7] + 24), key))
            {
              *(_DWORD *)(v48[7] + 48) = 1;
              sub_100007D9C((uint64_t)v48);
            }
          }
          uint64_t v33 = 0;
          int v39 = 0;
        }
        else
        {
          os_log_t oslog = (os_log_t)sub_10001120C();
          os_log_type_t v28 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            CFDictionaryRef v7 = oslog;
            os_log_type_t v8 = v28;
            sub_100003CE0(v27);
            _os_log_error_impl((void *)&_mh_execute_header, v7, v8, "moving between mechs is not supported", v27, 2u);
          }
          objc_storeStrong((id *)&oslog, 0);
          CFStringRef v52 = @"CommonErrorCode";
          CFBooleanRef v51 = kCFBooleanTrue;
          sub_100007D24((CFErrorRef)&v45, 564487, (const void *const *)&v52, (const void *const *)&v51, 1);
          sub_1000066C8(v46, v45);
          if (v45)
          {
            CFRelease(v45);
            CFStringRef v45 = 0;
          }
          if (v44)
          {
            CFRelease(v44);
            CFTypeRef v44 = 0;
          }
          if (v43)
          {
            CFRelease(v43);
            CFTypeRef v43 = 0;
          }
          int v39 = 1;
        }
      }
      else
      {
        id v32 = sub_10001120C();
        char v31 = 16;
        if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
        {
          CFUUIDRef v9 = v32;
          os_log_type_t v10 = v31;
          sub_100003CE0(v30);
          _os_log_error_impl((void *)&_mh_execute_header, v9, v10, "from is empty", v30, 2u);
        }
        objc_storeStrong(&v32, 0);
        if (v44)
        {
          CFRelease(v44);
          CFTypeRef v44 = 0;
        }
        if (v43)
        {
          CFRelease(v43);
          CFTypeRef v43 = 0;
        }
        int v39 = 1;
      }
    }
    else
    {
      id v38 = sub_10001120C();
      char v37 = 16;
      if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR))
      {
        id v11 = v38;
        os_log_type_t v12 = v37;
        sub_100003CE0(v36);
        _os_log_error_impl((void *)&_mh_execute_header, v11, v12, "no access to caches", v36, 2u);
      }
      objc_storeStrong(&v38, 0);
      CFStringRef v54 = @"CommonErrorCode";
      CFBooleanRef v53 = kCFBooleanTrue;
      sub_100007D24((CFErrorRef)&v45, 564480, (const void *const *)&v54, (const void *const *)&v53, 1);
      sub_1000066C8(v46, v45);
      if (v45)
      {
        CFRelease(v45);
        CFStringRef v45 = 0;
      }
      if (v44)
      {
        CFRelease(v44);
        CFTypeRef v44 = 0;
      }
      if (v43)
      {
        CFRelease(v43);
        CFTypeRef v43 = 0;
      }
      int v39 = 1;
    }
  }
  else
  {
    if (v44)
    {
      CFRelease(v44);
      CFTypeRef v44 = 0;
    }
    if (v43)
    {
      CFRelease(v43);
      CFTypeRef v43 = 0;
    }
    id v42 = sub_10001120C();
    char v41 = 16;
    if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_ERROR))
    {
      log = v42;
      os_log_type_t type = v41;
      sub_100003CE0(v40);
      _os_log_error_impl((void *)&_mh_execute_header, log, type, "move missing required values", v40, 2u);
    }
    objc_storeStrong(&v42, 0);
    CFStringRef v56 = @"CommonErrorCode";
    CFBooleanRef v55 = kCFBooleanTrue;
    sub_100007D24((CFErrorRef)&v45, 564486, (const void *const *)&v56, (const void *const *)&v55, 1);
    sub_1000066C8(v46, v45);
    if (v45)
    {
      CFRelease(v45);
      CFStringRef v45 = 0;
    }
    int v39 = 1;
  }
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&location, 0);
}

void sub_10000BD34(CFDictionaryRef *a1, uint64_t a2)
{
  os_log_type_t v8 = a1;
  uint64_t v7 = a2;
  uint64_t v4 = a2;
  CFArrayRef theArray = 0;
  os_log_type_t v6 = a1;
  CFArrayRef theArray = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  CFDictionaryApplyFunction(v8[3], (CFDictionaryApplierFunction)sub_10000FD98, &v4);
  CFArrayRef v3 = theArray;
  CFIndex Count = CFArrayGetCount(theArray);
  uint64_t v10 = 0;
  CFIndex v9 = Count;
  uint64_t v11 = 0;
  CFIndex v12 = Count;
  v13.id location = 0;
  v13.length = Count;
  CFArrayApplyFunction(v3, v13, (CFArrayApplierFunction)sub_10000FF00, v8);
  if (theArray) {
    CFRelease(theArray);
  }
}

void sub_10000BE58(uint64_t a1, CFDictionaryRef *a2, CFTypeRef *a3)
{
  CFTypeID v3 = CFGetTypeID(a2);
  if (v3 != sub_10001324C()) {
    heim_abort();
  }
  CFTypeRef cf1 = CFDictionaryGetValue(a2[3], @"kHEIMAttrParentCredential");
  if (cf1 && CFEqual(cf1, *a3))
  {
    CFMutableDictionaryRef theDict = CFDictionaryCreateMutableCopy(0, 0, a2[3]);
    if (a2[3])
    {
      CFRelease(a2[3]);
      a2[3] = 0;
    }
    CFDictionarySetValue(theDict, @"kHEIMAttrParentCredential", a3[1]);
    a2[3] = theDict;
  }
}

void sub_10000BFB0(void *a1, void *a2, void *a3)
{
  CFIndex v9 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v7 = 0;
  objc_storeStrong(&v7, a3);
  int v6 = 0;
  int v6 = off_100028ED8(*v9);
  memset(&__b, 0, sizeof(__b));
  if (!v6 || (off_100028ED0(v9, "com.apple.private.gssapi.credential-introspection") & 1) != 0)
  {
    context = xpc_dictionary_create(0, 0, 0);
    CFDictionaryApplyFunction((CFDictionaryRef)qword_100028F80, (CFDictionaryApplierFunction)sub_10000C150, context);
    xpc_dictionary_set_value(v7, "items", context);
    objc_storeStrong(&context, 0);
  }
  if (stat((const char *)[(id)qword_100028EB8 UTF8String], &__b)) {
    xpc_dictionary_set_int64(v7, "cache-size", 0);
  }
  else {
    xpc_dictionary_set_int64(v7, "cache-size", __b.st_size);
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&location, 0);
}

void sub_10000C150(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = a1;
  uint64_t v9 = a2;
  os_log_type_t v8 = a3;
  uint64_t v7 = a2;
  id v6 = a3;
  id location = xpc_dictionary_create(0, 0, 0);
  CFDictionaryApplyFunction(*(CFDictionaryRef *)(v7 + 24), (CFDictionaryApplierFunction)sub_10000FF84, location);
  CFStringRef cf = CFStringCreateWithFormat(0, 0, @"%@", v10);
  CFTypeRef key = rk_cfstring2cstring(cf);
  xpc_dictionary_set_value(v6, key, location);
  free(key);
  if (cf) {
    CFRelease(cf);
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v6, 0);
}

void sub_10000C274(void *a1, void *a2, void *a3)
{
  uint64_t v18 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v16 = 0;
  objc_storeStrong(&v16, a3);
  uint64_t v15 = 0;
  CFArrayRef v14 = 0;
  int v13 = 0;
  int v13 = off_100028ED8(*v18);
  if (v13 || (off_100028ED0(v18, "com.apple.private.gssapi.deleteall") & 1) == 0)
  {
    CFStringRef v21 = @"CommonErrorCode";
    CFBooleanRef v20 = kCFBooleanTrue;
    sub_100007D24((CFErrorRef)&v15, 564484, (const void *const *)&v21, (const void *const *)&v20, 1);
    os_log_t v6 = (os_log_t)sub_10001120C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      sub_100006434((uint64_t)v19, (uint64_t)v15);
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error in DeleteAll: %@", v19, 0xCu);
    }
    objc_storeStrong((id *)&v6, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)sub_10001120C();
    os_log_type_t type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      log = oslog;
      os_log_type_t v4 = type;
      sub_100003CE0(v10);
      _os_log_impl((void *)&_mh_execute_header, log, v4, "Start of delete all", v10, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    CFArrayRef v14 = (const __CFArray *)sub_100008254(v18, location, "query");
    if (v14)
    {
      CFIndex Count = CFArrayGetCount(v14);
      for (CFIndex idx = 0; idx < Count; ++idx)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v14, idx);
        sub_1000086E4((uint64_t)ValueAtIndex, (uint64_t)v18);
      }
      byte_100028FAC = 1;
    }
    else
    {
      CFStringRef v23 = @"CommonErrorCode";
      CFBooleanRef v22 = kCFBooleanTrue;
      sub_100007D24((CFErrorRef)&v15, 564483, (const void *const *)&v23, (const void *const *)&v22, 1);
    }
  }
  if (v15)
  {
    sub_1000066C8(v16, v15);
    if (v15)
    {
      CFRelease(v15);
      uint64_t v15 = 0;
    }
  }
  if (v14)
  {
    CFRelease(v14);
    CFArrayRef v14 = 0;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&location, 0);
}

void sub_10000C640(void *a1, void *a2, void *a3)
{
  os_log_t v26 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v24 = 0;
  objc_storeStrong(&v24, a3);
  id v8 = location;
  CFTypeID v3 = CFUUIDGetTypeID();
  CFTypeRef v23 = sub_100012950(v8, "uuid", v3);
  CFDictionaryRef MutableCopy = 0;
  CFTypeRef v21 = 0;
  if (v23)
  {
    id v19 = sub_10001120C();
    os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEBUG))
    {
      sub_100006434((uint64_t)v29, (uint64_t)v23);
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v19, v18, "do_RetainCache: %@", v29, 0xCu);
    }
    objc_storeStrong(&v19, 0);
    if (sub_100006894(v26, v23, 0))
    {
      CFTypeRef Value = 0;
      CFTypeRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v26[7] + 24), v23);
      if (v23)
      {
        CFRelease(v23);
        CFTypeRef v23 = 0;
      }
      if (Value)
      {
        CFTypeID v6 = CFGetTypeID(Value);
        if (v6 != sub_10001324C()) {
          heim_abort();
        }
        if (CFEqual(*(CFTypeRef *)(*((void *)Value + 4) + 16), @"kHEIMTypeNTLMRelfection"))
        {
          id v16 = sub_10001120C();
          char v15 = 16;
          if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
          {
            os_log_type_t v4 = v16;
            os_log_type_t v5 = v15;
            sub_100003CE0(v14);
            _os_log_error_impl((void *)&_mh_execute_header, v4, v5, "NTLM Reflection objects can't be retained", v14, 2u);
          }
          objc_storeStrong(&v16, 0);
          int v20 = 1;
        }
        else
        {
          if (*((void *)Value + 3))
          {
            CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, *((CFDictionaryRef *)Value + 3));
            if (!MutableCopy)
            {
              int v20 = 1;
              goto LABEL_39;
            }
          }
          else
          {
            CFDictionaryRef MutableCopy = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          }
          unsigned int v12 = -1;
          id v13 = (id)CFDictionaryGetValue(MutableCopy, @"kHEIMAttrRetainStatus");

          if (v13)
          {
            unsigned int v12 = [v13 intValue] + 1;
            os_log_t oslog = (os_log_t)sub_10001120C();
            os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              sub_10000CC8C((uint64_t)v28, v12, *((void *)Value + 2));
              _os_log_debug_impl((void *)&_mh_execute_header, oslog, v10, "the new count is %d for %@", v28, 0x12u);
            }
            objc_storeStrong((id *)&oslog, 0);
            CFDictionarySetValue(MutableCopy, @"kHEIMAttrRetainStatus", +[NSNumber numberWithInt:v12]);
            if (*((void *)Value + 3))
            {
              CFRelease(*((CFTypeRef *)Value + 3));
              *((void *)Value + 3) = 0;
            }
            *((void *)Value + 3) = MutableCopy;
            byte_100028FAC = 1;
          }
          else
          {
            os_log_t v9 = (os_log_t)sub_10001120C();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              sub_100006434((uint64_t)v27, *((void *)Value + 2));
              _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "the retain count is missing: %@", v27, 0xCu);
            }
            objc_storeStrong((id *)&v9, 0);
            if (MutableCopy)
            {
              CFRelease(MutableCopy);
              CFDictionaryRef MutableCopy = 0;
            }
          }
          if (v21)
          {
            CFRelease(v21);
            CFTypeRef v21 = 0;
          }
          objc_storeStrong(&v13, 0);
          int v20 = 0;
        }
      }
      else
      {
        int v20 = 1;
      }
    }
    else
    {
      if (v23)
      {
        CFRelease(v23);
        CFTypeRef v23 = 0;
      }
      int v20 = 1;
    }
  }
  else
  {
    int v20 = 1;
  }
LABEL_39:
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&location, 0);
}

uint64_t sub_10000CC8C(uint64_t result, int a2, uint64_t a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(unsigned char *)(result + 8) = 64;
  *(unsigned char *)(result + 9) = 8;
  *(void *)(result + 10) = a3;
  return result;
}

void sub_10000CCE0(void *a1, void *a2, void *a3)
{
  os_log_type_t v28 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v26 = 0;
  objc_storeStrong(&v26, a3);
  id v8 = location;
  CFTypeID v3 = CFUUIDGetTypeID();
  CFTypeRef v25 = sub_100012950(v8, "uuid", v3);
  CFDictionaryRef MutableCopy = 0;
  CFTypeRef v23 = 0;
  if (v25)
  {
    id v21 = sub_10001120C();
    os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEBUG))
    {
      sub_100006434((uint64_t)v32, (uint64_t)v25);
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v21, v20, "do_ReleaseCache: %@", v32, 0xCu);
    }
    objc_storeStrong(&v21, 0);
    if (sub_100006894(v28, v25, 0))
    {
      CFTypeRef Value = 0;
      CFTypeRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v28[7] + 24), v25);
      if (v25)
      {
        CFRelease(v25);
        CFTypeRef v25 = 0;
      }
      if (Value)
      {
        CFRetain(Value);
        CFTypeID v6 = CFGetTypeID(Value);
        if (v6 != sub_10001324C()) {
          heim_abort();
        }
        if (CFEqual(*(CFTypeRef *)(*((void *)Value + 4) + 16), @"kHEIMTypeNTLMRelfection"))
        {
          id v18 = sub_10001120C();
          char v17 = 16;
          if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
          {
            os_log_type_t v4 = v18;
            os_log_type_t v5 = v17;
            sub_100003CE0(v16);
            _os_log_error_impl((void *)&_mh_execute_header, v4, v5, "NTLM Reflection objects can't be released", v16, 2u);
          }
          objc_storeStrong(&v18, 0);
          if (Value)
          {
            CFRelease(Value);
            CFTypeRef Value = 0;
          }
          int v22 = 1;
        }
        else
        {
          if (*((void *)Value + 3))
          {
            CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, *((CFDictionaryRef *)Value + 3));
            if (!MutableCopy)
            {
              CFRelease(Value);
              int v22 = 1;
              goto LABEL_46;
            }
          }
          else
          {
            CFDictionaryRef MutableCopy = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          }
          int v14 = -1;
          id v15 = (id)CFDictionaryGetValue(MutableCopy, @"kHEIMAttrRetainStatus");

          if (v15)
          {
            int v14 = [v15 intValue] - 1;
            os_log_t oslog = (os_log_t)sub_10001120C();
            os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              sub_10000CC8C((uint64_t)v31, v14, *((void *)Value + 2));
              _os_log_debug_impl((void *)&_mh_execute_header, oslog, v12, "the new count is %d for %@", v31, 0x12u);
            }
            objc_storeStrong((id *)&oslog, 0);
            CFDictionarySetValue(MutableCopy, @"kHEIMAttrRetainStatus", +[NSNumber numberWithInt:v14]);
            if (*((void *)Value + 3))
            {
              CFRelease(*((CFTypeRef *)Value + 3));
              *((void *)Value + 3) = 0;
            }
            *((void *)Value + 3) = MutableCopy;
            byte_100028FAC = 1;
            if (v14 < 1)
            {
              os_log_t v9 = (os_log_t)sub_10001120C();
              if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
              {
                sub_100006434((uint64_t)v29, *((void *)Value + 2));
                _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "the new count is deleting cache for %@", v29, 0xCu);
              }
              objc_storeStrong((id *)&v9, 0);
              sub_1000086E4((uint64_t)Value, (uint64_t)v28);
            }
          }
          else
          {
            os_log_t v11 = (os_log_t)sub_10001120C();
            os_log_type_t v10 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              sub_100006434((uint64_t)v30, *((void *)Value + 2));
              _os_log_error_impl((void *)&_mh_execute_header, v11, v10, "the retain count is missing: %@", v30, 0xCu);
            }
            objc_storeStrong((id *)&v11, 0);
            if (MutableCopy)
            {
              CFRelease(MutableCopy);
              CFDictionaryRef MutableCopy = 0;
            }
          }
          if (v23)
          {
            CFRelease(v23);
            CFTypeRef v23 = 0;
          }
          if (Value)
          {
            CFRelease(Value);
            CFTypeRef Value = 0;
          }
          objc_storeStrong(&v15, 0);
          int v22 = 0;
        }
      }
      else
      {
        int v22 = 1;
      }
    }
    else
    {
      if (v25)
      {
        CFRelease(v25);
        CFTypeRef v25 = 0;
      }
      int v22 = 1;
    }
  }
  else
  {
    int v22 = 1;
  }
LABEL_46:
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&location, 0);
}

uint64_t sub_10000D454()
{
  predicate = (dispatch_once_t *)&unk_100028FD0;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_100024B68);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  return qword_100028FC8;
}

CFTypeRef sub_10000D4D0(const __CFDictionary *a1, const void *a2, uint64_t a3, uint64_t a4)
{
  if (!a4) {
    heim_abort();
  }
  CFTypeRef cf = CFDictionaryGetValue(a1, a2);
  if (!cf) {
    return 0;
  }
  if (CFGetTypeID(cf) == a3) {
    return cf;
  }
  return 0;
}

void sub_10000D590(const void *a1, const __CFSet *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  char v10 = a7 & 1;
  if (CFDictionaryGetValue((CFDictionaryRef)qword_100028F90, a1)) {
    heim_abort();
  }
  if (!sub_10000D764()) {
    heim_abort();
  }
  CFDateRef value = (void *)_CFRuntimeCreateInstance();
  if (!value) {
    heim_abort();
  }
  value[2] = CFRetain(a1);
  value[3] = a3;
  value[4] = a4;
  value[5] = a5;
  value[6] = a6;
  *((unsigned char *)value + 56) = v10 & 1;
  value[8] = a8;
  CFDictionarySetValue((CFMutableDictionaryRef)qword_100028F90, a1, value);
  if (value) {
    CFRelease(value);
  }
  CFSetApplyFunction(a2, (CFSetApplierFunction)sub_10000D7E0, 0);
}

uint64_t sub_10000D764()
{
  predicate = (dispatch_once_t *)&unk_100028FE0;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_100024C60);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  return qword_100028FD8;
}

void sub_10000D7E0(const __CFDictionary *a1)
{
  CFTypeRef key = (void *)CFDictionaryGetValue(a1, @"kHEIMObjectType");
  if (!key) {
    heim_abort();
  }
  if (CFDictionaryGetValue((CFDictionaryRef)qword_100028F98, key)) {
    heim_abort();
  }
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)sub_100010D74, 0);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_100028F98, key, a1);
}

__CFDictionary *sub_10000D8E0(const void *a1)
{
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(Mutable, @"kHEIMAttrType", @"kHEIMTypeSchema");
  CFDictionarySetValue(Mutable, @"kHEIMObjectType", a1);
  CFDictionarySetValue(Mutable, @"kHEIMAttrType", @"Rs");
  CFDictionarySetValue(Mutable, @"kHEIMAttrClientName", @"s");
  CFDictionarySetValue(Mutable, @"kHEIMAttrServerName", @"s");
  CFDictionarySetValue(Mutable, @"kHEIMAttrUUID", @"Gu");
  CFDictionarySetValue(Mutable, @"kHEIMAttrDisplayName", @"s");
  CFDictionarySetValue(Mutable, @"kHEIMAttrCredential", @"b");
  CFDictionarySetValue(Mutable, @"kHEIMAttrLeadCredential", @"b");
  CFDictionarySetValue(Mutable, @"kHEIMAttrParentCredential", @"u");
  CFDictionarySetValue(Mutable, @"kHEIMAttrBundleIdentifierACL", @"as");
  CFDictionarySetValue(Mutable, @"kHEIMAttrDefaultCredential", @"b");
  CFDictionarySetValue(Mutable, @"kHEIMAttrAuthTime", @"t");
  CFDictionarySetValue(Mutable, @"kHEIMAttrStoreTime", @"Gt");
  CFDictionarySetValue(Mutable, @"kHEIMAttrData", @"d");
  CFDictionarySetValue(Mutable, @"kHEIMAttrRetainStatus", @"n");
  CFDictionarySetValue(Mutable, @"kHEIMAttrAltDSID", @"s");
  CFDictionarySetValue(Mutable, @"kHEIMAttrUserID", @"n");
  CFDictionarySetValue(Mutable, @"kHEIMAttrASID", @"n");
  CFDictionarySetValue(Mutable, @"kHEIMAttrTemporaryCache", @"b");
  return Mutable;
}

id sub_10000DB44(uint64_t a1)
{
  uint64_t v20 = a1;
  id v19 = *(id *)(a1 + 24);
  id v18 = [&__NSDictionary0__struct mutableCopy];
  id v1 = [v19 objectForKeyedSubscript:@"kHEIMAttrParentCredential"];
  BOOL v17 = v1 == 0;

  if (v17)
  {
    id v4 = [v19 objectForKeyedSubscript:@"kHEIMAttrClientName"];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    id v5 = [v19 objectForKeyedSubscript:@"kHEIMAttrBundleIdentifierACL"];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    id v6 = [v19 objectForKeyedSubscript:@"kHEIMAttrAltDSID"];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    id v7 = [v19 objectForKeyedSubscript:@"kHEIMAttrUserID"];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    id v8 = [v19 objectForKeyedSubscript:@"kHEIMAttrRetainStatus"];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    sub_10000EE4C(v19, @"kHEIMAttrUUID", v18, @"uuid");
  }
  else
  {
    id v9 = [v19 objectForKeyedSubscript:@"kHEIMAttrClientName"];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    id v10 = [v19 objectForKeyedSubscript:@"kHEIMAttrServerName"];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    id v11 = [v19 objectForKeyedSubscript:@"kHEIMAttrExpire"];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    id v12 = [v19 objectForKeyedSubscript:@"kHEIMAttrAuthTime"];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    id v13 = [v19 objectForKeyedSubscript:@"kHEIMAttrRenewTill"];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    pthread_mutex_lock((pthread_mutex_t *)(v20 + 40));
    int v14 = +[NSDate dateWithTimeIntervalSince1970:(double)*(uint64_t *)(v20 + 104)];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    id v15 = +[NSNumber numberWithInt:*(unsigned int *)(v20 + 144)];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    id v16 = +[NSDate dateWithTimeIntervalSince1970:(double)*(uint64_t *)(v20 + 128)];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    pthread_mutex_unlock((pthread_mutex_t *)(v20 + 40));
    [v18 setObject:*(void *)(*(void *)(v20 + 32) + 16) forKeyedSubscript:@"mech"];
    sub_10000EE4C(v19, @"kHEIMAttrUUID", v18, @"uuid");
    sub_10000EE4C(v19, @"kHEIMAttrParentCredential", v18, @"parent");
  }
  id location = 0;
  objc_storeStrong(&location, v18);
  id v3 = location;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  return v3;
}

id sub_10000E040(void *a1)
{
  id v19 = a1;
  id v18 = objc_alloc_init((Class)NSMutableDictionary);
  id v17 = v19;
  v22[0] = @"kHEIMAttrType";
  v22[1] = @"kHEIMObjectType";
  id v22[2] = @"kHEIMAttrUUID";
  v22[3] = @"kHEIMAttrParentCredential";
  v22[4] = @"kHEIMAttrASID";
  v22[5] = @"kHEIMAttrAltDSID";
  v22[6] = @"kHEIMAttrUserID";
  v22[7] = @"kHEIMAttrDefaultCredential";
  v22[8] = @"kHEIMAttrBundleIdentifierACL";
  v22[9] = @"kHEIMAttrClientName";
  v22[10] = @"kHEIMAttrServerName";
  v22[11] = @"kHEIMAttrDisplayName";
  v22[12] = @"kHEIMAttrExpire";
  v22[13] = @"kHEIMAttrAuthTime";
  v22[14] = @"kHEIMAttrStoreTime";
  v22[15] = @"kHEIMAttrRenewTill";
  v22[16] = @"kHEIMAttrRetainStatus";
  v22[17] = @"kHEIMAttrLeadCredential";
  v22[18] = @"kHEIMAttrNTLMUsername";
  v22[19] = @"kHEIMAttrNTLMDomain";
  v22[20] = @"kHEIMAttrTransient";
  v22[21] = @"kHEIMAttrAllowedDomain";
  v22[22] = @"kHEIMAttrStatus";
  v22[23] = @"kHEIMAttrTemporaryCache";
  id v16 = +[NSArray arrayWithObjects:v22 count:24];
  memset(__b, 0, sizeof(__b));
  id obj = v16;
  id v13 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
  if (v13)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0;
    id v11 = v13;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void *)(__b[1] + 8 * v10);
      id v7 = [v17 objectForKeyedSubscript:v15];
      objc_msgSend(v18, "setObject:forKeyedSubscript:");

      ++v10;
      if (v8 + 1 >= (unint64_t)v11)
      {
        uint64_t v10 = 0;
        id v11 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  id v1 = [v17 objectForKeyedSubscript:@"kHEIMAttrData"];
  BOOL v6 = v1 == 0;

  if (!v6) {
    [v18 setObject:@"<private>" forKeyedSubscript:@"kHEIMAttrData"];
  }
  id v2 = [v17 objectForKeyedSubscript:@"kHEIMAttrNTLMSessionKey"];
  BOOL v5 = v2 == 0;

  if (!v5) {
    [v18 setObject:@"<private>" forKeyedSubscript:@"kHEIMAttrNTLMSessionKey"];
  }
  id location = 0;
  objc_storeStrong(&location, v18);
  id v4 = location;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  return v4;
}

void sub_10000E4DC()
{
  CFMutableArrayRef Mutable = CFSetCreateMutable(0, 0, &kCFTypeSetCallBacks);
  CFDateRef value = sub_10000D8E0(@"kHEIMObjectConfiguration");
  CFSetAddValue(Mutable, value);
  if (value) {
    CFRelease(value);
  }
  sub_10000D590(@"kHEIMTypeConfiguration", Mutable, (uint64_t)sub_10000E5E0, 0, 0, (uint64_t)sub_10000E040, 0, 0);
  if (Mutable) {
    CFRelease(Mutable);
  }
}

id sub_10000E5E0(uint64_t a1)
{
  uint64_t v10 = a1;
  id v9 = *(id *)(a1 + 24);
  id v8 = [&__NSDictionary0__struct mutableCopy];
  id v6 = [v9 objectForKeyedSubscript:@"kHEIMAttrClientName"];
  objc_msgSend(v8, "setObject:forKeyedSubscript:");

  id v7 = (__CFString *)[v9 objectForKeyedSubscript:@"kHEIMAttrServerName"];
  if (v7) {
    CFStringRef v5 = v7;
  }
  else {
    CFStringRef v5 = @"none";
  }
  [v8 setObject:v5 forKeyedSubscript:@"servername"];

  id v2 = [v9 objectForKeyedSubscript:@"kHEIMAttrAuthTime"];
  objc_msgSend(v8, "setObject:forKeyedSubscript:");

  id v3 = [v9 objectForKeyedSubscript:@"kHEIMAttrUserID"];
  objc_msgSend(v8, "setObject:forKeyedSubscript:");

  [v8 setObject:*(void *)(*(void *)(v10 + 32) + 16) forKeyedSubscript:@"mech"];
  sub_10000EE4C(v9, @"kHEIMAttrUUID", v8, @"uuid");
  sub_10000EE4C(v9, @"kHEIMAttrParentCredential", v8, @"parent");
  id location = 0;
  objc_storeStrong(&location, v8);
  id v4 = location;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  return v4;
}

void sub_10000E824(CFTypeRef *a1)
{
  if (a1[1])
  {
    CFRelease(a1[1]);
    a1[1] = 0;
  }
  if (a1[2])
  {
    CFRelease(a1[2]);
    a1[2] = 0;
  }
  if (a1[9])
  {
    CFRelease(a1[9]);
    a1[9] = 0;
  }
  if (a1[7])
  {
    CFRelease(a1[7]);
    a1[7] = 0;
  }
  free(a1);
}

void sub_10000E930(unsigned int a1)
{
  unsigned int valuePtr = a1;
  if (byte_100028F10)
  {
    CFNumberRef v7 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFTypeRef Value = CFDictionaryGetValue((CFDictionaryRef)qword_100028F80, &off_100026378);
    if (Value) {
      sub_10000EBCC((uint64_t)Value, valuePtr);
    }
    id location = sub_10001120C();
    os_log_type_t v4 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
    {
      sub_100006434((uint64_t)v10, (uint64_t)v7);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)location, v4, "Session ended: %@", v10, 0xCu);
    }
    objc_storeStrong(&location, 0);
    if (v7)
    {
      CFRelease(v7);
      CFNumberRef v7 = 0;
    }
  }
  else
  {
    CFTypeRef key = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    if (!key) {
      heim_abort();
    }
    CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_100028F80, key);
    os_log_t oslog = (os_log_t)sub_10001120C();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      sub_100006434((uint64_t)v9, (uint64_t)key);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_INFO, "Session ended: %@", v9, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (key) {
      CFRelease(key);
    }
  }
}

void sub_10000EBCC(uint64_t a1, unsigned int a2)
{
  uint64_t v16 = a1;
  unsigned int v15 = a2;
  id location = sub_10001120C();
  os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    sub_100010EA0((uint64_t)v17, v15);
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)location, v13, "HeimCredRemoveItemsForASID: %d", v17, 8u);
  }
  objc_storeStrong(&location, 0);
  id v12 = [&__NSArray0__struct mutableCopy];
  id v11 = +[NSNumber numberWithInt:v15];
  id v10 = *(id *)(v16 + 24);
  id v2 = v10;
  id v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_100010ED8;
  CFNumberRef v7 = &unk_100024CE8;
  id v8 = v11;
  id v9 = v12;
  [v2 enumerateKeysAndObjectsUsingBlock:&v3];
  objc_msgSend(v12, "enumerateObjectsUsingBlock:");
  objc_storeStrong(&v9, 0);
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v12, 0);
}

void sub_10000EE4C(void *a1, void *a2, void *a3, void *a4)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v11 = 0;
  objc_storeStrong(&v11, a2);
  id v10 = 0;
  objc_storeStrong(&v10, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v7 = [location objectForKeyedSubscript:v11];

  if (v7)
  {
    CFStringRef v8 = CFUUIDCreateString(0, (CFUUIDRef)v7);
    if (v8)
    {
      [v10 setObject:v8 forKeyedSubscript:v9];
      CFRelease(v8);
    }
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
}

id sub_10000EFA4(uint64_t a1)
{
  uint64_t v13 = a1;
  id v12 = *(id *)(a1 + 24);
  id v11 = [&__NSDictionary0__struct mutableCopy];
  id v2 = [v12 objectForKeyedSubscript:@"kHEIMAttrClientName"];
  objc_msgSend(v11, "setObject:forKeyedSubscript:");

  id v3 = [v12 objectForKeyedSubscript:@"kHEIMAttrExpire"];
  objc_msgSend(v11, "setObject:forKeyedSubscript:");

  id v4 = [v12 objectForKeyedSubscript:@"kHEIMAttrStatus"];
  objc_msgSend(v11, "setObject:forKeyedSubscript:");

  id v5 = [v12 objectForKeyedSubscript:@"kHEIMAttrAuthTime"];
  objc_msgSend(v11, "setObject:forKeyedSubscript:");

  pthread_mutex_lock((pthread_mutex_t *)(v13 + 40));
  id v6 = +[NSDate dateWithTimeIntervalSince1970:(double)*(uint64_t *)(v13 + 104)];
  objc_msgSend(v11, "setObject:forKeyedSubscript:");

  id v7 = +[NSDate dateWithTimeIntervalSince1970:(double)*(uint64_t *)(v13 + 120)];
  objc_msgSend(v11, "setObject:forKeyedSubscript:");

  CFStringRef v8 = +[NSDate dateWithTimeIntervalSince1970:(double)*(uint64_t *)(v13 + 128)];
  objc_msgSend(v11, "setObject:forKeyedSubscript:");

  id v9 = +[NSNumber numberWithInt:*(unsigned int *)(v13 + 144)];
  objc_msgSend(v11, "setObject:forKeyedSubscript:");

  pthread_mutex_unlock((pthread_mutex_t *)(v13 + 40));
  [v11 setObject:*(void *)(*(void *)(v13 + 32) + 16) forKeyedSubscript:@"mech"];
  sub_10000EE4C(v12, @"kHEIMAttrUUID", v11, @"uuid");
  sub_10000EE4C(v12, @"kHEIMAttrParentCredential", v11, @"parent");
  id location = 0;
  objc_storeStrong(&location, v11);
  id v10 = location;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  return v10;
}

BOOL sub_10000F2F4(uint64_t a1)
{
  BOOL v2 = 0;
  if (CFEqual(*(CFTypeRef *)(*(void *)(a1 + 32) + 16), @"kHEIMTypeKerberosAcquireCred")) {
    return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), @"kHEIMAttrCredential") != 0;
  }
  return v2;
}

void sub_10000F378(const void *a1, uint64_t a2, const void *a3)
{
  id v4 = (CFDictionaryRef *)CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 24), a1);
  if (v4)
  {
    CFMutableDictionaryRef theDict = CFDictionaryCreateMutableCopy(0, 0, v4[3]);
    if (a3) {
      CFDictionarySetValue(theDict, @"kHEIMAttrDefaultCredential", a3);
    }
    else {
      CFDictionaryRemoveValue(theDict, @"kHEIMAttrDefaultCredential");
    }
    if (v4[3])
    {
      CFRelease(v4[3]);
      v4[3] = 0;
    }
    v4[3] = theDict;
  }
}

void sub_10000F478(uint64_t *a1, void *a2, void *a3, unsigned char *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v16 = 0;
  objc_storeStrong(&v16, a3);
  unsigned int v15 = a4;
  int v14 = a1;
  uint64_t v13 = (const __CFDictionary **)v16;
  CFTypeRef Value = 0;
  CFTypeRef Value = CFDictionaryGetValue(*((CFDictionaryRef *)v16 + 3), @"kHEIMAttrParentCredential");
  BOOL v11 = 0;
  BOOL v8 = 1;
  if (!sub_100004F5C(v13[3])) {
    BOOL v8 = sub_1000067A0(a1[4], v13[3]);
  }
  BOOL v11 = v8;
  if (CFEqual(*((CFTypeRef *)v13[4] + 2), *(CFTypeRef *)(a1[5] + 16))
    && Value
    && !v11
    && CFDictionaryGetValue(v13[3], @"kHEIMAttrLeadCredential") == kCFBooleanTrue)
  {
    id v10 = (id)CFDictionaryGetValue(v13[3], @"kHEIMAttrExpire");
    [v10 timeIntervalSinceNow];
    if (v4 > 0.0)
    {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1[4] + 40), *((const void **)v13[4] + 2), Value);
      sub_10000F378(Value, a1[4], kCFBooleanTrue);
      byte_100028FAC = 1;
      os_log_t oslog = (os_log_t)sub_10001120C();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        sub_10000F754((uint64_t)v18, *((void *)v13[4] + 2), (uint64_t)v13);
        _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "The default for %@ credential is now %@", v18, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
      *unsigned int v15 = 1;
    }
    objc_storeStrong(&v10, 0);
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

uint64_t sub_10000F754(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t sub_10000F7A4(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 3;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 33;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t sub_10000F7E4(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)result = 3;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 33;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 32;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_10000F83C(uint64_t a1, const void *a2, uint64_t a3)
{
  CFTypeID v3 = CFGetTypeID(a2);
  if (v3 != CFDictionaryGetTypeID()) {
    heim_abort();
  }
  *(void *)(a3 + 32) = a2;
  *(void *)(a3 + 40) = 0;
  CFDictionaryApplyFunction(*(CFDictionaryRef *)(a3 + 16), (CFDictionaryApplierFunction)sub_10000FB00, (void *)a3);
  if (*(void *)(a3 + 24) < *(void *)(a3 + 40)) {
    heim_abort();
  }
  if (*(void *)(a3 + 24) == *(void *)(a3 + 40)) {
    CFArrayAppendValue(*(CFMutableArrayRef *)(a3 + 8), a2);
  }
}

void sub_10000F968(const void *a1, void *a2, void **a3)
{
  if (sub_100006894(*a3, a1, 0))
  {
    CFTypeID v3 = CFGetTypeID(a2);
    if (v3 != sub_10001324C()) {
      heim_abort();
    }
    if (a2[3])
    {
      a3[4] = (void *)a2[3];
      a3[5] = 0;
      CFDictionaryApplyFunction((CFDictionaryRef)a3[2], (CFDictionaryApplierFunction)sub_10000FB00, a3);
      if ((uint64_t)a3[3] < (uint64_t)a3[5]) {
        heim_abort();
      }
      if (a3[3] == a3[5] && sub_10000A6C4(a2[4], (uint64_t)a3[6])) {
        CFArrayAppendValue((CFMutableArrayRef)a3[1], a2);
      }
    }
  }
}

uint64_t sub_10000FB00(const void *a1, const void *a2, uint64_t a3)
{
  if (!*(void *)(a3 + 32)) {
    heim_abort();
  }
  if (CFEqual(a1, @"kHEIMObjectType"))
  {
    uint64_t result = CFEqual(a2, @"kHEIMObjectAny");
    if ((_BYTE)result)
    {
      ++*(void *)(a3 + 40);
      return result;
    }
  }
  CFTypeRef cf1 = CFDictionaryGetValue(*(CFDictionaryRef *)(a3 + 32), a1);
  if (cf1)
  {
    uint64_t result = CFEqual(cf1, a2);
    if (!(_BYTE)result) {
      return result;
    }
  }
  else
  {
    uint64_t result = CFEqual(kCFNull, a2);
    if (!(_BYTE)result) {
      return result;
    }
  }
  ++*(void *)(a3 + 40);
  return result;
}

void sub_10000FC54(uint64_t a1, uint64_t a2)
{
  CFTypeRef cf1 = CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 56) + 40), *(const void **)(*(void *)(a2 + 32) + 16));
  if (cf1)
  {
    if (CFEqual(cf1, *(CFTypeRef *)(a2 + 16)))
    {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(void *)(a1 + 56) + 40), *(const void **)(*(void *)(a2 + 32) + 16));
      *(_DWORD *)(*(void *)(a1 + 56) + 48) = 1;
      sub_100007D9C(a1);
    }
  }
}

BOOL sub_10000FD08(uint64_t a1)
{
  BOOL v2 = 0;
  if (CFEqual(*(CFTypeRef *)(*(void *)(a1 + 32) + 16), @"kHEIMTypeKerberos")) {
    return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), @"kHEIMAttrLeadCredential") == kCFBooleanTrue;
  }
  return v2;
}

void sub_10000FD98(const void *a1, const void *a2, CFTypeRef *a3)
{
  id v12 = a1;
  CFTypeRef v11 = a2;
  id v10 = a3;
  id v9 = a3;
  if (!CFEqual(a1, *a3))
  {
    CFTypeRef v8 = v11;
    CFTypeID v3 = CFGetTypeID(v11);
    if (v3 != sub_10001324C()) {
      heim_abort();
    }
    CFTypeRef cf2 = 0;
    CFTypeRef cf2 = CFDictionaryGetValue(*((CFDictionaryRef *)v8 + 3), @"kHEIMAttrParentCredential");
    if (cf2)
    {
      if (CFEqual(*v9, cf2))
      {
        CFArrayAppendValue((CFMutableArrayRef)v9[1], *((const void **)v8 + 2));
        CFTypeRef v5 = 0;
        CFTypeRef v6 = 0;
        context = v12;
        CFTypeRef v5 = v9[1];
        CFTypeRef v6 = v9[2];
        CFDictionaryApplyFunction(*((CFDictionaryRef *)v9[2] + 3), (CFDictionaryApplierFunction)sub_10000FD98, &context);
      }
    }
  }
}

void sub_10000FF00(const void *a1, uint64_t a2)
{
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFUUIDGetTypeID()) {
    heim_abort();
  }
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a2 + 24), a1);
}

void sub_10000FF84(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = a1;
  uint64_t v15 = a2;
  int v14 = a3;
  uint64_t v13 = a2;
  id v12 = a3;
  id v17 = (__CFString *)CFUUIDCreateString(0, *(CFUUIDRef *)(v13 + 16));
  id v11 = v17;
  if (*(void *)(*(void *)(v13 + 32) + 24))
  {
    CFTypeRef v10 = 0;
    CFTypeRef v10 = (CFTypeRef)(*(uint64_t (**)(uint64_t))(*(void *)(v13 + 32) + 24))(v13);
    if (v10)
    {
      if (v11)
      {
        id v9 = (id)_CFXPCCreateXPCObjectFromCFObject();
        CFRelease(v10);
        CFTypeRef v10 = 0;
        if (v9)
        {
          CFTypeRef v5 = (const char *)[v11 UTF8String];
          if (v5) {
            xpc_dictionary_set_value(v12, v5, v9);
          }
          else {
            xpc_dictionary_set_value(v12, "none", v9);
          }
        }
        else
        {
          id location = sub_10001120C();
          char v7 = 16;
          if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
          {
            log = location;
            os_log_type_t type = v7;
            sub_100003CE0(v6);
            _os_log_error_impl((void *)&_mh_execute_header, log, type, "status callback failed to convert to xpc object", v6, 2u);
          }
          objc_storeStrong(&location, 0);
        }
        objc_storeStrong(&v9, 0);
      }
    }
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
}

void sub_1000101B8(id a1)
{
  qword_100028FC8 = _CFRuntimeRegisterClass();
}

void sub_1000101F4(CFTypeRef *a1)
{
  if (a1[3])
  {
    CFRelease(a1[3]);
    a1[3] = 0;
  }
  if (a1[5])
  {
    CFRelease(a1[5]);
    a1[5] = 0;
  }
  if (a1[4])
  {
    CFRelease(a1[4]);
    a1[4] = 0;
  }
}

CFStringRef sub_1000102C8()
{
  return @"debugsession";
}

void sub_1000102E0(const void *a1, uint64_t a2, const __CFDictionary **a3)
{
  uint64_t v15 = a1;
  uint64_t v14 = a2;
  uint64_t v13 = a3;
  id v12 = a3;
  CFStringRef v11 = 0;
  CFDictionaryRef v7 = *a3;
  CFTypeID TypeID = CFStringGetTypeID();
  CFStringRef v11 = (const __CFString *)sub_10000D4D0(v7, a1, TypeID, (uint64_t)v12[2]);
  if (v11)
  {
    if (sub_100010498(v11, @"W")) {
      CFDictionaryRemoveValue(v12[1], v15);
    }
  }
  else
  {
    long long v17 = *(_OWORD *)&off_100024BF8;
    v16[0] = v15;
    v16[1] = kCFBooleanTrue;
    sub_100007D24(v12[2], 564480, (const void *const *)&v17, v16, 2);
    os_log_t oslog = (os_log_t)sub_10001120C();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v5 = type;
      sub_100003CE0(v8);
      _os_log_error_impl((void *)&_mh_execute_header, log, v5, "unknown key", v8, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
}

BOOL sub_100010498(const __CFString *a1, const __CFString *a2)
{
  return CFStringFind(a1, a2, 0).location != -1;
}

void sub_100010518(const void *a1, uint64_t a2, const __CFDictionary **a3)
{
  uint64_t v15 = a1;
  uint64_t v14 = a2;
  uint64_t v13 = a3;
  id v12 = a3;
  CFTypeRef v11 = 0;
  CFDictionaryRef v7 = *a3;
  CFTypeID TypeID = CFStringGetTypeID();
  CFTypeRef v11 = sub_10000D4D0(v7, a1, TypeID, (uint64_t)v12[3]);
  if (!v11)
  {
    long long v17 = *(_OWORD *)&off_100024C18;
    v16[0] = v15;
    v16[1] = kCFBooleanTrue;
    sub_100007D24(v12[3], 564480, (const void *const *)&v17, v16, 2);
    *((unsigned char *)v12 + 32) = 0;
    os_log_t oslog = (os_log_t)sub_10001120C();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v5 = type;
      sub_100003CE0(v8);
      _os_log_error_impl((void *)&_mh_execute_header, log, v5, "unknown key", v8, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
}

void sub_1000106AC(const __CFString *a1, const __CFString *a2, void *a3)
{
  CFStringRef v23 = a1;
  CFStringRef v22 = a2;
  id v21 = a3;
  context = a3;
  CFStringRef v19 = a2;
  CFTypeRef cf = 0;
  if (!CFEqual(@"kHEIMObjectType", a1))
  {
    CFTypeRef cf = CFDictionaryGetValue(*((CFDictionaryRef *)context + 1), v23);
    if (cf)
    {
      CFTypeID v14 = sub_100010A68(v23, v19, 1);
      if (v14 != CFGetTypeID(cf))
      {
        long long v29 = *(_OWORD *)&off_100024C40;
        CFStringRef v30 = @"CommonErrorCode";
        v28[0] = v23;
        v28[1] = v19;
        v28[2] = kCFBooleanTrue;
        sub_100007D24(*((CFErrorRef *)context + 3), 564481, (const void *const *)&v29, v28, 3);
        *((unsigned char *)context + 32) = 0;
        os_log_t v13 = (os_log_t)sub_10001120C();
        os_log_type_t v12 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          CFDictionaryRef v7 = v13;
          os_log_type_t v8 = v12;
          sub_100003CE0(v11);
          _os_log_error_impl((void *)&_mh_execute_header, v7, v8, "key have wrong type key", v11, 2u);
        }
        objc_storeStrong((id *)&v13, 0);
      }
      CFTypeID v6 = v14;
      if (v6 == CFArrayGetTypeID())
      {
        CFTypeID v3 = sub_100010A68(v23, v19, 0);
        *((void *)context + 2) = v3;
        CFArrayRef theArray = (const __CFArray *)cf;
        CFIndex Count = CFArrayGetCount((CFArrayRef)cf);
        uint64_t v25 = 0;
        CFIndex v24 = Count;
        uint64_t v26 = 0;
        CFIndex v27 = Count;
        v34.id location = 0;
        v34.length = Count;
        CFArrayApplyFunction(theArray, v34, (CFArrayApplierFunction)sub_100010BEC, context);
      }
    }
    else if (sub_100010498(v19, @"R"))
    {
      long long v32 = *(_OWORD *)&off_100024C28;
      CFStringRef v33 = @"CommonErrorCode";
      v31[0] = v23;
      v31[1] = v19;
      v31[2] = kCFBooleanTrue;
      sub_100007D24(*((CFErrorRef *)context + 3), 564481, (const void *const *)&v32, v31, 3);
      *((unsigned char *)context + 32) = 0;
      os_log_t oslog = (os_log_t)sub_10001120C();
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        os_log_type_t v10 = type;
        sub_100003CE0(v15);
        _os_log_error_impl((void *)&_mh_execute_header, log, v10, "key missing key", v15, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
  }
}

CFTypeID sub_100010A68(const __CFString *a1, const __CFString *a2, char a3)
{
  if ((a3 & 1) != 0 && sub_100010498(a2, @"a")) {
    return CFArrayGetTypeID();
  }
  if (sub_100010498(a2, @"s")) {
    return CFStringGetTypeID();
  }
  if (sub_100010498(a2, @"u")) {
    return CFUUIDGetTypeID();
  }
  if (sub_100010498(a2, @"d")) {
    return CFDataGetTypeID();
  }
  if (sub_100010498(a2, @"b")) {
    return CFBooleanGetTypeID();
  }
  if (sub_100010498(a2, @"t")) {
    return CFDateGetTypeID();
  }
  if (sub_100010498(a2, @"n")) {
    return CFNumberGetTypeID();
  }
  rk_cfstring2cstring(a2);
  rk_cfstring2cstring(a1);
  heim_abort();
  return v6;
}

CFTypeID sub_100010BEC(const void *a1, uint64_t a2)
{
  CFTypeID result = CFGetTypeID(a1);
  if (result != *(void *)(a2 + 16))
  {
    CFStringRef v5 = @"CommonErrorCode";
    CFBooleanRef v4 = kCFBooleanTrue;
    CFTypeID result = (CFTypeID)sub_100007D24(*(CFErrorRef *)(a2 + 24), 564480, (const void *const *)&v5, (const void *const *)&v4, 1);
    *(unsigned char *)(a2 + 32) = 0;
  }
  return result;
}

void sub_100010CBC(id a1)
{
  qword_100028FD8 = _CFRuntimeRegisterClass();
}

void sub_100010CF8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    CFRelease(*(CFTypeRef *)(a1 + 16));
    *(void *)(a1 + 16) = 0;
  }
}

CFStringRef sub_100010D5C()
{
  return @"debugmech";
}

void sub_100010D74(const __CFString *a1, const __CFString *a2)
{
  if (!CFEqual(@"kHEIMObjectType", a1))
  {
    CFTypeID v3 = sub_100010A68(a1, a2, 1);
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)qword_100028FA0, a1);
    if (Value)
    {
      if (sub_100010A68(a1, Value, 1) != v3)
      {
        rk_cfstring2cstring(a1);
        heim_abort();
      }
    }
    else
    {
      CFDictionarySetValue((CFMutableDictionaryRef)qword_100028FA0, a1, a2);
    }
  }
}

uint64_t sub_100010EA0(uint64_t result, int a2)
{
  *(unsigned char *)CFTypeID result = 0;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

void sub_100010ED8(id *a1, void *a2, void *a3, uint64_t a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v12 = 0;
  objc_storeStrong(&v12, a3);
  uint64_t v11 = a4;
  os_log_type_t v10 = a1;
  id v9 = (CFDictionaryRef *)v12;
  if (v12 && v9[3])
  {
    id v8 = (id)CFDictionaryGetValue(v9[3], @"kHEIMAttrASID");
    if ([a1[4] isEqualToNumber:v8])
    {
      [a1[5] addObject:location[0]];
      os_log_t oslog = (os_log_t)sub_10001120C();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        sub_100006434((uint64_t)v14, (uint64_t)location[0]);
        _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "item to be deleted: %@", v14, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    objc_storeStrong(&v8, 0);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

void sub_1000110A4(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v12 = a3;
  uint64_t v11 = a4;
  os_log_type_t v10 = a1;
  CFTypeRef key = location[0];
  CFStringRef Value = 0;
  CFStringRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1[4] + 24), location[0]);
  if (Value)
  {
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1[4] + 24), key);
    os_log_t oslog = (os_log_t)sub_10001120C();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      sub_100006434((uint64_t)v14, (uint64_t)key);
      _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "item deleted: %@", v14, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(location, 0);
}

id sub_10001120C()
{
  predicate = (dispatch_once_t *)&unk_100028FE8;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_100024D28);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  id v0 = (void *)qword_100028FF0;

  return v0;
}

void sub_100011298(id a1)
{
  os_log_t v1 = os_log_create("com.apple.Heimdal", "GSSCred");
  CFTypeID v2 = (void *)qword_100028FF0;
  qword_100028FF0 = (uint64_t)v1;
}

void sub_1000112E8()
{
  CFMutableArrayRef Mutable = CFSetCreateMutable(0, 0, &kCFTypeSetCallBacks);
  id v0 = sub_10000D8E0(@"kHEIMObjectNTLM");
  CFDictionarySetValue(v0, @"kHEIMAttrData", @"Wd");
  CFDictionarySetValue(v0, @"kHEIMAttrNTLMUsername", @"Rs");
  CFDictionarySetValue(v0, @"kHEIMAttrNTLMDomain", @"Rs");
  CFDictionarySetValue(v0, @"kHEIMAttrTransient", @"b");
  CFDictionarySetValue(v0, @"kHEIMAttrAllowedDomain", @"as");
  CFDictionarySetValue(v0, @"kHEIMAttrStatus", @"n");
  CFDictionarySetValue(v0, @"kHEIMAttrLabelValue", @"d");
  CFSetAddValue(Mutable, v0);
  if (v0) {
    CFRelease(v0);
  }
  sub_10000D590(@"kHEIMTypeNTLM", Mutable, 0, (uint64_t)sub_1000114B0, 0, (uint64_t)sub_10000E040, 0, 0);
  if (Mutable) {
    CFRelease(Mutable);
  }
}

CFDictionaryRef sub_1000114B0(void *a1, uint64_t a2, const __CFDictionary *a3)
{
  v73 = a1;
  uint64_t v72 = a2;
  CFDictionaryRef v71 = a3;
  CFDictionaryRef v70 = 0;
  CFDataRef v69 = 0;
  CFDataRef v68 = 0;
  CFDataRef v67 = 0;
  CFDataRef v66 = 0;
  CFDataRef v65 = 0;
  CFStringRef v64 = 0;
  CFStringRef v63 = 0;
  CFStringRef v62 = 0;
  CFNumberRef v61 = 0;
  CFNumberRef v60 = 0;
  CFDataRef v59 = 0;
  uint64_t Attributes = 0;
  v57 = 0;
  CFStringRef v56 = 0;
  CFBooleanRef v55 = 0;
  int valuePtr = 0;
  int v53 = 0;
  unint64_t v52 = 0;
  CFIndex Length = 0;
  BytePtr = 0;
  unint64_t v48 = 0;
  CFBooleanRef v49 = 0;
  size_t v46 = 0;
  CFStringRef v47 = 0;
  CFIndex v44 = 0;
  CFStringRef v45 = 0;
  size_t v42 = 0;
  CFTypeRef v43 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  id v38 = 0;
  int v39 = 0;
  memset(__b, 0, sizeof(__b));
  memset(v80, 0, sizeof(v80));
  memset(v37, 0, sizeof(v37));
  int v36 = 0;
  id location = sub_10001120C();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    log = location;
    os_log_type_t v24 = type;
    sub_100003CE0(v33);
    _os_log_debug_impl((void *)&_mh_execute_header, log, v24, "NTLMAuthCallback", v33, 2u);
  }
  objc_storeStrong(&location, 0);
  CFIndex Length = 0;
  BytePtr = 0;
  unint64_t v48 = 0;
  CFBooleanRef v49 = 0;
  size_t v46 = 0;
  CFStringRef v47 = 0;
  CFIndex v44 = 0;
  CFStringRef v45 = 0;
  size_t v42 = 0;
  CFTypeRef v43 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  id v38 = 0;
  int v39 = 0;
  memset(__b, 0, sizeof(__b));
  memset(v80, 0, sizeof(v80));
  memset(v37, 0, sizeof(v37));
  uint64_t Attributes = HeimCredGetAttributes();
  if (Attributes)
  {
    CFDictionaryRef v22 = (const __CFDictionary *)Attributes;
    CFTypeID TypeID = CFDataGetTypeID();
    CFDataRef v59 = (CFDataRef)sub_1000127BC(v22, @"kHEIMAttrData", TypeID);
    if (v59)
    {
      BytePtr = CFDataGetBytePtr(v59);
      CFIndex Length = CFDataGetLength(v59);
      CFDictionaryRef v21 = v71;
      CFTypeID v4 = CFDataGetTypeID();
      CFDataRef v68 = (CFDataRef)sub_1000127BC(v21, @"kHEIMAttrNTLMType2Data", v4);
      if (v68)
      {
        CFStringRef v45 = CFDataGetBytePtr(v68);
        CFIndex v44 = CFDataGetLength(v68);
        CFDictionaryRef v20 = v71;
        CFTypeID v5 = CFDataGetTypeID();
        CFDataRef v65 = (CFDataRef)sub_1000127BC(v20, @"kHEIMAttrNTLMChannelBinding", v5);
        if (v65)
        {
          int v39 = CFDataGetBytePtr(v65);
          id v38 = (void *)CFDataGetLength(v65);
          CFDictionaryRef v19 = v71;
          CFTypeID v6 = CFDataGetTypeID();
          CFDataRef v69 = (CFDataRef)sub_1000127BC(v19, @"kHEIMAttrNTLMType1Data", v6);
          if (v69)
          {
            CFStringRef v47 = CFDataGetBytePtr(v69);
            size_t v46 = CFDataGetLength(v69);
            CFDictionaryRef v18 = v71;
            CFTypeID v7 = CFStringGetTypeID();
            CFStringRef v64 = (const __CFString *)sub_1000127BC(v18, @"kHEIMAttrNTLMClientTargetName", v7);
            if (v64)
            {
              CFBooleanRef v55 = rk_cfstring2cstring(v64);
              if (v55)
              {
                CFDictionaryRef v17 = v71;
                CFTypeID v8 = CFNumberGetTypeID();
                CFNumberRef v61 = (CFNumberRef)sub_1000127BC(v17, @"kHEIMAttrNTLMClientFlags", v8);
                if (v61)
                {
                  CFRetain(v61);
                  if (CFNumberGetValue(v61, kCFNumberSInt32Type, &valuePtr))
                  {
                    CFDictionaryRef v16 = v71;
                    CFTypeID v9 = CFStringGetTypeID();
                    CFStringRef v63 = (const __CFString *)sub_1000127BC(v16, @"kHEIMAttrNTLMUsername", v9);
                    if (v63)
                    {
                      v57 = rk_cfstring2cstring(v63);
                      if (v57)
                      {
                        CFDictionaryRef v15 = v71;
                        CFTypeID v10 = CFStringGetTypeID();
                        CFStringRef v62 = (const __CFString *)sub_1000127BC(v15, @"kHEIMAttrNTLMDomain", v10);
                        if (v62)
                        {
                          CFRetain(v62);
                          CFStringRef v56 = rk_cfstring2cstring(v62);
                          if (v56)
                          {
                            CFBooleanRef v49 = v45;
                            unint64_t v48 = v44;
                            int v36 = heim_ntlm_decode_type2();
                            if (v36)
                            {
                              id v32 = sub_10001120C();
                              os_log_type_t v31 = OS_LOG_TYPE_ERROR;
                              if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
                              {
                                sub_100010EA0((uint64_t)v77, v36);
                                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v32, v31, "heim_ntlm_decode_type2 (%d)\n", v77, 8u);
                              }
                              objc_storeStrong(&v32, 0);
                            }
                            else if (sub_100009E20(v73, (uint64_t)&__b[4]))
                            {
                              id v30 = sub_10001120C();
                              os_log_type_t v29 = OS_LOG_TYPE_ERROR;
                              if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
                              {
                                os_log_t v13 = v30;
                                os_log_type_t v14 = v29;
                                sub_100003CE0(v28);
                                _os_log_error_impl((void *)&_mh_execute_header, v13, v14, "NTLM Mirror attack detected", v28, 2u);
                              }
                              objc_storeStrong(&v30, 0);
                            }
                            else
                            {
                              if (!sub_100012840(v56) && strcasecmp(v56, __b[1])) {
                                goto LABEL_30;
                              }
                              free(v56);
                              if (v62)
                              {
                                CFRelease(v62);
                                CFStringRef v62 = 0;
                              }
                              CFStringRef v62 = CFStringCreateWithCString(0, __b[1], 0x8000100u);
                              if (v62)
                              {
                                CFStringRef v56 = rk_cfstring2cstring(v62);
                                if (v56)
                                {
LABEL_30:
                                  v80[1] = v57;
                                  LODWORD(v80[0]) = (uint64_t)__b[0] & valuePtr;
                                  v80[2] = v56;
                                  v80[9] = strdup("MOBILE");
                                  int v36 = heim_ntlm_decode_targetinfo();
                                  if (!v36)
                                  {
                                    if ((uint64_t)v37[5]) {
                                      v53 |= 8u;
                                    }
                                    if (v37[8]) {
                                      free(v37[8]);
                                    }
                                    if (v37[6]) {
                                      free(v37[6]);
                                    }
                                    LODWORD(v37[5]) |= 2u;
                                    v37[6] = v55;
                                    if (v38)
                                    {
                                      v37[8] = (void *)v39;
                                      v37[7] = v38;
                                    }
                                    else
                                    {
                                      v37[8] = &unk_100028FF8;
                                      v37[7] = (void *)16;
                                    }
                                    int v36 = heim_ntlm_encode_targetinfo();
                                    if (!v36)
                                    {
                                      memset(&v37[6], 0, 24);
                                      heim_ntlm_free_targetinfo();
                                      if (!v36)
                                      {
                                        v80[4] = malloc_type_malloc(0x18uLL, 0x665EB1A4uLL);
                                        if (v80[4])
                                        {
                                          v80[3] = 24;
                                          __memset_chk();
                                        }
                                        else
                                        {
                                          int v36 = 12;
                                        }
                                        if (!v36)
                                        {
                                          int v36 = heim_ntlm_calculate_ntlm2();
                                          if (!v36)
                                          {
                                            int v11 = (v80[0] & 0x40000000) != 0
                                                ? heim_ntlm_build_ntlm2_master()
                                                : heim_ntlm_v2_base_session();
                                            int v36 = v11;
                                            if (!v11)
                                            {
                                              int v36 = heim_ntlm_encode_type3();
                                              if (!v36)
                                              {
                                                if (v48 >= 0x10)
                                                {
                                                  if (v52 && v52 < v48 - 16)
                                                  {
                                                    bzero(&v27, 0x180uLL);
                                                    macOut = (void *)&v49[v52];
                                                    CCHmacInit(&v27, 1u, v43, v42);
                                                    CCHmacUpdate(&v27, v47, v46);
                                                    CCHmacUpdate(&v27, v45, v44);
                                                    CCHmacUpdate(&v27, v49, v48);
                                                    CCHmacFinal(&v27, macOut);
                                                  }
                                                  CFDataRef v67 = CFDataCreate(kCFAllocatorDefault, v49, v48);
                                                  if (v67)
                                                  {
                                                    CFNumberRef v60 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v53);
                                                    if (v60)
                                                    {
                                                      if (v61)
                                                      {
                                                        CFRelease(v61);
                                                        CFNumberRef v61 = 0;
                                                      }
                                                      CFNumberRef v61 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, v80);
                                                      if (v61)
                                                      {
                                                        CFDataRef v66 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v43, v42);
                                                        if (v66)
                                                        {
                                                          heim_ntlm_unparse_flags();
                                                          os_log_t oslog = (os_log_t)sub_10001120C();
                                                          if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
                                                          {
                                                            sub_100012864((uint64_t)v76, (uint64_t)v56, (uint64_t)v57, (uint64_t)v82);
                                                            _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_INFO, "ntlm v2 request processed for %s\\%s flags: %s", v76, 0x20u);
                                                          }
                                                          objc_storeStrong((id *)&oslog, 0);
                                                          v75[0] = @"kHEIMObjectType";
                                                          v75[1] = @"kHEIMAttrType";
                                                          v75[2] = @"kHEIMAttrNTLMUsername";
                                                          v75[3] = @"kHEIMAttrNTLMDomain";
                                                          v75[4] = @"kHEIMAttrNTLMType3Data";
                                                          v75[5] = @"kHEIMAttrNTLMSessionKey";
                                                          v75[6] = @"kHEIMAttrNTLMClientFlags";
                                                          v75[7] = @"kHEIMAttrNTLMKCMFlags";
                                                          v74[0] = @"kHEIMObjectNTLM";
                                                          v74[1] = @"kHEIMTypeNTLM";
                                                          v74[2] = v63;
                                                          v74[3] = v62;
                                                          v74[4] = v67;
                                                          v74[5] = v66;
                                                          v74[6] = v61;
                                                          v74[7] = v60;
                                                          CFDictionaryRef v70 = CFDictionaryCreate(0, v75, v74, 8, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                                                          if (!v70) {
                                                            heim_abort();
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                                else
                                                {
                                                  int v36 = 22;
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  uint64_t v78 = 0;
  uint64_t v79 = 0;
  if (v80[4]) {
    free((void *)v80[4]);
  }
  if (v80[6]) {
    free((void *)v80[6]);
  }
  if (v80[8]) {
    free((void *)v80[8]);
  }
  if (v80[9]) {
    free((void *)v80[9]);
  }
  heim_ntlm_free_type2();
  heim_ntlm_free_buf();
  heim_ntlm_free_buf();
  if (v67)
  {
    CFRelease(v67);
    CFDataRef v67 = 0;
  }
  if (v60)
  {
    CFRelease(v60);
    CFNumberRef v60 = 0;
  }
  if (v61)
  {
    CFRelease(v61);
    CFNumberRef v61 = 0;
  }
  if (v66)
  {
    CFRelease(v66);
    CFDataRef v66 = 0;
  }
  if (v62)
  {
    CFRelease(v62);
    CFStringRef v62 = 0;
  }
  return v70;
}

void sub_1000126A8()
{
  CFMutableArrayRef Mutable = CFSetCreateMutable(0, 0, &kCFTypeSetCallBacks);
  CFMutableDictionaryRef theDict = sub_10000D8E0(@"kHEIMObjectNTLMReflection");
  CFDictionarySetValue(theDict, @"kHEIMAttrData", @"WRd");
  CFSetAddValue(Mutable, theDict);
  if (theDict) {
    CFRelease(theDict);
  }
  sub_10000D590(@"kHEIMTypeNTLMRelfection", Mutable, 0, 0, 0, (uint64_t)sub_10000E040, 0, 0);
  if (Mutable) {
    CFRelease(Mutable);
  }
}

CFTypeRef sub_1000127BC(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  CFTypeRef cf = CFDictionaryGetValue(a1, a2);
  if (cf && CFGetTypeID(cf) == a3) {
    return cf;
  }
  else {
    return 0;
  }
}

BOOL sub_100012840(char *a1)
{
  return *a1 == 92;
}

uint64_t sub_100012864(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)CFTypeID result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 32;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 32;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

CFUUIDRef sub_1000128CC(void *a1, const char *a2)
{
  uuid = (CFUUIDBytes *)xpc_dictionary_get_uuid(a1, a2);
  if (uuid) {
    return CFUUIDCreateFromUUIDBytes(0, *uuid);
  }
  else {
    return 0;
  }
}

CFTypeRef sub_100012950(void *a1, const char *a2, uint64_t a3)
{
  if (!xpc_dictionary_get_value(a1, a2)) {
    return 0;
  }
  CFTypeRef cf = (CFTypeRef)_CFXPCCreateCFObjectFromXPCObject();
  if (cf && CFGetTypeID(cf) != a3)
  {
    CFRelease(cf);
    return 0;
  }
  return cf;
}

void sub_100012A28(void *a1, const char *a2)
{
  xpc_object_t value = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject();
  if (value)
  {
    xpc_dictionary_set_value(a1, a2, value);
    xpc_release(value);
  }
}

uint64_t sub_100012A94()
{
  return qword_100028F70;
}

void sub_100012AB8()
{
  if (qword_100029008 != -1) {
    dispatch_once(&qword_100029008, &stru_100024F08);
  }
}

uint64_t sub_100012B18(uint64_t a1)
{
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance) {
    return 0;
  }
  *(void *)(Instance + 16) = a1;
  pthread_mutex_init((pthread_mutex_t *)(Instance + 24), 0);
  return Instance;
}

void sub_100012BA4(id a1)
{
  qword_100028F68 = _CFRuntimeRegisterClass();
  qword_100028F70 = _CFRuntimeRegisterClass();
  unk_100028F60 = dispatch_queue_create("HeimCred", 0);
  qword_100028F80 = (uint64_t)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  qword_100028F88 = (uint64_t)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
}

uint64_t sub_100012C74(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    CFRelease(*(CFTypeRef *)(a1 + 16));
    *(void *)(a1 + 16) = 0;
  }
  if (*(void *)(a1 + 24))
  {
    CFRelease(*(CFTypeRef *)(a1 + 24));
    *(void *)(a1 + 24) = 0;
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
  if (*(void *)(a1 + 168))
  {
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 168) + 24));
    *(void *)(*(void *)(a1 + 168) + 16) = 0;
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 168) + 24));
    if (*(void *)(a1 + 168))
    {
      CFRelease(*(CFTypeRef *)(a1 + 168));
      *(void *)(a1 + 168) = 0;
    }
  }
  if (*(void *)(a1 + 160))
  {
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 160) + 24));
    *(void *)(*(void *)(a1 + 160) + 16) = 0;
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 160) + 24));
    if (*(void *)(a1 + 160))
    {
      CFRelease(*(CFTypeRef *)(a1 + 160));
      *(void *)(a1 + 160) = 0;
    }
  }
  if (*(void *)(a1 + 112))
  {
    heim_ipc_event_cancel(*(void *)(a1 + 112));
    heim_ipc_event_free(*(void *)(a1 + 112));
    *(void *)(a1 + 112) = 0;
  }
  if (*(void *)(a1 + 136))
  {
    heim_ipc_event_cancel(*(void *)(a1 + 136));
    heim_ipc_event_free(*(void *)(a1 + 136));
    *(void *)(a1 + 136) = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 40));
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 40));
}

CFStringRef sub_100012EAC()
{
  return @"format";
}

CFStringRef sub_100012EC8(uint64_t a1)
{
  uint64_t v31 = a1;
  uint64_t v30 = a1;
  if (!*(void *)(a1 + 24)) {
    return CFStringCreateWithFormat(0, 0, @"HeimCred<%@>", *(void *)(v30 + 16));
  }
  CFStringRef Value = 0;
  CFStringRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v30 + 24), @"kHEIMAttrClientName");
  os_log_type_t v28 = 0;
  os_log_type_t v28 = CFDictionaryGetValue(*(CFDictionaryRef *)(v30 + 24), @"kHEIMAttrServerName");
  CCHmacContext v27 = 0;
  CCHmacContext v27 = CFDictionaryGetValue(*(CFDictionaryRef *)(v30 + 24), @"kHEIMAttrParentCredential");
  CFBooleanRef v26 = 0;
  CFBooleanRef v26 = (CFBooleanRef)CFDictionaryGetValue(*(CFDictionaryRef *)(v30 + 24), @"kHEIMAttrLeadCredential");
  CFStringRef v25 = 0;
  CFStringRef v25 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(v30 + 24), @"kHEIMAttrAltDSID");
  CFStringRef v24 = 0;
  CFStringRef v24 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(v30 + 24), @"kHEIMAttrUserID");
  CFStringRef v23 = 0;
  CFStringRef v23 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(v30 + 24), @"kHEIMAttrASID");
  int v22 = 0;
  if (v26) {
    int v20 = CFBooleanGetValue(v26);
  }
  else {
    int v20 = 0;
  }
  int v22 = v20;
  CFStringRef v21 = 0;
  CFStringRef v21 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(v30 + 24), @"kHEIMAttrBundleIdentifierACL");
  uint64_t v14 = *(void *)(v30 + 16);
  CFBooleanRef v15 = v26;
  CFDictionaryRef v16 = v27;
  CFDictionaryRef v17 = Value;
  CFDictionaryRef v18 = v28;
  os_log_t v1 = "yes";
  if (!v20) {
    os_log_t v1 = "no";
  }
  CFDictionaryRef v19 = v1;
  if (v21) {
    CFStringRef v13 = v21;
  }
  else {
    CFStringRef v13 = &stru_100026110;
  }
  CFStringRef v11 = v13;
  CFStringRef v12 = v25;
  if (v25) {
    CFStringRef v10 = v12;
  }
  else {
    CFStringRef v10 = &stru_100026110;
  }
  CFStringRef v8 = v10;
  CFStringRef v9 = v24;
  if (v24) {
    CFStringRef v7 = v9;
  }
  else {
    CFStringRef v7 = &stru_100026110;
  }
  CFStringRef v5 = v7;
  CFStringRef v6 = v23;
  if (v23) {
    CFStringRef v4 = v6;
  }
  else {
    CFStringRef v4 = &stru_100026110;
  }
  v3[10] = v3;
  return CFStringCreateWithFormat(0, 0, @"HeimCred<%@ group: %@ parent: %@ client: %@ server: %@ lead: %s ACL: %@, altDSID: %@, Uid: %@, asid: %@>", v14, v15, v16, v17, v18, v19, v11, v8, v5, v4);
}

uint64_t sub_100013214(uint64_t a1)
{
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));
}

uint64_t sub_10001324C()
{
  return qword_100028F68;
}

uint64_t sub_100013270(const void *a1)
{
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance) {
    return 0;
  }
  CFRetain(a1);
  *(void *)(Instance + 16) = a1;
  *(_DWORD *)(Instance + 144) = -1;
  *(void *)(Instance + 136) = 0;
  *(void *)(Instance + 112) = 0;
  pthread_mutex_init((pthread_mutex_t *)(Instance + 40), 0);
  *(unsigned char *)(Instance + 152) = 0;
  return Instance;
}

CFPropertyListRef sub_100013328(const __CFString *a1)
{
  CFPreferencesSynchronize(@"com.apple.Heimdal.GSSCred", kCFPreferencesAnyUser, kCFPreferencesAnyHost);
  CFPropertyListRef v2 = (id)CFPreferencesCopyValue(a1, @"com.apple.Heimdal.GSSCred", kCFPreferencesAnyUser, kCFPreferencesAnyHost);
  if (@"com.apple.Heimdal.GSSCred") {
    CFRelease(@"com.apple.Heimdal.GSSCred");
  }
  return v2;
}

id sub_1000133E0()
{
  id v3 = +[UMUserManager sharedManager];
  id v5 = [v3 currentUser];

  id location = sub_10001120C();
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    id v2 = [v5 alternateDSID];
    sub_100007FF4((uint64_t)v6, (uint64_t)v2);
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)location, OS_LOG_TYPE_DEBUG, "Current altDSID: %{private}@", v6, 0xCu);
  }
  objc_storeStrong(&location, 0);
  id v1 = [v5 alternateDSID];
  objc_storeStrong(&v5, 0);

  return v1;
}

BOOL sub_100013554(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = a1;
  uint64_t v6 = a2;
  BOOL value = 0;
  xpc_object_t object = (xpc_object_t)xpc_connection_copy_entitlement_value();
  if (object && xpc_get_type(object) == (xpc_type_t)&_xpc_type_BOOL) {
    BOOL value = xpc_BOOL_get_value(object);
  }
  BOOL v3 = value;
  objc_storeStrong(&object, 0);
  return v3;
}

uint64_t sub_100013604(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_storeStrong(location, 0);
  return 0;
}

uint64_t sub_100013660()
{
  return 1;
}

void sub_100013678()
{
}

uint64_t sub_1000136B8()
{
  predicate = (dispatch_once_t *)&unk_100029018;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_100025090);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  return byte_100029020 & 1;
}

uint64_t sub_100013738()
{
  predicate = (dispatch_once_t *)&unk_100029028;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_1000250B0);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  return byte_100029021 & 1;
}

uint64_t sub_1000137B8()
{
  uint64_t v4 = 7200;
  id location = (id)off_100028F20(@"renew-interval");
  if (location)
  {
    if ((uint64_t)[location longValue] >= 60) {
      uint64_t v2 = (uint64_t)[location longValue];
    }
    else {
      uint64_t v2 = 60;
    }
    uint64_t v4 = v2;
  }
  uint64_t v1 = v4;
  objc_storeStrong(&location, 0);
  return v1;
}

uint64_t sub_100013878()
{
  predicate = (dispatch_once_t *)&unk_100029038;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_1000250D0);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  return byte_100029030 & 1;
}

void sub_1000138F8(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  dispatch_async((dispatch_queue_t)qword_100029010, location);
  objc_storeStrong(&location, 0);
}

void sub_10001394C()
{
  id location = 0;
  CFStringRef v10 = au_sdev_open(0x10000);
  if (v10)
  {
    id v0 = dispatch_get_global_queue(-2, 0);
    id v1 = location;
    id location = v0;

    uint64_t v2 = _NSConcreteStackBlock;
    int v3 = -1073741824;
    int v4 = 0;
    id v5 = sub_1000148AC;
    uint64_t v6 = &unk_100025110;
    uint64_t v7 = v10;
    dispatch_async((dispatch_queue_t)location, &v2);
    int v8 = 0;
  }
  else
  {
    int v8 = 1;
  }
  objc_storeStrong(&location, 0);
}

void sub_100013A30(id a1, OS_xpc_object *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  sub_100013A88(location[0]);
  objc_storeStrong(location, 0);
}

void sub_100013A88(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  int v20 = 0;
  xpc_type_t v19 = xpc_get_type(location);
  if (v19 == (xpc_type_t)&_xpc_type_connection)
  {
    int v20 = (id *)malloc_type_calloc(1uLL, 0x58uLL, 0x10E0040DE1BA62FuLL);
    if (!v20) {
      heim_abort();
    }
    objc_storeStrong(v20, location);
    xpc_connection_get_audit_token();
    v20[1] = (id)sub_1000149E8(location);
    if (v20[1])
    {
      _OWORD v20[2] = (id)CFRetain(v20[1]);
      if (byte_100028F10)
      {
        v20[7] = (id)sub_100004A54(-1);
      }
      else
      {
        int v3 = off_100028EE0(location);
        v20[7] = (id)sub_100004A54(v3);
      }
      if (!v20[7]) {
        heim_abort();
      }
      os_log_t v14 = (os_log_t)sub_10001120C();
      os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        sub_100014D2C((uint64_t)v22, (uint64_t)v20[2], *((_DWORD *)v20[7] + 4));
        _os_log_debug_impl((void *)&_mh_execute_header, v14, v13, "new connection from %@, asid: %d", v22, 0x12u);
      }
      objc_storeStrong((id *)&v14, 0);
      *((unsigned char *)v20 + 64) = 1;
      *((unsigned char *)v20 + 65) = 0;
      *((_DWORD *)v20 + 20) = 0;
      xpc_connection_set_context((xpc_connection_t)location, v20);
      xpc_connection_set_finalizer_f((xpc_connection_t)location, (xpc_finalizer_t)sub_100014D80);
      handler = _NSConcreteStackBlock;
      int v8 = -1073741824;
      int v9 = 0;
      CFStringRef v10 = sub_100014DB4;
      CFStringRef v11 = &unk_100025130;
      CFStringRef v12 = v20;
      xpc_connection_set_event_handler((xpc_connection_t)location, &handler);
      xpc_connection_set_target_queue((xpc_connection_t)location, (dispatch_queue_t)qword_100029010);
      xpc_connection_resume((xpc_connection_t)location);
      int v18 = 0;
    }
    else
    {
      pid_t v1 = getpid();
      if (proc_pidpath(v1, buffer, 0x400u) <= 0) {
        buffer[0] = 0;
      }
      os_log_t oslog = (os_log_t)sub_10001120C();
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        os_log_type_t v5 = type;
        audit_token_t atoken = *(audit_token_t *)(v20 + 3);
        pid_t v2 = audit_token_to_pid(&atoken);
        sub_100014CD8((uint64_t)v23, v2, (uint64_t)buffer);
        _os_log_error_impl((void *)&_mh_execute_header, log, v5, "client[pid-%d] \"%s\" is not signed", v23, 0x12u);
      }
      objc_storeStrong((id *)&oslog, 0);
      free(v20);
      xpc_connection_cancel((xpc_connection_t)location);
      int v18 = 1;
    }
  }
  else
  {
    int v18 = 1;
  }
  if (!v18) {
    int v18 = 0;
  }
  objc_storeStrong(&location, 0);
}

void sub_100013EC8(unsigned char *a1)
{
  id location[2] = a1;
  location[1] = a1;
  char v1 = a1[32];
  char v21 = 0;
  char v19 = 0;
  if (v1)
  {
    id v22 = sub_10001AEC8();
    char v21 = 1;
    id v2 = v22;
  }
  else
  {
    id v20 = sub_10001120C();
    char v19 = 1;
    id v2 = v20;
  }
  location[0] = v2;
  if (v19) {

  }
  if (v21) {
  os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
  }
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = location[0];
    os_log_type_t type = v18;
    sub_100003CE0(v17);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Got SIGTERM, shutting down", v17, 2u);
  }
  objc_storeStrong(location, 0);
  if (byte_100028FAD)
  {
    char v3 = a1[32];
    char v14 = 0;
    char v12 = 0;
    if (v3)
    {
      id v15 = sub_10001AEC8();
      char v14 = 1;
      id v4 = v15;
    }
    else
    {
      id v13 = sub_10001120C();
      char v12 = 1;
      id v4 = v13;
    }
    id v16 = v4;
    if (v12) {

    }
    if (v14) {
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    }
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v5 = v16;
      os_log_type_t v6 = v11;
      sub_100003CE0(v10);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Saving cached credentials", v10, 2u);
    }
    objc_storeStrong(&v16, 0);
    sub_100003398();
  }
  exit(0);
}

void sub_10001416C(id a1)
{
  v9[2] = a1;
  v9[1] = a1;
  if (byte_100028FAC)
  {
    byte_100028FAC = 0;
    if ((byte_100028FAD & 1) == 0)
    {
      byte_100028FAD = 1;
      v9[0] = (id)os_transaction_create();
      dispatch_time_t when = dispatch_time(0, 5000000000);
      queue = qword_100029010;
      char v3 = _NSConcreteStackBlock;
      int v4 = -1073741824;
      int v5 = 0;
      os_log_type_t v6 = sub_1000142AC;
      uint64_t v7 = &unk_100025070;
      id v8 = v9[0];
      dispatch_after(when, queue, &v3);
      objc_storeStrong(&v8, 0);
      objc_storeStrong(v9, 0);
    }
  }
}

void sub_1000142AC()
{
  byte_100028FAD = 0;
  sub_100003398();
}

void sub_1000142E4(id a1)
{
  id v4 = a1;
  id v3 = a1;
  CFDictionaryRef theDict = (CFDictionaryRef)MKBUserTypeDeviceMode();
  CFTypeRef cf1 = 0;
  if (theDict
    && CFDictionaryGetValueIfPresent(theDict, kMKBDeviceModeKey, &cf1)
    && CFEqual(cf1, kMKBDeviceModeMultiUser))
  {
    byte_100029020 = 1;
  }
  if (theDict) {
    CFRelease(theDict);
  }
}

void sub_1000143C4(id a1)
{
  id v3 = a1;
  id v2 = a1;
  *(void *)&v1[4] = (id)off_100028F20(@"use-uid-matching");
  if (*(void *)&v1[4]) {
    *(_DWORD *)char v1 = [*(id *)&v1[4] BOOLValue] & 1;
  }
  else {
    *(void *)char v1 = sub_100014470();
  }
  byte_100029021 = *(_DWORD *)v1 != 0;
  objc_storeStrong((id *)&v1[4], 0);
}

BOOL sub_100014470()
{
  BOOL v20 = 0;
  krb5_context v19 = 0;
  location[1] = "/etc/kcm.conf";
  int inited = krb5_init_context(&v19);
  if (inited)
  {
    location[0] = sub_10001120C();
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_ERROR))
    {
      sub_100010EA0((uint64_t)v22, inited);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)location[0], v16, "krb5_init_context failed: %d", v22, 8u);
    }
    objc_storeStrong(location, 0);
    return 0;
  }
  else
  {
    v15[1] = 0;
    int inited = krb5_prepend_config_files_default();
    if (inited)
    {
      v15[0] = sub_10001120C();
      char v14 = 16;
      if (os_log_type_enabled((os_log_t)v15[0], OS_LOG_TYPE_ERROR))
      {
        int v5 = v15[0];
        os_log_type_t v6 = v14;
        sub_100003CE0(v13);
        _os_log_error_impl((void *)&_mh_execute_header, v5, v6, "error getting kcm configuration files", v13, 2u);
      }
      objc_storeStrong(v15, 0);
      krb5_free_context(v19);
      return 0;
    }
    else
    {
      int inited = krb5_set_config_files();
      krb5_free_config_files();
      if (inited)
      {
        id v12 = sub_10001120C();
        char v11 = 16;
        if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
        {
          id v3 = v12;
          os_log_type_t v4 = v11;
          sub_100003CE0(v10);
          _os_log_error_impl((void *)&_mh_execute_header, v3, v4, "error reading kcm configuration files", v10, 2u);
        }
        objc_storeStrong(&v12, 0);
        krb5_free_context(v19);
        return 0;
      }
      else
      {
        BOOL v20 = krb5_config_get_BOOL_default() != 0;
        if (v20)
        {
          os_log_t oslog = (os_log_t)sub_10001120C();
          os_log_type_t v8 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            char v1 = oslog;
            os_log_type_t v2 = v8;
            sub_100003CE0(v7);
            _os_log_error_impl((void *)&_mh_execute_header, v1, v2, "*** Using 'use-uid-matching' in the kcm section of a krb5.conf file is deprecated.  It will be removed in a future macOS version.  Use the GSSCred default instead. ", v7, 2u);
          }
          objc_storeStrong((id *)&oslog, 0);
        }
        krb5_free_context(v19);
        return v20;
      }
    }
  }
}

void sub_100014830(id a1)
{
  v1[2] = a1;
  v1[1] = a1;
  v1[0] = (id)off_100028F20(@"disable-ntlm-reflection-detection");
  byte_100029030 = [v1[0] BOOLValue] & 1;
  objc_storeStrong(v1, 0);
}

void sub_1000148AC(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  while (1)
  {
    do
    {
      memset(&__b, 0, sizeof(__b));
      int event = 0;
    }
    while (au_sdev_read_aia(*(au_sdev_handle_t **)(a1 + 32), &event, &__b));
    if (event == 44903)
    {
      os_log_type_t v2 = _NSConcreteStackBlock;
      int v3 = -1073741824;
      int v4 = 0;
      int v5 = sub_1000149A8;
      os_log_type_t v6 = &unk_1000250F0;
      memcpy(v7, &__b, sizeof(v7));
      dispatch_async((dispatch_queue_t)qword_100029010, &v2);
    }
  }
}

void sub_1000149A8(uint64_t a1)
{
}

CFStringRef sub_1000149E8(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  uint64_t v8 = 0;
  xpc_connection_get_pid((xpc_connection_t)location);
  xpc_connection_get_audit_token();
  if (csops_audittoken() == -1 && *__error() == 34)
  {
    unsigned int v3 = sub_100015A08(HIDWORD(v8));
    if (v3 <= 0x100000)
    {
      if (v3)
      {
        os_log_type_t v2 = (UInt8 *)malloc_type_malloc(v3, 0x5064EC57uLL);
        if (v2)
        {
          if (csops_audittoken() || v3 <= 8 || (unsigned int v4 = v3 - 8, v2[v4 + 7]))
          {
            free(v2);
            CFStringRef v7 = 0;
          }
          else
          {
            CFStringRef v5 = CFStringCreateWithBytes(0, v2 + 8, v4 - 1, 0x8000100u, 0);
            free(v2);
            CFStringRef v7 = v5;
          }
        }
        else
        {
          CFStringRef v7 = 0;
        }
      }
      else
      {
        CFStringRef v7 = 0;
      }
    }
    else
    {
      CFStringRef v7 = 0;
    }
  }
  else
  {
    CFStringRef v7 = 0;
  }
  objc_storeStrong(&location, 0);
  return v7;
}

uint64_t sub_100014CD8(uint64_t result, int a2, uint64_t a3)
{
  *(unsigned char *)CFTypeID result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(unsigned char *)(result + 8) = 32;
  *(unsigned char *)(result + 9) = 8;
  *(void *)(result + 10) = a3;
  return result;
}

uint64_t sub_100014D2C(uint64_t result, uint64_t a2, int a3)
{
  *(unsigned char *)CFTypeID result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

void sub_100014D80(CFTypeRef *a1)
{
}

void sub_100014DB4(void **a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  sub_100014E14(a1[4], location[0]);
  objc_storeStrong(location, 0);
}

void sub_100014E14(void *a1, void *a2)
{
  CFDataRef v59 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100029010);
  id v57 = 0;
  xpc_type_t v56 = xpc_get_type(location);
  if (v56 == (xpc_type_t)&_xpc_type_error)
  {
    objc_storeStrong((id *)v59, 0);
    int v55 = 1;
    goto LABEL_60;
  }
  if (v56 != (xpc_type_t)&_xpc_type_dictionary) {
    __assert_rtn("GSSCred_peer_event_handler", "server.m", 282, "type == XPC_TYPE_DICTIONARY");
  }
  string = xpc_dictionary_get_string(location, "impersonate");
  if (string)
  {
    size_t v2 = strlen(string);
    CFStringRef v53 = CFStringCreateWithBytes(0, (const UInt8 *)string, v2, 0x8000100u, 0);
    if (v53 && !CFEqual((CFTypeRef)v59[1], v53))
    {
      if ((off_100028ED0(v59, "com.apple.private.accounts.bundleidspoofing") & 1) == 0)
      {
        xpc_connection_cancel((xpc_connection_t)*v59);
        CFRelease(v53);
        CFStringRef v53 = 0;
        int v55 = 1;
        goto LABEL_60;
      }
      if (v59[1])
      {
        CFRelease((CFTypeRef)v59[1]);
        v59[1] = 0;
      }
      v59[1] = CFRetain(v53);
      *((unsigned char *)v59 + 64) = 1;
      *((unsigned char *)v59 + 65) = 0;
      id v52 = sub_10001120C();
      char v51 = 2;
      if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_DEBUG))
      {
        log = v52;
        os_log_type_t type = v51;
        CStringPtr = CFStringGetCStringPtr((CFStringRef)v59[1], 0x8000100u);
        audit_token_t atoken = *(audit_token_t *)(v59 + 3);
        pid_t v3 = audit_token_to_pid(&atoken);
        sub_100015A28((uint64_t)v61, (uint64_t)CStringPtr, v3);
        _os_log_debug_impl((void *)&_mh_execute_header, log, type, "impersonating app: %s, %d", v61, 0x12u);
      }
      objc_storeStrong(&v52, 0);
    }
    if (v53)
    {
      CFRelease(v53);
      CFStringRef v53 = 0;
    }
  }
  id v49 = +[NSString stringWithFormat:@"%@ (%@)", v59[2], v59[1]];
  id v39 = sub_10001120C();
  sub_100015A7C(v39, location, *(_DWORD *)(v59[7] + 16), v49, @"Request received");

  __s1 = (char *)xpc_dictionary_get_string(location, "command");
  if (__s1)
  {
    uint64_t v4 = strcmp(__s1, "wakeup");
    if (v4)
    {
      if (!strcmp(__s1, "create"))
      {
        xpc_object_t reply = xpc_dictionary_create_reply(location);
        id v7 = v57;
        id v57 = reply;

        sub_100005508(v59, location, v57);
      }
      else if (!strcmp(__s1, "delete"))
      {
        xpc_object_t v8 = xpc_dictionary_create_reply(location);
        id v9 = v57;
        id v57 = v8;

        sub_100008034(v59, location, v57);
      }
      else if (!strcmp(__s1, "delete-all"))
      {
        xpc_object_t v10 = xpc_dictionary_create_reply(location);
        id v11 = v57;
        id v57 = v10;

        sub_10000C274(v59, location, v57);
      }
      else if (!strcmp(__s1, "setattributes"))
      {
        xpc_object_t v12 = xpc_dictionary_create_reply(location);
        id v13 = v57;
        id v57 = v12;

        sub_1000087E8(v59, location, v57);
      }
      else if (!strcmp(__s1, "fetch"))
      {
        xpc_object_t v14 = xpc_dictionary_create_reply(location);
        id v15 = v57;
        id v57 = v14;

        sub_10000A3DC(v59, location, v57);
      }
      else if (!strcmp(__s1, "move"))
      {
        xpc_object_t v16 = xpc_dictionary_create_reply(location);
        id v17 = v57;
        id v57 = v16;

        sub_10000B024(v59, location, v57);
      }
      else if (!strcmp(__s1, "query"))
      {
        xpc_object_t v18 = xpc_dictionary_create_reply(location);
        id v19 = v57;
        id v57 = v18;

        sub_10000A7F8(v59, location, v57);
      }
      else if (!strcmp(__s1, "default"))
      {
        xpc_object_t v20 = xpc_dictionary_create_reply(location);
        id v21 = v57;
        id v57 = v20;

        sub_10000AE10((uint64_t)v59, location, v57);
      }
      else if (!strcmp(__s1, "retain-transient"))
      {
        xpc_object_t v22 = xpc_dictionary_create_reply(location);
        id v23 = v57;
        id v57 = v22;

        sub_10000C640(v59, location, v57);
      }
      else if (!strcmp(__s1, "release-transient"))
      {
        xpc_object_t v24 = xpc_dictionary_create_reply(location);
        id v25 = v57;
        id v57 = v24;

        sub_10000CCE0(v59, location, v57);
      }
      else if (!strcmp(__s1, "status"))
      {
        xpc_object_t v26 = xpc_dictionary_create_reply(location);
        id v27 = v57;
        id v57 = v26;

        sub_10000BFB0(v59, location, v57);
      }
      else if (!strcmp(__s1, "doauth"))
      {
        xpc_object_t v28 = xpc_dictionary_create_reply(location);
        id v29 = v57;
        id v57 = v28;

        sub_1000093DC(v59, location, v57);
      }
      else if (!strcmp(__s1, "doscram"))
      {
        xpc_object_t v30 = xpc_dictionary_create_reply(location);
        id v31 = v57;
        id v57 = v30;

        sub_1000096C0(v59, location, v57);
      }
      else if (!strcmp(__s1, "add-challenge"))
      {
        xpc_object_t v32 = xpc_dictionary_create_reply(location);
        id v33 = v57;
        id v57 = v32;

        sub_10000998C((uint64_t)v59, location, v57);
      }
      else if (!strcmp(__s1, "check-challenge"))
      {
        xpc_object_t v34 = xpc_dictionary_create_reply(location);
        id v35 = v57;
        id v57 = v34;

        sub_10000A18C(v59, location, v57);
      }
      else
      {
        os_log_t v44 = (os_log_t)sub_10001120C();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          sub_100015DB8((uint64_t)v60, (uint64_t)__s1);
          _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "peer sent invalid command %s", v60, 0xCu);
        }
        objc_storeStrong((id *)&v44, 0);
        xpc_connection_cancel((xpc_connection_t)*v59);
      }
    }
  }
  else
  {
    os_log_t oslog = (os_log_t)sub_10001120C();
    os_log_type_t v46 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      char v37 = oslog;
      os_log_type_t v38 = v46;
      sub_100003CE0(v45);
      _os_log_error_impl((void *)&_mh_execute_header, v37, v38, "peer sent invalid no command", v45, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    xpc_connection_cancel((xpc_connection_t)*v59);
  }
  if (v57)
  {
    id v36 = sub_10001120C();
    sub_100015A7C(v36, v57, *(_DWORD *)(v59[7] + 16), v49, @"Reply to be sent");

    xpc_connection_send_message((xpc_connection_t)*v59, v57);
  }
  off_100028F18(v4, v5);
  objc_storeStrong(&v49, 0);
  int v55 = 0;
LABEL_60:
  objc_storeStrong(&v57, 0);
  if (!v55) {
    int v55 = 0;
  }
  objc_storeStrong(&location, 0);
}

uint64_t sub_100015A08(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t sub_100015A28(uint64_t result, uint64_t a2, int a3)
{
  *(unsigned char *)CFTypeID result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

void sub_100015A7C(void *a1, void *a2, int a3, void *a4, void *a5)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v23 = 0;
  objc_storeStrong(&v23, a2);
  int v22 = a3;
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  id v20 = 0;
  objc_storeStrong(&v20, a5);
  id v27 = (id)_CFXPCCreateCFObjectFromXPCObject();
  id v19 = v27;
  id v18 = [v19 mutableCopy];
  id v17 = [v18 objectForKeyedSubscript:@"attributes"];
  if (v17)
  {
    [v18 setObject:0 forKeyedSubscript:@"attributes"];
    uint64_t v16 = 0;
    CFDictionaryRef v8 = (const __CFDictionary *)v17;
    CFTypeID TypeID = CFStringGetTypeID();
    CFTypeRef key = (void *)sub_10000D4D0(v8, @"kHEIMAttrType", TypeID, (uint64_t)&v16);
    if (key)
    {
      CFStringRef Value = (uint64_t (**)(id))CFDictionaryGetValue((CFDictionaryRef)qword_100028F90, key);
      if (Value)
      {
        id v26 = (id)Value[6](v17);
        id v7 = v26;
        objc_msgSend(v18, "setObject:forKeyedSubscript:");
      }
    }
    else
    {
      id v25 = sub_10000E040(v17);
      id v6 = v25;
      objc_msgSend(v18, "setObject:forKeyedSubscript:");
    }
  }
  os_log_t oslog = (os_log_t)location;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_100015DF8((uint64_t)v28, (uint64_t)v20, v22, (uint64_t)v21, (uint64_t)v18);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "%@: %u, %@, %@", v28, 0x26u);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&location, 0);
}

uint64_t sub_100015DB8(uint64_t result, uint64_t a2)
{
  *(unsigned char *)CFTypeID result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t sub_100015DF8(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)CFTypeID result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 64;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  *(unsigned char *)(result + 28) = 64;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  return result;
}

void sub_10001606C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id obj, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19, _Unwind_Exception *exception_object)
{
}

id sub_100016090(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateManagedApps:0];
}

void sub_100016460()
{
  _Unwind_Resume(v0);
}

id sub_100016470()
{
  uint64_t v9 = 0;
  xpc_object_t v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = qword_100029048;
  uint64_t v13 = qword_100029048;
  if (!qword_100029048)
  {
    size_t v2 = _NSConcreteStackBlock;
    int v3 = -1073741824;
    int v4 = 0;
    uint64_t v5 = sub_100016768;
    id v6 = &unk_100025158;
    id v7 = &v9;
    sub_100016768((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);

  return v1;
}

id sub_100016668()
{
  size_t v2 = (void **)sub_100016A10();
  if (!v2)
  {
    dlerror();
    abort_report_np();
  }
  id v0 = *v2;

  return v0;
}

uint64_t sub_100016768(uint64_t a1)
{
  sub_10001681C();
  Class Class = objc_getClass("MCProfileConnection");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  qword_100029048 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10001681C()
{
  uint64_t v1 = sub_1000168B8();
  if (!v1) {
    abort_report_np();
  }
  return v1;
}

uint64_t sub_1000168B8()
{
  if (!qword_100029050) {
    sub_100016978();
  }
  return qword_100029050;
}

uint64_t sub_100016978()
{
  uint64_t result = _sl_dlopen();
  qword_100029050 = result;
  return result;
}

uint64_t sub_100016A10()
{
  uint64_t v9 = 0;
  xpc_object_t v10 = &v9;
  int v11 = 0x20000000;
  int v12 = 32;
  uint64_t v8 = qword_100029058;
  uint64_t v13 = qword_100029058;
  if (!qword_100029058)
  {
    size_t v2 = _NSConcreteStackBlock;
    int v3 = -1073741824;
    int v4 = 0;
    uint64_t v5 = sub_100016B24;
    id v6 = &unk_100025158;
    id v7 = &v9;
    sub_100016B24((uint64_t)&v2);
  }
  uint64_t v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t sub_100016B24(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10001681C();
  size_t v2 = dlsym(v1, "MCManagedAppsChangedNotification");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  qword_100029058 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100016B90(uint64_t a1, char *a2)
{
  uint64_t v12 = a1;
  int v11 = a2;
  CFTypeID v2 = CFGetTypeID(a2);
  if (v2 != sub_100012A94()) {
    heim_abort();
  }
  sub_100018100();
  CFTypeRef v10 = 0;
  uint64_t v9 = v11;
  pthread_mutex_lock((pthread_mutex_t *)(v11 + 24));
  if (*((void *)v11 + 2)) {
    CFTypeRef v10 = CFRetain(*((CFTypeRef *)v9 + 2));
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v9 + 24));
  if (v10)
  {
    dispatch_block_t block = _NSConcreteStackBlock;
    int v4 = -1073741824;
    int v5 = 0;
    id v6 = sub_100016CF8;
    id v7 = &unk_100025110;
    CFTypeRef v8 = v10;
    dispatch_sync((dispatch_queue_t)qword_100029060, &block);
    if (v10) {
      CFRelease(v10);
    }
  }
}

void sub_100016CF8(uint64_t a1)
{
  uint64_t v20 = a1;
  uint64_t v19 = a1;
  unsigned int v18 = 0;
  id v17 = 0;
  uint64_t v16 = 0;
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40));
  heim_ipc_event_cancel(*(void *)(*(void *)(a1 + 32) + 112));
  *(void *)(*(void *)(a1 + 32) + 120) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40));
  uint64_t v1 = (id)CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 24), @"kHEIMAttrClientName");
  id v2 = v17;
  id v17 = v1;

  id location = sub_10001120C();
  os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    sub_100006434((uint64_t)v25, (uint64_t)v17);
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)location, v14, "renew_func: %@", v25, 0xCu);
  }
  objc_storeStrong(&location, 0);
  unsigned int v18 = [(id)qword_100028F50 refreshForCred:*(void *)(a1 + 32) expireTime:&v16];
  if (v18 == -1765328360 || v18 == -1765328353)
  {
LABEL_10:
    id v13 = sub_10001120C();
    os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEBUG))
    {
      sub_100006434((uint64_t)v24, (uint64_t)v17);
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v13, v12, "cache: %@ got auth failed, stop renewing", v24, 0xCu);
    }
    objc_storeStrong(&v13, 0);
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40));
    *(_DWORD *)(*(void *)(a1 + 32) + 144) = 1;
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40));
    goto LABEL_22;
  }
  if (v18 != -1765328352)
  {
    if (v18 != -1765328343)
    {
      if (v18 == -1765328243)
      {
        os_log_t v9 = (os_log_t)sub_10001120C();
        os_log_type_t v8 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          sub_100006434((uint64_t)v22, (uint64_t)v17);
          _os_log_debug_impl((void *)&_mh_execute_header, v9, v8, "cache not found, stop renewing: %@", v22, 0xCu);
        }
        objc_storeStrong((id *)&v9, 0);
        pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40));
        *(_DWORD *)(*(void *)(a1 + 32) + 144) = 1;
        pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40));
      }
      else if (v18)
      {
        sub_10001723C(*(void *)(a1 + 32), 1);
        pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40));
        *(_DWORD *)(*(void *)(a1 + 32) + 144) = 2;
        pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40));
      }
      else
      {
        os_log_t v7 = (os_log_t)sub_10001120C();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          id v5 = v17;
          int v4 = v16;
          int v3 = time(0);
          sub_100014D2C((uint64_t)v21, (uint64_t)v5, v4 - v3);
          _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "cache: %@ got new tickets (expire in %d seconds)", v21, 0x12u);
        }
        objc_storeStrong((id *)&v7, 0);
      }
      goto LABEL_22;
    }
    goto LABEL_10;
  }
  os_log_t oslog = (os_log_t)sub_10001120C();
  os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_100006434((uint64_t)v23, (uint64_t)v17);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, v10, "The ticket has expired, stop renewing: %@", v23, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40));
  *(_DWORD *)(*(void *)(a1 + 32) + 144) = 1;
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40));
LABEL_22:
  objc_storeStrong(&v17, 0);
}

uint64_t sub_10001723C(uint64_t a1, char a2)
{
  uint64_t v14 = a1;
  char v13 = a2 & 1;
  uint64_t v12 = time(0) + qword_100028F48;
  if (v13) {
    uint64_t v12 = time(0) + 300;
  }
  pthread_mutex_lock((pthread_mutex_t *)(v14 + 40));
  time_t v11 = 0;
  time_t v11 = *(void *)(v14 + 128);
  if (time(0) + 60 <= v11)
  {
    if (v12 > v11 - 60) {
      uint64_t v12 = v11 - 60;
    }
    os_log_t oslog = (os_log_t)sub_10001120C();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v3 = time(0);
      sub_100014D2C((uint64_t)v16, v14, v12 - v3);
      _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "%@: will try to renew credentals in %d seconds", v16, 0x12u);
    }
    objc_storeStrong((id *)&oslog, 0);
    heim_ipc_event_set_time(*(void *)(v14 + 112), v12);
    *(void *)(v14 + 104) = v12;
    return pthread_mutex_unlock((pthread_mutex_t *)(v14 + 40));
  }
  else
  {
    id v10 = sub_10001120C();
    char v9 = 2;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG))
    {
      log = v10;
      os_log_type_t type = v9;
      id v15 = (__CFString *)CFUUIDCreateString(0, *(CFUUIDRef *)(v14 + 16));
      id v6 = v15;
      os_log_type_t v8 = v6;
      sub_100006434((uint64_t)v17, (uint64_t)v8);
      _os_log_debug_impl((void *)&_mh_execute_header, log, type, "%@: will expire before next attempt", v17, 0xCu);

      objc_storeStrong((id *)&v8, 0);
    }
    objc_storeStrong(&v10, 0);
    return pthread_mutex_unlock((pthread_mutex_t *)(v14 + 40));
  }
}

void sub_1000174FC(uint64_t a1, char *a2)
{
  uint64_t v12 = a1;
  time_t v11 = a2;
  CFTypeID v2 = CFGetTypeID(a2);
  if (v2 != sub_100012A94()) {
    heim_abort();
  }
  sub_100018100();
  CFTypeRef v10 = 0;
  char v9 = v11;
  pthread_mutex_lock((pthread_mutex_t *)(v11 + 24));
  if (*((void *)v11 + 2)) {
    CFTypeRef v10 = CFRetain(*((CFTypeRef *)v9 + 2));
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v9 + 24));
  if (v10)
  {
    dispatch_block_t block = _NSConcreteStackBlock;
    int v4 = -1073741824;
    int v5 = 0;
    id v6 = sub_100017664;
    os_log_t v7 = &unk_100025110;
    CFTypeRef v8 = v10;
    dispatch_sync((dispatch_queue_t)qword_100029060, &block);
    if (v10) {
      CFRelease(v10);
    }
  }
}

void sub_100017664(uint64_t a1)
{
  uint64_t v22 = a1;
  uint64_t v21 = a1;
  unsigned int v20 = 0;
  id v19 = 0;
  uint64_t v18 = 0;
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40));
  heim_ipc_event_cancel(*(void *)(*(void *)(a1 + 32) + 112));
  *(void *)(*(void *)(a1 + 32) + 120) = 0;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 152))
  {
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40));
    CFTypeID v2 = (id)CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 24), @"kHEIMAttrClientName");
    id v3 = v19;
    id v19 = v2;

    id location = sub_10001120C();
    os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      sub_100006434((uint64_t)v26, (uint64_t)v19);
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)location, v15, "expire_func: %@", v26, 0xCu);
    }
    objc_storeStrong(&location, 0);
    unsigned int v20 = [(id)qword_100028F50 acquireForCred:*(void *)(a1 + 32) expireTime:&v18];
    if (v20 == -1765328360 || v20 == -1765328353 || v20 == -1765328343)
    {
      os_log_t oslog = (os_log_t)sub_10001120C();
      os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        sub_100006434((uint64_t)v25, (uint64_t)v19);
        _os_log_debug_impl((void *)&_mh_execute_header, oslog, v13, "cache: %@ got bad password, stop renewing", v25, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      sub_100017B78(*(void *)(a1 + 32), 1u);
    }
    else if (v20 == -1765328243)
    {
      os_log_t v12 = (os_log_t)sub_10001120C();
      os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        sub_100006434((uint64_t)v24, (uint64_t)v19);
        _os_log_debug_impl((void *)&_mh_execute_header, v12, v11, "cache not found, stop renewing: %@", v24, 0xCu);
      }
      objc_storeStrong((id *)&v12, 0);
      sub_100017B78(*(void *)(a1 + 32), 1u);
    }
    else if (v20)
    {
      pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40));
      uint64_t v6 = *(void *)(a1 + 32);
      time_t v5 = time(0);
      sub_100017E04(v6, v5 + 300);
      pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40));
      sub_100017B78(*(void *)(a1 + 32), 2u);
    }
    else
    {
      os_log_t v10 = (os_log_t)sub_10001120C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        id v8 = v19;
        int v7 = v18;
        int v4 = time(0);
        sub_100014D2C((uint64_t)v23, (uint64_t)v8, v7 - v4);
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "cache: %@ got new tickets (expire in %d seconds)", v23, 0x12u);
      }
      objc_storeStrong((id *)&v10, 0);
      pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40));
      *(void *)(*(void *)(a1 + 32) + 128) = v18;
      pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40));
      sub_100017B78(*(void *)(a1 + 32), 3u);
    }
    off_100028F58(&stru_100025190);
    int v17 = 0;
  }
  else
  {
    uint64_t v1 = pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40));
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 40)) {
      (*(void (**)(uint64_t))(*(void *)(*(void *)(a1 + 32) + 32) + 40))(v1);
    }
    int v17 = 1;
  }
  objc_storeStrong(&v19, 0);
}

uint64_t sub_100017B78(uint64_t a1, unsigned int a2)
{
  uint64_t v18 = a1;
  unsigned int v17 = a2;
  id v16 = sub_10001120C();
  char v15 = 2;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG))
  {
    log = v16;
    os_log_type_t type = v15;
    id v19 = (__CFString *)CFUUIDCreateString(0, *(CFUUIDRef *)(v18 + 16));
    os_log_type_t v11 = v19;
    uint64_t v14 = v11;
    sub_100006434((uint64_t)v20, (uint64_t)v14);
    _os_log_debug_impl((void *)&_mh_execute_header, log, type, "cred_update_acquire_status: %@", v20, 0xCu);

    objc_storeStrong((id *)&v14, 0);
  }
  objc_storeStrong(&v16, 0);
  pthread_mutex_lock((pthread_mutex_t *)(v18 + 40));
  *(_DWORD *)(v18 + 144) = v17;
  if (v17)
  {
    uint64_t v3 = v17;
    char v2 = 1;
  }
  else
  {
    uint64_t v3 = 0;
    char v2 = 0;
  }
  if ((v2 & 1) == 0)
  {
    switch(v3)
    {
      case 0:
        uint64_t v8 = v18;
        time_t v4 = time(0);
        sub_100017E04(v8, v4 + 2);
        break;
      case 1:
        *(void *)(v18 + 120) = 0;
        heim_ipc_event_cancel(*(void *)(v18 + 136));
        break;
      case 2:
        uint64_t v7 = v18;
        time_t v5 = time(0);
        sub_100017E04(v7, v5 + 300);
        break;
      case 3:
        time_t v12 = time(0);
        if (*(void *)(v18 + 128) <= v12)
        {
          *(void *)(v18 + 120) = 0;
        }
        else
        {
          time_t v13 = *(void *)(v18 + 128);
          if (v13 - v12 > 300) {
            v13 -= 300;
          }
          sub_100017E04(v18, v13);
        }
        break;
      default:
        JUMPOUT(0);
    }
  }
  return pthread_mutex_unlock((pthread_mutex_t *)(v18 + 40));
}

void sub_100017E04(uint64_t a1, time_t a2)
{
  uint64_t v18 = a1;
  time_t v17 = a2;
  if (!a2)
  {
    time_t v17 = time(0);
LABEL_7:
    *(void *)(v18 + 120) = v17;
    heim_ipc_event_set_time(*(void *)(v18 + 136), v17);
    os_log_t oslog = (os_log_t)sub_10001120C();
    os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      time_t v5 = oslog;
      os_log_type_t v6 = v12;
      id v19 = (__CFString *)CFUUIDCreateString(0, *(CFUUIDRef *)(v18 + 16));
      uint64_t v7 = v19;
      time_t v4 = v7;
      os_log_type_t v11 = v4;
      int v3 = v17;
      int v2 = time(0);
      sub_100014D2C((uint64_t)v21, (uint64_t)v4, v3 - v2);
      _os_log_debug_impl((void *)&_mh_execute_header, v5, v6, "%@: will try to acquire credentals in %d seconds", v21, 0x12u);

      objc_storeStrong((id *)&v11, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    return;
  }
  if (v17 >= time(0)) {
    goto LABEL_7;
  }
  *(void *)(v18 + 120) = 0;
  id v16 = sub_10001120C();
  char v15 = 2;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG))
  {
    log = v16;
    os_log_type_t type = v15;
    unsigned int v20 = (__CFString *)CFUUIDCreateString(0, *(CFUUIDRef *)(v18 + 16));
    os_log_t v10 = v20;
    uint64_t v14 = v10;
    sub_100006434((uint64_t)v22, (uint64_t)v14);
    _os_log_debug_impl((void *)&_mh_execute_header, log, type, "%@: acquire time is in the past", v22, 0xCu);

    objc_storeStrong((id *)&v14, 0);
  }
  objc_storeStrong(&v16, 0);
}

void sub_1000180A8(id a1)
{
  byte_100028FAC = 1;
  ((void (*)(id))off_100028F18)(a1);
}

void sub_100018100()
{
  predicate = (dispatch_once_t *)&unk_100029068;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_1000251B0);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
}

void sub_100018174(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.GSSCred.event_work", 0);
  int v2 = (void *)qword_100029060;
  qword_100029060 = (uint64_t)v1;
}

void sub_1000183C0(uint64_t a1)
{
  os_log_t oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)sub_10001120C();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    sub_100010EA0((uint64_t)v3, *(_DWORD *)(a1 + 32));
    _os_log_debug_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEBUG, "connection interrupted: %u", v3, 8u);
  }
  objc_storeStrong((id *)oslog, 0);
}

void sub_1000184A8(uint64_t a1)
{
  os_log_t oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)sub_10001120C();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    sub_100010EA0((uint64_t)v3, *(_DWORD *)(a1 + 32));
    _os_log_debug_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEBUG, "connection invalidated: %u", v3, 8u);
  }
  objc_storeStrong((id *)oslog, 0);
}

id sub_10001902C(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  id v16 = 0;
  uint64_t v15 = 32;
  int v14 = 40;
  unsigned int v13 = 0;
  int v12 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() ^ 1)) {
    heim_abort();
  }
  os_log_type_t v11 = (char *)[location length];
  uint64_t v10 = 16;
  if (SecRandomCopyBytes(kSecRandomDefault, 0x20uLL, bytes)) {
    abort();
  }
  if (SecRandomCopyBytes(kSecRandomDefault, 0x10uLL, v21)) {
    abort();
  }
  unsigned int v9 = 72;
  int v8 = sub_10001DCA0(bytes, 32, 13, -1, v20, (int *)&v9, 0);
  if (v8)
  {
    os_log_t oslog = (os_log_t)sub_10001120C();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_100010EA0((uint64_t)v19, v8);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Error with wrap key: %d", v19, 8u);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (!qword_100029070)
    {
      uint64_t v1 = os_transaction_create();
      int v2 = (void *)qword_100029070;
      qword_100029070 = v1;
    }
    id v18 = 0;
  }
  else
  {
    if (qword_100029070) {
      objc_storeStrong((id *)&qword_100029070, 0);
    }
    if ((unint64_t)(int)v9 > 0x48) {
      abort();
    }
    unsigned int v13 = v9;
    id v3 = [objc_alloc((Class)NSMutableData) initWithLength:&v11[v9 + 20 + v10]];
    id v4 = v16;
    id v16 = v3;

    if (v16)
    {
      [v16 mutableBytes];
      __memcpy_chk();
      __memcpy_chk();
      __memcpy_chk();
      [location bytes];
      int v12 = CCCryptorGCMOneshotEncrypt();
      memset_s(bytes, 0, 32, 0x20uLL);
      if (!v12 && v10 == 16) {
        id v18 = v16;
      }
      else {
        id v18 = 0;
      }
    }
    else
    {
      id v18 = 0;
    }
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&location, 0);
  time_t v5 = v18;

  return v5;
}

id sub_1000194F4(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  int v19 = 32;
  int v18 = 22;
  int v17 = 0;
  id v16 = 0;
  uint64_t v15 = 0;
  id v14 = 0;
  id v13 = 0;
  id v12 = [location length];
  os_log_type_t v11 = (unsigned int *)[location bytes];
  unsigned int v10 = 0;
  unint64_t v9 = (unint64_t)v12;
  size_t size = 16;
  if ((unint64_t)v12 >= 0x10)
  {
    v9 -= size;
    if (v9 >= 4)
    {
      unsigned int v10 = *v11++;
      v9 -= 4;
      if (v9 >= v10)
      {
        int v6 = 32;
        int v18 = sub_10001DE0C(v11, v10, 13, -1, __s, &v6);
        if (v18)
        {
          os_log_t oslog = (os_log_t)sub_10001120C();
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            sub_100010EA0((uint64_t)v22, v18);
            _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Error with unwrap key: %d", v22, 8u);
          }
          objc_storeStrong((id *)&oslog, 0);
        }
        else if (v6 == 32)
        {
          os_log_type_t v11 = (unsigned int *)((char *)v11 + v10);
          v9 -= v10;
          if (v9 >= 0x10)
          {
            uint64_t v15 = v11;
            v11 += 4;
            v9 -= 16;
            uint64_t v1 = +[NSMutableData dataWithLength:v9];
            id v2 = v13;
            id v13 = v1;

            if (v13)
            {
              id v16 = malloc_type_malloc(size, 0x6D355473uLL);
              if (v16)
              {
                [v13 mutableBytes];
                int v17 = CCCryptorGCMOneshotDecrypt();
                if (!v17) {
                  objc_storeStrong(&v14, v13);
                }
              }
            }
          }
          else
          {
            int v18 = 22;
          }
        }
        else
        {
          int v18 = 22;
        }
        memset_s(__s, 0, 32, 0x20uLL);
        free(v16);
        id v21 = v14;
        int v7 = 1;
      }
      else
      {
        id v21 = 0;
        int v7 = 1;
      }
    }
    else
    {
      id v21 = 0;
      int v7 = 1;
    }
  }
  else
  {
    id v21 = 0;
    int v7 = 1;
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&location, 0);
  id v3 = v21;

  return v3;
}

void sub_100019958()
{
  CFMutableArrayRef Mutable = CFSetCreateMutable(0, 0, &kCFTypeSetCallBacks);
  CFMutableDictionaryRef theDict = sub_10000D8E0(@"kHEIMObjectKerberosAcquireCred");
  CFDictionarySetValue(theDict, @"kHEIMAttrStatus", @"n");
  CFDictionarySetValue(theDict, @"kHEIMAttrExpire", @"t");
  CFSetAddValue(Mutable, theDict);
  if (theDict) {
    CFRelease(theDict);
  }
  sub_10000D590(@"kHEIMTypeKerberosAcquireCred", Mutable, (uint64_t)sub_10000EFA4, 0, 0, (uint64_t)sub_10000E040, 1, (uint64_t)&off_1000263B8);
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void sub_100019F68(CFMutableDictionaryRef *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = 0;
  objc_storeStrong(&v7, a3);
  int v6 = +[HeimCredDecoder copyNS2CF:location[0]];
  BOOL value = +[HeimCredDecoder copyNS2CF:v7];
  if (v6 && value) {
    CFDictionarySetValue(a1[4], v6, value);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (value) {
    CFRelease(value);
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

void sub_10001A4E0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = a1;
  uint64_t v6 = a2;
  v5[1] = a3;
  v5[0] = a3;
  id v4 = +[HeimCredDecoder copyCF2NS:v7];
  id location = +[HeimCredDecoder copyCF2NS:v6];
  if (v4 && location) {
    [v5[0] setObject:location forKey:v4];
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v5, 0);
}

uint64_t sub_10001AC60(uint64_t result, uint64_t a2)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 66;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_10001AD68(id a1)
{
  id v15 = a1;
  id v14 = a1;
  id v13 = objc_alloc((Class)NSSet);
  uint64_t v12 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  id v1 = objc_msgSend(v13, "initWithObjects:", v12, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  id v2 = (void *)qword_100029080;
  qword_100029080 = (uint64_t)v1;
}

id sub_10001AEC8()
{
  predicate = (dispatch_once_t *)&unk_100029088;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &stru_100025210);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  id v0 = (void *)qword_100029090;

  return v0;
}

void sub_10001AF54(id a1)
{
  os_log_t v1 = os_log_create("com.apple.Heimdal", "GSSCredHelper");
  id v2 = (void *)qword_100029090;
  qword_100029090 = (uint64_t)v1;
}

uint64_t sub_10001C170(uint64_t result, int a2, int a3)
{
  *(unsigned char *)uint64_t result = 0;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(unsigned char *)(result + 8) = 0;
  *(unsigned char *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  return result;
}

uint64_t sub_10001DAB0()
{
  if (qword_1000290A0 != -1) {
    dispatch_once(&qword_1000290A0, &stru_100025290);
  }
  dispatch_sync((dispatch_queue_t)qword_1000290A8, &stru_100025250);
  uint64_t result = dword_100029098;
  if (!dword_100029098)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return dword_100029098;
  }
  return result;
}

void sub_10001DB3C(id a1)
{
  if (!dword_100029098) {
    dword_100029098 = sub_10001DBA8("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
  }
}

void sub_10001DB7C(id a1)
{
  qword_1000290A8 = (uint64_t)dispatch_queue_create("aks-client-queue", 0);
}

uint64_t sub_10001DBA8(char *path, const char *a2)
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
    uint64_t v6 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v6);
    if (MatchingService)
    {
      uint64_t v8 = MatchingService;
      IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
      IOObjectRelease(v8);
    }
  }
  uint64_t result = connect;
  if (connect)
  {
    uint64_t v10 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    uint64_t result = connect;
    if (v10)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

uint64_t sub_10001DCA0(const void *a1, int a2, int a3, int a4, void *a5, int *a6, _DWORD *a7)
{
  uint64_t v14 = 3758097084;
  mach_port_t v15 = sub_10001DAB0();
  if (v15)
  {
    uint64_t v14 = 3758097090;
    if (a1 && a5 && a6)
    {
      input[0] = a4;
      input[1] = a3;
      uint64_t output = 0;
      uint32_t outputCnt = 1;
      size_t v18 = *a6;
      uint64_t v16 = IOConnectCallMethod(v15, 0xAu, input, 2u, a1, a2, &output, &outputCnt, a5, &v18);
      if (v16)
      {
        return v16;
      }
      else
      {
        *a6 = v18;
        uint64_t v14 = 0;
        if (a7) {
          *a7 = output;
        }
      }
    }
  }
  else
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_wrap_key", ":", 848, "", 0, "", "");
  }
  return v14;
}

uint64_t sub_10001DE0C(const void *a1, int a2, int a3, int a4, void *a5, int *a6)
{
  uint64_t v12 = 3758097084;
  mach_port_t v13 = sub_10001DAB0();
  if (v13)
  {
    uint64_t v12 = 3758097090;
    if (a1)
    {
      if (a5)
      {
        if (a6)
        {
          input[0] = a4;
          input[1] = a3;
          size_t v15 = *a6;
          uint64_t v12 = IOConnectCallMethod(v13, 0xBu, input, 2u, a1, a2, 0, 0, a5, &v15);
          if (!v12) {
            *a6 = v15;
          }
        }
      }
    }
  }
  else
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_unwrap_key", ":", 877, "", 0, "", "");
  }
  return v12;
}

void heim_ipc_resume_events()
{
}

void _heim_ipc_suspend_timer()
{
  id v0 = qword_1000290B8;
  if (qword_1000290B8)
  {
    dispatch_suspend(v0);
  }
  else
  {
    uint64_t v1 = heim_abort();
    _heim_ipc_restart_timer(v1);
  }
}

void _heim_ipc_restart_timer()
{
}

void sub_10001DFB0(id a1)
{
  if (qword_1000290B8)
  {
    sub_10001DFFC();
    uint64_t v1 = qword_1000290B8;
    dispatch_resume(v1);
  }
  else
  {
    heim_abort();
    sub_10001DFFC();
  }
}

void sub_10001DFFC()
{
  id v0 = qword_1000290B8;
  dispatch_time_t v1 = dispatch_time(0, 1000000000 * qword_1000290D0);

  dispatch_source_set_timer(v0, v1, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
}

void sub_10001E060(id a1)
{
  qword_1000290C0 = (uint64_t)dispatch_queue_create("hiem-sipc-timer-q", 0);
  dispatch_time_t v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_1000290C0);
  qword_1000290B8 = (uint64_t)v1;
  if (v1)
  {
    dispatch_source_set_event_handler(v1, &stru_100025350);
    qword_1000290C8 = (uint64_t)dispatch_get_global_queue(0, 0);
    id v2 = dispatch_queue_create("heim-ipc.event-queue", 0);
    qword_1000290B0 = (uint64_t)v2;
    dispatch_suspend(v2);
  }
  else
  {
    io_service_t v3 = (void *)heim_abort();
    sub_10001E104(v3);
  }
}

void sub_10001E104(id a1)
{
}

void sub_10001E110()
{
}

void *heap_new(unsigned int a1, uint64_t a2)
{
  if (!a1) {
    sub_10001EDA4();
  }
  io_object_t v4 = malloc_type_malloc(0x18uLL, 0x10A0040319E9F20uLL);
  uint64_t v5 = v4;
  if (v4)
  {
    *io_object_t v4 = a2;
    *((_DWORD *)v4 + 2) = a1;
    *((_DWORD *)v4 + 3) = 0;
    uint64_t v6 = malloc_type_malloc(16 * a1, 0xD004068C55854uLL);
    id v5[2] = v6;
    if (v6)
    {
      bzero(v6, 16 * a1);
    }
    else
    {
      free(v5);
      return 0;
    }
  }
  return v5;
}

uint64_t heap_insert(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a2) {
    sub_10001EDD0();
  }
  unsigned int v6 = *(_DWORD *)(a1 + 12);
  if (v6 == *(_DWORD *)(a1 + 8))
  {
    int v7 = 2 * v6;
    uint64_t v8 = (char *)malloc_type_realloc(*(void **)(a1 + 16), 32 * v6, 0xD004068C55854uLL);
    if (!v8) {
      return 0xFFFFFFFFLL;
    }
    *(_DWORD *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v8;
    unsigned int v6 = *(_DWORD *)(a1 + 12);
  }
  else
  {
    uint64_t v8 = *(char **)(a1 + 16);
  }
  uint64_t v9 = &unk_1000290E0;
  if (a3) {
    uint64_t v9 = a3;
  }
  uint64_t v10 = &v8[16 * v6];
  *(void *)uint64_t v10 = a2;
  *((void *)v10 + 1) = v9;
  sub_10001E274(a1, v6);
  uint64_t result = 0;
  ++*(_DWORD *)(a1 + 12);
  return result;
}

uint64_t sub_10001E274(uint64_t result, unsigned int a2)
{
  unsigned int v2 = a2;
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(result + 16);
  uint64_t v5 = (uint64_t *)(v4 + 16 * a2);
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  if (a2)
  {
    do
    {
      uint64_t v8 = ((v2 + 1) >> 1) - 1;
      uint64_t result = (*(uint64_t (**)(void, uint64_t))v3)(*(void *)(v4 + 16 * v8), v6);
      uint64_t v4 = *(void *)(v3 + 16);
      if ((int)result < 1) {
        break;
      }
      *(_OWORD *)(v4 + 16 * v2) = *(_OWORD *)(v4 + 16 * v8);
      uint64_t v4 = *(void *)(v3 + 16);
      **(_DWORD **)(v4 + 16 * v2 + 8) = v2;
      unsigned int v2 = ((v2 + 1) >> 1) - 1;
    }
    while (v8);
  }
  uint64_t v9 = (void *)(v4 + 16 * v2);
  *uint64_t v9 = v6;
  v9[1] = v7;
  **(_DWORD **)(*(void *)(v3 + 16) + 16 * v2 + 8) = v2;
  return result;
}

uint64_t heap_head(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 12)) {
    return **(void **)(a1 + 16);
  }
  else {
    return 0;
  }
}

uint64_t heap_remove_head(uint64_t a1)
{
  return sub_10001E340(a1, 0);
}

uint64_t sub_10001E340(uint64_t result, unsigned int a2)
{
  unsigned int v2 = *(_DWORD *)(result + 12);
  if (v2 <= a2) {
    sub_10001EE28();
  }
  uint64_t v4 = result;
  unsigned int v5 = v2 - 1;
  *(_DWORD *)(result + 12) = v5;
  *(_OWORD *)(*(void *)(result + 16) + 16 * a2) = *(_OWORD *)(*(void *)(result + 16) + 16 * v5);
  uint64_t v6 = *(void *)(result + 16);
  uint64_t v7 = *(unsigned int *)(result + 12);
  uint64_t v8 = (void *)(v6 + 16 * v7);
  *uint64_t v8 = 0;
  v8[1] = 0;
  if (v7 != a2)
  {
    uint64_t v9 = a2;
    uint64_t v10 = (uint64_t *)(v6 + 16 * a2);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    unsigned int v13 = a2;
    if (a2 < v7 >> 1)
    {
      while (1)
      {
        unsigned int v14 = (2 * v13) | 1;
        if (v14 >= v7) {
          sub_10001EDFC();
        }
        int v15 = (*(uint64_t (**)(uint64_t, void))v4)(v11, *(void *)(v6 + 16 * ((2 * v13) | 1)));
        if (2 * v13 + 2 < *(_DWORD *)(v4 + 12))
        {
          int v16 = (*(uint64_t (**)(uint64_t, void))v4)(v11, *(void *)(*(void *)(v4 + 16) + 16 * (2 * v13 + 2)));
          if (v16 > v15)
          {
            int v15 = v16;
            unsigned int v14 = 2 * v13 + 2;
          }
        }
        uint64_t v6 = *(void *)(v4 + 16);
        if (v15 <= 0) {
          break;
        }
        *(_OWORD *)(v6 + 16 * v13) = *(_OWORD *)(v6 + 16 * v14);
        uint64_t v6 = *(void *)(v4 + 16);
        **(_DWORD **)(v6 + 16 * v13 + 8) = v13;
        LODWORD(v7) = *(_DWORD *)(v4 + 12);
        unsigned int v13 = v14;
        if (v14 >= v7 >> 1)
        {
          uint64_t v9 = v14;
          unsigned int v13 = v14;
          goto LABEL_12;
        }
      }
      uint64_t v9 = v13;
    }
LABEL_12:
    int v17 = (void *)(v6 + 16 * v9);
    *int v17 = v11;
    v17[1] = v12;
    **(_DWORD **)(*(void *)(v4 + 16) + 16 * v9 + 8) = v13;
    return sub_10001E274(v4, a2);
  }
  return result;
}

uint64_t heap_remove(uint64_t a1, unsigned int a2)
{
  if (!*(_DWORD *)(a1 + 12)) {
    return 0xFFFFFFFFLL;
  }
  if (*(_UNKNOWN **)(*(void *)(a1 + 16) + 16 * a2 + 8) == &unk_1000290E0) {
    sub_10001EE54();
  }
  sub_10001E340(a1, a2);
  return 0;
}

void *heim_ipc_event_create_f(uint64_t a1, uint64_t a2)
{
  if (qword_100029100 != -1) {
    dispatch_once(&qword_100029100, &stru_100025410);
  }
  uint64_t result = malloc_type_malloc(0x38uLL, 0x10A004032F0517AuLL);
  if (result)
  {
    *(_DWORD *)uint64_t result = -1;
    result[1] = 0;
    *((_DWORD *)result + 4) = 0;
    result[3] = a1;
    result[5] = a2;
    result[6] = 0;
  }
  return result;
}

void *heim_ipc_event_cf_create_f(uint64_t a1, CFTypeRef cf)
{
  CFRetain(cf);
  uint64_t result = heim_ipc_event_create_f(a1, (uint64_t)cf);
  *((_DWORD *)result + 4) |= 4u;
  return result;
}

uint64_t heim_ipc_event_set_time(uint64_t a1, uint64_t a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000;
  v3[2] = sub_10001E64C;
  v3[3] = &unk_100025370;
  v3[4] = a1;
  v3[5] = a2;
  dispatch_sync((dispatch_queue_t)qword_1000290E8, v3);
  return 0;
}

void sub_10001E64C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v1 + 16) & 2) != 0) {
    abort();
  }
  if (*(_DWORD *)v1 != -1) {
    heap_remove(qword_1000290F0, *(_DWORD *)v1);
  }
  time_t v3 = time(0);
  uint64_t v4 = *(void **)(a1 + 32);
  time_t v5 = *(void *)(a1 + 40);
  if (v5 <= v3) {
    time_t v5 = v3;
  }
  v4[6] = v5;
  heap_insert(qword_1000290F0, (uint64_t)v4, v4);

  sub_10001E6C8();
}

void sub_10001E6C8()
{
  uint64_t v0 = heap_head(qword_1000290F0);
  if (v0)
  {
    v4.tv_sec = *(void *)(v0 + 48);
    v4.tv_nsec = 0;
    uint64_t v1 = qword_100029108;
    dispatch_time_t v2 = dispatch_walltime(&v4, 0);
    dispatch_source_set_timer(v1, v2, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
  }
  else
  {
    time_t v3 = qword_100029108;
    dispatch_source_set_timer(v3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

void heim_ipc_event_cancel(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10001E7E0;
  block[3] = &unk_100025390;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)qword_1000290E8, block);
}

void sub_10001E7E0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_DWORD *)v1 != -1)
  {
    heap_remove(qword_1000290F0, *(_DWORD *)v1);
    uint64_t v1 = *(void *)(a1 + 32);
    *(_DWORD *)uint64_t v1 = -1;
  }
  *(void *)(v1 + 48) = 0;

  sub_10001E6C8();
}

void heim_ipc_event_free(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10001E8B4;
  block[3] = &unk_1000253D0;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)qword_1000290E8, block);
}

void sub_10001E8B4(uint64_t a1)
{
  dispatch_time_t v2 = *(void **)(a1 + 32);
  int v3 = *((_DWORD *)v2 + 4);
  *((_DWORD *)v2 + 4) = v3 | 2;
  if (*(_DWORD *)v2 != -1) {
    abort();
  }
  int v4 = v3 & 1;
  if (*((void *)v2 + 4)) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (v5)
  {
    if ((v3 & 4) != 0)
    {
      CFRelease(*((CFTypeRef *)v2 + 5));
      dispatch_time_t v2 = *(void **)(a1 + 32);
    }
    free(v2);
  }
  else
  {
    if (v3)
    {
      *(void *)(*(void *)(a1 + 32) + 8) = dispatch_semaphore_create(0);
      dispatch_time_t v2 = *(void **)(a1 + 32);
    }
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 0x40000000;
    v6[2] = sub_10001E9B8;
    v6[3] = &unk_1000253B0;
    int v7 = v4;
    v6[4] = v2;
    dispatch_async((dispatch_queue_t)qword_1000290F8, v6);
  }
}

void sub_10001E9B8(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 40))
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 8), 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
  }
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void (**)(void))(v2 + 32);
  if (v3)
  {
    v3(*(void *)(v2 + 40));
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if ((*(unsigned char *)(v2 + 16) & 4) != 0)
  {
    CFRelease(*(CFTypeRef *)(v2 + 40));
    uint64_t v2 = *(void *)(a1 + 32);
  }

  free((void *)v2);
}

uint64_t heim_ipc_event_set_final_f(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = a2;
  return result;
}

void sub_10001EA40(id a1)
{
  qword_1000290E8 = (uint64_t)dispatch_queue_create("hiem-timer-q", 0);
  qword_1000290F8 = (uint64_t)dispatch_get_global_queue(0, 0);
  qword_1000290F0 = (uint64_t)heap_new(0xBu, (uint64_t)sub_10001EAE8);
  qword_100029108 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_1000290E8);
  dispatch_source_set_event_handler((dispatch_source_t)qword_100029108, &stru_100025450);
  uint64_t v1 = qword_100029108;

  dispatch_resume(v1);
}

uint64_t sub_10001EAE8(uint64_t a1, uint64_t a2)
{
  return (*(_DWORD *)(a1 + 48) - *(_DWORD *)(a2 + 48));
}

void sub_10001EAF8(id a1)
{
  time_t v1 = time(0);
  uint64_t v2 = heap_head(qword_1000290F0);
  if (v2)
  {
    int v3 = (_DWORD *)v2;
    do
    {
      if (*((void *)v3 + 6) >= v1) {
        break;
      }
      heap_remove_head(qword_1000290F0);
      *int v3 = -1;
      int v4 = v3[4];
      if (v4)
      {
        *((void *)v3 + 6) = v1 + 10;
        heap_insert(qword_1000290F0, (uint64_t)v3, v3);
      }
      else
      {
        v3[4] = v4 | 1;
        _heim_ipc_suspend_timer();
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000;
        block[2] = sub_10001EC1C;
        block[3] = &unk_100025490;
        block[4] = v3;
        dispatch_async((dispatch_queue_t)qword_1000290F8, block);
      }
      int v3 = (_DWORD *)heap_head(qword_1000290F0);
    }
    while (v3);
  }
  sub_10001E6C8();
}

void sub_10001EC1C(uint64_t a1)
{
  (*(void (**)(void, void))(*(void *)(a1 + 32) + 24))(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 40));
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10001ECB0;
  block[3] = &unk_100025470;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)qword_1000290E8, block);
}

void sub_10001ECB0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  *(_DWORD *)(v1 + 16) &= ~1u;
  uint64_t v2 = *(NSObject **)(v1 + 8);
  if (v2) {
    dispatch_semaphore_signal(v2);
  }

  _heim_ipc_restart_timer();
}

char *rk_cfstring2cstring(const __CFString *a1)
{
  CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr)
  {
    return strdup(CStringPtr);
  }
  else
  {
    CFIndex Length = CFStringGetLength(a1);
    CFIndex v5 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    uint64_t v6 = malloc_type_malloc(v5, 0xCC12B4F2uLL);
    if (v6 && !CFStringGetCString(a1, (char *)v6, v5, 0x8000100u))
    {
      free(v6);
      return 0;
    }
    return (char *)v6;
  }
}

void sub_10001EDA4()
{
  __assert_rtn("heap_new", "heap.c", 65, "sz != 0");
}

void sub_10001EDD0()
{
  __assert_rtn("heap_insert", "heap.c", 178, "data != NULL");
}

void sub_10001EDFC()
{
}

void sub_10001EE28()
{
}

void sub_10001EE54()
{
  __assert_rtn("heap_remove", "heap.c", 253, "h->data[ptr].ptr != &dummy");
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return _CCCryptorGCMOneshotDecrypt();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return _CCCryptorGCMOneshotEncrypt();
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return _CFArrayCreateMutableCopy(allocator, capacity, theArray);
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

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return _CFDataCreateCopy(allocator, theData);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return _CFDateCompare(theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return _CFDateCreate(allocator, at);
}

CFTypeID CFDateGetTypeID(void)
{
  return _CFDateGetTypeID();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return _CFDictionaryGetValueIfPresent(theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return _CFErrorCreateWithUserInfoKeysAndValues(allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return _CFHash(cf);
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

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return _CFSetCreateMutable(allocator, capacity, callBacks);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFRange v5 = _CFStringFind(theString, stringToFind, compareOptions);
  CFIndex length = v5.length;
  CFIndex location = v5.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
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

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return _CFUUIDCreateFromUUIDBytes(alloc, bytes);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

CFTypeID CFUUIDGetTypeID(void)
{
  return _CFUUIDGetTypeID();
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  CFUUIDBytes v3 = _CFUUIDGetUUIDBytes(uuid);
  uint64_t v2 = *(void *)&v3.byte8;
  uint64_t v1 = *(void *)&v3.byte0;
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

uint64_t HeimCredGetAttributes()
{
  return _HeimCredGetAttributes();
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

uint64_t MKBUserTypeDeviceMode()
{
  return _MKBUserTypeDeviceMode();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return _SecRandomCopyBytes(rnd, count, bytes);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return __CFRuntimeCreateInstance();
}

uint64_t _CFRuntimeRegisterClass()
{
  return __CFRuntimeRegisterClass();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

uint64_t __memset_chk()
{
  return ___memset_chk();
}

uint64_t _krb5_init_creds_get_cred_endtime()
{
  return __krb5_init_creds_get_cred_endtime();
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

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

au_sdev_handle_t *__cdecl au_sdev_open(int flags)
{
  return _au_sdev_open(flags);
}

int au_sdev_read_aia(au_sdev_handle_t *ash, int *event, auditinfo_addr_t *aia_p)
{
  return _au_sdev_read_aia(ash, event, aia_p);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return _audit_token_to_pid(atoken);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t csops_audittoken()
{
  return _csops_audittoken();
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

void dispatch_release(dispatch_object_t object)
{
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

uint64_t heim_abort()
{
  return _heim_abort();
}

uint64_t heim_ntlm_build_ntlm2_master()
{
  return _heim_ntlm_build_ntlm2_master();
}

uint64_t heim_ntlm_calculate_ntlm2()
{
  return _heim_ntlm_calculate_ntlm2();
}

uint64_t heim_ntlm_decode_targetinfo()
{
  return _heim_ntlm_decode_targetinfo();
}

uint64_t heim_ntlm_decode_type2()
{
  return _heim_ntlm_decode_type2();
}

uint64_t heim_ntlm_encode_targetinfo()
{
  return _heim_ntlm_encode_targetinfo();
}

uint64_t heim_ntlm_encode_type3()
{
  return _heim_ntlm_encode_type3();
}

uint64_t heim_ntlm_free_buf()
{
  return _heim_ntlm_free_buf();
}

uint64_t heim_ntlm_free_targetinfo()
{
  return _heim_ntlm_free_targetinfo();
}

uint64_t heim_ntlm_free_type2()
{
  return _heim_ntlm_free_type2();
}

uint64_t heim_ntlm_unparse_flags()
{
  return _heim_ntlm_unparse_flags();
}

uint64_t heim_ntlm_v2_base_session()
{
  return _heim_ntlm_v2_base_session();
}

uint64_t krb5_cc_clear_mcred()
{
  return _krb5_cc_clear_mcred();
}

krb5_error_code krb5_cc_close(krb5_context context, krb5_ccache cache)
{
  return _krb5_cc_close(context, cache);
}

krb5_error_code krb5_cc_destroy(krb5_context context, krb5_ccache cache)
{
  return _krb5_cc_destroy(context, cache);
}

krb5_error_code krb5_cc_end_seq_get(krb5_context context, krb5_ccache cache, krb5_cc_cursor *cursor)
{
  return _krb5_cc_end_seq_get(context, cache, cursor);
}

krb5_error_code krb5_cc_get_principal(krb5_context context, krb5_ccache cache, krb5_principal *principal)
{
  return _krb5_cc_get_principal(context, cache, principal);
}

krb5_error_code krb5_cc_initialize(krb5_context context, krb5_ccache cache, krb5_principal principal)
{
  return _krb5_cc_initialize(context, cache, principal);
}

krb5_error_code krb5_cc_new_unique(krb5_context context, const char *type, const char *hint, krb5_ccache *id)
{
  return _krb5_cc_new_unique(context, type, hint, id);
}

krb5_error_code krb5_cc_next_cred(krb5_context context, krb5_ccache cache, krb5_cc_cursor *cursor, krb5_creds *creds)
{
  return _krb5_cc_next_cred(context, cache, cursor, creds);
}

krb5_error_code krb5_cc_remove_cred(krb5_context context, krb5_ccache cache, krb5_flags flags, krb5_creds *creds)
{
  return _krb5_cc_remove_cred(context, cache, flags, creds);
}

uint64_t krb5_cc_resolve_by_uuid()
{
  return _krb5_cc_resolve_by_uuid();
}

krb5_error_code krb5_cc_retrieve_cred(krb5_context context, krb5_ccache cache, krb5_flags flags, krb5_creds *mcreds, krb5_creds *creds)
{
  return _krb5_cc_retrieve_cred(context, cache, flags, mcreds, creds);
}

krb5_error_code krb5_cc_start_seq_get(krb5_context context, krb5_ccache cache, krb5_cc_cursor *cursor)
{
  return _krb5_cc_start_seq_get(context, cache, cursor);
}

krb5_error_code krb5_cc_store_cred(krb5_context context, krb5_ccache cache, krb5_creds *creds)
{
  return _krb5_cc_store_cred(context, cache, creds);
}

uint64_t krb5_config_get_BOOL_default()
{
  return _krb5_config_get_BOOL_default();
}

uint64_t krb5_free_config_files()
{
  return _krb5_free_config_files();
}

void krb5_free_context(krb5_context a1)
{
}

void krb5_free_cred_contents(krb5_context a1, krb5_creds *a2)
{
}

void krb5_free_creds(krb5_context a1, krb5_creds *a2)
{
}

void krb5_free_error_message(krb5_context a1, const char *a2)
{
}

void krb5_free_principal(krb5_context a1, krb5_principal a2)
{
}

const char *__cdecl krb5_get_error_message(krb5_context a1, krb5_error_code a2)
{
  return _krb5_get_error_message(a1, a2);
}

krb5_error_code krb5_get_init_creds_opt_alloc(krb5_context context, krb5_get_init_creds_opt **opt)
{
  return _krb5_get_init_creds_opt_alloc(context, opt);
}

void krb5_get_init_creds_opt_free(krb5_context context, krb5_get_init_creds_opt *opt)
{
}

void krb5_get_init_creds_opt_set_canonicalize(krb5_get_init_creds_opt *opt, int canonicalize)
{
}

uint64_t krb5_get_init_creds_opt_set_default_flags()
{
  return _krb5_get_init_creds_opt_set_default_flags();
}

void krb5_get_init_creds_opt_set_forwardable(krb5_get_init_creds_opt *opt, int forwardable)
{
}

void krb5_get_init_creds_opt_set_proxiable(krb5_get_init_creds_opt *opt, int proxiable)
{
}

uint64_t krb5_get_init_creds_opt_set_win2k()
{
  return _krb5_get_init_creds_opt_set_win2k();
}

uint64_t krb5_get_kdc_cred()
{
  return _krb5_get_kdc_cred();
}

krb5_error_code krb5_init_context(krb5_context *a1)
{
  return _krb5_init_context(a1);
}

uint64_t krb5_init_creds_free()
{
  return _krb5_init_creds_free();
}

uint64_t krb5_init_creds_get()
{
  return _krb5_init_creds_get();
}

uint64_t krb5_init_creds_init()
{
  return _krb5_init_creds_init();
}

uint64_t krb5_init_creds_set_password()
{
  return _krb5_init_creds_set_password();
}

uint64_t krb5_init_creds_store()
{
  return _krb5_init_creds_store();
}

uint64_t krb5_init_creds_store_config()
{
  return _krb5_init_creds_store_config();
}

krb5_BOOLean krb5_is_config_principal(krb5_context a1, krb5_const_principal a2)
{
  return _krb5_is_config_principal(a1, a2);
}

uint64_t krb5_make_principal()
{
  return _krb5_make_principal();
}

krb5_error_code krb5_parse_name(krb5_context a1, const char *a2, krb5_principal *a3)
{
  return _krb5_parse_name(a1, a2, a3);
}

uint64_t krb5_prepend_config_files_default()
{
  return _krb5_prepend_config_files_default();
}

uint64_t krb5_principal_get_realm()
{
  return _krb5_principal_get_realm();
}

uint64_t krb5_set_config_files()
{
  return _krb5_set_config_files();
}

uint64_t krb5_set_home_dir_access()
{
  return _krb5_set_home_dir_access();
}

uint64_t krb5_warn()
{
  return _krb5_warn();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return _memset_s(__s, __smax, __c, __n);
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

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void objc_terminate(void)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

uint64_t os_log_set_client_type()
{
  return _os_log_set_client_type();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
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

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

void syslog(int a1, const char *a2, ...)
{
}

time_t time(time_t *a1)
{
  return _time(a1);
}

mode_t umask(mode_t a1)
{
  return _umask(a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return _uuid_compare(uu1, uu2);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return _uuid_parse(in, uu);
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

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
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

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
}

uint64_t xpc_connection_set_oneshot_instance()
{
  return _xpc_connection_set_oneshot_instance();
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
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

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uuid(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 _xpcConnection];
}

id objc_msgSend_allowedClasses(void *a1, const char *a2, ...)
{
  return [a1 allowedClasses];
}

id objc_msgSend_alternateDSID(void *a1, const char *a2, ...)
{
  return [a1 alternateDSID];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return [a1 currentUser];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return [a1 finishDecoding];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listenForChanges(void *a1, const char *a2, ...)
{
  return [a1 listenForChanges];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_managedAppBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 managedAppBundleIDs];
}

id objc_msgSend_managedApps(void *a1, const char *a2, ...)
{
  return [a1 managedApps];
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

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_updateManagedApps_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateManagedApps:");
}