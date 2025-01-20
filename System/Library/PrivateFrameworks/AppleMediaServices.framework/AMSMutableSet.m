@interface AMSMutableSet
+ (id)setWithHashBlock:(id)a3;
- (AMSMutableSet)initWithHashBlock:(id)a3;
- (BOOL)containsObject:(id)a3;
- (id)_allObjectsFromBackingSet;
- (id)anyObject;
- (id)hashBlock;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)setHashBlock:(id)a3;
@end

@implementation AMSMutableSet

+ (id)setWithHashBlock:(id)a3
{
  id v3 = a3;
  v4 = [[AMSMutableSet alloc] initWithHashBlock:v3];

  return v4;
}

- (AMSMutableSet)initWithHashBlock:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSMutableSet;
  v5 = [(AMSMutableSet *)&v11 init];
  if (v5)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    backingSet = v5->_backingSet;
    v5->_backingSet = v6;

    v8 = _Block_copy(v4);
    id hashBlock = v5->_hashBlock;
    v5->_id hashBlock = v8;
  }
  return v5;
}

- (void)addObject:(id)a3
{
  backingSet = self->_backingSet;
  id v5 = a3;
  v8 = [(AMSMutableSet *)self hashBlock];
  v6 = v8[2](v8, v5);
  v7 = +[AMSSetItem setItemWithObject:v5 hashKey:v6];

  [(NSMutableSet *)backingSet addObject:v7];
}

- (void)addObjectsFromArray:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(AMSMutableSet *)self addObject:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (unint64_t)count
{
  return [(NSMutableSet *)self->_backingSet count];
}

- (id)anyObject
{
  v2 = [(NSMutableSet *)self->_backingSet anyObject];
  id v3 = [v2 object];

  return v3;
}

- (id)member:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(AMSMutableSet *)self hashBlock];
  uint64_t v6 = ((void (**)(void, id))v5)[2](v5, v4);
  uint64_t v7 = +[AMSSetItem setItemWithObject:v4 hashKey:v6];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [(NSMutableSet *)self->_backingSet allObjects];
  long long v9 = (void *)[v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v13 = [v12 hashKey];
        uint64_t v14 = [v7 hashKey];
        char v15 = [v13 isEqualToString:v14];

        if (v15)
        {
          long long v9 = [v12 object];
          goto LABEL_11;
        }
      }
      long long v9 = (void *)[v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)objectEnumerator
{
  v2 = [(AMSMutableSet *)self _allObjectsFromBackingSet];
  id v3 = [v2 objectEnumerator];

  return v3;
}

- (BOOL)containsObject:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(AMSMutableSet *)self _allObjectsFromBackingSet];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v10 + 1) + 8 * i) == v4)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_allObjectsFromBackingSet
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[AMSMutableSet count](self, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSMutableSet *)self->_backingSet allObjects];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) object];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)hashBlock
{
  return self->_hashBlock;
}

- (void)setHashBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hashBlock, 0);
  objc_storeStrong((id *)&self->_backingSet, 0);
}

@end