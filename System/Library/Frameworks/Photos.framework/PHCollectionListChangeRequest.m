@interface PHCollectionListChangeRequest
+ (PHCollectionListChangeRequest)changeRequestForCollectionList:(PHCollectionList *)collectionList;
+ (PHCollectionListChangeRequest)changeRequestForTopLevelCollectionListUserCollections:(PHFetchResult *)childCollections;
+ (PHCollectionListChangeRequest)creationRequestForCollectionListWithTitle:(NSString *)title;
+ (id)_changeRequestForCollectionList:(id)a3 optionalChildCollections:(id)a4;
+ (void)_deleteCollectionLists:(id)a3 withOperation:(int64_t)a4 topLevelSelector:(SEL)a5;
+ (void)deleteCollectionLists:(id)collectionLists;
+ (void)expungeCollectionLists:(id)a3;
+ (void)undeleteCollectionLists:(id)a3;
- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5;
- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (BOOL)customSortAscending;
- (BOOL)isTopLevelUserCollection;
- (NSString)description;
- (NSString)managedEntityName;
- (NSString)title;
- (PHCollectionListChangeRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHCollectionListChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (PHObjectPlaceholder)placeholderForCreatedCollectionList;
- (PHRelationshipChangeRequestHelper)collectionsHelper;
- (id)_mutableObjectIDsAndUUIDs;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)initForNewObject;
- (unsigned)customSortKey;
- (void)_prepareAssetIDsIfNeeded;
- (void)_prepareWithFetchResult:(id)a3;
- (void)_setOriginalCollectionList:(id)a3;
- (void)addChildCollection:(id)a3;
- (void)addChildCollections:(id)collections;
- (void)encodeToXPCDict:(id)a3;
- (void)insertChildCollection:(id)a3 inChildCollectionsAtIndex:(unint64_t)a4;
- (void)insertChildCollections:(id)collections atIndexes:(NSIndexSet *)indexes;
- (void)moveChildCollectionsAtIndexes:(NSIndexSet *)indexes toIndex:(NSUInteger)toIndex;
- (void)removeChildCollection:(id)a3;
- (void)removeChildCollectionFromChildCollectionsAtIndex:(unint64_t)a3;
- (void)removeChildCollections:(id)collections;
- (void)removeChildCollectionsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceChildCollectionsAtIndex:(unint64_t)a3 withChildCollection:(id)a4;
- (void)replaceChildCollectionsAtIndexes:(NSIndexSet *)indexes withChildCollections:(id)collections;
- (void)setCustomSortAscending:(BOOL)a3;
- (void)setCustomSortKey:(unsigned int)a3;
- (void)setIsTopLevelUserCollection:(BOOL)a3;
- (void)setTitle:(NSString *)title;
@end

@implementation PHCollectionListChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionsHelper, 0);

  objc_storeStrong((id *)&self->_originalCollectionList, 0);
}

- (void)setIsTopLevelUserCollection:(BOOL)a3
{
  self->_isTopLevelUserCollection = a3;
}

- (BOOL)isTopLevelUserCollection
{
  return self->_isTopLevelUserCollection;
}

