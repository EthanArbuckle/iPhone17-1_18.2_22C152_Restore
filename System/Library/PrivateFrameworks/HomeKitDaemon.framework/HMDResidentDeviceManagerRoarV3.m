@interface HMDResidentDeviceManagerRoarV3
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)_updatePrimaryResidentGenerationID:(id)a3;
- (BOOL)allowExternalUpdateOfPrimaryResidentTo:(id)a3 selectionTimestamp:(id)a4;
- (BOOL)configuredStatusKitForResidentSelection;
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
- (HMDIDSServerBag)idsServerBag;
- (HMDMessageDispatcher)messageDispatcher;
- (HMDModernTransportDeviceReachabilityObserver)reachabilityObserver;
- (HMDPreferredResidentsList)electorsPreferredResidentsList;
- (HMDPrimaryResidentDiscoveryManager)primaryDiscoveryManager;
- (HMDRemoteDeviceMonitor)deviceMonitor;
- (HMDResidentDevice)primaryResidentDevice;
- (HMDResidentDevice)userSelectedPreferredResident;
- (HMDResidentDeviceManagerDelegate)delegate;
- (HMDResidentDeviceManagerRoarBackingStore)backingStore;
- (HMDResidentDeviceManagerRoarV3)init;
- (HMDResidentDeviceManagerRoarV3)initWithDataSource:(id)a3 featuresDataSource:(id)a4;
- (HMDResidentDeviceManagerRoarV3DataSource)dataSource;
- (HMDResidentLocationHandler)residentLocationHandler;
- (HMDResidentSelectionInfo)residentSelectionInfo;
- (HMDResidentSelectionManager)residentSelectionManager;
- (HMDResidentSelectionStatusKit)presentResidentsStatuses;
- (HMDResidentStatusChannel)statusChannel;
- (HMDResidentStatusChannelManager)residentStatusChannelManager;
- (HMFFuture)cloudReady;
- (HMFFuture)firstPrimaryResidentDiscoveryAttemptCompletionFuture;
- (HMFPromise)firstPrimaryResidentDiscoveryAttemptCompletionPromise;
- (HMFTimer)primaryResidentPeriodicReassertTimer;
- (HMFTimer)residentLocationRetryTimer;
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
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)messageReceiveQueue;
- (OS_dispatch_queue)queue;
- (double)_initialConnectionToStatusKitOnResidentTimeout;
- (double)_primaryResidentPeriodicReassertionTimeInterval;
- (double)_statusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds;
- (double)blockPrimaryTakeoverDuration;
- (double)blockPrimaryTakeoverStartTime;
- (id)_createBackoffTimer;
- (id)_electorForDeterminingResidentLocationFromPresentResidentStatuses:(id)a3;
- (id)_residentDeviceDisplayName:(id)a3;
- (id)_residentStatusWithPreferredResidentsList:(id)a3;
- (id)_residentsFromResidentStatuses:(id)a3 residentDevices:(id)a4;
- (id)_updateReachabilityForResidentDevices:(id)a3 reachableResidents:(id)a4;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)dumpState;
- (id)foundNewPrimaryResident:(id)a3 generationID:(id)a4 selectionTimestamp:(id)a5 changeSource:(unint64_t)a6;
- (id)ourSelf;
- (id)pendingNotifyPrimaryChanged;
- (id)preferredResidentUUIDs;
- (id)residentDeviceForDevice:(id)a3;
- (id)residentDeviceWithIDSIdentifier:(id)a3;
- (id)residentDevicesSet;
- (id)residentDevicesWithIDSIdentifiers:(id)a3;
- (id)residentIDSIdentifierToLocationMap;
- (id)residentWithUUID:(id)a3;
- (id)shortDescription;
- (int64_t)atHomeLevel;
- (unint64_t)myLocation;
- (unint64_t)ourNetworkConnectionType;
- (unint64_t)residentSelectionMode;
- (void)_addResidentDevice:(id)a3;
- (void)_checkForResidentSelectionInfoUpdate;
- (void)_checkForResidentSelectionInfoUpdateInNotification:(id)a3;
- (void)_checkForUnknownLocationAndRetry;
- (void)_checkPrimaryResidentDeviceRemoved:(id)a3 currentPrimary:(id)a4;
- (void)_configureResidentSupported;
- (void)_createAllKnownResidentsInHome:(BOOL *)a3;
- (void)_determineResidentLocationWithCompletion:(id)a3;
- (void)_discoverPrimaryResidentForRequester:(id)a3;
- (void)_handleCloudResidentChange:(id)a3;
- (void)_handleCloudZoneReadyNotification:(id)a3;
- (void)_handleDataReadyAfterBecomingPrimaryNotification:(id)a3;
- (void)_handleHomeLocationChangedNotification:(id)a3;
- (void)_handleInitialConnectionToStatusKit;
- (void)_handleInitialTransitionToResidentSelectionWithCompletion:(id)a3;
- (void)_handlePrimaryResident:(id)a3 isReachable:(BOOL)a4;
- (void)_handlePrimaryResidentDiscoveryRequest:(id)a3;
- (void)_handlePrimaryResidentDiscoveryXPCRequest:(id)a3;
- (void)_handleReachabilityAfterPrimaryResidentChangedTo:(id)a3 previousPrimaryResident:(id)a4;
- (void)_handleRemoteDeviceIsNotReachable:(id)a3;
- (void)_handleRemoteDeviceIsReachable:(id)a3;
- (void)_handleResidentDeviceUpdateEnabled:(id)a3;
- (void)_handleResidentSelectionVersionDidChange:(id)a3;
- (void)_handleUpdatedPrimaryFromSelection:(id)a3;
- (void)_handleUpdatedPrimaryResidentDevice:(id)a3 previousPrimaryResident:(id)a4 generationID:(id)a5 changeSource:(unint64_t)a6;
- (void)_notifyPrimaryResidentChanged:(id)a3 previousPrimaryResident:(id)a4 changeSource:(unint64_t)a5;
- (void)_notifyUpdatedGenerationIDWithPrimaryResident:(id)a3;
- (void)_notifyUserPreferredResidentReachability:(id)a3 previousPrimaryResident:(id)a4;
- (void)_publishCurrentResidentStatusWithReason:(int64_t)a3 preferredResidentsList:(id)a4;
- (void)_refreshAllResidentsReachabilityFromStatusKit;
- (void)_registerForMessages;
- (void)_registerForNotifications;
- (void)_removeResidentDevice:(id)a3;
- (void)_removeRetryTimer;
- (void)_run;
- (void)_sendResidentDeviceNotificationWithName:(id)a3 forResidentDevice:(id)a4;
- (void)_setResident:(id)a3 reachableOverIDS:(BOOL)a4 andNotify:(BOOL)a5;
- (void)_setupAsAResident;
- (void)_setupSessionWithPrimaryResidentDevice;
- (void)_startActingAsResident;
- (void)_startPrimaryResidentPeriodicReassertionTimer;
- (void)_startResidentSelectionManager;
- (void)_startRetryTimer;
- (void)_stopActingAsResidentViaStatusKit;
- (void)_stopPrimaryResidentPeriodicReassertionTimer;
- (void)_submitLogeventForPrimaryResident:(id)a3 previousPrimaryResident:(id)a4 changeSource:(unint64_t)a5;
- (void)_teardownSessionWithPrimaryResidentDevice;
- (void)_updatePrimaryResidentPeriodicReassertionTimerWithPrimaryResidentDevice:(id)a3;
- (void)_updatePrimaryResidentSelectionTimestamp:(id)a3;
- (void)_updatePrimaryResidentTransactionWithPrimaryResidentDevice:(id)a3;
- (void)_updateReachability:(BOOL)a3 forResidentDevice:(id)a4;
- (void)_updateReachability:(BOOL)a3 forResidentDevices:(id)a4;
- (void)_updateReachabilityFromWorkingStoreExceptResident:(id)a3;
- (void)_updateResidentAvailability:(BOOL)a3;
- (void)_updateResidentIDSReachability:(BOOL)a3 withUpdatedDevice:(id)a4;
- (void)_updateResidentReachabilityFromReachableResidents:(id)a3;
- (void)accountOrDeviceDidUpdate:(id)a3;
- (void)addDataSource:(id)a3;
- (void)atHomeLevelChanged:(int64_t)a3;
- (void)channel:(id)a3 didObserveDevicesAdded:(id)a4 lost:(id)a5 updated:(id)a6;
- (void)channel:(id)a3 didObservePrimaryResidentChange:(id)a4;
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
- (void)handleSetPreferredResidentSelectionMessage:(id)a3;
- (void)invalidate;
- (void)modernTransportDeviceReachabilityObserverDidUpdate:(id)a3 isReachable:(BOOL)a4;
- (void)notifyClientsOfUpdatedResidentDevice:(id)a3;
- (void)notifyResidentAvailable:(BOOL)a3;
- (void)notifyUpdatedPrimaryResident:(id)a3 previousPrimaryResident:(id)a4;
- (void)reAssertAsTheCurrentPrimaryResident;
- (void)removeResidentDevice:(id)a3;
- (void)residentSelectionManager:(id)a3 didFailToSelectWithError:(id)a4;
- (void)residentSelectionManager:(id)a3 didReceivePrimaryResidentIdsIdentifier:(id)a4 selectionTimestamp:(id)a5;
- (void)residentSelectionManager:(id)a3 didSelectPrimaryResident:(id)a4 selectionInfo:(id)a5 electionLogEvent:(id)a6 completion:(id)a7;
- (void)residentSelectionManager:(id)a3 didUpdateActiveNodes:(id)a4;
- (void)residentSelectionManager:(id)a3 didUpdatePreferredResidentsList:(id)a4;
- (void)residentSelectionManager:(id)a3 didUpdateResidentDevice:(id)a4;
- (void)residentSelectionManager:(id)a3 didUpdateResidentSelectionInfo:(id)a4 completion:(id)a5;
- (void)residentSelectionManager:(id)a3 reassertAsTheCurrentPrimaryWithSelectionTimestamp:(id)a4;
- (void)residentSelectionManagerReadyAsResident:(id)a3;
- (void)run;
- (void)sawGenerationID:(id)a3 forDevice:(id)a4;
- (void)setActingAsResident:(BOOL)a3;
- (void)setBlockPrimaryTakeoverStartTime:(double)a3;
- (void)setConfiguredStatusKitForResidentSelection:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceMonitor:(id)a3;
- (void)setFirstPrimaryResidentDiscoveryAttemptCompletionPromise:(id)a3;
- (void)setHome:(id)a3;
- (void)setPendingNotifyPrimaryChanged:(id)a3;
- (void)setPresentResidentsStatuses:(id)a3;
- (void)setPrimaryResidentPeriodicReassertTimer:(id)a3;
- (void)setReachabilityObserver:(id)a3;
- (void)setResidentAvailable:(BOOL)a3;
- (void)setResidentLocationRetryTimer:(id)a3;
- (void)setResidentSelectionManager:(id)a3;
- (void)setResidentSupported:(BOOL)a3;
- (void)timerDidFire:(id)a3;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)updatePrimaryResidentWithUUID:(id)a3 actions:(id)a4;
- (void)updateResidentAvailability;
@end

@implementation HMDResidentDeviceManagerRoarV3

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_residentLocationHandler, 0);
  objc_storeStrong(&self->_pendingNotifyPrimaryChanged, 0);
  objc_storeStrong((id *)&self->_primaryResidentPeriodicReassertTimer, 0);
  objc_storeStrong((id *)&self->_residentLocationRetryTimer, 0);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_presentResidentsStatuses, 0);
  objc_storeStrong((id *)&self->_residentStatusChannelManager, 0);
  objc_storeStrong((id *)&self->_statusChannel, 0);
  objc_storeStrong((id *)&self->_firstPrimaryResidentDiscoveryAttemptCompletionPromise, 0);
  objc_storeStrong((id *)&self->_primaryDiscoveryRequesters, 0);
  objc_storeStrong((id *)&self->_primaryDiscoveryManager, 0);
  objc_storeStrong((id *)&self->_residentSelectionManager, 0);
  objc_storeStrong((id *)&self->_deviceMonitor, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_appleAccountManager, 0);
  objc_storeStrong((id *)&self->_firstPrimaryResidentDiscoveryAttemptCompletionFuture, 0);
  objc_storeStrong((id *)&self->_primaryResidentSelectionTimestamp, 0);
  objc_storeStrong((id *)&self->_primaryResidentGenerationID, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
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

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setBlockPrimaryTakeoverStartTime:(double)a3
{
  self->_blockPrimaryTakeoverStartTime = a3;
}

- (double)blockPrimaryTakeoverStartTime
{
  return self->_blockPrimaryTakeoverStartTime;
}

- (void)setConfiguredStatusKitForResidentSelection:(BOOL)a3
{
  self->_configuredStatusKitForResidentSelection = a3;
}

- (BOOL)configuredStatusKitForResidentSelection
{
  return self->_configuredStatusKitForResidentSelection;
}

- (HMDResidentLocationHandler)residentLocationHandler
{
  return (HMDResidentLocationHandler *)objc_getProperty(self, a2, 264, 1);
}

- (void)setPendingNotifyPrimaryChanged:(id)a3
{
}

- (id)pendingNotifyPrimaryChanged
{
  return objc_getProperty(self, a2, 256, 1);
}

- (void)setPrimaryResidentPeriodicReassertTimer:(id)a3
{
}

- (HMFTimer)primaryResidentPeriodicReassertTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 248, 1);
}

- (void)setResidentLocationRetryTimer:(id)a3
{
}

- (HMFTimer)residentLocationRetryTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 240, 1);
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 232, 1);
}

- (void)setPresentResidentsStatuses:(id)a3
{
}

- (HMDResidentSelectionStatusKit)presentResidentsStatuses
{
  return (HMDResidentSelectionStatusKit *)objc_getProperty(self, a2, 224, 1);
}

- (HMDResidentStatusChannelManager)residentStatusChannelManager
{
  return (HMDResidentStatusChannelManager *)objc_getProperty(self, a2, 216, 1);
}

- (HMDResidentStatusChannel)statusChannel
{
  return (HMDResidentStatusChannel *)objc_getProperty(self, a2, 208, 1);
}

- (void)setFirstPrimaryResidentDiscoveryAttemptCompletionPromise:(id)a3
{
}

- (HMFPromise)firstPrimaryResidentDiscoveryAttemptCompletionPromise
{
  return (HMFPromise *)objc_getProperty(self, a2, 200, 1);
}

- (NSHashTable)primaryDiscoveryRequesters
{
  return self->_primaryDiscoveryRequesters;
}

- (HMDPrimaryResidentDiscoveryManager)primaryDiscoveryManager
{
  return (HMDPrimaryResidentDiscoveryManager *)objc_getProperty(self, a2, 184, 1);
}

- (void)setResidentSelectionManager:(id)a3
{
}

- (HMDResidentSelectionManager)residentSelectionManager
{
  return (HMDResidentSelectionManager *)objc_getProperty(self, a2, 176, 1);
}

- (void)setDeviceMonitor:(id)a3
{
}

- (HMDRemoteDeviceMonitor)deviceMonitor
{
  return (HMDRemoteDeviceMonitor *)objc_getProperty(self, a2, 168, 1);
}

- (HMDResidentDeviceManagerRoarBackingStore)backingStore
{
  return (HMDResidentDeviceManagerRoarBackingStore *)objc_getProperty(self, a2, 160, 1);
}

- (HMDResidentDeviceManagerRoarV3DataSource)dataSource
{
  return (HMDResidentDeviceManagerRoarV3DataSource *)objc_getProperty(self, a2, 152, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDResidentDeviceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (HMDResidentDeviceManagerDelegate *)WeakRetained;
}

- (BOOL)residentCapable
{
  return self->_residentCapable;
}

- (HMDAppleAccountManager)appleAccountManager
{
  return (HMDAppleAccountManager *)objc_getProperty(self, a2, 120, 1);
}

- (HMFFuture)firstPrimaryResidentDiscoveryAttemptCompletionFuture
{
  return (HMFFuture *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
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

- (id)_residentDeviceDisplayName:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = [(HMDResidentDeviceManagerRoarV3 *)self home];
  v6 = [v5 appleMediaAccessories];

  id obj = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v12 = [v11 device];
        v13 = [v12 identifier];
        v14 = [v4 device];
        v15 = [v14 identifier];
        char v16 = [v13 isEqual:v15];

        if (v16)
        {
          v20 = [v11 name];
          goto LABEL_14;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id obj = [v4 device];
  v17 = [obj name];
  v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = [v4 name];
  }
  v20 = v19;

LABEL_14:
  return v20;
}

- (void)_checkForUnknownLocationAndRetry
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = [(HMDResidentDeviceManagerRoarV3 *)self residentLocationHandler];
  id v4 = [v3 residentLocationRawValue];
  uint64_t v5 = [v4 unsignedIntegerValue];

  if (v5 == 100)
  {
    v6 = (void *)MEMORY[0x230FBD990]([(HMDResidentDeviceManagerRoarV3 *)self _startRetryTimer]);
    uint64_t v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      v10 = [(HMDResidentDeviceManagerRoarV3 *)v7 residentLocationRetryTimer];
      v11 = [v10 fireDate];
      [v11 timeIntervalSinceNow];
      int v18 = 138543874;
      id v19 = v9;
      __int16 v20 = 2112;
      v21 = @"Unknown";
      __int16 v22 = 2048;
      uint64_t v23 = v12;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Resident location is: %@, retrying after %.03f seconds", (uint8_t *)&v18, 0x20u);
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x230FBD990]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      char v16 = HMFGetLogIdentifier();
      StringFromHMDResidentLocation(v5);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v18 = 138543618;
      id v19 = v16;
      __int16 v20 = 2112;
      v21 = v17;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Resident location determined to: %@", (uint8_t *)&v18, 0x16u);
    }
    [(HMDResidentDeviceManagerRoarV3 *)v14 _removeRetryTimer];
  }
}

- (void)_determineResidentLocationWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v25 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Determining resident location", buf, 0xCu);
  }
  uint64_t v9 = [(HMDResidentDeviceManagerRoarV3 *)v6 residentLocationRetryTimer];
  [v9 suspend];

  v10 = [(HMDResidentDeviceManagerRoarV3 *)v6 residentStatusChannel];
  char v11 = [v10 isConnected];

  if (v11)
  {
    uint64_t v12 = [(HMDResidentDeviceManagerRoarV3 *)v6 residentLocationHandler];
    [v12 requestResidentLocation];

    v13 = [(HMDResidentDeviceManagerRoarV3 *)v6 residentStatusChannel];
    v14 = [v13 presentResidentStatuses];
    v15 = [(HMDResidentDeviceManagerRoarV3 *)v6 _electorForDeterminingResidentLocationFromPresentResidentStatuses:v14];

    char v16 = [(HMDResidentDeviceManagerRoarV3 *)v6 residentLocationHandler];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __75__HMDResidentDeviceManagerRoarV3__determineResidentLocationWithCompletion___block_invoke;
    v22[3] = &unk_264A2EDE0;
    v22[4] = v6;
    id v23 = v4;
    [v16 determineHomeOrAwayUsingElector:v15 withCompletion:v22];
  }
  else
  {
    v17 = (void *)MEMORY[0x230FBD990]();
    int v18 = v6;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v25 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Not connected to StatusKit, unable to determine resident location", buf, 0xCu);
    }
    [(HMDResidentDeviceManagerRoarV3 *)v18 _checkForUnknownLocationAndRetry];
    v21 = _Block_copy(v4);
    v15 = v21;
    if (v21) {
      (*((void (**)(void *, void))v21 + 2))(v21, 0);
    }
  }
}

void __75__HMDResidentDeviceManagerRoarV3__determineResidentLocationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v10 = 138543618;
      char v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Determining resident home/away state encountered error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  [*(id *)(a1 + 32) _checkForUnknownLocationAndRetry];
  uint64_t v8 = _Block_copy(*(const void **)(a1 + 40));
  uint64_t v9 = v8;
  if (v8) {
    (*((void (**)(void *, id))v8 + 2))(v8, v3);
  }
}

- (void)_removeRetryTimer
{
  id v3 = [(HMDResidentDeviceManagerRoarV3 *)self residentLocationRetryTimer];
  [v3 suspend];

  [(HMDResidentDeviceManagerRoarV3 *)self setResidentLocationRetryTimer:0];
}

- (void)_startRetryTimer
{
  id v3 = [(HMDResidentDeviceManagerRoarV3 *)self residentLocationRetryTimer];

  if (!v3)
  {
    id v4 = [(HMDResidentDeviceManagerRoarV3 *)self _createBackoffTimer];
    [(HMDResidentDeviceManagerRoarV3 *)self setResidentLocationRetryTimer:v4];

    id v5 = [(HMDResidentDeviceManagerRoarV3 *)self residentLocationRetryTimer];
    [v5 setDelegate:self];

    v6 = [(HMDResidentDeviceManagerRoarV3 *)self queue];
    uint64_t v7 = [(HMDResidentDeviceManagerRoarV3 *)self residentLocationRetryTimer];
    [v7 setDelegateQueue:v6];
  }
  id v8 = [(HMDResidentDeviceManagerRoarV3 *)self residentLocationRetryTimer];
  [v8 resume];
}

- (id)_createBackoffTimer
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F42528]) initWithMinimumTimeInterval:4 maximumTimeInterval:0 exponentialFactor:300.0 options:43200.0];
  return v2;
}

- (void)_handleHomeLocationChangedNotification:(id)a3
{
  if ([(HMDResidentDeviceManagerRoarV3 *)self isActingAsResident])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__HMDResidentDeviceManagerRoarV3__handleHomeLocationChangedNotification___block_invoke;
    block[3] = &unk_264A2F7F8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __73__HMDResidentDeviceManagerRoarV3__handleHomeLocationChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Determining resident location due to home location change", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _determineResidentLocationWithCompletion:0];
}

