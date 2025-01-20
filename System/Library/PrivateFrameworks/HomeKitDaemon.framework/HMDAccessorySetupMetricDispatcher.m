@interface HMDAccessorySetupMetricDispatcher
+ (id)logCategory;
- (BOOL)didAddAccessoryLocally;
- (BOOL)didSendAddAccessoryRequestToPrimary;
- (BOOL)hasHome:(id)a3;
- (BOOL)isRepairSession;
- (BOOL)isUserAtOtherOwnedHome;
- (BOOL)primaryResidentAssignedInHomeWhenAddAccessory;
- (BOOL)primaryResidentIdenticalToAccessoryBeingAdded;
- (BOOL)submitted;
- (HMDAccessorySetupMetricDispatcher)initWithQueue:(id)a3 discoveryController:(id)a4 networkInfoController:(id)a5 trackingInfo:(id)a6 setupSessionIdentifier:(id)a7 homeManager:(id)a8 logEventSubmitter:(id)a9 radarInitiator:(id)a10 timerFactory:(id)a11;
- (HMDAccessorySetupMetricDispatcher)initWithQueue:(id)a3 trackingInfo:(id)a4 setupSessionIdentifier:(id)a5 homeManager:(id)a6;
- (HMDAccessorySetupMetricDispatcherDelegate)delegate;
- (HMDDeviceSetupTrackingInfo)trackingInfo;
- (NSError)addAccessoryOnPrimaryFailError;
- (NSError)lastPrimaryClientConnectMessageFailError;
- (NSUUID)setupSessionIdentifier;
- (id)home;
- (id)logIdentifier;
- (id)networkMetricWithDiscoveryController:(id)a3 networkInfoController:(id)a4 sessionID:(id)a5 idsIdentifierString:(id)a6 currentWiFiInfo:(id)a7 currentWiFiNetworkRSSI:(int)a8 numResidents:(int64_t)a9 numAppleMediaAccessories:(int64_t)a10 accessoryDiagnosticInfo:(id)a11 primaryResidentIdsIdentifierString:(id)a12 primaryResidentDiagnosticInfo:(id)a13 homeUUID:(id)a14 primaryResidentDiagnosticInfoFetched:(BOOL)a15;
- (id)obtainDiscoveryAssertion;
- (int64_t)selectedHomeLocationStatus;
- (unint64_t)accessoryRemovedTime;
- (unint64_t)addAccessoryFinishTime;
- (unint64_t)firstSettingTime;
- (unint64_t)languageSettingTime;
- (unint64_t)lastPrimaryClientConnectedTime;
- (unint64_t)lastPrimaryResidentAvailableTime;
- (unsigned)numberOfAvailableResidentsInHome;
- (unsigned)numberOfMediaAccessoriesnHome;
- (unsigned)numberOfResidentsInHome;
- (unsigned)numberOfTimesPrimaryClientConnectMessageFailed;
- (unsigned)numberOfTimesPrimaryClientConnected;
- (unsigned)numberOfTimesPrimaryClientDisconnected;
- (unsigned)numberOfTimesPrimaryResidentChanged;
- (void)_queryRemoteAndSubmitWithConfigurationError:(uint64_t)a1;
- (void)addHome:(id)a3;
- (void)addRemoteEventRouterAssertion:(id)a3;
- (void)didReceiveEvent:(id)a3 topic:(id)a4;
- (void)markAccessoryAddCompleted;
- (void)markAccessoryRemoved;
- (void)markEventRouterPrimaryClientConnectMessageFailedWithError:(id)a3;
- (void)markEventRouterPrimaryClientConnectStatusChanged:(BOOL)a3;
- (void)markFirstSettingObserved;
- (void)markLanguageSettingObserved;
- (void)markLocalAccessoryAddStarted;
- (void)markPrimaryResidentChanged;
- (void)markRemoteAccessoryAddEndedWithError:(id)a3;
- (void)markRemoteAccessoryAddStarted;
- (void)markRemoteAccessoryAddWillStart:(id)a3;
- (void)markRepairSessionComplete;
- (void)releaseDiscoveryAssertionWithAssertionHandle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)submit;
- (void)subscribeToSettingsEvents:(id *)a1;
- (void)timerDidFire:(id)a3;
- (void)updateTrackingInfo:(id)a3;
@end

@implementation HMDAccessorySetupMetricDispatcher

- (id)networkMetricWithDiscoveryController:(id)a3 networkInfoController:(id)a4 sessionID:(id)a5 idsIdentifierString:(id)a6 currentWiFiInfo:(id)a7 currentWiFiNetworkRSSI:(int)a8 numResidents:(int64_t)a9 numAppleMediaAccessories:(int64_t)a10 accessoryDiagnosticInfo:(id)a11 primaryResidentIdsIdentifierString:(id)a12 primaryResidentDiagnosticInfo:(id)a13 homeUUID:(id)a14 primaryResidentDiagnosticInfoFetched:(BOOL)a15
{
  int v45 = a8;
  BOOL v42 = a15;
  v38 = self;
  id v39 = a13;
  v40 = (char *)a9;
  uint64_t v41 = a10;
  uint64_t v18 = sub_2302DD2B0();
  uint64_t v46 = *(void *)(v18 - 8);
  uint64_t v47 = v18;
  MEMORY[0x270FA5388](v18);
  v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_2302DDBB0();
  uint64_t v44 = v21;
  v36 = (char *)sub_2302DDBB0();
  unint64_t v43 = v22;
  if (a12)
  {
    uint64_t v35 = sub_2302DDBB0();
    uint64_t v24 = v23;
  }
  else
  {
    uint64_t v35 = 0;
    uint64_t v24 = 0;
  }
  sub_2302DD270();
  id v25 = a3;
  id v26 = a4;
  id v27 = a7;
  id v34 = a11;
  id v28 = v39;
  id v29 = v39;
  v30 = v38;
  id v31 = sub_22F564C88(v25, v26, v37, v44, v36, v43, v27, v45, v40, v41, a11, v35, v24, v28, (uint64_t)v20, v42);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v20, v47);
  return v31;
}

- (id)obtainDiscoveryAssertion
{
  v2 = (void *)_sSo33HMDAccessorySetupMetricDispatcherC13HomeKitDaemonE24obtainDiscoveryAssertionyXlyF_0();
  return v2;
}

