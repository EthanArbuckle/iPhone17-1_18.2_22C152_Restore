CFStringRef sub_100003BF0()
{
  return @"FalseStartQuery";
}

const char *sub_100003BFC()
{
  return "TLSFalseStart";
}

uint64_t sub_100003C08()
{
  return 2;
}

uint64_t sub_100003C10(uint64_t a1)
{
  dispatch_source_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)(a1 + 8));
  uint64_t v3 = *(void *)(a1 + 80);
  *(void *)(a1 + 80) = v2;
  if (v3) {
    (*(void (**)(void))(a1 + 88))();
  }
  *(void *)(a1 + 88) = sub_10000407C;
  v4 = getenv("CFNETWORKAGENT_FALSESTART_TIMEOUT");
  if (v4) {
    double v5 = (double)strtol(v4, 0, 10) * 1000000000.0;
  }
  else {
    double v5 = 6.0e10;
  }
  v6 = *(NSObject **)(a1 + 80);
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)v5);
  dispatch_source_set_timer(v6, v7, (unint64_t)v5, 0x3B9ACA00uLL);
  v8 = *(NSObject **)(a1 + 80);
  handler.version = (CFIndex)_NSConcreteStackBlock;
  handler.info = (void *)3221225472;
  handler.retain = (void *(__cdecl *)(void *))sub_100003FDC;
  handler.release = (void (__cdecl *)(void *))&unk_100014958;
  handler.copyDescription = (CFStringRef (__cdecl *)(void *))a1;
  dispatch_source_set_event_handler(v8, &handler);
  dispatch_resume(*(dispatch_object_t *)(a1 + 80));
  v9 = CFReadStreamCreateForHTTPRequest(kCFAllocatorDefault, (CFHTTPMessageRef)qword_1000188B8);
  *(void *)(a1 + 72) = v9;
  if (v9)
  {
    handler.version = 0;
    handler.info = (void *)a1;
    memset(&handler.retain, 0, 24);
    CFReadStreamSetClient(v9, 0x1AuLL, (CFReadStreamClientCallBack)sub_100003EAC, &handler);
    CFReadStreamSetDispatchQueue(*(CFReadStreamRef *)(a1 + 72), *(dispatch_queue_t *)(a1 + 8));
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v11 = Mutable;
    if (byte_1000188C0 == 1) {
      CFDictionaryAddValue(Mutable, kCFStreamSSLValidatesCertificateChain, kCFBooleanFalse);
    }
    CFDictionaryAddValue(v11, @"_kCFStreamSSLUseFalseStartNoCompatibilityCheck", kCFBooleanTrue);
    CFDictionaryAddValue(v11, _kCFStreamSSLShouldSetPeerID, kCFBooleanFalse);
    CFReadStreamSetProperty(*(CFReadStreamRef *)(a1 + 72), kCFStreamPropertySSLSettings, v11);
    CFRelease(v11);
    uint64_t result = CFReadStreamOpen(*(CFReadStreamRef *)(a1 + 72));
    if (result)
    {
      if (*(unsigned char *)(a1 + 48)) {
        return result;
      }
      goto LABEL_16;
    }
    v13 = CFReadStreamCopyError(*(CFReadStreamRef *)(a1 + 72));
    sub_10000E558(v13);
    if (v13) {
      CFRelease(v13);
    }
    CFReadStreamSetDispatchQueue(*(CFReadStreamRef *)(a1 + 72), 0);
  }
  *(unsigned char *)(a1 + 48) = 0;
LABEL_16:

  return sub_10000E968((void *)a1);
}

void sub_100003EAC(CFReadStreamRef stream, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (a2 != 16)
    {
      if (a2 == 8)
      {
        double v5 = CFReadStreamCopyError(stream);
        sub_10000E558(v5);
        *(unsigned char *)(a3 + 48) = 0;
        if (v5) {
          CFRelease(v5);
        }
      }
      if (!*(unsigned char *)(a3 + 48)) {
        return;
      }
LABEL_14:
      CFReadStreamSetDispatchQueue(*(CFReadStreamRef *)(a3 + 72), 0);
      CFReadStreamClose(*(CFReadStreamRef *)(a3 + 72));
      uint64_t v8 = *(void *)(a3 + 80);
      *(void *)(a3 + 80) = 0;
      if (v8) {
        (*(void (**)(void))(a3 + 88))();
      }
      sub_10000E968((void *)a3);
      return;
    }
    v6 = (__CFHTTPMessage *)CFReadStreamCopyProperty(stream, kCFStreamPropertyHTTPResponseHeader);
    if (!v6)
    {
      *(unsigned char *)(a3 + 48) = 0;
      return;
    }
    dispatch_time_t v7 = v6;
    if (CFHTTPMessageGetResponseStatusCode(v6) == 200)
    {
      CFRelease(v7);
      goto LABEL_14;
    }
    *(unsigned char *)(a3 + 48) = 0;
    CFRelease(v7);
  }
  else
  {
    CFReadStreamSetDispatchQueue(stream, 0);
    CFReadStreamClose(stream);
  }
}

uint64_t sub_100003FDC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "False Start request timer fired", v4, 2u);
  }
  CFReadStreamSetDispatchQueue(*(CFReadStreamRef *)(v1 + 72), 0);
  CFReadStreamClose(*(CFReadStreamRef *)(v1 + 72));
  uint64_t v2 = *(void *)(v1 + 80);
  *(void *)(v1 + 80) = 0;
  if (v2) {
    (*(void (**)(void))(v1 + 88))();
  }
  *(unsigned char *)(v1 + 48) = 0;
  return sub_10000E968((void *)v1);
}

void sub_10000407C(NSObject *a1)
{
  if (a1)
  {
    dispatch_source_cancel(a1);
    dispatch_release(a1);
  }
}

void sub_1000040BC(uint64_t a1)
{
  sub_1000040F4(a1);

  operator delete();
}

uint64_t sub_1000040F4(uint64_t a1)
{
  *(void *)a1 = off_100014928;
  uint64_t v2 = *(const void **)(a1 + 72);
  *(void *)(a1 + 72) = 0;
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(void *)(a1 + 80);
  *(void *)(a1 + 80) = 0;
  if (v3) {
    (*(void (**)(void))(a1 + 88))();
  }

  return sub_10000E8DC(a1);
}

void sub_100004168(_Unwind_Exception *a1)
{
  uint64_t v3 = *(void *)(v1 + 80);
  *(void *)(v1 + 80) = 0;
  if (v3) {
    (*(void (**)(void))(v1 + 88))();
  }
  sub_10000E8DC(v1);
  _Unwind_Resume(a1);
}

void start()
{
  signal(15, (void (__cdecl *)(int))sub_100006B70);
  signal(2, (void (__cdecl *)(int))sub_100006B70);
  signal(9, (void (__cdecl *)(int))sub_100006B70);
  v14[0] = 0;
  v14[1] = 0;
  memset(v10, 0, sizeof(v10));
  memset(cf, 0, sizeof(cf));
  memset(&v12, 0, sizeof(v12));
  v13 = v14;
  dispatch_queue_t v15 = 0;
  v16 = 0;
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.cfnetwork.cfnetworkagent.legacy", v0);
  dispatch_queue_t v5 = v15;
  dispatch_queue_t v15 = v4;
  if (v5) {
    ((void (*)(dispatch_queue_t, uint64_t, uint64_t, uint64_t))v16)(v5, v1, v2, v3);
  }
  v16 = sub_10000CBE0;
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = cf;
  SCDynamicStoreRef v6 = SCDynamicStoreCreateWithOptions(kCFAllocatorDefault, @"CFNETWORK_AGENT_STORE", 0, 0, &context);
  CFTypeRef v7 = cf[0];
  cf[0] = v6;
  if (v7) {
    CFRelease(v7);
  }
  uint64_t v8 = getenv("CFNETWORKAGENT_KEY_SPACE_ROOT");
  if (v8) {
    v9 = v8;
  }
  else {
    v9 = "com.apple.CFNetwork.netcompat";
  }
  sub_100009438(&v17, v9);
  if (SHIBYTE(cf[3]) < 0) {
    operator delete((void *)cf[1]);
  }
  *(_OWORD *)&cf[1] = v17;
  cf[3] = v18;
  std::string::operator=(&v12, (const std::string *)&cf[1]);
  std::string::append(&v12, ":");
  std::string::append(&v12, "com.apple.CFNetwork.netcompat.lastpurge");
  sub_1000043A0((uint64_t)v10);
  dispatch_main();
}

void sub_100004314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void (*a10)(void), uint64_t a11, void (*a12)(void), CFTypeRef cf, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,char *a27,uint64_t a28,uint64_t a29,void (*a30)(void))
{
  if (a29) {
    a30();
  }
  sub_10000CB84(a27);
  if (a25 < 0) {
    operator delete(__p);
  }
  if (a19 < 0) {
    operator delete(a14);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (a11) {
    a12();
  }
  if (a9) {
    a10();
  }
  _Unwind_Resume(a1);
}

void sub_1000043A0(uint64_t a1)
{
  uint64_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  uint64_t v3 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v2;
  if (v3)
  {
    (*(void (**)(uint64_t))(a1 + 24))(v3);
    uint64_t v2 = *(NSObject **)(a1 + 16);
  }
  *(void *)(a1 + 24) = sub_100006B30;
  sub_1000046E8(v2);
  dispatch_queue_t v4 = *(NSObject **)(a1 + 16);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100006914;
  handler[3] = &unk_100014958;
  handler[4] = a1;
  dispatch_source_set_event_handler(v4, handler);
  dispatch_resume(*(dispatch_object_t *)(a1 + 16));
  dispatch_queue_t v5 = getenv("CFNETWORKAGENT_SERVICE_NAME");
  if (!v5) {
    dispatch_queue_t v5 = "com.apple.cfnetwork.cfnetworkagent";
  }
  mach_service = xpc_connection_create_mach_service(v5, (dispatch_queue_t)&_dispatch_main_q, 1uLL);
  xpc_connection_t v7 = *(xpc_connection_t *)a1;
  *(void *)a1 = mach_service;
  if (v7)
  {
    (*(void (**)(xpc_connection_t))(a1 + 8))(v7);
    mach_service = *(_xpc_connection_s **)a1;
  }
  *(void *)(a1 + 8) = &_xpc_release;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004520;
  v8[3] = &unk_100014978;
  v8[4] = a1;
  xpc_connection_set_event_handler(mach_service, v8);
  xpc_connection_resume(*(xpc_connection_t *)a1);
}

void sub_100004520(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  sub_1000046E8(*(NSObject **)(v3 + 16));
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8) = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Received XPC XPC_TYPE_CONNECTION", (uint8_t *)&v8, 2u);
    }
    xpc_connection_set_target_queue((xpc_connection_t)a2, (dispatch_queue_t)&_dispatch_main_q);
    *(void *)&long long v8 = _NSConcreteStackBlock;
    *((void *)&v8 + 1) = 3221225472;
    v9 = sub_100004778;
    v10 = &unk_1000149A0;
    v11 = a2;
    uint64_t v12 = v3;
    xpc_connection_set_event_handler((xpc_connection_t)a2, &v8);
    xpc_connection_resume((xpc_connection_t)a2);
  }
  else
  {
    xpc_type_t v5 = type;
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v5 == (xpc_type_t)&_xpc_type_error)
    {
      if (v6)
      {
        LODWORD(v8) = 138412290;
        *(void *)((char *)&v8 + 4) = a2;
        xpc_connection_t v7 = "Received XPC error %@";
        goto LABEL_11;
      }
    }
    else if (v6)
    {
      LODWORD(v8) = 138412290;
      *(void *)((char *)&v8 + 4) = v5;
      xpc_connection_t v7 = "Received XPC type %@";
LABEL_11:
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)&v8, 0xCu);
    }
  }
}

void sub_1000046E8(NSObject *a1)
{
  uint64_t v2 = getenv("CFNETWORKAGENT_TIMEOUT");
  if (v2) {
    double v3 = (double)strtol(v2, 0, 10) * 1000000000.0;
  }
  else {
    double v3 = 1.2e11;
  }
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)v3);

  dispatch_source_set_timer(a1, v4, (unint64_t)v3, 0x3B9ACA00uLL);
}

void sub_100004778(uint64_t a1, xpc_object_t object)
{
  uint64_t v4 = *(void *)(a1 + 40);
  xpc_type_t type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = object;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Received xpc connection error %@", buf, 0xCu);
    }
  }
  else if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    int64_t int64 = xpc_dictionary_get_int64(object, "type");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(int64 - 1) > 4) {
        xpc_connection_t v7 = "Unknown";
      }
      else {
        xpc_connection_t v7 = off_100014F88[int64 - 1];
      }
      *(_DWORD *)buf = 134218242;
      *(void *)&buf[4] = int64;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Handling incoming message type %lld %s", buf, 0x16u);
    }
    if ((unint64_t)(int64 - 1) < 2)
    {
      string = (char *)xpc_dictionary_get_string(object, "sig");
      if (string)
      {
        sub_100009438(length, string);
        v9 = *(NSObject **)(v4 + 112);
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3321888768;
        *(void *)&buf[16] = sub_10000CBEC;
        ptr_8 = &unk_100014F20;
        uint64_t v16 = v4 + 32;
        int64_t v17 = int64;
        if (SHIBYTE(v13) < 0)
        {
          sub_100009298(&__p, (void *)length[0], length[1]);
        }
        else
        {
          long long __p = *(_OWORD *)length;
          uint64_t v19 = v13;
        }
        v20 = string;
        dispatch_async(v9, buf);
        if (SHIBYTE(v19) < 0) {
          operator delete((void *)__p);
        }
        if (SHIBYTE(v13) < 0) {
          operator delete((void *)length[0]);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = int64;
        v10 = "Received legacy query with no signature (type=%d)";
        uint32_t v11 = 8;
        goto LABEL_23;
      }
    }
    else
    {
      if (int64 == 5)
      {
        sub_10000E208((SCDynamicStoreRef *)(v4 + 32));
        return;
      }
      if (int64 == 3)
      {
        xpc_retain(*(xpc_object_t *)(a1 + 32));
        operator new();
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v10 = "Unknown message type";
        uint32_t v11 = 2;
LABEL_23:
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v10, buf, v11);
      }
    }
  }
}

void sub_100005AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, std::mutex *a14, std::__shared_weak_count *a15, std::__shared_weak_count *a16, uint64_t a17, std::__shared_weak_count *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,std::__shared_weak_count *a28,uint64_t a29,std::__shared_weak_count *a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  std::mutex::unlock(v36);
  if (a36 < 0) {
    operator delete(__p);
  }
  std::mutex::unlock(a14);
  if (a12) {
    sub_100005F20(a12);
  }
  sub_100005F20(a18);
  sub_100005F20(a18);
  sub_100005F20(a18);
  if (a30) {
    sub_100005F20(a30);
  }
  if (a28) {
    sub_100005F20(a28);
  }
  sub_100005F20(a15);
  sub_100005F20(a16);
  _Unwind_Resume(a1);
}

void sub_100005D4C()
{
}

void sub_100005D54(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *a4;
    uint64_t v11 = *a5;
    *(_DWORD *)buf = 138544130;
    uint64_t v25 = a2;
    __int16 v26 = 2048;
    uint64_t v27 = a3;
    __int16 v28 = 2112;
    uint64_t v29 = v10;
    __int16 v30 = 2112;
    uint64_t v31 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PAC query complete for id %{public}@, token %p,  list=%@, error=%@", buf, 0x2Au);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3321888768;
  v16[2] = sub_100006570;
  v16[3] = &unk_1000149C0;
  uint64_t v12 = (std::__shared_weak_count *)a1[5];
  v16[4] = a1[4];
  int64_t v17 = v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v13 = (std::__shared_weak_count *)a4[1];
  uint64_t v18 = *a4;
  uint64_t v19 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v14 = (std::__shared_weak_count *)a5[1];
  uint64_t v20 = *a5;
  v21 = v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  dispatch_queue_t v15 = (std::__shared_weak_count *)a1[7];
  uint64_t v22 = a1[6];
  v23 = v15;
  if (v15) {
    atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);
  if (v23) {
    sub_100005F20(v23);
  }
  if (v21) {
    sub_100005F20(v21);
  }
  if (v19) {
    sub_100005F20(v19);
  }
  if (v17) {
    sub_100005F20(v17);
  }
}

void sub_100005F20(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_100005F94()
{
}

void sub_10000605C()
{
}

void sub_100006080(void *a1, const char *a2, const void **a3)
{
  string = xpc_dictionary_get_string(a1, a2);
  if (string)
  {
    xpc_type_t v5 = (const UInt8 *)string;
    CFIndex v6 = strlen(string);
    CFStringRef v7 = CFStringCreateWithBytes(0, v5, v6, 0x8000100u, 0);
    long long v8 = *a3;
    *a3 = v7;
    if (v8)
    {
      CFRelease(v8);
    }
  }
}

void sub_100006100(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  double v3 = *(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t *, uint64_t *))(v1 + 8);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2) {
    BOOL v4 = (*(void *)(v1 + 16) & 1 | (unint64_t)v3) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = v4;
  if (v3 == sub_100006250 && v5 != 0)
  {
    CFStringRef v7 = (uint64_t *)(v1 + (v2 >> 1));
    if (v2) {
      long long v8 = *(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t *, uint64_t *))(*v7 + sub_100006250);
    }
    else {
      long long v8 = sub_100006250;
    }
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    v8(v7, 0, 0, &v11, &v9);
    if (v10) {
      sub_100005F20(v10);
    }
    if (v12) {
      sub_100005F20(v12);
    }
  }
  _Block_release(*(const void **)v1);
  operator delete();
}

void sub_1000061F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a10) {
    sub_100005F20(a10);
  }
  if (a12) {
    sub_100005F20(a12);
  }
  _Unwind_Resume(exception_object);
}

void sub_100006214(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

void sub_100006250(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  a1[1] = (uint64_t)sub_10000630C;
  a1[2] = 0;
  uint64_t v5 = *a1;
  CFIndex v6 = (std::__shared_weak_count *)a4[1];
  uint64_t v10 = *a4;
  uint64_t v11 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CFStringRef v7 = (std::__shared_weak_count *)a5[1];
  uint64_t v8 = *a5;
  uint64_t v9 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t *))(v5 + 16))(v5, a2, a3, &v10, &v8);
  if (v9) {
    sub_100005F20(v9);
  }
  if (v11) {
    sub_100005F20(v11);
  }
}

void sub_1000062E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a10) {
    sub_100005F20(a10);
  }
  if (a12) {
    sub_100005F20(a12);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000630C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v5 = *a1;
  CFIndex v6 = (std::__shared_weak_count *)a4[1];
  uint64_t v10 = *a4;
  uint64_t v11 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CFStringRef v7 = (std::__shared_weak_count *)a5[1];
  uint64_t v8 = *a5;
  uint64_t v9 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t *))(v5 + 16))(v5, a2, a3, &v10, &v8);
  if (v9) {
    sub_100005F20(v9);
  }
  if (v11) {
    sub_100005F20(v11);
  }
}

