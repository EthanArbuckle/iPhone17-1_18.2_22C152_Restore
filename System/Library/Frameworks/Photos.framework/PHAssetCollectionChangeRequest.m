@interface PHAssetCollectionChangeRequest
+ (PHAssetCollectionChangeRequest)changeRequestForAssetCollection:(PHAssetCollection *)assetCollection;
+ (PHAssetCollectionChangeRequest)creationRequestForAssetCollectionWithTitle:(NSString *)title;
+ (id)_changeRequestForAssetCollection:(id)a3 optionalAssets:(id)a4;
+ (id)creationRequestForAssetCollectionCopyFromAssetCollection:(id)a3;
+ (id)validateAssetCollectionTitle:(id)a3 error:(id *)a4;
+ (void)_deleteAssetCollections:(id)a3 withOperation:(int64_t)a4 topLevelSelector:(SEL)a5;
+ (void)deleteAssetCollections:(id)assetCollections;
+ (void)expungeAssetCollections:(id)a3;
+ (void)undeleteAssetCollections:(id)a3;
- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5;
- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (BOOL)customSortAscending;
- (BOOL)isPinned;
- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (NSString)description;
- (NSString)managedEntityName;
- (NSString)title;
- (PHAssetCollection)originalAssetCollection;
- (PHAssetCollectionChangeRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHAssetCollectionChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (PHObjectPlaceholder)placeholderForCreatedAssetCollection;
- (PHRelationshipChangeRequestHelper)assetsHelper;
- (PHRelationshipChangeRequestHelper)customKeyAssetHelper;
- (id)_mutableAssetsObjectIDsAndUUIDs;
- (id)_mutableCustomKeyAssetObjectIDsAndUUIDs;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)initForNewObject;
- (unsigned)customSortKey;
- (void)_prepareAssetIDsIfNeeded;
- (void)_prepareCustomKeyAssetIDIfNeeded;
- (void)_prepareWithFetchResult:(id)a3;
- (void)_setOriginalAssetCollection:(id)a3;
- (void)addAsset:(id)a3;
- (void)addAssets:(id)assets;
- (void)encodeToXPCDict:(id)a3;
- (void)insertAsset:(id)a3 inAssetsAtIndex:(unint64_t)a4;
- (void)insertAssets:(id)assets atIndexes:(NSIndexSet *)indexes;
- (void)moveAssetsAtIndexes:(NSIndexSet *)fromIndexes toIndex:(NSUInteger)toIndex;
- (void)removeAsset:(id)a3;
- (void)removeAssetFromAssetsAtIndex:(unint64_t)a3;
- (void)removeAssets:(id)assets;
- (void)removeAssetsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceAssetInAssetsAtIndex:(unint64_t)a3 withAsset:(id)a4;
- (void)replaceAssetsAtIndexes:(NSIndexSet *)indexes withAssets:(id)assets;
- (void)setCustomKeyAsset:(id)a3;
- (void)setCustomSortAscending:(BOOL)a3;
- (void)setCustomSortKey:(unsigned int)a3;
- (void)setIsPinned:(BOOL)a3;
- (void)setOriginalAssetCollection:(id)a3;
- (void)setTitle:(NSString *)title;
@end

@implementation PHAssetCollectionChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customKeyAssetHelper, 0);
  objc_storeStrong((id *)&self->_assetsHelper, 0);

  objc_storeStrong((id *)&self->_originalAssetCollection, 0);
}

- (PHRelationshipChangeRequestHelper)customKeyAssetHelper
{
  return self->_customKeyAssetHelper;
}

- (PHRelationshipChangeRequestHelper)assetsHelper
{
  return self->_assetsHelper;
}

- (void)setOriginalAssetCollection:(id)a3
{
}

