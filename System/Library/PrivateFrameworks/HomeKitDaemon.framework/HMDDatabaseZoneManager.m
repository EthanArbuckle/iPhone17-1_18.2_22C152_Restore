@interface HMDDatabaseZoneManager
+ (id)logCategory;
- (BOOL)_fetchExistingPrivateZonesWithConfiguration:(id)a3;
- (BOOL)_fetchPrivateZonesWithConfiguration:(id)a3;
- (BOOL)_fetchSharedZonesWithConfiguration:(id)a3;
- (BOOL)_handleFetchZonesResult:(id)a3 configuration:(id)a4;
- (BOOL)start;
- (BOOL)startWithConfiguration:(id)a3;
- (HMBCloudZone)cloudZone;
- (HMBLocalZone)localZone;
- (HMDCloudShareMessenger)shareMessenger;
- (HMDCloudShareParticipantsManager)participantsManager;
- (HMDDatabase)database;
- (HMDDatabaseZoneManager)initWithDatabase:(id)a3 zoneName:(id)a4 home:(id)a5 messageTargetUUID:(id)a6 workQueue:(id)a7;
- (HMDDatabaseZoneManager)initWithDatabase:(id)a3 zoneName:(id)a4 home:(id)a5 shareMessenger:(id)a6 workQueue:(id)a7;
- (HMDDatabaseZoneManagerConfiguration)defaultConfiguration;
- (HMDDatabaseZoneManagerDataSource)dataSource;
- (HMDDatabaseZoneManagerDelegate)delegate;
- (HMDHome)home;
- (NSString)containerIdentifier;
- (NSString)zoneName;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)workQueue;
- (id)participantsManagerFactory;
- (id)remove;
- (int64_t)state;
- (void)_requestShareInvitationWithConfiguration:(id)a3;
- (void)_sendShareInvitation:(id)a3 toUser:(id)a4 device:(id)a5;
- (void)_tearDownState;
- (void)configure;
- (void)database:(id)a3 didCreateZoneWithName:(id)a4 isPrivate:(BOOL)a5;
- (void)database:(id)a3 didReceiveMessageWithUserInfo:(id)a4;
- (void)database:(id)a3 didRemoveZoneWithName:(id)a4 isPrivate:(BOOL)a5;
- (void)manager:(id)a3 didRequestSendForInvitation:(id)a4 toDevice:(id)a5;
- (void)manager:(id)a3 didRequestSendForInvitation:(id)a4 toUser:(id)a5;
- (void)manager:(id)a3 didRevokeShareAccessForUser:(id)a4;
- (void)messenger:(id)a3 didReceiveInvitationData:(id)a4 completion:(id)a5;
- (void)messenger:(id)a3 didReceiveInvitationRequestFromUser:(id)a4 device:(id)a5;
- (void)messengerDidReceiveShareAccessRevocation:(id)a3;
- (void)setCloudZone:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDefaultConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocalZone:(id)a3;
- (void)setParticipantsManager:(id)a3;
- (void)setParticipantsManagerFactory:(id)a3;
- (void)setState:(int64_t)a3;
- (void)updateShareParticipants;
@end

@implementation HMDDatabaseZoneManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_participantsManagerFactory, 0);
  objc_storeStrong((id *)&self->_participantsManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_shareMessenger, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_defaultConfiguration, 0);
  objc_storeStrong((id *)&self->_cloudZone, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)setParticipantsManagerFactory:(id)a3
{
}

- (id)participantsManagerFactory
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setParticipantsManager:(id)a3
{
}

