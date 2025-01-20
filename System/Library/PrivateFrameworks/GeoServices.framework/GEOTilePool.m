@interface GEOTilePool
- (GEOTileData)tileForKey:(void *)a3;
- (GEOTilePool)init;
- (GEOTilePool)initWithSideCacheEnabled:(BOOL)a3;
- (id).cxx_construct;
- (uint64_t)containsKey:(void *)a3 cost:(void *)a4;
- (uint64_t)enumerate:;
- (uint64_t)removeTileForKey:(void *)a3;
- (uint64_t)removeTilesMatchingPredicate:;
- (unint64_t)currentCost;
- (unint64_t)currentCount;
- (unint64_t)maxCapacity;
- (unint64_t)maxCost;
- (void)_receivedMemoryNotification;
- (void)enumerate:;
- (void)enumerate:(id)a3;
- (void)removeAllObjects;
- (void)removeTilesMatchingPredicate:;
- (void)removeTilesMatchingPredicate:(id)a3;
- (void)removeTilesWithKeys:(id)a3;
- (void)setMaxCapacity:(unint64_t)a3;
- (void)setMaxCost:(unint64_t)a3;
- (void)setTile:(void *)a3 forKey:(void *)a4 cost:(uint64_t)a5;
@end

@implementation GEOTilePool

- (GEOTileData)tileForKey:(void *)a3
{
  objc_msgSend(*(id *)(a1 + 336), "tileForKey:");
  v5 = (GEOTileData *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    std::mutex::lock((std::mutex *)(a1 + 16));
    v6 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>((void *)(a1 + 104), a3);
    if (v6)
    {
      std::list<CacheItem>::splice(a1 + 80, *(uint64_t **)(a1 + 88), a1 + 80, (uint64_t *)v6[4]);
      objc_copyWeak(&to, (id *)(*(void *)(a1 + 88) + 48));
    }
    else
    {
      id to = 0;
    }
    std::mutex::unlock((std::mutex *)(a1 + 16));
    v5 = (GEOTileData *)objc_loadWeakRetained(&to);
    objc_storeWeak(&to, 0);
    objc_destroyWeak(&to);
    if (!v5)
    {
      std::mutex::lock((std::mutex *)(a1 + 176));
      v7 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>((void *)(a1 + 264), a3);
      if (v7)
      {
        std::list<CacheItem>::splice(a1 + 240, *(uint64_t **)(a1 + 248), a1 + 240, (uint64_t *)v7[4]);
        uint64_t v8 = *(void *)(a1 + 248);
        uint64_t v9 = *(void *)(v8 + 40);
        objc_copyWeak(&to, (id *)(v8 + 48));
      }
      else
      {
        uint64_t v9 = 0;
        id to = 0;
      }
      std::mutex::unlock((std::mutex *)(a1 + 176));
      id v10 = objc_loadWeakRetained(&to);
      objc_storeWeak(&to, 0);
      objc_destroyWeak(&to);
      if (v10)
      {
        v5 = [[GEOTileData alloc] initWithDecodedRepresentation:v10];
        [(id)a1 setTile:v5 forKey:a3 cost:v9];
      }
      else
      {
        v5 = 0;
      }
    }
  }

  return v5;
}

