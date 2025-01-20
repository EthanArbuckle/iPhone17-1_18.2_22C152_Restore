@interface HMDCloudZone
+ (id)shortDescription;
+ (id)zoneRootRecordName;
+ (id)zoneSubscriptionName:(id)a3;
+ (void)createZoneWithName:(id)a3 rootRecordName:(id)a4 subscriptionName:(id)a5 owner:(id)a6 cacheZone:(id)a7 cloudCache:(id)a8 completion:(id)a9;
- (BOOL)doesProcessChangeEvenIfDecryptionFails;
- (BOOL)hasDecrypted;
- (BOOL)hasRecordsAvailable;
- (BOOL)hasServerTokenAvailable;
- (BOOL)isRootCloudRecord:(id)a3;
- (BOOL)isRootRecord:(id)a3;
- (CKRecordID)privateZoneRootRecordID;
- (CKRecordZone)zone;
- (CKRecordZoneSubscription)subscription;
- (CKServerChangeToken)serverChangeToken;
- (HMDBackingStoreCacheZone)backingStoreZone;
- (HMDCloudCache)cache;
- (HMDCloudGroup)rootGroup;
- (HMDCloudZone)init;
- (HMDCloudZone)initWithBackingStoreCacheZone:(id)a3 cloudCache:(id)a4;
- (NSString)owner;
- (NSString)subscriptionName;
- (NSString)zoneRootRecordName;
- (id)__cloudRecordWithObjectID:(id)a3;
- (id)cloudRecordWithName:(id)a3;
- (id)cloudRecordWithObjectID:(id)a3;
- (id)createCloudRecordWithFetchResult:(id)a3;
- (id)createCloudRecordWithObjectID:(id)a3 recordName:(id)a4;
- (id)createCloudZoneChangeTemporaryCache:(BOOL)a3;
- (id)description;
- (id)shortDescription;
- (void)_initializeServerChangeToken:(id)a3;
- (void)_initializeSubscription:(id)a3;
- (void)addCloudRecord:(id)a3 ownerID:(id)a4;
- (void)allDescendentsCloudRecordsForParentID:(id)a3 completionHandler:(id)a4;
- (void)cloudRecordWithName:(id)a3 completionHandler:(id)a4;
- (void)cloudRecordWithNames:(id)a3 completionHandler:(id)a4;
- (void)cloudRecordWithObjectID:(id)a3 completionHandler:(id)a4;
- (void)cloudRecordWithObjectIDs:(id)a3 completionHandler:(id)a4;
- (void)cloudRecordsForParentID:(id)a3 completionHandler:(id)a4;
- (void)deleteCloudRecord:(id)a3;
- (void)deleteCloudRecordNames:(id)a3;
- (void)deleteZone;
- (void)fetchAllObjects:(id)a3;
- (void)fetchMigratedObjects:(id)a3;
- (void)markMigratedObjectsAsMigrated;
- (void)setBackingStoreZone:(id)a3;
- (void)setCache:(id)a3;
- (void)setDecrypted:(BOOL)a3;
- (void)setRecordsAvailable:(BOOL)a3;
- (void)setRootGroup:(id)a3;
- (void)setServerChangeToken:(id)a3;
- (void)setSubscription:(id)a3;
- (void)setSubscriptionName:(id)a3;
- (void)setZone:(id)a3;
- (void)updateCloudRecord:(id)a3;
- (void)updateCloudRecord:(id)a3 completionHandler:(id)a4;
- (void)updateCurrentServerChangeToken;
- (void)updateServerChangeToken:(id)a3;
@end

@implementation HMDCloudZone

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingStoreZone, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_subscriptionName, 0);
  objc_storeStrong((id *)&self->_rootGroup, 0);
  objc_storeStrong((id *)&self->_zone, 0);
  objc_destroyWeak((id *)&self->_cache);
}

- (void)setBackingStoreZone:(id)a3
{
}

- (HMDBackingStoreCacheZone)backingStoreZone
{
  return self->_backingStoreZone;
}

