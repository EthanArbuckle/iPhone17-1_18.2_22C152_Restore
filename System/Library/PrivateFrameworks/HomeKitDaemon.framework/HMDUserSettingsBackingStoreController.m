@interface HMDUserSettingsBackingStoreController
+ (id)logCategory;
- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4;
- (HMBCloudZone)cloudZone;
- (HMBLocalZone)localZone;
- (HMDAssistantAccessControlModelUpdateReceiver)assistantAccessControlModelUpdateReceiver;
- (HMDCloudShareMessenger)shareMessenger;
- (HMDCloudShareParticipantsManager)participantsManager;
- (HMDDatabase)database;
- (HMDMediaContentProfileAccessControlModelUpdateReceiver)mediaContentProfileAccessControlModelUpdateReceiver;
- (HMDSettingTransactionReceiverProtocol)transactionReceiver;
- (HMDSharedUserDataModelUpdateReceiver)sharedUserDataModelUpdateReceiver;
- (HMDUserListeningHistoryUpdateControlModelUpdateReceiver)userListeningHistoryUpdateControlModelUpdateReceiver;
- (HMDUserSettingsBackingStoreController)initWithDelegate:(id)a3 queue:(id)a4 zoneName:(id)a5 database:(id)a6 shareMessenger:(id)a7;
- (HMDUserSettingsBackingStoreControllerDelegate)delegate;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSString)zoneName;
- (NSUUID)assistantAccessControlModelID;
- (NSUUID)mediaContentProfileAccessControlModelID;
- (NSUUID)sharedUserDataModelUpdateModelID;
- (NSUUID)userListeningHistoryUpdateModelID;
- (OS_dispatch_queue)workQueue;
- (id)_registrationWithParent:(void *)a3 subjectDeviceIdentifier:;
- (id)_uuidForActivitySubject:(void *)a3 observer:;
- (id)loadAssistantAccessControlModelWithModelID:(id)a3 error:(id *)a4;
- (id)loadMediaContentAccessControlModelWithModelID:(id)a3 error:(id *)a4;
- (id)loadPrivateUserDataModelWithError:(id *)a3;
- (id)loadSharedUserDataModelWithError:(id *)a3;
- (id)loadUserListeningHistoryUpdateControlModelWithModelID:(id)a3 error:(id *)a4;
- (id)loadUserSettings;
- (id)localZone:(id)a3 didProcessModelCreation:(id)a4;
- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4;
- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4;
- (id)queryPushTokensForDevicesObservingSubjectDevice:(id)a3 subActivity:(id)a4;
- (id)settingTransactionWithName:(id)a3;
- (int64_t)logEventRunState;
- (int64_t)runState;
- (void)_didFetchZonesWithResult:(id)a3 isOwnedZone:(BOOL)a4 error:(id)a5;
- (void)_invalidate;
- (void)_localZone:(id)a3 updatedModel:(id)a4 previousModel:(id)a5 options:(id)a6 result:(id)a7;
- (void)_sendShareInvitation:(id)a3 toUser:(id)a4 device:(id)a5;
- (void)_startWithOwnedZone;
- (void)_startWithSharedZone;
- (void)_updateLogEventRunState:(int64_t)a3;
- (void)_updateRunState:(int64_t)a3;
- (void)clearParticipants;
- (void)database:(id)a3 didCreateZoneWithName:(id)a4 isPrivate:(BOOL)a5;
- (void)database:(id)a3 didRemoveZoneWithName:(id)a4 isPrivate:(BOOL)a5;
- (void)deregisterObserverDeviceIdentifier:(id)a3;
- (void)deregisterObserverDeviceIdentifier:(id)a3 observerPushToken:(id)a4 subActivity:(id)a5 subjectDeviceIdentifier:(id)a6;
- (void)destroyZone;
- (void)manager:(id)a3 didRequestSendForInvitation:(id)a4 toDevice:(id)a5;
- (void)manager:(id)a3 didRequestSendForInvitation:(id)a4 toUser:(id)a5;
- (void)messenger:(id)a3 didReceiveInvitationData:(id)a4 completion:(id)a5;
- (void)messenger:(id)a3 didReceiveInvitationRequestFromUser:(id)a4 device:(id)a5;
- (void)registerForAssistantAccessControlModelUpdates:(id)a3 modelID:(id)a4;
- (void)registerForMediaContentAccessControlModelUpdates:(id)a3 modelID:(id)a4;
- (void)registerForSettingsTransactions:(id)a3;
- (void)registerForSharedUserDataModelUpdates:(id)a3 modelID:(id)a4;
- (void)registerForUserListeningHistoryUpdateControlModelUpdates:(id)a3 modelID:(id)a4;
- (void)registerObserverDeviceIdentifier:(id)a3 observerPushToken:(id)a4 subActivity:(id)a5 subjectDeviceIdentifier:(id)a6;
- (void)runSettingTransaction:(id)a3 completion:(id)a4;
- (void)runTransaction:(id)a3 waitForCloudPush:(BOOL)a4 completion:(id)a5;
- (void)setAssistantAccessControlModelID:(id)a3;
- (void)setAssistantAccessControlModelUpdateReceiver:(id)a3;
- (void)setCloudZone:(id)a3;
- (void)setLocalZone:(id)a3;
- (void)setLogEventRunState:(int64_t)a3;
- (void)setMediaContentProfileAccessControlModelID:(id)a3;
- (void)setMediaContentProfileAccessControlModelUpdateReceiver:(id)a3;
- (void)setParticipantsManager:(id)a3;
- (void)setRunState:(int64_t)a3;
- (void)setSharedUserDataModelUpdateModelID:(id)a3;
- (void)setSharedUserDataModelUpdateReceiver:(id)a3;
- (void)setTransactionReceiver:(id)a3;
- (void)setUserListeningHistoryUpdateControlModelUpdateReceiver:(id)a3;
- (void)setUserListeningHistoryUpdateModelID:(id)a3;
- (void)start;
- (void)updateObserverDeviceIdentifier:(id)a3 observerPushToken:(id)a4;
- (void)updateParticipants;
@end

@implementation HMDUserSettingsBackingStoreController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sharedUserDataModelUpdateReceiver);
  objc_storeStrong((id *)&self->_sharedUserDataModelUpdateModelID, 0);
  objc_destroyWeak((id *)&self->_userListeningHistoryUpdateControlModelUpdateReceiver);
  objc_storeStrong((id *)&self->_userListeningHistoryUpdateModelID, 0);
  objc_storeStrong((id *)&self->_mediaContentProfileAccessControlModelID, 0);
  objc_destroyWeak((id *)&self->_mediaContentProfileAccessControlModelUpdateReceiver);
  objc_storeStrong((id *)&self->_assistantAccessControlModelID, 0);
  objc_destroyWeak((id *)&self->_assistantAccessControlModelUpdateReceiver);
  objc_destroyWeak((id *)&self->_transactionReceiver);
  objc_storeStrong((id *)&self->_cloudZone, 0);
  objc_storeStrong((id *)&self->_participantsManager, 0);
  objc_storeStrong((id *)&self->_shareMessenger, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)setSharedUserDataModelUpdateReceiver:(id)a3
{
}

- (HMDSharedUserDataModelUpdateReceiver)sharedUserDataModelUpdateReceiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sharedUserDataModelUpdateReceiver);
  return (HMDSharedUserDataModelUpdateReceiver *)WeakRetained;
}

- (void)setSharedUserDataModelUpdateModelID:(id)a3
{
}

- (NSUUID)sharedUserDataModelUpdateModelID
{
  return (NSUUID *)objc_getProperty(self, a2, 168, 1);
}

- (void)setUserListeningHistoryUpdateControlModelUpdateReceiver:(id)a3
{
}

- (HMDUserListeningHistoryUpdateControlModelUpdateReceiver)userListeningHistoryUpdateControlModelUpdateReceiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userListeningHistoryUpdateControlModelUpdateReceiver);
  return (HMDUserListeningHistoryUpdateControlModelUpdateReceiver *)WeakRetained;
}

- (void)setUserListeningHistoryUpdateModelID:(id)a3
{
}

- (NSUUID)userListeningHistoryUpdateModelID
{
  return (NSUUID *)objc_getProperty(self, a2, 152, 1);
}

- (void)setMediaContentProfileAccessControlModelID:(id)a3
{
}

- (NSUUID)mediaContentProfileAccessControlModelID
{
  return (NSUUID *)objc_getProperty(self, a2, 144, 1);
}

- (void)setMediaContentProfileAccessControlModelUpdateReceiver:(id)a3
{
}

- (HMDMediaContentProfileAccessControlModelUpdateReceiver)mediaContentProfileAccessControlModelUpdateReceiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaContentProfileAccessControlModelUpdateReceiver);
  return (HMDMediaContentProfileAccessControlModelUpdateReceiver *)WeakRetained;
}

- (void)setAssistantAccessControlModelID:(id)a3
{
}

- (NSUUID)assistantAccessControlModelID
{
  return (NSUUID *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAssistantAccessControlModelUpdateReceiver:(id)a3
{
}

- (HMDAssistantAccessControlModelUpdateReceiver)assistantAccessControlModelUpdateReceiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assistantAccessControlModelUpdateReceiver);
  return (HMDAssistantAccessControlModelUpdateReceiver *)WeakRetained;
}

