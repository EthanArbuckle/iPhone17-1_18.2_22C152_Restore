void CLTilesService::CLTilesService(CLTilesService *this)
{
  void *v2;
  NSObject *v3;
  uint64_t listener;

  *(void *)this = off_10000C498;
  v2 = operator new(0x20uLL);
  v2[1] = 0;
  v2[2] = 0;
  *v2 = off_10000C4D0;
  *((_DWORD *)v2 + 6) = 31337;
  *((_OWORD *)this + 5) = 0u;
  *((void *)this + 1) = v2 + 3;
  *((void *)this + 2) = v2;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((void *)this + 8) = 0;
  *((_DWORD *)this + 18) = 1065353216;
  *((_OWORD *)this + 6) = 0u;
  *((_DWORD *)this + 28) = 1065353216;
  *((void *)this + 15) = 0;
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  *((void *)this + 3) = dispatch_queue_create("com.apple.location.tilesservice.serialQ", v3);
  listener = xpc_connection_create_listener();
  CLTilesService::startService((uint64_t)this, listener);
}

void sub_100001704(_Unwind_Exception *a1)
{
  sub_100003BE4(v3);
  sub_100003BE4((uint64_t)(v1 + 5));
  sub_100003B94(v2, 0);
  sub_100003914(v1);
  _Unwind_Resume(a1);
}

void CLTilesService::startService(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (*(void *)(a1 + 24)) {
      operator new();
    }
  }
  else
  {
    a1 = sub_100006DC0();
  }
  sub_100006F34(a1);
  operator delete();
}

void CLTilesService::CLTilesService(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)a1 = off_10000C498;
  v6 = operator new(0x20uLL);
  v6[1] = 0;
  v6[2] = 0;
  void *v6 = off_10000C4D0;
  *(void *)(a1 + 16) = v6;
  *((_DWORD *)v6 + 6) = 31337;
  *(void *)(a1 + 8) = v6 + 3;
  *(void *)(a1 + 24) = a3;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)(a1 + 64) = 0;
  *(_DWORD *)(a1 + 72) = 1065353216;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_DWORD *)(a1 + 112) = 1065353216;
  *(void *)(a1 + 120) = 0;
  CLTilesService::startService(a1, a2);
}

void sub_100001900(_Unwind_Exception *a1)
{
  sub_100003BE4(v3);
  sub_100003BE4((uint64_t)(v1 + 5));
  sub_100003B94(v2, 0);
  sub_100003914(v1);
  _Unwind_Resume(a1);
}

void CLTilesService::~CLTilesService(CLTilesService *this)
{
  sub_1000019A4((uint64_t)this);

  *((void *)this + 3) = 0;
  sub_100003BE4((uint64_t)this + 80);
  sub_100003BE4((uint64_t)this + 40);
  sub_100003B94((CLConnectionServer **)this + 4, 0);
  sub_100003914(this);
}

void sub_1000019A4(uint64_t a1)
{
  v2 = operator new(0x20uLL);
  v2[1] = 0;
  v2[2] = 0;
  void *v2 = off_10000C4D0;
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  *(void *)(a1 + 16) = v2;
  *((_DWORD *)v2 + 6) = 31337;
  *(void *)(a1 + 8) = v2 + 3;
  if (v3)
  {
    sub_1000038A0(v3);
  }
}

void sub_100001A24(void *a1)
{
}

void sub_100001A3C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a2 = 0;
  sub_100003C68(&v3, v2);
}

void sub_100001CFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::__shared_weak_count *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, std::__shared_weak_count *a20,uint64_t a21,std::__shared_weak_count *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,std::__shared_weak_count *a29,uint64_t a30,std::__shared_weak_count *a31)
{
  if (v33) {
    sub_1000038A0(v33);
  }
  if (a13) {
    sub_1000038A0(a13);
  }
  if (a22) {
    std::__shared_weak_count::__release_weak(a22);
  }
  if (a20) {
    std::__shared_weak_count::__release_weak(a20);
  }
  if (a31) {
    std::__shared_weak_count::__release_weak(a31);
  }
  if (a29) {
    std::__shared_weak_count::__release_weak(a29);
  }
  v36 = *(std::__shared_weak_count **)(v34 - 104);
  if (v36) {
    std::__shared_weak_count::__release_weak(v36);
  }
  v37 = *(std::__shared_weak_count **)(v34 - 120);
  if (v37)
  {
    std::__shared_weak_count::__release_weak(v37);
    if (!v32)
    {
LABEL_17:
      if (!v31) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if (!v32)
  {
    goto LABEL_17;
  }
  std::__shared_weak_count::__release_weak(v32);
  if (!v31)
  {
LABEL_19:
    v38 = *(std::__shared_weak_count **)(v34 - 88);
    if (v38) {
      sub_1000038A0(v38);
    }
    _Unwind_Resume(exception_object);
  }
LABEL_18:
  std::__shared_weak_count::__release_weak(v31);
  goto LABEL_19;
}

void sub_100001DB4(void *a1, uint64_t *a2)
{
  uint64_t v2 = a1[4];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3321888768;
  v8 = sub_100001EB0;
  v9 = &unk_10000C378;
  uint64_t v4 = a1[7];
  uint64_t v3 = (std::__shared_weak_count *)a1[8];
  uint64_t v10 = v2;
  uint64_t v11 = v4;
  v12 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  v5 = (std::__shared_weak_count *)a2[1];
  uint64_t v13 = *a2;
  v14 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = a1[6];
  if (v6 && *(void *)(v6 + 8) != -1) {
    v8(v7);
  }
  if (v14) {
    sub_1000038A0(v14);
  }
  if (v12) {
    std::__shared_weak_count::__release_weak(v12);
  }
}

void sub_100001E8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16, uint64_t a17, std::__shared_weak_count *a18)
{
  if (a18) {
    sub_1000038A0(a18);
  }
  if (a16) {
    std::__shared_weak_count::__release_weak(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_100001EB0(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      v5 = v4;
      if (a1[5])
      {
        uint64_t v9 = a1[5];
        uint64_t v10 = v4;
        atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v6 = a1[7];
        v7 = (std::__shared_weak_count *)a1[8];
        v8[0] = v6;
        v8[1] = v7;
        if (v7) {
          atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        CLTilesService::handleMessage(v3, &v9, (uint64_t)v8);
        if (v7) {
          sub_1000038A0(v7);
        }
        if (v10) {
          sub_1000038A0(v10);
        }
      }
      sub_1000038A0(v5);
    }
  }
}

void sub_100001F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (v13) {
    sub_1000038A0(v13);
  }
  if (a12) {
    sub_1000038A0(a12);
  }
  sub_1000038A0(v12);
  _Unwind_Resume(a1);
}

void CLTilesService::handleMessage(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  id v6 = objc_alloc_init((Class)NSAutoreleasePool);
  if (!*(void *)(a1 + 120)) {
    *(void *)(a1 + 120) = os_transaction_create();
  }
  sub_100003DF0(a1 + 40, a2, a2);
  uint64_t v7 = CLConnectionMessage::name(*(CLConnectionMessage **)a3);
  if (*(char *)(v7 + 23) < 0)
  {
    sub_100003998(__p, *(void **)v7, *(void *)(v7 + 8));
  }
  else
  {
    long long v8 = *(_OWORD *)v7;
    uint64_t v29 = *(void *)(v7 + 16);
    *(_OWORD *)__p = v8;
  }
  uint64_t v9 = _os_activity_create((void *)&_mh_execute_header, "CL: #TilesService handling message", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v9, &state);

  if (qword_100010AE0 != -1) {
    dispatch_once(&qword_100010AE0, &stru_10000C530);
  }
  uint64_t v10 = qword_100010AE8;
  if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = __p;
    if (v29 < 0) {
      uint64_t v11 = (void **)__p[0];
    }
    *(_DWORD *)buf = 68289538;
    int v31 = 0;
    __int16 v32 = 2082;
    v33 = "";
    __int16 v34 = 2082;
    v35 = "activity";
    __int16 v36 = 2082;
    v37 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TilesService handling message\", \"event\":%{public, location:escape_only}s, \"messageName\":%{public, location:escape_only}s}", buf, 0x26u);
  }
  if (v29 >= 0) {
    v12 = (void *)HIBYTE(v29);
  }
  else {
    v12 = __p[1];
  }
  if (v12 == (void *)40)
  {
    if (v29 >= 0) {
      v18 = __p;
    }
    else {
      v18 = (void **)__p[0];
    }
    if (!memcmp(v18, "kCLConnectionDownloadAndDecompressCancel", 0x28uLL))
    {
      uint64_t v23 = *a2;
      v15 = (std::__shared_weak_count *)a2[1];
      v24[0] = v23;
      v24[1] = (uint64_t)v15;
      if (v15) {
        atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      CLTilesService::handleDownloadRequestCancellation(a1, v24);
      goto LABEL_45;
    }
  }
  else if (v12 == (void *)34)
  {
    uint64_t v13 = v29 >= 0 ? __p : (void **)__p[0];
    if (!memcmp(v13, "kCLConnectionDownloadAndDecompress", 0x22uLL))
    {
      uint64_t v14 = *a2;
      v15 = (std::__shared_weak_count *)a2[1];
      v26[0] = v14;
      v26[1] = v15;
      if (v15) {
        atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v16 = *(CLConnectionMessage **)a3;
      v17 = *(atomic_ullong **)(a3 + 8);
      v25[0] = v16;
      v25[1] = (CLConnectionMessage *)v17;
      if (v17) {
        atomic_fetch_add_explicit(v17 + 1, 1uLL, memory_order_relaxed);
      }
      CLTilesService::handleDownloadRequest(a1, v26, v25);
      if (v17) {
        sub_1000038A0((std::__shared_weak_count *)v17);
      }
LABEL_45:
      if (v15) {
        sub_1000038A0(v15);
      }
      goto LABEL_47;
    }
  }
  if (qword_100010AE0 != -1) {
    dispatch_once(&qword_100010AE0, &stru_10000C530);
  }
  v19 = qword_100010AE8;
  if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_FAULT))
  {
    v20 = __p;
    if (v29 < 0) {
      v20 = (void **)__p[0];
    }
    *(_DWORD *)buf = 68289282;
    int v31 = 0;
    __int16 v32 = 2082;
    v33 = "";
    __int16 v34 = 2082;
    v35 = (const char *)v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TilesService received unknown message\", \"messageName\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (qword_100010AE0 != -1) {
      dispatch_once(&qword_100010AE0, &stru_10000C530);
    }
  }
  v21 = qword_100010AE8;
  if (os_signpost_enabled((os_log_t)qword_100010AE8))
  {
    v22 = __p;
    if (v29 < 0) {
      v22 = (void **)__p[0];
    }
    *(_DWORD *)buf = 68289282;
    int v31 = 0;
    __int16 v32 = 2082;
    v33 = "";
    __int16 v34 = 2082;
    v35 = (const char *)v22;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#TilesService received unknown message", "{\"msg%{public}.0s\":\"#TilesService received unknown message\", \"messageName\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
LABEL_47:
  os_activity_scope_leave(&state);
  if (SHIBYTE(v29) < 0) {
    operator delete(__p[0]);
  }
}

