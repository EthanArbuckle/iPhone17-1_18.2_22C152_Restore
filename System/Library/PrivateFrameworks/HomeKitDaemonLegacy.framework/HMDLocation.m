@interface HMDLocation
+ (BOOL)isAccurateLocation:(id)a3;
+ (HMDLocation)sharedManager;
+ (NSBundle)bundleForLocationManager;
+ (id)_getAlmanacWithLocation:(id)a3;
+ (id)_getAlmanacWithLocation:(id)a3 date:(id)a4;
+ (id)findEvent:(id)a3 withGeo:(id)a4;
+ (id)logCategory;
+ (id)nextSunriseTimeForLocation:(id)a3 date:(id)a4;
+ (id)nextSunsetTimeForLocation:(id)a3 date:(id)a4;
+ (id)sunriseTimeForLocation:(id)a3;
+ (id)sunsetTimeForLocation:(id)a3;
+ (void)timeZoneISOCountryCodeForCLLocationAsync:(id)a3 withCompletion:(id)a4;
- (BOOL)_canLocationBeExtracted;
- (BOOL)beingConfigured;
- (BOOL)isCarPlayConnected;
- (BOOL)isCurrentLocationSimulated;
- (CARSessionStatus)carPlaySessionStatus;
- (HMDCLLocationManager)locationManager;
- (HMDLocation)init;
- (HMDLocation)initWithLocationManager:(id)a3 handlerQueue:(id)a4;
- (NSDate)lastCarPlaySessionDisconnectionTimeStamp;
- (NSHashTable)singleLocationDelegates;
- (NSMapTable)pendingRegionCallbacks;
- (NSMapTable)pendingRegionMonitoringRequests;
- (NSMapTable)regionStateDelegatesByRegionIdentifier;
- (NSMapTable)regionStates;
- (OS_dispatch_queue)handlerQueue;
- (id)_delegateforRegion:(id)a3;
- (id)getCurrentLocation;
- (int)authStatus;
- (int64_t)locationAuthorized;
- (int64_t)totalLocationObservingClients;
- (void)_extractSingleLocationForDelegate:(id)a3;
- (void)_handleDeterminedState:(int64_t)a3 forRegion:(id)a4;
- (void)_notifySingleLocationDelegate:(id)a3 withLocation:(id)a4;
- (void)_notifySingleLocationDelegatesWithLocation:(id)a3;
- (void)_updateEntryForRegion:(id)a3;
- (void)_updateExitForRegion:(id)a3;
- (void)_updateRegionState:(int64_t)a3 forRegion:(id)a4;
- (void)_updateWithLocationAuthorizationStatus:(int)a3;
- (void)beingConfigured:(BOOL)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)deregisterForRegionUpdate:(id)a3 completionHandler:(id)a4;
- (void)getCoreRoutineLOIForCurrentLocationWithCompletionHandler:(id)a3;
- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5;
- (void)locationManager:(id)a3 didEnterRegion:(id)a4;
- (void)locationManager:(id)a3 didExitRegion:(id)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)registerForRegionUpdate:(id)a3 withDelegate:(id)a4 completionHandler:(id)a5;
- (void)requestMicroLocationLocalizationScanWithMetadata:(id)a3;
- (void)requestMicroLocationRecordingScanWithMetadata:(id)a3;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setAuthStatus:(int)a3;
- (void)setBeingConfigured:(BOOL)a3;
- (void)setCarPlayConnected:(BOOL)a3;
- (void)setCarPlaySessionStatus:(id)a3;
- (void)setLastCarPlaySessionDisconnectionTimeStamp:(id)a3;
- (void)setLocationAuthorized:(int64_t)a3;
- (void)setTotalLocationObservingClients:(int64_t)a3;
- (void)startExtractingSingleLocationForDelegate:(id)a3;
- (void)startUpdatingLocation;
- (void)stopUpdatingLocation;
@end

@implementation HMDLocation

+ (NSBundle)bundleForLocationManager
{
  return (NSBundle *)[MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/LocationBundles/HomeKitDaemon.framework"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCarPlaySessionDisconnectionTimeStamp, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_carPlaySessionStatus, 0);
  objc_storeStrong((id *)&self->_regionStates, 0);
  objc_storeStrong((id *)&self->_pendingRegionCallbacks, 0);
  objc_storeStrong((id *)&self->_pendingRegionMonitoringRequests, 0);
  objc_storeStrong((id *)&self->_regionStateDelegatesByRegionIdentifier, 0);
  objc_storeStrong((id *)&self->_singleLocationDelegates, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
}

- (void)setLastCarPlaySessionDisconnectionTimeStamp:(id)a3
{
}

- (NSDate)lastCarPlaySessionDisconnectionTimeStamp
{
  return self->_lastCarPlaySessionDisconnectionTimeStamp;
}

- (void)setCarPlayConnected:(BOOL)a3
{
  self->_carPlayConnected = a3;
}

- (BOOL)isCarPlayConnected
{
  return self->_carPlayConnected;
}

- (HMDCLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setCarPlaySessionStatus:(id)a3
{
}

- (CARSessionStatus)carPlaySessionStatus
{
  return self->_carPlaySessionStatus;
}

- (void)setTotalLocationObservingClients:(int64_t)a3
{
  self->_totalLocationObservingClients = a3;
}

- (int64_t)totalLocationObservingClients
{
  return self->_totalLocationObservingClients;
}

- (void)setBeingConfigured:(BOOL)a3
{
  self->_beingConfigured = a3;
}

- (BOOL)beingConfigured
{
  return self->_beingConfigured;
}

- (NSMapTable)regionStates
{
  return self->_regionStates;
}

- (NSMapTable)pendingRegionCallbacks
{
  return self->_pendingRegionCallbacks;
}

- (NSMapTable)pendingRegionMonitoringRequests
{
  return self->_pendingRegionMonitoringRequests;
}

- (NSMapTable)regionStateDelegatesByRegionIdentifier
{
  return self->_regionStateDelegatesByRegionIdentifier;
}

- (NSHashTable)singleLocationDelegates
{
  return self->_singleLocationDelegates;
}

- (void)setAuthStatus:(int)a3
{
  self->_authStatus = a3;
}

- (int)authStatus
{
  return self->_authStatus;
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (void)setLocationAuthorized:(int64_t)a3
{
  self->_locationAuthorized = a3;
}

- (int64_t)locationAuthorized
{
  return self->_locationAuthorized;
}

- (void)sessionDidDisconnect:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_carPlayConnected = 0;
  v5 = [MEMORY[0x1E4F1C9C8] now];
  lastCarPlaySessionDisconnectionTimeStamp = self->_lastCarPlaySessionDisconnectionTimeStamp;
  self->_lastCarPlaySessionDisconnectionTimeStamp = v5;

  v7 = (void *)MEMORY[0x1D9452090]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    int v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@CarPlay session disconnected", (uint8_t *)&v11, 0xCu);
  }
}

- (void)sessionDidConnect:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_carPlayConnected = 1;
  lastCarPlaySessionDisconnectionTimeStamp = self->_lastCarPlaySessionDisconnectionTimeStamp;
  self->_lastCarPlaySessionDisconnectionTimeStamp = 0;

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    int v11 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@New CarPlay session connected", (uint8_t *)&v10, 0xCu);
  }
}

