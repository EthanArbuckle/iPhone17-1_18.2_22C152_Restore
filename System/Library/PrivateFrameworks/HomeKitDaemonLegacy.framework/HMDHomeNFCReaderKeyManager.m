@interface HMDHomeNFCReaderKeyManager
+ (id)logCategory;
- (HAPSystemKeychainStore)keychainStore;
- (HMDDevice)primaryResidentDevice;
- (HMDHome)home;
- (HMDHomeNFCReaderKeyManager)initWithUUID:(id)a3 workQueue:(id)a4;
- (HMDHomeNFCReaderKeyManager)initWithUUID:(id)a3 workQueue:(id)a4 keychainStore:(id)a5 dataSource:(id)a6;
- (HMDHomeWalletDataSource)dataSource;
- (HMDHomeWalletKeyAccessoryManager)accessoryManager;
- (HMFMessageDispatcher)messageDispatcher;
- (NAFuture)createKeychainItemFuture;
- (NSMutableSet)keyIdentifiersAlreadyUpdated;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (id)createNFCReaderKeyModelWithHome:(id)a3 nfcReaderKey:(id)a4;
- (id)fetchOrCreateReaderKeyForPairingWithFlow:(id)a3;
- (id)logIdentifier;
- (id)readerKeyWithKeychainItemIdentifier:(id)a3 error:(id *)a4 flow:(id)a5;
- (id)requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow:(id)a3;
- (void)configureWithHome:(id)a3;
- (void)createReaderKeyKeychainItemForHome:(id)a3 isForceUpdate:(BOOL)a4 flow:(id)a5 completion:(id)a6;
- (void)deleteKeychainItemForNFCReaderKeyIsForceUpdate:(BOOL)a3 withFlow:(id)a4 completion:(id)a5;
- (void)fetchOrCreateReaderKeyOnQueueWithRequiresPrivateKey:(BOOL)a3 flow:(id)a4 completion:(id)a5;
- (void)fetchOrCreateReaderKeyWithRequiresPrivateKey:(BOOL)a3 flow:(id)a4 completion:(id)a5;
- (void)handleCreateKeychainItemForReaderKeyMessage:(id)a3;
- (void)handleDeleteKeychainItemForNFCReaderKey:(id)a3;
- (void)handleFetchOrCreateReaderKeyMessage:(id)a3;
- (void)handleHomeDidUpdateNFCReaderKeyNotification:(id)a3;
- (void)handleHomeRemovedNotification:(id)a3;
- (void)handleSystemKeychainStoreUpdatedNotification:(id)a3;
- (void)removeKeychainItemForReaderKey:(id)a3 home:(id)a4 flow:(id)a5;
- (void)requestDevice:(id)a3 toCreateKeychainItemForReaderKeyWithFlow:(id)a4 completion:(id)a5;
- (void)requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow:(id)a3 completion:(id)a4;
- (void)rollReaderKeyWithFlow:(id)a3 withCompletion:(id)a4;
- (void)setCreateKeychainItemFuture:(id)a3;
- (void)setHome:(id)a3;
- (void)setKeyIdentifiersAlreadyUpdated:(id)a3;
- (void)setMessageDispatcher:(id)a3;
- (void)unconfigure;
@end

@implementation HMDHomeNFCReaderKeyManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyIdentifiersAlreadyUpdated, 0);
  objc_storeStrong((id *)&self->_createKeychainItemFuture, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_keychainStore, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_accessoryManager, 0);
}

- (void)setKeyIdentifiersAlreadyUpdated:(id)a3
{
}

- (NSMutableSet)keyIdentifiersAlreadyUpdated
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCreateKeychainItemFuture:(id)a3
{
}

- (NAFuture)createKeychainItemFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 64, 1);
}

- (HMDHomeWalletDataSource)dataSource
{
  return (HMDHomeWalletDataSource *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMessageDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 48, 1);
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
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (HAPSystemKeychainStore)keychainStore
{
  return (HAPSystemKeychainStore *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMDHomeWalletKeyAccessoryManager)accessoryManager
{
  return (HMDHomeWalletKeyAccessoryManager *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDHomeNFCReaderKeyManager *)self uuid];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow:(id)a3 completion:(id)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDHomeNFCReaderKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [(HMDHomeNFCReaderKeyManager *)self primaryResidentDevice];
  if (v9)
  {
    v10 = [HMDRemoteDeviceMessageDestination alloc];
    v11 = [(HMDHomeNFCReaderKeyManager *)self messageTargetUUID];
    v12 = [(HMDRemoteDeviceMessageDestination *)v10 initWithTarget:v11 device:v9];

    v13 = [HMDRemoteMessage alloc];
    uint64_t v40 = *MEMORY[0x1E4F64F08];
    v14 = HMFEncodedRootObject();
    v41[0] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    v16 = [(HMDRemoteMessage *)v13 initWithName:@"HMDHomeFetchOrCreateNFCReaderKeyMessage" destination:v12 payload:v15 type:0 timeout:1 secure:0.0];

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __96__HMDHomeNFCReaderKeyManager_requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow_completion___block_invoke;
    v29[3] = &unk_1E6A16950;
    v29[4] = self;
    id v17 = v6;
    id v30 = v17;
    id v31 = v7;
    v18 = (void *)MEMORY[0x1D9452090]([(HMDRemoteMessage *)v16 setResponseHandler:v29]);
    v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = HMFGetLogIdentifier();
      v22 = [v17 UUID];
      *(_DWORD *)buf = 138544130;
      v33 = v21;
      __int16 v34 = 2112;
      v35 = v22;
      __int16 v36 = 2112;
      v37 = v16;
      __int16 v38 = 2112;
      v39 = v9;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Sending message to fetch or create reader key: %@ to primary resident: %@", buf, 0x2Au);
    }
    v23 = [(HMDHomeNFCReaderKeyManager *)v19 messageDispatcher];
    [v23 sendMessage:v16];
  }
  else
  {
    v24 = (void *)MEMORY[0x1D9452090]();
    v25 = self;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      v28 = [v6 UUID];
      *(_DWORD *)buf = 138543618;
      v33 = v27;
      __int16 v34 = 2112;
      v35 = v28;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Did not send message to fetch or create reader key, there is no primary resident that support wallet key", buf, 0x16u);
    }
    v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    (*((void (**)(id, void, HMDRemoteDeviceMessageDestination *))v7 + 2))(v7, 0, v12);
  }
}

void __96__HMDHomeNFCReaderKeyManager_requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_msgSend(v6, "hmf_dataForKey:", @"HMDHomeFetchOrCreateNFCReaderKeyMessageKeyReaderKey");
  id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    id v37 = 0;
    v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v37];
    id v9 = v37;
    if (v8)
    {
      v10 = [a1[4] workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __96__HMDHomeNFCReaderKeyManager_requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow_completion___block_invoke_2;
      block[3] = &unk_1E6A18398;
      id v11 = a1[5];
      block[4] = a1[4];
      id v31 = v11;
      id v32 = v8;
      id v33 = a1[6];
      dispatch_async(v10, block);
    }
    else
    {
      v19 = (void *)MEMORY[0x1D9452090]();
      id v20 = a1[4];
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = id v29 = v5;
        [a1[5] UUID];
        v23 = v28 = v19;
        *(_DWORD *)buf = 138544130;
        v41 = v22;
        __int16 v42 = 2112;
        v43 = v23;
        __int16 v44 = 2112;
        v45 = v7;
        __int16 v46 = 2112;
        id v47 = v9;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to decode reader key %@:%@", buf, 0x2Au);

        v19 = v28;
        id v5 = v29;
      }

      v24 = [MEMORY[0x1E4F1CA60] dictionary];
      [v24 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
      v25 = [a1[4] workQueue];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __96__HMDHomeNFCReaderKeyManager_requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow_completion___block_invoke_134;
      v34[3] = &unk_1E6A19530;
      id v26 = a1[6];
      id v35 = v24;
      id v36 = v26;
      id v27 = v24;
      dispatch_async(v25, v34);
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = a1[4];
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      [a1[5] UUID];
      id v17 = v16 = v5;
      *(_DWORD *)buf = 138544386;
      v41 = v15;
      __int16 v42 = 2112;
      v43 = v17;
      __int16 v44 = 2112;
      v45 = @"HMDHomeFetchOrCreateNFCReaderKeyMessageKeyReaderKey";
      __int16 v46 = 2112;
      id v47 = v6;
      __int16 v48 = 2112;
      id v49 = v16;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Missing reader key: %@ in payload: %@ error: %@", buf, 0x34u);

      id v5 = v16;
    }

    v18 = [a1[4] workQueue];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __96__HMDHomeNFCReaderKeyManager_requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow_completion___block_invoke_132;
    v38[3] = &unk_1E6A186E0;
    id v39 = a1[6];
    dispatch_async(v18, v38);

    id v9 = v39;
  }
}

