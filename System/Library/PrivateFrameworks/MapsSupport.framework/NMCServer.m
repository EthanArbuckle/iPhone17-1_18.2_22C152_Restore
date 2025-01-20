@interface NMCServer
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NMCServer)init;
- (id)_locationManagerForBundleIdentifier:(id)a3;
- (id)_locationManagerForEffectiveBundleIdentifier:(id)a3;
- (id)locationDidUpdate;
- (void)_checkinWithSubscriptionStateSummary;
- (void)_debug_fetchDiagnosticsString:(id)a3;
- (void)_debug_fetchServerConfiguration:(id)a3;
- (void)_enumerateMapsPeerConnectionsUnderAssertionNamed:(id)a3 usingBlock:(id)a4;
- (void)_forgetConnection:(id)a3 reason:(id)a4;
- (void)_loadDataFromURL:(id)a3 completionHandler:(id)a4;
- (void)_openURL:(id)a3 forMessage:(id)a4 withRouteContext:(id)a5 underAssertionNamed:(id)a6;
- (void)_performServiceRequest:(id)a3 traits:(id)a4 requestType:(int)a5 auditToken:(id)a6 completionHandler:(id)a7;
- (void)_registerMessageObservers;
- (void)_registerXPCRoutes;
- (void)_sendTileGroupDidChange;
- (void)_syncConfigStore;
- (void)_syncConfigStore:(id)a3;
- (void)_syncManager:(id)a3 didUpdateDroppedPin:(id)a4;
- (void)_syncSubscriptionInfoIfNecessaryWithExistingHash:(id)a3;
- (void)_updateManifestConfiguration;
- (void)_updatePairedDeviceConfiguration;
- (void)checkinForNavigationControl;
- (void)checkinWithCurrentTileGroupIdentifier:(id)a3;
- (void)connection:(id)a3 didChangeDeviceConnectivity:(BOOL)a4;
- (void)connectionNeedsStateSynchronization:(id)a3;
- (void)dealloc;
- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5;
- (void)experimentConfigurationDidChange:(id)a3;
- (void)fetchTilesForMessage:(id)a3;
- (void)requestSyncUpdateWithReply:(id)a3;
- (void)setDroppedPin:(id)a3;
- (void)setLocationDidUpdate:(id)a3;
- (void)setNeedsSubscriptionSynchronizationUpdate;
- (void)startOrStopDownloadForSubscriptionIdentifiers:(id)a3;
- (void)syncManager:(id)a3 didRequestInitialSync:(id)a4;
- (void)syncManagerDidUpdate:(id)a3;
- (void)updateObservedStateSubscriptionIdentifiers;
@end

@implementation NMCServer