- (void)setTransactionReceiver:(id)a3
{
}

- (HMDSettingTransactionReceiverProtocol)transactionReceiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transactionReceiver);
  return (HMDSettingTransactionReceiverProtocol *)WeakRetained;
}

- (void)setLogEventRunState:(int64_t)a3
{
  self->_logEventRunState = a3;
}

- (int64_t)logEventRunState
{
  return self->_logEventRunState;
}

- (void)setRunState:(int64_t)a3
{
  self->_runState = a3;
}

- (int64_t)runState
{
  return self->_runState;
}

- (void)setCloudZone:(id)a3
{
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_getProperty(self, a2, 88, 1);
}

- (void)setParticipantsManager:(id)a3
{
}

- (HMDCloudShareParticipantsManager)participantsManager
{
  return (HMDCloudShareParticipantsManager *)objc_getProperty(self, a2, 80, 1);
}

- (HMDCloudShareMessenger)shareMessenger
{
  return (HMDCloudShareMessenger *)objc_getProperty(self, a2, 72, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 64, 1);
}

- (HMDDatabase)database
{
  return (HMDDatabase *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)zoneName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLocalZone:(id)a3
{
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 32, 1);
}

- (HMDUserSettingsBackingStoreControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDUserSettingsBackingStoreControllerDelegate *)WeakRetained;
}

- (void)database:(id)a3 didRemoveZoneWithName:(id)a4 isPrivate:(BOOL)a5
{
  int v5 = a5;
  id v7 = a4;
  id v12 = [(HMDUserSettingsBackingStoreController *)self zoneName];
  char v8 = objc_msgSend(v7, "isEqualToString:");

  if (v8)
  {
    v9 = [(HMDUserSettingsBackingStoreController *)self delegate];
    int v10 = [v9 isCurrentUser];

    if (v10 == v5)
    {
      v11 = [(HMDUserSettingsBackingStoreController *)self workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __82__HMDUserSettingsBackingStoreController_database_didRemoveZoneWithName_isPrivate___block_invoke;
      block[3] = &unk_264A2F7F8;
      block[4] = self;
      dispatch_async(v11, block);
    }
  }
  else
  {
  }
}

void __82__HMDUserSettingsBackingStoreController_database_didRemoveZoneWithName_isPrivate___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    char v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Zone was removed by the database", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) _invalidate];
  v6 = [*(id *)(a1 + 32) delegate];
  [v6 didStopBackingStoreController:*(void *)(a1 + 32)];
}

- (void)database:(id)a3 didCreateZoneWithName:(id)a4 isPrivate:(BOOL)a5
{
  int v5 = a5;
  id v7 = a4;
  id v12 = [(HMDUserSettingsBackingStoreController *)self zoneName];
  char v8 = objc_msgSend(v7, "isEqualToString:");

  if (v8)
  {
    uint64_t v9 = [(HMDUserSettingsBackingStoreController *)self delegate];
    int v10 = [v9 isCurrentUser];

    if (v10 == v5)
    {
      v11 = [(HMDUserSettingsBackingStoreController *)self workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __82__HMDUserSettingsBackingStoreController_database_didCreateZoneWithName_isPrivate___block_invoke;
      block[3] = &unk_264A2F7F8;
      block[4] = self;
      dispatch_async(v11, block);
    }
  }
  else
  {
  }
}

uint64_t __82__HMDUserSettingsBackingStoreController_database_didCreateZoneWithName_isPrivate___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    char v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling zone creation by starting", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) start];
}

- (void)runTransaction:(id)a3 waitForCloudPush:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v48 = a5;
  uint64_t v9 = (void *)MEMORY[0x230FBD990]();
  int v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    v13 = HMDUserSettingsBackingStoreControllerRunStateAsString([(HMDUserSettingsBackingStoreController *)v10 runState]);
    *(_DWORD *)buf = 138543874;
    v54 = v12;
    __int16 v55 = 2112;
    id v56 = v8;
    __int16 v57 = 2112;
    v58 = v13;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Running transaction %@, runState: %@", buf, 0x20u);
  }
  v14 = [(HMDUserSettingsBackingStoreController *)v10 localZone];
  if (v14)
  {
    id v15 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    id v17 = v16;

    v18 = (void *)MEMORY[0x263F49318];
    v19 = [v17 transactionLabel];
    v20 = [v18 optionsWithLabel:v19];

    if (([v17 initialCreation] & 1) != 0 || v6) {
      [v20 setShouldRollBackIfMirrorOutputFails:1];
    }
    v21 = objc_msgSend(v17, "updateModels", v8);
    if ([v21 count])
    {
    }
    else
    {
      v33 = [v17 removeUUIDs];
      uint64_t v34 = [v33 count];

      if (!v34)
      {
        v43 = (void *)MEMORY[0x230FBD990]();
        v44 = v10;
        v45 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          v46 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v54 = v46;
          __int16 v55 = 2112;
          id v56 = v15;
          _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_INFO, "%{public}@Skipping Empty transaction: %@", buf, 0x16u);
        }
        v32 = v48;
        (*((void (**)(id, void))v48 + 2))(v48, 0);
        goto LABEL_19;
      }
    }
    v35 = [v17 updateModels];
    v36 = [v17 removeUUIDs];
    v37 = [v14 addModels:v35 andRemoveModelIDs:v36 options:v20];

    v38 = (void *)MEMORY[0x263F581B8];
    v39 = [(HMDUserSettingsBackingStoreController *)v10 workQueue];
    v40 = [v38 schedulerWithDispatchQueue:v39];
    v41 = [v37 reschedule:v40];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __84__HMDUserSettingsBackingStoreController_runTransaction_waitForCloudPush_completion___block_invoke;
    v49[3] = &unk_264A17BA8;
    v49[4] = v10;
    id v50 = v15;
    BOOL v52 = v6;
    v32 = v48;
    id v51 = v48;
    id v42 = (id)[v41 addCompletionBlock:v49];

LABEL_19:
    id v8 = v47;
    goto LABEL_20;
  }
  v22 = (void *)MEMORY[0x230FBD990]();
  v23 = v10;
  v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
  {
    v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v54 = v25;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Failed to run transaction due to nil localZone", buf, 0xCu);
  }
  v26 = [[HMDAssertionLogEvent alloc] initWithReason:@"Failed to run transaction due to nil localZone"];
  v27 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v27 submitLogEvent:v26];

  v28 = (void *)MEMORY[0x230FBD990]();
  v29 = v23;
  v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v31 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v54 = v31;
    __int16 v55 = 2112;
    id v56 = v8;
    _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to run transaction: %@ due to nil localZone", buf, 0x16u);
  }
  id v17 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  v32 = v48;
  (*((void (**)(id, id))v48 + 2))(v48, v17);
LABEL_20:
}

void __84__HMDUserSettingsBackingStoreController_runTransaction_waitForCloudPush_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = HMFBooleanToString();
    *(_DWORD *)buf = 138544130;
    v32 = v10;
    __int16 v33 = 2112;
    uint64_t v34 = v11;
    __int16 v35 = 2112;
    id v36 = v6;
    __int16 v37 = 2112;
    v38 = v12;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Finished running transaction: %@, Error: %@, waitForCloudPush: %@", buf, 0x2Au);
  }
  if (v6 || !*(unsigned char *)(a1 + 56))
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else if (v5 {
         && ([v5 mirrorOutputResult],
  }
             v13 = objc_claimAutoreleasedReturnValue(),
             v13,
             v13))
  {
    v14 = [v5 mirrorOutputResult];
    id v15 = (void *)MEMORY[0x263F581B8];
    v16 = [*(id *)(a1 + 32) workQueue];
    id v17 = [v15 schedulerWithDispatchQueue:v16];
    v18 = [v14 reschedule:v17];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __84__HMDUserSettingsBackingStoreController_runTransaction_waitForCloudPush_completion___block_invoke_142;
    v27[3] = &unk_264A17B80;
    v19 = *(void **)(a1 + 40);
    v27[4] = *(void *)(a1 + 32);
    id v28 = v19;
    id v29 = v5;
    id v30 = *(id *)(a1 + 48);
    id v20 = (id)[v18 addCompletionBlock:v27];
  }
  else
  {
    v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = *(id *)(a1 + 32);
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v32 = v24;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@No processing result to wait for.", buf, 0xCu);
    }
    uint64_t v25 = *(void *)(a1 + 48);
    v26 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);
  }
}

void __84__HMDUserSettingsBackingStoreController_runTransaction_waitForCloudPush_completion___block_invoke_142(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    int v13 = 138544130;
    v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Finished running mirror protocol for transaction: %@, inResult: %@, inError: %@", (uint8_t *)&v13, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)settingTransactionWithName:(id)a3
{
  id v3 = a3;
  v4 = [[HMDSettingTransaction alloc] initWithTransactionLabel:v3];

  return v4;
}

- (void)runSettingTransaction:(id)a3 completion:(id)a4
{
}

- (void)registerForSettingsTransactions:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    int v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Registering transaction receiver %@", (uint8_t *)&v9, 0x16u);
  }
  [(HMDUserSettingsBackingStoreController *)v6 setTransactionReceiver:v4];
}

