@interface PHRecentContentSyndicationCollectionsResult
+ (id)pointerComparableIdentifiersFromIdentifiers:(id)a3;
- (BOOL)_hasReachedGroupCapacity;
- (BOOL)isEqual:(id)a3;
- (NSArray)objects;
- (NSString)identifier;
- (PHRecentContentSyndicationCollectionsResult)initWithObjects:(id)a3 photoLibrary:(id)a4 fetchOptions:(id)a5 maxNumberOfStacks:(int64_t)a6 maxNumberOfAssetsPerStack:(int64_t)a7 fetchType:(id)a8 fetchPropertySets:(id)a9 identifier:(id)a10 registerIfNeeded:(BOOL)a11;
- (id)_transientCollectionForAssetOID:(id)a3;
- (id)_transientCollectionForIdentifier:(id)a3;
- (id)additionalChangedIdentifiersFromPreviousIdentifiers:(id)a3 currentIdentifiers:(id)a4 inFetchResultBeforeChanges:(id)a5;
- (id)changeHandlingKey;
- (id)changeHandlingValueUsingSeedOids:(id)a3 withChange:(id)a4 usingManagedObjectContext:(id)a5;
- (id)containerIdentifier;
- (id)copyWithOptions:(id)a3;
- (id)description;
- (id)fetchRequest;
- (id)fetchSortDescriptors;
- (id)objectIDAtIndex:(unint64_t)a3;
- (id)photoLibrary;
- (int64_t)collectionFetchType;
- (unint64_t)hash;
- (unint64_t)possibleChangesForChange:(id)a3 propertiesFetchResult:(id)a4;
- (void)updateRegistrationForChangeNotificationDeltas;
@end

@implementation PHRecentContentSyndicationCollectionsResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);

  objc_storeStrong((id *)&self->_fetchOptions, 0);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (NSArray)objects
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PHRecentContentSyndicationCollectionsResult;
  v2 = [(PHFetchResult *)&v4 description];

  return v2;
}

- (unint64_t)possibleChangesForChange:(id)a3 propertiesFetchResult:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v44 = a3;
  objc_super v4 = [v44 insertedObjectIDs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v54;
    unint64_t v8 = 1;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v54 != v7) {
        objc_enumerationMutation(v4);
      }
      v10 = [*(id *)(*((void *)&v53 + 1) + 8 * v9) entity];
      v11 = [v10 name];
      v12 = [MEMORY[0x1E4F8A950] entityName];
      char v13 = [v11 isEqualToString:v12];

      if (v13) {
        break;
      }
      if (v6 == ++v9)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v53 objects:v60 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    unint64_t v8 = 0;
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v14 = [v44 deletedObjectIDs];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    unint64_t v41 = v8;
    uint64_t v17 = *(void *)v50;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v50 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v20 = [v19 entity];
        v21 = [v20 name];
        v22 = [MEMORY[0x1E4F8A950] entityName];
        int v23 = [v21 isEqualToString:v22];

        if (v23)
        {
          v24 = [(PHRecentContentSyndicationCollectionsResult *)self _transientCollectionForAssetOID:v19];

          if (v24)
          {
            unint64_t v8 = v41 | 0xA;
            goto LABEL_21;
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v49 objects:v59 count:16];
      if (v16) {
        continue;
      }
      break;
    }
    unint64_t v8 = v41;
  }
LABEL_21:

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v25 = [v44 updatedObjectIDs];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v45 objects:v58 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    unint64_t v42 = v8;
    uint64_t v28 = *(void *)v46;
    while (2)
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v46 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v45 + 1) + 8 * j);
        v31 = [v30 entity];
        v32 = [v31 name];
        v33 = [MEMORY[0x1E4F8A950] entityName];
        int v34 = [v32 isEqualToString:v33];

        if (v34)
        {
          v35 = (void *)MEMORY[0x1E4F8AAF8];
          v57[0] = @"syndicationState";
          v57[1] = @"savedAssetType";
          v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
          v37 = [MEMORY[0x1E4F8A950] entityName];
          uint64_t v38 = [v35 indexValueForAttributeNames:v36 entity:v37];

          v39 = [v30 entity];
          LOBYTE(v38) = [v44 anyUpdatedObjectsWithChangedAttributes:v38 ofEntity:v39];

          if (v38)
          {
            unint64_t v8 = 11;
            goto LABEL_32;
          }
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v45 objects:v58 count:16];
      if (v27) {
        continue;
      }
      break;
    }
    unint64_t v8 = v42;
  }
