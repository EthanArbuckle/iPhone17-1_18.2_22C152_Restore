@interface HURoutesManager
- (AXDispatchTimer)subscribeTimer;
- (BOOL)isRouteUIDHearingAidPeripheralUUID:(id)a3 inPeripheralUUIDs:(id)a4;
- (BOOL)oldRoutes:(id)a3 equalToNewRoutes:(id)a4;
- (BOOL)shouldUpdateClients;
- (HURoutesManager)init;
- (OS_dispatch_queue)routingQueue;
- (id)_copyPickableRoutes;
- (id)currentPickableAudioRoutes;
- (id)fetchCurrentPickableAudioRoutesIfNeeded;
- (id)fetchHearingAidsPeripheralUUIDs;
- (void)_savePickableRoutes:(id)a3;
- (void)clearAudioRoutes;
- (void)dealloc;
- (void)fetchCurrentPickableAudioRoutesIfNeededAsync:(id)a3;
- (void)mediaServerDied;
- (void)pickableAudioRoutesDidChange:(id)a3;
- (void)registerNotifications;
- (void)setRoutingQueue:(id)a3;
- (void)setShouldUpdateClients:(BOOL)a3;
- (void)setSubscribeTimer:(id)a3;
@end

@implementation HURoutesManager

void __35__HURoutesManager_clearAudioRoutes__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

uint64_t __39__HURoutesManager__savePickableRoutes___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x270F9A758]();
}

uint64_t __38__HURoutesManager__copyPickableRoutes__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) copy];

  return MEMORY[0x270F9A758]();
}

void __58__HURoutesManager_fetchCurrentPickableAudioRoutesIfNeeded__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 valueForKey:@"RouteCurrentlyPicked"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    v6 = [v3 objectForKey:@"OutputRoute"];
    v7 = v6;
    if (!v6 || [v6 BOOLValue]) {
      [*(id *)(a1 + 32) setObject:v3 forKey:@"AXSHARoutePicked"];
    }
  }
  v8 = [v3 valueForKey:@"AVAudioRouteName"];
  v9 = [v3 valueForKey:@"RouteUID"];
  v10 = [v3 valueForKey:@"RouteType"];
  v11 = [v3 valueForKey:@"RouteName"];
  if ((![v8 isEqual:@"BluetoothLEOutput"]
     || [v11 isEqualToString:@"Bluetooth Audio"])
    && ![*(id *)(a1 + 40) isRouteUIDHearingAidPeripheralUUID:v9 inPeripheralUUIDs:*(void *)(a1 + 48)])
  {
    if (([v9 isEqual:@"Speaker"] & 1) != 0
      || [v8 isEqual:@"Speaker"])
    {
      v13 = *(void **)(a1 + 32);
      v14 = @"AXSHARouteSpeaker";
    }
    else if ((([v8 hasPrefix:@"Headset"] & 1) != 0 {
            || ([v8 hasPrefix:@"Headphone"] & 1) != 0
    }
            || [v8 hasPrefix:@"CarAudioOutput"])
           && ([*(id *)(a1 + 32) valueForKey:@"AXSHARouteHeadset"],
               v15 = objc_claimAutoreleasedReturnValue(),
               v15,
               !v15))
    {
      v16 = [v3 valueForKey:@"IsPreferredExternalRoute"];
      int v17 = [v16 BOOLValue];

      v18 = [v3 valueForKey:@"PreferredExternalRouteDetails_IsActive"];
      int v19 = [v18 BOOLValue];

      if (v17 && !v19) {
        goto LABEL_16;
      }
      v13 = *(void **)(a1 + 32);
      v14 = @"AXSHARouteHeadset";
    }
    else
    {
      if (([v8 hasPrefix:@"AirTunes"] & v5) != 1) {
        goto LABEL_16;
      }
      v13 = *(void **)(a1 + 32);
      v14 = @"AXSHARouteAirTunes";
    }
    [v13 setObject:v3 forKey:v14];
    goto LABEL_16;
  }
  [*(id *)(a1 + 32) setObject:v3 forKey:@"AXSHARouteHearingAid"];
  v12 = HCLogHearingHandoff();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v3;
    _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "Detected HA route: %@", (uint8_t *)&v20, 0xCu);
  }

LABEL_16:
  if ([v10 isEqual:@"Default"]) {
    [*(id *)(a1 + 32) setObject:v3 forKey:@"AXSHARouteDefault"];
  }
  if (v8) {
    [*(id *)(a1 + 56) addObject:v8];
  }
}

