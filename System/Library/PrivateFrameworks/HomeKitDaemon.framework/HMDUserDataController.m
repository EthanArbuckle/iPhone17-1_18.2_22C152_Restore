@interface HMDUserDataController
+ (id)logCategory;
- (BOOL)assistantAccessControlActivityNotificationsEnabledForPersonalRequests;
- (BOOL)assistantAccessControlRequiresAuthenticationForSecureRequests;
- (BOOL)isCurrentUser;
- (BOOL)isInitialized;
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
- (NSUUID)userListeningHistoryUpdateControlModelUUID;
- (NSUUID)userUUID;
- (OS_dispatch_queue)clientQueue;
- (id)logIdentifier;
- (id)updateListeningHistoryModelToReset;
- (int64_t)sharedUserSettingsLogEventBackingStoreControllerRunState;
- (unint64_t)state;
- (void)_invalidatePrivateZoneFirstLoadTimer;
- (void)_invalidateSharedZoneFirstLoadTimer;
- (void)_startPrivateZoneFirstLoadTimer;
- (void)_startSharedZoneFirstLoadTimer;
- (void)assistantAccessControlModelRemoved:(id)a3 completion:(id)a4;
- (void)assistantAccessControlModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5;
- (void)configure;
- (void)enableUserListeningHistoryForAccessory:(id)a3;
- (void)eventDidInitializePrivateZone;
- (void)eventDidInitializeSharedZone;
- (void)handleAssistantAccessControlAccessoryUUIDsUpdated:(id)a3 requireAuthenticationForSecureRequests:(BOOL)a4 activityNotificationsEnabledForPersonalRequests:(BOOL)a5 completion:(id)a6;
- (void)handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4;
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
- (void)setMediaContentProfileAccessControlAccessories:(id)a3;
- (void)setMediaContentProfileAccessControlModelUUID:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setPrivateSettingsRootUUID:(id)a3;
- (void)setPrivateZoneFirstLoadTimer:(id)a3;
- (void)setSharedSettingsRootUUID:(id)a3;
- (void)setSharedZoneFirstLoadTimer:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setUserListeningHistoryUpdateControlModelAccessories:(id)a3;
- (void)setUserListeningHistoryUpdateControlModelUUID:(id)a3;
- (void)sharedUserDataModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5;
- (void)timerDidFire:(id)a3;
- (void)userListeningHistoryUpdateControlModelRemoved:(id)a3 completion:(id)a4;
- (void)userListeningHistoryUpdateControlModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5;
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
  return (HMDSettingsControllerProtocol *)objc_getProperty(self, a2, 168, 1);
}

- (HMDSettingsControllerProtocol)sharedSettingsController
{
  return (HMDSettingsControllerProtocol *)objc_getProperty(self, a2, 160, 1);
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
  return (NSNotificationCenter *)objc_getProperty(self, a2, 152, 1);
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
  return (NSUUID *)objc_getProperty(self, a2, 128, 1);
}

- (void)setUserListeningHistoryUpdateControlModelAccessories:(id)a3
{
}

- (NSMutableSet)userListeningHistoryUpdateControlModelAccessories
{
  return (NSMutableSet *)objc_getProperty(self, a2, 120, 1);
}

- (void)setUserListeningHistoryUpdateControlModelUUID:(id)a3
{
}

- (NSUUID)userListeningHistoryUpdateControlModelUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 112, 1);
}

- (void)setMediaContentProfileAccessControlAccessories:(id)a3
{
}

- (NSMutableSet)mediaContentProfileAccessControlAccessories
{
  return (NSMutableSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setMediaContentProfileAccessControlModelUUID:(id)a3
{
}

- (NSUUID)mediaContentProfileAccessControlModelUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAssistantAccessControlAccessoryUUIDs:(id)a3
{
}

- (NSMutableSet)assistantAccessControlAccessoryUUIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAssistantAccessControlModelUUID:(id)a3
{
}

- (NSUUID)assistantAccessControlModelUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSharedSettingsRootUUID:(id)a3
{
}

- (NSUUID)sharedSettingsRootUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (HMDUserDataControllerTimerCreator)timerCreator
{
  return (HMDUserDataControllerTimerCreator *)objc_getProperty(self, a2, 64, 1);
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
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
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
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__HMDUserDataController_timerDidFire___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __38__HMDUserDataController_timerDidFire___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) sharedZoneFirstLoadTimer];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 40);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      int v18 = 138543362;
      v19 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Attempting to recreate data in shared user data zone", (uint8_t *)&v18, 0xCu);
    }
    [*(id *)(a1 + 40) _startupSharedZone];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    v9 = [*(id *)(a1 + 40) privateZoneFirstLoadTimer];
    int v10 = [v8 isEqual:v9];

    v11 = (void *)MEMORY[0x230FBD990]();
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
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Attempting to recreate data in private user data zone", (uint8_t *)&v18, 0xCu);
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
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unexpected timer fired %@", (uint8_t *)&v18, 0x16u);
      }
    }
  }
}

