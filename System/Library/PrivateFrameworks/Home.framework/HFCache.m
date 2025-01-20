@interface HFCache
- (BOOL)_canAccommodateCost:(unint64_t)a3;
- (BOOL)_canAccommodateCostWithoutRemoval:(unint64_t)a3;
- (BOOL)_removeObjectsToAccommodateCost:(unint64_t)a3;
- (BOOL)canAccommodateCost:(unint64_t)a3;
- (BOOL)removeObjectsToAccommodateCost:(unint64_t)a3;
- (HFCache)initWithDelegate:(id)a3;
- (HFCacheDelegate)delegate;
- (NSMapTable)mapTable;
- (OS_dispatch_queue)accessQueue;
- (id)_overrideObjectEvictionComparator;
- (id)defaultObjectEvictionComparator;
- (id)description;
- (id)objectForKey:(id)a3;
- (id)overrideObjectEvictionComparator;
- (unint64_t)_totalCost;
- (unint64_t)_totalCostLimit;
- (unint64_t)count;
- (unint64_t)totalCost;
- (unint64_t)totalCostLimit;
- (void)_didEvictObject:(id)a3 forKey:(id)a4 cost:(unint64_t)a5;
- (void)_removeObjectForKey:(id)a3;
- (void)_setObject:(id)a3 forKey:(id)a4 cost:(unint64_t)a5 removeObjectsToAccommodateCost:(BOOL)a6;
- (void)_setOverrideObjectEvictionComparator:(id)a3;
- (void)_setTotalCost:(unint64_t)a3;
- (void)_setTotalCostLimit:(unint64_t)a3;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setAccessQueue:(id)a3;
- (void)setMapTable:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4 cost:(unint64_t)a5;
- (void)setObject:(id)a3 forKey:(id)a4 cost:(unint64_t)a5 removeObjectsToAccommodateCost:(BOOL)a6;
- (void)setOverrideObjectEvictionComparator:(id)a3;
- (void)setTotalCost:(unint64_t)a3;
- (void)setTotalCostLimit:(unint64_t)a3;
@end

@implementation HFCache

- (HFCache)initWithDelegate:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HFCache;
  v5 = [(HFCache *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    mapTable = v6->_mapTable;
    v6->_mapTable = (NSMapTable *)v7;

    v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.Home.HFCache.accessQueue", v9);
    accessQueue = v6->_accessQueue;
    v6->_accessQueue = (OS_dispatch_queue *)v10;

    id defaultObjectEvictionComparator = v6->_defaultObjectEvictionComparator;
    v6->_id defaultObjectEvictionComparator = &__block_literal_global_133;
  }
  return v6;
}

uint64_t __28__HFCache_initWithDelegate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8 = [NSNumber numberWithUnsignedInteger:a7];
  v9 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v10 = [v8 compare:v9];

  return v10;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v13 = 0;
  objc_super v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__19;
  v17 = __Block_byref_object_dispose__19;
  id v18 = 0;
  v6 = [(HFCache *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__HFCache_objectForKey___block_invoke;
  block[3] = &unk_2640974A0;
  block[4] = self;
  id v11 = v4;
  v12 = &v13;
  id v7 = v4;
  dispatch_sync(v6, block);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __24__HFCache_objectForKey___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) mapTable];
  id v6 = [v2 objectForKey:*(void *)(a1 + 40)];

  uint64_t v3 = [v6 object];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)setObject:(id)a3 forKey:(id)a4 cost:(unint64_t)a5 removeObjectsToAccommodateCost:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_not_V2(v12);

  uint64_t v13 = [(HFCache *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__HFCache_setObject_forKey_cost_removeObjectsToAccommodateCost___block_invoke;
  block[3] = &unk_2640974C8;
  id v17 = v10;
  id v18 = self;
  id v19 = v11;
  unint64_t v20 = a5;
  BOOL v21 = a6;
  id v14 = v11;
  id v15 = v10;
  dispatch_async(v13, block);
}

uint64_t __64__HFCache_setObject_forKey_cost_removeObjectsToAccommodateCost___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3) {
    return [v2 _setObject:v3 forKey:*(void *)(a1 + 48) cost:*(void *)(a1 + 56) removeObjectsToAccommodateCost:*(unsigned __int8 *)(a1 + 64)];
  }
  else {
    return [v2 _removeObjectForKey:*(void *)(a1 + 48)];
  }
}

