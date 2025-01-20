@interface BLNetworkMonitor
+ (id)defaultMonitor;
- (BLNetworkMonitor)initWithPathEvalulator:(id)a3;
- (BOOL)_emulateCellularNetwork;
- (BOOL)_emulateRoamingNetwork;
- (BOOL)isConnected;
- (BOOL)isConstrained;
- (BOOL)isExpensive;
- (BOOL)isRoaming;
- (id)copyCellularNetworkIdentityWithError:(id *)a3;
- (int64_t)interfaceType;
- (void)_forcePropertyRefresh;
- (void)_setPropertiesUsingPath:(id)a3;
- (void)_updateRoamingStatusForContext:(id)a3;
- (void)activeSubscriptionsDidChange;
- (void)dealloc;
- (void)internetDataStatus:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation BLNetworkMonitor

+ (id)defaultMonitor
{
  if (qword_1001C8158 != -1) {
    dispatch_once(&qword_1001C8158, &stru_1001A2138);
  }
  v2 = (void *)qword_1001C8150;

  return v2;
}

- (BLNetworkMonitor)initWithPathEvalulator:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BLNetworkMonitor;
  v6 = [(BLNetworkMonitor *)&v18 init];
  if (v6)
  {
    v7 = dispatch_get_global_queue(9, 0);
    dispatch_queue_t v8 = dispatch_queue_create_with_target_V2("com.apple.bookassetd.BLNetworkMonitor", 0, v7);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_pathEvaluator, a3);
    [(NWPathEvaluator *)v6->_pathEvaluator addObserver:v6 forKeyPath:@"path" options:5 context:0];
    v10 = (CoreTelephonyClient *)[objc_alloc((Class)CoreTelephonyClient) initWithQueue:v6->_dispatchQueue];
    telephonyClient = v6->_telephonyClient;
    v6->_telephonyClient = v10;

    [(CoreTelephonyClient *)v6->_telephonyClient setDelegate:v6];
    id v12 = objc_alloc((Class)NSUserDefaults);
    uint64_t v13 = BUBooksGroupContainerIdentifier;
    v14 = +[NSURL bu_booksGroupContainerURL];
    v15 = (NSUserDefaults *)[v12 _initWithSuiteName:v13 container:v14];
    sharedDefaults = v6->_sharedDefaults;
    v6->_sharedDefaults = v15;

    [(NSUserDefaults *)v6->_sharedDefaults addObserver:v6 forKeyPath:@"BKEmulateCellularNetwork" options:1 context:off_1001C77C8];
    [(NSUserDefaults *)v6->_sharedDefaults addObserver:v6 forKeyPath:@"BKEmulateRoamingNetwork" options:1 context:off_1001C77C8];
  }

  return v6;
}

- (void)dealloc
{
  [(NWPathEvaluator *)self->_pathEvaluator removeObserver:self forKeyPath:@"path"];
  [(CoreTelephonyClient *)self->_telephonyClient setDelegate:0];
  [(NSUserDefaults *)self->_sharedDefaults removeObserver:self forKeyPath:@"BKEmulateCellularNetwork"];
  [(NSUserDefaults *)self->_sharedDefaults removeObserver:self forKeyPath:@"BKEmulateRoamingNetwork"];
  v3.receiver = self;
  v3.super_class = (Class)BLNetworkMonitor;
  [(BLNetworkMonitor *)&v3 dealloc];
}

- (BOOL)isConnected
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100036F6C;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isConstrained
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003702C;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isExpensive
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000370EC;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isRoaming
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100037290;
  v5[3] = &unk_1001A1808;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)copyCellularNetworkIdentityWithError:(id *)a3
{
  subscriptionContext = self->_subscriptionContext;
  if (!subscriptionContext)
  {
    [(BLNetworkMonitor *)self activeSubscriptionsDidChange];
    subscriptionContext = self->_subscriptionContext;
  }
  uint64_t v6 = +[BUCellularIdentity identityForSubscription:subscriptionContext usingClient:self->_telephonyClient error:a3];
  int v7 = MGGetBoolAnswer();
  if (([v6 isRoaming] & 1) == 0 && v7) {
    objc_msgSend(v6, "setRoaming:", -[BLNetworkMonitor _emulateRoamingNetwork](self, "_emulateRoamingNetwork"));
  }
  return v6;
}

- (void)internetDataStatus:(id)a3
{
  self->_roaming = [a3 inHomeCountry] ^ 1;
}

