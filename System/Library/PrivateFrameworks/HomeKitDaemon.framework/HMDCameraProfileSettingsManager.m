@interface HMDCameraProfileSettingsManager
+ (id)logCategory;
+ (id)zoneNameForHome:(id)a3;
- (BOOL)_evaluateHomePresence;
- (BOOL)_migrateNotificationSettings:(id)a3;
- (BOOL)_migrateSettingsModel:(id)a3;
- (BOOL)_setAnyUserAtHomeFromPresenceMonitorWithHome:(id)a3;
- (BOOL)canModifyCameraSettings;
- (BOOL)canRevealCurrentAccessMode;
- (BOOL)hasStarted;
- (BOOL)isCameraManuallyDisabled;
- (BOOL)isCurrentDeviceConfirmedPrimaryResident;
- (BOOL)isRecordingEnabled;
- (BOOL)needsInitialSettingsCharacteristicSynchronization;
- (HMDBulletinBoard)bulletinBoard;
- (HMDCameraBulletinNotificationManager)cameraBulletinNotificationManager;
- (HMDCameraProfileSettingsCoreDataAdapter)coreDataAdapter;
- (HMDCameraProfileSettingsDerivedPropertiesModel)derivedPropertiesModel;
- (HMDCameraProfileSettingsDerivedPropertiesModel)previousDerivedPropertiesModel;
- (HMDCameraProfileSettingsManager)initWithHAPAccessory:(id)a3 workQueue:(id)a4;
- (HMDCameraProfileSettingsManager)initWithUniqueIdentifier:(id)a3 hapAccessory:(id)a4 workQueue:(id)a5 coreDataAdapter:(id)a6 notificationCenter:(id)a7 bulletinBoard:(id)a8 characteristicsAvailabilityListener:(id)a9 quotaCoordinator:(id)a10 featuresDataSource:(id)a11;
- (HMDCameraProfileSettingsModel)defaultSettingsModel;
- (HMDCameraProfileSettingsModel)previousSettingsModel;
- (HMDCameraProfileSettingsQuotaCoordinator)quotaCoordinator;
- (HMDCharacteristicsAvailabilityListener)characteristicsAvailabilityListener;
- (HMDFeaturesDataSource)featuresDataSource;
- (HMDHAPAccessory)hapAccessory;
- (HMFMessageDispatcher)msgDispatcher;
- (NSNotificationCenter)notificationCenter;
- (NSNumber)isAnyUserAtHome;
- (NSString)clientIdentifier;
- (NSUUID)derivedPropertiesModelID;
- (NSUUID)uniqueIdentifier;
- (OS_dispatch_queue)workQueue;
- (_HMCameraUserSettings)currentSettings;
- (id)_coreDataUpdateCompletionForMessage:(id)a3;
- (id)_createNotificationSettingsUsingSettingsModel:(id)a3;
- (id)_isAnyUserAtHomeForPresence:(id)a3;
- (id)_payloadForSettings:(id)a3;
- (id)_settingsFromSettingsModel:(id)a3;
- (id)_settingsModelForUpdate;
- (id)_updatedDerivedPropertiesModelWithSettingsModel:(id)a3 userInitiated:(BOOL)a4 didCreateModel:(BOOL *)a5;
- (id)currentNotificationSettings;
- (id)currentSettingsModel;
- (id)doorbellInputEventCharacteristic;
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
- (void)_coordinateDoorbellServiceBulletinNotification:(id)a3;
- (void)_coordinateNotificationSettingsWithServiceBulletinNotification:(id)a3;
- (void)_coordinateSmartBulletinNotificationWithServiceBulletinNotification:(id)a3;
- (void)_enablePackageNotificationsOnSettings:(id)a3;
- (void)_handleBulletinBoardNotificationCommitMessage:(id)a3;
- (void)_handleCameraSettingsDidChangeMessage:(id)a3;
- (void)_handleCharacteristicWriteRequests:(id)a3 completion:(id)a4;
- (void)_handleConnectedToAccessory;
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
- (void)_notifySubscribersOfUpdatedSettings:(id)a3 previousSettings:(id)a4;
- (void)_populateCurrentAccessModeFieldForDerivedProperties:(id)a3 currentSettings:(id)a4 userInitiated:(BOOL)a5 didUpdateField:(BOOL *)a6;
- (void)_setManuallyDisabledCharacteristicNotificationsEnabled:(BOOL)a3;
- (void)_start;
- (void)_synchronizeCurrentAccessModeSettingToCameraWithCompletion:(id)a3;
- (void)_updateCameraBulletinNotificationManagerWithSettings:(id)a3 forMessage:(id)a4;
- (void)_updateDerivedPropertiesModelWithSettingsModel:(id)a3 userInitiated:(BOOL)a4 reason:(id)a5;
- (void)_updateDerivedPropertiesOnSettingsModel:(id)a3;
- (void)_updateNotificationSettings:(id)a3 forMessage:(id)a4;
- (void)_writeInitialSettingsCharacteristicsToCamera;
- (void)configureWithMessageDispatcher:(id)a3 adminMessageDispatcher:(id)a4 deviceIsResidentCapable:(BOOL)a5;
- (void)dealloc;
- (void)disableRecordingAccessModes;
- (void)handleAccessoryConfiguredNotification:(id)a3;
- (void)handleBulletinNotificationEnableStateDidChangeNotification:(id)a3;
- (void)handleCharacteristicsValueUpdatedNotification:(id)a3;
- (void)handleHomePresenceEvaluatedNotification:(id)a3;
- (void)handlePrimaryResidentUpdatedNotification:(id)a3;
- (void)handleRecordingManagementServiceDidUpdateNotification:(id)a3;
- (void)handleUpdatedDerivedPropertiesModel:(id)a3;
- (void)handleUpdatedSettingsModel:(id)a3;
- (void)handleUserRemoteAccessDidChangeNotification:(id)a3;
- (void)listener:(id)a3 didUpdateAvailableCharacteristics:(id)a4;
- (void)remove;
- (void)setAnyUserAtHome:(id)a3;
- (void)setHapAccessory:(id)a3;
- (void)setHasStarted:(BOOL)a3;
- (void)setMsgDispatcher:(id)a3;
- (void)setNeedsInitialSettingsCharacteristicSynchronization:(BOOL)a3;
- (void)setPreviousDerivedPropertiesModel:(id)a3;
- (void)setPreviousSettingsModel:(id)a3;
- (void)start;
- (void)synchronizeCloudStorageWithRecordingAccessModes;
- (void)synchronizeSettingsToCameraWithCompletion:(id)a3;
- (void)updateSettingsModelUsingBlock:(id)a3 completion:(id)a4;
@end

@implementation HMDCameraProfileSettingsManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anyUserAtHome, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_previousDerivedPropertiesModel, 0);
  objc_storeStrong((id *)&self->_previousSettingsModel, 0);
  objc_storeStrong((id *)&self->_coreDataAdapter, 0);
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
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
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
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPreviousDerivedPropertiesModel:(id)a3
{
}

- (HMDCameraProfileSettingsDerivedPropertiesModel)previousDerivedPropertiesModel
{
  return (HMDCameraProfileSettingsDerivedPropertiesModel *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPreviousSettingsModel:(id)a3
{
}

- (HMDCameraProfileSettingsModel)previousSettingsModel
{
  return (HMDCameraProfileSettingsModel *)objc_getProperty(self, a2, 96, 1);
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (HMDCameraProfileSettingsCoreDataAdapter)coreDataAdapter
{
  return (HMDCameraProfileSettingsCoreDataAdapter *)objc_getProperty(self, a2, 88, 1);
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

- (HMDHAPAccessory)hapAccessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hapAccessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

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

- (void)listener:(id)a3 didUpdateAvailableCharacteristics:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v29 = a3;
  id v6 = a4;
  v7 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v37 = v11;
    __int16 v38 = 2112;
    id v39 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Received updated available characteristics: %@", buf, 0x16u);
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
        v17 = *(void **)(*((void *)&v31 + 1) + 8 * v16);
        v18 = [v17 service];
        v19 = [v18 bulletinBoardNotification];

        if (v19)
        {
          v20 = [(HMDCameraProfileSettingsManager *)v9 notificationCenter];
          [v20 removeObserver:v9 name:@"HMDBulletinBoardNotificationDidUpdateNotification" object:v19];

          v21 = [(HMDCameraProfileSettingsManager *)v9 notificationCenter];
          [v21 addObserver:v9 selector:sel_handleBulletinNotificationEnableStateDidChangeNotification_ name:@"HMDBulletinBoardNotificationDidUpdateNotification" object:v19];

          [(HMDCameraProfileSettingsManager *)v9 _coordinateNotificationSettingsWithServiceBulletinNotification:v19];
        }
        else
        {
          v22 = (void *)MEMORY[0x230FBD990]();
          v23 = v9;
          v24 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v25 = v15;
            v27 = id v26 = v12;
            v28 = [v17 service];
            *(_DWORD *)buf = 138543618;
            v37 = v27;
            __int16 v38 = 2112;
            id v39 = v28;
            _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Service unexpectedly does not have a bulletin board notification: %@", buf, 0x16u);

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
  id v12 = (void (**)(id, void))a4;
  id v6 = (void (**)(id, void *))a3;
  v7 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  v8 = [(HMDCameraProfileSettingsManager *)self currentSettingsModel];
  v6[2](v6, v8);

  v9 = [v8 hmbSetProperties];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    v11 = [(HMDCameraProfileSettingsManager *)self coreDataAdapter];
    [v11 updateCameraProfileSettingsModel:v8 completion:v12];
  }
  else
  {
    v12[2](v12, 0);
  }
}

- (void)_handleUpdatedSettings:(id)a3 previousSettings:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v20 = 0;
  [v6 hmbIsDifferentFromModel:v7 differingFields:&v20];
  id v9 = v20;
  int v10 = objc_msgSend(v9, "hmf_isEmpty");
  v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  uint64_t v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v22 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEBUG, "%{public}@No changed fields for updated settings model", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      v17 = [v6 debugDescription];
      v18 = [v7 debugDescription];
      *(_DWORD *)buf = 138544130;
      v22 = v16;
      __int16 v23 = 2112;
      v24 = v17;
      __int16 v25 = 2112;
      id v26 = v18;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Handling updated settings model: %@, previous settings model: %@, changed fields: %@", buf, 0x2Au);
    }
    [(HMDCameraProfileSettingsManager *)v12 _updateDerivedPropertiesOnSettingsModel:v6];
    [(HMDCameraProfileSettingsManager *)v12 _notifyClientsOfChangedSettingsModel:v6 isInitialSettingsUpdate:0];
    if (-[HMDCameraProfileSettingsManager isCurrentDeviceConfirmedPrimaryResident](v12, "isCurrentDeviceConfirmedPrimaryResident")&& (([v9 containsObject:@"accessModeAtHomeField"] & 1) != 0|| objc_msgSend(v9, "containsObject:", @"accessModeNotAtHomeField")))
    {
      v19 = [(HMDCameraProfileSettingsManager *)v12 currentSettingsModel];
      [(HMDCameraProfileSettingsManager *)v12 _updateDerivedPropertiesModelWithSettingsModel:v19 userInitiated:1 reason:@"Settings model updated"];
    }
  }
}

- (void)_updateDerivedPropertiesOnSettingsModel:(id)a3
{
  id v6 = a3;
  v4 = [(HMDCameraProfileSettingsManager *)self derivedPropertiesModel];
  objc_msgSend(v6, "setCurrentAccessMode:", objc_msgSend(v4, "currentAccessMode"));
  if ([v4 currentAccessMode]) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = [v4 currentAccessModeChangeReason] == 5;
  }
  [v6 setCameraManuallyDisabled:v5];
}

- (void)_handleUpdatedDerivedProperties:(id)a3 previousProperties:(id)a4
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v66 = 0;
  [v6 hmbIsDifferentFromModel:v7 differingFields:&v66];
  id v9 = (__CFString *)v66;
  int v10 = [(__CFString *)v9 hmf_isEmpty];
  v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  uint64_t v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v68 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEBUG, "%{public}@No changed fields for updated derived properties model", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      v17 = [v6 debugDescription];
      v18 = [v7 debugDescription];
      *(_DWORD *)buf = 138544130;
      v68 = v16;
      __int16 v69 = 2112;
      v70 = v17;
      __int16 v71 = 2112;
      v72 = v18;
      __int16 v73 = 2112;
      v74 = v9;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Handling updated derived properties model: %@\nprevious derived properties model: %@\nchanged fields: %@", buf, 0x2Au);
    }
    [(HMDCameraProfileSettingsManager *)v12 _notifyClientsOfCurrentSettings];
    uint64_t v19 = [v6 currentAccessMode];
    if ([(HMDCameraProfileSettingsManager *)v12 isCurrentDeviceConfirmedPrimaryResident])
    {
      id v20 = (void *)MEMORY[0x230FBD990]();
      v21 = v12;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v23 = HMFGetLogIdentifier();
        HMCameraAccessModeAsString();
        v24 = (HMDCameraAccessModeChangedBulletin *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = v23;
        __int16 v69 = 2112;
        v70 = v24;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Handling currentAccessMode of %@", buf, 0x16u);
      }
      [(HMDCameraProfileSettingsManager *)v21 _synchronizeCurrentAccessModeSettingToCameraWithCompletion:0];
    }
    if ([(__CFString *)v9 containsObject:@"currentAccessModeField"])
    {
      __int16 v25 = [(HMDCameraProfileSettingsManager *)v12 hapAccessory];
      id v26 = [v25 home];
      if ([(HMDCameraProfileSettingsManager *)v12 isCurrentDeviceConfirmedPrimaryResident])
      {
        [(HMDCameraProfileSettingsManager *)v12 _notifySubscribersOfUpdatedSettings:v6 previousSettings:v7];
      }
      if (-[HMDCameraProfileSettingsManager isCurrentDeviceConfirmedPrimaryResident](v12, "isCurrentDeviceConfirmedPrimaryResident")|| ([v26 enabledResidents], __int16 v27 = objc_claimAutoreleasedReturnValue(), v28 = objc_msgSend(v27, "hmf_isEmpty"), v27, v28))
      {
        uint64_t v29 = [(HMDCameraProfileSettingsManager *)v12 currentNotificationSettings];
        int v30 = [v29 isAccessModeChangeNotificationEnabled];

        long long v31 = [v25 cameraProfiles];
        uint64_t v32 = [v31 anyObject];

        v65 = (void *)v32;
        if (v7
          && (v32 ? (int v33 = v30) : (int v33 = 0),
              v33 == 1
           && v26
           && [(HMDCameraProfileSettingsManager *)v12 canRevealCurrentAccessMode]))
        {
          long long v34 = (void *)MEMORY[0x230FBD990]();
          v63 = v12;
          v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            v36 = HMFGetLogIdentifier();
            [v7 currentAccessMode];
            HMCameraAccessModeAsString();
            v37 = (HMDCameraAccessModeChangedBulletin *)objc_claimAutoreleasedReturnValue();
            HMCameraAccessModeAsString();
            __int16 v38 = v61 = v34;
            *(_DWORD *)buf = 138543874;
            v68 = v36;
            __int16 v69 = 2112;
            v70 = v37;
            __int16 v71 = 2112;
            v72 = v38;
            _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@Current access mode changed from %@ to %@", buf, 0x20u);

            long long v34 = v61;
          }

          id v39 = [HMDCameraAccessModeChangedBulletin alloc];
          uint64_t v40 = [v6 currentAccessModeChangeReason];
          v41 = [v6 currentAccessModeChangeDate];
          if (v41)
          {
            v42 = [(HMDCameraAccessModeChangedBulletin *)v39 initWithAccessMode:v19 camera:v65 home:v26 changeReason:v40 changeDate:v41];
          }
          else
          {
            v52 = [MEMORY[0x263EFF910] date];
            v42 = [(HMDCameraAccessModeChangedBulletin *)v39 initWithAccessMode:v19 camera:v65 home:v26 changeReason:v40 changeDate:v52];
          }
          if (v42)
          {
            v53 = (void *)MEMORY[0x230FBD990]();
            v54 = v63;
            v55 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              v56 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v68 = v56;
              __int16 v69 = 2112;
              v70 = v42;
              _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_INFO, "%{public}@Inserting camera access mode changed bulletin: %@", buf, 0x16u);
            }
            v57 = [(HMDCameraProfileSettingsManager *)v54 bulletinBoard];
            [v57 insertCameraAccessModeChangedBulletin:v42];
          }
        }
        else
        {
          v43 = (void *)MEMORY[0x230FBD990]();
          v44 = v12;
          v45 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            v46 = HMFGetLogIdentifier();
            v62 = v25;
            v64 = v26;
            v47 = @"<nil>";
            if (v7) {
              v48 = @"<not nil>";
            }
            else {
              v48 = @"<nil>";
            }
            v58 = v48;
            v49 = HMFBooleanToString();
            v60 = v43;
            if (v65) {
              v50 = @"<not nil>";
            }
            else {
              v50 = @"<nil>";
            }
            if (v26) {
              v47 = @"<not nil>";
            }
            [(HMDCameraProfileSettingsManager *)v44 canRevealCurrentAccessMode];
            v51 = HMFBooleanToString();
            *(_DWORD *)buf = 138544642;
            v68 = v46;
            __int16 v69 = 2112;
            v70 = v59;
            __int16 v71 = 2112;
            v72 = v49;
            __int16 v73 = 2112;
            v74 = v50;
            __int16 v75 = 2112;
            v76 = v47;
            v43 = v60;
            __int16 v25 = v62;
            __int16 v77 = 2112;
            v78 = v51;
            _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_INFO, "%{public}@Not posting access mode change notification because previousProperties=%@ accessModeChangeNotificationEnabled=%@ cameraProfile=%@ home=%@ canRevealCurrentAccessMode=%@", buf, 0x3Eu);

            id v26 = v64;
          }
        }
      }
    }
  }
}

