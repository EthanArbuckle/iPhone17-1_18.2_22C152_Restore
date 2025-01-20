id *sub_100002ECC(id *a1, void *a2)
{
  id v4;
  void *v5;
  NSObject *v6;
  BOOL v7;
  id *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id *v17;
  objc_super v18;
  void *v19;
  uint8_t buf[4];
  id *v21;
  __int16 v22;
  void *v23;

  v4 = a2;
  v5 = v4;
  if (a1)
  {
    if (!v4) {
      __break(1u);
    }
    v18.receiver = a1;
    v18.super_class = (Class)PKUISSBannerHandle;
    a1 = (id *)[super init];
    v6 = PKLogFacilityTypeGetObject();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (a1)
    {
      if (v7)
      {
        *(_DWORD *)buf = 134218240;
        v21 = a1;
        v22 = 2048;
        v23 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): creating for connection %p.", buf, 0x16u);
      }

      *((unsigned char *)a1 + 24) = 0;
      objc_storeStrong(a1 + 4, a2);
      v13 = _NSConcreteStackBlock;
      v14 = 3221225472;
      v15 = sub_1000030E4;
      v16 = &unk_10000C2B8;
      v8 = a1;
      v17 = v8;
      [v5 configureConnection:&v13];
      v9 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.PassbookUIService", @"AngelReply", v13, v14, v15, v16 name];
      v19 = v9;
      v10 = +[NSArray arrayWithObjects:&v19 count:1];
      v11 = v8[5];
      v8[5] = (id)v10;

      [a1[4] activate];
      a1 = v8;
    }
    else
    {
      if (v7)
      {
        *(_DWORD *)buf = 134217984;
        v21 = (id *)v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle: failed to allocate service for connection %p.", buf, 0xCu);
      }

      [v5 invalidate];
    }
  }

  return a1;
}

void sub_1000030E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)PKBannerServiceInterface();
  [v3 setInterface:v4];

  v5 = +[BSServiceQuality userInitiated];
  [v3 setServiceQuality:v5];

  [v3 setTargetQueue:&_dispatch_main_q];
  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000031DC;
  v6[3] = &unk_10000C290;
  id v7 = *(id *)(a1 + 32);
  [v3 setInvalidationHandler:v6];
}

void sub_1000031DC(uint64_t a1)
{
}

void sub_1000031E8(uint64_t a1, int a2)
{
  if (a1 && !*(unsigned char *)(a1 + 8))
  {
    *(unsigned char *)(a1 + 8) = 1;
    v4 = PKLogFacilityTypeGetObject();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v5)
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = a1;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): remotely invalidated.", (uint8_t *)&buf, 0xCu);
      }

      v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = 0;

      id v7 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;
    }
    else
    {
      if (v5)
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = a1;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): locally invalidated.", (uint8_t *)&buf, 0xCu);
      }

      v8 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = 0;

      unsigned int v9 = *(unsigned __int8 *)(a1 + 24);
      if (v9 - 2 >= 3)
      {
        if (v9 >= 2)
        {
LABEL_18:
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
          [WeakRetained bannerHandleDidInvalidate:a1];

          return;
        }
      }
      else if (!*(unsigned char *)(a1 + 25))
      {
        id v7 = (void *)sub_1000035A4(a1);
        if (v7)
        {
          id v10 = *(id *)(a1 + 32);
          v11 = *(void **)(a1 + 32);
          *(void *)(a1 + 32) = 0;

          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v28 = 0x2020000000;
          UIBackgroundTaskIdentifier v29 = UIBackgroundTaskInvalid;
          v12 = +[UIApplication sharedApplication];
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_1000036AC;
          v22[3] = &unk_10000C2E0;
          v22[4] = &buf;
          id v13 = [v12 beginBackgroundTaskWithName:@"banner.detach.transmit" expirationHandler:v22];
          *(void *)(*((void *)&buf + 1) + 24) = v13;

          v14 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v23 = 134218240;
            uint64_t v24 = a1;
            __int16 v25 = 2048;
            id v26 = v10;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): starting local invalidation of connection %p.", v23, 0x16u);
          }

          objc_initWeak((id *)v23, (id)a1);
          v15 = +[NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 24) == 4];
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_1000037A0;
          v18[3] = &unk_10000C308;
          objc_copyWeak(&v21, (id *)v23);
          id v16 = v10;
          id v19 = v16;
          p_long long buf = &buf;
          [v7 detachWithFinished:v15 reply:v18];

          objc_destroyWeak(&v21);
          objc_destroyWeak((id *)v23);
          _Block_object_dispose(&buf, 8);

          goto LABEL_17;
        }
      }
      [*(id *)(a1 + 32) invalidate];
      id v7 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;
    }
