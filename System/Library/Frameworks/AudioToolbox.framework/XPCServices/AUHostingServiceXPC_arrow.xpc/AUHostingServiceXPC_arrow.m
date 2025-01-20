void sub_100004E7C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_100004EEC()
{
}

id sub_100005020(uint64_t a1, void *a2)
{
  uint64_t v7 = kCFErrorDebugDescriptionKey;
  v8 = a2;
  id v3 = a2;
  v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v5 = +[NSError errorWithDomain:@"AUHSXPCSharedListenerErrorDomain" code:a1 userInfo:v4];

  return v5;
}

id sub_1000052EC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  if ([v7 length])
  {
    v10 = +[NSString stringWithFormat:@"'%@'", v7];
  }
  else
  {
    v10 = @"for whole-service management";
  }

  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ for listener %@; BEFORE ASSIGNING A BUG TO ANYONE ELSE, search backward for earlier logging regarding service/extension '%@'",
    v9,
    v10,
  v11 = v8);

  v12 = sub_100005020(a1, v11);

  return v12;
}

void sub_1000053E4(os_unfair_lock_s *a1, void *a2)
{
  id v3 = a2;
  os_unfair_lock_lock(a1);
  v3[2]();
  os_unfair_lock_unlock(a1);
}

void sub_100005448(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_10000545C(_Unwind_Exception *a1)
{
}

void sub_100005508(void *a1)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000055F8;
  handler[3] = &unk_100010A50;
  id v3 = a1;
  v1 = (_xpc_connection_s *)v3;
  xpc_connection_set_event_handler(v1, handler);
  xpc_connection_resume(v1);
}

void sub_1000055F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = v3;
  xpc_type_t type = xpc_get_type(v5);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v5 != &_xpc_error_connection_invalid)
    {
      string = xpc_dictionary_get_string(v5, _xpc_error_key_description);
      NSLog(@"%s %s", "xpc_event_handler_no_catch", string);
    }
  }
  else if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v8 = xpc_dictionary_get_value(v5, off_100015618);
    id v9 = +[NSString stringWithUTF8String:xpc_string_get_string_ptr(v8)];
    +[AUHSXPCSharedListener sharedServiceListener];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100005818;
    v12[3] = &unk_100010700;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v9;
    id v15 = v4;
    id v16 = v5;
    id v10 = v9;
    id v11 = v13;
    [v11 whileHoldingLock:v12];
  }
  else
  {
    +[NSException raise:NSInternalInconsistencyException format:@"connection received unknown message type"];
  }
}

void sub_100005818(uint64_t a1)
{
  id v12 = [*(id *)(a1 + 32) listeners];
  v2 = [v12 objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    if ([*(id *)(a1 + 32) shouldAcceptNewConnection:*(void *)(a1 + 48) forListenerNamed:*(void *)(a1 + 40)])
    {
      [*(id *)(a1 + 32) didAcceptNewConnection:*(void *)(a1 + 48)];
      int64_t v3 = 0;
      char v4 = 1;
    }
    else
    {

      v2 = 0;
      char v4 = 0;
      int64_t v3 = 5;
    }
  }
  else
  {
    NSLog(@"listener named %@ not found", *(void *)(a1 + 40));
    char v4 = 0;
    int64_t v3 = 3;
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 56));
  v6 = (_xpc_connection_s *)*(id *)(a1 + 48);
  id v7 = v2;
  id v8 = reply;
  id v9 = v8;
  if ((v4 & 1) == 0) {
    xpc_dictionary_set_int64(v8, "error-code", v3);
  }
  if (v7)
  {
    id v10 = [v7 endpoint];
    id v11 = [v10 _endpoint];
    xpc_dictionary_set_value(v9, "listener-endpoint", v11);
  }
  xpc_connection_send_message(v6, v9);
}

void sub_10000597C(void *a1)
{
}

void sub_100005988(_Unwind_Exception *a1)
{
}

void sub_100005DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005DDC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005DEC(uint64_t a1)
{
}

void sub_100005DF4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) listeners];
  id v6 = [v2 objectForKey:*(void *)(a1 + 40)];

  uint64_t v3 = [v6 endpoint];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100005F40(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) listeners];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

