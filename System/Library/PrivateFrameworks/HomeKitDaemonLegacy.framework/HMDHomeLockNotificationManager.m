@interface HMDHomeLockNotificationManager
+ (id)logCategory;
- (BOOL)hasReachablePrimaryResidentSupportingLockNotificationContext;
- (BOOL)shouldResolveNotificationContextForCharacteristic:(id)a3;
- (HMDHome)home;
- (HMDHomeLockNotificationManager)initWithUUID:(id)a3 workQueue:(id)a4;
- (HMDHomeLockNotificationManager)initWithUUID:(id)a3 workQueue:(id)a4 dataSource:(id)a5;
- (HMDHomeLockNotificationManagerDataSource)dataSource;
- (HMFMessageDispatcher)msgDispatcher;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (id)contextResolutionResultFromAccessCode:(id)a3;
- (id)contextResolutionResultFromHAPContextId:(id)a3;
- (id)contextResolutionResultFromNFCContextId:(id)a3;
- (id)displayNameForNotificationContextResolutionResult:(id)a3;
- (id)logIdentifier;
- (void)_resolveKeypadContextIdentifier:(id)a3 accessoryUUID:(id)a4 completion:(id)a5;
- (void)_sendResolveLockNotificationContextIdentifierMessage:(id)a3 accessoryUUID:(id)a4 withCompletion:(id)a5;
- (void)configureWithHome:(id)a3;
- (void)handleResolveNotificationContextIdentifierMessage:(id)a3;
- (void)resolveEncodedCharacteristicNotificationContext:(id)a3 accessoryUUID:(id)a4 completion:(id)a5;
- (void)resolveKeypadContextIdentifier:(id)a3 accessoryUUID:(id)a4 withCompletion:(id)a5;
- (void)setHome:(id)a3;
- (void)setMsgDispatcher:(id)a3;
@end

@implementation HMDHomeLockNotificationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (HMDHomeLockNotificationManagerDataSource)dataSource
{
  return (HMDHomeLockNotificationManagerDataSource *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMsgDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)msgDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDHomeLockNotificationManager *)self uuid];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)contextResolutionResultFromNFCContextId:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDHomeLockNotificationManager *)self home];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 users];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __74__HMDHomeLockNotificationManager_contextResolutionResultFromNFCContextId___block_invoke;
    v22[3] = &unk_1E6A12608;
    id v8 = v4;
    id v23 = v8;
    v9 = objc_msgSend(v7, "na_firstObjectPassingTest:", v22);

    if (v9)
    {
      v10 = [HMDHomeLockNotificationContextResolutionResult alloc];
      v11 = [v9 uuid];
      v12 = [(HMDHomeLockNotificationContextResolutionResult *)v10 initWithUserUUID:v11 label:0 labelIdentifier:0];
    }
    else
    {
      v17 = (void *)MEMORY[0x1D9452090]();
      v18 = self;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v25 = v20;
        __int16 v26 = 2112;
        id v27 = v8;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Did not find any user with NFC contextId: %@", buf, 0x16u);
      }
      v12 = 0;
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1D9452090]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v25 = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Can not create context resolution result because home is nil", buf, 0xCu);
    }
    v12 = 0;
  }

  return v12;
}

uint64_t __74__HMDHomeLockNotificationManager_contextResolutionResultFromNFCContextId___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 notificationContextNFCIdentifier];
  uint64_t v4 = [v3 isEqualToNumber:*(void *)(a1 + 32)];

  return v4;
}

- (id)contextResolutionResultFromHAPContextId:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDHomeLockNotificationManager *)self home];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 users];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __74__HMDHomeLockNotificationManager_contextResolutionResultFromHAPContextId___block_invoke;
    v22[3] = &unk_1E6A12608;
    id v8 = v4;
    id v23 = v8;
    v9 = objc_msgSend(v7, "na_firstObjectPassingTest:", v22);

    if (v9)
    {
      v10 = [HMDHomeLockNotificationContextResolutionResult alloc];
      v11 = [v9 uuid];
      v12 = [(HMDHomeLockNotificationContextResolutionResult *)v10 initWithUserUUID:v11 label:0 labelIdentifier:0];
    }
    else
    {
      v17 = (void *)MEMORY[0x1D9452090]();
      v18 = self;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v25 = v20;
        __int16 v26 = 2112;
        id v27 = v8;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Did not find any user with HAP contextId: %@", buf, 0x16u);
      }
      v12 = 0;
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1D9452090]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v25 = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Can not create context resolution result because home is nil", buf, 0xCu);
    }
    v12 = 0;
  }

  return v12;
}