void sub_100006390(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a10) {
    sub_100005F20(a10);
  }
  if (a12) {
    sub_100005F20(a12);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000063B8(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[13];
  if (v2) {
    sub_100005F20(v2);
  }
  double v3 = (std::__shared_weak_count *)a1[11];
  if (v3) {
    sub_100005F20(v3);
  }
  BOOL v4 = (const void *)a1[9];
  a1[9] = 0;
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = (const void *)a1[8];
  a1[8] = 0;
  if (v5) {
    CFRelease(v5);
  }
  CFIndex v6 = (const void *)a1[7];
  a1[7] = 0;
  if (v6) {
    CFRelease(v6);
  }
  CFStringRef v7 = (const void *)a1[6];
  a1[6] = 0;
  if (v7) {
    CFRelease(v7);
  }
  uint64_t v8 = (const void *)a1[5];
  a1[5] = 0;
  if (v8) {
    CFRelease(v8);
  }
  uint64_t v9 = (const void *)a1[4];
  a1[4] = 0;
  if (v9) {
    CFRelease(v9);
  }
  uint64_t v10 = (const void *)a1[3];
  a1[3] = 0;
  if (v10)
  {
    CFRelease(v10);
  }
}

void sub_100006478(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_100014AA0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

void sub_1000064CC(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_100014AA0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1000064EC(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 56);
  if (v2) {
    sub_100005F20(v2);
  }
  double v3 = *(std::__shared_weak_count **)(a1 + 40);
  if (v3)
  {
    sub_100005F20(v3);
  }
}

void *sub_10000653C(void *result, void *a2)
{
  uint64_t v2 = a2[5];
  result[4] = a2[4];
  result[5] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[7];
  result[6] = a2[6];
  result[7] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_100006570(uint64_t a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  xpc_dictionary_set_int64(reply, "type", 4);
  uint64_t v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    CFErrorRef error = 0;
    CFDataRef v4 = CFPropertyListCreateData(0, v3, kCFPropertyListBinaryFormat_v1_0, 0, &error);
    CFDataRef v5 = v4;
    if (v4)
    {
      BytePtr = CFDataGetBytePtr(v4);
      CFIndex Length = CFDataGetLength(v5);
      xpc_dictionary_set_data(reply, "list", BytePtr, Length);
      CFRelease(v5);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        LODWORD(allocator) = 138412290;
        *(void *)((char *)&allocator + 4) = error;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "PAC failed to convert data %@", (uint8_t *)&allocator, 0xCu);
      }
      CFRelease(error);
    }
  }
  else
  {
    uint64_t v8 = *(__CFError **)(a1 + 64);
    if (v8)
    {
      int64_t Code = CFErrorGetCode(v8);
      xpc_dictionary_set_int64(reply, "errCode", Code);
      CFStringRef Domain = CFErrorGetDomain(*(CFErrorRef *)(a1 + 64));
      *(void *)&long long allocator = 0;
      *((void *)&allocator + 1) = 1023;
      if (Domain)
      {
        uint64_t v11 = sub_100009CE4(0, Domain, v15, (uint64_t *)&allocator + 1);
      }
      else
      {
        v15[0] = 0;
        *((void *)&allocator + 1) = 0;
        uint64_t v11 = v15;
      }
      ptr = v11;
      xpc_dictionary_set_string(reply, "errDomain", (const char *)v11);
      if (ptr)
      {
        if (v15 != ptr) {
          CFAllocatorDeallocate((CFAllocatorRef)allocator, ptr);
        }
      }
    }
  }
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 80), reply);
  if (reply) {
    xpc_release(reply);
  }
}

void sub_100006758(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CFAllocatorRef allocator, uint64_t a12, void *ptr)
{
  if (ptr && v14 != ptr) {
    CFAllocatorDeallocate(allocator, ptr);
  }
  if (v13) {
    xpc_release(v13);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000067A8(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[11];
  if (v2) {
    sub_100005F20(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)a1[9];
  if (v3) {
    sub_100005F20(v3);
  }
  CFDataRef v4 = (std::__shared_weak_count *)a1[7];
  if (v4) {
    sub_100005F20(v4);
  }
  CFDataRef v5 = (std::__shared_weak_count *)a1[5];
  if (v5)
  {
    sub_100005F20(v5);
  }
}

void *sub_100006810(void *result, void *a2)
{
  uint64_t v2 = a2[5];
  result[4] = a2[4];
  result[5] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[7];
  result[6] = a2[6];
  result[7] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = a2[9];
  result[8] = a2[8];
  result[9] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = a2[11];
  result[10] = a2[10];
  result[11] = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_100006878(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  if (v1) {
    xpc_release(v1);
  }
}

void sub_100006888(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

void sub_1000068C8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  if (v1) {
    xpc_release(v1);
  }
}

void sub_1000068D8(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

void sub_100006914(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Inactivity timer fired", buf, 2u);
  }
  uint64_t v2 = (SCDynamicStoreRef *)(v1 + 32);
  uint64_t v3 = (const char *)(v1 + 64);
  if (*(char *)(v1 + 87) < 0) {
    uint64_t v3 = *(const char **)v3;
  }
  CFStringRef v4 = CFStringCreateWithCString(0, v3, 0x8000100u);
  CFArrayRef v5 = (const __CFArray *)SCDynamicStoreCopyValue(*v2, v4);
  CFArrayRef v6 = v5;
  if (v5 && CFArrayGetCount(v5) == 1)
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, 0);
    if (ValueAtIndex)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      double DoubleValue = CFStringGetDoubleValue(ValueAtIndex);
      uint64_t v10 = getenv("CFNETWORKAGENT_TTL");
      if (v10) {
        double v11 = (double)strtol(v10, 0, 10);
      }
      else {
        double v11 = 86400.0;
      }
      LODWORD(ValueAtIndex) = Current - DoubleValue > v11;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v14 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Purge k-v pair not found in dynamic store, creating and adding one.", v14, 2u);
    }
    sub_10000E02C((uint64_t)v2);
    LODWORD(ValueAtIndex) = 0;
    if (!v6)
    {
      if (v4) {
        goto LABEL_15;
      }
      goto LABEL_10;
    }
  }
  CFRelease(v6);
  if (v4)
  {
LABEL_15:
    CFRelease(v4);
    if (!ValueAtIndex) {
      goto LABEL_19;
    }
LABEL_16:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Dynamic store is stale, purging", v12, 2u);
    }
    sub_10000E208(v2);
LABEL_19:
    exit(0);
  }
LABEL_10:
  if (!ValueAtIndex) {
    goto LABEL_19;
  }
  goto LABEL_16;
}

void sub_100006AF4(_Unwind_Exception *a1)
{
  CFRelease(v2);
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(a1);
}

void sub_100006B24()
{
  if (!v0) {
    JUMPOUT(0x100006B1CLL);
  }
  JUMPOUT(0x100006B14);
}

void sub_100006B30(NSObject *a1)
{
  if (a1)
  {
    dispatch_source_cancel(a1);
    dispatch_release(a1);
  }
}

void sub_100006B70(int a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2[0] = 67109120;
    v2[1] = a1;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CFNetworkAgent received signal=%d, shutting down.", (uint8_t *)v2, 8u);
  }
  exit(a1);
}

uint64_t sub_100006BF0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 24));
}

