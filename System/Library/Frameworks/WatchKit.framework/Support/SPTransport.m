@interface SPTransport
+ (id)sharedInstance;
- (BOOL)_sendProtobuf:(id)a3 sender:(id)a4 timeOut:(double)a5 securityType:(int64_t)a6 retryExpiration:(id)a7 tryGeneration:(unint64_t)a8 withCompletion:(id)a9;
- (BOOL)canSend;
- (BOOL)handleDataProtectionSendFailureOrRetryFailureOnService:(id)a3 account:(id)a4 identifier:(id)a5 error:(id)a6;
- (BOOL)isWiFiEnabled;
- (BOOL)isWiFiRequiredForSize:(int64_t)a3;
- (BOOL)saveForPossibleResend:(id)a3;
- (BOOL)sendProtobuf:(id)a3 sender:(id)a4 timeOut:(double)a5 securityType:(int64_t)a6 withCompletion:(id)a7;
- (BOOL)wifiEnabled;
- (IDSService)insecureRemoteService;
- (IDSService)secureRemoteService;
- (NSMutableArray)retainedIDSMessageContexts;
- (NSMutableDictionary)messages;
- (NSString)outgoingMessageBlockedUntil;
- (OS_dispatch_queue)blockedOutgoingMessagesQueue;
- (OS_dispatch_queue)messagesAccessQueue;
- (OS_dispatch_queue)retainedIDSMessageContextsQueue;
- (OS_dispatch_queue)sendQueue;
- (OS_dispatch_source)wifiTimer;
- (SPTransport)init;
- (SPTransportDelegate)delegate;
- (id)serviceForTransport:(int64_t)a3;
- (int64_t)wifiThresholdCount;
- (void)_sendData:(id)a3 forApplication:(id)a4 idsPriority:(int64_t)a5 installer:(id)a6 withCompletion:(id)a7;
- (void)_sendPlist:(id)a3 timeOut:(double)a4 securityType:(int64_t)a5 retryExpiration:(id)a6 tryGeneration:(unint64_t)a7 withCompletion:(id)a8;
- (void)disableWiFiIfNeededForDataOfSize:(int64_t)a3;
- (void)enableWiFiIfNeededForDataOfSize:(int64_t)a3;
- (void)incomingInsecureProtobuf:(id)a3;
- (void)incomingProtobuf:(id)a3;
- (void)incomingSecureProtobuf:(id)a3;
- (void)keepWiFiAliveIfNeeded;
- (void)killWiFiTimer;
- (void)removeOutgoingMessageBlockIfIdentiferMatches:(id)a3 sendError:(id)a4;
- (void)sendData:(id)a3 forApplication:(id)a4 idsPriority:(int64_t)a5 installer:(id)a6 withCompletion:(id)a7;
- (void)sendPlist:(id)a3 timeOut:(double)a4 securityType:(int64_t)a5 withCompletion:(id)a6;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)serviceSpaceDidBecomeAvailable:(id)a3;
- (void)setBlockedOutgoingMessagesQueue:(id)a3;
- (void)setCanSend:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setInsecureRemoteService:(id)a3;
- (void)setMessages:(id)a3;
- (void)setMessagesAccessQueue:(id)a3;
- (void)setOutgoingMessageBlockedUntil:(id)a3;
- (void)setRetainedIDSMessageContexts:(id)a3;
- (void)setRetainedIDSMessageContextsQueue:(id)a3;
- (void)setSecureRemoteService:(id)a3;
- (void)setSendQueue:(id)a3;
- (void)setTransportDelegate:(id)a3;
- (void)setWifiEnabled:(BOOL)a3;
- (void)setWifiThresholdCount:(int64_t)a3;
- (void)setWifiTimer:(id)a3;
- (void)startWiFiTimer;
- (void)temporarilyRetainIDSMessageContext:(id)a3;
- (void)wifiTimeOut;
@end

@implementation SPTransport

+ (id)sharedInstance
{
  if (qword_100052578 != -1) {
    dispatch_once(&qword_100052578, &stru_100046030);
  }
  v2 = (void *)qword_100052580;

  return v2;
}

- (SPTransport)init
{
  v20.receiver = self;
  v20.super_class = (Class)SPTransport;
  v2 = [(SPTransport *)&v20 init];
  uint64_t v3 = +[NSMutableDictionary dictionaryWithCapacity:0];
  messages = v2->_messages;
  v2->_messages = (NSMutableDictionary *)v3;

  dispatch_queue_t v5 = dispatch_queue_create("com.apple.companionappd.transportMessagesAccess", 0);
  messagesAccessQueue = v2->_messagesAccessQueue;
  v2->_messagesAccessQueue = (OS_dispatch_queue *)v5;

  dispatch_queue_t v7 = dispatch_queue_create("com.apple.watchkit.transportSend", 0);
  sendQueue = v2->_sendQueue;
  v2->_sendQueue = (OS_dispatch_queue *)v7;

  id v9 = [objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.sockpuppet"];
  [(SPTransport *)v2 setSecureRemoteService:v9];

  id v10 = [objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.sockpuppet.classd"];
  [(SPTransport *)v2 setInsecureRemoteService:v10];

  v11 = [(SPTransport *)v2 secureRemoteService];
  [v11 setProtobufAction:"incomingSecureProtobuf:" forIncomingRequestsOfType:1];

  v12 = [(SPTransport *)v2 insecureRemoteService];
  [v12 setProtobufAction:"incomingInsecureProtobuf:" forIncomingRequestsOfType:1];

  v13 = [(SPTransport *)v2 secureRemoteService];
  [v13 addDelegate:v2 queue:&_dispatch_main_q];

  v14 = [(SPTransport *)v2 insecureRemoteService];
  [v14 addDelegate:v2 queue:&_dispatch_main_q];

  dispatch_queue_t v15 = dispatch_queue_create("com.apple.companionappd.retainedIDSMessageContexts", 0);
  retainedIDSMessageContextsQueue = v2->_retainedIDSMessageContextsQueue;
  v2->_retainedIDSMessageContextsQueue = (OS_dispatch_queue *)v15;

  uint64_t v17 = +[NSMutableArray array];
  retainedIDSMessageContexts = v2->_retainedIDSMessageContexts;
  v2->_retainedIDSMessageContexts = (NSMutableArray *)v17;

  *(_WORD *)&v2->_canSend = 1;
  return v2;
}

- (void)setTransportDelegate:(id)a3
{
}

- (void)enableWiFiIfNeededForDataOfSize:(int64_t)a3
{
  v4 = self;
  objc_sync_enter(v4);
  int64_t v5 = v4->_wifiThresholdCount + a3;
  v4->_wifiThresholdCount = v5;
  if (v5 >= 5242880 && !v4->_wifiEnabled)
  {
    v6 = wk_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136446466;
      id v10 = "-[SPTransport enableWiFiIfNeededForDataOfSize:]";
      __int16 v11 = 1024;
      int v12 = 106;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: we will try to use wifi", (uint8_t *)&v9, 0x12u);
    }

    dispatch_queue_t v7 = [(SPTransport *)v4 secureRemoteService];
    [v7 setPreferInfraWiFi:1];

    v8 = [(SPTransport *)v4 insecureRemoteService];
    [v8 setPreferInfraWiFi:1];

    v4->_wifiEnabled = 1;
  }
  objc_sync_exit(v4);
}

- (void)disableWiFiIfNeededForDataOfSize:(int64_t)a3
{
  v4 = self;
  objc_sync_enter(v4);
  unint64_t v5 = (v4->_wifiThresholdCount - a3) & ~((v4->_wifiThresholdCount - a3) >> 63);
  v4->_wifiThresholdCount = v5;
  if (v5 >> 20 <= 4 && v4->_wifiEnabled)
  {
    v6 = wk_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136446466;
      id v10 = "-[SPTransport disableWiFiIfNeededForDataOfSize:]";
      __int16 v11 = 1024;
      int v12 = 125;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: don't need wifi anymore", (uint8_t *)&v9, 0x12u);
    }

    dispatch_queue_t v7 = [(SPTransport *)v4 secureRemoteService];
    [v7 setPreferInfraWiFi:0];

    v8 = [(SPTransport *)v4 insecureRemoteService];
    [v8 setPreferInfraWiFi:0];

    [(SPTransport *)v4 killWiFiTimer];
    v4->_wifiEnabled = 0;
  }
  objc_sync_exit(v4);
}

