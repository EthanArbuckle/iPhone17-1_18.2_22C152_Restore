@interface HMDCameraProfileSettingsManager
+ (id)logCategory;
+ (id)zoneNameForHome:(id)a3;
- (BOOL)_evaluateHomePresence;
- (BOOL)_migrateNotificationSettings:(id)a3;
- (BOOL)_migrateSettingsModel:(id)a3;
- (BOOL)_setAnyUserAtHomeFromPresenceMonitorWithHome:(id)a3;
- (BOOL)canRevealCurrentAccessMode;
- (BOOL)isCameraManuallyDisabled;
- (BOOL)isCurrentDeviceConfirmedPrimaryResident;
- (BOOL)isRecordingEnabled;
- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4;
- (BOOL)needsInitialSettingsCharacteristicSynchronization;
- (BOOL)zoneManager:(id)a3 shouldRequestShareInvitationFromUser:(id)a4;
- (HMDBulletinBoard)bulletinBoard;
- (HMDCameraProfileSettingsDerivedPropertiesModel)derivedPropertiesModel;
- (HMDCameraProfileSettingsManager)initWithHAPAccessory:(id)a3 workQueue:(id)a4;
- (HMDCameraProfileSettingsManager)initWithUniqueIdentifier:(id)a3 hapAccessory:(id)a4 workQueue:(id)a5 zoneManager:(id)a6 notificationCenter:(id)a7 bulletinBoard:(id)a8 characteristicsAvailabilityListener:(id)a9 quotaCoordinator:(id)a10 featuresDataSource:(id)a11;
- (HMDCameraProfileSettingsModel)defaultSettingsModel;
- (HMDCameraProfileSettingsQuotaCoordinator)quotaCoordinator;
- (HMDCharacteristicsAvailabilityListener)characteristicsAvailabilityListener;
- (HMDDatabaseZoneManager)zoneManager;
- (HMDFeaturesDataSource)featuresDataSource;
- (HMDHAPAccessory)hapAccessory;
- (HMFMessageDispatcher)msgDispatcher;
- (NSNotificationCenter)notificationCenter;
- (NSNumber)isAnyUserAtHome;
- (NSString)clientIdentifier;
- (NSString)zoneName;
- (NSUUID)derivedPropertiesModelID;
- (NSUUID)uniqueIdentifier;
- (OS_dispatch_queue)workQueue;
- (_HMCameraUserSettings)currentSettings;
- (id)_createNotificationSettingsUsingSettingsModel:(id)a3;
- (id)_isAnyUserAtHomeForPresence:(id)a3;
- (id)_localZoneUpdateCompletionForMessage:(id)a3;
- (id)_payloadForSettings:(id)a3;
- (id)_processingOptionsForLabel:(id)a3;
- (id)_settingsFromSettingsModel:(id)a3;
- (id)_settingsModelForUpdate;
- (id)_updatedDerivedPropertiesModelWithSettingsModel:(id)a3 userInitiated:(BOOL)a4 didCreateModel:(BOOL *)a5;
- (id)currentNotificationSettings;
- (id)currentSettingsModel;
- (id)doorbellInputEventCharacteristic;
- (id)localZone:(id)a3 didProcessModelCreation:(id)a4;
- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4;
- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4;
- (id)logIdentifier;
- (id)manuallyDisabledCharacteristic;
- (id)messageDestination;
- (unint64_t)supportedFeatures;
- (void)_addAccessModeCharacteristicWriteRequestsToArray:(id)a3 currentAccessMode:(unint64_t)a4;
- (void)_addHomeKitCameraActiveCharacteristicWriteRequestToArray:(id)a3 currentAccessMode:(unint64_t)a4;
- (void)_addNightVisionCharacteristicWriteRequestToArray:(id)a3 nightVisionEnabled:(BOOL)a4;
- (void)_addOperatingModeIndicatorCharacteristicWriteRequestToArray:(id)a3 accessModeIndicatorEnabled:(BOOL)a4;
- (void)_addPeriodicSnapshotsActiveCharacteristicWriteRequestToArray:(id)a3 periodicSnapshotsAllowed:(BOOL)a4;
- (void)_addRecordingAudioEnabledWriteRequestToArray:(id)a3 recordingAudioEnabled:(BOOL)a4;
- (void)_addSnapshotsActiveCharacteristicWriteRequestToArray:(id)a3 snapshotsAllowed:(BOOL)a4;
- (void)_addWriteRequestToArray:(id)a3 forCharacteristicWithType:(id)a4 ofServiceWithType:(id)a5 value:(id)a6;
- (void)_coordinateNotificationSettingsWithServiceBulletinNotification:(id)a3;
- (void)_coordinateSmartBulletinNotificationWithServiceBulletinNotification:(id)a3;
- (void)_enablePackageNotificationsOnSettings:(id)a3;
- (void)_handleBulletinBoardNotificationCommitMessage:(id)a3;
- (void)_handleCharacteristicWriteRequests:(id)a3 completion:(id)a4;
- (void)_handleConnectedToAccessory;
- (void)_handleModelUpdate:(id)a3 previousModel:(id)a4;
- (void)_handleSynchronizeCloudStorageWithRecordingAccessModesMessage:(id)a3;
- (void)_handleUpdateAccessModeChangeNotificationEnabledMessage:(id)a3;
- (void)_handleUpdateAccessModeMessage:(id)a3;
- (void)_handleUpdateActivityZonesMessage:(id)a3;
- (void)_handleUpdateReachabilityEventNotificationEnabledMessage:(id)a3;
- (void)_handleUpdateRecordingTriggerEventsMessage:(id)a3;
- (void)_handleUpdatedDerivedProperties:(id)a3 previousProperties:(id)a4;
- (void)_handleUpdatedSettings:(id)a3 previousSettings:(id)a4;
- (void)_initializeNotificationSettingsUsingSettingsModel:(id)a3;
- (void)_notifyClientsOfChangedSettings:(id)a3 isInitialSettingsUpdate:(BOOL)a4;
- (void)_notifyClientsOfChangedSettingsModel:(id)a3 isInitialSettingsUpdate:(BOOL)a4;
- (void)_notifyClientsOfCurrentSettings;
- (void)_populateCurrentAccessModeFieldForDerivedProperties:(id)a3 currentSettings:(id)a4 userInitiated:(BOOL)a5 didUpdateField:(BOOL *)a6;
- (void)_setManuallyDisabledCharacteristicNotificationsEnabled:(BOOL)a3;
- (void)_synchronizeCurrentAccessModeSettingToCameraWithCompletion:(id)a3;
- (void)_synchronizeSettingsModelForBackwardCompatibilityForCharacteristic:(id)a3;
- (void)_updateDerivedPropertiesModelWithSettingsModel:(id)a3 userInitiated:(BOOL)a4 reason:(id)a5;
- (void)_updateDerivedPropertiesOnSettingsModel:(id)a3;
- (void)_updateNotificationSettings:(id)a3 forMessage:(id)a4;
- (void)_writeInitialSettingsCharacteristicsToCamera;
- (void)configureWithMessageDispatcher:(id)a3 adminMessageDispatcher:(id)a4 deviceIsResidentCapable:(BOOL)a5;
- (void)dealloc;
- (void)disableRecordingAccessModes;
- (void)handleAccessoryConfiguredNotification:(id)a3;
- (void)handleBulletinNotificationEnableStateDidChangeNotification:(id)a3;
- (void)handleCharacteristicsChangedNotification:(id)a3;
- (void)handleCharacteristicsValueUpdatedNotification:(id)a3;
- (void)handleHomePresenceEvaluatedNotification:(id)a3;
- (void)handlePrimaryResidentUpdatedNotification:(id)a3;
- (void)handleRecordingManagementServiceDidUpdateNotification:(id)a3;
- (void)handleUserRemoteAccessDidChangeNotification:(id)a3;
- (void)listener:(id)a3 didUpdateAvailableCharacteristics:(id)a4;
- (void)remove;
- (void)setAnyUserAtHome:(id)a3;
- (void)setHapAccessory:(id)a3;
- (void)setMsgDispatcher:(id)a3;
- (void)setNeedsInitialSettingsCharacteristicSynchronization:(BOOL)a3;
- (void)start;
- (void)synchronizeCloudStorageWithRecordingAccessModes;
- (void)synchronizeSettingsToCameraWithCompletion:(id)a3;
- (void)updateSettingsModelUsingBlock:(id)a3 completion:(id)a4;
- (void)zoneManagerDidStart:(id)a3;
- (void)zoneManagerDidStop:(id)a3;
@end

@implementation HMDCameraProfileSettingsManager

- (id)logIdentifier
{
  v2 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  if (isInternalBuild())
  {
    v3 = NSString;
    v4 = [v2 home];
    v5 = [v4 name];
    v6 = [v2 name];
    v7 = [v2 uuid];
    v8 = [v3 stringWithFormat:@"%@/%@/%@", v5, v6, v7];
  }
  else
  {
    v4 = [v2 uuid];
    v8 = [v4 UUIDString];
  }

  return v8;
}

- (_HMCameraUserSettings)currentSettings
{
  v3 = [(HMDCameraProfileSettingsManager *)self currentSettingsModel];
  v4 = [(HMDCameraProfileSettingsManager *)self _settingsFromSettingsModel:v3];

  return (_HMCameraUserSettings *)v4;
}

- (id)currentSettingsModel
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCameraProfileSettingsManager *)self zoneManager];
  v4 = [v3 localZone];
  v5 = [(HMDCameraProfileSettingsManager *)self uniqueIdentifier];
  id v17 = 0;
  v6 = [v4 fetchModelWithModelID:v5 ofType:objc_opt_class() error:&v17];
  id v7 = v17;

  if (!v6)
  {
    if (v7)
    {
      v8 = (void *)MEMORY[0x1D9452090]();
      v9 = self;
      v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v19 = v11;
        __int16 v20 = 2112;
        id v21 = v7;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error fetching currentSettings: %@", buf, 0x16u);
      }
    }
    v12 = (void *)MEMORY[0x1D9452090]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v19 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Setting unavailable, using default values", buf, 0xCu);
    }
    v6 = [(HMDCameraProfileSettingsManager *)v13 defaultSettingsModel];
  }
  [(HMDCameraProfileSettingsManager *)self _updateDerivedPropertiesOnSettingsModel:v6];

  return v6;
}

- (HMDCameraProfileSettingsDerivedPropertiesModel)derivedPropertiesModel
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCameraProfileSettingsManager *)self zoneManager];
  v4 = [v3 localZone];
  v5 = [(HMDCameraProfileSettingsManager *)self derivedPropertiesModelID];
  id v16 = 0;
  v6 = [v4 fetchModelWithModelID:v5 ofType:objc_opt_class() error:&v16];
  id v7 = v16;

  if (!v6)
  {
    if (v7)
    {
      v8 = (void *)MEMORY[0x1D9452090]();
      v9 = self;
      v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v18 = v11;
        __int16 v19 = 2112;
        id v20 = v7;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error fetching derived properties: %@", buf, 0x16u);
      }
    }
    v12 = [HMDCameraProfileSettingsDerivedPropertiesModel alloc];
    v13 = [(HMDCameraProfileSettingsManager *)self derivedPropertiesModelID];
    v14 = [(HMDCameraProfileSettingsManager *)self uniqueIdentifier];
    v6 = [(HMBModel *)v12 initWithModelID:v13 parentModelID:v14];

    [(HMDCameraProfileSettingsDerivedPropertiesModel *)v6 setCurrentAccessModeChangeReason:0];
    [(HMDCameraProfileSettingsDerivedPropertiesModel *)v6 setCurrentAccessMode:1];
  }

  return v6;
}

- (NSUUID)derivedPropertiesModelID
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F29128];
  v3 = [(HMDCameraProfileSettingsManager *)self uniqueIdentifier];
  v7[0] = @"2b32a3ee-3908-406e-890d-74f9c410ef2b";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = objc_msgSend(v2, "hm_deriveUUIDFromBaseUUID:withSalts:", v3, v4);

  return (NSUUID *)v5;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMDDatabaseZoneManager)zoneManager
{
  return (HMDDatabaseZoneManager *)objc_getProperty(self, a2, 88, 1);
}

- (HMDCameraProfileSettingsModel)defaultSettingsModel
{
  v3 = [(HMDCameraProfileSettingsManager *)self _settingsModelForUpdate];
  [v3 setVersion:1];
  [v3 setAccessModeAtHome:1];
  [v3 setAccessModeNotAtHome:1];
  [v3 setRecordingEventTriggers:14];
  v4 = [(HMDCameraProfileSettingsManager *)self doorbellInputEventCharacteristic];

  if (v4) {
    objc_msgSend(v3, "setRecordingEventTriggers:", objc_msgSend(v3, "recordingEventTriggers") | 0x10);
  }
  return (HMDCameraProfileSettingsModel *)v3;
}

- (id)doorbellInputEventCharacteristic
{
  v2 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  v3 = [v2 findCharacteristicType:*MEMORY[0x1E4F2CF08] forServiceType:*MEMORY[0x1E4F2DE20]];

  return v3;
}

- (id)_settingsModelForUpdate
{
  v3 = [HMDCameraProfileSettingsModel alloc];
  v4 = [(HMDCameraProfileSettingsManager *)self uniqueIdentifier];
  v5 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  v6 = [v5 uuid];
  id v7 = [(HMBModel *)v3 initWithModelID:v4 parentModelID:v6];

  return v7;
}

- (id)_settingsFromSettingsModel:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F2EC08];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [v5 hmbModelID];
  v8 = (void *)[v6 initWithUUID:v7];

  objc_msgSend(v8, "setSupportedFeatures:", -[HMDCameraProfileSettingsManager supportedFeatures](self, "supportedFeatures"));
  objc_msgSend(v8, "setAccessModeAtHome:", objc_msgSend(v5, "accessModeAtHome"));
  objc_msgSend(v8, "setAccessModeNotAtHome:", objc_msgSend(v5, "accessModeNotAtHome"));
  objc_msgSend(v8, "setRecordingEventTriggers:", objc_msgSend(v5, "recordingEventTriggers"));
  objc_msgSend(v8, "setCameraManuallyDisabled:", objc_msgSend(v5, "cameraManuallyDisabled"));
  v9 = [(HMDCameraProfileSettingsManager *)self currentNotificationSettings];
  [v8 setNotificationSettings:v9];

  v10 = [v5 activityZones];
  [v8 setActivityZones:v10];

  objc_msgSend(v8, "setActivityZonesIncludedForSignificantEventDetection:", objc_msgSend(v5, "activityZonesIncludedForSignificantEventDetection"));
  if ([(HMDCameraProfileSettingsManager *)self canRevealCurrentAccessMode]) {
    uint64_t v11 = [v5 currentAccessMode];
  }
  else {
    uint64_t v11 = [v5 mostPrivateAccessMode];
  }
  uint64_t v12 = v11;

  [v8 setCurrentAccessMode:v12];
  v13 = (void *)[v8 copy];

  return v13;
}

- (unint64_t)supportedFeatures
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v2 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  v3 = [v2 services];

  id obj = v3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v35;
    uint64_t v8 = *MEMORY[0x1E4F2DDE8];
    uint64_t v9 = *MEMORY[0x1E4F2DDF0];
    uint64_t v32 = *MEMORY[0x1E4F2DDE0];
    uint64_t v30 = *MEMORY[0x1E4F2CE70];
    uint64_t v29 = *MEMORY[0x1E4F2CF50];
    uint64_t v28 = *MEMORY[0x1E4F2CEE8];
    uint64_t v10 = *MEMORY[0x1E4F2CE48];
    uint64_t v31 = *MEMORY[0x1E4F2CF78];
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "serviceType", v28);
        int v14 = [v13 isEqualToString:v8];

        if (v14)
        {
          v15 = [v12 findCharacteristicWithType:v10];

          v6 |= v15 != 0;
          continue;
        }
        id v16 = [v12 serviceType];
        int v17 = [v16 isEqualToString:v9];

        if (v17)
        {
          v18 = [v12 findCharacteristicWithType:v10];

          uint64_t v19 = 6;
          if (!v18) {
            uint64_t v19 = 2;
          }
          uint64_t v20 = v19 | v6;
          uint64_t v21 = [v12 findCharacteristicWithType:v31];

          uint64_t v22 = v20 | 0x40;
        }
        else
        {
          v23 = [v12 serviceType];
          int v24 = [v23 isEqualToString:v32];

          if (!v24) {
            continue;
          }
          v25 = [v12 findCharacteristicWithType:v30];

          if (v25) {
            uint64_t v20 = v6 | 0x10;
          }
          else {
            uint64_t v20 = v6;
          }
          v26 = [v12 findCharacteristicWithType:v29];

          if (v26) {
            v20 |= 8uLL;
          }
          uint64_t v21 = [v12 findCharacteristicWithType:v28];

          uint64_t v22 = v20 | 0x20;
        }
        if (v21) {
          unint64_t v6 = v22;
        }
        else {
          unint64_t v6 = v20;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (!v5) {
        goto LABEL_26;
      }
    }
  }
  unint64_t v6 = 0;
LABEL_26:

  return v6;
}

