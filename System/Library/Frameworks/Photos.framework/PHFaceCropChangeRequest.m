@interface PHFaceCropChangeRequest
+ (id)_creationRequestForFaceCropWithOriginatingFace:(id)a3 resourceData:(id)a4 person:(id)a5;
+ (id)_creationRequestForFaceCropWithOriginatingFace:(id)a3 resourceData:(id)a4 personLocalIdentifier:(id)a5;
+ (id)changeRequestForFaceCrop:(id)a3;
+ (id)creationRequestForFaceCropCopyFromFaceCrop:(id)a3 withType:(signed __int16)a4 onPerson:(id)a5;
+ (id)creationRequestsForFaceCropsWithOriginatingFace:(id)a3 resourceData:(id)a4;
+ (void)deleteFaceCrops:(id)a3;
- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (NSData)resourceData;
- (NSString)managedEntityName;
- (NSString)originatingFaceCropUUID;
- (NSString)originatingFaceUUID;
- (PHFaceCropChangeRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHFaceCropChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (PHObjectPlaceholder)placeholderForCreatedFaceCrop;
- (PHRelationshipChangeRequestHelper)faceHelper;
- (PHRelationshipChangeRequestHelper)personHelper;
- (id)_mutableFaceObjectIDsAndUUIDs;
- (id)_mutablePersonObjectIDsAndUUIDs;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)initForNewObject;
- (signed)state;
- (signed)type;
- (void)_prepareFaceHelperIfNeeded;
- (void)_preparePersonHelperIfNeeded;
- (void)encodeToXPCDict:(id)a3;
- (void)setFace:(id)a3;
- (void)setOriginatingFaceCropUUID:(id)a3;
- (void)setOriginatingFaceUUID:(id)a3;
- (void)setResourceData:(id)a3;
- (void)setState:(signed __int16)a3;
- (void)setType:(signed __int16)a3;
@end

@implementation PHFaceCropChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personHelper, 0);
  objc_storeStrong((id *)&self->_faceHelper, 0);
  objc_storeStrong((id *)&self->_originatingFaceCropUUID, 0);

  objc_storeStrong((id *)&self->_originatingFaceUUID, 0);
}

- (PHRelationshipChangeRequestHelper)personHelper
{
  return self->_personHelper;
}

- (PHRelationshipChangeRequestHelper)faceHelper
{
  return self->_faceHelper;
}

- (void)setOriginatingFaceCropUUID:(id)a3
{
}

- (NSString)originatingFaceCropUUID
{
  return self->_originatingFaceCropUUID;
}

- (void)setOriginatingFaceUUID:(id)a3
{
}

- (NSString)originatingFaceUUID
{
  return self->_originatingFaceUUID;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(PHChangeRequest *)self helper];
  id v42 = 0;
  int v11 = [v10 applyMutationsToManagedObject:v8 error:&v42];
  id v12 = v42;

  v13 = [(PHFaceCropChangeRequest *)self faceHelper];
  v14 = v13;
  if (v11)
  {
    v15 = [v13 mutableObjectIDsAndUUIDs];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      id v17 = v8;
      v18 = [v17 face];
      [v14 setAllowsInsert:1];
      [v14 setDestinationEntityName:@"DetectedFace"];
      [v14 setIsDestinationObjectValid:&__block_literal_global_112];
      id v41 = v12;
      int v19 = [v14 applyMutationsToManagedObjectToOneRelationship:v17 error:&v41];
      id v39 = v41;

      if (v19)
      {
        v37 = v18;
        id v20 = v17;
        v21 = [v20 face];
        uint64_t v38 = [v21 objectID];

        [v20 applyPropertiesToTrainingFace];
        v22 = [v20 face];
        int v23 = [v22 trainingType];
        BOOL v24 = v23 != 0;

        if (!v23)
        {
          uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3300, @"Adding a training face to a face crop with 'None' type is invalid");

          id v39 = (id)v25;
        }
        v18 = v37;
        v26 = (void *)v38;
        if (v37)
        {
          if (v38)
          {
            v27 = [v37 objectID];
            char v28 = [v27 isEqual:v38];

            v18 = v37;
            v26 = (void *)v38;
            if ((v28 & 1) == 0)
            {
              v29 = [v9 managedObjectContext];
              [v29 deleteObject:v37];

              v18 = v37;
              v26 = (void *)v38;
            }
          }
        }
      }
      else
      {
        BOOL v24 = 0;
      }

      id v12 = v39;
    }
    else
    {
      BOOL v24 = 1;
    }
  }
  else
  {
    BOOL v24 = 0;
  }

  v30 = [(PHFaceCropChangeRequest *)self personHelper];
  v31 = v30;
  if (v24)
  {
    v32 = [v30 mutableObjectIDsAndUUIDs];
    uint64_t v33 = [v32 count];

    if (!v33)
    {

      char v34 = 1;
      goto LABEL_23;
    }
    [v31 setAllowsInsert:1];
    [v31 setDestinationEntityName:@"Person"];
    [v31 setDestinationUUIDKeyPath:@"personUUID"];
    [v31 setIsDestinationObjectValid:&__block_literal_global_118];
    id v40 = v12;
    char v34 = [v31 applyMutationsToManagedObjectToOneRelationship:v8 error:&v40];
    id v35 = v40;

    id v12 = v35;
  }
  else
  {
    char v34 = 0;
  }

  if (a5 && (v34 & 1) == 0)
  {
    id v12 = v12;
    char v34 = 0;
    *a5 = v12;
  }
