@interface HAPAccessoryServerBrowserBTLE
+ (id)logCategory;
- (BOOL)_canStartScan;
- (BOOL)_delegateRespondsToSelector:(SEL)a3;
- (BOOL)_hasPairedAccessoriesOfType:(unint64_t)a3;
- (BOOL)_hasRecentlySeenAccessoriesWithIdentifiers:(id)a3;
- (BOOL)_shouldCreateHAPAccessoryServerWithIdentifier:(id)a3 statusFlags:(id)a4 stateNumber:(id)a5 category:(id)a6 configNumber:(id)a7 name:(id)a8 forPeripheral:(id)a9 advertisementFormat:(unint64_t)a10 setupHash:(id)a11 stateChanged:(BOOL *)a12 connectReason:(unsigned __int8 *)a13;
- (BOOL)isPerformingGeneralScan;
- (BOOL)remoteBrowsingAndScanEnabled;
- (BOOL)remoteBrowsingEnabled;
- (CBCentralManager)centralManager;
- (CBConnectionsObserver)connectionsObserver;
- (HAPAccessoryServerBrowserBTLE)initWithQueue:(id)a3;
- (HAPAccessoryServerBrowserBTLEDelegate)delegate;
- (HAPAccessoryServerBrowserWiProxBTLE)hapWiProxBLEBrowser;
- (HMFActivity)targetedScanActivity;
- (NSMapTable)discoveredPeripheralsWithAccessories;
- (NSMapTable)identifiersWithReachabilityScanTuples;
- (NSMapTable)peripheralDisconnectionMonitorMap;
- (NSMapTable)recentlySeenPairedPeripherals;
- (NSMutableArray)powerOnCentralManagerCompletions;
- (NSMutableArray)targetedScanAccessoryIdentifiers;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_source)targetedScanTimer;
- (id)_bleAccessoryServerTupleForIdentifier:(id)a3;
- (id)_blePeripheralForAccessoryServerIdentifier:(id)a3;
- (id)_blePeripheralForCBPeripheral:(id)a3;
- (id)_cachedCharacteristicForInstanceID:(id)a3 identifier:(id)a4;
- (id)_cbPeripheralForHAPBLEPeripheral:(id)a3 routeMode:(unsigned __int8 *)a4;
- (id)_cbPeripheralForPeripheralUUID:(id)a3 stableIdentifier:(id)a4 routeMode:(unsigned __int8 *)a5;
- (id)_discoveredAccessoryServerTupleForBLEPeripheral:(id)a3 shouldMerge:(BOOL)a4;
- (id)_recentlySeenPairedPeripheralTupleWithPeripheral:(id)a3;
- (id)cachedAccessoryForIdentifier:(id)a3;
- (id)hapCharacteristicsForEncryptedPayload:(id)a3 identifier:(id)a4 shouldConnect:(BOOL *)a5;
- (id)logIdentifier;
- (id)peripheralsPendingConnection;
- (id)peripheralsWithConnectionRequests;
- (id)reachabilityCompletion;
- (id)retrieveCBPeripheralWithUUID:(id)a3 blePeripheral:(id)a4;
- (int64_t)linkType;
- (int64_t)peripheralDisconnectionTimeout;
- (int64_t)scanState;
- (unint64_t)_parseAdvertisementData:(id)a3 forPeripheral:(id)a4 name:(id *)a5 pairingUsername:(id *)a6 statusFlags:(id *)a7 stateNumber:(id *)a8 category:(id *)a9 configNumber:(id *)a10 setupHash:(id *)a11;
- (unint64_t)qosLimits;
- (void)_addToActiveConnections:(id)a3;
- (void)_addToPendingConnections:(id)a3;
- (void)_callPowerOnCompletionsWithError:(id)a3;
- (void)_connectHAPPeripheralWhenAllowed:(id)a3;
- (void)_connectPendingConnections;
- (void)_createHAPAccessoryAndNotifyDelegateWithPeripheral:(id)a3 name:(id)a4 pairingUsername:(id)a5 statusFlags:(id)a6 stateNumber:(id)a7 stateChanged:(BOOL)a8 connectReason:(unsigned __int8)a9 configNumber:(id)a10 category:(id)a11 connectionIdleTime:(unsigned __int8)a12 format:(unint64_t)a13 setupHash:(id)a14 encryptedPayload:(id)a15 whbStableIdentifier:(id)a16;
- (void)_didDiscoverPeripheral:(id)a3 accessoryName:(id)a4 pairingIdentifier:(id)a5 format:(unint64_t)a6 statusFlags:(id)a7 stateNumber:(id)a8 category:(id)a9 configNumber:(id)a10 setupHash:(id)a11 encryptedPayload:(id)a12 whbStableIdentifier:(id)a13;
- (void)_disconnectFromHAPBLEPeripheral:(id)a3 cbPeripheral:(id)a4;
- (void)_discoverAccessoryServerWithIdentifier:(id)a3;
- (void)_forgetPairedAccessoryWithIdentifier:(id)a3;
- (void)_handleTargetedScanTimeout;
- (void)_invalidTargetedScanActivity;
- (void)_matchAccessoryServerWithSetupID:(id)a3 serverIdentifier:(id)a4 completionHandler:(id)a5;
- (void)_monitorDisconnectionOfHAPPeripheral:(id)a3 peripheral:(id)a4;
- (void)_notifyDelegatesOfRemovedAccessoryServer:(id)a3 error:(id)a4;
- (void)_performTargetedScanForAccessoryWithIdentifier:(id)a3;
- (void)_performTimedConnectionRequestForIdentifier:(id)a3;
- (void)_performTimedScanForIdentifiers:(id)a3 forceScan:(BOOL)a4 withCompletion:(id)a5;
- (void)_powerOnCentralManagerWithCompletion:(id)a3;
- (void)_probeReachabilityForAccessoryServersWithIdentifiers:(id)a3 forceScan:(BOOL)a4 withCompletion:(id)a5;
- (void)_removeDiscoveredPeripheralsWithIdentifier:(id)a3;
- (void)_removeFromActiveConnections:(id)a3;
- (void)_removeFromPendingConnections:(id)a3;
- (void)_removeIdentifiersForReachabilityScan;
- (void)_reportReachabilityForAccessoryWithIdentifier:(id)a3;
- (void)_startBrowsingForLegacyHAPBTLE100Accessories;
- (void)_startDiscoveringAccessoryServers;
- (void)_startScanningForReachability:(id)a3;
- (void)_stopActiveScanWithForce:(BOOL)a3;
- (void)_stopMonitorDisconnectionOfCBPeripheral:(id)a3;
- (void)_updateTargetedScanTimer;
- (void)accessoryServerBrowserBTLE:(id)a3 didDiscoverHAPPeripheral:(id)a4;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)configureAccessoryWithIdentifier:(id)a3 trackState:(BOOL)a4 connectionPriority:(unint64_t)a5;
- (void)configureBTLEQoSLimits:(unint64_t)a3;
- (void)connectToBTLEAccessoryServer:(id)a3;
- (void)connectedHAPPeripheral:(id)a3;
- (void)deRegisterAccessoryWithIdentifier:(id)a3;
- (void)disconnectFromBTLEAccessoryServer:(id)a3;
- (void)disconnectedHAPPeripheral:(id)a3 error:(id)a4;
- (void)discoverAccessoryServerWithIdentifier:(id)a3;
- (void)failedToConnectHAPPeripheral:(id)a3 error:(id)a4;
- (void)markNotifyingCharacteristicUpdatedForIdentifier:(id)a3;
- (void)matchAccessoryServerWithSetupID:(id)a3 serverIdentifier:(id)a4 completionHandler:(id)a5;
- (void)pauseScans;
- (void)probeReachabilityForAccessoryServersWithIdentifiers:(id)a3 forceScan:(BOOL)a4 withCompletion:(id)a5;
- (void)removeCachedAccessoryWithIdentifier:(id)a3;
- (void)resetLastSeenForAccessoryServersWithIdentifiers:(id)a3;
- (void)resetPairedAccessories;
- (void)retrieveCurrentStateForIdentifier:(id)a3 stateNumber:(id *)a4 isReachable:(BOOL *)a5 linkQuality:(unint64_t *)a6 lastSeen:(id *)a7;
- (void)saveCacheToDisk:(id)a3;
- (void)setCentralManager:(id)a3;
- (void)setConnectionLatency:(int64_t)a3 forPeripheral:(id)a4;
- (void)setConnectionsObserver:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setDelegateQueue:(id)a3;
- (void)setDiscoveredPeripheralsWithAccessories:(id)a3;
- (void)setHapWiProxBLEBrowser:(id)a3;
- (void)setIdentifiersWithReachabilityScanTuples:(id)a3;
- (void)setPerformingGeneralScan:(BOOL)a3;
- (void)setPeripheralDisconnectionMonitorMap:(id)a3;
- (void)setPeripheralDisconnectionTimeout:(int64_t)a3;
- (void)setPowerOnCentralManagerCompletions:(id)a3;
- (void)setQosLimits:(unint64_t)a3;
- (void)setReachabilityCompletion:(id)a3;
- (void)setReachabilityCompletionHandler:(id)a3;
- (void)setRecentlySeenPairedPeripherals:(id)a3;
- (void)setScanState:(int64_t)a3;
- (void)setTargetedScanAccessoryIdentifiers:(id)a3;
- (void)setTargetedScanActivity:(id)a3;
- (void)setTargetedScanTimer:(id)a3;
- (void)startDiscoveringAccessoryServers;
- (void)stopDiscoveringAccessoryServers;
- (void)stopTrackingBTLEAccessoriesWithIdentifiers:(id)a3;
- (void)updateBroadcastKeyForIdentifier:(id)a3 key:(id)a4 keyUpdatedStateNumber:(id)a5 keyUpdatedTime:(double)a6;
- (void)updateCachedStateForIdentifier:(id)a3 stateNumber:(id)a4;
- (void)updateRemoteBrowsing:(BOOL)a3 shouldScan:(BOOL)a4;
- (void)updateScanInBackground:(BOOL)a3;
- (void)updateStateForIdentifier:(id)a3 stateNumber:(id)a4;
@end

@implementation HAPAccessoryServerBrowserBTLE

- (void)retrieveCurrentStateForIdentifier:(id)a3 stateNumber:(id *)a4 isReachable:(BOOL *)a5 linkQuality:(unint64_t *)a6 lastSeen:(id *)a7
{
  id v12 = a3;
  id v13 = [(HAPAccessoryServerBrowserBTLE *)self hapWiProxBLEBrowser];
  [v13 retrieveStateForTrackedAccessoryWithIdentifier:v12 stateNumber:a4 isReachable:a5 linkQuality:a6 lastSeen:a7];
}

- (HAPAccessoryServerBrowserWiProxBTLE)hapWiProxBLEBrowser
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  hapWiProxBLEBrowser = self->_hapWiProxBLEBrowser;
  if (!hapWiProxBLEBrowser)
  {
    v5 = [HAPAccessoryServerBrowserWiProxBTLE alloc];
    v6 = [(HAPAccessoryServerBrowser *)self workQueue];
    v7 = [(HAPAccessoryServerBrowserWiProxBTLE *)v5 initWithDelegate:self queue:v6];
    v8 = self->_hapWiProxBLEBrowser;
    self->_hapWiProxBLEBrowser = v7;

    hapWiProxBLEBrowser = self->_hapWiProxBLEBrowser;
  }
  v9 = hapWiProxBLEBrowser;
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peripheralDisconnectionMonitorMap, 0);
  objc_storeStrong((id *)&self->_identifiersWithReachabilityScanTuples, 0);
  objc_storeStrong((id *)&self->_targetedScanAccessoryIdentifiers, 0);
  objc_storeStrong((id *)&self->_targetedScanActivity, 0);
  objc_storeStrong((id *)&self->_targetedScanTimer, 0);
  objc_storeStrong(&self->_reachabilityCompletion, 0);
  objc_storeStrong((id *)&self->_powerOnCentralManagerCompletions, 0);
  objc_storeStrong((id *)&self->_recentlySeenPairedPeripherals, 0);
  objc_storeStrong((id *)&self->_discoveredPeripheralsWithAccessories, 0);
  objc_storeStrong((id *)&self->_hapWiProxBLEBrowser, 0);
  objc_storeStrong((id *)&self->_connectionsObserver, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_peripheralsPendingConnection, 0);

  objc_storeStrong((id *)&self->_peripheralsWithConnectionRequests, 0);
}

- (void)setPeripheralDisconnectionMonitorMap:(id)a3
{
}

- (NSMapTable)peripheralDisconnectionMonitorMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 208, 1);
}

- (void)setPeripheralDisconnectionTimeout:(int64_t)a3
{
  self->_peripheralDisconnectionTimeout = a3;
}

- (int64_t)peripheralDisconnectionTimeout
{
  return self->_peripheralDisconnectionTimeout;
}

- (void)setIdentifiersWithReachabilityScanTuples:(id)a3
{
}

- (NSMapTable)identifiersWithReachabilityScanTuples
{
  return self->_identifiersWithReachabilityScanTuples;
}

- (void)setTargetedScanAccessoryIdentifiers:(id)a3
{
}

- (NSMutableArray)targetedScanAccessoryIdentifiers
{
  return self->_targetedScanAccessoryIdentifiers;
}

- (void)setTargetedScanActivity:(id)a3
{
}

- (HMFActivity)targetedScanActivity
{
  return self->_targetedScanActivity;
}

- (void)setTargetedScanTimer:(id)a3
{
}

- (OS_dispatch_source)targetedScanTimer
{
  return self->_targetedScanTimer;
}

- (void)setReachabilityCompletion:(id)a3
{
}

- (id)reachabilityCompletion
{
  return self->_reachabilityCompletion;
}

- (void)setPowerOnCentralManagerCompletions:(id)a3
{
}

- (NSMutableArray)powerOnCentralManagerCompletions
{
  return self->_powerOnCentralManagerCompletions;
}

- (void)setRecentlySeenPairedPeripherals:(id)a3
{
}

- (NSMapTable)recentlySeenPairedPeripherals
{
  return self->_recentlySeenPairedPeripherals;
}

- (void)setDiscoveredPeripheralsWithAccessories:(id)a3
{
}

- (NSMapTable)discoveredPeripheralsWithAccessories
{
  return self->_discoveredPeripheralsWithAccessories;
}

- (void)setHapWiProxBLEBrowser:(id)a3
{
}

- (void)setConnectionsObserver:(id)a3
{
}

- (CBConnectionsObserver)connectionsObserver
{
  return self->_connectionsObserver;
}

- (void)setCentralManager:(id)a3
{
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegate:(id)a3
{
}

- (HAPAccessoryServerBrowserBTLEDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HAPAccessoryServerBrowserBTLEDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  return @"BTLE Browser";
}

- (void)_handleTargetedScanTimeout
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v3 = [(HAPAccessoryServerBrowserBTLE *)self targetedScanTimer];

  if (v3)
  {
    v4 = [(HAPAccessoryServerBrowserBTLE *)self targetedScanTimer];
    dispatch_source_cancel(v4);

    [(HAPAccessoryServerBrowserBTLE *)self setTargetedScanTimer:0];
  }
  [(HAPAccessoryServerBrowserBTLE *)self _invalidTargetedScanActivity];
  BOOL v5 = [(HAPAccessoryServerBrowserBTLE *)self isPerformingGeneralScan];
  v6 = (void *)MEMORY[0x1D944E080]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v9)
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v72 = v10;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Canceling targeted scan timer but continuing to actively scan because a general scan has been requested.", buf, 0xCu);
    }
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id obj = [(HAPAccessoryServerBrowserBTLE *)v7 identifiersWithReachabilityScanTuples];
    uint64_t v11 = [obj countByEnumeratingWithState:&v66 objects:v75 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v67;
      v51 = &v65;
      v52 = v64;
      do
      {
        uint64_t v14 = 0;
        uint64_t v53 = v12;
        do
        {
          if (*(void *)v67 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v66 + 1) + 8 * v14);
          v16 = [(HAPAccessoryServerBrowserBTLE *)v7 identifiersWithReachabilityScanTuples];
          v17 = [v16 objectForKey:v15];

          if (v17)
          {
            v18 = [v17 completion];

            if (v18)
            {
              v19 = [v17 identifier];
              v20 = [(HAPAccessoryServerBrowserBTLE *)v7 _blePeripheralForAccessoryServerIdentifier:v19];
              v21 = [v20 cbPeripheral];

              if (!v21)
              {
                v22 = [v17 identifier];
                v23 = [(HAPAccessoryServerBrowserBTLE *)v7 _bleAccessoryServerTupleForIdentifier:v22];
                v24 = [v23 accessoryServer];
                v21 = [v24 peripheral];
              }
              uint64_t v25 = [v21 state];
              v26 = (void *)MEMORY[0x1D944E080]();
              v27 = v7;
              v28 = HMFGetOSLogHandle();
              BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
              if (v25)
              {
                if (v29)
                {
                  v30 = HMFGetLogIdentifier();
                  v31 = [v17 identifier];
                  *(_DWORD *)buf = 138543618;
                  v72 = v30;
                  __int16 v73 = 2114;
                  v74 = v31;
                  _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Targeted scan timed out, setting reachability for %{public}@ to YES as we are connected", buf, 0x16u);
                }
                v32 = [v17 queue];
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __59__HAPAccessoryServerBrowserBTLE__handleTargetedScanTimeout__block_invoke_185;
                block[3] = &unk_1E69F4330;
                id v62 = v17;
                dispatch_async(v32, block);
                v33 = &v62;
              }
              else
              {
                if (v29)
                {
                  v34 = HMFGetLogIdentifier();
                  v35 = [v17 identifier];
                  *(_DWORD *)buf = 138543618;
                  v72 = v34;
                  __int16 v73 = 2114;
                  v74 = v35;
                  _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Targeted scan timed out, setting reachability for %{public}@ to NO", buf, 0x16u);
                }
                v32 = [v17 queue];
                v63[0] = MEMORY[0x1E4F143A8];
                v63[1] = 3221225472;
                v64[0] = __59__HAPAccessoryServerBrowserBTLE__handleTargetedScanTimeout__block_invoke;
                v64[1] = &unk_1E69F4330;
                id v65 = v17;
                dispatch_async(v32, v63);
                v33 = v51;
              }

              uint64_t v12 = v53;
            }
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [obj countByEnumeratingWithState:&v66 objects:v75 count:16];
      }
      while (v12);
    }
  }
  else
  {
    if (v9)
    {
      v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v72 = v36;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Stopping targeted scans after timeout was received", buf, 0xCu);
    }
    [(HAPAccessoryServerBrowserBTLE *)v7 _stopActiveScanWithForce:0];
    [(HAPAccessoryServerBrowserBTLE *)v7 _removeIdentifiersForReachabilityScan];
  }
  if ([(HAPAccessoryServerBrowserBTLE *)v7 _delegateRespondsToSelector:sel_accessoryServerBrowser_didFailToDiscoverAccessoryServerWithIdentifier_])
  {
    v37 = (void *)MEMORY[0x1E4F1C978];
    v38 = [(HAPAccessoryServerBrowserBTLE *)v7 targetedScanAccessoryIdentifiers];
    v39 = [v37 arrayWithArray:v38];

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obja = v39;
    uint64_t v40 = [obja countByEnumeratingWithState:&v57 objects:v70 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v58 != v42) {
            objc_enumerationMutation(obja);
          }
          v44 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          v45 = [(HAPAccessoryServerBrowserBTLE *)v7 targetedScanAccessoryIdentifiers];
          [v45 removeObject:v44];

          v46 = (void *)MEMORY[0x1D944E080]();
          v47 = v7;
          v48 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            v49 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v72 = v49;
            __int16 v73 = 2114;
            v74 = v44;
            _os_log_impl(&dword_1D4758000, v48, OS_LOG_TYPE_DEBUG, "%{public}@Notifying delegates that the targeted scan failed to discover accessory with identifier %{public}@", buf, 0x16u);
          }
          v50 = [(HAPAccessoryServerBrowserBTLE *)v47 delegateQueue];
          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __59__HAPAccessoryServerBrowserBTLE__handleTargetedScanTimeout__block_invoke_186;
          v56[3] = &unk_1E69F46E0;
          v56[4] = v47;
          v56[5] = v44;
          dispatch_async(v50, v56);
        }
        uint64_t v41 = [obja countByEnumeratingWithState:&v57 objects:v70 count:16];
      }
      while (v41);
    }
  }
}

void __59__HAPAccessoryServerBrowserBTLE__handleTargetedScanTimeout__block_invoke(uint64_t a1)
{
  v3 = [*(id *)(a1 + 32) completion];
  v2 = [*(id *)(a1 + 32) identifier];
  v3[2](v3, v2, 0);
}

void __59__HAPAccessoryServerBrowserBTLE__handleTargetedScanTimeout__block_invoke_185(uint64_t a1)
{
  v3 = [*(id *)(a1 + 32) completion];
  v2 = [*(id *)(a1 + 32) identifier];
  v3[2](v3, v2, 1);
}

void __59__HAPAccessoryServerBrowserBTLE__handleTargetedScanTimeout__block_invoke_186(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didFailToDiscoverAccessoryServerWithIdentifier:*(void *)(a1 + 40)];
}

- (void)_invalidTargetedScanActivity
{
  v3 = [(HAPAccessoryServerBrowserBTLE *)self targetedScanActivity];

  if (v3)
  {
    v4 = [(HAPAccessoryServerBrowserBTLE *)self targetedScanActivity];
    [v4 invalidate];

    [(HAPAccessoryServerBrowserBTLE *)self setTargetedScanActivity:0];
  }
}

- (void)_updateTargetedScanTimer
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D944E080](self, a2);
  v4 = self;
  BOOL v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v24 = v6;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Updating targeted scan timer.", buf, 0xCu);
  }
  v7 = [(HAPAccessoryServerBrowserBTLE *)v4 targetedScanTimer];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    [(HAPAccessoryServerBrowserBTLE *)v4 _invalidTargetedScanActivity];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Targeted Scan" parent:0 options:2];
    [(HAPAccessoryServerBrowserBTLE *)v4 setTargetedScanActivity:v11];

    uint64_t v12 = [(HAPAccessoryServerBrowser *)v4 workQueue];
    dispatch_source_t v13 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v12);
    [(HAPAccessoryServerBrowserBTLE *)v4 setTargetedScanTimer:v13];

    objc_initWeak((id *)buf, v4);
    uint64_t v14 = [(HAPAccessoryServerBrowserBTLE *)v4 targetedScanTimer];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __57__HAPAccessoryServerBrowserBTLE__updateTargetedScanTimer__block_invoke;
    v20 = &unk_1E69F4540;
    objc_copyWeak(&v22, (id *)buf);
    v21 = v4;
    dispatch_source_set_event_handler(v14, &v17);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
    uint64_t v15 = [(HAPAccessoryServerBrowserBTLE *)v4 targetedScanTimer];
    dispatch_time_t v16 = dispatch_walltime(0, 3000000000);
    dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);

    BOOL v9 = [(HAPAccessoryServerBrowserBTLE *)v4 targetedScanTimer];
    dispatch_resume(v9);
  }
  else
  {
    BOOL v9 = [(HAPAccessoryServerBrowserBTLE *)v4 targetedScanTimer];
    dispatch_time_t v10 = dispatch_walltime(0, 3000000000);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
  }
}

void __57__HAPAccessoryServerBrowserBTLE__updateTargetedScanTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) _invalidTargetedScanActivity];
    [WeakRetained _handleTargetedScanTimeout];
  }
}