- (PHAssetCollection)originalAssetCollection
{
  return self->_originalAssetCollection;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)PHAssetCollectionChangeRequest;
  v3 = [(PHAssetCollectionChangeRequest *)&v8 description];
  v4 = [(PHAssetCollectionChangeRequest *)self title];
  v5 = [(PHRelationshipChangeRequestHelper *)self->_assetsHelper mutableObjectIDsAndUUIDs];
  v6 = [v3 stringByAppendingFormat:@" title=%@ hasAssetChanges=%d", v4, v5 != 0];

  return (NSString *)v6;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 managedObjectContext];
  v48[1] = 0;
  v11 = PLSafeEntityForNameInManagedObjectContext();
  id v12 = 0;

  if (v11)
  {
    v13 = [v8 entity];
    int v14 = [v13 isKindOfEntity:v11];

    if (v14)
    {
      int v15 = [v8 kindValue];
      if (v15 > 1504)
      {
        if (v15 != 1508 && v15 != 1505) {
          goto LABEL_27;
        }
      }
      else if (v15 != 2 && v15 != 1000)
      {
        goto LABEL_27;
      }
      if (![v8 isCloudSharedAlbum]
        || [(PHChangeRequest *)self isClientEntitled])
      {
        v17 = [(PHChangeRequest *)self helper];
        v48[0] = v12;
        int v18 = [v17 applyMutationsToManagedObject:v8 error:v48];
        id v19 = v48[0];

        if (!v18)
        {
          char v16 = 0;
LABEL_31:
          id v12 = v19;
          if (!a5) {
            goto LABEL_34;
          }
          goto LABEL_32;
        }
        v20 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          BOOL v21 = [(PHChangeRequest *)self isMutated];
          v22 = [(PHChangeRequest *)self helper];
          v23 = [v22 mutations];
          int v24 = [v8 conformsToProtocol:&unk_1EEB95FD0];
          if (v24) {
            int v24 = [v8 isCloudSharedAlbum];
          }
          *(_DWORD *)buf = 67109634;
          BOOL v50 = v21;
          __int16 v51 = 2112;
          v52 = v23;
          __int16 v53 = 1024;
          int v54 = v24;
          _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_DEBUG, "##### isMutated %d mutations %@ will update %d", buf, 0x18u);
        }
        if ([(PHChangeRequest *)self isMutated])
        {
          v25 = [(PHChangeRequest *)self helper];
          v26 = [v25 mutations];
          v27 = [v26 objectForKey:@"title"];

          if (v27)
          {
            if ([v8 conformsToProtocol:&unk_1EEB95FD0])
            {
              if ([v8 isCloudSharedAlbum])
              {
                v28 = (void *)MEMORY[0x1E4F8AAB0];
                v29 = [v9 pathManager];
                v30 = [v29 libraryURL];
                LODWORD(v28) = [v28 sharedStreamsEnabledForPhotoLibraryURL:v30];

                if (v28) {
                  [MEMORY[0x1E4F8AAB0] updateCloudSharedAlbumMetadataOnServer:v8];
                }
              }
            }
          }
        }
        v31 = [(PHAssetCollectionChangeRequest *)self assetsHelper];
        v32 = [v31 mutableObjectIDsAndUUIDs];

        if (v32)
        {
          id v33 = v8;
          objc_msgSend(v31, "setAllowsInsert:", objc_msgSend(v33, "canPerformEditOperation:", 4));
          objc_msgSend(v31, "setAllowsMove:", objc_msgSend(v33, "canPerformEditOperation:", 16));
          objc_msgSend(v31, "setAllowsRemove:", objc_msgSend(v33, "canPerformEditOperation:", 2));
          v34 = [MEMORY[0x1E4F8A950] entityName];
          [v31 setDestinationEntityName:v34];

          [v31 setIsDestinationObjectValid:&__block_literal_global_25430];
          if ([v33 conformsToProtocol:&unk_1EEB96030]) {
            [v33 userEditableAssets];
          }
          else {
          v42 = [v33 mutableAssets];
          }
          id v47 = v19;
          int v45 = [v31 applyMutationsToManagedObject:v33 orderedMutableChildren:v42 error:&v47];
          id v12 = v47;

          if (!v45)
          {
            char v16 = 0;
            if (!a5) {
              goto LABEL_34;
            }
LABEL_32:
            if ((v16 & 1) == 0) {
              goto LABEL_33;
            }
            goto LABEL_34;
          }
          id v19 = v12;
        }
        else
        {
        }
        v36 = [(PHAssetCollectionChangeRequest *)self customKeyAssetHelper];
        v43 = [v36 mutableObjectIDsAndUUIDs];

        if (!v43)
        {
          char v16 = 1;
          goto LABEL_30;
        }
        [v36 setAllowsInsert:1];
        v44 = [MEMORY[0x1E4F8A950] entityName];
        [v36 setDestinationEntityName:v44];

        id v46 = v19;
        char v16 = [v36 applyMutationsToManagedObjectToOneRelationship:v8 error:&v46];
        id v40 = v46;
LABEL_29:

        id v19 = v40;
LABEL_30:

        goto LABEL_31;
      }
      v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v57 = *MEMORY[0x1E4F28568];
      v36 = [NSString stringWithFormat:@"Cannot modify iCloud Shared Streams"];
      v58[0] = v36;
      v37 = (void *)MEMORY[0x1E4F1C9E8];
      v38 = (void **)v58;
      v39 = &v57;
