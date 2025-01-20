@interface SYObjectChangeSet
- (NSMutableSet)added;
- (NSMutableSet)deleted;
- (NSMutableSet)updated;
- (SYObjectChangeSet)init;
- (SYObjectChangeSet)initWithChangesBetween:(id)a3 and:(id)a4;
- (id)changesBetween:(id)a3 and:(id)a4;
- (void)applyToStore:(id)a3;
- (void)setAdded:(id)a3;
- (void)setDeleted:(id)a3;
- (void)setUpdated:(id)a3;
@end

@implementation SYObjectChangeSet

- (id)changesBetween:(id)a3 and:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v5];
    v10 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v7];
    v8 = objc_alloc_init(SYObjectChangeSet);
    v11 = [(SYObjectChangeSet *)v8 added];
    [v11 addObjectsFromArray:v7];

    v12 = [(SYObjectChangeSet *)v8 added];
    [v12 minusSet:v9];

    v13 = [(SYObjectChangeSet *)v8 deleted];
    [v13 addObjectsFromArray:v5];

    v14 = [(SYObjectChangeSet *)v8 deleted];
    [v14 minusSet:v10];

    v15 = [(SYObjectChangeSet *)v8 added];
    if ([v15 count])
    {
      v16 = [(SYObjectChangeSet *)v8 deleted];
      uint64_t v17 = [v16 count];

      if (v17)
      {
        v34 = v10;
        v35 = v9;
        v36 = v7;
        id v37 = v5;
        id v43 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        id v42 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id obj = [(SYObjectChangeSet *)v8 added];
        uint64_t v40 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
        if (v40)
        {
          uint64_t v39 = *(void *)v49;
          do
          {
            uint64_t v18 = 0;
            do
            {
              if (*(void *)v49 != v39) {
                objc_enumerationMutation(obj);
              }
              uint64_t v41 = v18;
              v19 = *(void **)(*((void *)&v48 + 1) + 8 * v18);
              long long v44 = 0u;
              long long v45 = 0u;
              long long v46 = 0u;
              long long v47 = 0u;
              v20 = v8;
              v21 = [(SYObjectChangeSet *)v8 deleted];
              uint64_t v22 = [v21 countByEnumeratingWithState:&v44 objects:v52 count:16];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v24 = *(void *)v45;
                do
                {
                  for (uint64_t i = 0; i != v23; ++i)
                  {
                    if (*(void *)v45 != v24) {
                      objc_enumerationMutation(v21);
                    }
                    v26 = *(void **)(*((void *)&v44 + 1) + 8 * i);
                    v27 = [v19 syncId];
                    v28 = [v26 syncId];
                    int v29 = [v27 isEqual:v28];

                    if (v29)
                    {
                      [v43 addObject:v19];
                      [v42 addObject:v26];
                      v30 = [(SYObjectChangeSet *)v20 updated];
                      [v30 addObject:v19];
                    }
                  }
                  uint64_t v23 = [v21 countByEnumeratingWithState:&v44 objects:v52 count:16];
                }
                while (v23);
              }

              uint64_t v18 = v41 + 1;
              v8 = v20;
            }
            while (v41 + 1 != v40);
            uint64_t v40 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
          }
          while (v40);
        }

        v31 = [(SYObjectChangeSet *)v8 added];
        [v31 minusSet:v43];

        v32 = [(SYObjectChangeSet *)v8 deleted];
        [v32 minusSet:v42];

        v7 = v36;
        id v5 = v37;
        v10 = v34;
        v9 = v35;
      }
    }
    else
    {
    }
  }

  return v8;
}

- (SYObjectChangeSet)init
{
  v10.receiver = self;
  v10.super_class = (Class)SYObjectChangeSet;
  v2 = [(SYObjectChangeSet *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    added = v2->_added;
    v2->_added = v3;

    id v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    updated = v2->_updated;
    v2->_updated = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    deleted = v2->_deleted;
    v2->_deleted = v7;
  }
  return v2;
}

- (SYObjectChangeSet)initWithChangesBetween:(id)a3 and:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SYObjectChangeSet;
  v8 = [(SYObjectChangeSet *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_super v10 = [(SYObjectChangeSet *)v8 changesBetween:v6 and:v7];
    uint64_t v11 = [v10 added];
    added = v9->_added;
    v9->_added = (NSMutableSet *)v11;

    uint64_t v13 = [v10 updated];
    updated = v9->_updated;
    v9->_updated = (NSMutableSet *)v13;

    uint64_t v15 = [v10 deleted];
    deleted = v9->_deleted;
    v9->_deleted = (NSMutableSet *)v15;
  }
  return v9;
}

- (void)applyToStore:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __34__SYObjectChangeSet_applyToStore___block_invoke;
  v3[3] = &unk_264422788;
  v3[4] = self;
  [a3 transaction:v3];
}

void __34__SYObjectChangeSet_applyToStore___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v4 = [*(id *)(a1 + 32) added];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v27 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v6);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v9 = [*(id *)(a1 + 32) updated];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        [v3 updateObject:*(void *)(*((void *)&v23 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v11);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v14 = objc_msgSend(*(id *)(a1 + 32), "deleted", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        [v3 deleteObject:*(void *)(*((void *)&v19 + 1) + 8 * v18++)];
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v31 count:16];
    }
    while (v16);
  }
}

- (NSMutableSet)added
{
  return self->_added;
}

- (void)setAdded:(id)a3
{
}

- (NSMutableSet)updated
{
  return self->_updated;
}

- (void)setUpdated:(id)a3
{
}

- (NSMutableSet)deleted
{
  return self->_deleted;
}

- (void)setDeleted:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleted, 0);
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_added, 0);
}

@end