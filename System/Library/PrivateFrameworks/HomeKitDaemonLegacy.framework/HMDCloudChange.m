@interface HMDCloudChange
+ (id)shortDescription;
- (BOOL)isAdded;
- (BOOL)isDeleted;
- (BOOL)isDropAfterApply;
- (BOOL)isDropAndDoNotApply;
- (BOOL)isDropStagedAfterApply;
- (BOOL)isInvalid;
- (BOOL)isPushAfterApply;
- (BOOL)isUpdated;
- (CKRecord)record;
- (CKRecordID)recordID;
- (HMDBackingStoreModelObject)objectChange;
- (HMDCloudChange)init;
- (HMDCloudChange)initWithCloudObjectRecord:(id)a3;
- (HMDCloudChange)initWithObjectChange:(id)a3;
- (HMDCloudRecord)cloudRecord;
- (HMDCloudRecord)deletedCloudRecord;
- (NSArray)rowIDs;
- (NSMutableSet)rowIDsSet;
- (NSSet)dependentUUIDs;
- (NSString)description;
- (NSString)recordName;
- (NSString)type;
- (NSUUID)objectID;
- (NSUUID)parentObjectID;
- (NSUUID)parentUuid;
- (NSUUID)uuid;
- (id)_initWithObjectChange:(id)a3 cloudObjectRecord:(id)a4;
- (id)shortDescription;
- (unint64_t)applyType;
- (unint64_t)changeType;
- (void)forceChangeToDelete;
- (void)forceChangeToInvalid;
- (void)replayChange:(id)a3 stagedChange:(id)a4;
- (void)resetRecord;
- (void)setApplyType:(unint64_t)a3;
- (void)setChangeType:(unint64_t)a3;
- (void)setObjectChange:(id)a3;
- (void)updateChangeWithRecord:(id)a3;
- (void)updateCloudRecord:(id)a3;
- (void)updateDeletedCloudRecord:(id)a3;
- (void)updateWithObjectChange:(id)a3;
@end

@implementation HMDCloudChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowIDsSet, 0);
  objc_storeStrong((id *)&self->_deletedCloudRecord, 0);
  objc_storeStrong((id *)&self->_cloudRecord, 0);
  objc_storeStrong((id *)&self->_objectChange, 0);
}

- (NSMutableSet)rowIDsSet
{
  return self->_rowIDsSet;
}

- (void)setApplyType:(unint64_t)a3
{
  self->_applyType = a3;
}

- (unint64_t)applyType
{
  return self->_applyType;
}

- (void)setChangeType:(unint64_t)a3
{
  self->_changeType = a3;
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (HMDCloudRecord)deletedCloudRecord
{
  return self->_deletedCloudRecord;
}

- (HMDCloudRecord)cloudRecord
{
  return self->_cloudRecord;
}

- (void)setObjectChange:(id)a3
{
}

- (HMDBackingStoreModelObject)objectChange
{
  return self->_objectChange;
}

- (void)replayChange:(id)a3 stagedChange:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [(HMDCloudChange *)self objectChange];
    char v9 = [v8 isReplayable];

    if (v9)
    {
      if ([(HMDCloudChange *)self isAdded] || [(HMDCloudChange *)self isUpdated])
      {
        if ([v7 isDeleted])
        {
          if ([(HMDCloudChange *)self isDeleted])
          {
            v10 = self;
            uint64_t v11 = 2;
          }
          else
          {
            v10 = self;
            uint64_t v11 = 1;
          }
          goto LABEL_9;
        }
        v12 = [(HMDCloudChange *)self objectChange];
        if (v6)
        {
          v13 = [v6 objectChange];
          id v41 = 0;
          [v12 diff:v13 differingFields:&v41];
          id v14 = v41;

          if ([v14 count])
          {
            v15 = (void *)MEMORY[0x1D9452090]();
            v16 = self;
            v17 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              v18 = HMFGetLogIdentifier();
              v19 = [v6 objectChange];
              *(_DWORD *)buf = 138543874;
              v43 = v18;
              __int16 v44 = 2112;
              id v45 = v19;
              __int16 v46 = 2112;
              id v47 = v14;
              _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Must replay change from cloud: object %@ has diff %@", buf, 0x20u);
            }
            v20 = [(HMDCloudChange *)v16 objectChange];
            v21 = [v6 objectChange];
            v22 = [v20 merge:v21];

            if (v22)
            {
              v23 = (void *)MEMORY[0x1D9452090]();
              v24 = v16;
              v25 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                v26 = HMFGetLogIdentifier();
                v27 = [v6 objectChange];
                *(_DWORD *)buf = 138543874;
                v43 = v26;
                __int16 v44 = 2112;
                id v45 = v27;
                __int16 v46 = 2112;
                id v47 = v22;
                _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to replay: object %@ with error %@", buf, 0x20u);
              }
              [(HMDCloudChange *)v24 setApplyType:2];
              v28 = [(HMDCloudChange *)v24 rowIDsSet];
              v29 = [v7 rowIDs];
              [v28 addObjectsFromArray:v29];
            }
            else
            {
              [(HMDCloudChange *)v16 setApplyType:3];
            }

            goto LABEL_30;
          }
        }
        else
        {
          v35 = [v7 objectChange];
          id v40 = 0;
          [v12 diff:v35 differingFields:&v40];
          id v14 = v40;

          if ([v14 count])
          {
            v36 = (void *)MEMORY[0x1D9452090]();
            v37 = self;
            v38 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              v39 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v43 = v39;
              __int16 v44 = 2112;
              id v45 = v7;
              __int16 v46 = 2112;
              id v47 = v14;
              _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_INFO, "%{public}@Change from cloud: object %@ has diff %@", buf, 0x20u);
            }
          }
        }
        [(HMDCloudChange *)self setApplyType:3];