void sub_100006BF8(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

void sub_100006C34(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  sub_100006D4C(&v15, *(void *)a1, *(std::__shared_weak_count **)(a1 + 8));
  if (v15)
  {
    CFArrayRef v6 = *(NSObject **)(a1 + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3321888768;
    block[2] = sub_100006D90;
    block[3] = &unk_100014B18;
    block[4] = a1;
    block[5] = v15;
    uint64_t v10 = v16;
    if (v16) {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CFStringRef v7 = (std::__shared_weak_count *)a2[1];
    uint64_t v11 = *a2;
    uint64_t v12 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v8 = (std::__shared_weak_count *)a3[1];
    uint64_t v13 = *a3;
    v14 = v8;
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    dispatch_async(v6, block);
    if (v14) {
      sub_100005F20(v14);
    }
    if (v12) {
      sub_100005F20(v12);
    }
    if (v10) {
      sub_100005F20(v10);
    }
  }
  if (v16) {
    sub_100005F20(v16);
  }
}

void *sub_100006D4C(void *a1, uint64_t a2, std::__shared_weak_count *this)
{
  *a1 = a2;
  if (this)
  {
    CFStringRef v4 = std::__shared_weak_count::lock(this);
    a1[1] = v4;
    if (v4) {
      return a1;
    }
  }
  else
  {
    a1[1] = 0;
  }
  uint64_t v6 = sub_100008B2C();
  return (void *)sub_100006D90(v6);
}

void sub_100006D90(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(void *)(a1[5] + 40))
  {
    uint64_t v3 = *(__CFError **)(v2 + 40);
    if (CFErrorGetCode(v3) == 309)
    {
      CFStringRef Domain = CFErrorGetDomain(v3);
      if (CFEqual(Domain, kCFErrorDomainCFNetwork) && !*(unsigned char *)(v2 + 152))
      {
        uint64_t v31 = a1[7];
        if (*(void *)(v31 + 16))
        {
          if (*(void *)(v31 + 24))
          {
            uint64_t v32 = a1[5];
            v33 = *(std::__shared_weak_count **)(v32 + 48);
            *(void *)(v32 + 40) = 0;
            *(void *)(v32 + 48) = 0;
            if (v33) {
              sub_100005F20(v33);
            }
          }
        }
      }
    }
  }
  uint64_t v5 = a1[7];
  if (*(unsigned char *)(v5 + 88))
  {
    if (*(void *)v5)
    {
      CFStringRef v6 = CFURLCopyScheme(*(CFURLRef *)v5);
      if (v6)
      {
        CFStringRef v7 = v6;
        if (CFStringCompare(v6, @"ftp", 1uLL) == kCFCompareEqualTo
          || CFStringCompare(v7, @"file", 1uLL) == kCFCompareEqualTo)
        {
          if (qword_1000188C8 != -1) {
            dispatch_once(&qword_1000188C8, &stru_100014AC8);
          }
          CFErrorCreate(kCFAllocatorDefault, kCFErrorDomainCFNetwork, -1002, 0);
          operator new();
        }
        CFRelease(v7);
      }
    }
  }
  if (*(void *)(a1[5] + 40))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      CFErrorDomain v34 = CFErrorGetDomain(*(CFErrorRef *)(v2 + 40));
      CFIndex Code = CFErrorGetCode(*(CFErrorRef *)(v2 + 40));
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v34;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = Code;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "PAC Fetch failed with cached error [%@:%ld]", buf, 0x16u);
    }
    uint64_t v8 = (void *)a1[7];
    uint64_t v9 = v8[9];
    uint64_t v10 = (std::__shared_weak_count *)v8[10];
    if (v10)
    {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v8 = (void *)a1[7];
    }
    uint64_t v12 = v8[4];
    uint64_t v11 = v8[5];
    uint64_t v13 = *(std::__shared_weak_count **)(v2 + 48);
    v44[0] = *(void *)(v2 + 40);
    v44[1] = (uint64_t)v13;
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    sub_100007664(v9, v11, v12, 0, 0, v44);
    if (v13) {
      sub_100005F20(v13);
    }
    if (v10) {
      sub_100005F20(v10);
    }
  }
  else
  {
    if (*(void *)(v2 + 32))
    {
      uint64_t v14 = a1[8];
      if (v14)
      {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v14 + 8), 1uLL, memory_order_relaxed);
        uint64_t v15 = a1[8];
      }
      else
      {
        uint64_t v15 = 0;
      }
      if (v15) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
      }
      sub_100005F94();
    }
    int64_t v17 = *(char **)(v2 + 64);
    unint64_t v16 = *(void *)(v2 + 72);
    if ((unint64_t)v17 >= v16)
    {
      uint64_t v20 = *(char **)(v2 + 56);
      uint64_t v21 = (v17 - v20) >> 4;
      unint64_t v22 = v21 + 1;
      if ((unint64_t)(v21 + 1) >> 60) {
        abort();
      }
      uint64_t v23 = v16 - (void)v20;
      if (v23 >> 3 > v22) {
        unint64_t v22 = v23 >> 3;
      }
      if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v24 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v24 = v22;
      }
      if (v24 >> 60) {
        sub_100008A40();
      }
      uint64_t v25 = (char *)operator new(16 * v24);
      __int16 v26 = &v25[16 * v21];
      long long v27 = *(_OWORD *)(a1 + 7);
      *(_OWORD *)__int16 v26 = v27;
      if (*((void *)&v27 + 1))
      {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v27 + 1) + 8), 1uLL, memory_order_relaxed);
        uint64_t v20 = *(char **)(v2 + 56);
        int64_t v17 = *(char **)(v2 + 64);
      }
      if (v17 == v20)
      {
        int64x2_t v30 = vdupq_n_s64((unint64_t)v17);
        __int16 v28 = &v25[16 * v21];
      }
      else
      {
        __int16 v28 = &v25[16 * v21];
        do
        {
          long long v29 = *((_OWORD *)v17 - 1);
          v17 -= 16;
          *((_OWORD *)v28 - 1) = v29;
          v28 -= 16;
          *(void *)int64_t v17 = 0;
          *((void *)v17 + 1) = 0;
        }
        while (v17 != v20);
        int64x2_t v30 = *(int64x2_t *)(v2 + 56);
      }
      uint64_t v19 = v26 + 16;
      *(void *)(v2 + 56) = v28;
      *(void *)(v2 + 64) = v26 + 16;
      *(void *)(v2 + 72) = &v25[16 * v24];
      v37 = (char *)v30.i64[1];
      v36 = (char *)v30.i64[0];
      while (v37 != v36)
      {
        v38 = (std::__shared_weak_count *)*((void *)v37 - 1);
        if (v38) {
          sub_100005F20(v38);
        }
        v37 -= 16;
      }
      if (v36) {
        operator delete(v36);
      }
    }
    else
    {
      *(void *)int64_t v17 = a1[7];
      uint64_t v18 = a1[8];
      *((void *)v17 + 1) = v18;
      if (v18) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v18 + 8), 1uLL, memory_order_relaxed);
      }
      uint64_t v19 = v17 + 16;
    }
    *(void *)(v2 + 64) = v19;
    if ((void *)((char *)v19 - *(void *)(v2 + 56)) == (void *)16)
    {
      uint64_t v40 = a1[7];
      v39 = (std::__shared_weak_count *)a1[8];
      if (v39) {
        atomic_fetch_add_explicit(&v39->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v41 = (std::__shared_weak_count *)a1[10];
      if (v41) {
        atomic_fetch_add_explicit(&v41->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (!*(unsigned char *)(v40 + 88) && *(void *)v40)
      {
        *(void *)buf = v40;
        *(void *)&buf[8] = v39;
        if (v39) {
          atomic_fetch_add_explicit(&v39->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        sub_100007888();
      }
      if (v39) {
        atomic_fetch_add_explicit(&v39->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (v41) {
        atomic_fetch_add_explicit(&v41->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      sub_100006D4C(&v45, *(void *)v2, *(std::__shared_weak_count **)(v2 + 8));
      uint64_t v42 = v45;
      if (v45)
      {
        v44[4] = v40;
        v44[5] = (uint64_t)v39;
        if (v39)
        {
          atomic_fetch_add_explicit(&v39->__shared_owners_, 1uLL, memory_order_relaxed);
          v43 = v39;
        }
        else
        {
          v43 = 0;
        }
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3321888768;
        *(void *)&uint8_t buf[16] = sub_100008004;
        v48 = &unk_100014B68;
        uint64_t v49 = v2;
        uint64_t v50 = v40;
        v51 = v43;
        if (v43) {
          atomic_fetch_add_explicit(&v43->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v52 = v42;
        v53 = v46;
        if (v46) {
          atomic_fetch_add_explicit(&v46->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        operator new();
      }
      if (v46) {
        sub_100005F20(v46);
      }
      if (v41) {
        sub_100005F20(v41);
      }
      if (v39) {
        sub_100005F20(v39);
      }
      if (v41) {
        sub_100005F20(v41);
      }
      if (v39)
      {
        sub_100005F20(v39);
      }
    }
  }
}

void sub_1000074B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  if (v36) {
    sub_100005F20(v36);
  }
  if (v35) {
    sub_100005F20(v35);
  }
  if (v36) {
    sub_100005F20(v36);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000075BC(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[10];
  if (v2) {
    sub_100005F20(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)a1[8];
  if (v3) {
    sub_100005F20(v3);
  }
  CFStringRef v4 = (std::__shared_weak_count *)a1[6];
  if (v4)
  {
    sub_100005F20(v4);
  }
}

void *sub_100007618(void *result, void *a2)
{
  uint64_t v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[8];
  result[7] = a2[7];
  result[8] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = a2[10];
  result[9] = a2[9];
  result[10] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_100007664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, std::__shared_weak_count *a5, uint64_t *a6)
{
  if (a1)
  {
    if (a5) {
      atomic_fetch_add_explicit(&a5->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v7 = *a6;
    uint64_t v8 = (std::__shared_weak_count *)a6[1];
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v9 = *(void (**)(void *, uint64_t, uint64_t, uint64_t *, uint64_t *))(a1 + 8);
    uint64_t v10 = *(void *)(a1 + 16);
    uint64_t v11 = (void *)(a1 + (v10 >> 1));
    if (v10) {
      uint64_t v9 = *(void (**)(void *, uint64_t, uint64_t, uint64_t *, uint64_t *))(*v11 + v9);
    }
    uint64_t v14 = a4;
    uint64_t v15 = a5;
    if (a5) {
      atomic_fetch_add_explicit(&a5->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v12 = v7;
    uint64_t v13 = v8;
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v9(v11, a2, a3, &v14, &v12);
    if (v13) {
      sub_100005F20(v13);
    }
    if (v15) {
      sub_100005F20(v15);
    }
    if (v8) {
      sub_100005F20(v8);
    }
    if (a5) {
      sub_100005F20(a5);
    }
  }
}

void sub_100007740(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a10) {
    sub_100005F20(a10);
  }
  if (a12)
  {
    sub_100005F20(a12);
    if (!v13)
    {
LABEL_5:
      if (!v12) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if (!v13)
  {
    goto LABEL_5;
  }
  sub_100005F20(v13);
  if (!v12) {
LABEL_7:
  }
    _Unwind_Resume(exception_object);
LABEL_6:
  sub_100005F20(v12);
  goto LABEL_7;
}

void sub_100007788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 72);
  uint64_t v8 = *(std::__shared_weak_count **)(v6 + 80);
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v9 = *a4;
  uint64_t v10 = (std::__shared_weak_count *)a4[1];
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v11 = (std::__shared_weak_count *)a5[1];
  v12[0] = *a5;
  v12[1] = (uint64_t)v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_100007664(v7, a2, a3, v9, v10, v12);
  if (v11) {
    sub_100005F20(v11);
  }
  if (v10) {
    sub_100005F20(v10);
  }
  if (v8)
  {
    sub_100005F20(v8);
  }
}

void sub_10000784C(_Unwind_Exception *exception_object)
{
  if (v3)
  {
    sub_100005F20(v3);
    if (!v2)
    {
LABEL_3:
      if (!v1) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if (!v2)
  {
    goto LABEL_3;
  }
  sub_100005F20(v2);
  if (!v1) {
LABEL_5:
  }
    _Unwind_Resume(exception_object);
LABEL_4:
  sub_100005F20(v1);
  goto LABEL_5;
}

void sub_100007888()
{
}

void sub_100007F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18)
{
  sub_100005F20(v19);
  sub_100005F20(v19);
  if (a18) {
    sub_100005F20(a18);
  }
  if (v18) {
    sub_100005F20(v18);
  }
  _Unwind_Resume(a1);
}

void sub_100008004(void *a1, double a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = a1[4];
  std::mutex::lock((std::mutex *)(v7 + 80));
  *(double *)(a1[7] + 144) = a2;
  std::mutex::unlock((std::mutex *)(v7 + 80));
  if (!*(void *)a4)
  {
    uint64_t v13 = a1[6];
    if (v13) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v13 + 8), 1uLL, memory_order_relaxed);
    }
    sub_100007888();
  }
  CFStringRef Domain = CFErrorGetDomain(*(CFErrorRef *)a4);
  CFIndex Code = CFErrorGetCode(*(CFErrorRef *)a4);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    CFStringRef v18 = Domain;
    __int16 v19 = 2048;
    CFIndex v20 = Code;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "PAC Fetch failed with error [%@:%ld]", buf, 0x16u);
  }
  if (Code == 309 && CFEqual(kCFErrorDomainCFNetwork, Domain))
  {
    uint64_t v14 = a1[5];
    if (*(void *)(v14 + 16))
    {
      if (*(void *)(v14 + 24)) {
        *(unsigned char *)(v7 + 152) = 1;
      }
    }
  }
  CFErrorRef v10 = *(CFErrorRef *)a4;
  uint64_t v11 = *(std::__shared_weak_count **)(a4 + 8);
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v12 = *(std::__shared_weak_count **)(v7 + 48);
  *(void *)(v7 + 40) = v10;
  *(void *)(v7 + 48) = v11;
  if (v12)
  {
    sub_100005F20(v12);
    CFErrorRef v10 = *(CFErrorRef *)(v7 + 40);
    uint64_t v11 = *(std::__shared_weak_count **)(v7 + 48);
  }
  v16[0] = 0;
  v16[1] = 0;
  v15[0] = (uint64_t)v10;
  v15[1] = (uint64_t)v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_100008588((void *)v7, v16, v15);
  if (v11) {
    sub_100005F20(v11);
  }
}

void sub_10000822C(_Unwind_Exception *exception_object)
{
}

void sub_100008254(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  uint64_t v3 = *(void (**)(uint64_t *, uint64_t *, uint64_t *))(v1 + 8);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2) {
    BOOL v4 = (*(void *)(v1 + 16) & 1 | (unint64_t)v3) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = v4;
  if (v3 == sub_1000083A0 && v5 != 0)
  {
    uint64_t v7 = (void *)(v1 + (v2 >> 1));
    if (v2) {
      uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t *))(*v7 + sub_1000083A0);
    }
    else {
      uint64_t v8 = sub_1000083A0;
    }
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v9 = 0;
    CFErrorRef v10 = 0;
    ((void (*)(void *, uint64_t *, uint64_t *, double))v8)(v7, &v11, &v9, 0.0);
    if (v10) {
      sub_100005F20(v10);
    }
    if (v12) {
      sub_100005F20(v12);
    }
  }
  _Block_release(*(const void **)v1);
  operator delete();
}

void sub_100008340(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a10) {
    sub_100005F20(a10);
  }
  if (a12) {
    sub_100005F20(a12);
  }
  _Unwind_Resume(exception_object);
}

void sub_100008364(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

void sub_1000083A0(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  a1[1] = (uint64_t)sub_10000845C;
  a1[2] = 0;
  uint64_t v3 = *a1;
  BOOL v4 = (std::__shared_weak_count *)a2[1];
  uint64_t v8 = *a2;
  uint64_t v9 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v5 = (std::__shared_weak_count *)a3[1];
  uint64_t v6 = *a3;
  uint64_t v7 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t, uint64_t *, uint64_t *))(v3 + 16))(v3, &v8, &v6);
  if (v7) {
    sub_100005F20(v7);
  }
  if (v9) {
    sub_100005F20(v9);
  }
}

void sub_100008438(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a10) {
    sub_100005F20(a10);
  }
  if (a12) {
    sub_100005F20(a12);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000845C(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a1;
  BOOL v4 = (std::__shared_weak_count *)a2[1];
  uint64_t v8 = *a2;
  uint64_t v9 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v5 = (std::__shared_weak_count *)a3[1];
  uint64_t v6 = *a3;
  uint64_t v7 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t, uint64_t *, uint64_t *))(v3 + 16))(v3, &v8, &v6);
  if (v7) {
    sub_100005F20(v7);
  }
  if (v9) {
    sub_100005F20(v9);
  }
}

void sub_1000084E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a10) {
    sub_100005F20(a10);
  }
  if (a12) {
    sub_100005F20(a12);
  }
  _Unwind_Resume(exception_object);
}

void sub_100008504(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (v2) {
    sub_100005F20(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
  {
    sub_100005F20(v3);
  }
}

void *sub_100008554(void *result, void *a2)
{
  uint64_t v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[8];
  result[7] = a2[7];
  result[8] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_100008588(void *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = (void *)a1[7];
  unint64_t v22 = a1 + 7;
  BOOL v4 = (void *)a1[8];
  if (v3 != v4)
  {
    char v8 = 1;
    do
    {
      if (v8)
      {
        uint64_t v9 = *v3;
        uint64_t v10 = *(void *)(*v3 + 72);
        uint64_t v11 = *(std::__shared_weak_count **)(*v3 + 80);
        if (v11)
        {
          atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
          uint64_t v9 = *v3;
        }
        uint64_t v13 = *(void *)(v9 + 32);
        uint64_t v12 = *(void *)(v9 + 40);
        uint64_t v14 = *a2;
        uint64_t v15 = (std::__shared_weak_count *)a2[1];
        if (v15) {
          atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        unint64_t v16 = (std::__shared_weak_count *)a3[1];
        v24[0] = *a3;
        v24[1] = (uint64_t)v16;
        if (v16) {
          atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        sub_100007664(v10, v12, v13, v14, v15, v24);
        if (v16) {
          sub_100005F20(v16);
        }
      }
      else
      {
        int64_t v17 = (void *)*v3;
        if (a1[4])
        {
          uint64_t v18 = v3[1];
          v23[9] = *v3;
          v23[10] = v18;
          if (v18) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v18 + 8), 1uLL, memory_order_relaxed);
          }
          v23[2] = (uint64_t)_NSConcreteStackBlock;
          v23[3] = 3221225472;
          v23[4] = (uint64_t)sub_1000087FC;
          v23[5] = (uint64_t)&unk_100014B48;
          v23[6] = (uint64_t)v3;
          sub_100005F94();
        }
        uint64_t v19 = v17[9];
        uint64_t v11 = (std::__shared_weak_count *)v17[10];
        if (v11)
        {
          atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
          int64_t v17 = (void *)*v3;
        }
        uint64_t v21 = v17[4];
        uint64_t v20 = v17[5];
        uint64_t v15 = (std::__shared_weak_count *)a3[1];
        v23[0] = *a3;
        v23[1] = (uint64_t)v15;
        if (v15) {
          atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        sub_100007664(v19, v20, v21, 0, 0, v23);
      }
      if (v15) {
        sub_100005F20(v15);
      }
      if (v11) {
        sub_100005F20(v11);
      }
      char v8 = 0;
      v3 += 2;
    }
    while (v3 != v4);
  }
  sub_1000087B0(v22);
}

void sub_100008760(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  if (v19) {
    sub_100005F20(v19);
  }
  if (v18) {
    sub_100005F20(v18);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000087B0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 16)
  {
    BOOL v4 = *(std::__shared_weak_count **)(i - 8);
    if (v4) {
      sub_100005F20(v4);
    }
  }
  a1[1] = v2;
}

void sub_1000087FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v6 = **(void **)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 72);
  char v8 = *(std::__shared_weak_count **)(v6 + 80);
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v9 = *a4;
  uint64_t v10 = (std::__shared_weak_count *)a4[1];
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v11 = (std::__shared_weak_count *)a5[1];
  v12[0] = *a5;
  v12[1] = (uint64_t)v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_100007664(v7, a2, a3, v9, v10, v12);
  if (v11) {
    sub_100005F20(v11);
  }
  if (v10) {
    sub_100005F20(v10);
  }
  if (v8)
  {
    sub_100005F20(v8);
  }
}

void sub_1000088C4(_Unwind_Exception *exception_object)
{
  if (v3)
  {
    sub_100005F20(v3);
    if (!v2)
    {
LABEL_3:
      if (!v1) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if (!v2)
  {
    goto LABEL_3;
  }
  sub_100005F20(v2);
  if (!v1) {
LABEL_5:
  }
    _Unwind_Resume(exception_object);
LABEL_4:
  sub_100005F20(v1);
  goto LABEL_5;
}

uint64_t **sub_100008900(uint64_t **result, uint64_t *a2)
{
  uint64_t v2 = *result;
  *uint64_t result = a2;
  if (v2)
  {
    uint64_t v3 = *v2;
    *uint64_t v2 = 0;
    if (v3) {
      ((void (*)(void))v2[1])();
    }
    operator delete();
  }
  return result;
}

void sub_10000896C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  int v5 = *(void **)(a1 + 32);
  uint64_t v6 = (std::__shared_weak_count *)a4[1];
  v9[0] = *a4;
  v9[1] = (uint64_t)v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v7 = (std::__shared_weak_count *)a5[1];
  v8[0] = *a5;
  v8[1] = (uint64_t)v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_100008588(v5, v9, v8);
  if (v7) {
    sub_100005F20(v7);
  }
  if (v6)
  {
    sub_100005F20(v6);
  }
}

void sub_100008A10(_Unwind_Exception *exception_object)
{
  if (v2) {
    sub_100005F20(v2);
  }
  if (v1) {
    sub_100005F20(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_100008A34(JSGlobalContextRef ctx)
{
  if (ctx) {
    JSGlobalContextRelease(ctx);
  }
}

void sub_100008A40()
{
}

void sub_100008A50(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1) {
    sub_100005F20(v1);
  }
}

uint64_t sub_100008A60(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + 32) = *(void *)(a2 + 32);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_100008A80(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 24);
  if (v1) {
    CFRelease(v1);
  }
}

void sub_100008A90(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

void sub_100008ACC(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unsupported PAC URL scheme - please use HTTPS for PAC File URLs", v1, 2u);
  }
}

uint64_t sub_100008B2C()
{
  return sub_100008B44();
}

uint64_t sub_100008B44(uint64_t a1)
{
  sub_100008B80(*(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_100008B80(void *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    do
    {
      uint64_t v2 = (void *)*v1;
      sub_100008BC4((uint64_t)(v1 + 2));
      operator delete(v1);
      uint64_t v1 = v2;
    }
    while (v2);
  }
}

void sub_100008BC4(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (v2) {
    sub_100005F20(v2);
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v3 = *(void **)a1;
    operator delete(v3);
  }
}

uint64_t sub_100008C1C(uint64_t a1)
{
  notify_cancel(*(_DWORD *)(a1 + 28));
  int v2 = *(_DWORD *)(a1 + 24);

  return notify_cancel(v2);
}

void sub_100008C58(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_100014CA8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

void sub_100008CAC(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_100014CA8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

uint64_t sub_100008CD0(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void sub_100008CF4(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_100014C70;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

void sub_100008D48(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_100014C70;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_100008D68(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      sub_100008BC4((uint64_t)v1 + 16);
    }
    operator delete(v1);
  }
}

unint64_t sub_100008DC0(uint64_t *a1, unint64_t a2)
{
  if (a2 > 0x20)
  {
    if (a2 <= 0x40)
    {
      uint64_t v5 = *(uint64_t *)((char *)a1 + a2 - 16);
      uint64_t v6 = *a1 - 0x3C5A37A36834CED9 * (v5 + a2);
      uint64_t v8 = a1[2];
      uint64_t v7 = a1[3];
      uint64_t v9 = __ROR8__(v6 + v7, 52);
      uint64_t v10 = v6 + a1[1];
      uint64_t v11 = __ROR8__(v10, 7);
      uint64_t v12 = v10 + v8;
      uint64_t v13 = *(uint64_t *)((char *)a1 + a2 - 32) + v8;
      uint64_t v14 = *(uint64_t *)((char *)a1 + a2 - 8) + v7;
      uint64_t v15 = __ROR8__(v14 + v13, 52);
      uint64_t v16 = v11 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v5 + a2), 37) + v9;
      uint64_t v17 = __ROR8__(v13, 37);
      uint64_t v18 = *(uint64_t *)((char *)a1 + a2 - 24) + v13;
      uint64_t v19 = __ROR8__(v18, 7);
      uint64_t v20 = v16 + __ROR8__(v12, 31);
      uint64_t v21 = v18 + v5;
      uint64_t v22 = v21 + v14;
      unint64_t v23 = 0x9AE16A3B2F90404FLL;
      unint64_t v24 = 0xC3A5C85C97CB3127 * (v22 + v20) - 0x651E95C4D06FBFB1 * (v12 + v7 + v17 + v19 + v15 + __ROR8__(v21, 31));
      unint64_t v25 = v20 - 0x3C5A37A36834CED9 * (v24 ^ (v24 >> 47));
      return (v25 ^ (v25 >> 47)) * v23;
    }
    unint64_t v4 = 0x9DDFEA08EB382D69;
    uint64_t v32 = *(uint64_t *)((char *)a1 + a2 - 48);
    uint64_t v33 = *(uint64_t *)((char *)a1 + a2 - 40);
    uint64_t v34 = *(uint64_t *)((char *)a1 + a2 - 24);
    uint64_t v36 = *(uint64_t *)((char *)a1 + a2 - 64);
    uint64_t v35 = *(uint64_t *)((char *)a1 + a2 - 56);
    uint64_t v37 = *(uint64_t *)((char *)a1 + a2 - 16);
    uint64_t v38 = *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v39 = v35 + v37;
    unint64_t v40 = 0x9DDFEA08EB382D69
        * (v34 ^ ((0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))));
    unint64_t v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v40 >> 47));
    unint64_t v42 = v36 + a2 + v35 + v32;
    uint64_t v43 = v42 + v33;
    unint64_t v44 = __ROR8__(v42, 44) + v36 + a2 + __ROR8__(v33 + v36 + a2 - 0x622015F714C7D297 * (v40 ^ (v40 >> 47)), 21);
    uint64_t v45 = v35 + v37 + *(uint64_t *)((char *)a1 + a2 - 32) - 0x4B6D499041670D8DLL;
    uint64_t v46 = v45 + v34 + v37;
    uint64_t v47 = __ROR8__(v46, 44);
    uint64_t v48 = v46 + v38;
    uint64_t v49 = v47 + v45 + __ROR8__(v45 + v33 + v38, 21);
    uint64_t v51 = *a1;
    uint64_t v50 = a1 + 4;
    unint64_t v52 = v51 - 0x4B6D499041670D8DLL * v33;
    uint64_t v53 = -(uint64_t)((a2 - 1) & 0xFFFFFFFFFFFFFFC0);
    do
    {
      uint64_t v54 = *(v50 - 3);
      uint64_t v55 = v52 + v43 + v39 + v54;
      uint64_t v56 = v50[2];
      uint64_t v57 = v50[3];
      uint64_t v58 = v50[1];
      unint64_t v39 = v58 + v43 - 0x4B6D499041670D8DLL * __ROR8__(v39 + v44 + v56, 42);
      uint64_t v59 = v41 + v48;
      uint64_t v60 = *(v50 - 2);
      uint64_t v61 = *(v50 - 1);
      uint64_t v62 = *(v50 - 4) - 0x4B6D499041670D8DLL * v44;
      uint64_t v63 = v62 + v48 + v61;
      uint64_t v64 = v62 + v54 + v60;
      uint64_t v43 = v64 + v61;
      uint64_t v65 = __ROR8__(v64, 44) + v62;
      unint64_t v66 = (0xB492B66FBE98F273 * __ROR8__(v55, 37)) ^ v49;
      unint64_t v52 = 0xB492B66FBE98F273 * __ROR8__(v59, 33);
      unint64_t v44 = v65 + __ROR8__(v63 + v66, 21);
      unint64_t v67 = v52 + v49 + *v50;
      uint64_t v48 = v67 + v58 + v56 + v57;
      uint64_t v49 = __ROR8__(v67 + v58 + v56, 44) + v67 + __ROR8__(v39 + v60 + v67 + v57, 21);
      v50 += 8;
      unint64_t v41 = v66;
      v53 += 64;
    }
    while (v53);
    unint64_t v68 = v52
        - 0x622015F714C7D297
        * ((0x9DDFEA08EB382D69
          * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) ^ ((0x9DDFEA08EB382D69 * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) >> 47));
    unint64_t v69 = 0x9DDFEA08EB382D69
        * (v68 ^ (v66
                - 0x4B6D499041670D8DLL * (v39 ^ (v39 >> 47))
                - 0x622015F714C7D297
                * ((0x9DDFEA08EB382D69
                  * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) ^ ((0x9DDFEA08EB382D69 * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) >> 47))));
    unint64_t v70 = 0x9DDFEA08EB382D69 * (v68 ^ (v69 >> 47) ^ v69);
    goto LABEL_13;
  }
  if (a2 > 0x10)
  {
    uint64_t v26 = a1[1];
    unint64_t v27 = 0xB492B66FBE98F273 * *a1;
    uint64_t v28 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8), 30) + __ROR8__(v27 - v26, 43);
    unint64_t v29 = v27 + a2 + __ROR8__(v26 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v23 = 0x9DDFEA08EB382D69;
    unint64_t v30 = 0x9DDFEA08EB382D69 * (v29 ^ (v28 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a1 + a2 - 16)));
    unint64_t v31 = v29 ^ (v30 >> 47) ^ v30;
LABEL_8:
    unint64_t v25 = 0x9DDFEA08EB382D69 * v31;
    return (v25 ^ (v25 >> 47)) * v23;
  }
  if (a2 < 9)
  {
    if (a2 >= 4)
    {
      uint64_t v72 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v23 = 0x9DDFEA08EB382D69;
      unint64_t v73 = 0x9DDFEA08EB382D69 * (((8 * *(_DWORD *)a1) + a2) ^ v72);
      unint64_t v31 = v72 ^ (v73 >> 47) ^ v73;
      goto LABEL_8;
    }
    unint64_t v4 = 0x9AE16A3B2F90404FLL;
    if (!a2) {
      return v4;
    }
    unint64_t v70 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                   * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
LABEL_13:
    v4 *= v70 ^ (v70 >> 47);
    return v4;
  }
  uint64_t v2 = *(uint64_t *)((char *)a1 + a2 - 8);
  uint64_t v3 = __ROR8__(v2 + a2, a2);
  return (0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69
          * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) ^ ((0x9DDFEA08EB382D69 * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) >> 47))) ^ v2;
}

BOOL sub_1000091F4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2 = a1[23];
  if ((v2 & 0x80u) == 0) {
    uint64_t v3 = a1[23];
  }
  else {
    uint64_t v3 = *((void *)a1 + 1);
  }
  uint64_t v4 = a2[23];
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *((void *)a2 + 1);
  }
  if (v3 != v4) {
    return 0;
  }
  if (v5 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v2 & 0x80) != 0) {
    return memcmp(*(const void **)a1, a2, *((void *)a1 + 1)) == 0;
  }
  if (!a1[23]) {
    return 1;
  }
  uint64_t v6 = v2 - 1;
  do
  {
    int v8 = *a1++;
    int v7 = v8;
    int v10 = *a2++;
    int v9 = v10;
    BOOL v12 = v6-- != 0;
    BOOL v13 = v7 == v9;
    BOOL v14 = v7 == v9;
  }
  while (v13 && v12);
  return v14;
}

void *sub_100009298(unsigned char *__dst, void *__src, unint64_t a3)
{
  int v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      abort();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    int v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *int v5 = v8;
    int v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

void sub_100009338(uint64_t a1)
{
  std::mutex::~mutex((std::mutex *)(a1 + 104));
  if (*(void *)(a1 + 80))
  {
    sub_1000087B0((uint64_t *)(a1 + 80));
    operator delete(*(void **)(a1 + 80));
  }
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 72);
  if (v2) {
    sub_100005F20(v2);
  }
  sub_100008900((uint64_t **)(a1 + 56), 0);
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3) {
    sub_100005F20(v3);
  }
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 32);
  if (v4)
  {
    std::__shared_weak_count::__release_weak(v4);
  }
}