- (void)_setObject:(id)a3 forKey:(id)a4 cost:(unint64_t)a5 removeObjectsToAccommodateCost:(BOOL)a6
{
  BOOL v6 = a6;
  id v14 = a3;
  id v10 = a4;
  id v11 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_V2(v11);

  if (!v6 || [(HFCache *)self _removeObjectsToAccommodateCost:a5])
  {
    v12 = [[HFCacheEntry alloc] initWithKey:v10 object:v14 cost:a5];
    uint64_t v13 = [(HFCache *)self mapTable];
    [v13 setObject:v12 forKey:v10];

    [(HFCache *)self _setTotalCost:[(HFCache *)self _totalCost] + a5];
  }
}

- (void)setObject:(id)a3 forKey:(id)a4 cost:(unint64_t)a5
{
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  BOOL v6 = [(HFCache *)self accessQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __30__HFCache_removeObjectForKey___block_invoke;
  v8[3] = &unk_26408D450;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __30__HFCache_removeObjectForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)_removeObjectForKey:(id)a3
{
  id v11 = a3;
  v5 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(HFCache *)self mapTable];
  id v7 = [v6 objectForKey:v11];

  if (!v7)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HFCache.m", 149, @"%@ does not exist in cache", v11 object file lineNumber description];
  }
  id v8 = [(HFCache *)self mapTable];
  [v8 removeObjectForKey:v11];

  unint64_t v9 = [(HFCache *)self _totalCost];
  [v7 cost];
  -[HFCache _setTotalCost:](self, "_setTotalCost:", v9 - [v7 cost]);
}

