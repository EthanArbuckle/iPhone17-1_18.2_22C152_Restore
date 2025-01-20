@interface HMDCHIPDataSource
+ (id)logCategory;
- (BOOL)_getLocationAuthorized;
- (BOOL)hasMatterThreadAccessoryInHomeWithFabricID:(id)a3;
- (BOOL)isCurrentDevicePrimaryResident;
- (BOOL)pendingRadioStateChangeNotification;
- (BOOL)pnExistsOnCurrentNetwork;
- (BOOL)startThreadOnWakeEnabled;
- (BOOL)threadNetworkShouldRestartOnNetworkChange;
- (BOOL)threadPairingOverride;
- (HMDCHIPDataSource)initWithHomeManager:(id)a3;
- (HMDCHIPDataSource)initWithHomeManager:(id)a3 notificationCenter:(id)a4 vendorMetadataRefreshTimer:(id)a5 attestationDataRefreshTimer:(id)a6 dialogPresenter:(id)a7;
- (HMDCHIPThreadNetworkEventListener)userPreferredThreadNetworkEventListener;
- (HMDFileManager)fileManager;
- (HMDHome)activeThreadHome;
- (HMDHome)pendingThreadHome;
- (HMDHomeManager)homeManager;
- (HMDUIDialogPresenter)dialogPresenter;
- (HMFTimer)attestationDataRefreshTimer;
- (HMFTimer)vendorMetadataRefreshTimer;
- (HMMTRAccessoryServerBrowser)matterAccessoryServerBrowser;
- (HMMTRAttestationDataStore)attestationDataStore;
- (HMMTRResidentStateManager)chipResidentStateManager;
- (HMMTRStorage)chipStorage;
- (HMMTRThreadRadioManager)matterThreadRadioManager;
- (HMMTRUIDialogPresenter)uiDialogPresenter;
- (HMMTRVendorMetadataStore)vendorMetadataStore;
- (NSNotificationCenter)notificationCenter;
- (NSNumber)currentFabricID;
- (NSNumber)threadPairingFabricID;
- (NSSet)allFabricIDs;
- (NSSet)allPairedHAPServerIdentifiers;
- (NSSet)allTargetFabricUUIDs;
- (id)appleHomeFabricWithID:(id)a3;
- (id)appleHomeFabricWithUUID:(id)a3;
- (id)appleHomeTargetFabricUUIDWithID:(id)a3;
- (id)getDefaultThreadNetworkMetadataStore;
- (id)getSharedThreadResidentCommissioner;
- (id)home;
- (id)homeWithCHIPFabric:(id)a3;
- (id)storageDataSourceForFabricWithID:(id)a3;
- (int64_t)checkPresenceForHome:(id)a3;
- (int64_t)getThreadNetworkConnectionStateWithFabricID:(id)a3;
- (int64_t)getThreadNetworkNodeTypeWithFabricID:(id)a3;
- (int64_t)getUserPreferredThreadNetworkConnectionStateWithError:(id *)a3;
- (int64_t)getUserPreferredThreadNetworkNodeTypeWithError:(id *)a3;
- (int64_t)locationAuthorization;
- (unint64_t)networkChangedLastUpdatedTime;
- (void)_getPreferredNetworkExistsWithCompletion:(id)a3;
- (void)_scheduleThreadNetworkRestart;
- (void)_startNetworkListenerForUserPreferredNetwork:(BOOL)a3;
- (void)_stopNetworkListenerForUserPreferredNetwork;
- (void)browser:(id)a3 didRemoveAccessoryPairingWithNodeID:(id)a4;
- (void)configureWithAccessoryServerBrowser:(id)a3;
- (void)configureWithAttestationDataStore:(id)a3;
- (void)configureWithResidentStateManager:(id)a3;
- (void)configureWithStorage:(id)a3;
- (void)configureWithThreadRadioManager:(id)a3;
- (void)configureWithUIDialogPresenter:(id)a3;
- (void)configureWithVendorMetadataStore:(id)a3;
- (void)connectToAccessoryForUserPreferredNetworkWithExtendedMACAddress:(id)a3 completion:(id)a4;
- (void)connectToAccessoryWithExtendedMACAddress:(id)a3 withFabricID:(id)a4 completion:(id)a5;
- (void)forAllPairedMatterServersFetchVidPid:(id)a3;
- (void)forAllStorageDataSourcesDo:(id)a3;
- (void)handleAccessoryCHIPStorageChangedNotification:(id)a3;
- (void)handleDataReadyAfterBecomingPrimaryNotification:(id)a3;
- (void)handleHomeCHIPStorageChangedNotification:(id)a3;
- (void)handleHomeDidArriveHomeNotification:(id)a3;
- (void)handleHomeDidLeaveHomeNotification:(id)a3;
- (void)handleHomeRemovedNotification:(id)a3;
- (void)handleLocationAuthorizationChangedNotification:(id)a3;
- (void)handleNetworkStateChange;
- (void)handlePrimaryResidentUpdatedNotification:(id)a3;
- (void)handleResidentReachabilityNotification:(id)a3;
- (void)handleThreadBTCallStateChange:(BOOL)a3;
- (void)handleThreadNetworkPeripheralDeviceNodeTypeChangedNotification:(id)a3;
- (void)handleThreadNetworkStateChangedNotification:(id)a3;
- (void)handleThreadNetworkWakeOnConnectionStateChangedNotification:(id)a3;
- (void)handleUpdatedDataWithIsLocalChange:(BOOL)a3;
- (void)hasValidGeoOrPreferredNetworkForHome:(id)a3 completion:(id)a4;
- (void)overrideLocationCheckForPairingForFabricID:(id)a3;
- (void)registerForArrivalNotifications:(id)a3;
- (void)registerForLeaveNotifications:(id)a3;
- (void)requestUserPermissionForBridgeAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)requestUserPermissionForUnauthenticatedAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)setActiveThreadHome:(id)a3;
- (void)setAttestationDataStore:(id)a3;
- (void)setChipResidentStateManager:(id)a3;
- (void)setChipStorage:(id)a3;
- (void)setFileManager:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setLocationAuthorization:(int64_t)a3;
- (void)setMatterAccessoryServerBrowser:(id)a3;
- (void)setMatterThreadRadioManager:(id)a3;
- (void)setNetworkChangedLastUpdatedTime:(unint64_t)a3;
- (void)setPendingRadioStateChangeNotification:(BOOL)a3;
- (void)setPendingThreadHome:(id)a3;
- (void)setPnExistsOnCurrentNetwork:(BOOL)a3;
- (void)setStartThreadOnWakeEnabled:(BOOL)a3;
- (void)setThreadNetworkShouldRestartOnNetworkChange:(BOOL)a3;
- (void)setThreadPairingFabricID:(id)a3;
- (void)setThreadPairingOverride:(BOOL)a3;
- (void)setUiDialogPresenter:(id)a3;
- (void)setUserPreferredThreadNetworkEventListener:(id)a3;
- (void)setVendorMetadataStore:(id)a3;
- (void)startAccessoryFirmwareUpdateWithExtendedMACAddress:(id)a3 fabricID:(id)a4 isWedDevice:(BOOL)a5 completion:(id)a6;
- (void)startAccessoryPairingWithExtendedMACAddress:(id)a3 fabricID:(id)a4 isWedDevice:(BOOL)a5 completion:(id)a6;
- (void)startThreadRadioForHomeWithFabricID:(id)a3;
- (void)startThreadRadioForUserPreferredNetwork;
- (void)startThreadRadioForUserPreferredNetworkWithGeoAndBorderRouterCheck;
- (void)stopAccessoryFirmwareUpdateWithFabricID:(id)a3 completion:(id)a4;
- (void)stopAccessoryPairingWithFabricID:(id)a3 completion:(id)a4;
- (void)stopThreadRadioForHomeWithFabricID:(id)a3;
- (void)stopThreadRadioForUserPreferredNetwork;
- (void)stopThreadRadioOnDeviceLock;
- (void)timerDidFire:(id)a3;
- (void)unprotectedRegisterForArrivalNotifications:(id)a3;
- (void)unprotectedRegisterForLeaveNotifications:(id)a3;
- (void)unregisterForArrivalNotifications:(id)a3;
- (void)unregisterForLeaveNotifications:(id)a3;
- (void)unregisterPresenceNotificationsForHome:(id)a3;
- (void)updateNotificationsEnabled:(BOOL)a3 forHome:(id)a4 keepAliveOnly:(BOOL)a5;
@end

@implementation HMDCHIPDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPreferredThreadNetworkEventListener, 0);
  objc_storeStrong((id *)&self->_threadPairingFabricID, 0);
  objc_storeStrong((id *)&self->_pendingThreadHome, 0);
  objc_storeStrong((id *)&self->_activeThreadHome, 0);
  objc_destroyWeak((id *)&self->_matterThreadRadioManager);
  objc_destroyWeak((id *)&self->_matterAccessoryServerBrowser);
  objc_storeStrong((id *)&self->_chipStorage, 0);
  objc_storeStrong((id *)&self->_chipResidentStateManager, 0);
  objc_storeStrong((id *)&self->_dialogPresenter, 0);
  objc_storeStrong((id *)&self->_attestationDataRefreshTimer, 0);
  objc_storeStrong((id *)&self->_vendorMetadataRefreshTimer, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_uiDialogPresenter, 0);
  objc_storeStrong((id *)&self->_attestationDataStore, 0);
  objc_storeStrong((id *)&self->_vendorMetadataStore, 0);
  objc_destroyWeak((id *)&self->_homeManager);
}

- (void)setStartThreadOnWakeEnabled:(BOOL)a3
{
  self->_startThreadOnWakeEnabled = a3;
}

- (BOOL)startThreadOnWakeEnabled
{
  return self->_startThreadOnWakeEnabled;
}

- (void)setThreadNetworkShouldRestartOnNetworkChange:(BOOL)a3
{
  self->_threadNetworkShouldRestartOnNetworkChange = a3;
}

- (BOOL)threadNetworkShouldRestartOnNetworkChange
{
  return self->_threadNetworkShouldRestartOnNetworkChange;
}

- (void)setNetworkChangedLastUpdatedTime:(unint64_t)a3
{
  self->_networkChangedLastUpdatedTime = a3;
}

- (unint64_t)networkChangedLastUpdatedTime
{
  return self->_networkChangedLastUpdatedTime;
}

- (void)setPnExistsOnCurrentNetwork:(BOOL)a3
{
  self->_pnExistsOnCurrentNetwork = a3;
}

- (BOOL)pnExistsOnCurrentNetwork
{
  return self->_pnExistsOnCurrentNetwork;
}

- (void)setUserPreferredThreadNetworkEventListener:(id)a3
{
}

- (HMDCHIPThreadNetworkEventListener)userPreferredThreadNetworkEventListener
{
  return (HMDCHIPThreadNetworkEventListener *)objc_getProperty(self, a2, 160, 1);
}

- (void)setThreadPairingFabricID:(id)a3
{
}

- (NSNumber)threadPairingFabricID
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setThreadPairingOverride:(BOOL)a3
{
  self->_threadPairingOverride = a3;
}

- (BOOL)threadPairingOverride
{
  return self->_threadPairingOverride;
}

- (void)setPendingRadioStateChangeNotification:(BOOL)a3
{
  self->_pendingRadioStateChangeNotification = a3;
}

- (BOOL)pendingRadioStateChangeNotification
{
  return self->_pendingRadioStateChangeNotification;
}

- (void)setLocationAuthorization:(int64_t)a3
{
  self->_locationAuthorization = a3;
}

- (int64_t)locationAuthorization
{
  return self->_locationAuthorization;
}

- (void)setPendingThreadHome:(id)a3
{
}

- (HMDHome)pendingThreadHome
{
  return (HMDHome *)objc_getProperty(self, a2, 136, 1);
}

- (void)setActiveThreadHome:(id)a3
{
}

- (HMDHome)activeThreadHome
{
  return (HMDHome *)objc_getProperty(self, a2, 128, 1);
}

- (void)setMatterThreadRadioManager:(id)a3
{
}

- (HMMTRThreadRadioManager)matterThreadRadioManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_matterThreadRadioManager);
  return (HMMTRThreadRadioManager *)WeakRetained;
}

- (void)setMatterAccessoryServerBrowser:(id)a3
{
}

- (HMMTRAccessoryServerBrowser)matterAccessoryServerBrowser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_matterAccessoryServerBrowser);
  return (HMMTRAccessoryServerBrowser *)WeakRetained;
}

- (void)setChipStorage:(id)a3
{
}

- (HMMTRStorage)chipStorage
{
  return (HMMTRStorage *)objc_getProperty(self, a2, 104, 1);
}

- (void)setChipResidentStateManager:(id)a3
{
}

- (HMMTRResidentStateManager)chipResidentStateManager
{
  return (HMMTRResidentStateManager *)objc_getProperty(self, a2, 96, 1);
}

- (HMDUIDialogPresenter)dialogPresenter
{
  return (HMDUIDialogPresenter *)objc_getProperty(self, a2, 88, 1);
}

- (HMFTimer)attestationDataRefreshTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 80, 1);
}

- (HMFTimer)vendorMetadataRefreshTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 72, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFileManager:(id)a3
{
}