- (PHRelationshipChangeRequestHelper)collectionsHelper
{
  return self->_collectionsHelper;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)PHCollectionListChangeRequest;
  v3 = [(PHCollectionListChangeRequest *)&v8 description];
  v4 = [(PHCollectionListChangeRequest *)self title];
  v5 = [(PHRelationshipChangeRequestHelper *)self->_collectionsHelper mutableObjectIDsAndUUIDs];
  v6 = [v3 stringByAppendingFormat:@" title=%@ hasAssetChanges=%d", v4, v5 != 0];

  return (NSString *)v6;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  objc_super v8 = [v7 managedObjectContext];
  v9 = PLSafeEntityForNameInManagedObjectContext();

  if (!v9)
  {
    id v15 = 0;
    char v32 = 0;
    goto LABEL_17;
  }
  int v10 = [v7 kindValue];
  v11 = [v7 entity];
  int v12 = [v11 isKindOfEntity:v9];

  if (!v12 || (v10 - 3998) >= 3)
  {
    v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v46 = *MEMORY[0x1E4F28568];
    v16 = [NSString stringWithFormat:@"Invalid collection list type"];
    v47[0] = v16;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
    objc_msgSend(v34, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v20);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    char v32 = 0;
LABEL_11:

    id v15 = v33;
    goto LABEL_12;
  }
  v13 = [(PHChangeRequest *)self helper];
  id v45 = 0;
  int v14 = [v13 applyMutationsToManagedObject:v7 error:&v45];
  id v15 = v45;

  if (!v14)
  {
    char v32 = 0;
    if (!a5) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  v16 = [(PHCollectionListChangeRequest *)self collectionsHelper];
  v17 = [v16 mutableObjectIDsAndUUIDs];

  if (v17)
  {
    id v18 = v7;
    objc_msgSend(v16, "setAllowsInsert:", objc_msgSend(v18, "canPerformEditOperation:", 4));
    objc_msgSend(v16, "setAllowsMove:", objc_msgSend(v18, "canPerformEditOperation:", 16));
    objc_msgSend(v16, "setAllowsRemove:", objc_msgSend(v18, "canPerformEditOperation:", 2));
    v19 = [MEMORY[0x1E4F8A848] entityName];
    [v16 setDestinationEntityName:v19];

    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __82__PHCollectionListChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke;
    v42[3] = &unk_1E5843148;
    id v20 = v18;
    id v43 = v20;
    int v44 = v10;
    [v16 setIsDestinationObjectValid:v42];
    if ([(PHCollectionListChangeRequest *)self isTopLevelUserCollection])
    {
      v21 = +[PHPhotoLibrary photoLibraryForCurrentTransaction];
      v39 = [v21 librarySpecificFetchOptions];

      v22 = (void *)MEMORY[0x1E4F28BA0];
      v23 = +[PHCollection predicateForUserCollections];
      v38 = [v22 notPredicateWithSubpredicate:v23];

      v37 = +[PHQuery queryForTopLevelCollectionsMatchingPredicate:v38 options:v39];
      v40 = [v37 executeQuery];
      v24 = [v40 fetchedObjectIDs];
      v25 = [v16 originalObjectIDs];
      v36 = [v24 arrayByAddingObjectsFromArray:v25];

      [v16 setOriginalObjectIDs:v36];
      v26 = [v16 mutableObjectIDsAndUUIDs];
      v27 = [v40 fetchedObjectIDs];
      v28 = (void *)MEMORY[0x1E4F28D60];
      v29 = [v40 fetchedObjectIDs];
      v30 = objc_msgSend(v28, "indexSetWithIndexesInRange:", 0, objc_msgSend(v29, "count"));
      [v26 insertObjects:v27 atIndexes:v30];
    }
    v31 = objc_msgSend(v20, "albums", v36);
    id v41 = v15;
    char v32 = [v16 applyMutationsToManagedObject:v20 orderedMutableChildren:v31 error:&v41];
    id v33 = v41;

    goto LABEL_11;
  }
  char v32 = 1;
LABEL_12:

  if (!a5) {
    goto LABEL_17;
  }
LABEL_15:
  if ((v32 & 1) == 0)
  {
    id v15 = v15;
    char v32 = 0;
    *a5 = v15;
  }
LABEL_17:

  return v32;
}

uint64_t __82__PHCollectionListChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  v5 = [v3 objectID];
  v6 = v5;
  if (v4)
  {
    do
    {
      id v7 = v4;
      objc_super v8 = [v4 objectID];
      int v9 = [v6 isEqual:v8];

      id v4 = [v7 parentFolder];
    }
    while (v4 && !v9);

    if (v9) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  id v10 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v11 = [v10 isSmartAlbum];

    if (v11)
    {
      id v12 = v10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

LABEL_18:
        uint64_t v17 = 0;
        goto LABEL_19;
      }
      int v13 = [v12 isUserCreated];

      if (!v13) {
        goto LABEL_18;
      }
    }
  }
  else
  {
  }
  int v14 = *(_DWORD *)(a1 + 40);
  id v15 = v10;
  objc_opt_class();
  BOOL v16 = (objc_opt_isKindOfClass() & 1) != 0 && [v15 kindValue] == 1508;

  uint64_t v17 = (v14 != 3998) ^ v16;