- (id)currentNotificationSettings
{
  v2 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  v3 = [v2 cameraProfileNotificationSettings];
  uint64_t v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = objc_alloc_init(MEMORY[0x1E4F2E760]);
  }
  unint64_t v6 = v5;

  return v6;
}

- (HMDHAPAccessory)hapAccessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hapAccessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (void)_updateDerivedPropertiesOnSettingsModel:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(HMDCameraProfileSettingsManager *)self derivedPropertiesModel];
  objc_msgSend(v6, "setCurrentAccessMode:", objc_msgSend(v4, "currentAccessMode"));
  if ([v4 currentAccessMode]) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = [v4 currentAccessModeChangeReason] == 5;
  }
  [v6 setCameraManuallyDisabled:v5];
}

- (BOOL)canRevealCurrentAccessMode
{
  v2 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  v3 = [v2 home];
  uint64_t v4 = [v3 currentUser];
  char v5 = [v4 isRemoteAccessAllowed];

  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t141 != -1) {
    dispatch_once(&logCategory__hmf_once_t141, &__block_literal_global_175_168317);
  }
  v2 = (void *)logCategory__hmf_once_v142;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anyUserAtHome, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_zoneManager, 0);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_quotaCoordinator, 0);
  objc_storeStrong((id *)&self->_characteristicsAvailabilityListener, 0);
  objc_storeStrong((id *)&self->_bulletinBoard, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_hapAccessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (void)setAnyUserAtHome:(id)a3
{
}

- (NSNumber)isAnyUserAtHome
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setNeedsInitialSettingsCharacteristicSynchronization:(BOOL)a3
{
  self->_needsInitialSettingsCharacteristicSynchronization = a3;
}

- (BOOL)needsInitialSettingsCharacteristicSynchronization
{
  return self->_needsInitialSettingsCharacteristicSynchronization;
}

- (void)setMsgDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)msgDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 96, 1);
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (HMDCameraProfileSettingsQuotaCoordinator)quotaCoordinator
{
  return (HMDCameraProfileSettingsQuotaCoordinator *)objc_getProperty(self, a2, 64, 1);
}

- (HMDCharacteristicsAvailabilityListener)characteristicsAvailabilityListener
{
  return (HMDCharacteristicsAvailabilityListener *)objc_getProperty(self, a2, 56, 1);
}

- (HMDBulletinBoard)bulletinBoard
{
  return (HMDBulletinBoard *)objc_getProperty(self, a2, 48, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHapAccessory:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)zoneManagerDidStop:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  uint64_t v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    uint64_t v11 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Zone Manager stopped unexpectedly", (uint8_t *)&v10, 0xCu);
  }
}

- (void)zoneManagerDidStart:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  id v4 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v4);

  char v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v62 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Zone Manager started, initializing", buf, 0xCu);
  }
  uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
  int v10 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v11 = [(HMDCameraProfileSettingsManager *)v6 zoneManager];
  uint64_t v12 = [v11 localZone];
  v13 = [(HMDCameraProfileSettingsManager *)v6 uniqueIdentifier];
  id v60 = 0;
  int v14 = [v12 fetchModelWithModelID:v13 ofType:objc_opt_class() error:&v60];
  id v15 = v60;

  uint64_t v16 = [(HMDCameraProfileSettingsManager *)v6 _initializeNotificationSettingsUsingSettingsModel:v14];
  if (!v14)
  {
    if (v15)
    {
      int v17 = (void *)MEMORY[0x1D9452090](v16);
      v18 = v6;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v62 = v20;
        __int16 v63 = 2112;
        id v64 = v15;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error fetching currentSettings: %@", buf, 0x16u);
      }
    }
    uint64_t v21 = (void *)MEMORY[0x1D9452090](v16);
    uint64_t v22 = v6;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v62 = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Initializing settings with default values", buf, 0xCu);
    }
    int v14 = [(HMDCameraProfileSettingsManager *)v22 defaultSettingsModel];
    [v9 addObject:v14];
    [(HMDCameraProfileSettingsManager *)v22 _writeInitialSettingsCharacteristicsToCamera];
  }
  v25 = (void *)MEMORY[0x1D9452090]([(HMDCameraProfileSettingsManager *)v6 _updateDerivedPropertiesOnSettingsModel:v14]);
  v26 = v6;
  v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    uint64_t v28 = HMFGetLogIdentifier();
    [(HMDCameraProfileSettingsManager *)v26 _settingsFromSettingsModel:v14];
    v30 = id v29 = v15;
    *(_DWORD *)buf = 138543618;
    v62 = v28;
    __int16 v63 = 2112;
    id v64 = v30;
    _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Initializing with current settings: %@", buf, 0x16u);

    id v15 = v29;
  }

  if ([(HMDCameraProfileSettingsManager *)v26 isCurrentDeviceConfirmedPrimaryResident])
  {
    if ([(HMDCameraProfileSettingsManager *)v26 _migrateSettingsModel:v14]) {
      [v10 addObject:v14];
    }
    char v59 = 0;
    uint64_t v31 = -[HMDCameraProfileSettingsManager _updatedDerivedPropertiesModelWithSettingsModel:userInitiated:didCreateModel:](v26, "_updatedDerivedPropertiesModelWithSettingsModel:userInitiated:didCreateModel:", v14, 0, &v59, v15);
    uint64_t v32 = (void *)v31;
    if (v31)
    {
      if (v59) {
        v33 = v9;
      }
      else {
        v33 = v10;
      }
      uint64_t v31 = [v33 addObject:v32];
    }
    long long v34 = (void *)MEMORY[0x1D9452090](v31);
    long long v35 = v26;
    long long v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      long long v37 = HMFGetLogIdentifier();
      v38 = [v32 debugDescription];
      *(_DWORD *)buf = 138543618;
      v62 = v37;
      __int16 v63 = 2112;
      id v64 = v38;
      _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@Initializing with current derived properties: %@", buf, 0x16u);
    }

    id v15 = v57;
  }
  if (([v9 containsObject:v14] & 1) == 0 && (objc_msgSend(v10, "containsObject:", v14) & 1) == 0) {
    [(HMDCameraProfileSettingsManager *)v26 _notifyClientsOfChangedSettingsModel:v14 isInitialSettingsUpdate:1];
  }
  uint64_t v39 = [(HMDCameraProfileSettingsManager *)v26 hapAccessory];
  v40 = [v39 home];
  [v40 registerCameraReachabilityEventNotificationsWithCompletionHandler:0];

  v41 = [(HMDCameraProfileSettingsManager *)v26 zoneManager];
  v42 = [v41 localZone];
  v43 = [(HMDCameraProfileSettingsManager *)v26 uniqueIdentifier];
  [v42 addObserver:v26 forModelWithID:v43];

  v44 = [(HMDCameraProfileSettingsManager *)v26 zoneManager];
  v45 = [v44 localZone];
  v46 = [(HMDCameraProfileSettingsManager *)v26 derivedPropertiesModelID];
  [v45 addObserver:v26 forModelWithID:v46];

  v47 = [(HMDCameraProfileSettingsManager *)v26 zoneManager];
  v48 = [v47 localZone];
  [v48 startUp];

  v49 = [(HMDCameraProfileSettingsManager *)v26 characteristicsAvailabilityListener];
  [v49 setDelegate:v26];

  v50 = [(HMDCameraProfileSettingsManager *)v26 characteristicsAvailabilityListener];
  [v50 start];

  v51 = [(HMDCameraProfileSettingsManager *)v26 quotaCoordinator];
  [v51 setDelegate:v26];

  if ([v9 count])
  {
    v52 = [MEMORY[0x1E4F69EF0] optionsWithLabel:@"Initial settings creation"];
    v53 = [(HMDCameraProfileSettingsManager *)v26 zoneManager];
    v54 = [v53 localZone];
    id v55 = (id)[v54 createModels:v9 options:v52];
LABEL_31:

    goto LABEL_32;
  }
  if ([v10 count])
  {
    v52 = [MEMORY[0x1E4F69EF0] optionsWithLabel:@"Initial settings update"];
    v53 = [(HMDCameraProfileSettingsManager *)v26 zoneManager];
    v54 = [v53 localZone];
    id v56 = (id)[v54 updateModels:v10 options:v52];
    goto LABEL_31;
  }
LABEL_32:
}

- (BOOL)zoneManager:(id)a3 shouldRequestShareInvitationFromUser:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v6);

  LOBYTE(v6) = [v5 isOwner];
  return (char)v6;
}

- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  LOBYTE(v6) = [v5 isOwner];
  return v6 ^ 1;
}

- (void)listener:(id)a3 didUpdateAvailableCharacteristics:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v6 = a4;
  uint64_t v7 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v37 = v11;
    __int16 v38 = 2112;
    id v39 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Received updated available characteristics: %@", buf, 0x16u);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      uint64_t v16 = 0;
      uint64_t v30 = v14;
      do
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        int v17 = *(void **)(*((void *)&v31 + 1) + 8 * v16);
        v18 = [v17 service];
        uint64_t v19 = [v18 bulletinBoardNotification];

        if (v19)
        {
          uint64_t v20 = [(HMDCameraProfileSettingsManager *)v9 notificationCenter];
          [v20 removeObserver:v9 name:@"HMDBulletinBoardNotificationDidUpdateNotification" object:v19];

          uint64_t v21 = [(HMDCameraProfileSettingsManager *)v9 notificationCenter];
          [v21 addObserver:v9 selector:sel_handleBulletinNotificationEnableStateDidChangeNotification_ name:@"HMDBulletinBoardNotificationDidUpdateNotification" object:v19];

          [(HMDCameraProfileSettingsManager *)v9 _coordinateNotificationSettingsWithServiceBulletinNotification:v19];
        }
        else
        {
          uint64_t v22 = (void *)MEMORY[0x1D9452090]();
          v23 = v9;
          int v24 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v25 = v15;
            v27 = id v26 = v12;
            uint64_t v28 = [v17 service];
            *(_DWORD *)buf = 138543618;
            long long v37 = v27;
            __int16 v38 = 2112;
            id v39 = v28;
            _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Service unexpectedly does not have a bulletin board notification: %@", buf, 0x16u);

            id v12 = v26;
            uint64_t v15 = v25;
            uint64_t v14 = v30;
          }
        }

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v14);
  }
}

- (void)updateSettingsModelUsingBlock:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void (**)(id, void *))a3;
  uint64_t v8 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(HMDCameraProfileSettingsManager *)self currentSettingsModel];
  v7[2](v7, v9);

  int v10 = [v9 hmbSetProperties];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    id v12 = [(HMDCameraProfileSettingsManager *)self _processingOptionsForLabel:@"Update camera access mode"];
    uint64_t v13 = [(HMDCameraProfileSettingsManager *)self zoneManager];
    uint64_t v14 = [v13 localZone];
    uint64_t v15 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
    uint64_t v16 = [v14 addModels:v15 options:v12];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __76__HMDCameraProfileSettingsManager_updateSettingsModelUsingBlock_completion___block_invoke;
    v18[3] = &unk_1E6A15530;
    id v19 = v6;
    id v17 = (id)[v16 addCompletionBlock:v18];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

uint64_t __76__HMDCameraProfileSettingsManager_updateSettingsModelUsingBlock_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2) {
    a3 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a3);
}

- (void)_handleUpdatedSettings:(id)a3 previousSettings:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v20 = 0;
  [v6 hmbIsDifferentFromModel:v7 differingFields:&v20];
  id v9 = v20;
  int v10 = objc_msgSend(v9, "hmf_isEmpty");
  uint64_t v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  uint64_t v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEBUG, "%{public}@No changed fields for updated settings model", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      id v17 = [v6 debugDescription];
      v18 = [v7 debugDescription];
      *(_DWORD *)buf = 138544130;
      uint64_t v22 = v16;
      __int16 v23 = 2112;
      int v24 = v17;
      __int16 v25 = 2112;
      id v26 = v18;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Handling updated settings model: %@, previous settings model: %@, changed fields: %@", buf, 0x2Au);
    }
    [(HMDCameraProfileSettingsManager *)v12 _updateDerivedPropertiesOnSettingsModel:v6];
    [(HMDCameraProfileSettingsManager *)v12 _notifyClientsOfChangedSettingsModel:v6 isInitialSettingsUpdate:0];
    if (-[HMDCameraProfileSettingsManager isCurrentDeviceConfirmedPrimaryResident](v12, "isCurrentDeviceConfirmedPrimaryResident")&& (([v9 containsObject:@"accessModeAtHomeField"] & 1) != 0|| objc_msgSend(v9, "containsObject:", @"accessModeNotAtHomeField")))
    {
      id v19 = [(HMDCameraProfileSettingsManager *)v12 currentSettingsModel];
      [(HMDCameraProfileSettingsManager *)v12 _updateDerivedPropertiesModelWithSettingsModel:v19 userInitiated:1 reason:@"Settings model updated"];
    }
  }
}

- (void)_handleUpdatedDerivedProperties:(id)a3 previousProperties:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v64 = 0;
  [v6 hmbIsDifferentFromModel:v7 differingFields:&v64];
  id v9 = (__CFString *)v64;
  int v10 = [(__CFString *)v9 hmf_isEmpty];
  uint64_t v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  uint64_t v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v66 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEBUG, "%{public}@No changed fields for updated derived properties model", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      id v17 = [v6 debugDescription];
      v18 = [v7 debugDescription];
      *(_DWORD *)buf = 138544130;
      v66 = v16;
      __int16 v67 = 2112;
      v68 = v17;
      __int16 v69 = 2112;
      v70 = v18;
      __int16 v71 = 2112;
      v72 = v9;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Handling updated derived properties model: %@\nprevious derived properties model: %@\nchanged fields: %@", buf, 0x2Au);
    }
    [(HMDCameraProfileSettingsManager *)v12 _notifyClientsOfCurrentSettings];
    uint64_t v19 = [v6 currentAccessMode];
    if ([(HMDCameraProfileSettingsManager *)v12 isCurrentDeviceConfirmedPrimaryResident])
    {
      id v20 = (void *)MEMORY[0x1D9452090]();
      uint64_t v21 = v12;
      uint64_t v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v23 = HMFGetLogIdentifier();
        HMCameraAccessModeAsString();
        int v24 = (HMDCameraAccessModeChangedBulletin *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v66 = v23;
        __int16 v67 = 2112;
        v68 = v24;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Handling currentAccessMode of %@", buf, 0x16u);
      }
      [(HMDCameraProfileSettingsManager *)v21 _synchronizeCurrentAccessModeSettingToCameraWithCompletion:0];
    }
    if ([(__CFString *)v9 containsObject:@"currentAccessModeField"])
    {
      __int16 v25 = [(HMDCameraProfileSettingsManager *)v12 hapAccessory];
      id v26 = [v25 home];
      __int16 v27 = [(HMDCameraProfileSettingsManager *)v12 currentNotificationSettings];
      int v28 = [v27 isAccessModeChangeNotificationEnabled];

      uint64_t v29 = [v25 cameraProfiles];
      uint64_t v30 = [v29 anyObject];

      __int16 v63 = (void *)v30;
      if (v7
        && (v30 ? (int v31 = v28) : (int v31 = 0),
            v31 == 1
         && v26
         && [(HMDCameraProfileSettingsManager *)v12 canRevealCurrentAccessMode]))
      {
        long long v32 = (void *)MEMORY[0x1D9452090]();
        v61 = v12;
        long long v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          long long v34 = HMFGetLogIdentifier();
          [v7 currentAccessMode];
          HMCameraAccessModeAsString();
          long long v35 = (HMDCameraAccessModeChangedBulletin *)objc_claimAutoreleasedReturnValue();
          HMCameraAccessModeAsString();
          long long v36 = v59 = v32;
          *(_DWORD *)buf = 138543874;
          v66 = v34;
          __int16 v67 = 2112;
          v68 = v35;
          __int16 v69 = 2112;
          v70 = v36;
          _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@Current access mode changed from %@ to %@", buf, 0x20u);

          long long v32 = v59;
        }

        long long v37 = [HMDCameraAccessModeChangedBulletin alloc];
        uint64_t v38 = [v6 currentAccessModeChangeReason];
        id v39 = [v6 currentAccessModeChangeDate];
        if (v39)
        {
          uint64_t v40 = [(HMDCameraAccessModeChangedBulletin *)v37 initWithAccessMode:v19 camera:v63 home:v26 changeReason:v38 changeDate:v39];
        }
        else
        {
          v50 = [MEMORY[0x1E4F1C9C8] date];
          uint64_t v40 = [(HMDCameraAccessModeChangedBulletin *)v37 initWithAccessMode:v19 camera:v63 home:v26 changeReason:v38 changeDate:v50];
        }
        if (v40)
        {
          v51 = (void *)MEMORY[0x1D9452090]();
          v52 = v61;
          v53 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
          {
            v54 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v66 = v54;
            __int16 v67 = 2112;
            v68 = v40;
            _os_log_impl(&dword_1D49D5000, v53, OS_LOG_TYPE_INFO, "%{public}@Inserting camera access mode changed bulletin: %@", buf, 0x16u);
          }
          id v55 = [(HMDCameraProfileSettingsManager *)v52 bulletinBoard];
          [v55 insertCameraAccessModeChangedBulletin:v40];
        }
      }
      else
      {
        v41 = (void *)MEMORY[0x1D9452090]();
        v42 = v12;
        v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          v44 = HMFGetLogIdentifier();
          id v60 = v25;
          v62 = v26;
          v45 = @"<nil>";
          if (v7) {
            v46 = @"<not nil>";
          }
          else {
            v46 = @"<nil>";
          }
          id v56 = v46;
          v47 = HMFBooleanToString();
          id v58 = v41;
          if (v63) {
            v48 = @"<not nil>";
          }
          else {
            v48 = @"<nil>";
          }
          if (v26) {
            v45 = @"<not nil>";
          }
          [(HMDCameraProfileSettingsManager *)v42 canRevealCurrentAccessMode];
          v49 = HMFBooleanToString();
          *(_DWORD *)buf = 138544642;
          v66 = v44;
          __int16 v67 = 2112;
          v68 = v57;
          __int16 v69 = 2112;
          v70 = v47;
          __int16 v71 = 2112;
          v72 = v48;
          __int16 v73 = 2112;
          v74 = v45;
          v41 = v58;
          __int16 v25 = v60;
          __int16 v75 = 2112;
          v76 = v49;
          _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_INFO, "%{public}@Not posting access mode change notification because previousProperties=%@ accessModeChangeNotificationEnabled=%@ cameraProfile=%@ home=%@ canRevealCurrentAccessMode=%@", buf, 0x3Eu);

          id v26 = v62;
        }
      }
    }
  }
}

