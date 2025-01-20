@interface NMCNavigationProxy
+ (id)sharedInstance;
- (BOOL)_isCarPlayConnected;
- (BOOL)_prepareToStartNavigationWithStartDetails:(id)a3;
- (BOOL)_shouldSendRouteStatus:(id)a3 previousRouteStatus:(id)a4;
- (NMCNavigationProxy)init;
- (int)currentUITargetForAnalytics:(int64_t)a3;
- (void)_cleanupNavigation;
- (void)_handleMessage:(id)a3;
- (void)_launchMapsForNavigation;
- (void)_legacy_sendPreviewRouteDetails:(id)a3 context:(id)a4;
- (void)_openOrCloseNavigationService;
- (void)_registerMessageObservers;
- (void)_sendRouteDetails:(id)a3 routeStatus:(id)a4 routeContext:(id)a5 forced:(BOOL)a6;
- (void)_sendRouteStatus:(id)a3 routeContext:(id)a4;
- (void)_sendRouteUpdate:(id)a3 routeContext:(id)a4;
- (void)_setupForNavigationWithRouteID:(id)a3 context:(id)a4;
- (void)_updateForActiveDevice;
- (void)_updateNavigationRouteDetails:(id)a3 routeStatus:(id)a4 routeUpdated:(BOOL)a5;
- (void)closeNavigationService;
- (void)connectionNeedsStateSynchronization:(id)a3;
- (void)dealloc;
- (void)pauseNavigation;
- (void)resumeNavigation;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)startNavigationWithDetails:(id)a3;
- (void)startNavigationWithRouteID:(id)a3 routeIndex:(unint64_t)a4 routePersistentData:(id)a5 companionRouteContext:(id)a6;
- (void)stopNavigation;
- (void)updateNavigationRouteDetails:(id)a3 routeStatus:(id)a4;
- (void)updateNavigationRouteStatus:(id)a3;
- (void)updateNavigationRouteWithUpdate:(id)a3;
@end

@implementation NMCNavigationProxy

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006594;
  block[3] = &unk_100080E80;
  block[4] = a1;
  if (qword_10009B730 != -1) {
    dispatch_once(&qword_10009B730, block);
  }
  v2 = (void *)qword_10009B728;

  return v2;
}

- (NMCNavigationProxy)init
{
  v20.receiver = self;
  v20.super_class = (Class)NMCNavigationProxy;
  v2 = [(NMCNavigationProxy *)&v20 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init((Class)NSLock);
    routeLock = v2->_routeLock;
    v2->_routeLock = v3;

    v5 = (MNCompanionNavigationAdapter *)[objc_alloc((Class)MNCompanionNavigationAdapter) initWithDelegate:v2];
    adapter = v2->_adapter;
    v2->_adapter = v5;

    id v7 = +[NRPairedDeviceRegistry sharedInstance];
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"_updateForActiveDevice" name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];

    v9 = objc_alloc_init(MapsDistanceUnitUpdater);
    distanceUnitUpdater = v2->_distanceUnitUpdater;
    v2->_distanceUnitUpdater = v9;

    [(MapsDistanceUnitUpdater *)v2->_distanceUnitUpdater start];
    v11 = [NavigationSettingsMonitor alloc];
    id v12 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"group.com.apple.Maps"];
    v13 = [(NavigationSettingsMonitor *)v11 initWithUserDefaults:v12];
    settingsMonitor = v2->_settingsMonitor;
    v2->_settingsMonitor = v13;

    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v15 = (void *)qword_10009B738;
    uint64_t v25 = qword_10009B738;
    if (!qword_10009B738)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100009B68;
      v21[3] = &unk_100080F88;
      v21[4] = &v22;
      sub_100009B68((uint64_t)v21);
      v15 = (void *)v23[3];
    }
    v16 = v15;
    _Block_object_dispose(&v22, 8);
    v17 = (CARSessionStatus *)objc_alloc_init(v16);
    carSessionStatus = v2->_carSessionStatus;
    v2->_carSessionStatus = v17;

    [(CARSessionStatus *)v2->_carSessionStatus addSessionObserver:v2];
    [(NMCNavigationProxy *)v2 _registerMessageObservers];
    [(NMCNavigationProxy *)v2 _openOrCloseNavigationService];
  }
  return v2;
}

- (void)dealloc
{
  [(MNCompanionNavigationAdapter *)self->_adapter invalidate];
  v3 = +[MNNavigationService sharedService];
  [v3 closeForClient:self];

  v4.receiver = self;
  v4.super_class = (Class)NMCNavigationProxy;
  [(NMCNavigationProxy *)&v4 dealloc];
}