void __96__HMDHomeNFCReaderKeyManager_requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow_completion___block_invoke_132(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __96__HMDHomeNFCReaderKeyManager_requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow_completion___block_invoke_134(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1 userInfo:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __96__HMDHomeNFCReaderKeyManager_requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) UUID];
    uint64_t v7 = *(void *)(a1 + 48);
    int v9 = 138543874;
    v10 = v5;
    __int16 v11 = 2112;
    v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully fetched nfc reader key: %@", (uint8_t *)&v9, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)requestDevice:(id)a3 toCreateKeychainItemForReaderKeyWithFlow:(id)a4 completion:(id)a5
{
  v44[1] = *MEMORY[0x1E4F143B8];
  v8 = (HMDRemoteMessage *)a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(HMDHomeNFCReaderKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x1D9452090]();
  __int16 v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    id v16 = [v9 UUID];
    *(_DWORD *)buf = 138543874;
    id v36 = v15;
    __int16 v37 = 2112;
    __int16 v38 = v16;
    __int16 v39 = 2112;
    uint64_t v40 = v8;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Requesting primary resident device to create keychain item for nfc reader key. residentDevice: %@", buf, 0x20u);
  }
  id v17 = [HMDRemoteDeviceMessageDestination alloc];
  v18 = [(HMDHomeNFCReaderKeyManager *)v13 messageTargetUUID];
  v19 = [(HMDRemoteDeviceMessageDestination *)v17 initWithTarget:v18 device:v8];

  id v20 = [HMDRemoteMessage alloc];
  uint64_t v43 = *MEMORY[0x1E4F64F08];
  v21 = HMFEncodedRootObject();
  v44[0] = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
  v23 = [(HMDRemoteMessage *)v20 initWithName:@"HMDHomeCreateKeychainItemForNFCReaderKeyMessage" destination:v19 payload:v22 type:0 timeout:1 secure:0.0];

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __96__HMDHomeNFCReaderKeyManager_requestDevice_toCreateKeychainItemForReaderKeyWithFlow_completion___block_invoke;
  v32[3] = &unk_1E6A16950;
  v32[4] = v13;
  id v24 = v9;
  id v33 = v24;
  id v25 = v10;
  id v34 = v25;
  id v26 = (void *)MEMORY[0x1D9452090]([(HMDRemoteMessage *)v23 setResponseHandler:v32]);
  id v27 = v13;
  v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    id v29 = HMFGetLogIdentifier();
    id v30 = [v24 UUID];
    *(_DWORD *)buf = 138544130;
    id v36 = v29;
    __int16 v37 = 2112;
    __int16 v38 = v30;
    __int16 v39 = 2112;
    uint64_t v40 = v23;
    __int16 v41 = 2112;
    __int16 v42 = v8;
    _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Sending message to create keychain item for reader key: %@ to primary resident: %@", buf, 0x2Au);
  }
  id v31 = [(HMDHomeNFCReaderKeyManager *)v27 messageDispatcher];
  [v31 sendMessage:v23];
}

void __96__HMDHomeNFCReaderKeyManager_requestDevice_toCreateKeychainItemForReaderKeyWithFlow_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_msgSend(v6, "hmf_dataForKey:", @"HMDHomeCreateKeychainItemForNFCReaderKeyMessageKeyReaderKey");
  uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    uint64_t v8 = +[HMDHomeNFCReaderKey createWithExternalRepresentation:v7];
    if (v8)
    {
      id v9 = (void *)v8;
      id v10 = [a1[4] workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __96__HMDHomeNFCReaderKeyManager_requestDevice_toCreateKeychainItemForReaderKeyWithFlow_completion___block_invoke_2;
      block[3] = &unk_1E6A18398;
      id v11 = a1[5];
      block[4] = a1[4];
      id v30 = v11;
      id v12 = v9;
      id v31 = v12;
      id v32 = a1[6];
      dispatch_async(v10, block);
    }
    else
    {
      id v20 = (void *)MEMORY[0x1D9452090]();
      id v21 = a1[4];
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        id v24 = [a1[5] UUID];
        *(_DWORD *)buf = 138544130;
        __int16 v39 = v23;
        __int16 v40 = 2112;
        __int16 v41 = v24;
        __int16 v42 = 2112;
        uint64_t v43 = v7;
        __int16 v44 = 2112;
        id v45 = 0;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to decode reader key keychain item %@:%@", buf, 0x2Au);
      }
      id v25 = [MEMORY[0x1E4F1CA60] dictionary];
      [v25 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
      id v26 = [a1[4] workQueue];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __96__HMDHomeNFCReaderKeyManager_requestDevice_toCreateKeychainItemForReaderKeyWithFlow_completion___block_invoke_131;
      v33[3] = &unk_1E6A19530;
      id v27 = a1[6];
      id v34 = v25;
      id v35 = v27;
      id v28 = v25;
      dispatch_async(v26, v33);

      id v12 = 0;
    }
  }
  else
  {
    __int16 v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = a1[4];
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      [a1[5] UUID];
      v18 = id v17 = v5;
      *(_DWORD *)buf = 138544386;
      __int16 v39 = v16;
      __int16 v40 = 2112;
      __int16 v41 = v18;
      __int16 v42 = 2112;
      uint64_t v43 = @"HMDHomeCreateKeychainItemForNFCReaderKeyMessageKeyReaderKey";
      __int16 v44 = 2112;
      id v45 = v6;
      __int16 v46 = 2112;
      id v47 = v17;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Missing reader key keychain item: %@ in payload: %@ error: %@", buf, 0x34u);

      id v5 = v17;
    }

    v19 = [a1[4] workQueue];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __96__HMDHomeNFCReaderKeyManager_requestDevice_toCreateKeychainItemForReaderKeyWithFlow_completion___block_invoke_130;
    v36[3] = &unk_1E6A186E0;
    id v37 = a1[6];
    dispatch_async(v19, v36);

    id v12 = v37;
  }
}

void __96__HMDHomeNFCReaderKeyManager_requestDevice_toCreateKeychainItemForReaderKeyWithFlow_completion___block_invoke_130(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __96__HMDHomeNFCReaderKeyManager_requestDevice_toCreateKeychainItemForReaderKeyWithFlow_completion___block_invoke_131(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1 userInfo:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __96__HMDHomeNFCReaderKeyManager_requestDevice_toCreateKeychainItemForReaderKeyWithFlow_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) UUID];
    uint64_t v7 = *(void *)(a1 + 48);
    int v9 = 138543874;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Resident successfully created keychain item for nfc reader key: %@", (uint8_t *)&v9, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (HMDDevice)primaryResidentDevice
{
  id v2 = [(HMDHomeNFCReaderKeyManager *)self home];
  id v3 = [v2 residentDeviceManager];
  v4 = [v3 primaryResidentDevice];

  id v5 = [v4 device];
  if (v5)
  {
    id v6 = [v4 capabilities];
    if ([v6 supportsWalletKey])
    {
      int v7 = [v4 isReachable];

      if (v7)
      {
        id v8 = v5;
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v8 = 0;
LABEL_7:

  return (HMDDevice *)v8;
}

- (void)removeKeychainItemForReaderKey:(id)a3 home:(id)a4 flow:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(HMDHomeNFCReaderKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v45 = [v8 identifier];
  __int16 v46 = v9;
  id v12 = +[HMDHomeNFCReaderKey keychainItemAccountAttributeValueWithHome:keyIdentifier:](HMDHomeNFCReaderKey, "keychainItemAccountAttributeValueWithHome:keyIdentifier:", v9);
  __int16 v13 = [(HMDHomeNFCReaderKeyManager *)self keychainStore];
  id v48 = 0;
  uint64_t v14 = [v13 allKeychainItemsForType:&unk_1F2DC8BF0 identifier:v12 syncable:MEMORY[0x1E4F1CC38] error:&v48];
  id v15 = v48;
  id v16 = [v14 firstObject];

  id v17 = [v15 userInfo];
  v18 = objc_msgSend(v17, "hmf_errorForKey:", *MEMORY[0x1E4F28A50]);

  if (!v16)
  {
    uint64_t v34 = [v18 code];
    uint64_t v44 = MEMORY[0x1D9452090]();
    id v35 = self;
    id v36 = HMFGetOSLogHandle();
    id v26 = v36;
    if (v34 == -25300)
    {
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        id v37 = HMFGetLogIdentifier();
        __int16 v38 = [v10 UUID];
        *(_DWORD *)buf = 138543618;
        uint64_t v50 = v37;
        __int16 v51 = 2112;
        v52 = v38;
        __int16 v39 = "%{public}@[Flow: %@] Not removing nfc reader key, keychain item does not exist";
        __int16 v40 = v26;
        os_log_type_t v41 = OS_LOG_TYPE_INFO;
        uint32_t v42 = 22;
LABEL_14:
        _os_log_impl(&dword_1D49D5000, v40, v41, v39, buf, v42);
      }
    }
    else if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      id v37 = HMFGetLogIdentifier();
      __int16 v38 = [v10 UUID];
      *(_DWORD *)buf = 138543874;
      uint64_t v50 = v37;
      __int16 v51 = 2112;
      v52 = v38;
      __int16 v53 = 2112;
      id v54 = v15;
      __int16 v39 = "%{public}@[Flow: %@] Failed to remove nfc reader key, keychain item fetch failed: %@";
      __int16 v40 = v26;
      os_log_type_t v41 = OS_LOG_TYPE_ERROR;
      uint32_t v42 = 32;
      goto LABEL_14;
    }
    v23 = (void *)v44;
    goto LABEL_16;
  }
  uint64_t v43 = v18;
  id v19 = v8;
  id v20 = [(HMDHomeNFCReaderKeyManager *)self keychainStore];
  id v47 = v15;
  char v21 = [v20 deleteKeychainItem:v16 error:&v47];
  id v22 = v47;

  v23 = (void *)MEMORY[0x1D9452090]();
  id v24 = self;
  id v25 = HMFGetOSLogHandle();
  id v26 = v25;
  if (v21)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = id v27 = v23;
      id v29 = [v10 UUID];
      *(_DWORD *)buf = 138543874;
      uint64_t v50 = v28;
      __int16 v51 = 2112;
      v52 = v29;
      __int16 v53 = 2112;
      id v54 = v16;
      id v30 = "%{public}@[Flow: %@] Successfully removed nfc reader key keychain item %@";
      id v31 = v26;
      os_log_type_t v32 = OS_LOG_TYPE_INFO;
      uint32_t v33 = 32;
LABEL_10:
      _os_log_impl(&dword_1D49D5000, v31, v32, v30, buf, v33);

      v23 = v27;
    }
  }
  else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v28 = id v27 = v23;
    id v29 = [v10 UUID];
    *(_DWORD *)buf = 138544130;
    uint64_t v50 = v28;
    __int16 v51 = 2112;
    v52 = v29;
    __int16 v53 = 2112;
    id v54 = v16;
    __int16 v55 = 2112;
    id v56 = v22;
    id v30 = "%{public}@[Flow: %@] Failed to remove nfc reader key keychain item %@:%@";
    id v31 = v26;
    os_log_type_t v32 = OS_LOG_TYPE_ERROR;
    uint32_t v33 = 42;
    goto LABEL_10;
  }
  id v15 = v22;
  id v8 = v19;
  v18 = v43;
LABEL_16:
}

- (id)createNFCReaderKeyModelWithHome:(id)a3 nfcReaderKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDHomeNFCReaderKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = +[HMDHomeNFCReaderKeyModel defaultModelForHome:v7];

  [v9 setNfcReaderKey:v6];
  return v9;
}

