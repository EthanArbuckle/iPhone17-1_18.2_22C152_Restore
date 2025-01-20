@interface HMDHomeLockNotificationManager
+ (id)findEcosystemName:(id)a3;
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
- (void)handleDoorLockAlarmEvent:(id)a3 forAccessory:(id)a4 flow:(id)a5;
- (void)handleDoorLockEventReport:(id)a3 forAccessory:(id)a4 flow:(id)a5;
- (void)handleLockOperationEvent:(id)a3 forAccessory:(id)a4 flow:(id)a5;
- (void)handleLockUserChangeEvent:(id)a3 forAccessory:(id)a4 flow:(id)a5;
- (void)handleResolveNotificationContextIdentifierMessage:(id)a3;
- (void)resolveEncodedCharacteristicNotificationContext:(id)a3 accessoryUUID:(id)a4 completion:(id)a5;
- (void)resolveKeypadContextIdentifier:(id)a3 accessoryUUID:(id)a4 withCompletion:(id)a5;
- (void)sendDoorLockAlarmEventNotification:(id)a3 accessory:(id)a4 flow:(id)a5;
- (void)sendLockOperationEventNotification:(id)a3 userUniqueID:(id)a4 lockOperationType:(id)a5 lockOperationSource:(id)a6 fabricIndex:(id)a7 accessory:(id)a8 timestamp:(id)a9 flow:(id)a10;
- (void)sendLockUserChangeEventNotification:(id)a3 lockDataType:(unsigned __int8)a4 accessory:(id)a5 dataOperationType:(unsigned __int8)a6 fabricIndex:(id)a7 flow:(id)a8;
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
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDHomeLockNotificationManager *)self home];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 users];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __74__HMDHomeLockNotificationManager_contextResolutionResultFromNFCContextId___block_invoke;
    v22[3] = &unk_264A2DB60;
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
      v17 = (void *)MEMORY[0x230FBD990]();
      v18 = self;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v25 = v20;
        __int16 v26 = 2112;
        id v27 = v8;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Did not find any user with NFC contextId: %@", buf, 0x16u);
      }
      v12 = 0;
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x230FBD990]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v25 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Can not create context resolution result because home is nil", buf, 0xCu);
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
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDHomeLockNotificationManager *)self home];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 users];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __74__HMDHomeLockNotificationManager_contextResolutionResultFromHAPContextId___block_invoke;
    v22[3] = &unk_264A2DB60;
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
      v17 = (void *)MEMORY[0x230FBD990]();
      v18 = self;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v25 = v20;
        __int16 v26 = 2112;
        id v27 = v8;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Did not find any user with HAP contextId: %@", buf, 0x16u);
      }
      v12 = 0;
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x230FBD990]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v25 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Can not create context resolution result because home is nil", buf, 0xCu);
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
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDHomeLockNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDHomeLockNotificationManager *)self home];
  v7 = v6;
  if (v6)
  {
    id v8 = [v6 users];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __72__HMDHomeLockNotificationManager_contextResolutionResultFromAccessCode___block_invoke;
    v26[3] = &unk_264A2DB60;
    id v9 = v4;
    id v27 = v9;
    v10 = objc_msgSend(v8, "na_firstObjectPassingTest:", v26);

    if (v10)
    {
      v11 = [HMDHomeLockNotificationContextResolutionResult alloc];
      v12 = [v10 uuid];
      v13 = [(HMDHomeLockNotificationContextResolutionResult *)v11 initWithUserUUID:v12 label:0 labelIdentifier:0];
    }
    else
    {
      v18 = [v7 labelsByAccessCode];
      v12 = [v18 objectForKeyedSubscript:v9];

      if (v12)
      {
        v19 = [v7 labelIdentifiersByAccessCode];
        v20 = [v19 objectForKeyedSubscript:v9];

        v13 = [[HMDHomeLockNotificationContextResolutionResult alloc] initWithUserUUID:0 label:v12 labelIdentifier:v20];
      }
      else
      {
        v21 = (void *)MEMORY[0x230FBD990]();
        v22 = self;
        id v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v29 = v24;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Did not find any user or label with access code", buf, 0xCu);
        }
        v12 = 0;
        v13 = 0;
      }
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v29 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Can not create context resolution result from access code because home is nil", buf, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

uint64_t __72__HMDHomeLockNotificationManager_contextResolutionResultFromAccessCode___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 accessCode];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_resolveKeypadContextIdentifier:(id)a3 accessoryUUID:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(HMDHomeLockNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  v12 = [(HMDHomeLockNotificationManager *)self home];
  v13 = [v12 accessCodeManager];
  if (v13)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __91__HMDHomeLockNotificationManager__resolveKeypadContextIdentifier_accessoryUUID_completion___block_invoke;
    v19[3] = &unk_264A1ED08;
    v19[4] = self;
    id v20 = v10;
    [v13 fetchAccessCodeForIdentifier:v8 accessoryUUID:v9 completion:v19];
  }
  else
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v22 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Can not resolve notification context identifier because accessCodeManager is nil", buf, 0xCu);
    }
    v18 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
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
  v47[2] = *MEMORY[0x263EF8340];
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
    id v20 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];

    v21 = [[HMDRemoteMessage alloc] initWithName:@"HMDHomeResolveLockNotificationContextIdentifierMessage" destination:v18 payload:v20 type:0 timeout:1 secure:0.0];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke;
    v35[3] = &unk_264A2B910;
    v35[4] = self;
    id v33 = v10;
    id v37 = v10;
    id v22 = v8;
    id v23 = v8;
    id v36 = v23;
    v24 = (void *)MEMORY[0x230FBD990]([(HMDRemoteMessage *)v21 setResponseHandler:v35]);
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
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Sending message: %@ to primary resident: %@ to resolve notification context identifier: %@ ", buf, 0x2Au);
    }
    uint64_t v28 = [(HMDHomeLockNotificationManager *)v25 msgDispatcher];
    [v28 sendMessage:v21];

    id v8 = v22;
    id v10 = v33;
    id v9 = v34;
  }
  else
  {
    v29 = (void *)MEMORY[0x230FBD990]();
    uint64_t v30 = self;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v39 = v32;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Did not find primary resident to send message to resolve notification context identifier", buf, 0xCu);
    }
    v18 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*((void (**)(id, void, HMDRemoteDeviceMessageDestination *))v10 + 2))(v10, 0, v18);
  }
}

void __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v47[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_msgSend(v6, "hmf_dataForKey:", @"HMDHomeLockNotificationContextResolutionResultKey");
  if (v7)
  {
    id v35 = 0;
    id v8 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v35];
    id v9 = v35;
    id v10 = (void *)MEMORY[0x230FBD990]();
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
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Received notification context resolution result: %@ from resident for access code identifier: %@ with error: %@", buf, 0x2Au);

        id v5 = v14;
      }

      v17 = [*(id *)(a1 + 32) workQueue];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke_36;
      v29[3] = &unk_264A2F870;
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
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode notification context result from data: %@ decodingError: %@", buf, 0x20u);

        id v5 = v24;
      }

      if (v9)
      {
        uint64_t v46 = *MEMORY[0x263F08608];
        v47[0] = v9;
        __int16 v26 = [NSDictionary dictionaryWithObjects:v47 forKeys:&v46 count:1];
      }
      else
      {
        __int16 v26 = 0;
      }
      id v27 = [*(id *)(a1 + 32) workQueue];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke_35;
      v32[3] = &unk_264A2F870;
      id v28 = *(id *)(a1 + 48);
      id v33 = v26;
      id v34 = v28;
      id v18 = v26;
      dispatch_async(v27, v32);
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x230FBD990]();
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
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Missing notification context result key in response payload: %@ error: %@", buf, 0x20u);
    }
    id v23 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke_32;
    block[3] = &unk_264A2DFA0;
    id v37 = *(id *)(a1 + 48);
    dispatch_async(v23, block);

    id v9 = v37;
  }
}

void __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke_32(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke_35(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [MEMORY[0x263F087E8] hmErrorWithCode:-1 userInfo:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __116__HMDHomeLockNotificationManager__sendResolveLockNotificationContextIdentifierMessage_accessoryUUID_withCompletion___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)resolveKeypadContextIdentifier:(id)a3 accessoryUUID:(id)a4 withCompletion:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(HMDHomeLockNotificationManager *)self hasReachablePrimaryResidentSupportingLockNotificationContext])
  {
    id v11 = [(HMDHomeLockNotificationManager *)self workQueue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __94__HMDHomeLockNotificationManager_resolveKeypadContextIdentifier_accessoryUUID_withCompletion___block_invoke;
    v17[3] = &unk_264A2EE30;
    v17[4] = self;
    id v20 = v10;
    id v18 = v8;
    id v19 = v9;
    dispatch_async(v11, v17);
  }
  else
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v22 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Can not resolve keypad contextId because primary resident supporting lock notification context is not present", buf, 0xCu);
    }
    v16 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v16);
  }
}