- (BOOL)isWiFiEnabled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL wifiEnabled = v2->_wifiEnabled;
  objc_sync_exit(v2);

  return wifiEnabled;
}

- (BOOL)isWiFiRequiredForSize:(int64_t)a3
{
  v4 = self;
  objc_sync_enter(v4);
  LOBYTE(a3) = v4->_wifiThresholdCount + a3 > 5242880;
  objc_sync_exit(v4);

  return a3;
}

- (void)keepWiFiAliveIfNeeded
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_wifiEnabled) {
    [(SPTransport *)obj startWiFiTimer];
  }
  objc_sync_exit(obj);
}

- (void)startWiFiTimer
{
  wifiTimer = self->_wifiTimer;
  if (wifiTimer)
  {
    dispatch_source_cancel((dispatch_source_t)wifiTimer);
    v4 = self->_wifiTimer;
    self->_wifiTimer = 0;
  }
  unint64_t v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  v6 = self->_wifiTimer;
  self->_wifiTimer = v5;

  dispatch_queue_t v7 = self->_wifiTimer;
  dispatch_time_t v8 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer((dispatch_source_t)v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  int v9 = self->_wifiTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001F50C;
  handler[3] = &unk_1000447A0;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v9, handler);
  dispatch_resume((dispatch_object_t)self->_wifiTimer);
}

- (void)killWiFiTimer
{
  obj = self;
  objc_sync_enter(obj);
  wifiTimer = obj->_wifiTimer;
  if (wifiTimer)
  {
    dispatch_source_cancel(wifiTimer);
    uint64_t v3 = obj->_wifiTimer;
    obj->_wifiTimer = 0;
  }
  objc_sync_exit(obj);
}

- (void)wifiTimeOut
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (obj->_wifiEnabled)
  {
    uint64_t v3 = [(SPTransport *)obj secureRemoteService];
    [v3 setPreferInfraWiFi:0];

    v4 = [(SPTransport *)obj insecureRemoteService];
    [v4 setPreferInfraWiFi:0];

    v2 = obj;
    obj->_BOOL wifiEnabled = 0;
  }
  objc_sync_exit(v2);
}

- (void)sendPlist:(id)a3 timeOut:(double)a4 securityType:(int64_t)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  sendQueue = self->_sendQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F740;
  block[3] = &unk_100046058;
  block[4] = self;
  id v16 = v10;
  double v18 = a4;
  int64_t v19 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_sync((dispatch_queue_t)sendQueue, block);
}