id sub_10000602C(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    uint64_t v3 = +[NSHashTable weakObjectsHashTable];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v2 addObject:v6];
}

id sub_10000612C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setListeners:0];
}

void sub_1000061F4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AUHSXPCSharedListenerManager];
    [v5 setRemoteObjectInterface:v6];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100006380;
    v13[3] = &unk_100010988;
    id v14 = *(id *)(a1 + 32);
    id v7 = [v5 remoteObjectProxyWithErrorHandler:v13];
    [v5 resume];
    uint64_t v8 = *(unsigned int *)(a1 + 40);
    uint64_t v9 = *(unsigned int *)(a1 + 44);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100006394;
    v10[3] = &unk_100010A00;
    id v12 = *(id *)(a1 + 32);
    id v11 = v5;
    [v7 builtForPlatform:v8 againstMinimumSDK:v9 reply:v10];
  }
}

uint64_t sub_100006380(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100006394(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

void sub_100006420(_Unwind_Exception *a1)
{
}

void sub_100006440(void *a1)
{
}

void sub_1000064FC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AUHSXPCSharedListenerManager];
    [v5 setRemoteObjectInterface:v6];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100006674;
    v11[3] = &unk_100010988;
    id v12 = *(id *)(a1 + 32);
    id v7 = [v5 remoteObjectProxyWithErrorHandler:v11];
    [v5 resume];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000668C;
    v8[3] = &unk_1000109B0;
    id v10 = *(id *)(a1 + 32);
    id v9 = v5;
    [v7 getProgramSDKVersion:v8];
  }
}

uint64_t sub_100006674(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10000668C(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void sub_1000066D8(_Unwind_Exception *a1)
{
}

void sub_1000066F8(void *a1)
{
}

void sub_1000067D4(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    [a1[6] _failedToWarmUpClassNamed:a1[4] inServiceNamed:a1[5] dueTo:a3];
  }
  else
  {
    uint64_t v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AUHSXPCSharedListenerManager];
    [v5 setRemoteObjectInterface:v6];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100006954;
    v11[3] = &unk_100010910;
    id v14 = a1[6];
    id v12 = a1[4];
    id v13 = a1[5];
    id v7 = [v5 remoteObjectProxyWithErrorHandler:v11];
    [v5 resume];
    id v8 = a1[4];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100006968;
    v9[3] = &unk_100010938;
    id v10 = v5;
    [v7 warmUpClassNamed:v8 withReply:v9];
  }
}

id sub_100006954(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 48) _failedToWarmUpClassNamed:*(void *)(a1 + 32) inServiceNamed:*(void *)(a1 + 40) dueTo:a2];
}

id sub_100006968(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void sub_1000069F4(id a1)
{
  v1 = objc_alloc_init(AUHSXPCSharedListener);
  id v2 = (void *)qword_1000158D0;
  qword_1000158D0 = (uint64_t)v1;

  id v3 = +[NSMutableDictionary dictionaryWithCapacity:0];
  [(id)qword_1000158D0 setListeners:v3];

  id v6 = +[NSXPCListener anonymousListener];
  uint64_t v4 = objc_alloc_init(AUHSXPCSharedListenerManagerDelegate);
  id v5 = (void *)qword_1000158D8;
  qword_1000158D8 = (uint64_t)v4;

  [(id)qword_1000158D8 setListener:v6];
  [v6 setDelegate:qword_1000158D8];
  [(id)qword_1000158D0 addListener:v6 withName:&stru_100010E08];
}

void sub_100006C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006C58(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    if (!*(void *)(a1 + 56)) {
      goto LABEL_10;
    }
    id v8 = v6;
    goto LABEL_4;
  }
  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    id v9 = *(void **)(a1 + 56);
    if (v9) {
      *id v9 = 0;
    }
  }
  else if (*(void *)(a1 + 56))
  {
    sub_1000052EC(3, @"could not obtain endpoint", *(void **)(a1 + 32), *(void **)(a1 + 40));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
    **(void **)(a1 + 56) = v8;
  }
LABEL_10:
}