- (void)setTile:(void *)a3 forKey:(void *)a4 cost:(uint64_t)a5
{
  id v8 = a3;
  objc_initWeak(&location, v8);
  std::mutex::lock((std::mutex *)(a1 + 16));
  uint64_t v9 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>((void *)(a1 + 104), a4);
  if (v9)
  {
    uint64_t v10 = v9[4];
    *(void *)(a1 + 160) += a5 - *(void *)(v10 + 40);
    GEOMachAbsoluteTimeGetCurrent();
    *(void *)(v10 + 32) = v11;
    geo::_geo_weak_ptr<GEOTileData * {__strong}>::operator=((id *)(v10 + 48), &location);
    *(void *)(v10 + 40) = a5;
    std::list<CacheItem>::splice(a1 + 80, *(uint64_t **)(a1 + 88), a1 + 80, (uint64_t *)v10);
    uint64_t v12 = *(void *)(a1 + 88);
    std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,GEOTileData * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,GEOTileData * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,GEOTileData * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::equal_to<_GEOTileKey>,std::hash<_GEOTileKey>,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,GEOTileData * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>>>::__emplace_unique_key_args<_GEOTileKey,std::piecewise_construct_t const&,std::tuple<_GEOTileKey const&>,std::tuple<>>((float *)(a1 + 104), a4, a4)[4] = v12;
  }
  else
  {
    v13 = operator new(0x38uLL);
    *((_OWORD *)v13 + 2) = 0u;
    *((void *)v13 + 6) = 0;
    *(_OWORD *)v13 = 0u;
    *((_OWORD *)v13 + 1) = 0u;
    v14 = *(void **)(a1 + 88);
    *(void *)v13 = a1 + 80;
    *((void *)v13 + 1) = v14;
    void *v14 = v13;
    uint64_t v15 = *(void *)(a1 + 96) + 1;
    *(void *)(a1 + 88) = v13;
    *(void *)(a1 + 96) = v15;
    *((_OWORD *)v13 + 1) = *(_OWORD *)a4;
    *((void *)v13 + 5) = a5;
    geo::_geo_weak_ptr<GEOTileData * {__strong}>::operator=((id *)v13 + 6, &location);
    GEOMachAbsoluteTimeGetCurrent();
    *((void *)v13 + 4) = v16;
    uint64_t v17 = *(void *)(a1 + 88);
    std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,GEOTileData * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,GEOTileData * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,GEOTileData * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::equal_to<_GEOTileKey>,std::hash<_GEOTileKey>,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,GEOTileData * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>>>::__emplace_unique_key_args<_GEOTileKey,std::piecewise_construct_t const&,std::tuple<_GEOTileKey const&>,std::tuple<>>((float *)(a1 + 104), a4, a4)[4] = v17;
    int64x2_t v18 = vdupq_n_s64(1uLL);
    v18.i64[0] = a5;
    *(int64x2_t *)(a1 + 160) = vaddq_s64(*(int64x2_t *)(a1 + 160), v18);
  }
  std::mutex::unlock((std::mutex *)(a1 + 16));
  v19 = [v8 decodedRepresentation];

  if (v19)
  {
    v20 = [v8 decodedRepresentation];
    objc_initWeak(&v31, v20);

    std::mutex::lock((std::mutex *)(a1 + 176));
    v21 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>((void *)(a1 + 264), a4);
    if (v21)
    {
      uint64_t v22 = v21[4];
      *(void *)(a1 + 320) += a5 - *(void *)(v22 + 40);
      GEOMachAbsoluteTimeGetCurrent();
      *(void *)(v22 + 32) = v23;
      geo::_geo_weak_ptr<GEOTileData * {__strong}>::operator=((id *)(v22 + 48), &v31);
      *(void *)(v22 + 40) = a5;
      std::list<CacheItem>::splice(a1 + 240, *(uint64_t **)(a1 + 248), a1 + 240, (uint64_t *)v22);
      uint64_t v24 = *(void *)(a1 + 248);
      std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::equal_to<_GEOTileKey>,std::hash<_GEOTileKey>,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>>>::__emplace_unique_key_args<_GEOTileKey,std::piecewise_construct_t const&,std::tuple<_GEOTileKey const&>,std::tuple<>>((float *)(a1 + 264), a4, a4)[4] = v24;
    }
    else
    {
      v25 = operator new(0x38uLL);
      *((_OWORD *)v25 + 2) = 0u;
      *((void *)v25 + 6) = 0;
      *(_OWORD *)v25 = 0u;
      *((_OWORD *)v25 + 1) = 0u;
      v26 = *(void **)(a1 + 248);
      *(void *)v25 = a1 + 240;
      *((void *)v25 + 1) = v26;
      void *v26 = v25;
      uint64_t v27 = *(void *)(a1 + 256) + 1;
      *(void *)(a1 + 248) = v25;
      *(void *)(a1 + 256) = v27;
      *((_OWORD *)v25 + 1) = *(_OWORD *)a4;
      *((void *)v25 + 5) = a5;
      geo::_geo_weak_ptr<GEOTileData * {__strong}>::operator=((id *)v25 + 6, &v31);
      GEOMachAbsoluteTimeGetCurrent();
      *((void *)v25 + 4) = v28;
      uint64_t v29 = *(void *)(a1 + 248);
      std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::equal_to<_GEOTileKey>,std::hash<_GEOTileKey>,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>>>::__emplace_unique_key_args<_GEOTileKey,std::piecewise_construct_t const&,std::tuple<_GEOTileKey const&>,std::tuple<>>((float *)(a1 + 264), a4, a4)[4] = v29;
      int64x2_t v30 = vdupq_n_s64(1uLL);
      v30.i64[0] = a5;
      *(int64x2_t *)(a1 + 320) = vaddq_s64(*(int64x2_t *)(a1 + 320), v30);
    }
    std::mutex::unlock((std::mutex *)(a1 + 176));
    objc_storeWeak(&v31, 0);
    objc_destroyWeak(&v31);
  }
  [*(id *)(a1 + 336) setTile:v8 forKey:a4 cost:a5];
  objc_storeWeak(&location, 0);
  objc_destroyWeak(&location);
}

