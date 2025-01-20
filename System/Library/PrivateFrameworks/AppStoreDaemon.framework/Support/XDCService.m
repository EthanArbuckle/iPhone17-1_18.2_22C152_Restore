@interface XDCService
- (XDCService)init;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 devicesChanged:(id)a4;
@end

@implementation XDCService

- (XDCService)init
{
  v23.receiver = self;
  v23.super_class = (Class)XDCService;
  v2 = [(XDCService *)&v23 init];
  if (!v2)
  {
LABEL_6:
    v19 = v2;
    goto LABEL_10;
  }
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.XDCMessageBroker", v3);
  dispatchQueue = v2->_dispatchQueue;
  v2->_dispatchQueue = (OS_dispatch_queue *)v4;

  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.appstored.XDCMessageBroker.worker", v6);
  workerQueue = v2->_workerQueue;
  v2->_workerQueue = (OS_dispatch_queue *)v7;

  v9 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.appstore"];
  service = v2->_service;
  v2->_service = v9;

  v11 = v2->_service;
  v12 = ASDLogHandleForCategory();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v25 = @"com.apple.private.alloy.appstore";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Listening for service: %{public}@", buf, 0xCu);
    }

    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queuedMessages = v2->_queuedMessages;
    v2->_queuedMessages = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    messageHandlers = v2->_messageHandlers;
    v2->_messageHandlers = v16;

    [(IDSService *)v2->_service addDelegate:v2 queue:v2->_dispatchQueue];
    v18 = v2->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100317AE4;
    block[3] = &unk_100521388;
    v22 = v2;
    dispatch_async(v18, block);

    goto LABEL_6;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v25 = @"com.apple.private.alloy.appstore";
    _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Failed to create service: %{public}@", buf, 0xCu);
  }

  v19 = 0;
LABEL_10:

  return v19;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v10 = a5;
  id v11 = a7;
  if (!a6)
  {
    v12 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v18 = 138543618;
      *(void *)&v18[4] = v10;
      *(_WORD *)&v18[12] = 2114;
      *(void *)&v18[14] = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Sending: %{public}@ failed with error: %{public}@", v18, 0x16u);
    }

    id v13 = v10;
    id v14 = v11;
    if (self)
    {
      dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
      v15 = [(NSMutableDictionary *)self->_queuedMessages objectForKeyedSubscript:v13];
      id v16 = [v15 copy];

      if (v16)
      {
        v17 = dispatch_get_global_queue(21, 0);
        *(void *)v18 = _NSConcreteStackBlock;
        *(void *)&v18[8] = 3221225472;
        *(void *)&v18[16] = sub_100318E38;
        v19 = &unk_100521AE0;
        id v21 = v16;
        id v20 = v14;
        dispatch_async(v17, v18);

        [(NSMutableDictionary *)self->_queuedMessages setObject:0 forKeyedSubscript:v13];
      }
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  if ([v10 isResponse])
  {
    id v13 = [v12 incomingResponseIdentifier];

    if (v13)
    {
      id v14 = v13;
      id v15 = v10;
      id v16 = v11;
      if (self)
      {
        dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
        v17 = [(NSMutableDictionary *)self->_queuedMessages objectForKeyedSubscript:v14];
        id v18 = [v17 copy];

        v19 = ASDLogHandleForCategory();
        id v20 = v19;
        if (v18)
        {
          id v44 = v11;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v14;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = [v15 type];
            *(_WORD *)&buf[18] = 2114;
            *(void *)&buf[20] = v16;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Received reply for: %{public}@ type: %u from: %{public}@", buf, 0x1Cu);
          }

          id v21 = sub_1002DC980();
          id v20 = sub_1002DCE10(v21, v16, self->_service);

          v22 = sub_100369160((id *)[XDCMessage alloc], v15, v20, 0);
          dispatch_get_global_queue(21, 0);
          id v23 = v16;
          CFStringRef v25 = v24 = v15;
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_100318E50;
          *(void *)&buf[24] = &unk_100521AE0;
          id v26 = v18;
          v48 = v22;
          id v49 = v26;
          v27 = v22;
          dispatch_async(v25, buf);

          id v15 = v24;
          id v16 = v23;
          [(NSMutableDictionary *)self->_queuedMessages setObject:0 forKeyedSubscript:v14];

          id v11 = v44;
        }
        else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v14;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = [v15 type];
          *(_WORD *)&buf[18] = 2114;
          *(void *)&buf[20] = v16;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Received reply but no handler exists for: %{public}@ type: %u from: %{public}@", buf, 0x1Cu);
        }
      }
    }
    else
    {
      v43 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = [v10 type];
        *(_WORD *)&buf[8] = 2114;
        *(void *)&buf[10] = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Received reply without outgoing identifier for type: %u from: %{public}@", buf, 0x12u);
      }
    }
  }
  else
  {
    v28 = [v12 outgoingResponseIdentifier];

    id v13 = v28;
    id v29 = v10;
    id v30 = v11;
    if (self)
    {
      dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
      v31 = sub_1002DC980();
      v46 = sub_1002DCE10(v31, v30, self->_service);

      v32 = (unsigned __int16 *)sub_100369160((id *)[XDCMessage alloc], v29, v46, v13);
      v45 = v32;
      messageHandlers = self->_messageHandlers;
      if (v32) {
        uint64_t v34 = v32[5];
      }
      else {
        uint64_t v34 = 0;
      }
      v35 = +[NSNumber numberWithUnsignedShort:v34];
      uint64_t v36 = [(NSMutableDictionary *)messageHandlers objectForKeyedSubscript:v35];

      if (v36)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(v36 + 16));
        v38 = [WeakRetained methodSignatureForSelector:*(void *)(v36 + 8)];

        v39 = +[NSInvocation invocationWithMethodSignature:v38];
        id v40 = objc_loadWeakRetained((id *)(v36 + 16));
        [v39 setTarget:v40];

        [v39 setSelector:*(void *)(v36 + 8)];
        [v39 setArgument:&v45 atIndex:2];
        [v39 setArgument:&v46 atIndex:3];
        [v39 retainArguments];
        workerQueue = self->_workerQueue;
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_100318E68;
        *(void *)&buf[24] = &unk_1005218C0;
        v48 = (id *)v39;
        id v49 = (id)v36;
        id v42 = v39;
        dispatch_async(workerQueue, buf);
      }
      else
      {
        v38 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v13;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = [v29 type];
          *(_WORD *)&buf[18] = 2114;
          *(void *)&buf[20] = v30;
          _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "No handler for received request for: %{public}@ type: %u from: %{public}@", buf, 0x1Cu);
        }
      }
    }
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5 = a4;
  v6 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Updating after devices changed: %{public}@", buf, 0xCu);
  }

  dispatch_queue_t v7 = sub_1002DC980();
  sub_1002DD41C((uint64_t)v7, v5);

  v8 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100318818;
  block[3] = &unk_100521388;
  void block[4] = self;
  dispatch_async(v8, block);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_messageHandlers, 0);
  objc_storeStrong((id *)&self->_queuedMessages, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end