- (HMDCloudShareParticipantsManager)participantsManager
{
  return (HMDCloudShareParticipantsManager *)objc_getProperty(self, a2, 96, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (HMDCloudShareMessenger)shareMessenger
{
  return (HMDCloudShareMessenger *)objc_getProperty(self, a2, 80, 1);
}

- (HMDDatabase)database
{
  return (HMDDatabase *)objc_getProperty(self, a2, 72, 1);
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setDefaultConfiguration:(id)a3
{
}

- (HMDDatabaseZoneManagerConfiguration)defaultConfiguration
{
  return (HMDDatabaseZoneManagerConfiguration *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCloudZone:(id)a3
{
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLocalZone:(id)a3
{
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 40, 1);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (NSString)zoneName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDDatabaseZoneManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDDatabaseZoneManagerDelegate *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (HMDDatabaseZoneManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDDatabaseZoneManagerDataSource *)WeakRetained;
}

- (void)database:(id)a3 didReceiveMessageWithUserInfo:(id)a4
{
  id v5 = a4;
  v6 = [(HMDDatabaseZoneManager *)self workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__HMDDatabaseZoneManager_database_didReceiveMessageWithUserInfo___block_invoke;
  v8[3] = &unk_264A2F820;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __65__HMDDatabaseZoneManager_database_didReceiveMessageWithUserInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 zoneManager:*(void *)(a1 + 32) didReceiveMessageWithUserInfo:*(void *)(a1 + 40)];
  }
}

- (void)database:(id)a3 didRemoveZoneWithName:(id)a4 isPrivate:(BOOL)a5
{
  int v5 = a5;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [(HMDDatabaseZoneManager *)self zoneName];
  if ([v9 isEqualToString:v10])
  {
    v11 = [(HMDDatabaseZoneManager *)self defaultConfiguration];
    int v12 = [v11 isZoneOwner];

    if (v12 == v5)
    {
      v13 = (void *)MEMORY[0x230FBD990]();
      v14 = self;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v20 = v16;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Handling zone removal by tearing down state", buf, 0xCu);
      }
      v17 = [(HMDDatabaseZoneManager *)v14 workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __67__HMDDatabaseZoneManager_database_didRemoveZoneWithName_isPrivate___block_invoke;
      block[3] = &unk_264A2F7F8;
      block[4] = v14;
      dispatch_async(v17, block);
    }
  }
  else
  {
  }
}

uint64_t __67__HMDDatabaseZoneManager_database_didRemoveZoneWithName_isPrivate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tearDownState];
}

- (void)database:(id)a3 didCreateZoneWithName:(id)a4 isPrivate:(BOOL)a5
{
  int v5 = a5;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [(HMDDatabaseZoneManager *)self zoneName];
  if ([v9 isEqualToString:v10])
  {
    v11 = [(HMDDatabaseZoneManager *)self defaultConfiguration];
    int v12 = [v11 isZoneOwner];

    if (v12 == v5)
    {
      v13 = (void *)MEMORY[0x230FBD990]();
      v14 = self;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v20 = v16;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Handling zone creation by starting", buf, 0xCu);
      }
      v17 = [(HMDDatabaseZoneManager *)v14 workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __67__HMDDatabaseZoneManager_database_didCreateZoneWithName_isPrivate___block_invoke;
      block[3] = &unk_264A2F7F8;
      block[4] = v14;
      dispatch_async(v17, block);
    }
  }
  else
  {
  }
}

uint64_t __67__HMDDatabaseZoneManager_database_didCreateZoneWithName_isPrivate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) start];
}

- (void)manager:(id)a3 didRevokeShareAccessForUser:(id)a4
{
  id v5 = a4;
  v6 = [(HMDDatabaseZoneManager *)self workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(HMDDatabaseZoneManager *)self shareMessenger];
  [v7 notifyOfShareAccessRevocationForUser:v5];
}