LABEL_19:

  return v17;
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(PHChangeRequest *)self helper];
  id v23 = 0;
  int v11 = [v10 allowMutationToManagedObject:v8 propertyKey:v9 error:&v23];
  id v12 = v23;

  if (!v11) {
    goto LABEL_5;
  }
  if (![v9 isEqualToString:@"title"])
  {
    if (([v9 isEqualToString:@"customSortKey"] & 1) == 0
      && ([v9 isEqualToString:@"customSortAscending"] & 1) == 0)
    {
      id v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F28568];
      v19 = [NSString stringWithFormat:@"Invalid property %@", v9];
      v25 = v19;
      BOOL v17 = 1;
      id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      uint64_t v21 = objc_msgSend(v18, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v20);

      id v12 = (id)v21;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if ([v8 canPerformEditOperation:64])
  {
LABEL_9:
    BOOL v17 = 1;
    goto LABEL_12;
  }
  int v13 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v26 = *MEMORY[0x1E4F28568];
  int v14 = [NSString stringWithFormat:@"Invalid operation on property %@", v9];
  v27[0] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  uint64_t v16 = objc_msgSend(v13, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v15);

  id v12 = (id)v16;
LABEL_5:
  if (a5)
  {
    id v12 = v12;
    BOOL v17 = 0;
    *a5 = v12;
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_12:

  return v17;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(PHChangeRequest *)self helper];
  id v23 = 0;
  id v8 = [MEMORY[0x1E4F8A968] entityName];
  id v22 = 0;
  int v9 = [v7 getCloudGUIDIfReserved:&v23 entityName:v8 photoLibrary:v6 error:&v22];
  id v10 = v23;
  id v11 = v22;

  if (!v9) {
    goto LABEL_7;
  }
  uint64_t v12 = [MEMORY[0x1E4F8A968] insertNewFolderWithTitle:0 kind:4000 intoLibrary:v6];
  if (!v12)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    BOOL v17 = [NSString stringWithFormat:@"Failed to create collection list"];
    v25[0] = v17;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    uint64_t v19 = objc_msgSend(v16, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v18);

    id v11 = (id)v19;
LABEL_7:
    id v20 = v11;
    id v15 = v20;
    if (a4)
    {
      id v15 = v20;
      int v13 = 0;
      *a4 = v15;
    }
    else
    {
      int v13 = 0;
    }
    goto LABEL_10;
  }
  int v13 = (void *)v12;
  int v14 = [(PHChangeRequest *)self uuid];
  [v13 setUuid:v14];

  if (v10) {
    [v13 setCloudGUID:v10];
  }
  id v15 = v11;
LABEL_10:

  return v13;
}

- (void)removeChildCollections:(id)collections
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = collections;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (!v7)
        {
          [(PHChangeRequest *)self didMutate];
          id v7 = [MEMORY[0x1E4F1CA48] array];
        }
        id v11 = PLObjectIDOrUUIDFromPHObject(v10);
        [v7 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
    if (v7)
    {
      uint64_t v12 = [(PHCollectionListChangeRequest *)self _mutableObjectIDsAndUUIDs];
      [v12 removeObjectsInArray:v7];
    }
  }
}

- (void)addChildCollections:(id)collections
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = collections;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (!v7)
        {
          [(PHChangeRequest *)self didMutate];
          id v7 = [MEMORY[0x1E4F1CA48] array];
        }
        id v11 = PLObjectIDOrUUIDFromPHObject(v10);
        [v7 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
    if (v7)
    {
      uint64_t v12 = [(PHCollectionListChangeRequest *)self _mutableObjectIDsAndUUIDs];
      [v12 addObjectsFromArray:v7];
    }
  }
}

