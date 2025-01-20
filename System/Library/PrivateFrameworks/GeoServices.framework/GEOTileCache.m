@interface GEOTileCache
- (BOOL)containsKey:(void *)a3 cost:(void *)a4;
- (GEOTileCache)init;
- (id)_description;
- (id)description;
- (id)tileForKey:(void *)a3;
- (unint64_t)currentCost;
- (unint64_t)currentCount;
- (unint64_t)maxCapacity;
- (unint64_t)maxCost;
- (void)_evictWithMaxCost:(unint64_t)a3 maxCapacity:(unint64_t)a4;
- (void)_receivedMemoryNotification;
- (void)_removeTileForKey:(void *)a3;
- (void)dealloc;
- (void)enumerate:(id)a3;
- (void)removeAllObjects;
- (void)removeTileForKey:(uint64_t)a3;
- (void)removeTilesMatchingPredicate:(id)a3;
- (void)removeTilesWithKeys:(id)a3;
- (void)setMaxCapacity:(unint64_t)a3;
- (void)setMaxCost:(unint64_t)a3;
- (void)setTile:(void *)a3 forKey:(void *)a4 cost:(uint64_t)a5;
@end

@implementation GEOTileCache

- (id)tileForKey:(void *)a3
{
  v5 = (std::mutex *)(*(void *)(a1 + 8) + 8);
  std::mutex::lock(v5);
  uint64_t v6 = *(void *)(a1 + 8);
  v7 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>((void *)(v6 + 96), a3);
  if (v7)
  {
    std::list<CacheItem>::splice(v6 + 72, *(uint64_t **)(v6 + 80), v6 + 72, (uint64_t *)v7[4]);
    id v8 = *(id *)(*(void *)(*(void *)(a1 + 8) + 80) + 48);
  }
  else
  {
    id v8 = 0;
  }
  std::mutex::unlock(v5);

  return v8;
}

- (void)setTile:(void *)a3 forKey:(void *)a4 cost:(uint64_t)a5
{
  id v21 = a3;
  v9 = (std::mutex *)(a1[1] + 8);
  std::mutex::lock(v9);
  v10 = (void *)a1[1];
  v11 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>(v10 + 12, a4);
  if (v11)
  {
    uint64_t v12 = v11[4];
    objc_storeStrong((id *)(v12 + 48), a3);
    GEOMachAbsoluteTimeGetCurrent();
    *(void *)(v12 + 32) = v13;
    *(void *)(a1[1] + 152) -= *(void *)(v12 + 40);
    *(void *)(a1[1] + 152) += a5;
    *(void *)(v12 + 40) = a5;
    std::list<CacheItem>::splice(a1[1] + 72, *(uint64_t **)(a1[1] + 80), a1[1] + 72, (uint64_t *)v12);
  }
  else
  {
    v16 = operator new(0x38uLL);
    v16[6] = 0;
    *((_OWORD *)v16 + 1) = 0u;
    *((_OWORD *)v16 + 2) = 0u;
    v17 = (void *)v10[10];
    uint64_t v18 = v10[11];
    void *v16 = v10 + 9;
    v16[1] = v17;
    void *v17 = v16;
    v10[10] = v16;
    v10[11] = v18 + 1;
    uint64_t v19 = *(void *)(a1[1] + 80);
    *(_OWORD *)(v19 + 16) = *(_OWORD *)a4;
    objc_storeStrong((id *)(v19 + 48), a3);
    GEOMachAbsoluteTimeGetCurrent();
    *(void *)(v19 + 32) = v20;
    *(void *)(v19 + 40) = a5;
    *(void *)(a1[1] + 152) += a5;
    ++*(void *)(a1[1] + 160);
  }
  uint64_t v14 = a1[1];
  uint64_t v15 = *(void *)(v14 + 80);
  std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::__emplace_unique_key_args<_GEOTileKey,std::piecewise_construct_t const&,std::tuple<_GEOTileKey const&>,std::tuple<>>((float *)(v14 + 96), a4, a4)[4] = v15;
  [a1 _evictWithMaxCost:*(void *)(a1[1] + 144) maxCapacity:*(void *)(a1[1] + 136)];
  std::mutex::unlock(v9);
}

