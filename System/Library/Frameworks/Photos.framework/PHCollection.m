@interface PHCollection
+ (BOOL)managedObjectSupportsTrashedState;
+ (NSPredicate)predicateForUserCollections;
+ (PHFetchResult)fetchCollectionsInCollectionList:(PHCollectionList *)collectionList options:(PHFetchOptions *)options;
+ (PHFetchResult)fetchTopLevelUserCollectionsWithOptions:(PHFetchOptions *)options;
+ (id)entityKeyMap;
+ (id)fetchFilteredAssetCollections:(id)a3 containingAssetsMatchingPredicate:(id)a4;
+ (id)fetchMomentsForAssetsWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)fetchMomentsForAssetsWithOIDs:(id)a3 options:(id)a4;
+ (id)fetchMomentsForFacesWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)fetchMomentsForPersonsWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)fetchType;
+ (id)managedEntityName;
+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4;
- (BOOL)canContainAssets;
- (BOOL)canContainCollections;
- (BOOL)canPerformEditOperation:(PHCollectionEditOperation)anOperation;
- (BOOL)collectionHasFixedOrder;
- (BOOL)customSortAscending;
- (BOOL)hasLocalizedTitle;
- (BOOL)hasLocationInfo;
- (BOOL)isAlbumContentSort;
- (BOOL)isAlbumContentTitleSort;
- (BOOL)isDeleted;
- (BOOL)isTrashed;
- (BOOL)isUserSmartAlbum;
- (BOOL)startsAtEnd;
- (BOOL)willFetchDatesIfNeeded;
- (NSArray)effectiveCustomSortDescriptors;
- (NSDate)creationDate;
- (NSManagedObjectID)parentFolderID;
- (NSSortDescriptor)defaultSortDescriptor;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (PHCollection)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (PHCollectionPresentationHints)presentationHints;
- (id)description;
- (id)objectReference;
- (unint64_t)ancestryIndexOfCollectionList:(id)a3 context:(id)a4;
- (unint64_t)collectionFixedOrderPriority;
- (unint64_t)estimatedPhotosCount;
- (unint64_t)estimatedVideosCount;
- (unsigned)customSortKey;
@end

@implementation PHCollection

- (PHCollection)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PHCollection;
  v9 = [(PHObject *)&v14 initWithFetchDictionary:v8 propertyHint:a4 photoLibrary:a5];
  if (v9)
  {
    v10 = [v8 objectForKeyedSubscript:@"customSortAscending"];
    v9->_customSortAscending = [v10 BOOLValue];

    v11 = [v8 objectForKeyedSubscript:@"customSortKey"];
    v9->_customSortKey = [v11 unsignedIntegerValue];

    v12 = [v8 objectForKeyedSubscript:@"trashedState"];
    v9->_trashed = [v12 intValue] != 0;
  }
  return v9;
}

- (NSSortDescriptor)defaultSortDescriptor
{
  return 0;
}

+ (id)managedEntityName
{
  return (id)[MEMORY[0x1E4F8A848] entityName];
}

- (unsigned)customSortKey
{
  return self->_customSortKey;
}

- (BOOL)customSortAscending
{
  return self->_customSortAscending;
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 1;
}

- (BOOL)canContainCollections
{
  return 0;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

id __56__PHCollection_fetchTopLevelUserCollectionsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForTopLevelUserCollectionsWithOptions:a2];
  v3 = [v2 executeQuery];

  return v3;
}

+ (NSPredicate)predicateForUserCollections
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d OR %K = %d OR %K = %d", @"kind", 2, @"kind", 1507, @"kind", 4000);
}

+ (PHFetchResult)fetchTopLevelUserCollectionsWithOptions:(PHFetchOptions *)options
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = options;
  if (v3)
  {
    v4 = v3;
    v5 = (void *)[(PHFetchOptions *)v3 copy];
  }
  else
  {
    v5 = objc_opt_new();
  }
  v6 = [v5 sortDescriptors];
  if (v6)
  {
  }
  else
  {
    v7 = [v5 internalSortDescriptors];

    if (!v7)
    {
      id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"parentFolder" ascending:1];
      v12[0] = v8;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      [v5 setInternalSortDescriptors:v9];
    }
  }
  v10 = +[PHObject authorizationAwareFetchResultWithOptions:v5 fetchBlock:&__block_literal_global_41306];

  return (PHFetchResult *)v10;
}

- (id)objectReference
{
  return +[PHObjectReference referenceForObject:self];
}