- (void)setServerChangeToken:(id)a3
{
}

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (CKRecordZoneSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscriptionName:(id)a3
{
}

- (void)setDecrypted:(BOOL)a3
{
  self->_decrypted = a3;
}

- (BOOL)hasDecrypted
{
  return self->_decrypted;
}

- (void)setRecordsAvailable:(BOOL)a3
{
  self->_recordsAvailable = a3;
}

- (BOOL)hasRecordsAvailable
{
  return self->_recordsAvailable;
}

- (void)setRootGroup:(id)a3
{
}

- (HMDCloudGroup)rootGroup
{
  return self->_rootGroup;
}

- (void)setZone:(id)a3
{
}

- (CKRecordZone)zone
{
  return self->_zone;
}

- (void)setCache:(id)a3
{
}

- (HMDCloudCache)cache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  return (HMDCloudCache *)WeakRetained;
}

- (void)updateServerChangeToken:(id)a3
{
  [(HMDCloudZone *)self setServerChangeToken:a3];
  [(HMDCloudZone *)self updateCurrentServerChangeToken];
}

- (void)updateCurrentServerChangeToken
{
  v3 = [(HMDCloudZone *)self zone];
  v4 = [v3 zoneID];
  v5 = [v4 zoneName];

  v6 = [(HMDCloudZone *)self serverChangeToken];
  objc_initWeak(&location, self);
  v7 = [HMDBackingStoreCacheUpdateGroupTokenOperation alloc];
  v8 = [(HMDCloudZone *)self rootGroup];
  v9 = [v8 backingStoreGroup];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __46__HMDCloudZone_updateCurrentServerChangeToken__block_invoke;
  v18 = &unk_1E6A15888;
  objc_copyWeak(&v21, &location);
  id v10 = v5;
  id v19 = v10;
  id v11 = v6;
  id v20 = v11;
  v12 = [(HMDBackingStoreCacheUpdateGroupTokenOperation *)v7 initWithGroup:v9 serverChangeToken:v11 resultBlock:&v15];

  v13 = [(HMDCloudZone *)self cache];
  v14 = [v13 backingStore];
  [v14 submit:v12];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __46__HMDCloudZone_updateCurrentServerChangeToken__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  v7 = HMFGetOSLogHandle();
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v13 = 138543618;
      v14 = v9;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to save server token with error %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    int v13 = 138543874;
    v14 = v10;
    __int16 v15 = 2112;
    id v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@[%@] Saved server change token %@", (uint8_t *)&v13, 0x20u);
  }
}

- (void)deleteZone
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCloudZone *)self backingStoreZone];
  v4 = [v3 zoneName];

  objc_initWeak(&location, self);
  v5 = [HMDBackingStoreCacheDeleteZoneOperation alloc];
  id v6 = [(HMDCloudZone *)self backingStoreZone];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __26__HMDCloudZone_deleteZone__block_invoke;
  v15[3] = &unk_1E6A17758;
  objc_copyWeak(&v17, &location);
  id v7 = v4;
  id v16 = v7;
  v8 = [(HMDBackingStoreCacheDeleteZoneOperation *)v5 initWithZone:v6 resultBlock:v15];

  v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = self;
  HMFGetOSLogHandle();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v20 = v12;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Deleting zone %@ from cached", buf, 0x16u);
  }
  int v13 = [(HMDCloudZone *)v10 cache];
  v14 = [v13 backingStore];
  [v14 submit:v8];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __26__HMDCloudZone_deleteZone__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier();
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Finished deleting zone %@ in cache", (uint8_t *)&v10, 0x16u);
  }
}

- (void)_initializeServerChangeToken:(id)a3
{
}

- (void)_initializeSubscription:(id)a3
{
}

- (BOOL)hasServerTokenAvailable
{
  v2 = [(HMDCloudZone *)self serverChangeToken];

  return v2 != 0;
}

- (void)setSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_subscription, a3);
  id v5 = a3;
  id v6 = [HMDBackingStoreCacheUpdateGroupSubscriptionOperation alloc];
  id v7 = [(HMDCloudZone *)self rootGroup];
  v8 = [v7 backingStoreGroup];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __32__HMDCloudZone_setSubscription___block_invoke;
  v12[3] = &unk_1E6A197F0;
  v12[4] = self;
  uint64_t v9 = [(HMDBackingStoreCacheUpdateGroupSubscriptionOperation *)v6 initWithGroup:v8 subscription:v5 resultBlock:v12];

  int v10 = [(HMDCloudZone *)self cache];
  id v11 = [v10 backingStore];
  [v11 submit:v9];
}