- (void)requestMicroLocationLocalizationScanWithMetadata:(id)a3
{
}

- (void)requestMicroLocationRecordingScanWithMetadata:(id)a3
{
}

- (void)getCoreRoutineLOIForCurrentLocationWithCompletionHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  v5 = (void (**)(void, void, void, void))v4;
  v6 = [(HMDLocation *)self locationManager];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  v9 = (void *)MEMORY[0x1D9452090]();
  int v10 = self;
  int v11 = HMFGetOSLogHandle();
  uint64_t v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v19 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Asking Core Routine for LOI at current location", buf, 0xCu);
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __72__HMDLocation_getCoreRoutineLOIForCurrentLocationWithCompletionHandler___block_invoke;
    v16[3] = &unk_1E6A187D0;
    v16[4] = v10;
    v17 = v5;
    [v8 _fetchPlaceInferencesWithFidelityPolicy:5 handler:v16];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v19 = v14;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@looks like we do not have valid location manager instance.", buf, 0xCu);
    }
    v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    ((void (**)(void, void, void, void *))v5)[2](v5, 0, 0, v15);
  }
}

void __72__HMDLocation_getCoreRoutineLOIForCurrentLocationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    id v8 = [v5 firstObject];
    v9 = [v8 referenceLocation];

    if (v9)
    {
      if (+[HMDLocation isAccurateLocation:v9])
      {
        int v10 = [v5 firstObject];
        int v11 = [v10 _loiIdentifier];

        if (!v11)
        {
          uint64_t v13 = (void *)MEMORY[0x1D9452090]();
          id v14 = *(id *)(a1 + 32);
          v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            v16 = HMFGetLogIdentifier();
            int v37 = 138543362;
            v38 = v16;
            _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@LOI Identifier is nil. Returning fallback location.", (uint8_t *)&v37, 0xCu);
          }
          uint64_t v12 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
        }
        v17 = (void *)MEMORY[0x1D9452090](v12);
        id v18 = *(id *)(a1 + 32);
        v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = HMFGetLogIdentifier();
          int v37 = 138543618;
          v38 = v20;
          __int16 v39 = 2112;
          v40 = v9;
          _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@CR LOI Location : %@", (uint8_t *)&v37, 0x16u);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_22;
      }
      v32 = (void *)MEMORY[0x1D9452090]();
      id v33 = *(id *)(a1 + 32);
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = HMFGetLogIdentifier();
        int v37 = 138543618;
        v38 = v35;
        __int16 v39 = 2112;
        v40 = v9;
        _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Not using CR location with low accuracy : %@", (uint8_t *)&v37, 0x16u);
      }
      uint64_t v29 = *(void *)(a1 + 40);
      v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = 2;
    }
    else
    {
      v25 = (void *)MEMORY[0x1D9452090]();
      id v26 = *(id *)(a1 + 32);
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = HMFGetLogIdentifier();
        int v37 = 138543362;
        v38 = v28;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Reference location is nil.", (uint8_t *)&v37, 0xCu);
      }
      uint64_t v29 = *(void *)(a1 + 40);
      v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = 20;
    }
    v36 = [v30 hmErrorWithCode:v31];
    (*(void (**)(uint64_t, void, void, void *))(v29 + 16))(v29, 0, 0, v36);

LABEL_22:
    goto LABEL_23;
  }
  v21 = (void *)MEMORY[0x1D9452090]();
  id v22 = *(id *)(a1 + 32);
  v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = HMFGetLogIdentifier();
    int v37 = 138543618;
    v38 = v24;
    __int16 v39 = 2112;
    v40 = v7;
    _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Got an error or place inferences are nil while fetching location of interest. %@", (uint8_t *)&v37, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_23:
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDLocation *)self handlerQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__HMDLocation_locationManager_didStartMonitoringForRegion___block_invoke;
  v8[3] = &unk_1E6A197C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __59__HMDLocation_locationManager_didStartMonitoringForRegion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = regionAsString(*(void **)(a1 + 40));
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    int v11 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@did start monitoring for region: %@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [*(id *)(a1 + 32) locationManager];
  [v7 requestStateForRegion:*(void *)(a1 + 40)];
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  __int16 v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    uint64_t v12 = regionAsString(v7);
    int v13 = 138543618;
    id v14 = v11;
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@LocationManager did exit the region %@", (uint8_t *)&v13, 0x16u);
  }
  [(HMDLocation *)v9 _handleDeterminedState:2 forRegion:v7];
}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  __int16 v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    uint64_t v12 = regionAsString(v7);
    int v13 = 138543618;
    id v14 = v11;
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@LocationManager did enter the region %@", (uint8_t *)&v13, 0x16u);
  }
  [(HMDLocation *)v9 _handleDeterminedState:1 forRegion:v7];
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = (void *)MEMORY[0x1D9452090]();
  int v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    id v14 = HMCLRegionStateAsString();
    [v9 radius];
    int v16 = 138543874;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    v19 = v14;
    __int16 v20 = 2048;
    uint64_t v21 = v15;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@LocationManager did determine region state: %@, radius : %f", (uint8_t *)&v16, 0x20u);
  }
  [(HMDLocation *)v11 _handleDeterminedState:a4 forRegion:v9];
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 authorizationStatus];
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    __int16 v10 = HMCLAuthorizationStatusAsString();
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received updated authorization status %@ for location", buf, 0x16u);
  }
  int v11 = [(HMDLocation *)v7 handlerQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__HMDLocation_locationManagerDidChangeAuthorization___block_invoke;
  v12[3] = &unk_1E6A18370;
  v12[4] = v7;
  int v13 = v5;
  dispatch_async(v11, v12);
}

void __53__HMDLocation_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) authStatus];
  [*(id *)(a1 + 32) setAuthStatus:*(unsigned int *)(a1 + 40)];
  if ((objc_msgSend(MEMORY[0x1E4F1E600], "hm_isLocationAllowedForAuthorizationStatus:", *(unsigned int *)(a1 + 40)) & 1) == 0) {
    [*(id *)(a1 + 32) _notifySingleLocationDelegatesWithLocation:0];
  }
  uint64_t v3 = [*(id *)(a1 + 32) _updateWithLocationAuthorizationStatus:*(unsigned int *)(a1 + 40)];
  if (!v2)
  {
    id v4 = (void *)MEMORY[0x1D9452090](v3);
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = HMCLAuthorizationStatusAsString();
      [*(id *)(a1 + 32) locationAuthorized];
      id v9 = HMDLocationAuthorizationAsString();
      int v10 = 138543874;
      int v11 = v7;
      __int16 v12 = 2112;
      int v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Initial location auth status for homed: %@, %@", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Received error for the location update: %@", buf, 0x16u);
  }
  __int16 v12 = [(HMDLocation *)v9 handlerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HMDLocation_locationManager_didFailWithError___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = v9;
  dispatch_async(v12, block);
}

