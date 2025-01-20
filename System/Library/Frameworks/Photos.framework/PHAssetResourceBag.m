@interface PHAssetResourceBag
+ (BOOL)_supportsAssetResourceTypes:(id)a3 mediaType:(int64_t *)a4 mediaSubtype:(unint64_t *)a5 importedBy:(signed __int16)a6;
+ (BOOL)supportsAssetResourceTypes:(id)a3 mediaType:(int64_t *)a4 importedBy:(signed __int16)a5;
+ (id)_primaryAssetResource:(id)a3;
- (BOOL)_extractValidatedAdjustmentsURL:(id *)a3 fromResource:(id)a4 photoLibrary:(id)a5 error:(id *)a6;
- (BOOL)_extractValidatedAudioURL:(id *)a3 fromResource:(id)a4 photoLibrary:(id)a5 error:(id *)a6;
- (BOOL)_extractValidatedImageURL:(id *)a3 imageData:(id *)a4 fromResource:(id)a5 photoLibrary:(id)a6 error:(id *)a7;
- (BOOL)_extractValidatedVideoURL:(id *)a3 fromResource:(id)a4 photoLibrary:(id)a5 error:(id *)a6;
- (BOOL)_validateAssetResourcesForAssetCreation:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (BOOL)didValidateForInsertion;
- (BOOL)hasAdjustments;
- (BOOL)hasCurrentAdjustment;
- (BOOL)hasOriginalAdjustment;
- (BOOL)hasRAW;
- (BOOL)hasSpatialOverCapture;
- (BOOL)isValid;
- (BOOL)validateForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (NSArray)assetResources;
- (PHAssetCreationRequest)assetCreationRequest;
- (PHAssetResourceBag)initWithAssetResources:(id)a3 assetCreationRequest:(id)a4;
- (PHExternalAssetResource)primaryResource;
- (id)_validateAssetResourceForAssetCreation:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (id)_validatedContextForResource:(id)a3;
- (id)assetResourceWithType:(int64_t)a3;
- (id)validatedDataForAssetResource:(id)a3;
- (id)validatedURLForAssetResource:(id)a3;
- (int64_t)mediaType;
- (unint64_t)mediaSubtype;
@end

@implementation PHAssetResourceBag

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryResource, 0);
  objc_storeStrong((id *)&self->_assetResources, 0);
  objc_destroyWeak((id *)&self->_assetCreationRequest);

  objc_storeStrong((id *)&self->_assetResourceContexts, 0);
}

- (PHExternalAssetResource)primaryResource
{
  return self->_primaryResource;
}

- (unint64_t)mediaSubtype
{
  return self->_mediaSubtype;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (BOOL)hasSpatialOverCapture
{
  return self->_hasSpatialOverCapture;
}

- (BOOL)hasRAW
{
  return self->_hasRAW;
}

- (BOOL)hasOriginalAdjustment
{
  return self->_hasOriginalAdjustment;
}

- (BOOL)hasCurrentAdjustment
{
  return self->_hasCurrentAdjustment;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (BOOL)didValidateForInsertion
{
  return self->_didValidateForInsertion;
}

- (NSArray)assetResources
{
  return self->_assetResources;
}

- (PHAssetCreationRequest)assetCreationRequest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetCreationRequest);

  return (PHAssetCreationRequest *)WeakRetained;
}

- (id)validatedDataForAssetResource:(id)a3
{
  v3 = [(PHAssetResourceBag *)self _validatedContextForResource:a3];
  v4 = [v3 validatedData];

  return v4;
}

- (id)validatedURLForAssetResource:(id)a3
{
  v3 = [(PHAssetResourceBag *)self _validatedContextForResource:a3];
  v4 = [v3 validatedURL];

  return v4;
}

- (id)_validatedContextForResource:(id)a3
{
  id v4 = a3;
  assetResourceContexts = self->_assetResourceContexts;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__PHAssetResourceBag__validatedContextForResource___block_invoke;
  v10[3] = &unk_1E5848280;
  id v6 = v4;
  id v11 = v6;
  uint64_t v7 = [(NSArray *)assetResourceContexts indexOfObjectPassingTest:v10];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v8 = [(NSArray *)self->_assetResourceContexts objectAtIndexedSubscript:v7];
  }

  return v8;
}