- (HMDFileManager)fileManager
{
  return (HMDFileManager *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUiDialogPresenter:(id)a3
{
}

- (HMMTRUIDialogPresenter)uiDialogPresenter
{
  return (HMMTRUIDialogPresenter *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAttestationDataStore:(id)a3
{
}

- (HMMTRAttestationDataStore)attestationDataStore
{
  return (HMMTRAttestationDataStore *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVendorMetadataStore:(id)a3
{
}

- (HMMTRVendorMetadataStore)vendorMetadataStore
{
  return (HMMTRVendorMetadataStore *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (BOOL)hasMatterThreadAccessoryInHomeWithFabricID:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCHIPDataSource *)self homeManager];
  v6 = v5;
  if (!v5)
  {
    v27 = (void *)MEMORY[0x230FBD990]();
    v28 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v48 = v30;
      v31 = "%{public}@Home manager reference is nil";
LABEL_29:
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, v31, buf, 0xCu);
    }
LABEL_30:

    goto LABEL_31;
  }
  if (!v4)
  {
    v27 = (void *)MEMORY[0x230FBD990]();
    v28 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v48 = v30;
      v31 = "%{public}@Fabric ID is nil";
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v7 = [v5 homes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v42;
    v36 = v7;
    uint64_t v34 = *(void *)v42;
    do
    {
      uint64_t v11 = 0;
      uint64_t v35 = v9;
      do
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v41 + 1) + 8 * v11);
        v13 = [v12 fabric];
        v14 = [v13 fabricID];
        int v15 = [v14 isEqualToNumber:v4];

        if (v15)
        {
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          v16 = [v12 hapAccessories];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v38;
            while (2)
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v38 != v19) {
                  objc_enumerationMutation(v16);
                }
                v21 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                if ([v21 supportsCHIP])
                {
                  v22 = [v21 supportedLinkLayerTypes];

                  if (!v22) {
                    goto LABEL_26;
                  }
                  v23 = [v21 supportedLinkLayerTypes];
                  char v24 = [v23 unsignedIntValue];

                  v25 = [v21 supportedLinkLayerTypes];
                  int v26 = [v25 unsignedIntValue];

                  if ((v24 & 0x10) != 0 || !v26)
                  {
LABEL_26:

                    BOOL v32 = 1;
                    goto LABEL_32;
                  }
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v45 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }

          uint64_t v9 = v35;
          v7 = v36;
          uint64_t v10 = v34;
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v9);
  }

LABEL_31:
  BOOL v32 = 0;
LABEL_32:

  return v32;
}

- (void)stopAccessoryFirmwareUpdateWithFabricID:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(HMDCHIPDataSource *)self homeManager];
  uint64_t v9 = v8;
  if (!v8)
  {
    v23 = (void *)MEMORY[0x230FBD990]();
    char v24 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v37 = v26;
      v27 = "%{public}@Home manager reference is nil";
LABEL_20:
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, v27, buf, 0xCu);
    }
LABEL_21:

    uint64_t v10 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
    v7[2](v7, v10);
    goto LABEL_22;
  }
  if (!v6)
  {
    v23 = (void *)MEMORY[0x230FBD990]();
    char v24 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v37 = v26;
      v27 = "%{public}@Fabric ID is nil";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  v28 = v8;
  v29 = v7;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v10 = [v8 homes];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v16 = [v15 fabric];
        uint64_t v17 = [v16 fabricID];
        int v18 = [v17 isEqualToNumber:v6];

        if (v18)
        {
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          v30[2] = __72__HMDCHIPDataSource_stopAccessoryFirmwareUpdateWithFabricID_completion___block_invoke;
          v30[3] = &unk_264A2EDE0;
          v30[4] = self;
          v7 = v29;
          v31 = v29;
          [v15 stopThreadAccessoryFirmwareUpdateWithCompletion:v30];

          goto LABEL_17;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  uint64_t v19 = (void *)MEMORY[0x230FBD990]();
  v20 = self;
  v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v37 = v22;
    __int16 v38 = 2112;
    id v39 = v6;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find home with CHIP fabric ID: %@", buf, 0x16u);
  }
  uint64_t v10 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  v7 = v29;
  v29[2](v29, v10);
LABEL_17:
  uint64_t v9 = v28;
LABEL_22:
}

void __72__HMDCHIPDataSource_stopAccessoryFirmwareUpdateWithFabricID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to stop thread accessory firmware update, error %@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)startAccessoryFirmwareUpdateWithExtendedMACAddress:(id)a3 fabricID:(id)a4 isWedDevice:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void *))a6;
  uint64_t v13 = [(HMDCHIPDataSource *)self homeManager];
  v14 = v13;
  if (!v13)
  {
    v28 = (void *)MEMORY[0x230FBD990]();
    v29 = self;
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v45 = v31;
      long long v32 = "%{public}@Home manager reference is nil";
LABEL_20:
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, v32, buf, 0xCu);
    }
LABEL_21:

    int v15 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
    v12[2](v12, v15);
    goto LABEL_22;
  }
  if (!v11)
  {
    v28 = (void *)MEMORY[0x230FBD990]();
    v29 = self;
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v45 = v31;
      long long v32 = "%{public}@Fabric ID is nil";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  BOOL v33 = v7;
  long long v35 = v12;
  v36 = v10;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v34 = v13;
  int v15 = [v13 homes];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v41 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v21 = [v20 fabric];
        v22 = [v21 fabricID];
        int v23 = [v22 isEqualToNumber:v11];

        if (v23)
        {
          v37[0] = MEMORY[0x263EF8330];
          v37[1] = 3221225472;
          v37[2] = __104__HMDCHIPDataSource_startAccessoryFirmwareUpdateWithExtendedMACAddress_fabricID_isWedDevice_completion___block_invoke;
          v37[3] = &unk_264A2E788;
          v37[4] = self;
          id v10 = v36;
          id v38 = v36;
          uint64_t v12 = v35;
          id v39 = v35;
          [v20 startThreadAccessoryFirmwareUpdateWithExtendedMACAddress:v38 isWedDevice:v33 completion:v37];

          goto LABEL_17;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  char v24 = (void *)MEMORY[0x230FBD990]();
  v25 = self;
  int v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v45 = v27;
    __int16 v46 = 2112;
    id v47 = v11;
    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find home with CHIP fabric ID: %@", buf, 0x16u);
  }
  int v15 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  uint64_t v12 = v35;
  v35[2](v35, v15);
  id v10 = v36;
LABEL_17:
  v14 = v34;
LABEL_22:
}

void __104__HMDCHIPDataSource_startAccessoryFirmwareUpdateWithExtendedMACAddress_fabricID_isWedDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543874;
      id v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to start thread accessory firmware update with emac %@, error %@", (uint8_t *)&v9, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)stopAccessoryPairingWithFabricID:(id)a3 completion:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(HMDCHIPDataSource *)self homeManager];
  int v9 = v8;
  if (!v8)
  {
    int v23 = (void *)MEMORY[0x230FBD990]();
    char v24 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v41 = v26;
      v27 = "%{public}@Home manager reference is nil";
LABEL_22:
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, v27, buf, 0xCu);
    }
LABEL_23:

    id v10 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
    v7[2](v7, v10);
    goto LABEL_24;
  }
  if (!v6)
  {
    int v23 = (void *)MEMORY[0x230FBD990]();
    char v24 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v41 = v26;
      v27 = "%{public}@Fabric ID is nil";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  long long v32 = v8;
  BOOL v33 = v7;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v10 = [v8 homes];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v16 = [v15 fabric];
        uint64_t v17 = [v16 fabricID];
        int v18 = [v17 isEqualToNumber:v6];

        if (v18)
        {
          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __65__HMDCHIPDataSource_stopAccessoryPairingWithFabricID_completion___block_invoke;
          v34[3] = &unk_264A2EDE0;
          v34[4] = self;
          BOOL v7 = v33;
          long long v35 = v33;
          [v15 stopThreadAccessoryPairingWithCompletion:v34];
          [(HMDCHIPDataSource *)self setThreadPairingOverride:0];
          v28 = (void *)MEMORY[0x230FBD990]([(HMDCHIPDataSource *)self setThreadPairingFabricID:0]);
          v29 = self;
          v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v31 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            long long v41 = v31;
            __int16 v42 = 2112;
            id v43 = v15;
            _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Setting thread start pairing override to NO for home %@", buf, 0x16u);
          }

          goto LABEL_19;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  uint64_t v19 = (void *)MEMORY[0x230FBD990]();
  v20 = self;
  v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v41 = v22;
    __int16 v42 = 2112;
    id v43 = v6;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find home with CHIP fabric ID: %@", buf, 0x16u);
  }
  id v10 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  BOOL v7 = v33;
  v33[2](v33, v10);
LABEL_19:
  int v9 = v32;
LABEL_24:
}

void __65__HMDCHIPDataSource_stopAccessoryPairingWithFabricID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      int v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to stop thread accessory pairing, error %@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)overrideLocationCheckForPairingForFabricID:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    [(HMDCHIPDataSource *)self setThreadPairingOverride:1];
    id v5 = (void *)MEMORY[0x230FBD990]([(HMDCHIPDataSource *)self setThreadPairingFabricID:v4]);
    id v6 = self;
    BOOL v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = HMFGetLogIdentifier();
      int v9 = [(HMDCHIPDataSource *)v6 threadPairingFabricID];
      int v12 = 138543618;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Allowing thread start for pairing with fabricID: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    __int16 v10 = self;
    BOOL v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Not setting pairing override as fabricID is null.", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)startAccessoryPairingWithExtendedMACAddress:(id)a3 fabricID:(id)a4 isWedDevice:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  int v12 = (void (**)(id, void *))a6;
  uint64_t v13 = [(HMDCHIPDataSource *)self homeManager];
  __int16 v14 = v13;
  if (!v13)
  {
    v28 = (void *)MEMORY[0x230FBD990]();
    v29 = self;
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v31;
      long long v32 = "%{public}@Home manager reference is nil";
LABEL_20:
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, v32, buf, 0xCu);
    }
LABEL_21:

    uint64_t v15 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
    v12[2](v12, v15);
    goto LABEL_22;
  }
  if (!v11)
  {
    v28 = (void *)MEMORY[0x230FBD990]();
    v29 = self;
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v31;
      long long v32 = "%{public}@Fabric ID is nil";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  BOOL v33 = v7;
  long long v35 = v12;
  long long v36 = v10;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v34 = v13;
  uint64_t v15 = [v13 homes];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v41 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v21 = [v20 fabric];
        v22 = [v21 fabricID];
        int v23 = [v22 isEqualToNumber:v11];

        if (v23)
        {
          [(HMDCHIPDataSource *)self overrideLocationCheckForPairingForFabricID:v11];
          v37[0] = MEMORY[0x263EF8330];
          v37[1] = 3221225472;
          v37[2] = __97__HMDCHIPDataSource_startAccessoryPairingWithExtendedMACAddress_fabricID_isWedDevice_completion___block_invoke;
          v37[3] = &unk_264A2E788;
          v37[4] = self;
          id v10 = v36;
          id v38 = v36;
          int v12 = v35;
          long long v39 = v35;
          [v20 startThreadAccessoryPairingWithExtendedMACAddress:v38 isWedDevice:v33 completion:v37];

          goto LABEL_17;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  char v24 = (void *)MEMORY[0x230FBD990]();
  v25 = self;
  int v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v45 = v27;
    __int16 v46 = 2112;
    id v47 = v11;
    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find home with CHIP fabric ID: %@", buf, 0x16u);
  }
  uint64_t v15 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  int v12 = v35;
  v35[2](v35, v15);
  id v10 = v36;
LABEL_17:
  __int16 v14 = v34;
LABEL_22:
}

void __97__HMDCHIPDataSource_startAccessoryPairingWithExtendedMACAddress_fabricID_isWedDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543874;
      id v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to start thread accessory pairing with emac %@, error %@", (uint8_t *)&v9, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (int64_t)getUserPreferredThreadNetworkNodeTypeWithError:(id *)a3
{
  id v5 = [(HMDCHIPDataSource *)self userPreferredThreadNetworkEventListener];

  if (v5)
  {
    *a3 = 0;
    id v6 = [(HMDCHIPDataSource *)self userPreferredThreadNetworkEventListener];
    int64_t v7 = [v6 threadNetworkNodeType];

    return v7;
  }
  else
  {
    *a3 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    return 0;
  }
}

- (int64_t)getUserPreferredThreadNetworkConnectionStateWithError:(id *)a3
{
  id v5 = [(HMDCHIPDataSource *)self userPreferredThreadNetworkEventListener];

  if (v5)
  {
    *a3 = 0;
    id v6 = [(HMDCHIPDataSource *)self userPreferredThreadNetworkEventListener];
    int64_t v7 = [v6 threadNetworkConnectionState];

    return v7;
  }
  else
  {
    *a3 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    return 0;
  }
}

- (int64_t)getThreadNetworkNodeTypeWithFabricID:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCHIPDataSource *)self homeManager];
  id v6 = v5;
  if (!v5)
  {
    v21 = (void *)MEMORY[0x230FBD990]();
    v22 = self;
    int v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      char v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      BOOL v33 = v24;
      v25 = "%{public}@Home manager reference is nil";
LABEL_20:
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, v25, buf, 0xCu);
    }
LABEL_21:

    int64_t v20 = 0;
    goto LABEL_22;
  }
  if (!v4)
  {
    v21 = (void *)MEMORY[0x230FBD990]();
    v22 = self;
    int v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      char v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      BOOL v33 = v24;
      v25 = "%{public}@fabricID is nil";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v27 = v5;
  int64_t v7 = [v5 homes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        __int16 v13 = [v12 fabric];
        id v14 = [v13 fabricID];
        char v15 = [v14 isEqualToNumber:v4];

        if (v15)
        {
          int64_t v20 = [v12 threadNetworkNodeType];

          goto LABEL_17;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v16 = (void *)MEMORY[0x230FBD990]();
  uint64_t v17 = self;
  uint64_t v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    BOOL v33 = v19;
    __int16 v34 = 2112;
    id v35 = v4;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@No home found with fabricID %@", buf, 0x16u);
  }
  int64_t v20 = 0;
LABEL_17:
  id v6 = v27;
LABEL_22:

  return v20;
}

- (int64_t)getThreadNetworkConnectionStateWithFabricID:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCHIPDataSource *)self homeManager];
  id v6 = v5;
  if (!v5)
  {
    v21 = (void *)MEMORY[0x230FBD990]();
    v22 = self;
    int v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      char v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      BOOL v33 = v24;
      v25 = "%{public}@Home manager reference is nil";
LABEL_20:
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, v25, buf, 0xCu);
    }