- (void)_handleModelUpdate:(id)a3 previousModel:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v10 = v9;
  }
  else {
    int v10 = 0;
  }
  id v11 = v10;

  id v12 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  if (v11 && (!v12 || v14))
  {
    [(HMDCameraProfileSettingsManager *)self _handleUpdatedSettings:v11 previousSettings:v14];
  }
  else
  {

    id v15 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
    id v17 = v16;

    id v18 = v12;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 0;
    }
    id v20 = v19;

    if (v17 && (!v18 || v20))
    {
      [(HMDCameraProfileSettingsManager *)self _handleUpdatedDerivedProperties:v17 previousProperties:v20];
    }
    else
    {

      uint64_t v21 = (void *)MEMORY[0x1D9452090]();
      uint64_t v22 = self;
      __int16 v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int v24 = HMFGetLogIdentifier();
        int v25 = 138543874;
        id v26 = v24;
        __int16 v27 = 2112;
        id v28 = v15;
        __int16 v29 = 2112;
        id v30 = v18;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Invalid updated (%@) or previous (%@) model received", (uint8_t *)&v25, 0x20u);
      }
    }
  }
}

- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v13 = 138543618;
    id v14 = v11;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Received model deletion: %@", (uint8_t *)&v13, 0x16u);
  }

  return 0;
}

- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v18 = v11;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Received model update: %@", buf, 0x16u);
  }
  id v12 = [(HMDCameraProfileSettingsManager *)v9 workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__HMDCameraProfileSettingsManager_localZone_didProcessModelUpdate___block_invoke;
  v15[3] = &unk_1E6A197C8;
  v15[4] = v9;
  id v16 = v7;
  id v13 = v7;
  dispatch_async(v12, v15);

  return 0;
}

void __67__HMDCameraProfileSettingsManager_localZone_didProcessModelUpdate___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) model];
  uint64_t v3 = [*(id *)(a1 + 40) previousModel];
  [v2 _handleModelUpdate:v4 previousModel:v3];
}

- (id)localZone:(id)a3 didProcessModelCreation:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v18 = v11;
    __int16 v19 = 2114;
    id v20 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Received model creation: %{public}@", buf, 0x16u);
  }
  id v12 = [(HMDCameraProfileSettingsManager *)v9 workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__HMDCameraProfileSettingsManager_localZone_didProcessModelCreation___block_invoke;
  v15[3] = &unk_1E6A197C8;
  v15[4] = v9;
  id v16 = v7;
  id v13 = v7;
  dispatch_async(v12, v15);

  return 0;
}

void __69__HMDCameraProfileSettingsManager_localZone_didProcessModelCreation___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) model];
  [v1 _handleModelUpdate:v2 previousModel:0];
}

- (BOOL)isCurrentDeviceConfirmedPrimaryResident
{
  id v2 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  uint64_t v3 = [v2 home];
  char v4 = [v3 isCurrentDeviceConfirmedPrimaryResident];

  return v4;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  char v4 = [(HMDCameraProfileSettingsManager *)self messageTargetUUID];
  id v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (void)_enablePackageNotificationsOnSettings:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F2E968];
  id v4 = a3;
  id v7 = objc_alloc_init(v3);
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F2E740]) initWithSignificantEventTypes:16];
  [v7 setSignificantEventReasonCondition:v5];

  [v4 setSmartBulletinBoardNotificationEnabled:1];
  id v6 = [v7 predicate];
  [v4 setSmartBulletinBoardNotificationCondition:v6];
}

- (void)_setManuallyDisabledCharacteristicNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDCameraProfileSettingsManager *)self manuallyDisabledCharacteristic];
  if (v5)
  {
    id v6 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
    v9[0] = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    uint64_t v8 = [(HMDCameraProfileSettingsManager *)self clientIdentifier];
    [v6 enableNotification:v3 forCharacteristics:v7 message:0 clientIdentifier:v8];
  }
}

- (void)_coordinateSmartBulletinNotificationWithServiceBulletinNotification:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([v4 isEnabled])
  {
    id v6 = [(HMDCameraProfileSettingsManager *)self currentSettings];
    id v7 = [v6 notificationSettings];
    char v8 = [v7 isSmartBulletinBoardNotificationEnabled];

    if ((v8 & 1) == 0)
    {
      id v9 = (void *)MEMORY[0x1D9452090]();
      int v10 = self;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = HMFGetLogIdentifier();
        id v13 = [v4 service];
        int v17 = 138543618;
        id v18 = v12;
        __int16 v19 = 2112;
        id v20 = v13;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Bulletin board notification is enabled for service %@, so enabling smart bulletin board notification with empty significant event types", (uint8_t *)&v17, 0x16u);
      }
      id v14 = [v6 notificationSettings];
      __int16 v15 = (void *)[v14 mutableCopy];

      [v15 setSmartBulletinBoardNotificationEnabled:1];
      id v16 = [MEMORY[0x1E4F2E6C8] predicateForSignificantEventTypes:0];
      [v15 setSmartBulletinBoardNotificationCondition:v16];

      [(HMDCameraProfileSettingsManager *)v10 _updateNotificationSettings:v15 forMessage:0];
    }
  }
}

- (void)_coordinateNotificationSettingsWithServiceBulletinNotification:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 service];
  id v7 = [v6 type];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F2DE98]];

  if (v8)
  {
    [(HMDCameraProfileSettingsManager *)self _coordinateSmartBulletinNotificationWithServiceBulletinNotification:v4];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    int v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = [v4 service];
      int v14 = 138543874;
      __int16 v15 = v12;
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      __int16 v19 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unexpected bulletin board notification: %@ service: %@ when coordinating settings", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (void)_addRecordingAudioEnabledWriteRequestToArray:(id)a3 recordingAudioEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [NSNumber numberWithUnsignedChar:v4];
  [(HMDCameraProfileSettingsManager *)self _addWriteRequestToArray:v6 forCharacteristicWithType:*MEMORY[0x1E4F2CF78] ofServiceWithType:*MEMORY[0x1E4F2DDF0] value:v8];
}

- (void)_addAccessModeCharacteristicWriteRequestsToArray:(id)a3 currentAccessMode:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = HMIsStreamingAllowedForCameraAccessMode();
  uint64_t v8 = *MEMORY[0x1E4F2CE48];
  uint64_t v9 = *MEMORY[0x1E4F2DDE8];
  int v10 = [NSNumber numberWithUnsignedChar:v7];
  [(HMDCameraProfileSettingsManager *)self _addWriteRequestToArray:v5 forCharacteristicWithType:v8 ofServiceWithType:v9 value:v10];

  uint64_t v11 = HMIsRecordingAllowedForCameraAccessMode();
  uint64_t v12 = *MEMORY[0x1E4F2DDF0];
  id v13 = [NSNumber numberWithUnsignedChar:v11];
  [(HMDCameraProfileSettingsManager *)self _addWriteRequestToArray:v5 forCharacteristicWithType:v8 ofServiceWithType:v12 value:v13];
}

- (void)_addHomeKitCameraActiveCharacteristicWriteRequestToArray:(id)a3 currentAccessMode:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = *MEMORY[0x1E4F2DDE0];
  [NSNumber numberWithInt:a4 != 0];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(HMDCameraProfileSettingsManager *)self _addWriteRequestToArray:v6 forCharacteristicWithType:@"0000021B-0000-1000-8000-0026BB765291" ofServiceWithType:v8 value:v9];
}

- (void)_addSnapshotsActiveCharacteristicWriteRequestToArray:(id)a3 snapshotsAllowed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = *MEMORY[0x1E4F2CEE8];
  uint64_t v9 = *MEMORY[0x1E4F2DDE0];
  id v10 = [NSNumber numberWithBool:v4];
  [(HMDCameraProfileSettingsManager *)self _addWriteRequestToArray:v6 forCharacteristicWithType:v8 ofServiceWithType:v9 value:v10];
}

- (void)_addPeriodicSnapshotsActiveCharacteristicWriteRequestToArray:(id)a3 periodicSnapshotsAllowed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = *MEMORY[0x1E4F2DDE0];
  id v9 = [NSNumber numberWithBool:v4];
  [(HMDCameraProfileSettingsManager *)self _addWriteRequestToArray:v6 forCharacteristicWithType:@"00000225-0000-1000-8000-0026BB765291" ofServiceWithType:v8 value:v9];
}

- (void)_addOperatingModeIndicatorCharacteristicWriteRequestToArray:(id)a3 accessModeIndicatorEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = *MEMORY[0x1E4F2CE70];
  uint64_t v9 = *MEMORY[0x1E4F2DDE0];
  id v10 = [NSNumber numberWithBool:v4];
  [(HMDCameraProfileSettingsManager *)self _addWriteRequestToArray:v6 forCharacteristicWithType:v8 ofServiceWithType:v9 value:v10];
}

- (void)_addNightVisionCharacteristicWriteRequestToArray:(id)a3 nightVisionEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = *MEMORY[0x1E4F2CF50];
  uint64_t v9 = *MEMORY[0x1E4F2DDE0];
  id v10 = [NSNumber numberWithBool:v4];
  [(HMDCameraProfileSettingsManager *)self _addWriteRequestToArray:v6 forCharacteristicWithType:v8 ofServiceWithType:v9 value:v10];
}

- (void)_addWriteRequestToArray:(id)a3 forCharacteristicWithType:(id)a4 ofServiceWithType:(id)a5 value:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v13);

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  int v14 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  __int16 v15 = [v14 services];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v21 = [v20 serviceType];
        int v22 = [v21 isEqualToString:v11];

        if (v22)
        {
          __int16 v23 = [v20 findCharacteristicWithType:v10];
          int v24 = v23;
          if (v23)
          {
            int v25 = [v23 authorizationData];
            id v26 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v24 value:v12 authorizationData:v25 type:1];

            [v27 addObject:v26];
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v17);
  }
}

- (void)_handleCharacteristicWriteRequests:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  if ([v6 count])
  {
    id v22 = (id)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Write settings characteristics"];
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    HMFGetOSLogHandle();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      int v14 = [v22 identifier];
      __int16 v15 = [v14 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v24 = v13;
      __int16 v25 = 2114;
      id v26 = v15;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Received request to write characteristics: %@", buf, 0x20u);
    }
    uint64_t v16 = [(HMDCameraProfileSettingsManager *)v11 workQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __81__HMDCameraProfileSettingsManager__handleCharacteristicWriteRequests_completion___block_invoke;
    v19[3] = &unk_1E6A17640;
    v19[4] = v11;
    id v20 = v22;
    id v21 = v7;
    [v9 writeCharacteristicValues:v6 source:7 queue:v16 completionHandler:v19];

    __HMFActivityScopeLeave();
  }
  else
  {
    uint64_t v17 = _Block_copy(v7);
    uint64_t v18 = v17;
    if (v17) {
      (*((void (**)(void *, void))v17 + 2))(v17, 0);
    }
  }
}

void __81__HMDCameraProfileSettingsManager__handleCharacteristicWriteRequests_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_168110);
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 error];
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 40) identifier];
      id v12 = [v11 shortDescription];
      int v18 = 138543874;
      __int16 v19 = v10;
      __int16 v20 = 2114;
      id v21 = v12;
      __int16 v22 = 2112;
      id v23 = v3;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to write settings to accessory: %@", (uint8_t *)&v18, 0x20u);
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = [*(id *)(a1 + 40) identifier];
      __int16 v15 = [v14 shortDescription];
      int v18 = 138543618;
      __int16 v19 = v13;
      __int16 v20 = 2114;
      id v21 = v15;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully wrote settings to accessory", (uint8_t *)&v18, 0x16u);
    }
    id v6 = 0;
  }

  uint64_t v16 = _Block_copy(*(const void **)(a1 + 48));
  uint64_t v17 = v16;
  if (v16) {
    (*((void (**)(void *, void *))v16 + 2))(v16, v6);
  }
}

BOOL __81__HMDCameraProfileSettingsManager__handleCharacteristicWriteRequests_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 error];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_writeInitialSettingsCharacteristicsToCamera
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v11 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Writing initial settings characteristics to camera", buf, 0xCu);
  }
  [(HMDCameraProfileSettingsManager *)v5 setNeedsInitialSettingsCharacteristicSynchronization:1];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  [(HMDCameraProfileSettingsManager *)v5 _addOperatingModeIndicatorCharacteristicWriteRequestToArray:v8 accessModeIndicatorEnabled:1];
  [(HMDCameraProfileSettingsManager *)v5 _addNightVisionCharacteristicWriteRequestToArray:v8 nightVisionEnabled:1];
  [(HMDCameraProfileSettingsManager *)v5 _addSnapshotsActiveCharacteristicWriteRequestToArray:v8 snapshotsAllowed:1];
  [(HMDCameraProfileSettingsManager *)v5 _addPeriodicSnapshotsActiveCharacteristicWriteRequestToArray:v8 periodicSnapshotsAllowed:1];
  [(HMDCameraProfileSettingsManager *)v5 _addRecordingAudioEnabledWriteRequestToArray:v8 recordingAudioEnabled:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __79__HMDCameraProfileSettingsManager__writeInitialSettingsCharacteristicsToCamera__block_invoke;
  v9[3] = &unk_1E6A197F0;
  v9[4] = v5;
  [(HMDCameraProfileSettingsManager *)v5 _handleCharacteristicWriteRequests:v8 completion:v9];
}

void __79__HMDCameraProfileSettingsManager__writeInitialSettingsCharacteristicsToCamera__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      id v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to write initial settings characteristics: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully wrote initial settings characteristics", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) setNeedsInitialSettingsCharacteristicSynchronization:0];
  }
}

- (void)_updateNotificationSettings:(id)a3 forMessage:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  [v7 updateCameraProfileNotificationSettings:v6];

  [(HMDCameraProfileSettingsManager *)self _notifyClientsOfCurrentSettings];
  [v8 respondWithSuccess];
}

- (void)_notifyClientsOfChangedSettings:(id)a3 isInitialSettingsUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    __int16 v12 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    long long v32 = v11;
    __int16 v33 = 2112;
    id v34 = v6;
    __int16 v35 = 2112;
    long long v36 = v12;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of changed settings: %@ isInitialSettingsUpdate: %@", buf, 0x20u);
  }
  id v13 = [(HMDCameraProfileSettingsManager *)v9 _payloadForSettings:v6];
  uint64_t v14 = [MEMORY[0x1E4F654B0] entitledMessageWithName:*MEMORY[0x1E4F2CD90] messagePayload:v13];
  __int16 v15 = [(HMDCameraProfileSettingsManager *)v9 messageDestination];
  [v14 setDestination:v15];

  uint64_t v16 = [(HMDCameraProfileSettingsManager *)v9 msgDispatcher];
  [v16 sendMessage:v14 completionHandler:0];

  uint64_t v17 = [(HMDCameraProfileSettingsManager *)v9 hapAccessory];
  int v18 = v17;
  if (v17)
  {
    __int16 v19 = [v17 home];
    __int16 v20 = [v19 homeManager];
    id v21 = [(HMDCameraProfileSettingsManager *)v9 uniqueIdentifier];
    [v20 updateGenerationCounterWithReason:@"Camera Settings Updated" sourceUUID:v21 shouldNotifyClients:1];

    __int16 v22 = objc_msgSend(NSNumber, "numberWithBool:", v4, @"HMDCameraProfileSettingsNotificationKey", @"HMDCameraProfileSettingsIsInitialSettingsUpdateNotificationKey", v6);
    v30[1] = v22;
    id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:2];

    uint64_t v24 = [(HMDCameraProfileSettingsManager *)v9 notificationCenter];
    [v24 postNotificationName:@"HMDCameraProfileSettingsDidChangeNotification" object:v18 userInfo:v23];
  }
  else
  {
    __int16 v25 = (void *)MEMORY[0x1D9452090]();
    id v26 = v9;
    __int16 v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v32 = v28;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory reference was nil while notifying clients of changed settings", buf, 0xCu);
    }
  }
}

