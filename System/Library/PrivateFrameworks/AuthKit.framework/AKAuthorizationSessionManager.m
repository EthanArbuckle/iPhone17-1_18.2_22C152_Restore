@interface AKAuthorizationSessionManager
+ (id)sharedInstance;
- (AKAuthorizationSessionManager)init;
- (BOOL)_hasSessionTimedOutForRequest:(id)a3;
- (id)_activeSessionForContext:(id)a3 client:(id)a4;
- (id)_clientBundleIDForContext:(id)a3 client:(id)a4;
- (id)clientForContext:(id)a3;
- (id)userResponseWithContext:(id)a3 forClient:(id)a4;
- (void)beginSessionWithContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)continueSessionWithContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)endSessionWithContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)updateUserResponse:(id)a3 withContext:(id)a4 forClient:(id)a5;
@end

@implementation AKAuthorizationSessionManager

+ (id)sharedInstance
{
  if (qword_1002723B8 != -1) {
    dispatch_once(&qword_1002723B8, &stru_100228198);
  }
  v2 = (void *)qword_1002723B0;

  return v2;
}

- (AKAuthorizationSessionManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)AKAuthorizationSessionManager;
  v2 = [(AKAuthorizationSessionManager *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    activeSessions = v2->_activeSessions;
    v2->_activeSessions = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("AKAuthorizationClearanceQueue", v5);
    clearanceQueue = v2->_clearanceQueue;
    v2->_clearanceQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("AKAuthorizationTrafficQueue", v8);
    trafficQueue = v2->_trafficQueue;
    v2->_trafficQueue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

- (id)clientForContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 _sessionID];
  BOOL v6 = v5 == 0;

  v7 = _AKLogSiwa();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Session ID is nil for context: %@", (uint8_t *)&buf, 0xCu);
    }

    id v13 = 0;
  }
  else
  {
    if (v8)
    {
      id v9 = [(NSMutableDictionary *)self->_activeSessions count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Number of active sessions: %lu", (uint8_t *)&buf, 0xCu);
    }

    v10 = _AKLogSiwa();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v4 _sessionID];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Looking for client with session ID: %@", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v19 = 0x3032000000;
    v20 = sub_10000F8B0;
    v21 = sub_10000F7A8;
    id v22 = 0;
    activeSessions = self->_activeSessions;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003F4C0;
    v15[3] = &unk_1002281C0;
    id v16 = v4;
    p_long long buf = &buf;
    [(NSMutableDictionary *)activeSessions enumerateKeysAndObjectsUsingBlock:v15];
    id v13 = *(id *)(*((void *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }

  return v13;
}

- (void)beginSessionWithContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_10000F8B0;
  v26[4] = sub_10000F7A8;
  id v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_10000F8B0;
  v24[4] = sub_10000F7A8;
  id v25 = 0;
  trafficQueue = self->_trafficQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F84C;
  block[3] = &unk_1002281E8;
  id v18 = v9;
  uint64_t v19 = self;
  id v20 = v8;
  id v21 = v10;
  id v22 = v24;
  v23 = v26;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_sync(trafficQueue, block);
  clearanceQueue = self->_clearanceQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003FBD8;
  v16[3] = &unk_100228210;
  v16[4] = v24;
  v16[5] = v26;
  dispatch_sync(clearanceQueue, v16);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
}

- (void)endSessionWithContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  trafficQueue = self->_trafficQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003FD3C;
  v15[3] = &unk_100227618;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(trafficQueue, v15);
}

