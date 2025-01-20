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
- (void)didReceiveEvent:(id)a3 topic:(id)a4;
- (void)markAccessoryAddCompleted;
- (void)markAccessoryRemoved;
- (void)markFirstSettingObserved;
- (void)markLanguageSettingObserved;
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
  uint64_t v18 = sub_1D5459878();
  uint64_t v46 = *(void *)(v18 - 8);
  uint64_t v47 = v18;
  MEMORY[0x1F4188790](v18);
  v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_1D5459BE8();
  uint64_t v44 = v21;
  v36 = (char *)sub_1D5459BE8();
  unint64_t v43 = v22;
  if (a12)
  {
    uint64_t v35 = sub_1D5459BE8();
    uint64_t v24 = v23;
  }
  else
  {
    uint64_t v35 = 0;
    uint64_t v24 = 0;
  }
  sub_1D5459858();
  id v25 = a3;
  id v26 = a4;
  id v27 = a7;
  id v34 = a11;
  id v28 = v39;
  id v29 = v39;
  v30 = v38;
  id v31 = sub_1D4A67924(v25, v26, v37, v44, v36, v43, v27, v45, v40, v41, a11, v35, v24, v28, (uint64_t)v20, v42);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v20, v47);
  return v31;
}

- (id)obtainDiscoveryAssertion
{
  v2 = (void *)_sSo17HMDSymptomManagerC19HomeKitDaemonLegacyE24obtainDiscoveryAssertionyXlyF_0();
  return v2;
}

- (void)releaseDiscoveryAssertionWithAssertionHandle:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  _sSo33HMDAccessorySetupMetricDispatcherC19HomeKitDaemonLegacyE25releaseDiscoveryAssertion15assertionHandleyyXl_tF_0();
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addAccessoryOnPrimaryFailError, 0);
  objc_storeStrong((id *)&self->_lastPrimaryClientConnectMessageFailError, 0);
  objc_storeStrong((id *)&self->_setupSessionIdentifier, 0);
  objc_storeStrong(&self->_discoveryAssertion, 0);
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
  return (NSError *)objc_getProperty(self, a2, 256, 1);
}

- (BOOL)didSendAddAccessoryRequestToPrimary
{
  return self->_didSendAddAccessoryRequestToPrimary;
}

- (NSError)lastPrimaryClientConnectMessageFailError
{
  return (NSError *)objc_getProperty(self, a2, 248, 1);
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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    objc_storeWeak((id *)&self->_home, a3);
    os_unfair_lock_lock_with_options();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
    self->_selectedHomeLocationStatus = [WeakRetained homeLocation];
    self->_isUserAtOtherOwnedHome = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = objc_loadWeakRetained((id *)&self->_homeManager);
    v6 = [v5 homes];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v10 homeLocation] == 1)
          {
            v11 = [v10 uuid];
            v12 = [WeakRetained uuid];
            if ([v11 isEqual:v12])
            {
            }
            else
            {
              int v13 = [v10 isOwnerUser];

              if (v13) {
                self->_isUserAtOtherOwnedHome = 1;
              }
            }
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (BOOL)submitted
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_submitted;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)markLanguageSettingObserved
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_languageSettingTime)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_languageSettingTime = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
    os_unfair_lock_unlock(p_lock);
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = self;
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      uint64_t v8 = [(HMDAccessorySetupMetricDispatcher *)v5 trackingInfo];
      v9 = [v8 accessoryUUID];
      int v10 = 138543618;
      v11 = v7;
      __int16 v12 = 2112;
      int v13 = v9;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Marked language setting observed (%@)", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)markFirstSettingObserved
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_firstSettingTime)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_firstSettingTime = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
    os_unfair_lock_unlock(p_lock);
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = self;
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      uint64_t v8 = [(HMDAccessorySetupMetricDispatcher *)v5 trackingInfo];
      v9 = [v8 accessoryUUID];
      int v14 = 138543618;
      long long v15 = v7;
      __int16 v16 = 2112;
      long long v17 = v9;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Marked first setting observed (%@)", (uint8_t *)&v14, 0x16u);
    }
    logger = v5->_logger;
    if (os_signpost_enabled(logger))
    {
      v11 = logger;
      __int16 v12 = [(HMDAccessorySetupMetricDispatcher *)v5 trackingInfo];
      int v13 = [v12 accessoryUUID];
      int v14 = 138412290;
      long long v15 = v13;
      _os_signpost_emit_with_name_impl(&dword_1D49D5000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FirstAccessorySettingObserved", "accessoryUUID=%{signpost.description:attribute}@ ", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)markAccessoryRemoved
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_accessoryRemovedTime = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
  os_unfair_lock_unlock(p_lock);
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    uint64_t v8 = [(HMDAccessorySetupMetricDispatcher *)v5 trackingInfo];
    v9 = [v8 accessoryUUID];
    int v11 = 138543618;
    __int16 v12 = v7;
    __int16 v13 = 2112;
    int v14 = v9;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@No longer tracking accessory (%@) setup time as it was removed", (uint8_t *)&v11, 0x16u);
  }
  int v10 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2029];
  -[HMDAccessorySetupMetricDispatcher _queryRemoteAndSubmitWithConfigurationError:]((uint64_t)v5, v10);
}

