@interface AMSDDaemonRunLoop
- (AMSDDaemonRunLoop)init;
- (BOOL)_performStartup;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableSet)connections;
- (id)_previousBuildVersion;
- (os_unfair_lock_s)connectionsLock;
- (void)_clearDanglingCookieDatabasesWithCompletion:(id)a3;
- (void)_handleBiometricsProvisioningNotification;
- (void)_handleCachedDataUpdate;
- (void)_handleDeviceLanguageChangeNotification:(id)a3;
- (void)_handleNFCAccessoryNotification:(id)a3;
- (void)_setupAccountDataSync;
- (void)_setupMultiUser;
- (void)_setupNotifications;
- (void)_setupPollJobs;
- (void)_setupSignalHandlers;
- (void)_startXPC;
- (void)_tearDownMultiUser;
- (void)_updateRegulatoryEligibility;
- (void)dealloc;
- (void)runUntilIdleExit;
- (void)setConnections:(id)a3;
@end

@implementation AMSDDaemonRunLoop

- (void)runUntilIdleExit
{
  if ([(AMSDDaemonRunLoop *)self _performStartup])
  {
    id v3 = (id)AMSSetLogKey();
    if ((CFRunLoopRunInMode(kCFRunLoopDefaultMode, 15.0, 0) - 1) >= 2)
    {
      do
      {
        id v4 = (id)AMSSetLogKey();
      }
      while ((CFRunLoopRunInMode(kCFRunLoopDefaultMode, 15.0, 0) - 1) > 1);
    }
    v5 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v5)
    {
      v5 = +[AMSLogConfig sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      v8 = AMSLogKey();
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Idle-exit", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = (id)AMSSetLogKey();
  uint64_t v7 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v7)
  {
    uint64_t v7 = +[AMSLogConfig sharedConfig];
  }
  v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = AMSLogKey();
    unsigned int v11 = [v5 processIdentifier];
    v12 = objc_msgSend(v5, "amsd_processName");
    *(_DWORD *)buf = 138544386;
    uint64_t v41 = v9;
    __int16 v42 = 2114;
    v43 = v10;
    __int16 v44 = 1024;
    unsigned int v45 = v11;
    __int16 v46 = 2114;
    v47 = v12;
    __int16 v48 = 2114;
    id v49 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received a new XPC connection. processID = %d | processName = %{public}@ | connection = %{public}@", buf, 0x30u);
  }
  v13 = [v5 serviceName];
  v14 = +[AMSDServiceConnection machServiceName];
  unsigned int v15 = [v13 isEqualToString:v14];

  if (!v15)
  {
    v21 = [v5 serviceName];
    v22 = +[AMSMultiUserService machServiceName];
    unsigned int v23 = [v21 isEqualToString:v22];

    if (v23)
    {
      if (+[AMSMultiUserService isConnectionEntitled:v5])
      {
        v24 = +[AMSMultiUserService serviceInterface];
        [v5 setExportedInterface:v24];

        v25 = +[AMSDMultiUserService sharedService];
        [v5 setExportedObject:v25];

        [v5 resume];
        goto LABEL_10;
      }
      v27 = +[AMSLogConfig sharedAccountsDaemonConfig];
      if (!v27)
      {
        v27 = +[AMSLogConfig sharedConfig];
      }
      v28 = [v27 OSLogObject];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = objc_opt_class();
        v30 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v41 = v29;
        __int16 v42 = 2114;
        v43 = v30;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Connection interrupted (entitlements)", buf, 0x16u);
      }
    }
    BOOL v26 = 0;
    goto LABEL_17;
  }
  v16 = [[AMSDServiceConnection alloc] initWithConnection:v5];
  v17 = AMSLogKey();
  [(AMSDServiceConnection *)v16 setLogKey:v17];

  os_unfair_lock_lock_with_options();
  v18 = [(AMSDDaemonRunLoop *)self connections];
  [v18 addObject:v16];

  os_unfair_lock_unlock(&self->_connectionsLock);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100024C50;
  v38[3] = &unk_100112170;
  v38[4] = self;
  v19 = v16;
  v39 = v19;
  [v5 setInterruptionHandler:v38];
  v32 = _NSConcreteStackBlock;
  uint64_t v33 = 3221225472;
  v34 = sub_100012580;
  v35 = &unk_100112170;
  v36 = self;
  v37 = v19;
  v20 = v19;
  [v5 setInvalidationHandler:&v32];
  objc_msgSend(v5, "resume", v32, v33, v34, v35, v36);

LABEL_10:
  BOOL v26 = 1;
LABEL_17:

  return v26;
}

- (NSMutableSet)connections
{
  return self->_connections;
}

- (AMSDDaemonRunLoop)init
{
  v6.receiver = self;
  v6.super_class = (Class)AMSDDaemonRunLoop;
  v2 = [(AMSDDaemonRunLoop *)&v6 init];
  if (v2)
  {
    id v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    connections = v2->_connections;
    v2->_connections = v3;

    v2->_connectionsLock._os_unfair_lock_opaque = 0;
    [(AMSDDaemonRunLoop *)v2 _setupSignalHandlers];
  }
  return v2;
}

