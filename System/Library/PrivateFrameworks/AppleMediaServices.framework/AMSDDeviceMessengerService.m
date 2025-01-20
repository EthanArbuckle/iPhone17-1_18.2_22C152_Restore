@interface AMSDDeviceMessengerService
+ (AMSDDeviceMessengerService)sharedService;
+ (BOOL)isConnectionEntitled:(id)a3;
- (AMSDDeviceMessengerService)init;
- (BOOL)_attemptAutomaticHandleForMessage:(id)a3;
- (BOOL)_sendMessage:(id)a3 withReplyHandler:(id)a4;
- (IDSService)service;
- (NSArray)cachedMessages;
- (NSMutableArray)delegates;
- (NSMutableDictionary)outgoingMessageReplyHandlers;
- (OS_dispatch_queue)dispatchQueue;
- (id)_determineDestinationsForMessage:(id)a3;
- (id)_getSavedMessages;
- (id)_messageWithProtobuf:(id)a3 fromID:(id)a4 context:(id)a5;
- (id)_replyForIncomingMessage:(id)a3;
- (id)_saveLocation;
- (int64_t)_determineDeviceTypeFromDeviceID:(id)a3 devices:(id)a4;
- (void)_cleanupSavedMessages;
- (void)_clearMessage:(id)a3;
- (void)_enumerateDelegatesWithBlock:(id)a3;
- (void)_handleErrorForIdentifier:(id)a3 error:(id)a4;
- (void)_handleIncomingMessage:(id)a3;
- (void)_handleIncomingReply:(id)a3;
- (void)_overwriteSavedMessages:(id)a3;
- (void)_saveMessage:(id)a3;
- (void)addDelegate:(id)a3;
- (void)getMessagesWithPurpose:(int64_t)a3 completion:(id)a4;
- (void)sendMessage:(id)a3 completion:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setCachedMessages:(id)a3;
- (void)setDelegates:(id)a3;
@end

@implementation AMSDDeviceMessengerService

+ (AMSDDeviceMessengerService)sharedService
{
  if (qword_100130298 != -1) {
    dispatch_once(&qword_100130298, &stru_100112620);
  }
  v2 = (void *)qword_1001302A0;
  return (AMSDDeviceMessengerService *)v2;
}

- (AMSDDeviceMessengerService)init
{
  v29.receiver = self;
  v29.super_class = (Class)AMSDDeviceMessengerService;
  v2 = [(AMSDDeviceMessengerService *)&v29 init];
  if (!v2)
  {
LABEL_8:
    v16 = v2;
    goto LABEL_21;
  }
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.amsaccountsd.IDS", v3);
  dispatchQueue = v2->_dispatchQueue;
  v2->_dispatchQueue = (OS_dispatch_queue *)v4;

  v6 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.amsaccountsync"];
  service = v2->_service;
  v2->_service = v6;

  if (v2->_service)
  {
    v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      v8 = +[AMSLogConfig sharedConfig];
    }
    v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v10;
      __int16 v32 = 2114;
      CFStringRef v33 = @"com.apple.private.alloy.amsaccountsync";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Listening for service: %{public}@", buf, 0x16u);
    }

    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    delegates = v2->_delegates;
    v2->_delegates = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    outgoingMessageReplyHandlers = v2->_outgoingMessageReplyHandlers;
    v2->_outgoingMessageReplyHandlers = v13;

    [(IDSService *)v2->_service addDelegate:v2 queue:v2->_dispatchQueue];
    v15 = [(AMSDDeviceMessengerService *)v2 dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000275C8;
    block[3] = &unk_1001124D0;
    v28 = v2;
    dispatch_async(v15, block);

    goto LABEL_8;
  }
  unsigned int v17 = +[AMSUnitTests isRunningUnitTests];
  uint64_t v18 = +[AMSLogConfig sharedConfig];
  v19 = (void *)v18;
  if (v17)
  {
    if (!v18)
    {
      v19 = +[AMSLogConfig sharedConfig];
    }
    v20 = [v19 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v21;
      __int16 v32 = 2114;
      CFStringRef v33 = @"com.apple.private.alloy.amsaccountsync";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create service: %{public}@", buf, 0x16u);
    }

    v22 = +[NSNotificationCenter defaultCenter];
    v23 = +[AMSLogConfig sharedConfig];
    [v22 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v23 userInfo:0];
  }
  else
  {
    if (!v18)
    {
      v19 = +[AMSLogConfig sharedConfig];
    }
    v24 = [v19 OSLogObject];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      uint64_t v25 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v25;
      __int16 v32 = 2114;
      CFStringRef v33 = @"com.apple.private.alloy.amsaccountsync";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "%{public}@: Failed to create service: %{public}@", buf, 0x16u);
    }
  }
  v16 = 0;
