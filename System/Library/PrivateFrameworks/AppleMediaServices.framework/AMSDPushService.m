@interface AMSDPushService
+ (AMSDPushService)sharedService;
+ (BOOL)isConnectionEntitled:(id)a3;
- (AMSDPushService)init;
- (AMSPushHandler)pushHandler;
- (APSConnection)productionConnection;
- (MGNotificationTokenStruct)deviceNameChangedToken;
- (NSArray)classConsumers;
- (NSArray)instanceConsumers;
- (NSMutableDictionary)connections;
- (NSMutableDictionary)pushTokens;
- (OS_dispatch_queue)connectionQueue;
- (OS_dispatch_queue)registerTaskQueue;
- (id)_bagForAccount:(id)a3;
- (id)_connectionForEnvironment:(id)a3;
- (id)_establishConnectionsIfNeeded;
- (id)_postPushTokensIfNeeded;
- (id)_postPushTokensWithOptions:(int64_t)a3;
- (id)_productionPushAccounts;
- (id)_pushEnvironmentForAccount:(id)a3;
- (id)_pushEnvironmentFromBag:(id)a3;
- (id)_pushTokenForEnvironment:(id)a3;
- (id)_registerAccounts:(id)a3 withOptions:(int64_t)a4;
- (id)_sandboxPushAccounts;
- (id)_startConnectionWithEnvironment:(id)a3;
- (id)forceRegisterAccount:(id)a3;
- (os_unfair_lock_s)connectionLock;
- (void)_bagChanged;
- (void)_deviceNameChanged;
- (void)_establishConnectionsAndPostPushTokens;
- (void)_shutDownConnection:(id)a3 forEnvironment:(id)a4;
- (void)_updateDeviceAccountPrivacyIfNeeded;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connectionDidReconnect:(id)a3;
- (void)dealloc;
- (void)registerAllTokens;
- (void)registerTokensIfNeeded;
- (void)setClassConsumers:(id)a3;
- (void)setDeviceNameChangedToken:(MGNotificationTokenStruct *)a3;
- (void)setInstanceConsumers:(id)a3;
- (void)setProductionConnection:(id)a3;
- (void)setRegisterTaskQueue:(id)a3;
@end

@implementation AMSDPushService