- (void)dealloc
{
  sigTermSource = self->_sigTermSource;
  if (sigTermSource)
  {
    dispatch_source_cancel(sigTermSource);
    id v4 = self->_sigTermSource;
    self->_sigTermSource = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)AMSDDaemonRunLoop;
  [(AMSDDaemonRunLoop *)&v5 dealloc];
}

- (void)_clearDanglingCookieDatabasesWithCompletion:(id)a3
{
  id v5 = a3;
  objc_super v6 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v6)
  {
    objc_super v6 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = AMSLogKey();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = v9;
    if (v8)
    {
      uint64_t v3 = AMSLogKey();
      +[NSString stringWithFormat:@"%@: [%@] ", v10, v3];
    }
    else
    {
      +[NSString stringWithFormat:@"%@: ", v9];
    unsigned int v11 = };
    *(_DWORD *)buf = 138543362;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Clearing dangling cookie databases", buf, 0xCu);
    if (v8)
    {

      unsigned int v11 = (void *)v3;
    }
  }
  v12 = +[AMSCookieService sharedService];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100024EA8;
  v14[3] = &unk_1001124A8;
  v14[4] = self;
  id v15 = v5;
  id v13 = v5;
  [v12 clearDanglingCookieDatabasesWithCompletion:v14];
}

- (BOOL)_performStartup
{
  id v3 = (id)AMSSetLogKey();
  id v4 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting daemon", buf, 0x16u);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000252C0;
  v9[3] = &unk_1001124D0;
  v9[4] = self;
  +[AMSDTransactionStore takeKeepAliveTransaction:@"com.apple.amsaccountsd.performStartup" whilePerformingBlock:v9];
  return 1;
}

- (void)_handleBiometricsProvisioningNotification
{
  id v2 = AMSAccountMediaTypeProduction;
  id v5 = +[ACAccountStore ams_sharedAccountStoreForMediaType:v2];
  id v3 = objc_msgSend(v5, "ams_activeiTunesAccountForMediaType:", v2);

  id v4 = [v3 thenWithBlock:&stru_100112510];
  [v3 waitUntilFinished];
}

- (void)_handleNFCAccessoryNotification:(id)a3
{
  id v3 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v4 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v4)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = AMSLogKey();
      int v13 = 138543874;
      uint64_t v14 = v6;
      __int16 v15 = 2114;
      v16 = v7;
      __int16 v17 = 2114;
      id v18 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] NFC URL tag URL detected. Notification = %{public}@", (uint8_t *)&v13, 0x20u);
    }
    v8 = [v3 object];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v10 = [v3 object];
      uint64_t v11 = +[NSURL URLWithString:v10];

      if (v11)
      {
        __int16 v12 = objc_alloc_init(AMSDNFCAccessory);
        [(AMSDNFCAccessory *)v12 handleInboundURL:v11];
      }
    }
  }
}

- (void)_handleDeviceLanguageChangeNotification:(id)a3
{
  id v4 = objc_alloc_init(AMSDUpdateDeviceLanguageTask);
  id v3 = [(AMSDUpdateDeviceLanguageTask *)v4 perform];
}

- (id)_previousBuildVersion
{
  CFPreferencesAppSynchronize(@"com.apple.springboard");
  id v2 = (void *)CFPreferencesCopyAppValue(@"SBLastSystemVersion", @"com.apple.springboard");
  if (!v2)
  {
    CFPreferencesAppSynchronize(@"com.apple.migration");
    id v2 = (void *)CFPreferencesCopyAppValue(@"LastSystemVersion", @"com.apple.migration");
  }
  return v2;
}

- (void)_tearDownMultiUser
{
  id v2 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v2)
  {
    id v2 = +[AMSLogConfig sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    uint64_t v6 = objc_opt_class();
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Multi-User is shutting down", (uint8_t *)&v5, 0xCu);
  }

  id v4 = +[AMSDMultiUserController sharedController];
  [v4 teardownMultiUser];
}

