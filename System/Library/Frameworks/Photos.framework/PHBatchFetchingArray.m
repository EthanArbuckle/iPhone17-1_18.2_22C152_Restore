@interface PHBatchFetchingArray
+ (BOOL)accessInstanceVariablesDirectly;
- (BOOL)_shouldRetrieveRestrictedAssetOIDsWithSample:(id)a3;
- (BOOL)containsObject:(id)a3;
- (NSArray)oids;
- (NSSet)oidsSet;
- (NSString)description;
- (PHBatchFetchingArray)initWithOIDs:(id)a3 options:(id)a4 dataSource:(id)a5;
- (PHBatchFetchingArray)initWithObjects:(id)a3 options:(id)a4 photoLibrary:(id)a5;
- (PHPhotoLibrary)photoLibrary;
- (id)_batchForBatchNumber:(unint64_t)a3 shouldUpdateLastBatch:(BOOL)a4;
- (id)_fetchObjectsInBatchNumber:(unint64_t)a3;
- (id)_phObjectAtIndex:(unint64_t)a3;
- (id)_phObjectsForOIDs:(id)a3;
- (id)_prepareObjectsByOIDsFromOIDsToFetch:(id)a3 andUpdateUUIDsByOIDsForRestrictedObjectsUsingFetchedObjects:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)subarrayWithRange:(_NSRange)a3;
- (unint64_t)_populateObjectBuffer:(id *)a3 range:(_NSRange)a4;
- (unint64_t)batchSize;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfObject:(id)a3;
- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4;
- (unint64_t)test_lastBatchIndex;
- (void)_rememberUUIDsForBatch:(id)a3;
- (void)cache:(id)a3 willEvictObject:(id)a4;
- (void)dealloc;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)prefetchObjectsAtIndexes:(id)a3;
- (void)test_evictBatchNumber:(int64_t)a3;
- (void)test_invalidateUUIDCache;
@end

@implementation PHBatchFetchingArray

- (PHBatchFetchingArray)initWithOIDs:(id)a3 options:(id)a4 dataSource:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v40.receiver = self;
  v40.super_class = (Class)PHBatchFetchingArray;
  v13 = [(PHBatchFetchingArray *)&v40 init];
  if (!v13) {
    goto LABEL_31;
  }
  if (!v12 && [v10 count])
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, v13, @"PHBatchFetchingArray.m", 132, @"Invalid parameter not satisfying: %@", @"dataSource || oids.count == 0" object file lineNumber description];
  }
  v13->_cacheLock._os_unfair_lock_opaque = 0;
  v13->_lastBatchLock._os_unfair_lock_opaque = 0;
  objc_storeStrong((id *)&v13->_oids, a3);
  objc_storeStrong((id *)&v13->_dataSource, a5);
  v14 = [v11 objectForKeyedSubscript:@"propertyHint"];
  v15 = v14;
  if (v14) {
    uint64_t v16 = [v14 integerValue];
  }
  else {
    uint64_t v16 = 2;
  }
  v13->_propertyHint = v16;
  v17 = [v11 objectForKeyedSubscript:@"fetchedObjectBatchPropertySetClass"];

  if (v17)
  {
    v18 = [PHBatchFetchingArrayFetchedClass alloc];
    v19 = [v11 objectForKeyedSubscript:@"fetchedObjectBatchPropertySetClass"];
    uint64_t v20 = [(PHBatchFetchingArrayFetchedClass *)v18 initWithFetchedPropertySetClass:v19];
LABEL_12:
    overridenFetchResultClass = v13->_overridenFetchResultClass;
    v13->_overridenFetchResultClass = (PHBatchFetchingArrayFetchedClass *)v20;

    goto LABEL_13;
  }
  v21 = [v11 objectForKeyedSubscript:@"fetchedObjectClass"];

  if (v21)
  {
    v22 = [PHBatchFetchingArrayFetchedClass alloc];
    v19 = [v11 objectForKeyedSubscript:@"fetchedObjectClass"];
    uint64_t v20 = [(PHBatchFetchingArrayFetchedClass *)v22 initWithFetchedObjectClass:v19];
    goto LABEL_12;
  }
