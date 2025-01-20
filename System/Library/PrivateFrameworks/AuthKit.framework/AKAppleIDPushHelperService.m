@interface AKAppleIDPushHelperService
+ (id)sharedService;
- (AKAppleIDPushHelperService)init;
- (BOOL)_canProceedWithArmingForMessage:(id)a3 account:(id)a4;
- (BOOL)_isPrimaryAccount:(id)a3;
- (BOOL)_messageSupportsAlerts:(id)a3;
- (BOOL)_queryDelegatesForSuppressAction:(id)a3;
- (BOOL)_shouldProcessPushMessage:(id)a3 withAccount:(id)a4;
- (NSString)activeCode;
- (id)_akPCSAuthPushHandler;
- (id)_publicAPSToken;
- (id)_pushCommandsPostingCFUserNotification;
- (id)publicAPSTokenString;
- (void)_armDeviceWithMessage:(id)a3 account:(id)a4 notificationResult:(unint64_t)a5;
- (void)_ensureDesiredAPSEnvironmentIsInUse:(id)a3;
- (void)_generateLoginCodeForAccount:(id)a3 withIncomingMessage:(id)a4;
- (void)_notifyDelegatesOfMessageActivation:(id)a3 result:(unint64_t)a4;
- (void)_notifyDelegatesOfMessageActivation:(id)a3 result:(unint64_t)a4 payload:(id)a5;
- (void)_performCommandForMessage:(id)a3 forAccount:(id)a4;
- (void)_processMessageWithDelegates:(id)a3;
- (void)_startPasswordResetFlowForAccount:(id)a3;
- (void)_unsafe_presentMessage:(id)a3 forAccount:(id)a4;
- (void)_unsafe_processPushMessage:(id)a3;
- (void)_unsafe_showLoginNotificationWithCode:(id)a3 incomingMessage:(id)a4 piggy:(BOOL)a5;
- (void)_unsafe_showNotificationForMessage:(id)a3 account:(id)a4 responseHandler:(id)a5;
- (void)_unsafe_tearDownNotificationWithID:(id)a3;
- (void)_unsafe_teardownCurrentLoginNotification;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connectionDidReconnect:(id)a3;
- (void)dealloc;
- (void)setActiveCode:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setEnableCriticalReliability:(BOOL)a3;
- (void)showPigCode:(id)a3 withIncomingMessage:(id)a4;
- (void)startWithDelegates:(id)a3;
- (void)tearDownLoginNotifications;
@end

@implementation AKAppleIDPushHelperService

+ (id)sharedService
{
  if (qword_100272630 != -1) {
    dispatch_once(&qword_100272630, &stru_10022B040);
  }
  v2 = (void *)qword_100272628;

  return v2;
}

