@interface PHChange
+ (BOOL)isPublicPHObjectChangeClass:(Class)a3;
+ (id)handlerQueue;
+ (id)mergePersistedChanges:(id)a3;
+ (id)publicPHObjectChangeClasses;
+ (void)pl_simulateChangeWithAssetContainerList:(id)a3 photoLibrary:(id)a4 handler:(id)a5;
- (BOOL)_changedRelationshipsContainChangeForRelationshipNames:(id)a3 objectID:(id)a4;
- (BOOL)_shouldCreateChangeDetailsWithCurrentFetchResultForQuery:(id)a3;
- (BOOL)anyUpdatedObjectsWithChangedAttributes:(unint64_t)a3 ofEntity:(id)a4;
- (BOOL)anyUpdatedObjectsWithChangedRelationships:(unint64_t)a3 ofEntity:(id)a4;
- (BOOL)assetCloudLocalStateChangedForAsset:(id)a3;
- (BOOL)assetsOrDayGroupAssetsRelationshipChangedForHighlightWithLocalIdentifier:(id)a3;
- (BOOL)containsChangesForEntityClass:(Class)a3;
- (BOOL)containsChangesForEntityWithManagedEntityName:(id)a3;
- (BOOL)contentOrThumbnailChangedForAsset:(id)a3;
- (BOOL)contentOrThumbnailChangedForPHAssetOID:(id)a3;
- (BOOL)customUserAssetsChangedForPHMemoryOID:(id)a3;
- (BOOL)deferredProcessingNeededChangedForPHAssetOID:(id)a3;
- (BOOL)faceRelationshipChangedForPersonWithLocalIdentifier:(id)a3;
- (BOOL)favoriteStateChangedForPHAssetOID:(id)a3;
- (BOOL)hasCloudStatusChanges;
- (BOOL)hasIncrementalChanges;
- (BOOL)hasRelationshipChangesForLocalIdentifier:(id)a3;
- (BOOL)hiddenStateChangedForPHAssetOID:(id)a3;
- (BOOL)highlightGroupRelationshipChangedForHighlightWithLocalIdentifier:(id)a3;
- (BOOL)intersectsWithDetectionCriteria:(id)a3 managedObjectContext:(id)a4;
- (BOOL)keyAssetPrivateOrDayGroupKeyAssetPrivateChangedForHighlightWithLocalIdentifier:(id)a3;
- (BOOL)keyAssetSharedOrDayGroupKeyAssetSharedChangedForHighlightWithLocalIdentifier:(id)a3;
- (BOOL)keyAssetsChangedForPHAssetCollectionOID:(id)a3;
- (BOOL)keyFaceChangedForPersonOID:(id)a3;
- (BOOL)membersOrAssetContainmentForSocialGroupChangedWithLocalIdentifier:(id)a3;
- (BOOL)momentRelationshipChangedForHighlightWithLocalIdentifier:(id)a3;
- (BOOL)packedBadgeAttributesChangedForPHAssetOID:(id)a3;
- (BOOL)personRelationshipChangedForFaceWithLocalIdentifier:(id)a3;
- (BOOL)trashedStateChangedForObjectID:(id)a3;
- (BOOL)userCuratedAssetsChangedForPHMemoryOID:(id)a3;
- (BOOL)userFeedbackRelationshipChangedForObject:(id)a3;
- (BOOL)wasFetchResultRefetched:(id)a3;
- (NSDictionary)deletedPrimaryLabelCodesByObjectId;
- (NSDictionary)deletedUuidsByObjectId;
- (NSManagedObjectContext)context;
- (PHChange)init;
- (PHChange)initWithChangedIdentifiers:(id)a3 unknownMergeEvent:(BOOL)a4 changeToken:(id)a5 library:(id)a6;
- (PHChange)initWithChangedIdentifiers:(id)a3 unknownMergeEvent:(BOOL)a4 library:(id)a5;
- (PHChange)initWithCloudStatus:(id)a3 library:(id)a4;
- (PHChange)initWithInsertedObjectIDs:(id)a3 updatedObjectIDs:(id)a4 deletedObjectIDs:(id)a5 deletedUuidsByObjectId:(id)a6 deletedPrimaryLabelCodesByOID:(id)a7 changedAttributesByOID:(id)a8 changedRelationshipsByOID:(id)a9 unknownMergeEvent:(BOOL)a10 changeToken:(id)a11 fetchOptions:(id)a12 library:(id)a13 managedObjectContext:(id)a14 enumerationContext:(id)a15;
- (PHFetchResultChangeDetails)changeDetailsForFetchResult:(PHFetchResult *)object;
- (PHObjectChangeDetails)changeDetailsForObject:(PHObject *)object;
- (PHPersistentChangeEnumerationContext)enumerationContext;
- (PHPersistentChangeFetchOptions)fetchOptions;
- (PHPersistentChangeToken)changeToken;
- (PHPhotoLibrary)library;
- (PHPhotoLibraryCloudStatus)cloudStatus;
- (id)_changedLocalIdentifiersForEntityClass:(Class)a3 context:(id)a4;
- (id)_changedLocalIdentifiersWithPublicChangesForEntityClass:(Class)a3 context:(id)a4;
- (id)_deletedLocalIdentifiersForEntityClass:(Class)a3 context:(id)a4;
- (id)_deletedObjectIDsMatchingEntities:(id)a3;
- (id)_deletedObjectIDsMatchingGraphNodeContainerType:(Class)a3;
- (id)_entityNamesForEntities:(id)a3;
- (id)_fetchCombinedPublicResultsMapForEntityClass:(Class)a3 predicate:(id)a4 context:(id)a5;
- (id)_fetchGraphNodeIDsWithRequiredPrimaryLabelCode:(Class)a3 changedObjectIDs:(id)a4;
- (id)_fetchUUIDMapForObjectIDs:(id)a3 entityClass:(Class)a4 context:(id)a5;
- (id)_formatEncodedDictionary:(id)a3 withDecodeBlock:(id)a4;
- (id)_formatedDeletedUUidsByObjectId;
- (id)_insertedOrUpdatedObjectIDsMatchingEntities:(id)a3;
- (id)_pl_prettyDescriptionWithIndent:(int64_t)a3;
- (id)_predicateForPublicResultsWithEntityClass:(Class)a3 objectIDs:(id)a4;
- (id)_preloadChangeDetailsWithClearCacheForFetchResults:(id)a3 inManagedObjectContext:(id)a4;
- (id)_preloadChangeDetailsWithRefetchForFetchResults:(id)a3 inManagedObjectContext:(id)a4;
- (id)_relationshipNamesForObjectID:(id)a3 entityClass:(Class)a4;
- (id)_requiredLabelCodeNumberForContainerClass:(Class)a3;
- (id)_retrieveLockingRestrictedUUIDsForUnresolvedAssetObjectIDsFrom:(id)a3 minusResolved:(id)a4;
- (id)changedAttributesByOID;
- (id)changedLocalIdentifiersForEntityClass:(Class)a3;
- (id)changedLocalIdentifiersForEntityClass:(Class)a3 context:(id)a4;
- (id)changedPropertyNamesForLocalIdentifier:(id)a3 entityClass:(Class)a4;
- (id)changedPropertyNamesForObject:(id)a3;
- (id)changedPropertyNamesForObjectID:(id)a3 entityClass:(Class)a4;
- (id)changedRelationshipNamesForLocalIdentifier:(id)a3 entityClass:(Class)a4;
- (id)changedRelationshipNamesForObject:(id)a3;
- (id)changedRelationshipsByOID;
- (id)deletedLocalIdentifiersForEntityClass:(Class)a3;
- (id)deletedObjectIDs;
- (id)description;
- (id)insertedObjectIDs;
- (id)retrieveUUIDsForAssetObjectIDs:(id)a3 filterPredicate:(id)a4;
- (id)updatedObjectIDs;
- (unint64_t)totalChangeCount;
- (void)_prepareCachedValuesForEntity:(id)a3;
- (void)_propagatePropertyNamesToSubentityNames:(id)a3 moc:(id)a4;
- (void)preloadChangeDetailsForFetchResults:(id)a3 inManagedObjectContext:(id)a4 handler:(id)a5;
- (void)preloadSimulatedChangeDetailsForManualFetchResults:(id)a3 handler:(id)a4;
@end

@implementation PHChange

+ (void)pl_simulateChangeWithAssetContainerList:(id)a3 photoLibrary:(id)a4 handler:(id)a5
{
  id v7 = a5;
  v8 = +[PHFetchResult pl_fetchResultForAssetContainerList:a3 photoLibrary:a4];
  v9 = objc_opt_new();
  v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__PHChange_PHAdoptionUtilities__pl_simulateChangeWithAssetContainerList_photoLibrary_handler___block_invoke;
  v12[3] = &unk_1E5843CC0;
  id v13 = v7;
  id v11 = v7;
  [v9 preloadSimulatedChangeDetailsForManualFetchResults:v10 handler:v12];
}

uint64_t __94__PHChange_PHAdoptionUtilities__pl_simulateChangeWithAssetContainerList_photoLibrary_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeToken, 0);
  objc_storeStrong((id *)&self->_enumerationContext, 0);
  objc_storeStrong((id *)&self->_fetchOptions, 0);
  objc_storeStrong((id *)&self->_deletedPrimaryLabelCodesByObjectId, 0);
  objc_storeStrong((id *)&self->_deletedUuidsByObjectId, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_cloudStatus, 0);
  objc_storeStrong((id *)&self->_refetchedFetchResults, 0);
  objc_storeStrong((id *)&self->_objectIDsByLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_changeHandlingMap, 0);
  objc_storeStrong((id *)&self->_changeDetailIsolation, 0);
  objc_storeStrong((id *)&self->_collectionChangeDetailsForObjects, 0);
  objc_storeStrong((id *)&self->_changeDetailsForObjects, 0);
  objc_storeStrong((id *)&self->_sortedChangedObjectIDs, 0);
  objc_storeStrong((id *)&self->_updatedObjectsChangedRelationshipsByEntityName, 0);
  objc_storeStrong((id *)&self->_updatedObjectsChangedAttributesByEntityName, 0);
  objc_storeStrong((id *)&self->_changedRelationshipsByOID, 0);
  objc_storeStrong((id *)&self->_changedAttributesByOID, 0);
  objc_storeStrong((id *)&self->_deletedObjectIDs, 0);
  objc_storeStrong((id *)&self->_changedObjectIDs, 0);

  objc_storeStrong((id *)&self->_insertedObjectIDs, 0);
}

- (PHPersistentChangeToken)changeToken
{
  return self->_changeToken;
}

- (PHPersistentChangeEnumerationContext)enumerationContext
{
  return self->_enumerationContext;
}

- (PHPersistentChangeFetchOptions)fetchOptions
{
  return self->_fetchOptions;
}

- (NSDictionary)deletedPrimaryLabelCodesByObjectId
{
  return self->_deletedPrimaryLabelCodesByObjectId;
}

- (NSDictionary)deletedUuidsByObjectId
{
  return self->_deletedUuidsByObjectId;
}

- (PHPhotoLibrary)library
{
  return self->_library;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (id)_formatEncodedDictionary:(id)a3 withDecodeBlock:(id)a4
{
  id v5 = a4;
  v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  v8 = [v6 dictionary];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __53__PHChange__formatEncodedDictionary_withDecodeBlock___block_invoke;
  v16 = &unk_1E58441A0;
  id v17 = v8;
  id v18 = v5;
  id v9 = v8;
  id v10 = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:&v13];

  id v11 = objc_msgSend(v9, "copy", v13, v14, v15, v16);

  return v11;
}

void __53__PHChange__formatEncodedDictionary_withDecodeBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  objc_msgSend(v6, "pl_shortURI");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v5 unsignedLongLongValue];

  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [v6 entity];

  id v10 = [v9 name];
  id v11 = (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, v7, v10);

  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v12];
}

- (id)_formatedDeletedUUidsByObjectId
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  deletedUuidsByObjectId = self->_deletedUuidsByObjectId;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__PHChange__formatedDeletedUUidsByObjectId__block_invoke;
  v7[3] = &unk_1E5844178;
  id v5 = v3;
  id v8 = v5;
  [(NSDictionary *)deletedUuidsByObjectId enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __43__PHChange__formatedDeletedUUidsByObjectId__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  objc_msgSend(a2, "pl_shortURI");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

- (id)_pl_prettyDescriptionWithIndent:(int64_t)a3
{
  v3 = pl_result_with_autoreleasepool();

  return v3;
}

id __44__PHChange__pl_prettyDescriptionWithIndent___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F8A7A8] prettyMultiLineDescriptionBuilderWithObject:*(void *)(a1 + 32) indent:*(void *)(a1 + 40)];
  v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "_pl_map:", &__block_literal_global_196);
  [v2 appendName:@"insertedObjectIDs" object:v3];

  v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "_pl_map:", &__block_literal_global_196);
  [v2 appendName:@"changedObjectIDs" object:v4];

  id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "_pl_map:", &__block_literal_global_196);
  [v2 appendName:@"deletedObjectIDs" object:v5];

  id v6 = [*(id *)(a1 + 32) _formatedDeletedUUidsByObjectId];
  [v2 appendName:@"deletedUuidsByObjectId" object:v6];

  uint64_t v7 = [*(id *)(a1 + 32) _formatEncodedDictionary:*(void *)(*(void *)(a1 + 32) + 32) withDecodeBlock:&__block_literal_global_212_13829];
  [v2 appendName:@"changedAttributesByOID" object:v7];
  id v8 = [*(id *)(a1 + 32) _formatEncodedDictionary:*(void *)(*(void *)(a1 + 32) + 40) withDecodeBlock:&__block_literal_global_217_13831];
  [v2 appendName:@"changedRelationshipsByOID" object:v8];
  [v2 appendName:@"unknownMergeEvent" typeCode:"B" value:*(void *)(a1 + 32) + 104];
  [v2 appendName:@"changeToken" typeCode:"@" value:*(void *)(a1 + 32) + 184];
  if ([*(id *)(a1 + 32) hasCloudStatusChanges]) {
    [v2 appendName:@"cloudStatus" typeCode:"@" value:*(void *)(a1 + 32) + 128];
  }
  id v9 = [v2 build];

  return v9;
}