- (BOOL)_shouldCreateHAPAccessoryServerWithIdentifier:(id)a3 statusFlags:(id)a4 stateNumber:(id)a5 category:(id)a6 configNumber:(id)a7 name:(id)a8 forPeripheral:(id)a9 advertisementFormat:(unint64_t)a10 setupHash:(id)a11 stateChanged:(BOOL *)a12 connectReason:(unsigned __int8 *)a13
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v127 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v126 = a8;
  id v23 = a9;
  id v24 = a11;
  uint64_t v25 = [(HAPAccessoryServerBrowserBTLE *)self targetedScanAccessoryIdentifiers];
  int v26 = [v25 containsObject:v19];

  [(HAPAccessoryServerBrowserBTLE *)self _reportReachabilityForAccessoryWithIdentifier:v19];
  v27 = [v23 cbPeripheral];
  uint64_t v28 = [v27 state];

  if (v28)
  {
LABEL_2:
    char v29 = 0;
    goto LABEL_59;
  }
  if (v26)
  {
    *a13 = 1;
    v30 = [(HAPAccessoryServerBrowserBTLE *)self targetedScanAccessoryIdentifiers];
    [v30 removeObject:v19];

    v31 = [(HAPAccessoryServerBrowserBTLE *)self targetedScanAccessoryIdentifiers];
    if ([v31 count])
    {
    }
    else
    {
      v33 = [(HAPAccessoryServerBrowserBTLE *)self identifiersWithReachabilityScanTuples];
      uint64_t v34 = [v33 count];

      if (!v34)
      {
        v35 = [(HAPAccessoryServerBrowserBTLE *)self targetedScanTimer];

        if (v35)
        {
          v36 = [(HAPAccessoryServerBrowserBTLE *)self targetedScanTimer];
          dispatch_source_cancel(v36);

          [(HAPAccessoryServerBrowserBTLE *)self setTargetedScanTimer:0];
        }
        [(HAPAccessoryServerBrowserBTLE *)self _invalidTargetedScanActivity];
        if (![(HAPAccessoryServerBrowserBTLE *)self isPerformingGeneralScan])
        {
          v37 = (void *)MEMORY[0x1D944E080]();
          v38 = self;
          v39 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            uint64_t v40 = v122 = v37;
            *(_DWORD *)buf = 138543362;
            v129 = v40;
            _os_log_impl(&dword_1D4758000, v39, OS_LOG_TYPE_DEBUG, "%{public}@Stopping targeted scans after discovering the appropriate peripheral(s)", buf, 0xCu);

            v37 = v122;
          }

          [(HAPAccessoryServerBrowserBTLE *)v38 _stopActiveScanWithForce:0];
        }
      }
    }
    char v32 = 1;
  }
  else if ([(HAPAccessoryServerBrowserBTLE *)self isPerformingGeneralScan] {
         && ![(HAPAccessoryServerBrowser *)self isPaired:v19])
  }
  {
    char v32 = 1;
    *a13 = 1;
  }
  else
  {
    char v32 = 0;
  }
  uint64_t v41 = [(HAPAccessoryServerBrowserBTLE *)self recentlySeenPairedPeripherals];
  id v42 = [v41 objectForKey:v19];

  if (v32)
  {
    char v29 = 1;
    if (!v42) {
      goto LABEL_59;
    }
    goto LABEL_50;
  }
  if (!v42)
  {
    if (![(HAPAccessoryServerBrowser *)self isPaired:v19])
    {
      v93 = (void *)MEMORY[0x1D944E080]();
      v94 = self;
      v95 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
      {
        v96 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v129 = v96;
        _os_log_impl(&dword_1D4758000, v95, OS_LOG_TYPE_DEBUG, "%{public}@Discovered an unpaired accessory!", buf, 0xCu);
      }
      goto LABEL_2;
    }
    id v42 = [[HAPRecentlySeenPairedBTLEPeripheralTuple alloc] initRecentlySeenPairedHAPBLEPeripheral:v23];
    id v124 = v42;
    if (v42)
    {
      v45 = (void *)MEMORY[0x1D944E080]();
      v46 = self;
      v47 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v48 = v116 = v45;
        [v23 shortDescription];
        id v109 = v23;
        id v49 = v22;
        id v50 = v20;
        id v51 = v21;
        uint64_t v53 = v52 = v24;
        *(_DWORD *)buf = 138543874;
        v129 = v48;
        __int16 v130 = 2114;
        id v131 = v53;
        __int16 v132 = 2114;
        uint64_t v133 = (uint64_t)v124;
        _os_log_impl(&dword_1D4758000, v47, OS_LOG_TYPE_INFO, "%{public}@Adding accessory server: %{public}@ to recently seen paired peripherals: %{public}@", buf, 0x20u);

        id v24 = v52;
        id v21 = v51;
        id v20 = v50;
        id v22 = v49;
        id v23 = v109;

        v45 = v116;
      }

      v54 = [(HAPAccessoryServerBrowserBTLE *)v46 recentlySeenPairedPeripherals];
      v55 = [v23 identifier];
      id v42 = v124;
      [v54 setObject:v124 forKey:v55];
    }
    v117 = [(HAPAccessoryServerBrowserBTLE *)self cachedAccessoryForIdentifier:v19];
    v56 = [v117 peripheralInfo];
    long long v57 = [v56 stateNumber];
    if ([v57 isEqual:v20])
    {
      long long v58 = [v117 lastKeyBagIdentityIndexFailingPV];
      if (!v58)
      {
        int64_t v115 = +[HAPBLEAccessoryCache currentDiscoveryVersion];
        id v97 = v23;
        id v98 = v22;
        id v99 = v20;
        id v100 = v21;
        id v101 = v24;
        uint64_t v102 = [v117 discoveryVersion];

        BOOL v103 = v115 == v102;
        id v24 = v101;
        id v21 = v100;
        id v20 = v99;
        id v22 = v98;
        id v23 = v97;
        id v42 = v124;
        if (v103)
        {
          char v29 = 0;
          goto LABEL_38;
        }
LABEL_35:
        context = (void *)MEMORY[0x1D944E080]();
        v114 = self;
        long long v59 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          v108 = HMFGetLogIdentifier();
          v107 = [v23 identifier];
          v106 = [v117 peripheralInfo];
          v104 = [v106 stateNumber];
          id v105 = v22;
          id v110 = v23;
          id v60 = v20;
          id v61 = v21;
          id v62 = v24;
          uint64_t v63 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v117, "discoveryVersion"));
          v64 = objc_msgSend(NSNumber, "numberWithInteger:", +[HAPBLEAccessoryCache currentDiscoveryVersion](HAPBLEAccessoryCache, "currentDiscoveryVersion"));
          id v65 = [v117 lastKeyBagIdentityIndexFailingPV];
          *(_DWORD *)buf = 138544898;
          v129 = v108;
          __int16 v130 = 2114;
          id v131 = v107;
          __int16 v132 = 2114;
          uint64_t v133 = (uint64_t)v104;
          __int16 v134 = 2114;
          id v135 = v60;
          __int16 v136 = 2114;
          uint64_t v137 = v63;
          long long v66 = (void *)v63;
          __int16 v138 = 2114;
          uint64_t v139 = (uint64_t)v64;
          __int16 v140 = 2114;
          v141 = v65;
          _os_log_impl(&dword_1D4758000, v59, OS_LOG_TYPE_INFO, "%{public}@Creating accessory server for %{public}@ due to State Number: (%{public}@ -> %{public}@), BT Discovery Version: (%{public}@ -> %{public}@), KeyBagPVIndex: (%{public}@)", buf, 0x48u);

          id v24 = v62;
          id v21 = v61;
          id v20 = v60;
          id v22 = v105;
          id v23 = v110;

          id v42 = v124;
        }

        *a13 = 4;
        char v29 = 1;
LABEL_38:

        if (!v42) {
          goto LABEL_59;
        }
        goto LABEL_50;
      }
    }
    goto LABEL_35;
  }
  id v120 = v24;
  v123 = v42;
  if (v20)
  {
    v43 = [v42 stateNumber];
    char v44 = [v43 isEqualToNumber:v20];

    if (v44)
    {
      char v29 = 0;
      id v42 = v123;
      if (!v21) {
        goto LABEL_49;
      }
    }
    else
    {
      v74 = (void *)MEMORY[0x1D944E080]();
      v119 = self;
      v75 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
      {
        v111 = HMFGetLogIdentifier();
        contexta = v74;
        uint64_t v76 = [v123 stateNumber];
        [v123 monitorState];
        uint64_t v77 = HMFBooleanToString();
        uint64_t v78 = [v23 shortDescription];
        *(_DWORD *)buf = 138544642;
        v129 = v111;
        __int16 v130 = 2114;
        id v131 = v19;
        __int16 v132 = 2114;
        v79 = (void *)v76;
        uint64_t v133 = v76;
        __int16 v134 = 2114;
        id v135 = v20;
        __int16 v136 = 2114;
        uint64_t v137 = v77;
        v80 = (void *)v77;
        __int16 v138 = 2114;
        uint64_t v139 = v78;
        v81 = (void *)v78;
        _os_log_impl(&dword_1D4758000, v75, OS_LOG_TYPE_INFO, "%{public}@Accessory server: %{public}@ updated state number %{public}@ -> %{public}@. Monitoring state: %{public}@. %{public}@", buf, 0x3Eu);

        v74 = contexta;
      }

      id v42 = v123;
      char v29 = [v123 monitorState];
      *a12 = 1;
      *a13 = 4;
      if (!v21) {
        goto LABEL_49;
      }
    }
LABEL_41:
    long long v67 = [v42 category];
    char v68 = [v67 isEqualToNumber:v21];

    if ((v68 & 1) == 0)
    {
      long long v69 = (void *)MEMORY[0x1D944E080]();
      v70 = self;
      v71 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v72 = v118 = v70;
        __int16 v73 = [v123 category];
        *(_DWORD *)buf = 138544130;
        v129 = v72;
        __int16 v130 = 2114;
        id v131 = v19;
        __int16 v132 = 2114;
        uint64_t v133 = (uint64_t)v73;
        __int16 v134 = 2114;
        id v135 = v21;
        _os_log_impl(&dword_1D4758000, v71, OS_LOG_TYPE_INFO, "%{public}@Accessory server: %{public}@ updated category %{public}@ -> %{public}@", buf, 0x2Au);

        v70 = v118;
      }

      *a13 = 4;
      char v29 = 1;
    }
    id v24 = v120;
    id v42 = v123;
    goto LABEL_50;
  }
  char v29 = 0;
  if (v21) {
    goto LABEL_41;
  }
LABEL_49:
  id v24 = v120;
LABEL_50:
  id v121 = v20;
  id v82 = v21;
  if (v22)
  {
    id v83 = v24;
    v125 = v42;
    v84 = [v42 configNumber];
    id v85 = v22;
    if ([v84 isEqualToNumber:v22])
    {

      id v42 = v125;
    }
    else
    {
      char v86 = [v23 isCached];

      id v42 = v125;
      if ((v86 & 1) == 0)
      {
        v87 = (void *)MEMORY[0x1D944E080]();
        v88 = self;
        v89 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
        {
          v90 = HMFGetLogIdentifier();
          v91 = [v125 configNumber];
          *(_DWORD *)buf = 138544130;
          v129 = v90;
          __int16 v130 = 2114;
          id v131 = v19;
          __int16 v132 = 2114;
          uint64_t v133 = (uint64_t)v91;
          __int16 v134 = 2114;
          id v135 = v85;
          _os_log_impl(&dword_1D4758000, v89, OS_LOG_TYPE_INFO, "%{public}@Invalidating cache for accessory: %{public}@ on config number update %{public}@ -> %{public}@", buf, 0x2Au);

          id v42 = v125;
        }

        [(HAPAccessoryServerBrowserBTLE *)v88 removeCachedAccessoryWithIdentifier:v19];
        *a13 = 4;
        char v29 = 1;
      }
    }
  }
  else
  {
    id v85 = 0;
    id v83 = v24;
  }
  [v42 updateWithPeripheral:v23];

  id v24 = v83;
  id v21 = v82;
  id v20 = v121;
  id v22 = v85;
LABEL_59:

  return v29;
}

- (void)_reportReachabilityForAccessoryWithIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(HAPAccessoryServerBrowserBTLE *)self targetedScanAccessoryIdentifiers];
  [v5 containsObject:v4];

  v6 = [(HAPAccessoryServerBrowserBTLE *)self identifiersWithReachabilityScanTuples];
  v7 = [v6 objectForKey:v4];

  if ([(HAPAccessoryServerBrowser *)self isPaired:v4])
  {
    BOOL v8 = [(HAPAccessoryServerBrowserBTLE *)self delegate];
    [v8 accessoryServerBrowser:self didChangeReachability:1 forAccessoryServerWithIdentifier:v4];
  }
  if (v7)
  {
    BOOL v9 = [(HAPAccessoryServerBrowserBTLE *)self identifiersWithReachabilityScanTuples];
    [v9 removeObjectForKey:v4];

    dispatch_time_t v10 = (void *)MEMORY[0x1D944E080]();
    uint64_t v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      dispatch_source_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v20 = v13;
      __int16 v21 = 2114;
      id v22 = v4;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Reporting reachability for accessory in reachability scan with identifier %{public}@", buf, 0x16u);
    }
    uint64_t v14 = [v7 completion];

    if (v14)
    {
      uint64_t v15 = [v7 queue];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __79__HAPAccessoryServerBrowserBTLE__reportReachabilityForAccessoryWithIdentifier___block_invoke;
      v16[3] = &unk_1E69F46E0;
      id v17 = v7;
      id v18 = v4;
      dispatch_async(v15, v16);
    }
  }
}

void __79__HAPAccessoryServerBrowserBTLE__reportReachabilityForAccessoryWithIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completion];
  v2[2](v2, *(void *)(a1 + 40), 1);
}

- (void)_performTargetedScanForAccessoryWithIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HAPAccessoryServerBrowserBTLE *)self targetedScanAccessoryIdentifiers];
  [v5 addObject:v4];

  [(HAPAccessoryServerBrowserBTLE *)self _updateTargetedScanTimer];
  [(HAPAccessoryServerBrowserBTLE *)self _startBrowsingForLegacyHAPBTLE100Accessories];
  v6 = [(HAPAccessoryServerBrowserBTLE *)self hapWiProxBLEBrowser];
  [v6 resetLastSeenForTrackedAccessories:v4];

  id v7 = [(HAPAccessoryServerBrowserBTLE *)self hapWiProxBLEBrowser];
  [v7 startBrowsingForHAPBLEAccessories];
}

- (void)_connectPendingConnections
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D944E080](self, a2);
  id v4 = self;
  BOOL v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = HMFGetLogIdentifier();
    id v7 = [(HAPAccessoryServerBrowserBTLE *)v4 peripheralsPendingConnection];
    uint64_t v8 = [v7 count];
    BOOL v9 = [(HAPAccessoryServerBrowserBTLE *)v4 peripheralsWithConnectionRequests];
    *(_DWORD *)buf = 138543874;
    uint64_t v40 = v6;
    __int16 v41 = 2048;
    uint64_t v42 = v8;
    __int16 v43 = 2048;
    uint64_t v44 = [v9 count];
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Current pending connections: %tu, Connected/Connecting: %tu", buf, 0x20u);
  }
  dispatch_time_t v10 = [(HAPAccessoryServerBrowserBTLE *)v4 peripheralsPendingConnection];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v12 = [(HAPAccessoryServerBrowserBTLE *)v4 peripheralsPendingConnection];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id v15 = 0;
      uint64_t v16 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v35 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          id v19 = [(HAPAccessoryServerBrowserBTLE *)v4 _blePeripheralForAccessoryServerIdentifier:v18];
          id v20 = [(HAPAccessoryServerBrowserBTLE *)v4 recentlySeenPairedPeripherals];
          __int16 v21 = [v20 objectForKey:v18];

          if ([v21 connectionPriority] == 1 && v15 == 0) {
            id v15 = v19;
          }
          uint64_t v23 = [(HAPAccessoryServerBrowserBTLE *)v4 _discoveredAccessoryServerTupleForBLEPeripheral:v19 shouldMerge:0];
          id v24 = [v23 accessoryServer];
          [v24 updateConnectionIdleTime:2];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v14);

      if (v15) {
        goto LABEL_23;
      }
    }
    else
    {
    }
    char v32 = [(HAPAccessoryServerBrowserBTLE *)v4 peripheralsPendingConnection];
    v33 = [v32 lastObject];
    id v15 = [(HAPAccessoryServerBrowserBTLE *)v4 _blePeripheralForAccessoryServerIdentifier:v33];

    if (v15)
    {
LABEL_23:
      [(HAPAccessoryServerBrowserBTLE *)v4 _removeFromPendingConnections:v15];
      [(HAPAccessoryServerBrowserBTLE *)v4 _connectHAPPeripheralWhenAllowed:v15];

      return;
    }
    uint64_t v25 = (void *)MEMORY[0x1D944E080]();
    int v26 = v4;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = v28;
      char v29 = "%{public}@No peripheral to connect";
      v30 = v27;
      os_log_type_t v31 = OS_LOG_TYPE_ERROR;
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v25 = (void *)MEMORY[0x1D944E080]();
    int v26 = v4;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = v28;
      char v29 = "%{public}@No more pending connections";
      v30 = v27;
      os_log_type_t v31 = OS_LOG_TYPE_DEBUG;
LABEL_26:
      _os_log_impl(&dword_1D4758000, v30, v31, v29, buf, 0xCu);
    }
  }
}

- (void)_connectHAPPeripheralWhenAllowed:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(HAPAccessoryServerBrowserBTLE *)self qosLimits];
  v6 = (void *)MEMORY[0x1D944E080]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    BOOL v9 = HMFGetLogIdentifier();
    dispatch_time_t v10 = [v4 shortDescription];
    uint64_t v11 = [(HAPAccessoryServerBrowserBTLE *)v7 peripheralsWithConnectionRequests];
    uint64_t v12 = [v11 count];
    uint64_t v13 = [(HAPAccessoryServerBrowserBTLE *)v7 peripheralsPendingConnection];
    *(_DWORD *)buf = 138544130;
    long long v57 = v9;
    __int16 v58 = 2114;
    long long v59 = v10;
    __int16 v60 = 2048;
    uint64_t v61 = v12;
    __int16 v62 = 2048;
    uint64_t v63 = [v13 count];
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Connection request to peripheral: %{public}@, Current connection count : %tu, Pending: %tu", buf, 0x2Au);
  }
  if (v5 == 2) {
    goto LABEL_22;
  }
  if (v5 == 1)
  {
    uint64_t v14 = [(HAPAccessoryServerBrowserBTLE *)v7 connectionsObserver];

    if (v14)
    {
      id v15 = [(HAPAccessoryServerBrowserBTLE *)v7 connectionsObserver];
      int v16 = [v15 getAvailableHAPConnections];

      id v17 = (void *)MEMORY[0x1D944E080]();
      uint64_t v18 = v7;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v57 = v20;
        __int16 v58 = 1024;
        LODWORD(v59) = v16;
        _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_INFO, "%{public}@: Coex Recommendation = %d", buf, 0x12u);
      }
      int v21 = v16 >= 3 ? 3 : v16;
      int v22 = v16 >= 1 ? v21 : 3;
    }
    else
    {
      id v24 = (void *)MEMORY[0x1D944E080]();
      uint64_t v25 = v7;
      int v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v57 = v27;
        _os_log_impl(&dword_1D4758000, v26, OS_LOG_TYPE_DEBUG, "%{public}@: Not attached to connection observer", buf, 0xCu);
      }
      int v22 = 3;
    }
    uint64_t v28 = (void *)MEMORY[0x1D944E080]();
    char v29 = v7;
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      os_log_type_t v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v57 = v31;
      __int16 v58 = 1024;
      LODWORD(v59) = v22;
      _os_log_impl(&dword_1D4758000, v30, OS_LOG_TYPE_DEBUG, "%{public}@: Current available HAP BLE connections: %d", buf, 0x12u);
    }
    unint64_t v23 = v22;
  }
  else
  {
    unint64_t v23 = 3;
  }
  char v32 = [(HAPAccessoryServerBrowserBTLE *)v7 peripheralsWithConnectionRequests];
  unint64_t v33 = [v32 count];

  if (v33 < v23)
  {
LABEL_22:
    [(HAPAccessoryServerBrowserBTLE *)v7 _addToActiveConnections:v4];
    char v55 = 0;
    long long v34 = [(HAPAccessoryServerBrowserBTLE *)v7 _cbPeripheralForHAPBLEPeripheral:v4 routeMode:&v55];
    if (v34)
    {
      long long v35 = (void *)MEMORY[0x1D944E080]([v4 setCbPeripheral:v34]);
      long long v36 = v7;
      long long v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = HMFGetLogIdentifier();
        v39 = [v4 shortDescription];
        if (v55) {
          uint64_t v40 = @"WHB";
        }
        else {
          uint64_t v40 = @"Local";
        }
        __int16 v41 = NSNumber;
        uint64_t v42 = [(HAPAccessoryServerBrowserBTLE *)v36 peripheralsWithConnectionRequests];
        __int16 v43 = objc_msgSend(v41, "numberWithUnsignedInteger:", objc_msgSend(v42, "count"));
        *(_DWORD *)buf = 138544130;
        long long v57 = v38;
        __int16 v58 = 2114;
        long long v59 = v39;
        __int16 v60 = 2114;
        uint64_t v61 = (uint64_t)v40;
        __int16 v62 = 2114;
        uint64_t v63 = (uint64_t)v43;
        _os_log_impl(&dword_1D4758000, v37, OS_LOG_TYPE_INFO, "%{public}@Connecting accessory: %{public}@ - route %{public}@. Connections #: %{public}@", buf, 0x2Au);
      }
      uint64_t v44 = [(HAPAccessoryServerBrowserBTLE *)v36 centralManager];
      [v44 connectPeripheral:v34 options:0];
    }
    else
    {
      id v50 = (void *)MEMORY[0x1D944E080]();
      id v51 = v7;
      id v52 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        uint64_t v53 = HMFGetLogIdentifier();
        v54 = [v4 shortDescription];
        *(_DWORD *)buf = 138543618;
        long long v57 = v53;
        __int16 v58 = 2114;
        long long v59 = v54;
        _os_log_impl(&dword_1D4758000, v52, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve a CBPeripheral for accessory: %{public}@", buf, 0x16u);
      }
      uint64_t v44 = [MEMORY[0x1E4F28C58] hapErrorWithCode:8];
      [(HAPAccessoryServerBrowserBTLE *)v51 failedToConnectHAPPeripheral:v4 error:v44];
    }
  }
  else
  {
    uint64_t v45 = (void *)MEMORY[0x1D944E080]();
    v46 = v7;
    v47 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      v48 = HMFGetLogIdentifier();
      id v49 = [v4 shortDescription];
      *(_DWORD *)buf = 138543618;
      long long v57 = v48;
      __int16 v58 = 2114;
      long long v59 = v49;
      _os_log_impl(&dword_1D4758000, v47, OS_LOG_TYPE_DEBUG, "%{public}@: Pending connection to peripheral: %{public}@", buf, 0x16u);
    }
    [(HAPAccessoryServerBrowserBTLE *)v46 _addToPendingConnections:v4];
  }
}

- (void)_removeFromPendingConnections:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  peripheralsPendingConnection = self->_peripheralsPendingConnection;
  v6 = [v4 identifier];
  LODWORD(peripheralsPendingConnection) = [(NSMutableOrderedSet *)peripheralsPendingConnection containsObject:v6];

  if (peripheralsPendingConnection)
  {
    id v7 = self->_peripheralsPendingConnection;
    uint64_t v8 = [v4 identifier];
    [(NSMutableOrderedSet *)v7 removeObject:v8];

    os_unfair_lock_unlock(&self->super._lock);
    BOOL v9 = (void *)MEMORY[0x1D944E080]();
    dispatch_time_t v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      uint64_t v13 = [v4 shortDescription];
      int v14 = 138543618;
      id v15 = v12;
      __int16 v16 = 2114;
      id v17 = v13;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Removed pending connection for peripheral: %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->super._lock);
  }
}