- (void)removeAllObjects
{
  uint64_t v3 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_not_V2(v3);

  id v4 = [(HFCache *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__HFCache_removeAllObjects__block_invoke;
  block[3] = &unk_26408DDE0;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __27__HFCache_removeAllObjects__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) mapTable];
  [v2 removeAllObjects];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 _setTotalCost:0];
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  BOOL v6 = [(HFCache *)self accessQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__HFCache_enumerateKeysAndObjectsUsingBlock___block_invoke;
  v8[3] = &unk_26408D5B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __45__HFCache_enumerateKeysAndObjectsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [*(id *)(a1 + 32) mapTable];
  uint64_t v3 = [v2 keyEnumerator];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
      id v9 = [*(id *)(a1 + 32) mapTable];
      id v10 = [v9 objectForKey:v8];

      unsigned __int8 v13 = 0;
      uint64_t v11 = *(void *)(a1 + 40);
      v12 = [v10 object];
      (*(void (**)(uint64_t, uint64_t, void *, unsigned __int8 *))(v11 + 16))(v11, v8, v12, &v13);

      LODWORD(v8) = v13;
      if (v8) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)canAccommodateCost:(unint64_t)a3
{
  uint64_t v5 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v6 = [(HFCache *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__HFCache_canAccommodateCost___block_invoke;
  block[3] = &unk_2640974F0;
  void block[4] = self;
  void block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v6, block);

  LOBYTE(a3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return a3;
}

uint64_t __30__HFCache_canAccommodateCost___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _canAccommodateCost:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_canAccommodateCost:(unint64_t)a3
{
  uint64_t v5 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  return [(HFCache *)self _totalCostLimit] >= a3;
}

- (BOOL)removeObjectsToAccommodateCost:(unint64_t)a3
{
  uint64_t v5 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v6 = [(HFCache *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__HFCache_removeObjectsToAccommodateCost___block_invoke;
  block[3] = &unk_2640974F0;
  void block[4] = self;
  void block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v6, block);

  LOBYTE(a3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return a3;
}

uint64_t __42__HFCache_removeObjectsToAccommodateCost___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _removeObjectsToAccommodateCost:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_removeObjectsToAccommodateCost:(unint64_t)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HFCache *)self _canAccommodateCostWithoutRemoval:a3]) {
    return 1;
  }
  uint64_t v7 = [(HFCache *)self _overrideObjectEvictionComparator];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = _Block_copy(v7);
  }
  else
  {
    id v10 = [(HFCache *)self defaultObjectEvictionComparator];
    uint64_t v9 = _Block_copy(v10);
  }
  uint64_t v11 = [(HFCache *)self mapTable];
  char v12 = [v11 objectEnumerator];
  unsigned __int8 v13 = [v12 allObjects];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __43__HFCache__removeObjectsToAccommodateCost___block_invoke;
  v28[3] = &unk_264097518;
  id v14 = v9;
  id v29 = v14;
  long long v15 = [v13 sortedArrayUsingComparator:v28];
  long long v16 = (void *)[v15 mutableCopy];

  if ([(HFCache *)self _canAccommodateCostWithoutRemoval:a3])
  {
LABEL_9:
    BOOL v6 = 1;
  }
  else
  {
    while (1)
    {
      uint64_t v17 = [v16 firstObject];
      if (!v17) {
        break;
      }
      id v18 = (void *)v17;
      uint64_t v19 = [(HFCache *)self mapTable];
      unint64_t v20 = [v18 key];
      [v19 removeObjectForKey:v20];

      [v16 removeObjectAtIndex:0];
      -[HFCache _setTotalCost:](self, "_setTotalCost:", -[HFCache _totalCost](self, "_totalCost") - [v18 cost]);
      BOOL v21 = [v18 object];
      v22 = [v18 key];
      -[HFCache _didEvictObject:forKey:cost:](self, "_didEvictObject:forKey:cost:", v21, v22, [v18 cost]);

      if ([(HFCache *)self _canAccommodateCostWithoutRemoval:a3]) {
        goto LABEL_9;
      }
    }
    v23 = HFLogForCategory(0xDuLL);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v25 = [NSNumber numberWithUnsignedInteger:a3];
      v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFCache _totalCost](self, "_totalCost"));
      v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFCache _totalCostLimit](self, "_totalCostLimit"));
      *(_DWORD *)buf = 136315906;
      v31 = "-[HFCache _removeObjectsToAccommodateCost:]";
      __int16 v32 = 2112;
      v33 = v25;
      __int16 v34 = 2112;
      v35 = v26;
      __int16 v36 = 2112;
      v37 = v27;
      _os_log_error_impl(&dword_20B986000, v23, OS_LOG_TYPE_ERROR, "%s cannot remove enough cache entries to accommodate cost: %@; totalCost: %@; totalCostLimit: %@",
        buf,
        0x2Au);
    }
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __43__HFCache__removeObjectsToAccommodateCost___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 key];
  uint64_t v8 = [v6 object];
  uint64_t v9 = [v6 cost];

  id v10 = [v5 key];
  uint64_t v11 = [v5 object];
  uint64_t v12 = [v5 cost];

  uint64_t v13 = (*(uint64_t (**)(uint64_t, void *, void *, uint64_t, void *, void *, uint64_t))(v4 + 16))(v4, v7, v8, v9, v10, v11, v12);
  return v13;
}

- (BOOL)_canAccommodateCostWithoutRemoval:(unint64_t)a3
{
  id v5 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  unint64_t v6 = [(HFCache *)self _totalCost] + a3;
  return v6 <= [(HFCache *)self _totalCostLimit];
}

- (void)_didEvictObject:(id)a3 forKey:(id)a4 cost:(unint64_t)a5
{
  id v13 = a3;
  id v8 = a4;
  uint64_t v9 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(HFCache *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    uint64_t v12 = [(HFCache *)self delegate];
    [v12 cache:self didEvictObject:v13 forKey:v8 cost:a5];
  }
}

