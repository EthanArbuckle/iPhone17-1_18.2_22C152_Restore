@interface PHMomentShareChangeRequest
+ (id)changeRequestForMomentShare:(id)a3;
+ (id)creationRequestForMomentShareWithTitle:(id)a3 publicPermission:(signed __int16)a4 creationDate:(id)a5 createMomentShareAssetsFromAssets:(id)a6 creationOptionsPerAsset:(id)a7 preview:(id)a8 originatingMomentShare:(id)a9;
+ (id)validateMomentShareCreationDate:(id)a3 error:(id *)a4;
+ (void)expungeMomentShares:(id)a3;
+ (void)trashMomentShares:(id)a3;
- (BOOL)_addSourceAssetsToMomentShare:(id)a3 error:(id *)a4;
- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5;
- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (BOOL)prepareForPhotoLibraryCheck:(id)a3 error:(id *)a4;
- (BOOL)shouldIgnoreBudgets;
- (BOOL)shouldNotifyOnUploadCompletion;
- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (NSData)previewData;
- (NSDate)creationDate;
- (NSString)managedEntityName;
- (NSString)originatingScopeIdentifier;
- (NSString)title;
- (PHMomentShareChangeRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHMomentShareChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (PHObjectPlaceholder)placeholderForCreatedMomentShare;
- (PHShareRelationshipChangeRequestHelper)participantsHelper;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)initForNewObject;
- (id)thumbnailImageData;
- (signed)mode;
- (void)_setOriginalMomentShare:(id)a3;
- (void)addParticipants:(id)a3;
- (void)createMomentShareAssetsFromAssets:(id)a3 withCreationOptionsPerAsset:(id)a4 withPreview:(id)a5;
- (void)encodeToXPCDict:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setOriginatingScopeIdentifier:(id)a3;
- (void)setPreviewData:(id)a3;
- (void)setPublicPermission:(signed __int16)a3;
- (void)setShouldIgnoreBudgets:(BOOL)a3;
- (void)setShouldNotifyOnUploadCompletion:(BOOL)a3;
- (void)setThumbnailImageData:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PHMomentShareChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantsHelper, 0);
  objc_storeStrong((id *)&self->_sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation, 0);
  objc_storeStrong((id *)&self->_sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation, 0);
  objc_storeStrong((id *)&self->_sourceAssetCMMAssetMapForCreationRequest, 0);
  objc_storeStrong((id *)&self->_sourceAssetIdentifiersForCurationSet, 0);
  objc_storeStrong((id *)&self->_sourceAssetIdentifiersForBatchedCreation, 0);
  objc_storeStrong((id *)&self->_keySourceAssetIdentifier, 0);
  objc_destroyWeak((id *)&self->_clientConnection);

  objc_storeStrong((id *)&self->_originalMomentShare, 0);
}

