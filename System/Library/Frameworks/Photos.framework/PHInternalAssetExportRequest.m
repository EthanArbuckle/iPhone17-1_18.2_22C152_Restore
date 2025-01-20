@interface PHInternalAssetExportRequest
+ (id)exportRequestForAsset:(id)a3 error:(id *)a4;
+ (id)exportRequestForAsset:(id)a3 variants:(id)a4 error:(id *)a5;
+ (id)knownCompatibleVariantTypeIdentifierForTypeIdentifier:(id)a3;
+ (id)variantsForAsset:(id)a3 asUnmodifiedOriginal:(BOOL)a4 error:(id *)a5;
- (id)_initWithAsset:(id)a3 variants:(id)a4 resourceRetrievalRequest:(id)a5 retrievalRequestProgressParent:(id)a6;
- (void)exportWithOptions:(id)a3 completionHandler:(id)a4;
- (void)preflightExportWithOptions:(id)a3 assetAvailability:(int64_t *)a4 isProcessingRequired:(BOOL *)a5 fileURLs:(id *)a6 info:(id *)a7;
@end

@implementation PHInternalAssetExportRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceRetrievingQueue, 0);
  objc_storeStrong((id *)&self->_resourceRetrievalRequestProgressParent, 0);

  objc_storeStrong((id *)&self->_resourceRetrievalRequest, 0);
}

- (void)exportWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PHInternalAssetExportRequest.m", 376, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];
  }
  if ([v7 variant] != 1)
  {
    v9 = [(PHAssetExportRequest *)self variants];
    v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "variant"));
    v11 = [v9 objectForKeyedSubscript:v10];

    if (!v11)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"PHInternalAssetExportRequest.m", 378, @"Invalid parameter not satisfying: %@", @"(options.variant == PHAssetExportRequestVariantCurrent) || self.variants[@(options.variant)]" object file lineNumber description];
    }
  }
  if (!v8)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PHInternalAssetExportRequest.m", 379, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v13 = [(PHAssetExportRequest *)self asset];
  v14 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v13 uuid];
    uint64_t v16 = [v13 mediaType];
    if ((unint64_t)(v16 - 1) > 2) {
      v17 = @"unknown";
    }
    else {
      v17 = off_1E58454F0[v16 - 1];
    }
    v18 = v17;
    v19 = +[PHAsset descriptionForMediaSubtypes:](PHAsset, "descriptionForMediaSubtypes:", [v13 mediaSubtypes]);
    v20 = [v13 uniformTypeIdentifier];
    *(_DWORD *)buf = 138413570;
    v32 = v13;
    __int16 v33 = 2114;
    v34 = v15;
    __int16 v35 = 2114;
    v36 = v18;
    __int16 v37 = 2114;
    v38 = v19;
    __int16 v39 = 2114;
    v40 = v20;
    __int16 v41 = 2114;
    id v42 = v7;
    _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_DEFAULT, "[PHInternalAssetExportRequest] Will export asset: %@ (%{public}@, %{public}@/%{public}@, %{public}@), options: %{public}@", buf, 0x3Eu);
  }
  resourceRetrievingQueue = self->_resourceRetrievingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PHInternalAssetExportRequest_exportWithOptions_completionHandler___block_invoke;
  block[3] = &unk_1E5848948;
  block[4] = self;
  id v28 = v13;
  id v29 = v7;
  id v30 = v8;
  id v22 = v8;
  id v23 = v7;
  id v24 = v13;
  dispatch_async(resourceRetrievingQueue, block);
}

