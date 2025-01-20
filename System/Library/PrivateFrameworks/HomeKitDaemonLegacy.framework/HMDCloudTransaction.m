@interface HMDCloudTransaction
+ (id)shortDescription;
- (BOOL)controllerIdentifierChanged;
- (BOOL)decryptionFailed;
- (BOOL)doRecordsExistInCache;
- (BOOL)doesRecordExistInCacheWithObjectID:(id)a3;
- (BOOL)doesRecordExistWithObjectID:(id)a3;
- (BOOL)encryptionFailed;
- (BOOL)hasValidChanges;
- (BOOL)iCloudSwitchStateEnabled;
- (BOOL)isHomeManagerTransaction;
- (BOOL)isHomeTransaction;
- (BOOL)isLegacyTransaction;
- (BOOL)isMetadataTransaction;
- (BOOL)isTemporaryCache;
- (BOOL)moreChangesToProcess;
- (BOOL)needConflictResolution;
- (BOOL)shouldCreateZone;
- (BOOL)shouldDeleteZone;
- (BOOL)wasZoneCreated;
- (BOOL)wasZoneDeleted;
- (BOOL)zoneHasNoLocalData;
- (CKRecordID)privateZoneRootRecordID;
- (CKServerChangeToken)updatedServerChangeToken;
- (HMDCloudChange)homeDataChange;
- (HMDCloudTransaction)init;
- (HMDCloudTransaction)initWithType:(unint64_t)a3 temporaryCache:(BOOL)a4;
- (HMDCloudTransaction)initWithType:(unint64_t)a3 temporaryCache:(BOOL)a4 noLocalData:(BOOL)a5;
- (HMDCloudZone)cloudZone;
- (HMDCloudZoneChange)cloudZoneChange;
- (HMFOSTransaction)osTransaction;
- (NSArray)allTransactionStoreRowIDs;
- (NSArray)objectChanges;
- (NSArray)processedTransactionStoreRowIDs;
- (NSArray)recordsToDelete;
- (NSArray)recordsToSave;
- (NSUUID)identifier;
- (id)cachedCloudRecordWithObjectID:(id)a3;
- (id)changeWithObjectID:(id)a3;
- (id)changeWithRecordName:(id)a3;
- (id)description;
- (id)replayTransaction:(id)a3 stagedTransaction:(id)a4;
- (id)shortDescription;
- (unint64_t)transactionType;
- (void)addChangeWithDeletedRecordID:(id)a3;
- (void)addChangeWithObjectChange:(id)a3;
- (void)addChangeWithRecord:(id)a3;
- (void)cachedCloudRecordWithObjectID:(id)a3 completionHandler:(id)a4;
- (void)fetchBatchToUpload:(id)a3;
- (void)loadCloudRecordsAndDetermineDeletesFromCache:(id)a3;
- (void)loadObjectChanges;
- (void)removeChangeWithObjectID:(id)a3;
- (void)resetRecordWithRecordID:(id)a3;
- (void)setAllChangedAsProcessed;
- (void)setCloudZone:(id)a3;
- (void)setCloudZoneChange:(id)a3;
- (void)setCreateZone:(BOOL)a3;
- (void)setDeleteAsProcessedWithRecordID:(id)a3;
- (void)setDeleteZone:(BOOL)a3;
- (void)setHomeDataChange:(id)a3;
- (void)setICloudSwitchStateEnabled:(BOOL)a3;
- (void)setNeedConflictResolution:(BOOL)a3;
- (void)setOsTransaction:(id)a3;
- (void)setSaveAsProcessedWithRecord:(id)a3;
- (void)setTransactionType:(unint64_t)a3;
- (void)setUpdatedServerChangeToken:(id)a3;
- (void)setZoneWasCreated:(BOOL)a3;
- (void)setZoneWasDeleted:(BOOL)a3;
- (void)updateCloudCache;
- (void)updateCloudZone:(id)a3;
@end

@implementation HMDCloudTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeDataChange, 0);
  objc_storeStrong((id *)&self->_cloudZoneChange, 0);
  objc_storeStrong((id *)&self->_recordsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
  objc_storeStrong((id *)&self->_updatedServerChangeToken, 0);
  objc_destroyWeak((id *)&self->_cloudZone);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_osTransaction, 0);
}