uint64_t __44__PHChange__pl_prettyDescriptionWithIndent___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [MEMORY[0x1E4F8AAF8] relationshipNamesForIndexValues:a2 entity:a3];
}

uint64_t __44__PHChange__pl_prettyDescriptionWithIndent___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [MEMORY[0x1E4F8AAF8] attributeNamesForIndexValues:a2 entity:a3];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PHChange;
  v2 = [(PHChange *)&v4 description];

  return v2;
}

- (id)retrieveUUIDsForAssetObjectIDs:(id)a3 filterPredicate:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  id v9 = (void *)[v6 mutableCopy];
  if ([(NSDictionary *)self->_deletedUuidsByObjectId count])
  {
    id v27 = v7;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          v16 = -[NSDictionary objectForKeyedSubscript:](self->_deletedUuidsByObjectId, "objectForKeyedSubscript:", v15, v27);
          if (v16)
          {
            [v8 setObject:v16 forKeyedSubscript:v15];
            [v9 removeObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v12);
    }

    id v7 = v27;
  }
  if (objc_msgSend(v9, "count", v27))
  {
    library = self->_library;
    if (library)
    {
      id v18 = [(PHPhotoLibrary *)library assetsdClient];
      v19 = [v18 photoKitClient];

      v20 = [(PHPhotoLibrary *)self->_library changeHandlingPhotoLibrary];
      v21 = [v20 managedObjectContext];

      v22 = [v9 allObjects];
      id v28 = 0;
      v23 = [v19 getUUIDsForAssetObjectIDs:v22 filterPredicate:v7 context:v21 error:&v28];
      id v24 = v28;

      if (v23)
      {
        [v8 addEntriesFromDictionary:v23];
      }
      else
      {
        v25 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v24;
          _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_ERROR, "Failed to retrieve UUIDs for changed object IDs %@", buf, 0xCu);
        }
      }
    }
  }

  return v8;
}

- (id)changedRelationshipNamesForLocalIdentifier:(id)a3 entityClass:(Class)a4
{
  id v6 = [(NSMutableDictionary *)self->_objectIDsByLocalIdentifier objectForKeyedSubscript:a3];
  if (v6) {
    [(PHChange *)self _relationshipNamesForObjectID:v6 entityClass:a4];
  }
  else {
  id v7 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v7;
}

- (id)changedRelationshipNamesForObject:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectID];
  uint64_t v6 = objc_opt_class();

  id v7 = [(PHChange *)self _relationshipNamesForObjectID:v5 entityClass:v6];

  return v7;
}

- (id)_relationshipNamesForObjectID:(id)a3 entityClass:(Class)a4
{
  id v6 = a3;
  id v7 = [(objc_class *)a4 managedEntityName];
  id v8 = [(NSDictionary *)self->_changedRelationshipsByOID objectForKeyedSubscript:v6];

  id v9 = objc_msgSend(MEMORY[0x1E4F8AAF8], "relationshipNamesForIndexValues:entity:", objc_msgSend(v8, "unsignedLongLongValue"), v7);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__PHChange__relationshipNamesForObjectID_entityClass___block_invoke;
  v13[3] = &__block_descriptor_40_e28___NSString_16__0__NSString_8lu32l8;
  v13[4] = a4;
  id v10 = objc_msgSend(v9, "_pl_map:", v13);
  uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];

  return v11;
}

uint64_t __54__PHChange__relationshipNamesForObjectID_entityClass___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) propertyKeyForEntityKey:a2];
}

- (id)changedPropertyNamesForLocalIdentifier:(id)a3 entityClass:(Class)a4
{
  id v6 = [(NSMutableDictionary *)self->_objectIDsByLocalIdentifier objectForKeyedSubscript:a3];
  if (v6) {
    [(PHChange *)self changedPropertyNamesForObjectID:v6 entityClass:a4];
  }
  else {
  id v7 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v7;
}

- (id)changedPropertyNamesForObject:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectID];
  uint64_t v6 = objc_opt_class();

  id v7 = [(PHChange *)self changedPropertyNamesForObjectID:v5 entityClass:v6];

  return v7;
}

- (id)changedPropertyNamesForObjectID:(id)a3 entityClass:(Class)a4
{
  id v6 = a3;
  id v7 = [(objc_class *)a4 managedEntityName];
  id v8 = [(NSDictionary *)self->_changedAttributesByOID objectForKeyedSubscript:v6];

  id v9 = objc_msgSend(MEMORY[0x1E4F8AAF8], "attributeNamesForIndexValues:entity:", objc_msgSend(v8, "unsignedLongLongValue"), v7);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__PHChange_changedPropertyNamesForObjectID_entityClass___block_invoke;
  v13[3] = &__block_descriptor_40_e28___NSString_16__0__NSString_8lu32l8;
  v13[4] = a4;
  id v10 = objc_msgSend(v9, "_pl_map:", v13);
  uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];

  return v11;
}

uint64_t __56__PHChange_changedPropertyNamesForObjectID_entityClass___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) propertyKeyForEntityKey:a2];
}

- (BOOL)_shouldCreateChangeDetailsWithCurrentFetchResultForQuery:(id)a3
{
  v30[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 fetchType];
  if (([v5 isEqualToString:@"PHPerson"] & 1) == 0)
  {

    goto LABEL_6;
  }
  id v6 = [v4 fetchOptions];
  uint64_t v7 = [v6 personContext];

  if (v7 != 1)
  {
LABEL_6:
    LOBYTE(v11) = 0;
    goto LABEL_23;
  }
  id v8 = +[PHAsset managedEntityName];
  context = self->_context;
  if (context)
  {
    id v10 = context;
  }
  else
  {
    uint64_t v12 = [(PHPhotoLibrary *)self->_library photoLibrary];
    id v10 = [v12 managedObjectContext];
  }
  uint64_t v13 = [MEMORY[0x1E4F1C0A8] entityForName:v8 inManagedObjectContext:v10];
  uint64_t v14 = (void *)MEMORY[0x1E4F8AAF8];
  v30[0] = @"hidden";
  v30[1] = @"trashedState";
  v30[2] = @"visibilityState";
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
  uint64_t v16 = [v14 indexValueForAttributeNames:v15 entity:v8];

  if ([(PHChange *)self anyUpdatedObjectsWithChangedAttributes:v16 ofEntity:v13])
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v17 = self->_deletedObjectIDs;
    uint64_t v11 = [(NSSet *)v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      id v24 = v10;
      uint64_t v18 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v17);
          }
          v20 = [*(id *)(*((void *)&v25 + 1) + 8 * i) entity];
          v21 = [v20 name];
          char v22 = [v21 isEqualToString:v8];

          if (v22)
          {
            LOBYTE(v11) = 1;
            goto LABEL_20;
          }
        }
        uint64_t v11 = [(NSSet *)v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v11) {
          continue;
        }
        break;
      }
LABEL_20:
      id v10 = v24;
    }
  }
LABEL_23:

  return v11;
}

- (id)_fetchCombinedPublicResultsMapForEntityClass:(Class)a3 predicate:(id)a4 context:(id)a5
{
  v64[2] = *MEMORY[0x1E4F143B8];
  id v32 = a4;
  id v7 = a5;
  context = (void *)MEMORY[0x19F389B10]();
  v37 = [(objc_class *)a3 entityKeyForPropertyKey:@"uuid"];
  id v8 = (void *)MEMORY[0x1E4F1CA48];
  id v9 = [MEMORY[0x1E4F8A978] objectIDDescription];
  v64[0] = v9;
  v64[1] = v37;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
  v33 = [v8 arrayWithArray:v10];

  int v36 = [(objc_class *)a3 managedObjectSupportsTrashedState];
  if (v36)
  {
    [v33 addObject:@"trashedState"];
    id v34 = @"trashedState";
  }
  else
  {
    id v34 = 0;
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v12 = [(objc_class *)a3 managedEntityName];
  uint64_t v13 = [v11 fetchRequestWithEntityName:v12];

  [v13 setPredicate:v32];
  [v13 setPropertiesToFetch:v33];
  [v13 setResultType:2];
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__13879;
  v57 = __Block_byref_object_dispose__13880;
  id v58 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__13879;
  v51 = __Block_byref_object_dispose__13880;
  id v52 = 0;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __75__PHChange__fetchCombinedPublicResultsMapForEntityClass_predicate_context___block_invoke;
  v42[3] = &unk_1E5847CB0;
  v45 = &v47;
  id v14 = v7;
  id v43 = v14;
  id v15 = v13;
  id v44 = v15;
  v46 = &v53;
  [v14 performBlockAndWait:v42];
  long long v29 = v14;
  long long v30 = v15;
  if (v48[5])
  {
    uint64_t v16 = [MEMORY[0x1E4F8A978] objectIDDescription];
    id v17 = [v16 name];

    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = (id)v48[5];
    uint64_t v19 = [obj countByEnumeratingWithState:&v38 objects:v59 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v39 != v20) {
            objc_enumerationMutation(obj);
          }
          char v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          v23 = [v22 objectForKeyedSubscript:v17];
          id v24 = [MEMORY[0x1E4F1CA60] dictionary];
          long long v25 = [v22 objectForKeyedSubscript:v37];
          [v24 setObject:v25 forKeyedSubscript:@"uuid"];

          if (v36)
          {
            long long v26 = [v22 objectForKeyedSubscript:v34];
            [v24 setObject:v26 forKeyedSubscript:@"trashed"];
          }
          [v18 setObject:v24 forKeyedSubscript:v23];
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v38 objects:v59 count:16];
      }
      while (v19);
    }
  }
  else
  {
    id v17 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = v54[5];
      *(_DWORD *)buf = 138412546;
      uint64_t v61 = v27;
      __int16 v62 = 2112;
      id v63 = v15;
      _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_ERROR, "Fetch error: %@ while fetching objectIDs with fetch request %@", buf, 0x16u);
    }
    uint64_t v18 = (void *)MEMORY[0x1E4F1CC08];
  }

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  return v18;
}

void __75__PHChange__fetchCombinedPublicResultsMapForEntityClass_predicate_context___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 executeFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)_predicateForPublicResultsWithEntityClass:(Class)a3 objectIDs:(id)a4
{
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setIncludeAssetSourceTypes:1];
  if ([(objc_class *)a3 managedObjectSupportsTrashedState]) {
    [v7 setIncludeTrashedAssets:1];
  }
  if ([(objc_class *)a3 managedObjectSupportsHiddenState]) {
    [v7 setIncludeHiddenAssets:1];
  }
  if ([(objc_class *)a3 managedObjectSupportsBursts]) {
    [v7 setIncludeAllBurstAssets:1];
  }
  if (v6)
  {
    id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v6];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [(objc_class *)a3 fetchType];
  id v10 = +[PHQuery queryForType:v9 withBasePredicate:v8 inLibrary:self->_library];

  [v10 setFetchOptions:v7];
  uint64_t v11 = [v10 effectivePredicateForPHClass:a3 includingBasePredicate:v8 != 0];

  return v11;
}