BOOL __51__PHAssetResourceBag__validatedContextForResource___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 resource];
  BOOL v4 = v2 == v3;

  return v4;
}

- (BOOL)validateForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_didValidateForInsertion)
  {
    id v7 = 0;
    BOOL valid = self->_valid;
    p_BOOL valid = &self->_valid;
    BOOL v8 = valid;
    if (a4 && !v8)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3302, @"Previous validation failed");
      id v11 = objc_claimAutoreleasedReturnValue();
      *a4 = v11;

      id v7 = 0;
    }
  }
  else
  {
    assetResources = self->_assetResources;
    id v16 = 0;
    BOOL v13 = [(PHAssetResourceBag *)self _validateAssetResourcesForAssetCreation:assetResources photoLibrary:v6 error:&v16];
    id v7 = v16;
    self->_BOOL valid = v13;
    p_BOOL valid = &self->_valid;
    *(p_valid - 1) = 1;
    if (a4 && !v13)
    {
      if (v7)
      {
        id v7 = v7;
        *a4 = v7;
        goto LABEL_9;
      }
      goto LABEL_4;
    }
  }
LABEL_9:
  BOOL v14 = *p_valid;

  return v14;
}

- (BOOL)hasAdjustments
{
  if (self->_hasCurrentAdjustment || self->_hasOriginalAdjustment) {
    return 1;
  }
  BOOL v4 = [(PHAssetResourceBag *)self assetResourceWithType:18];
  BOOL v2 = v4 != 0;

  return v2;
}

- (BOOL)_validateAssetResourcesForAssetCreation:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = [v9 valueForKey:@"type"];
  uint64_t v12 = objc_opt_class();
  BOOL v13 = [(PHAssetResourceBag *)self assetCreationRequest];
  LOBYTE(v12) = objc_msgSend((id)v12, "_supportsAssetResourceTypes:mediaType:mediaSubtype:importedBy:", v11, &self->_mediaType, &self->_mediaSubtype, (__int16)objc_msgSend(v13, "importedBy"));

  if (v12)
  {
    SEL v37 = a2;
    v38 = a5;
    v39 = v11;
    BOOL v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v40 = v9;
    id v15 = v9;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      id v18 = 0;
      uint64_t v19 = *(void *)v43;
LABEL_4:
      uint64_t v20 = 0;
      v21 = v18;
      while (1)
      {
        if (*(void *)v43 != v19) {
          objc_enumerationMutation(v15);
        }
        uint64_t v22 = *(void *)(*((void *)&v42 + 1) + 8 * v20);
        id v41 = v21;
        v23 = [(PHAssetResourceBag *)self _validateAssetResourceForAssetCreation:v22 photoLibrary:v10 error:&v41];
        id v18 = v41;

        if (!v23) {
          break;
        }
        [v14 addObject:v23];

        ++v20;
        v21 = v18;
        if (v17 == v20)
        {
          uint64_t v17 = [v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
          if (v17) {
            goto LABEL_4;
          }
          goto LABEL_18;
        }
      }

      id v11 = v39;
      id v9 = v40;
      a5 = v38;
      if (v38) {
        goto LABEL_12;
      }
      goto LABEL_16;
    }
    id v18 = 0;
LABEL_18:

    uint64_t v25 = [v14 count];
    if (v25 != [(NSArray *)self->_assetResources count])
    {
      v36 = [MEMORY[0x1E4F28B00] currentHandler];
      [v36 handleFailureInMethod:v37 object:self file:@"PHAssetResourceBag.m" lineNumber:594 description:@"expect 1-to-1 resource to validation context"];
    }
    objc_storeStrong((id *)&self->_assetResourceContexts, v14);
    v26 = [(id)objc_opt_class() _primaryAssetResource:v14];
    primaryResource = self->_primaryResource;
    self->_primaryResource = v26;

    v28 = [(PHAssetResourceBag *)self assetResourceWithType:7];
    id v11 = v39;
    if (v28)
    {
      self->_hasCurrentAdjustment = 1;
    }
    else
    {
      v29 = [(PHAssetResourceBag *)self assetResourceWithType:18];
      if (v29)
      {
        self->_hasCurrentAdjustment = 1;
      }
      else
      {
        v30 = [(PHAssetResourceBag *)self assetResourceWithType:107];
        self->_hasCurrentAdjustment = v30 != 0;
      }
    }

    v31 = [(PHAssetResourceBag *)self assetResourceWithType:16];
    self->_hasOriginalAdjustment = v31 != 0;

    v32 = [(PHAssetResourceBag *)self assetResourceWithType:4];
    self->_hasRAW = v32 != 0;

    v33 = [(PHAssetResourceBag *)self assetResourceWithType:13];
    if (v33)
    {
      self->_hasSpatialOverCapture = 1;
    }
    else
    {
      v34 = [(PHAssetResourceBag *)self assetResourceWithType:14];
      self->_hasSpatialOverCapture = v34 != 0;
    }
    BOOL v24 = 1;
    id v9 = v40;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3300, @"No known asset format supports this resource combination");
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v14 = 0;
    if (!a5)
    {
LABEL_16:
      BOOL v24 = 0;
      goto LABEL_30;
    }