LABEL_32:

  return v8;
}

- (void)updateRegistrationForChangeNotificationDeltas
{
}

- (id)objectIDAtIndex:(unint64_t)a3
{
  objc_super v4 = [(PHRecentContentSyndicationCollectionsResult *)self objects];
  uint64_t v5 = [v4 objectAtIndex:a3];
  uint64_t v6 = [v5 objectID];

  return v6;
}

- (id)containerIdentifier
{
  return 0;
}

- (int64_t)collectionFetchType
{
  return 1;
}

- (id)fetchSortDescriptors
{
  return 0;
}

- (id)fetchRequest
{
  return 0;
}

- (id)photoLibrary
{
  return self->_photoLibrary;
}

- (id)additionalChangedIdentifiersFromPreviousIdentifiers:(id)a3 currentIdentifiers:(id)a4 inFetchResultBeforeChanges:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v26 = v8;
  v11 = [MEMORY[0x1E4F1CA80] setWithArray:v8];
  v25 = v9;
  v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
  [v11 intersectSet:v12];

  id v30 = v10;
  v29 = self;
  objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v11, "count"));
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v11;
  uint64_t v13 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x19F389B10]();
        v19 = [v30 _transientCollectionForIdentifier:v17];
        v20 = [(PHRecentContentSyndicationCollectionsResult *)v29 _transientCollectionForIdentifier:v17];
        v21 = [v19 assetOids];
        v22 = [v20 assetOids];
        char v23 = [v21 isEqualToArray:v22];

        if ((v23 & 1) == 0) {
          [v27 addObject:v17];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v14);
  }

  return v27;
}

- (id)changeHandlingValueUsingSeedOids:(id)a3 withChange:(id)a4 usingManagedObjectContext:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_28316];
  id v8 = [v6 deletedObjectIDs];
  id v9 = [v8 filteredSetUsingPredicate:v7];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = -[PHRecentContentSyndicationCollectionsResult _transientCollectionForAssetOID:](self, "_transientCollectionForAssetOID:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);

        if (v15)
        {

          goto LABEL_12;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  uint64_t v16 = [v6 updatedObjectIDs];
  uint64_t v17 = [v16 filteredSetUsingPredicate:v7];

  uint64_t v18 = [v17 count];
  if (v18)
  {
LABEL_12:
    +[PHAssetCollection fetchRecentContentSyndicationAssetCollectionsWithOptions:maxNumberOfStacks:maxNumberOfAssetsPerStack:](PHAssetCollection, "fetchRecentContentSyndicationAssetCollectionsWithOptions:maxNumberOfStacks:maxNumberOfAssetsPerStack:", self->_fetchOptions, self->_maxNumberOfStacks, self->_maxNumberOfAssetsPerStack, (void)v22);
    v19 = (PHRecentContentSyndicationCollectionsResult *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = self;
  }
  v20 = v19;

  return v20;
}

uint64_t __117__PHRecentContentSyndicationCollectionsResult_changeHandlingValueUsingSeedOids_withChange_usingManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 entity];
  v3 = [v2 name];
  objc_super v4 = [MEMORY[0x1E4F8A950] entityName];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)changeHandlingKey
{
  return self->_identifier;
}

- (id)copyWithOptions:(id)a3
{
  objc_super v4 = [(PHRecentContentSyndicationCollectionsResult *)self objects];
  uint64_t v5 = [PHRecentContentSyndicationCollectionsResult alloc];
  photoLibrary = self->_photoLibrary;
  fetchOptions = self->_fetchOptions;
  int64_t maxNumberOfStacks = self->_maxNumberOfStacks;
  int64_t maxNumberOfAssetsPerStack = self->_maxNumberOfAssetsPerStack;
  fetchType = self->super._fetchType;
  fetchPropertySets = self->super._fetchPropertySets;
  identifier = self->_identifier;
  LOBYTE(v15) = [(PHFetchResult *)self isRegisteredForChangeNotificationDeltas];
  uint64_t v13 = [(PHRecentContentSyndicationCollectionsResult *)v5 initWithObjects:v4 photoLibrary:photoLibrary fetchOptions:fetchOptions maxNumberOfStacks:maxNumberOfStacks maxNumberOfAssetsPerStack:maxNumberOfAssetsPerStack fetchType:fetchType fetchPropertySets:fetchPropertySets identifier:identifier registerIfNeeded:v15];

  return v13;
}