- (void)startNavigationWithRouteID:(id)a3 routeIndex:(unint64_t)a4 routePersistentData:(id)a5 companionRouteContext:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v12 && (v10 || a4 != 0x7FFFFFFFFFFFFFFFLL || v11))
  {
    [(NSLock *)self->_routeLock lock];
    objc_storeStrong((id *)&self->_companionRouteContext, a6);
    [(NSLock *)self->_routeLock unlock];
    v13 = objc_alloc_init(IPCLoadDirectionsMessage);
    -[IPCLoadDirectionsMessage setOriginIsWatch:](v13, "setOriginIsWatch:", [v12 origin] == 1);
    uint64_t v22 = [v12 data];
    [(IPCLoadDirectionsMessage *)v13 setRouteContextData:v22];

    [(IPCLoadDirectionsMessage *)v13 setRoutePersistentData:v11];
    v23 = +[IPCStartNavigationMessage startNavigationMessageWithLoadDirectionsMessage:v13];
    [v23 setOriginIsWatch:1];
    [v23 setRouteIndex:a4];
    [v23 setRouteID:v10];
    uint64_t v24 = sub_100053C9C();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = [v12 simpleDescription];
      v26 = @"NO";
      if (v11) {
        v26 = @"YES";
      }
      v27 = v26;
      *(_DWORD *)buf = 134218498;
      unint64_t v31 = a4;
      __int16 v32 = 2112;
      v33 = v25;
      __int16 v34 = 2114;
      v35 = v27;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Will start navigation via IPC to route at index %lu (directions context:%@), with routePersistentData %{public}@", buf, 0x20u);
    }
    [(NMCNavigationProxy *)self _setupForNavigationWithRouteID:v10 context:v12];
    [(NMCNavigationProxy *)self _openOrCloseNavigationService];
    v28 = +[MapsCompanionDaemonIPCInterface sharedInterface];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100006BB4;
    v29[3] = &unk_100080EA8;
    v29[4] = self;
    [v28 startPreparedNavigation:v23 completion:v29];
  }
  else
  {
    sub_100053C9C();
    v13 = (IPCLoadDirectionsMessage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super.super, OS_LOG_TYPE_ERROR))
    {
      if (v12) {
        v14 = @"YES";
      }
      else {
        v14 = @"NO";
      }
      v15 = v14;
      if (v10) {
        v16 = @"YES";
      }
      else {
        v16 = @"NO";
      }
      v17 = v16;
      if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
        v18 = @"NO";
      }
      else {
        v18 = @"YES";
      }
      v19 = v18;
      if (v11) {
        objc_super v20 = @"YES";
      }
      else {
        objc_super v20 = @"NO";
      }
      v21 = v20;
      *(_DWORD *)buf = 138544130;
      unint64_t v31 = (unint64_t)v15;
      __int16 v32 = 2114;
      v33 = v17;
      __int16 v34 = 2114;
      v35 = v19;
      __int16 v36 = 2114;
      v37 = v21;
      _os_log_impl((void *)&_mh_execute_header, &v13->super.super, OS_LOG_TYPE_ERROR, "Missing vital info for starting navigation, got routeContext:%{public}@ + (routeID:%{public}@ || routeIndex:%{public}@ || routePersistentData: %{public}@)", buf, 0x2Au);
    }
  }
}

- (void)startNavigationWithDetails:(id)a3
{
  id v4 = a3;
  if ([(NMCNavigationProxy *)self _prepareToStartNavigationWithStartDetails:v4])
  {
    v5 = +[MNNavigationService sharedService];
    id v9 = 0;
    unsigned int v6 = [v5 startNavigationWithDetails:v4 error:&v9];
    id v7 = v9;

    if (v6)
    {
      [(NMCNavigationProxy *)self _launchMapsForNavigation];
    }
    else
    {
      v8 = sub_100053C9C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unable to start navigation: %@", buf, 0xCu);
      }

      [(NMCNavigationProxy *)self _cleanupNavigation];
    }
  }
}

- (BOOL)_prepareToStartNavigationWithStartDetails:(id)a3
{
  id v4 = a3;
  [(NMCNavigationProxy *)self _openOrCloseNavigationService];
  v5 = +[MNNavigationService sharedService];
  unsigned __int8 v6 = [v5 isOpenForClient:self];

  if (v6)
  {
    id v7 = +[GEOCompanionRouteContext context];
    [(NMCNavigationProxy *)self _setupForNavigationWithRouteID:0 context:v7];
    v8 = [v4 routes];
    id v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "selectedRouteIndex"));

    unsigned int v10 = [v9 transportType] - 1;
    if (v10 > 5) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = qword_100064390[v10];
    }
    [(NavigationSettingsMonitor *)self->_settingsMonitor setTransportType:v11];
    [v4 setGuidanceLevelOverride:0];
    id v12 = sub_100053C9C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = [v7 simpleDescription];
      int v15 = 138412290;
      v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Will start navigation (context:%@)", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    id v7 = sub_100053C9C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Will not start navigation, service not open for us", (uint8_t *)&v15, 2u);
    }
  }

  return v6;
}

- (void)_launchMapsForNavigation
{
  v2 = sub_100053C9C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Will launch Maps to show navigation", v4, 2u);
  }

  v3 = +[MapsCompanionDaemonIPCInterface sharedInterface];
  [v3 performWithMapsRunning:&stru_100080EE8];
}

- (void)pauseNavigation
{
  v2 = sub_100053C9C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Will pause navigation", v5, 2u);
  }

  v3 = +[MNNavigationService sharedService];
  [v3 stopNavigationWithReason:3];

  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:11028 onTarget:1225 eventValue:0];
}

- (void)resumeNavigation
{
  v2 = sub_100053C9C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Will resume navigation", v5, 2u);
  }

  v3 = +[MNNavigationService sharedService];
  [v3 advanceToNextLeg];

  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:11029 onTarget:1225 eventValue:0];
}