void sub_1000093C4(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_100014CE0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

void sub_100009418(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_100014CE0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void *sub_100009438(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_1000094E8(id a1)
{
}

void sub_100009670()
{
  std::mutex::~mutex(v2);
  sub_100008B44(v1);
  uint64_t v3 = *(std::__shared_weak_count **)(v0 + 8);
  if (v3) {
    sub_100005F20(v3);
  }
  operator delete();
}

uint64_t sub_100009A74(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = (uint64_t)[a3 statusCode];
    }
    else {
      uint64_t v9 = -1;
    }
    int v11 = 138413314;
    uint64_t v12 = v8;
    __int16 v13 = 2048;
    uint64_t v14 = a2;
    __int16 v15 = 2048;
    uint64_t v16 = a3;
    __int16 v17 = 2048;
    uint64_t v18 = v9;
    __int16 v19 = 2048;
    uint64_t v20 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PAC fetch end for %@. data %p response %p statusCode %ld error %p", (uint8_t *)&v11, 0x34u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100009B98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 && *(unsigned char *)(a1 + 88))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = a4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HTTPS upgrade task failed, attempting fallback %@ %@", buf, 0x16u);
    }
    uint64_t v7 = *(void *)(a1 + 48);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    _OWORD v10[2] = sub_100009CD4;
    v10[3] = &unk_100014D38;
    uint64_t v8 = *(void **)(a1 + 32);
    v10[4] = *(void *)(a1 + 40);
    objc_msgSend(objc_msgSend(v8, "dataTaskWithURL:completionHandler:", v7, v10), "resume");
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  return [*(id *)(a1 + 32) finishTasksAndInvalidate];
}

uint64_t sub_100009CD4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

UInt8 *sub_100009CE4(const __CFAllocator *a1, CFStringRef theString, UInt8 *a3, uint64_t *a4)
{
  uint64_t v14 = 0;
  usedBufLen = a4;
  if (!a4)
  {
    uint64_t v14 = 0;
    usedBufLen = &v14;
  }
  CFIndex maxBufLen = 0;
  CFIndex Length = CFStringGetLength(theString);
  v15.location = 0;
  v15.length = Length;
  CFStringGetBytes(theString, v15, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
  CFIndex v10 = maxBufLen;
  if (a3 && *usedBufLen > maxBufLen) {
    goto LABEL_7;
  }
  int v11 = (UInt8 *)CFAllocatorAllocate(a1, maxBufLen + 1, 0);
  if (v11)
  {
    CFIndex v10 = maxBufLen;
    a3 = v11;
LABEL_7:
    v16.location = 0;
    v16.length = Length;
    CFStringGetBytes(theString, v16, 0x8000100u, 0, 0, a3, v10, usedBufLen);
    a3[*usedBufLen] = 0;
    return a3;
  }
  if (a4)
  {
    if (a3 && *a4 >= 1) {
      *a3 = 0;
    }
    *a4 = 0;
  }
  return a3;
}

void sub_100009E00(void *a1)
{
  *a1 = off_100014D90;
  operator delete();
}

void *sub_100009E30(void *result)
{
  *uint64_t result = off_100014D90;
  return result;
}

void sub_100009E50(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  size_t v5 = *(std::__shared_weak_count **)(a1 + 16);
  if (!v5 || (v9 = *(void *)(a1 + 8), (CFIndex v10 = std::__shared_weak_count::lock(v5)) == 0)) {
    sub_100008B2C();
  }
  int v11 = v10;
  atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  sub_100005F20(v10);
  if (v9)
  {
    uint64_t v12 = *a3;
    if (*(unsigned char *)(*a3 + 88)) {
      __int16 v13 = *(NSURL **)v12;
    }
    else {
      __int16 v13 = 0;
    }
    long long v33 = *(_OWORD *)(v12 + 16);
    long long v35 = *(_OWORD *)(v12 + 32);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3321888768;
    v36[2] = sub_10000A3B0;
    v36[3] = &unk_100014DA0;
    uint64_t v14 = (std::__shared_weak_count *)a4[1];
    v36[4] = *a4;
    uint64_t v37 = v14;
    if (v14) {
      atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v38 = v9;
    unint64_t v39 = v11;
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    CFRange v15 = (std::__shared_weak_count *)a3[1];
    uint64_t v40 = *a3;
    unint64_t v41 = v15;
    if (v15) {
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.receiver) = 138412290;
      *(id *)((char *)&buf.receiver + 4) = v13;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PAC fetch start for %@", (uint8_t *)&buf, 0xCu);
    }
    __int16 v17 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    [(NSURLSessionConfiguration *)v17 setConnectionProxyDictionary:&__NSDictionary0__struct];
    [(NSURLSessionConfiguration *)v17 set_prohibitEncryptedDNS:1];
    [(NSURLSessionConfiguration *)v17 setProtocolClasses:0];
    error[0] = 0;
    CFDataRef Data = CFPropertyListCreateData(0, &off_1000157F0, kCFPropertyListBinaryFormat_v1_0, 0, error);
    if (Data)
    {
      [(NSURLSessionConfiguration *)v17 set_atsContext:Data];
      CFRelease(Data);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.receiver) = 138412290;
        *(CFErrorRef *)((char *)&buf.receiver + 4) = error[0];
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PAC failed data conversion %@", (uint8_t *)&buf, 0xCu);
      }
      CFRelease(error[0]);
    }
    [(NSURLSessionConfiguration *)v17 setRequestCachePolicy:1];
    [(NSURLSessionConfiguration *)v17 setURLCache:0];
    [(NSURLSessionConfiguration *)v17 setHTTPCookieStorage:0];
    [(NSURLSessionConfiguration *)v17 set_alternativeServicesStorage:0];
    [(NSURLSessionConfiguration *)v17 set_sourceApplicationAuditTokenData:(void)v35];
    [(NSURLSessionConfiguration *)v17 set_sourceApplicationBundleIdentifier:*((void *)&v35 + 1)];
    id v19 = objc_alloc_init((Class)NSOperationQueue);
    [v19 setUnderlyingQueue:a2];
    uint64_t v20 = [PACURLSessionDelegate alloc];
    if (v20)
    {
      buf.receiver = v20;
      buf.super_class = (Class)PACURLSessionDelegate;
      id v21 = objc_msgSendSuper2(&buf, "init");
      unint64_t v23 = v21;
      if (v21)
      {
        objc_setProperty_atomic(v21, v22, (id)v34, 8);
        objc_setProperty_atomic(v23, v24, *((id *)&v34 + 1), 16);
      }
    }
    else
    {
      unint64_t v23 = 0;
    }
    unint64_t v25 = +[NSURLSession sessionWithConfiguration:v17 delegate:v23 delegateQueue:v19];
    error[0] = (CFErrorRef)_NSConcreteStackBlock;
    error[1] = (CFErrorRef)3221225472;
    error[2] = (CFErrorRef)sub_100009A74;
    error[3] = (CFErrorRef)&unk_100014D10;
    long long v43 = v34;
    long long v44 = v35;
    error[4] = (CFErrorRef)v36;
    error[5] = (CFErrorRef)v13;
    uint64_t v26 = [(NSURL *)v13 scheme];
    if (!v26
      || [(NSString *)v26 caseInsensitiveCompare:@"http"]
      || ([(NSURL *)v13 isEqual:+[NSURL URLWithString:@"http://wpad/wpad.dat"]] & 1) != 0)
    {
      int v27 = 0;
      uint64_t v28 = v13;
    }
    else
    {
      uint64_t v32 = +[NSURLComponents componentsWithURL:v13 resolvingAgainstBaseURL:0];
      [(NSURLComponents *)v32 setScheme:@"https"];
      uint64_t v28 = [(NSURLComponents *)v32 URL];
      int v27 = 1;
    }
    id v29 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v28];
    id v30 = v29;
    double v31 = 60.0;
    if (v27) {
      double v31 = 3.0;
    }
    [v29 setTimeoutInterval:v31];
    buf.receiver = _NSConcreteStackBlock;
    buf.super_class = (Class)3221225472;
    uint64_t v46 = sub_100009B98;
    uint64_t v47 = &unk_100014D60;
    char v53 = v27;
    long long v51 = v34;
    long long v52 = v35;
    uint64_t v48 = v25;
    uint64_t v49 = error;
    uint64_t v50 = v13;
    [(NSURLSessionDataTask *)[(NSURLSession *)v25 dataTaskWithRequest:v30 completionHandler:&buf] resume];
    if (v41) {
      sub_100005F20(v41);
    }
    if (v39) {
      sub_100005F20(v39);
    }
    if (v37) {
      sub_100005F20(v37);
    }
  }
  sub_100005F20(v11);
}

void sub_10000A370(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
}

void sub_10000A3B0(void *a1, const __CFData *a2, uint64_t a3, const void *a4)
{
  if (a4)
  {
    CFAbsoluteTimeGetCurrent();
    CFRetain(a4);
    operator new();
  }
  uint64_t v6 = a1[8];
  if (*(unsigned char *)(v6 + 88)) {
    CFIndex v7 = *(void *)v6;
  }
  else {
    CFIndex v7 = 0;
  }
  uint64_t v9 = a1[4];
  uint64_t v8 = (std::__shared_weak_count *)a1[5];
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  HTTPResponse = (__CFHTTPMessage *)CFURLResponseGetHTTPResponse();
  int v11 = HTTPResponse;
  if (HTTPResponse)
  {
    if (CFHTTPMessageGetResponseStatusCode(HTTPResponse) == 401)
    {
      _CFHTTPMessageSetResponseURL();
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        LOWORD(result.location) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "PAC failed authentication", (uint8_t *)&result, 2u);
      }
      v32[0] = kCFProxyAutoConfigurationHTTPResponseKey;
      v32[1] = kCFProxyAutoConfigurationURLKey;
      result.location = (CFIndex)v11;
      result.length = v7;
      CFErrorCreate(kCFAllocatorDefault, kCFErrorDomainCFNetwork, 309, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:&result forKeys:v32 count:2]);
      operator new();
    }
    CFAbsoluteTimeGetCurrent();
    ResponseStatusCFIndex Code = CFHTTPMessageGetResponseStatusCode(v11);
    if (ResponseStatusCode != -1 && ResponseStatusCode <= 299)
    {
      CFStringRef v13 = CFHTTPMessageCopyHeaderFieldValue(v11, @"Content-Type");
      CFStringRef v14 = v13;
      if (v13)
      {
        if (CFStringFind(v13, @"application/x-javascript", 1uLL).location == -1) {
          goto LABEL_29;
        }
        CFRange v15 = CFStringFind(v14, @"charset=", 1uLL);
        if (v15.location == -1) {
          goto LABEL_29;
        }
        CFIndex v16 = v15.location + v15.length;
        if (CFStringGetCharacterAtIndex(v14, v15.location + v15.length) == 34) {
          ++v16;
        }
        CFIndex Length = CFStringGetLength(v14);
        CFCharacterSetRef v18 = (const __CFCharacterSet *)qword_1000188E0;
        if (!qword_1000188E0)
        {
          CFCharacterSetRef v18 = CFCharacterSetCreateWithCharactersInString(0, @"\n\r\t ;\"");
          qword_1000188E0 = (uint64_t)v18;
          if (!v18) {
            goto LABEL_29;
          }
        }
        CFIndex v19 = Length - v16;
        v34.location = v16;
        v34.length = v19;
        v20.length = CFStringFindCharacterFromSet(v14, v18, v34, 0, &result) ? result.location - v16 : v19;
        v20.location = v16;
        CFStringRef v21 = CFStringCreateWithSubstring(0, v14, v20);
        CFStringRef v22 = v21;
        if (v21)
        {
          CFStringEncoding v23 = CFStringConvertIANACharSetNameToEncoding(v21);
          CFRelease(v22);
        }
        else
        {
LABEL_29:
          CFStringEncoding v23 = -1;
        }
        CFRelease(v14);
      }
      else
      {
        CFStringEncoding v23 = -1;
      }
      CFIndex v24 = CFDataGetLength(a2);
      if (v24)
      {
        if (v23 == -1)
        {
          CFStringRef v26 = 0;
        }
        else
        {
          BytePtr = CFDataGetBytePtr(a2);
          CFStringRef v26 = CFStringCreateWithBytes(0, BytePtr, v24, v23, 1u);
        }
        if (!v26 && v23 != 134217984)
        {
          int v27 = CFDataGetBytePtr(a2);
          CFStringRef v26 = CFStringCreateWithBytes(0, v27, v24, 0x8000100u, 1u);
        }
        if (!v26 && v23 != 513)
        {
          uint64_t v28 = CFDataGetBytePtr(a2);
          CFStringRef v26 = CFStringCreateWithBytes(0, v28, v24, 0x201u, 1u);
        }
        if (!v26)
        {
          id v29 = CFDataGetBytePtr(a2);
          if (!CFStringCreateWithBytes(0, v29, v24, 0, 1u)
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            LOWORD(result.location) = 0;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "PAC data bytes could not be converted", (uint8_t *)&result, 2u);
          }
        }
      }
    }
    operator new();
  }
  uint64_t v30 = 0;
  double v31 = 0;
  sub_10000ABC0(v9, 0, 0, &v30);
  if (v31) {
    sub_100005F20(v31);
  }
  if (v8) {
    sub_100005F20(v8);
  }
}

void sub_10000AA8C(_Unwind_Exception *a1)
{
  sub_100005F20(v2);
  if (v1) {
    sub_100005F20(v1);
  }
  _Unwind_Resume(a1);
}

void sub_10000AB18(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[9];
  if (v2) {
    sub_100005F20(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)a1[7];
  if (v3) {
    sub_100005F20(v3);
  }
  size_t v4 = (std::__shared_weak_count *)a1[5];
  if (v4)
  {
    sub_100005F20(v4);
  }
}

void *sub_10000AB74(void *result, void *a2)
{
  uint64_t v2 = a2[5];
  result[4] = a2[4];
  result[5] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[7];
  result[6] = a2[6];
  result[7] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = a2[9];
  result[8] = a2[8];
  result[9] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_10000ABC0(uint64_t a1, uint64_t a2, std::__shared_weak_count *a3, uint64_t *a4)
{
  if (a1)
  {
    if (a3) {
      atomic_fetch_add_explicit(&a3->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v5 = *a4;
    uint64_t v6 = (std::__shared_weak_count *)a4[1];
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CFIndex v7 = *(void (**)(void *, uint64_t *, uint64_t *))(a1 + 8);
    uint64_t v8 = *(void *)(a1 + 16);
    uint64_t v9 = (void *)(a1 + (v8 >> 1));
    if (v8) {
      CFIndex v7 = *(void (**)(void *, uint64_t *, uint64_t *))(*v9 + v7);
    }
    uint64_t v12 = a2;
    CFStringRef v13 = a3;
    if (a3) {
      atomic_fetch_add_explicit(&a3->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v10 = v5;
    int v11 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v7(v9, &v12, &v10);
    if (v11) {
      sub_100005F20(v11);
    }
    if (v13) {
      sub_100005F20(v13);
    }
    if (v6) {
      sub_100005F20(v6);
    }
    if (a3) {
      sub_100005F20(a3);
    }
  }
}

void sub_10000AC9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a10) {
    sub_100005F20(a10);
  }
  if (a12)
  {
    sub_100005F20(a12);
    if (!v13)
    {
LABEL_5:
      if (!v12) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if (!v13)
  {
    goto LABEL_5;
  }
  sub_100005F20(v13);
  if (!v12) {
LABEL_7:
  }
    _Unwind_Resume(exception_object);
LABEL_6:
  sub_100005F20(v12);
  goto LABEL_7;
}

void sub_10000ACE8(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 24);
  if (v1) {
    CFRelease(v1);
  }
}

void sub_10000ACF8(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

void sub_10000AD34(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }

  operator delete();
}

uint64_t sub_10000AD84(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 16);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

CFDictionaryRef sub_10000ADB4(const __CFAllocator *a1, const __CFString *a2, const __CFString *a3)
{
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  CFIndex Length = CFStringGetLength(a2);
  CFIndex location = CFStringFind(a2, @":", 0).location;
  CFIndex v9 = location;
  if (location == -1) {
    CFIndex v10 = Length;
  }
  else {
    CFIndex v10 = location;
  }
  CFIndex v11 = 5;
  if (Length >= 6)
  {
    while (1)
    {
      UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(a2, v11);
      if (!CFCharacterSetIsCharacterMember(Predefined, CharacterAtIndex)) {
        break;
      }
      if (Length == ++v11)
      {
        CFIndex v11 = Length;
        break;
      }
    }
  }
  BOOL v13 = v10 <= v11;
  CFIndex v14 = v10 - v11;
  if (v13) {
    return 0;
  }
  SInt32 valuePtr = 0;
  CFAllocatorRef v15 = CFGetAllocator(a2);
  v35.length = v11 - 1;
  v35.CFIndex location = 0;
  CFStringRef v16 = CFStringCreateWithSubstring(v15, a2, v35);
  CFAllocatorRef v17 = CFGetAllocator(a2);
  v36.CFIndex location = v11;
  v36.length = v14;
  CFStringRef v18 = CFStringCreateWithSubstring(v17, a2, v36);
  if (v9 != -1)
  {
    v37.CFIndex location = v9 + 1;
    v37.length = Length + ~v9;
    CFStringRef v19 = CFStringCreateWithSubstring(a1, a2, v37);
    SInt32 valuePtr = CFStringGetIntValue(v19);
    if (v19) {
      CFRelease(v19);
    }
  }
  if (!v16)
  {
LABEL_41:
    if (v18) {
      CFRelease(v18);
    }
    return 0;
  }
  if (CFStringCompare(v16, @"PROXY", 1uLL) == kCFCompareEqualTo)
  {
    if (CFStringCompare(a3, @"http", 1uLL) && CFStringCompare(a3, @"ws", 1uLL))
    {
      if (CFStringCompare(a3, @"https", 1uLL) && CFStringCompare(a3, @"wss", 1uLL))
      {
        if (CFStringCompare(a3, @"ftp", 1uLL)) {
          goto LABEL_15;
        }
        CFStringRef v20 = kCFProxyTypeFTP;
        if (v9 == -1)
        {
          CFStringRef v21 = 0;
          int v22 = 21;
LABEL_33:
          SInt32 valuePtr = v22;
          goto LABEL_34;
        }
        goto LABEL_28;
      }
      unint64_t v25 = &kCFProxyTypeHTTPS;
    }
    else
    {
      unint64_t v25 = &kCFProxyTypeHTTP;
    }
    CFStringRef v20 = *v25;
    if (v9 == -1)
    {
      CFStringRef v21 = 0;
      int v22 = 80;
      goto LABEL_33;
    }
LABEL_28:
    CFStringRef v21 = 0;
    goto LABEL_34;
  }
  if (CFStringCompare(v16, @"SOCKS", 1uLL))
  {
LABEL_15:
    CFRelease(v16);
    goto LABEL_41;
  }
  CFComparisonResult v23 = CFStringCompare(a3, @"socks4", 1uLL);
  CFStringRef v20 = kCFProxyTypeSOCKS;
  if (v23) {
    CFIndex v24 = &kCFStreamSocketSOCKSVersion5;
  }
  else {
    CFIndex v24 = &kCFStreamSocketSOCKSVersion4;
  }
  CFStringRef v21 = *v24;
  if (v9 == -1)
  {
    int v22 = 1080;
    goto LABEL_33;
  }
LABEL_34:
  CFRelease(v16);
  if (!v20) {
    goto LABEL_41;
  }
  CFIndex v26 = 3;
  CFNumberRef v27 = CFNumberCreate(a1, kCFNumberSInt32Type, &valuePtr);
  keys[0] = (void *)kCFProxyTypeKey;
  keys[1] = (void *)kCFProxyHostNameKey;
  values[0] = (void *)v20;
  values[1] = (void *)v18;
  keys[2] = (void *)kCFProxyPortNumberKey;
  CFStringRef v34 = 0;
  values[2] = v27;
  CFStringRef v32 = 0;
  if (v21)
  {
    CFStringRef v34 = kCFStreamPropertySOCKSVersion;
    CFStringRef v32 = v21;
    CFIndex v26 = 4;
  }
  CFDictionaryRef v28 = CFDictionaryCreate(a1, (const void **)keys, (const void **)values, v26, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (v18) {
    CFRelease(v18);
  }
  if (v27) {
    CFRelease(v27);
  }
  return v28;
}

void sub_10000B138(const OpaqueJSContext **a1, uint64_t a2)
{
  CFURLRef v4 = *(const __CFURL **)(*(void *)a2 + 8);
  CFStringRef v5 = CFURLCopyHostName(v4);
  CFStringRef string = v5;
  CFStringRef v6 = CFURLCopyScheme(v4);
  CFStringRef v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)objc_super buf = 134218240;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v7;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "PAC FindProxyForURL failed. Invalid target URL host=%p, scheme=%p", buf, 0x16u);
    }
    CFErrorCreate(kCFAllocatorDefault, kCFErrorDomainCFNetwork, 305, 0);
    operator new();
  }
  int v9 = CFNetworkDiagnosticLevel();
  if (v9 >= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)objc_super buf = 138543618;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PAC: Calling FindProxyForURL (Target URL: %{public}@, Target Hostname: %{public}@)", buf, 0x16u);
  }
  CFIndex v10 = *a1;
  uint64_t v12 = *(void *)(*(void *)a2 + 32);
  uint64_t v11 = *(void *)(*(void *)a2 + 40);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)objc_super buf = 138412546;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PAC calling FindProxyForURL for id %@ token %p", buf, 0x16u);
  }
  *(void *)objc_super buf = v11;
  *(void *)&buf[8] = v12;
  if (v10) {
    GlobalObject = JSContextGetGlobalObject(v10);
  }
  else {
    GlobalObject = 0;
  }
  CFIndex v14 = JSStringCreateWithCFString(@"__dnsResolve");
  Property = JSObjectGetProperty(v10, GlobalObject, v14, 0);
  JSStringRelease(v14);
  if (Property)
  {
    if (JSValueIsObject(v10, Property))
    {
      if (JSObjectSetPrivate(Property, buf))
      {
        CFStringRef v16 = JSStringCreateWithCFString(@"__Apple_FindProxyForURL");
        if (GlobalObject) {
          GlobalObject = JSObjectGetProperty(v10, GlobalObject, v16, 0);
        }
        JSStringRelease(v16);
        BOOL IsFunction = JSObjectIsFunction(v10, GlobalObject);
        if (GlobalObject) {
          BOOL v18 = IsFunction;
        }
        else {
          BOOL v18 = 0;
        }
        if (!v18) {
          goto LABEL_38;
        }
        CFURLRef v19 = CFURLCopyAbsoluteURL(v4);
        CFStringRef v20 = CFURLGetString(v19);
        CFStringRef v21 = JSStringCreateWithCFString(v20);
        arguments[0] = JSValueMakeString(v10, v21);
        int v22 = JSStringCreateWithCFString(string);
        arguments[1] = JSValueMakeString(v10, v22);
        if (v19) {
          CFRelease(v19);
        }
        CFComparisonResult v23 = JSObjectCallAsFunction(v10, GlobalObject, 0, 2uLL, arguments, 0);
        JSStringRelease(v21);
        JSStringRelease(v22);
        if (v23 && JSValueIsString(v10, v23))
        {
          CFIndex v24 = JSValueToStringCopy(v10, v23, 0);
          CFStringRef v25 = JSStringCopyCFString(0, v24);
          JSStringRelease(v24);
        }
        else
        {
LABEL_38:
          CFStringRef v25 = 0;
        }
        if (!JSObjectSetPrivate(Property, 0) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        {
          LOWORD(arguments[0]) = 0;
          _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to clear the private context on dnsResolve object", (uint8_t *)arguments, 2u);
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(arguments[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PAC returning from FindProxyForURL", (uint8_t *)arguments, 2u);
        }
        if (v25)
        {
          CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
          operator new();
        }
LABEL_46:
        CFErrorCreate(kCFAllocatorDefault, kCFErrorDomainCFNetwork, 308, 0);
        operator new();
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        goto LABEL_46;
      }
      LOWORD(arguments[0]) = 0;
      CFIndex v26 = "Failed to set the private context on dnsResolve object";
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        goto LABEL_46;
      }
      LOWORD(arguments[0]) = 0;
      CFIndex v26 = "dnsResolve is not an object";
    }
  }
  else
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      goto LABEL_46;
    }
    LOWORD(arguments[0]) = 0;
    CFIndex v26 = "Failed to find dnsResolve function";
  }
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, v26, (uint8_t *)arguments, 2u);
  goto LABEL_46;
}