- (void)_localZone:(id)a3 updatedModel:(id)a4 previousModel:(id)a5 options:(id)a6 result:(id)a7
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  __int16 v17 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  dispatch_assert_queue_V2(v17);

  uint64_t v18 = (void *)MEMORY[0x230FBD990]();
  __int16 v19 = self;
  id v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v94 = v21;
    __int16 v95 = 2112;
    id v96 = v13;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Received transaction update for model %@", buf, 0x16u);
  }
  id v22 = [(HMDUserSettingsBackingStoreController *)v19 transactionReceiver];
  id v23 = v13;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v24 = v23;
  }
  else {
    v24 = 0;
  }
  id v25 = v24;

  if (!v25)
  {
    id v27 = v23;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v28 = v27;
    }
    else {
      id v28 = 0;
    }
    id v26 = v28;

    if (v26)
    {
      v89[0] = MEMORY[0x263EF8330];
      v89[1] = 3221225472;
      v89[2] = __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_2;
      v89[3] = &unk_264A17B58;
      id v90 = v16;
      [v22 transactionSettingModelUpdated:v27 previousModel:v14 completion:v89];
      id v29 = v90;
LABEL_50:

      goto LABEL_51;
    }
    id v78 = v12;
    id v30 = v27;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v31 = v30;
    }
    else {
      v31 = 0;
    }
    id v29 = v31;

    if (v29)
    {
      v87[0] = MEMORY[0x263EF8330];
      v87[1] = 3221225472;
      v87[2] = __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_3;
      v87[3] = &unk_264A17B58;
      id v88 = v16;
      [v22 transactionSettingConstraintModelUpdated:v30 previousModel:v14 completion:v87];
      v32 = v88;
      id v12 = v78;
LABEL_49:

      goto LABEL_50;
    }
    id v75 = v15;
    v76 = v30;
    __int16 v33 = [v30 hmbModelID];
    uint64_t v34 = [(HMDUserSettingsBackingStoreController *)v19 assistantAccessControlModelID];
    int v35 = [v33 isEqual:v34];

    if (v35)
    {
      id v36 = [(HMDUserSettingsBackingStoreController *)v19 assistantAccessControlModelUpdateReceiver];
      v85[0] = MEMORY[0x263EF8330];
      v85[1] = 3221225472;
      v85[2] = __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_4;
      v85[3] = &unk_264A17B58;
      id v86 = v16;
      [v36 assistantAccessControlModelUpdated:v76 previousModel:v14 completion:v85];

      v32 = v86;
LABEL_22:
      id v12 = v78;
      id v15 = v75;
LABEL_48:
      id v29 = 0;
      goto LABEL_49;
    }
    __int16 v37 = [v76 hmbModelID];
    v38 = [(HMDUserSettingsBackingStoreController *)v19 mediaContentProfileAccessControlModelID];
    int v39 = [v37 isEqual:v38];

    if (v39)
    {
      v40 = [(HMDUserSettingsBackingStoreController *)v19 mediaContentProfileAccessControlModelUpdateReceiver];
      v83[0] = MEMORY[0x263EF8330];
      v83[1] = 3221225472;
      v83[2] = __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_5;
      v83[3] = &unk_264A17B58;
      id v84 = v16;
      [v40 mediaContentProfileAccessControlModelUpdated:v76 previousModel:v14 completion:v83];

      v32 = v84;
      goto LABEL_22;
    }
    v41 = [v76 hmbModelID];
    id v42 = [(HMDUserSettingsBackingStoreController *)v19 sharedUserDataModelUpdateModelID];
    int v43 = [v41 isEqual:v42];

    if (v43)
    {
      v44 = [(HMDUserSettingsBackingStoreController *)v19 sharedUserDataModelUpdateReceiver];
      v81[0] = MEMORY[0x263EF8330];
      v81[1] = 3221225472;
      v81[2] = __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_6;
      v81[3] = &unk_264A17B58;
      id v82 = v16;
      [v44 sharedUserDataModelUpdated:v76 previousModel:v14 completion:v81];
    }
    id v45 = v76;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v46 = v45;
    }
    else {
      v46 = 0;
    }
    id v47 = v46;
    v73 = v45;

    id v77 = v47;
    id v48 = [v47 hmbModelID];
    v49 = [(HMDUserSettingsBackingStoreController *)v19 userListeningHistoryUpdateModelID];
    int v50 = [v48 isEqual:v49];

    if (v50)
    {
      id v51 = [(HMDUserSettingsBackingStoreController *)v19 userListeningHistoryUpdateControlModelUpdateReceiver];
      v79[0] = MEMORY[0x263EF8330];
      v79[1] = 3221225472;
      v79[2] = __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_7;
      v79[3] = &unk_264A17B58;
      id v80 = v16;
      v32 = v77;
      [v51 userListeningHistoryUpdateControlModelUpdated:v77 previousModel:v14 completion:v79];

      BOOL v52 = v80;
      id v12 = v78;
      id v15 = v75;
LABEL_47:

      goto LABEL_48;
    }
    id v53 = v73;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v54 = v53;
    }
    else {
      v54 = 0;
    }
    id v55 = v54;

    id v74 = v55;
    if (v55)
    {
      id v56 = v14;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        __int16 v57 = v56;
      }
      else {
        __int16 v57 = 0;
      }
      id v58 = v57;

      int v59 = [v55 hmbIsDifferentFromModel:v58 differingFields:0];
      if (v59)
      {
        id v60 = v55;
        v61 = [MEMORY[0x263F08A00] defaultCenter];
        [v61 postNotificationName:@"HMDUserDidUpdateIDSActivityRegistration" object:v60];
      }
      id v62 = objc_alloc_init(MEMORY[0x263F49250]);
      [v16 finishWithResult:v62];
    }
    else
    {
      id v63 = v53;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v64 = v63;
      }
      else {
        v64 = 0;
      }
      id v62 = v64;

      if (!v62)
      {
        id v72 = v63;
        v67 = (void *)MEMORY[0x230FBD990]();
        v68 = v19;
        v69 = HMFGetOSLogHandle();
        id v15 = v75;
        if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v70 = v71 = v67;
          *(_DWORD *)buf = 138543618;
          v94 = v70;
          __int16 v95 = 2112;
          id v96 = v72;
          _os_log_impl(&dword_22F52A000, v69, OS_LOG_TYPE_INFO, "%{public}@No handler for model %@", buf, 0x16u);

          v67 = v71;
        }

        id v62 = 0;
        goto LABEL_46;
      }
      v65 = [(HMDUserSettingsBackingStoreController *)v19 delegate];
      [v65 backingStoreController:v19 didUpdatePhotosPersonManagerSettingsModel:v62 previousPhotosPersonManagerSettingsModel:v14];

      id v66 = objc_alloc_init(MEMORY[0x263F49250]);
      [v16 finishWithResult:v66];
    }
    id v15 = v75;
LABEL_46:
    v32 = v77;

    id v12 = v78;
    BOOL v52 = v74;
    goto LABEL_47;
  }
  v91[0] = MEMORY[0x263EF8330];
  v91[1] = 3221225472;
  v91[2] = __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke;
  v91[3] = &unk_264A17B58;
  id v92 = v16;
  [v22 transactionSettingGroupModelUpdated:v23 previousModel:v14 completion:v91];
  id v26 = v92;
LABEL_51:
}

uint64_t __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

uint64_t __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

uint64_t __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

uint64_t __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

uint64_t __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

uint64_t __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

uint64_t __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F58190]);
  int v9 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __73__HMDUserSettingsBackingStoreController_localZone_didProcessModelUpdate___block_invoke;
  v16[3] = &unk_264A2E610;
  v16[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v10 = v8;
  id v19 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, v16);

  id v13 = v19;
  id v14 = v10;

  return v14;
}

void __73__HMDUserSettingsBackingStoreController_localZone_didProcessModelUpdate___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 48) model];
  id v4 = [*(id *)(a1 + 48) previousModel];
  id v5 = [*(id *)(a1 + 48) options];
  [v2 _localZone:v3 updatedModel:v6 previousModel:v4 options:v5 result:*(void *)(a1 + 56)];
}

- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  int v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [v7 model];
    int v17 = 138543618;
    id v18 = v11;
    __int16 v19 = 2112;
    id v20 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Notified of unhandled model deletion: %@", (uint8_t *)&v17, 0x16u);
  }
  id v13 = (void *)MEMORY[0x263F58190];
  id v14 = objc_alloc_init(MEMORY[0x263F49250]);
  id v15 = [v13 futureWithResult:v14];

  return v15;
}

- (id)localZone:(id)a3 didProcessModelCreation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F58190]);
  int v9 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __75__HMDUserSettingsBackingStoreController_localZone_didProcessModelCreation___block_invoke;
  v16[3] = &unk_264A2E610;
  v16[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v10 = v8;
  id v19 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, v16);

  id v13 = v19;
  id v14 = v10;

  return v14;
}