void sub_100006E2C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    id v7 = 0;
  }
  else
  {
    id v8 = a2;
    id v7 = [objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v8];

    if (v7)
    {
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = sub_1000052EC(4, @"could not create connection given endpoint", *(void **)(a1 + 32), *(void **)(a1 + 40));
    }
  }
  id v9 = (id)v6;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100007080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007098(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    if (!*(void *)(a1 + 56)) {
      goto LABEL_10;
    }
    id v7 = v5;
    goto LABEL_4;
  }
  if (v12)
  {
    id v8 = [objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v12];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    id v11 = *(void **)(a1 + 56);
    if (v11) {
      void *v11 = 0;
    }
  }
  else if (*(void *)(a1 + 56))
  {
    sub_1000052EC(3, @"could not obtain endpoint", *(void **)(a1 + 32), *(void **)(a1 + 40));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
    **(void **)(a1 + 56) = v7;
  }
LABEL_10:
}

void sub_1000072E0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000073C0;
  v7[3] = &unk_100010858;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 64);
  [v2 endpointForListenerNamed:v4 fromServiceNamed:v8 instanceIdentifier:v5 queue:v6 completion:v7];
}

void sub_1000073C0(uint64_t a1, void *a2, void *a3)
{
  unint64_t v6 = a2;
  uint64_t v5 = a3;
  if (!(v6 | v5))
  {
    uint64_t v5 = sub_1000052EC(3, @"could not obtain endpoint", *(void **)(a1 + 32), *(void **)(a1 + 40));
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000769C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  objc_begin_catch(a1);
  objc_exception_rethrow();
}

void sub_1000076BC(_Unwind_Exception *a1)
{
}

void sub_1000076D0(uint64_t a1)
{
  v1 = *(void **)(a1 + 80);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000077DC;
  v8[3] = &unk_100010808;
  long long v7 = *(_OWORD *)(a1 + 64);
  id v6 = (id)v7;
  long long v9 = v7;
  [v1 endpointForListenerNamed:v2 fromServiceNamed:v3 instanceIdentifier:v4 queue:v5 completion:v8];
}

void sub_1000077DC(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v6 = a3;
  long long v7 = v6;
  if (v6) {
    NSLog(@"%s failed to obtain endpoint due to %@", "+[AUHSXPCSharedListener connectionForListenerNamed:fromServiceNamed:instanceIdentifier:]_block_invoke_2", v6);
  }
  else {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100007BD4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a3;
  id v6 = a2;
  os_log_t v7 = os_log_create("com.apple.ViewBridge.AUHSXPCSharedListener", "AUHSXPCSharedListener");
  if (os_signpost_enabled(v7))
  {
    id v8 = v7;
    long long v9 = v8;
    os_signpost_id_t v10 = *(void *)(a1 + 40);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      CFStringRef v11 = @"success";
      if (v5) {
        CFStringRef v11 = v5;
      }
      int v12 = 138412290;
      CFStringRef v13 = v11;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "endpoint-lookup", "%@", (uint8_t *)&v12, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000082A8(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

id sub_1000082F4(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  v11[0] = @"listenerName";
  v11[1] = @"serviceName";
  v12[0] = v5;
  v12[1] = v6;
  v11[2] = @"instanceIdentifier";
  id v8 = v7;
  if (!v7)
  {
    id v8 = +[NSNull null];
  }
  v12[2] = v8;
  long long v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (!v7) {

  }
  return v9;
}

uint64_t sub_100008400(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];

  return _objc_release_x1();
}

void sub_100008450(void *a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100008BD4;
  v2[3] = &unk_1000106D8;
  id v3 = a1;
  id v1 = v3;
  sub_1000053E4((os_unfair_lock_s *)&unk_1000158F0, v2);
}

uint64_t sub_1000084E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000084FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008AB8;
  v6[3] = &unk_100010700;
  id v7 = v3;
  id v8 = v4;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v5 = v3;
  [v8 whileHoldingLock:v6];
}

void sub_1000085DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000086E8;
  v7[3] = &unk_100010790;
  id v5 = v4;
  uint64_t v14 = *(void *)(a1 + 72);
  id v8 = v5;
  id v9 = v3;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  id v6 = v3;
  [v5 whileHoldingLock:v7];
}

void sub_1000086E8(uint64_t a1)
{
  xpc_connection_set_event_handler(*(xpc_connection_t *)(*(void *)(a1 + 32) + 24), &stru_100010768);
  uint64_t v14 = 0;
  uint64_t v2 = [*(id *)(a1 + 80) endpointForReply:*(void *)(a1 + 40) withListenerName:*(void *)(*(void *)(a1 + 32) + 32) replyErrorCode:&v14];
  if (v14) {
    [*(id *)(a1 + 32) addError:v14 description:"returned by service" forListenerNamed:*(void *)(a1 + 48) fromServiceNamed:*(void *)(a1 + 56)];
  }
  if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 16) count] >= 2) {
    NSLog(@"while attempting to connect to %@, multiple errors occurred: %@", *(void *)(a1 + 48), *(void *)(*(void *)(a1 + 32) + 16));
  }
  if (![*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    id v3 = *(void **)(a1 + 56);
    uint64_t v4 = *(void **)(a1 + 64);
    id v5 = *(id *)(a1 + 48);
    id v6 = v3;
    id v7 = v4;
    id v8 = v2;
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100008960;
    v18[3] = &unk_100010A78;
    v20 = &v21;
    id v9 = v6;
    id v19 = v9;
    sub_100008998(v18);
    if (*((unsigned char *)v22 + 24))
    {
      id v10 = sub_1000082F4(v5, v9, v7);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100008A2C;
      v15[3] = &unk_100010AA0;
      id v11 = v10;
      id v16 = v11;
      id v17 = v8;
      sub_100008450(v15);
    }
    _Block_object_dispose(&v21, 8);
  }
  uint64_t v12 = *(void *)(a1 + 72);
  id v13 = [*(id *)(*(void *)(a1 + 32) + 16) firstObject];
  (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v2, v13);
}