- (void)manager:(id)a3 didRequestSendForInvitation:(id)a4 toDevice:(id)a5
{
  id v7 = a5;
  id v9 = a4;
  id v8 = [(HMDDatabaseZoneManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  [(HMDDatabaseZoneManager *)self _sendShareInvitation:v9 toUser:0 device:v7];
}

- (void)manager:(id)a3 didRequestSendForInvitation:(id)a4 toUser:(id)a5
{
  id v7 = a5;
  id v9 = a4;
  id v8 = [(HMDDatabaseZoneManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  [(HMDDatabaseZoneManager *)self _sendShareInvitation:v9 toUser:v7 device:0];
}

- (void)messengerDidReceiveShareAccessRevocation:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDDatabaseZoneManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v12 = 138543362;
    v13 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Synchronizing shared zones due to share revocation", (uint8_t *)&v12, 0xCu);
  }
  v10 = [(HMDDatabaseZoneManager *)v7 database];
  id v11 = (id)[v10 synchronizeSharedZones];
}

- (void)messenger:(id)a3 didReceiveInvitationRequestFromUser:(id)a4 device:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(HMDDatabaseZoneManager *)self workQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(HMDDatabaseZoneManager *)self participantsManager];
  [v10 inviteUser:v8 usingDevice:v7];
}

- (void)messenger:(id)a3 didReceiveInvitationData:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDDatabaseZoneManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  int v12 = (void *)MEMORY[0x263F08928];
  v13 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  id v30 = 0;
  uint64_t v14 = [v12 _strictlyUnarchivedObjectOfClasses:v13 fromData:v9 error:&v30];
  id v15 = v30;

  if (v14)
  {
    v16 = [(HMDDatabaseZoneManager *)self database];
    v17 = [v16 acceptInvitation:v14];

    v18 = (void *)MEMORY[0x263F581B8];
    v19 = [(HMDDatabaseZoneManager *)self workQueue];
    v20 = [v18 schedulerWithDispatchQueue:v19];
    uint64_t v21 = [v17 reschedule:v20];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __72__HMDDatabaseZoneManager_messenger_didReceiveInvitationData_completion___block_invoke;
    v27[3] = &unk_264A1E018;
    v27[4] = self;
    id v28 = v15;
    id v29 = v10;
    id v22 = (id)[v21 addCompletionBlock:v27];
  }
  else
  {
    v23 = (void *)MEMORY[0x230FBD990]();
    v24 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v32 = v26;
      __int16 v33 = 2112;
      id v34 = v9;
      __int16 v35 = 2112;
      id v36 = v15;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive share invitation from invitation data: %@: %@", buf, 0x20u);
    }
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v15);
  }
}

void __72__HMDDatabaseZoneManager_messenger_didReceiveInvitationData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v16 = 138543618;
      v17 = v11;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully accepted invitation and created shared zone with ID %@", (uint8_t *)&v16, 0x16u);
    }
    [*(id *)(a1 + 32) start];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = HMFGetLogIdentifier();
      v13 = *(void **)(a1 + 40);
      int v16 = 138543618;
      v17 = v12;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to accept received invitation: %@", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);
  }
}

- (void)_tearDownState
{
  v3 = [(HMDDatabaseZoneManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDDatabaseZoneManager *)self state])
  {
    [(HMDDatabaseZoneManager *)self setCloudZone:0];
    [(HMDDatabaseZoneManager *)self setLocalZone:0];
    [(HMDDatabaseZoneManager *)self setParticipantsManager:0];
    [(HMDDatabaseZoneManager *)self setState:0];
    id v4 = [(HMDDatabaseZoneManager *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v4 zoneManagerDidStop:self];
    }
  }
}

- (void)_requestShareInvitationWithConfiguration:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDDatabaseZoneManager *)self dataSource];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([(HMDDatabaseZoneManager *)self participantsManager],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 areShareModificationsEnabledForManager:v6],
        v6,
        v7))
  {
    if ([v4 shouldCreateZone])
    {
      id v18 = v4;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = [(HMDDatabaseZoneManager *)self home];
      id v9 = [v8 users];

      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if (([v14 isCurrentUser] & 1) == 0
              && (objc_opt_respondsToSelector() & 1) != 0
              && [v5 zoneManager:self shouldRequestShareInvitationFromUser:v14])
            {
              id v15 = [(HMDDatabaseZoneManager *)self shareMessenger];
              [v15 requestShareInvitationDataFromUser:v14];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v11);
      }

      int v16 = [(HMDDatabaseZoneManager *)self database];
      id v17 = (id)[v16 synchronizeSharedZones];

      id v4 = v18;
    }
  }
}