void __32__HMDCloudZone_setSubscription___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to save subscription with error %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (NSString)subscriptionName
{
  v2 = [(HMDCloudZone *)self rootGroup];
  id v3 = [v2 backingStoreGroup];
  v4 = [v3 subscriptionName];

  return (NSString *)v4;
}

- (NSString)owner
{
  v2 = [(HMDCloudZone *)self rootGroup];
  id v3 = [v2 backingStoreGroup];
  v4 = [v3 owner];

  return (NSString *)v4;
}

- (id)createCloudZoneChangeTemporaryCache:(BOOL)a3
{
  return 0;
}

- (void)deleteCloudRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudZone *)self rootGroup];
  [v5 deleteCloudRecord:v4];
}

- (void)deleteCloudRecordNames:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudZone *)self rootGroup];
  [v5 deleteCloudRecordNames:v4];
}

- (void)updateCloudRecord:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDCloudZone *)self rootGroup];
  [v8 updateCloudRecord:v7 completionHandler:v6];
}

- (void)updateCloudRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudZone *)self rootGroup];
  [v5 updateCloudRecord:v4];
}

- (BOOL)isRootCloudRecord:(id)a3
{
  id v4 = [a3 record];
  LOBYTE(self) = [(HMDCloudZone *)self isRootRecord:v4];

  return (char)self;
}

- (BOOL)isRootRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudZone *)self rootGroup];
  char v6 = [v5 isRootRecord:v4];

  return v6;
}

- (CKRecordID)privateZoneRootRecordID
{
  v2 = [(HMDCloudZone *)self rootGroup];
  id v3 = [v2 privateZoneRootRecordID];

  return (CKRecordID *)v3;
}

- (void)addCloudRecord:(id)a3 ownerID:(id)a4
{
  id v5 = a3;
  id v6 = [(HMDCloudZone *)self rootGroup];
  [v6 addCloudRecord:v5];
}

- (void)markMigratedObjectsAsMigrated
{
  objc_initWeak(&location, self);
  id v3 = [HMDBackingStoreCacheFetchMigratedResult alloc];
  id v4 = [(HMDCloudZone *)self rootGroup];
  id v5 = [v4 backingStoreGroup];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __45__HMDCloudZone_markMigratedObjectsAsMigrated__block_invoke;
  uint64_t v12 = &unk_1E6A0CC98;
  objc_copyWeak(&v13, &location);
  id v6 = [(HMDBackingStoreCacheFetchMigratedResult *)v3 initWithGroup:v5 update:1 migration:1 fetchResult:&v9];

  id v7 = [(HMDCloudZone *)self cache];
  id v8 = [v7 backingStore];
  [v8 submit:v6];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __45__HMDCloudZone_markMigratedObjectsAsMigrated__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = WeakRetained;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    id v13 = v11;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Completed marking migrated objects as migrated with error %@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)fetchMigratedObjects:(id)a3
{
  id v4 = a3;
  id v5 = [HMDBackingStoreCacheFetchMigratedResult alloc];
  id v6 = [(HMDCloudZone *)self rootGroup];
  id v7 = [v6 backingStoreGroup];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__HMDCloudZone_fetchMigratedObjects___block_invoke;
  v12[3] = &unk_1E6A09978;
  id v13 = v4;
  id v8 = v4;
  id v9 = [(HMDBackingStoreCacheFetchMigratedResult *)v5 initWithGroup:v7 update:0 migration:1 fetchResult:v12];

  uint64_t v10 = [(HMDCloudZone *)self cache];
  id v11 = [v10 backingStore];
  [v11 submit:v9];
}

uint64_t __37__HMDCloudZone_fetchMigratedObjects___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchAllObjects:(id)a3
{
  id v4 = a3;
  id v5 = [HMDBackingStoreCacheFetchMigratedResult alloc];
  id v6 = [(HMDCloudZone *)self rootGroup];
  id v7 = [v6 backingStoreGroup];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __32__HMDCloudZone_fetchAllObjects___block_invoke;
  v12[3] = &unk_1E6A09978;
  id v13 = v4;
  id v8 = v4;
  id v9 = [(HMDBackingStoreCacheFetchMigratedResult *)v5 initWithGroup:v7 update:0 migration:0 fetchResult:v12];

  uint64_t v10 = [(HMDCloudZone *)self cache];
  id v11 = [v10 backingStore];
  [v11 submit:v9];
}