LABEL_21:

  return v16;
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(AMSDDeviceMessengerService *)self dispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100027684;
  v7[3] = &unk_100112170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (BOOL)isConnectionEntitled:(id)a3
{
  v3 = [a3 valueForEntitlement:@"com.apple.private.applemediaservices"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  unsigned __int8 v5 = [v4 BOOLValue];
  return v5;
}

- (void)getMessagesWithPurpose:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = +[AMSLogConfig sharedConfig];
  if (!v7)
  {
    v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = objc_opt_class();
    __int16 v15 = 2048;
    int64_t v16 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetching messages with purpose: %ld", buf, 0x16u);
  }

  v9 = [(AMSDDeviceMessengerService *)self dispatchQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000278F0;
  v11[3] = &unk_100112648;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, v11);
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AMSLogConfig sharedConfig];
  if (!v8)
  {
    id v8 = +[AMSLogConfig sharedConfig];
  }
  v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    v11 = [v6 logKey];
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = v10;
    __int16 v20 = 2114;
    uint64_t v21 = v11;
    __int16 v22 = 2114;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Sending message: %{public}@", buf, 0x20u);
  }
  id v12 = [(AMSDDeviceMessengerService *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027B18;
  block[3] = &unk_100112408;
  void block[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v12, block);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v10 = a5;
  id v11 = a7;
  if (!a6)
  {
    id v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      id v12 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543874;
      uint64_t v15 = objc_opt_class();
      __int16 v16 = 2114;
      id v17 = v10;
      __int16 v18 = 2114;
      id v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: Message encountered error. ID: %{public}@ %{public}@", (uint8_t *)&v14, 0x20u);
    }

    [(AMSDDeviceMessengerService *)self _handleErrorForIdentifier:v10 error:v11];
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a6;
  id v11 = [(AMSDDeviceMessengerService *)self _messageWithProtobuf:a5 fromID:v10 context:a7];
  uint64_t v12 = +[AMSLogConfig sharedConfig];
  id v13 = (void *)v12;
  if (v11)
  {
    if (!v12)
    {
      id v13 = +[AMSLogConfig sharedConfig];
    }
    int v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_opt_class();
      __int16 v16 = [v11 logKey];
      int v18 = 138544130;
      uint64_t v19 = v15;
      __int16 v20 = 2114;
      id v21 = v16;
      __int16 v22 = 2114;
      id v23 = v10;
      __int16 v24 = 2114;
      uint64_t v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received message from: %{public}@ message: %{public}@", (uint8_t *)&v18, 0x2Au);
    }
    if ([v11 isReply]) {
      [(AMSDDeviceMessengerService *)self _handleIncomingReply:v11];
    }
    else {
      [(AMSDDeviceMessengerService *)self _handleIncomingMessage:v11];
    }
  }
  else
  {
    if (!v12)
    {
      id v13 = +[AMSLogConfig sharedConfig];
    }
    id v17 = [v13 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138543618;
      uint64_t v19 = objc_opt_class();
      __int16 v20 = 2114;
      id v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to decode received message from: %{public}@", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5 = a4;
  id v6 = +[AMSLogConfig sharedConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543618;
    uint64_t v9 = objc_opt_class();
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@: Devices changed: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  [(AMSDDeviceMessengerService *)self _enumerateDelegatesWithBlock:&stru_1001126B0];
}

- (BOOL)_attemptAutomaticHandleForMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 purpose];
  if (v5 == (id)1) {
    [(AMSDDeviceMessengerService *)self _clearMessage:v4];
  }

  return v5 == (id)1;
}

- (id)_determineDestinationsForMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSDDeviceMessengerService *)self service];
  id v6 = objc_msgSend(v5, "amsa_allDevices");

  id v7 = objc_alloc_init((Class)NSMutableSet);
  int v8 = [v4 destination];
  id v9 = [v8 type];

  if (v9 == (id)3)
  {
    id v17 = [v4 destination];
    int v18 = [v17 identifier];

    if (!v18) {
      goto LABEL_27;
    }
    id v10 = [v4 destination];
    uint64_t v19 = [v10 identifier];
    [v7 addObject:v19];
  }
  else if (v9 == (id)2)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v10 = v6;
    id v20 = [v10 countByEnumeratingWithState:&v32 objects:v48 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v33;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(v10);
          }
          if (objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "isLocallyPaired", (void)v32))
          {
            __int16 v24 = (void *)IDSCopyIDForDevice();
            [v7 addObject:v24];
          }
        }
        id v21 = [v10 countByEnumeratingWithState:&v32 objects:v48 count:16];
      }
      while (v21);
    }
  }
  else
  {
    if (v9 != (id)1) {
      goto LABEL_27;
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v36 objects:v49 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v37;
      do
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
          if ([v15 isLocallyPaired] && objc_msgSend(v15, "isActive"))
          {
            __int16 v16 = (void *)IDSCopyIDForDevice();
            [v7 addObject:v16];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v36 objects:v49 count:16];
      }
      while (v12);
    }
  }