- (void)removeChildCollection:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = a3;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    uint64_t v6 = [v4 arrayWithObjects:&v7 count:1];

    -[PHCollectionListChangeRequest removeChildCollections:](self, "removeChildCollections:", v6, v7, v8);
  }
}

- (void)addChildCollection:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = a3;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    uint64_t v6 = [v4 arrayWithObjects:&v7 count:1];

    -[PHCollectionListChangeRequest addChildCollections:](self, "addChildCollections:", v6, v7, v8);
  }
}

- (void)moveChildCollectionsAtIndexes:(NSIndexSet *)indexes toIndex:(NSUInteger)toIndex
{
  id v10 = indexes;
  if ([(NSIndexSet *)v10 count])
  {
    [(PHChangeRequest *)self didMutate];
    uint64_t v6 = [(PHCollectionListChangeRequest *)self _mutableObjectIDsAndUUIDs];
    id v7 = [v6 objectsAtIndexes:v10];
    [v6 removeObjectsAtIndexes:v10];
    uint64_t v8 = [(NSIndexSet *)v10 count];
    int v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", toIndex, v8);
    [v6 insertObjects:v7 atIndexes:v9];
  }
}

- (void)replaceChildCollectionsAtIndexes:(NSIndexSet *)indexes withChildCollections:(id)collections
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = indexes;
  id v7 = collections;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (!v10)
        {
          [(PHChangeRequest *)self didMutate];
          id v10 = [MEMORY[0x1E4F1CA48] array];
        }
        long long v14 = PLObjectIDOrUUIDFromPHObject(v13);
        [v10 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
    if (v10)
    {
      long long v15 = [(PHCollectionListChangeRequest *)self _mutableObjectIDsAndUUIDs];
      [v15 replaceObjectsAtIndexes:v6 withObjects:v10];
    }
  }
}

- (void)replaceChildCollectionsAtIndex:(unint64_t)a3 withChildCollection:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28D60];
    id v7 = a4;
    uint64_t v8 = [v6 indexSetWithIndex:a3];
    v10[0] = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

    [(PHCollectionListChangeRequest *)self replaceChildCollectionsAtIndexes:v8 withChildCollections:v9];
  }
}

- (void)removeChildCollectionsAtIndexes:(NSIndexSet *)indexes
{
  id v5 = indexes;
  if ([(NSIndexSet *)v5 count])
  {
    [(PHChangeRequest *)self didMutate];
    id v4 = [(PHCollectionListChangeRequest *)self _mutableObjectIDsAndUUIDs];
    [v4 removeObjectsAtIndexes:v5];
  }
}

- (void)insertChildCollections:(id)collections atIndexes:(NSIndexSet *)indexes
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = collections;
  id v7 = indexes;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v6);
        }
        long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (!v10)
        {
          [(PHChangeRequest *)self didMutate];
          id v10 = [MEMORY[0x1E4F1CA48] array];
        }
        long long v14 = PLObjectIDOrUUIDFromPHObject(v13);
        [v10 addObject:v14];
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
    if (v10)
    {
      long long v15 = [(PHCollectionListChangeRequest *)self _mutableObjectIDsAndUUIDs];
      [v15 insertObjects:v10 atIndexes:v7];
    }
  }
}

- (void)removeChildCollectionFromChildCollectionsAtIndex:(unint64_t)a3
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(PHCollectionListChangeRequest *)self removeChildCollectionsAtIndexes:v5];
  }
}

- (void)insertChildCollection:(id)a3 inChildCollectionsAtIndex:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v10 = a3;
    id v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = a3;
    uint64_t v8 = [v6 arrayWithObjects:&v10 count:1];
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", a4, v10, v11);

    [(PHCollectionListChangeRequest *)self insertChildCollections:v8 atIndexes:v9];
  }
}

