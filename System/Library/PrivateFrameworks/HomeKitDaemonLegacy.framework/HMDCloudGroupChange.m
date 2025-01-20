@interface HMDCloudGroupChange
+ (id)shortDescription;
- (BOOL)controllerIdentifierChanged;
- (BOOL)decryptionFailed;
- (BOOL)doRecordsExistInCache;
- (BOOL)encryptionFailed;
- (BOOL)hasValidChanges;
- (BOOL)isRootRecord:(id)a3;
- (BOOL)isRootRecordName:(id)a3;
- (BOOL)isRootRecordRequired;
- (BOOL)isTemporaryCache;
- (BOOL)moreChangesToProcess;
- (HMDCloudChangeTree)cloudChangeTree;
- (HMDCloudGroup)cloudGroup;
- (HMDCloudGroupChange)changeWithObjectID:(id)a3;
- (HMDCloudGroupChange)changeWithRecordName:(id)a3;
- (HMDCloudGroupChange)init;
- (HMDCloudGroupChange)initWithGroup:(id)a3 temporaryCache:(BOOL)a4;
- (HMDCloudGroupChange)initWithGroup:(id)a3 temporaryCache:(BOOL)a4 metricsDispatcher:(id)a5;
- (HMDCloudManagerMetricsDispatcher)metricsDispatcher;
- (NSArray)allTransactionStoreRowIDs;
- (NSArray)objectChanges;
- (NSArray)processedTransactionStoreRowIDs;
- (NSMutableArray)cloudChanges;
- (NSMutableArray)processedCloudChanges;
- (NSMutableArray)processingCloudChanges;
- (id)cachedCloudRecordWithObjectID:(id)a3;
- (id)cloudRecordWithName:(id)a3;
- (id)cloudRecordWithObjectID:(id)a3;
- (id)description;
- (id)rootRecordModelObject;
- (id)shortDescription;
- (void)_addChangeWithDeletedCloudRecord:(id)a3;
- (void)_initializeCloudChanges;
- (void)_loadTreeWithRecordMapping:(id)a3;
- (void)_removeChange:(id)a3;
- (void)addChange:(id)a3 setAsProcessing:(BOOL)a4;
- (void)addChangeWithDeletedRecordID:(id)a3;
- (void)addChangeWithObjectChange:(id)a3;
- (void)addChangeWithRecord:(id)a3;
- (void)addRootRecordChange;
- (void)cachedCloudRecordWithObjectID:(id)a3 completionHandler:(id)a4;
- (void)collectRecordsForBatch;
- (void)fetchBatchToUpload:(id)a3;
- (void)flushAllChangesToCache;
- (void)loadCloudChangeTreeFromCache:(id)a3;
- (void)loadCloudRecordsAndDetermineDeletesFromCache:(id)a3;
- (void)loadCloudRecordsFromCache:(id)a3;
- (void)removeChangeWithObjectID:(id)a3;
- (void)resetRecordWithRecordID:(id)a3;
- (void)setAllChangedAsProcessed;
- (void)setAsProcessedChange:(id)a3;
- (void)setCloudChangeTree:(id)a3;
- (void)setCloudChanges:(id)a3;
- (void)setControllerIdentifierChanged:(BOOL)a3;
- (void)setDecryptionFailed:(BOOL)a3;
- (void)setDeleteAsProcessedWithRecordID:(id)a3;
- (void)setEncryptionFailed:(BOOL)a3;
- (void)setProcessedCloudChanges:(id)a3;
- (void)setProcessingCloudChanges:(id)a3;
- (void)setSaveAsProcessedWithRecord:(id)a3;
@end

@implementation HMDCloudGroupChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsDispatcher, 0);
  objc_storeStrong((id *)&self->_processedCloudChanges, 0);
  objc_storeStrong((id *)&self->_processingCloudChanges, 0);
  objc_storeStrong((id *)&self->_cloudChanges, 0);
  objc_storeStrong((id *)&self->_cloudChangeTree, 0);
  objc_destroyWeak((id *)&self->_cloudGroup);
}

- (HMDCloudManagerMetricsDispatcher)metricsDispatcher
{
  return (HMDCloudManagerMetricsDispatcher *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProcessedCloudChanges:(id)a3
{
}

- (NSMutableArray)processedCloudChanges
{
  return self->_processedCloudChanges;
}

- (void)setProcessingCloudChanges:(id)a3
{
}

- (NSMutableArray)processingCloudChanges
{
  return self->_processingCloudChanges;
}

- (void)setCloudChanges:(id)a3
{
}

- (NSMutableArray)cloudChanges
{
  return self->_cloudChanges;
}

- (void)setCloudChangeTree:(id)a3
{
}

- (HMDCloudChangeTree)cloudChangeTree
{
  return self->_cloudChangeTree;
}

- (HMDCloudGroup)cloudGroup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudGroup);
  return (HMDCloudGroup *)WeakRetained;
}

- (void)setControllerIdentifierChanged:(BOOL)a3
{
  self->_controllerIdentifierChanged = a3;
}

- (BOOL)controllerIdentifierChanged
{
  return self->_controllerIdentifierChanged;
}

- (void)setEncryptionFailed:(BOOL)a3
{
  self->_encryptionFailed = a3;
}

- (BOOL)encryptionFailed
{
  return self->_encryptionFailed;
}

- (void)setDecryptionFailed:(BOOL)a3
{
  self->_decryptionFailed = a3;
}

- (BOOL)decryptionFailed
{
  return self->_decryptionFailed;
}