- (void)_addToPendingConnections:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  peripheralsPendingConnection = self->_peripheralsPendingConnection;
  v6 = [v4 identifier];
  LOBYTE(peripheralsPendingConnection) = [(NSMutableOrderedSet *)peripheralsPendingConnection containsObject:v6];

  if (peripheralsPendingConnection)
  {
    os_unfair_lock_unlock(&self->super._lock);
  }
  else
  {
    id v7 = self->_peripheralsPendingConnection;
    uint64_t v8 = [v4 identifier];
    [(NSMutableOrderedSet *)v7 addObject:v8];

    os_unfair_lock_unlock(&self->super._lock);
    BOOL v9 = (void *)MEMORY[0x1D944E080]();
    dispatch_time_t v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      uint64_t v13 = [v4 shortDescription];
      int v14 = 138543618;
      id v15 = v12;
      __int16 v16 = 2114;
      id v17 = v13;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Pending connection to peripheral: %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (id)peripheralsPendingConnection
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)MEMORY[0x1E4F1C978];
  unint64_t v5 = [(NSMutableOrderedSet *)self->_peripheralsPendingConnection array];
  v6 = [v4 arrayWithArray:v5];

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)_removeFromActiveConnections:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  peripheralsWithConnectionRequests = self->_peripheralsWithConnectionRequests;
  v6 = [v4 identifier];
  LODWORD(peripheralsWithConnectionRequests) = [(NSMutableOrderedSet *)peripheralsWithConnectionRequests containsObject:v6];

  if (peripheralsWithConnectionRequests)
  {
    id v7 = self->_peripheralsWithConnectionRequests;
    uint64_t v8 = [v4 identifier];
    [(NSMutableOrderedSet *)v7 removeObject:v8];

    os_unfair_lock_unlock(&self->super._lock);
    BOOL v9 = (void *)MEMORY[0x1D944E080]();
    dispatch_time_t v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      uint64_t v13 = [v4 shortDescription];
      int v14 = 138543618;
      id v15 = v12;
      __int16 v16 = 2114;
      id v17 = v13;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Removed active connection for peripheral: %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->super._lock);
  }
}

- (void)_addToActiveConnections:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  peripheralsWithConnectionRequests = self->_peripheralsWithConnectionRequests;
  v6 = [v4 identifier];
  LOBYTE(peripheralsWithConnectionRequests) = [(NSMutableOrderedSet *)peripheralsWithConnectionRequests containsObject:v6];

  if (peripheralsWithConnectionRequests)
  {
    os_unfair_lock_unlock(&self->super._lock);
  }
  else
  {
    id v7 = self->_peripheralsWithConnectionRequests;
    uint64_t v8 = [v4 identifier];
    [(NSMutableOrderedSet *)v7 addObject:v8];

    os_unfair_lock_unlock(&self->super._lock);
    BOOL v9 = (void *)MEMORY[0x1D944E080]();
    dispatch_time_t v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      uint64_t v13 = [v4 shortDescription];
      int v14 = 138543618;
      id v15 = v12;
      __int16 v16 = 2114;
      id v17 = v13;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Adding active connection for peripheral: %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (id)peripheralsWithConnectionRequests
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)MEMORY[0x1E4F1C978];
  unint64_t v5 = [(NSMutableOrderedSet *)self->_peripheralsWithConnectionRequests array];
  v6 = [v4 arrayWithArray:v5];

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)_performTimedConnectionRequestForIdentifier:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = (void *)MEMORY[0x1D944E080]();
  v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v60 = v8;
    __int16 v61 = 2114;
    id v62 = v4;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Received request to perform a timed connection request for accessory with identifier %{public}@", buf, 0x16u);
  }
  BOOL v9 = [(HAPAccessoryServerBrowserBTLE *)v6 _bleAccessoryServerTupleForIdentifier:v4];
  dispatch_time_t v10 = [v9 accessoryServer];

  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x1D944E080]();
    uint64_t v12 = v6;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      id v15 = [v10 shortDescription];
      __int16 v16 = [v10 blePeripheral];
      id v17 = [v16 shortDescription];
      *(_DWORD *)buf = 138543874;
      __int16 v60 = v14;
      __int16 v61 = 2114;
      id v62 = v15;
      __int16 v63 = 2114;
      uint64_t v64 = v17;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_INFO, "%{public}@Found Accessory Server: %{public}@. Requesting discovery via peripheral: %{public}@", buf, 0x20u);
    }
    [v10 discoverAccessories];
    goto LABEL_29;
  }
  [(HAPAccessoryServerBrowserBTLE *)v6 _removeDiscoveredPeripheralsWithIdentifier:v4];
  uint64_t v18 = [(HAPAccessoryServerBrowserBTLE *)v6 targetedScanAccessoryIdentifiers];
  int v19 = [v18 containsObject:v4];

  if (!v19)
  {
    id v24 = [(HAPAccessoryServerBrowserBTLE *)v6 hapWiProxBLEBrowser];
    uint64_t v25 = [v24 trackedPeripheralForIdentifier:v4];

    int v26 = [(HAPAccessoryServerBrowserBTLE *)v6 recentlySeenPairedPeripherals];
    v27 = [v26 objectForKey:v4];

    if (v27 && [v25 isReachable])
    {
      uint64_t v28 = (void *)[v25 copy];
      char v29 = [v27 stateNumber];
      [v28 setStateNumber:v29];

      v30 = [v27 configNumber];
      [v28 setConfigNumber:v30];

      os_log_type_t v31 = [v27 category];
      [v28 setCategory:v31];
    }
    else
    {
      uint64_t v28 = 0;
    }
    char v32 = [v28 statusFlags];
    if ([v32 integerValue])
    {
      BOOL v33 = [(HAPAccessoryServerBrowser *)v6 isPaired:v4];

      if (v33)
      {
        long long v34 = (void *)MEMORY[0x1D944E080]();
        long long v35 = v6;
        long long v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v38 = long long v37 = v27;
          *(_DWORD *)buf = 138543618;
          __int16 v60 = v38;
          __int16 v61 = 2114;
          id v62 = v4;
          _os_log_impl(&dword_1D4758000, v36, OS_LOG_TYPE_INFO, "%{public}@Found recently seen paired peripheral has invalid pairing status. %{public}@ - Finding it again", buf, 0x16u);

          v27 = v37;
        }

        goto LABEL_25;
      }
    }
    else
    {
    }
    if (v28)
    {
      __int16 v58 = v27;
      v39 = (void *)MEMORY[0x1D944E080]([v28 setIsCached:1]);
      uint64_t v40 = v6;
      __int16 v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        uint64_t v42 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v60 = v42;
        __int16 v61 = 2114;
        id v62 = v28;
        _os_log_impl(&dword_1D4758000, v41, OS_LOG_TYPE_INFO, "%{public}@Found accessory in recently seen tuple. Creating a new accessory server from peripheral: %{public}@", buf, 0x16u);
      }
      long long v57 = [v28 name];
      v56 = [v28 identifier];
      char v55 = [v28 statusFlags];
      __int16 v43 = [v28 stateNumber];
      v54 = [v28 configNumber];
      uint64_t v44 = [v28 category];
      uint64_t v45 = [v28 advertisementFormat];
      v46 = [v28 setupHash];
      v47 = [v28 whbStableIdentifier];
      LOBYTE(v53) = 0;
      LOBYTE(v52) = 1;
      [(HAPAccessoryServerBrowserBTLE *)v40 _createHAPAccessoryAndNotifyDelegateWithPeripheral:v28 name:v57 pairingUsername:v56 statusFlags:v55 stateNumber:v43 stateChanged:0 connectReason:v52 configNumber:v54 category:v44 connectionIdleTime:v53 format:v45 setupHash:v46 encryptedPayload:0 whbStableIdentifier:v47];

      v27 = v58;
      goto LABEL_28;
    }
LABEL_25:
    v48 = (void *)MEMORY[0x1D944E080]();
    id v49 = v6;
    id v50 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      id v51 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v60 = v51;
      __int16 v61 = 2114;
      id v62 = v4;
      __int16 v63 = 2114;
      uint64_t v64 = v27;
      _os_log_impl(&dword_1D4758000, v50, OS_LOG_TYPE_INFO, "%{public}@Peripheral identifier without server %{public}@ - Finding it again. %{public}@", buf, 0x20u);
    }
    [(HAPAccessoryServerBrowserBTLE *)v49 _performTargetedScanForAccessoryWithIdentifier:v4];
LABEL_28:

    goto LABEL_29;
  }
  id v20 = (void *)MEMORY[0x1D944E080]();
  int v21 = v6;
  int v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    unint64_t v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v60 = v23;
    __int16 v61 = 2114;
    id v62 = v4;
    _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_INFO, "%{public}@Targeted scan is in progress for server identifier: %{public}@", buf, 0x16u);
  }
LABEL_29:
}

- (void)_createHAPAccessoryAndNotifyDelegateWithPeripheral:(id)a3 name:(id)a4 pairingUsername:(id)a5 statusFlags:(id)a6 stateNumber:(id)a7 stateChanged:(BOOL)a8 connectReason:(unsigned __int8)a9 configNumber:(id)a10 category:(id)a11 connectionIdleTime:(unsigned __int8)a12 format:(unint64_t)a13 setupHash:(id)a14 encryptedPayload:(id)a15 whbStableIdentifier:(id)a16
{
  BOOL v16 = a8;
  unsigned __int8 v111 = a9;
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  id v120 = a3;
  id v117 = a4;
  id v21 = a5;
  id v112 = a6;
  id v22 = a7;
  id v116 = a10;
  id v115 = a11;
  id v110 = a14;
  id v114 = a15;
  id v113 = a16;
  unint64_t v23 = (void *)MEMORY[0x1D944E080]();
  id v24 = self;
  uint64_t v25 = HMFGetOSLogHandle();
  v119 = v21;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    int v26 = HMFGetLogIdentifier();
    v27 = [v120 shortDescription];
    HMFBooleanToString();
    BOOL v28 = v16;
    v30 = id v29 = v22;
    os_log_type_t v31 = HMFBooleanToString();
    char v32 = [NSNumber numberWithUnsignedChar:a12];
    *(_DWORD *)buf = 138544642;
    id v131 = v26;
    __int16 v132 = 2114;
    id v133 = v27;
    __int16 v134 = 2048;
    unint64_t v135 = a13;
    __int16 v136 = 2114;
    uint64_t v137 = v30;
    __int16 v138 = 2114;
    uint64_t v139 = v31;
    __int16 v140 = 2114;
    v141 = v32;
    _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_INFO, "%{public}@Creating a HAPAccessoryServerBTLE instance for discovered peripheral: '%{public}@' V: '%tu', ST: '%{public}@' ENC: '%{public}@' CT: '%{public}@'", buf, 0x3Eu);

    id v22 = v29;
    BOOL v16 = v28;

    id v21 = v119;
  }

  char v129 = 0;
  if (![(HAPAccessoryServerBrowser *)v24 isPaired:v21])
  {
    id v43 = v22;
    uint64_t v44 = (void *)MEMORY[0x1D944E080]();
    uint64_t v45 = v24;
    v46 = HMFGetOSLogHandle();
    long long v35 = v112;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      v47 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v131 = v47;
      _os_log_impl(&dword_1D4758000, v46, OS_LOG_TYPE_INFO, "%{public}@This accessory is unpaired", buf, 0xCu);
    }
    __int16 v41 = 0;
    uint64_t v42 = v110;
    id v22 = v43;
    goto LABEL_64;
  }
  uint64_t v33 = [(HAPAccessoryServerBrowserBTLE *)v24 cachedAccessoryForIdentifier:v21];
  long long v34 = (void *)v33;
  long long v35 = v112;
  if (v114)
  {
    if ([v120 isCached])
    {
      id v36 = v22;
      long long v37 = (void *)MEMORY[0x1D944E080]();
      v38 = v24;
      v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v131 = v40;
        _os_log_impl(&dword_1D4758000, v39, OS_LOG_TYPE_DEBUG, "%{public}@The advertisement data is from the WiProxBTLE cache, so ignore and don't decrypt.", buf, 0xCu);
      }
      __int16 v41 = 0;
      id v21 = v119;
      uint64_t v42 = v110;
      id v22 = v36;
    }
    else
    {
      v48 = [(HAPAccessoryServerBrowserBTLE *)v24 hapCharacteristicsForEncryptedPayload:v114 identifier:v21 shouldConnect:&v129];
      if (v48)
      {
        __int16 v41 = v48;
        id v49 = [v48 firstObject];
        id v50 = [v49 stateNumber];

        if (v129)
        {
          id v22 = v50;
        }
        else
        {
          uint64_t v53 = [v34 peripheralInfo];
          v54 = [v53 stateNumber];
          char v55 = [v50 isEqual:v54];

          if (v55)
          {
            if (!v129)
            {
              v56 = (void *)MEMORY[0x1D944E080]();
              long long v57 = v24;
              __int16 v58 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
              {
                long long v59 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                id v131 = v59;
                __int16 v132 = 2114;
                id v133 = v119;
                _os_log_impl(&dword_1D4758000, v58, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring duplicate broadcast notification for accessory: %{public}@", buf, 0x16u);
              }
              long long v35 = v112;
              uint64_t v42 = v110;
              goto LABEL_76;
            }
          }
          else
          {
            char v129 = 1;
            unsigned __int8 v111 = 2;
          }
          id v22 = v50;
          long long v35 = v112;
        }
        id v21 = v119;
      }
      else
      {
        if (!v34)
        {
          v74 = (void *)MEMORY[0x1D944E080]();
          v75 = v24;
          uint64_t v76 = HMFGetOSLogHandle();
          uint64_t v42 = v110;
          if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v78 = id v77 = v22;
            *(_DWORD *)buf = 138543618;
            id v131 = v78;
            __int16 v132 = 2114;
            id v133 = v21;
            _os_log_impl(&dword_1D4758000, v76, OS_LOG_TYPE_INFO, "%{public}@No accessory cache found for: %{public}@", buf, 0x16u);

            id v22 = v77;
          }

          [(HAPAccessoryServerBrowserBTLE *)v75 _performTimedConnectionRequestForIdentifier:v21];
          long long v34 = 0;
          __int16 v41 = 0;
          goto LABEL_72;
        }
        __int16 v41 = 0;
        BOOL v16 = 1;
      }
      uint64_t v42 = v110;
    }
    v79 = [(HAPAccessoryServerBrowserBTLE *)v24 recentlySeenPairedPeripherals];
    v80 = [v79 objectForKey:v21];

    if (v117)
    {
      if (v35) {
        goto LABEL_44;
      }
    }
    else
    {
      v81 = [v34 peripheralInfo];
      id v117 = [v81 accessoryName];

      if (v35)
      {
LABEL_44:
        if (!v22) {
          goto LABEL_48;
        }
        goto LABEL_52;
      }
    }
    id v82 = [v34 peripheralInfo];
    long long v35 = [v82 statusFlags];

    if (!v22)
    {
LABEL_48:
      id v83 = [v80 stateNumber];
      v84 = v83;
      if (v83)
      {
        id v85 = v83;
      }
      else
      {
        char v86 = [v34 peripheralInfo];
        id v85 = [v86 stateNumber];
      }
      id v22 = v85;
    }
LABEL_52:
    if (!v116)
    {
      BOOL v87 = v16;
      id v88 = v22;
      v89 = [v80 configNumber];
      v90 = v89;
      if (v89)
      {
        id v116 = v89;
      }
      else
      {
        v91 = [v34 peripheralInfo];
        id v116 = [v91 configNumber];
      }
      id v22 = v88;
      BOOL v16 = v87;
    }
    if (!v115)
    {
      BOOL v92 = v16;
      id v93 = v22;
      v94 = [v80 category];
      v95 = v94;
      if (v94)
      {
        id v115 = v94;
      }
      else
      {
        v96 = [v34 peripheralInfo];
        id v115 = [v96 categoryIdentifier];
      }
      id v22 = v93;
      BOOL v16 = v92;
    }

    id v21 = v119;
    goto LABEL_63;
  }
  if (v33 && ([v120 isCached] & 1) == 0)
  {
    id v51 = [v34 peripheralInfo];
    uint64_t v52 = [v51 stateNumber];
    if ([v22 isEqual:v52])
    {

      __int16 v41 = 0;
      id v21 = v119;
      goto LABEL_15;
    }
    id v109 = v22;
    __int16 v60 = [v34 peripheralInfo];
    uint64_t v61 = [v60 broadcastKey];
    if (v61)
    {
      id v62 = (void *)v61;
      __int16 v63 = [v34 peripheralInfo];
      uint64_t v64 = [v63 keyUpdatedStateNumber];

      if (v64)
      {
        uint64_t v65 = (void *)MEMORY[0x1D944E080]();
        long long v66 = v24;
        long long v67 = HMFGetOSLogHandle();
        long long v35 = v112;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          char v68 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v131 = v68;
          __int16 v132 = 2114;
          id v133 = v119;
          _os_log_impl(&dword_1D4758000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory: %{public}@ should be broadcast notifying.", buf, 0x16u);
        }
        double Current = CFAbsoluteTimeGetCurrent();
        v70 = [v34 peripheralInfo];
        [v70 keyUpdatedTime];
        double v72 = Current - v71;

        __int16 v41 = 0;
        unsigned __int8 v73 = a9;
        if (v72 > 86400.0) {
          unsigned __int8 v73 = 3;
        }
        unsigned __int8 v111 = v73;
        char v129 = 1;
        goto LABEL_79;
      }
    }
    else
    {
    }
    __int16 v41 = 0;
    long long v35 = v112;
LABEL_79:
    id v21 = v119;
    id v22 = v109;
    uint64_t v42 = v110;
    goto LABEL_63;
  }
  __int16 v41 = 0;
LABEL_15:
  uint64_t v42 = v110;
LABEL_63:

LABEL_64:
  if (a13 == 1 || a13 == 2) {
    id v97 = (objc_class *)objc_opt_class();
  }
  else {
    id v97 = 0;
  }
  id v98 = [v97 alloc];
  id v99 = [(HAPAccessoryServerBrowser *)v24 keyStore];
  LOBYTE(v108) = a12;
  LOBYTE(v107) = v111;
  long long v34 = (void *)[v98 initWithPeripheral:v120 name:v117 pairingUsername:v21 statusFlags:v35 stateNumber:v22 stateChanged:v16 connectReason:v107 configNumber:v116 category:v115 setupHash:v42 connectionIdleTime:v108 browser:v24 keyStore:v99 whbStableIdentifier:v113];

  if (v34)
  {
    id v100 = +[HAPDiscoveredBTLEAccessoryServerTuple discoveredAccessoryServerTupleWithAccessoryServer:v34];
    id v101 = [(HAPAccessoryServerBrowserBTLE *)v24 discoveredPeripheralsWithAccessories];
    [v101 setObject:v100 forKey:v120];

    if ([(HAPAccessoryServerBrowserBTLE *)v24 _delegateRespondsToSelector:sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_])
    {
      uint64_t v102 = [(HAPAccessoryServerBrowserBTLE *)v24 delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __251__HAPAccessoryServerBrowserBTLE__createHAPAccessoryAndNotifyDelegateWithPeripheral_name_pairingUsername_statusFlags_stateNumber_stateChanged_connectReason_configNumber_category_connectionIdleTime_format_setupHash_encryptedPayload_whbStableIdentifier___block_invoke;
      block[3] = &unk_1E69F1440;
      id v122 = v41;
      v123 = v24;
      id v124 = v34;
      id v125 = v119;
      char v127 = v129;
      BOOL v128 = v16;
      id v126 = v22;
      dispatch_async(v102, block);
    }
LABEL_72:
    id v50 = v22;
    goto LABEL_76;
  }
  id v50 = v22;
  BOOL v103 = (void *)MEMORY[0x1D944E080]();
  v104 = v24;
  id v105 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
  {
    v106 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v131 = v106;
    __int16 v132 = 2114;
    id v133 = v120;
    _os_log_impl(&dword_1D4758000, v105, OS_LOG_TYPE_ERROR, "%{public}@Failed to create a HAPAccessoryServerBTLE instance for discovered peripheral %{public}@", buf, 0x16u);
  }
  long long v34 = 0;
LABEL_76:
}

void __251__HAPAccessoryServerBrowserBTLE__createHAPAccessoryAndNotifyDelegateWithPeripheral_name_pairingUsername_statusFlags_stateNumber_stateChanged_connectReason_configNumber_category_connectionIdleTime_format_setupHash_encryptedPayload_whbStableIdentifier___block_invoke(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    goto LABEL_4;
  }
  id v2 = [*(id *)(a1 + 40) delegate];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  unint64_t v5 = *(void **)(a1 + 32);
  v6 = [v5 firstObject];
  id v7 = [v6 stateNumber];
  [v2 accessoryServerBrowser:v4 accessoryServer:v3 didUpdateValuesForCharacteristics:v5 stateNumber:v7 broadcast:1];

  uint64_t v8 = *(void *)(a1 + 56);
  BOOL v9 = *(void **)(a1 + 40);
  dispatch_time_t v10 = [*(id *)(a1 + 32) firstObject];
  uint64_t v11 = [v10 stateNumber];
  [v9 updateStateForIdentifier:v8 stateNumber:v11];

  if (!*(void *)(a1 + 32) || *(unsigned char *)(a1 + 72))
  {
LABEL_4:
    id v12 = [*(id *)(a1 + 40) delegate];
    [v12 accessoryServerBrowser:*(void *)(a1 + 40) didFindAccessoryServer:*(void *)(a1 + 48) stateChanged:*(unsigned __int8 *)(a1 + 73) stateNumber:*(void *)(a1 + 64)];
  }
}

