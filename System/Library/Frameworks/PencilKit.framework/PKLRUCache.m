@interface PKLRUCache
- (PKLRUCache)init;
- (char)objectForKey:(char *)a1;
- (char)objectForKey:(uint64_t)a3 scaleFactor:;
- (id)checkObjectForKey:(uint64_t)a1;
- (void)_keyItemForKey:(uint64_t)a3 scaleFactor:;
- (void)_removeItem:(uint64_t)a1;
- (void)dealloc;
- (void)removeAllObjects;
- (void)removeObjectForKey:(uint64_t)a1;
- (void)removeObjectForKey:(uint64_t)a3 scaleFactor:;
- (void)setObject:(void *)a3 forKey:(unint64_t)a4 cost:;
- (void)setObject:(void *)a3 forKey:(unint64_t)a4 cost:(uint64_t)a5 scaleFactor:;
@end

@implementation PKLRUCache

- (PKLRUCache)init
{
  v11.receiver = self;
  v11.super_class = (Class)PKLRUCache;
  v2 = [(PKLRUCache *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = [MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:0];
    v5 = [MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:0];
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyPointerFunctions:v4 valuePointerFunctions:v5 capacity:2048];
    itemTable = v3->_itemTable;
    v3->_itemTable = (NSMapTable *)v6;

    v3->_totalCostLimit = 0x4000000;
    uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4096];
    freeKeys = v3->_freeKeys;
    v3->_freeKeys = (NSMutableArray *)v8;
  }
  return v3;
}

- (void)dealloc
{
  -[PKLRUCache removeAllObjects]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)PKLRUCache;
  [(PKLRUCache *)&v3 dealloc];
}

- (void)removeAllObjects
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 56);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    while (1)
    {
      objc_super v3 = *(id **)(a1 + 8);
      if (!v3) {
        break;
      }
      id v4 = v3[3];
      v5 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v4;
      uint64_t v6 = v3;

      id v7 = v6[1];
      v6[1] = 0;

      id v8 = v6[5];
      v6[5] = 0;

      id v9 = v6[4];
      v6[4] = 0;

      id v10 = v3[3];
      v3[3] = 0;
    }
    [*(id *)(a1 + 32) removeAllObjects];
    objc_super v11 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    *(void *)(a1 + 40) = 0;
    os_unfair_lock_unlock(v2);
  }
}

- (char)objectForKey:(char *)a1
{
  id v3 = a2;
  if (a1)
  {
    -[PKLRUCache objectForKey:scaleFactor:](a1, v3, 1);
    a1 = (char *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (void)_keyItemForKey:(uint64_t)a3 scaleFactor:
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    if (a3 == 1)
    {
      p_isa = v5;
    }
    else if ([*(id *)(a1 + 48) count])
    {
      p_isa = [*(id *)(a1 + 48) lastObject];
      [*(id *)(a1 + 48) removeLastObject];
      if (p_isa)
      {
        p_isa[2] = a3;
        objc_setProperty_nonatomic_copy(p_isa, v8, v6, 8);
      }
    }
    else
    {
      id v9 = objc_alloc_init(PKLRUCacheKey);
      p_isa = &v9->super.isa;
      if (v9)
      {
        objc_setProperty_nonatomic_copy(v9, v10, v6, 8);
        p_isa[2] = a3;
      }
    }
  }
  else
  {
    p_isa = 0;
  }

  return p_isa;
}

- (id)checkObjectForKey:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 56);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    id v5 = -[PKLRUCache _keyItemForKey:scaleFactor:](a1, v3, 1);
    uint64_t v6 = [*(id *)(a1 + 32) objectForKey:v5];
    id v7 = (void *)v6;
    if (v6) {
      id v8 = *(void **)(v6 + 40);
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    os_unfair_lock_unlock(v4);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (char)objectForKey:(uint64_t)a3 scaleFactor:
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = (os_unfair_lock_s *)(a1 + 56);
    os_unfair_lock_lock((os_unfair_lock_t)a1 + 14);
    id v7 = -[PKLRUCache _keyItemForKey:scaleFactor:]((uint64_t)a1, v5, a3);
    uint64_t v8 = [*((id *)a1 + 4) objectForKey:v7];
    id v9 = (id *)v8;
    if (v8)
    {
      id v10 = *(id *)(v8 + 40);
      objc_super v11 = (id *)(a1 + 16);
      if (v9 != *((id **)a1 + 2))
      {
        v12 = (id *)v9[4];
        if (v12) {
          objc_storeStrong(v12 + 3, v9[3]);
        }
        v13 = (id *)v9[3];
        if (v13) {
          objc_storeStrong(v13 + 4, v9[4]);
        }
        objc_storeStrong(v9 + 4, *((id *)a1 + 2));
        v15 = (id *)*((void *)a1 + 1);
        v14 = (id *)(a1 + 8);
        if (v9 == v15) {
          objc_storeStrong(v14, v9[3]);
        }
        id v16 = v9[3];
        v9[3] = 0;

        objc_storeStrong((id *)*v11 + 3, v9);
        objc_storeStrong(v11, v9);
      }
    }
    else
    {
      id v10 = 0;
    }
    a1 = (char *)v10;

    os_unfair_lock_unlock(v6);
  }

  return a1;
}