- (void)releaseDiscoveryAssertionWithAssertionHandle:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  _sSo33HMDAccessorySetupMetricDispatcherC13HomeKitDaemonE25releaseDiscoveryAssertion15assertionHandleyyXl_tF_0();
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addAccessoryOnPrimaryFailError, 0);
  objc_storeStrong((id *)&self->_lastPrimaryClientConnectMessageFailError, 0);
  objc_storeStrong((id *)&self->_setupSessionIdentifier, 0);
  objc_storeStrong(&self->_discoveryAssertion, 0);
  objc_storeStrong((id *)&self->_remoteEventRouterAssertion, 0);
  objc_storeStrong((id *)&self->_primaryResidentDiagnosticInfoFetchError, 0);
  objc_storeStrong((id *)&self->_primaryResidentDiagnosticInfo, 0);
  objc_storeStrong((id *)&self->_accessoryDiagnosticInfoFetchError, 0);
  objc_storeStrong((id *)&self->_accessoryDiagnosticInfo, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong(&self->_networkInfoController, 0);
  objc_storeStrong(&self->_discoveryController, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_destroyWeak((id *)&self->_radarInitiator);
  objc_destroyWeak((id *)&self->_submitter);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trackingInfo, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (unsigned)numberOfResidentsInHome
{
  return self->_numberOfResidentsInHome;
}

- (unsigned)numberOfAvailableResidentsInHome
{
  return self->_numberOfAvailableResidentsInHome;
}

- (unsigned)numberOfMediaAccessoriesnHome
{
  return self->_numberOfMediaAccessoriesnHome;
}

- (BOOL)primaryResidentAssignedInHomeWhenAddAccessory
{
  return self->_primaryResidentAssignedInHomeWhenAddAccessory;
}

- (BOOL)primaryResidentIdenticalToAccessoryBeingAdded
{
  return self->_primaryResidentIdenticalToAccessoryBeingAdded;
}

- (BOOL)didAddAccessoryLocally
{
  return self->_didAddAccessoryLocally;
}

- (NSError)addAccessoryOnPrimaryFailError
{
  return (NSError *)objc_getProperty(self, a2, 264, 1);
}

- (BOOL)didSendAddAccessoryRequestToPrimary
{
  return self->_didSendAddAccessoryRequestToPrimary;
}

- (NSError)lastPrimaryClientConnectMessageFailError
{
  return (NSError *)objc_getProperty(self, a2, 256, 1);
}

- (unsigned)numberOfTimesPrimaryClientConnectMessageFailed
{
  return self->_numberOfTimesPrimaryClientConnectMessageFailed;
}

- (unsigned)numberOfTimesPrimaryClientDisconnected
{
  return self->_numberOfTimesPrimaryClientDisconnected;
}

- (unsigned)numberOfTimesPrimaryClientConnected
{
  return self->_numberOfTimesPrimaryClientConnected;
}

- (unint64_t)lastPrimaryClientConnectedTime
{
  return self->_lastPrimaryClientConnectedTime;
}

- (unsigned)numberOfTimesPrimaryResidentChanged
{
  return self->_numberOfTimesPrimaryResidentChanged;
}

- (unint64_t)lastPrimaryResidentAvailableTime
{
  return self->_lastPrimaryResidentAvailableTime;
}

- (BOOL)isUserAtOtherOwnedHome
{
  return self->_isUserAtOtherOwnedHome;
}

- (int64_t)selectedHomeLocationStatus
{
  return self->_selectedHomeLocationStatus;
}

- (unint64_t)accessoryRemovedTime
{
  return self->_accessoryRemovedTime;
}

- (unint64_t)addAccessoryFinishTime
{
  return self->_addAccessoryFinishTime;
}

- (unint64_t)languageSettingTime
{
  return self->_languageSettingTime;
}

- (unint64_t)firstSettingTime
{
  return self->_firstSettingTime;
}

- (BOOL)isRepairSession
{
  return self->_isRepairSession;
}

- (NSUUID)setupSessionIdentifier
{
  return self->_setupSessionIdentifier;
}

- (void)setDelegate:(id)a3
{
}

- (HMDAccessorySetupMetricDispatcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDAccessorySetupMetricDispatcherDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDAccessorySetupMetricDispatcher *)self trackingInfo];
  v3 = [v2 identifier];
  v4 = [v3 UUIDString];

  return v4;
}

- (BOOL)hasHome:(id)a3
{
  id v4 = a3;
  -[HMDAccessorySetupMetricDispatcher home]((id *)&self->super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (id)home
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 17);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)addHome:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self)
  {
    id v17 = v4;
    objc_storeWeak((id *)&self->_home, v4);
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
    self->_selectedHomeLocationStatus = [WeakRetained homeLocation];
    self->_isUserAtOtherOwnedHome = 0;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = objc_loadWeakRetained((id *)&self->_homeManager);
    v7 = [v6 homes];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v11, "homeLocation", lock) == 1)
          {
            v12 = [v11 uuid];
            v13 = [WeakRetained uuid];
            if ([v12 isEqual:v13])
            {
            }
            else
            {
              int v14 = [v11 isOwnerUser];

              if (v14) {
                self->_isUserAtOtherOwnedHome = 1;
              }
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    os_unfair_lock_unlock(lock);
    BOOL v15 = [(HMDAccessorySetupMetricDispatcher *)self submitted];
    id v4 = v17;
    if (!v15)
    {
      -[HMDAccessorySetupMetricDispatcher subscribeToSettingsEvents:]((id *)&self->super.super.isa, 1);
      id v4 = v17;
    }
  }
}