LABEL_12:
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3302, @"Unknown error: Unable to validate resource");
      id v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v18 = v18;
    BOOL v24 = 0;
    *a5 = v18;
  }
LABEL_30:

  return v24;
}

- (id)_validateAssetResourceForAssetCreation:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 type];
  uint64_t v10 = v9;
  switch(v9)
  {
    case 1:
    case 4:
    case 5:
    case 8:
    case 13:
    case 19:
      id v51 = 0;
      id v52 = 0;
      id v50 = 0;
      BOOL v11 = [(PHAssetResourceBag *)self _extractValidatedImageURL:&v52 imageData:&v51 fromResource:v7 photoLibrary:v8 error:&v50];
      uint64_t v12 = (uint64_t)v52;
      uint64_t v15 = (uint64_t)v51;
      id v14 = v50;
      break;
    case 2:
    case 6:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 15:
      v48 = 0;
      id v49 = 0;
      BOOL v11 = [(PHAssetResourceBag *)self _extractValidatedVideoURL:&v49 fromResource:v7 photoLibrary:v8 error:&v48];
      uint64_t v12 = (uint64_t)v49;
      BOOL v13 = v48;
      goto LABEL_3;
    case 3:
      v46 = 0;
      id v47 = 0;
      BOOL v11 = [(PHAssetResourceBag *)self _extractValidatedAudioURL:&v47 fromResource:v7 photoLibrary:v8 error:&v46];
      uint64_t v12 = (uint64_t)v47;
      BOOL v13 = v46;
      goto LABEL_3;
    case 7:
    case 16:
      long long v44 = 0;
      id v45 = 0;
      BOOL v11 = [(PHAssetResourceBag *)self _extractValidatedAdjustmentsURL:&v45 fromResource:v7 photoLibrary:v8 error:&v44];
      uint64_t v12 = (uint64_t)v45;
      BOOL v13 = v44;
LABEL_3:
      id v14 = v13;
      uint64_t v15 = 0;
      break;
    case 17:
    case 18:
LABEL_7:
      uint64_t v12 = [v7 fileURL];
      uint64_t v15 = 0;
      id v14 = 0;
      BOOL v16 = v12 == 0;
LABEL_8:
      BOOL v11 = !v16;
      break;
    default:
      BOOL v11 = 0;
      uint64_t v15 = 0;
      uint64_t v12 = 0;
      id v14 = 0;
      switch(v9)
      {
        case 'k':
        case 'o':
          uint64_t v12 = [v7 fileURL];
          uint64_t v15 = [v7 data];
          id v14 = 0;
          BOOL v16 = (v12 | v15) == 0;
          goto LABEL_8;
        case 'l':
        case 'n':
          goto LABEL_7;
        default:
          goto LABEL_11;
      }
  }
