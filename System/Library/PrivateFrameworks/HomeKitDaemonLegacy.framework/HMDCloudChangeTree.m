@interface HMDCloudChangeTree
+ (BOOL)modelTypeCanBeOrphaned:(id)a3;
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)hasValidChanges;
- (HMDCloudChangeTree)init;
- (HMDCloudChangeTree)initWithRootUUIDs:(id)a3;
- (NSArray)allTransactionStoreRowIDs;
- (NSArray)objectsWithPotentialChanges;
- (NSArray)orphans;
- (NSMapTable)branchMap;
- (NSMapTable)objectMap;
- (NSMapTable)recordMap;
- (NSMutableArray)cloudChanges;
- (NSMutableArray)invalidCloudChanges;
- (NSMutableArray)objects;
- (NSSet)validRootUUIDs;
- (id)_findNodeWithRecordMapping:(id)a3;
- (id)_objectForRecordName:(id)a3;
- (id)_objectForUUID:(id)a3;
- (id)description;
- (id)objectForRecordName:(id)a3;
- (id)objectForUUID:(id)a3;
- (id)recordMapWithFilter:(id)a3;
- (id)shortDescription;
- (void)_addNode:(id)a3;
- (void)_updateNode:(id)a3 oldRecordName:(id)a4;
- (void)findAndDeletedChildren;
- (void)findAndMarkOrphanedBranches;
- (void)logChangeTreeWithIndent:(id)a3;
- (void)removeNode:(id)a3;
- (void)setBranchMap:(id)a3;
- (void)setObjectMap:(id)a3;
- (void)setObjects:(id)a3;
- (void)setRecordMap:(id)a3;
- (void)setValidRootUUIDs:(id)a3;
- (void)updateChange:(id)a3;
- (void)updateModel:(id)a3;
- (void)updateNode:(id)a3 withCloudRecord:(id)a4;
- (void)updateRecordMapping:(id)a3;
@end

@implementation HMDCloudChangeTree

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validRootUUIDs, 0);
  objc_storeStrong((id *)&self->_branchMap, 0);
  objc_storeStrong((id *)&self->_recordMap, 0);
  objc_storeStrong((id *)&self->_objectMap, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

- (void)setValidRootUUIDs:(id)a3
{
}

- (NSSet)validRootUUIDs
{
  return self->_validRootUUIDs;
}

- (void)setBranchMap:(id)a3
{
}

- (NSMapTable)branchMap
{
  return self->_branchMap;
}

- (void)setRecordMap:(id)a3
{
}

- (NSMapTable)recordMap
{
  return self->_recordMap;
}

- (void)setObjectMap:(id)a3
{
}

- (NSMapTable)objectMap
{
  return self->_objectMap;
}

- (void)setObjects:(id)a3
{
}

- (NSMutableArray)objects
{
  return self->_objects;
}

- (BOOL)hasValidChanges
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = [(HMDCloudChangeTree *)self objectMap];
  v5 = [v4 objectEnumerator];

  v6 = 0;
  while (1)
  {
    v7 = [v5 nextObject];

    if (!v7) {
      break;
    }
    v8 = [v7 change];

    v6 = v7;
    if (v8)
    {
      v9 = [v7 change];
      char v10 = [v9 isInvalid];

      v6 = v7;
      v11 = v7;
      if ((v10 & 1) == 0) {
        goto LABEL_7;
      }
    }
  }
  v11 = 0;
LABEL_7:

  os_unfair_lock_unlock(p_lock);
  return v7 != 0;
}

- (id)recordMapWithFilter:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA60];
  v6 = [(HMDCloudChangeTree *)self objectMap];
  v7 = objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v9 = [(HMDCloudChangeTree *)self objectMap];
  char v10 = [v9 objectEnumerator];
  v11 = 0;