- (void)subscribeToSettingsEvents:(id *)a1
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 17);
  id v5 = [WeakRetained uuid];

  id v6 = &unk_2303E3000;
  if (v5)
  {
    v7 = [a1 trackingInfo];
    uint64_t v8 = [v7 accessoryUUID];

    if (v8)
    {
      uint64_t v9 = [MEMORY[0x263F0E048] defaultSettingsAllKeyPaths];
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v36 = __60__HMDAccessorySetupMetricDispatcher_accessorySettingsTopics__block_invoke;
      uint64_t v37 = &unk_264A2E5E8;
      id v10 = v5;
      id v38 = v10;
      id v11 = v8;
      id v39 = v11;
      v12 = objc_msgSend(v9, "na_map:", &buf);

      v13 = [MEMORY[0x263F0E048] languageKeyPaths];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __60__HMDAccessorySetupMetricDispatcher_accessorySettingsTopics__block_invoke_2;
      v32[3] = &unk_264A2E5E8;
      id v33 = v10;
      id v14 = v11;
      id v6 = (void *)&unk_2303E3000;
      id v34 = v14;
      BOOL v15 = objc_msgSend(v13, "na_map:", v32);
      v16 = [v15 arrayByAddingObjectsFromArray:v12];
    }
    else
    {
      v16 = (void *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x263EFFA68];
  }

  if ([v16 count])
  {
    id v17 = v16;
    long long v18 = (void *)MEMORY[0x230FBD990]();
    long long v19 = a1;
    long long v20 = HMFGetOSLogHandle();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if (a2)
    {
      if (v21)
      {
        unint64_t v22 = HMFGetLogIdentifier();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v22;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Subscribing to accessory settings to generate setup time metric", (uint8_t *)&buf, 0xCu);
      }
      uint64_t v23 = (void *)MEMORY[0x263EFFA68];
    }
    else
    {
      if (v21)
      {
        id v28 = HMFGetLogIdentifier();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v28;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing to accessory settings to generate setup time metric", (uint8_t *)&buf, 0xCu);
      }
      uint64_t v23 = v17;
      id v17 = (id)MEMORY[0x263EFFA68];
    }

    id v29 = objc_loadWeakRetained(v19 + 14);
    v30 = [v29 localAndRemoteSubscriptionProvider];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = v6[326];
    v31[2] = __63__HMDAccessorySetupMetricDispatcher_subscribeToSettingsEvents___block_invoke;
    v31[3] = &unk_264A2E660;
    v31[4] = v19;
    [v30 changeRegistrationsForConsumer:v19 topicFilterAdditions:v17 topicFilterRemovals:v23 completion:v31];
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x230FBD990]();
    id v25 = a1;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v27;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@No settings topics", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __63__HMDAccessorySetupMetricDispatcher_subscribeToSettingsEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    id v38 = v11;
    __int16 v39 = 2112;
    id v40 = v6;
    v12 = "%{public}@Subscription to settings resulted in error: %@";
    v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    uint32_t v15 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    id v38 = v11;
    v12 = "%{public}@Subscription to settings topics was successful";
    v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 12;
  }
  _os_log_impl(&dword_22F52A000, v13, v14, v12, buf, v15);

LABEL_7:
  v30 = v6;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v16 = v5;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v33;
    id v31 = v16;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        BOOL v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        unint64_t v22 = [v16 objectForKeyedSubscript:v21];
        uint64_t v23 = (void *)MEMORY[0x230FBD990]();
        id v24 = *(id *)(a1 + 32);
        id v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          uint64_t v26 = v18;
          uint64_t v27 = a1;
          v29 = uint64_t v28 = v19;
          *(_DWORD *)long long buf = 138543618;
          id v38 = v29;
          __int16 v39 = 2112;
          id v40 = v21;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Received cached event on settings topic: %@ during subscription", buf, 0x16u);

          uint64_t v19 = v28;
          a1 = v27;
          uint64_t v18 = v26;
          id v16 = v31;
        }

        [*(id *)(a1 + 32) didReceiveEvent:v22 topic:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v18);
  }
}

void __60__HMDAccessorySetupMetricDispatcher_accessorySettingsTopics__block_invoke()
{
}

void __60__HMDAccessorySetupMetricDispatcher_accessorySettingsTopics__block_invoke_2()
{
}

- (BOOL)submitted
{
  v2 = self;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_submitted;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)markLanguageSettingObserved
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_languageSettingTime)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_languageSettingTime = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
    os_unfair_lock_unlock(p_lock);
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      id v8 = [(HMDAccessorySetupMetricDispatcher *)v5 trackingInfo];
      uint64_t v9 = [v8 accessoryUUID];
      int v10 = 138543618;
      id v11 = v7;
      __int16 v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Marked language setting observed (%@)", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)markFirstSettingObserved
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_firstSettingTime)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_firstSettingTime = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
    os_unfair_lock_unlock(p_lock);
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      id v8 = [(HMDAccessorySetupMetricDispatcher *)v5 trackingInfo];
      uint64_t v9 = [v8 accessoryUUID];
      int v14 = 138543618;
      uint32_t v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Marked first setting observed (%@)", (uint8_t *)&v14, 0x16u);
    }
    logger = v5->_logger;
    if (os_signpost_enabled(logger))
    {
      id v11 = logger;
      __int16 v12 = [(HMDAccessorySetupMetricDispatcher *)v5 trackingInfo];
      v13 = [v12 accessoryUUID];
      int v14 = 138412290;
      uint32_t v15 = v13;
      _os_signpost_emit_with_name_impl(&dword_22F52A000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FirstAccessorySettingObserved", "accessoryUUID=%{signpost.description:attribute}@ ", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)markAccessoryRemoved
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_accessoryRemovedTime = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
  os_unfair_lock_unlock(p_lock);
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    id v8 = [(HMDAccessorySetupMetricDispatcher *)v5 trackingInfo];
    uint64_t v9 = [v8 accessoryUUID];
    int v11 = 138543618;
    __int16 v12 = v7;
    __int16 v13 = 2112;
    int v14 = v9;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@No longer tracking accessory (%@) setup time as it was removed", (uint8_t *)&v11, 0x16u);
  }
  int v10 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2029];
  -[HMDAccessorySetupMetricDispatcher _queryRemoteAndSubmitWithConfigurationError:]((uint64_t)v5, v10);
}

- (void)_queryRemoteAndSubmitWithConfigurationError:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = dispatch_group_create();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 136));
    id v6 = [(id)a1 delegate];
    v7 = [WeakRetained residentDeviceManager];
    id v8 = [v7 primaryResidentDevice];

    uint64_t v9 = [(id)a1 obtainDiscoveryAssertion];
    int v10 = *(void **)(a1 + 184);
    *(void *)(a1 + 184) = v9;

    int v11 = [WeakRetained appleMediaAccessories];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke;
    v28[3] = &unk_264A2E3A0;
    id v12 = v8;
    id v29 = v12;
    __int16 v13 = objc_msgSend(v11, "na_firstObjectPassingTest:", v28);

    dispatch_group_enter(v4);
    int v14 = [(id)a1 trackingInfo];
    uint64_t v15 = [v14 accessoryUUID];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke_2;
    v26[3] = &unk_264A2E408;
    v26[4] = a1;
    __int16 v16 = v4;
    uint64_t v27 = v16;
    [v6 querySetupDiagnosticStateForAccessoryUUID:v15 completion:v26];

    if (v13)
    {
      dispatch_group_enter(v16);
      uint64_t v17 = [v13 uuid];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke_3;
      v24[3] = &unk_264A2E408;
      v24[4] = a1;
      id v25 = v16;
      [v6 querySetupDiagnosticStateForAccessoryUUID:v17 completion:v24];
    }
    else
    {
      uint64_t v19 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2032];
      objc_setProperty_atomic((id)a1, v20, v19, 168);
    }
    Property = objc_getProperty((id)a1, v18, 80, 1);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke_4;
    v22[3] = &unk_264A2F820;
    v22[4] = a1;
    id v23 = v3;
    dispatch_group_notify(v16, Property, v22);
  }
}