LABEL_21:

    int64_t v20 = 0;
    goto LABEL_22;
  }
  if (!v4)
  {
    v21 = (void *)MEMORY[0x230FBD990]();
    v22 = self;
    int v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      char v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      BOOL v33 = v24;
      v25 = "%{public}@fabricID is nil";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v27 = v5;
  int64_t v7 = [v5 homes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        __int16 v13 = [v12 fabric];
        id v14 = [v13 fabricID];
        char v15 = [v14 isEqualToNumber:v4];

        if (v15)
        {
          int64_t v20 = [v12 threadNetworkConnectionState];

          goto LABEL_17;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v16 = (void *)MEMORY[0x230FBD990]();
  uint64_t v17 = self;
  uint64_t v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    BOOL v33 = v19;
    __int16 v34 = 2112;
    id v35 = v4;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@No home found with fabricID %@", buf, 0x16u);
  }
  int64_t v20 = 0;
LABEL_17:
  id v6 = v27;
LABEL_22:

  return v20;
}

- (void)handleThreadNetworkPeripheralDeviceNodeTypeChangedNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    uint64_t v8 = [(HMDCHIPDataSource *)self matterThreadRadioManager];
    objc_msgSend(v8, "notifyPeripheralDeviceNodeTypeChanged:", objc_msgSend(v7, "peripheralDeviceNodeType"));
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v10 = self;
    __int16 v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Event not of type HMDThreadNetworkPeripheralDeviceNodeTypeEvent", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)handleThreadNetworkWakeOnConnectionStateChangedNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    uint64_t v8 = [(HMDCHIPDataSource *)self matterThreadRadioManager];
    uint64_t v9 = [v7 connectionState];
    uint64_t v10 = [v7 eMACAddressAsString];
    [v8 notifyWakeOnDeviceConnectionChanged:v9 eMACAddress:v10];
  }
  else
  {
    __int16 v11 = (void *)MEMORY[0x230FBD990]();
    uint64_t v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Event not of type thread wake on connection state changed", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)handleThreadNetworkStateChangedNotification:(id)a3
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    if (![(HMDCHIPDataSource *)self pendingRadioStateChangeNotification])
    {
      [(HMDCHIPDataSource *)self setPendingRadioStateChangeNotification:1];
      objc_initWeak(location, self);
      dispatch_time_t v8 = dispatch_time(0, 50000000);
      uint64_t v9 = dispatch_get_global_queue(21, 0);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __65__HMDCHIPDataSource_handleThreadNetworkStateChangedNotification___block_invoke;
      v14[3] = &unk_264A2C148;
      objc_copyWeak(&v16, location);
      id v15 = v7;
      dispatch_after(v8, v9, v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak(location);
    }
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    __int16 v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@No home associated with network connection state change notification", (uint8_t *)location, 0xCu);
    }
  }
}

void __65__HMDCHIPDataSource_handleThreadNetworkStateChangedNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setPendingRadioStateChangeNotification:0];
  v2 = [WeakRetained matterThreadRadioManager];
  uint64_t v3 = [*(id *)(a1 + 32) threadNetworkConnectionState];
  uint64_t v4 = [*(id *)(a1 + 32) threadNetworkNodeType];
  id v5 = [*(id *)(a1 + 32) fabric];
  id v6 = [v5 fabricID];
  [v2 notifyThreadRadioStateChanged:v3 nodeType:v4 fabricID:v6];
}

- (void)connectToAccessoryForUserPreferredNetworkWithExtendedMACAddress:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDCHIPDataSource *)self getSharedThreadResidentCommissioner];
  [v8 connectToThreadAccessoryWithExtendedMACAddress:v7 completion:v6];
}

- (void)connectToAccessoryWithExtendedMACAddress:(id)a3 withFabricID:(id)a4 completion:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(HMDCHIPDataSource *)self homeManager];
  uint64_t v12 = v11;
  if (v11)
  {
    long long v31 = (void (**)(void, void))v10;
    long long v32 = v8;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v30 = v11;
    int v13 = [v11 homes];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v37;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v37 != v16) {
            objc_enumerationMutation(v13);
          }
          if (v9)
          {
            uint64_t v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            uint64_t v19 = [v18 fabric];
            int64_t v20 = [v19 fabricID];
            int v21 = [v20 isEqualToNumber:v9];

            if (v21)
            {
              v33[0] = MEMORY[0x263EF8330];
              v33[1] = 3221225472;
              v33[2] = __86__HMDCHIPDataSource_connectToAccessoryWithExtendedMACAddress_withFabricID_completion___block_invoke;
              v33[3] = &unk_264A2E788;
              v33[4] = self;
              id v8 = v32;
              id v34 = v32;
              id v10 = v31;
              id v35 = v31;
              [v18 connectToThreadAccessoryWithExtendedMACAddress:v34 completion:v33];

              goto LABEL_18;
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    v22 = (void *)MEMORY[0x230FBD990]();
    int v23 = self;
    char v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v41 = v25;
      __int16 v42 = 2112;
      id v43 = v9;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find home with CHIP fabric ID: %@", buf, 0x16u);
    }
    int v13 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    id v10 = v31;
    ((void (**)(void, void *))v31)[2](v31, v13);
    id v8 = v32;
LABEL_18:
    uint64_t v12 = v30;
  }
  else
  {
    int v26 = (void *)MEMORY[0x230FBD990]();
    v27 = self;
    long long v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      long long v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v41 = v29;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Home manager reference is nil", buf, 0xCu);
    }
    int v13 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
    (*((void (**)(id, void *))v10 + 2))(v10, v13);
  }
}

void __86__HMDCHIPDataSource_connectToAccessoryWithExtendedMACAddress_withFabricID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543874;
      id v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to connect to accessory with emac %@, error %@", (uint8_t *)&v9, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)stopThreadRadioOnDeviceLock
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  uint64_t v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping Thread network after device lock", buf, 0xCu);
  }
  id v7 = [(HMDCHIPDataSource *)v4 getSharedThreadResidentCommissioner];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__HMDCHIPDataSource_stopThreadRadioOnDeviceLock__block_invoke;
  v8[3] = &unk_264A2F3E8;
  v8[4] = v4;
  [v7 stopThreadNetworkOnDeviceLockWithCompletion:v8];
}

void __48__HMDCHIPDataSource_stopThreadRadioOnDeviceLock__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v13 = 138543618;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v3;
      int v9 = "%{public}@Failed to stop Thread network with error: %@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v13 = 138543362;
    id v14 = v8;
    int v9 = "%{public}@Successfully stopped Thread network";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    uint32_t v12 = 12;
    goto LABEL_6;
  }
}

- (void)_stopNetworkListenerForUserPreferredNetwork
{
  [(HMDCHIPDataSource *)self setThreadNetworkShouldRestartOnNetworkChange:0];
  id v3 = [(HMDCHIPDataSource *)self userPreferredThreadNetworkEventListener];
  [v3 stopListeningForEvents];

  [(HMDCHIPDataSource *)self setUserPreferredThreadNetworkEventListener:0];
}

- (void)_startNetworkListenerForUserPreferredNetwork:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HMDCHIPDataSource *)self userPreferredThreadNetworkEventListener];

  if (!v5)
  {
    id v6 = [(HMDCHIPDataSource *)self getSharedThreadResidentCommissioner];
    id v7 = [[HMDCHIPThreadNetworkEventListener alloc] initWithThreadResidentCommissioner:v6];
    [(HMDCHIPDataSource *)self setUserPreferredThreadNetworkEventListener:v7];

    uint64_t v8 = [(HMDCHIPDataSource *)self userPreferredThreadNetworkEventListener];
    [v8 setEventListenerDelegate:self];
  }
  [(HMDCHIPDataSource *)self setThreadNetworkShouldRestartOnNetworkChange:v3];
}

- (void)stopThreadRadioForUserPreferredNetwork
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x230FBD990](self, a2);
  uint64_t v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping Thread network for user preferred network", buf, 0xCu);
  }
  [(HMDCHIPDataSource *)v4 _stopNetworkListenerForUserPreferredNetwork];
  id v7 = [(HMDCHIPDataSource *)v4 getSharedThreadResidentCommissioner];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__HMDCHIPDataSource_stopThreadRadioForUserPreferredNetwork__block_invoke;
  v8[3] = &unk_264A2F3E8;
  v8[4] = v4;
  [v7 stopThreadNetworkWithCompletion:v8];
}

void __59__HMDCHIPDataSource_stopThreadRadioForUserPreferredNetwork__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v13 = 138543618;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v3;
      int v9 = "%{public}@Failed to stop Thread network with error: %@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v13 = 138543362;
    id v14 = v8;
    int v9 = "%{public}@Successfully stopped Thread network";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    uint32_t v12 = 12;
    goto LABEL_6;
  }
}

- (void)startThreadRadioForUserPreferredNetwork
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(HMDCHIPDataSource *)self startThreadOnWakeEnabled])
  {
    [(HMDCHIPDataSource *)self startThreadRadioForUserPreferredNetworkWithGeoAndBorderRouterCheck];
  }
  else
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
    uint64_t v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v6;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting Thread network for user preferred network", buf, 0xCu);
    }
    id v7 = [(HMDCHIPDataSource *)v4 getDefaultThreadNetworkMetadataStore];
    if (v7)
    {
      uint64_t v8 = [(HMDCHIPDataSource *)v4 getSharedThreadResidentCommissioner];
      [(HMDCHIPDataSource *)v4 _startNetworkListenerForUserPreferredNetwork:0];
      objc_initWeak((id *)buf, v4);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __60__HMDCHIPDataSource_startThreadRadioForUserPreferredNetwork__block_invoke;
      v14[3] = &unk_264A218C0;
      objc_copyWeak(&v16, (id *)buf);
      id v9 = v8;
      id v15 = v9;
      [v7 retrievePreferredNetwork:0 completion:v14];

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      id v10 = (void *)MEMORY[0x230FBD990]();
      os_log_type_t v11 = v4;
      uint32_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v18 = v13;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@No thread network metadata store", buf, 0xCu);
      }
    }
  }
}

void __60__HMDCHIPDataSource_startThreadRadioForUserPreferredNetwork__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = WeakRetained;
    id v16 = HMFGetOSLogHandle();
    uint64_t v17 = v16;
    if (!v11 || v12)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v27 = v23;
        __int16 v28 = 2112;
        id v29 = v12;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to retrieve operationalDataset for thread network: %@", buf, 0x16u);
      }
      [v15 _stopNetworkListenerForUserPreferredNetwork];
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v27 = v18;
        __int16 v28 = 2112;
        id v29 = v9;
        __int16 v30 = 2112;
        id v31 = v10;
        __int16 v32 = 2112;
        id v33 = v11;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Successfully retrieved preferred thread credentials %@ with UUID %@ and operationalDataset %@ from network metadata store", buf, 0x2Au);
      }
      [*(id *)(a1 + 32) setGeoAvailable:0];
      uint64_t v19 = *(void **)(a1 + 32);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __60__HMDCHIPDataSource_startThreadRadioForUserPreferredNetwork__block_invoke_172;
      v24[3] = &unk_264A2F370;
      v24[4] = v15;
      id v25 = v10;
      [v19 startThreadNetworkWithOperationalDataset:v11 threadNetworkID:v25 isOwnerUser:0 completion:v24];
    }
  }
  else
  {
    int64_t v20 = (void *)MEMORY[0x230FBD990]();
    int v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v27 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to get strong reference to self - abort", buf, 0xCu);
    }
  }
}

