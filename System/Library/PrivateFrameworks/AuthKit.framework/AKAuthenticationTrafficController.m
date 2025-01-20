@interface AKAuthenticationTrafficController
+ (AKAuthenticationTrafficController)sharedInstance;
- (AKAuthenticationSurrogateManager)surrogateManager;
- (AKAuthenticationTrafficController)init;
- (BOOL)_hasActiveAppAuths;
- (BOOL)_hasActiveAuthenticatedRequests;
- (BOOL)_hasActiveDaemonAuths;
- (BOOL)_hasValuesInMap:(id)a3;
- (BOOL)_isForegroundAuthenticationInProgress;
- (BOOL)_shouldClearLimitedUICapableAuth:(id)a3;
- (BOOL)_shouldClearRequest:(id)a3;
- (BOOL)_shouldClearUICapableAuth:(id)a3;
- (NSMutableArray)pendingTrafficRequests;
- (NSMutableDictionary)authenticatedServerEndpointRequests;
- (NSMutableDictionary)authenticatingApps;
- (NSMutableDictionary)authenticatingDaemons;
- (id)_nextClearedRequest;
- (void)_clearNextEligibleRequest;
- (void)_clearNextEligibleRequestWithUpdateBlock:(id)a3;
- (void)_processClearanceRequest:(id)a3 withClient:(id)a4;
- (void)_removeAuthenticationRequestForContext:(id)a3 client:(id)a4;
- (void)_tq_addContext:(id)a3 toAuthenticatingAppsforClient:(id)a4;
- (void)_tq_addContext:(id)a3 toAuthenticatingDaemonsforClient:(id)a4;
- (void)_tq_addContext:(id)a3 toAuthenticatingRequestsforClient:(id)a4;
- (void)_tq_addContext:(id)a3 toRequestDictionary:(id)a4 forClient:(id)a5;
- (void)_tq_invokeTrafficRequest:(id)a3;
- (void)_updateContext:(id)a3 withPassword:(id)a4 forAppleID:(id)a5;
- (void)_updateContextWithCachedPassword:(id)a3;
- (void)beginAuthenticatedRequestWithContext:(id)a3 client:(id)a4 clearanceHandler:(id)a5;
- (void)endAuthenticatedRequestWithContext:(id)a3 client:(id)a4 clearanceHandler:(id)a5;
- (void)endAuthenticationForAppleID:(id)a3 password:(id)a4 error:(id)a5 context:(id)a6 client:(id)a7 clearanceHandler:(id)a8;
- (void)flushCachedPasswords;
- (void)setAuthenticatedServerEndpointRequests:(id)a3;
- (void)setAuthenticatingApps:(id)a3;
- (void)setAuthenticatingDaemons:(id)a3;
- (void)setPendingTrafficRequests:(id)a3;
- (void)setSurrogateManager:(id)a3;
- (void)uplevelAuthenticationForUIWithContext:(id)a3 client:(id)a4 completion:(id)a5;
@end

@implementation AKAuthenticationTrafficController

+ (AKAuthenticationTrafficController)sharedInstance
{
  if (qword_1002725B8 != -1) {
    dispatch_once(&qword_1002725B8, &stru_10022AEB8);
  }
  v2 = (void *)qword_1002725B0;

  return (AKAuthenticationTrafficController *)v2;
}

- (AKAuthenticationTrafficController)init
{
  v22.receiver = self;
  v22.super_class = (Class)AKAuthenticationTrafficController;
  v2 = [(AKAuthenticationTrafficController *)&v22 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingTrafficRequests = v2->_pendingTrafficRequests;
    v2->_pendingTrafficRequests = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    authenticatingApps = v2->_authenticatingApps;
    v2->_authenticatingApps = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    authenticatingDaemons = v2->_authenticatingDaemons;
    v2->_authenticatingDaemons = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    authenticatedServerEndpointRequests = v2->_authenticatedServerEndpointRequests;
    v2->_authenticatedServerEndpointRequests = v9;

    v11 = objc_alloc_init(AKExpiringCache);
    expiringCache = v2->_expiringCache;
    v2->_expiringCache = v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v15 = dispatch_queue_create("AKATCClearanceQueue", v14);
    clearanceQueue = v2->_clearanceQueue;
    v2->_clearanceQueue = (OS_dispatch_queue *)v15;

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v19 = dispatch_queue_create("AKAuthTrafficQueue", v18);
    trafficQueue = v2->_trafficQueue;
    v2->_trafficQueue = (OS_dispatch_queue *)v19;
  }
  return v2;
}