uint64_t __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 idsIdentifier];
  id v4 = [*(id *)(a1 + 32) messageAddress];
  id v5 = [v4 idsIdentifier];
  uint64_t v6 = [v3 isEqual:v5];

  return v6;
}

void __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id newValue = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_setProperty_atomic(v7, v5, newValue, 144);
    uint64_t v9 = *(void **)(a1 + 32);
    if (v9) {
      objc_setProperty_atomic(v9, v8, v6, 152);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id newValue = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_setProperty_atomic(v7, v5, newValue, 160);
    uint64_t v9 = *(void **)(a1 + 32);
    if (v9) {
      objc_setProperty_atomic(v9, v8, v6, 168);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke_4(uint64_t a1)
{
  uint64_t v161 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  id v152 = *(id *)(a1 + 40);
  if (!v1) {
    goto LABEL_66;
  }
  os_unfair_lock_lock_with_options();
  int v2 = *(unsigned __int8 *)(v1 + 24);
  *(unsigned char *)(v1 + 24) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 8));
  if (v2)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = (id)v1;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      v154 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Can't submit the metric twice", buf, 0xCu);
    }
    goto LABEL_66;
  }
  objc_msgSend(objc_getProperty((id)v1, v3, 176, 1), "cancel");
  id v8 = [(id)v1 trackingInfo];
  uint64_t v9 = [(id)v1 primaryResidentIdenticalToAccessoryBeingAdded];
  if ([(id)v1 numberOfMediaAccessoriesnHome]) {
    v9 |= 2uLL;
  }
  if ([(id)v1 numberOfResidentsInHome]) {
    v9 |= 4uLL;
  }
  if ([(id)v1 numberOfAvailableResidentsInHome]) {
    v9 |= 8uLL;
  }
  if ([(id)v1 primaryResidentAssignedInHomeWhenAddAccessory]) {
    v9 |= 0x10uLL;
  }
  if ([(id)v1 didSendAddAccessoryRequestToPrimary]) {
    v9 |= 0x20uLL;
  }
  int v10 = [(id)v1 didAddAccessoryLocally];
  uint64_t v11 = v9 | 0x40;
  if (!v10) {
    uint64_t v11 = v9;
  }
  uint64_t v135 = v11;
  v143 = [HMDAppleMediaAccessorySetupLogEvent alloc];
  uint64_t v141 = [v8 role];
  uint64_t v139 = [v8 startTime];
  uint64_t v137 = [v8 endTime];
  uint64_t v133 = [(id)v1 addAccessoryFinishTime];
  uint64_t v131 = [(id)v1 accessoryRemovedTime];
  __uint64_t v129 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v145 = [v8 sessionError];
  v149 = [(id)v1 setupSessionIdentifier];
  v127 = [v149 UUIDString];
  char v125 = [(id)v1 isRepairSession];
  v147 = [v8 accessoryCategory];
  v123 = [v147 categoryType];
  id v12 = v8;
  id WeakRetained = objc_loadWeakRetained((id *)(v1 + 136));
  int v14 = [v12 accessoryUUID];

  uint64_t v15 = [WeakRetained accessoryWithUUID:v14];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v16 = v15;
  }
  else {
    __int16 v16 = 0;
  }
  id v17 = v16;

  uint64_t v18 = [v17 softwareVersion];

  v121 = [v18 versionString];

  v120 = [v12 setupClientBundleID];
  id v119 = objc_loadWeakRetained((id *)(v1 + 112));
  uint64_t v118 = [v119 homepodSetupRetryCount];
  uint64_t v117 = [(id)v1 firstSettingTime];
  uint64_t v116 = [(id)v1 languageSettingTime];
  id v151 = v12;
  id v19 = objc_loadWeakRetained((id *)(v1 + 136));
  if (v19
    && ([v151 accessoryUUID], SEL v20 = objc_claimAutoreleasedReturnValue(), v20, v20))
  {
    BOOL v21 = [v151 accessoryUUID];
    char v115 = [v19 defaultRoomContainsAccessoryWithUUID:v21];
  }
  else
  {
    unint64_t v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = (id *)(id)v1;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = HMFGetLogIdentifier();
      uint64_t v26 = (id *)objc_loadWeakRetained(v23 + 17);
      uint64_t v27 = [v151 accessoryUUID];
      *(_DWORD *)long long buf = 138543874;
      v154 = v25;
      __int16 v155 = 2112;
      v156 = v26;
      __int16 v157 = 2112;
      v158 = v27;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Either home: %@ or accessory UUID: %@ is nil", buf, 0x20u);
    }
    char v115 = 0;
  }

  uint64_t v114 = [(id)v1 selectedHomeLocationStatus];
  char v113 = [(id)v1 isUserAtOtherOwnedHome];
  uint64_t v112 = [(id)v1 lastPrimaryResidentAvailableTime];
  int v28 = [(id)v1 numberOfTimesPrimaryResidentChanged];
  uint64_t v29 = [(id)v1 lastPrimaryClientConnectedTime];
  unsigned int v30 = [(id)v1 numberOfTimesPrimaryClientConnected];
  unsigned int v31 = [(id)v1 numberOfTimesPrimaryClientDisconnected];
  int v32 = [(id)v1 numberOfTimesPrimaryClientConnectMessageFailed];
  long long v33 = [(id)v1 lastPrimaryClientConnectMessageFailError];
  id v35 = objc_getProperty((id)v1, v34, 152, 1);
  id v37 = objc_getProperty((id)v1, v36, 168, 1);
  id v38 = [(id)v1 addAccessoryOnPrimaryFailError];
  LODWORD(v111) = v32;
  LODWORD(v110) = v28;
  LOBYTE(v109) = v113;
  LOBYTE(v108) = v115;
  LOBYTE(v106) = v125;
  v144 = -[HMDAppleMediaAccessorySetupLogEvent initWithRole:setupStartTime:setupEndTime:accessoryAddEndTime:accessoryRemoveTime:configurationEndTime:setupSessionError:setupSessionIdentifier:isRepairSession:category:accessorySoftwareVersion:setupClientBundleID:retryCount:firstSettingTime:languageSettingTime:accessoryInDefaultRoom:selectedHomeLocationStatus:isUserAtOtherOwnedHome:lastPrimaryResidentAvailableTime:numberOfTimesPrimaryResidentChanged:lastPrimaryClientConnectedTime:numberOfTimesPrimaryClientConnected:numberOfTimesPrimaryClientDisconnected:numberOfTimesPrimaryClientConnectMessageFailed:addAccessoryMessageReport:lastPrimaryClientConnectMessageFailError:accessoryDiagnosticInfoFetchError:primaryResidentDiagnosticInfoFetchError:addAccessoryOnPrimaryFailError:](v143, "initWithRole:setupStartTime:setupEndTime:accessoryAddEndTime:accessoryRemoveTime:configurationEndTime:setupSessionError:setupSessionIdentifier:isRepairSession:category:accessorySoftwareVersion:setupClientBundleID:retryCount:firstSettingTime:languageSettingTime:accessoryInDefaultRoom:selectedHomeLocationStatus:isUserAtOtherOwnedHome:lastPrimaryResidentAvailableTime:numberOfTimesPrimaryResidentChanged:lastPrimaryClientConnectedTime:numberOfTimesPrimaryClientConnected:numberOfTimesPrimaryClientDisconnected:numberOfTimesPrimaryClientConnectMessageFailed:addAccessoryMessageReport:lastPrimaryClientConnectMessageFailError:accessoryDiagnosticInfoFetchError:primaryResidentDiagnosticInfoFetchError:addAccessoryOnPrimaryFailError:", v141, v139, v137, v133, v131, v129 / 0x3B9ACA00, v145, v127, v106, v123, v121,
           v120,
           v118,
           v117,
           v116,
           v108,
           v114,
           v109,
           v112,
           v110,
           v29,
           __PAIR64__(v31, v30),
           v111,
           v135,
           v33,
           v35,
           v37,
           v38);

  id v148 = objc_loadWeakRetained((id *)(v1 + 96));
  __int16 v39 = (void *)MEMORY[0x230FBD990]();
  id v40 = (id)v1;
  uint64_t v41 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    BOOL v42 = HMFGetLogIdentifier();
    unint64_t v43 = [v151 accessoryUUID];
    uint64_t v44 = [(HMDAppleMediaAccessorySetupLogEvent *)v144 coreAnalyticsEventDictionary];
    *(_DWORD *)long long buf = 138544130;
    v154 = v42;
    __int16 v155 = 2112;
    v156 = v43;
    __int16 v157 = 2112;
    v158 = v44;
    __int16 v159 = 2112;
    id v160 = v152;
    _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_INFO, "%{public}@Submitting accessory (%@) setup log event:%@ with error:%@", buf, 0x2Au);
  }
  [v148 submitLogEvent:v144 error:v152];
  id v150 = objc_loadWeakRetained((id *)v40 + 17);
  int v45 = [v150 currentDevice];
  uint64_t v46 = [v45 idsIdentifier];
  v146 = [v46 UUIDString];

  uint64_t v47 = [v150 residentDeviceManager];
  v140 = [v47 primaryResidentDevice];

  if (!v146)
  {
    v49 = (void *)MEMORY[0x230FBD990]();
    id v50 = v40;
    v51 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v52 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      v154 = v52;
      _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, "%{public}@Could not get idsIdentifier of current device", buf, 0xCu);
    }
    v146 = @"Unknown";
  }
  id v142 = objc_getProperty(v40, v48, 120, 1);
  id v54 = objc_getProperty(v40, v53, 128, 1);
  v138 = v54;
  if (v150 && v142 && v54)
  {
    v55 = +[HMDMainDriver driver];
    v136 = [v55 currentWiFiNetworkRSSI];

    if (v136) {
      unsigned int v122 = [v136 intValue];
    }
    else {
      unsigned int v122 = 0;
    }
    v134 = [v40 setupSessionIdentifier];
    v126 = [v134 UUIDString];
    v132 = +[HMDMainDriver driver];
    v124 = [v132 currentWiFiNetworkInfo];
    v130 = [v150 residentDeviceManager];
    v128 = [v130 residentDevices];
    uint64_t v60 = [v128 count];
    v61 = [v150 appleMediaAccessories];
    uint64_t v62 = [v61 count];
    id v64 = objc_getProperty(v40, v63, 144, 1);
    v65 = [v140 device];
    v66 = [v65 idsIdentifier];
    v67 = [v66 UUIDString];
    id v69 = objc_getProperty(v40, v68, 160, 1);
    v70 = [v150 uuid];
    LOBYTE(v107) = objc_msgSend(objc_getProperty(v40, v71, 168, 1), "code") == 2032;
    v72 = [v40 networkMetricWithDiscoveryController:v142 networkInfoController:v138 sessionID:v126 idsIdentifierString:v146 currentWiFiInfo:v124 currentWiFiNetworkRSSI:v122 numResidents:v60 numAppleMediaAccessories:v62 accessoryDiagnosticInfo:v64 primaryResidentIdsIdentifierString:v67 primaryResidentDiagnosticInfo:v69 homeUUID:v70 primaryResidentDiagnosticInfoFetched:v107];

    [v148 submitLogEvent:v72 error:v152];
  }
  else
  {
    v56 = (void *)MEMORY[0x230FBD990]();
    id v57 = v40;
    v58 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      v59 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      v154 = v59;
      _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_ERROR, "%{public}@Did not find valid controllers to get network information", buf, 0xCu);
    }
  }
  [v40 releaseDiscoveryAssertionWithAssertionHandle:*((void *)v40 + 23)];
  objc_storeStrong((id *)v40 + 23, 0);
  v73 = [v151 accessoryCategory];
  v74 = [v73 categoryType];
  int v75 = [v74 isEqualToString:*MEMORY[0x263F0B0A0]];

  id v76 = objc_loadWeakRetained((id *)v40 + 14);
  v77 = v76;
  if (v75)
  {
    objc_msgSend(v76, "setHomepodSetupRetryCount:", objc_msgSend(v76, "homepodSetupRetryCount") + 1);
    if (objc_msgSend(objc_getProperty(v40, v78, 144, 1), "hasLastSetupInfo"))
    {
      v80 = objc_msgSend(objc_getProperty(v40, v79, 144, 1), "lastSetupInfo");
      id v81 = +[HMDCurrentAccessorySetupMetricDispatcher homepodSetupLogEventFromProtoSetupInfo:v80];

      if (v81)
      {
        v82 = [v40 setupSessionIdentifier];
        v83 = [v82 UUIDString];
        [v81 setSetupSessionIdentifier:v83];
      }
      v84 = (void *)MEMORY[0x230FBD990]([v148 submitLogEvent:v81]);
      id v85 = v40;
      v86 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      {
        v87 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        v154 = v87;
        _os_log_impl(&dword_22F52A000, v86, OS_LOG_TYPE_DEFAULT, "%{public}@Submitted retrieved homepod log event.", buf, 0xCu);
      }
    }
    else
    {
      if (!objc_getProperty(v40, v79, 152, 1))
      {
        v92 = (void *)MEMORY[0x230FBD990]();
        id v93 = v40;
        v94 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
        {
          v95 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543362;
          v154 = v95;
          _os_log_impl(&dword_22F52A000, v94, OS_LOG_TYPE_ERROR, "%{public}@No homepod setup log event found.", buf, 0xCu);
        }
        goto LABEL_57;
      }
      id v81 = [[HMDHomePodSetupLatencyLogEvent alloc] initLogEventWithInitialState:0x10000];
      objc_msgSend(v81, "setError:", objc_getProperty(v40, v88, 152, 1));
      v89 = [v40 setupSessionIdentifier];
      v90 = [v89 UUIDString];
      [v81 setSetupSessionIdentifier:v90];

      v84 = (void *)MEMORY[0x230FBD990]([v148 submitLogEvent:v81]);
      id v85 = v40;
      v86 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      {
        v91 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        v154 = v91;
        _os_log_impl(&dword_22F52A000, v86, OS_LOG_TYPE_DEFAULT, "%{public}@Submitted homepod log event with fetch error.", buf, 0xCu);
      }
    }
  }