- (PHShareRelationshipChangeRequestHelper)participantsHelper
{
  return self->_participantsHelper;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = [(PHChangeRequest *)self helper];
  id v18 = 0;
  int v9 = [v8 applyMutationsToManagedObject:v7 error:&v18];
  id v10 = v18;

  if (v9)
  {
    participantsHelper = self->_participantsHelper;
    id v17 = v10;
    BOOL v12 = [(PHShareRelationshipChangeRequestHelper *)participantsHelper applyMutationsToManagedObject:v7 error:&v17];
    id v13 = v17;

    if (v12)
    {
      if (!self->_changedAssets)
      {
        BOOL v14 = 1;
        goto LABEL_12;
      }
      id v16 = v13;
      BOOL v14 = [(PHMomentShareChangeRequest *)self _addSourceAssetsToMomentShare:v7 error:&v16];
      id v10 = v16;

      if (!a5) {
        goto LABEL_11;
      }
    }
    else
    {
      BOOL v14 = 0;
      id v10 = v13;
      if (!a5)
      {
LABEL_11:
        id v13 = v10;
        goto LABEL_12;
      }
    }
  }
  else
  {
    BOOL v14 = 0;
    if (!a5) {
      goto LABEL_11;
    }
  }
  if (v14) {
    goto LABEL_11;
  }
  id v13 = v10;
  BOOL v14 = 0;
  *a5 = v13;
LABEL_12:

  return v14;
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  v23[7] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PHChangeRequest *)self helper];
  id v20 = 0;
  int v11 = [v10 allowMutationToManagedObject:v9 propertyKey:v8 error:&v20];

  id v12 = v20;
  if (!v11)
  {
    BOOL v14 = 0;
    if (!a5) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  v23[0] = @"title";
  v23[1] = @"publicPermission";
  v23[2] = @"momentShareAssets";
  v23[3] = @"creationDate";
  v23[4] = @"participants";
  v23[5] = @"shouldIgnoreBudgets";
  v23[6] = @"shouldNotifyOnUploadCompletion";
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:7];
  if (-[PHChangeRequest isNewRequest](self, "isNewRequest") || ([v13 containsObject:v8] & 1) != 0)
  {
    BOOL v14 = 1;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    id v16 = [NSString stringWithFormat:@"Invalid operation on key %@", v8];
    v22 = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    uint64_t v18 = objc_msgSend(v15, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v17);

    BOOL v14 = 0;
    id v12 = (id)v18;
  }

  if (a5)
  {
LABEL_9:
    if (!v14) {
      *a5 = v12;
    }
  }
LABEL_11:

  return v14;
}

- (BOOL)_addSourceAssetsToMomentShare:(id)a3 error:(id *)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v21 = a3;
  v6 = objc_msgSend([v5 alloc], "initWithCapacity:", -[NSSet count](self->_sourceAssetIdentifiersForBatchedCreation, "count"));
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSSet count](self->_sourceAssetIdentifiersForBatchedCreation, "count"));
  sourceAssetIdentifiersForBatchedCreation = self->_sourceAssetIdentifiersForBatchedCreation;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __66__PHMomentShareChangeRequest__addSourceAssetsToMomentShare_error___block_invoke;
  v24[3] = &unk_1E5846C18;
  v24[4] = self;
  id v9 = v6;
  id v25 = v9;
  id v10 = v7;
  id v26 = v10;
  [(NSSet *)sourceAssetIdentifiersForBatchedCreation enumerateObjectsUsingBlock:v24];
  int v11 = self->_sourceAssetIdentifiersForBatchedCreation;
  sourceAssetCMMAssetMapForCreationRequest = self->_sourceAssetCMMAssetMapForCreationRequest;
  id v13 = (void *)MEMORY[0x1E4F8A950];
  sourceAssetIdentifiersForCurationSet = self->_sourceAssetIdentifiersForCurationSet;
  keySourceAssetIdentifier = self->_keySourceAssetIdentifier;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientConnection);
  id v17 = [v21 photoLibrary];
  id v23 = 0;
  char v18 = [v13 createMomentShareAssetsForMomentShare:v21 batchedSourceAssetsToCopy:v11 creationRequestSourceAssetsCMMAssetsMap:sourceAssetCMMAssetMapForCreationRequest curatedSourceAssets:sourceAssetIdentifiersForCurationSet adjustmentBakeInOptionsDictionary:v9 metadataCopyOptionsDictionary:v10 keySourceAssetIdentifier:keySourceAssetIdentifier clientConnection:WeakRetained library:v17 error:&v23];

  id v19 = v23;
  if (a4 && (v18 & 1) == 0) {
    *a4 = v19;
  }

  return v18;
}