- (void)_notifyClientsOfChangedSettingsModel:(id)a3 isInitialSettingsUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(HMDCameraProfileSettingsManager *)self _settingsFromSettingsModel:v6];

  [(HMDCameraProfileSettingsManager *)self _notifyClientsOfChangedSettings:v8 isInitialSettingsUpdate:v4];
}

- (void)_notifyClientsOfCurrentSettings
{
  id v3 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraProfileSettingsManager *)self currentSettings];
  [(HMDCameraProfileSettingsManager *)self _notifyClientsOfChangedSettings:v4 isInitialSettingsUpdate:0];
}

- (id)_payloadForSettings:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4F2CD98];
  id v3 = encodeRootObjectForSPIClients(a3);
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (void)_synchronizeCurrentAccessModeSettingToCameraWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v12 = 138543362;
    id v13 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Synchronizing current access mode settings to camera", (uint8_t *)&v12, 0xCu);
  }
  int v10 = [(HMDCameraProfileSettingsManager *)v7 currentSettingsModel];
  id v11 = [MEMORY[0x1E4F1CA48] array];
  -[HMDCameraProfileSettingsManager _addAccessModeCharacteristicWriteRequestsToArray:currentAccessMode:](v7, "_addAccessModeCharacteristicWriteRequestsToArray:currentAccessMode:", v11, [v10 currentAccessMode]);
  -[HMDCameraProfileSettingsManager _addHomeKitCameraActiveCharacteristicWriteRequestToArray:currentAccessMode:](v7, "_addHomeKitCameraActiveCharacteristicWriteRequestToArray:currentAccessMode:", v11, [v10 currentAccessMode]);
  [(HMDCameraProfileSettingsManager *)v7 _handleCharacteristicWriteRequests:v11 completion:v4];
}

- (void)_populateCurrentAccessModeFieldForDerivedProperties:(id)a3 currentSettings:(id)a4 userInitiated:(BOOL)a5 didUpdateField:(BOOL *)a6
{
  BOOL v7 = a5;
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  int v12 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v12);

  if (a6) {
    *a6 = 0;
  }
  if ([v11 hmbPropertyWasSet:@"accessModeAtHomeField"]
    && ([v11 hmbPropertyWasSet:@"accessModeNotAtHomeField"] & 1) != 0)
  {
    uint64_t v13 = [v11 accessModeAtHome];
    uint64_t v14 = [v11 accessModeNotAtHome];
    __int16 v15 = [(HMDCameraProfileSettingsManager *)self isAnyUserAtHome];
    uint64_t v77 = v15;
    if ([(HMDCameraProfileSettingsManager *)self isCameraManuallyDisabled])
    {
      uint64_t v16 = (void *)MEMORY[0x1D9452090]();
      uint64_t v17 = self;
      int v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        __int16 v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v79 = v19;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Camera is manually disabled, setting current access mode to off", buf, 0xCu);
      }
      uint64_t v20 = 0;
      uint64_t v21 = 5;
    }
    else if (v15)
    {
      int v27 = [v15 BOOLValue];
      uint64_t v28 = 1;
      if (!v27) {
        uint64_t v28 = 2;
      }
      uint64_t v72 = v28;
      if (v27) {
        uint64_t v20 = v13;
      }
      else {
        uint64_t v20 = v14;
      }
      context = (void *)MEMORY[0x1D9452090]();
      uint64_t v29 = self;
      long long v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        __int16 v69 = HMFGetLogIdentifier();
        v68 = HMCameraAccessModeAsString();
        [v77 BOOLValue];
        HMFBooleanToString();
        long long v31 = v67 = v29;
        long long v32 = HMCameraAccessModeAsString();
        __int16 v33 = HMCameraAccessModeAsString();
        *(_DWORD *)buf = 138544386;
        v79 = v69;
        __int16 v80 = 2112;
        v81 = v68;
        __int16 v82 = 2112;
        v83 = v31;
        __int16 v84 = 2112;
        uint64_t v85 = (uint64_t)v32;
        __int16 v86 = 2112;
        v87 = v33;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Determined expected access mode of %@ based on isAnyUserAtHome = %@, accessModeAtHome = %@, accessModeNotAtHome = %@", buf, 0x34u);

        uint64_t v29 = v67;
      }

      if (v7) {
        uint64_t v21 = 4;
      }
      else {
        uint64_t v21 = v72;
      }
    }
    else
    {
      id v34 = (void *)MEMORY[0x1D9452090]();
      __int16 v35 = self;
      long long v36 = HMFGetOSLogHandle();
      BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_INFO);
      if (v13 != v14)
      {
        if (v37)
        {
          v66 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v79 = v66;
          _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@Presence is unavailable; not updating current access mode",
            buf,
            0xCu);
        }
        goto LABEL_49;
      }
      if (v37)
      {
        contexta = HMFGetLogIdentifier();
        __int16 v73 = v34;
        uint64_t v38 = HMCameraAccessModeAsString();
        id v39 = HMCameraAccessModeAsString();
        HMCameraAccessModeAsString();
        *(_DWORD *)buf = 138544130;
        v79 = contexta;
        __int16 v80 = 2112;
        v81 = v38;
        __int16 v82 = 2112;
        v83 = v39;
        v85 = __int16 v84 = 2112;
        uint64_t v40 = (void *)v85;
        _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@Determined expected access mode of %@ because accessModeAtHome (%@) and accessModeNotAtHome (%@) are the same", buf, 0x2Au);

        id v34 = v73;
      }

      uint64_t v21 = 4;
      uint64_t v20 = v13;
    }
    if ((objc_msgSend(v10, "hmbPropertyWasSet:", @"currentAccessModeField", v67) & 1) == 0)
    {
      v41 = (void *)MEMORY[0x1D9452090]();
      v42 = self;
      v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v44 = uint64_t v74 = v21;
        v45 = HMCameraAccessModeAsString();
        *(_DWORD *)buf = 138543618;
        v79 = v44;
        __int16 v80 = 2112;
        v81 = v45;
        _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_INFO, "%{public}@Setting initial currentAccessMode to %@", buf, 0x16u);

        uint64_t v21 = v74;
      }

      [v10 setCurrentAccessMode:v20];
      if (a6) {
        *a6 = 1;
      }
    }
    if (([v10 hmbPropertyWasSet:@"currentAccessModeChangeReasonField"] & 1) == 0)
    {
      v46 = (void *)MEMORY[0x1D9452090]();
      v47 = self;
      v48 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        v49 = HMFGetLogIdentifier();
        [NSNumber numberWithInteger:v21];
        uint64_t v75 = v20;
        v51 = uint64_t v50 = v21;
        *(_DWORD *)buf = 138543618;
        v79 = v49;
        __int16 v80 = 2112;
        v81 = v51;
        _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_INFO, "%{public}@Setting initial currentAccessModeChangeReason to %@", buf, 0x16u);

        uint64_t v21 = v50;
        uint64_t v20 = v75;
      }
      [v10 setCurrentAccessModeChangeReason:v21];
      if (a6) {
        *a6 = 1;
      }
    }
    if ([v10 currentAccessMode] != v20)
    {
      v52 = (void *)MEMORY[0x1D9452090]();
      v53 = self;
      v54 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        id v55 = HMFGetLogIdentifier();
        [v10 currentAccessMode];
        id v56 = HMCameraAccessModeAsString();
        HMCameraAccessModeAsString();
        v76 = v52;
        uint64_t v57 = v20;
        v59 = uint64_t v58 = v21;
        *(_DWORD *)buf = 138543874;
        v79 = v55;
        __int16 v80 = 2112;
        v81 = v56;
        __int16 v82 = 2112;
        v83 = v59;
        _os_log_impl(&dword_1D49D5000, v54, OS_LOG_TYPE_INFO, "%{public}@Changing currentAccessMode field from %@ to %@", buf, 0x20u);

        uint64_t v21 = v58;
        uint64_t v20 = v57;
        v52 = v76;
      }
      [v10 setCurrentAccessMode:v20];
      if ([v10 currentAccessModeChangeReason] != v21)
      {
        id v60 = (void *)MEMORY[0x1D9452090]();
        v61 = v53;
        v62 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          __int16 v63 = HMFGetLogIdentifier();
          id v64 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "currentAccessModeChangeReason"));
          uint64_t v65 = [NSNumber numberWithInteger:v21];
          *(_DWORD *)buf = 138543874;
          v79 = v63;
          __int16 v80 = 2112;
          v81 = v64;
          __int16 v82 = 2112;
          v83 = v65;
          _os_log_impl(&dword_1D49D5000, v62, OS_LOG_TYPE_INFO, "%{public}@Changing currentAccessModeChangeReason from %@ to %@", buf, 0x20u);
        }
        [v10 setCurrentAccessModeChangeReason:v21];
      }
      if (a6) {
        *a6 = 1;
      }
    }
LABEL_49:

    goto LABEL_50;
  }
  __int16 v22 = (void *)MEMORY[0x1D9452090]();
  id v23 = self;
  uint64_t v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    __int16 v25 = HMFGetLogIdentifier();
    id v26 = [v11 debugDescription];
    *(_DWORD *)buf = 138543618;
    v79 = v25;
    __int16 v80 = 2112;
    v81 = v26;
    _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Cannot update currentAccessMode, settings model does not include accessMode values: %@", buf, 0x16u);
  }
LABEL_50:
}

- (id)_updatedDerivedPropertiesModelWithSettingsModel:(id)a3 userInitiated:(BOOL)a4 didCreateModel:(BOOL *)a5
{
  BOOL v6 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v9);

  if (a5) {
    *a5 = 0;
  }
  id v10 = [(HMDCameraProfileSettingsManager *)self zoneManager];
  id v11 = [v10 localZone];
  int v12 = [(HMDCameraProfileSettingsManager *)self derivedPropertiesModelID];
  uint64_t v13 = [v11 fetchModelWithModelID:v12 ofType:objc_opt_class() error:0];

  if (v13)
  {
    uint64_t v14 = 0;
  }
  else
  {
    __int16 v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = HMFGetLogIdentifier();
      int v26 = 138543362;
      int v27 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Creating a new derived properties model because one doesn't exist already", (uint8_t *)&v26, 0xCu);
    }
    __int16 v19 = [HMDCameraProfileSettingsDerivedPropertiesModel alloc];
    uint64_t v20 = [(HMDCameraProfileSettingsManager *)v16 derivedPropertiesModelID];
    uint64_t v21 = [(HMDCameraProfileSettingsManager *)v16 uniqueIdentifier];
    __int16 v22 = [(HMBModel *)v19 initWithModelID:v20 parentModelID:v21];

    id v23 = v22;
    uint64_t v13 = v23;
    if (a5) {
      *a5 = 1;
    }
    uint64_t v14 = v23;
  }
  LOBYTE(v26) = 0;
  [(HMDCameraProfileSettingsManager *)self _populateCurrentAccessModeFieldForDerivedProperties:v13 currentSettings:v8 userInitiated:v6 didUpdateField:&v26];
  if ((_BYTE)v26)
  {
    uint64_t v24 = v13;

    uint64_t v14 = v24;
  }

  return v14;
}

- (void)_updateDerivedPropertiesModelWithSettingsModel:(id)a3 userInitiated:(BOOL)a4 reason:(id)a5
{
  BOOL v6 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = (void *)MEMORY[0x1D9452090]();
  int v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    __int16 v15 = HMFBooleanToString();
    int v24 = 138543874;
    __int16 v25 = v14;
    __int16 v26 = 2112;
    int v27 = v15;
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating derived properties with userInitiated=%@ due to %@", (uint8_t *)&v24, 0x20u);
  }
  LOBYTE(v24) = 0;
  uint64_t v16 = [(HMDCameraProfileSettingsManager *)v12 _updatedDerivedPropertiesModelWithSettingsModel:v8 userInitiated:v6 didCreateModel:&v24];
  if (v16)
  {
    uint64_t v17 = [MEMORY[0x1E4F69EF0] optionsWithLabel:v9];
    int v18 = v24;
    __int16 v19 = [(HMDCameraProfileSettingsManager *)v12 zoneManager];
    uint64_t v20 = [v19 localZone];
    uint64_t v21 = [MEMORY[0x1E4F1CAD0] setWithObject:v16];
    if (v18) {
      id v22 = (id)[v20 createModels:v21 options:v17];
    }
    else {
      id v23 = (id)[v20 updateModels:v21 options:v17];
    }
  }
}

- (BOOL)isCameraManuallyDisabled
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraProfileSettingsManager *)self manuallyDisabledCharacteristic];
  id v5 = v4;
  if (v4)
  {
    BOOL v6 = [v4 value];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v7 = v6;
    }
    else {
      BOOL v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      char v9 = [v8 BOOLValue];
    }
    else
    {
      id v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = self;
      int v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = HMFGetLogIdentifier();
        int v15 = 138543874;
        uint64_t v16 = v13;
        __int16 v17 = 2112;
        int v18 = v5;
        __int16 v19 = 2112;
        uint64_t v20 = 0;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Characteristic %@ has unhandled value type: %@", (uint8_t *)&v15, 0x20u);
      }
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)manuallyDisabledCharacteristic
{
  id v2 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  id v3 = [v2 findCharacteristicType:@"00000227-0000-1000-8000-0026BB765291" forServiceType:*MEMORY[0x1E4F2DDE0]];

  return v3;
}

- (BOOL)_migrateSettingsModel:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 version];
  if (v5 != 1)
  {
    if (v5)
    {
LABEL_12:
      BOOL v17 = 0;
      goto LABEL_16;
    }
    BOOL v6 = [(HMDCameraProfileSettingsManager *)self doorbellInputEventCharacteristic];

    if (v6)
    {
      BOOL v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = self;
      char v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = HMFGetLogIdentifier();
        [v4 recordingEventTriggers];
        id v11 = HMCameraSignificantEventTypesAsString();
        int v24 = 138543618;
        __int16 v25 = v10;
        __int16 v26 = 2112;
        uint64_t v27 = (uint64_t)v11;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Settings are for doorbell camera; adding HMCameraSignificantEventTypePackages to existing recording "
          "event triggers: %@",
          (uint8_t *)&v24,
          0x16u);
      }
      objc_msgSend(v4, "setRecordingEventTriggers:", objc_msgSend(v4, "recordingEventTriggers") | 0x10);
    }
    if ([v4 recordingEventTriggers])
    {
      int v12 = (void *)MEMORY[0x1D9452090]();
      uint64_t v13 = self;
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = HMFGetLogIdentifier();
        [v4 recordingEventTriggers];
        uint64_t v16 = HMCameraSignificantEventTypesAsString();
        int v24 = 138543618;
        __int16 v25 = v15;
        __int16 v26 = 2112;
        uint64_t v27 = (uint64_t)v16;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Settings have Any Motion recording trigger; adding all significant event types to existing recording"
          " event triggers: %@",
          (uint8_t *)&v24,
          0x16u);
      }
      objc_msgSend(v4, "setRecordingEventTriggers:", objc_msgSend(v4, "recordingEventTriggers") | 0x1F);
    }
  }
  if ([v4 version] == 1) {
    goto LABEL_12;
  }
  int v18 = (void *)MEMORY[0x1D9452090]();
  __int16 v19 = self;
  uint64_t v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = HMFGetLogIdentifier();
    uint64_t v22 = [v4 version];
    int v24 = 138543874;
    __int16 v25 = v21;
    __int16 v26 = 2048;
    uint64_t v27 = v22;
    __int16 v28 = 2048;
    uint64_t v29 = 1;
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Updating settings model version from %ld to %ld", (uint8_t *)&v24, 0x20u);
  }
  BOOL v17 = 1;
  [v4 setVersion:1];
LABEL_16:

  return v17;
}

- (BOOL)_migrateNotificationSettings:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 version];
  BOOL v7 = 0;
  if (v6 != 1)
  {
    if (v6) {
      goto LABEL_26;
    }
    id v8 = [(HMDCameraProfileSettingsManager *)self doorbellInputEventCharacteristic];

    if (!v8)
    {
      BOOL v7 = 0;
      goto LABEL_22;
    }
    char v9 = [v4 smartBulletinBoardNotificationCondition];
    if (!v9)
    {
      if (isAppleTV())
      {
        id v23 = (void *)MEMORY[0x1D9452090]();
        int v24 = self;
        __int16 v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          __int16 v26 = HMFGetLogIdentifier();
          int v39 = 138543362;
          uint64_t v40 = v26;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Settings are for doorbell camera but there is no notification condition; enabling significant even"
            "t notifications for HMCameraSignificantEventTypePackages only",
            (uint8_t *)&v39,
            0xCu);
        }
        [(HMDCameraProfileSettingsManager *)v24 _enablePackageNotificationsOnSettings:v4];
        BOOL v7 = 1;
      }
      else
      {
        BOOL v7 = 0;
      }
      goto LABEL_21;
    }
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F2E6C0]) initWithPredicate:v9];
    id v11 = [v10 significantEventReasonCondition];
    uint64_t v12 = [v11 significantEventTypes];

    if (v12)
    {
      uint64_t v13 = (void *)MEMORY[0x1D9452090]();
      uint64_t v14 = self;
      int v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        BOOL v17 = [v10 significantEventReasonCondition];
        int v39 = 138543618;
        uint64_t v40 = v16;
        __int16 v41 = 2112;
        uint64_t v42 = (uint64_t)v17;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Settings are for doorbell camera; adding HMCameraSignificantEventTypePackages to existing significan"
          "t event notification condition: %@",
          (uint8_t *)&v39,
          0x16u);
      }
      int v18 = [v10 significantEventReasonCondition];
      uint64_t v19 = [v18 significantEventTypes] | 0x10;

      uint64_t v20 = (void *)[v10 mutableCopy];
      uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F2E740]) initWithSignificantEventTypes:v19];
      [v20 setSignificantEventReasonCondition:v21];

      uint64_t v22 = [v20 predicate];
      [v4 setSmartBulletinBoardNotificationCondition:v22];
    }
    else
    {
      if (!isAppleTV())
      {
        BOOL v7 = 0;
        goto LABEL_19;
      }
      uint64_t v27 = (void *)MEMORY[0x1D9452090]();
      __int16 v28 = self;
      uint64_t v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        uint64_t v30 = HMFGetLogIdentifier();
        int v39 = 138543362;
        uint64_t v40 = v30;
        _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@Settings are for doorbell camera but there are no significantEventTypes in the condition; enabling s"
          "ignificant event notifications for HMCameraSignificantEventTypePackages only",
          (uint8_t *)&v39,
          0xCu);
      }
      [(HMDCameraProfileSettingsManager *)v28 _enablePackageNotificationsOnSettings:v4];
    }
    BOOL v7 = 1;
