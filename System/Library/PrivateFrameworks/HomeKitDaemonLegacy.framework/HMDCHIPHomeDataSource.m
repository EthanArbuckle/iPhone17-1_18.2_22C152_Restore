@interface HMDCHIPHomeDataSource
+ (id)logCategory;
- (HMDCHIPHomeDataSource)initWithFabricID:(id)a3 home:(id)a4;
- (HMDHome)home;
- (NSData)intermediateCertificate;
- (NSData)operationalCertificate;
- (NSData)rootCertificate;
- (NSDictionary)keyValueStore;
- (NSMutableDictionary)pendingKeyValueStore;
- (NSNumber)fabricID;
- (NSNumber)lastNodeID;
- (NSRecursiveLock)lock;
- (NSSet)allNodeIDs;
- (id)allStorageDataSourcesForDeviceWithNodeID:(id)a3;
- (id)identifier;
- (id)logIdentifier;
- (id)storageDataSourceForDeviceWithNodeID:(id)a3;
- (unint64_t)pendingKeyValueStoreTransactionsCount;
- (void)_updateHomeModelWithLabel:(id)a3 completion:(id)a4 block:(id)a5;
- (void)setHome:(id)a3;
- (void)setPendingKeyValueStore:(id)a3;
- (void)setPendingKeyValueStoreTransactionsCount:(unint64_t)a3;
- (void)updateFabricID:(id)a3 completion:(id)a4;
- (void)updateIntermediateCertificate:(id)a3 completion:(id)a4;
- (void)updateKeyValueStore:(id)a3 completion:(id)a4;
- (void)updateKeyValueStoreWithBlock:(id)a3 completion:(id)a4;
- (void)updateLastNodeID:(id)a3 completion:(id)a4;
- (void)updateOperationalCertificate:(id)a3 completion:(id)a4;
- (void)updateRootCertificate:(id)a3 completion:(id)a4;
@end

@implementation HMDCHIPHomeDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_pendingKeyValueStore, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_fabricID, 0);
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setPendingKeyValueStoreTransactionsCount:(unint64_t)a3
{
  self->_pendingKeyValueStoreTransactionsCount = a3;
}

- (unint64_t)pendingKeyValueStoreTransactionsCount
{
  return self->_pendingKeyValueStoreTransactionsCount;
}

- (void)setPendingKeyValueStore:(id)a3
{
}

- (NSMutableDictionary)pendingKeyValueStore
{
  return self->_pendingKeyValueStore;
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (NSNumber)fabricID
{
  return self->_fabricID;
}

- (id)logIdentifier
{
  v3 = NSString;
  v4 = [(HMDCHIPHomeDataSource *)self home];
  v5 = [v4 logIdentifier];
  v6 = [(HMDCHIPHomeDataSource *)self fabricID];
  v7 = [v3 stringWithFormat:@"%@/%@", v5, v6];

  return v7;
}

- (id)identifier
{
  v2 = NSString;
  v3 = [(HMDCHIPHomeDataSource *)self home];
  v4 = [v3 logIdentifier];
  v5 = [v2 stringWithFormat:@"%@", v4];

  return v5;
}

- (id)allStorageDataSourcesForDeviceWithNodeID:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCHIPHomeDataSource *)self home];
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1D9452090]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v26 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Home reference is nil", buf, 0xCu);
    }
  }
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  v11 = [v5 matterAccessories];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __66__HMDCHIPHomeDataSource_allStorageDataSourcesForDeviceWithNodeID___block_invoke;
  v23[3] = &unk_1E6A0FC80;
  id v12 = v4;
  id v24 = v12;
  uint64_t v13 = objc_msgSend(v11, "na_map:", v23);
  v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = MEMORY[0x1E4F1CBF0];
  }
  v16 = [v10 setWithArray:v15];

  if (v16)
  {
    id v17 = v16;
  }
  else
  {
    v18 = (void *)MEMORY[0x1D9452090]();
    v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v21;
      __int16 v27 = 2112;
      id v28 = v12;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find accessories with Matter node ID: %@", buf, 0x16u);
    }
  }

  return v16;
}