void sub_100002398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (v22) {
    sub_1000038A0(v22);
  }
  os_activity_scope_leave(&state);
  if (a21 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void *sub_10000240C(void *result, void *a2)
{
  uint64_t v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[8];
  result[7] = a2[7];
  result[8] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_100002440(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (v2) {
    sub_1000038A0(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
  {
    std::__shared_weak_count::__release_weak(v3);
  }
}

void *sub_100002490(void *result, void *a2)
{
  uint64_t v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[8];
  result[7] = a2[7];
  result[8] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1000024C4(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
  {
    std::__shared_weak_count::__release_weak(v3);
  }
}

void sub_100002514(void *a1)
{
  uint64_t v1 = a1[4];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3321888768;
  id v6 = sub_1000025E0;
  uint64_t v7 = &unk_10000C3D8;
  uint64_t v3 = a1[7];
  uint64_t v2 = (std::__shared_weak_count *)a1[8];
  uint64_t v8 = v1;
  uint64_t v9 = v3;
  uint64_t v10 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = a1[6];
  if (v4 && *(void *)(v4 + 8) != -1) {
    v6(v5);
  }
  if (v10) {
    std::__shared_weak_count::__release_weak(v10);
  }
}

void sub_1000025C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    std::__shared_weak_count::__release_weak(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000025E0(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      v5 = v4;
      if (a1[5])
      {
        uint64_t v6 = a1[5];
        uint64_t v7 = v4;
        atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
        CLTilesService::handleConnectionDisconnection(v3, &v6);
        if (v7) {
          sub_1000038A0(v7);
        }
      }
      sub_1000038A0(v5);
    }
  }
}

void sub_100002660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1000038A0(a10);
  }
  sub_1000038A0(v10);
  _Unwind_Resume(a1);
}

void CLTilesService::handleConnectionDisconnection(uint64_t a1, uint64_t *a2)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  if (qword_100010AE0 != -1) {
    dispatch_once(&qword_100010AE0, &stru_10000C530);
  }
  uint64_t v4 = qword_100010AE8;
  if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *a2;
    uint64_t v6 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 68289538;
    int v11 = 0;
    __int16 v12 = 2082;
    uint64_t v13 = "";
    __int16 v14 = 2050;
    uint64_t v15 = v5;
    __int16 v16 = 2050;
    uint64_t v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TilesService removing connection from activeConnections due to client disconnection\", \"connection\":\"%{public}p\", \"numActiveConnections\":%{public}lu}", buf, 0x26u);
  }
  sub_100004328((void *)(a1 + 40), a2);
  uint64_t v7 = (std::__shared_weak_count *)a2[1];
  uint64_t v8 = *a2;
  uint64_t v9 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLTilesService::removeDownloadRequestForConnection(a1, &v8);
  if (v9) {
    sub_1000038A0(v9);
  }
  if (!*(void *)(a1 + 64))
  {

    *(void *)(a1 + 120) = 0;
  }
}

void sub_1000027DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1000038A0(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000027FC(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_100002818(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void sub_100002828(void *a1)
{
  uint64_t v1 = a1[4];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3321888768;
  uint64_t v6 = sub_1000028F4;
  uint64_t v7 = &unk_10000C3D8;
  uint64_t v3 = a1[7];
  uint64_t v2 = (std::__shared_weak_count *)a1[8];
  uint64_t v8 = v1;
  uint64_t v9 = v3;
  uint64_t v10 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = a1[6];
  if (v4 && *(void *)(v4 + 8) != -1) {
    v6(v5);
  }
  if (v10) {
    std::__shared_weak_count::__release_weak(v10);
  }
}

void sub_1000028DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    std::__shared_weak_count::__release_weak(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000028F4(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      uint64_t v5 = v4;
      if (a1[5])
      {
        uint64_t v6 = a1[5];
        uint64_t v7 = v4;
        atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
        CLTilesService::handleConnectionDisconnection(v3, &v6);
        if (v7) {
          sub_1000038A0(v7);
        }
      }
      sub_1000038A0(v5);
    }
  }
}

void sub_100002974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1000038A0(a10);
  }
  sub_1000038A0(v10);
  _Unwind_Resume(a1);
}