LABEL_17:

    goto LABEL_18;
  }
}

void sub_100003564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v22 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000035A4(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = *(void **)(result + 32);
    if (v2)
    {
      result = [v2 remoteTargetWithAssertionAttributes:*(void *)(v1 + 40)];
      if (result) {
        return result;
      }
      id v3 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      int v5 = 134217984;
      uint64_t v6 = v1;
      v4 = "PKUISSBannerHandle (%p): attempting to message inactive connection.";
    }
    else
    {
      id v3 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        return 0;
      }
      int v5 = 134217984;
      uint64_t v6 = v1;
      v4 = "PKUISSBannerHandle (%p): attempting to message invalidated connection.";
    }
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v5, 0xCu);
    goto LABEL_9;
  }
  return result;
}

void sub_1000036AC(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003724;
  block[3] = &unk_10000C2E0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100003724(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != UIBackgroundTaskInvalid)
  {
    v2 = +[UIApplication sharedApplication];
    [v2 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = UIBackgroundTaskInvalid;
  }
}

void sub_1000037A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    int v5 = PKLogFacilityTypeGetObject();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (WeakRetained)
    {
      if (v6)
      {
        int v13 = 134218242;
        id v14 = WeakRetained;
        __int16 v15 = 2112;
        id v16 = v3;
        id v7 = "PKUISSBannerHandle (%p): failed to notify remote of local invalidation - %@.";
        v8 = v5;
        uint32_t v9 = 22;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v13, v9);
      }
    }
    else if (v6)
    {
      int v13 = 138412290;
      id v14 = v3;
      id v7 = "PKUISSBannerHandle (?): failed to notify remote of local invalidation - %@.";
      v8 = v5;
      uint32_t v9 = 12;
      goto LABEL_7;
    }
  }
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(void **)(a1 + 32);
    int v13 = 134217984;
    id v14 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle: connection %p locally invalidated.", (uint8_t *)&v13, 0xCu);
  }

  [*(id *)(a1 + 32) invalidate];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != UIBackgroundTaskInvalid)
  {
    v12 = +[UIApplication sharedApplication];
    [v12 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = UIBackgroundTaskInvalid;
  }
}

void sub_10000396C(uint64_t a1)
{
  if (a1 && !*(unsigned char *)(a1 + 8))
  {
    int v2 = *(unsigned __int8 *)(a1 + 24);
    if (v2 == 2)
    {
      *(unsigned char *)(a1 + 24) = 3;
      v4 = *(void **)(a1 + 16);
      if (v4)
      {
        BOOL v6 = objc_retainBlock(v4);
        int v5 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = 0;

        v6[2](v6, 0);
      }
    }
    else if (v2 != 4)
    {
      id v3 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        uint64_t v8 = a1;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): out of order - start - invalidating.", buf, 0xCu);
      }

      sub_1000031E8(a1, 0);
    }
  }
}

void sub_100003AB8(uint64_t a1)
{
  if (a1 && !*(unsigned char *)(a1 + 8))
  {
    if ((*(unsigned char *)(a1 + 24) & 0xFE) == 2)
    {
      *(unsigned char *)(a1 + 24) = 4;
      int v2 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = 0;

      sub_1000031E8(a1, 0);
    }
    else
    {
      id v3 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 134217984;
        uint64_t v5 = a1;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): out of order - finish - invalidating.", (uint8_t *)&v4, 0xCu);
      }

      sub_1000031E8(a1, 0);
    }
  }
}

void sub_100003BDC(uint64_t a1, void *a2)
{
  id obj = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    if (WeakRetained != obj || !obj || !WeakRetained)
    {
      objc_storeWeak((id *)(a1 + 64), obj);
      if (*(unsigned char *)(a1 + 8)) {
        [obj bannerHandleDidInvalidate:a1];
      }
    }
  }
}

void sub_1000043D4(uint64_t a1)
{
  id v2 = (id)sub_1000062B8();
  sub_1000068EC((uint64_t)v2, *(void **)(a1 + 32));
}

void sub_100004428(uint64_t a1)
{
  id v2 = (id)sub_1000062B8();
  sub_100006BB4((uint64_t)v2, *(void **)(a1 + 32));
}