void __60__HMDCHIPDataSource_startThreadRadioForUserPreferredNetwork__block_invoke_172(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v12 = 138543874;
      int v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to attach to user preferred thread network %@: %@", (uint8_t *)&v12, 0x20u);
    }
    [*(id *)(a1 + 32) _stopNetworkListenerForUserPreferredNetwork];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138543618;
      int v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Attached to thread network %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)startThreadRadioForUserPreferredNetworkWithGeoAndBorderRouterCheck
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  uint64_t v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting Thread network for user preferred network with GEO and BR check", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v49 = [(HMDCHIPDataSource *)v4 getDefaultThreadNetworkMetadataStore];
  if (v49)
  {
    BOOL v48 = [(HMDCHIPDataSource *)v4 _getLocationAuthorized];
    uint64_t v65 = 0;
    v66 = &v65;
    uint64_t v67 = 0x2020000000;
    char v68 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v77 = 0x3032000000;
    v78 = __Block_byref_object_copy__144125;
    v79 = __Block_byref_object_dispose__144126;
    id v80 = 0;
    group = dispatch_group_create();
    id v7 = [(HMDCHIPDataSource *)v4 homeManager];
    if (v7) {
      BOOL v8 = v48;
    }
    else {
      BOOL v8 = 0;
    }
    id v47 = v7;
    if (v8)
    {
      uint64_t v9 = objc_msgSend(v7, "homes", v7);
      id v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_163_144127];

      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v61 objects:v75 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v62;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v62 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v15 = *(void **)(*((void *)&v61 + 1) + 8 * i);
            __int16 v16 = [v15 fabric];
            id v17 = [v16 fabricID];

            if (v17)
            {
              uint64_t v18 = [v15 matterAccessories];
              if ([v18 count])
              {
                dispatch_group_enter(group);
                v57[0] = MEMORY[0x263EF8330];
                v57[1] = 3221225472;
                v57[2] = __87__HMDCHIPDataSource_startThreadRadioForUserPreferredNetworkWithGeoAndBorderRouterCheck__block_invoke_2;
                v57[3] = &unk_264A21848;
                v57[4] = v4;
                v57[5] = v15;
                v59 = &v65;
                p_long long buf = &buf;
                v58 = group;
                [(HMDCHIPDataSource *)v4 hasValidGeoOrPreferredNetworkForHome:v15 completion:v57];
              }
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v61 objects:v75 count:16];
        }
        while (v12);
      }
    }
    else
    {
      int v23 = (void *)MEMORY[0x230FBD990](v7);
      char v24 = v4;
      HMFGetOSLogHandle();
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        int v26 = HMFGetLogIdentifier();
        *(_DWORD *)v69 = 138543362;
        id v70 = v26;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Home manager reference is nil - skipping in-geo && matter check", v69, 0xCu);
      }
    }
    dispatch_time_t v27 = dispatch_time(0, 2000000000);
    if (dispatch_group_wait(group, v27))
    {
      __int16 v28 = (void *)MEMORY[0x230FBD990]();
      id v29 = v4;
      HMFGetOSLogHandle();
      __int16 v30 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        id v31 = HMFGetLogIdentifier();
        *(_DWORD *)v69 = 138543362;
        id v70 = v31;
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Timed out while fetching preferred network.", v69, 0xCu);
      }
    }
    __int16 v32 = (void *)MEMORY[0x230FBD990]();
    id v33 = v4;
    HMFGetOSLogHandle();
    uint64_t v34 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      long long v37 = HMFBooleanToString();
      *(_DWORD *)v69 = 138543874;
      id v70 = v35;
      __int16 v71 = 2112;
      id v72 = v36;
      __int16 v73 = 2112;
      v74 = v37;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@startThreadRadioForUserPreferredNetwork: isLocationAuthorized = %@. isInGeoForAnyHome = %@", v69, 0x20u);
    }
    if (v48 && !*((unsigned char *)v66 + 24))
    {
      BOOL v38 = CFPreferencesGetAppBooleanValue(@"StartThreadOnWakeBypassAccessoryRequirement", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0) == 0;
      long long v39 = (void *)MEMORY[0x230FBD990]();
      long long v40 = v33;
      if (v38)
      {
        HMFGetOSLogHandle();
        uint64_t v45 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          __int16 v46 = HMFGetLogIdentifier();
          *(_DWORD *)v69 = 138543362;
          id v70 = v46;
          _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_INFO, "%{public}@Not in-geo for any home and no accessories in matter locker, not starting thread", v69, 0xCu);
        }
        goto LABEL_39;
      }
      HMFGetOSLogHandle();
      long long v41 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        __int16 v42 = HMFGetLogIdentifier();
        *(_DWORD *)v69 = 138543362;
        id v70 = v42;
        _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_INFO, "%{public}@Not in-geo for any home and no accessories in matter locker, allowing thread start anyways", v69, 0xCu);
      }
    }
    id v43 = [(HMDCHIPDataSource *)v33 getSharedThreadResidentCommissioner];
    [(HMDCHIPDataSource *)v33 _startNetworkListenerForUserPreferredNetwork:1];
    objc_initWeak((id *)v69, v33);
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __87__HMDCHIPDataSource_startThreadRadioForUserPreferredNetworkWithGeoAndBorderRouterCheck__block_invoke_168;
    v51[3] = &unk_264A21898;
    objc_copyWeak(&v56, (id *)v69);
    id v52 = v49;
    v54 = &buf;
    id v44 = v43;
    id v53 = v44;
    v55 = &v65;
    [v52 retrieveBorderRouterPreferredNetworkWithCompletion:v51];

    objc_destroyWeak(&v56);
    objc_destroyWeak((id *)v69);

LABEL_39:
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v65, 8);
    goto LABEL_40;
  }
  uint64_t v19 = (void *)MEMORY[0x230FBD990]();
  int64_t v20 = v4;
  int v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = HMFGetLogIdentifier();
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v22;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@No thread network metadata store", (uint8_t *)&buf, 0xCu);
  }
LABEL_40:
}

void __87__HMDCHIPDataSource_startThreadRadioForUserPreferredNetworkWithGeoAndBorderRouterCheck__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 32);
  BOOL v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    id v10 = HMFBooleanToString();
    int v19 = 138543874;
    int64_t v20 = v9;
    __int16 v21 = 2112;
    v22 = v10;
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@GeoAvailable: %@, error %@", (uint8_t *)&v19, 0x20u);
  }
  if (a2)
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = HMFGetLogIdentifier();
      uint64_t v15 = [*(id *)(a1 + 40) fabric];
      __int16 v16 = [v15 fabricID];
      id v17 = *(void **)(a1 + 40);
      int v19 = 138543874;
      int64_t v20 = v14;
      __int16 v21 = 2112;
      v22 = v16;
      __int16 v23 = 2112;
      id v24 = v17;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Is in Geo for home with fabricID %@ - %@", (uint8_t *)&v19, 0x20u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      uint64_t v18 = [*(id *)(a1 + 40) threadOperationalDataset];

      if (v18) {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 40));
      }
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __87__HMDCHIPDataSource_startThreadRadioForUserPreferredNetworkWithGeoAndBorderRouterCheck__block_invoke_168(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  BOOL v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = [WeakRetained userPreferredThreadNetworkEventListener];

    if (v9)
    {
      if (!v5 || v6)
      {
        objc_initWeak((id *)buf, v8);
        uint64_t v18 = *(void **)(a1 + 32);
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __87__HMDCHIPDataSource_startThreadRadioForUserPreferredNetworkWithGeoAndBorderRouterCheck__block_invoke_169;
        v21[3] = &unk_264A21870;
        objc_copyWeak(&v26, (id *)buf);
        uint64_t v24 = *(void *)(a1 + 48);
        id v22 = v5;
        id v19 = *(id *)(a1 + 40);
        uint64_t v20 = *(void *)(a1 + 56);
        id v23 = v19;
        uint64_t v25 = v20;
        [v18 retrievePreferredNetwork:0 completion:v21];

        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)buf);
        goto LABEL_15;
      }
      id v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = v8;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        __int16 v28 = v13;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Border router present on network - not starting thread", buf, 0xCu);
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = v8;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v17 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        __int16 v28 = v17;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Aborting thread start after border router check - thread was started for a home", buf, 0xCu);
      }
    }
  }
  else
  {
    __int16 v14 = (void *)MEMORY[0x230FBD990]();
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      __int16 v28 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to get strong reference to self - abort", buf, 0xCu);
    }
  }
LABEL_15:
}

void __87__HMDCHIPDataSource_startThreadRadioForUserPreferredNetworkWithGeoAndBorderRouterCheck__block_invoke_169(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  __int16 v14 = WeakRetained;
  if (!WeakRetained)
  {
    uint64_t v31 = MEMORY[0x230FBD990]();
    __int16 v32 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      id v35 = (void *)v31;
      goto LABEL_18;
    }
    id v33 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    __int16 v42 = v33;
    _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to get strong reference to self - abort", buf, 0xCu);
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v15 = [WeakRetained userPreferredThreadNetworkEventListener];

  if (!v15)
  {
    uint64_t v31 = MEMORY[0x230FBD990]();
    __int16 v32 = v14;
    id v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      __int16 v42 = v34;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Aborting thread start after getting preferred network - thread was started for a home", buf, 0xCu);
    }
    goto LABEL_16;
  }
  if (!v11 || v12)
  {
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = v14;
    id v19 = HMFGetOSLogHandle();
    uint64_t v20 = v19;
    if (v16)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v21 = HMFGetLogIdentifier();
        long long v37 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) fabric];
        [v37 fabricID];
        v22 = BOOL v38 = v17;
        id v23 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        *(_DWORD *)long long buf = 138543874;
        __int16 v42 = v21;
        __int16 v43 = 2112;
        id v44 = v22;
        __int16 v45 = 2112;
        id v46 = v23;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Using cached AOD from home with fabricID %@ - %@", buf, 0x20u);

        id v17 = v38;
      }

      uint64_t v24 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) threadOperationalDataset];

      id v11 = (id)v24;
      goto LABEL_9;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v36 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      __int16 v42 = v36;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@No cached AOD available as a fallback, aborting thread start", buf, 0xCu);
    }
    id v35 = v17;
LABEL_18:
    goto LABEL_19;
  }
LABEL_9:
  uint64_t v25 = (void *)MEMORY[0x230FBD990]();
  id v26 = v14;
  dispatch_time_t v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    __int16 v28 = HMFGetLogIdentifier();
    uint64_t v29 = *(void **)(a1 + 32);
    *(_DWORD *)long long buf = 138544130;
    __int16 v42 = v28;
    __int16 v43 = 2112;
    id v44 = v29;
    __int16 v45 = 2112;
    id v46 = v10;
    __int16 v47 = 2112;
    id v48 = v11;
    _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Successfully retrieved preferred thread credentials %@ with UUID %@ and operationalDataset %@ from network metadata store", buf, 0x2Au);
  }
  [*(id *)(a1 + 40) setGeoAvailable:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  __int16 v30 = *(void **)(a1 + 40);
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __87__HMDCHIPDataSource_startThreadRadioForUserPreferredNetworkWithGeoAndBorderRouterCheck__block_invoke_170;
  v39[3] = &unk_264A2F370;
  v39[4] = v26;
  id v40 = v10;
  [v30 startThreadNetworkWithOperationalDataset:v11 threadNetworkID:v40 isOwnerUser:0 completion:v39];

LABEL_19:
}

void __87__HMDCHIPDataSource_startThreadRadioForUserPreferredNetworkWithGeoAndBorderRouterCheck__block_invoke_170(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v15 = 138543874;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v3;
      id v10 = "%{public}@Failed to attach to user preferred thread network %@: %@";
      id v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v11, v12, v10, (uint8_t *)&v15, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 40);
    int v15 = 138543618;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    id v10 = "%{public}@Attached to thread network %@";
    id v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
    goto LABEL_6;
  }
}

uint64_t __87__HMDCHIPDataSource_startThreadRadioForUserPreferredNetworkWithGeoAndBorderRouterCheck__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 reachableAccessoriesCount];
  if (v6 == [v5 reachableAccessoriesCount])
  {
    id v7 = [v4 uuid];
    BOOL v8 = [v7 UUIDString];
    uint64_t v9 = [v5 uuid];
    id v10 = [v9 UUIDString];
    uint64_t v11 = [v8 compare:v10];
  }
  else
  {
    id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "reachableAccessoriesCount"));
    BOOL v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "reachableAccessoriesCount"));
    uint64_t v11 = [v7 compare:v8];
  }

  return v11;
}

- (void)_getPreferredNetworkExistsWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v20 = 0;
  id v5 = (void *)WiFiCopyCurrentNetworkInfoEx();
  uint64_t v6 = [v5 objectForKeyedSubscript:@"ssid"];
  id v7 = (void *)MEMORY[0x230FBD990]();
  BOOL v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543874;
    id v22 = v10;
    __int16 v23 = 2112;
    uint64_t v24 = v6;
    __int16 v25 = 1024;
    int v26 = v20;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Checking if preferred network exists for SSID: %@ error: %d", buf, 0x1Cu);
  }
  [(HMDCHIPDataSource *)v8 setPnExistsOnCurrentNetwork:0];
  uint64_t v11 = [(HMDCHIPDataSource *)v8 getDefaultThreadNetworkMetadataStore];
  if (v11)
  {
    objc_initWeak((id *)buf, v8);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __62__HMDCHIPDataSource__getPreferredNetworkExistsWithCompletion___block_invoke;
    v17[3] = &unk_264A21820;
    objc_copyWeak(&v19, (id *)buf);
    id v18 = v4;
    [v11 retrievePreferredNetwork:0 completion:v17];

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    os_log_type_t v12 = (void *)MEMORY[0x230FBD990]();
    uint32_t v13 = v8;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      id v22 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@No thread network metadata store", buf, 0xCu);
    }
    uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:2 userInfo:0];
    (*((void (**)(id, void *))v4 + 2))(v4, v16);
  }
}

void __62__HMDCHIPDataSource__getPreferredNetworkExistsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = WeakRetained;
    uint64_t v16 = HMFGetOSLogHandle();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (v17)
      {
        id v18 = HMFGetLogIdentifier();
        int v25 = 138544130;
        int v26 = v18;
        __int16 v27 = 2112;
        id v28 = v9;
        __int16 v29 = 2112;
        id v30 = v10;
        __int16 v31 = 2112;
        id v32 = v11;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Successfully retrieved preferred thread credentials %@ with UUID %@ and operationalDataset %@ for current network", (uint8_t *)&v25, 0x2Au);
      }
      [v15 setPnExistsOnCurrentNetwork:1];
      id v19 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      if (v17)
      {
        uint64_t v24 = HMFGetLogIdentifier();
        int v25 = 138543362;
        int v26 = v24;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@No thread network found for current Wifi", (uint8_t *)&v25, 0xCu);
      }
      id v19 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v19();
  }
  else
  {
    int v20 = (void *)MEMORY[0x230FBD990]();
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      int v25 = 138543362;
      int v26 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to get strong reference to self - abort", (uint8_t *)&v25, 0xCu);
    }
    __int16 v23 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:2 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (BOOL)_getLocationAuthorized
{
  v2 = +[HMDLocation sharedManager];
  BOOL v3 = [v2 locationAuthorized] == 1;

  return v3;
}