- (id)_changedLocalIdentifiersWithPublicChangesForEntityClass:(Class)a3 context:(id)a4
{
  v54[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(objc_class *)a3 objectIDsMatchingEntityFromObjectIDs:self->_insertedObjectIDs context:v6];
  v45 = v6;
  uint64_t v8 = [(objc_class *)a3 objectIDsMatchingEntityFromObjectIDs:self->_changedObjectIDs context:v6];
  if (v7)
  {
    id v9 = (void *)[v7 mutableCopy];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CA80] set];
  }
  id v10 = v9;
  if (v8) {
    [v9 unionSet:v8];
  }
  id v44 = (void *)v8;
  uint64_t v11 = [(objc_class *)a3 managedEntityName];
  uint64_t v12 = [MEMORY[0x1E4F8A858] entityName];
  long long v41 = v11;
  LODWORD(v11) = [v11 isEqualToString:v12];

  if (v11)
  {
    uint64_t v13 = [(PHChange *)self _fetchGraphNodeIDsWithRequiredPrimaryLabelCode:a3 changedObjectIDs:v10];
    [v10 intersectSet:v13];
  }
  long long v40 = [(PHChange *)self _predicateForPublicResultsWithEntityClass:a3 objectIDs:v10];
  id v14 = -[PHChange _fetchCombinedPublicResultsMapForEntityClass:predicate:context:](self, "_fetchCombinedPublicResultsMapForEntityClass:predicate:context:", a3);
  v42 = v10;
  if ([(objc_class *)a3 isEqual:objc_opt_class()]
    && (unint64_t v15 = [v14 count], v15 < objc_msgSend(v10, "count"))
    && ([(PHPhotoLibrary *)self->_library photoLibraryBundle],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        uint64_t v17 = [v16 connectionType],
        v16,
        v17 == 1))
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = [v14 allKeys];
    uint64_t v20 = [v18 setWithArray:v19];
    v21 = [(PHChange *)self _retrieveLockingRestrictedUUIDsForUnresolvedAssetObjectIDsFrom:v10 minusResolved:v20];
  }
  else
  {
    v21 = 0;
  }
  char v22 = [MEMORY[0x1E4F1CA80] set];
  v23 = [MEMORY[0x1E4F1CA80] set];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PHChange__changedLocalIdentifiersWithPublicChangesForEntityClass_context___block_invoke;
  aBlock[3] = &unk_1E58440A0;
  Class v52 = a3;
  id v39 = v14;
  id v47 = v39;
  v48 = self;
  id v24 = v23;
  id v49 = v24;
  id v25 = v22;
  id v50 = v25;
  id v37 = v21;
  id v51 = v37;
  long long v26 = _Block_copy(aBlock);
  id v43 = v7;
  uint64_t v27 = objc_msgSend(v7, "_pl_map:", v26);
  long long v28 = objc_msgSend(v44, "_pl_map:", v26);
  long long v29 = [(PHChange *)self _deletedLocalIdentifiersForEntityClass:a3 context:v45];
  if ([v25 count])
  {
    if (v29)
    {
      uint64_t v30 = objc_msgSend(v29, "setByAddingObjectsFromSet:", v25, v37, v39);

      long long v29 = (void *)v30;
    }
    else
    {
      long long v29 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithSet:", v25, v37, v39);
    }
  }
  if (objc_msgSend(v24, "count", v37))
  {
    if (v27)
    {
      uint64_t v31 = [v27 setByAddingObjectsFromSet:v24];

      uint64_t v27 = (void *)v31;
    }
    else
    {
      uint64_t v27 = [MEMORY[0x1E4F1CAD0] setWithSet:v24];
    }
  }
  v53[0] = @"PHInsertedLocalIdentifiersKey";
  id v32 = v27;
  if (!v27)
  {
    id v32 = [MEMORY[0x1E4F1CAD0] set];
  }
  v54[0] = v32;
  v53[1] = @"PHUpdatedLocalIdentifiersKey";
  v33 = v28;
  if (!v28)
  {
    v33 = [MEMORY[0x1E4F1CAD0] set];
  }
  v54[1] = v33;
  v53[2] = @"PHDeletedLocalIdentifiersKey";
  id v34 = v29;
  if (!v29)
  {
    id v34 = [MEMORY[0x1E4F1CAD0] set];
  }
  v54[2] = v34;
  v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:3];
  if (v29)
  {
    if (v28) {
      goto LABEL_29;
    }
LABEL_34:

    if (v27) {
      goto LABEL_30;
    }
    goto LABEL_35;
  }

  if (!v28) {
    goto LABEL_34;
  }
LABEL_29:
  if (v27) {
    goto LABEL_30;
  }
LABEL_35:

LABEL_30:

  return v35;
}

NSObject *__76__PHChange__changedLocalIdentifiersWithPublicChangesForEntityClass_context___block_invoke(id *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [a1[4] objectForKeyedSubscript:v3];
  uint64_t v5 = v4;
  if (!v4
    || ([v4 objectForKeyedSubscript:@"uuid"], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    unint64_t v15 = [a1[8] objectForKeyedSubscript:v3];
    if (v15)
    {
      uint64_t v8 = [a1[9] localIdentifierWithUUID:v15];
      [*((id *)a1[5] + 14) setObject:v3 forKeyedSubscript:v8];
      if (![a1[5] trashedStateChangedForPHAssetOID:v3])
      {
LABEL_15:

        id v7 = 0;
        goto LABEL_16;
      }
      uint64_t v16 = [*((id *)a1[5] + 22) trashedIdentifiersAsDeletes];
      char v17 = [v16 containsObject:v8];

      if ((v17 & 1) == 0) {
        [a1[7] addObject:v8];
      }
    }
    else
    {
      uint64_t v8 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v21 = 138412290;
        id v22 = v3;
        _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEBUG, "Could not fetch valid uuid for the objectID: %@", (uint8_t *)&v21, 0xCu);
      }
    }

    uint64_t v8 = 0;
    goto LABEL_15;
  }
  id v7 = (void *)v6;
  uint64_t v8 = [a1[9] localIdentifierWithUUID:v6];
  if (v8)
  {
    [*((id *)a1[5] + 14) setObject:v3 forKeyedSubscript:v8];
    if ([a1[5] trashedStateChangedForPHAssetOID:v3])
    {
      id v9 = [v5 objectForKeyedSubscript:@"trashed"];
      uint64_t v10 = [v9 integerValue];
      uint64_t v11 = (void *)*((void *)a1[5] + 22);
      if (v10)
      {
        uint64_t v12 = [v11 trashedIdentifiersAsDeletes];
        char v13 = [v12 containsObject:v8];

        if ((v13 & 1) == 0)
        {
          id v14 = a1 + 7;
LABEL_21:
          [*v14 addObject:v8];
        }
      }
      else
      {
        uint64_t v19 = [v11 untrashedIdentifiersAsInserts];
        char v20 = [v19 containsObject:v8];

        if ((v20 & 1) == 0)
        {
          id v14 = a1 + 6;
          goto LABEL_21;
        }
      }

      uint64_t v8 = 0;
    }
  }
LABEL_16:

  return v8;
}

- (id)_retrieveLockingRestrictedUUIDsForUnresolvedAssetObjectIDsFrom:(id)a3 minusResolved:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v7, "containsObject:", v14, (void)v18) & 1) == 0
          && ([(PHChange *)self trashedStateChangedForPHAssetOID:v14]
           || [(PHChange *)self hiddenStateChangedForPHAssetOID:v14]))
        {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  unint64_t v15 = [(PHChange *)self _predicateForPublicResultsWithEntityClass:objc_opt_class() objectIDs:0];
  uint64_t v16 = [(PHChange *)self retrieveUUIDsForAssetObjectIDs:v8 filterPredicate:v15];

  return v16;
}

- (id)_fetchUUIDMapForObjectIDs:(id)a3 entityClass:(Class)a4 context:(id)a5
{
  v58[2] = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v7 = a5;
  context = (void *)MEMORY[0x19F389B10]();
  uint64_t v8 = (void *)MEMORY[0x1E4F1C0D0];
  id v9 = [(objc_class *)a4 managedEntityName];
  uint64_t v10 = [v8 fetchRequestWithEntityName:v9];

  [v10 setResultType:2];
  uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v31];
  [v10 setPredicate:v11];

  uint64_t v12 = [(objc_class *)a4 entityKeyForPropertyKey:@"uuid"];
  char v13 = [MEMORY[0x1E4F8A978] objectIDDescription];
  v58[0] = v13;
  v58[1] = v12;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
  [v10 setPropertiesToFetch:v14];

  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  id v50 = __Block_byref_object_copy__13879;
  id v51 = __Block_byref_object_dispose__13880;
  id v52 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  id v44 = __Block_byref_object_copy__13879;
  v45 = __Block_byref_object_dispose__13880;
  id v46 = 0;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __58__PHChange__fetchUUIDMapForObjectIDs_entityClass_context___block_invoke;
  v36[3] = &unk_1E5847CB0;
  id v39 = &v41;
  id v15 = v7;
  id v37 = v15;
  id v16 = v10;
  id v38 = v16;
  long long v40 = &v47;
  [v15 performBlockAndWait:v36];
  long long v29 = v16;
  if (v42[5])
  {
    char v17 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v18 = [MEMORY[0x1E4F8A978] objectIDDescription];
    long long v19 = [v18 name];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v20 = (id)v42[5];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v53 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(v20);
          }
          id v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v25 = [v24 objectForKeyedSubscript:v12];
          long long v26 = [v24 objectForKeyedSubscript:v19];
          [v17 setObject:v25 forKeyedSubscript:v26];
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v53 count:16];
      }
      while (v21);
    }
  }
  else
  {
    long long v19 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = v48[5];
      *(_DWORD *)buf = 138412546;
      uint64_t v55 = v27;
      __int16 v56 = 2112;
      id v57 = v31;
      _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "Fetch error: %@ while fetching objectIDs: %@", buf, 0x16u);
    }
    char v17 = (void *)MEMORY[0x1E4F1CC08];
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  return v17;
}

void __58__PHChange__fetchUUIDMapForObjectIDs_entityClass_context___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 executeFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)_fetchGraphNodeIDsWithRequiredPrimaryLabelCode:(Class)a3 changedObjectIDs:(id)a4
{
  id v6 = a4;
  id v7 = [(PHChange *)self _requiredLabelCodeNumberForContainerClass:a3];
  if (v7)
  {
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 1;
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    context = self->_context;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __76__PHChange__fetchGraphNodeIDsWithRequiredPrimaryLabelCode_changedObjectIDs___block_invoke;
    v15[3] = &unk_1E5848DA8;
    id v10 = v6;
    id v16 = v10;
    char v17 = self;
    id v20 = &v21;
    id v18 = v7;
    id v11 = v8;
    id v19 = v11;
    [(NSManagedObjectContext *)context performBlockAndWait:v15];
    if (*((unsigned char *)v22 + 24)) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = v10;
    }
    id v13 = v12;

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    id v13 = v6;
  }

  return v13;
}

void __76__PHChange__fetchGraphNodeIDsWithRequiredPrimaryLabelCode_changedObjectIDs___block_invoke(uint64_t a1)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F8A858] fetchRequest];
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", *(void *)(a1 + 32)];
  [v2 setPredicate:v3];

  [v2 setResultType:2];
  v15[0] = @"primaryLabelCode";
  v15[1] = @"objectID";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [v2 setPropertiesToFetch:v4];

  [v2 setFetchBatchSize:100];
  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 136);
  id v12 = 0;
  id v6 = [v5 executeFetchRequest:v2 error:&v12];
  id v7 = v12;
  if (!v6)
  {
    uint64_t v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "Error fetching graphNodePrimaryLabelCodeDictionaries: %@", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__PHChange__fetchGraphNodeIDsWithRequiredPrimaryLabelCode_changedObjectIDs___block_invoke_163;
  v9[3] = &unk_1E5844750;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  [v6 enumerateObjectsUsingBlock:v9];
}

void __76__PHChange__fetchGraphNodeIDsWithRequiredPrimaryLabelCode_changedObjectIDs___block_invoke_163(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 objectForKeyedSubscript:@"objectID"];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"primaryLabelCode"];

  if ([v4 isEqualToNumber:*(void *)(a1 + 32)]) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (id)_changedLocalIdentifiersForEntityClass:(Class)a3 context:(id)a4
{
  v34[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(objc_class *)a3 objectIDsMatchingEntityFromObjectIDs:self->_insertedObjectIDs context:v6];
  uint64_t v8 = [(objc_class *)a3 objectIDsMatchingEntityFromObjectIDs:self->_changedObjectIDs context:v6];
  if (v7)
  {
    id v9 = (void *)[v7 mutableCopy];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CA80] set];
  }
  id v10 = v9;
  if (v8) {
    [v9 unionSet:v8];
  }
  id v11 = [(objc_class *)a3 managedEntityName];
  id v12 = [MEMORY[0x1E4F8A858] entityName];
  long long v26 = v11;
  LODWORD(v11) = [v11 isEqualToString:v12];

  if (v11)
  {
    id v13 = [(PHChange *)self _fetchGraphNodeIDsWithRequiredPrimaryLabelCode:a3 changedObjectIDs:v10];
    [v10 intersectSet:v13];
  }
  id v14 = [(PHChange *)self _fetchUUIDMapForObjectIDs:v10 entityClass:a3 context:v6];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PHChange__changedLocalIdentifiersForEntityClass_context___block_invoke;
  aBlock[3] = &unk_1E5844078;
  id v31 = self;
  Class v32 = a3;
  id v24 = v14;
  id v30 = v24;
  id v15 = _Block_copy(aBlock);
  long long v28 = v7;
  id v16 = objc_msgSend(v7, "_pl_map:", v15);
  uint64_t v27 = v8;
  char v17 = objc_msgSend(v8, "_pl_map:", v15);
  id v18 = [(PHChange *)self _deletedLocalIdentifiersForEntityClass:a3 context:v6];
  v33[0] = @"PHInsertedLocalIdentifiersKey";
  id v19 = v16;
  if (!v16)
  {
    id v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "set", v24);
  }
  v34[0] = v19;
  v33[1] = @"PHUpdatedLocalIdentifiersKey";
  id v20 = v17;
  if (!v17)
  {
    id v20 = [MEMORY[0x1E4F1CAD0] set];
  }
  v34[1] = v20;
  v33[2] = @"PHDeletedLocalIdentifiersKey";
  uint64_t v21 = v18;
  if (!v18)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CAD0] set];
  }
  v34[2] = v21;
  uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v34, v33, 3, v24);
  if (v18)
  {
    if (v17) {
      goto LABEL_16;
    }
LABEL_21:

    if (v16) {
      goto LABEL_17;
    }
    goto LABEL_22;
  }

  if (!v17) {
    goto LABEL_21;
  }
