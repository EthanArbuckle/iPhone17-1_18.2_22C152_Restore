id sub_1000045DC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void (**v5)(void, void);
  void *v6;
  void *v7;
  unsigned __int8 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t v13[8];
  void v14[4];
  id v15;
  uint64_t vars8;

  v3 = a2;
  if ([*(id *)(a1 + 32) _shouldFetchFromServer:v3])
  {
    v4 = [*(id *)(a1 + 32) fetchCircleFromServerWithCacheResponse:v3];
    v5 = [v4 catch];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000079F4;
    v14[3] = &unk_10004D188;
    v15 = v3;
    v6 = ((void (**)(void, void *))v5)[2](v5, v14);
  }
  else
  {
    v7 = +[NSUserDefaults standardUserDefaults];
    v8 = [v7 BOOLForKey:FAFamilyMarqueeHasEverBeenCalled];

    if ((v8 & 1) == 0)
    {
      v9 = _FALogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Requested marquee for first time and setting member count on familycircle cache hit.", v13, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 40) updateMarqueeCache];
    }
    v10 = *(void **)(a1 + 32);
    v11 = [v3 familyCircle];
    [v10 updateUserDefaultsWithFamilyCircle:v11];

    v6 = [v3 familyCircle];
  }

  return v6;
}

void sub_100004888(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v6 = 0;
  v3 = a2;
  v4 = [v2 loadWithError:&v6];
  id v5 = v6;
  v3[2](v3, v4, v5);
}

id sub_100004908(uint64_t a1)
{
  v1 = [*(id *)(*(void *)(a1 + 32) + 88) load];
  v2 = [v1 catch];
  v3 = ((void (**)(void, Block_layout *))v2)[2](v2, &stru_10004D138);

  return v3;
}

void sub_100004AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004AB8(void *a1)
{
  v2 = (void *)a1[4];
  id v9 = 0;
  v3 = [v2 _cacheURLWithError:&v9];
  id v4 = v9;
  id v5 = [v3 path];

  if (v5)
  {
    uint64_t v6 = +[NSData dataWithContentsOfFile:v5 options:0 error:a1[6]];
    uint64_t v7 = *(void *)(a1[5] + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else if (v4 && a1[6])
  {
    *(void *)a1[6] = v4;
  }
}

id sub_100004DF8(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) networkService];
  v2 = [v1 ensureAccount];

  return v2;
}

void sub_1000050CC(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    uint64_t v7 = (uint64_t)v10;
    if (!v10)
    {
      uint64_t v7 = [v6 cachedFamilyCircle];
    }
    id v10 = (id)v7;
    id v5 = [v6 underlyingError];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [v10 _serverResponse];
  (*(void (**)(uint64_t, void *, id, id))(v8 + 16))(v8, v9, v10, v5);
}

id sub_1000059FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v24 = a4;
  uint64_t v25 = a5;
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t v21 = a1;
  type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin();
  type metadata accessor for DispatchQoS();
  __chkstk_darwin();
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  id v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = OBJC_IVAR___FARateLimiter_encoder;
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  v11 = v5;
  *(void *)&v5[v10] = JSONEncoder.init()();
  uint64_t v12 = OBJC_IVAR___FARateLimiter_decoder;
  type metadata accessor for JSONDecoder();
  swift_allocObject();
  *(void *)&v11[v12] = JSONDecoder.init()();
  uint64_t v13 = OBJC_IVAR___FARateLimiter_queue;
  sub_10002A9B0(0, (unint64_t *)&qword_10005E520);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v6);
  static DispatchQoS.unspecified.getter();
  v27 = &_swiftEmptyArrayStorage;
  sub_100006D78((unint64_t *)&unk_10005EA60, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100006CB4((uint64_t *)&unk_10005E530);
  sub_100006CF8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  *(void *)&v11[v13] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  uint64_t v14 = v22;
  *(void *)&v11[OBJC_IVAR___FARateLimiter_persistence] = v21;
  v15 = &v11[OBJC_IVAR___FARateLimiter_identifier];
  uint64_t v16 = v23;
  *(void *)v15 = v14;
  *((void *)v15 + 1) = v16;
  v17 = &v11[OBJC_IVAR___FARateLimiter_getDate];
  uint64_t v18 = v25;
  *(void *)v17 = v24;
  *((void *)v17 + 1) = v18;
  swift_unknownObjectRetain();
  swift_retain();

  v19 = (objc_class *)type metadata accessor for RateLimiter();
  v26.receiver = v11;
  v26.super_class = v19;
  return objc_msgSendSuper2(&v26, "init");
}

void sub_1000069D4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 72);
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"ClientProcess"];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"promptUserToResolveAuthenticatonFailure"];
  uint64_t v8 = objc_msgSend(v4, "_fetchFamilyCircleWithCachePolicy:signedInAccountShouldBeApprover:clientProcess:context:promptUserToResolveAuthenticatonFailure:", v2, v3, v5, v6, objc_msgSend(v7, "BOOLValue"));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000050CC;
  v9[3] = &unk_10004DE30;
  id v10 = *(id *)(a1 + 56);
  [v8 onComplete:v9];
}

uint64_t sub_100006C80()
{
  return swift_release();
}

uint64_t sub_100006C88()
{
  return swift_release();
}

uint64_t sub_100006C94(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006CA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006CB4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100006CF8()
{
  unint64_t result = qword_10005EA70;
  if (!qword_10005EA70)
  {
    sub_100021730((uint64_t *)&unk_10005E530);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EA70);
  }
  return result;
}

uint64_t type metadata accessor for RateLimiter()
{
  return self;
}

uint64_t sub_100006D78(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_100006E00(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No iCloud, no family", v1, 2u);
}

void sub_100007170()
{
  signal(15, (void (__cdecl *)(int))1);
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  uint64_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100007240;
  handler[3] = &unk_10004D068;
  handler[4] = Current;
  dispatch_source_set_event_handler(v2, handler);
  dispatch_resume(v2);
  CFRunLoopRun();
}

void sub_100007240(uint64_t a1)
{
}

void start()
{
  v1 = objc_alloc_init(FAServiceDelegateQueueProvider);
  uint64_t v2 = [[FamilyCircleServiceDelegate alloc] initWithQueueProvider:v1];
  id v3 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.familycircle.agent"];
  [v3 setDelegate:v2];
  [v3 resume];
  id v4 = [(FamilyCircleServiceDelegate *)v2 familyRefreshActivityScheduler];
  id v5 = +[FAPushHelperService sharedInstance];
  [v5 setFamilyRefreshActivityScheduler:v4];

  uint64_t v6 = +[FAPushHelperService sharedInstance];
  [v6 start];

  dispatch_main();
}

void *sub_10000751C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) networkService];
  +[FAFamilyCircleDaemonChangeHandler handleDidRemoveMemberWithNetworkService:v4 completion:0];

  id v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FARemoveFamilyMemberOperation removeMember complete with: %@", (uint8_t *)&v7, 0xCu);
  }

  return &__kCFBooleanTrue;
}

id sub_1000079EC(id a1, NSError *a2)
{
  return 0;
}

id sub_1000079F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000347E0(v3, v4);
  }

  id v5 = [*(id *)(a1 + 32) familyCircle];
  uint64_t v6 = +[FAFailedFetchInfoError errorWithCachedFamilyCircle:v5 underlyingError:v3];

  return v6;
}

id sub_100007BDC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _fetchCircleRequestWithCacheResponse:*(void *)(a1 + 40)];
  id v3 = [v2 catch];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007D40;
  v10[3] = &unk_10004D200;
  id v4 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v4;
  id v5 = ((void (**)(void, void *))v3)[2](v3, v10);
  uint64_t v6 = [v5 then];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007E78;
  v9[3] = &unk_10004D228;
  void v9[4] = *(void *)(a1 + 32);
  int v7 = ((void (**)(void, void *))v6)[2](v6, v9);

  return v7;
}

id sub_100007D40(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 code] == (id)401
    && ([v3 domain],
        id v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 isEqual:@"com.apple.appleaccount"],
        v4,
        v5))
  {
    uint64_t v6 = [*(id *)(a1 + 32) _renewCredentials];
    int v7 = [v6 then];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100007E6C;
    v11[3] = &unk_10004D1D8;
    id v8 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v8;
    ((void (**)(void, void *))v7)[2](v7, v11);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = v3;
  }

  return v9;
}

id sub_100007E6C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchCircleRequestWithCacheResponse:*(void *)(a1 + 40)];
}

id sub_100007E78(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 32) reschedule];
  +[FAFamilyCFUScheduler scheduleWakeupIfNeeded];
  return v3;
}

void sub_100008010(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [FAFamilyDetailsRequest alloc];
  unsigned int v5 = [*(id *)(a1 + 32) networkService];
  uint64_t v6 = [v5 account];
  int v7 = [(FAFamilyDetailsRequest *)v4 initWithAccount:v6];

  id v8 = [(FAFamilyDetailsRequest *)v7 urlRequest];
  id v9 = [v8 allHTTPHeaderFields];
  id v10 = [v9 objectForKey:@"Authorization"];

  if (v10 && [v10 length])
  {
    id v11 = +[NSMutableDictionary dictionary];
    id v12 = [*(id *)(a1 + 32) clientProcess];
    uint64_t v13 = [*(id *)(a1 + 32) context];
    id v14 = [v13 length];

    if (v14)
    {
      v15 = [*(id *)(a1 + 32) clientProcess];
      uint64_t v16 = [*(id *)(a1 + 32) context];
      uint64_t v17 = [v15 stringByAppendingFormat:@"-%@", v16];

      id v12 = (void *)v17;
    }
    [v11 setObject:v12 forKeyedSubscript:@"X-Apple-Client-Process"];
    uint64_t v18 = [*(id *)(a1 + 32) cachePolicyString];
    [v11 setObject:v18 forKeyedSubscript:@"X-Apple-Cache-Policy"];

    v19 = [*(id *)(a1 + 40) familyCircle];

    if (v19)
    {
      v20 = [*(id *)(a1 + 40) cacheDate];
      [v20 timeIntervalSince1970];
      uint64_t v22 = +[NSString stringWithFormat:@"%ld", (uint64_t)v21];
      [v11 setObject:v22 forKeyedSubscript:@"X-Apple-Cache-Date"];

      [*(id *)(a1 + 40) maxAge];
      uint64_t v24 = +[NSString stringWithFormat:@"%ld", (uint64_t)v23];
      [v11 setObject:v24 forKeyedSubscript:@"X-Apple-Cache-MaxAge"];

      uint64_t v25 = [*(id *)(a1 + 40) serverTag];
      [v11 setObject:v25 forKeyedSubscript:@"X-Apple-Cache-ServerTag"];
    }
    id v26 = [v11 copy];
    [(FAFamilyDetailsRequest *)v7 setCustomHeaders:v26];

    v27 = _FASignpostLogSystem();
    uint64_t v28 = _FASignpostCreate();
    uint64_t v30 = v29;

    v31 = _FASignpostLogSystem();
    v32 = v31;
    if ((unint64_t)(v28 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_BEGIN, v28, "FetchFamilyCircleRequest", " enableTelemetry=YES ", buf, 2u);
    }

    v33 = _FASignpostLogSystem();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      sub_1000348BC(v28, v33);
    }

    v34 = _FALogSystem();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Perform family details request.", buf, 2u);
    }

    v35 = [*(id *)(a1 + 32) networkService];
    v36 = [v35 urlSession];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000084A4;
    v38[3] = &unk_10004D278;
    uint64_t v40 = v28;
    uint64_t v41 = v30;
    id v39 = v3;
    [(FAFamilyDetailsRequest *)v7 performRequestWithSession:v36 withHandler:v38];
  }
  else
  {
    v37 = _FALogSystem();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_100034878(v37);
    }

    id v11 = +[NSError errorWithDomain:FAErrorDomain code:-1007 userInfo:0];
    (*((void (**)(id, void, void *))v3 + 2))(v3, 0, v11);
  }
}

void sub_1000084A4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Nanoseconds = _FASignpostGetNanoseconds();
  id v9 = _FASignpostLogSystem();
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 40);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v17 = 67240448;
    *(_DWORD *)uint64_t v18 = [v6 statusCode];
    *(_WORD *)&v18[4] = 1026;
    *(_DWORD *)&v18[6] = [v7 code];
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, v11, "FetchFamilyCircleRequest", " StatusCode=%{public,signpost.telemetry:number1,name=StatusCode}d  ErrorCode=%{public,signpost.telemetry:number2,name=ErrorCode}d ", (uint8_t *)&v17, 0xEu);
  }

  id v12 = _FASignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    double v13 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    uint64_t v14 = *(void *)(a1 + 40);
    unsigned int v15 = [v6 statusCode];
    unsigned int v16 = [v7 code];
    int v17 = 134218752;
    *(void *)uint64_t v18 = v14;
    *(_WORD *)&v18[8] = 2048;
    double v19 = v13;
    __int16 v20 = 1026;
    unsigned int v21 = v15;
    __int16 v22 = 1026;
    unsigned int v23 = v16;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "END [%lld] %fs:FetchFamilyCircleRequest  StatusCode=%{public,signpost.telemetry:number1,name=StatusCode}d  ErrorCode=%{public,signpost.telemetry:number2,name=ErrorCode}d ", (uint8_t *)&v17, 0x22u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100008680(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _familyCircleWithResponse:a2];
}

void sub_100008754(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_signpost_id_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling server response.", v11, 2u);
  }

  unsigned int v5 = [*(id *)(a1 + 32) responseDictionary];

  if (v5)
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) responseDictionary];
    id v8 = [*(id *)(a1 + 32) httpResponse];
    id v9 = [v8 allHeaderFields];
    [v6 familyCircleWithServerResponse:v7 responseHeaders:v9 completion:v3];
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) error];

    if (v10) {
      [*(id *)(a1 + 32) error];
    }
    else {
    id v7 = +[NSError errorWithDomain:FAErrorDomain code:-1002 userInfo:0];
    }
    v3[2](v3, 0, v7);
  }
}

void sub_100008940(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Family details request returned 401. We need to re-auth...", buf, 2u);
  }

  v17[0] = kACRenewCredentialsShouldForceKey;
  unsigned int v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) promptUserToResolveAuthenticatonFailure]);
  v18[0] = v5;
  v17[1] = kACRenewCredentialsShouldAvoidUIKey;
  id v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(a1 + 32) promptUserToResolveAuthenticatonFailure] ^ 1);
  v18[1] = v6;
  v17[2] = kACRenewCredentialsServicesKey;
  uint64_t v16 = AAGrandSlamAppTokenIDiCloudSettings;
  id v7 = +[NSArray arrayWithObjects:&v16 count:1];
  v18[2] = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

  id v9 = [*(id *)(a1 + 32) _accountStore];
  id v10 = [*(id *)(a1 + 32) networkService];
  os_signpost_id_t v11 = [v10 account];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100008B74;
  v13[3] = &unk_10004D2F0;
  id v14 = v3;
  id v12 = v3;
  [v9 renewCredentialsForAccount:v11 options:v8 completion:v13];
}

void sub_100008B74(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = _FALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    uint64_t v10 = a2;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Result of renewing credentials for family details request: %ld. Error: %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (a2)
  {
    id v8 = +[NSNumber numberWithInteger:a2];
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v5);
  }
  else
  {
    id v8 = +[NSNumber numberWithInteger:0];
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
  }
}

void sub_100009058(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [*(id *)(*(void *)(a1 + 32) + 40) updateMarqueeCache];
  id v5 = _FALogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v7 = 136315394;
      id v8 = "-[FAFetchFamilyCircleOperation familyCircleWithServerResponse:responseHeaders:completion:]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: failed to update family circle cache. Error: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    if (v6)
    {
      int v7 = 136315138;
      id v8 = "-[FAFetchFamilyCircleOperation familyCircleWithServerResponse:responseHeaders:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: successfully updated family circle cache.", (uint8_t *)&v7, 0xCu);
    }

    if ([*(id *)(a1 + 32) cachePolicy] != (id)2) {
      +[FABroadcaster broadcastFamilyChangedNotification];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000926C(id a1, id a2)
{
  id v2 = a2;
  id v3 = +[AMSBag bagForProfile:@"AppStore" profileVersion:@"1"];
  id v4 = [v3 stringForKey:@"countryCode"];
  id v5 = +[NSLocale currentLocale];
  BOOL v6 = [v5 objectForKey:NSLocaleCountryCode];
  int v7 = [v6 uppercaseString];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000093A4;
  v10[3] = &unk_10004D3C0;
  id v11 = v7;
  id v12 = v2;
  id v8 = v2;
  id v9 = v7;
  [v4 valueWithCompletion:v10];
}

void sub_1000093A4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = _FALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100034A24(a1, v9);
    }

    id v8 = *(id *)(a1 + 32);
    if (!v8)
    {
      id v8 = FAUnknownStoreFrontCode;
      id v10 = _FALogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000349AC((uint64_t)v8, v10);
      }
    }
  }
  id v11 = _FALogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100034934((uint64_t)v8, v11);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_100009828(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 networkService];
  id v6 = objc_msgSend(v5, "standardRequestWithURL:method:body:requestFormat:responseFormat:", v4, @"POST", *(void *)(a1 + 40), 1, objc_msgSend(*(id *)(a1 + 32), "responseFormat"));

  return v6;
}

id sub_1000098B8(id a1, id a2)
{
  return &__kCFBooleanTrue;
}

id sub_100009AB0(id a1, id a2)
{
  id v2 = a2;
  id v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FADeleteFamilyOperation deleteFamily complete with: %@", (uint8_t *)&v5, 0xCu);
  }

  return &__kCFBooleanTrue;
}

void sub_100009E60(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) dsid];

  int v5 = _FALogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Fetching presets from screentime client", buf, 2u);
    }

    id v7 = [*(id *)(a1 + 40) presetsProvider];
    id v8 = [*(id *)(a1 + 32) dsid];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100009FE8;
    v10[3] = &unk_10004D488;
    id v9 = *(void **)(a1 + 48);
    void v10[4] = *(void *)(a1 + 40);
    id v11 = v9;
    id v12 = v3;
    [v7 currentConfigurationForDSID:v8 completion:v10];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No current presets, dsid == nil", buf, 2u);
    }

    (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
  }
}

void sub_100009FE8(void *a1, uint64_t a2, void *a3)
{
  int v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  id v7 = a3;
  id v8 = [v5 _presetsWithCurrentConfiguration:a2 expectedPreset:v6];
  (*(void (**)(void))(a1[6] + 16))();
}

id sub_10000A754(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectAtIndexedSubscript:0];
  int v5 = +[NSNull null];
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {

    id v4 = 0;
  }
  id v7 = [v3 objectAtIndexedSubscript:1];
  id v8 = +[NSNull null];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {

    id v7 = 0;
  }
  id v10 = [v4 memberForAltDSID:*(void *)(a1 + 32)];
  id v11 = [v10 age];
  if ((uint64_t)v11 <= 0)
  {
    id v12 = _FALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      double v13 = +[NSNumber numberWithInteger:v11];
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      id v26 = v13;
      __int16 v27 = 2112;
      uint64_t v28 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Invalid FAFamilyMember age (%@) falling back to passed in age (%@)", buf, 0x16u);
    }
    id v11 = [*(id *)(a1 + 40) integerValue];
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000AA44;
  v23[3] = &unk_10004D4D0;
  v23[4] = v11;
  unsigned int v15 = objc_msgSend(v7, "fa_firstObjectMatching:", v23);
  if (!v15)
  {
    uint64_t v16 = _FALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100034AA0(v16);
    }
  }
  id v17 = [objc_alloc((Class)AAFPromise) initWithValue:v10];
  v24[0] = v17;
  id v18 = [objc_alloc((Class)AAFPromise) initWithValue:v15];
  v24[1] = v18;
  id v19 = [objc_alloc((Class)AAFPromise) initWithValue:v7];
  v24[2] = v19;
  __int16 v20 = +[NSArray arrayWithObjects:v24 count:3];
  unsigned int v21 = +[AAFPromise all:v20];

  return v21;
}

BOOL sub_10000AA44(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 minAge];
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = (uint64_t)v4 <= v5 && v5 <= (uint64_t)[v3 maxAge];

  return v6;
}

id sub_10000AA9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectAtIndexedSubscript:0];
  uint64_t v5 = +[NSNull null];
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {

    id v4 = 0;
  }
  id v7 = [v3 objectAtIndexedSubscript:1];
  id v8 = [v3 objectAtIndexedSubscript:2];

  unsigned int v9 = +[NSNull null];
  unsigned int v10 = [v7 isEqual:v9];

  if (v10)
  {

    id v7 = 0;
  }
  id v11 = [*(id *)(a1 + 32) _currentPresets:v4 expectedPreset:v7];
  id v12 = objc_msgSend(objc_alloc((Class)AAFPromise), "initWithValue:", v7, v11);
  v17[1] = v12;
  id v13 = [objc_alloc((Class)AAFPromise) initWithValue:v8];
  v17[2] = v13;
  uint64_t v14 = +[NSArray arrayWithObjects:v17 count:3];
  unsigned int v15 = +[AAFPromise all:v14];

  return v15;
}

FASettingsPresetsResponse *__cdecl sub_10000AC64(id a1, NSArray *a2)
{
  id v2 = a2;
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v4 = +[NSNull null];
  unsigned int v5 = [v3 isEqual:v4];

  if (v5)
  {

    id v3 = 0;
  }
  unsigned int v6 = [(NSArray *)v2 objectAtIndexedSubscript:1];
  id v7 = +[NSNull null];
  unsigned int v8 = [v6 isEqual:v7];

  if (v8)
  {

    unsigned int v6 = 0;
  }
  unsigned int v9 = [(NSArray *)v2 objectAtIndexedSubscript:2];
  unsigned int v10 = +[NSNull null];
  unsigned int v11 = [v9 isEqual:v10];

  if (v11)
  {

    unsigned int v9 = 0;
  }
  id v12 = [objc_alloc((Class)FASettingsPresetsResponse) initWithAvailablePresets:v9 expectedPreset:v6 currentPreset:v3];

  return (FASettingsPresetsResponse *)v12;
}

id sub_10000B09C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 networkService];
  uint64_t v5 = FAURLEndpointAgePresetsDefinition;
  CFStringRef v9 = @"X-Mme-Country";
  id v10 = v3;
  unsigned int v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

  id v7 = [v4 signedRequestWithEndpoint:v5 method:@"GET" headers:v6 plistBody:0];

  return v7;
}

id sub_10000B18C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 cache];
  uint64_t v5 = [v3 URL];

  unsigned int v6 = [v4 loadForURL:v5];

  return v6;
}

AAFPromise *__cdecl sub_10000B210(id a1, NSArray *a2)
{
  id v2 = [(NSArray *)a2 fa_map:&stru_10004D630];
  id v3 = [objc_alloc((Class)AAFPromise) initWithValue:v2];

  return (AAFPromise *)v3;
}

id sub_10000B274(id a1, NSDictionary *a2)
{
  id v2 = a2;
  id v3 = [objc_alloc((Class)FASettingsPreset) initWithDictionary:v2];

  return v3;
}

void sub_10000B500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B524(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performHeartbeatCheckinWithCompletion:&stru_10004D670];
}

void sub_10000B56C(id a1, int64_t a2)
{
  id v2 = _FALogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100034AE4(v2);
  }
}

uint64_t sub_10000B74C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 > 0);
}

void sub_10000B938(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.screenTimeSettingsCacheOperation", v3);
  id v2 = (void *)qword_10005EF30;
  qword_10005EF30 = (uint64_t)v1;
}

id sub_10000BAE0(id a1, NSArray *a2)
{
  id v2 = a2;
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v4 = [(NSArray *)v2 objectAtIndexedSubscript:1];

  id v9 = 0;
  [v3 writeToURL:v4 options:0x40000000 error:&v9];
  id v5 = v9;
  if (v5)
  {
    unsigned int v6 = _FALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100034B28((uint64_t)v4, (uint64_t)v5, v6);
    }
  }
  id v7 = +[NSNumber numberWithInt:v5 == 0];

  return v7;
}

void sub_10000BC64(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v32 = 0;
  id v5 = [v4 _fetchData:&v32];
  id v6 = v32;
  if (v6)
  {
    id v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100034C90((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }

    v3[2](v3, 0, v6);
  }
  else
  {
    if (v5)
    {
      uint64_t v14 = +[FAScreentimeSettingsObjectCache objectWithData:v5];
      if (v14)
      {
        ((void (**)(id, void *, id))v3)[2](v3, v14, 0);
      }
      else
      {
        unsigned int v23 = _FALogSystem();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_100034C20(v23, v24, v25, v26, v27, v28, v29, v30);
        }

        v31 = +[NSError errorWithDomain:FAErrorDomain code:-1012 userInfo:0];
        v3[2](v3, 0, v31);
      }
    }
    else
    {
      unsigned int v15 = _FALogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100034BB0(v15, v16, v17, v18, v19, v20, v21, v22);
      }

      uint64_t v14 = +[NSError errorWithDomain:FAErrorDomain code:-1012 userInfo:0];
      v3[2](v3, 0, v14);
    }
  }
}

id sub_10000BEF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000BFAC;
  v8[3] = &unk_10004D788;
  id v9 = v3;
  id v5 = v3;
  id v6 = [v4 _onQueue:v8];

  return v6;
}

id sub_10000BFAC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) checkResourceIsReachableAndReturnError:0])
  {
    id v2 = +[NSFileManager defaultManager];
    uint64_t v3 = *(void *)(a1 + 32);
    id v6 = 0;
    [v2 removeItemAtURL:v3 error:&v6];
    id v4 = v6;
  }
  else
  {
    id v2 = _FALogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100034CFC(v2);
    }
    id v4 = 0;
  }

  return v4;
}

void sub_10000C314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000C32C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000C33C(uint64_t a1)
{
}

void sub_10000C344(void *a1)
{
  id v2 = (void *)a1[4];
  id v9 = 0;
  uint64_t v3 = [v2 _cacheURLWithError:&v9];
  id v4 = v9;
  id v5 = [v3 path];

  if (v5)
  {
    uint64_t v6 = +[NSData dataWithContentsOfFile:v5 options:0 error:a1[6]];
    uint64_t v7 = *(void *)(a1[5] + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else if (v4 && a1[6])
  {
    *(void *)a1[6] = v4;
  }
}

void sub_10000C49C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v6 = 0;
  uint64_t v3 = a2;
  id v4 = [v2 _cacheURLWithError:&v6];
  id v5 = v6;
  v3[2](v3, v4, v5);
}

id sub_10000C5E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000C694;
  v8[3] = &unk_10004D788;
  id v9 = v3;
  id v5 = v3;
  id v6 = [v4 _onQueue:v8];

  return v6;
}

id sub_10000C694(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) path];
  id v3 = [v2 stringByDeletingLastPathComponent];
  id v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

  if ((v5 & 1) != 0
    || (+[NSFileManager defaultManager],
        id v6 = objc_claimAutoreleasedReturnValue(),
        id v11 = 0,
        [v6 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v11],
        id v7 = v11,
        v6,
        (uint64_t v8 = v7) == 0))
  {
    id v7 = 0;
    uint64_t v8 = *(void **)(a1 + 32);
  }
  id v9 = v8;

  return v9;
}

void sub_10000C838(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class() cacheQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000C900;
  v6[3] = &unk_10004D800;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void sub_10000C900(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_opt_isKindOfClass();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000C9B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000CD24(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _FALogSystem();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100034DF0(v6, v8);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully fetched family followup: %@", (uint8_t *)&v14, 0xCu);
    }

    id v8 = [v5 objectForKeyedSubscript:@"adsid"];
    uint64_t v9 = [v5 objectForKeyedSubscript:AKFollowUpPushPayloadKey];
    uint64_t v10 = v9;
    if (v8 && v9)
    {
      id v11 = *(void **)(a1 + 32);
      id v12 = [v9 mutableCopy];
      uint64_t v13 = [v11 removeFamilyInvites:v12];

      +[FAFollowupManager synchronizeFollowupWithPayload:v13 altDSID:v8];
    }
  }
}

void sub_10000CE98(uint64_t a1)
{
  id v2 = [FANetworkService alloc];
  id v3 = [*(id *)(a1 + 32) appleAccount];
  id v4 = objc_alloc_init(FADeviceInfo);
  id v5 = objc_alloc_init((Class)FAURLConfiguration);
  id v6 = +[AAURLSession sharedSession];
  uint64_t v9 = [(FANetworkService *)v2 initWithAccount:v3 deviceInfo:v4 urlProvider:v5 urlSession:v6];

  id v7 = [(FANetworkClient *)[FAFetchFollowupOperation alloc] initWithNetworkService:v9];
  id v8 = [(FAFetchFollowupOperation *)v7 fetchFollowUps];
  [v8 onComplete:*(void *)(a1 + 40)];
}

void sub_10000D328(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = _FALogSystem();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100034E88((uint64_t)v2, v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Family heartbeat activity registration has been completed!", v5, 2u);
  }
}

void sub_10000D65C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (![*(id *)(a1 + 32) _checkAndDeferActivityIfNeeded:*(void *)(a1 + 40)])
  {
    id v7 = [v5 objectForKeyedSubscript:@"callbackInterval"];

    id v8 = _FALogSystem();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Family heartbeat operation completed successfully", (uint8_t *)&v15, 2u);
      }

      uint64_t v10 = [v5 objectForKeyedSubscript:@"callbackInterval"];
      [v10 longLongValue];

      uint64_t v11 = *(void *)(a1 + 48);
      if (v11)
      {
        id v12 = *(void (**)(void))(v11 + 16);
LABEL_12:
        v12();
        goto LABEL_13;
      }
      goto LABEL_13;
    }
    if (v9)
    {
      uint64_t v13 = [v6 description];
      int v15 = 138412290;
      uint64_t v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to receive heartbeat callback interval with error: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  uint64_t v14 = *(void *)(a1 + 48);
  if (v14)
  {
    id v12 = *(void (**)(void))(v14 + 16);
    goto LABEL_12;
  }
LABEL_13:
}

void sub_10000DBF0(id *a1, void *a2)
{
  id v3 = a1[4];
  id v6 = a2;
  id v4 = [v3 account];
  objc_msgSend(v6, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v4, 0);

  id v5 = [a1[4] account];
  objc_msgSend(v6, "aa_addLoggedInAppleIDHeaderWithAccount:", v5);

  [a1[5] signURLRequest:v6];
  [a1[6] signURLRequest:v6];
}

id sub_10000E030(uint64_t a1)
{
  dispatch_queue_t v1 = [*(id *)(a1 + 32) networkService];
  id v2 = [v1 ensureAccount];

  return v2;
}

id sub_10000E080(uint64_t a1)
{
  dispatch_queue_t v1 = [*(id *)(a1 + 32) networkService];
  id v2 = [v1 signedRequestWithEndpoint:@"updateMemberFlag"];

  return v2;
}

id sub_10000E0D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 mutableCopy];
  id v5 = *(void **)(a1 + 32);
  id v6 = [v3 URL];

  id v7 = [v5 urlByAddingParamsToURL:v6];
  [v4 setURL:v7];

  [v4 setHTTPMethod:@"POST"];
  [*(id *)(a1 + 32) _addHeadersToRequest:v4];
  [*(id *)(a1 + 32) _addBodyToRequest:v4];
  id v8 = [v4 copy];

  return v8;
}

id sub_10000E1A4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 networkService];
  id v5 = [v4 plistWithRequest:v3];

  return v5;
}

NSNumber *sub_10000E210(uint64_t a1)
{
  return +[NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 16)];
}

void sub_10000EC38(id a1)
{
  qword_10005EF40 = objc_alloc_init(FAPushHelperService);
  _objc_release_x1();
}

void sub_10000EF88(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)FAURLConfiguration);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000F018;
  v3[3] = &unk_10004D9C8;
  v3[4] = *(void *)(a1 + 32);
  [v2 fetchAAURLConfigurationWithCompletion:v3];
}

