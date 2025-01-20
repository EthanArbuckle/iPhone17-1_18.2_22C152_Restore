@interface PHCollectionList
+ (BOOL)managedObjectSupportsTrashedState;
+ (PHCollectionList)transientCollectionListWithCollections:(NSArray *)collections title:(NSString *)title;
+ (PHCollectionList)transientCollectionListWithCollectionsFetchResult:(PHFetchResult *)fetchResult title:(NSString *)title;
+ (PHFetchResult)fetchCollectionListsContainingCollection:(PHCollection *)collection options:(PHFetchOptions *)options;
+ (PHFetchResult)fetchCollectionListsWithLocalIdentifiers:(NSArray *)identifiers options:(PHFetchOptions *)options;
+ (PHFetchResult)fetchCollectionListsWithType:(PHCollectionListType)collectionListType subtype:(PHCollectionListSubtype)subtype options:(PHFetchOptions *)options;
+ (PHFetchResult)fetchMomentListsWithSubtype:(PHCollectionListSubtype)momentListSubtype containingMoment:(PHAssetCollection *)moment options:(PHFetchOptions *)options;
+ (PHFetchResult)fetchMomentListsWithSubtype:(PHCollectionListSubtype)momentListSubtype options:(PHFetchOptions *)options;
+ (id)entityKeyMap;
+ (id)fetchCollectionListsForReferences:(id)a3 photoLibrary:(id)a4;
+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4;
+ (id)fetchRootAlbumCollectionListWithOptions:(id)a3;
+ (id)fetchRootProjectCollectionListWithOptions:(id)a3;
+ (id)fetchType;
+ (id)identifierCode;
+ (id)managedEntityName;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
+ (id)transientCollectionListWithCollections:(id)a3 title:(id)a4 identifier:(id)a5;
+ (id)transientCollectionListWithCollections:(id)a3 title:(id)a4 identifier:(id)a5 photoLibrary:(id)a6;
+ (id)transientCollectionListWithCollectionsFetchResult:(id)a3 title:(id)a4 identifier:(id)a5;
- (BOOL)canContainCollections;
- (BOOL)canPerformEditOperation:(int64_t)a3;
- (BOOL)collectionHasFixedOrder;
- (BOOL)hasLocationInfo;
- (BOOL)keyCollectionsAtEnd;
- (Class)changeRequestClass;
- (NSArray)collections;
- (NSArray)localizedLocationNames;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)cloudGUID;
- (NSString)transientIdentifier;
- (PHCollectionList)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (PHCollectionListSubtype)collectionListSubtype;
- (PHCollectionListType)collectionListType;
- (PHQuery)query;
- (id)childCollectionsSortingComparator;
- (id)description;
- (id)effectiveCustomSortDescriptors;
- (id)initTransientWithCollections:(id)a3 orQuery:(id)a4 title:(id)a5 identifier:(id)a6 photoLibrary:(id)a7;
- (id)localizedTitle;
- (id)objectReference;
- (id)parentFolderID;
- (id)pl_assetContainerList;
- (unint64_t)collectionFixedOrderPriority;
- (unint64_t)estimatedChildCollectionCount;
- (unint64_t)unreadAssetCollectionsCount;
@end

@implementation PHCollectionList

- (BOOL)canContainCollections
{
  return 1;
}

+ (id)transientCollectionListWithCollections:(id)a3 title:(id)a4 identifier:(id)a5 photoLibrary:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[PHCollectionList alloc] initTransientWithCollections:v12 orQuery:0 title:v11 identifier:v10 photoLibrary:v9];

  return v13;
}