void CLTilesService::handleDownloadRequest(uint64_t a1, void *a2, CLConnectionMessage **a3)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  sub_100003AE0(buf, "com.apple.location.tilesservice.downloads");
  char isEntitled = CLConnection::isEntitled();
  char v7 = isEntitled;
  if ((v32[15] & 0x80000000) != 0)
  {
    operator delete(*(void **)buf);
    if (v7)
    {
LABEL_3:
      uint64_t v8 = *a3;
      uint64_t v9 = (CLTileDownloadRequest *)objc_opt_class();
      uint64_t v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(), 0);
      DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(v8, v10);
      id v12 = DictionaryOfClasses;
      if (DictionaryOfClasses)
      {
        uint64_t v8 = (CLConnectionMessage *)[DictionaryOfClasses objectForKey:@"kCLConnectionDownloadAndDecompressDestinationURLKey"];
        if (v8)
        {
          id v12 = [v12 objectForKey:@"kCLConnectionDownloadAndDecompressRequestKey"];
          if (v12)
          {
            uint64_t v9 = [[CLTileDownloadRequest alloc] initWithQueue:*(void *)(a1 + 24)];
            uint64_t v13 = a2[1];
            *(void *)buf = *a2;
            *(void *)__int16 v32 = v13;
            if (v13) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)(v13 + 8), 1uLL, memory_order_relaxed);
            }
            *(void *)&v32[8] = v9;
            sub_100004780(a1 + 80, buf, buf);
            if (*(void *)v32) {
              sub_1000038A0(*(std::__shared_weak_count **)v32);
            }
            if (qword_100010AE0 == -1)
            {
LABEL_11:
              __int16 v14 = qword_100010AE8;
              if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v15 = *a2;
                [v12 timeoutInterval];
                uint64_t v17 = v16;
                unsigned int v18 = [v12 allowsCellularAccess];
                uint64_t v19 = *(void *)(a1 + 104);
                *(_DWORD *)buf = 68290563;
                *(_DWORD *)&uint8_t buf[4] = 0;
                *(_WORD *)__int16 v32 = 2082;
                *(void *)&v32[2] = "";
                *(_WORD *)&v32[10] = 2050;
                *(void *)&v32[12] = v15;
                __int16 v33 = 2050;
                uint64_t v34 = v17;
                __int16 v35 = 1026;
                unsigned int v36 = v18;
                __int16 v37 = 2113;
                id v38 = v12;
                __int16 v39 = 2113;
                v40 = v8;
                __int16 v41 = 2050;
                uint64_t v42 = v19;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TilesService starting download request\", \"connection\":\"%{public}p\", \"timeout\":\"%{public}f\", \"allowsCellular\":%{public}hhd, \"request\":%{private, location:escape_only}@, \"destination\":%{private, location:escape_only}@, \"numCurrentDownloads\":%{public}lu}", buf, 0x4Au);
              }
              v27[0] = _NSConcreteStackBlock;
              v27[1] = 3321888768;
              v27[2] = sub_100003290;
              v27[3] = &unk_10000C458;
              uint64_t v21 = *a2;
              v20 = (std::__shared_weak_count *)a2[1];
              v27[4] = a1;
              v27[5] = v21;
              v28 = v20;
              if (v20) {
                atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
              }
              [(CLTileDownloadRequest *)v9 downloadWithURLRequest:v12 withDecompressionURL:v8 completionHandler:v27];
              v22 = v28;
              if (!v28) {
                return;
              }
LABEL_26:
              sub_1000038A0(v22);
              return;
            }
LABEL_32:
            dispatch_once(&qword_100010AE0, &stru_10000C530);
            goto LABEL_11;
          }
          sub_100007390();
        }
        else
        {
          sub_10000721C();
        }
      }
      else
      {
        sub_1000070A8();
      }
      __break(1u);
      goto LABEL_32;
    }
  }
  else if (isEntitled)
  {
    goto LABEL_3;
  }
  if (qword_100010AE0 != -1) {
    dispatch_once(&qword_100010AE0, &stru_10000C530);
  }
  uint64_t v23 = qword_100010AE8;
  if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v24 = *a2;
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)__int16 v32 = 2082;
    *(void *)&v32[2] = "";
    *(_WORD *)&v32[10] = 2050;
    *(void *)&v32[12] = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TilesService connection lacks proper entitlement.\", \"connection\":\"%{public}p\"}", buf, 0x1Cu);
    if (qword_100010AE0 != -1) {
      dispatch_once(&qword_100010AE0, &stru_10000C530);
    }
  }
  v25 = qword_100010AE8;
  if (os_signpost_enabled((os_log_t)qword_100010AE8))
  {
    uint64_t v26 = *a2;
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)__int16 v32 = 2082;
    *(void *)&v32[2] = "";
    *(_WORD *)&v32[10] = 2050;
    *(void *)&v32[12] = v26;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#TilesService connection lacks proper entitlement.", "{\"msg%{public}.0s\":\"#TilesService connection lacks proper entitlement.\", \"connection\":\"%{public}p\"}", buf, 0x1Cu);
  }
  *(void *)buf = +[NSError errorWithDomain:@"kCLTileErrorDomain" code:3 userInfo:0];
  sub_1000045CC("kCLConnectionDownloadAndDecompressError", &v29);
  CLConnection::sendMessage();
  v22 = v30;
  if (v30) {
    goto LABEL_26;
  }
}

void sub_100002E1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a17) {
    sub_1000038A0(a17);
  }
  _Unwind_Resume(exception_object);
}

void CLTilesService::handleDownloadRequestCancellation(uint64_t a1, uint64_t *a2)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  sub_100003AE0(&__p, "com.apple.location.tilesservice.downloads");
  char isEntitled = CLConnection::isEntitled();
  char v5 = isEntitled;
  if ((SBYTE3(v20) & 0x80000000) == 0)
  {
    if (isEntitled) {
      goto LABEL_3;
    }
LABEL_9:
    if (qword_100010AE0 != -1) {
      dispatch_once(&qword_100010AE0, &stru_10000C530);
    }
    uint64_t v8 = qword_100010AE8;
    if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *a2;
      __p = (void *)68289282;
      __int16 v17 = 2082;
      unsigned int v18 = "";
      __int16 v19 = 2050;
      uint64_t v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TilesService connection lacks proper entitlement.\", \"connection\":\"%{public}p\"}", (uint8_t *)&__p, 0x1Cu);
      if (qword_100010AE0 != -1) {
        dispatch_once(&qword_100010AE0, &stru_10000C530);
      }
    }
    uint64_t v10 = qword_100010AE8;
    if (os_signpost_enabled((os_log_t)qword_100010AE8))
    {
      uint64_t v11 = *a2;
      __p = (void *)68289282;
      __int16 v17 = 2082;
      unsigned int v18 = "";
      __int16 v19 = 2050;
      uint64_t v20 = v11;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#TilesService connection lacks proper entitlement.", "{\"msg%{public}.0s\":\"#TilesService connection lacks proper entitlement.\", \"connection\":\"%{public}p\"}", (uint8_t *)&__p, 0x1Cu);
    }
    __p = +[NSError errorWithDomain:@"kCLTileErrorDomain" code:3 userInfo:0];
    sub_1000045CC("kCLConnectionDownloadAndDecompressError", &v14);
    CLConnection::sendMessage();
    char v7 = v15;
    if (v15) {
      goto LABEL_6;
    }
    return;
  }
  operator delete(__p);
  if ((v5 & 1) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v6 = (std::__shared_weak_count *)a2[1];
  uint64_t v12 = *a2;
  uint64_t v13 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLTilesService::removeDownloadRequestForConnection(a1, &v12);
  char v7 = v13;
  if (v13) {
LABEL_6:
  }
    sub_1000038A0(v7);
}

void sub_1000030D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::__shared_weak_count *a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a13) {
    sub_1000038A0(a13);
  }
  _Unwind_Resume(exception_object);
}

void CLTilesService::removeDownloadRequestForConnection(uint64_t a1, uint64_t *a2)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  uint64_t v4 = (void *)(a1 + 80);
  char v5 = sub_100004360((void *)(a1 + 80), a2);
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = (std::__shared_weak_count *)v5[3];
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v8 = (void *)v5[4];
    if (qword_100010AE0 != -1) {
      dispatch_once(&qword_100010AE0, &stru_10000C530);
    }
    uint64_t v9 = qword_100010AE8;
    if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = *a2;
      v11[0] = 68289282;
      v11[1] = 0;
      __int16 v12 = 2082;
      uint64_t v13 = "";
      __int16 v14 = 2050;
      uint64_t v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TilesService removing connection from fDownloadRequestsMap\", \"connection\":\"%{public}p\"}", (uint8_t *)v11, 0x1Cu);
    }
    [v8 cancel];

    sub_10000444C(v4, v6);
    if (v7) {
      sub_1000038A0(v7);
    }
  }
}

void sub_100003278(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_1000038A0(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_100003290(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v6 = (std::__shared_weak_count *)a1[6];
  uint64_t v8 = v7;
  uint64_t v9 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLTilesService::handleDownloadRequestCallback(v5, &v8, a2, a3, a4);
  if (v9) {
    sub_1000038A0(v9);
  }
}

void sub_1000032F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1000038A0(a10);
  }
  _Unwind_Resume(exception_object);
}