LABEL_11:
  uint64_t v17 = [v7 creationOptions];
  id v18 = [v17 uniformTypeIdentifier];

  long long v42 = (void *)v12;
  if (v11 && v18)
  {
    uint64_t v19 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v18];
    char v20 = PHUniformTypeConformsToResourceType(v19, v10);

    if (v20)
    {
      BOOL v11 = 1;
    }
    else
    {
      v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = _PHAssetResourceTypeDescription(v10);
      uint64_t v23 = objc_msgSend(v21, "ph_errorWithCode:localizedDescription:", 3302, @"Invalid uti '%@' specified for resource type %@", v18, v22);

      BOOL v11 = 0;
      id v14 = (id)v23;
    }
  }
  BOOL v24 = [(PHAssetResourceBag *)self assetCreationRequest];
  uint64_t v25 = [v24 helper];
  v26 = [v25 clientAuthorization];
  char v27 = [v26 isCameraClient];

  if (v27)
  {
    if (!v11) {
      goto LABEL_25;
    }
LABEL_24:
    v30 = v42;
    v31 = [[PHAssetResourceValidatedContext alloc] initWithResource:v7 validatedURL:v42 validatedData:v15];
    goto LABEL_31;
  }
  if (!v11)
  {
LABEL_25:
    v32 = a5;
    goto LABEL_26;
  }
  id v28 = [v7 creationOptions];
  if ([v28 shouldMoveFile])
  {
LABEL_23:

    goto LABEL_24;
  }
  v29 = [v7 creationOptions];
  if ([v29 shouldIngestInPlace]) {
    goto LABEL_22;
  }
  v34 = [v7 fileURL];

  if (!v34) {
    goto LABEL_24;
  }
  v35 = (void *)MEMORY[0x1E4F8B908];
  v36 = [v7 fileURL];
  SEL v37 = [v8 pathManager];
  v38 = [v37 libraryURL];
  id v43 = 0;
  v29 = [v35 hasDiskSpaceToCopyFileAtURL:v36 toVolumeAtURL:v38 error:&v43];
  id v28 = v43;

  if (!v29)
  {
    id v40 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v54 = v7;
      __int16 v55 = 2112;
      id v56 = v28;
      _os_log_impl(&dword_19B043000, v40, OS_LOG_TYPE_ERROR, "Failed to determine available space for copying asset resource %@: %@", buf, 0x16u);
    }

    v29 = 0;
    goto LABEL_22;
  }
  v32 = a5;
  if ([v29 BOOLValue])
  {
LABEL_22:

    goto LABEL_23;
  }
  uint64_t v39 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3305, @"Not enough space to copy resources");

  id v14 = (id)v39;
LABEL_26:
  v30 = v42;
  if (v32)
  {
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3302, @"Unknown error: Unable to validate resource");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v14 = v14;
    v31 = 0;
    id *v32 = v14;
  }
  else
  {
    v31 = 0;
  }
LABEL_31:

  return v31;
}

- (BOOL)_extractValidatedAdjustmentsURL:(id *)a3 fromResource:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  id v8 = a4;
  uint64_t v9 = [v8 fileURL];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    BOOL v11 = (void *)[objc_alloc(MEMORY[0x1E4F8CBB8]) initWithURL:v9];

    if (v11)
    {
      id v12 = 0;
      BOOL v13 = 1;
      if (!a3) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else
  {
    id v14 = [v8 data];

    if (v14)
    {
      uint64_t v15 = @"NSData unsupported for adjustments; pass a url instead";
      uint64_t v16 = 3300;
    }
    else
    {
      uint64_t v15 = @"Missing required adjustment data file url";
      uint64_t v16 = 3303;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", v16, v15);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (!a6) {
        goto LABEL_15;
      }
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3302, @"Unable to obtain adjustment data");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!a6)
  {
LABEL_15:
    BOOL v13 = 0;
    uint64_t v10 = 0;
    if (!a3) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_11:
  id v12 = v12;
  BOOL v13 = 0;
  uint64_t v10 = 0;
  *a6 = v12;
  if (a3) {
LABEL_12:
  }
    *a3 = v10;
LABEL_13:

  return v13;
}