- (void)setMaxCost:(unint64_t)a3
{
  v5 = (int64x2_t *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  *((void *)self + 19) = a3;
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_prune((uint64_t)v5);
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_evictWithMaxCostAndCapacity(v5, *((void *)self + 19), *((void *)self + 18));
  std::mutex::unlock((std::mutex *)v5);
  std::mutex::lock((std::mutex *)((char *)self + 176));
  *((void *)self + 39) = a3;
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_prune((uint64_t)self + 176);
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_evictWithMaxCostAndCapacity((int64x2_t *)self + 11, *((void *)self + 39), *((void *)self + 38));
  std::mutex::unlock((std::mutex *)((char *)self + 176));
  if (a3 >= 0x400000) {
    unint64_t v6 = 0x400000;
  }
  else {
    unint64_t v6 = a3;
  }
  v7 = (void *)*((void *)self + 42);

  [v7 setMaxCost:v6];
}

- (void)setMaxCapacity:(unint64_t)a3
{
  v5 = (int64x2_t *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  *((void *)self + 18) = a3;
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_prune((uint64_t)v5);
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_evictWithMaxCostAndCapacity(v5, *((void *)self + 19), *((void *)self + 18));
  std::mutex::unlock((std::mutex *)v5);
  std::mutex::lock((std::mutex *)((char *)self + 176));
  *((void *)self + 38) = a3;
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_prune((uint64_t)self + 176);
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_evictWithMaxCostAndCapacity((int64x2_t *)self + 11, *((void *)self + 39), *((void *)self + 38));
  std::mutex::unlock((std::mutex *)((char *)self + 176));
  if (a3 >= 0x20) {
    unint64_t v6 = 32;
  }
  else {
    unint64_t v6 = a3;
  }
  v7 = (void *)*((void *)self + 42);

  [v7 setMaxCapacity:v6];
}

- (GEOTilePool)init
{
  return [(GEOTilePool *)self initWithSideCacheEnabled:1];
}

- (GEOTilePool)initWithSideCacheEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v24.receiver = self;
  v24.super_class = (Class)GEOTilePool;
  id v4 = [(GEOTilePool *)&v24 init];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28B50] mainBundle];
    unint64_t v6 = [v5 bundleIdentifier];
    int v7 = [v6 isEqualToString:@"com.apple.Maps"];

    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v9 = v8;
    if (v7) {
      uint64_t v10 = @"MNApplicationDidEnterBackgroundNotification";
    }
    else {
      uint64_t v10 = @"UIApplicationDidEnterBackgroundNotification";
    }
    [v8 addObserver:v4 selector:sel__enteredBackground_ name:v10 object:0];

    dispatch_source_t v11 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 6uLL, MEMORY[0x1E4F14428]);
    uint64_t v12 = (void *)*((void *)v4 + 1);
    *((void *)v4 + 1) = v11;

    objc_initWeak(&location, v4);
    v13 = *((void *)v4 + 1);
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __40__GEOTilePool_initWithSideCacheEnabled___block_invoke;
    v21 = &unk_1E53D88B0;
    objc_copyWeak(&v22, &location);
    dispatch_source_set_event_handler(v13, &v18);
    dispatch_activate(*((dispatch_object_t *)v4 + 1));
    if (v3)
    {
      v14 = objc_alloc_init(GEOTileCache);
      uint64_t v15 = (void *)*((void *)v4 + 42);
      *((void *)v4 + 42) = v14;

      objc_msgSend(*((id *)v4 + 42), "setMaxCapacity:", 32, v18, v19, v20, v21);
      [*((id *)v4 + 42) setMaxCost:0x400000];
    }
    id v16 = v4;
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return (GEOTilePool *)v4;
}