uint64_t __74__HMDHomeLockNotificationManager_contextResolutionResultFromHAPContextId___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 notificationContextHAPIdentifier];
  uint64_t v4 = [v3 isEqualToNumber:*(void *)(a1 + 32)];

  return v4;
}

- (id)contextResolutionResultFromAccessCode:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDHomeLockNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDHomeLockNotificationManager *)self home];
  v7 = v6;
  if (v6)
  {
    id v8 = [v6 users];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __72__HMDHomeLockNotificationManager_contextResolutionResultFromAccessCode___block_invoke;
    v27[3] = &unk_1E6A12608;
    id v9 = v4;
    id v28 = v9;
    v10 = objc_msgSend(v8, "na_firstObjectPassingTest:", v27);

    if (v10)
    {
      v11 = [HMDHomeLockNotificationContextResolutionResult alloc];
      v12 = [v10 uuid];
      v13 = v11;
      v14 = v12;
      v15 = 0;
    }
    else
    {
      v21 = [v7 labelsByAccessCode];
      v12 = [v21 objectForKeyedSubscript:v9];

      if (!v12)
      {
        id v23 = (void *)MEMORY[0x1D9452090]();
        v24 = self;
        v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          __int16 v26 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v30 = v26;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Did not find any user or label with access code", buf, 0xCu);
        }
        v12 = 0;
        v20 = 0;
        goto LABEL_10;
      }
      v13 = [HMDHomeLockNotificationContextResolutionResult alloc];
      v14 = 0;
      v15 = v12;
    }
    v20 = [(HMDHomeLockNotificationContextResolutionResult *)v13 initWithUserUUID:v14 label:v15 labelIdentifier:0];
LABEL_10:

    goto LABEL_11;
  }
  v16 = (void *)MEMORY[0x1D9452090]();
  v17 = self;
  v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v30 = v19;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Can not create context resolution result from access code because home is nil", buf, 0xCu);
  }
  v20 = 0;
LABEL_11:

  return v20;
}

uint64_t __72__HMDHomeLockNotificationManager_contextResolutionResultFromAccessCode___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 accessCode];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_resolveKeypadContextIdentifier:(id)a3 accessoryUUID:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(HMDHomeLockNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  v12 = [(HMDHomeLockNotificationManager *)self home];
  v13 = [v12 accessCodeManager];
  if (v13)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __91__HMDHomeLockNotificationManager__resolveKeypadContextIdentifier_accessoryUUID_completion___block_invoke;
    v19[3] = &unk_1E6A0CE90;
    v19[4] = self;
    id v20 = v10;
    [v13 fetchAccessCodeForIdentifier:v8 accessoryUUID:v9 completion:v19];
  }
  else
  {
    v14 = (void *)MEMORY[0x1D9452090]();
    v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v22 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Can not resolve notification context identifier because accessCodeManager is nil", buf, 0xCu);
    }
    v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v18);
  }
}

void __91__HMDHomeLockNotificationManager__resolveKeypadContextIdentifier_accessoryUUID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 contextResolutionResultFromAccessCode:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_sendResolveLockNotificationContextIdentifierMessage:(id)a3 accessoryUUID:(id)a4 withCompletion:(id)a5
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(HMDHomeLockNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  v12 = [(HMDHomeLockNotificationManager *)self home];
  v13 = [v12 residentDeviceManager];
  v14 = [v13 primaryResidentDevice];

  if (v14)
  {
    v15 = [HMDRemoteDeviceMessageDestination alloc];
    v16 = [(HMDHomeLockNotificationManager *)self messageTargetUUID];
    v17 = [v14 device];
    v18 = [(HMDRemoteDeviceMessageDestination *)v15 initWithTarget:v16 device:v17];

    v47[0] = v8;
    v46[0] = @"HMDHomeResolveLockNotificationContextIdentifierMessageAccessCodeIdentifierKey";
    v46[1] = @"HMDHomeResolveLockNotificationContextIdentifierMessage";
    id v34 = v9;
    v19 = [v9 UUIDString];
    v47[1] = v19;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];

    v21 = [[HMDRemoteMessage alloc] initWithName:@"HMDHomeResolveLockNotificationContextIdentifierMessage" destination:v18 payload:v20 type:0 timeout:1 secure:0.0];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke;
    v35[3] = &unk_1E6A16950;
    v35[4] = self;
    id v33 = v10;
    id v37 = v10;
    id v22 = v8;
    id v23 = v8;
    id v36 = v23;
    v24 = (void *)MEMORY[0x1D9452090]([(HMDRemoteMessage *)v21 setResponseHandler:v35]);
    v25 = self;
    __int16 v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v39 = v27;
      __int16 v40 = 2112;
      v41 = v21;
      __int16 v42 = 2112;
      v43 = v14;
      __int16 v44 = 2112;
      id v45 = v23;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Sending message: %@ to primary resident: %@ to resolve notification context identifier: %@ ", buf, 0x2Au);
    }
    id v28 = [(HMDHomeLockNotificationManager *)v25 msgDispatcher];
    [v28 sendMessage:v21];

    id v8 = v22;
    id v10 = v33;
    id v9 = v34;
  }
  else
  {
    v29 = (void *)MEMORY[0x1D9452090]();
    v30 = self;
    uint64_t v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v39 = v32;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Did not find primary resident to send message to resolve notification context identifier", buf, 0xCu);
    }
    v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    (*((void (**)(id, void, HMDRemoteDeviceMessageDestination *))v10 + 2))(v10, 0, v18);
  }
}