void __94__HMDHomeLockNotificationManager_resolveKeypadContextIdentifier_accessoryUUID_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) home];
  v3 = v2;
  if (v2)
  {
    int v4 = [v2 isOwnerUser];
    id v5 = (void *)MEMORY[0x230FBD990]();
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
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Resolving keypad context identifier locally for access code identifier: %@ accessoryUUID: %@", buf, 0x20u);
      }
      v12 = *(void **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __94__HMDHomeLockNotificationManager_resolveKeypadContextIdentifier_accessoryUUID_withCompletion___block_invoke_27;
      v29[3] = &unk_264A1ECE0;
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
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Resolving keypad context identifier via resident for access code identifier: %@ accessoryUUID: %@", buf, 0x20u);
      }
      id v24 = *(void **)(a1 + 32);
      uint64_t v25 = *(void *)(a1 + 40);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __94__HMDHomeLockNotificationManager_resolveKeypadContextIdentifier_accessoryUUID_withCompletion___block_invoke_28;
      v27[3] = &unk_264A1ECE0;
      uint64_t v26 = *(void *)(a1 + 48);
      id v28 = *(id *)(a1 + 56);
      [v24 _sendResolveLockNotificationContextIdentifierMessage:v25 accessoryUUID:v26 withCompletion:v27];
      v15 = v28;
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = *(id *)(a1 + 32);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v32 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Can not resolve keypad contextId because home is nil", buf, 0xCu);
    }
    uint64_t v20 = *(void *)(a1 + 56);
    v15 = [MEMORY[0x263F087E8] hmErrorWithCode:17];
    (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v15);
  }
}

uint64_t __94__HMDHomeLockNotificationManager_resolveKeypadContextIdentifier_accessoryUUID_withCompletion___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __94__HMDHomeLockNotificationManager_resolveKeypadContextIdentifier_accessoryUUID_withCompletion___block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)displayNameForNotificationContextResolutionResult:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeLockNotificationManager *)self home];
  if (!v5)
  {
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
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
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, v14, buf, v16);
    }
LABEL_12:

    id v9 = 0;
    goto LABEL_13;
  }
  if (![(HMDHomeLockNotificationManager *)self hasReachablePrimaryResidentSupportingLockNotificationContext])
  {
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
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
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __84__HMDHomeLockNotificationManager_displayNameForNotificationContextResolutionResult___block_invoke;
    v19[3] = &unk_264A2DB60;
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
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
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
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v32 = 0;
  uint64_t v11 = [MEMORY[0x263F358E0] parsedFromData:v8 error:&v32];
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
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          v30[2] = __107__HMDHomeLockNotificationManager_resolveEncodedCharacteristicNotificationContext_accessoryUUID_completion___block_invoke;
          v30[3] = &unk_264A1ECE0;
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
      uint64_t v22 = (void *)MEMORY[0x230FBD990]();
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
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Invalid source %ld present in notification context", buf, 0x16u);

        uint64_t v22 = v29;
      }
    }
    else
    {
      uint64_t v22 = (void *)MEMORY[0x230FBD990]();
      __int16 v23 = self;
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v34 = v25;
        __int16 v35 = 2112;
        uint64_t v36 = (uint64_t)v8;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Failed to decode notification context identifier from data:%@", buf, 0x16u);
      }
    }

    uint64_t v26 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v26);
    goto LABEL_20;
  }
  id v18 = (void *)MEMORY[0x230FBD990]();
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
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse notification context TLV from context:%@ error:%@", buf, 0x20u);
  }
  uint64_t v14 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
  (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
LABEL_21:
}

uint64_t __107__HMDHomeLockNotificationManager_resolveEncodedCharacteristicNotificationContext_accessoryUUID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleResolveNotificationContextIdentifierMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMDHomeLockNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v9;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling message: %@ to resolve notification context identifier", buf, 0x16u);
  }
  id v10 = [v4 numberForKey:@"HMDHomeResolveLockNotificationContextIdentifierMessageAccessCodeIdentifierKey"];
  uint64_t v11 = [v4 uuidForKey:@"HMDHomeResolveLockNotificationContextIdentifierMessage"];
  id v12 = (void *)v11;
  if (v10 && v11)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __84__HMDHomeLockNotificationManager_handleResolveNotificationContextIdentifierMessage___block_invoke;
    v18[3] = &unk_264A1ECB8;
    v18[4] = v7;
    id v19 = v10;
    id v20 = v4;
    [(HMDHomeLockNotificationManager *)v7 _resolveKeypadContextIdentifier:v19 accessoryUUID:v12 completion:v18];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
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
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Received invalid parameters in message to resolve lock notification context for identifier: %@ accessoryUUID: %@", buf, 0x20u);
    }
    uint64_t v17 = [MEMORY[0x263F087E8] hmErrorWithCode:3 userInfo:0];
    [v4 respondWithError:v17];
  }
}

void __84__HMDHomeLockNotificationManager_handleResolveNotificationContextIdentifierMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
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
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Resolved notification context identifier: %@ to result: %@ with error: %@", buf, 0x2Au);
  }
  if (v5)
  {
    id v28 = 0;
    id v12 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v28];
    id v13 = v28;
    uint64_t v14 = v13;
    if (v12)
    {
      v29 = @"HMDHomeLockNotificationContextResolutionResultKey";
      id v30 = v12;
      v15 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      [*(id *)(a1 + 48) respondWithPayload:v15];
    }
    else
    {
      if (v13)
      {
        uint64_t v31 = *MEMORY[0x263F08608];
        id v32 = v13;
        v15 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      }
      else
      {
        v15 = 0;
      }
      v21 = [MEMORY[0x263F087E8] hmErrorWithCode:-1 userInfo:v15];
      uint64_t v22 = (void *)MEMORY[0x230FBD990]();
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
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Responding to resolve notification context identifier message: %@ with: %@", buf, 0x20u);

        uint64_t v22 = v27;
      }

      [*(id *)(a1 + 48) respondWithError:v21];
    }
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F087E8] hmErrorWithCode:-1 userInfo:0];
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
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
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Responding to resolve notification context identifier message: %@ with: %@", buf, 0x20u);
    }
    [*(id *)(a1 + 48) respondWithError:v14];
  }
}

- (BOOL)shouldResolveNotificationContextForCharacteristic:(id)a3
{
  id v3 = a3;
  id v4 = [v3 type];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F0C0B0]];

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
  uint64_t v15 = *MEMORY[0x263EF8340];
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
    id v8 = (void *)MEMORY[0x230FBD990]();
    BOOL v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Primary resident is not available", (uint8_t *)&v13, 0xCu);
    }
    char v7 = 0;
  }

  return v7;
}

- (void)configureWithHome:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  char v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v8;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring with home: %@", buf, 0x16u);
  }
  [(HMDHomeLockNotificationManager *)v6 setHome:v4];
  BOOL v9 = [v4 msgDispatcher];
  [(HMDHomeLockNotificationManager *)v6 setMsgDispatcher:v9];

  id v10 = [(HMDHomeLockNotificationManager *)v6 dataSource];
  int v11 = [v10 isResidentCapable];

  if (v11)
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    int v13 = v6;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Registering for lock notifications messages", buf, 0xCu);
    }
    uint64_t v16 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
    objc_msgSend(v16, "setRoles:", objc_msgSend(v16, "roles") | 4);
    id v17 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:5 remoteAccessRequired:0];
    id v18 = [(HMDHomeLockNotificationManager *)v13 msgDispatcher];
    v20[0] = v17;
    v20[1] = v16;
    id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
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
    dispatch_once(&logCategory__hmf_once_t30, &__block_literal_global_111621);
  }
  id v2 = (void *)logCategory__hmf_once_v31;
  return v2;
}

void __45__HMDHomeLockNotificationManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v31;
  logCategory__hmf_once_uint64_t v31 = v0;
}

- (void)sendLockUserChangeEventNotification:(id)a3 lockDataType:(unsigned __int8)a4 accessory:(id)a5 dataOperationType:(unsigned __int8)a6 fabricIndex:(id)a7 flow:(id)a8
{
  uint64_t v10 = a6;
  uint64_t v12 = a4;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = [v15 home];
  id v19 = v18;
  if (v18)
  {
    if (v14)
    {
      uint64_t v20 = [v18 users];
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __134__HMDHomeLockNotificationManager_CHIP__sendLockUserChangeEventNotification_lockDataType_accessory_dataOperationType_fabricIndex_flow___block_invoke;
      v42[3] = &unk_264A2DB60;
      id v43 = v14;
      v21 = objc_msgSend(v20, "na_firstObjectPassingTest:", v42);
    }
    else
    {
      v21 = 0;
    }
    uint64_t v27 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v14);
    id v28 = [NSNumber numberWithUnsignedChar:v12];
    [v27 setObject:v28 forKeyedSubscript:@"HMDCharacteristicEventReportMessageKeyLockDataType"];

    v29 = [NSNumber numberWithUnsignedChar:v10];
    [v27 setObject:v29 forKeyedSubscript:@"HMDCharacteristicEventReportMessageKeyDataOperationType"];

    if (v16)
    {
      id v30 = [(id)objc_opt_class() findEcosystemName:v16];
      [v27 setObject:v30 forKeyedSubscript:@"HMDCharacteristicEventReportMessageKeyEcosystemName"];
    }
    uint64_t v31 = HMFEncodedRootObject();
    [v27 setObject:v31 forKeyedSubscript:*MEMORY[0x263F42000]];

    id v32 = [v19 users];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __134__HMDHomeLockNotificationManager_CHIP__sendLockUserChangeEventNotification_lockDataType_accessory_dataOperationType_fabricIndex_flow___block_invoke_2;
    v36[3] = &unk_264A22450;
    v36[4] = self;
    id v37 = v17;
    id v38 = v27;
    char v41 = v10;
    id v39 = v21;
    id v40 = v15;
    id v33 = v21;
    id v34 = v27;
    objc_msgSend(v32, "na_each:", v36);

    id v14 = v35;
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x230FBD990]();
    __int16 v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      uint64_t v26 = [v17 UUID];
      *(_DWORD *)buf = 138543618;
      id v45 = v25;
      __int16 v46 = 2112;
      v47 = v26;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Error sending message for Matter Accessory Bulletin Notification, home is nil.", buf, 0x16u);
    }
  }
}