- (void)stopNavigation
{
  v3 = +[MNNavigationService sharedService];
  unsigned int v4 = [v3 isInNavigatingState];

  if (v4)
  {
    v5 = +[MNNavigationService sharedService];
    unsigned int v6 = [v5 navigationTransportType] - 1;
    if (v6 > 5) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = qword_100064390[v6];
    }

    v8 = +[MNNavigationService sharedService];
    [v8 stopNavigationWithReason:2];

    uint64_t v9 = [(NMCNavigationProxy *)self currentUITargetForAnalytics:v7];
    unsigned int v10 = +[MKMapService sharedService];
    [v10 captureUserAction:344 onTarget:v9 eventValue:0];
  }

  [(NMCNavigationProxy *)self _cleanupNavigation];
}

- (int)currentUITargetForAnalytics:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return 0;
  }
  else {
    return dword_1000643C0[a3 - 1];
  }
}

- (void)closeNavigationService
{
  v3 = sub_100053EFC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "SIGTERM received. Closing navigation service.", v5, 2u);
  }

  unsigned int v4 = +[MNNavigationService sharedService];
  [v4 closeForClient:self];
}

- (void)_registerMessageObservers
{
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100007824;
  v16[3] = &unk_100080F38;
  objc_copyWeak(&v17, &location);
  v3 = objc_retainBlock(v16);
  unsigned int v4 = +[NMCGizmoConnection sharedInstance];
  [v4 addConnectionObserver:self];

  v5 = objc_alloc_init(NMMessageQueue);
  [(NMMessageQueue *)v5 setMaximumInFlightMessagesCount:GEOConfigGetUInteger()];
  [(NMMessageQueue *)v5 setMaximumPendingMessages:GEOConfigGetUInteger() forMessageType:300];
  [(NMMessageQueue *)v5 setMaximumPendingMessages:GEOConfigGetUInteger() forMessageType:301];
  [(NMMessageQueue *)v5 setMaximumPendingMessages:GEOConfigGetUInteger() forMessageType:311];
  unsigned int v6 = +[NMCGizmoConnection sharedInstance];
  [v6 setMessageQueue:v5 forType:300];

  uint64_t v7 = +[NMCGizmoConnection sharedInstance];
  [v7 setMessageQueue:v5 forType:301];

  v8 = +[NMCGizmoConnection sharedInstance];
  [v8 setMessageQueue:v5 forType:311];

  uint64_t v9 = +[NMCGizmoConnection sharedInstance];
  id v10 = [v9 addMessageObserverForType:306 callback:v3];
  id v11 = [v9 addMessageObserverForType:310 callback:v3];
  id v12 = [v9 addMessageObserverForType:1000 callback:v3];
  id v13 = [v9 addMessageObserverForType:315 callback:v3];
  v14 = sub_100053C9C();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Navigation proxy now listening for IDS messages", v15, 2u);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_handleMessage:(id)a3
{
  id v4 = a3;
  int v5 = [v4 type];
  if (v5 > 314)
  {
    if (v5 == 315)
    {
      __int16 v36 = [v4 argumentForTag:418];
      id v6 = v36;
      if (v36) {
        uint64_t v37 = (uint64_t)[v36 intValue];
      }
      else {
        uint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v41 = +[MNNavigationService sharedService];
      id v42 = [v41 displayedStepIndex];

      v43 = sub_100053C9C();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v37;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v42;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Gizmo sent displayedStepIndex: %lu, we had %lu", buf, 0x16u);
      }

      if ((id)v37 == v42) {
        goto LABEL_56;
      }
      uint64_t v7 = +[MNNavigationService sharedService];
      [(NMReply *)v7 setDisplayedStepIndex:v37];
LABEL_55:

LABEL_56:
      goto LABEL_57;
    }
    if (v5 != 1000) {
      goto LABEL_57;
    }
    v19 = [v4 argumentForTag:1000];
    unsigned __int8 v20 = [v19 BOOLValue];

    if (v20)
    {
      [(NSLock *)self->_routeLock lock];
      if (self->_companionRouteStatus)
      {
        id v6 = 0;
      }
      else
      {
        NSErrorUserInfoKey v86 = NSLocalizedDescriptionKey;
        NSErrorUserInfoKey v87 = NSLocalizedFailureReasonErrorKey;
        *(void *)buf = @"Navigation is not running";
        *(void *)&buf[8] = @"Navigation is not running";
        v44 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v86 count:2];
        id v6 = +[NSError errorWithDomain:@"com.apple.nanomapscd" code:2 userInfo:v44];
      }
      [(NSLock *)self->_routeLock unlock];
      v45 = +[MNNavigationService sharedService];
      unsigned __int8 v46 = [v45 isInNavigatingState];

      if ((v46 & 1) == 0)
      {
        NSErrorUserInfoKey v86 = NSLocalizedDescriptionKey;
        NSErrorUserInfoKey v87 = NSLocalizedFailureReasonErrorKey;
        *(void *)buf = @"Maps is not running";
        *(void *)&buf[8] = @"Maps is not running";
        v47 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v86 count:2];
        uint64_t v48 = +[NSError errorWithDomain:@"com.apple.nanomapscd" code:1 userInfo:v47];

        id v6 = (id)v48;
      }
      uint64_t v7 = objc_alloc_init(NMReply);
      if (v6)
      {
        v49 = [[NMArgument alloc] _nm_initWithErrorValue:v6 tag:3];
        [(NMReply *)v7 addArgument:v49];
        v50 = sub_100053C9C();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v6;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Gizmo pinged us and we discovered an error: %@", buf, 0xCu);
        }
LABEL_50:

        v51 = +[NMCGizmoConnection sharedInstance];
        [v51 sendReply:v7 forMessage:v4 options:0];

        goto LABEL_55;
      }
    }
    else
    {
      uint64_t v7 = objc_alloc_init(NMReply);
    }
    v49 = objc_alloc_init(NMArgument);
    [(NMArgument *)v49 setTag:1];
    [(NMReply *)v7 addArgument:v49];
    v50 = sub_100053C9C();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "Gizmo pinged us and nothing is wrong, just ack", buf, 2u);
    }
    id v6 = 0;
    goto LABEL_50;
  }
  if (v5 == 306)
  {
    v21 = [v4 argumentForTag:5];
    id v6 = v21;
    if (!v21 || ([v21 hasBoolValue] & 1) == 0)
    {
      sub_100053C9C();
      uint64_t v7 = (NMReply *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_INFO, "SET_WANTS_ALL_NAV_STATUS_UPDATES message has no flag argument, ignoring", buf, 2u);
      }
      goto LABEL_55;
    }
    unsigned int v22 = [v6 BOOLValue];
    self->_BOOL sendAllUpdates = v22;
    if (!v22)
    {
      v27 = v6;
LABEL_83:
      v63 = +[MNNavigationService sharedService];
      unsigned int v64 = [v63 isOpenForClient:self];

      if (v64)
      {
        BOOL sendAllUpdates = self->_sendAllUpdates;
        v66 = sub_100053C9C();
        BOOL v67 = os_log_type_enabled(v66, OS_LOG_TYPE_INFO);
        if (sendAllUpdates)
        {
          if (v67)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "Resuming real-time updates", buf, 2u);
          }

          v68 = +[MNNavigationService sharedService];
          [v68 resumeRealtimeUpdates];
        }
        else
        {
          if (v67)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "Pausing real-time updates", buf, 2u);
          }

          v68 = +[MNNavigationService sharedService];
          [v68 pauseRealtimeUpdates];
        }
      }
      v69 = +[MNNavigationService sharedService];
      unsigned int v70 = [v69 isOpenForClient:self];

      if (v70)
      {
        BOOL v71 = self->_sendAllUpdates;
        v72 = sub_100053C9C();
        BOOL v73 = os_log_type_enabled(v72, OS_LOG_TYPE_INFO);
        if (v71)
        {
          if (v73)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "Resuming real-time updates", buf, 2u);
          }

          v74 = +[MNNavigationService sharedService];
          [v74 resumeRealtimeUpdates];
        }
        else
        {
          if (v73)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "Pausing real-time updates", buf, 2u);
          }

          v74 = +[MNNavigationService sharedService];
          [v74 pauseRealtimeUpdates];
        }
      }
      uint64_t v7 = objc_alloc_init(NMReply);
      v75 = objc_alloc_init(NMArgument);
      [(NMArgument *)v75 setTag:1];
      [(NMReply *)v7 addArgument:v75];
      v76 = +[NMCGizmoConnection sharedInstance];
      [v76 sendReply:v7 forMessage:v4 options:0];

      id v6 = v27;
      goto LABEL_55;
    }
    [(NSLock *)self->_routeLock lock];
    uint64_t v7 = (NMReply *)[(GEOCompanionRouteDetails *)self->_companionRouteDetails copy];
    id v23 = [(GEOCompanionRouteStatus *)self->_companionRouteStatus copy];
    id v24 = [(GEOCompanionRouteContext *)self->_companionRouteContext copy];
    [(NSLock *)self->_routeLock unlock];
    uint64_t v25 = +[NMCGizmoConnection sharedInstance];
    unsigned __int8 v26 = objc_msgSend(v25, "supportsTransportType:", -[NMReply transportType](v7, "transportType"));

    if ((v26 & 1) == 0)
    {
      v54 = sub_100053C9C();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        id v55 = [(NMReply *)v7 transportType];
        if (v55 >= 7)
        {
          v56 = +[NSString stringWithFormat:@"(unknown: %i)", v55];
        }
        else
        {
          v56 = off_100080FC0[(int)v55];
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v56;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "SET_WANTS_ALL_NAV_STATUS_UPDATES YES, gizmo does not support transport type: %@, bailing", buf, 0xCu);
      }
      goto LABEL_55;
    }
    v27 = [v4 argumentForTag:401];

    if (!v27) {
      goto LABEL_26;
    }
    v28 = [v27 dataValue];
    v29 = v28;
    if (v7)
    {
      v30 = [(NMReply *)v7 routeID];
      unsigned int v31 = [v30 isEqualToData:v29];

      __int16 v32 = sub_100053C9C();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        CFStringRef v33 = @"YES";
        if (v31) {
          CFStringRef v33 = @"NO";
        }
        CFStringRef v77 = v33;
        [(NMReply *)v7 routeID];
        v79 = v29;
        __int16 v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v35 = [v24 simpleDescription];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v79;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v77;
        __int16 v82 = 2112;
        v83 = v34;
        __int16 v84 = 2112;
        v85 = v35;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "SET_WANTS_ALL_NAV_STATUS_UPDATES YES (routeID:%@), shouldSendRoute:%@ with lastRouteDetails:%@ (context:%@)", buf, 0x2Au);

        v29 = v79;
      }

      if (v31)
      {
LABEL_26:
        if (v23) {
          [(NMCNavigationProxy *)self _sendRouteStatus:v23 routeContext:v24];
        }
LABEL_82:

        goto LABEL_83;
      }
    }
    else
    {
      id v57 = [v28 length];
      v58 = sub_100053C9C();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        v59 = v57 ? @"YES" : @"NO";
        v78 = v59;
        if (v23)
        {
          id v60 = [v23 feedbackType];
          if (v60 >= 0xB)
          {
            v80 = +[NSString stringWithFormat:@"(unknown: %i)", v60];
          }
          else
          {
            v80 = off_100080FF8[(int)v60];
          }
        }
        else
        {
          v80 = 0;
        }
        v61 = [v24 simpleDescription];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v29;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v78;
        __int16 v82 = 2112;
        v83 = v80;
        __int16 v84 = 2112;
        v85 = v61;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "SET_WANTS_ALL_NAV_STATUS_UPDATES YES (routeID:%@), shouldSendRoute:%@ with lastRouteStatus:%@ (context:%@)", buf, 0x2Au);

        if (v23) {
      }
        }

      if (!v57) {
        goto LABEL_26;
      }
    }
    if (![v23 feedbackType] && !v24)
    {
      id v24 = +[GEOCompanionRouteContext context];
      v62 = sub_100053C9C();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "Created override context to force NanoMaps to stop navigating!", buf, 2u);
      }
    }
    [(NMCNavigationProxy *)self _sendRouteDetails:v7 routeStatus:v23 routeContext:v24 forced:1];
    goto LABEL_82;
  }
  if (v5 == 310)
  {
    [(NSLock *)self->_routeLock lock];
    id v6 = [(GEOCompanionRouteDetails *)self->_companionRouteDetails copy];
    uint64_t v7 = (NMReply *)[(GEOCompanionRouteStatus *)self->_companionRouteStatus copy];
    id v8 = [(GEOCompanionRouteContext *)self->_companionRouteContext copy];
    [(NSLock *)self->_routeLock unlock];
    uint64_t v9 = objc_alloc_init(NMReply);
    id v10 = sub_100053C9C();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v6 && v7 && v8)
    {
      if (v11)
      {
        id v12 = [v6 routeID];
        id v13 = [v8 simpleDescription];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Gizmo has asked for a full navigation update, send latest status for route %@ (context:%@)", buf, 0x16u);
      }
      id v10 = objc_alloc_init(NMArgument);
      [v10 setTag:401];
      v14 = [v6 data];
      [v10 setDataValue:v14];

      [(NMReply *)v9 addArgument:v10 withCompressionType:1];
      int v15 = objc_alloc_init(NMArgument);
      [(NMArgument *)v15 setTag:402];
      v16 = [(NMReply *)v7 data];
      [(NMArgument *)v15 setDataValue:v16];

      [(NMReply *)v9 addArgument:v15];
      id v17 = objc_alloc_init(NMArgument);
      [(NMArgument *)v17 setTag:406];
      v18 = [v8 data];
      [(NMArgument *)v17 setDataValue:v18];

      [(NMReply *)v9 addArgument:v17];
    }
    else if (v11)
    {
      v38 = [v6 routeID];
      id v39 = [(NMReply *)v7 feedbackType];
      if (v39 >= 0xB)
      {
        v40 = +[NSString stringWithFormat:@"(unknown: %i)", v39];
      }
      else
      {
        v40 = off_100080FF8[(int)v39];
      }
      v52 = [v8 simpleDescription];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v38;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v40;
      __int16 v82 = 2112;
      v83 = v52;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Gizmo has asked for a full navigation update, but we don't have anything to send it, just ack (details:%@, status:%@, context:%@)", buf, 0x20u);
    }
    v53 = +[NMCGizmoConnection sharedInstance];
    [v53 sendReply:v9 forMessage:v4 options:0];

    goto LABEL_55;
  }
