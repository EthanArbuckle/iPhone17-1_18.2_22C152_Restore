@interface HMDUserDataController
+ (id)logCategory;
- (BOOL)_userListeningHistoryValueFromModels:(id)a3;
- (BOOL)assistantAccessControlActivityNotificationsEnabledForPersonalRequests;
- (BOOL)assistantAccessControlRequiresAuthenticationForSecureRequests;
- (BOOL)hasUserSeenRMVNewLanguageNotification;
- (BOOL)isCurrentUser;
- (BOOL)isInitialized;
- (BOOL)isRecognizeMyVoiceEnabled;
- (BOOL)supportsHH2MigrationByOwnerAuto;
- (BOOL)supportsHH2MigrationByOwnerManual;
- (HMBModel)assistantAccessControlModelToReset;
- (HMDSettingsControllerProtocol)privateSettingsController;
- (HMDSettingsControllerProtocol)sharedSettingsController;
- (HMDUserDataController)initWithDelegate:(id)a3 dataSource:(id)a4 queue:(id)a5 userID:(id)a6 homeID:(id)a7 sharedSettingsController:(id)a8 privateSettingsController:(id)a9 isCurrentUser:(BOOL)a10;
- (HMDUserDataController)initWithDelegate:(id)a3 dataSource:(id)a4 queue:(id)a5 userID:(id)a6 homeID:(id)a7 sharedSettingsController:(id)a8 privateSettingsController:(id)a9 timerCreator:(id)a10 isCurrentUser:(BOOL)a11;
- (HMDUserDataControllerDataSource)dataSource;
- (HMDUserDataControllerDelegate)delegate;
- (HMDUserDataControllerTimerCreator)timerCreator;
- (HMFTimer)privateZoneFirstLoadTimer;
- (HMFTimer)sharedZoneFirstLoadTimer;
- (NSArray)assistantAccessControlAccessoriesToEncode;
- (NSArray)mediaContentProfileAccessControlAccessoriesToEncode;
- (NSArray)userListeningHistoryUpdateControlModelAccessoriesToEncode;
- (NSDictionary)privateSettingValuesByKeyPath;
- (NSDictionary)sharedSettingValuesByKeyPath;
- (NSMutableSet)assistantAccessControlAccessoryUUIDs;
- (NSMutableSet)mediaContentProfileAccessControlAccessories;
- (NSMutableSet)userListeningHistoryUpdateControlModelAccessories;
- (NSNotificationCenter)notificationCenter;
- (NSUUID)assistantAccessControlModelUUID;
- (NSUUID)homeUUID;
- (NSUUID)mediaContentProfileAccessControlModelUUID;
- (NSUUID)privateSettingsRootUUID;
- (NSUUID)sharedSettingsRootUUID;
- (NSUUID)supportsAutomaticHH2MigrationModelUUID;
- (NSUUID)userListeningHistoryUpdateControlModelUUID;
- (NSUUID)userUUID;
- (OS_dispatch_queue)clientQueue;
- (id)_keyPathToModelFromKeyPath:(id)a3 models:(id)a4;
- (id)_migrateUserListeningHistoryUpdateControlWithUserCurrentDataModel:(id)a3 transaction:(id)a4 settingModels:(id)a5;
- (id)logIdentifier;
- (id)updateListeningHistoryModelToReset;
- (int64_t)sharedUserSettingsLogEventBackingStoreControllerRunState;
- (unint64_t)state;
- (void)_invalidatePrivateZoneFirstLoadTimer;
- (void)_invalidateSharedZoneFirstLoadTimer;
- (void)_migrateUserSupportsAutomaticHH2MigrationUserCurrentDataModel:(id)a3 transaction:(id)a4;
- (void)_startPrivateZoneFirstLoadTimer;
- (void)_startSharedZoneFirstLoadTimer;
- (void)_startupPrivateZone;
- (void)_startupSharedZone;
- (void)assistantAccessControlModelRemoved:(id)a3 completion:(id)a4;
- (void)assistantAccessControlModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5;
- (void)configure;
- (void)enableUserListeningHistoryForAccessory:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)eventDidInitializePrivateZone;
- (void)eventDidInitializeSharedZone;
- (void)handleAssistantAccessControlAccessoryUUIDsUpdated:(id)a3 requireAuthenticationForSecureRequests:(BOOL)a4 activityNotificationsEnabledForPersonalRequests:(BOOL)a5 completion:(id)a6;
- (void)handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4;
- (void)handleRemovedAccessory:(id)a3;
- (void)handleStartForZoneController:(id)a3;
- (void)handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4;
- (void)initializePrivateZoneController:(id)a3 userDataModel:(id)a4;
- (void)initializeSharedZoneController:(id)a3 userDataModel:(id)a4;
- (void)mediaContentProfileAccessControlModelRemoved:(id)a3 completion:(id)a4;
- (void)mediaContentProfileAccessControlModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5;
- (void)performFirstRunOperationsOnPrivateZoneController:(id)a3;
- (void)performFirstRunOperationsOnSharedZoneController:(id)a3;
- (void)setAssistantAccessControlAccessoryUUIDs:(id)a3;
- (void)setAssistantAccessControlActivityNotificationsEnabledForPersonalRequests:(BOOL)a3;
- (void)setAssistantAccessControlModelUUID:(id)a3;
- (void)setAssistantAccessControlRequiresAuthenticationForSecureRequests:(BOOL)a3;
- (void)setHasUserSeenRMVNewLanguageNotification:(BOOL)a3;
- (void)setMediaContentProfileAccessControlAccessories:(id)a3;
- (void)setMediaContentProfileAccessControlModelUUID:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setPrivateSettingsRootUUID:(id)a3;
- (void)setPrivateZoneFirstLoadTimer:(id)a3;
- (void)setSharedSettingsRootUUID:(id)a3;
- (void)setSharedZoneFirstLoadTimer:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setSupportsAutomaticHH2MigrationModelUUID:(id)a3;
- (void)setSupportsHH2MigrationByOwnerAuto:(BOOL)a3;
- (void)setSupportsHH2MigrationByOwnerManual:(BOOL)a3;
- (void)setUserListeningHistoryUpdateControlModelAccessories:(id)a3;
- (void)setUserListeningHistoryUpdateControlModelUUID:(id)a3;
- (void)sharedUserDataModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5;
- (void)timerDidFire:(id)a3;
- (void)updateSupportsHH2MigrationByOwnerManual:(BOOL)a3 supportsHH2MigrationByOwnerAuto:(BOOL)a4 completion:(id)a5;
- (void)userListeningHistoryUpdateControlModelRemoved:(id)a3 completion:(id)a4;
- (void)userListeningHistoryUpdateControlModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5;
- (void)userSupportsAutomaticHH2MigrationModelRemoved:(id)a3 completion:(id)a4;
- (void)userSupportsAutomaticHH2MigrationModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5;
@end

@implementation HMDUserDataController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateSettingsController, 0);
  objc_storeStrong((id *)&self->_sharedSettingsController, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_privateZoneFirstLoadTimer, 0);
  objc_storeStrong((id *)&self->_sharedZoneFirstLoadTimer, 0);
  objc_storeStrong((id *)&self->_privateSettingsRootUUID, 0);
  objc_storeStrong((id *)&self->_supportsAutomaticHH2MigrationModelUUID, 0);
  objc_storeStrong((id *)&self->_userListeningHistoryUpdateControlModelAccessories, 0);
  objc_storeStrong((id *)&self->_userListeningHistoryUpdateControlModelUUID, 0);
  objc_storeStrong((id *)&self->_mediaContentProfileAccessControlAccessories, 0);
  objc_storeStrong((id *)&self->_mediaContentProfileAccessControlModelUUID, 0);
  objc_storeStrong((id *)&self->_assistantAccessControlAccessoryUUIDs, 0);
  objc_storeStrong((id *)&self->_assistantAccessControlModelUUID, 0);
  objc_storeStrong((id *)&self->_sharedSettingsRootUUID, 0);
  objc_storeStrong((id *)&self->_timerCreator, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
}

- (HMDSettingsControllerProtocol)privateSettingsController
{
  return (HMDSettingsControllerProtocol *)objc_getProperty(self, a2, 184, 1);
}

- (HMDSettingsControllerProtocol)sharedSettingsController
{
  return (HMDSettingsControllerProtocol *)objc_getProperty(self, a2, 176, 1);
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (void)setNotificationCenter:(id)a3
{
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 168, 1);
}

- (void)setPrivateZoneFirstLoadTimer:(id)a3
{
}

- (HMFTimer)privateZoneFirstLoadTimer
{
  return self->_privateZoneFirstLoadTimer;
}

- (void)setSharedZoneFirstLoadTimer:(id)a3
{
}

- (HMFTimer)sharedZoneFirstLoadTimer
{
  return self->_sharedZoneFirstLoadTimer;
}

- (void)setPrivateSettingsRootUUID:(id)a3
{
}

- (NSUUID)privateSettingsRootUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSupportsAutomaticHH2MigrationModelUUID:(id)a3
{
}

- (NSUUID)supportsAutomaticHH2MigrationModelUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 136, 1);
}

- (void)setUserListeningHistoryUpdateControlModelAccessories:(id)a3
{
}

- (NSMutableSet)userListeningHistoryUpdateControlModelAccessories
{
  return (NSMutableSet *)objc_getProperty(self, a2, 128, 1);
}

- (void)setUserListeningHistoryUpdateControlModelUUID:(id)a3
{
}

- (NSUUID)userListeningHistoryUpdateControlModelUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 120, 1);
}

- (void)setMediaContentProfileAccessControlAccessories:(id)a3
{
}

- (NSMutableSet)mediaContentProfileAccessControlAccessories
{
  return (NSMutableSet *)objc_getProperty(self, a2, 112, 1);
}

- (void)setMediaContentProfileAccessControlModelUUID:(id)a3
{
}

- (NSUUID)mediaContentProfileAccessControlModelUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAssistantAccessControlAccessoryUUIDs:(id)a3
{
}

- (NSMutableSet)assistantAccessControlAccessoryUUIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAssistantAccessControlModelUUID:(id)a3
{
}

- (NSUUID)assistantAccessControlModelUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSharedSettingsRootUUID:(id)a3
{
}

- (NSUUID)sharedSettingsRootUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

- (HMDUserDataControllerTimerCreator)timerCreator
{
  return (HMDUserDataControllerTimerCreator *)objc_getProperty(self, a2, 72, 1);
}

- (HMDUserDataControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDUserDataControllerDataSource *)WeakRetained;
}

- (HMDUserDataControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDUserDataControllerDelegate *)WeakRetained;
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSupportsHH2MigrationByOwnerAuto:(BOOL)a3
{
  self->_supportsHH2MigrationByOwnerAuto = a3;
}

- (BOOL)supportsHH2MigrationByOwnerAuto
{
  return self->_supportsHH2MigrationByOwnerAuto;
}

- (void)setSupportsHH2MigrationByOwnerManual:(BOOL)a3
{
  self->_supportsHH2MigrationByOwnerManual = a3;
}

- (BOOL)supportsHH2MigrationByOwnerManual
{
  return self->_supportsHH2MigrationByOwnerManual;
}

- (void)setAssistantAccessControlActivityNotificationsEnabledForPersonalRequests:(BOOL)a3
{
  self->_assistantAccessControlActivityNotificationsEnabledForPersonalRequests = a3;
}

- (BOOL)assistantAccessControlActivityNotificationsEnabledForPersonalRequests
{
  return self->_assistantAccessControlActivityNotificationsEnabledForPersonalRequests;
}

- (void)setAssistantAccessControlRequiresAuthenticationForSecureRequests:(BOOL)a3
{
  self->_assistantAccessControlRequiresAuthenticationForSecureRequests = a3;
}

- (BOOL)assistantAccessControlRequiresAuthenticationForSecureRequests
{
  return self->_assistantAccessControlRequiresAuthenticationForSecureRequests;
}

- (id)logIdentifier
{
  v2 = [(HMDUserDataController *)self userUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  v5 = [(HMDUserDataController *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__HMDUserDataController_timerDidFire___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __38__HMDUserDataController_timerDidFire___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) sharedZoneFirstLoadTimer];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 40);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      int v18 = 138543362;
      v19 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Attempting to recreate data in shared user data zone", (uint8_t *)&v18, 0xCu);
    }
    [*(id *)(a1 + 40) _startupSharedZone];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    v9 = [*(id *)(a1 + 40) privateZoneFirstLoadTimer];
    int v10 = [v8 isEqual:v9];

    v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = *(id *)(a1 + 40);
    v13 = HMFGetOSLogHandle();
    v14 = v13;
    if (v10)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15 = HMFGetLogIdentifier();
        int v18 = 138543362;
        v19 = v15;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Attempting to recreate data in private user data zone", (uint8_t *)&v18, 0xCu);
      }
      [*(id *)(a1 + 40) _startupPrivateZone];
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v16 = HMFGetLogIdentifier();
        uint64_t v17 = *(void *)(a1 + 32);
        int v18 = 138543618;
        v19 = v16;
        __int16 v20 = 2112;
        uint64_t v21 = v17;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unexpected timer fired %@", (uint8_t *)&v18, 0x16u);
      }
    }
  }
}