- (void)_sendShareInvitation:(id)a3 toUser:(id)a4 device:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  unint64_t v9 = (unint64_t)a4;
  unint64_t v10 = (unint64_t)a5;
  uint64_t v11 = [(HMDDatabaseZoneManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v29 = 0;
  uint64_t v12 = [MEMORY[0x263F08910] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v29];
  id v13 = v29;
  if (v12)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__HMDDatabaseZoneManager__sendShareInvitation_toUser_device___block_invoke;
    aBlock[3] = &unk_264A2ED68;
    aBlock[4] = self;
    uint64_t v14 = _Block_copy(aBlock);
    if (!(v9 | v10)) {
      _HMFPreconditionFailure();
    }
    id v15 = v14;
    if (v9)
    {
      int v16 = [(HMDDatabaseZoneManager *)self shareMessenger];
      v27 = [(HMDDatabaseZoneManager *)self defaultConfiguration];
      id v17 = [v27 minimumHomeKitVersion];
      id v18 = [(HMDDatabaseZoneManager *)self defaultConfiguration];
      [v18 requiredSupportedFeatures];
      unint64_t v19 = v10;
      id v20 = v8;
      v22 = id v21 = v13;
      [v16 sendShareInvitationData:v12 toUser:v9 minimumHomeKitVersion:v17 requiredSupportedFeatures:v22 completion:v15];

      id v13 = v21;
      id v8 = v20;
      unint64_t v10 = v19;
    }
    else
    {
      if (!v10)
      {
LABEL_11:

        goto LABEL_12;
      }
      int v16 = [(HMDDatabaseZoneManager *)self shareMessenger];
      [v16 sendShareInvitationData:v12 toDevice:v10 completion:v15];
    }

    goto LABEL_11;
  }
  v23 = (void *)MEMORY[0x230FBD990]();
  uint64_t v24 = self;
  v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v31 = v26;
    __int16 v32 = 2112;
    id v33 = v8;
    __int16 v34 = 2112;
    id v35 = v13;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize invitation %@: %@", buf, 0x20u);
  }
LABEL_12:
}

void __61__HMDDatabaseZoneManager__sendShareInvitation_toUser_device___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  unint64_t v9 = v8;
  if (a2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unint64_t v10 = HMFGetLogIdentifier();
      int v15 = 138543362;
      int v16 = v10;
      uint64_t v11 = "%{public}@Zone invitation was successfully accepted";
      uint64_t v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_INFO;
      uint32_t v14 = 12;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v12, v13, v11, (uint8_t *)&v15, v14);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    unint64_t v10 = HMFGetLogIdentifier();
    int v15 = 138543618;
    int v16 = v10;
    __int16 v17 = 2112;
    id v18 = v5;
    uint64_t v11 = "%{public}@Zone invitation was not accepted: %@";
    uint64_t v12 = v9;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    uint32_t v14 = 22;
    goto LABEL_6;
  }
}