- (AKAppleIDPushHelperService)init
{
  v15.receiver = self;
  v15.super_class = (Class)AKAppleIDPushHelperService;
  v2 = [(AKAppleIDPushHelperService *)&v15 init];
  if (v2)
  {
    uint64_t v3 = +[AKAccountManager sharedInstance];
    accountManager = v2->_accountManager;
    v2->_accountManager = (AKAccountManager *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    notificationsByPushID = v2->_notificationsByPushID;
    v2->_notificationsByPushID = v5;

    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    apsTokenSemaphore = v2->_apsTokenSemaphore;
    v2->_apsTokenSemaphore = (OS_dispatch_semaphore *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.authkit.pushServiceQueue", v9);
    pushServiceQueue = v2->_pushServiceQueue;
    v2->_pushServiceQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = +[NSSet setWithObjects:@"com.apple.idmsauth", 0];
    pushTopics = v2->_pushTopics;
    v2->_pushTopics = (NSSet *)v12;
  }
  return v2;
}

- (void)startWithDelegates:(id)a3
{
  id v4 = a3;
  if (getenv("__OSINSTALL_ENVIRONMENT"))
  {
    v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "We are running in recovery. Leaving APS alone.";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    }
  }
  else if (getenv("__AKSYNCBUBBLE"))
  {
    v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "We are running in the sync bubble. Leaving APS alone.";
      goto LABEL_14;
    }
  }
  else
  {
    pushServiceQueue = self->_pushServiceQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B728C;
    block[3] = &unk_100226FB8;
    block[4] = self;
    dispatch_async(pushServiceQueue, block);
    v8 = _AKSignpostLogSystem();
    os_signpost_id_t v9 = _AKSignpostCreate();
    uint64_t v11 = v10;

    uint64_t v12 = _AKSignpostLogSystem();
    v13 = v12;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "APSTokenEnvironment", " enableTelemetry=YES ", buf, 2u);
    }

    v14 = _AKSignpostLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      os_signpost_id_t v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: APSTokenEnvironment  enableTelemetry=YES ", buf, 0xCu);
    }

    objc_super v15 = +[AKURLBag sharedBag];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000B73B0;
    v16[3] = &unk_10022B068;
    v16[5] = v9;
    v16[6] = v11;
    v16[4] = self;
    [v15 environmentValueForKey:AKURLBagKeyAPSEnvironment completion:v16];

    [(AKAppleIDPushHelperService *)self setDelegates:v4];
    v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Push service started";
      goto LABEL_14;
    }
  }
}

- (void)setDelegates:(id)a3
{
  id v4 = a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100192200();
  }

  v6 = (NSArray *)[v4 copy];
  pushDelegates = self->_pushDelegates;
  self->_pushDelegates = v6;
}

- (void)_notifyDelegatesOfMessageActivation:(id)a3 result:(unint64_t)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = +[NSNumber numberWithUnsignedInteger:a4];
    *(_DWORD *)buf = 138412290;
    v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Will notify delegates of notification action: %@", buf, 0xCu);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  os_signpost_id_t v9 = self->_pushDelegates;
  id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v13);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v14, "didRespondToMessage:withResult:", v6, a4, (void)v15);
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)_notifyDelegatesOfMessageActivation:(id)a3 result:(unint64_t)a4 payload:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = +[NSNumber numberWithUnsignedInteger:a4];
    *(_DWORD *)buf = 138412290;
    v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Will notify delegates of notification action: %@", buf, 0xCu);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v12 = self->_pushDelegates;
  id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      long long v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v16);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v17, "didRespondToMessage:result:payload:", v8, a4, v9, (void)v18);
        }
        long long v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [(NSArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
}

- (BOOL)_queryDelegatesForSuppressAction:(id)a3
{
  id v4 = a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will query delegates of intent to show notification", buf, 2u);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_pushDelegates;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          v9 |= objc_msgSend(v12, "shouldSuppressPushMessage:", v4, (void)v16);
        }
      }
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v8);
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  id v13 = _AKLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v14 = @"NO";
    if (v9) {
      CFStringRef v14 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v21 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Did notify delegates of intent to show notification, suppression elected: %@", buf, 0xCu);
  }

  return v9 & 1;
}

- (void)_processMessageWithDelegates:(id)a3
{
  id v4 = a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will ask delegates to process push payload", buf, 2u);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_pushDelegates;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v10);
        uint64_t v12 = dispatch_get_global_queue(33, 0);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_1000B7CD8;
        v14[3] = &unk_100226C00;
        v14[4] = v11;
        id v15 = v4;
        dispatch_async(v12, v14);

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v8);
  }

  id v13 = _AKLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Did ask delegates to process push payload", buf, 2u);
  }
}

- (void)_ensureDesiredAPSEnvironmentIsInUse:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    pushServiceQueue = self->_pushServiceQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000B7DB0;
    v8[3] = &unk_100226C00;
    uint64_t v9 = v4;
    uint64_t v10 = self;
    dispatch_sync(pushServiceQueue, v8);
    id v7 = v9;
  }
  else
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100192268();
    }
  }
}