void sub_10000447C(uint64_t a1)
{
  id v2 = (id)sub_1000062B8();
  sub_100006CB0((uint64_t)v2, *(void *)(a1 + 32));
}

void sub_10000469C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

void sub_1000046BC(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004734;
  block[3] = &unk_10000C2E0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100004734(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != UIBackgroundTaskInvalid)
  {
    id v2 = +[UIApplication sharedApplication];
    [v2 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = UIBackgroundTaskInvalid;
  }
}

uint64_t sub_1000047B0(uint64_t result)
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

uint64_t sub_1000047BC(uint64_t result)
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

void sub_100004838()
{
  uint64_t v0 = self;
  id v1 = sub_100004868(v0, 1);
}

id sub_100004868(uint64_t a1, int a2)
{
  id result = self;
  if (a2)
  {
    if (qword_100012200)
    {
LABEL_8:
      __break(1u);
      return result;
    }
    int v4 = sub_10000492C([PKUISSListener_Banner alloc]);
    uint64_t v5 = (void *)qword_100012200;
    qword_100012200 = (uint64_t)v4;
  }
  id result = (id)qword_100012200;
  if (!qword_100012200) {
    goto LABEL_8;
  }

  return result;
}

void sub_1000048D4()
{
  self;
  uint64_t v0 = self;
  id v1 = (id *)sub_100004868(v0, 0);
  if (v1)
  {
    id v2 = v1;
    [v1[1] activate];
    id v1 = v2;
  }
}

void *sub_10000492C(void *a1)
{
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)PKUISSListener_Banner;
  [super init];
  id v2 = v1;
  if (v1)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100004A1C;
    v6[3] = &unk_10000C358;
    id v2 = v1;
    id v7 = v2;
    uint64_t v3 = +[BSServiceConnectionListener listenerWithConfigurator:v6];
    int v4 = (void *)v2[1];
    v2[1] = v3;
  }
  return v2;
}

void sub_100004A1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDomain:@"remote-ui"];
  [v3 setService:PKBannerServiceName];
  [v3 setDelegate:*(void *)(a1 + 32)];
}

void sub_1000050C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(&a27);
  objc_destroyWeak((id *)(v27 - 144));
  _Unwind_Resume(a1);
}

BOOL sub_1000050FC(id a1, NSUserActivity *a2)
{
  id v2 = [(NSUserActivity *)a2 activityType];
  unsigned __int8 v3 = [v2 isEqualToString:PKPassbookUISSUserActivityTypePeerPaymentRegistration];

  return v3;
}

void sub_100005144(uint64_t a1, uint64_t a2)
{
  int v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    uint64_t v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Error requesting destruction for session: %@, %@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_100005208(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v3 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[2] setRootViewController:0];
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v4)
  {
    uint64_t v5 = +[UIApplication sharedApplication];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000052F4;
    v6[3] = &unk_10000C3C0;
    id v7 = v4;
    [v5 requestSceneSessionDestruction:v7 options:0 errorHandler:v6];
  }
}

void sub_1000052F4(uint64_t a1, uint64_t a2)
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    uint64_t v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Error requesting destruction for session: %@, %@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t sub_1000053B8(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void sub_1000058E0(uint64_t a1, uint64_t a2)
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    uint64_t v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Failed to destruct in-app scene session %@, error: %@", (uint8_t *)&v6, 0x16u);
  }
}

id *sub_1000059D0(void *a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = v4;
  if (!a1) {
    goto LABEL_11;
  }
  if (!v4 || (sub_1000047B0((uint64_t)v4), (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    __break(1u);
LABEL_11:
    v12 = 0;
    goto LABEL_9;
  }
  uint64_t v7 = (void *)v6;
  v14.receiver = a1;
  v14.super_class = (Class)PKUISSPresentableContext;
  __int16 v8 = [super init];
  if (v8)
  {
    uint64_t v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218240;
      id v16 = v8;
      __int16 v17 = 2048;
      v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PKUISSPresentableContext (%p): creating for handle %p.", buf, 0x16u);
    }

    v8[6] = [v7 type];
    objc_storeStrong(v8 + 1, a2);
    objc_storeStrong(v8 + 2, a2);
    id v10 = [objc_alloc((Class)NSMutableArray) initWithObjects:v5, 0];
    id v11 = v8[3];
    v8[3] = v10;

    sub_100003BDC((uint64_t)v8[2], v8);
  }
  v12 = v8;

LABEL_9:
  return v12;
}

void sub_100005B58(uint64_t a1)
{
  if (a1 && !*(unsigned char *)(a1 + 32))
  {
    *(unsigned char *)(a1 + 32) = 1;
    long long v6 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v1 = *(id *)(a1 + 24);
    id v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (v2)
    {
      id v3 = v2;
      uint64_t v4 = *(void *)v7;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v1);
          }
          sub_10000396C(*(void *)(*((void *)&v6 + 1) + 8 * (void)v5));
          uint64_t v5 = (char *)v5 + 1;
        }
        while (v3 != v5);
        id v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      }
      while (v3);
    }
  }
}