void __75__HMDUserSettingsBackingStoreController_localZone_didProcessModelCreation___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) model];
  id v4 = [*(id *)(a1 + 48) options];
  [v2 _localZone:v3 updatedModel:v5 previousModel:0 options:v4 result:*(void *)(a1 + 56)];
}

- (void)messenger:(id)a3 didReceiveInvitationRequestFromUser:(id)a4 device:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = self;
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    id v16 = [v9 shortDescription];
    id v17 = [v10 shortDescription];
    int v19 = 138543874;
    id v20 = v15;
    __int16 v21 = 2112;
    id v22 = v16;
    __int16 v23 = 2112;
    v24 = v17;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Received invitation request from user %@ and device %@", (uint8_t *)&v19, 0x20u);
  }
  id v18 = [(HMDUserSettingsBackingStoreController *)v13 participantsManager];
  [v18 inviteUser:v9 usingDevice:v10];
}

- (void)messenger:(id)a3 didReceiveInvitationData:(id)a4 completion:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = self;
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v35 = v15;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Received invitation to share user settings", buf, 0xCu);
  }
  id v16 = (void *)MEMORY[0x263F08928];
  id v17 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  id v33 = 0;
  id v18 = [v16 _strictlyUnarchivedObjectOfClasses:v17 fromData:v9 error:&v33];
  id v19 = v33;

  if (v18)
  {
    id v20 = [(HMDUserSettingsBackingStoreController *)v13 database];
    __int16 v21 = [v20 acceptInvitation:v18];

    id v22 = (void *)MEMORY[0x263F581B8];
    __int16 v23 = [(HMDUserSettingsBackingStoreController *)v13 workQueue];
    v24 = [v22 schedulerWithDispatchQueue:v23];
    uint64_t v25 = [v21 reschedule:v24];

    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __87__HMDUserSettingsBackingStoreController_messenger_didReceiveInvitationData_completion___block_invoke;
    v31[3] = &unk_264A17B30;
    v31[4] = v13;
    id v32 = v10;
    id v26 = (id)[v25 addCompletionBlock:v31];
  }
  else
  {
    id v27 = (void *)MEMORY[0x230FBD990]();
    id v28 = v13;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      int v35 = v30;
      __int16 v36 = 2112;
      id v37 = v9;
      __int16 v38 = 2112;
      id v39 = v19;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive share invitation from invitation data: %@: %@", buf, 0x20u);
    }
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v19);
  }
}

void __87__HMDUserSettingsBackingStoreController_messenger_didReceiveInvitationData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      id v12 = v10;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Successfully accepted invitation and created shared zone with ID %@", (uint8_t *)&v11, 0x16u);
    }
    [*(id *)(a1 + 32) start];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)manager:(id)a3 didRequestSendForInvitation:(id)a4 toDevice:(id)a5
{
  id v7 = a5;
  id v9 = a4;
  id v8 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  dispatch_assert_queue_V2(v8);

  [(HMDUserSettingsBackingStoreController *)self _sendShareInvitation:v9 toUser:0 device:v7];
}

- (void)manager:(id)a3 didRequestSendForInvitation:(id)a4 toUser:(id)a5
{
  id v7 = a5;
  id v9 = a4;
  id v8 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  dispatch_assert_queue_V2(v8);

  [(HMDUserSettingsBackingStoreController *)self _sendShareInvitation:v9 toUser:v7 device:0];
}

- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  dispatch_assert_queue_V2(v6);

  LOBYTE(v6) = [v5 isOwner];
  return (char)v6;
}

- (void)_sendShareInvitation:(id)a3 toUser:(id)a4 device:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  unint64_t v9 = (unint64_t)a4;
  unint64_t v10 = (unint64_t)a5;
  int v11 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v36 = 0;
  id v12 = [MEMORY[0x263F08910] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v36];
  id v13 = v36;
  if (v12)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__HMDUserSettingsBackingStoreController__sendShareInvitation_toUser_device___block_invoke;
    aBlock[3] = &unk_264A2ED68;
    aBlock[4] = self;
    id v14 = _Block_copy(aBlock);
    if (!(v9 | v10)) {
      _HMFPreconditionFailure();
    }
    uint64_t v15 = v14;
    if (v9)
    {
      id v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = self;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = id v33 = v13;
        id v20 = [(id)v9 shortDescription];
        *(_DWORD *)buf = 138543618;
        __int16 v38 = v19;
        __int16 v39 = 2112;
        id v40 = v20;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Sending share invitation for user settings to user: %@", buf, 0x16u);

        id v13 = v33;
      }

      __int16 v21 = [(HMDUserSettingsBackingStoreController *)v17 shareMessenger];
      id v22 = [[HMDHomeKitVersion alloc] initWithVersionString:@"6.0"];
      __int16 v23 = [MEMORY[0x263EFFA08] set];
      [v21 sendShareInvitationData:v12 toUser:v9 minimumHomeKitVersion:v22 requiredSupportedFeatures:v23 completion:v15];
    }
    else
    {
      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v28 = (void *)MEMORY[0x230FBD990]();
      id v29 = self;
      id v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = HMFGetLogIdentifier();
        [(id)v10 shortDescription];
        v32 = id v34 = v13;
        *(_DWORD *)buf = 138543618;
        __int16 v38 = v31;
        __int16 v39 = 2112;
        id v40 = v32;
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Sending share invitation for user settings to device: %@", buf, 0x16u);

        id v13 = v34;
      }

      __int16 v21 = [(HMDUserSettingsBackingStoreController *)v29 shareMessenger];
      [v21 sendShareInvitationData:v12 toDevice:v10 completion:v15];
    }

    goto LABEL_15;
  }
  v24 = (void *)MEMORY[0x230FBD990]();
  uint64_t v25 = self;
  id v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    id v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    __int16 v38 = v27;
    __int16 v39 = 2112;
    id v40 = v8;
    __int16 v41 = 2112;
    id v42 = v13;
    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize invitation %@: %@", buf, 0x20u);
  }
LABEL_16:
}

void __76__HMDUserSettingsBackingStoreController__sendShareInvitation_toUser_device___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  unint64_t v9 = v8;
  if (a2)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    unint64_t v10 = HMFGetLogIdentifier();
    int v18 = 138543362;
    id v19 = v10;
    int v11 = "%{public}@User settings zone sharing invitation was successfully accepted";
    id v12 = v9;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
    uint32_t v14 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    unint64_t v10 = HMFGetLogIdentifier();
    int v18 = 138543618;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v5;
    int v11 = "%{public}@User settings zone sharing invitation was not accepted: %@";
    id v12 = v9;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    uint32_t v14 = 22;
  }
  _os_log_impl(&dword_22F52A000, v12, v13, v11, (uint8_t *)&v18, v14);

LABEL_7:
  if (v5) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 1;
  }
  id v16 = [[HMDUserDataZoneControllerShareLogEvent alloc] initWithResult:v15 didAccept:a2];
  id v17 = [*(id *)(a1 + 32) logEventSubmitter];
  [v17 submitLogEvent:v16];
}

- (void)_updateLogEventRunState:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDUserSettingsBackingStoreController *)self logEventRunState] != a3)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)a3 >= 6)
      {
        int v11 = NSString;
        id v12 = [NSNumber numberWithInteger:a3];
        unint64_t v10 = [v11 stringWithFormat:@"Unknown state %@", v12];
      }
      else
      {
        unint64_t v10 = off_264A17BE0[a3];
      }
      *(_DWORD *)buf = 138543618;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating metric run state to %@", buf, 0x16u);
    }
    [(HMDUserSettingsBackingStoreController *)v7 setLogEventRunState:a3];
  }
}

- (void)_updateRunState:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDUserSettingsBackingStoreController *)self runState] != a3)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      unint64_t v10 = HMDUserSettingsBackingStoreControllerRunStateAsString(a3);
      int v11 = 138543618;
      id v12 = v9;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating run state to %@", (uint8_t *)&v11, 0x16u);
    }
    [(HMDUserSettingsBackingStoreController *)v7 setRunState:a3];
  }
}

- (id)loadUserSettings
{
  uint64_t v3 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = [(HMDUserSettingsBackingStoreController *)self localZone];
  id v6 = [(HMDUserSettingsBackingStoreController *)self delegate];
  id v7 = [v6 userUUID];
  id v20 = 0;
  id v8 = [v5 fetchModelsWithParentModelID:v7 error:&v20];
  id v9 = v20;
  unint64_t v10 = [v8 allObjects];
  int v11 = (void *)[v10 mutableCopy];

  [v4 addObjectsFromArray:v11];
  if ([v11 count])
  {
    do
    {
      id v12 = [v11 firstObject];
      objc_msgSend(v11, "hmf_removeFirstObject");
      __int16 v13 = [(HMDUserSettingsBackingStoreController *)self localZone];
      id v14 = [v12 hmbModelID];
      id v19 = v9;
      uint64_t v15 = [v13 fetchModelsWithParentModelID:v14 error:&v19];
      id v16 = v19;

      uint64_t v17 = [v15 allObjects];

      [v4 addObjectsFromArray:v17];
      [v11 addObjectsFromArray:v17];

      id v9 = v16;
    }
    while ([v11 count]);
  }
  else
  {
    id v16 = v9;
  }

  return v4;
}