- (void)createReaderKeyKeychainItemForHome:(id)a3 isForceUpdate:(BOOL)a4 flow:(id)a5 completion:(id)a6
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  __int16 v13 = [(HMDHomeNFCReaderKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v13);

  uint64_t v14 = [v10 homeManager];
  char v15 = [v14 hasLoadedData];

  if (v15)
  {
    v80 = v11;
    id v16 = [(HMDHomeNFCReaderKeyManager *)self createKeychainItemFuture];

    id v17 = [(HMDHomeNFCReaderKeyManager *)self createKeychainItemFuture];

    if (!v17)
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
      [(HMDHomeNFCReaderKeyManager *)self setCreateKeychainItemFuture:v18];
    }
    id v19 = [(HMDHomeNFCReaderKeyManager *)self createKeychainItemFuture];
    id v20 = [(HMDHomeNFCReaderKeyManager *)self createKeychainItemFuture];
    char v21 = (void *)MEMORY[0x1E4F7A0F0];
    id v22 = [(HMDHomeNFCReaderKeyManager *)self workQueue];
    v23 = [v21 schedulerWithDispatchQueue:v22];
    id v24 = [v20 reschedule:v23];
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __95__HMDHomeNFCReaderKeyManager_createReaderKeyKeychainItemForHome_isForceUpdate_flow_completion___block_invoke;
    v90[3] = &unk_1E6A11070;
    v90[4] = self;
    id v25 = v19;
    id v91 = v25;
    id v92 = v12;
    id v26 = (id)[v24 addCompletionBlock:v90];

    id v11 = v80;
    if (!v16)
    {
      id v27 = (void *)MEMORY[0x1D9452090]();
      id v28 = self;
      id v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        id v30 = HMFGetLogIdentifier();
        id v31 = [v80 UUID];
        *(_DWORD *)buf = 138543618;
        v94 = v30;
        __int16 v95 = 2112;
        v96 = v31;
        _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Creating reader key", buf, 0x16u);
      }
      os_log_type_t v32 = +[HMDHomeNFCReaderKey createRandomKey];
      uint32_t v33 = v32;
      if (v32)
      {
        uint64_t v34 = [v32 createKeychainItemForHome:v10];
        if (v34)
        {
          v78 = v33;
          id v35 = [(HMDHomeNFCReaderKeyManager *)v28 keychainStore];
          id v89 = 0;
          char v36 = [v35 updateKeychainItem:v34 createIfNeeded:1 error:&v89];
          id v37 = v89;

          __int16 v38 = (void *)MEMORY[0x1D9452090]();
          __int16 v39 = v28;
          __int16 v40 = HMFGetOSLogHandle();
          os_log_type_t v41 = v40;
          if (v36)
          {
            id v77 = v37;
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v43 = uint32_t v42 = v38;
              uint64_t v44 = [v80 UUID];
              *(_DWORD *)buf = 138544130;
              v94 = v43;
              __int16 v95 = 2112;
              v96 = v44;
              __int16 v97 = 2112;
              v98 = v34;
              __int16 v99 = 2112;
              id v100 = v78;
              _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully created keychain item: %@ for nfc reader key: %@", buf, 0x2Au);

              __int16 v38 = v42;
            }

            id v45 = objc_alloc(MEMORY[0x1E4F654B0]);
            __int16 v46 = NSStringFromSelector(a2);
            id v47 = [MEMORY[0x1E4F65488] allMessageDestinations];
            id v48 = (void *)[v45 initWithName:v46 destination:v47 payload:0];

            v85[0] = MEMORY[0x1E4F143A8];
            v85[1] = 3221225472;
            v85[2] = __95__HMDHomeNFCReaderKeyManager_createReaderKeyKeychainItemForHome_isForceUpdate_flow_completion___block_invoke_121;
            v85[3] = &unk_1E6A11098;
            v85[4] = v39;
            id v75 = v80;
            id v86 = v75;
            id v49 = v78;
            id v87 = v49;
            id v50 = v10;
            id v88 = v50;
            [v48 setResponseHandler:v85];
            v76 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
            [(HMDHomeNFCReaderKeyManager *)v39 createNFCReaderKeyModelWithHome:v50 nfcReaderKey:v49];
            __int16 v51 = v74 = v39;
            v52 = [v50 backingStore];
            __int16 v53 = [v52 transaction:@"Creating NFC Reader Key" options:v76];

            uint32_t v33 = v78;
            [v53 add:v51 withMessage:v48];
            v81[0] = MEMORY[0x1E4F143A8];
            v81[1] = 3221225472;
            v81[2] = __95__HMDHomeNFCReaderKeyManager_createReaderKeyKeychainItemForHome_isForceUpdate_flow_completion___block_invoke_2;
            v81[3] = &unk_1E6A143D0;
            v81[4] = v74;
            id v82 = v75;
            id v83 = v49;
            id v84 = v50;
            [v53 run:v81];

            id v11 = v80;
            id v37 = v77;
          }
          else
          {
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v71 = v70 = v38;
              v72 = [v80 UUID];
              *(_DWORD *)buf = 138544130;
              v94 = v71;
              __int16 v95 = 2112;
              v96 = v72;
              __int16 v97 = 2112;
              v98 = v34;
              __int16 v99 = 2112;
              id v100 = v37;
              _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add nfc reader key item: %@ to key chain: %@", buf, 0x2Au);

              __int16 v38 = v70;
            }

            id v48 = [(HMDHomeNFCReaderKeyManager *)v39 createKeychainItemFuture];
            v73 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
            [v48 finishWithError:v73];

            uint32_t v33 = v78;
            id v11 = v80;
          }
        }
        else
        {
          v64 = (void *)MEMORY[0x1D9452090]();
          v65 = v28;
          v66 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v79 = v64;
            v68 = v67 = v33;
            v69 = [v80 UUID];
            *(_DWORD *)buf = 138543874;
            v94 = v68;
            __int16 v95 = 2112;
            v96 = v69;
            __int16 v97 = 2112;
            v98 = v67;
            _os_log_impl(&dword_1D49D5000, v66, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create keychain item  for reader key: %@", buf, 0x20u);

            uint32_t v33 = v67;
            v64 = v79;
          }

          id v37 = [(HMDHomeNFCReaderKeyManager *)v65 createKeychainItemFuture];
          id v48 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
          [v37 finishWithError:v48];
        }
      }
      else
      {
        v59 = (void *)MEMORY[0x1D9452090]();
        v60 = v28;
        v61 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          v62 = HMFGetLogIdentifier();
          v63 = [v80 UUID];
          *(_DWORD *)buf = 138543618;
          v94 = v62;
          __int16 v95 = 2112;
          v96 = v63;
          _os_log_impl(&dword_1D49D5000, v61, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create the nfc reader key", buf, 0x16u);

          uint32_t v33 = 0;
        }

        uint64_t v34 = [(HMDHomeNFCReaderKeyManager *)v60 createKeychainItemFuture];
        id v37 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
        [v34 finishWithError:v37];
      }
    }
  }
  else
  {
    id v54 = (void *)MEMORY[0x1D9452090]();
    __int16 v55 = self;
    id v56 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      uint64_t v57 = HMFGetLogIdentifier();
      v58 = [v11 UUID];
      *(_DWORD *)buf = 138543618;
      v94 = v57;
      __int16 v95 = 2112;
      v96 = v58;
      _os_log_impl(&dword_1D49D5000, v56, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Not creating nfc reader key, home data load is in progress.", buf, 0x16u);
    }
    id v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    (*((void (**)(id, void, id))v12 + 2))(v12, 0, v25);
  }
}

void __95__HMDHomeNFCReaderKeyManager_createReaderKeyKeychainItemForHome_isForceUpdate_flow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) createKeychainItemFuture];
  id v7 = *(void **)(a1 + 40);

  if (v6 == v7) {
    [*(id *)(a1 + 32) setCreateKeychainItemFuture:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __95__HMDHomeNFCReaderKeyManager_createReaderKeyKeychainItemForHome_isForceUpdate_flow_completion___block_invoke_121(id *a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = a1[4];
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [a1[5] UUID];
      *(_DWORD *)buf = 138543874;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v11;
      __int16 v27 = 2112;
      id v28 = v5;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] NFC reader key transaction message response handler called with: %@", buf, 0x20u);
    }
    id v12 = [a1[4] workQueue];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __95__HMDHomeNFCReaderKeyManager_createReaderKeyKeychainItemForHome_isForceUpdate_flow_completion___block_invoke_122;
    id v18 = &unk_1E6A18668;
    id v19 = a1[4];
    id v20 = a1[6];
    id v21 = a1[7];
    id v22 = a1[5];
    dispatch_async(v12, &v15);

    __int16 v13 = objc_msgSend(a1[4], "createKeychainItemFuture", v15, v16, v17, v18, v19);
    [v13 finishWithError:v5];
  }
  else
  {
    uint64_t v14 = [a1[4] createKeychainItemFuture];
    [v14 finishWithResult:a1[6]];
  }
}

void __95__HMDHomeNFCReaderKeyManager_createReaderKeyKeychainItemForHome_isForceUpdate_flow_completion___block_invoke_2(id *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = a1[4];
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = [a1[5] UUID];
      *(_DWORD *)buf = 138543874;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] NFC reader key transaction run failed: %@", buf, 0x20u);
    }
    id v9 = [a1[4] workQueue];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    __int16 v13 = __95__HMDHomeNFCReaderKeyManager_createReaderKeyKeychainItemForHome_isForceUpdate_flow_completion___block_invoke_126;
    uint64_t v14 = &unk_1E6A18668;
    id v15 = a1[4];
    id v16 = a1[6];
    id v17 = a1[7];
    id v18 = a1[5];
    dispatch_async(v9, &v11);

    id v10 = objc_msgSend(a1[4], "createKeychainItemFuture", v11, v12, v13, v14, v15);
    [v10 finishWithError:v3];
  }
}

uint64_t __95__HMDHomeNFCReaderKeyManager_createReaderKeyKeychainItemForHome_isForceUpdate_flow_completion___block_invoke_126(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeKeychainItemForReaderKey:*(void *)(a1 + 40) home:*(void *)(a1 + 48) flow:*(void *)(a1 + 56)];
}