LABEL_23:

  return v34;
}

uint64_t __76__PHFaceCropChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_116()
{
  return 1;
}

BOOL __76__PHFaceCropChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 associatedPersonForFaceOrTorso:1 orTemporal:0];

  if (v2)
  {
    v3 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_ERROR, "Setting a detected face which already has a person on a face crop is invalid", v5, 2u);
    }
  }
  return v2 == 0;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PHFaceCropChangeRequest *)self originatingFaceCropUUID];

  if (!v7)
  {
    id v20 = (void *)MEMORY[0x1E4F8A7B0];
    v21 = [(PHFaceCropChangeRequest *)self originatingFaceUUID];
    v22 = [v6 managedObjectContext];
    int v23 = [v20 detectedFaceWithUUID:v21 inManagedObjectContext:v22];

    BOOL v24 = [v23 associatedAssetForFaceOrTorso:0 orTemporal:0];
    v66 = a4;
    if (v24)
    {
      id v16 = 0;
      int v25 = 1;
    }
    else
    {
      v26 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_ERROR, "Attempting to create a face crop for a face with no asset, this is not allowed", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3300, @"Attempting to create a face crop for a face with no asset, this is not allowed");
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      int v25 = 0;
    }
    v27 = [(PHFaceCropChangeRequest *)self _mutablePersonObjectIDsAndUUIDs];
    uint64_t v28 = [v27 firstObject];

    v29 = (void *)MEMORY[0x1E4F8AA10];
    v30 = [v6 managedObjectContext];
    v31 = v29;
    v32 = (void *)v28;
    uint64_t v33 = [v31 personWithUUID:v28 inManagedObjectContext:v30];

    v67 = (void *)v33;
    if (!v24)
    {
      uint64_t v36 = 0;
LABEL_29:
      if (v25)
      {
        uint64_t v38 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B043000, v38, OS_LOG_TYPE_ERROR, "Creating a faceCrop with 'None' type is invalid, possible race condition, correct resolution is to retry faceCrop creation request", buf, 2u);
        }
        id v39 = @"Creating a faceCrop with 'None' type is invalid, possible race condition, correct resolution is to retry faceCrop creation request";
        goto LABEL_42;
      }