LABEL_19:

LABEL_21:
  }
LABEL_22:
  uint64_t v31 = [v4 version];
  uint64_t v32 = *MEMORY[0x1E4F2CD70];
  if (v31 != *MEMORY[0x1E4F2CD70])
  {
    __int16 v33 = (void *)MEMORY[0x1D9452090]();
    id v34 = self;
    __int16 v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      long long v36 = HMFGetLogIdentifier();
      uint64_t v37 = [v4 version];
      int v39 = 138543874;
      uint64_t v40 = v36;
      __int16 v41 = 2048;
      uint64_t v42 = v37;
      __int16 v43 = 2048;
      uint64_t v44 = 1;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_INFO, "%{public}@Updating notification settings version from %ld to %ld", (uint8_t *)&v39, 0x20u);
    }
    [v4 setVersion:v32];
    BOOL v7 = 1;
  }
LABEL_26:

  return v7;
}

- (id)_createNotificationSettingsUsingSettingsModel:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc_init(MEMORY[0x1E4F2E970]);
  int v7 = [v4 hasAnyNotificationFieldsSet];
  id v8 = (void *)MEMORY[0x1D9452090]();
  char v9 = self;
  id v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v11)
    {
      uint64_t v12 = HMFGetLogIdentifier();
      uint64_t v13 = [v4 debugDescription];
      uint64_t v14 = [v4 smartBulletinBoardNotification];
      int v26 = 138543874;
      uint64_t v27 = v12;
      __int16 v28 = 2112;
      id v29 = v13;
      __int16 v30 = 2112;
      uint64_t v31 = v14;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Migrating notification settings from settings model: %@, smart bulletin board notification: %@", (uint8_t *)&v26, 0x20u);
    }
    [v6 setVersion:*MEMORY[0x1E4F2CD70]];
    objc_msgSend(v6, "setAccessModeChangeNotificationEnabled:", objc_msgSend(v4, "accessModeChangeNotificationEnabled"));
    objc_msgSend(v6, "setReachabilityEventNotificationEnabled:", objc_msgSend(v4, "reachabilityEventNotificationEnabled"));
    int v15 = [v4 smartBulletinBoardNotification];
    objc_msgSend(v6, "setSmartBulletinBoardNotificationEnabled:", objc_msgSend(v15, "isEnabled"));

    uint64_t v16 = [v4 smartBulletinBoardNotification];
    BOOL v17 = [v16 condition];
    [v6 setSmartBulletinBoardNotificationCondition:v17];

    int v18 = (void *)MEMORY[0x1D9452090]();
    uint64_t v19 = v9;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      int v26 = 138543618;
      uint64_t v27 = v21;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Migrated to new notification settings: %@", (uint8_t *)&v26, 0x16u);
    }
  }
  else
  {
    if (v11)
    {
      uint64_t v22 = HMFGetLogIdentifier();
      int v26 = 138543362;
      uint64_t v27 = v22;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Creating new notification settings using default values", (uint8_t *)&v26, 0xCu);
    }
    [v6 setVersion:*MEMORY[0x1E4F2CD70]];
    [v6 setAccessModeChangeNotificationEnabled:1];
    [v6 setReachabilityEventNotificationEnabled:1];
    id v23 = [(HMDCameraProfileSettingsManager *)v9 doorbellInputEventCharacteristic];

    if (isAppleTV() && v23) {
      [(HMDCameraProfileSettingsManager *)v9 _enablePackageNotificationsOnSettings:v6];
    }
    else {
      [v6 setSmartBulletinBoardNotificationEnabled:0];
    }
  }
  int v24 = (void *)[v6 copy];

  return v24;
}

- (void)_initializeNotificationSettingsUsingSettingsModel:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  int v7 = v6;
  if (v6)
  {
    id v8 = [v6 cameraProfileNotificationSettings];
    char v9 = (void *)[v8 mutableCopy];

    if (v9)
    {
      if ([(HMDCameraProfileSettingsManager *)self _migrateNotificationSettings:v9]) {
        [v7 updateCameraProfileNotificationSettings:v9];
      }
    }
    else
    {
      uint64_t v14 = [(HMDCameraProfileSettingsManager *)self _createNotificationSettingsUsingSettingsModel:v4];
      [v7 updateCameraProfileNotificationSettings:v14];
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    BOOL v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Accessory reference is nil", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)_synchronizeSettingsModelForBackwardCompatibilityForCharacteristic:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 service];
  id v6 = [v4 type];
  if ([v6 isEqualToString:*MEMORY[0x1E4F2CEE8]])
  {
    int v7 = [v5 type];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F2DDE0]];

    if (v8)
    {
      char v9 = [v4 value];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }
      id v11 = v10;

      if (v11)
      {
        uint64_t v12 = [v11 BOOLValue];
        uint64_t v13 = [(HMDCameraProfileSettingsManager *)self currentSettingsModel];
        int v14 = [v13 snapshotsAllowed];

        if (v12 != v14)
        {
          int v15 = [(HMDCameraProfileSettingsManager *)self _settingsModelForUpdate];
          uint64_t v16 = (void *)MEMORY[0x1D9452090]([v15 setSnapshotsAllowed:v12]);
          uint64_t v17 = self;
          int v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            uint64_t v19 = HMFGetLogIdentifier();
            uint64_t v20 = HMFBooleanToString();
            *(_DWORD *)buf = 138543618;
            v76 = v19;
            __int16 v77 = 2112;
            v78 = v20;
            _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Handling characteristic value change by updating snapshots allowed to %@", buf, 0x16u);
          }
          uint64_t v21 = (void *)MEMORY[0x1E4F69EF0];
          uint64_t v22 = @"Updating snapshots allowed setting in response to characteristic change";
LABEL_44:
          uint64_t v58 = [v21 optionsWithLabel:v22];
          char v59 = [(HMDCameraProfileSettingsManager *)v17 zoneManager];
          id v60 = [v59 localZone];
          v61 = [MEMORY[0x1E4F1CAD0] setWithObject:v15];
          id v62 = (id)[v60 updateModels:v61 options:v58];

          goto LABEL_55;
        }
        goto LABEL_55;
      }
      __int16 v63 = (void *)MEMORY[0x1D9452090]();
      id v64 = self;
      uint64_t v65 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        v66 = HMFGetLogIdentifier();
        __int16 v67 = [v4 value];
        v68 = objc_opt_class();
        id v74 = v68;
        __int16 v69 = [v4 value];
        *(_DWORD *)buf = 138543874;
        v76 = v66;
        __int16 v77 = 2112;
        v78 = v68;
        __int16 v79 = 2112;
        __int16 v80 = v69;
        v70 = "%{public}@HMCharacteristicTypeEventSnapshotsActive characteristic value was of unexpected class %@: %@";
LABEL_53:
        _os_log_impl(&dword_1D49D5000, v65, OS_LOG_TYPE_ERROR, v70, buf, 0x20u);

        goto LABEL_54;
      }
      goto LABEL_54;
    }
  }
  else
  {
  }
  id v23 = [v4 type];
  if ([v23 isEqualToString:*MEMORY[0x1E4F2CE70]])
  {
    int v24 = [v5 type];
    int v25 = [v24 isEqualToString:*MEMORY[0x1E4F2DDE0]];

    if (v25)
    {
      int v26 = [v4 value];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v27 = v26;
      }
      else {
        uint64_t v27 = 0;
      }
      id v11 = v27;

      if (v11)
      {
        uint64_t v28 = [v11 BOOLValue];
        id v29 = [(HMDCameraProfileSettingsManager *)self currentSettingsModel];
        int v30 = [v29 accessModeIndicatorEnabled];

        if (v28 != v30)
        {
          int v15 = [(HMDCameraProfileSettingsManager *)self _settingsModelForUpdate];
          uint64_t v31 = (void *)MEMORY[0x1D9452090]([v15 setAccessModeIndicatorEnabled:v28]);
          uint64_t v17 = self;
          uint64_t v32 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            __int16 v33 = HMFGetLogIdentifier();
            id v34 = HMFBooleanToString();
            *(_DWORD *)buf = 138543618;
            v76 = v33;
            __int16 v77 = 2112;
            v78 = v34;
            _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@Handling characteristic value change by updating access mode indicator enabled to %@", buf, 0x16u);
          }
          uint64_t v21 = (void *)MEMORY[0x1E4F69EF0];
          uint64_t v22 = @"Updating access mode indicator enabled setting in response to characteristic change";
          goto LABEL_44;
        }
LABEL_55:

        goto LABEL_56;
      }
      __int16 v63 = (void *)MEMORY[0x1D9452090]();
      id v64 = self;
      uint64_t v65 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        v66 = HMFGetLogIdentifier();
        __int16 v67 = [v4 value];
        __int16 v71 = objc_opt_class();
        id v74 = v71;
        __int16 v69 = [v4 value];
        *(_DWORD *)buf = 138543874;
        v76 = v66;
        __int16 v77 = 2112;
        v78 = v71;
        __int16 v79 = 2112;
        __int16 v80 = v69;
        v70 = "%{public}@HMCharacteristicTypeCameraOperatingModeIndicator characteristic value was of unexpected class %@: %@";
        goto LABEL_53;
      }
LABEL_54:

      goto LABEL_55;
    }
  }
  else
  {
  }
  __int16 v35 = [v4 type];
  if ([v35 isEqualToString:*MEMORY[0x1E4F2CF50]])
  {
    long long v36 = [v5 type];
    int v37 = [v36 isEqualToString:*MEMORY[0x1E4F2DDE0]];

    if (v37)
    {
      uint64_t v38 = [v4 value];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v39 = v38;
      }
      else {
        int v39 = 0;
      }
      id v11 = v39;

      if (v11)
      {
        uint64_t v40 = [v11 BOOLValue];
        __int16 v41 = [(HMDCameraProfileSettingsManager *)self currentSettingsModel];
        int v42 = [v41 nightVisionModeEnabled];

        if (v40 != v42)
        {
          int v15 = [(HMDCameraProfileSettingsManager *)self _settingsModelForUpdate];
          __int16 v43 = (void *)MEMORY[0x1D9452090]([v15 setNightVisionModeEnabled:v40]);
          uint64_t v17 = self;
          uint64_t v44 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            uint64_t v45 = HMFGetLogIdentifier();
            v46 = HMFBooleanToString();
            *(_DWORD *)buf = 138543618;
            v76 = v45;
            __int16 v77 = 2112;
            v78 = v46;
            _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_INFO, "%{public}@Handling characteristic value change by updating night vision mode enabled to %@", buf, 0x16u);
          }
          uint64_t v21 = (void *)MEMORY[0x1E4F69EF0];
          uint64_t v22 = @"Updating night vision mode enabled setting in response to characteristic change";
          goto LABEL_44;
        }
        goto LABEL_55;
      }
      __int16 v63 = (void *)MEMORY[0x1D9452090]();
      id v64 = self;
      uint64_t v65 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        v66 = HMFGetLogIdentifier();
        __int16 v67 = [v4 value];
        uint64_t v72 = objc_opt_class();
        id v74 = v72;
        __int16 v69 = [v4 value];
        *(_DWORD *)buf = 138543874;
        v76 = v66;
        __int16 v77 = 2112;
        v78 = v72;
        __int16 v79 = 2112;
        __int16 v80 = v69;
        v70 = "%{public}@HMCharacteristicTypeNightVision characteristic value was of unexpected class %@: %@";
        goto LABEL_53;
      }
      goto LABEL_54;
    }
  }
  else
  {
  }
  id v11 = [v4 type];
  if (([v11 isEqualToString:*MEMORY[0x1E4F2CF78]] & 1) == 0) {
    goto LABEL_55;
  }
  v47 = [v5 type];
  int v48 = [v47 isEqualToString:*MEMORY[0x1E4F2DDF0]];

  if (v48)
  {
    v49 = [v4 value];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v50 = v49;
    }
    else {
      uint64_t v50 = 0;
    }
    id v11 = v50;

    if (v11)
    {
      uint64_t v51 = [v11 BOOLValue];
      v52 = [(HMDCameraProfileSettingsManager *)self currentSettingsModel];
      int v53 = [v52 recordingAudioEnabled];

      if (v51 != v53)
      {
        int v15 = [(HMDCameraProfileSettingsManager *)self _settingsModelForUpdate];
        v54 = (void *)MEMORY[0x1D9452090]([v15 setRecordingAudioEnabled:v51]);
        uint64_t v17 = self;
        id v55 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          id v56 = HMFGetLogIdentifier();
          uint64_t v57 = HMFBooleanToString();
          *(_DWORD *)buf = 138543618;
          v76 = v56;
          __int16 v77 = 2112;
          v78 = v57;
          _os_log_impl(&dword_1D49D5000, v55, OS_LOG_TYPE_INFO, "%{public}@Handling characteristic value change by updating recording audio enabled to %@", buf, 0x16u);
        }
        uint64_t v21 = (void *)MEMORY[0x1E4F69EF0];
        uint64_t v22 = @"Updating recording audio enabled setting in response to characteristic change";
        goto LABEL_44;
      }
      goto LABEL_55;
    }
    __int16 v63 = (void *)MEMORY[0x1D9452090]();
    id v64 = self;
    uint64_t v65 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v66 = HMFGetLogIdentifier();
      __int16 v67 = [v4 value];
      __int16 v73 = objc_opt_class();
      id v74 = v73;
      __int16 v69 = [v4 value];
      *(_DWORD *)buf = 138543874;
      v76 = v66;
      __int16 v77 = 2112;
      v78 = v73;
      __int16 v79 = 2112;
      __int16 v80 = v69;
      v70 = "%{public}@HMCharacteristicTypeRecordingAudioActive characteristic value was of unexpected class %@: %@";
      goto LABEL_53;
    }
    goto LABEL_54;
  }
LABEL_56:
}

- (id)_localZoneUpdateCompletionForMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __72__HMDCameraProfileSettingsManager__localZoneUpdateCompletionForMessage___block_invoke;
  v9[3] = &unk_1E6A15508;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  int v7 = _Block_copy(v9);

  return v7;
}

void __72__HMDCameraProfileSettingsManager__localZoneUpdateCompletionForMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) workQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__HMDCameraProfileSettingsManager__localZoneUpdateCompletionForMessage___block_invoke_2;
  v12[3] = &unk_1E6A18668;
  uint64_t v8 = *(void *)(a1 + 32);
  char v9 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v8;
  id v15 = v9;
  id v16 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

void __72__HMDCameraProfileSettingsManager__localZoneUpdateCompletionForMessage___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 40);
  id v5 = HMFGetOSLogHandle();
  id v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = HMFGetLogIdentifier();
      uint64_t v8 = [*(id *)(a1 + 48) name];
      int v14 = 138543618;
      id v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Updated settings for message %@", (uint8_t *)&v14, 0x16u);
    }
    [*(id *)(a1 + 48) respondWithSuccess];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      char v9 = HMFGetLogIdentifier();
      id v10 = [*(id *)(a1 + 48) name];
      uint64_t v11 = *(void *)(a1 + 56);
      int v14 = 138543874;
      id v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update settings for message %@: %@", (uint8_t *)&v14, 0x20u);
    }
    uint64_t v12 = *(void **)(a1 + 48);
    id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    [v12 respondWithError:v13];
  }
}

- (id)_processingOptionsForLabel:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [MEMORY[0x1E4F69EF0] optionsWithLabel:v4];

  int v7 = [(HMDCameraProfileSettingsManager *)self zoneManager];
  uint64_t v8 = [v7 defaultConfiguration];
  objc_msgSend(v6, "setShouldEnqueueMirrorOutput:", objc_msgSend(v8, "isZoneOwner"));

  return v6;
}