uint64_t __48__HMDLocation_locationManager_didFailWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifySingleLocationDelegatesWithLocation:0];
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Location manager updated locations: %@", buf, 0x16u);
  }
  __int16 v12 = [(HMDLocation *)v9 handlerQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__HMDLocation_locationManager_didUpdateLocations___block_invoke;
  v14[3] = &unk_1E6A197C8;
  id v15 = v7;
  __int16 v16 = v9;
  id v13 = v7;
  dispatch_async(v12, v14);
}

void __50__HMDLocation_locationManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) lastObject];
  if (v2 && +[HMDLocation isAccurateLocation:v2])
  {
    uint64_t v3 = *(void **)(a1 + 40);
    id v4 = v2;
  }
  else
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 40);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = 138543618;
      int v10 = v8;
      __int16 v11 = 2112;
      __int16 v12 = v2;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Ignoring inaccurate single location: %@", (uint8_t *)&v9, 0x16u);
    }
    uint64_t v3 = *(void **)(a1 + 40);
    id v4 = 0;
  }
  [v3 _notifySingleLocationDelegatesWithLocation:v4];
}

- (void)_handleDeterminedState:(int64_t)a3 forRegion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1E600], "hm_hmdRegionStateFromCLRegionState:", a3);
  id v8 = (void *)MEMORY[0x1D9452090]();
  int v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = HMFGetLogIdentifier();
    __int16 v12 = HMDRegionStateString();
    uint64_t v13 = [v6 identifier];
    __int16 v14 = regionAsString(v6);
    *(_DWORD *)buf = 138544130;
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    v23 = v12;
    __int16 v24 = 2112;
    v25 = v13;
    __int16 v26 = 2112;
    v27 = v14;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Region state is %@ for region %@ %@", buf, 0x2Au);
  }
  if (v7)
  {
    id v15 = [(HMDLocation *)v9 handlerQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __48__HMDLocation__handleDeterminedState_forRegion___block_invoke;
    v16[3] = &unk_1E6A15460;
    v16[4] = v9;
    id v17 = v6;
    uint64_t v18 = v7;
    int64_t v19 = a3;
    dispatch_async(v15, v16);
  }
}

void __48__HMDLocation__handleDeterminedState_forRegion___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) regionStates];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = [v3 unsignedIntegerValue];
    uint64_t v5 = *(void *)(a1 + 48);
    if (v4 != v5)
    {
      if (v4)
      {
        id v6 = (void *)MEMORY[0x1D9452090]();
        id v7 = *(id *)(a1 + 32);
        id v8 = HMFGetOSLogHandle();
        BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
        if (v5 == 2)
        {
          if (v9)
          {
            int v10 = HMFGetLogIdentifier();
            __int16 v11 = [*(id *)(a1 + 40) identifier];
            __int16 v12 = regionAsString(*(void **)(a1 + 40));
            int v29 = 138543874;
            v30 = v10;
            __int16 v31 = 2112;
            v32 = v11;
            __int16 v33 = 2112;
            v34 = v12;
            _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received exit for region %@ %@", (uint8_t *)&v29, 0x20u);
          }
          uint64_t v4 = [*(id *)(a1 + 32) _updateExitForRegion:*(void *)(a1 + 40)];
        }
        else
        {
          if (v9)
          {
            int64_t v19 = HMFGetLogIdentifier();
            id v20 = [*(id *)(a1 + 40) identifier];
            uint64_t v21 = regionAsString(*(void **)(a1 + 40));
            int v29 = 138543874;
            v30 = v19;
            __int16 v31 = 2112;
            v32 = v20;
            __int16 v33 = 2112;
            v34 = v21;
            _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received entry for region %@ %@", (uint8_t *)&v29, 0x20u);
          }
          uint64_t v4 = [*(id *)(a1 + 32) _updateEntryForRegion:*(void *)(a1 + 40)];
        }
      }
      goto LABEL_15;
    }
  }
  else if (*(void *)(a1 + 48))
  {
LABEL_15:
    __int16 v22 = (void *)MEMORY[0x1D9452090](v4);
    id v23 = *(id *)(a1 + 32);
    __int16 v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = HMFGetLogIdentifier();
      __int16 v26 = HMDRegionStateString();
      v27 = HMDRegionStateString();
      uint64_t v28 = [*(id *)(a1 + 40) identifier];
      int v29 = 138544130;
      v30 = v25;
      __int16 v31 = 2114;
      v32 = v26;
      __int16 v33 = 2114;
      v34 = v27;
      __int16 v35 = 2114;
      v36 = v28;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Updating region state from %{public}@ to %{public}@ %{public}@", (uint8_t *)&v29, 0x2Au);
    }
    [*(id *)(a1 + 32) _updateRegionState:*(void *)(a1 + 56) forRegion:*(void *)(a1 + 40)];
    goto LABEL_18;
  }
  uint64_t v13 = (void *)MEMORY[0x1D9452090]();
  id v14 = *(id *)(a1 + 32);
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    __int16 v16 = HMFGetLogIdentifier();
    id v17 = HMDRegionStateString();
    uint64_t v18 = [*(id *)(a1 + 40) identifier];
    int v29 = 138543874;
    v30 = v16;
    __int16 v31 = 2112;
    v32 = v17;
    __int16 v33 = 2112;
    v34 = v18;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Ignoring because region state did not change %@ %@", (uint8_t *)&v29, 0x20u);
  }
LABEL_18:
}

