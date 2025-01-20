@interface HMDCloudZoneChange
+ (id)shortDescription;
- (BOOL)controllerIdentifierChanged;
- (BOOL)decryptionFailed;
- (BOOL)doRecordsExistInCache;
- (BOOL)doesRecordExistInCacheWithObjectID:(id)a3;
- (BOOL)doesRecordExistWithObjectID:(id)a3;
- (BOOL)encryptionFailed;
- (BOOL)hasValidChanges;
- (BOOL)isTemporaryCache;
- (BOOL)moreChangesToProcess;
- (CKRecordID)privateZoneRootRecordID;
- (HMDCloudGroupChange)rootGroupChange;
- (HMDCloudZone)cloudZone;
- (HMDCloudZoneChange)changeWithObjectID:(id)a3;
- (HMDCloudZoneChange)changeWithRecordName:(id)a3;
- (HMDCloudZoneChange)init;
- (HMDCloudZoneChange)initWithZone:(id)a3 temporaryCache:(BOOL)a4;
- (NSArray)allTransactionStoreRowIDs;
- (NSArray)objectChanges;
- (NSArray)processedTransactionStoreRowIDs;
- (NSUUID)identifier;
- (id)cachedCloudRecordWithObjectID:(id)a3;
- (id)description;
- (id)shortDescription;
- (void)addChangeWithDeletedRecordID:(id)a3;
- (void)addChangeWithObjectChange:(id)a3;
- (void)addChangeWithRecord:(id)a3;
- (void)cachedCloudRecordWithObjectID:(id)a3 completionHandler:(id)a4;
- (void)fetchBatchToUpload:(id)a3;
- (void)flushAllChangesToCache;
- (void)loadCloudRecordsAndDetermineDeletesFromCache:(id)a3;
- (void)removeChangeWithObjectID:(id)a3;
- (void)resetRecordWithRecordID:(id)a3;
- (void)setAllChangedAsProcessed;
- (void)setCloudZone:(id)a3;
- (void)setDeleteAsProcessedWithRecordID:(id)a3;
- (void)setRootGroupChange:(id)a3;
- (void)setSaveAsProcessedWithRecord:(id)a3;
@end

@implementation HMDCloudZoneChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootGroupChange, 0);
  objc_destroyWeak((id *)&self->_cloudZone);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setRootGroupChange:(id)a3
{
}

- (HMDCloudGroupChange)rootGroupChange
{
  return self->_rootGroupChange;
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

- (BOOL)isTemporaryCache
{
  return self->_temporaryCache;
}

- (NSArray)objectChanges
{
  v2 = [(HMDCloudZoneChange *)self rootGroupChange];
  v3 = [v2 objectChanges];

  return (NSArray *)v3;
}

- (HMDCloudZoneChange)changeWithRecordName:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCloudZoneChange *)self rootGroupChange];
  v6 = [v5 changeWithRecordName:v4];

  return (HMDCloudZoneChange *)v6;
}

- (HMDCloudZoneChange)changeWithObjectID:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCloudZoneChange *)self rootGroupChange];
  v6 = [v5 changeWithObjectID:v4];

  return (HMDCloudZoneChange *)v6;
}

- (void)flushAllChangesToCache
{
  id v2 = [(HMDCloudZoneChange *)self rootGroupChange];
  [v2 flushAllChangesToCache];
}

- (void)setDeleteAsProcessedWithRecordID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudZoneChange *)self rootGroupChange];
  [v5 setDeleteAsProcessedWithRecordID:v4];
}

- (void)resetRecordWithRecordID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudZoneChange *)self rootGroupChange];
  [v5 resetRecordWithRecordID:v4];
}

- (void)setSaveAsProcessedWithRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudZoneChange *)self rootGroupChange];
  [v5 setSaveAsProcessedWithRecord:v4];
}

- (void)fetchBatchToUpload:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudZoneChange *)self rootGroupChange];
  [v5 fetchBatchToUpload:v4];
}

- (BOOL)moreChangesToProcess
{
  id v2 = [(HMDCloudZoneChange *)self rootGroupChange];
  char v3 = [v2 moreChangesToProcess];

  return v3;
}

- (void)setAllChangedAsProcessed
{
  id v2 = [(HMDCloudZoneChange *)self rootGroupChange];
  [v2 setAllChangedAsProcessed];
}

- (void)loadCloudRecordsAndDetermineDeletesFromCache:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudZoneChange *)self rootGroupChange];
  [v5 loadCloudRecordsAndDetermineDeletesFromCache:v4];
}