- (void)_handleConnectedToAccessory
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Connected to accessory", (uint8_t *)&v9, 0xCu);
  }
  [(HMDCameraProfileSettingsManager *)v5 _setManuallyDisabledCharacteristicNotificationsEnabled:1];
  if ([(HMDCameraProfileSettingsManager *)v5 isCurrentDeviceConfirmedPrimaryResident])
  {
    uint64_t v8 = [(HMDCameraProfileSettingsManager *)v5 currentSettingsModel];
    [(HMDCameraProfileSettingsManager *)v5 _updateDerivedPropertiesModelWithSettingsModel:v8 userInitiated:0 reason:@"Accessory became reachable"];

    [(HMDCameraProfileSettingsManager *)v5 _synchronizeCurrentAccessModeSettingToCameraWithCompletion:0];
    if ([(HMDCameraProfileSettingsManager *)v5 needsInitialSettingsCharacteristicSynchronization])
    {
      [(HMDCameraProfileSettingsManager *)v5 _writeInitialSettingsCharacteristicsToCamera];
    }
  }
}

- (void)handleBulletinNotificationEnableStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __94__HMDCameraProfileSettingsManager_handleBulletinNotificationEnableStateDidChangeNotification___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __94__HMDCameraProfileSettingsManager_handleBulletinNotificationEnableStateDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    [*(id *)(a1 + 40) _coordinateNotificationSettingsWithServiceBulletinNotification:v4];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 40);
    int v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = [*(id *)(a1 + 32) name];
      id v10 = [*(id *)(a1 + 32) object];
      int v11 = 138543874;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      int v14 = v9;
      __int16 v15 = 2112;
      __int16 v16 = v10;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unexpected notification object for %@: %@", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)handleUserRemoteAccessDidChangeNotification:(id)a3
{
  id v4 = [(HMDCameraProfileSettingsManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__HMDCameraProfileSettingsManager_handleUserRemoteAccessDidChangeNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __79__HMDCameraProfileSettingsManager_handleUserRemoteAccessDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Current user's remote access changed, so notifying clients of current settings", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _notifyClientsOfCurrentSettings];
}

- (void)handleCharacteristicsChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __76__HMDCameraProfileSettingsManager_handleCharacteristicsChangedNotification___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __76__HMDCameraProfileSettingsManager_handleCharacteristicsChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kModifiedCharacteristicsKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
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
        objc_msgSend(*(id *)(a1 + 40), "_synchronizeSettingsModelForBackwardCompatibilityForCharacteristic:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)handleCharacteristicsValueUpdatedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __81__HMDCameraProfileSettingsManager_handleCharacteristicsValueUpdatedNotification___block_invoke;
  v7[3] = &unk_1E6A197C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __81__HMDCameraProfileSettingsManager_handleCharacteristicsValueUpdatedNotification___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isCurrentDeviceConfirmedPrimaryResident])
  {
    uint64_t v2 = [*(id *)(a1 + 40) userInfo];
    id v3 = [v2 objectForKeyedSubscript:@"HMDNotificationCharacteristicValueUpdatedChangedCharacteristicsKey"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
    id v5 = v4;

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v23;
      *(void *)&long long v7 = 138543618;
      long long v20 = v7;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(obj);
          }
          long long v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          long long v12 = objc_msgSend(v11, "type", v20);
          int v13 = [v12 isEqual:@"00000227-0000-1000-8000-0026BB765291"];

          if (v13)
          {
            long long v14 = (void *)MEMORY[0x1D9452090]();
            id v15 = *(id *)(a1 + 32);
            uint64_t v16 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              uint64_t v17 = HMFGetLogIdentifier();
              *(_DWORD *)buf = v20;
              uint64_t v27 = v17;
              __int16 v28 = 2112;
              id v29 = v11;
              _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Handling Manually Disabled characteristic change: %@", buf, 0x16u);
            }
            __int16 v18 = *(void **)(a1 + 32);
            uint64_t v19 = [v18 currentSettingsModel];
            [v18 _updateDerivedPropertiesModelWithSettingsModel:v19 userInitiated:1 reason:@"Manually disabled characteristic"];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v8);
    }
  }
}

- (void)handleRecordingManagementServiceDidUpdateNotification:(id)a3
{
  id v4 = [(HMDCameraProfileSettingsManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__HMDCameraProfileSettingsManager_handleRecordingManagementServiceDidUpdateNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __89__HMDCameraProfileSettingsManager_handleRecordingManagementServiceDidUpdateNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) hapAccessory];
  int v3 = [v2 isReachable];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    [v4 _handleConnectedToAccessory];
  }
}

- (void)handleAccessoryConfiguredNotification:(id)a3
{
  id v4 = [(HMDCameraProfileSettingsManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__HMDCameraProfileSettingsManager_handleAccessoryConfiguredNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __73__HMDCameraProfileSettingsManager_handleAccessoryConfiguredNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleConnectedToAccessory];
}

- (id)_isAnyUserAtHomeForPresence:(id)a3
{
  id v3 = a3;
  if ([v3 hasPresenceRegionForAllUsers])
  {
    id v4 = NSNumber;
    uint64_t v5 = [v3 isAnyUserAtHome];

    uint64_t v6 = [v4 numberWithBool:v5];
  }
  else
  {
    int v7 = [v3 isAnyUserAtHome];

    if (v7) {
      uint64_t v6 = (void *)MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v6 = 0;
    }
  }
  return v6;
}

- (BOOL)_setAnyUserAtHomeFromPresenceMonitorWithHome:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 presenceMonitor];
  int v7 = [v6 currentHomePresence];

  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    long long v11 = HMFGetLogIdentifier();
    int v26 = 138543618;
    uint64_t v27 = v11;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Evaluating home presence: %@", (uint8_t *)&v26, 0x16u);
  }
  if (v7)
  {
    long long v12 = [(HMDCameraProfileSettingsManager *)v9 _isAnyUserAtHomeForPresence:v7];
    int v13 = [(HMDCameraProfileSettingsManager *)v9 isAnyUserAtHome];
    char v14 = HMFEqualObjects();

    if ((v14 & 1) == 0)
    {
      id v15 = (void *)MEMORY[0x1D9452090]();
      uint64_t v16 = v9;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v18 = HMFGetLogIdentifier();
        uint64_t v19 = [(HMDCameraProfileSettingsManager *)v16 isAnyUserAtHome];
        int v26 = 138543874;
        uint64_t v27 = v18;
        __int16 v28 = 2112;
        id v29 = v19;
        __int16 v30 = 2112;
        uint64_t v31 = v12;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Updating isAnyUserAtHome from %@ to %@", (uint8_t *)&v26, 0x20u);
      }
      [(HMDCameraProfileSettingsManager *)v16 setAnyUserAtHome:v12];
    }
    char v20 = v14 ^ 1;
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x1D9452090]();
    long long v22 = v9;
    long long v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      long long v24 = HMFGetLogIdentifier();
      int v26 = 138543362;
      uint64_t v27 = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Presence is unavailable; setting isAnyUserAtHome to nil",
        (uint8_t *)&v26,
        0xCu);
    }
    [(HMDCameraProfileSettingsManager *)v22 setAnyUserAtHome:0];
    char v20 = 0;
  }

  return v20;
}

- (BOOL)_evaluateHomePresence
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  uint64_t v5 = [v4 home];

  if (v5)
  {
    BOOL v6 = [(HMDCameraProfileSettingsManager *)self _setAnyUserAtHomeFromPresenceMonitorWithHome:v5];
  }
  else
  {
    int v7 = (void *)MEMORY[0x1D9452090]();
    uint64_t v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      int v13 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Home is nil; setting isAnyUserAtHome to nil",
        (uint8_t *)&v12,
        0xCu);
    }
    [(HMDCameraProfileSettingsManager *)v8 setAnyUserAtHome:0];
    BOOL v6 = 0;
  }

  return v6;
}

- (void)handleHomePresenceEvaluatedNotification:(id)a3
{
  if ([(HMDCameraProfileSettingsManager *)self isCurrentDeviceConfirmedPrimaryResident])
  {
    id v4 = [(HMDCameraProfileSettingsManager *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__HMDCameraProfileSettingsManager_handleHomePresenceEvaluatedNotification___block_invoke;
    block[3] = &unk_1E6A19B30;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

void __75__HMDCameraProfileSettingsManager_handleHomePresenceEvaluatedNotification___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    int v8 = 138543362;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received Home Presence Evaluated", (uint8_t *)&v8, 0xCu);
  }
  if ([*(id *)(a1 + 32) _evaluateHomePresence])
  {
    BOOL v6 = *(void **)(a1 + 32);
    int v7 = [v6 currentSettingsModel];
    [v6 _updateDerivedPropertiesModelWithSettingsModel:v7 userInitiated:0 reason:@"Presence changed"];
  }
}

- (void)handlePrimaryResidentUpdatedNotification:(id)a3
{
  id v4 = [(HMDCameraProfileSettingsManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__HMDCameraProfileSettingsManager_handlePrimaryResidentUpdatedNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __76__HMDCameraProfileSettingsManager_handlePrimaryResidentUpdatedNotification___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) isCurrentDeviceConfirmedPrimaryResident];
  id v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v6)
    {
      int v7 = HMFGetLogIdentifier();
      int v12 = 138543362;
      int v13 = v7;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@We are now the primary resident", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(a1 + 32) _evaluateHomePresence];
    int v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v8 currentSettingsModel];
    [v8 _updateDerivedPropertiesModelWithSettingsModel:v9 userInitiated:0 reason:@"Current device became primary resident"];

    return [*(id *)(a1 + 32) _synchronizeCurrentAccessModeSettingToCameraWithCompletion:0];
  }
  else
  {
    if (v6)
    {
      long long v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      int v13 = v11;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Another device is primary resident, clearing anyUserAtHome", (uint8_t *)&v12, 0xCu);
    }
    return [*(id *)(a1 + 32) setAnyUserAtHome:0];
  }
}

- (void)_handleUpdateReachabilityEventNotificationEnabledMessage:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)MEMORY[0x1D9452090]();
  int v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v34 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Processing request to change reachability event notification enabled", buf, 0xCu);
  }
  uint64_t v10 = [(HMDCameraProfileSettingsManager *)v7 hapAccessory];
  long long v11 = [v10 home];
  char v12 = [v11 bulletinNotificationsSupported];

  if (v12)
  {
    int v13 = [v4 messagePayload];
    uint64_t v14 = objc_msgSend(v13, "hmf_BOOLForKey:", *MEMORY[0x1E4F2CDA8]);

    id v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = v7;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = HMFGetLogIdentifier();
      uint64_t v19 = HMFEnabledStatusToString();
      *(_DWORD *)buf = 138543618;
      id v34 = v18;
      __int16 v35 = 2112;
      long long v36 = v19;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Registering reachability event notifications as %@", buf, 0x16u);
    }
    char v20 = [(HMDCameraProfileSettingsManager *)v16 currentNotificationSettings];
    uint64_t v21 = (void *)[v20 mutableCopy];

    [v21 setReachabilityEventNotificationEnabled:v14];
    long long v22 = [(HMDCameraProfileSettingsManager *)v16 hapAccessory];
    long long v23 = [v22 home];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __92__HMDCameraProfileSettingsManager__handleUpdateReachabilityEventNotificationEnabledMessage___block_invoke;
    v29[3] = &unk_1E6A154D8;
    v29[4] = v16;
    char v32 = v14;
    id v30 = v4;
    id v31 = v21;
    id v24 = v21;
    [v23 setCameraReachabilityEventNotificationsEnabled:v14 forAccessory:v22 completionHandler:v29];
  }
  else
  {
    long long v25 = (void *)MEMORY[0x1D9452090]();
    int v26 = v7;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      __int16 v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v34 = v28;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Camera reachability notification cannot be modified when bulletin notifications are not supported.", buf, 0xCu);
    }
    long long v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v22];
  }
}

void __92__HMDCameraProfileSettingsManager__handleUpdateReachabilityEventNotificationEnabledMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__HMDCameraProfileSettingsManager__handleUpdateReachabilityEventNotificationEnabledMessage___block_invoke_2;
  block[3] = &unk_1E6A154B0;
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  char v13 = *(unsigned char *)(a1 + 56);
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v7 = v3;
  dispatch_async(v4, block);
}

uint64_t __92__HMDCameraProfileSettingsManager__handleUpdateReachabilityEventNotificationEnabledMessage___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = HMFGetOSLogHandle();
  BOOL v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = HMFBooleanToString();
      int v12 = 138543618;
      char v13 = v7;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update reachability event notification enabled to %@", (uint8_t *)&v12, 0x16u);
    }
    return [*(id *)(a1 + 48) respondWithError:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      id v11 = HMFBooleanToString();
      int v12 = 138543618;
      char v13 = v10;
      __int16 v14 = 2112;
      id v15 = v11;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Updating reachability event notification enabled to %@", (uint8_t *)&v12, 0x16u);
    }
    return [*(id *)(a1 + 40) _updateNotificationSettings:*(void *)(a1 + 56) forMessage:*(void *)(a1 + 48)];
  }
}

- (void)_handleUpdateActivityZonesMessage:(id)a3
{
  v61[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v56 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Processing request to update activity zones", buf, 0xCu);
  }
  if (([(HMDCameraProfileSettingsManager *)v7 supportedFeatures] & 2) == 0)
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = v7;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      char v13 = HMFGetLogIdentifier();
      [(HMDCameraProfileSettingsManager *)v11 supportedFeatures];
      __int16 v14 = HMCameraSupportedFeaturesAsString();
      *(_DWORD *)buf = 138543618;
      id v56 = v13;
      __int16 v57 = 2112;
      id v58 = v14;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Accessory with supported features: %@ does not support recording", buf, 0x16u);
    }
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = 48;
LABEL_16:
    uint64_t v19 = [v15 hmErrorWithCode:v16];
    [v4 respondWithError:v19];
    goto LABEL_25;
  }
  uint64_t v17 = [(HMDCameraProfileSettingsManager *)v7 zoneManager];
  __int16 v18 = [v17 localZone];

  if (!v18)
  {
    uint64_t v40 = (void *)MEMORY[0x1D9452090]();
    __int16 v41 = v7;
    int v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      __int16 v43 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v56 = v43;
      _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_ERROR, "%{public}@Local zone not ready", buf, 0xCu);
    }
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = -1;
    goto LABEL_16;
  }
  uint64_t v19 = [v4 dataForKey:*MEMORY[0x1E4F2CDD0]];
  if (v19)
  {
    char v20 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
    v61[0] = objc_opt_class();
    v61[1] = objc_opt_class();
    long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
    long long v23 = [v21 setWithArray:v22];
    id v54 = 0;
    id v24 = [v20 unarchivedObjectOfClasses:v23 fromData:v19 error:&v54];
    id v25 = v54;

    if (v24)
    {
      id v53 = v25;
      uint64_t v26 = [v4 BOOLForKey:*MEMORY[0x1E4F2CD88]];
      uint64_t v27 = [(HMDCameraProfileSettingsManager *)v7 currentSettingsModel];
      [v27 setActivityZones:v24];
      __int16 v28 = (void *)MEMORY[0x1D9452090]([v27 setActivityZonesIncludedForSignificantEventDetection:v26]);
      id v29 = v7;
      id v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        id v31 = HMFGetLogIdentifier();
        char v32 = HMFBooleanToString();
        *(_DWORD *)buf = 138543874;
        id v56 = v31;
        __int16 v57 = 2112;
        id v58 = v24;
        __int16 v59 = 2112;
        id v60 = v32;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Updating activity zones: %@ activityZonesIncludedForSignificantEventDetection: %@", buf, 0x20u);
      }
      __int16 v33 = [(HMDCameraProfileSettingsManager *)v29 _processingOptionsForLabel:@"Update camera activity zones"];
      id v34 = [(HMDCameraProfileSettingsManager *)v29 zoneManager];
      __int16 v35 = [v34 localZone];
      long long v36 = [MEMORY[0x1E4F1CAD0] setWithObject:v27];
      uint64_t v37 = [v35 addModels:v36 options:v33];
      uint64_t v38 = [(HMDCameraProfileSettingsManager *)v29 _localZoneUpdateCompletionForMessage:v4];
      id v39 = (id)[v37 addCompletionBlock:v38];

      id v25 = v53;
    }
    else
    {
      v49 = (void *)MEMORY[0x1D9452090]();
      uint64_t v50 = v7;
      uint64_t v51 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v52 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v56 = v52;
        __int16 v57 = 2112;
        id v58 = v25;
        _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize activity zones: %@", buf, 0x16u);
      }
      uint64_t v27 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      [v4 respondWithError:v27];
    }
  }
  else
  {
    uint64_t v44 = (void *)MEMORY[0x1D9452090]();
    uint64_t v45 = v7;
    v46 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v47 = HMFGetLogIdentifier();
      int v48 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      id v56 = v47;
      __int16 v57 = 2112;
      id v58 = v48;
      _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_ERROR, "%{public}@Could not find activity zones in message payload: %@", buf, 0x16u);
    }
    id v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v4 respondWithError:v25];
  }

LABEL_25:
}