- (unint64_t)count
{
  uint64_t v3 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  uint64_t v4 = [(HFCache *)self accessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __16__HFCache_count__block_invoke;
  v7[3] = &unk_26408FE10;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __16__HFCache_count__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapTable];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (void)_setTotalCost:(unint64_t)a3
{
  unint64_t v5 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  self->_totalCost = a3;
}

- (unint64_t)totalCost
{
  uint64_t v3 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  uint64_t v4 = [(HFCache *)self accessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __20__HFCache_totalCost__block_invoke;
  v7[3] = &unk_26408FE10;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __20__HFCache_totalCost__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _totalCost];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)_totalCost
{
  uint64_t v3 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  return self->_totalCost;
}

- (void)setTotalCostLimit:(unint64_t)a3
{
  unint64_t v5 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  unint64_t v6 = [(HFCache *)self accessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__HFCache_setTotalCostLimit___block_invoke;
  v7[3] = &unk_26408FE38;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(v6, v7);
}

uint64_t __29__HFCache_setTotalCostLimit___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setTotalCostLimit:*(void *)(a1 + 40)];
}

- (void)_setTotalCostLimit:(unint64_t)a3
{
  unint64_t v5 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  self->_totalCostLimit = a3;
}

- (unint64_t)totalCostLimit
{
  uint64_t v3 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  uint64_t v4 = [(HFCache *)self accessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __25__HFCache_totalCostLimit__block_invoke;
  v7[3] = &unk_26408FE10;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __25__HFCache_totalCostLimit__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _totalCostLimit];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)_totalCostLimit
{
  uint64_t v3 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  return self->_totalCostLimit;
}

- (void)setOverrideObjectEvictionComparator:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  unint64_t v6 = [(HFCache *)self accessQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__HFCache_setOverrideObjectEvictionComparator___block_invoke;
  v8[3] = &unk_26408D5B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __47__HFCache_setOverrideObjectEvictionComparator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setOverrideObjectEvictionComparator:*(void *)(a1 + 40)];
}

- (void)_setOverrideObjectEvictionComparator:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  unint64_t v6 = (void *)[v4 copy];
  id overrideObjectEvictionComparator = self->_overrideObjectEvictionComparator;
  self->_id overrideObjectEvictionComparator = v6;
}

- (id)overrideObjectEvictionComparator
{
  uint64_t v3 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__48;
  uint64_t v12 = __Block_byref_object_dispose__49;
  id v13 = 0;
  id v4 = [(HFCache *)self accessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__HFCache_overrideObjectEvictionComparator__block_invoke;
  v7[3] = &unk_26408FE10;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  unint64_t v5 = _Block_copy((const void *)v9[5]);
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __43__HFCache_overrideObjectEvictionComparator__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _overrideObjectEvictionComparator];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)_overrideObjectEvictionComparator
{
  uint64_t v3 = [(HFCache *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = (void *)[self->_overrideObjectEvictionComparator copy];
  return v4;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x263F58188] builderWithObject:self];
  uint64_t v4 = [(HFCache *)self accessQueue];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __22__HFCache_description__block_invoke;
  uint64_t v11 = &unk_26408D450;
  id v12 = v3;
  id v13 = self;
  id v5 = v3;
  dispatch_sync(v4, &v8);

  unint64_t v6 = objc_msgSend(v5, "build", v8, v9, v10, v11);

  return v6;
}

void __22__HFCache_description__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) mapTable];
  uint64_t v2 = [v5 objectEnumerator];
  uint64_t v3 = [v2 allObjects];
  id v4 = (id)[v1 appendObject:v3 withName:@"entries"];
}

- (void)setTotalCost:(unint64_t)a3
{
  self->_totalCost = a3;
}

- (id)defaultObjectEvictionComparator
{
  return self->_defaultObjectEvictionComparator;
}

- (HFCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HFCacheDelegate *)WeakRetained;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (NSMapTable)mapTable
{
  return self->_mapTable;
}

- (void)setMapTable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapTable, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_defaultObjectEvictionComparator, 0);
  objc_storeStrong(&self->_overrideObjectEvictionComparator, 0);
}

@end