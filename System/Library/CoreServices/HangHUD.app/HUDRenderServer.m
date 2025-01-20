@interface HUDRenderServer
+ (id)sharedInstance;
- (id)_init;
- (void)clearHUDWithCompletion:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)prepareHUDContextIfNeeded;
- (void)receiveHangHUDInfo:(id)a3 completion:(id)a4;
- (void)receiveHudConfiguration:(id)a3 completion:(id)a4;
- (void)receiveMonitoredStates:(id)a3 completion:(id)a4;
- (void)receiveProcExitRecord:(id)a3 completion:(id)a4;
- (void)removeStaleHangData:(id)a3;
- (void)start;
- (void)turnOffProcessTerminationMonitoring;
- (void)turnOnProcessTerminationMonitoring;
@end

@implementation HUDRenderServer

+ (id)sharedInstance
{
  if (qword_10003E960 != -1) {
    dispatch_once(&qword_10003E960, &stru_1000308A0);
  }
  v2 = (void *)qword_10003E958;

  return v2;
}

- (id)_init
{
  v25.receiver = self;
  v25.super_class = (Class)HUDRenderServer;
  v2 = [(HUDRenderServer *)&v25 init];
  v3 = v2;
  if (v2)
  {
    hudContext = v2->_hudContext;
    v2->_hudContext = 0;

    v5 = objc_alloc_init(AssertionManager);
    assertionManager = v3->_assertionManager;
    v3->_assertionManager = v5;

    v7 = +[HUDContextUpdater sharedInstance];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000800C;
    v23[3] = &unk_100030928;
    v8 = v3;
    v24 = v8;
    [v7 setHudUpdateHandler:v23];

    v9 = +[ProcessExitFetcher sharedInstance];
    [v9 setProcessExitHandler:&stru_100030968];

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.HangHUD.prefs", 0);
    v11 = +[HTPrefs sharedPrefs];
    [v11 setupPrefsWithQueue:v10];

    v12 = +[HTPrefs sharedPrefs];
    v8->_areProcessTerminationsMonitored = [v12 areProcessTerminationsMonitored];

    v13 = +[ProcessExitScreener sharedInstance];
    v14 = +[HTPrefs sharedPrefs];
    v15 = +[HTProcessExitFilteringConfiguration configurationFromPrefs:v14];
    [v13 setFilteringConfiguration:v15];

    v16 = +[HTPrefs sharedPrefs];
    LODWORD(v15) = [v16 areProcessTerminationsMonitored];

    if (v15) {
      [(HUDRenderServer *)v8 turnOnProcessTerminationMonitoring];
    }
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000085E8;
    v21[3] = &unk_100030990;
    v17 = v8;
    v22 = v17;
    uint64_t v18 = +[BSServiceConnectionListener listenerWithConfigurator:v21];
    listener = v17->_listener;
    v17->_listener = (BSServiceConnectionListener *)v18;
  }
  return v3;
}

- (void)prepareHUDContextIfNeeded
{
  hudContext = self->_hudContext;
  if (!hudContext || [(HUDContext *)hudContext hasHudRenderContextInvalidated])
  {
    v5 = sub_100008200();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008738;
    block[3] = &unk_100030668;
    block[4] = self;
    dispatch_sync(v5, block);
  }
}

- (void)start
{
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = +[HangHUDServiceSpecification clientContextIdentifierKey];
  dispatch_queue_t v10 = [v8 decodeStringForKey:v9];

  v11 = [v7 remoteProcess];
  v12 = sub_10000E760();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    id v21 = v7;
    __int16 v22 = 2112;
    v23 = v10;
    __int16 v24 = 2112;
    objc_super v25 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "received connection %p with identifier %@ from %@", buf, 0x20u);
  }

  if ([v11 hasEntitlement:@"com.apple.HangHUD"])
  {
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_1000089C4;
    v17 = &unk_1000309E0;
    id v18 = v10;
    v19 = self;
    [v7 configureConnection:&v14];
    objc_msgSend(v7, "activate", v14, v15, v16, v17);
  }
  else
  {
    v13 = sub_10000E760();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10001BF64();
    }

    [v7 invalidate];
  }
}

- (void)receiveHangHUDInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = sub_10000E760();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10001C128(v6);
  }

  if (!sub_10001B240())
  {
    id v10 = [v6 mutableCopy];
    [(HUDRenderServer *)self removeStaleHangData:v10];
    if ([v6 count])
    {
      if ([v10 count])
      {
        v11 = +[HUDContextUpdater sharedInstance];
        [v11 addHUDContents:v10];
      }
      if (self->_areProcessTerminationsMonitored) {
        goto LABEL_18;
      }
    }
    else
    {
      v12 = sub_10000E760();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_10001C0B0(v12, v13, v14, v15, v16, v17, v18, v19);
      }

      v20 = +[HUDContextUpdater sharedInstance];
      [v20 saveClearHUDRequest];
    }
    id v21 = sub_10000E760();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_10001C078(v21, v22, v23, v24, v25, v26, v27, v28);
    }

    v29 = +[HUDContextUpdater sharedInstance];
    [v29 forceUpdate];