LABEL_16:
  if (v16) {
    goto LABEL_17;
  }
LABEL_22:

LABEL_17:

  return v22;
}

id __59__PHChange__changedLocalIdentifiersForEntityClass_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 48) localIdentifierWithUUID:v4];
    if (v5) {
      [*(id *)(*(void *)(a1 + 40) + 112) setObject:v3 forKeyedSubscript:v5];
    }
  }
  else
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_DEBUG, "Could not fetch valid uuid for the objectID: %@", (uint8_t *)&v8, 0xCu);
    }

    id v5 = 0;
  }

  return v5;
}

- (id)changedLocalIdentifiersForEntityClass:(Class)a3 context:(id)a4
{
  id v6 = a4;
  if (!v6 || (objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_6;
  }
  if (![(PHPersistentChangeFetchOptions *)self->_fetchOptions excludesPrivateChanges])
  {
    uint64_t v7 = [(PHChange *)self _changedLocalIdentifiersForEntityClass:a3 context:v6];
    goto LABEL_8;
  }
  if (![(id)objc_opt_class() isPublicPHObjectChangeClass:a3])
  {
LABEL_6:
    int v8 = (void *)MEMORY[0x1E4F1CC08];
    goto LABEL_9;
  }
  uint64_t v7 = [(PHChange *)self _changedLocalIdentifiersWithPublicChangesForEntityClass:a3 context:v6];
LABEL_8:
  int v8 = (void *)v7;
LABEL_9:

  return v8;
}

- (id)_deletedObjectIDsMatchingGraphNodeContainerType:(Class)a3
{
  uint64_t v4 = [(PHChange *)self _requiredLabelCodeNumberForContainerClass:a3];
  id v5 = v4;
  if (v4)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __60__PHChange__deletedObjectIDsMatchingGraphNodeContainerType___block_invoke;
    id v12 = &unk_1E5844050;
    id v13 = self;
    id v14 = v4;
    id v6 = _Block_copy(&v9);
    uint64_t v7 = -[NSSet _pl_filter:](self->_deletedObjectIDs, "_pl_filter:", v6, v9, v10, v11, v12, v13);
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v7;
}

uint64_t __60__PHChange__deletedObjectIDsMatchingGraphNodeContainerType___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 160) objectForKey:a2];
  uint64_t v4 = [v3 isEqualToNumber:*(void *)(a1 + 40)];

  return v4;
}

- (id)_requiredLabelCodeNumberForContainerClass:(Class)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((Class)objc_opt_class() == a3)
  {
    id v6 = NSNumber;
    uint64_t v7 = 1000;
LABEL_8:
    id v5 = [v6 numberWithUnsignedInt:v7];
    goto LABEL_9;
  }
  if ((Class)objc_opt_class() == a3)
  {
    id v6 = NSNumber;
    uint64_t v7 = 1100;
    goto LABEL_8;
  }
  uint64_t v4 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    Class v10 = a3;
    _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_ERROR, "No node container class for node with class: %@", (uint8_t *)&v9, 0xCu);
  }

  id v5 = 0;
LABEL_9:

  return v5;
}

- (id)_deletedLocalIdentifiersForEntityClass:(Class)a3 context:(id)a4
{
  id v6 = a4;
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v7 = [(objc_class *)a3 managedEntityName];
    int v8 = [MEMORY[0x1E4F8A858] entityName];
    int v9 = [v7 isEqualToString:v8];

    if (v9) {
      [(PHChange *)self _deletedObjectIDsMatchingGraphNodeContainerType:a3];
    }
    else {
    uint64_t v11 = [(objc_class *)a3 objectIDsMatchingEntityFromObjectIDs:self->_deletedObjectIDs context:v6];
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__PHChange__deletedLocalIdentifiersForEntityClass_context___block_invoke;
    v14[3] = &unk_1E5844028;
    v14[4] = self;
    v14[5] = a3;
    id v12 = _Block_copy(v14);
    Class v10 = objc_msgSend(v11, "_pl_map:", v12);
  }
  else
  {
    Class v10 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v10;
}

id __59__PHChange__deletedLocalIdentifiersForEntityClass_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 152) objectForKeyedSubscript:v3];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) localIdentifierWithUUID:v4];
  }
  else
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "nil deleted uuid for objectID: %@", (uint8_t *)&v8, 0xCu);
    }

    id v5 = 0;
  }

  return v5;
}

- (id)deletedLocalIdentifiersForEntityClass:(Class)a3
{
  return [(PHChange *)self _deletedLocalIdentifiersForEntityClass:a3 context:self->_context];
}

- (id)changedLocalIdentifiersForEntityClass:(Class)a3
{
  return [(PHChange *)self changedLocalIdentifiersForEntityClass:a3 context:self->_context];
}

- (BOOL)containsChangesForEntityClass:(Class)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return self->_unknownMergeEvent;
  }
  id v5 = [(objc_class *)a3 managedEntityName];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v6 = [(PHChange *)self insertedObjectIDs];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v38;
LABEL_4:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v38 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = [*(id *)(*((void *)&v37 + 1) + 8 * v10) entity];
      id v12 = [v11 name];
      char v13 = [v12 isEqualToString:v5];

      if (v13) {
        goto LABEL_28;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
        if (v8) {
          goto LABEL_4;
        }
        break;
      }
    }
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = [(PHChange *)self deletedObjectIDs];
  uint64_t v14 = [v6 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v34;
LABEL_12:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v34 != v16) {
        objc_enumerationMutation(v6);
      }
      id v18 = [*(id *)(*((void *)&v33 + 1) + 8 * v17) entity];
      id v19 = [v18 name];
      char v20 = [v19 isEqualToString:v5];

      if (v20) {
        goto LABEL_28;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [v6 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v15) {
          goto LABEL_12;
        }
        break;
      }
    }
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = [(PHChange *)self updatedObjectIDs];
  uint64_t v21 = [v6 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (!v21)
  {
LABEL_26:

    return self->_unknownMergeEvent;
  }
  uint64_t v22 = v21;
  uint64_t v23 = *(void *)v30;
LABEL_20:
  uint64_t v24 = 0;
  while (1)
  {
    if (*(void *)v30 != v23) {
      objc_enumerationMutation(v6);
    }
    id v25 = [*(id *)(*((void *)&v29 + 1) + 8 * v24) entity];
    long long v26 = [v25 name];
    char v27 = [v26 isEqualToString:v5];

    if (v27) {
      break;
    }
    if (v22 == ++v24)
    {
      uint64_t v22 = [v6 countByEnumeratingWithState:&v29 objects:v41 count:16];
      if (v22) {
        goto LABEL_20;
      }
      goto LABEL_26;
    }
  }
LABEL_28:

  return 1;
}

- (BOOL)containsChangesForEntityWithManagedEntityName:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = [(PHChange *)self insertedObjectIDs];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v38 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = [*(id *)(*((void *)&v37 + 1) + 8 * v9) entity];
      uint64_t v11 = [v10 name];
      char v12 = [v11 isEqualToString:v4];

      if (v12) {
        goto LABEL_26;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = [(PHChange *)self deletedObjectIDs];
  uint64_t v13 = [v5 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v34;
LABEL_11:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v34 != v15) {
        objc_enumerationMutation(v5);
      }
      uint64_t v17 = [*(id *)(*((void *)&v33 + 1) + 8 * v16) entity];
      id v18 = [v17 name];
      char v19 = [v18 isEqualToString:v4];

      if (v19) {
        goto LABEL_26;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v5 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v14) {
          goto LABEL_11;
        }
        break;
      }
    }
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = [(PHChange *)self updatedObjectIDs];
  uint64_t v20 = [v5 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v30;
LABEL_19:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v30 != v22) {
        objc_enumerationMutation(v5);
      }
      uint64_t v24 = [*(id *)(*((void *)&v29 + 1) + 8 * v23) entity];
      id v25 = [v24 name];
      char v26 = [v25 isEqualToString:v4];

      if (v26) {
        break;
      }
      if (v21 == ++v23)
      {
        uint64_t v21 = [v5 countByEnumeratingWithState:&v29 objects:v41 count:16];
        if (v21) {
          goto LABEL_19;
        }
        goto LABEL_25;
      }
    }
LABEL_26:

    BOOL unknownMergeEvent = 1;
    goto LABEL_27;
  }
LABEL_25:

  BOOL unknownMergeEvent = self->_unknownMergeEvent;
LABEL_27:

  return unknownMergeEvent;
}

- (BOOL)intersectsWithDetectionCriteria:(id)a3 managedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v18 = 0;
    char v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __65__PHChange_intersectsWithDetectionCriteria_managedObjectContext___block_invoke;
    void v15[3] = &unk_1E5844000;
    void v15[4] = self;
    id v9 = v7;
    id v16 = v9;
    uint64_t v17 = &v18;
    [v6 enumerateEntitiesAndAttributeIndexesUsingBlock:v15];
    if (*((unsigned char *)v19 + 24))
    {
      BOOL v10 = 1;
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __65__PHChange_intersectsWithDetectionCriteria_managedObjectContext___block_invoke_2;
      v12[3] = &unk_1E5844000;
      void v12[4] = self;
      id v13 = v9;
      uint64_t v14 = &v18;
      [v6 enumerateEntitiesAndRelationshipIndexesBlock:v12];
      BOOL v10 = *((unsigned char *)v19 + 24) != 0;
    }
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

void __65__PHChange_intersectsWithDetectionCriteria_managedObjectContext___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = (void *)a1[4];
  id v6 = [MEMORY[0x1E4F1C0A8] entityForName:a2 inManagedObjectContext:a1[5]];
  LOBYTE(a3) = [v5 anyUpdatedObjectsWithChangedAttributes:a3 ofEntity:v6];

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
}

void __65__PHChange_intersectsWithDetectionCriteria_managedObjectContext___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = (void *)a1[4];
  id v6 = [MEMORY[0x1E4F1C0A8] entityForName:a2 inManagedObjectContext:a1[5]];
  LOBYTE(a3) = [v5 anyUpdatedObjectsWithChangedRelationships:a3 ofEntity:v6];

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
}

- (PHFetchResultChangeDetails)changeDetailsForFetchResult:(PHFetchResult *)object
{
  id v3 = object;
  id v4 = v3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__13879;
  char v12 = __Block_byref_object_dispose__13880;
  id v13 = 0;
  if (v3)
  {
    id v7 = v3;
    pl_dispatch_sync();

    id v3 = (PHFetchResult *)v9[5];
  }
  if ([(PHFetchResult *)v3 hasDiffs]) {
    id v5 = (id)v9[5];
  }
  else {
    id v5 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return (PHFetchResultChangeDetails *)v5;
}

void __40__PHChange_changeDetailsForFetchResult___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    return;
  }
  id v19 = [*(id *)(a1 + 40) changeHandlingKey];
  if (v19)
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 96) objectForKey:v19];
    if (v5)
    {
      id v6 = (void *)v5;
      uint64_t v7 = *(void *)(a1 + 32);
      if (*(unsigned char *)(v7 + 104)) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = *(void **)(v7 + 64);
      }
      id v15 = v8;
      id v11 = v6;
      id v16 = [[PHFetchResultChangeDetails alloc] initWithFetchResult:*(void *)(a1 + 40) currentFetchResult:v11 sortedChangedIdentifiers:v15 unknownMergeEvent:*(unsigned __int8 *)(*(void *)(a1 + 32) + 104)];

      uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) calculateDiffs];
      [*(id *)(*(void *)(a1 + 32) + 80) setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:*(void *)(a1 + 40)];

      goto LABEL_10;
    }
  }
  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = [*(id *)(a1 + 40) query];
  LODWORD(v9) = [v9 _shouldCreateChangeDetailsWithCurrentFetchResultForQuery:v10];

  if (v9)
  {
    id v11 = [*(id *)(a1 + 40) fetchResultWithChangeHandlingValue:0];
    char v12 = [[PHFetchResultChangeDetails alloc] initWithFetchResult:*(void *)(a1 + 40) currentFetchResult:v11 sortedChangedIdentifiers:0 unknownMergeEvent:*(unsigned __int8 *)(*(void *)(a1 + 32) + 104)];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) calculateDiffs];
    [*(id *)(*(void *)(a1 + 32) + 80) setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:*(void *)(a1 + 40)];
LABEL_10:
  }
}

- (PHObjectChangeDetails)changeDetailsForObject:(PHObject *)object
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__13879;
  uint64_t v10 = __Block_byref_object_dispose__13880;
  id v11 = 0;
  uint64_t v5 = object;
  pl_dispatch_sync();
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);

  return (PHObjectChangeDetails *)v3;
}