LABEL_57:
}

- (void)connectionNeedsStateSynchronization:(id)a3
{
}

- (void)_updateForActiveDevice
{
  v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v4 = [v3 getActivePairedDevice];

  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"CB81F0AE-3F2F-4D57-8C90-F0D1A4ADD373"];
  self->_activeDeviceSupportsNavigation = [v4 supportsCapability:v5];

  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"5C068089-C478-48CE-892A-13DBA45BE33A"];
  self->_activeDeviceNeedsUnpackedPointsRemoved = [v4 supportsCapability:v6] ^ 1;

  uint64_t v7 = sub_100053C9C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (self->_activeDeviceSupportsNavigation) {
      id v8 = @"YES";
    }
    else {
      id v8 = @"NO";
    }
    uint64_t v9 = v8;
    if (self->_activeDeviceNeedsUnpackedPointsRemoved) {
      id v10 = @"YES";
    }
    else {
      id v10 = @"NO";
    }
    BOOL v11 = v10;
    int v12 = 138412546;
    id v13 = v9;
    __int16 v14 = 2112;
    int v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Device supports navigation: %@. Requires unpackedLatLng removal: %@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)_openOrCloseNavigationService
{
  v3 = +[NMCGizmoConnection sharedInstance];
  unsigned int v4 = [v3 isNearbyAndUsable];

  id v5 = +[MNNavigationService sharedService];
  unsigned int v6 = [v5 isOpenForClient:self];

  if (!v4 || (v6 & 1) != 0)
  {
    if ((v4 | v6 ^ 1)) {
      return;
    }
    int v12 = sub_100053C9C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int16 v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Closing navigation service; watch not nearby",
        v14,
        2u);
    }

    id v13 = +[MNNavigationService sharedService];
    [v13 pauseRealtimeUpdates];

    BOOL v11 = +[MNNavigationService sharedService];
    [v11 closeForClient:self];
  }
  else
  {
    uint64_t v7 = sub_100053C9C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Opening navigation service; watch nearby",
        buf,
        2u);
    }

    id v8 = +[MNNavigationService sharedService];
    [v8 openForClient:self];

    BOOL sendAllUpdates = self->_sendAllUpdates;
    id v10 = +[MNNavigationService sharedService];
    BOOL v11 = v10;
    if (sendAllUpdates) {
      [v10 resumeRealtimeUpdates];
    }
    else {
      [v10 pauseRealtimeUpdates];
    }
  }
}

