@interface PHAssetResourceManager
+ (PHAssetResourceManager)defaultManager;
- (BOOL)retryAssetResourceRequest:(id)a3 afterFailureWithError:(id)a4;
- (PHAssetResourceDataRequestID)requestDataForAssetResource:(PHAssetResource *)resource options:(PHAssetResourceRequestOptions *)options dataReceivedHandler:(void *)handler completionHandler:(void *)completionHandler;
- (PHAssetResourceManager)init;
- (id)consolidateAssets:(id)a3 completionHandler:(id)a4;
- (id)infoForRequest:(int)a3;
- (id)reconnectAssets:(id)a3 urlResolvingHandler:(id)a4 completionHandler:(id)a5;
- (int)_nextRequestID;
- (int)_requestForAssetResource:(id)a3 loadURLOnly:(BOOL)a4 options:(id)a5 urlReceivedHandler:(id)a6 dataReceivedHandler:(id)a7 completionHandler:(id)a8;
- (int)requestFileURLForAssetResource:(id)a3 options:(id)a4 urlReceivedHandler:(id)a5 completionHandler:(id)a6;
- (int)requestWriteDataForAssetResource:(id)a3 toFile:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)_autoResolveReferencedResources:(id)a3 folderURL:(id)a4 resourceClient:(id)a5;
- (void)assetResourceRequest:(id)a3 didFinishWithError:(id)a4;
- (void)cancelDataRequest:(PHAssetResourceDataRequestID)requestID;
@end

@implementation PHAssetResourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestsLock_supplementaryContextsByID, 0);

  objc_storeStrong((id *)&self->_requestsLock_requestsByID, 0);
}

- (BOOL)retryAssetResourceRequest:(id)a3 afterFailureWithError:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PHRequestRetryTypeForRequest(v6, v7);
  switch(v8)
  {
    case 3:
      v11 = PLImageManagerGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [v6 taskIdentifier];
        *(_DWORD *)buf = 138543362;
        v40 = v12;
        _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_DEFAULT, "[RM] %{public}@ asset resource request requires additional resources to generate adjustment on demand", buf, 0xCu);
      }
      v13 = [v6 assetResource];
      v14 = [v13 asset];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v28 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v37 = *MEMORY[0x1E4F28228];
        v38 = @"Unable to start content editing request on behalf of asset resource request that is not backed by PHAsset";
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        v9 = [v28 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v29];

        [v6 configureWithError:v9];
        [v6 startRequest];
        goto LABEL_15;
      }
      v16 = [v6 assetResource];
      v32 = [v16 asset];

      unsigned int v31 = [v6 requestID];
      unint64_t managerID = self->_managerID;
      v18 = [v6 options];
      uint64_t v19 = [v18 isNetworkAccessAllowed];
      v20 = [v6 options];
      uint64_t v21 = [v20 downloadIntent];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __74__PHAssetResourceManager_retryAssetResourceRequest_afterFailureWithError___block_invoke_2;
      v34[3] = &unk_1E58471E8;
      id v22 = v6;
      id v35 = v22;
      v36 = self;
      v23 = +[PHContentEditingInputRequestContext contentEditingInputRequestContextForAsset:v32 requestID:v31 managerID:managerID networkAccessAllowed:v19 downloadIntent:v21 progressHandler:&__block_literal_global_144_36107 resultHandler:v34];

      id v33 = v22;
      id v24 = v23;
      PLSafeRunWithUnfairLock();
      [v24 start];

      break;
    case 2:
      v25 = PLImageManagerGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = [v6 taskIdentifier];
        *(_DWORD *)buf = 138543618;
        v40 = v26;
        __int16 v41 = 2112;
        id v42 = v7;
        _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_ERROR, "[RM] %{public}@ asset resource request retrying due to error: %@", buf, 0x16u);
      }
      [v6 startRequest];
      break;
    case 1:
      v9 = PLImageManagerGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = [v6 taskIdentifier];
        *(_DWORD *)buf = 138543618;
        v40 = v10;
        __int16 v41 = 2112;
        id v42 = v7;
        _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "[RM] %{public}@ asset resource request exceeded retry limit, failing with error: %@", buf, 0x16u);
      }