LABEL_28:
      id v19 = [v37 dictionaryWithObjects:v38 forKeys:v39 count:1];
      objc_msgSend(v35, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v19);
      id v40 = (id)objc_claimAutoreleasedReturnValue();

      char v16 = 0;
      goto LABEL_29;
    }
LABEL_27:
    v35 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v55 = *MEMORY[0x1E4F28568];
    v36 = [NSString stringWithFormat:@"Invalid album type"];
    v56 = v36;
    v37 = (void *)MEMORY[0x1E4F1C9E8];
    v38 = &v56;
    v39 = &v55;
    goto LABEL_28;
  }
  if (a5)
  {
LABEL_33:
    id v12 = v12;
    char v16 = 0;
    *a5 = v12;
    goto LABEL_34;
  }
  char v16 = 0;
LABEL_34:

  return v16;
}

uint64_t __83__PHAssetCollectionChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCloudSharedAsset] ^ 1;
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(PHChangeRequest *)self helper];
  id v26 = 0;
  int v11 = [v10 allowMutationToManagedObject:v8 propertyKey:v9 error:&v26];
  id v12 = v26;

  if (!v11) {
    goto LABEL_11;
  }
  if (![v9 isEqualToString:@"title"])
  {
    if (![v9 isEqualToString:@"customKeyAsset"])
    {
      id v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v20 = [NSString stringWithFormat:@"Invalid property %@", v9];
      v28 = v20;
      BOOL v18 = 1;
      BOOL v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      uint64_t v22 = objc_msgSend(v19, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v21);

      id v12 = (id)v22;
      goto LABEL_14;
    }
    if ([v8 kindValue] != 2)
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F28568];
      int v14 = [NSString stringWithFormat:@"Invalid operation on property %@", v9];
      v30 = v14;
      int v15 = (void *)MEMORY[0x1E4F1C9E8];
      char v16 = &v30;
      v17 = &v29;
      goto LABEL_10;
    }
LABEL_7:
    BOOL v18 = 1;
    goto LABEL_14;
  }
  if ([v8 canPerformEditOperation:64]) {
    goto LABEL_7;
  }
  v13 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v31 = *MEMORY[0x1E4F28568];
  int v14 = [NSString stringWithFormat:@"Invalid operation on property %@", v9];
  v32[0] = v14;
  int v15 = (void *)MEMORY[0x1E4F1C9E8];
  char v16 = (void **)v32;
  v17 = &v31;
LABEL_10:
  v23 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
  uint64_t v24 = objc_msgSend(v13, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3300, v23);

  id v12 = (id)v24;
LABEL_11:
  if (a5)
  {
    id v12 = v12;
    BOOL v18 = 0;
    *a5 = v12;
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_14:

  return v18;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PHChangeRequest *)self helper];
  id v23 = 0;
  id v8 = [MEMORY[0x1E4F8A848] entityName];
  id v22 = 0;
  int v9 = [v7 getCloudGUIDIfReserved:&v23 entityName:v8 photoLibrary:v6 error:&v22];
  id v10 = v23;
  id v11 = v22;

  if (v9)
  {
    uint64_t v12 = [MEMORY[0x1E4F8A848] insertNewAlbumIntoLibrary:v6];
    if (v12)
    {
      v13 = (void *)v12;
      int v14 = [(PHChangeRequest *)self uuid];
      [v13 setUuid:v14];

      if (v10) {
        [v13 setCloudGUID:v10];
      }
      int v9 = 1;
    }
    else
    {
      int v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F28568];
      char v16 = [NSString stringWithFormat:@"Failed to create asset collection"];
      v25[0] = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
      uint64_t v18 = objc_msgSend(v15, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v17);

      int v9 = 0;
      v13 = 0;
      id v11 = (id)v18;
    }
  }
  else
  {
    v13 = 0;
  }
  id v19 = [(PHChangeRequest *)self helper];
  v20 = [v19 clientBundleIdentifier];

  if (v9)
  {
    if ([v20 length]) {
      [v13 setImportedByBundleIdentifier:v20];
    }
  }
  else if (a4)
  {
    *a4 = v11;
  }

  return v13;
}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  v5 = [(PHAssetCollectionChangeRequest *)self title];
  id v9 = 0;
  id v6 = [(id)objc_opt_class() validateAssetCollectionTitle:v5 error:&v9];
  id v7 = v9;

  if (a4 && !v6) {
    *a4 = v7;
  }

  return v6 != 0;
}

