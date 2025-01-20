@interface HMDResidentDeviceManagerRoar
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)_updatePrimaryResidentGenerationID:(id)a3;
- (BOOL)allowExternalUpdateOfPrimaryResidentTo:(id)a3;
- (BOOL)hasActivePrimaryResidentTransaction;
- (BOOL)hasAnyResident;
- (BOOL)hasTrustZoneCapableResident;
- (BOOL)homeSupportsResidentSelection;
- (BOOL)isActingAsResident;
- (BOOL)isCurrentDeviceAvailableResident;
- (BOOL)isCurrentDevicePrimaryResident;
- (BOOL)isOwnerUser;
- (BOOL)isResidentAvailable;
- (BOOL)isResidentElectionV2Enabled;
- (BOOL)isResidentEnabled;
- (BOOL)isResidentSupported;
- (BOOL)residentCapable;
- (HMDAppleAccountManager)appleAccountManager;
- (HMDDevice)confirmedPrimaryResidentDevice;
- (HMDFeaturesDataSource)featuresDataSource;
- (HMDHome)home;
- (HMDMessageDispatcher)messageDispatcher;
- (HMDModernTransportDeviceReachabilityObserver)reachabilityObserver;
- (HMDPreferredResidentsList)electorsPreferredResidentsList;
- (HMDPrimaryElectionCoordinationAddOn)localNetworkElection;
- (HMDPrimaryResidentDiscoveryManager)primaryDiscoveryManager;
- (HMDRemoteDeviceMonitor)deviceMonitor;
- (HMDResidentDevice)primaryResidentDevice;
- (HMDResidentDevice)userSelectedPreferredResident;
- (HMDResidentDeviceManagerDelegate)delegate;
- (HMDResidentDeviceManagerRoar)init;
- (HMDResidentDeviceManagerRoar)initWithDataSource:(id)a3;
- (HMDResidentDeviceManagerRoarBackingStore)backingStore;
- (HMDResidentDeviceManagerRoarDataSource)dataSource;
- (HMDResidentSelectionInfo)residentSelectionInfo;
- (HMDResidentSelectionStatusKit)presentResidentsStatuses;
- (HMDResidentStatusChannel)residentStatusChannel;
- (HMFFuture)cloudReady;
- (HMFFuture)firstPrimaryResidentDiscoveryAttemptCompletionFuture;
- (HMFPromise)firstPrimaryResidentDiscoveryAttemptCompletionPromise;
- (NSArray)autoSelectedPreferredResidents;
- (NSArray)residentDevices;
- (NSArray)residentsPresentOnStatusKit;
- (NSDate)primaryResidentSelectionTimestamp;
- (NSHashTable)primaryDiscoveryRequesters;
- (NSNotificationCenter)notificationCenter;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)logIdentifier;
- (NSUUID)messageTargetUUID;
- (NSUUID)primaryResidentGenerationID;
- (NSUUID)primaryResidentUUID;
- (OS_dispatch_queue)messageReceiveQueue;
- (OS_dispatch_queue)queue;
- (double)blockPrimaryTakeoverDuration;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)dumpState;
- (id)foundNewPrimaryResident:(id)a3 generationID:(id)a4 selectionTimestamp:(id)a5 changeSource:(unint64_t)a6;
- (id)localPreferredResidentList;
- (id)ourSelf;
- (id)residentDeviceForDevice:(id)a3;
- (id)residentDeviceWithIDSIdentifier:(id)a3;
- (id)residentDevicesSet;
- (id)residentDevicesWithIDSIdentifiers:(id)a3;
- (id)residentWithUUID:(id)a3;
- (id)shortDescription;
- (int64_t)atHomeLevel;
- (unint64_t)myLocation;
- (unint64_t)ourNetworkConnectionType;
- (unint64_t)residentSelectionMode;
- (void)_addResidentDevice:(id)a3;
- (void)_checkPrimaryResidentDeviceRemoved:(id)a3 currentPrimary:(id)a4;
- (void)_configureResidentSupported;
- (void)_discoverPrimaryResidentForRequester:(id)a3;
- (void)_handleCloudResidentChange:(id)a3;
- (void)_handleCloudZoneReadyNotification:(id)a3;
- (void)_handlePrimaryResident:(id)a3 isReachable:(BOOL)a4;
- (void)_handlePrimaryResidentDiscoveryRequest:(id)a3;
- (void)_handlePrimaryResidentDiscoveryXPCRequest:(id)a3;
- (void)_handleReachabilityAfterPrimaryResidentChangedTo:(id)a3 previousPrimaryResident:(id)a4;
- (void)_handleRemoteDeviceIsNotReachable:(id)a3;
- (void)_handleRemoteDeviceIsReachable:(id)a3;
- (void)_handleResidentDeviceUpdateEnabled:(id)a3;
- (void)_handleResidentSelectionVersionDidChange:(id)a3;
- (void)_handleUpdatedPrimaryFromLeader:(id)a3;
- (void)_handleUpdatedPrimaryResidentDevice:(id)a3 previousPrimaryResident:(id)a4 generationID:(id)a5 changeSource:(unint64_t)a6;
- (void)_joinLocalMesh;
- (void)_notifyUpdatedGenerationIDWithPrimaryResident:(id)a3;
- (void)_registerForMessages;
- (void)_registerForNotifications;
- (void)_removeResidentDevice:(id)a3;
- (void)_run;
- (void)_sendResidentDeviceNotificationWithName:(id)a3 forResidentDevice:(id)a4;
- (void)_setResident:(id)a3 reachableOverIDS:(BOOL)a4 andNotify:(BOOL)a5;
- (void)_setupSessionWithPrimaryResidentDevice;
- (void)_startLocalNetworkElection;
- (void)_stopLocalNetworkElection;
- (void)_teardownSessionWithPrimaryResidentDevice;
- (void)_updatePrimaryResidentTransactionWithPrimaryResidentDevice:(id)a3;
- (void)_updateReachability:(BOOL)a3 forResidentDevice:(id)a4;
- (void)_updateReachability:(BOOL)a3 forResidentDevices:(id)a4;
- (void)_updateReachabilityFromWorkingStoreExceptResident:(id)a3;
- (void)_updateResidentAvailability:(BOOL)a3;
- (void)_updateResidentIDSReachability:(BOOL)a3 withUpdatedDevice:(id)a4;
- (void)_updateResidentReachabilityWithResidents:(id)a3;
- (void)accountOrDeviceDidUpdate:(id)a3;
- (void)addDataSource:(id)a3;
- (void)atHomeLevelChanged:(int64_t)a3;
- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4;
- (void)confirmAsResident;
- (void)confirmOnAvailability;
- (void)confirmWithCompletionHandler:(id)a3;
- (void)discoverPrimaryResidentForRequester:(id)a3;
- (void)discoveryManager:(id)a3 didCompleteDiscoveryWithPrimaryResidentDevice:(id)a4 primaryResidentGenerationID:(id)a5 error:(id)a6;
- (void)discoveryManager:(id)a3 didCompleteInitialDiscoveryAttemptWithError:(id)a4;
- (void)discoveryManager:(id)a3 didNotCompleteDiscoveryWithError:(id)a4;
- (void)electResidentDevice:(unint64_t)a3;
- (void)handleCurrentDeviceChanged:(id)a3;
- (void)handlePrimaryResidentDiscovered:(id)a3 primaryResidentGenerationID:(id)a4;
- (void)invalidate;
- (void)modernTransportDeviceReachabilityObserverDidUpdate:(id)a3 isReachable:(BOOL)a4;
- (void)notifyClientsOfUpdatedResidentDevice:(id)a3;
- (void)notifyResidentAvailable:(BOOL)a3;
- (void)notifyUpdatedPrimaryResident:(id)a3 previousPrimaryResident:(id)a4;
- (void)primaryElectionAddOn:(id)a3 didElectPrimaryResident:(id)a4 confirmed:(BOOL)a5 electionLogEvent:(id)a6;
- (void)primaryElectionAddOn:(id)a3 didFailToElectWithError:(id)a4;
- (void)primaryElectionAddOn:(id)a3 didReceivePrimaryResidentUUIDFromLeader:(id)a4;
- (void)primaryElectionAddOn:(id)a3 didUpdateActiveNodes:(id)a4;
- (void)primaryElectionAddOn:(id)a3 didUpdateResidentDevice:(id)a4;
- (void)removeResidentDevice:(id)a3;
- (void)run;
- (void)sawGenerationID:(id)a3 forDevice:(id)a4;
- (void)setActingAsResident:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceMonitor:(id)a3;
- (void)setFirstPrimaryResidentDiscoveryAttemptCompletionPromise:(id)a3;
- (void)setHome:(id)a3;
- (void)setLocalNetworkElection:(id)a3;
- (void)setReachabilityObserver:(id)a3;
- (void)setResidentAvailable:(BOOL)a3;
- (void)setResidentSupported:(BOOL)a3;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)updatePrimaryResidentWithUUID:(id)a3 actions:(id)a4;
- (void)updateResidentAvailability;
@end

@implementation HMDResidentDeviceManagerRoar

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_firstPrimaryResidentDiscoveryAttemptCompletionPromise, 0);
  objc_storeStrong((id *)&self->_primaryDiscoveryRequesters, 0);
  objc_storeStrong((id *)&self->_primaryDiscoveryManager, 0);
  objc_storeStrong((id *)&self->_deviceMonitor, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_residentStatusChannel, 0);
  objc_storeStrong((id *)&self->_residentsPresentOnStatusKit, 0);
  objc_storeStrong((id *)&self->_autoSelectedPreferredResidents, 0);
  objc_storeStrong((id *)&self->_userSelectedPreferredResident, 0);
  objc_storeStrong((id *)&self->_primaryResidentSelectionTimestamp, 0);
  objc_storeStrong((id *)&self->_appleAccountManager, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_firstPrimaryResidentDiscoveryAttemptCompletionFuture, 0);
  objc_storeStrong((id *)&self->_primaryResidentGenerationID, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
  objc_storeStrong((id *)&self->_localNetworkElection, 0);
  objc_storeStrong((id *)&self->_reachabilityObserver, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_primaryResidentUUID, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_primaryResidentTransaction, 0);
  objc_storeStrong((id *)&self->_residentDevices, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 264, 1);
}

- (void)setFirstPrimaryResidentDiscoveryAttemptCompletionPromise:(id)a3
{
}

- (HMFPromise)firstPrimaryResidentDiscoveryAttemptCompletionPromise
{
  return (HMFPromise *)objc_getProperty(self, a2, 256, 1);
}

- (NSHashTable)primaryDiscoveryRequesters
{
  return self->_primaryDiscoveryRequesters;
}

- (HMDPrimaryResidentDiscoveryManager)primaryDiscoveryManager
{
  return (HMDPrimaryResidentDiscoveryManager *)objc_getProperty(self, a2, 240, 1);
}

- (void)setDeviceMonitor:(id)a3
{
}

- (HMDRemoteDeviceMonitor)deviceMonitor
{
  return (HMDRemoteDeviceMonitor *)objc_getProperty(self, a2, 232, 1);
}

- (HMDResidentDeviceManagerRoarBackingStore)backingStore
{
  return (HMDResidentDeviceManagerRoarBackingStore *)objc_getProperty(self, a2, 224, 1);
}

- (HMDResidentDeviceManagerRoarDataSource)dataSource
{
  return (HMDResidentDeviceManagerRoarDataSource *)objc_getProperty(self, a2, 216, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 208, 1);
}

- (unint64_t)ourNetworkConnectionType
{
  return self->ourNetworkConnectionType;
}

- (unint64_t)myLocation
{
  return self->myLocation;
}

- (double)blockPrimaryTakeoverDuration
{
  return self->_blockPrimaryTakeoverDuration;
}

- (unint64_t)residentSelectionMode
{
  return self->_residentSelectionMode;
}

- (HMDResidentStatusChannel)residentStatusChannel
{
  return (HMDResidentStatusChannel *)objc_getProperty(self, a2, 168, 1);
}

- (NSArray)residentsPresentOnStatusKit
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (NSArray)autoSelectedPreferredResidents
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (HMDResidentDevice)userSelectedPreferredResident
{
  return (HMDResidentDevice *)objc_getProperty(self, a2, 144, 1);
}

- (BOOL)homeSupportsResidentSelection
{
  return self->_homeSupportsResidentSelection;
}

- (NSDate)primaryResidentSelectionTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (HMDAppleAccountManager)appleAccountManager
{
  return (HMDAppleAccountManager *)objc_getProperty(self, a2, 128, 1);
}

- (BOOL)residentCapable
{
  return self->_residentCapable;
}

- (void)setDelegate:(id)a3
{
}

- (HMDResidentDeviceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (HMDResidentDeviceManagerDelegate *)WeakRetained;
}

