@interface HMDSymptomManager
+ (id)_symptomsForProblemFlags:(unint64_t)a3;
+ (id)logCategory;
- (BOOL)_isNearbyDiscoveryActive;
- (BOOL)supportsCurrentDeviceSymptoms;
- (BOOL)supportsRegisteringAccessories;
- (HMDCompanionLinkClient)companionLinkClient;
- (HMDSharingDeviceDiscovery)deviceDiscovery;
- (HMDSymptomManager)initWithDataSource:(id)a3;
- (HMDSymptomManager)initWithQueue:(id)a3 dataSource:(id)a4 supportsRegistering:(BOOL)a5 supportsCurrentDeviceSymptoms:(BOOL)a6 deviceDiscovery:(id)a7 companionLinkClient:(id)a8 wifiManager:(id)a9 notificationCenter:(id)a10 sharingClientFactory:(id)a11;
- (HMDSymptomManagerDataSource)dataSource;
- (HMFWiFiManager)wifiManager;
- (NSArray)nearbyAccessoryUUIDsNotOnCurrentNetwork;
- (NSMapTable)nearbySFDevices;
- (NSMapTable)networkReachableRPCompanionLinkDevices;
- (NSMapTable)symptomContainerByRegisteredAccessory;
- (NSNotificationCenter)notificationCenter;
- (OS_dispatch_queue)workQueue;
- (id)_registeredAccessoryWithIDSIdentifier:(id)a3;
- (id)_symptomsForRegisteredAccessory:(id)a3;
- (id)discoveryAssertion;
- (id)obtainDiscoveryAssertion;
- (id)sharingClientFactory;
- (unint64_t)currentDeviceProblemFlags;
- (unint64_t)deviceDiscoveryFlags;
- (void)_initiateFixForAccessory:(id)a3 completion:(id)a4;
- (void)_registerForCurrentDeviceSymptoms;
- (void)_rpDeviceChangedHandler:(id)a3;
- (void)_rpDeviceFoundHandler:(id)a3;
- (void)_rpDeviceLostHandler:(id)a3;
- (void)_sfDeviceChangedHandler:(id)a3;
- (void)_sfDeviceFoundHandler:(id)a3;
- (void)_sfDeviceLostHandler:(id)a3;
- (void)_start;
- (void)_startCompanionLinkClient;
- (void)_startDeviceDiscovery;
- (void)_stop;
- (void)_stopCompanionLinkClient;
- (void)_stopDeviceDiscovery;
- (void)_updateSymptomsForAllRegisteredAccessories;
- (void)_updateSymptomsForRegisteredAccessory:(id)a3;
- (void)_updateSymptomsForRegisteredAccessoryWithIDSIdentifier:(id)a3;
- (void)dealloc;
- (void)deregisterAccessory:(id)a3;
- (void)handleAccessoryRemovedNotification:(id)a3;
- (void)handleAccessoryWiFiNetworkInfoUpdatedNotification:(id)a3;
- (void)handleCurrentNetworkDidChangeNotification:(id)a3;
- (void)initiateFixForAccessory:(id)a3 completion:(id)a4;
- (void)registerAccessory:(id)a3 delegate:(id)a4;
- (void)releaseDiscoveryAssertionWithAssertionHandle:(id)a3;
- (void)setCurrentDeviceProblemFlags:(unint64_t)a3;
- (void)setDeviceDiscoveryFlags:(unint64_t)a3;
- (void)setDiscoveryAssertion:(id)a3;
- (void)setNearbyAccessoryUUIDsNotOnCurrentNetwork:(id)a3;
- (void)setSupportsRegisteringAccessories:(BOOL)a3;
- (void)startDiscoveringSymptomsRequiringNearbyInfo;
- (void)stopDiscoveringSymptomsRequiringNearbyInfo;
- (void)updateNetworkMismatchInfoWithCompletionHandler:(id)a3;
@end

@implementation HMDSymptomManager

- (void)updateNetworkMismatchInfoWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686D95D0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2302DDE70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2686DA210;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2686D8770;
  v12[5] = v11;
  v13 = self;
  sub_22F6C83BC((uint64_t)v7, (uint64_t)&unk_2686D98D0, (uint64_t)v12);
  swift_release();
}

- (id)obtainDiscoveryAssertion
{
  v2 = (void *)_sSo33HMDAccessorySetupMetricDispatcherC13HomeKitDaemonE24obtainDiscoveryAssertionyXlyF_0();
  return v2;
}

- (void)releaseDiscoveryAssertionWithAssertionHandle:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  _sSo17HMDSymptomManagerC13HomeKitDaemonE25releaseDiscoveryAssertion15assertionHandleyyXlSg_tF_0((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyAccessoryUUIDsNotOnCurrentNetwork, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_discoveryAssertion, 0);
  objc_storeStrong(&self->_sharingClientFactory, 0);
  objc_storeStrong((id *)&self->_networkReachableRPCompanionLinkDevices, 0);
  objc_storeStrong((id *)&self->_nearbySFDevices, 0);
  objc_storeStrong((id *)&self->_symptomContainerByRegisteredAccessory, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
}

- (void)setNearbyAccessoryUUIDsNotOnCurrentNetwork:(id)a3
{
}

- (NSArray)nearbyAccessoryUUIDsNotOnCurrentNetwork
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (HMDSymptomManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDSymptomManagerDataSource *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setSupportsRegisteringAccessories:(BOOL)a3
{
  self->_supportsRegisteringAccessories = a3;
}

- (BOOL)supportsRegisteringAccessories
{
  return self->_supportsRegisteringAccessories;
}

- (void)setDiscoveryAssertion:(id)a3
{
}

- (id)discoveryAssertion
{
  return self->_discoveryAssertion;
}

- (id)sharingClientFactory
{
  return objc_getProperty(self, a2, 96, 1);
}

- (unint64_t)deviceDiscoveryFlags
{
  return self->_deviceDiscoveryFlags;
}

- (NSMapTable)networkReachableRPCompanionLinkDevices
{
  return self->_networkReachableRPCompanionLinkDevices;
}

- (NSMapTable)nearbySFDevices
{
  return self->_nearbySFDevices;
}

- (NSMapTable)symptomContainerByRegisteredAccessory
{
  return self->_symptomContainerByRegisteredAccessory;
}

- (BOOL)supportsCurrentDeviceSymptoms
{
  return self->_supportsCurrentDeviceSymptoms;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (HMFWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (HMDCompanionLinkClient)companionLinkClient
{
  return self->_companionLinkClient;
}

- (HMDSharingDeviceDiscovery)deviceDiscovery
{
  return self->_deviceDiscovery;
}

- (void)handleCurrentNetworkDidChangeNotification:(id)a3
{
  v4 = [(HMDSymptomManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__HMDSymptomManager_handleCurrentNetworkDidChangeNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __63__HMDSymptomManager_handleCurrentNetworkDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSymptomsForAllRegisteredAccessories];
}

- (void)handleAccessoryWiFiNetworkInfoUpdatedNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [(HMDSymptomManager *)self workQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __71__HMDSymptomManager_handleAccessoryWiFiNetworkInfoUpdatedNotification___block_invoke;
    v13[3] = &unk_264A2F820;
    v13[4] = self;
    id v14 = v7;
    dispatch_async(v8, v13);
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not obtain accessory from WiFi network info change notification: %@", buf, 0x16u);
    }
  }
}

uint64_t __71__HMDSymptomManager_handleAccessoryWiFiNetworkInfoUpdatedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSymptomsForRegisteredAccessory:*(void *)(a1 + 40)];
}

- (void)handleAccessoryRemovedNotification:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"HMDAccessoryNotificationKey"];

  id v8 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v8;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7) {
    [(HMDSymptomManager *)self deregisterAccessory:v7];
  }
}