void __58__HURoutesManager_fetchCurrentPickableAudioRoutesIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 valueForKey:*MEMORY[0x263F54430]];
  if ([v4 BOOLValue])
  {
    int v5 = [v3 valueForKey:*MEMORY[0x263F54440]];
    int v6 = [v5 BOOLValue];

    if (v6)
    {
      [*(id *)(a1 + 32) setObject:v3 forKey:@"AXSHARouteLiveListen"];
      v7 = *MEMORY[0x263F47290];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_INFO))
      {
        int v8 = 138412290;
        id v9 = v3;
        _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_INFO, "Found Live Listen route %@", (uint8_t *)&v8, 0xCu);
      }
    }
  }
  else
  {
  }
}

- (BOOL)oldRoutes:(id)a3 equalToNewRoutes:(id)a4
{
  id v9 = a3;
  id v10 = a4;
  v11 = [v9 valueForKey:@"AXSHARouteSpeaker"];
  if (!v11)
  {
    v4 = [v10 valueForKey:@"AXSHARouteSpeaker"];
    if (!v4)
    {
      char v37 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  int v5 = [v9 valueForKey:@"AXSHARouteSpeaker"];
  v7 = [v5 valueForKey:@"RouteUID"];
  v12 = [v10 valueForKey:@"AXSHARouteSpeaker"];
  int v6 = [v12 valueForKey:@"RouteUID"];
  char v37 = [v7 isEqualToString:v6];

  if (!v11) {
    goto LABEL_6;
  }
LABEL_7:

  v13 = [v9 valueForKey:@"AXSHARouteHeadset"];
  if (!v13)
  {
    int v5 = [v10 valueForKey:@"AXSHARouteHeadset"];
    if (!v5)
    {
      char v36 = 1;
LABEL_12:

      goto LABEL_13;
    }
  }
  int v6 = [v9 valueForKey:@"AXSHARouteHeadset"];
  v14 = [v6 valueForKey:@"RouteUID"];
  v15 = [v10 valueForKey:@"AXSHARouteHeadset"];
  v7 = [v15 valueForKey:@"RouteUID"];
  char v36 = [v14 isEqualToString:v7];

  if (!v13) {
    goto LABEL_12;
  }
LABEL_13:

  v16 = [v9 valueForKey:@"AXSHARouteDefault"];
  if (!v16)
  {
    int v6 = [v10 valueForKey:@"AXSHARouteDefault"];
    if (!v6)
    {
      char v20 = 1;
LABEL_18:

      goto LABEL_19;
    }
  }
  v7 = [v9 valueForKey:@"AXSHARouteDefault"];
  int v17 = [v7 valueForKey:@"RouteUID"];
  v18 = [v10 valueForKey:@"AXSHARouteDefault"];
  int v19 = [v18 valueForKey:@"RouteUID"];
  char v20 = [v17 isEqualToString:v19];

  if (!v16) {
    goto LABEL_18;
  }
LABEL_19:

  id v21 = [v9 valueForKey:@"AXSHARouteHearingAid"];
  if (!v21)
  {
    v7 = [v10 valueForKey:@"AXSHARouteHearingAid"];
    if (!v7)
    {
      char v26 = 1;
LABEL_24:

      goto LABEL_25;
    }
  }
  uint64_t v22 = [v9 valueForKey:@"AXSHARouteHearingAid"];
  v23 = [v22 valueForKey:@"RouteUID"];
  v24 = [v10 valueForKey:@"AXSHARouteHearingAid"];
  v25 = [v24 valueForKey:@"RouteUID"];
  char v26 = [v23 isEqualToString:v25];

  if (!v21) {
    goto LABEL_24;
  }
LABEL_25:

  v27 = [v9 valueForKey:@"AXSHARouteLiveListen"];
  if (v27
    || ([v10 valueForKey:@"AXSHARouteLiveListen"],
        (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v28 = [v9 valueForKey:@"AXSHARouteLiveListen"];
    v29 = [v10 valueForKey:@"AXSHARouteLiveListen"];
    char v30 = [v28 isEqualToDictionary:v29];

    if (v27) {
      goto LABEL_31;
    }
  }
  else
  {
    char v30 = 1;
  }

LABEL_31:
  uint64_t v31 = [v9 count];
  uint64_t v32 = [v10 count];
  char v33 = v37;
  if (v31 != v32) {
    char v33 = 0;
  }
  char v34 = v33 & v36 & v20 & v26 & v30;

  return v34;
}

- (BOOL)isRouteUIDHearingAidPeripheralUUID:(id)a3 inPeripheralUUIDs:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(v5, "containsString:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

void __48__HURoutesManager_pickableAudioRoutesDidChange___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) _copyPickableRoutes];
  [*(id *)(a1 + 32) clearAudioRoutes];
  char v3 = [*(id *)(a1 + 32) shouldUpdateClients];
  v4 = [*(id *)(a1 + 32) fetchCurrentPickableAudioRoutesIfNeeded];
  id v5 = HCLogHearingHandoff();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __48__HURoutesManager_pickableAudioRoutesDidChange___block_invoke_cold_1((uint64_t)v2, (uint64_t)v4, v5);
  }

  if ((v3 & 1) != 0 || ([*(id *)(a1 + 32) oldRoutes:v2 equalToNewRoutes:v4] & 1) == 0)
  {
    id v6 = HCLogHearingHandoff();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_20CC86000, v6, OS_LOG_TYPE_DEFAULT, "Posting pickableAudioRoutesDidChange notification", v8, 2u);
    }

    uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"com.apple.accessibility.hearingaid.audio.route.changed" object:0];

    [*(id *)(a1 + 32) setShouldUpdateClients:0];
  }
}