- (HMFFuture)firstPrimaryResidentDiscoveryAttemptCompletionFuture
{
  return (HMFFuture *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLocalNetworkElection:(id)a3
{
}

- (HMDPrimaryElectionCoordinationAddOn)localNetworkElection
{
  return (HMDPrimaryElectionCoordinationAddOn *)objc_getProperty(self, a2, 80, 1);
}

- (void)setActingAsResident:(BOOL)a3
{
  self->_actingAsResident = a3;
}

- (BOOL)isActingAsResident
{
  return self->_actingAsResident;
}

- (void)setReachabilityObserver:(id)a3
{
}

- (HMDModernTransportDeviceReachabilityObserver)reachabilityObserver
{
  return (HMDModernTransportDeviceReachabilityObserver *)objc_getProperty(self, a2, 72, 1);
}

- (HMDMessageDispatcher)messageDispatcher
{
  return (HMDMessageDispatcher *)objc_getProperty(self, a2, 64, 1);
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)MEMORY[0x230FBD990]();
  v13 = self;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = HMFGetLogIdentifier();
    v16 = NSStringFromSelector(a2);
    int v17 = 138543618;
    v18 = v15;
    __int16 v19 = 2112;
    v20 = v16;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", (uint8_t *)&v17, 0x16u);
  }
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = HMFGetLogIdentifier();
    v13 = NSStringFromSelector(a2);
    int v14 = 138543618;
    v15 = v12;
    __int16 v16 = 2112;
    int v17 = v13;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", (uint8_t *)&v14, 0x16u);
  }
}

- (void)primaryElectionAddOn:(id)a3 didReceivePrimaryResidentUUIDFromLeader:(id)a4
{
  id v6 = a4;
  v5 = [(HMDResidentDeviceManagerRoar *)self queue];
  dispatch_assert_queue_V2(v5);

  [(HMDResidentDeviceManagerRoar *)self _handleUpdatedPrimaryFromLeader:v6];
}

- (void)primaryElectionAddOn:(id)a3 didFailToElectWithError:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDResidentDeviceManagerRoar *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = HMFGetLogIdentifier();
    int v13 = 138543874;
    int v14 = v12;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Election %@ failed: %@", (uint8_t *)&v13, 0x20u);
  }
}

- (void)primaryElectionAddOn:(id)a3 didUpdateActiveNodes:(id)a4
{
  id v6 = a4;
  v5 = [(HMDResidentDeviceManagerRoar *)self queue];
  dispatch_assert_queue_V2(v5);

  [(HMDResidentDeviceManagerRoar *)self _updateResidentReachabilityWithResidents:v6];
}

- (void)primaryElectionAddOn:(id)a3 didUpdateResidentDevice:(id)a4
{
  id v8 = a4;
  v5 = [(HMDResidentDeviceManagerRoar *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDResidentDeviceManagerRoar *)self residentDevices];
  char v7 = [v6 containsObject:v8];

  if ((v7 & 1) == 0) {
    [(HMDResidentDeviceManagerRoar *)self _addResidentDevice:v8];
  }
  [(HMDResidentDeviceManagerRoar *)self notifyClientsOfUpdatedResidentDevice:v8];
}

- (void)primaryElectionAddOn:(id)a3 didElectPrimaryResident:(id)a4 confirmed:(BOOL)a5 electionLogEvent:(id)a6
{
  id v10 = a4;
  char v7 = [(HMDResidentDeviceManagerRoar *)self queue];
  dispatch_assert_queue_V2(v7);

  if ([v10 isCurrentDevice]) {
    [MEMORY[0x263F08C38] UUID];
  }
  else {
  id v8 = [(HMDResidentDeviceManagerRoar *)self primaryResidentGenerationID];
  }
  id v9 = [(HMDResidentDeviceManagerRoar *)self primaryResidentDevice];
  [(HMDResidentDeviceManagerRoar *)self _handleUpdatedPrimaryResidentDevice:v10 previousPrimaryResident:v9 generationID:v8 changeSource:1];
}

- (void)_handleUpdatedPrimaryFromLeader:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDResidentDeviceManagerRoar *)self primaryResidentUUID];
  char v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    char v7 = [(HMDResidentDeviceManagerRoar *)self residentWithUUID:v4];
    id v8 = [(HMDResidentDeviceManagerRoar *)self primaryResidentDevice];
    int v9 = [v7 isCurrentDevice];
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    v12 = HMFGetOSLogHandle();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v13)
      {
        int v14 = HMFGetLogIdentifier();
        int v19 = 138543362;
        v20 = v14;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Leader notified that we are the primary. Becoming the primary resident.", (uint8_t *)&v19, 0xCu);
      }
      __int16 v15 = [MEMORY[0x263F08C38] UUID];
      [(HMDResidentDeviceManagerRoar *)v11 _handleUpdatedPrimaryResidentDevice:v7 previousPrimaryResident:v8 generationID:v15 changeSource:2];
    }
    else
    {
      if (v13)
      {
        id v16 = HMFGetLogIdentifier();
        __int16 v17 = [v7 shortDescription];
        id v18 = [v8 shortDescription];
        int v19 = 138543874;
        v20 = v16;
        __int16 v21 = 2114;
        v22 = v17;
        __int16 v23 = 2114;
        v24 = v18;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Leader notified a new primary resident in the ping notification: %{public}@. Current Primary: %{public}@. Kicking off a primary resident discovery", (uint8_t *)&v19, 0x20u);
      }
      [(HMDResidentDeviceManagerRoar *)v11 _discoverPrimaryResidentForRequester:0];
    }
  }
}

- (void)_updateResidentReachabilityWithResidents:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(HMDResidentDeviceManagerRoar *)self isCurrentDeviceConfirmedPrimaryResident])
  {
    v5 = (void *)MEMORY[0x230FBD990]();
    char v6 = self;
    char v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v15 = v8;
      __int16 v16 = 2114;
      id v17 = v4;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Processing resident reachability update: %{public}@", buf, 0x16u);
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __73__HMDResidentDeviceManagerRoar__updateResidentReachabilityWithResidents___block_invoke;
    v13[3] = &unk_264A2A788;
    v13[4] = v6;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);
    int v9 = [(HMDResidentDeviceManagerRoar *)v6 residentDevicesSet];
    id v10 = objc_msgSend(v9, "hmf_removedObjectsFromSet:", v4);

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __73__HMDResidentDeviceManagerRoar__updateResidentReachabilityWithResidents___block_invoke_2;
    v12[3] = &unk_264A2A788;
    v12[4] = v6;
    objc_msgSend(v10, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v12);
    id v11 = [(HMDResidentDeviceManagerRoar *)v6 backingStore];
    [v11 updateReachabilityForResidents:v4];
  }
}

void __73__HMDResidentDeviceManagerRoar__updateResidentReachabilityWithResidents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isReachable] & 1) == 0) {
    [*(id *)(a1 + 32) _updateReachability:1 forResidentDevice:v3];
  }
}

void __73__HMDResidentDeviceManagerRoar__updateResidentReachabilityWithResidents___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isReachable]) {
    [*(id *)(a1 + 32) _updateReachability:0 forResidentDevice:v3];
  }
}

- (void)_handleReachabilityAfterPrimaryResidentChangedTo:(id)a3 previousPrimaryResident:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    BOOL v13 = self;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      id v17 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@There is no primary resident. Marking all residents as unreachable", (uint8_t *)&v16, 0xCu);
    }
    id v11 = [(HMDResidentDeviceManagerRoar *)v13 residentDevices];
    [(HMDResidentDeviceManagerRoar *)v13 _updateReachability:0 forResidentDevices:v11];
    goto LABEL_7;
  }
  if ([v6 isCurrentDevice])
  {
    id v8 = (void *)MEMORY[0x263EFF9C0];
    int v9 = [(HMDResidentDeviceManagerRoar *)self localNetworkElection];
    id v10 = [v9 residentsInMesh];
    id v11 = [v8 setWithSet:v10];

    [v11 addObject:v6];
    [(HMDResidentDeviceManagerRoar *)self _updateResidentReachabilityWithResidents:v11];
LABEL_7:
  }
}

- (void)_updatePrimaryResidentTransactionWithPrimaryResidentDevice:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isCurrentDevice]
    && ![(HMDResidentDeviceManagerRoar *)self hasActivePrimaryResidentTransaction])
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      BOOL v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      int v16 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Taking OS transaction since this device is now the primary resident", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v14 = [objc_alloc(MEMORY[0x263F425C0]) initWithName:@"com.apple.homed.primary-resident"];
    primaryResidentTransaction = v11->_primaryResidentTransaction;
    v11->_primaryResidentTransaction = (HMFOSTransaction *)v14;
    goto LABEL_11;
  }
  if (([v4 isCurrentDevice] & 1) == 0
    && [(HMDResidentDeviceManagerRoar *)self hasActivePrimaryResidentTransaction])
  {
    v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = HMFGetLogIdentifier();
      int v15 = 138543362;
      int v16 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Releasing OS transaction since this device is no longer the primary resident", (uint8_t *)&v15, 0xCu);
    }
    primaryResidentTransaction = v6->_primaryResidentTransaction;
    v6->_primaryResidentTransaction = 0;
LABEL_11:
  }
}

- (BOOL)hasActivePrimaryResidentTransaction
{
  return self->_primaryResidentTransaction != 0;
}

- (void)_handleUpdatedPrimaryResidentDevice:(id)a3 previousPrimaryResident:(id)a4 generationID:(id)a5 changeSource:(unint64_t)a6
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v66 = (__CFString *)a5;
  uint64_t v12 = [v10 isCurrentDevice];
  int v13 = v12;
  if (v10) {
    int v14 = v12;
  }
  else {
    int v14 = 1;
  }
  if (v10)
  {
    uint64_t v12 = [v10 isReachable];
    int v15 = v12 ^ 1;
  }
  else
  {
    int v15 = 0;
  }
  int v16 = v15 ^ 1;
  if (!v11) {
    int v16 = 0;
  }
  if (((v16 | v14) & 1) == 0) {
    uint64_t v12 = [(HMDResidentDeviceManagerRoar *)self _updateReachabilityFromWorkingStoreExceptResident:v10];
  }
  char v65 = v14;
  if (v15)
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990](v12);
    uint64_t v18 = self;
    int v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v68 = (uint64_t)v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Marking new primary resident as reachable", buf, 0xCu);
    }
    [(HMDResidentDeviceManagerRoar *)v18 _updateReachability:1 forResidentDevice:v10];
  }
  else if (!v10)
  {
    __int16 v21 = (void *)MEMORY[0x230FBD990](v12);
    v22 = self;
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v68 = (uint64_t)v24;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@There is no primary resident. Marking all residents as unreachable", buf, 0xCu);
    }
    uint64_t v25 = [(HMDResidentDeviceManagerRoar *)v22 residentDevices];
    [(HMDResidentDeviceManagerRoar *)v22 _updateReachability:0 forResidentDevices:v25];
  }
  v26 = [v11 identifier];
  v27 = [v10 identifier];
  char v28 = HMFEqualObjects();

  if (v28)
  {
    [(HMDResidentDeviceManagerRoar *)self _updatePrimaryResidentGenerationID:v66];
    goto LABEL_42;
  }
  v29 = (void *)MEMORY[0x230FBD990]();
  v30 = self;
  v31 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v32 = HMFGetLogIdentifier();
    v33 = (void *)v32;
    if (a6 - 1 > 6) {
      v34 = @"resident removed";
    }
    else {
      v34 = off_264A23100[a6 - 1];
    }
    *(_DWORD *)buf = 138544130;
    uint64_t v68 = v32;
    __int16 v69 = 2112;
    v70 = v34;
    __int16 v71 = 2112;
    id v72 = v11;
    __int16 v73 = 2112;
    id v74 = v10;
    _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Updating primary resident due to %@, from %@ to %@", buf, 0x2Au);
  }
  os_unfair_lock_lock_with_options();
  uint64_t v35 = [v10 identifier];
  primaryResidentUUID = v30->_primaryResidentUUID;
  v30->_primaryResidentUUID = (NSUUID *)v35;

  char v37 = HMFEqualObjects();
  if ((v37 & 1) == 0) {
    objc_storeStrong((id *)&v30->_primaryResidentGenerationID, a5);
  }
  os_unfair_lock_unlock(&v30->_lock);
  if (![(HMDResidentDeviceManagerRoar *)v30 isActingAsResident])
  {
    if (v11)
    {
      v38 = [(HMDResidentDeviceManagerRoar *)v30 reachabilityObserver];
      v39 = [v11 device];
      v40 = [v39 deviceAddress];
      [v38 removeListener:v30 forDeviceAddress:v40];

      v41 = [(HMDResidentDeviceManagerRoar *)v30 deviceMonitor];
      v42 = [v11 device];
      [v41 stopMonitoringDevice:v42 forClient:v30];
    }
    if (v10)
    {
      v43 = [(HMDResidentDeviceManagerRoar *)v30 reachabilityObserver];
      v44 = [v10 device];
      v45 = [v44 deviceAddress];
      [v43 addListener:v30 forDeviceAddress:v45];

      v46 = [(HMDResidentDeviceManagerRoar *)v30 deviceMonitor];
      v47 = [v10 device];
      [v46 startMonitoringDevice:v47 withInitialReachability:0 forClient:v30];

      v48 = [(HMDResidentDeviceManagerRoar *)v30 deviceMonitor];
      v49 = [v48 unreachableDevices];
      v50 = [v10 device];
      -[HMDResidentDeviceManagerRoar _setResident:reachableOverIDS:andNotify:](v30, "_setResident:reachableOverIDS:andNotify:", v10, [v49 containsObject:v50] ^ 1, 0);
    }
  }
  [(HMDResidentDeviceManagerRoar *)v30 _updatePrimaryResidentTransactionWithPrimaryResidentDevice:v10];
  uint64_t v51 = [(HMDResidentDeviceManagerRoar *)v30 notifyUpdatedPrimaryResident:v10 previousPrimaryResident:v11];
  if ((v37 & 1) == 0)
  {
    v52 = (void *)MEMORY[0x230FBD990](v51);
    v53 = v30;
    v54 = HMFGetOSLogHandle();
    BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v55)
      {
        v56 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v68 = (uint64_t)v56;
        __int16 v69 = 2114;
        v70 = v66;
        _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_INFO, "%{public}@Using newly generated primaryResidentGenerationID = %{public}@", buf, 0x16u);
      }
    }
    else if (v55)
    {
      v57 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v68 = (uint64_t)v57;
      __int16 v69 = 2114;
      v70 = v66;
      _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_INFO, "%{public}@Updating primaryResidentGenerationID = %{public}@", buf, 0x16u);
    }
  }
  if (v65)
  {
    [(HMDResidentDeviceManagerRoar *)v30 _teardownSessionWithPrimaryResidentDevice];
LABEL_42:
    if (!v10) {
      goto LABEL_47;
    }
    goto LABEL_45;
  }
  [(HMDResidentDeviceManagerRoar *)v30 _setupSessionWithPrimaryResidentDevice];
