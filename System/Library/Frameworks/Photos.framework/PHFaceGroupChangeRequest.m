@interface PHFaceGroupChangeRequest
+ (id)changeRequestForFaceGroup:(id)a3;
+ (id)creationRequestForFaceGroup;
+ (void)deleteFaceGroups:(id)a3;
- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (NSString)managedEntityName;
- (PHFaceGroupChangeRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHFaceGroupChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (PHObjectPlaceholder)placeholderForCreatedFaceGroup;
- (PHRelationshipChangeRequestHelper)facesHelper;
- (PHRelationshipChangeRequestHelper)keyFaceHelper;
- (id)_existentFaceObjectIDs;
- (id)_mutableKeyFaceObjectIDsAndUUIDs;
- (id)_mutableObjectIDsAndUUIDs;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)initForNewObject;
- (int64_t)personBuilderState;
- (int64_t)unnamedFaceCount;
- (void)_prefetchFacesAndPersonRelationship:(id)a3 inContext:(id)a4;
- (void)_prepareFacesHelperIfNeeded;
- (void)_prepareKeyFaceHelperIfNeeded;
- (void)_setOriginalFaceGroup:(id)a3;
- (void)addFaces:(id)a3;
- (void)encodeToXPCDict:(id)a3;
- (void)removeFaces:(id)a3;
- (void)setKeyFace:(id)a3;
- (void)setPersonBuilderState:(int64_t)a3;
- (void)setUnnamedFaceCount:(int64_t)a3;
@end

@implementation PHFaceGroupChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyFaceHelper, 0);
  objc_storeStrong((id *)&self->_facesHelper, 0);

  objc_storeStrong((id *)&self->_originalFaceGroup, 0);
}

- (PHRelationshipChangeRequestHelper)keyFaceHelper
{
  return self->_keyFaceHelper;
}

- (PHRelationshipChangeRequestHelper)facesHelper
{
  return self->_facesHelper;
}

- (void)setPersonBuilderState:(int64_t)a3
{
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithInteger:a3];
  v6 = [(PHChangeRequest *)self helper];
  v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"personBuilderState"];
}

- (int64_t)personBuilderState
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"personBuilderState"];

  int64_t v6 = (int)[v5 intValue];
  return v6;
}

- (void)setKeyFace:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    if (!v5) {
      goto LABEL_10;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PHFaceGroupChangeRequest.m", 305, @"keyFace has incorrect class: %@", v5 object file lineNumber description];

    if (!v5) {
      goto LABEL_10;
    }
  }
  [(PHChangeRequest *)self didMutate];
  int64_t v6 = [MEMORY[0x1E4F1CA48] array];
  v7 = PLObjectIDOrUUIDFromPHObject(v5);
  [v6 addObject:v7];
  id v8 = (void *)MEMORY[0x1E4F1CA80];
  v9 = [(PHFaceGroupChangeRequest *)self _existentFaceObjectIDs];
  v10 = [v8 setWithArray:v9];

  v11 = [(PHRelationshipChangeRequestHelper *)self->_facesHelper mutableObjectIDsAndUUIDs];
  if ([v11 count])
  {
    v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
    [v10 unionSet:v12];
  }
  if (([v10 containsObject:v7] & 1) == 0)
  {
    v16[0] = v5;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [(PHFaceGroupChangeRequest *)self addFaces:v13];
  }
  if (v6)
  {
    v14 = [(PHFaceGroupChangeRequest *)self _mutableKeyFaceObjectIDsAndUUIDs];
    [v14 addObjectsFromArray:v6];
  }
LABEL_10:
}

- (void)_setOriginalFaceGroup:(id)a3
{
}

- (void)removeFaces:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (!v7)
        {
          [(PHChangeRequest *)self didMutate];
          v7 = [MEMORY[0x1E4F1CA48] array];
        }
        v11 = PLObjectIDOrUUIDFromPHObject(v10);
        [v7 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
    if (v7)
    {
      v12 = [(PHFaceGroupChangeRequest *)self _mutableObjectIDsAndUUIDs];
      [v12 removeObjectsInArray:v7];
    }
  }
}

- (void)addFaces:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (!v7)
        {
          [(PHChangeRequest *)self didMutate];
          v7 = [MEMORY[0x1E4F1CA48] array];
        }
        v11 = PLObjectIDOrUUIDFromPHObject(v10);
        [v7 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
    if (v7)
    {
      v12 = [(PHFaceGroupChangeRequest *)self _mutableObjectIDsAndUUIDs];
      [v12 addObjectsFromArray:v7];
    }
  }
}

