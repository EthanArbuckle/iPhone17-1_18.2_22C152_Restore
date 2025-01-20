@interface IRNearbyInteractionBridge
- (BOOL)isObserver;
- (BOOL)trackRegion;
- (BOOL)trackUpdates;
- (IRNearbyInteractionBridge)initWithDelegate:(id)a3 NIConfiguration:(id)a4 observer:(BOOL)a5 name:(id)a6;
- (IRProximityBridgeDelegateProtocol)delegate;
- (NIConfiguration)niConfiguration;
- (NISession)niSession;
- (NSNumber)binaryRegionThreshold;
- (NSString)name;
- (double)_nearbyObjectDistance:(id)a3;
- (void)_updateRegionToDelegate:(id)a3;
- (void)invalidate;
- (void)run;
- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4;
- (void)session:(id)a3 didInvalidateWithError:(id)a4;
- (void)session:(id)a3 didRemoveNearbyObjects:(id)a4 withReason:(int64_t)a5;
- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4;
- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6;
- (void)sessionDidStartRunning:(id)a3;
- (void)sessionSuspensionEnded:(id)a3;
- (void)sessionWasSuspended:(id)a3;
- (void)setBinaryRegionThreshold:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsObserver:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNiConfiguration:(id)a3;
- (void)setNiSession:(id)a3;
- (void)setTrackRegion:(BOOL)a3;
- (void)setTrackUpdates:(BOOL)a3;
@end

@implementation IRNearbyInteractionBridge

- (IRNearbyInteractionBridge)initWithDelegate:(id)a3 NIConfiguration:(id)a4 observer:(BOOL)a5 name:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)IRNearbyInteractionBridge;
  v13 = [(IRNearbyInteractionBridge *)&v17 init];
  v14 = v13;
  if (v13)
  {
    [(IRNearbyInteractionBridge *)v13 setName:v12];
    v15 = (void *)[v11 copy];
    [(IRNearbyInteractionBridge *)v14 setNiConfiguration:v15];

    [(IRNearbyInteractionBridge *)v14 setDelegate:v10];
    [(IRNearbyInteractionBridge *)v14 setIsObserver:v7];
  }

  return v14;
}

- (void)invalidate
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 24);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_25418E000, a2, OS_LOG_TYPE_DEBUG, "#nearby-interaction-bridge, Invalidate NI session: %@", (uint8_t *)&v3, 0xCu);
}

- (void)run
{
  int v3 = [(IRNearbyInteractionBridge *)self niSession];

  if (!v3)
  {
    if (self->_isObserver)
    {
      uint64_t v4 = [MEMORY[0x263F140C0] observerSession];
    }
    else
    {
      uint64_t v4 = objc_opt_new();
    }
    uint64_t v5 = (void *)v4;
    [(IRNearbyInteractionBridge *)self setNiSession:v4];

    v6 = [(IRNearbyInteractionBridge *)self niSession];
    [v6 setDelegate:self];
  }
  id v7 = [(IRNearbyInteractionBridge *)self niSession];
  [v7 runWithConfiguration:self->_niConfiguration];
}

- (void)sessionWasSuspended:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(IRNearbyInteractionBridge *)self delegate];
  uint64_t v5 = [(IRNearbyInteractionBridge *)self name];
  [v4 didBridgeSuspendStartedWithName:v5];

  v6 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    v8 = [(IRNearbyInteractionBridge *)self name];
    int v9 = 138412290;
    id v10 = v8;
    _os_log_impl(&dword_25418E000, v7, OS_LOG_TYPE_DEFAULT, "#nearby-interaction-bridge, [%@] sessionWasSuspended", (uint8_t *)&v9, 0xCu);
  }
}

- (void)sessionSuspensionEnded:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(IRNearbyInteractionBridge *)self delegate];
  uint64_t v5 = [(IRNearbyInteractionBridge *)self name];
  [v4 didBridgeSuspendEndedWithName:v5];

  v6 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    v8 = [(IRNearbyInteractionBridge *)self name];
    int v9 = 138412290;
    id v10 = v8;
    _os_log_impl(&dword_25418E000, v7, OS_LOG_TYPE_DEFAULT, "#nearby-interaction-bridge, [%@] sessionSuspensionEnded", (uint8_t *)&v9, 0xCu);
  }
}