- (void)removeAssets:(id)assets
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = assets;
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
      uint64_t v12 = [(PHAssetCollectionChangeRequest *)self _mutableAssetsObjectIDsAndUUIDs];
      [v12 removeObjectsInArray:v7];
    }
  }
}

- (void)addAssets:(id)assets
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = assets;
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
      uint64_t v12 = [(PHAssetCollectionChangeRequest *)self _mutableAssetsObjectIDsAndUUIDs];
      [v12 addObjectsFromArray:v7];
    }
  }
}

- (void)removeAsset:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = a3;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    uint64_t v6 = [v4 arrayWithObjects:&v7 count:1];

    -[PHAssetCollectionChangeRequest removeAssets:](self, "removeAssets:", v6, v7, v8);
  }
}

- (void)addAsset:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = a3;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    uint64_t v6 = [v4 arrayWithObjects:&v7 count:1];

    -[PHAssetCollectionChangeRequest addAssets:](self, "addAssets:", v6, v7, v8);
  }
}

- (void)moveAssetsAtIndexes:(NSIndexSet *)fromIndexes toIndex:(NSUInteger)toIndex
{
  id v10 = fromIndexes;
  if ([(NSIndexSet *)v10 count])
  {
    [(PHChangeRequest *)self didMutate];
    uint64_t v6 = [(PHAssetCollectionChangeRequest *)self _mutableAssetsObjectIDsAndUUIDs];
    id v7 = [v6 objectsAtIndexes:v10];
    [v6 removeObjectsAtIndexes:v10];
    uint64_t v8 = [(NSIndexSet *)v10 count];
    id v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", toIndex, v8);
    [v6 insertObjects:v7 atIndexes:v9];
  }
}

- (void)replaceAssetsAtIndexes:(NSIndexSet *)indexes withAssets:(id)assets
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = indexes;
  id v7 = assets;
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
      long long v15 = [(PHAssetCollectionChangeRequest *)self _mutableAssetsObjectIDsAndUUIDs];
      [v15 replaceObjectsAtIndexes:v6 withObjects:v10];
    }
  }
}

- (void)replaceAssetInAssetsAtIndex:(unint64_t)a3 withAsset:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28D60];
    id v7 = a4;
    uint64_t v8 = [v6 indexSetWithIndex:a3];
    v10[0] = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

    [(PHAssetCollectionChangeRequest *)self replaceAssetsAtIndexes:v8 withAssets:v9];
  }
}

- (void)removeAssetsAtIndexes:(NSIndexSet *)indexes
{
  id v5 = indexes;
  if ([(NSIndexSet *)v5 count])
  {
    [(PHChangeRequest *)self didMutate];
    id v4 = [(PHAssetCollectionChangeRequest *)self _mutableAssetsObjectIDsAndUUIDs];
    [v4 removeObjectsAtIndexes:v5];
  }
}

- (void)insertAssets:(id)assets atIndexes:(NSIndexSet *)indexes
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = assets;
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
      long long v15 = [(PHAssetCollectionChangeRequest *)self _mutableAssetsObjectIDsAndUUIDs];
      [v15 insertObjects:v10 atIndexes:v7];
    }
  }
}

- (void)removeAssetFromAssetsAtIndex:(unint64_t)a3
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(PHAssetCollectionChangeRequest *)self removeAssetsAtIndexes:v5];
  }
}