- (void)beingConfigured:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(HMDLocation *)self handlerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HMDLocation_beingConfigured_completionHandler___block_invoke;
  block[3] = &unk_1E6A113D0;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __49__HMDLocation_beingConfigured_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  int v2 = (void *)MEMORY[0x1D9452090]();
  uint64_t v85 = a1;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    id v6 = HMFBooleanToString();
    *(_DWORD *)buf = 138543618;
    v100 = v5;
    __int16 v101 = 2112;
    v102 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Being configured is changing to %@", buf, 0x16u);
  }
  int v7 = [*(id *)(a1 + 32) beingConfigured];
  int v8 = *(unsigned __int8 *)(a1 + 48);
  if (v8 == v7)
  {
    BOOL v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = *(id *)(a1 + 32);
    BOOL v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      __int16 v12 = HMFGetLogIdentifier();
      [*(id *)(a1 + 32) beingConfigured];
      uint64_t v13 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      v100 = v12;
      __int16 v101 = 2112;
      v102 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Being configured is not changing from %@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  uint64_t v14 = [*(id *)(a1 + 32) setBeingConfigured:v8 != 0];
  if (*(unsigned char *)(a1 + 48))
  {
LABEL_8:
    uint64_t v15 = *(void *)(a1 + 40);
    if (v15) {
      (*(void (**)(void))(v15 + 16))();
    }
    return;
  }
  __int16 v16 = (void *)MEMORY[0x1D9452090](v14);
  id v17 = *(id *)(a1 + 32);
  uint64_t v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    int64_t v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v100 = v19;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Being configured is changing to NO, submitting the pending monitor requests", buf, 0xCu);
  }
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  obuint64_t j = [*(id *)(a1 + 32) pendingRegionMonitoringRequests];
  uint64_t v20 = [obj countByEnumeratingWithState:&v94 objects:v106 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v95 != v22) {
          objc_enumerationMutation(obj);
        }
        __int16 v24 = *(void **)(*((void *)&v94 + 1) + 8 * i);
        v25 = [*(id *)(v85 + 32) pendingRegionMonitoringRequests];
        __int16 v26 = [v25 objectForKey:v24];

        if (v26)
        {
          v27 = [*(id *)(v85 + 32) regionStateDelegatesByRegionIdentifier];
          uint64_t v28 = [v24 identifier];
          [v27 setObject:v26 forKey:v28];

          int v29 = (void *)MEMORY[0x1D9452090]();
          id v30 = *(id *)(v85 + 32);
          __int16 v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v32 = HMFGetLogIdentifier();
            regionAsString(v24);
            uint64_t v33 = v21;
            __int16 v35 = v34 = v22;
            *(_DWORD *)buf = 138543618;
            v100 = v32;
            __int16 v101 = 2112;
            v102 = v35;
            _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@After configured, submitting start monitor request for region: %@", buf, 0x16u);

            uint64_t v22 = v34;
            uint64_t v21 = v33;
          }
          v36 = [*(id *)(v85 + 32) locationManager];
          [v36 startMonitoringForRegion:v24];
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v94 objects:v106 count:16];
    }
    while (v21);
  }

  uint64_t v37 = [*(id *)(v85 + 32) pendingRegionMonitoringRequests];
  [v37 removeAllObjects];

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id obja = [*(id *)(v85 + 32) pendingRegionCallbacks];
  uint64_t v38 = [obja countByEnumeratingWithState:&v90 objects:v105 count:16];
  if (v38)
  {
    uint64_t v40 = v38;
    uint64_t v41 = *(void *)v91;
    *(void *)&long long v39 = 138543874;
    long long v81 = v39;
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v91 != v41) {
          objc_enumerationMutation(obja);
        }
        v43 = *(void **)(*((void *)&v90 + 1) + 8 * j);
        v44 = objc_msgSend(*(id *)(v85 + 32), "pendingRegionCallbacks", v81);
        v45 = [v44 objectForKey:v43];

        uint64_t v46 = [v45 unsignedIntegerValue];
        if (v46)
        {
          if (v46 == 1)
          {
            v51 = (void *)MEMORY[0x1D9452090]();
            id v52 = *(id *)(v85 + 32);
            v53 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              v54 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v100 = v54;
              __int16 v101 = 2112;
              v102 = v43;
              _os_log_impl(&dword_1D49D5000, v53, OS_LOG_TYPE_INFO, "%{public}@Calling pending entry callback for region %@", buf, 0x16u);
            }
            [*(id *)(v85 + 32) _updateEntryForRegion:v43];
          }
          else if (v46 == 2)
          {
            v47 = (void *)MEMORY[0x1D9452090]();
            id v48 = *(id *)(v85 + 32);
            v49 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              v50 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v100 = v50;
              __int16 v101 = 2112;
              v102 = v43;
              _os_log_impl(&dword_1D49D5000, v49, OS_LOG_TYPE_INFO, "%{public}@Calling pending exit callback for region %@", buf, 0x16u);
            }
            [*(id *)(v85 + 32) _updateExitForRegion:v43];
          }
        }
        else
        {
          v55 = (void *)MEMORY[0x1D9452090]();
          id v56 = *(id *)(v85 + 32);
          v57 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            v58 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v81;
            v100 = v58;
            __int16 v101 = 2112;
            v102 = v45;
            __int16 v103 = 2112;
            v104 = v43;
            _os_log_impl(&dword_1D49D5000, v57, OS_LOG_TYPE_INFO, "%{public}@Unknown region state %@ for region %@", buf, 0x20u);
          }
        }
      }
      uint64_t v40 = [obja countByEnumeratingWithState:&v90 objects:v105 count:16];
    }
    while (v40);
  }

  v59 = [*(id *)(v85 + 32) pendingRegionCallbacks];
  [v59 removeAllObjects];

  v60 = [*(id *)(v85 + 32) locationManager];
  v61 = [v60 monitoredRegions];

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v62 = v61;
  uint64_t v63 = [v62 countByEnumeratingWithState:&v86 objects:v98 count:16];
  if (v63)
  {
    uint64_t v64 = v63;
    uint64_t v65 = *(void *)v87;
    do
    {
      uint64_t v66 = 0;
      id objb = (id)v64;
      do
      {
        if (*(void *)v87 != v65) {
          objc_enumerationMutation(v62);
        }
        v67 = *(void **)(*((void *)&v86 + 1) + 8 * v66);
        v68 = [*(id *)(v85 + 32) regionStateDelegatesByRegionIdentifier];
        v69 = [v67 identifier];
        v70 = [v68 objectForKey:v69];

        if (!v70)
        {
          v71 = (void *)MEMORY[0x1D9452090]();
          id v72 = *(id *)(v85 + 32);
          v73 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            v74 = HMFGetLogIdentifier();
            regionAsString(v67);
            uint64_t v75 = v65;
            v77 = id v76 = v62;
            *(_DWORD *)buf = 138543618;
            v100 = v74;
            __int16 v101 = 2112;
            v102 = v77;
            _os_log_impl(&dword_1D49D5000, v73, OS_LOG_TYPE_ERROR, "%{public}@Region %@ was not found in the region state monitor map, stopping monitoring", buf, 0x16u);

            id v62 = v76;
            uint64_t v65 = v75;
          }
          v78 = [*(id *)(v85 + 32) regionStates];
          [v78 removeObjectForKey:v67];

          v79 = [*(id *)(v85 + 32) locationManager];
          [v79 stopMonitoringForRegion:v67];

          uint64_t v64 = (uint64_t)objb;
        }

        ++v66;
      }
      while (v64 != v66);
      uint64_t v64 = [v62 countByEnumeratingWithState:&v86 objects:v98 count:16];
    }
    while (v64);
  }

  uint64_t v80 = *(void *)(v85 + 40);
  if (v80) {
    (*(void (**)(void))(v80 + 16))();
  }
}

- (void)_updateExitForRegion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDLocation *)self handlerQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDLocation *)self beingConfigured])
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    int v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = HMFGetLogIdentifier();
      id v10 = regionAsString(v4);
      int v16 = 138543618;
      id v17 = v9;
      __int16 v18 = 2112;
      int64_t v19 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@The system is being configured, pending the exit for region %@", (uint8_t *)&v16, 0x16u);
    }
    id v11 = [(HMDLocation *)v7 pendingRegionCallbacks];
    [v11 setObject:&unk_1F2DC8A58 forKey:v4];
  }
  else
  {
    id v11 = [(HMDLocation *)self _delegateforRegion:v4];
    if (v11)
    {
      if ([v4 notifyOnExit])
      {
        id v11 = v11;
        if (objc_opt_respondsToSelector()) {
          [v11 didExitRegion:v4];
        }
      }
      else
      {
        __int16 v12 = (void *)MEMORY[0x1D9452090]();
        uint64_t v13 = self;
        uint64_t v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          uint64_t v15 = HMFGetLogIdentifier();
          int v16 = 138543362;
          id v17 = v15;
          _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Not calling the didExitRegion delegate as this event was not subscribed for", (uint8_t *)&v16, 0xCu);
        }
      }
    }
  }
}