- (void)userListeningHistoryUpdateControlModelRemoved:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  id v8 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x230FBD990]();
  int v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v15 = 138543362;
    v16 = v12;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@user update listening history access control was removed", (uint8_t *)&v15, 0xCu);
  }
  v13 = [MEMORY[0x263EFF9C0] set];
  [(HMDUserDataController *)v10 setUserListeningHistoryUpdateControlModelAccessories:v13];

  id v14 = objc_alloc_init(MEMORY[0x263F49250]);
  v7[2](v7, v14);
}

- (void)userListeningHistoryUpdateControlModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
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
  v13 = [MEMORY[0x263EFF8C0] array];
  }

  id v14 = [MEMORY[0x263EFF9C0] setWithArray:v13];
  int v15 = [(HMDUserDataController *)self userListeningHistoryUpdateControlModelAccessories];
  char v16 = [v15 isEqualToSet:v14];

  if ((v16 & 1) == 0)
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    int v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      __int16 v20 = HMFGetLogIdentifier();
      int v23 = 138543618;
      v24 = v20;
      __int16 v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating listening history update accessories to %@", (uint8_t *)&v23, 0x16u);
    }
    [(HMDUserDataController *)v18 setUserListeningHistoryUpdateControlModelAccessories:v14];
    uint64_t v21 = [(HMDUserDataController *)v18 delegate];
    [v21 userDataControllerDidUpdateUserListeningHistoryUpdateControl:v18];
  }
  id v22 = objc_alloc_init(MEMORY[0x263F49250]);
  v10[2](v10, v22);
}

- (void)mediaContentProfileAccessControlModelRemoved:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  id v8 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x230FBD990]();
  int v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v15 = 138543362;
    char v16 = v12;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Media content profile access control was removed", (uint8_t *)&v15, 0xCu);
  }
  v13 = [MEMORY[0x263EFF9C0] set];
  [(HMDUserDataController *)v10 setMediaContentProfileAccessControlAccessories:v13];

  id v14 = objc_alloc_init(MEMORY[0x263F49250]);
  v7[2](v7, v14);
}

- (void)mediaContentProfileAccessControlModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, id))a5;
  v11 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = (void *)MEMORY[0x263EFF9C0];
  v13 = [v8 accessories];
  id v14 = [v12 setWithArray:v13];

  int v15 = [(HMDUserDataController *)self mediaContentProfileAccessControlAccessories];
  char v16 = [v15 isEqualToSet:v14];

  if ((v16 & 1) == 0)
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    int v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      __int16 v20 = HMFGetLogIdentifier();
      int v23 = 138543618;
      v24 = v20;
      __int16 v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating media content profile access control to %@", (uint8_t *)&v23, 0x16u);
    }
    [(HMDUserDataController *)v18 setMediaContentProfileAccessControlAccessories:v14];
    uint64_t v21 = [(HMDUserDataController *)v18 delegate];
    [v21 userDataControllerDidUpdateMediaContentProfile:v18];
  }
  id v22 = objc_alloc_init(MEMORY[0x263F49250]);
  v10[2](v10, v22);
}

- (int64_t)sharedUserSettingsLogEventBackingStoreControllerRunState
{
  v3 = [(HMDUserDataController *)self delegate];
  id v4 = [v3 sharedZoneControllerForUserDataController:self];
  int64_t v5 = [v4 logEventRunState];

  return v5;
}

- (NSDictionary)privateSettingValuesByKeyPath
{
  return (NSDictionary *)MEMORY[0x263EFFA78];
}

- (NSDictionary)sharedSettingValuesByKeyPath
{
  return (NSDictionary *)MEMORY[0x263EFFA78];
}