- (void)userSupportsAutomaticHH2MigrationModelRemoved:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  id v8 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D9452090]();
  int v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v14 = 138543362;
    v15 = v12;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@User supports automatic HH2 migration was removed", (uint8_t *)&v14, 0xCu);
  }
  [(HMDUserDataController *)v10 setSupportsHH2MigrationByOwnerManual:0];
  id v13 = objc_alloc_init(MEMORY[0x1E4F69E30]);
  v7[2](v7, v13);
}

- (void)userSupportsAutomaticHH2MigrationModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, id))a5;
  v11 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(HMDUserDataController *)self delegate];
  id v13 = [v8 supportsAutomaticHH2Migration];
  uint64_t v14 = [v13 BOOLValue];

  if (v14 != [(HMDUserDataController *)self supportsHH2MigrationByOwnerManual])
  {
    v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      int v18 = v28 = v9;
      v19 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      v30 = v18;
      __int16 v31 = 2114;
      v32 = v19;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Updating user supports automatic HH2 migration by owner manual to %{public}@", buf, 0x16u);

      id v9 = v28;
    }

    [(HMDUserDataController *)v16 setSupportsHH2MigrationByOwnerManual:v14];
    [v12 userDataControllerDidUpdateSupportsAutomaticHH2Migration:v16];
  }
  __int16 v20 = [v8 supportsHH2MigrationByOwnerAuto];
  uint64_t v21 = [v20 BOOLValue];

  if (v21 != [(HMDUserDataController *)self supportsHH2MigrationByOwnerAuto])
  {
    uint64_t v22 = (void *)MEMORY[0x1D9452090]();
    v23 = self;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = HMFGetLogIdentifier();
      v26 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      v30 = v25;
      __int16 v31 = 2114;
      v32 = v26;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Updating user supports automatic HH2 migration by owner auto to %{public}@", buf, 0x16u);
    }
    [(HMDUserDataController *)v23 setSupportsHH2MigrationByOwnerAuto:v21];
    [v12 userDataControllerDidUpdateSupportsAutomaticHH2Migration:v23];
  }
  id v27 = objc_alloc_init(MEMORY[0x1E4F69E30]);
  v10[2](v10, v27);
}

- (void)userListeningHistoryUpdateControlModelRemoved:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  id v8 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x1D9452090]();
  int v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v15 = 138543362;
    uint64_t v16 = v12;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@user update listening history access control was removed", (uint8_t *)&v15, 0xCu);
  }
  id v13 = [MEMORY[0x1E4F1CA80] set];
  [(HMDUserDataController *)v10 setUserListeningHistoryUpdateControlModelAccessories:v13];

  id v14 = objc_alloc_init(MEMORY[0x1E4F69E30]);
  v7[2](v7, v14);
}

- (void)userListeningHistoryUpdateControlModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, id))a5;
  v11 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [v8 accessories];
  if (v12) {
    [v8 accessories];
  }
  else {
  id v13 = [MEMORY[0x1E4F1C978] array];
  }

  id v14 = [MEMORY[0x1E4F1CA80] setWithArray:v13];
  int v15 = [(HMDUserDataController *)self userListeningHistoryUpdateControlModelAccessories];
  char v16 = [v15 isEqualToSet:v14];

  if ((v16 & 1) == 0)
  {
    uint64_t v17 = (void *)MEMORY[0x1D9452090]();
    int v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      __int16 v20 = HMFGetLogIdentifier();
      int v23 = 138543618;
      v24 = v20;
      __int16 v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating listening history update accessories to %@", (uint8_t *)&v23, 0x16u);
    }
    [(HMDUserDataController *)v18 setUserListeningHistoryUpdateControlModelAccessories:v14];
    uint64_t v21 = [(HMDUserDataController *)v18 delegate];
    [v21 userDataControllerDidUpdateUserListeningHistoryUpdateControl:v18];
  }
  id v22 = objc_alloc_init(MEMORY[0x1E4F69E30]);
  v10[2](v10, v22);
}

- (void)mediaContentProfileAccessControlModelRemoved:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  id v8 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x1D9452090]();
  int v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v15 = 138543362;
    char v16 = v12;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Media content profile access control was removed", (uint8_t *)&v15, 0xCu);
  }
  id v13 = [MEMORY[0x1E4F1CA80] set];
  [(HMDUserDataController *)v10 setMediaContentProfileAccessControlAccessories:v13];

  id v14 = objc_alloc_init(MEMORY[0x1E4F69E30]);
  v7[2](v7, v14);
}

- (void)mediaContentProfileAccessControlModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, id))a5;
  v11 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = (void *)MEMORY[0x1E4F1CA80];
  id v13 = [v8 accessories];
  id v14 = [v12 setWithArray:v13];

  int v15 = [(HMDUserDataController *)self mediaContentProfileAccessControlAccessories];
  char v16 = [v15 isEqualToSet:v14];

  if ((v16 & 1) == 0)
  {
    uint64_t v17 = (void *)MEMORY[0x1D9452090]();
    int v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      __int16 v20 = HMFGetLogIdentifier();
      int v23 = 138543618;
      v24 = v20;
      __int16 v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating media content profile access control to %@", (uint8_t *)&v23, 0x16u);
    }
    [(HMDUserDataController *)v18 setMediaContentProfileAccessControlAccessories:v14];
    uint64_t v21 = [(HMDUserDataController *)v18 delegate];
    [v21 userDataControllerDidUpdateMediaContentProfile:v18];
  }
  id v22 = objc_alloc_init(MEMORY[0x1E4F69E30]);
  v10[2](v10, v22);
}

- (int64_t)sharedUserSettingsLogEventBackingStoreControllerRunState
{
  v3 = [(HMDUserDataController *)self delegate];
  id v4 = [v3 sharedZoneControllerForUserDataController:self];
  int64_t v5 = [v4 logEventRunState];

  return v5;
}

- (void)setHasUserSeenRMVNewLanguageNotification:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int64_t v5 = [(HMDUserDataController *)self privateSettingsController];
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 settingForKeyPath:@"root.home.hasUserSeenRMVNewLanguageNotification"];
    if (v7)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F2EAB8]);
      id v9 = [NSNumber numberWithBool:v3];
      int v10 = (void *)[v8 initNumberSettingWithValue:v9];

      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __66__HMDUserDataController_setHasUserSeenRMVNewLanguageNotification___block_invoke;
      v19[3] = &unk_1E6A197F0;
      v19[4] = self;
      [v6 updateWithValue:v10 onSetting:v7 completion:v19];
    }
    else
    {
      int v15 = (void *)MEMORY[0x1D9452090]();
      char v16 = self;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v21 = v18;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to setHasUserSeenRMVNewLanguageNotification because the setting is nil", buf, 0xCu);
      }
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to setHasUserSeenRMVNewLanguageNotification because privateSettingsController is nil", buf, 0xCu);
    }
  }
}

void __66__HMDUserDataController_setHasUserSeenRMVNewLanguageNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Updated hasUserSeenRMVNewLanguageNotification value with error: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (BOOL)hasUserSeenRMVNewLanguageNotification
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDUserDataController *)self privateSettingsController];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 settingForKeyPath:@"root.home.hasUserSeenRMVNewLanguageNotification"];
    id v6 = v5;
    if (v5)
    {
      v7 = [v5 value];
      char v8 = [v7 BOOLValue];
    }
    else
    {
      id v13 = (void *)MEMORY[0x1D9452090]();
      id v14 = self;
      int v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        char v16 = HMFGetLogIdentifier();
        int v18 = 138543362;
        v19 = v16;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch hasUserSeenRMVNewLanguageNotification because the setting is nil", (uint8_t *)&v18, 0xCu);
      }
      char v8 = 1;
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    __int16 v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v18 = 138543362;
      v19 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch hasUserSeenRMVNewLanguageNotification because privateSettingsController is nil", (uint8_t *)&v18, 0xCu);
    }
    char v8 = 1;
  }

  return v8;
}

- (BOOL)isRecognizeMyVoiceEnabled
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDUserDataController *)self sharedSettingsController];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 settingForKeyPath:@"root.siri.identifyVoice"];
    id v6 = v5;
    if (v5)
    {
      v7 = [v5 value];
      char v8 = [v7 BOOLValue];
    }
    else
    {
      id v13 = (void *)MEMORY[0x1D9452090]();
      id v14 = self;
      int v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        char v16 = HMFGetLogIdentifier();
        int v18 = 138543362;
        v19 = v16;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch isRecognizeMyVoiceEnabled because the setting is nil", (uint8_t *)&v18, 0xCu);
      }
      char v8 = 0;
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    __int16 v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v18 = 138543362;
      v19 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch isRecognizeMyVoiceEnabled because privateSettingsController is nil", (uint8_t *)&v18, 0xCu);
    }
    char v8 = 0;
  }

  return v8;
}

- (NSDictionary)privateSettingValuesByKeyPath
{
  id v3 = [(HMDUserDataController *)self privateSettingsController];

  if (v3)
  {
    id v4 = [(HMDUserDataController *)self privateSettingsController];
    id v5 = [v4 settingValuesByKeyPathWithPrefix:@"private"];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CC08];
  }
  return (NSDictionary *)v5;
}

- (NSDictionary)sharedSettingValuesByKeyPath
{
  id v3 = [(HMDUserDataController *)self sharedSettingsController];

  if (v3)
  {
    id v4 = [(HMDUserDataController *)self sharedSettingsController];
    id v5 = [v4 settingValuesByKeyPathWithPrefix:@"shared"];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CC08];
  }
  return (NSDictionary *)v5;
}

- (void)assistantAccessControlModelRemoved:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  char v8 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x1D9452090]();
  __int16 v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v14 = 138543362;
    int v15 = v12;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Assistant access control was removed", (uint8_t *)&v14, 0xCu);
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F69E30]);
  v7[2](v7, v13);
}

- (void)assistantAccessControlModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = (void (**)(id, id))a5;
  id v11 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v11);

  if ([v8 hmbPropertyWasSet:@"activityNotificationsEnabledForPersonalRequests"])
  {
    uint64_t v12 = [v8 activityNotificationsEnabledForPersonalRequests];
    uint64_t v13 = [v12 BOOLValue];
  }
  else
  {
    uint64_t v13 = 1;
  }
  int v14 = [v8 requiresAuthenticationForSecureRequests];
  uint64_t v15 = [v14 BOOLValue];

  uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v17 = [v8 accessoryUUIDs];
  objc_msgSend(v16, "na_safeAddObjectsFromArray:", v17);

  int v18 = [v8 siriEndpointAccessoryUUIDs];
  objc_msgSend(v16, "na_safeAddObjectsFromArray:", v18);

  v19 = [(HMDUserDataController *)self assistantAccessControlAccessoryUUIDs];
  if (![v19 isEqualToSet:v16]
    || v13 != [(HMDUserDataController *)self assistantAccessControlActivityNotificationsEnabledForPersonalRequests])
  {

LABEL_7:
    uint64_t v20 = (void *)MEMORY[0x1D9452090]();
    uint64_t v21 = self;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      unsigned int v35 = v15;
      v24 = id v23 = v9;
      [v8 requiresAuthenticationForSecureRequests];
      __int16 v25 = v10;
      uint64_t v27 = v26 = v13;
      *(_DWORD *)buf = 138543874;
      v37 = v24;
      __int16 v38 = 2112;
      id v39 = v27;
      __int16 v40 = 2112;
      v41 = v16;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating assistant access control on zone update to require auth: %@, accessories:%@", buf, 0x20u);

      uint64_t v13 = v26;
      __int16 v10 = v25;

      id v9 = v23;
      uint64_t v15 = v35;
    }

    [(HMDUserDataController *)v21 setAssistantAccessControlAccessoryUUIDs:v16];
    [(HMDUserDataController *)v21 setAssistantAccessControlRequiresAuthenticationForSecureRequests:v15];
    [(HMDUserDataController *)v21 setAssistantAccessControlActivityNotificationsEnabledForPersonalRequests:v13];
    id v28 = [(HMDUserDataController *)v21 delegate];
    [v28 userDataControllerDidUpdateAssistantAccessControl:v21];

    goto LABEL_10;
  }
  int v30 = [(HMDUserDataController *)self assistantAccessControlRequiresAuthenticationForSecureRequests];

  if (v15 != v30) {
    goto LABEL_7;
  }
  __int16 v31 = (void *)MEMORY[0x1D9452090]();
  v32 = self;
  uint64_t v33 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    v34 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v37 = v34;
    __int16 v38 = 2112;
    id v39 = v8;
    _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@Model in zone update has no changes %@", buf, 0x16u);
  }
LABEL_10:
  id v29 = objc_alloc_init(MEMORY[0x1E4F69E30]);
  v10[2](v10, v29);
}