- (void)handleUpdatedDerivedPropertiesModel:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__HMDCameraProfileSettingsManager_handleUpdatedDerivedPropertiesModel___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __71__HMDCameraProfileSettingsManager_handleUpdatedDerivedPropertiesModel___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) hasStarted])
  {
    v2 = [*(id *)(a1 + 40) hmbSetProperties];
    char v3 = objc_msgSend(v2, "hmf_isEmpty");

    if ((v3 & 1) == 0)
    {
      id v4 = [*(id *)(a1 + 32) previousDerivedPropertiesModel];
      BOOL v5 = *(void **)(a1 + 40);
      id v12 = v4;
      if (v4)
      {
        id v6 = [v4 hmbModelByMergingSetPropertiesFromModel:v5];
      }
      else
      {
        id v6 = v5;
      }
      v11 = v6;
      [*(id *)(a1 + 32) setPreviousDerivedPropertiesModel:v6];
      [*(id *)(a1 + 32) _handleUpdatedDerivedProperties:v11 previousProperties:v12];
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Ignoring derived properties model update because we haven't started yet", buf, 0xCu);
    }
  }
}

- (void)handleUpdatedSettingsModel:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__HMDCameraProfileSettingsManager_handleUpdatedSettingsModel___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __62__HMDCameraProfileSettingsManager_handleUpdatedSettingsModel___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) hasStarted])
  {
    v2 = [*(id *)(a1 + 40) hmbSetProperties];
    char v3 = objc_msgSend(v2, "hmf_isEmpty");

    if ((v3 & 1) == 0)
    {
      id v4 = [*(id *)(a1 + 32) previousSettingsModel];
      BOOL v5 = *(void **)(a1 + 40);
      id v12 = v4;
      if (v4)
      {
        id v6 = [v4 hmbModelByMergingSetPropertiesFromModel:v5];
      }
      else
      {
        id v6 = v5;
      }
      v11 = v6;
      [*(id *)(a1 + 32) setPreviousSettingsModel:v6];
      [*(id *)(a1 + 32) _handleUpdatedSettings:v11 previousSettings:v12];
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Ignoring settings model update because we haven't started yet", buf, 0xCu);
    }
  }
}

- (BOOL)isCurrentDeviceConfirmedPrimaryResident
{
  v2 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  char v3 = [v2 home];
  char v4 = [v3 isCurrentDeviceConfirmedPrimaryResident];

  return v4;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x263F42570]);
  char v4 = [(HMDCameraProfileSettingsManager *)self messageTargetUUID];
  BOOL v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (void)_start
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDCameraProfileSettingsManager *)self hasStarted])
  {
    char v4 = (void *)MEMORY[0x230FBD990]();
    BOOL v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v47 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring request to start because we've already started", buf, 0xCu);
    }
  }
  else
  {
    [(HMDCameraProfileSettingsManager *)self setHasStarted:1];
    id v8 = [(HMDCameraProfileSettingsManager *)self coreDataAdapter];
    id v45 = 0;
    uint64_t v9 = [v8 fetchCameraProfileSettingsModelWithError:&v45];
    id v10 = v45;

    uint64_t v11 = [(HMDCameraProfileSettingsManager *)self _initializeNotificationSettingsUsingSettingsModel:v9];
    if (v9)
    {
      [(HMDCameraProfileSettingsManager *)self _updateDerivedPropertiesOnSettingsModel:v9];
      [(HMDCameraProfileSettingsManager *)self setPreviousSettingsModel:v9];
      id v12 = [(HMDCameraProfileSettingsManager *)self coreDataAdapter];
      uint64_t v13 = [v12 fetchDerivedPropertiesModelWithError:0];
      [(HMDCameraProfileSettingsManager *)self setPreviousDerivedPropertiesModel:v13];

      unint64_t v14 = 0;
      id v15 = (id)v9;
    }
    else
    {
      if (v10)
      {
        uint64_t v16 = (void *)MEMORY[0x230FBD990](v11);
        v17 = self;
        v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v47 = v19;
          __int16 v48 = 2112;
          id v49 = v10;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Error fetching currentSettings: %@", buf, 0x16u);
        }
      }
      id v20 = (void *)MEMORY[0x230FBD990](v11);
      v21 = self;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        __int16 v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v47 = v23;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Initializing with default settings values", buf, 0xCu);
      }
      id v15 = [(HMDCameraProfileSettingsManager *)v21 defaultSettingsModel];
      [(HMDCameraProfileSettingsManager *)v21 _updateDerivedPropertiesOnSettingsModel:v15];
      unint64_t v14 = (unint64_t)v15;
    }
    v24 = (void *)MEMORY[0x230FBD990]();
    __int16 v25 = self;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      __int16 v27 = HMFGetLogIdentifier();
      int v28 = [(HMDCameraProfileSettingsManager *)v25 _settingsFromSettingsModel:v15];
      *(_DWORD *)buf = 138543618;
      v47 = v27;
      __int16 v48 = 2112;
      id v49 = v28;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Initializing with current settings: %@", buf, 0x16u);
    }
    uint64_t v29 = (void *)MEMORY[0x230FBD990]();
    int v30 = v25;
    long long v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      uint64_t v32 = HMFGetLogIdentifier();
      int v33 = [(HMDCameraProfileSettingsManager *)v30 previousDerivedPropertiesModel];
      long long v34 = [v33 debugDescription];
      *(_DWORD *)buf = 138543618;
      v47 = v32;
      __int16 v48 = 2112;
      id v49 = v34;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Initializing with current derived properties model: %@", buf, 0x16u);
    }
    v35 = [(HMDCameraProfileSettingsManager *)v30 characteristicsAvailabilityListener];
    [v35 setDelegate:v30];

    v36 = [(HMDCameraProfileSettingsManager *)v30 characteristicsAvailabilityListener];
    [v36 start];

    v37 = [(HMDCameraProfileSettingsManager *)v30 quotaCoordinator];
    [v37 setDelegate:v30];

    if ([(HMDCameraProfileSettingsManager *)v30 canModifyCameraSettings])
    {
      if ([(HMDCameraProfileSettingsManager *)v30 _migrateSettingsModel:v15])
      {
        id v38 = v15;

        unint64_t v14 = (unint64_t)v38;
      }
      uint64_t v39 = [(HMDCameraProfileSettingsManager *)v30 _updatedDerivedPropertiesModelWithSettingsModel:v15 userInitiated:0 didCreateModel:0];
      if (v14 | v39)
      {
        uint64_t v40 = (void *)v39;
        if (v14)
        {
          v41 = [(HMDCameraProfileSettingsManager *)v30 coreDataAdapter];
          v44[0] = MEMORY[0x263EF8330];
          v44[1] = 3221225472;
          v44[2] = __41__HMDCameraProfileSettingsManager__start__block_invoke;
          v44[3] = &unk_264A2F3E8;
          v44[4] = v30;
          [v41 updateCameraProfileSettingsModel:v14 completion:v44];
        }
        if (!v9) {
          [(HMDCameraProfileSettingsManager *)v30 _writeInitialSettingsCharacteristicsToCamera];
        }
        if (v40)
        {
          v42 = [(HMDCameraProfileSettingsManager *)v30 coreDataAdapter];
          v43[0] = MEMORY[0x263EF8330];
          v43[1] = 3221225472;
          v43[2] = __41__HMDCameraProfileSettingsManager__start__block_invoke_154;
          v43[3] = &unk_264A2F3E8;
          v43[4] = v30;
          [v42 updateDerivedPropertiesModel:v40 completion:v43];
        }
      }
      else
      {
        [(HMDCameraProfileSettingsManager *)v30 _notifyClientsOfChangedSettingsModel:v15 isInitialSettingsUpdate:1];
        unint64_t v14 = 0;
      }
    }
    else
    {
      [(HMDCameraProfileSettingsManager *)v30 _notifyClientsOfChangedSettingsModel:v15 isInitialSettingsUpdate:1];
    }
  }
}

void __41__HMDCameraProfileSettingsManager__start__block_invoke(uint64_t a1, void *a2)
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
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update Core Data with initial settings model: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __41__HMDCameraProfileSettingsManager__start__block_invoke_154(uint64_t a1, void *a2)
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
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update Core Data with initial derived properties: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (BOOL)canModifyCameraSettings
{
  if ([(HMDCameraProfileSettingsManager *)self isCurrentDeviceConfirmedPrimaryResident])
  {
    return 1;
  }
  char v4 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  id v5 = [v4 home];
  id v6 = [v5 residentEnabledDevices];
  BOOL v3 = [v6 count] == 0;

  return v3;
}

- (BOOL)canRevealCurrentAccessMode
{
  v2 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  BOOL v3 = [v2 home];
  char v4 = [v3 currentUser];
  char v5 = [v4 isRemoteAccessAllowed];

  return v5;
}

- (void)_enablePackageNotificationsOnSettings:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x263F0E590];
  id v4 = a3;
  id v7 = objc_alloc_init(v3);
  char v5 = (void *)[objc_alloc(MEMORY[0x263F0E208]) initWithSignificantEventTypes:16];
  [v7 setSignificantEventReasonCondition:v5];

  [v4 setSmartBulletinBoardNotificationEnabled:1];
  id v6 = [v7 predicate];
  [v4 setSmartBulletinBoardNotificationCondition:v6];
}

- (void)_setManuallyDisabledCharacteristicNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v9[1] = *MEMORY[0x263EF8340];
  char v5 = [(HMDCameraProfileSettingsManager *)self manuallyDisabledCharacteristic];
  if (v5)
  {
    id v6 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
    v9[0] = v5;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    int v8 = [(HMDCameraProfileSettingsManager *)self clientIdentifier];
    [v6 enableNotification:v3 forCharacteristics:v7 message:0 clientIdentifier:v8];
  }
}

- (void)_coordinateSmartBulletinNotificationWithServiceBulletinNotification:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([v4 isEnabled])
  {
    id v6 = [(HMDCameraProfileSettingsManager *)self currentSettings];
    id v7 = [v6 notificationSettings];
    char v8 = [v7 isSmartBulletinBoardNotificationEnabled];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = (void *)MEMORY[0x230FBD990]();
      __int16 v10 = self;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        uint64_t v13 = [v4 service];
        int v17 = 138543618;
        v18 = v12;
        __int16 v19 = 2112;
        id v20 = v13;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Bulletin board notification is enabled for service %@, so enabling smart bulletin board notification with empty significant event types", (uint8_t *)&v17, 0x16u);
      }
      unint64_t v14 = [v6 notificationSettings];
      id v15 = (void *)[v14 mutableCopy];

      [v15 setSmartBulletinBoardNotificationEnabled:1];
      uint64_t v16 = [MEMORY[0x263F0E188] predicateForSignificantEventTypes:0];
      [v15 setSmartBulletinBoardNotificationCondition:v16];

      [(HMDCameraProfileSettingsManager *)v10 _updateCameraBulletinNotificationManagerWithSettings:v15 forMessage:0];
    }
  }
}

- (void)_coordinateDoorbellServiceBulletinNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  char v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    __int16 v10 = [v4 service];
    int v13 = 138543874;
    unint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v4;
    __int16 v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Coordinating notification settings for: %@ service: %@", (uint8_t *)&v13, 0x20u);
  }
  id v11 = [(HMDCameraProfileSettingsManager *)v7 currentSettings];
  uint64_t v12 = [v11 notificationSettings];
  [(HMDCameraProfileSettingsManager *)v7 _updateCameraBulletinNotificationManagerWithSettings:v12 forMessage:0];
}

