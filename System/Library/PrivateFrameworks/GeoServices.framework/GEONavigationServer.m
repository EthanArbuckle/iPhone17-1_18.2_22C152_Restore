@interface GEONavigationServer
+ (id)identifier;
- (BOOL)shouldAcceptNewConnection:(id)a3 shouldCreateNavigationPeer:(BOOL)a4;
- (GEONavigationServer)init;
- (void)_closePushStatePeerConnection;
- (void)_forEachValidPeer:(id)a3;
- (void)_forEachValidPeerOnIsolationQueue:(id)a3;
- (void)_notifyListenersOpenConnection;
- (void)_openPushStatePeerConnection:(id)a3;
- (void)_requestActiveRouteDetailsDataWithPeer:(id)a3;
- (void)_requestETAWithPeer:(id)a3;
- (void)_requestGuidanceStateWithPeer:(id)a3;
- (void)_requestNavigationVoiceVolumeWithPeer:(id)a3;
- (void)_requestPositionFromDestinationWithPeer:(id)a3;
- (void)_requestPositionFromManeuverWithPeer:(id)a3;
- (void)_requestPositionFromSignWithPeer:(id)a3;
- (void)_requestRideSelectionsWithPeer:(id)a3;
- (void)_requestRouteSummaryWithPeer:(id)a3;
- (void)_requestRouteWithPeer:(id)a3;
- (void)_requestStepIndexWithPeer:(id)a3;
- (void)_requestStepNameInfoWithPeer:(id)a3;
- (void)_requestTransitSummaryWithPeer:(id)a3;
- (void)_sendMessage:(int64_t)a3 data:(id)a4 toPeer:(id)a5;
- (void)_updateAllPeersWithMessage:(int64_t)a3 data:(id)a4;
- (void)clearAllData;
- (void)setArrivedAtWaypoint:(id)a3 endOfLegIndex:(unint64_t)a4;
- (void)setCurrentRoadName:(id)a3;
- (void)setETAUpdate:(id)a3;
- (void)setLocation:(id)a3 routeMatchedCoordinate:(id)a4;
- (void)setNavigationSessionState:(unint64_t)a3 transportType:(int)a4 isResumingMultipointRoute:(BOOL)a5;
- (void)setNavigationVoiceVolumeWithData:(id)a3;
- (void)setResumedNavigatingFromWaypoint:(id)a3 endOfLegIndex:(unint64_t)a4;
- (void)setRoute:(id)a3;
- (void)setRouteSummaryWithActiveRouteDetailsData:(id)a3;
- (void)setRouteSummaryWithGuidanceStateData:(id)a3;
- (void)setRouteSummaryWithNavigationRouteSummaryData:(id)a3;
- (void)setRouteSummaryWithPositionFromDestinationData:(id)a3;
- (void)setRouteSummaryWithPositionFromManeuverData:(id)a3;
- (void)setRouteSummaryWithPositionFromSignData:(id)a3;
- (void)setRouteSummaryWithRideSelectionsData:(id)a3;
- (void)setRouteSummaryWithStepIndexData:(id)a3;
- (void)setRouteSummaryWithStepNameInfoData:(id)a3;
- (void)setRouteSummaryWithTransitSummaryData:(id)a3;
- (void)updateTrafficForCurrentRoute:(id)a3;
@end

@implementation GEONavigationServer

+ (id)identifier
{
  return @"navigation";
}

- (GEONavigationServer)init
{
  v11.receiver = self;
  v11.super_class = (Class)GEONavigationServer;
  v2 = [(GEONavigationServer *)&v11 init];
  if (v2)
  {
    v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEFAULT, "Initializing GEONavigationServer", buf, 2u);
    }

    id v4 = [NSString stringWithFormat:@"com.apple.Navigation.%@.%p", objc_opt_class(), v2];
    v5 = (const char *)[v4 UTF8String];
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    if (!notify_register_check("com.apple.GeoServices.navigation.openListenerConnection", &v2->_listenerConnectionOpenToken))notify_set_state(v2->_listenerConnectionOpenToken, 0); {
  }
    }
  return v2;
}