uint64_t __95__HMDHomeNFCReaderKeyManager_createReaderKeyKeychainItemForHome_isForceUpdate_flow_completion___block_invoke_122(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeKeychainItemForReaderKey:*(void *)(a1 + 40) home:*(void *)(a1 + 48) flow:*(void *)(a1 + 56)];
}

- (id)readerKeyWithKeychainItemIdentifier:(id)a3 error:(id *)a4 flow:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HMDHomeNFCReaderKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = [(HMDHomeNFCReaderKeyManager *)self keychainStore];
  uint64_t v12 = [v11 allKeychainItemsForType:&unk_1F2DC8BF0 identifier:v8 syncable:MEMORY[0x1E4F1CC38] error:a4];

  if ([v12 count])
  {
    __int16 v13 = (void *)MEMORY[0x1D9452090]();
    uint64_t v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      id v17 = [v9 UUID];
      int v21 = 138544130;
      id v22 = v16;
      __int16 v23 = 2112;
      id v24 = v17;
      __int16 v25 = 2112;
      id v26 = v12;
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Found keychain items: %@ for nfc reader key with keychain item identifier: %@", (uint8_t *)&v21, 0x2Au);
    }
    id v18 = [v12 firstObject];
    id v19 = +[HMDHomeNFCReaderKey createWithKeychainItem:v18];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (void)deleteKeychainItemForNFCReaderKeyIsForceUpdate:(BOOL)a3 withFlow:(id)a4 completion:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [(HMDHomeNFCReaderKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = [(HMDHomeNFCReaderKeyManager *)self home];
  uint64_t v12 = v11;
  if (v11)
  {
    __int16 v13 = [v11 homeManager];
    if ([v13 hasLoadedData])
    {
      id v14 = [v12 nfcReaderKey];
      if (v14)
      {
        id v15 = objc_alloc(MEMORY[0x1E4F654B0]);
        id v16 = NSStringFromSelector(a2);
        id v17 = [MEMORY[0x1E4F65488] allMessageDestinations];
        id v18 = (void *)[v15 initWithName:v16 destination:v17 payload:0];

        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __97__HMDHomeNFCReaderKeyManager_deleteKeychainItemForNFCReaderKeyIsForceUpdate_withFlow_completion___block_invoke;
        v30[3] = &unk_1E6A185A0;
        id v34 = v9;
        v30[4] = self;
        id v14 = v14;
        id v31 = v14;
        id v19 = v12;
        id v32 = v19;
        id v33 = v8;
        [v18 setResponseHandler:v30];
        id v20 = [(HMDHomeNFCReaderKeyManager *)self createNFCReaderKeyModelWithHome:v19 nfcReaderKey:0];
        int v21 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
        id v22 = [v19 backingStore];
        __int16 v23 = [v22 transaction:@"Deleting NFC Reader Key" options:v21];

        [v23 add:v20 withMessage:v18];
        [v23 run];
      }
      else
      {
        uint64_t v29 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        (*((void (**)(id, void *))v9 + 2))(v9, v29);
      }
    }
    else
    {
      id v24 = (void *)MEMORY[0x1D9452090]();
      __int16 v25 = self;
      id v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        __int16 v27 = HMFGetLogIdentifier();
        id v28 = [v8 UUID];
        *(_DWORD *)buf = 138543618;
        char v36 = v27;
        __int16 v37 = 2112;
        __int16 v38 = v28;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not deleting reader key, home data load is in progress.", buf, 0x16u);
      }
      id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      (*((void (**)(id, id))v9 + 2))(v9, v14);
    }
  }
  else
  {
    __int16 v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    (*((void (**)(id, void *))v9 + 2))(v9, v13);
  }
}

void __97__HMDHomeNFCReaderKeyManager_deleteKeychainItemForNFCReaderKeyIsForceUpdate_withFlow_completion___block_invoke(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v15 = *MEMORY[0x1E4F28A50];
    v16[0] = a2;
    id v3 = (void *)MEMORY[0x1E4F1C9E8];
    id v4 = a2;
    id v5 = [v3 dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v6 = *(void *)(a1 + 64);
    id v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1 userInfo:v5];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) workQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __97__HMDHomeNFCReaderKeyManager_deleteKeychainItemForNFCReaderKeyIsForceUpdate_withFlow_completion___block_invoke_2;
    v10[3] = &unk_1E6A18488;
    id v9 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v9;
    id v12 = *(id *)(a1 + 48);
    id v13 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 64);
    dispatch_async(v8, v10);

    id v5 = 0;
  }
}

uint64_t __97__HMDHomeNFCReaderKeyManager_deleteKeychainItemForNFCReaderKeyIsForceUpdate_withFlow_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeKeychainItemForReaderKey:*(void *)(a1 + 40) home:*(void *)(a1 + 48) flow:*(void *)(a1 + 56)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  return v2();
}

- (id)requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeNFCReaderKeyManager *)self home];
  uint64_t v6 = [v5 residentDeviceManager];
  id v7 = [v6 primaryResidentDevice];

  id v8 = [v7 device];
  id v9 = v8;
  if (v8 && ([v8 isCurrentDevice] & 1) == 0)
  {
    id v18 = objc_opt_new();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __85__HMDHomeNFCReaderKeyManager_requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow___block_invoke;
    v20[3] = &unk_1E6A11020;
    id v17 = v18;
    id v21 = v17;
    [(HMDHomeNFCReaderKeyManager *)self requestDevice:v9 toCreateKeychainItemForReaderKeyWithFlow:v4 completion:v20];
    id v16 = v21;
  }
  else
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = [v4 UUID];
      *(_DWORD *)buf = 138543618;
      __int16 v23 = v13;
      __int16 v24 = 2112;
      __int16 v25 = v14;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Did not find primary resident", buf, 0x16u);
    }
    uint64_t v15 = (void *)MEMORY[0x1E4F7A0D8];
    id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:91];
    id v17 = [v15 futureWithError:v16];
  }

  return v17;
}

uint64_t __85__HMDHomeNFCReaderKeyManager_requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

- (void)handleSystemKeychainStoreUpdatedNotification:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v5 UUID];
    *(_DWORD *)buf = 138543618;
    id v22 = v9;
    __int16 v23 = 2112;
    __int16 v24 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling system keychain store updated notification", buf, 0x16u);
  }
  id v11 = [(HMDHomeNFCReaderKeyManager *)v7 home];
  if (v11)
  {
    id v12 = [(HMDHomeNFCReaderKeyManager *)v7 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__HMDHomeNFCReaderKeyManager_handleSystemKeychainStoreUpdatedNotification___block_invoke;
    block[3] = &unk_1E6A19668;
    block[4] = v7;
    id v19 = v11;
    id v20 = v5;
    dispatch_async(v12, block);
  }
  else
  {
    id v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = v7;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      id v17 = [v5 UUID];
      *(_DWORD *)buf = 138543618;
      id v22 = v16;
      __int16 v23 = 2112;
      __int16 v24 = v17;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Not handling keychain update, home is nil", buf, 0x16u);
    }
  }
}

void __75__HMDHomeNFCReaderKeyManager_handleSystemKeychainStoreUpdatedNotification___block_invoke(id *a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v2 = [a1[4] dataSource];
  char v3 = [v2 isWatch];

  id v4 = [a1[5] currentUser];
  int v5 = [v4 isOwner];

  if ((v3 & 1) != 0 || v5 != 1)
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = a1[4];
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      id v16 = [a1[6] UUID];
      id v17 = HMFBooleanToString();
      id v18 = HMFBooleanToString();
      *(_DWORD *)buf = 138544130;
      id v31 = v15;
      __int16 v32 = 2112;
      id v33 = v16;
      __int16 v34 = 2112;
      id v35 = v17;
      __int16 v36 = 2112;
      __int16 v37 = v18;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not handling keychain update because it is watch: %@ or is not owner device: %@", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v6 = [a1[5] nfcReaderKey];
    id v7 = [v6 identifier];

    if (v7)
    {
      id v8 = +[HMDHomeNFCReaderKey keychainItemAccountAttributeValueWithHome:a1[5] keyIdentifier:v7];
      id v9 = a1[4];
      id v29 = 0;
      id v10 = [v9 readerKeyWithKeychainItemIdentifier:v8 error:&v29 flow:a1[6]];
      id v11 = v29;
      if (v10)
      {
        logAndPostNotification(@"HMDHomeNFCReaderKeyKeychainItemAvailableNotification", a1[4], 0);
      }
      else
      {
        __int16 v24 = (void *)MEMORY[0x1D9452090]();
        id v25 = a1[4];
        uint64_t v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          __int16 v27 = HMFGetLogIdentifier();
          id v28 = [a1[6] UUID];
          *(_DWORD *)buf = 138544130;
          id v31 = v27;
          __int16 v32 = 2112;
          id v33 = v28;
          __int16 v34 = 2112;
          id v35 = v7;
          __int16 v36 = 2112;
          __int16 v37 = v8;
          _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to fetch reader key with identifier: %@ and keychain item identifier: %@", buf, 0x2Au);
        }
      }
    }
    else
    {
      id v19 = (void *)MEMORY[0x1D9452090]();
      id v20 = a1[4];
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v22 = HMFGetLogIdentifier();
        __int16 v23 = [a1[6] UUID];
        *(_DWORD *)buf = 138543618;
        id v31 = v22;
        __int16 v32 = 2112;
        id v33 = v23;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not handling nfc reader key update because it set to nil on home", buf, 0x16u);
      }
    }
  }
}