- (void)updateNavigationRouteDetails:(id)a3 routeStatus:(id)a4
{
}

- (void)updateNavigationRouteStatus:(id)a3
{
}

- (void)updateNavigationRouteWithUpdate:(id)a3
{
  id v8 = a3;
  [(NSLock *)self->_routeLock lock];
  objc_storeStrong((id *)&self->_companionRouteUpdate, a3);
  id v5 = self->_companionRouteContext;
  BOOL sendAllUpdates = self->_sendAllUpdates;
  [(NSLock *)self->_routeLock unlock];
  if (v5) {
    BOOL v7 = !sendAllUpdates;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    [(NMCNavigationProxy *)self _sendRouteUpdate:v8 routeContext:v5];
  }
}

- (void)_updateNavigationRouteDetails:(id)a3 routeStatus:(id)a4 routeUpdated:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  unsigned int v11 = [v10 isNavigating];
  char v12 = v11;
  if (v11)
  {
    id v13 = [v10 routeID];
    [(NMCNavigationProxy *)self _setupForNavigationWithRouteID:v13 context:0];
  }
  [(NSLock *)self->_routeLock lock];
  if (v5)
  {
    if (self->_activeDeviceNeedsUnpackedPointsRemoved)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v22 = v9;
      __int16 v14 = [v9 response];
      int v15 = [v14 routes];

      id v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v24;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v24 != v18) {
              objc_enumerationMutation(v15);
            }
            [*(id *)(*((void *)&v23 + 1) + 8 * i) setUnpackedLatLngVertices:0];
          }
          id v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v17);
      }

      id v9 = v22;
    }
    objc_storeStrong((id *)&self->_companionRouteDetails, a3);
  }
  objc_storeStrong((id *)&self->_companionRouteStatus, a4);
  id v20 = [(GEOCompanionRouteStatus *)self->_lastSentCompanionRouteStatus copy];
  v21 = self->_companionRouteContext;
  [(NSLock *)self->_routeLock unlock];
  if (v5)
  {
    [(NMCNavigationProxy *)self _sendRouteDetails:v9 routeStatus:v10 routeContext:v21 forced:0];
  }
  else if ([(NMCNavigationProxy *)self _shouldSendRouteStatus:v10 previousRouteStatus:v20])
  {
    [(NMCNavigationProxy *)self _sendRouteStatus:v10 routeContext:v21];
  }
  if ((v12 & 1) == 0) {
    [(NMCNavigationProxy *)self _cleanupNavigation];
  }
}