- (id)hapCharacteristicsForEncryptedPayload:(id)a3 identifier:(id)a4 shouldConnect:(BOOL *)a5
{
  uint64_t v159 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [v8 cStringUsingEncoding:4];
  [v8 length];
  TextToHardwareAddress();
  BOOL v9 = [(HAPAccessoryServerBrowserBTLE *)self cachedAccessoryForIdentifier:v8];
  dispatch_time_t v10 = v9;
  if (v9)
  {
    __int16 v130 = self;
    uint64_t v11 = [v9 peripheralInfo];
    id v12 = [v11 stateNumber];
    unsigned __int16 v13 = [v12 unsignedShortValue] + 1;

    unsigned __int16 v144 = v13;
    id v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v144 length:2];
    id v15 = [v10 peripheralInfo];
    BOOL v16 = [v15 broadcastKey];

    id v17 = objc_msgSend(v7, "subdataWithRange:", objc_msgSend(v7, "length") - 4, 4);
    uint64_t v18 = objc_msgSend(v7, "subdataWithRange:", 0, objc_msgSend(v7, "length") - 4);
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", objc_msgSend(v18, "length"));
    id v20 = (void *)v19;
    BOOL v128 = v17;
    id v129 = v7;
    if (!v16)
    {
      v47 = (void *)v19;
      v48 = (void *)MEMORY[0x1D944E080]();
      id v49 = v130;
      id v50 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v52 = id v51 = v18;
        *(_DWORD *)buf = 138543618;
        v148 = v52;
        __int16 v149 = 2114;
        uint64_t v150 = (uint64_t)v8;
        _os_log_impl(&dword_1D4758000, v50, OS_LOG_TYPE_ERROR, "%{public}@[Enc Adv] No keys to decrypt for accessory: %{public}@", buf, 0x16u);

        uint64_t v18 = v51;
      }

      __int16 v41 = 0;
      uint64_t v42 = 0;
      if (a5) {
        *a5 = 1;
      }
      goto LABEL_42;
    }
    v123 = v16;
    id v124 = v10;
    id v126 = v8;
    id v138 = v16;
    [v138 bytes];
    id v14 = v14;
    [v14 bytes];
    char v127 = v18;
    id v21 = v18;
    [v21 bytes];
    id v136 = v21;
    [v21 length];
    id v125 = v20;
    id v140 = v20;
    [v140 mutableBytes];
    id v22 = v17;
    [v22 bytes];
    id v134 = v22;
    uint64_t v121 = [v22 length];
    int v23 = chacha20_poly1305_decrypt_all_64x64_ex();
    if (v23)
    {
      int v24 = v23;
      uint64_t v25 = 0;
      do
      {
        int v26 = v25 - 1;
        uint64_t v143 = v25 - 1 + v144;
        if (v25 != 1)
        {
          v27 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v143, 8, v121);

          [v138 bytes];
          id v28 = v27;
          [v28 bytes];
          id v29 = v21;
          [v29 bytes];
          [v29 length];
          [v140 mutableBytes];
          id v30 = v134;
          [v30 bytes];
          uint64_t v121 = [v30 length];
          uint64_t v31 = chacha20_poly1305_decrypt_all_64x64_ex();
          if (!v31)
          {
            uint64_t v53 = (void *)MEMORY[0x1D944E080](v31);
            v54 = v130;
            char v55 = HMFGetOSLogHandle();
            id v8 = v126;
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
            {
              v56 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v148 = v56;
              __int16 v149 = 2048;
              uint64_t v150 = v143;
              __int16 v151 = 2114;
              *(void *)v152 = v126;
              _os_log_impl(&dword_1D4758000, v55, OS_LOG_TYPE_DEBUG, "%{public}@[Enc Adv] Decrypted with State Number: %llu for accessory: %{public}@", buf, 0x20u);
            }
            id v14 = v28;
            uint64_t v18 = v127;
            if (a5 && v26 >= 1) {
              *a5 = 1;
            }
            goto LABEL_31;
          }
          int v24 = v31;
          id v14 = v28;
        }
        ++v25;
      }
      while (v25 != 6);
      char v32 = (void *)MEMORY[0x1D944E080]();
      uint64_t v33 = v130;
      long long v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        long long v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v148 = v35;
        __int16 v149 = 2048;
        uint64_t v150 = v24;
        __int16 v151 = 1024;
        *(_DWORD *)v152 = v144;
        *(_WORD *)&v152[4] = 2114;
        *(void *)&v152[6] = v126;
        _os_log_impl(&dword_1D4758000, v34, OS_LOG_TYPE_ERROR, "%{public}@[Enc Adv] Failed to decrypt status: %ld, expected s#: %d for accessory: %{public}@", buf, 0x26u);
      }
      id v36 = (void *)MEMORY[0x1D944E080]();
      long long v37 = v33;
      v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        v39 = HMFGetLogIdentifier();
        uint64_t v40 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v145 length:6];
        *(_DWORD *)buf = 138545154;
        v148 = v39;
        __int16 v149 = 2112;
        uint64_t v150 = (uint64_t)v136;
        __int16 v151 = 1024;
        *(_DWORD *)v152 = v24;
        *(_WORD *)&v152[4] = 2112;
        *(void *)&v152[6] = v138;
        *(_WORD *)&v152[14] = 2112;
        *(void *)&v152[16] = v136;
        __int16 v153 = 2112;
        id v154 = v14;
        __int16 v155 = 2112;
        v156 = v40;
        __int16 v157 = 2112;
        id v158 = v134;
        _os_log_impl(&dword_1D4758000, v38, OS_LOG_TYPE_DEBUG, "%{public}@[Enc Adv] Failed to decrypt: %@, status: %d, key: %@, enc data: %@, nonce: %@, aad: %@ authTag: %@", buf, 0x4Eu);
      }
      id v8 = v126;
      [(HAPAccessoryServerBrowserBTLE *)v37 updateBroadcastKeyForIdentifier:v126 key:0 keyUpdatedStateNumber:0 keyUpdatedTime:0.0];
      uint64_t v18 = v127;
      if (a5)
      {
        __int16 v41 = 0;
        uint64_t v42 = 0;
        *a5 = 1;
        goto LABEL_40;
      }
      goto LABEL_39;
    }
    uint64_t v18 = v127;
LABEL_31:
    long long v57 = (void *)MEMORY[0x1D944E080]();
    __int16 v58 = v130;
    long long v59 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      __int16 v60 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v148 = v60;
      __int16 v149 = 2114;
      uint64_t v150 = (uint64_t)v8;
      __int16 v151 = 2112;
      *(void *)v152 = v140;
      _os_log_impl(&dword_1D4758000, v59, OS_LOG_TYPE_INFO, "%{public}@[Enc Adv]: Decrypted data from %{public}@: %@", buf, 0x20u);

      uint64_t v18 = v127;
    }

    id v61 = v140;
    id v62 = (unsigned __int16 *)[v61 bytes];
    if ((unint64_t)[v61 length] < 5)
    {
LABEL_39:
      __int16 v41 = 0;
      uint64_t v42 = 0;
LABEL_40:
      BOOL v16 = v123;
      dispatch_time_t v10 = v124;
      goto LABEL_41;
    }
    id v141 = [NSNumber numberWithInteger:*v62];
    uint64_t v63 = [NSNumber numberWithInteger:v62[1]];
    uint64_t v64 = (void *)MEMORY[0x1D944E080]();
    uint64_t v65 = v58;
    long long v66 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      long long v67 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v148 = v67;
      __int16 v149 = 2114;
      uint64_t v150 = (uint64_t)v141;
      __int16 v151 = 2114;
      *(void *)v152 = v63;
      *(_WORD *)&v152[8] = 2114;
      *(void *)&v152[10] = v8;
      _os_log_impl(&dword_1D4758000, v66, OS_LOG_TYPE_DEBUG, "%{public}@[Enc Adv]: State Num: %{public}@ Instance Id: %{public}@ for accessory: %{public}@", buf, 0x2Au);

      uint64_t v18 = v127;
    }

    char v68 = [(HAPAccessoryServerBrowserBTLE *)v65 _cachedCharacteristicForInstanceID:v63 identifier:v8];
    long long v69 = v68;
    id v139 = (id)v63;
    if (!v68)
    {
      uint64_t v76 = (void *)MEMORY[0x1D944E080]();
      id v77 = v65;
      uint64_t v78 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
      {
        v79 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v148 = v79;
        __int16 v149 = 2114;
        uint64_t v150 = (uint64_t)v8;
        __int16 v151 = 2114;
        *(void *)v152 = v63;
        _os_log_impl(&dword_1D4758000, v78, OS_LOG_TYPE_INFO, "%{public}@[Enc Adv] No Cached signature for accessory: %{public}@ instanceid: %{public}@", buf, 0x20u);

        uint64_t v18 = v127;
      }

      BOOL v16 = v123;
      dispatch_time_t v10 = v124;
      unsigned __int8 v73 = 0;
      v80 = v141;
      goto LABEL_80;
    }
    id v135 = v14;
    v70 = [v68 characteristicMetadata];
    double v71 = [v70 format];
    uint64_t v72 = HAPCharacteristicFormatFromString(v71);
    unsigned __int8 v73 = v69;
    if ((unint64_t)(v72 - 1) > 9) {
      uint64_t v74 = 0;
    }
    else {
      uint64_t v74 = qword_1D4912D40[v72 - 1];
    }

    v81 = (void *)MEMORY[0x1D944E080]();
    id v82 = v65;
    id v83 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
    {
      v84 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v148 = v84;
      __int16 v149 = 2048;
      uint64_t v150 = v74;
      _os_log_impl(&dword_1D4758000, v83, OS_LOG_TYPE_DEBUG, "%{public}@[Enc Adv]: Value Length %lu", buf, 0x16u);

      uint64_t v18 = v127;
    }

    unint64_t v85 = [v61 length];
    if (!v74 || (unint64_t v86 = v74 + 4, v85 < v74 + 4))
    {
      v96 = (void *)MEMORY[0x1D944E080](v85);
      id v97 = v82;
      id v98 = HMFGetOSLogHandle();
      id v8 = v126;
      if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
      {
        id v99 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v148 = v99;
        __int16 v149 = 2048;
        uint64_t v150 = v74;
        __int16 v151 = 2114;
        *(void *)v152 = v126;
        _os_log_impl(&dword_1D4758000, v98, OS_LOG_TYPE_ERROR, "%{public}@[Enc Adv] Failed to extract value with length: %lu for accessory: %{public}@", buf, 0x20u);

        uint64_t v18 = v127;
      }

      __int16 v41 = 0;
      uint64_t v42 = 0;
      BOOL v16 = v123;
      dispatch_time_t v10 = v124;
      id v14 = v135;
      v80 = v141;
      goto LABEL_79;
    }
    uint64_t v87 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v62 + 2 length:v74];
    id v88 = +[HAPDataValueTransformer defaultDataValueTransformer];
    id v137 = v73;
    v89 = [v73 characteristicMetadata];
    v90 = [v89 format];
    id v142 = 0;
    id v131 = (void *)v87;
    id v133 = [v88 reverseTransformedValue:v87 format:HAPCharacteristicFormatFromString(v90) error:&v142];
    id v122 = v142;

    v91 = (void *)MEMORY[0x1D944E080]();
    BOOL v92 = v82;
    id v93 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
    {
      v94 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v148 = v94;
      __int16 v149 = 2112;
      uint64_t v150 = (uint64_t)v131;
      __int16 v151 = 2112;
      *(void *)v152 = v133;
      *(_WORD *)&v152[8] = 2114;
      *(void *)&v152[10] = v126;
      _os_log_impl(&dword_1D4758000, v93, OS_LOG_TYPE_DEBUG, "%{public}@[Enc Adv]: Value Data: %@, Value: %@ for accessory: %{public}@", buf, 0x2Au);
    }
    if (([v137 characteristicProperties] & 0x100) != 0)
    {
      if ([v61 length] <= v86)
      {
        id v100 = (void *)MEMORY[0x1D944E080]();
        id v101 = v92;
        uint64_t v102 = HMFGetOSLogHandle();
        BOOL v16 = v123;
        dispatch_time_t v10 = v124;
        if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
        {
          BOOL v103 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v148 = v103;
          _os_log_impl(&dword_1D4758000, v102, OS_LOG_TYPE_DEBUG, "%{public}@[Enc Adv]: Notification context is not included in payload", buf, 0xCu);
        }
        v95 = 0;
LABEL_71:
        uint64_t v108 = [HAPCharacteristic alloc];
        id v109 = [v137 characteristicUUID];
        id v110 = [v109 UUIDString];
        uint64_t v111 = [v137 characteristicProperties];
        id v112 = [v137 characteristicMetadata];
        LOBYTE(v121) = 1;
        __int16 v41 = [(HAPCharacteristic *)v108 initWithType:v110 instanceID:v139 value:v133 stateNumber:v141 properties:v111 eventNotificationsEnabled:0 implicitWriteWithResponse:v121 metadata:v112];

        if (v41)
        {
          id v113 = (void *)MEMORY[0x1D944E080]([(HAPCharacteristic *)v41 setNotificationContext:v95]);
          id v114 = v92;
          id v115 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
          {
            id v116 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v148 = v116;
            __int16 v149 = 2112;
            uint64_t v150 = (uint64_t)v41;
            __int16 v151 = 2114;
            *(void *)v152 = v126;
            _os_log_impl(&dword_1D4758000, v115, OS_LOG_TYPE_INFO, "%{public}@[Enc Adv]: Returning characteristic: %@ for accessory: %{public}@", buf, 0x20u);
          }
          v146 = v41;
          uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v146 count:1];
          uint64_t v18 = v127;
          v80 = v141;
          unsigned __int8 v73 = v137;
        }
        else
        {
          id v117 = (void *)MEMORY[0x1D944E080]();
          v118 = v92;
          v119 = HMFGetOSLogHandle();
          unsigned __int8 v73 = v137;
          if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
          {
            id v120 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v148 = v120;
            __int16 v149 = 2112;
            uint64_t v150 = (uint64_t)v137;
            __int16 v151 = 2114;
            *(void *)v152 = v126;
            _os_log_impl(&dword_1D4758000, v119, OS_LOG_TYPE_INFO, "%{public}@[Enc Adv]: Failed to create HAPCharacteristic from: %@ for accessory: %{public}@", buf, 0x20u);
          }
          uint64_t v42 = 0;
          uint64_t v18 = v127;
          v80 = v141;
        }

        id v8 = v126;
        id v14 = v135;
        if (v41)
        {
LABEL_79:

LABEL_41:
          v47 = v125;
LABEL_42:

          id v7 = v129;
          goto LABEL_43;
        }
LABEL_80:

        __int16 v41 = 0;
        uint64_t v42 = 0;
        goto LABEL_41;
      }
      if (*((unsigned char *)v62 + v86) == 1)
      {
        v95 = _notificationContextTLVDataFromPayload((uint64_t)v62, [v61 length], v74 + 5, v92);
LABEL_70:
        BOOL v16 = v123;
        dispatch_time_t v10 = v124;
        goto LABEL_71;
      }
      v104 = (void *)MEMORY[0x1D944E080]();
      id v105 = v92;
      v106 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v107 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v148 = v107;
        _os_log_impl(&dword_1D4758000, v106, OS_LOG_TYPE_DEBUG, "%{public}@[Enc Adv]: Notification context is not present in payload", buf, 0xCu);
      }
    }
    v95 = 0;
    goto LABEL_70;
  }
  id v43 = (void *)MEMORY[0x1D944E080]();
  uint64_t v44 = self;
  uint64_t v45 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
  {
    v46 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v148 = v46;
    __int16 v149 = 2114;
    uint64_t v150 = (uint64_t)v8;
    _os_log_impl(&dword_1D4758000, v45, OS_LOG_TYPE_ERROR, "%{public}@[Enc Adv] No cached accessory for: %{public}@", buf, 0x16u);
  }
  uint64_t v42 = 0;
  if (a5) {
    *a5 = 1;
  }
LABEL_43:

  return v42;
}

- (BOOL)_delegateRespondsToSelector:(SEL)a3
{
  uint64_t v4 = [(HAPAccessoryServerBrowserBTLE *)self delegate];
  if (v4)
  {
    unint64_t v5 = [(HAPAccessoryServerBrowserBTLE *)self delegateQueue];
    if (v5)
    {
      v6 = [(HAPAccessoryServerBrowserBTLE *)self delegate];
      char v7 = objc_opt_respondsToSelector();
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (id)_cachedCharacteristicForInstanceID:(id)a3 identifier:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [(HAPAccessoryServerBrowserBTLE *)self cachedAccessoryForIdentifier:a4];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = [v7 cachedServices];
  uint64_t v24 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v24)
  {
    uint64_t v9 = *(void *)v30;
    uint64_t v22 = *(void *)v30;
    int v23 = v7;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v8);
        }
        uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v12 = [v11 cachedCharacteristics];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v26;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v26 != v15) {
                objc_enumerationMutation(v12);
              }
              id v17 = *(void **)(*((void *)&v25 + 1) + 8 * j);
              uint64_t v18 = [v17 characteristicInstanceId];
              char v19 = [v18 isEqual:v6];

              if (v19)
              {
                id v20 = v17;

                char v7 = v23;
                goto LABEL_19;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        uint64_t v9 = v22;
      }
      id v20 = 0;
      char v7 = v23;
      uint64_t v24 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v24);
  }
  else
  {
    id v20 = 0;
  }
LABEL_19:

  return v20;
}

- (id)retrieveCBPeripheralWithUUID:(id)a3 blePeripheral:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 whbStableIdentifier];
  if (v8)
  {
    uint64_t v9 = [(HAPAccessoryServerBrowserBTLE *)self _cbPeripheralForPeripheralUUID:v6 stableIdentifier:v8 routeMode:0];
  }
  else
  {
    dispatch_time_t v10 = [v7 identifier];
    uint64_t v9 = [(HAPAccessoryServerBrowserBTLE *)self _cbPeripheralForPeripheralUUID:v6 stableIdentifier:v10 routeMode:0];
  }

  return v9;
}

- (void)accessoryServerBrowserBTLE:(id)a3 didDiscoverHAPPeripheral:(id)a4
{
  id v16 = a4;
  unint64_t v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (v16)
  {
    uint64_t v15 = [v16 name];
    id v6 = [v16 identifier];
    uint64_t v7 = [v16 advertisementFormat];
    id v8 = [v16 statusFlags];
    uint64_t v9 = [v16 stateNumber];
    dispatch_time_t v10 = [v16 category];
    uint64_t v11 = [v16 configNumber];
    id v12 = [v16 setupHash];
    uint64_t v13 = [v16 encryptedPayload];
    uint64_t v14 = [v16 whbStableIdentifier];
    [(HAPAccessoryServerBrowserBTLE *)self _didDiscoverPeripheral:v16 accessoryName:v15 pairingIdentifier:v6 format:v7 statusFlags:v8 stateNumber:v9 category:v10 configNumber:v11 setupHash:v12 encryptedPayload:v13 whbStableIdentifier:v14];
  }
}

- (id)_bleAccessoryServerTupleForIdentifier:(id)a3
{
  uint64_t v4 = [(HAPAccessoryServerBrowserBTLE *)self _blePeripheralForAccessoryServerIdentifier:a3];
  if (v4)
  {
    unint64_t v5 = [(HAPAccessoryServerBrowserBTLE *)self discoveredPeripheralsWithAccessories];
    id v6 = [v5 objectForKey:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_blePeripheralForAccessoryServerIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unint64_t v5 = [(HAPAccessoryServerBrowserBTLE *)self discoveredPeripheralsWithAccessories];
  id v6 = [v5 keyEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v12 = [(HAPAccessoryServerBrowserBTLE *)self discoveredPeripheralsWithAccessories];
        uint64_t v13 = [v12 objectForKey:v11];
        uint64_t v14 = [(id)v13 accessoryServer];

        uint64_t v15 = [v14 identifier];
        LOBYTE(v13) = [v15 isEqual:v4];

        if (v13)
        {
          id v16 = v11;

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_11:

  return v16;
}

- (id)_blePeripheralForCBPeripheral:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 identifier];

  if (!v5)
  {
    long long v26 = 0;
    goto LABEL_27;
  }
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v7 = [(HAPAccessoryServerBrowserBTLE *)self discoveredPeripheralsWithAccessories];
  uint64_t v8 = [v7 keyEnumerator];
  uint64_t v9 = [v8 allObjects];

  id obj = v9;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v45 objects:v50 count:16];
  v38 = v6;
  if (!v10) {
    goto LABEL_14;
  }
  uint64_t v11 = v10;
  uint64_t v40 = *(void *)v46;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v46 != v40) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void **)(*((void *)&v45 + 1) + 8 * i);
      uint64_t v14 = self;
      uint64_t v15 = [(HAPAccessoryServerBrowserBTLE *)self discoveredPeripheralsWithAccessories];
      id v16 = [v15 objectForKey:v13];
      id v17 = [v16 accessoryServer];

      if (v17)
      {
        long long v18 = [v13 cbPeripheral];
        if ([v18 isEqual:v4])
        {
        }
        else
        {
          long long v19 = [v13 peripheralUUIDs];
          [v4 identifier];
          v21 = id v20 = v4;
          int v22 = [v19 containsObject:v21];

          id v4 = v20;
          id v6 = v38;

          if (!v22) {
            goto LABEL_12;
          }
        }
        [v6 addObject:v13];
      }
LABEL_12:

      self = v14;
    }
    uint64_t v11 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  }
  while (v11);
LABEL_14:

  unint64_t v23 = [v6 count];
  uint64_t v24 = [v6 firstObject];
  long long v25 = v6;
  long long v26 = (void *)v24;
  if (v23 >= 2)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v27 = v25;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v42 != v30) {
            objc_enumerationMutation(v27);
          }
          long long v32 = *(void **)(*((void *)&v41 + 1) + 8 * j);
          [v32 lastSeen];
          double v34 = v33;
          [v26 lastSeen];
          if (v34 - v35 > 0.0)
          {
            id v36 = v32;

            long long v26 = v36;
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v29);
    }
  }
LABEL_27:

  return v26;
}

- (id)_cbPeripheralForPeripheralUUID:(id)a3 stableIdentifier:(id)a4 routeMode:(unsigned __int8 *)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a5) {
      *a5 = 0;
    }
    id v6 = a3;
    uint64_t v7 = [(HAPAccessoryServerBrowserBTLE *)self centralManager];
    v12[0] = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

    uint64_t v9 = [v7 retrievePeripheralsWithIdentifiers:v8];
    uint64_t v10 = [v9 firstObject];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_cbPeripheralForHAPBLEPeripheral:(id)a3 routeMode:(unsigned __int8 *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 peripheralUUIDs];
  uint64_t v8 = [v7 lastObject];
  uint64_t v9 = [v6 whbStableIdentifier];
  if (v9)
  {
    uint64_t v10 = [(HAPAccessoryServerBrowserBTLE *)self _cbPeripheralForPeripheralUUID:v8 stableIdentifier:v9 routeMode:a4];
  }
  else
  {
    uint64_t v11 = [v6 identifier];
    uint64_t v10 = [(HAPAccessoryServerBrowserBTLE *)self _cbPeripheralForPeripheralUUID:v8 stableIdentifier:v11 routeMode:a4];
  }

  return v10;
}

- (void)_monitorDisconnectionOfHAPPeripheral:(id)a3 peripheral:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HAPAccessoryServerBrowser *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    uint64_t v9 = [(HAPAccessoryServerBrowserBTLE *)self peripheralDisconnectionMonitorMap];
    uint64_t v10 = [v9 objectForKey:v7];

    if (!v10)
    {
      uint64_t v11 = [(HAPAccessoryServerBrowser *)self workQueue];
      id v12 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v11);

      uint64_t v13 = [(HAPAccessoryServerBrowserBTLE *)self peripheralDisconnectionMonitorMap];
      [v13 setObject:v12 forKey:v7];

      objc_initWeak(&location, self);
      dispatch_time_t v14 = dispatch_time(0, 1000000000* [(HAPAccessoryServerBrowserBTLE *)self peripheralDisconnectionTimeout]);
      dispatch_source_set_timer(v12, v14, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __81__HAPAccessoryServerBrowserBTLE__monitorDisconnectionOfHAPPeripheral_peripheral___block_invoke;
      v15[3] = &unk_1E69F45E0;
      objc_copyWeak(&v18, &location);
      id v16 = v7;
      id v17 = v6;
      dispatch_source_set_event_handler(v12, v15);
      dispatch_resume(v12);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

void __81__HAPAccessoryServerBrowserBTLE__monitorDisconnectionOfHAPPeripheral_peripheral___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained peripheralDisconnectionMonitorMap];
  id v4 = [v3 objectForKey:*(void *)(a1 + 32)];

  if (v4)
  {
    unint64_t v5 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:8];
    id v6 = (void *)MEMORY[0x1D944E080]();
    id v7 = WeakRetained;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138543874;
      id v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to disconnect from peripheral: %@ with error: %{public}@", (uint8_t *)&v11, 0x20u);
    }
    [v7 disconnectedHAPPeripheral:*(void *)(a1 + 40) error:v5];
  }
}

- (void)_stopMonitorDisconnectionOfCBPeripheral:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    unint64_t v5 = [(HAPAccessoryServerBrowserBTLE *)self peripheralDisconnectionMonitorMap];
    id v6 = [v5 objectForKey:v8];

    if (v6)
    {
      dispatch_source_cancel(v6);
      id v7 = [(HAPAccessoryServerBrowserBTLE *)self peripheralDisconnectionMonitorMap];
      [v7 removeObjectForKey:v8];
    }
    id v4 = v8;
  }
}

