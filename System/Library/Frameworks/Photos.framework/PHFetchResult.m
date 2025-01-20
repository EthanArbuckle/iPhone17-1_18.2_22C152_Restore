@interface PHFetchResult
+ (id)_batchFetchingArrayForObjectIDs:(id)a3 fetchResult:(id)a4;
+ (id)_typesToCountForAssetCollections;
+ (id)_typesToCountForListCollections;
+ (id)cleanedAndSortedOIDsFrom:(id)a3 usingFetchOptions:(id)a4;
+ (id)emptyFetchResultChangeHandlingKey;
+ (id)fetchObjectCount:(id)a3 inManagedObjectContext:(id)a4;
+ (id)fetchObjectIDs:(id)a3 inManagedObjectContext:(id)a4;
+ (id)fetchObjectIDsForCombinableFetchResults:(id)a3 inManagedObjectContext:(id)a4;
+ (id)filteredOIDsFrom:(id)a3 usingEntityName:(id)a4 withPhotoLibrary:(id)a5;
+ (id)pl_fetchResultContainingAssetContainer:(id)a3 photoLibrary:(id)a4;
+ (id)pl_fetchResultContainingAssetContainer:(id)a3 photoLibrary:(id)a4 includeTrash:(BOOL)a5;
+ (id)pl_fetchResultForAssetContainerList:(id)a3 photoLibrary:(id)a4;
+ (id)pl_fetchResultForStandInAssetCollection:(id)a3;
+ (id)pl_filterPredicateForAssetContainer:(id)a3;
+ (id)pointerComparableIdentifiersFromIdentifiers:(id)a3;
+ (id)postProcessFetchedObjectIDs:(id)a3 forFetchResult:(id)a4 fetchRequest:(id)a5;
- (BOOL)_canCreateFetchedPropertyObjectsWithClass:(Class)a3;
- (BOOL)containsObject:(id)anObject;
- (BOOL)isFullyBackedByObjectIDs;
- (BOOL)isRegisteredForChangeNotificationDeltas;
- (BOOL)preventsClearingOIDCache;
- (NSArray)fetchSortDescriptors;
- (NSArray)fetchedObjectIDs;
- (NSArray)fetchedObjects;
- (NSArray)objectsAtIndexes:(NSIndexSet *)indexes;
- (NSArray)thumbnailAssets;
- (NSError)fetchError;
- (NSFetchRequest)fetchRequest;
- (NSSet)fetchPropertySets;
- (NSSet)fetchedObjectIDsSet;
- (NSString)fetchType;
- (NSUInteger)count;
- (NSUInteger)countOfAssetsWithMediaType:(PHAssetMediaType)mediaType;
- (NSUInteger)indexOfObject:(id)anObject;
- (NSUInteger)indexOfObject:(id)anObject inRange:(NSRange)range;
- (PHFetchOptions)fetchOptions;
- (PHFetchResult)fetchResultWithChangeHandlingValue:(id)a3;
- (PHFetchResult)init;
- (PHFetchResult)initWithExistingFetchResult:(id)a3 filteredObjectIDs:(id)a4;
- (PHFetchResult)initWithMediaTypeCounts:(id)a3;
- (PHFetchResult)initWithQuery:(id)a3;
- (PHFetchResult)initWithQuery:(id)a3 oids:(id)a4 registerIfNeeded:(BOOL)a5 usingManagedObjectContext:(id)a6;
- (PHFetchResult)initWithQuery:(id)a3 registerIfNeeded:(BOOL)a4;
- (PHPhotoLibrary)photoLibrary;
- (PHQuery)query;
- (id)_createFetchedPropertyObjectsWithClass:(Class)a3 fetchedObjectIDs:(id)a4;
- (id)_mediaTypeCounts;
- (id)additionalChangedIdentifiersFromPreviousIdentifiers:(id)a3 currentIdentifiers:(id)a4 inFetchResultBeforeChanges:(id)a5;
- (id)calculateMediaTypeCounts;
- (id)changeHandlingKey;
- (id)changeHandlingValueUsingSeedOids:(id)a3 withChange:(id)a4 usingManagedObjectContext:(id)a5;
- (id)containerIdentifier;
- (id)copyWithOptions:(id)a3;
- (id)description;
- (id)fetchPropertiesForPropertySetClass:(Class)a3 forObjectsAtIndexes:(id)a4;
- (id)fetchedObjectsUsingManagedObjectContext:(id)a3;
- (id)fetchedPropertiesForPropertySetClass:(Class)a3;
- (id)firstObject;
- (id)lastObject;
- (id)localIdentifiers;
- (id)objectAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)idx;
- (id)objectIDAtIndex:(unint64_t)a3;
- (id)objectIDs;
- (id)pl_photoLibraryObject;
- (int64_t)chunkSizeForFetch;
- (int64_t)collectionFetchType;
- (unint64_t)_possibleChangesFromDetectionCriteriaForChange:(id)a3;
- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3;
- (unint64_t)cachedCountOfCollectionsWithCollectionTypes:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)countOfAssetCollections;
- (unint64_t)countOfCollectionsLists;
- (unint64_t)possibleChangesForChange:(id)a3;
- (unint64_t)possibleChangesForChange:(id)a3 propertiesFetchResult:(id)a4;
- (void)_updateMediaTypeCountsIfNeeded;
- (void)dealloc;
- (void)enumerateObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts usingBlock:(void *)block;
- (void)enumerateObjectsUsingBlock:(void *)block;
- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block;
- (void)getCountOfCollectionsWithCollectionTypes:(id)a3;
- (void)prefetchObjectsAtIndexes:(id)a3;
- (void)prefetchThumbnailAssetsAtIndexes:(id)a3;
- (void)setChunkSizeForFetch:(int64_t)a3;
- (void)setPreventsClearingOIDCache:(BOOL)a3;
- (void)setRegisteredForChangeNotificationDeltas:(BOOL)a3;
- (void)updateRegistrationForChangeNotificationDeltas;
@end

@implementation PHFetchResult

void __58__PHFetchResult_getCountOfCollectionsWithCollectionTypes___block_invoke(uint64_t a1)
{
  v49[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  v3 = [MEMORY[0x1E4F8A848] entityName];
  v4 = [v2 fetchRequestWithEntityName:v3];

  [v4 setFetchBatchSize:100];
  [v4 setIncludesPendingChanges:0];
  v49[0] = @"kind";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
  [v4 setPropertiesToGroupBy:v5];

  v6 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"kind"];
  v7 = (void *)MEMORY[0x1E4F28C68];
  v8 = [MEMORY[0x1E4F1C978] arrayWithObject:v6];
  v9 = [v7 expressionForFunction:@"count:" arguments:v8];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v10 setName:@"count"];
  [v10 setExpression:v9];
  [v10 setExpressionResultType:200];
  v48[0] = @"kind";
  v48[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  [v4 setPropertiesToFetch:v11];

  [v4 setResultType:2];
  v12 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v13 = *(void *)(a1 + 32);
  v14 = [*(id *)(a1 + 40) objectIDs];
  v15 = [v12 predicateWithFormat:@"%K in %@ AND self IN %@ AND trashedState == %d", @"kind", v13, v14, 0];
  [v4 setPredicate:v15];

  *(void *)(*(void *)(a1 + 40) + 96) = 0;
  v16 = [*(id *)(a1 + 48) managedObjectContext];
  id v40 = 0;
  v17 = [v16 executeFetchRequest:v4 error:&v40];
  id v18 = v40;

  if (v17)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      id v32 = v18;
      id v33 = v10;
      v34 = v9;
      v35 = v4;
      uint64_t v22 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          v25 = [v24 objectForKeyedSubscript:@"kind"];
          v26 = [v24 objectForKeyedSubscript:@"count"];
          int v27 = [v26 intValue];

          v28 = +[PHFetchResult _typesToCountForAssetCollections];
          if ([v25 integerValue] == 1505)
          {
            *(void *)(*(void *)(a1 + 40) + 104) = v27;
          }
          else if ([v25 integerValue] == 4000)
          {
            *(void *)(*(void *)(a1 + 40) + 112) = v27;
          }
          else if ([v28 containsObject:v25])
          {
            *(void *)(*(void *)(a1 + 40) + 96) += v27;
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v21);
      v4 = v35;
      id v10 = v33;
      v9 = v34;
      id v18 = v32;
    }
  }
  else
  {
    v19 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v43 = v4;
      __int16 v44 = 2112;
      uint64_t v45 = v29;
      __int16 v46 = 2112;
      id v47 = v18;
      _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "Error executing count of collections fetch %@ for %@: %@", buf, 0x20u);
    }
  }

  uint64_t v30 = *(void *)(a1 + 40);
  uint64_t v31 = *(void *)(v30 + 96);
  if (!v31) {
    uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
  }
  *(void *)(v30 + 96) = v31;
}

void __55__PHFetchResult_fetchObjectIDs_inManagedObjectContext___block_invoke(void *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = (void *)a1[6];
  id v18 = 0;
  if (v2)
  {
    id v5 = v4;
    id v6 = v3;
    objc_opt_class();
    v7 = [v5 _delegate];
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;

    [v9 setPhotoKitFetchInstrumentation:v2];
    uint64_t v10 = [v5 executeFetchRequest:v6 error:&v18];

    [v9 setPhotoKitFetchInstrumentation:0];
    v11 = v18;
  }
  else
  {
    v11 = 0;
    uint64_t v10 = 0;
  }
  id v12 = v11;
  uint64_t v13 = *(void *)(a1[8] + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v10;

  if (!*(void *)(*(void *)(a1[8] + 8) + 40))
  {
    v15 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      uint64_t v16 = a1[5];
      uint64_t v17 = a1[7];
      *(_DWORD *)buf = 138412802;
      uint64_t v20 = v16;
      __int16 v21 = 2112;
      uint64_t v22 = v17;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_FAULT, "Error executing fetch %@ for %@: %@", buf, 0x20u);
    }
  }
}

- (void)getCountOfCollectionsWithCollectionTypes:(id)a3
{
  id v4 = a3;
  if (self->_albumsCount == 0x7FFFFFFFFFFFFFFFLL
    || self->_sharedAlbumsCount == 0x7FFFFFFFFFFFFFFFLL
    || self->_foldersCount == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = [(PHFetchResult *)self objectIDs];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      v7 = [(PHFetchResult *)self photoLibrary];
      v8 = [v7 photoLibraryForCurrentQueueQoS];

      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __58__PHFetchResult_getCountOfCollectionsWithCollectionTypes___block_invoke;
      v10[3] = &unk_1E5848EC0;
      id v11 = v4;
      id v12 = self;
      id v13 = v8;
      id v9 = v8;
      [v9 performBlockAndWait:v10];
    }
  }
}