- (void)_coordinateNotificationSettingsWithServiceBulletinNotification:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 service];
  id v7 = [v6 type];
  int v8 = [v7 isEqualToString:*MEMORY[0x263F0D7A8]];

  if (v8)
  {
    [(HMDCameraProfileSettingsManager *)self _coordinateSmartBulletinNotificationWithServiceBulletinNotification:v4];
  }
  else
  {
    uint64_t v9 = [v6 type];
    int v10 = [v9 isEqualToString:*MEMORY[0x263F0D6C0]];

    if (v10)
    {
      [(HMDCameraProfileSettingsManager *)self _coordinateDoorbellServiceBulletinNotification:v4];
    }
    else
    {
      id v11 = (void *)MEMORY[0x230FBD990]();
      uint64_t v12 = self;
      int v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        unint64_t v14 = HMFGetLogIdentifier();
        __int16 v15 = [v4 service];
        int v16 = 138543874;
        __int16 v17 = v14;
        __int16 v18 = 2112;
        id v19 = v4;
        __int16 v20 = 2112;
        uint64_t v21 = v15;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpected bulletin board notification: %@ service: %@ when coordinating settings", (uint8_t *)&v16, 0x20u);
      }
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
  [(HMDCameraProfileSettingsManager *)self _addWriteRequestToArray:v6 forCharacteristicWithType:*MEMORY[0x263F0C348] ofServiceWithType:*MEMORY[0x263F0D668] value:v8];
}

- (void)_addAccessModeCharacteristicWriteRequestsToArray:(id)a3 currentAccessMode:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = HMIsStreamingAllowedForCameraAccessMode();
  uint64_t v8 = *MEMORY[0x263F0BEF8];
  uint64_t v9 = *MEMORY[0x263F0D660];
  int v10 = [NSNumber numberWithUnsignedChar:v7];
  [(HMDCameraProfileSettingsManager *)self _addWriteRequestToArray:v5 forCharacteristicWithType:v8 ofServiceWithType:v9 value:v10];

  uint64_t v11 = HMIsRecordingAllowedForCameraAccessMode();
  uint64_t v12 = *MEMORY[0x263F0D668];
  id v13 = [NSNumber numberWithUnsignedChar:v11];
  [(HMDCameraProfileSettingsManager *)self _addWriteRequestToArray:v5 forCharacteristicWithType:v8 ofServiceWithType:v12 value:v13];
}

- (void)_addHomeKitCameraActiveCharacteristicWriteRequestToArray:(id)a3 currentAccessMode:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = *MEMORY[0x263F0D658];
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

  uint64_t v8 = *MEMORY[0x263F0C160];
  uint64_t v9 = *MEMORY[0x263F0D658];
  id v10 = [NSNumber numberWithBool:v4];
  [(HMDCameraProfileSettingsManager *)self _addWriteRequestToArray:v6 forCharacteristicWithType:v8 ofServiceWithType:v9 value:v10];
}

- (void)_addPeriodicSnapshotsActiveCharacteristicWriteRequestToArray:(id)a3 periodicSnapshotsAllowed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = *MEMORY[0x263F0D658];
  id v9 = [NSNumber numberWithBool:v4];
  [(HMDCameraProfileSettingsManager *)self _addWriteRequestToArray:v6 forCharacteristicWithType:@"00000225-0000-1000-8000-0026BB765291" ofServiceWithType:v8 value:v9];
}

- (void)_addOperatingModeIndicatorCharacteristicWriteRequestToArray:(id)a3 accessModeIndicatorEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = *MEMORY[0x263F0BF78];
  uint64_t v9 = *MEMORY[0x263F0D658];
  id v10 = [NSNumber numberWithBool:v4];
  [(HMDCameraProfileSettingsManager *)self _addWriteRequestToArray:v6 forCharacteristicWithType:v8 ofServiceWithType:v9 value:v10];
}

- (void)_addNightVisionCharacteristicWriteRequestToArray:(id)a3 nightVisionEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = *MEMORY[0x263F0C2A0];
  uint64_t v9 = *MEMORY[0x263F0D658];
  id v10 = [NSNumber numberWithBool:v4];
  [(HMDCameraProfileSettingsManager *)self _addWriteRequestToArray:v6 forCharacteristicWithType:v8 ofServiceWithType:v9 value:v10];
}

- (void)_addWriteRequestToArray:(id)a3 forCharacteristicWithType:(id)a4 ofServiceWithType:(id)a5 value:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
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
  unint64_t v14 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
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
        __int16 v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v21 = [v20 serviceType];
        int v22 = [v21 isEqualToString:v11];

        if (v22)
        {
          __int16 v23 = [v20 findCharacteristicWithType:v10];
          v24 = v23;
          if (v23)
          {
            __int16 v25 = [v23 authorizationData];
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
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  if ([v6 count])
  {
    id v22 = (id)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"Write settings characteristics"];
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    HMFGetOSLogHandle();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      unint64_t v14 = [v22 identifier];
      __int16 v15 = [v14 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v24 = v13;
      __int16 v25 = 2114;
      id v26 = v15;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Received request to write characteristics: %@", buf, 0x20u);
    }
    uint64_t v16 = [(HMDCameraProfileSettingsManager *)v11 workQueue];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __81__HMDCameraProfileSettingsManager__handleCharacteristicWriteRequests_completion___block_invoke;
    v19[3] = &unk_264A2C9B8;
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
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_111016);
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 error];
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 40) identifier];
      id v12 = [v11 shortDescription];
      int v18 = 138543874;
      id v19 = v10;
      __int16 v20 = 2114;
      id v21 = v12;
      __int16 v22 = 2112;
      id v23 = v3;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to write settings to accessory: %@", (uint8_t *)&v18, 0x20u);
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      unint64_t v14 = [*(id *)(a1 + 40) identifier];
      __int16 v15 = [v14 shortDescription];
      int v18 = 138543618;
      id v19 = v13;
      __int16 v20 = 2114;
      id v21 = v15;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully wrote settings to accessory", (uint8_t *)&v18, 0x16u);
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
  v2 = [a2 error];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_writeInitialSettingsCharacteristicsToCamera
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v11 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Writing initial settings characteristics to camera", buf, 0xCu);
  }
  [(HMDCameraProfileSettingsManager *)v5 setNeedsInitialSettingsCharacteristicSynchronization:1];
  id v8 = [MEMORY[0x263EFF980] array];
  [(HMDCameraProfileSettingsManager *)v5 _addOperatingModeIndicatorCharacteristicWriteRequestToArray:v8 accessModeIndicatorEnabled:1];
  [(HMDCameraProfileSettingsManager *)v5 _addNightVisionCharacteristicWriteRequestToArray:v8 nightVisionEnabled:1];
  [(HMDCameraProfileSettingsManager *)v5 _addSnapshotsActiveCharacteristicWriteRequestToArray:v8 snapshotsAllowed:1];
  [(HMDCameraProfileSettingsManager *)v5 _addPeriodicSnapshotsActiveCharacteristicWriteRequestToArray:v8 periodicSnapshotsAllowed:1];
  [(HMDCameraProfileSettingsManager *)v5 _addRecordingAudioEnabledWriteRequestToArray:v8 recordingAudioEnabled:1];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __79__HMDCameraProfileSettingsManager__writeInitialSettingsCharacteristicsToCamera__block_invoke;
  v9[3] = &unk_264A2F3E8;
  v9[4] = v5;
  [(HMDCameraProfileSettingsManager *)v5 _handleCharacteristicWriteRequests:v8 completion:v9];
}

void __79__HMDCameraProfileSettingsManager__writeInitialSettingsCharacteristicsToCamera__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x230FBD990]();
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
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to write initial settings characteristics: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully wrote initial settings characteristics", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) setNeedsInitialSettingsCharacteristicSynchronization:0];
  }
}

- (void)_updateNotificationSettings:(id)a3 forMessage:(id)a4
{
  id v5 = a4;
  [(HMDCameraProfileSettingsManager *)self _notifyClientsOfCurrentSettings];
  [v5 respondWithSuccess];
}

- (void)_notifyClientsOfChangedSettings:(id)a3 isInitialSettingsUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    __int16 v12 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    uint64_t v32 = v11;
    __int16 v33 = 2112;
    id v34 = v6;
    __int16 v35 = 2112;
    v36 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of changed settings: %@ isInitialSettingsUpdate: %@", buf, 0x20u);
  }
  id v13 = [(HMDCameraProfileSettingsManager *)v9 _payloadForSettings:v6];
  uint64_t v14 = [MEMORY[0x263F42590] entitledMessageWithName:*MEMORY[0x263F0BDD8] messagePayload:v13];
  __int16 v15 = [(HMDCameraProfileSettingsManager *)v9 messageDestination];
  [v14 setDestination:v15];

  uint64_t v16 = [(HMDCameraProfileSettingsManager *)v9 msgDispatcher];
  [v16 sendMessage:v14 completionHandler:0];

  uint64_t v17 = [(HMDCameraProfileSettingsManager *)v9 hapAccessory];
  int v18 = v17;
  if (v17)
  {
    id v19 = [v17 home];
    __int16 v20 = [v19 homeManager];
    id v21 = [(HMDCameraProfileSettingsManager *)v9 uniqueIdentifier];
    [v20 updateGenerationCounterWithReason:@"Camera Settings Updated" sourceUUID:v21 shouldNotifyClients:1];

    __int16 v22 = objc_msgSend(NSNumber, "numberWithBool:", v4, @"HMDCameraProfileSettingsNotificationKey", @"HMDCameraProfileSettingsIsInitialSettingsUpdateNotificationKey", v6);
    v30[1] = v22;
    id v23 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:2];

    uint64_t v24 = [(HMDCameraProfileSettingsManager *)v9 notificationCenter];
    [v24 postNotificationName:@"HMDCameraProfileSettingsDidChangeNotification" object:v18 userInfo:v23];
  }
  else
  {
    __int16 v25 = (void *)MEMORY[0x230FBD990]();
    id v26 = v9;
    __int16 v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v28;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory reference was nil while notifying clients of changed settings", buf, 0xCu);
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

- (void)_notifySubscribersOfUpdatedSettings:(id)a3 previousSettings:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    uint64_t v9 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
    int v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 home];
      __int16 v12 = (void *)v11;
      if (v11)
      {
        v36 = (void *)v11;
        v42 = @"HMDCS.AccessModeChange";
        v40[0] = @"kAccessoryUUID";
        __int16 v35 = [v10 uuid];
        id v34 = [v35 UUIDString];
        v41[0] = v34;
        v40[1] = @"HMDCS.amu.value";
        id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "currentAccessMode"));
        v41[1] = v13;
        v40[2] = @"HMDCS.amu.changeReason";
        uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "currentAccessModeChangeReason"));
        v41[2] = v14;
        v40[3] = @"HMDCS.amu.changeDate";
        __int16 v15 = [v6 currentAccessModeChangeDate];
        uint64_t v16 = v15;
        if (!v15)
        {
          uint64_t v16 = [MEMORY[0x263EFF910] date];
        }
        v41[3] = v16;
        uint64_t v17 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:4];
        v43 = v17;
        int v18 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];

        if (!v15) {
        __int16 v12 = v36;
        }
        id v19 = [v36 cameraBulletinNotificationManager];
        __int16 v20 = [v19 devicesToNotifyForAccessModeChangeForAccessory:v10];

        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __88__HMDCameraProfileSettingsManager__notifySubscribersOfUpdatedSettings_previousSettings___block_invoke;
        v37[3] = &unk_264A1EC90;
        v37[4] = self;
        id v38 = v18;
        id v39 = v6;
        id v21 = v18;
        objc_msgSend(v20, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v37);
      }
      else
      {
        long long v30 = (void *)MEMORY[0x230FBD990]();
        long long v31 = self;
        uint64_t v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          __int16 v33 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v45 = v33;
          _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Home is nil when attempting to notify subscribers of updated camera settings", buf, 0xCu);
        }
      }
    }
    else
    {
      id v26 = (void *)MEMORY[0x230FBD990]();
      __int16 v27 = self;
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v45 = v29;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Accessory is nil when attempting to notify subscribers of updated camera settings", buf, 0xCu);
      }
    }
  }
  else
  {
    __int16 v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = self;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      __int16 v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v45 = v25;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Skip since this is the first time setting is created", buf, 0xCu);
    }
  }
}

void __88__HMDCameraProfileSettingsManager__notifySubscribersOfUpdatedSettings_previousSettings___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [HMDRemoteDeviceMessageDestination alloc];
  id v5 = [*(id *)(a1 + 32) uniqueIdentifier];
  id v6 = [(HMDRemoteDeviceMessageDestination *)v4 initWithTarget:v5 device:v3];

  id v7 = +[HMDRemoteMessage secureMessageWithName:@"HMDCameraSettingsDidChangeMessage" destination:v6 messagePayload:*(void *)(a1 + 40)];
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = *(id *)(a1 + 32);
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = uint64_t v16 = v6;
    __int16 v12 = [v3 shortDescription];
    [*(id *)(a1 + 48) currentAccessMode];
    id v13 = HMCameraAccessModeAsString();
    uint64_t v14 = [v7 shortDescription];
    *(_DWORD *)buf = 138544130;
    int v18 = v11;
    __int16 v19 = 2112;
    __int16 v20 = v12;
    __int16 v21 = 2112;
    __int16 v22 = v13;
    __int16 v23 = 2112;
    uint64_t v24 = v14;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying device %@ for camera access mode change to %@ using message: %@", buf, 0x2Au);

    id v6 = v16;
  }

  __int16 v15 = [*(id *)(a1 + 32) msgDispatcher];
  [v15 sendMessage:v7];
}

- (id)_payloadForSettings:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F0BDE0];
  id v3 = encodeRootObjectForSPIClients(a3);
  v7[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (id)_settingsFromSettingsModel:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F0E918];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [v5 hmbModelID];
  id v8 = (void *)[v6 initWithUUID:v7];

  objc_msgSend(v8, "setSupportedFeatures:", -[HMDCameraProfileSettingsManager supportedFeatures](self, "supportedFeatures"));
  objc_msgSend(v8, "setAccessModeAtHome:", objc_msgSend(v5, "accessModeAtHome"));
  objc_msgSend(v8, "setAccessModeNotAtHome:", objc_msgSend(v5, "accessModeNotAtHome"));
  objc_msgSend(v8, "setRecordingEventTriggers:", objc_msgSend(v5, "recordingEventTriggers"));
  objc_msgSend(v8, "setCameraManuallyDisabled:", objc_msgSend(v5, "cameraManuallyDisabled"));
  id v9 = [(HMDCameraProfileSettingsManager *)self currentNotificationSettings];
  [v8 setNotificationSettings:v9];

  int v10 = [v5 activityZones];
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
  id v13 = (void *)[v8 copy];

  return v13;
}

- (NSUUID)derivedPropertiesModelID
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F08C38];
  id v3 = [(HMDCameraProfileSettingsManager *)self uniqueIdentifier];
  v7[0] = @"2b32a3ee-3908-406e-890d-74f9c410ef2b";
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v5 = objc_msgSend(v2, "hm_deriveUUIDFromBaseUUID:withSalts:", v3, v4);

  return (NSUUID *)v5;
}