HMDCHIPAccessoryDataSource *__66__HMDCHIPHomeDataSource_allStorageDataSourcesForDeviceWithNodeID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 matterNodeID];
  if ([v4 isEqualToNumber:*(void *)(a1 + 32)]) {
    v5 = v3;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    v7 = [[HMDCHIPAccessoryDataSource alloc] initWithNodeID:*(void *)(a1 + 32) accessory:v6];
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (id)storageDataSourceForDeviceWithNodeID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCHIPHomeDataSource *)self home];
  id v6 = [v5 matterAccessories];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__HMDCHIPHomeDataSource_storageDataSourceForDeviceWithNodeID___block_invoke;
  v15[3] = &unk_1E6A0FC58;
  id v7 = v4;
  id v16 = v7;
  v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v15);

  if (v8)
  {
    v9 = [[HMDCHIPAccessoryDataSource alloc] initWithNodeID:v7 accessory:v8];
  }
  else
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find accessory with CHIP node ID: %@", buf, 0x16u);
    }
    v9 = 0;
  }

  return v9;
}

uint64_t __62__HMDCHIPHomeDataSource_storageDataSourceForDeviceWithNodeID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 chipStorage];
  id v4 = [v3 nodeID];
  uint64_t v5 = [v4 isEqualToNumber:*(void *)(a1 + 32)];

  return v5;
}

- (NSSet)allNodeIDs
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCHIPHomeDataSource *)self home];
  if (!v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    uint64_t v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v15 = 138543362;
      id v16 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Home reference is nil", (uint8_t *)&v15, 0xCu);
    }
  }
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v9 = [v3 matterAccessories];
  uint64_t v10 = objc_msgSend(v9, "na_map:", &__block_literal_global_114154);
  v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = MEMORY[0x1E4F1CBF0];
  }
  uint64_t v13 = [v8 setWithArray:v12];

  return (NSSet *)v13;
}

id __35__HMDCHIPHomeDataSource_allNodeIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 matterNodeID];
  if ([v3 unsignedLongValue])
  {
    id v4 = [v2 matterNodeID];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)updateKeyValueStoreWithBlock:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDCHIPHomeDataSource *)self home];
  v9 = (void *)MEMORY[0x1D9452090]();
  uint64_t v10 = self;
  v11 = HMFGetOSLogHandle();
  uint64_t v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v20 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating home model key-value store", buf, 0xCu);
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__HMDCHIPHomeDataSource_updateKeyValueStoreWithBlock_completion___block_invoke;
    v17[3] = &unk_1E6A0FC30;
    v18 = (void (**)(void *, void *))v6;
    [(HMDCHIPHomeDataSource *)v10 _updateHomeModelWithLabel:@"Update CHIP key-value store" completion:v7 block:v17];
    v14 = v18;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v20 = v15;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Home reference is nil", buf, 0xCu);
    }
    v14 = (void (**)(void *, void *))_Block_copy(v7);
    if (v14)
    {
      id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      v14[2](v14, v16);
    }
  }
}

uint64_t __65__HMDCHIPHomeDataSource_updateKeyValueStoreWithBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v8)
  {
    v9 = (void *)[v6 copy];
    [v5 setChipKeyValueStore:v9];
  }
  return v8;
}

- (void)updateKeyValueStore:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__HMDCHIPHomeDataSource_updateKeyValueStore_completion___block_invoke;
  v8[3] = &unk_1E6A0FC08;
  id v9 = v6;
  id v7 = v6;
  [(HMDCHIPHomeDataSource *)self updateKeyValueStoreWithBlock:v8 completion:a4];
}

uint64_t __56__HMDCHIPHomeDataSource_updateKeyValueStore_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__HMDCHIPHomeDataSource_updateKeyValueStore_completion___block_invoke_2;
  v11[3] = &unk_1E6A0FBE0;
  id v12 = *(id *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v7 keysOfEntriesPassingTest:v11];
  id v9 = [v8 allObjects];
  [v6 addObjectsFromArray:v9];

  [v7 setDictionary:*(void *)(a1 + 32)];
  return 1;
}

BOOL __56__HMDCHIPHomeDataSource_updateKeyValueStore_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  BOOL v3 = v2 == 0;

  return v3;
}

- (NSDictionary)keyValueStore
{
  id v2 = [(HMDCHIPHomeDataSource *)self home];
  BOOL v3 = [v2 chipStorage];
  id v4 = [v3 keyValueStore];

  return (NSDictionary *)v4;
}