uint64_t __134__HMDHomeLockNotificationManager_CHIP__sendLockUserChangeEventNotification_lockDataType_accessory_dataOperationType_fabricIndex_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIDForAccessories];
  uint64_t v4 = [v3 isEqualToNumber:*(void *)(a1 + 32)];

  return v4;
}

void __134__HMDHomeLockNotificationManager_CHIP__sendLockUserChangeEventNotification_lockDataType_accessory_dataOperationType_fabricIndex_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 isAccessCurrentlyAllowedBySchedule])
  {
    uint64_t v4 = (void *)[*(id *)(a1 + 48) mutableCopy];
    if (*(unsigned char *)(a1 + 72) || [v3 isAdministrator])
    {
      int v5 = *(void **)(a1 + 56);
      if (!v5) {
        goto LABEL_10;
      }
      id v6 = [v5 account];
      id v7 = [v6 identifier];
      id v8 = [v7 identifier];
      id v9 = [v3 account];
      uint64_t v10 = [v9 identifier];
      int v11 = [v10 identifier];
      int v12 = objc_msgSend(v8, "hmf_isEqualToUUID:", v11);

      if (v12)
      {
        [v4 setObject:&unk_26E472310 forKeyedSubscript:@"HMDCharacteristicEventReportMessageKeyIsAffectedUser"];
      }
      else
      {
LABEL_10:
        if (*(unsigned char *)(a1 + 72) == 1)
        {
          id v18 = (void *)MEMORY[0x230FBD990]();
          id v19 = *(id *)(a1 + 32);
          uint64_t v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v21 = HMFGetLogIdentifier();
            uint64_t v22 = [*(id *)(a1 + 40) UUID];
            *(_DWORD *)buf = 138543618;
            uint64_t v48 = v21;
            __int16 v49 = 2112;
            v50 = v22;
            _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not inserting lock user change bulletin because dataOperationType is of type MTRDoorLockDataOperationTypeClear and user is not the affected user.", buf, 0x16u);
          }
          goto LABEL_22;
        }
      }
      __int16 v23 = [v3 accountHandle];
      if (v23)
      {
        id v24 = [HMDRemoteAccountMessageDestination alloc];
        uint64_t v25 = [*(id *)(a1 + 64) messageTargetUUID];
        uint64_t v26 = [(HMDRemoteAccountMessageDestination *)v24 initWithTarget:v25 handle:v23 multicast:1];

        __int16 v46 = v4;
        uint64_t v27 = (void *)[objc_alloc(MEMORY[0x263F42568]) initWithName:@"HMDCharacteristicEventReportMessage" destination:v26 payload:v4];
        id v28 = (void *)MEMORY[0x230FBD990]();
        id v29 = *(id *)(a1 + 32);
        id v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          uint64_t v31 = HMFGetLogIdentifier();
          [*(id *)(a1 + 40) UUID];
          v32 = id v43 = v23;
          id v33 = [*(id *)(a1 + 64) messageTargetUUID];
          [v3 account];
          id v34 = v45 = v26;
          [v34 identifier];
          v35 = __int16 v44 = v28;
          *(_DWORD *)buf = 138544386;
          uint64_t v48 = v31;
          __int16 v49 = 2112;
          v50 = v32;
          __int16 v51 = 2112;
          v52 = v33;
          __int16 v53 = 2112;
          v54 = v35;
          __int16 v55 = 2112;
          v56 = v46;
          _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Sending HMDCharacteristicEventReportMessage to target=%@ for account=%@ with payload=%@", buf, 0x34u);

          id v28 = v44;
          uint64_t v26 = v45;

          __int16 v23 = v43;
        }

        uint64_t v36 = [*(id *)(a1 + 64) msgDispatcher];
        [v36 sendMessage:v27];

        uint64_t v4 = v46;
      }
      else
      {
        id v37 = (void *)MEMORY[0x230FBD990]();
        id v38 = *(id *)(a1 + 32);
        id v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          id v40 = HMFGetLogIdentifier();
          char v41 = [*(id *)(a1 + 40) UUID];
          __int16 v42 = [v3 shortDescription];
          *(_DWORD *)buf = 138543874;
          uint64_t v48 = v40;
          __int16 v49 = 2112;
          v50 = v41;
          __int16 v51 = 2112;
          v52 = v42;
          _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Cannot send lock user change event notification because no account handle was found for user: %@", buf, 0x20u);
        }
      }
    }
LABEL_22:

    goto LABEL_23;
  }
  int v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = *(id *)(a1 + 32);
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = HMFGetLogIdentifier();
    id v17 = [*(id *)(a1 + 40) UUID];
    *(_DWORD *)buf = 138543618;
    uint64_t v48 = v16;
    __int16 v49 = 2112;
    v50 = v17;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Cannot send the notification as the user is outside schedule", buf, 0x16u);
  }
LABEL_23:
}

- (void)sendDoorLockAlarmEventNotification:(id)a3 accessory:(id)a4 flow:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v9 home];
  if (v11)
  {
    int v12 = [MEMORY[0x263EFF9A0] dictionary];
    [v12 setObject:v8 forKeyedSubscript:@"HMDCharacteristicEventReportMessageKeyAlarmCode"];
    int v13 = HMFEncodedRootObject();
    [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x263F42000]];

    id v14 = [v9 findCharacteristicType:*MEMORY[0x263F0C0B0] forServiceType:*MEMORY[0x263F0D798]];
    if (v14)
    {
      id v15 = [v11 accessoryBulletinNotificationManager];
      __int16 v44 = v14;
      id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
      [v15 characteristicsByDestinationForCharacteristics:v16];
      uint64_t v36 = self;
      id v17 = v12;
      id v18 = v9;
      id v19 = v11;
      uint64_t v20 = v14;
      id v21 = v10;
      __int16 v23 = v22 = v8;
      id v24 = [v23 allKeys];

      id v8 = v22;
      id v10 = v21;
      id v14 = v20;
      int v11 = v19;
      id v9 = v18;
      int v12 = v17;

      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __90__HMDHomeLockNotificationManager_CHIP__sendDoorLockAlarmEventNotification_accessory_flow___block_invoke;
      v38[3] = &unk_264A22428;
      id v39 = v9;
      id v40 = v17;
      id v41 = v11;
      __int16 v42 = v36;
      id v43 = v10;
      objc_msgSend(v24, "na_each:", v38);
    }
    else
    {
      id v30 = (void *)MEMORY[0x230FBD990]();
      uint64_t v31 = self;
      id v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        __int16 v35 = HMFGetLogIdentifier();
        [v10 UUID];
        id v33 = v37 = v30;
        [v9 uuid];
        *(_DWORD *)buf = 138543874;
        __int16 v46 = v35;
        __int16 v47 = 2112;
        uint64_t v48 = v33;
        v50 = __int16 v49 = 2112;
        id v34 = (void *)v50;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] There is no HMCharacteristicTypeCurrentLockMechanismState characteristic on this accessory %@", buf, 0x20u);

        id v30 = v37;
      }
    }
  }
  else
  {
    uint64_t v25 = (void *)MEMORY[0x230FBD990]();
    uint64_t v26 = self;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = HMFGetLogIdentifier();
      id v29 = [v10 UUID];
      *(_DWORD *)buf = 138543618;
      __int16 v46 = v28;
      __int16 v47 = 2112;
      uint64_t v48 = v29;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Error sending message for Matter Accessory Bulletin Notification, home is nil.", buf, 0x16u);
    }
  }
}