LABEL_57:
  if (!v152)
  {
    v96 = [v151 sessionError];
    int v97 = v96 ? 0 : v75;

    if (v97) {
      [v77 setHomepodSetupRetryCount:0];
    }
  }
  os_unfair_lock_lock_with_options();
  [*((id *)v40 + 11) suspend];
  v98 = (void *)*((void *)v40 + 11);
  *((void *)v40 + 11) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)v40 + 2);
  v99 = (void *)MEMORY[0x230FBD990]();
  v100 = (id *)v40;
  v101 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
  {
    v102 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    v154 = v102;
    __int16 v155 = 2112;
    v156 = v100;
    _os_log_impl(&dword_22F52A000, v101, OS_LOG_TYPE_INFO, "%{public}@Removing setup metric dispatcher:%@", buf, 0x16u);
  }
  id v103 = objc_loadWeakRetained(v100 + 14);
  v104 = [v100 trackingInfo];
  v105 = [v104 accessoryUUID];
  [v103 removeAccessorySetupMetricDispatcherForAccessoryUUID:v105];

LABEL_66:
}

- (void)markAccessoryAddCompleted
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_addAccessoryFinishTime = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
  os_unfair_lock_unlock(p_lock);
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    id v8 = [(HMDAccessorySetupMetricDispatcher *)v5 trackingInfo];
    uint64_t v9 = [v8 accessoryUUID];
    int v10 = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Marked accessory add (%@)", (uint8_t *)&v10, 0x16u);
  }
}