- (void)setHomeDataChange:(id)a3
{
}

- (HMDCloudChange)homeDataChange
{
  return self->_homeDataChange;
}

- (void)setCloudZoneChange:(id)a3
{
}

- (HMDCloudZoneChange)cloudZoneChange
{
  return self->_cloudZoneChange;
}

- (void)setTransactionType:(unint64_t)a3
{
  self->_transactionType = a3;
}

- (unint64_t)transactionType
{
  return self->_transactionType;
}

- (NSArray)recordsToDelete
{
  return self->_recordsToDelete;
}

- (NSArray)recordsToSave
{
  return self->_recordsToSave;
}

- (void)setZoneWasDeleted:(BOOL)a3
{
  self->_zoneWasDeleted = a3;
}

- (BOOL)wasZoneDeleted
{
  return self->_zoneWasDeleted;
}

- (void)setDeleteZone:(BOOL)a3
{
  self->_deleteZone = a3;
}

- (BOOL)shouldDeleteZone
{
  return self->_deleteZone;
}

- (void)setZoneWasCreated:(BOOL)a3
{
  self->_zoneWasCreated = a3;
}

- (BOOL)wasZoneCreated
{
  return self->_zoneWasCreated;
}

- (void)setCreateZone:(BOOL)a3
{
  self->_createZone = a3;
}

- (BOOL)zoneHasNoLocalData
{
  return self->_zoneHasNoLocalData;
}

- (BOOL)isTemporaryCache
{
  return self->_temporaryCache;
}

- (void)setUpdatedServerChangeToken:(id)a3
{
}

- (CKServerChangeToken)updatedServerChangeToken
{
  return self->_updatedServerChangeToken;
}

- (void)setICloudSwitchStateEnabled:(BOOL)a3
{
  self->_iCloudSwitchStateEnabled = a3;
}

- (BOOL)iCloudSwitchStateEnabled
{
  return self->_iCloudSwitchStateEnabled;
}

- (void)setNeedConflictResolution:(BOOL)a3
{
  self->_needConflictResolution = a3;
}

- (BOOL)needConflictResolution
{
  return self->_needConflictResolution;
}

- (void)setCloudZone:(id)a3
{
}

- (HMDCloudZone)cloudZone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudZone);
  return (HMDCloudZone *)WeakRetained;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSArray)objectChanges
{
  v2 = [(HMDCloudTransaction *)self cloudZoneChange];
  v3 = [v2 objectChanges];

  return (NSArray *)v3;
}

- (id)replayTransaction:(id)a3 stagedTransaction:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDCloudTransaction *)self objectChanges];
  v9 = (void *)[v8 mutableCopy];

  if (v7)
  {
    [MEMORY[0x1E4F1CA48] array];
    v22 = v21 = v9;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v16 = objc_msgSend(v15, "objectID", v21);
          uint64_t v17 = [v6 changeWithObjectID:v16];

          v18 = [v15 objectID];
          uint64_t v19 = [v7 changeWithObjectID:v18];

          if (v17 | v19)
          {
            [v15 replayChange:v17 stagedChange:v19];
            if ([v15 isDropAndDoNotApply]) {
              [v22 addObject:v15];
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v12);
    }

    [v10 removeObjectsInArray:v22];
    v9 = v21;
  }

  return v9;
}

- (void)loadObjectChanges
{
  v2 = [(HMDCloudTransaction *)self objectChanges];
}

- (id)changeWithRecordName:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCloudTransaction *)self cloudZoneChange];
  id v6 = [v5 changeWithRecordName:v4];

  return v6;
}

- (id)changeWithObjectID:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCloudTransaction *)self cloudZoneChange];
  id v6 = [v5 changeWithObjectID:v4];

  return v6;
}

- (BOOL)shouldCreateZone
{
  return self->_createZone;
}

- (BOOL)isHomeTransaction
{
  return [(HMDCloudTransaction *)self transactionType] == 4;
}

- (BOOL)isHomeManagerTransaction
{
  return [(HMDCloudTransaction *)self transactionType] == 3;
}