- (void)_setupForNavigationWithRouteID:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NSLock *)self->_routeLock lock];
  if (self->_isNavigating) {
    goto LABEL_13;
  }
  self->_isNavigating = 1;
  p_companionRouteContext = &self->_companionRouteContext;
  if (v7)
  {
    objc_storeStrong((id *)&self->_companionRouteContext, a4);
    id v9 = sub_100053C9C();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    id v10 = [(GEOCompanionRouteContext *)*p_companionRouteContext simpleDescription];
    *(_DWORD *)id v16 = 138412290;
    *(void *)&void v16[4] = v10;
    unsigned int v11 = "Navigating with provided context %@";
  }
  else if (*p_companionRouteContext)
  {
    id v9 = sub_100053C9C();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    id v10 = [(GEOCompanionRouteContext *)*p_companionRouteContext simpleDescription];
    *(_DWORD *)id v16 = 138412290;
    *(void *)&void v16[4] = v10;
    unsigned int v11 = "Navigating with context %@";
  }
  else
  {
    uint64_t v12 = +[GEOCompanionRouteContext context];
    id v13 = *p_companionRouteContext;
    *p_companionRouteContext = (GEOCompanionRouteContext *)v12;

    id v9 = sub_100053C9C();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    id v10 = [(GEOCompanionRouteContext *)*p_companionRouteContext simpleDescription];
    *(_DWORD *)id v16 = 138412290;
    *(void *)&void v16[4] = v10;
    unsigned int v11 = "Creating context for navigation %@";
  }
  _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v11, v16, 0xCu);

LABEL_11:
  if (!self->_companionRouteStatus)
  {
    __int16 v14 = (GEOCompanionRouteStatus *)objc_alloc_init((Class)GEOCompanionRouteStatus);
    companionRouteStatus = self->_companionRouteStatus;
    self->_companionRouteStatus = v14;

    [(GEOCompanionRouteStatus *)self->_companionRouteStatus setFeedbackType:1];
    [(GEOCompanionRouteStatus *)self->_companionRouteStatus setRouteID:v6];
    [(GEOCompanionRouteStatus *)self->_companionRouteStatus setStepID:0];
  }