void sub_10000BADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf, uint64_t a11, CFTypeRef a12, uint64_t a13, CFTypeRef a14, uint64_t a15, uint64_t a16)
{
  if (a14) {
    CFRelease(a14);
  }
  _Unwind_Resume(a1);
}

void sub_10000BBBC(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 24);
  if (v1) {
    CFRelease(v1);
  }
}

void sub_10000BBCC(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

void sub_10000BC08(JSGlobalContextRef ctx)
{
  if (ctx) {
    JSGlobalContextRelease(ctx);
  }
}

CFStringRef sub_10000BC14()
{
  return @"PipelineQuery";
}

const char *sub_10000BC20()
{
  return "HTTPPipelining";
}

uint64_t sub_10000BC2C()
{
  return 1;
}

uint64_t sub_10000BC34(uint64_t a1)
{
  uint64_t v2 = CFHostCreateWithName(kCFAllocatorDefault, (CFStringRef)qword_1000188F8);
  if (v2)
  {
    uint64_t v3 = v2;
    CFStreamCreatePairWithSocketToCFHost(kCFAllocatorDefault, v2, dword_1000188F0, (CFReadStreamRef *)(a1 + 80), (CFWriteStreamRef *)(a1 + 72));
    if (!*(void *)(a1 + 80) || !*(void *)(a1 + 72)) {
      *(unsigned char *)(a1 + 48) = 0;
    }
    CFRelease(v3);
  }
  else if (a1)
  {
    *(unsigned char *)(a1 + 48) = 0;
  }
  if (*(unsigned char *)(a1 + 48))
  {
    clientContext.version = 0;
    clientContext.info = (void *)a1;
    memset(&clientContext.retain, 0, 24);
    CFURLRef v4 = *(__CFWriteStream **)(a1 + 72);
    if (v4 && CFWriteStreamSetClient(v4, 0x1CuLL, (CFWriteStreamClientCallBack)sub_10000BD80, &clientContext))
    {
      CFWriteStreamSetDispatchQueue(*(CFWriteStreamRef *)(a1 + 72), *(dispatch_queue_t *)(a1 + 8));
      uint64_t result = CFWriteStreamOpen(*(CFWriteStreamRef *)(a1 + 72));
      if (result)
      {
        if (*(unsigned char *)(a1 + 48)) {
          return result;
        }
        goto LABEL_18;
      }
      CFStringRef v6 = CFWriteStreamCopyError(*(CFWriteStreamRef *)(a1 + 72));
      sub_10000E558(v6);
      if (v6) {
        CFRelease(v6);
      }
      CFWriteStreamSetDispatchQueue(*(CFWriteStreamRef *)(a1 + 72), 0);
    }
    *(unsigned char *)(a1 + 48) = 0;
  }
LABEL_18:

  return sub_10000E968((void *)a1);
}

void sub_10000BD80(CFWriteStreamRef stream, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (!*(unsigned char *)(a3 + 48)) {
      goto LABEL_27;
    }
    if (a2 == 16) {
      goto LABEL_9;
    }
    if (a2 == 8)
    {
      int v9 = CFWriteStreamCopyError(stream);
      sub_10000E558(v9);
      if (v9) {
        CFRelease(v9);
      }
      *(unsigned char *)(a3 + 48) = 0;
      goto LABEL_27;
    }
    if (a2 != 4) {
      return;
    }
    CFIndex v5 = CFWriteStreamWrite(stream, (const UInt8 *)qword_1000188E8, qword_100018900);
    if (v5 == -1)
    {
      CFIndex v10 = CFWriteStreamCopyError(stream);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        if (v10)
        {
          CFErrorDomain Domain = CFErrorGetDomain(v10);
          CFIndex Code = CFErrorGetCode(v10);
        }
        else
        {
          CFIndex Code = -1;
          CFErrorDomain Domain = @"NULL ERROR";
        }
        LODWORD(v14.version) = 138412546;
        *(CFIndex *)((char *)&v14.version + 4) = (CFIndex)Domain;
        WORD2(v14.info) = 2048;
        *(void **)((char *)&v14.info + 6) = (void *)Code;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to write after kCFStreamEventCanAcceptBytes <%@, %ld>", (uint8_t *)&v14, 0x16u);
        if (!v10) {
          goto LABEL_26;
        }
      }
      else if (!v10)
      {
        goto LABEL_26;
      }
    }
    else
    {
      size_t v6 = qword_100018900 - v5;
      if (qword_100018900 == v5)
      {
        if (*(unsigned char *)(a3 + 48))
        {
LABEL_9:
          CFWriteStreamSetDispatchQueue(*(CFWriteStreamRef *)(a3 + 72), 0);
          CFWriteStreamClose(*(CFWriteStreamRef *)(a3 + 72));
          *(void *)(a3 + 88) = malloc_type_malloc(8 * *(void *)(a3 + 96), 0x2004093837F09uLL);
          if (*(uint64_t *)(a3 + 96) >= 1)
          {
            uint64_t v7 = 0;
            do
              *(void *)(*(void *)(a3 + 88) + 8 * v7++) = CFHTTPMessageCreateEmpty(kCFAllocatorDefault, 0);
            while (*(void *)(a3 + 96) > v7);
          }
          v14.version = 0;
          v14.info = (void *)a3;
          memset(&v14.retain, 0, 24);
          BOOL v8 = *(__CFReadStream **)(a3 + 80);
          if (v8 && CFReadStreamSetClient(v8, 0x1AuLL, (CFReadStreamClientCallBack)sub_10000C0C0, &v14))
          {
            CFReadStreamSetDispatchQueue(*(CFReadStreamRef *)(a3 + 80), *(dispatch_queue_t *)(a3 + 8));
            if (CFReadStreamOpen(*(CFReadStreamRef *)(a3 + 80)))
            {
              if (*(unsigned char *)(a3 + 48)) {
                return;
              }
              goto LABEL_34;
            }
            uint64_t v11 = CFReadStreamCopyError(*(CFReadStreamRef *)(a3 + 80));
            sub_10000E558(v11);
            if (v11) {
              CFRelease(v11);
            }
            CFReadStreamSetDispatchQueue(*(CFReadStreamRef *)(a3 + 80), 0);
          }
          *(unsigned char *)(a3 + 48) = 0;
LABEL_34:
          sub_10000E968((void *)a3);
          return;
        }
LABEL_27:
        CFWriteStreamSetDispatchQueue(*(CFWriteStreamRef *)(a3 + 72), 0);
        CFWriteStreamClose(*(CFWriteStreamRef *)(a3 + 72));
        sub_10000E968((void *)a3);
        return;
      }
      qword_100018900 -= v5;
      memmove((void *)qword_1000188E8, (const void *)(qword_1000188E8 + v5), v6);
      CFIndex v10 = CFWriteStreamCopyError(stream);
      sub_10000E558(v10);
      if (!v10)
      {
LABEL_26:
        if (*(unsigned char *)(a3 + 48)) {
          return;
        }
        goto LABEL_27;
      }
    }
    CFRelease(v10);
    goto LABEL_26;
  }
  CFWriteStreamSetDispatchQueue(stream, 0);

  CFWriteStreamClose(stream);
}

void sub_10000C0A4(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_10000C0C0()
{
  uint64_t v0 = (__CFReadStream *)__chkstk_darwin();
  uint64_t v3 = v0;
  if (!v2)
  {
    CFReadStreamSetDispatchQueue(v0, 0);
    CFReadStreamClose(v3);
    return;
  }
  uint64_t v4 = v2;
  if (!*(unsigned char *)(v2 + 48))
  {
    sub_10000C284(v2);
LABEL_20:
    sub_10000E968((void *)v4);
    return;
  }
  if (v1 == 16)
  {
LABEL_18:
    sub_10000C284(v4);
LABEL_19:
    sub_10000C590(v4);
    goto LABEL_20;
  }
  if (v1 == 8)
  {
    uint64_t v7 = CFReadStreamCopyError(v0);
    sub_10000E558(v7);
    if (v7) {
      CFRelease(v7);
    }
    goto LABEL_18;
  }
  if (v1 != 2) {
    return;
  }
  if (*(void *)(v2 + 96) <= (uint64_t)*(unsigned int *)(v2 + 104)) {
    goto LABEL_17;
  }
  uint64_t v5 = CFReadStreamRead(v0, buffer, 0x8000);
  if (v5 < 1)
  {
LABEL_22:
    BOOL v6 = 0;
    goto LABEL_23;
  }
  if (!CFHTTPMessageAppendBytes(*(CFHTTPMessageRef *)(*(void *)(v4 + 88) + 8 * *(unsigned int *)(v4 + 104)), buffer, v5))
  {
LABEL_17:
    *(unsigned char *)(v4 + 48) = 0;
    goto LABEL_18;
  }
  if (!CFHTTPMessageIsHeaderComplete(*(CFHTTPMessageRef *)(*(void *)(v4 + 88) + 8 * *(unsigned int *)(v4 + 104)))) {
    goto LABEL_22;
  }
  BOOL v6 = sub_10000C2D4(v4);
LABEL_23:
  if (!*(unsigned char *)(v4 + 48) || v6)
  {
    sub_10000C284(v4);
    if (!v6) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
}

void sub_10000C284(uint64_t a1)
{
  uint64_t v2 = *(__CFReadStream **)(a1 + 80);
  if (v2)
  {
    CFReadStreamSetDispatchQueue(v2, 0);
    uint64_t v3 = *(__CFReadStream **)(a1 + 80);
    CFReadStreamClose(v3);
  }
}

BOOL sub_10000C2D4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48)) {
    return 0;
  }
  CFStringRef v2 = CFHTTPMessageCopyHeaderFieldValue(*(CFHTTPMessageRef *)(*(void *)(a1 + 88) + 8 * *(unsigned int *)(a1 + 104)), @"Content-Length");
  if (v2)
  {
    CFStringRef v3 = v2;
    SInt32 IntValue = CFStringGetIntValue(v2);
    *(_DWORD *)(a1 + 108) = IntValue;
    if (IntValue >= 1
      && (CFDataRef v5 = CFHTTPMessageCopyBody(*(CFHTTPMessageRef *)(*(void *)(a1 + 88) + 8 * *(unsigned int *)(a1 + 104)))) != 0)
    {
      CFDataRef v6 = v5;
      if (CFDataGetLength(v5) == *(_DWORD *)(a1 + 108)
        && (uint64_t v7 = (*(_DWORD *)(a1 + 104) + 1), *(_DWORD *)(a1 + 104) = v7, *(void *)(a1 + 96) == v7))
      {
        BOOL v8 = 1;
      }
      else
      {
        CFIndex Length = CFDataGetLength(v6);
        CFIndex v10 = *(int *)(a1 + 108);
        if (Length <= v10)
        {
          BOOL v8 = 0;
        }
        else
        {
          CFIndex v11 = CFDataGetLength(v6);
          if (v11 <= v10)
          {
            *(unsigned char *)(a1 + 48) = 0;
          }
          else
          {
            size_t v12 = v11;
            if ((v11 < 1 || v11 < *(int *)(a1 + 108))
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)CFStringRef v20 = 0;
              _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Body data to split has length 0. This should never happen.", v20, 2u);
            }
            BOOL v13 = (UInt8 *)malloc_type_malloc(v12, 0x100004077774924uLL);
            CFStreamClientContext v14 = malloc_type_malloc(*(int *)(a1 + 108), 0x100004077774924uLL);
            CFAllocatorRef v15 = malloc_type_malloc(v12 - *(int *)(a1 + 108), 0x100004077774924uLL);
            v21.CFIndex location = 0;
            v21.length = v12;
            CFDataGetBytes(v6, v21, v13);
            memcpy(v14, v13, *(int *)(a1 + 108));
            CFDataRef v16 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v14, *(int *)(a1 + 108));
            uint64_t v17 = *(void *)(a1 + 88);
            uint64_t v18 = *(unsigned int *)(a1 + 104);
            *(_DWORD *)(a1 + 104) = v18 + 1;
            CFHTTPMessageSetBody(*(CFHTTPMessageRef *)(v17 + 8 * v18), v16);
            if (*(void *)(a1 + 96) <= (uint64_t)*(unsigned int *)(a1 + 104))
            {
              *(unsigned char *)(a1 + 48) = 0;
            }
            else
            {
              memcpy(v15, &v13[*(int *)(a1 + 108)], v12 - *(int *)(a1 + 108));
              CFHTTPMessageAppendBytes(*(CFHTTPMessageRef *)(*(void *)(a1 + 88) + 8 * *(unsigned int *)(a1 + 104)), (const UInt8 *)v15, v12 - *(int *)(a1 + 108));
            }
            if (v15) {
              free(v15);
            }
            if (v14) {
              free(v14);
            }
            if (v13) {
              free(v13);
            }
            if (v16) {
              CFRelease(v16);
            }
          }
          BOOL v8 = sub_10000C2D4(a1) != 0;
        }
      }
      CFRelease(v6);
    }
    else
    {
      BOOL v8 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    BOOL v8 = 0;
    *(unsigned char *)(a1 + 48) = 0;
  }
  return v8;
}

void sub_10000C590(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    for (uint64_t i = 0; *(void *)(a1 + 96) > i; ++i)
    {
      CFDataRef v3 = CFHTTPMessageCopyBody(*(CFHTTPMessageRef *)(*(void *)(a1 + 88) + 8 * i));
      if (!v3) {
        goto LABEL_14;
      }
      CFDataRef v4 = v3;
      if (CFDataGetLength(v3) > 213)
      {
        CFRelease(v4);
LABEL_14:
        *(unsigned char *)(a1 + 48) = 0;
        return;
      }
      CFDataGetLength(v4);
      CFDataRef v5 = (UInt8 *)&v10 - ((__chkstk_darwin() + 16) & 0xFFFFFFFFFFFFFFF0);
      v11.length = CFDataGetLength(v4);
      v11.CFIndex location = 0;
      CFDataGetBytes(v4, v11, v5);
      unint64_t v6 = 0;
      while (1)
      {
        CFIndex Length = CFDataGetLength(v4);
        if (v6 > 0xD4 || Length <= (uint64_t)v6) {
          break;
        }
        int v8 = v5[v6];
        int v9 = off_100014EE0[i][v6++];
        if (v8 != v9)
        {
          *(unsigned char *)(a1 + 48) = 0;
          break;
        }
      }
      CFRelease(v4);
      if (!*(unsigned char *)(a1 + 48)) {
        return;
      }
    }
  }
}

void sub_10000C6EC(void *a1)
{
  sub_10000C724(a1);

  operator delete();
}