- (void)beginAuthenticatedRequestWithContext:(id)a3 client:(id)a4 clearanceHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  trafficQueue = self->_trafficQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B1F10;
  v15[3] = &unk_100227618;
  id v16 = v9;
  id v17 = v8;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(trafficQueue, v15);
}

- (void)endAuthenticatedRequestWithContext:(id)a3 client:(id)a4 clearanceHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100190E6C();
  }

  trafficQueue = self->_trafficQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000B2188;
  v16[3] = &unk_100227618;
  id v17 = v9;
  v18 = self;
  id v19 = v8;
  id v20 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  dispatch_async(trafficQueue, v16);
}

- (void)endAuthenticationForAppleID:(id)a3 password:(id)a4 error:(id)a5 context:(id)a6 client:(id)a7 clearanceHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = _AKLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_1001910B0();
  }

  trafficQueue = self->_trafficQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B24D8;
  block[3] = &unk_10022AF08;
  block[4] = self;
  id v29 = v17;
  id v30 = v18;
  id v31 = v15;
  id v32 = v16;
  id v33 = v14;
  id v34 = v19;
  id v22 = v19;
  id v23 = v14;
  id v24 = v16;
  id v25 = v15;
  id v26 = v18;
  id v27 = v17;
  dispatch_async(trafficQueue, block);
}

- (void)uplevelAuthenticationForUIWithContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[AKFeatureManager sharedManager];
  unsigned __int8 v12 = [v11 isSilentAuthenticationRequestSerializationEnabled];

  if (v12)
  {
    uint64_t v13 = [v9 bundleID];
    id v14 = (void *)v13;
    id v15 = @"com.apple.ak.unknown";
    if (v13) {
      id v15 = (__CFString *)v13;
    }
    id v16 = v15;

    trafficQueue = self->_trafficQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000B2A00;
    v20[3] = &unk_100227618;
    v20[4] = self;
    v21 = v16;
    id v22 = v8;
    id v23 = v10;
    id v18 = v16;
    dispatch_async(trafficQueue, v20);
  }
  else
  {
    id v19 = _AKLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Silent authentication serialization is disabled, skipping uplevel to UI...", buf, 2u);
    }

    (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 1, 0);
  }
}

- (void)_removeAuthenticationRequestForContext:(id)a3 client:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 bundleID];
  id v8 = (void *)v7;
  id v9 = @"com.apple.ak.unknown";
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  id v10 = v9;

  v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100191370();
  }

  if ([v6 _capabilityForUIDisplay] == (id)3)
  {
    unsigned __int8 v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Surrogate context is done", v15, 2u);
    }
  }
  uint64_t v13 = [(NSMutableDictionary *)self->_authenticatingApps objectForKeyedSubscript:v10];
  [v13 removeObject:v6];

  id v14 = [(NSMutableDictionary *)self->_authenticatingDaemons objectForKeyedSubscript:v10];
  [v14 removeObject:v6];
}

- (void)flushCachedPasswords
{
  v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing the password cache.", v4, 2u);
  }

  [(AKExpiringCache *)self->_expiringCache flushCacheForced:1];
}