void CLTilesService::handleDownloadRequestCallback(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v29 = a5;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  if (sub_100004360((void *)(a1 + 40), a2))
  {
    if (a5)
    {
      sub_1000045CC("kCLConnectionDownloadAndDecompressError", buf);
    }
    else
    {
      v30[0] = @"kCLConnectionDownloadAndDecompressFileKey";
      v30[1] = @"kCLConnectionDownloadAndDecompressURLResponseKey";
      v31[0] = a3;
      v31[1] = a4;
      uint64_t v26 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
      sub_100004A18("kCLConnectionDownloadAndDecompressSuccess", buf);
    }
    uint64_t v17 = *(void *)buf;
    uint64_t v16 = *(std::__shared_weak_count **)v33;
    if (*(void *)buf)
    {
      if (qword_100010AE0 == -1)
      {
LABEL_17:
        unsigned int v18 = qword_100010AE8;
        if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v19 = *a2;
          id v20 = [v29 description];
          *(_DWORD *)buf = 68290051;
          *(_WORD *)__int16 v33 = 2082;
          *(_DWORD *)&uint8_t buf[4] = 0;
          *(void *)&v33[2] = "";
          __int16 v34 = 2050;
          uint64_t v35 = v19;
          __int16 v36 = 2113;
          uint64_t v37 = a3;
          __int16 v38 = 2113;
          uint64_t v39 = a4;
          __int16 v40 = 2113;
          id v41 = v20;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TilesService sending response for download request\", \"connection\":\"%{public}p\", \"decompressedFile\":%{private, location:escape_only}@, \"response\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x3Au);
        }
        uint64_t v24 = v17;
        v25 = v16;
        if (v16) {
          atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        CLConnection::sendMessage();
        if (v25) {
          sub_1000038A0(v25);
        }
        uint64_t v21 = (std::__shared_weak_count *)a2[1];
        uint64_t v22 = *a2;
        uint64_t v23 = v21;
        if (v21) {
          atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        CLTilesService::removeDownloadRequestForConnection(a1, &v22);
        if (v23) {
          sub_1000038A0(v23);
        }
        goto LABEL_27;
      }
    }
    else
    {
      sub_100007504(qword_100010AE0 == -1);
      abort_report_np();
      __break(1u);
    }
    dispatch_once(&qword_100010AE0, &stru_10000C530);
    goto LABEL_17;
  }
  if (qword_100010AE0 != -1) {
    dispatch_once(&qword_100010AE0, &stru_10000C530);
  }
  uint64_t v10 = qword_100010AE8;
  if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *a2;
    *(_DWORD *)buf = 68290051;
    *(_WORD *)__int16 v33 = 2082;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(void *)&v33[2] = "";
    __int16 v34 = 2050;
    uint64_t v35 = v11;
    __int16 v36 = 2113;
    uint64_t v37 = a3;
    __int16 v38 = 2113;
    uint64_t v39 = a4;
    __int16 v40 = 2113;
    id v41 = [a5 description];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TilesService dropping response to connection due to it not being active anymore\", \"connection\":\"%{public}p\", \"decompressedFile\":%{private, location:escape_only}@, \"response\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x3Au);
    if (qword_100010AE0 != -1) {
      dispatch_once(&qword_100010AE0, &stru_10000C530);
    }
  }
  __int16 v12 = qword_100010AE8;
  if (os_signpost_enabled((os_log_t)qword_100010AE8))
  {
    uint64_t v13 = *a2;
    id v14 = [v29 description];
    *(_DWORD *)buf = 68290051;
    *(_WORD *)__int16 v33 = 2082;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(void *)&v33[2] = "";
    __int16 v34 = 2050;
    uint64_t v35 = v13;
    __int16 v36 = 2113;
    uint64_t v37 = a3;
    __int16 v38 = 2113;
    uint64_t v39 = a4;
    __int16 v40 = 2113;
    id v41 = v14;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#TilesService dropping response to connection due to it not being active anymore", "{\"msg%{public}.0s\":\"#TilesService dropping response to connection due to it not being active anymore\", \"connection\":\"%{public}p\", \"decompressedFile\":%{private, location:escape_only}@, \"response\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x3Au);
  }
  uint64_t v15 = (std::__shared_weak_count *)a2[1];
  uint64_t v27 = *a2;
  v28 = v15;
  if (v15) {
    atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLTilesService::removeDownloadRequestForConnection(a1, &v27);
  uint64_t v16 = v28;
LABEL_27:
  if (v16) {
    sub_1000038A0(v16);
  }
}

void sub_10000372C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
}

uint64_t sub_10000378C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1000037A8(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    sub_1000038A0(v1);
  }
}

void sub_1000037B8(void *a1)
{
  sub_100003914(a1);
  operator delete();
}