- (void)handleNetworkStateChange
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v11 = 138543362;
    id v12 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Received network state change from Thread network event listener", (uint8_t *)&v11, 0xCu);
  }
  id v7 = [(HMDCHIPDataSource *)v4 matterThreadRadioManager];
  BOOL v8 = [(HMDCHIPDataSource *)v4 userPreferredThreadNetworkEventListener];
  uint64_t v9 = [v8 threadNetworkConnectionState];
  id v10 = [(HMDCHIPDataSource *)v4 userPreferredThreadNetworkEventListener];
  objc_msgSend(v7, "notifyThreadRadioStateChanged:nodeType:fabricID:", v9, objc_msgSend(v10, "threadNetworkNodeType"), 0);
}

- (void)handleThreadBTCallStateChange:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x230FBD990](self, a2);
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = HMFGetLogIdentifier();
    uint64_t v9 = HMFBooleanToString();
    int v10 = 138543618;
    int v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Received thread call state change - isInCall = %@", (uint8_t *)&v10, 0x16u);
  }
  if (!a3) {
    [(HMDCHIPDataSource *)v6 startThreadRadioForUserPreferredNetwork];
  }
}

- (void)stopThreadRadioForHomeWithFabricID:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCHIPDataSource *)self homeManager];
  uint64_t v6 = v5;
  if (!v5)
  {
    int v20 = (void *)MEMORY[0x230FBD990]();
    uint64_t v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      id v35 = v23;
      uint64_t v24 = "%{public}@Home manager reference is nil";
LABEL_23:
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, v24, buf, 0xCu);
    }
LABEL_24:

    goto LABEL_25;
  }
  if (!v4)
  {
    int v20 = (void *)MEMORY[0x230FBD990]();
    uint64_t v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      id v35 = v23;
      uint64_t v24 = "%{public}@fabricID is nil";
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  __int16 v29 = v5;
  id v7 = [v5 homes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v13 = [v12 fabric];
        uint64_t v14 = [v13 fabricID];
        int v15 = [v14 isEqualToNumber:v4];

        if (v15)
        {
          int v25 = (void *)MEMORY[0x230FBD990]();
          int v26 = self;
          __int16 v27 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            id v28 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543618;
            id v35 = v28;
            __int16 v36 = 2112;
            id v37 = v4;
            _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Calling thread stop for home with fabricID: %@", buf, 0x16u);
          }
          [v12 stopThreadNetwork:1];
          [(HMDCHIPDataSource *)v26 unregisterPresenceNotificationsForHome:v12];
          uint64_t v6 = v29;
          if ([(HMDCHIPDataSource *)v26 startThreadOnWakeEnabled]) {
            [(HMDCHIPDataSource *)v26 _startNetworkListenerForUserPreferredNetwork:1];
          }

          goto LABEL_25;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v16 = (void *)MEMORY[0x230FBD990]();
  BOOL v17 = self;
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    id v35 = v19;
    __int16 v36 = 2112;
    id v37 = v4;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find home with CHIP fabric ID: %@", buf, 0x16u);
  }
  uint64_t v6 = v29;
LABEL_25:
}

- (void)startThreadRadioForHomeWithFabricID:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCHIPDataSource *)self homeManager];
  uint64_t v6 = v5;
  if (!v5)
  {
    int v20 = (void *)MEMORY[0x230FBD990]();
    uint64_t v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      uint64_t v39 = v23;
      uint64_t v24 = "%{public}@Home manager reference is nil";
LABEL_23:
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, v24, buf, 0xCu);
    }
LABEL_24:

    goto LABEL_32;
  }
  if (!v4)
  {
    int v20 = (void *)MEMORY[0x230FBD990]();
    uint64_t v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      uint64_t v39 = v23;
      uint64_t v24 = "%{public}@fabricID is nil";
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = v5;
  id v7 = [v5 homes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (!v8) {
    goto LABEL_11;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v35;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v35 != v10) {
        objc_enumerationMutation(v7);
      }
      __int16 v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      uint64_t v13 = [v12 fabric];
      uint64_t v14 = [v13 fabricID];
      int v15 = [v14 isEqualToNumber:v4];

      if (v15)
      {
        uint64_t v6 = v33;
        if (![(HMDCHIPDataSource *)self threadPairingOverride])
        {
          if (([(HMDCHIPDataSource *)self checkPresenceForHome:v12] & 0xFFFFFFFFFFFFFFFELL) == 2)
          {
            int v25 = (void *)MEMORY[0x230FBD990]();
            int v26 = self;
            __int16 v27 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              id v28 = HMFGetLogIdentifier();
              *(_DWORD *)long long buf = 138543618;
              uint64_t v39 = v28;
              __int16 v40 = 2112;
              id v41 = v4;
              _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Not calling thread start for home with fabricID: %@ as user is not home", buf, 0x16u);
            }
            [(HMDCHIPDataSource *)v26 registerForArrivalNotifications:v12];
LABEL_31:

            goto LABEL_32;
          }
          [(HMDCHIPDataSource *)self registerForLeaveNotifications:v12];
        }
        if ([(HMDCHIPDataSource *)self startThreadOnWakeEnabled]) {
          [(HMDCHIPDataSource *)self _stopNetworkListenerForUserPreferredNetwork];
        }
        __int16 v29 = (void *)MEMORY[0x230FBD990]([(HMDCHIPDataSource *)self registerForLeaveNotifications:v12]);
        long long v30 = self;
        long long v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          long long v32 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          uint64_t v39 = v32;
          __int16 v40 = 2112;
          id v41 = v4;
          _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Calling thread start for home with fabricID: %@", buf, 0x16u);
        }
        [v12 startThreadNetwork:1];
        goto LABEL_31;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v9) {
      continue;
    }
    break;
  }
LABEL_11:

  uint64_t v16 = (void *)MEMORY[0x230FBD990]();
  BOOL v17 = self;
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    uint64_t v39 = v19;
    __int16 v40 = 2112;
    id v41 = v4;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find home with CHIP fabric ID: %@", buf, 0x16u);
  }
  uint64_t v6 = v33;
LABEL_32:
}

- (void)_scheduleThreadNetworkRestart
{
  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  [(HMDCHIPDataSource *)self setNetworkChangedLastUpdatedTime:v3];
  id v4 = dispatch_get_global_queue(21, 0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__HMDCHIPDataSource__scheduleThreadNetworkRestart__block_invoke;
  v5[3] = &unk_264A2C6A0;
  v5[4] = self;
  v5[5] = v3;
  dispatch_after(v3, v4, v5);
}

void __50__HMDCHIPDataSource__scheduleThreadNetworkRestart__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 != [*(id *)(a1 + 32) networkChangedLastUpdatedTime])
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Ignoring Wifi network changed as newer request is queued.", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_12;
  }
  [*(id *)(a1 + 32) _getPreferredNetworkExistsWithCompletion:&__block_literal_global_157_144177];
  int v3 = [*(id *)(a1 + 32) threadNetworkShouldRestartOnNetworkChange];
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (!v3)
  {
    if (v7)
    {
      __int16 v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v12;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Ignoring WiFi network changed notification when Thread is not up", (uint8_t *)&v13, 0xCu);
    }
LABEL_12:
    return;
  }
  if (v7)
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Restarting Thread network for user preferred network upon WiFi network changed notification", (uint8_t *)&v13, 0xCu);
  }
  [*(id *)(a1 + 32) startThreadRadioForUserPreferredNetwork];
}

- (void)hasValidGeoOrPreferredNetworkForHome:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = (void (**)(id, uint64_t, void))a4;
  if (v6)
  {
    int64_t v8 = [(HMDCHIPDataSource *)self checkPresenceForHome:v6];
    if (v8 == 1)
    {
      id v9 = (void *)MEMORY[0x230FBD990]();
      uint64_t v10 = self;
      int v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        __int16 v12 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        __int16 v29 = v12;
        __int16 v30 = 2112;
        id v31 = v6;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Allowing geo as user is at home for: %@", buf, 0x16u);
      }
      v7[2](v7, 1, 0);
    }
    else
    {
      int64_t v14 = v8;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__HMDCHIPDataSource_hasValidGeoOrPreferredNetworkForHome_completion___block_invoke;
      aBlock[3] = &unk_264A217F8;
      aBlock[4] = self;
      BOOL v27 = v8 == 0;
      id v15 = v6;
      id v24 = v15;
      int v25 = v7;
      int64_t v26 = v14;
      uint64_t v16 = (void (**)(void *, void))_Block_copy(aBlock);
      if ([(HMDCHIPDataSource *)self pnExistsOnCurrentNetwork])
      {
        v16[2](v16, 0);
      }
      else
      {
        BOOL v17 = (void *)MEMORY[0x230FBD990]();
        id v18 = self;
        id v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          int v20 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          __int16 v29 = v20;
          __int16 v30 = 2112;
          id v31 = v15;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Fetching preferred network as location is unknown for home: %@", buf, 0x16u);
        }
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __69__HMDCHIPDataSource_hasValidGeoOrPreferredNetworkForHome_completion___block_invoke_154;
        v21[3] = &unk_264A2EDE0;
        void v21[4] = v18;
        id v22 = v16;
        [(HMDCHIPDataSource *)v18 _getPreferredNetworkExistsWithCompletion:v21];
      }
    }
  }
  else
  {
    int v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:2 userInfo:0];
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v13);
  }
}

void __69__HMDCHIPDataSource_hasValidGeoOrPreferredNetworkForHome_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) _getLocationAuthorized];
  if (*(unsigned char *)(a1 + 64) && ([*(id *)(a1 + 32) pnExistsOnCurrentNetwork] & v4) == 1)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    BOOL v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int64_t v8 = HMFGetLogIdentifier();
      id v9 = *(void **)(a1 + 40);
      int v15 = 138543874;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Allowing geo due to valid preferred network for: %@ and error: %@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    BOOL v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v11 = HMStringFromHomeLocation();
      __int16 v12 = HMFBooleanToString();
      [*(id *)(a1 + 32) pnExistsOnCurrentNetwork];
      int v13 = HMFBooleanToString();
      uint64_t v14 = *(void *)(a1 + 40);
      int v15 = 138544642;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v12;
      __int16 v21 = 2112;
      id v22 = v13;
      __int16 v23 = 2112;
      uint64_t v24 = v14;
      __int16 v25 = 2112;
      id v26 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Denying geo due to presence: %@, location authorization: %@, preferred network: %@ for: %@ error: %@", (uint8_t *)&v15, 0x3Eu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __69__HMDCHIPDataSource_hasValidGeoOrPreferredNetworkForHome_completion___block_invoke_154(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    BOOL v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Done fetching.", (uint8_t *)&v8, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (int64_t)checkPresenceForHome:(id)a3
{
  return [a3 homeLocation];
}

- (void)unregisterPresenceNotificationsForHome:(id)a3
{
  id v12 = a3;
  os_unfair_lock_lock_with_options();
  int v4 = [(HMDCHIPDataSource *)self activeThreadHome];
  id v5 = [v4 uuid];
  id v6 = [v12 uuid];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    [(HMDCHIPDataSource *)self unregisterForLeaveNotifications:v12];
    [(HMDCHIPDataSource *)self setActiveThreadHome:0];
  }
  int v8 = [(HMDCHIPDataSource *)self pendingThreadHome];
  id v9 = [v8 uuid];
  uint64_t v10 = [v12 uuid];
  int v11 = [v9 isEqual:v10];

  if (v11)
  {
    [(HMDCHIPDataSource *)self unregisterForArrivalNotifications:v12];
    [(HMDCHIPDataSource *)self setPendingThreadHome:0];
  }
  os_unfair_lock_unlock(&self->_geo_lock);
}

- (void)unregisterForArrivalNotifications:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    int v11 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Unregistering arrival notifications.", (uint8_t *)&v10, 0xCu);
  }
  id v9 = [(HMDCHIPDataSource *)v6 notificationCenter];
  [v9 removeObserver:v6 name:@"HMDHomeDidArriveHomeNotificationKey" object:v4];
}

- (void)registerForArrivalNotifications:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(HMDCHIPDataSource *)self unprotectedRegisterForArrivalNotifications:v4];
  os_unfair_lock_unlock(&self->_geo_lock);
}

- (void)unprotectedRegisterForArrivalNotifications:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCHIPDataSource *)self pendingThreadHome];
  id v6 = [v5 uuid];
  int v7 = [v4 uuid];
  char v8 = [v6 isEqual:v7];

  if (v4 && (v8 & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    int v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v16 = 138543362;
      __int16 v17 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Registering for arrival notifications.", (uint8_t *)&v16, 0xCu);
    }
    int v13 = [(HMDCHIPDataSource *)v10 pendingThreadHome];

    if (v13)
    {
      uint64_t v14 = [(HMDCHIPDataSource *)v10 pendingThreadHome];
      [(HMDCHIPDataSource *)v10 unregisterForArrivalNotifications:v14];
    }
    int v15 = [(HMDCHIPDataSource *)v10 notificationCenter];
    [v15 addObserver:v10 selector:sel_handleHomeDidArriveHomeNotification_ name:@"HMDHomeDidArriveHomeNotificationKey" object:v4];

    [(HMDCHIPDataSource *)v10 setPendingThreadHome:v4];
  }
}

- (void)unregisterForLeaveNotifications:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    char v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    int v11 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Unregistering leave notifications.", (uint8_t *)&v10, 0xCu);
  }
  id v9 = [(HMDCHIPDataSource *)v6 notificationCenter];
  [v9 removeObserver:v6 name:@"HMDHomeDidLeaveHomeNotificationKey" object:v4];
}