void sub_100005C58(uint64_t a1)
{
  if (a1 && !*(unsigned char *)(a1 + 33))
  {
    *(unsigned char *)(a1 + 33) = 1;
    long long v6 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v1 = *(id *)(a1 + 24);
    id v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (v2)
    {
      id v3 = v2;
      uint64_t v4 = *(void *)v7;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v1);
          }
          sub_100003AB8(*(void *)(*((void *)&v6 + 1) + 8 * (void)v5));
          uint64_t v5 = (char *)v5 + 1;
        }
        while (v3 != v5);
        id v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      }
      while (v3);
    }
  }
}

uint64_t sub_100005D58(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 34))
    {
      __break(1u);
      return _objc_release_x1(v3, v4);
    }
    *(unsigned char *)(a1 + 34) = 1;
    long long v7 = v3;
    id v3 = objc_storeWeak((id *)(a1 + 40), v3);
    id v4 = v7;
    if (v7)
    {
      uint64_t v5 = sub_1000047BC(*(void *)(a1 + 8));
      [v7 setBannerState:v5];

      id v3 = [v7 setBannerDetached:*(void *)(a1 + 16) == 0];
      id v4 = v7;
    }
  }

  return _objc_release_x1(v3, v4);
}

void sub_100005DFC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (!v3) {
      goto LABEL_20;
    }
    uint64_t v5 = sub_1000047B0((uint64_t)v3);
    if (!v5) {
      goto LABEL_20;
    }
    long long v6 = v5;
    unint64_t v7 = (unint64_t)[v5 type];
    if (v7 != *(void *)(a1 + 48) || (v7 | 2) == 2) {
      goto LABEL_20;
    }
    long long v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134218240;
      uint64_t v16 = a1;
      __int16 v17 = 2048;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PKUISSPresentableContext (%p): coalescing handle %p.", (uint8_t *)&v15, 0x16u);
    }

    [*(id *)(a1 + 24) addObject:v4];
    if (*(unsigned char *)(a1 + 32)) {
      sub_10000396C((uint64_t)v4);
    }
    if (*(unsigned char *)(a1 + 33)) {
      sub_100003AB8((uint64_t)v4);
    }
    sub_100003BDC((uint64_t)v4, (void *)a1);
    if (*(unsigned char *)(a1 + 33)) {
LABEL_20:
    }
      __break(1u);
    if (!*(void *)(a1 + 16))
    {
      uint64_t v9 = [*(id *)(a1 + 24) firstObject];
      id v10 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v9;

      id v11 = *(void **)(a1 + 16);
      if (v11)
      {
        v12 = (uint64_t *)(a1 + 8);
        objc_storeStrong((id *)(a1 + 8), v11);
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        if (WeakRetained)
        {
          objc_super v14 = sub_1000047BC(*v12);
          [WeakRetained setBannerState:v14];

          [WeakRetained setBannerDetached:0];
        }
      }
    }
  }
}

uint64_t sub_100005FB8(uint64_t result)
{
  if (result)
  {
    sub_1000047BC(*(void *)(result + 8));
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

id sub_100006198(uint64_t a1, uint64_t a2)
{
  self;
  if (qword_100012208 != -1) {
    dispatch_once(&qword_100012208, &stru_10000C450);
  }
  uint64_t v3 = qword_100012210;

  return +[PKBannerPresentationManager _managerForDestination:a2 withProvider:v3];
}

void sub_100006208(id a1)
{
  qword_100012210 = (uint64_t)sub_100006248([PKUISSBannerPresentableProvider alloc]);

  _objc_release_x1();
}

void *sub_100006248(void *a1)
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)PKUISSBannerPresentableProvider;
  [super init];
  if (v1)
  {
    id v2 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v3 = (void *)v1[2];
    v1[2] = v2;
  }
  return v1;
}

uint64_t sub_1000062B8()
{
  self;
  uint64_t v0 = self;
  id v1 = sub_100006198(v0, 0);
  uint64_t v2 = [v1 provider];

  return v2;
}