- (void)timerDidFire:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(HMDResidentDeviceManagerRoarV3 *)self residentLocationRetryTimer];

  if (v5 == v4)
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    uint64_t v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      char v16 = HMFGetLogIdentifier();
      int v17 = 138543362;
      int v18 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Determining resident location due to retry timer firing", (uint8_t *)&v17, 0xCu);
    }
    [(HMDResidentDeviceManagerRoarV3 *)v14 _determineResidentLocationWithCompletion:0];
  }
  else
  {
    id v6 = [(HMDResidentDeviceManagerRoarV3 *)self primaryResidentPeriodicReassertTimer];

    if (v6 == v4)
    {
      int v7 = (void *)MEMORY[0x230FBD990]();
      id v8 = self;
      uint64_t v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = HMFGetLogIdentifier();
        int v17 = 138543362;
        int v18 = v10;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Primary resident periodic re-assert timer fired", (uint8_t *)&v17, 0xCu);
      }
      [(HMDResidentDeviceManagerRoarV3 *)v8 _startPrimaryResidentPeriodicReassertionTimer];
      char v11 = [(HMDResidentDeviceManagerRoarV3 *)v8 residentSelectionManager];
      __int16 v12 = [v11 localPreferredResidentsList];
      [(HMDResidentDeviceManagerRoarV3 *)v8 _publishCurrentResidentStatusWithReason:5 preferredResidentsList:v12];
    }
  }
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = HMFGetLogIdentifier();
    char v16 = NSStringFromSelector(a2);
    int v17 = 138543618;
    int v18 = v15;
    __int16 v19 = 2112;
    __int16 v20 = v16;
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
    __int16 v12 = HMFGetLogIdentifier();
    id v13 = NSStringFromSelector(a2);
    int v14 = 138543618;
    v15 = v12;
    __int16 v16 = 2112;
    int v17 = v13;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", (uint8_t *)&v14, 0x16u);
  }
}

- (void)residentSelectionManager:(id)a3 didUpdatePreferredResidentsList:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v14 = 138543362;
    v15 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Publishing updated resident status because preferred residents list was updated", (uint8_t *)&v14, 0xCu);
  }
  __int16 v12 = [(HMDResidentDeviceManagerRoarV3 *)v9 residentSelectionManager];
  id v13 = [v12 localPreferredResidentsList];
  [(HMDResidentDeviceManagerRoarV3 *)v9 _publishCurrentResidentStatusWithReason:4 preferredResidentsList:v13];
}

- (void)residentSelectionManager:(id)a3 didUpdateResidentSelectionInfo:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(HMDResidentDeviceManagerRoarV3 *)self backingStore];
  [v9 updateResidentSelectionInfoTo:v8 completion:v7];
}

- (void)residentSelectionManager:(id)a3 reassertAsTheCurrentPrimaryWithSelectionTimestamp:(id)a4
{
  [(HMDResidentDeviceManagerRoarV3 *)self _updatePrimaryResidentSelectionTimestamp:a4];
  [(HMDResidentDeviceManagerRoarV3 *)self reAssertAsTheCurrentPrimaryResident];
}

- (void)residentSelectionManager:(id)a3 didUpdateResidentDevice:(id)a4
{
  id v8 = a4;
  id v5 = [(HMDResidentDeviceManagerRoarV3 *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDResidentDeviceManagerRoarV3 *)self residentDevices];
  char v7 = [v6 containsObject:v8];

  if ((v7 & 1) == 0) {
    [(HMDResidentDeviceManagerRoarV3 *)self _addResidentDevice:v8];
  }
  [(HMDResidentDeviceManagerRoarV3 *)self notifyClientsOfUpdatedResidentDevice:v8];
}

- (void)residentSelectionManager:(id)a3 didUpdateActiveNodes:(id)a4
{
  id v9 = a4;
  id v5 = [(HMDResidentDeviceManagerRoarV3 *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDResidentDeviceManagerRoarV3 *)self residentSelectionManager];
  if ([v6 currentModeType] != 1)
  {

    goto LABEL_5;
  }
  BOOL v7 = [(HMDResidentDeviceManagerRoarV3 *)self isCurrentDeviceConfirmedPrimaryResident];

  id v8 = v9;
  if (v7)
  {
LABEL_5:
    [(HMDResidentDeviceManagerRoarV3 *)self _updateResidentReachabilityFromReachableResidents:v9];
    id v8 = v9;
  }
}

- (void)residentSelectionManager:(id)a3 didReceivePrimaryResidentIdsIdentifier:(id)a4 selectionTimestamp:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(HMDResidentDeviceManagerRoarV3 *)self queue];
  dispatch_assert_queue_V2(v9);

  [(HMDResidentDeviceManagerRoarV3 *)self _updatePrimaryResidentSelectionTimestamp:v7];
  id v11 = [(HMDResidentDeviceManagerRoarV3 *)self residentDeviceWithIDSIdentifier:v8];

  id v10 = [v11 identifier];
  [(HMDResidentDeviceManagerRoarV3 *)self _handleUpdatedPrimaryFromSelection:v10];
}

- (void)residentSelectionManagerReadyAsResident:(id)a3
{
  id v4 = [(HMDResidentDeviceManagerRoarV3 *)self queue];
  dispatch_assert_queue_V2(v4);

  id v6 = [(HMDResidentDeviceManagerRoarV3 *)self residentSelectionManager];
  id v5 = [v6 localPreferredResidentsList];
  [(HMDResidentDeviceManagerRoarV3 *)self _publishCurrentResidentStatusWithReason:1 preferredResidentsList:v5];
}

- (void)residentSelectionManager:(id)a3 didFailToSelectWithError:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDResidentDeviceManagerRoarV3 *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    __int16 v12 = HMFGetLogIdentifier();
    int v13 = 138543618;
    int v14 = v12;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Selection failed with error: %@", (uint8_t *)&v13, 0x16u);
  }
}

- (void)residentSelectionManager:(id)a3 didSelectPrimaryResident:(id)a4 selectionInfo:(id)a5 electionLogEvent:(id)a6 completion:(id)a7
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [(HMDResidentDeviceManagerRoarV3 *)self queue];
  dispatch_assert_queue_V2(v17);

  uint64_t v18 = (void *)MEMORY[0x230FBD990]();
  __int16 v19 = self;
  __int16 v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = HMFGetLogIdentifier();
    __int16 v22 = [v13 shortDescription];
    *(_DWORD *)buf = 138543874;
    v33 = v21;
    __int16 v34 = 2112;
    v35 = v22;
    __int16 v36 = 2112;
    id v37 = v14;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@residentSelectionManager didSelectPrimaryResident: %@ selectionInfo: %@", buf, 0x20u);
  }
  if ([v13 isCurrentDevice]) {
    [MEMORY[0x263F08C38] UUID];
  }
  else {
  id v23 = [(HMDResidentDeviceManagerRoarV3 *)v19 primaryResidentGenerationID];
  }
  uint64_t v24 = [v14 selectionTimestamp];
  [(HMDResidentDeviceManagerRoarV3 *)v19 _updatePrimaryResidentSelectionTimestamp:v24];

  if (!v14)
  {
    v27 = [(HMDResidentDeviceManagerRoarV3 *)v19 backingStore];
    [v27 updateResidentSelectionInfoTo:0 completion:v16];

    goto LABEL_10;
  }
  BOOL v25 = [(HMDResidentDeviceManagerRoarV3 *)v19 homeSupportsResidentSelection];
  uint64_t v26 = [(HMDResidentDeviceManagerRoarV3 *)v19 backingStore];
  [v26 updateResidentSelectionInfoTo:v14 completion:v16];

  if (v25)
  {
LABEL_10:
    uint64_t v28 = [(HMDResidentDeviceManagerRoarV3 *)v19 primaryResidentDevice];
    [(HMDResidentDeviceManagerRoarV3 *)v19 _handleUpdatedPrimaryResidentDevice:v13 previousPrimaryResident:v28 generationID:v23 changeSource:1];

    goto LABEL_11;
  }
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __126__HMDResidentDeviceManagerRoarV3_residentSelectionManager_didSelectPrimaryResident_selectionInfo_electionLogEvent_completion___block_invoke;
  v29[3] = &unk_264A2E210;
  v29[4] = v19;
  id v30 = v13;
  id v31 = v23;
  [(HMDResidentDeviceManagerRoarV3 *)v19 _handleInitialTransitionToResidentSelectionWithCompletion:v29];

LABEL_11:
}

void __126__HMDResidentDeviceManagerRoarV3_residentSelectionManager_didSelectPrimaryResident_selectionInfo_electionLogEvent_completion___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v4 = [v2 primaryResidentDevice];
  [v2 _handleUpdatedPrimaryResidentDevice:v3 previousPrimaryResident:v4 generationID:a1[6] changeSource:1];
}

- (void)_handleUpdatedPrimaryFromSelection:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDResidentDeviceManagerRoarV3 *)self primaryResidentUUID];
  char v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = [(HMDResidentDeviceManagerRoarV3 *)self residentWithUUID:v4];
    id v8 = [(HMDResidentDeviceManagerRoarV3 *)self primaryResidentDevice];
    int v9 = [v7 isCurrentDevice];
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v13)
      {
        id v14 = HMFGetLogIdentifier();
        int v19 = 138543362;
        __int16 v20 = v14;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Selection notified that we are the primary. Becoming the primary resident.", (uint8_t *)&v19, 0xCu);
      }
      id v15 = [MEMORY[0x263F08C38] UUID];
      [(HMDResidentDeviceManagerRoarV3 *)v11 _handleUpdatedPrimaryResidentDevice:v7 previousPrimaryResident:v8 generationID:v15 changeSource:6];
    }
    else
    {
      if (v13)
      {
        id v16 = HMFGetLogIdentifier();
        uint64_t v17 = [v7 shortDescription];
        uint64_t v18 = [v8 shortDescription];
        int v19 = 138543874;
        __int16 v20 = v16;
        __int16 v21 = 2114;
        __int16 v22 = v17;
        __int16 v23 = 2114;
        uint64_t v24 = v18;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Selection notified a new primary resident: %{public}@. Current Primary: %{public}@. Kicking off a primary resident discovery", (uint8_t *)&v19, 0x20u);
      }
      [(HMDResidentDeviceManagerRoarV3 *)v11 _discoverPrimaryResidentForRequester:0];
    }
  }
}

- (void)_handleReachabilityAfterPrimaryResidentChangedTo:(id)a3 previousPrimaryResident:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      int v18 = 138543362;
      int v19 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@There is no primary resident. Marking all residents as unreachable", (uint8_t *)&v18, 0xCu);
    }
    BOOL v13 = [(HMDResidentDeviceManagerRoarV3 *)v15 residentDevices];
    [(HMDResidentDeviceManagerRoarV3 *)v15 _updateReachability:0 forResidentDevices:v13];
    goto LABEL_8;
  }
  if ([v6 isCurrentDevice])
  {
    id v8 = [(HMDResidentDeviceManagerRoarV3 *)self residentSelectionManager];
    uint64_t v9 = [v8 currentModeType];

    if (v9 == 1)
    {
      id v10 = (void *)MEMORY[0x263EFF9C0];
      id v11 = [(HMDResidentDeviceManagerRoarV3 *)self residentSelectionManager];
      id v12 = [v11 locallyReachableResidents];
      BOOL v13 = [v10 setWithSet:v12];

      [v13 addObject:v6];
      [(HMDResidentDeviceManagerRoarV3 *)self _updateResidentReachabilityFromReachableResidents:v13];
LABEL_8:
    }
  }
}

- (double)_primaryResidentPeriodicReassertionTimeInterval
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDResidentDeviceManagerRoarV3 *)self dataSource];
  id v4 = [v3 primaryResidentPeriodicReassertDurationSeconds];

  if (v4)
  {
    unint64_t v5 = [v4 unsignedIntValue];
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v28 = 138543618;
      v29 = v9;
      __int16 v30 = 2048;
      double v31 = *(double *)&v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Using primaryResidentPeriodicReassertDurationSeconds from server bag: %lu", (uint8_t *)&v28, 0x16u);
    }
  }
  else
  {
    *(double *)&unint64_t v5 = 0.0;
  }
  id v10 = [(HMDResidentDeviceManagerRoarV3 *)self dataSource];
  id v11 = [v10 primaryResidentPeriodicReassertSlopDurationSeconds];

  if (v11)
  {
    *(void *)&double v12 = [v11 unsignedIntValue];
    BOOL v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = HMFGetLogIdentifier();
      int v28 = 138543618;
      v29 = v16;
      __int16 v30 = 2048;
      double v31 = v12;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Using primaryResidentPeriodicReassertSlopDurationSeconds from server bag: %lu", (uint8_t *)&v28, 0x16u);
    }
    if (*(double *)&v5 != 0.0)
    {
      if (LODWORD(v12))
      {
        unint64_t v17 = v5 + arc4random() % LODWORD(v12);
        goto LABEL_14;
      }
LABEL_13:
      double v12 = 0.0;
      unint64_t v17 = v5;
LABEL_14:
      double v18 = (double)v17;
      int v19 = (void *)MEMORY[0x230FBD990]();
      uint64_t v20 = self;
      __int16 v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v22 = HMFGetLogIdentifier();
        int v28 = 138544130;
        v29 = v22;
        __int16 v30 = 2048;
        double v31 = v18;
        __int16 v32 = 2048;
        unint64_t v33 = v5;
        __int16 v34 = 2048;
        double v35 = v12;
        __int16 v23 = "%{public}@Determined reassert interval: %f seconds (base: %lu seconds, slop: %lu seconds)";
        uint64_t v24 = v21;
        uint32_t v25 = 42;
LABEL_18:
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v28, v25);

        goto LABEL_19;
      }
      goto LABEL_19;
    }
  }
  else if (*(double *)&v5 != 0.0)
  {
    goto LABEL_13;
  }
  int v19 = (void *)MEMORY[0x230FBD990]();
  uint64_t v26 = self;
  __int16 v21 = HMFGetOSLogHandle();
  double v18 = 0.0;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v22 = HMFGetLogIdentifier();
    int v28 = 138543362;
    v29 = v22;
    __int16 v23 = "%{public}@Primary resident periodic re-assert duration is 0, defaulting to 0";
    uint64_t v24 = v21;
    uint32_t v25 = 12;
    goto LABEL_18;
  }
LABEL_19:

  return v18;
}

- (void)_stopPrimaryResidentPeriodicReassertionTimer
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  unint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    uint64_t v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping primary resident periodic re-assert timer", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(HMDResidentDeviceManagerRoarV3 *)v4 primaryResidentPeriodicReassertTimer];
  [v7 suspend];

  [(HMDResidentDeviceManagerRoarV3 *)v4 setPrimaryResidentPeriodicReassertTimer:0];
}

- (void)_startPrimaryResidentPeriodicReassertionTimer
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDResidentDeviceManagerRoarV3 *)self _primaryResidentPeriodicReassertionTimeInterval];
  double v5 = v4;
  double v6 = fabs(v4);
  id v7 = (void *)MEMORY[0x230FBD990](v3);
  int v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6 >= 2.22044605e-16)
  {
    if (v10)
    {
      double v12 = HMFGetLogIdentifier();
      int v20 = 138543618;
      __int16 v21 = v12;
      __int16 v22 = 2048;
      double v23 = v5;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Starting primary resident periodic re-assert timer with interval: %f seconds", (uint8_t *)&v20, 0x16u);
    }
    BOOL v13 = [(HMDResidentDeviceManagerRoarV3 *)v8 dataSource];
    id v14 = [v13 timerProvider];
    id v15 = [v14 timerWithTimeInterval:0 options:v5];
    [(HMDResidentDeviceManagerRoarV3 *)v8 setPrimaryResidentPeriodicReassertTimer:v15];

    id v16 = [(HMDResidentDeviceManagerRoarV3 *)v8 primaryResidentPeriodicReassertTimer];
    [v16 setDelegate:v8];

    unint64_t v17 = [(HMDResidentDeviceManagerRoarV3 *)v8 queue];
    double v18 = [(HMDResidentDeviceManagerRoarV3 *)v8 primaryResidentPeriodicReassertTimer];
    [v18 setDelegateQueue:v17];

    int v19 = [(HMDResidentDeviceManagerRoarV3 *)v8 primaryResidentPeriodicReassertTimer];
    [v19 resume];
  }
  else
  {
    if (v10)
    {
      id v11 = HMFGetLogIdentifier();
      int v20 = 138543362;
      __int16 v21 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Primary resident periodic re-assert interval is 0, not starting timer", (uint8_t *)&v20, 0xCu);
    }
  }
}

- (void)_updatePrimaryResidentPeriodicReassertionTimerWithPrimaryResidentDevice:(id)a3
{
  int v4 = [a3 isCurrentDevice];
  double v5 = [(HMDResidentDeviceManagerRoarV3 *)self primaryResidentPeriodicReassertTimer];
  double v6 = v5;
  if (v4)
  {

    if (!v6)
    {
      [(HMDResidentDeviceManagerRoarV3 *)self _startPrimaryResidentPeriodicReassertionTimer];
    }
  }
  else
  {

    if (v6)
    {
      [(HMDResidentDeviceManagerRoarV3 *)self _stopPrimaryResidentPeriodicReassertionTimer];
    }
  }
}

- (void)_updatePrimaryResidentTransactionWithPrimaryResidentDevice:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isCurrentDevice] && !self->_primaryResidentTransaction)
  {
    BOOL v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    double v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      BOOL v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      id v16 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Taking OS transaction since this device is now the primary resident", (uint8_t *)&v15, 0xCu);
    }
    id v14 = (HMFOSTransaction *)[objc_alloc(MEMORY[0x263F425C0]) initWithName:@"com.apple.homed.primary-resident"];
    primaryResidentTransaction = self->_primaryResidentTransaction;
    self->_primaryResidentTransaction = v14;
    goto LABEL_11;
  }
  if (([v4 isCurrentDevice] & 1) == 0 && self->_primaryResidentTransaction)
  {
    double v5 = (void *)MEMORY[0x230FBD990]();
    double v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = HMFGetLogIdentifier();
      int v15 = 138543362;
      id v16 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Releasing OS transaction since this device is no longer the primary resident", (uint8_t *)&v15, 0xCu);
    }
    primaryResidentTransaction = self->_primaryResidentTransaction;
    self->_primaryResidentTransaction = 0;
LABEL_11:
  }
}

- (BOOL)hasActivePrimaryResidentTransaction
{
  return self->_primaryResidentTransaction != 0;
}