- (void)_sendPlist:(id)a3 timeOut:(double)a4 securityType:(int64_t)a5 retryExpiration:(id)a6 tryGeneration:(unint64_t)a7 withCompletion:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = (void (**)(id, void *))a8;
  if (spUtils_isRunningInF201DemoMode())
  {
    CFStringRef v110 = @"error";
    id v17 = +[NSNull null];
    v111 = v17;
    double v18 = +[NSDictionary dictionaryWithObjects:&v111 forKeys:&v110 count:1];
    v16[2](v16, v18);

    goto LABEL_53;
  }
  if (a7)
  {
LABEL_4:
    if (!self->_canSend)
    {
      v28 = wk_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_10002B48C();
      }

      id v17 = +[SPError errorWithCode:14];
      CFStringRef v108 = @"error";
      v109 = v17;
      int64_t v19 = +[NSDictionary dictionaryWithObjects:&v109 forKeys:&v108 count:1];
      v16[2](v16, v19);
      goto LABEL_52;
    }
    if (!v14)
    {
      v29 = wk_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10002B50C();
      }

      id v17 = +[SPError errorWithCode:10];
      CFStringRef v106 = @"error";
      v107 = v17;
      int64_t v19 = +[NSDictionary dictionaryWithObjects:&v107 forKeys:&v106 count:1];
      v16[2](v16, v19);
      goto LABEL_52;
    }
    id v72 = 0;
    int64_t v19 = +[NSPropertyListSerialization dataWithPropertyList:v14 format:200 options:0 error:&v72];
    objc_super v20 = (SPTransport *)v72;
    if (v20)
    {
      id v17 = v20;
      v21 = wk_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10002B60C();
      }

      CFStringRef v104 = @"error";
      v105 = v17;
      v64 = +[NSDictionary dictionaryWithObjects:&v105 forKeys:&v104 count:1];
      v16[2](v16, v64);

      goto LABEL_52;
    }
    if (!v19)
    {
      v36 = wk_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_10002B58C();
      }

      id v17 = +[SPError errorWithCode:10];
      CFStringRef v102 = @"error";
      v103 = v17;
      v66 = +[NSDictionary dictionaryWithObjects:&v103 forKeys:&v102 count:1];
      v16[2](v16, v66);

      goto LABEL_52;
    }
    v30 = [v14 objectForKeyedSubscript:@"i"];
    if (!v30) {
      v30 = @"com.apple.companionappd";
    }
    v100[0] = @"action";
    v100[1] = @"application";
    v101[0] = @"sendPlist1";
    v101[1] = v30;
    v65 = v30;
    v100[2] = @"length";
    v31 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v19 length]);
    v101[2] = v31;
    v61 = +[NSDictionary dictionaryWithObjects:v101 forKeys:v100 count:3];

    v32 = +[SPPowerLog sharedInstance];
    [v32 logEvent:v61 withName:@"SP-transport"];

    v60 = +[NSSet setWithObject:v65];
    v98[0] = IDSSendMessageOptionEncryptPayloadKey;
    v98[1] = IDSSendMessageOptionForceLocalDeliveryKey;
    v99[0] = &__kCFBooleanTrue;
    v99[1] = &__kCFBooleanFalse;
    v98[2] = IDSSendMessageOptionDuetIdentifiersOverrideKey;
    v99[2] = v60;
    v33 = +[NSDictionary dictionaryWithObjects:v99 forKeys:v98 count:3];
    v34 = [(SPTransport *)self delegate];
    objc_msgSend(v34, "logDataSent:application:", objc_msgSend(v19, "length"), v65);

    if (IDSMaxMessageTimeout + -1.0 == a4)
    {
      id v62 = objc_msgSend(v33, "mutableCopy", IDSMaxMessageTimeout + -1.0);
      v35 = +[NSNumber numberWithDouble:a4];
      [v62 setObject:v35 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];
    }
    else
    {
      id v62 = v33;
    }
    v37 = [(SPTransport *)self serviceForTransport:a5];
    v63 = v37;
    if (v37)
    {
      v57 = [v37 accounts];
      v38 = [v57 anyObject];
      v39 = +[NSSet setWithObject:IDSDefaultPairedDevice];
      id v70 = 0;
      id v71 = 0;
      [v63 sendData:v19 fromAccount:v38 toDestinations:v39 priority:200 options:v62 identifier:&v71 error:&v70];
      id v59 = v71;
      id v17 = (SPTransport *)v70;

      v40 = wk_default_log();
      v41 = v40;
      if (v17)
      {
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v54 = [v63 accounts];
          v55 = [v54 anyObject];
          v56 = [v55 serviceName];
          *(_DWORD *)buf = 136447234;
          v87 = "-[SPTransport _sendPlist:timeOut:securityType:retryExpiration:tryGeneration:withCompletion:]";
          __int16 v88 = 1024;
          int v89 = 310;
          __int16 v90 = 2114;
          id v91 = v56;
          __int16 v92 = 2114;
          v93 = v65;
          __int16 v94 = 2114;
          v95 = v17;
          _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%{public}s:%d: sendPlist, Error - could not send data on service (%{public}@) for %{public}@ (%{public}@)", buf, 0x30u);
        }
        CFStringRef v84 = @"error";
        v85 = v17;
        id v42 = +[NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];
        v16[2](v16, v42);
        goto LABEL_51;
      }
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v44 = [(SPTransport *)self secureRemoteService];
        v87 = "-[SPTransport _sendPlist:timeOut:securityType:retryExpiration:tryGeneration:withCompletion:]";
        __int16 v88 = 1024;
        CFStringRef v45 = @"insecure";
        int v89 = 314;
        *(_DWORD *)buf = 136447234;
        if (v63 == v44) {
          CFStringRef v45 = @"secure";
        }
        __int16 v90 = 2114;
        id v91 = v59;
        __int16 v92 = 2114;
        v93 = v65;
        __int16 v94 = 2114;
        v95 = (void *)v45;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: sent message with identifier %{public}@ for %{public}@ on %{public}@ service", buf, 0x30u);
      }
      if ([(SPTransport *)self saveForPossibleResend:v63])
      {
        v46 = self;
        objc_sync_enter(v46);
        v47 = wk_default_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          v87 = "-[SPTransport _sendPlist:timeOut:securityType:retryExpiration:tryGeneration:withCompletion:]";
          __int16 v88 = 1024;
          int v89 = 320;
          __int16 v90 = 2114;
          id v91 = v59;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Blocking further sends until %{public}@ succeeds or fails", buf, 0x1Cu);
        }

        [(SPTransport *)v46 setOutgoingMessageBlockedUntil:v59];
        objc_sync_exit(v46);

        if (!v15)
        {
          id v15 = +[NSDate dateWithTimeIntervalSinceNow:20.0];
        }
        v83[0] = v59;
        v82[0] = @"id";
        v82[1] = @"completion";
        id v48 = [v16 copy];
        v83[1] = v48;
        v83[2] = v14;
        v82[2] = @"propertyList";
        v82[3] = @"timeOut";
        v58 = +[NSNumber numberWithDouble:a4];
        v83[3] = v58;
        v82[4] = @"securityType";
        v49 = +[NSNumber numberWithInteger:a5];
        v83[4] = v49;
        v83[5] = v15;
        v82[5] = @"retryExpiration";
        v82[6] = @"lastSendAttemptDate";
        v50 = +[NSDate date];
        v83[6] = v50;
        v82[7] = @"tryGeneration";
        v51 = +[NSNumber numberWithUnsignedInteger:a7];
        v83[7] = v51;
        v52 = +[NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:8];
      }
      else
      {
        v80[0] = @"id";
        v80[1] = @"completion";
        v81[0] = v59;
        id v48 = [v16 copy];
        v81[1] = v48;
        v52 = +[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];
      }

      messagesAccessQueue = self->_messagesAccessQueue;
      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = sub_100020550;
      v67[3] = &unk_100045560;
      v67[4] = self;
      id v68 = v52;
      id v59 = v59;
      id v69 = v59;
      id v42 = v52;
      dispatch_sync((dispatch_queue_t)messagesAccessQueue, v67);
    }
    else
    {
      CFStringRef v96 = @"error";
      id v42 = +[SPError errorWithCode:16];
      id v97 = v42;
      v43 = +[NSDictionary dictionaryWithObjects:&v97 forKeys:&v96 count:1];
      v16[2](v16, v43);

      id v59 = 0;
    }
    id v17 = 0;
LABEL_51:

LABEL_52:
    goto LABEL_53;
  }
  id v17 = self;
  objc_sync_enter(v17);
  v22 = [(SPTransport *)v17 outgoingMessageBlockedUntil];

  if (!v22)
  {
    objc_sync_exit(v17);

    goto LABEL_4;
  }
  v23 = wk_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = [(SPTransport *)v17 outgoingMessageBlockedUntil];
    *(_DWORD *)buf = 136446722;
    v87 = "-[SPTransport _sendPlist:timeOut:securityType:retryExpiration:tryGeneration:withCompletion:]";
    __int16 v88 = 1024;
    int v89 = 215;
    __int16 v90 = 2114;
    id v91 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Currently blocking outgoing messages on %{public}@", buf, 0x1Cu);
  }
  blockedOutgoingMessagesQueue = v17->_blockedOutgoingMessagesQueue;
  if (!blockedOutgoingMessagesQueue)
  {
    dispatch_queue_t v26 = dispatch_queue_create("com.apple.watchkit.blockedOutgoingMessage", 0);
    v27 = v17->_blockedOutgoingMessagesQueue;
    v17->_blockedOutgoingMessagesQueue = (OS_dispatch_queue *)v26;

    dispatch_suspend((dispatch_object_t)v17->_blockedOutgoingMessagesQueue);
    blockedOutgoingMessagesQueue = v17->_blockedOutgoingMessagesQueue;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020460;
  block[3] = &unk_100046080;
  block[4] = v17;
  id v74 = v14;
  double v77 = a4;
  int64_t v78 = a5;
  id v15 = v15;
  id v75 = v15;
  uint64_t v79 = 0;
  v76 = v16;
  dispatch_async(blockedOutgoingMessagesQueue, block);

  objc_sync_exit(v17);
LABEL_53:
}

- (void)sendData:(id)a3 forApplication:(id)a4 idsPriority:(int64_t)a5 installer:(id)a6 withCompletion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  sendQueue = self->_sendQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000206B8;
  v21[3] = &unk_1000460A8;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  int64_t v26 = a5;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_sync((dispatch_queue_t)sendQueue, v21);
}

- (void)_sendData:(id)a3 forApplication:(id)a4 idsPriority:(int64_t)a5 installer:(id)a6 withCompletion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = (void (**)(id, void *))a7;
  if (spUtils_isRunningInF201DemoMode())
  {
    CFStringRef v77 = @"error";
    id v14 = +[NSNull null];
    int64_t v78 = v14;
    id v15 = &v78;
    id v16 = &v77;
LABEL_13:
    v36 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v16 count:1];
    v13[2](v13, v36);

    goto LABEL_24;
  }
  if (!self->_canSend)
  {
    v35 = wk_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_10002B694();
    }

    id v14 = +[SPError errorWithCode:14];
    CFStringRef v75 = @"error";
    v76 = v14;
    id v15 = &v76;
    id v16 = &v75;
    goto LABEL_13;
  }
  if (v11)
  {
    v73[0] = @"action";
    v73[1] = @"application";
    v74[0] = @"sendData";
    v74[1] = v12;
    v73[2] = @"length";
    id v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 length]);
    v74[2] = v17;
    id v18 = +[NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:3];

    id v19 = +[SPPowerLog sharedInstance];
    [v19 logEvent:v18 withName:@"SP-transport"];

    v49 = +[NSString stringWithFormat:@"%@.installer", @"com.apple.companionappd"];
    uint64_t v20 = +[NSSet setWithObject:](NSSet, "setWithObject:");
    v71[0] = IDSSendMessageOptionEncryptPayloadKey;
    v71[1] = IDSSendMessageOptionForceLocalDeliveryKey;
    v72[0] = &__kCFBooleanFalse;
    v72[1] = &__kCFBooleanFalse;
    v72[2] = &__kCFBooleanTrue;
    v71[2] = IDSSendMessageOptionBypassDuetKey;
    v71[3] = IDSSendMessageOptionTimeoutKey;
    v21 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    v71[4] = IDSSendMessageOptionDuetIdentifiersOverrideKey;
    v72[3] = v21;
    v72[4] = v20;
    id v48 = (void *)v20;
    id v22 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:5];

    id v23 = [(SPTransport *)self serviceForTransport:1];
    id v24 = v23;
    if (v23)
    {
      v47 = v18;
      id v25 = [v23 accounts];
      int64_t v26 = [v25 anyObject];
      uint64_t v27 = +[NSSet setWithObject:IDSDefaultPairedDevice];
      v28 = v22;
      v29 = (void *)v27;
      id v53 = 0;
      id v54 = 0;
      v46 = v28;
      objc_msgSend(v24, "sendData:fromAccount:toDestinations:priority:options:identifier:error:", v11, v26, v27, a5, &v53);
      id v30 = v54;
      id v14 = v53;

      v31 = wk_default_log();
      v32 = v31;
      if (v14)
      {
        v33 = &CFBundleCopyLocalizationsForPreferences_ptr;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v43 = [v24 accounts];
          v44 = [v43 anyObject];
          CFStringRef v45 = [v44 serviceName];
          *(_DWORD *)buf = 136447234;
          v60 = "-[SPTransport _sendData:forApplication:idsPriority:installer:withCompletion:]";
          __int16 v61 = 1024;
          int v62 = 404;
          __int16 v63 = 2114;
          id v64 = v45;
          __int16 v65 = 2114;
          id v66 = v12;
          __int16 v67 = 2114;
          id v68 = v14;
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}s:%d: Error - could not send data on service (%{public}@) for %{public}@ (%{public}@)", buf, 0x30u);

          v33 = &CFBundleCopyLocalizationsForPreferences_ptr;
        }

        CFStringRef v57 = @"error";
        v58 = v14;
        id v34 = [v33[184] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        v13[2](v13, v34);
      }
      else
      {
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v38 = [(SPTransport *)self secureRemoteService];
          *(_DWORD *)buf = 136447234;
          v60 = "-[SPTransport _sendData:forApplication:idsPriority:installer:withCompletion:]";
          CFStringRef v39 = @"insecure";
          __int16 v61 = 1024;
          int v62 = 408;
          if (v24 == v38) {
            CFStringRef v39 = @"secure";
          }
          __int16 v63 = 2114;
          id v64 = v30;
          __int16 v65 = 2114;
          id v66 = v12;
          __int16 v67 = 2114;
          id v68 = (void *)v39;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: sent message with identifier %{public}@ for %{public}@ on %{public}@ service", buf, 0x30u);
        }
        v55[0] = @"id";
        v55[1] = @"completion";
        v56[0] = v30;
        id v40 = [v13 copy];
        v56[1] = v40;
        v41 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];

        messagesAccessQueue = self->_messagesAccessQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100020DB0;
        block[3] = &unk_100045560;
        block[4] = self;
        id v51 = v41;
        id v30 = v30;
        id v52 = v30;
        id v34 = v41;
        dispatch_sync((dispatch_queue_t)messagesAccessQueue, block);

        id v14 = 0;
      }
      id v22 = v46;
      id v18 = v47;
    }
    else
    {
      CFStringRef v69 = @"error";
      id v34 = +[SPError errorWithCode:16];
      id v70 = v34;
      v37 = +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      v13[2](v13, v37);

      id v30 = 0;
      id v14 = 0;
    }
  }
  else
  {
    id v14 = wk_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002B714();
    }
  }