LABEL_2:

  v12 = v11;
  while (1)
  {
    v11 = [v10 nextObject];

    if (!v11) {
      break;
    }
    v13 = [v11 change];
    if (v13)
    {
      v14 = [v11 change];
      char v15 = [v14 isDeleted];

      v12 = v11;
      if (v15) {
        continue;
      }
    }
    v16 = [v11 uuid];
    v9 = [v16 UUIDString];

    uint64_t v17 = [v11 recordName];
    v18 = (void *)v17;
    if (v9)
    {
      if (v17) {
        [v7 setObject:v17 forKeyedSubscript:v9];
      }
    }

    goto LABEL_2;
  }

  os_unfair_lock_unlock(p_lock);
  v19 = (void *)[v7 copy];

  return v19;
}

- (NSMutableArray)invalidCloudChanges
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = [(HMDCloudChangeTree *)self objectMap];
  v6 = [v5 objectEnumerator];
  v7 = 0;
LABEL_2:

  v8 = v7;
  while (1)
  {
    v7 = [v6 nextObject];

    if (!v7) {
      break;
    }
    v9 = [v7 change];

    v8 = v7;
    if (v9)
    {
      char v10 = [v7 change];
      int v11 = [v10 isInvalid];

      v8 = v7;
      if (v11)
      {
        v5 = [v7 change];
        [v3 addObject:v5];
        goto LABEL_2;
      }
    }
  }

  os_unfair_lock_unlock(p_lock);
  return (NSMutableArray *)v3;
}

- (NSMutableArray)cloudChanges
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = [(HMDCloudChangeTree *)self objectMap];
  v6 = [v5 objectEnumerator];
  v7 = 0;
LABEL_2:

  v8 = v7;
  while (1)
  {
    v7 = [v6 nextObject];

    if (!v7) {
      break;
    }
    v9 = [v7 change];

    v8 = v7;
    if (v9)
    {
      char v10 = [v7 change];
      char v11 = [v10 isInvalid];

      v8 = v7;
      if ((v11 & 1) == 0)
      {
        v5 = [v7 change];
        [v3 addObject:v5];
        goto LABEL_2;
      }
    }
  }

  os_unfair_lock_unlock(p_lock);
  return (NSMutableArray *)v3;
}

- (NSArray)orphans
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = [(HMDCloudChangeTree *)self objectMap];
  v6 = [v5 objectEnumerator];

  v7 = 0;
  while (1)
  {
    v8 = [v6 nextObject];

    if (!v8) {
      break;
    }
    v7 = v8;
    if ([v8 orphaned])
    {
      [v3 addObject:v8];
      v7 = v8;
    }
  }

  os_unfair_lock_unlock(p_lock);
  v9 = (void *)[v3 copy];

  return (NSArray *)v9;
}

- (NSArray)allTransactionStoreRowIDs
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = [(HMDCloudChangeTree *)self objectMap];
  v6 = [v5 objectEnumerator];
  v7 = 0;
LABEL_2:

  v8 = v7;
  while (1)
  {
    v7 = [v6 nextObject];

    if (!v7) {
      break;
    }
    v9 = [v7 change];

    v8 = v7;
    if (v9)
    {
      v5 = [v7 change];
      char v10 = [v5 rowIDs];
      [v3 addObjectsFromArray:v10];

      goto LABEL_2;
    }
  }

  os_unfair_lock_unlock(p_lock);
  char v11 = [v3 allObjects];

  return (NSArray *)v11;
}