- (void)sessionDidStartRunning:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    v6 = [(IRNearbyInteractionBridge *)self name];
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_25418E000, v5, OS_LOG_TYPE_DEFAULT, "#nearby-interaction-bridge, [%@] sessionDidStartRunning", (uint8_t *)&v9, 0xCu);
  }
  id v7 = [(IRNearbyInteractionBridge *)self delegate];
  v8 = [(IRNearbyInteractionBridge *)self name];
  [v7 didBridgeRunSuccesfully:v8];
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v6 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = a4;
    int v9 = [(IRNearbyInteractionBridge *)self name];
    id v10 = [v8 debugDescription];

    int v13 = 138412546;
    v14 = v9;
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_25418E000, v7, OS_LOG_TYPE_DEFAULT, "#nearby-interaction-bridge, [%@] session:didInvalidateWithError %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v11 = [(IRNearbyInteractionBridge *)self delegate];
  id v12 = [(IRNearbyInteractionBridge *)self name];
  [v11 didBridgeFail:v12];
}

- (double)_nearbyObjectDistance:(id)a3
{
  id v4 = a3;
  float v5 = *MEMORY[0x263F14078];
  [v4 distance];
  if (v5 == v6 || ([v4 distance], v7 < 0.0))
  {
    double v8 = 1000.0;
  }
  else
  {
    id v10 = [(IRNearbyInteractionBridge *)self binaryRegionThreshold];

    [v4 distance];
    double v8 = v11;
    if (v10)
    {
      id v12 = [(IRNearbyInteractionBridge *)self binaryRegionThreshold];
      [v12 doubleValue];
      int v13 = (double *)&kProximityProviderDistanceFar;
      if (v14 >= v8) {
        int v13 = (double *)&kProximityProviderDistanceNear;
      }
      double v8 = *v13;
    }
  }

  return v8;
}

- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a4;
  float v6 = [IRNearbyDeviceDO alloc];
  [(IRNearbyInteractionBridge *)self _nearbyObjectDistance:v5];
  double v8 = v7;
  int v9 = [v5 deviceIdentifer];
  id v10 = [(IRNearbyInteractionBridge *)self name];
  float v11 = [MEMORY[0x263EFF910] now];
  id v12 = [(IRNearbyDeviceDO *)v6 initWithRange:v9 idsIdentifier:0 mediaRemoteIdentifier:v10 proximityType:v11 measurementDate:v8];

  [(IRNearbyInteractionBridge *)self _updateRegionToDelegate:v12];
  int v13 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG))
  {
    double v14 = v13;
    __int16 v15 = [(IRNearbyInteractionBridge *)self name];
    v16 = [v5 deviceIdentifier];
    int v17 = 138412802;
    v18 = v15;
    __int16 v19 = 2112;
    v20 = v12;
    __int16 v21 = 2112;
    v22 = v16;
    _os_log_debug_impl(&dword_25418E000, v14, OS_LOG_TYPE_DEBUG, "#nearby-interaction-bridge, [%@] session:didDiscoverNearbyObject: %@, %@", (uint8_t *)&v17, 0x20u);
  }
}

- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([(IRNearbyInteractionBridge *)self trackRegion])
  {
    id v12 = [IRNearbyDeviceDO alloc];
    [(IRNearbyInteractionBridge *)self _nearbyObjectDistance:v9];
    double v14 = v13;
    __int16 v15 = [v9 deviceIdentifer];
    v16 = [(IRNearbyInteractionBridge *)self name];
    int v17 = [MEMORY[0x263EFF910] now];
    v18 = [(IRNearbyDeviceDO *)v12 initWithRange:v15 idsIdentifier:0 mediaRemoteIdentifier:v16 proximityType:v17 measurementDate:v14];

    [(IRNearbyInteractionBridge *)self _updateRegionToDelegate:v18];
    __int16 v19 = (void *)*MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      __int16 v21 = [(IRNearbyInteractionBridge *)self name];
      v22 = [v9 deviceIdentifier];
      int v23 = 138413314;
      v24 = v21;
      __int16 v25 = 2112;
      id v26 = v10;
      __int16 v27 = 2112;
      id v28 = v11;
      __int16 v29 = 2112;
      id v30 = v9;
      __int16 v31 = 2112;
      v32 = v22;
      _os_log_impl(&dword_25418E000, v20, OS_LOG_TYPE_DEFAULT, "#nearby-interaction-bridge, [%@] didUpdateRegion to %@ from %@ for %@ with deviceIdentifier: %@", (uint8_t *)&v23, 0x34u);
    }
  }
}

- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4
{
  id v5 = a4;
  if ([(IRNearbyInteractionBridge *)self trackUpdates])
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __60__IRNearbyInteractionBridge_session_didUpdateNearbyObjects___block_invoke;
    v6[3] = &unk_2653A1020;
    v6[4] = self;
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

void __60__IRNearbyInteractionBridge_session_didUpdateNearbyObjects___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [IRNearbyDeviceDO alloc];
  [*(id *)(a1 + 32) _nearbyObjectDistance:v3];
  double v6 = v5;
  double v7 = [v3 deviceIdentifer];
  double v8 = [*(id *)(a1 + 32) name];
  id v9 = [MEMORY[0x263EFF910] now];
  id v10 = [(IRNearbyDeviceDO *)v4 initWithRange:v7 idsIdentifier:0 mediaRemoteIdentifier:v8 proximityType:v9 measurementDate:v6];

  id v11 = [*(id *)(a1 + 32) delegate];
  id v12 = [*(id *)(a1 + 32) name];
  [v11 didUpdateNearbyDevice:v10 withName:v12];

  double v13 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG))
  {
    double v14 = *(void **)(a1 + 32);
    __int16 v15 = v13;
    v16 = [v14 name];
    int v17 = NSNumber;
    [(IRNearbyDeviceDO *)v10 range];
    v18 = objc_msgSend(v17, "numberWithDouble:");
    int v19 = 138412802;
    v20 = v16;
    __int16 v21 = 2112;
    id v22 = v3;
    __int16 v23 = 2112;
    v24 = v18;
    _os_log_debug_impl(&dword_25418E000, v15, OS_LOG_TYPE_DEBUG, "#nearby-interaction-bridge, [%@] didUpdateNearbyObject to %@ , distance = %@", (uint8_t *)&v19, 0x20u);
  }
}

- (void)session:(id)a3 didRemoveNearbyObjects:(id)a4 withReason:(int64_t)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __71__IRNearbyInteractionBridge_session_didRemoveNearbyObjects_withReason___block_invoke;
  v5[3] = &unk_2653A1020;
  v5[4] = self;
  [a4 enumerateObjectsUsingBlock:v5];
}

void __71__IRNearbyInteractionBridge_session_didRemoveNearbyObjects_withReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [IRNearbyDeviceDO alloc];
  double v5 = [v3 deviceIdentifer];
  double v6 = [*(id *)(a1 + 32) name];
  double v7 = [MEMORY[0x263EFF910] now];
  double v8 = [(IRNearbyDeviceDO *)v4 initWithRange:v5 idsIdentifier:0 mediaRemoteIdentifier:v6 proximityType:v7 measurementDate:1000.0];

  id v9 = [*(id *)(a1 + 32) delegate];
  id v10 = [*(id *)(a1 + 32) name];
  [v9 didRemoveDevice:v8 withName:v10];

  id v11 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = *(void **)(a1 + 32);
    double v13 = v11;
    double v14 = [v12 name];
    __int16 v15 = NSNumber;
    [(IRNearbyDeviceDO *)v8 range];
    v16 = objc_msgSend(v15, "numberWithDouble:");
    int v17 = 138412802;
    v18 = v14;
    __int16 v19 = 2112;
    id v20 = v3;
    __int16 v21 = 2112;
    id v22 = v16;
    _os_log_impl(&dword_25418E000, v13, OS_LOG_TYPE_DEFAULT, "#nearby-interaction-bridge, [%@] didRemoveDevice to %@ , distance = %@", (uint8_t *)&v17, 0x20u);
  }
}

- (void)_updateRegionToDelegate:(id)a3
{
  id v12 = a3;
  id v4 = [(IRNearbyInteractionBridge *)self delegate];
  if (v4)
  {
    [v12 range];
    double v6 = v5;
    double v7 = +[IRPreferences shared];
    double v8 = [v7 nearbyDeviceRegionThreshold];
    [v8 doubleValue];
    double v10 = v9;

    id v11 = [(IRNearbyInteractionBridge *)self name];
    if (v6 >= v10) {
      [v4 didRemoveDevice:v12 withName:v11];
    }
    else {
      [v4 didUpdateNearbyDevice:v12 withName:v11];
    }
  }
}

- (NIConfiguration)niConfiguration
{
  return self->_niConfiguration;
}

- (void)setNiConfiguration:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (IRProximityBridgeDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IRProximityBridgeDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isObserver
{
  return self->_isObserver;
}

- (void)setIsObserver:(BOOL)a3
{
  self->_isObserver = a3;
}

- (NSNumber)binaryRegionThreshold
{
  return self->_binaryRegionThreshold;
}

- (void)setBinaryRegionThreshold:(id)a3
{
}

- (BOOL)trackRegion
{
  return self->_trackRegion;
}

- (void)setTrackRegion:(BOOL)a3
{
  self->_trackRegion = a3;
}

- (BOOL)trackUpdates
{
  return self->_trackUpdates;
}

- (void)setTrackUpdates:(BOOL)a3
{
  self->_trackUpdates = a3;
}

- (NISession)niSession
{
  return self->_niSession;
}

- (void)setNiSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_niSession, 0);
  objc_storeStrong((id *)&self->_binaryRegionThreshold, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_niConfiguration, 0);
}

@end