void __66__PHMomentShareChangeRequest__addSourceAssetsToMomentShare_error___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "objectForKeyedSubscript:");

  if (v3)
  {
    v4 = [*(id *)(*(void *)(a1 + 32) + 88) objectForKeyedSubscript:v11];
  }
  else
  {
    v4 = objc_alloc_init(PHAssetCreationAdjustmentBakeInOptions);
  }
  v5 = v4;
  v6 = [(PHAssetCreationAdjustmentBakeInOptions *)v4 plRepresentation];
  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v11];

  id v7 = [*(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:v11];

  if (v7)
  {
    id v8 = [*(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:v11];
  }
  else
  {
    id v8 = objc_alloc_init(PHAssetCreationMetadataCopyOptions);
  }
  id v9 = v8;
  id v10 = [(PHAssetCreationMetadataCopyOptions *)v8 plRepresentation];
  [*(id *)(a1 + 48) setObject:v10 forKeyedSubscript:v11];
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x1E4F8A9C0];
  id v7 = a3;
  id v8 = [(PHChangeRequest *)self uuid];
  id v9 = [(PHMomentShareChangeRequest *)self creationDate];
  id v10 = [(PHMomentShareChangeRequest *)self title];
  id v11 = [v6 createOwnedShareWithUUID:v8 creationDate:v9 title:v10 inPhotoLibrary:v7];

  if (a4 && !v11)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PHMomentShareChangeRequest *)self creationDate];
  id v13 = 0;
  id v8 = [(id)objc_opt_class() validateMomentShareCreationDate:v7 error:&v13];
  id v9 = v13;

  if (v8)
  {
    if ([v6 isCloudPhotoLibraryEnabled])
    {
      BOOL v10 = 1;
      goto LABEL_8;
    }
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3300, @"iCloud Photo Library is not enabled. iCPL must be enabled to create moment shares");

    id v9 = (id)v11;
  }
  if (a4)
  {
    id v9 = v9;
    BOOL v10 = 0;
    *a4 = v9;
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_8:

  return v10;
}