- (AMSDPushService)init
{
  v42.receiver = self;
  v42.super_class = (Class)AMSDPushService;
  v2 = [(AMSDPushService *)&v42 init];
  if (v2)
  {
    v3 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v3)
    {
      v3 = +[AMSLogConfig sharedConfig];
    }
    v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = objc_opt_class();
      v6 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v47 = v5;
      __int16 v48 = 2114;
      v49 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting Service", buf, 0x16u);
    }
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.AMSDPushService", v7);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.AMSDPushService.registerTask", v10);
    registerTaskQueue = v2->_registerTaskQueue;
    v2->_registerTaskQueue = (OS_dispatch_queue *)v11;

    v2->_connectionLock._os_unfair_lock_opaque = 0;
    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    connections = v2->_connections;
    v2->_connections = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pushTokens = v2->_pushTokens;
    v2->_pushTokens = v15;

    classConsumers = v2->_classConsumers;
    v2->_classConsumers = (NSArray *)&__NSArray0__struct;

    if (+[AMSUnitTests isRunningUnitTests])
    {
      instanceConsumers = v2->_instanceConsumers;
      v2->_instanceConsumers = (NSArray *)&__NSArray0__struct;
    }
    else
    {
      uint64_t v19 = +[AMSDMultiUserController sharedController];
      instanceConsumers = (void *)v19;
      if (v19)
      {
        uint64_t v45 = v19;
        uint64_t v20 = +[NSArray arrayWithObjects:&v45 count:1];
        v21 = v2->_instanceConsumers;
        v2->_instanceConsumers = (NSArray *)v20;
      }
      else
      {
        v21 = v2->_instanceConsumers;
        v2->_instanceConsumers = (NSArray *)&__NSArray0__struct;
      }
    }
    v44[0] = @"26";
    v44[1] = AMSPushActionTypeAlertNotification;
    v44[2] = AMSPushActionTypeDismissQRDialog;
    v44[3] = AMSPushActionTypeEngagement;
    v44[4] = AMSPushActionTypeRichNotification;
    v44[5] = AMSPushActionTypeFetchDataCache;
    v44[6] = AMSPushActionTypeFollowUp;
    v44[7] = @"24";
    v22 = +[NSArray arrayWithObjects:v44 count:8];
    v23 = +[NSMutableSet setWithArray:v22];

    [v23 addObject:@"27"];
    id v24 = objc_alloc((Class)AMSPushConfiguration);
    id v25 = [v23 copy];
    id v26 = [v24 initWithEnabledActionTypes:v25];

    v27 = [AMSDPushHandler alloc];
    v28 = +[AMSDBag defaultBag];
    v29 = [(AMSDPushHandler *)v27 initWithConfiguration:v26 bag:v28];
    pushHandler = v2->_pushHandler;
    v2->_pushHandler = (AMSPushHandler *)v29;

    v31 = +[NSNotificationCenter defaultCenter];
    [v31 addObserver:v2 selector:"_bagChanged" name:AMSBagChangedNotification object:0];

    objc_initWeak((id *)buf, v2);
    CFStringRef v43 = @"UserAssignedDeviceName";
    +[NSArray arrayWithObjects:&v43 count:1];
    v37 = _NSConcreteStackBlock;
    uint64_t v38 = 3221225472;
    v39 = sub_100053718;
    v40 = &unk_100113F48;
    objc_copyWeak(&v41, (id *)buf);
    v2->_deviceNameChangedToken = (MGNotificationTokenStruct *)MGRegisterForUpdates();
    v32 = +[AMSDBag defaultBag];
    v33 = [(AMSDPushService *)v2 _pushEnvironmentFromBag:v32];

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100053758;
    v35[3] = &unk_100113F70;
    v36 = v2;
    [v33 addSuccessBlock:v35];

    objc_destroyWeak(&v41);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

- (void)dealloc
{
  [(AMSDPushService *)self deviceNameChangedToken];
  MGCancelNotifications();
  v3.receiver = self;
  v3.super_class = (Class)AMSDPushService;
  [(AMSDPushService *)&v3 dealloc];
}

+ (AMSDPushService)sharedService
{
  if (qword_1001304B8 != -1) {
    dispatch_once(&qword_1001304B8, &stru_100113F90);
  }
  v2 = (void *)qword_1001304C0;
  return (AMSDPushService *)v2;
}

- (id)forceRegisterAccount:(id)a3
{
  if (a3)
  {
    id v10 = a3;
    id v4 = a3;
    uint64_t v5 = +[NSArray arrayWithObjects:&v10 count:1];

    v6 = -[AMSDPushService _registerAccounts:withOptions:](self, "_registerAccounts:withOptions:", v5, 1, v10);
  }
  else
  {
    id v7 = 0;
    dispatch_queue_t v8 = AMSError();
    v6 = +[AMSPromise promiseWithError:v8];
  }
  return v6;
}

+ (BOOL)isConnectionEntitled:(id)a3
{
  objc_super v3 = [a3 valueForEntitlement:@"com.apple.private.applemediaservices"];
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

- (void)registerAllTokens
{
  id v3 = (id)AMSSetLogKey();
  id v4 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  unsigned __int8 v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v6;
    __int16 v20 = 2114;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received request to register all tokens", buf, 0x16u);
  }
  dispatch_queue_t v8 = [(AMSDPushService *)self _establishConnectionsIfNeeded];
  id v17 = 0;
  unsigned __int8 v9 = [v8 resultWithError:&v17];
  id v10 = v17;

  if (v9)
  {
    dispatch_queue_t v11 = [(AMSDPushService *)self _postPushTokensWithOptions:1];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100053C60;
    v16[3] = &unk_1001138F8;
    v16[4] = self;
    [v11 addFinishBlock:v16];
  }
  else
  {
    dispatch_queue_t v11 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v11)
    {
      dispatch_queue_t v11 = +[AMSLogConfig sharedConfig];
    }
    v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      v14 = AMSLogKey();
      v15 = AMSLogableError();
      *(_DWORD *)buf = 138543874;
      uint64_t v19 = v13;
      __int16 v20 = 2114;
      v21 = v14;
      __int16 v22 = 2114;
      v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to establish connections. error = %{public}@", buf, 0x20u);
    }
  }
}