- (void)handleHomeRemovedNotification:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKey:@"HMDHomeNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  id v9 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
  id v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    id v14 = [v9 UUID];
    *(_DWORD *)buf = 138543874;
    uint32_t v42 = v13;
    __int16 v43 = 2112;
    uint64_t v44 = v14;
    __int16 v45 = 2112;
    id v46 = v8;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling home removed notification: %@", buf, 0x20u);
  }
  id v15 = [(HMDHomeNFCReaderKeyManager *)v11 home];
  if (v15 == v8)
  {
    id v16 = [(HMDHomeNFCReaderKeyManager *)v11 dataSource];
    char v17 = [v16 isWatch];

    id v18 = [v8 currentUser];
    int v19 = [v18 isOwner];

    if ((v17 & 1) != 0 || v19 != 1)
    {
      __int16 v24 = (void *)MEMORY[0x1D9452090]();
      id v25 = v11;
      uint64_t v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        __int16 v27 = HMFGetLogIdentifier();
        [v9 UUID];
        v28 = __int16 v36 = v24;
        id v29 = HMFBooleanToString();
        id v30 = HMFBooleanToString();
        *(_DWORD *)buf = 138544130;
        uint32_t v42 = v27;
        __int16 v43 = 2112;
        uint64_t v44 = v28;
        __int16 v45 = 2112;
        id v46 = v29;
        __int16 v47 = 2112;
        id v48 = v30;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not removing nfc reader key because it is watch: %@ or is not owner device: %@", buf, 0x2Au);

        __int16 v24 = v36;
      }
    }
    else
    {
      id v20 = [(HMDHomeNFCReaderKeyManager *)v11 primaryResidentDevice];
      id v21 = v20;
      if (v20 && ([v20 isCurrentDevice] & 1) == 0)
      {
        id v31 = (void *)MEMORY[0x1D9452090]();
        __int16 v32 = v11;
        id v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          __int16 v34 = HMFGetLogIdentifier();
          id v35 = [v9 UUID];
          *(_DWORD *)buf = 138543618;
          uint32_t v42 = v34;
          __int16 v43 = 2112;
          uint64_t v44 = v35;
          _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Skipping removal of nfc reader key on current device because home has a primary resident that supports wallet key", buf, 0x16u);
        }
      }
      else
      {
        id v22 = [v8 nfcReaderKey];
        if (v22)
        {
          __int16 v23 = [(HMDHomeNFCReaderKeyManager *)v11 workQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __60__HMDHomeNFCReaderKeyManager_handleHomeRemovedNotification___block_invoke;
          block[3] = &unk_1E6A18668;
          block[4] = v11;
          id v38 = v22;
          id v39 = v8;
          id v40 = v9;
          dispatch_async(v23, block);
        }
      }
    }
  }
}

uint64_t __60__HMDHomeNFCReaderKeyManager_handleHomeRemovedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeKeychainItemForReaderKey:*(void *)(a1 + 40) home:*(void *)(a1 + 48) flow:*(void *)(a1 + 56)];
}

- (void)handleHomeDidUpdateNFCReaderKeyNotification:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  id v8 = [(HMDHomeNFCReaderKeyManager *)self dataSource];
  char v9 = [v8 isWatch];

  id v10 = [(HMDHomeNFCReaderKeyManager *)self home];
  id v11 = [v10 currentUser];
  int v12 = [v11 isOwner];

  int v13 = v12 ^ 1;
  if ((v9 & 1) != 0 || v13)
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = self;
    char v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      int v19 = HMFBooleanToString();
      id v20 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      id v25 = v18;
      __int16 v26 = 2112;
      __int16 v27 = v19;
      __int16 v28 = 2112;
      id v29 = v20;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Not handling home nfc reader key update notification because it is watch: %@ or is not owner device: %@", buf, 0x20u);
    }
  }
  else
  {
    id v14 = [(HMDHomeNFCReaderKeyManager *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__HMDHomeNFCReaderKeyManager_handleHomeDidUpdateNFCReaderKeyNotification___block_invoke;
    block[3] = &unk_1E6A19668;
    block[4] = self;
    id v22 = v4;
    id v23 = v7;
    dispatch_async(v14, block);
  }
}

void __74__HMDHomeNFCReaderKeyManager_handleHomeDidUpdateNFCReaderKeyNotification___block_invoke(id *a1)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F65430] internalOnlyInitializer];
  char v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = a1[4];
  int v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    id v7 = [v2 UUID];
    *(_DWORD *)buf = 138543618;
    v59 = v6;
    __int16 v60 = 2112;
    v61 = v7;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling HomeDidUpdateNFCReaderKeyNotification", buf, 0x16u);
  }
  id v8 = [a1[5] userInfo];
  char v9 = [v8 objectForKeyedSubscript:@"HMDHomeDidUpdateNFCReaderKeyNotificationKeyPreviousNFCReaderKey"];

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
    int v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = a1[4];
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      id v16 = [v2 UUID];
      *(_DWORD *)buf = 138543874;
      v59 = v15;
      __int16 v60 = 2112;
      v61 = v16;
      __int16 v62 = 2112;
      id v63 = v11;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Removing keychain item for nfc reader key: %@", buf, 0x20u);
    }
    [a1[4] removeKeychainItemForReaderKey:v11 home:a1[6] flow:v2];
  }
  char v17 = [a1[6] nfcReaderKey];
  id v18 = v17;
  if (v17)
  {
    int v19 = [v17 identifier];
    id v20 = +[HMDHomeNFCReaderKey keychainItemAccountAttributeValueWithHome:a1[6] keyIdentifier:v19];
    id v21 = a1[4];
    id v57 = 0;
    id v22 = [v21 readerKeyWithKeychainItemIdentifier:v20 error:&v57 flow:v2];
    id v23 = v57;
    if (v22)
    {
      __int16 v53 = v22;
      __int16 v24 = [a1[4] keyIdentifiersAlreadyUpdated];
      int v25 = [v24 containsObject:v19];

      if (v25)
      {
        __int16 v26 = (void *)MEMORY[0x1D9452090]();
        id v27 = a1[4];
        __int16 v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          id v29 = HMFGetLogIdentifier();
          [v2 UUID];
          uint64_t v30 = v50 = v26;
          *(_DWORD *)buf = 138543874;
          v59 = v29;
          __int16 v60 = 2112;
          v61 = v30;
          __int16 v62 = 2112;
          id v63 = v19;
          _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Already updated Reader key with key identifier: %@", buf, 0x20u);

          __int16 v26 = v50;
        }
      }
      else
      {
        id v52 = v23;
        os_log_type_t v41 = [a1[4] keyIdentifiersAlreadyUpdated];
        [v41 addObject:v19];

        uint32_t v42 = (void *)MEMORY[0x1D9452090]();
        id v43 = a1[4];
        uint64_t v44 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          __int16 v45 = HMFGetLogIdentifier();
          [v2 UUID];
          id v46 = v49 = v42;
          *(_DWORD *)buf = 138543874;
          v59 = v45;
          __int16 v60 = 2112;
          v61 = v46;
          __int16 v62 = 2112;
          id v63 = v19;
          _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Caching did update reader key with key identifier: %@", buf, 0x20u);

          uint32_t v42 = v49;
        }

        dispatch_time_t v47 = dispatch_time(0, 86400000000000);
        id v48 = [a1[4] workQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __74__HMDHomeNFCReaderKeyManager_handleHomeDidUpdateNFCReaderKeyNotification___block_invoke_111;
        block[3] = &unk_1E6A19668;
        block[4] = a1[4];
        id v55 = v2;
        id v56 = v19;
        dispatch_after(v47, v48, block);

        logAndPostNotification(@"HMDHomeNFCReaderKeyKeychainItemAvailableNotification", a1[4], 0);
        id v23 = v52;
      }
      id v22 = v53;
    }
    else
    {
      __int16 v36 = (void *)MEMORY[0x1D9452090]();
      id v37 = a1[4];
      id v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        id v39 = HMFGetLogIdentifier();
        [v2 UUID];
        id v40 = v51 = v36;
        *(_DWORD *)buf = 138544130;
        v59 = v39;
        __int16 v60 = 2112;
        v61 = v40;
        __int16 v62 = 2112;
        id v63 = v19;
        __int16 v64 = 2112;
        v65 = v20;
        _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to fetch reader key with identifier: %@ and keychain item identifier: %@", buf, 0x2Au);

        __int16 v36 = v51;
        id v22 = 0;
      }
    }
  }
  else
  {
    id v31 = (void *)MEMORY[0x1D9452090]();
    id v32 = a1[4];
    id v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      __int16 v34 = HMFGetLogIdentifier();
      id v35 = [v2 UUID];
      *(_DWORD *)buf = 138543618;
      v59 = v34;
      __int16 v60 = 2112;
      v61 = v35;
      _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Received home nfc reader key did update notification but its not set for home", buf, 0x16u);
    }
  }
}

void __74__HMDHomeNFCReaderKeyManager_handleHomeDidUpdateNFCReaderKeyNotification___block_invoke_111(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = HMFGetLogIdentifier();
    uint64_t v6 = [*(id *)(a1 + 40) UUID];
    uint64_t v7 = *(void *)(a1 + 48);
    int v9 = 138543874;
    id v10 = v5;
    __int16 v11 = 2112;
    int v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Removing key identifier from keyIdentifiersAlreadyUpdated: %@", (uint8_t *)&v9, 0x20u);
  }
  id v8 = [*(id *)(a1 + 32) keyIdentifiersAlreadyUpdated];
  [v8 removeObject:*(void *)(a1 + 48)];
}

- (void)unconfigure
{
  id v3 = [(HMDHomeNFCReaderKeyManager *)self messageDispatcher];
  [v3 deregisterReceiver:self];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  id v5 = [(HMDHomeNFCReaderKeyManager *)self accessoryManager];
  [v5 unconfigure];
}