- (void)_handleUpdatedPrimaryResidentDevice:(id)a3 previousPrimaryResident:(id)a4 generationID:(id)a5 changeSource:(unint64_t)a6
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id obj = a5;
  v81 = (__CFString *)a5;
  uint64_t v11 = [v9 isCurrentDevice];
  int v79 = v11;
  if (v9) {
    int v12 = v11;
  }
  else {
    int v12 = 1;
  }
  if (v9)
  {
    uint64_t v11 = objc_msgSend(v9, "isReachable", a5);
    int v13 = v11 ^ 1;
  }
  else
  {
    int v13 = 0;
  }
  int v14 = v13 ^ 1;
  if (!v10) {
    int v14 = 0;
  }
  if (((v14 | v12) & 1) == 0) {
    uint64_t v11 = [(HMDResidentDeviceManagerRoarV3 *)self _updateReachabilityFromWorkingStoreExceptResident:v9];
  }
  char v78 = v12;
  if (v13)
  {
    int v15 = (void *)MEMORY[0x230FBD990](v11);
    id v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      double v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v83 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Marking new primary resident as reachable", buf, 0xCu);
    }
    [(HMDResidentDeviceManagerRoarV3 *)v16 _updateReachability:1 forResidentDevice:v9];
  }
  else if (!v9)
  {
    int v19 = (void *)MEMORY[0x230FBD990](v11);
    int v20 = self;
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      __int16 v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v83 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@There is no primary resident. Marking all residents as unreachable", buf, 0xCu);
    }
    double v23 = [(HMDResidentDeviceManagerRoarV3 *)v20 residentDevices];
    [(HMDResidentDeviceManagerRoarV3 *)v20 _updateReachability:0 forResidentDevices:v23];
  }
  uint64_t v24 = objc_msgSend(v10, "identifier", obj);
  uint32_t v25 = [v9 identifier];
  char v26 = HMFEqualObjects();

  if (v26)
  {
    [(HMDResidentDeviceManagerRoarV3 *)self _updatePrimaryResidentGenerationID:v81];
  }
  else
  {
    v27 = (void *)MEMORY[0x230FBD990]();
    int v28 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v30 = HMFGetLogIdentifier();
      if (a6 - 1 > 6) {
        double v31 = @"resident removed";
      }
      else {
        double v31 = off_264A2A960[a6 - 1];
      }
      __int16 v32 = [v10 shortDescription];
      unint64_t v33 = [v9 shortDescription];
      *(_DWORD *)buf = 138544130;
      v83 = v30;
      __int16 v84 = 2112;
      v85 = v31;
      __int16 v86 = 2112;
      v87 = v32;
      __int16 v88 = 2112;
      v89 = v33;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Updating primary resident due to %@, from %@ to %@", buf, 0x2Au);
    }
    os_unfair_lock_lock_with_options();
    uint64_t v34 = [v9 identifier];
    primaryResidentUUID = v28->_primaryResidentUUID;
    v28->_primaryResidentUUID = (NSUUID *)v34;

    char v36 = HMFEqualObjects();
    if ((v36 & 1) == 0) {
      objc_storeStrong((id *)&v28->_primaryResidentGenerationID, obja);
    }
    os_unfair_lock_unlock(&v28->_lock);
    if (![(HMDResidentDeviceManagerRoarV3 *)v28 isActingAsResident])
    {
      if (v10)
      {
        id v37 = [(HMDResidentDeviceManagerRoarV3 *)v28 reachabilityObserver];
        uint64_t v38 = [v10 device];
        v39 = [v38 deviceAddress];
        [v37 removeListener:v28 forDeviceAddress:v39];

        v40 = [(HMDResidentDeviceManagerRoarV3 *)v28 deviceMonitor];
        v41 = [v10 device];
        [v40 stopMonitoringDevice:v41 forClient:v28];
      }
      if (v9)
      {
        v42 = [(HMDResidentDeviceManagerRoarV3 *)v28 reachabilityObserver];
        v43 = [v9 device];
        v44 = [v43 deviceAddress];
        [v42 addListener:v28 forDeviceAddress:v44];

        v45 = [(HMDResidentDeviceManagerRoarV3 *)v28 deviceMonitor];
        v46 = [v9 device];
        [v45 startMonitoringDevice:v46 withInitialReachability:0 forClient:v28];

        v47 = [(HMDResidentDeviceManagerRoarV3 *)v28 deviceMonitor];
        v48 = [v47 unreachableDevices];
        v49 = [v9 device];
        -[HMDResidentDeviceManagerRoarV3 _setResident:reachableOverIDS:andNotify:](v28, "_setResident:reachableOverIDS:andNotify:", v9, [v48 containsObject:v49] ^ 1, 0);
      }
    }
    [(HMDResidentDeviceManagerRoarV3 *)v28 _updatePrimaryResidentTransactionWithPrimaryResidentDevice:v9];
    if (([(HMDResidentDeviceManagerRoarV3 *)v28 homeSupportsResidentSelection] & v79) == 1) {
      [(HMDResidentDeviceManagerRoarV3 *)v28 _refreshAllResidentsReachabilityFromStatusKit];
    }
    uint64_t v50 = [(HMDResidentDeviceManagerRoarV3 *)v28 notifyUpdatedPrimaryResident:v9 previousPrimaryResident:v10];
    if ((v36 & 1) == 0)
    {
      v51 = (void *)MEMORY[0x230FBD990](v50);
      v52 = v28;
      v53 = HMFGetOSLogHandle();
      BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_INFO);
      if (v79)
      {
        if (v54)
        {
          v55 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v83 = v55;
          __int16 v84 = 2114;
          v85 = v81;
          _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_INFO, "%{public}@Using newly generated primaryResidentGenerationID = %{public}@", buf, 0x16u);
        }
      }
      else if (v54)
      {
        v56 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v83 = v56;
        __int16 v84 = 2114;
        v85 = v81;
        _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_INFO, "%{public}@Updating primaryResidentGenerationID = %{public}@", buf, 0x16u);
      }
    }
    if (v78) {
      [(HMDResidentDeviceManagerRoarV3 *)v28 _teardownSessionWithPrimaryResidentDevice];
    }
    else {
      [(HMDResidentDeviceManagerRoarV3 *)v28 _setupSessionWithPrimaryResidentDevice];
    }
    [(HMDResidentDeviceManagerRoarV3 *)v28 _notifyPrimaryResidentChanged:v9 previousPrimaryResident:v10 changeSource:a6];
  }
  if (v9)
  {
    v57 = [(HMDResidentDeviceManagerRoarV3 *)self primaryDiscoveryManager];
    [v57 cancel];

    logger = self->_logger;
    if (os_signpost_enabled(logger))
    {
      v59 = logger;
      v60 = [v9 identifier];
      *(_DWORD *)buf = 138412290;
      v83 = v60;
      _os_signpost_emit_with_name_impl(&dword_22F52A000, v59, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HH2ElectedPrimaryResident", "electedPrimaryResidentIdentifier=%{signpost.description:attribute}@ ", buf, 0xCu);
    }
  }
  [(HMDResidentDeviceManagerRoarV3 *)self _handleReachabilityAfterPrimaryResidentChangedTo:v9 previousPrimaryResident:v10];
  v61 = [v9 device];
  if (-[HMDResidentDeviceManagerRoarV3 isCurrentDeviceConfirmedPrimaryResident](self, "isCurrentDeviceConfirmedPrimaryResident")&& [v61 isCurrentDevice])
  {
    v62 = [(HMDResidentDeviceManagerRoarV3 *)self backingStore];
    v63 = [(HMDResidentDeviceManagerRoarV3 *)self availableResidentDevices];
    [v62 updateIdentifiersForAvailableResidentDevices:v63];
  }
  v64 = [(HMDResidentDeviceManagerRoarV3 *)self residentSelectionManager];
  if ([v64 currentModeType] == 3)
  {
  }
  else
  {
    v65 = [(HMDResidentDeviceManagerRoarV3 *)self residentSelectionManager];
    BOOL v66 = [v65 currentModeType] == 2;

    if (!v66) {
      goto LABEL_65;
    }
  }
  if (([v9 isCurrentDevice] & 1) != 0
    || [v10 isCurrentDevice]
    && [(HMDResidentDeviceManagerRoarV3 *)self isActingAsResident])
  {
    v67 = (void *)MEMORY[0x230FBD990]();
    v68 = self;
    v69 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      v70 = HMFGetLogIdentifier();
      [v9 isCurrentDevice];
      HMFBooleanToString();
      v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
      [v10 isCurrentDevice];
      v72 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      v83 = v70;
      __int16 v84 = 2112;
      v85 = v71;
      __int16 v86 = 2112;
      v87 = v72;
      _os_log_impl(&dword_22F52A000, v69, OS_LOG_TYPE_INFO, "%{public}@Publishing updated resident status because became primary: %@ was previous primary: %@", buf, 0x20u);
    }
    if ([v9 isCurrentDevice]) {
      uint64_t v73 = 2;
    }
    else {
      uint64_t v73 = 3;
    }
    v74 = [(HMDResidentDeviceManagerRoarV3 *)v68 residentSelectionManager];
    v75 = [v74 localPreferredResidentsList];
    [(HMDResidentDeviceManagerRoarV3 *)v68 _publishCurrentResidentStatusWithReason:v73 preferredResidentsList:v75];
  }
  [(HMDResidentDeviceManagerRoarV3 *)self _updatePrimaryResidentPeriodicReassertionTimerWithPrimaryResidentDevice:v9];
LABEL_65:
}

- (void)_notifyPrimaryResidentChanged:(id)a3 previousPrimaryResident:(id)a4 changeSource:(unint64_t)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__HMDResidentDeviceManagerRoarV3__notifyPrimaryResidentChanged_previousPrimaryResident_changeSource___block_invoke;
  aBlock[3] = &unk_264A2A940;
  objc_copyWeak(v24, &location);
  id v10 = v8;
  id v22 = v10;
  id v11 = v9;
  id v23 = v11;
  v24[1] = (id)a5;
  int v12 = (void (**)(void))_Block_copy(aBlock);
  int v13 = [(HMDResidentDeviceManagerRoarV3 *)self residentSelectionInfo];
  int v14 = [v13 selectionTimestamp];
  int v15 = [(HMDResidentDeviceManagerRoarV3 *)self primaryResidentSelectionTimestamp];
  BOOL v16 = [v14 compare:v15] == -1;

  if (v16)
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    double v18 = self;
    HMFGetOSLogHandle();
    int v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v27 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@ResidentSelectionInfo is out of date submit the logevent when it is synced", buf, 0xCu);
    }
    [(HMDResidentDeviceManagerRoarV3 *)v18 setPendingNotifyPrimaryChanged:v12];
  }
  else
  {
    v12[2](v12);
  }

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
}

void __101__HMDResidentDeviceManagerRoarV3__notifyPrimaryResidentChanged_previousPrimaryResident_changeSource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v2 = [WeakRetained isActingAsResident];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    [WeakRetained _submitLogeventForPrimaryResident:v3 previousPrimaryResident:v4 changeSource:*(void *)(a1 + 56)];
  }
  else {
    [WeakRetained _notifyUserPreferredResidentReachability:v3 previousPrimaryResident:v4];
  }
}

- (void)_submitLogeventForPrimaryResident:(id)a3 previousPrimaryResident:(id)a4 changeSource:(unint64_t)a5
{
  uint64_t v119 = *MEMORY[0x263EF8340];
  id v88 = a3;
  id v8 = a4;
  if (!v8 && a5 != 6)
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Skip not a resident selection primary changed", buf, 0xCu);
    }
    goto LABEL_64;
  }
  v95 = [(HMDResidentDeviceManagerRoarV3 *)self home];
  int v13 = [(HMDResidentDeviceManagerRoarV3 *)self residentSelectionInfo];
  int v14 = [(HMDResidentDeviceManagerRoarV3 *)self residentSelectionManager];
  int v15 = [v14 minimumHomeKitVersionForResidentSelection];

  if (v8)
  {
    BOOL v16 = [v8 device];
    uint64_t v17 = [v16 version];
    unsigned int v84 = [v17 isAtLeastVersion:v15] ^ 1;
  }
  else
  {
    unsigned int v84 = 0;
  }
  __int16 v86 = self;
  v87 = v13;
  if ([v13 currentModeType] == 2)
  {
    double v18 = [(HMDResidentDeviceManagerRoarV3 *)self currentResidentDevice];
    int v19 = [v18 device];
    int v20 = [v19 idsIdentifier];
    __int16 v21 = [v13 preferredResidentIDSIdentifier];
    unsigned int v83 = [v20 isEqual:v21];

    id v22 = [v88 device];
    id v23 = [v22 idsIdentifier];
    uint64_t v24 = [v13 preferredResidentIDSIdentifier];
    uint32_t v25 = v23;
    char v26 = v24;
  }
  else
  {
    v27 = [(HMDResidentDeviceManagerRoarV3 *)self preferredResidentUUIDs];
    id v22 = [v27 firstObject];

    uint64_t v28 = [(HMDResidentDeviceManagerRoarV3 *)self currentResidentDevice];
    v29 = [v28 device];
    __int16 v30 = [v29 idsIdentifier];
    unsigned int v83 = [v30 isEqual:v22];

    id v23 = [v88 device];
    uint32_t v25 = [v23 idsIdentifier];
    uint64_t v24 = v25;
    char v26 = v22;
  }
  unsigned int v82 = [v25 isEqual:v26];

  double v31 = +[HMDFeaturesDataSource defaultDataSource];
  __int16 v32 = [v95 uuid];
  if ([v31 isResidentSelectionEnabledForHomeUUID:v32])
  {
    unint64_t v33 = v86;
    BOOL v94 = [(HMDResidentDeviceManagerRoarV3 *)v86 homeSupportsResidentSelection];
  }
  else
  {
    BOOL v94 = 0;
    unint64_t v33 = v86;
  }

  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id obj = [(HMDResidentDeviceManagerRoarV3 *)v33 residentDevices];
  uint64_t v96 = [obj countByEnumeratingWithState:&v112 objects:v118 count:16];
  id v85 = v8;
  uint64_t v34 = 0;
  if (!v96)
  {
    uint64_t v104 = 0;
    uint64_t v105 = 0;
    double v35 = 0;
    v101 = 0;
    v102 = 0;
    v100 = 0;
    goto LABEL_61;
  }
  uint64_t v104 = 0;
  uint64_t v105 = 0;
  double v35 = 0;
  v101 = 0;
  v102 = 0;
  v100 = 0;
  uint64_t v93 = *(void *)v113;
  long long v92 = *MEMORY[0x263F42378];
  uint64_t v90 = v15;
  uint64_t v91 = *(void *)(MEMORY[0x263F42378] + 16);
  do
  {
    uint64_t v36 = 0;
    do
    {
      if (*(void *)v113 != v93) {
        objc_enumerationMutation(obj);
      }
      uint64_t v103 = v36;
      id v37 = *(void **)(*((void *)&v112 + 1) + 8 * v36);
      uint64_t v38 = [v37 device];
      v39 = [v38 productInfo];
      v40 = [v39 softwareVersion];

      long long v110 = 0u;
      long long v111 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      id v106 = [v95 appleMediaAccessories];
      uint64_t v41 = [v106 countByEnumeratingWithState:&v108 objects:v117 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        v97 = v40;
        v98 = v34;
        v99 = v35;
        uint64_t v43 = *(void *)v109;
        while (2)
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v109 != v43) {
              objc_enumerationMutation(v106);
            }
            v45 = *(void **)(*((void *)&v108 + 1) + 8 * i);
            v46 = [v45 device];
            v47 = [v46 identifier];
            v48 = v37;
            v49 = [v37 device];
            uint64_t v50 = [v49 identifier];
            int v51 = [v47 isEqual:v50];

            if (v51)
            {
              v40 = [v45 softwareVersion];

              int v15 = v90;
              uint64_t v34 = v98;
              double v35 = v99;
              id v37 = v48;
              goto LABEL_30;
            }
            id v37 = v48;
          }
          uint64_t v42 = [v106 countByEnumeratingWithState:&v108 objects:v117 count:16];
          if (v42) {
            continue;
          }
          break;
        }
        int v15 = v90;
        uint64_t v34 = v98;
        double v35 = v99;
        v40 = v97;
      }
LABEL_30:

      if (v40) {
        [v40 operatingSystemVersion];
      }
      *(_OWORD *)buf = v92;
      *(void *)&buf[16] = v91;
      uint64_t v52 = HMFOperatingSystemVersionCompare();
      if (v94)
      {
        if (v40) {
          [v40 operatingSystemVersion];
        }
        *(_OWORD *)buf = *MEMORY[0x263F42410];
        *(void *)&buf[16] = *(void *)(MEMORY[0x263F42410] + 16);
        BOOL v53 = HMFOperatingSystemVersionCompare() != 1;
        if (v35)
        {
LABEL_38:
          if (![v35 isGreaterThanVersion:v40]) {
            goto LABEL_40;
          }
        }
      }
      else
      {
        BOOL v53 = 0;
        if (v35) {
          goto LABEL_38;
        }
      }
      id v54 = v40;

      double v35 = v54;
LABEL_40:
      if (v52 == 1)
      {
        if (!v53) {
          goto LABEL_54;
        }
        v55 = v101;
        if (v101)
        {
          v56 = v100;
          v57 = v40;
          if (![v101 isGreaterThanVersion:v40]) {
            goto LABEL_44;
          }
        }
        else
        {
          v56 = v100;
          v57 = v40;
        }
      }
      else
      {
        v55 = v100;
        if (v100)
        {
          v56 = v40;
          v57 = v101;
          if (([v100 isGreaterThanVersion:v40] & 1) == 0)
          {
LABEL_44:
            if (!v102) {
              goto LABEL_53;
            }
            goto LABEL_52;
          }
        }
        else
        {
          v56 = v40;
          v57 = v101;
        }
      }
      id v58 = v40;

      v100 = v56;
      v101 = v57;
      if (!v102) {
        goto LABEL_53;
      }
LABEL_52:
      if ([v102 isGreaterThanVersion:v40])
      {
LABEL_53:
        id v59 = v40;

        v102 = v59;
      }
LABEL_54:
      if (!v34
        || ([v37 device],
            v60 = objc_claimAutoreleasedReturnValue(),
            [v60 version],
            v61 = objc_claimAutoreleasedReturnValue(),
            int v62 = [v61 isGreaterThanVersion:v34],
            v61,
            v60,
            v62))
      {
        v63 = [v37 device];
        uint64_t v64 = [v63 version];

        uint64_t v34 = (void *)v64;
      }
      v65 = [v37 device];
      BOOL v66 = [v65 version];
      unsigned int v67 = [v66 isAtLeastVersion:v15];

      v104 += v67 ^ 1;
      v105 += v67;

      uint64_t v36 = v103 + 1;
    }
    while (v103 + 1 != v96);
    uint64_t v96 = [obj countByEnumeratingWithState:&v112 objects:v118 count:16];
  }
  while (v96);
LABEL_61:

  v68 = [v88 device];
  v69 = [v68 version];
  unsigned int v107 = [v69 isAtLeastVersion:v34];

  v70 = [HMDResidentSelectionPrimaryResidentChangedLogEvent alloc];
  uint64_t v71 = [v88 isCurrentDevice];
  uint64_t v72 = [v87 currentModeType];
  uint64_t v73 = [(HMDResidentDeviceManagerRoarV3 *)v86 residentSelectionManager];
  uint64_t v74 = [v73 primaryChangedReason];
  v75 = [v95 uuid];
  v76 = -[HMDResidentSelectionPrimaryResidentChangedLogEvent initWithPrimaryResidentDidChange:isElectedDevicePreferred:isCurrentDevicePrimary:isCurrentDevicePreferred:isPreviousPrimaryRev2:isElectedDeviceLatestSWVersionInHome:residentSelectionMode:triggerReason:numResidentsREV3Capable:numResidentsREV3Incompatible:minimumVersionInHome:minimumParticipatingtvOS17Version:minimumParticipatingAllVersion:minimumParticipatingtvOS18Version:homeUUID:](v70, "initWithPrimaryResidentDidChange:isElectedDevicePreferred:isCurrentDevicePrimary:isCurrentDevicePreferred:isPreviousPrimaryRev2:isElectedDeviceLatestSWVersionInHome:residentSelectionMode:triggerReason:numResidentsREV3Capable:numResidentsREV3Incompatible:minimumVersionInHome:minimumParticipatingtvOS17Version:minimumParticipatingAllVersion:minimumParticipatingtvOS18Version:homeUUID:", 1, v82, v71, v83, v84, v107, v72, v74, v105, v104, v35, v101, v102, v100,
          v75);

  v77 = (void *)MEMORY[0x230FBD990]();
  char v78 = v86;
  int v79 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
  {
    v80 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v80;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v76;
    _os_log_impl(&dword_22F52A000, v79, OS_LOG_TYPE_INFO, "%{public}@Primary resident changed logEvent: %@", buf, 0x16u);
  }
  v81 = [v95 logEventSubmitter];
  [v81 submitLogEvent:v76];

  id v8 = v85;
LABEL_64:
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
        [(HMDResidentDeviceManagerRoarV3 *)self _updateReachability:v4 forResidentDevice:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
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
  double v5 = [(HMDResidentDeviceManagerRoarV3 *)self residentDevicesSet];
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
  long long v12 = [(HMDResidentDeviceManagerRoarV3 *)v8 queue];
  long long v13 = (void *)[v11 initWithQueue:v12];

  long long v14 = [(HMDResidentDeviceManagerRoarV3 *)v8 backingStore];
  int v15 = [v14 residentsRequiringReachabilityUpdate:v6];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __84__HMDResidentDeviceManagerRoarV3__updateReachabilityFromWorkingStoreExceptResident___block_invoke;
  v17[3] = &unk_264A2A918;
  v17[4] = v8;
  id v16 = (id)[v15 inContext:v13 then:v17];
}

uint64_t __84__HMDResidentDeviceManagerRoarV3__updateReachabilityFromWorkingStoreExceptResident___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __84__HMDResidentDeviceManagerRoarV3__updateReachabilityFromWorkingStoreExceptResident___block_invoke_2;
  v3[3] = &unk_264A2A788;
  v3[4] = *(void *)(a1 + 32);
  objc_msgSend(a2, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v3);
  return 1;
}

void __84__HMDResidentDeviceManagerRoarV3__updateReachabilityFromWorkingStoreExceptResident___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 isReachable] ^ 1;
  double v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = HMFBooleanToString();
    uint64_t v10 = [v3 shortDescription];
    int v11 = 138543874;
    long long v12 = v8;
    __int16 v13 = 2112;
    long long v14 = v9;
    __int16 v15 = 2112;
    id v16 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating resident reachability from database to %@ for: %@", (uint8_t *)&v11, 0x20u);
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
  int v2 = [(HMDResidentDeviceManagerRoarV3 *)self home];
  char v3 = [v2 isOwnerUser];

  return v3;
}

- (BOOL)isResidentEnabled
{
  int v2 = [(HMDResidentDeviceManagerRoarV3 *)self ourSelf];
  char v3 = [v2 isEnabled];

  return v3;
}

- (void)updatePrimaryResidentWithUUID:(id)a3 actions:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x230FBD990]();
  uint64_t v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    long long v12 = HMFGetLogIdentifier();
    __int16 v13 = NSStringFromSelector(a2);
    int v14 = 138543618;
    __int16 v15 = v12;
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
    uint64_t v10 = NSStringFromSelector(a2);
    int v11 = 138543618;
    long long v12 = v9;
    __int16 v13 = 2112;
    int v14 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", (uint8_t *)&v11, 0x16u);
  }
}

- (id)_residentsFromResidentStatuses:(id)a3 residentDevices:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__HMDResidentDeviceManagerRoarV3__residentsFromResidentStatuses_residentDevices___block_invoke;
  v9[3] = &unk_264A2A8F0;
  id v10 = v5;
  id v6 = v5;
  id v7 = objc_msgSend(a3, "na_map:", v9);

  return v7;
}

uint64_t __81__HMDResidentDeviceManagerRoarV3__residentsFromResidentStatuses_residentDevices___block_invoke(uint64_t a1, void *a2)
{
  return [a2 matchingDeviceFromResidentDevices:*(void *)(a1 + 32)];
}

- (void)channel:(id)a3 didObservePrimaryResidentChange:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDResidentDeviceManagerRoarV3 *)self queue];
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = HMFGetLogIdentifier();
      __int16 v13 = [v7 idsIdentifier];
      int v14 = [v7 generationID];
      int v25 = 138543874;
      char v26 = v12;
      __int16 v27 = 2114;
      uint64_t v28 = v13;
      __int16 v29 = 2112;
      __int16 v30 = v14;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Did observed primary resident from status channel: %{public}@, generation: %@", (uint8_t *)&v25, 0x20u);
    }
    uint64_t v15 = [v7 idsIdentifier];
    __int16 v16 = [v7 idsDestination];
    uint64_t v17 = +[HMDDeviceAddress addressWithIDSIdentifier:v15 idsDestination:v16];

    uint64_t v18 = [(HMDResidentDeviceManagerRoarV3 *)v10 appleAccountManager];
    int v19 = [v18 accountRegistry];
    uint64_t v20 = [v19 deviceForAddress:v17];

    __int16 v21 = [v7 generationID];
    id v22 = [v7 selectionInfo];
    id v23 = [v22 selectionTimestamp];
    id v24 = [(HMDResidentDeviceManagerRoarV3 *)v10 foundNewPrimaryResident:v20 generationID:v21 selectionTimestamp:v23 changeSource:7];
  }
}

- (void)channel:(id)a3 didObserveDevicesAdded:(id)a4 lost:(id)a5 updated:(id)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = [(HMDResidentDeviceManagerRoarV3 *)self queue];
  dispatch_assert_queue_V2(v14);

  uint64_t v15 = [(HMDResidentDeviceManagerRoarV3 *)self residentSelectionManager];
  uint64_t v16 = [v15 currentModeType];

  if (v16 == 1)
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    uint64_t v18 = self;
    int v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      int v34 = 138543362;
      double v35 = v20;
      __int16 v21 = "%{public}@Ignoring Resident Status Channel update - in Coordination selection mode";