- (id).cxx_construct
{
  *((void *)self + 2) = 850045863;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = (char *)self + 80;
  *((void *)self + 11) = (char *)self + 80;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((void *)self + 16) = 0;
  *((_DWORD *)self + 34) = 1065353216;
  *((void *)self + 18) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 22) = 850045863;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *((void *)self + 29) = 0;
  *((void *)self + 30) = (char *)self + 240;
  *((void *)self + 31) = (char *)self + 240;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((void *)self + 36) = 0;
  *((_DWORD *)self + 74) = 1065353216;
  *((void *)self + 38) = 0;
  *((void *)self + 39) = 0;
  return self;
}

void __40__GEOTilePool_initWithSideCacheEnabled___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _receivedMemoryNotification];
}

- (uint64_t)removeTileForKey:(void *)a3
{
  v5 = (int64x2_t *)(a1 + 16);
  std::mutex::lock((std::mutex *)(a1 + 16));
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_removeForKey(v5, a3);
  std::mutex::unlock((std::mutex *)v5);
  std::mutex::lock((std::mutex *)(a1 + 176));
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_removeForKey((int64x2_t *)(a1 + 176), a3);
  std::mutex::unlock((std::mutex *)(a1 + 176));
  unint64_t v6 = *(void **)(a1 + 336);

  return [v6 removeTileForKey:a3];
}

- (void)removeTilesWithKeys:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  unint64_t v4 = [v28 count];
  unint64_t v5 = v4;
  if (v4)
  {
    if (v4 >> 61) {
      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<google::protobuf::Message>>>(v4);
    id v8 = &v6[8 * v7];
    bzero(v6, 8 * v5);
    uint64_t v9 = &v6[8 * v5];
  }
  else
  {
    unint64_t v6 = 0;
    uint64_t v9 = 0;
    id v8 = 0;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v28;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
  uint64_t v27 = self;
  if (v11)
  {
    uint64_t v12 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        if (v9 >= v8)
        {
          uint64_t v15 = (v9 - v6) >> 3;
          unint64_t v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 61) {
            std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
          }
          if ((v8 - v6) >> 2 > v16) {
            unint64_t v16 = (v8 - v6) >> 2;
          }
          if ((unint64_t)(v8 - v6) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v17 = v16;
          }
          if (v17) {
            unint64_t v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<google::protobuf::Message>>>(v17);
          }
          else {
            uint64_t v18 = 0;
          }
          uint64_t v19 = (char *)(v17 + 8 * v15);
          *(void *)uint64_t v19 = v14;
          v20 = v19 + 8;
          while (v9 != v6)
          {
            uint64_t v21 = *((void *)v9 - 1);
            v9 -= 8;
            *((void *)v19 - 1) = v21;
            v19 -= 8;
          }
          id v8 = (char *)(v17 + 8 * v18);
          if (v6) {
            operator delete(v6);
          }
          unint64_t v6 = v19;
          uint64_t v9 = v20;
        }
        else
        {
          *(void *)uint64_t v9 = v14;
          v9 += 8;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v11);
  }

  id v22 = (int64x2_t *)((char *)v27 + 16);
  std::mutex::lock((std::mutex *)((char *)v27 + 16));
  if (v6 != v9)
  {
    uint64_t v23 = v6;
    do
    {
      objc_super v24 = *(void **)v23;
      v23 += 8;
      geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_removeForKey(v22, v24);
    }
    while (v23 != v9);
  }
  std::mutex::unlock((std::mutex *)v22);
  std::mutex::lock((std::mutex *)((char *)v27 + 176));
  if (v6 != v9)
  {
    v25 = v6;
    do
    {
      v26 = *(void **)v25;
      v25 += 8;
      geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_removeForKey((int64x2_t *)v27 + 11, v26);
    }
    while (v25 != v9);
  }
  std::mutex::unlock((std::mutex *)((char *)v27 + 176));
  [*((id *)v27 + 42) removeTilesWithKeys:v10];
  if (v6) {
    operator delete(v6);
  }
}