- (void)assistantAccessControlModelRemoved:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  id v8 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x230FBD990]();
  int v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v14 = 138543362;
    int v15 = v12;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Assistant access control was removed", (uint8_t *)&v14, 0xCu);
  }
  id v13 = objc_alloc_init(MEMORY[0x263F49250]);
  v7[2](v7, v13);
}

- (void)assistantAccessControlModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, id))a5;
  v11 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v11);

  if ([v8 hmbPropertyWasSet:@"activityNotificationsEnabledForPersonalRequests"])
  {
    id v12 = [v8 activityNotificationsEnabledForPersonalRequests];
    uint64_t v13 = [v12 BOOLValue];
  }
  else
  {
    uint64_t v13 = 1;
  }
  int v14 = [v8 requiresAuthenticationForSecureRequests];
  uint64_t v15 = [v14 BOOLValue];

  uint64_t v16 = [MEMORY[0x263EFF9C0] set];
  uint64_t v17 = [v8 accessoryUUIDs];
  objc_msgSend(v16, "na_safeAddObjectsFromArray:", v17);

  int v18 = [v8 siriEndpointAccessoryUUIDs];
  objc_msgSend(v16, "na_safeAddObjectsFromArray:", v18);

  v19 = [(HMDUserDataController *)self assistantAccessControlAccessoryUUIDs];
  if (![v19 isEqualToSet:v16]
    || v13 != [(HMDUserDataController *)self assistantAccessControlActivityNotificationsEnabledForPersonalRequests])
  {

LABEL_7:
    __int16 v20 = (void *)MEMORY[0x230FBD990]();
    uint64_t v21 = self;
    id v22 = HMFGetOSLogHandle();
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
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating assistant access control on zone update to require auth: %@, accessories:%@", buf, 0x20u);

      uint64_t v13 = v26;
      int v10 = v25;

      id v9 = v23;
      uint64_t v15 = v35;
    }

    [(HMDUserDataController *)v21 setAssistantAccessControlAccessoryUUIDs:v16];
    [(HMDUserDataController *)v21 setAssistantAccessControlRequiresAuthenticationForSecureRequests:v15];
    [(HMDUserDataController *)v21 setAssistantAccessControlActivityNotificationsEnabledForPersonalRequests:v13];
    v28 = [(HMDUserDataController *)v21 delegate];
    [v28 userDataControllerDidUpdateAssistantAccessControl:v21];

    goto LABEL_10;
  }
  int v30 = [(HMDUserDataController *)self assistantAccessControlRequiresAuthenticationForSecureRequests];

  if (v15 != v30) {
    goto LABEL_7;
  }
  v31 = (void *)MEMORY[0x230FBD990]();
  v32 = self;
  v33 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    v34 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v37 = v34;
    __int16 v38 = 2112;
    id v39 = v8;
    _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Model in zone update has no changes %@", buf, 0x16u);
  }
LABEL_10:
  id v29 = objc_alloc_init(MEMORY[0x263F49250]);
  v10[2](v10, v29);
}