- (BOOL)shouldAcceptNewConnection:(id)a3 shouldCreateNavigationPeer:(BOOL)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  proc_pidpath([v6 processIdentifier], buffer, 0x400u);
  if (a4)
  {
    dispatch_queue_t v7 = [(GEONavdPeer *)[GEONavigationServerPeer alloc] initWithXPCConnection:v6];
    uint64_t v8 = [(GEONavdPeer *)v7 hasEntitlement:@"com.apple.geoservices.navigation_info"];
    if (v8)
    {
      [(GEONavdPeer *)v7 setExpectingUpdates:1];
      v9 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = [NSString stringWithUTF8String:buffer];
        objc_super v11 = [v10 lastPathComponent];
        *(_DWORD *)buf = 138412546;
        id v33 = v6;
        __int16 v34 = 2112;
        v35 = v11;
        _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_DEFAULT, "Navigation server received connection from navigation listener: %@ (%@)", buf, 0x16u);
      }
    }
    else
    {
      v9 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v15 = [NSString stringWithUTF8String:buffer];
        v16 = [v15 lastPathComponent];
        *(_DWORD *)buf = 138412546;
        id v33 = v6;
        __int16 v34 = 2112;
        v35 = v16;
        _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "Navigation server received connection from navigation listener: %@ (%@), but it doesn't have the proper entitlement.", buf, 0x16u);
      }
    }

    [(GEONavigationServerPeer *)v7 setHasEntitlement:v8];
    [(GEONavigationServerPeer *)v7 setDelegate:self];
    v17 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED80E3D8];
    [v6 setExportedInterface:v17];

    [v6 setExportedObject:v7];
    v18 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED7B8840];
    [v6 setRemoteObjectInterface:v18];

    [v6 _setQueue:self->_queue];
    objc_initWeak((id *)buf, self);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __76__GEONavigationServer_shouldAcceptNewConnection_shouldCreateNavigationPeer___block_invoke;
    v29[3] = &unk_1E53F68E0;
    v29[4] = self;
    objc_copyWeak(&v31, (id *)buf);
    v19 = v7;
    v30 = v19;
    v20 = (void *)MEMORY[0x18C120660](v29);
    [v6 setInvalidationHandler:v20];
    [v6 setInterruptionHandler:v20];
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__GEONavigationServer_shouldAcceptNewConnection_shouldCreateNavigationPeer___block_invoke_2;
    block[3] = &unk_1E53F6398;
    char v28 = v8;
    id v25 = v6;
    v26 = self;
    v27 = v19;
    v22 = v19;
    dispatch_async(queue, block);

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v12 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [NSString stringWithUTF8String:buffer];
      v14 = [v13 lastPathComponent];
      *(_DWORD *)buf = 138412546;
      id v33 = v6;
      __int16 v34 = 2112;
      v35 = v14;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_DEFAULT, "Navigation server received connection from navigation service: %@ (%@)", buf, 0x16u);
    }
    [(GEONavigationServer *)self _openPushStatePeerConnection:v6];
  }

  return 1;
}

void __76__GEONavigationServer_shouldAcceptNewConnection_shouldCreateNavigationPeer___block_invoke(uint64_t a1)
{
  v2 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEFAULT, "InvalidationHandler/InterruptionHandler called for listener peer.", buf, 2u);
  }

  v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__GEONavigationServer_shouldAcceptNewConnection_shouldCreateNavigationPeer___block_invoke_122;
  v4[3] = &unk_1E53D93B8;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v6);
}

void __76__GEONavigationServer_shouldAcceptNewConnection_shouldCreateNavigationPeer___block_invoke_122(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained[3] removeObject:*(void *)(a1 + 32)];
    [v5[4] removeObject:*(void *)(a1 + 32)];
    uint64_t v4 = [v5[3] count];
    v3 = v5;
    if (!v4)
    {
      [v5 clearAllData];
      v3 = v5;
    }
  }
}

void *__76__GEONavigationServer_shouldAcceptNewConnection_shouldCreateNavigationPeer___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) resume];
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 56))
  {
    v3 = *(void **)(v2 + 24);
    if (!v3)
    {
      uint64_t v4 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = v4;

      v3 = *(void **)(*(void *)(a1 + 40) + 24);
    }
    [v3 addObject:*(void *)(a1 + 48)];
    dispatch_queue_t v7 = [*(id *)(a1 + 32) remoteObjectProxy];
    [v7 navigationStateChanged:*(void *)(*(void *)(a1 + 40) + 48) transportType:*(unsigned int *)(*(void *)(a1 + 40) + 56) isResumingMultipointRoute:*(unsigned __int8 *)(*(void *)(a1 + 40) + 80)];

    result = *(void **)(a1 + 40);
    if (result[8])
    {
      v9 = [*(id *)(a1 + 32) remoteObjectProxy];
      [v9 didUpdateLocation:*(void *)(*(void *)(a1 + 40) + 64) routeMatchedCoordinate:*(void *)(*(void *)(a1 + 40) + 72)];

      result = *(void **)(a1 + 40);
    }
    if (result[13])
    {
      uint64_t v10 = *(void *)(a1 + 48);
      return (void *)[result _requestRouteSummaryWithPeer:v10];
    }
  }
  else
  {
    objc_super v11 = *(void **)(v2 + 32);
    if (!v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
      uint64_t v13 = *(void *)(a1 + 40);
      v14 = *(void **)(v13 + 32);
      *(void *)(v13 + 32) = v12;

      objc_super v11 = *(void **)(*(void *)(a1 + 40) + 32);
    }
    uint64_t v15 = *(void *)(a1 + 48);
    return (void *)[v11 addObject:v15];
  }
  return result;
}