- (void)removeAllObjects
{
  BOOL v3 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  std::__list_imp<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>>::clear((id *)self + 10);
  if (*((void *)self + 16))
  {
    unint64_t v4 = (void *)*((void *)self + 15);
    if (v4)
    {
      do
      {
        unint64_t v5 = (void *)*v4;
        operator delete(v4);
        unint64_t v4 = v5;
      }
      while (v5);
    }
    *((void *)self + 15) = 0;
    uint64_t v6 = *((void *)self + 14);
    if (v6)
    {
      for (uint64_t i = 0; i != v6; ++i)
        *(void *)(*((void *)self + 13) + 8 * i) = 0;
    }
    *((void *)self + 16) = 0;
  }
  *((void *)self + 20) = 0;
  *((void *)self + 21) = 0;
  std::mutex::unlock(v3);
  std::mutex::lock((std::mutex *)((char *)self + 176));
  std::__list_imp<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>>::clear((id *)self + 30);
  if (*((void *)self + 36))
  {
    id v8 = (void *)*((void *)self + 35);
    if (v8)
    {
      do
      {
        uint64_t v9 = (void *)*v8;
        operator delete(v8);
        id v8 = v9;
      }
      while (v9);
    }
    *((void *)self + 35) = 0;
    uint64_t v10 = *((void *)self + 34);
    if (v10)
    {
      for (uint64_t j = 0; j != v10; ++j)
        *(void *)(*((void *)self + 33) + 8 * j) = 0;
    }
    *((void *)self + 36) = 0;
  }
  *((void *)self + 40) = 0;
  *((void *)self + 41) = 0;
  std::mutex::unlock((std::mutex *)((char *)self + 176));
  uint64_t v12 = (void *)*((void *)self + 42);

  [v12 removeAllObjects];
}