- (void)sharedUserDataModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v79 = a5;
  __int16 v10 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = [(HMDUserDataController *)self userListeningHistoryUpdateControlModelUUID];
  uint64_t v12 = [v8 userListeningHistoryUpdateControlModelUUID];
  char v13 = [v11 isEqual:v12];

  if (v13)
  {
    int v14 = (void *)MEMORY[0x1D9452090]();
    uint64_t v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v83 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@User Shared model changed, but no diff in ULH uuid", buf, 0xCu);
    }
  }
  else
  {
    int v18 = [(HMDUserDataController *)self delegate];
    v19 = [v18 sharedZoneControllerForUserDataController:self];
    uint64_t v20 = (void *)MEMORY[0x1D9452090]();
    uint64_t v21 = self;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = HMFGetLogIdentifier();
      [(HMDUserDataController *)v21 userListeningHistoryUpdateControlModelUUID];
      v76 = v18;
      __int16 v25 = v24 = v9;
      uint64_t v26 = [v8 userListeningHistoryUpdateControlModelUUID];
      *(_DWORD *)buf = 138543874;
      v83 = v23;
      __int16 v84 = 2112;
      id v85 = v25;
      __int16 v86 = 2112;
      v87 = v26;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Registering and Loading user listening history update since the UUID flipped from =%@, to =%@", buf, 0x20u);

      id v9 = v24;
      int v18 = v76;
    }
    uint64_t v27 = [v8 userListeningHistoryUpdateControlModelUUID];
    [(HMDUserDataController *)v21 setUserListeningHistoryUpdateControlModelUUID:v27];

    id v28 = [(HMDUserDataController *)v21 userListeningHistoryUpdateControlModelUUID];
    id v81 = 0;
    id v29 = [v19 loadUserListeningHistoryUpdateControlModelWithModelID:v28 error:&v81];
    id v77 = v81;

    int v30 = [(HMDUserDataController *)v21 userListeningHistoryUpdateControlModelUUID];
    [v19 registerForUserListeningHistoryUpdateControlModelUpdates:v21 modelID:v30];

    __int16 v31 = (void *)MEMORY[0x1D9452090]();
    v32 = v21;
    uint64_t v33 = HMFGetOSLogHandle();
    v34 = v33;
    if (v29)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        unsigned int v35 = HMFGetLogIdentifier();
        [v29 accessories];
        v74 = v19;
        id v36 = v8;
        v37 = v18;
        v39 = id v38 = v9;
        *(_DWORD *)buf = 138543618;
        v83 = v35;
        __int16 v84 = 2112;
        id v85 = v39;
        _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Loaded user listening history update accessories %@", buf, 0x16u);

        id v9 = v38;
        int v18 = v37;
        id v8 = v36;
        v19 = v74;
      }
      __int16 v40 = (void *)MEMORY[0x1E4F1CA80];
      v41 = [v29 accessories];
      uint64_t v42 = [v40 setWithArray:v41];
      [(HMDUserDataController *)v32 setUserListeningHistoryUpdateControlModelAccessories:v42];

      [v18 userDataControllerDidUpdateUserListeningHistoryUpdateControl:v32];
    }
    else
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v83 = v43;
        __int16 v84 = 2112;
        id v85 = v77;
        _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to load update listening history accessories %@", buf, 0x16u);
      }
    }
  }
  v44 = [(HMDUserDataController *)self supportsAutomaticHH2MigrationModelUUID];
  v45 = [v8 supportsAutomaticHH2MigrationModelUUID];
  char v46 = [v44 isEqual:v45];

  if ((v46 & 1) == 0)
  {
    id v78 = v9;
    v51 = [(HMDUserDataController *)self delegate];
    v52 = [v51 sharedZoneControllerForUserDataController:self];
    v53 = (void *)MEMORY[0x1D9452090]();
    v54 = self;
    v55 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      v56 = HMFGetLogIdentifier();
      v57 = [(HMDUserDataController *)v54 supportsAutomaticHH2MigrationModelUUID];
      v58 = [v8 supportsAutomaticHH2MigrationModelUUID];
      *(_DWORD *)buf = 138543874;
      v83 = v56;
      __int16 v84 = 2112;
      id v85 = v57;
      __int16 v86 = 2112;
      v87 = v58;
      _os_log_impl(&dword_1D49D5000, v55, OS_LOG_TYPE_INFO, "%{public}@Registering and Loading user support automatic HH2 migration UUID flipped from =%@, to =%@", buf, 0x20u);
    }
    v59 = [v8 supportsAutomaticHH2MigrationModelUUID];
    [(HMDUserDataController *)v54 setSupportsAutomaticHH2MigrationModelUUID:v59];

    v60 = [(HMDUserDataController *)v54 supportsAutomaticHH2MigrationModelUUID];
    id v80 = 0;
    v61 = [v52 loadUserSupportsAutomaticHH2MigrationModelWithModelID:v60 error:&v80];
    id v62 = v80;

    v63 = [(HMDUserDataController *)v54 supportsAutomaticHH2MigrationModelUUID];
    [v52 registerForUserSupportsAutomaticHH2MigrationModelUpdates:v54 modelID:v63];

    if (v61)
    {
      v64 = [v61 supportsAutomaticHH2Migration];
      -[HMDUserDataController setSupportsHH2MigrationByOwnerManual:](v54, "setSupportsHH2MigrationByOwnerManual:", [v64 BOOLValue]);

      v65 = [v61 supportsHH2MigrationByOwnerAuto];
      -[HMDUserDataController setSupportsHH2MigrationByOwnerAuto:](v54, "setSupportsHH2MigrationByOwnerAuto:", [v65 BOOLValue]);

      v66 = (void *)MEMORY[0x1D9452090]();
      v67 = v54;
      v68 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        v69 = HMFGetLogIdentifier();
        [(HMDUserDataController *)v67 supportsHH2MigrationByOwnerManual];
        HMFBooleanToString();
        id v75 = v62;
        v71 = v70 = v51;
        [(HMDUserDataController *)v67 supportsHH2MigrationByOwnerAuto];
        v72 = HMFBooleanToString();
        *(_DWORD *)buf = 138543874;
        v83 = v69;
        __int16 v84 = 2114;
        id v85 = v71;
        __int16 v86 = 2114;
        v87 = v72;
        _os_log_impl(&dword_1D49D5000, v68, OS_LOG_TYPE_INFO, "%{public}@Loaded user supports automatic HH2 migration model by owner manual = %{public}@, by owner auto = %{public}@", buf, 0x20u);

        v51 = v70;
        id v62 = v75;
LABEL_26:
      }
    }
    else
    {
      v66 = (void *)MEMORY[0x1D9452090]();
      v73 = v54;
      v68 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        v69 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v83 = v69;
        __int16 v84 = 2112;
        id v85 = v62;
        _os_log_impl(&dword_1D49D5000, v68, OS_LOG_TYPE_ERROR, "%{public}@Unable to load user supports automatic HH2 migration model %@", buf, 0x16u);
        goto LABEL_26;
      }
    }

    id v9 = v78;
    goto LABEL_28;
  }
  v47 = (void *)MEMORY[0x1D9452090]();
  v48 = self;
  v49 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    v50 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v83 = v50;
    _os_log_impl(&dword_1D49D5000, v49, OS_LOG_TYPE_INFO, "%{public}@User Shared model changed, but no diff in USAHH2M uuid", buf, 0xCu);
  }
LABEL_28:
}

- (id)updateListeningHistoryModelToReset
{
  id v3 = [(HMDUserDataController *)self userListeningHistoryUpdateControlModelUUID];

  if (v3)
  {
    id v4 = [HMDUserListeningHistoryUpdateControlModel alloc];
    id v5 = [(HMDUserDataController *)self userListeningHistoryUpdateControlModelUUID];
    id v6 = [(HMDUserDataController *)self userUUID];
    v7 = [(HMBModel *)v4 initWithModelID:v5 parentModelID:v6];

    [(HMDUserListeningHistoryUpdateControlModel *)v7 setAccessories:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (HMBModel)assistantAccessControlModelToReset
{
  id v3 = [(HMDUserDataController *)self assistantAccessControlModelUUID];

  if (v3)
  {
    id v4 = [HMDAssistantAccessControlModelV2 alloc];
    id v5 = [(HMDUserDataController *)self assistantAccessControlModelUUID];
    id v6 = [(HMDUserDataController *)self userUUID];
    v7 = [(HMBModel *)v4 initWithModelID:v5 parentModelID:v6];

    uint64_t v8 = MEMORY[0x1E4F1CBF0];
    [(HMDAssistantAccessControlModelV2 *)v7 setAccessoryUUIDs:MEMORY[0x1E4F1CBF0]];
    [(HMDAssistantAccessControlModelV2 *)v7 setSiriEndpointAccessoryUUIDs:v8];
  }
  else
  {
    v7 = 0;
  }
  return (HMBModel *)v7;
}

- (void)handleRemovedAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDUserDataController *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__HMDUserDataController_handleRemovedAccessory___block_invoke;
  v7[3] = &unk_1E6A197C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__HMDUserDataController_handleRemovedAccessory___block_invoke(uint64_t a1)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) delegate];
  id v3 = [*(id *)(a1 + 32) assistantAccessControlAccessoryUUIDs];
  int v4 = [v3 containsObject:*(void *)(a1 + 40)];

  p_superclass = (__objc2_class **)(&OBJC_METACLASS___HMDRemoteMessageTxReportLogEvent + 8);
  if (v4)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v76 = v9;
      __int16 v77 = 2112;
      uint64_t v78 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Found removed accessory %@ in assistant access control list removing.", buf, 0x16u);
    }
    id v11 = [HMDAssistantAccessControlModelV2 alloc];
    uint64_t v12 = [*(id *)(a1 + 32) assistantAccessControlModelUUID];
    char v13 = [*(id *)(a1 + 32) userUUID];
    int v14 = [(HMBModel *)v11 initWithModelID:v12 parentModelID:v13];

    uint64_t v15 = [*(id *)(a1 + 32) assistantAccessControlAccessoryUUIDs];
    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v74 = *(void *)(a1 + 40);
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
    int v18 = [v16 setWithArray:v17];
    v19 = objc_msgSend(v15, "na_setByRemovingObjectsFromSet:", v18);
    uint64_t v20 = [v19 allObjects];

    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __48__HMDUserDataController_handleRemovedAccessory___block_invoke_171;
    v73[3] = &unk_1E6A196B8;
    v73[4] = *(void *)(a1 + 32);
    uint64_t v21 = objc_msgSend(v20, "na_filter:", v73);
    [(HMDAssistantAccessControlModelV2 *)v14 setAccessoryUUIDs:v21];

    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __48__HMDUserDataController_handleRemovedAccessory___block_invoke_2;
    v70[3] = &unk_1E6A12828;
    id v22 = v2;
    uint64_t v23 = *(void *)(a1 + 32);
    id v71 = v22;
    uint64_t v72 = v23;
    id v24 = objc_msgSend(v20, "na_filter:", v70);
    [(HMDAssistantAccessControlModelV2 *)v14 setSiriEndpointAccessoryUUIDs:v24];

    __int16 v25 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "assistantAccessControlRequiresAuthenticationForSecureRequests"));
    [(HMDAssistantAccessControlModelV2 *)v14 setRequiresAuthenticationForSecureRequests:v25];

    uint64_t v26 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "assistantAccessControlActivityNotificationsEnabledForPersonalRequests"));
    [(HMDAssistantAccessControlModelV2 *)v14 setActivityNotificationsEnabledForPersonalRequests:v26];

    uint64_t v27 = [v22 sharedZoneControllerForUserDataController:*(void *)(a1 + 32)];
    p_superclass = &OBJC_METACLASS___HMDRemoteMessageTxReportLogEvent.superclass;
    id v28 = [[HMDSettingTransaction alloc] initWithTransactionLabel:@"Remove accessory from user assistant access control"];
    [(HMDSettingTransaction *)v28 addModelToBeUpdated:v14];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __48__HMDUserDataController_handleRemovedAccessory___block_invoke_3;
    v68[3] = &unk_1E6A196E0;
    id v29 = *(void **)(a1 + 40);
    v68[4] = *(void *)(a1 + 32);
    id v69 = v29;
    [v27 runTransaction:v28 waitForCloudPush:0 completion:v68];
  }
  int v30 = [*(id *)(a1 + 32) mediaContentProfileAccessControlAccessories];
  int v31 = [v30 containsObject:*(void *)(a1 + 40)];

  if (v31)
  {
    v32 = (void *)MEMORY[0x1D9452090]();
    id v33 = *(id *)(a1 + 32);
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      unsigned int v35 = HMFGetLogIdentifier();
      uint64_t v36 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v76 = v35;
      __int16 v77 = 2112;
      uint64_t v78 = v36;
      _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Found removed accessory %@ in media content profile list removing.", buf, 0x16u);
    }
    v37 = [HMDMediaContentProfileAccessControlModel alloc];
    id v38 = [*(id *)(a1 + 32) mediaContentProfileAccessControlModelUUID];
    id v39 = [*(id *)(a1 + 32) userUUID];
    __int16 v40 = [(HMBModel *)v37 initWithModelID:v38 parentModelID:v39];

    v41 = [*(id *)(a1 + 32) mediaContentProfileAccessControlAccessories];
    uint64_t v42 = (void *)[v41 mutableCopy];

    [v42 removeObject:*(void *)(a1 + 40)];
    v43 = [v42 allObjects];
    [(HMDMediaContentProfileAccessControlModel *)v40 setAccessories:v43];

    v44 = [v2 sharedZoneControllerForUserDataController:*(void *)(a1 + 32)];
    v45 = (void *)[objc_alloc((Class)(p_superclass + 179)) initWithTransactionLabel:@"Remove accessory from media content profile access control"];
    [v45 addModelToBeUpdated:v40];
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __48__HMDUserDataController_handleRemovedAccessory___block_invoke_178;
    v66[3] = &unk_1E6A196E0;
    char v46 = *(void **)(a1 + 40);
    v66[4] = *(void *)(a1 + 32);
    id v67 = v46;
    [v44 runTransaction:v45 waitForCloudPush:0 completion:v66];
  }
  v47 = [*(id *)(a1 + 32) userListeningHistoryUpdateControlModelAccessories];
  int v48 = [v47 containsObject:*(void *)(a1 + 40)];

  if (v48)
  {
    v49 = (void *)MEMORY[0x1D9452090]();
    id v50 = *(id *)(a1 + 32);
    v51 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      v52 = HMFGetLogIdentifier();
      uint64_t v53 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v76 = v52;
      __int16 v77 = 2112;
      uint64_t v78 = v53;
      _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_INFO, "%{public}@Found removed accessory %@ in update listening history list removing.", buf, 0x16u);
    }
    v54 = [HMDUserListeningHistoryUpdateControlModel alloc];
    v55 = [*(id *)(a1 + 32) userListeningHistoryUpdateControlModelUUID];
    v56 = [*(id *)(a1 + 32) userUUID];
    v57 = [(HMBModel *)v54 initWithModelID:v55 parentModelID:v56];

    v58 = [*(id *)(a1 + 32) userListeningHistoryUpdateControlModelAccessories];
    v59 = (void *)[v58 mutableCopy];

    [v59 removeObject:*(void *)(a1 + 40)];
    v60 = [v59 allObjects];
    [(HMDUserListeningHistoryUpdateControlModel *)v57 setAccessories:v60];

    v61 = [v2 sharedZoneControllerForUserDataController:*(void *)(a1 + 32)];
    id v62 = (void *)[objc_alloc((Class)(p_superclass + 179)) initWithTransactionLabel:@"Remove accessory from update listening history control"];
    [v62 addModelToBeUpdated:v57];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __48__HMDUserDataController_handleRemovedAccessory___block_invoke_182;
    v64[3] = &unk_1E6A196E0;
    v63 = *(void **)(a1 + 40);
    v64[4] = *(void *)(a1 + 32);
    id v65 = v63;
    [v61 runTransaction:v62 waitForCloudPush:0 completion:v64];
  }
}