- (void)registerTokensIfNeeded
{
  id v3 = (id)AMSSetLogKey();
  id v4 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  unsigned __int8 v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    dispatch_queue_t v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received request to register tokens", (uint8_t *)&v8, 0x16u);
  }
  [(AMSDPushService *)self _establishConnectionsAndPostPushTokens];
  [(AMSDPushService *)self _updateDeviceAccountPrivacyIfNeeded];
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (id)AMSSetLogKey();
  id v7 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  int v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = AMSLogKey();
    dispatch_queue_t v11 = (void *)v10;
    CFStringRef v12 = @"false";
    int v14 = 138543874;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    if (v4) {
      CFStringRef v12 = @"true";
    }
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    CFStringRef v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] APS is connected: %{public}@", (uint8_t *)&v14, 0x20u);
  }
  if (v4)
  {
    uint64_t v13 = [(AMSDPushService *)self _postPushTokensIfNeeded];
    [v13 resultWithError:0];
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  id v6 = (id)AMSSetLogKey();
  id v7 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  int v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v40 = v9;
    __int16 v41 = 2114;
    objc_super v42 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received message", buf, 0x16u);
  }
  dispatch_queue_t v11 = [v5 topic];
  unsigned int v12 = [v11 isEqualToString:@"com.apple.amsaccountsd"];

  if (v12)
  {
    uint64_t v13 = [v5 userInfo];
    int v14 = [(AMSDPushService *)self pushHandler];
    unsigned int v15 = [v14 shouldHandleNotification:v13];

    if (v15)
    {
      __int16 v16 = [(AMSDPushService *)self pushHandler];
      [v16 handleNotification:v13];
    }
    else
    {
      __int16 v16 = +[AMSLogConfig sharedAccountsDaemonConfig];
      if (!v16)
      {
        __int16 v16 = +[AMSLogConfig sharedConfig];
      }
      id v26 = [v16 OSLogObject];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = objc_opt_class();
        v28 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v40 = v27;
        __int16 v41 = 2114;
        objc_super v42 = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Message not handled and dropped.", buf, 0x16u);
      }
    }
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v17 = [(AMSDPushService *)self classConsumers];
    id v18 = [v17 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v34;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v34 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v33 + 1) + 8 * i) handlePushNotification:v5];
        }
        id v19 = [v17 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v19);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v13 = [(AMSDPushService *)self instanceConsumers];
    id v22 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v30;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v30 != v24) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v29 + 1) + 8 * (void)j) handlePushNotification:v5];
        }
        id v23 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v23);
    }
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)AMSSetLogKey();
  uint64_t v9 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v9)
  {
    uint64_t v9 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    unsigned int v12 = AMSLogKey();
    uint64_t v13 = [v7 base64EncodedStringWithOptions:0];
    int v14 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543874;
    uint64_t v37 = v11;
    __int16 v38 = 2114;
    v39 = v12;
    __int16 v40 = 2114;
    __int16 v41 = v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received token: %{public}@", buf, 0x20u);
  }
  os_unfair_lock_assert_not_owner(&self->_connectionLock);
  os_unfair_lock_lock_with_options();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  unsigned int v15 = [(NSMutableDictionary *)self->_connections allKeys];
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
        uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v21 = [(NSMutableDictionary *)self->_connections objectForKeyedSubscript:v20];

        if (v21 == v6) {
          [(NSMutableDictionary *)self->_pushTokens setObject:v7 forKeyedSubscript:v20];
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v17);
  }

  os_unfair_lock_assert_owner(&self->_connectionLock);
  os_unfair_lock_unlock(&self->_connectionLock);
  if ((+[AMSUnitTests isRunningUnitTests] & 1) == 0)
  {
    id v22 = [(AMSDPushService *)self _postPushTokensIfNeeded];
    id v30 = 0;
    unsigned __int8 v23 = [v22 resultWithError:&v30];
    id v24 = v30;

    if ((v23 & 1) == 0)
    {
      id v25 = +[AMSLogConfig sharedAccountsDaemonConfig];
      if (!v25)
      {
        id v25 = +[AMSLogConfig sharedConfig];
      }
      id v26 = [v25 OSLogObject];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = objc_opt_class();
        v28 = AMSLogKey();
        long long v29 = AMSLogableError();
        *(_DWORD *)buf = 138543874;
        uint64_t v37 = v27;
        __int16 v38 = 2114;
        v39 = v28;
        __int16 v40 = 2114;
        __int16 v41 = v29;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to post push tokens. %{public}@", buf, 0x20u);
      }
    }
  }
}