- (void)markLocalAccessoryAddStarted
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_didAddAccessoryLocally = 1;
  os_unfair_lock_unlock(p_lock);
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    id v8 = [(HMDAccessorySetupMetricDispatcher *)v5 trackingInfo];
    uint64_t v9 = [v8 accessoryUUID];
    int v10 = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Marked accessory add (%@) started locally", (uint8_t *)&v10, 0x16u);
  }
}

- (void)markRemoteAccessoryAddEndedWithError:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  id v5 = (NSError *)[v4 copy];
  addAccessoryOnPrimaryFailError = self->_addAccessoryOnPrimaryFailError;
  self->_addAccessoryOnPrimaryFailError = v5;

  os_unfair_lock_unlock(&self->_lock);
  v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    uint64_t v11 = [(HMDAccessorySetupMetricDispatcher *)v8 trackingInfo];
    __int16 v12 = [v11 accessoryUUID];
    int v13 = 138543874;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    __int16 v16 = v12;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Marked accessory add (%@) remotely ended with error (%@)", (uint8_t *)&v13, 0x20u);
  }
}

- (void)markRemoteAccessoryAddStarted
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_didSendAddAccessoryRequestToPrimary = 1;
  os_unfair_lock_unlock(p_lock);
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    id v8 = [(HMDAccessorySetupMetricDispatcher *)v5 trackingInfo];
    uint64_t v9 = [v8 accessoryUUID];
    int v10 = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    int v13 = v9;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Marked accessory add (%@) started remotely", (uint8_t *)&v10, 0x16u);
  }
}

- (void)markRemoteAccessoryAddWillStart:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  id v5 = -[HMDAccessorySetupMetricDispatcher home]((id *)&self->super.super.isa);
  id v6 = [v5 appleMediaAccessories];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __69__HMDAccessorySetupMetricDispatcher_markRemoteAccessoryAddWillStart___block_invoke;
  v36[3] = &unk_264A2E3A0;
  id v35 = v4;
  id v37 = v35;
  v7 = objc_msgSend(v6, "na_filter:", v36);

  id v8 = objc_msgSend(v7, "na_map:", &__block_literal_global_122_263079);
  uint64_t v9 = [v8 asSet];

  int v10 = [v5 residentDeviceManager];
  uint64_t v11 = [v10 primaryResidentDevice];
  BOOL v12 = v11 == 0;

  if (!v12)
  {
    int v13 = [v5 residentDeviceManager];
    uint64_t v14 = [v13 primaryResidentDevice];
    __int16 v15 = [v14 device];
    __int16 v16 = [v15 idsIdentifier];

    if (v16) {
      self->_primaryResidentIdenticalToAccessoryBeingAdded = [v9 containsObject:v16];
    }
    else {
      self->_primaryResidentIdenticalToAccessoryBeingAdded = 0;
    }
    self->_primaryResidentAssignedInHomeWhenAddAccessory = 1;
  }
  __int16 v17 = [v5 appleMediaAccessories];
  int v18 = [v17 count];
  self->_numberOfMediaAccessoriesnHome = v18 - [v7 count];

  uint64_t v19 = [v5 residentDeviceManager];
  SEL v20 = [v19 availableResidentDevices];
  BOOL v21 = objc_msgSend(v20, "na_map:", &__block_literal_global_125_263080);
  unint64_t v22 = [v21 asSet];
  id v23 = (void *)[v22 mutableCopy];

  [v23 minusSet:v9];
  self->_numberOfAvailableResidentsInHome = [v23 count];
  id v24 = [v5 residentDeviceManager];
  id v25 = [v24 residentDevices];
  uint64_t v26 = objc_msgSend(v25, "na_map:", &__block_literal_global_127_263081);
  uint64_t v27 = [v26 asSet];
  int v28 = (void *)[v27 mutableCopy];

  [v28 minusSet:v9];
  self->_numberOfResidentsInHome = [v28 count];

  os_unfair_lock_unlock(&self->_lock);
  uint64_t v29 = (void *)MEMORY[0x230FBD990]();
  unsigned int v30 = self;
  unsigned int v31 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    int v32 = HMFGetLogIdentifier();
    long long v33 = [(HMDAccessorySetupMetricDispatcher *)v30 trackingInfo];
    SEL v34 = [v33 accessoryUUID];
    *(_DWORD *)long long buf = 138543618;
    __int16 v39 = v32;
    __int16 v40 = 2112;
    uint64_t v41 = v34;
    _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Marked accessory add (%@) will start", buf, 0x16u);
  }
}