- (BOOL)_handleFetchZonesResult:(id)a3 configuration:(id)a4
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  unint64_t v9 = self;
  unint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = [(HMDDatabaseZoneManager *)v9 zoneName];
    *(_DWORD *)buf = 138543618;
    v69 = v11;
    __int16 v70 = 2112;
    v71 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetched zones with name %@", buf, 0x16u);
  }
  os_log_type_t v13 = [v6 localZone];
  [(HMDDatabaseZoneManager *)v9 setLocalZone:v13];

  uint32_t v14 = [v6 cloudZone];
  [(HMDDatabaseZoneManager *)v9 setCloudZone:v14];

  if ([v7 isZoneOwner])
  {
    int v15 = [v7 externalRecordTypesForSubscriptions];

    int v16 = [(HMDDatabaseZoneManager *)v9 cloudZone];
    __int16 v17 = v16;
    if (v15)
    {
      id v57 = v6;
      id v18 = [v16 subscriptions];
      uint64_t v19 = objc_msgSend(v18, "na_map:", &__block_literal_global_9);

      v56 = v7;
      id v20 = [v7 externalRecordTypesForSubscriptions];
      v55 = v19;
      id v21 = objc_msgSend(v19, "hmf_removedObjectsFromSet:", v20);

      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v62 objects:v67 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v63;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v63 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v62 + 1) + 8 * i);
            id v28 = (void *)MEMORY[0x230FBD990]();
            id v29 = v9;
            id v30 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              v31 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v69 = v31;
              __int16 v70 = 2112;
              v71 = v27;
              _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing externalRecordType: %@", buf, 0x16u);
            }
            __int16 v32 = [(HMDDatabaseZoneManager *)v29 cloudZone];
            id v33 = (id)[v32 unregisterSubscriptionForExternalRecordType:v27];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v62 objects:v67 count:16];
        }
        while (v24);
      }

      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v7 = v56;
      __int16 v34 = [v56 externalRecordTypesForSubscriptions];
      uint64_t v35 = [v34 countByEnumeratingWithState:&v58 objects:v66 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v59;
        do
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v59 != v37) {
              objc_enumerationMutation(v34);
            }
            uint64_t v39 = *(void *)(*((void *)&v58 + 1) + 8 * j);
            v40 = [(HMDDatabaseZoneManager *)v9 cloudZone];
            id v41 = (id)[v40 registerSubscriptionForExternalRecordType:v39];
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v58 objects:v66 count:16];
        }
        while (v36);
      }

      __int16 v17 = v55;
      id v6 = v57;
    }
    else
    {
      id v42 = (id)[v16 registerSubscriptionForExternalRecordType:0];
    }

    v43 = [(HMDDatabaseZoneManager *)v9 participantsManagerFactory];
    v44 = [(HMDDatabaseZoneManager *)v9 workQueue];
    v45 = [(HMDDatabaseZoneManager *)v9 cloudZone];
    v46 = [(HMDDatabaseZoneManager *)v9 home];
    v47 = ((void (**)(void, void *, void *, void *))v43)[2](v43, v44, v45, v46);
    [(HMDDatabaseZoneManager *)v9 setParticipantsManager:v47];

    v48 = [(HMDDatabaseZoneManager *)v9 dataSource];
    v49 = [(HMDDatabaseZoneManager *)v9 participantsManager];
    [v49 setDataSource:v48];

    v50 = [(HMDDatabaseZoneManager *)v9 participantsManager];
    [v50 setDelegate:v9];

    v51 = [(HMDDatabaseZoneManager *)v9 participantsManager];
    [v51 configure];

    v52 = [(HMDDatabaseZoneManager *)v9 participantsManager];
    [v52 updateShareParticipants];
  }
  [(HMDDatabaseZoneManager *)v9 setState:2];
  v53 = [(HMDDatabaseZoneManager *)v9 delegate];
  if (objc_opt_respondsToSelector()) {
    [v53 zoneManagerDidStart:v9];
  }

  return 1;
}

uint64_t __64__HMDDatabaseZoneManager__handleFetchZonesResult_configuration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 recordType];
}