LABEL_27:
  uint64_t v25 = +[AMSLogConfig sharedConfig];
  if (!v25)
  {
    uint64_t v25 = +[AMSLogConfig sharedConfig];
  }
  v26 = [v25 OSLogObject];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = objc_opt_class();
    v28 = [v4 logKey];
    objc_super v29 = [v4 destination];
    id v30 = [v29 type];
    *(_DWORD *)buf = 138544130;
    uint64_t v41 = v27;
    __int16 v42 = 2114;
    v43 = v28;
    __int16 v44 = 2048;
    id v45 = v30;
    __int16 v46 = 2114;
    id v47 = v7;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Determined destinations for type: %ld result: %{public}@", buf, 0x2Au);
  }
  return v7;
}

- (int64_t)_determineDeviceTypeFromDeviceID:(id)a3 devices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    if (v7)
    {
      id v8 = v7;
    }
    else
    {
      id v10 = [(AMSDDeviceMessengerService *)self service];
      objc_msgSend(v10, "amsa_allDevices");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = v8;
    int64_t v9 = (int64_t)[v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v11);
          }
          int v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v15 = (void *)IDSCopyIDForDevice();
          if (objc_msgSend(v15, "isEqualToString:", v6, (void)v17))
          {
            if ([v14 isLocallyPaired]
              && ([v14 isActive] & 1) != 0)
            {
              int64_t v9 = 1;
            }
            else if ([v14 isLocallyPaired])
            {
              int64_t v9 = 2;
            }
            else
            {
              int64_t v9 = 3;
            }

            goto LABEL_22;
          }
        }
        int64_t v9 = (int64_t)[v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (void)_enumerateDelegatesWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(AMSDDeviceMessengerService *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(AMSDDeviceMessengerService *)self delegates];
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v10) weakObjectValue];
        if (v11) {
          v4[2](v4, v11);
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(AMSDDeviceMessengerService *)self delegates];
  uint64_t v13 = (char *)[v12 count];

  if ((uint64_t)(v13 - 1) >= 0)
  {
    do
    {
      --v13;
      int v14 = [(AMSDDeviceMessengerService *)self delegates];
      uint64_t v15 = [v14 objectAtIndexedSubscript:v13];
      __int16 v16 = [v15 weakObjectValue];

      if (!v16)
      {
        long long v17 = [(AMSDDeviceMessengerService *)self delegates];
        [v17 removeObjectAtIndex:v13];
      }
    }
    while ((uint64_t)v13 > 0);
  }
}

- (void)_handleErrorForIdentifier:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AMSDDeviceMessengerService *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(AMSDDeviceMessengerService *)self outgoingMessageReplyHandlers];
  id v10 = [v9 objectForKeyedSubscript:v6];

  if (v10)
  {
    id v11 = dispatch_get_global_queue(21, 0);
    uint64_t v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    long long v17 = sub_100028B8C;
    long long v18 = &unk_100112648;
    id v20 = v10;
    id v19 = v7;
    dispatch_async(v11, &v15);

    uint64_t v12 = [(AMSDDeviceMessengerService *)self outgoingMessageReplyHandlers];
    [v12 setObject:0 forKeyedSubscript:v6];

    uint64_t v13 = v20;
  }
  else
  {
    uint64_t v13 = +[AMSLogConfig sharedConfig];
    if (!v13)
    {
      uint64_t v13 = +[AMSLogConfig sharedConfig];
    }
    int v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = objc_opt_class();
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@: Message error is missing a reply block", buf, 0xCu);
    }
  }
}