- (BOOL)_extractValidatedAudioURL:(id *)a3 fromResource:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  id v8 = a4;
  uint64_t v9 = [v8 fileURL];
  uint64_t v10 = v9;
  if (v9)
  {
    BOOL v11 = (void *)MEMORY[0x1E4F8AA78];
    id v12 = [v9 pathExtension];
    LOBYTE(v11) = [v11 isAudioFileExtension:v12];

    if (v11)
    {
      id v13 = 0;
      BOOL v14 = 1;
      if (!a3) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = [v10 pathExtension];
    objc_msgSend(v18, "ph_errorWithCode:localizedDescription:", 3302, @"Unsupported audio file extension: %@", v19);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v15 = [v8 data];

    if (v15)
    {
      uint64_t v16 = @"NSData unsupported for audio; pass a url instead";
      uint64_t v17 = 3300;
    }
    else
    {
      uint64_t v16 = @"Missing required audio file url";
      uint64_t v17 = 3303;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", v17, v16);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v13)
  {
    if (a6) {
      goto LABEL_12;
    }
LABEL_16:
    BOOL v14 = 0;
    uint64_t v10 = 0;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3302, @"Unable to obtain audio url");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!a6) {
    goto LABEL_16;
  }
LABEL_12:
  id v13 = v13;
  BOOL v14 = 0;
  uint64_t v10 = 0;
  *a6 = v13;
  if (a3) {
LABEL_13:
  }
    *a3 = v10;
LABEL_14:

  return v14;
}

- (BOOL)_extractValidatedVideoURL:(id *)a3 fromResource:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = [v10 fileURL];
  id v13 = [[_PHPhotoLibraryValidator alloc] initWithPhotoLibrary:v11];

  if (v12)
  {
    id v27 = 0;
    BOOL v14 = [(PHValidator *)v13 validateURL:v12 withOptions:8 error:&v27];
    id v15 = v27;
    if (v14)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_assetCreationRequest);
      id v26 = v15;
      char v17 = [WeakRetained validateReadAccessForContentURL:v12 assetResource:v10 error:&v26];
      id v18 = v26;

      if (v17)
      {
        id v25 = v18;
        BOOL v19 = [(PHValidator *)v13 validateURL:v12 withOptions:32 error:&v25];
        id v15 = v25;

        if (v19)
        {
          BOOL v20 = 1;
          if (!a3) {
            goto LABEL_16;
          }
          goto LABEL_15;
        }
      }
      else
      {
        id v15 = v18;
      }
    }
  }
  else
  {
    v21 = [v10 data];

    if (v21)
    {
      uint64_t v22 = @"NSData unsupported for video; pass a url instead";
      uint64_t v23 = 3300;
    }
    else
    {
      uint64_t v22 = @"Missing required video url";
      uint64_t v23 = 3303;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", v23, v22);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v15)
  {
    if (a6) {
      goto LABEL_14;
    }
LABEL_18:
    BOOL v20 = 0;
    id v12 = 0;
    if (!a3) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3302, @"Unable to obtain video url");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!a6) {
    goto LABEL_18;
  }
LABEL_14:
  id v15 = v15;
  BOOL v20 = 0;
  id v12 = 0;
  *a6 = v15;
  if (a3) {
LABEL_15:
  }
    *a3 = v12;
LABEL_16:

  return v20;
}