- (void)_evictWithMaxCost:(unint64_t)a3 maxCapacity:(unint64_t)a4
{
  for (i = self->_reserved; *((void *)i + 11); i = self->_reserved)
  {
    if (*((void *)i + 19) <= a3 && *((void *)i + 20) <= a4) {
      break;
    }
    id v8 = (void *)*((void *)i + 9);
    v9 = (void *)((char *)i + 96);
    v10 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>((void *)i + 12, v8 + 2);
    if (v10) {
      std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::erase(v9, v10);
    }
    v11 = (void *)v8[6];
    v8[6] = 0;

    *((void *)self->_reserved + 19) -= v8[5];
    --*((void *)self->_reserved + 20);
    reserved = self->_reserved;
    uint64_t v13 = (uint64_t *)*((void *)reserved + 9);
    uint64_t v14 = *v13;
    *(void *)(v14 + 8) = v13[1];
    *(void *)v13[1] = v14;
    --*((void *)reserved + 11);

    operator delete(v13);
  }
}

- (void)setMaxCost:(unint64_t)a3
{
  v5 = (std::mutex *)((char *)self->_reserved + 8);
  std::mutex::lock(v5);
  *((void *)self->_reserved + 18) = a3;
  [(GEOTileCache *)self _evictWithMaxCost:*((void *)self->_reserved + 18) maxCapacity:*((void *)self->_reserved + 17)];

  std::mutex::unlock(v5);
}

- (void)setMaxCapacity:(unint64_t)a3
{
  v5 = (std::mutex *)((char *)self->_reserved + 8);
  std::mutex::lock(v5);
  *((void *)self->_reserved + 17) = a3;
  [(GEOTileCache *)self _evictWithMaxCost:*((void *)self->_reserved + 18) maxCapacity:*((void *)self->_reserved + 17)];

  std::mutex::unlock(v5);
}

- (GEOTileCache)init
{
  v18.receiver = self;
  v18.super_class = (Class)GEOTileCache;
  id v2 = [(GEOTileCache *)&v18 init];
  if (v2)
  {
    v3 = objc_alloc_init(GEOTileCacheReserved);
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    *(void *)(*((void *)v2 + 1) + 136) = 64;
    *(void *)(*((void *)v2 + 1) + 144) = 0x200000;
    v5 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v6 = [v5 bundleIdentifier];
    int v7 = [v6 isEqualToString:@"com.apple.Maps"];

    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v9 = v8;
    if (v7) {
      v10 = @"MNApplicationDidEnterBackgroundNotification";
    }
    else {
      v10 = @"UIApplicationDidEnterBackgroundNotification";
    }
    [v8 addObserver:v2 selector:sel__enteredBackground_ name:v10 object:0];

    dispatch_source_t v11 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 6uLL, MEMORY[0x1E4F14428]);
    uint64_t v12 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v11;

    objc_initWeak(&location, v2);
    uint64_t v13 = *((void *)v2 + 2);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __20__GEOTileCache_init__block_invoke;
    v15[3] = &unk_1E53D88B0;
    objc_copyWeak(&v16, &location);
    dispatch_source_set_event_handler(v13, v15);
    dispatch_activate(*((dispatch_object_t *)v2 + 2));
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return (GEOTileCache *)v2;
}

void __20__GEOTileCache_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _receivedMemoryNotification];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GEOTileCache;
  [(GEOTileCache *)&v4 dealloc];
}

- (id)_description
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  objc_msgSend(v3, "appendFormat:", @"<%@: %p; maxCost = %lu; maxCapacity = %lu; currentCost = %lu; currentCount = %lu;",
    objc_opt_class(),
    self,
    *((void *)self->_reserved + 18),
    *((void *)self->_reserved + 17),
    *((void *)self->_reserved + 19),
    *((void *)self->_reserved + 20));
  reserved = self->_reserved;
  v5 = (char *)reserved + 72;
  uint64_t v6 = *((void *)reserved + 10);
  if ((GEOTileCacheReserved *)v6 != (GEOTileCacheReserved *)((char *)reserved + 72))
  {
    do
    {
      long long v7 = *(_OWORD *)(v6 + 32);
      long long v12 = *(_OWORD *)(v6 + 16);
      long long v13 = v7;
      id v14 = *(id *)(v6 + 48);
      id v8 = GEOStringFromTileKey((char *)&v12);
      id v9 = v14;
      v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*(double *)&v13];
      [v3 appendFormat:@"\n    %@=>%@ (inserted: %@, cost: %lu)", v8, v9, v10, *((void *)&v13 + 1)];

      uint64_t v6 = *(void *)(v6 + 8);
    }
    while ((char *)v6 != v5);
  }
  [v3 appendFormat:@">"];

  return v3;
}

