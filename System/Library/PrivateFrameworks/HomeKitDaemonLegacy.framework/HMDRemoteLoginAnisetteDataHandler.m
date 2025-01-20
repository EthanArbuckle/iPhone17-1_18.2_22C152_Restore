@interface HMDRemoteLoginAnisetteDataHandler
+ (id)logCategory;
- (AKAnisetteProvisioningController)provisioningController;
- (HMDAppleMediaAccessory)accessory;
- (HMDRemoteLoginAnisetteDataHandler)initWithUUID:(id)a3 accessory:(id)a4;
- (HMFMessageDispatcher)msgDispatcher;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (void)_handleEraseAnisetteDataRequestMessage:(id)a3;
- (void)_handleFetchAnisetteDataRequestMessage:(id)a3;
- (void)_handleLegacyAnisetteDataRequestMessage:(id)a3;
- (void)_handleProvisionAnisetteDataRequestMessage:(id)a3;
- (void)_handleSyncAnisetteDataRequestMessage:(id)a3;
- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4;
- (void)registerForMessages;
- (void)setMsgDispatcher:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation HMDRemoteLoginAnisetteDataHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

- (AKAnisetteProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setMsgDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (HMDAppleMediaAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAppleMediaAccessory *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDRemoteLoginAnisetteDataHandler *)self uuid];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)_handleLegacyAnisetteDataRequestMessage:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F2E888] objWithMessage:v4];
  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v18 = v9;
    __int16 v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling legacy anisette data request: %@", buf, 0x16u);
  }
  v10 = [(HMDRemoteLoginAnisetteDataHandler *)v7 provisioningController];
  v11 = [v5 dsid];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__HMDRemoteLoginAnisetteDataHandler__handleLegacyAnisetteDataRequestMessage___block_invoke;
  v14[3] = &unk_1E6A0F9F8;
  id v15 = v5;
  id v16 = v4;
  id v12 = v4;
  id v13 = v5;
  [v10 legacyAnisetteDataForDSID:v11 withCompletion:v14];
}

void __77__HMDRemoteLoginAnisetteDataHandler__handleLegacyAnisetteDataRequestMessage___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F2E890];
  id v4 = a2;
  id v5 = [v3 alloc];
  v6 = [*(id *)(a1 + 32) sessionID];
  id v9 = (id)[v5 initWithSessionID:v6];

  [v9 setAnisetteData:v4];
  v7 = [*(id *)(a1 + 40) responseHandler];
  v8 = [v9 messagePayload];
  ((void (**)(void, void, void *))v7)[2](v7, 0, v8);
}

- (void)_handleFetchAnisetteDataRequestMessage:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F2E7D8] objWithMessage:v4];
  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v17 = v9;
    __int16 v18 = 2112;
    __int16 v19 = v5;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch anisette data request: %@", buf, 0x16u);
  }
  v10 = [(HMDRemoteLoginAnisetteDataHandler *)v7 provisioningController];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__HMDRemoteLoginAnisetteDataHandler__handleFetchAnisetteDataRequestMessage___block_invoke;
  v13[3] = &unk_1E6A0F9F8;
  id v14 = v5;
  id v15 = v4;
  id v11 = v4;
  id v12 = v5;
  [v10 anisetteDataWithCompletion:v13];
}

void __76__HMDRemoteLoginAnisetteDataHandler__handleFetchAnisetteDataRequestMessage___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F2E7E0];
  id v4 = a2;
  id v5 = [v3 alloc];
  v6 = [*(id *)(a1 + 32) sessionID];
  id v9 = (id)[v5 initWithSessionID:v6];

  [v9 setAnisetteData:v4];
  v7 = [*(id *)(a1 + 40) responseHandler];
  v8 = [v9 messagePayload];
  ((void (**)(void, void, void *))v7)[2](v7, 0, v8);
}

- (void)_handleEraseAnisetteDataRequestMessage:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F2E790] objWithMessage:v4];
  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v17 = v9;
    __int16 v18 = 2112;
    __int16 v19 = v5;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling erase anisette data request: %@", buf, 0x16u);
  }
  v10 = [(HMDRemoteLoginAnisetteDataHandler *)v7 provisioningController];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__HMDRemoteLoginAnisetteDataHandler__handleEraseAnisetteDataRequestMessage___block_invoke;
  v13[3] = &unk_1E6A0F9D0;
  id v14 = v5;
  id v15 = v4;
  id v11 = v4;
  id v12 = v5;
  [v10 eraseWithCompletion:v13];
}

void __76__HMDRemoteLoginAnisetteDataHandler__handleEraseAnisetteDataRequestMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc(MEMORY[0x1E4F2E798]);
  id v5 = [*(id *)(a1 + 32) sessionID];
  id v8 = (id)[v4 initWithSessionID:v5];

  [v8 setDidSucceed:a2];
  v6 = [*(id *)(a1 + 40) responseHandler];
  v7 = [v8 messagePayload];
  ((void (**)(void, void, void *))v6)[2](v6, 0, v7);
}