- (void)setNavigationSessionState:(unint64_t)a3 transportType:(int)a4 isResumingMultipointRoute:(BOOL)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v9 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v15 = a3;
    __int16 v16 = 1024;
    int v17 = a4;
    _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_DEFAULT, "Navigation server setNavigationSessionState: %d transportType: %d", buf, 0xEu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__GEONavigationServer_setNavigationSessionState_transportType_isResumingMultipointRoute___block_invoke;
  block[3] = &unk_1E53E49D0;
  void block[4] = self;
  block[5] = a3;
  int v12 = a4;
  BOOL v13 = a5;
  dispatch_async(queue, block);
}

void __89__GEONavigationServer_setNavigationSessionState_transportType_isResumingMultipointRoute___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(v2 + 48);
  if (v4 != v3 || *(_DWORD *)(v2 + 56) != *(_DWORD *)(a1 + 48))
  {
    *(void *)(v2 + 48) = v3;
    *(_DWORD *)(*(void *)(a1 + 32) + 56) = *(_DWORD *)(a1 + 48);
    *(unsigned char *)(*(void *)(a1 + 32) + 80) = *(unsigned char *)(a1 + 52);
    if (*(void *)(a1 + 40)) {
      goto LABEL_5;
    }
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = 0;

    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 64);
    *(void *)(v7 + 64) = 0;

    if (*(void *)(a1 + 40))
    {
LABEL_5:
      if (!*(unsigned char *)(*(void *)(a1 + 32) + 40))
      {
        uint64_t v10 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEFAULT, "GEONavigationServer setting connection to open", buf, 2u);
        }

        [*(id *)(a1 + 32) _notifyListenersOpenConnection];
        int v9 = 0;
LABEL_10:
        uint64_t v11 = *(void *)(a1 + 40);
        if (v11 == 2)
        {
          int v12 = "com.apple.GeoServices.navigation.started";
        }
        else
        {
          if (v4 != 2 || v11 != 0) {
            goto LABEL_19;
          }
          int v12 = "com.apple.GeoServices.navigation.stopped";
        }
        notify_post(v12);
LABEL_19:
        if (v9)
        {
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __89__GEONavigationServer_setNavigationSessionState_transportType_isResumingMultipointRoute___block_invoke_127;
          v16[3] = &__block_descriptor_45_e79_v24__0__GEONavigationServerPeer_8___GEONavigationServerListenerXPCInterface__16l;
          v14 = *(void **)(a1 + 32);
          v16[4] = *(void *)(a1 + 40);
          int v17 = *(_DWORD *)(a1 + 48);
          char v18 = *(unsigned char *)(a1 + 52);
          [v14 _forEachValidPeerOnIsolationQueue:v16];
        }
        return;
      }
    }
    else if (*(unsigned char *)(*(void *)(a1 + 32) + 40))
    {
      int v15 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEFAULT, "GEONavigationServer setting connection to closed", buf, 2u);
      }

      *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
      notify_set_state(*(_DWORD *)(*(void *)(a1 + 32) + 44), 0);
    }
    int v9 = 1;
    goto LABEL_10;
  }
}

uint64_t __89__GEONavigationServer_setNavigationSessionState_transportType_isResumingMultipointRoute___block_invoke_127(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 navigationStateChanged:*(void *)(a1 + 32) transportType:*(unsigned int *)(a1 + 40) isResumingMultipointRoute:*(unsigned __int8 *)(a1 + 44)];
}

- (void)setLocation:(id)a3 routeMatchedCoordinate:(id)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__GEONavigationServer_setLocation_routeMatchedCoordinate___block_invoke;
  block[3] = &unk_1E53D9680;
  void block[4] = self;
  id v10 = v6;
  $212C09783140BCCD23384160D545CE0D v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __58__GEONavigationServer_setLocation_routeMatchedCoordinate___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  *(void *)(*(void *)(a1 + 32) + 72) = *(void *)(a1 + 48);
  uint64_t v2 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = *(_DWORD *)(a1 + 48);
    double v5 = *(float *)(a1 + 52);
    *(_DWORD *)buf = 138478339;
    uint64_t v13 = v3;
    __int16 v14 = 1025;
    int v15 = v4;
    __int16 v16 = 2049;
    double v17 = v5;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "setLocation: %{private}@\nrouteMatchedCoordinate: [%{private}u, %{private}f]", buf, 0x1Cu);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__GEONavigationServer_setLocation_routeMatchedCoordinate___block_invoke_130;
  v9[3] = &unk_1E53F6928;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v10 = v7;
  uint64_t v11 = v8;
  [v6 _forEachValidPeerOnIsolationQueue:v9];
}

uint64_t __58__GEONavigationServer_setLocation_routeMatchedCoordinate___block_invoke_130(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 didUpdateLocation:*(void *)(a1 + 32) routeMatchedCoordinate:*(void *)(a1 + 40)];
}