- (id)fetchPropertiesForPropertySetClass:(Class)a3 forObjectsAtIndexes:(id)a4
{
  id v6 = a4;
  if ([(PHFetchResult *)self _canCreateFetchedPropertyObjectsWithClass:a3])
  {
    v7 = [(PHFetchResult *)self fetchedObjectIDs];
    v8 = [v7 objectsAtIndexes:v6];

    id v9 = [(PHFetchResult *)self _createFetchedPropertyObjectsWithClass:a3 fetchedObjectIDs:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)_canCreateFetchedPropertyObjectsWithClass:(Class)a3
{
  id v5 = [(PHFetchResult *)self fetchedObjectIDs];
  uint64_t v6 = [v5 count];
  if (v6 == [(PHFetchResult *)self count])
  {
    v7 = [(PHFetchResult *)self fetchType];
    v8 = [(objc_class *)a3 fetchType];
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)objectIDs
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAA0];
  v3 = [(PHFetchResult *)self fetchedObjectIDs];
  id v4 = [v2 orderedSetWithArray:v3];

  return v4;
}

- (NSArray)fetchedObjectIDs
{
  uint64_t v2 = [(PHFetchResult *)self fetchedObjects];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 oids];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

- (unint64_t)countOfAssetCollections
{
  v3 = +[PHFetchResult _typesToCountForAssetCollections];
  [(PHFetchResult *)self getCountOfCollectionsWithCollectionTypes:v3];
  unint64_t v4 = [(PHFetchResult *)self cachedCountOfCollectionsWithCollectionTypes:v3];

  return v4;
}

- (unint64_t)cachedCountOfCollectionsWithCollectionTypes:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PHFetchResult_cachedCountOfCollectionsWithCollectionTypes___block_invoke;
  aBlock[3] = &unk_1E5848E98;
  aBlock[4] = &v11;
  id v5 = (void (**)(void *, unint64_t))_Block_copy(aBlock);
  uint64_t v6 = +[PHFetchResult _typesToCountForAssetCollections];
  int v7 = [v4 intersectsSet:v6];

  if (v7) {
    v5[2](v5, self->_albumsCount);
  }
  if ([v4 containsObject:&unk_1EEB264F0]) {
    v5[2](v5, self->_sharedAlbumsCount);
  }
  if ([v4 containsObject:&unk_1EEB26760]) {
    v5[2](v5, self->_foldersCount);
  }
  unint64_t v8 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v8;
}

+ (id)_typesToCountForAssetCollections
{
  if (_typesToCountForAssetCollections_onceToken != -1) {
    dispatch_once(&_typesToCountForAssetCollections_onceToken, &__block_literal_global_49365);
  }
  uint64_t v2 = (void *)_typesToCountForAssetCollections_typesToCountForAssetCollections;

  return v2;
}

uint64_t __61__PHFetchResult_cachedCountOfCollectionsWithCollectionTypes___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
    if (*(void *)(v2 + 24) == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = *(void *)(v2 + 24);
    }
    *(void *)(v2 + 24) = v3 + a2;
  }
  return result;
}

- (unint64_t)countOfCollectionsLists
{
  uint64_t v3 = +[PHFetchResult _typesToCountForListCollections];
  [(PHFetchResult *)self getCountOfCollectionsWithCollectionTypes:v3];
  unint64_t v4 = [(PHFetchResult *)self cachedCountOfCollectionsWithCollectionTypes:v3];

  return v4;
}

+ (id)_typesToCountForListCollections
{
  if (_typesToCountForListCollections_onceToken != -1) {
    dispatch_once(&_typesToCountForListCollections_onceToken, &__block_literal_global_130);
  }
  uint64_t v2 = (void *)_typesToCountForListCollections_typesToCountForListCollections;

  return v2;
}

void __57__PHFetchResult_fetchedObjectsUsingManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 40))
  {
    id v3 = *(id *)(v1 + 56);
    if (!v3)
    {
      unint64_t v4 = *(void **)(a1 + 40);
      if (v4)
      {
        id v5 = v4;
      }
      else
      {
        uint64_t v6 = [*(id *)(a1 + 32) photoLibrary];
        id v5 = [v6 managedObjectContextForCurrentQueueQoS];
      }
      id v10 = +[PHFetchResult fetchObjectIDs:*(void *)(a1 + 32) inManagedObjectContext:v5];

      id v3 = v10;
    }
    id v11 = v3;
    uint64_t v7 = +[PHFetchResult _batchFetchingArrayForObjectIDs:v3 fetchResult:*(void *)(a1 + 32)];
    uint64_t v8 = *(void *)(a1 + 32);
    char v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

+ (id)_batchFetchingArrayForObjectIDs:(id)a3 fetchResult:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v5 query];
  uint64_t v8 = [v7 fetchOptions];

  char v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  id v10 = [v5 fetchType];
  id v11 = [v5 fetchPropertySets];
  id v12 = v11;
  if (v10 && [v11 count]) {
    uint64_t v13 = [(objc_class *)+[PHPhotoLibrary classForFetchType:v10] propertyFetchHintsForPropertySets:v12];
  }
  else {
    uint64_t v13 = 2;
  }
  uint64_t v14 = [NSNumber numberWithUnsignedInteger:v13];
  [v9 setObject:v14 forKeyedSubscript:@"propertyHint"];

  v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "chunkSizeForFetch"));
  [v9 setObject:v15 forKeyedSubscript:@"batchSize"];

  if ([v8 cacheSizeForFetch] >= 1)
  {
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "cacheSizeForFetch"));
    [v9 setObject:v16 forKeyedSubscript:@"cacheSize"];
  }
  uint64_t v17 = [v5 query];
  int v18 = [v17 overrideResultClassWithFetchType];

  if (v18) {
    [v9 setObject:NSClassFromString(v10) forKeyedSubscript:@"fetchedObjectClass"];
  }
  v19 = [PHBatchFetchingArray alloc];
  uint64_t v20 = [v5 photoLibrary];
  __int16 v21 = [(PHBatchFetchingArray *)v19 initWithOIDs:v6 options:v9 photoLibrary:v20];

  return v21;
}

- (PHFetchResult)initWithQuery:(id)a3 oids:(id)a4 registerIfNeeded:(BOOL)a5 usingManagedObjectContext:(id)a6
{
  BOOL v7 = a5;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [(PHFetchResult *)self init];
  uint64_t v14 = v13;
  if (!v13)
  {
LABEL_30:
    v35 = v14;
    goto LABEL_31;
  }
  v13->_preventsClearingOIDCache = 1;
  id changeHandlingKey = v13->_changeHandlingKey;
  v13->_id changeHandlingKey = 0;

  objc_storeStrong((id *)&v14->_seedOIDs, a4);
  if (!v10)
  {
    uint64_t v25 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v51) = 0;
      _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_FAULT, "PHFetchRequest initialized with nil query", (uint8_t *)&v51, 2u);
    }
    goto LABEL_27;
  }
  uint64_t v16 = [v10 copy];
  query = v14->_query;
  v14->_query = (PHQuery *)v16;

  int v18 = [v10 fetchType];
  uint64_t v19 = [v18 copy];
  fetchType = v14->_fetchType;
  v14->_fetchType = (NSString *)v19;

  __int16 v21 = [v10 fetchOptions];
  uint64_t v22 = [v21 fetchPropertySetsAsSet];
  uint64_t v23 = [v22 copy];
  fetchPropertySets = v14->_fetchPropertySets;
  v14->_fetchPropertySets = (NSSet *)v23;

  uint64_t v25 = [(PHQuery *)v14->_query fetchRequest];
  if (v25)
  {
    v26 = [_PHFetchRequestWrapper alloc];
    int v27 = [(PHQuery *)v14->_query containerIdentifier];
    v28 = v27;
    if (!v27)
    {
      v28 = [(PHQuery *)v14->_query changeHandlingContainerIdentifier];
    }
    uint64_t v29 = [(_PHFetchRequestWrapper *)v26 initWithFetchRequest:v25 containerIdentifier:v28 fetchPropertySets:v14->_fetchPropertySets];
    id v30 = v14->_changeHandlingKey;
    v14->_id changeHandlingKey = (id)v29;

    if (!v27) {
    if (v14->_changeHandlingKey)
    }
      goto LABEL_19;
    uint64_t v31 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      int v51 = 138412290;
      v52 = v14;
      _os_log_impl(&dword_19B043000, v31, OS_LOG_TYPE_ERROR, "PHFetchRequest failed to create _PHFetchRequestWrapper from fetch request %@", (uint8_t *)&v51, 0xCu);
    }
LABEL_18:

LABEL_19:
    if (!v14->_fetchError)
    {
      if (v12)
      {
        id v43 = v12;
      }
      else
      {
        __int16 v44 = [v10 photoLibrary];
        id v43 = [v44 managedObjectContextForCurrentQueueQoS];
      }
      uint64_t v45 = [v10 fetchOptions];
      int v46 = [v45 shouldPrefetchCount];

      if (v46)
      {
        uint64_t v47 = +[PHFetchResult fetchObjectCount:v14 inManagedObjectContext:v43];
        prefetchCount = v14->_prefetchCount;
        v14->_prefetchCount = (NSNumber *)v47;
      }
      else
      {
        id v49 = [(PHFetchResult *)v14 fetchedObjectsUsingManagedObjectContext:v43];
      }
    }
LABEL_27:

    if (!v14->_fetchError && v7) {
      [(PHFetchResult *)v14 updateRegistrationForChangeNotificationDeltas];
    }
    goto LABEL_30;
  }
  id v32 = [(PHQuery *)v14->_query searchIndexLookupIdentifier];

  if (!v32)
  {
    uint64_t v36 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:0];
    fetchError = v14->_fetchError;
    v14->_fetchError = (NSError *)v36;

    long long v38 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
    {
      long long v39 = v14->_fetchError;
      int v51 = 138412290;
      v52 = (PHFetchResult *)v39;
      _os_log_impl(&dword_19B043000, v38, OS_LOG_TYPE_FAULT, "PHFetchRequest initialized with invalid query, nil fetch request %@", (uint8_t *)&v51, 0xCu);
    }

    id v40 = [PHBatchFetchingArray alloc];
    uint64_t v31 = [v10 photoLibrary];
    uint64_t v41 = [(PHBatchFetchingArray *)v40 initWithOIDs:MEMORY[0x1E4F1CBF0] options:MEMORY[0x1E4F1CC08] photoLibrary:v31];
    fetchedObjects = v14->_fetchedObjects;
    v14->_fetchedObjects = (PHBatchFetchingArray *)v41;

    goto LABEL_18;
  }
  id v33 = [(PHQuery *)v14->_query searchIndexLookupIdentifier];
  v34 = [v10 fetchOptions];
  v35 = +[PHAsset fetchAssetsForSearchLookupIdentifier:v33 options:v34];

LABEL_31:
  return v35;
}