LABEL_10:
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v34, 0xCu);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  id v22 = [HMDResidentSelectionStatusKit alloc];
  id v23 = [(HMDResidentDeviceManagerRoarV3 *)self residentStatusChannel];
  id v24 = [v23 presentResidentStatuses];
  int v25 = [(HMDResidentSelectionStatusKit *)v22 initWithWithContext:self residentStatusList:v24];
  [(HMDResidentDeviceManagerRoarV3 *)self setPresentResidentsStatuses:v25];

  char v26 = (void *)MEMORY[0x230FBD990]();
  __int16 v27 = self;
  uint64_t v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    __int16 v29 = HMFGetLogIdentifier();
    int v34 = 138544130;
    double v35 = v29;
    __int16 v36 = 2112;
    id v37 = v11;
    __int16 v38 = 2112;
    id v39 = v12;
    __int16 v40 = 2112;
    id v41 = v13;
    _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Status channel Observed devices added %@ \nlost %@ \nupdated %@", (uint8_t *)&v34, 0x2Au);
  }
  [(HMDResidentDeviceManagerRoarV3 *)v27 _refreshAllResidentsReachabilityFromStatusKit];
  if (![(HMDResidentDeviceManagerRoarV3 *)v27 isActingAsResident])
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    uint64_t v18 = v27;
    int v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      int v34 = 138543362;
      double v35 = v20;
      __int16 v21 = "%{public}@Ignoring Resident Status Channel update - not acting as a resident";
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  __int16 v30 = objc_msgSend(v11, "na_map:", &__block_literal_global_278_238976);
  uint64_t v31 = objc_msgSend(v12, "na_map:", &__block_literal_global_280_238977);
  __int16 v32 = [(HMDResidentDeviceManagerRoarV3 *)v27 residentSelectionManager];
  unint64_t v33 = [(HMDResidentDeviceManagerRoarV3 *)v27 presentResidentsStatuses];
  [v32 didUpdateResidentStatus:v33 residentsFound:v30 residentsLost:v31];

LABEL_12:
}

uint64_t __78__HMDResidentDeviceManagerRoarV3_channel_didObserveDevicesAdded_lost_updated___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 idsIdentifier];
}

uint64_t __78__HMDResidentDeviceManagerRoarV3_channel_didObserveDevicesAdded_lost_updated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 idsIdentifier];
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
  uint64_t v43 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  double v35 = [(HMDResidentDeviceManagerRoarV3 *)self home];
  __int16 v36 = NSString;
  int v34 = [v35 uuid];
  uint64_t v4 = [v34 UUIDString];
  unint64_t v33 = [(HMDResidentDeviceManagerRoarV3 *)self primaryResidentDevice];
  id v5 = [v33 device];
  id v6 = [v5 identifier];
  id v7 = [v6 UUIDString];
  [(HMDResidentDeviceManagerRoarV3 *)self isResidentAvailable];
  id v8 = HMFBooleanToString();
  [(HMDResidentDeviceManagerRoarV3 *)self isResidentSupported];
  uint64_t v9 = HMFBooleanToString();
  [(HMDResidentDeviceManagerRoarV3 *)self homeSupportsResidentSelection];
  id v10 = HMFBooleanToString();
  id v11 = [v36 stringWithFormat:@"home: %@, primaryResidentDevice: %@ isResidentAvailable: %@, isResidentSupported: %@, supportsResidentSelection: %@", v4, v7, v8, v9, v10];
  id v37 = v3;
  [v3 setObject:v11 forKeyedSubscript:@"State"];

  id v12 = [MEMORY[0x263EFF980] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v13 = [(HMDResidentDeviceManagerRoarV3 *)self residentDevices];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [*(id *)(*((void *)&v38 + 1) + 8 * i) dumpState];
        [v12 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v15);
  }

  [v37 setObject:v12 forKeyedSubscript:@"Residents"];
  int v19 = [(HMDResidentDeviceManagerRoarV3 *)self messageDispatcher];
  uint64_t v20 = [v19 secureRemoteTransport];
  __int16 v21 = [v20 deviceMonitor];
  id v22 = [v21 dumpState];
  [v37 setObject:v22 forKeyedSubscript:@"Remote Device Monitor"];

  id v23 = [(HMDResidentDeviceManagerRoarV3 *)self residentSelectionManager];
  id v24 = [v23 dumpState];
  [v37 setObject:v24 forKeyedSubscript:@"Primary.Selection"];

  int v25 = [(HMDResidentDeviceManagerRoarV3 *)self electorsPreferredResidentsList];
  char v26 = [v25 modifiedTimestamp];
  __int16 v27 = [v26 localTimeDescription];
  [v37 setObject:v27 forKeyedSubscript:@"Merged Elector's Preferred Residents Timestamp"];

  uint64_t v28 = [(HMDResidentDeviceManagerRoarV3 *)self autoSelectedPreferredResidents];
  __int16 v29 = objc_msgSend(v28, "na_map:", &__block_literal_global_264);
  [v37 setObject:v29 forKeyedSubscript:@"Merged Elector's Preferred Residents"];

  __int16 v30 = [(HMDResidentDeviceManagerRoarV3 *)self statusChannel];
  uint64_t v31 = [v30 dumpState];
  [v37 setObject:v31 forKeyedSubscript:@"Status Channel"];

  return v37;
}

uint64_t __43__HMDResidentDeviceManagerRoarV3_dumpState__block_invoke(uint64_t a1, void *a2)
{
  return [a2 shortDescription];
}

- (NSString)description
{
  return (NSString *)[(HMDResidentDeviceManagerRoarV3 *)self descriptionWithPointer:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(HMDResidentDeviceManagerRoarV3 *)self descriptionWithPointer:1];
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
  id v8 = [(HMDResidentDeviceManagerRoarV3 *)self residentDevices];
  uint64_t v9 = [v5 stringWithFormat:@"<%@%@, Resident Devices = %@", v6, v7, v8];

  if (v3) {
  return v9;
  }
}

- (id)shortDescription
{
  BOOL v3 = NSString;
  uint64_t v4 = [(id)objc_opt_class() shortDescription];
  id v5 = [(HMDResidentDeviceManagerRoarV3 *)self messageTargetUUID];
  id v6 = [v5 UUIDString];
  id v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return v7;
}

- (id)_updateReachabilityForResidentDevices:(id)a3 reachableResidents:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFF9C0];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 set];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __91__HMDResidentDeviceManagerRoarV3__updateReachabilityForResidentDevices_reachableResidents___block_invoke;
  v21[3] = &unk_264A2C628;
  v21[4] = self;
  id v10 = v9;
  id v22 = v10;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v21);
  id v11 = objc_msgSend(v8, "hmf_removedObjectsFromSet:", v7);

  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __91__HMDResidentDeviceManagerRoarV3__updateReachabilityForResidentDevices_reachableResidents___block_invoke_230;
  uint64_t v18 = &unk_264A2C628;
  int v19 = self;
  id v20 = v10;
  id v12 = v10;
  objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v15);
  id v13 = objc_msgSend(v12, "copy", v15, v16, v17, v18, v19);

  return v13;
}

void __91__HMDResidentDeviceManagerRoarV3__updateReachabilityForResidentDevices_reachableResidents___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([v3 isReachable] & 1) == 0)
  {
    uint64_t v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = HMFBooleanToString();
      uint64_t v9 = [v3 shortDescription];
      int v10 = 138543874;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Setting reachability to %@ for resident %@", (uint8_t *)&v10, 0x20u);
    }
    [v3 setReachable:1];
    [*(id *)(a1 + 40) addObject:v3];
  }
}

void __91__HMDResidentDeviceManagerRoarV3__updateReachabilityForResidentDevices_reachableResidents___block_invoke_230(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 isReachable])
  {
    uint64_t v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = HMFBooleanToString();
      uint64_t v9 = [v3 shortDescription];
      int v10 = 138543874;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Setting reachability to %@ for resident %@", (uint8_t *)&v10, 0x20u);
    }
    [v3 setReachable:0];
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (void)_updateResidentReachabilityFromReachableResidents:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentDeviceManagerRoarV3 *)self residentDevicesSet];
  id v6 = [(HMDResidentDeviceManagerRoarV3 *)self _updateReachabilityForResidentDevices:v5 reachableResidents:v4];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__HMDResidentDeviceManagerRoarV3__updateResidentReachabilityFromReachableResidents___block_invoke;
  v8[3] = &unk_264A2A8A8;
  v8[4] = self;
  objc_msgSend(v6, "na_each:", v8);
  if ([(HMDResidentDeviceManagerRoarV3 *)self isCurrentDeviceConfirmedPrimaryResident])
  {
    id v7 = [(HMDResidentDeviceManagerRoarV3 *)self backingStore];
    [v7 updateReachabilityForResidents:v4];
  }
}

uint64_t __84__HMDResidentDeviceManagerRoarV3__updateResidentReachabilityFromReachableResidents___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notifyClientsOfUpdatedResidentDevice:a2];
}

- (void)_refreshAllResidentsReachabilityFromStatusKit
{
  id v3 = [(HMDResidentDeviceManagerRoarV3 *)self residentStatusChannel];
  id v4 = [v3 presentResidentStatuses];
  id v5 = [(HMDResidentDeviceManagerRoarV3 *)self residentDevicesSet];
  id v6 = [(HMDResidentDeviceManagerRoarV3 *)self _residentsFromResidentStatuses:v4 residentDevices:v5];

  [(HMDResidentDeviceManagerRoarV3 *)self _updateResidentReachabilityFromReachableResidents:v6];
}

- (void)_updateReachability:(BOOL)a3 forResidentDevice:(id)a4
{
  BOOL v4 = a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(HMDResidentDeviceManagerRoarV3 *)self residentSelectionManager];
  if ([v7 currentModeType] == 3)
  {
  }
  else
  {
    id v8 = [(HMDResidentDeviceManagerRoarV3 *)self residentSelectionManager];
    uint64_t v9 = [v8 currentModeType];

    if (v9 != 2) {
      goto LABEL_7;
    }
  }
  if ([(HMDResidentDeviceManagerRoarV3 *)self isActingAsResident])
  {
    int v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    __int16 v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      __int16 v14 = HMFBooleanToString();
      uint64_t v15 = [v6 shortDescription];
      int v22 = 138543874;
      id v23 = v13;
      __int16 v24 = 2112;
      id v25 = v14;
      __int16 v26 = 2112;
      __int16 v27 = v15;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Running in selection mode on resident in home, not updating reachability to %@ for resident %@", (uint8_t *)&v22, 0x20u);

LABEL_15:
      goto LABEL_16;
    }
    goto LABEL_16;
  }
LABEL_7:
  int v16 = [v6 isReachable];
  int v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = self;
  uint64_t v17 = HMFGetOSLogHandle();
  __int16 v12 = v17;
  if (v16 == v4)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v13 = HMFGetLogIdentifier();
      __int16 v21 = "un";
      int v22 = 138543874;
      id v23 = v13;
      if (v4) {
        __int16 v21 = "";
      }
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2080;
      __int16 v27 = v21;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Resident %@ is already %sreachable", (uint8_t *)&v22, 0x20u);
      goto LABEL_15;
    }
LABEL_16:

    goto LABEL_17;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    int v19 = HMFBooleanToString();
    id v20 = [v6 shortDescription];
    int v22 = 138543874;
    id v23 = v18;
    __int16 v24 = 2112;
    id v25 = v19;
    __int16 v26 = 2112;
    __int16 v27 = v20;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Setting reachability to %@ for resident %@", (uint8_t *)&v22, 0x20u);
  }
  [v6 setReachable:v4];
  [(HMDResidentDeviceManagerRoarV3 *)v11 notifyClientsOfUpdatedResidentDevice:v6];
LABEL_17:
}

- (void)_updateResidentIDSReachability:(BOOL)a3 withUpdatedDevice:(id)a4
{
  id v6 = a4;
  if (![(HMDResidentDeviceManagerRoarV3 *)self isActingAsResident])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__HMDResidentDeviceManagerRoarV3__updateResidentIDSReachability_withUpdatedDevice___block_invoke;
    block[3] = &unk_264A2DFC8;
    block[4] = self;
    id v9 = v6;
    BOOL v10 = a3;
    dispatch_async(queue, block);
  }
}

void __83__HMDResidentDeviceManagerRoarV3__updateResidentIDSReachability_withUpdatedDevice___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) residentDeviceForDevice:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = *(id *)(a1 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      id v7 = [v2 shortDescription];
      id v8 = HMFBooleanToString();
      int v9 = 138543874;
      BOOL v10 = v6;
      __int16 v11 = 2112;
      __int16 v12 = v7;
      __int16 v13 = 2112;
      __int16 v14 = v8;
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
      int v19 = (void *)v18;
      id v20 = "un";
      int v21 = 138543874;
      int v22 = v17;
      if (v6) {
        id v20 = "";
      }
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      __int16 v25 = 2080;
      __int16 v26 = v20;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEBUG, "%{public}@resident %@ is already %sreachable by IDS", (uint8_t *)&v21, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = HMFGetLogIdentifier();
      uint64_t v15 = HMFBooleanToString();
      int v16 = [v8 shortDescription];
      int v21 = 138543874;
      int v22 = v14;
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v15;
      __int16 v25 = 2112;
      __int16 v26 = v16;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Setting IDS reachability to %@ for resident %@", (uint8_t *)&v21, 0x20u);
    }
    [v8 setReachableByIDS:v6];
    if (v5) {
      [(HMDResidentDeviceManagerRoarV3 *)v11 notifyClientsOfUpdatedResidentDevice:v8];
    }
  }
}

- (void)_handleDataReadyAfterBecomingPrimaryNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentDeviceManagerRoarV3 *)self backingStore];
  [v5 handleHomeDataReadyAfterBecomingPrimary:v4];
}

- (void)_handleResidentSelectionVersionDidChange:(id)a3
{
  id v4 = [(HMDResidentDeviceManagerRoarV3 *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__HMDResidentDeviceManagerRoarV3__handleResidentSelectionVersionDidChange___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __75__HMDResidentDeviceManagerRoarV3__handleResidentSelectionVersionDidChange___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) home];
  id v3 = [v2 residentSelectionVersion];

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  BOOL v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Home's resident selection version changed to %@", buf, 0x16u);
  }
  char v8 = [*(id *)(a1 + 32) homeSupportsResidentSelection];
  int v9 = *(void **)(a1 + 32);
  if ((v8 & 1) == 0) {
    goto LABEL_9;
  }
  int v10 = [v9 configuredStatusKitForResidentSelection];
  int v9 = *(void **)(a1 + 32);
  if (v10) {
    goto LABEL_9;
  }
  if ([v9 isCurrentDeviceAvailableResident]
    && ([*(id *)(a1 + 32) isActingAsResident] & 1) == 0)
  {
    int v9 = *(void **)(a1 + 32);
LABEL_9:
    __int16 v12 = [v9 residentSelectionManager];
    [v12 didUpdateResidentSelectionVersion];

    goto LABEL_10;
  }
  __int16 v11 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __75__HMDResidentDeviceManagerRoarV3__handleResidentSelectionVersionDidChange___block_invoke_226;
  v13[3] = &unk_264A2F3E8;
  v13[4] = v11;
  [v11 _handleInitialTransitionToResidentSelectionWithCompletion:v13];
LABEL_10:
}

void __75__HMDResidentDeviceManagerRoarV3__handleResidentSelectionVersionDidChange___block_invoke_226(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) residentSelectionManager];
  [v1 didUpdateResidentSelectionVersion];
}

- (void)_handleRemoteDeviceIsNotReachable:(id)a3
{
  id v4 = [a3 object];
  [(HMDResidentDeviceManagerRoarV3 *)self _updateResidentIDSReachability:0 withUpdatedDevice:v4];
}

- (void)_handleRemoteDeviceIsReachable:(id)a3
{
  id v4 = [a3 object];
  [(HMDResidentDeviceManagerRoarV3 *)self _updateResidentIDSReachability:1 withUpdatedDevice:v4];
}

- (void)modernTransportDeviceReachabilityObserverDidUpdate:(id)a3 isReachable:(BOOL)a4
{
  id v6 = a3;
  if (![(HMDResidentDeviceManagerRoarV3 *)self isActingAsResident])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __97__HMDResidentDeviceManagerRoarV3_modernTransportDeviceReachabilityObserverDidUpdate_isReachable___block_invoke;
    block[3] = &unk_264A2DFC8;
    block[4] = self;
    id v9 = v6;
    BOOL v10 = a4;
    dispatch_async(queue, block);
  }
}

void __97__HMDResidentDeviceManagerRoarV3_modernTransportDeviceReachabilityObserverDidUpdate_isReachable___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) primaryResidentDevice];
  if ([v2 isDeviceEquivalentToDeviceAddress:*(void *)(a1 + 40)]) {
    [*(id *)(a1 + 32) _handlePrimaryResident:v2 isReachable:*(unsigned __int8 *)(a1 + 48)];
  }
}

- (void)discoveryManager:(id)a3 didNotCompleteDiscoveryWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDResidentDeviceManagerRoarV3 *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__HMDResidentDeviceManagerRoarV3_discoveryManager_didNotCompleteDiscoveryWithError___block_invoke;
  v8[3] = &unk_264A2F820;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __84__HMDResidentDeviceManagerRoarV3_discoveryManager_didNotCompleteDiscoveryWithError___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) primaryDiscoveryRequesters];
  id v3 = (void *)[v2 copy];

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
  uint64_t v6 = [(HMDResidentDeviceManagerRoarV3 *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __95__HMDResidentDeviceManagerRoarV3_discoveryManager_didCompleteInitialDiscoveryAttemptWithError___block_invoke;
  v8[3] = &unk_264A2F820;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __95__HMDResidentDeviceManagerRoarV3_discoveryManager_didCompleteInitialDiscoveryAttemptWithError___block_invoke(uint64_t a1)
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
  __int16 v12 = [(HMDResidentDeviceManagerRoarV3 *)self queue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __131__HMDResidentDeviceManagerRoarV3_discoveryManager_didCompleteDiscoveryWithPrimaryResidentDevice_primaryResidentGenerationID_error___block_invoke;
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

void __131__HMDResidentDeviceManagerRoarV3_discoveryManager_didCompleteDiscoveryWithPrimaryResidentDevice_primaryResidentGenerationID_error___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) primaryDiscoveryRequesters];
  id v3 = (void *)[v2 copy];

  id v4 = [*(id *)(a1 + 32) primaryDiscoveryRequesters];
  [v4 removeAllObjects];

  id v5 = *(void **)(a1 + 40);
  if (v5 && ([v5 isCurrentDevice] & 1) == 0) {
    [*(id *)(a1 + 32) handlePrimaryResidentDiscovered:*(void *)(a1 + 40) primaryResidentGenerationID:*(void *)(a1 + 48)];
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
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a3 == 7)
  {
    if ([(HMDResidentDeviceManagerRoarV3 *)self isActingAsResident])
    {
      id v4 = [(HMDResidentDeviceManagerRoarV3 *)self residentSelectionManager];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __54__HMDResidentDeviceManagerRoarV3_electResidentDevice___block_invoke;
      v12[3] = &unk_264A2ED40;
      v12[4] = self;
      [v4 performSelectionInMode:1 preferredPrimaryResident:0 requireAutoUpdate:0 reason:7 completion:v12];

      return;
    }
    id v6 = (void *)MEMORY[0x230FBD990]();
    uint64_t v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v14 = v11;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@SetPreferredPrimary - This device is not an acting resident, returning from electResidentDevice", buf, 0xCu);
    }
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    uint64_t v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      uint64_t v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      long long v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", buf, 0x16u);
    }
  }
}

void __54__HMDResidentDeviceManagerRoarV3_electResidentDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    int v11 = 138543618;
    long long v12 = v10;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@SetPreferredPrimary completed with error: %@", (uint8_t *)&v11, 0x16u);
  }
}

- (BOOL)allowExternalUpdateOfPrimaryResidentTo:(id)a3 selectionTimestamp:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDResidentDeviceManagerRoarV3 *)self residentDeviceForDevice:v6];
  if ([(HMDResidentDeviceManagerRoarV3 *)self isCurrentDevicePrimaryResident])
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      long long v12 = HMFGetLogIdentifier();
      __int16 v13 = [v6 shortDescription];
      int v17 = 138543618;
      id v18 = v12;
      __int16 v19 = 2114;
      id v20 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Request for external update of the primary resident to: %{public}@ received while we are the primary", (uint8_t *)&v17, 0x16u);
    }
  }
  id v14 = [(HMDResidentDeviceManagerRoarV3 *)self residentSelectionManager];
  char v15 = [v14 allowExternalUpdateOfPrimaryResidentTo:v8 selectionTimestamp:v7];

  return v15;
}

- (void)sawGenerationID:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__HMDResidentDeviceManagerRoarV3_sawGenerationID_forDevice___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __60__HMDResidentDeviceManagerRoarV3_sawGenerationID_forDevice___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) residentDeviceForDevice:*(void *)(a1 + 40)];
  if (!v2)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = *(void **)(a1 + 40);
      int v14 = 138543618;
      char v15 = v9;
      __int16 v16 = 2112;
      int v17 = v10;
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
      char v15 = v13;
      __int16 v16 = 2112;
      int v17 = v2;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@New generation ID is for a resident that isn't the primary: %@ ignoring it.", (uint8_t *)&v14, 0x16u);
    }
LABEL_10:
    goto LABEL_11;
  }
  [*(id *)(a1 + 32) _updatePrimaryResidentGenerationID:*(void *)(a1 + 48)];
LABEL_11:
}

- (void)reAssertAsTheCurrentPrimaryResident
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(HMDResidentDeviceManagerRoarV3 *)self primaryResidentDevice];
  char v4 = [v3 isCurrentDevice];

  char v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Reasserting ourselves as the current primary resident", (uint8_t *)&v12, 0xCu);
    }
    id v10 = [(HMDResidentDeviceManagerRoarV3 *)v6 primaryResidentDevice];
    [(HMDResidentDeviceManagerRoarV3 *)v6 _sendResidentDeviceNotificationWithName:@"HMDResidentDeviceManagerReassertAsCurrentPrimaryNotification" forResidentDevice:v10];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v11;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Ignoring the request to reassert ourselves as the current primary resident", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (id)foundNewPrimaryResident:(id)a3 generationID:(id)a4 selectionTimestamp:(id)a5 changeSource:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc(MEMORY[0x263F42520]);
  uint64_t v14 = [(HMDResidentDeviceManagerRoarV3 *)self queue];
  char v15 = (void *)[v13 initWithQueue:v14];

  __int16 v16 = (void *)MEMORY[0x263F42538];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __103__HMDResidentDeviceManagerRoarV3_foundNewPrimaryResident_generationID_selectionTimestamp_changeSource___block_invoke;
  v22[3] = &unk_264A2A880;
  v22[4] = self;
  id v23 = v10;
  id v24 = v11;
  id v25 = v12;
  unint64_t v26 = a6;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  id v20 = [v16 inContext:v15 perform:v22];

  return v20;
}