- (void)dealloc
{
  if (self->_apsConnection)
  {
    uint64_t v3 = _AKLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Shutting down APS connection...", buf, 2u);
    }

    [(APSConnection *)self->_apsConnection shutdown];
    [(APSConnection *)self->_apsConnection setDelegate:0];
    apsConnection = self->_apsConnection;
    self->_apsConnection = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)AKAppleIDPushHelperService;
  [(AKAppleIDPushHelperService *)&v5 dealloc];
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "APNS status changed: %d", (uint8_t *)v6, 8u);
  }
}

- (void)connectionDidReconnect:(id)a3
{
  uint64_t v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "APNS reconnected", v4, 2u);
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v6 = objc_alloc_init(AKPushTokenKeychainWrapper);
    id v7 = [(AKPushTokenKeychainWrapper *)v6 fetchToken];
    if ([v7 isEqual:v5])
    {
      id v8 = _AKLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_100192434();
      }

      _AKLogSystem();
      uint64_t v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_DEBUG)) {
        sub_100192370(v7, v5, &v9->super);
      }
    }
    else
    {
      [(AKPushTokenKeychainWrapper *)v6 updateToken:v5];
      uint64_t v10 = _AKLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_100192468(v5, v10);
      }

      dispatch_semaphore_signal((dispatch_semaphore_t)self->_apsTokenSemaphore);
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v9 = self->_pushDelegates;
      id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        id v12 = v11;
        long long v17 = v7;
        uint64_t v13 = *(void *)v19;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v9);
            }
            id v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              long long v16 = objc_msgSend(v5, "aaf_toHexString");
              [v15 didReceiveNewPublicToken:v16];
            }
          }
          id v12 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v12);
        id v7 = v17;
      }
    }
  }
  else
  {
    _AKLogSystem();
    id v6 = (AKPushTokenKeychainWrapper *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR)) {
      sub_1001924FC();
    }
  }
}

- (id)publicAPSTokenString
{
  v2 = [(AKAppleIDPushHelperService *)self _publicAPSToken];
  uint64_t v3 = objc_msgSend(v2, "aaf_toHexString");

  return v3;
}

- (id)_publicAPSToken
{
  if (+[AKDevice didConfirmDeviceWasActivated])
  {
    uint64_t v3 = _AKSignpostLogSystem();
    os_signpost_id_t v4 = _AKSignpostCreate();

    id v5 = _AKSignpostLogSystem();
    id v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "APSTokenPopulate", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
    }

    id v7 = _AKSignpostLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: APSTokenPopulate  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v22 = 0x3032000000;
    v23 = sub_10000F9C0;
    v24 = sub_10000F830;
    id v25 = 0;
    pushServiceQueue = self->_pushServiceQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000B87D0;
    v16[3] = &unk_100228178;
    v16[4] = self;
    v16[5] = &buf;
    dispatch_sync(pushServiceQueue, v16);
    uint64_t Nanoseconds = _AKSignpostGetNanoseconds();
    uint64_t v10 = _AKSignpostLogSystem();
    id v11 = v10;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)long long v17 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, v4, "APSTokenPopulate", "", v17, 2u);
    }

    id v12 = _AKSignpostLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long v17 = 134218240;
      os_signpost_id_t v18 = v4;
      __int16 v19 = 2048;
      double v20 = (double)(unint64_t)Nanoseconds / 1000000000.0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:APSTokenPopulate ", v17, 0x16u);
    }

    id v13 = *(id *)(*((void *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    CFStringRef v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Unable to confirm this device was activated, skipping APS Token fetch.", (uint8_t *)&buf, 2u);
    }

    id v13 = 0;
  }

  return v13;
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create((void *)&_mh_execute_header, "akd/received-push-message", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v7 userInfo];
    *(_DWORD *)long long buf = 138412546;
    id v20 = v7;
    __int16 v21 = 2112;
    uint64_t v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received push message: %@. Contents: %@", buf, 0x16u);
  }
  pushTopics = self->_pushTopics;
  id v12 = [v7 topic];
  LOBYTE(pushTopics) = [(NSSet *)pushTopics containsObject:v12];

  if (pushTopics)
  {
    if ([v7 isTracingEnabled]) {
      [v6 confirmReceiptForMessage:v7];
    }
    pushServiceQueue = self->_pushServiceQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000B8C50;
    v15[3] = &unk_100226C00;
    long long v16 = v7;
    long long v17 = self;
    dispatch_async(pushServiceQueue, v15);
    CFStringRef v14 = v16;
  }
  else
  {
    CFStringRef v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1001925D0();
    }
  }

  os_activity_scope_leave(&state);
}