void __32__HMDCloudZone_fetchAllObjects___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = _Block_copy(*(const void **)(a1 + 32));
  id v7 = v6;
  if (v6) {
    (*((void (**)(void *, id, id))v6 + 2))(v6, v8, v5);
  }
}

- (void)allDescendentsCloudRecordsForParentID:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = [(HMDCloudZone *)self rootGroup];

  if (v8)
  {
    id v9 = [(HMDCloudZone *)self rootGroup];
    [v9 allDescendentsCloudRecordsForParentID:v6 completionHandler:v7];
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      id v15 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@No root group to get descendant records.", (uint8_t *)&v14, 0xCu);
    }
    id v9 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    v7[2](v7, 0, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)cloudRecordsForParentID:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = [(HMDCloudZone *)self rootGroup];

  if (v8)
  {
    id v9 = [(HMDCloudZone *)self rootGroup];
    [v9 cloudRecordsForParentID:v6 completionHandler:v7];
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      id v15 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@No root group to get child record.", (uint8_t *)&v14, 0xCu);
    }
    id v9 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    v7[2](v7, 0, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)cloudRecordWithObjectID:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = [(HMDCloudZone *)self rootGroup];

  if (v8)
  {
    id v9 = [(HMDCloudZone *)self rootGroup];
    [v9 cloudRecordWithObjectID:v6 completionHandler:v7];
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      id v15 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@No root group to get cloud record.", (uint8_t *)&v14, 0xCu);
    }
    id v9 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    v7[2](v7, 0, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)cloudRecordWithObjectIDs:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCloudZone *)self rootGroup];

  if (v8)
  {
    id v9 = [(HMDCloudZone *)self rootGroup];
    [v9 cloudRecordWithObjectIDs:v6 completionHandler:v7];
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      id v15 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@No root group to get cloud records.", (uint8_t *)&v14, 0xCu);
    }
    id v9 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (id)cloudRecordWithObjectID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudZone *)self rootGroup];
  id v6 = [v5 cloudRecordWithObjectID:v4];

  return v6;
}

- (id)__cloudRecordWithObjectID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudZone *)self rootGroup];
  id v6 = objc_msgSend(v5, "__cloudRecordWithObjectID:", v4);

  return v6;
}

- (id)createCloudRecordWithFetchResult:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 record];
    id v7 = [v6 recordID];
    id v8 = [v7 recordName];

    if (v8)
    {
      id v9 = [v5 uuid];
      uint64_t v10 = [v5 record];
      id v11 = [v10 recordID];
      int v12 = [v11 recordName];
      id v13 = [(HMDCloudZone *)self createCloudRecordWithObjectID:v9 recordName:v12];

      int v14 = [v5 record];
      [v13 setRecord:v14];

      id v15 = [v5 data];
      [v13 setCachedData:v15];

      goto LABEL_10;
    }
    uint64_t v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      int v24 = 138543618;
      v25 = v19;
      __int16 v26 = 2112;
      v27 = v5;
      id v20 = "%{public}@Cannot create cloud record because fetch result record is incomplete %@";
      __int16 v21 = v18;
      uint32_t v22 = 22;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      int v24 = 138543362;
      v25 = v19;
      id v20 = "%{public}@Cannot create cloud record without fetch result";
      __int16 v21 = v18;
      uint32_t v22 = 12;
LABEL_8:
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v24, v22);
    }
  }

  id v13 = 0;
LABEL_10:

  return v13;
}

- (id)createCloudRecordWithObjectID:(id)a3 recordName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[HMDCloudRecord alloc] initWithObjectID:v7 recordName:v6 cloudZone:self];

  return v8;
}

- (void)cloudRecordWithName:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = [(HMDCloudZone *)self rootGroup];

  if (v8)
  {
    id v9 = [(HMDCloudZone *)self rootGroup];
    [v9 cloudRecordWithName:v6 completionHandler:v7];
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      id v15 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@No root group to get cloud record.", (uint8_t *)&v14, 0xCu);
    }
    id v9 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    v7[2](v7, 0, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)cloudRecordWithNames:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCloudZone *)self rootGroup];

  if (v8)
  {
    id v9 = [(HMDCloudZone *)self rootGroup];
    [v9 cloudRecordWithNames:v6 completionHandler:v7];
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      id v15 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@No root group to get cloud records.", (uint8_t *)&v14, 0xCu);
    }
    id v9 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (id)cloudRecordWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudZone *)self rootGroup];
  id v6 = [v5 cloudRecordWithName:v4];

  return v6;
}