- (void)sharedUserDataModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(HMDUserDataController *)self userListeningHistoryUpdateControlModelUUID];
  uint64_t v13 = [v8 userListeningHistoryUpdateControlModelUUID];
  char v14 = [v12 isEqual:v13];

  if (v14)
  {
    uint64_t v15 = (void *)MEMORY[0x230FBD990]();
    uint64_t v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v47 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@User Shared model changed, but no diff in ULH uuid", buf, 0xCu);
    }
  }
  else
  {
    id v44 = v9;
    v43 = [(HMDUserDataController *)self delegate];
    v19 = [v43 sharedZoneControllerForUserDataController:self];
    __int16 v20 = (void *)MEMORY[0x230FBD990]();
    uint64_t v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = HMFGetLogIdentifier();
      v24 = [(HMDUserDataController *)v21 userListeningHistoryUpdateControlModelUUID];
      __int16 v25 = [v8 userListeningHistoryUpdateControlModelUUID];
      *(_DWORD *)buf = 138543874;
      v47 = v23;
      __int16 v48 = 2112;
      id v49 = v24;
      __int16 v50 = 2112;
      v51 = v25;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Registering and Loading user listening history update since the UUID flipped from =%@, to =%@", buf, 0x20u);
    }
    uint64_t v26 = [v8 userListeningHistoryUpdateControlModelUUID];
    [(HMDUserDataController *)v21 setUserListeningHistoryUpdateControlModelUUID:v26];

    uint64_t v27 = [(HMDUserDataController *)v21 userListeningHistoryUpdateControlModelUUID];
    id v45 = 0;
    v28 = [v19 loadUserListeningHistoryUpdateControlModelWithModelID:v27 error:&v45];
    id v29 = v45;

    int v30 = [(HMDUserDataController *)v21 userListeningHistoryUpdateControlModelUUID];
    [v19 registerForUserListeningHistoryUpdateControlModelUpdates:v21 modelID:v30];

    v31 = (void *)MEMORY[0x230FBD990]();
    v32 = v21;
    v33 = HMFGetOSLogHandle();
    v34 = v33;
    if (v28)
    {
      id v35 = v10;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v36 = HMFGetLogIdentifier();
        v37 = [v28 accessories];
        *(_DWORD *)buf = 138543618;
        v47 = v36;
        __int16 v48 = 2112;
        id v49 = v37;
        _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@Loaded user listening history update accessories %@", buf, 0x16u);
      }
      __int16 v38 = (void *)MEMORY[0x263EFF9C0];
      id v39 = [v28 accessories];
      __int16 v40 = [v38 setWithArray:v39];
      [(HMDUserDataController *)v32 setUserListeningHistoryUpdateControlModelAccessories:v40];

      v41 = v43;
      [v43 userDataControllerDidUpdateUserListeningHistoryUpdateControl:v32];
      id v10 = v35;
    }
    else
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v42 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v47 = v42;
        __int16 v48 = 2112;
        id v49 = v29;
        _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to load update listening history accessories %@", buf, 0x16u);
      }
      v41 = v43;
    }

    id v9 = v44;
  }
}

- (id)updateListeningHistoryModelToReset
{
  v3 = [(HMDUserDataController *)self userListeningHistoryUpdateControlModelUUID];

  if (v3)
  {
    id v4 = [HMDUserListeningHistoryUpdateControlModel alloc];
    int64_t v5 = [(HMDUserDataController *)self userListeningHistoryUpdateControlModelUUID];
    id v6 = [(HMDUserDataController *)self userUUID];
    v7 = [(HMBModel *)v4 initWithModelID:v5 parentModelID:v6];

    [(HMDUserListeningHistoryUpdateControlModel *)v7 setAccessories:MEMORY[0x263EFFA68]];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (HMBModel)assistantAccessControlModelToReset
{
  v3 = [(HMDUserDataController *)self assistantAccessControlModelUUID];

  if (v3)
  {
    id v4 = [HMDAssistantAccessControlModelV2 alloc];
    int64_t v5 = [(HMDUserDataController *)self assistantAccessControlModelUUID];
    id v6 = [(HMDUserDataController *)self userUUID];
    v7 = [(HMBModel *)v4 initWithModelID:v5 parentModelID:v6];

    uint64_t v8 = MEMORY[0x263EFFA68];
    [(HMDAssistantAccessControlModelV2 *)v7 setAccessoryUUIDs:MEMORY[0x263EFFA68]];
    [(HMDAssistantAccessControlModelV2 *)v7 setSiriEndpointAccessoryUUIDs:v8];
  }
  else
  {
    v7 = 0;
  }
  return (HMBModel *)v7;
}

- (void)enableUserListeningHistoryForAccessory:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = [(HMDUserDataController *)self userListeningHistoryUpdateControlModelAccessories];
  if ([v5 containsObject:v4])
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@ULH for accessory %@ is already enabled", buf, 0x16u);
    }
  }
  else
  {
    [v5 addObject:v4];
    id v10 = (void *)MEMORY[0x263EFF8C0];
    v11 = [v5 allObjects];
    id v12 = objc_msgSend(v10, "arrayWithObjects:", v11, 0);

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __64__HMDUserDataController_enableUserListeningHistoryForAccessory___block_invoke;
    v13[3] = &unk_264A2F370;
    v13[4] = self;
    id v14 = v4;
    [(HMDUserDataController *)self handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:v12 completion:v13];
  }
}

void __64__HMDUserDataController_enableUserListeningHistoryForAccessory___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543874;
      id v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Enabling ULH for accessory %@ failed with %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void *))_Block_copy(a4);
  if (v5)
  {
    id v4 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    v5[2](v5, v4);
  }
}