- (id)_mutableKeyFaceObjectIDsAndUUIDs
{
  [(PHFaceGroupChangeRequest *)self _prepareKeyFaceHelperIfNeeded];
  keyFaceHelper = self->_keyFaceHelper;

  return [(PHRelationshipChangeRequestHelper *)keyFaceHelper mutableObjectIDsAndUUIDs];
}

- (id)_mutableObjectIDsAndUUIDs
{
  [(PHFaceGroupChangeRequest *)self _prepareFacesHelperIfNeeded];
  facesHelper = self->_facesHelper;

  return [(PHRelationshipChangeRequestHelper *)facesHelper mutableObjectIDsAndUUIDs];
}

- (void)_prepareFacesHelperIfNeeded
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHRelationshipChangeRequestHelper *)self->_facesHelper originalObjectIDs];

  if (!v3)
  {
    if (self->_originalFaceGroup)
    {
      id v4 = [(PHFaceGroupChangeRequest *)self _existentFaceObjectIDs];
      uint64_t v5 = [(PHRelationshipChangeRequestHelper *)self->_facesHelper originalObjectIDs];

      if (!v5) {
        [(PHRelationshipChangeRequestHelper *)self->_facesHelper setOriginalObjectIDs:v4];
      }
    }
    uint64_t v6 = [(PHRelationshipChangeRequestHelper *)self->_facesHelper originalObjectIDs];

    if (!v6) {
      [(PHRelationshipChangeRequestHelper *)self->_facesHelper setOriginalObjectIDs:MEMORY[0x1E4F1CBF0]];
    }
  }
  v7 = [(PHRelationshipChangeRequestHelper *)self->_facesHelper mutableObjectIDsAndUUIDs];

  if (!v7)
  {
    facesHelper = self->_facesHelper;
    id v10 = [(PHRelationshipChangeRequestHelper *)facesHelper originalObjectIDs];
    v9 = (void *)[v10 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)facesHelper setMutableObjectIDsAndUUIDs:v9];
  }
}

- (void)_prepareKeyFaceHelperIfNeeded
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHRelationshipChangeRequestHelper *)self->_keyFaceHelper originalObjectIDs];

  if (!v3)
  {
    id v4 = [(PHRelationshipChangeRequestHelper *)self->_keyFaceHelper originalObjectIDs];

    if (!v4) {
      [(PHRelationshipChangeRequestHelper *)self->_keyFaceHelper setOriginalObjectIDs:MEMORY[0x1E4F1CBF0]];
    }
  }
  uint64_t v5 = [(PHRelationshipChangeRequestHelper *)self->_keyFaceHelper mutableObjectIDsAndUUIDs];

  if (!v5)
  {
    keyFaceHelper = self->_keyFaceHelper;
    id v8 = [(PHRelationshipChangeRequestHelper *)keyFaceHelper originalObjectIDs];
    v7 = (void *)[v8 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)keyFaceHelper setMutableObjectIDsAndUUIDs:v7];
  }
}