LABEL_30:

        goto LABEL_31;
      }
      v30 = (void *)MEMORY[0x1D9452090]();
      self = self;
      v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v43 = v32;
        __int16 v44 = 2112;
        id v45 = v7;
        _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Change cannot be process further, dropping changes %@", buf, 0x16u);
      }
    }
    [(HMDCloudChange *)self setApplyType:2];
    v33 = [(HMDCloudChange *)self rowIDsSet];
    v34 = [v7 rowIDs];
    [v33 addObjectsFromArray:v34];

    goto LABEL_31;
  }
  v10 = self;
  uint64_t v11 = 0;
LABEL_9:
  [(HMDCloudChange *)v10 setApplyType:v11];
LABEL_31:
}

- (void)resetRecord
{
  id v2 = [(HMDCloudChange *)self cloudRecord];
  [v2 setRecord:0];
}

- (void)updateChangeWithRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudChange *)self cloudRecord];
  [v5 setRecord:v4];
}

- (CKRecordID)recordID
{
  id v2 = [(HMDCloudChange *)self cloudRecord];
  v3 = [v2 recordID];

  return (CKRecordID *)v3;
}

- (NSString)type
{
  id v2 = [(HMDCloudChange *)self objectChange];
  v3 = [v2 bsoType];

  return (NSString *)v3;
}

- (NSString)recordName
{
  id v2 = [(HMDCloudChange *)self cloudRecord];
  v3 = [v2 recordName];

  return (NSString *)v3;
}

- (CKRecord)record
{
  v3 = [(HMDCloudChange *)self cloudRecord];

  if (v3
    && ([(HMDCloudChange *)self cloudRecord],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [(HMDCloudChange *)self objectChange],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v4 encodeObjectChange:v5],
        v5,
        v4,
        v6))
  {
    id v7 = [(HMDCloudChange *)self cloudRecord];
    v8 = [v7 record];
  }
  else
  {
    v8 = 0;
  }
  return (CKRecord *)v8;
}