- (void)_handleIncomingMessage:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (![(AMSDDeviceMessengerService *)self _attemptAutomaticHandleForMessage:v4]) {
    [(AMSDDeviceMessengerService *)self _saveMessage:v4];
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100028C94;
  v7[3] = &unk_1001126D8;
  id v5 = v4;
  id v8 = v5;
  [(AMSDDeviceMessengerService *)self _enumerateDelegatesWithBlock:v7];
  id v6 = [(AMSDDeviceMessengerService *)self _replyForIncomingMessage:v5];
  if (v6) {
    [(AMSDDeviceMessengerService *)self _sendMessage:v6 withReplyHandler:0];
  }
}

- (void)_handleIncomingReply:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = [(AMSDDeviceMessengerService *)self outgoingMessageReplyHandlers];
  id v6 = [v4 messageID];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100028F30;
    block[3] = &unk_100112648;
    id v21 = v7;
    id v9 = v4;
    id v20 = v9;
    dispatch_async(v8, block);

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100028F48;
    v17[3] = &unk_1001126D8;
    id v10 = v9;
    id v18 = v10;
    [(AMSDDeviceMessengerService *)self _enumerateDelegatesWithBlock:v17];
    id v11 = [(AMSDDeviceMessengerService *)self outgoingMessageReplyHandlers];
    uint64_t v12 = [v10 messageID];
    [v11 setObject:0 forKeyedSubscript:v12];

    uint64_t v13 = v21;
  }
  else
  {
    uint64_t v13 = +[AMSLogConfig sharedConfig];
    if (!v13)
    {
      uint64_t v13 = +[AMSLogConfig sharedConfig];
    }
    int v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = [v4 logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v15;
      __int16 v24 = 2114;
      uint64_t v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Received reply but no handler exists", buf, 0x16u);
    }
  }
}

- (id)_messageWithProtobuf:(id)a3 fromID:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 type] == 1
    && (id v11 = [AMSXDProtoMessage alloc],
        [v8 data],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [(AMSXDProtoMessage *)v11 initWithData:v12],
        v12,
        v13))
  {
    int v14 = +[AMSXDMessage messageFromProtoMessage:v13];
    uint64_t v15 = +[AMSXDDevice deviceFromIdentifier:v9];
    [v14 setOrigin:v15];

    int64_t v16 = [(AMSDDeviceMessengerService *)self _determineDeviceTypeFromDeviceID:v9 devices:0];
    long long v17 = [v14 origin];
    [v17 setType:v16];

    id v18 = +[NSDate now];
    [v14 setReceiptDate:v18];

    if ([v14 isReply])
    {
      id v19 = [v10 incomingResponseIdentifier];
      id v20 = [v14 messageID];
      unsigned __int8 v21 = [v19 isEqualToString:v20];

      if ((v21 & 1) == 0)
      {
        uint64_t v22 = +[AMSLogConfig sharedConfig];
        if (!v22)
        {
          uint64_t v22 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v23 = [v22 OSLogObject];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = objc_opt_class();
          __int16 v24 = [v14 logKey];
          uint64_t v25 = [v14 messageID];
          *(_DWORD *)buf = 138544130;
          uint64_t v31 = v29;
          __int16 v32 = 2114;
          id v33 = v24;
          __int16 v34 = 2114;
          long long v35 = v19;
          __int16 v36 = 2114;
          long long v37 = v25;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] messageID doesn't match the encoded message. %{public}@ != %{public}@", buf, 0x2Au);
        }
      }
      [v14 setMessageID:v19];
    }
    else
    {
      v28 = [v10 outgoingResponseIdentifier];
      [v14 setMessageID:v28];
    }
  }
  else
  {
    uint64_t v13 = +[AMSLogConfig sharedConfig];
    if (!v13)
    {
      uint64_t v13 = +[AMSLogConfig sharedConfig];
    }
    v26 = [(AMSXDProtoMessage *)v13 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = objc_opt_class();
      __int16 v32 = 2114;
      id v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}@: Failed to decode protobuf data from: %{public}@", buf, 0x16u);
    }

    int v14 = 0;
  }

  return v14;
}