void __35__PHChange_changeDetailsForObject___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectID];
  if (v2)
  {
    uint64_t v10 = v2;
    uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 72) objectForKey:v2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v2 = v10;
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      if (([*(id *)(*(void *)(a1 + 40) + 24) containsObject:v10] & 1) != 0
        || (char v6 = [*(id *)(*(void *)(a1 + 40) + 16) containsObject:v10], v2 = v10, (v6 & 1) != 0)
        || *(unsigned char *)(*(void *)(a1 + 40) + 104))
      {
        uint64_t v7 = [[PHObjectChangeDetails alloc] initWithPHObject:*(void *)(a1 + 32)];
        uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
        id v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = v7;

        [*(id *)(*(void *)(a1 + 40) + 72) setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:v10];
        uint64_t v2 = v10;
      }
    }
  }
}

- (BOOL)deferredProcessingNeededChangedForPHAssetOID:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  changedAttributesByOID = self->_changedAttributesByOID;
  id v5 = a3;
  char v6 = [(NSDictionary *)changedAttributesByOID objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 unsignedLongLongValue];

  uint64_t v8 = (void *)MEMORY[0x1E4F8AAF8];
  v15[0] = @"deferredProcessingNeeded";
  BOOL v9 = 1;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v11 = [v5 entity];

  char v12 = [v11 name];
  uint64_t v13 = [v8 indexValueForAttributeNames:v10 entity:v12];

  if ((v13 & v7) == 0) {
    return self->_unknownMergeEvent;
  }
  return v9;
}

- (BOOL)_changedRelationshipsContainChangeForRelationshipNames:(id)a3 objectID:(id)a4
{
  changedRelationshipsByOID = self->_changedRelationshipsByOID;
  id v7 = a4;
  id v8 = a3;
  BOOL v9 = [(NSDictionary *)changedRelationshipsByOID objectForKeyedSubscript:v7];
  uint64_t v10 = [v9 unsignedLongLongValue];

  id v11 = (void *)MEMORY[0x1E4F8AAF8];
  char v12 = [v7 entity];

  uint64_t v13 = [v12 name];
  uint64_t v14 = [v11 indexValueForRelationshipNames:v8 entity:v13];

  return (v14 & v10) != 0 || self->_unknownMergeEvent;
}

- (BOOL)customUserAssetsChangedForPHMemoryOID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = @"customUserAssets";
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  char v6 = [v4 arrayWithObjects:&v8 count:1];
  LOBYTE(self) = -[PHChange _changedRelationshipsContainChangeForRelationshipNames:objectID:](self, "_changedRelationshipsContainChangeForRelationshipNames:objectID:", v6, v5, v8, v9);

  return (char)self;
}

- (BOOL)userCuratedAssetsChangedForPHMemoryOID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = @"userCuratedAssets";
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  char v6 = [v4 arrayWithObjects:&v8 count:1];
  LOBYTE(self) = -[PHChange _changedRelationshipsContainChangeForRelationshipNames:objectID:](self, "_changedRelationshipsContainChangeForRelationshipNames:objectID:", v6, v5, v8, v9);

  return (char)self;
}

- (BOOL)keyAssetsChangedForPHAssetCollectionOID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = @"keyAssets";
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  char v6 = [v4 arrayWithObjects:&v8 count:1];
  LOBYTE(self) = -[PHChange _changedRelationshipsContainChangeForRelationshipNames:objectID:](self, "_changedRelationshipsContainChangeForRelationshipNames:objectID:", v6, v5, v8, v9);

  return (char)self;
}

- (BOOL)assetCloudLocalStateChangedForAsset:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectID];
  char v6 = [v4 cloudLocalStateProperties];

  id v7 = [v6 cloudMasterObjectID];

  if (v7)
  {
    id v8 = [(NSDictionary *)self->_changedAttributesByOID objectForKeyedSubscript:v5];
    uint64_t v23 = [v8 unsignedLongLongValue];

    uint64_t v9 = [(NSDictionary *)self->_changedAttributesByOID objectForKeyedSubscript:v7];
    uint64_t v22 = [v9 unsignedLongLongValue];

    uint64_t v10 = (void *)MEMORY[0x1E4F8AAF8];
    v25[0] = @"cloudLocalState";
    BOOL unknownMergeEvent = 1;
    char v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    uint64_t v13 = [v5 entity];
    uint64_t v14 = [v13 name];
    uint64_t v15 = [v10 indexValueForAttributeNames:v12 entity:v14];

    id v16 = (void *)MEMORY[0x1E4F8AAF8];
    uint64_t v24 = @"cloudLocalState";
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    uint64_t v18 = [v7 entity];
    id v19 = [v18 name];
    uint64_t v20 = [v16 indexValueForAttributeNames:v17 entity:v19];

    if (!(v15 & v23 | v20 & v22)) {
      BOOL unknownMergeEvent = self->_unknownMergeEvent;
    }
  }
  else
  {
    BOOL unknownMergeEvent = 0;
  }

  return unknownMergeEvent;
}

- (BOOL)packedBadgeAttributesChangedForPHAssetOID:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  changedAttributesByOID = self->_changedAttributesByOID;
  id v5 = a3;
  char v6 = [(NSDictionary *)changedAttributesByOID objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 unsignedLongLongValue];

  id v8 = (void *)MEMORY[0x1E4F8AAF8];
  v15[0] = @"packedBadgeAttributes";
  BOOL v9 = 1;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v11 = [v5 entity];

  char v12 = [v11 name];
  uint64_t v13 = [v8 indexValueForAttributeNames:v10 entity:v12];

  if ((v13 & v7) == 0) {
    return self->_unknownMergeEvent;
  }
  return v9;
}

- (BOOL)favoriteStateChangedForPHAssetOID:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  changedAttributesByOID = self->_changedAttributesByOID;
  id v5 = a3;
  char v6 = [(NSDictionary *)changedAttributesByOID objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 unsignedLongLongValue];

  id v8 = (void *)MEMORY[0x1E4F8AAF8];
  v15[0] = @"favorite";
  BOOL v9 = 1;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v11 = [v5 entity];

  char v12 = [v11 name];
  uint64_t v13 = [v8 indexValueForAttributeNames:v10 entity:v12];

  if ((v13 & v7) == 0) {
    return self->_unknownMergeEvent;
  }
  return v9;
}

- (BOOL)hiddenStateChangedForPHAssetOID:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  changedAttributesByOID = self->_changedAttributesByOID;
  id v5 = a3;
  char v6 = [(NSDictionary *)changedAttributesByOID objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 unsignedLongLongValue];

  id v8 = (void *)MEMORY[0x1E4F8AAF8];
  v15[0] = @"hidden";
  BOOL v9 = 1;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v11 = [v5 entity];

  char v12 = [v11 name];
  uint64_t v13 = [v8 indexValueForAttributeNames:v10 entity:v12];

  if ((v13 & v7) == 0) {
    return self->_unknownMergeEvent;
  }
  return v9;
}

- (BOOL)trashedStateChangedForObjectID:(id)a3
{
  changedAttributesByOID = self->_changedAttributesByOID;
  id v5 = a3;
  char v6 = [(NSDictionary *)changedAttributesByOID objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 unsignedLongLongValue];

  id v8 = (void *)MEMORY[0x1E4F8AAF8];
  BOOL v9 = [v5 entity];

  uint64_t v10 = [v9 name];
  uint64_t v11 = [v8 indexValueForAttributeNames:&unk_1EEB269A0 entity:v10];

  return (v11 & v7) != 0 || self->_unknownMergeEvent;
}

- (BOOL)contentOrThumbnailChangedForAsset:(id)a3
{
  id v4 = [a3 objectID];
  LOBYTE(self) = [(PHChange *)self contentOrThumbnailChangedForPHAssetOID:v4];

  return (char)self;
}

- (BOOL)contentOrThumbnailChangedForPHAssetOID:(id)a3
{
  id v4 = a3;
  if (!self->_unknownMergeEvent)
  {
    char v6 = [(NSDictionary *)self->_changedAttributesByOID objectForKeyedSubscript:v4];
    uint64_t v5 = [v6 unsignedLongLongValue];

    if (!v5) {
      goto LABEL_12;
    }
    if (contentOrThumbnailChangedForPHAssetOID__onceToken != -1) {
      dispatch_once(&contentOrThumbnailChangedForPHAssetOID__onceToken, &__block_literal_global_13946);
    }
    uint64_t v7 = [v4 entity];
    id v8 = [v7 name];

    BOOL v9 = [MEMORY[0x1E4F8A950] entityName];
    if ([v8 isEqualToString:v9])
    {
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F8A950] entityName];
      int v11 = [v8 isEqualToString:v10];

      if (!v11)
      {
        uint64_t v12 = [MEMORY[0x1E4F8AAF8] indexValueForAttributeNames:contentOrThumbnailChangedForPHAssetOID__genericAssetAttributeNames entity:v8];
        goto LABEL_11;
      }
    }
    uint64_t v12 = contentOrThumbnailChangedForPHAssetOID__genericAssetContentAttributes;
LABEL_11:
    LOBYTE(v5) = (v12 & v5) != 0;

    goto LABEL_12;
  }
  LOBYTE(v5) = 1;
LABEL_12:

  return v5;
}

void __51__PHChange_contentOrThumbnailChangedForPHAssetOID___block_invoke()
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v5[0] = @"adjustmentTimestamp";
  v5[1] = @"thumbnailIndex";
  v5[2] = @"avalanchePickType";
  v5[3] = @"deferredProcessingNeeded";
  v5[4] = @"videoKeyFrameValue";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:5];
  v1 = (void *)contentOrThumbnailChangedForPHAssetOID__genericAssetAttributeNames;
  contentOrThumbnailChangedForPHAssetOID__genericAssetAttributeNames = v0;

  uint64_t v2 = (void *)MEMORY[0x1E4F8AAF8];
  uint64_t v3 = contentOrThumbnailChangedForPHAssetOID__genericAssetAttributeNames;
  id v4 = [MEMORY[0x1E4F8A950] entityName];
  contentOrThumbnailChangedForPHAssetOID__genericAssetContentAttributes = [v2 indexValueForAttributeNames:v3 entity:v4];
}

- (BOOL)keyFaceChangedForPersonOID:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  changedRelationshipsByOID = self->_changedRelationshipsByOID;
  id v5 = a3;
  char v6 = [(NSDictionary *)changedRelationshipsByOID objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 unsignedLongLongValue];

  id v8 = (void *)MEMORY[0x1E4F8AAF8];
  v15[0] = @"keyFace";
  BOOL v9 = 1;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  int v11 = [v5 entity];

  uint64_t v12 = [v11 name];
  uint64_t v13 = [v8 indexValueForRelationshipNames:v10 entity:v12];

  if ((v13 & v7) == 0) {
    return self->_unknownMergeEvent;
  }
  return v9;
}

- (id)_preloadChangeDetailsWithClearCacheForFetchResults:(id)a3 inManagedObjectContext:(id)a4
{
  id v4 = a3;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  id v8 = v4;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  pl_dispatch_sync();
  id v6 = v9;

  return v6;
}

void __86__PHChange__preloadChangeDetailsWithClearCacheForFetchResults_inManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 80), "objectForKey:", v7, (void)v13);
        id v8 = (PHFetchResultChangeDetails *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          id v9 = (void *)[v7 copyWithOptions:&unk_1EEB26F98];
          uint64_t v10 = *(void *)(a1 + 40);
          if (*(unsigned char *)(v10 + 104)) {
            int v11 = 0;
          }
          else {
            int v11 = *(void **)(v10 + 64);
          }
          id v12 = v11;
          id v8 = [[PHFetchResultChangeDetails alloc] initWithFetchResult:v7 currentFetchResult:v9 sortedChangedIdentifiers:v12 unknownMergeEvent:*(unsigned __int8 *)(*(void *)(a1 + 40) + 104)];
          [*(id *)(*(void *)(a1 + 40) + 80) setObject:v8 forKey:v7];
          [*(id *)(a1 + 48) addObject:v8];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

- (id)_preloadChangeDetailsWithRefetchForFetchResults:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v43 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        long long v15 = [v14 query];
        long long v16 = [v15 combinedQueryGroupKey];

        if (v16)
        {
          uint64_t v17 = [v8 objectForKeyedSubscript:v16];
          if (!v17)
          {
            uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
            [v8 setObject:v17 forKeyedSubscript:v16];
          }
          [v17 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v11);
  }

  uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __83__PHChange__preloadChangeDetailsWithRefetchForFetchResults_inManagedObjectContext___block_invoke;
  v39[3] = &unk_1E5843FD8;
  id v32 = v7;
  id v40 = v32;
  id v31 = v18;
  id v41 = v31;
  [v8 enumerateKeysAndObjectsUsingBlock:v39];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v19 = v9;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v46 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v36 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        id v25 = [v24 changeHandlingKey];
        if (v25)
        {
          char v26 = [(NSMapTable *)self->_changeHandlingMap objectForKey:v25];
          if (!v26)
          {
            char v27 = [v31 objectForKeyedSubscript:v24];
            char v26 = [v24 changeHandlingValueUsingSeedOids:v27 withChange:self usingManagedObjectContext:v32];
            [(NSMapTable *)self->_changeHandlingMap setObject:v26 forKey:v25];
          }
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v35 objects:v46 count:16];
    }
    while (v21);
  }

  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count"));
  long long v33 = v19;
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  id v28 = v19;
  pl_dispatch_sync();
  id v29 = v34;

  return v29;
}