void sub_100008944(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

id sub_100008960(uint64_t a1, void *a2)
{
  id result = [a2 containsObject:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_100008998(void *a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100008A48;
  v2[3] = &unk_1000106D8;
  id v3 = a1;
  id v1 = v3;
  sub_1000053E4((os_unfair_lock_s *)&unk_1000158E0, v2);
}

void *sub_100008A2C(void *result, void *a2)
{
  if ((byte_1000158C0 & 1) == 0) {
    return _[a2 setObject:result[5] forKeyedSubscript:result[4]];
  }
  return result;
}

uint64_t sub_100008A48(uint64_t a1)
{
  if (!qword_1000158E8)
  {
    uint64_t v2 = +[NSMutableSet setWithCapacity:10];
    id v3 = (void *)qword_1000158E8;
    qword_1000158E8 = v2;
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

void sub_100008AB8(uint64_t a1)
{
  xpc_type_t type = xpc_get_type(*(xpc_object_t *)(a1 + 32));
  id v3 = xpc_copy_description(*(xpc_object_t *)(a1 + 32));
  uint64_t v4 = v3;
  if (type == (xpc_type_t)&_xpc_type_error) {
    [*(id *)(a1 + 40) addError:2 description:v3 forListenerNamed:*(void *)(a1 + 48) fromServiceNamed:*(void *)(a1 + 56)];
  }
  else {
    NSLog(@"while attempting to connect to %@, %s received %s", *(void *)(a1 + 48), "+[AUHSXPCSharedListener _endpointForListenerNamed:fromServiceNamed:instanceIdentifier:queue:async:completion:]_block_invoke_3", v3);
  }

  free(v4);
}

uint64_t sub_100008BD4(uint64_t a1)
{
  if (!qword_1000158F8)
  {
    uint64_t v2 = +[NSMutableDictionary dictionaryWithCapacity:10];
    id v3 = (void *)qword_1000158F8;
    qword_1000158F8 = v2;
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

void sub_100008D74(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008D8C(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 copy];

  return _objc_release_x1();
}

void sub_100008DD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 removeAllObjects];
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100008E90;
    v5[3] = &unk_100010688;
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = v3;
    [v4 enumerateKeysAndObjectsUsingBlock:v5];
  }
}

void sub_100008E90(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [v7 objectForKeyedSubscript:@"serviceName"];
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) containsObject:v6]) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v7];
  }
}

void sub_100009018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100009030(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[NSMutableDictionary dictionaryWithDictionary:a2];

  return _objc_release_x1();
}

