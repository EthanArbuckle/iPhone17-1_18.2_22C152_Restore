@interface PHImageResourceChooserBestPolicyHandler
+ (BOOL)_imageResourceIsUndecodableBasedOnResourceType:(unsigned int)a3 recipeID:(unsigned int)a4 version:(unsigned int)a5 asset:(id)a6 loggingPrefix:(id)a7;
+ (unint64_t)qualifyResourceInfo:(id)a3 againstPolicy:(int64_t)a4 requestInfo:(id)a5 reversed:(BOOL)a6 tooLargeForPolicy:(BOOL *)a7 disqualificationReason:(id *)a8;
@end

@implementation PHImageResourceChooserBestPolicyHandler

+ (unint64_t)qualifyResourceInfo:(id)a3 againstPolicy:(int64_t)a4 requestInfo:(id)a5 reversed:(BOOL)a6 tooLargeForPolicy:(BOOL *)a7 disqualificationReason:(id *)a8
{
  v10 = (id *)a6;
  id v14 = a3;
  id v15 = a5;
  v55.receiver = a1;
  v55.super_class = (Class)&OBJC_METACLASS___PHImageResourceChooserBestPolicyHandler;
  id v16 = objc_msgSendSuper2(&v55, sel_qualifyResourceInfo_againstPolicy_requestInfo_reversed_tooLargeForPolicy_disqualificationReason_, v14, a4, v15, v10, a7, a8);
  v17 = [v15 asset];
  v18 = [v14 dataStoreKey];

  v19 = [v15 behaviorSpec];
  char v53 = [v19 loadingOptions];

  v20 = [v15 behaviorSpec];
  unint64_t v21 = [v20 version];

  v22 = [v14 store];
  int v52 = [(id)objc_opt_class() storeClassID];

  double v23 = 0.0;
  if (v21 <= 1)
  {
    [v15 fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable];
    double v23 = v24;
  }
  if (v16)
  {
    if ((v53 & 6) != 0 && v52 == 1)
    {
      v25 = @"failed loading mode test";
LABEL_7:
      id v16 = 0;
      *a8 = v25;
      goto LABEL_11;
    }
    [v14 recipeID];
    if (PLResourceRecipeIsFullSizeDeferredProcessingPreview())
    {
      v26 = [v15 asset];
      int v27 = (int)v10;
      v10 = a8;
      uint64_t v28 = [v26 mediaType];

      BOOL v29 = v28 == 2;
      a8 = v10;
      LODWORD(v10) = v27;
      if (!v29)
      {
        v25 = @"failed deferred processing preview test";
        goto LABEL_7;
      }
    }
  }
LABEL_11:
  if (![v17 isRAWPlusJPEG])
  {
    if (v16) {
      goto LABEL_21;
    }
LABEL_59:
    unint64_t v49 = 0;
    goto LABEL_67;
  }
  if ([v14 resourceType] || objc_msgSend(v14, "version")) {
    int v30 = 1;
  }
  else {
    int v30 = [v14 isDerivative];
  }
  uint64_t v31 = [v17 originalResourceChoice];
  if (!v16) {
    goto LABEL_59;
  }
  if (v31 == 1 || v21 == 2)
  {
    if (v21 == 2) {
      int v44 = v30;
    }
    else {
      int v44 = 1;
    }
    if (v44 != 1)
    {
      v32 = @"r+j raw or derivatives";
      goto LABEL_66;
    }
    if (v31 == 1)
    {
      char v45 = [v14 version] ? 1 : v30;
      if ((v45 & 1) == 0)
      {
        v32 = @"r+j ignore orig JPEG";
        goto LABEL_66;
      }
    }
  }
  else if ([v14 resourceType] == 4)
  {
    v32 = @"r+j alt image";
LABEL_66:
    unint64_t v49 = 0;
    *a8 = v32;
    goto LABEL_67;
  }
LABEL_21:
  if ([v14 recipeID] == 65743
    && !v18
    && [v17 effectiveThumbnailIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v32 = @"cpl thumb test";
    goto LABEL_66;
  }
  if (!([v14 isHintBased] & 1 | (v18 != 0))
    && ([v14 canDownload] & 1) == 0
    && ![v14 locallyGeneratableOnDemand])
  {
    v32 = @"failed local/generatable test";
    goto LABEL_66;
  }
  BOOL v51 = v18 != 0;
  if ([v14 isHintBased] & 1) == 0 && (v53)
  {
    v54 = objc_opt_class();
    uint64_t v33 = [v14 resourceType];
    int v34 = (int)v10;
    v10 = (id *)[v14 recipeID];
    v35 = a8;
    uint64_t v36 = [v14 version];
    v37 = [v15 loggingPrefix];
    v38 = v10;
    LODWORD(v10) = v34;
    uint64_t v39 = v36;
    a8 = v35;
    LOBYTE(v34) = [v54 _imageResourceIsUndecodableBasedOnResourceType:v33 recipeID:v38 version:v39 asset:v17 loggingPrefix:v37];

    if (v34)
    {
      v32 = @"failed undecodable test";
      goto LABEL_66;
    }
  }
  if (v52 == 3 && ![v14 recipeID])
  {
    v40 = [v15 behaviorSpec];
    int v41 = [v40 isExplicitUserAction];

    if (!v41)
    {
      v32 = @"syndication originals test";
      goto LABEL_66;
    }
  }
  if (v21 < 2) {
    unsigned int v42 = v10 ^ 1;
  }
  else {
    unsigned int v42 = 0;
  }
  if (v42 == 1 && v23 > 0.0)
  {
    [v14 resourceScale];
    if (v23 > v43)
    {
      v32 = @"smaller than fallback scale";
      goto LABEL_66;
    }
  }
  [v14 resourceScale];
  float v47 = v46;
  [v15 requestedScale];
  if (v47 >= v48)
  {
    unint64_t v49 = 2;
    goto LABEL_67;
  }
  if (v23 > 0.0 && v51) {
    unint64_t v49 = 1;
  }
  else {
    unint64_t v49 = 2;
  }
  if ((v23 <= 0.0 || !v51) && ((v42 ^ 1) & 1) == 0)
  {
    if (a8)
    {
      v32 = @"too small";
      goto LABEL_66;
    }
    goto LABEL_59;
  }
LABEL_67:

  return v49;
}

+ (BOOL)_imageResourceIsUndecodableBasedOnResourceType:(unsigned int)a3 recipeID:(unsigned int)a4 version:(unsigned int)a5 asset:(id)a6 loggingPrefix:(id)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  id v12 = a7;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  unsigned int v42 = __Block_byref_object_copy__32307;
  float v43 = __Block_byref_object_dispose__32308;
  id v44 = 0;
  uint64_t v33 = 0;
  int v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__32307;
  v37 = __Block_byref_object_dispose__32308;
  id v38 = 0;
  v13 = [v11 managedObjectContextForFetchingResources];
  if (!(a4 | a3 | a5))
  {
    id v14 = v29;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __127__PHImageResourceChooserBestPolicyHandler__imageResourceIsUndecodableBasedOnResourceType_recipeID_version_asset_loggingPrefix___block_invoke;
    v29[3] = &unk_1E5847CB0;
    v29[4] = v11;
    id v30 = v13;
    uint64_t v31 = &v39;
    v32 = &v33;
    [v30 performBlockAndWait:v29];
    goto LABEL_7;
  }
  if (!a3 && a4 == 65938 && a5 == 2)
  {
    id v14 = v25;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __127__PHImageResourceChooserBestPolicyHandler__imageResourceIsUndecodableBasedOnResourceType_recipeID_version_asset_loggingPrefix___block_invoke_2;
    v25[3] = &unk_1E5847CB0;
    v25[4] = v11;
    id v26 = v13;
    int v27 = &v39;
    uint64_t v28 = &v33;
    [v26 performBlockAndWait:v25];
LABEL_7:
  }
  id v15 = (void *)v40[5];
  if (v15)
  {
    if ([v15 isEqualToString:@"CGImageProperties"])
    {
      uint64_t v16 = v34[5];
      if (v16)
      {
        id v24 = 0;
        v17 = [MEMORY[0x1E4F28F98] propertyListWithData:v16 options:0 format:0 error:&v24];
        id v18 = v24;
        BOOL v19 = v17 != 0;
        if (v17)
        {
          v20 = PLImageManagerGetLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v46 = (unint64_t)v12;
            _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_DEBUG, "[RM]: %@ Checking image decodability based on media metadata", buf, 0xCu);
          }

          if (!CGImageIsDecodable())
          {
            BOOL v19 = 0;
            goto LABEL_23;
          }
          unint64_t v21 = PLImageManagerGetLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            unint64_t v46 = (unint64_t)v12;
            __int16 v47 = 2048;
            unint64_t v48 = a5;
            _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_DEBUG, "[RM]: %@ Metadata decode check failed (version: %ld)", buf, 0x16u);
          }
        }
        else
        {
          unint64_t v21 = PLImageManagerGetLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            double v23 = [v11 uuid];
            *(_DWORD *)buf = 134218498;
            unint64_t v46 = a5;
            __int16 v47 = 2112;
            unint64_t v48 = (unint64_t)v23;
            __int16 v49 = 2112;
            id v50 = v18;
            _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_ERROR, "Error serializing media metadata for resource version: %ld, asset: %@, error: %@", buf, 0x20u);
          }
        }