uint64_t __48__HMDUserDataController_handleRemovedAccessory___block_invoke_171(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegate];
  uint64_t v6 = [v5 userDataController:*(void *)(a1 + 32) isAppleMediaAccessory:v4];

  return v6;
}

uint64_t __48__HMDUserDataController_handleRemovedAccessory___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) userDataController:*(void *)(a1 + 40) isHAPAccessory:a2];
}

void __48__HMDUserDataController_handleRemovedAccessory___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Removed accessory %@ from assistant access control list on accessory removal.", (uint8_t *)&v9, 0x16u);
  }
}

void __48__HMDUserDataController_handleRemovedAccessory___block_invoke_178(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Removed accessory %@ from media content profile access control list on accessory removal.", (uint8_t *)&v9, 0x16u);
  }
}

void __48__HMDUserDataController_handleRemovedAccessory___block_invoke_182(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Removed accessory %@ from ULH list on accessory removal.", (uint8_t *)&v9, 0x16u);
  }
}

- (void)updateSupportsHH2MigrationByOwnerManual:(BOOL)a3 supportsHH2MigrationByOwnerAuto:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void (**)(id, void))a5;
  if ([(HMDUserDataController *)self isInitialized])
  {
    int v9 = [(HMDUserDataController *)self delegate];
    uint64_t v10 = [HMDUserSupportsAutomaticHH2MigrationModel alloc];
    __int16 v11 = [(HMDUserDataController *)self supportsAutomaticHH2MigrationModelUUID];
    uint64_t v12 = [(HMDUserDataController *)self userUUID];
    uint64_t v13 = [(HMBModel *)v10 initWithModelID:v11 parentModelID:v12];

    BOOL v14 = [(HMDUserDataController *)self supportsHH2MigrationByOwnerManual] ^ v6;
    if (v14)
    {
      uint64_t v15 = [NSNumber numberWithBool:v6];
      [(HMDUserSupportsAutomaticHH2MigrationModel *)v13 setSupportsAutomaticHH2Migration:v15];
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x1D9452090]();
      uint64_t v21 = self;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        uint64_t v23 = v41 = v13;
        HMFBooleanToString();
        v24 = id v39 = v20;
        *(_DWORD *)buf = 138543618;
        v44 = v23;
        __int16 v45 = 2112;
        char v46 = v24;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Supports automatic HH2 migration by owner manual is already set to %@", buf, 0x16u);

        uint64_t v20 = v39;
        uint64_t v13 = v41;
      }
    }
    if ([(HMDUserDataController *)self supportsHH2MigrationByOwnerAuto] == v5)
    {
      uint64_t v26 = (void *)MEMORY[0x1D9452090]();
      uint64_t v27 = self;
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v29 = v40 = v26;
        HMFBooleanToString();
        int v30 = v42 = v13;
        *(_DWORD *)buf = 138543618;
        v44 = v29;
        __int16 v45 = 2112;
        char v46 = v30;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Supports automatic HH2 migration by owner auto is already set to %@", buf, 0x16u);

        uint64_t v13 = v42;
        uint64_t v26 = v40;
      }

      if (!v14)
      {
        v8[2](v8, 0);
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      __int16 v25 = [NSNumber numberWithBool:v5];
      [(HMDUserSupportsAutomaticHH2MigrationModel *)v13 setSupportsHH2MigrationByOwnerAuto:v25];
    }
    int v31 = (void *)MEMORY[0x1D9452090]();
    v32 = self;
    id v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = HMFGetLogIdentifier();
      unsigned int v35 = HMFBooleanToString();
      uint64_t v36 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      v44 = v34;
      __int16 v45 = 2112;
      char v46 = v35;
      __int16 v47 = 2112;
      int v48 = v36;
      _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@Running transaction to update user supports HH2 migration status by owner manual to %@, by owner auto to %@", buf, 0x20u);
    }
    v37 = [v9 sharedZoneControllerForUserDataController:v32];
    id v38 = [[HMDSettingTransaction alloc] initWithTransactionLabel:@"Update user supports automatic HH2 migration"];
    [(HMDSettingTransaction *)v38 addModelToBeUpdated:v13];
    [v37 runTransaction:v38 waitForCloudPush:0 completion:v8];

    goto LABEL_19;
  }
  uint64_t v16 = (void *)MEMORY[0x1D9452090]();
  uint64_t v17 = self;
  int v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v44 = v19;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Not initialized yet", buf, 0xCu);
  }
  int v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Not ready" reason:@"Initialization is not complete" suggestion:0];
  ((void (**)(id, void *))v8)[2](v8, v9);
LABEL_20:
}

- (void)enableUserListeningHistoryForAccessory:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(HMDUserDataController *)self userListeningHistoryUpdateControlModelAccessories];
  if ([v5 containsObject:v4])
  {
    BOOL v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@ULH for accessory %@ is already enabled", buf, 0x16u);
    }
  }
  else
  {
    [v5 addObject:v4];
    uint64_t v10 = (void *)MEMORY[0x1E4F1C978];
    __int16 v11 = [v5 allObjects];
    uint64_t v12 = objc_msgSend(v10, "arrayWithObjects:", v11, 0);

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__HMDUserDataController_enableUserListeningHistoryForAccessory___block_invoke;
    v13[3] = &unk_1E6A196E0;
    v13[4] = self;
    id v14 = v4;
    [(HMDUserDataController *)self handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:v12 completion:v13];
  }
}

void __64__HMDUserDataController_enableUserListeningHistoryForAccessory___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    BOOL v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543874;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Enabling ULH for accessory %@ failed with %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, HMDSettingTransaction *))a4;
  uint64_t v8 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v8);

  if ([(HMDUserDataController *)self isInitialized])
  {
    int v9 = [(HMDUserDataController *)self userListeningHistoryUpdateControlModelAccessories];
    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    __int16 v11 = objc_msgSend(v10, "na_setByRemovingObjectsFromSet:", v9);

    uint64_t v12 = [(HMDUserDataController *)self delegate];
    id v41 = v6;
    __int16 v13 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v14 = v11;
    uint64_t v15 = [(HMDUserListeningHistoryUpdateControlModel *)v14 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v43;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v43 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if (([v12 userDataController:self isAccessoryUserListeningHistoryUpdateCapable:v19] & 1) == 0)
          {
            uint64_t v36 = (void *)MEMORY[0x1D9452090]();
            v37 = self;
            id v38 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              id v39 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              __int16 v47 = v39;
              __int16 v48 = 2112;
              uint64_t v49 = v19;
              _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_INFO, "%{public}@Unable to validate accessory %@, skipping", buf, 0x16u);
            }
            __int16 v40 = (void *)MEMORY[0x1E4F28C58];
            int v30 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2027];
            int v31 = [v40 hmErrorWithCode:2 description:@"Could not validate accessory" reason:@"Need all accessories to be valid" suggestion:0 underlyingError:v30];
            v7[2](v7, v31);
            id v28 = v14;
            goto LABEL_19;
          }
        }
        uint64_t v16 = [(HMDUserListeningHistoryUpdateControlModel *)v14 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    uint64_t v20 = [MEMORY[0x1E4F1CA80] setWithArray:v41];

    uint64_t v21 = (void *)MEMORY[0x1D9452090]();
    id v22 = self;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v47 = v24;
      __int16 v48 = 2112;
      uint64_t v49 = v20;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Running transaction to update user listening history update control to %@", buf, 0x16u);
    }
    __int16 v25 = [HMDUserListeningHistoryUpdateControlModel alloc];
    uint64_t v26 = [(HMDUserDataController *)v22 userListeningHistoryUpdateControlModelUUID];
    uint64_t v27 = [(HMDUserDataController *)v22 userUUID];
    id v28 = [(HMBModel *)v25 initWithModelID:v26 parentModelID:v27];

    id v29 = [v20 allObjects];
    [(HMDUserListeningHistoryUpdateControlModel *)v28 setAccessories:v29];

    int v30 = [v12 sharedZoneControllerForUserDataController:v22];
    int v31 = [[HMDSettingTransaction alloc] initWithTransactionLabel:@"Update user listening history update control"];
    [(HMDSettingTransaction *)v31 addModelToBeUpdated:v28];
    [v30 runTransaction:v31 waitForCloudPush:0 completion:v7];
    __int16 v13 = v20;
LABEL_19:

    id v6 = v41;
  }
  else
  {
    v32 = (void *)MEMORY[0x1D9452090]();
    id v33 = self;
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      unsigned int v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v47 = v35;
      _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Not initialized yet", buf, 0xCu);
    }
    int v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Not ready" reason:@"Initialization is not complete" suggestion:0];
    v7[2](v7, v9);
  }
}

- (void)handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, HMDSettingTransaction *))a4;
  uint64_t v8 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v8);

  if ([(HMDUserDataController *)self isInitialized])
  {
    int v9 = [(HMDUserDataController *)self delegate];
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    __int16 v11 = (HMDMediaContentProfileAccessControlModel *)v6;
    uint64_t v12 = [(HMDMediaContentProfileAccessControlModel *)v11 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v37;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if (!-[HMDSettingTransaction userDataController:isMediaContentProfileCapableAccessoryID:](v9, "userDataController:isMediaContentProfileCapableAccessoryID:", self, v16, (void)v36))
          {
            int v31 = (void *)MEMORY[0x1D9452090]();
            v32 = self;
            id v33 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              v34 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              id v41 = v34;
              __int16 v42 = 2112;
              long long v43 = v16;
              _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@Unable to validate accessory %@, skipping", buf, 0x16u);
            }
            unsigned int v35 = (void *)MEMORY[0x1E4F28C58];
            __int16 v25 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2026];
            uint64_t v26 = [v35 hmErrorWithCode:2 description:@"Could not validate accessory" reason:@"Need all accessories to be valid" suggestion:0 underlyingError:v25];
            v7[2](v7, v26);
            goto LABEL_19;
          }
          [v10 addObject:v16];
        }
        uint64_t v13 = [(HMDMediaContentProfileAccessControlModel *)v11 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    uint64_t v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v41 = v20;
      __int16 v42 = 2112;
      long long v43 = v10;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Running transaction to update media content profile access control to %@", buf, 0x16u);
    }
    uint64_t v21 = [HMDMediaContentProfileAccessControlModel alloc];
    id v22 = [(HMDUserDataController *)v18 mediaContentProfileAccessControlModelUUID];
    uint64_t v23 = [(HMDUserDataController *)v18 userUUID];
    __int16 v11 = [(HMBModel *)v21 initWithModelID:v22 parentModelID:v23];

    id v24 = [v10 allObjects];
    [(HMDMediaContentProfileAccessControlModel *)v11 setAccessories:v24];

    __int16 v25 = [(HMDSettingTransaction *)v9 sharedZoneControllerForUserDataController:v18];
    uint64_t v26 = [[HMDSettingTransaction alloc] initWithTransactionLabel:@"Update media content profile access control"];
    [(HMDSettingTransaction *)v26 addModelToBeUpdated:v11];
    [v25 runTransaction:v26 waitForCloudPush:0 completion:v7];