- (id)_settingsModelForUpdate
{
  id v3 = [HMDCameraProfileSettingsModel alloc];
  id v4 = [(HMDCameraProfileSettingsManager *)self uniqueIdentifier];
  id v5 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  id v6 = [v5 uuid];
  id v7 = [(HMBModel *)v3 initWithModelID:v4 parentModelID:v6];

  return v7;
}

- (void)_synchronizeCurrentAccessModeSettingToCameraWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v12 = 138543362;
    id v13 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Synchronizing current access mode settings to camera", (uint8_t *)&v12, 0xCu);
  }
  int v10 = [(HMDCameraProfileSettingsManager *)v7 currentSettingsModel];
  uint64_t v11 = [MEMORY[0x263EFF980] array];
  -[HMDCameraProfileSettingsManager _addAccessModeCharacteristicWriteRequestsToArray:currentAccessMode:](v7, "_addAccessModeCharacteristicWriteRequestsToArray:currentAccessMode:", v11, [v10 currentAccessMode]);
  -[HMDCameraProfileSettingsManager _addHomeKitCameraActiveCharacteristicWriteRequestToArray:currentAccessMode:](v7, "_addHomeKitCameraActiveCharacteristicWriteRequestToArray:currentAccessMode:", v11, [v10 currentAccessMode]);
  [(HMDCameraProfileSettingsManager *)v7 _handleCharacteristicWriteRequests:v11 completion:v4];
}

- (void)_populateCurrentAccessModeFieldForDerivedProperties:(id)a3 currentSettings:(id)a4 userInitiated:(BOOL)a5 didUpdateField:(BOOL *)a6
{
  BOOL v7 = a5;
  uint64_t v88 = *MEMORY[0x263EF8340];
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
    __int16 v77 = v15;
    if ([(HMDCameraProfileSettingsManager *)self isCameraManuallyDisabled])
    {
      uint64_t v16 = (void *)MEMORY[0x230FBD990]();
      uint64_t v17 = self;
      int v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        __int16 v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v79 = v19;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Camera is manually disabled, setting current access mode to off", buf, 0xCu);
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
      context = (void *)MEMORY[0x230FBD990]();
      uint64_t v29 = self;
      long long v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        __int16 v69 = HMFGetLogIdentifier();
        v68 = HMCameraAccessModeAsString();
        [v77 BOOLValue];
        HMFBooleanToString();
        long long v31 = v67 = v29;
        uint64_t v32 = HMCameraAccessModeAsString();
        __int16 v33 = HMCameraAccessModeAsString();
        *(_DWORD *)buf = 138544386;
        uint64_t v79 = v69;
        __int16 v80 = 2112;
        v81 = v68;
        __int16 v82 = 2112;
        v83 = v31;
        __int16 v84 = 2112;
        uint64_t v85 = (uint64_t)v32;
        __int16 v86 = 2112;
        v87 = v33;
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Determined expected access mode of %@ based on isAnyUserAtHome = %@, accessModeAtHome = %@, accessModeNotAtHome = %@", buf, 0x34u);

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
      id v34 = (void *)MEMORY[0x230FBD990]();
      __int16 v35 = self;
      v36 = HMFGetOSLogHandle();
      BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_INFO);
      if (v13 != v14)
      {
        if (v37)
        {
          id v66 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v79 = v66;
          _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@Presence is unavailable; not updating current access mode",
            buf,
            0xCu);
        }
        goto LABEL_49;
      }
      if (v37)
      {
        contexta = HMFGetLogIdentifier();
        __int16 v73 = v34;
        id v38 = HMCameraAccessModeAsString();
        id v39 = HMCameraAccessModeAsString();
        HMCameraAccessModeAsString();
        *(_DWORD *)buf = 138544130;
        uint64_t v79 = contexta;
        __int16 v80 = 2112;
        v81 = v38;
        __int16 v82 = 2112;
        v83 = v39;
        v85 = __int16 v84 = 2112;
        uint64_t v40 = (void *)v85;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@Determined expected access mode of %@ because accessModeAtHome (%@) and accessModeNotAtHome (%@) are the same", buf, 0x2Au);

        id v34 = v73;
      }

      uint64_t v21 = 4;
      uint64_t v20 = v13;
    }
    if ((objc_msgSend(v10, "hmbPropertyWasSet:", @"currentAccessModeField", v67) & 1) == 0)
    {
      v41 = (void *)MEMORY[0x230FBD990]();
      v42 = self;
      v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v44 = uint64_t v74 = v21;
        id v45 = HMCameraAccessModeAsString();
        *(_DWORD *)buf = 138543618;
        uint64_t v79 = v44;
        __int16 v80 = 2112;
        v81 = v45;
        _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_INFO, "%{public}@Setting initial currentAccessMode to %@", buf, 0x16u);

        uint64_t v21 = v74;
      }

      [v10 setCurrentAccessMode:v20];
      if (a6) {
        *a6 = 1;
      }
    }
    if (([v10 hmbPropertyWasSet:@"currentAccessModeChangeReasonField"] & 1) == 0)
    {
      uint64_t v46 = (void *)MEMORY[0x230FBD990]();
      v47 = self;
      __int16 v48 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        id v49 = HMFGetLogIdentifier();
        [NSNumber numberWithInteger:v21];
        uint64_t v75 = v20;
        v51 = uint64_t v50 = v21;
        *(_DWORD *)buf = 138543618;
        uint64_t v79 = v49;
        __int16 v80 = 2112;
        v81 = v51;
        _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_INFO, "%{public}@Setting initial currentAccessModeChangeReason to %@", buf, 0x16u);

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
      v52 = (void *)MEMORY[0x230FBD990]();
      v53 = self;
      v54 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        v55 = HMFGetLogIdentifier();
        [v10 currentAccessMode];
        v56 = HMCameraAccessModeAsString();
        HMCameraAccessModeAsString();
        v76 = v52;
        uint64_t v57 = v20;
        v59 = uint64_t v58 = v21;
        *(_DWORD *)buf = 138543874;
        uint64_t v79 = v55;
        __int16 v80 = 2112;
        v81 = v56;
        __int16 v82 = 2112;
        v83 = v59;
        _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_INFO, "%{public}@Changing currentAccessMode field from %@ to %@", buf, 0x20u);

        uint64_t v21 = v58;
        uint64_t v20 = v57;
        v52 = v76;
      }
      [v10 setCurrentAccessMode:v20];
      if ([v10 currentAccessModeChangeReason] != v21)
      {
        v60 = (void *)MEMORY[0x230FBD990]();
        v61 = v53;
        v62 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          v63 = HMFGetLogIdentifier();
          v64 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "currentAccessModeChangeReason"));
          v65 = [NSNumber numberWithInteger:v21];
          *(_DWORD *)buf = 138543874;
          uint64_t v79 = v63;
          __int16 v80 = 2112;
          v81 = v64;
          __int16 v82 = 2112;
          v83 = v65;
          _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_INFO, "%{public}@Changing currentAccessModeChangeReason from %@ to %@", buf, 0x20u);
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
  __int16 v22 = (void *)MEMORY[0x230FBD990]();
  __int16 v23 = self;
  uint64_t v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = HMFGetLogIdentifier();
    id v26 = [v11 debugDescription];
    *(_DWORD *)buf = 138543618;
    uint64_t v79 = v25;
    __int16 v80 = 2112;
    v81 = v26;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Cannot update currentAccessMode, settings model does not include accessMode values: %@", buf, 0x16u);
  }
LABEL_50:
}

- (id)_updatedDerivedPropertiesModelWithSettingsModel:(id)a3 userInitiated:(BOOL)a4 didCreateModel:(BOOL *)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v9);

  if (a5) {
    *a5 = 0;
  }
  id v10 = [(HMDCameraProfileSettingsManager *)self coreDataAdapter];
  id v11 = [v10 fetchDerivedPropertiesModelWithError:0];

  if (v11)
  {
    int v12 = 0;
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    uint64_t v14 = self;
    __int16 v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v24 = 138543362;
      uint64_t v25 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Creating a new derived properties model because one doesn't exist already", (uint8_t *)&v24, 0xCu);
    }
    uint64_t v17 = [HMDCameraProfileSettingsDerivedPropertiesModel alloc];
    int v18 = [(HMDCameraProfileSettingsManager *)v14 derivedPropertiesModelID];
    __int16 v19 = [(HMDCameraProfileSettingsManager *)v14 uniqueIdentifier];
    uint64_t v20 = [(HMBModel *)v17 initWithModelID:v18 parentModelID:v19];

    uint64_t v21 = v20;
    id v11 = v21;
    if (a5) {
      *a5 = 1;
    }
    int v12 = v21;
  }
  LOBYTE(v24) = 0;
  [(HMDCameraProfileSettingsManager *)self _populateCurrentAccessModeFieldForDerivedProperties:v11 currentSettings:v8 userInitiated:v6 didUpdateField:&v24];
  if ((_BYTE)v24)
  {
    __int16 v22 = v11;

    int v12 = v22;
  }

  return v12;
}

- (void)_updateDerivedPropertiesModelWithSettingsModel:(id)a3 userInitiated:(BOOL)a4 reason:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = (void *)MEMORY[0x230FBD990]();
  int v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    __int16 v15 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    uint64_t v20 = v14;
    __int16 v21 = 2112;
    __int16 v22 = v15;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating derived properties with userInitiated=%@ due to %@", buf, 0x20u);
  }
  buf[0] = 0;
  uint64_t v16 = [(HMDCameraProfileSettingsManager *)v12 _updatedDerivedPropertiesModelWithSettingsModel:v8 userInitiated:v6 didCreateModel:buf];
  if (v16)
  {
    uint64_t v17 = [(HMDCameraProfileSettingsManager *)v12 coreDataAdapter];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __103__HMDCameraProfileSettingsManager__updateDerivedPropertiesModelWithSettingsModel_userInitiated_reason___block_invoke;
    v18[3] = &unk_264A2F3E8;
    v18[4] = v12;
    [v17 updateDerivedPropertiesModel:v16 completion:v18];
  }
}

void __103__HMDCameraProfileSettingsManager__updateDerivedPropertiesModelWithSettingsModel_userInitiated_reason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    BOOL v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Updating derived properties model failed: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (BOOL)isCameraManuallyDisabled
{
  uint64_t v21 = *MEMORY[0x263EF8340];
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
      __int16 v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = self;
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = HMFGetLogIdentifier();
        int v15 = 138543874;
        uint64_t v16 = v13;
        __int16 v17 = 2112;
        int v18 = v5;
        __int16 v19 = 2112;
        uint64_t v20 = 0;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Characteristic %@ has unhandled value type: %@", (uint8_t *)&v15, 0x20u);
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

- (id)doorbellInputEventCharacteristic
{
  v2 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  id v3 = [v2 findCharacteristicType:*MEMORY[0x263F0C208] forServiceType:*MEMORY[0x263F0D6C0]];

  return v3;
}

- (id)manuallyDisabledCharacteristic
{
  v2 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  id v3 = [v2 findCharacteristicType:@"00000227-0000-1000-8000-0026BB765291" forServiceType:*MEMORY[0x263F0D658]];

  return v3;
}

- (BOOL)_migrateSettingsModel:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
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
      BOOL v7 = (void *)MEMORY[0x230FBD990]();
      id v8 = self;
      char v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        __int16 v10 = HMFGetLogIdentifier();
        [v4 recordingEventTriggers];
        id v11 = HMCameraSignificantEventTypesAsString();
        int v24 = 138543618;
        uint64_t v25 = v10;
        __int16 v26 = 2112;
        uint64_t v27 = (uint64_t)v11;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Settings are for doorbell camera; adding HMCameraSignificantEventTypePackages to existing recording "
          "event triggers: %@",
          (uint8_t *)&v24,
          0x16u);
      }
      objc_msgSend(v4, "setRecordingEventTriggers:", objc_msgSend(v4, "recordingEventTriggers") | 0x10);
    }
    if ([v4 recordingEventTriggers])
    {
      uint64_t v12 = (void *)MEMORY[0x230FBD990]();
      uint64_t v13 = self;
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = HMFGetLogIdentifier();
        [v4 recordingEventTriggers];
        uint64_t v16 = HMCameraSignificantEventTypesAsString();
        int v24 = 138543618;
        uint64_t v25 = v15;
        __int16 v26 = 2112;
        uint64_t v27 = (uint64_t)v16;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Settings have Any Motion recording trigger; adding all significant event types to existing recording"
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
  int v18 = (void *)MEMORY[0x230FBD990]();
  __int16 v19 = self;
  uint64_t v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = HMFGetLogIdentifier();
    uint64_t v22 = [v4 version];
    int v24 = 138543874;
    uint64_t v25 = v21;
    __int16 v26 = 2048;
    uint64_t v27 = v22;
    __int16 v28 = 2048;
    uint64_t v29 = 1;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Updating settings model version from %ld to %ld", (uint8_t *)&v24, 0x20u);
  }
  BOOL v17 = 1;
  [v4 setVersion:1];
LABEL_16:

  return v17;
}

- (BOOL)_migrateNotificationSettings:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 version];
  BOOL v7 = 0;
  if (v6 == 1) {
    goto LABEL_22;
  }
  if (v6) {
    goto LABEL_41;
  }
  id v8 = [(HMDCameraProfileSettingsManager *)self doorbellInputEventCharacteristic];

  if (v8)
  {
    char v9 = [v4 smartBulletinBoardNotificationCondition];
    if (!v9)
    {
      if (isAppleTV())
      {
        __int16 v23 = (void *)MEMORY[0x230FBD990]();
        int v24 = self;
        uint64_t v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          __int16 v26 = HMFGetLogIdentifier();
          int v52 = 138543362;
          v53 = v26;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Settings are for doorbell camera but there is no notification condition; enabling significant even"
            "t notifications for HMCameraSignificantEventTypePackages only",
            (uint8_t *)&v52,
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
    __int16 v10 = (void *)[objc_alloc(MEMORY[0x263F0E180]) initWithPredicate:v9];
    id v11 = [v10 significantEventReasonCondition];
    uint64_t v12 = [v11 significantEventTypes];

    if (v12)
    {
      uint64_t v13 = (void *)MEMORY[0x230FBD990]();
      uint64_t v14 = self;
      int v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        BOOL v17 = [v10 significantEventReasonCondition];
        int v52 = 138543618;
        v53 = v16;
        __int16 v54 = 2112;
        uint64_t v55 = (uint64_t)v17;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Settings are for doorbell camera; adding HMCameraSignificantEventTypePackages to existing significan"
          "t event notification condition: %@",
          (uint8_t *)&v52,
          0x16u);
      }
      int v18 = [v10 significantEventReasonCondition];
      uint64_t v19 = [v18 significantEventTypes] | 0x10;

      uint64_t v20 = (void *)[v10 mutableCopy];
      uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263F0E208]) initWithSignificantEventTypes:v19];
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
      uint64_t v27 = (void *)MEMORY[0x230FBD990]();
      __int16 v28 = self;
      uint64_t v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        uint64_t v30 = HMFGetLogIdentifier();
        int v52 = 138543362;
        v53 = v30;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@Settings are for doorbell camera but there are no significantEventTypes in the condition; enabling s"
          "ignificant event notifications for HMCameraSignificantEventTypePackages only",
          (uint8_t *)&v52,
          0xCu);
      }
      [(HMDCameraProfileSettingsManager *)v28 _enablePackageNotificationsOnSettings:v4];
    }
    BOOL v7 = 1;