- (id)description
{
  v3 = (std::mutex *)((char *)self->_reserved + 8);
  std::mutex::lock(v3);
  objc_super v4 = [(GEOTileCache *)self _description];
  std::mutex::unlock(v3);

  return v4;
}

- (void)_receivedMemoryNotification
{
  v3 = (std::mutex *)((char *)self->_reserved + 8);
  std::mutex::lock(v3);
  [(GEOTileCache *)self _evictWithMaxCost:*((void *)self->_reserved + 18) >> 1 maxCapacity:*((void *)self->_reserved + 17) >> 1];

  std::mutex::unlock(v3);
}

- (unint64_t)maxCapacity
{
  v3 = (std::mutex *)((char *)self->_reserved + 8);
  std::mutex::lock(v3);
  unint64_t v4 = *((void *)self->_reserved + 17);
  std::mutex::unlock(v3);
  return v4;
}

- (unint64_t)maxCost
{
  v3 = (std::mutex *)((char *)self->_reserved + 8);
  std::mutex::lock(v3);
  unint64_t v4 = *((void *)self->_reserved + 18);
  std::mutex::unlock(v3);
  return v4;
}

- (BOOL)containsKey:(void *)a3 cost:(void *)a4
{
  long long v7 = (std::mutex *)(*(void *)(a1 + 8) + 8);
  std::mutex::lock(v7);
  id v8 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>((void *)(*(void *)(a1 + 8) + 96), a3);
  if (a4 && v8) {
    *a4 = *(void *)(v8[4] + 40);
  }
  BOOL v9 = v8 != 0;
  std::mutex::unlock(v7);
  return v9;
}

- (void)_removeTileForKey:(void *)a3
{
  unint64_t v4 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>((void *)(*(void *)(a1 + 8) + 96), a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = v4[4];
    long long v7 = *(void **)(v6 + 48);
    *(void *)(v6 + 48) = 0;

    *(void *)(*(void *)(a1 + 8) + 152) -= *(void *)(v6 + 40);
    --*(void *)(*(void *)(a1 + 8) + 160);
    uint64_t v8 = *(void *)(a1 + 8);
    uint64_t v9 = *(void *)v6;
    *(void *)(v9 + 8) = *(void *)(v6 + 8);
    **(void **)(v6 + 8) = v9;
    --*(void *)(v8 + 88);

    operator delete((void *)v6);
    v10 = (void *)(*(void *)(a1 + 8) + 96);
    std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::erase(v10, v5);
  }
}

- (void)removeTileForKey:(uint64_t)a3
{
  v5 = (std::mutex *)(a1[1] + 8);
  std::mutex::lock(v5);
  [a1 _removeTileForKey:a3];

  std::mutex::unlock(v5);
}

- (void)removeTilesWithKeys:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (std::mutex *)((char *)self->_reserved + 8);
  std::mutex::lock(v5);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        -[GEOTileCache _removeTileForKey:](self, "_removeTileForKey:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  std::mutex::unlock(v5);
}

- (void)removeAllObjects
{
  v3 = (std::mutex *)((char *)self->_reserved + 8);
  std::mutex::lock(v3);
  reserved = self->_reserved;
  v5 = (uint64_t *)((char *)reserved + 72);
  for (uint64_t i = (uint64_t *)*((void *)reserved + 10); i != v5; uint64_t i = (uint64_t *)i[1])
    ;
  std::__list_imp<CacheItem>::clear(v5);
  uint64_t v7 = self->_reserved;
  if (*((void *)v7 + 15))
  {
    uint64_t v8 = (void *)*((void *)v7 + 14);
    if (v8)
    {
      do
      {
        uint64_t v9 = (void *)*v8;
        operator delete(v8);
        uint64_t v8 = v9;
      }
      while (v9);
    }
    *((void *)v7 + 14) = 0;
    uint64_t v10 = *((void *)v7 + 13);
    if (v10)
    {
      for (uint64_t j = 0; j != v10; ++j)
        *(void *)(*((void *)v7 + 12) + 8 * j) = 0;
    }
    *((void *)v7 + 15) = 0;
    uint64_t v7 = self->_reserved;
  }
  *((void *)v7 + 19) = 0;
  *((void *)self->_reserved + 20) = 0;

  std::mutex::unlock(v3);
}

