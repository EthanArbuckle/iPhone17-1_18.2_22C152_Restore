@interface BDSServiceDelegate
- (BDSClientConnectionManager)clientConnectionManager;
- (BDSICloudIdentityTokenTracker)iCloudIdentityTokenTracker;
- (BDSReachability)networkReachability;
- (BDSServiceConnectionClient)serviceConnectionClient;
- (BDSServiceDelegate)initWithServiceConnectionClient:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_bdsService;
- (int)tccNotifyToken;
- (void)_deleteLocaliCloudDataIfUserLoggedOutFromiCloudCompletion:(id)a3;
- (void)_dieIfUnacknowledgediCloudLogoutOcccurred;
- (void)dealloc;
- (void)deleteCloudDataWithCompletion:(id)a3;
- (void)setClientConnectionManager:(id)a3;
- (void)setICloudIdentityTokenTracker:(id)a3;
- (void)setNetworkReachability:(id)a3;
- (void)setServiceConnectionClient:(id)a3;
- (void)setTccNotifyToken:(int)a3;
@end

@implementation BDSServiceDelegate

- (void)_dieIfUnacknowledgediCloudLogoutOcccurred
{
  v3 = sub_1000063E8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Checking if an account change happened, necessitating our process going away.", v7, 2u);
  }

  v4 = [(BDSServiceDelegate *)self iCloudIdentityTokenTracker];
  [v4 fetchCurrentToken];
  if ([v4 didUnacknowledgediCloudLogoutOccur])
  {
    v5 = sub_1000063E8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1001EA098(v5);
    }

    raise(9);
  }
  else
  {
    v6 = [(BDSServiceDelegate *)self iCloudIdentityTokenTracker];
    [v6 acknowledgeiCloudIdentity];
  }
}

- (BDSICloudIdentityTokenTracker)iCloudIdentityTokenTracker
{
  return self->_iCloudIdentityTokenTracker;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  v7 = sub_1000063E8();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Received incomming connection request.", (uint8_t *)buf, 2u);
  }

  [(BDSServiceDelegate *)self _dieIfUnacknowledgediCloudLogoutOcccurred];
  objc_opt_class();
  v8 = [v6 valueForEntitlement:@"com.apple.iBooks.BDSService.private"];
  v9 = BUDynamicCast();
  unsigned __int8 v23 = [v9 BOOLValue];

  if (v23)
  {
    v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BDSDaemonProtocol];
    v21 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BDSClientSideProtocol];
    +[BDSServiceProtocolInterface configureInterface:v10];
    v11 = [[BDSClient alloc] initWithConnection:v6];
    objc_initWeak(buf, self);
    objc_initWeak(&location, v6);
    objc_initWeak(&from, v11);
    [v6 setRemoteObjectInterface:v21];
    [v6 setExportedInterface:v10];
    v12 = [(BDSServiceDelegate *)self _bdsService];
    [v6 setExportedObject:v12];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000726EC;
    v28[3] = &unk_100261E90;
    objc_copyWeak(&v29, &from);
    objc_copyWeak(&v30, &location);
    objc_copyWeak(&v31, buf);
    [v6 setInvalidationHandler:v28];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000727F4;
    v24[3] = &unk_100261E90;
    objc_copyWeak(&v25, &from);
    objc_copyWeak(&v26, &location);
    objc_copyWeak(&v27, buf);
    [v6 setInterruptionHandler:v24];
    v13 = [(BDSServiceDelegate *)self clientConnectionManager];
    [v13 addClient:v11];

    [v6 resume];
    v14 = [(BDSServiceDelegate *)self serviceConnectionClient];
    [v14 serviceDelegate:self didAcceptConnection:v6];

    v15 = sub_1000063E8();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      unsigned int v16 = [v6 processIdentifier];
      *(_DWORD *)v35 = 67109120;
      unsigned int v36 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Accepted connection to %d.", v35, 8u);
    }

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v29);

    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    objc_destroyWeak(buf);
  }
  else
  {
    objc_opt_class();
    v17 = [v6 valueForEntitlement:@"application-identifier"];
    v10 = BUDynamicCast();

    if (!v10)
    {
      objc_opt_class();
      v18 = [v6 valueForEntitlement:@"com.apple.application-identifier"];
      v10 = BUDynamicCast();
    }
    v19 = sub_1000063E8();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1001E9FF8(v6, (uint64_t)v10, v19);
    }

    [v6 invalidate];
  }

  return v23;
}

- (BDSServiceConnectionClient)serviceConnectionClient
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceConnectionClient);
  return (BDSServiceConnectionClient *)WeakRetained;
}

- (BDSClientConnectionManager)clientConnectionManager
{
  return self->_clientConnectionManager;
}