- (void)_rpDeviceLostHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDSymptomManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v13 = 138543618;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Lost RPCompanionLinkDevice: %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v10 = [(HMDSymptomManager *)v7 networkReachableRPCompanionLinkDevices];
  v11 = [v4 idsDeviceIdentifier];
  [v10 removeObjectForKey:v11];

  v12 = [v4 idsDeviceIdentifier];
  [(HMDSymptomManager *)v7 _updateSymptomsForRegisteredAccessoryWithIDSIdentifier:v12];
}

- (void)_rpDeviceChangedHandler:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDSymptomManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v25 = 138543618;
    v26 = v9;
    __int16 v27 = 2112;
    id v28 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@RPCompanionLinkDevice %@ changed", (uint8_t *)&v25, 0x16u);
  }
  uint64_t v10 = [(HMDSymptomManager *)v7 networkReachableRPCompanionLinkDevices];
  v11 = [v4 idsDeviceIdentifier];
  v12 = [v10 objectForKey:v11];

  if (v12)
  {
    int v13 = [(HMDSymptomManager *)v7 networkReachableRPCompanionLinkDevices];
    id v14 = [v4 idsDeviceIdentifier];
    [v13 setObject:v4 forKey:v14];

    __int16 v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = v7;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      int v25 = 138543618;
      v26 = v18;
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@RPCompanionLinkDevice %@ changed", (uint8_t *)&v25, 0x16u);
    }
    uint64_t v19 = [v4 idsDeviceIdentifier];
    [(HMDSymptomManager *)v16 _updateSymptomsForRegisteredAccessoryWithIDSIdentifier:v19];
  }
  else
  {
    v20 = (void *)MEMORY[0x230FBD990]();
    v21 = v7;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      v24 = [(HMDSymptomManager *)v21 networkReachableRPCompanionLinkDevices];
      int v25 = 138543874;
      v26 = v23;
      __int16 v27 = 2112;
      id v28 = v4;
      __int16 v29 = 2112;
      v30 = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Did not find RPCompanionLinkDevice %@ in the network reachable RPCompanionLinkDevices: %@", (uint8_t *)&v25, 0x20u);
    }
    [(HMDSymptomManager *)v21 _rpDeviceFoundHandler:v4];
  }
}

- (void)_rpDeviceFoundHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDSymptomManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v13 = 138543618;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Found new RPCompanionLinkDevice: %@)", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v10 = [(HMDSymptomManager *)v7 networkReachableRPCompanionLinkDevices];
  v11 = [v4 idsDeviceIdentifier];
  [v10 setObject:v4 forKey:v11];

  v12 = [v4 idsDeviceIdentifier];
  [(HMDSymptomManager *)v7 _updateSymptomsForRegisteredAccessoryWithIDSIdentifier:v12];
}

- (void)_sfDeviceLostHandler:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDSymptomManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v17 = 138543618;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Lost SFDevice: %@", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v10 = [(HMDSymptomManager *)v7 nearbySFDevices];
  v11 = [v4 idsIdentifier];
  [v10 removeObjectForKey:v11];

  v12 = [v4 idsIdentifier];
  int v13 = [(HMDSymptomManager *)v7 _registeredAccessoryWithIDSIdentifier:v12];

  if (v13)
  {
    [(HMDSymptomManager *)v7 _updateSymptomsForRegisteredAccessory:v13];
    id v14 = [(HMDSymptomManager *)v7 symptomContainerByRegisteredAccessory];
    __int16 v15 = [v14 objectForKey:v13];

    id v16 = [v15 delegate];
    [v16 symptomManager:v7 didChangeSFDeviceIdentifier:0];
  }
}

- (void)_sfDeviceChangedHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDSymptomManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(HMDSymptomManager *)self nearbySFDevices];
  id v7 = [v4 idsIdentifier];
  id v8 = [v6 objectForKey:v7];

  if (v8)
  {
    uint64_t v9 = [(HMDSymptomManager *)self nearbySFDevices];
    uint64_t v10 = [v4 idsIdentifier];
    [v9 setObject:v4 forKey:v10];

    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      int v20 = 138543618;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@SFDevice %@ changed", (uint8_t *)&v20, 0x16u);
    }
    __int16 v15 = [v4 idsIdentifier];
    [(HMDSymptomManager *)v12 _updateSymptomsForRegisteredAccessoryWithIDSIdentifier:v15];
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    int v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      __int16 v19 = HMFGetLogIdentifier();
      int v20 = 138543618;
      uint64_t v21 = v19;
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Did not find SFDevice %@ in the nearby SFDevices, so treating it as a found device", (uint8_t *)&v20, 0x16u);
    }
    [(HMDSymptomManager *)v17 _sfDeviceFoundHandler:v4];
  }
}