- (void)_queryRemoteAndSubmitWithConfigurationError:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = dispatch_group_create();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 136));
    v6 = [(id)a1 delegate];
    uint64_t v7 = [WeakRetained residentDeviceManager];
    uint64_t v8 = [v7 primaryResidentDevice];

    uint64_t v9 = [(id)a1 obtainDiscoveryAssertion];
    int v10 = *(void **)(a1 + 176);
    *(void *)(a1 + 176) = v9;

    int v11 = [WeakRetained appleMediaAccessories];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke;
    v28[3] = &unk_1E6A18D10;
    id v12 = v8;
    id v29 = v12;
    __int16 v13 = objc_msgSend(v11, "na_firstObjectPassingTest:", v28);

    dispatch_group_enter(v4);
    int v14 = [(id)a1 trackingInfo];
    uint64_t v15 = [v14 accessoryUUID];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke_2;
    v26[3] = &unk_1E6A18D38;
    v26[4] = a1;
    __int16 v16 = v4;
    id v27 = v16;
    [v6 querySetupDiagnosticStateForAccessoryUUID:v15 completion:v26];

    if (v13)
    {
      dispatch_group_enter(v16);
      long long v17 = [v13 uuid];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke_3;
      v24[3] = &unk_1E6A18D38;
      v24[4] = a1;
      id v25 = v16;
      [v6 querySetupDiagnosticStateForAccessoryUUID:v17 completion:v24];
    }
    else
    {
      uint64_t v19 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2032];
      objc_setProperty_atomic((id)a1, v20, v19, 168);
    }
    Property = objc_getProperty((id)a1, v18, 80, 1);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke_4;
    v22[3] = &unk_1E6A197C8;
    v22[4] = a1;
    id v23 = v3;
    dispatch_group_notify(v16, Property, v22);
  }
}

uint64_t __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 idsIdentifier];
  id v4 = [*(id *)(a1 + 32) device];
  id v5 = [v4 idsIdentifier];
  uint64_t v6 = [v3 isEqual:v5];

  return v6;
}