- (void)setRoute:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__GEONavigationServer_setRoute___block_invoke;
  v7[3] = &unk_1E53D8998;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __32__GEONavigationServer_setRoute___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(a1 + 40));
  uint64_t v2 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = [*(id *)(a1 + 40) name];
    *(_DWORD *)buf = 138477827;
    id v8 = v3;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "setRoute: %{private}@", buf, 0xCu);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__GEONavigationServer_setRoute___block_invoke_131;
  v5[3] = &unk_1E53F6950;
  id v4 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v4 _forEachValidPeerOnIsolationQueue:v5];
}

void __32__GEONavigationServer_setRoute___block_invoke_131(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if ([a2 wantsRoutes]) {
    [v5 didUpdateRoute:*(void *)(a1 + 32)];
  }
}

- (void)setETAUpdate:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    id v11 = v4;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "setETAUpdate: %{private}@", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__GEONavigationServer_setETAUpdate___block_invoke;
  v8[3] = &unk_1E53D8998;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __36__GEONavigationServer_setETAUpdate___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), *(id *)(a1 + 40));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__GEONavigationServer_setETAUpdate___block_invoke_2;
  v3[3] = &unk_1E53F6950;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v2 _forEachValidPeerOnIsolationQueue:v3];
}

void __36__GEONavigationServer_setETAUpdate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if ([a2 wantsRoutes]) {
    [v5 didUpdateETA:*(void *)(a1 + 32)];
  }
}

- (void)updateTrafficForCurrentRoute:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    id v11 = v4;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "updateTrafficForCurrentRoute: %{private}@", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__GEONavigationServer_updateTrafficForCurrentRoute___block_invoke;
  v8[3] = &unk_1E53D8998;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __52__GEONavigationServer_updateTrafficForCurrentRoute___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 88) mutableData];
  [v3 setTraffic:v2];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__GEONavigationServer_updateTrafficForCurrentRoute___block_invoke_2;
  v5[3] = &unk_1E53F6950;
  id v4 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v4 _forEachValidPeerOnIsolationQueue:v5];
}

void __52__GEONavigationServer_updateTrafficForCurrentRoute___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if ([a2 wantsRoutes]) {
    [v5 didUpdateTrafficForCurrentRoute:*(void *)(a1 + 32)];
  }
}

- (void)setArrivedAtWaypoint:(id)a3 endOfLegIndex:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478083;
    id v13 = v6;
    __int16 v14 = 2048;
    unint64_t v15 = a4;
    _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "setArrivedAtWaypoint: %{private}@ endOfLegIndex: %lu", buf, 0x16u);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__GEONavigationServer_setArrivedAtWaypoint_endOfLegIndex___block_invoke;
  v9[3] = &unk_1E53F6928;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  [(GEONavigationServer *)self _forEachValidPeer:v9];
}

uint64_t __58__GEONavigationServer_setArrivedAtWaypoint_endOfLegIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 didArriveAtWaypoint:*(void *)(a1 + 32) endOfLegIndex:*(void *)(a1 + 40)];
}

- (void)setResumedNavigatingFromWaypoint:(id)a3 endOfLegIndex:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478083;
    id v13 = v6;
    __int16 v14 = 2048;
    unint64_t v15 = a4;
    _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "setResumedNavigatingFromWaypoint: %{private}@ endOfLegIndex: %lu", buf, 0x16u);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__GEONavigationServer_setResumedNavigatingFromWaypoint_endOfLegIndex___block_invoke;
  v9[3] = &unk_1E53F6928;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  [(GEONavigationServer *)self _forEachValidPeer:v9];
}

uint64_t __70__GEONavigationServer_setResumedNavigatingFromWaypoint_endOfLegIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 didResumeNavigatingFromWaypoint:*(void *)(a1 + 32) endOfLegIndex:*(void *)(a1 + 40)];
}

- (void)setRouteSummaryWithNavigationRouteSummaryData:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_routeSummaryData, a3);
  id v6 = [[GEONavigationRouteSummary alloc] initWithData:self->_routeSummaryData];
  id v7 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "Setting route summary\n", buf, 2u);
  }

  id v8 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = [(GEONavigationRouteSummary *)v6 destinationName];
    *(_DWORD *)buf = 138477827;
    v29 = v9;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "\tDestination: %{private}@\n", buf, 0xCu);
  }
  id v10 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v27 = [(GEONavigationRouteSummary *)v6 origin];
    v26 = [v27 latLng];
    [v26 lat];
    uint64_t v12 = v11;
    id v13 = [(GEONavigationRouteSummary *)v6 origin];
    __int16 v14 = [v13 latLng];
    [v14 lng];
    uint64_t v16 = v15;
    double v17 = [(GEONavigationRouteSummary *)v6 destination];
    uint64_t v18 = [v17 latLng];
    [v18 lat];
    uint64_t v20 = v19;
    v21 = [(GEONavigationRouteSummary *)v6 destination];
    v22 = [v21 latLng];
    [v22 lng];
    *(_DWORD *)buf = 134284289;
    v29 = v12;
    __int16 v30 = 2049;
    uint64_t v31 = v16;
    __int16 v32 = 2049;
    uint64_t v33 = v20;
    __int16 v34 = 2049;
    uint64_t v35 = v23;
    _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "\tFrom: [%{private}0.8f, %{private}0.8f] | To: [%{private}0.8f, %{private}0.8f]\n", buf, 0x2Au);
  }
  v24 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    int v25 = [(GEONavigationRouteSummary *)v6 transportType];
    *(_DWORD *)buf = 67109120;
    LODWORD(v29) = v25;
    _os_log_impl(&dword_188D96000, v24, OS_LOG_TYPE_DEBUG, "\tTransport type: %d\n", buf, 8u);
  }

  [(GEONavigationServer *)self _updateAllPeersWithMessage:0 data:self->_routeSummaryData];
}