- (void)_sfDeviceFoundHandler:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDSymptomManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v18 = 138543618;
    __int16 v19 = v9;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Found new SFDevice: %@", (uint8_t *)&v18, 0x16u);
  }
  uint64_t v10 = [(HMDSymptomManager *)v7 nearbySFDevices];
  v11 = [v4 idsIdentifier];
  [v10 setObject:v4 forKey:v11];

  v12 = [v4 idsIdentifier];
  int v13 = [(HMDSymptomManager *)v7 _registeredAccessoryWithIDSIdentifier:v12];

  if (v13)
  {
    [(HMDSymptomManager *)v7 _updateSymptomsForRegisteredAccessory:v13];
    id v14 = [(HMDSymptomManager *)v7 symptomContainerByRegisteredAccessory];
    __int16 v15 = [v14 objectForKey:v13];

    id v16 = [v15 delegate];
    int v17 = [v4 identifier];
    [v16 symptomManager:v7 didChangeSFDeviceIdentifier:v17];
  }
}

- (BOOL)_isNearbyDiscoveryActive
{
  return [(HMDSymptomManager *)self deviceDiscoveryFlags] & 1;
}

- (void)_updateSymptomsForAllRegisteredAccessories
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(HMDSymptomManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(HMDSymptomManager *)self symptomContainerByRegisteredAccessory];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(HMDSymptomManager *)self _updateSymptomsForRegisteredAccessory:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_updateSymptomsForRegisteredAccessory:(id)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(HMDSymptomManager *)self workQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = [(HMDSymptomManager *)self symptomContainerByRegisteredAccessory];
  uint64_t v8 = [v7 objectForKey:v5];

  if (!v8) {
    goto LABEL_22;
  }
  long long v9 = [MEMORY[0x263EFF9C0] set];
  long long v10 = [(HMDSymptomManager *)self nearbySFDevices];
  long long v11 = [v8 idsIdentifier];
  long long v12 = [v10 objectForKey:v11];

  if ([v12 hasProblem])
  {
    int v13 = objc_msgSend((id)objc_opt_class(), "_symptomsForProblemFlags:", objc_msgSend(v12, "problemFlags"));
    [v9 unionSet:v13];
  }
  if (!v12) {
    goto LABEL_8;
  }
  uint64_t v14 = [(HMDSymptomManager *)self networkReachableRPCompanionLinkDevices];
  __int16 v15 = [v8 idsIdentifier];
  id v16 = [v14 objectForKey:v15];
  if (v16)
  {

LABEL_7:
    goto LABEL_8;
  }
  v38 = [(HMDSymptomManager *)self wifiManager];
  v39 = [v38 currentNetworkSSID];

  if (v39)
  {
    v40 = (void *)MEMORY[0x230FBD990]();
    v41 = self;
    v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v3 = HMFGetLogIdentifier();
      v39 = [v5 uuid];
      [(HMDSymptomManager *)v41 wifiManager];
      v66 = v74 = v40;
      v43 = [v66 currentNetworkSSID];
      *(_DWORD *)buf = 138543874;
      v78 = v3;
      __int16 v79 = 2112;
      id v80 = v39;
      __int16 v81 = 2112;
      v82 = v43;
      _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@Accessory: %@ is not reachable over local network: %@", buf, 0x20u);

      v40 = v74;
    }

    v44 = [v5 wifiNetworkInfo];
    [v44 SSID];
    v75 = v70 = v41;
    if (v75)
    {
      v63 = [v5 wifiNetworkInfo];
      v3 = [v63 SSID];
      v42 = [(HMDSymptomManager *)v41 wifiManager];
      v39 = [v42 currentNetworkSSID];
      if (![v3 isEqualToString:v39])
      {

LABEL_38:
        v52 = (void *)MEMORY[0x230FBD990]();
        v53 = v70;
        v54 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          v76 = HMFGetLogIdentifier();
          v68 = [(HMDSymptomManager *)v53 wifiManager];
          v55 = [v68 currentNetworkSSID];
          v56 = [v5 uuid];
          v65 = [v5 wifiNetworkInfo];
          [v65 SSID];
          v57 = v71 = v52;
          *(_DWORD *)buf = 138544130;
          v78 = v76;
          __int16 v79 = 2112;
          id v80 = v55;
          __int16 v81 = 2112;
          v82 = v56;
          __int16 v83 = 2112;
          v84 = v57;
          _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_INFO, "%{public}@Mismatched WiFi SSID, current: %@ accessory(%@): %@", buf, 0x2Au);

          v52 = v71;
        }

        v58 = (void *)MEMORY[0x230FBD990]();
        v59 = v53;
        v60 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          v61 = HMFGetLogIdentifier();
          v62 = [v8 idsIdentifier];
          *(_DWORD *)buf = 138543618;
          v78 = v61;
          __int16 v79 = 2112;
          id v80 = v62;
          _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_INFO, "%{public}@Creating WiFi network mismatch symptom for nearby IDS identifier that is not network reachable: %@", buf, 0x16u);
        }
        uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:11];
        [v9 addObject:v14];
        goto LABEL_7;
      }
      v67 = v44;
    }
    else
    {
      v67 = v44;
    }
    v45 = [(HMDSymptomManager *)v41 nearbyAccessoryUUIDsNotOnCurrentNetwork];
    v46 = [v5 uuid];
    char v64 = [v45 containsObject:v46];

    if (v75)
    {
    }
    if ((v64 & 1) == 0)
    {
      v47 = [v5 wifiNetworkInfo];

      if (!v47)
      {
        v48 = (void *)MEMORY[0x230FBD990]();
        v49 = v70;
        v50 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          v51 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v78 = v51;
          __int16 v79 = 2112;
          id v80 = v5;
          _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_INFO, "%{public}@Accessory %@ WiFi info is nil", buf, 0x16u);
        }
      }
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_8:
  int v17 = [(HMDSymptomManager *)self wifiManager];
  if (![v17 isCaptive] || !objc_msgSend(v12, "hasProblem")) {
    goto LABEL_16;
  }
  char v18 = [v12 problemFlags];

  if ((v18 & 0x10) == 0) {
    goto LABEL_17;
  }
  int v17 = [(HMDSymptomManager *)self wifiManager];
  uint64_t v19 = [v17 currentNetworkSSID];
  if (!v19)
  {
LABEL_16:

    goto LABEL_17;
  }
  __int16 v20 = (void *)v19;
  v72 = [v5 wifiNetworkInfo];
  id v21 = [v72 SSID];
  uint64_t v22 = [(HMDSymptomManager *)self wifiManager];
  id v23 = [v22 currentNetworkSSID];
  int v69 = [v21 isEqualToString:v23];

  if (v69)
  {
    uint64_t v24 = (void *)MEMORY[0x230FBD990]();
    int v25 = self;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      __int16 v27 = HMFGetLogIdentifier();
      id v28 = [v5 wifiNetworkInfo];
      [v28 SSID];
      __int16 v29 = v73 = v24;
      *(_DWORD *)buf = 138543618;
      v78 = v27;
      __int16 v79 = 2112;
      id v80 = v29;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Creating captive lease renewal symptom, WiFi SSID: %@", buf, 0x16u);

      uint64_t v24 = v73;
    }

    int v17 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:19];
    [v9 addObject:v17];
    goto LABEL_16;
  }