- (BOOL)doesProcessChangeEvenIfDecryptionFails
{
  return 0;
}

- (id)description
{
  v2 = NSString;
  id v3 = [(HMDCloudZone *)self shortDescription];
  id v4 = [v2 stringWithFormat:@"<%@>", v3];

  return v4;
}

- (id)shortDescription
{
  id v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  id v5 = [(HMDCloudZone *)self backingStoreZone];
  id v6 = [v5 zoneName];
  id v7 = [v3 stringWithFormat:@"%@ Zone = %@", v4, v6];

  return v7;
}

- (HMDCloudZone)initWithBackingStoreCacheZone:(id)a3 cloudCache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDCloudZone;
  id v9 = [(HMDCloudZone *)&v16 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backingStoreZone, a3);
    objc_storeWeak((id *)&v10->_cache, v8);
    id v11 = objc_alloc(MEMORY[0x1E4F1A310]);
    int v12 = [v7 zoneName];
    uint64_t v13 = [v11 initWithZoneName:v12];
    zone = v10->_zone;
    v10->_zone = (CKRecordZone *)v13;
  }
  return v10;
}

- (HMDCloudZone)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (NSString)zoneRootRecordName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 zoneRootRecordName];
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (void)createZoneWithName:(id)a3 rootRecordName:(id)a4 subscriptionName:(id)a5 owner:(id)a6 cacheZone:(id)a7 cloudCache:(id)a8 completion:(id)a9
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  __int16 v21 = (void (**)(id, void, void *))a9;
  if (!v20)
  {
    uint32_t v22 = (void *)MEMORY[0x1D9452090]();
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v24 = v18;
      id v25 = v15;
      id v26 = v17;
      uint64_t v28 = v27 = v16;
      *(_DWORD *)buf = 138543618;
      v76 = v28;
      __int16 v77 = 2112;
      uint64_t v78 = (uint64_t)v25;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot create cloud zone without a cache %@", buf, 0x16u);

      id v16 = v27;
      id v17 = v26;
      id v15 = v25;
      id v18 = v24;
      id v20 = 0;
    }

    if (v21)
    {
      v29 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
      v21[2](v21, 0, v29);
    }
  }
  if (v19)
  {
    v30 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBackingStoreCacheZone:v19 cloudCache:v20];
    if (v30)
    {
      v31 = [v19 groups];
      uint64_t v32 = [v31 count];

      if (v32)
      {
        v33 = [v19 groups];
        unint64_t v34 = [v33 count];

        if (v34 >= 2)
        {
          id v59 = v18;
          id v35 = v17;
          id v36 = v16;
          v37 = (void *)MEMORY[0x1D9452090]();
          v38 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v39 = v57 = v37;
            v40 = [v19 groups];
            uint64_t v41 = [v40 count];
            *(_DWORD *)buf = 138543618;
            v76 = v39;
            __int16 v77 = 2048;
            uint64_t v78 = v41;
            _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_ERROR, "%{public}@Cloud zone has more that one group, %tu, using first group", buf, 0x16u);

            v37 = v57;
          }

          id v16 = v36;
          id v17 = v35;
          id v18 = v59;
        }
        v42 = [v19 groups];
        v43 = [v42 firstObject];

        v44 = [[HMDCloudGroup alloc] initWithBackingStoreCacheGroup:v43 cloudZone:v30];
        [v30 setRootGroup:v44];

        v45 = [v43 subscription];
        [v30 _initializeSubscription:v45];

        v46 = [v43 serverChangeToken];
        [v30 _initializeServerChangeToken:v46];

        v47 = [v30 rootGroup];
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __105__HMDCloudZone_createZoneWithName_rootRecordName_subscriptionName_owner_cacheZone_cloudCache_completion___block_invoke_71;
        v64[3] = &unk_1E6A09950;
        id v65 = v30;
        v66 = v21;
        [v47 rootRecordCompletionHandler:v64];
      }
      else
      {
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __105__HMDCloudZone_createZoneWithName_rootRecordName_subscriptionName_owner_cacheZone_cloudCache_completion___block_invoke_2_73;
        v61[3] = &unk_1E6A09900;
        id v62 = v30;
        v63 = v21;
        +[HMDCloudGroup createGroupWithRootRecordName:v16 owner:v18 subscriptionName:v17 cloudZone:v62 completion:v61];
      }
      v52 = 0;
    }
    else
    {
      id v58 = v16;
      v52 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11];
      v53 = (void *)MEMORY[0x1D9452090]();
      v54 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v60 = v18;
        v56 = id v55 = v17;
        *(_DWORD *)buf = 138543874;
        v76 = v56;
        __int16 v77 = 2112;
        uint64_t v78 = (uint64_t)v15;
        __int16 v79 = 2112;
        v80 = v52;
        _os_log_impl(&dword_1D49D5000, v54, OS_LOG_TYPE_ERROR, "%{public}@Failed to create zone %@ with error %@", buf, 0x20u);

        id v17 = v55;
        id v18 = v60;
      }

      if (v21) {
        v21[2](v21, 0, v52);
      }
      id v16 = v58;
    }
  }
  else
  {
    v48 = [HMDBackingStoreCacheCreateZoneOperation alloc];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __105__HMDCloudZone_createZoneWithName_rootRecordName_subscriptionName_owner_cacheZone_cloudCache_completion___block_invoke;
    v67[3] = &unk_1E6A09928;
    id v74 = a1;
    id v49 = v20;
    id v68 = v49;
    id v69 = v16;
    id v70 = v18;
    id v71 = v17;
    v73 = v21;
    id v72 = v15;
    v50 = [(HMDBackingStoreCacheCreateZoneOperation *)v48 initWithZoneName:v72 creationBlock:v67];
    v51 = [v49 backingStore];
    [v51 submit:v50];

    v30 = v68;
  }
}