void __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id newValue = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
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
  uint64_t v7 = *(void **)(a1 + 32);
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
  uint64_t v160 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v151 = *(id *)(a1 + 40);
  if (!v1) {
    goto LABEL_66;
  }
  os_unfair_lock_lock_with_options();
  int v2 = *(unsigned __int8 *)(v1 + 24);
  *(unsigned char *)(v1 + 24) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 8));
  if (v2)
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = (id)v1;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v153 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Can't submit the metric twice", buf, 0xCu);
    }
    goto LABEL_66;
  }
  id v7 = [(id)v1 trackingInfo];
  uint64_t v8 = [(id)v1 primaryResidentIdenticalToAccessoryBeingAdded];
  if ([(id)v1 numberOfMediaAccessoriesnHome]) {
    v8 |= 2uLL;
  }
  if ([(id)v1 numberOfResidentsInHome]) {
    v8 |= 4uLL;
  }
  if ([(id)v1 numberOfAvailableResidentsInHome]) {
    v8 |= 8uLL;
  }
  if ([(id)v1 primaryResidentAssignedInHomeWhenAddAccessory]) {
    v8 |= 0x10uLL;
  }
  if ([(id)v1 didSendAddAccessoryRequestToPrimary]) {
    v8 |= 0x20uLL;
  }
  int v9 = [(id)v1 didAddAccessoryLocally];
  uint64_t v10 = v8 | 0x40;
  if (!v9) {
    uint64_t v10 = v8;
  }
  uint64_t v134 = v10;
  v142 = [HMDAppleMediaAccessorySetupLogEvent alloc];
  uint64_t v140 = [v7 role];
  uint64_t v138 = [v7 startTime];
  uint64_t v136 = [v7 endTime];
  uint64_t v132 = [(id)v1 addAccessoryFinishTime];
  uint64_t v130 = [(id)v1 accessoryRemovedTime];
  __uint64_t v128 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v144 = [v7 sessionError];
  v148 = [(id)v1 setupSessionIdentifier];
  v126 = [v148 UUIDString];
  char v124 = [(id)v1 isRepairSession];
  v146 = [v7 accessoryCategory];
  v122 = [v146 categoryType];
  id v11 = v7;
  id WeakRetained = objc_loadWeakRetained((id *)(v1 + 136));
  __int16 v13 = [v11 accessoryUUID];

  int v14 = [WeakRetained accessoryWithUUID:v13];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;

  long long v17 = [v16 softwareVersion];

  v120 = [v17 versionString];

  v119 = [v11 setupClientBundleID];
  id v118 = objc_loadWeakRetained((id *)(v1 + 112));
  uint64_t v117 = [v118 homepodSetupRetryCount];
  uint64_t v116 = [(id)v1 firstSettingTime];
  uint64_t v115 = [(id)v1 languageSettingTime];
  id v150 = v11;
  id v18 = objc_loadWeakRetained((id *)(v1 + 136));
  if (v18
    && ([v150 accessoryUUID], uint64_t v19 = objc_claimAutoreleasedReturnValue(), v19, v19))
  {
    SEL v20 = [v150 accessoryUUID];
    char v114 = [v18 defaultRoomContainsAccessoryWithUUID:v20];
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x1D9452090]();
    unint64_t v22 = (id *)(id)v1;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      id v25 = (id *)objc_loadWeakRetained(v22 + 17);
      id v26 = [v150 accessoryUUID];
      *(_DWORD *)buf = 138543874;
      v153 = v24;
      __int16 v154 = 2112;
      v155 = v25;
      __int16 v156 = 2112;
      v157 = v26;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Either home: %@ or accessory UUID: %@ is nil", buf, 0x20u);
    }
    char v114 = 0;
  }

  uint64_t v113 = [(id)v1 selectedHomeLocationStatus];
  char v112 = [(id)v1 isUserAtOtherOwnedHome];
  uint64_t v111 = [(id)v1 lastPrimaryResidentAvailableTime];
  int v27 = [(id)v1 numberOfTimesPrimaryResidentChanged];
  uint64_t v28 = [(id)v1 lastPrimaryClientConnectedTime];
  unsigned int v29 = [(id)v1 numberOfTimesPrimaryClientConnected];
  unsigned int v30 = [(id)v1 numberOfTimesPrimaryClientDisconnected];
  int v31 = [(id)v1 numberOfTimesPrimaryClientConnectMessageFailed];
  v32 = [(id)v1 lastPrimaryClientConnectMessageFailError];
  id v34 = objc_getProperty((id)v1, v33, 152, 1);
  id v36 = objc_getProperty((id)v1, v35, 168, 1);
  uint64_t v37 = [(id)v1 addAccessoryOnPrimaryFailError];
  LODWORD(v110) = v31;
  LODWORD(v109) = v27;
  LOBYTE(v108) = v112;
  LOBYTE(v107) = v114;
  LOBYTE(v105) = v124;
  v143 = -[HMDAppleMediaAccessorySetupLogEvent initWithRole:setupStartTime:setupEndTime:accessoryAddEndTime:accessoryRemoveTime:configurationEndTime:setupSessionError:setupSessionIdentifier:isRepairSession:category:accessorySoftwareVersion:setupClientBundleID:retryCount:firstSettingTime:languageSettingTime:accessoryInDefaultRoom:selectedHomeLocationStatus:isUserAtOtherOwnedHome:lastPrimaryResidentAvailableTime:numberOfTimesPrimaryResidentChanged:lastPrimaryClientConnectedTime:numberOfTimesPrimaryClientConnected:numberOfTimesPrimaryClientDisconnected:numberOfTimesPrimaryClientConnectMessageFailed:addAccessoryMessageReport:lastPrimaryClientConnectMessageFailError:accessoryDiagnosticInfoFetchError:primaryResidentDiagnosticInfoFetchError:addAccessoryOnPrimaryFailError:](v142, "initWithRole:setupStartTime:setupEndTime:accessoryAddEndTime:accessoryRemoveTime:configurationEndTime:setupSessionError:setupSessionIdentifier:isRepairSession:category:accessorySoftwareVersion:setupClientBundleID:retryCount:firstSettingTime:languageSettingTime:accessoryInDefaultRoom:selectedHomeLocationStatus:isUserAtOtherOwnedHome:lastPrimaryResidentAvailableTime:numberOfTimesPrimaryResidentChanged:lastPrimaryClientConnectedTime:numberOfTimesPrimaryClientConnected:numberOfTimesPrimaryClientDisconnected:numberOfTimesPrimaryClientConnectMessageFailed:addAccessoryMessageReport:lastPrimaryClientConnectMessageFailError:accessoryDiagnosticInfoFetchError:primaryResidentDiagnosticInfoFetchError:addAccessoryOnPrimaryFailError:", v140, v138, v136, v132, v130, v128 / 0x3B9ACA00, v144, v126, v105, v122, v120,
           v119,
           v117,
           v116,
           v115,
           v107,
           v113,
           v108,
           v111,
           v109,
           v28,
           __PAIR64__(v30, v29),
           v110,
           v134,
           v32,
           v34,
           v36,
           v37);

  id v147 = objc_loadWeakRetained((id *)(v1 + 96));
  v38 = (void *)MEMORY[0x1D9452090]();
  id v39 = (id)v1;
  v40 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    uint64_t v41 = HMFGetLogIdentifier();
    BOOL v42 = [v150 accessoryUUID];
    unint64_t v43 = [(HMDAppleMediaAccessorySetupLogEvent *)v143 coreAnalyticsEventDictionary];
    *(_DWORD *)buf = 138544130;
    v153 = v41;
    __int16 v154 = 2112;
    v155 = v42;
    __int16 v156 = 2112;
    v157 = v43;
    __int16 v158 = 2112;
    id v159 = v151;
    _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_INFO, "%{public}@Submitting accessory (%@) setup log event:%@ with error:%@", buf, 0x2Au);
  }
  [v147 submitLogEvent:v143 error:v151];
  id v149 = objc_loadWeakRetained((id *)v39 + 17);
  uint64_t v44 = [v149 currentDevice];
  int v45 = [v44 idsIdentifier];
  v145 = [v45 UUIDString];

  uint64_t v46 = [v149 residentDeviceManager];
  v139 = [v46 primaryResidentDevice];

  if (!v145)
  {
    v48 = (void *)MEMORY[0x1D9452090]();
    id v49 = v39;
    v50 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v51 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v153 = v51;
      _os_log_impl(&dword_1D49D5000, v50, OS_LOG_TYPE_ERROR, "%{public}@Could not get idsIdentifier of current device", buf, 0xCu);
    }
    v145 = @"Unknown";
  }
  id v141 = objc_getProperty(v39, v47, 120, 1);
  id v53 = objc_getProperty(v39, v52, 128, 1);
  v137 = v53;
  if (v149 && v141 && v53)
  {
    v54 = +[HMDMainDriver driver];
    v135 = [v54 currentWiFiNetworkRSSI];

    if (v135) {
      unsigned int v121 = [v135 intValue];
    }
    else {
      unsigned int v121 = 0;
    }
    v133 = [v39 setupSessionIdentifier];
    v125 = [v133 UUIDString];
    v131 = +[HMDMainDriver driver];
    v123 = [v131 currentWiFiNetworkInfo];
    v129 = [v149 residentDeviceManager];
    v127 = [v129 residentDevices];
    uint64_t v59 = [v127 count];
    v60 = [v149 appleMediaAccessories];
    uint64_t v61 = [v60 count];
    id v63 = objc_getProperty(v39, v62, 144, 1);
    v64 = [v139 device];
    v65 = [v64 idsIdentifier];
    v66 = [v65 UUIDString];
    id v68 = objc_getProperty(v39, v67, 160, 1);
    v69 = [v149 uuid];
    LOBYTE(v106) = objc_msgSend(objc_getProperty(v39, v70, 168, 1), "code") == 2032;
    v71 = [v39 networkMetricWithDiscoveryController:v141 networkInfoController:v137 sessionID:v125 idsIdentifierString:v145 currentWiFiInfo:v123 currentWiFiNetworkRSSI:v121 numResidents:v59 numAppleMediaAccessories:v61 accessoryDiagnosticInfo:v63 primaryResidentIdsIdentifierString:v66 primaryResidentDiagnosticInfo:v68 homeUUID:v69 primaryResidentDiagnosticInfoFetched:v106];

    [v147 submitLogEvent:v71 error:v151];
  }
  else
  {
    v55 = (void *)MEMORY[0x1D9452090]();
    id v56 = v39;
    v57 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      v58 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v153 = v58;
      _os_log_impl(&dword_1D49D5000, v57, OS_LOG_TYPE_ERROR, "%{public}@Did not find valid controllers to get network information", buf, 0xCu);
    }
  }
  [v39 releaseDiscoveryAssertionWithAssertionHandle:*((void *)v39 + 22)];
  objc_storeStrong((id *)v39 + 22, 0);
  v72 = [v150 accessoryCategory];
  v73 = [v72 categoryType];
  int v74 = [v73 isEqualToString:*MEMORY[0x1E4F2C1D0]];

  id v75 = objc_loadWeakRetained((id *)v39 + 14);
  v76 = v75;
  if (v74)
  {
    objc_msgSend(v75, "setHomepodSetupRetryCount:", objc_msgSend(v75, "homepodSetupRetryCount") + 1);
    if (objc_msgSend(objc_getProperty(v39, v77, 144, 1), "hasLastSetupInfo"))
    {
      v79 = objc_msgSend(objc_getProperty(v39, v78, 144, 1), "lastSetupInfo");
      id v80 = +[HMDCurrentAccessorySetupMetricDispatcher homepodSetupLogEventFromProtoSetupInfo:v79];

      if (v80)
      {
        v81 = [v39 setupSessionIdentifier];
        v82 = [v81 UUIDString];
        [v80 setSetupSessionIdentifier:v82];
      }
      v83 = (void *)MEMORY[0x1D9452090]([v147 submitLogEvent:v80]);
      id v84 = v39;
      v85 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        v86 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v153 = v86;
        _os_log_impl(&dword_1D49D5000, v85, OS_LOG_TYPE_DEFAULT, "%{public}@Submitted retrieved homepod log event.", buf, 0xCu);
      }
    }
    else
    {
      if (!objc_getProperty(v39, v78, 152, 1))
      {
        v91 = (void *)MEMORY[0x1D9452090]();
        id v92 = v39;
        v93 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
        {
          v94 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v153 = v94;
          _os_log_impl(&dword_1D49D5000, v93, OS_LOG_TYPE_ERROR, "%{public}@No homepod setup log event found.", buf, 0xCu);
        }
        goto LABEL_57;
      }
      id v80 = [[HMDHomePodSetupLatencyLogEvent alloc] initLogEventWithInitialState:0x10000];
      objc_msgSend(v80, "setError:", objc_getProperty(v39, v87, 152, 1));
      v88 = [v39 setupSessionIdentifier];
      v89 = [v88 UUIDString];
      [v80 setSetupSessionIdentifier:v89];

      v83 = (void *)MEMORY[0x1D9452090]([v147 submitLogEvent:v80]);
      id v84 = v39;
      v85 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        v90 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v153 = v90;
        _os_log_impl(&dword_1D49D5000, v85, OS_LOG_TYPE_DEFAULT, "%{public}@Submitted homepod log event with fetch error.", buf, 0xCu);
      }
    }
  }
