@interface ADCompanionRoutingPhoneService
+ (id)_contactForCall:(id)a3;
+ (id)_incomingCallTypeForService:(int)a3;
+ (id)_personAttributeForCall:(id)a3;
+ (id)_personForCall:(id)a3;
- (ADCompanionRoutingPhoneService)init;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (id)_hangUpCurrentCall;
- (id)commandsForDomain:(id)a3;
- (id)domains;
- (void)_addTimer:(id)a3;
- (void)_answerHandler:(id)a3 completion:(id)a4;
- (void)_handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
- (void)_hangUpHandler:(id)a3 completion:(id)a4;
- (void)_incomingCallSearchHandler:(id)a3 completion:(id)a4;
- (void)_removeTimer:(id)a3;
- (void)_unhandledCommand:(id)a3 completion:(id)a4;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6;
@end

@implementation ADCompanionRoutingPhoneService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdogTimers, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)_removeTimer:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v5 = v7;
  if (v7)
  {
    [(NSMutableSet *)self->_watchdogTimers removeObject:v7];
    id v4 = [(NSMutableSet *)self->_watchdogTimers count];
    id v5 = v7;
    if (!v4)
    {
      watchdogTimers = self->_watchdogTimers;
      self->_watchdogTimers = 0;

      id v5 = v7;
    }
  }
  _objc_release_x1(v4, v5);
}

- (void)_addTimer:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v5 = v9;
  if (v9)
  {
    watchdogTimers = self->_watchdogTimers;
    if (!watchdogTimers)
    {
      id v7 = (NSMutableSet *)objc_opt_new();
      v8 = self->_watchdogTimers;
      self->_watchdogTimers = v7;

      watchdogTimers = self->_watchdogTimers;
    }
    id v4 = [(NSMutableSet *)watchdogTimers addObject:v9];
    id v5 = v9;
  }
  _objc_release_x1(v4, v5);
}

- (void)_handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void, void *))a6;
  v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v29 = "-[ADCompanionRoutingPhoneService _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
    __int16 v30 = 2112;
    id v31 = v12;
    __int16 v32 = 2112;
    id v33 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s deviceIdentifier = %@, messageType = %@", buf, 0x20u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([v11 isEqualToString:@"phone"])
  {
    v15 = [v10 objectForKey:@"cmd"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v17 = AFSiriLogContextDaemon;
    BOOL v18 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR);
    if ((isKindOfClass & 1) == 0)
    {
      if (v18)
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[ADCompanionRoutingPhoneService _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Received message with malformed command", buf, 0xCu);
        if (!v13) {
          goto LABEL_21;
        }
      }
      else if (!v13)
      {
        goto LABEL_21;
      }
      uint64_t v24 = 11;
LABEL_19:
      v20 = +[AFError errorWithCode:v24];
      v13[2](v13, 0, v20);
LABEL_20:

      goto LABEL_21;
    }
    if (v18)
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[ADCompanionRoutingPhoneService _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
      __int16 v30 = 2112;
      id v31 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Received command: %@", buf, 0x16u);
    }
    if ([v15 isEqualToString:@"hangup"])
    {
      v19 = [(ADCompanionRoutingPhoneService *)self _hangUpCurrentCall];
      v20 = v19;
      if (v13)
      {
        v21 = objc_msgSend(v19, "dictionary", @"response");
        v27 = v21;
        v22 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        ((void (**)(id, void *, void *))v13)[2](v13, v22, 0);
      }
      goto LABEL_20;
    }
    v25 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[ADCompanionRoutingPhoneService _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s Received message with unrecognized command", buf, 0xCu);
      if (!v13) {
        goto LABEL_21;
      }
      goto LABEL_18;
    }
    if (v13)
    {
LABEL_18:
      uint64_t v24 = 1004;
      goto LABEL_19;
    }
LABEL_21:

    goto LABEL_22;
  }
  v23 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[ADCompanionRoutingPhoneService _handleMessage:messageType:fromDeviceWithIdentifier:completion:]";
    __int16 v30 = 2112;
    id v31 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s Received message with unknown message type: %@", buf, 0x16u);
    if (!v13) {
      goto LABEL_22;
    }
    goto LABEL_12;
  }
  if (v13)
  {
LABEL_12:
    v15 = +[AFError errorWithCode:1004];
    v13[2](v13, 0, v15);
    goto LABEL_21;
  }