- (id)_mutableObjectIDsAndUUIDs
{
  [(PHCollectionListChangeRequest *)self _prepareAssetIDsIfNeeded];
  collectionsHelper = self->_collectionsHelper;

  return [(PHRelationshipChangeRequestHelper *)collectionsHelper mutableObjectIDsAndUUIDs];
}

- (void)_prepareAssetIDsIfNeeded
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHRelationshipChangeRequestHelper *)self->_collectionsHelper originalObjectIDs];

  if (!v3)
  {
    if (self->_originalCollectionList)
    {
      id v4 = +[PHPhotoLibrary photoLibraryForCurrentTransaction];
      id v5 = [v4 librarySpecificFetchOptions];

      if ([(PHCollectionListChangeRequest *)self isTopLevelUserCollection]) {
        +[PHQuery queryForTopLevelUserCollectionsWithOptions:v5];
      }
      else {
      id v6 = +[PHQuery queryForCollectionsInCollectionList:self->_originalCollectionList options:v5];
      }
      id v7 = [v6 executeQuery];
      [(PHCollectionListChangeRequest *)self _prepareWithFetchResult:v7];
    }
    uint64_t v8 = [(PHRelationshipChangeRequestHelper *)self->_collectionsHelper originalObjectIDs];

    if (!v8) {
      [(PHRelationshipChangeRequestHelper *)self->_collectionsHelper setOriginalObjectIDs:MEMORY[0x1E4F1CBF0]];
    }
  }
  uint64_t v9 = [(PHRelationshipChangeRequestHelper *)self->_collectionsHelper mutableObjectIDsAndUUIDs];

  if (!v9)
  {
    collectionsHelper = self->_collectionsHelper;
    id v12 = [(PHRelationshipChangeRequestHelper *)collectionsHelper originalObjectIDs];
    uint64_t v11 = (void *)[v12 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)collectionsHelper setMutableObjectIDsAndUUIDs:v11];
  }
}

- (void)_prepareWithFetchResult:(id)a3
{
  id v7 = a3;
  +[PHPhotoLibrary assertTransaction];
  id v4 = [(PHRelationshipChangeRequestHelper *)self->_collectionsHelper originalObjectIDs];

  if (!v4)
  {
    collectionsHelper = self->_collectionsHelper;
    id v6 = [v7 fetchedObjectIDs];
    [(PHRelationshipChangeRequestHelper *)collectionsHelper setOriginalObjectIDs:v6];
  }
}

- (void)_setOriginalCollectionList:(id)a3
{
}

- (void)setTitle:(NSString *)title
{
  id v10 = title;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"title"];

    uint64_t v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"title"];
  }
  else
  {
    [v6 removeObjectForKey:@"title"];

    uint64_t v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"title"];
  }
}

- (NSString)title
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"title"];

  return (NSString *)v5;
}

- (void)setCustomSortAscending:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithBool:v3];
  id v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"customSortAscending"];
}

- (BOOL)customSortAscending
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"customSortAscending"];

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (void)setCustomSortKey:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedInt:v3];
  id v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"customSortKey"];
}

- (unsigned)customSortKey
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"customSortKey"];

  LODWORD(v3) = [v5 intValue];
  return v3;
}

- (PHObjectPlaceholder)placeholderForCreatedCollectionList
{
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 placeholderForCreatedObjectWithClass:objc_opt_class() changeRequest:self];

  return (PHObjectPlaceholder *)v4;
}

- (NSString)managedEntityName
{
  return (NSString *)@"Folder";
}

- (void)encodeToXPCDict:(id)a3
{
  id v4 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 encodeToXPCDict:v4];

  id v6 = [(PHCollectionListChangeRequest *)self collectionsHelper];
  [v6 encodeToXPCDict:v4];
}

- (PHCollectionListChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PHCollectionListChangeRequest;
  uint64_t v11 = [(PHChangeRequest *)&v17 init];
  if (v11)
  {
    id v12 = [[PHChangeRequestHelper alloc] initWithXPCDict:v8 changeRequest:v11 request:v9 clientAuthorization:v10];
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      long long v14 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"childCollections" xpcDict:v8 changeRequestHelper:v11->super._helper];
      collectionsHelper = v11->_collectionsHelper;
      v11->_collectionsHelper = v14;
    }
  }

  return v11;
}