- (BOOL)_fetchSharedZonesWithConfiguration:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDDatabaseZoneManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v45 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Fetching shared zones", buf, 0xCu);
  }
  unint64_t v10 = [v4 externalRecordTypesForSubscriptions];

  if (v10)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v11 = [v4 externalRecordTypesForSubscriptions];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v41 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          __int16 v17 = [(HMDDatabaseZoneManager *)v7 database];
          id v18 = (id)[v17 registerSharedSubscriptionForExternalRecordType:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v13);
    }
  }
  else
  {
    uint64_t v11 = [(HMDDatabaseZoneManager *)v7 database];
    id v19 = (id)[v11 registerSharedSubscriptionForExternalRecordType:0];
  }

  id v20 = [(HMDDatabaseZoneManager *)v7 database];
  id v21 = [(HMDDatabaseZoneManager *)v7 zoneName];
  id v22 = [v20 existingSharedZoneIDWithName:v21];

  if (v22)
  {
    uint64_t v23 = [(HMDDatabaseZoneManager *)v7 database];
    uint64_t v24 = [v4 cloudZoneConfiguration];
    uint64_t v25 = [(HMDDatabaseZoneManager *)v7 delegate];
    id v39 = 0;
    v26 = [v23 sharedZonesWithID:v22 configuration:v24 delegate:v25 error:&v39];
    id v27 = v39;

    if (v26)
    {
      BOOL v28 = [(HMDDatabaseZoneManager *)v7 _handleFetchZonesResult:v26 configuration:v4];
    }
    else
    {
      __int16 v34 = (void *)MEMORY[0x230FBD990]();
      uint64_t v35 = v7;
      uint64_t v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v45 = v37;
        __int16 v46 = 2112;
        id v47 = v27;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch shared zones: %@", buf, 0x16u);
      }
      [(HMDDatabaseZoneManager *)v35 _tearDownState];
      BOOL v28 = 0;
    }
  }
  else
  {
    id v29 = (void *)MEMORY[0x230FBD990]();
    id v30 = v7;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      __int16 v32 = HMFGetLogIdentifier();
      id v33 = [(HMDDatabaseZoneManager *)v30 zoneName];
      *(_DWORD *)buf = 138543618;
      v45 = v32;
      __int16 v46 = 2112;
      id v47 = v33;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@No shared zone exists with zone name %@", buf, 0x16u);
    }
    [(HMDDatabaseZoneManager *)v30 _requestShareInvitationWithConfiguration:v4];
    [(HMDDatabaseZoneManager *)v30 _tearDownState];
    BOOL v28 = 0;
  }

  return v28;
}

- (BOOL)_fetchExistingPrivateZonesWithConfiguration:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDDatabaseZoneManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Fetching existing private zones", buf, 0xCu);
  }
  unint64_t v10 = [(HMDDatabaseZoneManager *)v7 database];
  uint64_t v11 = [(HMDDatabaseZoneManager *)v7 zoneName];
  uint64_t v12 = [v4 cloudZoneConfiguration];
  uint64_t v13 = [(HMDDatabaseZoneManager *)v7 delegate];
  id v22 = 0;
  uint64_t v14 = [v10 existingPrivateZonesWithName:v11 configuration:v12 delegate:v13 error:&v22];
  id v15 = v22;

  if (v14)
  {
    BOOL v16 = [(HMDDatabaseZoneManager *)v7 _handleFetchZonesResult:v14 configuration:v4];
  }
  else
  {
    __int16 v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = v7;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@No existing private zones exist", buf, 0xCu);
    }
    [(HMDDatabaseZoneManager *)v18 _tearDownState];
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)_fetchPrivateZonesWithConfiguration:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDDatabaseZoneManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Fetching private zones", buf, 0xCu);
  }
  unint64_t v10 = [(HMDDatabaseZoneManager *)v7 database];
  uint64_t v11 = [(HMDDatabaseZoneManager *)v7 zoneName];
  uint64_t v12 = [v4 cloudZoneConfiguration];
  uint64_t v13 = [(HMDDatabaseZoneManager *)v7 delegate];
  id v22 = 0;
  uint64_t v14 = [v10 privateZonesWithName:v11 configuration:v12 delegate:v13 error:&v22];
  id v15 = v22;

  if (v14)
  {
    BOOL v16 = [(HMDDatabaseZoneManager *)v7 _handleFetchZonesResult:v14 configuration:v4];
  }
  else
  {
    __int16 v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = v7;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v20;
      __int16 v25 = 2112;
      id v26 = v15;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch private zones: %@", buf, 0x16u);
    }
    [(HMDDatabaseZoneManager *)v18 _tearDownState];
    BOOL v16 = 0;
  }

  return v16;
}