LABEL_22:
}

- (void)handleMessage:(id)a3 messageType:(id)a4 fromDeviceWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022A22C;
  block[3] = &unk_10050D3F0;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(serialQueue, block);
}

- (void)_unhandledCommand:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = [objc_alloc((Class)SACommandFailed) initWithReason:@"Command not supported"];
    (*((void (**)(id, id, void))a4 + 2))(v5, v6, 0);
  }
}

- (void)_incomingCallSearchHandler:(id)a3 completion:(id)a4
{
  v25 = (void (**)(id, id, void))a4;
  id v24 = objc_alloc_init((Class)SAPhoneIncomingCallSearchCompleted);
  id v23 = +[TUCallCenter callCenterWithQueue:self->_serialQueue];
  id v5 = [v23 audioAndVideoCallsWithStatus:4];
  id v6 = +[NSMutableArray array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  uint64_t v26 = v6;
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v12 = objc_alloc_init((Class)SAPhoneIncomingCallSearchResult);
        id v13 = objc_msgSend((id)objc_opt_class(), "_incomingCallTypeForService:", objc_msgSend(v11, "service"));
        [v12 setIncomingCallType:v13];

        v14 = [(id)objc_opt_class() _personAttributeForCall:v11];
        id v15 = [v14 object];
        id v16 = v15;
        if (v15)
        {
          id v17 = [v15 phones];
          id v18 = [v17 firstObject];

          if (v18)
          {
            v19 = [v18 number];
            [v14 setData:v19];

            [v14 setTypedData:v18];
          }
          else
          {
            id v20 = [v16 emails];
            id v21 = [v20 firstObject];

            if (v21)
            {
              id v22 = [v21 emailAddress];
              [v14 setData:v22];

              [v14 setTypedData:v21];
            }

            id v6 = v26;
          }
        }
        [v12 setCaller:v14];
        [v6 addObject:v12];
      }
      id v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v8);
  }

  [v24 setIncomingCallSearchResults:v6];
  if (v25) {
    v25[2](v25, v24, 0);
  }
}