- (void)_updateEntryForRegion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDLocation *)self handlerQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDLocation *)self beingConfigured])
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    int v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = HMFGetLogIdentifier();
      id v10 = regionAsString(v4);
      int v16 = 138543618;
      id v17 = v9;
      __int16 v18 = 2112;
      int64_t v19 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@The system is being configured, pending the entry for region %@", (uint8_t *)&v16, 0x16u);
    }
    id v11 = [(HMDLocation *)v7 pendingRegionCallbacks];
    [v11 setObject:&unk_1F2DC8A40 forKey:v4];
  }
  else
  {
    id v11 = [(HMDLocation *)self _delegateforRegion:v4];
    if (v11)
    {
      if ([v4 notifyOnEntry])
      {
        id v11 = v11;
        if (objc_opt_respondsToSelector()) {
          [v11 didEnterRegion:v4];
        }
      }
      else
      {
        __int16 v12 = (void *)MEMORY[0x1D9452090]();
        uint64_t v13 = self;
        uint64_t v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          uint64_t v15 = HMFGetLogIdentifier();
          int v16 = 138543362;
          id v17 = v15;
          _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Not calling the didEnterRegion delegate as this event was not subscribed for", (uint8_t *)&v16, 0xCu);
        }
      }
    }
  }
}

- (void)_updateRegionState:(int64_t)a3 forRegion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = [(HMDLocation *)self handlerQueue];
  dispatch_assert_queue_V2(v7);

  if (![(HMDLocation *)self beingConfigured])
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1E600], "hm_hmdRegionStateFromCLRegionState:", a3);
    uint64_t v14 = [(HMDLocation *)self regionStates];
    uint64_t v15 = [NSNumber numberWithInteger:v13];
    [v14 setObject:v15 forKey:v6];

    int v16 = [(HMDLocation *)self _delegateforRegion:v6];
    if (!v16)
    {
LABEL_16:

      goto LABEL_17;
    }
    if (a3 == 2)
    {
      if (![v6 notifyOnExit])
      {
LABEL_9:
        id v17 = (void *)MEMORY[0x1D9452090]();
        __int16 v18 = self;
        int64_t v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = HMFGetLogIdentifier();
          int v22 = 138543362;
          id v23 = v20;
          _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Not calling the location delegate as this event was not subscribed for", (uint8_t *)&v22, 0xCu);
        }
        goto LABEL_16;
      }
    }
    else if (a3 != 1 || ([v6 notifyOnEntry] & 1) == 0)
    {
      goto LABEL_9;
    }
    id v21 = v16;
    if (objc_opt_respondsToSelector()) {
      [v21 didDetermineState:a3 forRegion:v6];
    }

    goto LABEL_16;
  }
  int v8 = (void *)MEMORY[0x1D9452090]();
  BOOL v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    __int16 v12 = regionAsString(v6);
    int v22 = 138543874;
    id v23 = v11;
    __int16 v24 = 2048;
    int64_t v25 = a3;
    __int16 v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@The system is being configured, not updating region state %tu for region %@", (uint8_t *)&v22, 0x20u);
  }
LABEL_17:
}

- (id)_delegateforRegion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDLocation *)self handlerQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDLocation *)self regionStateDelegatesByRegionIdentifier];
  int v7 = [v4 identifier];
  int v8 = [v6 objectForKey:v7];

  if (!v8)
  {
    BOOL v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = HMFGetLogIdentifier();
      uint64_t v13 = regionAsString(v4);
      int v17 = 138543618;
      __int16 v18 = v12;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Update received for a region %@ that was not found in the region state monitor map, stopping monitoring", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v14 = [(HMDLocation *)v10 regionStates];
    [v14 removeObjectForKey:v4];

    uint64_t v15 = [(HMDLocation *)v10 locationManager];
    [v15 stopMonitoringForRegion:v4];
  }
  return v8;
}

- (void)_updateWithLocationAuthorizationStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HMDLocation *)self handlerQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090](-[HMDLocation setLocationAuthorized:](self, "setLocationAuthorized:", objc_msgSend(MEMORY[0x1E4F1E600], "hm_hmdLocationAuthorizationFromCLAuthorizationStatus:", v3)));
  int v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = HMFGetLogIdentifier();
    [(HMDLocation *)v7 locationAuthorized];
    id v10 = HMDLocationAuthorizationAsString();
    *(_DWORD *)buf = 138543618;
    int v17 = v9;
    __int16 v18 = 2112;
    __int16 v19 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Location Authorization Status Updated : %@", buf, 0x16u);
  }
  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  __int16 v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDLocation locationAuthorized](v7, "locationAuthorized", @"HMDLocationAuthorizationKey"));
  uint64_t v15 = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  [v11 postNotificationName:@"HMDLocationAuthorizationChangedNotification" object:v7 userInfo:v13];
}

- (void)_notifySingleLocationDelegate:(id)a3 withLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDLocation *)self handlerQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = v6;
  if (objc_opt_respondsToSelector()) {
    [v9 didDetermineLocation:v7];
  }
}

- (void)_notifySingleLocationDelegatesWithLocation:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDLocation *)self handlerQueue];
  dispatch_assert_queue_V2(v5);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(HMDLocation *)self singleLocationDelegates];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [(HMDLocation *)self _notifySingleLocationDelegate:*(void *)(*((void *)&v12 + 1) + 8 * v10++) withLocation:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  id v11 = [(HMDLocation *)self singleLocationDelegates];
  [v11 removeAllObjects];
}

- (void)deregisterForRegionUpdate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDLocation *)self handlerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__HMDLocation_deregisterForRegionUpdate_completionHandler___block_invoke;
  block[3] = &unk_1E6A193D0;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __59__HMDLocation_deregisterForRegionUpdate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 48))
  {
    __int16 v31 = (void *)MEMORY[0x1D9452090]();
    id v32 = *(id *)(a1 + 32);
    uint64_t v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v44 = v34;
      _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Completion handler is invalid", buf, 0xCu);
    }
    id v35 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v35);
  }
  int v2 = *(void **)(a1 + 40);
  if (!v2)
  {
    __int16 v24 = (void *)MEMORY[0x1D9452090]();
    id v25 = *(id *)(a1 + 32);
    __int16 v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v44 = v27;
      uint64_t v28 = "%{public}@Monitored regions are nil";
LABEL_23:
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, v28, buf, 0xCu);
    }