- (void)updateShareParticipants
{
  v3 = [(HMDDatabaseZoneManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDDatabaseZoneManager *)self participantsManager];

  if (v4)
  {
    id v6 = [(HMDDatabaseZoneManager *)self participantsManager];
    [v6 updateShareParticipants];
  }
  else
  {
    id v6 = [(HMDDatabaseZoneManager *)self defaultConfiguration];
    if (([v6 isZoneOwner] & 1) == 0)
    {
      int64_t v5 = [(HMDDatabaseZoneManager *)self state];

      if (v5) {
        return;
      }
      id v6 = [(HMDDatabaseZoneManager *)self defaultConfiguration];
      -[HMDDatabaseZoneManager _requestShareInvitationWithConfiguration:](self, "_requestShareInvitationWithConfiguration:");
    }
  }
}

- (id)remove
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = [(HMDDatabaseZoneManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  int64_t v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Asked to remove zone", buf, 0xCu);
  }
  if ([(HMDDatabaseZoneManager *)v5 state] == 2)
  {
    [(HMDDatabaseZoneManager *)v5 setState:3];
    id v8 = (void *)MEMORY[0x263F581B8];
    unint64_t v9 = [(HMDDatabaseZoneManager *)v5 workQueue];
    unint64_t v10 = [v8 schedulerWithDispatchQueue:v9];

    uint64_t v11 = [(HMDDatabaseZoneManager *)v5 database];
    uint64_t v12 = [(HMDDatabaseZoneManager *)v5 localZone];
    uint64_t v13 = [v11 removeLocalAndCloudDataForLocalZone:v12];

    uint64_t v14 = [v13 reschedule:v10];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __32__HMDDatabaseZoneManager_remove__block_invoke;
    v22[3] = &unk_264A28FA8;
    v22[4] = v5;
    id v15 = [v14 flatMap:v22];
  }
  else
  {
    BOOL v16 = (void *)MEMORY[0x230FBD990]();
    __int16 v17 = v5;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot remove backing store because it is not running", buf, 0xCu);
    }
    id v20 = (void *)MEMORY[0x263F58190];
    unint64_t v10 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
    id v15 = [v20 futureWithError:v10];
  }

  return v15;
}

uint64_t __32__HMDDatabaseZoneManager_remove__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v2);

  [*(id *)(a1 + 32) _tearDownState];
  v3 = (void *)MEMORY[0x263F58190];
  return [v3 futureWithNoResult];
}

- (BOOL)startWithConfiguration:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = [(HMDDatabaseZoneManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unint64_t v9 = HMFGetLogIdentifier();
    int v18 = 138543618;
    id v19 = v9;
    __int16 v20 = 2112;
    uint64_t v21 = (uint64_t)v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Starting zone manager with configuration: %@", (uint8_t *)&v18, 0x16u);
  }
  if ([(HMDDatabaseZoneManager *)v7 state])
  {
    unint64_t v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = v7;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      uint64_t v14 = [(HMDDatabaseZoneManager *)v11 state];
      int v18 = 138543618;
      id v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Zone manager was asked to start but it isn't idle: %ld", (uint8_t *)&v18, 0x16u);
    }
    BOOL v15 = 0;
  }
  else
  {
    [(HMDDatabaseZoneManager *)v7 setState:1];
    if ([v4 isZoneOwner])
    {
      if ([v4 shouldCreateZone]) {
        BOOL v16 = [(HMDDatabaseZoneManager *)v7 _fetchPrivateZonesWithConfiguration:v4];
      }
      else {
        BOOL v16 = [(HMDDatabaseZoneManager *)v7 _fetchExistingPrivateZonesWithConfiguration:v4];
      }
    }
    else
    {
      BOOL v16 = [(HMDDatabaseZoneManager *)v7 _fetchSharedZonesWithConfiguration:v4];
    }
    BOOL v15 = v16;
  }

  return v15;
}