void sub_100009090(id a1, NSMutableDictionary *a2)
{
  byte_1000158C0 = 1;
}

id sub_100009148(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

void sub_1000093BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  id v11 = v10;

  a9.super_class = (Class)AUHostingService;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100009404(void *a1)
{
}

void sub_10000962C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void *sub_100009668(uint64_t a1, char a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100009718;
  v6[3] = &unk_100010AC8;
  id v3 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  char v8 = *(unsigned char *)(a1 + 48);
  id v7 = v3;
  char v9 = a2;
  uint64_t v4 = objc_retainBlock(v6);

  return v4;
}

void sub_100009718(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 32);
  CAFormatter::CAFormatter((CAFormatter *)&v13, (const AudioComponentDescription *)(*(void *)(a1 + 32) + 24));
  uint64_t v3 = *v2;
  uint64_t v4 = (void *)(*v2 + 48);
  if (*(char *)(v3 + 71) < 0) {
    uint64_t v4 = (void *)*v4;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100015950, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100015950))
  {
    sub_100009AF4("com.apple.coreaudio", "AUHostingService");
    __cxa_guard_release(&qword_100015950);
  }
  id v5 = (id) qword_100015940;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    id v15 = "AUHostingService.mm";
    __int16 v16 = 1024;
    int v17 = 186;
    __int16 v18 = 2080;
    id v19 = v13;
    __int16 v20 = 2080;
    uint64_t v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%25s:%-5d Releasing Audio Unit %s and disconnecting from Hosting Service %s", buf, 0x26u);
  }
  id v6 = +[AUHostingServiceInstanceMap sharedInstance];
  id v7 = [*(id *)(*(void *)(a1 + 32) + 8) audioUnitUUID];
  [v6 unregisterInstance:v7];

  uint64_t v8 = *(void *)(a1 + 32);
  char v9 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = 0;

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained invalidate];

  id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [v11 setExportedObject:0];

  if (*(unsigned char *)(a1 + 48))
  {
    atomic_load((unsigned int *)&unk_100015900);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  if (*(unsigned char *)(a1 + 49))
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100015950, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_100015950))
    {
      sub_100009AF4("com.apple.coreaudio", "AUHostingService");
      __cxa_guard_release(&qword_100015950);
    }
    uint64_t v12 = (id) qword_100015940;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v15 = "AUHostingService.mm";
      __int16 v16 = 1024;
      int v17 = 202;
      __int16 v18 = 2080;
      id v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%25s:%-5d Shutting down Audio Unit Hosting Service %s", buf, 0x1Cu);
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100015930, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_100015930))
    {
      dword_100015908 = 0;
      qword_100015910 = (uint64_t)off_100010B20;
      qword_100015928 = (uint64_t)&qword_100015910;
      __cxa_guard_release(&qword_100015930);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&dword_100015908);
    if (!qword_100015928) {
      sub_100009B38();
    }
    (*(void (**)(uint64_t))(*(void *)qword_100015928 + 48))(qword_100015928);
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_100015908);
  }
  if (v13) {
    free(v13);
  }
}

void sub_100009A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  if (a10) {
    free(a10);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_100009AF4(const char *a1, const char *a2)
{
  qword_100015940 = 0;
  qword_100015948 = 0;
  qword_100015940 = (uint64_t)os_log_create(a1, a2);

  return _objc_release_x1();
}

void sub_100009B38()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_100010B90;
}

void sub_100009B88(std::exception *a1)
{
  std::exception::~exception(a1);

  operator delete();
}

void sub_100009BC0()
{
}

void sub_100009BDC(uint64_t a1, void *a2)
{
  *a2 = off_100010B20;
}

void *sub_100009BFC()
{
  id result = operator new(0x10uLL);
  *id result = off_100010B20;
  return result;
}

void sub_100009C34()
{
}

void sub_10000A1A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10000A30C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000A640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

std::string *sub_10000A690(std::string *a1, char *__s)
{
  size_t v4 = strlen(__s);

  return sub_10000A6D8(a1, __s, v4);
}