void sub_10000F018(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 apsEnvironment];
  if (![v7 length]
    || ([v5 apsEnvironment],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v9 = +[APSConnection isValidEnvironment:v8], v8, v10 = v7, (v9 & 1) == 0))
  {
    uint64_t v11 = _FALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100035004((uint64_t)v7, v6, v11);
    }

    uint64_t v10 = (void *)APSEnvironmentProduction;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), v10);
  id v12 = _FALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 24);
    int v24 = 138412290;
    uint64_t v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Starting APS connection with environment: %@", (uint8_t *)&v24, 0xCu);
  }

  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 24);
  uint64_t v15 = APSEnvironmentProduction;
  uint64_t v16 = +[PDSRegistrarService sharedInstance];
  uint64_t v17 = v16;
  if (v14 == v15)
  {
    [v16 registerToPDS:0];

    uint64_t v18 = _FALogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      uint64_t v19 = "Registered PDSEnvironment Production";
      goto LABEL_13;
    }
  }
  else
  {
    [v16 registerToPDS:1];

    uint64_t v18 = _FALogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      uint64_t v19 = "Registered PDSEnvironment Sandbox";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v24, 2u);
    }
  }

  id v20 = [objc_alloc((Class)APSConnection) initWithEnvironmentName:*(void *)(*(void *)(a1 + 32) + 24) namedDelegatePort:@"com.apple.aps.family" queue:&_dispatch_main_q];
  uint64_t v21 = *(void *)(a1 + 32);
  uint64_t v22 = *(void **)(v21 + 8);
  *(void *)(v21 + 8) = v20;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setDelegate:");
  unsigned int v23 = [*(id *)(*(void *)(a1 + 32) + 16) allObjects];
  [*(id *)(*(void *)(a1 + 32) + 8) _setEnabledTopics:v23];
}

void sub_10000F8C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000FB74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_10000FB8C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000FB9C(uint64_t a1)
{
}

id sub_10000FBA4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 networkService];
  uint64_t v5 = FAURLEndpointAgePresetsDefinition;
  CFStringRef v9 = @"X-Mme-Country";
  id v10 = v3;
  id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

  id v7 = [v4 signedRequestWithEndpoint:v5 method:@"GET" headers:v6 plistBody:0];

  return v7;
}

id sub_10000FC94(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 URL];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = [*(id *)(a1 + 32) networkService];
  id v8 = [v7 serverRequest:v3 toFormat:2];

  return v8;
}

id sub_10000FD20(uint64_t a1, void *a2)
{
  id v3 = [a2 body];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"SettingsPresets"];

  uint64_t v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000350FC((uint64_t)v4, v5);
  }

  id v6 = [*(id *)(a1 + 32) updateWithPresets:v4 requestURL:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  id v7 = objc_msgSend(v4, "fa_map:", &stru_10004DA38);

  return v7;
}

id sub_10000FDE8(id a1, NSDictionary *a2)
{
  id v2 = a2;
  id v3 = [objc_alloc((Class)FASettingsPreset) initWithDictionary:v2];

  return v3;
}

void sub_10000FFFC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100010014(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  if (v9)
  {
    id v5 = a3;
    id v6 = [[FAPresetsConfiguration alloc] initWithSTPresetsConfiguration:v9];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void (**)(uint64_t, void, FAPresetsConfiguration *))(v7 + 16);
    id v6 = a3;
    v8(v7, 0, v6);
  }
}

void sub_100010170(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("STPresetsClient");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10005EF50 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100035174();
    sub_1000101C8();
  }
}

void sub_1000101C8()
{
  v1[0] = 0;
  if (!qword_10005EF58)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_1000102C4;
    v1[4] = &unk_10004D068;
    v1[5] = v1;
    long long v2 = off_10004DAD0;
    uint64_t v3 = 0;
    qword_10005EF58 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_10005EF58)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_1000102C4()
{
  uint64_t result = _sl_dlopen();
  qword_10005EF58 = result;
  return result;
}

FAPushMessage *sub_100010338(uint64_t a1)
{
  sub_1000101C8();
  uint64_t result = (FAPushMessage *)objc_getClass("STUserID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10005EF60 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (FAPushMessage *)sub_10003519C();
    return [(FAPushMessage *)v3 initWithMessage:v5 accountStore:v6];
  }
  return result;
}

void sub_1000107EC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id sub_100010B98(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) networkService];
  long long v2 = [v1 ensureAccount];

  return v2;
}

id sub_100010BE8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) familyMemberMatchingDSID];
}

id sub_100010BF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v40 = (id)objc_opt_class();
    __int16 v41 = 2112;
    id v42 = v3;
    id v5 = v40;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: Fetching photo for family member %@", buf, 0x16u);
  }
  id v6 = [v3 contact];
  uint64_t v7 = [v6 thumbnailImageData];

  if (v7)
  {
    id v8 = _FALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000352E8(v8);
    }

    id v9 = [v6 thumbnailImageData];
    id v10 = *(double **)(a1 + 32);
    double v11 = v10[6];
    [v10 screenScale];
    uint64_t v13 = [v9 _faCircularImageDataWithDiameter:v11 * v12];
    goto LABEL_17;
  }
  uint64_t v14 = *(void **)(a1 + 32);
  if (v3)
  {
    id v9 = [v14 fetchCachedPhotoForFamilyMember:v3];
    uint64_t v15 = [v9 catch];
    uint64_t v16 = ((void (**)(void, Block_layout *))v15)[2](v15, &stru_10004DAF0);
    uint64_t v17 = [v16 then];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10001111C;
    v37[3] = &unk_10004DB18;
    v37[4] = *(void *)(a1 + 32);
    id v18 = v3;
    id v38 = v18;
    uint64_t v19 = (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v37);
    id v20 = [v19 catchOnQueue];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100011178;
    v34[3] = &unk_10004DB40;
    v34[4] = *(void *)(a1 + 32);
    id v35 = v6;
    id v36 = v18;
    uint64_t v13 = ((void (**)(void, void *, void *))v20)[2](v20, &_dispatch_main_q, v34);

LABEL_9:
    goto LABEL_17;
  }
  uint64_t v21 = [v14 fullname];
  if (v21)
  {
    uint64_t v22 = (void *)v21;
    unsigned int v23 = [*(id *)(a1 + 32) useMonogramAsLastResort];

    if (v23)
    {
      int v24 = [*(id *)(a1 + 32) fullname];
      id v9 = [v24 componentsSeparatedByString:@" "];

      uint64_t v15 = [v9 firstObject];
      if ((unint64_t)[v9 count] < 2)
      {
        uint64_t v16 = 0;
      }
      else
      {
        uint64_t v16 = [v9 lastObject];
      }
      uint64_t v13 = [*(id *)(a1 + 32) _monogramWithFirstName:v15 lastName:v16];
      uint64_t v17 = _FALogSystem();
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = objc_opt_class();
        v31 = *(void **)(a1 + 32);
        id v32 = v30;
        v33 = [v31 fullname];
        *(_DWORD *)buf = 138412802;
        id v40 = v30;
        __int16 v41 = 2048;
        id v42 = v13;
        __int16 v43 = 2112;
        v44 = v33;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "%@: Monogram of caller-supplied full name returned %p for %@", buf, 0x20u);
      }
      goto LABEL_9;
    }
  }
  id v9 = _FALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = *(void **)(a1 + 32);
    id v27 = v25;
    uint64_t v28 = [v26 dsid];
    *(_DWORD *)buf = 138412546;
    id v40 = v25;
    __int16 v41 = 2112;
    id v42 = v28;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: DSID %@ not found in family, and no full name was supplied. No image will be generated", buf, 0x16u);
  }
  uint64_t v13 = 0;
LABEL_17:

  return v13;
}

id sub_1000110C0(id a1, NSError *a2)
{
  long long v2 = a2;
  if (v2)
  {
    id v3 = _FALogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10003532C((uint64_t)v2, v3);
    }
  }
  return 0;
}

id sub_10001111C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) fetchRemotePhotoForFamilyMember:*(void *)(a1 + 40)];
  }
  id v6 = v5;

  return v6;
}

id sub_100011178(id *a1)
{
  if (![a1[4] useMonogramAsLastResort])
  {
    id v3 = 0;
    goto LABEL_10;
  }
  long long v2 = [a1[5] givenName];
  if ([v2 length])
  {
  }
  else
  {
    uint64_t v4 = [a1[5] familyName];
    id v5 = [v4 length];

    if (!v5)
    {
      id v11 = a1[4];
      double v12 = [a1[6] firstName];
      uint64_t v13 = [a1[6] lastName];
      id v3 = [v11 _monogramWithFirstName:v12 lastName:v13];

      goto LABEL_7;
    }
  }
  id v3 = [a1[4] _monogramForContact:a1[5]];
LABEL_7:
  id v6 = _FALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = a1[6];
    int v14 = 138412802;
    uint64_t v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v3;
    __int16 v18 = 2112;
    id v19 = v8;
    id v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Monogram of members first and last name returned %p for member %@", (uint8_t *)&v14, 0x20u);
  }
LABEL_10:
  return v3;
}

void sub_1000113AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4[3] || v4[4])
  {
    id v5 = [v4 fetchFamilyFactory];
    id v6 = v5[2]();

    uint64_t v7 = [*(id *)(a1 + 32) clientProcess];
    [v6 setClientProcess:v7];

    id v8 = [*(id *)(a1 + 32) context];
    id v9 = [v8 runFetchFamilyCircleOperation:v6];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100011530;
    v11[3] = &unk_10004DB90;
    v11[4] = *(void *)(a1 + 32);
    id v12 = v3;
    [v9 onComplete:v11];
  }
  else
  {
    id v10 = _FALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000353A4(v10);
    }

    (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
  }
}

void sub_100011530(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    id v8 = v7;
    if (!v5)
    {
      id v5 = [v7 cachedFamilyCircle];
    }
    id v6 = [v8 underlyingError];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = [v5 members];
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    id v19 = v6;
    uint64_t v11 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v14 = *(void *)(a1 + 32);
        if (*(void *)(v14 + 24))
        {
          uint64_t v15 = [*(id *)(*((void *)&v20 + 1) + 8 * i) dsid];
          unsigned __int8 v16 = [v15 isEqualToNumber:*(void *)(*(void *)(a1 + 32) + 24)];

          if (v16) {
            goto LABEL_18;
          }
          uint64_t v14 = *(void *)(a1 + 32);
        }
        if (*(void *)(v14 + 32))
        {
          uint64_t v17 = [v13 hashedDSID];
          unsigned __int8 v18 = [v17 isEqualToString:*(void *)(*(void *)(a1 + 32) + 32)];

          if (v18)
          {
LABEL_18:
            id v10 = v13;
            goto LABEL_19;
          }
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10) {
        continue;
      }
      break;
    }
LABEL_19:
    id v6 = v19;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_100011A4C(uint64_t a1)
{
  id v2 = objc_alloc((Class)AAFPromise);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011B04;
  v7[3] = &unk_10004D2A0;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v5 = [v2 initWithBlock:v7];

  return v5;
}

void sub_100011B04(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[ACAccountStore defaultStore];
  id v5 = objc_msgSend(v4, "aa_primaryAppleAccount");
  id v6 = [objc_alloc((Class)FAFamilyMemberPhotoRequest) initWithAppleAccount:v5 grandSlamAccount:0 accountStore:v4];
  id v7 = [*(id *)(a1 + 32) dsid];
  [v6 setFamilyMemberDSID:v7];

  id v8 = [*(id *)(a1 + 40) context];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100011C54;
  v12[3] = &unk_10004DC08;
  id v14 = v3;
  int8x16_t v11 = *(int8x16_t *)(a1 + 32);
  id v9 = (id)v11.i64[0];
  int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
  id v10 = v3;
  [v8 runAAFamilyMemberPhotoRequest:v6 withCompletionHandler:v12];
}

void sub_100011C54(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v6 photoData], id v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100011DE0;
    block[3] = &unk_10004DBE0;
    id v9 = v6;
    uint64_t v10 = *(void *)(a1 + 32);
    id v15 = v9;
    uint64_t v16 = v10;
    id v17 = *(id *)(a1 + 48);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    int8x16_t v11 = _FALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000353E8(a1, (uint64_t)v7, v11);
    }

    uint64_t v12 = *(void *)(a1 + 48);
    if (v7)
    {
      (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v7);
    }
    else
    {
      int8x16_t v13 = +[NSError fa_familyErrorWithCode:-1009];
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
    }
  }
}

void sub_100011DE0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v19 = size;
  id v4 = v2;
  id v5 = [v4 cropRect];
  [v5 getValue:&origin size:32];

  id v6 = [v4 photoData];
  id v7 = *(double **)(a1 + 40);
  double v8 = v7[6];
  [v7 screenScale];
  uint64_t v10 = +[AAFImage circularImageData:withDiameter:crop:](AAFImage, "circularImageData:withDiameter:crop:", v6, v8 * v9, origin, v19);

  int8x16_t v11 = [*(id *)(a1 + 40) cache];
  uint64_t v12 = [v11 updateWithData:v10];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100011F4C;
  v15[3] = &unk_10004DBB8;
  id v13 = *(id *)(a1 + 48);
  id v16 = v10;
  id v17 = v13;
  id v14 = v10;
  [v12 onComplete:v15];
}

uint64_t sub_100011F4C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void sub_100012170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100012440(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_10005EF70)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_100012584;
    v4[4] = &unk_10004D068;
    v4[5] = v4;
    long long v5 = off_10004DC28;
    uint64_t v6 = 0;
    qword_10005EF70 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!qword_10005EF70)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("UIScreen");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    sub_10003549C();
LABEL_8:
    free(v2);
  }
  qword_10005EF68 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100012584()
{
  uint64_t result = _sl_dlopen();
  qword_10005EF70 = result;
  return result;
}

void sub_1000125F8(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("FAFetchFamilyCircleOperation Cache Queue", v3);
  id v2 = (void *)qword_10005EF78;
  qword_10005EF78 = (uint64_t)v1;
}

uint64_t sub_10001265C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001266C(uint64_t a1)
{
}

void sub_100012864(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSMutableDictionary dictionary];
  long long v5 = +[NSDate date];
  [v4 setObject:v5 forKeyedSubscript:@"timestamp"];

  uint64_t v6 = [*(id *)(a1 + 32) _username];
  [v4 setObject:v6 forKeyedSubscript:@"username"];

  id v7 = [*(id *)(a1 + 40) _serverResponse];
  [v4 setObject:v7 forKeyedSubscript:@"circle"];

  [v4 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"serverTag"];
  uint64_t v9 = 0;
  double v8 = +[NSPropertyListSerialization dataWithPropertyList:v4 format:100 options:0 error:&v9];
  v3[2](v3, v8, v9);
}

void sub_100012A24(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v6 = 0;
  id v3 = a2;
  id v4 = [v2 _cacheURLWithError:&v6];
  id v5 = v6;
  v3[2](v3, v4, v5);
}

id sub_100012B68(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100012C1C;
  v8[3] = &unk_10004D788;
  id v9 = v3;
  id v5 = v3;
  id v6 = [v4 _onQueue:v8];

  return v6;
}

id sub_100012C1C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) path];
  id v3 = [v2 stringByDeletingLastPathComponent];

  id v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

  if ((v5 & 1) != 0
    || (+[NSFileManager defaultManager],
        id v6 = objc_claimAutoreleasedReturnValue(),
        id v11 = 0,
        [v6 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v11],
        id v7 = v11,
        v6,
        (double v8 = v7) == 0))
  {
    id v7 = 0;
    double v8 = *(void **)(a1 + 32);
  }
  id v9 = v8;

  return v9;
}

void sub_100012DE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class() cacheQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012EC4;
  v7[3] = &unk_10004DC88;
  unsigned __int8 v5 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = *(id *)(a1 + 48);
  id v10 = v3;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void sub_100012EC4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _cacheDataWithFamilyCircle:*(void *)(a1 + 40) serverTag:*(void *)(a1 + 48)];
  id v3 = [*(id *)(a1 + 32) _createCacheFile];
  v8[0] = v2;
  v8[1] = v3;
  id v4 = +[NSArray arrayWithObjects:v8 count:2];
  unsigned __int8 v5 = +[AAFPromise all:v4];
  id v6 = [v5 then];
  id v7 = ((void (**)(void, Block_layout *))v6)[2](v6, &stru_10004DC60);
  [v7 onComplete:*(void *)(a1 + 56)];
}

id sub_100012FD8(id a1, NSArray *a2)
{
  id v2 = a2;
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v4 = [(NSArray *)v2 objectAtIndexedSubscript:1];

  id v8 = 0;
  [v3 writeToURL:v4 options:1073741825 error:&v8];
  id v5 = v8;
  id v6 = _FALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[FAFamilyCircleCache updateWithFamilyCircle:serverTag:]_block_invoke_3";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: writeToURL completed error:%@", buf, 0x16u);
  }

  return v5;
}

void sub_1000131D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class() cacheQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013298;
  v6[3] = &unk_10004D800;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void sub_100013298(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_opt_isKindOfClass();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_1000133F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  void v8[2] = sub_1000134A8;
  v8[3] = &unk_10004D788;
  id v9 = v3;
  id v5 = v3;
  id v6 = [v4 _onQueue:v8];

  return v6;
}

id sub_1000134A8(uint64_t a1)
{
  id v2 = 0;
  if ([*(id *)(a1 + 32) checkResourceIsReachableAndReturnError:0])
  {
    id v3 = +[NSFileManager defaultManager];
    uint64_t v4 = *(void *)(a1 + 32);
    id v6 = 0;
    [v3 removeItemAtURL:v4 error:&v6];
    id v2 = v6;
  }
  return v2;
}

void sub_10001354C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id sub_100013928(uint64_t a1)
{
  dispatch_queue_t v1 = [*(id *)(a1 + 32) networkService];
  id v2 = [v1 ensureAccount];

  return v2;
}

id sub_100013978(uint64_t a1)
{
  dispatch_queue_t v1 = [*(id *)(a1 + 32) networkService];
  id v2 = [v1 signedRequestWithEndpoint:@"updateFamilyMemberFlags"];

  return v2;
}

id sub_1000139D0(uint64_t a1, void *a2)
{
  id v3 = [a2 mutableCopy];
  [v3 setHTTPMethod:@"POST"];
  [*(id *)(a1 + 32) _addHeadersToRequest:v3];
  [*(id *)(a1 + 32) _addBodyToRequest:v3];
  id v4 = [v3 copy];

  return v4;
}

id sub_100013A44(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 networkService];
  id v5 = [v4 plistWithRequest:v3];

  return v5;
}

void *sub_100013AB0(uint64_t a1, void *a2)
{
  if (([a2 familyRefreshTriggered] & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) networkService];
    +[FAFamilyCircleDaemonChangeHandler handleDidUpdateMemberFlagWithNetworkService:v3 completion:0];
  }
  return &__kCFBooleanTrue;
}

id sub_1000140C0(id a1, id a2)
{
  id v2 = a2;
  id v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Got value %@", (uint8_t *)&v5, 0xCu);
  }

  return v2;
}

id sub_1000146EC(uint64_t a1)
{
  dispatch_queue_t v1 = [*(id *)(a1 + 32) networkService];
  id v2 = [v1 ensureAccount];

  return v2;
}

id sub_10001473C(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  [v2 setObject:@"application/x-plist" forKey:@"Content-Type"];
  if ([*(id *)(a1 + 32) shouldForcePush]) {
    [v2 setObject:@"true" forKey:@"X-Force-Push"];
  }
  id v3 = [*(id *)(a1 + 32) networkService];
  id v4 = [v3 signedRequestWithEndpoint:@"familyHeartbeat" method:@"POST" headers:v2 plistBody:*(void *)(a1 + 40)];

  return v4;
}

id sub_1000147FC(uint64_t a1, void *a2)
{
  id v3 = [a2 mutableCopy];
  [*(id *)(*(void *)(a1 + 32) + 16) signURLRequest:v3];
  [*(id *)(*(void *)(a1 + 32) + 24) signURLRequest:v3];
  id v4 = [v3 copy];

  return v4;
}

id sub_10001487C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 networkService];
  id v5 = [v3 copy];

  id v6 = [v4 plistWithRequest:v5];

  return v6;
}

NSDictionary *__cdecl sub_1000148FC(id a1, FAHTTPResponse *a2)
{
  return (NSDictionary *)[(FAHTTPResponse *)a2 body];
}

void sub_1000149F0(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uniqueIdentifier];
  [v2 addObject:v3];
}

void sub_100014CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100014CF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = +[NSProcessInfo processInfo];
  id v6 = [v5 processName];
  id v7 = [WeakRetained _fetchFamilyCircleWithCachePolicy:1000 signedInAccountShouldBeApprover:0 clientProcess:v6 context:@"refresh_xpc_activity" promptUserToResolveAuthenticatonFailure:0];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100014DFC;
  v9[3] = &unk_10004DD90;
  id v10 = v3;
  id v8 = v3;
  [v7 onComplete:v9];
}

uint64_t sub_100014DFC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100014E10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [FAFamilyCircleCache alloc];
  id v5 = [*(id *)(a1 + 32) _primaryAccount];
  id v6 = [(FAFamilyCircleCache *)v4 initWithAccount:v5];

  id v7 = [(FAFamilyCircleCache *)v6 load];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100014EFC;
  v9[3] = &unk_10004DDE0;
  id v10 = v3;
  id v8 = v3;
  [v7 onComplete:v9];
}

uint64_t sub_100014EFC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100015054(id *a1)
{
  id v2 = [FARemoveFamilyMemberOperation alloc];
  id v3 = [a1[4] _networkService];
  id v4 = [(FARemoveFamilyMemberOperation *)v2 initWithNetworkService:v3 dsidOfMemberToRemove:a1[5]];

  id v5 = [(FARemoveFamilyMemberOperation *)v4 removeMember];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001514C;
  v6[3] = &unk_10004DE80;
  id v8 = a1[6];
  id v7 = a1[5];
  [v5 onComplete:v6];
}

void sub_10001514C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a3;
  (*(void (**)(uint64_t, id, void, id))(v5 + 16))(v5, [a2 BOOLValue], *(void *)(a1 + 32), v6);
}

void sub_10001528C(uint64_t a1)
{
  id v2 = [FADeleteFamilyOperation alloc];
  id v3 = [*(id *)(a1 + 32) _networkService];
  id v4 = [(FADeleteFamilyOperation *)v2 initWithNetworkService:v3];

  uint64_t v5 = [(FADeleteFamilyOperation *)v4 deleteFamily];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001536C;
  v6[3] = &unk_10004DEA8;
  id v7 = *(id *)(a1 + 40);
  [v5 onComplete:v6];
}

void sub_10001536C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, [a2 BOOLValue], v5);
}

void sub_100015528(uint64_t a1)
{
  id v2 = [FAFetchFamilyPhotoOperation alloc];
  id v3 = [*(id *)(a1 + 32) _networkService];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 80);
  id v8 = objc_alloc_init(FAFetchFamilyPhotoOperationContext);
  uint64_t v9 = +[FARequestCoalescer sharedInstance];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000157E0;
  v21[3] = &unk_10004DED0;
  v21[4] = *(void *)(a1 + 32);
  id v10 = [(FAFetchFamilyPhotoOperation *)v2 initWithNetworkService:v3 memberDSID:v4 memberHashedDSID:v5 size:v6 localFallback:v7 context:v8 requestCoalescer:v9 fetchFamilyFactory:v21];

  __int16 v11 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"backgroundType"];
  -[FAFetchFamilyPhotoOperation setBackgroundType:](v10, "setBackgroundType:", [v11 integerValue]);

  id v12 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"monogramDiameter"];
  [v12 doubleValue];
  -[FAFetchFamilyPhotoOperation setMonogramDiameter:](v10, "setMonogramDiameter:");

  id v13 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"emailAddress"];
  [(FAFetchFamilyPhotoOperation *)v10 setEmailAddress:v13];

  id v14 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"fullname"];
  [(FAFetchFamilyPhotoOperation *)v10 setFullname:v14];

  id v15 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"phoneNumber"];
  [(FAFetchFamilyPhotoOperation *)v10 setPhoneNumber:v15];

  id v16 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"ClientProcess"];
  [(FAFetchFamilyPhotoOperation *)v10 setClientProcess:v16];

  id v17 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"useMonogramAsLastResort"];
  -[FAFetchFamilyPhotoOperation setUseMonogramAsLastResort:](v10, "setUseMonogramAsLastResort:", [v17 BOOLValue]);

  unsigned __int8 v18 = [(FAFetchFamilyPhotoOperation *)v10 fetchPhoto];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000158E0;
  v19[3] = &unk_10004DEF8;
  id v20 = *(id *)(a1 + 64);
  [v18 onComplete:v19];
}

FAFetchFamilyCircleOperation *sub_1000157E0(uint64_t a1)
{
  id v2 = [FAFamilyCircleCache alloc];
  id v3 = [*(id *)(a1 + 32) _primaryAccount];
  uint64_t v4 = [(FAFamilyCircleCache *)v2 initWithAccount:v3];

  uint64_t v5 = objc_alloc_init(FAMarqueeUpdateHandler);
  uint64_t v6 = [FAFetchFamilyCircleOperation alloc];
  uint64_t v7 = [*(id *)(a1 + 32) _networkService];
  id v8 = +[FARequestCoalescer sharedInstance];
  uint64_t v9 = [*(id *)(a1 + 32) familyRefreshActivityScheduler];
  id v10 = [(FAFetchFamilyCircleOperation *)v6 initWithNetworkService:v7 cache:v4 marqueeCacheHanlder:v5 requestCoalescer:v8 familyRefreshActivityScheduler:v9];

  return v10;
}

uint64_t sub_1000158E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000159FC(uint64_t a1)
{
  id v2 = [FARegisterPushTokenOperation alloc];
  id v3 = [*(id *)(a1 + 32) _networkService];
  uint64_t v4 = [(FARegisterPushTokenOperation *)v2 initWithNetworkService:v3 pushToken:*(void *)(a1 + 40)];

  uint64_t v5 = [(FARegisterPushTokenOperation *)v4 registerToken];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015AE0;
  v6[3] = &unk_10004DEA8;
  id v7 = *(id *)(a1 + 48);
  [v5 onComplete:v6];
}

uint64_t sub_100015AE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

void sub_100015BC4(uint64_t a1)
{
  id v2 = [FAFamilyCircleCache alloc];
  id v3 = [*(id *)(a1 + 32) _primaryAccount];
  uint64_t v4 = [(FAFamilyCircleCache *)v2 initWithAccount:v3];

  uint64_t v5 = [(FAFamilyCircleCache *)v4 invalidate];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015CA4;
  v6[3] = &unk_10004DD90;
  id v7 = *(id *)(a1 + 40);
  [v5 onComplete:v6];
}

void sub_100015CA4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[FamilyCircleServiceDelegate clearFamilyCircleCacheWithReplyBlock:]_block_invoke_2";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: delete cached family count", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = +[NSUserDefaults standardUserDefaults];
  [v6 removeObjectForKey:FAFamilySettingRowFamilyCountKey];

  id v7 = +[NSUserDefaults standardUserDefaults];
  [v7 removeObjectForKey:FAFamilySettingRowPendingInvitesKey];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100015E8C(uint64_t a1)
{
  id v2 = [[FAFamilyPhotoCache alloc] initWithAltDSID:&stru_10004FD30];
  id v3 = [(FAFamilyPhotoCache *)v2 invalidateFamilyPhotos];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015F50;
  v4[3] = &unk_10004DD90;
  id v5 = *(id *)(a1 + 32);
  [v3 onComplete:v4];
}

void sub_100015F50(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[FamilyCircleServiceDelegate clearPhotoCacheWithReplyBlock:]_block_invoke_2";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: delete cached family photo.s", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000160FC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100016258(uint64_t a1)
{
  id v2 = +[ACAccountStore defaultStore];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = _FALogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      sub_10003575C(v4);
    }

    int v6 = [FAUpdateFamilyMemberFlagOperation alloc];
    id v7 = [*(id *)(a1 + 40) _networkService];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100016478;
    v16[3] = &unk_10004DF70;
    id v17 = *(id *)(a1 + 32);
    int v8 = [(FAUpdateFamilyMemberFlagOperation *)v6 initWithNetworkService:v7 accountSigner:v16 memberDSID:*(void *)(a1 + 48) flag:*(void *)(a1 + 56) enabled:*(unsigned __int8 *)(a1 + 72)];

    uint64_t v9 = v17;
  }
  else
  {
    if (v5) {
      sub_1000356D8(v4);
    }

    id v10 = [FAUpdateFamilyMemberFlagOperation alloc];
    uint64_t v9 = [*(id *)(a1 + 40) _networkService];
    __int16 v11 = [*(id *)(a1 + 40) _grandSlamSignerWithAccountStore:v2];
    id v12 = [*(id *)(a1 + 40) _familyGrandSlamSignerWithAccountStore:v2];
    int v8 = [(FAUpdateFamilyMemberFlagOperation *)v10 initWithNetworkService:v9 grandSlamSigner:v11 familyGrandSlamSigner:v12 memberDSID:*(void *)(a1 + 48) flag:*(void *)(a1 + 56) enabled:*(unsigned __int8 *)(a1 + 72)];
  }
  id v13 = [(FAUpdateFamilyMemberFlagOperation *)v8 updateMemberFlag];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000164EC;
  v14[3] = &unk_10004DEA8;
  id v15 = *(id *)(a1 + 64);
  [v13 onComplete:v14];
}

void sub_100016478(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)FARequestEphemeralSigner) initWithEphemeralAuthResults:*(void *)(a1 + 32)];
  [v4 signURLRequest:v3];
}

uint64_t sub_1000164EC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100016614(uint64_t a1)
{
  id v2 = +[ACAccountStore defaultStore];
  id v3 = [FAUpdateFamilyMemberFlagsOperation alloc];
  id v4 = [*(id *)(a1 + 32) _networkService];
  BOOL v5 = [*(id *)(a1 + 32) _grandSlamSignerWithAccountStore:v2];
  int v6 = [*(id *)(a1 + 32) _familyGrandSlamSignerWithAccountStore:v2];
  id v7 = [(FAUpdateFamilyMemberFlagsOperation *)v3 initWithNetworkService:v4 grandSlamSigner:v5 familyGrandSlamSigner:v6 memberDSID:*(void *)(a1 + 40) flags:*(void *)(a1 + 48)];

  int v8 = [(FAUpdateFamilyMemberFlagsOperation *)v7 updateMemberFlags];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100016750;
  v9[3] = &unk_10004DEA8;
  id v10 = *(id *)(a1 + 56);
  [v8 onComplete:v9];
}

void sub_100016750(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, [a2 BOOLValue], v5);
}

