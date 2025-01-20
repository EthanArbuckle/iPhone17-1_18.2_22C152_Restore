@interface PHShareRelationshipChangeRequestHelper
- (BOOL)applyMutationsToManagedObject:(id)a3 error:(id *)a4;
- (PHObject)originalAsset;
- (PHShare)originalShare;
- (id)_mutableParticipantsObjectIDsAndUUIDs;
- (void)_prepareParticipantsHelperIfNeeded;
- (void)_prepareParticipantsWithFetchResult:(id)a3;
- (void)addParticipants:(id)a3 toChangeRequest:(id)a4;
- (void)removeParticipants:(id)a3 toChangeRequest:(id)a4;
- (void)setOriginalAsset:(id)a3;
- (void)setOriginalShare:(id)a3;
- (void)setParticipants:(id)a3 toChangeRequest:(id)a4;
@end

@implementation PHShareRelationshipChangeRequestHelper

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_originalAsset);

  objc_destroyWeak((id *)&self->_originalShare);
}

- (void)setOriginalAsset:(id)a3
{
}

- (PHObject)originalAsset
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalAsset);

  return (PHObject *)WeakRetained;
}

- (void)setOriginalShare:(id)a3
{
}

- (PHShare)originalShare
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalShare);

  return (PHShare *)WeakRetained;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(PHRelationshipChangeRequestHelper *)self mutableObjectIDsAndUUIDs];

  if (v7)
  {
    [(PHRelationshipChangeRequestHelper *)self setAllowsInsert:1];
    [(PHRelationshipChangeRequestHelper *)self setAllowsMove:0];
    [(PHRelationshipChangeRequestHelper *)self setAllowsRemove:1];
    [(PHRelationshipChangeRequestHelper *)self setDestinationEntityName:@"ShareParticipant"];
    v8 = [(PHRelationshipChangeRequestHelper *)self relationshipName];
    v9 = [v6 mutableSetValueForKey:v8];

    BOOL v10 = [(PHRelationshipChangeRequestHelper *)self applyMutationsToManagedObject:v6 unorderedMutableChildren:v9 error:a4];
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (void)setParticipants:(id)a3 toChangeRequest:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PHShareRelationshipChangeRequestHelper *)self _mutableParticipantsObjectIDsAndUUIDs];
  [v8 removeAllObjects];

  v9 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = PLObjectIDOrUUIDFromPHObject(*(void **)(*((void *)&v17 + 1) + 8 * v14));
        objc_msgSend(v9, "addObject:", v15, (void)v17);

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  if ([v9 count])
  {
    [v7 didMutate];
    v16 = [(PHShareRelationshipChangeRequestHelper *)self _mutableParticipantsObjectIDsAndUUIDs];
    [v16 addObjectsFromArray:v9];
  }
}

- (void)removeParticipants:(id)a3 toChangeRequest:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = PLObjectIDOrUUIDFromPHObject(*(void **)(*((void *)&v16 + 1) + 8 * v13));
        objc_msgSend(v8, "addObject:", v14, (void)v16);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  if ([v8 count])
  {
    [v7 didMutate];
    v15 = [(PHShareRelationshipChangeRequestHelper *)self _mutableParticipantsObjectIDsAndUUIDs];
    [v15 removeObjectsInArray:v8];
  }
}

- (void)addParticipants:(id)a3 toChangeRequest:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = PLObjectIDOrUUIDFromPHObject(*(void **)(*((void *)&v16 + 1) + 8 * v13));
        objc_msgSend(v8, "addObject:", v14, (void)v16);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  if ([v8 count])
  {
    [v7 didMutate];
    v15 = [(PHShareRelationshipChangeRequestHelper *)self _mutableParticipantsObjectIDsAndUUIDs];
    [v15 addObjectsFromArray:v8];
  }
}

- (id)_mutableParticipantsObjectIDsAndUUIDs
{
  [(PHShareRelationshipChangeRequestHelper *)self _prepareParticipantsHelperIfNeeded];

  return [(PHRelationshipChangeRequestHelper *)self mutableObjectIDsAndUUIDs];
}

- (void)_prepareParticipantsHelperIfNeeded
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHRelationshipChangeRequestHelper *)self originalObjectIDs];

  if (v3) {
    goto LABEL_9;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalShare);

  if (WeakRetained)
  {
    v5 = +[PHPhotoLibrary photoLibraryForCurrentTransaction];
    id v6 = [v5 librarySpecificFetchOptions];

    id v7 = objc_loadWeakRetained((id *)&self->_originalShare);
    v8 = +[PHQuery queryForShareParticipantsInShare:v7 options:v6];

    id v9 = [v8 executeQuery];
    [(PHShareRelationshipChangeRequestHelper *)self _prepareParticipantsWithFetchResult:v9];
  }
  else
  {
    id v10 = objc_loadWeakRetained((id *)&self->_originalAsset);

    if (!v10) {
      goto LABEL_7;
    }
    uint64_t v11 = +[PHPhotoLibrary photoLibraryForCurrentTransaction];
    id v6 = [v11 librarySpecificFetchOptions];

    id v12 = objc_loadWeakRetained((id *)&self->_originalAsset);
    v8 = +[PHShareParticipant fetchContributorsForAsset:v12 options:v6];

    [(PHShareRelationshipChangeRequestHelper *)self _prepareParticipantsWithFetchResult:v8];
  }

LABEL_7:
  uint64_t v13 = [(PHRelationshipChangeRequestHelper *)self originalObjectIDs];

  if (!v13) {
    [(PHRelationshipChangeRequestHelper *)self setOriginalObjectIDs:MEMORY[0x1E4F1CBF0]];
  }
LABEL_9:
  uint64_t v14 = [(PHRelationshipChangeRequestHelper *)self mutableObjectIDsAndUUIDs];

  if (!v14)
  {
    id v16 = [(PHRelationshipChangeRequestHelper *)self originalObjectIDs];
    v15 = (void *)[v16 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)self setMutableObjectIDsAndUUIDs:v15];
  }
}

- (void)_prepareParticipantsWithFetchResult:(id)a3
{
  id v6 = a3;
  +[PHPhotoLibrary assertTransaction];
  v4 = [(PHRelationshipChangeRequestHelper *)self originalObjectIDs];

  if (!v4)
  {
    v5 = [v6 fetchedObjectIDs];
    [(PHRelationshipChangeRequestHelper *)self setOriginalObjectIDs:v5];
  }
}

@end