- (PHFetchResult)init
{
  v9.receiver = self;
  v9.super_class = (Class)PHFetchResult;
  uint64_t v2 = [(PHFetchResult *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [(id)objc_opt_class() emptyFetchResultChangeHandlingKey];
    id changeHandlingKey = v2->_changeHandlingKey;
    v2->_id changeHandlingKey = (id)v3;

    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("PHFetchResult", v5);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v6;

    v2->_countsLock._os_unfair_lock_opaque = 0;
    *(int64x2_t *)&v2->_albumsCount = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v2->_foldersCount = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v2;
}

+ (id)emptyFetchResultChangeHandlingKey
{
  return @"EmptyFetchResultKey";
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v8 = [(PHFetchResult *)self fetchedObjects];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (NSUInteger)count
{
  if (self->_prefetchCount)
  {
    prefetchCount = self->_prefetchCount;
    return [(NSNumber *)prefetchCount unsignedIntegerValue];
  }
  else
  {
    unint64_t v4 = [(PHFetchResult *)self fetchedObjects];
    NSUInteger v5 = [v4 count];

    return v5;
  }
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
  unint64_t v4 = [(PHFetchResult *)self fetchedObjects];
  NSUInteger v5 = [v4 objectAtIndex:idx];

  return v5;
}

- (id)fetchedObjectsUsingManagedObjectContext:(id)a3
{
  id v4 = a3;
  isolationQueue = self->_isolationQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__PHFetchResult_fetchedObjectsUsingManagedObjectContext___block_invoke;
  v9[3] = &unk_1E5848DF0;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(isolationQueue, v9);
  BOOL v7 = self->_fetchedObjects;

  return v7;
}

- (NSArray)fetchedObjects
{
  return (NSArray *)[(PHFetchResult *)self fetchedObjectsUsingManagedObjectContext:0];
}

- (id)objectAtIndex:(NSUInteger)index
{
  id v4 = [(PHFetchResult *)self fetchedObjects];
  NSUInteger v5 = [v4 objectAtIndex:index];

  return v5;
}

+ (id)fetchObjectIDs:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = objc_alloc_init(PHFetchResultInstrumentation);
  id v10 = v7;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fetchResult, a3);
    id v11 = [v10 fetchOptions];
    uint64_t v12 = [v11 importantFetchName];
    importantFetchName = v9->_importantFetchName;
    v9->_importantFetchName = (NSString *)v12;

    uint64_t v14 = [v10 fetchOptions];
    v9->_suppressSlowFetchReports = [v14 suppressSlowFetchReports];

    v15 = [v10 fetchRequest];
    if (kdebug_is_enabled())
    {
      PLPhotoKitGetLog();
      uint64_t v16 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v17 = os_signpost_id_generate(v16);

      int v18 = v16;
      uint64_t v19 = v18;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        uint64_t v20 = [v15 entityName];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v20;
        _os_signpost_emit_with_name_impl(&dword_19B043000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "FetchObjectIDs", "Entity: %@", (uint8_t *)&buf, 0xCu);
      }
      log = v9->_fetchSignpost.log;
      v9->_fetchSignpost.log = (OS_os_log *)v19;

      v9->_fetchSignpost.os_signpost_id_t signpostId = v17;
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000;
  long long v38 = __Block_byref_object_copy__49293;
  long long v39 = __Block_byref_object_dispose__49294;
  id v40 = 0;
  uint64_t v22 = [v10 fetchRequest];
  if (v22)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __55__PHFetchResult_fetchObjectIDs_inManagedObjectContext___block_invoke;
    v30[3] = &unk_1E5848DA8;
    p_long long buf = &buf;
    uint64_t v31 = v9;
    id v32 = v22;
    id v33 = v8;
    id v34 = v10;
    [v33 performBlockAndWait:v30];

    p_super = &v31->super;
  }
  else
  {
    p_super = PLPhotoKitGetLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v41 = 0;
      _os_log_impl(&dword_19B043000, p_super, OS_LOG_TYPE_ERROR, "fetchObjectIDs found NULL fetch request, returning empty array", v41, 2u);
    }
  }

  id v24 = [a1 postProcessFetchedObjectIDs:*(void *)(*((void *)&buf + 1) + 40) forFetchResult:v10 fetchRequest:v22];
  if (v9 && kdebug_is_enabled())
  {
    uint64_t v25 = v9->_fetchSignpost.log;
    v26 = v25;
    os_signpost_id_t signpostId = v9->_fetchSignpost.signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      uint64_t v28 = [v24 count];
      *(_DWORD *)uint64_t v41 = 134217984;
      uint64_t v42 = v28;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v26, OS_SIGNPOST_INTERVAL_END, signpostId, "FetchObjectIDs", "%tu", v41, 0xCu);
    }
  }
  _Block_object_dispose(&buf, 8);

  return v24;
}

- (PHFetchOptions)fetchOptions
{
  uint64_t v2 = [(PHFetchResult *)self query];
  uint64_t v3 = [v2 fetchOptions];

  return (PHFetchOptions *)v3;
}

- (NSFetchRequest)fetchRequest
{
  uint64_t v2 = [(PHFetchResult *)self query];
  uint64_t v3 = [v2 fetchRequest];

  return (NSFetchRequest *)v3;
}

- (PHQuery)query
{
  return (PHQuery *)objc_getProperty(self, a2, 136, 1);
}

- (NSString)fetchType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)fetchPropertySets
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)updateRegistrationForChangeNotificationDeltas
{
  uint64_t v3 = [(PHFetchResult *)self query];
  id v5 = [v3 fetchOptions];

  if (v5) {
    uint64_t v4 = [v5 wantsIncrementalChangeDetails];
  }
  else {
    uint64_t v4 = 1;
  }
  [(PHFetchResult *)self setRegisteredForChangeNotificationDeltas:v4];
}

- (void)setRegisteredForChangeNotificationDeltas:(BOOL)a3
{
  if (self->_registeredForChangeNotificationDeltas != a3)
  {
    BOOL v3 = a3;
    id v5 = [(PHFetchResult *)self photoLibrary];
    id v6 = v5;
    if (v3) {
      [v5 registerFetchResult:self];
    }
    else {
      [v5 unregisterFetchResult:self];
    }

    self->_registeredForChangeNotificationDeltas = v3;
  }
}

+ (id)postProcessFetchedObjectIDs:(id)a3 forFetchResult:(id)a4 fetchRequest:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![v7 count])
  {
    v15 = v7;
LABEL_19:
    id v30 = [MEMORY[0x1E4F1C978] array];
    goto LABEL_20;
  }
  if ([v9 resultType] == 2
    && ([v7 firstObject],
        id v10 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v10,
        (isKindOfClass & 1) != 0))
  {
    uint64_t v12 = [v7 firstObject];
    uint64_t v13 = [v12 mapping];

    uint64_t v14 = [v13 indexForKey:@"objectID"];
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v16 = v7;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(v16);
          }
          __int16 v21 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "valueAtIndex:", v14, (void)v32);
          [v15 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v18);
    }
  }
  else
  {
    v15 = v7;
  }
  uint64_t v22 = objc_msgSend(v8, "query", (void)v32);
  uint64_t v23 = [v22 fetchOptions];
  id v24 = [v23 relatedEntityName];

  if (!v24) {
    goto LABEL_15;
  }
  uint64_t v25 = [v15 firstObject];
  v26 = [v25 entity];
  int v27 = [v26 name];

  if (!v27)
  {
LABEL_15:
    int v27 = [v9 entityName];
  }
  uint64_t v28 = +[PHFetchResult cleanedAndSortedOIDsFrom:v15 usingFetchOptions:v23];
  uint64_t v29 = [v22 photoLibrary];
  id v30 = +[PHFetchResult filteredOIDsFrom:v28 usingEntityName:v27 withPhotoLibrary:v29];

  if (!v30) {
    goto LABEL_19;
  }
LABEL_20:

  return v30;
}

+ (id)cleanedAndSortedOIDsFrom:(id)a3 usingFetchOptions:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[PHPhotoLibrary uniquedOIDs:v5];
  id v8 = [v6 customObjectIDSortOrder];
  if (v8)
  {
    id v26 = v6;
    id v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v33 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          if ([v9 containsObject:v16]) {
            [v10 addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v13);
    }
    id v27 = v5;

    uint64_t v17 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v18 = v7;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v28 + 1) + 8 * j);
          if (([v17 containsObject:v23] & 1) == 0) {
            [v10 addObject:v23];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v20);
    }

    id v6 = v26;
    id v5 = v27;
  }
  else
  {
    id v10 = v7;
  }
  id v24 = v10;

  return v24;
}

+ (id)filteredOIDsFrom:(id)a3 usingEntityName:(id)a4 withPhotoLibrary:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [a5 allowedEntities];
  id v10 = [v9 member:v8];

  if (v10) {
    id v11 = v7;
  }
  else {
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (PHPhotoLibrary)photoLibrary
{
  uint64_t v2 = [(PHFetchResult *)self query];
  BOOL v3 = [v2 photoLibrary];

  return (PHPhotoLibrary *)v3;
}

void __32__PHFetchResult_thumbnailAssets__block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (!v2[9])
  {
    uint64_t v3 = [v2 _createFetchedPropertyObjectsWithClass:a1[6] fetchedObjectIDs:a1[5]];
    uint64_t v4 = a1[4];
    id v5 = *(void **)(v4 + 72);
    *(void *)(v4 + 72) = v3;
  }
}

- (void)prefetchThumbnailAssetsAtIndexes:(id)a3
{
  id v4 = a3;
  id v5 = [(PHFetchResult *)self thumbnailAssets];
  [v5 prefetchObjectsAtIndexes:v4];
}

- (void)prefetchObjectsAtIndexes:(id)a3
{
  id v4 = a3;
  id v5 = [(PHFetchResult *)self fetchedObjects];
  [v5 prefetchObjectsAtIndexes:v4];
}

- (id)_createFetchedPropertyObjectsWithClass:(Class)a3 fetchedObjectIDs:(id)a4
{
  v16[3] = *MEMORY[0x1E4F143B8];
  v15[0] = @"batchSize";
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "numberWithInteger:", -[objc_class batchSize](a3, "batchSize"));
  v16[0] = v8;
  v15[1] = @"cacheSize";
  id v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[objc_class cacheSize](a3, "cacheSize"));
  v15[2] = @"fetchedObjectBatchPropertySetClass";
  v16[1] = v9;
  v16[2] = a3;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  id v11 = [PHBatchFetchingArray alloc];
  uint64_t v12 = [(PHFetchResult *)self photoLibrary];
  uint64_t v13 = [(PHBatchFetchingArray *)v11 initWithOIDs:v7 options:v10 photoLibrary:v12];

  return v13;
}

- (NSArray)thumbnailAssets
{
  uint64_t v3 = objc_opt_class();
  if (!self->_thumbnailAssets)
  {
    id v4 = (void *)v3;
    unint64_t v5 = [(PHFetchResult *)self count];
    if (v5 > [v4 batchSize])
    {
      if ([(PHFetchResult *)self _canCreateFetchedPropertyObjectsWithClass:v4])
      {
        id v6 = [(PHFetchResult *)self fetchedObjectIDs];
        isolationQueue = self->_isolationQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __32__PHFetchResult_thumbnailAssets__block_invoke;
        block[3] = &unk_1E5848E40;
        id v12 = v6;
        uint64_t v13 = v4;
        block[4] = self;
        id v8 = v6;
        dispatch_sync(isolationQueue, block);
      }
    }
  }
  thumbnailAssets = self->_thumbnailAssets;

  return thumbnailAssets;
}

- (PHFetchResult)initWithQuery:(id)a3 registerIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 seedOIDs];
    id v9 = [(PHFetchResult *)self initWithQuery:v7 oids:v8 registerIfNeeded:v4 usingManagedObjectContext:0];
  }
  else
  {
    id v10 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_FAULT, "PHFetchRequest initWithQuery: initialized with nil query", v12, 2u);
    }

    id v9 = [(PHFetchResult *)self init];
  }

  return v9;
}

- (PHFetchResult)initWithQuery:(id)a3
{
  return [(PHFetchResult *)self initWithQuery:a3 registerIfNeeded:1];
}

- (PHFetchResult)initWithMediaTypeCounts:(id)a3
{
  id v5 = a3;
  id v6 = [(PHFetchResult *)self init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mediaTypeCounts, a3);
  }

  return v7;
}

+ (id)pointerComparableIdentifiersFromIdentifiers:(id)a3
{
  return a3;
}

- (id)additionalChangedIdentifiersFromPreviousIdentifiers:(id)a3 currentIdentifiers:(id)a4 inFetchResultBeforeChanges:(id)a5
{
  return 0;
}

- (id)firstObject
{
  uint64_t v2 = [(PHFetchResult *)self fetchedObjects];
  uint64_t v3 = [v2 firstObject];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_mediaTypeCounts, 0);
  objc_storeStrong((id *)&self->_prefetchCount, 0);
  objc_storeStrong((id *)&self->_thumbnailAssets, 0);
  objc_storeStrong(&self->_changeHandlingKey, 0);
  objc_storeStrong((id *)&self->_seedOIDs, 0);
  objc_storeStrong((id *)&self->_fetchedPropertySetsCache, 0);
  objc_storeStrong((id *)&self->_fetchedObjects, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_storeStrong((id *)&self->_fetchPropertySets, 0);

  objc_storeStrong((id *)&self->_fetchType, 0);
}

- (void)dealloc
{
  uint64_t v3 = [(PHQuery *)self->_query photoLibrary];
  [v3 unregisterFetchResult:self];

  v4.receiver = self;
  v4.super_class = (Class)PHFetchResult;
  [(PHFetchResult *)&v4 dealloc];
}

- (NSArray)fetchSortDescriptors
{
  uint64_t v2 = [(PHFetchResult *)self fetchRequest];
  uint64_t v3 = [v2 sortDescriptors];

  return (NSArray *)v3;
}

- (NSSet)fetchedObjectIDsSet
{
  uint64_t v2 = [(PHFetchResult *)self fetchedObjects];
  uint64_t v3 = [v2 oidsSet];

  return (NSSet *)v3;
}