uint64_t __103__HMDResidentDeviceManagerRoarV3_foundNewPrimaryResident_generationID_selectionTimestamp_changeSource___block_invoke(uint64_t a1)
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
    id v8 = [HMDResidentDevice alloc];
    uint64_t v9 = *(void *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 288));
    id v2 = [(HMDResidentDevice *)v8 initWithDevice:v9 home:WeakRetained];

    [*(id *)(a1 + 32) _addResidentDevice:v2];
  }
  id v11 = [*(id *)(a1 + 32) primaryResidentUUID];
  id v12 = [(HMDResidentDevice *)v2 identifier];
  int v13 = objc_msgSend(v11, "hmf_isEqualToUUID:", v12);

  uint64_t v14 = *(void **)(a1 + 32);
  if (v13)
  {
    [v14 _updatePrimaryResidentGenerationID:*(void *)(a1 + 48)];
    char v15 = [*(id *)(a1 + 32) primaryDiscoveryManager];
    [v15 cancel];
    uint64_t v16 = 0;
  }
  else
  {
    if (![v14 allowExternalUpdateOfPrimaryResidentTo:*(void *)(a1 + 40) selectionTimestamp:*(void *)(a1 + 56)])
    {
      uint64_t v16 = 1;
      goto LABEL_11;
    }
    [*(id *)(a1 + 32) _updatePrimaryResidentSelectionTimestamp:*(void *)(a1 + 56)];
    id v17 = *(void **)(a1 + 32);
    char v15 = [v17 primaryResidentDevice];
    [v17 _handleUpdatedPrimaryResidentDevice:v2 previousPrimaryResident:v15 generationID:*(void *)(a1 + 48) changeSource:*(void *)(a1 + 64)];
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
  v7[2] = __61__HMDResidentDeviceManagerRoarV3_handleCurrentDeviceChanged___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __61__HMDResidentDeviceManagerRoarV3_handleCurrentDeviceChanged___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"HMDDeviceNotificationKey"];

  objc_opt_class();
  objc_opt_isKindOfClass();

  id v4 = [*(id *)(a1 + 40) notificationCenter];
  [v4 removeObserver:*(void *)(a1 + 40) name:@"HMDDeviceUpdatedNotification" object:0];
}

- (void)handleSetPreferredResidentSelectionMessage:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 messagePayload];
  id v6 = objc_msgSend(v5, "hmf_UUIDForKey:", *MEMORY[0x263F0CD80]);

  uint64_t v7 = [v4 messagePayload];
  uint64_t v8 = objc_msgSend(v7, "hmf_BOOLForKey:", *MEMORY[0x263F0CD88]);

  if (v6)
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Going to update the selection mode to manual", buf, 0xCu);
    }
    int v13 = [(HMDResidentDeviceManagerRoarV3 *)v10 residentDevices];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    id v24[2] = __77__HMDResidentDeviceManagerRoarV3_handleSetPreferredResidentSelectionMessage___block_invoke;
    v24[3] = &unk_264A2A830;
    id v25 = v6;
    uint64_t v14 = objc_msgSend(v13, "na_firstObjectPassingTest:", v24);

    uint64_t v15 = 2;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 3;
  }
  uint64_t v16 = (void *)MEMORY[0x230FBD990]();
  id v17 = self;
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    uint64_t v27 = v19;
    __int16 v28 = 2112;
    __int16 v29 = v14;
    __int16 v30 = 2048;
    uint64_t v31 = v15;
    __int16 v32 = 1024;
    int v33 = v8;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Handling request to set preferred resident to: %@, in mode: %lu, requireAutoUpdate: %{BOOL}d", buf, 0x26u);
  }
  id v20 = [(HMDResidentDeviceManagerRoarV3 *)v17 residentSelectionManager];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __77__HMDResidentDeviceManagerRoarV3_handleSetPreferredResidentSelectionMessage___block_invoke_220;
  v22[3] = &unk_264A2ED40;
  id v23 = v4;
  id v21 = v4;
  [v20 performSelectionInMode:v15 preferredPrimaryResident:v14 requireAutoUpdate:v8 reason:7 completion:v22];
}

uint64_t __77__HMDResidentDeviceManagerRoarV3_handleSetPreferredResidentSelectionMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 device];
  id v4 = [v3 idsIdentifier];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

uint64_t __77__HMDResidentDeviceManagerRoarV3_handleSetPreferredResidentSelectionMessage___block_invoke_220(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v3, "respondWithError:");
  }
  else {
    return [v3 respondWithSuccess];
  }
}

- (void)_handleResidentDeviceUpdateEnabled:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 uuidForKey:@"kIdentifierKey"];
  if (v5)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v6 = [(HMDResidentDeviceManagerRoarV3 *)self residentDevices];
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
      uint64_t v15 = [v4 messagePayload];
      objc_msgSend(v15, "hmf_BOOLForKey:isPresent:", @"kEnabledKey", &v38);

      if (!v38)
      {
        uint64_t v16 = (void *)MEMORY[0x230FBD990]();
        id v17 = self;
        id v18 = HMFGetOSLogHandle();
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
        id v21 = [v4 responseHandler];

        if (v21)
        {
          uint64_t v22 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
          id v23 = [v4 responseHandler];
          v23[2](v23, v22, 0);

          goto LABEL_26;
        }
      }
      goto LABEL_27;
    }
LABEL_10:

LABEL_17:
    id v24 = (void *)MEMORY[0x230FBD990]();
    id v25 = self;
    unint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      __int16 v28 = [v5 UUIDString];
      int buf = 138543618;
      v45 = v27;
      __int16 v46 = 2114;
      v47 = v28;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Failed to find resident device with identifier: %{public}@", (uint8_t *)&buf, 0x16u);
    }
    __int16 v29 = [v4 responseHandler];

    if (v29)
    {
      __int16 v30 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = 2;
      goto LABEL_25;
    }
  }
  else
  {
    __int16 v32 = (void *)MEMORY[0x230FBD990]();
    int v33 = self;
    uint64_t v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      double v35 = HMFGetLogIdentifier();
      __int16 v36 = [v4 messagePayload];
      int buf = 138543618;
      v45 = v35;
      __int16 v46 = 2112;
      v47 = v36;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@Invalid message payload, missing resident device identifier: %@", (uint8_t *)&buf, 0x16u);
    }
    id v37 = [v4 responseHandler];

    if (v37)
    {
      __int16 v30 = (void *)MEMORY[0x263F087E8];
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
  BOOL v5 = [(HMDResidentDeviceManagerRoarV3 *)self isCurrentDevicePrimaryResident];
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
      id v23 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Received query for primary resident, responding", buf, 0xCu);
    }
    id v11 = [(HMDResidentDeviceManagerRoarV3 *)v7 currentResidentDevice];
    id v12 = [v11 identifier];
    char v13 = [v12 UUIDString];
    id v21 = v13;
    id v14 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v15 = (void *)[v14 mutableCopy];

    uint64_t v16 = [(HMDResidentDeviceManagerRoarV3 *)v7 primaryResidentGenerationID];
    id v17 = [v16 UUIDString];
    [v15 setObject:v17 forKeyedSubscript:@"gen"];

    id v18 = (void *)[v15 copy];
    [v4 respondWithPayload:v18];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v19 = HMFGetLogIdentifier();
      *(_DWORD *)int buf = 138543362;
      id v23 = v19;
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
    id v17 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling primary resident discovery request", buf, 0xCu);
  }
  uint64_t v9 = objc_alloc_init(HMDResidentDeviceManagerV3XPCDiscoveryRequester);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__HMDResidentDeviceManagerRoarV3__handlePrimaryResidentDiscoveryXPCRequest___block_invoke;
  v12[3] = &unk_264A2A858;
  char v13 = v9;
  id v14 = v6;
  id v15 = v4;
  id v10 = v4;
  id v11 = v9;
  [(HMDResidentDeviceManagerV3XPCDiscoveryRequester *)v11 setBlock:v12];
  [(HMDResidentDeviceManagerRoarV3 *)v6 _discoverPrimaryResidentForRequester:v11];
}

void __76__HMDResidentDeviceManagerRoarV3__handlePrimaryResidentDiscoveryXPCRequest___block_invoke(uint64_t a1, void *a2, void *a3)
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
    uint64_t v8 = [(HMDResidentDeviceManagerRoarV3 *)self residentDevices];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __94__HMDResidentDeviceManagerRoarV3_handlePrimaryResidentDiscovered_primaryResidentGenerationID___block_invoke;
    v16[3] = &unk_264A2A830;
    id v9 = v6;
    id v17 = v9;
    char v10 = objc_msgSend(v8, "na_any:", v16);

    if ((v10 & 1) == 0) {
      [(HMDResidentDeviceManagerRoarV3 *)self _addResidentDevice:v9];
    }

    id v11 = [(HMDResidentDeviceManagerRoarV3 *)self primaryResidentDevice];
    [(HMDResidentDeviceManagerRoarV3 *)self _handleUpdatedPrimaryResidentDevice:v9 previousPrimaryResident:v11 generationID:v7 changeSource:4];
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

uint64_t __94__HMDResidentDeviceManagerRoarV3_handlePrimaryResidentDiscovered_primaryResidentGenerationID___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v18 = 138543362;
    int v19 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Running primary resident discovery", (uint8_t *)&v18, 0xCu);
  }
  id v9 = [(HMDResidentDeviceManagerRoarV3 *)v6 queue];
  dispatch_assert_queue_V2(v9);

  if ([(HMDResidentDeviceManagerRoarV3 *)v6 isResidentSupported])
  {
    char v10 = [(HMDResidentDeviceManagerRoarV3 *)v6 home];
    id v11 = v10;
    if (v10)
    {
      id v12 = [v10 homeManager];
      char v13 = [v11 uuid];
      id v14 = [v12 sharedUserAcceptEventBuilderForHomeUuid:v13];

      [v14 markDiscoverPrimaryResidentBegin];
    }
    id v15 = [(HMDResidentDeviceManagerRoarV3 *)v6 primaryResidentDevice];
    if ([v15 isCurrentDevice])
    {
      [v4 residentDeviceManager:v6 didCompleteDiscoveryWithPrimaryResidentDevice:v15 error:0];
    }
    else
    {
      if (v4)
      {
        uint64_t v16 = [(HMDResidentDeviceManagerRoarV3 *)v6 primaryDiscoveryRequesters];
        [v16 addObject:v4];
      }
      id v17 = [(HMDResidentDeviceManagerRoarV3 *)v6 primaryDiscoveryManager];
      [v17 discoverPrimaryResident];
    }
  }
  else
  {
    id v11 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [v4 residentDeviceManager:v6 didCompleteDiscoveryWithPrimaryResidentDevice:0 error:v11];
  }
}

- (void)discoverPrimaryResidentForRequester:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentDeviceManagerRoarV3 *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__HMDResidentDeviceManagerRoarV3_discoverPrimaryResidentForRequester___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __70__HMDResidentDeviceManagerRoarV3_discoverPrimaryResidentForRequester___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _discoverPrimaryResidentForRequester:*(void *)(a1 + 40)];
}

- (void)_handlePrimaryResident:(id)a3 isReachable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HMDResidentDeviceManagerRoarV3 *)self queue];
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
    [(HMDResidentDeviceManagerRoarV3 *)v9 _updateReachability:1 forResidentDevice:v6];
    [(HMDResidentDeviceManagerRoarV3 *)v9 _updateReachabilityFromWorkingStoreExceptResident:v6];
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
    id v14 = [(HMDResidentDeviceManagerRoarV3 *)v9 residentDevices];
    [(HMDResidentDeviceManagerRoarV3 *)v9 _updateReachability:0 forResidentDevices:v14];

    [(HMDResidentDeviceManagerRoarV3 *)v9 _discoverPrimaryResidentForRequester:0];
  }
}

- (void)_sendResidentDeviceNotificationWithName:(id)a3 forResidentDevice:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  [v8 setObject:v7 forKeyedSubscript:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];
  id v9 = [(HMDResidentDeviceManagerRoarV3 *)self home];
  char v10 = [v9 uuid];
  [v8 setObject:v10 forKeyedSubscript:@"HMDResidentDeviceManagerHomeUUIDNotificationKey"];

  if ([v6 isEqual:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification"])
  {
    if ([v7 isCurrentDevice])
    {
      BOOL v11 = [(HMDResidentDeviceManagerRoarV3 *)self residentSelectionManager];
      uint64_t v12 = [v11 currentModeType];

      if (v12 != 1)
      {
        char v13 = [(HMDResidentDeviceManagerRoarV3 *)self residentLocationHandler];
        id v14 = [v13 residentLocationRawValue];

        int v15 = (void *)MEMORY[0x230FBD990]();
        uint64_t v16 = self;
        __int16 v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          id v18 = HMFGetLogIdentifier();
          StringFromHMDResidentLocation([v14 unsignedIntegerValue]);
          uint64_t v19 = v25 = v15;
          *(_DWORD *)int buf = 138543874;
          uint64_t v27 = v18;
          __int16 v28 = 2112;
          id v29 = v19;
          __int16 v30 = 2112;
          uint64_t v31 = @"HMDResidentDeviceManagerUpdatePrimaryResidentNotification";
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Including current resident location: %@ in: %@", buf, 0x20u);

          int v15 = v25;
        }

        [v8 setObject:v14 forKeyedSubscript:@"HMDResidentDeviceManagerResidentLocationKey"];
      }
    }
  }
  uint64_t v20 = (void *)MEMORY[0x230FBD990]();
  id v21 = self;
  uint64_t v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v23 = HMFGetLogIdentifier();
    *(_DWORD *)int buf = 138543618;
    uint64_t v27 = v23;
    __int16 v28 = 2114;
    id v29 = v6;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Posting notification: %{public}@", buf, 0x16u);
  }
  uint64_t v24 = [(HMDResidentDeviceManagerRoarV3 *)v21 notificationCenter];
  [v24 postNotificationName:v6 object:v21 userInfo:v8];
}

- (void)_notifyUpdatedGenerationIDWithPrimaryResident:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(HMDResidentDeviceManagerRoarV3 *)self _sendResidentDeviceNotificationWithName:@"HMDResidentDeviceManagerUpdatePrimaryResidentGenerationIDNotification" forResidentDevice:v5];
}

- (void)notifyUpdatedPrimaryResident:(id)a3 previousPrimaryResident:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__HMDResidentDeviceManagerRoarV3_notifyUpdatedPrimaryResident_previousPrimaryResident___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __87__HMDResidentDeviceManagerRoarV3_notifyUpdatedPrimaryResident_previousPrimaryResident___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _sendResidentDeviceNotificationWithName:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" forResidentDevice:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) residentSelectionManager];
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
      uint64_t v16 = v7;
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

- (void)_notifyUserPreferredResidentReachability:(id)a3 previousPrimaryResident:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99__HMDResidentDeviceManagerRoarV3__notifyUserPreferredResidentReachability_previousPrimaryResident___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __99__HMDResidentDeviceManagerRoarV3__notifyUserPreferredResidentReachability_previousPrimaryResident___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isOwnerUser])
  {
    if (*(void *)(a1 + 40))
    {
      id v2 = [*(id *)(a1 + 32) residentSelectionInfo];
      id v3 = [v2 preferredResidentIDSIdentifier];
      if (v3 && (uint64_t v4 = *(void *)(a1 + 48), v3, v4))
      {
        id v5 = [*(id *)(a1 + 32) home];
        if (v5)
        {
          id v6 = [*(id *)(a1 + 48) device];
          id v7 = [v6 idsIdentifier];
          id v8 = [v2 preferredResidentIDSIdentifier];
          uint64_t v9 = [v7 isEqual:v8];

          id v10 = [*(id *)(a1 + 32) _residentDeviceDisplayName:*(void *)(a1 + 40)];
          BOOL v11 = [*(id *)(a1 + 32) _residentDeviceDisplayName:*(void *)(a1 + 48)];
          id v12 = [MEMORY[0x263EFF9A0] dictionary];
          id v13 = [v5 uuid];
          [v12 setObject:v13 forKeyedSubscript:@"HMDResidentDeviceHomeUUIDNotificationKey"];

          id v14 = [NSNumber numberWithBool:v9];
          [v12 setObject:v14 forKeyedSubscript:@"HMDResidentDeviceManagerUserPreferredResidentReachabilityKey"];

          if (v10) {
            uint64_t v15 = [v12 setObject:v10 forKeyedSubscript:@"HMDResidentDeviceManagerUserPreferredResidentNameKey"];
          }
          if (v11) {
            uint64_t v15 = [v12 setObject:v11 forKeyedSubscript:@"HMDResidentDeviceManagerBackupResidentNameKey"];
          }
          uint64_t v16 = (void *)MEMORY[0x230FBD990](v15);
          id v17 = *(id *)(a1 + 32);
          id v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            uint64_t v19 = HMFGetLogIdentifier();
            int v37 = 138543362;
            char v38 = v19;
            _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Notify user preferred resident reachability is changed", (uint8_t *)&v37, 0xCu);
          }
          uint64_t v20 = [*(id *)(a1 + 32) notificationCenter];
          uint64_t v21 = *(void *)(a1 + 32);
          uint64_t v22 = (void *)[v12 copy];
          [v20 postNotificationName:@"HMDResidentDeviceManagerUserPreferredResidentReachabilityNotification" object:v21 userInfo:v22];
        }
        else
        {
          int v33 = (void *)MEMORY[0x230FBD990]();
          id v34 = *(id *)(a1 + 32);
          double v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            __int16 v36 = HMFGetLogIdentifier();
            int v37 = 138543362;
            char v38 = v36;
            _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@No home to notify user preferred change", (uint8_t *)&v37, 0xCu);
          }
        }
      }
      else
      {
        uint64_t v27 = (void *)MEMORY[0x230FBD990]();
        id v28 = *(id *)(a1 + 32);
        id v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          __int16 v30 = HMFGetLogIdentifier();
          uint64_t v31 = [v2 preferredResidentIDSIdentifier];
          uint64_t v32 = "no elected primary";
          if (!v31) {
            uint64_t v32 = "in auto mode";
          }
          int v37 = 138543618;
          char v38 = v30;
          __int16 v39 = 2080;
          long long v40 = v32;
          _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@Do not notify user preferred change: %s", (uint8_t *)&v37, 0x16u);
        }
      }
    }
  }
  else
  {
    id v23 = (void *)MEMORY[0x230FBD990]();
    id v24 = *(id *)(a1 + 32);
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      unint64_t v26 = HMFGetLogIdentifier();
      int v37 = 138543362;
      char v38 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Not owner do not notify user perferred resident reachability is changed.", (uint8_t *)&v37, 0xCu);
    }
  }
}

- (void)notifyClientsOfUpdatedResidentDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDResidentDeviceManagerRoarV3 *)self residentDevices];
  char v6 = [v5 containsObject:v4];

  if (v6)
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __71__HMDResidentDeviceManagerRoarV3_notifyClientsOfUpdatedResidentDevice___block_invoke;
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
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Not notifying clients of updated resident %@ since it is not in the resident devices list", buf, 0x16u);
    }
  }
}

void __71__HMDResidentDeviceManagerRoarV3_notifyClientsOfUpdatedResidentDevice___block_invoke(uint64_t a1)
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
  v4[2] = __58__HMDResidentDeviceManagerRoarV3_notifyResidentAvailable___block_invoke;
  v4[3] = &unk_264A2B870;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

void __58__HMDResidentDeviceManagerRoarV3_notifyResidentAvailable___block_invoke(uint64_t a1)
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
  v7[2] = __59__HMDResidentDeviceManagerRoarV3_accountOrDeviceDidUpdate___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __59__HMDResidentDeviceManagerRoarV3_accountOrDeviceDidUpdate___block_invoke(uint64_t a1)
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
  [*(id *)(a1 + 32) _configureResidentSupported];
  uint64_t result = [*(id *)(a1 + 32) isCurrentDeviceAvailableResident];
  if ((result & 1) == 0) {
    return [*(id *)(a1 + 32) _createAllKnownResidentsInHome:0];
  }
  return result;
}

- (void)setResidentSupported:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL v5 = (void *)MEMORY[0x230FBD990](self, a2);
  id v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = HMFBooleanToString();
    int v18 = 138543618;
    uint64_t v19 = v8;
    __int16 v20 = 2112;
    uint64_t v21 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@ResidentSupported = %@", (uint8_t *)&v18, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  v6->_residentSupported = v3;
  os_unfair_lock_unlock(&v6->_lock);
  if (v3 && [(HMDResidentDeviceManagerRoarV3 *)v6 isCurrentDeviceAvailableResident])
  {
    id v10 = [(HMDResidentDeviceManagerRoarV3 *)v6 notificationCenter];
    __int16 v11 = [(HMDResidentDeviceManagerRoarV3 *)v6 appleAccountManager];
    [v10 removeObserver:v6 name:@"HMDAppleAccountManagerDeviceUpdatedNotification" object:v11];
  }
  else
  {
    id v12 = [(HMDResidentDeviceManagerRoarV3 *)v6 notificationCenter];
    __int16 v13 = [(HMDResidentDeviceManagerRoarV3 *)v6 appleAccountManager];
    [v12 removeObserver:v6 name:@"HMDAppleAccountManagerResolved" object:v13];

    int v14 = [(HMDResidentDeviceManagerRoarV3 *)v6 notificationCenter];
    uint64_t v15 = [(HMDResidentDeviceManagerRoarV3 *)v6 appleAccountManager];
    [v14 removeObserver:v6 name:@"HMDAppleAccountManagerDeviceUpdatedNotification" object:v15];

    __int16 v16 = [(HMDResidentDeviceManagerRoarV3 *)v6 notificationCenter];
    id v17 = [(HMDResidentDeviceManagerRoarV3 *)v6 appleAccountManager];
    [v16 addObserver:v6 selector:sel_accountOrDeviceDidUpdate_ name:@"HMDAppleAccountManagerResolved" object:v17];

    id v10 = [(HMDResidentDeviceManagerRoarV3 *)v6 notificationCenter];
    __int16 v11 = [(HMDResidentDeviceManagerRoarV3 *)v6 appleAccountManager];
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

- (void)_updatePrimaryResidentSelectionTimestamp:(id)a3
{
  id v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  primaryResidentSelectionTimestamp = self->_primaryResidentSelectionTimestamp;
  self->_primaryResidentSelectionTimestamp = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)primaryResidentSelectionTimestamp
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_primaryResidentSelectionTimestamp;
  os_unfair_lock_unlock(p_lock);
  return v4;
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
    id v12 = [(HMDResidentDeviceManagerRoarV3 *)v9 primaryResidentDevice];
    [(HMDResidentDeviceManagerRoarV3 *)v9 _notifyUpdatedGenerationIDWithPrimaryResident:v12];
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
  id v5 = [(HMDResidentDeviceManagerRoarV3 *)self queue];
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
        id v6 = [(HMDResidentDeviceManagerRoarV3 *)self primaryResidentUUID];

        if (v6)
        {
          char v7 = [(HMDResidentDeviceManagerRoarV3 *)self primaryResidentUUID];
          id v8 = [(HMDResidentDeviceManagerRoarV3 *)self residentWithUUID:v7];

          if (v8)
          {
            [(HMDResidentDeviceManagerRoarV3 *)self notifyUpdatedPrimaryResident:v8 previousPrimaryResident:0];
          }
          else
          {
            int v14 = (void *)MEMORY[0x230FBD990]();
            uint64_t v15 = self;
            __int16 v16 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              id v17 = HMFGetLogIdentifier();
              uint64_t v18 = [(HMDResidentDeviceManagerRoarV3 *)v15 primaryResidentUUID];
              int v19 = 138543618;
              __int16 v20 = v17;
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
            __int16 v20 = v13;
            _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Primary resident UUID is not set, cannot find the primary resident device (yet)", (uint8_t *)&v19, 0xCu);
          }
        }
        [(HMDResidentDeviceManagerRoarV3 *)self _discoverPrimaryResidentForRequester:0];
      }
      else
      {
        int v9 = [(HMDResidentDeviceManagerRoarV3 *)self primaryDiscoveryManager];
        [v9 cancel];
      }
    }
    [(HMDResidentDeviceManagerRoarV3 *)self notifyResidentAvailable:v3];
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (BOOL)hasAnyResident
{
  BOOL v3 = [(HMDResidentDeviceManagerRoarV3 *)self residentDevicesSet];
  int v4 = objc_msgSend(v3, "hmf_isEmpty");

  if (!v4) {
    return 1;
  }
  id v5 = [(HMDResidentDeviceManagerRoarV3 *)self backingStore];
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
  id v5 = [(HMDResidentDeviceManagerRoarV3 *)self availableResidentDevices];
  if ([v5 count]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = v3;
  }

  [(HMDResidentDeviceManagerRoarV3 *)self setResidentAvailable:v3];
}