- (void)_disconnectFromHAPBLEPeripheral:(id)a3 cbPeripheral:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  id v8 = [(HAPAccessoryServerBrowser *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = (void *)MEMORY[0x1D944E080]();
  uint64_t v10 = self;
  int v11 = HMFGetOSLogHandle();
  id v12 = v11;
  if (v6 | v7)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = HMFGetLogIdentifier();
      uint64_t v14 = [(id)v6 shortDescription];
      int v25 = 138543874;
      long long v26 = v13;
      __int16 v27 = 2114;
      unint64_t v28 = (unint64_t)v14;
      __int16 v29 = 2112;
      unint64_t v30 = v7;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_INFO, "%{public}@Disconnecting from Peripheral: %{public}@ (%@)", (uint8_t *)&v25, 0x20u);
    }
    if (v6) {
      [(HAPAccessoryServerBrowserBTLE *)v10 _removeFromActiveConnections:v6];
    }
    uint64_t v15 = [(id)v7 state];
    id v16 = (void *)MEMORY[0x1D944E080]();
    uint64_t v17 = v10;
    id v18 = HMFGetOSLogHandle();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v15)
    {
      if (v19)
      {
        id v20 = HMFGetLogIdentifier();
        int v25 = 138543618;
        long long v26 = v20;
        __int16 v27 = 2112;
        unint64_t v28 = v7;
        _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_INFO, "%{public}@Cancelling connection to peripheral: %@", (uint8_t *)&v25, 0x16u);
      }
      [(HAPAccessoryServerBrowserBTLE *)v17 _monitorDisconnectionOfHAPPeripheral:v6 peripheral:v7];
      long long v21 = [(HAPAccessoryServerBrowserBTLE *)v17 centralManager];
      [v21 cancelPeripheralConnection:v7];
    }
    else
    {
      if (v19)
      {
        unint64_t v23 = HMFGetLogIdentifier();
        int v25 = 138543618;
        long long v26 = v23;
        __int16 v27 = 2112;
        unint64_t v28 = v7;
        _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_INFO, "%{public}@Peripheral: %@ is already disconnected", (uint8_t *)&v25, 0x16u);
      }
      uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:23];
      [(HAPAccessoryServerBrowserBTLE *)v17 disconnectedHAPPeripheral:v6 error:v24];
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v22 = HMFGetLogIdentifier();
      int v25 = 138543362;
      long long v26 = v22;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_ERROR, "%{public}@Invalid blePeripheral / cbPeripheral", (uint8_t *)&v25, 0xCu);
    }
  }
}

- (void)disconnectedHAPPeripheral:(id)a3 error:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 cbPeripheral];
  if (v6)
  {
    [(HAPAccessoryServerBrowserBTLE *)self _removeFromActiveConnections:v6];
    uint64_t v9 = [(HAPAccessoryServerBrowserBTLE *)self _recentlySeenPairedPeripheralTupleWithPeripheral:v6];
    uint64_t v10 = [(HAPAccessoryServerBrowserBTLE *)self _discoveredAccessoryServerTupleForBLEPeripheral:v6 shouldMerge:0];
    int v11 = [v10 accessoryServer];
  }
  else
  {
    uint64_t v9 = 0;
    int v11 = 0;
  }
  id v12 = (void *)MEMORY[0x1D944E080]([(HAPAccessoryServerBrowserBTLE *)self _stopMonitorDisconnectionOfCBPeripheral:v8]);
  __int16 v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    id v16 = [v6 shortDescription];
    *(_DWORD *)buf = 138544130;
    uint64_t v31 = v15;
    __int16 v32 = 2114;
    double v33 = v16;
    __int16 v34 = 2112;
    double v35 = v8;
    __int16 v36 = 2114;
    id v37 = v7;
    _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_INFO, "%{public}@Disconnected from BLE peripheral: %{public}@, CB Peripheral: %@ with error %{public}@", buf, 0x2Au);
  }
  if (v7 && v9)
  {
    uint64_t v17 = [(HAPAccessoryServerBrowserBTLE *)v13 hapWiProxBLEBrowser];
    id v18 = [v6 identifier];
    [v17 resetLastSeenForTrackedAccessories:v18];

    BOOL v19 = [(HAPAccessoryServerBrowserBTLE *)v13 delegate];
    id v20 = [v6 identifier];
    [v19 accessoryServerBrowser:v13 didChangeReachability:0 forAccessoryServerWithIdentifier:v20];
  }
  uint64_t v21 = [v9 setNotifyingCharacteristicUpdated:0];
  if (v11)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __65__HAPAccessoryServerBrowserBTLE_disconnectedHAPPeripheral_error___block_invoke;
    v27[3] = &unk_1E69F1328;
    v27[4] = v13;
    id v28 = v11;
    id v29 = v7;
    [v28 handleDisconnectionWithError:v29 completionHandler:v27];
    [v6 disconnectedFromCBPeripheral:v8 shouldRemove:0];
    [(HAPAccessoryServerBrowserBTLE *)v13 _connectPendingConnections];
  }
  else
  {
    int v22 = (void *)MEMORY[0x1D944E080](v21);
    unint64_t v23 = v13;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v25;
      __int16 v32 = 2112;
      double v33 = v8;
      _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to find accessory for disconnected peripheral: %@", buf, 0x16u);
    }
    if (v6)
    {
      long long v26 = [v6 identifier];
      [(HAPAccessoryServerBrowserBTLE *)v23 _removeDiscoveredPeripheralsWithIdentifier:v26];
    }
  }
}

void __65__HAPAccessoryServerBrowserBTLE_disconnectedHAPPeripheral_error___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__HAPAccessoryServerBrowserBTLE_disconnectedHAPPeripheral_error___block_invoke_2;
    block[3] = &unk_1E69F4708;
    id v4 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v6 = v4;
    id v7 = *(id *)(a1 + 48);
    dispatch_async(v3, block);
  }
}

uint64_t __65__HAPAccessoryServerBrowserBTLE_disconnectedHAPPeripheral_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegatesOfRemovedAccessoryServer:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  if (v9) {
    [(HAPAccessoryServerBrowserBTLE *)self _stopMonitorDisconnectionOfCBPeripheral:v9];
  }
  id v8 = [(HAPAccessoryServerBrowserBTLE *)self _blePeripheralForCBPeripheral:v9];
  [(HAPAccessoryServerBrowserBTLE *)self disconnectedHAPPeripheral:v8 error:v7];
}

- (void)failedToConnectHAPPeripheral:(id)a3 error:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6
    && ([(HAPAccessoryServerBrowserBTLE *)self _removeFromActiveConnections:v6],
        -[HAPAccessoryServerBrowserBTLE _discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:](self, "_discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:", v6, 0), v8 = objc_claimAutoreleasedReturnValue(), [v8 accessoryServer], id v9 = objc_claimAutoreleasedReturnValue(), v8, v9))
  {
    uint64_t v10 = (void *)MEMORY[0x1D944E080]();
    int v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = HMFGetLogIdentifier();
      int v21 = 138543874;
      int v22 = v13;
      __int16 v23 = 2114;
      uint64_t v24 = v9;
      __int16 v25 = 2114;
      id v26 = v7;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_INFO, "%{public}@Failed to connect to accessory %{public}@ with error %{public}@", (uint8_t *)&v21, 0x20u);
    }
    uint64_t v14 = [v6 cbPeripheral];
    [v9 handleConnectionWithPeripheral:v14 withError:v7];

    [(HAPAccessoryServerBrowserBTLE *)v11 _notifyDelegatesOfRemovedAccessoryServer:v9 error:v7];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1D944E080]();
    id v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      BOOL v19 = [v6 shortDescription];
      int v21 = 138543618;
      int v22 = v18;
      __int16 v23 = 2114;
      uint64_t v24 = v19;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@unexpected disconnection without server from peripheral: %{public}@", (uint8_t *)&v21, 0x16u);
    }
  }
  id v20 = [v6 cbPeripheral];
  [v6 connectedToCBPeripheral:v20 error:v7];

  [(HAPAccessoryServerBrowserBTLE *)self _connectPendingConnections];
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(HAPAccessoryServerBrowserBTLE *)self _blePeripheralForCBPeripheral:v9];
  id v12 = (void *)MEMORY[0x1D944E080]();
  __int16 v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    id v16 = [v11 shortDescription];
    int v17 = 138544130;
    id v18 = v15;
    __int16 v19 = 2114;
    id v20 = v16;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2114;
    id v24 = v10;
    _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_INFO, "%{public}@Did fail to connect BLE peripheral: %{public}@ with CBPeripheral: %@ with error %{public}@", (uint8_t *)&v17, 0x2Au);
  }
  [(HAPAccessoryServerBrowserBTLE *)v13 failedToConnectHAPPeripheral:v11 error:v10];
}

- (void)connectedHAPPeripheral:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HAPAccessoryServerBrowserBTLE *)self _blePeripheralForCBPeripheral:v4];
  id v7 = v6;
  if (v6
    && ([v6 connectedToCBPeripheral:v4 error:0],
        -[HAPAccessoryServerBrowserBTLE _discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:](self, "_discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:", v7, 0), v8 = objc_claimAutoreleasedReturnValue(), [v8 accessoryServer], id v9 = objc_claimAutoreleasedReturnValue(), v8, v9))
  {
    id v10 = (void *)MEMORY[0x1D944E080]();
    int v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = HMFGetLogIdentifier();
      uint64_t v14 = [v7 shortDescription];
      int v22 = 138543874;
      __int16 v23 = v13;
      __int16 v24 = 2114;
      uint64_t v25 = v14;
      __int16 v26 = 2112;
      id v27 = v4;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_INFO, "%{public}@Successfully connected to BLE Peripheral: %{public}@ with CB Peripheral: %@", (uint8_t *)&v22, 0x20u);
    }
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
    [v9 setConnectionStartTime:v15];

    id v16 = [(HAPAccessoryServerBrowserBTLE *)v11 peripheralsPendingConnection];
    uint64_t v17 = [v16 count];

    if (v17) {
      [v9 updateConnectionIdleTime:1];
    }
    [v9 handleConnectionWithPeripheral:v4 withError:0];
  }
  else
  {
    id v18 = (void *)MEMORY[0x1D944E080]();
    __int16 v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = HMFGetLogIdentifier();
      int v22 = 138543874;
      __int16 v23 = v21;
      __int16 v24 = 2114;
      uint64_t v25 = v7;
      __int16 v26 = 2112;
      id v27 = v4;
      _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "%{public}@unexpected connection complete without server: %{public}@ for CB peripheral: %@", (uint8_t *)&v22, 0x20u);
    }
    [(HAPAccessoryServerBrowserBTLE *)v19 _disconnectFromHAPBLEPeripheral:v7 cbPeripheral:v4];
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  if ([(HAPAccessoryServerBrowserBTLE *)self _delegateRespondsToSelector:sel_accessoryServerBrowserBTLE_didDiscoverAccessoryWithAdvertisementData_])
  {
    id v10 = [(HAPAccessoryServerBrowserBTLE *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__HAPAccessoryServerBrowserBTLE_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke;
    block[3] = &unk_1E69F46E0;
    void block[4] = self;
    id v34 = v9;
    dispatch_async(v10, block);
  }
  id v32 = 0;
  id v30 = 0;
  id v31 = 0;
  id v28 = 0;
  id v29 = 0;
  id v26 = 0;
  id v27 = 0;
  __int16 v24 = self;
  uint64_t v25 = v9;
  unint64_t v11 = [(HAPAccessoryServerBrowserBTLE *)self _parseAdvertisementData:v9 forPeripheral:v8 name:&v32 pairingUsername:&v31 statusFlags:&v30 stateNumber:&v29 category:&v28 configNumber:&v27 setupHash:&v26];
  id v12 = v32;
  id v13 = v31;
  id v14 = v30;
  id v15 = v29;
  id v16 = v28;
  id v17 = v27;
  id v22 = v26;
  id v18 = [HAPBLEPeripheral alloc];
  __int16 v23 = v8;
  __int16 v19 = [v8 identifier];
  id v20 = [NSNumber numberWithUnsignedInteger:v11];
  __int16 v21 = [(HAPBLEPeripheral *)v18 initWithName:v12 peripheralUUID:v19 identifier:v13 hapVersion:v20 hkType:0 advInterval:0 statusFlags:v14 category:v16 stateNumber:v15 configNumber:v17 setupHash:0 encryptedPayload:0 whbStableIdentifier:0 advDeviceAddress:0];

  if (HAPIsHH2Enabled_onceToken != -1) {
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_12024);
  }
  if ((HAPIsHH2Enabled_hh2Enabled & 1) == 0) {
    [(HAPBLEPeripheral *)v21 setCbPeripheral:v23];
  }
  [(HAPAccessoryServerBrowserBTLE *)v24 _didDiscoverPeripheral:v21 accessoryName:v12 pairingIdentifier:v13 format:v11 statusFlags:v14 stateNumber:v15 category:v16 configNumber:v17 setupHash:v22 encryptedPayload:0 whbStableIdentifier:0];
}

void __93__HAPAccessoryServerBrowserBTLE_centralManager_didDiscoverPeripheral_advertisementData_RSSI___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowserBTLE:*(void *)(a1 + 32) didDiscoverAccessoryWithAdvertisementData:*(void *)(a1 + 40)];
}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  unint64_t v4 = [v54 state];
  unint64_t v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    id v9 = (void *)v8;
    if (v4 > 5) {
      id v10 = @"Unenumerated State?";
    }
    else {
      id v10 = off_1E69F1490[v4];
    }
    *(_DWORD *)buf = 138543874;
    uint64_t v75 = v8;
    __int16 v76 = 2048;
    unint64_t v77 = v4;
    __int16 v78 = 2112;
    v79 = v10;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Central manager changed state: %ld (%@)", buf, 0x20u);
  }
  switch(v4)
  {
    case 1uLL:
    case 4uLL:
      v56 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:57 reason:@"Bluetooth was turned off or reset" underlyingError:0];
      [(HAPAccessoryServerBrowserBTLE *)v6 _callPowerOnCompletionsWithError:v56];
      uint64_t v11 = [(HAPAccessoryServerBrowserBTLE *)v6 reachabilityCompletion];
      id v12 = (void *)v11;
      if (v11) {
        (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v56);
      }

      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v13 = [(HAPAccessoryServerBrowser *)v6 pairedAccessoryIdentifiers];
      id v14 = (void *)[v13 copy];

      uint64_t v15 = [v14 countByEnumeratingWithState:&v68 objects:v73 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v69 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(void *)(*((void *)&v68 + 1) + 8 * i);
            __int16 v19 = (void *)MEMORY[0x1D944E080]();
            id v20 = v6;
            __int16 v21 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              id v22 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              uint64_t v75 = (uint64_t)v22;
              _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_INFO, "%{public}@Reporting reachability changed to NO for all paired BLE accessories on Bluetooth Power OFF", buf, 0xCu);
            }
            __int16 v23 = [(HAPAccessoryServerBrowserBTLE *)v20 delegate];
            [v23 accessoryServerBrowser:v20 didChangeReachability:0 forAccessoryServerWithIdentifier:v18];
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v68 objects:v73 count:16];
        }
        while (v15);
      }

      __int16 v24 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v25 = [(HAPAccessoryServerBrowserBTLE *)v6 discoveredPeripheralsWithAccessories];
      id v26 = [v25 keyEnumerator];
      id v27 = [v26 allObjects];
      id v28 = [v24 arrayWithArray:v27];

      objc_initWeak((id *)buf, v6);
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __62__HAPAccessoryServerBrowserBTLE_centralManagerDidUpdateState___block_invoke;
      v66[3] = &unk_1E69F13F0;
      id location = &v67;
      objc_copyWeak(&v67, (id *)buf);
      id v29 = (void *)MEMORY[0x1D944E2D0](v66);
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id obj = v28;
      uint64_t v30 = [obj countByEnumeratingWithState:&v62 objects:v72 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v63;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v63 != v31) {
              objc_enumerationMutation(obj);
            }
            uint64_t v33 = *(void *)(*((void *)&v62 + 1) + 8 * j);
            id v34 = -[HAPAccessoryServerBrowserBTLE _discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:](v6, "_discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:", v33, 0, location);
            double v35 = [v34 accessoryServer];

            if (v35)
            {
              v57[0] = MEMORY[0x1E4F143A8];
              v57[1] = 3221225472;
              v57[2] = __62__HAPAccessoryServerBrowserBTLE_centralManagerDidUpdateState___block_invoke_2;
              v57[3] = &unk_1E69F1418;
              v57[4] = v6;
              id v36 = v35;
              id v58 = v36;
              id v37 = v56;
              id v59 = v37;
              id v38 = v29;
              uint64_t v60 = v33;
              id v61 = v38;
              [v36 handleDisconnectionWithError:v37 completionHandler:v57];
            }
            else
            {
              uint64_t v39 = MEMORY[0x1D944E2D0](v29);
              uint64_t v40 = (void *)v39;
              if (v39) {
                (*(void (**)(uint64_t, uint64_t))(v39 + 16))(v39, v33);
              }
            }
          }
          uint64_t v30 = [obj countByEnumeratingWithState:&v62 objects:v72 count:16];
        }
        while (v30);
      }

      objc_destroyWeak(location);
      objc_destroyWeak((id *)buf);

      long long v41 = v56;
      goto LABEL_42;
    case 2uLL:
      long long v42 = (void *)MEMORY[0x1D944E080]();
      long long v43 = v6;
      long long v44 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        long long v45 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v75 = (uint64_t)v45;
        _os_log_impl(&dword_1D4758000, v44, OS_LOG_TYPE_ERROR, "%{public}@BTLE is unsupported on this system", buf, 0xCu);
      }
      long long v41 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:48 reason:@"Failed to power on Bluetooth because Bluetooth LE is unsupported on this system." underlyingError:0];
      [(HAPAccessoryServerBrowserBTLE *)v43 _callPowerOnCompletionsWithError:v41];
      uint64_t v46 = [(HAPAccessoryServerBrowserBTLE *)v43 reachabilityCompletion];
      long long v47 = (void *)v46;
      if (v46) {
        (*(void (**)(uint64_t, void, void *))(v46 + 16))(v46, 0, v41);
      }

      goto LABEL_42;
    case 5uLL:
      [(HAPAccessoryServerBrowserBTLE *)v6 _callPowerOnCompletionsWithError:0];
      if ([(HAPAccessoryServerBrowserBTLE *)v6 isPerformingGeneralScan])
      {
        long long v48 = (void *)MEMORY[0x1D944E080]();
        id v49 = v6;
        id v50 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          uint64_t v51 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v75 = (uint64_t)v51;
          _os_log_impl(&dword_1D4758000, v50, OS_LOG_TYPE_INFO, "%{public}@Central manager was powered on and there is an outstanding accessory server discovery request so start actively scanning", buf, 0xCu);
        }
        [(HAPAccessoryServerBrowserBTLE *)v49 _startBrowsingForLegacyHAPBTLE100Accessories];
      }
      uint64_t v52 = [(HAPAccessoryServerBrowserBTLE *)v6 reachabilityCompletion];
      long long v41 = (void *)v52;
      if (v52) {
        (*(void (**)(uint64_t, uint64_t, void))(v52 + 16))(v52, 1, 0);
      }
LABEL_42:

      break;
    default:
      break;
  }
}

void __62__HAPAccessoryServerBrowserBTLE_centralManagerDidUpdateState___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _removeFromActiveConnections:v3];
  [WeakRetained _removeFromPendingConnections:v3];
  unint64_t v4 = [WeakRetained discoveredPeripheralsWithAccessories];
  [v4 removeObjectForKey:v3];
}

void __62__HAPAccessoryServerBrowserBTLE_centralManagerDidUpdateState___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__HAPAccessoryServerBrowserBTLE_centralManagerDidUpdateState___block_invoke_3;
  block[3] = &unk_1E69F32D8;
  id v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v7 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 56);
  id v9 = v4;
  dispatch_async(v2, block);
}

void __62__HAPAccessoryServerBrowserBTLE_centralManagerDidUpdateState___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _notifyDelegatesOfRemovedAccessoryServer:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
  id v2 = (void (**)(void, void))MEMORY[0x1D944E2D0](*(void *)(a1 + 64));
  if (v2)
  {
    id v3 = v2;
    v2[2](v2, *(void *)(a1 + 56));
    id v2 = (void (**)(void, void))v3;
  }
}