- (void)setRouteSummaryWithTransitSummaryData:(id)a3
{
  objc_storeStrong((id *)&self->_transitSummaryData, a3);
  id v5 = a3;
  id v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "Setting transit summary data", v7, 2u);
  }

  [(GEONavigationServer *)self _updateAllPeersWithMessage:1 data:self->_transitSummaryData];
}

- (void)setRouteSummaryWithGuidanceStateData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_guidanceStateData, a3);
  id v6 = [[GEONavigationGuidanceState alloc] initWithData:v5];
  id v7 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(GEONavigationGuidanceState *)v6 navigationState];
    if (v8 >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = off_1E53F6970[(int)v8];
    }
    id v10 = v9;
    uint64_t v11 = [(GEONavigationGuidanceState *)v6 trackedTransportType];
    if (v11 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v11);
      uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v12 = off_1E53F69B8[(int)v11];
    }
    *(_DWORD *)buf = 138478339;
    __int16 v14 = v10;
    __int16 v15 = 2113;
    uint64_t v16 = v12;
    __int16 v17 = 2048;
    id v18 = v5;
    _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEFAULT, "Setting guidance state: %{private}@ | transport type: %{private}@ | data: %p\n", buf, 0x20u);
  }
  [(GEONavigationServer *)self _updateAllPeersWithMessage:2 data:self->_guidanceStateData];
}

- (void)setRouteSummaryWithActiveRouteDetailsData:(id)a3
{
  objc_storeStrong((id *)&self->_activeRouteDetailsData, a3);
  id v5 = a3;
  id v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "Setting active route details data", v7, 2u);
  }

  [(GEONavigationServer *)self _updateAllPeersWithMessage:3 data:self->_activeRouteDetailsData];
}

- (void)setRouteSummaryWithStepIndexData:(id)a3
{
  objc_storeStrong((id *)&self->_stepIndexData, a3);
  id v5 = a3;
  id v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "Setting step index data", v7, 2u);
  }

  [(GEONavigationServer *)self _updateAllPeersWithMessage:4 data:self->_stepIndexData];
}

- (void)setRouteSummaryWithStepNameInfoData:(id)a3
{
  objc_storeStrong((id *)&self->_stepNameInfoData, a3);
  id v5 = a3;
  id v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "Setting step name info data", v7, 2u);
  }

  [(GEONavigationServer *)self _updateAllPeersWithMessage:5 data:self->_stepNameInfoData];
}

- (void)setRouteSummaryWithRideSelectionsData:(id)a3
{
  objc_storeStrong((id *)&self->_rideSelectionsData, a3);
  id v5 = a3;
  id v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "Setting selected ride option data", v7, 2u);
  }

  [(GEONavigationServer *)self _updateAllPeersWithMessage:6 data:self->_rideSelectionsData];
}

- (void)setRouteSummaryWithPositionFromSignData:(id)a3
{
  objc_storeStrong((id *)&self->_positionFromSignData, a3);
  id v5 = a3;
  id v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "Setting position from sign data", v7, 2u);
  }

  [(GEONavigationServer *)self _updateAllPeersWithMessage:7 data:self->_positionFromSignData];
}

- (void)setRouteSummaryWithPositionFromManeuverData:(id)a3
{
  objc_storeStrong((id *)&self->_positionFromManeuverData, a3);
  id v5 = a3;
  id v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "Setting position from maneuver data", v7, 2u);
  }

  [(GEONavigationServer *)self _updateAllPeersWithMessage:8 data:self->_positionFromManeuverData];
}

- (void)setRouteSummaryWithPositionFromDestinationData:(id)a3
{
  objc_storeStrong((id *)&self->_positionFromDestinationData, a3);
  id v5 = a3;
  id v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "Setting position from destination data", v7, 2u);
  }

  [(GEONavigationServer *)self _updateAllPeersWithMessage:9 data:self->_positionFromDestinationData];
}