LABEL_18:
    v7[2](v7, 0);

    goto LABEL_19;
  }
  v9 = sub_10000E760();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10001BFD8(v9);
  }

  v7[2](v7, 0);
LABEL_19:
}

- (void)receiveProcExitRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = sub_10000E760();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10001C1E4(v6);
  }

  v9 = +[HUDContextUpdater sharedInstance];
  [v9 addHUDContents:v6];

  if (!self->_areProcessTerminationsMonitored)
  {
    id v10 = sub_10000E760();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10001C1AC(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    uint64_t v18 = +[HUDContextUpdater sharedInstance];
    [v18 forceUpdate];
  }
  v7[2](v7, 0);
}

- (void)removeStaleHangData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = mach_absolute_time();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v5 = [v3 allKeys];
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v23;
    *(void *)&long long v7 = 138412546;
    long long v20 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v3, "objectForKeyedSubscript:", v11, v20);
        id v13 = [v12 receivedTimestamp];

        uint64_t v14 = [v3 objectForKeyedSubscript:v11];
        id v15 = [v14 hangEndTime];

        if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v16 = [v3 objectForKeyedSubscript:v11];
          id v13 = [v16 hangEndTime];
        }
        if (sub_10001B3C0(v4 - (void)v13) >= 5000.0)
        {
          unsigned __int8 v17 = [(HUDContext *)self->_hudContext hangHasPendingAnimation:v11];
          uint64_t v18 = sub_10000E760();
          BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
          if (v17)
          {
            if (v19)
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v27 = v11;
              _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Not removing hang since an animation is in progress %@", buf, 0xCu);
            }
          }
          else
          {
            if (v19)
            {
              *(_DWORD *)buf = v20;
              uint64_t v27 = v11;
              __int16 v28 = 2112;
              id v29 = v3;
              _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "removing object for key %@ from dict : %@", buf, 0x16u);
            }

            [v3 removeObjectForKey:v11];
          }
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v8);
  }
}

- (void)receiveHudConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  long long v7 = (void (**)(id, void))a4;
  id v8 = sub_10000E760();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10001C2FC(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  uint64_t v16 = +[HUDConfiguration sharedInstance];
  [v16 updateWithHUDConfiguration:v6];

  unsigned __int8 v17 = +[ProcessExitScreener sharedInstance];
  uint64_t v18 = [v6 processTerminationsFiltering];
  [v17 setFilteringConfiguration:v18];

  self->_areProcessTerminationsMonitored = [v6 areProcessTerminationsMonitored];
  BOOL v19 = sub_100006A20();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_10001C268(v6);
  }

  if ([v6 areProcessTerminationsMonitored]) {
    [(HUDRenderServer *)self turnOnProcessTerminationMonitoring];
  }
  else {
    [(HUDRenderServer *)self turnOffProcessTerminationMonitoring];
  }
  v7[2](v7, 0);
}

- (void)receiveMonitoredStates:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = a3;
  id v8 = sub_10000E760();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10001C374(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  [(HUDContext *)self->_hudContext setRenderParametersFromMonitoredStates:v7];
  v6[2](v6, 0);
}

- (void)turnOnProcessTerminationMonitoring
{
  id v3 = +[HUDContextUpdater sharedInstance];
  [v3 kickOffUpdater];

  uint64_t v4 = +[ProcessExitFetcher sharedInstance];
  [v4 kickOffFetchTimer];

  v5 = +[HUDContextUpdater sharedInstance];
  unsigned int v6 = [v5 isNoTaskPending];

  if (v6) {
    id v7 = [(AssertionManager *)self->_assertionManager acquireKeepAliveAssertion];
  }
}

- (void)turnOffProcessTerminationMonitoring
{
  id v3 = +[ProcessExitFetcher sharedInstance];
  [v3 stopFetchTimer];

  uint64_t v4 = +[HUDContextUpdater sharedInstance];
  unsigned int v5 = [v4 isNoTaskPending];

  if (v5)
  {
    unsigned int v6 = +[HUDContextUpdater sharedInstance];
    [v6 stopUpdater];

    assertionManager = self->_assertionManager;
    [(AssertionManager *)assertionManager invalidateKeepAliveAssertion];
  }
}

- (void)clearHUDWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  unsigned int v5 = sub_100006A20();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10001C3EC(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  uint64_t v13 = sub_100008200();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009448;
  block[3] = &unk_100030668;
  block[4] = self;
  dispatch_sync(v13, block);

  v4[2](v4, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_hudContext, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end