- (id)_replyForIncomingMessage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 identifier];
  id v5 = (void *)v4;
  if (v4) {
    CFStringRef v6 = (const __CFString *)v4;
  }
  else {
    CFStringRef v6 = &stru_100117BD0;
  }
  id v7 = [@"reply-" stringByAppendingString:v6];

  id v8 = objc_alloc((Class)AMSXDMessage);
  id v9 = [v3 origin];
  id v10 = objc_msgSend(v8, "initWithIdentifier:destination:purpose:object:", v7, v9, objc_msgSend(v3, "purpose"), 0);

  id v11 = [v3 messageID];
  [v10 setMessageID:v11];

  [v10 setIsReply:1];
  uint64_t v12 = [v3 logKey];

  [v10 setLogKey:v12];
  return v10;
}

- (BOOL)_sendMessage:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AMSDDeviceMessengerService *)self _determineDestinationsForMessage:v6];
  long long v35 = v8;
  if ([v8 count])
  {
    [v6 setDestination:0];
  }
  else
  {
    __int16 v34 = [v6 logKey];
    AMSErrorWithFormat();
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setDestination:", 0, v34);
    if (v15) {
      goto LABEL_25;
    }
  }
  id v9 = [v6 createProtoMessage];
  id v10 = objc_alloc((Class)IDSProtobuf);
  id v11 = [v9 data];
  id v12 = [v10 initWithProtobufData:v11 type:1 isResponse:0];

  if (v12)
  {

    goto LABEL_5;
  }
  id v33 = [v6 logKey];
  AMSErrorWithFormat();
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
LABEL_25:
    id v18 = 0;
    LOBYTE(v17) = 0;
    id v12 = 0;
    goto LABEL_26;
  }
LABEL_5:
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  if ([v6 isReply])
  {
    int v14 = [v6 messageID];
    [v13 setObject:v14 forKeyedSubscript:IDSSendMessageOptionPeerResponseIdentifierKey];
  }
  else if (v7)
  {
    [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionExpectsPeerResponseKey];
  }
  int64_t v16 = [(AMSDDeviceMessengerService *)self service];
  id v36 = 0;
  id v37 = 0;
  unsigned int v17 = [v16 sendProtobuf:v12 toDestinations:v8 priority:200 options:v13 identifier:&v37 error:&v36];
  id v18 = v37;
  id v15 = v36;

  if (v17 && !v15)
  {
    id v19 = +[AMSLogConfig sharedConfig];
    if (!v19)
    {
      id v19 = +[AMSLogConfig sharedConfig];
    }
    id v20 = [v19 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = [v6 logKey];
      *(_DWORD *)buf = 138543874;
      uint64_t v39 = v21;
      __int16 v40 = 2114;
      uint64_t v41 = v22;
      __int16 v42 = 2114;
      id v43 = v6;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully sent message: %{public}@", buf, 0x20u);
    }
    if (([v6 isReply] & 1) == 0)
    {
      id v23 = [v6 copy];
      __int16 v24 = +[NSDate now];
      [v23 setReceiptDate:v24];

      if (![(AMSDDeviceMessengerService *)self _attemptAutomaticHandleForMessage:v23])[(AMSDDeviceMessengerService *)self _saveMessage:v23]; {
    }
      }
    if (v7)
    {
      id v25 = [v7 copy];
      id v26 = objc_retainBlock(v25);
      uint64_t v27 = [(AMSDDeviceMessengerService *)self outgoingMessageReplyHandlers];
      [v27 setObject:v26 forKeyedSubscript:v18];
    }
    id v15 = 0;
    LOBYTE(v17) = 1;
    goto LABEL_32;
  }
LABEL_26:
  v28 = +[AMSLogConfig sharedConfig];
  if (!v28)
  {
    v28 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v29 = [v28 OSLogObject];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = [v6 logKey];
    *(_DWORD *)buf = 138544386;
    uint64_t v39 = v30;
    __int16 v40 = 2114;
    uint64_t v41 = v31;
    __int16 v42 = 2114;
    id v43 = v6;
    __int16 v44 = 2114;
    id v45 = v35;
    __int16 v46 = 2114;
    id v47 = v15;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to send message: %{public}@ to: %{public}@ error: %{public}@", buf, 0x34u);
  }
  if (v7) {
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v15);
  }