LABEL_19:
  }
  else
  {
    uint64_t v27 = (void *)MEMORY[0x1D9452090]();
    id v28 = self;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      int v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v41 = v30;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Not initialized yet", buf, 0xCu);
    }
    int v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Not ready" reason:@"Initialization is not complete" suggestion:0];
    v7[2](v7, v9);
  }
}

- (void)handleAssistantAccessControlAccessoryUUIDsUpdated:(id)a3 requireAuthenticationForSecureRequests:(BOOL)a4 activityNotificationsEnabledForPersonalRequests:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  __int16 v11 = (void (**)(id, void *))a6;
  uint64_t v12 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v12);

  if ([(HMDUserDataController *)self isInitialized])
  {
    unsigned int v58 = v8;
    BOOL v59 = v7;
    uint64_t v13 = [(HMDUserDataController *)self assistantAccessControlAccessoryUUIDs];
    v60 = v10;
    uint64_t v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
    uint64_t v15 = objc_msgSend(v14, "na_setByRemovingObjectsFromSet:", v13);

    uint64_t v16 = [(HMDUserDataController *)self delegate];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v67 objects:v77 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v68;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v68 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          if (([v16 userDataController:self isPersonalRequestCapableAccessoryID:v22] & 1) == 0)
          {
            char v46 = (void *)MEMORY[0x1D9452090]();
            __int16 v47 = self;
            __int16 v48 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              uint64_t v49 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              uint64_t v72 = v49;
              __int16 v73 = 2112;
              uint64_t v74 = v22;
              _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_INFO, "%{public}@Unable to validate accessory %@, skipping", buf, 0x16u);
            }
            id v50 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v51 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2025];
            v52 = [v50 hmErrorWithCode:2 description:@"Could not validate accessory" reason:@"Need all newly added accessories to be valid" suggestion:0 underlyingError:v51];
            v11[2](v11, v52);

            id v10 = v60;
            goto LABEL_22;
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v67 objects:v77 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    uint64_t v23 = [(HMDUserDataController *)self assistantAccessControlAccessoryUUIDs];
    id v10 = v60;
    id v24 = [MEMORY[0x1E4F1CAD0] setWithArray:v60];
    if ([v23 isEqualToSet:v24]
      && [(HMDUserDataController *)self assistantAccessControlActivityNotificationsEnabledForPersonalRequests] == v59)
    {
      int v53 = [(HMDUserDataController *)self assistantAccessControlRequiresAuthenticationForSecureRequests];

      if (v53 == v58)
      {
        v54 = (void *)MEMORY[0x1D9452090]();
        v55 = self;
        v56 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          v57 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v72 = v57;
          _os_log_impl(&dword_1D49D5000, v56, OS_LOG_TYPE_INFO, "%{public}@Nothing to modify.", buf, 0xCu);
        }
        v11[2](v11, 0);
        goto LABEL_22;
      }
    }
    else
    {
    }
    __int16 v25 = (void *)MEMORY[0x1D9452090]();
    uint64_t v26 = self;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = HMFGetLogIdentifier();
      id v29 = [NSNumber numberWithBool:v59];
      *(_DWORD *)buf = 138543874;
      uint64_t v72 = v28;
      __int16 v73 = 2112;
      uint64_t v74 = v60;
      __int16 v75 = 2112;
      v76 = v29;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Updating user assistant access control accessories: %@, activity notifications enabled for personal requests: %@", buf, 0x20u);
    }
    int v30 = [HMDAssistantAccessControlModelV2 alloc];
    int v31 = [(HMDUserDataController *)v26 assistantAccessControlModelUUID];
    v32 = [(HMDUserDataController *)v26 userUUID];
    id v33 = [(HMBModel *)v30 initWithModelID:v31 parentModelID:v32];

    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __173__HMDUserDataController_handleAssistantAccessControlAccessoryUUIDsUpdated_requireAuthenticationForSecureRequests_activityNotificationsEnabledForPersonalRequests_completion___block_invoke;
    v64[3] = &unk_1E6A12828;
    id v34 = v16;
    id v65 = v34;
    v66 = v26;
    unsigned int v35 = objc_msgSend(v60, "na_filter:", v64);
    [(HMDAssistantAccessControlModelV2 *)v33 setAccessoryUUIDs:v35];

    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __173__HMDUserDataController_handleAssistantAccessControlAccessoryUUIDsUpdated_requireAuthenticationForSecureRequests_activityNotificationsEnabledForPersonalRequests_completion___block_invoke_2;
    v61[3] = &unk_1E6A12828;
    id v10 = v60;
    id v36 = v34;
    id v62 = v36;
    v63 = v26;
    long long v37 = objc_msgSend(v60, "na_filter:", v61);
    [(HMDAssistantAccessControlModelV2 *)v33 setSiriEndpointAccessoryUUIDs:v37];

    long long v38 = [NSNumber numberWithBool:v59];
    [(HMDAssistantAccessControlModelV2 *)v33 setActivityNotificationsEnabledForPersonalRequests:v38];

    long long v39 = [NSNumber numberWithBool:v58];
    [(HMDAssistantAccessControlModelV2 *)v33 setRequiresAuthenticationForSecureRequests:v39];

    __int16 v40 = [v36 sharedZoneControllerForUserDataController:v26];
    id v41 = [[HMDSettingTransaction alloc] initWithTransactionLabel:@"Update user assistant access control"];
    [(HMDSettingTransaction *)v41 addModelToBeUpdated:v33];
    [v40 runTransaction:v41 waitForCloudPush:0 completion:v11];

LABEL_22:
    goto LABEL_23;
  }
  __int16 v42 = (void *)MEMORY[0x1D9452090]();
  long long v43 = self;
  long long v44 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
  {
    uint64_t v45 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v72 = v45;
    _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_ERROR, "%{public}@Not initialized yet", buf, 0xCu);
  }
  uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Not ready" reason:@"Initialization is not complete" suggestion:0];
  v11[2](v11, v13);
LABEL_23:
}

uint64_t __173__HMDUserDataController_handleAssistantAccessControlAccessoryUUIDsUpdated_requireAuthenticationForSecureRequests_activityNotificationsEnabledForPersonalRequests_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) userDataController:*(void *)(a1 + 40) isAppleMediaAccessory:a2];
}

uint64_t __173__HMDUserDataController_handleAssistantAccessControlAccessoryUUIDsUpdated_requireAuthenticationForSecureRequests_activityNotificationsEnabledForPersonalRequests_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) userDataController:*(void *)(a1 + 40) isHAPAccessory:a2];
}

- (void)handleStartForZoneController:(id)a3
{
  id v8 = a3;
  id v4 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(HMDUserDataController *)self delegate];
  if (v8)
  {
    id v6 = [v5 sharedZoneControllerForUserDataController:self];

    if (v6 == v8)
    {
      [(HMDUserDataController *)self _startupSharedZone];
    }
    else
    {
      id v7 = [v5 privateZoneControllerForUserDataController:self];

      if (v7 == v8) {
        [(HMDUserDataController *)self _startupPrivateZone];
      }
    }
  }
}

- (void)_startupPrivateZone
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDUserDataController *)self delegate];
  id v4 = [v3 privateZoneControllerForUserDataController:self];

  id v25 = 0;
  id v5 = [v4 loadPrivateUserDataModelWithError:&v25];
  id v6 = v25;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Loaded user data model from local zone.", buf, 0xCu);
    }
    __int16 v11 = [v4 loadUserSettings];
    uint64_t v12 = [(HMDUserDataController *)v8 privateSettingsController];
    [v12 loadWithModels:v11];

    uint64_t v13 = [[HMDSettingTransaction alloc] initWithTransactionLabel:@"Private user setting model migration"];
    uint64_t v14 = [(HMDUserDataController *)v8 privateSettingsController];
    id v24 = v6;
    id v15 = (id)[v14 migrateSettingsTransactionWithTransaction:v13 error:&v24];
    id v16 = v24;

    if (v16)
    {
      id v17 = (void *)MEMORY[0x1D9452090]();
      uint64_t v18 = v8;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v27 = v20;
        __int16 v28 = 2112;
        id v29 = v16;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error migrating user data models in private zone %@", buf, 0x16u);
      }
      [(HMDUserDataController *)v18 _startPrivateZoneFirstLoadTimer];
    }
    else
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __44__HMDUserDataController__startupPrivateZone__block_invoke;
      v21[3] = &unk_1E6A18BA0;
      v21[4] = v8;
      id v22 = v4;
      id v23 = v5;
      [v22 runTransaction:v13 waitForCloudPush:1 completion:v21];
    }
  }
  else
  {
    [(HMDUserDataController *)self performFirstRunOperationsOnPrivateZoneController:v4];
    id v16 = v6;
  }
}

void __44__HMDUserDataController__startupPrivateZone__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
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
      int v10 = 138543618;
      __int16 v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Error migrating user data models in private zone %@", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 32) _startPrivateZoneFirstLoadTimer];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      __int16 v11 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully migrated models for private zone.", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) initializePrivateZoneController:*(void *)(a1 + 40) userDataModel:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _invalidatePrivateZoneFirstLoadTimer];
  }
}

- (void)_startupSharedZone
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDUserDataController *)self delegate];
  id v4 = [v3 sharedZoneControllerForUserDataController:self];

  id v31 = 0;
  id v5 = [v4 loadSharedUserDataModelWithError:&v31];
  id v6 = v31;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v33 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Loaded user data model from local zone.", buf, 0xCu);
    }
    __int16 v11 = [v4 loadUserSettings];
    if ([(HMDUserDataController *)v8 isCurrentUser])
    {
      __int16 v12 = [(HMDUserDataController *)v8 sharedSettingsController];
      [v12 loadWithModels:v11];

      id v13 = [[HMDSettingTransaction alloc] initWithTransactionLabel:@"Migration"];
      uint64_t v14 = [(HMDUserDataController *)v8 sharedSettingsController];
      id v30 = v6;
      id v15 = (id)[v14 migrateSettingsTransactionWithTransaction:v13 error:&v30];
      id v16 = v30;

      id v17 = [(HMDUserDataController *)v8 _migrateUserListeningHistoryUpdateControlWithUserCurrentDataModel:v5 transaction:v13 settingModels:v11];
      uint64_t v18 = [(HMDUserDataController *)v8 _migrateUserSupportsAutomaticHH2MigrationUserCurrentDataModel:v5 transaction:v13];
      if (v16)
      {
        uint64_t v19 = (void *)MEMORY[0x1D9452090](v18);
        uint64_t v20 = v8;
        uint64_t v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          id v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v33 = v22;
          __int16 v34 = 2112;
          id v35 = v16;
          _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Error migrating user data models in shared zone %@", buf, 0x16u);
        }
        [(HMDUserDataController *)v20 _startSharedZoneFirstLoadTimer];
      }
      else
      {
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __43__HMDUserDataController__startupSharedZone__block_invoke;
        v27[3] = &unk_1E6A18BA0;
        v27[4] = v8;
        id v28 = 0;
        id v29 = v4;
        [v29 runTransaction:v13 waitForCloudPush:1 completion:v27];
      }
      id v6 = v16;
    }
    else
    {
      id v23 = (void *)MEMORY[0x1D9452090]();
      id v24 = v8;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v33 = v26;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@We are not current user, no migration should happen on a non-current user zone", buf, 0xCu);
      }
      [(HMDUserDataController *)v24 initializeSharedZoneController:v4 userDataModel:v5];
      [(HMDUserDataController *)v24 _invalidateSharedZoneFirstLoadTimer];
    }
  }
  else
  {
    [(HMDUserDataController *)self performFirstRunOperationsOnSharedZoneController:v4];
  }
}

void __43__HMDUserDataController__startupSharedZone__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
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
      uint64_t v9 = *(void *)(a1 + 40);
      int v12 = 138543618;
      id v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Error migrating user data models in shared zone %@", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)(a1 + 32) _startSharedZoneFirstLoadTimer];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v10;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully migrated models for shared zone.", (uint8_t *)&v12, 0xCu);
    }
    __int16 v11 = [*(id *)(a1 + 48) loadSharedUserDataModelWithError:0];
    [*(id *)(a1 + 32) initializeSharedZoneController:*(void *)(a1 + 48) userDataModel:v11];
    [*(id *)(a1 + 32) _invalidateSharedZoneFirstLoadTimer];
  }
}

- (void)_invalidatePrivateZoneFirstLoadTimer
{
  id v3 = [(HMDUserDataController *)self privateZoneFirstLoadTimer];

  if (v3)
  {
    id v4 = [(HMDUserDataController *)self privateZoneFirstLoadTimer];
    [v4 suspend];

    [(HMDUserDataController *)self setPrivateZoneFirstLoadTimer:0];
  }
}