- (void)setNavigationVoiceVolumeWithData:(id)a3
{
  objc_storeStrong((id *)&self->_navigationVoiceVolumeData, a3);
  id v5 = a3;
  id v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "Setting navigation voice volume data", v7, 2u);
  }

  [(GEONavigationServer *)self _updateAllPeersWithMessage:10 data:self->_navigationVoiceVolumeData];
}

- (void)setCurrentRoadName:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Setting current road name: %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__GEONavigationServer_setCurrentRoadName___block_invoke;
  v7[3] = &unk_1E53F6950;
  id v8 = v4;
  id v6 = v4;
  [(GEONavigationServer *)self _forEachValidPeer:v7];
}

uint64_t __42__GEONavigationServer_setCurrentRoadName___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 currentRoadNameUpdated:*(void *)(a1 + 32)];
}

- (void)_requestRouteWithPeer:(id)a3
{
  id v4 = a3;
  if ([v4 wantsRoutes])
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__GEONavigationServer__requestRouteWithPeer___block_invoke;
    v6[3] = &unk_1E53D8998;
    id v7 = v4;
    id v8 = self;
    dispatch_async(queue, v6);
  }
}

void __45__GEONavigationServer__requestRouteWithPeer___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) connection];
  uint64_t v2 = [v3 remoteObjectProxy];
  [v2 didUpdateRoute:*(void *)(*(void *)(a1 + 40) + 88)];
}

- (void)_requestETAWithPeer:(id)a3
{
  id v4 = a3;
  if ([v4 wantsRoutes])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__GEONavigationServer__requestETAWithPeer___block_invoke;
    v5[3] = &unk_1E53D8998;
    id v6 = v4;
    id v7 = self;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

void __43__GEONavigationServer__requestETAWithPeer___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) connection];
  uint64_t v2 = [v3 remoteObjectProxy];
  [v2 didUpdateETA:*(void *)(*(void *)(a1 + 40) + 96)];
}

- (void)_requestRouteSummaryWithPeer:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__GEONavigationServer__requestRouteSummaryWithPeer___block_invoke;
  v7[3] = &unk_1E53D8998;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __52__GEONavigationServer__requestRouteSummaryWithPeer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:0 data:*(void *)(*(void *)(a1 + 32) + 104) toPeer:*(void *)(a1 + 40)];
}

- (void)_requestTransitSummaryWithPeer:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__GEONavigationServer__requestTransitSummaryWithPeer___block_invoke;
  v7[3] = &unk_1E53D8998;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __54__GEONavigationServer__requestTransitSummaryWithPeer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:1 data:*(void *)(*(void *)(a1 + 32) + 112) toPeer:*(void *)(a1 + 40)];
}

- (void)_requestGuidanceStateWithPeer:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__GEONavigationServer__requestGuidanceStateWithPeer___block_invoke;
  v7[3] = &unk_1E53D8998;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __53__GEONavigationServer__requestGuidanceStateWithPeer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:2 data:*(void *)(*(void *)(a1 + 32) + 120) toPeer:*(void *)(a1 + 40)];
}

- (void)_requestActiveRouteDetailsDataWithPeer:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__GEONavigationServer__requestActiveRouteDetailsDataWithPeer___block_invoke;
  v7[3] = &unk_1E53D8998;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __62__GEONavigationServer__requestActiveRouteDetailsDataWithPeer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:3 data:*(void *)(*(void *)(a1 + 32) + 128) toPeer:*(void *)(a1 + 40)];
}

- (void)_requestStepIndexWithPeer:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__GEONavigationServer__requestStepIndexWithPeer___block_invoke;
  v7[3] = &unk_1E53D8998;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __49__GEONavigationServer__requestStepIndexWithPeer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:4 data:*(void *)(*(void *)(a1 + 32) + 136) toPeer:*(void *)(a1 + 40)];
}

- (void)_requestStepNameInfoWithPeer:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__GEONavigationServer__requestStepNameInfoWithPeer___block_invoke;
  v7[3] = &unk_1E53D8998;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __52__GEONavigationServer__requestStepNameInfoWithPeer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:5 data:*(void *)(*(void *)(a1 + 32) + 144) toPeer:*(void *)(a1 + 40)];
}

- (void)_requestRideSelectionsWithPeer:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__GEONavigationServer__requestRideSelectionsWithPeer___block_invoke;
  v7[3] = &unk_1E53D8998;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __54__GEONavigationServer__requestRideSelectionsWithPeer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:6 data:*(void *)(*(void *)(a1 + 32) + 152) toPeer:*(void *)(a1 + 40)];
}

- (void)_requestPositionFromSignWithPeer:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__GEONavigationServer__requestPositionFromSignWithPeer___block_invoke;
  v7[3] = &unk_1E53D8998;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __56__GEONavigationServer__requestPositionFromSignWithPeer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:7 data:*(void *)(*(void *)(a1 + 32) + 160) toPeer:*(void *)(a1 + 40)];
}