LABEL_33:
      if (!v25)
      {
LABEL_43:
        v46 = v67;
        if (v66)
        {
          if (!v16)
          {
            v52 = (void *)MEMORY[0x1E4F28C58];
            v53 = [(PHFaceCropChangeRequest *)self originatingFaceUUID];
            objc_msgSend(v52, "ph_genericErrorWithLocalizedDescription:", @"Unable to create face crops for originating face UUID %@ and person UUID %@", v53, v32);
            id v16 = (id)objc_claimAutoreleasedReturnValue();
          }
          id v16 = v16;
          int v11 = 0;
          id *v66 = v16;
        }
        else
        {
          int v11 = 0;
        }
        char v50 = 1;
LABEL_49:

        if (v50) {
          goto LABEL_12;
        }
        goto LABEL_50;
      }
      v64 = v24;
      id v40 = v23;
      id v41 = v32;
      id v42 = (void *)MEMORY[0x1E4F8A7F8];
      v43 = [(PHChangeRequest *)self uuid];
      v44 = [(PHFaceCropChangeRequest *)self resourceData];
      int v11 = [v42 insertIntoPhotoLibrary:v6 withUUID:v43 resourceData:v44 type:v36];

      if (v11)
      {
        [v11 setAsset:v64];
        v32 = v41;
        if (v36 == 2)
        {
          int v23 = v40;
          v45 = [v40 associatedPersonForFaceOrTorso:1 orTemporal:0];
          v46 = v67;
          v47 = [v67 invalidMergeCandidates];
          int v48 = [v47 containsObject:v45];

          if (v48)
          {
            v49 = [v45 personUUID];
            [v11 setInvalidMergeCandidatePersonUUID:v49];
          }
          char v50 = 0;
          BOOL v24 = v64;
        }
        else
        {
          char v50 = 0;
          int v23 = v40;
          BOOL v24 = v64;
          v46 = v67;
        }
        goto LABEL_49;
      }
      uint64_t v38 = PLPhotoKitGetLog();
      v32 = v41;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B043000, v38, OS_LOG_TYPE_ERROR, "Unable to insert face crop into photo library", buf, 2u);
      }
      id v39 = @"Unable to insert face crop into photo library";
      int v23 = v40;
      BOOL v24 = v64;
LABEL_42:

      uint64_t v51 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", v39);

      id v16 = (id)v51;
      goto LABEL_43;
    }
    char v34 = [v23 rejectedPersons];
    char v35 = [v34 containsObject:v33];

    if (v35)
    {
      uint64_t v36 = 2;
      goto LABEL_33;
    }
    v37 = [v23 associatedPersonForFaceOrTorso:1 orTemporal:0];
    if ([v37 isEqual:v33])
    {
      if ([v37 verifiedType] == 1)
      {
        if ([v23 nameSource] == 1)
        {
          uint64_t v36 = 1;
          goto LABEL_28;
        }
        if ([v23 nameSource] == 3)
        {
          uint64_t v36 = 3;
          goto LABEL_28;
        }
        v61 = NSString;
        v62 = [v23 namingDescription];
        v63 = [v67 pointerDescription];
        v59 = [v61 stringWithFormat:@"Cannot create face crop for face %@ with invalid nameSource for user-verified person %@", v62, v63];

        v60 = PLPhotoKitGetLog();
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
LABEL_60:

          uint64_t v65 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3300, @"%@", v59);

          uint64_t v36 = 0;
          int v25 = 0;
          id v16 = (id)v65;
LABEL_28:

          if (v36) {
            goto LABEL_33;
          }
          goto LABEL_29;
        }
        *(_DWORD *)buf = 138412290;
        v70 = v59;
LABEL_59:
        _os_log_impl(&dword_19B043000, v60, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        goto LABEL_60;
      }
      if ([v37 verifiedType] == 2)
      {
        if ([v23 nameSource] == 5)
        {
          uint64_t v36 = 5;
          goto LABEL_28;
        }
        v56 = NSString;
        v57 = [v23 namingDescription];
        v58 = [v67 pointerDescription];
        v59 = [v56 stringWithFormat:@"Cannot create face crop for face %@ with invalid nameSource for graph-verified person %@", v57, v58];

        v60 = PLPhotoKitGetLog();
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
          goto LABEL_60;
        }
        *(_DWORD *)buf = 138412290;
        v70 = v59;
        goto LABEL_59;
      }
    }
    uint64_t v36 = 0;
    goto LABEL_28;
  }
  id v8 = (void *)MEMORY[0x1E4F8A7F8];
  id v9 = [(PHChangeRequest *)self uuid];
  v10 = [(PHFaceCropChangeRequest *)self resourceData];
  int v11 = objc_msgSend(v8, "insertIntoPhotoLibrary:withUUID:resourceData:type:", v6, v9, v10, -[PHFaceCropChangeRequest type](self, "type"));

  [v11 setState:0];
  id v12 = [(PHFaceCropChangeRequest *)self personHelper];
  v13 = [v12 mutableObjectIDsAndUUIDs];
  uint64_t v14 = [v13 count];

  if (!v14)
  {

    id v16 = 0;
    goto LABEL_50;
  }
  [v12 setAllowsInsert:1];
  [v12 setDestinationEntityName:@"Person"];
  [v12 setDestinationUUIDKeyPath:@"personUUID"];
  [v12 setIsDestinationObjectValid:&__block_literal_global_16473];
  id v68 = 0;
  int v15 = [v12 applyMutationsToManagedObjectToOneRelationship:v11 error:&v68];
  id v16 = v68;

  if (!a4 || (v15 & 1) != 0)
  {
    if (!v15)
    {
LABEL_12:
      int v19 = 0;
      goto LABEL_51;
    }
LABEL_50:
    int v19 = v11;
    goto LABEL_51;
  }
  if (!v16)
  {
    id v17 = (void *)MEMORY[0x1E4F28C58];
    v18 = [(PHFaceCropChangeRequest *)self originatingFaceCropUUID];
    objc_msgSend(v17, "ph_genericErrorWithLocalizedDescription:", @"Unable to create face crops from originating face crop with UUID %@", v18);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v16 = v16;
  int v19 = 0;
  *a4 = v16;
LABEL_51:
  id v54 = v19;

  return v54;
}