- (NSArray)objectsWithPotentialChanges
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  os_unfair_lock_lock_with_options();
  id v4 = [(HMDCloudChangeTree *)self objectMap];
  v5 = [v4 objectEnumerator];

  v6 = 0;
  while (1)
  {
    v7 = v6;
    v6 = [v5 nextObject];

    if (!v6) {
      break;
    }
    v8 = (void *)MEMORY[0x1D9452090]();
    if ([v6 forceDelete]
      || ([v6 change], v9 = objc_claimAutoreleasedReturnValue(), v9, v9)
      && ([v6 change],
          char v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = [v10 isInvalid],
          v10,
          (v11 & 1) == 0))
    {
      v12 = [v6 uuid];
      [v3 addObject:v12];
    }
  }
  v13 = [(HMDCloudChangeTree *)self branchMap];
  v14 = [v13 objectEnumerator];

  char v15 = 0;
  while (1)
  {
    v16 = v15;
    char v15 = [v14 nextObject];

    if (!v15) {
      break;
    }
    uint64_t v17 = (void *)MEMORY[0x1D9452090]();
    v18 = [v15 parentUuid];
    if (v18)
    {
      v19 = [(HMDCloudChangeTree *)self validRootUUIDs];
      v20 = [v15 parentUuid];
      char v21 = [v19 containsObject:v20];

      if ((v21 & 1) == 0)
      {
        v22 = [v15 _allNodesInBranch];
        [v3 addObjectsFromArray:v22];
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
  v23 = [v3 allObjects];

  return (NSArray *)v23;
}

- (void)findAndMarkOrphanedBranches
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v3 = [(HMDCloudChangeTree *)self branchMap];
  id v4 = [v3 objectEnumerator];

  v5 = 0;
  while (1)
  {
    v6 = [v4 nextObject];

    if (!v6) {
      break;
    }
    v7 = [v6 parentUuid];
    v5 = v6;
    if (v7)
    {
      v8 = [(HMDCloudChangeTree *)self validRootUUIDs];
      v9 = [v6 parentUuid];
      char v10 = [v8 containsObject:v9];

      v5 = v6;
      if ((v10 & 1) == 0)
      {
        char v11 = (void *)MEMORY[0x1D9452090]();
        v12 = self;
        HMFGetOSLogHandle();
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v14 = (id)objc_claimAutoreleasedReturnValue();
          char v15 = [v6 description];
          *(_DWORD *)buf = 138543618;
          id v18 = v14;
          __int16 v19 = 2112;
          v20 = v15;
          _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Orphaned Branch %@, marking all children as deleted", buf, 0x16u);
        }
        [v6 _markBranchOrphaned];
        v5 = v6;
      }
    }
  }

  os_unfair_lock_unlock(lock);
}

- (void)findAndDeletedChildren
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_os_unfair_lock_t lock = &self->_lock;
  uint64_t v4 = os_unfair_lock_lock_with_options();
  v5 = (void *)MEMORY[0x1D9452090](v4);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v16 = 138543362;
    uint64_t v17 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Determining child records to delete", (uint8_t *)&v16, 0xCu);
  }
  v9 = [(HMDCloudChangeTree *)v6 objectMap];
  char v10 = [v9 objectEnumerator];

  char v11 = 0;
  while (1)
  {
    v12 = [v10 nextObject];

    if (!v12) {
      break;
    }
    v13 = [v12 change];

    char v11 = v12;
    if (v13)
    {
      id v14 = [v12 change];
      int v15 = [v14 isDeleted];

      char v11 = v12;
      if (v15)
      {
        [v12 deleteChildren];
        char v11 = v12;
      }
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)updateNode:(id)a3 withCloudRecord:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  v7 = [v8 recordName];
  [v8 _updateWithCloudRecord:v6];
  [(HMDCloudChangeTree *)self _updateNode:v8 oldRecordName:v7];

  os_unfair_lock_unlock(&self->_lock);
}

- (void)updateChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMDCloudChangeTree *)self _findNodeWithRecordMapping:v4];
  v7 = v6;
  if (v6)
  {
    id v8 = [(HMDCloudChangeNode *)v6 recordName];
    [(HMDCloudChangeNode *)v7 _updateWithChange:v4];
LABEL_5:
    [(HMDCloudChangeTree *)self _updateNode:v7 oldRecordName:v8];
    goto LABEL_6;
  }
  v7 = [[HMDCloudChangeNode alloc] initWithChange:v4];
  if (v7)
  {
    [(HMDCloudChangeTree *)self _addNode:v7];
    id v8 = 0;
    goto LABEL_5;
  }
  v9 = (void *)MEMORY[0x1D9452090]();
  char v10 = self;
  HMFGetOSLogHandle();
  char v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = HMFGetLogIdentifier();
    int v13 = 138543618;
    id v14 = v12;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not create object change node for change %@", (uint8_t *)&v13, 0x16u);
  }
  id v8 = 0;
  v7 = 0;