LABEL_23:
        goto LABEL_18;
      }
    }
  }
  BOOL v19 = 0;
LABEL_18:

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v19;
}

void __127__PHImageResourceChooserBestPolicyHandler__imageResourceIsUndecodableBasedOnResourceType_recipeID_version_asset_loggingPrefix___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F8A950];
  v3 = [*(id *)(a1 + 32) uuid];
  id v13 = [v2 assetWithUUID:v3 inManagedObjectContext:*(void *)(a1 + 40)];

  v4 = [v13 master];
  uint64_t v5 = [v4 mediaMetadataType];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  v8 = [v13 master];
  v9 = [v8 mediaMetadata];
  uint64_t v10 = [v9 data];
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

void __127__PHImageResourceChooserBestPolicyHandler__imageResourceIsUndecodableBasedOnResourceType_recipeID_version_asset_loggingPrefix___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F8A950];
  v3 = [*(id *)(a1 + 32) uuid];
  id v13 = [v2 assetWithUUID:v3 inManagedObjectContext:*(void *)(a1 + 40)];

  v4 = [v13 additionalAttributes];
  uint64_t v5 = [v4 mediaMetadataType];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  v8 = [v13 additionalAttributes];
  v9 = [v8 mediaMetadata];
  uint64_t v10 = [v9 data];
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

@end