uint64_t __78__PHFaceCropChangeRequest_createManagedObjectForInsertIntoPhotoLibrary_error___block_invoke()
{
  return 1;
}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6 = [(PHFaceCropChangeRequest *)self originatingFaceCropUUID];

  if (v6) {
    return 1;
  }
  id v8 = [(PHFaceCropChangeRequest *)self originatingFaceUUID];

  if (a4 && !v8)
  {
    id v9 = @"All FaceCrops require an originating face UUID";
LABEL_10:
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3300, v9);
    BOOL v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  if (!v8) {
    return 0;
  }
  v10 = [(PHFaceCropChangeRequest *)self _mutablePersonObjectIDsAndUUIDs];
  uint64_t v11 = [v10 count];
  BOOL v7 = v11 == 1;

  if (a4 && v11 != 1)
  {
    id v9 = @"All FaceCrops require a person";
    goto LABEL_10;
  }
  return v7;
}

- (NSString)managedEntityName
{
  return (NSString *)@"FaceCrop";
}

- (void)encodeToXPCDict:(id)a3
{
  id v4 = a3;
  v5 = [(PHChangeRequest *)self helper];
  [v5 encodeToXPCDict:v4];

  id v6 = [(PHFaceCropChangeRequest *)self faceHelper];
  [v6 encodeToXPCDict:v4];

  BOOL v7 = [(PHFaceCropChangeRequest *)self personHelper];
  [v7 encodeToXPCDict:v4];

  id v8 = [(PHFaceCropChangeRequest *)self originatingFaceUUID];
  PLXPCDictionarySetString();

  id v9 = [(PHFaceCropChangeRequest *)self originatingFaceCropUUID];
  PLXPCDictionarySetString();
}

- (PHFaceCropChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PHFaceCropChangeRequest;
  uint64_t v11 = [(PHChangeRequest *)&v23 init];
  if (v11)
  {
    id v12 = [[PHChangeRequestHelper alloc] initWithXPCDict:v8 changeRequest:v11 request:v9 clientAuthorization:v10];
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      uint64_t v14 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"face" xpcDict:v8 changeRequestHelper:v11->super._helper];
      faceHelper = v11->_faceHelper;
      v11->_faceHelper = v14;

      id v16 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"person" xpcDict:v8 changeRequestHelper:v11->super._helper];
      personHelper = v11->_personHelper;
      v11->_personHelper = v16;

      uint64_t v18 = PLStringFromXPCDictionary();
      originatingFaceUUID = v11->_originatingFaceUUID;
      v11->_originatingFaceUUID = (NSString *)v18;

      uint64_t v20 = PLStringFromXPCDictionary();
      originatingFaceCropUUID = v11->_originatingFaceCropUUID;
      v11->_originatingFaceCropUUID = (NSString *)v20;
    }
  }

  return v11;
}

- (void)setType:(signed __int16)a3
{
  uint64_t v3 = a3;
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithShort:v3];
  id v6 = [(PHChangeRequest *)self helper];
  BOOL v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"type"];
}

- (signed)type
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"type"];

  LOWORD(v3) = [v5 shortValue];
  return (__int16)v3;
}

- (void)setState:(signed __int16)a3
{
  uint64_t v3 = a3;
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithShort:v3];
  id v6 = [(PHChangeRequest *)self helper];
  BOOL v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"state"];
}