- (void)createMomentShareAssetsFromAssets:(id)a3 withCreationOptionsPerAsset:(id)a4 withPreview:(id)a5
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v60 = a4;
  id v57 = a5;
  v63 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v56 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v62 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v61 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v53 = self;
  if ([(PHChangeRequest *)self isNewRequest])
  {
    v54 = [(PHMomentShareChangeRequest *)self placeholderForCreatedMomentShare];
  }
  else
  {
    v54 = self->_originalMomentShare;
  }
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v79 objects:v84 count:16];
  if (v9)
  {
    v55 = 0;
    uint64_t v59 = *(void *)v80;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v80 != v59) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v79 + 1) + 8 * v10);
        if (([v11 isPhotoStreamPhoto] & 1) != 0 || objc_msgSend(v11, "isCloudSharedAsset"))
        {
          id v25 = [MEMORY[0x1E4F28B00] currentHandler];
          [v25 handleFailureInMethod:a2 object:v53 file:@"PHMomentShareChangeRequest.m" lineNumber:296 description:@"MomentShare assets must not be cloud shared or photo stream assets"];
        }
        id v12 = [v11 uuid];
        id v13 = [v60 objectForKeyedSubscript:v12];

        if (!v13) {
          id v13 = objc_alloc_init(PHAssetCreationOptions);
        }
        uint64_t v75 = 0;
        v76 = &v75;
        uint64_t v77 = 0x2020000000;
        char v78 = 0;
        BOOL v14 = [v11 photoLibrary];
        v15 = [v14 photoLibrary];

        v68[0] = MEMORY[0x1E4F143A8];
        v68[1] = 3221225472;
        v68[2] = __104__PHMomentShareChangeRequest_createMomentShareAssetsFromAssets_withCreationOptionsPerAsset_withPreview___block_invoke;
        v68[3] = &unk_1E5848D80;
        v68[4] = v11;
        id v16 = v15;
        id v69 = v16;
        v74 = &v75;
        id v17 = v13;
        v70 = v17;
        id v71 = v63;
        id v72 = v62;
        id v73 = v61;
        [v16 performBlockAndWait:v68];
        if (!*((unsigned char *)v76 + 24))
        {
          [(PHAssetCreationOptions *)v17 setShouldDownloadOrCloudReReferenceMissingResources:1];
          [(PHAssetCreationOptions *)v17 setResetUserSpecificMetadata:1];
          char v18 = +[PHAssetCreationRequest creationRequestForAssetCopyFromAsset:v11 options:v17];
          [v18 setMomentShare:v54];
          id v19 = [v18 placeholderForCreatedAsset];
          id v20 = [v19 uuid];

          id v21 = [v57 keyAsset];
          int v22 = [v11 isEqual:v21];

          if (v22)
          {
            id v23 = v20;

            v55 = v23;
          }
          v24 = [v11 uuid];
          [v56 setObject:v20 forKey:v24];
        }
        _Block_object_dispose(&v75, 8);

        ++v10;
      }
      while (v9 != v10);
      uint64_t v26 = [obj countByEnumeratingWithState:&v79 objects:v84 count:16];
      uint64_t v9 = v26;
    }
    while (v26);
  }
  else
  {
    v55 = 0;
  }

  uint64_t v27 = [v63 copy];
  sourceAssetIdentifiersForBatchedCreation = v53->_sourceAssetIdentifiersForBatchedCreation;
  v53->_sourceAssetIdentifiersForBatchedCreation = (NSSet *)v27;

  uint64_t v29 = [v56 copy];
  sourceAssetCMMAssetMapForCreationRequest = v53->_sourceAssetCMMAssetMapForCreationRequest;
  v53->_sourceAssetCMMAssetMapForCreationRequest = (NSDictionary *)v29;

  uint64_t v31 = [v62 copy];
  sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation = v53->_sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation;
  v53->_sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation = (NSDictionary *)v31;

  uint64_t v33 = [v61 copy];
  sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation = v53->_sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation;
  v53->_sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation = (NSDictionary *)v33;

  v35 = (void *)MEMORY[0x1E4F1CAD0];
  v36 = [v57 curatedAssetIdentifiers];
  uint64_t v37 = [v35 setWithArray:v36];
  sourceAssetIdentifiersForCurationSet = v53->_sourceAssetIdentifiersForCurationSet;
  v53->_sourceAssetIdentifiersForCurationSet = (NSSet *)v37;

  if (v57)
  {
    v39 = [v57 thumbnailImageData];
    [(PHMomentShareChangeRequest *)v53 setThumbnailImageData:v39];

    id v40 = objc_alloc_init(MEMORY[0x1E4F598E0]);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v41 = [v57 previewImageData];
    uint64_t v42 = [v41 countByEnumeratingWithState:&v64 objects:v83 count:16];
    if (v42)
    {
      uint64_t v43 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v65 != v43) {
            objc_enumerationMutation(v41);
          }
          [v40 addPreviewImageData:*(void *)(*((void *)&v64 + 1) + 8 * i)];
        }
        uint64_t v42 = [v41 countByEnumeratingWithState:&v64 objects:v83 count:16];
      }
      while (v42);
    }

    v45 = [v57 keyAsset];

    if (v45)
    {
      if (v55) {
        [v40 setKeyAssetIdentifier:v55];
      }
      v46 = [v57 keyAsset];
      uint64_t v47 = [v46 uuid];
      keySourceAssetIdentifier = v53->_keySourceAssetIdentifier;
      v53->_keySourceAssetIdentifier = (NSString *)v47;

      [v57 cropRect];
      v49 = NSStringFromRect(v86);
      [v40 setCropRectString:v49];
      v50 = [v40 data];
      [(PHMomentShareChangeRequest *)v53 setPreviewData:v50];
    }
  }
  v53->_changedAssets = 1;
  v51 = [(PHChangeRequest *)v53 helper];
  [v51 didMutate];
}