- (void)handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void *))_Block_copy(a4);
  if (v5)
  {
    id v4 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    v5[2](v5, v4);
  }
}

- (void)handleAssistantAccessControlAccessoryUUIDsUpdated:(id)a3 requireAuthenticationForSecureRequests:(BOOL)a4 activityNotificationsEnabledForPersonalRequests:(BOOL)a5 completion:(id)a6
{
  v7 = (void (**)(id, void *))_Block_copy(a6);
  if (v7)
  {
    id v6 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    v7[2](v7, v6);
  }
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
  uint64_t v18 = *MEMORY[0x263EF8340];
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

    id v8 = (void *)MEMORY[0x230FBD990]();
    int v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = HMFGetLogIdentifier();
      uint64_t v12 = [(HMDUserDataController *)v9 privateZoneFirstLoadTimer];
      int v14 = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      __int16 v17 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Starting timer to perform first run operations on shared zone. %@", (uint8_t *)&v14, 0x16u);
    }
    __int16 v13 = [(HMDUserDataController *)v9 privateZoneFirstLoadTimer];
    [v13 resume];
  }
}

- (void)performFirstRunOperationsOnPrivateZoneController:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    __int16 v11 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@HMDUserDataController: Code disabled as we are running in HH2", (uint8_t *)&v10, 0xCu);
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
  uint64_t v18 = *MEMORY[0x263EF8340];
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

    id v8 = (void *)MEMORY[0x230FBD990]();
    int v9 = self;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = HMFGetLogIdentifier();
      uint64_t v12 = [(HMDUserDataController *)v9 sharedZoneFirstLoadTimer];
      int v14 = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      __int16 v17 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Starting timer to perform first run operations on shared zone. %@", (uint8_t *)&v14, 0x16u);
    }
    __int16 v13 = [(HMDUserDataController *)v9 sharedZoneFirstLoadTimer];
    [v13 resume];
  }
}

- (void)performFirstRunOperationsOnSharedZoneController:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    int v10 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@In HH2: Not running performFirstRunOperationsOnSharedZoneController", (uint8_t *)&v9, 0xCu);
  }
}

- (void)initializePrivateZoneController:(id)a3 userDataModel:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [v5 settingsRootUUID];

  [(HMDUserDataController *)self setPrivateSettingsRootUUID:v7];
}