- (BOOL)isTrashed
{
  return self->_trashed;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (unint64_t)estimatedVideosCount
{
  return self->_estimatedVideosCount;
}

- (unint64_t)estimatedPhotosCount
{
  return self->_estimatedPhotosCount;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PHCollection;
  v3 = [(PHObject *)&v8 description];
  v4 = [(PHCollection *)self localizedTitle];
  v5 = [(PHCollection *)self localizedSubtitle];
  v6 = [v3 stringByAppendingFormat:@", title:\"%@\", subtitle:\"%@\"", v4, v5];

  return v6;
}

- (BOOL)startsAtEnd
{
  return 0;
}

- (PHCollectionPresentationHints)presentationHints
{
  return 0;
}

- (BOOL)isUserSmartAlbum
{
  return 0;
}

- (BOOL)isAlbumContentTitleSort
{
  return 0;
}

- (BOOL)isAlbumContentSort
{
  return 0;
}

- (NSArray)effectiveCustomSortDescriptors
{
  return 0;
}

- (unint64_t)ancestryIndexOfCollectionList:(id)a3 context:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v6 = (PHCollection *)a3;
  id v7 = a4;
  if (v6 == self)
  {
    unint64_t v11 = 0;
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v9 = [(PHCollection *)self parentFolderID];
    v10 = [v7 folderForID:v9];

    if (v10)
    {
      unint64_t v11 = 1;
      while (1)
      {
        v12 = [v10 objectID];
        int v13 = [v8 containsObject:v12];

        if (v13) {
          break;
        }
        objc_super v14 = [v10 objectID];
        [v8 addObject:v14];

        if ([(PHObject *)v6 isEqual:v10]) {
          goto LABEL_14;
        }
        v15 = [v10 parentFolderID];
        uint64_t v16 = [v7 folderForID:v15];

        ++v11;
        v10 = (void *)v16;
        if (!v16) {
          goto LABEL_13;
        }
      }
      v17 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = [v10 objectID];
        int v20 = 138412290;
        v21 = v18;
        _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_ERROR, "Cycle detected in PHCollectionList hierarchy for %@", (uint8_t *)&v20, 0xCu);
      }
LABEL_13:
      unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:
    }
    else
    {
      unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v11;
}

- (NSManagedObjectID)parentFolderID
{
  return 0;
}

- (unint64_t)collectionFixedOrderPriority
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)willFetchDatesIfNeeded
{
  return 0;
}

- (BOOL)collectionHasFixedOrder
{
  return 1;
}

- (BOOL)isDeleted
{
  v4.receiver = self;
  v4.super_class = (Class)PHCollection;
  return [(PHObject *)&v4 isDeleted] || self->_trashed;
}

- (BOOL)hasLocationInfo
{
  return 0;
}