- (id)initTransientWithCollections:(id)a3 orQuery:(id)a4 title:(id)a5 identifier:(id)a6 photoLibrary:(id)a7
{
  v35[11] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    v35[0] = @"PHAssetCollection";
    v35[1] = @"PHAlbum";
    v35[2] = @"PHCloudSharedAlbum";
    v35[3] = @"PHSmartAlbum";
    v35[4] = @"PHCollectionList";
    v35[5] = @"PHCollection";
    v35[6] = @"PHMoment";
    v35[7] = @"PHMomentList";
    v35[8] = @"PHImportSession";
    v35[9] = @"PHProject";
    v35[10] = @"PHPhotosHighlight";
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:11];
    v18 = [v13 fetchType];
    char v19 = [v17 containsObject:v18];

    if ((v19 & 1) == 0)
    {
      id v34 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"The fetch result returned an unexpected fetch type" userInfo:0];
      objc_exception_throw(v34);
    }
  }
  v20 = [MEMORY[0x1E4F1CA60] dictionary];
  [v20 setObject:&unk_1EEB250C8 forKeyedSubscript:@"identifier"];
  v21 = [MEMORY[0x1E4F29128] UUID];
  v22 = [v21 UUIDString];
  [v20 setObject:v22 forKeyedSubscript:@"uuid"];

  if (!v16)
  {
    v23 = [v13 fetchOptions];
    v24 = [v12 firstObject];
    id v16 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v23 object:v24];
  }
  v25 = [(PHCollectionList *)self initWithFetchDictionary:v20 propertyHint:2 photoLibrary:v16];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_localizedTitle, a5);
    uint64_t v27 = [v13 copy];
    query = v26->_query;
    v26->_query = (PHQuery *)v27;

    uint64_t v29 = [v12 copy];
    collections = v26->_collections;
    v26->_collections = (NSArray *)v29;

    uint64_t v31 = [v15 copy];
    transientIdentifier = v26->_transientIdentifier;
    v26->_transientIdentifier = (NSString *)v31;
  }
  return v26;
}

- (PHCollectionList)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PHCollectionList;
  id v9 = [(PHCollection *)&v23 initWithFetchDictionary:v8 propertyHint:a4 photoLibrary:a5];
  id v10 = v9;
  if (v9)
  {
    v9->_estimatedChildCollectionCount = 0x7FFFFFFFFFFFFFFFLL;
    id v11 = [v8 objectForKeyedSubscript:@"kind"];
    v10->_plAlbumKind = [v11 shortValue];

    uint64_t v12 = [v8 objectForKeyedSubscript:@"cloudGUID"];
    cloudGUID = v10->_cloudGUID;
    v10->_cloudGUID = (NSString *)v12;

    unsigned int v14 = v10->_plAlbumKind - 3998;
    if (v14 > 8)
    {
      uint64_t v16 = 100;
      uint64_t v15 = 2;
    }
    else
    {
      uint64_t v15 = qword_19B2CC6F8[v14];
      uint64_t v16 = *(void *)&asc_19B2CC740[8 * v14];
    }
    v10->_collectionListType = v15;
    v10->_collectionListSubtype = v16;
    uint64_t v17 = [v8 objectForKeyedSubscript:@"title"];
    localizedTitle = v10->_localizedTitle;
    v10->_localizedTitle = (NSString *)v17;

    localizedLocationNames = v10->_localizedLocationNames;
    v10->_localizedLocationNames = (NSArray *)MEMORY[0x1E4F1CBF0];

    uint64_t v20 = [v8 objectForKeyedSubscript:@"parentFolder"];
    parentFolderObjectID = v10->_parentFolderObjectID;
    v10->_parentFolderObjectID = (NSManagedObjectID *)v20;
  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudGUID, 0);
  objc_storeStrong(&self->_childCollectionsSortingComparator, 0);
  objc_storeStrong((id *)&self->_parentFolderObjectID, 0);
  objc_storeStrong((id *)&self->_transientIdentifier, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_localizedLocationNames, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

- (NSString)transientIdentifier
{
  return self->_transientIdentifier;
}

- (NSString)cloudGUID
{
  return self->_cloudGUID;
}

- (unint64_t)estimatedChildCollectionCount
{
  return self->_estimatedChildCollectionCount;
}

- (unint64_t)unreadAssetCollectionsCount
{
  return self->_unreadAssetCollectionsCount;
}

- (id)childCollectionsSortingComparator
{
  return self->_childCollectionsSortingComparator;
}

- (PHQuery)query
{
  return self->_query;
}

- (PHCollectionListSubtype)collectionListSubtype
{
  return self->_collectionListSubtype;
}

- (PHCollectionListType)collectionListType
{
  return self->_collectionListType;
}

- (NSArray)collections
{
  return self->_collections;
}

- (NSArray)localizedLocationNames
{
  return self->_localizedLocationNames;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PHCollectionList;
  v3 = [(PHCollection *)&v6 description];
  v4 = objc_msgSend(v3, "stringByAppendingFormat:", @" collectionListType=%ld/%ld", -[PHCollectionList collectionListType](self, "collectionListType"), -[PHCollectionList collectionListSubtype](self, "collectionListSubtype"));

  return v4;
}

- (id)effectiveCustomSortDescriptors
{
  uint64_t v3 = [(PHCollection *)self customSortKey];
  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F8A968], "sortDescriptorsForAlbumsInFolderWithSortKey:ascending:", v3, -[PHCollection customSortAscending](self, "customSortAscending"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)parentFolderID
{
  return self->_parentFolderObjectID;
}

- (BOOL)hasLocationInfo
{
  uint64_t v3 = [(PHCollectionList *)self localizedLocationNames];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PHCollectionList;
    BOOL v4 = [(PHCollection *)&v6 hasLocationInfo];
  }

  return v4;
}

