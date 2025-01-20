@interface PFUbiquityToManyConflictDiff
- (BOOL)isEqual:(id)a3;
- (PFUbiquityToManyConflictDiff)init;
- (id)description;
- (id)initForRelationshipAtKey:(id)a3;
- (uint64_t)diffWithLogSnapshot:(uint64_t)a3 andPreviousSnapshot:;
- (void)dealloc;
@end

@implementation PFUbiquityToManyConflictDiff

- (PFUbiquityToManyConflictDiff)init
{
  v4.receiver = self;
  v4.super_class = (Class)PFUbiquityToManyConflictDiff;
  v2 = [(PFUbiquityToManyConflictDiff *)&v4 init];
  if (v2)
  {
    v2->_insertedObjectIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v2->_deletedObjectIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  return v2;
}

- (id)initForRelationshipAtKey:(id)a3
{
  objc_super v4 = [(PFUbiquityToManyConflictDiff *)self init];
  if (v4) {
    v4->_relationshipKey = (NSString *)a3;
  }
  return v4;
}

- (void)dealloc
{
  self->_insertedObjectIDs = 0;
  self->_deletedObjectIDs = 0;

  self->_relationshipKey = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityToManyConflictDiff;
  [(PFUbiquityToManyConflictDiff *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityToManyConflictDiff;
  return (id)[NSString stringWithFormat:@"%@\ninsertedObjectIDs: %@\ndeletedObjectIDs: %@\n", -[PFUbiquityToManyConflictDiff description](&v3, sel_description), self->_insertedObjectIDs, self->_deletedObjectIDs];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  insertedObjectIDs = self->_insertedObjectIDs;
  if (!a3)
  {
    char v9 = [(NSMutableSet *)insertedObjectIDs isEqual:0];
    uint64_t v6 = 0;
    if (v9) {
      goto LABEL_5;
    }
    return 0;
  }
  if (![(NSMutableSet *)insertedObjectIDs isEqual:*((void *)a3 + 1)]) {
    return 0;
  }
  uint64_t v6 = *((void *)a3 + 2);
LABEL_5:
  deletedObjectIDs = self->_deletedObjectIDs;

  return [(NSMutableSet *)deletedObjectIDs isEqual:v6];
}

- (uint64_t)diffWithLogSnapshot:(uint64_t)a3 andPreviousSnapshot:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    [*(id *)(result + 8) removeAllObjects];
    [*(id *)(v5 + 16) removeAllObjects];
    if (a2) {
      uint64_t v6 = *(void **)(a2 + 8);
    }
    else {
      uint64_t v6 = 0;
    }
    v7 = (void *)[v6 objectForKey:*(void *)(v5 + 24)];
    if (a3)
    {
      v8 = (void *)[*(id *)(a3 + 8) objectForKey:*(void *)(v5 + 24)];
      char v9 = *(void **)(a3 + 16);
    }
    else
    {
      v8 = (void *)[0 objectForKey:*(void *)(v5 + 24)];
      char v9 = 0;
    }
    v10 = (void *)[v9 objectForKey:*(void *)(v5 + 24)];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v11 = [v7 countByEnumeratingWithState:&v43 objects:v50 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v44 != v13) {
            objc_enumerationMutation(v7);
          }
          uint64_t v15 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          if (([v8 containsObject:v15] & 1) == 0) {
            [*(id *)(v5 + 8) addObject:v15];
          }
        }
        uint64_t v12 = [v7 countByEnumeratingWithState:&v43 objects:v50 count:16];
      }
      while (v12);
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v16 = [v8 countByEnumeratingWithState:&v39 objects:v49 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(v8);
          }
          uint64_t v20 = *(void *)(*((void *)&v39 + 1) + 8 * j);
          if (([v7 containsObject:v20] & 1) == 0) {
            [*(id *)(v5 + 16) addObject:v20];
          }
        }
        uint64_t v17 = [v8 countByEnumeratingWithState:&v39 objects:v49 count:16];
      }
      while (v17);
    }
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if (result)
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      if (v10) {
        v21 = (void *)v10[1];
      }
      else {
        v21 = 0;
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v48 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v36;
        do
        {
          for (uint64_t k = 0; k != v23; ++k)
          {
            if (*(void *)v36 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void *)(*((void *)&v35 + 1) + 8 * k);
            if (([*(id *)(v5 + 16) containsObject:v26] & 1) == 0) {
              [*(id *)(v5 + 8) addObject:v26];
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v48 count:16];
        }
        while (v23);
      }
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      if (v10) {
        v10 = (void *)v10[2];
      }
      result = [v10 countByEnumeratingWithState:&v31 objects:v47 count:16];
      if (result)
      {
        uint64_t v27 = result;
        uint64_t v28 = *(void *)v32;
        do
        {
          uint64_t v29 = 0;
          do
          {
            if (*(void *)v32 != v28) {
              objc_enumerationMutation(v10);
            }
            uint64_t v30 = *(void *)(*((void *)&v31 + 1) + 8 * v29);
            if ((objc_msgSend(*(id *)(v5 + 8), "containsObject:", v30, (void)v31) & 1) == 0) {
              [*(id *)(v5 + 16) addObject:v30];
            }
            ++v29;
          }
          while (v27 != v29);
          result = [v10 countByEnumeratingWithState:&v31 objects:v47 count:16];
          uint64_t v27 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

@end