LABEL_6:

  os_unfair_lock_unlock(p_lock);
}

- (void)updateModel:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [v4 uuid];
  v7 = [(HMDCloudChangeTree *)self _objectForUUID:v6];

  if (v7)
  {
    [(HMDCloudChangeNode *)v7 _updateWithModel:v4];
LABEL_5:
    [(HMDCloudChangeTree *)self _updateNode:v7 oldRecordName:0];
    goto LABEL_6;
  }
  v7 = [[HMDCloudChangeNode alloc] initWithModel:v4];
  if (v7)
  {
    [(HMDCloudChangeTree *)self _addNode:v7];
    goto LABEL_5;
  }
  id v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  HMFGetOSLogHandle();
  char v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    char v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    int v13 = v11;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not create object change node for model %@", (uint8_t *)&v12, 0x16u);
  }
  v7 = 0;
LABEL_6:

  os_unfair_lock_unlock(p_lock);
}

- (void)updateRecordMapping:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMDCloudChangeTree *)self _findNodeWithRecordMapping:v4];
  v7 = v6;
  if (v6)
  {
    [(HMDCloudChangeNode *)v6 updateRecordMapping:v4];
LABEL_5:
    [(HMDCloudChangeTree *)self _updateNode:v7 oldRecordName:0];
    goto LABEL_6;
  }
  v7 = [[HMDCloudChangeNode alloc] initWithRecordMapping:v4];
  if (v7)
  {
    [(HMDCloudChangeTree *)self _addNode:v7];
    goto LABEL_5;
  }
  id v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  HMFGetOSLogHandle();
  char v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    int v12 = [v4 uuid];
    int v13 = [v4 recordName];
    int v14 = 138543874;
    id v15 = v11;
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    __int16 v18 = 2112;
    __int16 v19 = v13;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not create object change node for record mapping %@/%@", (uint8_t *)&v14, 0x20u);
  }
  v7 = 0;
LABEL_6:

  os_unfair_lock_unlock(p_lock);
}

- (void)removeNode:(id)a3
{
  id v19 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = [v19 parent];
  [v5 removeChild:v19];
  id v6 = [v19 children];
  v7 = [v6 objectEnumerator];
  for (i = 0; ; i = v9)
  {

    v9 = [v7 nextObject];

    if (!v9) {
      break;
    }
    id v6 = [(HMDCloudChangeTree *)self branchMap];
    char v10 = [v9 uuid];
    [v6 setObject:v9 forKey:v10];
  }
  id v11 = [v19 children];
  [v11 removeAllObjects];

  int v12 = [v19 recordName];

  if (v12)
  {
    int v13 = [(HMDCloudChangeTree *)self recordMap];
    int v14 = [v19 recordName];
    [v13 removeObjectForKey:v14];
  }
  id v15 = [v19 uuid];

  if (v15)
  {
    __int16 v16 = [(HMDCloudChangeTree *)self objectMap];
    uint64_t v17 = [v19 uuid];
    [v16 removeObjectForKey:v17];
  }
  __int16 v18 = [(HMDCloudChangeTree *)self objects];
  [v18 removeObject:v19];

  os_unfair_lock_unlock(p_lock);
}

- (void)_addNode:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v6 = a3;
  os_unfair_lock_assert_owner(p_lock);
  v5 = [(HMDCloudChangeTree *)self objects];
  [v5 addObject:v6];

  [(HMDCloudChangeTree *)self _updateNode:v6 oldRecordName:0];
}