- (void)updateWithObjectChange:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectChangeType];
  int v6 = 0;
  int v7 = 1;
  switch(v5)
  {
    case 0:
      int v7 = 0;
      int v6 = 0;
      uint64_t v5 = 2;
      break;
    case 1:
      break;
    case 2:
      int v7 = 0;
      int v6 = 0;
      break;
    case 3:
      int v7 = 0;
      int v6 = 1;
      break;
    default:
      int v7 = 0;
      int v6 = 0;
      uint64_t v5 = 0;
      break;
  }
  if (![(HMDCloudChange *)self isAdded] && ![(HMDCloudChange *)self isUpdated])
  {
    if ([(HMDCloudChange *)self isDeleted])
    {
      switch(v5)
      {
        case 3:
          v17 = (void *)MEMORY[0x1D9452090]();
          v18 = self;
          v19 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            goto LABEL_42;
          }
          v20 = HMFGetLogIdentifier();
          *(_DWORD *)v34 = 138543618;
          *(void *)&v34[4] = v20;
          *(_WORD *)&v34[12] = 2112;
          *(void *)&v34[14] = v4;
          v21 = "%{public}@Object is already deleted, dropping delete %@";
          break;
        case 2:
          v17 = (void *)MEMORY[0x1D9452090]();
          v18 = self;
          v19 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            goto LABEL_42;
          }
          v20 = HMFGetLogIdentifier();
          *(_DWORD *)v34 = 138543618;
          *(void *)&v34[4] = v20;
          *(_WORD *)&v34[12] = 2112;
          *(void *)&v34[14] = v4;
          v21 = "%{public}@Retaining 'delete' change, cannot convert a delete to an update, %@";
          break;
        case 1:
          uint64_t v11 = self;
          uint64_t v12 = 1;
          goto LABEL_14;
        default:
          v13 = (void *)MEMORY[0x1D9452090]();
          id v14 = self;
          v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            goto LABEL_21;
          }
          goto LABEL_22;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1D9452090]();
      v18 = self;
      v19 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        goto LABEL_42;
      }
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)v34 = 138543618;
      *(void *)&v34[4] = v20;
      *(_WORD *)&v34[12] = 2112;
      *(void *)&v34[14] = v4;
      v21 = "%{public}@Change has already be invalidated, dropping further changes %@";
    }
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, v21, v34, 0x16u);
    goto LABEL_41;
  }
  if ((unint64_t)(v5 - 1) > 1)
  {
    if (v6)
    {
      uint64_t v11 = self;
      uint64_t v12 = 3;
LABEL_14:
      [(HMDCloudChange *)v11 setChangeType:v12];
      [(HMDCloudChange *)self setObjectChange:v4];
      goto LABEL_43;
    }
    v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_21:
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)v34 = 138543618;
      *(void *)&v34[4] = v16;
      *(_WORD *)&v34[12] = 2112;
      *(void *)&v34[14] = v4;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Invalidating change because object change in unknown type, %@", v34, 0x16u);
    }
LABEL_22:

    [(HMDCloudChange *)v14 setChangeType:0];
    goto LABEL_43;
  }
  v8 = [(HMDCloudChange *)self objectChange];

  if (v8)
  {
    char v9 = [(HMDCloudChange *)self objectChange];
    v10 = [v9 merge:v4];

    if (!v10) {
      goto LABEL_33;
    }
LABEL_30:
    v26 = (void *)MEMORY[0x1D9452090]();
    v27 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      *(_DWORD *)v34 = 138543618;
      *(void *)&v34[4] = v29;
      *(_WORD *)&v34[12] = 2112;
      *(void *)&v34[14] = v10;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Invalidating change because merge object change fail with error %@", v34, 0x16u);
    }
    [(HMDCloudChange *)v27 setChangeType:0];

    goto LABEL_43;
  }
  if (v7)
  {
    [(HMDCloudChange *)self setObjectChange:v4];
    goto LABEL_33;
  }
  v22 = (void *)MEMORY[0x1D9452090]();
  v23 = self;
  v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v25 = HMFGetLogIdentifier();
    *(_DWORD *)v34 = 138543362;
    *(void *)&v34[4] = v25;
    _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Cannot merge updated change into an add because object change does not exist", v34, 0xCu);
  }
  v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
  if (v10) {
    goto LABEL_30;
  }
LABEL_33:
  if ((v7 & [(HMDCloudChange *)self isUpdated]) == 1)
  {
    v30 = [(HMDCloudChange *)self objectChange];
    [v30 setObjectChangeType:1];

    v17 = (void *)MEMORY[0x1D9452090]([(HMDCloudChange *)self setChangeType:1]);
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      v31 = [(HMDCloudChange *)v18 objectChange];
      *(_DWORD *)v34 = 138543618;
      *(void *)&v34[4] = v20;
      *(_WORD *)&v34[12] = 2112;
      *(void *)&v34[14] = v31;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Changing update change back to an add %@", v34, 0x16u);

LABEL_41:
    }
LABEL_42:
  }
LABEL_43:
  v32 = [(HMDCloudChange *)self rowIDsSet];
  v33 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "bsoLogRowID"));
  [v32 addObject:v33];
}