- (void)registerForLeaveNotifications:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(HMDCHIPDataSource *)self unprotectedRegisterForLeaveNotifications:v4];
  os_unfair_lock_unlock(&self->_geo_lock);
}

- (void)unprotectedRegisterForLeaveNotifications:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCHIPDataSource *)self activeThreadHome];
  id v6 = [v5 uuid];
  int v7 = [v4 uuid];
  char v8 = [v6 isEqual:v7];

  if (v4 && (v8 & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    int v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v16 = 138543362;
      __int16 v17 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Registering for leave notifications.", (uint8_t *)&v16, 0xCu);
    }
    int v13 = [(HMDCHIPDataSource *)v10 activeThreadHome];

    if (v13)
    {
      uint64_t v14 = [(HMDCHIPDataSource *)v10 activeThreadHome];
      [(HMDCHIPDataSource *)v10 unregisterForLeaveNotifications:v14];
    }
    int v15 = [(HMDCHIPDataSource *)v10 notificationCenter];
    [v15 addObserver:v10 selector:sel_handleHomeDidLeaveHomeNotification_ name:@"HMDHomeDidLeaveHomeNotificationKey" object:v4];

    [(HMDCHIPDataSource *)v10 setActiveThreadHome:v4];
  }
}

- (void)handleHomeDidArriveHomeNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  id v5 = [(HMDCHIPDataSource *)self pendingThreadHome];
  [(HMDCHIPDataSource *)self setPendingThreadHome:0];
  [(HMDCHIPDataSource *)self unregisterForArrivalNotifications:v5];
  [(HMDCHIPDataSource *)self unprotectedRegisterForLeaveNotifications:v5];
  os_unfair_lock_unlock(&self->_geo_lock);
  uint64_t v6 = [(HMDCHIPDataSource *)self startThreadOnWakeEnabled];
  if (v6) {
    uint64_t v6 = [(HMDCHIPDataSource *)self _stopNetworkListenerForUserPreferredNetwork];
  }
  int v7 = (void *)MEMORY[0x230FBD990](v6);
  char v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    int v11 = [v5 fabric];
    uint64_t v12 = [v11 fabricID];
    int v13 = 138543618;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    int v16 = v12;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@User arrived home, starting thread network for fabric ID: %@", (uint8_t *)&v13, 0x16u);
  }
  [v5 startThreadNetwork:1];
}

- (void)handleHomeDidLeaveHomeNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  id v5 = [(HMDCHIPDataSource *)self activeThreadHome];
  [(HMDCHIPDataSource *)self setActiveThreadHome:0];
  [(HMDCHIPDataSource *)self unregisterForLeaveNotifications:v5];
  [(HMDCHIPDataSource *)self unprotectedRegisterForArrivalNotifications:v5];
  os_unfair_lock_unlock(&self->_geo_lock);
  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  int v7 = self;
  char v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v10 = [v5 fabric];
    int v11 = [v10 fabricID];
    int v12 = 138543618;
    int v13 = v9;
    __int16 v14 = 2112;
    __int16 v15 = v11;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@User left home, stopping thread network for fabric ID: %@", (uint8_t *)&v12, 0x16u);
  }
  [v5 stopThreadNetwork:1];
  if ([(HMDCHIPDataSource *)v7 startThreadOnWakeEnabled]) {
    [(HMDCHIPDataSource *)v7 _startNetworkListenerForUserPreferredNetwork:1];
  }
}

- (void)handleLocationAuthorizationChangedNotification:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = objc_msgSend(v5, "hmf_numberForKey:", @"HMDLocationAuthorizationKey");

  if (v6)
  {
    uint64_t v7 = [v6 integerValue];
    if ([(HMDCHIPDataSource *)self locationAuthorization] != v7)
    {
      char v8 = (void *)MEMORY[0x230FBD990]([(HMDCHIPDataSource *)self setLocationAuthorization:v7]);
      id v9 = self;
      int v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = HMFGetLogIdentifier();
        int v12 = HMDLocationAuthorizationAsString();
        int v19 = 138543618;
        id v20 = v11;
        __int16 v21 = 2112;
        id v22 = v12;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Location Authorization is changing to %@, stopping thread network", (uint8_t *)&v19, 0x16u);
      }
      int v13 = [(HMDCHIPDataSource *)v9 activeThreadHome];

      if (v13)
      {
        __int16 v14 = [(HMDCHIPDataSource *)v9 activeThreadHome];
        [v14 stopThreadNetwork:1];

        [(HMDCHIPDataSource *)v9 setActiveThreadHome:0];
      }
    }
  }
  else
  {
    __int16 v15 = (void *)MEMORY[0x230FBD990]();
    uint64_t v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v19 = 138543362;
      id v20 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@No location authorization key in the message", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)browser:(id)a3 didRemoveAccessoryPairingWithNodeID:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v36 = a3;
  id v6 = a4;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v35 = self;
  uint64_t v7 = [(HMDCHIPDataSource *)self homeManager];
  char v8 = [v7 homes];

  uint64_t v31 = [v8 countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (v31)
  {
    uint64_t v9 = *(void *)v44;
    long long v34 = v8;
    uint64_t v30 = *(void *)v44;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v8);
        }
        int v11 = *(void **)(*((void *)&v43 + 1) + 8 * v10);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        uint64_t v32 = v10;
        long long v33 = v11;
        int v12 = [v11 hapAccessories];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v53 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v40;
          while (2)
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v40 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              uint64_t v18 = [v17 matterNodeID];
              if ([v18 isEqual:&unk_26E471E48])
              {
              }
              else
              {
                int v19 = [v17 matterNodeID];
                int v20 = [v19 isEqualToNumber:v6];

                if (v20)
                {
                  __int16 v25 = (void *)MEMORY[0x230FBD990]();
                  id v26 = v35;
                  uint64_t v27 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                  {
                    id v28 = HMFGetLogIdentifier();
                    __int16 v29 = [v17 shortDescription];
                    *(_DWORD *)long long buf = 138543874;
                    id v48 = v28;
                    __int16 v49 = 2112;
                    id v50 = v6;
                    __int16 v51 = 2112;
                    id v52 = v29;
                    _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Found accessory to remove from Apple Home with Matter node ID %@: %@", buf, 0x20u);
                  }
                  v37[0] = MEMORY[0x263EF8330];
                  v37[1] = 3221225472;
                  v37[2] = __65__HMDCHIPDataSource_browser_didRemoveAccessoryPairingWithNodeID___block_invoke;
                  v37[3] = &unk_264A2F370;
                  v37[4] = v26;
                  id v38 = v6;
                  [v33 handleRemoveAccessory:v17 completion:v37];

                  goto LABEL_24;
                }
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v39 objects:v53 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        uint64_t v10 = v32 + 1;
        char v8 = v34;
        uint64_t v9 = v30;
      }
      while (v32 + 1 != v31);
      uint64_t v31 = [v34 countByEnumeratingWithState:&v43 objects:v54 count:16];
    }
    while (v31);
  }

  __int16 v21 = (void *)MEMORY[0x230FBD990]();
  id v22 = v35;
  uint64_t v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    uint64_t v24 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    id v48 = v24;
    __int16 v49 = 2112;
    id v50 = v6;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@No accessory found in any homes with matter node id %@", buf, 0x16u);
  }
LABEL_24:
}

void __65__HMDCHIPDataSource_browser_didRemoveAccessoryPairingWithNodeID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  uint64_t v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      char v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v15 = 138543874;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v3;
      uint64_t v10 = "%{public}@Failed to remove accessory from Apple Home with Matter node ID %@: %@";
      int v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v11, v12, v10, (uint8_t *)&v15, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    char v8 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 40);
    int v15 = 138543618;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    uint64_t v10 = "%{public}@Successfully removed accessory from Apple Home with Matter node ID: %@";
    int v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
    goto LABEL_6;
  }
}

- (void)requestUserPermissionForBridgeAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__HMDCHIPDataSource_requestUserPermissionForBridgeAccessory_withContext_queue_completionHandler___block_invoke;
  block[3] = &unk_264A2DDC0;
  id v21 = v12;
  id v22 = v13;
  block[4] = self;
  id v19 = v10;
  id v20 = v11;
  uint64_t v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v13;
  dispatch_async(v14, block);
}

void __97__HMDCHIPDataSource_requestUserPermissionForBridgeAccessory_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) dialogPresenter];
  int v3 = [v2 shouldSkipAuthPromptDialog];

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      char v8 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      id v17 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Defaults write set - skipping auth prompt for bridge accessory", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    if (v7)
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      id v17 = v9;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Presenting user with auth prompt for bridge accessory", buf, 0xCu);
    }
    id v10 = [*(id *)(a1 + 32) dialogPresenter];
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __97__HMDCHIPDataSource_requestUserPermissionForBridgeAccessory_withContext_queue_completionHandler___block_invoke_148;
    v14[3] = &unk_264A29300;
    uint64_t v13 = *(void *)(a1 + 56);
    id v15 = *(id *)(a1 + 64);
    [v10 requestUserPermissionForBridgeAccessory:v11 withContext:v12 queue:v13 completionHandler:v14];
  }
}

uint64_t __97__HMDCHIPDataSource_requestUserPermissionForBridgeAccessory_withContext_queue_completionHandler___block_invoke_148(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestUserPermissionForUnauthenticatedAccessory:(id)a3 withContext:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __106__HMDCHIPDataSource_requestUserPermissionForUnauthenticatedAccessory_withContext_queue_completionHandler___block_invoke;
  block[3] = &unk_264A2DDC0;
  id v21 = v12;
  id v22 = v13;
  block[4] = self;
  id v19 = v10;
  id v20 = v11;
  uint64_t v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v13;
  dispatch_async(v14, block);
}

void __106__HMDCHIPDataSource_requestUserPermissionForUnauthenticatedAccessory_withContext_queue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) dialogPresenter];
  int v3 = [v2 shouldSkipAuthPromptDialog];

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      char v8 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      id v17 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Defaults write set - skipping auth prompt for unauthenticated accessory", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    if (v7)
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      id v17 = v9;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Presenting user with auth prompt for unauthenticated accessory", buf, 0xCu);
    }
    id v10 = [*(id *)(a1 + 32) dialogPresenter];
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __106__HMDCHIPDataSource_requestUserPermissionForUnauthenticatedAccessory_withContext_queue_completionHandler___block_invoke_146;
    v14[3] = &unk_264A29300;
    uint64_t v13 = *(void *)(a1 + 56);
    id v15 = *(id *)(a1 + 64);
    [v10 requestUserPermissionForUnauthenticatedAccessory:v11 withContext:v12 queue:v13 completionHandler:v14];
  }
}

uint64_t __106__HMDCHIPDataSource_requestUserPermissionForUnauthenticatedAccessory_withContext_queue_completionHandler___block_invoke_146(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)timerDidFire:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCHIPDataSource *)self vendorMetadataRefreshTimer];

  if (v5 == v4)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    BOOL v7 = self;
    char v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v17 = 138543362;
      uint64_t v18 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Vendor metadata refresh timer fired; fetching vendor metadata from cloud",
        (uint8_t *)&v17,
        0xCu);
    }
    id v10 = [(HMDCHIPDataSource *)v7 vendorMetadataStore];
    [v10 fetchCloudMetadata];
  }
  id v11 = [(HMDCHIPDataSource *)self attestationDataRefreshTimer];

  if (v11 == v4)
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      int v17 = 138543362;
      uint64_t v18 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Attestation data refresh timer fired; fetching attestation data from cloud",
        (uint8_t *)&v17,
        0xCu);
    }
    id v16 = [(HMDCHIPDataSource *)v13 attestationDataStore];
    [v16 fetchCloudAttestationData];
  }
}

- (void)forAllPairedMatterServersFetchVidPid:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *, void *))a3;
  id v5 = [(HMDCHIPDataSource *)self homeManager];
  id v6 = v5;
  if (v5)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v23 = v5;
    obuint64_t j = [v5 homes];
    uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v11 = [v10 matterAccessories];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v27 != v14) {
                  objc_enumerationMutation(v11);
                }
                id v16 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                int v17 = [v16 matterVendorID];
                uint64_t v18 = [v16 matterProductID];
                v4[2](v4, v17, v18);
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v13);
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v8);
    }

    id v6 = v23;
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      long long v37 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Home manager reference is nil", buf, 0xCu);
    }
  }
}

- (void)forAllStorageDataSourcesDo:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = (uint64_t (**)(id, HMDCHIPHomeDataSource *))a3;
  id v5 = [(HMDCHIPDataSource *)self homeManager];
  id v6 = v5;
  if (v5)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v21 = v5;
    uint64_t v7 = [v5 homes];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v13 = [v12 matterFabricID];
          uint64_t v14 = v13;
          if (v13)
          {
            if (([v13 isEqualToNumber:&unk_26E471E48] & 1) == 0)
            {
              id v15 = [[HMDCHIPHomeDataSource alloc] initWithFabricID:v14 home:v12];
              char v16 = v4[2](v4, v15);

              if ((v16 & 1) == 0)
              {

                goto LABEL_17;
              }
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_17:

    id v6 = v21;
  }
  else
  {
    int v17 = (void *)MEMORY[0x230FBD990]();
    uint64_t v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      long long v28 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@forAllStorageDataSourcesDo: Home manager reference is nil", buf, 0xCu);
    }
  }
}