LABEL_15:

      goto LABEL_16;
    default:
LABEL_16:
      BOOL v27 = 0;
      goto LABEL_17;
  }
  BOOL v27 = 1;
LABEL_17:

  return v27;
}

void __74__PHAssetResourceManager_retryAssetResourceRequest_afterFailureWithError___block_invoke_2(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 containsValidData] & 1) == 0)
  {
    v4 = [v3 error];
    if (!v4)
    {
      v5 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = *MEMORY[0x1E4F28228];
      v9[0] = @"Content editing input request on behalf of asset resource request failed";
      id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
      v4 = [v5 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v6];
    }
    [*(id *)(a1 + 32) configureWithError:v4];
  }
  [*(id *)(a1 + 32) startRequest];
  id v7 = *(id *)(a1 + 32);
  PLSafeRunWithUnfairLock();
}

void __74__PHAssetResourceManager_retryAssetResourceRequest_afterFailureWithError___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "requestID"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v1 forKeyedSubscript:v3];
}

void __74__PHAssetResourceManager_retryAssetResourceRequest_afterFailureWithError___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 40);
  objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "requestID"));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setObject:0 forKeyedSubscript:v2];
}

- (void)assetResourceRequest:(id)a3 didFinishWithError:(id)a4
{
  id v5 = a3;
  id v4 = v5;
  PLSafeRunWithUnfairLock();
}

void __66__PHAssetResourceManager_assetResourceRequest_didFinishWithError___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 32);
  objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "requestID"));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setObject:0 forKeyedSubscript:v2];
}

- (int)_requestForAssetResource:(id)a3 loadURLOnly:(BOOL)a4 options:(id)a5 urlReceivedHandler:(id)a6 dataReceivedHandler:(id)a7 completionHandler:(id)a8
{
  BOOL v12 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v14)
  {
    id v18 = a8;
    uint64_t v19 = (void *)[v15 copy];

    id v20 = (id)[(PHAssetResourceManager *)self _nextRequestID];
    uint64_t v21 = [[PHAssetResourceRequest alloc] initWithAssetResource:v14 options:v19 requestID:v20 managerID:self->_managerID delegate:self urlReceivedHandler:v16 dataReceivedHandler:v17 completionHandler:v18];

    [(PHAssetResourceRequest *)v21 setLoadURLOnly:v12];
    id v22 = v21;
    PLSafeRunWithUnfairLock();
    v23 = PLImageManagerGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      id v24 = [(PHAssetResourceRequest *)v22 taskIdentifier];
      if ([v19 isNetworkAccessAllowed]) {
        v25 = @"Y";
      }
      else {
        v25 = @"N";
      }
      v26 = [v19 progressHandler];
      *(_DWORD *)buf = 138412802;
      BOOL v27 = @"Y";
      if (!v26) {
        BOOL v27 = @"N";
      }
      v32 = v24;
      __int16 v33 = 2112;
      v34 = v25;
      __int16 v35 = 2112;
      v36 = v27;
      _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_DEBUG, "[RM]: %@ starting asset resource request with network: %@, progress: %@", buf, 0x20u);
    }
    [(PHAssetResourceRequest *)v22 startRequest];
  }
  else
  {
    v28 = (void *)MEMORY[0x1E4F28C58];
    id v20 = a8;
    v29 = objc_msgSend(v28, "ph_genericErrorWithLocalizedDescription:", @"Cannot perform resource request for nil asset resource");
    (*((void (**)(id, void *))v20 + 2))(v20, v29);

    LODWORD(v20) = 0;
    uint64_t v19 = v15;
  }

  return (int)v20;
}

void __128__PHAssetResourceManager__requestForAssetResource_loadURLOnly_options_urlReceivedHandler_dataReceivedHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  [v2 setObject:v1 forKeyedSubscript:v3];
}