- (id)_hangUpCurrentCall
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[ADCompanionRoutingPhoneService _hangUpCurrentCall]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v4 = +[TUCallCenter callCenterWithQueue:self->_serialQueue];
  id v5 = [v4 audioOrVideoCallWithStatus:3];
  id v6 = [v4 audioAndVideoCallsWithStatus:4];
  id v7 = [v4 audioAndVideoCallsWithStatus:1];
  id v8 = [v4 audioAndVideoCallsWithStatus:2];
  if (v5)
  {
    [v4 disconnectCurrentCallAndActivateHeld];
    id v9 = objc_alloc_init((Class)SAPhoneHangUpResponse);
    [v9 setPhoneHangUpCallType:SAPhoneHangUpCallTypeOUTGOINGValue];
    id v10 = [v4 callsWithStatus:1];
    objc_msgSend(v9, "setActiveCallRemaining:", objc_msgSend(v10, "count") != 0);

    id v11 = (void *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_23;
    }
    id v12 = v11;
    unsigned int v13 = [v9 activeCallRemaining];
    *(_DWORD *)buf = 136315394;
    v37 = "-[ADCompanionRoutingPhoneService _hangUpCurrentCall]";
    __int16 v38 = 1024;
    unsigned int v39 = v13;
    v14 = "%s Outgoing call hung up. Active call remains: %d";
    goto LABEL_22;
  }
  if ([v6 count])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v15 = v6;
    id v16 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v32;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(v4, "disconnectCall:withReason:", *(void *)(*((void *)&v31 + 1) + 8 * i), 2, (void)v31);
        }
        id v17 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v17);
    }

    id v9 = objc_alloc_init((Class)SAPhoneHangUpResponse);
    [v9 setPhoneHangUpCallType:SAPhoneHangUpCallTypeINCOMINGValue];
    id v20 = [v4 callsWithStatus:1];
    objc_msgSend(v9, "setActiveCallRemaining:", objc_msgSend(v20, "count") != 0);

    id v21 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v12 = v21;
      unsigned int v22 = [v9 activeCallRemaining];
      *(_DWORD *)buf = 136315394;
      v37 = "-[ADCompanionRoutingPhoneService _hangUpCurrentCall]";
      __int16 v38 = 1024;
      unsigned int v39 = v22;
      v14 = "%s Outgoing call hung up. Active call remains: %d";
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v14, buf, 0x12u);
    }
  }
  else
  {
    if ([v7 count])
    {
      [v4 disconnectCurrentCallAndActivateHeld];
      id v9 = objc_alloc_init((Class)SAPhoneHangUpResponse);
      [v9 setPhoneHangUpCallType:SAPhoneHangUpCallTypeACTIVEValue];
      id v23 = [v4 callsWithStatus:1];
      objc_msgSend(v9, "setActiveCallRemaining:", objc_msgSend(v23, "count") != 0);

      id v24 = (void *)AFSiriLogContextDaemon;
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
        goto LABEL_23;
      }
      id v12 = v24;
      unsigned int v25 = [v9 activeCallRemaining];
      *(_DWORD *)buf = 136315394;
      v37 = "-[ADCompanionRoutingPhoneService _hangUpCurrentCall]";
      __int16 v38 = 1024;
      unsigned int v39 = v25;
      v14 = "%s Active call hung up. Active call remains: %d";
      goto LABEL_22;
    }
    if ([v8 count])
    {
      [v4 disconnectCurrentCallAndActivateHeld];
      id v9 = objc_alloc_init((Class)SAPhoneHangUpResponse);
      [v9 setPhoneHangUpCallType:SAPhoneHangUpCallTypeHELDValue];
      uint64_t v26 = [v4 callsWithStatus:1];
      objc_msgSend(v9, "setActiveCallRemaining:", objc_msgSend(v26, "count") != 0);

      v27 = (void *)AFSiriLogContextDaemon;
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
        goto LABEL_23;
      }
      id v12 = v27;
      unsigned int v28 = [v9 activeCallRemaining];
      *(_DWORD *)buf = 136315394;
      v37 = "-[ADCompanionRoutingPhoneService _hangUpCurrentCall]";
      __int16 v38 = 1024;
      unsigned int v39 = v28;
      v14 = "%s Held call hung up. Active call remains: %d";
      goto LABEL_22;
    }
    long long v30 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[ADCompanionRoutingPhoneService _hangUpCurrentCall]";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%s No calls exist. Returning failure", buf, 0xCu);
    }
    id v9 = [objc_alloc((Class)SACommandFailed) initWithReason:@"No call to hang up"];
  }
LABEL_23:

  return v9;
}

- (void)_hangUpHandler:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ADCompanionRoutingPhoneService *)self _hangUpCurrentCall];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[ADCompanionRoutingPhoneService _hangUpHandler:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Attempting to message Stereo Partner...", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v31 = 0x3042000000;
    long long v32 = sub_10022AE8C;
    long long v33 = sub_10022AE98;
    id v34 = 0;
    id v10 = objc_alloc((Class)AFWatchdogTimer);
    serialQueue = self->_serialQueue;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10022AEA0;
    v22[3] = &unk_100507678;
    id v23 = v6;
    id v24 = self;
    p_long long buf = &buf;
    id v12 = v7;
    id v26 = v12;
    id v13 = v8;
    id v25 = v13;
    id v14 = [v10 initWithTimeoutInterval:serialQueue onQueue:v22 timeoutHandler:10.0];
    objc_storeWeak((id *)(*((void *)&buf + 1) + 40), v14);
    [(ADCompanionRoutingPhoneService *)self _addTimer:v14];
    [v14 start];
    id v15 = +[ADCompanionService sharedInstance];
    CFStringRef v28 = @"cmd";
    CFStringRef v29 = @"hangup";
    id v16 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10022AFAC;
    v18[3] = &unk_100507B88;
    v18[4] = self;
    id v17 = v14;
    id v19 = v17;
    id v20 = v13;
    id v21 = v12;
    [v15 sendStereoPartnerMessage:v16 messageType:@"phone" completion:v18];

    _Block_object_dispose(&buf, 8);
    objc_destroyWeak(&v34);
  }
  else if (v7)
  {
    (*((void (**)(id, void *, void))v7 + 2))(v7, v8, 0);
  }
}