- (void)_handleBulletinBoardNotificationCommitMessage:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v31 = 138543362;
    char v32 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Processing request to change bulletin board", (uint8_t *)&v31, 0xCu);
  }
  uint64_t v10 = [(HMDCameraProfileSettingsManager *)v7 hapAccessory];
  id v11 = [v10 home];
  char v12 = [v11 bulletinNotificationsSupported];

  if ((v12 & 1) == 0)
  {
    char v13 = (void *)MEMORY[0x1D9452090]();
    __int16 v14 = v7;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v31 = 138543362;
      char v32 = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Bulletin board notification cannot be modified when bulletin notifications are not supported.", (uint8_t *)&v31, 0xCu);
      goto LABEL_9;
    }
LABEL_10:

    __int16 v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v18];
    goto LABEL_19;
  }
  if (([(HMDCameraProfileSettingsManager *)v7 supportedFeatures] & 2) == 0)
  {
    char v13 = (void *)MEMORY[0x1D9452090]();
    __int16 v14 = v7;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      [(HMDCameraProfileSettingsManager *)v14 supportedFeatures];
      uint64_t v17 = HMCameraSupportedFeaturesAsString();
      int v31 = 138543618;
      char v32 = v16;
      __int16 v33 = 2112;
      id v34 = v17;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Accessory with supported features: %@ does not support recording", (uint8_t *)&v31, 0x16u);

LABEL_9:
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  uint64_t v19 = (void *)*MEMORY[0x1E4F2EC98];
  __int16 v18 = [v4 numberForKey:*MEMORY[0x1E4F2EC98]];
  if (v18)
  {
    char v20 = [v4 predicateForKey:*MEMORY[0x1E4F2EC90]];
    uint64_t v21 = (void *)MEMORY[0x1D9452090]();
    long long v22 = v7;
    long long v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = HMFGetLogIdentifier();
      int v31 = 138543874;
      char v32 = v24;
      __int16 v33 = 2112;
      id v34 = v18;
      __int16 v35 = 2112;
      long long v36 = v20;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating smart bulletin board notification to enabled: %@, condition: %@", (uint8_t *)&v31, 0x20u);
    }
    id v25 = [(HMDCameraProfileSettingsManager *)v22 currentNotificationSettings];
    uint64_t v26 = (void *)[v25 mutableCopy];

    objc_msgSend(v26, "setSmartBulletinBoardNotificationEnabled:", objc_msgSend(v18, "BOOLValue"));
    [v26 setSmartBulletinBoardNotificationCondition:v20];
    [(HMDCameraProfileSettingsManager *)v22 _updateNotificationSettings:v26 forMessage:v4];
  }
  else
  {
    uint64_t v27 = (void *)MEMORY[0x1D9452090]();
    __int16 v28 = v7;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v30 = HMFGetLogIdentifier();
      int v31 = 138543618;
      char v32 = v30;
      __int16 v33 = 2112;
      id v34 = v19;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Bulletin board commit message missing key: %@", (uint8_t *)&v31, 0x16u);
    }
    char v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v4 respondWithError:v20];
  }

LABEL_19:
}

- (void)_handleUpdateAccessModeChangeNotificationEnabledMessage:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v26 = 138543362;
    uint64_t v27 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Processing request to change access mode change notification enabled", (uint8_t *)&v26, 0xCu);
  }
  uint64_t v10 = [(HMDCameraProfileSettingsManager *)v7 hapAccessory];
  id v11 = [v10 home];
  char v12 = [v11 bulletinNotificationsSupported];

  if ((v12 & 1) == 0)
  {
    char v13 = (void *)MEMORY[0x1D9452090]();
    __int16 v14 = v7;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v26 = 138543362;
      uint64_t v27 = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Access mode change notification cannot be modified when bulletin notifications are not supported.", (uint8_t *)&v26, 0xCu);
      goto LABEL_10;
    }
LABEL_11:

    __int16 v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v18];
    goto LABEL_15;
  }
  if (([(HMDCameraProfileSettingsManager *)v7 supportedFeatures] & 1) == 0
    && ([(HMDCameraProfileSettingsManager *)v7 supportedFeatures] & 4) == 0)
  {
    char v13 = (void *)MEMORY[0x1D9452090]();
    __int16 v14 = v7;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      [(HMDCameraProfileSettingsManager *)v14 supportedFeatures];
      uint64_t v17 = HMCameraSupportedFeaturesAsString();
      int v26 = 138543618;
      uint64_t v27 = v16;
      __int16 v28 = 2112;
      id v29 = v17;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Accessory with supported features: %@ support neither streaming nor recording access control.", (uint8_t *)&v26, 0x16u);

LABEL_10:
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  uint64_t v19 = [v4 BOOLForKey:*MEMORY[0x1E4F2CD78]];
  char v20 = (void *)MEMORY[0x1D9452090]();
  uint64_t v21 = v7;
  long long v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    long long v23 = HMFGetLogIdentifier();
    id v24 = HMFBooleanToString();
    int v26 = 138543618;
    uint64_t v27 = v23;
    __int16 v28 = 2112;
    id v29 = v24;
    _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating access mode change notification enabled to %@", (uint8_t *)&v26, 0x16u);
  }
  id v25 = [(HMDCameraProfileSettingsManager *)v21 currentNotificationSettings];
  __int16 v18 = (void *)[v25 mutableCopy];

  [v18 setAccessModeChangeNotificationEnabled:v19];
  [(HMDCameraProfileSettingsManager *)v21 _updateNotificationSettings:v18 forMessage:v4];
LABEL_15:
}

- (void)_handleUpdateRecordingTriggerEventsMessage:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v41 = 138543362;
    int v42 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Processing request to change recording trigger events", (uint8_t *)&v41, 0xCu);
  }
  if (([(HMDCameraProfileSettingsManager *)v7 supportedFeatures] & 2) == 0)
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = v7;
    char v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      char v13 = HMFGetLogIdentifier();
      [(HMDCameraProfileSettingsManager *)v11 supportedFeatures];
      __int16 v14 = HMCameraSupportedFeaturesAsString();
      int v41 = 138543618;
      int v42 = v13;
      __int16 v43 = 2112;
      uint64_t v44 = v14;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Accessory with supported features: %@ does not support recording", (uint8_t *)&v41, 0x16u);
    }
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = 48;
LABEL_15:
    uint64_t v19 = [v15 hmErrorWithCode:v16];
    [v4 respondWithError:v19];
    goto LABEL_20;
  }
  uint64_t v17 = [(HMDCameraProfileSettingsManager *)v7 zoneManager];
  __int16 v18 = [v17 localZone];

  if (!v18)
  {
    __int16 v33 = (void *)MEMORY[0x1D9452090]();
    id v34 = v7;
    __int16 v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      long long v36 = HMFGetLogIdentifier();
      int v41 = 138543362;
      int v42 = v36;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Local zone not ready", (uint8_t *)&v41, 0xCu);
    }
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = -1;
    goto LABEL_15;
  }
  uint64_t v19 = [v4 numberForKey:*MEMORY[0x1E4F2CDB0]];
  if (v19)
  {
    char v20 = [(HMDCameraProfileSettingsManager *)v7 currentSettingsModel];
    uint64_t v21 = (void *)MEMORY[0x1D9452090](objc_msgSend(v20, "setRecordingEventTriggers:", objc_msgSend(v20, "recordingEventTriggers") & 0xFFFFFFFFFFFFFFE0 | objc_msgSend(v19, "unsignedIntegerValue") & 0x1F));
    long long v22 = v7;
    long long v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = HMFGetLogIdentifier();
      id v25 = HMCameraSignificantEventTypesAsString();
      int v41 = 138543618;
      int v42 = v24;
      __int16 v43 = 2112;
      uint64_t v44 = v25;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating recordingTriggerEvents to %@", (uint8_t *)&v41, 0x16u);
    }
    int v26 = [(HMDCameraProfileSettingsManager *)v22 _processingOptionsForLabel:@"Update camera recording trigger events"];
    uint64_t v27 = [(HMDCameraProfileSettingsManager *)v22 zoneManager];
    __int16 v28 = [v27 localZone];
    id v29 = [MEMORY[0x1E4F1CAD0] setWithObject:v20];
    uint64_t v30 = [v28 addModels:v29 options:v26];
    int v31 = [(HMDCameraProfileSettingsManager *)v22 _localZoneUpdateCompletionForMessage:v4];
    id v32 = (id)[v30 addCompletionBlock:v31];
  }
  else
  {
    uint64_t v37 = (void *)MEMORY[0x1D9452090]();
    uint64_t v38 = v7;
    id v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = HMFGetLogIdentifier();
      int v41 = 138543874;
      int v42 = v40;
      __int16 v43 = 2112;
      uint64_t v44 = 0;
      __int16 v45 = 2112;
      id v46 = v4;
      _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@Invalid parameter: %@ for message: %@", (uint8_t *)&v41, 0x20u);
    }
    char v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v4 respondWithError:v20];
  }

LABEL_20:
}

- (void)_handleSynchronizeCloudStorageWithRecordingAccessModesMessage:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v11 = 138543362;
    char v12 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Processing remote request to synchronize cloud storage with recording access modes", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v10 = [(HMDCameraProfileSettingsManager *)v7 quotaCoordinator];
  [v10 synchronizeCloudStorageWithRecordingAccessModes];
}

- (void)_handleUpdateAccessModeMessage:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v75 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Processing request to change access mode", buf, 0xCu);
  }
  uint64_t v10 = [v4 numberForKey:*MEMORY[0x1E4F2CD80]];
  uint64_t v11 = [v4 numberForKey:*MEMORY[0x1E4F2CDA0]];
  char v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    __int16 v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = v7;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      __int16 v18 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      uint64_t v75 = v17;
      __int16 v76 = 2112;
      unint64_t v77 = (unint64_t)v18;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Cannot find required parameters in message payload: %@", buf, 0x16u);
    }
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = 20;
    goto LABEL_24;
  }
  unint64_t v21 = [v10 unsignedIntegerValue];
  uint64_t v22 = [v12 unsignedIntegerValue];
  uint64_t v23 = v22;
  if ((unint64_t)(v22 - 3) >= 2)
  {
    int v31 = (void *)MEMORY[0x1D9452090]();
    id v32 = v7;
    __int16 v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      id v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v75 = v34;
      __int16 v76 = 2048;
      unint64_t v77 = v23;
      _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Invalid presence type enum value received: %ld", buf, 0x16u);
    }
    goto LABEL_23;
  }
  if (v21 >= 4)
  {
    int v31 = (void *)MEMORY[0x1D9452090]();
    __int16 v35 = v7;
    long long v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v75 = v37;
      __int16 v76 = 2048;
      unint64_t v77 = v21;
      _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_ERROR, "%{public}@Invalid access mode enum value received: %ld", buf, 0x16u);
    }
LABEL_23:
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = 3;
LABEL_24:
    uint64_t v38 = [v19 hmErrorWithCode:v20];
    [v4 respondWithError:v38];
    goto LABEL_25;
  }
  if (HMIsRecordingAllowedForCameraAccessMode()
    && ([(HMDCameraProfileSettingsManager *)v7 supportedFeatures] & 2) == 0)
  {
    id v24 = (void *)MEMORY[0x1D9452090]();
    id v25 = v7;
    int v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      __int16 v28 = HMCameraAccessModeAsString();
      [(HMDCameraProfileSettingsManager *)v25 supportedFeatures];
      id v29 = HMCameraSupportedFeaturesAsString();
      *(_DWORD *)buf = 138543874;
      uint64_t v75 = v27;
      __int16 v76 = 2112;
      unint64_t v77 = (unint64_t)v28;
      __int16 v78 = 2112;
      __int16 v79 = v29;
      uint64_t v30 = "%{public}@Requested access mode %@ enables recording but supported features do not include recording: %@";
LABEL_30:
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, v30, buf, 0x20u);

      goto LABEL_31;
    }
    goto LABEL_31;
  }
  if (HMIsStreamingAllowedForCameraAccessMode()
    && ([(HMDCameraProfileSettingsManager *)v7 supportedFeatures] & 1) == 0)
  {
    id v24 = (void *)MEMORY[0x1D9452090]();
    id v25 = v7;
    int v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      __int16 v28 = HMCameraAccessModeAsString();
      [(HMDCameraProfileSettingsManager *)v25 supportedFeatures];
      id v29 = HMCameraSupportedFeaturesAsString();
      *(_DWORD *)buf = 138543874;
      uint64_t v75 = v27;
      __int16 v76 = 2112;
      unint64_t v77 = (unint64_t)v28;
      __int16 v78 = 2112;
      __int16 v79 = v29;
      uint64_t v30 = "%{public}@Requested access mode %@ enables streaming but supported features do not include streaming: %@";
      goto LABEL_30;
    }
LABEL_31:

    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = 48;
    goto LABEL_24;
  }
  id v39 = [(HMDCameraProfileSettingsManager *)v7 hapAccessory];
  uint64_t v40 = [v39 home];
  uint64_t v38 = [v40 primaryResident];

  if (v38)
  {
    if ([v38 isCurrentDevice])
    {
      int v41 = [(HMDCameraProfileSettingsManager *)v7 zoneManager];
      int v42 = [v41 localZone];

      if (v42)
      {
        __int16 v43 = [(HMDCameraProfileSettingsManager *)v7 quotaCoordinator];
        v68[0] = MEMORY[0x1E4F143A8];
        v68[1] = 3221225472;
        v68[2] = __66__HMDCameraProfileSettingsManager__handleUpdateAccessModeMessage___block_invoke_83;
        v68[3] = &unk_1E6A196E0;
        v68[4] = v7;
        id v69 = v4;
        [v43 updateCloudStorageAndSettingsWithAccessMode:v21 forCameraHomePresence:v23 completion:v68];
      }
      else
      {
        id v60 = (void *)MEMORY[0x1D9452090]();
        v61 = v7;
        id v62 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          __int16 v63 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v75 = v63;
          _os_log_impl(&dword_1D49D5000, v62, OS_LOG_TYPE_ERROR, "%{public}@Local zone not ready", buf, 0xCu);
        }
        id v64 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
        [v4 respondWithError:v64];
      }
    }
    else
    {
      v49 = (void *)MEMORY[0x1D9452090]();
      uint64_t v50 = v7;
      uint64_t v51 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        v52 = HMFGetLogIdentifier();
        [v38 shortDescription];
        id v53 = v66 = v49;
        *(_DWORD *)buf = 138543618;
        uint64_t v75 = v52;
        __int16 v76 = 2112;
        unint64_t v77 = (unint64_t)v53;
        _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_INFO, "%{public}@Forwarding update access mode message to primary resident: %@", buf, 0x16u);

        v49 = v66;
      }

      id v54 = (void *)[v4 mutableCopy];
      [v54 setRemote:1];
      [v54 setSecureRemote:1];
      id v55 = [HMDRemoteDeviceMessageDestination alloc];
      uint64_t v65 = [v4 destination];
      [v65 target];
      id v56 = v67 = v50;
      __int16 v57 = [v38 device];
      id v58 = [(HMDRemoteDeviceMessageDestination *)v55 initWithTarget:v56 device:v57];
      [v54 setDestination:v58];

      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __66__HMDCameraProfileSettingsManager__handleUpdateAccessModeMessage___block_invoke;
      v70[3] = &unk_1E6A15488;
      v70[4] = v67;
      id v71 = v4;
      unint64_t v72 = v21;
      uint64_t v73 = v23;
      [v54 setResponseHandler:v70];
      __int16 v59 = [(HMDCameraProfileSettingsManager *)v67 msgDispatcher];
      [v59 sendMessage:v54];
    }
  }
  else
  {
    uint64_t v44 = (void *)MEMORY[0x1D9452090]();
    __int16 v45 = v7;
    id v46 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      uint64_t v47 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v75 = v47;
      _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_ERROR, "%{public}@Cannot find primary resident to forward update access mode message to", buf, 0xCu);
    }
    int v48 = [MEMORY[0x1E4F28C58] hmErrorWithCode:91];
    [v4 respondWithError:v48];

    uint64_t v38 = 0;
  }
LABEL_25:
}

void __66__HMDCameraProfileSettingsManager__handleUpdateAccessModeMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Forwarded update access mode message failed: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 40) respondWithError:v5];
  }
  else
  {
    uint64_t v11 = [*(id *)(a1 + 32) workQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__HMDCameraProfileSettingsManager__handleUpdateAccessModeMessage___block_invoke_80;
    v13[3] = &unk_1E6A15460;
    char v12 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    long long v15 = *(_OWORD *)(a1 + 48);
    id v14 = v12;
    dispatch_async(v11, v13);
  }
}

void __66__HMDCameraProfileSettingsManager__handleUpdateAccessModeMessage___block_invoke_83(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [*(id *)(a1 + 40) shortDescription];
      int v12 = 138543874;
      BOOL v13 = v8;
      __int16 v14 = 2112;
      long long v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to update settings for message %@: %@", (uint8_t *)&v12, 0x20u);
    }
    [*(id *)(a1 + 40) respondWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = [*(id *)(a1 + 40) shortDescription];
      int v12 = 138543618;
      BOOL v13 = v10;
      __int16 v14 = 2112;
      long long v15 = v11;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Updated settings for message: %@", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)(a1 + 40) respondWithSuccess];
  }
}