- (id)_existentFaceObjectIDs
{
  if (self->_originalFaceGroup)
  {
    v3 = [(PHChangeRequest *)self photoLibrary];
    id v4 = [v3 librarySpecificFetchOptions];

    [v4 setIncludedDetectionTypes:&unk_1EEB26880];
    uint64_t v5 = +[PHQuery queryForFacesInFaceGroup:self->_originalFaceGroup options:v4];
    uint64_t v6 = [v5 executeQuery];
    v7 = [v6 fetchedObjectIDs];
  }
  else
  {
    v7 = [MEMORY[0x1E4F1C978] array];
  }

  return v7;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1E4F8A7B8];
  v7 = [a3 managedObjectContext];
  id v8 = [v6 insertInManagedObjectContext:v7];

  if (!a4 || v8)
  {
    v12 = [(PHChangeRequest *)self uuid];
    [v8 setUuid:v12];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    id v10 = [NSString stringWithFormat:@"Failed to create face group"];
    v15[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    objc_msgSend(v9, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)_prefetchFacesAndPersonRelationship:(id)a3 inContext:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x19F389B10]();
  id v8 = (void *)MEMORY[0x1E4F1C0D0];
  v9 = [MEMORY[0x1E4F8A7B0] entityName];
  id v10 = [v8 fetchRequestWithEntityName:v9];

  v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v5];
  [v10 setPredicate:v11];

  v19[0] = @"personForFace";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v10 setRelationshipKeyPathsForPrefetching:v12];

  [v10 setReturnsObjectsAsFaults:0];
  id v16 = 0;
  long long v13 = [v6 executeFetchRequest:v10 error:&v16];
  id v14 = v16;
  if (!v13)
  {
    long long v15 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v14;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "Unable to prefetch faces: %@", buf, 0xCu);
    }
  }
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [(PHChangeRequest *)self helper];
  id v45 = 0;
  int v9 = [v8 applyMutationsToManagedObject:v7 error:&v45];
  id v10 = v45;

  if (v9)
  {
    v11 = [v7 associatedPerson];
    if (!v11)
    {
      [MEMORY[0x1E4F8AA10] createAssociatedPersonForFaceGroup:v7];
      v11 = [v7 associatedPerson];
    }
    v12 = [(PHFaceGroupChangeRequest *)self facesHelper];
    long long v13 = [v12 mutableObjectIDsAndUUIDs];

    if (v13)
    {
      [v12 setAllowsInsert:1];
      [v12 setAllowsMove:0];
      [v12 setAllowsRemove:1];
      [v12 setDestinationEntityName:@"DetectedFace"];
      id v14 = [v7 mutableDetectedFaces];
      id v44 = v10;
      int v37 = [v12 applyMutationsToManagedObject:v7 unorderedMutableChildren:v14 error:&v44];
      id v38 = v44;

      long long v15 = [v7 managedObjectContext];
      [(PHFaceGroupChangeRequest *)self _prefetchFacesAndPersonRelationship:v14 inContext:v15];

      id v16 = objc_msgSend(v14, "_pl_filter:", &__block_literal_global_8094);
      [v11 setDetectedFaces:v16];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v17 = v14;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v50 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v41 != v20) {
              objc_enumerationMutation(v17);
            }
            [*(id *)(*((void *)&v40 + 1) + 8 * i) fixPersonRelationshipsForFaceTorsoOrTemporal];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v40 objects:v50 count:16];
        }
        while (v19);
      }

      v22 = [(PHFaceGroupChangeRequest *)self keyFaceHelper];
      if (!v37)
      {
        char v23 = 0;
        id v10 = v38;
        goto LABEL_21;
      }
      id v10 = v38;
    }
    else
    {
      v22 = [(PHFaceGroupChangeRequest *)self keyFaceHelper];
    }
    v24 = [v22 mutableObjectIDsAndUUIDs];

    if (v24)
    {
      [v22 setAllowsInsert:1];
      [v22 setDestinationEntityName:@"DetectedFace"];
      id v39 = v10;
      char v23 = [v22 applyMutationsToManagedObjectToOneRelationship:v7 error:&v39];
      id v25 = v39;

      id v10 = v25;
    }
    else
    {
      char v23 = 1;
    }
LABEL_21:
    v26 = [v7 keyFace];
    if (v26
      && ([v11 detectedFaces],
          v27 = objc_claimAutoreleasedReturnValue(),
          char v28 = [v27 containsObject:v26],
          v27,
          (v28 & 1) == 0))
    {
      v34 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = [v11 faceGroupDescription];
        *(_DWORD *)buf = 138412546;
        id v47 = v7;
        __int16 v48 = 2112;
        v49 = v35;
        _os_log_impl(&dword_19B043000, v34, OS_LOG_TYPE_DEFAULT, "Cleearing key face for face group %@ and associated person : %@", buf, 0x16u);
      }
      [v7 setKeyFace:0];
      v33 = 0;
    }
    else
    {
      v29 = [v26 personBeingKeyFace];

      if (v29) {
        goto LABEL_33;
      }
      v30 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        id v47 = v7;
        __int16 v48 = 2112;
        v49 = v26;
        _os_log_impl(&dword_19B043000, v30, OS_LOG_TYPE_DEBUG, "Face group should have key face: %@, %@", buf, 0x16u);
      }

      v31 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = [v11 faceGroupDescription];
        *(_DWORD *)buf = 138412546;
        id v47 = v32;
        __int16 v48 = 2112;
        v49 = v26;
        _os_log_impl(&dword_19B043000, v31, OS_LOG_TYPE_DEFAULT, "Setting key face of associated person %@ to face %@", buf, 0x16u);
      }
      v33 = v26;
    }
    [v11 setKeyFace:v33 pickSource:0];