- (NMCServer)init
{
  v47.receiver = self;
  v47.super_class = (Class)NMCServer;
  v2 = [(NMCServer *)&v47 init];
  if (v2)
  {
    v3 = [[NMCSyncManager alloc] initWithDelegate:v2];
    syncManager = v2->_syncManager;
    v2->_syncManager = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mapsPeerConnections = v2->_mapsPeerConnections;
    v2->_mapsPeerConnections = v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.geo.NMCServer", v7);
    tileLoaderQueue = v2->_tileLoaderQueue;
    v2->_tileLoaderQueue = (OS_dispatch_queue *)v8;

    v10 = objc_alloc_init(NMCRoutePlanningController);
    routePlanningController = v2->_routePlanningController;
    v2->_routePlanningController = v10;

    v12 = (NSLock *)objc_alloc_init((Class)NSLock);
    requestIdentifierToPendingTileLoaderLock = v2->_requestIdentifierToPendingTileLoaderLock;
    v2->_requestIdentifierToPendingTileLoaderLock = v12;

    v14 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    uint64_t v15 = +[NSURLSession sessionWithConfiguration:v14];
    urlSession = v2->_urlSession;
    v2->_urlSession = (NSURLSession *)v15;

    [(NMCServer *)v2 _registerXPCRoutes];
    v17 = +[GEOExperimentConfiguration sharedConfiguration];
    v18 = dispatch_get_global_queue(0, 0);
    [v17 addExperimentObserver:v2 queue:v18];

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v2 selector:"_syncConfigStore" name:GEOConfigNeedsWatchSyncNotification object:0];

    objc_initWeak(&location, v2);
    v20 = (const char *)GEOConfigNeedsWatchSyncDarwinNotification;
    v21 = dispatch_get_global_queue(17, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004D398;
    handler[3] = &unk_1000823C8;
    objc_copyWeak(&v45, &location);
    notify_register_dispatch(v20, &v2->_configStoreNeedsSyncToken, v21, handler);

    v22 = (const char *)GEOMapDataSubscriptionManagerFullyDownloadedSubscriptionsDidChangeDarwinNotification;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10004D3D8;
    v42[3] = &unk_1000823C8;
    objc_copyWeak(&v43, &location);
    notify_register_dispatch(v22, &v2->_subscriptionsChangedToken, v21, v42);

    uint64_t v23 = +[NRPairedDeviceRegistry sharedInstance];
    registry = v2->_registry;
    v2->_registry = (NRPairedDeviceRegistry *)v23;

    v25 = +[NSNotificationCenter defaultCenter];
    [v25 addObserver:v2 selector:"_updateManifestConfiguration" name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];

    v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v2 selector:"_updateManifestConfiguration" name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];

    [(NMCServer *)v2 _updateManifestConfiguration];
    v27 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    locationManagers = v2->_locationManagers;
    v2->_locationManagers = v27;

    v29 = (NSLock *)objc_alloc_init((Class)NSLock);
    locationManagersLock = v2->_locationManagersLock;
    v2->_locationManagersLock = v29;

    v31 = objc_alloc_init(NMMessageQueue);
    [(NMMessageQueue *)v31 setMaximumInFlightMessagesCount:GEOConfigGetUInteger()];
    [(NMMessageQueue *)v31 setMaximumPendingMessagesCount:GEOConfigGetUInteger()];
    v32 = +[NMCGizmoConnection sharedInstance];
    [v32 setMessageQueue:v31 forType:202];

    v33 = objc_alloc_init(NMTileMessageQueue);
    tileMessageQueue = v2->_tileMessageQueue;
    v2->_tileMessageQueue = v33;

    [(NMMessageQueue *)v2->_tileMessageQueue setMaximumInFlightMessagesSize:GEOConfigGetUInteger()];
    v35 = +[NMCGizmoConnection sharedInstance];
    [v35 setMessageQueue:v2->_tileMessageQueue forType:4];

    v36 = +[NMCGizmoConnection sharedInstance];
    [v36 setMessageQueue:v2->_tileMessageQueue forType:1];

    v37 = objc_alloc_init(NMMessageQueue);
    [(NMMessageQueue *)v37 setMaximumInFlightMessagesSize:0x200000];
    v38 = +[NMCGizmoConnection sharedInstance];
    [v38 setMessageQueue:v37 forType:103];

    [(NMCServer *)v2 _registerMessageObservers];
    v39 = +[NMCGizmoConnection sharedInstance];
    [v39 addConnectionObserver:v2];

    id v40 = sub_100014C68();
    objc_destroyWeak(&v43);
    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  activeDevice = self->_activeDevice;
  if (activeDevice)
  {
    v7[0] = NRDevicePropertySystemVersion;
    v7[1] = NRDevicePropertySystemBuildVersion;
    v4 = +[NSArray arrayWithObjects:v7 count:2];
    [(NRDevice *)activeDevice removePropertyObserver:self forPropertyChanges:v4];
  }
  v5 = +[NMCGizmoConnection sharedInstance];
  [v5 removeConnectionObserver:self];

  [(GEOResourceManifestManager *)self->_manifestManager removeTileGroupObserver:self];
  v6.receiver = self;
  v6.super_class = (Class)NMCServer;
  [(NMCServer *)&v6 dealloc];
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004D5B4;
  block[3] = &unk_100080E80;
  block[4] = a1;
  if (qword_10009B868 != -1) {
    dispatch_once(&qword_10009B868, block);
  }
  v2 = (void *)qword_10009B860;

  return v2;
}