void __90__HMDHomeLockNotificationManager_CHIP__sendDoorLockAlarmEventNotification_accessory_flow___block_invoke(id *a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = +[HMDDeviceHandle deviceHandleForDestination:v3];
  int v5 = +[HMDAccountRegistry sharedRegistry];
  id v6 = [v5 deviceForHandle:v4];

  id v7 = [HMDRemoteDeviceMessageDestination alloc];
  id v8 = [a1[4] messageTargetUUID];
  id v9 = [(HMDRemoteDeviceMessageDestination *)v7 initWithTarget:v8 device:v6];

  id v10 = [HMDRemoteMessage alloc];
  int v11 = (void *)[a1[5] copy];
  int v12 = [(HMDRemoteMessage *)v10 initWithName:@"HMDCharacteristicEventReportMessage" destination:v9 payload:v11];

  int v13 = [a1[6] primaryResident];
  id v14 = [v13 device];
  int v15 = [v14 isEqual:v6];

  id v16 = (void *)MEMORY[0x230FBD990]();
  id v17 = a1[7];
  id v18 = HMFGetOSLogHandle();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
  if (v15)
  {
    if (v19)
    {
      uint64_t v20 = HMFGetLogIdentifier();
      [a1[8] UUID];
      v21 = uint64_t v31 = v4;
      id v22 = a1[5];
      *(_DWORD *)buf = 138543874;
      id v34 = v20;
      __int16 v35 = 2112;
      uint64_t v36 = v21;
      __int16 v37 = 2112;
      id v38 = v22;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Calling handleCharacteristicEventReportMessage (Showing notification on THIS Apple TV) with payload=%@", buf, 0x20u);

      uint64_t v4 = v31;
    }

    [a1[4] handleCharacteristicEventReportMessage:v12];
  }
  else
  {
    id v32 = v4;
    if (v19)
    {
      __int16 v23 = HMFGetLogIdentifier();
      [a1[8] UUID];
      id v24 = v29 = v9;
      uint64_t v25 = [a1[4] messageTargetUUID];
      [v6 identifier];
      uint64_t v26 = v30 = v3;
      id v27 = a1[5];
      *(_DWORD *)buf = 138544386;
      id v34 = v23;
      __int16 v35 = 2112;
      uint64_t v36 = v24;
      __int16 v37 = 2112;
      id v38 = v25;
      __int16 v39 = 2112;
      id v40 = v26;
      __int16 v41 = 2112;
      id v42 = v27;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Sending HMDCharacteristicEventReportMessage to target=%@ for device=%@ with payload=%@", buf, 0x34u);

      id v3 = v30;
      id v9 = v29;
    }
    id v28 = [a1[4] msgDispatcher];
    [v28 sendMessage:v12];

    uint64_t v4 = v32;
  }
}

- (void)sendLockOperationEventNotification:(id)a3 userUniqueID:(id)a4 lockOperationType:(id)a5 lockOperationSource:(id)a6 fabricIndex:(id)a7 accessory:(id)a8 timestamp:(id)a9 flow:(id)a10
{
  uint64_t v145 = *MEMORY[0x263EF8340];
  id v117 = a3;
  id v114 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v116 = v18;
  id v21 = [v18 home];
  if (v21)
  {
    unint64_t v22 = 0x263EFF000uLL;
    __int16 v23 = [MEMORY[0x263EFF9A0] dictionary];
    [v23 setObject:v15 forKeyedSubscript:@"HMDCharacteristicEventReportMessageKeyOperationType"];
    id v24 = HMFEncodedRootObject();
    v110 = v23;
    [v23 setObject:v24 forKeyedSubscript:*MEMORY[0x263F42000]];

    id v109 = v17;
    if ([v16 isEqualToNumber:&unk_26E4722F8])
    {
      if (v17)
      {
        uint64_t v25 = [(id)objc_opt_class() findEcosystemName:v17];
        [v23 setObject:v25 forKeyedSubscript:@"HMDCharacteristicEventReportMessageKeyEcosystemName"];
      }
      else
      {
        uint64_t v36 = (void *)MEMORY[0x230FBD990]();
        __int16 v37 = self;
        id v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v111 = v19;
          id v40 = v39 = v16;
          [v20 UUID];
          id v42 = v41 = v21;
          *(_DWORD *)buf = 138543874;
          v130 = v40;
          __int16 v131 = 2112;
          uint64_t v132 = (uint64_t)v42;
          __int16 v133 = 2112;
          uint64_t v134 = (uint64_t)v39;
          _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Lock Operation Source = %@, which is Remote, and fabric index is null. This is an error (most likely with the lock firmware). The fabric index should never be null when the operation source is Remote, according to the Matter spec.", buf, 0x20u);

          id v21 = v41;
          id v16 = v39;
          id v19 = v111;
        }
      }
    }
    if (v117)
    {
      uint64_t v43 = (void *)MEMORY[0x230FBD990]();
      __int16 v44 = self;
      id v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        __int16 v46 = v102 = v16;
        [v20 UUID];
        id v112 = v19;
        id v47 = v15;
        v49 = uint64_t v48 = v21;
        uint64_t v50 = [v117 uuid];
        *(_DWORD *)buf = 138543874;
        v130 = v46;
        __int16 v131 = 2112;
        uint64_t v132 = (uint64_t)v49;
        __int16 v133 = 2112;
        uint64_t v134 = (uint64_t)v50;
        _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Matched user uuid=%@", buf, 0x20u);

        id v21 = v48;
        id v15 = v47;
        id v19 = v112;

        id v16 = v102;
      }

      v113 = 0;
      uint64_t v51 = 0;
    }
    else if (v114)
    {
      v52 = objc_msgSend(v21, "accessCodeForMatterUserWithUserUniqueID:");
      v107 = v52;
      if ([v52 length])
      {
        __int16 v53 = [v21 labelsByAccessCode];
        uint64_t v51 = [v53 objectForKeyedSubscript:v52];

        v54 = [v21 labelIdentifiersByAccessCode];
        v113 = [v54 objectForKeyedSubscript:v52];

        uint64_t v105 = MEMORY[0x230FBD990]();
        __int16 v55 = self;
        v56 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          v104 = HMFGetLogIdentifier();
          uint64_t v57 = [v20 UUID];
          *(_DWORD *)buf = 138545155;
          v130 = v104;
          __int16 v131 = 2112;
          uint64_t v132 = v57;
          v58 = (void *)v57;
          __int16 v133 = 2160;
          uint64_t v134 = 1752392040;
          __int16 v135 = 2112;
          id v136 = v114;
          __int16 v137 = 2113;
          v138 = v52;
          __int16 v139 = 2113;
          uint64_t v140 = v51;
          __int16 v141 = 2160;
          uint64_t v142 = 1752392040;
          __int16 v143 = 2112;
          v144 = v113;
          _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Matched userUniqueID %{mask.hash}@ to guest access code %{private}@ ('%{private}@', %{mask.hash}@)", buf, 0x52u);
        }
        v59 = (void *)v105;
      }
      else
      {
        v59 = (void *)MEMORY[0x230FBD990]();
        v70 = self;
        v56 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v72 = v71 = v59;
          v73 = [v20 UUID];
          *(_DWORD *)buf = 138544130;
          v130 = v72;
          __int16 v131 = 2112;
          uint64_t v132 = (uint64_t)v73;
          __int16 v133 = 2160;
          uint64_t v134 = 1752392040;
          __int16 v135 = 2112;
          id v136 = v114;
          _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Could not match userUniqueID %{mask.hash}@ to any user", buf, 0x2Au);

          v59 = v71;
        }
        v113 = 0;
        uint64_t v51 = 0;
      }
    }
    else
    {
      v60 = (void *)MEMORY[0x230FBD990]();
      v61 = self;
      v62 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        v63 = HMFGetLogIdentifier();
        [v20 UUID];
        id v64 = v15;
        v65 = v21;
        id v66 = v20;
        id v67 = v19;
        v69 = id v68 = v16;
        *(_DWORD *)buf = 138543618;
        v130 = v63;
        __int16 v131 = 2112;
        uint64_t v132 = (uint64_t)v69;
        _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] No user or userUniqueID to match to.", buf, 0x16u);

        id v16 = v68;
        id v19 = v67;
        id v20 = v66;
        id v21 = v65;
        id v15 = v64;
      }
      v113 = 0;
      uint64_t v51 = 0;
      unint64_t v22 = 0x263EFF000;
    }
    v74 = *(void **)(v22 + 2464);
    v127[0] = @"HMDAccessoryMatterLockOperationTypeNotificationKey";
    v127[1] = @"HMDAccessoryMatterLockOperationSourceNotificationKey";
    v128[0] = v15;
    v128[1] = v16;
    v127[2] = @"HMDAccessoryMatterLockOperationDateNotificationKey";
    v128[2] = v19;
    v75 = [NSDictionary dictionaryWithObjects:v128 forKeys:v127 count:3];
    v76 = [v74 dictionaryWithDictionary:v75];

    if (v117)
    {
      v77 = [v117 uuid];
      [v76 setObject:v77 forKeyedSubscript:@"HMDAccessoryMatterLockUserUUIDNotificationKey"];
    }
    else if (v113)
    {
      [v76 setObject:v113 forKeyedSubscript:@"HMDAccessoryMatterLockLabelIdentifierNotificationKey"];
    }
    v108 = (void *)v51;
    v78 = (void *)[v76 copy];
    logAndPostNotification(@"HMDAccessoryMatterLockStateChangedNotification", v116, v78);

    uint64_t v79 = [v116 findCharacteristicType:*MEMORY[0x263F0C0B0] forServiceType:*MEMORY[0x263F0D798]];
    v106 = (void *)v79;
    if (v79)
    {
      uint64_t v80 = v79;
      v81 = [v21 accessoryBulletinNotificationManager];
      uint64_t v126 = v80;
      v82 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v126 count:1];
      [v81 characteristicsByDestinationForCharacteristics:v82];
      id v83 = v15;
      v84 = v21;
      id v85 = v20;
      id v86 = v19;
      v88 = id v87 = v16;
      v89 = [v88 allKeys];

      id v16 = v87;
      id v19 = v86;
      id v20 = v85;
      id v21 = v84;
      id v15 = v83;

      v118[0] = MEMORY[0x263EF8330];
      v118[1] = 3221225472;
      v118[2] = __163__HMDHomeLockNotificationManager_CHIP__sendLockOperationEventNotification_userUniqueID_lockOperationType_lockOperationSource_fabricIndex_accessory_timestamp_flow___block_invoke;
      v118[3] = &unk_264A22400;
      id v119 = v117;
      v90 = v110;
      id v120 = v110;
      id v121 = v21;
      v91 = v108;
      id v122 = v108;
      id v123 = v116;
      v124 = self;
      id v125 = v20;
      objc_msgSend(v89, "na_each:", v118);

      v92 = v106;
      __int16 v35 = v114;
      uint64_t v26 = v109;
    }
    else
    {
      v101 = v21;
      v93 = (void *)MEMORY[0x230FBD990]();
      v94 = self;
      v95 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
      {
        v96 = HMFGetLogIdentifier();
        [v20 UUID];
        v97 = id v103 = v16;
        [v116 uuid];
        id v98 = v20;
        v100 = id v99 = v19;
        *(_DWORD *)buf = 138543874;
        v130 = v96;
        __int16 v131 = 2112;
        uint64_t v132 = (uint64_t)v97;
        __int16 v133 = 2112;
        uint64_t v134 = (uint64_t)v100;
        _os_log_impl(&dword_22F52A000, v95, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] There is no HMCharacteristicTypeCurrentLockMechanismState characteristic on this accessory %@", buf, 0x20u);

        id v19 = v99;
        id v20 = v98;

        id v16 = v103;
      }

      __int16 v35 = v114;
      v92 = 0;
      uint64_t v26 = v109;
      v90 = v110;
      id v21 = v101;
      v91 = v108;
    }
  }
  else
  {
    uint64_t v26 = v17;
    id v27 = (void *)MEMORY[0x230FBD990]();
    id v28 = self;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v30 = HMFGetLogIdentifier();
      [v20 UUID];
      id v31 = v20;
      id v32 = v19;
      v34 = id v33 = v16;
      *(_DWORD *)buf = 138543618;
      v130 = v30;
      __int16 v131 = 2112;
      uint64_t v132 = (uint64_t)v34;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Error sending message for Matter Accessory Bulletin Notification, home is nil.", buf, 0x16u);

      id v16 = v33;
      id v19 = v32;
      id v20 = v31;
      id v21 = 0;
    }
    __int16 v35 = v114;
  }
}