- (BOOL)keyCollectionsAtEnd
{
  return [(PHCollectionList *)self collectionListType] == PHCollectionListTypeSmartFolder
      && [(PHCollectionList *)self collectionListSubtype] == 1000000202;
}

- (unint64_t)collectionFixedOrderPriority
{
  return [MEMORY[0x1E4F8A948] priorityForAlbumKind:self->_plAlbumKind];
}

- (BOOL)collectionHasFixedOrder
{
  return [MEMORY[0x1E4F8A948] albumKindHasFixedOrder:self->_plAlbumKind];
}

- (BOOL)canPerformEditOperation:(int64_t)a3
{
  int plAlbumKind = self->_plAlbumKind;
  if (plAlbumKind <= 3998)
  {
    if (plAlbumKind == 3998) {
      return a3 == 5;
    }
    return 0;
  }
  if (plAlbumKind == 4000) {
    return 1;
  }
  if (plAlbumKind != 3999) {
    return 0;
  }
  if ((unint64_t)a3 >= 6) {
    return 0;
  }
  else {
    return (0x3Au >> a3) & 1;
  }
}

- (id)localizedTitle
{
  uint64_t v3 = self->_localizedTitle;
  if (!v3)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F8A848];
    uint64_t plAlbumKind = self->_plAlbumKind;
    objc_super v6 = [(PHObject *)self photoLibrary];
    objc_msgSend(v4, "localizedTitleForAlbumKind:cplEnabled:", plAlbumKind, objc_msgSend(v6, "isCloudPhotoLibraryEnabled"));
    uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

+ (id)transientCollectionListWithCollectionsFetchResult:(id)a3 title:(id)a4 identifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [PHCollectionList alloc];
  id v11 = [v9 query];
  uint64_t v12 = [v9 photoLibrary];

  id v13 = [(PHCollectionList *)v10 initTransientWithCollections:0 orQuery:v11 title:v8 identifier:v7 photoLibrary:v12];

  return v13;
}

+ (id)transientCollectionListWithCollections:(id)a3 title:(id)a4 identifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[PHCollectionList alloc] initTransientWithCollections:v9 orQuery:0 title:v8 identifier:v7 photoLibrary:0];

  return v10;
}

+ (PHCollectionList)transientCollectionListWithCollectionsFetchResult:(PHFetchResult *)fetchResult title:(NSString *)title
{
  v5 = fetchResult;
  objc_super v6 = title;
  id v7 = [(PHFetchResult *)v5 query];
  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [(PHFetchResult *)v5 fetchedObjects];
  }
  id v9 = [PHCollectionList alloc];
  id v10 = [(PHFetchResult *)v5 photoLibrary];
  id v11 = [(PHCollectionList *)v9 initTransientWithCollections:v8 orQuery:v7 title:v6 identifier:0 photoLibrary:v10];

  return (PHCollectionList *)v11;
}

+ (PHCollectionList)transientCollectionListWithCollections:(NSArray *)collections title:(NSString *)title
{
  v5 = title;
  objc_super v6 = collections;
  id v7 = [[PHCollectionList alloc] initTransientWithCollections:v6 orQuery:0 title:v5 identifier:0 photoLibrary:0];

  return (PHCollectionList *)v7;
}