- (void)_startPrivateZoneFirstLoadTimer
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDUserDataController *)self privateZoneFirstLoadTimer];

  if (!v4)
  {
    id v5 = [(HMDUserDataController *)self timerCreator];
    id v6 = [v5 createExponentialBackoffTimerForZoneFetch];
    [(HMDUserDataController *)self setPrivateZoneFirstLoadTimer:v6];

    id v7 = [(HMDUserDataController *)self privateZoneFirstLoadTimer];
    [v7 setDelegate:self];

    id v8 = (void *)MEMORY[0x1D9452090]();
    uint64_t v9 = self;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = HMFGetLogIdentifier();
      int v12 = [(HMDUserDataController *)v9 privateZoneFirstLoadTimer];
      int v14 = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v12;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Starting timer to perform first run operations on shared zone. %@", (uint8_t *)&v14, 0x16u);
    }
    id v13 = [(HMDUserDataController *)v9 privateZoneFirstLoadTimer];
    [v13 resume];
  }
}

- (void)performFirstRunOperationsOnPrivateZoneController:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v39 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Creating user data model for private user zone", buf, 0xCu);
  }
  int v10 = (void *)MEMORY[0x1D9452090]();
  __int16 v11 = v7;
  int v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v39 = v13;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Configuring and making private settings", buf, 0xCu);
  }
  int v14 = [(HMDUserDataController *)v11 privateSettingsController];
  uint64_t v15 = [v14 modelsToMakeSettings];

  __int16 v16 = [HMDPrivateUserDataModel alloc];
  id v17 = [(HMDUserDataController *)v11 userUUID];
  uint64_t v18 = [(HMDUserDataController *)v11 homeUUID];
  uint64_t v19 = [(HMBModel *)v16 initWithModelID:v17 parentModelID:v18];

  uint64_t v20 = [(HMDUserDataController *)v11 userUUID];
  uint64_t v21 = __rootSettingUUIDInSettingModels(v15, v20);
  [(HMDPrivateUserDataModel *)v19 setSettingsRootUUID:v21];

  id v22 = [[HMDSettingTransaction alloc] initForInitialCreationWithTransactionLabel:@"Creating Private User Data"];
  [v22 addModelToBeUpdated:v19];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v23 = v15;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v34;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v34 != v26) {
          objc_enumerationMutation(v23);
        }
        [v22 addModelToBeUpdated:*(void *)(*((void *)&v33 + 1) + 8 * v27++)];
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v25);
  }

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __74__HMDUserDataController_performFirstRunOperationsOnPrivateZoneController___block_invoke;
  v30[3] = &unk_1E6A18BA0;
  v30[4] = v11;
  id v31 = v4;
  v32 = v19;
  id v28 = v19;
  id v29 = v4;
  [v29 runTransaction:v22 waitForCloudPush:1 completion:v30];
}

void __74__HMDUserDataController_performFirstRunOperationsOnPrivateZoneController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
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
      int v10 = 138543618;
      __int16 v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Error creating user data models in private zone %@", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 32) _startPrivateZoneFirstLoadTimer];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      __int16 v11 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully created and pushed models for private zone.", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) initializePrivateZoneController:*(void *)(a1 + 40) userDataModel:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _invalidatePrivateZoneFirstLoadTimer];
  }
}

- (void)_invalidateSharedZoneFirstLoadTimer
{
  id v3 = [(HMDUserDataController *)self sharedZoneFirstLoadTimer];

  if (v3)
  {
    id v4 = [(HMDUserDataController *)self sharedZoneFirstLoadTimer];
    [v4 suspend];

    [(HMDUserDataController *)self setSharedZoneFirstLoadTimer:0];
  }
}

- (void)_startSharedZoneFirstLoadTimer
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDUserDataController *)self sharedZoneFirstLoadTimer];

  if (!v4)
  {
    id v5 = [(HMDUserDataController *)self timerCreator];
    id v6 = [v5 createExponentialBackoffTimerForZoneFetch];
    [(HMDUserDataController *)self setSharedZoneFirstLoadTimer:v6];

    id v7 = [(HMDUserDataController *)self sharedZoneFirstLoadTimer];
    [v7 setDelegate:self];

    id v8 = (void *)MEMORY[0x1D9452090]();
    uint64_t v9 = self;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = HMFGetLogIdentifier();
      __int16 v12 = [(HMDUserDataController *)v9 sharedZoneFirstLoadTimer];
      int v14 = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v12;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Starting timer to perform first run operations on shared zone. %@", (uint8_t *)&v14, 0x16u);
    }
    id v13 = [(HMDUserDataController *)v9 sharedZoneFirstLoadTimer];
    [v13 resume];
  }
}

- (void)performFirstRunOperationsOnSharedZoneController:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  id v4 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v67 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating user data model for shared user zone", buf, 0xCu);
  }
  id v9 = [[HMDSettingTransaction alloc] initForInitialCreationWithTransactionLabel:@"Creating Shared User Data"];
  int v10 = [HMDAssistantAccessControlModelV2 alloc];
  __int16 v11 = [MEMORY[0x1E4F29128] UUID];
  __int16 v12 = [(HMDUserDataController *)v6 userUUID];
  id v13 = [(HMBModel *)v10 initWithModelID:v11 parentModelID:v12];

  uint64_t v14 = MEMORY[0x1E4F1CBF0];
  [(HMDAssistantAccessControlModelV2 *)v13 setAccessoryUUIDs:MEMORY[0x1E4F1CBF0]];
  [(HMDAssistantAccessControlModelV2 *)v13 setSiriEndpointAccessoryUUIDs:v14];
  uint64_t v15 = [HMDMediaContentProfileAccessControlModel alloc];
  __int16 v16 = [MEMORY[0x1E4F29128] UUID];
  id v17 = [(HMDUserDataController *)v6 userUUID];
  uint64_t v18 = [(HMBModel *)v15 initWithModelID:v16 parentModelID:v17];

  [(HMDMediaContentProfileAccessControlModel *)v18 setAccessories:v14];
  uint64_t v19 = [HMDUserSupportsAutomaticHH2MigrationModel alloc];
  uint64_t v20 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v21 = [(HMDUserDataController *)v6 userUUID];
  id v22 = [(HMBModel *)v19 initWithModelID:v20 parentModelID:v21];

  uint64_t v23 = MEMORY[0x1E4F1CC28];
  [(HMDUserSupportsAutomaticHH2MigrationModel *)v22 setSupportsAutomaticHH2Migration:MEMORY[0x1E4F1CC28]];
  uint64_t v24 = (void *)MEMORY[0x1D9452090]([(HMDUserSupportsAutomaticHH2MigrationModel *)v22 setSupportsHH2MigrationByOwnerAuto:v23]);
  uint64_t v25 = v6;
  uint64_t v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    uint64_t v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v67 = v27;
    _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Configuring and making shared settings", buf, 0xCu);
  }
  id v28 = [(HMDUserDataController *)v25 sharedSettingsController];
  id v29 = [v28 modelsToMakeSettings];

  id v30 = [HMDSharedUserDataModel alloc];
  id v31 = [(HMDUserDataController *)v25 userUUID];
  v32 = [(HMDUserDataController *)v25 homeUUID];
  long long v33 = [(HMBModel *)v30 initWithModelID:v31 parentModelID:v32];

  long long v34 = [(HMBModel *)v13 hmbModelID];
  [(HMDSharedUserDataModel *)v33 setAssistantAccessControlModelUUID:v34];

  long long v35 = [(HMBModel *)v18 hmbModelID];
  [(HMDSharedUserDataModel *)v33 setMediaContentProfileAccessControlModelUUID:v35];

  long long v36 = [(HMBModel *)v22 hmbModelID];
  [(HMDSharedUserDataModel *)v33 setSupportsAutomaticHH2MigrationModelUUID:v36];

  long long v37 = [(HMDUserDataController *)v25 userUUID];
  long long v38 = __rootSettingUUIDInSettingModels(v29, v37);
  [(HMDSharedUserDataModel *)v33 setSettingsRootUUID:v38];

  [v9 addModelToBeUpdated:v33];
  v55 = v13;
  [v9 addModelToBeUpdated:v13];
  v54 = v18;
  [v9 addModelToBeUpdated:v18];
  long long v39 = [HMDUserListeningHistoryUpdateControlModel alloc];
  uint64_t v40 = [MEMORY[0x1E4F29128] UUID];
  id v41 = [(HMDUserDataController *)v25 userUUID];
  __int16 v42 = [(HMBModel *)v39 initWithModelID:v40 parentModelID:v41];

  long long v43 = [(HMDUserDataController *)v25 dataSource];
  long long v44 = [v43 allAccessoryUUID];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __73__HMDUserDataController_performFirstRunOperationsOnSharedZoneController___block_invoke;
  v64[3] = &unk_1E6A196B8;
  void v64[4] = v25;
  uint64_t v45 = objc_msgSend(v44, "na_filter:", v64);

  [(HMDUserListeningHistoryUpdateControlModel *)v42 setAccessories:v45];
  char v46 = [(HMBModel *)v42 hmbModelID];
  [(HMDSharedUserDataModel *)v33 setUserListeningHistoryUpdateControlModelUUID:v46];

  [v9 addModelToBeUpdated:v42];
  [v9 addModelToBeUpdated:v22];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v47 = v29;
  uint64_t v48 = [v47 countByEnumeratingWithState:&v60 objects:v65 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v61;
    do
    {
      uint64_t v51 = 0;
      do
      {
        if (*(void *)v61 != v50) {
          objc_enumerationMutation(v47);
        }
        [v9 addModelToBeUpdated:*(void *)(*((void *)&v60 + 1) + 8 * v51++)];
      }
      while (v49 != v51);
      uint64_t v49 = [v47 countByEnumeratingWithState:&v60 objects:v65 count:16];
    }
    while (v49);
  }

  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __73__HMDUserDataController_performFirstRunOperationsOnSharedZoneController___block_invoke_2;
  v57[3] = &unk_1E6A18BA0;
  v57[4] = v25;
  id v58 = v56;
  BOOL v59 = v33;
  v52 = v33;
  id v53 = v56;
  [v53 runTransaction:v9 waitForCloudPush:1 completion:v57];
}

uint64_t __73__HMDUserDataController_performFirstRunOperationsOnSharedZoneController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegate];
  uint64_t v6 = [v5 userDataController:*(void *)(a1 + 32) isAccessoryUserListeningHistoryUpdateCapable:v4];

  return v6;
}

void __73__HMDUserDataController_performFirstRunOperationsOnSharedZoneController___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      __int16 v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Error creating user data models in shared zone %@", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 32) _startSharedZoneFirstLoadTimer];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      __int16 v11 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully created and pushed models for shared zone.", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) initializeSharedZoneController:*(void *)(a1 + 40) userDataModel:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _invalidateSharedZoneFirstLoadTimer];
  }
}

- (void)initializePrivateZoneController:(id)a3 userDataModel:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v6 settingsRootUUID];

  [(HMDUserDataController *)self setPrivateSettingsRootUUID:v9];
  id v12 = [v7 loadUserSettings];

  int v10 = [(HMDUserDataController *)self privateSettingsController];
  [v10 loadWithModels:v12];

  __int16 v11 = [(HMDUserDataController *)self privateSettingsController];
  [v11 configure];

  [(HMDUserDataController *)self eventDidInitializePrivateZone];
}

- (void)_migrateUserSupportsAutomaticHH2MigrationUserCurrentDataModel:(id)a3 transaction:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 supportsAutomaticHH2MigrationModelUUID];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    int v10 = self;
    __int16 v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v23 = 138543362;
      uint64_t v24 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@current data model has UUID, not migrating user supports automatic HH2 migration", (uint8_t *)&v23, 0xCu);
    }
  }
  else
  {
    id v13 = [HMDUserSupportsAutomaticHH2MigrationModel alloc];
    uint64_t v14 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v15 = [(HMDUserDataController *)self userUUID];
    __int16 v16 = [(HMBModel *)v13 initWithModelID:v14 parentModelID:v15];

    id v17 = [HMDSharedUserDataModel alloc];
    uint64_t v18 = [(HMDUserDataController *)self userUUID];
    uint64_t v19 = [(HMDUserDataController *)self homeUUID];
    uint64_t v20 = [(HMBModel *)v17 initWithModelID:v18 parentModelID:v19];

    uint64_t v21 = [(HMBModel *)v16 hmbModelID];
    [(HMDSharedUserDataModel *)v20 setSupportsAutomaticHH2MigrationModelUUID:v21];

    uint64_t v22 = MEMORY[0x1E4F1CC28];
    [(HMDUserSupportsAutomaticHH2MigrationModel *)v16 setSupportsAutomaticHH2Migration:MEMORY[0x1E4F1CC28]];
    [(HMDUserSupportsAutomaticHH2MigrationModel *)v16 setSupportsHH2MigrationByOwnerAuto:v22];
    [v7 addModel:v16];
    [v7 addModel:v20];
  }
}