- (BOOL)_shouldClearRequest:(id)a3
{
  id v4 = a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10019169C();
  }

  id v6 = [v4 authContext];

  if (!v6)
  {
    v11 = +[AKFeatureManager sharedManager];
    unsigned int v12 = [v11 isAuthenticatedRequestSerializationEnabled];

    if (v12)
    {
      unsigned __int8 v13 = [(AKAuthenticationTrafficController *)self _hasActiveDaemonAuths];
      id v10 = _AKLogSystem();
      BOOL v14 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
      if (v13)
      {
        if (v14) {
          sub_1001913D8(v4);
        }
        goto LABEL_15;
      }
      if (v14) {
        sub_10019145C();
      }
    }
    else
    {
      id v10 = _AKLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_100191490();
      }
    }
    goto LABEL_36;
  }
  uint64_t v7 = [(AKAuthenticationTrafficController *)self surrogateManager];
  id v8 = [v4 clientBundleID];
  unsigned int v9 = [v7 isSurrogateAuthInProgressForClientBundleID:v8];

  if (!v9)
  {
    id v15 = +[AKFeatureManager sharedManager];
    if ([v15 isAuthenticatedRequestSerializationEnabled])
    {
      unsigned int v16 = [(AKAuthenticationTrafficController *)self _hasActiveAuthenticatedRequests];

      if (v16)
      {
        id v10 = _AKLogSystem();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_100191548(v4);
        }
        goto LABEL_15;
      }
    }
    else
    {
    }
    id v18 = +[AKFeatureManager sharedManager];
    if ([v18 isSilentAuthenticationRequestSerializationEnabled])
    {

LABEL_24:
      if ([(AKAuthenticationTrafficController *)self _hasActiveAppAuths]
        || [(AKAuthenticationTrafficController *)self _hasActiveDaemonAuths])
      {
        if ([(AKAuthenticationTrafficController *)self _shouldClearUICapableAuth:v4])
        {
          id v10 = _AKLogSystem();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
            sub_1001915CC();
          }
        }
        else
        {
          if (![(AKAuthenticationTrafficController *)self _shouldClearLimitedUICapableAuth:v4])
          {
            BOOL v17 = 0;
            goto LABEL_38;
          }
          id v10 = _AKLogSystem();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
            sub_100191600();
          }
        }
      }
      else
      {
        id v10 = _AKLogSystem();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_100191634();
        }
      }
      goto LABEL_36;
    }
    id v19 = [v4 authContext];
    id v20 = [v19 authenticationType];

    if (v20 != (id)1) {
      goto LABEL_24;
    }
    id v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100191668();
    }
LABEL_36:
    BOOL v17 = 1;
    goto LABEL_37;
  }
  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1001914C4(v4);
  }
LABEL_15:
  BOOL v17 = 0;
LABEL_37:

LABEL_38:
  return v17;
}

- (void)_processClearanceRequest:(id)a3 withClient:(id)a4
{
  id v5 = a3;
  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100191940();
  }

  uint64_t v7 = [v5 authContext];
  id v8 = [v7 _capabilityForUIDisplay];

  if (v8 == (id)3)
  {
    unsigned int v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_100191784(v5, v9);
    }
  }
  else
  {
    unsigned int v10 = [(AKAuthenticationTrafficController *)self _shouldClearRequest:v5];
    v11 = _AKLogSystem();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (v12) {
        sub_100191830();
      }

      [(AKAuthenticationTrafficController *)self _tq_invokeTrafficRequest:v5];
    }
    else
    {
      if (v12) {
        sub_100191898((uint64_t)self);
      }

      [(NSMutableArray *)self->_pendingTrafficRequests addObject:v5];
    }
  }
}

- (BOOL)_hasActiveDaemonAuths
{
  return [(AKAuthenticationTrafficController *)self _hasValuesInMap:self->_authenticatingDaemons];
}

- (BOOL)_hasActiveAppAuths
{
  return [(AKAuthenticationTrafficController *)self _hasValuesInMap:self->_authenticatingApps];
}

- (BOOL)_hasActiveAuthenticatedRequests
{
  return [(AKAuthenticationTrafficController *)self _hasValuesInMap:self->_authenticatedServerEndpointRequests];
}