- (void)_registerMessageObservers
{
  objc_initWeak(location, self);
  v3 = +[NMCGizmoConnection sharedInstance];
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_10004DF44;
  v72[3] = &unk_100080F38;
  objc_copyWeak(&v73, location);
  id v4 = [v3 addMessageObserverForType:1 callback:v72];

  v5 = +[NMCGizmoConnection sharedInstance];
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_10004DFA8;
  v70[3] = &unk_100080F38;
  objc_copyWeak(&v71, location);
  id v6 = [v5 addMessageObserverForType:2 callback:v70];

  v7 = +[NMCGizmoConnection sharedInstance];
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_10004E0F8;
  v68[3] = &unk_100080F38;
  objc_copyWeak(&v69, location);
  id v8 = [v7 addMessageObserverForType:3 callback:v68];

  v9 = +[NMCGizmoConnection sharedInstance];
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_10004E1B8;
  v66[3] = &unk_100080F38;
  objc_copyWeak(&v67, location);
  id v10 = [v9 addMessageObserverForType:100 callback:v66];

  v11 = +[NMCGizmoConnection sharedInstance];
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_10004E24C;
  v64[3] = &unk_100080F38;
  objc_copyWeak(&v65, location);
  id v12 = [v11 addMessageObserverForType:101 callback:v64];

  v13 = +[NMCGizmoConnection sharedInstance];
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_10004E3D4;
  v62[3] = &unk_100080F38;
  objc_copyWeak(&v63, location);
  id v14 = [v13 addMessageObserverForType:200 callback:v62];

  uint64_t v15 = +[NMCGizmoConnection sharedInstance];
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_10004E478;
  v60[3] = &unk_100080F38;
  objc_copyWeak(&v61, location);
  id v16 = [v15 addMessageObserverForType:201 callback:v60];

  v17 = +[NMCGizmoConnection sharedInstance];
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_10004E51C;
  v59[3] = &unk_100082890;
  v59[4] = self;
  id v18 = [v17 addMessageObserverForType:302 callback:v59];

  v19 = +[NMCGizmoConnection sharedInstance];
  id v20 = [v19 addMessageObserverForType:303 callback:&stru_1000828B0];

  v21 = +[NMCGizmoConnection sharedInstance];
  id v22 = [v21 addMessageObserverForType:313 callback:&stru_1000828D0];

  uint64_t v23 = +[NMCGizmoConnection sharedInstance];
  id v24 = [v23 addMessageObserverForType:314 callback:&stru_1000828F0];

  v25 = +[NMCGizmoConnection sharedInstance];
  id v26 = [v25 addMessageObserverForType:500 callback:&stru_100082910];

  v27 = +[NMCGizmoConnection sharedInstance];
  id v28 = [v27 addMessageObserverForType:501 callback:&stru_100082958];

  v29 = +[NMCGizmoConnection sharedInstance];
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_10004F044;
  v57[3] = &unk_100080F38;
  objc_copyWeak(&v58, location);
  id v30 = [v29 addMessageObserverForType:502 callback:v57];

  v31 = +[NMCGizmoConnection sharedInstance];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_10004F424;
  v55[3] = &unk_1000829A8;
  v55[4] = self;
  objc_copyWeak(&v56, location);
  id v32 = [v31 addMessageObserverForType:103 callback:v55];

  v33 = +[NMCGizmoConnection sharedInstance];
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_10004F960;
  v54[3] = &unk_100082890;
  v54[4] = self;
  id v34 = [v33 addMessageObserverForType:401 callback:v54];

  v35 = +[NMCGizmoConnection sharedInstance];
  id v36 = [v35 addMessageObserverForType:51 callback:&stru_1000829C8];

  v37 = +[NMCGizmoConnection sharedInstance];
  id v38 = [v37 addMessageObserverForType:52 callback:&stru_100082A10];

  v39 = +[NMCGizmoConnection sharedInstance];
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10004FE68;
  v52[3] = &unk_100080F38;
  objc_copyWeak(&v53, location);
  id v40 = [v39 addMessageObserverForType:57 callback:v52];

  v41 = +[NMCGizmoConnection sharedInstance];
  id v42 = [v41 addMessageObserverForType:58 callback:&stru_100082A30];

  id v43 = +[NMCGizmoConnection sharedInstance];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100050244;
  v51[3] = &unk_100082890;
  v51[4] = self;
  id v44 = [v43 addMessageObserverForType:59 callback:v51];

  id v45 = +[NMCGizmoConnection sharedInstance];
  id v46 = [v45 addMessageObserverForType:63 callback:&stru_100082A50];

  objc_super v47 = +[NMCGizmoConnection sharedInstance];
  id v48 = [v47 addMessageObserverForType:66 callback:&stru_100082A90];

  v49 = +[NMCGizmoConnection sharedInstance];
  id v50 = [v49 addMessageObserverForType:67 callback:&stru_100082AD0];

  objc_destroyWeak(&v53);
  objc_destroyWeak(&v56);
  objc_destroyWeak(&v58);
  objc_destroyWeak(&v61);
  objc_destroyWeak(&v63);
  objc_destroyWeak(&v65);
  objc_destroyWeak(&v67);
  objc_destroyWeak(&v69);
  objc_destroyWeak(&v71);
  objc_destroyWeak(&v73);
  objc_destroyWeak(location);
}

- (void)_updatePairedDeviceConfiguration
{
  v3 = [(NRPairedDeviceRegistry *)self->_registry getActivePairedDevice];
  activeDevice = self->_activeDevice;
  if (v3 != activeDevice)
  {
    uint64_t v5 = NRDevicePropertySystemVersion;
    uint64_t v6 = NRDevicePropertySystemBuildVersion;
    v10[0] = NRDevicePropertySystemVersion;
    v10[1] = NRDevicePropertySystemBuildVersion;
    v7 = +[NSArray arrayWithObjects:v10 count:2];
    [(NRDevice *)activeDevice removePropertyObserver:self forPropertyChanges:v7];

    v9[0] = v5;
    v9[1] = v6;
    id v8 = +[NSArray arrayWithObjects:v9 count:2];
    [(NRDevice *)v3 addPropertyObserver:self forPropertyChanges:v8];

    objc_storeStrong((id *)&self->_activeDevice, v3);
  }
}