- (void)updateResidentAvailability
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__HMDResidentDeviceManagerRoarV3_updateResidentAvailability__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __60__HMDResidentDeviceManagerRoarV3_updateResidentAvailability__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateResidentAvailability:0];
}

- (void)removeResidentDevice:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__HMDResidentDeviceManagerRoarV3_removeResidentDevice___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __55__HMDResidentDeviceManagerRoarV3_removeResidentDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeResidentDevice:*(void *)(a1 + 40)];
}

- (void)_stopActingAsResidentViaStatusKit
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    int v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping acting as a resident via StatusKit", (uint8_t *)&v8, 0xCu);
  }
  char v7 = [(HMDResidentDeviceManagerRoarV3 *)v4 statusChannel];
  [v7 stopPublishingAsResident];
}

- (void)_handleInitialTransitionToResidentSelectionWithCompletion:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDResidentDeviceManagerRoarV3 *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(HMDResidentDeviceManagerRoarV3 *)self configuredStatusKitForResidentSelection];
  char v7 = (void *)MEMORY[0x230FBD990]();
  int v8 = self;
  int v9 = HMFGetOSLogHandle();
  uint64_t v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = HMFGetLogIdentifier();
      *(_DWORD *)int buf = 138543362;
      id v54 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Handling initial transition to resident selection - already configured, ignoring", buf, 0xCu);
    }
LABEL_11:
    v44 = _Block_copy(v4);
    uint64_t v31 = v44;
    if (v44) {
      (*((void (**)(void *, void))v44 + 2))(v44, 0);
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = HMFGetLogIdentifier();
    *(_DWORD *)int buf = 138543362;
    id v54 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Handling initial transition to resident selection", buf, 0xCu);
  }
  [(HMDResidentDeviceManagerRoarV3 *)v8 setConfiguredStatusKitForResidentSelection:1];
  __int16 v13 = [(HMDResidentDeviceManagerRoarV3 *)v8 dataSource];
  int v14 = [(HMDResidentDeviceManagerRoarV3 *)v8 home];
  uint64_t v15 = [v13 createResidentStatusChannelForHome:v14 queue:v8->_queue];
  statusChannel = v8->_statusChannel;
  v8->_statusChannel = (HMDResidentStatusChannel *)v15;

  id v17 = [(HMDResidentDeviceManagerRoarV3 *)v8 statusChannel];
  [v17 addObserver:v8];

  uint64_t v18 = [HMDResidentStatusChannelManager alloc];
  int v19 = [(HMDResidentDeviceManagerRoarV3 *)v8 statusChannel];
  __int16 v20 = [(HMDResidentDeviceManagerRoarV3 *)v8 queue];
  __int16 v21 = [(HMDResidentDeviceManagerRoarV3 *)v8 idsServerBag];
  uint64_t v22 = [(HMDResidentStatusChannelManager *)v18 initWithResidentStatusChannel:v19 queue:v20 idsServerBag:v21];
  residentStatusChannelManager = v8->_residentStatusChannelManager;
  v8->_residentStatusChannelManager = (HMDResidentStatusChannelManager *)v22;

  id v24 = [(HMDResidentDeviceManagerRoarV3 *)v8 residentStatusChannelManager];
  id v25 = [(HMDResidentDeviceManagerRoarV3 *)v8 statusChannel];
  [v25 setManager:v24];

  unint64_t v26 = [(HMDResidentDeviceManagerRoarV3 *)v8 residentStatusChannelManager];
  [v26 configure];

  if (![(HMDResidentDeviceManagerRoarV3 *)v8 isActingAsResident]) {
    goto LABEL_11;
  }
  uint64_t v27 = [(HMDResidentDeviceManagerRoarV3 *)v8 residentLocationHandler];
  [v27 configure];

  id v28 = [(HMDResidentDeviceManagerRoarV3 *)v8 residentLocationHandler];
  [v28 requestResidentLocation];

  id v29 = objc_alloc(MEMORY[0x263F42520]);
  __int16 v30 = [(HMDResidentDeviceManagerRoarV3 *)v8 queue];
  uint64_t v31 = (void *)[v29 initWithQueue:v30];

  uint64_t v32 = [(HMDResidentDeviceManagerRoarV3 *)v8 _statusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds];
  double v34 = v33;
  double v35 = (void *)MEMORY[0x230FBD990](v32);
  __int16 v36 = v8;
  int v37 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    char v38 = HMFGetLogIdentifier();
    *(_DWORD *)int buf = 138543618;
    id v54 = v38;
    __int16 v55 = 2048;
    double v56 = v34;
    _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Setting timeout of %f for initial connected to status kit future", buf, 0x16u);
  }
  __int16 v39 = [(HMDResidentDeviceManagerRoarV3 *)v36 residentStatusChannel];
  long long v40 = [v39 initialConnectedToStatusKitFuture];
  uint64_t v41 = [v40 timeout:v34];

  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __92__HMDResidentDeviceManagerRoarV3__handleInitialTransitionToResidentSelectionWithCompletion___block_invoke;
  v51[3] = &unk_264A2A7E0;
  v51[4] = v36;
  id v52 = v4;
  uint64_t v45 = MEMORY[0x263EF8330];
  uint64_t v46 = 3221225472;
  v47 = __92__HMDResidentDeviceManagerRoarV3__handleInitialTransitionToResidentSelectionWithCompletion___block_invoke_206;
  uint64_t v48 = &unk_264A2A808;
  v49 = v36;
  id v50 = v52;
  id v42 = (id)[v41 inContext:v31 then:v51 orRecover:&v45];
  uint64_t v43 = [(HMDResidentDeviceManagerRoarV3 *)v36 residentStatusChannelManager];
  [v43 addClientWithIdentifier:@"resident.device.manager"];

LABEL_13:
}

uint64_t __92__HMDResidentDeviceManagerRoarV3__handleInitialTransitionToResidentSelectionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  BOOL v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Handling initial transition to resident selection - Received initial Resident Status Channel state.", (uint8_t *)&v9, 0xCu);
  }
  [*(id *)(a1 + 32) _determineResidentLocationWithCompletion:*(void *)(a1 + 40)];

  return 1;
}

uint64_t __92__HMDResidentDeviceManagerRoarV3__handleInitialTransitionToResidentSelectionWithCompletion___block_invoke_206(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  BOOL v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    char v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Handling initial transition to resident selection - Initial Resident Status Channel state returned error: %@.", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) _determineResidentLocationWithCompletion:*(void *)(a1 + 40)];

  return 1;
}

- (void)_checkPrimaryResidentDeviceRemoved:(id)a3 currentPrimary:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableSet *)self->_residentDevices count];
  int v9 = [v7 isEqual:v6];
  uint64_t v10 = [(HMDResidentDeviceManagerRoarV3 *)self primaryResidentDevice];

  if (v9)
  {
    __int16 v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      int v15 = 138543618;
      __int16 v16 = v14;
      __int16 v17 = 2048;
      uint64_t v18 = v8;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Current primary got removed. There are %lu residents remaining.", (uint8_t *)&v15, 0x16u);
    }
    if (!v10) {
      [(HMDResidentDeviceManagerRoarV3 *)v12 _handleUpdatedPrimaryResidentDevice:0 previousPrimaryResident:v7 generationID:0 changeSource:0];
    }
  }
}

- (void)_removeResidentDevice:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HMDResidentDeviceManagerRoarV3 *)self primaryResidentDevice];
    os_unfair_lock_lock_with_options();
    if ([(NSMutableSet *)self->_residentDevices containsObject:v4])
    {
      [(NSMutableSet *)self->_residentDevices removeObject:v4];
      os_unfair_lock_unlock(&self->_lock);
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __56__HMDResidentDeviceManagerRoarV3__removeResidentDevice___block_invoke;
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

void __56__HMDResidentDeviceManagerRoarV3__removeResidentDevice___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 residentDeviceManagerDidUpdateResidents:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) _sendResidentDeviceNotificationWithName:@"HMDResidentDeviceManagerRemoveResidentNotification" forResidentDevice:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) home];
  [v3 reEvaluateHomeHubState];
  [v3 evaluateResidentUpdate];
  [v3 evaluateBulletinNotificationsSupported];
  [*(id *)(a1 + 32) _updateResidentAvailability:0];
  id v4 = [*(id *)(a1 + 40) device];
  v8[0] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  [v3 disableNotificationsForDevices:v5];

  if ([*(id *)(a1 + 40) isCurrentDevice])
  {
    [*(id *)(a1 + 32) setActingAsResident:0];
    id v6 = [*(id *)(a1 + 32) residentSelectionManager];
    [v6 stop];

    if ([*(id *)(a1 + 32) homeSupportsResidentSelection])
    {
      [*(id *)(a1 + 32) _stopActingAsResidentViaStatusKit];
      id v7 = [*(id *)(a1 + 32) residentStatusChannelManager];
      [v7 removeClientWithIdentifier:@"resident.device.manager"];
    }
  }
  [*(id *)(a1 + 32) _checkPrimaryResidentDeviceRemoved:*(void *)(a1 + 40) currentPrimary:*(void *)(a1 + 48)];
}

- (void)_addResidentDevice:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDResidentDeviceManagerRoarV3 *)self queue];
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_lock_with_options();
  id v6 = [(NSMutableSet *)self->_residentDevices member:v4];
  if (v6)
  {

    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_29;
  }
  [(NSMutableSet *)self->_residentDevices addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    *(_DWORD *)int buf = 138543618;
    id v42 = v10;
    __int16 v43 = 2112;
    id v44 = v4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Added resident device %@", buf, 0x16u);
  }
  __int16 v11 = [(HMDResidentDeviceManagerRoarV3 *)v8 home];
  [v4 configureWithHome:v11];
  id v12 = [(HMDResidentDeviceManagerRoarV3 *)v8 primaryResidentUUID];
  BOOL v13 = v12 == 0;

  if (v13) {
    [v4 setReachable:0];
  }
  if ([(HMDResidentDeviceManagerRoarV3 *)v8 isCurrentDeviceConfirmedPrimaryResident])
  {
    if (([v4 isReachable] & 1) == 0)
    {
      int v14 = [(HMDResidentDeviceManagerRoarV3 *)v8 residentSelectionManager];
      BOOL v15 = [v14 currentModeType] == 1;

      if (v15)
      {
        __int16 v16 = [(HMDResidentDeviceManagerRoarV3 *)v8 residentSelectionManager];
        int v17 = [v16 residentIsLocallyReachable:v4];

        if (v17)
        {
          [(HMDResidentDeviceManagerRoarV3 *)v8 _updateReachability:1 forResidentDevice:v4];
          uint64_t v18 = [(HMDResidentDeviceManagerRoarV3 *)v8 backingStore];
          uint64_t v19 = [MEMORY[0x263EFFA08] setWithObject:v4];
          [v18 updateReachabilityForResidents:v19];
        }
      }
    }
  }
  [(HMDResidentDeviceManagerRoarV3 *)v8 _updateResidentAvailability:0];
  __int16 v20 = [(HMDResidentDeviceManagerRoarV3 *)v8 delegate];
  [v20 residentDeviceManagerDidUpdateResidents:v8];

  [(HMDResidentDeviceManagerRoarV3 *)v8 _sendResidentDeviceNotificationWithName:@"HMDResidentDeviceManagerAddResidentNotification" forResidentDevice:v4];
  [v11 reEvaluateHomeHubState];
  [v11 evaluateBulletinNotificationsSupported];
  __int16 v21 = [(HMDResidentDeviceManagerRoarV3 *)v8 primaryResidentUUID];
  uint64_t v22 = [v4 identifier];
  if ([v21 isEqual:v22])
  {
  }
  else
  {
    uint64_t v23 = [(HMDResidentDeviceManagerRoarV3 *)v8 primaryResidentDevice];
    id v24 = [v23 device];
    if (![v24 isCurrentDevice])
    {

      goto LABEL_19;
    }
    int v25 = [v4 isEnabled];

    if (!v25) {
      goto LABEL_20;
    }
  }
  __int16 v21 = [v4 device];
  long long v40 = v21;
  uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
  [v11 enableNotificationsForDevices:v22];
LABEL_19:

LABEL_20:
  unint64_t v26 = [v4 device];
  if ([v26 isCurrentDevice])
  {
    uint64_t v27 = [v11 homeManager];
    id v28 = [v27 currentAccessorySetupMetricDispatcher];
    id v29 = (void *)MEMORY[0x230FBD990]([v28 markSetupBeginStage:14 error:0]);
    __int16 v30 = v8;
    uint64_t v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      uint64_t v32 = HMFGetLogIdentifier();
      double v33 = [v11 residentSelectionVersion];
      *(_DWORD *)int buf = 138543618;
      id v42 = v32;
      __int16 v43 = 2114;
      id v44 = v33;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Current device added as resident to home with resident selection version %{public}@", buf, 0x16u);
    }
    if ([(HMDResidentDeviceManagerRoarV3 *)v30 homeSupportsResidentSelection])
    {
      double v34 = [(HMDResidentDeviceManagerRoarV3 *)v30 residentLocationHandler];
      [v34 configure];

      double v35 = [(HMDResidentDeviceManagerRoarV3 *)v30 residentLocationHandler];
      __int16 v36 = [v35 residentLocationRawValue];
      BOOL v37 = [v36 unsignedIntegerValue] == 100;

      if (v37)
      {
        char v38 = [(HMDResidentDeviceManagerRoarV3 *)v30 residentLocationHandler];
        [v38 requestResidentLocation];
      }
      __int16 v39 = [(HMDResidentDeviceManagerRoarV3 *)v30 residentStatusChannelManager];
      [v39 addClientWithIdentifier:@"resident.device.manager"];
    }
    [(HMDResidentDeviceManagerRoarV3 *)v30 _setupAsAResident];
  }
LABEL_29:
}

- (id)residentDevicesWithIDSIdentifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        __int16 v11 = -[HMDResidentDeviceManagerRoarV3 residentDeviceWithIDSIdentifier:](self, "residentDeviceWithIDSIdentifier:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = (void *)[v5 copy];
  return v12;
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
        __int16 v11 = objc_msgSend(v10, "device", (void)v15);
        id v12 = [v11 idsIdentifier];
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
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
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
  id v2 = [(HMDResidentDeviceManagerRoarV3 *)self primaryResidentDevice];
  id v3 = [v2 device];

  return (HMDDevice *)v3;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  id v2 = [(HMDResidentDeviceManagerRoarV3 *)self primaryResidentDevice];
  char v3 = [v2 isCurrentDevice];

  return v3;
}

- (BOOL)isCurrentDeviceAvailableResident
{
  id v2 = [(HMDResidentDeviceManagerRoarV3 *)self ourSelf];
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
  id v2 = [(HMDResidentDeviceManagerRoarV3 *)self residentDevices];
  char v3 = objc_msgSend(v2, "hmf_objectPassingTest:", &__block_literal_global_239099);

  return v3;
}

uint64_t __41__HMDResidentDeviceManagerRoarV3_ourSelf__block_invoke(uint64_t a1, void *a2)
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
  id v5 = [(HMDResidentDeviceManagerRoarV3 *)self residentDevices];
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
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 identifier];
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
  uint64_t v3 = [(HMDResidentDeviceManagerRoarV3 *)self residentDevicesSet];
  id v4 = [(HMDResidentDeviceManagerRoarV3 *)self primaryResidentUUID];
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
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "identifier", (void)v13);
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
    uint64_t v9 = HMFGetLogIdentifier();
    uint64_t v10 = NSStringFromSelector(a2);
    int v11 = 138543618;
    char v12 = v9;
    __int16 v13 = 2112;
    long long v14 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Method \"%@\" no longer relevant in HH2", (uint8_t *)&v11, 0x16u);
  }
}

- (HMDIDSServerBag)idsServerBag
{
  uint64_t v3 = [(HMDResidentDeviceManagerRoarV3 *)self dataSource];
  id v4 = [(HMDResidentDeviceManagerRoarV3 *)self home];
  id v5 = [v3 idsServerBagForHome:v4];

  return (HMDIDSServerBag *)v5;
}

- (void)_teardownSessionWithPrimaryResidentDevice
{
  id v4 = [(HMDResidentDeviceManagerRoarV3 *)self messageDispatcher];
  uint64_t v3 = [(HMDResidentDeviceManagerRoarV3 *)self home];
  [v4 setRemoteAccessDevice:0 forHome:v3];
}

- (void)_setupSessionWithPrimaryResidentDevice
{
  id v6 = [(HMDResidentDeviceManagerRoarV3 *)self primaryResidentDevice];
  if (v6)
  {
    uint64_t v3 = [(HMDResidentDeviceManagerRoarV3 *)self messageDispatcher];
    id v4 = [v6 device];
    id v5 = [(HMDResidentDeviceManagerRoarV3 *)self home];
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
  uint64_t v7 = [(HMDResidentDeviceManagerRoarV3 *)v4 home];
  uint64_t v8 = [(HMDResidentDeviceManagerRoarV3 *)v4 primaryResidentDevice];
  if (v8 && [(HMDResidentDeviceManagerRoarV3 *)v4 isResidentSupported])
  {
    [v7 subscribeForNotificationsFromRemoteGateway];
  }
  else
  {
    uint64_t v9 = [(HMDResidentDeviceManagerRoarV3 *)v4 messageDispatcher];
    uint64_t v10 = [v9 remoteAccessDeviceForHome:v7];

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
      [(HMDResidentDeviceManagerRoarV3 *)v14 _teardownSessionWithPrimaryResidentDevice];
    }
  }
}

- (void)run
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__HMDResidentDeviceManagerRoarV3_run__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __37__HMDResidentDeviceManagerRoarV3_run__block_invoke(uint64_t a1)
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
    uint64_t v9 = NSStringFromSelector(a2);
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
  id v4 = [(HMDResidentDeviceManagerRoarV3 *)self residentDevices];
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
  uint64_t v5 = [(HMDResidentDeviceManagerRoarV3 *)self appleAccountManager];
  uint64_t v6 = [v5 device];

  uint64_t v7 = [(HMDResidentDeviceManagerRoarV3 *)self backingStore];
  uint64_t v8 = [(HMDResidentDeviceManagerRoarV3 *)self residentDevicesSet];
  int v9 = objc_msgSend(v7, "handleCloudResidentChange:currentResidents:isCurrentDevicePrimaryResident:currentDevice:", v4, v8, -[HMDResidentDeviceManagerRoarV3 isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident"), v6);

  [(HMDResidentDeviceManagerRoarV3 *)self _checkForResidentSelectionInfoUpdateInNotification:v4];
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
  void v15[2] = __61__HMDResidentDeviceManagerRoarV3__handleCloudResidentChange___block_invoke;
  v15[3] = &unk_264A2F820;
  v15[4] = self;
  id v16 = v9;
  dispatch_async(queue, v15);

LABEL_6:
}

void __61__HMDResidentDeviceManagerRoarV3__handleCloudResidentChange___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
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
    uint64_t v32 = v5;
    __int16 v33 = 2048;
    uint64_t v34 = v7;
    __int16 v35 = 2048;
    uint64_t v36 = v9;
    __int16 v37 = 2048;
    uint64_t v38 = [v10 count];
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Residents changed, added: %lu; removed: %lu; reachability: %lu",
      buf,
      0x2Au);
  }
  int v11 = [*(id *)(a1 + 40) deletedResidentDevices];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __61__HMDResidentDeviceManagerRoarV3__handleCloudResidentChange___block_invoke_196;
  v30[3] = &unk_264A2A788;
  v30[4] = *(void *)(a1 + 32);
  objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v30);

  long long v12 = [*(id *)(a1 + 40) addedResidentDevices];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __61__HMDResidentDeviceManagerRoarV3__handleCloudResidentChange___block_invoke_198;
  v29[3] = &unk_264A2A788;
  v29[4] = *(void *)(a1 + 32);
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v29);

  long long v13 = [*(id *)(a1 + 40) reachabilityUpdates];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __61__HMDResidentDeviceManagerRoarV3__handleCloudResidentChange___block_invoke_199;
  v28[3] = &unk_264A2A788;
  v28[4] = *(void *)(a1 + 32);
  objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v28);

  uint64_t v14 = [*(id *)(a1 + 40) addedResidentDevices];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    id v16 = [*(id *)(a1 + 32) residentSelectionManager];
    uint64_t v17 = [*(id *)(a1 + 40) addedResidentDevices];
    [v16 didAddResidentsToHome:v17];

    if ([*(id *)(a1 + 32) homeSupportsResidentSelection])
    {
      uint64_t v18 = [*(id *)(a1 + 32) residentStatusChannel];
      int v19 = [v18 isConnected];

      if (v19)
      {
        uint64_t v20 = (void *)MEMORY[0x230FBD990]();
        id v21 = *(id *)(a1 + 32);
        uint64_t v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = HMFGetLogIdentifier();
          *(_DWORD *)int buf = 138543362;
          uint64_t v32 = v23;
          _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Cloud added resident refresh residents reachability", buf, 0xCu);
        }
        [*(id *)(a1 + 32) _refreshAllResidentsReachabilityFromStatusKit];
      }
    }
  }
  id v24 = [*(id *)(a1 + 40) deletedResidentDevices];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    unint64_t v26 = [*(id *)(a1 + 32) residentSelectionManager];
    uint64_t v27 = [*(id *)(a1 + 40) deletedResidentDevices];
    [v26 didRemoveResidentsFromHome:v27];
  }
}