- (void)_didDiscoverPeripheral:(id)a3 accessoryName:(id)a4 pairingIdentifier:(id)a5 format:(unint64_t)a6 statusFlags:(id)a7 stateNumber:(id)a8 category:(id)a9 configNumber:(id)a10 setupHash:(id)a11 encryptedPayload:(id)a12 whbStableIdentifier:(id)a13
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v105 = a7;
  id v21 = a8;
  id v104 = a9;
  id v22 = a10;
  id v103 = a11;
  id v106 = a12;
  id v102 = a13;
  __int16 v23 = [v18 identifier];
  __int16 v24 = self;
  uint64_t v25 = self;
  id v26 = v21;
  id v27 = [(HAPAccessoryServerBrowserBTLE *)v25 _blePeripheralForAccessoryServerIdentifier:v23];

  if (a6)
  {
    unint64_t v28 = a6;
    id v29 = [v18 cbPeripheral];
    if ([v29 state])
    {

      goto LABEL_37;
    }
    [v27 cbPeripheral];
    v30 = id v99 = v19;
    uint64_t v31 = [v30 state];

    id v19 = v99;
    if (v31) {
      goto LABEL_37;
    }
    char v115 = 0;
    id v32 = [(HAPAccessoryServerBrowserBTLE *)v24 _discoveredAccessoryServerTupleForBLEPeripheral:v18 shouldMerge:1];
    id v98 = v22;
    if (!v32)
    {
      __int16 v107 = 0;
      id v47 = v105;
      if (v106
        || [(HAPAccessoryServerBrowserBTLE *)v24 _shouldCreateHAPAccessoryServerWithIdentifier:v20 statusFlags:v105 stateNumber:v26 category:v104 configNumber:v22 name:v99 forPeripheral:v18 advertisementFormat:a6 setupHash:v103 stateChanged:(char *)&v107 + 1 connectReason:&v107])
      {
        long long v48 = (void *)MEMORY[0x1D944E080]();
        id v49 = v24;
        id v50 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          BOOL v92 = v48;
          uint64_t v51 = HMFGetLogIdentifier();
          [v18 name];
          uint64_t v52 = v91 = v49;
          uint64_t v53 = HMFBooleanToString();
          id v54 = HMFBooleanToString();
          char v55 = [NSNumber numberWithUnsignedChar:v107];
          *(_DWORD *)buf = 138545922;
          id v117 = v51;
          __int16 v118 = 2112;
          v119 = v52;
          __int16 v120 = 2114;
          id v121 = v20;
          __int16 v122 = 2114;
          v123 = v26;
          __int16 v124 = 2114;
          id v125 = v104;
          __int16 v126 = 2114;
          id v127 = v105;
          __int16 v128 = 2048;
          unint64_t v129 = a6;
          __int16 v130 = 2114;
          id v131 = v53;
          __int16 v132 = 2114;
          id v133 = v54;
          __int16 v134 = 2114;
          id v135 = v98;
          __int16 v136 = 2114;
          id v137 = v55;
          _os_log_impl(&dword_1D4758000, v50, OS_LOG_TYPE_INFO, "%{public}@Discovered new accessory '%@/%{public}@/%{public}@' C: '%{public}@' SF: '%{public}@' V: '%tu' ENC: '%{public}@' ST: '%{public}@' C#: '%{public}@', CR: '%{public}@'", buf, 0x70u);

          long long v48 = v92;
          id v49 = v91;

          unint64_t v28 = a6;
          id v47 = v105;
        }
        v56 = [MEMORY[0x1E4F65520] sharedPowerLogger];
        [v56 reportIncomingAdvertisementChange:v20 accessoryCategory:v104];

        LOBYTE(v90) = HIBYTE(v107);
        id v22 = v98;
        id v19 = v99;
        LOBYTE(v89) = v107;
        -[HAPAccessoryServerBrowserBTLE _createHAPAccessoryAndNotifyDelegateWithPeripheral:name:pairingUsername:statusFlags:stateNumber:stateChanged:connectReason:configNumber:category:connectionIdleTime:format:setupHash:encryptedPayload:whbStableIdentifier:](v49, "_createHAPAccessoryAndNotifyDelegateWithPeripheral:name:pairingUsername:statusFlags:stateNumber:stateChanged:connectReason:configNumber:category:connectionIdleTime:format:setupHash:encryptedPayload:whbStableIdentifier:", v18, v99, v20, v47, v26, v89, v98, v104, v90, v28, v103, v106, v102);
        id v32 = 0;
      }
      goto LABEL_36;
    }
    uint64_t v33 = [(HAPAccessoryServerBrowserBTLE *)v24 recentlySeenPairedPeripherals];
    id v34 = [v18 identifier];
    double v35 = [v33 objectForKey:v34];
    [v35 updateWithPeripheral:v18];

    [(HAPAccessoryServerBrowserBTLE *)v24 _reportReachabilityForAccessoryWithIdentifier:v20];
    BOOL v36 = [(HAPAccessoryServerBrowser *)v24 isPaired:v20];
    if (v106 && v36 && ([v18 isCached] & 1) == 0)
    {
      uint64_t v37 = [(HAPAccessoryServerBrowserBTLE *)v24 hapCharacteristicsForEncryptedPayload:v106 identifier:v20 shouldConnect:&v115];
      if (!v37)
      {
        id v22 = v98;
        id v19 = v99;
        if (v115
          && [(HAPAccessoryServerBrowserBTLE *)v24 _delegateRespondsToSelector:sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_])
        {
          id v88 = [(HAPAccessoryServerBrowserBTLE *)v24 delegateQueue];
          v111[0] = MEMORY[0x1E4F143A8];
          v111[1] = 3221225472;
          v111[2] = __188__HAPAccessoryServerBrowserBTLE__didDiscoverPeripheral_accessoryName_pairingIdentifier_format_statusFlags_stateNumber_category_configNumber_setupHash_encryptedPayload_whbStableIdentifier___block_invoke;
          v111[3] = &unk_1E69F4708;
          id v112 = v32;
          id v113 = v24;
          id v114 = v26;
          dispatch_async(v88, v111);

          id v22 = v98;
        }
        goto LABEL_36;
      }
      id v38 = (void *)v37;
      uint64_t v39 = [(HAPAccessoryServerBrowserBTLE *)v24 delegate];
      uint64_t v40 = [v32 accessoryServer];
      [v38 firstObject];
      long long v41 = v94 = v32;
      long long v42 = [v41 stateNumber];
      [v39 accessoryServerBrowser:v24 accessoryServer:v40 didUpdateValuesForCharacteristics:v38 stateNumber:v42 broadcast:1];

      id v32 = v94;
      long long v43 = [v38 firstObject];
      long long v44 = [v43 stateNumber];
      [(HAPAccessoryServerBrowserBTLE *)v24 updateStateForIdentifier:v20 stateNumber:v44];
    }
    long long v45 = [v32 accessoryServer];
    uint64_t v46 = [v45 identifier];
    if ([v46 isEqualToString:v20])
    {

      id v19 = v99;
    }
    else
    {
      long long v57 = [v32 accessoryServer];
      [v57 identifier];
      id v58 = v95 = v32;
      BOOL v59 = [(HAPAccessoryServerBrowser *)v24 isPaired:v58];

      id v32 = v95;
      id v19 = v99;
      if (!v59)
      {
        v81 = (void *)MEMORY[0x1D944E080]();
        id v82 = v24;
        id v83 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
        {
          v84 = HMFGetLogIdentifier();
          unint64_t v85 = [v95 accessoryServer];
          unint64_t v86 = [v85 identifier];
          *(_DWORD *)buf = 138543874;
          id v117 = v84;
          __int16 v118 = 2114;
          v119 = v86;
          __int16 v120 = 2114;
          id v121 = v20;
          _os_log_impl(&dword_1D4758000, v83, OS_LOG_TYPE_INFO, "%{public}@Unpaired Accessory updated its identifier from %{public}@ to %{public}@", buf, 0x20u);

          id v32 = v95;
        }

        uint64_t v87 = [v32 accessoryServer];
        [(HAPAccessoryServerBrowserBTLE *)v82 _notifyDelegatesOfRemovedAccessoryServer:v87 error:0];

        id v22 = v98;
        id v19 = v99;
        goto LABEL_36;
      }
    }
    [v32 setLastSeen:CFAbsoluteTimeGetCurrent()];
    id v101 = [v32 accessoryServer];
    if (v26)
    {
      uint64_t v60 = [v32 accessoryServer];
      id v61 = [v60 stateNumber];
      char v62 = [v61 isEqualToNumber:v26];

      id v19 = v99;
      if ((v62 & 1) == 0)
      {
        long long v63 = (void *)MEMORY[0x1D944E080]();
        long long v64 = v24;
        long long v65 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          long long v66 = HMFGetLogIdentifier();
          [v101 shortDescription];
          id v67 = v93 = v63;
          [v18 shortDescription];
          long long v68 = v96 = v32;
          *(_DWORD *)buf = 138544130;
          id v117 = v66;
          __int16 v118 = 2114;
          v119 = v67;
          __int16 v120 = 2114;
          id v121 = v26;
          __int16 v122 = 2114;
          v123 = v68;
          _os_log_impl(&dword_1D4758000, v65, OS_LOG_TYPE_INFO, "%{public}@Discovered accessory: %{public}@ updated State Number to %{public}@ for %{public}@", buf, 0x2Au);

          id v32 = v96;
          long long v63 = v93;

          id v19 = v99;
        }

        long long v69 = [v32 accessoryServer];
        [v69 setStateNumber:v26];

        if ([(HAPAccessoryServerBrowserBTLE *)v64 _delegateRespondsToSelector:sel_accessoryServerBrowser_didFindAccessoryServer_stateChanged_stateNumber_])
        {
          long long v70 = [(HAPAccessoryServerBrowserBTLE *)v64 delegateQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __188__HAPAccessoryServerBrowserBTLE__didDiscoverPeripheral_accessoryName_pairingIdentifier_format_statusFlags_stateNumber_category_configNumber_setupHash_encryptedPayload_whbStableIdentifier___block_invoke_164;
          block[3] = &unk_1E69F4708;
          void block[4] = v64;
          id v109 = v101;
          id v110 = v26;
          dispatch_async(v70, block);
        }
      }
    }
    if (v19)
    {
      unint64_t v71 = [v19 length];
      uint64_t v72 = [v101 name];
      unint64_t v73 = [v72 length];

      id v19 = v99;
      if (v71 > v73)
      {
        uint64_t v74 = (void *)MEMORY[0x1D944E080]();
        uint64_t v75 = v24;
        __int16 v76 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
        {
          unint64_t v77 = HMFGetLogIdentifier();
          __int16 v78 = [v101 identifier];
          [v101 name];
          v79 = id v97 = v32;
          *(_DWORD *)buf = 138544130;
          id v117 = v77;
          __int16 v118 = 2114;
          v119 = v78;
          __int16 v120 = 2112;
          id v121 = v79;
          __int16 v122 = 2112;
          v123 = v99;
          _os_log_impl(&dword_1D4758000, v76, OS_LOG_TYPE_INFO, "%{public}@Discovered accessory: %{public}@ updated name from %@ to %@", buf, 0x2Au);

          id v32 = v97;
          id v19 = v99;
        }

        uint64_t v80 = [v32 accessoryServer];
        [v80 setName:v19];
      }
    }
    if (v105) {
      objc_msgSend(v101, "setHasPairings:", (objc_msgSend(v105, "unsignedCharValue") & 1) == 0);
    }

    id v22 = v98;
LABEL_36:
  }
LABEL_37:
}

void __188__HAPAccessoryServerBrowserBTLE__didDiscoverPeripheral_accessoryName_pairingIdentifier_format_statusFlags_stateNumber_category_configNumber_setupHash_encryptedPayload_whbStableIdentifier___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) accessoryServer];
  id v2 = [*(id *)(a1 + 40) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 40) didFindAccessoryServer:v3 stateChanged:1 stateNumber:*(void *)(a1 + 48)];
}

void __188__HAPAccessoryServerBrowserBTLE__didDiscoverPeripheral_accessoryName_pairingIdentifier_format_statusFlags_stateNumber_category_configNumber_setupHash_encryptedPayload_whbStableIdentifier___block_invoke_164(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didFindAccessoryServer:*(void *)(a1 + 40) stateChanged:1 stateNumber:*(void *)(a1 + 48)];
}

- (id)_discoveredAccessoryServerTupleForBLEPeripheral:(id)a3 shouldMerge:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [(HAPAccessoryServerBrowserBTLE *)self discoveredPeripheralsWithAccessories];
  uint64_t v8 = [v7 keyEnumerator];
  id v9 = [v8 allObjects];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v6 isEqual:v14])
        {
          uint64_t v16 = [(HAPAccessoryServerBrowserBTLE *)self discoveredPeripheralsWithAccessories];
          uint64_t v15 = [v16 objectForKey:v14];

          if (v4) {
            [v14 mergeWithPeripheral:v6];
          }
          goto LABEL_12;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = 0;
LABEL_12:

  return v15;
}

- (void)_removeDiscoveredPeripheralsWithIdentifier:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v30 = [MEMORY[0x1E4F1CA48] array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  unint64_t v5 = [(HAPAccessoryServerBrowserBTLE *)self discoveredPeripheralsWithAccessories];
  id v6 = [v5 keyEnumerator];

  id obj = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v12 = [(HAPAccessoryServerBrowserBTLE *)self _discoveredAccessoryServerTupleForBLEPeripheral:v11 shouldMerge:0];
        id v13 = [v12 accessoryServer];

        id v14 = [v11 identifier];
        if ([v14 isEqualToString:v4])
        {
        }
        else
        {
          uint64_t v15 = [v13 identifier];
          int v16 = [v15 isEqualToString:v4];

          if (!v16) {
            goto LABEL_10;
          }
        }
        [v30 addObject:v11];
LABEL_10:
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v8);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v31 = v30;
  uint64_t v17 = [v31 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v33;
    uint64_t obja = 138543618;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v31);
        }
        long long v21 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        id v22 = [(HAPAccessoryServerBrowserBTLE *)self discoveredPeripheralsWithAccessories];
        [v22 removeObjectForKey:v21];

        uint64_t v23 = (void *)MEMORY[0x1D944E080]();
        __int16 v24 = self;
        uint64_t v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          id v26 = HMFGetLogIdentifier();
          id v27 = [v21 shortDescription];
          *(_DWORD *)buf = obja;
          long long v41 = v26;
          __int16 v42 = 2114;
          long long v43 = v27;
          _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_INFO, "%{public}@Browser removed discovered peripheral: %{public}@", buf, 0x16u);
        }
      }
      uint64_t v18 = [v31 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v18);
  }
}

- (void)_notifyDelegatesOfRemovedAccessoryServer:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if ([(HAPAccessoryServerBrowserBTLE *)self _delegateRespondsToSelector:sel_accessoryServerBrowser_didRemoveAccessoryServer_error_])
    {
      uint64_t v8 = [(HAPAccessoryServerBrowserBTLE *)self delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__HAPAccessoryServerBrowserBTLE__notifyDelegatesOfRemovedAccessoryServer_error___block_invoke;
      block[3] = &unk_1E69F4708;
      void block[4] = self;
      id v11 = v6;
      id v12 = v7;
      dispatch_async(v8, block);
    }
    uint64_t v9 = [v6 identifier];
    [(HAPAccessoryServerBrowserBTLE *)self _removeDiscoveredPeripheralsWithIdentifier:v9];
  }
}

void __80__HAPAccessoryServerBrowserBTLE__notifyDelegatesOfRemovedAccessoryServer_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didRemoveAccessoryServer:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)_performTimedScanForIdentifiers:(id)a3 forceScan:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v39 = a4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v41 = a5;
  uint64_t v8 = (void *)MEMORY[0x1D944E080]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    id v13 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    long long v48 = v11;
    __int16 v49 = 2114;
    id v50 = v12;
    __int16 v51 = 2114;
    uint64_t v52 = v13;
    _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_INFO, "%{public}@Received request to perform reachability scan for %{public}@ accessories. Force Scan: %{public}@", buf, 0x20u);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v7;
  uint64_t v14 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v19 = (void *)MEMORY[0x1D944E080]();
        long long v20 = v9;
        long long v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          id v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v48 = v22;
          __int16 v49 = 2114;
          id v50 = v18;
          _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Performing reachability scan for %{public}@", buf, 0x16u);
        }
        uint64_t v23 = [(HAPAccessoryServerBrowserBTLE *)v20 _blePeripheralForAccessoryServerIdentifier:v18];
        __int16 v24 = [v23 cbPeripheral];

        if ([v24 state] == 2)
        {
          uint64_t v25 = (void *)MEMORY[0x1D944E080]();
          id v26 = v20;
          id v27 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            unint64_t v28 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            long long v48 = v28;
            __int16 v49 = 2114;
            id v50 = v18;
            _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_INFO, "%{public}@Skipping reachability scan as we are connected to %{public}@", buf, 0x16u);
          }
          uint64_t v29 = MEMORY[0x1D944E2D0](v41);
          id v30 = (void *)v29;
          if (v29) {
            (*(void (**)(uint64_t, void *, uint64_t))(v29 + 16))(v29, v18, 1);
          }
        }
        else
        {
          id v31 = [(HAPAccessoryServerBrowserBTLE *)v20 identifiersWithReachabilityScanTuples];
          id v30 = [v31 objectForKey:v18];

          if (!v30)
          {
            long long v32 = [(HAPAccessoryServerBrowser *)v20 workQueue];
            id v30 = +[HAPBTLEReachabilityScanTuple reachabilityScanTupleWithCompletion:v41 workQueue:v32 identifier:v18];

            long long v33 = [(HAPAccessoryServerBrowserBTLE *)v20 identifiersWithReachabilityScanTuples];
            [v33 setObject:v30 forKey:v18];

            if (v39)
            {
              long long v34 = [(HAPAccessoryServerBrowserBTLE *)v20 hapWiProxBLEBrowser];
              [v34 resetLastSeenForTrackedAccessories:v18];
            }
          }
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v15);
  }

  long long v35 = [(HAPAccessoryServerBrowserBTLE *)v9 identifiersWithReachabilityScanTuples];
  uint64_t v36 = [v35 count];

  if (v36)
  {
    long long v37 = [(HAPAccessoryServerBrowserBTLE *)v9 hapWiProxBLEBrowser];
    long long v38 = [(HAPAccessoryServerBrowserBTLE *)v9 identifiersWithReachabilityScanTuples];
    [v37 probeReachabilityForTrackedAccessoriesWithScanTuples:v38];

    [(HAPAccessoryServerBrowserBTLE *)v9 _updateTargetedScanTimer];
  }
}

- (void)_removeIdentifiersForReachabilityScan
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(HAPAccessoryServerBrowserBTLE *)self identifiersWithReachabilityScanTuples];
  uint64_t v25 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        unint64_t v5 = [(HAPAccessoryServerBrowserBTLE *)self identifiersWithReachabilityScanTuples];
        id v6 = [v5 objectForKey:v4];

        id v7 = (void *)MEMORY[0x1D944E080]();
        uint64_t v8 = self;
        uint64_t v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          uint64_t v10 = HMFGetLogIdentifier();
          id v11 = [v6 identifier];
          *(_DWORD *)buf = 138543618;
          long long v34 = v10;
          __int16 v35 = 2114;
          uint64_t v36 = v11;
          _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@Reachability scan timed out for %{public}@", buf, 0x16u);
        }
        id v12 = [(HAPAccessoryServerBrowserBTLE *)v8 _blePeripheralForAccessoryServerIdentifier:v4];
        id v13 = [v12 cbPeripheral];

        uint64_t v14 = [v13 state];
        if (v14 == 2)
        {
          uint64_t v15 = (void *)MEMORY[0x1D944E080]();
          uint64_t v16 = v8;
          uint64_t v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            uint64_t v18 = HMFGetLogIdentifier();
            uint64_t v19 = [v6 identifier];
            *(_DWORD *)buf = 138543618;
            long long v34 = v18;
            __int16 v35 = 2114;
            uint64_t v36 = v19;
            _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_INFO, "%{public}@Marking accessory as we are connected to %{public}@", buf, 0x16u);
          }
        }
        long long v20 = [v6 completion];

        if (v20)
        {
          long long v21 = [v6 queue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __70__HAPAccessoryServerBrowserBTLE__removeIdentifiersForReachabilityScan__block_invoke;
          block[3] = &unk_1E69F3DF8;
          id v27 = v6;
          BOOL v28 = v14 == 2;
          dispatch_async(v21, block);
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v25);
  }

  id v22 = [(HAPAccessoryServerBrowserBTLE *)self identifiersWithReachabilityScanTuples];
  [v22 removeAllObjects];
}

void __70__HAPAccessoryServerBrowserBTLE__removeIdentifiersForReachabilityScan__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) completion];
  id v2 = [*(id *)(a1 + 32) identifier];
  v3[2](v3, v2, *(unsigned __int8 *)(a1 + 40));
}

- (id)_recentlySeenPairedPeripheralTupleWithPeripheral:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HAPAccessoryServerBrowserBTLE *)self recentlySeenPairedPeripherals];
  id v6 = [v5 objectEnumerator];
  id v7 = [v6 allObjects];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__HAPAccessoryServerBrowserBTLE__recentlySeenPairedPeripheralTupleWithPeripheral___block_invoke;
  v11[3] = &unk_1E69F13C8;
  id v12 = v4;
  id v8 = v4;
  uint64_t v9 = objc_msgSend(v7, "hmf_objectPassingTest:", v11);

  return v9;
}

uint64_t __82__HAPAccessoryServerBrowserBTLE__recentlySeenPairedPeripheralTupleWithPeripheral___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)_forgetPairedAccessoryWithIdentifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServerBrowserBTLE *)self delegate];
  [v5 accessoryServerBrowser:self removeCacheForAccessoryWithIdentifier:v4];

  id v6 = (void *)MEMORY[0x1D944E080]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v22 = v9;
    __int16 v23 = 2114;
    id v24 = v4;
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@Request to forget accessory with Id %{public}@", buf, 0x16u);
  }
  uint64_t v10 = [(HAPAccessoryServerBrowserBTLE *)v7 hapWiProxBLEBrowser];
  id v20 = v4;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  [v10 stopTrackingHAPBLEAccessoriesWithIdentifiers:v11];

  id v12 = [(HAPAccessoryServerBrowserBTLE *)v7 recentlySeenPairedPeripherals];
  id v13 = [v12 objectForKey:v4];

  if (v13)
  {
    uint64_t v14 = (void *)MEMORY[0x1D944E080]();
    uint64_t v15 = v7;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v22 = v17;
      __int16 v23 = 2114;
      id v24 = v13;
      _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_INFO, "%{public}@Forgetting paired peripheral %{public}@", buf, 0x16u);
    }
    uint64_t v18 = [(HAPAccessoryServerBrowserBTLE *)v15 recentlySeenPairedPeripherals];
    [v18 removeObjectForKey:v4];
  }
  v19.receiver = v7;
  v19.super_class = (Class)HAPAccessoryServerBrowserBTLE;
  [(HAPAccessoryServerBrowser *)&v19 deRegisterAccessoryWithIdentifier:v4];
}

- (void)resetPairedAccessories
{
  id v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__HAPAccessoryServerBrowserBTLE_resetPairedAccessories__block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __55__HAPAccessoryServerBrowserBTLE_resetPairedAccessories__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "pairedAccessoryIdentifiers", 0);
  id v3 = (void *)[v2 copy];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 32) _forgetPairedAccessoryWithIdentifier:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)deRegisterAccessoryWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPAccessoryServerBrowserBTLE;
  [(HAPAccessoryServerBrowser *)&v9 deRegisterAccessoryWithIdentifier:v4];
  uint64_t v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HAPAccessoryServerBrowserBTLE_deRegisterAccessoryWithIdentifier___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __67__HAPAccessoryServerBrowserBTLE_deRegisterAccessoryWithIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _forgetPairedAccessoryWithIdentifier:*(void *)(a1 + 40)];
}

- (void)markNotifyingCharacteristicUpdatedForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__HAPAccessoryServerBrowserBTLE_markNotifyingCharacteristicUpdatedForIdentifier___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __81__HAPAccessoryServerBrowserBTLE_markNotifyingCharacteristicUpdatedForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) recentlySeenPairedPeripherals];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3 && ([v3 notifyingCharacteristicUpdated] & 1) == 0)
  {
    id v4 = NSNumber;
    uint64_t v5 = [v3 stateNumber];
    id v6 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "unsignedShortValue") + 1);
    [v3 setStateNumber:v6];

    uint64_t v7 = (void *)MEMORY[0x1D944E080]([v3 setNotifyingCharacteristicUpdated:1]);
    id v8 = *(id *)(a1 + 32);
    objc_super v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      long long v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      id v12 = v10;
      __int16 v13 = 2114;
      uint64_t v14 = v3;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@Incremented state number of recently seen peripheral: %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (unint64_t)qosLimits
{
  if ([(HAPAccessoryServerBrowserBTLE *)self remoteBrowsingAndScanEnabled]) {
    return 2;
  }
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  unint64_t qosLimits = self->_qosLimits;
  os_unfair_lock_unlock(p_lock);
  return qosLimits;
}

- (void)setQosLimits:(unint64_t)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_unint64_t qosLimits = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)configureBTLEQoSLimits:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1D944E080](self, a2);
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    long long v10 = v8;
    __int16 v11 = 2048;
    unint64_t v12 = a3;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring browser for qosLimits: %tu", (uint8_t *)&v9, 0x16u);
  }
  [(HAPAccessoryServerBrowserBTLE *)v6 setQosLimits:a3];
}

- (void)updateScanInBackground:(BOOL)a3
{
  uint64_t v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__HAPAccessoryServerBrowserBTLE_updateScanInBackground___block_invoke;
  v6[3] = &unk_1E69F3DF8;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __56__HAPAccessoryServerBrowserBTLE_updateScanInBackground___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) hapWiProxBLEBrowser];
  [v2 setScanInBackground:v1];
}

- (void)stopTrackingBTLEAccessoriesWithIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__HAPAccessoryServerBrowserBTLE_stopTrackingBTLEAccessoriesWithIdentifiers___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __76__HAPAccessoryServerBrowserBTLE_stopTrackingBTLEAccessoriesWithIdentifiers___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) hapWiProxBLEBrowser];
  [v2 stopTrackingHAPBLEAccessoriesWithIdentifiers:*(void *)(a1 + 40)];
}