void __68__PHInternalAssetExportRequest_exportWithOptions_completionHandler___block_invoke(id *a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [a1[4] setState:1];
  v2 = [a1[4] progress];
  uint64_t v3 = _AssetAvailabilityForAssetWithOptions(a1[5], a1[6], *((void **)a1[4] + 17), 0);
  id v5 = a1[5];
  id v4 = a1[6];
  v6 = [a1[4] assetMetadata];
  int v7 = PHAssetExportRequestProcessingRequiredForAssetWithOptions(v5, v4, v6);

  uint64_t v8 = 50;
  if (!v3) {
    uint64_t v8 = 98;
  }
  if (v7) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  [v2 setTotalUnitCount:100];
  [v2 addChild:*((void *)a1[4] + 18) withPendingUnitCount:100 - v9];
  v10 = _PHResourceLocalAvailabilityRequestOptionsFromPHAssetExportRequestOptions(a1[6]);
  v11 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [a1[5] uuid];
    v13 = off_1E5842298[v3];
    *(_DWORD *)buf = 138543618;
    id v29 = v12;
    __int16 v30 = 2114;
    v31 = v13;
    _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_DEFAULT, "[PHInternalAssetExportRequest] Resources availability for asset %{public}@: %{public}@", buf, 0x16u);
  }
  if (v3 == 2)
  {
    v14 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [a1[5] uuid];
      *(_DWORD *)buf = 138543362;
      id v29 = v17;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_DEFAULT, "[PHInternalAssetExportRequest] Waiting for deferred processing of resources of asset %{public}@...", buf, 0xCu);
    }
    uint64_t v16 = 4;
  }
  else if (v3 == 1)
  {
    v14 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [a1[5] uuid];
      *(_DWORD *)buf = 138543362;
      id v29 = v15;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_DEFAULT, "[PHInternalAssetExportRequest] Downloading required for resources of asset %{public}@...", buf, 0xCu);
    }
    uint64_t v16 = 3;
  }
  else
  {
    v14 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [a1[5] uuid];
      *(_DWORD *)buf = 138543362;
      id v29 = v18;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_DEFAULT, "[PHInternalAssetExportRequest] Required resources of asset %{public}@ are locally available.", buf, 0xCu);
    }
    uint64_t v16 = 2;
  }

  [a1[4] setState:v16];
  v19 = a1[4];
  v20 = (void *)v19[17];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __68__PHInternalAssetExportRequest_exportWithOptions_completionHandler___block_invoke_80;
  v22[3] = &unk_1E5842660;
  v22[4] = v19;
  id v23 = a1[5];
  id v24 = a1[6];
  id v25 = v2;
  uint64_t v27 = v9;
  id v26 = a1[7];
  id v21 = v2;
  [v20 retrieveRequiredResourcesWithOptions:v10 completionHandler:v22];
}

void __68__PHInternalAssetExportRequest_exportWithOptions_completionHandler___block_invoke_80(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v10 = a4;
  id v8 = a5;
  if ([v10 count])
  {
    uint64_t v9 = _ResourceInfoToFileURLs(v10);
  }
  else
  {
    uint64_t v9 = 0;
  }
  [*(id *)(a1 + 32) handleResultWithFileURLs:v9 cancelled:a3 withError:v8 forAsset:*(void *)(a1 + 40) withOptions:*(void *)(a1 + 48) progress:*(void *)(a1 + 56) processingUnitCount:*(void *)(a1 + 72) completionHandler:*(void *)(a1 + 64)];
}

- (void)preflightExportWithOptions:(id)a3 assetAvailability:(int64_t *)a4 isProcessingRequired:(BOOL *)a5 fileURLs:(id *)a6 info:(id *)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  if (!v12)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PHInternalAssetExportRequest.m", 345, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];
  }
  if ([v12 variant] != 1)
  {
    v13 = [(PHAssetExportRequest *)self variants];
    v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "variant"));
    v15 = [v13 objectForKeyedSubscript:v14];

    if (!v15)
    {
      uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, self, @"PHInternalAssetExportRequest.m", 347, @"Invalid parameter not satisfying: %@", @"(options.variant == PHAssetExportRequestVariantCurrent) || self.variants[@(options.variant)]" object file lineNumber description];
    }
  }
  BOOL v17 = ((unint64_t)a4 | (unint64_t)a5) != 0;
  if (!((unint64_t)a4 | (unint64_t)a5))
  {
    uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"PHInternalAssetExportRequest.m", 348, @"Invalid parameter not satisfying: %@", @"assetAvailability || isProcessingRequired" object file lineNumber description];
  }
  id v18 = (id)((unint64_t)a4 | (unint64_t)a6);
  v19 = [(PHAssetExportRequest *)self asset];
  v20 = v19;
  if ((unint64_t)a4 | (unint64_t)a6)
  {
    resourceRetrievalRequest = self->_resourceRetrievalRequest;
    id v33 = 0;
    int64_t v22 = _AssetAvailabilityForAssetWithOptions(v19, v12, resourceRetrievalRequest, (uint64_t)&v33);
    id v18 = v33;
    id v23 = off_1E5842298[v22];
    *a4 = v22;
    if (!a5)
    {
LABEL_10:
      id v24 = @"[Did not check]";
      goto LABEL_15;
    }
  }
  else
  {
    id v23 = @"[Did not check]";
    if (!a5) {
      goto LABEL_10;
    }
  }
  id v25 = [(PHAssetExportRequest *)self assetMetadata];
  int v26 = PHAssetExportRequestProcessingRequiredForAssetWithOptions(v20, v12, v25);

  uint64_t v27 = @"NO";
  if (v26) {
    uint64_t v27 = @"YES";
  }
  id v24 = v27;
  *a5 = v26;