- (id)_bdsService
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000728FC;
  block[3] = &unk_10025F700;
  block[4] = self;
  if (qword_1002975C8 != -1) {
    dispatch_once(&qword_1002975C8, block);
  }
  return (id)qword_1002975C0;
}

- (BDSServiceDelegate)initWithServiceConnectionClient:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BDSServiceDelegate;
  v5 = [(BDSServiceDelegate *)&v27 init];
  if (v5)
  {
    id v6 = sub_1000063E8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Initializing service delegate.", (uint8_t *)buf, 2u);
    }

    v7 = objc_alloc_init(BDSClientConnectionManager);
    clientConnectionManager = v5->_clientConnectionManager;
    v5->_clientConnectionManager = v7;

    objc_storeWeak((id *)&v5->_serviceConnectionClient, v4);
    uint64_t v9 = +[BDSReachability sharedReachabilityForInternetConnection];
    networkReachability = v5->_networkReachability;
    v5->_networkReachability = (BDSReachability *)v9;

    +[BCCloudKitDatabaseController startInternetConnectionReachabilityNotifier];
    v11 = [BDSICloudIdentityTokenTracker alloc];
    v12 = +[BDSAppGroupContainer containerURL];
    v13 = [(BDSICloudIdentityTokenTracker *)v11 initWithContainerURL:v12 trackingLiverpool:0];
    iCloudIdentityTokenTracker = v5->_iCloudIdentityTokenTracker;
    v5->_iCloudIdentityTokenTracker = v13;

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10007258C;
    v25[3] = &unk_10025F700;
    v15 = v5;
    id v26 = v15;
    [(BDSServiceDelegate *)v15 _deleteLocaliCloudDataIfUserLoggedOutFromiCloudCompletion:v25];
    unsigned int v16 = +[BUAccountsProvider sharedProvider];
    [v16 observeTCCAccessChangeNotificationIfNeeded];

    int out_token = -1;
    objc_initWeak(buf, v15);
    v17 = (const char *)[@"com.apple.tcc.access.changed" UTF8String];
    id v18 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000725B0;
    handler[3] = &unk_100261E68;
    objc_copyWeak(&v22, buf);
    LODWORD(v17) = notify_register_dispatch(v17, &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);

    if (v17) {
      uint64_t v19 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v19 = out_token;
    }
    [(BDSServiceDelegate *)v15 setTccNotifyToken:v19];
    objc_destroyWeak(&v22);
    objc_destroyWeak(buf);
  }
  return v5;
}

- (void)dealloc
{
  if ([(BDSServiceDelegate *)self tccNotifyToken] != -1) {
    notify_cancel([(BDSServiceDelegate *)self tccNotifyToken]);
  }
  [(BDSReachability *)self->_networkReachability stopNotifier];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id v4 = sub_1000063E8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Service delegate released.", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)BDSServiceDelegate;
  [(BDSServiceDelegate *)&v5 dealloc];
}

- (void)_deleteLocaliCloudDataIfUserLoggedOutFromiCloudCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = sub_1000063E8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking if cloud data should get deleted.", buf, 2u);
  }

  id v6 = [(BDSServiceDelegate *)self iCloudIdentityTokenTracker];
  [v6 fetchCurrentToken];
  if ([v6 didUnacknowledgediCloudLogoutOccur])
  {
    v7 = sub_1000063E8();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "User logged out from iCloud.  Deleting local copies of cloud data.", buf, 2u);
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100072B1C;
    v10[3] = &unk_100260DE0;
    id v11 = v4;
    [(BDSServiceDelegate *)self deleteCloudDataWithCompletion:v10];
    v8 = v11;
  }
  else
  {
    id v9 = objc_retainBlock(v4);
    v8 = v9;
    if (v9) {
      (*((void (**)(id))v9 + 2))(v9);
    }
  }

  [v6 acknowledgeiCloudIdentity];
}

- (void)deleteCloudDataWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000063E8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Deleting cloud data.", buf, 2u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100072C8C;
  v6[3] = &unk_100260DE0;
  id v7 = v3;
  id v5 = v3;
  +[BCCloudAssetManager deleteCloudDataWithCompletion:v6];
}

- (void)setClientConnectionManager:(id)a3
{
}

- (void)setICloudIdentityTokenTracker:(id)a3
{
}

- (void)setServiceConnectionClient:(id)a3
{
}

- (BDSReachability)networkReachability
{
  return self->_networkReachability;
}

- (void)setNetworkReachability:(id)a3
{
}

- (int)tccNotifyToken
{
  return self->_tccNotifyToken;
}

- (void)setTccNotifyToken:(int)a3
{
  self->_tccNotifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_destroyWeak((id *)&self->_serviceConnectionClient);
  objc_storeStrong((id *)&self->_iCloudIdentityTokenTracker, 0);
  objc_storeStrong((id *)&self->_clientConnectionManager, 0);
}

@end