- (void)_updateNode:(id)a3 oldRecordName:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v8 = [v6 uuid];
  if (v8)
  {
    v9 = (void *)v8;
    char v10 = [(HMDCloudChangeTree *)self objectMap];
    id v11 = [v6 uuid];
    int v12 = [v10 objectForKey:v11];

    if (!v12)
    {
      int v13 = [MEMORY[0x1E4F1CA48] array];
      int v14 = [(HMDCloudChangeTree *)self branchMap];
      id v15 = [v14 objectEnumerator];

      uint64_t v16 = [v15 nextObject];
      if (v16)
      {
        uint64_t v17 = (void *)v16;
        do
        {
          __int16 v18 = (void *)MEMORY[0x1D9452090]();
          id v19 = [v17 parentUuid];
          uint64_t v20 = [v6 uuid];
          int v21 = [v19 isEqual:v20];

          if (v21)
          {
            [v13 addObject:v17];
            [v6 addChild:v17];
            [v17 setParent:v6];
          }
          uint64_t v22 = [v15 nextObject];

          uint64_t v17 = (void *)v22;
        }
        while (v22);
      }
      if ([v13 count])
      {
        v47 = v13;
        id v48 = v7;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v23 = v13;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v49 objects:v53 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v50;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v50 != v26) {
                objc_enumerationMutation(v23);
              }
              v28 = *(void **)(*((void *)&v49 + 1) + 8 * i);
              v29 = (void *)MEMORY[0x1D9452090]();
              v30 = [(HMDCloudChangeTree *)self branchMap];
              v31 = [v28 uuid];
              [v30 removeObjectForKey:v31];
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v49 objects:v53 count:16];
          }
          while (v25);
        }

        int v13 = v47;
        id v7 = v48;
      }
      v32 = objc_msgSend(v6, "parentUuid", v47, v48, (void)v49);

      if (v32)
      {
        v33 = [(HMDCloudChangeTree *)self objectMap];
        v34 = [v6 parentUuid];
        v35 = [v33 objectForKey:v34];

        if (v35)
        {
          [v35 addChild:v6];
          [v6 setParent:v35];
        }
        else
        {
          v37 = [(HMDCloudChangeTree *)self branchMap];
          v38 = [v6 uuid];
          [v37 setObject:v6 forKey:v38];

          v35 = 0;
        }
      }
      else
      {
        v35 = [(HMDCloudChangeTree *)self branchMap];
        v36 = [v6 uuid];
        [v35 setObject:v6 forKey:v36];
      }
      v39 = [(HMDCloudChangeTree *)self objectMap];
      v40 = [v6 uuid];
      [v39 setObject:v6 forKey:v40];
    }
  }
  v41 = [v6 recordName];

  if (v41)
  {
    if (v7)
    {
      v42 = [v6 recordName];
      char v43 = [v7 isEqualToString:v42];

      if ((v43 & 1) == 0)
      {
        v44 = [(HMDCloudChangeTree *)self recordMap];
        [v44 removeObjectForKey:v7];
      }
    }
    v45 = [(HMDCloudChangeTree *)self recordMap];
    v46 = [v6 recordName];
    [v45 setObject:v6 forKey:v46];
  }
}

- (id)_findNodeWithRecordMapping:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = [v4 uuid];

  if (v5)
  {
    id v6 = [v4 uuid];
    uint64_t v7 = [(HMDCloudChangeTree *)self _objectForUUID:v6];
LABEL_5:
    v9 = (void *)v7;

    goto LABEL_6;
  }
  uint64_t v8 = [v4 recordName];

  if (v8)
  {
    id v6 = [v4 recordName];
    uint64_t v7 = [(HMDCloudChangeTree *)self _objectForRecordName:v6];
    goto LABEL_5;
  }
  v9 = 0;
LABEL_6:

  return v9;
}