- (void)updateStateForIdentifier:(id)a3 stateNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__HAPAccessoryServerBrowserBTLE_updateStateForIdentifier_stateNumber___block_invoke;
  block[3] = &unk_1E69F4708;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __70__HAPAccessoryServerBrowserBTLE_updateStateForIdentifier_stateNumber___block_invoke(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) recentlySeenPairedPeripherals];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [v3 stateNumber];
    uint64_t v5 = HAPCompareStateNumberWithRollover(v4, *(void **)(a1 + 48), 0xFFuLL);

    if (v5 == -1)
    {
      id v6 = (void *)MEMORY[0x1D944E080]();
      id v7 = *(id *)(a1 + 32);
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = HMFGetLogIdentifier();
        id v10 = [v3 stateNumber];
        __int16 v11 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138544130;
        uint64_t v52 = v9;
        __int16 v53 = 2114;
        id v54 = v3;
        __int16 v55 = 2114;
        v56 = v10;
        __int16 v57 = 2114;
        id v58 = v11;
        _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating State for recently seen accessory: %{public}@ to sync-up current/new: %{public}@/%{public}@", buf, 0x2Au);
      }
      [v3 setStateNumber:*(void *)(a1 + 48)];
    }
  }
  uint64_t v40 = v3;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v12 = [*(id *)(a1 + 32) discoveredPeripheralsWithAccessories];
  id v13 = [v12 objectEnumerator];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v61 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v48;
    id v41 = v13;
    uint64_t v45 = *(void *)v48;
    do
    {
      uint64_t v17 = 0;
      uint64_t v46 = v15;
      do
      {
        if (*(void *)v48 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v47 + 1) + 8 * v17);
        objc_super v19 = [v18 accessoryServer];
        id v20 = [v19 identifier];
        int v21 = [v20 isEqualToString:*(void *)(a1 + 40)];

        if (v21)
        {
          id v22 = [v18 accessoryServer];
          __int16 v23 = [v22 stateNumber];
          uint64_t v24 = HAPCompareStateNumberWithRollover(v23, *(void **)(a1 + 48), 0xFFuLL);

          if (v24 == -1)
          {
            uint64_t v25 = (void *)MEMORY[0x1D944E080]();
            id v26 = *(id *)(a1 + 32);
            id v27 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              BOOL v28 = HMFGetLogIdentifier();
              long long v43 = [v18 accessoryServer];
              long long v29 = [v43 name];
              long long v42 = [v18 accessoryServer];
              long long v30 = [v42 identifier];
              [v18 accessoryServer];
              v31 = long long v44 = v25;
              long long v32 = [v31 stateNumber];
              uint64_t v33 = *(void *)(a1 + 48);
              *(_DWORD *)buf = 138544386;
              uint64_t v52 = v28;
              __int16 v53 = 2112;
              id v54 = v29;
              __int16 v55 = 2114;
              v56 = v30;
              __int16 v57 = 2114;
              id v58 = v32;
              __int16 v59 = 2114;
              uint64_t v60 = v33;
              _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_INFO, "%{public}@Updating State for discovered tuple: %@ (%{public}@) to sync-up current/new: %{public}@/%{public}@", buf, 0x34u);

              uint64_t v25 = v44;
              id v13 = v41;
            }
            uint64_t v34 = *(void *)(a1 + 48);
            __int16 v35 = [v18 accessoryServer];
            [v35 setStateNumber:v34];

            uint64_t v36 = *(void *)(a1 + 48);
            long long v37 = [v18 accessoryServer];
            uint64_t v38 = [v37 blePeripheral];
            [v38 setStateNumber:v36];

            uint64_t v16 = v45;
            uint64_t v15 = v46;
          }
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v47 objects:v61 count:16];
    }
    while (v15);
  }

  [*(id *)(a1 + 32) updateCachedStateForIdentifier:*(void *)(a1 + 40) stateNumber:*(void *)(a1 + 48)];
  BOOL v39 = [*(id *)(a1 + 32) hapWiProxBLEBrowser];
  [v39 updateStateForIdentifier:*(void *)(a1 + 40) stateNumber:*(void *)(a1 + 48)];
}

- (void)configureAccessoryWithIdentifier:(id)a3 trackState:(BOOL)a4 connectionPriority:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [(HAPAccessoryServerBrowser *)self workQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96__HAPAccessoryServerBrowserBTLE_configureAccessoryWithIdentifier_trackState_connectionPriority___block_invoke;
  v11[3] = &unk_1E69F13A0;
  void v11[4] = self;
  id v12 = v8;
  BOOL v14 = a4;
  unint64_t v13 = a5;
  id v10 = v8;
  dispatch_async(v9, v11);
}

void __96__HAPAccessoryServerBrowserBTLE_configureAccessoryWithIdentifier_trackState_connectionPriority___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) recentlySeenPairedPeripherals];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  [v3 updatePairedPeripheralConfiguration:*(unsigned __int8 *)(a1 + 56) connectionPriority:*(void *)(a1 + 48)];
}

- (void)resetLastSeenForAccessoryServersWithIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__HAPAccessoryServerBrowserBTLE_resetLastSeenForAccessoryServersWithIdentifiers___block_invoke;
  v7[3] = &unk_1E69F46E0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __81__HAPAccessoryServerBrowserBTLE_resetLastSeenForAccessoryServersWithIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        id v8 = objc_msgSend(*(id *)(a1 + 40), "hapWiProxBLEBrowser", (void)v10);
        [v8 resetLastSeenForTrackedAccessories:v7];

        id v9 = [*(id *)(a1 + 40) delegate];
        [v9 accessoryServerBrowser:*(void *)(a1 + 40) didChangeReachability:0 forAccessoryServerWithIdentifier:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)_probeReachabilityForAccessoryServersWithIdentifiers:(id)a3 forceScan:(BOOL)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __111__HAPAccessoryServerBrowserBTLE__probeReachabilityForAccessoryServersWithIdentifiers_forceScan_withCompletion___block_invoke;
  v12[3] = &unk_1E69F2960;
  id v13 = v8;
  id v14 = v9;
  v12[4] = self;
  BOOL v15 = a4;
  id v10 = v8;
  id v11 = v9;
  [(HAPAccessoryServerBrowserBTLE *)self _powerOnCentralManagerWithCompletion:v12];
}

void __111__HAPAccessoryServerBrowserBTLE__probeReachabilityForAccessoryServersWithIdentifiers_forceScan_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1D944E080]();
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v10 = 138543618;
      id v11 = v7;
      __int16 v12 = 2114;
      id v13 = v3;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to probe reachability for accessory servers because BTLE failed to power on with error: %{public}@", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v8 = MEMORY[0x1D944E2D0](*(void *)(a1 + 48));
    id v9 = (void *)v8;
    if (v8) {
      (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, 0, 0);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _performTimedScanForIdentifiers:*(void *)(a1 + 40) forceScan:*(unsigned __int8 *)(a1 + 56) withCompletion:*(void *)(a1 + 48)];
  }
}

- (void)probeReachabilityForAccessoryServersWithIdentifiers:(id)a3 forceScan:(BOOL)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = [(HAPAccessoryServerBrowser *)self workQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __110__HAPAccessoryServerBrowserBTLE_probeReachabilityForAccessoryServersWithIdentifiers_forceScan_withCompletion___block_invoke;
  v13[3] = &unk_1E69F3600;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __110__HAPAccessoryServerBrowserBTLE_probeReachabilityForAccessoryServersWithIdentifiers_forceScan_withCompletion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _canStartScan])
  {
    [*(id *)(a1 + 32) _probeReachabilityForAccessoryServersWithIdentifiers:*(void *)(a1 + 40) forceScan:*(unsigned __int8 *)(a1 + 56) withCompletion:*(void *)(a1 + 48)];
    id v2 = [*(id *)(a1 + 32) hapWiProxBLEBrowser];
    [v2 startTrackingHAPBLEAccessoriesWithIdentifiers:*(void *)(a1 + 40)];
  }
}

- (void)setReachabilityCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__HAPAccessoryServerBrowserBTLE_setReachabilityCompletionHandler___block_invoke;
  v7[3] = &unk_1E69F3C68;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __66__HAPAccessoryServerBrowserBTLE_setReachabilityCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setReachabilityCompletion:*(void *)(a1 + 40)];
}

- (void)_discoverAccessoryServerWithIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__HAPAccessoryServerBrowserBTLE__discoverAccessoryServerWithIdentifier___block_invoke;
  v6[3] = &unk_1E69F4128;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HAPAccessoryServerBrowserBTLE *)self _powerOnCentralManagerWithCompletion:v6];
}

void __72__HAPAccessoryServerBrowserBTLE__discoverAccessoryServerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v4);

  if (v3)
  {
    id v5 = (void *)MEMORY[0x1D944E080]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      id v15 = v8;
      __int16 v16 = 2114;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      id v19 = v3;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unable to discover accessory server %{public}@ because BTLE failed to power on with error: %{public}@", buf, 0x20u);
    }
    if ([*(id *)(a1 + 32) _delegateRespondsToSelector:sel_accessoryServerBrowser_didFailToDiscoverAccessoryServerWithIdentifier_])
    {
      int v10 = [*(id *)(a1 + 32) delegateQueue];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __72__HAPAccessoryServerBrowserBTLE__discoverAccessoryServerWithIdentifier___block_invoke_158;
      v12[3] = &unk_1E69F46E0;
      id v11 = *(void **)(a1 + 40);
      v12[4] = *(void *)(a1 + 32);
      id v13 = v11;
      dispatch_async(v10, v12);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _performTimedConnectionRequestForIdentifier:*(void *)(a1 + 40)];
  }
}

void __72__HAPAccessoryServerBrowserBTLE__discoverAccessoryServerWithIdentifier___block_invoke_158(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didFailToDiscoverAccessoryServerWithIdentifier:*(void *)(a1 + 40)];
}

- (void)discoverAccessoryServerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__HAPAccessoryServerBrowserBTLE_discoverAccessoryServerWithIdentifier___block_invoke;
  v7[3] = &unk_1E69F46E0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __71__HAPAccessoryServerBrowserBTLE_discoverAccessoryServerWithIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _discoverAccessoryServerWithIdentifier:*(void *)(a1 + 40)];
}

- (void)_callPowerOnCompletionsWithError:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  dispatch_assert_queue_V2(v5);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(HAPAccessoryServerBrowserBTLE *)self powerOnCentralManagerCompletions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = MEMORY[0x1D944E2D0](*(void *)(*((void *)&v14 + 1) + 8 * v10));
        id v12 = (void *)v11;
        if (v11) {
          (*(void (**)(uint64_t, id))(v11 + 16))(v11, v4);
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v13 = [(HAPAccessoryServerBrowserBTLE *)self powerOnCentralManagerCompletions];
  [v13 removeAllObjects];
}

- (void)_powerOnCentralManagerWithCompletion:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HAPAccessoryServerBrowserBTLE *)self centralManager];

  if (v6)
  {
    uint64_t v7 = [(HAPAccessoryServerBrowserBTLE *)self centralManager];
    unint64_t v8 = [v7 state];

    switch(v8)
    {
      case 2uLL:
        BOOL v28 = (void *)MEMORY[0x1E4F28C58];
        long long v29 = @"Failed to power on Bluetooth because Bluetooth LE is unsupported on this system.";
        uint64_t v30 = 48;
        break;
      case 4uLL:
        BOOL v28 = (void *)MEMORY[0x1E4F28C58];
        long long v29 = @"Failed to power on Bluetooth because the Bluetooth is turned off in Settings.";
        uint64_t v30 = 57;
        break;
      case 5uLL:
        uint64_t v9 = MEMORY[0x1D944E2D0](v4);
        uint64_t v10 = (void *)v9;
        if (v9) {
          (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
        }
        goto LABEL_24;
      default:
        uint64_t v33 = (void *)MEMORY[0x1D944E080]();
        uint64_t v34 = self;
        __int16 v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          uint64_t v36 = HMFGetLogIdentifier();
          long long v37 = (void *)v36;
          if (v8 > 5) {
            uint64_t v38 = @"Unenumerated State?";
          }
          else {
            uint64_t v38 = off_1E69F1460[v8];
          }
          *(_DWORD *)buf = 138543874;
          uint64_t v42 = v36;
          __int16 v43 = 2048;
          unint64_t v44 = v8;
          __int16 v45 = 2112;
          uint64_t v46 = v38;
          _os_log_impl(&dword_1D4758000, v35, OS_LOG_TYPE_INFO, "%{public}@Central Manager has state %ld (%@), adding block to be called when the state is updated.", buf, 0x20u);
        }
        uint64_t v10 = [(HAPAccessoryServerBrowserBTLE *)v34 powerOnCentralManagerCompletions];
        long long v32 = (void *)MEMORY[0x1D944E2D0](v4);
        [v10 addObject:v32];
LABEL_23:

LABEL_24:
        goto LABEL_25;
    }
    uint64_t v10 = [v28 errorWithHMErrorCode:v30 reason:v29 underlyingError:0];
    uint64_t v31 = MEMORY[0x1D944E2D0](v4);
    long long v32 = (void *)v31;
    if (v31) {
      (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v10);
    }
    goto LABEL_23;
  }
  uint64_t v11 = [(HAPAccessoryServerBrowserBTLE *)self powerOnCentralManagerCompletions];
  id v12 = (void *)MEMORY[0x1D944E2D0](v4);
  [v11 addObject:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F1BD18]);
  long long v14 = [(HAPAccessoryServerBrowser *)self workQueue];
  long long v15 = (void *)[v13 initWithDelegate:self queue:v14];
  [(HAPAccessoryServerBrowserBTLE *)self setCentralManager:v15];

  long long v16 = [CBConnectionsObserver alloc];
  long long v17 = [(HAPAccessoryServerBrowserBTLE *)self centralManager];
  __int16 v18 = [(HAPAccessoryServerBrowser *)self workQueue];
  id v40 = 0;
  uint64_t v19 = [(CBConnectionsObserver *)v16 initWithCentralManager:v17 Queue:v18 Error:&v40];
  id v20 = v40;
  [(HAPAccessoryServerBrowserBTLE *)self setConnectionsObserver:v19];

  if (v20)
  {
    int v21 = (void *)MEMORY[0x1D944E080]();
    id v22 = self;
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = (uint64_t)v24;
      __int16 v43 = 2114;
      unint64_t v44 = (unint64_t)v20;
      _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_ERROR, "%{public}@Connections Observer failed to initialize, error (%{public}@)", buf, 0x16u);
    }
    uint64_t v25 = [(HAPAccessoryServerBrowserBTLE *)v22 connectionsObserver];

    if (v25)
    {
      id v26 = [(HAPAccessoryServerBrowserBTLE *)v22 connectionsObserver];
      id v39 = v20;
      [v26 cleanupWithError:&v39];
      id v27 = v39;

      [(HAPAccessoryServerBrowserBTLE *)v22 setConnectionsObserver:0];
      id v20 = v27;
    }
  }

LABEL_25:
}

- (void)_startScanningForReachability:(id)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HAPAccessoryServerBrowserBTLE *)self _hasRecentlySeenAccessoriesWithIdentifiers:v4])
  {
    BOOL v5 = [(HAPAccessoryServerBrowserBTLE *)self _hasPairedAccessoriesOfType:1];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D944E080]();
    uint64_t v7 = self;
    unint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v9;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@Not all accessories are in recently seen", buf, 0xCu);
    }
    BOOL v5 = 1;
  }
  if ([(HAPAccessoryServerBrowserBTLE *)self scanState] || !v5)
  {
    int v21 = (void *)MEMORY[0x1D944E080]();
    id v22 = self;
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      uint64_t v25 = [(HAPAccessoryServerBrowserBTLE *)v22 scanState];
      id v26 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      uint64_t v30 = v24;
      __int16 v31 = 2048;
      uint64_t v32 = v25;
      __int16 v33 = 2112;
      uint64_t v34 = v26;
      _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_INFO, "%{public}@Skip 1.0 reachability: Scan State: %tu, 1.0 Accessories: %@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v10 = [(HAPAccessoryServerBrowserBTLE *)self centralManager];
    [v10 stopScan];

    uint64_t v11 = (void *)MEMORY[0x1D944E080]([(HAPAccessoryServerBrowserBTLE *)self setScanState:2]);
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      long long v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v14;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_INFO, "%{public}@Starting scan for 1.0 reachability", buf, 0xCu);
    }
    long long v15 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"FED4"];
    long long v16 = [(HAPAccessoryServerBrowserBTLE *)v12 centralManager];
    v37[0] = v15;
    long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    uint64_t v18 = *MEMORY[0x1E4F1BC60];
    v35[0] = *MEMORY[0x1E4F1BC88];
    v35[1] = v18;
    uint64_t v19 = *MEMORY[0x1E4F1BC70];
    v35[2] = *MEMORY[0x1E4F1BC58];
    v35[3] = v19;
    v36[0] = MEMORY[0x1E4F1CC38];
    v36[1] = MEMORY[0x1E4F1CC28];
    v36[2] = MEMORY[0x1E4F1CC28];
    v36[3] = &unk_1F2C80A60;
    v35[4] = *MEMORY[0x1E4F1BC68];
    v36[4] = &unk_1F2C80A78;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:5];
    [v16 scanForPeripheralsWithServices:v17 options:v20];
  }
  if ([(HAPAccessoryServerBrowserBTLE *)self _delegateRespondsToSelector:sel_accessoryServerBrowser_didStartDiscoveringWithError_])
  {
    id v27 = [(HAPAccessoryServerBrowserBTLE *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__HAPAccessoryServerBrowserBTLE__startScanningForReachability___block_invoke;
    block[3] = &unk_1E69F4330;
    void block[4] = self;
    dispatch_async(v27, block);
  }
}

void __63__HAPAccessoryServerBrowserBTLE__startScanningForReachability___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didStartDiscoveringWithError:0];
}

- (BOOL)_hasRecentlySeenAccessoriesWithIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  BOOL v5 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(HAPAccessoryServerBrowserBTLE *)self recentlySeenPairedPeripherals];
  uint64_t v7 = [v6 objectEnumerator];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v15 + 1) + 8 * v11) identifier];
        [v5 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  char v13 = [v4 isSubsetOfSet:v5];
  return v13;
}

- (BOOL)_hasPairedAccessoriesOfType:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v5 = [(HAPAccessoryServerBrowserBTLE *)self recentlySeenPairedPeripherals];
  id v6 = [v5 objectEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v11 advertisementFormat] == a3)
        {
          id v12 = [v11 identifier];
          BOOL v13 = [(HAPAccessoryServerBrowser *)self isPaired:v12];

          if (v13)
          {
            BOOL v14 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_12:

  return v14;
}

- (void)_startBrowsingForLegacyHAPBTLE100Accessories
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(HAPAccessoryServerBrowserBTLE *)self centralManager];
  [v3 stopScan];

  id v4 = (void *)MEMORY[0x1D944E080]([(HAPAccessoryServerBrowserBTLE *)self setScanState:1]);
  BOOL v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v7;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting scan for HomeKit 1.0 accessories...", buf, 0xCu);
  }
  uint64_t v8 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"FED4"];
  uint64_t v9 = [(HAPAccessoryServerBrowserBTLE *)v5 centralManager];
  long long v18 = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  uint64_t v11 = *MEMORY[0x1E4F1BC60];
  v16[0] = *MEMORY[0x1E4F1BC88];
  v16[1] = v11;
  uint64_t v12 = *MEMORY[0x1E4F1BC70];
  v16[2] = *MEMORY[0x1E4F1BC58];
  v16[3] = v12;
  v17[0] = MEMORY[0x1E4F1CC38];
  v17[1] = MEMORY[0x1E4F1CC38];
  v17[2] = MEMORY[0x1E4F1CC38];
  v17[3] = &unk_1F2C80A60;
  void v16[4] = *MEMORY[0x1E4F1BC68];
  v17[4] = &unk_1F2C80A78;
  BOOL v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
  [v9 scanForPeripheralsWithServices:v10 options:v13];

  if ([(HAPAccessoryServerBrowserBTLE *)v5 _delegateRespondsToSelector:sel_accessoryServerBrowser_didStartDiscoveringWithError_])
  {
    BOOL v14 = [(HAPAccessoryServerBrowserBTLE *)v5 delegateQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__HAPAccessoryServerBrowserBTLE__startBrowsingForLegacyHAPBTLE100Accessories__block_invoke;
    v15[3] = &unk_1E69F4330;
    void v15[4] = v5;
    dispatch_async(v14, v15);
  }
}

void __77__HAPAccessoryServerBrowserBTLE__startBrowsingForLegacyHAPBTLE100Accessories__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didStartDiscoveringWithError:0];
}

- (void)_stopActiveScanWithForce:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if ([(HAPAccessoryServerBrowserBTLE *)self scanState]
    || [(HAPAccessoryServerBrowserBTLE *)self remoteBrowsingEnabled])
  {
    BOOL v5 = (void *)MEMORY[0x1D944E080]();
    id v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v46 = v8;
      __int16 v47 = 2048;
      uint64_t v48 = [(HAPAccessoryServerBrowserBTLE *)v6 scanState];
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Stopping scans: Scan State: %tu", buf, 0x16u);
    }
    uint64_t v9 = [(HAPAccessoryServerBrowserBTLE *)v6 centralManager];
    [v9 stopScan];

    [(HAPAccessoryServerBrowserBTLE *)v6 setScanState:0];
  }
  uint64_t v10 = [(HAPAccessoryServerBrowserBTLE *)self hapWiProxBLEBrowser];
  [v10 stopBrowsingForHAPBLEAccessories:v3];

  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v12 = [(HAPAccessoryServerBrowserBTLE *)self discoveredPeripheralsWithAccessories];
  BOOL v13 = [v12 keyEnumerator];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v40;
    __int16 v31 = v37;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v40 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        long long v19 = -[HAPAccessoryServerBrowserBTLE _discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:](self, "_discoveredAccessoryServerTupleForBLEPeripheral:shouldMerge:", v18, 0, v31);
        uint64_t v20 = [v19 accessoryServer];

        if (v20)
        {
          uint64_t v21 = [v20 identifier];
          BOOL v22 = [(HAPAccessoryServerBrowser *)self isPaired:v21];

          if (!v22)
          {
            [v11 addObject:v18];
            if ([(HAPAccessoryServerBrowserBTLE *)self _delegateRespondsToSelector:sel_accessoryServerBrowser_didRemoveAccessoryServer_error_])
            {
              __int16 v23 = [(HAPAccessoryServerBrowserBTLE *)self delegateQueue];
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              v37[0] = __58__HAPAccessoryServerBrowserBTLE__stopActiveScanWithForce___block_invoke;
              v37[1] = &unk_1E69F46E0;
              void v37[2] = self;
              id v38 = v20;
              dispatch_async(v23, block);
            }
          }
        }
        else
        {
          [v11 addObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v15);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v24 = v11;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v32 objects:v43 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        uint64_t v30 = [(HAPAccessoryServerBrowserBTLE *)self discoveredPeripheralsWithAccessories];
        [v30 removeObjectForKey:v29];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v32 objects:v43 count:16];
    }
    while (v26);
  }
}

void __58__HAPAccessoryServerBrowserBTLE__stopActiveScanWithForce___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didRemoveAccessoryServer:*(void *)(a1 + 40) error:0];
}

- (BOOL)remoteBrowsingAndScanEnabled
{
  id v2 = [(HAPAccessoryServerBrowserBTLE *)self hapWiProxBLEBrowser];
  BOOL v3 = (~[v2 routeMode] & 3) == 0;

  return v3;
}

- (BOOL)remoteBrowsingEnabled
{
  id v2 = [(HAPAccessoryServerBrowserBTLE *)self hapWiProxBLEBrowser];
  BOOL v3 = [v2 routeMode] & 1;

  return v3;
}

- (void)pauseScans
{
  BOOL v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __43__HAPAccessoryServerBrowserBTLE_pauseScans__block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __43__HAPAccessoryServerBrowserBTLE_pauseScans__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) centralManager];
  [v2 stopScan];

  BOOL v3 = [*(id *)(a1 + 32) hapWiProxBLEBrowser];
  [v3 pauseScans];

  id v4 = *(void **)(a1 + 32);

  return [v4 setScanState:0];
}

- (void)_matchAccessoryServerWithSetupID:(id)a3 serverIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void *))a5;
  if (v10)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v11 = [(HAPAccessoryServerBrowserBTLE *)self discoveredPeripheralsWithAccessories];
    uint64_t v12 = [v11 objectEnumerator];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v43 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v30;
LABEL_4:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = [*(id *)(*((void *)&v29 + 1) + 8 * v16) accessoryServer];
        if ([v17 matchesSetupID:v8 serverIdentifier:v9]) {
          break;
        }

        if (v14 == ++v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v43 count:16];
          if (v14) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      uint64_t v18 = [v17 identifier];
      BOOL v19 = [(HAPAccessoryServerBrowser *)self isPaired:v18];

      uint64_t v20 = [v17 hasPairings];
      uint64_t v21 = v20;
      if (!v19 && !v20) {
        goto LABEL_13;
      }
      __int16 v23 = (void *)MEMORY[0x1D944E080]();
      id v24 = self;
      uint64_t v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        BOOL v28 = HMFGetLogIdentifier();
        uint64_t v26 = [NSNumber numberWithBool:v19];
        uint64_t v27 = [NSNumber numberWithBool:v21];
        *(_DWORD *)buf = 138544386;
        long long v34 = v28;
        __int16 v35 = 2114;
        uint64_t v36 = v17;
        __int16 v37 = 2114;
        id v38 = v8;
        __int16 v39 = 2114;
        long long v40 = v26;
        __int16 v41 = 2114;
        long long v42 = v27;
        _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_INFO, "%{public}@BTLE Accessory server %{public}@ matches setupID %{public}@ and is paired/hasPairings: (%{public}@/%{public}@)", buf, 0x34u);
      }
      uint64_t v22 = 1;
    }
    else
    {
LABEL_10:
      long long v17 = 0;
LABEL_13:
      uint64_t v22 = 0;
    }

    v10[2](v10, v22, v17);
  }
}