- (BOOL)isMetadataTransaction
{
  return [(HMDCloudTransaction *)self transactionType] == 2;
}

- (BOOL)isLegacyTransaction
{
  return [(HMDCloudTransaction *)self transactionType] == 1;
}

- (void)updateCloudCache
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (![(HMDCloudTransaction *)self isTemporaryCache])
  {
    if ([(HMDCloudTransaction *)self decryptionFailed])
    {
      v3 = (void *)MEMORY[0x1D9452090]();
      id v4 = self;
      v5 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v11 = v6;
        _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_ERROR, "%{public}@Do not update cloud cache for transaction because decryption has failed.", buf, 0xCu);
      }
    }
    else
    {
      id v7 = [(HMDCloudTransaction *)self cloudZoneChange];
      [v7 flushAllChangesToCache];

      id v9 = [(HMDCloudTransaction *)self updatedServerChangeToken];
      v8 = [(HMDCloudTransaction *)self cloudZone];
      [v8 setServerChangeToken:v9];
    }
  }
}

- (void)setDeleteAsProcessedWithRecordID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudTransaction *)self cloudZoneChange];
  [v5 setDeleteAsProcessedWithRecordID:v4];
}

- (void)resetRecordWithRecordID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudTransaction *)self cloudZoneChange];
  [v5 resetRecordWithRecordID:v4];
}

- (void)setSaveAsProcessedWithRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudTransaction *)self cloudZoneChange];
  [v5 setSaveAsProcessedWithRecord:v4];
}

- (void)fetchBatchToUpload:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudTransaction *)self cloudZoneChange];
  [v5 fetchBatchToUpload:v4];
}

- (BOOL)moreChangesToProcess
{
  v2 = [(HMDCloudTransaction *)self cloudZoneChange];
  char v3 = [v2 moreChangesToProcess];

  return v3;
}

- (void)setAllChangedAsProcessed
{
  id v2 = [(HMDCloudTransaction *)self cloudZoneChange];
  [v2 setAllChangedAsProcessed];
}

- (void)loadCloudRecordsAndDetermineDeletesFromCache:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(HMDCloudTransaction *)self cloudZoneChange];

  if (v4 && !v5)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to load cached records because cloudZone cannot be not determined", (uint8_t *)&v12, 0xCu);
    }
    id v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
    v4[2](v4, v10);
  }
  uint64_t v11 = [(HMDCloudTransaction *)self cloudZoneChange];
  [v11 loadCloudRecordsAndDetermineDeletesFromCache:v4];
}

- (void)cachedCloudRecordWithObjectID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDCloudTransaction *)self cloudZoneChange];
  [v8 cachedCloudRecordWithObjectID:v7 completionHandler:v6];
}

- (id)cachedCloudRecordWithObjectID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudTransaction *)self cloudZoneChange];
  id v6 = [v5 cachedCloudRecordWithObjectID:v4];

  return v6;
}

- (BOOL)doRecordsExistInCache
{
  id v2 = [(HMDCloudTransaction *)self cloudZoneChange];
  char v3 = [v2 doRecordsExistInCache];

  return v3;
}

- (BOOL)doesRecordExistInCacheWithObjectID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudTransaction *)self cloudZoneChange];
  char v6 = [v5 doesRecordExistInCacheWithObjectID:v4];

  return v6;
}

- (BOOL)doesRecordExistWithObjectID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudTransaction *)self cloudZoneChange];
  char v6 = [v5 doesRecordExistWithObjectID:v4];

  return v6;
}

- (BOOL)hasValidChanges
{
  id v2 = [(HMDCloudTransaction *)self cloudZoneChange];
  char v3 = [v2 hasValidChanges];

  return v3;
}

- (void)removeChangeWithObjectID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudTransaction *)self cloudZoneChange];
  [v5 removeChangeWithObjectID:v4];
}

- (void)addChangeWithDeletedRecordID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudTransaction *)self cloudZoneChange];
  [v5 addChangeWithDeletedRecordID:v4];
}

- (void)addChangeWithRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudTransaction *)self cloudZoneChange];
  [v5 addChangeWithRecord:v4];
}