- (void)_unsafe_processPushMessage:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pushServiceQueue);
  if (!v4)
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100192604();
    }
    goto LABEL_18;
  }
  if (![v4 isValidMessage])
  {
    id v7 = 0;
LABEL_15:
    CFStringRef v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_100192638();
    }
    goto LABEL_17;
  }
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1001926A0();
  }

  id v6 = [v4 altDSID];
  id v7 = [(AKAccountManager *)self->_accountManager authKitAccountWithAltDSID:v6 error:0];
  unsigned int v8 = [(AKAppleIDPushHelperService *)self _shouldProcessPushMessage:v4 withAccount:v7];

  if (!v8) {
    goto LABEL_15;
  }
  if ([v4 command] == (id)400 || objc_msgSend(v4, "command") == (id)410)
  {
    uint64_t v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received push command to tear down notification.", buf, 2u);
    }

    uint64_t v10 = +[AKFollowUpManagerFactory sharedAuthKitFollowupManager];
    id v11 = [v4 previousMessageId];
    id v12 = [v10 pendingFollowUpWithMessageId:v11];

    if ([v12 count])
    {
      id v13 = +[AKFollowUpManagerFactory sharedAuthKitFollowupManager];
      [v13 tearDownFollowUpsWithItems:v12];
    }
    else
    {
      id v13 = [v4 previousMessageId];
      [(AKAppleIDPushHelperService *)self _unsafe_tearDownNotificationWithID:v13];
    }

    goto LABEL_18;
  }
  if ([v4 command] == (id)900)
  {
    id v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Received push command to refresh AKURLBag", v21, 2u);
    }

    +[NSXPCConnection beginTransaction];
    long long v16 = +[AKURLBagService sharedBagService];
    [v16 clearCache];

    CFStringRef v14 = +[AKURLBagService sharedBagService];
    [v14 fetchURLBagForAltDSID:0 completion:&stru_10022B088];
LABEL_17:

    goto LABEL_18;
  }
  if ([(AKAppleIDPushHelperService *)self _messageSupportsAlerts:v4])
  {
    if (![(AKAppleIDPushHelperService *)self _queryDelegatesForSuppressAction:v4])
    {
      [(AKAppleIDPushHelperService *)self _unsafe_presentMessage:v4 forAccount:v7];
      goto LABEL_18;
    }
    if ([v4 command] == (id)700 || objc_msgSend(v4, "command") == (id)100)
    {
      long long v17 = _AKLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Processing a supressed command, tearing down previous HSA2 alerts", v20, 2u);
      }

      [(AKAppleIDPushHelperService *)self _unsafe_teardownCurrentLoginNotification];
    }
  }
  os_signpost_id_t v18 = _AKLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Incoming message alert suppressed", v19, 2u);
  }

  [(AKAppleIDPushHelperService *)self _processMessageWithDelegates:v4];
LABEL_18:
}

- (id)_akPCSAuthPushHandler
{
  pcsAuthPushHandler = self->_pcsAuthPushHandler;
  if (!pcsAuthPushHandler)
  {
    id v4 = +[AKAccountManager sharedInstance];
    id v5 = +[AKWebSessionPCSKeyProvider sharedInstance];
    id v6 = [[AKPCSAuthPushHandler alloc] initWithAccountManager:v4 webSessionPCSKeyProvider:v5];
    id v7 = self->_pcsAuthPushHandler;
    self->_pcsAuthPushHandler = v6;

    pcsAuthPushHandler = self->_pcsAuthPushHandler;
  }

  return pcsAuthPushHandler;
}