id sub_1000067F8(uint64_t a1)
{
  uint64_t v2 = sub_1000047B0(*(void *)(a1 + 32));
  id v3 = [v2 createBannerViewController];

  sub_100005D58(*(void *)(a1 + 40), v3);
  return v3;
}

id sub_10000684C(uint64_t a1)
{
  uint64_t v2 = sub_1000047B0(*(void *)(a1 + 32));
  id v3 = [v2 createBannerViewController];

  sub_100005D58(*(void *)(a1 + 40), v3);
  return v3;
}

id sub_1000068A0(uint64_t a1)
{
  id v1 = sub_1000047B0(*(void *)(a1 + 32));
  id v2 = [v1 createBannerViewController];

  return v2;
}

void sub_1000068DC(uint64_t a1)
{
}

void sub_1000068E4(uint64_t a1)
{
}

void sub_1000068EC(uint64_t a1, void *a2)
{
  if (a1) {
    sub_1000068F8(a1, a2);
  }
}

void sub_1000068F8(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_super v5 = v4;
  if (a1 && v4)
  {
    uint64_t v6 = self;
    id v7 = sub_100006198(v6, 0);
    long long v8 = sub_1000047B0((uint64_t)v5);
    uint64_t v9 = [v8 passUniqueIdentifier];

    uint64_t v12 = *(void *)(a1 + 8);
    id v11 = (id *)(a1 + 8);
    uint64_t v10 = v12;
    if (v12)
    {
      int v13 = sub_1000047B0(v10);
      id v14 = [v13 passUniqueIdentifier];

      unsigned int v15 = [v9 isEqualToString:v14];
      uint64_t v16 = PKLogFacilityTypeGetObject();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (v17)
        {
          int v31 = 138412290;
          id v32 = v14;
          v18 = "PKUISSBannerPresentableProvider: coalescing express transaction for %@.";
          id v19 = v16;
          uint32_t v20 = 12;
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v31, v20);
        }
      }
      else if (v17)
      {
        int v31 = 138412546;
        id v32 = v9;
        __int16 v33 = 2112;
        id v34 = v14;
        v18 = "PKUISSBannerPresentableProvider: subsuming express transaction for %@ with banner for %@.";
        id v19 = v16;
        uint32_t v20 = 22;
        goto LABEL_12;
      }
LABEL_20:

      goto LABEL_21;
    }
    id v14 = [v7 _currentRequest];
    uint64_t v21 = [v14 context];
    uint64_t v16 = v21;
    if (!v21 || *(void *)(v21 + 48))
    {
      objc_storeStrong(v11, a2);
      [v7 _setNeedsUpdate];
      goto LABEL_20;
    }
    id v22 = *(id *)(v21 + 8);
    v23 = sub_1000047B0((uint64_t)v22);
    uint64_t v24 = [v23 passUniqueIdentifier];

    unsigned int v25 = [v9 isEqualToString:v24];
    id v26 = PKLogFacilityTypeGetObject();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (v27)
      {
        int v31 = 138412290;
        id v32 = v24;
        uint64_t v28 = "PKUISSBannerPresentableProvider: coalescing express transaction for %@.";
        UIBackgroundTaskIdentifier v29 = v26;
        uint32_t v30 = 12;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v31, v30);
      }
    }
    else if (v27)
    {
      int v31 = 138412546;
      id v32 = v9;
      __int16 v33 = 2112;
      id v34 = v24;
      uint64_t v28 = "PKUISSBannerPresentableProvider: subsuming express transaction for %@ with banner for %@.";
      UIBackgroundTaskIdentifier v29 = v26;
      uint32_t v30 = 22;
      goto LABEL_18;
    }

    goto LABEL_20;
  }
LABEL_21:
}

void sub_100006BB4(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (a1)
  {
    id v3 = *(id *)(a1 + 24);
    if (v3
      || (uint64_t v4 = self,
          id v5 = sub_100006198(v4, 0),
          id v6 = [v5 _currentRequest],
          [v6 context],
          id v3 = objc_claimAutoreleasedReturnValue(),
          v6,
          v5,
          v3)
      && v3[6] == 1)
    {
      sub_100005DFC((uint64_t)v3, v10);
    }
    else
    {

      id v7 = sub_1000059D0([PKUISSPresentableContext alloc], v10);
      long long v8 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v7;

      uint64_t v9 = self;
      id v3 = sub_100006198(v9, 0);
      [v3 _setNeedsUpdate];
    }
  }
}