LABEL_45:
  v58 = [(HMDResidentDeviceManagerRoar *)self primaryDiscoveryManager];
  [v58 cancel];

  logger = self->_logger;
  if (os_signpost_enabled(logger))
  {
    v60 = logger;
    v61 = [v10 identifier];
    *(_DWORD *)buf = 138412290;
    uint64_t v68 = (uint64_t)v61;
    _os_signpost_emit_with_name_impl(&dword_22F52A000, v60, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HH2ElectedPrimaryResident", "electedPrimaryResidentIdentifier=%{signpost.description:attribute}@ ", buf, 0xCu);
  }
LABEL_47:
  [(HMDResidentDeviceManagerRoar *)self _handleReachabilityAfterPrimaryResidentChangedTo:v10 previousPrimaryResident:v11];
  v62 = [v10 device];
  if (-[HMDResidentDeviceManagerRoar isCurrentDeviceConfirmedPrimaryResident](self, "isCurrentDeviceConfirmedPrimaryResident")&& [v62 isCurrentDevice])
  {
    v63 = [(HMDResidentDeviceManagerRoar *)self backingStore];
    v64 = [(HMDResidentDeviceManagerRoar *)self availableResidentDevices];
    [v63 updateIdentifiersForAvailableResidentDevices:v64];
  }
}

- (void)_updateReachability:(BOOL)a3 forResidentDevices:(id)a4
{
  BOOL v4 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(HMDResidentDeviceManagerRoar *)self _updateReachability:v4 forResidentDevice:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_updateReachabilityFromWorkingStoreExceptResident:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDResidentDeviceManagerRoar *)self residentDevicesSet];
  id v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = (void *)MEMORY[0x230FBD990]([v6 removeObject:v4]);
  uint64_t v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v19 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating resident reachability from database", buf, 0xCu);
  }
  id v11 = objc_alloc(MEMORY[0x263F42520]);
  long long v12 = [(HMDResidentDeviceManagerRoar *)v8 queue];
  long long v13 = (void *)[v11 initWithQueue:v12];

  long long v14 = [(HMDResidentDeviceManagerRoar *)v8 backingStore];
  int v15 = [v14 residentsRequiringReachabilityUpdate:v6];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __82__HMDResidentDeviceManagerRoar__updateReachabilityFromWorkingStoreExceptResident___block_invoke;
  v17[3] = &unk_264A2A918;
  v17[4] = v8;
  id v16 = (id)[v15 inContext:v13 then:v17];
}

uint64_t __82__HMDResidentDeviceManagerRoar__updateReachabilityFromWorkingStoreExceptResident___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __82__HMDResidentDeviceManagerRoar__updateReachabilityFromWorkingStoreExceptResident___block_invoke_2;
  v3[3] = &unk_264A2A788;
  v3[4] = *(void *)(a1 + 32);
  objc_msgSend(a2, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v3);
  return 1;
}

void __82__HMDResidentDeviceManagerRoar__updateReachabilityFromWorkingStoreExceptResident___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 isReachable] ^ 1;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = HMFBooleanToString();
    int v10 = 138543874;
    id v11 = v8;
    __int16 v12 = 2112;
    long long v13 = v9;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating resident reachability from database to %@ for: %@", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(a1 + 32) _updateReachability:v4 forResidentDevice:v3];
}

- (int64_t)atHomeLevel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  int64_t v3 = [WeakRetained atHomeLevel];

  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)isOwnerUser
{
  v2 = [(HMDResidentDeviceManagerRoar *)self home];
  char v3 = [v2 isOwnerUser];

  return v3;
}

- (BOOL)isResidentEnabled
{
  v2 = [(HMDResidentDeviceManagerRoar *)self ourSelf];
  char v3 = [v2 isEnabled];

  return v3;
}

- (void)updatePrimaryResidentWithUUID:(id)a3 actions:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x230FBD990]();
  int v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    __int16 v12 = HMFGetLogIdentifier();
    long long v13 = NSStringFromSelector(a2);
    int v14 = 138543618;
    id v15 = v12;
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", (uint8_t *)&v14, 0x16u);
  }
}

- (void)_handleCloudZoneReadyNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v10 = NSStringFromSelector(a2);
    int v11 = 138543618;
    __int16 v12 = v9;
    __int16 v13 = 2112;
    int v14 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", (uint8_t *)&v11, 0x16u);
  }
}

- (OS_dispatch_queue)messageReceiveQueue
{
  return self->_queue;
}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (id)dumpState
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v4 = [(HMDResidentDeviceManagerRoar *)self localNetworkElection];

  if (v4)
  {
    id v5 = [(HMDResidentDeviceManagerRoar *)self localNetworkElection];
    id v6 = [v5 dumpState];
    [v3 setObject:v6 forKeyedSubscript:@"Election.Coordination"];
  }
  id v7 = [(HMDResidentDeviceManagerRoar *)self home];
  id v8 = NSString;
  v31 = v7;
  v30 = [v7 uuid];
  uint64_t v9 = [v30 UUIDString];
  [(HMDResidentDeviceManagerRoar *)self primaryResidentDevice];
  v11 = int v10 = v3;
  __int16 v12 = [v11 device];
  __int16 v13 = [v12 identifier];
  int v14 = [v13 UUIDString];
  [(HMDResidentDeviceManagerRoar *)self isResidentAvailable];
  uint64_t v15 = HMFBooleanToString();
  [(HMDResidentDeviceManagerRoar *)self isResidentSupported];
  __int16 v16 = HMFBooleanToString();
  uint64_t v17 = [v8 stringWithFormat:@"home: %@, primaryResidentDevice: %@ isResidentAvailable: %@, isResidentSupported: %@", v9, v14, v15, v16];
  uint64_t v32 = v10;
  [v10 setObject:v17 forKeyedSubscript:@"State"];

  uint64_t v18 = [MEMORY[0x263EFF980] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  int v19 = [(HMDResidentDeviceManagerRoar *)self residentDevices];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = [*(id *)(*((void *)&v33 + 1) + 8 * i) dumpState];
        [v18 addObject:v24];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v21);
  }

  [v32 setObject:v18 forKeyedSubscript:@"Residents"];
  uint64_t v25 = [(HMDResidentDeviceManagerRoar *)self messageDispatcher];
  v26 = [v25 secureRemoteTransport];
  v27 = [v26 deviceMonitor];
  char v28 = [v27 dumpState];
  [v32 setObject:v28 forKeyedSubscript:@"Remote Device Monitor"];

  return v32;
}

- (NSString)description
{
  return (NSString *)[(HMDResidentDeviceManagerRoar *)self descriptionWithPointer:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(HMDResidentDeviceManagerRoar *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = NSString;
  id v6 = [(id)objc_opt_class() shortDescription];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = &stru_26E2EB898;
  }
  id v8 = [(HMDResidentDeviceManagerRoar *)self residentDevices];
  uint64_t v9 = [v5 stringWithFormat:@"<%@%@, Resident Devices = %@", v6, v7, v8];

  if (v3) {
  return v9;
  }
}

- (id)shortDescription
{
  BOOL v3 = NSString;
  uint64_t v4 = [(id)objc_opt_class() shortDescription];
  id v5 = [(HMDResidentDeviceManagerRoar *)self messageTargetUUID];
  id v6 = [v5 UUIDString];
  id v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return v7;
}

- (void)_updateReachability:(BOOL)a3 forResidentDevice:(id)a4
{
  BOOL v4 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = [v6 isReachable];
  id v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  int v10 = HMFGetOSLogHandle();
  int v11 = v10;
  if (v7 == v4)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v14 = HMFGetLogIdentifier();
      uint64_t v15 = "un";
      int v16 = 138543874;
      uint64_t v17 = v14;
      if (v4) {
        uint64_t v15 = "";
      }
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2080;
      uint64_t v21 = v15;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Resident %@ is already %sreachable", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = HMFGetLogIdentifier();
      __int16 v13 = HMFBooleanToString();
      int v16 = 138543874;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      id v19 = v13;
      __int16 v20 = 2112;
      uint64_t v21 = (const char *)v6;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Setting reachability to %@ for resident %@", (uint8_t *)&v16, 0x20u);
    }
    [v6 setReachable:v4];
    [(HMDResidentDeviceManagerRoar *)v9 notifyClientsOfUpdatedResidentDevice:v6];
  }
}

- (void)_updateResidentIDSReachability:(BOOL)a3 withUpdatedDevice:(id)a4
{
  id v6 = a4;
  if (![(HMDResidentDeviceManagerRoar *)self isActingAsResident])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__HMDResidentDeviceManagerRoar__updateResidentIDSReachability_withUpdatedDevice___block_invoke;
    block[3] = &unk_264A2DFC8;
    block[4] = self;
    id v9 = v6;
    BOOL v10 = a3;
    dispatch_async(queue, block);
  }
}

void __81__HMDResidentDeviceManagerRoar__updateResidentIDSReachability_withUpdatedDevice___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) residentDeviceForDevice:*(void *)(a1 + 40)];
  if (v2)
  {
    BOOL v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = *(id *)(a1 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v7 = [v2 shortDescription];
      id v8 = HMFBooleanToString();
      int v9 = 138543874;
      BOOL v10 = v6;
      __int16 v11 = 2112;
      __int16 v12 = v7;
      __int16 v13 = 2112;
      int v14 = v8;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Notified that resident device %@ IDS reachability changed: %@", (uint8_t *)&v9, 0x20u);
    }
    [*(id *)(a1 + 32) _setResident:v2 reachableOverIDS:*(unsigned __int8 *)(a1 + 48) andNotify:1];
  }
}

- (void)_setResident:(id)a3 reachableOverIDS:(BOOL)a4 andNotify:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = [v8 isReachableByIDS];
  BOOL v10 = (void *)MEMORY[0x230FBD990]();
  __int16 v11 = self;
  __int16 v12 = HMFGetOSLogHandle();
  __int16 v13 = v12;
  if (v9 == v6)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      uint64_t v18 = [v8 shortDescription];
      id v19 = (void *)v18;
      __int16 v20 = "un";
      int v21 = 138543874;
      uint64_t v22 = v17;
      if (v6) {
        __int16 v20 = "";
      }
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      __int16 v25 = 2080;
      v26 = v20;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEBUG, "%{public}@resident %@ is already %sreachable by IDS", (uint8_t *)&v21, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = HMFGetLogIdentifier();
      uint64_t v15 = HMFBooleanToString();
      int v16 = [v8 shortDescription];
      int v21 = 138543874;
      uint64_t v22 = v14;
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v15;
      __int16 v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Setting IDS reachability to %@ for resident %@", (uint8_t *)&v21, 0x20u);
    }
    [v8 setReachableByIDS:v6];
    if (v5) {
      [(HMDResidentDeviceManagerRoar *)v11 notifyClientsOfUpdatedResidentDevice:v8];
    }
  }
}

- (void)_handleResidentSelectionVersionDidChange:(id)a3
{
  id v4 = [(HMDResidentDeviceManagerRoar *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__HMDResidentDeviceManagerRoar__handleResidentSelectionVersionDidChange___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __73__HMDResidentDeviceManagerRoar__handleResidentSelectionVersionDidChange___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) home];
  BOOL v3 = [v2 residentSelectionVersion];

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  BOOL v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = HMFGetLogIdentifier();
    [*(id *)(a1 + 32) isActingAsResident];
    id v8 = HMFBooleanToString();
    int v13 = 138543874;
    int v14 = v7;
    __int16 v15 = 2112;
    int v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Device is acting as resident %@, home's resident selection version changed to %@", (uint8_t *)&v13, 0x20u);
  }
  if ([*(id *)(a1 + 32) isActingAsResident] && objc_msgSend(v3, "integerValue") >= 3)
  {
    int v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    __int16 v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      __int16 v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      int v14 = v12;
      __int16 v15 = 2114;
      int v16 = v3;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Exiting mesh since home's resident selection version changed to %{public}@", (uint8_t *)&v13, 0x16u);
    }
    [*(id *)(a1 + 32) _stopLocalNetworkElection];
  }
}