uint64_t sub_10000C724(void *a1)
{
  *a1 = off_100014EB0;
  CFStringRef v2 = (void *)a1[11];
  if (v2)
  {
    uint64_t v3 = 0;
    while (a1[12] > v3)
    {
      CFDataRef v4 = (const void *)v2[v3];
      v2[v3] = 0;
      if (v4) {
        CFRelease(v4);
      }
      ++v3;
      CFStringRef v2 = (void *)a1[11];
      if (!v2) {
        goto LABEL_9;
      }
    }
    free(v2);
    a1[11] = 0;
  }
LABEL_9:
  CFDataRef v5 = (const void *)a1[10];
  a1[10] = 0;
  if (v5) {
    CFRelease(v5);
  }
  unint64_t v6 = (const void *)a1[9];
  a1[9] = 0;
  if (v6) {
    CFRelease(v6);
  }

  return sub_10000E8DC((uint64_t)a1);
}

void sub_10000C7D8(_Unwind_Exception *a1)
{
  sub_10000E8DC(v1);
  _Unwind_Resume(a1);
}

void sub_10000C7F4(uint64_t a1)
{
  qword_1000188E8 = 0;
  __chkstk_darwin();
  uint64_t v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  CFAllocatorRef v26 = kCFAllocatorDefault;
  CFDataRef v4 = CFDataCreate(kCFAllocatorDefault, 0, 0);
  CFDataRef v5 = getenv("CFNETWORKAGENT_PORT");
  if (v5) {
    int v6 = strtol(v5, 0, 10);
  }
  else {
    int v6 = 80;
  }
  dword_1000188F0 = v6;
  uint64_t v7 = getenv("CFNETWORKAGENT_HOST");
  if (v7) {
    int v8 = v7;
  }
  else {
    int v8 = "configuration.apple.com";
  }
  qword_1000188F8 = (uint64_t)CFStringCreateWithCString(v26, v8, 0x600u);
  int v9 = malloc_type_malloc(8 * *(void *)(a1 + 96), 0x10040436913F5uLL);
  if (*(uint64_t *)(a1 + 96) >= 1)
  {
    uint64_t v10 = 0;
    CFStringRef v25 = kCFHTTPVersion1_1;
    do
    {
      CFAllocatorRef v11 = v26;
      CFStringRef v12 = CFStringCreateWithFormat(v26, 0, @"http://%@:%d/configurations/pep/pipeline/pipeline%d.html", qword_1000188F8, dword_1000188F0, v10);
      CFURLRef v13 = CFURLCreateWithString(v11, v12, 0);
      Request = CFHTTPMessageCreateRequest(v11, @"GET", v13, v25);
      CFDataRef v15 = v4;
      CFHTTPMessageSetBody(Request, v4);
      CFHTTPMessageSetHeaderFieldValue(Request, @"Host", (CFStringRef)qword_1000188F8);
      CFHTTPMessageSetHeaderFieldValue(Request, @"Connection", @"Keep-Alive");
      CFDataRef v16 = CFHTTPMessageCopySerializedMessage(Request);
      qword_100018900 += CFDataGetLength(v16);
      CFIndex Length = CFDataGetLength(v16);
      v9[v10] = malloc_type_malloc(Length, 0x100004077774924uLL);
      *(void *)&v3[8 * v10] = CFDataGetLength(v16);
      v28.length = CFDataGetLength(v16);
      v28.CFIndex location = 0;
      CFDataGetBytes(v16, v28, (UInt8 *)v9[v10]);
      if (Request) {
        CFRelease(Request);
      }
      if (v13) {
        CFRelease(v13);
      }
      if (v12) {
        CFRelease(v12);
      }
      if (v16) {
        CFRelease(v16);
      }
      ++v10;
      CFDataRef v4 = v15;
    }
    while (*(void *)(a1 + 96) > v10);
  }
  uint64_t v18 = (char *)malloc_type_malloc(qword_100018900, 0x100004077774924uLL);
  qword_1000188E8 = (uint64_t)v18;
  if (*(uint64_t *)(a1 + 96) >= 1)
  {
    CFURLRef v19 = v18;
    uint64_t v20 = 0;
    int v21 = 0;
    do
    {
      size_t v22 = *(void *)&v3[8 * v20];
      memcpy(&v19[v21], (const void *)v9[v20], v22);
      CFComparisonResult v23 = (void *)v9[v20];
      if (v23)
      {
        free(v23);
        v9[v20] = 0;
      }
      v21 += v22;
      ++v20;
    }
    while (*(void *)(a1 + 96) > v20);
  }
  if (v4) {
    CFRelease(v4);
  }
  if (v9)
  {
    free(v9);
  }
}

void sub_10000CB84(char *a1)
{
  if (a1)
  {
    sub_10000CB84(*(void *)a1);
    sub_10000CB84(*((void *)a1 + 1));
    if (a1[55] < 0) {
      operator delete(*((void **)a1 + 4));
    }
    operator delete(a1);
  }
}

void sub_10000CBE0(dispatch_object_t object)
{
  if (object) {
    dispatch_release(object);
  }
}

void sub_10000CBEC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    std::string::size_type v7 = *(void *)(a1 + 40);
    int v8 = (void *)(a1 + 48);
    if (*(char *)(a1 + 71) < 0) {
      int v8 = (void *)*v8;
    }
    LODWORD(__dst.__r_.__value_.__l.__data_) = 134218242;
    *(std::string::size_type *)((char *)__dst.__r_.__value_.__r.__words + 4) = v7;
    WORD2(__dst.__r_.__value_.__r.__words[1]) = 2080;
    *(std::string::size_type *)((char *)&__dst.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v8;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Received legacy query type=%lld sig=%s", (uint8_t *)&__dst, 0x16u);
  }
  sub_10000E69C(&__dst, a1 + 48, *(void *)(a1 + 40));
  if ((void *)(v2 + 64) == sub_10000D578(v2 + 56, &__dst))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5 == 2) {
      operator new();
    }
    if (v5 == 1) {
      operator new();
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 72);
      buf[0] = 136315394;
      *(void *)&buf[1] = v6;
      __int16 v10 = 1024;
      int v11 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create query for <signature=%s, query type=%d>. Ignoring.", (uint8_t *)buf, 0x12u);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 72);
    uint64_t v4 = *(void *)(a1 + 40);
    buf[0] = 136315394;
    *(void *)&buf[1] = v3;
    __int16 v10 = 1024;
    int v11 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Received <signature=%s> query type=%d> that is already outstanding. Ignoring.", (uint8_t *)buf, 0x12u);
  }
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
}

void sub_10000D44C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  sub_10000E8DC(v27);
  if (a20 < 0) {
    operator delete(__p);
  }
  operator delete();
}

void sub_10000D534(uint64_t a1)
{
  if (*(char *)(a1 + 71) < 0) {
    operator delete(*(void **)(a1 + 48));
  }
}

void *sub_10000D548(uint64_t a1, uint64_t a2)
{
  uint64_t result = (void *)(a1 + 48);
  if (*(char *)(a2 + 71) < 0) {
    return sub_100009298(result, *(void **)(a2 + 48), *(void *)(a2 + 56));
  }
  long long v3 = *(_OWORD *)(a2 + 48);
  result[2] = *(void *)(a2 + 64);
  *(_OWORD *)uint64_t result = v3;
  return result;
}

void *sub_10000D578(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)(a1 + 8);
  long long v3 = *(void **)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = (void *)(a1 + 8);
  do
  {
    BOOL v6 = sub_10000DFC0(v3 + 4, a2);
    std::string::size_type v7 = v3 + 1;
    if (!v6)
    {
      std::string::size_type v7 = v3;
      uint64_t v5 = v3;
    }
    long long v3 = (void *)*v7;
  }
  while (*v7);
  if (v5 == v2 || sub_10000DFC0(a2, v5 + 4)) {
    return v2;
  }
  return v5;
}

void sub_10000D5F4(uint64_t a1, uint64_t a2, char a3)
{
  if (*(char *)(a1 + 31) < 0) {
    sub_100009298(&__dst, *(void **)(a1 + 8), *(void *)(a1 + 16));
  }
  else {
    std::string __dst = *(std::string *)(a1 + 8);
  }
  std::string::append(&__dst, ".");
  BOOL v6 = (const std::string::value_type *)(*(uint64_t (**)(uint64_t))(*(void *)a2 + 32))(a2);
  std::string::append(&__dst, v6);
  std::string::append(&__dst, ":");
  if (*(char *)(a2 + 47) < 0)
  {
    sub_100009298(__p, *(void **)(a2 + 24), *(void *)(a2 + 32));
  }
  else
  {
    *(_OWORD *)long long __p = *(_OWORD *)(a2 + 24);
    *(void *)&__p[16] = *(void *)(a2 + 40);
  }
  if (__p[23] >= 0) {
    std::string::size_type v7 = __p;
  }
  else {
    std::string::size_type v7 = *(const std::string::value_type **)__p;
  }
  if (__p[23] >= 0) {
    std::string::size_type v8 = __p[23];
  }
  else {
    std::string::size_type v8 = *(void *)&__p[8];
  }
  std::string::append(&__dst, v7, v8);
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFStringRef v10 = CFStringCreateWithFormat(0, 0, @"%f", *(void *)&Current);
  Mutable = CFArrayCreateMutable(0, 2, &kCFTypeArrayCallBacks);
  CFStringRef v12 = Mutable;
  if (a3)
  {
    CFStringRef v13 = @"PENDING";
  }
  else if (*(unsigned char *)(a2 + 48))
  {
    CFStringRef v13 = @"TRUE";
  }
  else
  {
    CFStringRef v13 = @"FALSE";
  }
  CFArrayAppendValue(Mutable, v13);
  CFArrayAppendValue(v12, v10);
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_dst = &__dst;
  }
  else {
    p_dst = (std::string *)__dst.__r_.__value_.__r.__words[0];
  }
  CFStringRef v15 = CFStringCreateWithCString(0, (const char *)p_dst, 0x8000100u);
  if (SCDynamicStoreSetValue(*(SCDynamicStoreRef *)a1, v15, v12))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 24))(a2);
      *(_DWORD *)long long __p = 134218498;
      *(void *)&__p[4] = v16;
      *(_WORD *)&__p[12] = 2112;
      *(void *)&__p[14] = v15;
      *(_WORD *)&__p[22] = 2112;
      uint64_t v20 = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Added key-value pair to SCDynamicStore <QueryType=%lld>: <Key=%@, Value=%@>", __p, 0x20u);
      if (!v15) {
        goto LABEL_30;
      }
LABEL_29:
      CFRelease(v15);
      goto LABEL_30;
    }
LABEL_28:
    if (!v15) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    goto LABEL_28;
  }
  uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 24))(a2);
  *(_DWORD *)long long __p = 134218498;
  *(void *)&__p[4] = v17;
  *(_WORD *)&__p[12] = 2112;
  *(void *)&__p[14] = v15;
  *(_WORD *)&__p[22] = 2112;
  uint64_t v20 = v12;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to add key-value pair to SCDynamicStore <QueryType=%lld>: <Key=%@, Value=%@>", __p, 0x20u);
  if (v15) {
    goto LABEL_29;
  }
LABEL_30:
  if (v12) {
    CFRelease(v12);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
}

void sub_10000D948(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (v25)
  {
    CFRelease(v25);
    if (!v24)
    {
LABEL_3:
      if (!v23)
      {
LABEL_8:
        if (a16 < 0) {
          operator delete(__p);
        }
        _Unwind_Resume(exception_object);
      }
LABEL_7:
      CFRelease(v23);
      goto LABEL_8;
    }
  }
  else if (!v24)
  {
    goto LABEL_3;
  }
  CFRelease(v24);
  if (!v23) {
    goto LABEL_8;
  }
  goto LABEL_7;
}

void sub_10000D9E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  sub_10000D5F4(v3, a2, 0);
  uint64_t v4 = (uint64_t **)(v3 + 56);
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 24))(a2);
  sub_10000E69C(&__p, a2 + 24, v5);
  BOOL v6 = sub_10000D578(v3 + 56, &__p);
  if ((uint64_t *)(v3 + 64) == v6) {
    goto LABEL_86;
  }
  std::string::size_type v7 = v6;
  std::string::size_type v8 = (uint64_t *)v6[1];
  if (v8)
  {
    do
    {
      int v9 = v8;
      std::string::size_type v8 = (uint64_t *)*v8;
    }
    while (v8);
  }
  else
  {
    CFStringRef v10 = v6;
    do
    {
      int v9 = (uint64_t *)v10[2];
      BOOL v31 = *v9 == (void)v10;
      CFStringRef v10 = v9;
    }
    while (!v31);
  }
  if (*v4 == v6) {
    const void *v4 = v9;
  }
  int v11 = *(uint64_t **)(v3 + 64);
  --*(void *)(v3 + 72);
  uint64_t v12 = *v6;
  if (*v6)
  {
    CFStringRef v13 = (uint64_t *)v6[1];
    if (!v13)
    {
      CFStreamClientContext v14 = v6;
      goto LABEL_18;
    }
    do
    {
      CFStreamClientContext v14 = v13;
      CFStringRef v13 = (uint64_t *)*v13;
    }
    while (v13);
  }
  else
  {
    CFStreamClientContext v14 = v6;
  }
  uint64_t v12 = v14[1];
  if (v12)
  {
LABEL_18:
    int v15 = 0;
    *(void *)(v12 + 16) = v14[2];
    goto LABEL_19;
  }
  int v15 = 1;
LABEL_19:
  uint64_t v16 = (uint64_t **)v14[2];
  uint64_t v17 = *v16;
  if (*v16 == v14)
  {
    *uint64_t v16 = (uint64_t *)v12;
    if (v14 == v11)
    {
      uint64_t v17 = 0;
      int v11 = (uint64_t *)v12;
    }
    else
    {
      uint64_t v17 = v16[1];
    }
  }
  else
  {
    v16[1] = (uint64_t *)v12;
  }
  int v18 = *((unsigned __int8 *)v14 + 24);
  if (v14 != v6)
  {
    uint64_t v19 = v6[2];
    void v14[2] = v19;
    *(void *)(v19 + 8 * (*(void *)v6[2] != (void)v6)) = v14;
    uint64_t v20 = *v6;
    uint64_t *v14 = *v6;
    *(void *)(v20 + 16) = v14;
    uint64_t v21 = v6[1];
    v14[1] = v21;
    if (v21) {
      *(void *)(v21 + 16) = v14;
    }
    *((unsigned char *)v14 + 24) = *((unsigned char *)v6 + 24);
    if (v11 == v6) {
      int v11 = v14;
    }
  }
  if (!v18 || !v11) {
    goto LABEL_83;
  }
  if (!v15)
  {
    *(unsigned char *)(v12 + 24) = 1;
    goto LABEL_83;
  }
  while (1)
  {
    uint64_t v22 = v17[2];
    if (*(uint64_t **)v22 != v17) {
      break;
    }
    if (!*((unsigned char *)v17 + 24))
    {
      *((unsigned char *)v17 + 24) = 1;
      *(unsigned char *)(v22 + 24) = 0;
      uint64_t v28 = v17[1];
      *(void *)uint64_t v22 = v28;
      if (v28) {
        *(void *)(v28 + 16) = v22;
      }
      v17[2] = *(void *)(v22 + 16);
      *(void *)(*(void *)(v22 + 16) + 8 * (**(void **)(v22 + 16) != v22)) = v17;
      v17[1] = v22;
      *(void *)(v22 + 16) = v17;
      if (v11 == (uint64_t *)v22) {
        int v11 = v17;
      }
      uint64_t v17 = *(uint64_t **)v22;
    }
    id v29 = (void *)*v17;
    if (*v17 && !*((unsigned char *)v29 + 24)) {
      goto LABEL_78;
    }
    uint64_t v30 = (uint64_t *)v17[1];
    if (v30 && !*((unsigned char *)v30 + 24))
    {
      if (v29 && !*((unsigned char *)v29 + 24))
      {
LABEL_78:
        uint64_t v30 = v17;
      }
      else
      {
        *((unsigned char *)v30 + 24) = 1;
        *((unsigned char *)v17 + 24) = 0;
        uint64_t v36 = *v30;
        v17[1] = *v30;
        if (v36) {
          *(void *)(v36 + 16) = v17;
        }
        v30[2] = v17[2];
        *(void *)(v17[2] + 8 * (*(void *)v17[2] != (void)v17)) = v30;
        *uint64_t v30 = (uint64_t)v17;
        v17[2] = (uint64_t)v30;
        id v29 = v17;
      }
      uint64_t v33 = v30[2];
      *((unsigned char *)v30 + 24) = *(unsigned char *)(v33 + 24);
      *(unsigned char *)(v33 + 24) = 1;
      *((unsigned char *)v29 + 24) = 1;
      CFStringRef v34 = *(uint64_t **)v33;
      uint64_t v37 = *(void *)(*(void *)v33 + 8);
      *(void *)uint64_t v33 = v37;
      if (v37) {
        *(void *)(v37 + 16) = v33;
      }
      v34[2] = *(void *)(v33 + 16);
      *(void *)(*(void *)(v33 + 16) + 8 * (**(void **)(v33 + 16) != v33)) = v34;
      v34[1] = v33;
      goto LABEL_82;
    }
    *((unsigned char *)v17 + 24) = 0;
    uint64_t v27 = (uint64_t *)v17[2];
    if (*((unsigned char *)v27 + 24)) {
      BOOL v31 = v27 == v11;
    }
    else {
      BOOL v31 = 1;
    }
    if (v31) {
      goto LABEL_63;
    }
LABEL_60:
    uint64_t v17 = *(uint64_t **)(v27[2] + 8 * (*(void *)v27[2] == (void)v27));
  }
  if (!*((unsigned char *)v17 + 24))
  {
    *((unsigned char *)v17 + 24) = 1;
    *(unsigned char *)(v22 + 24) = 0;
    CFComparisonResult v23 = *(uint64_t **)(v22 + 8);
    uint64_t v24 = *v23;
    *(void *)(v22 + 8) = *v23;
    if (v24) {
      *(void *)(v24 + 16) = v22;
    }
    v23[2] = *(void *)(v22 + 16);
    *(void *)(*(void *)(v22 + 16) + 8 * (**(void **)(v22 + 16) != v22)) = v23;
    uint64_t *v23 = v22;
    *(void *)(v22 + 16) = v23;
    if (v11 == (uint64_t *)*v17) {
      int v11 = v17;
    }
    uint64_t v17 = *(uint64_t **)(*v17 + 8);
  }
  CFStringRef v25 = (void *)*v17;
  if (!*v17 || *((unsigned char *)v25 + 24))
  {
    CFAllocatorRef v26 = (uint64_t *)v17[1];
    if (v26 && !*((unsigned char *)v26 + 24)) {
      goto LABEL_69;
    }
    *((unsigned char *)v17 + 24) = 0;
    uint64_t v27 = (uint64_t *)v17[2];
    if (v27 == v11)
    {
      uint64_t v27 = v11;
LABEL_63:
      *((unsigned char *)v27 + 24) = 1;
      goto LABEL_83;
    }
    if (!*((unsigned char *)v27 + 24)) {
      goto LABEL_63;
    }
    goto LABEL_60;
  }
  CFAllocatorRef v26 = (uint64_t *)v17[1];
  if (v26 && !*((unsigned char *)v26 + 24))
  {
LABEL_69:
    CFStringRef v25 = v17;
  }
  else
  {
    *((unsigned char *)v25 + 24) = 1;
    *((unsigned char *)v17 + 24) = 0;
    uint64_t v32 = v25[1];
    *uint64_t v17 = v32;
    if (v32) {
      *(void *)(v32 + 16) = v17;
    }
    v25[2] = v17[2];
    *(void *)(v17[2] + 8 * (*(void *)v17[2] != (void)v17)) = v25;
    v25[1] = v17;
    v17[2] = (uint64_t)v25;
    CFAllocatorRef v26 = v17;
  }
  uint64_t v33 = v25[2];
  *((unsigned char *)v25 + 24) = *(unsigned char *)(v33 + 24);
  *(unsigned char *)(v33 + 24) = 1;
  *((unsigned char *)v26 + 24) = 1;
  CFStringRef v34 = *(uint64_t **)(v33 + 8);
  uint64_t v35 = *v34;
  *(void *)(v33 + 8) = *v34;
  if (v35) {
    *(void *)(v35 + 16) = v33;
  }
  v34[2] = *(void *)(v33 + 16);
  *(void *)(*(void *)(v33 + 16) + 8 * (**(void **)(v33 + 16) != v33)) = v34;
  *CFStringRef v34 = v33;