LABEL_15:
  id v28 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    __int16 v35 = v23;
    __int16 v36 = 2114;
    __int16 v37 = v24;
    __int16 v38 = 2112;
    __int16 v39 = v20;
    __int16 v40 = 2112;
    id v41 = v12;
    _os_log_impl(&dword_19B043000, v28, OS_LOG_TYPE_DEFAULT, "[PHInternalAssetExportRequest] Asset resources availability: %{public}@ Processing is required: %{public}@ for export of asset: %@, options: %@", buf, 0x2Au);
  }

  if (a6)
  {
    if (v17)
    {
      id v29 = 0;
    }
    else
    {
      id v29 = _ResourceInfoToFileURLs(v18);
    }
    id v30 = v29;
    *a6 = v30;
  }
}

- (id)_initWithAsset:(id)a3 variants:(id)a4 resourceRetrievalRequest:(id)a5 retrievalRequestProgressParent:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PHInternalAssetExportRequest.m", 33, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  if ([v12 count])
  {
    if (v13) {
      goto LABEL_5;
    }
  }
  else
  {
    int64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PHInternalAssetExportRequest.m", 34, @"Invalid parameter not satisfying: %@", @"variants.count" object file lineNumber description];

    if (v13) {
      goto LABEL_5;
    }
  }
  id v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"PHInternalAssetExportRequest.m", 35, @"Invalid parameter not satisfying: %@", @"resourceRetrievalRequest" object file lineNumber description];

LABEL_5:
  v24.receiver = self;
  v24.super_class = (Class)PHInternalAssetExportRequest;
  v15 = [(PHAssetExportRequest *)&v24 initWithAsset:v11 variants:v12];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_resourceRetrievalRequest, a5);
    objc_storeStrong((id *)&v16->_resourceRetrievalRequestProgressParent, a6);
    BOOL v17 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v18 = dispatch_queue_create("PHInternalAssetExportRequest.ResourceRetrievingQueue", v17);
    resourceRetrievingQueue = v16->_resourceRetrievingQueue;
    v16->_resourceRetrievingQueue = (OS_dispatch_queue *)v18;
  }
  return v16;
}

+ (id)exportRequestForAsset:(id)a3 variants:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v9)
  {
    if (v10)
    {
LABEL_3:
      id v12 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"PHInternalAssetExportRequest.m", 236, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  id v20 = 0;
  id v11 = [(id)objc_opt_class() variantsForAsset:v9 asUnmodifiedOriginal:0 error:&v20];
  id v12 = v20;
LABEL_6:
  if ([v11 count])
  {
    id v14 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
    [v14 becomeCurrentWithPendingUnitCount:100];
    v15 = [[PHResourceLocalAvailabilityRequest alloc] initWithAsset:v9 requestType:1];
    [v14 resignCurrent];
    id v16 = [[PHInternalAssetExportRequest alloc] _initWithAsset:v9 variants:v11 resourceRetrievalRequest:v15 retrievalRequestProgressParent:v14];
    BOOL v17 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v16;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEBUG, "[PHInternalAssetExportRequest] Created export request: %@ for asset: %@", buf, 0x16u);
    }
  }
  else
  {
    dispatch_queue_t v18 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v9;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_ERROR, "[PHInternalAssetExportRequest] Failed to create export request for asset: %@, error: %@", buf, 0x16u);
    }

    id v16 = 0;
    if (a5) {
      *a5 = v12;
    }
  }

  return v16;
}

+ (id)exportRequestForAsset:(id)a3 error:(id *)a4
{
  return (id)[a1 exportRequestForAsset:a3 variants:0 error:a4];
}