- (void)updateDeletedCloudRecord:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_deletedCloudRecord, a3);
  }
  else
  {
    int v6 = (void *)MEMORY[0x1D9452090]();
    int v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      char v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Cannot update deleted cloud record without cloudRecord", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)updateCloudRecord:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_cloudRecord, a3);
    if (![(HMDCloudChange *)self isDeleted])
    {
      int v6 = [v5 extractObjectChange];
      if (v6)
      {
        int v7 = [(HMDCloudChange *)self objectChange];
        int v8 = [(HMDCloudChange *)v6 diff:v7 differingFields:0];

        if (v8)
        {
          char v9 = [(HMDCloudChange *)self objectChange];
          int v10 = [(HMDCloudChange *)v6 merge:v9];

          if (v10)
          {
            uint64_t v11 = (void *)MEMORY[0x1D9452090]();
            uint64_t v12 = self;
            v13 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              id v14 = HMFGetLogIdentifier();
              int v31 = 138543618;
              v32 = v14;
              __int16 v33 = 2112;
              v34 = v10;
              _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Invalidating change, merge object change with cached object change fail with error %@", (uint8_t *)&v31, 0x16u);
            }
            v15 = [(HMDCloudChange *)v12 objectChange];
            -[HMDCloudChange setObjectChangeType:](v6, "setObjectChangeType:", [v15 objectChangeType]);

            [(HMDCloudChange *)v12 setObjectChange:v6];
            [(HMDCloudChange *)v12 setChangeType:0];
          }
          else
          {
            v30 = [(HMDCloudChange *)self objectChange];
            -[HMDCloudChange setObjectChangeType:](v6, "setObjectChangeType:", [v30 objectChangeType]);

            [(HMDCloudChange *)self setObjectChange:v6];
          }

          goto LABEL_22;
        }
        v25 = (void *)MEMORY[0x1D9452090]();
        v26 = self;
        v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v28 = HMFGetLogIdentifier();
          int v31 = 138543618;
          v32 = v28;
          __int16 v33 = 2112;
          v34 = v6;
          _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Local changes will not modify cloud record, dropping local changes: %@", (uint8_t *)&v31, 0x16u);
        }
        v29 = [(HMDCloudChange *)v26 objectChange];
        -[HMDCloudChange setObjectChangeType:](v6, "setObjectChangeType:", [v29 objectChangeType]);

        [(HMDCloudChange *)v26 setObjectChange:v6];
        v24 = v26;
      }
      else
      {
        if ([(HMDCloudChange *)self isAdded])
        {
LABEL_22:

          goto LABEL_23;
        }
        v20 = (void *)MEMORY[0x1D9452090]();
        v21 = self;
        v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = HMFGetLogIdentifier();
          int v31 = 138543618;
          v32 = v23;
          __int16 v33 = 2112;
          v34 = v21;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Invalidating change, cannot add a new record unless the change type is added, %@", (uint8_t *)&v31, 0x16u);
        }
        v24 = v21;
      }
      [(HMDCloudChange *)v24 setChangeType:0];
      goto LABEL_22;
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1D9452090]();
    v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      int v31 = 138543362;
      v32 = v19;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot update cloud record without cloudRecord", (uint8_t *)&v31, 0xCu);
    }
  }
LABEL_23:
}

- (void)forceChangeToInvalid
{
}

- (void)forceChangeToDelete
{
  [(HMDCloudChange *)self setChangeType:3];
  v3 = [(HMDCloudChange *)self objectChange];
  if (v3)
  {
    id v8 = v3;
    id v4 = objc_alloc((Class)objc_opt_class());
    id v5 = [v8 uuid];
    int v6 = [v8 parentUUID];
    int v7 = (void *)[v4 initWithObjectChangeType:3 uuid:v5 parentUUID:v6];

    [(HMDCloudChange *)self setObjectChange:v7];
    v3 = v8;
  }
}