- (void)initializeSharedZoneController:(id)a3 userDataModel:(id)a4
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v8);

  int v9 = [v7 assistantAccessControlModelUUID];
  [(HMDUserDataController *)self setAssistantAccessControlModelUUID:v9];

  int v10 = [v7 mediaContentProfileAccessControlModelUUID];
  [(HMDUserDataController *)self setMediaContentProfileAccessControlModelUUID:v10];

  uint64_t v11 = [(HMDUserDataController *)self userUUID];
  [v6 registerForSharedUserDataModelUpdates:self modelID:v11];

  uint64_t v12 = [v7 userListeningHistoryUpdateControlModelUUID];
  [(HMDUserDataController *)self setUserListeningHistoryUpdateControlModelUUID:v12];

  __int16 v13 = [v7 settingsRootUUID];
  [(HMDUserDataController *)self setSharedSettingsRootUUID:v13];

  int v14 = [(HMDUserDataController *)self assistantAccessControlModelUUID];
  [v6 registerForAssistantAccessControlModelUpdates:self modelID:v14];

  uint64_t v15 = [(HMDUserDataController *)self mediaContentProfileAccessControlModelUUID];
  [v6 registerForMediaContentAccessControlModelUpdates:self modelID:v15];

  __int16 v16 = [(HMDUserDataController *)self userListeningHistoryUpdateControlModelUUID];
  [v6 registerForUserListeningHistoryUpdateControlModelUpdates:self modelID:v16];

  __int16 v17 = (void *)MEMORY[0x230FBD990]();
  uint64_t v18 = self;
  uint64_t v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    __int16 v20 = HMFGetLogIdentifier();
    uint64_t v21 = [(HMDUserDataController *)v18 assistantAccessControlModelUUID];
    *(_DWORD *)buf = 138543618;
    v83 = v20;
    __int16 v84 = 2112;
    id v85 = v21;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Loading assistant access control model %@", buf, 0x16u);
  }
  id v22 = [(HMDUserDataController *)v18 assistantAccessControlModelUUID];
  id v81 = 0;
  id v23 = [v6 loadAssistantAccessControlModelWithModelID:v22 error:&v81];
  id v24 = v81;

  __int16 v25 = (void *)MEMORY[0x230FBD990]();
  uint64_t v26 = v18;
  uint64_t v27 = HMFGetOSLogHandle();
  v28 = v27;
  unint64_t v29 = 0x263EFF000;
  if (v23)
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      int v30 = HMFGetLogIdentifier();
      [v23 requiresAuthenticationForSecureRequests];
      id v78 = v6;
      id v31 = v24;
      v33 = id v32 = v7;
      v34 = [v23 activityNotificationsEnabledForPersonalRequests];
      id v35 = [v23 accessoryUUIDs];
      *(_DWORD *)buf = 138544130;
      v83 = v30;
      __int16 v84 = 2112;
      id v85 = v33;
      __int16 v86 = 2112;
      v87 = v34;
      __int16 v88 = 2112;
      v89 = v35;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Loaded assistant access control requires auth: %@, activity notifications enabled for personal requests: %@, accessories: %@", buf, 0x2Au);

      unint64_t v29 = 0x263EFF000uLL;
      id v7 = v32;
      id v24 = v31;
      id v6 = v78;
    }
    v36 = [*(id *)(v29 + 2496) set];
    v37 = [v23 accessoryUUIDs];
    objc_msgSend(v36, "na_safeAddObjectsFromArray:", v37);

    __int16 v38 = [v23 siriEndpointAccessoryUUIDs];
    objc_msgSend(v36, "na_safeAddObjectsFromArray:", v38);

    [(HMDUserDataController *)v26 setAssistantAccessControlAccessoryUUIDs:v36];
    id v39 = [v23 requiresAuthenticationForSecureRequests];
    -[HMDUserDataController setAssistantAccessControlRequiresAuthenticationForSecureRequests:](v26, "setAssistantAccessControlRequiresAuthenticationForSecureRequests:", [v39 BOOLValue]);

    if ([v23 hmbPropertyWasSet:@"activityNotificationsEnabledForPersonalRequests"])
    {
      __int16 v40 = [v23 activityNotificationsEnabledForPersonalRequests];
      -[HMDUserDataController setAssistantAccessControlActivityNotificationsEnabledForPersonalRequests:](v26, "setAssistantAccessControlActivityNotificationsEnabledForPersonalRequests:", [v40 BOOLValue]);
    }
    else
    {
      [(HMDUserDataController *)v26 setAssistantAccessControlActivityNotificationsEnabledForPersonalRequests:1];
    }
  }
  else
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v83 = v41;
      __int16 v84 = 2112;
      id v85 = v24;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unable to load assistant access control %@", buf, 0x16u);
    }
  }

  uint64_t v42 = (void *)MEMORY[0x230FBD990]();
  v43 = v26;
  id v44 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    id v45 = HMFGetLogIdentifier();
    v46 = [(HMDUserDataController *)v43 mediaContentProfileAccessControlModelUUID];
    *(_DWORD *)buf = 138543618;
    v83 = v45;
    __int16 v84 = 2112;
    id v85 = v46;
    _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_INFO, "%{public}@Loading media content profile access control model %@", buf, 0x16u);
  }
  v47 = [(HMDUserDataController *)v43 mediaContentProfileAccessControlModelUUID];
  id v80 = 0;
  __int16 v48 = [v6 loadMediaContentAccessControlModelWithModelID:v47 error:&v80];
  id v49 = v80;

  __int16 v50 = (void *)MEMORY[0x230FBD990]();
  v51 = v43;
  uint64_t v52 = HMFGetOSLogHandle();
  v53 = v52;
  if (v48)
  {
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      v54 = HMFGetLogIdentifier();
      v55 = [v48 accessories];
      *(_DWORD *)buf = 138543618;
      v83 = v54;
      __int16 v84 = 2112;
      id v85 = v55;
      _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_INFO, "%{public}@Loaded media content profile access control accessories %@", buf, 0x16u);
    }
    v56 = *(void **)(v29 + 2496);
    v57 = [v48 accessories];
    v58 = [v56 setWithArray:v57];
    [(HMDUserDataController *)v51 setMediaContentProfileAccessControlAccessories:v58];
  }
  else
  {
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v59 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v83 = v59;
      __int16 v84 = 2112;
      id v85 = v49;
      _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_ERROR, "%{public}@Unable to load media content profile accessories %@", buf, 0x16u);
    }
  }

  v60 = (void *)MEMORY[0x230FBD990]();
  v61 = v51;
  v62 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
  {
    v63 = HMFGetLogIdentifier();
    v64 = [(HMDUserDataController *)v61 userListeningHistoryUpdateControlModelUUID];
    *(_DWORD *)buf = 138543618;
    v83 = v63;
    __int16 v84 = 2112;
    id v85 = v64;
    _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_INFO, "%{public}@Loading user listening history update model %@", buf, 0x16u);
  }
  v65 = [(HMDUserDataController *)v61 userListeningHistoryUpdateControlModelUUID];
  id v79 = 0;
  v66 = [v6 loadUserListeningHistoryUpdateControlModelWithModelID:v65 error:&v79];
  id v67 = v79;

  v68 = (void *)MEMORY[0x230FBD990]();
  v69 = v61;
  v70 = HMFGetOSLogHandle();
  v71 = v70;
  if (v66)
  {
    if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
    {
      v72 = HMFGetLogIdentifier();
      v73 = [v66 accessories];
      *(_DWORD *)buf = 138543618;
      v83 = v72;
      __int16 v84 = 2112;
      id v85 = v73;
      _os_log_impl(&dword_22F52A000, v71, OS_LOG_TYPE_INFO, "%{public}@Loaded user listening history update accessories %@", buf, 0x16u);
    }
    v74 = *(void **)(v29 + 2496);
    v75 = [v66 accessories];
    v76 = [v74 setWithArray:v75];
    [(HMDUserDataController *)v69 setUserListeningHistoryUpdateControlModelAccessories:v76];
  }
  else
  {
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      v77 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v83 = v77;
      __int16 v84 = 2112;
      id v85 = v67;
      _os_log_impl(&dword_22F52A000, v71, OS_LOG_TYPE_ERROR, "%{public}@Unable to load update listening history accessories %@", buf, 0x16u);
    }
  }
}