- (BOOL)_hasValuesInMap:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B3268;
  v6[3] = &unk_10022AF30;
  v6[4] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)_shouldClearUICapableAuth:(id)a3
{
  id v4 = a3;
  id v5 = [v4 authContext];

  if (v5)
  {
    id v6 = [v4 authContext];
    if ([v6 _capabilityForUIDisplay] == (id)2)
    {
    }
    else
    {
      id v8 = [v4 authContext];
      unsigned int v9 = [v8 _performUIOutOfProcess];

      if (!v9)
      {
        id v15 = _AKLogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          sub_100191A40();
        }
        BOOL v7 = 0;
        goto LABEL_16;
      }
    }
    char v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1001919D8();
    }

    authenticatingApps = self->_authenticatingApps;
    BOOL v12 = [v4 clientBundleID];
    unsigned __int8 v13 = [(NSMutableDictionary *)authenticatingApps objectForKeyedSubscript:v12];
    id v14 = [v13 count];

    if (v14)
    {
      id v15 = _AKLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v16 = self->_authenticatingApps;
        int v18 = 138412546;
        id v19 = v4;
        __int16 v20 = 2112;
        v21 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Clearing UI capable auth request for %@ while another auth is in progress: %@", (uint8_t *)&v18, 0x16u);
      }
      BOOL v7 = 1;
LABEL_16:

      goto LABEL_17;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }
LABEL_17:

  return v7;
}

- (BOOL)_shouldClearLimitedUICapableAuth:(id)a3
{
  if (![(AKAuthenticationTrafficController *)self _hasActiveDaemonAuths]) {
    return ![(AKAuthenticationTrafficController *)self _isForegroundAuthenticationInProgress];
  }
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100191B0C();
  }

  return 0;
}

- (BOOL)_isForegroundAuthenticationInProgress
{
  id v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100191B78();
  }

  uint64_t v8 = 0;
  unsigned int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  authenticatingApps = self->_authenticatingApps;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B35E0;
  v7[3] = &unk_10022AF30;
  v7[4] = &v8;
  [(NSMutableDictionary *)authenticatingApps enumerateKeysAndObjectsUsingBlock:v7];
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)_tq_invokeTrafficRequest:(id)a3
{
  id v4 = a3;
  char v5 = [v4 clientBundleID];
  id v6 = [v4 authContext];

  if (v6)
  {
    BOOL v7 = [v4 authContext];
    id v8 = [v7 _capabilityForUIDisplay];

    unsigned int v9 = [v4 context];
    if (v8 == (id)2) {
      [(AKAuthenticationTrafficController *)self _tq_addContext:v9 toAuthenticatingAppsforClient:v5];
    }
    else {
      [(AKAuthenticationTrafficController *)self _tq_addContext:v9 toAuthenticatingDaemonsforClient:v5];
    }
    goto LABEL_7;
  }
  uint64_t v10 = [v4 context];

  if (v10)
  {
    unsigned int v9 = [v4 context];
    [(AKAuthenticationTrafficController *)self _tq_addContext:v9 toAuthenticatingRequestsforClient:v5];
LABEL_7:
  }
  clearanceQueue = self->_clearanceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B37CC;
  block[3] = &unk_100226FB8;
  id v14 = v4;
  id v12 = v4;
  dispatch_async(clearanceQueue, block);
}

- (void)_tq_addContext:(id)a3 toAuthenticatingAppsforClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100191C18();
  }

  [(AKAuthenticationTrafficController *)self _tq_addContext:v7 toRequestDictionary:self->_authenticatingApps forClient:v6];
}

- (void)_tq_addContext:(id)a3 toAuthenticatingDaemonsforClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100191C80();
  }

  [(AKAuthenticationTrafficController *)self _tq_addContext:v7 toRequestDictionary:self->_authenticatingDaemons forClient:v6];
}

- (void)_tq_addContext:(id)a3 toAuthenticatingRequestsforClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100191CE8();
  }

  [(AKAuthenticationTrafficController *)self _tq_addContext:v7 toRequestDictionary:self->_authenticatedServerEndpointRequests forClient:v6];
}

- (void)_tq_addContext:(id)a3 toRequestDictionary:(id)a4 forClient:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];
  char v11 = v10;
  if (v10)
  {
    [v10 addObject:v7];
  }
  else
  {
    id v14 = v7;
    id v12 = +[NSArray arrayWithObjects:&v14 count:1];
    id v13 = [v12 mutableCopy];
    [v8 setObject:v13 forKeyedSubscript:v9];
  }
}