- (BOOL)isTemporaryCache
{
  return self->_temporaryCache;
}

- (NSArray)objectChanges
{
  [(HMDCloudGroupChange *)self _initializeCloudChanges];
  v3 = [(HMDCloudGroupChange *)self cloudChanges];
  +[HMDBackingStoreTransactionBlock sort:v3];

  v4 = [(HMDCloudGroupChange *)self cloudChanges];
  v5 = (void *)[v4 copy];

  return (NSArray *)v5;
}

- (BOOL)isRootRecord:(id)a3
{
  if (!a3) {
    return 0;
  }
  v4 = [a3 recordName];
  LOBYTE(self) = [(HMDCloudGroupChange *)self isRootRecordName:v4];

  return (char)self;
}

- (BOOL)isRootRecordName:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCloudGroupChange *)self cloudGroup];
  char v6 = [v5 isRootRecordName:v4];

  return v6;
}

- (void)flushAllChangesToCache
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCloudGroupChange *)self cloudGroup];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(HMDCloudGroupChange *)self cloudChanges];
  v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v10 isDeleted])
        {
          v11 = [v10 cloudRecord];
          [v3 deleteCloudRecord:v11];
        }
        else
        {
          if ([v10 isInvalid]) {
            goto LABEL_13;
          }
          v12 = [v10 deletedCloudRecord];

          if (v12)
          {
            v13 = [v10 deletedCloudRecord];
            [v3 deleteCloudRecord:v13];
          }
          v11 = [v10 cloudRecord];
          [v3 updateCloudRecord:v11];
        }

LABEL_13:
        [(HMDCloudGroupChange *)self setAsProcessedChange:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)setDeleteAsProcessedWithRecordID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 recordName];
  uint64_t v6 = [(HMDCloudGroupChange *)self changeWithRecordName:v5];

  if (v6)
  {
    uint64_t v7 = [(HMDCloudGroupChange *)self cloudGroup];
    uint64_t v8 = [v6 cloudRecord];
    [v7 deleteCloudRecord:v8];

    [(HMDCloudGroupChange *)self setAsProcessedChange:v6];
  }
  else
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      v13 = [v4 recordName];
      int v14 = 138543618;
      long long v15 = v12;
      __int16 v16 = 2112;
      long long v17 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to find deleted change for recordID %@, cannot update cloud cache", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)resetRecordWithRecordID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 recordName];
  uint64_t v6 = [(HMDCloudGroupChange *)self changeWithRecordName:v5];

  if (v6)
  {
    [v6 resetRecord];
    uint64_t v7 = [(HMDCloudGroupChange *)self cloudGroup];
    uint64_t v8 = [v6 cloudRecord];
    [v7 updateCloudRecord:v8];

    [(HMDCloudGroupChange *)self setAsProcessedChange:v6];
  }
  else
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      v13 = [v4 recordName];
      int v14 = 138543618;
      long long v15 = v12;
      __int16 v16 = 2112;
      long long v17 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to find change for record %@, cannot reset cloud cache", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)setSaveAsProcessedWithRecord:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 recordID];
  uint64_t v6 = [v5 recordName];
  uint64_t v7 = [(HMDCloudGroupChange *)self changeWithRecordName:v6];

  if (v7)
  {
    [v7 updateChangeWithRecord:v4];
    uint64_t v8 = [(HMDCloudGroupChange *)self cloudGroup];
    v9 = [v7 cloudRecord];
    [v8 updateCloudRecord:v9];

    [(HMDCloudGroupChange *)self setAsProcessedChange:v7];
  }
  else
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v14 = [v4 recordID];
      long long v15 = [v14 recordName];
      int v16 = 138543618;
      long long v17 = v13;
      __int16 v18 = 2112;
      uint64_t v19 = v15;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to find change for record %@, cannot update cloud cache", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)fetchBatchToUpload:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  [(HMDCloudGroupChange *)self collectRecordsForBatch];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = [(HMDCloudGroupChange *)self processingCloudChanges];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v24;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v24 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      if ([v11 isDeleted])
      {
        v12 = [v11 recordID];
        if (!v12) {
          goto LABEL_14;
        }
        v13 = v5;
        goto LABEL_11;
      }
      uint64_t v14 = [v11 record];
      if (v14)
      {
        v12 = (void *)v14;
        v13 = v4;
LABEL_11:
        [v13 addObject:v12];
        goto LABEL_14;
      }
      long long v15 = [v11 cloudRecord];
      int v16 = [v15 encryptionFailed];

      if (v16)
      {
        long long v17 = (void *)MEMORY[0x1D9452090]();
        __int16 v18 = self;
        uint64_t v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v28 = v20;
          __int16 v29 = 2112;
          v30 = v11;
          _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to encrypt %@", buf, 0x16u);
        }
        [(HMDCloudGroupChange *)v18 setEncryptionFailed:1];
        goto LABEL_20;
      }
      v12 = 0;
LABEL_14:
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_20:

  if (v22)
  {
    if ([(HMDCloudGroupChange *)self encryptionFailed])
    {
      v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
      (*((void (**)(id, void, void, void *))v22 + 2))(v22, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], v21);
    }
    else
    {
      (*((void (**)(id, void *, void *, void))v22 + 2))(v22, v4, v5, 0);
    }
  }
}