LABEL_24:
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  sendQueue = self->_sendQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100020F28;
  v21[3] = &unk_1000460D0;
  BOOL v26 = a6;
  v21[4] = self;
  id v22 = v14;
  id v23 = v12;
  id v24 = v15;
  id v25 = v13;
  id v17 = v13;
  id v18 = v15;
  id v19 = v12;
  id v20 = v14;
  dispatch_async((dispatch_queue_t)sendQueue, v21);
}

- (void)serviceSpaceDidBecomeAvailable:(id)a3
{
  v4 = wk_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    v6 = "-[SPTransport serviceSpaceDidBecomeAvailable:]";
    __int16 v7 = 1024;
    int v8 = 467;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ", (uint8_t *)&v5, 0x12u);
  }

  self->_canSend = 1;
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = wk_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v16 outgoingResponseIdentifier];
    id v19 = [(SPTransport *)self secureRemoteService];
    CFStringRef v20 = @"insecure";
    v31 = "-[SPTransport service:account:incomingData:fromID:context:]";
    __int16 v32 = 1024;
    int v33 = 473;
    int v30 = 136446978;
    if (v19 == v12) {
      CFStringRef v20 = @"secure";
    }
    __int16 v34 = 2114;
    id v35 = v18;
    __int16 v36 = 2114;
    CFStringRef v37 = v20;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: received data msg with identifier %{public}@ on %{public}@ service", (uint8_t *)&v30, 0x26u);
  }
  if (v14)
  {
    id v21 = [(SPTransport *)self secureRemoteService];
    if (v21 == v12 && self->_delegate)
    {
      char v26 = objc_opt_respondsToSelector();

      if (v26) {
        [(SPTransportDelegate *)self->_delegate didReceiveSecureData];
      }
    }
    else
    {
    }
    if (self->_delegate)
    {
      id v22 = [(SPTransport *)self delegate];
      char v23 = objc_opt_respondsToSelector();

      if (v23)
      {
        id v24 = [(SPTransport *)self delegate];
        [v24 incomingData:v14];

        [(SPTransport *)self temporarilyRetainIDSMessageContext:v16];
      }
    }
  }
  else
  {
    id v25 = wk_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = [v12 accounts];
      v28 = [v27 anyObject];
      v29 = [v28 serviceName];
      int v30 = 136447490;
      v31 = "-[SPTransport service:account:incomingData:fromID:context:]";
      __int16 v32 = 1024;
      int v33 = 475;
      __int16 v34 = 2114;
      id v35 = v13;
      __int16 v36 = 2114;
      CFStringRef v37 = v29;
      __int16 v38 = 2114;
      id v39 = v15;
      __int16 v40 = 2114;
      id v41 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}s:%d: IDS incomingData == nil,  account: %{public}@, serviceName: %{public}@, fromID: %{public}@, context: %{public}@", (uint8_t *)&v30, 0x3Au);
    }
  }
}

- (BOOL)sendProtobuf:(id)a3 sender:(id)a4 timeOut:(double)a5 securityType:(int64_t)a6 withCompletion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  sendQueue = self->_sendQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021B9C;
  block[3] = &unk_1000460F8;
  id v23 = v14;
  id v24 = &v27;
  block[4] = self;
  id v21 = v12;
  double v25 = a5;
  int64_t v26 = a6;
  id v22 = v13;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_sync((dispatch_queue_t)sendQueue, block);
  LOBYTE(sendQueue) = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return (char)sendQueue;
}