- (void)eventDidInitializeSharedZone
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  self->_isModifyingState = 1;
  switch([(HMDUserDataController *)self state])
  {
    case 0uLL:
      int v9 = (void *)MEMORY[0x230FBD990]();
      int v10 = self;
      uint64_t v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        int v19 = 138543362;
        __int16 v20 = v12;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Moving to pending private on initializing shared zone", (uint8_t *)&v19, 0xCu);
      }
      __int16 v13 = v10;
      uint64_t v14 = 3;
      goto LABEL_11;
    case 1uLL:
    case 3uLL:
      id v4 = (void *)MEMORY[0x230FBD990]();
      id v5 = self;
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = HMFGetLogIdentifier();
        id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserDataController state](v5, "state"));
        int v19 = 138543618;
        __int16 v20 = v7;
        __int16 v21 = 2112;
        id v22 = v8;
        _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unexpected from state on init shared zone event %@", (uint8_t *)&v19, 0x16u);
      }
      break;
    case 2uLL:
      uint64_t v15 = (void *)MEMORY[0x230FBD990]();
      __int16 v16 = self;
      __int16 v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        int v19 = 138543362;
        __int16 v20 = v18;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Moving to initialized on initializing shared zone", (uint8_t *)&v19, 0xCu);
      }
      __int16 v13 = v16;
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
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  self->_isModifyingState = 1;
  unint64_t v4 = [(HMDUserDataController *)self state];
  if (v4 - 1 < 2)
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    uint64_t v12 = self;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserDataController state](v12, "state"));
      int v20 = 138543618;
      __int16 v21 = v14;
      __int16 v22 = 2112;
      uint64_t v23 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpected from state on init private zone event %@", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    if (v4 == 3)
    {
      __int16 v16 = (void *)MEMORY[0x230FBD990]();
      __int16 v17 = self;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v19 = HMFGetLogIdentifier();
        int v20 = 138543362;
        __int16 v21 = v19;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Moving to initialized on initializing private zone", (uint8_t *)&v20, 0xCu);
      }
      int v9 = v17;
      uint64_t v10 = 1;
      goto LABEL_13;
    }
    if (!v4)
    {
      id v5 = (void *)MEMORY[0x230FBD990]();
      id v6 = self;
      id v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = HMFGetLogIdentifier();
        int v20 = 138543362;
        __int16 v21 = v8;
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Moving to pending shared on initializing private zone", (uint8_t *)&v20, 0xCu);
      }
      int v9 = v6;
      uint64_t v10 = 2;