- (void)rollReaderKeyWithFlow:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDHomeNFCReaderKeyManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__HMDHomeNFCReaderKeyManager_rollReaderKeyWithFlow_withCompletion___block_invoke;
  block[3] = &unk_1E6A193D0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __67__HMDHomeNFCReaderKeyManager_rollReaderKeyWithFlow_withCompletion___block_invoke(id *a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = a1[4];
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [a1[5] UUID];
    *(_DWORD *)buf = 138543618;
    id v39 = v5;
    __int16 v40 = 2112;
    os_log_type_t v41 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] rollReaderKeyWithFlow", buf, 0x16u);
  }
  if (isInternalBuild())
  {
    id v7 = [a1[4] home];
    id v8 = [v7 currentUser];
    id v9 = v8;
    if (v7 && v8)
    {
      if (([v8 isOwner] & 1) == 0)
      {
        id v10 = (void *)MEMORY[0x1D9452090]();
        id v11 = a1[4];
        id v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          id v13 = HMFGetLogIdentifier();
          uint64_t v14 = [a1[5] UUID];
          *(_DWORD *)buf = 138543618;
          id v39 = v13;
          __int16 v40 = 2112;
          os_log_type_t v41 = v14;
          _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] We are not the owner, so unable to roll reader key", buf, 0x16u);
        }
        uint64_t v15 = (void (**)(id, void *))a1[6];
        id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:17];
        v15[2](v15, v16);
      }
      id v17 = a1[4];
      id v18 = a1[5];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __67__HMDHomeNFCReaderKeyManager_rollReaderKeyWithFlow_withCompletion___block_invoke_108;
      v34[3] = &unk_1E6A19A28;
      id v19 = a1[6];
      id v20 = a1[4];
      id v37 = v19;
      void v34[4] = v20;
      id v35 = v7;
      id v36 = a1[5];
      [v17 deleteKeychainItemForNFCReaderKeyIsForceUpdate:1 withFlow:v18 completion:v34];

      id v21 = v37;
    }
    else
    {
      __int16 v28 = (void *)MEMORY[0x1D9452090]();
      id v29 = a1[4];
      uint64_t v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        id v31 = HMFGetLogIdentifier();
        id v32 = [a1[5] UUID];
        *(_DWORD *)buf = 138544130;
        id v39 = v31;
        __int16 v40 = 2112;
        os_log_type_t v41 = v32;
        __int16 v42 = 2112;
        id v43 = v7;
        __int16 v44 = 2112;
        __int16 v45 = v9;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to roll reader key, home or currentUser is nil. home: %@, currentUser: %@", buf, 0x2Au);
      }
      id v33 = (void (**)(id, void *))a1[6];
      id v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      v33[2](v33, v21);
    }
  }
  else
  {
    id v22 = (void *)MEMORY[0x1D9452090]();
    id v23 = a1[4];
    __int16 v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v25 = HMFGetLogIdentifier();
      __int16 v26 = [a1[5] UUID];
      *(_DWORD *)buf = 138543618;
      id v39 = v25;
      __int16 v40 = 2112;
      os_log_type_t v41 = v26;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to roll reader key, not internal build", buf, 0x16u);
    }
    id v27 = (void (**)(id, void *))a1[6];
    id v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    v27[2](v27, v7);
  }
}

void __67__HMDHomeNFCReaderKeyManager_rollReaderKeyWithFlow_withCompletion___block_invoke_108(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 domain];
    id v6 = v5;
    if (v5 != (void *)*MEMORY[0x1E4F2D140])
    {

LABEL_6:
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_7;
    }
    uint64_t v7 = [v4 code];

    if (v7 != 2) {
      goto LABEL_6;
    }
  }
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__HMDHomeNFCReaderKeyManager_rollReaderKeyWithFlow_withCompletion___block_invoke_2;
  v11[3] = &unk_1E6A11048;
  uint64_t v10 = *(void *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  [v8 createReaderKeyKeychainItemForHome:v9 isForceUpdate:1 flow:v10 completion:v11];

LABEL_7:
}

uint64_t __67__HMDHomeNFCReaderKeyManager_rollReaderKeyWithFlow_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)fetchOrCreateReaderKeyForPairingWithFlow:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeNFCReaderKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  uint64_t v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    uint64_t v10 = [v4 UUID];
    *(_DWORD *)buf = 138543618;
    uint64_t v66 = v9;
    __int16 v67 = 2112;
    v68 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] fetchOrCreateReaderKeyForPairingWithFlow", buf, 0x16u);
  }
  id v11 = [(HMDHomeNFCReaderKeyManager *)v7 home];
  id v12 = [v11 currentUser];
  id v13 = v12;
  if (v11 && v12)
  {
    if ([v12 isOwner])
    {
      uint64_t v14 = [v11 nfcReaderKey];
      uint64_t v15 = [v11 nfcReaderKey];
      id v16 = [v15 identifier];

      if (v16)
      {
        id v17 = +[HMDHomeNFCReaderKey keychainItemAccountAttributeValueWithHome:v11 keyIdentifier:v16];
        id v18 = (void *)MEMORY[0x1D9452090]();
        id v19 = v7;
        id v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v59 = v16;
          v22 = id v21 = v14;
          id v23 = [v4 UUID];
          *(_DWORD *)buf = 138544130;
          uint64_t v66 = v22;
          __int16 v67 = 2112;
          v68 = v23;
          __int16 v69 = 2112;
          v70 = v17;
          __int16 v71 = 2112;
          id v72 = v21;
          _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Looking for key chain item with identifier: %@ for reader key: %@", buf, 0x2Au);

          uint64_t v14 = v21;
          id v16 = v59;
        }

        id v64 = 0;
        __int16 v24 = [(HMDHomeNFCReaderKeyManager *)v19 readerKeyWithKeychainItemIdentifier:v17 error:&v64 flow:v4];
        id v25 = v64;
        if (v24)
        {
          __int16 v26 = [MEMORY[0x1E4F7A0D8] futureWithResult:v24];
        }
        else
        {
          __int16 v60 = v14;
          __int16 v44 = (void *)MEMORY[0x1D9452090]();
          __int16 v45 = v19;
          uint64_t v46 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            dispatch_time_t v47 = v57 = v25;
            [v4 UUID];
            id v48 = v56 = v44;
            *(_DWORD *)buf = 138544386;
            uint64_t v66 = v47;
            __int16 v67 = 2112;
            v68 = v48;
            __int16 v69 = 2112;
            v70 = v17;
            __int16 v71 = 2112;
            id v72 = v60;
            __int16 v73 = 2112;
            id v74 = v57;
            _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch keychain item with identifier: %@ for nfc reader key %@:%@", buf, 0x34u);

            __int16 v44 = v56;
            id v25 = v57;
          }

          uint64_t v49 = (void *)MEMORY[0x1D9452090]();
          id v50 = v45;
          __int16 v51 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
          {
            HMFGetLogIdentifier();
            id v52 = v58 = v49;
            *(_DWORD *)buf = 138544130;
            uint64_t v66 = v52;
            __int16 v67 = 2112;
            v68 = v17;
            __int16 v69 = 2112;
            v70 = v60;
            __int16 v71 = 2112;
            id v72 = v25;
            _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Failed to fetch keychain item with identifier: %@ for nfc reader key %@:%@", buf, 0x2Au);

            uint64_t v49 = v58;
          }

          uint64_t v14 = v60;
          __int16 v53 = [[HMDAssertionLogEvent alloc] initWithReason:@"Failed to fetch keychain item with identifier: %@ for nfc reader key %@:%@", v17, v60, v25];
          id v54 = +[HMDMetricsManager sharedLogEventSubmitter];
          [v54 submitLogEvent:v53];

          __int16 v26 = [MEMORY[0x1E4F7A0D8] futureWithError:v25];
        }
      }
      else
      {
        id v39 = (void *)MEMORY[0x1D9452090]();
        __int16 v40 = v7;
        os_log_type_t v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          __int16 v42 = HMFGetLogIdentifier();
          id v43 = [v4 UUID];
          *(_DWORD *)buf = 138543618;
          uint64_t v66 = v42;
          __int16 v67 = 2112;
          v68 = v43;
          _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Did not find an existing key in the home graph, so fetching the key from the resident", buf, 0x16u);
        }
        id v17 = [(HMDHomeNFCReaderKeyManager *)v40 requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow:v4];
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __71__HMDHomeNFCReaderKeyManager_fetchOrCreateReaderKeyForPairingWithFlow___block_invoke;
        v61[3] = &unk_1E6A143A8;
        v61[4] = v40;
        id v62 = v4;
        id v63 = v11;
        __int16 v26 = [v17 recover:v61];
      }
    }
    else
    {
      __int16 v34 = (void *)MEMORY[0x1D9452090]();
      id v35 = v7;
      id v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        id v37 = HMFGetLogIdentifier();
        id v38 = [v4 UUID];
        *(_DWORD *)buf = 138543618;
        uint64_t v66 = v37;
        __int16 v67 = 2112;
        v68 = v38;
        _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] We are not the owner, so fetching the key from the resident", buf, 0x16u);
      }
      __int16 v26 = [(HMDHomeNFCReaderKeyManager *)v35 requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow:v4];
    }
  }
  else
  {
    id v27 = (void *)MEMORY[0x1D9452090]();
    __int16 v28 = v7;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = HMFGetLogIdentifier();
      id v31 = [v4 UUID];
      *(_DWORD *)buf = 138544130;
      uint64_t v66 = v30;
      __int16 v67 = 2112;
      v68 = v31;
      __int16 v69 = 2112;
      v70 = v11;
      __int16 v71 = 2112;
      id v72 = v13;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create reader key, home or currentUser is nil. home: %@, currentUser: %@", buf, 0x2Au);
    }
    id v32 = (void *)MEMORY[0x1E4F7A0D8];
    id v33 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    __int16 v26 = [v32 futureWithError:v33];
  }
  return v26;
}

id __71__HMDHomeNFCReaderKeyManager_fetchOrCreateReaderKeyForPairingWithFlow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!v3) {
    goto LABEL_8;
  }
  id v5 = [v3 domain];
  id v6 = v5;
  if (v5 != (void *)*MEMORY[0x1E4F2D140])
  {

LABEL_8:
    id v17 = [MEMORY[0x1E4F7A0D8] futureWithError:v4];
    goto LABEL_9;
  }
  uint64_t v7 = [v4 code];

  if (v7 != 91) {
    goto LABEL_8;
  }
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 40) UUID];
    *(_DWORD *)buf = 138543618;
    id v22 = v11;
    __int16 v23 = 2112;
    __int16 v24 = v12;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Creating a reader key locally because we do not have a resident", buf, 0x16u);
  }
  id v13 = objc_opt_new();
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  id v16 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__HMDHomeNFCReaderKeyManager_fetchOrCreateReaderKeyForPairingWithFlow___block_invoke_106;
  v19[3] = &unk_1E6A11020;
  id v17 = v13;
  id v20 = v17;
  [v16 createReaderKeyKeychainItemForHome:v14 isForceUpdate:0 flow:v15 completion:v19];