void __104__PHMomentShareChangeRequest_createMomentShareAssetsFromAssets_withCreationOptionsPerAsset_withPreview___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F8A950];
  v3 = [*(id *)(a1 + 32) objectID];
  id v15 = [v2 assetWithObjectID:v3 inLibrary:*(void *)(a1 + 40)];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [MEMORY[0x1E4F8A950] shouldPerformServerCopyWithSourceAsset:v15 copyingFromMomentShare:0 photoLibrary:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 80);
  if (*(unsigned char *)(*(void *)(v4 + 8) + 24))
  {
    v5 = [*(id *)(a1 + 48) metadataCopyOptions];
    char v6 = [v5 shouldCopyLocationData];

    uint64_t v4 = *(void *)(a1 + 80);
    if ((v6 & 1) == 0)
    {
      *(unsigned char *)(*(void *)(v4 + 8) + 24) = 0;
      uint64_t v4 = *(void *)(a1 + 80);
    }
  }
  if (*(unsigned char *)(*(void *)(v4 + 8) + 24))
  {
    id v7 = *(void **)(a1 + 56);
    id v8 = [*(id *)(a1 + 32) uuid];
    [v7 addObject:v8];

    uint64_t v9 = [*(id *)(a1 + 48) adjustmentBakeInOptions];
    uint64_t v10 = *(void **)(a1 + 64);
    uint64_t v11 = [*(id *)(a1 + 32) uuid];
    [v10 setObject:v9 forKeyedSubscript:v11];

    id v12 = [*(id *)(a1 + 48) metadataCopyOptions];
    id v13 = *(void **)(a1 + 72);
    BOOL v14 = [*(id *)(a1 + 32) uuid];
    [v13 setObject:v12 forKeyedSubscript:v14];
  }
}

- (void)addParticipants:(id)a3
{
}

- (void)_setOriginalMomentShare:(id)a3
{
}

- (void)setPublicPermission:(signed __int16)a3
{
  uint64_t v3 = a3;
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithShort:v3];
  char v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"publicPermission"];
}

- (signed)mode
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  uint64_t v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"publicPermission"];

  LOWORD(v3) = [v5 intValue];
  return (__int16)v3;
}

- (void)setShouldNotifyOnUploadCompletion:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithBool:v3];
  char v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"shouldNotifyOnUploadCompletion"];
}

- (BOOL)shouldNotifyOnUploadCompletion
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  uint64_t v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"shouldNotifyOnUploadCompletion"];

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (void)setShouldIgnoreBudgets:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithBool:v3];
  char v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"shouldIgnoreBudgets"];
}

- (BOOL)shouldIgnoreBudgets
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  uint64_t v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"shouldIgnoreBudgets"];

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (void)setPreviewData:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  char v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"previewData"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"previewData"];
  }
  else
  {
    [v6 removeObjectForKey:@"previewData"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"previewData"];
  }
}

- (NSData)previewData
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  uint64_t v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"previewData"];

  return (NSData *)v5;
}

- (void)setThumbnailImageData:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  char v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"thumbnailImageData"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"thumbnailImageData"];
  }
  else
  {
    [v6 removeObjectForKey:@"thumbnailImageData"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"thumbnailImageData"];
  }
}

- (id)thumbnailImageData
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  uint64_t v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"thumbnailImageData"];

  return v5;
}

- (void)setCreationDate:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  char v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"creationDate"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"creationDate"];
  }
  else
  {
    [v6 removeObjectForKey:@"creationDate"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"creationDate"];
  }
}

- (NSDate)creationDate
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  uint64_t v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"creationDate"];

  return (NSDate *)v5;
}

- (void)setTitle:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  char v6 = [v5 mutations];
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
  uint64_t v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"title"];

  return (NSString *)v5;
}

- (void)setOriginatingScopeIdentifier:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  char v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"originatingScopeIdentifier"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 removeObject:@"originatingScopeIdentifier"];
  }
  else
  {
    [v6 removeObjectForKey:@"originatingScopeIdentifier"];

    id v8 = [(PHChangeRequest *)self helper];
    uint64_t v9 = [v8 nilMutations];
    [v9 addObject:@"originatingScopeIdentifier"];
  }
}

- (NSString)originatingScopeIdentifier
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  uint64_t v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"originatingScopeIdentifier"];

  return (NSString *)v5;
}

- (PHObjectPlaceholder)placeholderForCreatedMomentShare
{
  BOOL v3 = [(PHChangeRequest *)self helper];
  uint64_t v4 = [v3 placeholderForCreatedObjectWithClass:objc_opt_class() changeRequest:self];

  return (PHObjectPlaceholder *)v4;
}