- (BOOL)_shouldProcessPushMessage:(id)a3 withAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 command] == (id)300 || objc_msgSend(v6, "command") == (id)310)
  {
    unsigned int v8 = [(AKAccountManager *)self->_accountManager altDSIDForAccount:v7];
    uint64_t v9 = [(AKAccountManager *)self->_accountManager altDSIDforPrimaryiCloudAccount];
    unsigned __int8 v10 = [v8 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      CFStringRef v14 = _AKLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100192838();
      }
      goto LABEL_24;
    }
  }
  if ([v6 requiresPasscode])
  {
    id v11 = +[AKDevice currentDevice];
    unsigned __int8 v12 = [v11 isProtectedWithPasscode];

    if ((v12 & 1) == 0)
    {
      CFStringRef v14 = _AKLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100192804();
      }
      goto LABEL_24;
    }
  }
  id v13 = [v6 command];
  if (!v7 && v13 != (id)700)
  {
    CFStringRef v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100192708(v6, v14);
    }
LABEL_24:

    BOOL v22 = 0;
    goto LABEL_25;
  }
  id v15 = [v6 command];
  id v16 = [v6 command];
  if ((v15 == (id)1900 || v16 == (id)2000)
    && ![(AKAppleIDPushHelperService *)self _isPrimaryAccount:v7])
  {
    CFStringRef v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1001927D0();
    }
    goto LABEL_24;
  }
  long long v17 = [(AKAppleIDPushHelperService *)self _pushCommandsPostingCFUserNotification];
  os_signpost_id_t v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 command]);
  unsigned int v19 = [v17 containsObject:v18];

  if (v19)
  {
    id v20 = +[AKDevice currentDevice];
    unsigned int v21 = [v20 isInRestrictedSharingMode];

    if (v21)
    {
      CFStringRef v14 = _AKLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10019279C();
      }
      goto LABEL_24;
    }
  }
  BOOL v22 = 1;
LABEL_25:

  return v22;
}

- (void)_unsafe_presentMessage:(id)a3 forAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pushServiceQueue);
  unsigned int v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Showing alert for message %@.", buf, 0xCu);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000B94BC;
  v11[3] = &unk_10022B0B0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(AKAppleIDPushHelperService *)self _unsafe_showNotificationForMessage:v10 account:v9 responseHandler:v11];
}

- (void)_armDeviceWithMessage:(id)a3 account:(id)a4 notificationResult:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(AKAppleIDPushHelperService *)self _akPCSAuthPushHandler];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000B9754;
  v12[3] = &unk_10022B0D8;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 armDeviceWithPCSAuthorizationContextForMessage:v11 completion:v12];
}

- (BOOL)_messageSupportsAlerts:(id)a3
{
  id v3 = a3;
  id v4 = [v3 alertTitle];
  if (v4)
  {
    id v5 = [v3 alertBody];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_performCommandForMessage:(id)a3 forAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 command];
  if (v8 == (id)310 || v8 == (id)300)
  {
    [(AKAppleIDPushHelperService *)self _startPasswordResetFlowForAccount:v7];
  }
  else if (v8 == (id)100)
  {
    [(AKAppleIDPushHelperService *)self _generateLoginCodeForAccount:v7 withIncomingMessage:v6];
  }
  else
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 command]);
      int v12 = 138412290;
      id v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No action to be done for push command %@.", (uint8_t *)&v12, 0xCu);
    }
  }
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Processed all known commands, notifying delegates", (uint8_t *)&v12, 2u);
  }

  [(AKAppleIDPushHelperService *)self _processMessageWithDelegates:v6];
}