LABEL_33:

    if (!a5) {
      goto LABEL_36;
    }
    goto LABEL_34;
  }
  char v23 = 0;
  if (!a5) {
    goto LABEL_36;
  }
LABEL_34:
  if ((v23 & 1) == 0) {
    *a5 = v10;
  }
LABEL_36:

  return v23;
}

BOOL __77__PHFaceGroupChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = 1;
  v3 = [a2 associatedPersonForFaceOrTorso:1 orTemporal:0];
  id v4 = v3;
  if (v3) {
    BOOL v2 = [v3 verifiedType] == 0;
  }

  return v2;
}

- (NSString)managedEntityName
{
  return (NSString *)@"DetectedFaceGroup";
}

- (void)setUnnamedFaceCount:(int64_t)a3
{
  id v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithInteger:a3];
  id v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"unnamedFaceCount"];
}

- (int64_t)unnamedFaceCount
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  id v5 = [v4 objectForKey:@"unnamedFaceCount"];

  int64_t v6 = (int)[v5 intValue];
  return v6;
}

- (PHObjectPlaceholder)placeholderForCreatedFaceGroup
{
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 placeholderForCreatedObjectWithClass:objc_opt_class() changeRequest:self];

  return (PHObjectPlaceholder *)v4;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 encodeToXPCDict:v4];

  int64_t v6 = [(PHFaceGroupChangeRequest *)self facesHelper];
  [v6 encodeToXPCDict:v4];

  id v7 = [(PHFaceGroupChangeRequest *)self keyFaceHelper];
  [v7 encodeToXPCDict:v4];
}

- (PHFaceGroupChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PHFaceGroupChangeRequest;
  v11 = [(PHChangeRequest *)&v19 init];
  if (v11)
  {
    v12 = [[PHChangeRequestHelper alloc] initWithXPCDict:v8 changeRequest:v11 request:v9 clientAuthorization:v10];
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      id v14 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"faces" xpcDict:v8 changeRequestHelper:v11->super._helper];
      facesHelper = v11->_facesHelper;
      v11->_facesHelper = v14;

      id v16 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"keyFace" xpcDict:v8 changeRequestHelper:v11->super._helper];
      keyFaceHelper = v11->_keyFaceHelper;
      v11->_keyFaceHelper = v16;
    }
  }

  return v11;
}

- (PHFaceGroupChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHFaceGroupChangeRequest;
  id v8 = [(PHChangeRequest *)&v16 init];
  if (v8)
  {
    id v9 = [[PHChangeRequestHelper alloc] initWithUUID:v6 objectID:v7 changeRequest:v8];
    helper = v8->super._helper;
    v8->super._helper = v9;

    v11 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"faces" changeRequestHelper:v8->super._helper];
    facesHelper = v8->_facesHelper;
    v8->_facesHelper = v11;

    long long v13 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"keyFace" changeRequestHelper:v8->super._helper];
    keyFaceHelper = v8->_keyFaceHelper;
    v8->_keyFaceHelper = v13;
  }
  return v8;
}

- (id)initForNewObject
{
  v10.receiver = self;
  v10.super_class = (Class)PHFaceGroupChangeRequest;
  BOOL v2 = [(PHChangeRequest *)&v10 init];
  if (v2)
  {
    v3 = [[PHChangeRequestHelper alloc] initForNewObjectWithChangeRequest:v2];
    helper = v2->super._helper;
    v2->super._helper = v3;

    id v5 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"faces" changeRequestHelper:v2->super._helper];
    facesHelper = v2->_facesHelper;
    v2->_facesHelper = v5;

    id v7 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"keyFace" changeRequestHelper:v2->super._helper];
    keyFaceHelper = v2->_keyFaceHelper;
    v2->_keyFaceHelper = v7;
  }
  return v2;
}

+ (void)deleteFaceGroups:(id)a3
{
  id v5 = a3;
  id v4 = +[PHObjectDeleteRequest deleteRequestsForObjects:v5 ofType:objc_opt_class() forSelector:a2];
}

+ (id)changeRequestForFaceGroup:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = +[PHChangeRequestHelper changeRequestForObject:v3];
    [v4 _setOriginalFaceGroup:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)creationRequestForFaceGroup
{
  id v2 = [[PHFaceGroupChangeRequest alloc] initForNewObject];

  return v2;
}

@end