- (void)removeChangeWithObjectID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(HMDCloudGroupChange *)self changeWithObjectID:v4];
    if (v5) {
      [(HMDCloudGroupChange *)self _removeChange:v5];
    }
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1D9452090]();
    uint64_t v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@ObjectID not specified", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_removeChange:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 objectID];
  if (v4)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v5 = [(HMDCloudGroupChange *)self cloudChanges];
    uint64_t v6 = (void *)[v5 copy];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v44 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v12 = [v11 objectID];
          int v13 = [v4 isEqual:v12];

          if (v13)
          {
            uint64_t v14 = [(HMDCloudGroupChange *)self cloudChanges];
            [v14 removeObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v8);
    }

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v15 = [(HMDCloudGroupChange *)self processingCloudChanges];
    int v16 = (void *)[v15 copy];

    uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v40 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          id v22 = [v21 objectID];
          int v23 = [v4 isEqual:v22];

          if (v23)
          {
            long long v24 = [(HMDCloudGroupChange *)self processingCloudChanges];
            [v24 removeObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v18);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v25 = [(HMDCloudGroupChange *)self processedCloudChanges];
    long long v26 = (void *)[v25 copy];

    uint64_t v27 = [v26 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v36;
      do
      {
        for (uint64_t k = 0; k != v28; ++k)
        {
          if (*(void *)v36 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v35 + 1) + 8 * k);
          uint64_t v32 = [v31 objectID];
          int v33 = [v4 isEqual:v32];

          if (v33)
          {
            v34 = [(HMDCloudGroupChange *)self processedCloudChanges];
            [v34 removeObject:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v35 objects:v47 count:16];
      }
      while (v28);
    }
  }
}

- (void)addChange:(id)a3 setAsProcessing:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    [(HMDCloudGroupChange *)self _removeChange:v6];
    if ([v6 isInvalid])
    {
      uint64_t v7 = [(HMDCloudGroupChange *)self processedCloudChanges];
    }
    else
    {
      if (v4) {
        [(HMDCloudGroupChange *)self processingCloudChanges];
      }
      else {
      uint64_t v7 = [(HMDCloudGroupChange *)self cloudChanges];
      }
    }
    uint64_t v12 = v7;
    [v7 addObject:v6];

    int v13 = [(HMDCloudGroupChange *)self cloudChangeTree];
    [v13 updateChange:v6];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1D9452090]();
    uint64_t v9 = self;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v14 = 138543362;
      long long v15 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Change not specified", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)collectRecordsForBatch
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCloudGroupChange *)self processingCloudChanges];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      uint64_t v9 = [(HMDCloudGroupChange *)v6 processingCloudChanges];
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v8;
      __int16 v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Changes already marked as processing when determining batch, added to next batch, %@", buf, 0x16u);
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  int v10 = [(HMDCloudGroupChange *)self cloudChanges];
  v11 = (void *)[v10 copy];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
LABEL_7:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v23 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * v15);
      uint64_t v17 = [(HMDCloudGroupChange *)self processingCloudChanges];
      unint64_t v18 = [v17 count];
      unint64_t v19 = cloudPushBatchLimit;

      if (v18 >= v19) {
        break;
      }
      uint64_t v20 = [(HMDCloudGroupChange *)self cloudChanges];
      [v20 removeObject:v16];

      if ([v16 isInvalid]) {
        [(HMDCloudGroupChange *)self processedCloudChanges];
      }
      else {
      v21 = [(HMDCloudGroupChange *)self processingCloudChanges];
      }
      [v21 addObject:v16];

      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v13) {
          goto LABEL_7;
        }
        break;
      }
    }
  }

  if ([(HMDCloudGroupChange *)self isRootRecordRequired]) {
    [(HMDCloudGroupChange *)self addRootRecordChange];
  }
}

- (void)addRootRecordChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCloudGroupChange *)self rootRecordModelObject];
  if (v3)
  {
    uint64_t v4 = [[HMDCloudChange alloc] initWithObjectChange:v3];
    v5 = [v3 uuid];
    id v6 = [(HMDCloudGroupChange *)self cloudRecordWithObjectID:v5];

    if (v6
      || ([(HMDCloudGroupChange *)self cloudGroup],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          [v7 rootRecord],
          id v6 = objc_claimAutoreleasedReturnValue(),
          v7,
          v6))
    {
      [(HMDCloudChange *)v4 updateCloudRecord:v6];
    }
    [(HMDCloudGroupChange *)self addChange:v4 setAsProcessing:1];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1D9452090]();
    uint64_t v9 = self;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine root record object change model", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (id)rootRecordModelObject
{
  v3 = [(HMDCloudGroupChange *)self cloudGroup];
  uint64_t v4 = [v3 rootRecordModelObject];

  v5 = [(HMDCloudGroupChange *)self cloudChangeTree];
  id v6 = [v5 recordMapWithFilter:0];
  [v4 setObjectIDToRecordNameMap:v6];

  return v4;
}

- (BOOL)isRootRecordRequired
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCloudGroupChange *)self cloudGroup];
  uint64_t v4 = [v3 cloudZone];
  v5 = [v4 zoneRootRecordName];
  char v6 = [v5 isEqualToString:@"DONOTUPLOAD"];

  if (v6) {
    return 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [(HMDCloudGroupChange *)self processingCloudChanges];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v13 isAdded] & 1) != 0 || (objc_msgSend(v13, "isDeleted"))
        {
          BOOL v7 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      BOOL v7 = 0;
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
LABEL_15:

  return v7;
}