- (BOOL)hasLocalizedTitle
{
  v2 = [(PHCollection *)self localizedTitle];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (NSString)localizedTitle
{
  return 0;
}

- (BOOL)canPerformEditOperation:(PHCollectionEditOperation)anOperation
{
  return 0;
}

- (BOOL)canContainAssets
{
  return 0;
}

+ (id)fetchFilteredAssetCollections:(id)a3 containingAssetsMatchingPredicate:(id)a4
{
  v68[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v39 = v6;
    id v7 = [v5 firstObject];
    v40 = [v7 photoLibrary];
    v41 = +[PHQuery queryForAssetsInAssetCollection:v7 options:0];
    id v8 = [v41 containerRelationship];
    v9 = [v8 name];
    if (v8 && ([v8 isToMany] & 1) == 0)
    {
      v37 = [v5 fetchedObjectIDs];
      v36 = [NSString stringWithFormat:@"noindex:(%@) IN (%%@)", v9];
      v35 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v36, v37);
      unint64_t v11 = (void *)MEMORY[0x1E4F1C0D0];
      v12 = [MEMORY[0x1E4F8A950] entityName];
      int v13 = [v11 fetchRequestWithEntityName:v12];

      [v13 setResultType:2];
      objc_super v14 = (void *)MEMORY[0x1E4F28BA0];
      v68[0] = v6;
      v68[1] = v35;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
      uint64_t v16 = [v14 andPredicateWithSubpredicates:v15];
      [v13 setPredicate:v16];

      [v13 setSortDescriptors:MEMORY[0x1E4F1CBF0]];
      v67 = v9;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
      [v13 setPropertiesToGroupBy:v17];

      id v38 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
      [v38 setName:v9];
      v18 = [MEMORY[0x1E4F28C68] expressionForKeyPath:v9];
      [v38 setExpression:v18];

      [v38 setExpressionResultType:2000];
      id v66 = v38;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
      [v13 setPropertiesToFetch:v19];

      uint64_t v57 = 0;
      v58 = &v57;
      uint64_t v59 = 0x3032000000;
      v60 = __Block_byref_object_copy__41289;
      v61 = __Block_byref_object_dispose__41290;
      id v62 = 0;
      uint64_t v51 = 0;
      v52 = &v51;
      uint64_t v53 = 0x3032000000;
      v54 = __Block_byref_object_copy__41289;
      v55 = __Block_byref_object_dispose__41290;
      id v56 = 0;
      int v20 = [v40 photoLibraryForCurrentQueueQoS];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __80__PHCollection_fetchFilteredAssetCollections_containingAssetsMatchingPredicate___block_invoke;
      v46[3] = &unk_1E5847CB0;
      v49 = &v57;
      id v47 = v20;
      id v33 = v13;
      id v34 = v47;
      id v48 = v33;
      v50 = &v51;
      [v47 performBlockAndWait:v46];
      if (v58[5])
      {
        id v21 = objc_alloc(MEMORY[0x1E4F1CA48]);
        uint64_t v22 = objc_msgSend(v21, "initWithCapacity:", objc_msgSend((id)v58[5], "count"));
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v23 = (id)v58[5];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v63 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v43;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v43 != v25) {
                objc_enumerationMutation(v23);
              }
              v27 = [*(id *)(*((void *)&v42 + 1) + 8 * i) valueAtIndex:0];
              [v22 addObject:v27];
            }
            uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v63 count:16];
          }
          while (v24);
        }

        v28 = [PHManualFetchResult alloc];
        v29 = [v5 fetchType];
        v30 = [v5 fetchPropertySets];
        v10 = [(PHManualFetchResult *)v28 initWithOids:v22 photoLibrary:v40 fetchType:v29 fetchPropertySets:v30 identifier:0 registerIfNeeded:0];
      }
      else
      {
        uint64_t v22 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v31 = v52[5];
          *(_DWORD *)buf = 138412290;
          uint64_t v65 = v31;
          _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_ERROR, "Error fetching filtered asset collections:%@", buf, 0xCu);
        }
        v10 = 0;
      }

      _Block_object_dispose(&v51, 8);
      _Block_object_dispose(&v57, 8);
    }
    else
    {
      v10 = 0;
    }

    id v6 = v39;
  }
  else
  {
    v10 = (PHManualFetchResult *)v5;
  }

  return v10;
}

void __80__PHCollection_fetchFilteredAssetCollections_containingAssetsMatchingPredicate___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 executeFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

+ (id)fetchMomentsForPersonsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v6 chunkSizeForFetch])
  {
    if (v6)
    {
      uint64_t v7 = [v6 copy];

      id v6 = (id)v7;
    }
    else
    {
      id v6 = (id)objc_opt_new();
    }
    [v6 setChunkSizeForFetch:2000];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__PHCollection_fetchMomentsForPersonsWithLocalIdentifiers_options___block_invoke;
  v11[3] = &unk_1E5849048;
  id v12 = v5;
  id v8 = v5;
  v9 = +[PHObject authorizationAwareFetchResultWithOptions:v6 fetchBlock:v11];

  return v9;
}

id __67__PHCollection_fetchMomentsForPersonsWithLocalIdentifiers_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = +[PHQuery queryForMomentsForPersonsWithLocalIdentifiers:v2 options:v3];
  [v4 setFetchOptions:v3];

  id v5 = [v4 executeQuery];

  return v5;
}

+ (id)fetchMomentsForFacesWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v6 chunkSizeForFetch])
  {
    if (v6)
    {
      uint64_t v7 = [v6 copy];

      id v6 = (id)v7;
    }
    else
    {
      id v6 = (id)objc_opt_new();
    }
    [v6 setChunkSizeForFetch:2000];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__PHCollection_fetchMomentsForFacesWithLocalIdentifiers_options___block_invoke;
  v11[3] = &unk_1E5849048;
  id v12 = v5;
  id v8 = v5;
  v9 = +[PHObject authorizationAwareFetchResultWithOptions:v6 fetchBlock:v11];

  return v9;
}

id __65__PHCollection_fetchMomentsForFacesWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForMomentsForFacesWithLocalIdentifiers:*(void *)(a1 + 32) options:a2];
  id v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchMomentsForAssetsWithOIDs:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v6 chunkSizeForFetch])
  {
    if (v6)
    {
      uint64_t v7 = [v6 copy];

      id v6 = (id)v7;
    }
    else
    {
      id v6 = (id)objc_opt_new();
    }
    [v6 setChunkSizeForFetch:2000];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__PHCollection_fetchMomentsForAssetsWithOIDs_options___block_invoke;
  v11[3] = &unk_1E5849048;
  id v12 = v5;
  id v8 = v5;
  v9 = +[PHObject authorizationAwareFetchResultWithOptions:v6 fetchBlock:v11];

  return v9;
}