- (void)enumerate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, _OWORD *, id, double))a3;
  if (v4)
  {
    v17 = &v17;
    objc_super v18 = (uint64_t *)&v17;
    uint64_t v19 = 0;
    v5 = (std::mutex *)((char *)self->_reserved + 8);
    std::mutex::lock(v5);
    reserved = self->_reserved;
    uint64_t v7 = (char *)reserved + 72;
    uint64_t v8 = *((void *)reserved + 10);
    if ((GEOTileCacheReserved *)v8 != (GEOTileCacheReserved *)((char *)reserved + 72))
    {
      do
      {
        long long v9 = *(_OWORD *)(v8 + 32);
        long long v20 = *(_OWORD *)(v8 + 16);
        long long v21 = v9;
        id v10 = *(id *)(v8 + 48);
        long long v11 = operator new(0x38uLL);
        long long v12 = v21;
        v11[1] = v20;
        v11[2] = v12;
        id v13 = v10;
        *((void *)v11 + 6) = v13;
        uint64_t v14 = (uint64_t)v17;
        *(void *)long long v11 = v17;
        *((void *)v11 + 1) = &v17;
        *(void *)(v14 + 8) = v11;
        v17 = v11;
        ++v19;

        uint64_t v8 = *(void *)(v8 + 8);
      }
      while ((char *)v8 != v7);
    }
    std::mutex::unlock(v5);
    for (uint64_t i = v18; i != (uint64_t *)&v17; uint64_t i = (uint64_t *)i[1])
    {
      long long v16 = *((_OWORD *)i + 2);
      long long v20 = *((_OWORD *)i + 1);
      long long v21 = v16;
      id v22 = (id)i[6];
      v4[2](v4, &v20, v22, *(double *)&v21);
    }
    std::__list_imp<CacheItem>::clear((uint64_t *)&v17);
  }
}

- (void)removeTilesMatchingPredicate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x4812000000;
  uint64_t v15 = __Block_byref_object_copy__4;
  long long v16 = __Block_byref_object_dispose__4;
  uint64_t v17 = 0;
  v18[0] = v18;
  v18[1] = v18;
  v18[2] = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__GEOTileCache_removeTilesMatchingPredicate___block_invoke;
  v9[3] = &unk_1E53D88D8;
  id v5 = v4;
  id v10 = v5;
  long long v11 = &v12;
  [(GEOTileCache *)self enumerate:v9];
  if (v13[8])
  {
    id v6 = (std::mutex *)((char *)self->_reserved + 8);
    std::mutex::lock(v6);
    uint64_t v7 = v13 + 6;
    for (uint64_t i = v13[7]; (void *)i != v7; uint64_t i = *(void *)(i + 8))
    {
      long long v19 = *(_OWORD *)(i + 16);
      [(GEOTileCache *)self _removeTileForKey:&v19];
    }
    std::mutex::unlock(v6);
  }

  _Block_object_dispose(&v12, 8);
  std::__list_imp<std::__list_iterator<LoadItem,void *>>::clear(v18);
}

void __45__GEOTileCache_removeTilesMatchingPredicate___block_invoke(uint64_t a1, _OWORD *a2, void *a3, double a4)
{
  id v11 = a3;
  if ((*(unsigned int (**)(double))(*(void *)(a1 + 32) + 16))(a4))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = operator new(0x20uLL);
    v8[1] = *a2;
    long long v9 = *(void **)(v7 + 56);
    uint64_t v10 = *(void *)(v7 + 64);
    *(void *)uint64_t v8 = v7 + 48;
    *((void *)v8 + 1) = v9;
    void *v9 = v8;
    *(void *)(v7 + 56) = v8;
    *(void *)(v7 + 64) = v10 + 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryNotificationEventSource, 0);

  objc_storeStrong((id *)&self->_reserved, 0);
}

- (unint64_t)currentCount
{
  return *((void *)self->_reserved + 20);
}

- (unint64_t)currentCost
{
  return *((void *)self->_reserved + 19);
}

@end