LABEL_9:
  return v17;
}

uint64_t __71__HMDHomeNFCReaderKeyManager_fetchOrCreateReaderKeyForPairingWithFlow___block_invoke_106(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

- (void)fetchOrCreateReaderKeyWithRequiresPrivateKey:(BOOL)a3 flow:(id)a4 completion:(id)a5
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = (void (**)(id, void *, void))a5;
  uint64_t v10 = [(HMDHomeNFCReaderKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    uint64_t v15 = [v8 UUID];
    id v16 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    id v74 = v14;
    __int16 v75 = 2112;
    v76 = v15;
    __int16 v77 = 2112;
    v78 = v16;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetch or create reader key with requiresPrivateKey: %@", buf, 0x20u);
  }
  id v17 = [(HMDHomeNFCReaderKeyManager *)v12 home];
  if (v17)
  {
    id v18 = [(HMDHomeNFCReaderKeyManager *)v12 dataSource];
    int v19 = [v18 isWatch];

    id v20 = [v17 currentUser];
    uint64_t v21 = [v17 nfcReaderKey];
    id v22 = (void *)v21;
    if (((v19 & 1) != 0 || !a3) && v21)
    {
      __int16 v23 = (void *)MEMORY[0x1D9452090]();
      __int16 v24 = v12;
      uint64_t v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        __int16 v26 = HMFGetLogIdentifier();
        id v27 = [v8 UUID];
        *(_DWORD *)buf = 138543874;
        id v74 = v26;
        __int16 v75 = 2112;
        v76 = v27;
        __int16 v77 = 2112;
        v78 = v22;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Current device is watch or caller does not requires private key, fetched nfc reader key from home graph: %@", buf, 0x20u);
      }
      v9[2](v9, v22, 0);
      goto LABEL_23;
    }
    if ([v20 isAdministrator])
    {
      uint64_t v33 = [v20 privilege];
      __int16 v34 = (void *)MEMORY[0x1D9452090]();
      id v35 = v12;
      id v36 = HMFGetOSLogHandle();
      BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_INFO);
      if (v33 == 4)
      {
        if (v37)
        {
          id v38 = HMFGetLogIdentifier();
          id v39 = [v8 UUID];
          *(_DWORD *)buf = 138543618;
          id v74 = v38;
          __int16 v75 = 2112;
          v76 = v39;
          _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Current user is shared admin, sending request to resident to create nfc reader key", buf, 0x16u);
        }
        [(HMDHomeNFCReaderKeyManager *)v35 requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow:v8 completion:v9];
        goto LABEL_23;
      }
      if (!v19)
      {
        if (v37)
        {
          id v50 = HMFGetLogIdentifier();
          __int16 v51 = [v8 UUID];
          *(_DWORD *)buf = 138543618;
          id v74 = v50;
          __int16 v75 = 2112;
          v76 = v51;
          _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Current user is owner, fetching or creating nfc reader key from keychain", buf, 0x16u);
        }
        id v52 = [v17 nfcReaderKey];
        dispatch_time_t v47 = [v52 identifier];

        if (v47)
        {
          __int16 v53 = +[HMDHomeNFCReaderKey keychainItemAccountAttributeValueWithHome:v17 keyIdentifier:v47];
          id v54 = (void *)MEMORY[0x1D9452090]();
          id v55 = v35;
          id v56 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v68 = v54;
            v58 = id v57 = v53;
            [v8 UUID];
            v59 = v70 = v47;
            *(_DWORD *)buf = 138544130;
            id v74 = v58;
            __int16 v75 = 2112;
            v76 = v59;
            __int16 v77 = 2112;
            v78 = v57;
            __int16 v79 = 2112;
            v80 = v22;
            _os_log_impl(&dword_1D49D5000, v56, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Looking for key chain item with identifier: %@ for reader key: %@", buf, 0x2Au);

            dispatch_time_t v47 = v70;
            __int16 v53 = v57;
            id v54 = v68;
          }

          id v72 = 0;
          __int16 v60 = [(HMDHomeNFCReaderKeyManager *)v55 readerKeyWithKeychainItemIdentifier:v53 error:&v72 flow:v8];
          id v61 = v72;
          if (v60)
          {
            v9[2](v9, v60, 0);
          }
          else
          {
            context = (void *)MEMORY[0x1D9452090]();
            __int16 v69 = v55;
            id v63 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              id v64 = v71 = v47;
              [v8 UUID];
              v65 = uint64_t v66 = v53;
              *(_DWORD *)buf = 138544386;
              id v74 = v64;
              __int16 v75 = 2112;
              v76 = v65;
              __int16 v77 = 2112;
              v78 = v66;
              __int16 v79 = 2112;
              v80 = v22;
              __int16 v81 = 2112;
              id v82 = v61;
              _os_log_impl(&dword_1D49D5000, v63, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch keychain item with identifier: %@ for nfc reader key %@:%@", buf, 0x34u);

              __int16 v53 = v66;
              dispatch_time_t v47 = v71;
            }

            ((void (**)(id, void *, id))v9)[2](v9, 0, v61);
          }
        }
        else
        {
          id v62 = [(HMDHomeNFCReaderKeyManager *)v35 primaryResidentDevice];
          id v61 = v62;
          if (v62 && ([v62 isCurrentDevice] & 1) == 0) {
            [(HMDHomeNFCReaderKeyManager *)v35 requestDevice:v61 toCreateKeychainItemForReaderKeyWithFlow:v8 completion:v9];
          }
          else {
            [(HMDHomeNFCReaderKeyManager *)v35 createReaderKeyKeychainItemForHome:v17 isForceUpdate:0 flow:v8 completion:v9];
          }
        }

        goto LABEL_22;
      }
      if (v37)
      {
        id v48 = HMFGetLogIdentifier();
        uint64_t v49 = [v8 UUID];
        *(_DWORD *)buf = 138543618;
        id v74 = v48;
        __int16 v75 = 2112;
        v76 = v49;
        _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Current user is owner. Fetch or create reader key from keychain is not supported on watch", buf, 0x16u);
      }
      __int16 v45 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v46 = 48;
    }
    else
    {
      __int16 v40 = (void *)MEMORY[0x1D9452090]();
      os_log_type_t v41 = v12;
      __int16 v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        id v43 = HMFGetLogIdentifier();
        __int16 v44 = [v8 UUID];
        *(_DWORD *)buf = 138543618;
        id v74 = v43;
        __int16 v75 = 2112;
        v76 = v44;
        _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Current user is not admin and home key doesn't exist in home graph, returning nil", buf, 0x16u);
      }
      __int16 v45 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v46 = 2;
    }
    dispatch_time_t v47 = [v45 hmErrorWithCode:v46];
    ((void (**)(id, void *, void *))v9)[2](v9, 0, v47);
LABEL_22:

LABEL_23:
    goto LABEL_24;
  }
  __int16 v28 = (void *)MEMORY[0x1D9452090]();
  id v29 = v12;
  uint64_t v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    id v31 = HMFGetLogIdentifier();
    id v32 = [v8 UUID];
    *(_DWORD *)buf = 138543618;
    id v74 = v31;
    __int16 v75 = 2112;
    v76 = v32;
    _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create reader key, home is nil", buf, 0x16u);
  }
  id v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
  ((void (**)(id, void *, void *))v9)[2](v9, 0, v20);
LABEL_24:
}

- (void)fetchOrCreateReaderKeyOnQueueWithRequiresPrivateKey:(BOOL)a3 flow:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(HMDHomeNFCReaderKeyManager *)self workQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __98__HMDHomeNFCReaderKeyManager_fetchOrCreateReaderKeyOnQueueWithRequiresPrivateKey_flow_completion___block_invoke;
  v13[3] = &unk_1E6A16328;
  BOOL v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __98__HMDHomeNFCReaderKeyManager_fetchOrCreateReaderKeyOnQueueWithRequiresPrivateKey_flow_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchOrCreateReaderKeyWithRequiresPrivateKey:*(unsigned __int8 *)(a1 + 56) flow:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)handleCreateKeychainItemForReaderKeyMessage:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeNFCReaderKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 flow];
  uint64_t v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    id v11 = [v6 UUID];
    *(_DWORD *)buf = 138543874;
    __int16 v44 = v10;
    __int16 v45 = 2112;
    uint64_t v46 = v11;
    __int16 v47 = 2112;
    id v48 = v4;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling message to create keychain item for reader key: %@", buf, 0x20u);
  }
  id v12 = [(HMDHomeNFCReaderKeyManager *)v8 home];
  id v13 = v12;
  if (v12)
  {
    id v14 = [v12 nfcReaderKey];
    id v15 = [v14 identifier];

    if (v15)
    {
      BOOL v16 = +[HMDHomeNFCReaderKey keychainItemAccountAttributeValueWithHome:v13 keyIdentifier:v15];
      id v40 = 0;
      id v17 = [(HMDHomeNFCReaderKeyManager *)v8 readerKeyWithKeychainItemIdentifier:v16 error:&v40 flow:v6];
      id v18 = v40;
      int v19 = (void *)MEMORY[0x1D9452090]();
      id v20 = v8;
      uint64_t v21 = HMFGetOSLogHandle();
      id v22 = v21;
      if (v17)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v23 = id v36 = v16;
          [v6 UUID];
          v24 = __int16 v34 = v19;
          *(_DWORD *)buf = 138543874;
          __int16 v44 = v23;
          __int16 v45 = 2112;
          uint64_t v46 = v24;
          __int16 v47 = 2112;
          id v48 = v17;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Keychain item is already created for reader key: %@", buf, 0x20u);

          int v19 = v34;
          BOOL v16 = v36;
        }

        os_log_type_t v41 = @"HMDHomeCreateKeychainItemForNFCReaderKeyMessageKeyReaderKey";
        uint64_t v25 = [v17 externalRepresentation];
        __int16 v42 = v25;
        __int16 v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];

        [v4 respondWithPayload:v26];
      }
      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v32 = v35 = v19;
          [v6 UUID];
          uint64_t v33 = v37 = v16;
          *(_DWORD *)buf = 138543874;
          __int16 v44 = v32;
          __int16 v45 = 2112;
          uint64_t v46 = v33;
          __int16 v47 = 2112;
          id v48 = v18;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch keychain item for nfc reader key: %@", buf, 0x20u);

          BOOL v16 = v37;
          int v19 = v35;
        }

        [v4 respondWithError:v18];
      }
    }
    else
    {
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __74__HMDHomeNFCReaderKeyManager_handleCreateKeychainItemForReaderKeyMessage___block_invoke;
      v38[3] = &unk_1E6A11020;
      id v39 = v4;
      [(HMDHomeNFCReaderKeyManager *)v8 createReaderKeyKeychainItemForHome:v13 isForceUpdate:0 flow:v6 completion:v38];
      id v18 = v39;
    }
  }
  else
  {
    id v27 = (void *)MEMORY[0x1D9452090]();
    __int16 v28 = v8;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = HMFGetLogIdentifier();
      id v31 = [v6 UUID];
      *(_DWORD *)buf = 138543618;
      __int16 v44 = v30;
      __int16 v45 = 2112;
      uint64_t v46 = v31;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] I am not configured with a home", buf, 0x16u);
    }
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [v4 respondWithError:v15];
  }
}