LABEL_13:
  [(NSLock *)self->_routeLock unlock];
}

- (void)_cleanupNavigation
{
  [(NSLock *)self->_routeLock lock];
  if (self->_isNavigating)
  {
    v3 = sub_100053C9C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Did stop navigating", v8, 2u);
    }

    self->_isNavigating = 0;
    companionRouteContext = self->_companionRouteContext;
    self->_companionRouteContext = 0;

    companionRouteStatus = self->_companionRouteStatus;
    self->_companionRouteStatus = 0;

    companionRouteUpdate = self->_companionRouteUpdate;
    self->_companionRouteUpdate = 0;

    [(NSLock *)self->_routeLock unlock];
  }
  else
  {
    routeLock = self->_routeLock;
    [(NSLock *)routeLock unlock];
  }
}

- (void)_sendRouteDetails:(id)a3 routeStatus:(id)a4 routeContext:(id)a5 forced:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = +[NMCGizmoConnection sharedInstance];
  unsigned int v14 = objc_msgSend(v13, "supportsTransportType:", objc_msgSend(v10, "transportType"));

  if (v14)
  {
    BOOL v32 = v6;
    if (!self->_activeDeviceSupportsNavigation)
    {
      id v15 = [(GEOCompanionRouteDetails *)self->_companionRouteDetails copy];
      [v15 setRequest:0];
      [v15 setResponse:0];

      id v10 = v15;
    }
    id v16 = +[NMCGizmoConnection sharedInstance];
    id v17 = [v16 protocolVersion];

    unsigned int v31 = [v10 instanceCompatibleWithProtocolVersion:v17];
    uint64_t v18 = objc_alloc_init(NMMessage);
    [(NMMessage *)v18 setType:300];
    v19 = objc_alloc_init(NMArgument);
    [(NMArgument *)v19 setTag:401];
    id v20 = [v31 data];
    [(NMArgument *)v19 setDataValue:v20];

    [(NMMessage *)v18 addArgument:v19];
    v21 = [v11 instanceCompatibleWithProtocolVersion:v17];
    id v22 = objc_alloc_init(NMArgument);

    [(NMArgument *)v22 setTag:402];
    long long v23 = [v21 data];
    [(NMArgument *)v22 setDataValue:v23];

    [(NMMessage *)v18 addArgument:v22];
    long long v24 = objc_alloc_init(NMArgument);

    [(NMArgument *)v24 setTag:406];
    long long v25 = [v12 data];
    [(NMArgument *)v24 setDataValue:v25];

    [(NMMessage *)v18 addArgument:v24];
    long long v26 = +[NMCGizmoConnection sharedInstance];
    CFStringRef v33 = @"NMSendMessageOptionSendImmediately";
    v27 = +[NSNumber numberWithBool:v32];
    __int16 v34 = v27;
    v28 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    [v26 sendMessage:v18 options:v28];

    [(NSLock *)self->_routeLock lock];
    v29 = (GEOCompanionRouteStatus *)[v11 copy];
    lastSentCompanionRouteStatus = self->_lastSentCompanionRouteStatus;
    self->_lastSentCompanionRouteStatus = v29;

    [(NSLock *)self->_routeLock unlock];
  }
}

- (void)_sendRouteStatus:(id)a3 routeContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v17 = objc_alloc_init(NMMessage);
  [(NMMessage *)v17 setType:301];
  id v8 = +[NMCGizmoConnection sharedInstance];
  id v9 = objc_msgSend(v7, "instanceCompatibleWithProtocolVersion:", objc_msgSend(v8, "protocolVersion"));

  id v10 = objc_alloc_init(NMArgument);
  [(NMArgument *)v10 setTag:402];
  id v11 = [v9 data];
  [(NMArgument *)v10 setDataValue:v11];

  [(NMMessage *)v17 addArgument:v10];
  id v12 = objc_alloc_init(NMArgument);
  [(NMArgument *)v12 setTag:406];
  id v13 = [v6 data];

  [(NMArgument *)v12 setDataValue:v13];
  [(NMMessage *)v17 addArgument:v12];
  unsigned int v14 = +[NMCGizmoConnection sharedInstance];
  [v14 sendMessage:v17 options:0];

  [(NSLock *)self->_routeLock lock];
  id v15 = (GEOCompanionRouteStatus *)[v7 copy];

  lastSentCompanionRouteStatus = self->_lastSentCompanionRouteStatus;
  self->_lastSentCompanionRouteStatus = v15;

  [(NSLock *)self->_routeLock unlock];
}

