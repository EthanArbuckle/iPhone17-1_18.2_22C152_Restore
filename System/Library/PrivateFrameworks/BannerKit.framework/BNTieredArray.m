@interface BNTieredArray
- (NSArray)allObjects;
- (NSArray)topObjectFromEachTier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)indexPathForObject:(id)a3;
- (id)objectAtIndexPath:(id)a3;
- (id)tierAtIndex:(unint64_t)a3;
- (id)topObject;
- (id)topObjectInTier:(int64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)tierCount;
- (void)_invalidateAllObjectsCache;
- (void)addObject:(id)a3 incrementingTier:(BOOL)a4 addTierToTop:(BOOL)a5;
- (void)insertObject:(id)a3 beneathObject:(id)a4;
- (void)removeObject:(id)a3;
- (void)removeObjectAtIndexPath:(id)a3;
@end

@implementation BNTieredArray

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v8 = [(BNTieredArray *)self allObjects];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (unint64_t)count
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_collections;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "count", (void)v9);
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)tierCount
{
  return [(NSMutableArray *)self->_collections count];
}

- (id)topObject
{
  return [(BNTieredArray *)self topObjectInTier:0];
}

- (NSArray)topObjectFromEachTier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(BNTieredArray *)self tierCount])
  {
    unint64_t v4 = 0;
    do
    {
      unint64_t v5 = [(BNTieredArray *)self topObjectInTier:v4];
      [v3 addObject:v5];

      ++v4;
    }
    while (v4 < [(BNTieredArray *)self tierCount]);
  }
  return (NSArray *)v3;
}

- (NSArray)allObjects
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  allObjects = v2->_allObjects;
  if (!allObjects)
  {
    unint64_t v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    unint64_t v5 = v2->_collections;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v5);
          }
          -[NSArray addObjectsFromArray:](v4, "addObjectsFromArray:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        }
        uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    long long v9 = v2->_allObjects;
    v2->_allObjects = v4;

    allObjects = v2->_allObjects;
  }
  long long v10 = allObjects;
  objc_sync_exit(v2);

  return v10;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 tier];
  unint64_t v6 = [v4 item];

  if (v5 >= [(NSMutableArray *)self->_collections count]
    || ([(NSMutableArray *)self->_collections objectAtIndexedSubscript:v5],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 count],
        v7,
        v6 >= v8))
  {
    long long v10 = 0;
  }
  else
  {
    long long v9 = [(NSMutableArray *)self->_collections objectAtIndexedSubscript:v5];
    long long v10 = [v9 objectAtIndexedSubscript:v6];
  }
  return v10;
}

- (id)indexPathForObject:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  collections = self->_collections;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__BNTieredArray_indexPathForObject___block_invoke;
  v9[3] = &unk_1E63B9EA0;
  long long v11 = &v17;
  id v6 = v4;
  id v10 = v6;
  long long v12 = &v13;
  [(NSMutableArray *)collections enumerateObjectsUsingBlock:v9];
  uint64_t v7 = [MEMORY[0x1E4F28D58] indexPathForItem:v18[3] inTier:v14[3]];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __36__BNTieredArray_indexPathForObject___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 indexOfObject:a1[4]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  if (*(void *)(*(void *)(a1[5] + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (void)addObject:(id)a3 incrementingTier:(BOOL)a4 addTierToTop:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (v8)
  {
    id v16 = v8;
    collections = self->_collections;
    if (!collections)
    {
      id v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v11 = self->_collections;
      self->_collections = v10;

      collections = self->_collections;
    }
    uint64_t v12 = [(NSMutableArray *)collections firstObject];
    uint64_t v13 = (void *)v12;
    if (a4 || !v12)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v15 = self->_collections;
      if (v5) {
        [(NSMutableArray *)v15 insertObject:v14 atIndex:0];
      }
      else {
        [(NSMutableArray *)v15 addObject:v14];
      }
    }
    else
    {
      id v14 = (id)v12;
    }
    [v14 addObject:v16];
    [(BNTieredArray *)self _invalidateAllObjectsCache];

    id v8 = v16;
  }
}

- (void)insertObject:(id)a3 beneathObject:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v9 = v6;
    uint64_t v7 = [(BNTieredArray *)self indexPathForObject:a4];
    if ([v7 item] != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_collections, "objectAtIndexedSubscript:", [v7 tier]);
      objc_msgSend(v8, "insertObject:atIndex:", v9, objc_msgSend(v7, "item"));
      [(BNTieredArray *)self _invalidateAllObjectsCache];
    }
    id v6 = v9;
  }
}

- (void)removeObjectAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 tier];
  unint64_t v6 = [v4 item];

  if (v5 < [(NSMutableArray *)self->_collections count])
  {
    id v10 = [(NSMutableArray *)self->_collections objectAtIndexedSubscript:v5];
    BOOL v7 = v6 >= [v10 count];
    id v8 = v10;
    if (!v7)
    {
      [v10 removeObjectAtIndex:v6];
      if (![v10 count]) {
        [(NSMutableArray *)self->_collections removeObjectAtIndex:v5];
      }
      if (![(NSMutableArray *)self->_collections count])
      {
        collections = self->_collections;
        self->_collections = 0;
      }
      [(BNTieredArray *)self _invalidateAllObjectsCache];
      id v8 = v10;
    }
  }
}

- (void)removeObject:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    collections = self->_collections;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __30__BNTieredArray_removeObject___block_invoke;
    v8[3] = &unk_1E63B9EA0;
    id v10 = &v12;
    id v9 = v4;
    long long v11 = &v16;
    [(NSMutableArray *)collections enumerateObjectsUsingBlock:v8];
    BOOL v7 = [MEMORY[0x1E4F28D58] indexPathForItem:v13[3] inTier:v17[3]];
    [(BNTieredArray *)self removeObjectAtIndexPath:v7];

    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
}

uint64_t __30__BNTieredArray_removeObject___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 indexOfObject:a1[4]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  if (*(void *)(*(void *)(a1[5] + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)tierAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_collections count] <= a3)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = [(NSMutableArray *)self->_collections objectAtIndex:a3];
  }
  return v5;
}

- (id)topObjectInTier:(int64_t)a3
{
  id v3 = [(BNTieredArray *)self tierAtIndex:a3];
  id v4 = [v3 lastObject];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(BNTieredArray);
  uint64_t v5 = [(NSMutableArray *)self->_collections copy];
  collections = v4->_collections;
  v4->_collections = (NSMutableArray *)v5;

  return v4;
}

- (void)_invalidateAllObjectsCache
{
  obj = self;
  objc_sync_enter(obj);
  allObjects = obj->_allObjects;
  obj->_allObjects = 0;

  objc_sync_exit(obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allObjects, 0);
  objc_storeStrong((id *)&self->_collections, 0);
}

@end