void sub_1000037F0()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_100003824(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_10000C4D0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_100003844(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_10000C4D0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

void sub_1000038A0(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void *sub_100003914(void *a1)
{
  *a1 = off_10000C498;
  sub_1000019A4((uint64_t)a1);
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    sub_1000038A0(v2);
  }
  return a1;
}

void sub_100003968(id a1)
{
  qword_100010AE8 = (uint64_t)os_log_create("com.apple.location.TilesService", "TilesService");
}

void *sub_100003998(unsigned char *__dst, void *__src, unint64_t a3)
{
  uint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_100003A38();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    void v5[2] = v7 | 0x8000000000000000;
    void *v5 = v8;
    uint64_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

void sub_100003A38()
{
}

void sub_100003A50(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100003AAC(exception, a1);
}

void sub_100003A98(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100003AAC(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_100003AE0(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100003A38();
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

CLConnectionServer *sub_100003B94(CLConnectionServer **a1, CLConnectionServer *a2)
{
  result = *a1;
  *a1 = a2;
  if (result)
  {
    CLConnectionServer::~CLConnectionServer(result);
    operator delete();
  }
  return result;
}

uint64_t sub_100003BE4(uint64_t a1)
{
  sub_100003C20(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_100003C20(int a1, void *__p)
{
  if (__p)
  {
    uint64_t v2 = __p;
    do
    {
      uint64_t v3 = (void *)*v2;
      size_t v4 = (std::__shared_weak_count *)v2[3];
      if (v4) {
        sub_1000038A0(v4);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void sub_100003C68(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_100003CD0(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CLConnection::deferredDelete(v1);
  }
  __cxa_rethrow();
}

void sub_100003CE8(_Unwind_Exception *a1)
{
}

void sub_100003D00(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

CLConnection *sub_100003D38(uint64_t a1)
{
  result = *(CLConnection **)(a1 + 24);
  if (result) {
    return (CLConnection *)CLConnection::deferredDelete(result);
  }
  return result;
}

uint64_t sub_100003D5C(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else {
    return 0;
  }
}

BOOL sub_100003DA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void *sub_100003DF0(uint64_t a1, void *a2, void *a3)
{
  unint64_t v6 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  unint64_t v7 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v6 >> 47) ^ v6);
  unint64_t v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
    }
    else
    {
      unint64_t v3 = v8 & (v9 - 1);
    }
    uint64_t v11 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v11)
    {
      for (i = *v11; i; i = (void *)*i)
      {
        unint64_t v13 = i[1];
        if (v13 == v8)
        {
          if (i[2] == *a2) {
            return i;
          }
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v13 >= v9) {
              v13 %= v9;
            }
          }
          else
          {
            v13 &= v9 - 1;
          }
          if (v13 != v3) {
            break;
          }
        }
      }
    }
  }
  id v14 = (void *)(a1 + 16);
  i = operator new(0x20uLL);
  void *i = 0;
  i[1] = v8;
  uint64_t v15 = a3[1];
  i[2] = *a3;
  i[3] = v15;
  if (v15) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
  }
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v9 || (float)(v17 * (float)v9) < v16)
  {
    BOOL v18 = 1;
    if (v9 >= 3) {
      BOOL v18 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v9);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    sub_100004080(a1, v21);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v22 = *(void *)a1;
  uint64_t v23 = *(void **)(*(void *)a1 + 8 * v3);
  if (v23)
  {
    void *i = *v23;
LABEL_40:
    *uint64_t v23 = i;
    goto LABEL_41;
  }
  void *i = *v14;
  void *v14 = i;
  *(void *)(v22 + 8 * v3) = v14;
  if (*i)
  {
    unint64_t v24 = *(void *)(*i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v24 >= v9) {
        v24 %= v9;
      }
    }
    else
    {
      v24 &= v9 - 1;
    }
    uint64_t v23 = (void *)(*(void *)a1 + 8 * v24);
    goto LABEL_40;
  }
LABEL_41:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_100004064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  sub_1000042CC(v11, v10);
  _Unwind_Resume(a1);
}

void sub_100004080(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_100004170(a1, prime);
    }
  }
}

void sub_100004170(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_1000037F0();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      uint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            void *v7 = *v11;
            *uint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    uint8x8_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void sub_1000042CC(uint64_t a1, void *__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    unint64_t v3 = (std::__shared_weak_count *)__p[3];
    if (v3) {
      sub_1000038A0(v3);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t *sub_100004328(void *a1, void *a2)
{
  result = sub_100004360(a1, a2);
  if (result)
  {
    sub_10000444C(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

void *sub_100004360(void *a1, void *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  unint64_t v4 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v3 >> 47) ^ v3);
  unint64_t v5 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(v2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v7 = v5;
    if (v5 >= *(void *)&v2) {
      unint64_t v7 = v5 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v7 = v5 & (*(void *)&v2 - 1);
  }
  unint64_t v8 = *(void **)(*a1 + 8 * v7);
  if (!v8) {
    return 0;
  }
  result = (void *)*v8;
  if (*v8)
  {
    do
    {
      unint64_t v10 = result[1];
      if (v10 == v5)
      {
        if (result[2] == *a2) {
          return result;
        }
      }
      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v10 >= *(void *)&v2) {
            v10 %= *(void *)&v2;
          }
        }
        else
        {
          v10 &= *(void *)&v2 - 1;
        }
        if (v10 != v7) {
          return 0;
        }
      }
      result = (void *)*result;
    }
    while (result);
  }
  return result;
}

uint64_t sub_10000444C(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  sub_100004498(a1, a2, (uint64_t)&__p);
  unint64_t v3 = __p;
  __p = 0;
  if (v3) {
    sub_1000042CC((uint64_t)&v6, v3);
  }
  return v2;
}

void *sub_100004498@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  uint64_t v6 = *(void **)(*result + 8 * v4);
  do
  {
    unint64_t v7 = v6;
    uint64_t v6 = (void *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2) {
    goto LABEL_18;
  }
  unint64_t v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(void *)&v3) {
      v8 %= *(void *)&v3;
    }
  }
  else
  {
    v8 &= *(void *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v3) {
        v9 %= *(void *)&v3;
      }
    }
    else
    {
      v9 &= *(void *)&v3 - 1;
    }
    if (v9 != v4) {
LABEL_19:
    }
      *(void *)(*result + 8 * v4) = 0;
  }
  uint64_t v10 = *a2;
  if (*a2)
  {
    unint64_t v11 = *(void *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(void *)&v3) {
        v11 %= *(void *)&v3;
      }
    }
    else
    {
      v11 &= *(void *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(void *)(*result + 8 * v11) = v7;
      uint64_t v10 = *a2;
    }
  }
  void *v7 = v10;
  *a2 = 0;
  --result[3];
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = result + 2;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void *sub_1000045CC@<X0>(char *a1@<X1>, void *a2@<X8>)
{
  unint64_t v4 = operator new(0x70uLL);
  result = sub_100004630(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_10000461C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_100004630(void *a1, char *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_10000C5C0;
  sub_10000470C((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_100004678(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_10000468C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_10000C5C0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1000046AC(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_10000C5C0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

void sub_100004700(uint64_t a1)
{
}

uint64_t sub_10000470C(uint64_t a1, char *a2)
{
  sub_100003AE0(&__p, a2);
  CLConnectionMessage::CLConnectionMessage();
  if (v5 < 0) {
    operator delete(__p);
  }
  return a1;
}

void sub_100004764(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100004780(uint64_t a1, void *a2, void *a3)
{
  unint64_t v6 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  unint64_t v7 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v6 >> 47) ^ v6);
  unint64_t v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
    }
    else
    {
      unint64_t v3 = v8 & (v9 - 1);
    }
    unint64_t v11 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v11)
    {
      for (i = *v11; i; i = (void *)*i)
      {
        unint64_t v13 = i[1];
        if (v13 == v8)
        {
          if (i[2] == *a2) {
            return i;
          }
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v13 >= v9) {
              v13 %= v9;
            }
          }
          else
          {
            v13 &= v9 - 1;
          }
          if (v13 != v3) {
            break;
          }
        }
      }
    }
  }
  id v14 = (void *)(a1 + 16);
  uint64_t v15 = operator new(0x28uLL);
  i = v15;
  void *v15 = 0;
  v15[1] = v8;
  uint64_t v16 = a3[1];
  v15[2] = *a3;
  v15[3] = v16;
  if (v16) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v16 + 8), 1uLL, memory_order_relaxed);
  }
  v15[4] = a3[2];
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v9 || (float)(v18 * (float)v9) < v17)
  {
    BOOL v19 = 1;
    if (v9 >= 3) {
      BOOL v19 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v9);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    sub_100004080(a1, v22);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v23 = *(void *)a1;
  unint64_t v24 = *(void **)(*(void *)a1 + 8 * v3);
  if (v24)
  {
    void *i = *v24;
LABEL_40:
    *unint64_t v24 = i;
    goto LABEL_41;
  }
  void *i = *v14;
  void *v14 = i;
  *(void *)(v23 + 8 * v3) = v14;
  if (*i)
  {
    unint64_t v25 = *(void *)(*i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v25 >= v9) {
        v25 %= v9;
      }
    }
    else
    {
      v25 &= v9 - 1;
    }
    unint64_t v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_40;
  }
LABEL_41:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_1000049FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  sub_1000042CC(v11, v10);
  _Unwind_Resume(a1);
}