void __48__PHFetchResult__typesToCountForListCollections__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EEB26760, 0);
  uint64_t v1 = (void *)_typesToCountForListCollections_typesToCountForListCollections;
  _typesToCountForListCollections_typesToCountForListCollections = v0;
}

void __49__PHFetchResult__typesToCountForAssetCollections__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EEB264D8, &unk_1EEB264F0, &unk_1EEB26508, &unk_1EEB26520, &unk_1EEB26538, &unk_1EEB26550, &unk_1EEB26568, &unk_1EEB26580, &unk_1EEB26598, &unk_1EEB265B0, &unk_1EEB265C8, &unk_1EEB265E0, &unk_1EEB265F8, &unk_1EEB26610, &unk_1EEB26628, &unk_1EEB26640, &unk_1EEB26658,
    &unk_1EEB26670,
    &unk_1EEB26688,
    &unk_1EEB266A0,
    &unk_1EEB266B8,
    &unk_1EEB266D0,
    &unk_1EEB266E8,
    &unk_1EEB26700,
    &unk_1EEB26718,
    &unk_1EEB26730,
    &unk_1EEB26748,
  uint64_t v0 = 0);
  uint64_t v1 = (void *)_typesToCountForAssetCollections_typesToCountForAssetCollections;
  _typesToCountForAssetCollections_typesToCountForAssetCollections = v0;
}

void __57__PHFetchResult_fetchObjectCount_inManagedObjectContext___block_invoke(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)a1[4];
  uint64_t v2 = (void *)a1[5];
  objc_super v4 = (void *)a1[6];
  id v13 = 0;
  id v5 = v2;
  id v6 = v4;
  if (v3)
  {
    [v3 willExecuteFetchRequestWithContext:v6];
    uint64_t v7 = [v6 countForFetchRequest:v5 error:&v13];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [v3 didFailFetchRequestWithContext:v6];
      uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v8 = v7;
      [v3 didExecuteFetchRequestWithContext:v6 resultCount:v7 sqlString:0 bindVariables:0];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  id v9 = v13;
  *(void *)(*(void *)(a1[8] + 8) + 24) = v8;
  if (*(void *)(*(void *)(a1[8] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = a1[5];
      uint64_t v12 = a1[7];
      *(_DWORD *)long long buf = 138412802;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_FAULT, "Error executing count fetch %@ for %@: %@", buf, 0x20u);
    }
  }
}

+ (id)fetchObjectCount:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(PHFetchResultInstrumentation);
  id v8 = v5;
  id v9 = v8;
  if (v7)
  {
    id v10 = [v8 fetchRequest];
    uint64_t v11 = [v9 fetchOptions];
    v7->_suppressSlowFetchReports = [v11 suppressSlowFetchReports];

    if (kdebug_is_enabled())
    {
      PLPhotoKitGetLog();
      uint64_t v12 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v13 = os_signpost_id_generate(v12);

      uint64_t v14 = v12;
      uint64_t v15 = v14;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        __int16 v16 = [v10 entityName];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v16;
        _os_signpost_emit_with_name_impl(&dword_19B043000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "FetchCount", "Entity: %@", (uint8_t *)&buf, 0xCu);
      }
      log = v7->_fetchSignpost.log;
      v7->_fetchSignpost.log = (OS_os_log *)v15;

      v7->_fetchSignpost.os_signpost_id_t signpostId = v13;
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  __int16 v18 = [v9 fetchRequest];
  if (v18)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __57__PHFetchResult_fetchObjectCount_inManagedObjectContext___block_invoke;
    v26[3] = &unk_1E5848DA8;
    p_long long buf = &buf;
    id v27 = v7;
    id v28 = v18;
    id v29 = v6;
    id v30 = v9;
    [v29 performBlockAndWait:v26];

    p_super = &v27->super;
  }
  else
  {
    p_super = PLPhotoKitGetLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v35 = 0;
      _os_log_impl(&dword_19B043000, p_super, OS_LOG_TYPE_ERROR, "fetchObjectCount found NULL fetch request, returning zero count", v35, 2u);
    }
  }

  if (v7)
  {
    uint64_t v20 = *(void *)(*((void *)&buf + 1) + 24);
    if (kdebug_is_enabled())
    {
      uint64_t v21 = v7->_fetchSignpost.log;
      uint64_t v22 = v21;
      os_signpost_id_t signpostId = v7->_fetchSignpost.signpostId;
      if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_DWORD *)long long v35 = 134217984;
        uint64_t v36 = v20;
        _os_signpost_emit_with_name_impl(&dword_19B043000, v22, OS_SIGNPOST_INTERVAL_END, signpostId, "FetchCount", "count: %tu", v35, 0xCu);
      }
    }
  }
  id v24 = [NSNumber numberWithUnsignedInteger:*(void *)(*((void *)&buf + 1) + 24)];

  _Block_object_dispose(&buf, 8);

  return v24;
}

- (id)pl_photoLibraryObject
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2 object:self file:@"PHAdoptionUtilities.m" lineNumber:208 description:@"This is only callable on the main thread"];
  }
  objc_super v4 = [(PHFetchResult *)self containerIdentifier];

  id v5 = (void *)MEMORY[0x19F389B10]();
  id v6 = [(PHFetchResult *)self photoLibrary];
  uint64_t v7 = [v6 mainQueueConcurrencyPhotoLibrary];
  id v8 = [v7 managedObjectContext];

  if (!v4)
  {
    uint64_t v11 = [(PHFetchResult *)self firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([(PHFetchResult *)v11 isTransient])
        {
          os_signpost_id_t v13 = [MEMORY[0x1E4F1CA70] orderedSet];
          v53[0] = MEMORY[0x1E4F143A8];
          v53[1] = 3221225472;
          v53[2] = __59__PHFetchResult_PHAdoptionUtilities__pl_photoLibraryObject__block_invoke;
          v53[3] = &unk_1E5843C70;
          v53[4] = self;
          v54 = v13;
          uint64_t v12 = v13;
          [(PHFetchResult *)self enumerateObjectsUsingBlock:v53];
          id v10 = (void *)[objc_alloc(MEMORY[0x1E4F8ABE8]) initWithAssetContainers:v12];
          uint64_t v14 = v54;
LABEL_47:

          goto LABEL_48;
        }
      }
    }
    uint64_t v12 = [(id)objc_opt_class() managedEntityName];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [(PHFetchResult *)self objectIDs];
      __int16 v16 = [v15 array];
    }
    else
    {
      __int16 v16 = [(PHFetchResult *)self fetchedObjectIDs];
      if (v12)
      {
LABEL_17:
        if ([v16 count])
        {
          __int16 v18 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v12];
          id v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v16];
          [v18 setPredicate:v19];

          uint64_t v20 = [v8 executeFetchRequest:v18 error:0];

LABEL_22:
          __int16 v44 = v16;
          if (v20)
          {
            uint64_t v43 = v5;
            uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
            long long v49 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            uint64_t v42 = v20;
            id v23 = v20;
            uint64_t v24 = [v23 countByEnumeratingWithState:&v49 objects:v57 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v50;
              do
              {
                for (uint64_t i = 0; i != v25; ++i)
                {
                  if (*(void *)v50 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  id v28 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                  id v29 = [v28 objectID];
                  [v22 setObject:v28 forKey:v29];
                }
                uint64_t v25 = [v23 countByEnumeratingWithState:&v49 objects:v57 count:16];
              }
              while (v25);
            }

            id v30 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v23, "count"));
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id v31 = v44;
            uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v56 count:16];
            if (v32)
            {
              uint64_t v33 = v32;
              uint64_t v34 = *(void *)v46;
              do
              {
                for (uint64_t j = 0; j != v33; ++j)
                {
                  if (*(void *)v46 != v34) {
                    objc_enumerationMutation(v31);
                  }
                  uint64_t v36 = [v22 objectForKey:*(void *)(*((void *)&v45 + 1) + 8 * j)];
                  if (v36) {
                    [v30 addObject:v36];
                  }
                }
                uint64_t v33 = [v31 countByEnumeratingWithState:&v45 objects:v56 count:16];
              }
              while (v33);
            }

            uint64_t v37 = +[PHAsset managedEntityName];
            int v38 = [v12 isEqualToString:v37];

            if (v38) {
              uint64_t v39 = [objc_alloc(MEMORY[0x1E4F8ABE0]) initWithTitle:&stru_1EEAC1950 assets:v30];
            }
            else {
              uint64_t v39 = [objc_alloc(MEMORY[0x1E4F8ABE8]) initWithAssetContainers:v30];
            }
            id v10 = (void *)v39;
            uint64_t v20 = v42;
            id v5 = v43;
          }
          else
          {
            uint64_t v22 = PLPhotoKitGetLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              v59 = 0;
              _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_DEFAULT, "Failed to fetch managedObject for fetchresult result: %@", buf, 0xCu);
            }
            id v10 = 0;
          }

          uint64_t v14 = v44;
          goto LABEL_47;
        }
LABEL_19:
        uint64_t v20 = [MEMORY[0x1E4F1C978] array];
        uint64_t v21 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412802;
          v59 = self;
          __int16 v60 = 2112;
          v61 = v12;
          __int16 v62 = 2112;
          v63 = v16;
          _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_DEFAULT, "Cannot to fetch managedObject for fetchresult result: %@, with entityName %@ and objectIDs %@", buf, 0x20u);
        }

        goto LABEL_22;
      }
      uint64_t v15 = [(PHFetchResult *)self query];
      uint64_t v17 = [v15 fetchRequest];
      uint64_t v12 = [v17 entityName];
    }
    if (!v12) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  id v9 = [(PHFetchResult *)self containerIdentifier];
  id v55 = 0;
  id v10 = [v8 existingObjectWithID:v9 error:&v55];
  uint64_t v11 = (PHFetchResult *)v55;

  if (v10) {
    goto LABEL_49;
  }
  uint64_t v12 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    v59 = v11;
    _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEFAULT, "Failed to fetch container for fetchresult: %@", buf, 0xCu);
  }
  id v10 = 0;
LABEL_48:

LABEL_49:

  return v10;
}

void __59__PHFetchResult_PHAdoptionUtilities__pl_photoLibraryObject__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 photoLibrary];
  id v8 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:v5 orObject:v4];

  [v8 setIncludeHiddenAssets:1];
  id v6 = +[PHAsset fetchAssetsInAssetCollection:v4 options:v8];

  uint64_t v7 = objc_msgSend(v6, "pl_photoLibraryObject");
  [*(id *)(a1 + 40) addObject:v7];
}

+ (id)pl_fetchResultForStandInAssetCollection:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "pl_assetContainer");
  id v5 = [v3 photoLibrary];
  id v6 = [v5 mainQueueConcurrencyPhotoLibrary];

  uint64_t v7 = objc_msgSend(v6, "albumListForAlbumOfKind:", objc_msgSend(v4, "kindValue"));
  id v8 = [v3 photoLibrary];

  id v9 = +[PHFetchResult pl_fetchResultForAssetContainerList:v7 photoLibrary:v8];

  return v9;
}