- (void)updateIntermediateCertificate:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v16 = v11;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating home model intermediate certificate to %@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__HMDCHIPHomeDataSource_updateIntermediateCertificate_completion___block_invoke;
  v13[3] = &unk_1E6A0FBB8;
  id v14 = v6;
  id v12 = v6;
  [(HMDCHIPHomeDataSource *)v9 _updateHomeModelWithLabel:@"Update CHIP intermediate certificate" completion:v7 block:v13];
}

uint64_t __66__HMDCHIPHomeDataSource_updateIntermediateCertificate_completion___block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

- (NSData)intermediateCertificate
{
  id v2 = [(HMDCHIPHomeDataSource *)self home];
  BOOL v3 = [v2 chipStorage];
  id v4 = [v3 intermediateCertificate];

  return (NSData *)v4;
}

- (void)updateOperationalCertificate:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v16 = v11;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating home model operational certificate to %@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__HMDCHIPHomeDataSource_updateOperationalCertificate_completion___block_invoke;
  v13[3] = &unk_1E6A0FBB8;
  id v14 = v6;
  id v12 = v6;
  [(HMDCHIPHomeDataSource *)v9 _updateHomeModelWithLabel:@"Update CHIP operational certificate" completion:v7 block:v13];
}

uint64_t __65__HMDCHIPHomeDataSource_updateOperationalCertificate_completion___block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

- (NSData)operationalCertificate
{
  id v2 = [(HMDCHIPHomeDataSource *)self home];
  BOOL v3 = [v2 chipStorage];
  id v4 = [v3 operationalCertificate];

  return (NSData *)v4;
}

- (void)updateRootCertificate:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v16 = v11;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating home model root certificate to %@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__HMDCHIPHomeDataSource_updateRootCertificate_completion___block_invoke;
  v13[3] = &unk_1E6A0FBB8;
  id v14 = v6;
  id v12 = v6;
  [(HMDCHIPHomeDataSource *)v9 _updateHomeModelWithLabel:@"Update CHIP root certificate" completion:v7 block:v13];
}

uint64_t __58__HMDCHIPHomeDataSource_updateRootCertificate_completion___block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

- (NSData)rootCertificate
{
  id v2 = [(HMDCHIPHomeDataSource *)self home];
  BOOL v3 = [v2 chipStorage];
  id v4 = [v3 rootCertificate];

  return (NSData *)v4;
}

- (void)updateLastNodeID:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v16 = v11;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating home model last node ID to %@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__HMDCHIPHomeDataSource_updateLastNodeID_completion___block_invoke;
  v13[3] = &unk_1E6A0FBB8;
  id v14 = v6;
  id v12 = v6;
  [(HMDCHIPHomeDataSource *)v9 _updateHomeModelWithLabel:@"Update CHIP last node ID" completion:v7 block:v13];
}

uint64_t __53__HMDCHIPHomeDataSource_updateLastNodeID_completion___block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

- (NSNumber)lastNodeID
{
  id v2 = [(HMDCHIPHomeDataSource *)self home];
  BOOL v3 = [v2 chipStorage];
  id v4 = [v3 lastNodeID];

  return (NSNumber *)v4;
}

- (void)updateFabricID:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v16 = v11;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating home model fabric ID to %@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__HMDCHIPHomeDataSource_updateFabricID_completion___block_invoke;
  v13[3] = &unk_1E6A0FBB8;
  id v14 = v6;
  id v12 = v6;
  [(HMDCHIPHomeDataSource *)v9 _updateHomeModelWithLabel:@"Update fabric ID" completion:v7 block:v13];
}

uint64_t __51__HMDCHIPHomeDataSource_updateFabricID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setChipFabricID:v3];
  [v4 setChipFabricIndex:*(void *)(a1 + 32)];

  return 1;
}