- (int)_nextRequestID
{
  return atomic_fetch_add(&self->_nextRequestID, 1u);
}

- (void)_autoResolveReferencedResources:(id)a3 folderURL:(id)a4 resourceClient:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v39 = a4;
  id v38 = a5;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v43;
    *(void *)&long long v9 = 138543362;
    long long v37 = v9;
    do
    {
      uint64_t v12 = 0;
      uint64_t v40 = v10;
      do
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v42 + 1) + 8 * v12);
        id v14 = (void *)MEMORY[0x19F389B10]();
        id v15 = [v13 fileURL];
        if (!v15)
        {
          id v16 = [v13 fileSystemBookmark];
          id v17 = [v13 fileSystemVolume];
          int v18 = PLPrimaryResourceDataStoreReferenceFileURL();
          id v15 = 0;

          if (v18 == 3)
          {
            uint64_t v19 = PLImageManagerGetLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              id v20 = [v13 asset];
              uint64_t v21 = [v20 uuid];
              *(_DWORD *)buf = 138543618;
              v47 = v21;
              __int16 v48 = 2112;
              id v49 = v15;
              id v22 = v19;
              os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
              id v24 = "No volume URL for referenced resource for asset %{public}@, using artificial volume for URL %@";
              uint32_t v25 = 22;
LABEL_13:
              _os_log_impl(&dword_19B043000, v22, v23, v24, buf, v25);
            }
LABEL_14:
          }
          else if (!v18)
          {
            uint64_t v19 = PLImageManagerGetLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              id v20 = [v13 asset];
              uint64_t v21 = [v20 uuid];
              *(_DWORD *)buf = v37;
              v47 = v21;
              id v22 = v19;
              os_log_type_t v23 = OS_LOG_TYPE_ERROR;
              id v24 = "Failed to resolve bookmark URL for asset %{public}@";
              uint32_t v25 = 12;
              goto LABEL_13;
            }
            goto LABEL_14;
          }
          if (!v15) {
            goto LABEL_22;
          }
        }
        v26 = (void *)MEMORY[0x1E4F8B908];
        BOOL v27 = objc_msgSend(v15, "path", v37);
        v28 = [v26 realPathForPath:v27 error:0];

        if (!v28)
        {
          uint64_t v29 = v11;
          v30 = [v15 lastPathComponent];
          unsigned int v31 = [v13 objectID];
          v32 = [v31 URIRepresentation];

          __int16 v33 = [v39 URLByAppendingPathComponent:v30 isDirectory:0];
          v34 = (void *)MEMORY[0x1E4F8B908];
          __int16 v35 = [v33 path];
          v36 = [v34 realPathForPath:v35 error:0];

          if (v36 && [MEMORY[0x1E4F8B9C8] processCanReadSandboxForPath:v36]) {
            [v38 updateInternalResourcePath:v36 objectURI:v32 error:0];
          }

          uint64_t v11 = v29;
          uint64_t v10 = v40;
        }

LABEL_22:
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v10);
  }
}

- (id)reconnectAssets:(id)a3 urlResolvingHandler:(id)a4 completionHandler:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [v8 count];
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v11 = 0;
      uint64_t v15 = *(void *)v36;
      do
      {
        uint64_t v16 = v14;
        do
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v12);
          }
          --v16;
        }
        while (v16);
        v11 += v14;
        uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v14);
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  id v17 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:v11];
  int v18 = dispatch_queue_create("PHAssetResourceManager.reconnectAssets", 0);
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __80__PHAssetResourceManager_reconnectAssets_urlResolvingHandler_completionHandler___block_invoke;
  v28[3] = &unk_1E58471C0;
  id v29 = v8;
  id v30 = v19;
  id v33 = v9;
  unsigned int v31 = self;
  id v20 = v17;
  id v32 = v20;
  id v34 = v10;
  id v21 = v10;
  id v22 = v9;
  id v23 = v19;
  id v24 = v8;
  dispatch_async(v18, v28);
  uint32_t v25 = v34;
  id v26 = v20;

  return v26;
}