- (BOOL)start
{
  id v2 = self;
  v3 = [(HMDDatabaseZoneManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDDatabaseZoneManager *)v2 defaultConfiguration];
  LOBYTE(v2) = [(HMDDatabaseZoneManager *)v2 startWithConfiguration:v4];

  return (char)v2;
}

- (void)configure
{
  v3 = [(HMDDatabaseZoneManager *)self database];
  [v3 addDelegate:self];

  id v4 = [(HMDDatabaseZoneManager *)self shareMessenger];
  [v4 setDelegate:self];

  id v5 = [(HMDDatabaseZoneManager *)self shareMessenger];
  [v5 configure];
}

- (NSString)containerIdentifier
{
  id v2 = [(HMDDatabaseZoneManager *)self database];
  v3 = [v2 cloudDatabase];
  id v4 = [v3 containerID];
  id v5 = [v4 containerIdentifier];

  return (NSString *)v5;
}

- (NSUUID)messageTargetUUID
{
  id v2 = [(HMDDatabaseZoneManager *)self shareMessenger];
  v3 = [v2 messageTargetUUID];

  return (NSUUID *)v3;
}

- (HMDDatabaseZoneManager)initWithDatabase:(id)a3 zoneName:(id)a4 home:(id)a5 shareMessenger:(id)a6 workQueue:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HMDDatabaseZoneManager;
  int v18 = [(HMDDatabaseZoneManager *)&v26 init];
  id v19 = v18;
  if (v18)
  {
    v18->_state = 0;
    objc_storeStrong((id *)&v18->_database, a3);
    uint64_t v20 = objc_msgSend(v14, "hmf_stringWithSmallestEncoding");
    zoneName = v19->_zoneName;
    v19->_zoneName = (NSString *)v20;

    objc_storeWeak((id *)&v19->_home, v15);
    objc_storeStrong((id *)&v19->_shareMessenger, a6);
    objc_storeStrong((id *)&v19->_workQueue, a7);
    uint64_t v22 = objc_alloc_init(HMDDatabaseZoneManagerConfiguration);
    defaultConfiguration = v19->_defaultConfiguration;
    v19->_defaultConfiguration = v22;

    id participantsManagerFactory = v19->_participantsManagerFactory;
    v19->_id participantsManagerFactory = &__block_literal_global_93275;
  }
  return v19;
}

HMDCloudShareParticipantsManager *__82__HMDDatabaseZoneManager_initWithDatabase_zoneName_home_shareMessenger_workQueue___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  unint64_t v9 = [[HMDCloudShareParticipantsManager alloc] initWithQueue:v8 cloudZone:v7 home:v6];

  return v9;
}

- (HMDDatabaseZoneManager)initWithDatabase:(id)a3 zoneName:(id)a4 home:(id)a5 messageTargetUUID:(id)a6 workQueue:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [[HMDCloudShareMessenger alloc] initWithMessageTargetUUID:v13 workQueue:v12 home:v14];

  int v18 = [(HMDDatabaseZoneManager *)self initWithDatabase:v16 zoneName:v15 home:v14 shareMessenger:v17 workQueue:v12];
  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t22 != -1) {
    dispatch_once(&logCategory__hmf_once_t22, &__block_literal_global_29_93283);
  }
  id v2 = (void *)logCategory__hmf_once_v23;
  return v2;
}

void __37__HMDDatabaseZoneManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v23;
  logCategory__hmf_once_uint64_t v23 = v0;
}

@end