- (void)_setupMultiUser
{
  id v4 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  int v5 = [v4 OSLogObject];
  uint64_t v6 = &swift_willThrow_ptr;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = AMSLogKey();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = v8;
    if (v7)
    {
      uint64_t v2 = AMSLogKey();
      +[NSString stringWithFormat:@"%@: [%@] ", v9, v2];
    }
    else
    {
      +[NSString stringWithFormat:@"%@: ", v8];
    uint64_t v10 = };
    *(_DWORD *)buf = 138543362;
    v36 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Setting up multi-user.", buf, 0xCu);
    if (v7)
    {

      uint64_t v10 = (void *)v2;
    }

    uint64_t v6 = &swift_willThrow_ptr;
  }

  uint64_t v11 = +[AMSDMultiUserController sharedController];
  __int16 v12 = [v11 cloudContainer];

  if (v12)
  {
    int v13 = +[AMSDMultiUserController sharedController];
    uint64_t v14 = [v13 homeManager];
    v39 = v12;
    __int16 v15 = +[NSArray arrayWithObjects:&v39 count:1];
    [v14 registerToAcceptCloudSharesForContainers:v15];
  }
  id v16 = +[AMSDMultiUserService sharedService];
  __int16 v17 = +[AMSLogConfig sharedAccountsMultiUserConfig];
  if (!v17)
  {
    __int16 v17 = +[AMSLogConfig sharedConfig];
  }
  id v18 = [v17 OSLogObject];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = AMSLogKey();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = v20;
    if (v19)
    {
      AMSLogKey();
      uint64_t v6 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
      +[NSString stringWithFormat:@"%@: [%@] ", v21, v6];
    }
    else
    {
      +[NSString stringWithFormat:@"%@: ", v20];
    v22 = };
    unsigned int v23 = +[AMSMultiUserService machServiceName];
    *(_DWORD *)buf = 138543618;
    v36 = v22;
    __int16 v37 = 2114;
    v38 = v23;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Registering service for name: %{public}@", buf, 0x16u);

    if (v19)
    {

      v22 = v6;
    }
  }
  id v24 = objc_alloc((Class)NSXPCListener);
  v25 = +[AMSMultiUserService machServiceName];
  id v26 = [v24 initWithMachServiceName:v25];

  [v26 setDelegate:self];
  [v26 resume];
  if (+[AMSDMultiUserController deviceSupportsMultipleUsers])
  {
    v27 = +[AMSDMultiUserController sharedController];
    v28 = [v27 cloudContainer];
    uint64_t v29 = [v28 privateDatabase];
    v30 = [v29 subscribeWithIdentifier:@"com.apple.amsaccountsd.multiuser.privateDatabaseSubscription"];
    [v30 addSuccessBlock:&stru_100112590];

    v31 = +[AMSDMultiUserController sharedController];
    v32 = [v31 cloudContainer];
    uint64_t v33 = [v32 sharedDatabase];
    v34 = [v33 subscribeWithIdentifier:@"com.apple.amsaccountsd.multiuser.sharedDatabaseSubscription"];
    [v34 addSuccessBlock:&stru_1001125B0];
  }
}

- (void)_setupNotifications
{
  id v3 = dispatch_get_global_queue(17, 0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10002630C;
  handler[3] = &unk_1001125D8;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v3, handler);

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v4 = +[NSDistributedNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"_handleNFCAccessoryNotification:" name:@"com.apple.nfcd.ams.accessory" object:0 suspensionBehavior:2];
  }
}

- (void)_setupPollJobs
{
  id v3 = objc_alloc_init(AMSDXPCActivityScheduler);
  uint64_t v2 = objc_alloc_init(AMSDCarrierOfferRegistrationActivity);
  [(AMSDXPCActivityScheduler *)v3 scheduleIfNeededActivity:v2];
}

- (void)_setupAccountDataSync
{
  if (_os_feature_enabled_impl())
  {
    id v2 = +[CachedServerDataService sharedService];
    [v2 performOnStartup];
  }
}

- (void)_setupSignalHandlers
{
  id v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, 0);
  sigTermSource = self->_sigTermSource;
  self->_sigTermSource = v3;

  int v5 = self->_sigTermSource;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100026D84;
  handler[3] = &unk_1001124D0;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume((dispatch_object_t)self->_sigTermSource);
}

- (void)_handleCachedDataUpdate
{
  id v2 = +[AMSRegulatoryEligibilityTask sharedInstance];
  [v2 handleCachedDataUpdate];
}

- (void)_updateRegulatoryEligibility
{
  id v3 = +[AMSLogConfig sharedRegulatoryEligibilityConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = AMSLogKey();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = v6;
    if (v5)
    {
      AMSLogKey();
      self = (AMSDDaemonRunLoop *)objc_claimAutoreleasedReturnValue();
      +[NSString stringWithFormat:@"%@: [%@] ", v7, self];
    }
    else
    {
      +[NSString stringWithFormat:@"%@: ", v6];
    uint64_t v8 = };
    *(_DWORD *)buf = 138543362;
    __int16 v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating regulatory eligibility", buf, 0xCu);
    if (v5)
    {

      uint64_t v8 = self;
    }
  }
  uint64_t v9 = +[AMSRegulatoryEligibilityTask sharedInstance];
  id v10 = [v9 update];
}

- (void)_startXPC
{
  id v3 = objc_alloc((Class)NSXPCListener);
  id v4 = +[AMSDServiceConnection machServiceName];
  id v5 = [v3 initWithMachServiceName:v4];

  [v5 setDelegate:self];
  [v5 resume];
}

- (void)setConnections:(id)a3
{
}

- (os_unfair_lock_s)connectionsLock
{
  return self->_connectionsLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_sigTermSource, 0);
}

@end