uint64_t sub_100016960(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100016A64(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v11 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    int v6 = [FAEligibilityEvaluator alloc];
    id v7 = [*(id *)(a1 + 32) queueProvider];
    int v8 = [v7 requestQueueWithOptions:0];
    uint64_t v9 = [v11 eligibilityRequirements];
    id v10 = [(FAEligibilityEvaluator *)v6 initWithQueue:v8 requirements:v9];

    [(FAEligibilityEvaluator *)v10 fetchEligibilityForPropertyName:*(void *)(a1 + 40) bundleID:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
}

void sub_100016C30(uint64_t a1)
{
  id v2 = [FAFetchFollowupOperation alloc];
  id v3 = [*(id *)(a1 + 32) _networkService];
  id v5 = [(FANetworkClient *)v2 initWithNetworkService:v3];

  uint64_t v4 = [(FAFetchFollowupOperation *)v5 fetchFollowUps];
  [v4 onComplete:*(void *)(a1 + 40)];
}

void sub_100016D44(id a1, AAURLConfiguration *a2, NSError *a3)
{
  id v5 = [(AAURLConfiguration *)a2 apsEnvironment];
  BOOL v3 = v5 != (id)APSEnvironmentProduction;
  uint64_t v4 = +[PDSRegistrarService sharedInstance];
  [v4 registerToPDS:v3];
}

void sub_1000171FC(uint64_t a1)
{
  id v2 = _FALogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000358DC();
  }

  BOOL v3 = objc_alloc_init(FADeviceInfo);
  uint64_t v4 = [FANetworkService alloc];
  id v5 = [*(id *)(a1 + 32) _primaryAccount];
  int v6 = objc_opt_new();
  id v7 = +[AAURLSession sharedSession];
  int v8 = [(FANetworkService *)v4 initWithAccount:v5 deviceInfo:v3 urlProvider:v6 urlSession:v7];

  uint64_t v9 = +[ACAccountStore defaultStore];
  id v10 = [FAHeartbeatOperation alloc];
  id v11 = [*(id *)(a1 + 32) _grandSlamSignerWithAccountStore:v9];
  id v12 = [*(id *)(a1 + 32) _familyGrandSlamSignerWithAccountStore:v9];
  id v13 = [(FAHeartbeatOperation *)v10 initWithNetworkService:v8 grandSlamSigner:v11 familyGrandSlamSigner:v12];

  [(FAHeartbeatOperation *)v13 setForcePush:1];
  id v14 = [(FAHeartbeatOperation *)v13 fetchHeartbeatData];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000173E0;
  v15[3] = &unk_10004DD90;
  id v16 = *(id *)(a1 + 40);
  [v14 onComplete:v15];
}

void sub_1000173E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = _FALogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v8) {
      sub_1000359A4();
    }
  }
  else if (v8)
  {
    sub_100035910(v5, v7);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000175A8(uint64_t a1)
{
  id v2 = [FAFetchSettingsPresetsOperation alloc];
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  BOOL v8 = sub_10001767C;
  uint64_t v9 = &unk_10004D250;
  BOOL v3 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v3;
  uint64_t v4 = [(FAFetchSettingsPresetsOperation *)v2 initWithFamilyCircleProvider:&v6 fetchFromCache:*(unsigned __int8 *)(a1 + 64)];
  id v5 = -[FAFetchSettingsPresetsOperation presetsForMemberWithAltDSID:age:](v4, "presetsForMemberWithAltDSID:age:", *(void *)(a1 + 48), 0, v6, v7, v8, v9, v10);
  [v5 onComplete:*(void *)(a1 + 56)];
}

id sub_10001767C(uint64_t a1)
{
  dispatch_queue_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"ClientProcess"];
  BOOL v3 = [v1 _fetchFamilyCircleWithCachePolicy:0 signedInAccountShouldBeApprover:0 clientProcess:v2 context:0 promptUserToResolveAuthenticatonFailure:0];

  return v3;
}

void sub_1000177F8(uint64_t a1)
{
  BOOL v3 = [[FAFetchSettingsPresetsOperation alloc] initWithFamilyCircleProvider:&stru_10004E090 fetchFromCache:*(unsigned __int8 *)(a1 + 48)];
  id v2 = [(FAFetchSettingsPresetsOperation *)v3 presetsForMemberWithAltDSID:0 age:*(void *)(a1 + 32)];
  [v2 onComplete:*(void *)(a1 + 40)];
}

AAFPromise *__cdecl sub_100017874(id a1)
{
  id v1 = [objc_alloc((Class)AAFPromise) initWithValue:0];
  return (AAFPromise *)v1;
}

void sub_1000179EC(uint64_t a1)
{
  id v2 = [FAUpdateFamilyInviteStatusOperation alloc];
  BOOL v3 = [*(id *)(a1 + 32) _networkService];
  uint64_t v4 = [(FAUpdateFamilyInviteStatusOperation *)v2 initWithNetworkService:v3 inviteCode:*(void *)(a1 + 40) inviteStatus:*(void *)(a1 + 64) responseFormat:*(void *)(a1 + 72) additionalRequestParameters:*(void *)(a1 + 48)];

  id v5 = [(FAUpdateFamilyInviteStatusOperation *)v4 updateInviteStatus];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100017AD4;
  v6[3] = &unk_10004DEA8;
  id v7 = *(id *)(a1 + 56);
  [v5 onComplete:v6];
}

void sub_100017AD4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, [a2 BOOLValue], v5);
}

void sub_100017C50(uint64_t a1)
{
  id v2 = [FACancelInvitationOperation alloc];
  BOOL v3 = [*(id *)(a1 + 32) _networkService];
  uint64_t v4 = [(FACancelInvitationOperation *)v2 initWithNetworkService:v3 email:*(void *)(a1 + 40) familyID:*(void *)(a1 + 48)];

  id v5 = [(FACancelInvitationOperation *)v4 cancelInvitation];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100017D34;
  v6[3] = &unk_10004DD90;
  id v7 = *(id *)(a1 + 56);
  [v5 onComplete:v6];
}

uint64_t sub_100017D34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100017E68(uint64_t a1)
{
  id v2 = [[FAScreenTimeSettingsCacheOperation alloc] initWithDSID:*(void *)(a1 + 32)];
  BOOL v3 = [(FAScreenTimeSettingsCacheOperation *)v2 cacheScreenTimeSettingsObject:*(void *)(a1 + 40)];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100017F2C;
  v4[3] = &unk_10004DEA8;
  id v5 = *(id *)(a1 + 48);
  [v3 onComplete:v4];
}

void sub_100017F2C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, [a2 BOOLValue], v5);
}

void sub_100018120(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000181A8;
  v2[3] = &unk_10004DD90;
  id v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 resendChildTransferWithCompletionHandler:v2];
}

void sub_1000181A8(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    id v5 = a2;
    id v8 = [a3 removingNonSecureCodingValues];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void (**)(uint64_t))(v6 + 16);
    id v8 = a2;
    v7(v6);
  }
}

void sub_1000183DC(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100018464;
  v2[3] = &unk_10004E108;
  id v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 cancelChildTransferWithCompletionHandler:v2];
}

void sub_100018464(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    id v5 = a2;
    id v8 = [a3 removingNonSecureCodingValues];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void (**)(uint64_t))(v6 + 16);
    id v8 = a2;
    v7(v6);
  }
}

void sub_1000185E4(uint64_t a1)
{
  id v2 = [_TtC13familycircled39FAFamilyChecklistRankingConfigOperation alloc];
  id v3 = [*(id *)(a1 + 32) _networkService];
  uint64_t v4 = [(FAFamilyChecklistRankingConfigOperation *)v2 initWithNetworkService:v3];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000186B4;
  v6[3] = &unk_10004DD90;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  [(FAFamilyChecklistRankingConfigOperation *)v4 familyChecklistRankingConfigWith:v5 completionHandler:v6];
}

void sub_1000186B4(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    id v5 = a2;
    id v8 = [a3 removingNonSecureCodingValues];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void (**)(uint64_t))(v6 + 16);
    id v8 = a2;
    v7(v6);
  }
}

void sub_100018860(int8x16_t *a1)
{
  id v2 = [[FAScreenTimeSettingsCacheOperation alloc] initWithDSID:a1[2].i64[0]];
  id v3 = [(FAScreenTimeSettingsCacheOperation *)v2 loadScreenTimeSettingsObject];
  uint64_t v4 = [v3 then];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  void v8[2] = sub_100018964;
  v8[3] = &unk_10004E180;
  int8x16_t v7 = a1[2];
  id v5 = (id)v7.i64[0];
  int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
  uint64_t v6 = ((void (**)(void, void *))v4)[2](v4, v8);
  [v6 onComplete:a1[3].i64[0]];
}

id sub_100018964(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _turnOnScreentimeForDSID:*(void *)(a1 + 40)];
  id v5 = [v4 then];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100018A68;
  v11[3] = &unk_10004E158;
  uint64_t v6 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v3;
  id v13 = v6;
  int8x16_t v7 = (void (*)(void *, void *))v5[2];
  id v8 = v3;
  int8x16_t v9 = v7(v5, v11);

  return v9;
}

id sub_100018A68(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _applyScreenTimeModel:*(void *)(a1 + 40) dsid:*(void *)(a1 + 48)];
}

void sub_100018BA4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _turnOnScreentimeForDSID:*(void *)(a1 + 40)];
  id v3 = [v2 then];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100018C98;
  v5[3] = &unk_10004E158;
  v5[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  uint64_t v4 = ((void (**)(void, void *))v3)[2](v3, v5);
  [v4 onComplete:*(void *)(a1 + 56)];
}

id sub_100018C98(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _applyScreenTimeModel:*(void *)(a1 + 40) dsid:*(void *)(a1 + 48)];
}

void sub_100018D64(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2050000000;
  uint64_t v4 = (void *)qword_10005EF88;
  uint64_t v33 = qword_10005EF88;
  if (!qword_10005EF88)
  {
    *(void *)buf = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    id v27 = sub_1000195C4;
    uint64_t v28 = &unk_10004DAB0;
    uint64_t v29 = &v30;
    sub_1000195C4((uint64_t)buf);
    uint64_t v4 = (void *)v31[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v30, 8);
  id v6 = objc_alloc_init(v5);
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2050000000;
  id v7 = (void *)qword_10005EF98;
  uint64_t v33 = qword_10005EF98;
  if (!qword_10005EF98)
  {
    *(void *)buf = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    id v27 = sub_10001978C;
    uint64_t v28 = &unk_10004DAB0;
    uint64_t v29 = &v30;
    sub_10001978C((uint64_t)buf);
    id v7 = (void *)v31[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v30, 8);
  id v9 = [[v8 alloc] initWithDSID:*(void *)(a1 + 32)];
  id v24 = 0;
  uint64_t v10 = [v6 currentConfigurationForUser:v9 error:&v24];
  id v11 = v24;
  if (v10)
  {
    if ([v10 screenTimeState] == (id)1)
    {
      id v12 = _FALogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "STSetupConfiguration Already enabled", buf, 2u);
      }

      v3[2](v3, &__kCFBooleanTrue, v11);
    }
    else
    {
      id v23 = v11;
      id v15 = [v10 configurationWithUpdatedScreenTimeState:1 error:&v23];
      id v16 = v23;

      if (v15)
      {
        id v22 = v16;
        unsigned __int8 v17 = [v6 applyUpdatedConfiguration:v15 error:&v22];
        id v18 = v22;

        if (v17)
        {
          CGSize v19 = +[NSNumber numberWithBool:1];
          v3[2](v3, v19, 0);
        }
        else
        {
          long long v21 = _FALogSystem();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_100035B0C();
          }

          CGSize v19 = +[NSNumber numberWithBool:0];
          v3[2](v3, v19, v18);
        }
        id v16 = v18;
      }
      else
      {
        id v20 = _FALogSystem();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100035A40((uint64_t)v16, v10, v20);
        }

        CGSize v19 = +[NSNumber numberWithBool:0];
        v3[2](v3, v19, v16);
      }

      id v11 = v16;
    }
  }
  else
  {
    id v13 = _FALogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000359D8();
    }

    id v14 = +[NSNumber numberWithBool:0];
    v3[2](v3, v14, v11);
  }
}

void sub_100019168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100019268(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) introductionModel];

  if (v4)
  {
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2050000000;
    id v12 = (void *)qword_10005EFA0;
    uint64_t v30 = qword_10005EFA0;
    if (!qword_10005EFA0)
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000197E4;
      v26[3] = &unk_10004DAB0;
      v26[4] = &v27;
      sub_1000197E4((uint64_t)v26, v5, v6, v7, v8, v9, v10, v11, v24[0]);
      id v12 = (void *)v28[3];
    }
    id v13 = v12;
    _Block_object_dispose(&v27, 8);
    id v14 = objc_alloc_init(v13);
    id v15 = [*(id *)(a1 + 32) introductionModel];
    uint64_t v16 = *(void *)(a1 + 40);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100019460;
    void v24[3] = &unk_10004E1A8;
    id v25 = v3;
    [v14 applyIntroductionModel:v15 forDSID:v16 completionHandler:v24];
  }
  else
  {
    unsigned __int8 v17 = _FALogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100035B74(a1, v17, v18, v19, v20, v21, v22, v23);
    }

    id v14 = +[NSError fa_familyErrorWithCode:-1014];
    (*((void (**)(id, void *, id))v3 + 2))(v3, &__kCFBooleanFalse, v14);
  }
}

void sub_100019448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100019460(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _FALogSystem();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100035BE4();
    }

    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Screen Time introduction model completed successfully", v7, 2u);
    }

    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

void sub_1000195C4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("STSetupClient");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10005EF88 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100035C4C();
    sub_10001961C();
  }
}

void sub_10001961C()
{
  v1[0] = 0;
  if (!qword_10005EF90)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_100019718;
    v1[4] = &unk_10004D068;
    v1[5] = v1;
    long long v2 = off_10004E1C8;
    uint64_t v3 = 0;
    qword_10005EF90 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_10005EF90)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_100019718()
{
  uint64_t result = _sl_dlopen();
  qword_10005EF90 = result;
  return result;
}

Class sub_10001978C(uint64_t a1)
{
  sub_10001961C();
  Class result = objc_getClass("STUserID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10005EF98 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_10003519C();
    return (Class)sub_1000197E4(v3);
  }
  return result;
}

void sub_1000197E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  sub_10001961C();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("STManagementState");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10005EFA0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v10 = (void *)sub_100035C74();
    sub_10001983C(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void sub_10001983C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100019864(id a1)
{
  qword_10005EFA8 = objc_alloc_init(FARequestCoalescer);
  _objc_release_x1();
}

void sub_100019A34(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) coalesceQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019B18;
  block[3] = &unk_10004E230;
  uint64_t v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  char v11 = *(unsigned char *)(a1 + 56);
  id v9 = *(id *)(a1 + 48);
  id v10 = v3;
  id v6 = v3;
  dispatch_async(v4, block);
}

void sub_100019B18(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) inFlightRequests];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3 && !*(unsigned char *)(a1 + 64))
  {
    char v11 = _FALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      CFStringRef v19 = v3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "RequestCoalescer - Returning already in flight promise for key %@ promise: %@", buf, 0x16u);
    }

    uint64_t v7 = v3;
  }
  else
  {
    uint64_t v4 = _FALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      if (*(unsigned char *)(a1 + 64)) {
        CFStringRef v6 = @"YES";
      }
      else {
        CFStringRef v6 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v5;
      __int16 v18 = 2112;
      CFStringRef v19 = v6;
      __int16 v20 = 2112;
      uint64_t v21 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "RequestCoalescer - Executing block for key %@ force: %@ inFlightPromise: %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      id v8 = [*(id *)(a1 + 32) inFlightRequests];
      [v8 setObject:v7 forKey:*(void *)(a1 + 40)];

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100019D64;
      v13[3] = &unk_10004E208;
      id v9 = *(void **)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = v9;
      id v10 = objc_msgSend(*(id *)(a1 + 32), "coalesceQueue", _NSConcreteStackBlock, 3221225472, sub_100019D64, &unk_10004E208, v14);
      [(__CFString *)v7 onComplete:v13 onQueue:v10];
    }
  }
  [(__CFString *)v7 onComplete:*(void *)(a1 + 56)];
}

void sub_100019D64(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inFlightRequests];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_10001A128(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("FAFamilyPhotoCache Queue", v3);
  id v2 = (void *)qword_10005EFB8;
  qword_10005EFB8 = (uint64_t)v1;
}

void sub_10001A2A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001A2B8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001A2C8(uint64_t a1)
{
}

void sub_10001A2D0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v15 = 0;
  id v3 = [v2 _cacheURLWithError:&v15];
  id v4 = v15;
  uint64_t v5 = [v3 path];

  if (v5)
  {
    CFStringRef v6 = +[NSFileManager defaultManager];
    uint64_t v7 = [v6 attributesOfItemAtPath:v5 error:0];

    id v8 = [v7 objectForKey:NSFileModificationDate];
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [v7 objectForKey:NSFileCreationDate];
    }
    char v11 = v10;

    if (([*(id *)(a1 + 32) _isCacheDate:v11 pastDuration:*(double *)&qword_10005E360] & 1) == 0)
    {
      uint64_t v12 = +[NSData dataWithContentsOfFile:v5 options:0 error:*(void *)(a1 + 48)];
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
  }
  else if (v4 && *(void *)(a1 + 48))
  {
    **(void **)(a1 + 48) = v4;
  }
}

void sub_10001A4C4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v6 = 0;
  id v3 = a2;
  id v4 = [v2 load:&v6];
  id v5 = v6;
  v3[2](v3, v4, v5);
}

void sub_10001A8FC(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v6 = 0;
  id v3 = a2;
  id v4 = [v2 _cacheURLWithError:&v6];
  id v5 = v6;
  v3[2](v3, v4, v5);
}

id sub_10001AA14(id a1, NSURL *a2)
{
  id v2 = a2;
  id v3 = [(NSURL *)v2 path];
  id v4 = [v3 stringByDeletingLastPathComponent];

  id v5 = +[NSFileManager defaultManager];
  unsigned __int8 v6 = [v5 fileExistsAtPath:v4];

  if (v6)
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v8 = +[NSFileManager defaultManager];
    id v12 = 0;
    [v8 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v12];
    uint64_t v7 = (NSURL *)v12;
  }
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = v2;
  }
  id v10 = v9;

  return v10;
}

void sub_10001ABBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class() cacheQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AC88;
  block[3] = &unk_10004DBE0;
  id v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v4, block);
}

void sub_10001AC88(id *a1)
{
  id v2 = [a1[4] _createCacheFile];
  id v3 = [v2 then];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001AD68;
  v7[3] = &unk_10004E2E0;
  id v4 = a1[5];
  id v5 = a1[4];
  id v8 = v4;
  id v9 = v5;
  id v10 = a1[6];
  id v6 = (id)((uint64_t (**)(void, void *))v3)[2](v3, v7);
}

id sub_10001AD68(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSFileManager defaultManager];
  id v5 = [v3 path];
  unsigned int v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    uint64_t v7 = +[NSFileManager defaultManager];
    [v7 removeItemAtURL:v3 error:0];
  }
  id v8 = *(void **)(a1 + 32);
  id v14 = 0;
  [v8 writeToURL:v3 options:0x40000000 error:&v14];
  id v9 = v14;
  id v10 = _FALogSystem();
  char v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100035E10(a1, v11);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [*(id *)(a1 + 40) altDSID];
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updated photo cache for member %@", buf, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  return v9;
}

id sub_10001AFFC(uint64_t a1)
{
  dispatch_queue_t v1 = *(void **)(a1 + 32);
  id v10 = 0;
  id v2 = [v1 _cacheDirectoryURLWithError:&v10];
  id v3 = v10;
  if (v3)
  {
    id v4 = _FALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Error finding cache photo directory %@", buf, 0xCu);
    }

    id v5 = v3;
  }
  else
  {
    id v5 = 0;
    if ([v2 checkResourceIsReachableAndReturnError:0])
    {
      unsigned int v6 = _FALogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Photo cache cleared", buf, 2u);
      }

      uint64_t v7 = +[NSFileManager defaultManager];
      id v9 = 0;
      [v7 removeItemAtURL:v2 error:&v9];
      id v5 = v9;
    }
  }

  return v5;
}

void sub_10001B360(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("FASettingPresetsCache Queue", v3);
  id v2 = (void *)qword_10005EFC8;
  qword_10005EFC8 = (uint64_t)v1;
}

void sub_10001B4D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001B4F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001B500(uint64_t a1)
{
}

void sub_10001B508(void *a1)
{
  id v2 = (void *)a1[4];
  id v9 = 0;
  id v3 = [v2 _cacheURLWithError:&v9];
  id v4 = v9;
  id v5 = [v3 path];

  if (v5)
  {
    uint64_t v6 = +[NSData dataWithContentsOfFile:v5 options:0 error:a1[6]];
    uint64_t v7 = *(void *)(a1[5] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else if (v4 && a1[6])
  {
    *(void *)a1[6] = v4;
  }
}

void sub_10001B694(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v13 = 0;
  id v5 = [v4 load:&v13];
  id v6 = v13;
  if (v6)
  {
    id v7 = v6;
    v3[2](v3, 0, v6);
  }
  else
  {
    id v12 = 0;
    id v8 = +[NSJSONSerialization JSONObjectWithData:v5 options:0 error:&v12];
    id v7 = v12;
    id v9 = [*(id *)(a1 + 40) absoluteString];

    if (v9)
    {
      id v10 = [*(id *)(a1 + 40) absoluteString];
      char v11 = [v8 objectForKeyedSubscript:v10];
    }
    else
    {
      char v11 = 0;
    }
    ((void (**)(id, void *, id))v3)[2](v3, v11, v7);
  }
}

void sub_10001B9FC(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v6 = 0;
  id v3 = a2;
  id v4 = [v2 _cacheURLWithError:&v6];
  id v5 = v6;
  v3[2](v3, v4, v5);
}

id sub_10001BB14(id a1, NSURL *a2)
{
  id v2 = a2;
  id v3 = [(NSURL *)v2 path];
  id v4 = [v3 stringByDeletingLastPathComponent];

  id v5 = +[NSFileManager defaultManager];
  unsigned __int8 v6 = [v5 fileExistsAtPath:v4];

  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    id v8 = +[NSFileManager defaultManager];
    id v12 = 0;
    [v8 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v12];
    id v7 = (NSURL *)v12;
  }
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = v2;
  }
  id v10 = v9;

  return v10;
}

void sub_10001BCE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class() cacheQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001BDC0;
  v7[3] = &unk_10004DC88;
  id v5 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = *(id *)(a1 + 48);
  id v10 = v3;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void sub_10001BDC0(id *a1)
{
  id v2 = [a1[4] _createCacheFile];
  id v3 = [v2 then];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001BEB0;
  v5[3] = &unk_10004E2E0;
  id v6 = a1[5];
  id v7 = a1[6];
  id v8 = a1[7];
  id v4 = (id)((uint64_t (**)(void, void *))v3)[2](v3, v5);
}

id sub_10001BEB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSFileManager defaultManager];
  id v5 = [v3 path];
  unsigned int v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    id v7 = +[NSFileManager defaultManager];
    [v7 removeItemAtURL:v3 error:0];
  }
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  id v9 = [*(id *)(a1 + 32) absoluteString];

  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    char v11 = [*(id *)(a1 + 32) absoluteString];
    [v8 setObject:v10 forKeyedSubscript:v11];
  }
  id v21 = 0;
  id v12 = +[NSJSONSerialization dataWithJSONObject:v8 options:0 error:&v21];
  id v13 = v21;
  id v20 = 0;
  [v12 writeToURL:v3 options:0x40000000 error:&v20];
  id v14 = v20;
  id v15 = _FALogSystem();
  uint64_t v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100035F24((uint64_t *)(a1 + 32), v16);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Updated presets cache for url %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v18 = v14;

  return v18;
}

id sub_10001C1C8(uint64_t a1)
{
  dispatch_queue_t v1 = *(void **)(a1 + 32);
  id v10 = 0;
  id v2 = [v1 _cacheDirectoryURLWithError:&v10];
  id v3 = v10;
  if (v3)
  {
    id v4 = _FALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Error finding cache presets directory %@", buf, 0xCu);
    }

    id v5 = v3;
  }
  else
  {
    id v5 = 0;
    if ([v2 checkResourceIsReachableAndReturnError:0])
    {
      unsigned int v6 = _FALogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "presets cache cleared", buf, 2u);
      }

      id v7 = +[NSFileManager defaultManager];
      id v9 = 0;
      [v7 removeItemAtURL:v2 error:&v9];
      id v5 = v9;
    }
  }

  return v5;
}

void sub_10001C554(uint64_t a1)
{
  id v2 = [FAPushDetailRequest alloc];
  id v3 = [*(id *)(a1 + 32) appleAccount];
  id v4 = [*(id *)(a1 + 32) gsAccount];
  id v5 = +[ACAccountStore defaultStore];
  unsigned int v6 = [(FAPushDetailRequest *)v2 initWithAppleAccount:v3 grandSlamAccount:v4 accountStore:v5];

  id v7 = [FANetworkService alloc];
  id v8 = [*(id *)(a1 + 32) appleAccount];
  id v9 = objc_alloc_init(FADeviceInfo);
  id v10 = objc_alloc_init((Class)FAURLConfiguration);
  char v11 = +[AAURLSession sharedSession];
  id v12 = [(FANetworkService *)v7 initWithAccount:v8 deviceInfo:v9 urlProvider:v10 urlSession:v11];

  id v13 = [*(id *)(a1 + 32) payload];
  [(FAPushDetailRequest *)v6 setPushPayload:v13];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001C720;
  v15[3] = &unk_10004E3B0;
  id v16 = *(id *)(a1 + 32);
  uint64_t v17 = v12;
  uint64_t v18 = *(void *)(a1 + 40);
  id v14 = v12;
  [(FAPushDetailRequest *)v6 performRequestWithHandler:v15];
}

void sub_10001C720(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = _FALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100035FA0(v9, v10);
    }
  }
  else if (v8)
  {
    id v10 = v8;
    char v11 = [*(id *)(a1 + 32) topic];
    [v10 setPushTopic:v11];

    id v12 = _FALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CacheUpdate:Push detail response: %@", buf, 0xCu);
    }

    if ([v10 isSuccess])
    {
      uint64_t v13 = *(void *)(a1 + 40);
      id v14 = [*(id *)(a1 + 48) familyRefreshActivityScheduler];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10001CA18;
      v20[3] = &unk_10004E348;
      v20[4] = *(void *)(a1 + 48);
      id v21 = v10;
      id v22 = *(id *)(a1 + 32);
      +[FAFamilyCircleDaemonChangeHandler handleDidReceivePushEventWithNetworkService:v13 familyRefreshActivityScheduler:v14 completion:v20];
    }
    else
    {
      id v16 = _FALogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v10;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CacheUpdate: Handling no op operation %@", buf, 0xCu);
      }

      uint64_t v17 = [v10 httpResponse];
      uint64_t v18 = *(void *)(a1 + 40);
      CFStringRef v19 = [*(id *)(a1 + 48) familyRefreshActivityScheduler];
      +[FAFamilyCircleDaemonChangeHandler handleURLResponse:v17 networkService:v18 familyRefreshActivityScheduler:v19 completion:&stru_10004E388];
    }
  }
  else
  {
    id v10 = _FALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v7 description];
      *(_DWORD *)buf = 138412290;
      id v24 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Family push detail request (%@) retunred no response and no error.", buf, 0xCu);
    }
  }
}

void sub_10001CA18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = _FALogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v6)
    {
      __int16 v12 = 0;
      id v7 = "FAEventPushHandler received error while refreshing family triggered by push event";
      id v8 = (uint8_t *)&v12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    id v7 = "FAEventPushHandler refreshed family triggered by push event.";
    id v8 = buf;
    goto LABEL_6;
  }

  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  char v11 = [*(id *)(a1 + 48) payload];
  [v9 _deliverNotificationWithResponse:v10 payload:v11];
}

void sub_10001CADC(id a1, FAFamilyCircle *a2, NSError *a3)
{
  id v4 = _FALogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v5)
    {
      __int16 v8 = 0;
      BOOL v6 = "FAEventPushHandler received error while refreshing family triggered by push event";
      id v7 = (uint8_t *)&v8;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    BOOL v6 = "FAEventPushHandler refreshed family triggered by push event.";
    id v7 = buf;
    goto LABEL_6;
  }
}

id sub_10001CE5C(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) signedRequestWithURL:a2 method:*(void *)(a1 + 40) headers:*(void *)(a1 + 48) plistBody:*(void *)(a1 + 56)];
}

id sub_10001D208(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

void sub_10001D2DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  BOOL v6 = *(void **)(v4 + 8);
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  char v11 = sub_10001D394;
  __int16 v12 = &unk_10004E450;
  uint64_t v13 = v4;
  id v14 = v3;
  id v7 = v3;
  __int16 v8 = [v6 dataTaskWithRequest:v5 completion:&v9];
  objc_msgSend(v8, "resume", v9, v10, v11, v12, v13);
}

void sub_10001D394(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  char v11 = [v7 familyRefreshActivityScheduler];
  BOOL v12 = +[FAFamilyCircleDaemonChangeHandler handleURLResponse:v9 networkService:v7 familyRefreshActivityScheduler:v11 completion:0];

  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = [objc_alloc((Class)FAHTTPResponse) initWithHTTPResponse:v9 body:v10 familyRefreshTriggered:v12];

  (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v14, v8);
}

id sub_10001D550(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) plistWithResponse:v3];
  uint64_t v5 = [v4 then];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001D644;
  v10[3] = &unk_10004D090;
  id v11 = v3;
  BOOL v6 = (void (*)(void *, void *))v5[2];
  id v7 = v3;
  id v8 = v6(v5, v10);

  return v8;
}

id sub_10001D644(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)FAHTTPResponse);
  uint64_t v5 = [*(id *)(a1 + 32) HTTPResponse];
  id v6 = [v4 initWithHTTPResponse:v5 body:v3];

  return v6;
}

id sub_10001D798(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _convertServerResponse:v3 toFormat:*(void *)(a1 + 40)];
  uint64_t v5 = [v4 then];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001D88C;
  v10[3] = &unk_10004D090;
  id v11 = v3;
  id v6 = (void (*)(void *, void *))v5[2];
  id v7 = v3;
  id v8 = v6(v5, v10);

  return v8;
}

id sub_10001D88C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)FAHTTPResponse);
  uint64_t v5 = [*(id *)(a1 + 32) HTTPResponse];
  id v6 = [v4 initWithHTTPResponse:v5 body:v3];

  return v6;
}

id sub_10001DE9C(uint64_t a1)
{
  return [*(id *)(a1 + 32) ensureAccount];
}

id sub_10001DEA4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) urlProvider];
  id v3 = [v2 URLForEndpoint:*(void *)(a1 + 40)];

  return v3;
}

id sub_10001DEFC(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) signedRequestWithURL:a2 method:*(void *)(a1 + 40) headers:&__NSDictionary0__struct plistBody:*(void *)(a1 + 48) requestFormat:*(void *)(a1 + 56) responseFormat:*(void *)(a1 + 64)];
}

id sub_10001DF1C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) serverRequest:a2 toFormat:*(void *)(a1 + 40)];
}

NSDictionary *__cdecl sub_10001DF2C(id a1, FAHTTPResponse *a2)
{
  return (NSDictionary *)[(FAHTTPResponse *)a2 body];
}

id sub_10001E19C(uint64_t a1)
{
  return [*(id *)(a1 + 32) ensureAccount];
}

id sub_10001E1A4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) signedRequestWithURL:*(void *)(a1 + 40) method:*(void *)(a1 + 48) headers:&__NSDictionary0__struct plistBody:*(void *)(a1 + 56) requestFormat:*(void *)(a1 + 64) responseFormat:*(void *)(a1 + 72)];
}

id sub_10001E1C0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) serverRequest:a2 toFormat:*(void *)(a1 + 40)];
}

NSDictionary *__cdecl sub_10001E1D0(id a1, FAHTTPResponse *a2)
{
  return (NSDictionary *)[(FAHTTPResponse *)a2 body];
}

id sub_10001E4A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) ensureAccount];
}

id sub_10001E4A8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) signedRequestWithURL:*(void *)(a1 + 40) method:*(void *)(a1 + 48) headers:&__NSDictionary0__struct plistBody:*(void *)(a1 + 56) requestFormat:*(void *)(a1 + 64) responseFormat:*(void *)(a1 + 72)];
}

id sub_10001E4C4(uint64_t a1, void *a2)
{
  id v3 = [a2 mutableCopy];
  [*(id *)(a1 + 32) signURLRequest:v3];
  [*(id *)(a1 + 40) signURLRequest:v3];
  id v4 = [*(id *)(a1 + 48) serverRequest:v3 toFormat:*(void *)(a1 + 56)];

  return v4;
}

NSDictionary *__cdecl sub_10001E534(id a1, FAHTTPResponse *a2)
{
  return (NSDictionary *)[(FAHTTPResponse *)a2 body];
}

id sub_10001E798(uint64_t a1)
{
  return [*(id *)(a1 + 32) ensureAccount];
}

id sub_10001E7A0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) signedRequestWithURL:*(void *)(a1 + 40) method:*(void *)(a1 + 48) headers:0 plistBody:*(void *)(a1 + 56)];
}

id sub_10001E7B4(uint64_t a1, void *a2)
{
  id v3 = [a2 mutableCopy];
  id v4 = [objc_alloc((Class)FARequestConfigurator) initWithAccount:*(void *)(*(void *)(a1 + 32) + 16)];
  [v4 addFresnoPayloadToRequest:v3 additionalPayload:0];
  uint64_t v5 = [*(id *)(a1 + 32) plistWithRequest:v3];

  return v5;
}

NSDictionary *__cdecl sub_10001E840(id a1, FAHTTPResponse *a2)
{
  return (NSDictionary *)[(FAHTTPResponse *)a2 body];
}