+ (id)pl_fetchResultForAssetContainerList:(id)a3 photoLibrary:(id)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v5 uuid];
    v41[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
    id v9 = [v6 librarySpecificFetchOptions];
    id v10 = +[PHCollectionList fetchCollectionListsWithLocalIdentifiers:v8 options:v9];
    id v11 = [v10 firstObject];

    uint64_t v12 = +[PHCollection fetchCollectionsInCollectionList:v11 options:0];
  }
  else
  {
    NSClassFromString(&cfstr_Pxfeedassetcon.isa);
    if (objc_opt_isKindOfClass())
    {
      if (objc_opt_respondsToSelector())
      {
        id v11 = [v5 performSelector:sel_transientIdentifier];
      }
      else
      {
        id v11 = 0;
      }
      uint64_t v21 = [v5 containers];
      uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v21, "count"));
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v23 = v21;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v36 != v26) {
              objc_enumerationMutation(v23);
            }
            id v28 = +[PHAssetCollection pl_PHAssetCollectionForAssetContainer:*(void *)(*((void *)&v35 + 1) + 8 * i) photoLibrary:v6];
            if (v28) {
              [v22 addObject:v28];
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v25);
      }

      id v29 = +[PHCollectionList transientCollectionListWithCollections:v22 title:&stru_1EEAC1950 identifier:v11 photoLibrary:v6];
      uint64_t v12 = +[PHCollection fetchCollectionsInCollectionList:v29 options:0];
    }
    else
    {
      os_signpost_id_t v13 = [v5 containers];
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v11 = v13;
      uint64_t v15 = [v11 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v32 != v17) {
              objc_enumerationMutation(v11);
            }
            id v19 = +[PHAssetCollection pl_PHAssetCollectionForAssetContainer:photoLibrary:](PHAssetCollection, "pl_PHAssetCollectionForAssetContainer:photoLibrary:", *(void *)(*((void *)&v31 + 1) + 8 * j), v6, (void)v31);
            if (v19) {
              [v14 addObject:v19];
            }
          }
          uint64_t v16 = [v11 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v16);
      }

      uint64_t v20 = +[PHCollectionList transientCollectionListWithCollections:v14 title:&stru_1EEAC1950];
      uint64_t v12 = +[PHCollection fetchCollectionsInCollectionList:v20 options:0];
    }
  }

  return v12;
}

+ (id)pl_filterPredicateForAssetContainer:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"PHAdoptionUtilities.m" lineNumber:490 description:@"This is only callable on the main thread"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 backingAlbum];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v5 predicate];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)pl_fetchResultContainingAssetContainer:(id)a3 photoLibrary:(id)a4 includeTrash:(BOOL)a5
{
  BOOL v5 = a5;
  v78[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_opt_class();
  int v11 = [v10 isEqual:objc_opt_class()];
  uint64_t v12 = [v9 librarySpecificFetchOptions];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    os_signpost_id_t v13 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v14 = [v8 objectID];
    v78[0] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:1];
    uint64_t v16 = [v13 predicateWithFormat:@"self IN %@", v15];
    [v12 setInternalPredicate:v16];

    uint64_t v17 = +[PHAssetCollection fetchMomentsWithOptions:v12];
    goto LABEL_72;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = v8;
    int v19 = [v18 kindValue];
    switch(v19)
    {
      case 1605:
        uint64_t v20 = 2;
        uint64_t v21 = 201;
        goto LABEL_69;
      case 1606:
        uint64_t v20 = 2;
        uint64_t v21 = 202;
        goto LABEL_69;
      case 1607:
      case 1608:
      case 1625:
      case 1629:
      case 1633:
      case 1635:
      case 1637:
      case 1638:
        goto LABEL_36;
      case 1609:
        uint64_t v20 = 2;
        uint64_t v21 = 203;
        goto LABEL_69;
      case 1610:
        uint64_t v20 = 2;
        uint64_t v21 = 204;
        goto LABEL_69;
      case 1611:
        uint64_t v20 = 2;
        uint64_t v21 = 205;
        goto LABEL_69;
      case 1612:
        uint64_t v58 = 200;
        goto LABEL_67;
      case 1613:
        uint64_t v20 = 2;
        uint64_t v21 = 209;
        goto LABEL_69;
      case 1614:
        uint64_t v20 = 2;
        uint64_t v21 = 207;
        goto LABEL_69;
      case 1615:
        uint64_t v20 = 2;
        uint64_t v21 = 208;
        goto LABEL_69;
      case 1616:
        uint64_t v20 = 2;
        uint64_t v21 = 206;
        goto LABEL_69;
      case 1617:
        uint64_t v20 = 2;
        uint64_t v21 = 210;
        goto LABEL_69;
      case 1618:
        uint64_t v20 = 2;
        uint64_t v21 = 211;
        goto LABEL_69;
      case 1619:
        [v12 setIncludePlacesSmartAlbum:1];
        uint64_t v58 = 202;
        goto LABEL_67;
      case 1620:
        uint64_t v20 = 2;
        uint64_t v21 = 212;
        goto LABEL_69;
      case 1621:
        uint64_t v20 = 2;
        uint64_t v21 = 213;
        goto LABEL_69;
      case 1622:
        uint64_t v20 = 2;
        uint64_t v21 = 214;
        goto LABEL_69;
      case 1623:
        uint64_t v20 = 2;
        uint64_t v21 = 215;
        goto LABEL_69;
      case 1624:
        uint64_t v20 = 2;
        uint64_t v21 = 216;
        goto LABEL_69;
      case 1626:
        [v12 setIncludeRecentlyEditedSmartAlbum:1];
        uint64_t v21 = 1000000206;
        goto LABEL_68;
      case 1627:
        [v12 setIncludeScreenRecordingsSmartAlbum:1];
        uint64_t v58 = 206;
        goto LABEL_67;
      case 1628:
        [v12 setIncludeAllPhotosSmartAlbum:1];
        uint64_t v58 = 204;
        goto LABEL_67;
      case 1630:
        uint64_t v20 = 2;
        uint64_t v21 = 217;
        goto LABEL_69;
      case 1631:
        uint64_t v20 = 2;
        uint64_t v21 = 218;
        goto LABEL_69;
      case 1632:
        [v12 setIncludeProResSmartAlbum:1];
        uint64_t v58 = 210;
        goto LABEL_67;
      case 1634:
        [v12 setIncludeDuplicatesAlbums:1];
        uint64_t v21 = 1000000212;
        goto LABEL_68;
      case 1636:
        [v12 setIncludeSharedLibrarySharingSuggestionsSmartAlbum:1];
        uint64_t v21 = 1000000214;
        goto LABEL_68;
      case 1639:
        uint64_t v20 = 2;
        uint64_t v21 = 219;
        goto LABEL_69;
      case 1640:
        uint64_t v21 = 1000000218;
        goto LABEL_68;
      case 1641:
        uint64_t v58 = 218;
LABEL_67:
        uint64_t v21 = v58 | 0x3B9ACA01;
LABEL_68:
        uint64_t v20 = 2;
        goto LABEL_69;
      default:
        if (v19 != 1000)
        {
LABEL_36:
          id v29 = [v18 objectID];
          id v77 = v29;
          long long v36 = (void *)MEMORY[0x1E4F1C978];
          long long v37 = &v77;
          goto LABEL_37;
        }
        uint64_t v20 = 1;
        uint64_t v21 = 1000000001;
LABEL_69:
        uint64_t v26 = +[PHAssetCollection fetchAssetCollectionsWithType:v20 subtype:v21 options:v12];
        break;
    }
    goto LABEL_70;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = [v8 backingAlbum];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v22 = (void *)MEMORY[0x1E4F28F60];
      id v23 = [v18 objectID];
      v76 = v23;
      uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
      uint64_t v25 = [v22 predicateWithFormat:@"self IN %@", v24];
      [v12 setInternalPredicate:v25];

      uint64_t v26 = +[PHAssetCollection fetchMomentsWithOptions:v12];
LABEL_70:
      uint64_t v17 = (void *)v26;
      goto LABEL_71;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v17 = 0;
LABEL_71:

      goto LABEL_72;
    }
    if ([v18 kindValue] == 1628) {
      [v12 setIncludeAllPhotosSmartAlbum:1];
    }
    id v29 = [v18 objectID];
    id v75 = v29;
    long long v36 = (void *)MEMORY[0x1E4F1C978];
    long long v37 = &v75;
LABEL_37:
    v57 = [v36 arrayWithObjects:v37 count:1];
    uint64_t v17 = +[PHAssetCollection fetchAssetCollectionsWithObjectIDs:v57 options:v12];

LABEL_38:
    goto LABEL_71;
  }
  id v27 = objc_opt_class();
  if ([v27 isEqual:NSClassFromString(&cfstr_Pumapalbum.isa)])
  {
    [v12 setIncludeHiddenAssets:1];
    id v18 = [v8 assets];
    id v28 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v18, "count"));
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __103__PHFetchResult_PHAdoptionUtilities__pl_fetchResultContainingAssetContainer_photoLibrary_includeTrash___block_invoke;
    v66[3] = &unk_1E5843C98;
    id v67 = v28;
    id v29 = v28;
    [v18 enumerateObjectsUsingBlock:v66];
    id v30 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v29];
    [v12 setInternalPredicate:v30];

    [v12 setIncludeAssetSourceTypes:7];
    long long v31 = +[PHAsset fetchAssetsWithOptions:v12];
    long long v32 = [v8 localizedTitle];
    long long v33 = +[PHAssetCollection transientAssetCollectionWithAssetFetchResult:v31 title:v32];

    v74 = v33;
    long long v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
    long long v35 = +[PHCollectionList transientCollectionListWithCollections:v34 title:0];

    uint64_t v17 = +[PHCollection fetchCollectionsInCollectionList:v35 options:0];

    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (long long v38 = objc_opt_class(),
        ([v38 isEqual:NSClassFromString(&cfstr_Pxfeedassetsse.isa)] & 1) != 0)
    || (uint64_t v39 = objc_opt_class(),
        ([v39 isEqual:NSClassFromString(&cfstr_Pxfeedcomments.isa)] & 1) != 0)
    || (id v40 = objc_opt_class(),
        ([v40 isEqual:NSClassFromString(&cfstr_Pxfeedsubscrip.isa)] | v11) == 1))
  {
    v63 = (void *)[v12 copy];
    [v12 setIncludeHiddenAssets:1];
    uint64_t v41 = [v8 assets];
    uint64_t v42 = [MEMORY[0x1E4F1CA48] array];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __103__PHFetchResult_PHAdoptionUtilities__pl_fetchResultContainingAssetContainer_photoLibrary_includeTrash___block_invoke_2;
    v64[3] = &unk_1E5843C98;
    id v43 = v42;
    id v65 = v43;
    __int16 v62 = v41;
    [v41 enumerateObjectsUsingBlock:v64];
    __int16 v44 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v43];
    [v12 setInternalPredicate:v44];

    long long v45 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
    v73 = v45;
    long long v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
    [v12 setSortDescriptors:v46];

    [v12 setCustomObjectIDSortOrder:v43];
    if (v11) {
      [v12 setIncludeAllBurstAssets:1];
    }
    if (v5) {
      [v12 setIncludeTrashedAssets:1];
    }
    [v12 setIncludeAssetSourceTypes:7];
    long long v47 = +[PHAsset fetchAssetsWithOptions:v12];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v48 = [v8 performSelector:sel_transientIdentifier];
    }
    else
    {
      if (!v11)
      {
        long long v49 = 0;
        goto LABEL_30;
      }
      uint64_t v48 = [v8 uuid];
    }
    long long v49 = (void *)v48;
LABEL_30:
    uint64_t v50 = [v8 canShowComments];
    if (v50) {
      uint64_t v51 = 101;
    }
    else {
      uint64_t v51 = 200;
    }
    long long v52 = [PHAssetCollection alloc];
    uint64_t v53 = [v8 localizedTitle];
    id v54 = [(PHAssetCollection *)v52 initTransientWithAssets:0 orFetchResult:v47 title:v53 identifier:v49 albumKind:2 subtype:v51];

    [v54 _setCanShowCloudComments:v50];
    id v72 = v54;
    id v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
    v56 = +[PHCollectionList transientCollectionListWithCollections:v55 title:0];

    uint64_t v17 = +[PHCollection fetchCollectionsInCollectionList:v56 options:v63];

    goto LABEL_72;
  }
  __int16 v60 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
  {
    v61 = NSStringFromSelector(a2);
    *(_DWORD *)long long buf = 138412546;
    v69 = v61;
    __int16 v70 = 2112;
    id v71 = v8;
    _os_log_impl(&dword_19B043000, v60, OS_LOG_TYPE_DEBUG, "##### %@: Unhandled album %@", buf, 0x16u);
  }
  uint64_t v17 = 0;
