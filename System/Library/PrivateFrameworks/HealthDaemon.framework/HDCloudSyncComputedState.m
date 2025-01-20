@interface HDCloudSyncComputedState
- (HDCloudSyncComputedState)init;
- (NSArray)pullTargets;
- (NSArray)pushTargets;
- (NSArray)targets;
- (id)detailedDescription;
- (unint64_t)countOfRebaselineOperations;
- (void)addTargets:(id)a3;
- (void)replaceTargets:(id)a3;
- (void)resetTargets;
- (void)setCountOfRebaselineOperations:(unint64_t)a3;
@end

@implementation HDCloudSyncComputedState

- (HDCloudSyncComputedState)init
{
  v6.receiver = self;
  v6.super_class = (Class)HDCloudSyncComputedState;
  v2 = [(HDCloudSyncComputedState *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    targets = v2->_targets;
    v2->_targets = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (NSArray)targets
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_targets;
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (void)addTargets:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableArray *)self->_targets addObjectsFromArray:v5];

  os_unfair_lock_unlock(p_lock);
}

- (NSArray)pushTargets
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(NSMutableArray *)self->_targets hk_filter:&__block_literal_global_182];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

BOOL __39__HDCloudSyncComputedState_pushTargets__block_invoke(uint64_t a1, void *a2)
{
  return [a2 purpose] == 0;
}

- (NSArray)pullTargets
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(NSMutableArray *)self->_targets hk_filter:&__block_literal_global_279_0];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

BOOL __39__HDCloudSyncComputedState_pullTargets__block_invoke(uint64_t a1, void *a2)
{
  return [a2 purpose] == 1;
}

- (void)replaceTargets:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  targets = self->_targets;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__HDCloudSyncComputedState_replaceTargets___block_invoke;
  v11[3] = &unk_1E62F4740;
  id v12 = v4;
  id v6 = v4;
  v7 = [(NSMutableArray *)targets hk_filter:v11];
  v8 = [v7 arrayByAddingObjectsFromArray:v6];

  v9 = (NSMutableArray *)[v8 copy];
  v10 = self->_targets;
  self->_targets = v9;

  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __43__HDCloudSyncComputedState_replaceTargets___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (void)resetTargets
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  targets = self->_targets;
  self->_targets = v4;

  os_unfair_lock_unlock(p_lock);
}

- (id)detailedDescription
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = [(HDCloudSyncComputedState *)self pushTargets];
  objc_msgSend(v3, "appendFormat:", @"Push Targets (%lu):\n", objc_msgSend(v4, "count"));
  if ([v4 count])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v29 = v4;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v11 = [v10 description];
          id v12 = objc_msgSend(v11, "hk_stringIndentedBy:", 4);
          [v3 appendString:v12];

          [v3 appendString:@"\n"];
          v13 = [v10 storeRecord];
          v14 = [v13 description];
          v15 = objc_msgSend(v14, "hk_stringIndentedBy:", 4);
          [v3 appendString:v15];

          [v3 appendString:@"\n"];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v7);
    }

    id v4 = v29;
  }
  v16 = [(HDCloudSyncComputedState *)self pullTargets];
  objc_msgSend(v3, "appendFormat:", @"\nPull Targets (%lu):\n", objc_msgSend(v16, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        v23 = [v22 description];
        v24 = objc_msgSend(v23, "hk_stringIndentedBy:", 4);
        [v3 appendString:v24];

        [v3 appendString:@"\n"];
        v25 = [v22 storeRecord];
        v26 = [v25 description];
        v27 = objc_msgSend(v26, "hk_stringIndentedBy:", 4);
        [v3 appendString:v27];

        [v3 appendString:@"\n"];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v19);
  }

  return v3;
}

- (unint64_t)countOfRebaselineOperations
{
  return self->_countOfRebaselineOperations;
}

- (void)setCountOfRebaselineOperations:(unint64_t)a3
{
  self->_countOfRebaselineOperations = a3;
}

- (void).cxx_destruct
{
}

@end