- (id)storageDataSourceForFabricWithID:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCHIPDataSource *)self homeManager];
  id v6 = v5;
  if (v5)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v7 = objc_msgSend(v5, "homes", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v13 = [v12 matterFabricID];
          if ([v13 isEqualToNumber:v4])
          {
            long long v22 = [[HMDCHIPHomeDataSource alloc] initWithFabricID:v4 home:v12];

            goto LABEL_17;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = self;
    char v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v29 = v17;
      __int16 v30 = 2112;
      id v31 = v4;
      uint64_t v18 = "%{public}@Could not find home with CHIP fabric ID: %@";
      uint64_t v19 = v16;
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
      uint32_t v21 = 22;
LABEL_15:
      _os_log_impl(&dword_22F52A000, v19, v20, v18, buf, v21);
    }
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = self;
    char v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      uint64_t v29 = v17;
      uint64_t v18 = "%{public}@Home manager reference is nil";
      uint64_t v19 = v16;
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
      uint32_t v21 = 12;
      goto LABEL_15;
    }
  }

  long long v22 = 0;
LABEL_17:

  return v22;
}

- (id)appleHomeTargetFabricUUIDWithID:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCHIPDataSource *)self homeManager];
  id v6 = v5;
  if (!v5)
  {
    uint64_t v19 = (void *)MEMORY[0x230FBD990]();
    os_log_type_t v20 = self;
    uint32_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      long long v22 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      long long v32 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Home manager reference is nil", buf, 0xCu);
    }
    goto LABEL_15;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v7 = objc_msgSend(v5, "homes", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v8) {
    goto LABEL_11;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v27;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v27 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      uint64_t v13 = [v12 fabric];
      uint64_t v14 = [v13 fabricID];
      int v15 = [v14 isEqual:v4];

      if (v15)
      {
        long long v24 = [v12 fabric];
        long long v23 = [v24 targetFabricUUID];

LABEL_18:
        goto LABEL_19;
      }
      char v16 = [v12 chipStorage];
      int v17 = [v16 fabricID];
      int v18 = [v17 isEqual:v4];

      if (v18)
      {
        long long v23 = [v12 altTargetFabricUUID];
        goto LABEL_18;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v9) {
      continue;
    }
    break;
  }
LABEL_11:

LABEL_15:
  long long v23 = 0;
LABEL_19:

  return v23;
}

- (id)appleHomeFabricWithUUID:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCHIPDataSource *)self homeManager];
  id v6 = v5;
  if (v5)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = objc_msgSend(v5, "homes", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v13 = [v12 uuid];
          char v14 = [v13 isEqual:v4];

          if (v14)
          {
            int v15 = [v12 fabric];

            goto LABEL_16;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    char v16 = (void *)MEMORY[0x230FBD990]();
    int v17 = self;
    int v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      long long v27 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Home manager reference is nil", buf, 0xCu);
    }
  }
  int v15 = 0;
LABEL_16:

  return v15;
}

- (id)appleHomeFabricWithID:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCHIPDataSource *)self homeManager];
  id v6 = v5;
  if (v5)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v7 = objc_msgSend(v5, "homes", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v13 = [v12 fabric];
          char v14 = [v13 fabricID];
          char v15 = [v14 isEqualToNumber:v4];

          if (v15)
          {
            char v16 = [v12 fabric];

            goto LABEL_16;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    int v17 = (void *)MEMORY[0x230FBD990]();
    int v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      uint64_t v28 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Home manager reference is nil", buf, 0xCu);
    }
  }
  char v16 = 0;
LABEL_16:

  return v16;
}

- (NSNumber)currentFabricID
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v3 = [(HMDCHIPDataSource *)self homeManager];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 homes];
    id v6 = objc_msgSend(v5, "na_filter:", &__block_literal_global_135_144218);

    uint64_t v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_137];
    uint64_t v8 = [v7 firstObject];
    uint64_t v9 = [v8 matterFabricID];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      char v16 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Home manager reference is nil", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v9 = 0;
  }

  return (NSNumber *)v9;
}

uint64_t __36__HMDCHIPDataSource_currentFabricID__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 reachableAccessoriesCount];
  if (v6 == [v5 reachableAccessoriesCount])
  {
    uint64_t v7 = [v4 uuid];
    uint64_t v8 = [v7 UUIDString];
    uint64_t v9 = [v5 uuid];
    uint64_t v10 = [v9 UUIDString];
    uint64_t v11 = [v8 compare:v10];
  }
  else
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "reachableAccessoriesCount"));
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "reachableAccessoriesCount"));
    uint64_t v11 = [v7 compare:v8];
  }

  return v11;
}

uint64_t __36__HMDCHIPDataSource_currentFabricID__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCurrentDeviceConfirmedPrimaryResident];
}

- (NSSet)allTargetFabricUUIDs
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v3 = [(HMDCHIPDataSource *)self homeManager];
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = [v3 homes];
    uint64_t v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_133_144222);
    uint64_t v8 = [v5 setWithArray:v7];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v14 = 138543362;
      int v15 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Home manager reference is nil", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v8 = [MEMORY[0x263EFFA08] set];
  }

  return (NSSet *)v8;
}

id __41__HMDCHIPDataSource_allTargetFabricUUIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [v2 fabric];
  id v4 = [v3 targetFabricUUID];

  if (v4)
  {
    id v5 = [v2 fabric];

    uint64_t v6 = [v5 targetFabricUUID];
    id v2 = v5;
  }
  else
  {
    uint64_t v6 = [v2 altTargetFabricUUID];
  }

  return v6;
}

- (NSSet)allFabricIDs
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v3 = [(HMDCHIPDataSource *)self homeManager];
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = [v3 homes];
    uint64_t v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_130);
    uint64_t v8 = [v5 setWithArray:v7];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v14 = 138543362;
      int v15 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Home manager reference is nil", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v8 = [MEMORY[0x263EFFA08] set];
  }

  return (NSSet *)v8;
}

uint64_t __33__HMDCHIPDataSource_allFabricIDs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 matterFabricID];
}

- (NSSet)allPairedHAPServerIdentifiers
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  int v3 = [(HMDCHIPDataSource *)self homeManager];
  if (v3)
  {
    id v4 = [MEMORY[0x263EFF9C0] set];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v23 = v3;
    id v5 = [v3 homes];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v11 = [v10 hapAccessories];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v25;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v25 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = [*(id *)(*((void *)&v24 + 1) + 8 * j) identifier];
                [v4 addObject:v16];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v13);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v7);
    }

    uint64_t v17 = (void *)[v4 copy];
    int v3 = v23;
  }
  else
  {
    int v18 = (void *)MEMORY[0x230FBD990]();
    uint64_t v19 = self;
    os_log_type_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      long long v21 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      long long v35 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Home manager reference is nil", buf, 0xCu);
    }
    uint64_t v17 = [MEMORY[0x263EFFA08] set];
  }

  return (NSSet *)v17;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  id v2 = [(HMDCHIPDataSource *)self home];
  char v3 = [v2 isCurrentDevicePrimaryResident];

  return v3;
}

- (void)handleHomeRemovedNotification:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v18 = 138543362;
    uint64_t v19 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling home removal by notifying CHIP storage", (uint8_t *)&v18, 0xCu);
  }
  uint64_t v9 = [v4 userInfo];
  uint64_t v10 = [v9 objectForKey:@"HMDHomeNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  uint64_t v13 = [v12 homeManager];
  uint64_t v14 = [v13 accessoryBrowser];
  int v15 = [v14 chipAccessoryServerBrowser];
  uint64_t v16 = [v12 fabric];

  [v15 handleHomeDeletionWithFabric:v16];
  uint64_t v17 = [(HMDCHIPDataSource *)v6 chipStorage];
  [v17 handleUpdatedDataWithIsLocalChange:0];
}

- (void)handleAccessoryCHIPStorageChangedNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = objc_msgSend(v5, "hmf_numberForKey:", @"HMDAccessoryCHIPStorageIsLocalChangeNotificationKey");

  if (v6)
  {
    uint64_t v7 = [v6 BOOLValue];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      id v12 = HMFBooleanToString();
      int v13 = 138543874;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = @"HMDAccessoryCHIPStorageIsLocalChangeNotificationKey";
      __int16 v17 = 2112;
      int v18 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Did not find %@ in notification userInfo. Defaulting isLocalChange to %@", (uint8_t *)&v13, 0x20u);
    }
    uint64_t v7 = 1;
  }
  [(HMDCHIPDataSource *)self handleUpdatedDataWithIsLocalChange:v7];
}

- (void)handleHomeCHIPStorageChangedNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = objc_msgSend(v5, "hmf_numberForKey:", @"HMDHomeCHIPStorageIsLocalChangeNotificationKey");

  if (v6)
  {
    uint64_t v7 = [v6 BOOLValue];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      id v12 = HMFBooleanToString();
      int v13 = 138543874;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = @"HMDHomeCHIPStorageIsLocalChangeNotificationKey";
      __int16 v17 = 2112;
      int v18 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Did not find %@ in notification userInfo. Defaulting isLocalChange to %@", (uint8_t *)&v13, 0x20u);
    }
    uint64_t v7 = 1;
  }
  [(HMDCHIPDataSource *)self handleUpdatedDataWithIsLocalChange:v7];
}

- (void)updateNotificationsEnabled:(BOOL)a3 forHome:(id)a4 keepAliveOnly:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v9 = [v8 fabric];
  uint64_t v10 = [v9 fabricID];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    id v12 = [v8 fabric];
    int v13 = [v12 fabricID];
    char v14 = [v13 isEqualToNumber:&unk_26E471E48];

    if ((v14 & 1) == 0)
    {
      __int16 v15 = [(HMDCHIPDataSource *)self chipResidentStateManager];
      uint64_t v16 = [v8 fabric];
      [v15 handleUpdateNotificationsEnabled:v6 forFabric:v16 keepAliveOnly:v5];

      goto LABEL_8;
    }
  }
  else
  {
  }
  __int16 v17 = (void *)MEMORY[0x230FBD990]();
  int v18 = self;
  uint64_t v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = HMFGetLogIdentifier();
    long long v21 = [v8 fabric];
    long long v22 = [v21 fabricID];
    int v23 = 138543618;
    long long v24 = v20;
    __int16 v25 = 2112;
    long long v26 = v22;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Skipping notifications as fabricID is %@", (uint8_t *)&v23, 0x16u);
  }
LABEL_8:
}

- (void)handleResidentReachabilityNotification:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 userInfo];
  BOOL v6 = [v5 objectForKeyedSubscript:@"HMDResidentDeviceManagerHomeUUIDNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [(HMDCHIPDataSource *)self homeManager];
  uint64_t v10 = [v9 _homeWithUUID:v8];

  uint64_t v11 = [v10 fabric];
  id v12 = (void *)MEMORY[0x230FBD990]();
  int v13 = self;
  char v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    __int16 v15 = HMFGetLogIdentifier();
    int v17 = 138543874;
    int v18 = v15;
    __int16 v19 = 2112;
    uint64_t v20 = v10;
    __int16 v21 = 2112;
    long long v22 = v11;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Notifying HomeKitMatter of resident reachability change for Home %@ with fabricID %@", (uint8_t *)&v17, 0x20u);
  }
  uint64_t v16 = [(HMDCHIPDataSource *)v13 chipResidentStateManager];
  [v16 handleResidentReachabilityChangeForFabric:v11];
}

- (void)handleDataReadyAfterBecomingPrimaryNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x230FBD990]();
  BOOL v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    uint64_t v11 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Notifying HomeKitMatter of primary resident data ready", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v9 = [(HMDCHIPDataSource *)v6 chipStorage];
  [v9 handlePrimaryResidentDataReady];
}

- (void)handlePrimaryResidentUpdatedNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x230FBD990]();
  BOOL v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v11 = 138543362;
    uint64_t v12 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Notifying CHIP data sources of updated resident state", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v9 = [(HMDCHIPDataSource *)v6 chipResidentStateManager];
  [v9 handleResidentStateUpdated];

  int v10 = [(HMDCHIPDataSource *)v6 chipStorage];
  [v10 handleUpdatedCurrentFabricIndex];
}

- (id)getSharedThreadResidentCommissioner
{
  return +[HMDThreadResidentCommissioner sharedCommissioner];
}

- (id)getDefaultThreadNetworkMetadataStore
{
  return +[HMDThreadNetworkMetadataStore defaultStore];
}

- (void)handleUpdatedDataWithIsLocalChange:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x230FBD990](self, a2, a3);
  BOOL v5 = self;
  BOOL v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v10 = 138543362;
    int v11 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying CHIP storage of updated home CHIP storage with both isLocalChange: NO and isLocalChange: YES", (uint8_t *)&v10, 0xCu);
  }
  id v8 = [(HMDCHIPDataSource *)v5 chipStorage];
  [v8 handleUpdatedDataWithIsLocalChange:0];

  uint64_t v9 = [(HMDCHIPDataSource *)v5 chipStorage];
  [v9 handleUpdatedDataWithIsLocalChange:1];
}

- (id)homeWithCHIPFabric:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HMDCHIPDataSource *)self homeManager];
  BOOL v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [v5 homes];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __40__HMDCHIPDataSource_homeWithCHIPFabric___block_invoke;
    v14[3] = &unk_264A2B2D0;
    id v15 = v4;
    id v8 = objc_msgSend(v7, "na_firstObjectPassingTest:", v14);
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    int v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      int v17 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Home manager or fabric reference is nil", buf, 0xCu);
    }
    id v8 = 0;
  }

  return v8;
}