void sub_100006CB0(uint64_t a1, uint64_t a2)
{
  if (a1) {
    sub_100006CBC(a1, a2);
  }
}

void sub_100006CBC(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    [*(id *)(a1 + 16) addObject:a2];
    uint64_t v2 = self;
    id v3 = sub_100006198(v2, 0);
    [v3 _setNeedsUpdate];
  }
}

void sub_100007208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(v29);
  objc_destroyWeak(location);
  objc_destroyWeak(&a28);
  objc_destroyWeak(a12);
  objc_destroyWeak(a11);
  objc_destroyWeak((id *)(v30 - 192));
  objc_destroyWeak((id *)(v30 - 144));
  _Unwind_Resume(a1);
}

BOOL sub_100007264(id a1, NSUserActivity *a2)
{
  uint64_t v2 = [(NSUserActivity *)a2 activityType];
  unsigned __int8 v3 = [v2 isEqualToString:PKPassbookUISSUserActivityTypeInAppPayment];

  return v3;
}

void sub_1000072AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    uint64_t v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Error requesting destruction for session: %@, %@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_100007370(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v3 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 3) setRootViewController:0];
    uint64_t v4 = (void *)v3[2];
    v3[2] = 0;
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5)
  {
    int v6 = +[UIApplication sharedApplication];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100007470;
    v7[3] = &unk_10000C3C0;
    id v8 = v5;
    [v6 requestSceneSessionDestruction:v8 options:0 errorHandler:v7];
  }
}

void sub_100007470(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    uint64_t v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Error requesting destruction for session: %@, %@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_100007534(uint64_t a1, int a2)
{
  uint64_t v4 = (id *)(a1 + 64);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v6 = objc_alloc_init((Class)PKPaymentAuthorizationRemoteAlertViewController);
    uint64_t v7 = v6;
    if (a2) {
      [v6 setBlocksInput];
    }
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 56);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000076BC;
    v13[3] = &unk_10000C540;
    objc_copyWeak(&v16, v4);
    id v10 = v7;
    id v14 = v10;
    id v15 = *(id *)(a1 + 40);
    [v10 configureWithUserInfo:v8 dismissalHandler:v9 completion:v13];
    objc_storeStrong(WeakRetained + 1, v7);
    objc_storeStrong(WeakRetained + 2, *(id *)(a1 + 48));
    id v11 = objc_loadWeakRetained((id *)(a1 + 72));
    id v12 = objc_loadWeakRetained((id *)(a1 + 80));
    [v11 inAppPaymentInterfaceWillPresentWithSceneSession:v12];

    objc_destroyWeak(&v16);
  }
}

void sub_1000076A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000076BC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) noteActivatedWithPresentationMode:0];
    id v2 = [objc_alloc((Class)UIWindow) initWithWindowScene:*(void *)(a1 + 40)];
    [v2 setRootViewController:*(void *)(a1 + 32)];
    [v2 makeKeyAndVisible];
    [v2 setOverrideUserInterfaceStyle:2];
    [WeakRetained setWindow:v2];
  }
}

int main(int argc, const char **argv, const char **envp)
{
  id v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  sub_100004838();
  sub_1000048D4();
  LODWORD(argv) = UIApplicationMain(argc, (char **)argv, 0, v7);

  return (int)argv;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PKBannerServiceInterface()
{
  return _PKBannerServiceInterface();
}

uint64_t PKLogFacilityTypeGetObject()
{
  return _PKLogFacilityTypeGetObject();
}

uint64_t PKSystemApertureIsAvailable()
{
  return _PKSystemApertureIsAvailable();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__currentRequest(void *a1, const char *a2, ...)
{
  return [a1 _currentRequest];
}

id objc_msgSend__setNeedsUpdate(void *a1, const char *a2, ...)
{
  return [a1 _setNeedsUpdate];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return [a1 activityType];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_createBannerViewController(void *a1, const char *a2, ...)
{
  return [a1 createBannerViewController];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_passUniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 passUniqueIdentifier];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return [a1 provider];
}

id objc_msgSend_remoteProcess(void *a1, const char *a2, ...)
{
  return [a1 remoteProcess];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_setBlocksInput(void *a1, const char *a2, ...)
{
  return [a1 setBlocksInput];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_userActivities(void *a1, const char *a2, ...)
{
  return [a1 userActivities];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInitiated(void *a1, const char *a2, ...)
{
  return [a1 userInitiated];
}