void sub_10001F970(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000361E0(v6, v7);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

id sub_10001FD68(uint64_t a1)
{
  dispatch_queue_t v1 = [*(id *)(a1 + 32) networkService];
  id v2 = [v1 ensureAccount];

  return v2;
}

id sub_10001FDB8(uint64_t a1)
{
  id v2 = +[NSMutableDictionary dictionary];
  id v3 = [*(id *)(a1 + 32) pushTokenString];
  [v2 setObject:v3 forKeyedSubscript:@"token"];

  [v2 setObject:&off_100050840 forKeyedSubscript:@"topics"];
  id v4 = [*(id *)(a1 + 32) networkService];
  id v5 = [v4 signedRequestWithEndpoint:@"register_token" method:@"POST" headers:&off_100050858 plistBody:v2];

  return v5;
}

id sub_10001FE88(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 networkService];
  id v5 = [v3 copy];

  id v6 = [v4 plistWithRequest:v5];

  return v6;
}

id sub_10001FF08(id a1, FAHTTPResponse *a2)
{
  return &__kCFBooleanTrue;
}

id sub_10002073C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _unsafeFetchEligibilityForPropertyName:*(void *)(a1 + 40) bundleID:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t sub_100020DD4(uint64_t result)
{
  if (result)
  {
    sub_100006CB4(&qword_10005E648);
    uint64_t v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_100043230;
    swift_getErrorValue();
    swift_errorRetain();
    uint64_t v2 = Error.localizedDescription.getter();
    uint64_t v4 = v3;
    *(void *)(v1 + 56) = &type metadata for String;
    *(void *)(v1 + 64) = sub_100021D18();
    *(void *)(v1 + 32) = v2;
    *(void *)(v1 + 40) = v4;
    uint64_t v5 = String.init(format:_:)();
    unint64_t v7 = v6;
    swift_bridgeObjectRetain();
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      *(_DWORD *)id v10 = 136315138;
      swift_bridgeObjectRetain();
      sub_100029810(v5, v7, &v11);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return swift_errorRelease();
    }
    else
    {

      swift_errorRelease();
      return swift_bridgeObjectRelease_n();
    }
  }
  return result;
}

unint64_t sub_100020FE4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006CB4(&qword_10005E5D0);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_100021D6C(v6, (uint64_t)&v15, &qword_10005E5D8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100029E78(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100021D08(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_10002111C(uint64_t a1)
{
  uint64_t v2 = sub_100006CB4(&qword_10005E658);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (void *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006CB4(&qword_10005E660);
  uint64_t v6 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (uint64_t)v5 + *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100021D6C(v12, (uint64_t)v5, &qword_10005E658);
    uint64_t v14 = *v5;
    uint64_t v15 = v5[1];
    unint64_t result = sub_100029E78(*v5, v15);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    CFStringRef v19 = (uint64_t *)(v7[6] + 16 * result);
    uint64_t *v19 = v14;
    v19[1] = v15;
    uint64_t v20 = v7[7];
    uint64_t v21 = type metadata accessor for ClientRecord();
    unint64_t result = sub_100021DD0(v9, v20 + *(void *)(*(void *)(v21 - 8) + 72) * v18);
    uint64_t v22 = v7[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_11;
    }
    v7[2] = v24;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100021304(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006CB4(&qword_10005E640);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (_OWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    long long v13 = *v4;
    swift_bridgeObjectRetain();
    swift_retain();
    unint64_t result = sub_100029E78(v5, v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v9 = v5;
    v9[1] = v6;
    *(_OWORD *)(v2[7] + 16 * result) = v13;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t variable initialization expression of RateLimiter.encoder()
{
  return sub_100021488((void (*)(void))&type metadata accessor for JSONEncoder, (uint64_t (*)(void))&JSONEncoder.init());
}

uint64_t variable initialization expression of RateLimiter.decoder()
{
  return sub_100021488((void (*)(void))&type metadata accessor for JSONDecoder, (uint64_t (*)(void))&JSONDecoder.init());
}

uint64_t sub_100021488(void (*a1)(void), uint64_t (*a2)(void))
{
  return a2();
}

uint64_t variable initialization expression of RateLimiter.queue()
{
  type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin();
  type metadata accessor for DispatchQoS();
  __chkstk_darwin();
  uint64_t v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000216F0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v0);
  static DispatchQoS.unspecified.getter();
  v5[1] = &_swiftEmptyArrayStorage;
  sub_100021A80((unint64_t *)&unk_10005EA60, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100006CB4((uint64_t *)&unk_10005E530);
  sub_100006CF8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

unint64_t sub_1000216F0()
{
  unint64_t result = qword_10005E520;
  if (!qword_10005E520)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005E520);
  }
  return result;
}

uint64_t sub_100021730(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t variable initialization expression of PDSRegistrarService.pdsRegistrar()
{
  return 0;
}

unint64_t variable initialization expression of XPCEventObserver.handlers()
{
  return sub_100021304((uint64_t)&_swiftEmptyArrayStorage);
}

void type metadata accessor for AAURLEndpoint(uint64_t a1)
{
}

uint64_t sub_1000217A0(uint64_t a1, uint64_t a2)
{
  return sub_100021B28(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000217B8(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100021830(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1000218B0@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_1000218F4(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_1000218FC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100021908@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100021950@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10002197C(uint64_t a1)
{
  uint64_t v2 = sub_100021A80(&qword_10005E5C0, type metadata accessor for AAURLEndpoint);
  uint64_t v3 = sub_100021A80(&qword_10005E5C8, type metadata accessor for AAURLEndpoint);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100021A38()
{
  return sub_100021A80(&qword_10005E5A8, type metadata accessor for AAURLEndpoint);
}

uint64_t sub_100021A80(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100021AC8()
{
  return sub_100021A80(&qword_10005E5B0, type metadata accessor for AAURLEndpoint);
}

uint64_t sub_100021B10(uint64_t a1, uint64_t a2)
{
  return sub_100021B28(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100021B28(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100021B6C()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_100021BC0()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100021C34()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100021CC0()
{
  return sub_100021A80(&qword_10005E5B8, type metadata accessor for AAURLEndpoint);
}

_OWORD *sub_100021D08(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100021D18()
{
  unint64_t result = qword_10005E650;
  if (!qword_10005E650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E650);
  }
  return result;
}

uint64_t sub_100021D6C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006CB4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100021DD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClientRecord();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void type metadata accessor for FACachePolicy(uint64_t a1)
{
}

void sub_100021E48(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

NSString sub_100021E94()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_10005E730 = (uint64_t)result;
  return result;
}

NSString sub_100021ECC()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_10005E738 = (uint64_t)result;
  return result;
}

uint64_t sub_100021FBC()
{
  v1[46] = v0;
  uint64_t v2 = type metadata accessor for Logger();
  v1[47] = v2;
  v1[48] = *(void *)(v2 - 8);
  v1[49] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for URL();
  v1[50] = v3;
  v1[51] = *(void *)(v3 - 8);
  v1[52] = swift_task_alloc();
  sub_100006CB4(&qword_10005E7A0);
  v1[53] = swift_task_alloc();
  v1[54] = swift_task_alloc();
  v1[55] = swift_task_alloc();
  return _swift_task_switch(sub_100022124, 0, 0);
}

uint64_t sub_100022124()
{
  id v1 = [objc_allocWithZone((Class)FAURLConfiguration) init];
  v0[56] = v1;
  v0[2] = v0;
  v0[7] = v0 + 45;
  v0[3] = sub_100022240;
  uint64_t v2 = swift_continuation_init();
  v0[39] = _NSConcreteStackBlock;
  v0[40] = 0x40000000;
  v0[41] = sub_100022B8C;
  v0[42] = &unk_10004E810;
  v0[43] = v2;
  [v1 fetchAAURLConfigurationWithCompletion:v0 + 39];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100022240()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 456) = v1;
  if (v1) {
    uint64_t v2 = sub_1000229B8;
  }
  else {
    uint64_t v2 = sub_100022350;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100022350()
{
  uint64_t v1 = (void *)v0[56];
  uint64_t v2 = (void *)v0[45];
  v0[58] = v2;

  if (qword_10005E4F0 != -1) {
    swift_once();
  }
  id v3 = [v2 urlForEndpoint:qword_10005E730];
  if (v3)
  {
    uint64_t v4 = v3;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  uint64_t v7 = v0[54];
  uint64_t v6 = v0[55];
  uint64_t v8 = v0[50];
  uint64_t v9 = v0[51];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, v5, 1, v8);
  sub_100023EC0(v7, v6);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  int v11 = v10(v6, 1, v8);
  uint64_t v12 = v0[55];
  if (v11 == 1)
  {
    sub_100023F28(v0[55]);
  }
  else
  {
    uint64_t v13 = v0[50];
    uint64_t v14 = v0[51];
    URL.absoluteString.getter();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  }
  uint64_t v15 = v0[53];
  uint64_t v16 = v0[50];
  uint64_t v17 = v0[46];
  sub_100006CB4(&qword_10005E7A8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000433D0;
  *(void *)(inited + 32) = 0x6449656C707061;
  *(void *)(inited + 40) = 0xE700000000000000;
  uint64_t v19 = *(void *)(v17 + OBJC_IVAR___FAResendChildTransferRequestOperation_email + 8);
  *(void *)(inited + 48) = *(void *)(v17 + OBJC_IVAR___FAResendChildTransferRequestOperation_email);
  *(void *)(inited + 56) = v19;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 80) = 0x646E657365527369;
  *(void *)(inited + 88) = 0xE800000000000000;
  *(void *)(inited + 120) = &type metadata for Bool;
  *(unsigned char *)(inited + 96) = 1;
  swift_bridgeObjectRetain();
  sub_100020FE4(inited);
  id v20 = *(id *)(v17 + OBJC_IVAR___FAResendChildTransferRequestOperation_networkService);
  URL.init(string:)();
  if (v10(v15, 1, v16) == 1)
  {
    sub_100023F28(v0[53]);
    return _assertionFailure(_:_:file:line:flags:)();
  }
  else
  {
    uint64_t v22 = v0[52];
    uint64_t v23 = v0[50];
    uint64_t v24 = v0[51];
    uint64_t v25 = v0[46];
    (*(void (**)(uint64_t, void, uint64_t))(v24 + 32))(v22, v0[53], v23);
    swift_bridgeObjectRelease();
    URL._bridgeToObjectiveC()(v26);
    uint64_t v28 = v27;
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
    uint64_t v29 = *(void **)(v25 + OBJC_IVAR___FAResendChildTransferRequestOperation_familyGrandSlamSigner);
    id v30 = *(id *)(v25 + OBJC_IVAR___FAResendChildTransferRequestOperation_aaGrandSlamSigner);
    id v31 = v29;
    NSString v32 = String._bridgeToObjectiveC()();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v34 = [v20 standardRequestWithURL:v28 grandSlamSigner:v30 familyGrandSlamSigner:v31 method:v32 body:isa requestFormat:2 responseFormat:2];
    v0[59] = v34;

    v0[10] = v0;
    v0[15] = v0 + 44;
    v0[11] = sub_1000227F8;
    uint64_t v35 = swift_continuation_init();
    v0[34] = _NSConcreteStackBlock;
    v0[35] = 0x40000000;
    v0[36] = sub_100024400;
    v0[37] = &unk_10004E828;
    v0[38] = v35;
    [v34 onComplete:v0 + 34];
    return _swift_continuation_await(v0 + 10);
  }
}

uint64_t sub_1000227F8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 480) = v1;
  if (v1) {
    uint64_t v2 = sub_100022A6C;
  }
  else {
    uint64_t v2 = sub_100022908;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100022908()
{
  uint64_t v1 = *(void **)(v0 + 472);

  uint64_t v2 = *(void *)(v0 + 352);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_1000229B8()
{
  uint64_t v1 = *(void **)(v0 + 448);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100022A6C()
{
  uint64_t v2 = (void *)v0[59];
  uint64_t v1 = v0[60];
  id v3 = (void *)v0[58];
  uint64_t v5 = v0[48];
  uint64_t v4 = v0[49];
  uint64_t v6 = v0[47];
  swift_willThrow();

  static FamilyLogger.common.getter();
  swift_errorRetain();
  sub_100020DD4(v1);

  swift_errorRelease();
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7(0);
}

uint64_t sub_100022B8C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100006CB4(&qword_10005E7B0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_throwingResume(a1);
  }
}

uint64_t sub_100022DB4(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  void v2[4] = v4;
  void *v4 = v2;
  v4[1] = sub_1000243F8;
  return sub_100021FBC();
}

uint64_t sub_100022E5C()
{
  v1[40] = v0;
  uint64_t v2 = type metadata accessor for Logger();
  v1[41] = v2;
  v1[42] = *(void *)(v2 - 8);
  v1[43] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for URL();
  v1[44] = v3;
  v1[45] = *(void *)(v3 - 8);
  v1[46] = swift_task_alloc();
  sub_100006CB4(&qword_10005E7A0);
  v1[47] = swift_task_alloc();
  v1[48] = swift_task_alloc();
  v1[49] = swift_task_alloc();
  return _swift_task_switch(sub_100022FC4, 0, 0);
}

uint64_t sub_100022FC4()
{
  uint64_t v1 = v0[40];
  sub_100006CB4(&qword_10005E7A8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100043230;
  *(void *)(inited + 32) = 0x6449656C707061;
  *(void *)(inited + 40) = 0xE700000000000000;
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR___FAResendChildTransferRequestOperation_email);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR___FAResendChildTransferRequestOperation_email + 8);
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = v4;
  *(void *)(inited + 56) = v3;
  swift_bridgeObjectRetain();
  v0[50] = sub_100020FE4(inited);
  id v5 = [objc_allocWithZone((Class)FAURLConfiguration) init];
  v0[51] = v5;
  v0[10] = v0;
  v0[15] = v0 + 39;
  v0[11] = sub_10002315C;
  uint64_t v6 = swift_continuation_init();
  v0[28] = _NSConcreteStackBlock;
  v0[29] = 0x40000000;
  v0[30] = sub_100022B8C;
  v0[31] = &unk_10004E7E0;
  v0[32] = v6;
  [v5 fetchAAURLConfigurationWithCompletion:v0 + 28];
  return _swift_continuation_await(v0 + 10);
}

uint64_t sub_10002315C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 416) = v1;
  if (v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_100023844;
  }
  else
  {
    uint64_t v2 = sub_100023274;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100023274()
{
  uint64_t v1 = (void *)v0[51];
  uint64_t v2 = (void *)v0[39];
  v0[53] = v2;

  if (qword_10005E4F8 != -1) {
    swift_once();
  }
  id v3 = [v2 urlForEndpoint:qword_10005E738];
  if (v3)
  {
    uint64_t v4 = v3;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  uint64_t v6 = v0[48];
  uint64_t v7 = v0[49];
  uint64_t v8 = v0[44];
  uint64_t v9 = v0[45];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v6, v5, 1, v8);
  sub_100023EC0(v6, v7);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  int v11 = v10(v7, 1, v8);
  uint64_t v12 = v0[49];
  if (v11 == 1)
  {
    sub_100023F28(v0[49]);
  }
  else
  {
    uint64_t v13 = v0[44];
    uint64_t v14 = v0[45];
    URL.absoluteString.getter();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  }
  uint64_t v15 = v0[47];
  uint64_t v16 = v0[44];
  id v17 = *(id *)(v0[40] + OBJC_IVAR___FAResendChildTransferRequestOperation_networkService);
  URL.init(string:)();
  if (v10(v15, 1, v16) == 1)
  {
    sub_100023F28(v0[47]);
    return _assertionFailure(_:_:file:line:flags:)();
  }
  else
  {
    uint64_t v19 = v0[46];
    uint64_t v20 = v0[44];
    uint64_t v21 = v0[45];
    uint64_t v22 = v0[40];
    (*(void (**)(uint64_t, void, uint64_t))(v21 + 32))(v19, v0[47], v20);
    swift_bridgeObjectRelease();
    URL._bridgeToObjectiveC()(v23);
    uint64_t v25 = v24;
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v19, v20);
    uint64_t v26 = *(void **)(v22 + OBJC_IVAR___FAResendChildTransferRequestOperation_familyGrandSlamSigner);
    id v27 = *(id *)(v22 + OBJC_IVAR___FAResendChildTransferRequestOperation_aaGrandSlamSigner);
    id v28 = v26;
    NSString v29 = String._bridgeToObjectiveC()();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v31 = [v17 standardRequestWithURL:v25 grandSlamSigner:v27 familyGrandSlamSigner:v28 method:v29 body:isa requestFormat:2 responseFormat:2];
    v0[54] = v31;

    v0[2] = v0;
    v0[7] = v0 + 38;
    v0[3] = sub_100023684;
    uint64_t v32 = swift_continuation_init();
    v0[33] = _NSConcreteStackBlock;
    v0[34] = 0x40000000;
    v0[35] = sub_100024400;
    v0[36] = &unk_10004E7F8;
    v0[37] = v32;
    [v31 onComplete:v0 + 33];
    return _swift_continuation_await(v0 + 2);
  }
}

uint64_t sub_100023684()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 440) = v1;
  if (v1) {
    uint64_t v2 = sub_1000238F8;
  }
  else {
    uint64_t v2 = sub_100023794;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100023794()
{
  uint64_t v1 = *(void **)(v0 + 432);

  uint64_t v2 = *(void *)(v0 + 304);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_100023844()
{
  uint64_t v1 = *(void **)(v0 + 408);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000238F8()
{
  uint64_t v2 = (void *)v0[54];
  uint64_t v1 = v0[55];
  id v3 = (void *)v0[53];
  uint64_t v5 = v0[42];
  uint64_t v4 = v0[43];
  uint64_t v6 = v0[41];
  swift_willThrow();

  static FamilyLogger.common.getter();
  swift_errorRetain();
  sub_100020DD4(v1);

  swift_errorRelease();
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7(0);
}

uint64_t sub_100023B80(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  void v2[4] = v4;
  void *v4 = v2;
  v4[1] = sub_100023C28;
  return sub_100022E5C();
}

uint64_t sub_100023C28(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void **)(*v2 + 16);
  uint64_t v7 = *v2;
  swift_task_dealloc();

  uint64_t v8 = *(void (***)(void, void, void))(v5 + 24);
  if (v3)
  {
    uint64_t v9 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
    ((void (**)(void, void, void *))v8)[2](v8, 0, v9);

    _Block_release(v8);
  }
  else
  {
    ((void (**)(void, void *, void))v8)[2](v8, a1, 0);
    _Block_release(v8);
  }
  uint64_t v10 = *(uint64_t (**)(void))(v7 + 8);
  return v10();
}

id sub_100023DF8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FAResendChildTransferRequestOperation();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FAResendChildTransferRequestOperation()
{
  return self;
}

uint64_t sub_100023EC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006CB4(&qword_10005E7A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100023F28(uint64_t a1)
{
  uint64_t v2 = sub_100006CB4(&qword_10005E7A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100023F8C()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_100024038;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_10005E7C0 + dword_10005E7C0);
  return v5(v2, v3);
}

uint64_t sub_100024038()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100024130()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1000243FC;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10005EE98 + dword_10005EE98);
  return v6(v2, v3, v4);
}

uint64_t sub_1000241F4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1000243FC;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10005EEA0 + dword_10005EEA0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1000242C4()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100024304()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_1000243FC;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_10005E7E0 + dword_10005E7E0);
  return v5(v2, v3);
}

uint64_t sub_1000243B8()
{
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100024500(uint64_t a1)
{
  v2[17] = a1;
  v2[18] = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v2[19] = v3;
  void *v3 = v2;
  v3[1] = sub_1000245BC;
  return sub_100025968();
}

uint64_t sub_1000245BC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(*(void *)v2 + 136);
  uint64_t v6 = *(void **)v2;
  v6[20] = a1;
  v6[21] = a2;
  swift_task_dealloc();
  if (v5 == 1)
  {
    uint64_t v7 = (void *)swift_task_alloc();
    v6[22] = v7;
    *uint64_t v7 = v6;
    v7[1] = sub_1000249B8;
    return sub_100026014();
  }
  else if (v5 == 2)
  {
    return _swift_task_switch(sub_100024804, 0, 0);
  }
  else
  {
    uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))v6[1];
    return v8(a1, a2);
  }
}

uint64_t sub_100024804()
{
  uint64_t v1 = (char *)v0[18];
  id v2 = [v1 networkService];
  uint64_t v3 = *(void *)&v1[OBJC_IVAR____TtC13familycircled39FAFamilyChecklistRankingConfigOperation_kFAFamilyChecklistRankingConfigURLEndpoint];
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = [v2 standardRequestWithEndpoint:v3 method:v4 plistBody:0 requestFormat:2 responseFormat:2];
  v0[25] = v5;

  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_100024EB0;
  uint64_t v6 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_100024400;
  v0[13] = &unk_10004E930;
  v0[14] = v6;
  [v5 onComplete:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_1000249B8(uint64_t a1)
{
  uint64_t v3 = (void *)*v1;
  NSString v4 = (void *)*v1;
  v3[23] = a1;
  swift_task_dealloc();
  uint64_t v5 = dword_10005E850;
  uint64_t v6 = (void *)swift_task_alloc();
  v3[24] = v6;
  *uint64_t v6 = v4;
  v6[1] = sub_100024B64;
  uint64_t v7 = v3[21];
  uint64_t v8 = v3[20];
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_10005E850 + v5))(v8, v7, a1);
}

uint64_t sub_100024B64(char a1)
{
  *(unsigned char *)(*(void *)v1 + 256) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100024C90, 0, 0);
}

uint64_t sub_100024C90()
{
  int v1 = *(unsigned __int8 *)(v0 + 256);

  if (v1 == 1)
  {
    uint64_t v2 = *(void *)(v0 + 160);
    uint64_t v3 = *(void *)(v0 + 168);
    NSString v4 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
    return v4(v2, v3);
  }
  else
  {
    uint64_t v6 = *(char **)(v0 + 144);
    id v7 = [v6 networkService];
    uint64_t v8 = *(void *)&v6[OBJC_IVAR____TtC13familycircled39FAFamilyChecklistRankingConfigOperation_kFAFamilyChecklistRankingConfigURLEndpoint];
    NSString v9 = String._bridgeToObjectiveC()();
    id v10 = [v7 standardRequestWithEndpoint:v8 method:v9 plistBody:0 requestFormat:2 responseFormat:2];
    *(void *)(v0 + 200) = v10;

    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 120;
    *(void *)(v0 + 24) = sub_100024EB0;
    uint64_t v11 = swift_continuation_init();
    *(void *)(v0 + 80) = _NSConcreteStackBlock;
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_100024400;
    *(void *)(v0 + 104) = &unk_10004E930;
    *(void *)(v0 + 112) = v11;
    [v10 onComplete:v0 + 80];
    return _swift_continuation_await(v0 + 16);
  }
}

uint64_t sub_100024EB0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 208) = v1;
  if (v1) {
    uint64_t v2 = sub_10002541C;
  }
  else {
    uint64_t v2 = sub_100024FEC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100024FEC()
{
  uint64_t v1 = *(void **)(v0 + 200);
  uint64_t v2 = *(void **)(v0 + 120);
  *(void *)(v0 + 216) = v2;

  uint64_t v3 = self;
  *(void *)(v0 + 128) = 0;
  id v4 = [v3 dataWithJSONObject:v2 options:0 error:v0 + 128];
  id v5 = *(id *)(v0 + 128);
  if (v4)
  {
    uint64_t v6 = *(void *)(v0 + 144);
    uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;

    *(void *)(v0 + 224) = v7;
    *(void *)(v0 + 232) = v9;
    id v10 = (void *)(v6 + OBJC_IVAR____TtC13familycircled39FAFamilyChecklistRankingConfigOperation_cache);
    uint64_t v11 = *(void *)(v6 + OBJC_IVAR____TtC13familycircled39FAFamilyChecklistRankingConfigOperation_cache + 24);
    uint64_t v12 = *(void *)(v6 + OBJC_IVAR____TtC13familycircled39FAFamilyChecklistRankingConfigOperation_cache + 32);
    sub_100025FD0(v10, v11);
    uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 + 16) + **(int **)(v12 + 16));
    uint64_t v13 = (void *)swift_task_alloc();
    *(void *)(v0 + 240) = v13;
    *uint64_t v13 = v0;
    v13[1] = sub_100025230;
    return v19(v7, v9, v11, v12);
  }
  else
  {
    uint64_t v15 = v5;
    uint64_t v17 = *(void *)(v0 + 160);
    unint64_t v16 = *(void *)(v0 + 168);
    _convertNSErrorToError(_:)();

    swift_willThrow();
    sub_100026CD8(v17, v16);
    unint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
    return v18();
  }
}

uint64_t sub_100025230()
{
  *(void *)(*(void *)v1 + 248) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1000254D0;
  }
  else {
    uint64_t v2 = sub_100025370;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100025370()
{
  uint64_t v1 = *(void *)(v0 + 160);
  unint64_t v2 = *(void *)(v0 + 168);

  sub_100026CD8(v1, v2);
  uint64_t v3 = *(void *)(v0 + 224);
  uint64_t v4 = *(void *)(v0 + 232);
  id v5 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v5(v3, v4);
}

uint64_t sub_10002541C()
{
  uint64_t v1 = (void *)v0[25];
  uint64_t v2 = v0[20];
  unint64_t v3 = v0[21];
  swift_willThrow();
  sub_100026CD8(v2, v3);

  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1000254D0()
{
  uint64_t v1 = (void *)v0[27];
  uint64_t v2 = v0[20];
  unint64_t v3 = v0[21];
  sub_100026CEC(v0[28], v0[29]);

  sub_100026CD8(v2, v3);
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1000256F8(uint64_t a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  a3;
  uint64_t v6 = (void *)swift_task_alloc();
  v3[4] = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_1000257B4;
  return sub_100024500(a1);
}

uint64_t sub_1000257B4(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = *v3;
  uint64_t v8 = *(void **)(*v3 + 16);
  uint64_t v9 = *v3;
  swift_task_dealloc();

  if (v4)
  {
    uint64_t v10 = _convertErrorToNSError(_:)();
    swift_errorRelease();
    Class isa = 0;
    uint64_t v12 = (void *)v10;
  }
  else if (a2 >> 60 == 15)
  {
    uint64_t v10 = 0;
    Class isa = 0;
    uint64_t v12 = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100026CD8(a1, a2);
    uint64_t v10 = 0;
    uint64_t v12 = isa;
  }
  uint64_t v13 = *(void (***)(void, void, void))(v7 + 24);
  ((void (**)(void, Class, uint64_t))v13)[2](v13, isa, v10);

  _Block_release(v13);
  uint64_t v14 = *(uint64_t (**)(void))(v9 + 8);
  return v14();
}

uint64_t sub_100025968()
{
  v1[5] = v0;
  uint64_t v2 = type metadata accessor for Logger();
  void v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  return _swift_task_switch(sub_100025A28, 0, 0);
}

uint64_t sub_100025A28()
{
  uint64_t v1 = (void *)(*(void *)(v0 + 40) + OBJC_IVAR____TtC13familycircled39FAFamilyChecklistRankingConfigOperation_cache);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_100025FD0(v1, v2);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 8) + **(int **)(v3 + 8));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  void *v4 = v0;
  v4[1] = sub_100025B34;
  return v6(v2, v3);
}

uint64_t sub_100025B34(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 80) = v2;
  swift_task_dealloc();
  if (v2)
  {
    return _swift_task_switch(sub_100025CA0, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v7(a1, a2);
  }
}

uint64_t sub_100025CA0()
{
  uint64_t v16 = v0;
  static FamilyLogger.daemon.getter();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[10];
    uint64_t v4 = v0[7];
    uint64_t v14 = v0[8];
    uint64_t v5 = v0[6];
    uint64_t v6 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315394;
    v0[2] = sub_100029810(0x6D6F724664616F6CLL, 0xEF29286568636143, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v6 + 12) = 2080;
    v0[3] = v3;
    swift_errorRetain();
    sub_100006CB4(&qword_10005E7B0);
    uint64_t v7 = String.init<A>(reflecting:)();
    v0[4] = sub_100029810(v7, v8, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s unable to load data from FAFamilyChecklistRankingConfigCache with error: %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v14, v5);
  }
  else
  {
    uint64_t v10 = v0[7];
    uint64_t v9 = v0[8];
    uint64_t v11 = v0[6];
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void, unint64_t))v0[1];
  return v12(0, 0xF000000000000000);
}

id sub_100025F2C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FAFamilyChecklistRankingConfigOperation();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FAFamilyChecklistRankingConfigOperation()
{
  return self;
}

void *sub_100025FD0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100026014()
{
  uint64_t v1 = type metadata accessor for Logger();
  v0[19] = v1;
  v0[20] = *(void *)(v1 - 8);
  v0[21] = swift_task_alloc();
  return _swift_task_switch(sub_1000260D0, 0, 0);
}

uint64_t sub_1000260D0()
{
  id v1 = [objc_allocWithZone((Class)FAFetchFamilyCircleRequest) init];
  v0[22] = v1;
  [v1 setCachePolicy:0];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_1000261FC;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_100024400;
  v0[13] = &unk_10004E948;
  v0[14] = v2;
  [v1 startRequestWithCompletionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_1000261FC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 184) = v1;
  if (v1) {
    uint64_t v2 = sub_10002637C;
  }
  else {
    uint64_t v2 = sub_10002630C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10002630C()
{
  uint64_t v1 = *(void *)(v0 + 120);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_10002637C()
{
  uint64_t v17 = v0;
  swift_willThrow();
  static FamilyLogger.daemon.getter();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = *(void *)(v0 + 184);
    uint64_t v4 = *(void *)(v0 + 160);
    uint64_t v15 = *(void *)(v0 + 168);
    uint64_t v13 = *(void **)(v0 + 176);
    uint64_t v14 = *(void *)(v0 + 152);
    uint64_t v5 = swift_slowAlloc();
    v16[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315394;
    *(void *)(v0 + 128) = sub_100029810(0xD00000000000001CLL, 0x8000000100041120, v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v5 + 12) = 2080;
    *(void *)(v0 + 136) = v3;
    swift_errorRetain();
    sub_100006CB4(&qword_10005E7B0);
    uint64_t v6 = String.init<A>(reflecting:)();
    *(void *)(v0 + 144) = sub_100029810(v6, v7, v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s unable to retrieve familyCircle from cache with error: %s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v15, v14);
  }
  else
  {
    uint64_t v9 = *(void *)(v0 + 160);
    uint64_t v8 = *(void *)(v0 + 168);
    uint64_t v10 = *(void *)(v0 + 152);

    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11(0);
}

uint64_t sub_100026614(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[18] = a2;
  v3[19] = a3;
  v3[17] = a1;
  uint64_t v4 = type metadata accessor for Logger();
  v3[20] = v4;
  v3[21] = *(void *)(v4 - 8);
  v3[22] = swift_task_alloc();
  v3[23] = swift_task_alloc();
  return _swift_task_switch(sub_100026714, 0, 0);
}

uint64_t sub_100026714()
{
  uint64_t v47 = v0;
  unint64_t v1 = *(void *)(v0 + 144);
  if (v1 >> 60 == 15)
  {
    char v2 = 0;
    goto LABEL_30;
  }
  uint64_t v3 = *(void **)(v0 + 152);
  uint64_t v4 = *(void *)(v0 + 136);
  if (v3)
  {
    sub_100026D44(v4, v1);
    id v5 = [v3 checklistRankingVersion];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v9 = v8;

      uint64_t v10 = self;
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      *(void *)(v0 + 128) = 0;
      id v12 = [v10 JSONObjectWithData:isa options:0 error:v0 + 128];

      uint64_t v13 = *(void **)(v0 + 128);
      if (!v12)
      {
        id v25 = v13;
        swift_bridgeObjectRelease();
        uint64_t v26 = _convertNSErrorToError(_:)();

        swift_willThrow();
        static FamilyLogger.daemon.getter();
        swift_errorRetain();
        swift_errorRetain();
        id v27 = Logger.logObject.getter();
        os_log_type_t v28 = static os_log_type_t.error.getter();
        BOOL v29 = os_log_type_enabled(v27, v28);
        uint64_t v30 = *(void *)(v0 + 168);
        uint64_t v31 = *(void *)(v0 + 176);
        uint64_t v32 = *(void *)(v0 + 160);
        if (v29)
        {
          unint64_t v45 = *(void *)(v0 + 144);
          uint64_t v44 = *(void *)(v0 + 136);
          uint64_t v33 = swift_slowAlloc();
          uint64_t v46 = swift_slowAlloc();
          *(_DWORD *)uint64_t v33 = 136315394;
          *(void *)(v0 + 120) = sub_100029810(0xD000000000000032, 0x80000001000410B0, &v46);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v33 + 12) = 2080;
          *(void *)(v0 + 104) = v26;
          swift_errorRetain();
          sub_100006CB4(&qword_10005E7B0);
          uint64_t v34 = String.init<A>(reflecting:)();
          *(void *)(v0 + 96) = sub_100029810(v34, v35, &v46);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v27, v28, "%s unable to create json object from cachedData with error: %s", (uint8_t *)v33, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
          sub_100026CD8(v44, v45);

          swift_errorRelease();
          (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v31, v32);
        }
        else
        {
          sub_100026CD8(*(void *)(v0 + 136), *(void *)(v0 + 144));
          swift_errorRelease();
          swift_errorRelease();
          swift_errorRelease();

          (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v31, v32);
        }
        char v2 = 0;
        goto LABEL_30;
      }
      uint64_t v14 = (_OWORD *)(v0 + 48);
      id v15 = v13;
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
      sub_100006CB4((uint64_t *)&unk_10005EC30);
      if (swift_dynamicCast() && (uint64_t v16 = *(void *)(v0 + 112)) != 0)
      {
        if (*(void *)(v16 + 16) && (unint64_t v17 = sub_100029E78(0x6E6F6973726576, 0xE700000000000000), (v18 & 1) != 0))
        {
          sub_100026DFC(*(void *)(v16 + 56) + 32 * v17, v0 + 48);
        }
        else
        {
          *uint64_t v14 = 0u;
          *(_OWORD *)(v0 + 64) = 0u;
        }
        swift_bridgeObjectRelease();
        if (*(void *)(v0 + 72))
        {
          if (swift_dynamicCast())
          {
            if (*(void *)(v0 + 80) == v7 && *(void *)(v0 + 88) == v9) {
              char v2 = 1;
            }
            else {
              char v2 = _stringCompareWithSmolCheck(_:_:expecting:)();
            }
            uint64_t v41 = *(void *)(v0 + 136);
            unint64_t v40 = *(void *)(v0 + 144);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_100026CD8(v41, v40);
          }
          else
          {
            uint64_t v39 = *(void *)(v0 + 136);
            unint64_t v38 = *(void *)(v0 + 144);
            swift_bridgeObjectRelease();
            sub_100026CD8(v39, v38);
            char v2 = 0;
          }
          goto LABEL_30;
        }
      }
      else
      {
        *uint64_t v14 = 0u;
        *(_OWORD *)(v0 + 64) = 0u;
      }
      uint64_t v37 = *(void *)(v0 + 136);
      unint64_t v36 = *(void *)(v0 + 144);
      swift_bridgeObjectRelease();
      sub_100026CD8(v37, v36);
      sub_100026D9C(v0 + 48);
      char v2 = 0;
      goto LABEL_30;
    }
  }
  else
  {
    sub_100026D44(v4, v1);
  }
  static FamilyLogger.daemon.getter();
  uint64_t v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "server has not defined checklist ranking version, considering cache as valid", v21, 2u);
    swift_slowDealloc();
  }
  uint64_t v22 = *(void *)(v0 + 184);
  uint64_t v23 = *(void *)(v0 + 160);
  uint64_t v24 = *(void *)(v0 + 168);
  sub_100026CD8(*(void *)(v0 + 136), *(void *)(v0 + 144));

  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
  char v2 = 1;
LABEL_30:
  swift_task_dealloc();
  swift_task_dealloc();
  id v42 = *(uint64_t (**)(void))(v0 + 8);
  return v42(v2 & 1);
}

uint64_t sub_100026CD8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100026CEC(a1, a2);
  }
  return a1;
}

uint64_t sub_100026CEC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t sub_100026D44(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_100026D9C(uint64_t a1)
{
  uint64_t v2 = sub_100006CB4(&qword_10005E858);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100026DFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100026E58()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100026E98()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  id v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *id v5 = v1;
  v5[1] = sub_100024038;
  uint64_t v6 = (uint64_t (*)(uint64_t, void *, void *))((char *)&dword_10005E860 + dword_10005E860);
  return v6(v2, v3, v4);
}

uint64_t sub_100026F54(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100026FA4()
{
  sub_100006CB4(&qword_10005EA48);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100043460;
  *(void *)(inited + 32) = 0x6E65726566657250;
  *(void *)(inited + 40) = 0xEB00000000736563;
  *(void *)(inited + 48) = 0x796C696D6146;
  *(void *)(inited + 56) = 0xE600000000000000;
  *(void *)(inited + 64) = 0x7463796C696D6166;
  *(void *)(inited + 72) = 0xE90000000000006CLL;
  strcpy((char *)(inited + 80), "FamilySettings");
  *(unsigned char *)(inited + 95) = -18;
  *(void *)(inited + 96) = 0xD00000000000001CLL;
  *(void *)(inited + 104) = 0x8000000100041490;
  Swift::Int v1 = sub_100029FD4(inited);
  swift_setDeallocating();
  uint64_t result = swift_arrayDestroy();
  qword_10005E870 = v1;
  return result;
}

uint64_t sub_1000270B8()
{
  uint64_t v0 = sub_100006CB4(&qword_10005E898);
  sub_10002A8F4(v0, qword_10005E878);
  sub_10002A338(v0, (uint64_t)qword_10005E878);
  id v1 = [self hours];
  sub_10002A9B0(0, &qword_10005EA30);
  return Measurement.init(value:unit:)();
}

id RateLimiter.__allocating_init(persistence:identifier:getDate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v11 = objc_allocWithZone(v5);
  id v12 = sub_1000059FC(a1, a2, a3, a4, a5);
  swift_unknownObjectRelease();
  swift_release();
  return v12;
}

id RateLimiter.init(persistence:identifier:getDate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5 = sub_1000059FC(a1, a2, a3, a4, a5);
  swift_unknownObjectRelease();
  swift_release();
  return v5;
}

void sub_100027220(uint64_t a1)
{
  id v1 = (id)(*(uint64_t (**)(void))(a1 + 16))();
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

id RateLimiter.__allocating_init(identifier:)()
{
  id v1 = objc_allocWithZone(v0);
  id v2 = [self standardUserDefaults];
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  void v7[4] = j___s10Foundation4DateV3nowACvgZ;
  void v7[5] = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_10002749C;
  v7[3] = &unk_10004E9D8;
  uint64_t v4 = _Block_copy(v7);
  id v5 = [v1 initWithPersistence:v2 identifier:v3 getDate:v4];
  _Block_release(v4);

  return v5;
}

id RateLimiter.init(identifier:)()
{
  id v1 = [self standardUserDefaults];
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  void v6[4] = j___s10Foundation4DateV3nowACvgZ;
  v6[5] = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_10002749C;
  v6[3] = &unk_10004EA00;
  NSString v3 = _Block_copy(v6);
  id v4 = [v0 initWithPersistence:v1 identifier:v2 getDate:v3];
  _Block_release(v3);

  return v4;
}

Class sub_10002749C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  id v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v7 = swift_retain();
  v6(v7);
  swift_release();
  v8.super.Class isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v8.super.isa;
}

Swift::Bool __swiftcall RateLimiter.isAllowed(clientName:)(Swift::String clientName)
{
  OS_dispatch_queue.sync<A>(execute:)();
  return v2;
}

Swift::Void __swiftcall RateLimiter.recordCall(clientName:)(Swift::String clientName)
{
  object = clientName._object;
  uint64_t countAndFlagsBits = clientName._countAndFlagsBits;
  uint64_t v4 = *(NSObject **)&v1[OBJC_IVAR___FARateLimiter_queue];
  id v5 = (void *)swift_allocObject();
  void v5[2] = v1;
  v5[3] = countAndFlagsBits;
  void v5[4] = object;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_10002A1D0;
  *(void *)(v6 + 24) = v5;
  void v10[4] = sub_10002A20C;
  void v10[5] = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100027818;
  v10[3] = &unk_10004EA78;
  uint64_t v7 = _Block_copy(v10);
  NSDate v8 = v1;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v4, v7);
  _Block_release(v7);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
}

uint64_t sub_100027818(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_1000278A8(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v42 = *(void *)(v5 - 8);
  uint64_t v43 = v5;
  __chkstk_darwin(v5);
  uint64_t v46 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ClientRecord();
  uint64_t v40 = *(void *)(v7 - 8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v41 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  id v15 = (char *)&v39 - v14;
  uint64_t v16 = (void *)sub_1000289F8();
  unint64_t v17 = *(void (**)(void))(v2 + OBJC_IVAR___FARateLimiter_getDate);
  unint64_t v45 = v15;
  v17();
  swift_bridgeObjectRetain();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v48 = v16;
  uint64_t v44 = a1;
  unint64_t v20 = sub_100029E78(a1, a2);
  uint64_t v21 = v16[2];
  BOOL v22 = (v19 & 1) == 0;
  uint64_t v23 = v21 + v22;
  if (__OFADD__(v21, v22))
  {
    __break(1u);
    goto LABEL_13;
  }
  LOBYTE(v15) = v19;
  if (v16[3] >= v23)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_6;
    }
LABEL_13:
    sub_10002FCC8();
    uint64_t v16 = v48;
    goto LABEL_6;
  }
  sub_10002F280(v23, isUniquelyReferenced_nonNull_native);
  uint64_t v16 = v48;
  unint64_t v24 = sub_100029E78(v44, a2);
  if ((v15 & 1) != (v25 & 1))
  {
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v20 = v24;
LABEL_6:
  uint64_t v26 = v46;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if ((v15 & 1) == 0)
  {
    static Date.now.getter();
    sub_10002FC30(v20, v44, a2, (uint64_t)v9, v16);
    swift_bridgeObjectRetain();
  }
  uint64_t v27 = v16[7];
  swift_bridgeObjectRelease();
  os_log_type_t v28 = v45;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 24))(v27 + *(void *)(v40 + 72) * v20, v45, v10);
  swift_bridgeObjectRelease();
  sub_100028B64((unint64_t)v16);
  swift_bridgeObjectRelease();
  BOOL v29 = v26;
  static FamilyLogger.rateLimiter.getter();
  uint64_t v30 = v41;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v41, v28, v10);
  swift_bridgeObjectRetain_n();
  uint64_t v31 = Logger.logObject.getter();
  os_log_type_t v32 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = swift_slowAlloc();
    uint64_t v48 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_100029810(v44, a2, (uint64_t *)&v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v33 + 12) = 2080;
    sub_100006D78(&qword_10005EA28, (void (*)(uint64_t))&type metadata accessor for Date);
    uint64_t v34 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v47 = sub_100029810(v34, v35, (uint64_t *)&v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    unint64_t v36 = *(void (**)(char *, uint64_t))(v11 + 8);
    v36(v30, v10);
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "Client: %s recorded new call at: %s", (uint8_t *)v33, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v42 + 8))(v46, v43);
    return ((uint64_t (*)(char *, uint64_t))v36)(v45, v10);
  }
  else
  {

    unint64_t v38 = *(void (**)(char *, uint64_t))(v11 + 8);
    v38(v30, v10);
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v29, v43);
    return ((uint64_t (*)(char *, uint64_t))v38)(v28, v10);
  }
}

Swift::Bool __swiftcall RateLimiter.unsafeIsAllowed(clientName:)(Swift::String clientName)
{
  uint64_t v2 = v1;
  object = clientName._object;
  uint64_t countAndFlagsBits = clientName._countAndFlagsBits;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v80 = v4;
  uint64_t v81 = v5;
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)&v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v79 = (char *)&v69 - v9;
  uint64_t v10 = sub_100006CB4(&qword_10005E898);
  uint64_t v76 = *(void *)(v10 - 8);
  uint64_t v77 = v10;
  uint64_t v11 = __chkstk_darwin(v10);
  v74 = (char *)&v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v75 = (char *)&v69 - v13;
  uint64_t v14 = sub_100006CB4(&qword_10005E8A0);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v69 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100006CB4(&qword_10005E8A8);
  __chkstk_darwin(v17 - 8);
  char v19 = (char *)&v69 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for Date();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  unint64_t v24 = (char *)&v69 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v22);
  v73 = (char *)&v69 - v26;
  __chkstk_darwin(v25);
  os_log_type_t v28 = (char *)&v69 - v27;
  if (qword_10005E500 != -1) {
    swift_once();
  }
  if (sub_1000288C0(countAndFlagsBits, (uint64_t)object, qword_10005E870)) {
    goto LABEL_16;
  }
  v72 = v8;
  unint64_t v29 = sub_1000289F8();
  uint64_t v30 = *(void *)(v29 + 16);
  uint64_t v78 = v21;
  v70 = v28;
  if (v30)
  {
    uint64_t v71 = v20;
    swift_bridgeObjectRetain();
    unint64_t v31 = sub_100029E78(countAndFlagsBits, (uint64_t)object);
    if (v32)
    {
      unint64_t v33 = v31;
      uint64_t v34 = v2;
      uint64_t v35 = *(void *)(v29 + 56);
      uint64_t v36 = type metadata accessor for ClientRecord();
      uint64_t v37 = *(void *)(v36 - 8);
      v69 = v24;
      unint64_t v38 = object;
      uint64_t v39 = v37;
      uint64_t v40 = v35 + *(void *)(v37 + 72) * v33;
      uint64_t v2 = v34;
      sub_10002A370(v40, (uint64_t)v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(v16, 0, 1, v36);
      object = v38;
      unint64_t v24 = v69;
    }
    else
    {
      uint64_t v36 = type metadata accessor for ClientRecord();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v16, 1, 1, v36);
    }
    swift_bridgeObjectRelease();
    uint64_t v20 = v71;
  }
  else
  {
    uint64_t v36 = type metadata accessor for ClientRecord();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v16, 1, 1, v36);
  }
  swift_bridgeObjectRelease();
  type metadata accessor for ClientRecord();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 48))(v16, 1, v36) == 1)
  {
    sub_10002A280((uint64_t)v16, &qword_10005E8A0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v78 + 56))(v19, 1, 1, v20);
    uint64_t v41 = v72;