- (void)enumerate:(id)a3
{
  v5[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5[0] = &unk_1ED517600;
  v5[1] = &v4;
  v5[3] = v5;
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::enumerate((uint64_t)self + 16, (uint64_t)v5);
  std::__function::__value_func<void ()(_GEOTileKey const&,geo::_geo_weak_ptr<GEOTileData * {__strong}> const&,double,unsigned long)>::~__value_func[abi:ne180100](v5);
}

- (void)removeTilesMatchingPredicate:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  v22[0] = &unk_1ED5176B0;
  v22[1] = &v12;
  v22[3] = v22;
  id v16 = &v16;
  unint64_t v17 = &v16;
  uint64_t v18 = 0;
  uint64_t v23 = &unk_1ED517F48;
  objc_super v24 = &v16;
  v25 = v22;
  v26 = &v23;
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::enumerate((uint64_t)self + 16, (uint64_t)&v23);
  std::__function::__value_func<void ()(_GEOTileKey const&,geo::_geo_weak_ptr<GEOTileData * {__strong}> const&,double,unsigned long)>::~__value_func[abi:ne180100](&v23);
  if (v18)
  {
    std::mutex::lock((std::mutex *)((char *)self + 16));
    for (uint64_t i = v17; i != &v16; uint64_t i = (id *)i[1])
      geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_removeForKey((int64x2_t *)self + 1, i + 2);
    std::mutex::unlock((std::mutex *)((char *)self + 16));
  }
  std::__list_imp<std::__list_iterator<LoadItem,void *>>::clear(&v16);
  std::__function::__value_func<BOOL ()(_GEOTileKey const&,geo::_geo_weak_ptr<GEOTileData * {__strong}> const&,double,unsigned long)>::~__value_func[abi:ne180100](v22);
  v21[0] = &unk_1ED517708;
  v21[1] = &v12;
  v21[3] = v21;
  uint64_t v13 = (uint64_t)&v13;
  uint64_t v14 = &v13;
  uint64_t v15 = 0;
  id v16 = &v16;
  uint64_t v23 = &unk_1ED517FA0;
  objc_super v24 = (id *)&v13;
  v25 = v21;
  v26 = &v23;
  unint64_t v17 = &v16;
  uint64_t v18 = 0;
  std::mutex::lock((std::mutex *)((char *)self + 176));
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_prune((uint64_t)self + 176);
  for (uint64_t j = *((void *)self + 31); (GEOTilePool *)j != (GEOTilePool *)((char *)self + 240); uint64_t j = *(void *)(j + 8))
  {
    uint64_t v6 = operator new(0x38uLL);
    *((void *)v6 + 1) = 0;
    *(void *)uint64_t v6 = 0;
    long long v7 = *(_OWORD *)(j + 32);
    *((_OWORD *)v6 + 1) = *(_OWORD *)(j + 16);
    *((_OWORD *)v6 + 2) = v7;
    objc_copyWeak((id *)v6 + 6, (id *)(j + 48));
    *(void *)uint64_t v6 = &v16;
    id v8 = v17;
    *((void *)v6 + 1) = v17;
    *id v8 = v6;
    unint64_t v17 = (id *)v6;
    ++v18;
  }
  std::mutex::unlock((std::mutex *)((char *)self + 176));
  for (k = v17; k != &v16; k = (id *)k[1])
  {
    id v10 = k[5];
    id v20 = k[4];
    id v19 = v10;
    if (!v26) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*((void (**)(void **, id *, id *, id *, id *))*v26 + 6))(v26, k + 2, k + 6, &v20, &v19);
  }
  std::__list_imp<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>>::clear(&v16);
  std::__function::__value_func<void ()(_GEOTileKey const&,geo::_geo_weak_ptr<objc_object * {__strong}> const&,double,unsigned long)>::~__value_func[abi:ne180100](&v23);
  if (v15)
  {
    std::mutex::lock((std::mutex *)((char *)self + 176));
    for (m = v14; m != &v13; m = (uint64_t *)m[1])
      geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_removeForKey((int64x2_t *)self + 11, m + 2);
    std::mutex::unlock((std::mutex *)((char *)self + 176));
  }
  std::__list_imp<std::__list_iterator<LoadItem,void *>>::clear(&v13);
  std::__function::__value_func<BOOL ()(_GEOTileKey const&,geo::_geo_weak_ptr<objc_object * {__strong}> const&,double,unsigned long)>::~__value_func[abi:ne180100](v21);
  [*((id *)self + 42) removeTilesMatchingPredicate:v12];
}

- (uint64_t)containsKey:(void *)a3 cost:(void *)a4
{
  long long v7 = (std::mutex *)(a1 + 16);
  std::mutex::lock((std::mutex *)(a1 + 16));
  unint64_t v8 = GEOTileKeyHash(a3);
  int8x8_t v9 = *(int8x8_t *)(a1 + 112);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8(v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v11 = v8;
      if (v8 >= *(void *)&v9) {
        unint64_t v11 = v8 % *(void *)&v9;
      }
    }
    else
    {
      unint64_t v11 = (*(void *)&v9 - 1) & v8;
    }
    id v12 = *(void **)(*(void *)(a1 + 104) + 8 * v11);
    if (v12)
    {
      for (uint64_t i = (void *)*v12; i; uint64_t i = (void *)*i)
      {
        unint64_t v14 = i[1];
        if (v8 == v14)
        {
          if (i[2] == *a3 && i[3] == a3[1])
          {
LABEL_43:
            if (a4) {
              *a4 = *(void *)(i[4] + 40);
            }
            uint64_t v23 = 1;
            goto LABEL_42;
          }
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v14 >= *(void *)&v9) {
              v14 %= *(void *)&v9;
            }
          }
          else
          {
            v14 &= *(void *)&v9 - 1;
          }
          if (v14 != v11) {
            break;
          }
        }
      }
    }
  }
  std::mutex::unlock(v7);
  long long v7 = (std::mutex *)(a1 + 176);
  std::mutex::lock((std::mutex *)(a1 + 176));
  unint64_t v16 = GEOTileKeyHash(a3);
  int8x8_t v17 = *(int8x8_t *)(a1 + 272);
  if (v17)
  {
    uint8x8_t v18 = (uint8x8_t)vcnt_s8(v17);
    v18.i16[0] = vaddlv_u8(v18);
    if (v18.u32[0] > 1uLL)
    {
      unint64_t v19 = v16;
      if (v16 >= *(void *)&v17) {
        unint64_t v19 = v16 % *(void *)&v17;
      }
    }
    else
    {
      unint64_t v19 = (*(void *)&v17 - 1) & v16;
    }
    id v20 = *(void **)(*(void *)(a1 + 264) + 8 * v19);
    if (v20)
    {
      for (uint64_t i = (void *)*v20; i; uint64_t i = (void *)*i)
      {
        unint64_t v21 = i[1];
        if (v16 == v21)
        {
          if (i[2] == *a3 && i[3] == a3[1]) {
            goto LABEL_43;
          }
        }
        else
        {
          if (v18.u32[0] > 1uLL)
          {
            if (v21 >= *(void *)&v17) {
              v21 %= *(void *)&v17;
            }
          }
          else
          {
            v21 &= *(void *)&v17 - 1;
          }
          if (v21 != v19) {
            break;
          }
        }
      }
    }
  }
  uint64_t v23 = 0;