LABEL_82:
  *(void *)(v33 + 16) = v34;
LABEL_83:
  if (*((char *)v6 + 55) < 0) {
    operator delete((void *)v6[4]);
  }
  operator delete(v7);
LABEL_86:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_10000DE88(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  unint64_t v3 = *(void *)(v1 + 8);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2) {
    BOOL v4 = (*(void *)(v1 + 16) & 1 | v3) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = v4;
  if ((uint64_t (*)(void *))v3 == sub_10000DF8C && v5 != 0)
  {
    std::string::size_type v7 = (void *)(v1 + (v2 >> 1));
    if (v2) {
      (*(void (**)(void *, void))(*v7 + sub_10000DF8C))(v7, 0);
    }
    else {
      ((void (*)(void *, void))sub_10000DF8C)(v7, 0);
    }
  }
  _Block_release(*(const void **)v1);

  operator delete();
}

void sub_10000DF50(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_10000DF8C(void *a1)
{
  a1[1] = sub_10000DFB0;
  a1[2] = 0;
  return (*(uint64_t (**)(void))(*a1 + 16))();
}

uint64_t sub_10000DFB0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 16))();
}

BOOL sub_10000DFC0(void *a1, void *a2)
{
  int v2 = *((char *)a2 + 23);
  int v3 = *((char *)a1 + 23);
  if (v3 >= 0) {
    size_t v4 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v4 = a1[1];
  }
  if (v3 < 0) {
    a1 = (void *)*a1;
  }
  if (v2 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = a2[1];
  }
  if (v2 < 0) {
    a2 = (void *)*a2;
  }
  if (v5 >= v4) {
    size_t v6 = v4;
  }
  else {
    size_t v6 = v5;
  }
  int v7 = memcmp(a1, a2, v6);
  if (v7) {
    return v7 < 0;
  }
  else {
    return v4 < v5;
  }
}

void sub_10000E02C(uint64_t a1)
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  int v3 = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%f", *(void *)&Current);
  if (v3)
  {
    size_t v4 = v3;
    values = v3;
    CFArrayRef v5 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1, &kCFTypeArrayCallBacks);
    if (!v5)
    {
LABEL_12:
      CFRelease(v4);
      return;
    }
    size_t v6 = (const char *)(a1 + 32);
    if (*(char *)(a1 + 55) < 0) {
      size_t v6 = *(const char **)v6;
    }
    CFStringRef v7 = CFStringCreateWithCString(0, v6, 0x8000100u);
    int v8 = SCDynamicStoreSetValue(*(SCDynamicStoreRef *)a1, v7, v5);
    BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v9)
      {
        *(_DWORD *)objc_super buf = 138412546;
        CFStringRef v12 = v7;
        __int16 v13 = 2112;
        CFStreamClientContext v14 = v4;
        CFStringRef v10 = "Added lastPurgeTime k-v pair to SCDynamicStore <Key=%@, Value=%@>";
        goto LABEL_15;
      }
    }
    else if (v9)
    {
      *(_DWORD *)objc_super buf = 138412546;
      CFStringRef v12 = v7;
      __int16 v13 = 2112;
      CFStreamClientContext v14 = v4;
      CFStringRef v10 = "Failed to add lastPurgeTime k-v pair to SCDynamicStore <Key=%@, Value=%@>";
LABEL_15:
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v10, buf, 0x16u);
      if (!v7) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (!v7)
    {
LABEL_11:
      CFRelease(v5);
      goto LABEL_12;
    }
LABEL_10:
    CFRelease(v7);
    goto LABEL_11;
  }
}

void sub_10000E1D0(_Unwind_Exception *a1)
{
  if (v3) {
    CFRelease(v3);
  }
  CFRelease(v2);
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_10000E208(SCDynamicStoreRef *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v21 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Purging dynamic store", v21, 2u);
  }
  int v2 = getenv("CFNETWORKAGENT_KEY_SPACE_ROOT");
  if (v2) {
    int v3 = v2;
  }
  else {
    int v3 = "com\\.apple\\.CFNetwork\\.netcompat";
  }
  size_t v4 = (std::string *)sub_100009438(v21, v3);
  std::string::append(v4, ".*");
  if (v22 >= 0) {
    CFArrayRef v5 = v21;
  }
  else {
    CFArrayRef v5 = *(uint8_t **)v21;
  }
  CFStringRef v6 = CFStringCreateWithCString(0, (const char *)v5, 0x8000100u);
  Mutable = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
  CFArrayAppendValue(Mutable, v6);
  CFDictionaryRef v8 = SCDynamicStoreCopyMultiple(*a1, 0, Mutable);
  CFDictionaryRef v9 = v8;
  if (v8)
  {
    CFIndex Count = CFDictionaryGetCount(v8);
    if (Count >= 1)
    {
      __chkstk_darwin();
      CFStringRef v12 = (const void **)&v21[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0) - 16];
      if (v11 >= 0x200) {
        size_t v13 = 512;
      }
      else {
        size_t v13 = v11;
      }
      bzero(&v21[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0) - 16], v13);
      CFDictionaryGetKeysAndValues(v9, v12, 0);
      *(void *)&long long v14 = 138412290;
      long long v20 = v14;
      while (1)
      {
        int v15 = SCDynamicStoreRemoveValue(*a1, (CFStringRef)*v12);
        BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
        if (v15)
        {
          if (v16)
          {
            uint64_t v17 = *v12;
            *(_DWORD *)objc_super buf = v20;
            uint64_t v24 = v17;
            int v18 = "Removed %@ from dynamic store:";
LABEL_22:
            _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v18, buf, 0xCu);
          }
        }
        else if (v16)
        {
          uint64_t v19 = *v12;
          *(_DWORD *)objc_super buf = v20;
          uint64_t v24 = v19;
          int v18 = "Did NOT Remove %@ from dynamic store:";
          goto LABEL_22;
        }
        ++v12;
        if (!--Count)
        {
          sub_10000E02C((uint64_t)a1);
          goto LABEL_25;
        }
      }
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)objc_super buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Unable to get keys from dynamic store for removal!", buf, 2u);
  }
LABEL_25:
  if (v9) {
    CFRelease(v9);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v22 < 0) {
    operator delete(*(void **)v21);
  }
}

void sub_10000E4F0(_Unwind_Exception *exception_object)
{
  if (v2) {
    CFRelease(v2);
  }
  if (v1) {
    CFRelease(v1);
  }
  if (*(char *)(v3 - 121) < 0) {
    operator delete(*(void **)(v3 - 144));
  }
  _Unwind_Resume(exception_object);
}

void sub_10000E558(__CFError *a1)
{
  if (a1)
  {
    int v2 = (char *)malloc_type_malloc(0x80uLL, 0x100004077774924uLL);
    CFStringRef Domain = CFErrorGetDomain(a1);
    CFStringGetCString(Domain, v2, 128, 0x8000100u);
    size_t v4 = __stderrp;
    CFIndex Code = CFErrorGetCode(a1);
    fprintf(v4, "CFERROR: {Domain:%s, Code:%ld}", v2, Code);
    if (v2)
    {
      free(v2);
    }
  }
}

uint64_t sub_10000E618(int *a1)
{
  int check = 0;
  uint32_t v2 = notify_check(*a1, &check);
  int v3 = check;
  if (notify_check(a1[1], &check)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = check == 0;
  }
  unsigned int v5 = !v4;
  if (v2) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v3 == 0;
  }
  if (v6) {
    return v5;
  }
  else {
    return 1;
  }
}

CFStringRef sub_10000E688()
{
  return @"BaseQuery";
}

void sub_10000E69C(std::string *__dst, uint64_t a2, uint64_t a3)
{
  if (*(char *)(a2 + 23) < 0)
  {
    sub_100009298(__dst, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&__dst->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    __dst->__r_.__value_.__r.__words[2] = *(void *)(a2 + 16);
  }
  std::string::append(__dst, "_");
  std::to_string(&v7, a3);
  if ((v7.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unsigned int v5 = &v7;
  }
  else {
    unsigned int v5 = (std::string *)v7.__r_.__value_.__r.__words[0];
  }
  if ((v7.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v7.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v7.__r_.__value_.__l.__size_;
  }
  std::string::append(__dst, (const std::string::value_type *)v5, size);
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v7.__r_.__value_.__l.__data_);
  }
}

void sub_10000E74C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000E784(uint64_t a1, long long *a2, dispatch_object_t object)
{
  *(void *)a1 = off_100014FC0;
  *(_OWORD *)(a1 + 8) = 0u;
  unsigned int v5 = (uint64_t *)(a1 + 8);
  *(_OWORD *)(a1 + 24) = 0u;
  uint64_t v6 = a1 + 24;
  *(void *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 48) = 1;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  if (*((char *)a2 + 23) < 0)
  {
    sub_100009298(&v9, *(void **)a2, *((void *)a2 + 1));
    if (*(char *)(a1 + 47) < 0) {
      operator delete(*(void **)v6);
    }
  }
  else
  {
    long long v9 = *a2;
    uint64_t v10 = *((void *)a2 + 2);
  }
  *(_OWORD *)uint64_t v6 = v9;
  *(void *)(v6 + 16) = v10;
  if (object)
  {
    dispatch_retain(object);
    uint64_t v7 = *v5;
    *unsigned int v5 = (uint64_t)object;
    if (v7) {
      (*(void (**)(void))(a1 + 16))();
    }
    *(void *)(a1 + 16) = sub_10000E8D0;
  }
  return a1;
}

void sub_10000E878(_Unwind_Exception *exception_object)
{
  unsigned int v5 = *(std::__shared_weak_count **)(v1 + 64);
  if (v5) {
    sub_100005F20(v5);
  }
  if (*(char *)(v1 + 47) < 0) {
    operator delete(*v3);
  }
  uint64_t v6 = *v2;
  *uint32_t v2 = 0;
  if (v6) {
    (*(void (**)(void))(v1 + 16))();
  }
  *(void *)uint64_t v1 = off_100014D90;
  _Unwind_Resume(exception_object);
}

void sub_10000E8D0(dispatch_object_t object)
{
  if (object) {
    dispatch_release(object);
  }
}

uint64_t sub_10000E8DC(uint64_t a1)
{
  *(void *)a1 = off_100014FC0;
  uint32_t v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (v2) {
    sub_100005F20(v2);
  }
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  uint64_t v3 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = 0;
  if (v3) {
    (*(void (**)(void))(a1 + 16))();
  }
  *(void *)a1 = off_100014D90;
  return a1;
}

uint64_t sub_10000E968(void *a1)
{
  uint64_t v2 = a1[7];
  if (v2)
  {
    uint64_t v3 = *(void (**)(void *, void *))(v2 + 8);
    uint64_t v4 = *(void *)(v2 + 16);
    unsigned int v5 = (void *)(v2 + (v4 >> 1));
    if (v4) {
      uint64_t v3 = *(void (**)(void *, void *))(*v5 + v3);
    }
    v3(v5, a1);
  }
  uint64_t v6 = *(uint64_t (**)(void *))(*a1 + 8);

  return v6(a1);
}

JSValueRef sub_10000E9EC(const OpaqueJSContext *a1)
{
  JSValueRef Null = JSValueMakeNull(a1);
  SCDynamicStoreRef v3 = SCDynamicStoreCreate(kCFAllocatorDefault, @"JSEvaluator", 0, 0);
  if (v3)
  {
    uint64_t v4 = v3;
    CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, kSCEntNetIPv4);
    if (!NetworkGlobalEntity) {
      goto LABEL_12;
    }
    CFStringRef v6 = NetworkGlobalEntity;
    CFDictionaryRef v7 = (const __CFDictionary *)SCDynamicStoreCopyValue(v4, NetworkGlobalEntity);
    CFRelease(v6);
    if (!v7) {
      goto LABEL_12;
    }
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v7, kSCDynamicStorePropNetPrimaryInterface);
    if (!Value)
    {
      CFRelease(v7);
      goto LABEL_12;
    }
    CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, Value, kSCEntNetIPv4);
    CFRelease(v7);
    if (!NetworkInterfaceEntity)
    {
LABEL_12:
      CFRelease(v4);
      return Null;
    }
    CFPropertyListRef v10 = SCDynamicStoreCopyValue(v4, NetworkInterfaceEntity);
    CFRelease(v4);
    CFRelease(NetworkInterfaceEntity);
    if (v10)
    {
      CFTypeID v11 = CFGetTypeID(v10);
      if (v11 != CFDictionaryGetTypeID())
      {
        uint64_t v4 = (const __SCDynamicStore *)v10;
        goto LABEL_12;
      }
      uint64_t v4 = (const __SCDynamicStore *)CFDictionaryGetValue((CFDictionaryRef)v10, @"Addresses");
      CFRetain(v4);
      CFRelease(v10);
      if (v4)
      {
        JSValueRef Null = sub_10000EB74(kCFAllocatorDefault, a1, v4);
        goto LABEL_12;
      }
    }
  }
  return Null;
}

JSValueRef sub_10000EB74(const __CFAllocator *a1, const OpaqueJSContext *a2, CFArrayRef theArray)
{
  CFStringRef v6 = CFStringCreateByCombiningStrings(a1, theArray, @"\", \"");
  if (CFArrayGetCount(theArray) < 1) {
    CFStringRef v7 = (const __CFString *)CFRetain(@"[ ]");
  }
  else {
    CFStringRef v7 = CFStringCreateWithFormat(a1, 0, @"[ \"%@\" ]", v6);
  }
  CFStringRef v8 = v7;
  long long v9 = JSStringCreateWithCFString(v7);
  if (v6) {
    CFRelease(v6);
  }
  if (v8) {
    CFRelease(v8);
  }
  JSValueRef v10 = JSEvaluateScript(a2, v9, 0, 0, 0, 0);
  JSStringRelease(v9);
  return v10;
}

JSValueRef sub_10000EC48(const OpaqueJSContext *a1, JSObjectRef object, uint64_t a3, uint64_t a4, JSValueRef *a5)
{
  Private = JSObjectGetPrivate(object);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PAC performing DNS resolution", buf, 2u);
  }
  JSValueRef Null = JSValueMakeNull(a1);
  if (a4 == 1 && JSValueIsString(a1, *a5))
  {
    JSValueRef v10 = JSValueToStringCopy(a1, *a5, 0);
    CFStringRef v11 = JSStringCopyCFString(kCFAllocatorDefault, v10);
    CFStringRef v12 = v11;
    if (Private)
    {
      CFStringRef v13 = *(const __CFString **)Private;
      CFDataRef v14 = (const __CFData *)*((void *)Private + 1);
    }
    else
    {
      CFStringRef v13 = 0;
      CFDataRef v14 = 0;
    }
    uint64_t v48 = 0;
    uint64_t v49 = &v48;
    uint64_t v50 = 0x2020000000;
    uint64_t v51 = 0;
    *(void *)objc_super buf = kCFAllocatorDefault;
    uint64_t v58 = 1023;
    if (v11)
    {
      uint64_t v15 = sub_100009CE4(kCFAllocatorDefault, v11, v60, &v58);
    }
    else
    {
      v60[0] = 0;
      uint64_t v58 = 0;
      uint64_t v15 = v60;
    }
    uint64_t v59 = v15;
    host_with_numeric_port = (void *)nw_endpoint_create_host_with_numeric_port();
    nw_parameters_t v17 = nw_parameters_create();
    nw_parameters_set_allow_unusable_addresses();
    nw_parameters_set_prohibit_encrypted_dns();
    if (v13)
    {
      CFAllocatorRef allocator = kCFAllocatorDefault;
      p_CFAllocatorRef allocator = 1023;
      ptr = sub_100009CE4(kCFAllocatorDefault, v13, (UInt8 *)v55, &p_allocator);
      nw_parameters_set_source_application_by_bundle_id();
      if (ptr)
      {
        if (v55 != ptr) {
          CFAllocatorDeallocate(allocator, ptr);
        }
      }
    }
    if (v14)
    {
      BytePtr = CFDataGetBytePtr(v14);
      if (BytePtr)
      {
        long long v19 = *((_OWORD *)BytePtr + 1);
        long long v46 = *(_OWORD *)BytePtr;
        long long v47 = v19;
        nw_parameters_set_source_application();
      }
    }
    evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
    uint64_t v21 = (void *)nw_path_evaluator_copy_path();
    CFAllocatorRef allocator = 0;
    p_CFAllocatorRef allocator = (uint64_t)&allocator;
    ptr = (void *)0x3812000000;
    v55[0] = sub_10000F310;
    v55[1] = sub_10000F320;
    v55[2] = 0;
    uint64_t v56 = (void *)nw_resolver_create_with_path();
    uint64_t v39 = 0;
    uint64_t v40 = &v39;
    uint64_t v41 = 0x3812000000;
    unint64_t v42 = sub_10000F338;
    long long v43 = sub_10000F348;
    uint64_t v44 = 0;
    dispatch_object_t objecta = dispatch_semaphore_create(0);
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x3812000000;
    uint64_t v35 = sub_10000F360;
    uint64_t v37 = 0;
    obj = 0;
    uint64_t v36 = sub_10000F370;
    if (qword_100018918 != -1) {
      dispatch_once(&qword_100018918, &stru_100015030);
    }
    nw_resolver_set_update_handler();
    dispatch_semaphore_wait((dispatch_semaphore_t)v40[6], 0xFFFFFFFFFFFFFFFFLL);
    if (v33[6] && nw_array_get_count())
    {
      CFIndex count = nw_array_get_count();
      CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, count, &kCFTypeArrayCallBacks);
      v49[3] = (uint64_t)Mutable;
      nw_array_apply();
      CFIndex v24 = CFArrayGetCount((CFArrayRef)v49[3]);
      CFStringRef v25 = v49;
      if (!v24)
      {
        CFAllocatorRef v26 = (const void *)v49[3];
        if (v26)
        {
          CFRelease(v26);
          CFStringRef v25 = v49;
        }
        v25[3] = 0;
      }
    }
    else
    {
      CFStringRef v25 = v49;
    }
    CFArrayRef v27 = (const __CFArray *)v25[3];
    _Block_object_dispose(&v32, 8);
    uint64_t v28 = obj;
    obj = 0;
    if (v28) {
      nw_release(v28);
    }
    _Block_object_dispose(&v39, 8);
    id v29 = objecta;
    dispatch_object_t objecta = 0;
    if (v29) {
      dispatch_release(v29);
    }
    _Block_object_dispose(&allocator, 8);
    uint64_t v30 = v56;
    uint64_t v56 = 0;
    if (v30) {
      nw_release(v30);
    }
    if (v21) {
      nw_release(v21);
    }
    if (evaluator_for_endpoint) {
      nw_release(evaluator_for_endpoint);
    }
    if (v17) {
      nw_release(v17);
    }
    if (host_with_numeric_port) {
      nw_release(host_with_numeric_port);
    }
    if (v59 && v60 != v59) {
      CFAllocatorDeallocate(*(CFAllocatorRef *)buf, v59);
    }
    _Block_object_dispose(&v48, 8);
    if (v12) {
      CFRelease(v12);
    }
    if (v27)
    {
      JSValueRef Null = sub_10000EB74(kCFAllocatorDefault, a1, v27);
      CFRelease(v27);
    }
    JSStringRelease(v10);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PAC returned from DNS resolution", buf, 2u);
  }
  return Null;
}