LABEL_13:
    sub_10002A280((uint64_t)v19, &qword_10005E8A8);
    static FamilyLogger.rateLimiter.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v44 = Logger.logObject.getter();
    os_log_type_t v45 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      uint64_t v84 = swift_slowAlloc();
      *(_DWORD *)uint64_t v46 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v83 = sub_100029810(countAndFlagsBits, (unint64_t)object, &v84);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "Client: %s allowed to call for the first time", v46, 0xCu);
      char v47 = 1;
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v81 + 8))(v41, v80);
      return v47 & 1;
    }

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v81 + 8))(v41, v80);
LABEL_16:
    char v47 = 1;
    return v47 & 1;
  }
  uint64_t v71 = v2;
  uint64_t v42 = v78;
  (*(void (**)(char *, char *, uint64_t))(v78 + 16))(v19, v16, v20);
  sub_10002A2DC((uint64_t)v16);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(v19, 0, 1, v20);
  int v43 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v42 + 48))(v19, 1, v20);
  uint64_t v41 = v72;
  if (v43 == 1) {
    goto LABEL_13;
  }
  v69 = v24;
  v49 = v70;
  (*(void (**)(void))(v42 + 32))();
  if (qword_10005E508 != -1) {
    swift_once();
  }
  uint64_t v50 = v77;
  uint64_t v51 = sub_10002A338(v77, (uint64_t)qword_10005E878);
  v53 = v75;
  uint64_t v52 = v76;
  (*(void (**)(char *, uint64_t, uint64_t))(v76 + 16))(v75, v51, v50);
  id v54 = [self seconds];
  v55 = v74;
  Measurement<>.converted(to:)();

  Measurement.value.getter();
  v56 = *(void (**)(char *, uint64_t))(v52 + 8);
  v56(v55, v50);
  v57 = v73;
  Date.addingTimeInterval(_:)();
  uint64_t v58 = ((uint64_t (*)(char *, uint64_t))v56)(v53, v50);
  v59 = v69;
  (*(void (**)(uint64_t))(v71 + OBJC_IVAR___FARateLimiter_getDate))(v58);
  sub_100006D78(&qword_10005E8B8, (void (*)(uint64_t))&type metadata accessor for Date);
  unsigned __int8 v60 = dispatch thunk of static Comparable.< infix(_:_:)();
  v61 = *(void (**)(char *, uint64_t))(v42 + 8);
  v61(v59, v20);
  v61(v57, v20);
  static FamilyLogger.rateLimiter.getter();
  swift_bridgeObjectRetain_n();
  v62 = Logger.logObject.getter();
  uint64_t v63 = v42 + 8;
  os_log_type_t v64 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v62, v64))
  {
    uint64_t v65 = swift_slowAlloc();
    uint64_t v78 = v63;
    uint64_t v66 = v65;
    uint64_t v67 = swift_slowAlloc();
    uint64_t v71 = v20;
    uint64_t v84 = v67;
    *(_DWORD *)uint64_t v66 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v83 = sub_100029810(countAndFlagsBits, (unint64_t)object, &v84);
    uint64_t v68 = v81;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v66 + 12) = 1024;
    char v47 = v60 ^ 1;
    LODWORD(v83) = (v60 ^ 1) & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v62, v64, "Client: %s isAllowed: %{BOOL}d", (uint8_t *)v66, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v68 + 8))(v79, v80);
    v61(v70, v71);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(char *, uint64_t))(v81 + 8))(v79, v80);
    v61(v49, v20);
    char v47 = v60 ^ 1;
  }
  return v47 & 1;
}

uint64_t sub_1000288C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    Hasher.init(_seed:)();
    String.hash(into:)();
    Swift::Int v6 = Hasher._finalize()();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

unint64_t sub_1000289F8()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___FARateLimiter_persistence);
  _StringGuts.grow(_:)(37);
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___FARateLimiter_identifier);
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR___FARateLimiter_identifier + 8);
  swift_bridgeObjectRetain();
  v4._uint64_t countAndFlagsBits = v2;
  v4._object = v3;
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v6 = [v1 dataForKey:v5];

  if (!v6) {
    return sub_10002111C((uint64_t)&_swiftEmptyArrayStorage);
  }
  uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;

  sub_10002A95C();
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  sub_100026CEC(v7, v9);
  return 0xD000000000000023;
}

uint64_t sub_100028B64(unint64_t a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  __chkstk_darwin(v3);
  unint64_t v14 = a1;
  sub_10002A818();
  uint64_t v4 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v6 = v5;
  uint64_t v7 = *(void **)(v1 + OBJC_IVAR___FARateLimiter_persistence);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  _StringGuts.grow(_:)(37);
  swift_bridgeObjectRelease();
  unint64_t v14 = 0xD000000000000023;
  unint64_t v15 = 0x8000000100041220;
  uint64_t v9 = *(void *)(v1 + OBJC_IVAR___FARateLimiter_identifier);
  uint64_t v10 = *(void **)(v1 + OBJC_IVAR___FARateLimiter_identifier + 8);
  swift_bridgeObjectRetain();
  v11._uint64_t countAndFlagsBits = v9;
  v11._object = v10;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v7 setValue:isa forKey:v12];

  return sub_100026CEC(v4, v6);
}

id XPCEventObserver.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

void RateLimiter.init()()
{
}

id RateLimiter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RateLimiter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100028F5C()
{
  return 1;
}

uint64_t sub_100028F70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002AB30(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100028F9C()
{
  return 0;
}

void sub_100028FA8(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100028FB4(uint64_t a1)
{
  unint64_t v2 = sub_10002AE0C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100028FF0(uint64_t a1)
{
  unint64_t v2 = sub_10002AE0C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10002902C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100006CB4(&qword_10005EA90);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100025FD0(a1, a1[3]);
  sub_10002AE0C();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v9[1] = a2;
  sub_100006CB4(&qword_10005EAA0);
  sub_10002AE60();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_10002917C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v15 = a2;
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v14 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  BOOL v17 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006CB4(&qword_10005E9F8);
  uint64_t v16 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for ClientRecord();
  __chkstk_darwin(v9 - 8);
  Swift::String v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100025FD0(a1, a1[3]);
  sub_10002A7C4();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    sub_100006D78(&qword_10005EA08, (void (*)(uint64_t))&type metadata accessor for Date);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v6);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v17, v4);
    sub_100021DD0((uint64_t)v11, v15);
  }
  return sub_100026F54((uint64_t)a1);
}

void *sub_1000293FC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_10002ABD0(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_100029428(void *a1)
{
  return sub_10002902C(a1, *v1);
}

Swift::Int sub_100029444()
{
  return Hasher._finalize()();
}

void sub_100029488()
{
}

Swift::Int sub_1000294B0()
{
  return Hasher._finalize()();
}

uint64_t sub_1000294F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002AD48(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100029520(uint64_t a1)
{
  unint64_t v2 = sub_10002A7C4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10002955C(uint64_t a1)
{
  unint64_t v2 = sub_10002A7C4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100029598@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10002917C(a1, a2);
}

uint64_t sub_1000295B0(void *a1)
{
  uint64_t v2 = sub_100006CB4(&qword_10005EA10);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100025FD0(a1, a1[3]);
  sub_10002A7C4();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  type metadata accessor for Date();
  sub_100006D78(&qword_10005EA18, (void (*)(uint64_t))&type metadata accessor for Date);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100029724(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100029734(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100029770(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100029798(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_100029810(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_100029810(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000298E4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100026DFC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100026DFC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100026F54((uint64_t)v12);
  return v7;
}

uint64_t sub_1000298E4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100029AA0(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_100029AA0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100029B38(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100029D18(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100029D18(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100029B38(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_100029CB0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100029CB0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100006CB4(&qword_10005EA38);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100029D18(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100006CB4(&qword_10005EA38);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unsigned char **sub_100029E68(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

unint64_t sub_100029E78(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return sub_100029EF0(a1, a2, v4);
}

unint64_t sub_100029EF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

Swift::Int sub_100029FD4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100006CB4((uint64_t *)&unk_10005EA50);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      unint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      Swift::Int result = Hasher._finalize()();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          char v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

BOOL sub_10002A178@<W0>(unsigned char *a1@<X8>)
{
  return sub_10002A86C(a1);
}

uint64_t sub_10002A190()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002A1D0()
{
  return sub_1000278A8(*(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_10002A1FC()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002A20C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t type metadata accessor for ClientRecord()
{
  uint64_t result = qword_10005E9C0;
  if (!qword_10005E9C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10002A280(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006CB4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10002A2DC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ClientRecord();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002A338(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10002A370(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClientRecord();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002A3D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_10002A440(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_10002A4A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_10002A508(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_10002A56C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_10002A5D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_10002A634(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002A648);
}

uint64_t sub_10002A648(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_10002A6B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002A6C8);
}

uint64_t sub_10002A6C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_10002A738()
{
  uint64_t result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_10002A7C4()
{
  unint64_t result = qword_10005EA00;
  if (!qword_10005EA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EA00);
  }
  return result;
}

unint64_t sub_10002A818()
{
  unint64_t result = qword_10005EA20;
  if (!qword_10005EA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EA20);
  }
  return result;
}

BOOL sub_10002A86C@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = RateLimiter.unsafeIsAllowed(clientName:)(*(Swift::String *)(v1 + 24));
  *a1 = result;
  return result;
}

uint64_t sub_10002A8B4()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10002A8EC()
{
  sub_100027220(*(void *)(v0 + 16));
}

uint64_t *sub_10002A8F4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_10002A95C()
{
  unint64_t result = qword_10005EA40;
  if (!qword_10005EA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EA40);
  }
  return result;
}

uint64_t sub_10002A9B0(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

ValueMetadata *type metadata accessor for Record()
{
  return &type metadata for Record;
}

uint64_t sub_10002AA0C()
{
  return 0;
}

ValueMetadata *type metadata accessor for ClientRecord.CodingKeys()
{
  return &type metadata for ClientRecord.CodingKeys;
}

unint64_t sub_10002AA2C()
{
  unint64_t result = qword_10005EA78;
  if (!qword_10005EA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EA78);
  }
  return result;
}

unint64_t sub_10002AA84()
{
  unint64_t result = qword_10005EA80;
  if (!qword_10005EA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EA80);
  }
  return result;
}

unint64_t sub_10002AADC()
{
  unint64_t result = qword_10005EA88;
  if (!qword_10005EA88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EA88);
  }
  return result;
}

uint64_t sub_10002AB30(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x73746E65696C63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_10002ABB8()
{
  return 0x73746E65696C63;
}

void *sub_10002ABD0(void *a1)
{
  uint64_t v3 = sub_100006CB4(&qword_10005EAB8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100025FD0(a1, a1[3]);
  sub_10002AE0C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    sub_100026F54((uint64_t)a1);
  }
  else
  {
    sub_100006CB4(&qword_10005EAA0);
    sub_10002AF0C();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = (void *)v9[1];
    sub_100026F54((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_10002AD48(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6563655274736F6DLL && a2 == 0xEE006C6C6143746ELL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_10002ADE8()
{
  return 0x6563655274736F6DLL;
}

unint64_t sub_10002AE0C()
{
  unint64_t result = qword_10005EA98;
  if (!qword_10005EA98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EA98);
  }
  return result;
}

unint64_t sub_10002AE60()
{
  unint64_t result = qword_10005EAA8;
  if (!qword_10005EAA8)
  {
    sub_100021730(&qword_10005EAA0);
    sub_100006D78(&qword_10005EAB0, (void (*)(uint64_t))type metadata accessor for ClientRecord);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EAA8);
  }
  return result;
}

unint64_t sub_10002AF0C()
{
  unint64_t result = qword_10005EAC0;
  if (!qword_10005EAC0)
  {
    sub_100021730(&qword_10005EAA0);
    sub_100006D78(&qword_10005EAC8, (void (*)(uint64_t))type metadata accessor for ClientRecord);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EAC0);
  }
  return result;
}

uint64_t _s13familycircled12ClientRecordV10CodingKeysOwet_0(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *_s13familycircled12ClientRecordV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10002B0A4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Record.CodingKeys()
{
  return &type metadata for Record.CodingKeys;
}

unint64_t sub_10002B0E0()
{
  unint64_t result = qword_10005EAD0;
  if (!qword_10005EAD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EAD0);
  }
  return result;
}

unint64_t sub_10002B138()
{
  unint64_t result = qword_10005EAD8;
  if (!qword_10005EAD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EAD8);
  }
  return result;
}

unint64_t sub_10002B190()
{
  unint64_t result = qword_10005EAE0;
  if (!qword_10005EAE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EAE0);
  }
  return result;
}

id sub_10002B1F8()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for PDSRegistrarService()) init];
  static PDSRegistrarService.sharedInstance = (uint64_t)result;
  return result;
}

uint64_t *PDSRegistrarService.sharedInstance.unsafeMutableAddressor()
{
  if (qword_10005E510 != -1) {
    swift_once();
  }
  return &static PDSRegistrarService.sharedInstance;
}

id static PDSRegistrarService.sharedInstance.getter()
{
  if (qword_10005E510 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static PDSRegistrarService.sharedInstance;
  return v0;
}

id sub_10002B32C()
{
  uint64_t v1 = type metadata accessor for Logger();
  __chkstk_darwin(v1);
  uint64_t v2 = OBJC_IVAR___PDSRegistrarService_pdsRegistrar;
  *(void *)&v0[OBJC_IVAR___PDSRegistrarService_pdsRegistrar] = 0;
  id v3 = objc_allocWithZone((Class)PDSRegistrar);
  unsigned int v4 = v0;
  id v5 = sub_10002BFE8();
  unint64_t v6 = *(void **)&v0[v2];
  *(void *)&v0[v2] = v5;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for PDSRegistrarService();
  return objc_msgSendSuper2(&v8, "init");
}

uint64_t PDSRegistrarService.registerToPDS(_:)(char a1)
{
  uint64_t v48 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v48 - 8);
  uint64_t v4 = __chkstk_darwin(v48);
  unint64_t v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v45 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  unint64_t v12 = (char *)&v45 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v45 - v14;
  __chkstk_darwin(v13);
  BOOL v17 = (char *)&v45 - v16;
  id v18 = [self registerDeviceWithPDS];
  unsigned int v19 = [v18 value];

  if (v19)
  {
    id v20 = objc_allocWithZone((Class)PDSRegistration);
    NSString v21 = String._bridgeToObjectiveC()();
    id v22 = [v20 initWithTopic:v21 pushEnvironment:a1];

    id v23 = sub_10002C0B4();
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void **)(v1 + OBJC_IVAR___PDSRegistrarService_pdsRegistrar);
      if (v25)
      {
        id v50 = 0;
        id v26 = v25;
        if ([v26 ensureRegistrationPresent:v22 forUser:v24 error:&v50])
        {
          id v27 = v50;
          static FamilyLogger.daemon.getter();
          os_log_type_t v28 = Logger.logObject.getter();
          os_log_type_t v29 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v28, v29))
          {
            uint64_t v30 = (uint8_t *)swift_slowAlloc();
            char v47 = (void *)swift_slowAlloc();
            id v50 = v47;
            uint64_t v46 = v30;
            *(_DWORD *)uint64_t v30 = 136315138;
            os_log_type_t v45 = v30 + 4;
            LOBYTE(v49) = a1;
            uint64_t v31 = dispatch thunk of CustomStringConvertible.description.getter();
            uint64_t v49 = sub_100029810(v31, v32, (uint64_t *)&v50);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v28, v29, "PDS Registration was successful. environment is: %s", v46, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }

          return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v17, v48);
        }
        else
        {
          id v43 = v50;
          uint64_t v44 = _convertNSErrorToError(_:)();

          swift_willThrow();
          static FamilyLogger.daemon.getter();
          swift_errorRetain();
          sub_100020DD4(v44);

          swift_errorRelease();
          swift_errorRelease();
          return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v48);
        }
      }
      else
      {
        static FamilyLogger.daemon.getter();
        uint64_t v40 = Logger.logObject.getter();
        os_log_type_t v41 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v40, v41))
        {
          uint64_t v42 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v42 = 0;
          _os_log_impl((void *)&_mh_execute_header, v40, v41, "PDSRegistrar is nil", v42, 2u);
          swift_slowDealloc();
        }

        return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v15, v48);
      }
    }
    else
    {
      static FamilyLogger.daemon.getter();
      uint64_t v37 = Logger.logObject.getter();
      os_log_type_t v38 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v37, v38))
      {
        uint64_t v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v39 = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, v38, "PDSUser is nil", v39, 2u);
        swift_slowDealloc();
      }

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v12, v48);
    }
  }
  else
  {
    static FamilyLogger.daemon.getter();
    uint64_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Did not register to PDS since server flag is not enabled", v36, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v48);
  }
}

Swift::Void __swiftcall PDSRegistrarService.removeRegistrationFromPDS()()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = &v38[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = &v38[-v7];
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = &v38[-v10];
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = &v38[-v13];
  __chkstk_darwin(v12);
  uint64_t v16 = &v38[-v15];
  id v17 = [self registerDeviceWithPDS];
  unsigned int v18 = [v17 value];

  if (v18)
  {
    id v19 = sub_10002C0B4();
    if (v19)
    {
      id v20 = v19;
      NSString v21 = *(void **)(v0 + OBJC_IVAR___PDSRegistrarService_pdsRegistrar);
      if (v21)
      {
        id v39 = 0;
        id v22 = v21;
        if ([v22 removeAllRegistrationsFromUser:v20 error:&v39])
        {
          id v23 = v39;
          static FamilyLogger.daemon.getter();
          uint64_t v24 = Logger.logObject.getter();
          os_log_type_t v25 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v24, v25))
          {
            id v26 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)id v26 = 0;
            _os_log_impl((void *)&_mh_execute_header, v24, v25, "Removing PDS registration was successful", v26, 2u);
            swift_slowDealloc();
          }
        }
        else
        {
          id v36 = v39;
          uint64_t v37 = _convertNSErrorToError(_:)();

          swift_willThrow();
          static FamilyLogger.daemon.getter();
          swift_errorRetain();
          sub_100020DD4(v37);
          swift_errorRelease();
          swift_errorRelease();
          uint64_t v16 = v5;
        }
      }
      else
      {
        static FamilyLogger.daemon.getter();
        unint64_t v33 = Logger.logObject.getter();
        os_log_type_t v34 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v33, v34))
        {
          os_log_type_t v35 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)os_log_type_t v35 = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, v34, "PDSRegistrar is nil", v35, 2u);
          swift_slowDealloc();
        }

        uint64_t v16 = v14;
      }
    }
    else
    {
      static FamilyLogger.daemon.getter();
      uint64_t v30 = Logger.logObject.getter();
      os_log_type_t v31 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v30, v31))
      {
        unint64_t v32 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v32 = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "PDSUser is nil in removing registration", v32, 2u);
        swift_slowDealloc();
      }

      uint64_t v16 = v11;
    }
  }
  else
  {
    static FamilyLogger.daemon.getter();
    id v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v27, v28))
    {
      os_log_type_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Did not de-register PDS since server flag is not enabled", v29, 2u);
      swift_slowDealloc();
    }

    uint64_t v16 = v8;
  }
  (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v16, v1);
}