LABEL_17:
  v30 = [v8 delegate];
  uint64_t v31 = [v8 symptoms];
  char v32 = [v31 isEqualToSet:v9];

  if ((v32 & 1) == 0)
  {
    v33 = (void *)MEMORY[0x230FBD990]();
    v34 = self;
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = HMFGetLogIdentifier();
      v37 = [v8 idsIdentifier];
      *(_DWORD *)buf = 138543874;
      v78 = v36;
      __int16 v79 = 2112;
      id v80 = v37;
      __int16 v81 = 2112;
      v82 = v9;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@Updating symptoms for accessory with IDS identifier %@: %@", buf, 0x20u);
    }
    [v8 setSymptoms:v9];
    [v30 symptomManager:v34 didChangeSymptoms:v9];
  }

LABEL_22:
}

- (void)_updateSymptomsForRegisteredAccessoryWithIDSIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDSymptomManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(HMDSymptomManager *)self _registeredAccessoryWithIDSIdentifier:v4];
  if (v6)
  {
    [(HMDSymptomManager *)self _updateSymptomsForRegisteredAccessory:v6];
    uint64_t v7 = [(HMDSymptomManager *)self nearbyAccessoryUUIDsNotOnCurrentNetwork];
    uint64_t v8 = [v6 uuid];
    int v9 = [v7 containsObject:v8];

    if (v9)
    {
      long long v10 = (void *)MEMORY[0x230FBD990]();
      long long v11 = self;
      long long v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = HMFGetLogIdentifier();
        int v14 = 138543362;
        __int16 v15 = v13;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Peforming network mismatch fetch as accessory is in list", (uint8_t *)&v14, 0xCu);
      }
      [(HMDSymptomManager *)v11 updateNetworkMismatchInfoWithCompletionHandler:&__block_literal_global_138_160532];
    }
  }
}

- (id)_registeredAccessoryWithIDSIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDSymptomManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [(HMDSymptomManager *)self symptomContainerByRegisteredAccessory];
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
        long long v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v12 = [(HMDSymptomManager *)self symptomContainerByRegisteredAccessory];
        int v13 = [v12 objectForKey:v11];

        int v14 = [v13 idsIdentifier];
        char v15 = [v14 isEqualToString:v4];

        if (v15)
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

- (void)_initiateFixForAccessory:(id)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(HMDSymptomManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [v6 device];
  long long v10 = [v9 idsIdentifier];
  long long v11 = [v10 UUIDString];

  if (v11)
  {
    long long v12 = [(HMDSymptomManager *)self nearbySFDevices];
    int v13 = [v12 objectForKey:v11];

    if (v13)
    {
      int v14 = [(HMDSymptomManager *)self _symptomsForRegisteredAccessory:v6];
      char v15 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:11];
      uint64_t v16 = [v14 containsObject:v15];

      int v17 = (void *)MEMORY[0x230FBD990]();
      long long v18 = self;
      long long v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        long long v20 = HMFGetLogIdentifier();
        int v30 = 138543874;
        uint64_t v31 = v20;
        __int16 v32 = 2112;
        id v33 = v13;
        __int16 v34 = 1024;
        int v35 = v16;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Asking SFClient to repair device %@ with flags %d", (uint8_t *)&v30, 0x1Cu);
      }
      long long v21 = [(HMDSymptomManager *)v18 deviceDiscovery];
      [v21 repairDevice:v13 flags:v16 completion:v7];
    }
    else
    {
      v26 = (void *)MEMORY[0x230FBD990]();
      __int16 v27 = self;
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        __int16 v29 = HMFGetLogIdentifier();
        int v30 = 138543618;
        uint64_t v31 = v29;
        __int16 v32 = 2112;
        id v33 = v6;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Sharing has not discovered SFDevice for %@, not initiating fix process.", (uint8_t *)&v30, 0x16u);
      }
      int v14 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      v7[2](v7, v14);
    }
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x230FBD990]();
    uint64_t v23 = self;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v25 = HMFGetLogIdentifier();
      int v30 = 138543618;
      uint64_t v31 = v25;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@The accessory (%@) does not have idsIdentifier, not initiating fix process.", (uint8_t *)&v30, 0x16u);
    }
    int v13 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    v7[2](v7, v13);
  }
}

- (id)_symptomsForRegisteredAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSymptomManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDSymptomManager *)self symptomContainerByRegisteredAccessory];
  uint64_t v7 = [v6 objectForKey:v4];

  uint64_t v8 = [v7 symptoms];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x263EFFA08] set];
  }
  long long v11 = v10;

  return v11;
}

- (void)_registerForCurrentDeviceSymptoms
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(HMDSymptomManager *)self sharingClientFactory];
  id v4 = v3[2]();

  if (objc_opt_respondsToSelector())
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __54__HMDSymptomManager__registerForCurrentDeviceSymptoms__block_invoke;
    v11[3] = &unk_264A2E2B0;
    v11[4] = self;
    [v4 getProblemFlagsWithCompletionHandler:v11];
  }
  else
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v13 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Device doesn't support retrieving problem flags.", buf, 0xCu);
    }
  }

  uint64_t v9 = [(HMDSymptomManager *)self workQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__HMDSymptomManager__registerForCurrentDeviceSymptoms__block_invoke_131;
  v10[3] = &unk_264A27328;
  v10[4] = self;
  notify_register_dispatch("com.apple.sharing.problems", &self->_deviceProblemNotificationToken, v9, v10);
}