LABEL_24:

    uint64_t v29 = *(void *)(a1 + 48);
    id v30 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:3 userInfo:0];
    (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v30);

    return;
  }
  if (![v2 count])
  {
    __int16 v24 = (void *)MEMORY[0x1D9452090]();
    id v25 = *(id *)(a1 + 32);
    __int16 v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v44 = v27;
      uint64_t v28 = "%{public}@Monitored regions are empty";
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v3 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v40;
    *(void *)&long long v4 = 138543618;
    long long v36 = v4;
    uint64_t v37 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v40 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v9 = objc_msgSend(*(id *)(a1 + 32), "regionStates", v36);
        [v9 removeObjectForKey:v8];

        id v10 = [*(id *)(a1 + 32) regionStateDelegatesByRegionIdentifier];
        id v11 = [v8 identifier];
        id v12 = [v10 objectForKey:v11];

        id v13 = (void *)MEMORY[0x1D9452090]();
        id v14 = *(id *)(a1 + 32);
        long long v15 = HMFGetOSLogHandle();
        int v16 = v15;
        if (v12)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            uint64_t v17 = HMFGetLogIdentifier();
            __int16 v18 = regionAsString(v8);
            *(_DWORD *)buf = v36;
            v44 = v17;
            __int16 v45 = 2112;
            uint64_t v46 = v18;
            _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Submitting stop monitor request for region: %@", buf, 0x16u);

            uint64_t v6 = v37;
          }

          __int16 v19 = [*(id *)(a1 + 32) locationManager];
          [v19 stopMonitoringForRegion:v8];

          uint64_t v20 = [*(id *)(a1 + 32) regionStateDelegatesByRegionIdentifier];
          uint64_t v21 = [v8 identifier];
          [v20 removeObjectForKey:v21];
        }
        else
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v22 = HMFGetLogIdentifier();
            id v23 = regionAsString(v8);
            *(_DWORD *)buf = v36;
            v44 = v22;
            __int16 v45 = 2112;
            uint64_t v46 = v23;
            _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Region %@ was not found in the region state monitor map, cannot deregister", buf, 0x16u);

            uint64_t v6 = v37;
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)registerForRegionUpdate:(id)a3 withDelegate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDLocation *)self handlerQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__HMDLocation_registerForRegionUpdate_withDelegate_completionHandler___block_invoke;
  v15[3] = &unk_1E6A18398;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, v15);
}

void __70__HMDLocation_registerForRegionUpdate_withDelegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 56))
  {
    uint64_t v48 = (void *)MEMORY[0x1D9452090]();
    id v49 = *(id *)(a1 + 32);
    v50 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v51 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v65 = v51;
      _os_log_impl(&dword_1D49D5000, v50, OS_LOG_TYPE_ERROR, "%{public}@Completion handler is invalid", buf, 0xCu);
    }
    id v52 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v52);
  }
  int v2 = *(void **)(a1 + 40);
  if (!v2)
  {
    id v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = *(id *)(a1 + 32);
    id v18 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    __int16 v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v65 = v19;
    uint64_t v20 = "%{public}@Monitored regions are nil";
LABEL_24:
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);

    goto LABEL_25;
  }
  if (![v2 count])
  {
    id v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = *(id *)(a1 + 32);
    id v18 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    __int16 v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v65 = v19;
    uint64_t v20 = "%{public}@Monitored regions are empty";
    goto LABEL_24;
  }
  if (!*(void *)(a1 + 48))
  {
    id v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = *(id *)(a1 + 32);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v65 = v19;
      uint64_t v20 = "%{public}@Delegate is nil";
      goto LABEL_24;
    }
LABEL_25:

    uint64_t v21 = *(void *)(a1 + 56);
    int v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F2D140];
    uint64_t v24 = 3;
LABEL_26:
    id v25 = [v22 errorWithDomain:v23 code:v24 userInfo:0];
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v25);

    return;
  }
  uint64_t v3 = [*(id *)(a1 + 32) locationManager];
  char v4 = [(id)objc_opt_class() locationServicesEnabled];

  if ((v4 & 1) == 0)
  {
    __int16 v26 = (void *)MEMORY[0x1D9452090]();
    id v27 = *(id *)(a1 + 32);
    uint64_t v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v65 = v29;
      id v30 = "%{public}@Location services are not enabled, cannot submit region monitoring";
      __int16 v31 = v28;
      os_log_type_t v32 = OS_LOG_TYPE_INFO;
LABEL_31:
      _os_log_impl(&dword_1D49D5000, v31, v32, v30, buf, 0xCu);
    }
LABEL_32:

    uint64_t v21 = *(void *)(a1 + 56);
    int v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F2D140];
    uint64_t v24 = 84;
    goto LABEL_26;
  }
  if ((objc_msgSend(MEMORY[0x1E4F1E600], "hm_isLocationAllowedForAuthorizationStatus:", objc_msgSend(*(id *)(a1 + 32), "authStatus")) & 1) == 0)
  {
    __int16 v26 = (void *)MEMORY[0x1D9452090]();
    id v27 = *(id *)(a1 + 32);
    uint64_t v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v65 = v29;
      id v30 = "%{public}@Location is not authorized for homed, cannot submit region monitoring";
      __int16 v31 = v28;
      os_log_type_t v32 = OS_LOG_TYPE_ERROR;
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if ([*(id *)(a1 + 32) beingConfigured])
  {
    long long v61 = 0uLL;
    long long v62 = 0uLL;
    long long v59 = 0uLL;
    long long v60 = 0uLL;
    obuint64_t j = *(id *)(a1 + 40);
    uint64_t v5 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v60 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          id v10 = (void *)MEMORY[0x1D9452090]();
          id v11 = *(id *)(a1 + 32);
          id v12 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            id v13 = HMFGetLogIdentifier();
            id v14 = regionAsString(v9);
            *(_DWORD *)buf = 138543618;
            uint64_t v65 = v13;
            __int16 v66 = 2112;
            v67 = v14;
            _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@The system is being configured, holding onto region %@ monitoring requests until complete", buf, 0x16u);
          }
          long long v15 = [*(id *)(a1 + 32) pendingRegionMonitoringRequests];
          [v15 setObject:*(void *)(a1 + 48) forKey:v9];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
      }
      while (v6);
    }
  }
  else
  {
    long long v57 = 0uLL;
    long long v58 = 0uLL;
    long long v55 = 0uLL;
    long long v56 = 0uLL;
    obuint64_t j = *(id *)(a1 + 40);
    uint64_t v33 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
    if (v33)
    {
      uint64_t v35 = v33;
      uint64_t v36 = *(void *)v56;
      *(void *)&long long v34 = 138543618;
      long long v53 = v34;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v56 != v36) {
            objc_enumerationMutation(obj);
          }
          uint64_t v38 = *(void **)(*((void *)&v55 + 1) + 8 * j);
          long long v39 = objc_msgSend(*(id *)(a1 + 32), "regionStateDelegatesByRegionIdentifier", v53);
          uint64_t v40 = *(void *)(a1 + 48);
          long long v41 = [v38 identifier];
          [v39 setObject:v40 forKey:v41];

          long long v42 = (void *)MEMORY[0x1D9452090]();
          id v43 = *(id *)(a1 + 32);
          v44 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            __int16 v45 = HMFGetLogIdentifier();
            uint64_t v46 = regionAsString(v38);
            *(_DWORD *)buf = v53;
            uint64_t v65 = v45;
            __int16 v66 = 2112;
            v67 = v46;
            _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_INFO, "%{public}@Submitting start monitor request for region: %@", buf, 0x16u);
          }
          v47 = [*(id *)(a1 + 32) locationManager];
          [v47 startMonitoringForRegion:v38];
        }
        uint64_t v35 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
      }
      while (v35);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)getCurrentLocation
{
  int v2 = [(HMDLocation *)self locationManager];
  uint64_t v3 = [v2 location];

  return v3;
}