- (BOOL)_extractValidatedImageURL:(id *)a3 imageData:(id *)a4 fromResource:(id)a5 photoLibrary:(id)a6 error:(id *)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = [v13 data];
  uint64_t v16 = [v13 fileURL];
  char v17 = (void *)v16;
  if (v15 && v16)
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"PHAssetResourceBag.m" lineNumber:362 description:@"have both image data and url; can't tell which to validate"];
  }
  uint64_t v18 = [v13 type];
  BOOL v19 = [[_PHPhotoLibraryValidator alloc] initWithPhotoLibrary:v14];

  if (!v15)
  {
    if (!v17) {
      goto LABEL_22;
    }
    id v28 = 0;
    BOOL v22 = [(PHValidator *)v19 validateURL:v17 withOptions:4 error:&v28];
    id v21 = v28;
    if (!v22) {
      goto LABEL_15;
    }
    id v15 = 0;
LABEL_12:
    BOOL v23 = 1;
    if (!a3) {
      goto LABEL_19;
    }
LABEL_18:
    *a3 = v17;
    goto LABEL_19;
  }
  if (v18 != 1 && v18 != 19)
  {
    BOOL v24 = (void *)MEMORY[0x1E4F28C58];
    id v25 = _PHAssetResourceTypeDescription(v18);
    objc_msgSend(v24, "ph_errorWithCode:localizedDescription:", 3300, @"NSData unsupported for resource type %@; pass a url instead",
      v25);
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  id v29 = 0;
  BOOL v20 = [(PHValidator *)v19 validateData:v15 withOptions:16 error:&v29];
  id v21 = v29;
  if (v20) {
    goto LABEL_12;
  }
LABEL_15:

  if (v21)
  {
    if (a7) {
      goto LABEL_17;
    }
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3303, @"Unable to obtain image url");
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  if (a7)
  {
LABEL_17:
    id v21 = v21;
    BOOL v23 = 0;
    id v15 = 0;
    char v17 = 0;
    *a7 = v21;
    if (!a3) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_23:
  BOOL v23 = 0;
  id v15 = 0;
  char v17 = 0;
  if (a3) {
    goto LABEL_18;
  }
LABEL_19:
  if (a4) {
    *a4 = v15;
  }

  return v23;
}

- (id)assetResourceWithType:(int64_t)a3
{
  assetResources = self->_assetResources;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__PHAssetResourceBag_assetResourceWithType___block_invoke;
  v8[3] = &__block_descriptor_40_e40_B32__0__PHExternalAssetResource_8Q16_B24l;
  v8[4] = a3;
  uint64_t v5 = [(NSArray *)assetResources indexOfObjectPassingTest:v8];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [(NSArray *)self->_assetResources objectAtIndexedSubscript:v5];
  }

  return v6;
}

BOOL __44__PHAssetResourceBag_assetResourceWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

- (PHAssetResourceBag)initWithAssetResources:(id)a3 assetCreationRequest:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHAssetResourceBag;
  uint64_t v9 = [(PHAssetResourceBag *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetResources, a3);
    objc_storeWeak((id *)&v10->_assetCreationRequest, v8);
  }

  return v10;
}

+ (id)_primaryAssetResource:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v4)
  {
    id v6 = 0;
    id v7 = 0;
    goto LABEL_20;
  }
  uint64_t v5 = v4;
  id v6 = 0;
  id v7 = 0;
  uint64_t v8 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v3);
      }
      id v10 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "resource", (void)v18);
      uint64_t v11 = [v10 type];
      unint64_t v12 = v11;
      if ((unint64_t)(v11 - 1) < 2) {
        goto LABEL_9;
      }
      if (v11 == 3)
      {

        id v6 = v10;
        continue;
      }
      if (v11 == 19)
      {
LABEL_9:
        id v13 = v10;

        id v7 = v13;
      }

      if (v12 <= 0x13 && ((1 << v12) & 0x80006) != 0) {
        goto LABEL_20;
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v5);
LABEL_20:

  if (v7) {
    id v15 = v7;
  }
  else {
    id v15 = v6;
  }
  id v16 = v15;

  return v16;
}

+ (BOOL)supportsAssetResourceTypes:(id)a3 mediaType:(int64_t *)a4 importedBy:(signed __int16)a5
{
  return [a1 _supportsAssetResourceTypes:a3 mediaType:a4 mediaSubtype:0 importedBy:a5];
}