uint64_t __69__HMDAccessorySetupMetricDispatcher_markRemoteAccessoryAddWillStart___block_invoke(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = [a2 serialNumber];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

id __69__HMDAccessorySetupMetricDispatcher_markRemoteAccessoryAddWillStart___block_invoke_4(uint64_t a1, void *a2)
{
  int v2 = [a2 device];
  id v3 = [v2 idsIdentifier];

  return v3;
}

id __69__HMDAccessorySetupMetricDispatcher_markRemoteAccessoryAddWillStart___block_invoke_3(uint64_t a1, void *a2)
{
  int v2 = [a2 device];
  id v3 = [v2 idsIdentifier];

  return v3;
}

uint64_t __69__HMDAccessorySetupMetricDispatcher_markRemoteAccessoryAddWillStart___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 idsIdentifier];
}

- (void)markRepairSessionComplete
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_isRepairSession = 1;
  os_unfair_lock_unlock(p_lock);
}

- (void)markEventRouterPrimaryClientConnectMessageFailedWithError:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  if (self->_lastPrimaryResidentAvailableTime)
  {
    ++self->_numberOfTimesPrimaryClientConnectMessageFailed;
    objc_storeStrong((id *)&self->_lastPrimaryClientConnectMessageFailError, a3);
    os_unfair_lock_unlock(&self->_lock);
    id v6 = (void *)MEMORY[0x230FBD990]();
    v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Marked primary client connect message failed with error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)markEventRouterPrimaryClientConnectStatusChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_lastPrimaryResidentAvailableTime)
  {
    if (v3)
    {
      self->_lastPrimaryClientConnectedTime = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
      id v6 = &OBJC_IVAR___HMDAccessorySetupMetricDispatcher__numberOfTimesPrimaryClientConnected;
    }
    else
    {
      id v6 = &OBJC_IVAR___HMDAccessorySetupMetricDispatcher__numberOfTimesPrimaryClientDisconnected;
    }
    ++*(_DWORD *)((char *)&self->super.super.isa + *v6);
    os_unfair_lock_unlock(p_lock);
    v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = HMFGetLogIdentifier();
      uint64_t v11 = HMFBooleanToString();
      int v12 = 138543618;
      id v13 = v10;
      __int16 v14 = 2112;
      __int16 v15 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Marked primary client connection status changed: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)markPrimaryResidentChanged
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ++self->_numberOfTimesPrimaryResidentChanged;
  if (!self->_lastPrimaryResidentAvailableTime) {
    self->_lastPrimaryResidentAvailableTime = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
  }
  os_unfair_lock_unlock(p_lock);
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Marked primary resident is available", (uint8_t *)&v8, 0xCu);
  }
}

- (void)submit
{
}

- (void)timerDidFire:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = (HMDAccessorySetupMetricDispatcher *)a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 88, 1);
  }
  else {
    id Property = 0;
  }
  v7 = (HMDAccessorySetupMetricDispatcher *)Property;
  if (v5 != 0 && v7 == v5) {
    uint64_t v9 = v5;
  }
  else {
    uint64_t v9 = v7;
  }
  if (v5 == 0 || v7 != v5 || self == 0)
  {
  }
  else
  {
    id v11 = objc_getProperty(self, v8, 88, 1);

    if (v11)
    {
      int v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = self;
      __int16 v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        uint64_t v26 = v15;
        __int16 v27 = 2112;
        int v28 = v13;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Timer did fire for setup metric dispatcher:%@", buf, 0x16u);
      }
      if ([(HMDAccessorySetupMetricDispatcher *)v13 languageSettingTime])
      {
        [(HMDAccessorySetupMetricDispatcher *)v13 submit];
      }
      else
      {
        unint64_t v22 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2030];
        -[HMDAccessorySetupMetricDispatcher _queryRemoteAndSubmitWithConfigurationError:]((uint64_t)v13, v22);
        id WeakRetained = objc_loadWeakRetained((id *)&v13->_radarInitiator);
        id v24 = [NSString stringWithFormat:@"%@, %@", @"HomePod Database Sync Timed Out", v22];
        [WeakRetained requestRadarWithDisplayReason:@"HomePod Database Sync Timed Out" radarTitle:v24 componentName:@"HomeKit" componentVersion:@"HomeKit Device Setup" componentID:1364036];
      }
      goto LABEL_22;
    }
  }
  uint64_t v16 = (void *)MEMORY[0x230FBD990]();
  __int16 v17 = self;
  int v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    SEL v20 = HMFGetLogIdentifier();
    if (self) {
      id v21 = objc_getProperty(v17, v19, 88, 1);
    }
    else {
      id v21 = 0;
    }
    *(_DWORD *)long long buf = 138543874;
    uint64_t v26 = v20;
    __int16 v27 = 2112;
    int v28 = v5;
    __int16 v29 = 2112;
    id v30 = v21;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unexpected delegate callback from timer:%@, expected:%@", buf, 0x20u);
  }