- (void)_extractSingleLocationForDelegate:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDLocation *)self handlerQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  uint64_t v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v28 = 138543618;
    uint64_t v29 = v9;
    __int16 v30 = 2112;
    uint64_t v31 = (uint64_t)v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Extracting single location for delegate: %@", (uint8_t *)&v28, 0x16u);
  }
  if ([(HMDLocation *)v7 _canLocationBeExtracted])
  {
    id v10 = [(HMDLocation *)v7 singleLocationDelegates];
    uint64_t v11 = [v10 count];

    if (!v11)
    {
      id v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = v7;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        long long v15 = HMFGetLogIdentifier();
        int v28 = 138543362;
        uint64_t v29 = v15;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Requesting single location", (uint8_t *)&v28, 0xCu);
      }
      id v16 = [(HMDLocation *)v13 locationManager];
      [v16 requestLocation];
    }
    id v17 = [(HMDLocation *)v7 singleLocationDelegates];
    [v17 addObject:v4];

    id v18 = (void *)MEMORY[0x1D9452090]();
    __int16 v19 = v7;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      int v22 = [(HMDLocation *)v19 singleLocationDelegates];
      uint64_t v23 = [v22 count];
      int v28 = 138543618;
      uint64_t v29 = v21;
      __int16 v30 = 2048;
      uint64_t v31 = v23;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Current single location delegate count is now %ld", (uint8_t *)&v28, 0x16u);
    }
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x1D9452090]();
    id v25 = v7;
    __int16 v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = HMFGetLogIdentifier();
      int v28 = 138543362;
      uint64_t v29 = v27;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Passing back nil location because locations can't be extracted", (uint8_t *)&v28, 0xCu);
    }
    [(HMDLocation *)v25 _notifySingleLocationDelegate:v4 withLocation:0];
  }
}

- (BOOL)_canLocationBeExtracted
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDLocation *)self handlerQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDLocation *)self locationManager];
  char v5 = [(id)objc_opt_class() locationServicesEnabled];

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    id v10 = HMFGetLogIdentifier();
    int v14 = 138543362;
    long long v15 = v10;
    uint64_t v11 = "%{public}@Can't extract location because Location Services are not enabled";
LABEL_11:
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v14, 0xCu);

    goto LABEL_12;
  }
  if (![(HMDLocation *)self authStatus])
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    id v9 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    id v10 = HMFGetLogIdentifier();
    int v14 = 138543362;
    long long v15 = v10;
    uint64_t v11 = "%{public}@Waiting for initial location auth.";
    goto LABEL_11;
  }
  if (objc_msgSend(MEMORY[0x1E4F1E600], "hm_isLocationAllowedForAuthorizationStatus:", -[HMDLocation authStatus](self, "authStatus")))return 1; {
  uint64_t v7 = (void *)MEMORY[0x1D9452090]();
  }
  id v13 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v14 = 138543362;
    long long v15 = v10;
    uint64_t v11 = "%{public}@Can't extract location because Location Services are not enabled for homed";
    goto LABEL_11;
  }
LABEL_12:

  return 0;
}

- (void)startExtractingSingleLocationForDelegate:(id)a3
{
  id v4 = a3;
  char v5 = [(HMDLocation *)self handlerQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__HMDLocation_startExtractingSingleLocationForDelegate___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __56__HMDLocation_startExtractingSingleLocationForDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _extractSingleLocationForDelegate:*(void *)(a1 + 40)];
}

- (void)stopUpdatingLocation
{
  uint64_t v3 = [(HMDLocation *)self handlerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__HMDLocation_stopUpdatingLocation__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

void __35__HMDLocation_stopUpdatingLocation__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    char v5 = HMFGetLogIdentifier();
    id v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "totalLocationObservingClients"));
    int v14 = 138543618;
    long long v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Processing stop updating location request: totalClients: %@", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v7 totalLocationObservingClients] - 1;
  [v7 setTotalLocationObservingClients:v8];
  [*(id *)(a1 + 32) setTotalLocationObservingClients:v8 & ~(v8 >> 63)];
  if (![*(id *)(a1 + 32) totalLocationObservingClients])
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v14 = 138543362;
      long long v15 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Requesting CLLocationManager to stop updating location", (uint8_t *)&v14, 0xCu);
    }
    id v13 = [*(id *)(a1 + 32) locationManager];
    [v13 stopUpdatingLocation];
  }
}

- (void)startUpdatingLocation
{
  id v3 = [(HMDLocation *)self handlerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__HMDLocation_startUpdatingLocation__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __36__HMDLocation_startUpdatingLocation__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    char v5 = HMFGetLogIdentifier();
    id v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "totalLocationObservingClients"));
    int v13 = 138543618;
    int v14 = v5;
    __int16 v15 = 2112;
    __int16 v16 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Processing start updating location request: totalClients: %@", (uint8_t *)&v13, 0x16u);
  }
  if (![*(id *)(a1 + 32) totalLocationObservingClients])
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v13 = 138543362;
      int v14 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Requesting CLLocationManager to start updating location", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v11 = [*(id *)(a1 + 32) locationManager];
    [v11 startUpdatingLocation];
  }
  return objc_msgSend(*(id *)(a1 + 32), "setTotalLocationObservingClients:", objc_msgSend(*(id *)(a1 + 32), "totalLocationObservingClients") + 1);
}

- (BOOL)isCurrentLocationSimulated
{
  int v2 = [(HMDLocation *)self getCurrentLocation];
  char v3 = [v2 isSimulated];

  return v3;
}

- (void)dealloc
{
  char v3 = [(HMDLocation *)self locationManager];
  [v3 stopUpdatingLocation];

  v4.receiver = self;
  v4.super_class = (Class)HMDLocation;
  [(HMDLocation *)&v4 dealloc];
}

- (HMDLocation)initWithLocationManager:(id)a3 handlerQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HMDLocation;
  id v9 = [(HMDLocation *)&v24 init];
  id v10 = v9;
  if (v9)
  {
    v9->_beingConfigured = 1;
    objc_storeStrong((id *)&v9->_handlerQueue, a4);
    objc_storeStrong((id *)&v10->_locationManager, a3);
    [(HMDCLLocationManager *)v10->_locationManager setDelegate:v10];
    [(HMDCLLocationManager *)v10->_locationManager setDesiredAccuracy:*MEMORY[0x1E4F1E6E0]];
    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    singleLocationDelegates = v10->_singleLocationDelegates;
    v10->_singleLocationDelegates = (NSHashTable *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    regionStateDelegatesByRegionIdentifier = v10->_regionStateDelegatesByRegionIdentifier;
    v10->_regionStateDelegatesByRegionIdentifier = (NSMapTable *)v13;

    uint64_t v15 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    pendingRegionMonitoringRequests = v10->_pendingRegionMonitoringRequests;
    v10->_pendingRegionMonitoringRequests = (NSMapTable *)v15;

    uint64_t v17 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    pendingRegionCallbacks = v10->_pendingRegionCallbacks;
    v10->_pendingRegionCallbacks = (NSMapTable *)v17;

    uint64_t v19 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    regionStates = v10->_regionStates;
    v10->_regionStates = (NSMapTable *)v19;

    [(HMDCLLocationManager *)v10->_locationManager requestWhenInUseAuthorization];
    id v21 = objc_alloc_init(MEMORY[0x1E4F57EE0]);
    [(HMDLocation *)v10 setCarPlaySessionStatus:v21];

    int v22 = [(HMDLocation *)v10 carPlaySessionStatus];
    [v22 addSessionObserver:v10];
  }
  return v10;
}