LABEL_13:
      [(HMDUserDataController *)v9 setState:v10];
    }
  }
  self->_isModifyingState = 0;
}

- (void)setState:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = [(HMDUserDataController *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = os_unfair_lock_lock_with_options();
  if (self->_state == a3)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990](v6);
    id v8 = self;
    HMFGetOSLogHandle();
    int v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      HMDUserDataControllerStateAsString(self->_state);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = HMDUserDataControllerStateAsString(a3);
      int v14 = 138543874;
      id v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      __int16 v18 = 2112;
      int v19 = v12;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Moving state from %@ to %@", (uint8_t *)&v14, 0x20u);
    }
    self->_state = a3;
    os_unfair_lock_unlock(&self->_lock);
    if (a3 == 1)
    {
      __int16 v13 = [(HMDUserDataController *)v8 notificationCenter];
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

- (NSArray)userListeningHistoryUpdateControlModelAccessoriesToEncode
{
  v2 = [(HMDUserDataController *)self userListeningHistoryUpdateControlModelAccessories];
  id v3 = [v2 allObjects];
  unint64_t v4 = (void *)[v3 copy];

  return (NSArray *)v4;
}

- (NSArray)mediaContentProfileAccessControlAccessoriesToEncode
{
  v2 = [(HMDUserDataController *)self mediaContentProfileAccessControlAccessories];
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
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__HMDUserDataController_configure__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __34__HMDUserDataController_configure__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  v2 = [v4 sharedZoneControllerForUserDataController:*(void *)(a1 + 32)];
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
  __int16 v25 = [(HMDUserDataController *)self initWithDelegate:v23 dataSource:v22 queue:v21 userID:v20 homeID:v19 sharedSettingsController:v18 privateSettingsController:v17 timerCreator:v24 isCurrentUser:v27];

  return v25;
}

- (HMDUserDataController)initWithDelegate:(id)a3 dataSource:(id)a4 queue:(id)a5 userID:(id)a6 homeID:(id)a7 sharedSettingsController:(id)a8 privateSettingsController:(id)a9 timerCreator:(id)a10 isCurrentUser:(BOOL)a11
{
  id v16 = a3;
  id v17 = a4;
  id v31 = a5;
  id v30 = a6;
  id v18 = a7;
  id v19 = a9;
  id v20 = a10;
  v32.receiver = self;
  v32.super_class = (Class)HMDUserDataController;
  id v21 = [(HMDUserDataController *)&v32 init];
  id v22 = v21;
  if (v21)
  {
    v21->_unint64_t state = 2 * (v19 == 0);
    v21->_isModifyingState = 0;
    objc_storeStrong((id *)&v21->_clientQueue, a5);
    objc_storeWeak((id *)&v22->_delegate, v16);
    objc_storeStrong((id *)&v22->_timerCreator, a10);
    uint64_t v23 = [MEMORY[0x263EFF9C0] set];
    assistantAccessControlAccessoryUUIDs = v22->_assistantAccessControlAccessoryUUIDs;
    v22->_assistantAccessControlAccessoryUUIDs = (NSMutableSet *)v23;

    *(_WORD *)&v22->_assistantAccessControlRequiresAuthenticationForSecureRequests = 256;
    uint64_t v25 = [MEMORY[0x263EFF9C0] set];
    mediaContentProfileAccessControlAccessories = v22->_mediaContentProfileAccessControlAccessories;
    v22->_mediaContentProfileAccessControlAccessories = (NSMutableSet *)v25;

    objc_storeStrong((id *)&v22->_userUUID, a6);
    objc_storeStrong((id *)&v22->_homeUUID, a7);
    objc_storeWeak((id *)&v22->_dataSource, v17);
    uint64_t v27 = [MEMORY[0x263F08A00] defaultCenter];
    notificationCenter = v22->_notificationCenter;
    v22->_notificationCenter = (NSNotificationCenter *)v27;

    v22->_isCurrentUser = a11;
  }

  return v22;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t41_204061 != -1) {
    dispatch_once(&logCategory__hmf_once_t41_204061, &__block_literal_global_204062);
  }
  v2 = (void *)logCategory__hmf_once_v42_204063;
  return v2;
}

void __36__HMDUserDataController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v42_204063;
  logCategory__hmf_once_v42_204063 = v0;
}

@end