- (BOOL)_sendProtobuf:(id)a3 sender:(id)a4 timeOut:(double)a5 securityType:(int64_t)a6 retryExpiration:(id)a7 tryGeneration:(unint64_t)a8 withCompletion:(id)a9
{
  id v16 = a3;
  id v17 = (__CFString *)a4;
  id v18 = a7;
  id v19 = (void (**)(id, void *))a9;
  if (spUtils_isRunningInF201DemoMode())
  {
    CFStringRef v109 = @"error";
    CFStringRef v20 = +[NSNull null];
    CFStringRef v110 = v20;
    id v21 = +[NSDictionary dictionaryWithObjects:&v110 forKeys:&v109 count:1];
    v19[2](v19, v21);

LABEL_3:
    BOOL v22 = 1;
    goto LABEL_50;
  }
  if (!a8)
  {
    CFStringRef v20 = self;
    objc_sync_enter(v20);
    double v25 = [(SPTransport *)v20 outgoingMessageBlockedUntil];

    if (v25)
    {
      int64_t v26 = wk_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = [(SPTransport *)v20 outgoingMessageBlockedUntil];
        *(_DWORD *)buf = 136446722;
        __int16 v92 = "-[SPTransport _sendProtobuf:sender:timeOut:securityType:retryExpiration:tryGeneration:withCompletion:]";
        __int16 v93 = 1024;
        int v94 = 512;
        __int16 v95 = 2114;
        id v96 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Currently blocking outgoing messages on %{public}@", buf, 0x1Cu);
      }
      blockedOutgoingMessagesQueue = v20->_blockedOutgoingMessagesQueue;
      if (!blockedOutgoingMessagesQueue)
      {
        dispatch_queue_t v29 = dispatch_queue_create("com.apple.watchkit.blockedOutgoingMessage", 0);
        char v30 = v20->_blockedOutgoingMessagesQueue;
        v20->_blockedOutgoingMessagesQueue = (OS_dispatch_queue *)v29;

        dispatch_suspend((dispatch_object_t)v20->_blockedOutgoingMessagesQueue);
        blockedOutgoingMessagesQueue = v20->_blockedOutgoingMessagesQueue;
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002285C;
      block[3] = &unk_100046120;
      block[4] = v20;
      id v78 = v16;
      id v17 = v17;
      uint64_t v79 = v17;
      double v82 = a5;
      int64_t v83 = a6;
      id v18 = v18;
      id v80 = v18;
      uint64_t v84 = 0;
      v81 = v19;
      dispatch_async(blockedOutgoingMessagesQueue, block);

      objc_sync_exit(v20);
      goto LABEL_3;
    }
    objc_sync_exit(v20);
  }
  if (self->_canSend)
  {
    int64_t v64 = a6;
    unsigned int v23 = [(__CFString *)v17 isEqualToString:@".XC"];
    if (v23)
    {
      id v24 = wk_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        __int16 v92 = "-[SPTransport _sendProtobuf:sender:timeOut:securityType:retryExpiration:tryGeneration:withCompletion:]";
        __int16 v93 = 1024;
        int v94 = 539;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: isXcodeCommand, setting IDSSendMessageOptionBypassDuetKey=YES", buf, 0x12u);
      }
    }
    else if (v17)
    {
      goto LABEL_21;
    }
    id v17 = @"com.apple.companionappd";
LABEL_21:
    v105[0] = @"action";
    v105[1] = @"application";
    v106[0] = @"sendPlist2";
    v106[1] = v17;
    v105[2] = @"length";
    __int16 v32 = [v16 uncompressedData];
    int v33 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v32 length]);
    v106[2] = v33;
    id v71 = +[NSDictionary dictionaryWithObjects:v106 forKeys:v105 count:3];

    __int16 v34 = +[SPPowerLog sharedInstance];
    [v34 logEvent:v71 withName:@"SP-transport"];

    __int16 v67 = +[NSSet setWithObject:v17];
    v103[0] = IDSSendMessageOptionEncryptPayloadKey;
    v103[1] = IDSSendMessageOptionForceLocalDeliveryKey;
    v104[0] = &__kCFBooleanTrue;
    v104[1] = &__kCFBooleanFalse;
    v103[2] = IDSSendMessageOptionDuetIdentifiersOverrideKey;
    v104[2] = v67;
    id v35 = +[NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:3];
    __int16 v36 = v35;
    if (v23)
    {
      id v37 = [v35 mutableCopy];
      [v37 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionBypassDuetKey];
    }
    else
    {
      id v37 = v35;
    }
    if (IDSMaxMessageTimeout + -1.0 == a5)
    {
      id v68 = objc_msgSend(v37, "mutableCopy", IDSMaxMessageTimeout + -1.0);
      __int16 v38 = +[NSNumber numberWithDouble:a5];
      [v68 setObject:v38 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];
    }
    else
    {
      id v68 = v37;
    }
    id v39 = wk_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      sub_10002B814(v16, v39);
    }

    __int16 v40 = [(SPTransport *)self delegate];
    id v41 = [v16 data];
    objc_msgSend(v40, "logDataSent:application:", objc_msgSend(v41, "length"), v17);

    id v42 = [(SPTransport *)self serviceForTransport:v64];
    CFStringRef v69 = v42;
    if (v42)
    {
      v43 = [v42 accounts];
      v44 = [v43 anyObject];
      CFStringRef v45 = +[NSSet setWithObject:IDSDefaultPairedDevice];
      id v75 = 0;
      id v76 = 0;
      [v69 sendProtobuf:v16 fromAccount:v44 toDestinations:v45 priority:200 options:v68 identifier:&v76 error:&v75];
      id v66 = v76;
      CFStringRef v20 = (SPTransport *)v75;

      v46 = wk_default_log();
      v47 = v46;
      if (!v20)
      {
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          v50 = [(SPTransport *)self secureRemoteService];
          __int16 v92 = "-[SPTransport _sendProtobuf:sender:timeOut:securityType:retryExpiration:tryGeneration:withCompletion:]";
          __int16 v93 = 1024;
          CFStringRef v51 = @"insecure";
          int v94 = 597;
          *(_DWORD *)buf = 136447234;
          if (v69 == v50) {
            CFStringRef v51 = @"secure";
          }
          __int16 v95 = 2114;
          id v96 = v66;
          __int16 v97 = 2114;
          v98 = v17;
          __int16 v99 = 2114;
          v100 = (void *)v51;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: sent message with identifier %{public}@ for %{public}@ on %{public}@ service", buf, 0x30u);
        }
        if ([(SPTransport *)self saveForPossibleResend:v69])
        {
          id v52 = self;
          objc_sync_enter(v52);
          id v53 = wk_default_log();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446722;
            __int16 v92 = "-[SPTransport _sendProtobuf:sender:timeOut:securityType:retryExpiration:tryGeneration:withCompletion:]";
            __int16 v93 = 1024;
            int v94 = 603;
            __int16 v95 = 2114;
            id v96 = v66;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Blocking further sends until %{public}@ succeeds or fails", buf, 0x1Cu);
          }

          [(SPTransport *)v52 setOutgoingMessageBlockedUntil:v66];
          objc_sync_exit(v52);

          if (!v18)
          {
            id v18 = +[NSDate dateWithTimeIntervalSinceNow:20.0];
          }
          v88[0] = v66;
          v87[0] = @"id";
          v87[1] = @"completion";
          id v54 = [v19 copy];
          v88[1] = v54;
          v87[2] = @"sender";
          v87[3] = @"protobuf";
          v88[2] = v17;
          v88[3] = v16;
          v87[4] = @"timeOut";
          __int16 v63 = +[NSNumber numberWithDouble:a5];
          v88[4] = v63;
          v87[5] = @"securityType";
          __int16 v65 = +[NSNumber numberWithInteger:v64];
          v88[5] = v65;
          v88[6] = v18;
          v87[6] = @"retryExpiration";
          v87[7] = @"lastSendAttemptDate";
          v55 = +[NSDate date];
          v88[7] = v55;
          v87[8] = @"tryGeneration";
          v56 = +[NSNumber numberWithUnsignedInteger:a8];
          v88[8] = v56;
          CFStringRef v57 = +[NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:9];
        }
        else
        {
          v85[0] = @"id";
          v85[1] = @"completion";
          v86[0] = v66;
          id v54 = [v19 copy];
          v86[1] = v54;
          CFStringRef v57 = +[NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:2];
        }

        messagesAccessQueue = self->_messagesAccessQueue;
        v72[0] = _NSConcreteStackBlock;
        v72[1] = 3221225472;
        v72[2] = sub_100022964;
        v72[3] = &unk_100045560;
        v72[4] = self;
        id v73 = v57;
        id v66 = v66;
        id v74 = v66;
        id v48 = v57;
        dispatch_sync((dispatch_queue_t)messagesAccessQueue, v72);

        CFStringRef v20 = 0;
        BOOL v22 = 1;
        goto LABEL_49;
      }
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v60 = [v69 accounts];
        __int16 v61 = [v60 anyObject];
        int v62 = [v61 serviceName];
        *(_DWORD *)buf = 136447234;
        __int16 v92 = "-[SPTransport _sendProtobuf:sender:timeOut:securityType:retryExpiration:tryGeneration:withCompletion:]";
        __int16 v93 = 1024;
        int v94 = 591;
        __int16 v95 = 2114;
        id v96 = v62;
        __int16 v97 = 2114;
        v98 = v17;
        __int16 v99 = 2114;
        v100 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%{public}s:%d: Error - could not send data on service (%{public}@) for %{public}@ (%{public}@)", buf, 0x30u);
      }
      CFStringRef v89 = @"error";
      __int16 v90 = v20;
      id v48 = +[NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
      v19[2](v19, v48);
    }
    else
    {
      CFStringRef v101 = @"error";
      id v48 = +[SPError errorWithCode:16];
      id v102 = v48;
      v49 = +[NSDictionary dictionaryWithObjects:&v102 forKeys:&v101 count:1];
      v19[2](v19, v49);

      CFStringRef v20 = 0;
      id v66 = 0;
    }
    BOOL v22 = 0;