void __61__HMDResidentDeviceManagerRoarV3__handleCloudResidentChange___block_invoke_196(uint64_t a1, void *a2)
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
    uint64_t v15 = v9;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Cloud removed resident: %@ (%{public}@)", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(a1 + 32) _removeResidentDevice:v3];
}

void __61__HMDResidentDeviceManagerRoarV3__handleCloudResidentChange___block_invoke_198(uint64_t a1, void *a2)
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
    uint64_t v15 = v9;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Cloud added resident: %@ (%{public}@)", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(a1 + 32) _addResidentDevice:v3];
}

void __61__HMDResidentDeviceManagerRoarV3__handleCloudResidentChange___block_invoke_199(uint64_t a1, void *a2)
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
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    int v19 = v11;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Cloud updated resident reachability: %@ (%{public}@) -> %@", (uint8_t *)&v12, 0x2Au);
  }
  [*(id *)(a1 + 32) _updateReachability:v4 forResidentDevice:v3];
}

- (unint64_t)myLocation
{
  id v2 = [(HMDResidentDeviceManagerRoarV3 *)self residentLocationHandler];
  id v3 = [v2 residentLocationRawValue];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (unint64_t)residentSelectionMode
{
  id v2 = [(HMDResidentDeviceManagerRoarV3 *)self residentSelectionManager];
  unint64_t v3 = [v2 currentModeType];

  return v3;
}

- (NSArray)autoSelectedPreferredResidents
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(HMDResidentDeviceManagerRoarV3 *)self electorsPreferredResidentsList];
  unint64_t v4 = [v3 residentIDSIdentifiers];
  id v5 = (void *)[v4 mutableCopy];

  id v6 = [(HMDResidentDeviceManagerRoarV3 *)self residentDevicesWithIDSIdentifiers:v5];
  uint64_t v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = [(HMDResidentDeviceManagerRoarV3 *)self residentSelectionManager];
  uint64_t v9 = [v8 residentsNotPresentInPreferredResidentsList:v3];

  int v10 = (void *)MEMORY[0x230FBD990]([v7 addObjectsFromArray:v9]);
  int v11 = self;
  int v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    long long v13 = HMFGetLogIdentifier();
    __int16 v14 = [v7 shortDescription];
    int v17 = 138543618;
    __int16 v18 = v13;
    __int16 v19 = 2112;
    uint64_t v20 = v14;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEBUG, "%{public}@autoSelectedPreferredResidents: %@.", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithArray:v7];

  return (NSArray *)v15;
}

- (HMDResidentDevice)userSelectedPreferredResident
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(HMDResidentDeviceManagerRoarV3 *)self residentSelectionManager];
  uint64_t v4 = [v3 currentModeType];

  if (v4 == 2)
  {
    id v5 = [(HMDResidentDeviceManagerRoarV3 *)self residentSelectionInfo];
    id v6 = [v5 preferredResidentIDSIdentifier];

    if (v6)
    {
      uint64_t v7 = [(HMDResidentDeviceManagerRoarV3 *)self residentDeviceWithIDSIdentifier:v6];
      uint64_t v8 = (void *)MEMORY[0x230FBD990]();
      uint64_t v9 = self;
      int v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int v11 = HMFGetLogIdentifier();
        int v12 = [v7 shortDescription];
        int v18 = 138543618;
        __int16 v19 = v11;
        __int16 v20 = 2112;
        uint64_t v21 = v12;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@User preferred resident: %@.", (uint8_t *)&v18, 0x16u);
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    long long v13 = (void *)MEMORY[0x230FBD990]();
    __int16 v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      __int16 v16 = HMFGetLogIdentifier();
      int v18 = 138543362;
      __int16 v19 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEBUG, "%{public}@We are not in Manual mode. Returning nil for user preferred resident.", (uint8_t *)&v18, 0xCu);
    }
    uint64_t v7 = 0;
  }
  return (HMDResidentDevice *)v7;
}

- (NSArray)residentsPresentOnStatusKit
{
  unint64_t v3 = [MEMORY[0x263EFF9C0] set];
  uint64_t v4 = [(HMDResidentDeviceManagerRoarV3 *)self statusChannel];
  id v5 = [v4 presentResidentStatuses];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__HMDResidentDeviceManagerRoarV3_residentsPresentOnStatusKit__block_invoke;
  v9[3] = &unk_264A2A760;
  id v10 = v3;
  id v6 = v3;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);

  uint64_t v7 = [v6 allObjects];

  return (NSArray *)v7;
}

void __61__HMDResidentDeviceManagerRoarV3_residentsPresentOnStatusKit__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 idsIdentifier];
  [v2 addObject:v3];
}

- (HMDResidentSelectionInfo)residentSelectionInfo
{
  id v3 = [(HMDResidentDeviceManagerRoarV3 *)self backingStore];
  uint64_t v4 = [v3 residentSelectionInfo];

  id v5 = [(HMDResidentDeviceManagerRoarV3 *)self presentResidentsStatuses];
  id v6 = [v5 selectionInfo];

  id v7 = v6;
  uint64_t v8 = [v4 selectionTimestamp];
  uint64_t v9 = [v7 selectionTimestamp];
  id v10 = (void *)v9;
  id v11 = v7;
  if (v8)
  {
    if (!v9 || (id v11 = v7, [v8 compare:v9] == 1))
    {
      id v11 = v4;
    }
  }

  return (HMDResidentSelectionInfo *)v11;
}

- (BOOL)homeSupportsResidentSelection
{
  id v2 = [(HMDResidentDeviceManagerRoarV3 *)self home];
  id v3 = [v2 residentSelectionVersion];
  BOOL v4 = [v3 integerValue] > 2;

  return v4;
}

- (void)_checkForResidentSelectionInfoUpdateInNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentDeviceManagerRoarV3 *)self backingStore];
  int v6 = [v5 hasResidentSelectionInfoUpdateInNotification:v4];

  if (v6)
  {
    [(HMDResidentDeviceManagerRoarV3 *)self _checkForResidentSelectionInfoUpdate];
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __85__HMDResidentDeviceManagerRoarV3__checkForResidentSelectionInfoUpdateInNotification___block_invoke;
    block[3] = &unk_264A2F7F8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __85__HMDResidentDeviceManagerRoarV3__checkForResidentSelectionInfoUpdateInNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pendingNotifyPrimaryChanged];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) pendingNotifyPrimaryChanged];
    v3[2]();

    id v4 = *(void **)(a1 + 32);
    [v4 setPendingNotifyPrimaryChanged:0];
  }
}

- (void)_checkForResidentSelectionInfoUpdate
{
  id v3 = [(HMDResidentDeviceManagerRoarV3 *)self backingStore];
  id v4 = [v3 residentSelectionInfo];

  if (v4)
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __70__HMDResidentDeviceManagerRoarV3__checkForResidentSelectionInfoUpdate__block_invoke;
    v6[3] = &unk_264A2F820;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(queue, v6);
  }
}

void __70__HMDResidentDeviceManagerRoarV3__checkForResidentSelectionInfoUpdate__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) residentSelectionManager];
  [v2 didUpdateResidentSelectionModelTo:*(void *)(a1 + 40)];
}

- (id)residentIDSIdentifierToLocationMap
{
  id v3 = [(HMDResidentDeviceManagerRoarV3 *)self presentResidentsStatuses];
  id v4 = [v3 residentIDSIdentifierToLocationMap];
  id v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [(HMDResidentDeviceManagerRoarV3 *)self currentResidentDevice];
  if (v6)
  {
    id v7 = (void *)v6;
    uint64_t v8 = [(HMDResidentDeviceManagerRoarV3 *)self currentResidentDevice];
    uint64_t v9 = [v8 device];
    id v10 = [v9 idsIdentifier];
    id v11 = [v5 objectForKeyedSubscript:v10];

    if (!v11)
    {
      int v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDResidentDeviceManagerRoarV3 myLocation](self, "myLocation"));
      long long v13 = [(HMDResidentDeviceManagerRoarV3 *)self currentResidentDevice];
      __int16 v14 = [v13 device];
      uint64_t v15 = [v14 idsIdentifier];
      [v5 setObject:v12 forKeyedSubscript:v15];
    }
  }
  __int16 v16 = (void *)[v5 copy];

  return v16;
}

- (id)preferredResidentUUIDs
{
  id v2 = [(HMDResidentDeviceManagerRoarV3 *)self electorsPreferredResidentsList];
  id v3 = [v2 residentIDSIdentifiers];

  return v3;
}

- (HMDPreferredResidentsList)electorsPreferredResidentsList
{
  id v2 = [(HMDResidentDeviceManagerRoarV3 *)self presentResidentsStatuses];
  id v3 = [v2 preferredResidentsList];

  return (HMDPreferredResidentsList *)v3;
}

- (void)_startResidentSelectionManager
{
  id v3 = [(HMDResidentDeviceManagerRoarV3 *)self dataSource];
  id v4 = [v3 createResidentSelectionManagerWithContext:self];
  [(HMDResidentDeviceManagerRoarV3 *)self setResidentSelectionManager:v4];

  id v5 = [(HMDResidentDeviceManagerRoarV3 *)self residentSelectionManager];
  [v5 setDelegate:self];

  [(HMDResidentDeviceManagerRoarV3 *)self _checkForResidentSelectionInfoUpdate];
  id v6 = [(HMDResidentDeviceManagerRoarV3 *)self residentSelectionManager];
  [v6 start];
}

- (id)_electorForDeterminingResidentLocationFromPresentResidentStatuses:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_msgSend(v4, "hmf_isEmpty"))
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v12 = 138543362;
      long long v13 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@No present resident statuses, returning ourselves as the elector", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v9 = [(HMDResidentDeviceManagerRoarV3 *)v6 ourSelf];
  }
  else
  {
    id v10 = [[HMDResidentSelectionStatusKit alloc] initWithWithContext:self residentStatusList:v4];
    uint64_t v9 = [(HMDResidentSelectionStatusKit *)v10 elector];
  }
  return v9;
}

- (id)_residentStatusWithPreferredResidentsList:(id)a3
{
  id v4 = a3;
  if ([(HMDResidentDeviceManagerRoarV3 *)self isCurrentDevicePrimaryResident])
  {
    id v5 = [(HMDResidentDeviceManagerRoarV3 *)self primaryResidentGenerationID];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = [(HMDResidentDeviceManagerRoarV3 *)self residentLocationHandler];
  id v7 = [v6 residentLocationRawValue];

  uint64_t v8 = [HMDUnpublishedResidentStatus alloc];
  uint64_t v9 = +[HMDHomeKitVersion currentVersion];
  id v10 = [(HMDResidentDeviceManagerRoarV3 *)self backingStore];
  id v11 = [v10 residentSelectionInfo];
  int v12 = [(HMDUnpublishedResidentStatus *)v8 initWithVersion:v9 generationID:v5 preferredResidentsList:v4 selectionInfo:v11 connectionType:[(HMDResidentDeviceManagerRoarV3 *)self ourNetworkConnectionType] locationRawValue:v7];

  return v12;
}

- (unint64_t)ourNetworkConnectionType
{
  default_evaluator = (void *)nw_path_create_default_evaluator();
  id v3 = nw_path_evaluator_copy_path();
  if (nw_path_uses_interface_type(v3, nw_interface_type_wired))
  {
    unint64_t v4 = 1;
  }
  else if (nw_path_uses_interface_type(v3, nw_interface_type_wifi))
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)_publishCurrentResidentStatusWithReason:(int64_t)a3 preferredResidentsList:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(HMDResidentDeviceManagerRoarV3 *)self residentStatusChannel];

  if (!v7)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      long long v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      __int16 v16 = v13;
      uint64_t v14 = "%{public}@Attempting to publish current resident status but Resident Status Channel is nil";
LABEL_8:
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v15, 0xCu);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (![(HMDResidentDeviceManagerRoarV3 *)self configuredStatusKitForResidentSelection])
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      long long v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      __int16 v16 = v13;
      uint64_t v14 = "%{public}@Attempting to publish current resident status before Resident Status Channel is configured";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  uint64_t v8 = [(HMDResidentDeviceManagerRoarV3 *)self _residentStatusWithPreferredResidentsList:v6];
  uint64_t v9 = [(HMDResidentDeviceManagerRoarV3 *)self statusChannel];
  [v9 publishResidentStatus:v8 reason:a3];

LABEL_10:
}

- (double)blockPrimaryTakeoverDuration
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  [(HMDResidentDeviceManagerRoarV3 *)self blockPrimaryTakeoverStartTime];
  double v3 = 0.0;
  if (v4 >= 0.0)
  {
    id v5 = [(HMDResidentDeviceManagerRoarV3 *)self idsServerBag];
    id v6 = [v5 residentDeviceManagerBlockPrimaryTakeoverDurationSeconds];

    if (v6)
    {
      [v6 doubleValue];
      double v8 = v7;
    }
    else
    {
      double v8 = 300.0;
    }
    HMFUptime();
    double v10 = v9;
    uint64_t v11 = [(HMDResidentDeviceManagerRoarV3 *)self blockPrimaryTakeoverStartTime];
    double v13 = v10 - v12;
    double v3 = 0.0;
    if (v13 < v8)
    {
      double v3 = v8 - v13;
      uint64_t v14 = (void *)MEMORY[0x230FBD990](v11);
      int v15 = self;
      __int16 v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        [(HMDResidentDeviceManagerRoarV3 *)v15 blockPrimaryTakeoverStartTime];
        int v20 = 138544130;
        uint64_t v21 = v17;
        __int16 v22 = 2048;
        uint64_t v23 = v18;
        __int16 v24 = 2048;
        double v25 = v13;
        __int16 v26 = 2048;
        double v27 = v8 - v13;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Blocking primary takeover (start: %fs, durationAlreadyBlocked: %fs, durationLeft: %fs)", (uint8_t *)&v20, 0x2Au);
      }
    }
  }
  return v3;
}

- (double)_initialConnectionToStatusKitOnResidentTimeout
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  double v3 = [(HMDResidentDeviceManagerRoarV3 *)self userDefaults];
  double v4 = [v3 objectForKey:@"TTSU.Finished"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  double v7 = [(HMDResidentDeviceManagerRoarV3 *)self userDefaults];
  [v7 removeObjectForKey:@"TTSU.Finished"];

  if (v6) {
    char v8 = [v6 BOOLValue];
  }
  else {
    char v8 = 0;
  }
  char v9 = v8 & ~isAppleTV();
  double v10 = [(HMDResidentDeviceManagerRoarV3 *)self userDefaults];
  uint64_t v11 = [v10 objectForKey:@"rpr"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v12 = v11;
  }
  else {
    double v12 = 0;
  }
  id v13 = v12;

  uint64_t v14 = [(HMDResidentDeviceManagerRoarV3 *)self userDefaults];
  [v14 removeObjectForKey:@"rpr"];

  int v15 = [(HMDResidentDeviceManagerRoarV3 *)self idsServerBag];
  __int16 v16 = [v15 statusKitInitialConnectionTimeoutSeconds];

  if (v16)
  {
    uint64_t v17 = [v16 doubleValue];
    double v19 = v18;
    if (v9) {
      goto LABEL_12;
    }
  }
  else
  {
    double v19 = 60.0;
    if (v9)
    {
LABEL_12:
      if (v13)
      {
        int v20 = (void *)MEMORY[0x230FBD990](v17);
        uint64_t v21 = self;
        __int16 v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = HMFGetLogIdentifier();
          [v13 BOOLValue];
          __int16 v24 = HMFBooleanToString();
          int v41 = 138543618;
          id v42 = v23;
          __int16 v43 = 2112;
          double v44 = *(double *)&v24;
          _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Determining initial StatusKit timeout: using hint from controller homeHasReachableResident: %@", (uint8_t *)&v41, 0x16u);
        }
        if ([v13 BOOLValue])
        {
LABEL_16:
          HMFUptime();
          goto LABEL_24;
        }
      }
      else
      {
        __int16 v30 = [(HMDResidentDeviceManagerRoarV3 *)self availableResidentDevices];
        unint64_t v31 = [v30 count];

        uint64_t v32 = (void *)MEMORY[0x230FBD990]();
        __int16 v33 = self;
        uint64_t v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v35 = HMFGetLogIdentifier();
          int v41 = 138543618;
          id v42 = v35;
          __int16 v43 = 2048;
          double v44 = *(double *)&v31;
          _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Determining initial StatusKit timeout: using available resident devices count: %lu", (uint8_t *)&v41, 0x16u);
        }
        if (v31 >= 2) {
          goto LABEL_16;
        }
      }
      [(HMDResidentDeviceManagerRoarV3 *)self _statusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds];
      double v19 = v36;
      double v25 = -1.0;
LABEL_24:
      __int16 v26 = (void *)MEMORY[0x230FBD990]([(HMDResidentDeviceManagerRoarV3 *)self setBlockPrimaryTakeoverStartTime:v25]);
      __int16 v37 = self;
      uint64_t v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v38 = HMFGetLogIdentifier();
        uint64_t v39 = HMFBooleanToString();
        int v41 = 138543874;
        id v42 = v38;
        __int16 v43 = 2048;
        double v44 = v19;
        __int16 v45 = 2112;
        uint64_t v46 = v39;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Using initial StatusKit timeout of: %f seconds (blockPrimaryTakeover: %@)", (uint8_t *)&v41, 0x20u);
      }
      goto LABEL_26;
    }
  }
  __int16 v26 = (void *)MEMORY[0x230FBD990](v17);
  double v27 = self;
  uint64_t v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    id v29 = HMFGetLogIdentifier();
    int v41 = 138543618;
    id v42 = v29;
    __int16 v43 = 2048;
    double v44 = v19;
    _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Using initial StatusKit timeout of: %f seconds", (uint8_t *)&v41, 0x16u);
  }
LABEL_26:

  return v19;
}

- (double)_statusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds
{
  id v2 = [(HMDResidentDeviceManagerRoarV3 *)self idsServerBag];
  double v3 = [v2 statusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 30.0;
  }

  return v5;
}

- (void)_startActingAsResident
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  double v3 = (void *)MEMORY[0x230FBD990]();
  double v4 = self;
  double v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v29 = 138543362;
    __int16 v30 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Met conditions required to start acting as a resident.", (uint8_t *)&v29, 0xCu);
  }
  double v7 = [(HMDResidentDeviceManagerRoarV3 *)v4 home];
  char v8 = [v7 homeManager];
  char v9 = [v8 currentAccessorySetupMetricDispatcher];
  [v9 markPrimaryResidentElectionJoinMesh];
  [(HMDResidentDeviceManagerRoarV3 *)v4 setActingAsResident:1];
  double v10 = [(HMDResidentDeviceManagerRoarV3 *)v4 primaryResidentDevice];
  if (v10)
  {
    uint64_t v11 = [(HMDResidentDeviceManagerRoarV3 *)v4 reachabilityObserver];
    double v12 = [v10 messageAddress];
    [v11 removeListener:v4 forDeviceAddress:v12];

    id v13 = [(HMDResidentDeviceManagerRoarV3 *)v4 deviceMonitor];
    uint64_t v14 = [v10 device];
    [v13 stopMonitoringDevice:v14 forClient:v4];
  }
  if ([(HMDResidentDeviceManagerRoarV3 *)v4 homeSupportsResidentSelection])
  {
    int v15 = [(HMDResidentDeviceManagerRoarV3 *)v4 residentLocationHandler];
    __int16 v16 = [v15 residentLocationRawValue];
    uint64_t v17 = [v16 unsignedIntegerValue];

    if (v17 == 100)
    {
      double v18 = (void *)MEMORY[0x230FBD990]([(HMDResidentDeviceManagerRoarV3 *)v4 _startRetryTimer]);
      double v19 = v4;
      int v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        __int16 v22 = [(HMDResidentDeviceManagerRoarV3 *)v19 residentLocationRetryTimer];
        uint64_t v23 = [v22 fireDate];
        [v23 timeIntervalSinceNow];
        int v29 = 138543874;
        __int16 v30 = v21;
        __int16 v31 = 2112;
        uint64_t v32 = @"Unknown";
        __int16 v33 = 2048;
        uint64_t v34 = v24;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Resident location is: %@, scheduling retry after %.03f seconds", (uint8_t *)&v29, 0x20u);
      }
    }
    else
    {
      double v18 = (void *)MEMORY[0x230FBD990]();
      double v25 = v4;
      int v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        __int16 v26 = HMFGetLogIdentifier();
        StringFromHMDResidentLocation(v17);
        double v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        int v29 = 138543618;
        __int16 v30 = v26;
        __int16 v31 = 2112;
        uint64_t v32 = v27;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Resident location determined to: %@", (uint8_t *)&v29, 0x16u);
      }
    }
  }
  uint64_t v28 = [(HMDResidentDeviceManagerRoarV3 *)v4 residentSelectionManager];
  [v28 currentDeviceReadyAsAResident];
}