LABEL_19:

LABEL_21:
    goto LABEL_22;
  }
  BOOL v7 = 0;
LABEL_22:
  uint64_t v31 = [v4 version];
  uint64_t v32 = *MEMORY[0x263F0BDB8];
  if (v31 != *MEMORY[0x263F0BDB8])
  {
    __int16 v33 = (void *)MEMORY[0x230FBD990]();
    id v34 = self;
    __int16 v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = HMFGetLogIdentifier();
      uint64_t v37 = [v4 version];
      int v52 = 138543874;
      v53 = v36;
      __int16 v54 = 2048;
      uint64_t v55 = v37;
      __int16 v56 = 2048;
      uint64_t v57 = 1;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@Updating notification settings version from %ld to %ld", (uint8_t *)&v52, 0x20u);
    }
    [v4 setVersion:v32];
    BOOL v7 = 1;
  }
  if (isAppleTV())
  {
    if ([v4 isAccessModeChangeNotificationEnabled])
    {
      id v38 = (void *)MEMORY[0x230FBD990]();
      id v39 = self;
      uint64_t v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        v41 = HMFGetLogIdentifier();
        int v52 = 138543362;
        v53 = v41;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, "%{public}@Forcing access mode notification to disabled during settings migration on Apple TV", (uint8_t *)&v52, 0xCu);
      }
      [v4 setAccessModeChangeNotificationEnabled:0];
      BOOL v7 = 1;
    }
    if ([v4 isReachabilityEventNotificationEnabled])
    {
      v42 = (void *)MEMORY[0x230FBD990]();
      v43 = self;
      v44 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        id v45 = HMFGetLogIdentifier();
        int v52 = 138543362;
        v53 = v45;
        _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_INFO, "%{public}@Forcing reachability notification to disabled during settings migration on Apple TV", (uint8_t *)&v52, 0xCu);
      }
      [v4 setReachabilityEventNotificationEnabled:0];
      BOOL v7 = 1;
    }
  }
  if (isHomePod())
  {
    id v46 = objc_alloc_init(MEMORY[0x263F0E598]);
    if (([v4 isEqual:v46] & 1) == 0)
    {
      v47 = (void *)MEMORY[0x230FBD990]();
      __int16 v48 = self;
      id v49 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        uint64_t v50 = HMFGetLogIdentifier();
        int v52 = 138543362;
        v53 = v50;
        _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_INFO, "%{public}@Forcing all notification settings to disabled during settings migration on HomePod", (uint8_t *)&v52, 0xCu);
      }
      [v4 setAccessModeChangeNotificationEnabled:0];
      [v4 setReachabilityEventNotificationEnabled:0];
      [v4 setSmartBulletinBoardNotificationEnabled:0];
      [v4 setSmartBulletinBoardNotificationCondition:0];
      BOOL v7 = 1;
    }
  }
LABEL_41:

  return v7;
}

- (id)_createNotificationSettingsUsingSettingsModel:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc_init(MEMORY[0x263F0E598]);
  int v7 = [v4 hasAnyNotificationFieldsSet];
  id v8 = (void *)MEMORY[0x230FBD990]();
  char v9 = self;
  __int16 v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v11)
    {
      uint64_t v12 = HMFGetLogIdentifier();
      uint64_t v13 = [v4 debugDescription];
      uint64_t v14 = [v4 smartBulletinBoardNotification];
      int v35 = 138543874;
      v36 = v12;
      __int16 v37 = 2112;
      id v38 = v13;
      __int16 v39 = 2112;
      uint64_t v40 = v14;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Migrating notification settings from settings model: %@, smart bulletin board notification: %@", (uint8_t *)&v35, 0x20u);
    }
    [v6 setVersion:*MEMORY[0x263F0BDB8]];
    objc_msgSend(v6, "setAccessModeChangeNotificationEnabled:", objc_msgSend(v4, "accessModeChangeNotificationEnabled"));
    objc_msgSend(v6, "setReachabilityEventNotificationEnabled:", objc_msgSend(v4, "reachabilityEventNotificationEnabled"));
    int v15 = [v4 smartBulletinBoardNotification];
    objc_msgSend(v6, "setSmartBulletinBoardNotificationEnabled:", objc_msgSend(v15, "isEnabled"));

    uint64_t v16 = [v4 smartBulletinBoardNotification];
    BOOL v17 = [v16 condition];
    [v6 setSmartBulletinBoardNotificationCondition:v17];

    if (isHomePod())
    {
      int v18 = (void *)MEMORY[0x230FBD990]();
      uint64_t v19 = v9;
      uint64_t v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        int v35 = 138543362;
        v36 = v21;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Forcing all notification settings to disabled on HomePod", (uint8_t *)&v35, 0xCu);
      }
      [v6 setAccessModeChangeNotificationEnabled:0];
      [v6 setReachabilityEventNotificationEnabled:0];
      [v6 setSmartBulletinBoardNotificationEnabled:0];
      uint64_t v22 = [v6 setSmartBulletinBoardNotificationCondition:0];
    }
    else
    {
      uint64_t v22 = isAppleTV();
      if (v22)
      {
        uint64_t v25 = (void *)MEMORY[0x230FBD990]();
        __int16 v26 = v9;
        uint64_t v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v28 = HMFGetLogIdentifier();
          int v35 = 138543362;
          v36 = v28;
          _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Forcing access mode and reachability notification settings to disabled on AppleTV", (uint8_t *)&v35, 0xCu);
        }
        [v6 setAccessModeChangeNotificationEnabled:0];
        uint64_t v22 = [v6 setReachabilityEventNotificationEnabled:0];
      }
    }
    uint64_t v29 = (void *)MEMORY[0x230FBD990](v22);
    uint64_t v30 = v9;
    uint64_t v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      uint64_t v32 = HMFGetLogIdentifier();
      int v35 = 138543618;
      v36 = v32;
      __int16 v37 = 2112;
      id v38 = v6;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Migrated to new notification settings: %@", (uint8_t *)&v35, 0x16u);
    }
  }
  else
  {
    if (v11)
    {
      __int16 v23 = HMFGetLogIdentifier();
      int v35 = 138543362;
      v36 = v23;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Creating new notification settings using default values", (uint8_t *)&v35, 0xCu);
    }
    [v6 setVersion:*MEMORY[0x263F0BDB8]];
    if (!isTVOSDevice())
    {
      [v6 setAccessModeChangeNotificationEnabled:1];
      [v6 setReachabilityEventNotificationEnabled:1];
    }
    int v24 = [(HMDCameraProfileSettingsManager *)v9 doorbellInputEventCharacteristic];

    if (isAppleTV() && v24) {
      [(HMDCameraProfileSettingsManager *)v9 _enablePackageNotificationsOnSettings:v6];
    }
    else {
      [v6 setSmartBulletinBoardNotificationEnabled:0];
    }
  }
  __int16 v33 = (void *)[v6 copy];

  return v33;
}

- (void)_initializeNotificationSettingsUsingSettingsModel:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  if (v6)
  {
    int v7 = [(HMDCameraProfileSettingsManager *)self cameraBulletinNotificationManager];
    id v8 = [v7 cameraUserNotificationSettingsForAccessory:v6];
    char v9 = (void *)[v8 mutableCopy];

    if (v9)
    {
      if ([(HMDCameraProfileSettingsManager *)self _migrateNotificationSettings:v9]) {
        [(HMDCameraProfileSettingsManager *)self _updateCameraBulletinNotificationManagerWithSettings:v9 forMessage:0];
      }
    }
    else
    {
      uint64_t v14 = [(HMDCameraProfileSettingsManager *)self _createNotificationSettingsUsingSettingsModel:v4];
      [(HMDCameraProfileSettingsManager *)self _updateCameraBulletinNotificationManagerWithSettings:v14 forMessage:0];
    }
  }
  else
  {
    __int16 v10 = (void *)MEMORY[0x230FBD990]();
    BOOL v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Accessory reference is nil", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (id)_coreDataUpdateCompletionForMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __71__HMDCameraProfileSettingsManager__coreDataUpdateCompletionForMessage___block_invoke;
  v9[3] = &unk_264A2F370;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  int v7 = _Block_copy(v9);

  return v7;
}

void __71__HMDCameraProfileSettingsManager__coreDataUpdateCompletionForMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__HMDCameraProfileSettingsManager__coreDataUpdateCompletionForMessage___block_invoke_2;
  block[3] = &unk_264A2F2F8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __71__HMDCameraProfileSettingsManager__coreDataUpdateCompletionForMessage___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = HMFGetOSLogHandle();
  id v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = [*(id *)(a1 + 48) name];
      uint64_t v9 = *(void *)(a1 + 32);
      int v14 = 138543874;
      int v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update settings for message %@: %@", (uint8_t *)&v14, 0x20u);
    }
    uint64_t v10 = *(void **)(a1 + 48);
    id v11 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v10 respondWithError:v11];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      uint64_t v13 = [*(id *)(a1 + 48) name];
      int v14 = 138543618;
      int v15 = v12;
      __int16 v16 = 2112;
      uint64_t v17 = v13;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Updated settings for message %@", (uint8_t *)&v14, 0x16u);
    }
    [*(id *)(a1 + 48) respondWithSuccess];
  }
}

- (HMDCameraProfileSettingsDerivedPropertiesModel)derivedPropertiesModel
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraProfileSettingsManager *)self coreDataAdapter];
  id v14 = 0;
  id v4 = [v3 fetchDerivedPropertiesModelWithError:&v14];
  id v5 = v14;

  if (!v4)
  {
    if (v5)
    {
      id v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = self;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v16 = v9;
        __int16 v17 = 2112;
        id v18 = v5;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Error fetching derived properties: %@", buf, 0x16u);
      }
    }
    uint64_t v10 = [HMDCameraProfileSettingsDerivedPropertiesModel alloc];
    id v11 = [(HMDCameraProfileSettingsManager *)self derivedPropertiesModelID];
    uint64_t v12 = [(HMDCameraProfileSettingsManager *)self uniqueIdentifier];
    id v4 = [(HMBModel *)v10 initWithModelID:v11 parentModelID:v12];

    [(HMDCameraProfileSettingsDerivedPropertiesModel *)v4 setCurrentAccessModeChangeReason:0];
    [(HMDCameraProfileSettingsDerivedPropertiesModel *)v4 setCurrentAccessMode:1];
  }

  return v4;
}

- (void)_handleConnectedToAccessory
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Connected to accessory", (uint8_t *)&v9, 0xCu);
  }
  [(HMDCameraProfileSettingsManager *)v5 _setManuallyDisabledCharacteristicNotificationsEnabled:1];
  if ([(HMDCameraProfileSettingsManager *)v5 isCurrentDeviceConfirmedPrimaryResident])
  {
    id v8 = [(HMDCameraProfileSettingsManager *)v5 currentSettingsModel];
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
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __94__HMDCameraProfileSettingsManager_handleBulletinNotificationEnableStateDidChangeNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __94__HMDCameraProfileSettingsManager_handleBulletinNotificationEnableStateDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
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
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 40);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = [*(id *)(a1 + 32) name];
      uint64_t v10 = [*(id *)(a1 + 32) object];
      int v11 = 138543874;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v9;
      __int16 v15 = 2112;
      __int16 v16 = v10;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unexpected notification object for %@: %@", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)handleUserRemoteAccessDidChangeNotification:(id)a3
{
  id v4 = [(HMDCameraProfileSettingsManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__HMDCameraProfileSettingsManager_handleUserRemoteAccessDidChangeNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __79__HMDCameraProfileSettingsManager_handleUserRemoteAccessDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Current user's remote access changed, so notifying clients of current settings", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _notifyClientsOfCurrentSettings];
}

- (void)handleCharacteristicsValueUpdatedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __81__HMDCameraProfileSettingsManager_handleCharacteristicsValueUpdatedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __81__HMDCameraProfileSettingsManager_handleCharacteristicsValueUpdatedNotification___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
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
          int v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v11, "type", v20);
          int v13 = [v12 isEqual:@"00000227-0000-1000-8000-0026BB765291"];

          if (v13)
          {
            id v14 = (void *)MEMORY[0x230FBD990]();
            id v15 = *(id *)(a1 + 32);
            __int16 v16 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              uint64_t v17 = HMFGetLogIdentifier();
              *(_DWORD *)buf = v20;
              uint64_t v27 = v17;
              __int16 v28 = 2112;
              uint64_t v29 = v11;
              _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Handling Manually Disabled characteristic change: %@", buf, 0x16u);
            }
            id v18 = *(void **)(a1 + 32);
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
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__HMDCameraProfileSettingsManager_handleRecordingManagementServiceDidUpdateNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
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
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__HMDCameraProfileSettingsManager_handleAccessoryConfiguredNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
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
      uint64_t v6 = (void *)MEMORY[0x263EFFA88];
    }
    else {
      uint64_t v6 = 0;
    }
  }
  return v6;
}

- (BOOL)_setAnyUserAtHomeFromPresenceMonitorWithHome:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 presenceMonitor];
  int v7 = [v6 currentHomePresence];

  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    int v26 = 138543618;
    uint64_t v27 = v11;
    __int16 v28 = 2112;
    uint64_t v29 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Evaluating home presence: %@", (uint8_t *)&v26, 0x16u);
  }
  if (v7)
  {
    uint64_t v12 = [(HMDCameraProfileSettingsManager *)v9 _isAnyUserAtHomeForPresence:v7];
    int v13 = [(HMDCameraProfileSettingsManager *)v9 isAnyUserAtHome];
    char v14 = HMFEqualObjects();

    if ((v14 & 1) == 0)
    {
      id v15 = (void *)MEMORY[0x230FBD990]();
      __int16 v16 = v9;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = HMFGetLogIdentifier();
        uint64_t v19 = [(HMDCameraProfileSettingsManager *)v16 isAnyUserAtHome];
        int v26 = 138543874;
        uint64_t v27 = v18;
        __int16 v28 = 2112;
        uint64_t v29 = v19;
        __int16 v30 = 2112;
        uint64_t v31 = v12;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Updating isAnyUserAtHome from %@ to %@", (uint8_t *)&v26, 0x20u);
      }
      [(HMDCameraProfileSettingsManager *)v16 setAnyUserAtHome:v12];
    }
    char v20 = v14 ^ 1;
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x230FBD990]();
    long long v22 = v9;
    long long v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      long long v24 = HMFGetLogIdentifier();
      int v26 = 138543362;
      uint64_t v27 = v24;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Presence is unavailable; setting isAnyUserAtHome to nil",
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
  uint64_t v14 = *MEMORY[0x263EF8340];
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
    int v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      int v13 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Home is nil; setting isAnyUserAtHome to nil",
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
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__HMDCameraProfileSettingsManager_handleHomePresenceEvaluatedNotification___block_invoke;
    block[3] = &unk_264A2F7F8;
    void block[4] = self;
    dispatch_async(v4, block);
  }
}