uint64_t __80__PHAssetResourceManager_reconnectAssets_urlResolvingHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  __int16 v111 = 0;
  char v110 = 0;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v1 = [obj countByEnumeratingWithState:&v106 objects:v113 count:16];
  uint64_t v46 = v1;
  if (v1)
  {
    __int16 v41 = &v104;
    long long v42 = &v103;
    uint64_t v45 = *(void *)v107;
    uint64_t v40 = v97;
    long long v43 = v58;
LABEL_3:
    uint64_t v49 = 0;
    while (1)
    {
      if (*(void *)v107 != v45) {
        objc_enumerationMutation(obj);
      }
      v56 = *(void **)(*((void *)&v106 + 1) + 8 * v49);
      context = (void *)MEMORY[0x19F389B10](v1, v2, v3, v4);
      if (objc_msgSend(v56, "isReferencedAsset", v40, v41, v42, v43)) {
        break;
      }
LABEL_43:
      objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 56), "completedUnitCount") + 1);
LABEL_44:
      if (++v49 == v46)
      {
        uint64_t v1 = [obj countByEnumeratingWithState:&v106 objects:v113 count:16];
        uint64_t v46 = v1;
        if (!v1) {
          goto LABEL_48;
        }
        goto LABEL_3;
      }
    }
    if (!HIBYTE(v111))
    {
      if ((_BYTE)v111 && v110)
      {
        id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHPhotosErrorDomain" code:3110 userInfo:MEMORY[0x1E4F1CC08]];
        id v6 = *(void **)(a1 + 40);
        id v7 = [v56 localIdentifier];
        [v6 setObject:v5 forKeyedSubscript:v7];

        goto LABEL_44;
      }
      v47 = [v56 photoLibrary];
      id v8 = [v47 photoLibrary];
      uint64_t v100 = 0;
      v101 = &v100;
      uint64_t v102 = 0x3032000000;
      v103 = __Block_byref_object_copy__36140;
      v104 = __Block_byref_object_dispose__36141;
      id v105 = 0;
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v97[0] = __80__PHAssetResourceManager_reconnectAssets_urlResolvingHandler_completionHandler___block_invoke_127;
      v97[1] = &unk_1E5848318;
      v97[2] = v56;
      id v98 = v8;
      v99 = &v100;
      id v54 = v98;
      [v98 performBlockAndWait:v96];
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id v51 = (id)v101[5];
      uint64_t v9 = [v51 countByEnumeratingWithState:&v92 objects:v112 count:16];
      if (!v9) {
        goto LABEL_42;
      }
      uint64_t v52 = *(void *)v93;
LABEL_13:
      uint64_t v10 = 0;
      uint64_t v53 = v9;
      while (1)
      {
        if (*(void *)v93 != v52) {
          objc_enumerationMutation(v51);
        }
        uint64_t v11 = *(void *)(*((void *)&v92 + 1) + 8 * v10);
        id v12 = (void *)MEMORY[0x19F389B10]();
        uint64_t v86 = 0;
        v87 = &v86;
        uint64_t v88 = 0x3032000000;
        v89 = __Block_byref_object_copy__36140;
        v90 = __Block_byref_object_dispose__36141;
        id v91 = 0;
        v84[0] = 0;
        v84[1] = v84;
        v84[2] = 0x3032000000;
        v84[3] = __Block_byref_object_copy__36140;
        v84[4] = __Block_byref_object_dispose__36141;
        id v85 = 0;
        uint64_t v78 = 0;
        v79 = &v78;
        uint64_t v80 = 0x3032000000;
        v81 = __Block_byref_object_copy__36140;
        v82 = __Block_byref_object_dispose__36141;
        id v83 = 0;
        v77[0] = MEMORY[0x1E4F143A8];
        v77[1] = 3221225472;
        v77[2] = __80__PHAssetResourceManager_reconnectAssets_urlResolvingHandler_completionHandler___block_invoke_3;
        v77[3] = &unk_1E5847C80;
        v77[5] = &v86;
        v77[4] = v11;
        v77[6] = v84;
        v77[7] = &v78;
        [v54 performBlockAndWait:v77];
        uint64_t v13 = (void *)v87[5];
        if (v13)
        {
          uint64_t v14 = (void *)MEMORY[0x1E4F8B908];
          uint64_t v15 = [v13 path];
          uint64_t v16 = [v14 realPathForPath:v15 error:0];

          if (v16 && ([MEMORY[0x1E4F8B9C8] processCanReadSandboxForPath:v16] & 1) != 0)
          {
            int v17 = 5;
            goto LABEL_38;
          }
          __int16 v111 = 0;
          char v110 = 0;
          int v18 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
          if (!v18)
          {
            id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHPhotosErrorDomain" code:3110 userInfo:MEMORY[0x1E4F1CC08]];
            id v20 = *(void **)(a1 + 40);
            id v21 = [v56 localIdentifier];
            [v20 setObject:v19 forKeyedSubscript:v21];
          }
          int v22 = HIBYTE(v111) | v111;
          BOOL v23 = v22 == 0;
          BOOL v24 = v22 != 0;
          if (v23) {
            int v17 = 5;
          }
          else {
            int v17 = 4;
          }
          if (v18 && !v24)
          {
            uint32_t v25 = (void *)MEMORY[0x1E4F8B908];
            id v26 = [v18 path];
            id v76 = 0;
            BOOL v27 = [v25 realPathForPath:v26 error:&v76];
            id v50 = v76;

            if (v27)
            {
              v28 = [v47 assetsdClient];
              id v29 = [v28 resourceClient];

              uint64_t v30 = v79[5];
              id v75 = 0;
              int v31 = [v29 updateInternalResourcePath:v27 objectURI:v30 error:&v75];
              id v32 = v75;
              id v33 = v32;
              if (v31)
              {
                v73[0] = 0;
                v73[1] = v73;
                v73[2] = 0x3032000000;
                v73[3] = __Block_byref_object_copy__36140;
                v73[4] = __Block_byref_object_dispose__36141;
                id v74 = 0;
                uint64_t v67 = 0;
                v68 = &v67;
                uint64_t v69 = 0x3032000000;
                v70 = __Block_byref_object_copy__36140;
                v71 = __Block_byref_object_dispose__36141;
                id v72 = 0;
                v62[0] = MEMORY[0x1E4F143A8];
                v62[1] = 3221225472;
                v62[2] = __80__PHAssetResourceManager_reconnectAssets_urlResolvingHandler_completionHandler___block_invoke_134;
                v62[3] = &unk_1E5847198;
                v62[4] = v11;
                v64 = v84;
                v65 = v73;
                v66 = &v67;
                id v63 = v18;
                [v54 performBlockAndWait:v62];
                if (v68[5])
                {
                  v57[0] = MEMORY[0x1E4F143A8];
                  v57[1] = 3221225472;
                  v58[0] = __80__PHAssetResourceManager_reconnectAssets_urlResolvingHandler_completionHandler___block_invoke_2_135;
                  v58[1] = &unk_1E5847CB0;
                  v58[2] = *(void *)(a1 + 48);
                  v60 = v73;
                  v61 = &v67;
                  id v59 = v29;
                  [v54 performBlockAndWait:v57];
                }
                _Block_object_dispose(&v67, 8);

                _Block_object_dispose(v73, 8);
              }
              else
              {
                long long v36 = PHErrorFromPLError(v32);
                long long v37 = *(void **)(a1 + 40);
                long long v38 = [v56 localIdentifier];
                [v37 setObject:v36 forKeyedSubscript:v38];
              }
              int v17 = 0;
            }
            else
            {
              id v29 = PHErrorFromPLError(v50);
              long long v35 = *(void **)(a1 + 40);
              id v33 = [v56 localIdentifier];
              [v35 setObject:v29 forKeyedSubscript:v33];
              int v17 = 5;
            }
          }
        }
        else
        {
          uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHPhotosErrorDomain" code:3110 userInfo:MEMORY[0x1E4F1CC08]];
          id v34 = *(void **)(a1 + 40);
          int v18 = [v56 localIdentifier];
          [v34 setObject:v16 forKeyedSubscript:v18];
          int v17 = 5;
        }

LABEL_38:
        _Block_object_dispose(&v78, 8);

        _Block_object_dispose(v84, 8);
        _Block_object_dispose(&v86, 8);

        if (v17 != 5 && v17) {
          goto LABEL_42;
        }
        if (v53 == ++v10)
        {
          uint64_t v9 = [v51 countByEnumeratingWithState:&v92 objects:v112 count:16];
          if (!v9)
          {
LABEL_42:

            _Block_object_dispose(&v100, 8);
            goto LABEL_43;
          }
          goto LABEL_13;
        }
      }
    }
  }