LABEL_32:

  return v17;
}

- (void)_cleanupSavedMessages
{
  id v3 = [(AMSDDeviceMessengerService *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(AMSDDeviceMessengerService *)self _getSavedMessages];
  [(AMSDDeviceMessengerService *)self _overwriteSavedMessages:v4];
}

- (void)_clearMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSDDeviceMessengerService *)self _getSavedMessages];
  id v6 = [v5 mutableCopy];

  if ([v6 count])
  {
    id v17 = [v6 count];
    id v7 = [v6 count];
    if ((uint64_t)v7 - 1 >= 0)
    {
      uint64_t v8 = (uint64_t)v7;
      do
      {
        id v9 = [v6 objectAtIndexedSubscript:--v8];
        id v10 = [v9 identifier];
        id v11 = [v4 identifier];
        unsigned int v12 = [v10 isEqualToString:v11];

        if (v12)
        {
          [v6 removeObjectAtIndex:v8];
          id v13 = +[AMSLogConfig sharedConfig];
          if (!v13)
          {
            id v13 = +[AMSLogConfig sharedConfig];
          }
          int v14 = [v13 OSLogObject];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = objc_opt_class();
            int64_t v16 = [v9 logKey];
            *(_DWORD *)buf = 138543874;
            uint64_t v21 = v15;
            __int16 v22 = 2114;
            id v23 = v16;
            __int16 v24 = 2114;
            id v25 = v9;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Clearing message: %{public}@", buf, 0x20u);
          }
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_100029B90;
          v18[3] = &unk_1001126D8;
          id v19 = v9;
          [(AMSDDeviceMessengerService *)self _enumerateDelegatesWithBlock:v18];
        }
      }
      while (v8 > 0);
    }
    if ([v6 count] != v17) {
      [(AMSDDeviceMessengerService *)self _overwriteSavedMessages:v6];
    }
  }
}

- (id)_getSavedMessages
{
  v2 = self;
  id v3 = [(AMSDDeviceMessengerService *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(AMSDDeviceMessengerService *)v2 cachedMessages];

  if (v4)
  {
    id v5 = [(AMSDDeviceMessengerService *)v2 cachedMessages];
    goto LABEL_32;
  }
  id v6 = +[NSFileManager defaultManager];
  id v7 = [(AMSDDeviceMessengerService *)v2 _saveLocation];
  uint64_t v8 = [v7 path];
  unsigned int v9 = [v6 fileExistsAtPath:v8];

  if (v9)
  {
    id v10 = [(AMSDDeviceMessengerService *)v2 _saveLocation];
    id v43 = 0;
    id v11 = +[NSData dataWithContentsOfURL:v10 options:0 error:&v43];
    id v12 = v43;

    if (!v12 && v11)
    {
      id v42 = 0;
      id v13 = +[NSJSONSerialization JSONObjectWithData:v11 options:0 error:&v42];
      id v12 = v42;
      if (!v12 && v13)
      {
        __int16 v34 = v11;
        int v14 = [(AMSDDeviceMessengerService *)v2 service];
        uint64_t v15 = objc_msgSend(v14, "amsa_allDevices");

        id v35 = objc_alloc_init((Class)NSMutableArray);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id obj = v13;
        id v16 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
        if (v16)
        {
          id v17 = v16;
          char v37 = 0;
          uint64_t v18 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v39 != v18) {
                objc_enumerationMutation(obj);
              }
              id v20 = [objc_alloc((Class)AMSXDMessage) initWithJSONDictionary:*(void *)(*((void *)&v38 + 1) + 8 * i)];
              uint64_t v21 = [v20 origin];
              __int16 v22 = [v21 identifier];
              id v23 = v2;
              id v24 = [(AMSDDeviceMessengerService *)v2 _determineDeviceTypeFromDeviceID:v22 devices:v15];
              id v25 = [v20 origin];
              [v25 setType:v24];

              if (v20 && ([v20 isExpired] & 1) == 0) {
                [v35 addObject:v20];
              }
              else {
                char v37 = 1;
              }
              v2 = v23;
            }
            id v17 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
          }
          while (v17);
        }
        else
        {
          char v37 = 0;
        }

        if (v37)
        {
          uint64_t v31 = +[AMSLogConfig sharedConfig];
          id v11 = v34;
          if (!v31)
          {
            uint64_t v31 = +[AMSLogConfig sharedConfig];
          }
          __int16 v32 = [v31 OSLogObject];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            uint64_t v33 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            uint64_t v45 = v33;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}@: Found invalid messages", buf, 0xCu);
          }

          uint64_t v29 = v35;
          [(AMSDDeviceMessengerService *)v2 _overwriteSavedMessages:v35];
          id v12 = 0;
        }
        else
        {
          id v12 = 0;
          id v11 = v34;
          uint64_t v29 = v35;
        }
        goto LABEL_29;
      }
    }
    if (v12)
    {
      id v26 = +[AMSLogConfig sharedConfig];
      if (!v26)
      {
        id v26 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v27 = [v26 OSLogObject];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        uint64_t v45 = v28;
        __int16 v46 = 2114;
        id v47 = v12;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch saved messages. Error: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v11 = 0;
    id v12 = 0;
  }
  uint64_t v29 = 0;
LABEL_29:
  if ([v29 count]) {
    [(AMSDDeviceMessengerService *)v2 setCachedMessages:v29];
  }
  id v5 = v29;

LABEL_32:
  return v5;
}