- (NSString)managedEntityName
{
  return (NSString *)@"MomentShare";
}

- (BOOL)prepareForPhotoLibraryCheck:(id)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  int v5 = [a3 type];
  int v6 = v5;
  if (a4 && v5 != 1)
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = @"Change must be performed within the sharedMomentSharePhotoLibrary";
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    objc_msgSend(v7, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 == 1;
}

- (void)encodeToXPCDict:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 encodeToXPCDict:v4];

  int v6 = [(PHMomentShareChangeRequest *)self participantsHelper];
  [v6 encodeToXPCDict:v4];

  xpc_dictionary_set_BOOL(v4, "changedAssetsKey", self->_changedAssets);
  PLXPCDictionarySetString();
  sourceAssetIdentifiersForBatchedCreation = self->_sourceAssetIdentifiersForBatchedCreation;
  id v26 = 0;
  id v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:sourceAssetIdentifiersForBatchedCreation requiringSecureCoding:1 error:&v26];
  id v9 = v26;
  if (v9)
  {
    uint64_t v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v9;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_ERROR, "sourceAssetIdentifiersForBatchedCreation archiving error: %@", buf, 0xCu);
    }
  }
  PLXPCDictionarySetData();

  sourceAssetIdentifiersForCurationSet = self->_sourceAssetIdentifiersForCurationSet;
  id v25 = 0;
  id v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:sourceAssetIdentifiersForCurationSet requiringSecureCoding:1 error:&v25];
  id v13 = v25;
  if (v13)
  {
    BOOL v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v13;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_ERROR, "sourceAssetIdentifiersForCurationSet archiving error: %@", buf, 0xCu);
    }
  }
  PLXPCDictionarySetData();
  PLXPCDictionarySetDictionary();

  sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation = self->_sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation;
  id v24 = 0;
  id v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation requiringSecureCoding:1 error:&v24];
  id v17 = v24;
  if (v17)
  {
    char v18 = PLBackendGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v17;
      _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_DEFAULT, "sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionary archiving error: %@", buf, 0xCu);
    }
  }
  PLXPCDictionarySetData();

  sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation = self->_sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation;
  id v23 = 0;
  id v20 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation requiringSecureCoding:1 error:&v23];
  id v21 = v23;
  if (v21)
  {
    int v22 = PLBackendGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v21;
      _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_DEFAULT, "sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionary archiving error: %@", buf, 0xCu);
    }
  }
  PLXPCDictionarySetData();
}

