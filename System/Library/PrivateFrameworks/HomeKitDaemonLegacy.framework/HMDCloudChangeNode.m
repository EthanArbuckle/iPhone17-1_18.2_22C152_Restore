@interface HMDCloudChangeNode
+ (id)shortDescription;
- (BOOL)forceDelete;
- (BOOL)orphaned;
- (HMDCloudChange)change;
- (HMDCloudChangeNode)init;
- (HMDCloudChangeNode)initWithChange:(id)a3;
- (HMDCloudChangeNode)initWithCloudRecord:(id)a3;
- (HMDCloudChangeNode)initWithModel:(id)a3;
- (HMDCloudChangeNode)initWithRecordMapping:(id)a3;
- (HMDCloudChangeNode)parent;
- (NSMapTable)children;
- (NSString)recordName;
- (NSString)type;
- (NSUUID)parentUuid;
- (NSUUID)uuid;
- (id)_allNodesInBranch;
- (id)_initWithUUID:(id)a3 parentUUID:(id)a4 recordName:(id)a5 type:(id)a6 change:(id)a7;
- (id)description;
- (id)shortDescription;
- (void)_markBranchOrphaned;
- (void)_updateWithChange:(id)a3;
- (void)_updateWithCloudRecord:(id)a3;
- (void)_updateWithModel:(id)a3;
- (void)addChild:(id)a3;
- (void)deleteChildren;
- (void)logChangeTreeWithIndent:(id)a3;
- (void)removeChild:(id)a3;
- (void)setChange:(id)a3;
- (void)setChildren:(id)a3;
- (void)setParent:(id)a3;
- (void)setParentUuid:(id)a3;
- (void)setRecordName:(id)a3;
- (void)setType:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateRecordMapping:(id)a3;
@end

@implementation HMDCloudChangeNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_change, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_parentUuid, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
}

- (void)setChildren:(id)a3
{
}

- (NSMapTable)children
{
  return self->_children;
}

- (void)setChange:(id)a3
{
}

- (HMDCloudChange)change
{
  return self->_change;
}

- (void)setParent:(id)a3
{
}

- (HMDCloudChangeNode)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (HMDCloudChangeNode *)WeakRetained;
}

- (BOOL)orphaned
{
  return self->_orphaned;
}

- (BOOL)forceDelete
{
  return self->_forceDelete;
}

- (void)setType:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setParentUuid:(id)a3
{
}

- (NSUUID)parentUuid
{
  return self->_parentUuid;
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setRecordName:(id)a3
{
}

- (NSString)recordName
{
  return self->_recordName;
}

- (void)_markBranchOrphaned
{
  self->_orphaned = 1;
  v3 = [(HMDCloudChangeNode *)self children];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(HMDCloudChangeNode *)self children];
    id v9 = [v5 objectEnumerator];

    uint64_t v6 = [v9 nextObject];
    if (v6)
    {
      v7 = (void *)v6;
      do
      {
        [v7 _markBranchOrphaned];
        uint64_t v8 = [v9 nextObject];

        v7 = (void *)v8;
      }
      while (v8);
    }
  }
}

- (id)_allNodesInBranch
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v4 = [(HMDCloudChangeNode *)self uuid];
  [v3 addObject:v4];

  v5 = [(HMDCloudChangeNode *)self children];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v7 = [(HMDCloudChangeNode *)self children];
    uint64_t v8 = [v7 objectEnumerator];

    uint64_t v9 = [v8 nextObject];
    if (v9)
    {
      v10 = (void *)v9;
      do
      {
        v11 = [v10 _allNodesInBranch];
        [v3 addObjectsFromArray:v11];

        uint64_t v12 = [v8 nextObject];

        v10 = (void *)v12;
      }
      while (v12);
    }
  }
  v13 = [v3 allObjects];

  return v13;
}