uint64_t __83__PHChange__preloadChangeDetailsWithRefetchForFetchResults_inManagedObjectContext___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ((unint64_t)[v8 count] >= 2)
  {
    id v6 = +[PHFetchResult fetchObjectIDsForCombinableFetchResults:v8 inManagedObjectContext:*(void *)(a1 + 32)];
    if (v6) {
      [*(id *)(a1 + 40) addEntriesFromDictionary:v6];
    }
    else {
      *a4 = 1;
    }
  }

  return MEMORY[0x1F4181820]();
}

void __83__PHChange__preloadChangeDetailsWithRefetchForFetchResults_inManagedObjectContext___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v7 = [*(id *)(*(void *)(a1 + 40) + 80) objectForKey:v6];
        if (!v7)
        {
          id v8 = [v6 changeHandlingKey];
          if (v8)
          {
            id v9 = [*(id *)(*(void *)(a1 + 40) + 96) objectForKey:v8];
          }
          else
          {
            id v9 = 0;
          }
          uint64_t v10 = *(void *)(a1 + 40);
          if (*(unsigned char *)(v10 + 104)) {
            uint64_t v11 = 0;
          }
          else {
            uint64_t v11 = *(void **)(v10 + 64);
          }
          id v12 = v11;
          id v13 = v9;
          id v7 = [[PHFetchResultChangeDetails alloc] initWithFetchResult:v6 currentFetchResult:v13 sortedChangedIdentifiers:v12 unknownMergeEvent:*(unsigned __int8 *)(*(void *)(a1 + 40) + 104)];

          [*(id *)(*(void *)(a1 + 40) + 80) setObject:v7 forKey:v6];
          [*(id *)(a1 + 48) addObject:v7];
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
}

- (void)_propagatePropertyNamesToSubentityNames:(id)a3 moc:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v22 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v5;
  id obj = [v5 allKeys];
  uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * v10);
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        id v26 = 0;
        id v13 = PLSafeEntityForNameInManagedObjectContext();
        id v14 = v26;
        long long v15 = v14;
        if (v13) {
          BOOL v16 = v14 == 0;
        }
        else {
          BOOL v16 = 0;
        }
        if (!v16)
        {
          long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
          [v18 handleFailureInMethod:a2, self, @"PHChange.m", 448, @"Error fetching entityName:%@, moc:%@ error:%@", v11, v22, v15 object file lineNumber description];
        }
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __56__PHChange__propagatePropertyNamesToSubentityNames_moc___block_invoke;
        v23[3] = &unk_1E5843FB0;
        id v24 = v6;
        id v25 = v12;
        id v17 = v12;
        objc_msgSend(v13, "ph_enumerateSelfAndSubentities:", v23);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }
}

void __56__PHChange__propagatePropertyNamesToSubentityNames_moc___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v15 = v3;
  id v5 = [v3 name];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    [*(id *)(a1 + 40) unionSet:v6];
  }
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v15 name];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  uint64_t v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  id v12 = v11;

  [v12 unionSet:*(void *)(a1 + 40)];
  id v13 = *(void **)(a1 + 32);
  id v14 = [v15 name];
  [v13 setObject:v12 forKeyedSubscript:v14];
}

- (id)_deletedObjectIDsMatchingEntities:(id)a3
{
  uint64_t v4 = [(PHChange *)self _entityNamesForEntities:a3];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([v4 count])
  {
    id v6 = [(PHChange *)self deletedObjectIDs];
    _addOIDsWithEntityNames(v5, v6, v4);
  }

  return v5;
}

- (id)_insertedOrUpdatedObjectIDsMatchingEntities:(id)a3
{
  uint64_t v4 = [(PHChange *)self _entityNamesForEntities:a3];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([v4 count])
  {
    id v6 = [(PHChange *)self insertedObjectIDs];
    _addOIDsWithEntityNames(v5, v6, v4);

    uint64_t v7 = [(PHChange *)self updatedObjectIDs];
    _addOIDsWithEntityNames(v5, v7, v4);
  }

  return v5;
}

- (id)_entityNamesForEntities:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
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
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __36__PHChange__entityNamesForEntities___block_invoke;
        v12[3] = &unk_1E5843F88;
        id v13 = v4;
        objc_msgSend(v10, "ph_enumerateSelfAndSubentities:", v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

void __36__PHChange__entityNamesForEntities___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  [v2 addObject:v3];
}

- (void)preloadChangeDetailsForFetchResults:(id)a3 inManagedObjectContext:(id)a4 handler:(id)a5
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v68 = a3;
  id v74 = a4;
  v67 = (void (**)(id, PHChange *))a5;
  context = (void *)MEMORY[0x19F389B10]();
  PLChangeHandlingGetLog();
  uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  uint64_t v9 = v7;
  uint64_t v10 = v9;
  os_signpost_id_t spid = v8;
  unint64_t v65 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 134217984;
    v100 = (PHChange *)[v68 count];
    _os_signpost_emit_with_name_impl(&dword_19B043000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PreloadChangeDetails", "fetch results: %tu", buf, 0xCu);
  }
  v66 = v10;

  v76 = [MEMORY[0x1E4F1CA80] set];
  v72 = [MEMORY[0x1E4F1CA80] set];
  id v11 = self;
  if (self->_unknownMergeEvent)
  {
    [v76 unionSet:v68];
    goto LABEL_56;
  }
  int v73 = PLIsPhotosAppAnyPlatform();
  int v77 = MEMORY[0x19F388C70]();
  v69 = [MEMORY[0x1E4F1CA80] set];
  id v70 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v71 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id obj = v68;
  uint64_t v12 = [obj countByEnumeratingWithState:&v93 objects:v107 count:16];
  if (v12)
  {
    uint64_t v79 = *(void *)v94;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v94 != v79) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v93 + 1) + 8 * v13);
        long long v15 = (void *)MEMORY[0x19F389B10]();
        uint64_t v16 = [v14 possibleChangesForChange:self propertiesFetchResult:0];
        if (v16)
        {
          if (v16 != 8
            || ([v14 fetchedObjectIDs],
                long long v17 = objc_claimAutoreleasedReturnValue(),
                BOOL v18 = [v17 count] == 0,
                v17,
                v18))
          {
            uint64_t v19 = [v14 query];
            uint64_t v20 = [v19 fetchRequest];
            uint64_t v21 = [v20 entity];

            id v22 = [v21 name];
            uint64_t v23 = [v19 filteringKeys];
            id v24 = v23;
            int v25 = v77;
            if (v73) {
              int v25 = [v23 containsObject:@"activeLibraryScopeParticipationState"] | v77;
            }
            if (v74
              && v24
              && v25
              && ([MEMORY[0x1E4F8AAF8] includesToManyRelationship:v24 entity:v22] & 1) == 0
              && ![v19 requiresFullRefetchForChange:self])
            {
              id v26 = [v21 name];
              id v27 = [v71 objectForKeyedSubscript:v26];

              if (!v27)
              {
                id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                long long v28 = [v21 name];
                [v71 setObject:v27 forKeyedSubscript:v28];
              }
              [v27 unionSet:v24];
              [v69 addObject:v14];
              [v70 addObject:v21];
            }
            else
            {
              [v76 addObject:v14];
            }
          }
          else
          {
            [v72 addObject:v14];
          }
        }
        ++v13;
      }
      while (v12 != v13);
      uint64_t v29 = [obj countByEnumeratingWithState:&v93 objects:v107 count:16];
      uint64_t v12 = v29;
    }
    while (v29);
  }

  long long v30 = [(PHChange *)self _insertedOrUpdatedObjectIDsMatchingEntities:v70];
  v78 = [(PHChange *)self _deletedObjectIDsMatchingEntities:v70];
  v80 = v30;
  if ((unint64_t)[v30 count] >= 0x7D1)
  {
    id v31 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      uint64_t v32 = [v30 count];
      *(_DWORD *)buf = 134218754;
      v100 = self;
      __int16 v101 = 2048;
      uint64_t v102 = v32;
      __int16 v103 = 2048;
      uint64_t v104 = 2000;
      __int16 v105 = 2112;
      v106 = v30;
      _os_log_impl(&dword_19B043000, v31, OS_LOG_TYPE_INFO, "PHChange:%p: preloadChangeDetails too many objects for second pass: %lu > %ld, refetching. objects:%@", buf, 0x2Au);
    }

    [v76 unionSet:v69];
    goto LABEL_55;
  }
  if ([v30 count] || objc_msgSend(v78, "count"))
  {
    [(PHChange *)self _propagatePropertyNamesToSubentityNames:v71 moc:v74];
    long long v33 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      id v34 = objc_msgSend(v71, "_pl_prettyDescription");
      *(_DWORD *)buf = 134218242;
      v100 = self;
      __int16 v101 = 2112;
      uint64_t v102 = (uint64_t)v34;
      _os_log_impl(&dword_19B043000, v33, OS_LOG_TYPE_DEBUG, "PHChange:%p: preloadChangeDetails propertiesToFetchByEntityName:%@", buf, 0x16u);
    }
    long long v35 = [v80 allObjects];
    long long v36 = [(PHChange *)self library];
    long long v37 = +[PHPropertyFetchingHelper fetchPropertiesForObjectIDs:v35 propertyNamesByEntityName:v71 photoLibrary:v36];

    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v38 = v69;
    long long v39 = 0;
    uint64_t v40 = [v38 countByEnumeratingWithState:&v89 objects:v98 count:16];
    if (!v40)
    {
LABEL_52:

      uint64_t v48 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        uint64_t v49 = [v76 count];
        uint64_t v50 = [v72 count];
        *(_DWORD *)buf = 134218752;
        v100 = self;
        __int16 v101 = 2048;
        uint64_t v102 = v49;
        __int16 v103 = 2048;
        uint64_t v104 = v50;
        __int16 v105 = 2048;
        v106 = v39;
        _os_log_impl(&dword_19B043000, v48, OS_LOG_TYPE_INFO, "PHChange:%p: preloadChangeDetails refetch:%lu clearCache:%lu avoidedRefetch:%lu", buf, 0x2Au);
      }

      goto LABEL_55;
    }
    uint64_t v41 = *(void *)v90;
LABEL_40:
    uint64_t v42 = 0;
    while (1)
    {
      if (*(void *)v90 != v41) {
        objc_enumerationMutation(v38);
      }
      long long v43 = *(void **)(*((void *)&v89 + 1) + 8 * v42);
      long long v44 = (void *)MEMORY[0x19F389B10]();
      uint64_t v45 = [v43 possibleChangesForChange:self propertiesFetchResult:v37];
      if (v45 == 8)
      {
        id v46 = [v43 fetchedObjectIDs];
        BOOL v47 = [v46 count] == 0;

        if (v47)
        {
LABEL_49:
          [v76 addObject:v43];
          goto LABEL_50;
        }
        [v72 addObject:v43];
      }
      else if (v45)
      {
        goto LABEL_49;
      }
      ++v39;
LABEL_50:
      if (v40 == ++v42)
      {
        uint64_t v40 = [v38 countByEnumeratingWithState:&v89 objects:v98 count:16];
        if (!v40) {
          goto LABEL_52;
        }
        goto LABEL_40;
      }
    }
  }
LABEL_55:

  id v11 = self;
LABEL_56:
  uint64_t v51 = [v76 copy];
  refetchedFetchResults = v11->_refetchedFetchResults;
  v11->_refetchedFetchResults = (NSSet *)v51;

  uint64_t v53 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v72, "count") + objc_msgSend(v76, "count"));
  v54 = [(PHChange *)self _preloadChangeDetailsWithRefetchForFetchResults:v76 inManagedObjectContext:v74];
  [v53 addObjectsFromArray:v54];

  uint64_t v55 = [(PHChange *)self _preloadChangeDetailsWithClearCacheForFetchResults:v72 inManagedObjectContext:v74];
  [v53 addObjectsFromArray:v55];

  uint64_t v87 = 0;
  uint64_t v88 = 0;
  v86 = 0;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v56 = v53;
  uint64_t v57 = [v56 countByEnumeratingWithState:&v82 objects:v97 count:16];
  if (v57)
  {
    uint64_t v58 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v57; ++i)
      {
        if (*(void *)v83 != v58) {
          objc_enumerationMutation(v56);
        }
        [*(id *)(*((void *)&v82 + 1) + 8 * i) calculateDiffsAndAccumulateInsertedCount:&v88 updatedCount:&v87 deletedCount:&v86];
      }
      uint64_t v57 = [v56 countByEnumeratingWithState:&v82 objects:v97 count:16];
    }
    while (v57);
  }

  v60 = v66;
  uint64_t v61 = v60;
  if (v65 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v60))
  {
    uint64_t v62 = [v56 count];
    *(_DWORD *)buf = 134218752;
    v100 = (PHChange *)v62;
    __int16 v101 = 2048;
    uint64_t v102 = v88;
    __int16 v103 = 2048;
    uint64_t v104 = v87;
    __int16 v105 = 2048;
    v106 = v86;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v61, OS_SIGNPOST_INTERVAL_END, spid, "PreloadChangeDetails", "change details: %tu, inserted: %tu, updated: %tu, deleted: %tu", buf, 0x2Au);
  }

  v67[2](v67, self);
}

