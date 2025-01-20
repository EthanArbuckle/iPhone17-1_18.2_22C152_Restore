@interface HMBCloudZoneRecordPushResult
- (HMBCloudZoneRecordPushResult)initWithUpdatedRecords:(id)a3 deletedRecordIDs:(id)a4 conflicts:(id)a5 fatalError:(id)a6;
- (HMBCloudZoneRecordPushResult)initWithUpdatedRecords:(id)a3 deletedRecordIDs:(id)a4 error:(id)a5;
- (NSError)fatalError;
- (NSSet)conflicts;
- (NSSet)deletedRecordIDs;
- (NSSet)updatedRecords;
- (id)pushResultByMergingWithPushResult:(id)a3;
@end

@implementation HMBCloudZoneRecordPushResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fatalError, 0);
  objc_storeStrong((id *)&self->_conflicts, 0);
  objc_storeStrong((id *)&self->_deletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_updatedRecords, 0);
}

- (NSError)fatalError
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (NSSet)conflicts
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)deletedRecordIDs
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)updatedRecords
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (id)pushResultByMergingWithPushResult:(id)a3
{
  id v4 = a3;
  v5 = [(HMBCloudZoneRecordPushResult *)self updatedRecords];
  v6 = [v4 updatedRecords];
  v7 = [v5 setByAddingObjectsFromSet:v6];

  v8 = [(HMBCloudZoneRecordPushResult *)self deletedRecordIDs];
  v9 = [v4 deletedRecordIDs];
  v10 = [v8 setByAddingObjectsFromSet:v9];

  v11 = [(HMBCloudZoneRecordPushResult *)self conflicts];
  v12 = [v4 conflicts];
  v13 = [v11 setByAddingObjectsFromSet:v12];

  v14 = [HMBCloudZoneRecordPushResult alloc];
  v15 = [(HMBCloudZoneRecordPushResult *)self fatalError];
  if (v15)
  {
    v16 = [(HMBCloudZoneRecordPushResult *)v14 initWithUpdatedRecords:v7 deletedRecordIDs:v10 conflicts:v13 fatalError:v15];
  }
  else
  {
    v17 = [v4 fatalError];
    v16 = [(HMBCloudZoneRecordPushResult *)v14 initWithUpdatedRecords:v7 deletedRecordIDs:v10 conflicts:v13 fatalError:v17];
  }
  return v16;
}

- (HMBCloudZoneRecordPushResult)initWithUpdatedRecords:(id)a3 deletedRecordIDs:(id)a4 conflicts:(id)a5 fatalError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v11)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    v25 = (HMBCloudZoneRecordPushResult *)_HMFPreconditionFailure();
    return [(HMBCloudZoneRecordPushResult *)v25 initWithUpdatedRecords:v27 deletedRecordIDs:v28 error:v29];
  }
  v14 = v13;
  v30.receiver = self;
  v30.super_class = (Class)HMBCloudZoneRecordPushResult;
  v15 = [(HMBCloudZoneRecordPushResult *)&v30 init];
  if (v15)
  {
    uint64_t v16 = [v10 copy];
    updatedRecords = v15->_updatedRecords;
    v15->_updatedRecords = (NSSet *)v16;

    uint64_t v18 = [v11 copy];
    deletedRecordIDs = v15->_deletedRecordIDs;
    v15->_deletedRecordIDs = (NSSet *)v18;

    uint64_t v20 = [v12 copy];
    conflicts = v15->_conflicts;
    v15->_conflicts = (NSSet *)v20;

    uint64_t v22 = [v14 copy];
    fatalError = v15->_fatalError;
    v15->_fatalError = (NSError *)v22;
  }
  return v15;
}

- (HMBCloudZoneRecordPushResult)initWithUpdatedRecords:(id)a3 deletedRecordIDs:(id)a4 error:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F1CA80] set];
  id v12 = [v10 userInfo];
  id v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  if (v15)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      id v35 = v8;
      v36 = self;
      v33 = v10;
      id v34 = v9;
      uint64_t v19 = *(void *)v38;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v38 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v22 = objc_msgSend(v16, "objectForKeyedSubscript:", v21, v33);
          if ([v22 code] != 22)
          {
            v23 = [[HMBCloudZoneRecordPushConflict alloc] initWithRecordID:v21 error:v22];
            if (!v23)
            {
              SEL v26 = (void *)MEMORY[0x1D944CB30]();
              id v27 = v36;
              id v28 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                id v29 = HMFGetLogIdentifier();
                objc_super v30 = [v21 hmbDescription];
                *(_DWORD *)buf = 138543874;
                v42 = v29;
                __int16 v43 = 2112;
                v44 = v30;
                __int16 v45 = 2112;
                v46 = v22;
                _os_log_impl(&dword_1D4693000, v28, OS_LOG_TYPE_ERROR, "%{public}@Found fatal partial error for recordID %@: %@", buf, 0x20u);
              }
              id v10 = v33;
              id v25 = v33;
              [v11 removeAllObjects];

              id v9 = v34;
              id v8 = v35;
              goto LABEL_20;
            }
            v24 = v23;
            [v11 addObject:v23];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v47 count:16];
        if (v18) {
          continue;
        }
        break;
      }
      id v25 = 0;
      id v8 = v35;
      id v10 = v33;
LABEL_20:
      self = v36;
    }
    else
    {
      id v25 = 0;
    }
  }
  else
  {
    id v25 = v10;
  }
  v31 = [(HMBCloudZoneRecordPushResult *)self initWithUpdatedRecords:v8 deletedRecordIDs:v9 conflicts:v11 fatalError:v25];

  return v31;
}

@end