- (void)insertAsset:(id)a3 inAssetsAtIndex:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v10 = a3;
    id v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = a3;
    uint64_t v8 = [v6 arrayWithObjects:&v10 count:1];
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", a4, v10, v11);

    [(PHAssetCollectionChangeRequest *)self insertAssets:v8 atIndexes:v9];
  }
}

- (id)_mutableAssetsObjectIDsAndUUIDs
{
  [(PHAssetCollectionChangeRequest *)self _prepareAssetIDsIfNeeded];
  assetsHelper = self->_assetsHelper;

  return [(PHRelationshipChangeRequestHelper *)assetsHelper mutableObjectIDsAndUUIDs];
}

- (void)_prepareAssetIDsIfNeeded
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHRelationshipChangeRequestHelper *)self->_assetsHelper originalObjectIDs];

  if (!v3)
  {
    originalAssetCollection = self->_originalAssetCollection;
    if (originalAssetCollection)
    {
      id v5 = +[PHQuery queryForAssetsInAssetCollection:originalAssetCollection options:0];
      id v6 = [v5 executeQuery];
      [(PHAssetCollectionChangeRequest *)self _prepareWithFetchResult:v6];
    }
    id v7 = [(PHRelationshipChangeRequestHelper *)self->_assetsHelper originalObjectIDs];

    if (!v7) {
      [(PHRelationshipChangeRequestHelper *)self->_assetsHelper setOriginalObjectIDs:MEMORY[0x1E4F1CBF0]];
    }
  }
  uint64_t v8 = [(PHRelationshipChangeRequestHelper *)self->_assetsHelper mutableObjectIDsAndUUIDs];

  if (!v8)
  {
    assetsHelper = self->_assetsHelper;
    id v11 = [(PHRelationshipChangeRequestHelper *)assetsHelper originalObjectIDs];
    id v10 = (void *)[v11 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)assetsHelper setMutableObjectIDsAndUUIDs:v10];
  }
}

- (void)_prepareWithFetchResult:(id)a3
{
  id v7 = a3;
  +[PHPhotoLibrary assertTransaction];
  id v4 = [(PHRelationshipChangeRequestHelper *)self->_assetsHelper originalObjectIDs];

  if (!v4)
  {
    assetsHelper = self->_assetsHelper;
    id v6 = [v7 fetchedObjectIDs];
    [(PHRelationshipChangeRequestHelper *)assetsHelper setOriginalObjectIDs:v6];
  }
}

- (void)_setOriginalAssetCollection:(id)a3
{
}

- (void)setCustomKeyAsset:(id)a3
{
  id v10 = a3;
  id v4 = PLObjectIDOrUUIDFromPHObject(v10);
  if (v4)
  {
    if (self->_originalAssetCollection
      || ([(PHChangeRequest *)self helper],
          id v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 isNewRequest],
          v5,
          v6))
    {
      [(PHChangeRequest *)self didMutate];
      id v7 = [(PHAssetCollectionChangeRequest *)self _mutableAssetsObjectIDsAndUUIDs];
      if (([v7 containsObject:v4] & 1) == 0) {
        [(PHAssetCollectionChangeRequest *)self addAsset:v10];
      }
      uint64_t v8 = [(PHAssetCollectionChangeRequest *)self _mutableCustomKeyAssetObjectIDsAndUUIDs];
      [v8 removeAllObjects];

      uint64_t v9 = [(PHAssetCollectionChangeRequest *)self _mutableCustomKeyAssetObjectIDsAndUUIDs];
      [v9 addObject:v4];
    }
  }
}

- (id)_mutableCustomKeyAssetObjectIDsAndUUIDs
{
  [(PHAssetCollectionChangeRequest *)self _prepareCustomKeyAssetIDIfNeeded];
  customKeyAssetHelper = self->_customKeyAssetHelper;

  return [(PHRelationshipChangeRequestHelper *)customKeyAssetHelper mutableObjectIDsAndUUIDs];
}