- (id)_keyPathToModelFromKeyPath:(id)a3 models:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 dictionary];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __59__HMDUserDataController__keyPathToModelFromKeyPath_models___block_invoke;
  v21[3] = &unk_1E6A127D8;
  id v9 = v8;
  id v22 = v9;
  objc_msgSend(v6, "na_each:", v21);

  int v10 = [MEMORY[0x1E4F1CA60] dictionary];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __59__HMDUserDataController__keyPathToModelFromKeyPath_models___block_invoke_2;
  v18[3] = &unk_1E6A12800;
  id v19 = v9;
  id v20 = v10;
  id v11 = v10;
  id v12 = v9;
  objc_msgSend(v12, "na_each:", v18);
  id v13 = [v7 stringByAppendingString:@"."];

  uint64_t v14 = [v11 objectForKeyedSubscript:v13];
  if ([v14 conformsToProtocol:&unk_1F2E1EA10]) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;

  return v16;
}

void __59__HMDUserDataController__keyPathToModelFromKeyPath_models___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 hmbModelID];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void __59__HMDUserDataController__keyPathToModelFromKeyPath_models___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28E78] string];
  id v6 = v4;
  id v19 = v6;
  if (v6)
  {
    id v7 = v6;
    do
    {
      uint64_t v8 = [v7 hmbModelID];
      if (!v8) {
        goto LABEL_8;
      }
      id v9 = (void *)v8;
      int v10 = *(void **)(a1 + 32);
      id v11 = [v7 hmbModelID];
      id v12 = [v10 objectForKeyedSubscript:v11];

      if (!v12)
      {
LABEL_8:
        uint64_t v15 = (uint64_t)v5;
        if (v5) {
          goto LABEL_7;
        }
        goto LABEL_9;
      }
      id v13 = (void *)MEMORY[0x1E4F28E78];
      uint64_t v14 = [v7 nameForKeyPath];
      uint64_t v15 = [v13 stringWithFormat:@"%@.%@", v14, v5];

      id v16 = *(void **)(a1 + 32);
      id v17 = [v7 hmbParentModelID];
      uint64_t v18 = [v16 objectForKeyedSubscript:v17];

      id v7 = (void *)v18;
      id v5 = (void *)v15;
    }
    while (v18);
    if (v15)
    {
LABEL_7:
      [*(id *)(a1 + 40) setObject:v19 forKeyedSubscript:v15];
      id v5 = (void *)v15;
      goto LABEL_11;
    }
LABEL_9:
    id v5 = 0;
  }
  else
  {
    id v7 = 0;
  }
LABEL_11:
}

- (BOOL)_userListeningHistoryValueFromModels:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDUserDataController *)self _keyPathToModelFromKeyPath:@"root.music.playbackInfluencesForYou" models:v4];
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = HMFGetLogIdentifier();
      int v15 = 138543618;
      id v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v5;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@setting model =%@", (uint8_t *)&v15, 0x16u);
    }
    id v11 = [v5 numberValue];
    char v12 = [v11 BOOLValue];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      id v16 = v13;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@no setting model for ULH", (uint8_t *)&v15, 0xCu);
    }
    char v12 = 1;
  }

  return v12;
}

- (id)_migrateUserListeningHistoryUpdateControlWithUserCurrentDataModel:(id)a3 transaction:(id)a4 settingModels:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 userListeningHistoryUpdateControlModelUUID];

  if (v11)
  {
    char v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v43 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@current data model has UUID, not migrating ULH", buf, 0xCu);
    }
  }
  else
  {
    id v16 = [HMDUserListeningHistoryUpdateControlModel alloc];
    __int16 v17 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v18 = [(HMDUserDataController *)self userUUID];
    uint64_t v19 = [(HMBModel *)v16 initWithModelID:v17 parentModelID:v18];

    id v20 = [HMDSharedUserDataModel alloc];
    uint64_t v21 = [(HMDUserDataController *)self userUUID];
    id v22 = [(HMDUserDataController *)self homeUUID];
    int v23 = [(HMBModel *)v20 initWithModelID:v21 parentModelID:v22];

    uint64_t v24 = objc_msgSend(v10, "na_map:", &__block_literal_global_141331);
    uint64_t v25 = (void *)MEMORY[0x1D9452090]();
    uint64_t v26 = self;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      id v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v43 = v28;
      __int16 v44 = 2112;
      uint64_t v45 = v24;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Filtered Setting MOdels: %@", buf, 0x16u);
    }
    BOOL v29 = [(HMDUserDataController *)v26 _userListeningHistoryValueFromModels:v24];
    id v30 = (void *)MEMORY[0x1D9452090]();
    id v31 = v26;
    v32 = HMFGetOSLogHandle();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
    if (v29)
    {
      if (v33)
      {
        long long v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v43 = v34;
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@ULH was true for the user, migrating accessories", buf, 0xCu);
      }
      long long v35 = [(HMDUserDataController *)v31 dataSource];
      long long v36 = [v35 allAccessoryUUID];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __117__HMDUserDataController__migrateUserListeningHistoryUpdateControlWithUserCurrentDataModel_transaction_settingModels___block_invoke_70;
      v41[3] = &unk_1E6A196B8;
      v41[4] = v31;
      long long v37 = objc_msgSend(v36, "na_filter:", v41);

      [(HMDUserListeningHistoryUpdateControlModel *)v19 setAccessories:v37];
    }
    else
    {
      if (v33)
      {
        long long v38 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v43 = v38;
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@ULH was False for the user, NOT migrating accessories", buf, 0xCu);
      }
      [(HMDUserListeningHistoryUpdateControlModel *)v19 setAccessories:MEMORY[0x1E4F1CBF0]];
    }
    long long v39 = [(HMBModel *)v19 hmbModelID];
    [(HMDSharedUserDataModel *)v23 setUserListeningHistoryUpdateControlModelUUID:v39];

    [v9 addModel:v19];
    [v9 addModel:v23];
  }
  return v9;
}

uint64_t __117__HMDUserDataController__migrateUserListeningHistoryUpdateControlWithUserCurrentDataModel_transaction_settingModels___block_invoke_70(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegate];
  uint64_t v6 = [v5 userDataController:*(void *)(a1 + 32) isAccessoryUserListeningHistoryUpdateCapable:v4];

  return v6;
}

id __117__HMDUserDataController__migrateUserListeningHistoryUpdateControlWithUserCurrentDataModel_transaction_settingModels___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_1F2DDC648]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)initializeSharedZoneController:(id)a3 userDataModel:(id)a4
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v7 assistantAccessControlModelUUID];
  [(HMDUserDataController *)self setAssistantAccessControlModelUUID:v9];

  id v10 = [v7 mediaContentProfileAccessControlModelUUID];
  [(HMDUserDataController *)self setMediaContentProfileAccessControlModelUUID:v10];

  id v11 = [(HMDUserDataController *)self userUUID];
  [v6 registerForSharedUserDataModelUpdates:self modelID:v11];

  char v12 = [v7 userListeningHistoryUpdateControlModelUUID];
  [(HMDUserDataController *)self setUserListeningHistoryUpdateControlModelUUID:v12];

  id v13 = [v7 supportsAutomaticHH2MigrationModelUUID];
  [(HMDUserDataController *)self setSupportsAutomaticHH2MigrationModelUUID:v13];

  uint64_t v14 = [v7 settingsRootUUID];
  [(HMDUserDataController *)self setSharedSettingsRootUUID:v14];

  int v15 = [(HMDUserDataController *)self assistantAccessControlModelUUID];
  [v6 registerForAssistantAccessControlModelUpdates:self modelID:v15];

  id v16 = [(HMDUserDataController *)self mediaContentProfileAccessControlModelUUID];
  [v6 registerForMediaContentAccessControlModelUpdates:self modelID:v16];

  __int16 v17 = [(HMDUserDataController *)self userListeningHistoryUpdateControlModelUUID];
  [v6 registerForUserListeningHistoryUpdateControlModelUpdates:self modelID:v17];

  uint64_t v18 = [(HMDUserDataController *)self supportsAutomaticHH2MigrationModelUUID];
  [v6 registerForUserSupportsAutomaticHH2MigrationModelUpdates:self modelID:v18];

  uint64_t v19 = (void *)MEMORY[0x1D9452090]();
  id v20 = self;
  uint64_t v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    id v22 = HMFGetLogIdentifier();
    int v23 = [(HMDUserDataController *)v20 assistantAccessControlModelUUID];
    *(_DWORD *)buf = 138543618;
    v107 = v22;
    __int16 v108 = 2112;
    id v109 = v23;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Loading assistant access control model %@", buf, 0x16u);
  }
  uint64_t v24 = [(HMDUserDataController *)v20 assistantAccessControlModelUUID];
  id v105 = 0;
  uint64_t v25 = [v6 loadAssistantAccessControlModelWithModelID:v24 error:&v105];
  id v26 = v105;

  uint64_t v27 = (void *)MEMORY[0x1D9452090]();
  id v28 = v20;
  BOOL v29 = HMFGetOSLogHandle();
  id v30 = v29;
  unint64_t v31 = 0x1E4F1C000;
  if (v25)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v32 = HMFGetLogIdentifier();
      BOOL v33 = [v25 requiresAuthenticationForSecureRequests];
      [v25 activityNotificationsEnabledForPersonalRequests];
      id v101 = v6;
      id v34 = v26;
      v36 = id v35 = v7;
      long long v37 = [v25 accessoryUUIDs];
      *(_DWORD *)buf = 138544130;
      v107 = v32;
      __int16 v108 = 2112;
      id v109 = v33;
      __int16 v110 = 2112;
      v111 = v36;
      __int16 v112 = 2112;
      v113 = v37;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Loaded assistant access control requires auth: %@, activity notifications enabled for personal requests: %@, accessories: %@", buf, 0x2Au);

      id v7 = v35;
      id v26 = v34;
      id v6 = v101;

      unint64_t v31 = 0x1E4F1C000uLL;
    }

    long long v38 = [*(id *)(v31 + 2688) set];
    long long v39 = [v25 accessoryUUIDs];
    objc_msgSend(v38, "na_safeAddObjectsFromArray:", v39);

    uint64_t v40 = [v25 siriEndpointAccessoryUUIDs];
    objc_msgSend(v38, "na_safeAddObjectsFromArray:", v40);

    [(HMDUserDataController *)v28 setAssistantAccessControlAccessoryUUIDs:v38];
    id v41 = [v25 requiresAuthenticationForSecureRequests];
    -[HMDUserDataController setAssistantAccessControlRequiresAuthenticationForSecureRequests:](v28, "setAssistantAccessControlRequiresAuthenticationForSecureRequests:", [v41 BOOLValue]);

    if ([v25 hmbPropertyWasSet:@"activityNotificationsEnabledForPersonalRequests"])
    {
      __int16 v42 = [v25 activityNotificationsEnabledForPersonalRequests];
      -[HMDUserDataController setAssistantAccessControlActivityNotificationsEnabledForPersonalRequests:](v28, "setAssistantAccessControlActivityNotificationsEnabledForPersonalRequests:", [v42 BOOLValue]);
    }
    else
    {
      [(HMDUserDataController *)v28 setAssistantAccessControlActivityNotificationsEnabledForPersonalRequests:1];
    }
  }
  else
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      long long v43 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v107 = v43;
      __int16 v108 = 2112;
      id v109 = v26;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unable to load assistant access control %@", buf, 0x16u);
    }
  }

  __int16 v44 = (void *)MEMORY[0x1D9452090]();
  uint64_t v45 = v28;
  uint64_t v46 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    id v47 = HMFGetLogIdentifier();
    uint64_t v48 = [(HMDUserDataController *)v45 mediaContentProfileAccessControlModelUUID];
    *(_DWORD *)buf = 138543618;
    v107 = v47;
    __int16 v108 = 2112;
    id v109 = v48;
    _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_INFO, "%{public}@Loading media content profile access control model %@", buf, 0x16u);
  }
  uint64_t v49 = [(HMDUserDataController *)v45 mediaContentProfileAccessControlModelUUID];
  id v104 = 0;
  uint64_t v50 = [v6 loadMediaContentAccessControlModelWithModelID:v49 error:&v104];
  id v51 = v104;

  v52 = (void *)MEMORY[0x1D9452090]();
  id v53 = v45;
  v54 = HMFGetOSLogHandle();
  v55 = v54;
  if (v50)
  {
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      id v56 = HMFGetLogIdentifier();
      v57 = [v50 accessories];
      *(_DWORD *)buf = 138543618;
      v107 = v56;
      __int16 v108 = 2112;
      id v109 = v57;
      _os_log_impl(&dword_1D49D5000, v55, OS_LOG_TYPE_INFO, "%{public}@Loaded media content profile access control accessories %@", buf, 0x16u);
    }
    id v58 = *(void **)(v31 + 2688);
    BOOL v59 = [v50 accessories];
    long long v60 = [v58 setWithArray:v59];
    [(HMDUserDataController *)v53 setMediaContentProfileAccessControlAccessories:v60];
  }
  else
  {
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      long long v61 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v107 = v61;
      __int16 v108 = 2112;
      id v109 = v51;
      _os_log_impl(&dword_1D49D5000, v55, OS_LOG_TYPE_ERROR, "%{public}@Unable to load media content profile accessories %@", buf, 0x16u);
    }
  }

  long long v62 = (void *)MEMORY[0x1D9452090]();
  long long v63 = v53;
  v64 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
  {
    id v65 = HMFGetLogIdentifier();
    v66 = [(HMDUserDataController *)v63 userListeningHistoryUpdateControlModelUUID];
    *(_DWORD *)buf = 138543618;
    v107 = v65;
    __int16 v108 = 2112;
    id v109 = v66;
    _os_log_impl(&dword_1D49D5000, v64, OS_LOG_TYPE_INFO, "%{public}@Loading user listening history update model %@", buf, 0x16u);
  }
  long long v67 = [(HMDUserDataController *)v63 userListeningHistoryUpdateControlModelUUID];
  id v103 = 0;
  uint64_t v68 = [v6 loadUserListeningHistoryUpdateControlModelWithModelID:v67 error:&v103];
  id v69 = v103;

  long long v70 = (void *)MEMORY[0x1D9452090]();
  id v71 = v63;
  uint64_t v72 = HMFGetOSLogHandle();
  __int16 v73 = v72;
  if (v68)
  {
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      uint64_t v74 = HMFGetLogIdentifier();
      __int16 v75 = [v68 accessories];
      *(_DWORD *)buf = 138543618;
      v107 = v74;
      __int16 v108 = 2112;
      id v109 = v75;
      _os_log_impl(&dword_1D49D5000, v73, OS_LOG_TYPE_INFO, "%{public}@Loaded user listening history update accessories %@", buf, 0x16u);
    }
    v76 = *(void **)(v31 + 2688);
    __int16 v77 = [v68 accessories];
    uint64_t v78 = [v76 setWithArray:v77];
    [(HMDUserDataController *)v71 setUserListeningHistoryUpdateControlModelAccessories:v78];
  }
  else
  {
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      uint64_t v79 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v107 = v79;
      __int16 v108 = 2112;
      id v109 = v69;
      _os_log_impl(&dword_1D49D5000, v73, OS_LOG_TYPE_ERROR, "%{public}@Unable to load update listening history accessories %@", buf, 0x16u);
    }
  }

  id v80 = (void *)MEMORY[0x1D9452090]();
  id v81 = v71;
  v82 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
  {
    v83 = HMFGetLogIdentifier();
    __int16 v84 = [(HMDUserDataController *)v81 supportsAutomaticHH2MigrationModelUUID];
    *(_DWORD *)buf = 138543618;
    v107 = v83;
    __int16 v108 = 2112;
    id v109 = v84;
    _os_log_impl(&dword_1D49D5000, v82, OS_LOG_TYPE_INFO, "%{public}@Loading user supports automatic HH2 migration model %@", buf, 0x16u);
  }
  id v85 = [(HMDUserDataController *)v81 supportsAutomaticHH2MigrationModelUUID];
  id v102 = 0;
  __int16 v86 = [v6 loadUserSupportsAutomaticHH2MigrationModelWithModelID:v85 error:&v102];
  id v87 = v102;

  if (v86)
  {
    uint64_t v88 = [v86 supportsAutomaticHH2Migration];
    -[HMDUserDataController setSupportsHH2MigrationByOwnerManual:](v81, "setSupportsHH2MigrationByOwnerManual:", [v88 BOOLValue]);

    v89 = [v86 supportsHH2MigrationByOwnerAuto];
    -[HMDUserDataController setSupportsHH2MigrationByOwnerAuto:](v81, "setSupportsHH2MigrationByOwnerAuto:", [v89 BOOLValue]);

    v90 = (void *)MEMORY[0x1D9452090]();
    v91 = v81;
    v92 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
    {
      v93 = HMFGetLogIdentifier();
      [(HMDUserDataController *)v91 supportsHH2MigrationByOwnerManual];
      v94 = HMFBooleanToString();
      [(HMDUserDataController *)v91 supportsHH2MigrationByOwnerAuto];
      v95 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      v107 = v93;
      __int16 v108 = 2114;
      id v109 = v94;
      __int16 v110 = 2114;
      v111 = v95;
      _os_log_impl(&dword_1D49D5000, v92, OS_LOG_TYPE_INFO, "%{public}@Loaded user supports automatic HH2 migration model by owner manual = %{public}@, by owner auto = %{public}@", buf, 0x20u);
    }
  }
  else
  {
    v90 = (void *)MEMORY[0x1D9452090]();
    v96 = v81;
    v92 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      v97 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v107 = v97;
      __int16 v108 = 2112;
      id v109 = v87;
      _os_log_impl(&dword_1D49D5000, v92, OS_LOG_TYPE_ERROR, "%{public}@Unable to load user supports automatic HH2 migration model %@", buf, 0x16u);
    }
  }

  v98 = [v6 loadUserSettings];
  v99 = [(HMDUserDataController *)v81 sharedSettingsController];
  [v99 loadWithModels:v98];

  v100 = [(HMDUserDataController *)v81 sharedSettingsController];
  [v100 configure];

  [(HMDUserDataController *)v81 eventDidInitializeSharedZone];
}