- (void)_clearNextEligibleRequest
{
}

- (void)_clearNextEligibleRequestWithUpdateBlock:(id)a3
{
  id v4 = (void (**)(id, NSObject *))a3;
  if ([(NSMutableArray *)self->_pendingTrafficRequests count])
  {
    char v5 = [(AKAuthenticationTrafficController *)self _nextClearedRequest];
    id v6 = _AKLogSystem();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7) {
        sub_100191DB8();
      }

      if (v4) {
        v4[2](v4, v5);
      }
      [(AKAuthenticationTrafficController *)self _tq_invokeTrafficRequest:v5];
      [(NSMutableArray *)self->_pendingTrafficRequests removeObject:v5];
    }
    else
    {
      if (v7) {
        sub_100191D84();
      }
    }
  }
  else
  {
    char v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100191D50();
    }
  }
}

- (id)_nextClearedRequest
{
  pendingTrafficRequests = self->_pendingTrafficRequests;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B3CD0;
  v5[3] = &unk_10022AF58;
  v5[4] = self;
  id v3 = [(NSMutableArray *)pendingTrafficRequests aaf_firstObjectPassingTest:v5];

  return v3;
}

- (void)_updateContext:(id)a3 withPassword:(id)a4 forAppleID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    uint64_t v10 = [v7 _password];

    if (!v10 && [v7 authenticationType] != (id)2)
    {
      char v11 = [v7 username];
      id v12 = v11;
      if (v11 && [v11 isEqual:v9])
      {
        id v13 = _AKLogSystem();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v14 = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Passing password down to next queued client.", v14, 2u);
        }

        [v7 _setPassword:v8];
      }
    }
  }
}

- (void)_updateContextWithCachedPassword:(id)a3
{
  id v4 = a3;
  if ([v4 serviceType] == (id)2
    || ![v4 isContextEligibleForSilentAuth]
    || ([v4 ignorePasswordCache] & 1) != 0
    || ([v4 _password], char v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ignoring password cache", buf, 2u);
    }
  }
  else
  {
    id v7 = [v4 username];

    if (!v7) {
      goto LABEL_8;
    }
    expiringCache = self->_expiringCache;
    id v9 = [v4 username];
    id v6 = [(AKExpiringCache *)expiringCache objectForKey:v9];

    if (v6)
    {
      uint64_t v10 = _AKLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Password populated from cache.", v11, 2u);
      }

      [v4 _setPassword:v6];
    }
  }

LABEL_8:
}

- (AKAuthenticationSurrogateManager)surrogateManager
{
  return self->_surrogateManager;
}

- (void)setSurrogateManager:(id)a3
{
}

- (NSMutableArray)pendingTrafficRequests
{
  return self->_pendingTrafficRequests;
}

- (void)setPendingTrafficRequests:(id)a3
{
}

- (NSMutableDictionary)authenticatingApps
{
  return self->_authenticatingApps;
}

- (void)setAuthenticatingApps:(id)a3
{
}

- (NSMutableDictionary)authenticatingDaemons
{
  return self->_authenticatingDaemons;
}

- (void)setAuthenticatingDaemons:(id)a3
{
}

- (NSMutableDictionary)authenticatedServerEndpointRequests
{
  return self->_authenticatedServerEndpointRequests;
}

- (void)setAuthenticatedServerEndpointRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticatedServerEndpointRequests, 0);
  objc_storeStrong((id *)&self->_authenticatingDaemons, 0);
  objc_storeStrong((id *)&self->_authenticatingApps, 0);
  objc_storeStrong((id *)&self->_pendingTrafficRequests, 0);
  objc_storeStrong((id *)&self->_surrogateManager, 0);
  objc_storeStrong((id *)&self->_trafficQueue, 0);
  objc_storeStrong((id *)&self->_clearanceQueue, 0);

  objc_storeStrong((id *)&self->_expiringCache, 0);
}

@end