std::string *sub_10000A6D8(std::string *__dst, const std::string::value_type *__src, size_t __len)
{
  LODWORD(v6) = SHIBYTE(__dst->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = __dst->__r_.__value_.__r.__words[2];
    std::string::size_type v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __len)
    {
      std::string::size_type size = __dst->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    unint64_t v6 = HIBYTE(v10);
    id v7 = (std::string *)__dst->__r_.__value_.__r.__words[0];
  }
  else
  {
    id v7 = __dst;
    if (__len > 0x16)
    {
      std::string::size_type size = HIBYTE(__dst->__r_.__value_.__r.__words[2]);
      std::string::size_type v9 = 22;
LABEL_6:
      std::string::__grow_by_and_replace(__dst, v9, __len - v9, size, 0, size, __len, __src);
      return __dst;
    }
  }
  if (__len)
  {
    memmove(v7, __src, __len);
    LOBYTE(v6) = *((unsigned char *)&__dst->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0) {
    __dst->__r_.__value_.__l.__size_ = __len;
  }
  else {
    *((unsigned char *)&__dst->__r_.__value_.__s + 23) = __len & 0x7F;
  }
  v7->__r_.__value_.__s.__data_[__len] = 0;
  return __dst;
}

void sub_10000A858(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A99C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A9E8()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100015950, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100015950))
  {
    qword_100015948 = 0;
    qword_100015940 = (uint64_t)os_log_create("com.apple.coreaudio", "AUHostingService");
    __cxa_guard_release(&qword_100015950);
  }
}

uint64_t start()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100015950, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100015950))
  {
    sub_100009AF4("com.apple.coreaudio", "AUHostingService");
    __cxa_guard_release(&qword_100015950);
  }
  uint64_t v1 = (id) qword_100015940;
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "AUHostingServiceMain.mm";
    __int16 v9 = 1024;
    int v10 = 112;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "%25s:%-5d entering main()", (uint8_t *)&v7, 0x12u);
  }
  id v2 = +[AUHostingServiceInstanceMap sharedInstance];
  uint64_t v3 = +[NSXPCListener anonymousListener];
  size_t v4 = objc_opt_new();
  [v3 setDelegate:v4];
  objc_storeStrong((id *)&qword_100015938, v3);
  atexit(sub_10000ADF0);
  id v5 = +[AUHSXPCSharedListener sharedServiceListener];
  [v5 addListener:v3 withName:@"AUHostingServiceMain"];
  [v5 resume];

  return 0;
}

void sub_10000AC38(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, long long a10, int a11, __int16 a12, __int16 a13, void *a14, long long a15)
{
  if (a2 == 1)
  {
    id v20 = objc_begin_catch(a1);
    sub_10000A9E8();
    uint64_t v21 = *(id *)(v17 + 2368);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = [v20 name];
      id v23 = [v20 reason];
      char v24 = [v20 userInfo];
      v25 = [v20 callStackSymbols];
      LODWORD(a9) = 136316418;
      *(void *)((char *)&a9 + 4) = "AUHostingServiceMain.mm";
      WORD6(a9) = 1024;
      *(_DWORD *)((char *)&a9 + 14) = 119;
      WORD1(a10) = 2112;
      *(void *)((char *)&a10 + 4) = v22;
      WORD6(a10) = 2112;
      *(void *)((char *)&a10 + 14) = v23;
      a13 = 2112;
      a14 = v24;
      LOWORD(a15) = 2112;
      *(void *)((char *)&a15 + 2) = v25;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d caught %@: '%@' with user dictionary %@ and call stack %@", (uint8_t *)&a9, 0x3Au);
    }
    objc_end_catch();
    JUMPOUT(0x10000ABC0);
  }
  _Unwind_Resume(a1);
}

void sub_10000ADF0()
{
  [(id)qword_100015938 invalidate];
  v0 = (void *)qword_100015938;
  qword_100015938 = 0;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return _CFAutorelease(arg);
}

uint64_t ConfigureAUAudioUnitXPCInterface()
{
  return _ConfigureAUAudioUnitXPCInterface();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return _SecTaskCreateFromSelf(allocator);
}