- (PHMomentShareChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v59.receiver = self;
  v59.super_class = (Class)PHMomentShareChangeRequest;
  uint64_t v11 = [(PHChangeRequest *)&v59 init];
  if (v11)
  {
    id v12 = [[PHChangeRequestHelper alloc] initWithXPCDict:v8 changeRequest:v11 request:v9 clientAuthorization:v10];
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      BOOL v14 = [MEMORY[0x1E4F29268] currentConnection];
      objc_storeWeak((id *)&v11->_clientConnection, v14);

      id v15 = [(PHRelationshipChangeRequestHelper *)[PHShareRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"participants" xpcDict:v8 changeRequestHelper:v11->super._helper];
      participantsHelper = v11->_participantsHelper;
      v11->_participantsHelper = v15;

      v11->_changedAssets = xpc_dictionary_get_BOOL(v8, "changedAssetsKey");
      uint64_t v17 = PLStringFromXPCDictionary();
      keySourceAssetIdentifier = v11->_keySourceAssetIdentifier;
      v11->_keySourceAssetIdentifier = (NSString *)v17;

      uint64_t v19 = PLDataFromXPCDictionary();
      id v20 = (void *)MEMORY[0x1E4F8A8D0];
      id v21 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v22 = objc_opt_class();
      id v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
      v56 = (void *)v19;
      uint64_t v24 = [v20 secureUnarchivedObjectWithData:v19 ofClasses:v23];
      sourceAssetIdentifiersForBatchedCreation = v11->_sourceAssetIdentifiersForBatchedCreation;
      v11->_sourceAssetIdentifiersForBatchedCreation = (NSSet *)v24;

      uint64_t v26 = PLDataFromXPCDictionary();
      uint64_t v27 = (void *)MEMORY[0x1E4F8A8D0];
      id v28 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v29 = objc_opt_class();
      v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
      v55 = (void *)v26;
      uint64_t v31 = [v27 secureUnarchivedObjectWithData:v26 ofClasses:v30];
      sourceAssetIdentifiersForCurationSet = v11->_sourceAssetIdentifiersForCurationSet;
      v11->_sourceAssetIdentifiersForCurationSet = (NSSet *)v31;

      uint64_t v33 = PLDictionaryFromXPCDictionary();
      sourceAssetCMMAssetMapForCreationRequest = v11->_sourceAssetCMMAssetMapForCreationRequest;
      v11->_sourceAssetCMMAssetMapForCreationRequest = (NSDictionary *)v33;

      if ([(NSSet *)v11->_sourceAssetIdentifiersForBatchedCreation count]
        || [(NSSet *)v11->_sourceAssetIdentifiersForCurationSet count]
        || [(NSDictionary *)v11->_sourceAssetCMMAssetMapForCreationRequest count])
      {
        [(PHChangeRequestHelper *)v11->super._helper setMutated:1];
        [v9 recordUpdateRequest:v11];
      }
      v35 = PLDataFromXPCDictionary();
      if (v35)
      {
        v36 = (void *)MEMORY[0x1E4F28DC0];
        uint64_t v37 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v38 = objc_opt_class();
        uint64_t v39 = objc_opt_class();
        id v40 = objc_msgSend(v37, "setWithObjects:", v38, v39, objc_opt_class(), 0);
        id v58 = 0;
        uint64_t v41 = [v36 unarchivedObjectOfClasses:v40 fromData:v35 error:&v58];
        uint64_t v42 = v58;
        sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation = v11->_sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation;
        v11->_sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation = (NSDictionary *)v41;
      }
      else
      {
        uint64_t v42 = PLBackendGetLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B043000, v42, OS_LOG_TYPE_ERROR, "sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryData is nil", buf, 2u);
        }
      }

      v44 = PLDataFromXPCDictionary();
      if (v44)
      {
        v45 = (void *)MEMORY[0x1E4F28DC0];
        v46 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v47 = objc_opt_class();
        uint64_t v48 = objc_opt_class();
        v49 = objc_msgSend(v46, "setWithObjects:", v47, v48, objc_opt_class(), 0);
        id v57 = 0;
        uint64_t v50 = [v45 unarchivedObjectOfClasses:v49 fromData:v44 error:&v57];
        id v51 = v57;
        sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation = v11->_sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation;
        v11->_sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation = (NSDictionary *)v50;

        if (v35)
        {
LABEL_19:

          goto LABEL_20;
        }
        v53 = PLBackendGetLog();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v61 = v51;
          _os_log_impl(&dword_19B043000, v53, OS_LOG_TYPE_ERROR, "sourceAssetIdentifiersToMetadataCopyOptionsDictionary unarchiving error: %@", buf, 0xCu);
        }
      }
      else
      {
        v53 = PLBackendGetLog();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B043000, v53, OS_LOG_TYPE_ERROR, "sourceAssetIdentifiersToMetadataCopyOptionsDictionary is nil", buf, 2u);
        }
        id v51 = 0;
      }

      goto LABEL_19;
    }
  }
LABEL_20:

  return v11;
}