- (void)_overwriteSavedMessages:(id)a3
{
  id v4 = a3;
  id v36 = self;
  id v5 = [(AMSDDeviceMessengerService *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[AMSLogConfig sharedConfigOversize];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v45 = objc_opt_class();
    __int16 v46 = 2114;
    id v47 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@: Saving messages: %{public}@", buf, 0x16u);
  }

  id v35 = objc_alloc_init((Class)NSMutableArray);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if (([v13 isReply] & 1) == 0)
        {
          if ([v13 isExpired])
          {
            int v14 = +[AMSLogConfig sharedConfig];
            if (!v14)
            {
              int v14 = +[AMSLogConfig sharedConfig];
            }
            uint64_t v15 = [v14 OSLogObject];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v16 = objc_opt_class();
              id v17 = [v13 logKey];
              *(_DWORD *)buf = 138543874;
              uint64_t v45 = v16;
              __int16 v46 = 2114;
              id v47 = v17;
              __int16 v48 = 2114;
              v49 = v13;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Removing expired message: %{public}@", buf, 0x20u);
            }
            goto LABEL_22;
          }
          uint64_t v18 = [v13 identifier];
          id v19 = [v18 length];

          if (v19)
          {
            int v14 = [v13 JSONDictionary];
            [v35 addObject:v14];
          }
          else
          {
            int v14 = +[AMSLogConfig sharedConfig];
            if (!v14)
            {
              int v14 = +[AMSLogConfig sharedConfig];
            }
            uint64_t v15 = [v14 OSLogObject];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              uint64_t v20 = objc_opt_class();
              uint64_t v21 = [v13 logKey];
              *(_DWORD *)buf = 138543874;
              uint64_t v45 = v20;
              __int16 v46 = 2114;
              id v47 = v21;
              __int16 v48 = 2114;
              v49 = v13;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Removing message with empty identifier: %{public}@", buf, 0x20u);
            }
LABEL_22:
          }
          continue;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v10);
  }

  if ([v35 count])
  {
    if (!+[NSJSONSerialization isValidJSONObject:v35])
    {
      id v23 = +[AMSLogConfig sharedConfig];
      if (!v23)
      {
        id v23 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v30 = [v23 OSLogObject];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        uint64_t v45 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}@: Failed to save messages. (not JSON)", buf, 0xCu);
      }
      goto LABEL_47;
    }
    id v38 = 0;
    __int16 v22 = +[NSJSONSerialization dataWithJSONObject:v35 options:0 error:&v38];
    id v23 = v38;
    if (v22)
    {
      id v24 = [(AMSDDeviceMessengerService *)v36 _saveLocation];
      char v37 = v23;
      [v22 writeToURL:v24 options:0 error:&v37];
      id v25 = v23;
      id v23 = v37;
    }
    else
    {
      id v24 = +[AMSLogConfig sharedConfig];
      if (!v24)
      {
        id v24 = +[AMSLogConfig sharedConfig];
      }
      id v25 = [v24 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        uint64_t v45 = v32;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}@: Failed to save messages. (no JSONData)", buf, 0xCu);
      }
    }
  }
  else
  {
    id v26 = +[NSFileManager defaultManager];
    uint64_t v27 = [(AMSDDeviceMessengerService *)v36 _saveLocation];
    uint64_t v28 = [v27 path];
    unsigned int v29 = [v26 fileExistsAtPath:v28];

    if (!v29) {
      goto LABEL_48;
    }
    __int16 v22 = +[NSFileManager defaultManager];
    id v24 = [(AMSDDeviceMessengerService *)v36 _saveLocation];
    id v39 = 0;
    [v22 removeItemAtURL:v24 error:&v39];
    id v23 = v39;
  }

  if (v23)
  {
    uint64_t v30 = +[AMSLogConfig sharedConfig];
    if (!v30)
    {
      uint64_t v30 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v33 = [v30 OSLogObject];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v34;
      __int16 v46 = 2114;
      id v47 = v23;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%{public}@: Failed to save messages. Error: %{public}@", buf, 0x16u);
    }

LABEL_47:
  }