LABEL_42:
  std::mutex::unlock(v7);
  return v23;
}

- (unint64_t)maxCapacity
{
  BOOL v3 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  unint64_t v4 = *((void *)self + 18);
  std::mutex::unlock(v3);
  return v4;
}

- (unint64_t)maxCost
{
  BOOL v3 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  unint64_t v4 = *((void *)self + 19);
  std::mutex::unlock(v3);
  return v4;
}

- (void)_receivedMemoryNotification
{
  BOOL v3 = (int64x2_t *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_prune((uint64_t)v3);
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_evictWithMaxCostAndCapacity(v3, *((void *)self + 19) >> 1, *((void *)self + 18) >> 1);
  std::mutex::unlock((std::mutex *)v3);
  std::mutex::lock((std::mutex *)((char *)self + 176));
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_prune((uint64_t)self + 176);
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_evictWithMaxCostAndCapacity((int64x2_t *)self + 11, *((void *)self + 39) >> 1, *((void *)self + 38) >> 1);

  std::mutex::unlock((std::mutex *)((char *)self + 176));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 42, 0);
  BOOL v3 = (void *)*((void *)self + 35);
  if (v3)
  {
    do
    {
      unint64_t v4 = (void *)*v3;
      operator delete(v3);
      BOOL v3 = v4;
    }
    while (v4);
  }
  unint64_t v5 = (void *)*((void *)self + 33);
  *((void *)self + 33) = 0;
  if (v5) {
    operator delete(v5);
  }
  std::__list_imp<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>>::clear((id *)self + 30);
  std::mutex::~mutex((std::mutex *)((char *)self + 176));
  uint64_t v6 = (void *)*((void *)self + 15);
  if (v6)
  {
    do
    {
      long long v7 = (void *)*v6;
      operator delete(v6);
      uint64_t v6 = v7;
    }
    while (v7);
  }
  unint64_t v8 = (void *)*((void *)self + 13);
  *((void *)self + 13) = 0;
  if (v8) {
    operator delete(v8);
  }
  std::__list_imp<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>>::clear((id *)self + 10);
  std::mutex::~mutex((std::mutex *)((char *)self + 16));

  objc_storeStrong((id *)self + 1, 0);
}

- (unint64_t)currentCount
{
  BOOL v3 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  unint64_t v4 = *((void *)self + 21);
  std::mutex::unlock(v3);
  return v4;
}

- (unint64_t)currentCost
{
  BOOL v3 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  unint64_t v4 = *((void *)self + 20);
  std::mutex::unlock(v3);
  return v4;
}

- (void)enumerate:
{
}

- (uint64_t)enumerate:
{
    return a1 + 8;
  else {
    return 0;
  }
}

- (void)removeTilesMatchingPredicate:
{
}

- (uint64_t)removeTilesMatchingPredicate:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

@end