+ (id)variantsForAsset:(id)a3 asUnmodifiedOriginal:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v63 = v62 = a5;
    [v63 handleFailureInMethod:a2, a1, @"PHInternalAssetExportRequest.m", 95, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    a5 = v62;
  }
  id v10 = [(id)objc_opt_class() assetExportLog];
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  id v12 = v10;
  id v13 = v12;
  unint64_t v71 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    id v14 = [v9 localIdentifier];
    *(_DWORD *)buf = 138543362;
    id v79 = v14;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SharingVariantsLatency", "localIdentifier==%{public}@", buf, 0xCu);
  }
  os_signpost_id_t spid = v11;
  v72 = v13;

  id v77 = 0;
  v15 = +[PHResourceLocalAvailabilityRequest resourceInfoForSharingAsset:v9 asUnmodifiedOriginal:v6 error:&v77];
  id v16 = v77;
  BOOL v17 = PLPhotoKitGetLog();
  dispatch_queue_t v18 = v17;
  if (v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v9 uuid];
      *(_DWORD *)buf = 138543618;
      id v79 = v19;
      __int16 v80 = 2112;
      id v81 = v15;
      _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_DEFAULT, "[PHInternalAssetExportRequest] Determining variants for asset %{public}@ with resource info: %@", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F1CA60] dictionary];
    dispatch_queue_t v18 = [v15 objectForKeyedSubscript:@"PHResourceLocalAvailabilityRequestPhotoUTIKey"];
    if (!v18)
    {
      id v23 = v16;
      goto LABEL_29;
    }
    [v20 setObject:v18 forKeyedSubscript:&unk_1EEB24F00];
    uint64_t v21 = [(id)objc_opt_class() knownCompatibleVariantTypeIdentifierForTypeIdentifier:v18];
    if (v21)
    {
      id v22 = (id)v21;
      id v23 = v16;
    }
    else
    {
      id v24 = a5;
      uint64_t v25 = [v15 objectForKeyedSubscript:@"PHResourceLocalAvailabilityRequestPhotoURLKey"];
      if (!v25
        || ([MEMORY[0x1E4F74900] imageSourceForFileURL:v25],
            (id v28 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v31 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v79 = v15;
          _os_log_impl(&dword_19B043000, v31, OS_LOG_TYPE_ERROR, "[PHInternalAssetExportRequest] Coudn't find a valid image source to pre-flight, from resource info: %@", buf, 0xCu);
        }

        id v23 = v16;
        goto LABEL_28;
      }
      id v29 = v28;
      [v28 markLivePhotoPairingIdentifierAsCheckedWithValue:*MEMORY[0x1E4F74A60]];
      id v75 = v16;
      id v76 = 0;
      v68 = v29;
      char v66 = _PreflightMediaConversion(v29, &v76, &v75);
      id v22 = v76;
      id v23 = v75;

      if ((v66 & 1) == 0)
      {
        id v30 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v79 = v9;
          __int16 v80 = 2112;
          id v81 = v23;
          _os_log_impl(&dword_19B043000, v30, OS_LOG_TYPE_ERROR, "[PHInternalAssetExportRequest] Failed to find compatible UTI for asset: %@, error: %@", buf, 0x16u);
        }

        id v20 = 0;
      }

      a5 = v24;
      if (!v22)
      {
LABEL_29:
        uint64_t v32 = [v15 objectForKeyedSubscript:@"PHResourceLocalAvailabilityRequestVideoUTIKey"];
        if (!v32)
        {
          unint64_t v27 = v71;
          goto LABEL_62;
        }
        if ([v9 canPlayLoopingVideo]) {
          int v33 = [v9 isMediaSubtype:8] & v6 ^ 1;
        }
        else {
          LOBYTE(v33) = 0;
        }
        uint64_t v34 = [v9 playbackStyle];
        if ((v33 & 1) == 0 && v34 != 4)
        {
LABEL_58:
          unint64_t v27 = v71;
          char v50 = v33 ^ 1;
          if (v23) {
            char v50 = 1;
          }
          if ((v50 & 1) == 0)
          {
            v51 = [(id)*MEMORY[0x1E4F443D0] identifier];
            [v20 setObject:v51 forKeyedSubscript:&unk_1EEB24F30];

            goto LABEL_63;
          }
LABEL_62:
          if (v23)
          {
LABEL_71:

            id v16 = v23;
            goto LABEL_72;
          }
LABEL_63:
          v52 = a5;
          uint64_t v53 = [v20 count];
          v54 = PLPhotoKitGetLog();
          v55 = v54;
          if (v53)
          {
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              v56 = [v9 uuid];
              *(_DWORD *)buf = 138543618;
              id v79 = v20;
              __int16 v80 = 2112;
              id v81 = v56;
              _os_log_impl(&dword_19B043000, v55, OS_LOG_TYPE_DEFAULT, "[PHInternalAssetExportRequest] Found variants: %{public}@ for asset %@", buf, 0x16u);
            }
            id v23 = 0;
          }
          else
          {
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              v57 = [v9 uuid];
              *(_DWORD *)buf = 138412290;
              id v79 = v57;
              _os_log_impl(&dword_19B043000, v55, OS_LOG_TYPE_ERROR, "[PHInternalAssetExportRequest] Found no variants for asset %@", buf, 0xCu);
            }
            objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"No variants found for asset: %@", v9);
            id v23 = (id)objc_claimAutoreleasedReturnValue();
          }
          a5 = v52;
          goto LABEL_71;
        }
        v69 = a5;
        [v20 setObject:v32 forKeyedSubscript:&unk_1EEB24F00];
        if ([v9 playbackStyle] == 4)
        {
          __int16 v35 = (void *)*MEMORY[0x1E4F44490];
          __int16 v36 = [(id)*MEMORY[0x1E4F44490] identifier];
          int v37 = [v32 isEqualToString:v36];

          if (v37)
          {
            [v9 fetchPropertySetsIfNeeded];
            __int16 v38 = [v9 photosInfoPanelExtendedProperties];
            __int16 v39 = [v38 codec];

            __int16 v40 = [MEMORY[0x1E4F8A740] HEVCfourCharCode];
            v67 = v39;
            LODWORD(v39) = [v39 isEqualToString:v40];

            if (!v39)
            {
              a5 = v69;
LABEL_57:

              goto LABEL_58;
            }
            id v41 = [v35 identifier];
            [v20 setObject:v41 forKeyedSubscript:&unk_1EEB24F18];
            goto LABEL_50;
          }
          uint64_t v42 = [(id)*MEMORY[0x1E4F44438] identifier];
          char v43 = [v32 isEqualToString:v42];

          if (v43)
          {
            a5 = v69;
            goto LABEL_58;
          }
        }
        uint64_t v44 = [v15 objectForKeyedSubscript:@"PHResourceLocalAvailabilityRequestVideoURLKey"];
        v67 = (void *)v44;
        if (v44)
        {
          v45 = [MEMORY[0x1E4F74900] videoSourceForFileURL:v44];
          if (v45)
          {
            id v41 = v45;
            [v45 markLivePhotoPairingIdentifierAsCheckedWithValue:*MEMORY[0x1E4F74A60]];
            id v73 = v23;
            id v74 = 0;
            int v64 = _PreflightMediaConversion(v41, &v74, &v73);
            id v46 = v74;
            id v47 = v73;

            if (v64)
            {
              v48 = v46;
              if (v46) {
                [v20 setObject:v46 forKeyedSubscript:&unk_1EEB24F18];
              }
              a5 = v69;
            }
            else
            {
              id v65 = v46;
              v49 = PLPhotoKitGetLog();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                id v79 = v9;
                __int16 v80 = 2112;
                id v81 = v47;
                _os_log_impl(&dword_19B043000, v49, OS_LOG_TYPE_ERROR, "[PHInternalAssetExportRequest] Failed to find compatible UTI for asset: %@, error: %@", buf, 0x16u);
              }

              id v20 = 0;
              a5 = v69;
              v48 = v65;
            }

            goto LABEL_56;
          }
        }
        id v41 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v79 = v15;
          _os_log_impl(&dword_19B043000, v41, OS_LOG_TYPE_ERROR, "[PHInternalAssetExportRequest] Coudn't find a valid video source to pre-flight, from resource info: %@", buf, 0xCu);
        }