- (void)preloadSimulatedChangeDetailsForManualFetchResults:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __71__PHChange_preloadSimulatedChangeDetailsForManualFetchResults_handler___block_invoke;
  uint64_t v20 = &unk_1E5848EC0;
  id v21 = v6;
  id v22 = self;
  id v23 = v8;
  id v9 = v6;
  pl_dispatch_sync();
  uint64_t v10 = +[PHChange handlerQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__PHChange_preloadSimulatedChangeDetailsForManualFetchResults_handler___block_invoke_3;
  v13[3] = &unk_1E58487E0;
  long long v15 = self;
  id v16 = v7;
  id v14 = v23;
  id v11 = v7;
  id v12 = v23;
  dispatch_async(v10, v13);
}

void __71__PHChange_preloadSimulatedChangeDetailsForManualFetchResults_handler___block_invoke(void *a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__PHChange_preloadSimulatedChangeDetailsForManualFetchResults_handler___block_invoke_2;
  v3[3] = &unk_1E5843F60;
  v1 = (void *)a1[4];
  uint64_t v2 = (void *)a1[6];
  v3[4] = a1[5];
  id v4 = v2;
  [v1 enumerateObjectsUsingBlock:v3];
}

uint64_t __71__PHChange_preloadSimulatedChangeDetailsForManualFetchResults_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "calculateDiffs", (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __71__PHChange_preloadSimulatedChangeDetailsForManualFetchResults_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "objectForKey:");
  uint64_t v3 = (PHFetchResultChangeDetails *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    uint64_t v3 = [[PHFetchResultChangeDetails alloc] initWithManualFetchResultAfterChanges:v4];
    [*(id *)(*(void *)(a1 + 32) + 80) setObject:v3 forKey:v4];
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (BOOL)anyUpdatedObjectsWithChangedRelationships:(unint64_t)a3 ofEntity:(id)a4
{
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  [(PHChange *)v7 _prepareCachedValuesForEntity:v6];
  updatedObjectsChangedRelationshipsByEntityName = v7->_updatedObjectsChangedRelationshipsByEntityName;
  long long v9 = [v6 name];
  long long v10 = [(NSMutableDictionary *)updatedObjectsChangedRelationshipsByEntityName objectForKeyedSubscript:v9];
  uint64_t v11 = [v10 unsignedLongLongValue];

  objc_sync_exit(v7);
  return (v11 & a3) != 0;
}

- (BOOL)anyUpdatedObjectsWithChangedAttributes:(unint64_t)a3 ofEntity:(id)a4
{
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  [(PHChange *)v7 _prepareCachedValuesForEntity:v6];
  updatedObjectsChangedAttributesByEntityName = v7->_updatedObjectsChangedAttributesByEntityName;
  long long v9 = [v6 name];
  long long v10 = [(NSMutableDictionary *)updatedObjectsChangedAttributesByEntityName objectForKeyedSubscript:v9];
  uint64_t v11 = [v10 unsignedLongLongValue];

  objc_sync_exit(v7);
  return (v11 & a3) != 0;
}

- (void)_prepareCachedValuesForEntity:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 name];
  id v6 = [(NSMutableDictionary *)self->_updatedObjectsChangedAttributesByEntityName objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v22 = v5;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = self->_changedObjectIDs;
    uint64_t v7 = [(NSSet *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v14 = objc_msgSend(v13, "entity", v22);
          int v15 = [v14 isKindOfEntity:v4];

          if (v15)
          {
            id v16 = [(NSDictionary *)self->_changedAttributesByOID objectForKeyedSubscript:v13];
            uint64_t v17 = [v16 unsignedLongLongValue];

            v10 |= v17;
            uint64_t v18 = [(NSDictionary *)self->_changedRelationshipsByOID objectForKeyedSubscript:v13];
            uint64_t v19 = [v18 unsignedLongLongValue];

            v9 |= v19;
          }
        }
        uint64_t v8 = [(NSSet *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }

    uint64_t v20 = [NSNumber numberWithUnsignedLongLong:v10];
    uint64_t v5 = v22;
    [(NSMutableDictionary *)self->_updatedObjectsChangedAttributesByEntityName setObject:v20 forKeyedSubscript:v22];

    id v21 = [NSNumber numberWithUnsignedLongLong:v9];
    [(NSMutableDictionary *)self->_updatedObjectsChangedRelationshipsByEntityName setObject:v21 forKeyedSubscript:v22];
  }
}

- (BOOL)wasFetchResultRefetched:(id)a3
{
  return [(NSSet *)self->_refetchedFetchResults containsObject:a3];
}

- (BOOL)hasCloudStatusChanges
{
  return self->_cloudStatus != 0;
}

- (PHPhotoLibraryCloudStatus)cloudStatus
{
  uint64_t v3 = self->_cloudStatus;
  if (!v3)
  {
    uint64_t v3 = [(PHPhotoLibrary *)self->_library cloudStatus];
  }

  return v3;
}

- (unint64_t)totalChangeCount
{
  uint64_t v3 = [(PHChange *)self insertedObjectIDs];
  uint64_t v4 = [v3 count];

  uint64_t v5 = [(PHChange *)self updatedObjectIDs];
  uint64_t v6 = [v5 count];

  uint64_t v7 = [(PHChange *)self deletedObjectIDs];
  uint64_t v8 = [v7 count];

  return v6 + v4 + v8;
}

- (id)changedRelationshipsByOID
{
  return self->_changedRelationshipsByOID;
}

- (id)changedAttributesByOID
{
  return self->_changedAttributesByOID;
}

- (id)deletedObjectIDs
{
  return self->_deletedObjectIDs;
}

- (id)updatedObjectIDs
{
  return self->_changedObjectIDs;
}

- (id)insertedObjectIDs
{
  return self->_insertedObjectIDs;
}

- (BOOL)hasIncrementalChanges
{
  return !self->_unknownMergeEvent;
}

- (PHChange)initWithInsertedObjectIDs:(id)a3 updatedObjectIDs:(id)a4 deletedObjectIDs:(id)a5 deletedUuidsByObjectId:(id)a6 deletedPrimaryLabelCodesByOID:(id)a7 changedAttributesByOID:(id)a8 changedRelationshipsByOID:(id)a9 unknownMergeEvent:(BOOL)a10 changeToken:(id)a11 fetchOptions:(id)a12 library:(id)a13 managedObjectContext:(id)a14 enumerationContext:(id)a15
{
  id v47 = a3;
  id v41 = a4;
  id v46 = a4;
  id v45 = a5;
  id v48 = a6;
  id v49 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a11;
  id v44 = a12;
  id v43 = a13;
  id v23 = a14;
  id v24 = a15;
  long long v25 = [(PHChange *)self init];
  long long v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_insertedObjectIDs, a3);
    objc_storeStrong((id *)&v26->_changedObjectIDs, v41);
    objc_storeStrong((id *)&v26->_deletedObjectIDs, a5);
    uint64_t v27 = [v48 copy];
    deletedUuidsByObjectId = v26->_deletedUuidsByObjectId;
    v26->_deletedUuidsByObjectId = (NSDictionary *)v27;

    uint64_t v29 = [v49 copy];
    deletedPrimaryLabelCodesByObjectId = v26->_deletedPrimaryLabelCodesByObjectId;
    v26->_deletedPrimaryLabelCodesByObjectId = (NSDictionary *)v29;

    objc_storeStrong((id *)&v26->_changedAttributesByOID, a8);
    objc_storeStrong((id *)&v26->_changedRelationshipsByOID, a9);
    v26->_BOOL unknownMergeEvent = a10;
    objc_storeStrong((id *)&v26->_changeToken, a11);
    objc_storeStrong((id *)&v26->_fetchOptions, a12);
    objc_storeStrong((id *)&v26->_context, a14);
    objc_storeStrong((id *)&v26->_enumerationContext, a15);
    objc_storeStrong((id *)&v26->_library, a13);
    id v31 = objc_alloc(MEMORY[0x1E4F8AC08]);
    uint64_t v32 = [(NSSet *)v26->_changedObjectIDs allObjects];
    uint64_t v33 = [v31 initWithChangedObjects:v32];
    sortedChangedObjectIDs = v26->_sortedChangedObjectIDs;
    v26->_sortedChangedObjectIDs = (PLSortedChangedObjects *)v33;

    uint64_t v35 = [MEMORY[0x1E4F1CA60] dictionary];
    updatedObjectsChangedAttributesByEntityName = v26->_updatedObjectsChangedAttributesByEntityName;
    v26->_updatedObjectsChangedAttributesByEntityName = (NSMutableDictionary *)v35;

    uint64_t v37 = [MEMORY[0x1E4F1CA60] dictionary];
    updatedObjectsChangedRelationshipsByEntityName = v26->_updatedObjectsChangedRelationshipsByEntityName;
    v26->_updatedObjectsChangedRelationshipsByEntityName = (NSMutableDictionary *)v37;
  }
  return v26;
}

- (PHChange)initWithChangedIdentifiers:(id)a3 unknownMergeEvent:(BOOL)a4 changeToken:(id)a5 library:(id)a6
{
  uint64_t v10 = *MEMORY[0x1E4F1BDF0];
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [v13 objectForKeyedSubscript:v10];
  int v15 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F1BFA0]];
  id v16 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F1BDB8]];
  uint64_t v17 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F8B7A0]];
  uint64_t v18 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F8B7A8]];

  LOBYTE(v21) = a4;
  uint64_t v19 = [(PHChange *)self initWithInsertedObjectIDs:v14 updatedObjectIDs:v15 deletedObjectIDs:v16 deletedUuidsByObjectId:0 deletedPrimaryLabelCodesByOID:0 changedAttributesByOID:v17 changedRelationshipsByOID:v18 unknownMergeEvent:v21 changeToken:v12 fetchOptions:0 library:v11 managedObjectContext:0 enumerationContext:0];

  return v19;
}

- (PHChange)initWithCloudStatus:(id)a3 library:(id)a4
{
  id v7 = a3;
  uint64_t v8 = [(PHChange *)self initWithChangedIdentifiers:MEMORY[0x1E4F1CC08] unknownMergeEvent:0 changeToken:0 library:a4];
  uint64_t v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_cloudStatus, a3);
  }

  return v9;
}

- (PHChange)initWithChangedIdentifiers:(id)a3 unknownMergeEvent:(BOOL)a4 library:(id)a5
{
  return [(PHChange *)self initWithChangedIdentifiers:a3 unknownMergeEvent:a4 changeToken:0 library:a5];
}

- (PHChange)init
{
  v14.receiver = self;
  v14.super_class = (Class)PHChange;
  id v2 = [(PHChange *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    changeHandlingMap = v2->_changeHandlingMap;
    v2->_changeHandlingMap = (NSMapTable *)v3;

    uint64_t v5 = objc_opt_new();
    changeDetailsForObjects = v2->_changeDetailsForObjects;
    v2->_changeDetailsForObjects = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    collectionChangeDetailsForObjects = v2->_collectionChangeDetailsForObjects;
    v2->_collectionChangeDetailsForObjects = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    objectIDsByLocalIdentifier = v2->_objectIDsByLocalIdentifier;
    v2->_objectIDsByLocalIdentifier = (NSMutableDictionary *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("PHChange", 0);
    changeDetailIsolation = v2->_changeDetailIsolation;
    v2->_changeDetailIsolation = (OS_dispatch_queue *)v11;
  }
  return v2;
}

+ (id)mergePersistedChanges:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == 1)
    {
      uint64_t v4 = [v3 firstObject];
    }
    else
    {
      uint64_t v58 = [MEMORY[0x1E4F1CA80] set];
      id v52 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v57 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
      id v56 = [MEMORY[0x1E4F1CA60] dictionary];
      v54 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v7 = [v3 lastObject];
      id v48 = [v7 changeToken];

      uint64_t v8 = [v3 lastObject];
      id v49 = [v8 context];

      uint64_t v9 = [v3 lastObject];
      id v46 = [v9 fetchOptions];

      uint64_t v10 = [v3 lastObject];
      id v45 = [v10 library];

      dispatch_queue_t v11 = [v3 lastObject];
      id v44 = [v11 enumerationContext];

      context = (void *)MEMORY[0x19F389B10]();
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v47 = v3;
      id obj = v3;
      uint64_t v12 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v64;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v64 != v14) {
              objc_enumerationMutation(obj);
            }
            id v16 = *(void **)(*((void *)&v63 + 1) + 8 * i);
            uint64_t v17 = (void *)MEMORY[0x19F389B10]();
            if (([v16 hasIncrementalChanges] & 1) == 0)
            {
              uint64_t v36 = [v16 changeToken];

              uint64_t v37 = [v16 context];

              id v38 = objc_alloc_init(MEMORY[0x1E4F1CA80]);

              id v28 = v38;
              id v39 = objc_alloc_init(MEMORY[0x1E4F1CA60]);

              id v40 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              char v53 = 1;
              id v48 = (void *)v36;
              uint64_t v35 = (void *)v37;
              id v34 = v40;
              id v56 = v39;
              uint64_t v57 = v28;
              long long v26 = v27;
              uint64_t v58 = v28;
              goto LABEL_22;
            }
            uint64_t v18 = [v16 insertedObjectIDs];
            [v58 unionSet:v18];

            uint64_t v19 = [v16 updatedObjectIDs];
            [v52 unionSet:v19];

            id v20 = [v16 deletedObjectIDs];
            [v57 unionSet:v20];

            uint64_t v21 = [v16 changedAttributesByOID];
            __34__PHChange_mergePersistedChanges___block_invoke(v21, v5);
            id v22 = [v16 changedRelationshipsByOID];
            __34__PHChange_mergePersistedChanges___block_invoke(v22, v6);
            id v23 = [v16 deletedUuidsByObjectId];
            [v56 addEntriesFromDictionary:v23];

            id v24 = [v16 deletedPrimaryLabelCodesByObjectId];
            [v54 addEntriesFromDictionary:v24];
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      uint64_t v25 = [v58 copy];
      [v58 minusSet:v57];
      [v52 minusSet:v57];
      [v52 minusSet:v58];
      id obja = (id)v25;
      [v57 minusSet:v25];
      long long v26 = [MEMORY[0x1E4F1CA60] dictionary];
      id v27 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v28 = v52;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v59 objects:v67 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v60;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v60 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void **)(*((void *)&v59 + 1) + 8 * j);
            __34__PHChange_mergePersistedChanges___block_invoke_3(v33, v5, v26);
            __34__PHChange_mergePersistedChanges___block_invoke_3(v33, v6, v27);
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v59 objects:v67 count:16];
        }
        while (v30);
      }

      char v53 = 0;
      id v34 = v54;
      uint64_t v35 = v49;