- (void)matchAccessoryServerWithSetupID:(id)a3 serverIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HAPAccessoryServerBrowser *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __100__HAPAccessoryServerBrowserBTLE_matchAccessoryServerWithSetupID_serverIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E69F3D58;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __100__HAPAccessoryServerBrowserBTLE_matchAccessoryServerWithSetupID_serverIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _matchAccessoryServerWithSetupID:*(void *)(a1 + 40) serverIdentifier:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)updateRemoteBrowsing:(BOOL)a3 shouldScan:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = [(HAPAccessoryServerBrowserBTLE *)self hapWiProxBLEBrowser];
  int v7 = [v6 routeMode];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x1D944E080]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      if (v4) {
        id v12 = @"WHB";
      }
      else {
        id v12 = @"LOCAL";
      }
      id v13 = HMFBooleanToString();
      int v16 = 138543874;
      id v17 = v11;
      __int16 v18 = 2114;
      BOOL v19 = v12;
      __int16 v20 = 2114;
      uint64_t v21 = v13;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_INFO, "%{public}@Setting BTLE discovery to '%{public}@'. WHB Scan: %{public}@", (uint8_t *)&v16, 0x20u);
    }
    id v14 = [(HAPAccessoryServerBrowserBTLE *)v9 hapWiProxBLEBrowser];
    [v14 setRouteMode:0];

    uint64_t v15 = [(HAPAccessoryServerBrowserBTLE *)v9 hapWiProxBLEBrowser];
    [v15 restartScans];
  }
}

- (void)stopDiscoveringAccessoryServers
{
  BOOL v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __64__HAPAccessoryServerBrowserBTLE_stopDiscoveringAccessoryServers__block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __64__HAPAccessoryServerBrowserBTLE_stopDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v2 = [*(id *)(a1 + 32) discoveredPeripheralsWithAccessories];
  BOOL v3 = [v2 objectEnumerator];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v25 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v24 + 1) + 8 * v7);
      id v9 = [v8 accessoryServer];
      uint64_t v10 = [v9 pendingRemovePairing];

      if (v10 == 1) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = (void *)MEMORY[0x1D944E080]();
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = HMFGetLogIdentifier();
      id v17 = [v8 accessoryServer];
      *(_DWORD *)buf = 138543618;
      long long v29 = v16;
      __int16 v30 = 2114;
      long long v31 = v17;
      _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_INFO, "%{public}@Not stopping active scan because we have pending cancelled pairings to remove for accessory: %{public}@", buf, 0x16u);
    }

    if ([*(id *)(a1 + 32) remoteBrowsingEnabled]) {
      goto LABEL_17;
    }
  }
  else
  {
LABEL_9:

    uint64_t v11 = [*(id *)(a1 + 32) targetedScanAccessoryIdentifiers];
    if ([v11 count])
    {
      char v12 = [*(id *)(a1 + 32) remoteBrowsingEnabled];

      if ((v12 & 1) == 0) {
        goto LABEL_20;
      }
    }
    else
    {
    }
LABEL_17:
    __int16 v18 = (void *)MEMORY[0x1D944E080]();
    id v19 = *(id *)(a1 + 32);
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v29 = v21;
      _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_INFO, "%{public}@Stopping active scan because a client requested it and there aren't any outstanding targeted scans", buf, 0xCu);
    }
    [*(id *)(a1 + 32) _stopActiveScanWithForce:1];
  }
LABEL_20:
  [*(id *)(a1 + 32) setPerformingGeneralScan:0];
  if ([*(id *)(a1 + 32) _delegateRespondsToSelector:sel_accessoryServerBrowser_didStopDiscoveringWithError_])
  {
    uint64_t v22 = [*(id *)(a1 + 32) delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __64__HAPAccessoryServerBrowserBTLE_stopDiscoveringAccessoryServers__block_invoke_132;
    block[3] = &unk_1E69F4330;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(v22, block);
  }
}

void __64__HAPAccessoryServerBrowserBTLE_stopDiscoveringAccessoryServers__block_invoke_132(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didStopDiscoveringWithError:0];
}

- (void)_startDiscoveringAccessoryServers
{
  [(HAPAccessoryServerBrowserBTLE *)self setPerformingGeneralScan:1];
  BOOL v3 = [(HAPAccessoryServerBrowserBTLE *)self hapWiProxBLEBrowser];
  [v3 startBrowsingForHAPBLEAccessories];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__HAPAccessoryServerBrowserBTLE__startDiscoveringAccessoryServers__block_invoke;
  v4[3] = &unk_1E69F4380;
  v4[4] = self;
  [(HAPAccessoryServerBrowserBTLE *)self _powerOnCentralManagerWithCompletion:v4];
}

void __66__HAPAccessoryServerBrowserBTLE__startDiscoveringAccessoryServers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v3)
  {
    if ([v4 _delegateRespondsToSelector:sel_accessoryServerBrowser_didStartDiscoveringWithError_])
    {
      uint64_t v5 = [*(id *)(a1 + 32) delegateQueue];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __66__HAPAccessoryServerBrowserBTLE__startDiscoveringAccessoryServers__block_invoke_2;
      v6[3] = &unk_1E69F46E0;
      v6[4] = *(void *)(a1 + 32);
      id v7 = v3;
      dispatch_async(v5, v6);
    }
  }
  else
  {
    [v4 _startBrowsingForLegacyHAPBTLE100Accessories];
    [*(id *)(a1 + 32) _updateTargetedScanTimer];
  }
}

void __66__HAPAccessoryServerBrowserBTLE__startDiscoveringAccessoryServers__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerBrowser:*(void *)(a1 + 32) didStartDiscoveringWithError:*(void *)(a1 + 40)];
}

- (void)startDiscoveringAccessoryServers
{
  id v3 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __65__HAPAccessoryServerBrowserBTLE_startDiscoveringAccessoryServers__block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __65__HAPAccessoryServerBrowserBTLE_startDiscoveringAccessoryServers__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _canStartScan];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 _startDiscoveringAccessoryServers];
  }
  return result;
}

- (void)setScanState:(int64_t)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_scanState = a3;

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)scanState
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  int64_t scanState = self->_scanState;
  os_unfair_lock_unlock(p_lock);
  return scanState;
}

- (BOOL)_canStartScan
{
  if (HAPIsHH2Enabled_onceToken != -1) {
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_12024);
  }
  if (HAPIsHH2Enabled_hh2Enabled != 1) {
    return 1;
  }
  id v3 = [(HAPAccessoryServerBrowserBTLE *)self delegate];
  char v4 = [v3 isServerLinkTypeBrowseable:2];

  return v4;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __51__HAPAccessoryServerBrowserBTLE_setDelegate_queue___block_invoke;
  block[3] = &unk_1E69F4708;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __51__HAPAccessoryServerBrowserBTLE_setDelegate_queue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = *(void **)(a1 + 32);

  return [v3 setDelegateQueue:v2];
}

- (int64_t)linkType
{
  return 2;
}

- (HAPAccessoryServerBrowserBTLE)initWithQueue:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)HAPAccessoryServerBrowserBTLE;
  id v3 = [(HAPAccessoryServerBrowser *)&v21 initWithQueue:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    discoveredPeripheralsWithAccessories = v3->_discoveredPeripheralsWithAccessories;
    v3->_discoveredPeripheralsWithAccessories = (NSMapTable *)v4;

    uint64_t v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    recentlySeenPairedPeripherals = v3->_recentlySeenPairedPeripherals;
    v3->_recentlySeenPairedPeripherals = (NSMapTable *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    powerOnCentralManagerCompletions = v3->_powerOnCentralManagerCompletions;
    v3->_powerOnCentralManagerCompletions = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA70] orderedSet];
    peripheralsWithConnectionRequests = v3->_peripheralsWithConnectionRequests;
    v3->_peripheralsWithConnectionRequests = (NSMutableOrderedSet *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA70] orderedSet];
    peripheralsPendingConnection = v3->_peripheralsPendingConnection;
    v3->_peripheralsPendingConnection = (NSMutableOrderedSet *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    targetedScanAccessoryIdentifiers = v3->_targetedScanAccessoryIdentifiers;
    v3->_targetedScanAccessoryIdentifiers = (NSMutableArray *)v14;

    uint64_t v16 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    identifiersWithReachabilityScanTuples = v3->_identifiersWithReachabilityScanTuples;
    v3->_identifiersWithReachabilityScanTuples = (NSMapTable *)v16;

    uint64_t v18 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    peripheralDisconnectionMonitorMap = v3->_peripheralDisconnectionMonitorMap;
    v3->_peripheralDisconnectionMonitorMap = (NSMapTable *)v18;

    v3->_peripheralDisconnectionTimeout = 10;
    v3->_int64_t scanState = 0;
    v3->_unint64_t qosLimits = 0;
  }
  return v3;
}

- (BOOL)isPerformingGeneralScan
{
  uint64_t v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_performingGeneralScan;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setPerformingGeneralScan:(BOOL)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->_performingGeneralScan = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)updateCachedStateForIdentifier:(id)a3 stateNumber:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [(HAPAccessoryServerBrowserBTLE *)self cachedAccessoryForIdentifier:v6];
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 peripheralInfo];
      uint64_t v11 = [v10 stateNumber];
      uint64_t v12 = HAPCompareStateNumberWithRollover(v11, v7, 0xFFuLL);

      if (v12 == -1)
      {
        id v13 = (void *)MEMORY[0x1D944E080]();
        uint64_t v14 = self;
        uint64_t v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          uint64_t v16 = HMFGetLogIdentifier();
          id v17 = [v9 pairingIdentifier];
          uint64_t v18 = [v9 peripheralInfo];
          id v19 = [v18 stateNumber];
          int v21 = 138544130;
          uint64_t v22 = v16;
          __int16 v23 = 2114;
          long long v24 = v17;
          __int16 v25 = 2114;
          long long v26 = v19;
          __int16 v27 = 2114;
          id v28 = v7;
          _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating cached s# for: %{public}@ from %{public}@ to %{public}@", (uint8_t *)&v21, 0x2Au);
        }
        __int16 v20 = [v9 peripheralInfo];
        [v20 updateStateNumber:v7];

        [(HAPAccessoryServerBrowserBTLE *)v14 saveCacheToDisk:v9];
      }
    }
  }
}

- (void)updateBroadcastKeyForIdentifier:(id)a3 key:(id)a4 keyUpdatedStateNumber:(id)a5 keyUpdatedTime:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(HAPAccessoryServerBrowserBTLE *)self delegate];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __106__HAPAccessoryServerBrowserBTLE_updateBroadcastKeyForIdentifier_key_keyUpdatedStateNumber_keyUpdatedTime___block_invoke;
  v17[3] = &unk_1E69F1378;
  v17[4] = self;
  id v18 = v10;
  id v19 = v12;
  id v20 = v11;
  double v21 = a6;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  [v13 accessoryServerBrowser:self getCacheForAccessoryWithIdentifier:v16 withCompletion:v17];
}

void __106__HAPAccessoryServerBrowserBTLE_updateBroadcastKeyForIdentifier_key_keyUpdatedStateNumber_keyUpdatedTime___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v16 = 0;
  uint64_t v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v16];
  id v5 = v16;
  id v6 = (void *)MEMORY[0x1D944E080]();
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [v4 pairingIdentifier];
      id v12 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      id v18 = v10;
      __int16 v19 = 2114;
      id v20 = v11;
      __int16 v21 = 2114;
      id v22 = v12;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Updating broadcast key for: %{public}@ and state number: %{public}@", buf, 0x20u);
    }
    id v13 = [v4 peripheralInfo];
    [v13 saveBroadcastKey:*(void *)(a1 + 56) keyUpdatedStateNumber:*(void *)(a1 + 48) updatedTime:*(double *)(a1 + 64)];

    [*(id *)(a1 + 32) saveCacheToDisk:v4];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      id v15 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      id v18 = v14;
      __int16 v19 = 2114;
      id v20 = v15;
      __int16 v21 = 2114;
      id v22 = v5;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive cached accessory from accessory: %{public}@ with error: %{public}@", buf, 0x20u);
    }
  }
}

- (void)saveCacheToDisk:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v14 = 0;
  id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v14];
  id v6 = v14;
  if (v5)
  {
    id v7 = [(HAPAccessoryServerBrowserBTLE *)self delegate];
    uint64_t v8 = [v4 pairingIdentifier];
    [v7 accessoryServerBrowser:self saveCache:v5 serverIdentifier:v8];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D944E080]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = [v4 pairingIdentifier];
      *(_DWORD *)buf = 138543874;
      id v16 = v12;
      __int16 v17 = 2114;
      id v18 = v13;
      __int16 v19 = 2114;
      id v20 = v6;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to create BLE cache archive for %{public}@ with error: %{public}@", buf, 0x20u);
    }
  }
}

- (void)removeCachedAccessoryWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowserBTLE *)self delegate];
  [v5 accessoryServerBrowser:self removeCacheForAccessoryWithIdentifier:v4];
}

- (id)cachedAccessoryForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__6440;
  __int16 v19 = __Block_byref_object_dispose__6441;
  id v20 = 0;
  id v5 = [(HAPAccessoryServerBrowserBTLE *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    uint64_t v8 = [(HAPAccessoryServerBrowserBTLE *)self delegate];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __62__HAPAccessoryServerBrowserBTLE_cachedAccessoryForIdentifier___block_invoke;
    v12[3] = &unk_1E69F1350;
    id v14 = &v15;
    v12[4] = self;
    id v9 = v7;
    id v13 = v9;
    [v8 accessoryServerBrowser:self getCacheForAccessoryWithIdentifier:v4 withCompletion:v12];

    dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __62__HAPAccessoryServerBrowserBTLE_cachedAccessoryForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v12 = 0;
    uint64_t v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v12];
    id v5 = v12;
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v4;

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v8 = (void *)MEMORY[0x1D944E080]();
      id v9 = *(id *)(a1 + 32);
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v14 = v11;
        __int16 v15 = 2114;
        id v16 = v5;
        _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive cached accessory from accessory cache data: %{public}@", buf, 0x16u);
      }
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)setConnectionLatency:(int64_t)a3 forPeripheral:(id)a4
{
  id v6 = a4;
  id v7 = [(HAPAccessoryServerBrowser *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __68__HAPAccessoryServerBrowserBTLE_setConnectionLatency_forPeripheral___block_invoke;
  block[3] = &unk_1E69F2088;
  id v11 = self;
  int64_t v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __68__HAPAccessoryServerBrowserBTLE_setConnectionLatency_forPeripheral___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 2)
  {
    unint64_t v2 = *(void *)(a1 + 48);
    if (v2 > 2) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = qword_1D4912AB8[v2];
    }
    id v4 = [*(id *)(a1 + 40) centralManager];
    [v4 setDesiredConnectionLatency:v3 forPeripheral:*(void *)(a1 + 32)];
  }
}

- (unint64_t)_parseAdvertisementData:(id)a3 forPeripheral:(id)a4 name:(id *)a5 pairingUsername:(id *)a6 statusFlags:(id *)a7 stateNumber:(id *)a8 category:(id *)a9 configNumber:(id *)a10 setupHash:(id *)a11
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  uint64_t v17 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F1BC28]];
  id v18 = [v16 name];
  unint64_t v19 = [v18 length];
  unint64_t v20 = [(__CFString *)v17 length];

  if (v19 > v20)
  {
    uint64_t v21 = [v16 name];

    uint64_t v17 = (__CFString *)v21;
  }
  if (!v17) {
    uint64_t v17 = @"Unknown";
  }
  if (a5) {
    *a5 = v17;
  }
  id v22 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F1BC38]];
  uint64_t v23 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"FED4"];
  long long v24 = [v22 objectForKeyedSubscript:v23];
  if ([v24 length] == 9)
  {
    id v25 = v24;
    [v25 bytes];
    HardwareAddressToCString();
    long long v26 = [NSString stringWithUTF8String:v32];
    __int16 v27 = v26;
    if (a6) {
      *a6 = v26;
    }
    uint64_t v28 = [v25 bytes];
    if (a7)
    {
      *a7 = [NSNumber numberWithUnsignedInt:*(unsigned __int8 *)(v28 + 8)];
    }
    if (a9)
    {
      if (*(_WORD *)(v28 + 6))
      {
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
        id v29 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v29 = &unk_1F2C80A48;
      }
      *a9 = v29;
    }

    unint64_t v30 = 1;
  }
  else
  {
    unint64_t v30 = 0;
  }

  return v30;
}

- (void)disconnectFromBTLEAccessoryServer:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HAPAccessoryServerBrowserBTLE_disconnectFromBTLEAccessoryServer___block_invoke;
  v7[3] = &unk_1E69F46E0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__HAPAccessoryServerBrowserBTLE_disconnectFromBTLEAccessoryServer___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(a1 + 32) blePeripheral];
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 40) _discoveredAccessoryServerTupleForBLEPeripheral:v2 shouldMerge:0];

    if (v3)
    {
      id v4 = [*(id *)(a1 + 40) recentlySeenPairedPeripherals];
      id v5 = [*(id *)(a1 + 32) identifier];
      id v6 = [v4 objectForKey:v5];

      id v7 = [v2 cbPeripheral];
      uint64_t v8 = [v7 state];

      if (v8 != 2)
      {
        id v9 = [*(id *)(a1 + 40) hapWiProxBLEBrowser];
        id v10 = [*(id *)(a1 + 32) identifier];
        [v9 resetLastSeenForTrackedAccessories:v10];

        id v11 = [*(id *)(a1 + 40) delegate];
        uint64_t v12 = *(void *)(a1 + 40);
        id v13 = [*(id *)(a1 + 32) identifier];
        [v11 accessoryServerBrowser:v12 didChangeReachability:0 forAccessoryServerWithIdentifier:v13];

        if (([v2 isCached] & 1) != 0
          || ((id v14 = *(id *)(a1 + 32), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
            ? (id v15 = 0)
            : (id v15 = v14),
              id v16 = v15,
              v14,
              char v17 = [v16 hasBeenDiscovered],
              v16,
              (v17 & 1) == 0))
        {
          id v18 = [*(id *)(a1 + 40) recentlySeenPairedPeripherals];
          unint64_t v19 = [*(id *)(a1 + 32) identifier];
          [v18 removeObjectForKey:v19];
        }
      }
      unint64_t v20 = (void *)MEMORY[0x1D944E080]([v6 setNotifyingCharacteristicUpdated:0]);
      id v21 = *(id *)(a1 + 40);
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = HMFGetLogIdentifier();
        long long v24 = [*(id *)(a1 + 32) shortDescription];
        *(_DWORD *)buf = 138543874;
        __int16 v39 = v23;
        __int16 v40 = 2114;
        __int16 v41 = v24;
        __int16 v42 = 2112;
        __int16 v43 = v2;
        _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_INFO, "%{public}@Cancelling Connection for server, %{public}@, from CB Peripheral: %@", buf, 0x20u);
      }
      [*(id *)(a1 + 40) _removeFromPendingConnections:v2];
      id v25 = *(void **)(a1 + 40);
      long long v26 = [v2 cbPeripheral];
      [v25 _disconnectFromHAPBLEPeripheral:v2 cbPeripheral:v26];
    }
    else
    {
      __int16 v27 = (void *)MEMORY[0x1D944E080]();
      id v28 = *(id *)(a1 + 40);
      id v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        unint64_t v30 = HMFGetLogIdentifier();
        long long v31 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        __int16 v39 = v30;
        __int16 v40 = 2114;
        __int16 v41 = v31;
        _os_log_impl(&dword_1D4758000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unable to find accessory in discoveredAccessory map: %{public}@", buf, 0x16u);
      }
      long long v32 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:54];
      [*(id *)(a1 + 40) _removeFromActiveConnections:v2];
      [*(id *)(a1 + 40) disconnectedHAPPeripheral:v2 error:v32];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __67__HAPAccessoryServerBrowserBTLE_disconnectFromBTLEAccessoryServer___block_invoke_106;
      v35[3] = &unk_1E69F1328;
      int8x16_t v34 = *(int8x16_t *)(a1 + 32);
      id v33 = (id)v34.i64[0];
      int8x16_t v36 = vextq_s8(v34, v34, 8uLL);
      id v37 = v32;
      id v6 = v32;
      [v33 handleDisconnectionWithError:v6 completionHandler:v35];
    }
  }
}

void __67__HAPAccessoryServerBrowserBTLE_disconnectFromBTLEAccessoryServer___block_invoke_106(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __67__HAPAccessoryServerBrowserBTLE_disconnectFromBTLEAccessoryServer___block_invoke_2;
  block[3] = &unk_1E69F4708;
  uint64_t v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

uint64_t __67__HAPAccessoryServerBrowserBTLE_disconnectFromBTLEAccessoryServer___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegatesOfRemovedAccessoryServer:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)connectToBTLEAccessoryServer:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServerBrowser *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__HAPAccessoryServerBrowserBTLE_connectToBTLEAccessoryServer___block_invoke;
  v7[3] = &unk_1E69F46E0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __62__HAPAccessoryServerBrowserBTLE_connectToBTLEAccessoryServer___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(a1 + 32) blePeripheral];
  if (v2
    && ([*(id *)(a1 + 40) discoveredPeripheralsWithAccessories],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 objectForKey:v2],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    id v5 = [MEMORY[0x1E4F65520] sharedPowerLogger];
    id v6 = [*(id *)(a1 + 32) identifier];
    id v7 = [*(id *)(a1 + 32) category];
    [v5 reportConnection:v6 linkType:2 accessoryCategory:v7];

    [*(id *)(a1 + 40) _connectHAPPeripheralWhenAllowed:v2];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D944E080]();
    id v9 = *(id *)(a1 + 40);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = [*(id *)(a1 + 32) shortDescription];
      id v13 = [v2 shortDescription];
      *(_DWORD *)buf = 138543874;
      long long v24 = v11;
      __int16 v25 = 2114;
      long long v26 = v12;
      __int16 v27 = 2114;
      id v28 = v13;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to find accessory in discoveredAccessory map: %{public}@/%{public}@", buf, 0x20u);
    }
    if ([*(id *)(a1 + 40) _delegateRespondsToSelector:sel_accessoryServerBrowser_didFailToDiscoverAccessoryServerWithIdentifier_])
    {
      id v14 = [*(id *)(a1 + 40) delegateQueue];
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      unint64_t v20 = __62__HAPAccessoryServerBrowserBTLE_connectToBTLEAccessoryServer___block_invoke_102;
      id v21 = &unk_1E69F46E0;
      int8x16_t v17 = *(int8x16_t *)(a1 + 32);
      id v15 = (id)v17.i64[0];
      int8x16_t v22 = vextq_s8(v17, v17, 8uLL);
      dispatch_async(v14, &block);
    }
    id v16 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithHMErrorCode:", 54, *(_OWORD *)&v17, block, v19, v20, v21);
    [*(id *)(a1 + 32) handleConnectionWithPeripheral:0 withError:v16];
    [*(id *)(a1 + 40) _notifyDelegatesOfRemovedAccessoryServer:*(void *)(a1 + 32) error:v16];
  }
}

void __62__HAPAccessoryServerBrowserBTLE_connectToBTLEAccessoryServer___block_invoke_102(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  [v4 accessoryServerBrowser:v2 didFailToDiscoverAccessoryServerWithIdentifier:v3];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t140 != -1) {
    dispatch_once(&logCategory__hmf_once_t140, &__block_literal_global_6451);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v141;

  return v2;
}

uint64_t __44__HAPAccessoryServerBrowserBTLE_logCategory__block_invoke()
{
  logCategory__hmf_once_id v141 = HMFCreateOSLogHandle();

  return MEMORY[0x1F41817F8]();
}

@end