- (void)_prepareCustomKeyAssetIDIfNeeded
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHRelationshipChangeRequestHelper *)self->_customKeyAssetHelper originalObjectIDs];

  if (!v3) {
    [(PHRelationshipChangeRequestHelper *)self->_customKeyAssetHelper setOriginalObjectIDs:MEMORY[0x1E4F1CBF0]];
  }
  id v4 = [(PHRelationshipChangeRequestHelper *)self->_customKeyAssetHelper mutableObjectIDsAndUUIDs];

  if (!v4)
  {
    customKeyAssetHelper = self->_customKeyAssetHelper;
    id v7 = [(PHRelationshipChangeRequestHelper *)customKeyAssetHelper originalObjectIDs];
    int v6 = (void *)[v7 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)customKeyAssetHelper setMutableObjectIDsAndUUIDs:v6];
  }
}

- (void)setIsPinned:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithBool:v3];
  int v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"isPinned"];
}

- (BOOL)isPinned
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"isPinned"];

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (void)setTitle:(NSString *)title
{
  id v10 = title;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  id v5 = [(PHChangeRequest *)self helper];
  int v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"title"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"title"];
  }
  else
  {
    [v6 removeObjectForKey:@"title"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"title"];
  }
}

- (NSString)title
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
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
  int v6 = [(PHChangeRequest *)self helper];
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
  int v6 = [(PHChangeRequest *)self helper];
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

- (PHObjectPlaceholder)placeholderForCreatedAssetCollection
{
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 placeholderForCreatedObjectWithClass:objc_opt_class() changeRequest:self];

  return (PHObjectPlaceholder *)v4;
}

- (NSString)managedEntityName
{
  return (NSString *)@"Album";
}

- (void)encodeToXPCDict:(id)a3
{
  id v4 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 encodeToXPCDict:v4];

  int v6 = [(PHAssetCollectionChangeRequest *)self assetsHelper];
  [v6 encodeToXPCDict:v4];

  id v7 = [(PHAssetCollectionChangeRequest *)self customKeyAssetHelper];
  [v7 encodeToXPCDict:v4];
}

- (PHAssetCollectionChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PHAssetCollectionChangeRequest;
  id v11 = [(PHChangeRequest *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [[PHChangeRequestHelper alloc] initWithXPCDict:v8 changeRequest:v11 request:v9 clientAuthorization:v10];
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      long long v14 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"assets" xpcDict:v8 changeRequestHelper:v11->super._helper];
      assetsHelper = v11->_assetsHelper;
      v11->_assetsHelper = v14;

      long long v16 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"customKeyAsset" xpcDict:v8 changeRequestHelper:v11->super._helper];
      customKeyAssetHelper = v11->_customKeyAssetHelper;
      v11->_customKeyAssetHelper = v16;
    }
  }

  return v11;
}

- (PHAssetCollectionChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHAssetCollectionChangeRequest;
  id v8 = [(PHChangeRequest *)&v16 init];
  if (v8)
  {
    id v9 = [[PHChangeRequestHelper alloc] initWithUUID:v6 objectID:v7 changeRequest:v8];
    helper = v8->super._helper;
    v8->super._helper = v9;

    id v11 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"assets" changeRequestHelper:v8->super._helper];
    assetsHelper = v8->_assetsHelper;
    v8->_assetsHelper = v11;

    long long v13 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"customKeyAsset" changeRequestHelper:v8->super._helper];
    customKeyAssetHelper = v8->_customKeyAssetHelper;
    v8->_customKeyAssetHelper = v13;
  }
  return v8;
}

- (id)initForNewObject
{
  v10.receiver = self;
  v10.super_class = (Class)PHAssetCollectionChangeRequest;
  v2 = [(PHChangeRequest *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [[PHChangeRequestHelper alloc] initForNewObjectWithChangeRequest:v2];
    helper = v2->super._helper;
    v2->super._helper = v3;

    id v5 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"assets" changeRequestHelper:v2->super._helper];
    assetsHelper = v2->_assetsHelper;
    v2->_assetsHelper = v5;

    id v7 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"customKeyAsset" changeRequestHelper:v2->super._helper];
    customKeyAssetHelper = v2->_customKeyAssetHelper;
    v2->_customKeyAssetHelper = v7;
  }
  return v2;
}

+ (void)_deleteAssetCollections:(id)a3 withOperation:(int64_t)a4 topLevelSelector:(SEL)a5
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

+ (void)undeleteAssetCollections:(id)a3
{
}

+ (void)expungeAssetCollections:(id)a3
{
}

+ (void)deleteAssetCollections:(id)assetCollections
{
}