- (void)_generateLoginCodeForAccount:(id)a3 withIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 username];
    *(_DWORD *)long long buf = 138412290;
    v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Trying to generate login code now for %@...", buf, 0xCu);
  }
  id v21 = 0;
  id v10 = +[AKAppleIDCodeGenerator generateLoginCode:&v21];
  id v11 = v21;
  pushServiceQueue = self->_pushServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B9B84;
  block[3] = &unk_10022A4D0;
  id v17 = v11;
  os_signpost_id_t v18 = self;
  id v19 = v10;
  id v20 = v7;
  id v13 = v7;
  id v14 = v10;
  id v15 = v11;
  dispatch_async(pushServiceQueue, block);
}

- (void)showPigCode:(id)a3 withIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Will display piggy notification...", buf, 2u);
  }

  pushServiceQueue = self->_pushServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B9E38;
  block[3] = &unk_100226BD8;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(pushServiceQueue, block);
}

- (void)tearDownLoginNotifications
{
  pushServiceQueue = self->_pushServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B9EC0;
  block[3] = &unk_100226FB8;
  void block[4] = self;
  dispatch_sync(pushServiceQueue, block);
}

- (void)_unsafe_showLoginNotificationWithCode:(id)a3 incomingMessage:(id)a4 piggy:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  [(AKAppleIDPushHelperService *)self _unsafe_teardownCurrentLoginNotification];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%06u", [v9 unsignedIntValue]);
  id v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  activeCode = self->_activeCode;
  self->_activeCode = v10;

  int v12 = [v8 messageId];
  loginCodeNotificationID = self->_loginCodeNotificationID;
  self->_loginCodeNotificationID = v12;

  id v14 = [[AKPushMessageNotificationPresenter alloc] initWithMessage:v8];
  [(NSMutableDictionary *)self->_notificationsByPushID setObject:v14 forKeyedSubscript:self->_loginCodeNotificationID];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B9FFC;
  v15[3] = &unk_10022B100;
  void v15[4] = self;
  [(AKPushMessageNotificationPresenter *)v14 presentLoginNotificationWithCode:v9 piggy:v5 completionHandler:v15];
}

- (void)_unsafe_teardownCurrentLoginNotification
{
  id v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    loginCodeNotificationID = self->_loginCodeNotificationID;
    int v5 = 138412290;
    id v6 = loginCodeNotificationID;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Tearing down login notification: %@", (uint8_t *)&v5, 0xCu);
  }

  [(AKAppleIDPushHelperService *)self _unsafe_tearDownNotificationWithID:self->_loginCodeNotificationID];
}

- (void)_unsafe_tearDownNotificationWithID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pushServiceQueue);
  if (v4)
  {
    unsigned int v5 = [v4 isEqualToString:self->_loginCodeNotificationID];
    activeCode = _AKLogSystem();
    BOOL v7 = os_log_type_enabled(activeCode, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        loginCodeNotificationID = self->_loginCodeNotificationID;
        int v11 = 138412290;
        int v12 = loginCodeNotificationID;
        _os_log_impl((void *)&_mh_execute_header, activeCode, OS_LOG_TYPE_DEFAULT, "Will tear down current notification, with ID: %@", (uint8_t *)&v11, 0xCu);
      }

      id v9 = self->_loginCodeNotificationID;
      self->_loginCodeNotificationID = 0;

      activeCode = self->_activeCode;
      self->_activeCode = 0;
    }
    else if (v7)
    {
      int v11 = 138412290;
      int v12 = (NSString *)v4;
      _os_log_impl((void *)&_mh_execute_header, activeCode, OS_LOG_TYPE_DEFAULT, "Will tear down notification with ID: %@", (uint8_t *)&v11, 0xCu);
    }

    id v10 = [(NSMutableDictionary *)self->_notificationsByPushID objectForKeyedSubscript:v4];
    [v10 tearDown];
    [(NSMutableDictionary *)self->_notificationsByPushID setObject:0 forKeyedSubscript:v4];
  }
}