void *sub_100004A18@<X0>(char *a1@<X1>, void *a2@<X8>)
{
  unint64_t v4 = operator new(0x70uLL);
  result = sub_100004A7C(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_100004A68(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_100004A7C(void *a1, char *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_10000C5C0;
  sub_100004AD8((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_100004AC4(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100004AD8(uint64_t a1, char *a2)
{
  sub_100003AE0(&__p, a2);
  CLConnectionMessage::CLConnectionMessage();
  if (v5 < 0) {
    operator delete(__p);
  }
  return a1;
}

void sub_100004B30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100004B78(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, const char *a6, uint8_t *a7)
{
  _os_signpost_emit_with_name_impl(a1, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, a5, a6, a7, 0x26u);
}

void sub_100004BCC(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint8_t buf)
{
  _os_log_impl(a1, v13, OS_LOG_TYPE_FAULT, a4, &buf, 0x26u);
}

void sub_100004BEC(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint8_t buf)
{
  _os_log_impl(a1, v13, OS_LOG_TYPE_INFO, a4, &buf, 0x26u);
}

BOOL sub_100004C0C()
{
  uint64_t v1 = qword_100010AE8;
  return os_log_type_enabled(v1, OS_LOG_TYPE_FAULT);
}

BOOL sub_100004C2C()
{
  uint64_t v2 = *(NSObject **)(v0 + 2792);
  return os_log_type_enabled(v2, OS_LOG_TYPE_INFO);
}

BOOL sub_100004C60()
{
  uint64_t v2 = *(NSObject **)(v0 + 2792);
  return os_signpost_enabled(v2);
}

void sub_100004CA0(id a1)
{
  v1[0] = @"gsp10-ssl.apple.com";
  v2[0] = +[NSNull null];
  v1[1] = @"gs-loc.apple.com";
  v2[1] = +[NSNull null];
  v2[2] = @"1.2.840.113635.100.6.27.35";
  v1[2] = @"iphone-ld.apple.com";
  v1[3] = @"configuration.apple.com";
  v2[3] = +[NSNull null];
  v1[4] = @"cl5.apple.com";
  v2[4] = +[NSNull null];
  v1[5] = @"cl4.apple.com";
  v2[5] = +[NSNull null];
  v1[6] = @"cl3.apple.com";
  v2[6] = +[NSNull null];
  v1[7] = @"cl2.apple.com";
  v2[7] = +[NSNull null];
  v1[8] = @"ingest.apple-studies.com";
  v2[8] = +[NSNull null];
  v1[9] = @"ingest.stg.apple-studies.com";
  v2[9] = +[NSNull null];
  qword_100011438 = +[NSDictionary dictionaryWithObjects:v2 forKeys:v1 count:10];
}

void sub_10000547C(id a1)
{
  qword_100011288 = (uint64_t)os_log_create("com.apple.locationd.Utility", "Utility");
}

uint64_t getSharedSessionInQueue(NSObject *a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000055F0;
  block[3] = &unk_10000C650;
  block[4] = a1;
  if (qword_100011448 != -1) {
    dispatch_once(&qword_100011448, block);
  }
  if (qword_100011450 != a1) {
    sub_1000076AC(a1);
  }
  return qword_100011440;
}

NSURLSession *sub_1000055F0(uint64_t a1)
{
  uint64_t v2 = +[NSURLSessionConfiguration defaultSessionConfiguration];
  id v3 = objc_alloc_init((Class)NSOperationQueue);
  [v3 setUnderlyingQueue:*(void *)(a1 + 32)];
  qword_100011450 = *(void *)(a1 + 32);
  unint64_t v4 = +[NSURLSession sessionWithConfiguration:v2 delegate:objc_alloc_init(CLTileDownloadTaskDelegate) delegateQueue:v3];
  qword_100011440 = (uint64_t)v4;
  return v4;
}

uint64_t decompress(const char *a1, const char *a2)
{
  unint64_t v4 = malloc_type_malloc(0x4000uLL, 0x5752F906uLL);
  char v5 = &CLCertificatePinningHelper__metaData;
  unint64_t v6 = &CLCertificatePinningHelper__metaData;
  if (v4)
  {
    unint64_t v7 = v4;
    uint64_t v50 = 0;
    uint64_t v8 = [+[NSFileManager defaultManager](NSFileManager, "defaultManager") attributesOfItemAtPath:+[NSString stringWithUTF8String:a1] error:&v50];
    if (v50)
    {
      if (qword_100010AE0 != -1) {
        dispatch_once(&qword_100010AE0, &stru_10000C6D0);
      }
      unint64_t v9 = qword_100010AE8;
      if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289538;
        int v52 = 0;
        __int16 v53 = 2082;
        v54 = "";
        __int16 v55 = 2082;
        v56 = a1;
        __int16 v57 = 2114;
        *(void *)v58 = v50;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TilesService, attributesOfItemAtPath returned an error\", \"file_path_from\":%{public, location:escape_only}s, \"attributesError\":%{public, location:escape_only}@}", buf, 0x26u);
        if (qword_100010AE0 != -1) {
          dispatch_once(&qword_100010AE0, &stru_10000C6D0);
        }
      }
      uint8x8_t v10 = qword_100010AE8;
      if (os_signpost_enabled((os_log_t)qword_100010AE8))
      {
        *(_DWORD *)buf = 68289538;
        int v52 = 0;
        __int16 v53 = 2082;
        v54 = "";
        __int16 v55 = 2082;
        v56 = a1;
        __int16 v57 = 2114;
        *(void *)v58 = v50;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#TilesService, attributesOfItemAtPath returned an error", "{\"msg%{public}.0s\":\"#TilesService, attributesOfItemAtPath returned an error\", \"file_path_from\":%{public, location:escape_only}s, \"attributesError\":%{public, location:escape_only}@}", buf, 0x26u);
      }
      uint64_t v11 = 0;
      unint64_t v12 = 0;
      char v5 = &CLCertificatePinningHelper__metaData;
    }
    else
    {
      id v18 = objc_msgSend(-[NSDictionary objectForKey:](v8, "objectForKey:", NSFileSize), "unsignedLongLongValue");
      if (v18)
      {
        unint64_t v12 = (unint64_t)v18;
        if (qword_100010AE0 != -1) {
          dispatch_once(&qword_100010AE0, &stru_10000C6D0);
        }
        BOOL v19 = qword_100010AE8;
        if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68290050;
          int v52 = 0;
          __int16 v53 = 2082;
          v54 = "";
          __int16 v55 = 2082;
          v56 = a1;
          __int16 v57 = 2082;
          *(void *)v58 = a2;
          *(_WORD *)&v58[8] = 2050;
          *(void *)&v58[10] = v12;
          *(_WORD *)&v58[18] = 1026;
          *(_DWORD *)&v58[20] = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TilesService\", \"file_path_from\":%{public, location:escape_only}s, \"file_path_to\":%{public, location:escape_only}s, \"fileSize\":%{public}llu, \"isOK\":%{public}hhd}", buf, 0x36u);
        }
        unint64_t v20 = fopen(a2, "wb");
        if (v20)
        {
          uint64_t v11 = v20;
          unint64_t v21 = gzopen(a1, "rb");
          if (v21)
          {
            size_t v22 = v21;
            if (gzeof(v21))
            {
              unsigned int v15 = 0;
              int v14 = 0;
LABEL_29:
              uint64_t v13 = 1;
            }
            else
            {
              int v14 = 0;
              unsigned int v15 = 0;
              while (1)
              {
                int v34 = gzread(v22, v7, 0x4000u);
                int v35 = v34;
                if (v34 <= 0) {
                  break;
                }
                v14 += v34;
                size_t v36 = fwrite(v7, 1uLL, v34, v11);
                if (v36 != v35)
                {
                  size_t v45 = v36;
                  if (qword_100010AE0 != -1) {
                    dispatch_once(&qword_100010AE0, &stru_10000C6D0);
                  }
                  v46 = qword_100010AE8;
                  if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_FAULT))
                  {
                    int v47 = *__error();
                    *(_DWORD *)buf = 68289794;
                    int v52 = 0;
                    __int16 v53 = 2082;
                    v54 = "";
                    __int16 v55 = 2082;
                    v56 = a2;
                    __int16 v57 = 1026;
                    *(_DWORD *)v58 = v47;
                    *(_WORD *)&v58[4] = 2050;
                    *(void *)&v58[6] = v45;
                    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TilesService, can't write to file_path_to\", \"file_path_to\":%{public, location:escape_only}s, \"errno\":%{public}d, \"write\":%{public}llu}", buf, 0x2Cu);
                    if (qword_100010AE0 != -1) {
                      dispatch_once(&qword_100010AE0, &stru_10000C6D0);
                    }
                  }
                  uint64_t v48 = qword_100010AE8;
                  if (os_signpost_enabled((os_log_t)qword_100010AE8))
                  {
                    int v49 = *__error();
                    *(_DWORD *)buf = 68289794;
                    int v52 = 0;
                    __int16 v53 = 2082;
                    v54 = "";
                    __int16 v55 = 2082;
                    v56 = a2;
                    __int16 v57 = 1026;
                    *(_DWORD *)v58 = v49;
                    *(_WORD *)&v58[4] = 2050;
                    *(void *)&v58[6] = v45;
                    id v41 = "#TilesService, can't write to file_path_to";
                    uint64_t v42 = "{\"msg%{public}.0s\":\"#TilesService, can't write to file_path_to\", \"file_path_to\":%{public"
                          ", location:escape_only}s, \"errno\":%{public}d, \"write\":%{public}llu}";
                    v43 = v48;
                    uint32_t v44 = 44;
                    goto LABEL_76;
                  }
                  goto LABEL_77;
                }
                v15 += v35;
                unint64_t v6 = &CLCertificatePinningHelper__metaData;
                if (gzeof(v22)) {
                  goto LABEL_29;
                }
              }
              if (qword_100010AE0 != -1) {
                dispatch_once(&qword_100010AE0, &stru_10000C6D0);
              }
              weak_ivar_lyt = v6[38].weak_ivar_lyt;
              if (os_log_type_enabled(weak_ivar_lyt, OS_LOG_TYPE_FAULT))
              {
                int v38 = *__error();
                *(_DWORD *)buf = 68289794;
                int v52 = 0;
                __int16 v53 = 2082;
                v54 = "";
                __int16 v55 = 2082;
                v56 = a1;
                __int16 v57 = 1026;
                *(_DWORD *)v58 = v38;
                *(_WORD *)&v58[4] = 1026;
                *(_DWORD *)&v58[6] = v35;
                _os_log_impl((void *)&_mh_execute_header, weak_ivar_lyt, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TilesService, error reading source file\", \"file_path_from\":%{public, location:escape_only}s, \"errno\":%{public}d, \"read\":%{public}d}", buf, 0x28u);
                if (qword_100010AE0 != -1) {
                  dispatch_once(&qword_100010AE0, &stru_10000C6D0);
                }
              }
              uint64_t v39 = qword_100010AE8;
              if (os_signpost_enabled((os_log_t)qword_100010AE8))
              {
                int v40 = *__error();
                *(_DWORD *)buf = 68289794;
                int v52 = 0;
                __int16 v53 = 2082;
                v54 = "";
                __int16 v55 = 2082;
                v56 = a1;
                __int16 v57 = 1026;
                *(_DWORD *)v58 = v40;
                *(_WORD *)&v58[4] = 1026;
                *(_DWORD *)&v58[6] = v35;
                id v41 = "#TilesService, error reading source file";
                uint64_t v42 = "{\"msg%{public}.0s\":\"#TilesService, error reading source file\", \"file_path_from\":%{public, lo"
                      "cation:escape_only}s, \"errno\":%{public}d, \"read\":%{public}d}";
                v43 = v39;
                uint32_t v44 = 40;
LABEL_76:
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v41, v42, buf, v44);
              }
LABEL_77:
              uint64_t v13 = 0;
              unint64_t v6 = &CLCertificatePinningHelper__metaData;
            }
            gzclose(v22);
            char v5 = &CLCertificatePinningHelper__metaData;
            goto LABEL_12;
          }
          if (qword_100010AE0 != -1) {
            dispatch_once(&qword_100010AE0, &stru_10000C6D0);
          }
          v30 = qword_100010AE8;
          if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_FAULT))
          {
            int v31 = *__error();
            *(_DWORD *)buf = 68289538;
            int v52 = 0;
            __int16 v53 = 2082;
            v54 = "";
            __int16 v55 = 2082;
            v56 = a1;
            __int16 v57 = 1026;
            *(_DWORD *)v58 = v31;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TilesService, can't open file_path_from\", \"file_path_from\":%{public, location:escape_only}s, \"errno\":%{public}d}", buf, 0x22u);
            if (qword_100010AE0 != -1) {
              dispatch_once(&qword_100010AE0, &stru_10000C6D0);
            }
          }
          __int16 v32 = qword_100010AE8;
          if (os_signpost_enabled((os_log_t)qword_100010AE8))
          {
            int v33 = *__error();
            *(_DWORD *)buf = 68289538;
            int v52 = 0;
            __int16 v53 = 2082;
            v54 = "";
            __int16 v55 = 2082;
            v56 = a1;
            __int16 v57 = 1026;
            *(_DWORD *)v58 = v33;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#TilesService, can't open file_path_from", "{\"msg%{public}.0s\":\"#TilesService, can't open file_path_from\", \"file_path_from\":%{public, location:escape_only}s, \"errno\":%{public}d}", buf, 0x22u);
          }
          char v5 = &CLCertificatePinningHelper__metaData;
        }
        else
        {
          if (qword_100010AE0 != -1) {
            dispatch_once(&qword_100010AE0, &stru_10000C6D0);
          }
          uint64_t v26 = qword_100010AE8;
          if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_FAULT))
          {
            int v27 = *__error();
            *(_DWORD *)buf = 68289538;
            int v52 = 0;
            __int16 v53 = 2082;
            v54 = "";
            __int16 v55 = 2082;
            v56 = a2;
            __int16 v57 = 1026;
            *(_DWORD *)v58 = v27;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TilesService, can't open file_path_to\", \"file_path_to\":%{public, location:escape_only}s, \"errno\":%{public}d}", buf, 0x22u);
            if (qword_100010AE0 != -1) {
              dispatch_once(&qword_100010AE0, &stru_10000C6D0);
            }
          }
          v28 = qword_100010AE8;
          if (os_signpost_enabled((os_log_t)qword_100010AE8))
          {
            int v29 = *__error();
            *(_DWORD *)buf = 68289538;
            int v52 = 0;
            __int16 v53 = 2082;
            v54 = "";
            __int16 v55 = 2082;
            v56 = a2;
            __int16 v57 = 1026;
            *(_DWORD *)v58 = v29;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#TilesService, can't open file_path_to", "{\"msg%{public}.0s\":\"#TilesService, can't open file_path_to\", \"file_path_to\":%{public, location:escape_only}s, \"errno\":%{public}d}", buf, 0x22u);
          }
          uint64_t v11 = 0;
        }
      }
      else
      {
        if (qword_100010AE0 != -1) {
          dispatch_once(&qword_100010AE0, &stru_10000C6D0);
        }
        unint64_t v24 = qword_100010AE8;
        if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 68289282;
          int v52 = 0;
          __int16 v53 = 2082;
          v54 = "";
          __int16 v55 = 2082;
          v56 = a1;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TilesService, file is empty or inaccessible\", \"file_path_from\":%{public, location:escape_only}s}", buf, 0x1Cu);
          if (qword_100010AE0 != -1) {
            dispatch_once(&qword_100010AE0, &stru_10000C6D0);
          }
        }
        unint64_t v25 = qword_100010AE8;
        if (os_signpost_enabled((os_log_t)qword_100010AE8))
        {
          *(_DWORD *)buf = 68289282;
          int v52 = 0;
          __int16 v53 = 2082;
          v54 = "";
          __int16 v55 = 2082;
          v56 = a1;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#TilesService, file is empty or inaccessible", "{\"msg%{public}.0s\":\"#TilesService, file is empty or inaccessible\", \"file_path_from\":%{public, location:escape_only}s}", buf, 0x1Cu);
        }
        uint64_t v11 = 0;
        unint64_t v12 = 0;
      }
    }
    uint64_t v13 = 0;
    int v14 = 0;
    unsigned int v15 = 0;
    if (!v11)
    {
LABEL_13:
      free(v7);
      goto LABEL_15;
    }