void __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_msgSend(v6, "hmf_dataForKey:", @"HMDHomeLockNotificationContextResolutionResultKey");
  if (v7)
  {
    id v35 = 0;
    id v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v35];
    id v9 = v35;
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = *(id *)(a1 + 32);
    v12 = HMFGetOSLogHandle();
    v13 = v12;
    if (v8)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = id v14 = v5;
        v16 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        v39 = v15;
        __int16 v40 = 2112;
        id v41 = v8;
        __int16 v42 = 2112;
        id v43 = v16;
        __int16 v44 = 2112;
        id v45 = v14;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Received notification context resolution result: %@ from resident for access code identifier: %@ with error: %@", buf, 0x2Au);

        id v5 = v14;
      }

      v17 = [*(id *)(a1 + 32) workQueue];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke_27;
      v29[3] = &unk_1E6A19530;
      id v31 = *(id *)(a1 + 48);
      id v30 = v8;
      dispatch_async(v17, v29);

      id v18 = v31;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = id v24 = v5;
        *(_DWORD *)buf = 138543874;
        v39 = v25;
        __int16 v40 = 2112;
        id v41 = v7;
        __int16 v42 = 2112;
        id v43 = v9;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode notification context result from data: %@ decodingError: %@", buf, 0x20u);

        id v5 = v24;
      }

      if (v9)
      {
        uint64_t v46 = *MEMORY[0x1E4F28A50];
        v47[0] = v9;
        __int16 v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
      }
      else
      {
        __int16 v26 = 0;
      }
      id v27 = [*(id *)(a1 + 32) workQueue];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke_26;
      v32[3] = &unk_1E6A19530;
      id v28 = *(id *)(a1 + 48);
      id v33 = v26;
      id v34 = v28;
      id v18 = v26;
      dispatch_async(v27, v32);
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = *(id *)(a1 + 32);
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v39 = v22;
      __int16 v40 = 2112;
      id v41 = v6;
      __int16 v42 = 2112;
      id v43 = v5;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Missing notification context result key in response payload: %@ error: %@", buf, 0x20u);
    }
    id v23 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke_23;
    block[3] = &unk_1E6A186E0;
    id v37 = *(id *)(a1 + 48);
    dispatch_async(v23, block);

    id v9 = v37;
  }
}

void __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke_23(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke_26(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1 userInfo:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)resolveKeypadContextIdentifier:(id)a3 accessoryUUID:(id)a4 withCompletion:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(HMDHomeLockNotificationManager *)self hasReachablePrimaryResidentSupportingLockNotificationContext])
  {
    id v11 = [(HMDHomeLockNotificationManager *)self workQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __94__HMDHomeLockNotificationManager_resolveKeypadContextIdentifier_accessoryUUID_withCompletion___block_invoke;
    v17[3] = &unk_1E6A18398;
    v17[4] = self;
    id v20 = v10;
    id v18 = v8;
    id v19 = v9;
    dispatch_async(v11, v17);
  }
  else
  {
    v12 = (void *)MEMORY[0x1D9452090]();
    v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v22 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Can not resolve keypad contextId because primary resident supporting lock notification context is not present", buf, 0xCu);
    }
    v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v16);
  }
}