+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___PHCollectionList;
  BOOL v4 = objc_msgSendSuper2(&v6, sel_fetchPredicateFromComparisonPredicate_options_, a3, a4);

  return v4;
}

+ (PHFetchResult)fetchMomentListsWithSubtype:(PHCollectionListSubtype)momentListSubtype options:(PHFetchOptions *)options
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PHCollectionList_fetchMomentListsWithSubtype_options___block_invoke;
  v6[3] = &__block_descriptor_40_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  v6[4] = momentListSubtype;
  BOOL v4 = +[PHObject authorizationAwareFetchResultWithOptions:options fetchBlock:v6];

  return (PHFetchResult *)v4;
}

id __56__PHCollectionList_fetchMomentListsWithSubtype_options___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForMomentListsWithSubType:*(void *)(a1 + 32) options:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (PHFetchResult)fetchMomentListsWithSubtype:(PHCollectionListSubtype)momentListSubtype containingMoment:(PHAssetCollection *)moment options:(PHFetchOptions *)options
{
  v5 = moment;
  if (moment)
  {
    id v7 = options;
    id v8 = +[PHQuery queryForMomentListsWithSubType:momentListSubtype containingMoment:v5];
    [v8 setFetchOptions:v7];

    v5 = [v8 executeQuery];
  }

  return (PHFetchResult *)v5;
}

+ (id)fetchRootProjectCollectionListWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:a3 fetchBlock:&__block_literal_global_88];
}

id __62__PHCollectionList_fetchRootProjectCollectionListWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForRootProjectCollectionListWithOptions:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchRootAlbumCollectionListWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:a3 fetchBlock:&__block_literal_global_7925];
}

id __60__PHCollectionList_fetchRootAlbumCollectionListWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForRootAlbumCollectionListWithOptions:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (PHFetchResult)fetchCollectionListsWithType:(PHCollectionListType)collectionListType subtype:(PHCollectionListSubtype)subtype options:(PHFetchOptions *)options
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__PHCollectionList_fetchCollectionListsWithType_subtype_options___block_invoke;
  v7[3] = &__block_descriptor_48_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  v7[4] = collectionListType;
  v7[5] = subtype;
  v5 = +[PHObject authorizationAwareFetchResultWithOptions:options fetchBlock:v7];

  return (PHFetchResult *)v5;
}

id __65__PHCollectionList_fetchCollectionListsWithType_subtype_options___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForCollectionListsWithType:*(void *)(a1 + 32) subtype:*(void *)(a1 + 40) options:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (PHFetchResult)fetchCollectionListsWithLocalIdentifiers:(NSArray *)identifiers options:(PHFetchOptions *)options
{
  v5 = identifiers;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__PHCollectionList_fetchCollectionListsWithLocalIdentifiers_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  objc_super v6 = v5;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:options fetchBlock:v9];

  return (PHFetchResult *)v7;
}

id __69__PHCollectionList_fetchCollectionListsWithLocalIdentifiers_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    BOOL v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    v5 = +[PHObject identifierCodeFromLocalIdentifier:v4];

    int64_t v6 = +[PHPhotoLibrary collectionListTypeForIdentifierCode:v5];
  }
  else
  {
    int64_t v6 = 2;
  }
  id v7 = +[PHQuery queryForCollectionListsWithType:v6 localIdentifiers:*(void *)(a1 + 32) options:v3];
  id v8 = [v7 executeQuery];

  return v8;
}