- (void)_handleRemoteDeviceIsNotReachable:(id)a3
{
  id v4 = [a3 object];
  [(HMDResidentDeviceManagerRoar *)self _updateResidentIDSReachability:0 withUpdatedDevice:v4];
}

- (void)_handleRemoteDeviceIsReachable:(id)a3
{
  id v4 = [a3 object];
  [(HMDResidentDeviceManagerRoar *)self _updateResidentIDSReachability:1 withUpdatedDevice:v4];
}

- (void)modernTransportDeviceReachabilityObserverDidUpdate:(id)a3 isReachable:(BOOL)a4
{
  id v6 = a3;
  if (![(HMDResidentDeviceManagerRoar *)self isActingAsResident])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __95__HMDResidentDeviceManagerRoar_modernTransportDeviceReachabilityObserverDidUpdate_isReachable___block_invoke;
    block[3] = &unk_264A2DFC8;
    block[4] = self;
    id v9 = v6;
    BOOL v10 = a4;
    dispatch_async(queue, block);
  }
}

void __95__HMDResidentDeviceManagerRoar_modernTransportDeviceReachabilityObserverDidUpdate_isReachable___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) primaryResidentDevice];
  if ([v2 isDeviceEquivalentToDeviceAddress:*(void *)(a1 + 40)]) {
    [*(id *)(a1 + 32) _handlePrimaryResident:v2 isReachable:*(unsigned __int8 *)(a1 + 48)];
  }
}

- (void)discoveryManager:(id)a3 didNotCompleteDiscoveryWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDResidentDeviceManagerRoar *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __82__HMDResidentDeviceManagerRoar_discoveryManager_didNotCompleteDiscoveryWithError___block_invoke;
  v8[3] = &unk_264A2F820;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __82__HMDResidentDeviceManagerRoar_discoveryManager_didNotCompleteDiscoveryWithError___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) primaryDiscoveryRequesters];
  BOOL v3 = (void *)[v2 copy];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "residentDeviceManager:didNotCompleteDiscoveryWithError:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)discoveryManager:(id)a3 didCompleteInitialDiscoveryAttemptWithError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(HMDResidentDeviceManagerRoar *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __93__HMDResidentDeviceManagerRoar_discoveryManager_didCompleteInitialDiscoveryAttemptWithError___block_invoke;
  v8[3] = &unk_264A2F820;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __93__HMDResidentDeviceManagerRoar_discoveryManager_didCompleteInitialDiscoveryAttemptWithError___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v10 = 138543618;
    long long v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Account message phase of the primary resident discovery operation completed. Error: %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = [*(id *)(a1 + 32) firstPrimaryResidentDiscoveryAttemptCompletionPromise];
  id v9 = v8;
  if (v7) {
    [v8 rejectWithError:*(void *)(a1 + 40)];
  }
  else {
    [v8 fulfillWithNoValue];
  }
}

- (void)discoveryManager:(id)a3 didCompleteDiscoveryWithPrimaryResidentDevice:(id)a4 primaryResidentGenerationID:(id)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  __int16 v12 = [(HMDResidentDeviceManagerRoar *)self queue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __129__HMDResidentDeviceManagerRoar_discoveryManager_didCompleteDiscoveryWithPrimaryResidentDevice_primaryResidentGenerationID_error___block_invoke;
  v16[3] = &unk_264A2E610;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v12, v16);
}

void __129__HMDResidentDeviceManagerRoar_discoveryManager_didCompleteDiscoveryWithPrimaryResidentDevice_primaryResidentGenerationID_error___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) primaryDiscoveryRequesters];
  id v3 = (void *)[v2 copy];

  id v4 = [*(id *)(a1 + 32) primaryDiscoveryRequesters];
  [v4 removeAllObjects];

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    [*(id *)(a1 + 32) handlePrimaryResidentDiscovered:v5 primaryResidentGenerationID:*(void *)(a1 + 48)];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "residentDeviceManager:didCompleteDiscoveryWithPrimaryResidentDevice:error:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 56), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)electResidentDevice:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3 != 7)
  {
    uint64_t v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      uint64_t v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      long long v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", buf, 0x16u);
    }
    goto LABEL_10;
  }
  if (![(HMDResidentDeviceManagerRoar *)self isActingAsResident])
  {
    uint64_t v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v13 = v10;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@SetPreferredPrimary - This device is not an acting resident, returning from electResidentDevice", buf, 0xCu);
    }
LABEL_10:

    return;
  }
  id v11 = [(HMDResidentDeviceManagerRoar *)self localNetworkElection];
  [v11 selectPrimaryResidentWithReason:7];
}

- (BOOL)allowExternalUpdateOfPrimaryResidentTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDResidentDeviceManagerRoar *)self residentDeviceForDevice:v4];
  if ([(HMDResidentDeviceManagerRoar *)self isCurrentDevicePrimaryResident])
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    uint64_t v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      uint64_t v10 = [v4 shortDescription];
      int v15 = 138543618;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      id v18 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Request for external update of the primary resident to: %{public}@ received while we are the primary", (uint8_t *)&v15, 0x16u);
    }
  }
  id v11 = [(HMDResidentDeviceManagerRoar *)self localNetworkElection];

  if (v11)
  {
    long long v12 = [(HMDResidentDeviceManagerRoar *)self localNetworkElection];
    char v13 = [v12 allowExternalUpdateOfPrimaryResidentTo:v5];
  }
  else
  {
    char v13 = 1;
  }

  return v13;
}

- (void)sawGenerationID:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__HMDResidentDeviceManagerRoar_sawGenerationID_forDevice___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __58__HMDResidentDeviceManagerRoar_sawGenerationID_forDevice___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) residentDeviceForDevice:*(void *)(a1 + 40)];
  if (!v2)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = *(void **)(a1 + 40);
      int v14 = 138543618;
      int v15 = v9;
      __int16 v16 = 2112;
      __int16 v17 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Resident device %@ is unknown, ignoring generation ID", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_10;
  }
  id v3 = [*(id *)(a1 + 32) primaryResidentUUID];
  id v4 = [v2 identifier];
  char v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  if ((v5 & 1) == 0)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = 138543618;
      int v15 = v13;
      __int16 v16 = 2112;
      __int16 v17 = v2;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@New generation ID is for a resident that isn't the primary: %@ ignoring it.", (uint8_t *)&v14, 0x16u);
    }
LABEL_10:
    goto LABEL_11;
  }
  [*(id *)(a1 + 32) _updatePrimaryResidentGenerationID:*(void *)(a1 + 48)];
LABEL_11:
}

- (id)foundNewPrimaryResident:(id)a3 generationID:(id)a4 selectionTimestamp:(id)a5 changeSource:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc(MEMORY[0x263F42520]);
  id v12 = [(HMDResidentDeviceManagerRoar *)self queue];
  id v13 = (void *)[v11 initWithQueue:v12];

  int v14 = (void *)MEMORY[0x263F42538];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __101__HMDResidentDeviceManagerRoar_foundNewPrimaryResident_generationID_selectionTimestamp_changeSource___block_invoke;
  v19[3] = &unk_264A230E0;
  v19[4] = self;
  id v20 = v9;
  id v21 = v10;
  unint64_t v22 = a6;
  id v15 = v10;
  id v16 = v9;
  __int16 v17 = [v14 inContext:v13 perform:v19];

  return v17;
}

uint64_t __101__HMDResidentDeviceManagerRoar_foundNewPrimaryResident_generationID_selectionTimestamp_changeSource___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) residentDeviceForDevice:*(void *)(a1 + 40)];
  if (!v2)
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = *(id *)(a1 + 32);
    char v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      uint64_t v7 = *(void *)(a1 + 40);
      int v19 = 138543618;
      id v20 = v6;
      __int16 v21 = 2112;
      uint64_t v22 = v7;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@New resident device %@ is not known as a resident device, creating one", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v8 = [HMDResidentDevice alloc];
    uint64_t v9 = *(void *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 272));
    id v2 = [(HMDResidentDevice *)v8 initWithDevice:v9 home:WeakRetained];

    [*(id *)(a1 + 32) _addResidentDevice:v2];
  }
  id v11 = [*(id *)(a1 + 32) primaryResidentUUID];
  id v12 = [(HMDResidentDevice *)v2 identifier];
  int v13 = objc_msgSend(v11, "hmf_isEqualToUUID:", v12);

  int v14 = *(void **)(a1 + 32);
  if (v13)
  {
    [v14 _updatePrimaryResidentGenerationID:*(void *)(a1 + 48)];
    id v15 = [*(id *)(a1 + 32) primaryDiscoveryManager];
    [v15 cancel];
    uint64_t v16 = 0;
  }
  else
  {
    if (![v14 allowExternalUpdateOfPrimaryResidentTo:*(void *)(a1 + 40)])
    {
      uint64_t v16 = 1;
      goto LABEL_11;
    }
    __int16 v17 = *(void **)(a1 + 32);
    id v15 = [v17 primaryResidentDevice];
    [v17 _handleUpdatedPrimaryResidentDevice:v2 previousPrimaryResident:v15 generationID:*(void *)(a1 + 48) changeSource:*(void *)(a1 + 56)];
    uint64_t v16 = 2;
  }

LABEL_11:
  [NSNumber numberWithUnsignedInteger:v16];
  objc_claimAutoreleasedReturnValue();

  return 1;
}

- (void)handleCurrentDeviceChanged:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__HMDResidentDeviceManagerRoar_handleCurrentDeviceChanged___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __59__HMDResidentDeviceManagerRoar_handleCurrentDeviceChanged___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"HMDDeviceNotificationKey"];

  objc_opt_class();
  objc_opt_isKindOfClass();

  id v4 = [*(id *)(a1 + 40) notificationCenter];
  [v4 removeObserver:*(void *)(a1 + 40) name:@"HMDDeviceUpdatedNotification" object:0];
}

- (void)_handleResidentDeviceUpdateEnabled:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 uuidForKey:@"kIdentifierKey"];
  if (v5)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v6 = [(HMDResidentDeviceManagerRoar *)self residentDevices];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v40;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
        id v12 = [v11 identifier];
        char v13 = [v12 isEqual:v5];

        if (v13) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v39 objects:v43 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v14 = v11;

      if (!v14) {
        goto LABEL_17;
      }
      char v38 = 0;
      id v15 = [v4 messagePayload];
      objc_msgSend(v15, "hmf_BOOLForKey:isPresent:", @"kEnabledKey", &v38);

      if (!v38)
      {
        uint64_t v16 = (void *)MEMORY[0x230FBD990]();
        __int16 v17 = self;
        uint64_t v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v19 = HMFGetLogIdentifier();
          id v20 = [v4 messagePayload];
          int buf = 138543618;
          v45 = v19;
          __int16 v46 = 2112;
          v47 = v20;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Invalid message payload, missing enabled state: %@", (uint8_t *)&buf, 0x16u);
        }
        __int16 v21 = [v4 responseHandler];

        if (v21)
        {
          uint64_t v22 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
          uint64_t v23 = [v4 responseHandler];
          v23[2](v23, v22, 0);

          goto LABEL_26;
        }
      }
      goto LABEL_27;
    }
LABEL_10:

LABEL_17:
    uint64_t v24 = (void *)MEMORY[0x230FBD990]();
    __int16 v25 = self;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      char v28 = [v5 UUIDString];
      int buf = 138543618;
      v45 = v27;
      __int16 v46 = 2114;
      v47 = v28;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Failed to find resident device with identifier: %{public}@", (uint8_t *)&buf, 0x16u);
    }
    v29 = [v4 responseHandler];

    if (v29)
    {
      v30 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = 2;
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v32 = (void *)MEMORY[0x230FBD990]();
    long long v33 = self;
    long long v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      long long v35 = HMFGetLogIdentifier();
      long long v36 = [v4 messagePayload];
      int buf = 138543618;
      v45 = v35;
      __int16 v46 = 2112;
      v47 = v36;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@Invalid message payload, missing resident device identifier: %@", (uint8_t *)&buf, 0x16u);
    }
    char v37 = [v4 responseHandler];

    if (v37)
    {
      v30 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = 20;
LABEL_25:
      id v14 = [v30 hmErrorWithCode:v31];
      uint64_t v22 = [v4 responseHandler];
      ((void (**)(void, id, void))v22)[2](v22, v14, 0);
LABEL_26:

LABEL_27:
    }
  }
}