- (void)continueSessionWithContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(AKAuthorizationSessionManager *)self _clientBundleIDForContext:v8 client:a4];
  if (v10)
  {
    v11 = [(NSMutableDictionary *)self->_activeSessions objectForKeyedSubscript:v10];
    id v12 = v11;
    if (v11)
    {
      id v13 = [v11 userResponse];
      uint64_t v14 = [v13 selectedRequest];
      v15 = [(id)v14 requestIdentifier];
      id v16 = [v15 UUIDString];

      v17 = [v8 _continuationRequestIdentifier];
      LOBYTE(v14) = [v16 isEqualToString:v17];

      if (v14)
      {
        if ([(AKAuthorizationSessionManager *)self _hasSessionTimedOutForRequest:v12])
        {
          id v18 = _AKLogSiwa();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            sub_100181538();
          }

          clearanceQueue = self->_clearanceQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100040528;
          block[3] = &unk_100228040;
          id v20 = &v32;
          id v32 = v9;
          dispatch_sync(clearanceQueue, block);
          [(NSMutableDictionary *)self->_activeSessions removeObjectForKey:v10];
        }
        else
        {
          id v27 = self->_clearanceQueue;
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_100040594;
          v28[3] = &unk_1002279F0;
          id v20 = &v30;
          id v30 = v9;
          id v29 = v12;
          dispatch_sync(v27, v28);
        }
      }
      else
      {
        id v25 = _AKLogSiwa();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          sub_1001815A0();
        }

        v26 = self->_clearanceQueue;
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_1000404BC;
        v33[3] = &unk_100228040;
        id v20 = &v34;
        id v34 = v9;
        dispatch_sync(v26, v33);
      }
    }
    else
    {
      v23 = _AKLogSiwa();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        sub_1001814D0();
      }

      v24 = self->_clearanceQueue;
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100040450;
      v35[3] = &unk_100228040;
      id v36 = v9;
      dispatch_sync(v24, v35);
      id v16 = v36;
    }
  }
  else
  {
    id v21 = _AKLogSiwa();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_10018149C();
    }

    id v22 = self->_clearanceQueue;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000403E4;
    v37[3] = &unk_100228040;
    id v38 = v9;
    dispatch_sync(v22, v37);
    id v12 = v38;
  }
}

- (void)updateUserResponse:(id)a3 withContext:(id)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _AKLogSiwa();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100181648();
  }

  id v12 = [(AKAuthorizationSessionManager *)self _activeSessionForContext:v9 client:v10];

  if (v12)
  {
    [v12 setUserResponse:v8];
  }
  else
  {
    id v13 = _AKLogSiwa();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1001815D4();
    }
  }
}

- (id)userResponseWithContext:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogSiwa();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1001816B0();
  }

  id v9 = [(AKAuthorizationSessionManager *)self _activeSessionForContext:v6 client:v7];

  if (v9)
  {
    id v10 = [v9 userResponse];
  }
  else
  {
    v11 = _AKLogSiwa();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001815D4();
    }

    id v10 = 0;
  }

  return v10;
}

- (BOOL)_hasSessionTimedOutForRequest:(id)a3
{
  id v3 = a3;
  id v4 = +[NSDate date];
  v5 = [v3 requestTime];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  id v8 = [v3 context];
  [v8 _authSessionTimeoutInterval];
  if (v9 <= 0.0)
  {
    double v12 = 900.0;
  }
  else
  {
    id v10 = [v3 context];
    [v10 _authSessionTimeoutInterval];
    double v12 = v11;
  }
  return v7 > v12;
}

- (id)_clientBundleIDForContext:(id)a3 client:(id)a4
{
  id v5 = a3;
  double v6 = [a4 bundleID];
  if ([v5 _isWebLogin])
  {
    double v7 = [v5 _proxiedClientServiceID];

    if (v7)
    {
      uint64_t v8 = [v5 _proxiedClientServiceID];

      double v6 = (void *)v8;
    }
  }

  return v6;
}

- (id)_activeSessionForContext:(id)a3 client:(id)a4
{
  id v5 = [(AKAuthorizationSessionManager *)self _clientBundleIDForContext:a3 client:a4];
  double v6 = [(NSMutableDictionary *)self->_activeSessions objectForKeyedSubscript:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_trafficQueue, 0);
  objc_storeStrong((id *)&self->_clearanceQueue, 0);

  objc_storeStrong((id *)&self->_activeSessions, 0);
}

@end