- (void)connectionDidReconnect:(id)a3
{
  BOOL v4 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v4)
  {
    BOOL v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    int v9 = 138543618;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    unsigned int v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] APS reconnected.", (uint8_t *)&v9, 0x16u);
  }
  id v8 = [(AMSDPushService *)self _postPushTokensIfNeeded];
}

- (void)_bagChanged
{
  id v3 = (id)AMSSetLogKey();
  BOOL v4 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v4)
  {
    BOOL v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    __int16 v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Bag changed", (uint8_t *)&v8, 0x16u);
  }
  [(AMSDPushService *)self _establishConnectionsAndPostPushTokens];
}

- (void)_deviceNameChanged
{
  id v3 = (id)AMSSetLogKey();
  BOOL v4 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v4)
  {
    BOOL v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v6;
    __int16 v19 = 2114;
    uint64_t v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Device name changed", buf, 0x16u);
  }
  int v8 = [(AMSDPushService *)self _postPushTokensIfNeeded];
  id v16 = 0;
  unsigned __int8 v9 = [v8 resultWithError:&v16];
  id v10 = v16;

  if ((v9 & 1) == 0)
  {
    __int16 v11 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v11)
    {
      __int16 v11 = +[AMSLogConfig sharedConfig];
    }
    unsigned int v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      int v14 = AMSLogKey();
      unsigned int v15 = AMSLogableError();
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v13;
      __int16 v19 = 2114;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      id v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to post push tokens. %{public}@", buf, 0x20u);
    }
  }
}

- (id)_productionPushAccounts
{
  v2 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", AMSAccountMediaTypeProduction, 0);
  id v3 = +[ACAccountStore ams_sharedAccountStore];
  BOOL v4 = objc_msgSend(v3, "ams_iTunesAccountsForMediaTypes:", v2);

  return v4;
}

- (id)_sandboxPushAccounts
{
  v2 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", AMSAccountMediaTypeAppStoreBeta, AMSAccountMediaTypeAppStoreSandbox, 0);
  id v3 = +[ACAccountStore ams_sharedAccountStore];
  BOOL v4 = objc_msgSend(v3, "ams_iTunesAccountsForMediaTypes:", v2);

  return v4;
}

- (id)_bagForAccount:(id)a3
{
  if (objc_msgSend(a3, "ams_isSandboxAccount")) {
    +[AMSDBag bagForMediaType:AMSAccountMediaTypeAppStoreSandbox];
  }
  else {
  id v3 = +[AMSDBag defaultBag];
  }
  return v3;
}

- (id)_connectionForEnvironment:(id)a3
{
  p_connectionLock = &self->_connectionLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_connectionLock);
  os_unfair_lock_lock_with_options();
  uint64_t v6 = [(NSMutableDictionary *)self->_connections objectForKeyedSubscript:v5];

  os_unfair_lock_assert_owner(p_connectionLock);
  os_unfair_lock_unlock(p_connectionLock);
  return v6;
}