- (void)eventDidInitializeSharedZone
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  self->_isModifyingState = 1;
  switch([(HMDUserDataController *)self state])
  {
    case 0uLL:
      id v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = self;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        char v12 = HMFGetLogIdentifier();
        int v19 = 138543362;
        id v20 = v12;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Moving to pending private on initializing shared zone", (uint8_t *)&v19, 0xCu);
      }
      id v13 = v10;
      uint64_t v14 = 3;
      goto LABEL_11;
    case 1uLL:
    case 3uLL:
      id v4 = (void *)MEMORY[0x1D9452090]();
      id v5 = self;
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = HMFGetLogIdentifier();
        id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserDataController state](v5, "state"));
        int v19 = 138543618;
        id v20 = v7;
        __int16 v21 = 2112;
        id v22 = v8;
        _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unexpected from state on init shared zone event %@", (uint8_t *)&v19, 0x16u);
      }
      break;
    case 2uLL:
      int v15 = (void *)MEMORY[0x1D9452090]();
      id v16 = self;
      __int16 v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        int v19 = 138543362;
        id v20 = v18;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Moving to initialized on initializing shared zone", (uint8_t *)&v19, 0xCu);
      }
      id v13 = v16;
      uint64_t v14 = 1;
LABEL_11:
      [(HMDUserDataController *)v13 setState:v14];
      break;
    default:
      break;
  }
  self->_isModifyingState = 0;
}

- (void)eventDidInitializePrivateZone
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  self->_isModifyingState = 1;
  unint64_t v4 = [(HMDUserDataController *)self state];
  if (v4 - 1 < 2)
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    char v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserDataController state](v12, "state"));
      int v20 = 138543618;
      __int16 v21 = v14;
      __int16 v22 = 2112;
      uint64_t v23 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpected from state on init private zone event %@", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    if (v4 == 3)
    {
      id v16 = (void *)MEMORY[0x1D9452090]();
      __int16 v17 = self;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v19 = HMFGetLogIdentifier();
        int v20 = 138543362;
        __int16 v21 = v19;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Moving to initialized on initializing private zone", (uint8_t *)&v20, 0xCu);
      }
      id v9 = v17;
      uint64_t v10 = 1;
      goto LABEL_13;
    }
    if (!v4)
    {
      id v5 = (void *)MEMORY[0x1D9452090]();
      id v6 = self;
      id v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = HMFGetLogIdentifier();
        int v20 = 138543362;
        __int16 v21 = v8;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Moving to pending shared on initializing private zone", (uint8_t *)&v20, 0xCu);
      }
      id v9 = v6;
      uint64_t v10 = 2;
LABEL_13:
      [(HMDUserDataController *)v9 setState:v10];
    }
  }
  self->_isModifyingState = 0;
}

- (void)setState:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = os_unfair_lock_lock_with_options();
  if (self->_state == a3)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    id v7 = (void *)MEMORY[0x1D9452090](v6);
    id v8 = self;
    HMFGetOSLogHandle();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      HMDUserDataControllerStateAsString(self->_state);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      char v12 = HMDUserDataControllerStateAsString(a3);
      int v14 = 138543874;
      id v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      __int16 v18 = 2112;
      int v19 = v12;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Moving state from %@ to %@", (uint8_t *)&v14, 0x20u);
    }
    self->_state = a3;
    os_unfair_lock_unlock(&self->_lock);
    if (a3 == 1)
    {
      id v13 = [(HMDUserDataController *)v8 notificationCenter];
      [v13 postNotificationName:@"HMDUserDataControllerInitializedNotificationKey" object:v8];
    }
  }
}

- (unint64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if ([(HMDUserDataController *)self isInitialized])
  {
    unint64_t v4 = [(HMDUserDataController *)self sharedSettingsController];
    [v4 encodeWithCoder:v6];

    id v5 = [(HMDUserDataController *)self privateSettingsController];
    [v5 encodeWithCoder:v6];

    [v6 encodeBool:self->_state == 1 forKey:*MEMORY[0x1E4F2DF68]];
  }
}

- (NSArray)userListeningHistoryUpdateControlModelAccessoriesToEncode
{
  id v2 = [(HMDUserDataController *)self userListeningHistoryUpdateControlModelAccessories];
  id v3 = [v2 allObjects];
  unint64_t v4 = (void *)[v3 copy];

  return (NSArray *)v4;
}

- (NSArray)mediaContentProfileAccessControlAccessoriesToEncode
{
  id v2 = [(HMDUserDataController *)self mediaContentProfileAccessControlAccessories];
  id v3 = [v2 allObjects];
  unint64_t v4 = (void *)[v3 copy];

  return (NSArray *)v4;
}

- (NSArray)assistantAccessControlAccessoriesToEncode
{
  if ([(HMDUserDataController *)self isInitialized])
  {
    id v3 = [(HMDUserDataController *)self assistantAccessControlAccessoryUUIDs];
    unint64_t v4 = [v3 allObjects];
    id v5 = (void *)[v4 copy];
  }
  else
  {
    id v5 = 0;
  }
  return (NSArray *)v5;
}

- (BOOL)isInitialized
{
  return [(HMDUserDataController *)self state] == 1;
}

- (void)configure
{
  id v3 = [(HMDUserDataController *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__HMDUserDataController_configure__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

void __34__HMDUserDataController_configure__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  id v2 = [v4 sharedZoneControllerForUserDataController:*(void *)(a1 + 32)];
  [v2 start];

  id v3 = [v4 privateZoneControllerForUserDataController:*(void *)(a1 + 32)];
  [v3 start];
}

- (HMDUserDataController)initWithDelegate:(id)a3 dataSource:(id)a4 queue:(id)a5 userID:(id)a6 homeID:(id)a7 sharedSettingsController:(id)a8 privateSettingsController:(id)a9 isCurrentUser:(BOOL)a10
{
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  uint64_t v24 = objc_opt_new();
  LOBYTE(v27) = a10;
  uint64_t v25 = [(HMDUserDataController *)self initWithDelegate:v23 dataSource:v22 queue:v21 userID:v20 homeID:v19 sharedSettingsController:v18 privateSettingsController:v17 timerCreator:v24 isCurrentUser:v27];

  return v25;
}

- (HMDUserDataController)initWithDelegate:(id)a3 dataSource:(id)a4 queue:(id)a5 userID:(id)a6 homeID:(id)a7 sharedSettingsController:(id)a8 privateSettingsController:(id)a9 timerCreator:(id)a10 isCurrentUser:(BOOL)a11
{
  id obj = a3;
  id v17 = a4;
  id v32 = a5;
  id v31 = a6;
  id v30 = a7;
  id v29 = a8;
  id v18 = a9;
  id v19 = a10;
  v34.receiver = self;
  v34.super_class = (Class)HMDUserDataController;
  id v20 = [(HMDUserDataController *)&v34 init];
  id v21 = v20;
  if (v20)
  {
    v20->_unint64_t state = 2 * (v18 == 0);
    v20->_isModifyingState = 0;
    objc_storeStrong((id *)&v20->_clientQueue, a5);
    objc_storeWeak((id *)&v21->_delegate, obj);
    objc_storeStrong((id *)&v21->_timerCreator, a10);
    uint64_t v22 = [MEMORY[0x1E4F1CA80] set];
    assistantAccessControlAccessoryUUIDs = v21->_assistantAccessControlAccessoryUUIDs;
    v21->_assistantAccessControlAccessoryUUIDs = (NSMutableSet *)v22;

    *(_WORD *)&v21->_assistantAccessControlRequiresAuthenticationForSecureRequests = 256;
    uint64_t v24 = [MEMORY[0x1E4F1CA80] set];
    mediaContentProfileAccessControlAccessories = v21->_mediaContentProfileAccessControlAccessories;
    v21->_mediaContentProfileAccessControlAccessories = (NSMutableSet *)v24;

    objc_storeStrong((id *)&v21->_userUUID, a6);
    objc_storeStrong((id *)&v21->_homeUUID, a7);
    objc_storeStrong((id *)&v21->_sharedSettingsController, a8);
    objc_storeStrong((id *)&v21->_privateSettingsController, a9);
    objc_storeWeak((id *)&v21->_dataSource, v17);
    uint64_t v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    notificationCenter = v21->_notificationCenter;
    v21->_notificationCenter = (NSNotificationCenter *)v26;

    v21->_isCurrentUser = a11;
  }

  return v21;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t99 != -1) {
    dispatch_once(&logCategory__hmf_once_t99, &__block_literal_global_198_141378);
  }
  id v2 = (void *)logCategory__hmf_once_v100;
  return v2;
}

uint64_t __36__HMDUserDataController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v100;
  logCategory__hmf_once_v100 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end