- (void)activeSubscriptionsDidChange
{
  telephonyClient = self->_telephonyClient;
  id v20 = 0;
  v4 = [(CoreTelephonyClient *)telephonyClient getCurrentDataSubscriptionContextSync:&v20];
  id v5 = v20;
  subscriptionContext = self->_subscriptionContext;
  self->_subscriptionContext = v4;

  int v7 = self->_subscriptionContext;
  if (v7)
  {
    uint64_t v8 = self->_telephonyClient;
    v19 = v5;
    char v9 = [(CoreTelephonyClient *)v8 copySIMIdentity:v7 error:&v19];
    v10 = v19;

    if (v9 && [v9 length])
    {
      v11 = [v9 dataUsingEncoding:4];
      id v12 = objc_msgSend(v11, "bu_md5");

      uint64_t v13 = BLServiceLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Network] Cellular data subscription became: %{public}@", buf, 0xCu);
      }

      goto LABEL_16;
    }
    v14 = BLServiceLog();
    id v12 = v14;
    if (v10)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v10;
        v15 = "[Network] Unable to identify cellular data subscription:  %@";
        v16 = v12;
        os_log_type_t v17 = OS_LOG_TYPE_ERROR;
        uint32_t v18 = 12;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, buf, v18);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "[Network] There is no cellular data subscription";
      v16 = v12;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      uint32_t v18 = 2;
      goto LABEL_15;
    }
LABEL_16:

    [(BLNetworkMonitor *)self _updateRoamingStatusForContext:self->_subscriptionContext];
    goto LABEL_17;
  }
  char v9 = BLServiceLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[Network] Unable to fetch current cellular data subscription:  %@", buf, 0xCu);
  }
  v10 = v5;
LABEL_17:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  v11 = (NWPathEvaluator *)a4;
  id v12 = a5;
  if (self->_pathEvaluator == v11 && [v10 isEqualToString:@"path"])
  {
    uint64_t v13 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    if (v13)
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100037870;
      block[3] = &unk_1001A0FE8;
      block[4] = self;
      dispatch_async((dispatch_queue_t)dispatchQueue, block);
    }
  }
  else if (off_1001C77C8 == a6)
  {
    v15 = BLServiceLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Network] Got user defaults change: %{public}@", buf, 0xCu);
    }

    v16 = self->_dispatchQueue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100037878;
    v17[3] = &unk_1001A0FE8;
    v17[4] = self;
    dispatch_async((dispatch_queue_t)v16, v17);
  }
}

- (void)_forcePropertyRefresh
{
  id v3 = [(NWPathEvaluator *)self->_pathEvaluator path];
  [(BLNetworkMonitor *)self _setPropertiesUsingPath:v3];
}

- (void)_setPropertiesUsingPath:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (((unint64_t)[v4 status] | 2) == 3)
  {
    self->_BOOL connected = 1;
    self->_BOOL expensive = [v4 isExpensive];
    self->_BOOL constrained = [v4 isConstrained];
    if (!self->_expensive && [v4 usesInterfaceType:2])
    {
      id v5 = BLServiceLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Network] Forcing expensive for cellular interface", buf, 2u);
      }

      self->_BOOL expensive = 1;
    }
  }
  else
  {
    *(_WORD *)&self->_BOOL connected = 0;
    self->_BOOL expensive = 0;
  }
  uint64_t v6 = [v4 interface];
  self->_int64_t interfaceType = (int64_t)[v6 type];

  int v7 = BLServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int64_t interfaceType = self->_interfaceType;
    *(_DWORD *)buf = 134217984;
    v20[0] = interfaceType;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[Network] Interface type: %ld", buf, 0xCu);
  }

  BOOL connected = self->_connected;
  id v10 = BLServiceLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (connected)
  {
    if (v11)
    {
      BOOL expensive = self->_expensive;
      BOOL constrained = self->_constrained;
      *(_DWORD *)buf = 67109376;
      LODWORD(v20[0]) = expensive;
      WORD2(v20[0]) = 1024;
      *(_DWORD *)((char *)v20 + 6) = constrained;
      v14 = "[Network] Network available (BOOL expensive = %d, constrained = %d)";
      v15 = v10;
      uint32_t v16 = 14;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    }
  }
  else if (v11)
  {
    *(_WORD *)buf = 0;
    v14 = "[Network] Network unavailable";
    v15 = v10;
    uint32_t v16 = 2;
    goto LABEL_15;
  }

  os_log_type_t v17 = dispatch_get_global_queue(9, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037B5C;
  block[3] = &unk_1001A0FE8;
  block[4] = self;
  dispatch_async(v17, block);
}

- (void)_updateRoamingStatusForContext:(id)a3
{
  subscriptionContext = self->_subscriptionContext;
  telephonyClient = self->_telephonyClient;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100037C30;
  v5[3] = &unk_1001A2160;
  v5[4] = self;
  [(CoreTelephonyClient *)telephonyClient getDataStatus:subscriptionContext completion:v5];
}

- (BOOL)_emulateCellularNetwork
{
  return [(NSUserDefaults *)self->_sharedDefaults BOOLForKey:@"BKEmulateCellularNetwork"];
}

- (BOOL)_emulateRoamingNetwork
{
  return [(NSUserDefaults *)self->_sharedDefaults BOOLForKey:@"BKEmulateRoamingNetwork"];
}

- (int64_t)interfaceType
{
  return self->_interfaceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedDefaults, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_pathEvaluator, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end