void __163__HMDHomeLockNotificationManager_CHIP__sendLockOperationEventNotification_userUniqueID_lockOperationType_lockOperationSource_fabricIndex_accessory_timestamp_flow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v47 = a2;
  uint64_t v3 = +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:");
  uint64_t v4 = +[HMDAccountRegistry sharedRegistry];
  __int16 v46 = (void *)v3;
  int v5 = [v4 deviceForHandle:v3];

  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id v7 = [v6 account];
    id v8 = [v7 identifier];
    id v9 = [v8 identifier];
    id v10 = [v5 account];
    int v11 = [v10 identifier];
    int v12 = [v11 identifier];
    if (objc_msgSend(v9, "hmf_isEqualToUUID:", v12))
    {
      [v5 productInfo];
      id v14 = v13 = v5;
      uint64_t v15 = [v14 productClass];

      int v5 = v13;
      if (v15 != 4) {
        goto LABEL_21;
      }
    }
    else
    {
    }
  }
  id v16 = (void *)[*(id *)(a1 + 40) mutableCopy];
  id v17 = [*(id *)(a1 + 48) users];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __163__HMDHomeLockNotificationManager_CHIP__sendLockOperationEventNotification_userUniqueID_lockOperationType_lockOperationSource_fabricIndex_accessory_timestamp_flow___block_invoke_2;
  v48[3] = &unk_264A2DB60;
  id v45 = v5;
  id v18 = v5;
  id v49 = v18;
  id v19 = objc_msgSend(v17, "na_firstObjectPassingTest:", v48);

  id v20 = *(void **)(a1 + 32);
  if (v20 && (([v20 isOwner] & 1) != 0 || objc_msgSend(v19, "isAdministrator")))
  {
    id v21 = [*(id *)(a1 + 32) uuid];
    unint64_t v22 = [v21 UUIDString];
    [v16 setObject:v22 forKeyedSubscript:@"HMDCharacteristicEventReportMessageKeyUserUUID"];
  }
  else if (*(void *)(a1 + 56) && [v19 isAdministrator])
  {
    [v16 setObject:*(void *)(a1 + 56) forKeyedSubscript:@"HMDCharacteristicEventReportMessageKeyGuestName"];
  }
  __int16 v23 = [HMDRemoteDeviceMessageDestination alloc];
  id v24 = [*(id *)(a1 + 64) messageTargetUUID];
  uint64_t v25 = [(HMDRemoteDeviceMessageDestination *)v23 initWithTarget:v24 device:v18];

  uint64_t v26 = [HMDRemoteMessage alloc];
  id v27 = (void *)[v16 copy];
  id v28 = [(HMDRemoteMessage *)v26 initWithName:@"HMDCharacteristicEventReportMessage" destination:v25 payload:v27];

  id v29 = [*(id *)(a1 + 48) primaryResident];
  id v30 = [v29 device];
  int v31 = [v30 isEqual:v18];

  id v32 = (void *)MEMORY[0x230FBD990]();
  id v33 = *(id *)(a1 + 72);
  id v34 = HMFGetOSLogHandle();
  BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
  if (v31)
  {
    if (v35)
    {
      uint64_t v36 = HMFGetLogIdentifier();
      __int16 v37 = [*(id *)(a1 + 80) UUID];
      *(_DWORD *)buf = 138543874;
      uint64_t v51 = v36;
      __int16 v52 = 2112;
      __int16 v53 = v37;
      __int16 v54 = 2112;
      __int16 v55 = v16;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Calling handleCharacteristicEventReportMessage (Showing notification on THIS Apple TV) with payload=%@", buf, 0x20u);
    }
    [*(id *)(a1 + 64) handleCharacteristicEventReportMessage:v28];
  }
  else
  {
    if (v35)
    {
      HMFGetLogIdentifier();
      v38 = __int16 v44 = v16;
      [*(id *)(a1 + 80) UUID];
      v39 = uint64_t v43 = v19;
      id v40 = [*(id *)(a1 + 64) messageTargetUUID];
      __int16 v41 = [v18 identifier];
      *(_DWORD *)buf = 138544386;
      uint64_t v51 = v38;
      __int16 v52 = 2112;
      __int16 v53 = v39;
      __int16 v54 = 2112;
      __int16 v55 = v40;
      __int16 v56 = 2112;
      uint64_t v57 = v41;
      __int16 v58 = 2112;
      v59 = v44;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Sending HMDCharacteristicEventReportMessage to target=%@ for device=%@ with payload=%@", buf, 0x34u);

      id v19 = v43;
      id v16 = v44;
    }

    id v42 = [*(id *)(a1 + 64) msgDispatcher];
    [v42 sendMessage:v28];
  }
  int v5 = v45;

LABEL_21:
}

uint64_t __163__HMDHomeLockNotificationManager_CHIP__sendLockOperationEventNotification_userUniqueID_lockOperationType_lockOperationSource_fabricIndex_accessory_timestamp_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 account];
  uint64_t v4 = [v3 identifier];
  int v5 = [v4 identifier];
  id v6 = [*(id *)(a1 + 32) account];
  id v7 = [v6 identifier];
  id v8 = [v7 identifier];
  uint64_t v9 = objc_msgSend(v5, "hmf_isEqualToUUID:", v8);

  return v9;
}