- (HMDLocation)init
{
  char v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  objc_super v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.homed.location", v3);
  handlerQueue = self->_handlerQueue;
  self->_handlerQueue = v4;

  id v6 = objc_alloc(MEMORY[0x1E4F1E600]);
  id v7 = [(id)objc_opt_class() bundleForLocationManager];
  id v8 = (void *)[v6 initWithEffectiveBundle:v7 delegate:self onQueue:self->_handlerQueue];

  id v9 = [(HMDLocation *)self initWithLocationManager:v8 handlerQueue:self->_handlerQueue];
  return v9;
}

+ (void)timeZoneISOCountryCodeForCLLocationAsync:(id)a3 withCompletion:(id)a4
{
  id v7 = (void (**)(id, void *, void *))_Block_copy(a4);
  if (v7)
  {
    objc_super v4 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    char v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    id v6 = [v5 countryCode];
    v7[2](v7, v4, v6);
  }
}

+ (BOOL)isAccurateLocation:(id)a3
{
  id v3 = a3;
  [v3 horizontalAccuracy];
  if (v4 >= 0.0)
  {
    [v3 horizontalAccuracy];
    BOOL v5 = v6 <= 500.0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)nextSunsetTimeForLocation:(id)a3 date:(id)a4
{
  v10[3] = *MEMORY[0x1E4F143B8];
  double v4 = +[HMDLocation _getAlmanacWithLocation:](HMDLocation, "_getAlmanacWithLocation:", a3, a4);
  BOOL v5 = [v4 previousSunset];
  double v6 = objc_msgSend(v4, "sunset", v5);
  v10[1] = v6;
  id v7 = [v4 nextSunset];
  v10[2] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];

  return v8;
}

+ (id)sunsetTimeForLocation:(id)a3
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v3 = +[HMDLocation _getAlmanacWithLocation:a3];
  double v4 = [v3 previousSunrise];
  BOOL v5 = objc_msgSend(v3, "sunrise", v4);
  v10[1] = v5;
  double v6 = [v3 nextSunrise];
  v10[2] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  id v8 = +[HMDLocation findEvent:v7 withGeo:v3];

  return v8;
}

+ (id)nextSunriseTimeForLocation:(id)a3 date:(id)a4
{
  v10[3] = *MEMORY[0x1E4F143B8];
  double v4 = +[HMDLocation _getAlmanacWithLocation:](HMDLocation, "_getAlmanacWithLocation:", a3, a4);
  BOOL v5 = [v4 previousSunrise];
  double v6 = objc_msgSend(v4, "sunrise", v5);
  v10[1] = v6;
  id v7 = [v4 nextSunrise];
  v10[2] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];

  return v8;
}

+ (id)sunriseTimeForLocation:(id)a3
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v3 = +[HMDLocation _getAlmanacWithLocation:a3];
  double v4 = [v3 previousSunset];
  BOOL v5 = objc_msgSend(v3, "sunset", v4);
  v10[1] = v5;
  double v6 = [v3 nextSunset];
  v10[2] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  id v8 = +[HMDLocation findEvent:v7 withGeo:v3];

  return v8;
}

+ (id)findEvent:(id)a3 withGeo:(id)a4
{
  v26[7] = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v5 = a4;
  double v6 = [MEMORY[0x1E4F1C9C8] now];
  id v7 = objc_msgSend(v6, "hmf_dateComponents");

  [v7 setHour:12];
  [v7 setMinute:0];
  id v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v9 = [v8 dateFromComponents:v7];

  id v10 = [v5 previousSunrise];
  v26[0] = v10;
  uint64_t v11 = [v5 previousSunset];
  v26[1] = v11;
  id v12 = [v5 sunrise];
  v26[2] = v12;
  uint64_t v13 = [v5 sunset];
  v26[3] = v13;
  int v14 = [v5 nextSunrise];
  v26[4] = v14;
  uint64_t v15 = [v5 nextSunset];
  v26[5] = v15;
  v26[6] = v9;
  __int16 v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:7];

  uint64_t v17 = [v16 sortedArrayUsingComparator:&__block_literal_global_184_119873];
  uint64_t v18 = 0;
  if ([v17 count])
  {
    uint64_t v19 = v25;
    while (1)
    {
      uint64_t v20 = [v17 objectAtIndex:v18];

      if (v20 == v9) {
        break;
      }
      if ((unint64_t)++v18 >= [v17 count])
      {
        uint64_t v18 = 0;
        goto LABEL_11;
      }
    }
    id v21 = [v17 objectAtIndex:v18 - 1];
    int v22 = [v25 containsObject:v21];

    if (v22) {
      uint64_t v23 = v18 + 1;
    }
    else {
      uint64_t v23 = v18 - 1;
    }
    uint64_t v18 = [v17 objectAtIndex:v23];
  }
  else
  {
    uint64_t v19 = v25;
  }
LABEL_11:

  return v18;
}

uint64_t __33__HMDLocation_findEvent_withGeo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)_getAlmanacWithLocation:(id)a3 date:(id)a4
{
  double v4 = (objc_class *)MEMORY[0x1E4F643C8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v5 coordinate];
  double v8 = v7;
  [v5 coordinate];
  double v10 = v9;

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  objc_msgSend(v6, "calculateAstronomicalTimeForLocation:time:altitudeInDegrees:", v8, v10, v11, *MEMORY[0x1E4F63E78]);
  return v6;
}

+ (id)_getAlmanacWithLocation:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F643C8];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v4 coordinate];
  double v7 = v6;
  [v4 coordinate];
  double v9 = v8;

  objc_msgSend(v5, "calculateAstronomicalTimeForLocation:altitudeInDegrees:", v7, v9, *MEMORY[0x1E4F63E78]);
  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t25_119876 != -1) {
    dispatch_once(&logCategory__hmf_once_t25_119876, &__block_literal_global_119877);
  }
  int v2 = (void *)logCategory__hmf_once_v26_119878;
  return v2;
}

uint64_t __26__HMDLocation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v26_119878;
  logCategory__hmf_once_v26_119878 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (HMDLocation)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__HMDLocation_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_119887 != -1) {
    dispatch_once(&sharedManager_onceToken_119887, block);
  }
  int v2 = (void *)sharedManager_sharedLocation;
  return (HMDLocation *)v2;
}

uint64_t __28__HMDLocation_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedManager_sharedLocation;
  sharedManager_sharedLocation = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

@end