LABEL_48:

  return (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
}

void __80__PHAssetResourceManager_reconnectAssets_urlResolvingHandler_completionHandler___block_invoke_127(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F8A950];
  uint64_t v3 = [*(id *)(a1 + 32) objectID];
  id v7 = [v2 assetWithObjectID:v3 inLibrary:*(void *)(a1 + 40)];

  uint64_t v4 = [v7 persistedResourcesMatching:&__block_literal_global_131_36145];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __80__PHAssetResourceManager_reconnectAssets_urlResolvingHandler_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) fileURL];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [*(id *)(a1 + 32) fileSystemBookmark];
    id v6 = [*(id *)(a1 + 32) fileSystemVolume];
    int v7 = PLPrimaryResourceDataStoreReferenceFileURL();
    id v8 = 0;

    if ((v7 - 1) >= 2)
    {
      if (!v7)
      {
        uint64_t v14 = PLImageManagerGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v22 = [*(id *)(a1 + 32) asset];
          BOOL v23 = [v22 uuid];
          *(_DWORD *)buf = 138543362;
          uint32_t v25 = v23;
          _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_ERROR, "Failed to resolve bookmark URL for asset %{public}@", buf, 0xCu);
        }
        goto LABEL_9;
      }
      if (v7 != 3)
      {
LABEL_10:

        goto LABEL_11;
      }
      uint64_t v9 = PLImageManagerGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [*(id *)(a1 + 32) asset];
        uint64_t v11 = [v10 uuid];
        *(_DWORD *)buf = 138543618;
        uint32_t v25 = v11;
        __int16 v26 = 2112;
        id v27 = v8;
        _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_DEFAULT, "No volume URL for referenced resource for asset %{public}@, using artificial volume for URL %@", buf, 0x16u);
      }
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id v13 = v8;
    uint64_t v14 = *(NSObject **)(v12 + 40);
    *(void *)(v12 + 40) = v13;