- (void)_didFetchZonesWithResult:(id)a3 isOwnedZone:(BOOL)a4 error:(id)a5
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  dispatch_assert_queue_V2(v10);

  if (v8)
  {
    BOOL v77 = a4;
    int v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      uint64_t v15 = [v8 localZone];
      *(_DWORD *)buf = 138543618;
      id v87 = v14;
      __int16 v88 = 2112;
      v89 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Did fetch zones with local zone %@", buf, 0x16u);
    }
    id v16 = [(HMDUserSettingsBackingStoreController *)v12 delegate];
    uint64_t v17 = [v8 localZone];
    [(HMDUserSettingsBackingStoreController *)v12 setLocalZone:v17];

    int v18 = [(HMDUserSettingsBackingStoreController *)v12 localZone];
    [v18 addObserverForAllModels:v12];

    id v19 = [(HMDUserSettingsBackingStoreController *)v12 localZone];
    [v19 startUp];

    [v16 didStartLocalZoneForBackingStoreController:v12];
    if (v12)
    {
      id v74 = v16;
      id v75 = v9;
      id v76 = v8;
      id v20 = [(HMDUserSettingsBackingStoreController *)v12 localZone];
      id v21 = [v20 fetchModelsOfType:objc_opt_class() error:0];

      uint64_t v22 = [MEMORY[0x263EFF9C0] set];
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id v23 = v21;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v82 objects:buf count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v83;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v83 != v26) {
              objc_enumerationMutation(v23);
            }
            id v28 = *(void **)(*((void *)&v82 + 1) + 8 * i);
            uint64_t v29 = [v28 subjectDeviceIdentifier];
            id v30 = [v28 hmbParentModelID];
            v31 = -[HMDUserSettingsBackingStoreController _uuidForActivitySubject:observer:]((uint64_t)v12, (void *)v29, v30);

            id v32 = [v28 hmbModelID];
            LOBYTE(v29) = [v32 isEqual:v31];

            if ((v29 & 1) == 0)
            {
              id v33 = [v28 hmbModelID];
              [v22 addObject:v33];
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v82 objects:buf count:16];
        }
        while (v25);
      }

      if ([v22 count])
      {
        id v34 = [(HMDUserSettingsBackingStoreController *)v12 localZone];
        int v35 = [MEMORY[0x263F49318] optionsWithLabel:@"Removing non-derived HMDIDSActivityRegistrationModels"];
        id v36 = (id)[v34 removeModelIDs:v22 options:v35];
      }
      id v9 = v75;
      id v8 = v76;
      id v16 = v74;
    }
    id v37 = [v8 cloudZone];
    [(HMDUserSettingsBackingStoreController *)v12 setCloudZone:v37];

    if ([v16 isCurrentUser] && (objc_msgSend(v16, "isRunningOnHomeOwnersDevice") & 1) == 0)
    {
      __int16 v38 = (void *)MEMORY[0x230FBD990]();
      __int16 v39 = v12;
      id v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        __int16 v41 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v87 = v41;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, "%{public}@Starting participant manager to share with owner", buf, 0xCu);
      }
      id v42 = [v8 cloudZone];
      uint64_t v43 = [v16 backingStoreController:v39 createParticipantManagerForCloudZone:v42];
      [(HMDUserSettingsBackingStoreController *)v39 setParticipantsManager:v43];

      v44 = [(HMDUserSettingsBackingStoreController *)v39 participantsManager];
      [v44 setDataSource:v39];

      id v45 = [(HMDUserSettingsBackingStoreController *)v39 participantsManager];
      [v45 setDelegate:v39];

      v46 = [(HMDUserSettingsBackingStoreController *)v39 participantsManager];
      [v46 configure];

      id v47 = [(HMDUserSettingsBackingStoreController *)v39 participantsManager];
      [v47 updateShareParticipants];
    }
    id v48 = v12->_logger;
    v49 = v48;
    os_signpost_id_t startupSignPost = v12->_startupSignPost;
    if (startupSignPost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F52A000, v49, OS_SIGNPOST_EVENT, startupSignPost, "UserZone.Startup", "Fetched Zones", buf, 2u);
    }

    id v51 = [(HMDUserSettingsBackingStoreController *)v12 cloudZone];
    BOOL v52 = [v51 startUp];
    id v53 = (void *)MEMORY[0x263F581B8];
    v54 = [(HMDUserSettingsBackingStoreController *)v12 workQueue];
    id v55 = [v53 schedulerWithDispatchQueue:v54];
    id v56 = [v52 reschedule:v55];
    v81[0] = MEMORY[0x263EF8330];
    v81[1] = 3221225472;
    v81[2] = __84__HMDUserSettingsBackingStoreController__didFetchZonesWithResult_isOwnedZone_error___block_invoke;
    v81[3] = &unk_264A2F3E8;
    void v81[4] = v12;
    id v57 = (id)[v56 addFailureBlock:v81];

    id v58 = [(HMDUserSettingsBackingStoreController *)v12 cloudZone];
    int v59 = [v58 startUp];
    id v60 = (void *)MEMORY[0x263F581B8];
    v61 = [(HMDUserSettingsBackingStoreController *)v12 workQueue];
    id v62 = [v60 schedulerWithDispatchQueue:v61];
    id v63 = [v59 reschedule:v62];
    v78[0] = MEMORY[0x263EF8330];
    v78[1] = 3221225472;
    v78[2] = __84__HMDUserSettingsBackingStoreController__didFetchZonesWithResult_isOwnedZone_error___block_invoke_114;
    v78[3] = &unk_264A247B8;
    BOOL v80 = v77;
    v78[4] = v12;
    id v79 = v16;
    id v64 = v16;
    id v65 = (id)[v63 addSuccessBlock:v78];
  }
  else
  {
    id v66 = self->_logger;
    v67 = v66;
    os_signpost_id_t v68 = self->_startupSignPost;
    if (v68 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v66))
    {
      *(_DWORD *)buf = 138412290;
      id v87 = v9;
      _os_signpost_emit_with_name_impl(&dword_22F52A000, v67, OS_SIGNPOST_INTERVAL_END, v68, "UserZone.Startup", "Error=%{signpost.description:attribute}@ ", buf, 0xCu);
    }

    v69 = (void *)MEMORY[0x230FBD990]();
    v70 = self;
    v71 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      id v72 = HMFGetLogIdentifier();
      v73 = [(HMDUserSettingsBackingStoreController *)v70 zoneName];
      *(_DWORD *)buf = 138543874;
      id v87 = v72;
      __int16 v88 = 2112;
      v89 = v73;
      __int16 v90 = 2112;
      id v91 = v9;
      _os_log_impl(&dword_22F52A000, v71, OS_LOG_TYPE_ERROR, "%{public}@Failed to open zones for user settings with zone ID %@: %@", buf, 0x20u);
    }
    [(HMDUserSettingsBackingStoreController *)v70 _updateRunState:0];
    [(HMDUserSettingsBackingStoreController *)v70 _updateLogEventRunState:3];
  }
}

void __84__HMDUserSettingsBackingStoreController__didFetchZonesWithResult_isOwnedZone_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v11 = 138543618;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Zone failed to startup: %@", (uint8_t *)&v11, 0x16u);
  }
  id v8 = *(id *)(*(void *)(a1 + 32) + 8);
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(*(void *)(a1 + 32) + 16);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v11 = 138412290;
    id v12 = v3;
    _os_signpost_emit_with_name_impl(&dword_22F52A000, v9, OS_SIGNPOST_INTERVAL_END, v10, "UserZone.Startup", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v11, 0xCu);
  }

  [*(id *)(a1 + 32) _updateRunState:0];
  [*(id *)(a1 + 32) _updateLogEventRunState:3];
}

void __84__HMDUserSettingsBackingStoreController__didFetchZonesWithResult_isOwnedZone_error___block_invoke_114(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v13 = 138543362;
    id v14 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Started user data zone.", (uint8_t *)&v13, 0xCu);
  }
  id v8 = *(id *)(*(void *)(a1 + 32) + 8);
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(*(void *)(a1 + 32) + 16);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_22F52A000, v9, OS_SIGNPOST_INTERVAL_END, v10, "UserZone.Startup", "", (uint8_t *)&v13, 2u);
  }

  if (*(unsigned char *)(a1 + 48))
  {
    int v11 = [*(id *)(a1 + 32) cloudZone];
    id v12 = (id)[v11 registerSubscriptionForExternalRecordType:0];
  }
  [*(id *)(a1 + 32) _updateRunState:2];
  [*(id *)(a1 + 32) _updateLogEventRunState:2];
  [*(id *)(a1 + 40) didStartBackingStoreController:*(void *)(a1 + 32)];
}