void __94__HMDHomeLockNotificationManager_resolveKeypadContextIdentifier_accessoryUUID_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) home];
  v3 = v2;
  if (v2)
  {
    int v4 = [v2 isOwnerUser];
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v8)
      {
        id v9 = HMFGetLogIdentifier();
        uint64_t v10 = *(void *)(a1 + 40);
        uint64_t v11 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        v32 = v9;
        __int16 v33 = 2112;
        uint64_t v34 = v10;
        __int16 v35 = 2112;
        uint64_t v36 = v11;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Resolving keypad context identifier locally for access code identifier: %@ accessoryUUID: %@", buf, 0x20u);
      }
      v12 = *(void **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __94__HMDHomeLockNotificationManager_resolveKeypadContextIdentifier_accessoryUUID_withCompletion___block_invoke_18;
      v29[3] = &unk_1E6A0CE68;
      uint64_t v14 = *(void *)(a1 + 48);
      id v30 = *(id *)(a1 + 56);
      [v12 _resolveKeypadContextIdentifier:v13 accessoryUUID:v14 completion:v29];
      v15 = v30;
    }
    else
    {
      if (v8)
      {
        v21 = HMFGetLogIdentifier();
        uint64_t v22 = *(void *)(a1 + 40);
        uint64_t v23 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        v32 = v21;
        __int16 v33 = 2112;
        uint64_t v34 = v22;
        __int16 v35 = 2112;
        uint64_t v36 = v23;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Resolving keypad context identifier via resident for access code identifier: %@ accessoryUUID: %@", buf, 0x20u);
      }
      id v24 = *(void **)(a1 + 32);
      uint64_t v25 = *(void *)(a1 + 40);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __94__HMDHomeLockNotificationManager_resolveKeypadContextIdentifier_accessoryUUID_withCompletion___block_invoke_19;
      v27[3] = &unk_1E6A0CE68;
      uint64_t v26 = *(void *)(a1 + 48);
      id v28 = *(id *)(a1 + 56);
      [v24 _sendResolveLockNotificationContextIdentifierMessage:v25 accessoryUUID:v26 withCompletion:v27];
      v15 = v28;
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = *(id *)(a1 + 32);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v32 = v19;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Can not resolve keypad contextId because home is nil", buf, 0xCu);
    }
    uint64_t v20 = *(void *)(a1 + 56);
    v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:17];
    (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v15);
  }
}

uint64_t __94__HMDHomeLockNotificationManager_resolveKeypadContextIdentifier_accessoryUUID_withCompletion___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __94__HMDHomeLockNotificationManager_resolveKeypadContextIdentifier_accessoryUUID_withCompletion___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)displayNameForNotificationContextResolutionResult:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeLockNotificationManager *)self home];
  if (!v5)
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    uint64_t v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v13;
      uint64_t v14 = "%{public}@Can not find display name because home is nil";
LABEL_10:
      v15 = v12;
      uint32_t v16 = 12;
LABEL_11:
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, v14, buf, v16);
    }
LABEL_12:

    id v9 = 0;
    goto LABEL_13;
  }
  if (![(HMDHomeLockNotificationManager *)self hasReachablePrimaryResidentSupportingLockNotificationContext])
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    uint64_t v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v13;
      uint64_t v14 = "%{public}@Can not find display name because primary resident supporting lock notification context is not present";
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  id v6 = [v4 userUUID];

  if (v6)
  {
    id v7 = [v5 users];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __84__HMDHomeLockNotificationManager_displayNameForNotificationContextResolutionResult___block_invoke;
    v19[3] = &unk_1E6A12608;
    id v20 = v4;
    BOOL v8 = objc_msgSend(v7, "na_firstObjectPassingTest:", v19);

    if (v8)
    {
      id v9 = [v8 displayName];

      goto LABEL_13;
    }

    goto LABEL_19;
  }
  id v18 = [v4 label];

  if (!v18)
  {
LABEL_19:
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    uint64_t v11 = self;
    v12 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    uint64_t v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v13;
    __int16 v23 = 2112;
    id v24 = v4;
    uint64_t v14 = "%{public}@Did not find display name for notification context result: %@";
    v15 = v12;
    uint32_t v16 = 22;
    goto LABEL_11;
  }
  id v9 = [v4 label];
LABEL_13:

  return v9;
}

