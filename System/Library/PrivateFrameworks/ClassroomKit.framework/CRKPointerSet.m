@interface CRKPointerSet
+ (CRKPointerSet)setWithArray:(id)a3;
+ (CRKPointerSet)setWithSet:(id)a3;
- (BOOL)containsObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSubsetOfSet:(id)a3;
- (CRKPointerSet)init;
- (NSArray)allObjects;
- (id)setByIntersectingSet:(id)a3;
- (id)setBySubtractingSet:(id)a3;
- (int64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
@end

@implementation CRKPointerSet

+ (CRKPointerSet)setWithArray:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 addObjectsFromArray:v3];

  return (CRKPointerSet *)v4;
}

+ (CRKPointerSet)setWithSet:(id)a3
{
  v4 = [a3 allObjects];
  v5 = [a1 setWithArray:v4];

  return (CRKPointerSet *)v5;
}

- (CRKPointerSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRKPointerSet;
  v2 = [(CRKPointerSet *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] hashTableWithOptions:512];
    mBackingStore = v2->mBackingStore;
    v2->mBackingStore = (NSHashTable *)v3;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  objc_super v6 = v5;
  if (v6) {
    BOOL v7 = [(NSHashTable *)self->mBackingStore isEqualToHashTable:v6[1]];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSHashTable *)self->mBackingStore hash];
}

- (void)addObject:(id)a3
{
}

- (void)addObjectsFromArray:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
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
        [(CRKPointerSet *)self addObject:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeObject:(id)a3
{
}

- (void)removeAllObjects
{
}

- (BOOL)containsObject:(id)a3
{
  return [(NSHashTable *)self->mBackingStore containsObject:a3];
}

- (BOOL)isSubsetOfSet:(id)a3
{
  return [(NSHashTable *)self->mBackingStore isSubsetOfHashTable:*((void *)a3 + 1)];
}

- (int64_t)count
{
  return [(NSHashTable *)self->mBackingStore count];
}

- (NSArray)allObjects
{
  return [(NSHashTable *)self->mBackingStore allObjects];
}

- (id)setBySubtractingSet:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [(NSHashTable *)self->mBackingStore copy];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v5, "removeObject:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  return v5;
}

- (id)setByIntersectingSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [(NSHashTable *)self->mBackingStore copy];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = (void *)v5[1];
  uint64_t v9 = v4[1];

  [v8 intersectHashTable:v9];

  return v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSHashTable *)self->mBackingStore countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void).cxx_destruct
{
}

@end