LABEL_50:
        id v47 = v23;
        a5 = v69;
LABEL_56:

        id v23 = v47;
        goto LABEL_57;
      }
    }
    id v24 = a5;
    [v20 setObject:v22 forKeyedSubscript:&unk_1EEB24F18];
    uint64_t v25 = v22;
LABEL_28:

    a5 = v24;
    goto LABEL_29;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    int v26 = [v9 uuid];
    *(_DWORD *)buf = 138543618;
    id v79 = v26;
    __int16 v80 = 2112;
    id v81 = v16;
    _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_ERROR, "[PHInternalAssetExportRequest] Failed to find resource info for asset %{public}@, error: %@", buf, 0x16u);
  }
  id v20 = 0;
  unint64_t v27 = v11 - 1;
LABEL_72:

  if (a5 && v16) {
    *a5 = v16;
  }
  v58 = v72;
  v59 = v58;
  if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v59, OS_SIGNPOST_INTERVAL_END, spid, "SharingVariantsLatency", (const char *)&unk_19B30018E, buf, 2u);
  }

  id v60 = v20;
  return v60;
}

+ (id)knownCompatibleVariantTypeIdentifierForTypeIdentifier:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v16[0] = *MEMORY[0x1E4F44568];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v5 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  int v7 = (void *)[v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(v5, "conformsToType:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          int v7 = [(id)*MEMORY[0x1E4F44410] identifier];
          goto LABEL_11;
        }
      }
      int v7 = (void *)[v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

@end