- (void)handleLockUserChangeEvent:(id)a3 forAccessory:(id)a4 flow:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v8 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v12 = v11;
  }
  else {
    int v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    id v14 = [v13 dataOperationType];
    uint64_t v15 = [v14 integerValue];

    if (v15 != 2)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v43 = 0;
      __int16 v23 = [v13 lockDataType];
      char v24 = [v23 integerValue];

      char v43 = v24;
      uint64_t v25 = [v13 dataOperationType];
      LOBYTE(v23) = [v25 integerValue];

      uint64_t v26 = [v13 dataIndex];
      char v27 = [v26 isEqualToNumber:&unk_26E4722E0];

      id v28 = objc_alloc(MEMORY[0x263F42520]);
      id v29 = [(HMDHomeLockNotificationManager *)self workQueue];
      id v30 = (void *)[v28 initWithQueue:v29];

      int v31 = [v9 chipAccessoryServer];
      id v32 = [v31 createDoorLockClusterObjectWithFlow:v10];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __84__HMDHomeLockNotificationManager_CHIP__handleLockUserChangeEvent_forAccessory_flow___block_invoke;
      v34[3] = &unk_264A223B8;
      id v35 = v13;
      uint64_t v36 = self;
      id v37 = v10;
      id v39 = buf;
      char v40 = v27;
      id v38 = v9;
      char v41 = (char)v23;
      id v33 = (id)[v32 inContext:v30 then:v34 orRecover:&__block_literal_global_155951];

      _Block_object_dispose(buf, 8);
      goto LABEL_13;
    }
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      id v20 = [v10 UUID];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not inserting lock user change bulletin because dataOperationType is not of type MTRDoorLockDataOperationTypeClear or MTRDoorLockDataOperationTypeAdd (we are not clearing or adding the credential, we are modifying it).", buf, 0x16u);
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      unint64_t v22 = [v10 UUID];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v22;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Cannot insert lock user change bulletin because eventReport.value is not a MTRDoorLockClusterLockUserChangeEvent.", buf, 0x16u);
    }
  }

LABEL_13:
}

uint64_t __84__HMDHomeLockNotificationManager_CHIP__handleLockUserChangeEvent_forAccessory_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 fetchCurrentFabricIndex];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __84__HMDHomeLockNotificationManager_CHIP__handleLockUserChangeEvent_forAccessory_flow___block_invoke_2;
  v23[3] = &unk_264A22368;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  id v24 = v5;
  uint64_t v25 = v6;
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 64);
  id v26 = v8;
  uint64_t v28 = v9;
  char v29 = *(unsigned char *)(a1 + 72);
  id v10 = v3;
  id v27 = v10;
  int v11 = [v4 then:v23];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __84__HMDHomeLockNotificationManager_CHIP__handleLockUserChangeEvent_forAccessory_flow___block_invoke_96;
  v17[3] = &unk_264A22390;
  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = *(void **)(a1 + 48);
  uint64_t v21 = *(void *)(a1 + 64);
  v17[4] = v12;
  id v18 = v13;
  id v19 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 32);
  __int16 v22 = *(_WORD *)(a1 + 72);
  id v14 = [v11 then:v17];
  if (v14)
  {
    uint64_t v15 = v14;

    return 3;
  }
  else
  {
    _HMFPreconditionFailure();
    return __84__HMDHomeLockNotificationManager_CHIP__handleLockUserChangeEvent_forAccessory_flow___block_invoke_97();
  }
}

uint64_t __84__HMDHomeLockNotificationManager_CHIP__handleLockUserChangeEvent_forAccessory_flow___block_invoke_97()
{
  return 1;
}

uint64_t __84__HMDHomeLockNotificationManager_CHIP__handleLockUserChangeEvent_forAccessory_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) fabricIndex];
  int v5 = [v4 isEqualToNumber:v3];

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 40);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      id v10 = [*(id *)(a1 + 48) UUID];
      int v27 = 138543618;
      uint64_t v28 = v9;
      __int16 v29 = 2112;
      id v30 = v10;
      int v11 = "%{public}@[Flow: %@] Not inserting lock user change bulletin because the user change was originated by our fabric.";
LABEL_15:
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v27, 0x16u);

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  unsigned int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  BOOL v13 = v12 > 7;
  int v14 = (1 << v12) & 0xC1;
  if (v13 || v14 == 0)
  {
    uint64_t v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 40);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      id v10 = [*(id *)(a1 + 48) UUID];
      int v27 = 138543618;
      uint64_t v28 = v9;
      __int16 v29 = 2112;
      id v30 = v10;
      int v11 = "%{public}@[Flow: %@] Not inserting lock user change bulletin because lockDataType is not of type MTRDoorLock"
            "LockDataTypePIN or MTRDoorLockLockDataTypeRFID (this event is for something other than the pin code or TTU credential).";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 40);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      id v10 = [*(id *)(a1 + 48) UUID];
      int v27 = 138543618;
      uint64_t v28 = v9;
      __int16 v29 = 2112;
      id v30 = v10;
      int v11 = "%{public}@[Flow: %@] Not inserting lock user change bulletin because allSlotsCleared.";
      goto LABEL_15;
    }
LABEL_16:

    id v23 = [MEMORY[0x263F087E8] hmfErrorWithCode:11];
    id v24 = v23;
    if (v23)
    {
      id v25 = v23;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
    }

    uint64_t v22 = 2;
    goto LABEL_20;
  }
  id v16 = *(void **)(a1 + 56);
  id v17 = [*(id *)(a1 + 32) userIndex];
  uint64_t v18 = [v17 integerValue];
  id v19 = [MEMORY[0x263F42530] untrackedPlaceholderFlow];
  id v20 = [v16 getUserAtIndex:v18 flow:v19];
  if (!v20) {
    _HMFPreconditionFailure();
  }
  uint64_t v21 = v20;

  uint64_t v22 = 3;
LABEL_20:

  return v22;
}

uint64_t __84__HMDHomeLockNotificationManager_CHIP__handleLockUserChangeEvent_forAccessory_flow___block_invoke_96(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 userUniqueID];
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  if (!*(unsigned char *)(v5 + 24)) {
    *(unsigned char *)(v5 + 24) = 7;
  }
  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v30 = HMFGetLogIdentifier();
    [*(id *)(a1 + 40) UUID];
    v9 = id v27 = v3;
    [*(id *)(a1 + 48) uuid];
    v10 = id v26 = v7;
    int v11 = [*(id *)(a1 + 56) lockDataType];
    [*(id *)(a1 + 56) dataOperationType];
    unsigned int v12 = log = v8;
    [*(id *)(a1 + 56) operationSource];
    v13 = uint64_t v28 = v6;
    int v14 = [*(id *)(a1 + 56) userIndex];
    uint64_t v15 = [*(id *)(a1 + 56) fabricIndex];
    id v16 = [*(id *)(a1 + 56) dataIndex];
    int v17 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v18 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138546178;
    id v32 = v30;
    __int16 v33 = 2112;
    id v34 = v9;
    __int16 v35 = 2112;
    uint64_t v36 = v10;
    __int16 v37 = 2112;
    id v38 = v11;
    __int16 v39 = 2112;
    char v40 = v12;
    __int16 v41 = 2112;
    id v42 = v13;
    __int16 v43 = 2112;
    uint64_t v44 = v14;
    __int16 v45 = 2112;
    __int16 v46 = v4;
    __int16 v47 = 2112;
    uint64_t v48 = v15;
    __int16 v49 = 2112;
    uint64_t v50 = v16;
    __int16 v51 = 1024;
    int v52 = v17;
    __int16 v53 = 2112;
    uint64_t v54 = v18;
    _os_log_impl(&dword_22F52A000, log, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling LockUserChange Event for accessory=%@ lockDataType=%@ dataOperationType=%@ operationSource=%@ userIndex=%@ userUniqueID=%@ fabricIndex=%@ dataIndex=%@ allSlotsCleared=%d event=%@", buf, 0x76u);

    uint64_t v6 = v28;
    id v8 = log;

    id v7 = v26;
    id v3 = v27;
  }
  id v19 = *(void **)(a1 + 32);
  id v20 = [v3 userUniqueID];
  uint64_t v21 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  uint64_t v22 = *(unsigned __int8 *)(a1 + 73);
  uint64_t v23 = *(void *)(a1 + 48);
  id v24 = [*(id *)(a1 + 56) fabricIndex];
  [v19 sendLockUserChangeEventNotification:v20 lockDataType:v21 accessory:v23 dataOperationType:v22 fabricIndex:v24 flow:*(void *)(a1 + 40)];

  return 1;
}