- (void)_updateManifestConfiguration
{
  v3 = self->_registry;
  objc_sync_enter(v3);
  [(NMCServer *)self _updatePairedDeviceConfiguration];
  if (self->_activeDevice)
  {
    id v4 = +[GEOResourceManifestConfiguration configurationWithPairedDevice:](GEOResourceManifestConfiguration, "configurationWithPairedDevice:");
  }
  else
  {
    id v4 = 0;
  }
  objc_sync_exit(v3);

  unsigned __int8 v5 = [(GEOResourceManifestConfiguration *)self->_manifestConfiguration isEqual:v4];
  objc_storeStrong((id *)&self->_manifestConfiguration, v4);
  if ((v5 & 1) == 0)
  {
    manifestManager = self->_manifestManager;
    if (manifestManager) {
      [(GEOResourceManifestManager *)manifestManager removeTileGroupObserver:self];
    }
    tileLoader = self->_tileLoader;
    self->_tileLoader = 0;

    id v8 = self->_manifestManager;
    self->_manifestManager = 0;

    if (v4)
    {
      v9 = +[GEOResourceManifestManager modernManagerForConfiguration:self->_manifestConfiguration];
      id v10 = self->_manifestManager;
      self->_manifestManager = v9;

      [(GEOResourceManifestManager *)self->_manifestManager addTileGroupObserver:self queue:&_dispatch_main_q];
      v11 = +[GEOTileLoader modernLoaderForResourceManifestConfiguration:self->_manifestConfiguration locale:0];
      id v12 = self->_tileLoader;
      self->_tileLoader = v11;

      [(GEOResourceManifestManager *)self->_manifestManager openServerConnection];
      v13 = self->_manifestManager;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100050874;
      v14[3] = &unk_100082208;
      v14[4] = self;
      [(GEOResourceManifestManager *)v13 updateManifestIfNecessary:v14];
    }
  }
}

- (void)_performServiceRequest:(id)a3 traits:(id)a4 requestType:(int)a5 auditToken:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  switch(a5)
  {
    case 1:
      id v16 = [objc_alloc((Class)GEOPDPlaceRequest) initWithData:v12];
      v17 = +[GEOPlaceCardRequester sharedRequester];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100050C54;
      v33[3] = &unk_100082AF8;
      id v34 = v15;
      id v18 = [v17 performPlaceDataRequest:v16 traits:v13 cachePolicy:0 timeout:v14 auditToken:0 throttleToken:0 networkActivity:0.0 requesterHandler:v33];

      goto LABEL_4;
    case 2:
      id v19 = [objc_alloc((Class)GEOETARequest) initWithData:v12];
      id v20 = +[GEOETARequester sharedRequester];
      connectionQueue = self->_connectionQueue;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100050CD0;
      v31[3] = &unk_100082B20;
      id v32 = v15;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100050D34;
      v29[3] = &unk_100082B48;
      id v30 = v32;
      [v20 startSimpleETARequest:v19 auditToken:v14 throttleToken:0 traits:v13 callbackQueue:connectionQueue finished:v31 networkActivity:0 error:v29];

      id v22 = v32;
      goto LABEL_8;
    case 3:
      id v19 = objc_alloc_init((Class)GEOLocationShifter);
      [v19 _fetchSerializedCachedShiftFunctionResponseForRequest:v12 callbackQueue:self->_connectionQueue completionHandler:v15];
      goto LABEL_9;
    case 4:
      id v19 = [objc_alloc((Class)GEODirectionsRequest) initWithData:v12];
      uint64_t v23 = +[GEODirectionsRequester sharedRequester];
      id v24 = self->_connectionQueue;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100050D4C;
      v27[3] = &unk_100082B70;
      id v28 = v15;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100050DB0;
      v25[3] = &unk_100082B98;
      id v26 = v28;
      [v23 startRequest:v19 traits:v13 auditToken:v14 callbackQueue:v24 finished:v27 networkActivity:0 error:v25];

      id v22 = v28;
LABEL_8:

LABEL_9:
      break;
    default:
      id v16 = +[NSError GEOErrorWithCode:-6];
      (*((void (**)(id, void, id))v15 + 2))(v15, 0, v16);
LABEL_4:

      break;
  }
}

- (void)_loadDataFromURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (a3 && v6)
  {
    urlSession = self->_urlSession;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    void v10[2] = sub_100050E88;
    v10[3] = &unk_100082BC0;
    id v11 = v6;
    v9 = [(NSURLSession *)urlSession dataTaskWithURL:a3 completionHandler:v10];
    [v9 resume];
  }
}