- (void)_handlePrimaryResidentDiscoveryRequest:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HMDResidentDeviceManagerRoar *)self isCurrentDevicePrimaryResident];
  id v6 = (void *)MEMORY[0x230FBD990]();
  uint64_t v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  uint64_t v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)int buf = 138543362;
      uint64_t v23 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Received query for primary resident, responding", buf, 0xCu);
    }
    id v11 = [(HMDResidentDeviceManagerRoar *)v7 currentResidentDevice];
    id v12 = [v11 identifier];
    char v13 = [v12 UUIDString];
    __int16 v21 = v13;
    id v14 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v15 = (void *)[v14 mutableCopy];

    uint64_t v16 = [(HMDResidentDeviceManagerRoar *)v7 primaryResidentGenerationID];
    __int16 v17 = [v16 UUIDString];
    [v15 setObject:v17 forKeyedSubscript:@"gen"];

    uint64_t v18 = (void *)[v15 copy];
    [v4 respondWithPayload:v18];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v19 = HMFGetLogIdentifier();
      *(_DWORD *)int buf = 138543362;
      uint64_t v23 = v19;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Received query for primary but we are standby, ignoring", buf, 0xCu);
    }
  }
}

- (void)_handlePrimaryResidentDiscoveryXPCRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)int buf = 138543362;
    __int16 v17 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling primary resident discovery request", buf, 0xCu);
  }
  uint64_t v9 = objc_alloc_init(HMDResidentDeviceManagerXPCDiscoveryRequester);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__HMDResidentDeviceManagerRoar__handlePrimaryResidentDiscoveryXPCRequest___block_invoke;
  v12[3] = &unk_264A2A858;
  char v13 = v9;
  id v14 = v6;
  id v15 = v4;
  id v10 = v4;
  id v11 = v9;
  [(HMDResidentDeviceManagerXPCDiscoveryRequester *)v11 setBlock:v12];
  [(HMDResidentDeviceManagerRoar *)v6 _discoverPrimaryResidentForRequester:v11];
}

void __74__HMDResidentDeviceManagerRoar__handlePrimaryResidentDiscoveryXPCRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  [v6 setBlock:0];
  if (v5)
  {
    id v14 = @"uuid";
    uint64_t v8 = [v5 identifier];
    v15[0] = v8;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v10 = (void *)[v9 mutableCopy];

    id v11 = [*(id *)(a1 + 40) primaryResidentGenerationID];
    [v10 setObject:v11 forKeyedSubscript:@"uuid"];
  }
  else
  {
    id v10 = 0;
  }
  id v12 = *(void **)(a1 + 48);
  char v13 = (void *)[v10 copy];
  [v12 respondWithPayload:v13 error:v7];
}

- (void)handlePrimaryResidentDiscovered:(id)a3 primaryResidentGenerationID:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [(HMDResidentDeviceManagerRoar *)self residentDevices];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __92__HMDResidentDeviceManagerRoar_handlePrimaryResidentDiscovered_primaryResidentGenerationID___block_invoke;
    v16[3] = &unk_264A2A830;
    id v9 = v6;
    id v17 = v9;
    char v10 = objc_msgSend(v8, "na_any:", v16);

    if ((v10 & 1) == 0) {
      [(HMDResidentDeviceManagerRoar *)self _addResidentDevice:v9];
    }

    id v11 = [(HMDResidentDeviceManagerRoar *)self primaryResidentDevice];
    [(HMDResidentDeviceManagerRoar *)self _handleUpdatedPrimaryResidentDevice:v9 previousPrimaryResident:v11 generationID:v7 changeSource:4];
  }
  else
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    char v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)int buf = 138543362;
      int v19 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Primary resident discovered is nil", buf, 0xCu);
    }
  }
}

uint64_t __92__HMDResidentDeviceManagerRoar_handlePrimaryResidentDiscovered_primaryResidentGenerationID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 identifier];
  id v5 = [v3 identifier];

  uint64_t v6 = [v4 isEqual:v5];
  return v6;
}

- (void)_discoverPrimaryResidentForRequester:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v17 = 138543362;
    uint64_t v18 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Running primary resident discovery", (uint8_t *)&v17, 0xCu);
  }
  id v9 = [(HMDResidentDeviceManagerRoar *)v6 queue];
  dispatch_assert_queue_V2(v9);

  if (![(HMDResidentDeviceManagerRoar *)v6 isResidentSupported])
  {
    char v10 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    id v11 = v4;
    id v12 = v6;
    char v13 = 0;
    id v14 = v10;
    goto LABEL_7;
  }
  char v10 = [(HMDResidentDeviceManagerRoar *)v6 primaryResidentDevice];
  if ([v10 isCurrentDevice])
  {
    id v11 = v4;
    id v12 = v6;
    char v13 = v10;
    id v14 = 0;
LABEL_7:
    [v11 residentDeviceManager:v12 didCompleteDiscoveryWithPrimaryResidentDevice:v13 error:v14];
    goto LABEL_11;
  }
  if (v4)
  {
    id v15 = [(HMDResidentDeviceManagerRoar *)v6 primaryDiscoveryRequesters];
    [v15 addObject:v4];
  }
  uint64_t v16 = [(HMDResidentDeviceManagerRoar *)v6 primaryDiscoveryManager];
  [v16 discoverPrimaryResident];

LABEL_11:
}

- (void)discoverPrimaryResidentForRequester:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentDeviceManagerRoar *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__HMDResidentDeviceManagerRoar_discoverPrimaryResidentForRequester___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __68__HMDResidentDeviceManagerRoar_discoverPrimaryResidentForRequester___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _discoverPrimaryResidentForRequester:*(void *)(a1 + 40)];
}

- (void)_handlePrimaryResident:(id)a3 isReachable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HMDResidentDeviceManagerRoar *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  char v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v11)
    {
      id v12 = HMFGetLogIdentifier();
      int v15 = 138543618;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Primary resident: %@ became reachable. Updating the reachability of all residents from the working store", (uint8_t *)&v15, 0x16u);
    }
    [(HMDResidentDeviceManagerRoar *)v9 _updateReachability:1 forResidentDevice:v6];
    [(HMDResidentDeviceManagerRoar *)v9 _updateReachabilityFromWorkingStoreExceptResident:v6];
  }
  else
  {
    if (v11)
    {
      char v13 = HMFGetLogIdentifier();
      int v15 = 138543618;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Primary resident: %@ became unreachable. Marking all residents as unreachable", (uint8_t *)&v15, 0x16u);
    }
    id v14 = [(HMDResidentDeviceManagerRoar *)v9 residentDevices];
    [(HMDResidentDeviceManagerRoar *)v9 _updateReachability:0 forResidentDevices:v14];

    [(HMDResidentDeviceManagerRoar *)v9 _discoverPrimaryResidentForRequester:0];
  }
}

- (void)_sendResidentDeviceNotificationWithName:(id)a3 forResidentDevice:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  [v8 setObject:v7 forKeyedSubscript:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];
  id v9 = [(HMDResidentDeviceManagerRoar *)self home];
  char v10 = [v9 uuid];
  [v8 setObject:v10 forKeyedSubscript:@"HMDResidentDeviceManagerHomeUUIDNotificationKey"];

  BOOL v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  char v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    int v16 = 138543618;
    __int16 v17 = v14;
    __int16 v18 = 2114;
    id v19 = v6;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Notifying %{public}@", (uint8_t *)&v16, 0x16u);
  }
  int v15 = [(HMDResidentDeviceManagerRoar *)v12 notificationCenter];
  [v15 postNotificationName:v6 object:v12 userInfo:v8];
}

- (void)_notifyUpdatedGenerationIDWithPrimaryResident:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(HMDResidentDeviceManagerRoar *)self _sendResidentDeviceNotificationWithName:@"HMDResidentDeviceManagerUpdatePrimaryResidentGenerationIDNotification" forResidentDevice:v5];
}

- (void)notifyUpdatedPrimaryResident:(id)a3 previousPrimaryResident:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__HMDResidentDeviceManagerRoar_notifyUpdatedPrimaryResident_previousPrimaryResident___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __85__HMDResidentDeviceManagerRoar_notifyUpdatedPrimaryResident_previousPrimaryResident___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _sendResidentDeviceNotificationWithName:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" forResidentDevice:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) localNetworkElection];
  [v2 primaryResidentChanged:*(void *)(a1 + 40) previousResidentDevice:*(void *)(a1 + 48)];

  if (*(void *)(a1 + 40))
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    [v3 residentDeviceManager:*(void *)(a1 + 32) didUpdatePrimaryResident:*(void *)(a1 + 40) previousPrimaryResident:*(void *)(a1 + 48)];

    BOOL v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 40);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)int buf = 138543362;
      int v16 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of resident device confirmed state changing to YES", buf, 0xCu);
    }
    id v8 = [*(id *)(a1 + 32) notificationCenter];
    v13[0] = @"HMDResidentDeviceHomeUUIDNotificationKey";
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = objc_msgSend(*(id *)(a1 + 32), "home", @"HMDResidentDeviceHomeUUIDNotificationKey");
    BOOL v11 = [v10 uuid];
    v13[1] = @"HMDResidentDeviceResidentNotificationKey";
    v14[0] = v11;
    v14[1] = *(void *)(a1 + 40);
    id v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    [v8 postNotificationName:@"HMDResidentDeviceConfirmedStateChangedNotification" object:v9 userInfo:v12];

    [*(id *)(a1 + 32) _notifyUpdatedGenerationIDWithPrimaryResident:*(void *)(a1 + 40)];
  }
}

- (void)notifyClientsOfUpdatedResidentDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDResidentDeviceManagerRoar *)self residentDevices];
  char v6 = [v5 containsObject:v4];

  if (v6)
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __69__HMDResidentDeviceManagerRoar_notifyClientsOfUpdatedResidentDevice___block_invoke;
    v12[3] = &unk_264A2F820;
    void v12[4] = self;
    id v13 = v4;
    dispatch_async(queue, v12);
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v11 = HMFGetLogIdentifier();
      *(_DWORD *)int buf = 138543618;
      int v15 = v11;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Not notifying clients of updated resident %@ since it is not in the resident devices list", buf, 0x16u);
    }
  }
}

void __69__HMDResidentDeviceManagerRoar_notifyClientsOfUpdatedResidentDevice___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v11 = 138543618;
    id v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of updated resident: %@", (uint8_t *)&v11, 0x16u);
  }
  id v7 = [*(id *)(a1 + 32) delegate];
  [v7 residentDeviceManagerDidUpdateResidents:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) _sendResidentDeviceNotificationWithName:@"HMDResidentDeviceManagerUpdateResidentNotification" forResidentDevice:*(void *)(a1 + 40)];
  id v8 = [*(id *)(a1 + 32) home];
  uint64_t v9 = [v8 homeManager];
  id v10 = [*(id *)(a1 + 40) identifier];
  [v9 updateGenerationCounterWithReason:@"ResidentDeviceUpdated" sourceUUID:v10 shouldNotifyClients:1];

  [v8 reEvaluateHomeHubState];
  [v8 evaluateResidentUpdate];
  [v8 evaluateBulletinNotificationsSupported];
}

- (void)notifyResidentAvailable:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__HMDResidentDeviceManagerRoar_notifyResidentAvailable___block_invoke;
  v4[3] = &unk_264A2B870;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

void __56__HMDResidentDeviceManagerRoar_notifyResidentAvailable___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 residentDeviceManager:*(void *)(a1 + 32) didUpdateResidentAvailable:*(unsigned __int8 *)(a1 + 40)];
}

- (void)accountOrDeviceDidUpdate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__HMDResidentDeviceManagerRoar_accountOrDeviceDidUpdate___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __57__HMDResidentDeviceManagerRoar_accountOrDeviceDidUpdate___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) name];
    int v7 = [*(id *)(a1 + 32) isResidentSupported];
    int v9 = 138543874;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v6;
    __int16 v13 = 1024;
    int v14 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling notification: %{public}@. self.isResidentSupported: %d", (uint8_t *)&v9, 0x1Cu);
  }
  return [*(id *)(a1 + 32) _configureResidentSupported];
}

- (void)setResidentSupported:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v5 = (void *)MEMORY[0x230FBD990](self, a2);
  id v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = HMFBooleanToString();
    int v16 = 138543618;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@ResidentSupported = %@", (uint8_t *)&v16, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  v6->_residentSupported = v3;
  os_unfair_lock_unlock(&v6->_lock);
  id v10 = [(HMDResidentDeviceManagerRoar *)v6 notificationCenter];
  __int16 v11 = [(HMDResidentDeviceManagerRoar *)v6 appleAccountManager];
  if (v3)
  {
    [v10 removeObserver:v6 name:@"HMDAppleAccountManagerDeviceUpdatedNotification" object:v11];
  }
  else
  {
    [v10 removeObserver:v6 name:@"HMDAppleAccountManagerResolved" object:v11];

    id v12 = [(HMDResidentDeviceManagerRoar *)v6 notificationCenter];
    __int16 v13 = [(HMDResidentDeviceManagerRoar *)v6 appleAccountManager];
    [v12 removeObserver:v6 name:@"HMDAppleAccountManagerDeviceUpdatedNotification" object:v13];

    int v14 = [(HMDResidentDeviceManagerRoar *)v6 notificationCenter];
    uint64_t v15 = [(HMDResidentDeviceManagerRoar *)v6 appleAccountManager];
    [v14 addObserver:v6 selector:sel_accountOrDeviceDidUpdate_ name:@"HMDAppleAccountManagerResolved" object:v15];

    id v10 = [(HMDResidentDeviceManagerRoar *)v6 notificationCenter];
    __int16 v11 = [(HMDResidentDeviceManagerRoar *)v6 appleAccountManager];
    [v10 addObserver:v6 selector:sel_accountOrDeviceDidUpdate_ name:@"HMDAppleAccountManagerDeviceUpdatedNotification" object:v11];
  }
}