+ (PHFetchResult)fetchCollectionListsContainingCollection:(PHCollection *)collection options:(PHFetchOptions *)options
{
  v5 = collection;
  int64_t v6 = options;
  if (v5
    && ([(PHObject *)v5 objectID], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    id v8 = +[PHQuery queryForCollectionListContainingCollection:v5 options:v6];
    uint64_t v9 = [v8 executeQuery];
  }
  else
  {
    id v8 = [(PHObject *)v5 photoLibrary];
    uint64_t v9 = +[PHManualFetchResult emptyFetchResultWithPhotoLibrary:v8];
  }
  id v10 = (void *)v9;

  return (PHFetchResult *)v10;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  v2 = (void *)entityKeyMap_pl_once_object_15_7930;

  return v2;
}

void __32__PHCollectionList_entityKeyMap__block_invoke()
{
  v17[6] = *MEMORY[0x1E4F143B8];
  v0 = [PHEntityKeyMap alloc];
  uint64_t v15 = @"uuid";
  v16[0] = @"uuid";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v17[0] = v1;
  v16[1] = @"title";
  v14[0] = @"localizedTitle";
  v14[1] = @"title";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v17[1] = v2;
  v16[2] = @"startDate";
  id v13 = @"startDate";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v17[2] = v3;
  v16[3] = @"endDate";
  uint64_t v12 = @"endDate";
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  v17[3] = v4;
  v16[4] = @"customSortAscending";
  id v11 = @"customSortAscending";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v17[4] = v5;
  v16[5] = @"customSortKey";
  id v10 = @"customSortKey";
  int64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v17[5] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:6];
  uint64_t v8 = [(PHEntityKeyMap *)v0 initWithPropertyKeysByEntityKey:v7];
  uint64_t v9 = (void *)entityKeyMap_pl_once_object_15_7930;
  entityKeyMap_pl_once_object_15_7930 = v8;
}

+ (id)identifierCode
{
  return @"020";
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 1;
}

+ (id)fetchType
{
  v2 = @"PHCollectionList";
  return @"PHCollectionList";
}

+ (id)managedEntityName
{
  return @"Folder";
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PHCollectionList_propertiesToFetchWithHint___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (propertiesToFetchWithHint__onceToken_7954 != -1) {
    dispatch_once(&propertiesToFetchWithHint__onceToken_7954, block);
  }
  id v3 = (void *)propertiesToFetchWithHint__array_7955;

  return v3;
}

void __46__PHCollectionList_propertiesToFetchWithHint___block_invoke()
{
  v4[10] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
  [v0 setName:@"objectID"];
  v1 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
  [v0 setExpression:v1];

  [v0 setExpressionResultType:2000];
  v4[0] = v0;
  v4[1] = @"uuid";
  v4[2] = @"cloudGUID";
  v4[3] = @"cachedCount";
  v4[4] = @"kind";
  v4[5] = @"title";
  v4[6] = @"customSortAscending";
  v4[7] = @"customSortKey";
  v4[8] = @"parentFolder";
  v4[9] = @"trashedState";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:10];
  id v3 = (void *)propertiesToFetchWithHint__array_7955;
  propertiesToFetchWithHint__array_7955 = v2;
}

- (id)pl_assetContainerList
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PHAdoptionUtilities.m" lineNumber:187 description:@"This is only callable on the main thread"];
  }
  if ([(PHCollectionList *)self collectionListType] == PHCollectionListTypeMomentList
    || [(PHCollectionList *)self collectionListType] == PHCollectionListTypeFolder)
  {
    BOOL v4 = (void *)MEMORY[0x19F389B10]();
    v5 = [(PHObject *)self photoLibrary];
    int64_t v6 = [v5 mainQueueConcurrencyPhotoLibrary];
    id v7 = [v6 managedObjectContext];

    uint64_t v8 = [(PHObject *)self objectID];
    id v14 = 0;
    uint64_t v9 = [v7 existingObjectWithID:v8 error:&v14];
    id v10 = v14;

    if (!v9 && v10)
    {
      id v11 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v10;
        _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_DEFAULT, "Failed to fetch moment: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)objectReference
{
  return +[PHCollectionListReference referenceForCollectionList:self];
}

+ (id)fetchCollectionListsForReferences:(id)a3 photoLibrary:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[PHCollectionList fetchType];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__PHCollectionList_PHObjectReference__fetchCollectionListsForReferences_photoLibrary___block_invoke;
  v11[3] = &unk_1E5846B50;
  id v12 = v5;
  id v8 = v5;
  uint64_t v9 = PHCollectionReferenceFetchCollectionsForReferences((uint64_t)v6, v8, v7, v11);

  return v9;
}

id __86__PHCollectionList_PHObjectReference__fetchCollectionListsForReferences_photoLibrary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 librarySpecificFetchOptions];
  [v4 setIncludeTrashedAssets:1];
  id v5 = +[PHCollectionList fetchCollectionListsWithLocalIdentifiers:v3 options:v4];

  return v5;
}

@end