void __54__HMDSymptomManager__registerForCurrentDeviceSymptoms__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v10 = 138543874;
    long long v11 = v9;
    __int16 v12 = 2048;
    uint64_t v13 = a2;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Setting current device problem flags on start %llu, error: %@", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(a1 + 32) setCurrentDeviceProblemFlags:a2];
}

void __54__HMDSymptomManager__registerForCurrentDeviceSymptoms__block_invoke_131(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) sharingClientFactory];
  v3 = v2[2]();

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v14 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Current device problem flags changed", buf, 0xCu);
  }
  if (objc_opt_respondsToSelector())
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __54__HMDSymptomManager__registerForCurrentDeviceSymptoms__block_invoke_132;
    v12[3] = &unk_264A2E2B0;
    v12[4] = *(void *)(a1 + 32);
    [v3 getProblemFlagsWithCompletionHandler:v12];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      long long v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v14 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Device doesn't support retrieving problem flags.", buf, 0xCu);
    }
  }
}

void __54__HMDSymptomManager__registerForCurrentDeviceSymptoms__block_invoke_132(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = HMFGetLogIdentifier();
    int v10 = 138543874;
    long long v11 = v9;
    __int16 v12 = 2048;
    uint64_t v13 = a2;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Setting current device problem flags to %llu, error: %@", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(a1 + 32) setCurrentDeviceProblemFlags:a2];
}

- (void)_stopCompanionLinkClient
{
  v3 = [(HMDSymptomManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDSymptomManager *)self companionLinkClient];
  [v4 setDeviceFoundHandler:0];

  id v5 = [(HMDSymptomManager *)self companionLinkClient];
  [v5 setDeviceChangedHandler:0];

  id v6 = [(HMDSymptomManager *)self companionLinkClient];
  [v6 setDeviceLostHandler:0];

  id v7 = [(HMDSymptomManager *)self companionLinkClient];
  [v7 stop];
}

- (void)_stopDeviceDiscovery
{
  v3 = [(HMDSymptomManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDSymptomManager *)self deviceDiscovery];
  [v4 setDeviceFoundHandler:0];

  id v5 = [(HMDSymptomManager *)self deviceDiscovery];
  [v5 setDeviceChangedHandler:0];

  id v6 = [(HMDSymptomManager *)self deviceDiscovery];
  [v6 setDeviceLostHandler:0];

  id v7 = [(HMDSymptomManager *)self deviceDiscovery];
  [v7 stop];
}

- (void)_stop
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [(HMDSymptomManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v10 = 138543362;
    long long v11 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Stopping SFDeviceDiscovery and RPCompanionLinkClient in HMDSymptomManager.", (uint8_t *)&v10, 0xCu);
  }
  [(HMDSymptomManager *)v5 _stopDeviceDiscovery];
  [(HMDSymptomManager *)v5 _stopCompanionLinkClient];
  uint64_t v8 = [(HMDSymptomManager *)v5 nearbySFDevices];
  [v8 removeAllObjects];

  id v9 = [(HMDSymptomManager *)v5 networkReachableRPCompanionLinkDevices];
  [v9 removeAllObjects];
}

- (void)_startCompanionLinkClient
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [(HMDSymptomManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDSymptomManager *)self workQueue];
  id v5 = [(HMDSymptomManager *)self companionLinkClient];
  [v5 setDispatchQueue:v4];

  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __46__HMDSymptomManager__startCompanionLinkClient__block_invoke;
  v18[3] = &unk_264A22930;
  objc_copyWeak(&v19, &location);
  id v6 = [(HMDSymptomManager *)self companionLinkClient];
  [v6 setDeviceFoundHandler:v18];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __46__HMDSymptomManager__startCompanionLinkClient__block_invoke_124;
  v16[3] = &unk_264A22958;
  objc_copyWeak(&v17, &location);
  id v7 = [(HMDSymptomManager *)self companionLinkClient];
  [v7 setDeviceChangedHandler:v16];

  uint64_t v14 = MEMORY[0x263EF8330];
  objc_copyWeak(&v15, &location);
  uint64_t v8 = [(HMDSymptomManager *)self companionLinkClient];
  [v8 setDeviceLostHandler:&v14];

  id v9 = (void *)MEMORY[0x230FBD990]();
  int v10 = self;
  HMFGetOSLogHandle();
  long long v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v12;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting RPCompanionLinkClient in HMDSymptomManager", buf, 0xCu);
  }
  uint64_t v13 = [(HMDSymptomManager *)v10 companionLinkClient];
  [v13 start];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __46__HMDSymptomManager__startCompanionLinkClient__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = WeakRetained;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Found RPCompanionLinkDevice: %@", (uint8_t *)&v11, 0x16u);
  }
  int v10 = [v3 idsDeviceIdentifier];

  if (v10) {
    [v7 _rpDeviceFoundHandler:v3];
  }
}

void __46__HMDSymptomManager__startCompanionLinkClient__block_invoke_124(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = WeakRetained;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@RPCompanionLinkDevice %@ changed", (uint8_t *)&v11, 0x16u);
  }
  int v10 = [v3 idsDeviceIdentifier];

  if (v10) {
    [v7 _rpDeviceChangedHandler:v3];
  }
}

void __46__HMDSymptomManager__startCompanionLinkClient__block_invoke_126(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = WeakRetained;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Lost RPCompanionLinkDevice: %@", (uint8_t *)&v11, 0x16u);
  }
  int v10 = [v3 idsDeviceIdentifier];

  if (v10) {
    [v7 _rpDeviceLostHandler:v3];
  }
}