- (signed)state
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"state"];

  LOWORD(v3) = [v5 shortValue];
  return (__int16)v3;
}

- (void)setResourceData:(id)a3
{
  id v10 = a3;
  id v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  BOOL v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"resourceData"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"resourceData"];
  }
  else
  {
    [v6 removeObjectForKey:@"resourceData"];

    id v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"resourceData"];
  }
}

- (NSData)resourceData
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"resourceData"];

  return (NSData *)v5;
}

- (void)setFace:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"PHFaceCropChangeRequest.m", 160, @"face has incorrect class: %@", v9 object file lineNumber description];
    }
  }
  v5 = PLObjectIDOrUUIDFromPHObject(v9);
  id v6 = [(PHFaceCropChangeRequest *)self _mutableFaceObjectIDsAndUUIDs];
  [v6 removeAllObjects];

  BOOL v7 = [(PHFaceCropChangeRequest *)self _mutableFaceObjectIDsAndUUIDs];
  [v7 addObject:v5];
}

- (id)_mutablePersonObjectIDsAndUUIDs
{
  [(PHFaceCropChangeRequest *)self _preparePersonHelperIfNeeded];
  personHelper = self->_personHelper;

  return [(PHRelationshipChangeRequestHelper *)personHelper mutableObjectIDsAndUUIDs];
}

- (id)_mutableFaceObjectIDsAndUUIDs
{
  [(PHFaceCropChangeRequest *)self _prepareFaceHelperIfNeeded];
  faceHelper = self->_faceHelper;

  return [(PHRelationshipChangeRequestHelper *)faceHelper mutableObjectIDsAndUUIDs];
}

- (void)_preparePersonHelperIfNeeded
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHRelationshipChangeRequestHelper *)self->_personHelper originalObjectIDs];

  if (!v3) {
    [(PHRelationshipChangeRequestHelper *)self->_personHelper setOriginalObjectIDs:MEMORY[0x1E4F1CBF0]];
  }
  id v4 = [(PHRelationshipChangeRequestHelper *)self->_personHelper mutableObjectIDsAndUUIDs];

  if (!v4)
  {
    personHelper = self->_personHelper;
    id v7 = [(PHRelationshipChangeRequestHelper *)personHelper originalObjectIDs];
    id v6 = (void *)[v7 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)personHelper setMutableObjectIDsAndUUIDs:v6];
  }
}

- (void)_prepareFaceHelperIfNeeded
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHRelationshipChangeRequestHelper *)self->_faceHelper originalObjectIDs];

  if (!v3) {
    [(PHRelationshipChangeRequestHelper *)self->_faceHelper setOriginalObjectIDs:MEMORY[0x1E4F1CBF0]];
  }
  id v4 = [(PHRelationshipChangeRequestHelper *)self->_faceHelper mutableObjectIDsAndUUIDs];

  if (!v4)
  {
    faceHelper = self->_faceHelper;
    id v7 = [(PHRelationshipChangeRequestHelper *)faceHelper originalObjectIDs];
    id v6 = (void *)[v7 mutableCopy];
    [(PHRelationshipChangeRequestHelper *)faceHelper setMutableObjectIDsAndUUIDs:v6];
  }
}

- (PHObjectPlaceholder)placeholderForCreatedFaceCrop
{
  uint64_t v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 placeholderForCreatedObjectWithClass:objc_opt_class() changeRequest:self];

  return (PHObjectPlaceholder *)v4;
}

- (PHFaceCropChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHFaceCropChangeRequest;
  id v8 = [(PHChangeRequest *)&v16 init];
  if (v8)
  {
    id v9 = [[PHChangeRequestHelper alloc] initWithUUID:v6 objectID:v7 changeRequest:v8];
    helper = v8->super._helper;
    v8->super._helper = v9;

    uint64_t v11 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"face" changeRequestHelper:v8->super._helper];
    faceHelper = v8->_faceHelper;
    v8->_faceHelper = v11;

    v13 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"person" changeRequestHelper:v8->super._helper];
    personHelper = v8->_personHelper;
    v8->_personHelper = v13;
  }
  return v8;
}