- (BOOL)isResidentSupported
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_residentSupported;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_updatePrimaryResidentGenerationID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  os_unfair_lock_lock_with_options();
  id v6 = self->_primaryResidentGenerationID;
  char v7 = HMFEqualObjects();
  if (v7)
  {

    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_primaryResidentGenerationID, a3);

    os_unfair_lock_unlock(&self->_lock);
    id v8 = (void *)MEMORY[0x230FBD990]();
    int v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = HMFGetLogIdentifier();
      int v14 = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating primaryResidentGenerationID = %{public}@", (uint8_t *)&v14, 0x16u);
    }
    id v12 = [(HMDResidentDeviceManagerRoar *)v9 primaryResidentDevice];
    [(HMDResidentDeviceManagerRoar *)v9 _notifyUpdatedGenerationIDWithPrimaryResident:v12];
  }
  return v7 ^ 1;
}

- (NSUUID)primaryResidentGenerationID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_primaryResidentGenerationID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setResidentAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = [(HMDResidentDeviceManagerRoar *)self queue];
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_lock_with_options();
  if (self->_residentSupported)
  {
    if (self->_residentAvailable == v3)
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      self->_residentAvailable = v3;
      os_unfair_lock_unlock(&self->_lock);
      if (v3)
      {
        id v6 = [(HMDResidentDeviceManagerRoar *)self primaryResidentUUID];

        if (v6)
        {
          char v7 = [(HMDResidentDeviceManagerRoar *)self primaryResidentUUID];
          id v8 = [(HMDResidentDeviceManagerRoar *)self residentWithUUID:v7];

          if (v8)
          {
            [(HMDResidentDeviceManagerRoar *)self notifyUpdatedPrimaryResident:v8 previousPrimaryResident:0];
          }
          else
          {
            int v14 = (void *)MEMORY[0x230FBD990]();
            uint64_t v15 = self;
            __int16 v16 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              id v17 = HMFGetLogIdentifier();
              uint64_t v18 = [(HMDResidentDeviceManagerRoar *)v15 primaryResidentUUID];
              int v19 = 138543618;
              uint64_t v20 = v17;
              __int16 v21 = 2114;
              uint64_t v22 = v18;
              _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Primary resident UUID is set to %{public}@, but cannot find the primary resident device", (uint8_t *)&v19, 0x16u);
            }
          }
        }
        else
        {
          id v10 = (void *)MEMORY[0x230FBD990]();
          __int16 v11 = self;
          id v12 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v13 = HMFGetLogIdentifier();
            int v19 = 138543362;
            uint64_t v20 = v13;
            _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Primary resident UUID is not set, cannot find the primary resident device (yet)", (uint8_t *)&v19, 0xCu);
          }
        }
        [(HMDResidentDeviceManagerRoar *)self _discoverPrimaryResidentForRequester:0];
      }
      else
      {
        int v9 = [(HMDResidentDeviceManagerRoar *)self primaryDiscoveryManager];
        [v9 cancel];
      }
    }
    [(HMDResidentDeviceManagerRoar *)self notifyResidentAvailable:v3];
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (BOOL)hasAnyResident
{
  BOOL v3 = [(HMDResidentDeviceManagerRoar *)self residentDevicesSet];
  int v4 = objc_msgSend(v3, "hmf_isEmpty");

  if (!v4) {
    return 1;
  }
  id v5 = [(HMDResidentDeviceManagerRoar *)self backingStore];
  char v6 = [v5 hasAnyResident];

  return v6;
}

- (BOOL)isResidentAvailable
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_residentAvailable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_updateResidentAvailability:(BOOL)a3
{
  LODWORD(v3) = a3;
  id v5 = [(HMDResidentDeviceManagerRoar *)self availableResidentDevices];
  if ([v5 count]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = v3;
  }

  [(HMDResidentDeviceManagerRoar *)self setResidentAvailable:v3];
}

- (void)updateResidentAvailability
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__HMDResidentDeviceManagerRoar_updateResidentAvailability__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __58__HMDResidentDeviceManagerRoar_updateResidentAvailability__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateResidentAvailability:0];
}

- (void)removeResidentDevice:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__HMDResidentDeviceManagerRoar_removeResidentDevice___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __53__HMDResidentDeviceManagerRoar_removeResidentDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeResidentDevice:*(void *)(a1 + 40)];
}

- (void)_checkPrimaryResidentDeviceRemoved:(id)a3 currentPrimary:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableSet *)self->_residentDevices count];
  int v9 = [v7 isEqual:v6];
  id v10 = [(HMDResidentDeviceManagerRoar *)self primaryResidentDevice];

  __int16 v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  __int16 v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = HMFGetLogIdentifier();
    int v16 = 138543618;
    id v17 = v14;
    __int16 v18 = 2048;
    uint64_t v19 = v8;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Removed residentDevice is current device. There are %lu residents remaining.", (uint8_t *)&v16, 0x16u);
  }
  if (v10) {
    int v15 = 0;
  }
  else {
    int v15 = v9;
  }
  if (v15 == 1) {
    [(HMDResidentDeviceManagerRoar *)v12 _handleUpdatedPrimaryResidentDevice:0 previousPrimaryResident:v7 generationID:0 changeSource:0];
  }
}

- (void)_removeResidentDevice:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HMDResidentDeviceManagerRoar *)self primaryResidentDevice];
    os_unfair_lock_lock_with_options();
    if ([(NSMutableSet *)self->_residentDevices containsObject:v4])
    {
      [(NSMutableSet *)self->_residentDevices removeObject:v4];
      os_unfair_lock_unlock(&self->_lock);
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __54__HMDResidentDeviceManagerRoar__removeResidentDevice___block_invoke;
      block[3] = &unk_264A2F2F8;
      block[4] = self;
      id v8 = v4;
      id v9 = v5;
      dispatch_async(queue, block);
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
  }
}

void __54__HMDResidentDeviceManagerRoar__removeResidentDevice___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 residentDeviceManagerDidUpdateResidents:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) _sendResidentDeviceNotificationWithName:@"HMDResidentDeviceManagerRemoveResidentNotification" forResidentDevice:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 32) home];
  [v3 reEvaluateHomeHubState];
  [v3 evaluateResidentUpdate];
  [v3 evaluateBulletinNotificationsSupported];
  [*(id *)(a1 + 32) _updateResidentAvailability:0];
  id v4 = [*(id *)(a1 + 40) device];
  v7[0] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [v3 disableNotificationsForDevices:v5];

  [*(id *)(a1 + 32) _checkPrimaryResidentDeviceRemoved:*(void *)(a1 + 40) currentPrimary:*(void *)(a1 + 48)];
  if ([*(id *)(a1 + 40) isCurrentDevice])
  {
    id v6 = [*(id *)(a1 + 32) localNetworkElection];
    [v6 stop];
  }
}

- (void)_addResidentDevice:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDResidentDeviceManagerRoar *)self queue];
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_lock_with_options();
  id v6 = [(NSMutableSet *)self->_residentDevices member:v4];
  if (v6)
  {

    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_31;
  }
  [(NSMutableSet *)self->_residentDevices addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)int buf = 138543618;
    long long v42 = v10;
    __int16 v43 = 2112;
    id v44 = v4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Added resident device %@", buf, 0x16u);
  }
  __int16 v11 = [(HMDResidentDeviceManagerRoar *)v8 home];
  [v4 configureWithHome:v11];
  id v12 = [(HMDResidentDeviceManagerRoar *)v8 primaryResidentUUID];
  BOOL v13 = v12 == 0;

  if (v13) {
    [v4 setReachable:0];
  }
  if ([(HMDResidentDeviceManagerRoar *)v8 isCurrentDeviceConfirmedPrimaryResident])
  {
    if (([v4 isReachable] & 1) == 0)
    {
      int v14 = [(HMDResidentDeviceManagerRoar *)v8 localNetworkElection];
      int v15 = [v14 residentIsPartOfTheCurrentMesh:v4];

      if (v15)
      {
        [(HMDResidentDeviceManagerRoar *)v8 _updateReachability:1 forResidentDevice:v4];
        int v16 = [(HMDResidentDeviceManagerRoar *)v8 backingStore];
        id v17 = [MEMORY[0x263EFFA08] setWithObject:v4];
        [v16 updateReachabilityForResidents:v17];
      }
    }
  }
  [(HMDResidentDeviceManagerRoar *)v8 _updateResidentAvailability:0];
  __int16 v18 = [(HMDResidentDeviceManagerRoar *)v8 delegate];
  [v18 residentDeviceManagerDidUpdateResidents:v8];

  [(HMDResidentDeviceManagerRoar *)v8 _sendResidentDeviceNotificationWithName:@"HMDResidentDeviceManagerAddResidentNotification" forResidentDevice:v4];
  [v11 reEvaluateHomeHubState];
  [v11 evaluateBulletinNotificationsSupported];
  uint64_t v19 = [(HMDResidentDeviceManagerRoar *)v8 primaryResidentUUID];
  uint64_t v20 = [v4 identifier];
  if ([v19 isEqual:v20])
  {
  }
  else
  {
    __int16 v21 = [(HMDResidentDeviceManagerRoar *)v8 primaryResidentDevice];
    uint64_t v22 = [v21 device];
    if (![v22 isCurrentDevice])
    {

      goto LABEL_18;
    }
    int v23 = [v4 isEnabled];

    if (!v23) {
      goto LABEL_19;
    }
  }
  uint64_t v19 = [v4 device];
  long long v40 = v19;
  uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
  [v11 enableNotificationsForDevices:v20];
LABEL_18:

LABEL_19:
  uint64_t v24 = [v4 device];
  if ([v24 isCurrentDevice])
  {
    __int16 v25 = [v11 homeManager];
    v26 = [v25 currentAccessorySetupMetricDispatcher];
    uint64_t v27 = (void *)MEMORY[0x230FBD990]([v26 markSetupBeginStage:14 error:0]);
    char v28 = v8;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = HMFGetLogIdentifier();
      uint64_t v31 = [v11 residentSelectionVersion];
      *(_DWORD *)int buf = 138543618;
      long long v42 = v30;
      __int16 v43 = 2114;
      id v44 = v31;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@Current device added as resident to home with resident selection version %{public}@", buf, 0x16u);
    }
    uint64_t v32 = [v11 residentSelectionVersion];
    BOOL v33 = [v32 integerValue] > 2;

    long long v34 = (void *)MEMORY[0x230FBD990]();
    long long v35 = v28;
    long long v36 = HMFGetOSLogHandle();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_INFO);
    if (v33)
    {
      if (v37)
      {
        char v38 = HMFGetLogIdentifier();
        *(_DWORD *)int buf = 138543362;
        long long v42 = v38;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@Backing off from joining mesh since home's resident selection version is higher", buf, 0xCu);
      }
    }
    else
    {
      if (v37)
      {
        long long v39 = HMFGetLogIdentifier();
        *(_DWORD *)int buf = 138543362;
        long long v42 = v39;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@Will attempt to join mesh.", buf, 0xCu);
      }
      [(HMDResidentDeviceManagerRoar *)v35 _joinLocalMesh];
    }
  }
LABEL_31:
}

- (id)residentDeviceForDevice:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_residentDevices;
  id v7 = (id)[(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        __int16 v11 = objc_msgSend(v10, "device", (void)v14);
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (HMFFuture)cloudReady
{
  return (HMFFuture *)[MEMORY[0x263F42538] futureWithNoValue];
}

- (HMDDevice)confirmedPrimaryResidentDevice
{
  id v2 = [(HMDResidentDeviceManagerRoar *)self primaryResidentDevice];
  uint64_t v3 = [v2 device];

  return (HMDDevice *)v3;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  id v2 = [(HMDResidentDeviceManagerRoar *)self primaryResidentDevice];
  char v3 = [v2 isCurrentDevice];

  return v3;
}

- (BOOL)isCurrentDeviceAvailableResident
{
  id v2 = [(HMDResidentDeviceManagerRoar *)self ourSelf];
  char v3 = [v2 isEnabled];

  return v3;
}

- (id)residentDevicesSet
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableSet *)self->_residentDevices copy];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)residentDevices
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableSet *)self->_residentDevices allObjects];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)ourSelf
{
  id v2 = [(HMDResidentDeviceManagerRoar *)self residentDevices];
  char v3 = objc_msgSend(v2, "hmf_objectPassingTest:", &__block_literal_global_169820);

  return v3;
}