- (void)_handleInitialConnectionToStatusKit
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  [(HMDResidentDeviceManagerRoarV3 *)self setConfiguredStatusKitForResidentSelection:1];
  double v3 = [(HMDResidentDeviceManagerRoarV3 *)self residentStatusChannel];
  char v4 = [v3 isConnected];

  if (v4)
  {
    [(HMDResidentDeviceManagerRoarV3 *)self _refreshAllResidentsReachabilityFromStatusKit];
    double v5 = [HMDResidentSelectionStatusKit alloc];
    id v6 = [(HMDResidentDeviceManagerRoarV3 *)self residentStatusChannel];
    double v7 = [v6 presentResidentStatuses];
    char v8 = [(HMDResidentSelectionStatusKit *)v5 initWithWithContext:self residentStatusList:v7];
    [(HMDResidentDeviceManagerRoarV3 *)self setPresentResidentsStatuses:v8];

    char v9 = [(HMDResidentDeviceManagerRoarV3 *)self residentLocationHandler];
    double v10 = [v9 residentLocationRawValue];
    uint64_t v11 = [v10 unsignedIntegerValue];

    if (v11 == 100)
    {
      double v12 = [(HMDResidentDeviceManagerRoarV3 *)self residentStatusChannel];
      id v13 = [v12 presentResidentStatuses];
      uint64_t v14 = [(HMDResidentDeviceManagerRoarV3 *)self _electorForDeterminingResidentLocationFromPresentResidentStatuses:v13];

      int v15 = [(HMDResidentDeviceManagerRoarV3 *)self residentLocationHandler];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __69__HMDResidentDeviceManagerRoarV3__handleInitialConnectionToStatusKit__block_invoke;
      v20[3] = &unk_264A2F3E8;
      v20[4] = self;
      [v15 determineHomeOrAwayUsingElector:v14 withCompletion:v20];
    }
    else
    {
      [(HMDResidentDeviceManagerRoarV3 *)self _startActingAsResident];
    }
  }
  else
  {
    __int16 v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = self;
    double v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      double v19 = HMFGetLogIdentifier();
      *(_DWORD *)int buf = 138543362;
      __int16 v22 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Not connected to StatusKit, unable to determine resident location", buf, 0xCu);
    }
    [(HMDResidentDeviceManagerRoarV3 *)v17 _startActingAsResident];
  }
}

void __69__HMDResidentDeviceManagerRoarV3__handleInitialConnectionToStatusKit__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    char v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      double v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      char v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Determining resident home/away state encountered error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  [*(id *)(a1 + 32) _startActingAsResident];
}

- (void)_setupAsAResident
{
  v40[3] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = objc_alloc(MEMORY[0x263F42520]);
  char v4 = [(HMDResidentDeviceManagerRoarV3 *)self queue];
  id v5 = (void *)[v3 initWithQueue:v4];

  id v6 = [(HMDResidentDeviceManagerRoarV3 *)self home];
  double v7 = [v6 homeManager];
  int v8 = [v7 currentAccessorySetupMetricDispatcher];

  char v9 = [(HMDResidentDeviceManagerRoarV3 *)self appleAccountManager];
  __int16 v10 = [v9 idsDevicesUpdated];

  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke;
  v38[3] = &unk_264A2C678;
  v38[4] = self;
  id v11 = v8;
  id v39 = v11;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_177;
  v37[3] = &unk_264A2C4C8;
  v37[4] = self;
  id v12 = (id)[v10 inContext:v5 then:v38 orRecover:v37];
  id v13 = [(HMDResidentDeviceManagerRoarV3 *)self dataSource];
  uint64_t v14 = [v13 firstCloudKitImportFuture];

  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_179;
  v35[3] = &unk_264A2C678;
  v35[4] = self;
  id v15 = v11;
  id v36 = v15;
  id v16 = (id)[v14 inContext:v5 then:v35];
  uint64_t v17 = [(HMDResidentDeviceManagerRoarV3 *)self messageDispatcher];
  double v18 = [v17 secureRemoteTransport];
  double v19 = [v18 startFuture];

  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_180;
  v33[3] = &unk_264A2C678;
  v33[4] = self;
  id v20 = v15;
  id v34 = v20;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_181;
  v32[3] = &unk_264A2C4C8;
  v32[4] = self;
  id v21 = (id)[v19 inContext:v5 then:v33 orRecover:v32];
  __int16 v22 = (void *)MEMORY[0x263F42538];
  v40[0] = v19;
  v40[1] = v14;
  v40[2] = v10;
  uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:3];
  uint64_t v24 = [v22 allSettled:v23];

  v28[4] = self;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_182;
  v29[3] = &unk_264A2A738;
  v29[4] = self;
  id v30 = v5;
  id v31 = v20;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_190;
  v28[3] = &unk_264A2C4C8;
  id v25 = v20;
  id v26 = v5;
  id v27 = (id)[v24 inContext:v26 then:v29 orRecover:v28];
}

uint64_t __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    double v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    __int16 v10 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Peer devices settled.", (uint8_t *)&v9, 0xCu);
  }
  [*(id *)(a1 + 40) markPrimaryResidentElectionPeerDeviceFutureResolved];

  return 1;
}

uint64_t __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_177(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    double v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    __int16 v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Peer devices settled with error: %@.", (uint8_t *)&v9, 0x16u);
  }

  return 1;
}

uint64_t __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_179(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    double v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    __int16 v10 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@First CloudKit import promise resolved.", (uint8_t *)&v9, 0xCu);
  }
  [*(id *)(a1 + 40) markPrimaryResidentElectionFirstCloudKitImportFutureResolved];

  return 1;
}

uint64_t __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_180(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    double v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    __int16 v10 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Modern Transport Started.", (uint8_t *)&v9, 0xCu);
  }
  [*(id *)(a1 + 40) markPrimaryResidentElectionModernTransportStartedFutureResolved];

  return 1;
}

uint64_t __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_181(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    double v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    __int16 v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Modern Transport start returned error: %@.", (uint8_t *)&v9, 0x16u);
  }

  return 1;
}

uint64_t __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_182(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) home];
  id v5 = [v4 homeManager];
  int v6 = [v5 badCDPState];

  if (v6)
  {
    double v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = HMFGetLogIdentifier();
      *(_DWORD *)int buf = 138543362;
      id v34 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Operating in bad CDP state. Not joining the mesh", buf, 0xCu);
    }
  }
  else if (([*(id *)(a1 + 32) isActingAsResident] & 1) == 0)
  {
    __int16 v11 = [*(id *)(a1 + 32) appleAccountManager];
    id v12 = [v11 device];

    if (v12)
    {
      [*(id *)(a1 + 32) _createAllKnownResidentsInHome:0];
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = *(id *)(a1 + 32);
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        id v16 = HMFGetLogIdentifier();
        *(_DWORD *)int buf = 138543362;
        id v34 = v16;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: No current device to add resident devices", buf, 0xCu);
      }
      uint64_t v17 = [[HMDAssertionLogEvent alloc] initWithReason:@"No current device to add resident devices"];
      double v18 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v18 submitLogEvent:v17];
    }
    double v19 = [*(id *)(a1 + 32) residentSelectionManager];
    uint64_t v20 = [v19 currentModeType];

    id v21 = *(void **)(a1 + 32);
    if (v20 == 1)
    {
      [v21 _startActingAsResident];
    }
    else if ([v21 homeSupportsResidentSelection])
    {
      [*(id *)(a1 + 32) _initialConnectionToStatusKitOnResidentTimeout];
      double v23 = v22;
      uint64_t v24 = [*(id *)(a1 + 32) residentStatusChannel];
      id v25 = [v24 initialConnectedToStatusKitFuture];
      id v26 = [v25 timeout:v23];

      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_188;
      v31[3] = &unk_264A2C678;
      uint64_t v27 = *(void *)(a1 + 40);
      v31[4] = *(void *)(a1 + 32);
      id v32 = *(id *)(a1 + 48);
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_189;
      v30[3] = &unk_264A2C4C8;
      v30[4] = *(void *)(a1 + 32);
      id v28 = (id)[v26 inContext:v27 then:v31 orRecover:v30];
    }
  }

  return 1;
}

uint64_t __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_190(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  int v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    double v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    __int16 v10 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Could not join the mesh. One of the conditions to join was not met", (uint8_t *)&v9, 0xCu);
  }

  return 1;
}

uint64_t __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_188(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  int v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    double v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    __int16 v10 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Received initial Resident Status Channel state.", (uint8_t *)&v9, 0xCu);
  }
  [*(id *)(a1 + 40) markPrimaryResidentSelectionConnectedToStatusKitFutureResolved];
  [*(id *)(a1 + 32) _handleInitialConnectionToStatusKit];

  return 1;
}

uint64_t __51__HMDResidentDeviceManagerRoarV3__setupAsAResident__block_invoke_189(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  int v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    double v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    __int16 v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Initial Resident Status Channel state returned error: %@.", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) _handleInitialConnectionToStatusKit];

  return 1;
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__HMDResidentDeviceManagerRoarV3_invalidate__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __44__HMDResidentDeviceManagerRoarV3_invalidate__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) notificationCenter];
  [v2 removeObserver:*(void *)(a1 + 32)];

  id v3 = [*(id *)(a1 + 32) residentSelectionManager];
  [v3 stop];
}

- (void)_configureResidentSupported
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(HMDResidentDeviceManagerRoarV3 *)self appleAccountManager];
  char v4 = [v3 device];

  if (v4)
  {
    if (![(HMDResidentDeviceManagerRoarV3 *)self isResidentSupported])
    {
      char v17 = 0;
      id v5 = (void *)MEMORY[0x230FBD990]([(HMDResidentDeviceManagerRoarV3 *)self _createAllKnownResidentsInHome:&v17]);
      int v6 = self;
      double v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = HMFGetLogIdentifier();
        int v9 = [(HMDResidentDeviceManagerRoarV3 *)v6 residentDevices];
        *(_DWORD *)int buf = 138543618;
        double v19 = v8;
        __int16 v20 = 2114;
        id v21 = v9;
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Initial resident devices: %{public}@", buf, 0x16u);
      }
      __int16 v10 = [(HMDResidentDeviceManagerRoarV3 *)v6 residentDevices];
      if ([v10 count]) {
        BOOL v11 = 1;
      }
      else {
        BOOL v11 = v17 == 0;
      }
      uint64_t v12 = !v11;

      if (v12 == 1)
      {
        uint64_t v13 = (void *)MEMORY[0x230FBD990]();
        id v14 = v6;
        id v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          id v16 = HMFGetLogIdentifier();
          *(_DWORD *)int buf = 138543362;
          double v19 = v16;
          _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@No HMDResidentDevice but has MKFResident models, force update", buf, 0xCu);
        }
      }
      [(HMDResidentDeviceManagerRoarV3 *)v6 setResidentSupported:1];
      [(HMDResidentDeviceManagerRoarV3 *)v6 _updateResidentAvailability:v12];
    }
  }
  else
  {
    [(HMDResidentDeviceManagerRoarV3 *)self setResidentSupported:0];
  }
}

- (void)_createAllKnownResidentsInHome:(BOOL *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = [(HMDResidentDeviceManagerRoarV3 *)self appleAccountManager];
  int v6 = [v5 device];

  double v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  int v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    __int16 v10 = HMFGetLogIdentifier();
    *(_DWORD *)int buf = 138543362;
    id v15 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Constructing all known resident devices in the home", buf, 0xCu);
  }
  BOOL v11 = [(HMDResidentDeviceManagerRoarV3 *)v8 backingStore];
  uint64_t v12 = [v11 findResidents:v6 outHasResidents:a3];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __65__HMDResidentDeviceManagerRoarV3__createAllKnownResidentsInHome___block_invoke;
  v13[3] = &unk_264A2A710;
  v13[4] = v8;
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);
}

void __65__HMDResidentDeviceManagerRoarV3__createAllKnownResidentsInHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(*(void *)(a1 + 32) + 288);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [v5 configureWithHome:WeakRetained];

  [*(id *)(a1 + 32) _addResidentDevice:v5];
}

- (void)_registerForNotifications
{
  id v3 = [(HMDResidentDeviceManagerRoarV3 *)self notificationCenter];
  char v4 = [(HMDResidentDeviceManagerRoarV3 *)self backingStore];
  id v5 = [v4 cloudChangeUpdateNotificationName];
  [v3 addObserver:self selector:sel__handleCloudResidentChange_ name:v5 object:0];

  int v6 = [(HMDResidentDeviceManagerRoarV3 *)self notificationCenter];
  [v6 addObserver:self selector:sel__handleRemoteDeviceIsReachable_ name:@"HMDRemoteDeviceIsReachableNotification" object:0];

  double v7 = [(HMDResidentDeviceManagerRoarV3 *)self notificationCenter];
  [v7 addObserver:self selector:sel__handleRemoteDeviceIsNotReachable_ name:@"HMDRemoteDeviceIsNotReachableNotification" object:0];

  id v8 = [(HMDResidentDeviceManagerRoarV3 *)self notificationCenter];
  int v9 = [(HMDResidentDeviceManagerRoarV3 *)self home];
  [v8 addObserver:self selector:sel__handleResidentSelectionVersionDidChange_ name:@"HMDHomeResidentSelectionVersionDidChangeNotification" object:v9];

  __int16 v10 = [(HMDResidentDeviceManagerRoarV3 *)self notificationCenter];
  [v10 addObserver:self selector:sel__handleDataReadyAfterBecomingPrimaryNotification_ name:@"HMDHomeDataReadyAfterBecomingPrimaryNotification" object:0];

  id v11 = [(HMDResidentDeviceManagerRoarV3 *)self notificationCenter];
  [v11 addObserver:self selector:sel__handleHomeLocationChangedNotification_ name:@"HMDLocationForHomeChanged" object:0];
}

- (void)_registerForMessages
{
  v24[3] = *MEMORY[0x263EF8340];
  id v3 = [(HMDResidentDeviceManagerRoarV3 *)self home];
  char v4 = [(HMDResidentDeviceManagerRoarV3 *)self messageDispatcher];
  id v5 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v3 userPrivilege:3 remoteAccessRequired:0];
  int v6 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v3 userPrivilege:4 remoteAccessRequired:0];
  double v7 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v24[0] = v7;
  v24[1] = v5;
  id v8 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  id v24[2] = v8;
  int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:3];
  [v4 registerForMessage:@"kResidentDeviceUpdateEnabledRequestKey" receiver:self policies:v9 selector:sel__handleResidentDeviceUpdateEnabled_];

  __int16 v10 = +[HMDRemoteMessagePolicy defaultPolicy];
  id v11 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v3 userPrivilege:5 remoteAccessRequired:0];
  if (isInternalBuild())
  {
    uint64_t v12 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    v23[0] = v12;
    v23[1] = v11;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
    [v4 registerForMessage:@"hm.prdisco" receiver:self policies:v13 selector:sel__handlePrimaryResidentDiscoveryXPCRequest_];
  }
  id v14 = [(HMDResidentDeviceManagerRoarV3 *)self dataSource];
  int v15 = [v14 isResidentCapable];

  if (v15)
  {
    v22[0] = v10;
    v22[1] = v11;
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    [v4 registerForMessage:@"primaryResidentDiscovery" receiver:self policies:v16 selector:sel__handlePrimaryResidentDiscoveryRequest_];
  }
  uint64_t v17 = *MEMORY[0x263F0CE40];
  double v18 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v21[0] = v18;
  v21[1] = v6;
  double v19 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  v21[2] = v19;
  __int16 v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
  [v4 registerForMessage:v17 receiver:self policies:v20 selector:sel_handleSetPreferredResidentSelectionMessage_];
}

- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__HMDResidentDeviceManagerRoarV3_configureWithHome_messageDispatcher___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __70__HMDResidentDeviceManagerRoarV3_configureWithHome_messageDispatcher___block_invoke(id *a1)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  [a1[4] setHome:a1[5]];
  id v2 = [a1[4] dataSource];
  uint64_t v3 = [v2 logIdentifierForHome:a1[5]];
  char v4 = a1[4];
  id v5 = (void *)v4[11];
  v4[11] = v3;

  uint64_t v6 = [a1[5] uuid];
  id v7 = a1[4];
  id v8 = (void *)v7[10];
  v7[10] = v6;

  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = a1[4];
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    isInternalBuild();
    id v13 = HMFBooleanToString();
    id v14 = [a1[4] dataSource];
    [v14 isResidentCapable];
    int v15 = HMFBooleanToString();
    int v45 = 138543874;
    uint64_t v46 = v12;
    __int16 v47 = 2112;
    uint64_t v48 = v13;
    __int16 v49 = 2112;
    id v50 = v15;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Configuring and registering for messages, isInternal: %@, isResidentEnabled: %@", (uint8_t *)&v45, 0x20u);
  }
  uint64_t v16 = [a1[4] dataSource];
  uint64_t v17 = [v16 createBackingStoreForHome:a1[5]];
  double v18 = a1[4];
  double v19 = (void *)v18[20];
  v18[20] = v17;

  objc_storeStrong((id *)a1[4] + 8, a1[6]);
  __int16 v20 = [a1[6] secureRemoteTransport];
  id v21 = [v20 modernReachabilityObserver];
  [a1[4] setReachabilityObserver:v21];

  uint64_t v22 = [a1[6] secureRemoteTransport];
  double v23 = [v22 deviceMonitor];
  [a1[4] setDeviceMonitor:v23];

  [a1[4] _registerForMessages];
  [a1[4] _registerForNotifications];
  [a1[4] _startResidentSelectionManager];
  uint64_t v24 = [a1[4] primaryDiscoveryManager];
  [v24 configureWithContext:a1[4]];

  if ([a1[4] homeSupportsResidentSelection])
  {
    id v25 = [a1[4] dataSource];
    uint64_t v26 = [v25 createResidentStatusChannelForHome:a1[5] queue:*((void *)a1[4] + 2)];
    uint64_t v27 = a1[4];
    id v28 = (void *)v27[26];
    v27[26] = v26;

    int v29 = [a1[4] statusChannel];
    [v29 addObserver:a1[4]];

    id v30 = [HMDResidentStatusChannelManager alloc];
    id v31 = [a1[4] statusChannel];
    id v32 = [a1[4] queue];
    __int16 v33 = [a1[4] idsServerBag];
    uint64_t v34 = [(HMDResidentStatusChannelManager *)v30 initWithResidentStatusChannel:v31 queue:v32 idsServerBag:v33];
    uint64_t v35 = a1[4];
    id v36 = (void *)v35[27];
    v35[27] = v34;

    __int16 v37 = [a1[4] residentStatusChannelManager];
    uint64_t v38 = [a1[4] statusChannel];
    [v38 setManager:v37];

    id v39 = [a1[4] residentStatusChannelManager];
    [v39 configure];
  }
  [a1[4] setPendingNotifyPrimaryChanged:0];
  long long v40 = [a1[4] dataSource];
  uint64_t v41 = [v40 createResidentLocationHandlerForHome:a1[5] queue:*((void *)a1[4] + 2) messageDispatcher:a1[6]];
  id v42 = a1[4];
  __int16 v43 = (void *)v42[33];
  v42[33] = v41;

  return [a1[4] _configureResidentSupported];
}

- (HMDResidentDeviceManagerRoarV3)initWithDataSource:(id)a3 featuresDataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)HMDResidentDeviceManagerRoarV3;
  id v9 = [(HMDResidentDeviceManagerRoarV3 *)&v31 init];
  if (v9)
  {
    uint64_t v10 = HMFGetOSLogHandle();
    logger = v9->_logger;
    v9->_logger = (OS_os_log *)v10;

    uint64_t v12 = [v7 queue];
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v9->_dataSource, a3);
    objc_storeStrong((id *)&v9->_featuresDataSource, a4);
    logIdentifier = v9->_logIdentifier;
    v9->_logIdentifier = (NSString *)@"<unconfigured>";

    messageTargetUUID = v9->_messageTargetUUID;
    v9->_messageTargetUUID = 0;

    uint64_t v16 = [MEMORY[0x263EFF9C0] set];
    residentDevices = v9->_residentDevices;
    v9->_residentDevices = (NSMutableSet *)v16;

    uint64_t v18 = [v7 notificationCenter];
    notificationCenter = v9->_notificationCenter;
    v9->_notificationCenter = (NSNotificationCenter *)v18;

    uint64_t v20 = [v7 appleAccountManager];
    appleAccountManager = v9->_appleAccountManager;
    v9->_appleAccountManager = (HMDAppleAccountManager *)v20;

    v9->_residentCapable = [v7 isResidentCapable];
    uint64_t v22 = [v7 createPrimaryResidentDiscoveryManagerWithQueue:v9->_queue];
    primaryDiscoveryManager = v9->_primaryDiscoveryManager;
    v9->_primaryDiscoveryManager = (HMDPrimaryResidentDiscoveryManager *)v22;

    [(HMDPrimaryResidentDiscoveryManager *)v9->_primaryDiscoveryManager setDelegate:v9];
    uint64_t v24 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    primaryDiscoveryRequesters = v9->_primaryDiscoveryRequesters;
    v9->_primaryDiscoveryRequesters = (NSHashTable *)v24;

    uint64_t v26 = [MEMORY[0x263F42538] futureWithPromise:&v9->_firstPrimaryResidentDiscoveryAttemptCompletionPromise];
    firstPrimaryResidentDiscoveryAttemptCompletionFuture = v9->_firstPrimaryResidentDiscoveryAttemptCompletionFuture;
    v9->_firstPrimaryResidentDiscoveryAttemptCompletionFuture = (HMFFuture *)v26;

    v9->_configuredStatusKitForResidentSelection = 0;
    uint64_t v28 = [v7 userDefaults];
    userDefaults = v9->_userDefaults;
    v9->_userDefaults = (NSUserDefaults *)v28;

    v9->_blockPrimaryTakeoverStartTime = -1.0;
  }

  return v9;
}

- (HMDResidentDeviceManagerRoarV3)init
{
  uint64_t v3 = objc_alloc_init(HMDDefaultResidentDeviceManagerRoarV3DataSource);
  char v4 = +[HMDFeaturesDataSource defaultDataSource];
  id v5 = [(HMDResidentDeviceManagerRoarV3 *)self initWithDataSource:v3 featuresDataSource:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t119 != -1) {
    dispatch_once(&logCategory__hmf_once_t119, &__block_literal_global_272_239174);
  }
  id v2 = (void *)logCategory__hmf_once_v120;
  return v2;
}

void __45__HMDResidentDeviceManagerRoarV3_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  id v1 = (void *)logCategory__hmf_once_v120;
  logCategory__hmf_once_v120 = v0;
}

+ (id)shortDescription
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end