void __66__HMDCameraProfileSettingsManager__handleUpdateAccessModeMessage___block_invoke_80(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v12 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Forwarded update access mode message succeeded. Updating local database", buf, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) quotaCoordinator];
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __66__HMDCameraProfileSettingsManager__handleUpdateAccessModeMessage___block_invoke_81;
  v9[3] = &unk_1E6A197F0;
  id v10 = *(id *)(a1 + 40);
  [v6 updateCloudStorageAndSettingsWithAccessMode:v7 forCameraHomePresence:v8 completion:v9];
}

uint64_t __66__HMDCameraProfileSettingsManager__handleUpdateAccessModeMessage___block_invoke_81(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 respondWithError:a2];
  }
  else {
    return [v2 respondWithSuccess];
  }
}

- (void)synchronizeSettingsToCameraWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __77__HMDCameraProfileSettingsManager_synchronizeSettingsToCameraWithCompletion___block_invoke;
  v7[3] = &unk_1E6A19530;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __77__HMDCameraProfileSettingsManager_synchronizeSettingsToCameraWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _synchronizeCurrentAccessModeSettingToCameraWithCompletion:*(void *)(a1 + 40)];
}

- (BOOL)isRecordingEnabled
{
  id v3 = [(HMDCameraProfileSettingsManager *)self currentSettingsModel];
  [v3 accessModeAtHome];
  if (HMIsRecordingAllowedForCameraAccessMode())
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(HMDCameraProfileSettingsManager *)self currentSettingsModel];
    [v5 accessModeNotAtHome];
    char v4 = HMIsRecordingAllowedForCameraAccessMode();
  }
  return v4;
}

- (NSString)zoneName
{
  uint64_t v2 = [(HMDCameraProfileSettingsManager *)self zoneManager];
  id v3 = [v2 zoneName];

  return (NSString *)v3;
}

- (void)synchronizeCloudStorageWithRecordingAccessModes
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  char v4 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  id v5 = [v4 home];
  id v6 = [v5 primaryResident];

  if (v6)
  {
    char v7 = [v6 isCurrentDevice];
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    uint64_t v11 = v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = HMFGetLogIdentifier();
        int v26 = 138543362;
        uint64_t v27 = v12;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Locally synchronizing cloud storage with recording access modes because we are the primary resident", (uint8_t *)&v26, 0xCu);
      }
      uint64_t v13 = [(HMDCameraProfileSettingsManager *)v9 quotaCoordinator];
      [v13 synchronizeCloudStorageWithRecordingAccessModes];
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        id v19 = [v6 shortDescription];
        int v26 = 138543618;
        uint64_t v27 = v18;
        __int16 v28 = 2112;
        id v29 = v19;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Forwarding request to synchronize cloud storage with recording access modes to primary resident: %@", (uint8_t *)&v26, 0x16u);
      }
      uint64_t v20 = [HMDRemoteDeviceMessageDestination alloc];
      unint64_t v21 = [(HMDCameraProfileSettingsManager *)v9 messageTargetUUID];
      uint64_t v22 = [v6 device];
      uint64_t v23 = [(HMDRemoteDeviceMessageDestination *)v20 initWithTarget:v21 device:v22];

      id v24 = [[HMDRemoteMessage alloc] initWithName:@"HMDCameraProfileSettingsSynchronizeCloudStorageWithRecordingAccessModesMessage" destination:v23 payload:0 type:3 timeout:1 secure:0.0];
      id v25 = [(HMDCameraProfileSettingsManager *)v9 msgDispatcher];
      [v25 sendMessage:v24];
    }
  }
  else
  {
    __int16 v14 = (void *)MEMORY[0x1D9452090]();
    long long v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      int v26 = 138543362;
      uint64_t v27 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Cannot find primary resident to synchronize cloud storage with recording access modes", (uint8_t *)&v26, 0xCu);
    }
  }
}

- (void)disableRecordingAccessModes
{
  id v3 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraProfileSettingsManager *)self quotaCoordinator];
  [v4 disableRecordingAccessModes];
}

- (void)remove
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    char v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    unint64_t v21 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Deleting camera settings", buf, 0xCu);
  }
  id v8 = [(HMDCameraProfileSettingsManager *)v5 zoneManager];
  id v9 = [v8 localZone];
  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = [(HMDCameraProfileSettingsManager *)v5 uniqueIdentifier];
  v19[0] = v11;
  int v12 = [(HMDCameraProfileSettingsManager *)v5 derivedPropertiesModelID];
  v19[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  __int16 v14 = [v10 setWithArray:v13];
  long long v15 = [MEMORY[0x1E4F69EF0] optionsWithLabel:@"Delete Camera Settings"];
  __int16 v16 = [v9 removeModelIDs:v14 options:v15];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __41__HMDCameraProfileSettingsManager_remove__block_invoke;
  v18[3] = &unk_1E6A197F0;
  void v18[4] = v5;
  id v17 = (id)[v16 addFailureBlock:v18];
}

void __41__HMDCameraProfileSettingsManager_remove__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    char v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to delete camera settings: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)start
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  id v5 = [v4 cameraProfiles];
  id v6 = [v5 anyObject];

  char v7 = (void *)MEMORY[0x1D9452090]();
  int v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    __int16 v10 = HMFGetLogIdentifier();
    id v11 = [v6 logIdentifier];
    int v13 = 138543618;
    __int16 v14 = v10;
    __int16 v15 = 2112;
    __int16 v16 = v11;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Starting settings manager for camera profile %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v12 = [(HMDCameraProfileSettingsManager *)v8 zoneManager];
  [v12 start];
}

- (void)configureWithMessageDispatcher:(id)a3 adminMessageDispatcher:(id)a4 deviceIsResidentCapable:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v62 = a4;
  id v58 = v8;
  [(HMDCameraProfileSettingsManager *)self setMsgDispatcher:v8];
  v61 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  id v60 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  __int16 v59 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  id v9 = (void *)MEMORY[0x1D9452090]([v59 setRoles:4]);
  __int16 v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v13 = HMFBooleanToString();
    [(HMDCameraProfileSettingsManager *)v10 isCurrentDeviceConfirmedPrimaryResident];
    __int16 v14 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    v68 = v12;
    __int16 v69 = 2112;
    v70 = v13;
    __int16 v71 = 2112;
    unint64_t v72 = v14;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Configured with deviceIsResidentCapable=%@ and isCurrentDevicePrimaryResident=%@", buf, 0x20u);
  }
  __int16 v15 = [(HMDCameraProfileSettingsManager *)v10 hapAccessory];
  [v15 home];
  __int16 v16 = v57 = v5;
  uint64_t v17 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v16 userPrivilege:4 remoteAccessRequired:0];
  v66[0] = v61;
  v66[1] = v60;
  v66[2] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:3];
  v65[0] = v61;
  v65[1] = v60;
  v65[2] = v17;
  v65[3] = v59;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:4];
  [v8 registerForMessage:*MEMORY[0x1E4F2CDC0] receiver:v10 policies:v19 selector:sel__handleUpdateAccessModeMessage_];

  [v62 registerForMessage:*MEMORY[0x1E4F2CDE0] receiver:v10 policies:v18 selector:sel__handleUpdateRecordingTriggerEventsMessage_];
  [v62 registerForMessage:*MEMORY[0x1E4F2CDC8] receiver:v10 policies:v18 selector:sel__handleUpdateActivityZonesMessage_];

  uint64_t v20 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v16 userPrivilege:3 remoteAccessRequired:0];
  v64[0] = v20;
  v64[1] = v59;
  unint64_t v21 = v15;
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
  [v58 registerForMessage:@"HMDCameraProfileSettingsSynchronizeCloudStorageWithRecordingAccessModesMessage" receiver:v10 policies:v22 selector:sel__handleSynchronizeCloudStorageWithRecordingAccessModesMessage_];

  v63[0] = v61;
  v63[1] = v60;
  uint64_t v23 = v16;
  id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
  [v58 registerForMessage:*MEMORY[0x1E4F2EC88] receiver:v10 policies:v24 selector:sel__handleBulletinBoardNotificationCommitMessage_];
  [v58 registerForMessage:*MEMORY[0x1E4F2CDB8] receiver:v10 policies:v24 selector:sel__handleUpdateAccessModeChangeNotificationEnabledMessage_];
  [v58 registerForMessage:*MEMORY[0x1E4F2CDD8] receiver:v10 policies:v24 selector:sel__handleUpdateReachabilityEventNotificationEnabledMessage_];

  id v25 = [(HMDCameraProfileSettingsManager *)v10 notificationCenter];
  [v25 removeObserver:v10];

  int v26 = [(HMDCameraProfileSettingsManager *)v10 notificationCenter];
  uint64_t v27 = [v16 currentUser];
  [v26 addObserver:v10 selector:sel_handleUserRemoteAccessDidChangeNotification_ name:@"HMDUserRemoteAccessDidChangeNotification" object:v27];

  __int16 v28 = [(HMDCameraProfileSettingsManager *)v10 notificationCenter];
  [v28 addObserver:v10 selector:sel_handleCharacteristicsChangedNotification_ name:@"HMDAccessoryCharacteristicsChangedNotification" object:v15];

  if (v57)
  {
    id v29 = [(HMDCameraProfileSettingsManager *)v10 notificationCenter];
    uint64_t v30 = [v16 residentDeviceManager];
    [v29 addObserver:v10 selector:sel_handlePrimaryResidentUpdatedNotification_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:v30];

    int v31 = [(HMDCameraProfileSettingsManager *)v10 notificationCenter];
    [v31 addObserver:v10 selector:sel_handlePrimaryResidentUpdatedNotification_ name:@"HMDResidentDeviceConfirmedStateChangedNotification" object:0];

    id v32 = [(HMDCameraProfileSettingsManager *)v10 notificationCenter];
    __int16 v33 = [v16 presenceMonitor];
    [v32 addObserver:v10 selector:sel_handleHomePresenceEvaluatedNotification_ name:@"HMDHomePresenceEvaluatedNotification" object:v33];

    id v34 = [(HMDCameraProfileSettingsManager *)v10 notificationCenter];
    [v34 addObserver:v10 selector:sel_handleAccessoryConfiguredNotification_ name:@"HMDAccessoryConnectedNotification" object:v15];

    __int16 v35 = [(HMDCameraProfileSettingsManager *)v10 notificationCenter];
    [v35 addObserver:v10 selector:sel_handleRecordingManagementServiceDidUpdateNotification_ name:@"HMDRecordingManagementServiceDidUpdateNotification" object:v15];

    long long v36 = [(HMDCameraProfileSettingsManager *)v10 notificationCenter];
    [v36 addObserver:v10 selector:sel_handleCharacteristicsValueUpdatedNotification_ name:@"HMDNotificationCharacteristicValueUpdated" object:v15];

    if ([v15 isReachable]) {
      [(HMDCameraProfileSettingsManager *)v10 _setManuallyDisabledCharacteristicNotificationsEnabled:1];
    }
    uint64_t v37 = [v16 presenceMonitor];
    uint64_t v38 = [v37 currentHomePresence];

    if (v38)
    {
      id v39 = [(HMDCameraProfileSettingsManager *)v10 _isAnyUserAtHomeForPresence:v38];
      [(HMDCameraProfileSettingsManager *)v10 setAnyUserAtHome:v39];

      uint64_t v40 = (void *)MEMORY[0x1D9452090]();
      int v41 = v10;
      int v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        __int16 v43 = HMFGetLogIdentifier();
        uint64_t v44 = [(HMDCameraProfileSettingsManager *)v41 isAnyUserAtHome];
        *(_DWORD *)buf = 138543618;
        v68 = v43;
        __int16 v69 = 2112;
        v70 = v44;
        _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Initial isAnyUserAtHome is %@", buf, 0x16u);
      }
    }
    else
    {
      __int16 v45 = (void *)MEMORY[0x1D9452090]();
      id v46 = v10;
      uint64_t v47 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        int v48 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v68 = v48;
        _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_INFO, "%{public}@Current home presence is unavailable", buf, 0xCu);
      }
      [(HMDCameraProfileSettingsManager *)v46 setAnyUserAtHome:0];
    }
  }
  v49 = [(HMDCameraProfileSettingsManager *)v10 zoneManager];
  uint64_t v50 = [v49 defaultConfiguration];
  uint64_t v51 = (void *)[v50 mutableCopy];

  objc_msgSend(v51, "setZoneOwner:", objc_msgSend(v23, "isOwnerUser"));
  [v51 setExternalRecordTypesForSubscriptions:0];
  id v52 = objc_alloc_init(MEMORY[0x1E4F69ED0]);
  [v52 setShouldRebuildOnManateeKeyLoss:1];
  [v51 setCloudZoneConfiguration:v52];
  id v53 = [(HMDCameraProfileSettingsManager *)v10 zoneManager];
  [v53 setDefaultConfiguration:v51];

  id v54 = [(HMDCameraProfileSettingsManager *)v10 zoneManager];
  [v54 setDataSource:v10];

  id v55 = [(HMDCameraProfileSettingsManager *)v10 zoneManager];
  [v55 setDelegate:v10];

  id v56 = [(HMDCameraProfileSettingsManager *)v10 zoneManager];
  [v56 configure];
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  BOOL v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating camera profile settings manager", buf, 0xCu);
  }
  [(HMDCameraProfileSettingsManager *)v4 _setManuallyDisabledCharacteristicNotificationsEnabled:0];
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraProfileSettingsManager;
  [(HMDCameraProfileSettingsManager *)&v7 dealloc];
}

- (HMDCameraProfileSettingsManager)initWithHAPAccessory:(id)a3 workQueue:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)MEMORY[0x1E4F29128];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 uuid];
  v29[0] = @"HMDCameraProfileSettingsUUIDSalt";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  uint64_t v10 = objc_msgSend(v5, "hm_deriveUUIDFromBaseUUID:withSalts:", v8, v9);

  id v24 = [v7 home];
  id v11 = [HMDDatabaseZoneManager alloc];
  uint64_t v12 = +[HMDDatabase defaultDatabase];
  int v13 = +[HMDCameraProfileSettingsManager zoneNameForHome:v24];
  __int16 v14 = (void *)v10;
  __int16 v15 = [(HMDDatabaseZoneManager *)v11 initWithDatabase:v12 zoneName:v13 home:v24 messageTargetUUID:v10 workQueue:v6];

  __int16 v16 = objc_alloc_init(HMDFeaturesDataSource);
  uint64_t v17 = [[HMDCameraProfileSettingsQuotaCoordinator alloc] initWithWorkQueue:v6 accessory:v7];
  uint64_t v27 = *MEMORY[0x1E4F2DE98];
  uint64_t v18 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2CF38]];
  __int16 v28 = v18;
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];

  uint64_t v20 = [[HMDCharacteristicsAvailabilityListener alloc] initWithAccessory:v7 workQueue:v6 interestedCharacteristicTypesByServiceType:v19];
  unint64_t v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v22 = +[HMDBulletinBoard sharedBulletinBoard];
  int v26 = [(HMDCameraProfileSettingsManager *)self initWithUniqueIdentifier:v14 hapAccessory:v7 workQueue:v6 zoneManager:v15 notificationCenter:v21 bulletinBoard:v22 characteristicsAvailabilityListener:v20 quotaCoordinator:v17 featuresDataSource:v16];

  return v26;
}

- (HMDCameraProfileSettingsManager)initWithUniqueIdentifier:(id)a3 hapAccessory:(id)a4 workQueue:(id)a5 zoneManager:(id)a6 notificationCenter:(id)a7 bulletinBoard:(id)a8 characteristicsAvailabilityListener:(id)a9 quotaCoordinator:(id)a10 featuresDataSource:(id)a11
{
  id v33 = a3;
  id obj = a4;
  id v32 = a5;
  id v31 = a6;
  id v30 = a7;
  id v29 = a8;
  id v28 = a9;
  id v27 = a10;
  id v18 = a11;
  v35.receiver = self;
  v35.super_class = (Class)HMDCameraProfileSettingsManager;
  id v19 = [(HMDCameraProfileSettingsManager *)&v35 init];
  uint64_t v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_uniqueIdentifier, a3);
    objc_storeWeak((id *)&v20->_hapAccessory, obj);
    objc_storeStrong((id *)&v20->_workQueue, a5);
    objc_storeStrong((id *)&v20->_zoneManager, a6);
    objc_storeStrong((id *)&v20->_notificationCenter, a7);
    objc_storeStrong((id *)&v20->_bulletinBoard, a8);
    objc_storeStrong((id *)&v20->_quotaCoordinator, a10);
    objc_storeStrong((id *)&v20->_characteristicsAvailabilityListener, a9);
    objc_storeStrong((id *)&v20->_featuresDataSource, a11);
    unint64_t v21 = NSString;
    uint64_t v22 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v23 = [v22 UUIDString];
    uint64_t v24 = [v21 stringWithFormat:@"%@.HMDCameraProfileSettingsManager.%@", @"com.apple.HomeKitDaemon.Local", v23, v27, v28, v29, v30, v31, v32, v33];
    clientIdentifier = v20->_clientIdentifier;
    v20->_clientIdentifier = (NSString *)v24;
  }
  return v20;
}

uint64_t __46__HMDCameraProfileSettingsManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v142;
  logCategory__hmf_once_v142 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)zoneNameForHome:(id)a3
{
  id v3 = [a3 uuid];
  id v4 = [v3 UUIDString];
  BOOL v5 = [@"accessory-profile-data-" stringByAppendingString:v4];

  return v5;
}

@end