- (void)setAllChangedAsProcessed
{
  [(HMDCloudGroupChange *)self _initializeCloudChanges];
  v3 = [(HMDCloudGroupChange *)self processedCloudChanges];
  uint64_t v4 = [(HMDCloudGroupChange *)self processingCloudChanges];
  [v3 addObjectsFromArray:v4];

  v5 = [(HMDCloudGroupChange *)self processingCloudChanges];
  [v5 removeAllObjects];

  char v6 = [(HMDCloudGroupChange *)self processedCloudChanges];
  BOOL v7 = [(HMDCloudGroupChange *)self cloudChanges];
  [v6 addObjectsFromArray:v7];

  id v8 = [(HMDCloudGroupChange *)self cloudChanges];
  [v8 removeAllObjects];
}

- (void)setAsProcessedChange:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(HMDCloudGroupChange *)self processingCloudChanges];
  int v5 = [v4 containsObject:v13];

  if (v5)
  {
    char v6 = [(HMDCloudGroupChange *)self processingCloudChanges];
  }
  else
  {
    BOOL v7 = [(HMDCloudGroupChange *)self cloudChanges];
    int v8 = [v7 containsObject:v13];

    if (!v8) {
      goto LABEL_6;
    }
    char v6 = [(HMDCloudGroupChange *)self cloudChanges];
  }
  uint64_t v9 = v6;
  [v6 removeObject:v13];

LABEL_6:
  uint64_t v10 = [(HMDCloudGroupChange *)self processedCloudChanges];
  char v11 = [v10 containsObject:v13];

  if ((v11 & 1) == 0)
  {
    int v12 = [(HMDCloudGroupChange *)self processedCloudChanges];
    [v12 addObject:v13];
  }
}

- (BOOL)moreChangesToProcess
{
  v2 = [(HMDCloudGroupChange *)self cloudChanges];
  uint64_t v3 = [v2 count];

  return v3 != 0;
}

- (void)loadCloudRecordsAndDetermineDeletesFromCache:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__HMDCloudGroupChange_loadCloudRecordsAndDetermineDeletesFromCache___block_invoke;
  v6[3] = &unk_1E6A16F80;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(HMDCloudGroupChange *)self loadCloudChangeTreeFromCache:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __68__HMDCloudGroupChange_loadCloudRecordsAndDetermineDeletesFromCache___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__HMDCloudGroupChange_loadCloudRecordsAndDetermineDeletesFromCache___block_invoke_2;
    v6[3] = &unk_1E6A19358;
    id v7 = *(id *)(a1 + 32);
    [WeakRetained loadCloudRecordsFromCache:v6];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    }
  }
}

uint64_t __68__HMDCloudGroupChange_loadCloudRecordsAndDetermineDeletesFromCache___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadCloudRecordsFromCache:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDCloudGroupChange *)self cloudChangeTree];
  [v5 findAndDeletedChildren];

  char v6 = [(HMDCloudGroupChange *)self cloudChangeTree];
  [v6 findAndMarkOrphanedBranches];

  objc_initWeak(&location, self);
  id v7 = [(HMDCloudGroupChange *)self cloudGroup];
  id v8 = [(HMDCloudGroupChange *)self cloudChangeTree];
  uint64_t v9 = [v8 objectsWithPotentialChanges];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__HMDCloudGroupChange_loadCloudRecordsFromCache___block_invoke;
  v11[3] = &unk_1E6A16150;
  id v10 = v4;
  id v12 = v10;
  objc_copyWeak(&v13, &location);
  [v7 cloudRecordWithObjectIDs:v9 completionHandler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __49__HMDCloudGroupChange_loadCloudRecordsFromCache___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v9);
    }
    goto LABEL_60;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    goto LABEL_57;
  }
  uint64_t v73 = a1;
  v74 = 0;
  id v75 = v7;
  v76 = v8;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  obuint64_t j = v7;
  uint64_t v12 = [obj countByEnumeratingWithState:&v86 objects:v95 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v78 = *(void *)v87;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v87 != v78) {
          objc_enumerationMutation(obj);
        }
        long long v15 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        long long v16 = (void *)MEMORY[0x1D9452090]();
        long long v17 = [WeakRetained cloudChangeTree];
        long long v18 = [v17 objectForUUID:v15];

        if (v18)
        {
          if (![v18 orphaned]) {
            goto LABEL_14;
          }
          unint64_t v19 = [v18 type];
          BOOL v20 = +[HMDCloudChangeTree modelTypeCanBeOrphaned:v19];

          if (v20)
          {
            [v18 deleteChildren];
LABEL_14:
            v21 = objc_msgSend(WeakRetained, "cloudChangeTree", v73, v74, v75);
            long long v22 = [obj objectForKeyedSubscript:v15];
            [v21 updateNode:v18 withCloudRecord:v22];

            goto LABEL_22;
          }
          uint64_t v28 = MEMORY[0x1D9452090]();
          id v29 = WeakRetained;
          v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            uint64_t v31 = HMFGetLogIdentifier();
            uint64_t v32 = [v18 shortDescription];
            *(_DWORD *)buf = 138543618;
            v92 = v31;
            __int16 v93 = 2112;
            v94 = v32;
            _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Record appears to be orphaned ignoring %@", buf, 0x16u);
          }
          uint64_t v27 = (void *)v28;
        }
        else
        {
          uint64_t v23 = MEMORY[0x1D9452090]();
          id v24 = WeakRetained;
          long long v25 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            long long v26 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v92 = v26;
            __int16 v93 = 2112;
            v94 = v15;
            _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@loadCloudRecordsFromCache skipping node of founded records no longer in tree %@", buf, 0x16u);
          }
          uint64_t v27 = (void *)v23;
        }