- (void)_answerHandler:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, id, void))a4;
  id v6 = +[TUCallCenter callCenterWithQueue:self->_serialQueue];
  id v7 = [v6 incomingCall];
  if (v7)
  {
    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      id v13 = "-[ADCompanionRoutingPhoneService _answerHandler:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s An incoming call exists. Answering it and returning success", (uint8_t *)&v12, 0xCu);
    }
    [v6 answerCall:v7];
    id v9 = objc_alloc_init((Class)SACommandSucceeded);
    if (v5) {
      goto LABEL_5;
    }
  }
  else
  {
    id v9 = objc_alloc_init((Class)SACommandFailed);
    id v10 = [v6 incomingVideoCall];

    if (v10)
    {
      [v9 setErrorCode:SAPhoneAnswerVideoCallErrorCode];
      CFStringRef v11 = @"Unable to answer video calls";
    }
    else
    {
      CFStringRef v11 = @"No call to answer";
    }
    [v9 setReason:v11];
    if (v5) {
LABEL_5:
    }
      v5[2](v5, v9, 0);
  }
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  id v10 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    CFStringRef v11 = v10;
    int v12 = [v8 encodedClassName];
    id v13 = [v8 groupIdentifier];
    *(_DWORD *)long long buf = 136315650;
    unsigned int v22 = "-[ADCompanionRoutingPhoneService handleCommand:forDomain:executionContext:reply:]";
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 2112;
    id v26 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Handling command (%@) for domain (%@)", buf, 0x20u);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022B680;
  block[3] = &unk_10050E1D8;
  id v18 = v8;
  id v19 = self;
  id v20 = v9;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(serialQueue, block);
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  return 1;
}

- (id)commandsForDomain:(id)a3
{
  if ([a3 isEqualToString:SAPhoneGroupIdentifier])
  {
    v5[0] = SAPhoneAnswerClassIdentifier;
    v5[1] = SAPhoneHangUpClassIdentifier;
    v5[2] = SAPhoneIncomingCallSearchClassIdentifier;
    v3 = +[NSArray arrayWithObjects:v5 count:3];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)domains
{
  uint64_t v4 = SAPhoneGroupIdentifier;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];
  return v2;
}