void sub_10000F1DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *obj,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,dispatch_object_t object,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  if (v43) {
    nw_release(v43);
  }
  if (v42) {
    nw_release(v42);
  }
  uint64_t v45 = (void *)STACK[0x550];
  if (STACK[0x550])
  {
    if ((void *)a10 != v45) {
      CFAllocatorDeallocate((CFAllocatorRef)STACK[0x540], v45);
    }
  }
  _Block_object_dispose(&a42, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000F310(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0;
  *(void *)(result + 48) = v2;
  return result;
}

void sub_10000F320(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = 0;
  if (v2) {
    nw_release(v2);
  }
}

uint64_t sub_10000F338(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0;
  *(void *)(result + 48) = v2;
  return result;
}

void sub_10000F348(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 48);
  *(void *)(a1 + 48) = 0;
  if (v2) {
    dispatch_release(v2);
  }
}

uint64_t sub_10000F360(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0;
  *(void *)(result + 48) = v2;
  return result;
}

void sub_10000F370(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = 0;
  if (v2) {
    nw_release(v2);
  }
}

intptr_t sub_10000F388(intptr_t result, int a2, void *obj)
{
  if (a2 == 2)
  {
    uint64_t v5 = result;
    if (obj)
    {
      nw_retain(obj);
      uint64_t v6 = *(void *)(*(void *)(v5 + 32) + 8);
      CFStringRef v7 = *(void **)(v6 + 48);
      *(void *)(v6 + 48) = obj;
      if (v7) {
        nw_release(v7);
      }
    }
    nw_resolver_cancel();
    CFStringRef v8 = *(NSObject **)(*(void *)(*(void *)(v5 + 48) + 8) + 48);
    return dispatch_semaphore_signal(v8);
  }
  return result;
}

uint64_t sub_10000F408(uint64_t a1, int a2, nw_endpoint_t endpoint)
{
  uint64_t v4 = nw_endpoint_copy_address_string(endpoint);
  if (v4)
  {
    uint64_t v5 = v4;
    CFStringRef v6 = CFStringCreateWithCString(kCFAllocatorDefault, v4, 0x8000100u);
    CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v6);
    free(v5);
    if (v6) {
      CFRelease(v6);
    }
  }
  return 1;
}

void sub_10000F48C(_Unwind_Exception *exception_object)
{
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000F4A4(id a1)
{
  uint64_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  qword_100018920 = (uint64_t)dispatch_queue_create("com.apple.cfnetwork.pac.resolver", v1);
}

void sub_10000F4DC(id a1)
{
  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.CFNetwork");
  CFURLRef v2 = CFBundleCopyResourceURL(BundleWithIdentifier, @"PACSupport", @"js", 0);
  if (v2)
  {
    CFURLRef v3 = v2;
    uint64_t v4 = CFReadStreamCreateWithFile(0, v2);
    CFRelease(v3);
    if (v4)
    {
      CFMutableDataRef Mutable = CFDataCreateMutable(0, 0);
      CFAbsoluteTime Current = CFRunLoopGetCurrent();
      clientContext.version = 0;
      clientContext.info = Mutable;
      memset(&clientContext.retain, 0, 24);
      CFReadStreamSetClient(v4, 0x1AuLL, (CFReadStreamClientCallBack)sub_10000F758, &clientContext);
      CFReadStreamScheduleWithRunLoop(v4, Current, @"_kProxySupportLoadingPacPrivateMode");
      if (CFReadStreamOpen(v4))
      {
        char v15 = 0;
        context.version = 0;
        context.info = &v15;
        memset(&context.retain, 0, 24);
        CFAllocatorRef v7 = CFGetAllocator(v4);
        CFAbsoluteTime v8 = CFAbsoluteTimeGetCurrent();
        long long v9 = CFRunLoopTimerCreate(v7, v8 + 30.0, 0.0, 0, 0, (CFRunLoopTimerCallBack)sub_10000F74C, &context);
        if (v9) {
          CFRunLoopAddTimer(Current, v9, @"_kProxySupportLoadingPacPrivateMode");
        }
        do
        {
          if ((CFReadStreamGetStatus(v4) & 0xFFFFFFFFFFFFFFFDLL) == 5) {
            break;
          }
          CFRunLoopRunInMode(@"_kProxySupportLoadingPacPrivateMode", 1.0e20, 1u);
        }
        while (!v15);
        if (v9)
        {
          CFRunLoopRemoveTimer(Current, v9, @"_kProxySupportLoadingPacPrivateMode");
          CFRelease(v9);
        }
        if (CFReadStreamGetError(v4).error || v15)
        {
          CFIndex Length = CFDataGetLength(Mutable);
          if (Length)
          {
            v17.length = Length;
            v17.CFIndex location = 0;
            CFDataDeleteBytes(Mutable, v17);
          }
        }
        CFReadStreamClose(v4);
      }
      else
      {
        CFReadStreamGetError(v4);
      }
      CFReadStreamUnscheduleFromRunLoop(v4, Current, @"_kProxySupportLoadingPacPrivateMode");
      CFReadStreamSetClient(v4, 0, 0, 0);
      CFRelease(v4);
      CFIndex v11 = CFDataGetLength(Mutable);
      if (v11)
      {
        CFIndex v12 = v11;
        BytePtr = CFDataGetBytePtr(Mutable);
        qword_100018908 = (uint64_t)CFStringCreateWithBytes(0, BytePtr, v12, 0x8000100u, 1u);
      }
      if (Mutable) {
        CFRelease(Mutable);
      }
    }
  }
}

void sub_10000F74C(uint64_t a1, unsigned char *a2)
{
  *a2 = 1;
}

void sub_10000F758()
{
  uint64_t v0 = __chkstk_darwin();
  if (v1 == 16 || v1 == 8)
  {
    CFAbsoluteTime Current = CFRunLoopGetCurrent();
    CFRunLoopStop(Current);
  }
  else if (v1 == 2)
  {
    CFURLRef v3 = v2;
    uint64_t v4 = (__CFReadStream *)v0;
    while (CFReadStreamHasBytesAvailable(v4))
    {
      CFIndex v5 = CFReadStreamRead(v4, buffer, 4096);
      CFDataAppendBytes(v3, buffer, v5);
    }
  }
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return _CFAllocatorAllocate(allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return _CFBundleCopyResourceURL(bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return _CFBundleGetBundleWithIdentifier(bundleID);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFCharacterSetCreateWithCharactersInString(alloc, theString);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return _CFCharacterSetGetPredefined(theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return _CFCharacterSetIsCharacterMember(theSet, theChar);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
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

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
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

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return _CFGetAllocator(cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

Boolean CFHTTPMessageAppendBytes(CFHTTPMessageRef message, const UInt8 *newBytes, CFIndex numBytes)
{
  return _CFHTTPMessageAppendBytes(message, newBytes, numBytes);
}

CFDataRef CFHTTPMessageCopyBody(CFHTTPMessageRef message)
{
  return _CFHTTPMessageCopyBody(message);
}

CFStringRef CFHTTPMessageCopyHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField)
{
  return _CFHTTPMessageCopyHeaderFieldValue(message, headerField);
}

CFDataRef CFHTTPMessageCopySerializedMessage(CFHTTPMessageRef message)
{
  return _CFHTTPMessageCopySerializedMessage(message);
}

CFHTTPMessageRef CFHTTPMessageCreateEmpty(CFAllocatorRef alloc, Boolean isRequest)
{
  return _CFHTTPMessageCreateEmpty(alloc, isRequest);
}

CFHTTPMessageRef CFHTTPMessageCreateRequest(CFAllocatorRef alloc, CFStringRef requestMethod, CFURLRef url, CFStringRef httpVersion)
{
  return _CFHTTPMessageCreateRequest(alloc, requestMethod, url, httpVersion);
}

CFIndex CFHTTPMessageGetResponseStatusCode(CFHTTPMessageRef response)
{
  return _CFHTTPMessageGetResponseStatusCode(response);
}

Boolean CFHTTPMessageIsHeaderComplete(CFHTTPMessageRef message)
{
  return _CFHTTPMessageIsHeaderComplete(message);
}

void CFHTTPMessageSetBody(CFHTTPMessageRef message, CFDataRef bodyData)
{
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
}

CFHostRef CFHostCreateWithName(CFAllocatorRef allocator, CFStringRef hostname)
{
  return _CFHostCreateWithName(allocator, hostname);
}

uint64_t CFNetworkDiagnosticLevel()
{
  return _CFNetworkDiagnosticLevel();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFErrorRef CFReadStreamCopyError(CFReadStreamRef stream)
{
  return _CFReadStreamCopyError(stream);
}

CFTypeRef CFReadStreamCopyProperty(CFReadStreamRef stream, CFStreamPropertyKey propertyName)
{
  return _CFReadStreamCopyProperty(stream, propertyName);
}

CFReadStreamRef CFReadStreamCreateForHTTPRequest(CFAllocatorRef alloc, CFHTTPMessageRef request)
{
  return _CFReadStreamCreateForHTTPRequest(alloc, request);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return _CFReadStreamCreateWithFile(alloc, fileURL);
}

CFStreamError CFReadStreamGetError(CFReadStreamRef stream)
{
  CFStreamError Error = _CFReadStreamGetError(stream);
  uint64_t v2 = *(CFIndex *)&Error.error;
  CFIndex domain = Error.domain;
  result.CFErrorRef error = v2;
  result.CFIndex domain = domain;
  return result;
}

CFStreamStatus CFReadStreamGetStatus(CFReadStreamRef stream)
{
  return _CFReadStreamGetStatus(stream);
}

Boolean CFReadStreamHasBytesAvailable(CFReadStreamRef stream)
{
  return _CFReadStreamHasBytesAvailable(stream);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return _CFReadStreamOpen(stream);
}

CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8 *buffer, CFIndex bufferLength)
{
  return _CFReadStreamRead(stream, buffer, bufferLength);
}

void CFReadStreamScheduleWithRunLoop(CFReadStreamRef stream, CFRunLoopRef runLoop, CFRunLoopMode runLoopMode)
{
}

Boolean CFReadStreamSetClient(CFReadStreamRef stream, CFOptionFlags streamEvents, CFReadStreamClientCallBack clientCB, CFStreamClientContext *clientContext)
{
  return _CFReadStreamSetClient(stream, streamEvents, clientCB, clientContext);
}

void CFReadStreamSetDispatchQueue(CFReadStreamRef stream, dispatch_queue_t q)
{
}

Boolean CFReadStreamSetProperty(CFReadStreamRef stream, CFStreamPropertyKey propertyName, CFTypeRef propertyValue)
{
  return _CFReadStreamSetProperty(stream, propertyName, propertyValue);
}

void CFReadStreamUnscheduleFromRunLoop(CFReadStreamRef stream, CFRunLoopRef runLoop, CFRunLoopMode runLoopMode)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRemoveTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return _CFRunLoopTimerCreate(allocator, fireDate, interval, flags, order, callout, context);
}

void CFStreamCreatePairWithSocketToCFHost(CFAllocatorRef alloc, CFHostRef host, SInt32 port, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString)
{
  return _CFStringConvertIANACharSetNameToEncoding(theString);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return _CFStringCreateArrayBySeparatingStrings(alloc, theString, separatorString);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return _CFStringCreateByCombiningStrings(alloc, theArray, separatorString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
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

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return _CFStringCreateWithSubstring(alloc, str, range);
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

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return _CFStringFindCharacterFromSet(theString, theSet, rangeToSearch, searchOptions, result);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return _CFStringFindWithOptions(theString, stringToFind, rangeToSearch, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return _CFStringGetCharacterAtIndex(theString, idx);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  return _CFStringGetDoubleValue(str);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return _CFStringGetIntValue(str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return _CFURLCopyAbsoluteURL(relativeURL);
}

CFStringRef CFURLCopyHostName(CFURLRef anURL)
{
  return _CFURLCopyHostName(anURL);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return _CFURLCopyScheme(anURL);
}

CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return _CFURLCreateWithBytes(allocator, URLBytes, length, encoding, baseURL);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return _CFURLCreateWithString(allocator, URLString, baseURL);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return _CFURLGetString(anURL);
}

uint64_t CFURLResponseGetHTTPResponse()
{
  return _CFURLResponseGetHTTPResponse();
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFErrorRef CFWriteStreamCopyError(CFWriteStreamRef stream)
{
  return _CFWriteStreamCopyError(stream);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return _CFWriteStreamOpen(stream);
}

Boolean CFWriteStreamSetClient(CFWriteStreamRef stream, CFOptionFlags streamEvents, CFWriteStreamClientCallBack clientCB, CFStreamClientContext *clientContext)
{
  return _CFWriteStreamSetClient(stream, streamEvents, clientCB, clientContext);
}

void CFWriteStreamSetDispatchQueue(CFWriteStreamRef stream, dispatch_queue_t q)
{
}

CFIndex CFWriteStreamWrite(CFWriteStreamRef stream, const UInt8 *buffer, CFIndex bufferLength)
{
  return _CFWriteStreamWrite(stream, buffer, bufferLength);
}

BOOL JSCheckScriptSyntax(JSContextRef ctx, JSStringRef script, JSStringRef sourceURL, int startingLineNumber, JSValueRef *exception)
{
  return _JSCheckScriptSyntax(ctx, script, sourceURL, startingLineNumber, exception);
}

JSClassRef JSClassCreate(const JSClassDefinition *definition)
{
  return _JSClassCreate(definition);
}

void JSClassRelease(JSClassRef jsClass)
{
}

JSObjectRef JSContextGetGlobalObject(JSContextRef ctx)
{
  return _JSContextGetGlobalObject(ctx);
}

JSValueRef JSEvaluateScript(JSContextRef ctx, JSStringRef script, JSObjectRef thisObject, JSStringRef sourceURL, int startingLineNumber, JSValueRef *exception)
{
  return _JSEvaluateScript(ctx, script, thisObject, sourceURL, startingLineNumber, exception);
}

JSGlobalContextRef JSGlobalContextCreateInGroup(JSContextGroupRef group, JSClassRef globalObjectClass)
{
  return _JSGlobalContextCreateInGroup(group, globalObjectClass);
}

void JSGlobalContextRelease(JSGlobalContextRef ctx)
{
}

JSValueRef JSObjectCallAsFunction(JSContextRef ctx, JSObjectRef object, JSObjectRef thisObject, size_t argumentCount, const JSValueRef arguments[], JSValueRef *exception)
{
  return _JSObjectCallAsFunction(ctx, object, thisObject, argumentCount, arguments, exception);
}

void *__cdecl JSObjectGetPrivate(JSObjectRef object)
{
  return _JSObjectGetPrivate(object);
}

JSValueRef JSObjectGetProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef *exception)
{
  return _JSObjectGetProperty(ctx, object, propertyName, exception);
}

BOOL JSObjectIsFunction(JSContextRef ctx, JSObjectRef object)
{
  return _JSObjectIsFunction(ctx, object);
}

JSObjectRef JSObjectMake(JSContextRef ctx, JSClassRef jsClass, void *data)
{
  return _JSObjectMake(ctx, jsClass, data);
}

JSObjectRef JSObjectMakeFunctionWithCallback(JSContextRef ctx, JSStringRef name, JSObjectCallAsFunctionCallback callAsFunction)
{
  return _JSObjectMakeFunctionWithCallback(ctx, name, callAsFunction);
}

BOOL JSObjectSetPrivate(JSObjectRef object, void *data)
{
  return _JSObjectSetPrivate(object, data);
}

void JSObjectSetProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef value, JSPropertyAttributes attributes, JSValueRef *exception)
{
}

CFStringRef JSStringCopyCFString(CFAllocatorRef alloc, JSStringRef string)
{
  return _JSStringCopyCFString(alloc, string);
}

JSStringRef JSStringCreateWithCFString(CFStringRef string)
{
  return _JSStringCreateWithCFString(string);
}

void JSStringRelease(JSStringRef string)
{
}

BOOL JSValueIsObject(JSContextRef ctx, JSValueRef value)
{
  return _JSValueIsObject(ctx, value);
}

BOOL JSValueIsString(JSContextRef ctx, JSValueRef value)
{
  return _JSValueIsString(ctx, value);
}

JSValueRef JSValueMakeNull(JSContextRef ctx)
{
  return _JSValueMakeNull(ctx);
}

JSValueRef JSValueMakeString(JSContextRef ctx, JSStringRef string)
{
  return _JSValueMakeString(ctx, string);
}

JSStringRef JSValueToStringCopy(JSContextRef ctx, JSValueRef value, JSValueRef *exception)
{
  return _JSValueToStringCopy(ctx, value, exception);
}

CFDictionaryRef SCDynamicStoreCopyMultiple(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreCopyMultiple(store, keys, patterns);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return _SCDynamicStoreCopyValue(store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

SCDynamicStoreRef SCDynamicStoreCreateWithOptions(CFAllocatorRef allocator, CFStringRef name, CFDictionaryRef storeOptions, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreateWithOptions(allocator, name, storeOptions, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkGlobalEntity(allocator, domain, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkInterfaceEntity(allocator, domain, ifname, entity);
}

Boolean SCDynamicStoreRemoveValue(SCDynamicStoreRef store, CFStringRef key)
{
  return _SCDynamicStoreRemoveValue(store, key);
}

Boolean SCDynamicStoreSetValue(SCDynamicStoreRef store, CFStringRef key, CFPropertyListRef value)
{
  return _SCDynamicStoreSetValue(store, key, value);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFHTTPMessageSetResponseURL()
{
  return __CFHTTPMessageSetResponseURL();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return std::string::operator=(this, __str);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return std::__shared_weak_count::lock(this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return std::to_string(retstr, __val);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
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

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
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

void dispatch_retain(dispatch_object_t object)
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

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_check(int token, int *check)
{
  return _notify_check(token, check);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint64_t nw_array_apply()
{
  return _nw_array_apply();
}

uint64_t nw_array_get_count()
{
  return _nw_array_get_count();
}

char *__cdecl nw_endpoint_copy_address_string(nw_endpoint_t endpoint)
{
  return _nw_endpoint_copy_address_string(endpoint);
}

uint64_t nw_endpoint_create_host_with_numeric_port()
{
  return _nw_endpoint_create_host_with_numeric_port();
}

nw_parameters_t nw_parameters_create(void)
{
  return _nw_parameters_create();
}

uint64_t nw_parameters_set_allow_unusable_addresses()
{
  return _nw_parameters_set_allow_unusable_addresses();
}

uint64_t nw_parameters_set_prohibit_encrypted_dns()
{
  return _nw_parameters_set_prohibit_encrypted_dns();
}

uint64_t nw_parameters_set_source_application()
{
  return _nw_parameters_set_source_application();
}

uint64_t nw_parameters_set_source_application_by_bundle_id()
{
  return _nw_parameters_set_source_application_by_bundle_id();
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return _nw_path_create_evaluator_for_endpoint();
}

uint64_t nw_path_evaluator_copy_path()
{
  return _nw_path_evaluator_copy_path();
}

void nw_release(void *obj)
{
}

uint64_t nw_resolver_cancel()
{
  return _nw_resolver_cancel();
}

uint64_t nw_resolver_create_with_path()
{
  return _nw_resolver_create_with_path();
}

uint64_t nw_resolver_set_update_handler()
{
  return _nw_resolver_set_update_handler();
}

void *__cdecl nw_retain(void *obj)
{
  return _nw_retain(obj);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
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

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
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

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return [a1 authenticationMethod];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return [a1 finishTasksAndInvalidate];
}

id objc_msgSend_proposedCredential(void *a1, const char *a2, ...)
{
  return [a1 proposedCredential];
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return [a1 protectionSpace];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}