LABEL_13:
  uint64_t v24 = [(NSArray *)v13->_oids count];
  v13->_unint64_t count = v24;
  if (v24)
  {
    v25 = [v11 objectForKeyedSubscript:@"batchSize"];
    uint64_t v26 = [v25 unsignedIntegerValue];

    unint64_t count = 200;
    if (v26) {
      unint64_t count = v26;
    }
    if (count >= v13->_count) {
      unint64_t count = v13->_count;
    }
    v13->_batchSize = count;
    unint64_t v28 = (v13->_count - 1) / count;
    v13->_lastBatchIndex = 0x7FFFFFFFFFFFFFFFLL;
    dispatch_queue_t v29 = dispatch_queue_create("com.apple.batchFetchingArray", 0);
    uuidsQueue = v13->_uuidsQueue;
    v13->_uuidsQueue = (OS_dispatch_queue *)v29;

    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v31 = [v11 objectForKeyedSubscript:@"cacheSize"];
      v32 = v31;
      if (v31) {
        unint64_t v33 = [v31 unsignedIntegerValue];
      }
      else {
        unint64_t v33 = 10000;
      }
      unint64_t v34 = v13->_count;
      if (v33 < v34) {
        unint64_t v34 = v33;
      }
      if (v34) {
        unint64_t v35 = (v34 - 1) / v13->_batchSize + 1;
      }
      else {
        unint64_t v35 = 0;
      }
      uint64_t v36 = objc_opt_new();
      cache = v13->_cache;
      v13->_cache = (NSCache *)v36;

      [(NSCache *)v13->_cache setEvictsObjectsWithDiscardedContent:0];
      [(NSCache *)v13->_cache setCountLimit:v35];
      if (![(PHBatchFetchingArrayFetchedClass *)v13->_overridenFetchResultClass fetchedPropertySetClass])+[PHSafeNSCacheDelegateReflector setDelegate:v13 forCache:v13->_cache]; {
    }
      }
  }

LABEL_31:
  return v13;
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0 = a3->var0;
  if (!a3->var0) {
    a3->var2 = (unint64_t *)&a3->var2;
  }
  unint64_t count = self->_count;
  unint64_t v9 = var0 + a5 - count;
  if (var0 + a5 < count) {
    unint64_t v9 = 0;
  }
  unint64_t v10 = a5 - v9;
  if (a5 == v9) {
    return 0;
  }
  unint64_t result = -[PHBatchFetchingArray _populateObjectBuffer:range:](self, "_populateObjectBuffer:range:", a4, var0, a5 - v9);
  a3->unint64_t var0 = v10 + var0;
  a3->var1 = a4;
  return result;
}

- (unint64_t)_populateObjectBuffer:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  Mutable = CFArrayCreateMutable(0, a4.length, MEMORY[0x1E4F1D510]);
  if (location < location + length)
  {
    do
    {
      unint64_t v9 = [(PHBatchFetchingArray *)self _phObjectAtIndex:location];
      CFArrayAppendValue(Mutable, v9);

      ++location;
      --length;
    }
    while (length);
  }
  CFIndex Count = CFArrayGetCount(Mutable);
  v12.NSUInteger location = 0;
  v12.NSUInteger length = Count;
  CFArrayGetValues(Mutable, v12, (const void **)a3);
  CFAutorelease(Mutable);
  return Count;
}

- (id)objectAtIndex:(unint64_t)a3
{
  unint64_t count = self->_count;
  if (count <= a3)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A8], @"%p: index (%lu) beyond bounds (%lu)", self, a3, count);
    v4 = 0;
  }
  else
  {
    v4 = -[PHBatchFetchingArray _phObjectAtIndex:](self, "_phObjectAtIndex:");
  }

  return v4;
}

- (id)_phObjectAtIndex:(unint64_t)a3
{
  unint64_t v5 = a3 / self->_batchSize;
  v6 = [(PHBatchFetchingArray *)self _batchForBatchNumber:v5 shouldUpdateLastBatch:1];
  v7 = [v6 objectAtIndex:a3 - self->_batchSize * v5];

  return v7;
}