- (id)fetchCurrentPickableAudioRoutesIfNeeded
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = [(HURoutesManager *)self _copyPickableRoutes];
  if (!v3)
  {
    v4 = [(HURoutesManager *)self subscribeTimer];
    char v5 = [v4 isPending];

    if (v5)
    {
      id v3 = 0;
    }
    else
    {
      id v6 = [(HURoutesManager *)self fetchHearingAidsPeripheralUUIDs];
      uint64_t v7 = [MEMORY[0x263EFF980] array];
      uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
      id v9 = +[HUUtilities sharedUtilities];
      char v10 = [v9 wirelessSplitterEnabled];

      if ((v10 & 1) == 0)
      {
        long long v11 = [MEMORY[0x263F544E0] sharedAVSystemController];
        long long v12 = [v11 pickableRoutesForCategory:*MEMORY[0x263EF9050] andMode:*MEMORY[0x263EF9118]];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __58__HURoutesManager_fetchCurrentPickableAudioRoutesIfNeeded__block_invoke;
        v26[3] = &unk_2640FEAB0;
        id v27 = v8;
        [v12 enumerateObjectsUsingBlock:v26];
      }
      long long v13 = (void *)MRMediaRemoteCopyPickableRoutes();
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __58__HURoutesManager_fetchCurrentPickableAudioRoutesIfNeeded__block_invoke_6;
      v21[3] = &unk_2640FEDD8;
      id v14 = v8;
      id v22 = v14;
      v23 = self;
      id v15 = v6;
      id v24 = v15;
      id v16 = v7;
      id v25 = v16;
      [v13 enumerateObjectsUsingBlock:v21];
      if ([v14 count])
      {
        [(HURoutesManager *)self setShouldUpdateClients:1];
        [(HURoutesManager *)self _savePickableRoutes:v14];
        id v3 = v14;
      }
      else
      {
        id v3 = 0;
      }
      int v17 = (void *)*MEMORY[0x263F47290];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_INFO))
      {
        v18 = v17;
        int v19 = [v16 componentsJoinedByString:@","];
        *(_DWORD *)buf = 138412290;
        v29 = v19;
        _os_log_impl(&dword_20CC86000, v18, OS_LOG_TYPE_INFO, "Routes %@", buf, 0xCu);
      }
    }
  }

  return v3;
}

- (id)_copyPickableRoutes
{
  uint64_t v4 = 0;
  char v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__8;
  uint64_t v8 = __Block_byref_object_dispose__8;
  id v9 = 0;
  AX_PERFORM_WITH_LOCK();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (AXDispatchTimer)subscribeTimer
{
  return self->_subscribeTimer;
}

- (id)fetchHearingAidsPeripheralUUIDs
{
  id v2 = +[HUHearingAidSettings sharedInstance];
  id v3 = [v2 peripheralUUIDs];

  return v3;
}

- (BOOL)shouldUpdateClients
{
  return self->_shouldUpdateClients;
}

- (void)setShouldUpdateClients:(BOOL)a3
{
  self->_shouldUpdateClients = a3;
}

- (void)clearAudioRoutes
{
}

- (void)_savePickableRoutes:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AX_PERFORM_WITH_LOCK();
}