LABEL_22:
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x263F0E300] decodeTopic:v7];
  uint64_t v9 = [v8 asAccessorySettingTopic];

  if (v9)
  {
    id v10 = v6;
    id v11 = v9;
    if (!self)
    {
LABEL_19:

      goto LABEL_20;
    }
    id v33 = 0;
    int v12 = [MEMORY[0x263F0E3F8] decodeSettingFromEvent:v10 error:&v33];
    id v13 = v33;
    if (!v12)
    {
      id v24 = v11;
      id v25 = (void *)MEMORY[0x230FBD990]();
      uint64_t v26 = self;
      __int16 v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        int v28 = v32 = v13;
        *(_DWORD *)long long buf = 138543874;
        id v35 = v28;
        __int16 v36 = 2112;
        id v37 = v10;
        __int16 v38 = 2112;
        id v39 = v24;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Nil settings value for settings update event: %@ topic: %@", buf, 0x20u);

        id v13 = v32;
      }

      id v11 = v24;
      goto LABEL_18;
    }
    if ([(HMDAccessorySetupMetricDispatcher *)self submitted])
    {
      id v31 = v11;
      __int16 v14 = (void *)MEMORY[0x230FBD990]();
      __int16 v15 = self;
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        int v18 = v17 = v13;
        *(_DWORD *)long long buf = 138543362;
        id v35 = v18;
        uint64_t v19 = "%{public}@Setup metric already submitted, will unsubscribe from settings events";
LABEL_16:
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, v19, buf, 0xCu);

        id v13 = v17;
      }
    }
    else
    {
      [(HMDAccessorySetupMetricDispatcher *)self markFirstSettingObserved];
      [v12 keyPath];
      __int16 v29 = v17 = v13;
      int v30 = [v29 isEqual:@"root.siri.language"];

      id v13 = v17;
      if (!v30)
      {
LABEL_18:

        goto LABEL_19;
      }
      id v31 = v11;
      [(HMDAccessorySetupMetricDispatcher *)self markLanguageSettingObserved];
      __int16 v14 = (void *)MEMORY[0x230FBD990]([(HMDAccessorySetupMetricDispatcher *)self submit]);
      __int16 v15 = self;
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v18 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        id v35 = v18;
        uint64_t v19 = "%{public}@Setup metric submitted, will unsubscribe from settings events";
        goto LABEL_16;
      }
    }

    -[HMDAccessorySetupMetricDispatcher subscribeToSettingsEvents:]((id *)&v15->super.super.isa, 0);
    id v11 = v31;
    goto LABEL_18;
  }
  SEL v20 = (void *)MEMORY[0x230FBD990]();
  id v21 = self;
  unint64_t v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v23 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    id v35 = v23;
    __int16 v36 = 2112;
    id v37 = v7;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Do not handle topic: %@", buf, 0x16u);
  }
LABEL_20:
}

- (HMDDeviceSetupTrackingInfo)trackingInfo
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_trackingInfo;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)updateTrackingInfo:(id)a3
{
  id v5 = a3;
  if (self)
  {
    os_unfair_lock_lock_with_options();
    objc_storeStrong((id *)&self->_trackingInfo, a3);
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)addRemoteEventRouterAssertion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting remote event router assertion for setup metric collection: %@", (uint8_t *)&v10, 0x16u);
  }
  if (v6) {
    objc_setProperty_atomic(v6, v9, v4, 176);
  }
}

- (HMDAccessorySetupMetricDispatcher)initWithQueue:(id)a3 trackingInfo:(id)a4 setupSessionIdentifier:(id)a5 homeManager:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  unint64_t v22 = +[HMDMainDriver driver];
  SEL v20 = [v22 discoveryController];
  id v13 = +[HMDMainDriver driver];
  uint64_t v14 = [v13 networkInfoController];
  __int16 v15 = +[HMDMetricsManager sharedLogEventSubmitter];
  uint64_t v16 = [v9 metricsManager];
  id v17 = [v16 radarInitiator];
  int v18 = [(HMDAccessorySetupMetricDispatcher *)self initWithQueue:v12 discoveryController:v20 networkInfoController:v14 trackingInfo:v11 setupSessionIdentifier:v10 homeManager:v9 logEventSubmitter:v15 radarInitiator:v17 timerFactory:&__block_literal_global_263107];

  return v18;
}

id __99__HMDAccessorySetupMetricDispatcher_initWithQueue_trackingInfo_setupSessionIdentifier_homeManager___block_invoke(uint64_t a1, void *a2)
{
  int v2 = (objc_class *)MEMORY[0x263F42658];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithTimeInterval:8 options:900.0];
  [v4 setDelegate:v3];

  [v4 resume];
  return v4;
}

- (HMDAccessorySetupMetricDispatcher)initWithQueue:(id)a3 discoveryController:(id)a4 networkInfoController:(id)a5 trackingInfo:(id)a6 setupSessionIdentifier:(id)a7 homeManager:(id)a8 logEventSubmitter:(id)a9 radarInitiator:(id)a10 timerFactory:(id)a11
{
  id v16 = a3;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  unint64_t v22 = (void (**)(id, HMDAccessorySetupMetricDispatcher *))a11;
  v37.receiver = self;
  v37.super_class = (Class)HMDAccessorySetupMetricDispatcher;
  id v23 = [(HMDAccessorySetupMetricDispatcher *)&v37 init];
  if (v23)
  {
    uint64_t v24 = HMFGetOSLogHandle();
    logger = v23->_logger;
    v23->_logger = (OS_os_log *)v24;

    objc_storeStrong((id *)&v23->_queue, a3);
    uint64_t v26 = +[HMDMainDriver driver];
    uint64_t v27 = [v26 discoveryController];
    id discoveryController = v23->_discoveryController;
    v23->_id discoveryController = (id)v27;

    __int16 v29 = +[HMDMainDriver driver];
    uint64_t v30 = [v29 networkInfoController];
    id networkInfoController = v23->_networkInfoController;
    v23->_id networkInfoController = (id)v30;

    objc_storeStrong((id *)&v23->_trackingInfo, a6);
    objc_storeWeak((id *)&v23->_submitter, v20);
    uint64_t v32 = v22[2](v22, v23);
    timer = v23->_timer;
    v23->_timer = (HMFTimer *)v32;

    uint64_t v34 = [v18 copy];
    setupSessionIdentifier = v23->_setupSessionIdentifier;
    v23->_setupSessionIdentifier = (NSUUID *)v34;

    v23->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v23->_homeManager, v19);
    objc_storeWeak((id *)&v23->_radarInitiator, v21);
  }

  return v23;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t55_263117 != -1) {
    dispatch_once(&logCategory__hmf_once_t55_263117, &__block_literal_global_138_263118);
  }
  int v2 = (void *)logCategory__hmf_once_v56_263119;
  return v2;
}

void __48__HMDAccessorySetupMetricDispatcher_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v56_263119;
  logCategory__hmf_once_v56_263119 = v0;
}

@end