LABEL_9:

    goto LABEL_10;
  }
LABEL_11:
  uint64_t v15 = [*(id *)(a1 + 32) fileSystemVolume];
  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
  int v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  int v18 = [*(id *)(a1 + 32) objectID];
  uint64_t v19 = [v18 URIRepresentation];
  uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
  id v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;
}

void __80__PHAssetResourceManager_reconnectAssets_urlResolvingHandler_completionHandler___block_invoke_134(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  [v2 refreshObject:*(void *)(a1 + 32) mergeChanges:1];

  uint64_t v3 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v4 = [*(id *)(a1 + 32) objectID];
  id v18 = [v3 existingObjectWithID:v4 error:0];

  uint64_t v5 = v18;
  if (v18)
  {
    id v6 = [v18 fileSystemVolume];
    int v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) url];
    id v8 = [v7 path];

    if (!v8
      || ([v6 url],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          [v9 path],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = [v10 isEqualToString:v8],
          v10,
          v9,
          (v11 & 1) == 0))
    {
      uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) resources];
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      uint64_t v15 = [*(id *)(a1 + 40) URLByDeletingLastPathComponent];
      uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
      int v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;
    }
    uint64_t v5 = v18;
  }
}

uint64_t __80__PHAssetResourceManager_reconnectAssets_urlResolvingHandler_completionHandler___block_invoke_2_135(uint64_t a1)
{
  return [*(id *)(a1 + 32) _autoResolveReferencedResources:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) folderURL:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) resourceClient:*(void *)(a1 + 40)];
}