LABEL_72:

  return v17;
}

void __103__PHFetchResult_PHAdoptionUtilities__pl_fetchResultContainingAssetContainer_photoLibrary_includeTrash___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectID];
  [*(id *)(a1 + 32) addObject:v3];
}

void __103__PHFetchResult_PHAdoptionUtilities__pl_fetchResultContainingAssetContainer_photoLibrary_includeTrash___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 objectID];
  [*(id *)(a1 + 32) addObject:v3];
}

+ (id)pl_fetchResultContainingAssetContainer:(id)a3 photoLibrary:(id)a4
{
  return +[PHFetchResult pl_fetchResultContainingAssetContainer:a3 photoLibrary:a4 includeTrash:0];
}

- (void)setPreventsClearingOIDCache:(BOOL)a3
{
  self->_preventsClearingOIDCache = a3;
}

- (BOOL)preventsClearingOIDCache
{
  return self->_preventsClearingOIDCache;
}

- (void)setChunkSizeForFetch:(int64_t)a3
{
  self->_chunkSizeForFetch = a3;
}

- (int64_t)chunkSizeForFetch
{
  return self->_chunkSizeForFetch;
}

- (id)description
{
  v15.receiver = self;
  v15.super_class = (Class)PHFetchResult;
  id v3 = [(PHFetchResult *)&v15 description];
  prefetchCount = self->_prefetchCount;
  if (prefetchCount)
  {
    uint64_t v5 = objc_msgSend(v3, "stringByAppendingFormat:", @" prefetchCount=%lu", -[NSNumber unsignedLongValue](prefetchCount, "unsignedLongValue"));

    id v3 = (void *)v5;
  }
  fetchedObjects = self->_fetchedObjects;
  if (fetchedObjects) {
    objc_msgSend(v3, "stringByAppendingFormat:", @" count=%lu", -[PHBatchFetchingArray count](fetchedObjects, "count"));
  }
  else {
  uint64_t v7 = objc_msgSend(v3, "stringByAppendingFormat:", @" count=(NA)", v14);
  }

  id v8 = [(PHFetchResult *)self containerIdentifier];
  int64_t v9 = [(PHFetchResult *)self collectionFetchType];
  id v10 = [(PHFetchResult *)self query];
  int v11 = [v10 shortDescription];
  uint64_t v12 = [v7 stringByAppendingFormat:@" CID=%@, CFT=%ld query=%@", v8, v9, v11];

  return v12;
}

- (id)localIdentifiers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self;
  uint64_t v5 = [(PHFetchResult *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        int64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "localIdentifier", (void)v12);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(PHFetchResult *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];

  return v10;
}

- (BOOL)isFullyBackedByObjectIDs
{
  return 1;
}

- (id)calculateMediaTypeCounts
{
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  id v3 = (void *)MEMORY[0x19F389B10](self, a2);
  id v4 = [(PHFetchResult *)self fetchedObjectIDs];
  if ([v4 count])
  {
    uint64_t v5 = [(PHFetchResult *)self photoLibrary];
    uint64_t v6 = [v5 photoLibraryForCurrentQueueQoS];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __41__PHFetchResult_calculateMediaTypeCounts__block_invoke;
    v11[3] = &unk_1E5848F10;
    id v12 = v4;
    id v7 = v6;
    id v13 = v7;
    long long v14 = self;
    long long v15 = &v26;
    uint64_t v16 = &v22;
    uint64_t v17 = &v18;
    [v7 performBlockAndWait:v11];
  }
  id v8 = [PHFetchResultMediaTypeCounts alloc];
  int64_t v9 = [(PHFetchResultMediaTypeCounts *)v8 initWithPhotosCount:v27[3] videosCount:v23[3] audiosCount:v19[3]];
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v9;
}

void __41__PHFetchResult_calculateMediaTypeCounts__block_invoke(uint64_t a1)
{
  v44[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = [MEMORY[0x1E4F8A950] entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  [v4 setIncludesPendingChanges:0];
  [v4 setPropertiesToGroupBy:&unk_1EEB26E20];
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"noindex:(self) IN %@", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  uint64_t v6 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"kind"];
  id v7 = (void *)MEMORY[0x1E4F28C68];
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObject:v6];
  int64_t v9 = [v7 expressionForFunction:@"count:" arguments:v8];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v10 setName:@"count"];
  [v10 setExpression:v9];
  [v10 setExpressionResultType:200];
  v44[0] = @"kind";
  v44[1] = v10;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
  [v4 setPropertiesToFetch:v11];

  [v4 setResultType:2];
  id v12 = [*(id *)(a1 + 40) managedObjectContext];
  id v36 = 0;
  id v13 = [v12 executeFetchRequest:v4 error:&v36];
  id v14 = v36;

  if (v13)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      id v27 = v14;
      uint64_t v28 = v9;
      uint64_t v29 = v6;
      id v30 = v4;
      uint64_t v18 = *(void *)v33;
      obuint64_t j = v15;
      while (1)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v21 = [v20 objectForKeyedSubscript:@"kind"];
          __int16 v22 = [v21 intValue];

          id v23 = [v20 objectForKeyedSubscript:@"count"];
          int v24 = [v23 intValue];

          uint64_t v25 = a1 + 56;
          if (!v22) {
            goto LABEL_12;
          }
          if (v22 == 2)
          {
            uint64_t v25 = a1 + 72;
LABEL_12:
            *(void *)(*(void *)(*(void *)v25 + 8) + 24) = v24;
            continue;
          }
          uint64_t v25 = a1 + 64;
          if (v22 == 1) {
            goto LABEL_12;
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (!v17)
        {
          uint64_t v6 = v29;
          id v4 = v30;
          int64_t v9 = v28;
          id v14 = v27;
          long long v15 = obj;
          break;
        }
      }
    }
  }
  else
  {
    long long v15 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138412802;
      uint64_t v39 = v4;
      __int16 v40 = 2112;
      uint64_t v41 = v26;
      __int16 v42 = 2112;
      id v43 = v14;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "Error executing media type fetch %@ for %@: %@", buf, 0x20u);
    }
  }
}

- (void)_updateMediaTypeCountsIfNeeded
{
  id v3 = [(PHFetchResult *)self _mediaTypeCounts];
  if (!v3)
  {
    uint64_t v5 = [(PHFetchResult *)self calculateMediaTypeCounts];
    id v4 = v5;
    PLRunWithUnfairLock();
  }
}

void __47__PHFetchResult__updateMediaTypeCountsIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v1 + 88);
  uint64_t v2 = (id *)(v1 + 88);
  if (!v3) {
    objc_storeStrong(v2, *(id *)(a1 + 40));
  }
}

- (id)_mediaTypeCounts
{
  uint64_t v2 = PLResultWithUnfairLock();

  return v2;
}

id __33__PHFetchResult__mediaTypeCounts__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 88);
}

- (NSUInteger)countOfAssetsWithMediaType:(PHAssetMediaType)mediaType
{
  [(PHFetchResult *)self _updateMediaTypeCountsIfNeeded];

  return [(PHFetchResult *)self cachedCountOfAssetsWithMediaType:mediaType];
}

- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3
{
  uint64_t v5 = [(PHFetchResult *)self _mediaTypeCounts];
  uint64_t v6 = v5;
  if (v5)
  {
    switch(a3)
    {
      case 0:
        NSUInteger v7 = [(PHFetchResult *)self count];
        uint64_t v8 = [v6 photosCount];
        uint64_t v9 = [v6 videosCount];
        unint64_t v10 = v7 - [v6 audiosCount] - (v8 + v9);
        break;
      case 1:
        uint64_t v11 = [v5 photosCount];
        goto LABEL_9;
      case 2:
        uint64_t v11 = [v5 videosCount];
        goto LABEL_9;
      case 3:
        uint64_t v11 = [v5 audiosCount];
LABEL_9:
        unint64_t v10 = v11;
        break;
      default:
        unint64_t v10 = 0;
        break;
    }
  }
  else
  {
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (void)enumerateObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  uint64_t v8 = block;
  uint64_t v9 = s;
  id v10 = [(PHFetchResult *)self fetchedObjects];
  [v10 enumerateObjectsAtIndexes:v9 options:opts usingBlock:v8];
}

- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  uint64_t v6 = block;
  id v7 = [(PHFetchResult *)self fetchedObjects];
  [v7 enumerateObjectsWithOptions:opts usingBlock:v6];
}

- (void)enumerateObjectsUsingBlock:(void *)block
{
  id v4 = block;
  id v5 = [(PHFetchResult *)self fetchedObjects];
  [v5 enumerateObjectsUsingBlock:v4];
}

- (NSArray)objectsAtIndexes:(NSIndexSet *)indexes
{
  id v4 = indexes;
  id v5 = [(PHFetchResult *)self fetchedObjects];
  uint64_t v6 = [v5 objectsAtIndexes:v4];

  return (NSArray *)v6;
}

- (id)lastObject
{
  uint64_t v2 = [(PHFetchResult *)self fetchedObjects];
  uint64_t v3 = [v2 lastObject];

  return v3;
}

- (NSUInteger)indexOfObject:(id)anObject inRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  id v7 = anObject;
  uint64_t v8 = [(PHFetchResult *)self fetchedObjects];
  NSUInteger v9 = objc_msgSend(v8, "indexOfObject:inRange:", v7, location, length);

  return v9;
}

- (NSUInteger)indexOfObject:(id)anObject
{
  id v4 = anObject;
  id v5 = [(PHFetchResult *)self fetchedObjects];
  NSUInteger v6 = [v5 indexOfObject:v4];

  return v6;
}