- (void)pickableAudioRoutesDidChange:(id)a3
{
  routingQueue = self->_routingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__HURoutesManager_pickableAudioRoutesDidChange___block_invoke;
  block[3] = &unk_2640FC960;
  block[4] = self;
  dispatch_async(routingQueue, block);
}

- (id)currentPickableAudioRoutes
{
  return self->_pickableRoutes;
}

- (void)fetchCurrentPickableAudioRoutesIfNeededAsync:(id)a3
{
  id v4 = a3;
  char v5 = [(HURoutesManager *)self routingQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__HURoutesManager_fetchCurrentPickableAudioRoutesIfNeededAsync___block_invoke;
  v7[3] = &unk_2640FCC78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __64__HURoutesManager_fetchCurrentPickableAudioRoutesIfNeededAsync___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fetchCurrentPickableAudioRoutesIfNeeded];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    uint64_t v5 = v2;
    uint64_t v3 = (*(uint64_t (**)(void))(v3 + 16))();
    uint64_t v2 = v5;
  }

  return MEMORY[0x270F9A758](v3, v2);
}

- (HURoutesManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)HURoutesManager;
  uint64_t v2 = [(HURoutesManager *)&v9 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v4 = dispatch_queue_create("ha_routing_queue", v3);
    routingQueue = v2->_routingQueue;
    v2->_routingQueue = (OS_dispatch_queue *)v4;

    v2->_routingLock._os_unfair_lock_opaque = 0;
    uint64_t v6 = [objc_alloc(MEMORY[0x263F21398]) initWithTargetSerialQueue:v2->_routingQueue];
    subscribeTimer = v2->_subscribeTimer;
    v2->_subscribeTimer = (AXDispatchTimer *)v6;

    [(AXDispatchTimer *)v2->_subscribeTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    [(HURoutesManager *)v2 registerNotifications];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HURoutesManager;
  [(HURoutesManager *)&v4 dealloc];
}

- (void)mediaServerDied
{
  uint64_t v3 = [(HURoutesManager *)self subscribeTimer];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__HURoutesManager_mediaServerDied__block_invoke;
  v4[3] = &unk_2640FC960;
  v4[4] = self;
  [v3 afterDelay:v4 processBlock:2.0];
}

uint64_t __34__HURoutesManager_mediaServerDied__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  uint64_t v2 = [NSString stringWithFormat:@"Media server died. Register on media notifications."];
  uint64_t v3 = [NSString stringWithFormat:@"%s:%d %@", "-[HURoutesManager mediaServerDied]_block_invoke", 194, v2];
  objc_super v4 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v3;
    uint64_t v6 = v4;
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = [v5 UTF8String];
    _os_log_impl(&dword_20CC86000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  return [*(id *)(a1 + 32) registerNotifications];
}

- (void)registerNotifications
{
  v11[1] = *MEMORY[0x263EF8340];
  MRMediaRemoteSetWantsRouteChangeNotifications();
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_pickableAudioRoutesDidChange_ name:*MEMORY[0x263F54DE0] object:0];

  objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_pickableAudioRoutesDidChange_ name:*MEMORY[0x263F54E10] object:0];

  id v5 = [MEMORY[0x263F544E0] sharedAVSystemController];
  uint64_t v6 = (uint64_t *)MEMORY[0x263F54470];
  v11[0] = *MEMORY[0x263F54470];
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  [v5 setAttribute:v7 forKey:*MEMORY[0x263F544A0] error:0];

  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v9 = *v6;
  uint64_t v10 = [MEMORY[0x263F544E0] sharedAVSystemController];
  [v8 addObserver:self selector:sel_mediaServerDied name:v9 object:v10];
}

- (OS_dispatch_queue)routingQueue
{
  return self->_routingQueue;
}

- (void)setRoutingQueue:(id)a3
{
}

- (void)setSubscribeTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribeTimer, 0);
  objc_storeStrong((id *)&self->_routingQueue, 0);

  objc_storeStrong((id *)&self->_pickableRoutes, 0);
}

void __48__HURoutesManager_pickableAudioRoutesDidChange___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_20CC86000, log, OS_LOG_TYPE_DEBUG, "pickableAudioRoutesDidChange\nold: %@\nnew: %@", (uint8_t *)&v3, 0x16u);
}

@end