- (void)handleLockOperationEvent:(id)a3 forAccessory:(id)a4 flow:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v8 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v12 = v11;
  }
  else {
    unsigned int v12 = 0;
  }
  id v13 = v12;

  if (!v13)
  {
    int v17 = (void *)MEMORY[0x230FBD990]();
    uint64_t v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    id v20 = HMFGetLogIdentifier();
    uint64_t v21 = [v10 UUID];
    *(_DWORD *)buf = 138543618;
    __int16 v47 = v20;
    __int16 v48 = 2112;
    __int16 v49 = v21;
    uint64_t v22 = "%{public}@[Flow: %@] Cannot insert lock operation bulletin because eventReport.value was not a MTRDoorLockClus"
          "terLockOperationEvent.";
LABEL_11:
    uint64_t v23 = v19;
    os_log_type_t v24 = OS_LOG_TYPE_ERROR;
    goto LABEL_12;
  }
  int v14 = [v13 lockOperationType];
  if (![v14 integerValue])
  {

LABEL_15:
    id v25 = [v13 operationSource];
    if ([v25 integerValue] == 7)
    {
      id v26 = [v13 fabricIndex];

      if (!v26)
      {
        int v17 = (void *)MEMORY[0x230FBD990]();
        uint64_t v18 = self;
        id v19 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
        id v20 = HMFGetLogIdentifier();
        uint64_t v21 = [v10 UUID];
        *(_DWORD *)buf = 138543618;
        __int16 v47 = v20;
        __int16 v48 = 2112;
        __int16 v49 = v21;
        uint64_t v22 = "%{public}@[Flow: %@] Cannot insert lock operation bulletin because the operation source is Remote but we h"
              "ave no fabric. This is likely a bug with the lock.";
        goto LABEL_11;
      }
    }
    else
    {
    }
    id v27 = [MEMORY[0x263EFF910] now];
    id v28 = objc_alloc(MEMORY[0x263F42520]);
    __int16 v29 = [(HMDHomeLockNotificationManager *)self workQueue];
    id v34 = (void *)[v28 initWithQueue:v29];

    __int16 v33 = [v9 chipAccessoryServer];
    id v30 = [v33 createDoorLockClusterObjectWithFlow:v10];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke;
    v40[3] = &unk_264A22340;
    id v41 = v13;
    id v42 = self;
    id v43 = v10;
    id v44 = v9;
    id v45 = v27;
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_92;
    v35[3] = &unk_264A22318;
    v35[4] = self;
    id v36 = v43;
    id v37 = v44;
    id v38 = v41;
    id v39 = v45;
    id v31 = v45;
    id v32 = (id)[v30 inContext:v34 then:v40 orRecover:v35];

    goto LABEL_21;
  }
  uint64_t v15 = [v13 lockOperationType];
  uint64_t v16 = [v15 integerValue];

  if (v16 == 1) {
    goto LABEL_15;
  }
  int v17 = (void *)MEMORY[0x230FBD990]();
  uint64_t v18 = self;
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = HMFGetLogIdentifier();
    uint64_t v21 = [v10 UUID];
    *(_DWORD *)buf = 138543618;
    __int16 v47 = v20;
    __int16 v48 = 2112;
    __int16 v49 = v21;
    uint64_t v22 = "%{public}@[Flow: %@] Not inserting lock operation bulletin because lockOperationType is neither Lock or Unlock types.";
    uint64_t v23 = v19;
    os_log_type_t v24 = OS_LOG_TYPE_INFO;
LABEL_12:
    _os_log_impl(&dword_22F52A000, v23, v24, v22, buf, 0x16u);
  }
LABEL_13:

LABEL_21:
}

uint64_t __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 fetchCurrentFabricIndex];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_2;
  v29[3] = &unk_264A222A0;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  id v30 = v5;
  uint64_t v31 = v6;
  id v32 = v7;
  id v8 = v3;
  id v33 = v8;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_78;
  v27[3] = &unk_264A2EC50;
  id v9 = *(void **)(a1 + 48);
  void v27[4] = *(void *)(a1 + 40);
  id v28 = v9;
  id v10 = [v4 then:v29 orRecover:v27];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_80;
  v22[3] = &unk_264A222F0;
  int v11 = *(void **)(a1 + 48);
  void v22[4] = *(void *)(a1 + 40);
  id v23 = v11;
  id v24 = *(id *)(a1 + 32);
  id v25 = *(id *)(a1 + 56);
  id v26 = *(id *)(a1 + 64);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_90;
  v17[3] = &unk_264A22318;
  unsigned int v12 = *(void **)(a1 + 48);
  v17[4] = *(void *)(a1 + 40);
  id v18 = v12;
  id v19 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 32);
  id v21 = *(id *)(a1 + 64);
  id v13 = [v10 then:v22 orRecover:v17];
  if (v13)
  {
    int v14 = v13;

    return 3;
  }
  else
  {
    uint64_t v16 = _HMFPreconditionFailure();
    return __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_92(v16);
  }
}

uint64_t __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_92(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    *(_DWORD *)buf = 138543618;
    id v28 = v7;
    __int16 v29 = 2112;
    id v30 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to retrieve HMMTRSyncClusterDoorLock, so we cannot associate this LockOperation event with a user or our fabric. Posting bulletin without user attribution.", buf, 0x16u);
  }
  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = *(id *)(a1 + 32);
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    unsigned int v12 = HMFGetLogIdentifier();
    id v13 = [*(id *)(a1 + 40) UUID];
    [*(id *)(a1 + 48) uuid];
    v14 = id v26 = v3;
    uint64_t v15 = [*(id *)(a1 + 56) lockOperationType];
    uint64_t v16 = [*(id *)(a1 + 56) operationSource];
    [*(id *)(a1 + 56) userIndex];
    int v17 = v25 = v9;
    id v18 = [*(id *)(a1 + 56) fabricIndex];
    uint64_t v19 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138545154;
    id v28 = v12;
    __int16 v29 = 2112;
    id v30 = v13;
    __int16 v31 = 2112;
    id v32 = v14;
    __int16 v33 = 2112;
    id v34 = v15;
    __int16 v35 = 2112;
    id v36 = v16;
    __int16 v37 = 2112;
    id v38 = v17;
    __int16 v39 = 2112;
    char v40 = v18;
    __int16 v41 = 2112;
    uint64_t v42 = v19;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling LockOperation Event for accessory=%@ operationType=%@ operationSource=%@ userIndex=%@ userUniqueID=nil fabricIndex=%@ event=%@", buf, 0x52u);

    id v9 = v25;
    id v3 = v26;
  }
  id v20 = *(void **)(a1 + 32);
  id v21 = [*(id *)(a1 + 56) lockOperationType];
  uint64_t v22 = [*(id *)(a1 + 56) operationSource];
  id v23 = [*(id *)(a1 + 56) fabricIndex];
  [v20 sendLockOperationEventNotification:0 userUniqueID:0 lockOperationType:v21 lockOperationSource:v22 fabricIndex:v23 accessory:*(void *)(a1 + 48) timestamp:*(void *)(a1 + 64) flow:*(void *)(a1 + 40)];

  return 1;
}

uint64_t __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) operationSource];
  if ([v4 integerValue] == 7)
  {
    id v5 = [*(id *)(a1 + 32) fabricIndex];
    int v6 = [v5 isEqualToNumber:v3];

    if (v6)
    {
      id v7 = (void *)MEMORY[0x230FBD990]();
      id v8 = *(id *)(a1 + 40);
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = HMFGetLogIdentifier();
        int v11 = [*(id *)(a1 + 48) UUID];
        int v21 = 138543618;
        uint64_t v22 = v10;
        __int16 v23 = 2112;
        id v24 = v11;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not inserting lock operation event bulletin because the lock operation event was originated by our fabric. We handle this path in HMDHome and throw HMFErrorCodeOperationCancelled here.", (uint8_t *)&v21, 0x16u);
      }
      id v12 = [MEMORY[0x263F087E8] hmfErrorWithCode:12];
      id v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        [MEMORY[0x263F087E8] hmfUnspecifiedError];
        objc_claimAutoreleasedReturnValue();
      }

      uint64_t v19 = 2;
LABEL_14:

      goto LABEL_15;
    }
  }
  else
  {
  }
  uint64_t v15 = [*(id *)(a1 + 32) userIndex];

  if (v15)
  {
    uint64_t v16 = *(void **)(a1 + 56);
    id v13 = [*(id *)(a1 + 32) userIndex];
    objc_msgSend(v16, "getUserAtIndex:flow:", objc_msgSend(v13, "integerValue"), *(void *)(a1 + 48));
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (!v17) {
      _HMFPreconditionFailure();
    }
    id v18 = v17;
    uint64_t v19 = 3;

    goto LABEL_14;
  }
  uint64_t v19 = 1;
LABEL_15:

  return v19;
}

uint64_t __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_78(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  int v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    int v10 = 138543618;
    int v11 = v7;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch current fabric index, so we cannot associate this LockOperation event with our fabric. Posting bulletin regardless.", (uint8_t *)&v10, 0x16u);
  }

  return 1;
}