- (unint64_t)hash
{
  v3 = [(PHRecentContentSyndicationCollectionsResult *)self identifier];
  objc_super v4 = v3;
  if (v3)
  {
    id v5 = (id)[v3 hash];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PHRecentContentSyndicationCollectionsResult;
    id v5 = [(PHRecentContentSyndicationCollectionsResult *)&v8 hash];
  }
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHRecentContentSyndicationCollectionsResult;
  if ([(PHRecentContentSyndicationCollectionsResult *)&v9 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    unint64_t v6 = [(PHRecentContentSyndicationCollectionsResult *)self identifier];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v7 = [v4 identifier];
      char v5 = [v6 isEqualToString:v7];
    }
    else
    {
      char v5 = 0;
    }
  }
  return v5;
}

- (PHRecentContentSyndicationCollectionsResult)initWithObjects:(id)a3 photoLibrary:(id)a4 fetchOptions:(id)a5 maxNumberOfStacks:(int64_t)a6 maxNumberOfAssetsPerStack:(int64_t)a7 fetchType:(id)a8 fetchPropertySets:(id)a9 identifier:(id)a10 registerIfNeeded:(BOOL)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v36.receiver = self;
  v36.super_class = (Class)PHRecentContentSyndicationCollectionsResult;
  long long v23 = [(PHFetchResult *)&v36 init];
  if (v23)
  {
    uint64_t v24 = [v17 copy];
    objects = v23->_objects;
    v23->_objects = (NSArray *)v24;

    uint64_t v26 = [v20 copy];
    fetchType = v23->super._fetchType;
    v23->super._fetchType = (NSString *)v26;

    uint64_t v28 = [v19 copy];
    fetchOptions = v23->_fetchOptions;
    v23->_fetchOptions = (PHFetchOptions *)v28;

    uint64_t v30 = [v21 copy];
    fetchPropertySets = v23->super._fetchPropertySets;
    v23->super._fetchPropertySets = (NSSet *)v30;

    v23->_int64_t maxNumberOfStacks = a6;
    v23->_int64_t maxNumberOfAssetsPerStack = a7;
    id v32 = v18;
    if (!v32)
    {
      long long v33 = [v17 firstObject];
      id v32 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v19 object:v33];
    }
    objc_storeStrong((id *)&v23->_photoLibrary, v32);
    if (!v22)
    {
      long long v34 = [MEMORY[0x1E4F29128] UUID];
      id v22 = [v34 UUIDString];
    }
    objc_storeStrong((id *)&v23->_identifier, v22);
    if (a11) {
      [(PHFetchResult *)v23 setRegisteredForChangeNotificationDeltas:1];
    }
  }
  return v23;
}

- (id)_transientCollectionForAssetOID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v10, 0, sizeof(v10));
  char v5 = self->_objects;
  if ([(NSArray *)v5 countByEnumeratingWithState:v10 objects:v11 count:16])
  {
    unint64_t v6 = (void *)**((void **)&v10[0] + 1);
    uint64_t v7 = objc_msgSend(**((id **)&v10[0] + 1), "assetOids", *(void *)&v10[0]);
    [v7 containsObject:v4];

    id v8 = v6;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_transientCollectionForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v5 = self->_objects;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_super v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "transientIdentifier", (void)v13);
        int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_hasReachedGroupCapacity
{
  return [(NSArray *)self->_objects count] == self->_maxNumberOfStacks;
}

+ (id)pointerComparableIdentifiersFromIdentifiers:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = v3;
    char v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "longLongValue", (void)v19);
          uint64_t v12 = [NSNumber numberWithLongLong:v11];
          long long v13 = (void *)v12;
          if (v11 < 1 || (v12 & 0x8000000000000000) == 0)
          {
            long long v14 = PLPhotoKitGetLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134217984;
              uint64_t v24 = v11;
              _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_ERROR, "Unable to translate value: %lld in PHRecentContentSyndicationCollectionsResult to a tagged pointer equivalent.", buf, 0xCu);
            }

            goto LABEL_15;
          }
          [v5 addObject:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    if (v5)
    {
      uint64_t v15 = [v5 count];
      if (v15 == [v6 count])
      {
        id v16 = v5;
        char v5 = v16;
        goto LABEL_20;
      }
    }
  }
  else
  {
    char v5 = 0;
  }
  id v16 = v3;
LABEL_20:
  id v17 = v16;

  return v17;
}

@end