LABEL_22:
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v86 objects:v95 count:16];
    }
    while (v13);
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v77 = v76;
  id obja = (id)[v77 countByEnumeratingWithState:&v82 objects:v90 count:16];
  if (!obja) {
    goto LABEL_56;
  }
  uint64_t v79 = *(void *)v83;
  do
  {
    int v33 = 0;
    do
    {
      if (*(void *)v83 != v79) {
        objc_enumerationMutation(v77);
      }
      v34 = *(void **)(*((void *)&v82 + 1) + 8 * (void)v33);
      long long v35 = (void *)MEMORY[0x1D9452090]();
      long long v36 = [WeakRetained cloudChangeTree];
      long long v37 = [v36 objectForUUID:v34];

      if (v37)
      {
        long long v38 = [v37 change];
        if ([v38 isAdded])
        {
          char v39 = [v37 orphaned];

          if ((v39 & 1) == 0)
          {
            long long v40 = [WeakRetained cloudGroup];
            long long v41 = [v40 cloudZone];
            long long v42 = [v37 uuid];
            long long v43 = [v37 recordName];
            long long v44 = [v41 createCloudRecordWithObjectID:v42 recordName:v43];

            if (v44)
            {
              long long v45 = [WeakRetained cloudChangeTree];
              [v45 updateNode:v37 withCloudRecord:v44];
            }
            else
            {
              v65 = (void *)MEMORY[0x1D9452090]();
              id v66 = WeakRetained;
              v67 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
              {
                v68 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v92 = v68;
                __int16 v93 = 2112;
                v94 = v34;
                _os_log_impl(&dword_1D49D5000, v67, OS_LOG_TYPE_ERROR, "%{public}@loadCloudRecordsFromCache failed to create record for %@", buf, 0x16u);
              }
            }
LABEL_49:

            goto LABEL_50;
          }
        }
        else
        {
        }
        int v50 = objc_msgSend(v37, "orphaned", v73, v74, v75);
        v51 = (void *)MEMORY[0x1D9452090]();
        id v52 = WeakRetained;
        v53 = HMFGetOSLogHandle();
        v54 = v53;
        if (v50)
        {
          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
          {
            v55 = HMFGetLogIdentifier();
            v56 = [v37 uuid];
            *(_DWORD *)buf = 138543618;
            v92 = v55;
            __int16 v93 = 2112;
            v94 = v56;
            _os_log_impl(&dword_1D49D5000, v54, OS_LOG_TYPE_INFO, "%{public}@Changes has been orphaned before it can be pushed to the cloud %@", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            v57 = HMFGetLogIdentifier();
            v58 = [v37 change];
            *(_DWORD *)buf = 138543618;
            v92 = v57;
            __int16 v93 = 2112;
            v94 = v58;
            _os_log_impl(&dword_1D49D5000, v54, OS_LOG_TYPE_ERROR, "%{public}@Cannot create a new record for non-added change, %@", buf, 0x16u);
          }
          v59 = [v52 metricsDispatcher];
          v60 = [v37 change];
          uint64_t v61 = [v60 type];
          v62 = (void *)v61;
          if (v61) {
            v63 = (__CFString *)v61;
          }
          else {
            v63 = @"unknown";
          }
          v64 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11];
          [v59 submitFailureEventWithModelType:v63 failureCode:1 error:v64];
        }
        long long v44 = [v37 change];
        [v44 forceChangeToInvalid];
        goto LABEL_49;
      }
      long long v46 = (void *)MEMORY[0x1D9452090]();
      id v47 = WeakRetained;
      v48 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v49 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v92 = v49;
        __int16 v93 = 2112;
        v94 = v34;
        _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_ERROR, "%{public}@loadCloudRecordsFromCache skipping node no longer in tree %@", buf, 0x16u);
      }
LABEL_50:

      int v33 = (char *)v33 + 1;
    }
    while (obja != v33);
    uint64_t v69 = [v77 countByEnumeratingWithState:&v82 objects:v90 count:16];
    id obja = (id)v69;
  }
  while (v69);
LABEL_56:

  v70 = [WeakRetained cloudChangeTree];
  [v70 logChangeTreeWithIndent:&stru_1F2C9F1A8];

  [WeakRetained _initializeCloudChanges];
  v71 = [WeakRetained cloudChanges];
  +[HMDBackingStoreTransactionBlock sort:v71];

  id v7 = v75;
  id v8 = v76;
  a1 = v73;
  id v9 = v74;
LABEL_57:
  uint64_t v72 = *(void *)(a1 + 32);
  if (v72) {
    (*(void (**)(uint64_t, void))(v72 + 16))(v72, 0);
  }

LABEL_60:
}

- (void)_initializeCloudChanges
{
  id v3 = [(HMDCloudGroupChange *)self cloudChangeTree];
  id v4 = [v3 cloudChanges];
  [(HMDCloudGroupChange *)self setCloudChanges:v4];

  id v6 = [(HMDCloudGroupChange *)self cloudChangeTree];
  uint64_t v5 = [v6 invalidCloudChanges];
  [(HMDCloudGroupChange *)self setProcessedCloudChanges:v5];
}