LABEL_57:
  if (!v151)
  {
    v95 = [v150 sessionError];
    int v96 = v95 ? 0 : v74;

    if (v96) {
      [v76 setHomepodSetupRetryCount:0];
    }
  }
  os_unfair_lock_lock_with_options();
  [*((id *)v39 + 11) suspend];
  v97 = (void *)*((void *)v39 + 11);
  *((void *)v39 + 11) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)v39 + 2);
  v98 = (void *)MEMORY[0x1D9452090]();
  v99 = (id *)v39;
  v100 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
  {
    v101 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v153 = v101;
    __int16 v154 = 2112;
    v155 = v99;
    _os_log_impl(&dword_1D49D5000, v100, OS_LOG_TYPE_INFO, "%{public}@Removing setup metric dispatcher:%@", buf, 0x16u);
  }
  id v102 = objc_loadWeakRetained(v99 + 14);
  v103 = [v99 trackingInfo];
  v104 = [v103 accessoryUUID];
  [v102 removeAccessorySetupMetricDispatcherForAccessoryUUID:v104];

LABEL_66:
}

- (void)markAccessoryAddCompleted
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_addAccessoryFinishTime = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
  os_unfair_lock_unlock(p_lock);
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = [(HMDAccessorySetupMetricDispatcher *)v5 trackingInfo];
    int v9 = [v8 accessoryUUID];
    int v10 = 138543618;
    id v11 = v7;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Marked accessory add (%@)", (uint8_t *)&v10, 0x16u);
  }
}