- (void)_syncConfigStore
{
  v3 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050F2C;
  block[3] = &unk_100080F10;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_syncConfigStore:(id)a3
{
  id v8 = 0;
  v3 = +[NSPropertyListSerialization dataWithPropertyList:a3 format:200 options:0 error:&v8];
  id v4 = v8;
  if (v3)
  {
    unsigned __int8 v5 = objc_alloc_init(NMMessage);
    [(NMMessage *)v5 setType:56];
    id v6 = objc_alloc_init(NMArgument);
    [(NMArgument *)v6 setTag:1];
    [(NMArgument *)v6 setDataValue:v3];
    [(NMMessage *)v5 addArgument:v6];
    v7 = +[NMCGizmoConnection sharedInstance];
    [v7 sendMessage:v5 options:0];
  }
  else
  {
    sub_100053C04();
    unsigned __int8 v5 = (NMMessage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_ERROR, "Failed to serialize config store for sync: %{public}@", buf, 0xCu);
    }
  }
}

- (void)_syncSubscriptionInfoIfNecessaryWithExistingHash:(id)a3
{
  id v4 = a3;
  activeDevice = self->_activeDevice;
  if (activeDevice)
  {
    id v6 = activeDevice;
    id v7 = objc_alloc_init((Class)GEOMapDataSubscriptionManager);
    connectionQueue = self->_connectionQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    void v9[2] = sub_1000511B4;
    v9[3] = &unk_100082BE8;
    id v10 = v4;
    [v7 _fetchSubscriptionsForSyncToWatch:v6 callbackQueue:connectionQueue completionHandler:v9];
  }
}

- (void)_enumerateMapsPeerConnectionsUnderAssertionNamed:(id)a3 usingBlock:(id)a4
{
  connectionQueue = self->_connectionQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(connectionQueue);
  id v9 = [(NSMutableArray *)self->_mapsPeerConnections copy];
  sub_10001463C(v9, v8, v7);
}

- (void)_openURL:(id)a3 forMessage:(id)a4 withRouteContext:(id)a5 underAssertionNamed:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(NMReply);
  if (v8)
  {
    id v12 = +[MapsCompanionDaemonIPCInterface sharedInterface];
    id v13 = objc_alloc_init(IPCLoadDirectionsMessage);
    [(IPCLoadDirectionsMessage *)v13 setUrl:v8];
    [(IPCLoadDirectionsMessage *)v13 setOriginIsWatch:1];
    [(IPCLoadDirectionsMessage *)v13 setRouteContextData:v10];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100051564;
    v15[3] = &unk_1000811E0;
    id v16 = v11;
    id v17 = v9;
    [v12 loadDirections:v13 completion:v15];
  }
  else
  {
    id v12 = +[NSError errorWithDomain:@"NMCServerDomain" code:1 userInfo:0];
    id v13 = [[NMArgument alloc] _nm_initWithErrorValue:v12 tag:3];
    [(NMReply *)v11 addArgument:v13];
    id v14 = +[NMCGizmoConnection sharedInstance];
    [v14 sendReply:v11 forMessage:v9 options:0];
  }
}

- (id)_locationManagerForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSLock *)self->_locationManagersLock lock];
    unsigned __int8 v5 = [(NSMutableDictionary *)self->_locationManagers objectForKey:v4];
    if (!v5)
    {
      unsigned __int8 v5 = [[NMCLocationManager alloc] initWithBundleIdentifier:v4];
      [(NMCLocationManager *)v5 setLocationDidUpdate:self->_locationDidUpdate];
      [(NSMutableDictionary *)self->_locationManagers setObject:v5 forKey:v4];
    }
    [(NSLock *)self->_locationManagersLock unlock];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)_locationManagerForEffectiveBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSLock *)self->_locationManagersLock lock];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    unsigned __int8 v5 = [(NSMutableDictionary *)self->_locationManagers allValues];
    id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v18;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
        id v11 = [v10 effectiveBundleIdentifier];
        unsigned __int8 v12 = [v11 isEqualToString:v4];

        if (v12) {
          break;
        }
        if (v7 == (id)++v9)
        {
          id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v13 = v10;

      if (v13) {
        goto LABEL_13;
      }
    }
    else
    {
LABEL_10:
    }
    id v13 = [[NMCLocationManager alloc] initWithEffectiveBundleIdentifier:v4];
    [(NMCLocationManager *)v13 setLocationDidUpdate:self->_locationDidUpdate];
    locationManagers = self->_locationManagers;
    id v15 = [(NMCLocationManager *)v13 bundleIdentifier];
    [(NSMutableDictionary *)locationManagers setObject:v13 forKey:v15];