- (id)_uuidForActivitySubject:(void *)a3 observer:
{
  if (a1)
  {
    id v4 = (void *)MEMORY[0x263F08C38];
    id v5 = a2;
    id v6 = [a3 data];
    id v7 = objc_msgSend(v4, "hm_deriveUUIDFromBaseUUID:identifierSalt:", v5, v6);
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void)_startWithSharedZone
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDUserSettingsBackingStoreController *)self database];
  id v5 = (id)[v4 registerSharedSubscriptionForExternalRecordType:0];

  id v6 = [(HMDUserSettingsBackingStoreController *)self database];
  id v7 = [(HMDUserSettingsBackingStoreController *)self zoneName];
  id v8 = [v6 existingSharedZoneIDWithName:v7];

  id v9 = (void *)MEMORY[0x230FBD990]();
  os_signpost_id_t v10 = self;
  int v11 = HMFGetOSLogHandle();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v12)
    {
      int v13 = HMFGetLogIdentifier();
      id v14 = [(HMDUserSettingsBackingStoreController *)v10 zoneName];
      *(_DWORD *)buf = 138543874;
      id v28 = v13;
      __int16 v29 = 2112;
      id v30 = v8;
      __int16 v31 = 2112;
      id v32 = v14;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Got zoneID %@ for user settings zone %@", buf, 0x20u);
    }
    uint64_t v15 = [(HMDUserSettingsBackingStoreController *)v10 database];
    id v16 = objc_alloc_init(MEMORY[0x263F49270]);
    id v26 = 0;
    uint64_t v17 = [v15 sharedZonesWithID:v8 configuration:v16 delegate:0 error:&v26];
    id v18 = v26;

    [(HMDUserSettingsBackingStoreController *)v10 _didFetchZonesWithResult:v17 isOwnedZone:0 error:v18];
  }
  else
  {
    if (v12)
    {
      id v19 = HMFGetLogIdentifier();
      id v20 = [(HMDUserSettingsBackingStoreController *)v10 zoneName];
      *(_DWORD *)buf = 138543618;
      id v28 = v19;
      __int16 v29 = 2112;
      id v30 = v20;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@No shared zone exists for user settings with zone name %@", buf, 0x16u);
    }
    [(HMDUserSettingsBackingStoreController *)v10 _updateRunState:0];
    [(HMDUserSettingsBackingStoreController *)v10 _updateLogEventRunState:5];
    id v21 = [(HMDUserSettingsBackingStoreController *)v10 delegate];
    uint64_t v17 = [v21 ownerForUserSettingsBackingStoreController:v10];

    uint64_t v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = v10;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v28 = v25;
      __int16 v29 = 2112;
      id v30 = v17;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Requesting user settings share from user: %@", buf, 0x16u);
    }
    id v18 = [(HMDUserSettingsBackingStoreController *)v23 shareMessenger];
    [v18 requestShareInvitationDataFromUser:v17];
  }
}

- (void)_startWithOwnedZone
{
  id v3 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init(MEMORY[0x263F492F8]);
  [v4 setShouldRebuildOnManateeKeyLoss:1];
  id v5 = [(HMDUserSettingsBackingStoreController *)self database];
  id v6 = [(HMDUserSettingsBackingStoreController *)self zoneName];
  id v9 = 0;
  id v7 = [v5 privateZonesWithName:v6 configuration:v4 delegate:0 error:&v9];
  id v8 = v9;

  [(HMDUserSettingsBackingStoreController *)self _didFetchZonesWithResult:v7 isOwnedZone:1 error:v8];
}

- (void)updateParticipants
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Updating participants", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(HMDUserSettingsBackingStoreController *)v4 participantsManager];
  [v7 updateShareParticipants];
}

- (void)clearParticipants
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Clearing participants", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(HMDUserSettingsBackingStoreController *)v4 participantsManager];
  [v7 clearParticipants];
}

- (id)queryPushTokensForDevicesObservingSubjectDevice:(id)a3 subActivity:(id)a4
{
  v30[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v29 = @"subjectDeviceIdentifier";
  v30[0] = v6;
  int v8 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
  id v9 = (void *)MEMORY[0x230FBD990]();
  uint64_t v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    BOOL v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v26 = v12;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Querying all models observing %@", buf, 0x16u);
  }
  int v13 = [(HMDUserSettingsBackingStoreController *)v10 localZone];
  id v14 = +[HMDIDSActivityRegistrationModel registeredDevicesQuery];
  uint64_t v15 = [v13 queryModelsUsingQuery:v14 arguments:v8];

  id v16 = [MEMORY[0x263EFF980] array];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __101__HMDUserSettingsBackingStoreController_queryPushTokensForDevicesObservingSubjectDevice_subActivity___block_invoke;
  v21[3] = &unk_264A17B08;
  id v22 = v7;
  id v23 = v10;
  id v24 = v16;
  id v17 = v16;
  id v18 = v7;
  [v15 enumerateObjectsUsingBlock:v21];
  id v19 = (void *)[v17 copy];

  return v19;
}

void __101__HMDUserSettingsBackingStoreController_queryPushTokensForDevicesObservingSubjectDevice_subActivity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 subActivities];
  int v5 = [v4 containsObject:*(void *)(a1 + 32)];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) localZone];
    id v7 = [v3 hmbParentModelID];
    id v18 = 0;
    int v8 = [v6 fetchModelWithModelID:v7 ofType:objc_opt_class() error:&v18];
    id v9 = (__CFString *)v18;

    uint64_t v10 = [v8 pushToken];

    if (v10)
    {
      int v11 = *(void **)(a1 + 48);
      BOOL v12 = [v8 pushToken];
      [v11 addObject:v12];
    }
    else
    {
      int v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = *(id *)(a1 + 40);
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = HMFGetLogIdentifier();
        id v17 = @"No parent observer model found";
        *(_DWORD *)buf = 138543874;
        id v20 = v16;
        if (v9) {
          id v17 = v9;
        }
        __int16 v21 = 2112;
        id v22 = v3;
        __int16 v23 = 2112;
        id v24 = v17;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to locate push token for registration %@: %@", buf, 0x20u);
      }
    }
  }
}

- (void)deregisterObserverDeviceIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Removing IDS Activity Observer: %@", buf, 0x16u);
  }
  id v9 = [(HMDUserSettingsBackingStoreController *)v6 localZone];
  uint64_t v10 = [MEMORY[0x263EFFA08] setWithObject:v4];
  int v11 = [MEMORY[0x263F49318] optionsWithLabel:@"Removing IDS Activity Observer"];
  BOOL v12 = [v9 removeModelIDs:v10 options:v11];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __76__HMDUserSettingsBackingStoreController_deregisterObserverDeviceIdentifier___block_invoke;
  v15[3] = &unk_264A2F370;
  v15[4] = v6;
  id v16 = v4;
  id v13 = v4;
  id v14 = (id)[v12 addFailureBlock:v15];
}

void __76__HMDUserSettingsBackingStoreController_deregisterObserverDeviceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543874;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove IDS Activity observer %@: %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)deregisterObserverDeviceIdentifier:(id)a3 observerPushToken:(id)a4 subActivity:(id)a5 subjectDeviceIdentifier:(id)a6
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(HMDUserSettingsBackingStoreController *)self localZone];
  uint64_t v15 = [v14 fetchModelWithModelID:v10 ofType:objc_opt_class() error:0];

  if (v15)
  {
    id v16 = -[HMDUserSettingsBackingStoreController _registrationWithParent:subjectDeviceIdentifier:](self, v10, v13);
    if (v16)
    {
      id v17 = [MEMORY[0x263EFF9C0] set];
      id v18 = [v16 subActivities];
      int v19 = [v18 containsObject:v12];

      id v51 = v13;
      id v52 = v11;
      if (v19)
      {
        id v20 = (void *)MEMORY[0x263EFF980];
        uint64_t v21 = [v16 subActivities];
        id v22 = [v20 arrayWithArray:v21];

        [v22 removeObject:v12];
        __int16 v23 = (void *)[v22 copy];
        [v16 setSubActivities:v23];

        context = (void *)MEMORY[0x230FBD990]();
        id v24 = self;
        uint64_t v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v27 = id v26 = v17;
          *(_DWORD *)buf = 138543874;
          id v56 = v27;
          __int16 v57 = 2112;
          id v58 = v12;
          __int16 v59 = 2112;
          id v60 = v22;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Removed subActivity %@ from existing list %@", buf, 0x20u);

          id v17 = v26;
        }

        [v17 addObject:v16];

        id v11 = v52;
      }
      [v15 pushToken];
      v29 = id v28 = v17;
      char v30 = [v11 isEqualToData:v29];

      __int16 v31 = v28;
      if ((v30 & 1) == 0)
      {
        [v15 setPushToken:v11];
        [v28 addObject:v15];
      }
      if ([v28 count])
      {
        id v32 = (void *)MEMORY[0x230FBD990]();
        uint64_t v33 = self;
        id v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          int v35 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          id v56 = v35;
          __int16 v57 = 2112;
          id v58 = v12;
          __int16 v59 = 2112;
          id v60 = v10;
          _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Removing subActivity %@ from IDS Activity Registration for: %@", buf, 0x20u);
        }
        id v36 = [(HMDUserSettingsBackingStoreController *)v33 localZone];
        id v37 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v15, v16, 0);
        __int16 v38 = [MEMORY[0x263F49318] optionsWithLabel:@"Updating IDS Activity Registration"];
        __int16 v39 = [v36 addModels:v37 options:v38];
        v53[0] = MEMORY[0x263EF8330];
        v53[1] = 3221225472;
        v53[2] = __130__HMDUserSettingsBackingStoreController_deregisterObserverDeviceIdentifier_observerPushToken_subActivity_subjectDeviceIdentifier___block_invoke;
        v53[3] = &unk_264A2F370;
        v53[4] = v33;
        id v54 = v10;
        id v40 = (id)[v39 addFailureBlock:v53];

        id v11 = v52;
        __int16 v31 = v28;
      }

      id v13 = v51;
    }
    else
    {
      id v45 = (void *)MEMORY[0x230FBD990]();
      v46 = self;
      id v47 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v49 = id v48 = v11;
        *(_DWORD *)buf = 138543618;
        id v56 = v49;
        __int16 v57 = 2112;
        id v58 = v10;
        _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_INFO, "%{public}@Unable to deregister, no IDS Activty Registration model found for %@", buf, 0x16u);

        id v11 = v48;
      }
    }
  }
  else
  {
    __int16 v41 = (void *)MEMORY[0x230FBD990]();
    id v42 = self;
    uint64_t v43 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      v44 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v56 = v44;
      __int16 v57 = 2112;
      id v58 = v10;
      _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_INFO, "%{public}@Unable to deregister, no IDS Activty Observer model found for %@", buf, 0x16u);
    }
  }
}

