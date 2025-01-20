@interface HMObjectMergeCollection
- (BOOL)isModified;
- (HMObjectMergeCollection)initWithCurrentObjects:(id)a3 newObjects:(id)a4;
- (HMObjectMergeCollection)initWithCurrentObjects:(id)a3 newObjects:(id)a4 commonObjectPredicate:(id)a5;
- (NSArray)addedObjects;
- (NSArray)commonObjectPairs;
- (NSArray)finalObjects;
- (NSArray)removedObjects;
- (NSMutableArray)currentUpdatedObjects;
- (void)mergeCommonObjects;
- (void)mergeCommonObjectsNoMergeCount;
- (void)replaceAddedObjectsWithObjects:(id)a3;
- (void)setAddedObjects:(id)a3;
@end

@implementation HMObjectMergeCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commonObjectPairs, 0);
  objc_storeStrong((id *)&self->_currentUpdatedObjects, 0);
  objc_storeStrong((id *)&self->_removedObjects, 0);

  objc_storeStrong((id *)&self->_addedObjects, 0);
}

- (NSArray)commonObjectPairs
{
  return self->_commonObjectPairs;
}

- (NSMutableArray)currentUpdatedObjects
{
  return self->_currentUpdatedObjects;
}

- (NSArray)removedObjects
{
  return self->_removedObjects;
}

- (void)setAddedObjects:(id)a3
{
}

- (NSArray)addedObjects
{
  return self->_addedObjects;
}

- (void)mergeCommonObjectsNoMergeCount
{
  id v2 = [(HMObjectMergeCollection *)self commonObjectPairs];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_10];
}

void __57__HMObjectMergeCollection_mergeCommonObjectsNoMergeCount__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = [v2 oldObject];
  v3 = [v2 updatedObject];

  [v4 mergeFromNewObjectNoMergeCount:v3];
}

- (void)mergeCommonObjects
{
  v3 = [(HMObjectMergeCollection *)self commonObjectPairs];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__HMObjectMergeCollection_mergeCommonObjects__block_invoke;
  v4[3] = &unk_1E593F108;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

void __45__HMObjectMergeCollection_mergeCommonObjects__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = [v8 oldObject];
  id v4 = [v8 updatedObject];
  int v5 = [v3 mergeFromNewObject:v4];

  if (v5)
  {
    v6 = [*(id *)(a1 + 32) currentUpdatedObjects];
    v7 = [v8 oldObject];
    [v6 addObject:v7];
  }
}

- (void)replaceAddedObjectsWithObjects:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(HMObjectMergeCollection *)self addedObjects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v13 + 1) + 8 * v10) uniqueIdentifier];
        v12 = objc_msgSend(v4, "hmf_firstObjectWithValue:forKeyPath:", v11, @"uniqueIdentifier");

        if (v12) {
          [v5 addObject:v12];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [(HMObjectMergeCollection *)self setAddedObjects:v5];
}

- (NSArray)finalObjects
{
  v3 = [(HMObjectMergeCollection *)self commonObjectPairs];
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_7);
  int v5 = [(HMObjectMergeCollection *)self addedObjects];
  v6 = [v4 arrayByAddingObjectsFromArray:v5];

  return (NSArray *)v6;
}

uint64_t __39__HMObjectMergeCollection_finalObjects__block_invoke(uint64_t a1, void *a2)
{
  return [a2 oldObject];
}

- (BOOL)isModified
{
  v3 = [(HMObjectMergeCollection *)self addedObjects];
  uint64_t v4 = [v3 count];
  int v5 = [(HMObjectMergeCollection *)self removedObjects];
  uint64_t v6 = [v5 count] + v4;
  uint64_t v7 = [(HMObjectMergeCollection *)self currentUpdatedObjects];
  LOBYTE(v6) = v6 + [v7 count] != 0;

  return v6;
}

- (HMObjectMergeCollection)initWithCurrentObjects:(id)a3 newObjects:(id)a4 commonObjectPredicate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v35.receiver = self;
  v35.super_class = (Class)HMObjectMergeCollection;
  v11 = [(HMObjectMergeCollection *)&v35 init];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    currentUpdatedObjects = v11->_currentUpdatedObjects;
    v11->_currentUpdatedObjects = (NSMutableArray *)v12;

    long long v14 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = [MEMORY[0x1E4F1CA48] arrayWithArray:v8];
    long long v16 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __83__HMObjectMergeCollection_initWithCurrentObjects_newObjects_commonObjectPredicate___block_invoke;
    v30 = &unk_1E593F0C0;
    id v31 = v15;
    id v33 = v14;
    id v34 = v10;
    id v32 = v16;
    id v17 = v14;
    id v18 = v16;
    id v19 = v15;
    [v9 enumerateObjectsUsingBlock:&v27];
    uint64_t v20 = objc_msgSend(v17, "copy", v27, v28, v29, v30);
    addedObjects = v11->_addedObjects;
    v11->_addedObjects = (NSArray *)v20;

    uint64_t v22 = [v19 copy];
    removedObjects = v11->_removedObjects;
    v11->_removedObjects = (NSArray *)v22;

    uint64_t v24 = [v18 copy];
    commonObjectPairs = v11->_commonObjectPairs;
    v11->_commonObjectPairs = (NSArray *)v24;
  }
  return v11;
}

void __83__HMObjectMergeCollection_initWithCurrentObjects_newObjects_commonObjectPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __83__HMObjectMergeCollection_initWithCurrentObjects_newObjects_commonObjectPredicate___block_invoke_2;
  long long v13 = &unk_1E593F098;
  id v15 = *(id *)(a1 + 56);
  id v5 = v3;
  id v14 = v5;
  uint64_t v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", &v10);
  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 40);
    id v8 = [HMObjectMergePair alloc];
    id v9 = -[HMObjectMergePair initWithOldObject:updatedObject:](v8, "initWithOldObject:updatedObject:", v6, v5, v10, v11, v12, v13);
    [v7 addObject:v9];

    [*(id *)(a1 + 32) removeObject:v6];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5, v10, v11, v12, v13);
  }
}

uint64_t __83__HMObjectMergeCollection_initWithCurrentObjects_newObjects_commonObjectPredicate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

- (HMObjectMergeCollection)initWithCurrentObjects:(id)a3 newObjects:(id)a4
{
  return [(HMObjectMergeCollection *)self initWithCurrentObjects:a3 newObjects:a4 commonObjectPredicate:&__block_literal_global_10480];
}

uint64_t __61__HMObjectMergeCollection_initWithCurrentObjects_newObjects___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 uniqueIdentifier];
  uint64_t v6 = [v4 uniqueIdentifier];

  uint64_t v7 = objc_msgSend(v5, "hmf_isEqualToUUID:", v6);
  return v7;
}

@end