uint64_t __80__PHAssetResourceManager_reconnectAssets_urlResolvingHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [v2 version];
  int v4 = [v2 isDerivative];

  if (v3) {
    return 0;
  }
  else {
    return v4 ^ 1u;
  }
}

- (id)consolidateAssets:(id)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    char v11 = 0;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v14 isReferencedAsset])
        {
          uint64_t v15 = [v14 uuid];
          [v7 addObject:v15];

          if (!v11)
          {
            char v11 = [v14 photoLibrary];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
  else
  {
    char v11 = 0;
  }

  uint64_t v16 = [v11 assetsdClient];
  int v17 = [v16 resourceClient];

  if (v17)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __62__PHAssetResourceManager_consolidateAssets_completionHandler___block_invoke;
    v20[3] = &unk_1E5847150;
    id v21 = v6;
    id v18 = [v17 consolidateAssets:v7 completionHandler:v20];
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

uint64_t __62__PHAssetResourceManager_consolidateAssets_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)infoForRequest:(int)a3
{
  int v3 = PLSafeResultWithUnfairLock();

  return v3;
}

id __41__PHAssetResourceManager_infoForRequest___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 32);
  id v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  int v3 = [v1 objectForKeyedSubscript:v2];

  int v4 = [v3 info];

  return v4;
}

- (int)requestFileURLForAssetResource:(id)a3 options:(id)a4 urlReceivedHandler:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = v14;
  if (!v13)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PHAssetResourceManager.m", 167, @"Invalid parameter not satisfying: %@", @"urlReceivedHandler" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PHAssetResourceManager.m", 168, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v14) {
    goto LABEL_5;
  }
LABEL_3:
  int v16 = [(PHAssetResourceManager *)self _requestForAssetResource:v11 loadURLOnly:1 options:v12 urlReceivedHandler:v13 dataReceivedHandler:0 completionHandler:v15];

  return v16;
}

- (void)cancelDataRequest:(PHAssetResourceDataRequestID)requestID
{
  uint64_t v4 = MEMORY[0x1E4F143A8];
  LODWORD(v6) = requestID;
  int v3 = PLSafeResultWithUnfairLock();
  objc_msgSend(v3, "cancel", v4, 3221225472, __44__PHAssetResourceManager_cancelDataRequest___block_invoke, &unk_1E5847128, self, v6);
}

id __44__PHAssetResourceManager_cancelDataRequest___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 32);
  id v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  int v3 = [v1 objectForKeyedSubscript:v2];

  return v3;
}

- (int)requestWriteDataForAssetResource:(id)a3 toFile:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void *))a6;
  if (!v14)
  {
    int v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PHAssetResourceManager.m", 119, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  if ([v12 isFileURL])
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Invalid file url at '%@' for resource %@", v12, v11);
  }
  int v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v17 = [v12 path];
  int v18 = [v16 fileExistsAtPath:v17 isDirectory:0];

  if (!v18)
  {
    if (v11) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Cannot write data for nil asset resource");

    uint64_t v15 = (void *)v22;
    if (v22) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"File already exists at '%@' for resource %@", v12, v11);

  uint64_t v15 = (void *)v21;
  if (!v11) {
    goto LABEL_11;
  }
LABEL_8:
  if (v15)
  {
LABEL_9:
    v14[2](v14, v15);
    LODWORD(v19) = 0;
    uint64_t v20 = v13;
    goto LABEL_19;
  }