- (void)loadCloudChangeTreeFromCache:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [(HMDCloudGroupChange *)v6 cloudGroup];
    uint64_t v10 = [v9 identifier];
    *(_DWORD *)buf = 138543618;
    long long v17 = v8;
    __int16 v18 = 2112;
    unint64_t v19 = v10;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching cloud change tree info for group %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v6);
  char v11 = [(HMDCloudGroupChange *)v6 cloudGroup];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__HMDCloudGroupChange_loadCloudChangeTreeFromCache___block_invoke;
  v13[3] = &unk_1E6A151F8;
  objc_copyWeak(&v15, (id *)buf);
  id v12 = v4;
  id v14 = v12;
  [v11 fetchCloudRecordMap:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __52__HMDCloudGroupChange_loadCloudChangeTreeFromCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (v6)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
      uint64_t v10 = *(void (**)(void))(v9 + 16);
LABEL_17:
      v10();
    }
  }
  else
  {
    if (WeakRetained)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v11 = v5;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v26;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * v15);
            long long v17 = (void *)MEMORY[0x1D9452090](v12);
            objc_msgSend(v8, "_loadTreeWithRecordMapping:", v16, (void)v25);
            ++v15;
          }
          while (v13 != v15);
          uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
          uint64_t v13 = v12;
        }
        while (v12);
      }

      __int16 v18 = (void *)MEMORY[0x1D9452090]();
      id v19 = v8;
      uint64_t v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = HMFGetLogIdentifier();
        long long v22 = [v19 cloudGroup];
        uint64_t v23 = [v22 identifier];
        *(_DWORD *)buf = 138543618;
        v30 = v21;
        __int16 v31 = 2112;
        uint64_t v32 = v23;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Fetching cloud change tree info completed for group %@", buf, 0x16u);
      }
    }
    uint64_t v24 = *(void *)(a1 + 32);
    if (v24)
    {
      uint64_t v10 = *(void (**)(void))(v24 + 16);
      goto LABEL_17;
    }
  }
}

- (void)_loadTreeWithRecordMapping:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudGroupChange *)self cloudChangeTree];
  [v5 updateRecordMapping:v4];
}