uint64_t __84__HMDHomeLockNotificationManager_displayNameForNotificationContextResolutionResult___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uuid];
  id v4 = [*(id *)(a1 + 32) userUUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)resolveEncodedCharacteristicNotificationContext:(id)a3 accessoryUUID:(id)a4 completion:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v32 = 0;
  uint64_t v11 = [MEMORY[0x1E4F5BC78] parsedFromData:v8 error:&v32];
  id v12 = v32;
  if (v11)
  {
    uint64_t v13 = [v11 contextIdentifier];
    uint64_t v14 = [v13 value];

    if (v14)
    {
      v15 = [v11 source];
      uint64_t v16 = [v15 value];

      switch(v16)
      {
        case 1:
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __107__HMDHomeLockNotificationManager_resolveEncodedCharacteristicNotificationContext_accessoryUUID_completion___block_invoke;
          v30[3] = &unk_1E6A0CE68;
          id v31 = v10;
          [(HMDHomeLockNotificationManager *)self resolveKeypadContextIdentifier:v14 accessoryUUID:v9 withCompletion:v30];
          uint64_t v26 = v31;
LABEL_20:

          goto LABEL_21;
        case 2:
          uint64_t v17 = [(HMDHomeLockNotificationManager *)self contextResolutionResultFromNFCContextId:v14];
          goto LABEL_15;
        case 3:
          uint64_t v17 = [(HMDHomeLockNotificationManager *)self contextResolutionResultFromHAPContextId:v14];
LABEL_15:
          uint64_t v26 = (void *)v17;
          (*((void (**)(id, uint64_t, void))v10 + 2))(v10, v17, 0);
          goto LABEL_20;
      }
      uint64_t v22 = (void *)MEMORY[0x1D9452090]();
      __int16 v23 = self;
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v28 = v29 = v22;
        *(_DWORD *)buf = 138543618;
        uint64_t v34 = v28;
        __int16 v35 = 2048;
        uint64_t v36 = v16;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Invalid source %ld present in notification context", buf, 0x16u);

        uint64_t v22 = v29;
      }
    }
    else
    {
      uint64_t v22 = (void *)MEMORY[0x1D9452090]();
      __int16 v23 = self;
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v34 = v25;
        __int16 v35 = 2112;
        uint64_t v36 = (uint64_t)v8;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Failed to decode notification context identifier from data:%@", buf, 0x16u);
      }
    }

    uint64_t v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v26);
    goto LABEL_20;
  }
  id v18 = (void *)MEMORY[0x1D9452090]();
  id v19 = self;
  id v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v34 = v21;
    __int16 v35 = 2112;
    uint64_t v36 = (uint64_t)v8;
    __int16 v37 = 2112;
    id v38 = v12;
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse notification context TLV from context:%@ error:%@", buf, 0x20u);
  }
  uint64_t v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
LABEL_21:
}

uint64_t __107__HMDHomeLockNotificationManager_resolveEncodedCharacteristicNotificationContext_accessoryUUID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleResolveNotificationContextIdentifierMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDHomeLockNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v9;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling message: %@ to resolve notification context identifier", buf, 0x16u);
  }
  id v10 = [v4 numberForKey:@"HMDHomeResolveLockNotificationContextIdentifierMessageAccessCodeIdentifierKey"];
  uint64_t v11 = [v4 uuidForKey:@"HMDHomeResolveLockNotificationContextIdentifierMessage"];
  id v12 = (void *)v11;
  if (v10 && v11)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __84__HMDHomeLockNotificationManager_handleResolveNotificationContextIdentifierMessage___block_invoke;
    v18[3] = &unk_1E6A0CE40;
    v18[4] = v7;
    id v19 = v10;
    id v20 = v4;
    [(HMDHomeLockNotificationManager *)v7 _resolveKeypadContextIdentifier:v19 accessoryUUID:v12 completion:v18];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1D9452090]();
    uint64_t v14 = v7;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = v16;
      __int16 v23 = 2112;
      id v24 = v10;
      __int16 v25 = 2112;
      uint64_t v26 = v12;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Received invalid parameters in message to resolve lock notification context for identifier: %@ accessoryUUID: %@", buf, 0x20u);
    }
    uint64_t v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 userInfo:0];
    [v4 respondWithError:v17];
  }
}