LABEL_12:
    fclose(v11);
    goto LABEL_13;
  }
  unint64_t v12 = 0;
  uint64_t v13 = 0;
  int v14 = 0;
  unsigned int v15 = 0;
LABEL_15:
  if (v5[38].ivars != (__objc2_ivar_list *)-1) {
    dispatch_once(&qword_100010AE0, &stru_10000C6D0);
  }
  uint64_t v16 = v6[38].weak_ivar_lyt;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    if (v15) {
      double v17 = (double)v12 / (double)v15;
    }
    else {
      double v17 = 0.0;
    }
    *(_DWORD *)buf = 68290818;
    int v52 = 0;
    __int16 v53 = 2082;
    v54 = "";
    __int16 v55 = 2082;
    v56 = a1;
    __int16 v57 = 2082;
    *(void *)v58 = a2;
    *(_WORD *)&v58[8] = 1026;
    *(_DWORD *)&v58[10] = v13;
    *(_WORD *)&v58[14] = 2050;
    *(void *)&v58[16] = v12;
    __int16 v59 = 1026;
    int v60 = v14;
    __int16 v61 = 1026;
    unsigned int v62 = v15;
    __int16 v63 = 2050;
    double v64 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TilesService\", \"file_path_from\":%{public, location:escape_only}s, \"file_path_to\":%{public, location:escape_only}s, \"isOK\":%{public}hhd, \"fileSize\":%{public}llu, \"totalReadBytes\":%{public}d, \"totalWrittenBytes\":%{public}d, \"compression\":\"%{public}.4f\"}", buf, 0x4Cu);
  }
  return v13;
}

void sub_10000636C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    std::__shared_weak_count::__release_weak(a16);
  }
  if (v16) {
    std::__shared_weak_count::__release_weak(v16);
  }
  _Unwind_Resume(exception_object);
}

id sub_100006390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id result = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    if (*(void *)(v6 + 8) != -1) {
      return objc_msgSend(result, "onDownloadCompleted:withResponse:withError:", a2, a3, a4, _NSConcreteStackBlock, 3221225472, sub_100006424, &unk_10000C678, result, a2, a3, a4);
    }
  }
  return result;
}

id sub_100006424(uint64_t a1)
{
  return [*(id *)(a1 + 32) onDownloadCompleted:*(void *)(a1 + 40) withResponse:*(void *)(a1 + 48) withError:*(void *)(a1 + 56)];
}