LABEL_13:
    [(NSLock *)self->_locationManagersLock unlock];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)setLocationDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copy];
  id locationDidUpdate = self->_locationDidUpdate;
  self->_id locationDidUpdate = v5;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = [(NSMutableDictionary *)self->_locationManagers allValues];
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) setLocationDidUpdate:v4];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)connection:(id)a3 didChangeDeviceConnectivity:(BOOL)a4
{
  if (!a4)
  {
    [(NSLock *)self->_locationManagersLock lock];
    id v5 = [(NSMutableDictionary *)self->_locationManagers copy];
    [(NSMutableDictionary *)self->_locationManagers removeAllObjects];
    [(NSLock *)self->_locationManagersLock unlock];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = objc_msgSend(v6, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v10), (void)v12);
          [v11 reset];

          uint64_t v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)connectionNeedsStateSynchronization:(id)a3
{
  if ([a3 isNearbyAndUsable])
  {
    [(NMCSyncManager *)self->_syncManager synchronizePreferences];
    [(NMCRoutePlanningController *)self->_routePlanningController sendPreviewRoutesIfAvailable];
    [(NMCServer *)self updateObservedStateSubscriptionIdentifiers];
    [(NMCServer *)self _checkinWithSubscriptionStateSummary];
  }
  else
  {
    id v4 = sub_100053DCC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Connection needs sync but it's not nearby and usable; ignoring",
        v5,
        2u);
    }
  }
}

- (void)_checkinWithSubscriptionStateSummary
{
  if (GEOConfigGetUInteger() != 2)
  {
    id v3 = objc_alloc_init((Class)GEOMapDataSubscriptionManager);
    [v3 _fetchSerializedPairedDeviceSubscriptionsSummaryWithCallbackQueue:self->_connectionQueue completionHandler:&stru_100082C28];
  }
}

- (void)experimentConfigurationDidChange:(id)a3
{
  id v4 = objc_alloc_init(NMMessage);
  [(NMMessage *)v4 setType:53];
  id v3 = +[NMCGizmoConnection sharedInstance];
  [v3 sendMessage:v4 options:0];
}

- (void)fetchTilesForMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 argumentForTag:102];
  id v6 = [v5 tileRequestValues];

  if ([v6 count])
  {
    id v7 = [v4 argumentForTag:103];
    id v8 = [v7 stringValue];

    if (v8)
    {
      [(NSLock *)self->_requestIdentifierToPendingTileLoaderLock lock];
      requestIdentifierToPendingTileLoader = self->_requestIdentifierToPendingTileLoader;
      if (!requestIdentifierToPendingTileLoader)
      {
        uint64_t v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v11 = self->_requestIdentifierToPendingTileLoader;
        self->_requestIdentifierToPendingTileLoader = v10;

        requestIdentifierToPendingTileLoader = self->_requestIdentifierToPendingTileLoader;
      }
      long long v12 = [(NSMutableDictionary *)requestIdentifierToPendingTileLoader objectForKey:v8];

      if (v12)
      {
        [(NSLock *)self->_requestIdentifierToPendingTileLoaderLock unlock];
        NSLog(@"Tile request identifier %@ is already in-progress. Ignoring subsequent request to start", v8);
      }
      else
      {
        long long v13 = [v4 argumentForTag:4];
        long long v14 = [v13 stringValue];

        if (v14) {
          id v15 = [objc_alloc((Class)GEOApplicationAuditToken) initWithProxiedExternalApplicationBundleId:v14];
        }
        else {
          id v15 = 0;
        }
        id v16 = [v4 argumentForTag:7];
        long long v17 = [v16 stringValue];

        if ([v17 length])
        {
          uint64_t v18 = [v15 overrideTokenWithOfflineCohortId:v17];

          id v15 = (id)v18;
        }
        long long v19 = [[NMCTileLoader alloc] initWithRequestIdentifier:v8 manifestConfiguration:self->_manifestConfiguration tileRequests:v6 auditToken:v15];
        [(NSMutableDictionary *)self->_requestIdentifierToPendingTileLoader setObject:v19 forKey:v8];
        [(NSLock *)self->_requestIdentifierToPendingTileLoaderLock unlock];
        objc_initWeak(&location, self);
        tileLoaderQueue = self->_tileLoaderQueue;
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1000521F8;
        v21[3] = &unk_100082C70;
        id v22 = v4;
        objc_copyWeak(&v24, &location);
        id v23 = v8;
        [(NMCTileLoader *)v19 startWithCallbackQueue:tileLoaderQueue tileHandler:&stru_100082C48 completionHandler:v21];

        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)checkinWithCurrentTileGroupIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOResourceManifestManager *)self->_manifestManager activeTileGroup];
  uint64_t v6 = [v5 uniqueIdentifier];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [(GEOResourceManifestManager *)self->_manifestManager activeTileGroup];
    uint64_t v9 = [v8 uniqueIdentifier];
    unsigned __int8 v10 = [v4 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      [(NMCServer *)self _sendTileGroupDidChange];
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v11 = [(GEOResourceManifestManager *)self->_manifestManager activeTileGroup];

  if (!v4 || !v11)
  {
    [(GEOResourceManifestManager *)self->_manifestManager openServerConnection];
    manifestManager = self->_manifestManager;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100052440;
    v13[3] = &unk_100082208;
    v13[4] = self;
    [(GEOResourceManifestManager *)manifestManager updateManifest:v13];
  }
LABEL_8:
}