void __75__HMDCameraProfileSettingsManager_handleHomePresenceEvaluatedNotification___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    int v8 = 138543362;
    uint64_t v9 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received Home Presence Evaluated", (uint8_t *)&v8, 0xCu);
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
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__HMDCameraProfileSettingsManager_handlePrimaryResidentUpdatedNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __76__HMDCameraProfileSettingsManager_handlePrimaryResidentUpdatedNotification___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  char v2 = [*(id *)(a1 + 32) isCurrentDeviceConfirmedPrimaryResident];
  id v3 = (void *)MEMORY[0x230FBD990]();
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
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@We are now the primary resident", (uint8_t *)&v12, 0xCu);
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
      int v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      int v13 = v11;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Another device is primary resident, clearing anyUserAtHome", (uint8_t *)&v12, 0xCu);
    }
    return [*(id *)(a1 + 32) setAnyUserAtHome:0];
  }
}

- (void)_handleCameraSettingsDidChangeMessage:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)MEMORY[0x230FBD990]();
  int v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    uint64_t v10 = [v4 shortDescription];
    *(_DWORD *)buf = 138543618;
    int v52 = v9;
    __int16 v53 = 2112;
    __int16 v54 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Received camera settings did change message: %@", buf, 0x16u);
  }
  int v11 = [v4 dictionaryForKey:@"HMDCS.AccessModeChange"];
  int v12 = objc_msgSend(v11, "hmf_numberForKey:", @"HMDCS.amu.value");
  uint64_t v50 = objc_msgSend(v11, "hmf_numberForKey:", @"HMDCS.amu.changeReason");
  uint64_t v13 = objc_msgSend(v11, "hmf_dateForKey:", @"HMDCS.amu.changeDate");
  uint64_t v14 = (void *)v13;
  if (v12 && v50 && v13)
  {
    id v15 = [(HMDCameraProfileSettingsManager *)v7 hapAccessory];
    __int16 v16 = [v15 cameraProfiles];
    uint64_t v17 = [v16 anyObject];

    id v49 = [v15 home];
    id v18 = [(HMDCameraProfileSettingsManager *)v7 currentNotificationSettings];
    int v19 = [v18 isAccessModeChangeNotificationEnabled];

    if (v19
      && v17
      && v49
      && [(HMDCameraProfileSettingsManager *)v7 canRevealCurrentAccessMode])
    {
      char v20 = [HMDCameraAccessModeChangedBulletin alloc];
      id v45 = v17;
      uint64_t v21 = [v12 unsignedIntegerValue];
      uint64_t v22 = [v50 integerValue];
      uint64_t v23 = v21;
      uint64_t v17 = v45;
      long long v24 = [(HMDCameraAccessModeChangedBulletin *)v20 initWithAccessMode:v23 camera:v45 home:v49 changeReason:v22 changeDate:v14];
      if (v24)
      {
        long long v25 = (void *)MEMORY[0x230FBD990]();
        int v26 = v7;
        uint64_t v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          __int16 v28 = contexta = v25;
          *(_DWORD *)buf = 138543618;
          int v52 = v28;
          __int16 v53 = 2112;
          __int16 v54 = v24;
          _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Posting camera access mode changed bulletin based upon notification: %@", buf, 0x16u);

          long long v25 = contexta;
        }

        uint64_t v29 = [(HMDCameraProfileSettingsManager *)v26 bulletinBoard];
        [v29 insertCameraAccessModeChangedBulletin:v24];

        uint64_t v17 = v45;
      }
    }
    else
    {
      context = (void *)MEMORY[0x230FBD990]();
      int v35 = v7;
      v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        __int16 v37 = HMFGetLogIdentifier();
        HMFBooleanToString();
        id v38 = (HMDCameraAccessModeChangedBulletin *)objc_claimAutoreleasedReturnValue();
        v42 = v12;
        if (v17) {
          __int16 v39 = @"<not nil>";
        }
        else {
          __int16 v39 = @"<nil>";
        }
        id v46 = v17;
        if (v49) {
          uint64_t v40 = @"<not nil>";
        }
        else {
          uint64_t v40 = @"<nil>";
        }
        [(HMDCameraProfileSettingsManager *)v35 canRevealCurrentAccessMode];
        HMFBooleanToString();
        uint64_t v41 = v44 = v14;
        *(_DWORD *)buf = 138544386;
        int v52 = v37;
        __int16 v53 = 2112;
        __int16 v54 = v38;
        __int16 v55 = 2112;
        __int16 v56 = v39;
        int v12 = v43;
        __int16 v57 = 2112;
        uint64_t v58 = v40;
        uint64_t v17 = v46;
        __int16 v59 = 2112;
        v60 = v41;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@Not posting access mode change bulletin due to settings change message because accessModeChangeNotificationEnabled=%@ cameraProfile=%@ home=%@ canRevealCurrentAccessMode=%@", buf, 0x34u);

        uint64_t v14 = v44;
      }
    }
    [v4 respondWithSuccess];
  }
  else
  {
    __int16 v30 = (void *)MEMORY[0x230FBD990]();
    uint64_t v31 = v7;
    uint64_t v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      __int16 v33 = HMFGetLogIdentifier();
      id v34 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      int v52 = v33;
      __int16 v53 = 2112;
      __int16 v54 = v34;
      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Invalid access mode change payload %@", buf, 0x16u);
    }
    id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
    [v4 respondWithError:v15];
  }
}

- (void)_handleUpdateReachabilityEventNotificationEnabledMessage:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)MEMORY[0x230FBD990]();
  int v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v26 = 138543362;
    uint64_t v27 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Processing request to change reachability event notification enabled", (uint8_t *)&v26, 0xCu);
  }
  uint64_t v10 = [(HMDCameraProfileSettingsManager *)v7 hapAccessory];
  int v11 = [v10 home];
  char v12 = [v11 bulletinNotificationsSupported];

  if (v12)
  {
    uint64_t v13 = [v4 messagePayload];
    uint64_t v14 = objc_msgSend(v13, "hmf_BOOLForKey:", *MEMORY[0x263F0BDF0]);

    id v15 = (void *)MEMORY[0x230FBD990]();
    __int16 v16 = v7;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      int v19 = HMFEnabledStatusToString();
      int v26 = 138543618;
      uint64_t v27 = v18;
      __int16 v28 = 2112;
      uint64_t v29 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Registering reachability event notifications as %@", (uint8_t *)&v26, 0x16u);
    }
    char v20 = [(HMDCameraProfileSettingsManager *)v16 currentNotificationSettings];
    uint64_t v21 = (void *)[v20 mutableCopy];

    [v21 setReachabilityEventNotificationEnabled:v14];
    [(HMDCameraProfileSettingsManager *)v16 _updateCameraBulletinNotificationManagerWithSettings:v21 forMessage:v4];
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x230FBD990]();
    uint64_t v23 = v7;
    long long v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      long long v25 = HMFGetLogIdentifier();
      int v26 = 138543362;
      uint64_t v27 = v25;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Camera reachability notification cannot be modified when bulletin notifications are not supported.", (uint8_t *)&v26, 0xCu);
    }
    uint64_t v21 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [v4 respondWithError:v21];
  }
}

- (void)_handleUpdateActivityZonesMessage:(id)a3
{
  v47[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)MEMORY[0x230FBD990]();
  int v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v42 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Processing request to update activity zones", buf, 0xCu);
  }
  if (([(HMDCameraProfileSettingsManager *)v7 supportedFeatures] & 2) != 0)
  {
    id v15 = [v4 dataForKey:*MEMORY[0x263F0BE18]];
    if (v15)
    {
      __int16 v16 = (void *)MEMORY[0x263F08928];
      uint64_t v17 = (void *)MEMORY[0x263EFFA08];
      v47[0] = objc_opt_class();
      v47[1] = objc_opt_class();
      id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:2];
      int v19 = [v17 setWithArray:v18];
      id v40 = 0;
      char v20 = [v16 unarchivedObjectOfClasses:v19 fromData:v15 error:&v40];
      id v21 = v40;

      if (v20)
      {
        uint64_t v22 = [v4 BOOLForKey:*MEMORY[0x263F0BDD0]];
        uint64_t v23 = [(HMDCameraProfileSettingsManager *)v7 currentSettingsModel];
        [v23 setActivityZones:v20];
        long long v24 = (void *)MEMORY[0x230FBD990]([v23 setActivityZonesIncludedForSignificantEventDetection:v22]);
        long long v25 = v7;
        int v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          uint64_t v27 = HMFGetLogIdentifier();
          __int16 v28 = HMFBooleanToString();
          *(_DWORD *)buf = 138543874;
          v42 = v27;
          __int16 v43 = 2112;
          id v44 = v20;
          __int16 v45 = 2112;
          id v46 = v28;
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Updating activity zones: %@ activityZonesIncludedForSignificantEventDetection: %@", buf, 0x20u);
        }
        uint64_t v29 = [(HMDCameraProfileSettingsManager *)v25 coreDataAdapter];
        uint64_t v30 = [(HMDCameraProfileSettingsManager *)v25 _coreDataUpdateCompletionForMessage:v4];
        [v29 updateCameraProfileSettingsModel:v23 completion:v30];
      }
      else
      {
        v36 = (void *)MEMORY[0x230FBD990]();
        __int16 v37 = v7;
        id v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          __int16 v39 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v42 = v39;
          __int16 v43 = 2112;
          id v44 = v21;
          _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize activity zones: %@", buf, 0x16u);
        }
        uint64_t v23 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
        [v4 respondWithError:v23];
      }
    }
    else
    {
      uint64_t v31 = (void *)MEMORY[0x230FBD990]();
      uint64_t v32 = v7;
      __int16 v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        id v34 = HMFGetLogIdentifier();
        int v35 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        v42 = v34;
        __int16 v43 = 2112;
        id v44 = v35;
        _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Could not find activity zones in message payload: %@", buf, 0x16u);
      }
      id v21 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
      [v4 respondWithError:v21];
    }
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    int v11 = v7;
    char v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      [(HMDCameraProfileSettingsManager *)v11 supportedFeatures];
      uint64_t v14 = HMCameraSupportedFeaturesAsString();
      *(_DWORD *)buf = 138543618;
      v42 = v13;
      __int16 v43 = 2112;
      id v44 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Accessory with supported features: %@ does not support recording", buf, 0x16u);
    }
    id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [v4 respondWithError:v15];
  }
}

- (void)_updateCameraBulletinNotificationManagerWithSettings:(id)a3 forMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDCameraProfileSettingsManager *)self doorbellInputEventCharacteristic];
  uint64_t v9 = [v8 service];
  uint64_t v10 = [v9 bulletinBoardNotification];

  uint64_t v11 = [v10 isEnabled];
  objc_initWeak(&location, self);
  char v12 = [(HMDCameraProfileSettingsManager *)self cameraBulletinNotificationManager];
  uint64_t v13 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __99__HMDCameraProfileSettingsManager__updateCameraBulletinNotificationManagerWithSettings_forMessage___block_invoke;
  v16[3] = &unk_264A2B420;
  objc_copyWeak(&v19, &location);
  id v14 = v7;
  id v17 = v14;
  id v15 = v6;
  id v18 = v15;
  [v12 updateNotificationRegistrationsWithSettings:v15 accessory:v13 doorbellPressNotificationEnabled:v11 completion:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __99__HMDCameraProfileSettingsManager__updateCameraBulletinNotificationManagerWithSettings_forMessage___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v5 = [WeakRetained workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __99__HMDCameraProfileSettingsManager__updateCameraBulletinNotificationManagerWithSettings_forMessage___block_invoke_2;
  v7[3] = &unk_264A2E610;
  id v8 = v3;
  id v9 = a1[4];
  id v10 = WeakRetained;
  id v11 = a1[5];
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __99__HMDCameraProfileSettingsManager__updateCameraBulletinNotificationManagerWithSettings_forMessage___block_invoke_2(void *a1)
{
  if (a1[4])
  {
    v1 = (void *)a1[5];
    id v5 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v1 respondWithError:v5];
  }
  else
  {
    uint64_t v2 = a1[7];
    uint64_t v3 = a1[5];
    id v4 = (void *)a1[6];
    [v4 _updateNotificationSettings:v2 forMessage:v3];
  }
}

- (void)_handleBulletinBoardNotificationCommitMessage:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v37 = 138543362;
    id v38 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Processing request to change bulletin board", (uint8_t *)&v37, 0xCu);
  }
  id v10 = [(HMDCameraProfileSettingsManager *)v7 hapAccessory];
  id v11 = [v10 home];
  char v12 = [v11 bulletinNotificationsSupported];

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = v7;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = HMFGetLogIdentifier();
      int v37 = 138543362;
      id v38 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Bulletin board notification cannot be modified when bulletin notifications are not supported.", (uint8_t *)&v37, 0xCu);
      goto LABEL_9;
    }
LABEL_10:

    id v18 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [v4 respondWithError:v18];
    goto LABEL_24;
  }
  if (([(HMDCameraProfileSettingsManager *)v7 supportedFeatures] & 2) == 0)
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = v7;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = HMFGetLogIdentifier();
      [(HMDCameraProfileSettingsManager *)v14 supportedFeatures];
      id v17 = HMCameraSupportedFeaturesAsString();
      int v37 = 138543618;
      id v38 = v16;
      __int16 v39 = 2112;
      id v40 = v17;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Accessory with supported features: %@ does not support recording", (uint8_t *)&v37, 0x16u);