- (void)_startDeviceDiscovery
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [(HMDSymptomManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDSymptomManager *)self workQueue];
  id v5 = [(HMDSymptomManager *)self deviceDiscovery];
  [v5 setDispatchQueue:v4];

  unint64_t v6 = [(HMDSymptomManager *)self deviceDiscoveryFlags];
  id v7 = [(HMDSymptomManager *)self deviceDiscovery];
  [v7 setDiscoveryFlags:v6];

  objc_initWeak(&location, self);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __42__HMDSymptomManager__startDeviceDiscovery__block_invoke;
  v20[3] = &unk_264A228E0;
  objc_copyWeak(&v21, &location);
  uint64_t v8 = [(HMDSymptomManager *)self deviceDiscovery];
  [v8 setDeviceFoundHandler:v20];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __42__HMDSymptomManager__startDeviceDiscovery__block_invoke_2;
  v18[3] = &unk_264A22908;
  objc_copyWeak(&v19, &location);
  id v9 = [(HMDSymptomManager *)self deviceDiscovery];
  [v9 setDeviceChangedHandler:v18];

  uint64_t v16 = MEMORY[0x263EF8330];
  objc_copyWeak(&v17, &location);
  int v10 = [(HMDSymptomManager *)self deviceDiscovery];
  [v10 setDeviceLostHandler:&v16];

  int v11 = (void *)MEMORY[0x230FBD990]();
  uint64_t v12 = self;
  HMFGetOSLogHandle();
  __int16 v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v14;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Starting SFDeviceDiscovery in HMDSymptomManager", buf, 0xCu);
  }
  uint64_t v15 = [(HMDSymptomManager *)v12 deviceDiscovery];
  [v15 start];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __42__HMDSymptomManager__startDeviceDiscovery__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [v6 idsIdentifier];

  if (v5) {
    [WeakRetained _sfDeviceFoundHandler:v6];
  }
}

void __42__HMDSymptomManager__startDeviceDiscovery__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [v6 idsIdentifier];

  if (v5) {
    [WeakRetained _sfDeviceChangedHandler:v6];
  }
}

void __42__HMDSymptomManager__startDeviceDiscovery__block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [v6 idsIdentifier];

  if (v5) {
    [WeakRetained _sfDeviceLostHandler:v6];
  }
}

- (void)_start
{
  id v3 = [(HMDSymptomManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(HMDSymptomManager *)self _startDeviceDiscovery];
  [(HMDSymptomManager *)self _startCompanionLinkClient];
}

- (void)setCurrentDeviceProblemFlags:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_currentDeviceProblemFlags = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)currentDeviceProblemFlags
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t currentDeviceProblemFlags = self->_currentDeviceProblemFlags;
  os_unfair_lock_unlock(p_lock);
  return currentDeviceProblemFlags;
}

- (void)setDeviceDiscoveryFlags:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = [(HMDSymptomManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (self->_deviceDiscoveryFlags != a3)
  {
    self->_deviceDiscoveryFlags = a3;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = [(HMDSymptomManager *)self nearbySFDevices];
    id v7 = NSAllMapTableValues(v6);

    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          [(HMDSymptomManager *)self _sfDeviceLostHandler:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    uint64_t v12 = [(HMDSymptomManager *)self symptomContainerByRegisteredAccessory];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      [(HMDSymptomManager *)self _stopDeviceDiscovery];
      [(HMDSymptomManager *)self _startDeviceDiscovery];
    }
  }
}

- (void)initiateFixForAccessory:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDSymptomManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__HMDSymptomManager_initiateFixForAccessory_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __56__HMDSymptomManager_initiateFixForAccessory_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initiateFixForAccessory:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)stopDiscoveringSymptomsRequiringNearbyInfo
{
  id v3 = [(HMDSymptomManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__HMDSymptomManager_stopDiscoveringSymptomsRequiringNearbyInfo__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __63__HMDSymptomManager_stopDiscoveringSymptomsRequiringNearbyInfo__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping discovery for symptoms requiring nearby info", (uint8_t *)&v9, 0xCu);
  }
  [*(id *)(a1 + 32) setDeviceDiscoveryFlags:0x10000];
  [*(id *)(a1 + 32) setNearbyAccessoryUUIDsNotOnCurrentNetwork:MEMORY[0x263EFFA68]];
  id v6 = *(void **)(a1 + 32);
  id v7 = [v6 discoveryAssertion];
  [v6 releaseDiscoveryAssertionWithAssertionHandle:v7];

  return [*(id *)(a1 + 32) setDiscoveryAssertion:0];
}

- (void)startDiscoveringSymptomsRequiringNearbyInfo
{
  id v3 = [(HMDSymptomManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__HMDSymptomManager_startDiscoveringSymptomsRequiringNearbyInfo__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __64__HMDSymptomManager_startDiscoveringSymptomsRequiringNearbyInfo__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v13 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting discovery for symptoms requiring nearby info", buf, 0xCu);
  }
  [*(id *)(a1 + 32) setDeviceDiscoveryFlags:65537];
  id v6 = *(void **)(a1 + 32);
  id v7 = [v6 discoveryAssertion];
  [v6 releaseDiscoveryAssertionWithAssertionHandle:v7];

  uint64_t v8 = [*(id *)(a1 + 32) obtainDiscoveryAssertion];
  [*(id *)(a1 + 32) setDiscoveryAssertion:v8];

  int v9 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__HMDSymptomManager_startDiscoveringSymptomsRequiringNearbyInfo__block_invoke_120;
  v11[3] = &unk_264A2F7F8;
  v11[4] = v9;
  return [v9 updateNetworkMismatchInfoWithCompletionHandler:v11];
}

void __64__HMDSymptomManager_startDiscoveringSymptomsRequiringNearbyInfo__block_invoke_120(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) nearbyAccessoryUUIDsNotOnCurrentNetwork];
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Updated network mismatch accessories to %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)deregisterAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSymptomManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__HMDSymptomManager_deregisterAccessory___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __41__HMDSymptomManager_deregisterAccessory___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) symptomContainerByRegisteredAccessory];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v12 = 138543618;
      id v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Deregistering accessory: %@", (uint8_t *)&v12, 0x16u);
    }
    __int16 v9 = [*(id *)(a1 + 32) symptomContainerByRegisteredAccessory];
    [v9 removeObjectForKey:*(void *)(a1 + 40)];

    id v10 = [*(id *)(a1 + 32) symptomContainerByRegisteredAccessory];
    uint64_t v11 = [v10 count];

    if (!v11) {
      [*(id *)(a1 + 32) _stop];
    }
  }
}