- (ADCompanionRoutingPhoneService)init
{
  v10.receiver = self;
  v10.super_class = (Class)ADCompanionRoutingPhoneService;
  v2 = [(ADCompanionRoutingPhoneService *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("Local Phone Service Queue", v3);

    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    [(ADService *)v2 setIdentifier:v7];

    id v8 = +[ADCompanionService sharedInstance];
    [v8 setMessageHandler:v2 forMessageType:@"phone"];
  }
  return v2;
}

+ (id)_contactForCall:(id)a3
{
  id v3 = a3;
  dispatch_queue_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 displayContext];
    id v6 = [v5 personNameComponents];

    if (v6)
    {
      id v7 = objc_alloc_init((Class)CNMutableContact);
      id v8 = [v6 namePrefix];
      [v7 setNamePrefix:v8];

      id v9 = [v6 givenName];
      [v7 setGivenName:v9];

      objc_super v10 = [v6 middleName];
      [v7 setMiddleName:v10];

      CFStringRef v11 = [v6 familyName];
      [v7 setFamilyName:v11];

      int v12 = [v6 nameSuffix];
      [v7 setNameSuffix:v12];

      id v13 = [v6 nickname];
      [v7 setNickname:v13];

      id v14 = [v6 phoneticRepresentation];
      id v15 = [v14 givenName];
      [v7 setPhoneticGivenName:v15];

      id v16 = [v14 middleName];
      [v7 setPhoneticMiddleName:v16];

      id v17 = [v14 familyName];
      [v7 setPhoneticFamilyName:v17];
    }
    else
    {
      id v7 = 0;
    }
    id v18 = [v4 displayContext];
    id v19 = [v18 companyName];

    if ([v19 length])
    {
      if (!v7) {
        id v7 = objc_alloc_init((Class)CNMutableContact);
      }
      [v7 setOrganizationName:v19];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)_personForCall:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    id v8 = 0;
    goto LABEL_18;
  }
  id v6 = [v4 contactIdentifier];
  id v7 = [v6 length];

  if (v7)
  {
    id v8 = objc_alloc_init((Class)SAPerson);
    id v9 = [v5 contactIdentifier];
    [v8 setInternalGUID:v9];

    objc_super v10 = [v5 displayContext];
    CFStringRef v11 = [v10 personNameComponents];

    int v12 = [v11 namePrefix];
    [v8 setPrefix:v12];

    id v13 = [v11 givenName];
    [v8 setFirstName:v13];

    id v14 = [v11 middleName];
    [v8 setMiddleName:v14];

    id v15 = [v11 familyName];
    [v8 setLastName:v15];

    id v16 = [v11 nameSuffix];
    [v8 setSuffix:v16];

    id v17 = [v11 nickname];
    [v8 setNickName:v17];

    id v18 = [v11 phoneticRepresentation];
    id v19 = [v18 givenName];
    [v8 setFirstNamePhonetic:v19];

    id v20 = [v18 familyName];
    [v8 setLastNamePhonetic:v20];

    id v21 = [v5 displayContext];
    unsigned int v22 = [v21 companyName];
    [v8 setCompany:v22];

    __int16 v23 = [a1 _contactForCall:v5];
    if (v23)
    {
      id v24 = +[CNContactFormatter stringFromContact:v23 style:0];
      [v8 setFullName:v24];
    }
  }
  else
  {
    id v8 = 0;
  }
  __int16 v25 = [v5 handle];
  unint64_t v26 = (unint64_t)[v25 type];
  v27 = [v25 value];
  if ([v27 length] && (v26 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (!v8) {
      id v8 = objc_alloc_init((Class)SAPerson);
    }
    if (v26 == 3)
    {
      id v28 = objc_alloc_init((Class)SAEmail);
      [v28 setEmailAddress:v27];
      id v31 = v28;
      CFStringRef v29 = +[NSArray arrayWithObjects:&v31 count:1];
      [v8 setEmails:v29];
      goto LABEL_16;
    }
    if (v26 == 2)
    {
      id v28 = objc_alloc_init((Class)SAPhone);
      [v28 setNumber:v27];
      id v32 = v28;
      CFStringRef v29 = +[NSArray arrayWithObjects:&v32 count:1];
      [v8 setPhones:v29];
LABEL_16:
    }
  }

LABEL_18:
  return v8;
}

+ (id)_personAttributeForCall:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc_init((Class)SAPersonAttribute);
    id v5 = [(id)objc_opt_class() _personForCall:v3];
    [v4 setObject:v5];
    id v6 = [v3 displayContext];

    id v7 = [v6 name];
    [v4 setDisplayText:v7];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)_incomingCallTypeForService:(int)a3
{
  if ((a3 - 1) > 2) {
    id v3 = (id *)&SAPhoneIncomingCallTypeUNKNOWNValue;
  }
  else {
    id v3 = (id *)*(&off_100507698 + (a3 - 1));
  }
  id v4 = *v3;
  return v4;
}

@end