- (void)_establishConnectionsAndPostPushTokens
{
  os_unfair_lock_assert_not_owner(&self->_connectionLock);
  id v3 = [(AMSDPushService *)self _establishConnectionsIfNeeded];
  id v11 = 0;
  unsigned __int8 v4 = [v3 resultWithError:&v11];
  id v5 = v11;

  if (v4)
  {
    uint64_t v6 = [(AMSDPushService *)self _postPushTokensIfNeeded];
    [v6 resultWithError:0];
  }
  else
  {
    uint64_t v6 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v6)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      unsigned __int8 v9 = AMSLogKey();
      id v10 = AMSLogableError();
      *(_DWORD *)buf = 138543874;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      unsigned int v15 = v9;
      __int16 v16 = 2114;
      id v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to establish connections. error = %{public}@", buf, 0x20u);
    }
  }
}

- (id)_establishConnectionsIfNeeded
{
  os_unfair_lock_assert_not_owner(&self->_connectionLock);
  id v3 = [(AMSDPushService *)self _productionPushAccounts];
  unsigned __int8 v4 = [(AMSDPushService *)self _sandboxPushAccounts];
  id v5 = [v3 thenWithBlock:&stru_100113FB0];
  uint64_t v6 = [v4 thenWithBlock:&stru_100113FD0];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100055124;
  v17[3] = &unk_1001130F0;
  v17[4] = self;
  id v7 = [v5 thenWithBlock:v17];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100055250;
  v16[3] = &unk_1001130F0;
  v16[4] = self;
  uint64_t v8 = [v6 thenWithBlock:v16];
  v18[0] = v8;
  v18[1] = v7;
  unsigned __int8 v9 = +[NSArray arrayWithObjects:v18 count:2];
  id v10 = +[AMSPromise promiseWithAll:v9];
  id v11 = [v10 thenWithBlock:&stru_100114030];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100055524;
  v15[3] = &unk_100112320;
  v15[4] = self;
  unsigned int v12 = [v11 thenWithBlock:v15];
  uint64_t v13 = [v12 binaryPromiseAdapter];

  return v13;
}

- (id)_pushEnvironmentForAccount:(id)a3
{
  unsigned __int8 v4 = [(AMSDPushService *)self _bagForAccount:a3];
  id v5 = [(AMSDPushService *)self _pushEnvironmentFromBag:v4];

  return v5;
}

- (id)_pushEnvironmentFromBag:(id)a3
{
  id v4 = a3;
  id v5 = +[AMSDefaults pushEnvironment];
  if (v5 == (id)1)
  {
    uint64_t v6 = (id *)&APSEnvironmentProduction;
  }
  else
  {
    if (v5 != (id)2) {
      goto LABEL_7;
    }
    uint64_t v6 = (id *)&APSEnvironmentDevelopment;
  }
  id v7 = *v6;
  if (v7)
  {
    id v8 = v7;
    goto LABEL_9;
  }
LABEL_7:
  id v8 = APSEnvironmentProduction;
  if (os_variant_has_internal_content())
  {
    unsigned __int8 v9 = [v4 stringForKey:@"push-notifications/environment"];
    id v10 = [v9 valuePromise];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100055ABC;
    v15[3] = &unk_100111F20;
    v15[4] = self;
    [v10 addErrorBlock:v15];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100055BF0;
    v13[3] = &unk_100113578;
    id v8 = v8;
    id v14 = v8;
    id v11 = [v10 catchWithBlock:v13];

    goto LABEL_10;
  }
LABEL_9:
  id v11 = +[AMSPromise promiseWithResult:v8];
LABEL_10:

  return v11;
}

- (id)_pushTokenForEnvironment:(id)a3
{
  p_connectionLock = &self->_connectionLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_connectionLock);
  os_unfair_lock_lock_with_options();
  uint64_t v6 = [(NSMutableDictionary *)self->_pushTokens objectForKeyedSubscript:v5];

  os_unfair_lock_assert_owner(p_connectionLock);
  os_unfair_lock_unlock(p_connectionLock);
  return v6;
}

- (id)_postPushTokensIfNeeded
{
  return [(AMSDPushService *)self _postPushTokensWithOptions:0];
}