- (void)_sendTileGroupDidChange
{
  id v6 = [(GEOResourceManifestManager *)self->_manifestManager activeTileGroup];
  v2 = objc_alloc_init(NMMessage);
  [(NMMessage *)v2 setType:102];
  id v3 = objc_alloc_init(NMArgument);
  [(NMArgument *)v3 setTag:1];
  id v4 = [v6 data];
  [(NMArgument *)v3 setDataValue:v4];

  [(NMMessage *)v2 addArgument:v3];
  id v5 = +[NMCGizmoConnection sharedInstance];
  [v5 sendMessage:v2 options:0];
}

- (void)checkinForNavigationControl
{
  id v3 = +[NSXPCConnection currentConnection];
  id v4 = sub_100053C04();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "checkinForNavigationControl on connection %@", (uint8_t *)&v6, 0xCu);
  }

  companionControllerConnection = self->_companionControllerConnection;
  self->_companionControllerConnection = v3;
}

- (void)requestSyncUpdateWithReply:(id)a3
{
}

- (void)setDroppedPin:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v7 = objc_alloc_init((Class)MSPPinStorage);
    [v7 setType:1];
    id v5 = +[NSUUID UUID];
    int v6 = [v5 UUIDString];
    [v7 setIdentifier:v6];

    [v7 setDroppedPin:v4];
  }
  else
  {
    id v7 = 0;
  }
  [(NMCSyncManager *)self->_syncManager setDroppedPin:v7];
}

- (void)_debug_fetchServerConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(NMMessage);
  [(NMMessage *)v4 setType:1500];
  id v5 = +[NMCGizmoConnection sharedInstance];
  CFStringRef v10 = @"NMSendMessageOptionReplyTimeout";
  id v11 = &off_100088450;
  int v6 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000527F8;
  v8[3] = &unk_100082C98;
  id v9 = v3;
  id v7 = v3;
  [v5 sendMessage:v4 options:v6 withReply:v8];
}

- (void)_debug_fetchDiagnosticsString:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(NMMessage);
  [(NMMessage *)v4 setType:1501];
  id v5 = +[NMCGizmoConnection sharedInstance];
  CFStringRef v10 = @"NMSendMessageOptionReplyTimeout";
  id v11 = &off_100088450;
  int v6 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000529FC;
  v8[3] = &unk_100082C98;
  id v9 = v3;
  id v7 = v3;
  [v5 sendMessage:v4 options:v6 withReply:v8];
}

- (void)syncManagerDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 pins];
  int v6 = [v5 firstObject];
  id v7 = [v6 droppedPin];
  connectionQueue = self->_connectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052BB0;
  block[3] = &unk_100081D98;
  block[4] = self;
  id v12 = v4;
  id v13 = v7;
  id v9 = v7;
  id v10 = v4;
  dispatch_async(connectionQueue, block);
}

- (void)_syncManager:(id)a3 didUpdateDroppedPin:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  id v6 = [(NSMutableArray *)self->_mapsPeerConnections copy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v11), "remoteObjectProxy", (void)v13);
        [v12 updateDroppedPin:v5];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)syncManager:(id)a3 didRequestInitialSync:(id)a4
{
  id v4 = a4;
  id v5 = objc_alloc_init(NMMessage);
  [(NMMessage *)v5 setType:50];
  id v6 = +[NMCGizmoConnection sharedInstance];
  CFStringRef v12 = @"NMSendMessageOptionReplyTimeout";
  GEOConfigGetDouble();
  id v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  long long v13 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_100052E54;
  v10[3] = &unk_100082C98;
  id v11 = v4;
  id v9 = v4;
  [v6 sendMessage:v5 options:v8 withReply:v10];
}

- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5
{
  id v6 = a4;
  if (([v6 isEqualToString:NRDevicePropertySystemVersion] & 1) != 0
    || [v6 isEqualToString:NRDevicePropertySystemBuildVersion])
  {
    [(NMCServer *)self _updateManifestConfiguration];
  }
}