- (void)_startPasswordResetFlowForAccount:(id)a3
{
  id v4 = a3;
  unsigned int v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will take user to password-reset flow in Settings for %@...", buf, 0xCu);
  }

  id v6 = [(AKAccountManager *)self->_accountManager altDSIDForAccount:v4];
  BOOL v7 = [(AKAccountManager *)self->_accountManager iCloudAccountForAltDSID:v6];
  unsigned __int8 v8 = [(AKAppleIDPushHelperService *)self _isPrimaryAccount:v4];
  id v9 = @"prefs:root=APPLE_ACCOUNT&aaaction=resetPassword";
  if ((v8 & 1) != 0
    || !v7
    || ([v7 identifier],
        id v10 = objc_claimAutoreleasedReturnValue(),
        +[NSString stringWithFormat:@"prefs:root=ACCOUNTS_AND_PASSWORDS&path=%@&aaaction=resetPassword", v10], id v9 = (__CFString *)objc_claimAutoreleasedReturnValue(), v10, v9))
  {
    int v11 = +[NSURL URLWithString:v9];
    int v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Using the following URL for iForgot redirect: %@", buf, 0xCu);
    }

    id v13 = +[LSApplicationWorkspace defaultWorkspace];
    [v13 openSensitiveURL:v11 withOptions:0];
  }
}

- (void)_unsafe_showNotificationForMessage:(id)a3 account:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pushServiceQueue);
  if ([(AKAppleIDPushHelperService *)self _canProceedWithArmingForMessage:v8 account:v9])
  {
    if ([v8 command] == (id)100)
    {
      int v11 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
      int v12 = [v11 localizedStringForKey:@"WALRUS_2FA_ARMING_NOTIFICATION_TITLE" value:&stru_100233250 table:@"Localizable"];
      [v8 setSecondaryTitleCDP:v12];

      id v13 = +[AKDevice deviceSpecificLocalizedStringWithKey:@"WALRUS_2FA_ARMING_NOTIFICATION_BODY"];
      [v8 setSecondaryBodyCDP:v13];

      id v14 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
      id v15 = [v14 localizedStringForKey:@"LOGIN_CODE_ALERT_MESSAGE_FOOTER_DEFAULT" value:&stru_100233250 table:@"Localizable"];
      [v8 setSecondaryFooter:v15];

LABEL_6:
      goto LABEL_7;
    }
    if ([v8 command] == (id)2000)
    {
      id v16 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
      id v17 = [v16 localizedStringForKey:@"WALRUS_DIRECT_ARMING_NOTIFICATION_TITLE" value:&stru_100233250 table:@"Localizable"];
      [v8 setAlertTitle:v17];

      os_signpost_id_t v18 = +[AKDevice deviceSpecificLocalizedStringWithKey:@"WALRUS_DIRECT_ARMING_NOTIFICATION_BODY"];
      [v8 setAlertBody:v18];

      id v19 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
      id v20 = [v19 localizedStringForKey:@"WALRUS_DIRECT_ARMING_NOTIFICATION_LOCKSCREEN_TITLE" value:&stru_100233250 table:@"Localizable"];
      [v8 setLockScreenTitle:v20];

      id v14 = +[AKDevice deviceSpecificLocalizedStringWithKey:@"WALRUS_DIRECT_ARMING_NOTIFICATION_LOCKSCREEN_BODY"];
      [v8 setLockScreenBody:v14];
      goto LABEL_6;
    }
  }