- (id)_batchForBatchNumber:(unint64_t)a3 shouldUpdateLastBatch:(BOOL)a4
{
  BOOL v4 = a4;
  p_lastBatchLock = &self->_lastBatchLock;
  v7 = self;
  os_unfair_lock_lock(p_lastBatchLock);
  unint64_t lastBatchIndex = v7->_lastBatchIndex;
  unint64_t v9 = v7->_lastBatch;
  os_unfair_lock_unlock(&v7->_lastBatchLock);

  if (lastBatchIndex == a3)
  {
    if (v9) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  os_unfair_lock_lock(&v7->_cacheLock);
  cache = v7->_cache;
  id v11 = [NSNumber numberWithUnsignedInteger:a3];
  CFRange v12 = [(NSCache *)cache objectForKey:v11];

  if (!v12)
  {
    id v13 = objc_initWeak(&location, v7);

    id v14 = objc_alloc(MEMORY[0x1E4F8B948]);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __67__PHBatchFetchingArray__batchForBatchNumber_shouldUpdateLastBatch___block_invoke;
    v23[3] = &unk_1E5847E30;
    objc_copyWeak(v24, &location);
    v24[1] = (id)a3;
    CFRange v12 = (void *)[v14 initWithBlock:v23];
    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
    v15 = v7->_cache;
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSCache *)v15 setObject:v12 forKey:v16];
  }
  os_unfair_lock_unlock(&v7->_cacheLock);
  v17 = [v12 objectValue];
  unint64_t v9 = v17;
  if (v4)
  {
    v18 = v17;
    v19 = &v7->_lastBatchLock;
    uint64_t v20 = v7;
    os_unfair_lock_lock(v19);
    v20->_unint64_t lastBatchIndex = a3;
    lastBatch = v20->_lastBatch;
    v20->_lastBatch = v18;

    os_unfair_lock_unlock(&v20->_lastBatchLock);
  }

LABEL_10:

  return v9;
}

void __42__PHBatchFetchingArray__phObjectsForOIDs___block_invoke(id *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [a1[4] objectForKey:v3];
  if (!v4)
  {
    if ([*((id *)a1[5] + 13) fetchedPropertySetClass])
    {
      id v5 = objc_alloc((Class)[*((id *)a1[5] + 13) fetchedPropertySetClass]);
      v6 = [a1[5] photoLibrary];
      BOOL v4 = (void *)[v5 initWithObjectID:v3 knownKeysDictionary:0 photoLibrary:v6];
    }
    else
    {
      uint64_t v17 = 0;
      v18 = &v17;
      uint64_t v19 = 0x3032000000;
      uint64_t v20 = __Block_byref_object_copy__43698;
      v21 = __Block_byref_object_dispose__43699;
      id v22 = 0;
      id v7 = v3;
      uint64_t v16 = v7;
      pl_dispatch_sync();
      uint64_t v8 = v18[5];
      if (!v8)
      {
        unint64_t v9 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v10 = [v9 UUIDString];
        id v11 = (void *)v18[5];
        v18[5] = v10;

        CFRange v12 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          id v13 = a1[5];
          uint64_t v14 = v13[6];
          uint64_t v15 = v18[5];
          *(_DWORD *)buf = 134218754;
          uint64_t v24 = v13;
          __int16 v25 = 2112;
          uint64_t v26 = v14;
          __int16 v27 = 2112;
          id v28 = v7;
          __int16 v29 = 2112;
          uint64_t v30 = v15;
          _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_INFO, "BFA %p with NSCache %@: could not find tombstone UUID for objectID: %@, using: %@", buf, 0x2Au);
        }

        uint64_t v8 = v18[5];
      }
      BOOL v4 = objc_msgSend(*((id *)a1[5] + 3), "bfa_tombstoneObjectForOID:uuid:propertyHint:overrideResultsWithClass:", v7, v8, *((void *)a1[5] + 14), objc_msgSend(*((id *)a1[5] + 13), "fetchedObjectClass"));

      _Block_object_dispose(&v17, 8);
    }
  }
  [a1[6] addObject:v4];
}