- (void)addChangeWithDeletedRecordID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      uint64_t v10 = [v4 recordName];
      int v18 = 138543618;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Processing deleted CKRecordID %@ for group change", (uint8_t *)&v18, 0x16u);
    }
    id v11 = [v4 recordName];
    uint64_t v12 = [(HMDCloudGroupChange *)v6 cloudRecordWithName:v11];

    if (v12)
    {
      [(HMDCloudGroupChange *)v6 _addChangeWithDeletedCloudRecord:v12];
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x1D9452090]();
      uint64_t v15 = v6;
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        long long v17 = HMFGetLogIdentifier();
        int v18 = 138543618;
        id v19 = v17;
        __int16 v20 = 2112;
        id v21 = v4;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Object does not exist in cache, dropping delete %@", (uint8_t *)&v18, 0x16u);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v18 = 138543362;
      id v19 = v13;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@RecordID not specified", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)_addChangeWithDeletedCloudRecord:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [[HMDCloudChange alloc] initWithCloudObjectRecord:v4];
    if (v5)
    {
      id v6 = [(HMDCloudGroupChange *)self cloudChangeTree];
      id v7 = [(HMDCloudChange *)v5 objectID];
      id v8 = [v6 objectForUUID:v7];

      if (v8)
      {
        uint64_t v9 = (void *)MEMORY[0x1D9452090]();
        uint64_t v10 = self;
        id v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = HMFGetLogIdentifier();
          uint64_t v13 = [(HMDCloudChange *)v5 objectID];
          uint64_t v14 = [v8 change];
          uint64_t v15 = [v14 cloudRecord];
          int v21 = 138544130;
          uint64_t v22 = v12;
          __int16 v23 = 2112;
          uint64_t v24 = v13;
          __int16 v25 = 2112;
          id v26 = v4;
          __int16 v27 = 2112;
          long long v28 = v15;
          _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Duplicate records for the object ID %@, deleting record %@ but keeping %@", (uint8_t *)&v21, 0x2Au);
        }
        uint64_t v16 = [v8 change];
        [v16 updateDeletedCloudRecord:v4];
      }
      else
      {
        [(HMDCloudChange *)v5 forceChangeToDelete];
        uint64_t v16 = [(HMDCloudGroupChange *)self cloudChangeTree];
        [v16 updateChange:v5];
      }
    }
  }
  else
  {
    long long v17 = (void *)MEMORY[0x1D9452090]();
    int v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      int v21 = 138543362;
      uint64_t v22 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@cloudRecord not specified, cannot create delete change", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (void)addChangeWithRecord:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (!v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v60 = v14;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Record not specified", buf, 0xCu);
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    uint64_t v10 = [v4 recordID];
    *(_DWORD *)buf = 138543618;
    v60 = v9;
    __int16 v61 = 2112;
    id v62 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Processing CKRecord %@ for group change", buf, 0x16u);
  }
  if (![(HMDCloudGroupChange *)v6 decryptionFailed])
  {
    uint64_t v15 = [(HMDCloudGroupChange *)v6 cloudGroup];
    uint64_t v16 = [v15 cloudZone];

    if (![(HMDCloudGroupChange *)v6 isTemporaryCache])
    {
      long long v17 = [v4 recordID];
      int v18 = [v17 recordName];
      id v19 = [(HMDCloudGroupChange *)v6 cloudRecordWithName:v18];

      if (v19)
      {
        __int16 v20 = [v4 recordChangeTag];
        int v21 = [v19 record];
        uint64_t v22 = [v21 recordChangeTag];
        int v23 = [v20 isEqualToString:v22];

        if (v23)
        {
          uint64_t v24 = (void *)MEMORY[0x1D9452090]();
          __int16 v25 = v6;
          id v26 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            __int16 v27 = HMFGetLogIdentifier();
            long long v28 = [v4 recordID];
            *(_DWORD *)buf = 138543618;
            v60 = v27;
            __int16 v61 = 2112;
            id v62 = v28;
            _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Already have current record in cache, dropping %@", buf, 0x16u);
          }
          goto LABEL_38;
        }
      }
    }
    uint64_t v29 = [v4 recordID];
    v30 = [v29 recordName];
    id v19 = [v16 createCloudRecordWithObjectID:0 recordName:v30];

    [v19 setRecord:v4];
    __int16 v31 = [[HMDCloudChange alloc] initWithCloudObjectRecord:v19];
    if (([v16 doesProcessChangeEvenIfDecryptionFails] & 1) != 0
      || ![v19 decryptionFailed])
    {
      if (v31)
      {
        long long v40 = [(HMDCloudGroupChange *)v6 cloudChangeTree];
        long long v41 = [(HMDCloudChange *)v31 objectID];
        long long v42 = [v40 objectForUUID:v41];

        if (v42)
        {
          long long v43 = (void *)MEMORY[0x1D9452090]();
          long long v44 = v6;
          long long v45 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            v56 = HMFGetLogIdentifier();
            v55 = [(HMDCloudChange *)v31 objectID];
            v57 = [v42 change];
            [v57 cloudRecord];
            long long v46 = v58 = v43;
            id v47 = [(HMDCloudChange *)v31 cloudRecord];
            *(_DWORD *)buf = 138544130;
            v60 = v56;
            __int16 v61 = 2112;
            id v62 = v55;
            __int16 v63 = 2112;
            v64 = v46;
            __int16 v65 = 2112;
            id v66 = v47;
            _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_INFO, "%{public}@Duplicate records for the object ID %@, deleting record %@ replacing with %@", buf, 0x2Au);

            long long v43 = v58;
          }

          v48 = [v42 change];
          v49 = [v48 cloudRecord];
          [(HMDCloudChange *)v31 updateDeletedCloudRecord:v49];

          int v50 = [(HMDCloudGroupChange *)v44 cloudChangeTree];
          [v50 removeNode:v42];
        }
        v51 = [(HMDCloudGroupChange *)v6 cloudChangeTree];
        [v51 updateChange:v31];

        goto LABEL_37;
      }
      int v33 = (void *)MEMORY[0x1D9452090]();
      uint64_t v34 = v6;
      long long v35 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      id v52 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v60 = v52;
      __int16 v61 = 2112;
      id v62 = v4;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Could not create object change object for record %@", buf, 0x16u);
    }
    else
    {
      BOOL v32 = [(HMDCloudGroupChange *)v6 isRootRecord:v19];
      int v33 = (void *)MEMORY[0x1D9452090]();
      uint64_t v34 = v6;
      long long v35 = HMFGetOSLogHandle();
      BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
      if (v32)
      {
        if (v36)
        {
          long long v37 = HMFGetLogIdentifier();
          long long v38 = [v4 recordID];
          char v39 = [v38 recordName];
          *(_DWORD *)buf = 138543618;
          v60 = v37;
          __int16 v61 = 2112;
          id v62 = v39;
          _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Decryption has failed for root record %@, cannot process zone further", buf, 0x16u);
        }
        [(HMDCloudGroupChange *)v34 setDecryptionFailed:1];
        goto LABEL_37;
      }
      if (!v36)
      {
LABEL_36:

LABEL_37:

LABEL_38:
        goto LABEL_39;
      }
      id v52 = HMFGetLogIdentifier();
      v53 = [v4 recordID];
      v54 = [v53 recordName];
      *(_DWORD *)buf = 138543618;
      v60 = v52;
      __int16 v61 = 2112;
      id v62 = v54;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Decryption has failed for record %@, dropping record but continuing to process zone", buf, 0x16u);
    }
    goto LABEL_36;
  }
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v11 = v6;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v60 = v13;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Decryption has already failed, do not process further", buf, 0xCu);
  }
LABEL_11:
LABEL_39:
}

- (void)addChangeWithObjectChange:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 uuid], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v16 = 138543618;
      long long v17 = v10;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Processing object change %@ for group change", (uint8_t *)&v16, 0x16u);
    }
    id v11 = [(HMDCloudGroupChange *)v8 cloudChangeTree];
    [v11 updateModel:v5];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1D9452090]();
    uint64_t v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      long long v17 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Object change not specified", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (id)cloudRecordWithName:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HMDCloudGroupChange *)self changeWithRecordName:v4];
    id v6 = [v5 cloudRecord];
    if (!v6)
    {
      id v7 = [(HMDCloudGroupChange *)self cloudGroup];
      id v6 = [v7 cloudRecordWithName:v4];
    }
    id v8 = v6;
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1D9452090]();
    uint64_t v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v14 = 138543362;
      uint64_t v15 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@RecordName not specified", (uint8_t *)&v14, 0xCu);
    }
    id v8 = 0;
  }

  return v8;
}

- (HMDCloudGroupChange)changeWithRecordName:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HMDCloudGroupChange *)self cloudChangeTree];
    id v6 = [v5 objectForRecordName:v4];

    id v7 = [v6 change];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      int v14 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@RecordName not specified", (uint8_t *)&v13, 0xCu);
    }
    id v7 = 0;
  }

  return (HMDCloudGroupChange *)v7;
}