- (void)deleteChildren
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (![(HMDCloudChangeNode *)self forceDelete])
  {
    v3 = (void *)MEMORY[0x1D9452090]();
    uint64_t v4 = self;
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      v7 = [(HMDCloudChangeNode *)v4 shortDescription];
      int v20 = 138543618;
      v21 = v6;
      __int16 v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Deleting children objects %@", (uint8_t *)&v20, 0x16u);
    }
    v4->_forceDelete = 1;
    uint64_t v8 = [(HMDCloudChangeNode *)v4 change];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      v10 = [(HMDCloudChangeNode *)v4 change];
      char v11 = [v10 isDeleted];

      if ((v11 & 1) == 0)
      {
        uint64_t v12 = [(HMDCloudChangeNode *)v4 change];
        [v12 forceChangeToDelete];
      }
    }
    v13 = [(HMDCloudChangeNode *)v4 children];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      v15 = [(HMDCloudChangeNode *)v4 children];
      v16 = [v15 objectEnumerator];

      uint64_t v17 = [v16 nextObject];
      if (v17)
      {
        v18 = (void *)v17;
        do
        {
          [v18 deleteChildren];
          uint64_t v19 = [v16 nextObject];

          v18 = (void *)v19;
        }
        while (v19);
      }
    }
  }
}

- (void)_updateWithCloudRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 recordName];
  [(HMDCloudChangeNode *)self setRecordName:v5];

  uint64_t v6 = [(HMDCloudChangeNode *)self change];

  if (v6)
  {
    id v8 = [(HMDCloudChangeNode *)self change];
    [v8 updateCloudRecord:v4];
  }
  else
  {
    v7 = [[HMDCloudChange alloc] initWithCloudObjectRecord:v4];

    [(HMDCloudChangeNode *)self setChange:v7];
    if (![(HMDCloudChangeNode *)self forceDelete]) {
      return;
    }
    id v8 = [(HMDCloudChangeNode *)self change];
    [v8 forceChangeToDelete];
  }
}