- (PHMomentShareChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHMomentShareChangeRequest;
  id v8 = [(PHChangeRequest *)&v14 init];
  if (v8)
  {
    id v9 = [[PHChangeRequestHelper alloc] initWithUUID:v6 objectID:v7 changeRequest:v8];
    helper = v8->super._helper;
    v8->super._helper = v9;

    uint64_t v11 = [(PHRelationshipChangeRequestHelper *)[PHShareRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"participants" changeRequestHelper:v8->super._helper];
    participantsHelper = v8->_participantsHelper;
    v8->_participantsHelper = v11;
  }
  return v8;
}

- (id)initForNewObject
{
  v8.receiver = self;
  v8.super_class = (Class)PHMomentShareChangeRequest;
  v2 = [(PHChangeRequest *)&v8 init];
  if (v2)
  {
    BOOL v3 = [[PHChangeRequestHelper alloc] initForNewObjectWithChangeRequest:v2];
    helper = v2->super._helper;
    v2->super._helper = v3;

    int v5 = [(PHRelationshipChangeRequestHelper *)[PHShareRelationshipChangeRequestHelper alloc] initWithRelationshipName:@"participants" changeRequestHelper:v2->super._helper];
    participantsHelper = v2->_participantsHelper;
    v2->_participantsHelper = v5;
  }
  return v2;
}

+ (void)expungeMomentShares:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  +[PHPhotoLibrary assertTransaction];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v17 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v18 = *MEMORY[0x1E4F1C3C8];
          uint64_t v19 = NSString;
          id v20 = NSStringFromSelector(a2);
          id v21 = [v19 stringWithFormat:@"Invalid object %@ passed to %@, objects must be of type PHMomentShare", v10, v20];
          id v22 = [v17 exceptionWithName:v18 reason:v21 userInfo:0];

          objc_exception_throw(v22);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = +[PHObjectDeleteRequest deleteRequestForObject:*(void *)(*((void *)&v23 + 1) + 8 * j)];
        [v16 setOperation:1];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v13);
  }
}

+ (void)trashMomentShares:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  +[PHPhotoLibrary assertTransaction];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v17 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v18 = *MEMORY[0x1E4F1C3C8];
          uint64_t v19 = NSString;
          id v20 = NSStringFromSelector(a2);
          id v21 = [v19 stringWithFormat:@"Invalid object %@ passed to %@, objects must be of type PHMomentShare", v10, v20];
          id v22 = [v17 exceptionWithName:v18 reason:v21 userInfo:0];

          objc_exception_throw(v22);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = +[PHObjectDeleteRequest deleteRequestForObject:*(void *)(*((void *)&v23 + 1) + 8 * j)];
        [v16 setOperation:0];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v13);
  }
}

+ (id)validateMomentShareCreationDate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3300, @"Nil creation date not supported");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      id v6 = v6;
      *a4 = v6;
    }
  }

  return v5;
}

+ (id)creationRequestForMomentShareWithTitle:(id)a3 publicPermission:(signed __int16)a4 creationDate:(id)a5 createMomentShareAssetsFromAssets:(id)a6 creationOptionsPerAsset:(id)a7 preview:(id)a8 originatingMomentShare:(id)a9
{
  uint64_t v12 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a5;
  id v21 = a3;
  if (![v16 count])
  {
    long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:a1 file:@"PHMomentShareChangeRequest.m" lineNumber:202 description:@"assets must not be empty"];
  }
  id v22 = [[PHMomentShareChangeRequest alloc] initForNewObject];
  [v22 setTitle:v21];

  [v22 setPublicPermission:v12];
  [v22 setCreationDate:v20];

  if (v19)
  {
    long long v23 = [v19 scopeIdentifier];
    if (v23) {
      [v22 setOriginatingScopeIdentifier:v23];
    }
  }
  [v22 createMomentShareAssetsFromAssets:v16 withCreationOptionsPerAsset:v17 withPreview:v18];

  return v22;
}

+ (id)changeRequestForMomentShare:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [PHMomentShareChangeRequest alloc];
    id v5 = [v3 uuid];
    id v6 = [v3 objectID];
    uint64_t v7 = [(PHMomentShareChangeRequest *)v4 initWithUUID:v5 objectID:v6];

    [(PHMomentShareChangeRequest *)v7 _setOriginalMomentShare:v3];
    uint64_t v8 = [(PHMomentShareChangeRequest *)v7 participantsHelper];
    [v8 setOriginalShare:v3];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

@end