uint64_t __39__HMDResidentDeviceManagerRoar_ourSelf__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 device];
  uint64_t v3 = [v2 isCurrentDevice];

  return v3;
}

- (id)residentWithUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(HMDResidentDeviceManagerRoar *)self residentDevices];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 identifier];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSUUID)primaryResidentUUID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_primaryResidentUUID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMDResidentDevice)primaryResidentDevice
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDResidentDeviceManagerRoar *)self residentDevicesSet];
  id v4 = [(HMDResidentDeviceManagerRoar *)self primaryResidentUUID];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "identifier", (void)v13);
        char v11 = [v4 isEqual:v10];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (HMDResidentDevice *)v6;
}

- (void)addDataSource:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x230FBD990]();
  uint64_t v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = NSStringFromSelector(a2);
    int v11 = 138543618;
    char v12 = v9;
    __int16 v13 = 2112;
    long long v14 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", (uint8_t *)&v11, 0x16u);
  }
}

- (void)_teardownSessionWithPrimaryResidentDevice
{
  id v4 = [(HMDResidentDeviceManagerRoar *)self messageDispatcher];
  uint64_t v3 = [(HMDResidentDeviceManagerRoar *)self home];
  [v4 setRemoteAccessDevice:0 forHome:v3];
}

- (void)_setupSessionWithPrimaryResidentDevice
{
  id v6 = [(HMDResidentDeviceManagerRoar *)self primaryResidentDevice];
  if (v6)
  {
    uint64_t v3 = [(HMDResidentDeviceManagerRoar *)self messageDispatcher];
    id v4 = [v6 device];
    id v5 = [(HMDResidentDeviceManagerRoar *)self home];
    [v3 setRemoteAccessDevice:v4 forHome:v5];
  }
}

- (void)_run
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    int v17 = 138543362;
    uint64_t v18 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Starting", (uint8_t *)&v17, 0xCu);
  }
  uint64_t v7 = [(HMDResidentDeviceManagerRoar *)v4 home];
  uint64_t v8 = [(HMDResidentDeviceManagerRoar *)v4 primaryResidentDevice];
  if (v8 && [(HMDResidentDeviceManagerRoar *)v4 isResidentSupported])
  {
    [v7 subscribeForNotificationsFromRemoteGateway];
  }
  else
  {
    id v9 = [(HMDResidentDeviceManagerRoar *)v4 messageDispatcher];
    id v10 = [v9 remoteAccessDeviceForHome:v7];

    int v11 = [v10 capabilities];
    int v12 = [v11 isResidentCapable];

    if (v12)
    {
      __int16 v13 = (void *)MEMORY[0x230FBD990]();
      long long v14 = v4;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        long long v16 = HMFGetLogIdentifier();
        int v17 = 138543618;
        uint64_t v18 = v16;
        __int16 v19 = 2112;
        uint64_t v20 = v10;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Tearing down remote access to device: %@", (uint8_t *)&v17, 0x16u);
      }
      [(HMDResidentDeviceManagerRoar *)v14 _teardownSessionWithPrimaryResidentDevice];
    }
  }
}

- (void)run
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__HMDResidentDeviceManagerRoar_run__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __35__HMDResidentDeviceManagerRoar_run__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _run];
}

- (void)atHomeLevelChanged:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x230FBD990](self, a2, a3);
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    id v9 = NSStringFromSelector(a2);
    int v10 = 138543618;
    int v11 = v8;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", (uint8_t *)&v10, 0x16u);
  }
}

- (void)confirmOnAvailability
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    uint64_t v8 = NSStringFromSelector(a2);
    int v9 = 138543618;
    int v10 = v7;
    __int16 v11 = 2112;
    __int16 v12 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", (uint8_t *)&v9, 0x16u);
  }
}

- (void)confirmAsResident
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    uint64_t v8 = NSStringFromSelector(a2);
    int v9 = 138543618;
    int v10 = v7;
    __int16 v11 = 2112;
    __int16 v12 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", (uint8_t *)&v9, 0x16u);
  }
}

- (void)confirmWithCompletionHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = (void (**)(id, void))a3;
  id v6 = (void *)MEMORY[0x230FBD990]();
  uint64_t v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = HMFGetLogIdentifier();
    int v10 = NSStringFromSelector(a2);
    int v11 = 138543618;
    __int16 v12 = v9;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", (uint8_t *)&v11, 0x16u);
  }
  if (v5) {
    v5[2](v5, 0);
  }
}

- (BOOL)hasTrustZoneCapableResident
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = [[HMDHomeKitVersion alloc] initWithVersionString:@"6.1"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(HMDResidentDeviceManagerRoar *)self residentDevices];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) device];
        int v9 = [v8 version];
        char v10 = [v9 isAtLeastVersion:v3];

        if (v10)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)isResidentElectionV2Enabled
{
  return 1;
}

- (void)_handleCloudResidentChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDResidentDeviceManagerRoar *)self appleAccountManager];
  uint64_t v6 = [v5 device];

  uint64_t v7 = [(HMDResidentDeviceManagerRoar *)self backingStore];
  uint64_t v8 = [(HMDResidentDeviceManagerRoar *)self residentDevicesSet];
  int v9 = objc_msgSend(v7, "handleCloudResidentChange:currentResidents:isCurrentDevicePrimaryResident:currentDevice:", v4, v8, -[HMDResidentDeviceManagerRoar isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident"), v6);

  char v10 = [v9 addedResidentDevices];
  if (![v10 count])
  {
    int v11 = [v9 deletedResidentDevices];
    if (![v11 count])
    {
      long long v13 = [v9 reachabilityUpdates];
      uint64_t v14 = [v13 count];

      if (!v14) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __59__HMDResidentDeviceManagerRoar__handleCloudResidentChange___block_invoke;
  v15[3] = &unk_264A2F820;
  v15[4] = self;
  id v16 = v9;
  dispatch_async(queue, v15);

LABEL_6:
}

void __59__HMDResidentDeviceManagerRoar__handleCloudResidentChange___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = [*(id *)(a1 + 40) addedResidentDevices];
    uint64_t v7 = [v6 count];
    uint64_t v8 = [*(id *)(a1 + 40) deletedResidentDevices];
    uint64_t v9 = [v8 count];
    char v10 = [*(id *)(a1 + 40) reachabilityUpdates];
    *(_DWORD *)int buf = 138544130;
    uint64_t v18 = v5;
    __int16 v19 = 2048;
    uint64_t v20 = v7;
    __int16 v21 = 2048;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = [v10 count];
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Residents changed, added: %lu; removed: %lu; reachability: %lu",
      buf,
      0x2Au);
  }
  int v11 = [*(id *)(a1 + 40) deletedResidentDevices];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__HMDResidentDeviceManagerRoar__handleCloudResidentChange___block_invoke_148;
  v16[3] = &unk_264A2A788;
  void v16[4] = *(void *)(a1 + 32);
  objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v16);

  long long v12 = [*(id *)(a1 + 40) addedResidentDevices];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __59__HMDResidentDeviceManagerRoar__handleCloudResidentChange___block_invoke_150;
  v15[3] = &unk_264A2A788;
  v15[4] = *(void *)(a1 + 32);
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v15);

  long long v13 = [*(id *)(a1 + 40) reachabilityUpdates];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = __59__HMDResidentDeviceManagerRoar__handleCloudResidentChange___block_invoke_151;
  v14[3] = &unk_264A2A788;
  v14[4] = *(void *)(a1 + 32);
  objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);
}

void __59__HMDResidentDeviceManagerRoar__handleCloudResidentChange___block_invoke_148(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    uint64_t v8 = [v3 name];
    uint64_t v9 = [v3 identifier];
    int v10 = 138543874;
    int v11 = v7;
    __int16 v12 = 2112;
    long long v13 = v8;
    __int16 v14 = 2114;
    long long v15 = v9;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Cloud removed resident: %@ (%{public}@)", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(a1 + 32) _removeResidentDevice:v3];
}

void __59__HMDResidentDeviceManagerRoar__handleCloudResidentChange___block_invoke_150(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    uint64_t v8 = [v3 name];
    uint64_t v9 = [v3 identifier];
    int v10 = 138543874;
    int v11 = v7;
    __int16 v12 = 2112;
    long long v13 = v8;
    __int16 v14 = 2114;
    long long v15 = v9;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Cloud added resident: %@ (%{public}@)", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(a1 + 32) _addResidentDevice:v3];
}

void __59__HMDResidentDeviceManagerRoar__handleCloudResidentChange___block_invoke_151(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 isReachable] ^ 1;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = [v3 name];
    int v10 = [v3 identifier];
    int v11 = HMFBooleanToString();
    int v12 = 138544130;
    long long v13 = v8;
    __int16 v14 = 2112;
    long long v15 = v9;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    __int16 v19 = v11;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Cloud updated resident reachability: %@ (%{public}@) -> %@", (uint8_t *)&v12, 0x2Au);
  }
  [*(id *)(a1 + 32) _updateReachability:v4 forResidentDevice:v3];
}

- (id)residentDevicesWithIDSIdentifiers:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDResidentDeviceManagerRoar *)self availableResidentDevices];
  id v6 = [MEMORY[0x263EFF980] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __66__HMDResidentDeviceManagerRoar_residentDevicesWithIDSIdentifiers___block_invoke;
        v16[3] = &unk_264A2A830;
        void v16[4] = v12;
        long long v13 = objc_msgSend(v5, "na_firstObjectPassingTest:", v16);
        if (v13) {
          [v6 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  __int16 v14 = (void *)[v6 copy];
  return v14;
}

uint64_t __66__HMDResidentDeviceManagerRoar_residentDevicesWithIDSIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 device];
  id v4 = [v3 idsIdentifier];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

- (id)residentDeviceWithIDSIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = self->_residentDevices;
  id v7 = (id)[(NSMutableSet *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v11 = objc_msgSend(v10, "device", (void)v15);
        uint64_t v12 = [v11 idsIdentifier];
        char v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[(NSMutableSet *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)localPreferredResidentList
{
  return 0;
}

- (HMDResidentSelectionStatusKit)presentResidentsStatuses
{
  return 0;
}

- (HMDPreferredResidentsList)electorsPreferredResidentsList
{
  return 0;
}

- (HMDResidentSelectionInfo)residentSelectionInfo
{
  return 0;
}

- (void)_joinLocalMesh
{
  v38[3] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(HMDResidentDeviceManagerRoar *)self home];
  v26 = [v3 homeManager];

  id v4 = [v26 currentAccessorySetupMetricDispatcher];
  id v5 = objc_alloc(MEMORY[0x263F42520]);
  id v6 = [(HMDResidentDeviceManagerRoar *)self queue];
  id v7 = (void *)[v5 initWithQueue:v6];

  uint64_t v8 = [(HMDResidentDeviceManagerRoar *)self appleAccountManager];
  uint64_t v9 = [v8 idsDevicesUpdated];

  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke;
  v36[3] = &unk_264A2C678;
  v36[4] = self;
  id v10 = v4;
  id v37 = v10;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_139;
  v35[3] = &unk_264A2C4C8;
  v35[4] = self;
  id v11 = (id)[v9 inContext:v7 then:v36 orRecover:v35];
  uint64_t v12 = [(HMDResidentDeviceManagerRoar *)self dataSource];
  char v13 = [v12 firstCloudKitImportFuture];

  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_141;
  v33[3] = &unk_264A2C678;
  v33[4] = self;
  id v14 = v10;
  id v34 = v14;
  id v15 = (id)[v13 inContext:v7 then:v33];
  long long v16 = [(HMDResidentDeviceManagerRoar *)self messageDispatcher];
  long long v17 = [v16 secureRemoteTransport];
  long long v18 = [v17 startFuture];

  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_142;
  v31[3] = &unk_264A2C678;
  v31[4] = self;
  id v19 = v14;
  id v32 = v19;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_143;
  v30[3] = &unk_264A2C4C8;
  v30[4] = self;
  id v20 = (id)[v18 inContext:v7 then:v31 orRecover:v30];
  __int16 v21 = (void *)MEMORY[0x263F42538];
  v38[0] = v18;
  v38[1] = v13;
  v38[2] = v9;
  uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:3];
  __int16 v23 = [v21 allSettled:v22];

  v27[4] = self;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_144;
  v28[3] = &unk_264A2C678;
  v28[4] = self;
  id v29 = v19;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_145;
  v27[3] = &unk_264A2C4C8;
  id v24 = v19;
  id v25 = (id)[v23 inContext:v7 then:v28 orRecover:v27];
}

uint64_t __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Peer devices settled.", (uint8_t *)&v9, 0xCu);
  }
  [*(id *)(a1 + 40) markPrimaryResidentElectionPeerDeviceFutureResolved];

  return 1;
}

uint64_t __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_139(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Peer devices settled with error: %@.", (uint8_t *)&v9, 0x16u);
  }

  return 1;
}

uint64_t __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_141(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@First CloudKit import promise resolved.", (uint8_t *)&v9, 0xCu);
  }
  [*(id *)(a1 + 40) markPrimaryResidentElectionFirstCloudKitImportFutureResolved];

  return 1;
}