id PDSRegistrarService.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PDSRegistrarService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_10002BFE8()
{
  NSString v1 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v6 = 0;
  id v2 = [v0 initWithClientID:v1 error:&v6];

  if (v2)
  {
    id v3 = v6;
  }
  else
  {
    id v4 = v6;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v2;
}

id sub_10002C0B4()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [objc_allocWithZone((Class)ACAccountStore) init];
  uint64_t v5 = objc_msgSend(v4, "aida_accountForPrimaryiCloudAccount");

  if (v5 && (id v6 = [v5 aida_dsid]) != 0)
  {
    uint64_t v7 = v6;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v9 = [self userWithDSID:v8];
  }
  else
  {
    static FamilyLogger.daemon.getter();
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Account is nil, unable to get dsid", v12, 2u);
      swift_slowDealloc();
      uint64_t v13 = v5;
    }
    else
    {
      uint64_t v13 = v10;
      uint64_t v10 = v5;
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return 0;
  }
  return v9;
}

uint64_t type metadata accessor for PDSRegistrarService()
{
  return self;
}

uint64_t *FAFamilyChecklistRankingConfigCache.shared.unsafeMutableAddressor()
{
  if (qword_10005E518 != -1) {
    swift_once();
  }
  return &static FAFamilyChecklistRankingConfigCache.shared;
}

BOOL sub_10002C334(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10002C348()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10002C390()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10002C3BC()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_10002C410()
{
  type metadata accessor for FAFamilyChecklistRankingConfigCache();
  uint64_t v0 = swift_allocObject();
  uint64_t result = swift_defaultActor_initialize();
  static FAFamilyChecklistRankingConfigCache.shared = v0;
  return result;
}

uint64_t static FAFamilyChecklistRankingConfigCache.shared.getter()
{
  if (qword_10005E518 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t sub_10002C4A8()
{
  uint64_t v0 = type metadata accessor for URL();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [self defaultManager];
  id v10 = 0;
  id v5 = [v4 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v10];

  id v6 = v10;
  if (v5)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    id v7 = v6;

    URL.appendingPathComponent(_:)();
    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  else
  {
    id v9 = v10;
    _convertNSErrorToError(_:)();

    return swift_willThrow();
  }
}

uint64_t FAFamilyChecklistRankingConfigCache.load()()
{
  v1[7] = v0;
  uint64_t v2 = type metadata accessor for Logger();
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for URL();
  v1[11] = v3;
  v1[12] = *(void *)(v3 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  return _swift_task_switch(sub_10002C794, v0, 0);
}

uint64_t sub_10002C794()
{
  uint64_t v12 = v0;
  id v1 = [self defaultManager];
  sub_10002C4A8();
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[11];
  uint64_t v4 = v0[12];
  URL.path.getter();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v5(v2, v3);
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  LOBYTE(v3) = [v1 fileExistsAtPath:v6];

  if (v3)
  {
    sub_10002C4A8();
    uint64_t v7 = Data.init(contentsOf:options:)();
    unint64_t v9 = v8;
    v5(v0[13], v0[11]);
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v9 = 0xF000000000000000;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v10 = (uint64_t (*)(uint64_t, unint64_t))v0[1];
  return v10(v7, v9);
}

unint64_t sub_10002CB68()
{
  unint64_t result = qword_10005EB28;
  if (!qword_10005EB28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EB28);
  }
  return result;
}

uint64_t FAFamilyChecklistRankingConfigCache.save(with:)(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  uint64_t v4 = type metadata accessor for Logger();
  v3[10] = v4;
  v3[11] = *(void *)(v4 - 8);
  v3[12] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for URL();
  v3[13] = v5;
  v3[14] = *(void *)(v5 - 8);
  v3[15] = swift_task_alloc();
  return _swift_task_switch(sub_10002CCDC, v2, 0);
}

uint64_t sub_10002CCDC()
{
  sub_10002C4A8();
  Data.write(to:options:)();
  (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t FAFamilyChecklistRankingConfigCache.invalidate()()
{
  v1[3] = v0;
  uint64_t v2 = type metadata accessor for URL();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  void v1[6] = swift_task_alloc();
  return _swift_task_switch(sub_10002D0A0, v0, 0);
}

uint64_t sub_10002D0A0()
{
  id v1 = [self defaultManager];
  sub_10002C4A8();
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 32);
  URL.path.getter();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 16) = 0;
  unsigned int v6 = [v1 removeItemAtPath:v5 error:v0 + 16];

  id v7 = *(id *)(v0 + 16);
  if (!v6)
  {
    unint64_t v9 = v7;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  swift_task_dealloc();
  unint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t FAFamilyChecklistRankingConfigCache.deinit()
{
  swift_defaultActor_destroy();
  return v0;
}

uint64_t FAFamilyChecklistRankingConfigCache.__deallocating_deinit()
{
  swift_defaultActor_destroy();
  return _swift_defaultActor_deallocate(v0);
}

uint64_t FAFamilyChecklistRankingConfigCache.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_10002D2A8()
{
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10002D338;
  return FAFamilyChecklistRankingConfigCache.load()();
}

uint64_t sub_10002D338(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  uint64_t v6 = swift_task_dealloc();
  unint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (!v2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2;
  }
  return v8(v6, v7);
}

uint64_t sub_10002D448(uint64_t a1, uint64_t a2)
{
  NSString v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *NSString v5 = v2;
  v5[1] = sub_1000243FC;
  return FAFamilyChecklistRankingConfigCache.save(with:)(a1, a2);
}

uint64_t sub_10002D4F0()
{
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100024038;
  return FAFamilyChecklistRankingConfigCache.invalidate()();
}

uint64_t type metadata accessor for FAFamilyChecklistRankingConfigCache()
{
  return self;
}

unsigned char *initializeBufferWithCopyOfBuffer for FamilyChecklistRankingConfigError(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FamilyChecklistRankingConfigError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FamilyChecklistRankingConfigError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10002D70CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_10002D734(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10002D73C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FamilyChecklistRankingConfigError()
{
  return &type metadata for FamilyChecklistRankingConfigError;
}

unint64_t sub_10002D758()
{
  unint64_t result = qword_10005EC20;
  if (!qword_10005EC20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005EC20);
  }
  return result;
}

id sub_10002D7AC()
{
  id v1 = [v0 userInfo];
  uint64_t v2 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v10[3] = sub_100006CB4((uint64_t *)&unk_10005EC30);
  v10[0] = v2;
  sub_10002D954((uint64_t)v10, v11);
  sub_100026F54((uint64_t)v10);
  if (v11[3])
  {
    if (swift_dynamicCast()) {
      goto LABEL_6;
    }
  }
  else
  {
    sub_100026D9C((uint64_t)v11);
  }
  sub_100020FE4((uint64_t)&_swiftEmptyArrayStorage);
LABEL_6:
  id v3 = [v0 domain];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  id v4 = [v0 code];
  id v5 = objc_allocWithZone((Class)NSError);
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v8 = [v5 initWithDomain:v6 code:v4 userInfo:isa];

  return v8;
}

uint64_t sub_10002D954@<X0>(uint64_t a1@<X0>, char **a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  BOOL v7 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100026DFC(a1, (uint64_t)&v72);
  uint64_t v8 = sub_100006CB4(&qword_10005EC40);
  if (swift_dynamicCast())
  {
    unint64_t v9 = a2;
    uint64_t v10 = *(void *)(v70 + 16);
    if (v10)
    {
      uint64_t v11 = v70 + 32;
      id v12 = v64;
      swift_bridgeObjectRetain();
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage;
      do
      {
        sub_100026DFC(v11, (uint64_t)&v72);
        sub_10002D954(&v68, &v72);
        sub_100026F54((uint64_t)&v72);
        if (v69)
        {
          sub_100021D08(&v68, &v70);
          sub_100021D08(&v70, &v68);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v13 = sub_10002E19C(0, *((void *)v13 + 2) + 1, 1, v13);
          }
          unint64_t v15 = *((void *)v13 + 2);
          unint64_t v14 = *((void *)v13 + 3);
          if (v15 >= v14 >> 1) {
            uint64_t v13 = sub_10002E19C((char *)(v14 > 1), v15 + 1, 1, v13);
          }
          *((void *)v13 + 2) = v15 + 1;
          sub_100021D08(&v68, &v13[32 * v15 + 32]);
        }
        else
        {
          sub_100026D9C((uint64_t)&v68);
        }
        v11 += 32;
        --v10;
      }
      while (v10);

      uint64_t result = swift_bridgeObjectRelease_n();
    }
    else
    {
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage;
    }
    v9[3] = (char *)v8;
    *unint64_t v9 = v13;
    return result;
  }
  sub_100026DFC(a1, (uint64_t)&v72);
  uint64_t v16 = sub_100006CB4((uint64_t *)&unk_10005EC30);
  if (!swift_dynamicCast())
  {
    sub_100026DFC(a1, (uint64_t)&v72);
    sub_100006CB4(&qword_10005EC48);
    if (swift_dynamicCast())
    {
      swift_unknownObjectRelease();
      return sub_100026DFC(a1, (uint64_t)a2);
    }
    else
    {
      static FamilyLogger.daemon.getter();
      sub_100026DFC(a1, (uint64_t)&v72);
      id v50 = Logger.logObject.getter();
      os_log_type_t v51 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v50, v51))
      {
        uint64_t v52 = (uint8_t *)swift_slowAlloc();
        uint64_t v53 = swift_slowAlloc();
        v59 = a2;
        *(void *)&long long v68 = v53;
        *(_DWORD *)uint64_t v52 = 136315138;
        id v64 = v52 + 4;
        sub_100026DFC((uint64_t)&v72, (uint64_t)&v70);
        uint64_t v54 = String.init<A>(describing:)();
        *(void *)&long long v70 = sub_100029810(v54, v55, (uint64_t *)&v68);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        sub_100026F54((uint64_t)&v72);
        _os_log_impl((void *)&_mh_execute_header, v50, v51, "Removing non secure value: %s", v52, 0xCu);
        swift_arrayDestroy();
        a2 = v59;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        sub_100026F54((uint64_t)&v72);
      }

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      *(_OWORD *)a2 = 0u;
      *((_OWORD *)a2 + 1) = 0u;
    }
    return result;
  }
  uint64_t v58 = v16;
  v59 = a2;
  int64_t v17 = 0;
  uint64_t v18 = v70;
  uint64_t v19 = *(void *)(v70 + 64);
  uint64_t v60 = v70 + 64;
  uint64_t v20 = 1 << *(unsigned char *)(v70 + 32);
  uint64_t v21 = -1;
  if (v20 < 64) {
    uint64_t v21 = ~(-1 << v20);
  }
  unint64_t v22 = v21 & v19;
  v62 = v71;
  uint64_t v63 = &v74;
  int64_t v61 = (unint64_t)(v20 + 63) >> 6;
  int64_t v57 = v61 - 1;
  id v23 = (char *)&_swiftEmptyDictionarySingleton;
  if ((v21 & v19) == 0) {
    goto LABEL_20;
  }
LABEL_18:
  unint64_t v24 = __clz(__rbit64(v22));
  v22 &= v22 - 1;
  unint64_t v25 = v24 | (v17 << 6);
LABEL_19:
  uint64_t v26 = *(void *)(v18 + 56);
  id v27 = (void *)(*(void *)(v18 + 48) + 16 * v25);
  uint64_t v28 = v27[1];
  *(void *)&long long v70 = *v27;
  *((void *)&v70 + 1) = v28;
  sub_100026DFC(v26 + 32 * v25, (uint64_t)v62);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_10002E2AC((uint64_t)&v70, (uint64_t)&v72);
    uint64_t v32 = v73;
    if (!v73)
    {
      uint64_t result = swift_release();
      uint64_t v49 = v59;
      v59[3] = (char *)v58;
      char *v49 = v23;
      return result;
    }
    uint64_t v33 = v72;
    sub_100021D08(v63, &v70);
    sub_10002D954(&v66, &v70);
    if (!v67)
    {
      sub_100026F54((uint64_t)&v70);
      swift_bridgeObjectRelease();
      sub_100026D9C((uint64_t)&v66);
      if (v22) {
        goto LABEL_18;
      }
      goto LABEL_20;
    }
    sub_100021D08(&v66, &v68);
    sub_100026DFC((uint64_t)&v68, (uint64_t)&v66);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v65 = v23;
    unint64_t v36 = sub_100029E78(v33, v32);
    uint64_t v37 = *((void *)v23 + 2);
    BOOL v38 = (v35 & 1) == 0;
    uint64_t v39 = v37 + v38;
    if (__OFADD__(v37, v38)) {
      break;
    }
    char v40 = v35;
    if (*((void *)v23 + 3) >= v39)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_10002FF34();
      }
    }
    else
    {
      sub_10002F624(v39, isUniquelyReferenced_nonNull_native);
      unint64_t v41 = sub_100029E78(v33, v32);
      if ((v40 & 1) != (v42 & 1)) {
        goto LABEL_66;
      }
      unint64_t v36 = v41;
    }
    id v23 = v65;
    if (v40)
    {
      id v43 = (_OWORD *)(*((void *)v65 + 7) + 32 * v36);
      sub_100026F54((uint64_t)v43);
      sub_100021D08(&v66, v43);
    }
    else
    {
      *(void *)&v65[8 * (v36 >> 6) + 64] |= 1 << v36;
      uint64_t v44 = (uint64_t *)(*((void *)v23 + 6) + 16 * v36);
      uint64_t *v44 = v33;
      v44[1] = v32;
      sub_100021D08(&v66, (_OWORD *)(*((void *)v23 + 7) + 32 * v36));
      uint64_t v45 = *((void *)v23 + 2);
      BOOL v46 = __OFADD__(v45, 1);
      uint64_t v47 = v45 + 1;
      if (v46) {
        goto LABEL_64;
      }
      *((void *)v23 + 2) = v47;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100026F54((uint64_t)&v68);
    sub_100026F54((uint64_t)&v70);
    if (v22) {
      goto LABEL_18;
    }
LABEL_20:
    int64_t v29 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      goto LABEL_63;
    }
    if (v29 < v61)
    {
      unint64_t v30 = *(void *)(v60 + 8 * v29);
      if (v30) {
        goto LABEL_23;
      }
      int64_t v31 = v17 + 2;
      ++v17;
      if (v29 + 1 < v61)
      {
        unint64_t v30 = *(void *)(v60 + 8 * v31);
        if (v30) {
          goto LABEL_26;
        }
        int64_t v17 = v29 + 1;
        if (v29 + 2 < v61)
        {
          unint64_t v30 = *(void *)(v60 + 8 * (v29 + 2));
          if (v30)
          {
            v29 += 2;
            goto LABEL_23;
          }
          int64_t v31 = v29 + 3;
          int64_t v17 = v29 + 2;
          if (v29 + 3 < v61)
          {
            unint64_t v30 = *(void *)(v60 + 8 * v31);
            if (!v30)
            {
              while (1)
              {
                int64_t v29 = v31 + 1;
                if (__OFADD__(v31, 1)) {
                  goto LABEL_65;
                }
                if (v29 >= v61)
                {
                  int64_t v17 = v57;
                  goto LABEL_37;
                }
                unint64_t v30 = *(void *)(v60 + 8 * v29);
                ++v31;
                if (v30) {
                  goto LABEL_23;
                }
              }
            }
LABEL_26:
            int64_t v29 = v31;
LABEL_23:
            unint64_t v22 = (v30 - 1) & v30;
            unint64_t v25 = __clz(__rbit64(v30)) + (v29 << 6);
            int64_t v17 = v29;
            goto LABEL_19;
          }
        }
      }
    }
LABEL_37:
    unint64_t v22 = 0;
    memset(v71, 0, sizeof(v71));
    long long v70 = 0u;
  }
  __break(1u);
LABEL_63:
  __break(1u);
LABEL_64:
  __break(1u);
LABEL_65:
  __break(1u);
LABEL_66:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

char *sub_10002E19C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100006CB4(&qword_10005EC58);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[32 * v8 + 32]) {
          memmove(v13, a4 + 32, 32 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10002E314(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10002E2AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006CB4(&qword_10005EC50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002E314(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10002E4D8()
{
  uint64_t v1 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR___FAXPCEventObserver_handlers);
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v5 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  sub_1000302E0((uint64_t)sub_10002F278, v1, 0xD00000000000002DLL, 0x80000001000417F0, isUniquelyReferenced_nonNull_native);
  uint64_t *v2 = v5;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_10002E5C4()
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v1 = (void *)result;
    uint64_t v2 = *(void **)(result + OBJC_IVAR___FAXPCEventObserver_delegate);
    swift_unknownObjectRetain();

    [v2 handleContactsChanged];
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_10002E640()
{
  sub_10002E4D8();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___FAXPCEventObserver_stream);
  uint64_t v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectRetain();
  swift_retain();
  NSString v3 = String._bridgeToObjectiveC()();
  void v5[4] = sub_10002F270;
  void v5[5] = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  void v5[2] = sub_10002EA00;
  v5[3] = &unk_10004ED88;
  uint64_t v4 = _Block_copy(v5);
  swift_retain();
  swift_release();
  [v1 setEventHandlerForStream:v3 queue:0 handler:v4];
  _Block_release(v4);
  swift_unknownObjectRelease();
  swift_release_n();
}

uint64_t sub_10002E78C(void *a1)
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    NSString v3 = (char *)result;
    id v4 = [a1 name];
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;

    uint64_t v8 = &v3[OBJC_IVAR___FAXPCEventObserver_handlers];
    swift_beginAccess();
    uint64_t v9 = *(void *)v8;
    swift_bridgeObjectRetain();

    if (*(void *)(v9 + 16) && (unint64_t v10 = sub_100029E78(v5, v7), (v11 & 1) != 0))
    {
      uint64_t v12 = *(void (**)(void **))(*(void *)(v9 + 56) + 16 * v10);
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v13 = a1;
      swift_retain();
      v12(&v13);
      return swift_release_n();
    }
    else
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

void XPCEventObserver.init()()
{
}

id XPCEventObserver.__deallocating_deinit()
{
  return sub_10002EF60(type metadata accessor for XPCEventObserver);
}

uint64_t type metadata accessor for XPCEventObserver()
{
  return self;
}

void sub_10002EA04(uint64_t a1, void (*a2)(void))
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (objc_class *)type metadata accessor for XPCEvent();
  uint64_t v9 = (char *)objc_allocWithZone(v8);
  *(void *)&v9[OBJC_IVAR____TtC13familycircled8XPCEvent_object] = a1;
  v29.receiver = v9;
  v29.super_class = v8;
  swift_unknownObjectRetain();
  id v10 = objc_msgSendSuper2(&v29, "init");
  static FamilyLogger.daemon.getter();
  id v11 = v10;
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v26 = v4;
    unint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v28 = v25;
    *(_DWORD *)unint64_t v14 = 136315138;
    v22[1] = v14 + 4;
    id v23 = v14;
    unint64_t v15 = a2;
    id v16 = [v11 name];
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v24 = v5;
    uint64_t v18 = v17;
    unint64_t v20 = v19;

    a2 = v15;
    uint64_t v27 = sub_100029810(v18, v20, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "did receive xpc event: %s", v23, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v26);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  id v21 = v11;
  a2();
}

uint64_t sub_10002ECC4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

id sub_10002EEDC()
{
  return sub_10002EF60(type metadata accessor for XPCStreamHandler);
}

uint64_t type metadata accessor for XPCStreamHandler()
{
  return self;
}

id sub_10002EF48()
{
  return sub_10002EF60(type metadata accessor for XPCEvent);
}

id sub_10002EF60(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for XPCEvent()
{
  return self;
}

uint64_t sub_10002F034()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (xpc_dictionary_get_string(*(xpc_object_t *)(v0 + OBJC_IVAR____TtC13familycircled8XPCEvent_object), _xpc_event_key_name))
  {
    return String.init(cString:)();
  }
  static FamilyLogger.daemon.getter();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Unknown XPC event name received", v8, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return 0xD000000000000021;
}

uint64_t sub_10002F1AC()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002F1E4()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_10002F1F8()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10002F230(uint64_t a1)
{
  sub_10002EA04(a1, *(void (**)(void))(v1 + 16));
}

uint64_t sub_10002F238()
{
  swift_unknownObjectWeakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002F270(void *a1)
{
  return sub_10002E78C(a1);
}

uint64_t sub_10002F278()
{
  return sub_10002E5C4();
}

uint64_t sub_10002F280(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for ClientRecord();
  uint64_t v42 = *(void *)(v5 - 8);
  __chkstk_darwin(v5 - 8);
  os_log_type_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  sub_100006CB4(&qword_10005E660);
  int v43 = a2;
  uint64_t v9 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  unint64_t v41 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v40) {
      break;
    }
    id v23 = v41;
    unint64_t v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v24 = v41[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v43 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v40) {
              goto LABEL_34;
            }
            unint64_t v24 = v41[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v14 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void *)(v42 + 72);
    uint64_t v30 = *(void *)(v8 + 56) + v29 * v21;
    if (v43)
    {
      sub_100021DD0(v30, (uint64_t)v7);
    }
    else
    {
      sub_10002A370(v30, (uint64_t)v7);
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v31 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v10 + 48) + 16 * v18);
    void *v19 = v28;
    v19[1] = v27;
    uint64_t result = sub_100021DD0((uint64_t)v7, *(void *)(v10 + 56) + v29 * v18);
    ++*(void *)(v10 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  id v23 = v41;
  if ((v43 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v8 + 32);
  if (v38 >= 64) {
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *id v23 = -1 << v38;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v10;
  return result;
}

uint64_t sub_10002F624(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100006CB4(&qword_10005E5D0);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    char v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      unint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_100021D08(v24, v35);
      }
      else
      {
        sub_100026DFC((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      void *v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_100021D08(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_10002F924(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100006CB4(&qword_10005E640);
  char v6 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    BOOL v36 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v22 = v21 | (v14 << 6);
      }
      else
      {
        int64_t v23 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v35) {
          goto LABEL_33;
        }
        unint64_t v24 = v36[v23];
        ++v14;
        if (!v24)
        {
          int64_t v14 = v23 + 1;
          if (v23 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v24 = v36[v14];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v35)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v6)
              {
                uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
                if (v34 >= 64) {
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v36 = -1 << v34;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v36[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v14 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_40;
                }
                if (v14 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v24 = v36[v14];
                ++v25;
                if (v24) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v14 = v25;
          }
        }
LABEL_30:
        unint64_t v11 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v14 << 6);
      }
      uint64_t v30 = 16 * v22;
      uint64_t v31 = (uint64_t *)(*(void *)(v5 + 48) + v30);
      uint64_t v33 = *v31;
      uint64_t v32 = v31[1];
      long long v37 = *(_OWORD *)(*(void *)(v5 + 56) + v30);
      if ((v6 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_retain();
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v28 = v17 == v27;
          if (v17 == v27) {
            unint64_t v17 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v12 + 8 * v17);
        }
        while (v29 == -1);
        unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
      }
      *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t v19 = 16 * v18;
      int64_t v20 = (void *)(*(void *)(v8 + 48) + v19);
      void *v20 = v33;
      v20[1] = v32;
      *(_OWORD *)(*(void *)(v8 + 56) + v19) = v37;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v8;
  return result;
}

uint64_t sub_10002FC30(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  void *v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for ClientRecord();
  uint64_t result = sub_100021DD0(a4, v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

void *sub_10002FCC8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ClientRecord();
  uint64_t v29 = *(void *)(v2 - 8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006CB4(&qword_10005E660);
  uint64_t v5 = *v0;
  uint64_t v6 = static _DictionaryStorage.copy(original:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    uint64_t *v1 = v7;
    return result;
  }
  unint64_t v27 = v1;
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v28 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v23 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_23;
      }
      unint64_t v24 = *(void *)(v28 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    unint64_t v18 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v29 + 72) * v16;
    sub_10002A370(*(void *)(v5 + 56) + v21, (uint64_t)v4);
    unint64_t v22 = (void *)(*(void *)(v7 + 48) + v17);
    *unint64_t v22 = v19;
    v22[1] = v20;
    sub_100021DD0((uint64_t)v4, *(void *)(v7 + 56) + v21);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v27;
    goto LABEL_25;
  }
  unint64_t v24 = *(void *)(v28 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_10002FF34()
{
  uint64_t v1 = v0;
  sub_100006CB4(&qword_10005E5D0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }
  int64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_100026DFC(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_100021D08(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_10003011C()
{
  uint64_t v1 = v0;
  sub_100006CB4(&qword_10005E640);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v20 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1000302E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_100029E78(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_10003011C();
LABEL_7:
    long long v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      unint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_release();
      *unint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_10002F924(v17, a5 & 1);
  unint64_t v23 = sub_100029E78(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  long long v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  int64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  *int64_t v25 = a3;
  v25[1] = a4;
  uint64_t v26 = (void *)(v20[7] + 16 * v14);
  *uint64_t v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;
  return swift_bridgeObjectRetain();
}

uint64_t sub_100030470@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for SystemBackgroundRequestFactory();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = type metadata accessor for FamilyFeatureFlags();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for FamilyFeatureFlags.systemBackgroundTasks(_:), v3);
  char v7 = static FamilyFeatureFlags.enabled(_:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  if (v7)
  {
    sub_100006CB4(&qword_10005EEE8);
    swift_allocObject();
    sub_1000343E4(86400, (uint64_t)&unk_10005EEE0, v8);
    swift_release();
    int64_t v9 = self;
    swift_retain();
    id v10 = [v9 sharedScheduler];
    SystemBackgroundRequestFactory.init()();
    v16[1] = v10;
    uint64_t v11 = sub_100006CB4(&qword_10005EEF0);
    swift_allocObject();
    uint64_t v12 = SystemBackgroundTaskScheduler.init(taskProvider:underlyingScheduler:requestFactory:)();
    swift_release();
    char v13 = (unint64_t *)&unk_10005EEF8;
    unint64_t v14 = &qword_10005EEF0;
  }
  else
  {
    type metadata accessor for HeartbeatXPCActivityProvider();
    swift_allocObject();
    sub_100031C18(86400, (uint64_t)&unk_10005EEC0, v8);
    uint64_t v11 = sub_100006CB4(&qword_10005EEC8);
    swift_allocObject();
    swift_retain();
    uint64_t v12 = XPCActivityScheduler.init(taskProvider:)();
    swift_release();
    char v13 = (unint64_t *)&unk_10005EED0;
    unint64_t v14 = &qword_10005EEC8;
  }
  uint64_t result = sub_100034758(v13, v14);
  a1[3] = v11;
  a1[4] = result;
  *a1 = v12;
  return result;
}

uint64_t sub_100030778(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  return _swift_task_switch(sub_100030798, 0, 0);
}

uint64_t sub_100030798()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  v0[6] = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[7] = v2;
    void *v2 = v0;
    v2[1] = sub_100030884;
    return sub_100030980();
  }
  else
  {
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
}

uint64_t sub_100030884()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000347DC, 0, 0);
}

uint64_t sub_100030980()
{
  v1[27] = v0;
  uint64_t v2 = type metadata accessor for XPCActivity.Criteria.Options();
  v1[28] = v2;
  v1[29] = *(void *)(v2 - 8);
  v1[30] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for XPCActivity.Priority();
  v1[31] = v3;
  v1[32] = *(void *)(v3 - 8);
  v1[33] = swift_task_alloc();
  type metadata accessor for XPCActivity.Criteria();
  v1[34] = swift_task_alloc();
  return _swift_task_switch(sub_100030AC8, 0, 0);
}

uint64_t sub_100030AC8()
{
  uint64_t v1 = (void *)v0[27];
  v0[2] = v0;
  v0[7] = v0 + 25;
  v0[3] = sub_100030BC4;
  uint64_t v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_100031388;
  v0[13] = &unk_10004EFF8;
  v0[14] = v2;
  [v1 performHeartbeatCheckinWithCompletion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100030BC4()
{
  return _swift_task_switch(sub_100030CA4, 0, 0);
}

uint64_t sub_100030CA4()
{
  uint64_t v1 = v0[33];
  uint64_t v3 = v0[31];
  uint64_t v2 = v0[32];
  sub_100030470(v0 + 15);
  sub_100025FD0(v0 + 15, v0[18]);
  dispatch thunk of BackgroundTaskScheduler.taskProvider.getter();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for XPCActivity.Priority.maintenance(_:), v3);
  sub_100006CB4(&qword_10005EF00);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000433D0;
  static XPCActivity.Criteria.Options.requiresNetwork.getter();
  static XPCActivity.Criteria.Options.allowBattery.getter();
  v0[26] = v4;
  sub_100034710(&qword_10005EF08, (void (*)(uint64_t))&type metadata accessor for XPCActivity.Criteria.Options);
  sub_100006CB4(&qword_10005EF10);
  sub_100034758(&qword_10005EF18, &qword_10005EF10);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  XPCActivity.Criteria.init(priority:repeating:delay:gracePeriod:interval:options:)();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of BackgroundTaskProvider.criteria.setter();
  swift_unknownObjectRelease();
  sub_100026F54((uint64_t)(v0 + 15));
  sub_100030470(v0 + 20);
  uint64_t v5 = v0[23];
  uint64_t v6 = v0[24];
  sub_100025FD0(v0 + 20, v5);
  char v7 = (void *)swift_task_alloc();
  v0[35] = (uint64_t)v7;
  *char v7 = v0;
  v7[1] = sub_100030F7C;
  return dispatch thunk of BackgroundTaskScheduler.schedule()(v5, v6);
}

uint64_t sub_100030F7C()
{
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v1 = sub_1000347CC;
  }
  else
  {
    uint64_t v1 = sub_100031094;
  }
  return _swift_task_switch(v1, 0, 0);
}

uint64_t sub_100031094()
{
  sub_100026F54(v0 + 160);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10003111C(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  return _swift_task_switch(sub_10003113C, 0, 0);
}

uint64_t sub_10003113C()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  v0[6] = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[7] = v2;
    void *v2 = v0;
    v2[1] = sub_100031228;
    return sub_100030980();
  }
  else
  {
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
}

uint64_t sub_100031228()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100031324, 0, 0);
}

uint64_t sub_100031324()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100031388(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return _swift_continuation_resume();
}

uint64_t FAHeartbeatActivity.schedule()()
{
  *(void *)(v1 + 56) = v0;
  return _swift_task_switch(sub_1000313CC, 0, 0);
}

uint64_t sub_1000313CC()
{
  sub_100030470(v0 + 2);
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  sub_100025FD0(v0 + 2, v1);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = (uint64_t)v3;
  void *v3 = v0;
  v3[1] = sub_100031490;
  return dispatch thunk of BackgroundTaskScheduler.schedule()(v1, v2);
}

uint64_t sub_100031490()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100031608;
  }
  else {
    uint64_t v2 = sub_1000315A4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000315A4()
{
  sub_100026F54(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100031608()
{
  sub_100026F54(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000317D4(const void *a1, void *a2)
{
  *(void *)(v2 + 56) = a2;
  *(void *)(v2 + 64) = _Block_copy(a1);
  id v4 = a2;
  return _swift_task_switch(sub_10003184C, 0, 0);
}

uint64_t sub_10003184C()
{
  sub_100030470(v0 + 2);
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  sub_100025FD0(v0 + 2, v1);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[9] = (uint64_t)v3;
  void *v3 = v0;
  v3[1] = sub_100031910;
  return dispatch thunk of BackgroundTaskScheduler.schedule()(v1, v2);
}

uint64_t sub_100031910()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100031AA8;
  }
  else {
    uint64_t v2 = sub_100031A24;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100031A24()
{
  uint64_t v1 = *(void **)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  sub_100026F54(v0 + 16);

  (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  _Block_release(*(const void **)(v0 + 64));
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100031AA8()
{
  uint64_t v2 = *(void **)(v0 + 56);
  uint64_t v1 = *(void *)(v0 + 64);
  sub_100026F54(v0 + 16);

  uint64_t v3 = (void *)_convertErrorToNSError(_:)();
  swift_errorRelease();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);

  _Block_release(*(const void **)(v0 + 64));
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

Swift::Void __swiftcall FAHeartbeatActivity.unregister()()
{
  sub_100030470(v0);
  sub_100025FD0(v0, v0[3]);
  dispatch thunk of BackgroundTaskScheduler.unregister()();
  sub_100026F54((uint64_t)v0);
}

uint64_t sub_100031C18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v17 = a1;
  uint64_t v4 = type metadata accessor for XPCActivity.Criteria.Options();
  uint64_t v15 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v5 = type metadata accessor for XPCActivity.Priority();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for XPCActivity.Criteria();
  uint64_t v9 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for XPCActivity.Priority.maintenance(_:), v5);
  sub_100006CB4(&qword_10005EF00);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1000433D0;
  static XPCActivity.Criteria.Options.requiresNetwork.getter();
  static XPCActivity.Criteria.Options.allowBattery.getter();
  uint64_t v20 = v12;
  sub_100034710(&qword_10005EF08, (void (*)(uint64_t))&type metadata accessor for XPCActivity.Criteria.Options);
  sub_100006CB4(&qword_10005EF10);
  sub_100034758(&qword_10005EF18, &qword_10005EF10);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  XPCActivity.Criteria.init(priority:repeating:delay:gracePeriod:interval:options:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v3 + OBJC_IVAR____TtC13familycircled28HeartbeatXPCActivityProvider_criteria, v11, v16);
  uint64_t v13 = v19;
  *(void *)(v3 + 16) = v18;
  *(void *)(v3 + 24) = v13;
  return v3;
}

uint64_t sub_100031F3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006CB4(&qword_10005E7B8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for TaskPriority();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = a1;
  void v11[5] = a2;
  v11[6] = a3;
  LODWORD(a2) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  swift_retain();
  swift_retain();
  if (a2 == 1)
  {
    sub_100033854((uint64_t)v8);
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (v11[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v14 = v13;
      swift_unknownObjectRelease();
      if (v14 | v12)
      {
        v16[0] = 0;
        v16[1] = 0;
        void v16[2] = v12;
        v16[3] = v14;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_100032170(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  void v6[6] = a6;
  void v6[4] = a4;
  uint64_t v7 = type metadata accessor for Logger();
  v6[7] = v7;
  v6[8] = *(void *)(v7 - 8);
  v6[9] = swift_task_alloc();
  v6[10] = swift_task_alloc();
  return _swift_task_switch(sub_100032244, 0, 0);
}

uint64_t sub_100032244()
{
  unint64_t v23 = v0;
  if (XPCActivity.shouldDefer()())
  {
    static FamilyLogger.osUpdateActivity.getter();
    uint64_t v1 = Logger.logObject.getter();
    os_log_type_t v2 = static os_log_type_t.debug.getter();
    BOOL v3 = os_log_type_enabled(v1, v2);
    uint64_t v5 = v0[8];
    uint64_t v4 = v0[9];
    uint64_t v6 = v0[7];
    if (v3)
    {
      uint64_t v20 = v0[9];
      uint64_t v18 = v0[7];
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315138;
      v0[3] = sub_100029810(0xD000000000000011, 0x80000001000418A0, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "FAOSUpdatedActivity %s - defering activityBlock", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v20, v18);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = (uint64_t (*)(void))v0[1];
    return v15();
  }
  else
  {
    static FamilyLogger.osUpdateActivity.getter();
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.debug.getter();
    BOOL v10 = os_log_type_enabled(v8, v9);
    uint64_t v11 = v0[10];
    uint64_t v13 = v0[7];
    uint64_t v12 = v0[8];
    if (v10)
    {
      uint64_t v19 = v0[10];
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136315138;
      v0[2] = sub_100029810(0xD000000000000011, 0x80000001000418A0, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "FAOSUpdatedActivity %s - executing activityBlock", v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v19, v13);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    }
    unint64_t v21 = (uint64_t (*)(void))(v0[5] + *(int *)v0[5]);
    uint64_t v17 = (void *)swift_task_alloc();
    v0[11] = v17;
    void *v17 = v0;
    v17[1] = sub_100032608;
    return v21();
  }
}

uint64_t sub_100032608()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    BOOL v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return _swift_task_switch(sub_100032748, 0, 0);
  }
}

uint64_t sub_100032748()
{
  XPCActivity.done()();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000327BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for TaskPriority();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_100033854(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_10003293C()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC13familycircled28HeartbeatXPCActivityProvider_criteria;
  uint64_t v2 = type metadata accessor for XPCActivity.Criteria();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_1000329E4()
{
  return type metadata accessor for HeartbeatXPCActivityProvider();
}

uint64_t type metadata accessor for HeartbeatXPCActivityProvider()
{
  uint64_t result = qword_10005ED28;
  if (!qword_10005ED28) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100032A38()
{
  uint64_t result = type metadata accessor for XPCActivity.Criteria();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100032ADC()
{
  uint64_t result = type metadata accessor for XPCActivity.Criteria();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100032B7C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000334D4(&OBJC_IVAR____TtC13familycircled28HeartbeatXPCActivityProvider_criteria, a1);
}

uint64_t sub_100032B88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100033560(a1, a2, a3, &OBJC_IVAR____TtC13familycircled28HeartbeatXPCActivityProvider_criteria);
}

uint64_t (*sub_100032B94())()
{
  return j__swift_endAccess;
}

const char *sub_100032BF4()
{
  return "com.apple.family.heartbeat";
}

uint64_t (*sub_100032C08())(void *a1)
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = sub_100033710;
  *(void *)(v4 + 24) = v3;
  swift_retain();
  return sub_100033718;
}

uint64_t (*sub_100032C9C())(uint64_t a1)
{
  uint64_t v1 = *v0;
  uint64_t v3 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v4 = (void *)swift_allocObject();
  v4[2] = *(void *)(v1 + 80);
  v4[3] = *(void *)(v1 + 88);
  void v4[4] = v3;
  v4[5] = v2;
  swift_retain();
  return sub_100033DFC;
}

uint64_t sub_100032D40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *(void *)(a4 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(a1);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100006CB4(&qword_10005E7B8);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, a4);
  unint64_t v17 = (*(unsigned __int8 *)(v10 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v18 = (char *)swift_allocObject();
  *((void *)v18 + 2) = 0;
  *((void *)v18 + 3) = 0;
  *((void *)v18 + 4) = a4;
  *((void *)v18 + 5) = a5;
  *((void *)v18 + 6) = a2;
  *((void *)v18 + 7) = a3;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v18[v17], v12, a4);
  swift_retain();
  sub_1000327BC((uint64_t)v15, (uint64_t)&unk_10005EE80, (uint64_t)v18);
  return swift_release();
}

uint64_t sub_100032F20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a7;
  v8[7] = a8;
  void v8[4] = a5;
  v8[5] = a6;
  v8[3] = a4;
  uint64_t v9 = type metadata accessor for Logger();
  v8[8] = v9;
  v8[9] = *(void *)(v9 - 8);
  v8[10] = swift_task_alloc();
  return _swift_task_switch(sub_100032FE8, 0, 0);
}

uint64_t sub_100032FE8()
{
  uint64_t v14 = v0;
  static FamilyLogger.osUpdateActivity.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v4 = v0[9];
    uint64_t v3 = v0[10];
    uint64_t v5 = v0[8];
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    v0[2] = sub_100029810(0xD000000000000011, 0x80000001000418A0, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "FAOSUpdatedActivity %s - executing activityBlock", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    uint64_t v8 = v0[9];
    uint64_t v7 = v0[10];
    uint64_t v9 = v0[8];

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  }
  uint64_t v12 = (uint64_t (*)(void))(v0[3] + *(int *)v0[3]);
  uint64_t v10 = (void *)swift_task_alloc();
  v0[11] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_100033220;
  return v12();
}

uint64_t sub_100033220()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return _swift_task_switch(sub_10003336C, 0, 0);
  }
}

uint64_t sub_10003336C()
{
  dispatch thunk of SystemBackgroundTaskProtocol.setTaskCompleted()();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000333E0()
{
  swift_release();
  uint64_t v1 = v0 + qword_10005FD78;
  uint64_t v2 = type metadata accessor for XPCActivity.Criteria();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_10003344C()
{
  sub_1000333E0();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t type metadata accessor for HeartbeatBackgroundTaskProvider()
{
  return sub_10003479C();
}

uint64_t sub_1000334BC(uint64_t a1, uint64_t a2)
{
  return *(void *)(*(void *)(a2 + 88) + 8);
}

uint64_t sub_1000334C8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000334D4(&qword_10005FD78, a1);
}

uint64_t sub_1000334D4@<X0>(void *a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *a1;
  swift_beginAccess();
  uint64_t v5 = type metadata accessor for XPCActivity.Criteria();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_100033554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100033560(a1, a2, a3, &qword_10005FD78);
}

uint64_t sub_100033560(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = v4 + *a4;
  swift_beginAccess();
  uint64_t v7 = type metadata accessor for XPCActivity.Criteria();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 40))(v6, a1, v7);
  return swift_endAccess();
}

uint64_t (*sub_1000335E8())()
{
  return j_j__swift_endAccess;
}

const char *sub_100033644()
{
  return "com.apple.family.heartbeat.backgroundTask";
}

uint64_t (*sub_100033658())(uint64_t a1)
{
  return sub_100033DFC;
}

void *sub_100033684()
{
  return &protocol witness table for XPCActivity;
}

uint64_t sub_100033690()
{
  return sub_100034710(&qword_10005EE60, (void (*)(uint64_t))type metadata accessor for HeartbeatXPCActivityProvider);
}

uint64_t sub_1000336D8()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100033710(uint64_t a1)
{
  return sub_100031F3C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100033718(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_100033744()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10003378C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_100024038;
  return sub_100032170(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_100033854(uint64_t a1)
{
  uint64_t v2 = sub_100006CB4(&qword_10005E7B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000338B4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_1000243FC;
  return v6();
}

uint64_t sub_100033980(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1000243FC;
  return v7();
}

uint64_t sub_100033A4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100033854(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100033BF0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100033CCC;
  return v6(a1);
}

uint64_t sub_100033CCC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100033DC4()
{
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100033DFC(uint64_t a1)
{
  return sub_100032D40(a1, v1[4], v1[5], v1[2], v1[3]);
}

uint64_t sub_100033E08()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100033ED4(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = (uint64_t)v1
      + ((*(unsigned __int8 *)(*(void *)(v4 - 8) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_1000243FC;
  return sub_100032F20(a1, v6, v7, v8, v9, v10, v4, v5);
}

uint64_t sub_100033FE4()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100034024()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_1000243FC;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_10005EE88 + dword_10005EE88);
  return v5(v2, v3);
}

uint64_t sub_1000340D8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100024038;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10005EEA0 + dword_10005EEA0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1000341A4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000243FC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10005EEA8 + dword_10005EEA8);
  return v6(a1, v4);
}

uint64_t sub_10003425C()
{
  swift_unknownObjectWeakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100034294()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_1000243FC;
  v2[5] = v0;
  return _swift_task_switch(sub_10003113C, 0, 0);
}

uint64_t sub_10003433C()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_1000243FC;
  v2[5] = v0;
  return _swift_task_switch(sub_100030798, 0, 0);
}

uint64_t sub_1000343E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v14[0] = a2;
  uint64_t v17 = a1;
  uint64_t v16 = type metadata accessor for XPCActivity.Criteria.Options();
  v14[1] = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v5 = type metadata accessor for XPCActivity.Priority();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for XPCActivity.Criteria();
  uint64_t v9 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v3 + 16) = v14[0];
  *(void *)(v3 + 24) = a3;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for XPCActivity.Priority.maintenance(_:), v5);
  sub_100006CB4(&qword_10005EF00);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1000433D0;
  swift_retain();
  static XPCActivity.Criteria.Options.requiresNetwork.getter();
  static XPCActivity.Criteria.Options.allowBattery.getter();
  uint64_t v18 = v12;
  sub_100034710(&qword_10005EF08, (void (*)(uint64_t))&type metadata accessor for XPCActivity.Criteria.Options);
  sub_100006CB4(&qword_10005EF10);
  sub_100034758(&qword_10005EF18, &qword_10005EF10);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  XPCActivity.Criteria.init(priority:repeating:delay:gracePeriod:interval:options:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v3 + qword_10005FD78, v11, v15);
  return v3;
}

uint64_t sub_100034710(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100034758(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100021730(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10003479C()
{
  return swift_getGenericMetadata();
}

void sub_1000347E0(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 description];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to fetch family circle with error: %@, Returning cached info.", (uint8_t *)&v4, 0xCu);
}

void sub_100034878(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing basic auth header, bailing.", v1, 2u);
}

void sub_1000348BC(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: FetchFamilyCircleRequest  enableTelemetry=YES ", (uint8_t *)&v2, 0xCu);
}

void sub_100034934(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "store front is %@.", (uint8_t *)&v2, 0xCu);
}

void sub_1000349AC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "store front is nil!!! setting unknown code %@.", (uint8_t *)&v2, 0xCu);
}

void sub_100034A24(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "store front is nil!!! default to deviceCountryCode %@.", (uint8_t *)&v3, 0xCu);
}

void sub_100034AA0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Expected Preset is nil", v1, 2u);
}

void sub_100034AE4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FAActivityManager OS update activity completed", v1, 2u);
}

void sub_100034B28(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to write cache to %@: %@.", (uint8_t *)&v3, 0x16u);
}

void sub_100034BB0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100034C20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100034C90(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100034CFC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "unable to find cache to invalidate.", v1, 2u);
}

void sub_100034D40(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "DSID == nil", v1, 2u);
}

void sub_100034D84(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100034DF0(void *a1, NSObject *a2)
{
  int v3 = [a1 description];
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to fetch family followup with error: %@", (uint8_t *)&v4, 0xCu);
}

void sub_100034E88(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "FAHeartbeatActivity failed to checkIn: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100034F00(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Flag type '%@' not recognized", (uint8_t *)&v3, 0xCu);
}

void sub_100034F7C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not convert push message body to JSON. Error: %@. Body: %@", (uint8_t *)&v3, 0x16u);
}

void sub_100035004(uint64_t a1, void *a2, NSObject *a3)
{
  __int16 v5 = [a2 description];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to fetch valid APS environment (%@) from server with error: %@, falling back to Prod.", (uint8_t *)&v6, 0x16u);
}

void sub_1000350B8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid message received. Ignoring.", v1, 2u);
}

void sub_1000350FC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
}

uint64_t sub_100035174()
{
  uint64_t v0 = abort_report_np();
  return sub_10003519C(v0);
}

uint64_t sub_10003519C()
{
  uint64_t v0 = abort_report_np();
  return sub_1000351C4(v0);
}

void sub_1000351C4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Push missing some required info.", v1, 2u);
}

void sub_100035208()
{
  sub_1000107D4();
  sub_1000107EC((void *)&_mh_execute_header, v0, v1, "Push received for user (dsid %@, altDSID %@) but there is no matching account on the device.");
}

void sub_100035278()
{
  sub_1000107D4();
  sub_1000107EC((void *)&_mh_execute_header, v0, v1, "Push received for user (dsid %@, altDSID %@) is logged in as non-primary account.");
}

void sub_1000352E8(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Found contact image.", v1, 2u);
}

void sub_10003532C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to fetch image from cache error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000353A4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No DSID present, no family member to match", v1, 2u);
}

void sub_1000353E8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  __int16 v5 = [*(id *)(a1 + 40) dsid];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to fetch image for member: %@, error: %@", (uint8_t *)&v6, 0x16u);
}

void sub_10003549C()
{
}

void sub_1000354C4()
{
  sub_100013568();
  sub_10000C9B8((void *)&_mh_execute_header, v0, v1, "Call to fetch URL for circle cache provided error: %@", v2, v3, v4, v5, v6);
}

void sub_10003552C()
{
  sub_100013534();
  sub_10001354C((void *)&_mh_execute_header, v0, v1, "END [%lld] %fs:LoadFamilyCache ", v2, v3, v4, v5, v6);
}

void sub_100035594()
{
  sub_100013568();
  sub_10000C9B8((void *)&_mh_execute_header, v0, v1, "Error parsing family circle cache: %@", v2, v3, v4, v5, v6);
}

void sub_1000355FC()
{
  sub_100013568();
  sub_10000C9B8((void *)&_mh_execute_header, v0, v1, "Error fetching family circle cache: %@", v2, v3, v4, v5, v6);
}

void sub_100035664()
{
  sub_100013568();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: LoadFamilyCache ", v1, 0xCu);
}

void sub_1000356D8(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[FamilyCircleServiceDelegate updateFamilyMemberFlagWithDSID:ephemeralAuthResults:flag:enabled:replyBlock:]_block_invoke";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s ephemeralAuthResults is nil using default signer.", (uint8_t *)&v1, 0xCu);
}

void sub_10003575C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[FamilyCircleServiceDelegate updateFamilyMemberFlagWithDSID:ephemeralAuthResults:flag:enabled:replyBlock:]_block_invoke";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s using ephemeralAuth signer.", (uint8_t *)&v1, 0xCu);
}

void sub_1000357E0(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 description];
  sub_100013568();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error while cleaning up pending CFUs: %@", v4, 0xCu);
}