LABEL_22:
      uint64_t v55 = v34;
      LOBYTE(v42) = v53;
      uint64_t v4 = [[PHChange alloc] initWithInsertedObjectIDs:v58 updatedObjectIDs:v28 deletedObjectIDs:v57 deletedUuidsByObjectId:v56 deletedPrimaryLabelCodesByOID:v34 changedAttributesByOID:v26 changedRelationshipsByOID:v27 unknownMergeEvent:v42 changeToken:v48 fetchOptions:v46 library:v45 managedObjectContext:v35 enumerationContext:v44];

      id v3 = v47;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __34__PHChange_mergePersistedChanges___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__PHChange_mergePersistedChanges___block_invoke_2;
  v5[3] = &unk_1E58440E8;
  id v6 = v3;
  id v4 = v3;
  [a1 enumerateKeysAndObjectsUsingBlock:v5];
}

void __34__PHChange_mergePersistedChanges___block_invoke_3(void *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a3;
  uint64_t v7 = [a2 objectForKeyedSubscript:v5];
  uint64_t v8 = v7;
  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v8);
          }
          v11 |= [*(id *)(*((void *)&v15 + 1) + 8 * i) unsignedLongLongValue];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t v14 = [NSNumber numberWithUnsignedLongLong:v11];
    [v6 setObject:v14 forKeyedSubscript:v5];
  }
}

void __34__PHChange_mergePersistedChanges___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
  }
  [v6 addObject:v5];
}

+ (id)handlerQueue
{
  if (handlerQueue_onceToken != -1) {
    dispatch_once(&handlerQueue_onceToken, &__block_literal_global_184);
  }
  id v2 = (void *)handlerQueue_handlerQueue;

  return v2;
}

void __24__PHChange_handlerQueue__block_invoke()
{
  attr = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  if (PLIsForegroundApplication()) {
    dispatch_qos_class_t v0 = QOS_CLASS_USER_INITIATED;
  }
  else {
    dispatch_qos_class_t v0 = QOS_CLASS_UTILITY;
  }
  v1 = dispatch_queue_attr_make_with_qos_class(attr, v0, 0);
  dispatch_queue_t v2 = dispatch_queue_create("PHChange-queue", v1);
  id v3 = (void *)handlerQueue_handlerQueue;
  handlerQueue_handlerQueue = (uint64_t)v2;
}

+ (BOOL)isPublicPHObjectChangeClass:(Class)a3
{
  id v4 = [a1 publicPHObjectChangeClasses];
  LOBYTE(a3) = [v4 containsObject:a3];

  return (char)a3;
}

+ (id)publicPHObjectChangeClasses
{
  pl_dispatch_once();
  dispatch_queue_t v2 = (void *)publicPHObjectChangeClasses_pl_once_object_29;

  return v2;
}

void __39__PHChange_publicPHObjectChangeClasses__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C978]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v0, "initWithObjects:", v1, v2, objc_opt_class(), 0);
  id v4 = (void *)publicPHObjectChangeClasses_pl_once_object_29;
  publicPHObjectChangeClasses_pl_once_object_29 = v3;
}

- (BOOL)membersOrAssetContainmentForSocialGroupChangedWithLocalIdentifier:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(NSMutableDictionary *)self->_objectIDsByLocalIdentifier objectForKeyedSubscript:a3];
  id v5 = [v4 entity];
  id v6 = [v5 name];

  id v7 = [(NSDictionary *)self->_changedAttributesByOID objectForKeyedSubscript:v4];
  uint64_t v8 = [v7 unsignedLongLongValue];

  uint64_t v9 = (void *)MEMORY[0x1E4F8AAF8];
  v18[0] = @"changeFlag2";
  BOOL unknownMergeEvent = 1;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  uint64_t v12 = [v9 indexValueForAttributeNames:v11 entity:v6];

  uint64_t v13 = (void *)MEMORY[0x1E4F8AAF8];
  long long v17 = @"changeFlag4";
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  uint64_t v15 = [v13 indexValueForAttributeNames:v14 entity:v6];

  if (((v12 | v15) & v8) == 0) {
    BOOL unknownMergeEvent = self->_unknownMergeEvent;
  }

  return unknownMergeEvent;
}

- (BOOL)userFeedbackRelationshipChangedForObject:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 objectID];
  id v5 = [(NSDictionary *)self->_changedRelationshipsByOID objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 unsignedLongLongValue];

  id v7 = (void *)MEMORY[0x1E4F8AAF8];
  v14[0] = @"userFeedbacks";
  BOOL unknownMergeEvent = 1;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v10 = [v4 entity];
  uint64_t v11 = [v10 name];
  uint64_t v12 = [v7 indexValueForRelationshipNames:v9 entity:v11];

  if ((v12 & v6) == 0) {
    BOOL unknownMergeEvent = self->_unknownMergeEvent;
  }

  return unknownMergeEvent;
}

- (BOOL)keyAssetSharedOrDayGroupKeyAssetSharedChangedForHighlightWithLocalIdentifier:(id)a3
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = [(NSMutableDictionary *)self->_objectIDsByLocalIdentifier objectForKeyedSubscript:a3];
  id v5 = [(NSDictionary *)self->_changedRelationshipsByOID objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 unsignedLongLongValue];

  id v7 = (void *)MEMORY[0x1E4F8AAF8];
  v14[0] = @"keyAssetShared";
  v14[1] = @"dayGroupKeyAssetShared";
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  uint64_t v9 = [v4 entity];
  uint64_t v10 = [v9 name];
  uint64_t v11 = [v7 indexValueForRelationshipNames:v8 entity:v10];

  BOOL v12 = (v11 & v6) != 0 || self->_unknownMergeEvent;
  return v12;
}

- (BOOL)keyAssetPrivateOrDayGroupKeyAssetPrivateChangedForHighlightWithLocalIdentifier:(id)a3
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = [(NSMutableDictionary *)self->_objectIDsByLocalIdentifier objectForKeyedSubscript:a3];
  id v5 = [(NSDictionary *)self->_changedRelationshipsByOID objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 unsignedLongLongValue];

  id v7 = (void *)MEMORY[0x1E4F8AAF8];
  v14[0] = @"keyAssetPrivate";
  v14[1] = @"dayGroupKeyAssetPrivate";
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  uint64_t v9 = [v4 entity];
  uint64_t v10 = [v9 name];
  uint64_t v11 = [v7 indexValueForRelationshipNames:v8 entity:v10];

  BOOL v12 = (v11 & v6) != 0 || self->_unknownMergeEvent;
  return v12;
}

- (BOOL)assetsOrDayGroupAssetsRelationshipChangedForHighlightWithLocalIdentifier:(id)a3
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = [(NSMutableDictionary *)self->_objectIDsByLocalIdentifier objectForKeyedSubscript:a3];
  id v5 = [(NSDictionary *)self->_changedRelationshipsByOID objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 unsignedLongLongValue];

  id v7 = (void *)MEMORY[0x1E4F8AAF8];
  v14[0] = @"assets";
  v14[1] = @"dayGroupAssets";
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  uint64_t v9 = [v4 entity];
  uint64_t v10 = [v9 name];
  uint64_t v11 = [v7 indexValueForRelationshipNames:v8 entity:v10];

  BOOL v12 = (v11 & v6) != 0 || self->_unknownMergeEvent;
  return v12;
}

- (BOOL)highlightGroupRelationshipChangedForHighlightWithLocalIdentifier:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(NSMutableDictionary *)self->_objectIDsByLocalIdentifier objectForKeyedSubscript:a3];
  id v5 = [(NSDictionary *)self->_changedRelationshipsByOID objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 unsignedLongLongValue];

  id v7 = (void *)MEMORY[0x1E4F8AAF8];
  v14[0] = @"childDayGroupPhotosHighlights";
  BOOL unknownMergeEvent = 1;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v10 = [v4 entity];
  uint64_t v11 = [v10 name];
  uint64_t v12 = [v7 indexValueForRelationshipNames:v9 entity:v11];

  if ((v12 & v6) == 0) {
    BOOL unknownMergeEvent = self->_unknownMergeEvent;
  }

  return unknownMergeEvent;
}

- (BOOL)momentRelationshipChangedForHighlightWithLocalIdentifier:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(NSMutableDictionary *)self->_objectIDsByLocalIdentifier objectForKeyedSubscript:a3];
  id v5 = [(NSDictionary *)self->_changedRelationshipsByOID objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 unsignedLongLongValue];

  id v7 = (void *)MEMORY[0x1E4F8AAF8];
  v14[0] = @"moments";
  BOOL unknownMergeEvent = 1;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v10 = [v4 entity];
  uint64_t v11 = [v10 name];
  uint64_t v12 = [v7 indexValueForRelationshipNames:v9 entity:v11];

  if ((v12 & v6) == 0) {
    BOOL unknownMergeEvent = self->_unknownMergeEvent;
  }

  return unknownMergeEvent;
}

- (BOOL)personRelationshipChangedForFaceWithLocalIdentifier:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(NSMutableDictionary *)self->_objectIDsByLocalIdentifier objectForKeyedSubscript:a3];
  id v5 = [(NSDictionary *)self->_changedRelationshipsByOID objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 unsignedLongLongValue];

  id v7 = (void *)MEMORY[0x1E4F8AAF8];
  v14[0] = @"personForFace";
  BOOL unknownMergeEvent = 1;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v10 = [v4 entity];
  uint64_t v11 = [v10 name];
  uint64_t v12 = [v7 indexValueForRelationshipNames:v9 entity:v11];

  if ((v12 & v6) == 0) {
    BOOL unknownMergeEvent = self->_unknownMergeEvent;
  }

  return unknownMergeEvent;
}

- (BOOL)faceRelationshipChangedForPersonWithLocalIdentifier:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(NSMutableDictionary *)self->_objectIDsByLocalIdentifier objectForKeyedSubscript:a3];
  id v5 = [(NSDictionary *)self->_changedRelationshipsByOID objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 unsignedLongLongValue];

  id v7 = (void *)MEMORY[0x1E4F8AAF8];
  v14[0] = @"detectedFaces";
  BOOL unknownMergeEvent = 1;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v10 = [v4 entity];
  uint64_t v11 = [v10 name];
  uint64_t v12 = [v7 indexValueForRelationshipNames:v9 entity:v11];

  if ((v12 & v6) == 0) {
    BOOL unknownMergeEvent = self->_unknownMergeEvent;
  }

  return unknownMergeEvent;
}

- (BOOL)hasRelationshipChangesForLocalIdentifier:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_objectIDsByLocalIdentifier objectForKeyedSubscript:a3];
  if (v4)
  {
    id v5 = [(NSDictionary *)self->_changedRelationshipsByOID objectForKeyedSubscript:v4];
    uint64_t v6 = [v5 unsignedLongLongValue];

    if (v6) {
      BOOL unknownMergeEvent = 1;
    }
    else {
      BOOL unknownMergeEvent = self->_unknownMergeEvent;
    }
  }
  else
  {
    BOOL unknownMergeEvent = 0;
  }

  return unknownMergeEvent;
}

@end