- (id)objectForRecordName:(id)a3
{
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMDCloudChangeTree *)self _objectForRecordName:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)_objectForRecordName:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  id v6 = [(HMDCloudChangeTree *)self recordMap];
  uint64_t v7 = [v6 objectForKey:v5];

  return v7;
}

- (id)objectForUUID:(id)a3
{
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMDCloudChangeTree *)self _objectForUUID:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)_objectForUUID:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  id v6 = [(HMDCloudChangeTree *)self objectMap];
  uint64_t v7 = [v6 objectForKey:v5];

  return v7;
}

- (void)logChangeTreeWithIndent:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  os_unfair_lock_t lock = &self->_lock;
  uint64_t v4 = os_unfair_lock_lock_with_options();
  id v5 = (void *)MEMORY[0x1D9452090](v4);
  id v6 = self;
  HMFGetOSLogHandle();
  uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = [(HMDCloudChangeTree *)v6 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v20;
    __int16 v25 = 2112;
    uint64_t v26 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@%@HMDCloudChangeNode<%@>:", buf, 0x20u);
  }
  char v10 = [NSString stringWithFormat:@"%@  ", v20];
  id v11 = [(HMDCloudChangeTree *)v6 branchMap];
  int v12 = [v11 objectEnumerator];

  for (uint64_t i = 0; ; [i logChangeTreeWithIndent:v10])
  {
    int v14 = [v12 nextObject];

    if (!v14) {
      break;
    }
    uint64_t i = v14;
    if ([v14 orphaned])
    {
      id v15 = (void *)MEMORY[0x1D9452090]();
      uint64_t v16 = v6;
      HMFGetOSLogHandle();
      uint64_t v17 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        __int16 v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v22 = v18;
        __int16 v23 = 2112;
        id v24 = v10;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@%@Orphaned Branch", buf, 0x16u);
      }
    }
  }

  os_unfair_lock_unlock(lock);
}

- (id)description
{
  v2 = NSString;
  v3 = [(HMDCloudChangeTree *)self shortDescription];
  uint64_t v4 = [v2 stringWithFormat:@"<%@>", v3];

  return v4;
}

- (id)shortDescription
{
  v2 = NSString;
  v3 = [(id)objc_opt_class() shortDescription];
  uint64_t v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (HMDCloudChangeTree)initWithRootUUIDs:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HMDCloudChangeTree;
  id v5 = [(HMDCloudChangeTree *)&v20 init];
  id v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    objects = v6->_objects;
    v6->_objects = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    objectMap = v6->_objectMap;
    v6->_objectMap = (NSMapTable *)v9;

    uint64_t v11 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    recordMap = v6->_recordMap;
    v6->_recordMap = (NSMapTable *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    branchMap = v6->_branchMap;
    v6->_branchMap = (NSMapTable *)v13;

    id v15 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
    uint64_t v16 = [MEMORY[0x1E4F29128] zeroUUID];
    [v15 addObject:v16];

    uint64_t v17 = [v15 copy];
    validRootUUIDs = v6->_validRootUUIDs;
    v6->_validRootUUIDs = (NSSet *)v17;
  }
  return v6;
}

- (HMDCloudChangeTree)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)modelTypeCanBeOrphaned:(id)a3
{
  id v3 = a3;
  if (isInternalBuild())
  {
    if (modelTypeCanBeOrphaned__pred != -1) {
      dispatch_once(&modelTypeCanBeOrphaned__pred, &__block_literal_global_100);
    }
    char v4 = [(id)modelTypeCanBeOrphaned___models containsObject:v3];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

uint64_t __45__HMDCloudChangeTree_modelTypeCanBeOrphaned___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F2DC6A90];
  uint64_t v1 = modelTypeCanBeOrphaned___models;
  modelTypeCanBeOrphaned___models = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_23551 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_23551, &__block_literal_global_23552);
  }
  v2 = (void *)logCategory__hmf_once_v4_23553;
  return v2;
}

uint64_t __33__HMDCloudChangeTree_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v4_23553;
  logCategory__hmf_once_v4_23553 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end