BOOL __40__HMDCHIPDataSource_homeWithCHIPFabric___block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 fabric];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)home
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  char v3 = [(HMDCHIPDataSource *)self homeManager];
  BOOL v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 homes];
    BOOL v6 = objc_msgSend(v5, "na_filter:", &__block_literal_global_115_144242);

    uint64_t v7 = objc_msgSend(v6, "na_firstObjectPassingTest:", &__block_literal_global_117_144243);
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __25__HMDCHIPDataSource_home__block_invoke_3;
      v27[3] = &unk_264A2B2D0;
      id v14 = v4;
      id v28 = v14;
      id v15 = objc_msgSend(v6, "na_firstObjectPassingTest:", v27);
      uint64_t v16 = v15;
      if (v15)
      {
        id v9 = v15;
      }
      else
      {
        uint64_t v22 = MEMORY[0x263EF8330];
        uint64_t v23 = 3221225472;
        long long v24 = __25__HMDCHIPDataSource_home__block_invoke_4;
        __int16 v25 = &unk_264A2B2D0;
        id v26 = v14;
        int v17 = objc_msgSend(v6, "na_firstObjectPassingTest:", &v22);
        uint64_t v18 = v17;
        if (v17)
        {
          id v9 = v17;
        }
        else
        {
          __int16 v19 = objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_120_144244, v22, v23, v24, v25);
          id v9 = [v19 firstObject];

          if (v9) {
            id v20 = v9;
          }
        }
      }
    }
  }
  else
  {
    int v10 = (void *)MEMORY[0x230FBD990]();
    int v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      long long v30 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Home manager reference is nil", buf, 0xCu);
    }
    id v9 = 0;
  }

  return v9;
}

uint64_t __25__HMDCHIPDataSource_home__block_invoke_3(uint64_t a1, void *a2)
{
  char v3 = [a2 uuid];
  BOOL v4 = [*(id *)(a1 + 32) currentHomeUUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __25__HMDCHIPDataSource_home__block_invoke_4(uint64_t a1, void *a2)
{
  char v3 = [a2 uuid];
  BOOL v4 = [*(id *)(a1 + 32) primaryHomeUUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __25__HMDCHIPDataSource_home__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 uuid];
  BOOL v6 = [v5 UUIDString];
  uint64_t v7 = [v4 uuid];

  id v8 = [v7 UUIDString];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

BOOL __25__HMDCHIPDataSource_home__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 chipStorage];
  char v3 = [v2 keyValueStore];
  BOOL v4 = v3 != 0;

  return v4;
}

uint64_t __25__HMDCHIPDataSource_home__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isOwnerUser];
}

- (void)configureWithUIDialogPresenter:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  uint64_t v5 = v4;
  BOOL v6 = [(HMDCHIPDataSource *)self uiDialogPresenter];

  if (v6) {
    goto LABEL_7;
  }
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    int v12 = 138543618;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Configuring with UI dialog presenter: %@", (uint8_t *)&v12, 0x16u);
  }
  [(HMDCHIPDataSource *)v8 setUiDialogPresenter:v5];
  int v11 = [(HMDCHIPDataSource *)v8 uiDialogPresenter];
  [v11 setDialogDelegate:v8];
}

- (void)configureWithAttestationDataStore:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  uint64_t v5 = v4;
  BOOL v6 = [(HMDCHIPDataSource *)self attestationDataStore];

  if (v6) {
    goto LABEL_7;
  }
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    int v14 = 138543618;
    id v15 = v10;
    __int16 v16 = 2112;
    int v17 = v5;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Configuring with attestation data store: %@", (uint8_t *)&v14, 0x16u);
  }
  [(HMDCHIPDataSource *)v8 setAttestationDataStore:v5];
  int v11 = [(HMDCHIPDataSource *)v8 attestationDataStore];
  [v11 fetchCloudAttestationData];

  int v12 = [(HMDCHIPDataSource *)v8 attestationDataRefreshTimer];
  [v12 setDelegate:v8];

  uint64_t v13 = [(HMDCHIPDataSource *)v8 attestationDataRefreshTimer];
  [v13 resume];
}

- (void)configureWithVendorMetadataStore:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  uint64_t v5 = v4;
  BOOL v6 = [(HMDCHIPDataSource *)self vendorMetadataStore];

  if (v6) {
    goto LABEL_7;
  }
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    int v15 = 138543618;
    __int16 v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Configuring with vendor metadata store: %@", (uint8_t *)&v15, 0x16u);
  }
  [(HMDCHIPDataSource *)v8 setVendorMetadataStore:v5];
  int v11 = [(HMDCHIPDataSource *)v8 vendorMetadataStore];
  [v11 setDelegate:v8];

  int v12 = [(HMDCHIPDataSource *)v8 vendorMetadataStore];
  [v12 fetchCloudMetadata];

  uint64_t v13 = [(HMDCHIPDataSource *)v8 vendorMetadataRefreshTimer];
  [v13 setDelegate:v8];

  int v14 = [(HMDCHIPDataSource *)v8 vendorMetadataRefreshTimer];
  [v14 resume];
}

- (void)configureWithStorage:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  uint64_t v5 = v4;
  BOOL v6 = [(HMDCHIPDataSource *)self chipStorage];

  if (v6) {
    goto LABEL_7;
  }
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    int v17 = 138543618;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Configuring with storage: %@", (uint8_t *)&v17, 0x16u);
  }
  [(HMDCHIPDataSource *)v8 setChipStorage:v5];
  int v11 = [(HMDCHIPDataSource *)v8 chipStorage];
  [v11 setDataSource:v8];

  int v12 = [(HMDCHIPDataSource *)v8 notificationCenter];
  [v12 addObserver:v8 selector:sel_handleHomeCHIPStorageChangedNotification_ name:@"HMDHomeCHIPStorageUpdatedNotification" object:0];

  uint64_t v13 = [(HMDCHIPDataSource *)v8 notificationCenter];
  [v13 addObserver:v8 selector:sel_handleAccessoryCHIPStorageChangedNotification_ name:@"HMDAccessoryCHIPStorageUpdatedNotification" object:0];

  int v14 = [(HMDCHIPDataSource *)v8 notificationCenter];
  int v15 = [(HMDCHIPDataSource *)v8 homeManager];
  [v14 addObserver:v8 selector:sel_handleHomeRemovedNotification_ name:@"HMDHomeRemovedNotification" object:v15];

  __int16 v16 = [(HMDCHIPDataSource *)v8 notificationCenter];
  [v16 addObserver:v8 selector:sel_handleLocationAuthorizationChangedNotification_ name:@"HMDLocationAuthorizationChangedNotification" object:0];
}

- (void)configureWithThreadRadioManager:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  uint64_t v5 = v4;
  BOOL v6 = (void *)MEMORY[0x230FBD990]();
  uint64_t v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v17 = 138543618;
    uint64_t v18 = v9;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Configuring with thread radio manager: %@", (uint8_t *)&v17, 0x16u);
  }
  [(HMDCHIPDataSource *)v7 setMatterThreadRadioManager:v5];
  [v5 setDelegate:v7];
  int v10 = [(HMDCHIPDataSource *)v7 notificationCenter];
  [v10 addObserver:v7 selector:sel_handleThreadNetworkStateChangedNotification_ name:@"HMDHomeThreadNetworkConnectionStateChangeNotification" object:0];

  int v11 = [(HMDCHIPDataSource *)v7 notificationCenter];
  [v11 addObserver:v7 selector:sel_handleThreadNetworkStateChangedNotification_ name:@"HMDHomeThreadNetworkNodeTypeChangeNotification" object:0];

  int v12 = [(HMDCHIPDataSource *)v7 notificationCenter];
  [v12 addObserver:v7 selector:sel_handleThreadNetworkWakeOnConnectionStateChangedNotification_ name:@"HMDHomeThreadNetworkWakeOnConnectionStateChangeNotification" object:0];

  uint64_t v13 = [(HMDCHIPDataSource *)v7 notificationCenter];
  [v13 addObserver:v7 selector:sel_handleThreadNetworkPeripheralDeviceNodeTypeChangedNotification_ name:@"HMDHomeThreadNetworkPeripheralDeviceNodeTypeChangedNotification" object:0];

  int v14 = [(HMDCHIPDataSource *)v7 notificationCenter];
  [v14 addObserver:v7 selector:sel_handleCurrentWiFiNetworkChangedNotification_ name:*MEMORY[0x263F424E8] object:0];

  if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
  {
    int v15 = +[HMDDeviceCapabilities deviceCapabilities];
    int v16 = [v15 supportsThreadService];

    if (v16) {
      [v5 setDeviceSupportsThreadService:1];
    }
  }
}

- (void)configureWithResidentStateManager:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    _HMFPreconditionFailure();
LABEL_9:
    _HMFPreconditionFailure();
  }
  uint64_t v5 = v4;
  BOOL v6 = [(HMDCHIPDataSource *)self chipResidentStateManager];

  if (v6) {
    goto LABEL_9;
  }
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    int v17 = 138543618;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Configuring with resident state manager: %@", (uint8_t *)&v17, 0x16u);
  }
  [(HMDCHIPDataSource *)v8 setChipResidentStateManager:v5];
  int v11 = [(HMDCHIPDataSource *)v8 chipResidentStateManager];
  [v11 setDataSource:v8];

  int v12 = [(HMDCHIPDataSource *)v8 notificationCenter];
  [v12 addObserver:v8 selector:sel_handlePrimaryResidentUpdatedNotification_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:0];

  uint64_t v13 = [(HMDCHIPDataSource *)v8 notificationCenter];
  [v13 addObserver:v8 selector:sel_handlePrimaryResidentUpdatedNotification_ name:@"HMDResidentDeviceConfirmedStateChangedNotification" object:0];

  if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    int v14 = [(HMDCHIPDataSource *)v8 notificationCenter];
    [v14 addObserver:v8 selector:sel_handleResidentReachabilityNotification_ name:@"HMDResidentDeviceManagerUpdateResidentNotification" object:0];

    int v15 = [(HMDCHIPDataSource *)v8 notificationCenter];
    [v15 addObserver:v8 selector:sel_handleResidentReachabilityNotification_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:0];
  }
  int v16 = [(HMDCHIPDataSource *)v8 notificationCenter];
  [v16 addObserver:v8 selector:sel_handleDataReadyAfterBecomingPrimaryNotification_ name:@"HMDHomeDataReadyAfterBecomingPrimaryNotification" object:0];
}

- (void)configureWithAccessoryServerBrowser:(id)a3
{
  id v10 = a3;
  [v10 setAccessoryServerBrowserDelegate:self];
  id v4 = [v10 residentStateManager];
  [(HMDCHIPDataSource *)self configureWithResidentStateManager:v4];

  uint64_t v5 = [v10 threadRadioManager];
  [(HMDCHIPDataSource *)self configureWithThreadRadioManager:v5];

  [(HMDCHIPDataSource *)self setMatterAccessoryServerBrowser:v10];
  if (CFPreferencesGetAppBooleanValue(@"StartThreadOnWake", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
  {
    [(HMDCHIPDataSource *)self setStartThreadOnWakeEnabled:1];
  }
  BOOL v6 = [v10 storage];
  [(HMDCHIPDataSource *)self configureWithStorage:v6];

  uint64_t v7 = [v10 vendorMetadataStore];
  [(HMDCHIPDataSource *)self configureWithVendorMetadataStore:v7];

  id v8 = [v10 attestationDataStore];
  [(HMDCHIPDataSource *)self configureWithAttestationDataStore:v8];

  uint64_t v9 = [v10 uiDialogPresenter];
  [(HMDCHIPDataSource *)self configureWithUIDialogPresenter:v9];
}

- (HMDCHIPDataSource)initWithHomeManager:(id)a3 notificationCenter:(id)a4 vendorMetadataRefreshTimer:(id)a5 attestationDataRefreshTimer:(id)a6 dialogPresenter:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HMDCHIPDataSource;
  int v17 = [(HMDCHIPDataSource *)&v23 init];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_homeManager, v12);
    objc_storeStrong((id *)&v18->_notificationCenter, a4);
    objc_storeStrong((id *)&v18->_vendorMetadataRefreshTimer, a5);
    objc_storeStrong((id *)&v18->_attestationDataRefreshTimer, a6);
    objc_storeStrong((id *)&v18->_dialogPresenter, a7);
    __int16 v19 = objc_alloc_init(HMDFileManager);
    fileManager = v18->_fileManager;
    v18->_fileManager = v19;

    v18->_pnExistsOnCurrentNetwork = 0;
    v18->_geo_lock._os_unfair_lock_opaque = 0;
    uint64_t v21 = +[HMDLocation sharedManager];
    v18->_locationAuthorization = [v21 locationAuthorized];

    v18->_pendingRadioStateChangeNotification = 0;
    v18->_threadNetworkShouldRestartOnNetworkChange = 0;
    v18->_startThreadOnWakeEnabled = 0;
    v18->_threadPairingOverride = 0;
    [(HMDCHIPDataSource *)v18 _getPreferredNetworkExistsWithCompletion:&__block_literal_global_144305];
  }

  return v18;
}

- (HMDCHIPDataSource)initWithHomeManager:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  BOOL v6 = [v4 defaultCenter];
  id v7 = objc_alloc(MEMORY[0x263F42658]);
  id v8 = (void *)[v7 initWithTimeInterval:4 options:*(double *)&vendorInfoFetchPeriod];
  id v9 = objc_alloc(MEMORY[0x263F42658]);
  id v10 = (void *)[v9 initWithTimeInterval:4 options:*(double *)&attestationInfoFetchPeriod];
  int v11 = +[HMDUIDialogPresenter sharedUIDialogPresenter];
  id v12 = [(HMDCHIPDataSource *)self initWithHomeManager:v5 notificationCenter:v6 vendorMetadataRefreshTimer:v8 attestationDataRefreshTimer:v10 dialogPresenter:v11];

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t29_144314 != -1) {
    dispatch_once(&logCategory__hmf_once_t29_144314, &__block_literal_global_142_144315);
  }
  id v2 = (void *)logCategory__hmf_once_v30_144316;
  return v2;
}

void __32__HMDCHIPDataSource_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v30_144316;
  logCategory__hmf_once_v30_144316 = v0;
}

@end