- (id)_prepareObjectsByOIDsFromOIDsToFetch:(id)a3 andUpdateUUIDsByOIDsForRestrictedObjectsUsingFetchedObjects:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  unint64_t v9 = [v7 count];
  if (v9 < [v6 count]
    && [(PHBatchFetchingArray *)self _shouldRetrieveRestrictedAssetOIDsWithSample:v6])
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v6];
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    uint64_t v30 = __121__PHBatchFetchingArray__prepareObjectsByOIDsFromOIDsToFetch_andUpdateUUIDsByOIDsForRestrictedObjectsUsingFetchedObjects___block_invoke;
    uint64_t v31 = &unk_1E5848DF0;
    v32 = self;
    id v11 = v10;
    id v33 = v11;
    pl_dispatch_sync();
  }
  else
  {
    id v11 = 0;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v18 = [v17 objectID];
        [v8 setObject:v17 forKey:v18];
        [v11 removeObject:v18];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v14);
  }

  if ([v11 count])
  {
    dataSource = self->_dataSource;
    uint64_t v20 = [v11 allObjects];
    v21 = [(PHBatchFetchingArrayDataSource *)dataSource bfa_fetchUUIDsForRestrictedOIDs:v20];

    if (v21)
    {
      id v23 = v21;
      pl_dispatch_sync();
    }
  }

  return v8;
}

- (void)dealloc
{
  [(NSCache *)self->_cache setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PHBatchFetchingArray;
  [(PHBatchFetchingArray *)&v3 dealloc];
}

void *__49__PHBatchFetchingArray_prefetchObjectsAtIndexes___block_invoke(void *result, unint64_t a2, uint64_t a3)
{
  unint64_t v3 = *(void *)(result[4] + 96);
  int64_t v4 = a2 / v3;
  int64_t v5 = (a3 + a2 - 1) / v3;
  uint64_t v6 = *(void *)(result[5] + 8);
  int64_t v7 = *(void *)(v6 + 24);
  if (v4 <= v7) {
    int64_t v8 = *(void *)(v6 + 24);
  }
  else {
    int64_t v8 = v4;
  }
  if (v8 <= v5)
  {
    unint64_t v9 = result;
    do
      unint64_t result = (id)[(id)v9[4] _batchForBatchNumber:v8 shouldUpdateLastBatch:*((unsigned __int8 *)v9 + 48)];
    while (v8++ != v5);
    uint64_t v6 = *(void *)(v9[5] + 8);
    int64_t v7 = *(void *)(v6 + 24);
  }
  if (v7 <= v5 + 1) {
    int64_t v7 = v5 + 1;
  }
  *(void *)(v6 + 24) = v7;
  return result;
}

- (void)prefetchObjectsAtIndexes:(id)a3
{
  id v4 = a3;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = -1;
  BOOL v5 = self->_cache == 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__PHBatchFetchingArray_prefetchObjectsAtIndexes___block_invoke;
  v6[3] = &unk_1E5847E58;
  v6[4] = self;
  v6[5] = v8;
  BOOL v7 = v5;
  [v4 enumerateRangesUsingBlock:v6];
  _Block_object_dispose(v8, 8);
}

void __31__PHBatchFetchingArray_oidsSet__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void **)(v2 + 16);
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(v2 + 8)];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;

    unint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  BOOL v7 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v7, v3);
}