- (BOOL)doRecordsExistInCache
{
  v2 = [(HMDCloudGroupChange *)self cloudGroup];
  char v3 = [v2 doRecordsExistInCache];

  return v3;
}

- (id)cachedCloudRecordWithObjectID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudGroupChange *)self cloudGroup];
  id v6 = [v5 cloudRecordWithObjectID:v4];

  return v6;
}

- (void)cachedCloudRecordWithObjectID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDCloudGroupChange *)self cloudGroup];
  [v8 cloudRecordWithObjectID:v7 completionHandler:v6];
}

- (id)cloudRecordWithObjectID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HMDCloudGroupChange *)self changeWithObjectID:v4];
    id v6 = [v5 cloudRecord];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(HMDCloudGroupChange *)self cachedCloudRecordWithObjectID:v4];
    }
    int v13 = v8;
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1D9452090]();
    uint64_t v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@ObjectID not specified", (uint8_t *)&v15, 0xCu);
    }
    int v13 = 0;
  }

  return v13;
}

- (HMDCloudGroupChange)changeWithObjectID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HMDCloudGroupChange *)self cloudChangeTree];
    id v6 = [v5 objectForUUID:v4];

    id v7 = [v6 change];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      int v14 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@ObjectID not specified", (uint8_t *)&v13, 0xCu);
    }
    id v7 = 0;
  }

  return (HMDCloudGroupChange *)v7;
}

- (BOOL)hasValidChanges
{
  v2 = [(HMDCloudGroupChange *)self cloudChangeTree];
  char v3 = [v2 hasValidChanges];

  return v3;
}

- (NSArray)processedTransactionStoreRowIDs
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(HMDCloudGroupChange *)self processedCloudChanges];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) rowIDs];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [v3 allObjects];

  return (NSArray *)v10;
}

- (NSArray)allTransactionStoreRowIDs
{
  v2 = [(HMDCloudGroupChange *)self cloudChangeTree];
  char v3 = [v2 allTransactionStoreRowIDs];

  return (NSArray *)v3;
}

- (id)description
{
  char v3 = NSString;
  id v4 = [(HMDCloudGroupChange *)self shortDescription];
  uint64_t v5 = [(HMDCloudGroupChange *)self cloudChanges];
  uint64_t v6 = [(HMDCloudGroupChange *)self processingCloudChanges];
  uint64_t v7 = [(HMDCloudGroupChange *)self processedCloudChanges];
  id v8 = [v3 stringWithFormat:@"<%@, Pending = %@, Processing = %@, Processed = %@>", v4, v5, v6, v7];

  return v8;
}

- (id)shortDescription
{
  char v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  uint64_t v5 = [(HMDCloudGroupChange *)self cloudGroup];
  uint64_t v6 = [v5 shortDescription];
  uint64_t v7 = [v3 stringWithFormat:@"%@ Group = <%@>", v4, v6];

  return v7;
}

- (HMDCloudGroupChange)initWithGroup:(id)a3 temporaryCache:(BOOL)a4 metricsDispatcher:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    uint64_t v10 = v9;
    v34.receiver = self;
    v34.super_class = (Class)HMDCloudGroupChange;
    id v11 = [(HMDCloudGroupChange *)&v34 init];
    long long v12 = v11;
    if (v11)
    {
      objc_storeWeak((id *)&v11->_cloudGroup, v8);
      v12->_temporaryCache = a4;
      objc_storeStrong((id *)&v12->_metricsDispatcher, a5);
      long long v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
      long long v14 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"];
      if (v14) {
        [v13 addObject:v14];
      }
      id v15 = objc_alloc(MEMORY[0x1E4F29128]);
      uint64_t v16 = [v8 cloudZone];
      uint64_t v17 = [v16 zone];
      __int16 v18 = [v17 zoneID];
      id v19 = [v18 zoneName];
      uint64_t v20 = (void *)[v15 initWithUUIDString:v19];

      if (v20) {
        [v13 addObject:v20];
      }
      int v21 = [[HMDCloudChangeTree alloc] initWithRootUUIDs:v13];
      cloudChangeTree = v12->_cloudChangeTree;
      v12->_cloudChangeTree = v21;

      uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
      cloudChanges = v12->_cloudChanges;
      v12->_cloudChanges = (NSMutableArray *)v23;

      uint64_t v25 = [MEMORY[0x1E4F1CA48] array];
      processingCloudChanges = v12->_processingCloudChanges;
      v12->_processingCloudChanges = (NSMutableArray *)v25;

      uint64_t v27 = [MEMORY[0x1E4F1CA48] array];
      processedCloudChanges = v12->_processedCloudChanges;
      v12->_processedCloudChanges = (NSMutableArray *)v27;
    }
    return v12;
  }
  else
  {
    v30 = (HMDCloudGroupChange *)_HMFPreconditionFailure();
    return [(HMDCloudGroupChange *)v30 initWithGroup:v32 temporaryCache:v33];
  }
}

- (HMDCloudGroupChange)initWithGroup:(id)a3 temporaryCache:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [HMDCloudManagerMetricsDispatcher alloc];
  id v8 = +[HMDMetricsManager sharedLogEventSubmitter];
  id v9 = [(HMDCloudManagerMetricsDispatcher *)v7 initWithLogEventDispatcher:v8];

  uint64_t v10 = [(HMDCloudGroupChange *)self initWithGroup:v6 temporaryCache:v4 metricsDispatcher:v9];
  return v10;
}

- (HMDCloudGroupChange)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  BOOL v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end