- (void)registerAccessory:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDSymptomManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__HMDSymptomManager_registerAccessory_delegate___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __48__HMDSymptomManager_registerAccessory_delegate___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) supportsRegisteringAccessories])
  {
    v2 = [*(id *)(a1 + 40) idsIdentifier];
    id v3 = [v2 UUIDString];

    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) symptomContainerByRegisteredAccessory];
      id v5 = [v4 objectForKey:*(void *)(a1 + 40)];

      id v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = *(id *)(a1 + 32);
      uint64_t v8 = HMFGetOSLogHandle();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
      if (!v5)
      {
        if (v9)
        {
          long long v20 = HMFGetLogIdentifier();
          uint64_t v21 = *(void *)(a1 + 40);
          int v32 = 138543874;
          id v33 = v20;
          __int16 v34 = 2112;
          uint64_t v35 = v21;
          __int16 v36 = 2112;
          v37 = v3;
          _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Registering accessory (%@) for idsIdentifier %@", (uint8_t *)&v32, 0x20u);
        }
        uint64_t v22 = [[HMDSymptomContainer alloc] initWithIDSIdentifier:v3];
        [(HMDSymptomContainer *)v22 setDelegate:*(void *)(a1 + 48)];
        uint64_t v23 = [*(id *)(a1 + 32) symptomContainerByRegisteredAccessory];
        [v23 setObject:v22 forKey:*(void *)(a1 + 40)];

        uint64_t v24 = [*(id *)(a1 + 32) symptomContainerByRegisteredAccessory];
        uint64_t v25 = [v24 count];

        v26 = *(void **)(a1 + 32);
        if (v25 == 1)
        {
          [v26 _start];
        }
        else
        {
          [v26 _updateSymptomsForRegisteredAccessory:*(void *)(a1 + 40)];
          __int16 v27 = [*(id *)(a1 + 32) nearbySFDevices];
          id v28 = [v27 objectForKey:v3];

          if (v28)
          {
            __int16 v29 = *(void **)(a1 + 48);
            uint64_t v30 = *(void *)(a1 + 32);
            uint64_t v31 = [v28 identifier];
            [v29 symptomManager:v30 didChangeSFDeviceIdentifier:v31];
          }
        }

        goto LABEL_21;
      }
      if (v9)
      {
        id v10 = HMFGetLogIdentifier();
        uint64_t v11 = *(void *)(a1 + 40);
        int v32 = 138543618;
        id v33 = v10;
        __int16 v34 = 2112;
        uint64_t v35 = v11;
        id v12 = "%{public}@The accessory (%@) is already registered.";
        id v13 = v8;
        os_log_type_t v14 = OS_LOG_TYPE_INFO;
LABEL_11:
        _os_log_impl(&dword_22F52A000, v13, v14, v12, (uint8_t *)&v32, 0x16u);
      }
    }
    else
    {
      id v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = *(id *)(a1 + 32);
      uint64_t v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v10 = HMFGetLogIdentifier();
        uint64_t v19 = *(void *)(a1 + 40);
        int v32 = 138543618;
        id v33 = v10;
        __int16 v34 = 2112;
        uint64_t v35 = v19;
        id v12 = "%{public}@The accessory (%@) does not have idsIdentifier, not registering for the discovery.";
        id v13 = v8;
        os_log_type_t v14 = OS_LOG_TYPE_ERROR;
        goto LABEL_11;
      }
    }

LABEL_21:

    return;
  }
  uint64_t v15 = (void *)MEMORY[0x230FBD990]();
  id v16 = *(id *)(a1 + 32);
  long long v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    long long v18 = HMFGetLogIdentifier();
    int v32 = 138543362;
    id v33 = v18;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@This device doesn't support registering accessories", (uint8_t *)&v32, 0xCu);
  }
}

- (void)dealloc
{
  int deviceProblemNotificationToken = self->_deviceProblemNotificationToken;
  if (deviceProblemNotificationToken != -1) {
    notify_cancel(deviceProblemNotificationToken);
  }
  id v4 = [(HMDSymptomManager *)self deviceDiscovery];
  [v4 stop];

  id v5 = [(HMDSymptomManager *)self companionLinkClient];
  [v5 stop];

  v6.receiver = self;
  v6.super_class = (Class)HMDSymptomManager;
  [(HMDSymptomManager *)&v6 dealloc];
}

- (HMDSymptomManager)initWithQueue:(id)a3 dataSource:(id)a4 supportsRegistering:(BOOL)a5 supportsCurrentDeviceSymptoms:(BOOL)a6 deviceDiscovery:(id)a7 companionLinkClient:(id)a8 wifiManager:(id)a9 notificationCenter:(id)a10 sharingClientFactory:(id)a11
{
  BOOL v13 = a6;
  id v36 = a3;
  id v18 = a4;
  id v35 = a7;
  id v34 = a8;
  id v33 = a9;
  id v32 = a10;
  id v19 = a11;
  v37.receiver = self;
  v37.super_class = (Class)HMDSymptomManager;
  long long v20 = [(HMDSymptomManager *)&v37 init];
  uint64_t v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_workQueue, a3);
    objc_storeWeak((id *)&v21->_dataSource, v18);
    uint64_t v22 = _Block_copy(v19);
    id sharingClientFactory = v21->_sharingClientFactory;
    v21->_id sharingClientFactory = v22;

    objc_storeStrong((id *)&v21->_deviceDiscovery, a7);
    objc_storeStrong((id *)&v21->_companionLinkClient, a8);
    objc_storeStrong((id *)&v21->_wifiManager, a9);
    objc_storeStrong((id *)&v21->_notificationCenter, a10);
    v21->_supportsRegisteringAccessories = a5;
    v21->_supportsCurrentDeviceSymptoms = v13;
    uint64_t v24 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    symptomContainerByRegisteredAccessory = v21->_symptomContainerByRegisteredAccessory;
    v21->_symptomContainerByRegisteredAccessory = (NSMapTable *)v24;

    uint64_t v26 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    nearbySFDevices = v21->_nearbySFDevices;
    v21->_nearbySFDevices = (NSMapTable *)v26;

    uint64_t v28 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    networkReachableRPCompanionLinkDevices = v21->_networkReachableRPCompanionLinkDevices;
    v21->_networkReachableRPCompanionLinkDevices = (NSMapTable *)v28;

    v21->_deviceDiscoveryFlags = 0x10000;
    v21->_int deviceProblemNotificationToken = -1;
    nearbyAccessoryUUIDsNotOnCurrentNetwork = v21->_nearbyAccessoryUUIDsNotOnCurrentNetwork;
    v21->_nearbyAccessoryUUIDsNotOnCurrentNetwork = (NSArray *)MEMORY[0x263EFFA68];

    [(NSNotificationCenter *)v21->_notificationCenter addObserver:v21 selector:sel_handleAccessoryRemovedNotification_ name:@"HMDHomeAccessoryRemovedNotification" object:0];
    [(NSNotificationCenter *)v21->_notificationCenter addObserver:v21 selector:sel_handleAccessoryWiFiNetworkInfoUpdatedNotification_ name:@"HMDAppleMediaAccessoryWiFiNetworkInfoUpdatedNotification" object:0];
    [(NSNotificationCenter *)v21->_notificationCenter addObserver:v21 selector:sel_handleCurrentNetworkDidChangeNotification_ name:*MEMORY[0x263F424E8] object:0];
  }
  if (v13) {
    [(HMDSymptomManager *)v21 _registerForCurrentDeviceSymptoms];
  }

  return v21;
}