- (void)_handleSyncAnisetteDataRequestMessage:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F2EB78] objWithMessage:v4];
  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v5;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling sync anisette data request: %@", buf, 0x16u);
  }
  v10 = [(HMDRemoteLoginAnisetteDataHandler *)v7 provisioningController];
  id v11 = [v5 simData];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__HMDRemoteLoginAnisetteDataHandler__handleSyncAnisetteDataRequestMessage___block_invoke;
  v14[3] = &unk_1E6A0F9D0;
  id v15 = v5;
  id v16 = v4;
  id v12 = v4;
  id v13 = v5;
  [v10 syncWithSIMData:v11 completion:v14];
}

void __75__HMDRemoteLoginAnisetteDataHandler__handleSyncAnisetteDataRequestMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc(MEMORY[0x1E4F2EB80]);
  id v5 = [*(id *)(a1 + 32) sessionID];
  id v8 = (id)[v4 initWithSessionID:v5];

  [v8 setDidSucceed:a2];
  v6 = [*(id *)(a1 + 40) responseHandler];
  v7 = [v8 messagePayload];
  ((void (**)(void, void, void *))v6)[2](v6, 0, v7);
}

- (void)_handleProvisionAnisetteDataRequestMessage:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F2EA38] objWithMessage:v4];
  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v17 = v9;
    __int16 v18 = 2112;
    __int16 v19 = v5;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling provision anisette data request: %@", buf, 0x16u);
  }
  v10 = [(HMDRemoteLoginAnisetteDataHandler *)v7 provisioningController];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__HMDRemoteLoginAnisetteDataHandler__handleProvisionAnisetteDataRequestMessage___block_invoke;
  v13[3] = &unk_1E6A0F9D0;
  id v14 = v5;
  id v15 = v4;
  id v11 = v4;
  id v12 = v5;
  [v10 provisionWithCompletion:v13];
}

void __80__HMDRemoteLoginAnisetteDataHandler__handleProvisionAnisetteDataRequestMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc(MEMORY[0x1E4F2EA40]);
  id v5 = [*(id *)(a1 + 32) sessionID];
  id v8 = (id)[v4 initWithSessionID:v5];

  [v8 setDidSucceed:a2];
  v6 = [*(id *)(a1 + 40) responseHandler];
  v7 = [v8 messagePayload];
  ((void (**)(void, void, void *))v6)[2](v6, 0, v7);
}

- (void)registerForMessages
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v3 = [(HMDRemoteLoginAnisetteDataHandler *)self accessory];
  id v4 = [v3 home];
  id v5 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:4 remoteAccessRequired:0];

  v6 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  v7 = [(HMDRemoteLoginAnisetteDataHandler *)self msgDispatcher];
  id v8 = [MEMORY[0x1E4F2EA38] messageName];
  v26[0] = v5;
  v26[1] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  [v7 registerForMessage:v8 receiver:self policies:v9 selector:sel__handleProvisionAnisetteDataRequestMessage_];

  v10 = [(HMDRemoteLoginAnisetteDataHandler *)self msgDispatcher];
  id v11 = [MEMORY[0x1E4F2EB78] messageName];
  v25[0] = v5;
  v25[1] = v6;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  [v10 registerForMessage:v11 receiver:self policies:v12 selector:sel__handleSyncAnisetteDataRequestMessage_];

  id v13 = [(HMDRemoteLoginAnisetteDataHandler *)self msgDispatcher];
  id v14 = [MEMORY[0x1E4F2E790] messageName];
  v24[0] = v5;
  v24[1] = v6;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  [v13 registerForMessage:v14 receiver:self policies:v15 selector:sel__handleEraseAnisetteDataRequestMessage_];

  id v16 = [(HMDRemoteLoginAnisetteDataHandler *)self msgDispatcher];
  v17 = [MEMORY[0x1E4F2E7D8] messageName];
  v23[0] = v5;
  v23[1] = v6;
  __int16 v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  [v16 registerForMessage:v17 receiver:self policies:v18 selector:sel__handleFetchAnisetteDataRequestMessage_];

  __int16 v19 = [(HMDRemoteLoginAnisetteDataHandler *)self msgDispatcher];
  uint64_t v20 = [MEMORY[0x1E4F2E888] messageName];
  v22[0] = v5;
  v22[1] = v6;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  [v19 registerForMessage:v20 receiver:self policies:v21 selector:sel__handleLegacyAnisetteDataRequestMessage_];
}

- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4
{
  id v6 = a4;
  [(HMDRemoteLoginAnisetteDataHandler *)self setWorkQueue:a3];
  [(HMDRemoteLoginAnisetteDataHandler *)self setMsgDispatcher:v6];
}

- (HMDRemoteLoginAnisetteDataHandler)initWithUUID:(id)a3 accessory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDRemoteLoginAnisetteDataHandler;
  id v9 = [(HMDRemoteLoginAnisetteDataHandler *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeWeak((id *)&v10->_accessory, v8);
    id v11 = (AKAnisetteProvisioningController *)objc_alloc_init(MEMORY[0x1E4F4EF58]);
    provisioningController = v10->_provisioningController;
    v10->_provisioningController = v11;
  }
  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_112413 != -1) {
    dispatch_once(&logCategory__hmf_once_t5_112413, &__block_literal_global_112414);
  }
  v2 = (void *)logCategory__hmf_once_v6_112415;
  return v2;
}

uint64_t __48__HMDRemoteLoginAnisetteDataHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v6_112415;
  logCategory__hmf_once_v6_112415 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end