id __67__PHBatchFetchingArray__batchForBatchNumber_shouldUpdateLastBatch___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained _fetchObjectsInBatchNumber:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_fetchObjectsInBatchNumber:(unint64_t)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  unint64_t batchSize = self->_batchSize;
  unint64_t v5 = batchSize * a3;
  unint64_t v6 = batchSize * a3 + batchSize;
  if (v6 >= self->_count) {
    unint64_t count = self->_count;
  }
  else {
    unint64_t count = v6;
  }
  int64_t v8 = [(PHBatchFetchingArray *)self oids];
  unint64_t v9 = count - v5;
  uint64_t v10 = objc_msgSend(v8, "subarrayWithRange:", v5, count - v5);

  if (kdebug_is_enabled())
  {
    id v11 = [v10 firstObject];
    objc_opt_class();
    id v12 = v11;
    if (objc_opt_isKindOfClass()) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    id v14 = v13;

    uint64_t v15 = [v14 entity];
    uint64_t v16 = [v15 name];

    uint64_t v17 = PLPhotoKitGetLog();
    os_signpost_id_t v18 = os_signpost_id_generate(v17);
    uint64_t v19 = v17;
    uint64_t v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      unint64_t v21 = self->_count;
      int v26 = 138413058;
      long long v27 = v16;
      __int16 v28 = 2048;
      unint64_t v29 = v5;
      __int16 v30 = 2048;
      unint64_t v31 = v9;
      __int16 v32 = 2048;
      unint64_t v33 = v21;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "FetchObjects", "Entity: %@, range location: %tu, length: %tu, count: %tu", (uint8_t *)&v26, 0x2Au);
    }
  }
  else
  {
    uint64_t v20 = 0;
    os_signpost_id_t v18 = 0;
  }
  id v22 = [(PHBatchFetchingArray *)self _phObjectsForOIDs:v10];
  if (kdebug_is_enabled())
  {
    id v23 = v20;
    long long v24 = v23;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      LOWORD(v26) = 0;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v24, OS_SIGNPOST_INTERVAL_END, v18, "FetchObjects", (const char *)&unk_19B30018E, (uint8_t *)&v26, 2u);
    }
  }

  return v22;
}

- (NSArray)oids
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (id)_phObjectsForOIDs:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  if ([v4 count])
  {
    unint64_t v6 = [(PHBatchFetchingArrayFetchedClass *)self->_overridenFetchResultClass fetchedPropertySetClass];
    dataSource = self->_dataSource;
    if (v6) {
      [(PHBatchFetchingArrayDataSource *)dataSource bfa_fetchedObjectsForOIDs:v4 propertySetClass:[(PHBatchFetchingArrayFetchedClass *)self->_overridenFetchResultClass fetchedPropertySetClass]];
    }
    else {
    int64_t v8 = [(PHBatchFetchingArrayDataSource *)dataSource bfa_fetchObjectsForOIDs:v4 propertyHint:self->_propertyHint overrideResultsWithClass:[(PHBatchFetchingArrayFetchedClass *)self->_overridenFetchResultClass fetchedObjectClass]];
    }
  }
  else
  {
    int64_t v8 = 0;
  }
  unint64_t v9 = [(PHBatchFetchingArray *)self _prepareObjectsByOIDsFromOIDsToFetch:v4 andUpdateUUIDsByOIDsForRestrictedObjectsUsingFetchedObjects:v8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42__PHBatchFetchingArray__phObjectsForOIDs___block_invoke;
  v15[3] = &unk_1E5847E08;
  id v16 = v9;
  uint64_t v17 = self;
  id v10 = v5;
  id v18 = v10;
  id v11 = v9;
  [v4 enumerateObjectsUsingBlock:v15];
  id v12 = v18;
  id v13 = v10;

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridenFetchResultClass, 0);
  objc_storeStrong((id *)&self->_uuidsByOIDs, 0);
  objc_storeStrong((id *)&self->_uuidsQueue, 0);
  objc_storeStrong((id *)&self->_lastBatch, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_oidsSet, 0);

  objc_storeStrong((id *)&self->_oids, 0);
}

- (NSSet)oidsSet
{
  if (self->_count)
  {
    uint64_t v4 = 0;
    unint64_t v5 = &v4;
    uint64_t v6 = 0x3032000000;
    BOOL v7 = __Block_byref_object_copy__43698;
    int64_t v8 = __Block_byref_object_dispose__43699;
    id v9 = 0;
    pl_dispatch_sync();
    id v2 = (id)v5[5];
    _Block_object_dispose(&v4, 8);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F1CAD0] set];
  }

  return (NSSet *)v2;
}

- (unint64_t)test_lastBatchIndex
{
  p_lastBatchLock = &self->_lastBatchLock;
  os_unfair_lock_lock(&self->_lastBatchLock);
  unint64_t lastBatchIndex = self->_lastBatchIndex;
  os_unfair_lock_unlock(p_lastBatchLock);
  return lastBatchIndex;
}

- (void)test_invalidateUUIDCache
{
}

uint64_t __48__PHBatchFetchingArray_test_invalidateUUIDCache__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) removeAllObjects];
}

- (void)test_evictBatchNumber:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(NSCache *)self->_cache removeObjectForKey:v4];
}