- (id)_postPushTokensWithOptions:(int64_t)a3
{
  os_unfair_lock_assert_not_owner(&self->_connectionLock);
  id v5 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v30 = v7;
    __int16 v31 = 2114;
    long long v32 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Received request to post push token if needed.", buf, 0x16u);
  }
  unsigned __int8 v9 = [(AMSDPushService *)self _productionPushAccounts];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100056030;
  v26[3] = &unk_1001140C0;
  uint64_t v27 = &stru_100114098;
  id v10 = [v9 thenWithBlock:v26];

  id v11 = [(AMSDPushService *)self _sandboxPushAccounts];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100056094;
  v24[3] = &unk_1001140C0;
  id v25 = &stru_100114098;
  unsigned int v12 = [v11 thenWithBlock:v24];

  uint64_t v13 = +[ACAccountStore ams_sharedAccountStore];
  id v14 = objc_msgSend(v13, "ams_fetchLocaliTunesAccount");
  unsigned int v15 = [v14 thenWithBlock:&stru_1001140E0];

  v28[0] = v10;
  v28[1] = v12;
  v28[2] = v15;
  __int16 v16 = +[NSArray arrayWithObjects:v28 count:3];
  id v17 = +[AMSPromise promiseWithAll:v16];
  uint64_t v18 = [v17 thenWithBlock:&stru_100114100];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100056290;
  v23[3] = &unk_100114128;
  v23[4] = self;
  v23[5] = a3;
  __int16 v19 = [v18 thenWithBlock:v23];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000562A0;
  v22[3] = &unk_100111F20;
  v22[4] = self;
  [v19 addErrorBlock:v22];
  uint64_t v20 = [v19 binaryPromiseAdapter];

  return v20;
}

- (id)_registerAccounts:(id)a3 withOptions:(int64_t)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000565A8;
    v15[3] = &unk_1001141A0;
    v15[4] = self;
    void v15[5] = a4;
    uint64_t v7 = objc_msgSend(v6, "ams_mapWithTransform:", v15);
    uint64_t v8 = +[AMSPromise promiseWithAll:v7];
  }
  else
  {
    unsigned __int8 v9 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v9)
    {
      unsigned __int8 v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = objc_opt_class();
      unsigned int v12 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      __int16 v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] No accounts to register.", buf, 0x16u);
    }
    uint64_t v7 = +[AMSBinaryPromise promiseWithSuccess];
    uint64_t v8 = [v7 promiseAdapter];
  }
  uint64_t v13 = (void *)v8;

  return v13;
}

- (void)_shutDownConnection:(id)a3 forEnvironment:(id)a4
{
  p_connectionLock = &self->_connectionLock;
  id v8 = a4;
  id v7 = a3;
  os_unfair_lock_assert_owner(p_connectionLock);
  [v7 shutdown];

  [(NSMutableDictionary *)self->_connections setObject:0 forKeyedSubscript:v8];
  [(NSMutableDictionary *)self->_pushTokens setObject:0 forKeyedSubscript:v8];
}