- (BOOL)_shouldSendRouteStatus:(id)a3 previousRouteStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NSLock *)self->_routeLock lock];
  id v8 = [(GEOCompanionRouteDetails *)self->_companionRouteDetails copy];
  [(NSLock *)self->_routeLock unlock];
  id v9 = +[NMCGizmoConnection sharedInstance];
  unsigned int v10 = objc_msgSend(v9, "supportsTransportType:", objc_msgSend(v8, "transportType"));

  if (v10)
  {
    if (!self->_sendAllUpdates)
    {
      unsigned int v11 = [v7 feedbackType];
      if (v11 == [v6 feedbackType])
      {
        unsigned int v12 = [v7 hapticsType];
        if (v12 == [v6 hapticsType])
        {
          unsigned int v13 = [v7 isConnectedToCarplay];
          if (v13 == [v6 isConnectedToCarplay])
          {
            unsigned int v14 = [v7 guidancePromptsEnabled];
            if (v14 == [v6 guidancePromptsEnabled])
            {
              unsigned int v15 = [v7 lowGuidanceNavigation];
              if (v15 == [v6 lowGuidanceNavigation])
              {
                unsigned int v16 = [v7 displayedStepID];
                if (v16 == [v6 displayedStepID])
                {
                  unsigned int v17 = [v7 effectiveStepIDInRoute:v8];
                  if (v17 == [v6 effectiveStepIDInRoute:v8])
                  {
                    uint64_t v18 = [v7 selectedRideIndices];
                    v19 = [v6 selectedRideIndices];
                    unint64_t v20 = v18;
                    unint64_t v21 = v19;
                    id v22 = (void *)v21;
                    if (v20 | v21)
                    {
                      LOBYTE(v10) = 1;
                      long long v23 = (void *)v21;
                      long long v24 = (void *)v20;
                      if (!v20 || !v21) {
                        goto LABEL_16;
                      }
                      unsigned int v25 = [(id)v20 isEqualToArray:v21];

                      if (!v25)
                      {
                        LOBYTE(v10) = 1;
                        goto LABEL_21;
                      }
                    }
                    long long v24 = [v6 alightMessage];
                    if (!v24)
                    {
                      LOBYTE(v10) = 0;
                      goto LABEL_20;
                    }
                    long long v23 = [v6 alightMessage];
                    v29 = [v23 identifier];
                    long long v26 = [v7 alightMessage];
                    v27 = [v26 identifier];
                    unsigned int v10 = [v29 isEqual:v27] ^ 1;

LABEL_16:
LABEL_20:

LABEL_21:
                    goto LABEL_18;
                  }
                }
              }
            }
          }
        }
      }
    }
    LOBYTE(v10) = 1;
  }
LABEL_18:

  return v10;
}

- (void)_sendRouteUpdate:(id)a3 routeContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unsigned int v12 = objc_alloc_init(NMMessage);
  [(NMMessage *)v12 setType:311];
  id v7 = objc_alloc_init(NMArgument);
  [(NMArgument *)v7 setTag:412];
  id v8 = [v6 data];

  [(NMArgument *)v7 setDataValue:v8];
  [(NMMessage *)v12 addArgument:v7];
  id v9 = objc_alloc_init(NMArgument);
  [(NMArgument *)v9 setTag:406];
  unsigned int v10 = [v5 data];

  [(NMArgument *)v9 setDataValue:v10];
  [(NMMessage *)v12 addArgument:v9];
  unsigned int v11 = +[NMCGizmoConnection sharedInstance];
  [v11 sendMessage:v12 options:0];
}

- (void)_legacy_sendPreviewRouteDetails:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_alloc((Class)GEOCompanionRouteStatus);
    id v9 = [v6 routeID];
    id v10 = [v8 initWithRouteID:v9];

    unsigned int v11 = +[NSDate date];
    [v11 timeIntervalSinceReferenceDate];
    objc_msgSend(v10, "setTimestamp:");

    [v10 setFeedbackType:8];
    objc_msgSend(v10, "setRemainingTime:", objc_msgSend(v6, "originalDuration"));
  }
  else
  {
    id v10 = 0;
  }
  unsigned int v12 = sub_100053C9C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    unsigned int v13 = [v7 simpleDescription];
    int v14 = 138412290;
    unsigned int v15 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "(Legacy) Will send preview route details/status to gizmo (context:%@)", (uint8_t *)&v14, 0xCu);
  }
  [(NMCNavigationProxy *)self _sendRouteDetails:v6 routeStatus:v10 routeContext:v7 forced:0];
}

- (BOOL)_isCarPlayConnected
{
  v2 = [(CARSessionStatus *)self->_carSessionStatus currentSession];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)sessionDidConnect:(id)a3
{
  unsigned int v4 = [(NMCNavigationProxy *)self _isCarPlayConnected];
  id v5 = sub_100053C9C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CarPlay session did connect (connected:%i)", buf, 8u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000998C;
  v6[3] = &unk_100080F60;
  v6[4] = self;
  char v7 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)sessionDidDisconnect:(id)a3
{
  unsigned int v4 = [(NMCNavigationProxy *)self _isCarPlayConnected];
  id v5 = sub_100053C9C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CarPlay session did disconnect (connected:%i)", buf, 8u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100009AB0;
  v6[3] = &unk_100080F60;
  v6[4] = self;
  char v7 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
  objc_storeStrong((id *)&self->_settingsMonitor, 0);
  objc_storeStrong((id *)&self->_distanceUnitUpdater, 0);
  objc_storeStrong((id *)&self->_adapter, 0);
  objc_storeStrong((id *)&self->_companionRouteContext, 0);
  objc_storeStrong((id *)&self->_companionRouteUpdate, 0);
  objc_storeStrong((id *)&self->_lastSentCompanionRouteStatus, 0);
  objc_storeStrong((id *)&self->_companionRouteStatus, 0);
  objc_storeStrong((id *)&self->_companionRouteDetails, 0);

  objc_storeStrong((id *)&self->_routeLock, 0);
}

@end