- (void)_updateWithChange:(id)a3
{
  [(HMDCloudChangeNode *)self setChange:a3];
  if ([(HMDCloudChangeNode *)self forceDelete])
  {
    v3 = [(HMDCloudChangeNode *)self change];
    [v3 forceChangeToDelete];
  }
  v5 = [(HMDCloudChangeNode *)self uuid];
  if (!v5)
  {
    v3 = [(HMDCloudChangeNode *)self change];
    v10 = [v3 objectID];
    if (v10)
    {

      goto LABEL_10;
    }
  }
  uint64_t v6 = [(HMDCloudChangeNode *)self uuid];
  v7 = [(HMDCloudChangeNode *)self change];
  id v8 = [v7 objectID];
  int v9 = [v6 isEqual:v8];

  if (v5)
  {

    if (!v9) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  if (v9)
  {
LABEL_10:
    v3 = [(HMDCloudChangeNode *)self change];
    char v11 = [v3 objectID];
    [(HMDCloudChangeNode *)self setUuid:v11];
  }
LABEL_11:
  uint64_t v12 = [(HMDCloudChangeNode *)self parentUuid];
  if (!v12)
  {
    v3 = [(HMDCloudChangeNode *)self change];
    uint64_t v17 = [v3 parentObjectID];
    if (v17)
    {

      goto LABEL_18;
    }
  }
  v13 = [(HMDCloudChangeNode *)self parentUuid];
  uint64_t v14 = [(HMDCloudChangeNode *)self change];
  v15 = [v14 parentObjectID];
  int v16 = [v13 isEqual:v15];

  if (v12)
  {

    if (!v16) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }

  if (v16)
  {
LABEL_18:
    v3 = [(HMDCloudChangeNode *)self change];
    v18 = [v3 parentObjectID];
    [(HMDCloudChangeNode *)self setParentUuid:v18];
  }
LABEL_19:
  uint64_t v19 = [(HMDCloudChangeNode *)self recordName];
  if (v19
    || ([(HMDCloudChangeNode *)self change],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v3 recordName],
        (uint64_t v24 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v20 = [(HMDCloudChangeNode *)self recordName];
    v21 = [(HMDCloudChangeNode *)self change];
    __int16 v22 = [v21 recordName];
    int v23 = [v20 isEqual:v22];

    if (v19)
    {

      if (!v23) {
        return;
      }
    }
    else
    {

      if ((v23 & 1) == 0) {
        return;
      }
    }
  }
  else
  {
  }
  id v26 = [(HMDCloudChangeNode *)self change];
  v25 = [v26 recordName];
  [(HMDCloudChangeNode *)self setRecordName:v25];
}

- (void)_updateWithModel:(id)a3
{
  id v22 = a3;
  id v4 = [(HMDCloudChangeNode *)self change];

  if (v4)
  {
    v5 = [(HMDCloudChangeNode *)self change];
    [(HMDCloudChange *)v5 updateWithObjectChange:v22];
  }
  else
  {
    v5 = [[HMDCloudChange alloc] initWithObjectChange:v22];
    [(HMDCloudChangeNode *)self setChange:v5];
  }

  uint64_t v6 = [(HMDCloudChangeNode *)self uuid];
  if (!v6)
  {
    v5 = [(HMDCloudChangeNode *)self change];
    char v11 = [(HMDCloudChange *)v5 objectID];
    if (v11)
    {

      goto LABEL_11;
    }
  }
  v7 = [(HMDCloudChangeNode *)self uuid];
  id v8 = [(HMDCloudChangeNode *)self change];
  int v9 = [v8 objectID];
  int v10 = [v7 isEqual:v9];

  if (v6)
  {

    if (!v10) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  if (v10)
  {
LABEL_11:
    v5 = [(HMDCloudChangeNode *)self change];
    uint64_t v12 = [(HMDCloudChange *)v5 objectID];
    [(HMDCloudChangeNode *)self setUuid:v12];
  }
LABEL_12:
  v13 = [(HMDCloudChangeNode *)self parentUuid];
  if (!v13)
  {
    v5 = [(HMDCloudChangeNode *)self change];
    v18 = [(HMDCloudChange *)v5 parentObjectID];
    if (v18)
    {

      goto LABEL_19;
    }
  }
  uint64_t v14 = [(HMDCloudChangeNode *)self parentUuid];
  v15 = [(HMDCloudChangeNode *)self change];
  int v16 = [v15 parentObjectID];
  int v17 = [v14 isEqual:v16];

  if (!v13)
  {

    if ((v17 & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

  if (v17)
  {
LABEL_19:
    uint64_t v19 = [(HMDCloudChangeNode *)self change];
    int v20 = [v19 parentObjectID];
    [(HMDCloudChangeNode *)self setParentUuid:v20];
  }
LABEL_20:
  v21 = [v22 bsoType];
  [(HMDCloudChangeNode *)self setType:v21];
}

- (void)updateRecordMapping:(id)a3
{
  id v28 = a3;
  uint64_t v4 = [v28 recordName];
  if (v4)
  {
    v5 = (void *)v4;
    uint64_t v6 = [(HMDCloudChangeNode *)self recordName];
    v7 = [v28 recordName];
    char v8 = HMFEqualObjects();

    if ((v8 & 1) == 0)
    {
      int v9 = [v28 recordName];
      [(HMDCloudChangeNode *)self setRecordName:v9];
    }
  }
  uint64_t v10 = [v28 uuid];
  if (v10)
  {
    char v11 = (void *)v10;
    uint64_t v12 = [(HMDCloudChangeNode *)self uuid];
    v13 = [v28 uuid];
    char v14 = HMFEqualObjects();

    if ((v14 & 1) == 0)
    {
      v15 = [v28 uuid];
      [(HMDCloudChangeNode *)self setUuid:v15];
    }
  }
  uint64_t v16 = [v28 parentUuid];
  if (v16)
  {
    int v17 = (void *)v16;
    v18 = [(HMDCloudChangeNode *)self parentUuid];
    uint64_t v19 = [v28 parentUuid];
    char v20 = HMFEqualObjects();

    if ((v20 & 1) == 0)
    {
      v21 = [v28 uuid];
      [(HMDCloudChangeNode *)self setUuid:v21];
    }
  }
  uint64_t v22 = [v28 type];
  if (v22)
  {
    int v23 = (void *)v22;
    uint64_t v24 = [(HMDCloudChangeNode *)self type];
    v25 = [v28 type];
    char v26 = HMFEqualObjects();

    if ((v26 & 1) == 0)
    {
      v27 = [v28 type];
      [(HMDCloudChangeNode *)self setType:v27];
    }
  }
}

- (void)removeChild:(id)a3
{
  id v4 = a3;
  [v4 setParent:0];
  id v6 = [(HMDCloudChangeNode *)self children];
  v5 = [v4 uuid];

  [v6 removeObjectForKey:v5];
}

- (void)addChild:(id)a3
{
  id v6 = a3;
  id v4 = [(HMDCloudChangeNode *)self children];
  v5 = [v6 uuid];
  [v4 setObject:v6 forKey:v5];

  [v6 setParent:self];
}

- (void)logChangeTreeWithIndent:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    char v8 = HMFGetLogIdentifier();
    int v9 = [(HMDCloudChangeNode *)v6 shortDescription];
    *(_DWORD *)buf = 138543874;
    int v17 = v8;
    __int16 v18 = 2112;
    id v19 = v4;
    __int16 v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@%@HMDCloudChangeNode<%@>:", buf, 0x20u);
  }
  uint64_t v10 = [NSString stringWithFormat:@"%@  ", v4];
  char v11 = [(HMDCloudChangeNode *)v6 children];
  uint64_t v12 = [v11 objectEnumerator];

  uint64_t v13 = [v12 nextObject];
  if (v13)
  {
    char v14 = (void *)v13;
    do
    {
      [v14 logChangeTreeWithIndent:v10];
      uint64_t v15 = [v12 nextObject];

      char v14 = (void *)v15;
    }
    while (v15);
  }
}

- (id)description
{
  v2 = NSString;
  v3 = [(HMDCloudChangeNode *)self shortDescription];
  id v4 = [v2 stringWithFormat:@"<%@>", v3];

  return v4;
}

- (id)shortDescription
{
  v3 = NSString;
  id v4 = [(HMDCloudChangeNode *)self type];
  v5 = [(HMDCloudChangeNode *)self uuid];
  id v6 = [v5 UUIDString];
  v7 = objc_msgSend(v6, "substringWithRange:", 0, 8);
  char v8 = [(HMDCloudChangeNode *)self recordName];
  int v9 = objc_msgSend(v8, "substringWithRange:", 0, 8);
  uint64_t v10 = [(HMDCloudChangeNode *)self change];
  char v11 = [v3 stringWithFormat:@"Type = %@ UUID = %@ Record Name = %@ Data = change=%d/forceDelete=%d", v4, v7, v9, v10 != 0, -[HMDCloudChangeNode forceDelete](self, "forceDelete")];

  return v11;
}

- (HMDCloudChangeNode)initWithCloudRecord:(id)a3
{
  id v4 = a3;
  v5 = [[HMDCloudChange alloc] initWithCloudObjectRecord:v4];

  id v6 = [(HMDCloudChangeNode *)self initWithChange:v5];
  return v6;
}

- (HMDCloudChangeNode)initWithChange:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectChange];
  id v6 = [v4 objectID];
  v7 = [v4 parentObjectID];
  char v8 = [v4 recordName];
  int v9 = [v5 bsoType];
  uint64_t v10 = [(HMDCloudChangeNode *)self _initWithUUID:v6 parentUUID:v7 recordName:v8 type:v9 change:v4];

  return v10;
}

- (HMDCloudChangeNode)initWithModel:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[HMDCloudChange alloc] initWithObjectChange:v4];
  id v6 = v5;
  if (v5)
  {
    v7 = [(HMDCloudChange *)v5 objectID];
    char v8 = [(HMDCloudChange *)v6 parentObjectID];
    int v9 = [(HMDCloudChange *)v6 recordName];
    uint64_t v10 = [v4 bsoType];
    char v11 = (HMDCloudChangeNode *)[(HMDCloudChangeNode *)self _initWithUUID:v7 parentUUID:v8 recordName:v9 type:v10 change:v6];

    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1D9452090]();
    char v11 = self;
    char v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v17 = 138543618;
      __int16 v18 = v15;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot create cloud change node from %@", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v12 = 0;
  }

  return v12;
}

- (HMDCloudChangeNode)initWithRecordMapping:(id)a3
{
  id v4 = a3;
  v5 = [v4 uuid];
  id v6 = [v4 parentUuid];
  v7 = [v4 recordName];
  char v8 = [v4 type];

  int v9 = [(HMDCloudChangeNode *)self _initWithUUID:v5 parentUUID:v6 recordName:v7 type:v8 change:0];
  return v9;
}

- (id)_initWithUUID:(id)a3 parentUUID:(id)a4 recordName:(id)a5 type:(id)a6 change:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)HMDCloudChangeNode;
  __int16 v18 = [(HMDCloudChangeNode *)&v25 init];
  __int16 v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_uuid, a3);
    objc_storeStrong((id *)&v19->_parentUuid, a4);
    objc_storeStrong((id *)&v19->_recordName, a5);
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v16);
    type = v19->_type;
    v19->_type = (NSString *)v20;

    objc_storeStrong((id *)&v19->_change, a7);
    uint64_t v22 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    children = v19->_children;
    v19->_children = (NSMapTable *)v22;
  }
  return v19;
}

- (HMDCloudChangeNode)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
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