LABEL_49:

    goto LABEL_50;
  }
  v31 = wk_default_log();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    sub_10002B794();
  }

  CFStringRef v20 = +[SPError errorWithCode:14];
  CFStringRef v107 = @"error";
  CFStringRef v108 = v20;
  id v70 = +[NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];
  v19[2](v19, v70);
  BOOL v22 = 0;

LABEL_50:
  return v22;
}

- (id)serviceForTransport:(int64_t)a3
{
  uint64_t v3 = self;
  if (a3 == 2)
  {
    int v5 = [(SPTransport *)self insecureRemoteService];

    if (!v5)
    {
      v6 = wk_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10002B9F8();
      }
      goto LABEL_16;
    }
LABEL_17:
    self = [(SPTransport *)v3 insecureRemoteService];
    goto LABEL_18;
  }
  if (a3 == 1)
  {
    if ([(SPTransportDelegate *)self->_delegate unlockedSinceBoot])
    {
LABEL_12:
      self = [(SPTransport *)v3 secureRemoteService];
      goto LABEL_18;
    }
    __int16 v7 = [(SPTransport *)v3 insecureRemoteService];

    if (!v7)
    {
      v6 = wk_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10002B978();
      }
LABEL_16:

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (a3) {
    goto LABEL_18;
  }
  if ([(SPTransportDelegate *)self->_delegate unlockedSinceBoot]) {
    goto LABEL_12;
  }
  v4 = wk_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10002B8F8();
  }

  self = 0;
LABEL_18:

  return self;
}

- (BOOL)saveForPossibleResend:(id)a3
{
  id v4 = a3;
  id v5 = [(SPTransport *)self secureRemoteService];
  if (v5 != v4)
  {

LABEL_7:
    BOOL v11 = 0;
    goto LABEL_8;
  }
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    goto LABEL_7;
  }
  __int16 v7 = [(SPTransportDelegate *)self->_delegate dateOfFirstUnlock];
  int v8 = v7;
  if (!v7 || ([v7 timeIntervalSinceNow], double v10 = v9, v9 <= -20.0))
  {

    goto LABEL_7;
  }
  id v13 = wk_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136446978;
    id v15 = "-[SPTransport saveForPossibleResend:]";
    __int16 v16 = 1024;
    int v17 = 676;
    __int16 v18 = 2048;
    double v19 = -v10;
    __int16 v20 = 2048;
    uint64_t v21 = 0x4034000000000000;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: First unlock was %1.0f seconds ago (less than %1.0f seconds), so saving for possible resend upon failure", (uint8_t *)&v14, 0x26u);
  }

  BOOL v11 = 1;
LABEL_8:

  return v11;
}

- (void)incomingSecureProtobuf:(id)a3
{
  id v4 = a3;
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
    [(SPTransportDelegate *)self->_delegate didReceiveSecureData];
  }
  id v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = [v4 context];
    __int16 v7 = [v6 outgoingResponseIdentifier];
    int v8 = 136446722;
    double v9 = "-[SPTransport incomingSecureProtobuf:]";
    __int16 v10 = 1024;
    int v11 = 690;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: received protobuf msg with identifier %{public}@ on secure service", (uint8_t *)&v8, 0x1Cu);
  }
  [(SPTransport *)self incomingProtobuf:v4];
}

- (void)incomingInsecureProtobuf:(id)a3
{
  id v4 = a3;
  id v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = [v4 context];
    __int16 v7 = [v6 outgoingResponseIdentifier];
    int v8 = 136446722;
    double v9 = "-[SPTransport incomingInsecureProtobuf:]";
    __int16 v10 = 1024;
    int v11 = 696;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: received protobuf msg with identifier %{public}@ on insecure service", (uint8_t *)&v8, 0x1Cu);
  }
  [(SPTransport *)self incomingProtobuf:v4];
}

- (void)incomingProtobuf:(id)a3
{
  id v4 = a3;
  id v5 = wk_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002BA78(v4, v5);
  }

  if (self->_delegate)
  {
    char v6 = [(SPTransport *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      int v8 = [(SPTransport *)self delegate];
      [v8 incomingProtobuf:v4];

      double v9 = [v4 context];
      [(SPTransport *)self temporarilyRetainIDSMessageContext:v9];
    }
  }
}

- (void)temporarilyRetainIDSMessageContext:(id)a3
{
  id v4 = a3;
  retainedIDSMessageContextsQueue = self->_retainedIDSMessageContextsQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100022FF8;
  v7[3] = &unk_1000447C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)retainedIDSMessageContextsQueue, v7);
}