- (PHCollectionListChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHCollectionListChangeRequest;
  id v8 = [(PHChangeRequest *)&v14 init];
  if (v8)
  {
    id v9 = [[PHChangeRequestHelper alloc] initWithUUID:v6 objectID:v7 changeRequest:v8];
    helper = v8->super._helper;
    v8->super._helper = v9;

    uint64_t v11 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"childCollections" changeRequestHelper:v8->super._helper];
    collectionsHelper = v8->_collectionsHelper;
    v8->_collectionsHelper = v11;
  }
  return v8;
}

- (id)initForNewObject
{
  v8.receiver = self;
  v8.super_class = (Class)PHCollectionListChangeRequest;
  v2 = [(PHChangeRequest *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [[PHChangeRequestHelper alloc] initForNewObjectWithChangeRequest:v2];
    helper = v2->super._helper;
    v2->super._helper = v3;

    id v5 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"childCollections" changeRequestHelper:v2->super._helper];
    collectionsHelper = v2->_collectionsHelper;
    v2->_collectionsHelper = v5;
  }
  return v2;
}

+ (void)_deleteCollectionLists:(id)a3 withOperation:(int64_t)a4 topLevelSelector:(SEL)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  +[PHObject assertAllObjects:v7 forSelector:a5 areOfType:objc_opt_class()];
  +[PHPhotoLibrary assertTransaction];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = +[PHTrashableObjectDeleteRequest deleteRequestForObject:operation:](PHCollectionDeleteRequest, "deleteRequestForObject:operation:", *(void *)(*((void *)&v14 + 1) + 8 * v12++), a4, (void)v14);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

+ (void)undeleteCollectionLists:(id)a3
{
}

+ (void)expungeCollectionLists:(id)a3
{
}

+ (void)deleteCollectionLists:(id)collectionLists
{
}

+ (PHCollectionListChangeRequest)creationRequestForCollectionListWithTitle:(NSString *)title
{
  uint64_t v3 = title;
  id v4 = [[PHCollectionListChangeRequest alloc] initForNewObject];
  [v4 setTitle:v3];

  return (PHCollectionListChangeRequest *)v4;
}

+ (PHCollectionListChangeRequest)changeRequestForTopLevelCollectionListUserCollections:(PHFetchResult *)childCollections
{
  id v4 = childCollections;
  id v5 = +[PHPhotoLibrary photoLibraryForCurrentTransaction];
  id v6 = [v5 librarySpecificFetchOptions];
  id v7 = +[PHCollectionList fetchRootAlbumCollectionListWithOptions:v6];
  id v8 = [v7 firstObject];

  uint64_t v9 = [a1 _changeRequestForCollectionList:v8 optionalChildCollections:v4];

  [v9 setIsTopLevelUserCollection:1];

  return (PHCollectionListChangeRequest *)v9;
}

+ (PHCollectionListChangeRequest)changeRequestForCollectionList:(PHCollectionList *)collectionList
{
  return (PHCollectionListChangeRequest *)[a1 _changeRequestForCollectionList:collectionList optionalChildCollections:0];
}

+ (id)_changeRequestForCollectionList:(id)a3 optionalChildCollections:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isTransient])
  {
    id v7 = 0;
  }
  else
  {
    id v8 = [PHCollectionListChangeRequest alloc];
    uint64_t v9 = [v5 uuid];
    uint64_t v10 = [v5 objectID];
    id v7 = [(PHCollectionListChangeRequest *)v8 initWithUUID:v9 objectID:v10];

    [(PHCollectionListChangeRequest *)v7 _setOriginalCollectionList:v5];
    if (v6) {
      [(PHCollectionListChangeRequest *)v7 _prepareWithFetchResult:v6];
    }
  }

  return v7;
}

@end