+ (id)creationRequestForAssetCollectionCopyFromAssetCollection:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 assetCollectionType] == 1)
  {
    id v5 = [v4 photoLibrary];
    id v6 = [v5 librarySpecificFetchOptions];

    id v7 = +[PHAsset fetchAssetsInAssetCollection:v4 options:v6];
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    int v37 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2020000000;
    int v33 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__25730;
    v42 = __Block_byref_object_dispose__25731;
    id v43 = 0;
    id v8 = [v4 photoLibrary];
    uint64_t v9 = [v8 photoLibrary];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __91__PHAssetCollectionChangeRequest_creationRequestForAssetCollectionCopyFromAssetCollection___block_invoke;
    v20 = &unk_1E5845AB0;
    id v10 = v4;
    id v21 = v10;
    id v22 = &v34;
    id v23 = &v30;
    uint64_t v24 = &v26;
    p_long long buf = &buf;
    [v9 performBlockAndWait:&v17];

    uint64_t v11 = objc_msgSend(v10, "title", v17, v18, v19, v20);
    uint64_t v12 = [a1 creationRequestForAssetCollectionWithTitle:v11];

    [v12 addAssets:v7];
    [v12 setCustomSortKey:*((unsigned int *)v35 + 6)];
    [v12 setCustomSortAscending:*((_DWORD *)v31 + 6) != 0];
    [v12 setIsPinned:*((unsigned __int8 *)v27 + 24)];
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      uint64_t v38 = *(void *)(*((void *)&buf + 1) + 40);
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
      long long v14 = +[PHAsset fetchAssetsWithLocalIdentifiers:v13 options:v6];

      long long v15 = [v14 firstObject];
      [v12 setCustomKeyAsset:v15];
    }
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
  }
  else
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Asset collection type is not an user album: %@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v12 = 0;
  }

  return v12;
}

void __91__PHAssetCollectionChangeRequest_creationRequestForAssetCollectionCopyFromAssetCollection___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F8A848];
  uint64_t v3 = [*(id *)(a1 + 32) objectID];
  id v4 = [*(id *)(a1 + 32) photoLibrary];
  id v5 = [v4 photoLibrary];
  id v11 = [v2 albumWithObjectID:v3 inLibrary:v5];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v11 customSortKey];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v11 customSortAscending];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v11 isPinned];
  id v6 = [v11 customKeyAsset];

  if (v6)
  {
    id v7 = [v11 customKeyAsset];
    uint64_t v8 = [v7 uuid];
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

+ (id)validateAssetCollectionTitle:(id)a3 error:(id *)a4
{
  id v5 = (void *)MEMORY[0x1E4F28B88];
  id v6 = a3;
  id v7 = [v5 whitespaceAndNewlineCharacterSet];
  uint64_t v8 = [v6 stringByTrimmingCharactersInSet:v7];

  if ([v8 length])
  {
    uint64_t v9 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {

    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3300, @"Empty title unsupported");
    uint64_t v8 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (!v8) {
    *a4 = v9;
  }
LABEL_7:

  return v8;
}

+ (PHAssetCollectionChangeRequest)creationRequestForAssetCollectionWithTitle:(NSString *)title
{
  uint64_t v3 = title;
  id v4 = [[PHAssetCollectionChangeRequest alloc] initForNewObject];
  [v4 setTitle:v3];

  return (PHAssetCollectionChangeRequest *)v4;
}

+ (PHAssetCollectionChangeRequest)changeRequestForAssetCollection:(PHAssetCollection *)assetCollection
{
  return (PHAssetCollectionChangeRequest *)[a1 _changeRequestForAssetCollection:assetCollection optionalAssets:0];
}

+ (id)_changeRequestForAssetCollection:(id)a3 optionalAssets:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isTransient])
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v8 = [PHAssetCollectionChangeRequest alloc];
    uint64_t v9 = [v5 uuid];
    id v10 = [v5 objectID];
    id v7 = [(PHAssetCollectionChangeRequest *)v8 initWithUUID:v9 objectID:v10];

    [(PHAssetCollectionChangeRequest *)v7 _setOriginalAssetCollection:v5];
    if (v6) {
      [(PHAssetCollectionChangeRequest *)v7 _prepareWithFetchResult:v6];
    }
  }

  return v7;
}

@end