- (void)_registerXPCRoutes
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Maps.NMCServer.XPC", v3);
  connectionQueue = self->_connectionQueue;
  self->_connectionQueue = v4;

  id v6 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.nanomaps.xpc.Maps"];
  listener = self->_listener;
  self->_listener = v6;

  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener _setQueue:self->_connectionQueue];
  [(NSXPCListener *)self->_listener resume];
  id v8 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.nanomaps.xpc.GeoServices"];
  geoListener = self->_geoListener;
  self->_geoListener = v8;

  [(NSXPCListener *)self->_geoListener setDelegate:self];
  [(NSXPCListener *)self->_geoListener _setQueue:self->_connectionQueue];
  uint64_t v10 = self->_geoListener;

  [(NSXPCListener *)v10 resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = (NSXPCListener *)a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  if (self->_geoListener == v6)
  {
    id v11 = [v7 valueForEntitlement:@"com.apple.nanomapscd.spi"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 BOOLValue])
    {
      CFStringRef v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GEONMCXPCInterface];
      [v7 setExportedInterface:v12];

      [v7 setExportedObject:self];
      [v7 _setQueue:self->_connectionQueue];
      [v7 resume];
      BOOL v10 = 1;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    id v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NanoCompanionXPCDaemonControlling];
    [v7 setExportedInterface:v8];

    [v7 setExportedObject:self];
    id v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NanoCompanionXPCAppControlling];
    [v7 setRemoteObjectInterface:v9];

    [v7 _setQueue:self->_connectionQueue];
    objc_initWeak(&location, self);
    objc_initWeak(&from, v7);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100053358;
    v20[3] = &unk_100081F08;
    objc_copyWeak(&v21, &location);
    objc_copyWeak(&v22, &from);
    [v7 setInvalidationHandler:v20];
    long long v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    long long v16 = sub_1000533C4;
    long long v17 = &unk_100081F08;
    objc_copyWeak(&v18, &location);
    objc_copyWeak(&v19, &from);
    [v7 setInterruptionHandler:&v14];
    -[NSMutableArray addObject:](self->_mapsPeerConnections, "addObject:", v7, v14, v15, v16, v17);
    [v7 resume];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    BOOL v10 = 1;
  }

  return v10;
}

- (void)_forgetConnection:(id)a3 reason:(id)a4
{
  id v6 = (NSXPCConnection *)a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  if (v6)
  {
    if (self->_companionControllerConnection == v6)
    {
      id v9 = sub_100053F94();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

      if (v10) {
        CFStringRef v8 = @"NanoCompanionController";
      }
      else {
        CFStringRef v8 = 0;
      }
      companionControllerConnection = self->_companionControllerConnection;
      self->_companionControllerConnection = 0;

      [(NMCRoutePlanningController *)self->_routePlanningController clearPreviewRoutesIfNeeded];
    }
    else
    {
      CFStringRef v8 = 0;
    }
    [(NSMutableArray *)self->_mapsPeerConnections removeObject:v6];
    CFStringRef v12 = sub_100053C04();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      if (!v8) {
        CFStringRef v8 = @"Other";
      }
      id v13 = [(NSMutableArray *)self->_mapsPeerConnections count];
      int v14 = 138413058;
      id v15 = v7;
      __int16 v16 = 2112;
      CFStringRef v17 = v8;
      __int16 v18 = 2048;
      id v19 = v13;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ XPC connection %@ (%lu remaining peers) %@", (uint8_t *)&v14, 0x2Au);
    }
  }
}

- (void)setNeedsSubscriptionSynchronizationUpdate
{
}

- (void)updateObservedStateSubscriptionIdentifiers
{
  if (GEOConfigGetUInteger() != 2)
  {
    id v3 = objc_alloc_init((Class)GEOMapDataSubscriptionManager);
    [v3 _fetchSerializedPairedDeviceSubscriptionIdentifiersToObserveWithCallbackQueue:self->_connectionQueue completionHandler:&stru_100082CB8];
  }
}

- (void)startOrStopDownloadForSubscriptionIdentifiers:(id)a3
{
  id v3 = a3;
  id v6 = objc_alloc_init(NMMessage);
  [(NMMessage *)v6 setType:64];
  id v4 = objc_alloc_init(NMArgument);
  [(NMArgument *)v4 setDataValue:v3];

  [(NMArgument *)v4 setTag:1];
  [(NMMessage *)v6 addArgument:v4];
  id v5 = +[NMCGizmoConnection sharedInstance];
  [v5 sendMessage:v6 options:0 withReply:&stru_100082CF8];
}

- (id)locationDidUpdate
{
  return self->_locationDidUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_locationDidUpdate, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_tileLoaderQueue, 0);
  objc_storeStrong((id *)&self->_tileMessageQueue, 0);
  objc_storeStrong((id *)&self->_locationManagersLock, 0);
  objc_storeStrong((id *)&self->_locationManagers, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);
  objc_storeStrong((id *)&self->_registry, 0);
  objc_storeStrong((id *)&self->_mapsPeerConnections, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_geoListener, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_companionControllerConnection, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_requestIdentifierToPendingTileLoaderLock, 0);
  objc_storeStrong((id *)&self->_requestIdentifierToPendingTileLoader, 0);
  objc_storeStrong((id *)&self->_tileLoader, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_storeStrong((id *)&self->_manifestConfiguration, 0);

  objc_storeStrong((id *)&self->_routePlanningController, 0);
}

@end