LABEL_48:
  [(AMSDDeviceMessengerService *)v36 setCachedMessages:0];
}

- (void)_saveMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSDDeviceMessengerService *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  if (!v4)
  {
    id v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      id v12 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = objc_opt_class();
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: No message to save", buf, 0xCu);
    }
    goto LABEL_13;
  }
  id v6 = [v4 identifier];
  id v7 = [v6 length];

  if (!v7)
  {
    id v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      id v12 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = [v4 logKey];
      *(_DWORD *)buf = 138543874;
      uint64_t v30 = v14;
      __int16 v31 = 2114;
      uint64_t v32 = v15;
      __int16 v33 = 2114;
      id v34 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Message is missing an identifier: %{public}@", buf, 0x20u);
    }
LABEL_13:

    goto LABEL_28;
  }
  uint64_t v8 = [(AMSDDeviceMessengerService *)self _getSavedMessages];
  id v9 = [v8 mutableCopy];
  id v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = objc_alloc_init((Class)NSMutableArray);
  }
  id v12 = v11;

  uint64_t v16 = [v4 identifier];

  if (v16)
  {
    id v17 = [v12 count];
    if ((uint64_t)v17 - 1 >= 0)
    {
      uint64_t v19 = (uint64_t)v17;
      *(void *)&long long v18 = 138543874;
      long long v28 = v18;
      while (1)
      {
        uint64_t v20 = objc_msgSend(v12, "objectAtIndexedSubscript:", --v19, v28);
        uint64_t v21 = [v20 identifier];
        if (![v21 length]) {
          goto LABEL_25;
        }
        __int16 v22 = [v20 identifier];
        id v23 = [v4 identifier];
        unsigned int v24 = [v22 isEqualToString:v23];

        if (v24) {
          break;
        }
LABEL_26:

        if (v19 <= 0) {
          goto LABEL_27;
        }
      }
      [v12 removeObjectAtIndex:v19];
      uint64_t v21 = +[AMSLogConfig sharedConfig];
      if (!v21)
      {
        uint64_t v21 = +[AMSLogConfig sharedConfig];
      }
      id v25 = [v21 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = objc_opt_class();
        uint64_t v27 = [v4 logKey];
        *(_DWORD *)buf = v28;
        uint64_t v30 = v26;
        __int16 v31 = 2114;
        uint64_t v32 = v27;
        __int16 v33 = 2114;
        id v34 = v20;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Removing duplicate message: %{public}@", buf, 0x20u);
      }
LABEL_25:

      goto LABEL_26;
    }
  }
LABEL_27:
  [v12 addObject:v4];
  [(AMSDDeviceMessengerService *)self _overwriteSavedMessages:v12];
LABEL_28:
}

- (id)_saveLocation
{
  v2 = +[NSURL ams_cachesDirectory];
  id v3 = [v2 URLByAppendingPathComponent:@"AMSXDMessages.json"];

  return v3;
}

- (NSArray)cachedMessages
{
  return self->_cachedMessages;
}

- (void)setCachedMessages:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (NSMutableArray)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
}

- (NSMutableDictionary)outgoingMessageReplyHandlers
{
  return self->_outgoingMessageReplyHandlers;
}

- (IDSService)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_outgoingMessageReplyHandlers, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_cachedMessages, 0);
}

@end