- (void)_removeItem:(uint64_t)a1
{
  id v4 = a2;
  if (!a1) {
    goto LABEL_14;
  }
  id v5 = v4[4];
  v21 = v4;
  uint64_t v6 = v5;
  id v7 = v21[3];
  uint64_t v8 = v7;
  if (v6)
  {
    id v9 = (void *)v6[3];
    v6[3] = v7;

    if (!v8)
    {
      objc_storeStrong((id *)(a1 + 16), v5);
      id v10 = (void *)v6[3];
      v6[3] = 0;
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  objc_super v11 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;

  if (v8)
  {
    v12 = (void *)v8[4];
    v8[4] = 0;

LABEL_7:
    v13 = v6;
    id v10 = (void *)v8[4];
    v8[4] = v13;
    goto LABEL_8;
  }
  id v10 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = 0;
LABEL_8:

  v14 = *(void **)(a1 + 32);
  *(void *)(a1 + 40) -= v21[6];
  [v14 removeObjectForKey:v21[1]];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[*(id *)(a1 + 48) count] <= 0xFFF) {
    [*(id *)(a1 + 48) addObject:v21[1]];
  }
  id v15 = v21[1];
  v21[1] = 0;

  id v16 = v21[5];
  v21[5] = 0;

  id v17 = v21[3];
  v21[3] = 0;

  id v18 = v21[4];
  v21[4] = 0;

  if (*(uint64_t *)(a1 + 72) <= 1023)
  {
    v20 = *(void **)(a1 + 24);
    uint64_t v19 = a1 + 24;
    objc_storeStrong(v21 + 3, v20);
    objc_storeStrong((id *)v19, a2);
    ++*(void *)(v19 + 48);
  }

  id v4 = v21;
LABEL_14:
}

- (void)setObject:(void *)a3 forKey:(unint64_t)a4 cost:
{
  id v8 = a2;
  id v7 = a3;
  if (a1) {
    -[PKLRUCache setObject:forKey:cost:scaleFactor:](a1, v8, v7, a4, 1);
  }
}

- (void)setObject:(void *)a3 forKey:(unint64_t)a4 cost:(uint64_t)a5 scaleFactor:
{
  id v25 = a2;
  id v10 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    objc_super v11 = -[PKLRUCache _keyItemForKey:scaleFactor:](a1, v10, a5);
    v12 = [*(id *)(a1 + 32) objectForKey:v11];
    if (v12) {
      -[PKLRUCache _removeItem:](a1, v12);
    }
    for (i = (void **)(a1 + 8); *i; -[PKLRUCache _removeItem:](a1, *i))
    {
      unint64_t v14 = *(void *)(a1 + 64);
      if (!v14 || *(void *)(a1 + 40) + a4 <= v14) {
        break;
      }
    }
    if (*(uint64_t *)(a1 + 72) < 1)
    {
      id v15 = objc_alloc_init(PKLRUCacheItem);
    }
    else
    {
      id v15 = (PKLRUCacheItem *)*(id *)(a1 + 24);
      objc_storeStrong((id *)(a1 + 24), *(id *)(*(void *)(a1 + 24) + 24));
      --*(void *)(a1 + 72);
      next = v15->_next;
      v15->_next = 0;
    }
    uint64_t v17 = [v11 copyWithZone:0];
    key = v15->_key;
    v15->_key = (NSCopying *)v17;

    objc_storeStrong(&v15->_object, a2);
    v15->_cost = a4;
    uint64_t v19 = v15;
    v20 = v19;
    v21 = (id *)(a1 + 16);
    if (*(void *)(a1 + 8))
    {
      objc_storeStrong((id *)&v19->_prev, *v21);
      objc_storeStrong((id *)*v21 + 3, v15);
      id v22 = v20;
      i = (void **)(a1 + 16);
    }
    else
    {
      objc_storeStrong((id *)(a1 + 16), v15);
      id v22 = *v21;
    }
    id v23 = v22;
    v24 = *i;
    *i = v23;

    [*(id *)(a1 + 32) setObject:v20 forKey:v15->_key];
    *(void *)(a1 + 40) += v15->_cost;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (void)removeObjectForKey:(uint64_t)a1
{
  id v3 = a2;
  if (a1) {
    -[PKLRUCache removeObjectForKey:scaleFactor:](a1, v3, 1);
  }
}

- (void)removeObjectForKey:(uint64_t)a3 scaleFactor:
{
  id v5 = a2;
  if (a1)
  {
    id v8 = v5;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    uint64_t v6 = -[PKLRUCache _keyItemForKey:scaleFactor:](a1, v8, a3);
    id v7 = [*(id *)(a1 + 32) objectForKey:v6];
    if (v7) {
      -[PKLRUCache _removeItem:](a1, v7);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v5 = v8;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freeKeys, 0);
  objc_storeStrong((id *)&self->_itemTable, 0);
  objc_storeStrong((id *)&self->_freeItems, 0);
  objc_storeStrong((id *)&self->_lastItem, 0);

  objc_storeStrong((id *)&self->_firstItem, 0);
}

@end