LABEL_9:
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  id v19 = (void *)*MEMORY[0x263F0E9A8];
  id v18 = [v4 numberForKey:*MEMORY[0x263F0E9A8]];
  if (v18)
  {
    char v20 = [v4 predicateForKey:*MEMORY[0x263F0E9A0]];
    id v21 = (void *)MEMORY[0x230FBD990]();
    uint64_t v22 = v7;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      long long v24 = HMFGetLogIdentifier();
      int v37 = 138543874;
      id v38 = v24;
      __int16 v39 = 2112;
      id v40 = v18;
      __int16 v41 = 2112;
      v42 = v20;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating smart bulletin board notification to enabled: %@, condition: %@", (uint8_t *)&v37, 0x20u);
    }
    long long v25 = [(HMDCameraProfileSettingsManager *)v22 currentNotificationSettings];
    int v26 = (void *)[v25 mutableCopy];

    objc_msgSend(v26, "setSmartBulletinBoardNotificationEnabled:", objc_msgSend(v18, "BOOLValue"));
    [v26 setSmartBulletinBoardNotificationCondition:v20];
    uint64_t v27 = [(HMDCameraProfileSettingsManager *)v22 currentNotificationSettings];
    int v28 = [v26 isEqual:v27];

    if (v28)
    {
      uint64_t v29 = (void *)MEMORY[0x230FBD990]();
      uint64_t v30 = v22;
      uint64_t v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        uint64_t v32 = HMFGetLogIdentifier();
        int v37 = 138543618;
        id v38 = v32;
        __int16 v39 = 2112;
        id v40 = v26;
        _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Requested changes match existing notification settings: %@", (uint8_t *)&v37, 0x16u);
      }
      [v4 respondWithSuccess];
    }
    else
    {
      [(HMDCameraProfileSettingsManager *)v22 _updateCameraBulletinNotificationManagerWithSettings:v26 forMessage:v4];
    }
  }
  else
  {
    __int16 v33 = (void *)MEMORY[0x230FBD990]();
    id v34 = v7;
    int v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = HMFGetLogIdentifier();
      int v37 = 138543618;
      id v38 = v36;
      __int16 v39 = 2112;
      id v40 = v19;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Bulletin board commit message missing key: %@", (uint8_t *)&v37, 0x16u);
    }
    char v20 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    [v4 respondWithError:v20];
  }

LABEL_24:
}

- (void)_handleUpdateAccessModeChangeNotificationEnabledMessage:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v26 = 138543362;
    uint64_t v27 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Processing request to change access mode change notification enabled", (uint8_t *)&v26, 0xCu);
  }
  id v10 = [(HMDCameraProfileSettingsManager *)v7 hapAccessory];
  id v11 = [v10 home];
  char v12 = [v11 bulletinNotificationsSupported];

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = v7;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = HMFGetLogIdentifier();
      int v26 = 138543362;
      uint64_t v27 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Access mode change notification cannot be modified when bulletin notifications are not supported.", (uint8_t *)&v26, 0xCu);
      goto LABEL_10;
    }
LABEL_11:

    id v18 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [v4 respondWithError:v18];
    goto LABEL_15;
  }
  if (([(HMDCameraProfileSettingsManager *)v7 supportedFeatures] & 1) == 0
    && ([(HMDCameraProfileSettingsManager *)v7 supportedFeatures] & 4) == 0)
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = v7;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = HMFGetLogIdentifier();
      [(HMDCameraProfileSettingsManager *)v14 supportedFeatures];
      id v17 = HMCameraSupportedFeaturesAsString();
      int v26 = 138543618;
      uint64_t v27 = v16;
      __int16 v28 = 2112;
      uint64_t v29 = v17;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Accessory with supported features: %@ support neither streaming nor recording access control.", (uint8_t *)&v26, 0x16u);

LABEL_10:
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  uint64_t v19 = [v4 BOOLForKey:*MEMORY[0x263F0BDC0]];
  char v20 = (void *)MEMORY[0x230FBD990]();
  id v21 = v7;
  uint64_t v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    uint64_t v23 = HMFGetLogIdentifier();
    long long v24 = HMFBooleanToString();
    int v26 = 138543618;
    uint64_t v27 = v23;
    __int16 v28 = 2112;
    uint64_t v29 = v24;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating access mode change notification enabled to %@", (uint8_t *)&v26, 0x16u);
  }
  long long v25 = [(HMDCameraProfileSettingsManager *)v21 currentNotificationSettings];
  id v18 = (void *)[v25 mutableCopy];

  [v18 setAccessModeChangeNotificationEnabled:v19];
  [(HMDCameraProfileSettingsManager *)v21 _updateCameraBulletinNotificationManagerWithSettings:v18 forMessage:v4];
LABEL_15:
}

- (void)_handleUpdateRecordingTriggerEventsMessage:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v28 = 138543362;
    uint64_t v29 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Processing request to change recording trigger events", (uint8_t *)&v28, 0xCu);
  }
  if (([(HMDCameraProfileSettingsManager *)v7 supportedFeatures] & 2) != 0)
  {
    id v15 = [v4 numberForKey:*MEMORY[0x263F0BDF8]];
    if (v15)
    {
      __int16 v16 = [(HMDCameraProfileSettingsManager *)v7 currentSettingsModel];
      id v17 = (void *)MEMORY[0x230FBD990](objc_msgSend(v16, "setRecordingEventTriggers:", objc_msgSend(v16, "recordingEventTriggers") & 0xFFFFFFFFFFFFFFE0 | objc_msgSend(v15, "unsignedIntegerValue") & 0x1F));
      id v18 = v7;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        char v20 = HMFGetLogIdentifier();
        id v21 = HMCameraSignificantEventTypesAsString();
        int v28 = 138543618;
        uint64_t v29 = v20;
        __int16 v30 = 2112;
        uint64_t v31 = v21;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating recordingTriggerEvents to %@", (uint8_t *)&v28, 0x16u);
      }
      uint64_t v22 = [(HMDCameraProfileSettingsManager *)v18 coreDataAdapter];
      uint64_t v23 = [(HMDCameraProfileSettingsManager *)v18 _coreDataUpdateCompletionForMessage:v4];
      [v22 updateCameraProfileSettingsModel:v16 completion:v23];
    }
    else
    {
      long long v24 = (void *)MEMORY[0x230FBD990]();
      long long v25 = v7;
      int v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        int v28 = 138543874;
        uint64_t v29 = v27;
        __int16 v30 = 2112;
        uint64_t v31 = 0;
        __int16 v32 = 2112;
        id v33 = v4;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Invalid parameter: %@ for message: %@", (uint8_t *)&v28, 0x20u);
      }
      __int16 v16 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      [v4 respondWithError:v16];
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = v7;
    char v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      [(HMDCameraProfileSettingsManager *)v11 supportedFeatures];
      id v14 = HMCameraSupportedFeaturesAsString();
      int v28 = 138543618;
      uint64_t v29 = v13;
      __int16 v30 = 2112;
      uint64_t v31 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Accessory with supported features: %@ does not support recording", (uint8_t *)&v28, 0x16u);
    }
    id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [v4 respondWithError:v15];
  }
}

- (void)_handleSynchronizeCloudStorageWithRecordingAccessModesMessage:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v11 = 138543362;
    char v12 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Processing remote request to synchronize cloud storage with recording access modes", (uint8_t *)&v11, 0xCu);
  }
  id v10 = [(HMDCameraProfileSettingsManager *)v7 quotaCoordinator];
  [v10 synchronizeCloudStorageWithRecordingAccessModes];
}

- (void)_handleUpdateAccessModeMessage:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v45 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Processing request to change access mode", buf, 0xCu);
  }
  id v10 = [v4 numberForKey:*MEMORY[0x263F0BDC8]];
  uint64_t v11 = [v4 numberForKey:*MEMORY[0x263F0BDE8]];
  char v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = v7;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      id v18 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      __int16 v45 = v17;
      __int16 v46 = 2112;
      unint64_t v47 = (unint64_t)v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Cannot find required parameters in message payload: %@", buf, 0x16u);
    }
    uint64_t v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = 20;
    goto LABEL_24;
  }
  unint64_t v21 = [v10 unsignedIntegerValue];
  uint64_t v22 = [v12 unsignedIntegerValue];
  uint64_t v23 = v22;
  if ((unint64_t)(v22 - 3) >= 2)
  {
    uint64_t v31 = MEMORY[0x230FBD990]();
    __int16 v32 = v7;
    id v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v45 = v34;
      __int16 v46 = 2048;
      unint64_t v47 = v23;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Invalid presence type enum value received: %ld", buf, 0x16u);
    }
    int v35 = (void *)v31;
  }
  else
  {
    if (v21 < 4)
    {
      if (!HMIsRecordingAllowedForCameraAccessMode()
        || ([(HMDCameraProfileSettingsManager *)v7 supportedFeatures] & 2) != 0)
      {
        if (!HMIsStreamingAllowedForCameraAccessMode()
          || ([(HMDCameraProfileSettingsManager *)v7 supportedFeatures] & 1) != 0)
        {
          __int16 v41 = [(HMDCameraProfileSettingsManager *)v7 quotaCoordinator];
          v42[0] = MEMORY[0x263EF8330];
          v42[1] = 3221225472;
          v42[2] = __66__HMDCameraProfileSettingsManager__handleUpdateAccessModeMessage___block_invoke;
          v42[3] = &unk_264A2F370;
          v42[4] = v7;
          id v43 = v4;
          [v41 updateCloudStorageAndSettingsWithAccessMode:v21 forCameraHomePresence:v23 completion:v42];

          goto LABEL_25;
        }
        long long v24 = (void *)MEMORY[0x230FBD990]();
        long long v25 = v7;
        int v26 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          goto LABEL_31;
        }
        uint64_t v27 = HMFGetLogIdentifier();
        int v28 = HMCameraAccessModeAsString();
        [(HMDCameraProfileSettingsManager *)v25 supportedFeatures];
        uint64_t v29 = HMCameraSupportedFeaturesAsString();
        *(_DWORD *)buf = 138543874;
        __int16 v45 = v27;
        __int16 v46 = 2112;
        unint64_t v47 = (unint64_t)v28;
        __int16 v48 = 2112;
        id v49 = v29;
        __int16 v30 = "%{public}@Requested access mode %@ enables streaming but supported features do not include streaming: %@";
      }
      else
      {
        long long v24 = (void *)MEMORY[0x230FBD990]();
        long long v25 = v7;
        int v26 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
LABEL_31:

          uint64_t v19 = (void *)MEMORY[0x263F087E8];
          uint64_t v20 = 48;
          goto LABEL_24;
        }
        uint64_t v27 = HMFGetLogIdentifier();
        int v28 = HMCameraAccessModeAsString();
        [(HMDCameraProfileSettingsManager *)v25 supportedFeatures];
        uint64_t v29 = HMCameraSupportedFeaturesAsString();
        *(_DWORD *)buf = 138543874;
        __int16 v45 = v27;
        __int16 v46 = 2112;
        unint64_t v47 = (unint64_t)v28;
        __int16 v48 = 2112;
        id v49 = v29;
        __int16 v30 = "%{public}@Requested access mode %@ enables recording but supported features do not include recording: %@";
      }
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, v30, buf, 0x20u);

      goto LABEL_31;
    }
    uint64_t v36 = MEMORY[0x230FBD990]();
    int v37 = v7;
    id v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      __int16 v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v45 = v39;
      __int16 v46 = 2048;
      unint64_t v47 = v21;
      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Invalid access mode enum value received: %ld", buf, 0x16u);
    }
    int v35 = (void *)v36;
  }
  uint64_t v19 = (void *)MEMORY[0x263F087E8];
  uint64_t v20 = 3;
LABEL_24:
  id v40 = [v19 hmErrorWithCode:v20];
  [v4 respondWithError:v40];

LABEL_25:
}

void __66__HMDCameraProfileSettingsManager__handleUpdateAccessModeMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
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
      id v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to update settings for message %@: %@", (uint8_t *)&v12, 0x20u);
    }
    [*(id *)(a1 + 40) respondWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = [*(id *)(a1 + 40) shortDescription];
      int v12 = 138543618;
      BOOL v13 = v10;
      __int16 v14 = 2112;
      id v15 = v11;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Updated settings for message: %@", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)(a1 + 40) respondWithSuccess];
  }
}

- (void)synchronizeSettingsToCameraWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraProfileSettingsManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __77__HMDCameraProfileSettingsManager_synchronizeSettingsToCameraWithCompletion___block_invoke;
  v7[3] = &unk_264A2F870;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __77__HMDCameraProfileSettingsManager_synchronizeSettingsToCameraWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _synchronizeCurrentAccessModeSettingToCameraWithCompletion:*(void *)(a1 + 40)];
}

- (HMDCameraBulletinNotificationManager)cameraBulletinNotificationManager
{
  uint64_t v2 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  id v3 = [v2 home];
  id v4 = [v3 cameraBulletinNotificationManager];

  return (HMDCameraBulletinNotificationManager *)v4;
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

- (void)synchronizeCloudStorageWithRecordingAccessModes
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  char v4 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  id v5 = [v4 home];
  id v6 = [v5 primaryResident];

  if (v6)
  {
    char v7 = [v6 isCurrentDevice];
    id v8 = (void *)MEMORY[0x230FBD990]();
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
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Locally synchronizing cloud storage with recording access modes because we are the primary resident", (uint8_t *)&v26, 0xCu);
      }
      BOOL v13 = [(HMDCameraProfileSettingsManager *)v9 quotaCoordinator];
      [v13 synchronizeCloudStorageWithRecordingAccessModes];
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        uint64_t v19 = [v6 shortDescription];
        int v26 = 138543618;
        uint64_t v27 = v18;
        __int16 v28 = 2112;
        uint64_t v29 = v19;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Forwarding request to synchronize cloud storage with recording access modes to primary resident: %@", (uint8_t *)&v26, 0x16u);
      }
      uint64_t v20 = [HMDRemoteDeviceMessageDestination alloc];
      unint64_t v21 = [(HMDCameraProfileSettingsManager *)v9 messageTargetUUID];
      uint64_t v22 = [v6 device];
      uint64_t v23 = [(HMDRemoteDeviceMessageDestination *)v20 initWithTarget:v21 device:v22];

      long long v24 = [[HMDRemoteMessage alloc] initWithName:@"HMDCameraProfileSettingsSynchronizeCloudStorageWithRecordingAccessModesMessage" destination:v23 payload:0 type:3 timeout:1 secure:0.0];
      long long v25 = [(HMDCameraProfileSettingsManager *)v9 msgDispatcher];
      [v25 sendMessage:v24];
    }
  }
  else
  {
    __int16 v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      int v26 = 138543362;
      uint64_t v27 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Cannot find primary resident to synchronize cloud storage with recording access modes", (uint8_t *)&v26, 0xCu);
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

- (unint64_t)supportedFeatures
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v2 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  id v3 = [v2 services];

  id obj = v3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v35;
    uint64_t v8 = *MEMORY[0x263F0D660];
    uint64_t v9 = *MEMORY[0x263F0D668];
    uint64_t v32 = *MEMORY[0x263F0D658];
    uint64_t v30 = *MEMORY[0x263F0BF78];
    uint64_t v29 = *MEMORY[0x263F0C2A0];
    uint64_t v28 = *MEMORY[0x263F0C160];
    uint64_t v10 = *MEMORY[0x263F0BEF8];
    uint64_t v31 = *MEMORY[0x263F0C348];
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(obj);
        }
        int v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        BOOL v13 = objc_msgSend(v12, "serviceType", v28);
        int v14 = [v13 isEqualToString:v8];

        if (v14)
        {
          id v15 = [v12 findCharacteristicWithType:v10];

          v6 |= v15 != 0;
          continue;
        }
        __int16 v16 = [v12 serviceType];
        int v17 = [v16 isEqualToString:v9];

        if (v17)
        {
          uint64_t v18 = [v12 findCharacteristicWithType:v10];

          uint64_t v19 = 6;
          if (!v18) {
            uint64_t v19 = 2;
          }
          uint64_t v20 = v19 | v6;
          unint64_t v21 = [v12 findCharacteristicWithType:v31];

          uint64_t v22 = v20 | 0x40;
        }
        else
        {
          uint64_t v23 = [v12 serviceType];
          int v24 = [v23 isEqualToString:v32];

          if (!v24) {
            continue;
          }
          long long v25 = [v12 findCharacteristicWithType:v30];

          if (v25) {
            uint64_t v20 = v6 | 0x10;
          }
          else {
            uint64_t v20 = v6;
          }
          int v26 = [v12 findCharacteristicWithType:v29];

          if (v26) {
            v20 |= 8uLL;
          }
          unint64_t v21 = [v12 findCharacteristicWithType:v28];

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

- (HMDCameraProfileSettingsModel)defaultSettingsModel
{
  id v3 = [(HMDCameraProfileSettingsManager *)self _settingsModelForUpdate];
  [v3 setVersion:1];
  [v3 setAccessModeAtHome:1];
  [v3 setAccessModeNotAtHome:1];
  [v3 setRecordingEventTriggers:14];
  uint64_t v4 = [(HMDCameraProfileSettingsManager *)self doorbellInputEventCharacteristic];

  if (v4) {
    objc_msgSend(v3, "setRecordingEventTriggers:", objc_msgSend(v3, "recordingEventTriggers") | 0x10);
  }
  return (HMDCameraProfileSettingsModel *)v3;
}

- (id)currentSettingsModel
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraProfileSettingsManager *)self coreDataAdapter];
  id v15 = 0;
  uint64_t v4 = [v3 fetchCameraProfileSettingsModelWithError:&v15];
  id v5 = v15;

  if (!v4)
  {
    if (v5)
    {
      unint64_t v6 = (void *)MEMORY[0x230FBD990]();
      uint64_t v7 = self;
      uint64_t v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        int v17 = v9;
        __int16 v18 = 2112;
        id v19 = v5;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Error fetching currentSettings: %@", buf, 0x16u);
      }
    }
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      BOOL v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v17 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Setting unavailable, using default values", buf, 0xCu);
    }
    uint64_t v4 = [(HMDCameraProfileSettingsManager *)v11 defaultSettingsModel];
  }
  [(HMDCameraProfileSettingsManager *)self _updateDerivedPropertiesOnSettingsModel:v4];

  return v4;
}