- (id)_registrationWithParent:(void *)a3 subjectDeviceIdentifier:
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = objc_msgSend(a1, "localZone", 0);
    uint64_t v8 = [v7 fetchModelsWithParentModelID:v5 error:0];

    id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v13 = [v12 subjectDeviceIdentifier];
          char v14 = [v13 isEqual:v6];

          if (v14)
          {
            id v9 = v12;
            goto LABEL_12;
          }
        }
        id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __130__HMDUserSettingsBackingStoreController_deregisterObserverDeviceIdentifier_observerPushToken_subActivity_subjectDeviceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543874;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update IDS Activity registration for %@: %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)updateObserverDeviceIdentifier:(id)a3 observerPushToken:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDUserSettingsBackingStoreController *)self localZone];
  int v9 = [v8 fetchModelWithModelID:v6 ofType:objc_opt_class() error:0];

  if (!v9)
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    __int16 v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v29 = v15;
      __int16 v30 = 2112;
      id v31 = v6;
      long long v16 = "%{public}@Unable to update observer pushToken, no IDS Activty Observer model found for %@";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_12;
  }
  uint64_t v10 = [v9 pushToken];
  char v11 = [v7 isEqualToData:v10];

  if (v11)
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    __int16 v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v29 = v15;
      __int16 v30 = 2112;
      id v31 = v6;
      long long v16 = "%{public}@Push token already up to date for %@";
LABEL_7:
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, v16, buf, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  long long v17 = (void *)MEMORY[0x230FBD990]([v9 setPushToken:v7]);
  long long v18 = self;
  long long v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v29 = v20;
    __int16 v30 = 2112;
    id v31 = v6;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Updating IDS Activity observer pushToken: %@", buf, 0x16u);
  }
  uint64_t v21 = [(HMDUserSettingsBackingStoreController *)v18 localZone];
  id v22 = [MEMORY[0x263EFFA08] setWithObject:v9];
  __int16 v23 = [MEMORY[0x263F49318] optionsWithLabel:@"Reregistering IDS Activity Observer"];
  id v24 = [v21 addModels:v22 options:v23];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __90__HMDUserSettingsBackingStoreController_updateObserverDeviceIdentifier_observerPushToken___block_invoke;
  v26[3] = &unk_264A2F370;
  v26[4] = v18;
  id v27 = v6;
  id v25 = (id)[v24 addFailureBlock:v26];

LABEL_12:
}

void __90__HMDUserSettingsBackingStoreController_updateObserverDeviceIdentifier_observerPushToken___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543874;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update IDS Activity for observer %@: %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)registerObserverDeviceIdentifier:(id)a3 observerPushToken:(id)a4 subActivity:(id)a5 subjectDeviceIdentifier:(id)a6
{
  v65[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [MEMORY[0x263EFF9C0] set];
  uint64_t v15 = [(HMDUserSettingsBackingStoreController *)self localZone];
  long long v16 = [v15 fetchModelWithModelID:v10 ofType:objc_opt_class() error:0];

  id v56 = v12;
  if (!v16)
  {
    uint64_t v32 = (void *)MEMORY[0x230FBD990]();
    uint64_t v33 = self;
    id v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      int v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v60 = v35;
      __int16 v61 = 2112;
      id v62 = v10;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@No IDS Activity observer found for %@, creating", buf, 0x16u);
    }
    long long v16 = [[HMDIDSActivityObserverModel alloc] initWithModelID:v10];
    long long v17 = (HMDIDSActivityRegistrationModel *)[v14 addObject:v16];
    goto LABEL_13;
  }
  -[HMDUserSettingsBackingStoreController _registrationWithParent:subjectDeviceIdentifier:](self, v10, v13);
  long long v17 = (HMDIDSActivityRegistrationModel *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
LABEL_13:
    id v55 = v11;
    id v36 = (void *)MEMORY[0x230FBD990](v17);
    id v37 = self;
    __int16 v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      __int16 v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v60 = v39;
      __int16 v61 = 2112;
      id v62 = v13;
      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@No IDS Activity registration found for %@, creating", buf, 0x16u);
    }
    id v26 = -[HMDUserSettingsBackingStoreController _uuidForActivitySubject:observer:]((uint64_t)v37, v13, v10);
    id v40 = [HMDIDSActivityRegistrationModel alloc];
    __int16 v41 = [(HMBModel *)v16 hmbModelID];
    long long v18 = [(HMBModel *)v40 initWithModelID:v26 parentModelID:v41];

    [(HMDIDSActivityRegistrationModel *)v18 setSubjectDeviceIdentifier:v13];
    v65[0] = v56;
    id v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:1];
    [(HMDIDSActivityRegistrationModel *)v18 setSubActivities:v42];

    goto LABEL_16;
  }
  long long v18 = v17;
  long long v19 = [(HMDIDSActivityRegistrationModel *)v17 subActivities];
  id v20 = v12;
  char v21 = [v19 containsObject:v12];

  if (v21) {
    goto LABEL_17;
  }
  id v55 = v11;
  id v22 = (void *)MEMORY[0x263EFF980];
  uint64_t v23 = [(HMDIDSActivityRegistrationModel *)v18 subActivities];
  id v24 = (void *)v23;
  if (v23) {
    uint64_t v25 = v23;
  }
  else {
    uint64_t v25 = MEMORY[0x263EFFA68];
  }
  id v26 = [v22 arrayWithArray:v25];

  [v26 addObject:v20];
  id v27 = (void *)[v26 copy];
  [(HMDIDSActivityRegistrationModel *)v18 setSubActivities:v27];

  id v28 = (void *)MEMORY[0x230FBD990]();
  __int16 v29 = self;
  __int16 v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v31 = v54 = v28;
    *(_DWORD *)buf = 138543874;
    id v60 = v31;
    __int16 v61 = 2112;
    id v62 = v56;
    __int16 v63 = 2112;
    id v64 = v26;
    _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Added subActivity %@ to existing list %@", buf, 0x20u);

    id v28 = v54;
  }

LABEL_16:
  [v14 addObject:v18];

  id v11 = v55;
LABEL_17:
  uint64_t v43 = [(HMDIDSActivityObserverModel *)v16 pushToken];
  char v44 = [v11 isEqualToData:v43];

  id v45 = v56;
  if ((v44 & 1) == 0)
  {
    [(HMDIDSActivityObserverModel *)v16 setPushToken:v11];
    [v14 addObject:v16];
  }
  if ([v14 count])
  {
    v46 = (void *)MEMORY[0x230FBD990]();
    id v47 = self;
    id v48 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v60 = v49;
      __int16 v61 = 2112;
      id v62 = v14;
      _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@Updating IDS Activity Registration info: %@", buf, 0x16u);
    }
    int v50 = [(HMDUserSettingsBackingStoreController *)v47 localZone];
    id v51 = [MEMORY[0x263F49318] optionsWithLabel:@"Updating IDS Activity Registration"];
    id v52 = [v50 addModels:v14 options:v51];
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __128__HMDUserSettingsBackingStoreController_registerObserverDeviceIdentifier_observerPushToken_subActivity_subjectDeviceIdentifier___block_invoke;
    v57[3] = &unk_264A2F370;
    v57[4] = v47;
    id v58 = v10;
    id v53 = (id)[v52 addFailureBlock:v57];

    id v45 = v56;
  }
}

void __128__HMDUserSettingsBackingStoreController_registerObserverDeviceIdentifier_observerPushToken_subActivity_subjectDeviceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
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
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update IDS Activity registration for observer %@: %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)destroyZone
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    int v14 = 138543362;
    uint64_t v15 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Destroying zone", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v8 = [(HMDUserSettingsBackingStoreController *)v5 delegate];
  int v9 = [v8 isCurrentUser];

  id v10 = [(HMDUserSettingsBackingStoreController *)v5 database];
  __int16 v11 = [(HMDUserSettingsBackingStoreController *)v5 zoneName];
  if (v9) {
    id v12 = (id)[v10 removePrivateZonesWithName:v11];
  }
  else {
    id v13 = (id)[v10 removeSharedZonesWithName:v11];
  }

  [(HMDUserSettingsBackingStoreController *)v5 _invalidate];
}