void sub_100035874()
{
  sub_100019858();
  sub_10001983C((void *)&_mh_execute_header, v0, v1, "cleanup pending CFUs", v2, v3, v4, v5, v6);
}

void sub_1000358A8()
{
  sub_100019858();
  sub_10001983C((void *)&_mh_execute_header, v0, v1, "cleanup cached family count.", v2, v3, v4, v5, v6);
}

void sub_1000358DC()
{
  sub_100019858();
  sub_10001983C((void *)&_mh_execute_header, v0, v1, "Running heartbeat operation.", v2, v3, v4, v5, v6);
}

void sub_100035910(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 debugDescription];
  sub_100013568();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Failed to complete heartbeat operation with error: %@", v4, 0xCu);
}

void sub_1000359A4()
{
  sub_100019858();
  sub_10001983C((void *)&_mh_execute_header, v0, v1, "Heartbeat operation completed successfully.", v2, v3, v4, v5, v6);
}

void sub_1000359D8()
{
  sub_100013568();
  sub_10000C9B8((void *)&_mh_execute_header, v0, v1, "Error fetching current Screen Time configuration for user %{public}@", v2, v3, v4, v5, v6);
}

void sub_100035A40(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a2 screenTimeState]);
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Error updating Screen Time setup configuration %{public}@ currentConfigurationState:%{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_100035B0C()
{
  sub_100013568();
  sub_10000C9B8((void *)&_mh_execute_header, v0, v1, "Error applying updated Screen Time configuration %{public}@", v2, v3, v4, v5, v6);
}

void sub_100035B74(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100035BE4()
{
  sub_100013568();
  sub_10000C9B8((void *)&_mh_execute_header, v0, v1, "Error applying Screen Time introduction model %{public}@", v2, v3, v4, v5, v6);
}

uint64_t sub_100035C4C()
{
  uint64_t v0 = abort_report_np();
  return sub_100035C74(v0);
}

uint64_t sub_100035C74()
{
  uint64_t v0 = abort_report_np();
  return sub_100035C9C(v0);
}

void sub_100035C9C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Call to fetch URL for photos cache provided error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100035D14(uint64_t a1, NSObject *a2, double a3)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "END [%lld] %fs:LoadFamilyPhotoCache ", (uint8_t *)&v3, 0x16u);
}

void sub_100035D98(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: LoadFamilyPhotoCache ", (uint8_t *)&v2, 0xCu);
}

void sub_100035E10(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [*(id *)(a1 + 40) altDSID];
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error updating photo cache for member %@", (uint8_t *)&v4, 0xCu);
}

void sub_100035EAC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Call to fetch URL for presets cache provided error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100035F24(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error updating presets cache for url %@", (uint8_t *)&v3, 0xCu);
}

void sub_100035FA0(void *a1, NSObject *a2)
{
  int v3 = [a1 description];
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to fetch family push details with error: %@", (uint8_t *)&v4, 0xCu);
}

void sub_100036038(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Device was not unlocked since boot.", v1, 2u);
}

void sub_10003607C(void *a1, NSObject *a2)
{
  int v3 = [a1 description];
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to parse response data with error: %@", (uint8_t *)&v4, 0xCu);
}

void sub_100036114(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "FAPushDetailResponse responseData is nil", v1, 2u);
}

void sub_100036158(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Push detail response is missing title and message to be displayed in notification.", v1, 2u);
}

void sub_10003619C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "We've been asked not to show the notification. Bailing.", v1, 2u);
}

void sub_1000361E0(void *a1, NSObject *a2)
{
  int v3 = [a1 localizedDescription];
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error fetching family circle from server upon family change push %@", (uint8_t *)&v4, 0xCu);
}

void sub_100036278(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@ deallocated", (uint8_t *)&v2, 0xCu);
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t Measurement.init(value:unit:)()
{
  return Measurement.init(value:unit:)();
}

uint64_t Measurement.value.getter()
{
  return Measurement.value.getter();
}

uint64_t Measurement<>.converted(to:)()
{
  return Measurement<>.converted(to:)();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.init(contentsOf:options:)()
{
  return Data.init(contentsOf:options:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Data.write(to:options:)()
{
  return Data.write(to:options:)();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return Date.addingTimeInterval(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t static FamilyFeatureFlags.enabled(_:)()
{
  return static FamilyFeatureFlags.enabled(_:)();
}

uint64_t type metadata accessor for FamilyFeatureFlags()
{
  return type metadata accessor for FamilyFeatureFlags();
}

uint64_t static FamilyLogger.rateLimiter.getter()
{
  return static FamilyLogger.rateLimiter.getter();
}

uint64_t static FamilyLogger.osUpdateActivity.getter()
{
  return static FamilyLogger.osUpdateActivity.getter();
}

uint64_t static FamilyLogger.common.getter()
{
  return static FamilyLogger.common.getter();
}

uint64_t static FamilyLogger.daemon.getter()
{
  return static FamilyLogger.daemon.getter();
}

Swift::Bool __swiftcall XPCActivity.shouldDefer()()
{
  return XPCActivity.shouldDefer()();
}

Swift::Bool __swiftcall XPCActivity.done()()
{
  return XPCActivity.done()();
}

uint64_t static XPCActivity.Criteria.Options.allowBattery.getter()
{
  return static XPCActivity.Criteria.Options.allowBattery.getter();
}

uint64_t static XPCActivity.Criteria.Options.requiresNetwork.getter()
{
  return static XPCActivity.Criteria.Options.requiresNetwork.getter();
}

uint64_t type metadata accessor for XPCActivity.Criteria.Options()
{
  return type metadata accessor for XPCActivity.Criteria.Options();
}

uint64_t XPCActivity.Criteria.init(priority:repeating:delay:gracePeriod:interval:options:)()
{
  return XPCActivity.Criteria.init(priority:repeating:delay:gracePeriod:interval:options:)();
}

uint64_t type metadata accessor for XPCActivity.Criteria()
{
  return type metadata accessor for XPCActivity.Criteria();
}

uint64_t type metadata accessor for XPCActivity.Priority()
{
  return type metadata accessor for XPCActivity.Priority();
}

uint64_t XPCActivityScheduler.init(taskProvider:)()
{
  return XPCActivityScheduler.init(taskProvider:)();
}

uint64_t dispatch thunk of BackgroundTaskProvider.criteria.setter()
{
  return dispatch thunk of BackgroundTaskProvider.criteria.setter();
}

uint64_t dispatch thunk of BackgroundTaskScheduler.unregister()()
{
  return dispatch thunk of BackgroundTaskScheduler.unregister()();
}

uint64_t dispatch thunk of BackgroundTaskScheduler.taskProvider.getter()
{
  return dispatch thunk of BackgroundTaskScheduler.taskProvider.getter();
}

uint64_t dispatch thunk of SystemBackgroundTaskProtocol.setTaskCompleted()()
{
  return dispatch thunk of SystemBackgroundTaskProtocol.setTaskCompleted()();
}

uint64_t SystemBackgroundTaskScheduler.init(taskProvider:underlyingScheduler:requestFactory:)()
{
  return SystemBackgroundTaskScheduler.init(taskProvider:underlyingScheduler:requestFactory:)();
}

uint64_t SystemBackgroundRequestFactory.init()()
{
  return SystemBackgroundRequestFactory.init()();
}

uint64_t type metadata accessor for SystemBackgroundRequestFactory()
{
  return type metadata accessor for SystemBackgroundRequestFactory();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.init<A>(reflecting:)()
{
  return String.init<A>(reflecting:)();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
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

uint64_t _FALogSystem()
{
  return __FALogSystem();
}

uint64_t _FASignpostCreate()
{
  return __FASignpostCreate();
}

uint64_t _FASignpostGetNanoseconds()
{
  return __FASignpostGetNanoseconds();
}

uint64_t _FASignpostLogSystem()
{
  return __FASignpostLogSystem();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

void dispatch_resume(dispatch_object_t object)
{
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

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_HTTPResponse(void *a1, const char *a2, ...)
{
  return _[a1 HTTPResponse];
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForDirectory:inDomain:appropriateForURL:create:error:");
}

id objc_msgSend_URLForEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForEndpoint:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend_XPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 XPCInterface];
}

id objc_msgSend__accountStore(void *a1, const char *a2, ...)
{
  return _[a1 _accountStore];
}

id objc_msgSend__addBodyToRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addBodyToRequest:");
}

id objc_msgSend__addHeadersToRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addHeadersToRequest:");
}

id objc_msgSend__BOOLeanValueOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_BOOLeanValueOfObject:");
}

id objc_msgSend__buildActivationURLWithResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildActivationURLWithResponse:");
}

id objc_msgSend__cacheDataWithFamilyCircle_serverTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cacheDataWithFamilyCircle:serverTag:");
}

id objc_msgSend__cacheDirectoryURLWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cacheDirectoryURLWithError:");
}

id objc_msgSend__cacheURL(void *a1, const char *a2, ...)
{
  return _[a1 _cacheURL];
}

id objc_msgSend__cacheURLWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cacheURLWithError:");
}

id objc_msgSend__callCompletionWithResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_callCompletionWithResponse:");
}

id objc_msgSend__checkAndDeferActivityIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkAndDeferActivityIfNeeded:");
}

id objc_msgSend__convertServerResponse_toFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertServerResponse:toFormat:");
}

id objc_msgSend__createCacheFile(void *a1, const char *a2, ...)
{
  return _[a1 _createCacheFile];
}

id objc_msgSend__currentPresets_expectedPreset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentPresets:expectedPreset:");
}

id objc_msgSend__deliverNotificationWithResponse_payload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deliverNotificationWithResponse:payload:");
}

id objc_msgSend__endpoint(void *a1, const char *a2, ...)
{
  return _[a1 _endpoint];
}

id objc_msgSend__faCircularImageDataWithDiameter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_faCircularImageDataWithDiameter:");
}

id objc_msgSend__familyGrandSlamSignerWithAccountStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_familyGrandSlamSignerWithAccountStore:");
}

id objc_msgSend__fetchCircleRequestWithCacheResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchCircleRequestWithCacheResponse:");
}

id objc_msgSend__fetchData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchData:");
}

id objc_msgSend__fetchFamilyCircleWithCachePolicy_signedInAccountShouldBeApprover_clientProcess_context_promptUserToResolveAuthenticatonFailure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchFamilyCircleWithCachePolicy:signedInAccountShouldBeApprover:clientProcess:context:promptUserToResolveAuthenticatonFailure:");
}

id objc_msgSend__flagKey(void *a1, const char *a2, ...)
{
  return _[a1 _flagKey];
}

id objc_msgSend__flagType(void *a1, const char *a2, ...)
{
  return _[a1 _flagType];
}

id objc_msgSend__followupIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 _followupIdentifiers];
}

id objc_msgSend__getParamsForInviteFromResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getParamsForInviteFromResponse:");
}

id objc_msgSend__grandSlamAccountForAccountStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_grandSlamAccountForAccountStore:");
}

id objc_msgSend__grandSlamSignerWithAccountStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_grandSlamSignerWithAccountStore:");
}

id objc_msgSend__isCacheDate_pastDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isCacheDate:pastDuration:");
}

id objc_msgSend__isCacheValid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isCacheValid:");
}

id objc_msgSend__isCapableOfRecomendingMembers(void *a1, const char *a2, ...)
{
  return _[a1 _isCapableOfRecomendingMembers];
}

id objc_msgSend__isFamilyCircleFresh_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isFamilyCircleFresh:");
}

id objc_msgSend__mediaAltDSID(void *a1, const char *a2, ...)
{
  return _[a1 _mediaAltDSID];
}

id objc_msgSend__monogramForContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_monogramForContact:");
}

id objc_msgSend__monogramWithFirstName_lastName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_monogramWithFirstName:lastName:");
}

id objc_msgSend__networkService(void *a1, const char *a2, ...)
{
  return _[a1 _networkService];
}

id objc_msgSend__onQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueue:");
}

id objc_msgSend__presetsWithCurrentConfiguration_expectedPreset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presetsWithCurrentConfiguration:expectedPreset:");
}

id objc_msgSend__primaryAccount(void *a1, const char *a2, ...)
{
  return _[a1 _primaryAccount];
}

id objc_msgSend__qosClassForOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_qosClassForOptions:");
}

id objc_msgSend__recommendedMembers(void *a1, const char *a2, ...)
{
  return _[a1 _recommendedMembers];
}

id objc_msgSend__refetchFamilyWithNetworkService_familyRefreshActivityScheduler_context_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_refetchFamilyWithNetworkService:familyRefreshActivityScheduler:context:completion:");
}

id objc_msgSend__renewCredentials(void *a1, const char *a2, ...)
{
  return _[a1 _renewCredentials];
}

id objc_msgSend__serverResponse(void *a1, const char *a2, ...)
{
  return _[a1 _serverResponse];
}

id objc_msgSend__setEnabledTopics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setEnabledTopics:");
}

id objc_msgSend__shouldFetchFromServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldFetchFromServer:");
}

id objc_msgSend__signedInAccountMatchesApproverRequirementsFromCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_signedInAccountMatchesApproverRequirementsFromCache:");
}

id objc_msgSend__turnOnScreentimeForDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_turnOnScreentimeForDSID:");
}

id objc_msgSend__userActionWithInviteStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_userActionWithInviteStatus:");
}

id objc_msgSend__username(void *a1, const char *a2, ...)
{
  return _[a1 _username];
}

id objc_msgSend_aa_addBasicAuthorizationHeaderWithAccount_preferUsingPassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:");
}

id objc_msgSend_aa_addLoggedInAppleIDHeaderWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_addLoggedInAppleIDHeaderWithAccount:");
}

id objc_msgSend_aa_appleAccountWithAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_appleAccountWithAltDSID:");
}

id objc_msgSend_aa_appleAccountWithPersonID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_appleAccountWithPersonID:");
}

id objc_msgSend_aa_grandSlamAccountForiCloudAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_grandSlamAccountForiCloudAccount:");
}

id objc_msgSend_aa_isAccountClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isAccountClass:");
}

id objc_msgSend_aa_personID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_personID");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_aa_setBodyWithParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_setBodyWithParameters:");
}