uint64_t SetAllowedClassesForAUAudioUnitHostXPCInterface()
{
  return _SetAllowedClassesForAUAudioUnitHostXPCInterface();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void CAFormatter::CAFormatter(CAFormatter *this, const AudioComponentDescription *a2)
{
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

void std::exception::~exception(std::exception *this)
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

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

int atexit(void (*a1)(void))
{
  return _atexit(a1);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return _audit_token_to_pid(atoken);
}

int audit_token_to_pidversion(audit_token_t *atoken)
{
  return _audit_token_to_pidversion(atoken);
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

uint64_t dyld_get_program_sdk_version()
{
  return _dyld_get_program_sdk_version();
}

uint64_t dyld_program_sdk_at_least()
{
  return _dyld_program_sdk_at_least();
}

void exit(int a1)
{
}

void free(void *a1)
{
}

uid_t geteuid(void)
{
  return _geteuid();
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

void objc_terminate(void)
{
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

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return _task_info(target_task, flavor, task_info_out, task_info_outCnt);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return _xpc_connection_create(name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

uint64_t xpc_connection_set_oneshot_instance()
{
  return _xpc_connection_set_oneshot_instance();
}

uint64_t xpc_connection_set_target_uid()
{
  return _xpc_connection_set_target_uid();
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

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_main(xpc_connection_handler_t handler)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__UUID(void *a1, const char *a2, ...)
{
  return _[a1 _UUID];
}

id objc_msgSend__endpoint(void *a1, const char *a2, ...)
{
  return _[a1 _endpoint];
}

id objc_msgSend__endpointForListenerNamed_fromServiceNamed_instanceIdentifier_queue_async_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endpointForListenerNamed:fromServiceNamed:instanceIdentifier:queue:async:completion:");
}

id objc_msgSend__failedToWarmUpClassNamed_inServiceNamed_dueTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_failedToWarmUpClassNamed:inServiceNamed:dueTo:");
}

id objc_msgSend__setEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setEndpoint:");
}

id objc_msgSend_addError_description_forListenerNamed_fromServiceNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addError:description:forListenerNamed:fromServiceNamed:");
}

id objc_msgSend_addListener_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addListener:withName:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return _[a1 anonymousListener];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_audioUnitUUID(void *a1, const char *a2, ...)
{
  return _[a1 audioUnitUUID];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_builtForPlatform_againstMinimumSDK_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "builtForPlatform:againstMinimumSDK:reply:");
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return _[a1 callStackSymbols];
}

id objc_msgSend_classesForSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classesForSelector:argumentIndex:ofReply:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connectToService_listener_queue_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectToService:listener:queue:completion:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
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

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didAcceptNewConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didAcceptNewConnection:");
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return _[a1 endpoint];
}

id objc_msgSend_endpointForListenerNamed_fromServiceNamed_instanceIdentifier_queue_async_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpointForListenerNamed:fromServiceNamed:instanceIdentifier:queue:async:completion:");
}

id objc_msgSend_endpointForListenerNamed_fromServiceNamed_instanceIdentifier_queue_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpointForListenerNamed:fromServiceNamed:instanceIdentifier:queue:completion:");
}

id objc_msgSend_endpointForReply_withListenerName_replyErrorCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpointForReply:withListenerName:replyErrorCode:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_getProgramSDKVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getProgramSDKVersion:");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithConnection_config_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:config:");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_instancesRespondToSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instancesRespondToSelector:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_listenerEndpointForService_instanceIdentifier_listener_queue_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listenerEndpointForService:instanceIdentifier:listener:queue:completion:");
}

id objc_msgSend_listeners(void *a1, const char *a2, ...)
{
  return _[a1 listeners];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_registerInstance_instance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerInstance:instance:");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_retrieveInstance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveInstance:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListener:");
}

id objc_msgSend_setListeners_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListeners:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedServiceListener(void *a1, const char *a2, ...)
{
  return _[a1 sharedServiceListener];
}

id objc_msgSend_shouldAcceptNewConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAcceptNewConnection:");
}

id objc_msgSend_shouldAcceptNewConnection_forListenerNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAcceptNewConnection:forListenerNamed:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_superclass(void *a1, const char *a2, ...)
{
  return _[a1 superclass];
}

id objc_msgSend_unregisterInstance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterInstance:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_warmUpClassNamed_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "warmUpClassNamed:withReply:");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}

id objc_msgSend_whileHoldingLock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whileHoldingLock:");
}