- (id)_startConnectionWithEnvironment:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_connectionLock);
  os_unfair_lock_lock(&self->_connectionLock);
  id v5 = [(NSMutableDictionary *)self->_connections objectForKeyedSubscript:v4];
  if (v5)
  {
    os_unfair_lock_assert_owner(&self->_connectionLock);
    os_unfair_lock_unlock(&self->_connectionLock);
    id v6 = +[AMSBinaryPromise promiseWithSuccess];
  }
  else if (+[APSConnection isValidEnvironment:v4])
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    [v7 addObject:@"com.apple.amsaccountsd"];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v8 = [(AMSDPushService *)self classConsumers];
    id v9 = [v8 countByEnumeratingWithState:&v40 objects:v53 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v41;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v41 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          if ([v13 shouldEnablePushTopic])
          {
            id v14 = [v13 pushTopic];
            [v7 addObject:v14];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v40 objects:v53 count:16];
      }
      while (v10);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    unsigned int v15 = [(AMSDPushService *)self instanceConsumers];
    id v16 = [v15 countByEnumeratingWithState:&v36 objects:v52 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v37;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v37 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
          if ([v20 shouldEnablePushTopic])
          {
            __int16 v21 = [v20 pushTopic];
            [v7 addObject:v21];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v36 objects:v52 count:16];
      }
      while (v17);
    }

    id v22 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v22)
    {
      id v22 = +[AMSLogConfig sharedConfig];
    }
    unsigned __int8 v23 = [v22 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = objc_opt_class();
      id v25 = AMSLogKey();
      *(_DWORD *)buf = 138544130;
      uint64_t v45 = v24;
      __int16 v46 = 2114;
      uint64_t v47 = v25;
      __int16 v48 = 2114;
      id v49 = v4;
      __int16 v50 = 2114;
      id v51 = v7;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting APS connection. (environment: %{public}@; topics: %{public}@)",
        buf,
        0x2Au);
    }
    id v26 = objc_alloc((Class)APSConnection);
    uint64_t v27 = [(AMSDPushService *)self connectionQueue];
    id v28 = [v26 initWithEnvironmentName:v4 namedDelegatePort:@"com.apple.aps.amsaccountsd" queue:v27];

    [(NSMutableDictionary *)self->_connections setObject:v28 forKeyedSubscript:v4];
    os_unfair_lock_assert_owner(&self->_connectionLock);
    os_unfair_lock_unlock(&self->_connectionLock);
    [v28 setDelegate:self];
    [v28 _setEnabledTopics:v7];
    id v6 = +[AMSBinaryPromise promiseWithSuccess];
  }
  else
  {
    os_unfair_lock_assert_owner(&self->_connectionLock);
    os_unfair_lock_unlock(&self->_connectionLock);
    long long v29 = AMSErrorWithFormat();
    uint64_t v30 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v30)
    {
      uint64_t v30 = +[AMSLogConfig sharedConfig];
    }
    __int16 v31 = [v30 OSLogObject];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = objc_opt_class();
      long long v33 = AMSLogKey();
      long long v34 = AMSLogableError();
      *(_DWORD *)buf = 138543874;
      uint64_t v45 = v32;
      __int16 v46 = 2114;
      uint64_t v47 = v33;
      __int16 v48 = 2114;
      id v49 = v34;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to start APS connection. %{public}@", buf, 0x20u);
    }
    id v6 = +[AMSBinaryPromise promiseWithError:v29];
  }
  return v6;
}

- (void)_updateDeviceAccountPrivacyIfNeeded
{
  id v3 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    unsigned int v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Evaluating if to run privacy updater", buf, 0x16u);
  }
  if ((+[AMSUnitTests isRunningUnitTests] & 1) == 0)
  {
    id v7 = +[DeviceAccountPrivacyUpdater shared];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100057A04;
    v8[3] = &unk_100111F20;
    v8[4] = self;
    [v7 updateIfNeededWithCompletionHandler:v8];
  }
}

- (NSArray)classConsumers
{
  return self->_classConsumers;
}

- (void)setClassConsumers:(id)a3
{
}

- (os_unfair_lock_s)connectionLock
{
  return self->_connectionLock;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (NSMutableDictionary)connections
{
  return self->_connections;
}

- (NSArray)instanceConsumers
{
  return self->_instanceConsumers;
}

- (void)setInstanceConsumers:(id)a3
{
}

- (APSConnection)productionConnection
{
  return self->_productionConnection;
}

- (void)setProductionConnection:(id)a3
{
}

- (AMSPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (NSMutableDictionary)pushTokens
{
  return self->_pushTokens;
}

- (OS_dispatch_queue)registerTaskQueue
{
  return self->_registerTaskQueue;
}

- (void)setRegisterTaskQueue:(id)a3
{
}

- (MGNotificationTokenStruct)deviceNameChangedToken
{
  return self->_deviceNameChangedToken;
}

- (void)setDeviceNameChangedToken:(MGNotificationTokenStruct *)a3
{
  self->_deviceNameChangedToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registerTaskQueue, 0);
  objc_storeStrong((id *)&self->_pushTokens, 0);
  objc_storeStrong((id *)&self->_pushHandler, 0);
  objc_storeStrong((id *)&self->_productionConnection, 0);
  objc_storeStrong((id *)&self->_instanceConsumers, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_classConsumers, 0);
}

@end