- (void)cachedCloudRecordWithObjectID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDCloudZoneChange *)self rootGroupChange];
  [v8 cachedCloudRecordWithObjectID:v7 completionHandler:v6];
}

- (id)cachedCloudRecordWithObjectID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudZoneChange *)self rootGroupChange];
  id v6 = [v5 cachedCloudRecordWithObjectID:v4];

  return v6;
}

- (BOOL)doRecordsExistInCache
{
  id v2 = [(HMDCloudZoneChange *)self rootGroupChange];
  char v3 = [v2 doRecordsExistInCache];

  return v3;
}

- (BOOL)doesRecordExistInCacheWithObjectID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudZoneChange *)self rootGroupChange];
  id v6 = [v5 cachedCloudRecordWithObjectID:v4];

  return v6 != 0;
}

- (BOOL)doesRecordExistWithObjectID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudZoneChange *)self rootGroupChange];
  id v6 = [v5 cloudRecordWithObjectID:v4];

  return v6 != 0;
}

- (BOOL)hasValidChanges
{
  id v2 = [(HMDCloudZoneChange *)self rootGroupChange];
  char v3 = [v2 hasValidChanges];

  return v3;
}

- (void)removeChangeWithObjectID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudZoneChange *)self rootGroupChange];
  [v5 removeChangeWithObjectID:v4];
}

- (void)addChangeWithDeletedRecordID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudZoneChange *)self rootGroupChange];
  [v5 addChangeWithDeletedRecordID:v4];
}

- (void)addChangeWithRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudZoneChange *)self rootGroupChange];
  [v5 addChangeWithRecord:v4];
}

- (void)addChangeWithObjectChange:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudZoneChange *)self rootGroupChange];
  [v5 addChangeWithObjectChange:v4];
}

- (NSArray)processedTransactionStoreRowIDs
{
  id v2 = [(HMDCloudZoneChange *)self rootGroupChange];
  char v3 = [v2 processedTransactionStoreRowIDs];

  return (NSArray *)v3;
}

- (NSArray)allTransactionStoreRowIDs
{
  id v2 = [(HMDCloudZoneChange *)self rootGroupChange];
  char v3 = [v2 allTransactionStoreRowIDs];

  return (NSArray *)v3;
}

- (CKRecordID)privateZoneRootRecordID
{
  id v2 = [(HMDCloudZoneChange *)self cloudZone];
  char v3 = [v2 privateZoneRootRecordID];

  return (CKRecordID *)v3;
}

- (BOOL)controllerIdentifierChanged
{
  id v2 = [(HMDCloudZoneChange *)self rootGroupChange];
  char v3 = [v2 controllerIdentifierChanged];

  return v3;
}

- (BOOL)encryptionFailed
{
  id v2 = [(HMDCloudZoneChange *)self rootGroupChange];
  char v3 = [v2 encryptionFailed];

  return v3;
}

- (BOOL)decryptionFailed
{
  id v2 = [(HMDCloudZoneChange *)self rootGroupChange];
  char v3 = [v2 decryptionFailed];

  return v3;
}

- (id)description
{
  char v3 = NSString;
  id v4 = [(HMDCloudZoneChange *)self shortDescription];
  id v5 = [(HMDCloudZoneChange *)self cloudZone];
  id v6 = [v3 stringWithFormat:@"<%@, Cloud Zone = %@>", v4, v5];

  return v6;
}

- (id)shortDescription
{
  char v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  id v5 = [(HMDCloudZoneChange *)self identifier];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (HMDCloudZoneChange)initWithZone:(id)a3 temporaryCache:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HMDCloudZoneChange;
  id v7 = [(HMDCloudZoneChange *)&v20 init];
  if (!v7) {
    goto LABEL_4;
  }
  uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
  identifier = v7->_identifier;
  v7->_identifier = (NSUUID *)v8;

  id v10 = objc_storeWeak((id *)&v7->_cloudZone, v6);
  v7->_temporaryCache = v4;
  if (v6)
  {
    v11 = [HMDCloudGroupChange alloc];
    v12 = [v6 rootGroup];
    uint64_t v13 = [(HMDCloudGroupChange *)v11 initWithGroup:v12 temporaryCache:v4];
    rootGroupChange = v7->_rootGroupChange;
    v7->_rootGroupChange = (HMDCloudGroupChange *)v13;

LABEL_4:
    v15 = v7;
    goto LABEL_8;
  }
  v16 = (void *)MEMORY[0x1D9452090](v10);
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v22 = v18;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cloud zone must be specified", buf, 0xCu);
  }
  v15 = 0;
LABEL_8:

  return v15;
}

- (HMDCloudZoneChange)init
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  BOOL v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)shortDescription
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end