void __84__HMDHomeLockNotificationManager_handleResolveNotificationContextIdentifierMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    uint64_t v34 = v10;
    __int16 v35 = 2112;
    uint64_t v36 = v11;
    __int16 v37 = 2112;
    id v38 = v5;
    __int16 v39 = 2112;
    id v40 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Resolved notification context identifier: %@ to result: %@ with error: %@", buf, 0x2Au);
  }
  if (v5)
  {
    id v28 = 0;
    id v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v28];
    id v13 = v28;
    uint64_t v14 = v13;
    if (v12)
    {
      v29 = @"HMDHomeLockNotificationContextResolutionResultKey";
      id v30 = v12;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      [*(id *)(a1 + 48) respondWithPayload:v15];
    }
    else
    {
      if (v13)
      {
        uint64_t v31 = *MEMORY[0x1E4F28A50];
        id v32 = v13;
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      }
      else
      {
        v15 = 0;
      }
      v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1 userInfo:v15];
      uint64_t v22 = (void *)MEMORY[0x1D9452090]();
      id v23 = *(id *)(a1 + 32);
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = uint64_t v27 = v22;
        uint64_t v26 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        uint64_t v34 = v25;
        __int16 v35 = 2112;
        uint64_t v36 = v26;
        __int16 v37 = 2112;
        id v38 = v21;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Responding to resolve notification context identifier message: %@ with: %@", buf, 0x20u);

        uint64_t v22 = v27;
      }

      [*(id *)(a1 + 48) respondWithError:v21];
    }
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1 userInfo:0];
    uint64_t v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = *(id *)(a1 + 32);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      uint64_t v20 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v34 = v19;
      __int16 v35 = 2112;
      uint64_t v36 = v20;
      __int16 v37 = 2112;
      id v38 = v14;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Responding to resolve notification context identifier message: %@ with: %@", buf, 0x20u);
    }
    [*(id *)(a1 + 48) respondWithError:v14];
  }
}

- (BOOL)shouldResolveNotificationContextForCharacteristic:(id)a3
{
  id v3 = a3;
  id v4 = [v3 type];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F2CEB0]];

  if (v5
    && ([v3 value],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unint64_t v7 = [v6 integerValue],
        v6,
        v7 <= 1)
    && [v3 supportsNotificationContext])
  {
    id v8 = [v3 notificationContext];
    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)hasReachablePrimaryResidentSupportingLockNotificationContext
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDHomeLockNotificationManager *)self home];
  id v4 = [v3 residentDeviceManager];
  int v5 = [v4 primaryResidentDevice];

  if (v5)
  {
    id v6 = [v5 capabilities];
    if ([v6 supportsLockNotificationContext]) {
      char v7 = [v5 isReachable];
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    BOOL v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Primary resident is not available", (uint8_t *)&v13, 0xCu);
    }
    char v7 = 0;
  }

  return v7;
}

- (void)configureWithHome:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  char v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v8;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring with home: %@", buf, 0x16u);
  }
  [(HMDHomeLockNotificationManager *)v6 setHome:v4];
  BOOL v9 = [v4 msgDispatcher];
  [(HMDHomeLockNotificationManager *)v6 setMsgDispatcher:v9];

  id v10 = [(HMDHomeLockNotificationManager *)v6 dataSource];
  int v11 = [v10 isResidentCapable];

  if (v11)
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    int v13 = v6;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Registering for lock notifications messages", buf, 0xCu);
    }
    uint64_t v16 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
    objc_msgSend(v16, "setRoles:", objc_msgSend(v16, "roles") | 4);
    id v17 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:0 remoteAccessRequired:0];
    id v18 = [(HMDHomeLockNotificationManager *)v13 msgDispatcher];
    v20[0] = v17;
    v20[1] = v16;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    [v18 registerForMessage:@"HMDHomeResolveLockNotificationContextIdentifierMessage" receiver:v13 policies:v19 selector:sel_handleResolveNotificationContextIdentifierMessage_];
  }
}

- (HMDHomeLockNotificationManager)initWithUUID:(id)a3 workQueue:(id)a4 dataSource:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDHomeLockNotificationManager;
  int v11 = [(HMDHomeLockNotificationManager *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v12;

    objc_storeStrong((id *)&v11->_workQueue, a4);
    objc_storeStrong((id *)&v11->_dataSource, a5);
  }

  return v11;
}

- (HMDHomeLockNotificationManager)initWithUUID:(id)a3 workQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(HMDHomeLockNotificationManagerDataSource);
  id v9 = [(HMDHomeLockNotificationManager *)self initWithUUID:v7 workQueue:v6 dataSource:v8];

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t30 != -1) {
    dispatch_once(&logCategory__hmf_once_t30, &__block_literal_global_75550);
  }
  id v2 = (void *)logCategory__hmf_once_v31;
  return v2;
}

uint64_t __45__HMDHomeLockNotificationManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v31;
  logCategory__hmf_once_uint64_t v31 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end