uint64_t sub_100006434(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_100006450(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void sub_100006C7C(id a1)
{
  qword_100010AE8 = (uint64_t)os_log_create("com.apple.location.TilesService", "TilesService");
}

int main(int argc, const char **argv, const char **envp)
{
}

void sub_100006D58()
{
}

void sub_100006D9C()
{
}

#error "100006E3C: call analysis failed (funcsize=74)"

#error "100006FB0: call analysis failed (funcsize=74)"

#error "100007124: call analysis failed (funcsize=74)"

#error "100007298: call analysis failed (funcsize=74)"

#error "10000740C: call analysis failed (funcsize=74)"

void sub_100007504(char a1)
{
  if ((a1 & 1) == 0) {
    dispatch_once(&qword_100010AE0, &stru_10000C530);
  }
  uint64_t v1 = qword_100010AE8;
  if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_FAULT))
  {
    sub_100004BA0();
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TilesService replyMessage can't be NULL\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v6, 0x26u);
    if (qword_100010AE0 != -1) {
      dispatch_once(&qword_100010AE0, &stru_10000C530);
    }
  }
  if (os_signpost_enabled((os_log_t)qword_100010AE8))
  {
    sub_100004BA0();
    sub_100004B78((void *)&_mh_execute_header, v2, v3, v4, "#TilesService replyMessage can't be NULL", "{\"msg%{public}.0s\":\"#TilesService replyMessage can't be NULL\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v6);
    if (qword_100010AE0 != -1) {
      dispatch_once(&qword_100010AE0, &stru_10000C530);
    }
  }
  char v5 = qword_100010AE8;
  if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_INFO))
  {
    sub_100004BA0();
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#TilesService replyMessage can't be NULL\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v6, 0x26u);
  }
}

void sub_1000076AC(NSObject *label)
{
  if (qword_100010AE0 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    uint64_t v2 = qword_100010AE8;
    if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_FAULT))
    {
      dispatch_queue_get_label(label);
      dispatch_queue_get_label((dispatch_queue_t)qword_100011450);
      sub_100006CE4();
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"The passed queue in getSharedSessionInQueue is different to the one that had been statically set.\", \"queue\":%{public, location:escape_only}s, \"sharedSessionQueue\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
      if (qword_100010AE0 != -1) {
        dispatch_once(&qword_100010AE0, &stru_10000C6D0);
      }
    }
    uint64_t v3 = qword_100010AE8;
    if (os_signpost_enabled((os_log_t)qword_100010AE8))
    {
      dispatch_queue_get_label(label);
      dispatch_queue_get_label((dispatch_queue_t)qword_100011450);
      sub_100006CE4();
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "The passed queue in getSharedSessionInQueue is different to the one that had been statically set.", "{\"msg%{public}.0s\":\"The passed queue in getSharedSessionInQueue is different to the one that had been statically set.\", \"queue\":%{public, location:escape_only}s, \"sharedSessionQueue\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
      if (qword_100010AE0 != -1) {
        dispatch_once(&qword_100010AE0, &stru_10000C6D0);
      }
    }
    uint64_t v4 = qword_100010AE8;
    if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_INFO))
    {
      label = dispatch_queue_get_label(label);
      char v5 = dispatch_queue_get_label((dispatch_queue_t)qword_100011450);
      *(_DWORD *)buf = 68290051;
      int v7 = 0;
      __int16 v8 = 2082;
      unint64_t v9 = "";
      __int16 v10 = 2082;
      uint64_t v11 = label;
      __int16 v12 = 2082;
      uint64_t v13 = v5;
      __int16 v14 = 2082;
      unsigned int v15 = "assert";
      __int16 v16 = 2081;
      double v17 = "queue == sharedSessionQueue";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"The passed queue in getSharedSessionInQueue is different to the one that had been statically set.\", \"queue\":%{public, location:escape_only}s, \"sharedSessionQueue\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_100010AE0, &stru_10000C6D0);
  }
}

void sub_1000078F0()
{
  if (qword_100010AE0 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    uint64_t v0 = qword_100010AE8;
    if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_FAULT))
    {
      sub_100006CAC();
      _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Nothing was downloaded to #TilesService? Was it successful?\", \"error\":%{private, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (qword_100010AE0 != -1) {
        dispatch_once(&qword_100010AE0, &stru_10000C6D0);
      }
    }
    uint64_t v1 = qword_100010AE8;
    if (os_signpost_enabled((os_log_t)qword_100010AE8))
    {
      sub_100006CAC();
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v1, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Nothing was downloaded to #TilesService? Was it successful?", "{\"msg%{public}.0s\":\"Nothing was downloaded to #TilesService? Was it successful?\", \"error\":%{private, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (qword_100010AE0 != -1) {
        dispatch_once(&qword_100010AE0, &stru_10000C6D0);
      }
    }
    uint64_t v2 = qword_100010AE8;
    if (os_log_type_enabled((os_log_t)qword_100010AE8, OS_LOG_TYPE_INFO))
    {
      sub_100006CAC();
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Nothing was downloaded to #TilesService? Was it successful?\", \"error\":%{private, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_100010AE0, &stru_10000C6D0);
  }
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return _CFErrorGetDomain(err);
}

void CFRelease(CFTypeRef cf)
{
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t SecPolicyCreateAppleSSLPinned()
{
  return _SecPolicyCreateAppleSSLPinned();
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return _SecTrustEvaluateWithError(trust, error);
}

OSStatus SecTrustGetTrustResult(SecTrustRef trust, SecTrustResultType *result)
{
  return _SecTrustGetTrustResult(trust, result);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return _SecTrustSetPolicies(trust, policies);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t CLConnection::isEntitled()
{
  return CLConnection::isEntitled();
}

uint64_t CLConnection::sendMessage()
{
  return CLConnection::sendMessage();
}

uint64_t CLConnection::deferredDelete(CLConnection *this)
{
  return CLConnection::deferredDelete(this);
}

uint64_t CLConnection::setInterruptionHandler()
{
  return CLConnection::setInterruptionHandler();
}

uint64_t CLConnection::setDisconnectionHandler()
{
  return CLConnection::setDisconnectionHandler();
}

uint64_t CLConnection::setDefaultMessageHandler()
{
  return CLConnection::setDefaultMessageHandler();
}

uint64_t CLConnection::start(CLConnection *this)
{
  return CLConnection::start(this);
}

uint64_t CLConnectionServer::CLConnectionServer()
{
  return CLConnectionServer::CLConnectionServer();
}

void CLConnectionServer::~CLConnectionServer(CLConnectionServer *this)
{
}

uint64_t CLConnectionMessage::CLConnectionMessage()
{
  return CLConnectionMessage::CLConnectionMessage();
}

uint64_t CLConnectionMessage::getDictionaryOfClasses(CLConnectionMessage *this, NSSet *a2)
{
  return CLConnectionMessage::getDictionaryOfClasses(this, a2);
}

uint64_t CLConnectionMessage::name(CLConnectionMessage *this)
{
  return CLConnectionMessage::name(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
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

void std::terminate(void)
{
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

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return ___error();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return _dispatch_queue_get_label(queue);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int gzclose(gzFile file)
{
  return _gzclose(file);
}

int gzeof(gzFile file)
{
  return _gzeof(file);
}

gzFile gzopen(const char *a1, const char *a2)
{
  return _gzopen(a1, a2);
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  return _gzread(file, buf, len);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
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

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int unsetenv(const char *a1)
{
  return _unsetenv(a1);
}

uint64_t xpc_connection_create_listener()
{
  return _xpc_connection_create_listener();
}

void xpc_release(xpc_object_t object)
{
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allowsCellularAccess(void *a1, const char *a2, ...)
{
  return [a1 allowsCellularAccess];
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return [a1 authenticationMethod];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_decompressionCompletionHandler(void *a1, const char *a2, ...)
{
  return [a1 decompressionCompletionHandler];
}

id objc_msgSend_decompressionDestination(void *a1, const char *a2, ...)
{
  return [a1 decompressionDestination];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultSessionConfiguration];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_originalRequest(void *a1, const char *a2, ...)
{
  return [a1 originalRequest];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return [a1 protectionSpace];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return [a1 serverTrust];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return [a1 task];
}

id objc_msgSend_timeoutInterval(void *a1, const char *a2, ...)
{
  return [a1 timeoutInterval];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}