uint64_t __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_80(uint64_t a1, void *a2)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v36 = a2;
  id v3 = [v36 userUniqueID];
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  int v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) UUID];
    id v9 = [*(id *)(a1 + 48) userIndex];
    *(_DWORD *)buf = 138544130;
    uint64_t v42 = v7;
    __int16 v43 = 2112;
    id v44 = v8;
    __int16 v45 = 2112;
    __int16 v46 = v3;
    __int16 v47 = 2112;
    __int16 v48 = v9;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] UserUniqueID returned from getUserAtIndex is %@ for userIndex=%@", buf, 0x2Au);
  }
  if (v3)
  {
    int v10 = [*(id *)(a1 + 56) home];
    int v11 = [v10 users];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_81;
    v37[3] = &unk_264A222C8;
    id v12 = v3;
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(a1 + 40);
    id v38 = v12;
    uint64_t v39 = v13;
    id v40 = v14;
    uint64_t v15 = objc_msgSend(v11, "na_firstObjectPassingTest:", v37);
  }
  else
  {
    uint64_t v15 = 0;
  }
  uint64_t v16 = (void *)MEMORY[0x230FBD990]();
  id v17 = *(id *)(a1 + 32);
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    __int16 v35 = HMFGetLogIdentifier();
    uint64_t v19 = [*(id *)(a1 + 40) UUID];
    id v20 = [*(id *)(a1 + 56) uuid];
    [*(id *)(a1 + 48) lockOperationType];
    v21 = id v34 = v16;
    uint64_t v22 = [*(id *)(a1 + 48) operationSource];
    __int16 v23 = [*(id *)(a1 + 48) userIndex];
    [v15 uuid];
    id v24 = v32 = v17;
    [*(id *)(a1 + 48) fabricIndex];
    v25 = __int16 v33 = v15;
    uint64_t v26 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138545666;
    uint64_t v42 = v35;
    __int16 v43 = 2112;
    id v44 = v19;
    __int16 v45 = 2112;
    __int16 v46 = v20;
    __int16 v47 = 2112;
    __int16 v48 = v21;
    __int16 v49 = 2112;
    uint64_t v50 = v22;
    __int16 v51 = 2112;
    int v52 = v23;
    __int16 v53 = 2112;
    uint64_t v54 = v24;
    __int16 v55 = 2112;
    __int16 v56 = v3;
    __int16 v57 = 2112;
    __int16 v58 = v25;
    __int16 v59 = 2112;
    uint64_t v60 = v26;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling LockOperation Event for accessory=%@ operationType=%@ operationSource=%@ userIndex=%@ userUUID=%@ userUniqueID=%@ fabricIndex=%@ event=%@", buf, 0x66u);

    uint64_t v15 = v33;
    id v17 = v32;

    uint64_t v16 = v34;
  }

  id v27 = *(void **)(a1 + 32);
  id v28 = [*(id *)(a1 + 48) lockOperationType];
  __int16 v29 = [*(id *)(a1 + 48) operationSource];
  id v30 = [*(id *)(a1 + 48) fabricIndex];
  [v27 sendLockOperationEventNotification:v15 userUniqueID:v3 lockOperationType:v28 lockOperationSource:v29 fabricIndex:v30 accessory:*(void *)(a1 + 56) timestamp:*(void *)(a1 + 64) flow:*(void *)(a1 + 40)];

  return 1;
}

uint64_t __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_90(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 code] != 12)
  {
    uint64_t v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    int v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = [*(id *)(a1 + 40) UUID];
      *(_DWORD *)buf = 138543618;
      id v28 = v7;
      __int16 v29 = 2112;
      id v30 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to retrieve MTRDoorLockClusterGetUserResponseParams, so we cannot associate this LockOperation event with a user. Posting bulletin without user attribution.", buf, 0x16u);
    }
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      uint64_t v13 = [*(id *)(a1 + 40) UUID];
      uint64_t v14 = [*(id *)(a1 + 48) uuid];
      uint64_t v15 = [*(id *)(a1 + 56) lockOperationType];
      [*(id *)(a1 + 56) operationSource];
      v16 = id v25 = v3;
      id v17 = [*(id *)(a1 + 56) userIndex];
      [*(id *)(a1 + 56) fabricIndex];
      v18 = uint64_t v26 = v9;
      uint64_t v19 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138545154;
      id v28 = v12;
      __int16 v29 = 2112;
      id v30 = v13;
      __int16 v31 = 2112;
      id v32 = v14;
      __int16 v33 = 2112;
      id v34 = v15;
      __int16 v35 = 2112;
      id v36 = v16;
      __int16 v37 = 2112;
      id v38 = v17;
      __int16 v39 = 2112;
      id v40 = v18;
      __int16 v41 = 2112;
      uint64_t v42 = v19;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling LockOperation Event for accessory=%@ operationType=%@ operationSource=%@ userIndex=%@ userUniqueID=nil fabricIndex=%@ event=%@", buf, 0x52u);

      id v9 = v26;
      id v3 = v25;
    }
    id v20 = *(void **)(a1 + 32);
    int v21 = [*(id *)(a1 + 56) lockOperationType];
    uint64_t v22 = [*(id *)(a1 + 56) operationSource];
    __int16 v23 = [*(id *)(a1 + 56) fabricIndex];
    [v20 sendLockOperationEventNotification:0 userUniqueID:0 lockOperationType:v21 lockOperationSource:v22 fabricIndex:v23 accessory:*(void *)(a1 + 48) timestamp:*(void *)(a1 + 64) flow:*(void *)(a1 + 40)];
  }
  return 1;
}

uint64_t __83__HMDHomeLockNotificationManager_CHIP__handleLockOperationEvent_forAccessory_flow___block_invoke_81(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 uniqueIDForAccessories];
  uint64_t v5 = [v4 isEqualToNumber:*(void *)(a1 + 32)];

  int v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 40);
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [*(id *)(a1 + 48) UUID];
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = [v3 uuid];
    uint64_t v13 = [v3 uniqueIDForAccessories];
    uint64_t v14 = (void *)v13;
    int v17 = 138544642;
    uint64_t v15 = @"NO";
    id v18 = v9;
    if (v5) {
      uint64_t v15 = @"YES";
    }
    __int16 v19 = 2112;
    id v20 = v10;
    __int16 v21 = 2112;
    uint64_t v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 2112;
    uint64_t v26 = v13;
    __int16 v27 = 2112;
    id v28 = v15;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Checking to see if userUniqueID=%@ matches for userUUID=%@ who has the uniqueIDForAccessories=%@... match found=%@", (uint8_t *)&v17, 0x3Eu);
  }

  return v5;
}

- (void)handleDoorLockAlarmEvent:(id)a3 forAccessory:(id)a4 flow:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  if (!v13)
  {
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    int v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      __int16 v21 = [v10 UUID];
      int v29 = 138543618;
      id v30 = v20;
      __int16 v31 = 2112;
      id v32 = v21;
      uint64_t v22 = "%{public}@[Flow: %@] Cannot insert DoorLockAlarm event bulletin because event is nil for MTRDoorLockClusterD"
            "oorLockAlarmEvent.";
      __int16 v23 = v18;
      os_log_type_t v24 = OS_LOG_TYPE_ERROR;
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_15;
  }
  uint64_t v14 = [v13 alarmCode];
  uint64_t v15 = [v14 integerValue];

  uint64_t v16 = (void *)MEMORY[0x230FBD990]();
  int v17 = self;
  id v18 = HMFGetOSLogHandle();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
  if (v15)
  {
    if (v19)
    {
      id v20 = HMFGetLogIdentifier();
      __int16 v21 = [v10 UUID];
      int v29 = 138543618;
      id v30 = v20;
      __int16 v31 = 2112;
      id v32 = v21;
      uint64_t v22 = "%{public}@[Flow: %@] Not inserting DoorLockAlarm event bulletin because alarmCode is not of type LockJammed.";
      __int16 v23 = v18;
      os_log_type_t v24 = OS_LOG_TYPE_INFO;
LABEL_10:
      _os_log_impl(&dword_22F52A000, v23, v24, v22, (uint8_t *)&v29, 0x16u);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (v19)
  {
    __int16 v25 = HMFGetLogIdentifier();
    uint64_t v26 = [v10 UUID];
    __int16 v27 = [v9 uuid];
    int v29 = 138544130;
    id v30 = v25;
    __int16 v31 = 2112;
    id v32 = v26;
    __int16 v33 = 2112;
    id v34 = v27;
    __int16 v35 = 2112;
    id v36 = v13;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling DoorLockAlarm (Door Jammed) Event for accessory=%@ event=%@", (uint8_t *)&v29, 0x2Au);
  }
  id v28 = [v13 alarmCode];
  [(HMDHomeLockNotificationManager *)v17 sendDoorLockAlarmEventNotification:v28 accessory:v9 flow:v10];

LABEL_15:
}

- (void)handleDoorLockEventReport:(id)a3 forAccessory:(id)a4 flow:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 path];
  id v12 = [v11 event];
  int v13 = [v12 unsignedIntValue];

  uint64_t v14 = (void *)MEMORY[0x230FBD990]();
  uint64_t v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v17 = HMFGetLogIdentifier();
    id v18 = [v10 UUID];
    BOOL v19 = [v9 uuid];
    int v23 = 138544130;
    os_log_type_t v24 = v17;
    __int16 v25 = 2112;
    uint64_t v26 = v18;
    __int16 v27 = 2112;
    id v28 = v19;
    __int16 v29 = 1024;
    int v30 = v13;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling Matter event report for accessory=%@ eventID=%u", (uint8_t *)&v23, 0x26u);
  }
  id v20 = [v8 path];
  __int16 v21 = [v20 event];
  int v22 = [v21 unsignedIntValue];

  switch(v22)
  {
    case 4:
      [(HMDHomeLockNotificationManager *)v15 handleLockUserChangeEvent:v8 forAccessory:v9 flow:v10];
      break;
    case 2:
      [(HMDHomeLockNotificationManager *)v15 handleLockOperationEvent:v8 forAccessory:v9 flow:v10];
      break;
    case 0:
      [(HMDHomeLockNotificationManager *)v15 handleDoorLockAlarmEvent:v8 forAccessory:v9 flow:v10];
      break;
  }
}

+ (id)findEcosystemName:(id)a3
{
  return @"MATTER_ECOSYSTEM_NAME_UNKNOWN_SERVICE";
}

@end