void __105__HMDCloudZone_createZoneWithName_rootRecordName_subscriptionName_owner_cacheZone_cloudCache_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v6)
  {
    uint64_t v13 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBackingStoreCacheZone:v5 cloudCache:*(void *)(a1 + 32)];
    if (v13)
    {
      int v14 = v13;
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 48);
      uint64_t v17 = *(void *)(a1 + 56);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __105__HMDCloudZone_createZoneWithName_rootRecordName_subscriptionName_owner_cacheZone_cloudCache_completion___block_invoke_2;
      v19[3] = &unk_1E6A09900;
      id v20 = v13;
      id v21 = *(id *)(a1 + 72);
      id v18 = v14;
      +[HMDCloudGroup createGroupWithRootRecordName:v15 owner:v16 subscriptionName:v17 cloudZone:v18 completion:v19];

      id v7 = 0;
      goto LABEL_8;
    }
    id v7 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11];
  }
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 138543874;
    uint64_t v23 = v10;
    __int16 v24 = 2112;
    uint64_t v25 = v11;
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to create zone %@ with error %@", buf, 0x20u);
  }
  uint64_t v12 = *(void *)(a1 + 72);
  if (v12) {
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v7);
  }
LABEL_8:
}

void __105__HMDCloudZone_createZoneWithName_rootRecordName_subscriptionName_owner_cacheZone_cloudCache_completion___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7) {
    [*(id *)(a1 + 32) setRecordsAvailable:1];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, *(void *)(a1 + 32), 0);
  }
}

void __105__HMDCloudZone_createZoneWithName_rootRecordName_subscriptionName_owner_cacheZone_cloudCache_completion___block_invoke_2_73(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (!v5) {
    [*(id *)(a1 + 32) setRootGroup:v7];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, *(void *)(a1 + 32), v5);
  }
}

void __105__HMDCloudZone_createZoneWithName_rootRecordName_subscriptionName_owner_cacheZone_cloudCache_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (!v5) {
    [*(id *)(a1 + 32) setRootGroup:v7];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, *(void *)(a1 + 32), v5);
  }
}

+ (id)zoneSubscriptionName:(id)a3
{
  return @"HomeDataBlobSubscription";
}

+ (id)zoneRootRecordName
{
  v2 = @"DONOTUPLOAD";
  return @"DONOTUPLOAD";
}

@end