- (void)_requestPositionFromManeuverWithPeer:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__GEONavigationServer__requestPositionFromManeuverWithPeer___block_invoke;
  v7[3] = &unk_1E53D8998;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __60__GEONavigationServer__requestPositionFromManeuverWithPeer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:8 data:*(void *)(*(void *)(a1 + 32) + 168) toPeer:*(void *)(a1 + 40)];
}

- (void)_requestPositionFromDestinationWithPeer:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__GEONavigationServer__requestPositionFromDestinationWithPeer___block_invoke;
  v7[3] = &unk_1E53D8998;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __63__GEONavigationServer__requestPositionFromDestinationWithPeer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:9 data:*(void *)(*(void *)(a1 + 32) + 176) toPeer:*(void *)(a1 + 40)];
}

- (void)_requestNavigationVoiceVolumeWithPeer:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__GEONavigationServer__requestNavigationVoiceVolumeWithPeer___block_invoke;
  v7[3] = &unk_1E53D8998;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __61__GEONavigationServer__requestNavigationVoiceVolumeWithPeer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:10 data:*(void *)(*(void *)(a1 + 32) + 184) toPeer:*(void *)(a1 + 40)];
}

- (void)_updateAllPeersWithMessage:(int64_t)a3 data:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__GEONavigationServer__updateAllPeersWithMessage_data___block_invoke;
  block[3] = &unk_1E53D9680;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __55__GEONavigationServer__updateAllPeersWithMessage_data___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 32), "_sendMessage:data:toPeer:", *(void *)(a1 + 48), *(void *)(a1 + 40), *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_forEachValidPeer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__GEONavigationServer__forEachValidPeer___block_invoke;
    v7[3] = &unk_1E53D7ED0;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __41__GEONavigationServer__forEachValidPeer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _forEachValidPeerOnIsolationQueue:*(void *)(a1 + 40)];
}

- (void)_forEachValidPeerOnIsolationQueue:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void *))a3;
  if (v4)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = self->_listenerPeers;
    uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v10, "expectingUpdates", (void)v13))
          {
            int64_t v11 = [v10 connection];
            uint64_t v12 = [v11 remoteObjectProxy];

            v4[2](v4, v10, v12);
          }
        }
        uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

- (void)_sendMessage:(int64_t)a3 data:(id)a4 toPeer:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if ([v9 expectingUpdates])
  {
    long long v10 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 134218242;
      int64_t v14 = a3;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "Sending data with message: %ld, %@", (uint8_t *)&v13, 0x16u);
    }

    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    if (v9)
    {
      switch(a3)
      {
        case 0:
          int64_t v11 = [v9 connection];
          uint64_t v12 = [v11 remoteObjectProxy];
          [v12 routeSummaryUpdatedWithNavigationRouteSummaryData:v8];
          goto LABEL_19;
        case 1:
          int64_t v11 = [v9 connection];
          uint64_t v12 = [v11 remoteObjectProxy];
          [v12 routeSummaryUpdatedWithTransitSummaryData:v8];
          goto LABEL_19;
        case 2:
          int64_t v11 = [v9 connection];
          uint64_t v12 = [v11 remoteObjectProxy];
          [v12 routeSummaryUpdatedWithGuidanceStateData:v8];
          goto LABEL_19;
        case 3:
          int64_t v11 = [v9 connection];
          uint64_t v12 = [v11 remoteObjectProxy];
          [v12 routeSummaryUpdatedWithActiveRouteDetailsData:v8];
          goto LABEL_19;
        case 4:
          int64_t v11 = [v9 connection];
          uint64_t v12 = [v11 remoteObjectProxy];
          [v12 routeSummaryUpdatedWithStepIndexData:v8];
          goto LABEL_19;
        case 5:
          int64_t v11 = [v9 connection];
          uint64_t v12 = [v11 remoteObjectProxy];
          [v12 routeSummaryUpdatedWithStepNameInfoData:v8];
          goto LABEL_19;
        case 6:
          int64_t v11 = [v9 connection];
          uint64_t v12 = [v11 remoteObjectProxy];
          [v12 routeSummaryUpdatedWithRideSelectionData:v8];
          goto LABEL_19;
        case 7:
          int64_t v11 = [v9 connection];
          uint64_t v12 = [v11 remoteObjectProxy];
          [v12 routeSummaryUpdatedWithPositionFromSignData:v8];
          goto LABEL_19;
        case 8:
          int64_t v11 = [v9 connection];
          uint64_t v12 = [v11 remoteObjectProxy];
          [v12 routeSummaryUpdatedWithPositionFromManeuverData:v8];
          goto LABEL_19;
        case 9:
          int64_t v11 = [v9 connection];
          uint64_t v12 = [v11 remoteObjectProxy];
          [v12 routeSummaryUpdatedWithPositionFromDestinationData:v8];
          goto LABEL_19;
        case 10:
          int64_t v11 = [v9 connection];
          uint64_t v12 = [v11 remoteObjectProxy];
          [v12 navigationUpdatedWithVoiceVolumeData:v8];
LABEL_19:

          break;
        default:
          int64_t v11 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            int v13 = 134217984;
            int64_t v14 = a3;
            _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEBUG, "Unknown message type found. Please file a bug. message type: %ld", (uint8_t *)&v13, 0xCu);
          }
          break;
      }
    }
  }
}