LABEL_12:
  uint64_t v20 = (void *)[v13 copy];

  uint64_t v19 = [(PHAssetResourceManager *)self _nextRequestID];
  long long v23 = [[PHAssetResourceWriteRequest alloc] initWithAssetResource:v11 destinationFileURL:v12 options:v20 requestID:v19 managerID:self->_managerID delegate:self completionHandler:v14];
  PLSafeRunWithUnfairLock();
  long long v24 = PLImageManagerGetLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    long long v25 = [(PHAssetResourceWriteRequest *)v23 taskIdentifier];
    int v26 = [v20 isNetworkAccessAllowed];
    uint64_t v27 = @"N";
    if (v26) {
      uint64_t v27 = @"Y";
    }
    id v32 = v27;
    uint64_t v28 = [v20 progressHandler];
    *(_DWORD *)buf = 138412802;
    id v29 = @"N";
    if (v28) {
      id v29 = @"Y";
    }
    id v34 = v25;
    __int16 v35 = 2112;
    long long v36 = v32;
    __int16 v37 = 2112;
    long long v38 = v29;
    _os_log_impl(&dword_19B043000, v24, OS_LOG_TYPE_DEBUG, "[RM]: %@ starting asset resource write request with network: %@, progress: %@", buf, 0x20u);
  }
  [(PHAssetResourceWriteRequest *)v23 startRequest];

LABEL_19:
  return v19;
}

void __92__PHAssetResourceManager_requestWriteDataForAssetResource_toFile_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  [v2 setObject:v1 forKeyedSubscript:v3];
}

- (PHAssetResourceDataRequestID)requestDataForAssetResource:(PHAssetResource *)resource options:(PHAssetResourceRequestOptions *)options dataReceivedHandler:(void *)handler completionHandler:(void *)completionHandler
{
  id v11 = resource;
  id v12 = options;
  id v13 = handler;
  id v14 = completionHandler;
  uint64_t v15 = v14;
  if (!v13)
  {
    int v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PHAssetResourceManager.m", 103, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PHAssetResourceManager.m", 104, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v14) {
    goto LABEL_5;
  }
LABEL_3:
  PHAssetResourceDataRequestID v16 = [(PHAssetResourceManager *)self _requestForAssetResource:v11 loadURLOnly:0 options:v12 urlReceivedHandler:0 dataReceivedHandler:v13 completionHandler:v15];

  return v16;
}

- (PHAssetResourceManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)PHAssetResourceManager;
  id v2 = [(PHAssetResourceManager *)&v9 init];
  id v3 = v2;
  if (v2)
  {
    atomic_store(1u, (unsigned int *)&v2->_nextRequestID);
    v2->_requestsLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    requestsLock_requestsByID = v3->_requestsLock_requestsByID;
    v3->_requestsLock_requestsByID = v4;

    uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    requestsLock_supplementaryContextsByID = v3->_requestsLock_supplementaryContextsByID;
    v3->_requestsLock_supplementaryContextsByID = v6;

    if (PHNextImageAndAssetResourceManagerID_onceToken != -1) {
      dispatch_once(&PHNextImageAndAssetResourceManagerID_onceToken, &__block_literal_global_22759);
    }
    v3->_unint64_t managerID = atomic_fetch_add((atomic_ullong *volatile)&PHNextImageAndAssetResourceManagerID_managerID, 1uLL);
  }
  return v3;
}

+ (PHAssetResourceManager)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_36183);
  }
  id v2 = (void *)defaultManager__manager;

  return (PHAssetResourceManager *)v2;
}

void __40__PHAssetResourceManager_defaultManager__block_invoke()
{
  v0 = objc_alloc_init(PHAssetResourceManager);
  uint64_t v1 = (void *)defaultManager__manager;
  defaultManager__manager = (uint64_t)v0;

  *(void *)(defaultManager__manager + 16) = 2;
}

@end