- (void)_invalidate
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    int v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Invalidating user zone", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(HMDUserSettingsBackingStoreController *)v4 workQueue];
  dispatch_assert_queue_V2(v7);

  [(HMDUserSettingsBackingStoreController *)v4 setLocalZone:0];
  [(HMDUserSettingsBackingStoreController *)v4 setCloudZone:0];
  [(HMDUserSettingsBackingStoreController *)v4 _updateRunState:0];
  [(HMDUserSettingsBackingStoreController *)v4 _updateLogEventRunState:4];
}

- (void)registerForSharedUserDataModelUpdates:(id)a3 modelID:(id)a4
{
  id v6 = a4;
  [(HMDUserSettingsBackingStoreController *)self setSharedUserDataModelUpdateReceiver:a3];
  [(HMDUserSettingsBackingStoreController *)self setSharedUserDataModelUpdateModelID:v6];
}

- (void)registerForUserListeningHistoryUpdateControlModelUpdates:(id)a3 modelID:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  dispatch_assert_queue_V2(v7);

  [(HMDUserSettingsBackingStoreController *)self setUserListeningHistoryUpdateControlModelUpdateReceiver:v6];
  [(HMDUserSettingsBackingStoreController *)self setUserListeningHistoryUpdateModelID:v8];
}

- (id)loadUserListeningHistoryUpdateControlModelWithModelID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(HMDUserSettingsBackingStoreController *)self localZone];
  int v9 = [v8 fetchModelWithModelID:v6 error:a4];

  return v9;
}

- (void)registerForMediaContentAccessControlModelUpdates:(id)a3 modelID:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  dispatch_assert_queue_V2(v7);

  [(HMDUserSettingsBackingStoreController *)self setMediaContentProfileAccessControlModelUpdateReceiver:v6];
  [(HMDUserSettingsBackingStoreController *)self setMediaContentProfileAccessControlModelID:v8];
}

- (id)loadMediaContentAccessControlModelWithModelID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(HMDUserSettingsBackingStoreController *)self localZone];
  int v9 = [v8 fetchModelWithModelID:v6 error:a4];

  return v9;
}

- (void)registerForAssistantAccessControlModelUpdates:(id)a3 modelID:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  dispatch_assert_queue_V2(v7);

  [(HMDUserSettingsBackingStoreController *)self setAssistantAccessControlModelUpdateReceiver:v6];
  [(HMDUserSettingsBackingStoreController *)self setAssistantAccessControlModelID:v8];
}

- (id)loadAssistantAccessControlModelWithModelID:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(HMDUserSettingsBackingStoreController *)self localZone];
  int v9 = [v8 fetchModelWithModelID:v6 error:a4];

  id v10 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v11 = v10;
  }
  else {
    __int16 v11 = 0;
  }
  id v12 = v11;

  if (v10 && !v12)
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    int v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v18 = 138543618;
      long long v19 = v16;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Obtained model of unexpected type %@", (uint8_t *)&v18, 0x16u);
    }
  }

  return v12;
}

- (id)loadSharedUserDataModelWithError:(id *)a3
{
  id v5 = [(HMDUserSettingsBackingStoreController *)self localZone];
  id v6 = [(HMDUserSettingsBackingStoreController *)self delegate];
  id v7 = [v6 userUUID];
  id v8 = [v5 fetchModelWithModelID:v7 error:a3];

  return v8;
}

- (id)loadPrivateUserDataModelWithError:(id *)a3
{
  id v5 = [(HMDUserSettingsBackingStoreController *)self localZone];
  id v6 = [(HMDUserSettingsBackingStoreController *)self delegate];
  id v7 = [v6 userUUID];
  id v8 = [v5 fetchModelWithModelID:v7 error:a3];

  return v8;
}

- (void)start
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = [(HMDUserSettingsBackingStoreController *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDUserSettingsBackingStoreController *)self runState])
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v8 = HMDUserSettingsBackingStoreControllerRunStateAsString([(HMDUserSettingsBackingStoreController *)v5 runState]);
      int v26 = 138543618;
      id v27 = v7;
      __int16 v28 = 2112;
      __int16 v29 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Already in run state %@", (uint8_t *)&v26, 0x16u);
    }
  }
  else
  {
    int v9 = [(HMDUserSettingsBackingStoreController *)self delegate];
    if ([v9 isCurrentUser])
    {
      id v10 = (void *)MEMORY[0x230FBD990]();
      __int16 v11 = self;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        int v14 = [v9 userUUID];
        int v26 = 138543618;
        id v27 = v13;
        __int16 v28 = 2112;
        __int16 v29 = v14;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Starting backing store controller to fetch owned zone for user %@", (uint8_t *)&v26, 0x16u);
      }
      [(HMDUserSettingsBackingStoreController *)v11 _updateRunState:1];
      [(HMDUserSettingsBackingStoreController *)v11 _updateLogEventRunState:1];
      logger = v11->_logger;
      if (os_signpost_enabled(logger))
      {
        uint64_t v16 = logger;
        long long v17 = [v9 userUUID];
        int v26 = 138412546;
        id v27 = @"Owned";
        __int16 v28 = 2112;
        __int16 v29 = v17;
        _os_signpost_emit_with_name_impl(&dword_22F52A000, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UserZone.Startup", "Type=%{signpost.description:attribute}@ User=%{signpost.description:attribute}@ ", (uint8_t *)&v26, 0x16u);
      }
      v11->_os_signpost_id_t startupSignPost = 0xEEEEB0B5B2B2EEEELL;
      [(HMDUserSettingsBackingStoreController *)v11 _startWithOwnedZone];
    }
    else if (([v9 isCurrentUser] & 1) == 0 {
           && [v9 isRunningOnHomeOwnersDevice])
    }
    {
      int v18 = (void *)MEMORY[0x230FBD990]();
      long long v19 = self;
      __int16 v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        uint64_t v22 = [v9 userUUID];
        int v26 = 138543618;
        id v27 = v21;
        __int16 v28 = 2112;
        __int16 v29 = v22;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Starting backing store controller to fetch shared zone for user %@", (uint8_t *)&v26, 0x16u);
      }
      [(HMDUserSettingsBackingStoreController *)v19 _updateRunState:1];
      [(HMDUserSettingsBackingStoreController *)v19 _updateLogEventRunState:1];
      uint64_t v23 = v19->_logger;
      if (os_signpost_enabled(v23))
      {
        id v24 = v23;
        uint64_t v25 = [v9 userUUID];
        int v26 = 138412546;
        id v27 = @"Shared";
        __int16 v28 = 2112;
        __int16 v29 = v25;
        _os_signpost_emit_with_name_impl(&dword_22F52A000, v24, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UserZone.Startup", "Type=%{signpost.description:attribute}@ User=%{signpost.description:attribute}@ ", (uint8_t *)&v26, 0x16u);
      }
      v19->_os_signpost_id_t startupSignPost = 0xEEEEB0B5B2B2EEEELL;
      [(HMDUserSettingsBackingStoreController *)v19 _startWithSharedZone];
    }
  }
}

- (HMDUserSettingsBackingStoreController)initWithDelegate:(id)a3 queue:(id)a4 zoneName:(id)a5 database:(id)a6 shareMessenger:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HMDUserSettingsBackingStoreController;
  long long v17 = [(HMDUserSettingsBackingStoreController *)&v23 init];
  if (v17)
  {
    uint64_t v18 = HMFGetOSLogHandle();
    logger = v17->_logger;
    v17->_logger = (OS_os_log *)v18;

    v17->_os_signpost_id_t startupSignPost = 0;
    objc_storeWeak((id *)&v17->_delegate, v12);
    objc_storeStrong((id *)&v17->_workQueue, a4);
    uint64_t v20 = +[HMDMetricsManager sharedLogEventSubmitter];
    logEventSubmitter = v17->_logEventSubmitter;
    v17->_logEventSubmitter = (HMMLogEventSubmitting *)v20;

    objc_storeStrong((id *)&v17->_zoneName, a5);
    objc_storeStrong((id *)&v17->_database, a6);
    objc_storeStrong((id *)&v17->_shareMessenger, a7);
    [(HMDCloudShareMessenger *)v17->_shareMessenger setDelegate:v17];
    [(HMDCloudShareMessenger *)v17->_shareMessenger configure];
    v17->_runState = 0;
    v17->_logEventRunState = 0;
    [v15 addDelegate:v17];
  }

  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t81 != -1) {
    dispatch_once(&logCategory__hmf_once_t81, &__block_literal_global_20881);
  }
  v2 = (void *)logCategory__hmf_once_v82;
  return v2;
}

void __52__HMDUserSettingsBackingStoreController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v82;
  logCategory__hmf_once_long long v82 = v0;
}

@end