+ (BOOL)_supportsAssetResourceTypes:(id)a3 mediaType:(int64_t *)a4 mediaSubtype:(unint64_t *)a5 importedBy:(signed __int16)a6
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v9 = a3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v81 objects:v86 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    unsigned int v12 = 0;
    uint64_t v13 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v82 != v13) {
          objc_enumerationMutation(v9);
        }
        int v15 = 1 << [*(id *)(*((void *)&v81 + 1) + 8 * i) unsignedIntegerValue];
        if ((v15 & v12) != 0)
        {

          goto LABEL_142;
        }
        v12 |= v15;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v81 objects:v86 count:16];
    }
    while (v11);
  }
  else
  {
    unsigned int v12 = 0;
  }
  v68 = a4;
  v69 = a5;

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v16 = v9;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v77 objects:v85 count:16];
  if (!v17)
  {
    uint64_t v19 = 0;
    uint64_t v72 = 0;
LABEL_145:

    if (v68) {
      int64_t *v68 = v19;
    }
    if (v69) {
      unint64_t *v69 = v72;
    }
    BOOL v56 = 1;
    goto LABEL_143;
  }
  uint64_t v18 = v17;
  uint64_t v19 = 0;
  uint64_t v72 = 0;
  int v20 = (unsigned __int16)a6;
  int v21 = a6 & 0xFFFE;
  int v22 = v12 & 0x45044;
  BOOL v23 = (v12 & 4) == 0;
  int v24 = v12 & 0x2AE0A;
  if ((v12 & 0x2AE0A) == 0x2AE0A) {
    BOOL v23 = 1;
  }
  BOOL v25 = v24 != 175626;
  BOOL v26 = v24 == 175626 || (v12 & 0x4004) != 16388;
  BOOL v27 = (v12 & 0x2AE0A) != 0x2AE0A && (v12 & 0x4004) == 16388;
  BOOL v66 = v27;
  BOOL v28 = (v12 & 0x2AE0A) != 0x2AE0A && (~v12 & 0x84) == 0;
  BOOL v29 = v22 == 282692;
  BOOL v30 = v22 == 282692 || (v12 & 2) == 0;
  BOOL v31 = v22 != 282692;
  BOOL v32 = v22 != 282692 && (~v12 & 0x12) == 0;
  BOOL v33 = !v29 && (v12 & 0x2002) == 8194;
  BOOL v71 = v33;
  BOOL v34 = v29 || (v12 & 0x2002) != 8194;
  int v35 = v31 & (v12 >> 1);
  int v36 = v12 & 0xC4;
  if ((~v12 & 0xEE00) == 0) {
    BOOL v32 = 0;
  }
  BOOL v75 = v32;
  int v37 = v36 == 196 || v26;
  int v70 = v37;
  BOOL v38 = v36 != 196 && (v12 & 0x4004) == 16388;
  int v39 = v12 & 0x18;
  char v40 = (v12 & 0x200) == 0 || v34;
  if (v39 == 24) {
    char v41 = 1;
  }
  else {
    char v41 = v40;
  }
  if (v39 == 24) {
    LOBYTE(v42) = 0;
  }
  else {
    int v42 = v31 & (v12 >> 1);
  }
  char v60 = v42;
  BOOL v43 = (v12 & 0x8202) == 0x202 && v30;
  BOOL v64 = v43;
  char v65 = v41;
  char v44 = v20 != 5 || v30;
  char v63 = v44;
  int v67 = v21;
  uint64_t v45 = *(void *)v78;
  char v46 = v21 != 4 || v23;
  if (v21 != 4) {
    BOOL v30 = 1;
  }
  int v47 = v25 & (v12 >> 2);
  if ((~v12 & 0x30080) == 0) {
    char v46 = 1;
  }
  char v62 = v46;
  BOOL v48 = (v12 & 0x80002) != 0 && v31;
  int v74 = *(_DWORD *)&v28 & ((v12 & 0x40) >> 6);
  BOOL v59 = v48;
  int v49 = v23 || v38;
  char v50 = (~v12 & 0xFE44) == 0 || v30;
  char v61 = v50;
  char v76 = v48 | v47;
  LODWORD(v58) = v49 ^ 1;
  HIDWORD(v58) = v47 & ((v12 & 0x80) >> 7);
  int v73 = v31 & (v12 >> 19);
  while (2)
  {
    uint64_t v51 = 0;
LABEL_74:
    if (*(void *)v78 != v45) {
      objc_enumerationMutation(v16);
    }
    uint64_t v52 = objc_msgSend(*(id *)(*((void *)&v77 + 1) + 8 * v51), "integerValue", v58);
    switch(v52)
    {
      case 1:
        if (v35) {
          goto LABEL_125;
        }
        goto LABEL_141;
      case 2:
        if ((v47 & 1) == 0) {
          goto LABEL_141;
        }
        uint64_t v19 = 2;
        goto LABEL_138;
      case 3:
        if (v61) {
          goto LABEL_141;
        }
        if (!v19) {
          uint64_t v19 = 3;
        }
        goto LABEL_138;
      case 4:
        if (!v75) {
          goto LABEL_141;
        }
        goto LABEL_138;
      case 5:
        char valid = hasValidFullSizePhoto(v12);
        goto LABEL_118;
      case 6:
      case 12:
        if ((v74 & 1) == 0) {
          goto LABEL_141;
        }
        goto LABEL_138;
      case 7:
        if (v67 == 4)
        {
          if (!(v35 | v47)) {
            goto LABEL_141;
          }
LABEL_131:
          if (v71)
          {
            if ((hasValidFullSizePhoto(v12) & v70 & 1) == 0) {
              goto LABEL_141;
            }
          }
          else if ((v70 & 1) == 0)
          {
            goto LABEL_141;
          }
LABEL_138:
          if (v18 == ++v51)
          {
            uint64_t v18 = [v16 countByEnumeratingWithState:&v77 objects:v85 count:16];
            if (!v18) {
              goto LABEL_145;
            }
            continue;
          }
          goto LABEL_74;
        }
        if (v59 || ((hasValidFullSizePhoto(v12) | v58) & 1) != 0) {
          goto LABEL_138;
        }
LABEL_141:

LABEL_142:
        BOOL v56 = 0;
LABEL_143:

        return v56;
      case 8:
        goto LABEL_117;
      case 9:
        if (v73)
        {
          if (v39 == 24) {
            goto LABEL_141;
          }
        }
        else if ((v60 & 1) == 0)
        {
          goto LABEL_141;
        }
        uint64_t v72 = 8;
        goto LABEL_138;
      case 10:
        int v55 = hasValidFullSizePhoto(v12);
        goto LABEL_107;
      case 11:
        int v55 = hasValidFullSizePhoto(v12);
        if ((v12 & 0x100) == 0) {
          goto LABEL_141;
        }
LABEL_107:
        if (!v55 || v39 == 24) {
          goto LABEL_141;
        }
        goto LABEL_138;
      case 13:
        if (v64) {
          goto LABEL_141;
        }
        goto LABEL_138;
      case 14:
        if (!v66) {
          goto LABEL_141;
        }
        goto LABEL_138;
      case 15:
        if (v65) {
          goto LABEL_141;
        }
        goto LABEL_138;
      case 16:
        if (!v75) {
          goto LABEL_138;
        }
LABEL_117:
        char valid = hasValidFullSizePhoto(v12);
        if ((v12 & 0x100) == 0) {
          goto LABEL_141;
        }
LABEL_118:
        if ((valid & 1) == 0) {
          goto LABEL_141;
        }
        goto LABEL_138;
      case 17:
        if (v63) {
          goto LABEL_141;
        }
        goto LABEL_138;
      case 18:
        if (v62) {
          goto LABEL_141;
        }
        goto LABEL_138;
      case 19:
        if ((v73 & 1) == 0) {
          goto LABEL_141;
        }
LABEL_125:
        uint64_t v19 = 1;
        goto LABEL_138;
      case 20:
        goto LABEL_141;
      default:
        char v53 = v52 - 107;
        if ((unint64_t)(v52 - 107) > 7) {
          goto LABEL_138;
        }
        if (((1 << v53) & 0x11) != 0)
        {
          if ((v76 & 1) == 0) {
            goto LABEL_141;
          }
          goto LABEL_138;
        }
        if (v52 != 110)
        {
          if (((1 << v53) & 0xA4) != 0) {
            goto LABEL_141;
          }
          goto LABEL_138;
        }
        if (v35)
        {
          if ((v12 & 0x80) == 0) {
            goto LABEL_141;
          }
        }
        else if ((v58 & 0x100000000) == 0)
        {
          goto LABEL_141;
        }
        goto LABEL_131;
    }
  }
}

@end