- (BOOL)containsObject:(id)anObject
{
  id v4 = anObject;
  id v5 = [(PHFetchResult *)self fetchedObjects];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (PHFetchResult)fetchResultWithChangeHandlingValue:(id)a3
{
  id v4 = a3;
  id v5 = [PHFetchResult alloc];
  char v6 = [(PHFetchResult *)self query];
  id v7 = [(PHFetchResult *)v5 initWithQuery:v6 oids:v4 registerIfNeeded:0 usingManagedObjectContext:0];

  return v7;
}

- (unint64_t)possibleChangesForChange:(id)a3 propertiesFetchResult:(id)a4
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v88 = a3;
  id v86 = a4;
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x2020000000;
  uint64_t v111 = 0;
  v83 = self;
  if ((unint64_t)([(PHFetchResult *)self collectionFetchType] - 4) > 0xFFFFFFFFFFFFFFFDLL)
  {
    v79 = [(PHFetchResult *)self fetchRequest];
    v89 = [v79 entity];
    if (v89)
    {
      v87 = [(PHFetchResult *)self query];
      v81 = [(PHFetchResult *)self fetchedObjectIDsSet];
      v84 = [v88 changedRelationshipsByOID];
      v85 = [v88 changedAttributesByOID];
      v80 = [(PHFetchResult *)self containerIdentifier];
      uint64_t v7 = [v87 containerToObjectRelationshipIndexValue];
      if (!v80) {
        goto LABEL_14;
      }
      uint64_t v8 = v7;
      if (v7)
      {
        NSUInteger v9 = [v88 updatedObjectIDs];
        int v10 = [v9 containsObject:v80];

        if (v10)
        {
          uint64_t v11 = [v84 objectForKeyedSubscript:v80];
          uint64_t v12 = [v11 unsignedLongLongValue];

          if (([v87 containerToObjectRelationshipIndexValue] & v12) != 0) {
            v109[3] |= 7uLL;
          }
        }
      }
      id v13 = [v85 objectForKeyedSubscript:v80];
      uint64_t v14 = [v13 unsignedLongLongValue];

      uint64_t v15 = [v87 containerSortingAttributesIndexValue];
      uint64_t v16 = [v87 containerUserQueryIndexValue];
      if ((v15 & v14) != 0) {
        v109[3] |= 4uLL;
      }
      if ((v16 & v14) != 0) {
        v109[3] |= 3uLL;
      }
      if (!v8)
      {
LABEL_14:
        uint64_t v17 = [v88 insertedObjectIDs];
        int v18 = _oidsContainEntity(v17, v89);

        if (v18)
        {
          if (v86)
          {
            long long v106 = 0u;
            long long v107 = 0u;
            long long v104 = 0u;
            long long v105 = 0u;
            int v19 = [v88 insertedObjectIDs];
            uint64_t v20 = [v19 countByEnumeratingWithState:&v104 objects:v117 count:16];
            if (v20)
            {
              uint64_t v21 = *(void *)v105;
              while (2)
              {
                for (uint64_t i = 0; i != v20; ++i)
                {
                  if (*(void *)v105 != v21) {
                    objc_enumerationMutation(v19);
                  }
                  id v23 = *(void **)(*((void *)&v104 + 1) + 8 * i);
                  int v24 = [v23 entity];
                  char v25 = [v24 isKindOfEntity:v89];

                  if (v25)
                  {
                    id v103 = 0;
                    char v26 = [v86 evaluateQuery:v87 withObjectID:v23 outMissingPropertyNames:&v103];
                    id v27 = v103;
                    if ([v27 count])
                    {
                      id v30 = PLPhotoKitGetLog();
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)long long buf = 138412802;
                        *(void *)&uint8_t buf[4] = v23;
                        *(_WORD *)&buf[12] = 2112;
                        *(void *)&buf[14] = v27;
                        *(_WORD *)&buf[22] = 2112;
                        v114 = (uint64_t (*)(uint64_t, uint64_t))v87;
                        _os_log_impl(&dword_19B043000, v30, OS_LOG_TYPE_ERROR, "Unable to perform detailed change handling for inserts, falling back to refetch, oid:%@ missing properties:%@ for query:%@", buf, 0x20u);
                      }

LABEL_37:
                      v109[3] |= 1uLL;

                      goto LABEL_38;
                    }
                    if (v26) {
                      goto LABEL_37;
                    }
                  }
                }
                uint64_t v20 = [v19 countByEnumeratingWithState:&v104 objects:v117 count:16];
                if (v20) {
                  continue;
                }
                break;
              }
            }
LABEL_38:
          }
          else
          {
            v109[3] |= 1uLL;
          }
        }
        long long v31 = [v88 deletedObjectIDs];
        int v32 = _oidsContainEntity(v31, v89);

        if (v32) {
          v109[3] |= 2uLL;
        }
      }
      long long v33 = [v88 updatedObjectIDs];
      if (v33)
      {
        long long v34 = [v87 filteringOids];
        long long v35 = [v88 updatedObjectIDs];
        int v36 = [v34 intersectsSet:v35];

        if (v36)
        {
          *(void *)long long buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v114 = __Block_byref_object_copy__49293;
          v115 = __Block_byref_object_dispose__49294;
          id v116 = 0;
          v101[0] = 0;
          v101[1] = v101;
          v101[2] = 0x3032000000;
          v101[3] = __Block_byref_object_copy__49293;
          v101[4] = __Block_byref_object_dispose__49294;
          id v102 = 0;
          long long v37 = [v87 filteringOids];
          long long v38 = [v88 updatedObjectIDs];
          v95[0] = MEMORY[0x1E4F143A8];
          v95[1] = 3221225472;
          v95[2] = __64__PHFetchResult_possibleChangesForChange_propertiesFetchResult___block_invoke;
          v95[3] = &unk_1E5848E70;
          v98 = v101;
          v99 = buf;
          id v96 = v87;
          id v97 = v84;
          v100 = &v108;
          objc_msgSend(v37, "ph_enumerateIntersectionWithSet:usingBlock:", v38, v95);

          _Block_object_dispose(v101, 8);
          _Block_object_dispose(buf, 8);
        }
      }
      uint64_t v39 = [v87 objectToContainerRelationshipIndexValue];
      uint64_t v82 = [v87 filteringAttributesIndexValue];
      uint64_t v40 = [v87 filteringRelationshipsIndexValue];
      uint64_t v41 = [v87 sortingAttributesIndexValue];
      int v42 = [v88 anyUpdatedObjectsWithChangedAttributes:v82 ofEntity:v89];
      uint64_t v43 = v40 & ~v39;
      if ((v42 | [v88 anyUpdatedObjectsWithChangedRelationships:v43 ofEntity:v89]) == 1)
      {
        if (v86)
        {
          uint64_t v78 = v41;
          long long v93 = 0u;
          long long v94 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          __int16 v44 = [v88 updatedObjectIDs];
          uint64_t v45 = [v44 countByEnumeratingWithState:&v91 objects:v112 count:16];
          if (!v45) {
            goto LABEL_75;
          }
          uint64_t v46 = *(void *)v92;
          while (1)
          {
            for (uint64_t j = 0; j != v45; ++j)
            {
              if (*(void *)v92 != v46) {
                objc_enumerationMutation(v44);
              }
              uint64_t v48 = *(void **)(*((void *)&v91 + 1) + 8 * j);
              long long v49 = (void *)MEMORY[0x19F389B10]();
              uint64_t v50 = [v48 entity];
              char v51 = [v50 isKindOfEntity:v89];

              if ((v51 & 1) == 0)
              {
                int v59 = 5;
                goto LABEL_71;
              }
              long long v52 = [v85 objectForKeyedSubscript:v48];
              uint64_t v53 = [v52 unsignedLongLongValue];

              id v54 = [v84 objectForKeyedSubscript:v48];
              uint64_t v55 = [v54 unsignedLongLongValue];

              if (!(v53 & v82 | v55 & v43)) {
                goto LABEL_67;
              }
              id v90 = 0;
              int v56 = [v86 evaluateQuery:v87 withObjectID:v48 outMissingPropertyNames:&v90];
              id v57 = v90;
              if ([v57 count])
              {
                uint64_t v58 = PLPhotoKitGetLog();
                if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 138412802;
                  *(void *)&uint8_t buf[4] = v48;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v57;
                  *(_WORD *)&buf[22] = 2114;
                  v114 = (uint64_t (*)(uint64_t, uint64_t))v87;
                  _os_log_impl(&dword_19B043000, v58, OS_LOG_TYPE_ERROR, "Unable to perform detailed change analysis, falling back to refetch, oid:%@ missing properties:%{public}@ for query:%{public}@", buf, 0x20u);
                }

                v109[3] |= 7uLL;
                int v59 = 4;
                goto LABEL_71;
              }
              if ([v81 containsObject:v48])
              {
                if ((v56 & 1) == 0) {
                  v109[3] |= 2uLL;
                }
                if ((v53 & v78) == 0) {
                  goto LABEL_66;
                }
                uint64_t v60 = 4;
                goto LABEL_65;
              }
              if (v56)
              {
                uint64_t v60 = 1;
LABEL_65:
                v109[3] |= v60;
              }
LABEL_66:

LABEL_67:
              uint64_t v61 = v109[3];
              if ((v61 & 8) == 0)
              {
                int v62 = [v81 containsObject:v48];
                uint64_t v61 = v109[3];
                if (v62)
                {
                  v61 |= 8uLL;
                  v109[3] = v61;
                }
              }
              int v59 = 4 * (v61 == 15);
LABEL_71:
              if (v59 != 5 && v59) {
                goto LABEL_75;
              }
            }
            uint64_t v45 = [v44 countByEnumeratingWithState:&v91 objects:v112 count:16];
            if (!v45)
            {
LABEL_75:

              goto LABEL_82;
            }
          }
        }
        v63 = [v88 updatedObjectIDs];
        int v64 = [v63 isSubsetOfSet:v81];

        if (v64)
        {
          id v65 = v109;
          uint64_t v66 = v109[3] | 6;
        }
        else
        {
          id v67 = [v88 updatedObjectIDs];
          int v68 = [v67 intersectsSet:v81];

          id v65 = v109;
          uint64_t v69 = v109[3];
          if (v68) {
            uint64_t v66 = v69 | 7;
          }
          else {
            uint64_t v66 = v69 | 1;
          }
        }
        v65[3] = v66;
      }
LABEL_82:
      uint64_t v70 = [(PHFetchResult *)v83 _possibleChangesFromDetectionCriteriaForChange:v88];
      v109[3] |= v70;
      uint64_t v71 = [v87 possibleChangesForChange:v88];
      uint64_t v72 = v109[3];
      unint64_t v6 = v72 | v71;
      v109[3] = v72 | v71;
      if (((v72 | v71) & 2) == 0)
      {
        v73 = [v88 deletedObjectIDs];
        int v74 = [v73 intersectsSet:v81];

        unint64_t v6 = v109[3];
        if (v74)
        {
          v6 |= 2uLL;
          v109[3] = v6;
        }
      }
      if ((v6 & 8) == 0)
      {
        id v75 = [v88 updatedObjectIDs];
        int v76 = [v75 intersectsSet:v81];

        unint64_t v6 = v109[3];
        if (v76)
        {
          v6 |= 8uLL;
          v109[3] = v6;
        }
      }
    }
    else
    {
      uint64_t v28 = PLPhotoKitGetLog();
      v87 = v28;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = @"non-null";
        if (!v79) {
          uint64_t v29 = @"nil";
        }
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v29;
        _os_log_impl(&dword_19B043000, v28, OS_LOG_TYPE_ERROR, "returning PHFetchResultChangeKindNone because entity is nil for change with %{public}@ fetchRequest", buf, 0xCu);
      }
      unint64_t v6 = 0;
    }

    goto LABEL_90;
  }
  unint64_t v6 = v109[3];
LABEL_90:
  _Block_object_dispose(&v108, 8);

  return v6;
}

void __64__PHFetchResult_possibleChangesForChange_propertiesFetchResult___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  unint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v21 = v5;
  uint64_t v7 = [v5 entity];

  if (v6 != v7)
  {
    uint64_t v8 = [v21 entity];
    NSUInteger v9 = objc_msgSend(v8, "ph_baseEntity");
    uint64_t v10 = [v9 name];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    uint64_t v13 = [v21 entity];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  uint64_t v16 = [*(id *)(a1 + 32) filteringRelationshipsIndexValueByBaseEntityName];
  uint64_t v17 = [v16 objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  uint64_t v18 = [v17 unsignedLongLongValue];

  int v19 = [*(id *)(a1 + 40) objectForKeyedSubscript:v21];
  uint64_t v20 = [v19 unsignedLongLongValue];

  if ((v20 & v18) != 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= 1uLL;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= 2uLL;
    *a3 = 1;
  }
}

- (unint64_t)possibleChangesForChange:(id)a3
{
  return [(PHFetchResult *)self possibleChangesForChange:a3 propertiesFetchResult:0];
}

- (unint64_t)_possibleChangesFromDetectionCriteriaForChange:(id)a3
{
  id v4 = a3;
  id v5 = [(PHFetchResult *)self query];
  unint64_t v6 = [v5 fetchOptions];
  uint64_t v7 = [v6 changeDetectionCriteria];
  uint64_t v8 = [v5 photoLibrary];
  NSUInteger v9 = [v8 managedObjectContext];
  int v10 = [v4 intersectsWithDetectionCriteria:v7 managedObjectContext:v9];

  if (v10) {
    unint64_t v11 = 15;
  }
  else {
    unint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)isRegisteredForChangeNotificationDeltas
{
  return self->_registeredForChangeNotificationDeltas;
}

- (id)fetchedPropertiesForPropertySetClass:(Class)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__49293;
  uint64_t v18 = __Block_byref_object_dispose__49294;
  -[NSDictionary objectForKeyedSubscript:](self->_fetchedPropertySetsCache, "objectForKeyedSubscript:");
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  if (!v15[5]
    && [(PHFetchResult *)self _canCreateFetchedPropertyObjectsWithClass:a3])
  {
    id v5 = [(PHFetchResult *)self fetchedObjectIDs];
    isolationQueue = self->_isolationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__PHFetchResult_fetchedPropertiesForPropertySetClass___block_invoke;
    v10[3] = &unk_1E5848E18;
    uint64_t v12 = &v14;
    Class v13 = a3;
    void v10[4] = self;
    id v11 = v5;
    id v7 = v5;
    dispatch_sync(isolationQueue, v10);
  }
  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __54__PHFetchResult_fetchedPropertiesForPropertySetClass___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:*(void *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v5 = [*(id *)(a1 + 32) _createFetchedPropertyObjectsWithClass:*(void *)(a1 + 56) fetchedObjectIDs:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) mutableCopy];
    NSUInteger v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    id v14 = v10;

    [v14 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 56)];
    uint64_t v11 = [v14 copy];
    uint64_t v12 = *(void *)(a1 + 32);
    Class v13 = *(void **)(v12 + 48);
    *(void *)(v12 + 48) = v11;
  }
}