- (id)initForNewObject
{
  v10.receiver = self;
  v10.super_class = (Class)PHFaceCropChangeRequest;
  v2 = [(PHChangeRequest *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [[PHChangeRequestHelper alloc] initForNewObjectWithChangeRequest:v2];
    helper = v2->super._helper;
    v2->super._helper = v3;

    v5 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"face" changeRequestHelper:v2->super._helper];
    faceHelper = v2->_faceHelper;
    v2->_faceHelper = v5;

    id v7 = [[PHRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"person" changeRequestHelper:v2->super._helper];
    personHelper = v2->_personHelper;
    v2->_personHelper = v7;
  }
  return v2;
}

+ (void)deleteFaceCrops:(id)a3
{
  id v5 = a3;
  id v4 = +[PHObjectDeleteRequest deleteRequestsForObjects:v5 ofType:objc_opt_class() forSelector:a2];
}

+ (id)creationRequestsForFaceCropsWithOriginatingFace:(id)a3 resourceData:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v23 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = [v6 photoLibrary];
  id v9 = [v8 managedObjectContextForCurrentQueueQoS];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __88__PHFaceCropChangeRequest_creationRequestsForFaceCropsWithOriginatingFace_resourceData___block_invoke;
  v28[3] = &unk_1E5848EC0;
  id v10 = v6;
  id v29 = v10;
  id v30 = v9;
  id v11 = v7;
  id v31 = v11;
  id v22 = v30;
  [v30 performBlockAndWait:v28];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = +[PHObject localIdentifierWithUUID:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        int v19 = [a1 _creationRequestForFaceCropWithOriginatingFace:v10 resourceData:v23 personLocalIdentifier:v18];
        [v12 addObject:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v15);
  }

  uint64_t v20 = +[PHFaceChangeRequest changeRequestForFace:v10];
  [v20 setShouldClearFaceCropGenerationState:1];

  return v12;
}

void __88__PHFaceCropChangeRequest_creationRequestsForFaceCropsWithOriginatingFace_resourceData___block_invoke(uint64_t a1)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v3 = [MEMORY[0x1E4F8AA10] entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = (void *)MEMORY[0x1E4F8AA10];
  id v6 = [*(id *)(a1 + 32) objectID];
  id v7 = [v5 predicateForPersonsNeedingFaceCropGenerationForFaceObjectID:v6];
  [v4 setPredicate:v7];

  [v4 setResultType:2];
  v29[0] = @"personUUID";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  [v4 setPropertiesToFetch:v8];

  id v9 = *(void **)(a1 + 40);
  id v23 = 0;
  id v10 = [v9 executeFetchRequest:v4 error:&v23];
  id v11 = v23;
  if (v10)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "objectForKey:", @"personUUID", (void)v19);
          [*(id *)(a1 + 48) addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v14);
    }
  }
  else
  {
    id v12 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v18;
      __int16 v27 = 2112;
      id v28 = v11;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "Error fetching persons needing face crop generation for face %@, error %@", buf, 0x16u);
    }
  }
}

+ (id)_creationRequestForFaceCropWithOriginatingFace:(id)a3 resourceData:(id)a4 person:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [a5 localIdentifier];
  id v11 = [a1 _creationRequestForFaceCropWithOriginatingFace:v9 resourceData:v8 personLocalIdentifier:v10];

  return v11;
}

+ (id)_creationRequestForFaceCropWithOriginatingFace:(id)a3 resourceData:(id)a4 personLocalIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initForNewObject];
  [v11 setResourceData:v9];

  id v12 = [v10 uuid];

  [v11 setOriginatingFaceUUID:v12];
  uint64_t v13 = [v11 _mutablePersonObjectIDsAndUUIDs];
  uint64_t v14 = +[PHObject uuidFromLocalIdentifier:v8];

  [v13 addObject:v14];

  return v11;
}

+ (id)creationRequestForFaceCropCopyFromFaceCrop:(id)a3 withType:(signed __int16)a4 onPerson:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initForNewObject];
  id v11 = [v9 uuid];
  [v10 setOriginatingFaceCropUUID:v11];

  id v12 = [v9 resourceData];

  [v10 setResourceData:v12];
  [v10 setType:v5];
  uint64_t v13 = [v10 _mutablePersonObjectIDsAndUUIDs];
  uint64_t v14 = PLObjectIDOrUUIDFromPHObject(v8);

  [v13 addObject:v14];

  return v10;
}

+ (id)changeRequestForFaceCrop:(id)a3
{
  return +[PHChangeRequestHelper changeRequestForObject:a3];
}

@end