id __54__PHCollection_fetchMomentsForAssetsWithOIDs_options___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForMomentsContainingAssetsWithOIDs:*(void *)(a1 + 32) options:a2];
  id v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchMomentsForAssetsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v6 chunkSizeForFetch])
  {
    if (v6)
    {
      uint64_t v7 = [v6 copy];

      id v6 = (id)v7;
    }
    else
    {
      id v6 = (id)objc_opt_new();
    }
    [v6 setChunkSizeForFetch:2000];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__PHCollection_fetchMomentsForAssetsWithLocalIdentifiers_options___block_invoke;
  v11[3] = &unk_1E5849048;
  id v12 = v5;
  id v8 = v5;
  v9 = +[PHObject authorizationAwareFetchResultWithOptions:v6 fetchBlock:v11];

  return v9;
}

id __66__PHCollection_fetchMomentsForAssetsWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[PHQuery queryForMomentsContainingAssetsWithLocalIdentifiers:*(void *)(a1 + 32) options:a2];
  id v3 = [v2 executeQuery];

  return v3;
}

+ (PHFetchResult)fetchCollectionsInCollectionList:(PHCollectionList *)collectionList options:(PHFetchOptions *)options
{
  id v5 = collectionList;
  id v6 = options;
  if (v5)
  {
    if (![(PHObject *)v5 isTransient]) {
      goto LABEL_8;
    }
    uint64_t v7 = [(PHCollectionList *)v5 transientIdentifier];
    id v8 = [(PHCollectionList *)v5 query];
    v9 = v8;
    if (v8)
    {
      v10 = [v8 executeQuery];
    }
    else
    {
      unint64_t v11 = [(PHCollectionList *)v5 collections];
      id v12 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v6 object:v5];
      int v13 = [PHManualFetchResult alloc];
      objc_super v14 = [(PHFetchOptions *)v6 fetchPropertySetsAsSet];
      v10 = [(PHManualFetchResult *)v13 initWithObjects:v11 photoLibrary:v12 fetchType:@"PHCollectionList" fetchPropertySets:v14 identifier:v7 registerIfNeeded:1];
    }
    if (!v10)
    {
LABEL_8:
      if (!v6)
      {
        id v6 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:0 orObject:v5];
      }
      v15 = [(PHFetchOptions *)v6 photoLibrary];

      if (!v15)
      {
        uint64_t v16 = [(PHObject *)v5 photoLibrary];
        [(PHFetchOptions *)v6 setPhotoLibrary:v16];
      }
      v17 = +[PHQuery queryForCollectionsInCollectionList:v5 options:v6];
      v10 = [v17 executeQuery];
    }
  }
  else
  {
    v10 = 0;
  }

  return (PHFetchResult *)v10;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PHCollection_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_41310 != -1) {
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_41310, block);
  }
  if ([(id)transformValueExpression_forKeyPath___passThroughSet_41311 containsObject:v7]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

void __52__PHCollection_transformValueExpression_forKeyPath___block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"title";
  v4[1] = @"localizedTitle";
  v4[2] = @"startDate";
  v4[3] = @"endDate";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_41311;
  transformValueExpression_forKeyPath___passThroughSet_41311 = v2;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  uint64_t v2 = (void *)entityKeyMap_pl_once_object_15_41326;

  return v2;
}

void __28__PHCollection_entityKeyMap__block_invoke()
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v0 = [PHEntityKeyMap alloc];
  unint64_t v11 = @"uuid";
  v12[0] = @"uuid";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v13[0] = v1;
  v12[1] = @"title";
  v10[0] = @"localizedTitle";
  v10[1] = @"title";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v13[1] = v2;
  void v12[2] = @"startDate";
  v9 = @"startDate";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  v13[2] = v3;
  v12[3] = @"endDate";
  id v8 = @"endDate";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  v13[3] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
  uint64_t v6 = [(PHEntityKeyMap *)v0 initWithPropertyKeysByEntityKey:v5];
  id v7 = (void *)entityKeyMap_pl_once_object_15_41326;
  entityKeyMap_pl_once_object_15_41326 = v6;
}

+ (id)fetchType
{
  uint64_t v2 = @"PHCollection";
  return @"PHCollection";
}

@end