- (BOOL)handleDataProtectionSendFailureOrRetryFailureOnService:(id)a3 account:(id)a4 identifier:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v37 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v47 = 0;
  id v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = sub_100021618;
  CFStringRef v51 = sub_100021628;
  id v52 = 0;
  messagesAccessQueue = self->_messagesAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000236C0;
  block[3] = &unk_100045A68;
  v46 = &v47;
  block[4] = self;
  id v14 = v11;
  id v45 = v14;
  dispatch_sync((dispatch_queue_t)messagesAccessQueue, block);
  id v15 = (void *)v48[5];
  if (v15)
  {
    __int16 v16 = v10;
    int v17 = [v15 objectForKeyedSubscript:@"protobuf"];

    __int16 v18 = [(id)v48[5] objectForKeyedSubscript:@"propertyList"];

    if (v17 != 0 || v18 != 0)
    {
      if ([v12 code] == (id)31)
      {
        double v19 = [v12 domain];
        unsigned int v20 = [v19 isEqualToString:IDSErrorDomain];
      }
      else
      {
        unsigned int v20 = 0;
      }
      BOOL v22 = [(id)v48[5] objectForKeyedSubscript:@"retryExpiration"];
      unsigned int v23 = +[NSDate date];
      __int16 v36 = v22;
      BOOL v21 = [v22 compare:v23] != (id)-1;

      if (!v21)
      {
        if (v20)
        {
          char v30 = wk_default_log();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            sub_10002BC80();
          }
        }
        else
        {
          char v30 = wk_default_log();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            sub_10002BD00();
          }
        }

        goto LABEL_32;
      }
      id v24 = [(id)v48[5] objectForKeyedSubscript:@"tryGeneration"];
      id v25 = [v24 unsignedLongValue];

      double v26 = 2.0;
      if (v25 == (id)1) {
        double v26 = 0.25;
      }
      if (v25) {
        double v27 = v26;
      }
      else {
        double v27 = 0.0;
      }
      v28 = self->_messagesAccessQueue;
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_10002372C;
      v42[3] = &unk_1000447C8;
      v42[4] = self;
      id v43 = v14;
      dispatch_sync((dispatch_queue_t)v28, v42);
      if (v20)
      {
        dispatch_queue_t v29 = wk_default_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          id v54 = "-[SPTransport handleDataProtectionSendFailureOrRetryFailureOnService:account:identifier:error:]";
          __int16 v55 = 1024;
          int v56 = 768;
          __int16 v57 = 2048;
          double v58 = v27;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Got data protection class send failure, but we've done first unlock. Will try again in %1.0f seconds", buf, 0x1Cu);
        }
      }
      else
      {
        dispatch_queue_t v29 = wk_default_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_10002BBE0();
        }
      }

      if (v17)
      {
        dispatch_time_t v31 = dispatch_time(0, (uint64_t)(v27 * 1000000000.0));
        sendQueue = self->_sendQueue;
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_100023780;
        v40[3] = &unk_100046148;
        v40[4] = self;
        v41[1] = &v47;
        int v33 = (id *)v41;
        v41[0] = v36;
        v41[2] = v25;
        __int16 v34 = v40;
      }
      else
      {
        if (!v18)
        {
LABEL_28:

LABEL_32:
          goto LABEL_33;
        }
        dispatch_time_t v31 = dispatch_time(0, (uint64_t)(v27 * 1000000000.0));
        sendQueue = self->_sendQueue;
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_1000238CC;
        v38[3] = &unk_100046148;
        v38[4] = self;
        v39[1] = &v47;
        int v33 = (id *)v39;
        v39[0] = v36;
        v39[2] = v25;
        __int16 v34 = v38;
      }
      dispatch_after(v31, (dispatch_queue_t)sendQueue, v34);

      goto LABEL_28;
    }
  }
  else
  {
    __int16 v16 = v10;
  }
  BOOL v21 = 0;
LABEL_33:

  _Block_object_dispose(&v47, 8);
  return v21;
}

- (void)removeOutgoingMessageBlockIfIdentiferMatches:(id)a3 sendError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  double v9 = [(SPTransport *)v8 outgoingMessageBlockedUntil];
  unsigned int v10 = [v9 isEqualToString:v6];

  if (v10)
  {
    id v11 = wk_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (v7)
      {
        id v12 = +[NSString stringWithFormat:@"failed with error %@", v7];
      }
      else
      {
        id v12 = @"succeeded";
      }
      *(_DWORD *)buf = 136446978;
      int v17 = "-[SPTransport removeOutgoingMessageBlockIfIdentiferMatches:sendError:]";
      __int16 v18 = 1024;
      int v19 = 791;
      __int16 v20 = 2114;
      id v21 = v6;
      __int16 v22 = 2114;
      unsigned int v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: we were blocked on %{public}@ and it %{public}@. unblocking", buf, 0x26u);
      if (v7) {
    }
      }
    if (v8->_blockedOutgoingMessagesQueue)
    {
      id v13 = wk_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        int v17 = "-[SPTransport removeOutgoingMessageBlockIfIdentiferMatches:sendError:]";
        __int16 v18 = 1024;
        int v19 = 793;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: flushing _blockedOutgoingMessagesQueue", buf, 0x12u);
      }

      blockedOutgoingMessagesQueue = v8->_blockedOutgoingMessagesQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100023C60;
      block[3] = &unk_1000447A0;
      block[4] = v8;
      dispatch_async(blockedOutgoingMessagesQueue, block);
      dispatch_resume((dispatch_object_t)v8->_blockedOutgoingMessagesQueue);
    }
    [(SPTransport *)v8 setOutgoingMessageBlockedUntil:0];
  }
  objc_sync_exit(v8);
}

- (IDSService)secureRemoteService
{
  return (IDSService *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSecureRemoteService:(id)a3
{
}

- (IDSService)insecureRemoteService
{
  return (IDSService *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInsecureRemoteService:(id)a3
{
}

- (SPTransportDelegate)delegate
{
  return (SPTransportDelegate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)messages
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMessages:(id)a3
{
}

- (OS_dispatch_queue)messagesAccessQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMessagesAccessQueue:(id)a3
{
}

- (BOOL)canSend
{
  return self->_canSend;
}

- (void)setCanSend:(BOOL)a3
{
  self->_canSend = a3;
}

- (int64_t)wifiThresholdCount
{
  return self->_wifiThresholdCount;
}

- (void)setWifiThresholdCount:(int64_t)a3
{
  self->_wifiThresholdCount = a3;
}

- (BOOL)wifiEnabled
{
  return self->_wifiEnabled;
}

- (void)setWifiEnabled:(BOOL)a3
{
  self->_BOOL wifiEnabled = a3;
}

- (OS_dispatch_source)wifiTimer
{
  return self->_wifiTimer;
}

- (void)setWifiTimer:(id)a3
{
}

- (OS_dispatch_queue)retainedIDSMessageContextsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRetainedIDSMessageContextsQueue:(id)a3
{
}

- (NSMutableArray)retainedIDSMessageContexts
{
  return self->_retainedIDSMessageContexts;
}

- (void)setRetainedIDSMessageContexts:(id)a3
{
}

- (NSString)outgoingMessageBlockedUntil
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOutgoingMessageBlockedUntil:(id)a3
{
}

- (OS_dispatch_queue)blockedOutgoingMessagesQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBlockedOutgoingMessagesQueue:(id)a3
{
}

- (OS_dispatch_queue)sendQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSendQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendQueue, 0);
  objc_storeStrong((id *)&self->_blockedOutgoingMessagesQueue, 0);
  objc_storeStrong((id *)&self->_outgoingMessageBlockedUntil, 0);
  objc_storeStrong((id *)&self->_retainedIDSMessageContexts, 0);
  objc_storeStrong((id *)&self->_retainedIDSMessageContextsQueue, 0);
  objc_storeStrong((id *)&self->_wifiTimer, 0);
  objc_storeStrong((id *)&self->_messagesAccessQueue, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_insecureRemoteService, 0);

  objc_storeStrong((id *)&self->_secureRemoteService, 0);
}

@end