uint64_t __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_142(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Modern Transport Started.", (uint8_t *)&v9, 0xCu);
  }
  [*(id *)(a1 + 40) markPrimaryResidentElectionModernTransportStartedFutureResolved];

  return 1;
}

uint64_t __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_143(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Modern Transport start returned error: %@.", (uint8_t *)&v9, 0x16u);
  }

  return 1;
}

uint64_t __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_144(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = [v4 homeManager];
  int v6 = [v5 badCDPState];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v22 = 138543362;
      __int16 v23 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Operating in bad CDP state. Not joining the mesh", (uint8_t *)&v22, 0xCu);
    }
  }
  else if (([*(id *)(a1 + 32) isActingAsResident] & 1) == 0)
  {
    __int16 v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      int v22 = 138543362;
      __int16 v23 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Met conditions required to join mesh, starting join.", (uint8_t *)&v22, 0xCu);
    }
    [*(id *)(a1 + 40) markPrimaryResidentElectionJoinMesh];
    [*(id *)(a1 + 32) setActingAsResident:1];
    [*(id *)(a1 + 32) _startLocalNetworkElection];
    id v15 = [*(id *)(a1 + 32) primaryResidentDevice];
    if (v15)
    {
      long long v16 = [*(id *)(a1 + 32) reachabilityObserver];
      uint64_t v17 = *(void *)(a1 + 32);
      long long v18 = [v15 messageAddress];
      [v16 removeListener:v17 forDeviceAddress:v18];

      id v19 = [*(id *)(a1 + 32) deviceMonitor];
      id v20 = [v15 device];
      [v19 stopMonitoringDevice:v20 forClient:*(void *)(a1 + 32)];
    }
  }

  return 1;
}

uint64_t __46__HMDResidentDeviceManagerRoar__joinLocalMesh__block_invoke_145(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  int v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Could not join the mesh. One of the conditions to join was not met", (uint8_t *)&v9, 0xCu);
  }

  return 1;
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__HMDResidentDeviceManagerRoar_invalidate__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __42__HMDResidentDeviceManagerRoar_invalidate__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) notificationCenter];
  [v2 removeObserver:*(void *)(a1 + 32)];

  id v3 = *(void **)(a1 + 32);
  return [v3 _stopLocalNetworkElection];
}

- (void)_configureResidentSupported
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(HMDResidentDeviceManagerRoar *)self appleAccountManager];
  id v4 = [v3 device];

  if (v4)
  {
    if (![(HMDResidentDeviceManagerRoar *)self isResidentSupported])
    {
      char v20 = 0;
      id v5 = [(HMDResidentDeviceManagerRoar *)self backingStore];
      int v6 = [v5 findResidents:v4 outHasResidents:&v20];

      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __59__HMDResidentDeviceManagerRoar__configureResidentSupported__block_invoke;
      v19[3] = &unk_264A2A710;
      v19[4] = self;
      id v7 = (void *)MEMORY[0x230FBD990](objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v19));
      id v8 = self;
      int v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = HMFGetLogIdentifier();
        uint64_t v11 = [(HMDResidentDeviceManagerRoar *)v8 residentDevices];
        *(_DWORD *)int buf = 138543618;
        int v22 = v10;
        __int16 v23 = 2114;
        uint64_t v24 = v11;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Initial resident devices: %{public}@", buf, 0x16u);
      }
      id v12 = [(HMDResidentDeviceManagerRoar *)v8 residentDevices];
      if ([v12 count]) {
        BOOL v13 = 1;
      }
      else {
        BOOL v13 = v20 == 0;
      }
      uint64_t v14 = !v13;

      if (v14 == 1)
      {
        id v15 = (void *)MEMORY[0x230FBD990]();
        long long v16 = v8;
        uint64_t v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          long long v18 = HMFGetLogIdentifier();
          *(_DWORD *)int buf = 138543362;
          int v22 = v18;
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@No HMDResidentDevice but has MKFResident models, force update", buf, 0xCu);
        }
      }
      [(HMDResidentDeviceManagerRoar *)v8 setResidentSupported:1];
      [(HMDResidentDeviceManagerRoar *)v8 _updateResidentAvailability:v14];
    }
  }
  else
  {
    [(HMDResidentDeviceManagerRoar *)self setResidentSupported:0];
  }
}

void __59__HMDResidentDeviceManagerRoar__configureResidentSupported__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(*(void *)(a1 + 32) + 272);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [v5 configureWithHome:WeakRetained];

  [*(id *)(a1 + 32) _addResidentDevice:v5];
}

- (void)_stopLocalNetworkElection
{
  [(HMDResidentDeviceManagerRoar *)self setActingAsResident:0];
  id v3 = [(HMDResidentDeviceManagerRoar *)self localNetworkElection];
  [v3 stop];

  [(HMDResidentDeviceManagerRoar *)self setLocalNetworkElection:0];
}

- (void)_startLocalNetworkElection
{
  id v3 = [(HMDResidentDeviceManagerRoar *)self dataSource];
  id v4 = [v3 createElectionAddOnWithContext:self];
  [(HMDResidentDeviceManagerRoar *)self setLocalNetworkElection:v4];

  id v5 = [(HMDResidentDeviceManagerRoar *)self localNetworkElection];
  [v5 setDelegate:self];

  int v6 = [(HMDResidentDeviceManagerRoar *)self localNetworkElection];
  [v6 registerForMessages];

  id v7 = [(HMDResidentDeviceManagerRoar *)self localNetworkElection];
  [v7 start];
}

- (void)_registerForNotifications
{
  id v3 = [(HMDResidentDeviceManagerRoar *)self notificationCenter];
  id v4 = [(HMDResidentDeviceManagerRoar *)self backingStore];
  id v5 = [v4 cloudChangeUpdateNotificationName];
  [v3 addObserver:self selector:sel__handleCloudResidentChange_ name:v5 object:0];

  int v6 = [(HMDResidentDeviceManagerRoar *)self notificationCenter];
  [v6 addObserver:self selector:sel__handleRemoteDeviceIsReachable_ name:@"HMDRemoteDeviceIsReachableNotification" object:0];

  id v7 = [(HMDResidentDeviceManagerRoar *)self notificationCenter];
  [v7 addObserver:self selector:sel__handleRemoteDeviceIsNotReachable_ name:@"HMDRemoteDeviceIsNotReachableNotification" object:0];

  id v9 = [(HMDResidentDeviceManagerRoar *)self notificationCenter];
  id v8 = [(HMDResidentDeviceManagerRoar *)self home];
  [v9 addObserver:self selector:sel__handleResidentSelectionVersionDidChange_ name:@"HMDHomeResidentSelectionVersionDidChangeNotification" object:v8];
}

- (void)_registerForMessages
{
  v18[3] = *MEMORY[0x263EF8340];
  id v3 = [(HMDResidentDeviceManagerRoar *)self home];
  id v4 = [(HMDResidentDeviceManagerRoar *)self messageDispatcher];
  id v5 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v3 userPrivilege:3 remoteAccessRequired:0];
  int v6 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v18[0] = v6;
  v18[1] = v5;
  id v7 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  v18[2] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  [v4 registerForMessage:@"kResidentDeviceUpdateEnabledRequestKey" receiver:self policies:v8 selector:sel__handleResidentDeviceUpdateEnabled_];

  id v9 = +[HMDRemoteMessagePolicy defaultPolicy];
  id v10 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v3 userPrivilege:5 remoteAccessRequired:0];
  if (isInternalBuild())
  {
    uint64_t v11 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    v17[0] = v11;
    v17[1] = v10;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    [v4 registerForMessage:@"hm.prdisco" receiver:self policies:v12 selector:sel__handlePrimaryResidentDiscoveryXPCRequest_];
  }
  BOOL v13 = [(HMDResidentDeviceManagerRoar *)self dataSource];
  int v14 = [v13 isResidentCapable];

  if (v14)
  {
    v16[0] = v9;
    v16[1] = v10;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
    [v4 registerForMessage:@"primaryResidentDiscovery" receiver:self policies:v15 selector:sel__handlePrimaryResidentDiscoveryRequest_];
  }
}

- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__HMDResidentDeviceManagerRoar_configureWithHome_messageDispatcher___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __68__HMDResidentDeviceManagerRoar_configureWithHome_messageDispatcher___block_invoke(id *a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  [a1[4] setHome:a1[5]];
  id v2 = [a1[4] dataSource];
  uint64_t v3 = [v2 logIdentifierForHome:a1[5]];
  id v4 = a1[4];
  id v5 = (void *)v4[12];
  v4[12] = v3;

  uint64_t v6 = [a1[5] uuid];
  id v7 = a1[4];
  id v8 = (void *)v7[11];
  v7[11] = v6;

  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = a1[4];
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    isInternalBuild();
    id v13 = HMFBooleanToString();
    int v14 = [a1[4] dataSource];
    [v14 isResidentCapable];
    id v15 = HMFBooleanToString();
    int v26 = 138543874;
    uint64_t v27 = v12;
    __int16 v28 = 2112;
    id v29 = v13;
    __int16 v30 = 2112;
    uint64_t v31 = v15;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Configuring and registering for messages, isInternal: %@, isResidentEnabled: %@", (uint8_t *)&v26, 0x20u);
  }
  long long v16 = [a1[4] dataSource];
  uint64_t v17 = [v16 createBackingStoreForHome:a1[5]];
  long long v18 = a1[4];
  id v19 = (void *)v18[28];
  v18[28] = v17;

  objc_storeStrong((id *)a1[4] + 8, a1[6]);
  char v20 = [a1[6] secureRemoteTransport];
  __int16 v21 = [v20 modernReachabilityObserver];
  [a1[4] setReachabilityObserver:v21];

  int v22 = [a1[6] secureRemoteTransport];
  __int16 v23 = [v22 deviceMonitor];
  [a1[4] setDeviceMonitor:v23];

  [a1[4] _registerForMessages];
  [a1[4] _registerForNotifications];
  uint64_t v24 = [a1[4] primaryDiscoveryManager];
  [v24 configureWithContext:a1[4]];

  return [a1[4] _configureResidentSupported];
}

- (HMDResidentDeviceManagerRoar)initWithDataSource:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)HMDResidentDeviceManagerRoar;
  uint64_t v6 = [(HMDResidentDeviceManagerRoar *)&v28 init];
  if (v6)
  {
    uint64_t v7 = HMFGetOSLogHandle();
    logger = v6->_logger;
    v6->_logger = (OS_os_log *)v7;

    uint64_t v9 = [v5 queue];
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_dataSource, a3);
    logIdentifier = v6->_logIdentifier;
    v6->_logIdentifier = (NSString *)@"<unconfigured>";

    messageTargetUUID = v6->_messageTargetUUID;
    v6->_messageTargetUUID = 0;

    uint64_t v13 = [MEMORY[0x263EFF9C0] set];
    residentDevices = v6->_residentDevices;
    v6->_residentDevices = (NSMutableSet *)v13;

    uint64_t v15 = [v5 notificationCenter];
    notificationCenter = v6->_notificationCenter;
    v6->_notificationCenter = (NSNotificationCenter *)v15;

    uint64_t v17 = [v5 appleAccountManager];
    appleAccountManager = v6->_appleAccountManager;
    v6->_appleAccountManager = (HMDAppleAccountManager *)v17;

    uint64_t v19 = [v5 createPrimaryResidentDiscoveryManagerWithQueue:v6->_queue];
    primaryDiscoveryManager = v6->_primaryDiscoveryManager;
    v6->_primaryDiscoveryManager = (HMDPrimaryResidentDiscoveryManager *)v19;

    [(HMDPrimaryResidentDiscoveryManager *)v6->_primaryDiscoveryManager setDelegate:v6];
    uint64_t v21 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    primaryDiscoveryRequesters = v6->_primaryDiscoveryRequesters;
    v6->_primaryDiscoveryRequesters = (NSHashTable *)v21;

    uint64_t v23 = [MEMORY[0x263F42538] futureWithPromise:&v6->_firstPrimaryResidentDiscoveryAttemptCompletionPromise];
    firstPrimaryResidentDiscoveryAttemptCompletionFuture = v6->_firstPrimaryResidentDiscoveryAttemptCompletionFuture;
    v6->_firstPrimaryResidentDiscoveryAttemptCompletionFuture = (HMFFuture *)v23;

    uint64_t v25 = [v5 featuresDataSource];
    featuresDataSource = v6->_featuresDataSource;
    v6->_featuresDataSource = (HMDFeaturesDataSource *)v25;
  }
  return v6;
}

- (HMDResidentDeviceManagerRoar)init
{
  uint64_t v3 = objc_alloc_init(HMDDefaultResidentDeviceManagerRoarDataSource);
  id v4 = [(HMDResidentDeviceManagerRoar *)self initWithDataSource:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t75 != -1) {
    dispatch_once(&logCategory__hmf_once_t75, &__block_literal_global_200);
  }
  id v2 = (void *)logCategory__hmf_once_v76;
  return v2;
}

void __43__HMDResidentDeviceManagerRoar_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v76;
  logCategory__hmf_once_v76 = v0;
}

+ (id)shortDescription
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end