- (void)markRepairSessionComplete
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_isRepairSession = 1;
  os_unfair_lock_unlock(p_lock);
}

- (void)submit
{
}

- (void)timerDidFire:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = (HMDAccessorySetupMetricDispatcher *)a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 88, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = (HMDAccessorySetupMetricDispatcher *)Property;
  if (v5 != 0 && v7 == v5) {
    int v9 = v5;
  }
  else {
    int v9 = v7;
  }
  if (v5 == 0 || v7 != v5 || self == 0)
  {
  }
  else
  {
    id v11 = objc_getProperty(self, v8, 88, 1);

    if (v11)
    {
      __int16 v12 = (void *)MEMORY[0x1D9452090]();
      __int16 v13 = self;
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v26 = v15;
        __int16 v27 = 2112;
        uint64_t v28 = v13;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Timer did fire for setup metric dispatcher:%@", buf, 0x16u);
      }
      if ([(HMDAccessorySetupMetricDispatcher *)v13 languageSettingTime])
      {
        [(HMDAccessorySetupMetricDispatcher *)v13 submit];
      }
      else
      {
        unint64_t v22 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2030];
        -[HMDAccessorySetupMetricDispatcher _queryRemoteAndSubmitWithConfigurationError:]((uint64_t)v13, v22);
        id WeakRetained = objc_loadWeakRetained((id *)&v13->_radarInitiator);
        uint64_t v24 = [NSString stringWithFormat:@"%@, %@", @"HomePod Database Sync Timed Out", v22];
        [WeakRetained requestRadarWithDisplayReason:@"HomePod Database Sync Timed Out" radarTitle:v24 componentName:@"HomeKit" componentVersion:@"HomeKit Device Setup" componentID:1364036];
      }
      goto LABEL_22;
    }
  }
  id v16 = (void *)MEMORY[0x1D9452090]();
  long long v17 = self;
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    SEL v20 = HMFGetLogIdentifier();
    if (self) {
      id v21 = objc_getProperty(v17, v19, 88, 1);
    }
    else {
      id v21 = 0;
    }
    *(_DWORD *)buf = 138543874;
    id v26 = v20;
    __int16 v27 = 2112;
    uint64_t v28 = v5;
    __int16 v29 = 2112;
    id v30 = v21;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unexpected delegate callback from timer:%@, expected:%@", buf, 0x20u);
  }