- (void)_updateHomeModelWithLabel:(id)a3 completion:(id)a4 block:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(HMDCHIPHomeDataSource *)self home];
  id v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 emptyModelObjectWithChangeType:2];
    id v14 = [(HMDCHIPHomeDataSource *)self lock];
    [v14 lock];

    int v15 = [(HMDCHIPHomeDataSource *)self pendingKeyValueStore];

    if (!v15)
    {
      id v16 = [(HMDCHIPHomeDataSource *)self keyValueStore];
      if (v16)
      {
        __int16 v17 = [(HMDCHIPHomeDataSource *)self keyValueStore];
        id v18 = (void *)[v17 mutableCopy];
        [(HMDCHIPHomeDataSource *)self setPendingKeyValueStore:v18];
      }
      else
      {
        __int16 v17 = [MEMORY[0x1E4F1CA60] dictionary];
        [(HMDCHIPHomeDataSource *)self setPendingKeyValueStore:v17];
      }
    }
    [(HMDCHIPHomeDataSource *)self setPendingKeyValueStoreTransactionsCount:[(HMDCHIPHomeDataSource *)self pendingKeyValueStoreTransactionsCount] + 1];
    id v24 = [(HMDCHIPHomeDataSource *)self pendingKeyValueStore];
    char v25 = (*((uint64_t (**)(id, void (**)(void, void), void *))v10 + 2))(v10, v13, v24);

    if (v25)
    {
      v26 = [v12 backingStore];
      __int16 v27 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
      id v28 = [v26 transaction:v8 options:v27];

      [v28 add:v13];
      if (v28)
      {
        uint64_t v33 = MEMORY[0x1E4F143A8];
        uint64_t v34 = 3221225472;
        v35 = __68__HMDCHIPHomeDataSource__updateHomeModelWithLabel_completion_block___block_invoke;
        v36 = &unk_1E6A17D78;
        v37 = self;
        id v38 = v9;
        [v28 run:&v33];
        uint64_t v29 = [(HMDCHIPHomeDataSource *)self lock];
        [v29 unlock];

        goto LABEL_19;
      }
    }
    else
    {
      unint64_t v30 = [(HMDCHIPHomeDataSource *)self pendingKeyValueStoreTransactionsCount]- 1;
      [(HMDCHIPHomeDataSource *)self setPendingKeyValueStoreTransactionsCount:v30];
      if (!v30) {
        [(HMDCHIPHomeDataSource *)self setPendingKeyValueStore:0];
      }
    }
    v31 = [(HMDCHIPHomeDataSource *)self lock];
    [v31 unlock];

    v32 = _Block_copy(v9);
    v23 = v32;
    if (v32) {
      (*((void (**)(void *, void))v32 + 2))(v32, 0);
    }
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v19 = (void *)MEMORY[0x1D9452090]();
  id v20 = self;
  uint64_t v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v40 = v22;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Home reference is nil", buf, 0xCu);
  }
  uint64_t v13 = (void (**)(void, void))_Block_copy(v9);
  if (v13)
  {
    v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    ((void (**)(void, void *))v13)[2](v13, v23);
    goto LABEL_18;
  }
LABEL_19:
}

void __68__HMDCHIPHomeDataSource__updateHomeModelWithLabel_completion_block___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) pendingKeyValueStore];
  id v4 = [*(id *)(a1 + 32) home];
  id v5 = [v4 chipStorage];
  [v5 setKeyValueStore:v3];

  id v6 = [*(id *)(a1 + 32) lock];
  [v6 lock];

  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v7 pendingKeyValueStoreTransactionsCount] - 1;
  [v7 setPendingKeyValueStoreTransactionsCount:v8];
  if (!v8) {
    [*(id *)(a1 + 32) setPendingKeyValueStore:0];
  }
  id v9 = [*(id *)(a1 + 32) lock];
  [v9 unlock];

  id v10 = _Block_copy(*(const void **)(a1 + 40));
  v11 = v10;
  if (v10) {
    (*((void (**)(void *, id))v10 + 2))(v10, v12);
  }
}

- (HMDCHIPHomeDataSource)initWithFabricID:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  id v9 = v8;
  if (!v8)
  {
LABEL_7:
    int v15 = (void *)_HMFPreconditionFailure();
    return (HMDCHIPHomeDataSource *)+[HMDCHIPHomeDataSource logCategory];
  }
  v17.receiver = self;
  v17.super_class = (Class)HMDCHIPHomeDataSource;
  id v10 = [(HMDCHIPHomeDataSource *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_fabricID, a3);
    objc_storeWeak((id *)&v11->_home, v9);
    id v12 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    lock = v11->_lock;
    v11->_lock = v12;
  }
  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16_114202 != -1) {
    dispatch_once(&logCategory__hmf_once_t16_114202, &__block_literal_global_52_114203);
  }
  id v2 = (void *)logCategory__hmf_once_v17_114204;
  return v2;
}

uint64_t __36__HMDCHIPHomeDataSource_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v17_114204;
  logCategory__hmf_once_v17_114204 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end