- (id)currentNotificationSettings
{
  id v3 = [(HMDCameraProfileSettingsManager *)self cameraBulletinNotificationManager];
  uint64_t v4 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  id v5 = [v3 cameraUserNotificationSettingsForAccessory:v4];
  unint64_t v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x263F0E220]);
  }
  uint64_t v8 = v7;

  return v8;
}

- (_HMCameraUserSettings)currentSettings
{
  id v3 = [(HMDCameraProfileSettingsManager *)self currentSettingsModel];
  uint64_t v4 = [(HMDCameraProfileSettingsManager *)self _settingsFromSettingsModel:v3];

  return (_HMCameraUserSettings *)v4;
}

- (void)remove
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  unint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Deleting camera settings", (uint8_t *)&v8, 0xCu);
  }
}

- (void)start
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraProfileSettingsManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(HMDCameraProfileSettingsManager *)self hapAccessory];
  id v5 = [v4 cameraProfiles];
  unint64_t v6 = [v5 anyObject];

  id v7 = (void *)MEMORY[0x230FBD990]();
  int v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    uint64_t v11 = [v6 logIdentifier];
    int v12 = 138543618;
    BOOL v13 = v10;
    __int16 v14 = 2112;
    id v15 = v11;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Starting settings manager for camera profile %@", (uint8_t *)&v12, 0x16u);
  }
  [(HMDCameraProfileSettingsManager *)v8 _start];
}

- (void)configureWithMessageDispatcher:(id)a3 adminMessageDispatcher:(id)a4 deviceIsResidentCapable:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v52 = a4;
  id v49 = v8;
  [(HMDCameraProfileSettingsManager *)self setMsgDispatcher:v8];
  __int16 v53 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v51 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  uint64_t v50 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  uint64_t v9 = (void *)MEMORY[0x230FBD990]([v50 setRoles:4]);
  uint64_t v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = HMFGetLogIdentifier();
    BOOL v13 = HMFBooleanToString();
    [(HMDCameraProfileSettingsManager *)v10 isCurrentDeviceConfirmedPrimaryResident];
    __int16 v14 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    __int16 v59 = v12;
    __int16 v60 = 2112;
    uint64_t v61 = v13;
    __int16 v62 = 2112;
    v63 = v14;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Configured with deviceIsResidentCapable=%@ and isCurrentDevicePrimaryResident=%@", buf, 0x20u);
  }
  id v15 = [(HMDCameraProfileSettingsManager *)v10 hapAccessory];
  uint64_t v16 = [v15 home];
  int v17 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v16 userPrivilege:4 remoteAccessRequired:0];
  v57[0] = v53;
  v57[1] = v51;
  v57[2] = v17;
  __int16 v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:3];
  [v52 registerForMessage:*MEMORY[0x263F0BE08] receiver:v10 policies:v18 selector:sel__handleUpdateAccessModeMessage_];
  [v52 registerForMessage:*MEMORY[0x263F0BE28] receiver:v10 policies:v18 selector:sel__handleUpdateRecordingTriggerEventsMessage_];
  [v52 registerForMessage:*MEMORY[0x263F0BE10] receiver:v10 policies:v18 selector:sel__handleUpdateActivityZonesMessage_];

  id v19 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v16 userPrivilege:0 remoteAccessRequired:1];
  v56[0] = v19;
  uint64_t v20 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  v56[1] = v20;
  unint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:2];
  [v49 registerForMessage:@"HMDCameraSettingsDidChangeMessage" receiver:v10 policies:v21 selector:sel__handleCameraSettingsDidChangeMessage_];

  uint64_t v22 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v16 userPrivilege:3 remoteAccessRequired:0];
  v55[0] = v22;
  v55[1] = v50;
  uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
  [v49 registerForMessage:@"HMDCameraProfileSettingsSynchronizeCloudStorageWithRecordingAccessModesMessage" receiver:v10 policies:v23 selector:sel__handleSynchronizeCloudStorageWithRecordingAccessModesMessage_];

  v54[0] = v53;
  v54[1] = v51;
  int v24 = v15;
  long long v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:2];
  [v49 registerForMessage:*MEMORY[0x263F0E998] receiver:v10 policies:v25 selector:sel__handleBulletinBoardNotificationCommitMessage_];
  [v49 registerForMessage:*MEMORY[0x263F0BE00] receiver:v10 policies:v25 selector:sel__handleUpdateAccessModeChangeNotificationEnabledMessage_];
  [v49 registerForMessage:*MEMORY[0x263F0BE20] receiver:v10 policies:v25 selector:sel__handleUpdateReachabilityEventNotificationEnabledMessage_];

  int v26 = [(HMDCameraProfileSettingsManager *)v10 notificationCenter];
  [v26 removeObserver:v10];

  uint64_t v27 = [(HMDCameraProfileSettingsManager *)v10 notificationCenter];
  uint64_t v28 = [v16 currentUser];
  [v27 addObserver:v10 selector:sel_handleUserRemoteAccessDidChangeNotification_ name:@"HMDUserRemoteAccessDidChangeNotification" object:v28];

  if (v5)
  {
    uint64_t v29 = [(HMDCameraProfileSettingsManager *)v10 notificationCenter];
    uint64_t v30 = [v16 residentDeviceManager];
    [v29 addObserver:v10 selector:sel_handlePrimaryResidentUpdatedNotification_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:v30];

    uint64_t v31 = [(HMDCameraProfileSettingsManager *)v10 notificationCenter];
    [v31 addObserver:v10 selector:sel_handlePrimaryResidentUpdatedNotification_ name:@"HMDResidentDeviceConfirmedStateChangedNotification" object:0];

    uint64_t v32 = [(HMDCameraProfileSettingsManager *)v10 notificationCenter];
    id v33 = [v16 presenceMonitor];
    [v32 addObserver:v10 selector:sel_handleHomePresenceEvaluatedNotification_ name:@"HMDHomePresenceEvaluatedNotification" object:v33];

    long long v34 = [(HMDCameraProfileSettingsManager *)v10 notificationCenter];
    [v34 addObserver:v10 selector:sel_handleAccessoryConfiguredNotification_ name:@"HMDAccessoryConnectedNotification" object:v24];

    long long v35 = [(HMDCameraProfileSettingsManager *)v10 notificationCenter];
    [v35 addObserver:v10 selector:sel_handleRecordingManagementServiceDidUpdateNotification_ name:@"HMDRecordingManagementServiceDidUpdateNotification" object:v24];

    long long v36 = [(HMDCameraProfileSettingsManager *)v10 notificationCenter];
    [v36 addObserver:v10 selector:sel_handleCharacteristicsValueUpdatedNotification_ name:@"HMDNotificationCharacteristicValueUpdated" object:v24];

    if ([v24 isReachable]) {
      [(HMDCameraProfileSettingsManager *)v10 _setManuallyDisabledCharacteristicNotificationsEnabled:1];
    }
    long long v37 = [v16 presenceMonitor];
    id v38 = [v37 currentHomePresence];

    if (v38)
    {
      uint64_t v39 = [(HMDCameraProfileSettingsManager *)v10 _isAnyUserAtHomeForPresence:v38];
      [(HMDCameraProfileSettingsManager *)v10 setAnyUserAtHome:v39];

      id v40 = (void *)MEMORY[0x230FBD990]();
      __int16 v41 = v10;
      v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        id v43 = HMFGetLogIdentifier();
        id v44 = [(HMDCameraProfileSettingsManager *)v41 isAnyUserAtHome];
        *(_DWORD *)buf = 138543618;
        __int16 v59 = v43;
        __int16 v60 = 2112;
        uint64_t v61 = v44;
        _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@Initial isAnyUserAtHome is %@", buf, 0x16u);
      }
    }
    else
    {
      __int16 v45 = (void *)MEMORY[0x230FBD990]();
      __int16 v46 = v10;
      unint64_t v47 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        __int16 v48 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v59 = v48;
        _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_INFO, "%{public}@Current home presence is unavailable", buf, 0xCu);
      }
      [(HMDCameraProfileSettingsManager *)v46 setAnyUserAtHome:0];
    }
  }
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  uint64_t v4 = self;
  BOOL v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating camera profile settings manager", buf, 0xCu);
  }
  [(HMDCameraProfileSettingsManager *)v4 _setManuallyDisabledCharacteristicNotificationsEnabled:0];
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraProfileSettingsManager;
  [(HMDCameraProfileSettingsManager *)&v7 dealloc];
}

- (HMDCameraProfileSettingsManager)initWithHAPAccessory:(id)a3 workQueue:(id)a4
{
  v30[1] = *MEMORY[0x263EF8340];
  BOOL v5 = (void *)MEMORY[0x263F08C38];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 uuid];
  v30[0] = @"HMDCameraProfileSettingsUUIDSalt";
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
  uint64_t v10 = objc_msgSend(v5, "hm_deriveUUIDFromBaseUUID:withSalts:", v8, v9);

  uint64_t v11 = (void *)MEMORY[0x263F08C38];
  uint64_t v29 = @"2b32a3ee-3908-406e-890d-74f9c410ef2b";
  int v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
  uint64_t v23 = (void *)v10;
  int v24 = objc_msgSend(v11, "hm_deriveUUIDFromBaseUUID:withSalts:", v10, v12);

  uint64_t v22 = [[HMDCameraProfileSettingsCoreDataAdapter alloc] initWithHAPAccessory:v7 cameraProfileSettingsModelID:v10 derivedPropertiesModelID:v24];
  BOOL v13 = objc_alloc_init(HMDFeaturesDataSource);
  __int16 v14 = [[HMDCameraProfileSettingsQuotaCoordinator alloc] initWithWorkQueue:v6 accessory:v7];
  v27[0] = *MEMORY[0x263F0D7A8];
  id v15 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0C288]];
  v28[0] = v15;
  v27[1] = *MEMORY[0x263F0D6C0];
  uint64_t v16 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0C208]];
  v28[1] = v16;
  int v17 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

  __int16 v18 = [[HMDCharacteristicsAvailabilityListener alloc] initWithAccessory:v7 workQueue:v6 interestedCharacteristicTypesByServiceType:v17];
  id v19 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v20 = +[HMDBulletinBoard sharedBulletinBoard];
  int v26 = [(HMDCameraProfileSettingsManager *)self initWithUniqueIdentifier:v23 hapAccessory:v7 workQueue:v6 coreDataAdapter:v22 notificationCenter:v19 bulletinBoard:v20 characteristicsAvailabilityListener:v18 quotaCoordinator:v14 featuresDataSource:v13];

  return v26;
}

- (HMDCameraProfileSettingsManager)initWithUniqueIdentifier:(id)a3 hapAccessory:(id)a4 workQueue:(id)a5 coreDataAdapter:(id)a6 notificationCenter:(id)a7 bulletinBoard:(id)a8 characteristicsAvailabilityListener:(id)a9 quotaCoordinator:(id)a10 featuresDataSource:(id)a11
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
    objc_storeStrong((id *)&v20->_coreDataAdapter, a6);
    objc_storeStrong((id *)&v20->_notificationCenter, a7);
    objc_storeStrong((id *)&v20->_bulletinBoard, a8);
    objc_storeStrong((id *)&v20->_quotaCoordinator, a10);
    objc_storeStrong((id *)&v20->_characteristicsAvailabilityListener, a9);
    objc_storeStrong((id *)&v20->_featuresDataSource, a11);
    unint64_t v21 = NSString;
    uint64_t v22 = [MEMORY[0x263F08C38] UUID];
    uint64_t v23 = [v22 UUIDString];
    uint64_t v24 = [v21 stringWithFormat:@"%@.HMDCameraProfileSettingsManager.%@", @"com.apple.HomeKitDaemon.Local", v23, v27, v28, v29, v30, v31, v32, v33];
    clientIdentifier = v20->_clientIdentifier;
    v20->_clientIdentifier = (NSString *)v24;
  }
  return v20;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t129 != -1) {
    dispatch_once(&logCategory__hmf_once_t129, &__block_literal_global_162);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v130;
  return v2;
}

void __46__HMDCameraProfileSettingsManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v130;
  logCategory__hmf_once_v130 = v0;
}

+ (id)zoneNameForHome:(id)a3
{
  id v3 = [a3 uuid];
  uint64_t v4 = [v3 UUIDString];
  BOOL v5 = [@"accessory-profile-data-" stringByAppendingString:v4];

  return v5;
}

@end