LABEL_22:
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F2E7A0] decodeTopic:v7];
  int v9 = [v8 asAccessorySettingTopic];

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
    __int16 v12 = [MEMORY[0x1E4F2E858] decodeSettingFromEvent:v10 error:&v33];
    id v13 = v33;
    if (!v12)
    {
      id v24 = v11;
      id v25 = (void *)MEMORY[0x1D9452090]();
      id v26 = self;
      __int16 v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        uint64_t v28 = v32 = v13;
        *(_DWORD *)buf = 138543874;
        SEL v35 = v28;
        __int16 v36 = 2112;
        id v37 = v10;
        __int16 v38 = 2112;
        id v39 = v24;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Nil settings value for settings update event: %@ topic: %@", buf, 0x20u);

        id v13 = v32;
      }

      id v11 = v24;
      goto LABEL_18;
    }
    if ([(HMDAccessorySetupMetricDispatcher *)self submitted])
    {
      id v31 = v11;
      uint64_t v14 = (void *)MEMORY[0x1D9452090]();
      uint64_t v15 = self;
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v18 = v17 = v13;
        *(_DWORD *)buf = 138543362;
        SEL v35 = v18;
        uint64_t v19 = "%{public}@Setup metric already submitted, will unsubscribe from settings events";
LABEL_16:
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, v19, buf, 0xCu);

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
      uint64_t v14 = (void *)MEMORY[0x1D9452090]([(HMDAccessorySetupMetricDispatcher *)self submit]);
      uint64_t v15 = self;
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        SEL v35 = v18;
        uint64_t v19 = "%{public}@Setup metric submitted, will unsubscribe from settings events";
        goto LABEL_16;
      }
    }

    -[HMDAccessorySetupMetricDispatcher subscribeToSettingsEvents:]((id *)&v15->super.super.isa);
    id v11 = v31;
    goto LABEL_18;
  }
  SEL v20 = (void *)MEMORY[0x1D9452090]();
  id v21 = self;
  unint64_t v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    SEL v35 = v23;
    __int16 v36 = 2112;
    id v37 = v7;
    _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Do not handle topic: %@", buf, 0x16u);
  }