- (NSArray)rowIDs
{
  id v2 = [(HMDCloudChange *)self rowIDsSet];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (BOOL)isPushAfterApply
{
  return [(HMDCloudChange *)self applyType] == 3;
}

- (BOOL)isDropStagedAfterApply
{
  return [(HMDCloudChange *)self applyType] == 2;
}

- (BOOL)isDropAfterApply
{
  return [(HMDCloudChange *)self applyType] == 0;
}

- (BOOL)isDropAndDoNotApply
{
  return [(HMDCloudChange *)self applyType] == 1;
}

- (BOOL)isInvalid
{
  return [(HMDCloudChange *)self changeType] == 0;
}

- (BOOL)isDeleted
{
  return [(HMDCloudChange *)self changeType] == 3;
}

- (BOOL)isUpdated
{
  return [(HMDCloudChange *)self changeType] == 2;
}

- (BOOL)isAdded
{
  return [(HMDCloudChange *)self changeType] == 1;
}

- (NSUUID)uuid
{
  id v2 = [(HMDCloudChange *)self objectChange];
  v3 = [v2 uuid];

  return (NSUUID *)v3;
}

- (NSUUID)objectID
{
  id v2 = [(HMDCloudChange *)self objectChange];
  v3 = [v2 uuid];

  return (NSUUID *)v3;
}

- (NSUUID)parentUuid
{
  id v2 = [(HMDCloudChange *)self objectChange];
  v3 = [v2 parentUUID];

  return (NSUUID *)v3;
}

- (NSUUID)parentObjectID
{
  id v2 = [(HMDCloudChange *)self objectChange];
  v3 = [v2 parentUUID];

  return (NSUUID *)v3;
}

- (NSSet)dependentUUIDs
{
  id v2 = [(HMDCloudChange *)self objectChange];
  v3 = [v2 dependentUUIDs];

  return (NSSet *)v3;
}

- (NSString)description
{
  id v2 = NSString;
  v3 = [(HMDCloudChange *)self shortDescription];
  id v4 = [v2 stringWithFormat:@"<%@>", v3];

  return (NSString *)v4;
}

- (id)shortDescription
{
  v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  unint64_t v5 = [(HMDCloudChange *)self changeType];
  if (v5 > 3) {
    int v6 = @"unknown";
  }
  else {
    int v6 = off_1E6A10408[v5];
  }
  int v7 = [(HMDCloudChange *)self cloudRecord];
  id v8 = [v3 stringWithFormat:@"%@, Type = %@, Cloud Record = %@", v4, v6, v7];

  return v8;
}

- (HMDCloudChange)initWithCloudObjectRecord:(id)a3
{
  return (HMDCloudChange *)[(HMDCloudChange *)self _initWithObjectChange:0 cloudObjectRecord:a3];
}

- (HMDCloudChange)initWithObjectChange:(id)a3
{
  return (HMDCloudChange *)[(HMDCloudChange *)self _initWithObjectChange:a3 cloudObjectRecord:0];
}

- (id)_initWithObjectChange:(id)a3 cloudObjectRecord:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if ((v6 == 0) != (v7 != 0))
  {
    char v9 = (void *)MEMORY[0x1D9452090]();
    int v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Either objectChange or cloudObjectRecord must be specified, not both", buf, 0xCu);
    }

LABEL_13:
    v19 = 0;
    goto LABEL_19;
  }
  if (v7)
  {
    uint64_t v13 = [v7 extractObjectChange];

    id v6 = (id)v13;
  }
  if (!v6)
  {
    v16 = (void *)MEMORY[0x1D9452090]();
    int v10 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v29 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Could not create the object change for the given record", buf, 0xCu);
    }
    goto LABEL_13;
  }
  unint64_t v14 = [v6 objectChangeType];
  if (v14 > 3) {
    unint64_t v15 = 0;
  }
  else {
    unint64_t v15 = qword_1D54D3F80[v14];
  }
  v27.receiver = self;
  v27.super_class = (Class)HMDCloudChange;
  v20 = [(HMDCloudChange *)&v27 init];
  v21 = v20;
  if (v20)
  {
    v20->_changeType = v15;
    objc_storeStrong((id *)&v20->_cloudRecord, a4);
    uint64_t v22 = [MEMORY[0x1E4F1CA80] set];
    rowIDsSet = v21->_rowIDsSet;
    v21->_rowIDsSet = (NSMutableSet *)v22;

    objc_storeStrong((id *)&v21->_objectChange, v6);
    if (!v8)
    {
      v24 = [(HMDCloudChange *)v21 rowIDsSet];
      v25 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "bsoLogRowID"));
      [v24 addObject:v25];
    }
  }
  int v10 = v21;

  v19 = v10;
LABEL_19:

  return v19;
}

- (HMDCloudChange)init
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  unint64_t v5 = NSStringFromSelector(a2);
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