id objc_msgSend_abbreviation(void *a1, const char *a2, ...)
{
  return _[a1 abbreviation];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_accountSigner(void *a1, const char *a2, ...)
{
  return _[a1 accountSigner];
}

id objc_msgSend_activateWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateWithContext:");
}

id objc_msgSend_activeBundleIDs(void *a1, const char *a2, ...)
{
  return _[a1 activeBundleIDs];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addFresnoPayloadToRequest_additionalPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFresnoPayloadToRequest:additionalPayload:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addValue:forHTTPHeaderField:");
}

id objc_msgSend_age(void *a1, const char *a2, ...)
{
  return _[a1 age];
}

id objc_msgSend_aida_accountForiCloudAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aida_accountForiCloudAccount:");
}

id objc_msgSend_ak_addAnisetteHeaders(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ak_addAnisetteHeaders");
}

id objc_msgSend_ak_addClientInfoHeader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ak_addClientInfoHeader");
}

id objc_msgSend_ak_addDeviceUDIDHeader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ak_addDeviceUDIDHeader");
}

id objc_msgSend_ak_addInternalBuildHeader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ak_addInternalBuildHeader");
}

id objc_msgSend_all_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "all:");
}

id objc_msgSend_allHTTPHeaderFields(void *a1, const char *a2, ...)
{
  return _[a1 allHTTPHeaderFields];
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return _[a1 allHeaderFields];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allowedAppStoreRating(void *a1, const char *a2, ...)
{
  return _[a1 allowedAppStoreRating];
}

id objc_msgSend_allowedMovieRating(void *a1, const char *a2, ...)
{
  return _[a1 allowedMovieRating];
}

id objc_msgSend_allowedTVRating(void *a1, const char *a2, ...)
{
  return _[a1 allowedTVRating];
}

id objc_msgSend_altDSID(void *a1, const char *a2, ...)
{
  return _[a1 altDSID];
}

id objc_msgSend_ams_activeiTunesAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_activeiTunesAccount");
}

id objc_msgSend_ams_altDSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_altDSID");
}

id objc_msgSend_ams_sharedAccountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sharedAccountStore");
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return _[a1 anonymousListener];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appleAccount(void *a1, const char *a2, ...)
{
  return _[a1 appleAccount];
}

id objc_msgSend_applyIntroductionModel_forDSID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyIntroductionModel:forDSID:completionHandler:");
}

id objc_msgSend_applyUpdatedConfiguration_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyUpdatedConfiguration:error:");
}

id objc_msgSend_apsEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 apsEnvironment];
}

id objc_msgSend_areMusicProfilesAllowed(void *a1, const char *a2, ...)
{
  return _[a1 areMusicProfilesAllowed];
}

id objc_msgSend_areMusicVideosAllowed(void *a1, const char *a2, ...)
{
  return _[a1 areMusicVideosAllowed];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_availablePresets(void *a1, const char *a2, ...)
{
  return _[a1 availablePresets];
}

id objc_msgSend_bagForProfile_profileVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bagForProfile:profileVersion:");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return _[a1 body];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_broadcastFamilyChangedNotification(void *a1, const char *a2, ...)
{
  return _[a1 broadcastFamilyChangedNotification];
}

id objc_msgSend_broadcastServicesChangedNotification(void *a1, const char *a2, ...)
{
  return _[a1 broadcastServicesChangedNotification];
}

id objc_msgSend_buildNotificationWithResponse_payload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildNotificationWithResponse:payload:");
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return _[a1 cache];
}

id objc_msgSend_cacheDate(void *a1, const char *a2, ...)
{
  return _[a1 cacheDate];
}

id objc_msgSend_cachePolicy(void *a1, const char *a2, ...)
{
  return _[a1 cachePolicy];
}

id objc_msgSend_cachePolicyString(void *a1, const char *a2, ...)
{
  return _[a1 cachePolicyString];
}

id objc_msgSend_cacheQueue(void *a1, const char *a2, ...)
{
  return _[a1 cacheQueue];
}

id objc_msgSend_cacheScreenTimeSettingsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheScreenTimeSettingsObject:");
}

id objc_msgSend_cachedFamilyCircle(void *a1, const char *a2, ...)
{
  return _[a1 cachedFamilyCircle];
}

id objc_msgSend_cancelChildTransferWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelChildTransferWithCompletionHandler:");
}

id objc_msgSend_cancelInvitation(void *a1, const char *a2, ...)
{
  return _[a1 cancelInvitation];
}

id objc_msgSend_catch(void *a1, const char *a2, ...)
{
  return _[a1 catch];
}

id objc_msgSend_catchOnQueue(void *a1, const char *a2, ...)
{
  return _[a1 catchOnQueue];
}

id objc_msgSend_checkResourceIsReachableAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkResourceIsReachableAndReturnError:");
}

id objc_msgSend_checkin(void *a1, const char *a2, ...)
{
  return _[a1 checkin];
}

id objc_msgSend_checkinWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkinWithCompletionHandler:");
}

id objc_msgSend_checkinXPCActivities(void *a1, const char *a2, ...)
{
  return _[a1 checkinXPCActivities];
}

id objc_msgSend_childFirstName(void *a1, const char *a2, ...)
{
  return _[a1 childFirstName];
}

id objc_msgSend_childLastName(void *a1, const char *a2, ...)
{
  return _[a1 childLastName];
}

id objc_msgSend_circularImageData_withDiameter_crop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "circularImageData:withDiameter:crop:");
}

id objc_msgSend_clearPendingFollowUpItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearPendingFollowUpItems:");
}

id objc_msgSend_clientProcess(void *a1, const char *a2, ...)
{
  return _[a1 clientProcess];
}

id objc_msgSend_coalesceQueue(void *a1, const char *a2, ...)
{
  return _[a1 coalesceQueue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_componentsWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsWithString:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configurationWithUpdatedScreenTimeState_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithUpdatedScreenTimeState:error:");
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return _[a1 contact];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_cropRect(void *a1, const char *a2, ...)
{
  return _[a1 cropRect];
}

id objc_msgSend_currentConfigurationForDSID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentConfigurationForDSID:completion:");
}

id objc_msgSend_currentConfigurationForUser_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentConfigurationForUser:error:");
}

id objc_msgSend_currentConfigurationForUserID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentConfigurationForUserID:completionHandler:");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_dataRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dataRepresentation];
}

id objc_msgSend_dataTaskWithRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskWithRequest:completion:");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_dataWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithRequest:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _[a1 defaultStore];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_deleteFamily(void *a1, const char *a2, ...)
{
  return _[a1 deleteFamily];
}

id objc_msgSend_deliverNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deliverNotification:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_deviceInfo(void *a1, const char *a2, ...)
{
  return _[a1 deviceInfo];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_dsid(void *a1, const char *a2, ...)
{
  return _[a1 dsid];
}

id objc_msgSend_eligibilityRequirements(void *a1, const char *a2, ...)
{
  return _[a1 eligibilityRequirements];
}

id objc_msgSend_email(void *a1, const char *a2, ...)
{
  return _[a1 email];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return _[a1 endpoint];
}

id objc_msgSend_ensureAccount(void *a1, const char *a2, ...)
{
  return _[a1 ensureAccount];
}

id objc_msgSend_ensureDeviceUnlockedSinceBoot(void *a1, const char *a2, ...)
{
  return _[a1 ensureDeviceUnlockedSinceBoot];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorWithCachedFamilyCircle_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithCachedFamilyCircle:underlyingError:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_event(void *a1, const char *a2, ...)
{
  return _[a1 event];
}

id objc_msgSend_expectedMediaAltDSID(void *a1, const char *a2, ...)
{
  return _[a1 expectedMediaAltDSID];
}

id objc_msgSend_expiration(void *a1, const char *a2, ...)
{
  return _[a1 expiration];
}

id objc_msgSend_fa_familyErrorWithCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fa_familyErrorWithCode:");
}

id objc_msgSend_fa_firstObjectMatching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fa_firstObjectMatching:");
}

id objc_msgSend_fa_map_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fa_map:");
}

id objc_msgSend_fa_queryItemsDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fa_queryItemsDictionary");
}

id objc_msgSend_familyChecklistRankingConfigWith_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "familyChecklistRankingConfigWith:completionHandler:");
}

id objc_msgSend_familyCircle(void *a1, const char *a2, ...)
{
  return _[a1 familyCircle];
}

id objc_msgSend_familyCircleIfFresh(void *a1, const char *a2, ...)
{
  return _[a1 familyCircleIfFresh];
}

id objc_msgSend_familyCircleProvider(void *a1, const char *a2, ...)
{
  return _[a1 familyCircleProvider];
}

id objc_msgSend_familyCircleValidatingAgeWithDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "familyCircleValidatingAgeWithDate:");
}

id objc_msgSend_familyCircleWithServerResponse_responseHeaders_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "familyCircleWithServerResponse:responseHeaders:completion:");
}

id objc_msgSend_familyID(void *a1, const char *a2, ...)
{
  return _[a1 familyID];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return _[a1 familyName];
}

id objc_msgSend_familyNotifier(void *a1, const char *a2, ...)
{
  return _[a1 familyNotifier];
}

id objc_msgSend_familyRefreshActivityScheduler(void *a1, const char *a2, ...)
{
  return _[a1 familyRefreshActivityScheduler];
}

id objc_msgSend_familyRefreshTriggered(void *a1, const char *a2, ...)
{
  return _[a1 familyRefreshTriggered];
}

id objc_msgSend_fetchAAURLConfigurationWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAAURLConfigurationWithCompletion:");
}

id objc_msgSend_fetchCachedPhotoForFamilyMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCachedPhotoForFamilyMember:");
}

id objc_msgSend_fetchCircleFromServerWithCacheResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCircleFromServerWithCacheResponse:");
}

id objc_msgSend_fetchCurrentStoreFront(void *a1, const char *a2, ...)
{
  return _[a1 fetchCurrentStoreFront];
}

id objc_msgSend_fetchEligibilityForPropertyName_bundleID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchEligibilityForPropertyName:bundleID:completion:");
}

id objc_msgSend_fetchFamilyCircle(void *a1, const char *a2, ...)
{
  return _[a1 fetchFamilyCircle];
}

id objc_msgSend_fetchFamilyCircleWithCachePolicy_signedInAccountShouldBeApprover_context_options_replyBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchFamilyCircleWithCachePolicy:signedInAccountShouldBeApprover:context:options:replyBlock:");
}

id objc_msgSend_fetchFamilyFactory(void *a1, const char *a2, ...)
{
  return _[a1 fetchFamilyFactory];
}

id objc_msgSend_fetchFamilyMemberSuggestions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchFamilyMemberSuggestions:");
}

id objc_msgSend_fetchFollowUps(void *a1, const char *a2, ...)
{
  return _[a1 fetchFollowUps];
}

id objc_msgSend_fetchHeartbeatData(void *a1, const char *a2, ...)
{
  return _[a1 fetchHeartbeatData];
}

id objc_msgSend_fetchPhoto(void *a1, const char *a2, ...)
{
  return _[a1 fetchPhoto];
}

id objc_msgSend_fetchRemotePhotoForFamilyMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRemotePhotoForFamilyMember:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return _[a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_fullname(void *a1, const char *a2, ...)
{
  return _[a1 fullname];
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getFamilyPushDetailsURL(void *a1, const char *a2, ...)
{
  return _[a1 getFamilyPushDetailsURL];
}

id objc_msgSend_getValue_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getValue:size:");
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return _[a1 givenName];
}

id objc_msgSend_gsAccount(void *a1, const char *a2, ...)
{
  return _[a1 gsAccount];
}

id objc_msgSend_handleAccountAddition_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAccountAddition:completion:");
}

id objc_msgSend_handleAccountDeletion_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAccountDeletion:completion:");
}

id objc_msgSend_handleDidReceivePushEventWithNetworkService_familyRefreshActivityScheduler_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDidReceivePushEventWithNetworkService:familyRefreshActivityScheduler:completion:");
}

id objc_msgSend_handleDidRemoveMemberWithNetworkService_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDidRemoveMemberWithNetworkService:completion:");
}

id objc_msgSend_handleDidUpdateMemberFlagWithNetworkService_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDidUpdateMemberFlagWithNetworkService:completion:");
}

id objc_msgSend_handleURLResponse_networkService_familyRefreshActivityScheduler_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleURLResponse:networkService:familyRefreshActivityScheduler:completion:");
}

id objc_msgSend_hasRecommendedMembers(void *a1, const char *a2, ...)
{
  return _[a1 hasRecommendedMembers];
}

id objc_msgSend_hashedDSID(void *a1, const char *a2, ...)
{
  return _[a1 hashedDSID];
}

id objc_msgSend_httpResponse(void *a1, const char *a2, ...)
{
  return _[a1 httpResponse];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_inFlightRequests(void *a1, const char *a2, ...)
{
  return _[a1 inFlightRequests];
}

id objc_msgSend_initWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:");
}

id objc_msgSend_initWithAccount_deviceInfo_urlProvider_urlSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:deviceInfo:urlProvider:urlSession:");
}

id objc_msgSend_initWithAccount_deviceInfo_urlProvider_urlSession_familyRefreshActivityScheduler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:deviceInfo:urlProvider:urlSession:familyRefreshActivityScheduler:");
}

id objc_msgSend_initWithAccountStore_grandSlamAccount_appTokenID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountStore:grandSlamAccount:appTokenID:");
}

id objc_msgSend_initWithAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAltDSID:");
}

id objc_msgSend_initWithAppleAccount_grandSlamAccount_accountStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppleAccount:grandSlamAccount:accountStore:");
}

id objc_msgSend_initWithAvailablePresets_expectedPreset_currentPreset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAvailablePresets:expectedPreset:currentPreset:");
}

id objc_msgSend_initWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBlock:");
}

id objc_msgSend_initWithCachedFamilyCircle_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCachedFamilyCircle:underlyingError:");
}

id objc_msgSend_initWithClientIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientIdentifier:");
}

id objc_msgSend_initWithDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDSID:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEnvironmentName:namedDelegatePort:queue:");
}

id objc_msgSend_initWithEphemeralAuthResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEphemeralAuthResults:");
}

id objc_msgSend_initWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithError:");
}

id objc_msgSend_initWithFamilyCircle_serverTag_cacheDate_maxAge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFamilyCircle:serverTag:cacheDate:maxAge:");
}

id objc_msgSend_initWithFamilyCircleFetchBlock_cacheLoadBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFamilyCircleFetchBlock:cacheLoadBlock:");
}

id objc_msgSend_initWithFamilyCircleProvider_fetchFromCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFamilyCircleProvider:fetchFromCache:");
}

id objc_msgSend_initWithFamilyCircleProvider_presetsProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFamilyCircleProvider:presetsProvider:");
}

id objc_msgSend_initWithHTTPResponse_body_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHTTPResponse:body:");
}

id objc_msgSend_initWithHTTPResponse_body_familyRefreshTriggered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHTTPResponse:body:familyRefreshTriggered:");
}

id objc_msgSend_initWithHeartbeatActivityHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHeartbeatActivityHandler:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentifier_machServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:machServiceName:");
}

id objc_msgSend_initWithLoadSuccess_error_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLoadSuccess:error:userInfo:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMessage:");
}

id objc_msgSend_initWithMessage_accountStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMessage:accountStore:");
}

id objc_msgSend_initWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:value:");
}

id objc_msgSend_initWithNetworkService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:");
}

id objc_msgSend_initWithNetworkService_accountSigner_memberDSID_flag_enabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:accountSigner:memberDSID:flag:enabled:");
}

id objc_msgSend_initWithNetworkService_cache_marqueeCacheHanlder_requestCoalescer_familyRefreshActivityScheduler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:cache:marqueeCacheHanlder:requestCoalescer:familyRefreshActivityScheduler:");
}

id objc_msgSend_initWithNetworkService_cache_marqueeCacheHanlder_requestCoalescer_familyRefreshActivityScheduler_rateLimiter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:cache:marqueeCacheHanlder:requestCoalescer:familyRefreshActivityScheduler:rateLimiter:");
}

id objc_msgSend_initWithNetworkService_cache_storeFrontProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:cache:storeFrontProvider:");
}

id objc_msgSend_initWithNetworkService_dsidOfMemberToRemove_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:dsidOfMemberToRemove:");
}

id objc_msgSend_initWithNetworkService_email_familyID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:email:familyID:");
}

id objc_msgSend_initWithNetworkService_grandSlamSigner_familyGrandSlamSigner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:grandSlamSigner:familyGrandSlamSigner:");
}

id objc_msgSend_initWithNetworkService_grandSlamSigner_familyGrandSlamSigner_email_isResend_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:grandSlamSigner:familyGrandSlamSigner:email:isResend:");
}

id objc_msgSend_initWithNetworkService_grandSlamSigner_familyGrandSlamSigner_memberDSID_flag_enabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:grandSlamSigner:familyGrandSlamSigner:memberDSID:flag:enabled:");
}

id objc_msgSend_initWithNetworkService_grandSlamSigner_familyGrandSlamSigner_memberDSID_flags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:grandSlamSigner:familyGrandSlamSigner:memberDSID:flags:");
}

id objc_msgSend_initWithNetworkService_inviteCode_inviteStatus_responseFormat_additionalRequestParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:inviteCode:inviteStatus:responseFormat:additionalRequestParameters:");
}

id objc_msgSend_initWithNetworkService_memberDSID_memberHashedDSID_size_localFallback_context_requestCoalescer_fetchFamilyFactory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:memberDSID:memberHashedDSID:size:localFallback:context:requestCoalescer:fetchFamilyFactory:");
}

id objc_msgSend_initWithNetworkService_pushToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:pushToken:");
}

id objc_msgSend_initWithNetworkService_storeFrontProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkService:storeFrontProvider:");
}

id objc_msgSend_initWithQueue_requirements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:requirements:");
}

id objc_msgSend_initWithQueueProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueueProvider:");
}

id objc_msgSend_initWithSTPresetsConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSTPresetsConfiguration:");
}

id objc_msgSend_initWithServerResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServerResponse:");
}

id objc_msgSend_initWithServiceName_viewControllerClassName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceName:viewControllerClassName:");
}

id objc_msgSend_initWithStream_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStream:delegate:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_initWithValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValue:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_introductionModel(void *a1, const char *a2, ...)
{
  return _[a1 introductionModel];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateFamilyPhotos(void *a1, const char *a2, ...)
{
  return _[a1 invalidateFamilyPhotos];
}

id objc_msgSend_inviteCode(void *a1, const char *a2, ...)
{
  return _[a1 inviteCode];
}

id objc_msgSend_inviteStatus(void *a1, const char *a2, ...)
{
  return _[a1 inviteStatus];
}

id objc_msgSend_isAllowedWithClientName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAllowedWithClientName:");
}

id objc_msgSend_isBooksAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isBooksAllowed];
}

id objc_msgSend_isDeletingAppsAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isDeletingAppsAllowed];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExplicitMediaAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isExplicitMediaAllowed];
}

id objc_msgSend_isMe(void *a1, const char *a2, ...)
{
  return _[a1 isMe];
}

id objc_msgSend_isParent(void *a1, const char *a2, ...)
{
  return _[a1 isParent];
}

id objc_msgSend_isSiriExplicitAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isSiriExplicitAllowed];
}

id objc_msgSend_isSiriWebSearchAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isSiriWebSearchAllowed];
}

id objc_msgSend_isSuccess(void *a1, const char *a2, ...)
{
  return _[a1 isSuccess];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isValidEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidEnvironment:");
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return _[a1 lastName];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_launchURLFromServer(void *a1, const char *a2, ...)
{
  return _[a1 launchURLFromServer];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return _[a1 load];
}

id objc_msgSend_load_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "load:");
}

id objc_msgSend_loadForURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadForURL:");
}

id objc_msgSend_loadScreenTimeSettingsObject(void *a1, const char *a2, ...)
{
  return _[a1 loadScreenTimeSettingsObject];
}

id objc_msgSend_loadWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadWithError:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_marqueeUpdateHandler(void *a1, const char *a2, ...)
{
  return _[a1 marqueeUpdateHandler];
}

id objc_msgSend_maxAge(void *a1, const char *a2, ...)
{
  return _[a1 maxAge];
}

id objc_msgSend_memberForAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "memberForAltDSID:");
}

id objc_msgSend_members(void *a1, const char *a2, ...)
{
  return _[a1 members];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _[a1 message];
}

id objc_msgSend_minAge(void *a1, const char *a2, ...)
{
  return _[a1 minAge];
}

id objc_msgSend_monogramForContact_diameter_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monogramForContact:diameter:scale:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_networkService(void *a1, const char *a2, ...)
{
  return _[a1 networkService];
}

id objc_msgSend_newHandleWithDefinition_configurationContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newHandleWithDefinition:configurationContext:");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectWithData:");
}

id objc_msgSend_onComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onComplete:");
}

id objc_msgSend_onComplete_onQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onComplete:onQueue:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:configuration:completionHandler:");
}

id objc_msgSend_organizerEmail(void *a1, const char *a2, ...)
{
  return _[a1 organizerEmail];
}

id objc_msgSend_organizerFirstName(void *a1, const char *a2, ...)
{
  return _[a1 organizerFirstName];
}

id objc_msgSend_organizerLastName(void *a1, const char *a2, ...)
{
  return _[a1 organizerLastName];
}

id objc_msgSend_osUpdatedActivity(void *a1, const char *a2, ...)
{
  return _[a1 osUpdatedActivity];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return _[a1 payload];
}

id objc_msgSend_pendingFollowUpItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingFollowUpItems:");
}

id objc_msgSend_pendingInvitesOnly(void *a1, const char *a2, ...)
{
  return _[a1 pendingInvitesOnly];
}

id objc_msgSend_pendingMembers(void *a1, const char *a2, ...)
{
  return _[a1 pendingMembers];
}

id objc_msgSend_performBlockForKey_force_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockForKey:force:block:");
}

id objc_msgSend_performHeartbeatCheckinWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performHeartbeatCheckinWithCompletion:");
}

id objc_msgSend_performRequestWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performRequestWithHandler:");
}

id objc_msgSend_performRequestWithSession_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performRequestWithSession:withHandler:");
}

id objc_msgSend_photoData(void *a1, const char *a2, ...)
{
  return _[a1 photoData];
}

id objc_msgSend_plistWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "plistWithRequest:");
}

id objc_msgSend_plistWithResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "plistWithResponse:");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 preferredLanguages];
}

id objc_msgSend_presentRemoteUserInterfaceWithOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentRemoteUserInterfaceWithOptions:completion:");
}

id objc_msgSend_presentationCompletion(void *a1, const char *a2, ...)
{
  return _[a1 presentationCompletion];
}

id objc_msgSend_presetsForMemberWithAltDSID_age_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presetsForMemberWithAltDSID:age:");
}

id objc_msgSend_presetsProvider(void *a1, const char *a2, ...)
{
  return _[a1 presetsProvider];
}

id objc_msgSend_process_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "process:");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _[a1 processName];
}

id objc_msgSend_promptUserToResolveAuthenticatonFailure(void *a1, const char *a2, ...)
{
  return _[a1 promptUserToResolveAuthenticatonFailure];
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_pushTokenString(void *a1, const char *a2, ...)
{
  return _[a1 pushTokenString];
}

id objc_msgSend_pushTopic(void *a1, const char *a2, ...)
{
  return _[a1 pushTopic];
}

id objc_msgSend_queueProvider(void *a1, const char *a2, ...)
{
  return _[a1 queueProvider];
}

id objc_msgSend_rateLimiter(void *a1, const char *a2, ...)
{
  return _[a1 rateLimiter];
}

id objc_msgSend_recordCallWithClientName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordCallWithClientName:");
}

id objc_msgSend_registerToPDS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerToPDS:");
}

id objc_msgSend_registerToken(void *a1, const char *a2, ...)
{
  return _[a1 registerToken];
}

id objc_msgSend_removeFamilyInvites_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFamilyInvites:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeMember(void *a1, const char *a2, ...)
{
  return _[a1 removeMember];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeRegistrationFromPDS(void *a1, const char *a2, ...)
{
  return _[a1 removeRegistrationFromPDS];
}

id objc_msgSend_removingNonSecureCodingValues(void *a1, const char *a2, ...)
{
  return _[a1 removingNonSecureCodingValues];
}

id objc_msgSend_renewCredentialsForAccount_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewCredentialsForAccount:options:completion:");
}

id objc_msgSend_requestQueueWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestQueueWithOptions:");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithURL:");
}

id objc_msgSend_requirementsForPropertyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requirementsForPropertyName:");
}

id objc_msgSend_reschedule(void *a1, const char *a2, ...)
{
  return _[a1 reschedule];
}

id objc_msgSend_resendChildTransferWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resendChildTransferWithCompletionHandler:");
}

id objc_msgSend_responseDictionary(void *a1, const char *a2, ...)
{
  return _[a1 responseDictionary];
}

id objc_msgSend_responseFormat(void *a1, const char *a2, ...)
{
  return _[a1 responseFormat];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_runAAFamilyMemberPhotoRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runAAFamilyMemberPhotoRequest:withCompletionHandler:");
}

id objc_msgSend_runFetchFamilyCircleOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runFetchFamilyCircleOperation:");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scheduleWakeupIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 scheduleWakeupIfNeeded];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return _[a1 screenScale];
}

id objc_msgSend_screenTimeState(void *a1, const char *a2, ...)
{
  return _[a1 screenTimeState];
}

id objc_msgSend_serverEligibility(void *a1, const char *a2, ...)
{
  return _[a1 serverEligibility];
}

id objc_msgSend_serverRequest_toFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverRequest:toFormat:");
}

id objc_msgSend_serverTag(void *a1, const char *a2, ...)
{
  return _[a1 serverTag];
}

id objc_msgSend_setAcceptHeaderForRequest_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcceptHeaderForRequest:format:");
}

id objc_msgSend_setActivateActionURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivateActionURL:");
}

id objc_msgSend_setBackgroundType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundType:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCache:");
}

id objc_msgSend_setCachePolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachePolicy:");
}

id objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClass:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClientProcess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientProcess:");
}

id objc_msgSend_setContactType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContactType:");
}

id objc_msgSend_setContentTypeHeaderForRequest_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentTypeHeaderForRequest:format:");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setCustomHeaders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomHeaders:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEmailAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEmailAddress:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFamilyMemberDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFamilyMemberDSID:");
}

id objc_msgSend_setFamilyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFamilyName:");
}

id objc_msgSend_setFamilyRefreshActivityScheduler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFamilyRefreshActivityScheduler:");
}

id objc_msgSend_setForcePush_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForcePush:");
}

id objc_msgSend_setFullname_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFullname:");
}

id objc_msgSend_setGivenName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGivenName:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPBody:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setHeaderFieldKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeaderFieldKey:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setInformativeText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInformativeText:");
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteger:forKey:");
}

id objc_msgSend_setMonogramDiameter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMonogramDiameter:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPhoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhoneNumber:");
}

id objc_msgSend_setPresentationCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentationCompletion:");
}

id objc_msgSend_setPromptUserToResolveAuthenticatonFailure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPromptUserToResolveAuthenticatonFailure:");
}

id objc_msgSend_setPushPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPushPayload:");
}

id objc_msgSend_setPushTopic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPushTopic:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setShouldPersistWhenActivated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPersistWhenActivated:");
}

id objc_msgSend_setSignedInAccountShouldBeApprover_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignedInAccountShouldBeApprover:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURL:");
}

id objc_msgSend_setUseMonogramAsLastResort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseMonogramAsLastResort:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setXpcEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXpcEndpoint:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return _[a1 sharedSession];
}

id objc_msgSend_shouldForcePush(void *a1, const char *a2, ...)
{
  return _[a1 shouldForcePush];
}

id objc_msgSend_shouldProcess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldProcess:");
}

id objc_msgSend_showMessage(void *a1, const char *a2, ...)
{
  return _[a1 showMessage];
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return _[a1 shutdown];
}

id objc_msgSend_signURLRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signURLRequest:");
}

id objc_msgSend_signedInAccountShouldBeApprover(void *a1, const char *a2, ...)
{
  return _[a1 signedInAccountShouldBeApprover];
}

id objc_msgSend_signedRequestWithEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signedRequestWithEndpoint:");
}

id objc_msgSend_signedRequestWithEndpoint_method_headers_plistBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signedRequestWithEndpoint:method:headers:plistBody:");
}

id objc_msgSend_sources(void *a1, const char *a2, ...)
{
  return _[a1 sources];
}

id objc_msgSend_stPresetsClient(void *a1, const char *a2, ...)
{
  return _[a1 stPresetsClient];
}

id objc_msgSend_stPresetsConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 stPresetsConfiguration];
}

id objc_msgSend_standardPlistRequestWithEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardPlistRequestWithEndpoint:");
}

id objc_msgSend_standardPlistRequestWithEndpoint_method_plistBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardPlistRequestWithEndpoint:method:plistBody:");
}

id objc_msgSend_standardPlistRequestWithUrl_method_plistBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardPlistRequestWithUrl:method:plistBody:");
}

id objc_msgSend_standardRequestWithEndpoint_method_plistBody_requestFormat_responseFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardRequestWithEndpoint:method:plistBody:requestFormat:responseFormat:");
}

id objc_msgSend_standardRequestWithURL_method_body_requestFormat_responseFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardRequestWithURL:method:body:requestFormat:responseFormat:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _[a1 statusCode];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_storeFrontProvider(void *a1, const char *a2, ...)
{
  return _[a1 storeFrontProvider];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_synchronizeFollowupWithPayload_altDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeFollowupWithPayload:altDSID:");
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 systemTimeZone];
}

id objc_msgSend_then(void *a1, const char *a2, ...)
{
  return _[a1 then];
}

id objc_msgSend_thenOnQueue(void *a1, const char *a2, ...)
{
  return _[a1 thenOnQueue];
}

id objc_msgSend_thumbnailImageData(void *a1, const char *a2, ...)
{
  return _[a1 thumbnailImageData];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return _[a1 topic];
}

id objc_msgSend_underlyingError(void *a1, const char *a2, ...)
{
  return _[a1 underlyingError];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}

id objc_msgSend_unlockedSinceBoot(void *a1, const char *a2, ...)
{
  return _[a1 unlockedSinceBoot];
}

id objc_msgSend_unregister(void *a1, const char *a2, ...)
{
  return _[a1 unregister];
}

id objc_msgSend_updateInviteStatus(void *a1, const char *a2, ...)
{
  return _[a1 updateInviteStatus];
}

id objc_msgSend_updateMarqueeCache(void *a1, const char *a2, ...)
{
  return _[a1 updateMarqueeCache];
}

id objc_msgSend_updateMemberFlag(void *a1, const char *a2, ...)
{
  return _[a1 updateMemberFlag];
}

id objc_msgSend_updateMemberFlags(void *a1, const char *a2, ...)
{
  return _[a1 updateMemberFlags];
}

id objc_msgSend_updateUserDefaultsWithFamilyCircle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUserDefaultsWithFamilyCircle:");
}

id objc_msgSend_updateWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithData:");
}

id objc_msgSend_updateWithFamilyCircle_serverTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithFamilyCircle:serverTag:");
}

id objc_msgSend_updateWithPresets_requestURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithPresets:requestURL:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_urlByAddingParamsToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlByAddingParamsToURL:");
}

id objc_msgSend_urlConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 urlConfiguration];
}

id objc_msgSend_urlDestinationTo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlDestinationTo:error:");
}

id objc_msgSend_urlDestinationTo_params_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlDestinationTo:params:error:");
}

id objc_msgSend_urlForEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlForEndpoint:");
}

id objc_msgSend_urlProvider(void *a1, const char *a2, ...)
{
  return _[a1 urlProvider];
}

id objc_msgSend_urlRequest(void *a1, const char *a2, ...)
{
  return _[a1 urlRequest];
}

id objc_msgSend_urlSession(void *a1, const char *a2, ...)
{
  return _[a1 urlSession];
}

id objc_msgSend_useMonogramAsLastResort(void *a1, const char *a2, ...)
{
  return _[a1 useMonogramAsLastResort];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_valueWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCompletion:");
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return _[a1 values];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:options:error:");
}