void __74__HMDHomeNFCReaderKeyManager_handleCreateKeychainItemForReaderKeyMessage___block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v6 = @"HMDHomeCreateKeychainItemForNFCReaderKeyMessageKeyReaderKey";
    id v3 = [a2 externalRepresentation];
    v7[0] = v3;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

    [*(id *)(a1 + 32) respondWithPayload:v4];
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "respondWithError:");
  }
}

- (void)handleFetchOrCreateReaderKeyMessage:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeNFCReaderKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 flow];
  uint64_t v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    id v11 = [v6 UUID];
    *(_DWORD *)buf = 138543874;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v11;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling message to fetch or create reader key: %@", buf, 0x20u);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__HMDHomeNFCReaderKeyManager_handleFetchOrCreateReaderKeyMessage___block_invoke;
  v14[3] = &unk_1E6A10FF8;
  v14[4] = v8;
  id v15 = v6;
  id v16 = v4;
  id v12 = v4;
  id v13 = v6;
  [(HMDHomeNFCReaderKeyManager *)v8 fetchOrCreateReaderKeyWithRequiresPrivateKey:0 flow:v13 completion:v14];
}

void __66__HMDHomeNFCReaderKeyManager_handleFetchOrCreateReaderKeyMessage___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v32 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v32];
    id v8 = v32;
    if (v7)
    {
      uint64_t v33 = @"HMDHomeFetchOrCreateNFCReaderKeyMessageKeyReaderKey";
      __int16 v34 = v7;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      uint64_t v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = a1[4];
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = id v30 = v8;
        id v14 = [a1[5] UUID];
        id v15 = a1[6];
        *(_DWORD *)buf = 138544130;
        id v36 = v13;
        __int16 v37 = 2112;
        id v38 = v14;
        __int16 v39 = 2112;
        id v40 = v15;
        __int16 v41 = 2112;
        id v42 = v9;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Responding to fetch or create reader key message: %@ with payload: %@ ", buf, 0x2Au);

        id v8 = v30;
      }

      [a1[6] respondWithPayload:v9];
    }
    else
    {
      id v9 = [MEMORY[0x1E4F1CA60] dictionary];
      [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
      id v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1 userInfo:v9];
      uint64_t v23 = (void *)MEMORY[0x1D9452090]([a1[6] respondWithError:v22]);
      id v24 = a1[4];
      uint64_t v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        __int16 v26 = v29 = v23;
        [a1[5] UUID];
        v27 = id v31 = v8;
        id v28 = a1[6];
        *(_DWORD *)buf = 138544130;
        id v36 = v26;
        __int16 v37 = 2112;
        id v38 = v27;
        __int16 v39 = 2112;
        id v40 = v28;
        __int16 v41 = 2112;
        id v42 = v22;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Responding to fetch or create reader key message: %@ with: %@", buf, 0x2Au);

        id v8 = v31;
        uint64_t v23 = v29;
      }
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = a1[4];
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = HMFGetLogIdentifier();
      id v20 = [a1[5] UUID];
      id v21 = a1[6];
      *(_DWORD *)buf = 138544130;
      id v36 = v19;
      __int16 v37 = 2112;
      id v38 = v20;
      __int16 v39 = 2112;
      id v40 = v21;
      __int16 v41 = 2112;
      id v42 = v6;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Responding to fetch or create reader key message: %@ with: %@", buf, 0x2Au);
    }
    [a1[6] respondWithError:v6];
  }
}

- (void)handleDeleteKeychainItemForNFCReaderKey:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeNFCReaderKeyManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 flow];
  uint64_t v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v15 = v10;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling message to delete keychain item for nfc reader key", buf, 0xCu);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__HMDHomeNFCReaderKeyManager_handleDeleteKeychainItemForNFCReaderKey___block_invoke;
  v12[3] = &unk_1E6A196E0;
  v12[4] = v8;
  id v13 = v4;
  id v11 = v4;
  [(HMDHomeNFCReaderKeyManager *)v8 deleteKeychainItemForNFCReaderKeyIsForceUpdate:0 withFlow:v6 completion:v12];
}

void __70__HMDHomeNFCReaderKeyManager_handleDeleteKeychainItemForNFCReaderKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  uint64_t v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle message to delete nfc reader key: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 40) respondWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v15 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully handled message to delete nfc reader key", buf, 0xCu);
    }
    uint64_t v10 = *(void **)(a1 + 40);
    id v12 = @"HMDHomeDeleteKeychainItemForNFCReaderKeyMessageKeyDidSucceed";
    uint64_t v13 = MEMORY[0x1E4F1CC38];
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [v10 respondWithPayload:v11];
  }
}

- (void)configureWithHome:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v35 = v8;
    __int16 v36 = 2112;
    id v37 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring with home: %@", buf, 0x16u);
  }
  [(HMDHomeNFCReaderKeyManager *)v6 setHome:v4];
  id v9 = [v4 msgDispatcher];
  [(HMDHomeNFCReaderKeyManager *)v6 setMessageDispatcher:v9];

  uint64_t v10 = [(HMDHomeNFCReaderKeyManager *)v6 dataSource];
  int v11 = [v10 isResidentCapable];

  if (v11)
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    uint64_t v13 = v6;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v35 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Registering for messages", buf, 0xCu);
    }
    __int16 v16 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:4 remoteAccessRequired:0];
    id v17 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
    objc_msgSend(v17, "setRoles:", objc_msgSend(v17, "roles") | 4);
    uint64_t v18 = [(HMDHomeNFCReaderKeyManager *)v13 messageDispatcher];
    v33[0] = v16;
    v33[1] = v17;
    __int16 v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
    [v18 registerForMessage:@"HMDHomeFetchOrCreateNFCReaderKeyMessage" receiver:v13 policies:v19 selector:sel_handleFetchOrCreateReaderKeyMessage_];

    id v20 = [(HMDHomeNFCReaderKeyManager *)v13 messageDispatcher];
    v32[0] = v16;
    v32[1] = v17;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    [v20 registerForMessage:@"HMDHomeCreateKeychainItemForNFCReaderKeyMessage" receiver:v13 policies:v21 selector:sel_handleCreateKeychainItemForReaderKeyMessage_];

    id v22 = [(HMDHomeNFCReaderKeyManager *)v13 messageDispatcher];
    v31[0] = v16;
    v31[1] = v17;
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    [v22 registerForMessage:@"HMDHomeDeleteKeychainItemForNFCReaderKeyMessage" receiver:v13 policies:v23 selector:sel_handleDeleteKeychainItemForNFCReaderKey_];
  }
  id v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v25 = [v4 homeManager];
  [v24 addObserver:v6 selector:sel_handleHomeRemovedNotification_ name:@"HMDHomeRemovedNotification" object:v25];

  __int16 v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v27 = *MEMORY[0x1E4F5BB68];
  id v28 = [(HMDHomeNFCReaderKeyManager *)v6 keychainStore];
  [v26 addObserver:v6 selector:sel_handleSystemKeychainStoreUpdatedNotification_ name:v27 object:v28];

  id v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v29 addObserver:v6 selector:sel_handleHomeDidUpdateNFCReaderKeyNotification_ name:@"HMDHomeDidUpdateNFCReaderKeyNotification" object:v4];

  id v30 = [(HMDHomeNFCReaderKeyManager *)v6 accessoryManager];
  [v30 configureWithHome:v4];
}

- (HMDHomeNFCReaderKeyManager)initWithUUID:(id)a3 workQueue:(id)a4 keychainStore:(id)a5 dataSource:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HMDHomeNFCReaderKeyManager;
  id v14 = [(HMDHomeNFCReaderKeyManager *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    uuid = v14->_uuid;
    v14->_uuid = (NSUUID *)v15;

    objc_storeStrong((id *)&v14->_workQueue, a4);
    objc_storeStrong((id *)&v14->_keychainStore, a5);
    objc_storeStrong((id *)&v14->_dataSource, a6);
    id v17 = [[HMDHomeWalletKeyAccessoryManager alloc] initWithUUID:v10 workQueue:v11];
    accessoryManager = v14->_accessoryManager;
    v14->_accessoryManager = v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA80] set];
    keyIdentifiersAlreadyUpdated = v14->_keyIdentifiersAlreadyUpdated;
    v14->_keyIdentifiersAlreadyUpdated = (NSMutableSet *)v19;
  }
  return v14;
}

- (HMDHomeNFCReaderKeyManager)initWithUUID:(id)a3 workQueue:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F5BE48];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 systemStore];
  id v10 = objc_alloc_init(HMDHomeWalletDataSource);
  id v11 = [(HMDHomeNFCReaderKeyManager *)self initWithUUID:v8 workQueue:v7 keychainStore:v9 dataSource:v10];

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t78 != -1) {
    dispatch_once(&logCategory__hmf_once_t78, &__block_literal_global_128140);
  }
  id v2 = (void *)logCategory__hmf_once_v79;
  return v2;
}

uint64_t __41__HMDHomeNFCReaderKeyManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v79;
  logCategory__hmf_once___int16 v79 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end