- (void)addChangeWithObjectChange:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudTransaction *)self cloudZoneChange];
  [v5 addChangeWithObjectChange:v4];
}

- (NSArray)processedTransactionStoreRowIDs
{
  id v2 = [(HMDCloudTransaction *)self cloudZoneChange];
  char v3 = [v2 processedTransactionStoreRowIDs];

  return (NSArray *)v3;
}

- (NSArray)allTransactionStoreRowIDs
{
  id v2 = [(HMDCloudTransaction *)self cloudZoneChange];
  char v3 = [v2 allTransactionStoreRowIDs];

  return (NSArray *)v3;
}

- (CKRecordID)privateZoneRootRecordID
{
  id v2 = [(HMDCloudTransaction *)self cloudZoneChange];
  char v3 = [v2 privateZoneRootRecordID];

  return (CKRecordID *)v3;
}

- (BOOL)controllerIdentifierChanged
{
  id v2 = [(HMDCloudTransaction *)self cloudZoneChange];
  char v3 = [v2 controllerIdentifierChanged];

  return v3;
}

- (BOOL)encryptionFailed
{
  id v2 = [(HMDCloudTransaction *)self cloudZoneChange];
  char v3 = [v2 encryptionFailed];

  return v3;
}

- (BOOL)decryptionFailed
{
  id v2 = [(HMDCloudTransaction *)self cloudZoneChange];
  char v3 = [v2 decryptionFailed];

  return v3;
}

- (void)setOsTransaction:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    id v5 = (HMFOSTransaction *)v4;
    osTransaction = self->_osTransaction;
    self->_osTransaction = v5;
  }
  else
  {
    [(HMDCloudTransaction *)self setCloudZoneChange:0];
    osTransaction = self->_osTransaction;
    self->_osTransaction = 0;
  }
}

- (HMFOSTransaction)osTransaction
{
  return self->_osTransaction;
}

- (id)description
{
  char v3 = NSString;
  id v4 = [(HMDCloudTransaction *)self shortDescription];
  id v5 = [(HMDCloudTransaction *)self cloudZoneChange];
  char v6 = [v3 stringWithFormat:@"<%@, Cloud Zone Change = %@>", v4, v5];

  return v6;
}

- (id)shortDescription
{
  char v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  id v5 = [(HMDCloudTransaction *)self identifier];
  char v6 = [v5 UUIDString];
  unint64_t v7 = [(HMDCloudTransaction *)self transactionType];
  if (v7 > 4) {
    id v8 = @"unknown";
  }
  else {
    id v8 = off_1E6A16E60[v7];
  }
  id v9 = [v3 stringWithFormat:@"%@ %@, Type = %@", v4, v6, v8];

  return v9;
}

- (void)updateCloudZone:(id)a3
{
  p_cloudZone = &self->_cloudZone;
  id v5 = a3;
  objc_storeWeak((id *)p_cloudZone, v5);
  objc_msgSend(v5, "createCloudZoneChangeTemporaryCache:", -[HMDCloudTransaction isTemporaryCache](self, "isTemporaryCache"));
  char v6 = (HMDCloudZoneChange *)objc_claimAutoreleasedReturnValue();

  cloudZoneChange = self->_cloudZoneChange;
  self->_cloudZoneChange = v6;
}

- (HMDCloudTransaction)initWithType:(unint64_t)a3 temporaryCache:(BOOL)a4 noLocalData:(BOOL)a5
{
  v12.receiver = self;
  v12.super_class = (Class)HMDCloudTransaction;
  id v8 = [(HMDCloudTransaction *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    identifier = v8->_identifier;
    v8->_identifier = (NSUUID *)v9;

    v8->_transactionType = a3;
    v8->_temporaryCache = a4;
    v8->_zoneHasNoLocalData = a5;
  }
  return v8;
}

- (HMDCloudTransaction)initWithType:(unint64_t)a3 temporaryCache:(BOOL)a4
{
  return [(HMDCloudTransaction *)self initWithType:a3 temporaryCache:a4 noLocalData:0];
}

- (HMDCloudTransaction)init
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  char v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)shortDescription
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end