LABEL_20:
}

- (void)subscribeToSettingsEvents:(id *)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 17);
  id v3 = [WeakRetained uuid];

  if (v3)
  {
    id v4 = [a1 trackingInfo];
    id v5 = [v4 accessoryUUID];

    if (v5)
    {
      id v6 = [MEMORY[0x1E4F2E5F8] defaultSettingsAllKeyPaths];
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      int v30 = __60__HMDAccessorySetupMetricDispatcher_accessorySettingsTopics__block_invoke;
      id v31 = &unk_1E6A18CE0;
      id v7 = v3;
      id v32 = v7;
      id v8 = v5;
      id v33 = v8;
      int v9 = objc_msgSend(v6, "na_map:", &buf);

      id v10 = [MEMORY[0x1E4F2E5F8] languageKeyPaths];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __60__HMDAccessorySetupMetricDispatcher_accessorySettingsTopics__block_invoke_2;
      v26[3] = &unk_1E6A18CE0;
      id v27 = v7;
      id v28 = v8;
      id v11 = objc_msgSend(v10, "na_map:", v26);
      __int16 v12 = [v11 arrayByAddingObjectsFromArray:v9];
    }
    else
    {
      __int16 v12 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    __int16 v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  if ([v12 count])
  {
    id v13 = v12;
    uint64_t v14 = (void *)MEMORY[0x1D9452090]();
    uint64_t v15 = a1;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing to accessory settings to generate setup time metric", (uint8_t *)&buf, 0xCu);
    }
    id v18 = objc_loadWeakRetained(v15 + 14);
    uint64_t v19 = [v18 localAndRemoteSubscriptionProvider];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __63__HMDAccessorySetupMetricDispatcher_subscribeToSettingsEvents___block_invoke;
    v25[3] = &unk_1E6A18CB8;
    v25[4] = v15;
    SEL v20 = (void *)MEMORY[0x1E4F1CBF0];
    [v19 changeRegistrationsForConsumer:v15 topicFilterAdditions:MEMORY[0x1E4F1CBF0] topicFilterRemovals:v13 completion:v25];
  }
  else
  {
    id v21 = (void *)MEMORY[0x1D9452090]();
    unint64_t v22 = a1;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@No settings topics", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __63__HMDAccessorySetupMetricDispatcher_subscribeToSettingsEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  int v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    __int16 v38 = v11;
    __int16 v39 = 2112;
    id v40 = v6;
    __int16 v12 = "%{public}@Subscription to settings resulted in error: %@";
    id v13 = v10;
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
    __int16 v38 = v11;
    __int16 v12 = "%{public}@Subscription to settings topics was successful";
    id v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 12;
  }
  _os_log_impl(&dword_1D49D5000, v13, v14, v12, buf, v15);

LABEL_7:
  int v30 = v6;

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
        id v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        unint64_t v22 = [v16 objectForKeyedSubscript:v21];
        id v23 = (void *)MEMORY[0x1D9452090]();
        id v24 = *(id *)(a1 + 32);
        id v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          uint64_t v26 = v18;
          uint64_t v27 = a1;
          v29 = uint64_t v28 = v19;
          *(_DWORD *)long long buf = 138543618;
          __int16 v38 = v29;
          __int16 v39 = 2112;
          id v40 = v21;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Received cached event on settings topic: %@ during subscription", buf, 0x16u);

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

- (HMDDeviceSetupTrackingInfo)trackingInfo
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_trackingInfo;
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

- (HMDAccessorySetupMetricDispatcher)initWithQueue:(id)a3 trackingInfo:(id)a4 setupSessionIdentifier:(id)a5 homeManager:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  unint64_t v22 = +[HMDMainDriver driver];
  SEL v20 = [v22 discoveryController];
  id v13 = +[HMDMainDriver driver];
  os_log_type_t v14 = [v13 networkInfoController];
  uint32_t v15 = +[HMDMetricsManager sharedLogEventSubmitter];
  id v16 = [v9 metricsManager];
  uint64_t v17 = [v16 radarInitiator];
  uint64_t v18 = [(HMDAccessorySetupMetricDispatcher *)self initWithQueue:v12 discoveryController:v20 networkInfoController:v14 trackingInfo:v11 setupSessionIdentifier:v10 homeManager:v9 logEventSubmitter:v15 radarInitiator:v17 timerFactory:&__block_literal_global_185143];

  return v18;
}

id __99__HMDAccessorySetupMetricDispatcher_initWithQueue_trackingInfo_setupSessionIdentifier_homeManager___block_invoke(uint64_t a1, void *a2)
{
  int v2 = (objc_class *)MEMORY[0x1E4F65580];
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
  if (logCategory__hmf_once_t40_185153 != -1) {
    dispatch_once(&logCategory__hmf_once_t40_185153, &__block_literal_global_130_185154);
  }
  int v2 = (void *)logCategory__hmf_once_v41_185155;
  return v2;
}

uint64_t __48__HMDAccessorySetupMetricDispatcher_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v41_185155;
  logCategory__hmf_once_v41_185155 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end