- (void)_rememberUUIDsForBatch:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [a3 objectValue];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 uuid];
        id v12 = [v10 objectID];
        [v4 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v13 = v4;
  pl_dispatch_async();
}

uint64_t __47__PHBatchFetchingArray__rememberUUIDsForBatch___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 88);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 88);
    *(void *)(v4 + 88) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 88);
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v2 addEntriesFromDictionary:v6];
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
}

void __121__PHBatchFetchingArray__prepareObjectsByOIDsFromOIDsToFetch_andUpdateUUIDsByOIDsForRestrictedObjectsUsingFetchedObjects___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 88);
  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = [v2 allKeys];
    id v5 = [v4 setWithArray:v6];
    [v3 minusSet:v5];
  }
}

uint64_t __121__PHBatchFetchingArray__prepareObjectsByOIDsFromOIDsToFetch_andUpdateUUIDsByOIDsForRestrictedObjectsUsingFetchedObjects___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 88);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 88);
    *(void *)(v4 + 88) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 88);
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v2 addEntriesFromDictionary:v6];
}

void __42__PHBatchFetchingArray__phObjectsForOIDs___block_invoke_92(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 88) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)_shouldRetrieveRestrictedAssetOIDsWithSample:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 count]
    && ([(PHBatchFetchingArrayDataSource *)self->_dataSource bfa_supportsPrivacyRestrictionsForOIDs:v4] & 1) != 0;

  return v5;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)[(PHBatchFetchingArrayDataSource *)self->_dataSource bfa_photoLibrary];
}

- (id)subarrayWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v18[3] = *MEMORY[0x1E4F143B8];
  cache = self->_cache;
  if (cache) {
    unint64_t v7 = self->_batchSize * [(NSCache *)cache countLimit];
  }
  else {
    unint64_t v7 = 10000;
  }
  v17[0] = @"batchSize";
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHBatchFetchingArray batchSize](self, "batchSize"));
  v18[0] = v8;
  v17[1] = @"propertyHint";
  id v9 = [NSNumber numberWithUnsignedInteger:self->_propertyHint];
  v18[1] = v9;
  v17[2] = @"cacheSize";
  id v10 = [NSNumber numberWithUnsignedInteger:v7];
  v18[2] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];

  id v12 = [PHBatchFetchingArray alloc];
  id v13 = [(PHBatchFetchingArray *)self oids];
  long long v14 = objc_msgSend(v13, "subarrayWithRange:", location, length);
  long long v15 = [(PHBatchFetchingArray *)v12 initWithOIDs:v14 options:v11 dataSource:self->_dataSource];

  return v15;
}

- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  unint64_t v7 = _objectIDForObject(a3);
  if (v7)
  {
    uint64_t v8 = [(PHBatchFetchingArray *)self oids];
    unint64_t v9 = objc_msgSend(v8, "indexOfObject:inRange:", v7, location, length);
  }
  else
  {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (unint64_t)indexOfObject:(id)a3
{
  id v4 = _objectIDForObject(a3);
  if (v4)
  {
    BOOL v5 = [(PHBatchFetchingArray *)self oids];
    unint64_t v6 = [v5 indexOfObject:v4];
  }
  else
  {
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (BOOL)containsObject:(id)a3
{
  id v4 = _objectIDForObject(a3);
  if (v4)
  {
    BOOL v5 = [(PHBatchFetchingArray *)self oids];
    char v6 = [v5 containsObject:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  if (self->_count) {
    -[PHBatchFetchingArray _populateObjectBuffer:range:](self, "_populateObjectBuffer:range:", a3, a4.location, a4.length);
  }
}

- (NSString)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  char v6 = [v3 stringWithFormat:@"%@ (%p) of %lu items", v5, self, self->_count];

  return (NSString *)v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v3 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"This array is truly immutable" userInfo:0];
  objc_exception_throw(v3);
}

- (PHBatchFetchingArray)initWithObjects:(id)a3 options:(id)a4 photoLibrary:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v16), "objectID", (void)v20);
        [v11 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  id v18 = [(PHBatchFetchingArray *)self initWithOIDs:v11 options:v9 dataSource:v10];
  return v18;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

@end