- (void)clearAllData
{
  route = self->_route;
  self->_route = 0;

  routeSummaryData = self->_routeSummaryData;
  self->_routeSummaryData = 0;

  transitSummaryData = self->_transitSummaryData;
  self->_transitSummaryData = 0;

  guidanceStateData = self->_guidanceStateData;
  self->_guidanceStateData = 0;

  activeRouteDetailsData = self->_activeRouteDetailsData;
  self->_activeRouteDetailsData = 0;

  stepIndexData = self->_stepIndexData;
  self->_stepIndexData = 0;

  stepNameInfoData = self->_stepNameInfoData;
  self->_stepNameInfoData = 0;

  rideSelectionsData = self->_rideSelectionsData;
  self->_rideSelectionsData = 0;

  positionFromSignData = self->_positionFromSignData;
  self->_positionFromSignData = 0;

  positionFromManeuverData = self->_positionFromManeuverData;
  self->_positionFromManeuverData = 0;

  positionFromDestinationData = self->_positionFromDestinationData;
  self->_positionFromDestinationData = 0;

  navigationVoiceVolumeData = self->_navigationVoiceVolumeData;
  self->_navigationVoiceVolumeData = 0;
}

- (void)_openPushStatePeerConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEFAULT, "Opening push state peer connection.", (uint8_t *)buf, 2u);
  }

  if (self->_pushStatePeer)
  {
    uint64_t v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "Push state peer already connected. Aborting.", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    uint64_t v7 = [[GEONavdPeer alloc] initWithXPCConnection:v4];
    pushStatePeer = self->_pushStatePeer;
    self->_pushStatePeer = v7;

    id v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED80E708];
    [v4 setExportedInterface:v9];

    [v4 setExportedObject:self];
    [v4 _setQueue:self->_queue];
    objc_initWeak(buf, self);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __52__GEONavigationServer__openPushStatePeerConnection___block_invoke;
    int v13 = &unk_1E53DF7F8;
    int64_t v14 = self;
    objc_copyWeak(&v15, buf);
    [v4 setInvalidationHandler:&v10];
    objc_msgSend(v4, "resume", v10, v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
  }
}

void __52__GEONavigationServer__openPushStatePeerConnection___block_invoke(uint64_t a1)
{
  id v2 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEFAULT, "InvalidationHandler called for push state peer.", buf, 2u);
  }

  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__GEONavigationServer__openPushStatePeerConnection___block_invoke_155;
  block[3] = &unk_1E53D7B90;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  dispatch_async(v3, block);
  objc_destroyWeak(&v5);
}

void __52__GEONavigationServer__openPushStatePeerConnection___block_invoke_155(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _closePushStatePeerConnection];
}

- (void)_closePushStatePeerConnection
{
  uint64_t v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEFAULT, "Closing push state peer connection.", v7, 2u);
  }

  pushStatePeer = self->_pushStatePeer;
  if (pushStatePeer)
  {
    id v5 = [(GEONavdPeer *)pushStatePeer connection];
    [v5 invalidate];

    uint64_t v6 = self->_pushStatePeer;
    self->_pushStatePeer = 0;
  }
}

- (void)_notifyListenersOpenConnection
{
  if (!self->_isListenerConnectionOpen)
  {
    uint64_t v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavigationServer");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEFAULT, "Navigation server notifying listeners to open.", v4, 2u);
    }

    self->_isListenerConnectionOpen = 1;
    notify_set_state(self->_listenerConnectionOpenToken, 1uLL);
    notify_post("com.apple.GeoServices.navigation.openListenerConnection");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationVoiceVolumeData, 0);
  objc_storeStrong((id *)&self->_positionFromDestinationData, 0);
  objc_storeStrong((id *)&self->_positionFromManeuverData, 0);
  objc_storeStrong((id *)&self->_positionFromSignData, 0);
  objc_storeStrong((id *)&self->_rideSelectionsData, 0);
  objc_storeStrong((id *)&self->_stepNameInfoData, 0);
  objc_storeStrong((id *)&self->_stepIndexData, 0);
  objc_storeStrong((id *)&self->_activeRouteDetailsData, 0);
  objc_storeStrong((id *)&self->_guidanceStateData, 0);
  objc_storeStrong((id *)&self->_transitSummaryData, 0);
  objc_storeStrong((id *)&self->_routeSummaryData, 0);
  objc_storeStrong((id *)&self->_timeAndDistanceInfo, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_unEntitledPeers, 0);
  objc_storeStrong((id *)&self->_listenerPeers, 0);
  objc_storeStrong((id *)&self->_pushStatePeer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end