LABEL_7:
  if ([v8 command] == (id)100 || objc_msgSend(v8, "command") == (id)700)
  {
    [(AKAppleIDPushHelperService *)self _unsafe_teardownCurrentLoginNotification];
    id v21 = [v8 messageId];
    loginCodeNotificationID = self->_loginCodeNotificationID;
    self->_loginCodeNotificationID = v21;

    v23 = _AKLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_10019293C();
    }
  }
  if ([v8 command] == (id)1600)
  {
    [(AKAppleIDPushHelperService *)self _unsafe_tearDownNotificationWithID:self->_appleCareNotificationID];
    v24 = [v8 messageId];
    appleCareNotificationID = self->_appleCareNotificationID;
    self->_appleCareNotificationID = v24;
  }
  v26 = [v8 messageId];
  v27 = [(NSMutableDictionary *)self->_notificationsByPushID objectForKeyedSubscript:v26];

  if (v27)
  {
    _AKLogSystem();
    v28 = (AKPushMessageNotificationPresenter *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v28->super, OS_LOG_TYPE_DEBUG)) {
      sub_1001928D4();
    }
  }
  else
  {
    v28 = [[AKPushMessageNotificationPresenter alloc] initWithMessage:v8];
    [(NSMutableDictionary *)self->_notificationsByPushID setObject:v28 forKeyedSubscript:v26];
    +[NSXPCConnection beginTransaction];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000BA81C;
    v29[3] = &unk_100229BE0;
    v29[4] = self;
    id v30 = v26;
    id v31 = v10;
    [(AKPushMessageNotificationPresenter *)v28 presentMessageWithAccount:v9 completionHandler:v29];
  }
}

- (BOOL)_canProceedWithArmingForMessage:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 command] == (id)2000 || objc_msgSend(v6, "command") == (id)100)
  {
    if ([(AKAppleIDPushHelperService *)self _isPrimaryAccount:v7])
    {
      id v8 = [v6 walrusWebAccessInfo];

      if (v8)
      {
        unsigned __int8 v9 = +[AKCDPFactory isEligibleToArmDeviceForPCSAuth];
        id v10 = _AKLogSystem();
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        if (v9)
        {
          if (v11)
          {
            *(_WORD *)id v16 = 0;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Push may proceed with PCS arming.", v16, 2u);
          }
          BOOL v12 = 1;
          goto LABEL_18;
        }
        if (v11)
        {
          *(_WORD *)long long buf = 0;
          id v13 = "Account is ineligible, do not proceed with arming.";
          id v14 = buf;
          goto LABEL_16;
        }
LABEL_17:
        BOOL v12 = 0;
LABEL_18:

        goto LABEL_19;
      }
      id v10 = _AKLogSystem();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      __int16 v18 = 0;
      id v13 = "Web access info not provided, do not proceed with arming.";
      id v14 = (uint8_t *)&v18;
    }
    else
    {
      id v10 = _AKLogSystem();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      __int16 v19 = 0;
      id v13 = "Account is not primary, do not proceed with arming.";
      id v14 = (uint8_t *)&v19;
    }
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
    goto LABEL_17;
  }
  BOOL v12 = 0;
LABEL_19:

  return v12;
}

- (BOOL)_isPrimaryAccount:(id)a3
{
  id v4 = [(AKAccountManager *)self->_accountManager altDSIDForAccount:a3];
  unsigned int v5 = [(AKAccountManager *)self->_accountManager iCloudAccountForAltDSID:v4];
  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1001929A4();
  }

  unsigned __int8 v7 = [(AKAccountManager *)self->_accountManager isPrimaryiCloudAccount:v5];
  return v7;
}

- (id)_pushCommandsPostingCFUserNotification
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_10023B128, &off_10023B140, &off_10023B158, &off_10023B170, &off_10023B188, 0);
}

- (void)setEnableCriticalReliability:(BOOL)a3
{
}

- (NSString)activeCode
{
  return self->_activeCode;
}

- (void)setActiveCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeCode, 0);
  objc_storeStrong((id *)&self->_pcsAuthPushHandler, 0);
  objc_storeStrong((id *)&self->_pushTopics, 0);
  objc_storeStrong((id *)&self->_pushDelegates, 0);
  objc_storeStrong((id *)&self->_notificationsByPushID, 0);
  objc_storeStrong((id *)&self->_appleCareNotificationID, 0);
  objc_storeStrong((id *)&self->_loginCodeNotificationID, 0);
  objc_storeStrong((id *)&self->_pushServiceQueue, 0);
  objc_storeStrong((id *)&self->_apsTokenSemaphore, 0);
  objc_storeStrong((id *)&self->_activeAPSEnvironment, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end