- (HMDSymptomManager)initWithDataSource:(id)a3
{
  id v4 = a3;
  HMDispatchQueueNameString();
  id v5 = objc_claimAutoreleasedReturnValue();
  objc_super v6 = (const char *)[v5 UTF8String];
  id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v8 = dispatch_queue_create(v6, v7);

  BOOL v9 = objc_alloc_init(HMDSharingDeviceDiscovery);
  id v10 = objc_alloc_init(HMDCompanionLinkClient);
  uint64_t v11 = [MEMORY[0x263F42680] sharedManager];
  id v12 = [MEMORY[0x263F08A00] defaultCenter];
  BOOL v13 = [(HMDSymptomManager *)self initWithQueue:v8 dataSource:v4 supportsRegistering:+[HMDDeviceCapabilities supportsSymptomsHandler] supportsCurrentDeviceSymptoms:0 deviceDiscovery:v9 companionLinkClient:v10 wifiManager:v11 notificationCenter:v12 sharingClientFactory:&__block_literal_global_160604];

  return v13;
}

id __40__HMDSymptomManager_initWithDataSource___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F6C1F0]);
  return v0;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t44 != -1) {
    dispatch_once(&logCategory__hmf_once_t44, &__block_literal_global_142_160613);
  }
  v2 = (void *)logCategory__hmf_once_v45;
  return v2;
}

void __32__HMDSymptomManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v45;
  logCategory__hmf_once_v45 = v0;
}

+ (id)_symptomsForProblemFlags:(unint64_t)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x230FBD990](a1, a2);
  id v6 = a1;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    dispatch_queue_t v8 = HMFGetLogIdentifier();
    int v31 = 138543618;
    id v32 = v8;
    __int16 v33 = 2048;
    unint64_t v34 = a3;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Parsing problem flags %llu to HMSymptoms", (uint8_t *)&v31, 0x16u);
  }
  BOOL v9 = [MEMORY[0x263EFF9C0] set];
  if ((a3 & 2) != 0)
  {
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:1];
    [v9 addObject:v15];

    if ((a3 & 4) == 0)
    {
LABEL_5:
      if ((a3 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_29;
    }
  }
  else if ((a3 & 4) == 0)
  {
    goto LABEL_5;
  }
  id v16 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:2];
  [v9 addObject:v16];

  if ((a3 & 8) == 0)
  {
LABEL_6:
    if ((a3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  long long v17 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:3];
  [v9 addObject:v17];

  if ((a3 & 0x10) == 0)
  {
LABEL_7:
    if ((a3 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  id v18 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:4];
  [v9 addObject:v18];

  if ((a3 & 0x40) == 0)
  {
LABEL_8:
    if ((a3 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  id v19 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:5];
  [v9 addObject:v19];

  if ((a3 & 0x80) == 0)
  {
LABEL_9:
    if ((a3 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  long long v20 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:6];
  [v9 addObject:v20];

  if ((a3 & 0x100) == 0)
  {
LABEL_10:
    if ((a3 & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:7];
  [v9 addObject:v21];

  if ((a3 & 0x2000) == 0)
  {
LABEL_11:
    if ((a3 & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:8];
  [v9 addObject:v22];

  if ((a3 & 0x1000) == 0)
  {
LABEL_12:
    if ((a3 & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:9];
  [v9 addObject:v23];

  if ((a3 & 0x4000) == 0)
  {
LABEL_13:
    if ((a3 & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:10];
  [v9 addObject:v24];

  if ((a3 & 0x8000) == 0)
  {
LABEL_14:
    if ((a3 & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:13];
  [v9 addObject:v25];

  if ((a3 & 0x10000) == 0)
  {
LABEL_15:
    if ((a3 & 0x40000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:14];
  [v9 addObject:v26];

  if ((a3 & 0x40000) == 0)
  {
LABEL_16:
    if ((a3 & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_40;
  }
LABEL_39:
  __int16 v27 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:16];
  [v9 addObject:v27];

  if ((a3 & 0x100000) == 0)
  {
LABEL_17:
    if ((a3 & 0x80000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v28 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:17];
  [v9 addObject:v28];

  if ((a3 & 0x80000) == 0)
  {
LABEL_18:
    if ((a3 & 0x20000) == 0) {
      goto LABEL_19;
    }
LABEL_42:
    uint64_t v30 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:20];
    [v9 addObject:v30];

    if ((a3 & 0x400000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_41:
  __int16 v29 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:18];
  [v9 addObject:v29];

  if ((a3 & 0x20000) != 0) {
    goto LABEL_42;
  }
LABEL_19:
  if ((a3 & 0x400000) != 0)
  {
LABEL_20:
    id v10 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:21];
    [v9 addObject:v10];
  }
LABEL_21:
  uint64_t v11 = [v9 count];
  if ((a3 & 0x20) != 0 && v11)
  {
    id v12 = (void *)[objc_alloc(MEMORY[0x263F0E828]) initWithType:1000];
    [v9 addObject:v12];
  }
  BOOL v13 = (void *)[v9 copy];

  return v13;
}

@end