- (id)objectIDAtIndex:(unint64_t)a3
{
  id v4 = [(PHFetchResult *)self fetchedObjectIDs];
  uint64_t v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (id)containerIdentifier
{
  uint64_t v2 = [(PHFetchResult *)self query];
  uint64_t v3 = [v2 containerIdentifier];

  return v3;
}

- (int64_t)collectionFetchType
{
  uint64_t v2 = [(PHFetchResult *)self query];
  int64_t v3 = [v2 collectionFetchType];

  return v3;
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (id)changeHandlingValueUsingSeedOids:(id)a3 withChange:(id)a4 usingManagedObjectContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(PHFetchResult *)self query];
  uint64_t v12 = [v11 updatedQueryWithChange:v9];

  Class v13 = [[PHFetchResult alloc] initWithQuery:v12 oids:v10 registerIfNeeded:0 usingManagedObjectContext:v8];

  return v13;
}

- (id)changeHandlingKey
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id changeHandlingKey = self->_changeHandlingKey;
  if (!changeHandlingKey)
  {
    id v4 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = self;
      _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_ERROR, "Missing required change handling key for fetch result %@", (uint8_t *)&v8, 0xCu);
    }

    id changeHandlingKey = self->_changeHandlingKey;
  }
  id v5 = [(id)objc_opt_class() emptyFetchResultChangeHandlingKey];

  if (changeHandlingKey == v5) {
    id v6 = 0;
  }
  else {
    id v6 = self->_changeHandlingKey;
  }

  return v6;
}

- (id)copyWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(PHFetchResult *)self query];
  id v6 = [v5 fetchOptions];
  uint64_t v7 = [v6 chunkSizeForFetch];

  int v8 = [v5 fetchOptions];
  uint64_t v9 = [v8 cacheSizeForFetch];

  uint64_t v10 = [v4 objectForKeyedSubscript:@"chunkSizeForFetch"];
  uint64_t v11 = [v4 objectForKeyedSubscript:@"cacheSizeForFetch"];
  uint64_t v12 = [v4 objectForKeyedSubscript:@"invalidateCache"];
  Class v13 = [v4 objectForKeyedSubscript:@"registerIfNeeded"];

  if (v10 && v7 != [v10 integerValue]
    || v11 && v9 != [v11 integerValue]
    || v12 && ([v12 BOOLValue] & 1) != 0)
  {
    BOOL v14 = 0;
    if (!v5) {
      goto LABEL_13;
    }
  }
  else
  {
    BOOL v14 = v13 == 0;
    if (!v5)
    {
LABEL_13:
      uint64_t v18 = (PHFetchResult *)[(PHFetchResult *)self copy];
      goto LABEL_25;
    }
  }
  if (v14) {
    goto LABEL_13;
  }
  uint64_t v15 = [v5 fetchOptions];
  if (v15)
  {
    uint64_t v16 = [v5 fetchOptions];
    uint64_t v17 = [v16 copy];
  }
  else
  {
    uint64_t v16 = [(PHFetchResult *)self photoLibrary];
    uint64_t v17 = [v16 librarySpecificFetchOptions];
  }
  id v19 = (void *)v17;

  if (v10) {
    objc_msgSend(v19, "setChunkSizeForFetch:", objc_msgSend(v10, "integerValue"));
  }
  if (v11) {
    objc_msgSend(v19, "setCacheSizeForFetch:", objc_msgSend(v11, "integerValue"));
  }
  uint64_t v20 = (void *)[v5 copy];
  [v20 setFetchOptions:v19];
  id v21 = [(PHFetchResult *)self fetchedObjectIDs];
  if (v13) {
    uint64_t v22 = [v13 BOOLValue];
  }
  else {
    uint64_t v22 = [(PHFetchResult *)self isRegisteredForChangeNotificationDeltas];
  }
  uint64_t v18 = [[PHFetchResult alloc] initWithQuery:v20 oids:v21 registerIfNeeded:v22 usingManagedObjectContext:0];
  if ([v21 count])
  {
    uint64_t v23 = [(PHFetchResult *)self _mediaTypeCounts];
    mediaTypeCounts = v18->_mediaTypeCounts;
    v18->_mediaTypeCounts = (PHFetchResultMediaTypeCounts *)v23;
  }
LABEL_25:

  return v18;
}

- (PHFetchResult)initWithExistingFetchResult:(id)a3 filteredObjectIDs:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 query];
  uint64_t v9 = (void *)[v8 copy];

  if (v9)
  {
    uint64_t v10 = [v9 fetchOptions];
    uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", v7];
    id v12 = v10;
    id v13 = v11;
    BOOL v14 = v13;
    if (v12)
    {
      if (v13) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v29 = objc_msgSend(NSString, "stringWithUTF8String:", "void _appendFetchOptionsPredicate(PHFetchOptions *__strong, NSPredicate *__strong)");
      [v28 handleFailureInFunction:v29, @"PHFetchResult.m", 176, @"Invalid parameter not satisfying: %@", @"fetchOptions" file lineNumber description];

      if (v14) {
        goto LABEL_4;
      }
    }
    id v30 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v31 = objc_msgSend(NSString, "stringWithUTF8String:", "void _appendFetchOptionsPredicate(PHFetchOptions *__strong, NSPredicate *__strong)");
    [v30 handleFailureInFunction:v31, @"PHFetchResult.m", 177, @"Invalid parameter not satisfying: %@", @"predicate" file lineNumber description];

LABEL_4:
    uint64_t v15 = [v12 predicate];
    uint64_t v16 = [v12 internalPredicate];
    uint64_t v17 = (void *)v16;
    if (v15)
    {
      uint64_t v18 = (void *)MEMORY[0x1E4F28BA0];
      uint64_t v32 = (uint64_t)v15;
      long long v33 = v14;
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:2];
      uint64_t v20 = [v18 andPredicateWithSubpredicates:v19];
      [v12 setPredicate:v20];
    }
    else
    {
      if (!v16)
      {
        [v12 setPredicate:v14];
        goto LABEL_11;
      }
      id v21 = (void *)MEMORY[0x1E4F28BA0];
      uint64_t v32 = v16;
      long long v33 = v14;
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:2];
      uint64_t v20 = [v21 andPredicateWithSubpredicates:v19];
      [v12 setInternalPredicate:v20];
    }

LABEL_11:
    uint64_t v22 = -[PHFetchResult initWithQuery:oids:registerIfNeeded:usingManagedObjectContext:](self, "initWithQuery:oids:registerIfNeeded:usingManagedObjectContext:", v9, v7, [v6 isRegisteredForChangeNotificationDeltas], 0);

    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [v6 identifier];
  }
  else
  {
    id v12 = 0;
  }
  uint64_t v23 = [PHManualFetchResult alloc];
  int v24 = [v6 photoLibrary];
  char v25 = [v6 fetchType];
  char v26 = [v6 fetchPropertySets];
  uint64_t v22 = -[PHManualFetchResult initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:](v23, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v7, v24, v25, v26, v12, [v6 isRegisteredForChangeNotificationDeltas]);

LABEL_14:
  return v22;
}

+ (id)fetchObjectIDsForCombinableFetchResults:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__49293;
  uint64_t v40 = __Block_byref_object_dispose__49294;
  id v41 = 0;
  id v7 = [v5 firstObject];
  int v8 = [v7 query];
  uint64_t v9 = [v8 photoLibrary];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = [*(id *)(*((void *)&v32 + 1) + 8 * i) query];
        [v10 addObject:v15];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v12);
  }

  uint64_t v16 = +[PHQuery combinedFetchRequestForQueries:v10];
  if (v16)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __80__PHFetchResult_fetchObjectIDsForCombinableFetchResults_inManagedObjectContext___block_invoke;
    v24[3] = &unk_1E5848D80;
    id v25 = v6;
    id v26 = v16;
    id v27 = v7;
    id v28 = v8;
    id v29 = v11;
    id v30 = v9;
    long long v31 = &v36;
    [v25 performBlockAndWait:v24];
    uint64_t v17 = v37;
    uint64_t v18 = (void *)v37[5];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = (void *)v17[5];
      v17[5] = (uint64_t)v19;
    }
    else
    {
      uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionary];
      uint64_t v20 = (void *)v37[5];
      v37[5] = v22;
    }

    id v21 = (id)v37[5];
  }
  else
  {
    id v21 = 0;
  }

  _Block_object_dispose(&v36, 8);

  return v21;
}

void __80__PHFetchResult_fetchObjectIDsForCombinableFetchResults_inManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v52 = 0;
  id v4 = [v2 executeFetchRequest:v3 error:&v52];
  id v5 = v52;
  id v6 = v5;
  if (v4)
  {
    id v37 = v5;
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    uint64_t v43 = a1;
    int v42 = [*(id *)(a1 + 56) combinedQueryKeyPath];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v38 = v4;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v49 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          BOOL v14 = [v13 objectForKeyedSubscript:@"objectID"];
          uint64_t v15 = [v13 objectForKeyedSubscript:v42];
          uint64_t v16 = [v7 objectForKeyedSubscript:v15];
          if (!v16)
          {
            uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
            [v7 setObject:v16 forKeyedSubscript:v15];
          }
          [v16 addObject:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v10);
    }

    id v41 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    obuint64_t j = *(id *)(a1 + 64);
    uint64_t v17 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v40 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v45 != v40) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void **)(*((void *)&v44 + 1) + 8 * j);
          id v21 = [v20 query];
          uint64_t v22 = [v21 combinedQuerySeparatingIdentifier];

          uint64_t v23 = [v7 objectForKeyedSubscript:v22];
          int v24 = (void *)v23;
          id v25 = (void *)MEMORY[0x1E4F1CBF0];
          if (v23) {
            id v25 = (void *)v23;
          }
          id v26 = v25;

          id v27 = [v20 query];
          id v28 = [v27 fetchOptions];
          id v29 = +[PHFetchResult cleanedAndSortedOIDsFrom:v26 usingFetchOptions:v28];

          id v30 = [v20 fetchRequest];
          long long v31 = [v30 entityName];
          long long v32 = +[PHFetchResult filteredOIDsFrom:v29 usingEntityName:v31 withPhotoLibrary:*(void *)(v43 + 72)];

          [v41 setObject:v32 forKeyedSubscript:v20];
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v18);
    }

    uint64_t v33 = *(void *)(*(void *)(v43 + 80) + 8);
    long long v34 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = v41;

    id v6 = v37;
    id v4 = v38;
  }
  else
  {
    id v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      uint64_t v35 = *(void *)(a1 + 40);
      uint64_t v36 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138412802;
      uint64_t v56 = v35;
      __int16 v57 = 2112;
      uint64_t v58 = v36;
      __int16 v59 = 2112;
      uint64_t v60 = v6;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_FAULT, "Error executing combined fetch %@ for %@: %@", buf, 0x20u);
    }
  }
}

@end