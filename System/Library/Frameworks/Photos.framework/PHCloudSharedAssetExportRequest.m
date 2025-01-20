@interface PHCloudSharedAssetExportRequest
+ (id)_resourceRetrievingQueue;
+ (id)exportRequestForAsset:(id)a3 error:(id *)a4;
+ (id)variantsForAsset:(id)a3 asUnmodifiedOriginal:(BOOL)a4 error:(id *)a5;
- (PHCloudSharedAssetExportRequest)initWithAsset:(id)a3 variants:(id)a4;
- (int)_requestImageURLForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 progressHandler:(id)a5 resultHandler:(id)a6 resultHandlerQueue:(id)a7;
- (int)_requestVideoURLForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 progressHandler:(id)a5 resultHandler:(id)a6 resultHandlerQueue:(id)a7;
- (void)_handleImageManagerResultForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 progress:(id)a5 processingUnitCount:(unint64_t)a6 options:(id)a7 withFileUrls:(id)a8 info:(id)a9 completionHandler:(id)a10;
- (void)_requestFileURLsForAsset:(id)a3 withOptions:(id)a4 networkAccessAllowed:(BOOL)a5 progressHandler:(id)a6 resultHandler:(id)a7 resultHandlerQueue:(id)a8;
- (void)_requestLivePhotoURLsForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 progressHandler:(id)a5 resultHandler:(id)a6 resultHandlerQueue:(id)a7;
- (void)exportWithOptions:(id)a3 completionHandler:(id)a4;
- (void)exportWithOptions:(id)a3 networkAccessAllowed:(BOOL)a4 completionHandler:(id)a5;
- (void)preflightExportWithOptions:(id)a3 assetAvailability:(int64_t *)a4 isProcessingRequired:(BOOL *)a5 fileURLs:(id *)a6 info:(id *)a7;
@end

@implementation PHCloudSharedAssetExportRequest

- (void).cxx_destruct
{
}

- (void)_handleImageManagerResultForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 progress:(id)a5 processingUnitCount:(unint64_t)a6 options:(id)a7 withFileUrls:(id)a8 info:(id)a9 completionHandler:(id)a10
{
  BOOL v35 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  v20 = [v18 objectForKeyedSubscript:@"PHImageCancelledKey"];
  if (v20)
  {
    v21 = [v18 objectForKeyedSubscript:@"PHImageCancelledKey"];
    uint64_t v22 = [v21 BOOLValue];
  }
  else
  {
    uint64_t v22 = 0;
  }

  uint64_t v23 = [v18 objectForKeyedSubscript:@"PHImageErrorKey"];
  v24 = (__CFString *)v23;
  if (!v17 || v23 || ![v17 count])
  {
    unint64_t v34 = a6;
    v25 = [v18 objectForKeyedSubscript:@"PHImageResultIsInCloudKey"];
    int v26 = [v25 BOOLValue];

    v27 = PLPhotoKitGetLog();
    v28 = v27;
    if (v35 || !v26)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v33 = @"NO";
        *(_DWORD *)buf = 138412802;
        id v38 = v14;
        __int16 v39 = 2112;
        if (v35) {
          v33 = @"YES";
        }
        v40 = v33;
        __int16 v41 = 2112;
        v42 = v24;
        v29 = "[PHCloudSharedAssetExportRequest] Failed to download asset for export: %@, networkAccessAllowed: %@, error: %@";
        v30 = v28;
        os_log_type_t v31 = OS_LOG_TYPE_ERROR;
        uint32_t v32 = 32;
        goto LABEL_15;
      }
    }
    else if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v38 = v14;
      __int16 v39 = 2112;
      v40 = v24;
      v29 = "[PHCloudSharedAssetExportRequest] Asset available in cloud, but export request options specified no network "
            "access. Export: %@, error: %@";
      v30 = v28;
      os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
      uint32_t v32 = 22;
LABEL_15:
      _os_log_impl(&dword_19B043000, v30, v31, v29, buf, v32);
    }

    a6 = v34;
  }
  [(PHAssetExportRequest *)self handleResultWithFileURLs:v17 cancelled:v22 withError:v24 forAsset:v14 withOptions:v16 progress:v15 processingUnitCount:a6 completionHandler:v19];
}

- (void)_requestLivePhotoURLsForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 progressHandler:(id)a5 resultHandler:(id)a6 resultHandlerQueue:(id)a7
{
  BOOL v35 = a4;
  id v11 = a3;
  id v12 = a5;
  id v34 = a6;
  id v13 = a7;
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x2020000000;
  v79[3] = 0;
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x2020000000;
  v78[3] = 0;
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x3032000000;
  v76[3] = __Block_byref_object_copy__34936;
  v76[4] = __Block_byref_object_dispose__34937;
  id v77 = 0;
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x3032000000;
  v74[3] = __Block_byref_object_copy__34936;
  v74[4] = __Block_byref_object_dispose__34937;
  id v75 = 0;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3032000000;
  v72[3] = __Block_byref_object_copy__34936;
  v72[4] = __Block_byref_object_dispose__34937;
  id v73 = 0;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x3032000000;
  v70[3] = __Block_byref_object_copy__34936;
  v70[4] = __Block_byref_object_dispose__34937;
  id v71 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke;
  aBlock[3] = &unk_1E5846FC8;
  v68 = v79;
  v69 = v78;
  id v14 = v12;
  id v67 = v14;
  id v15 = _Block_copy(aBlock);
  id v16 = dispatch_group_create();
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_2;
  v63[3] = &unk_1E5846FF0;
  v65 = v79;
  id v17 = v15;
  id v64 = v17;
  id v18 = _Block_copy(v63);
  dispatch_group_enter(v16);
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_3;
  v58[3] = &unk_1E5847018;
  v60 = v79;
  v61 = v72;
  v62 = v76;
  id v19 = v16;
  v59 = v19;
  v20 = _Block_copy(v58);
  uint64_t v53 = MEMORY[0x1E4F143A8];
  uint64_t v54 = 3221225472;
  v55 = __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_4;
  v56 = &unk_1E5847040;
  id v32 = v20;
  v33 = v18;
  id v57 = v32;
  id v21 = v13;
  self->_imageManagerImageRequestId = -[PHCloudSharedAssetExportRequest _requestImageURLForAsset:networkAccessAllowed:progressHandler:resultHandler:resultHandlerQueue:](self, "_requestImageURLForAsset:networkAccessAllowed:progressHandler:resultHandler:resultHandlerQueue:", v11);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_5;
  v50[3] = &unk_1E5846FF0;
  v52 = v78;
  id v22 = v17;
  id v51 = v22;
  uint64_t v23 = _Block_copy(v50);
  dispatch_group_enter(v19);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_6;
  v45[3] = &unk_1E5847018;
  v47 = v78;
  v48 = v70;
  v49 = v74;
  v24 = v19;
  v46 = v24;
  v25 = _Block_copy(v45);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_7;
  v43[3] = &unk_1E5847040;
  id v26 = v25;
  id v44 = v26;
  v27 = v11;
  id v28 = v11;
  v29 = v21;
  self->_imageManagerVideoRequestId = [(PHCloudSharedAssetExportRequest *)self _requestVideoURLForAsset:v28 networkAccessAllowed:v35 progressHandler:v23 resultHandler:v43 resultHandlerQueue:v21];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_8;
  block[3] = &unk_1E5847068;
  __int16 v39 = v76;
  v40 = v74;
  __int16 v41 = v72;
  v42 = v70;
  id v37 = v14;
  id v38 = v34;
  id v30 = v34;
  id v31 = v14;
  dispatch_group_notify(v24, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v70, 8);
  _Block_object_dispose(v72, 8);

  _Block_object_dispose(v74, 8);
  _Block_object_dispose(v76, 8);

  _Block_object_dispose(v78, 8);
  _Block_object_dispose(v79, 8);
}

void __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (*(double *)(*(void *)(a1[5] + 8) + 24) + *(double *)(*(void *)(a1[6] + 8) + 24) < 1.0)
  {
    uint64_t v4 = a1[4];
    if (v4)
    {
      id v5 = v3;
      (*(void (**)(void))(v4 + 16))();
      id v3 = v5;
    }
  }
}

uint64_t __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_2(uint64_t a1, double a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 * 0.3;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0x3FD3333333333333;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 objectForKeyedSubscript:@"PHAssetExportRequestPhotoFileURLKey"];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

uint64_t __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_5(uint64_t a1, double a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 * 0.7;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0x3FE6666666666666;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 objectForKeyedSubscript:@"PHAssetExportRequestVideoFileURLKey"];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

void __135__PHCloudSharedAssetExportRequest__requestLivePhotoURLsForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_8(void *a1)
{
  v22[2] = *MEMORY[0x1E4F143B8];
  char v19 = 0;
  uint64_t v2 = a1[4];
  if (v2) {
    (*(void (**)(uint64_t, void, char *, double))(v2 + 16))(v2, 0, &v19, 1.0);
  }
  uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (v3 && (uint64_t v4 = *(void *)(*(void *)(a1[7] + 8) + 40)) != 0)
  {
    v21[0] = @"PHAssetExportRequestPhotoFileURLKey";
    v21[1] = @"PHAssetExportRequestVideoFileURLKey";
    v22[0] = v3;
    v22[1] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)(*(void *)(a1[8] + 8) + 40)];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = *(id *)(*(void *)(a1[9] + 8) + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v13 = objc_msgSend(*(id *)(*(void *)(a1[8] + 8) + 40), "objectForKeyedSubscript:", v12, (void)v15);
        if (v13)
        {
          [v6 setObject:v13 forKeyedSubscript:v12];
        }
        else
        {
          id v14 = [*(id *)(*(void *)(a1[9] + 8) + 40) objectForKeyedSubscript:v12];
          [v6 setObject:v14 forKeyedSubscript:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v9);
  }

  (*(void (**)(void))(a1[5] + 16))();
}

- (int)_requestVideoURLForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 progressHandler:(id)a5 resultHandler:(id)a6 resultHandlerQueue:(id)a7
{
  uint64_t v9 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = a3;
  long long v15 = objc_alloc_init(PHVideoRequestOptions);
  [(PHVideoRequestOptions *)v15 setVersion:0];
  [(PHVideoRequestOptions *)v15 setRestrictToPlayableOnCurrentDevice:1];
  [(PHVideoRequestOptions *)v15 setDeliveryMode:1];
  [(PHVideoRequestOptions *)v15 setNetworkAccessAllowed:v9];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __130__PHCloudSharedAssetExportRequest__requestVideoURLForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke;
  v22[3] = &unk_1E58472C8;
  id v23 = v11;
  id v16 = v11;
  [(PHVideoRequestOptions *)v15 setProgressHandler:v22];
  [(PHVideoRequestOptions *)v15 setResultHandlerQueue:v13];

  long long v17 = +[PHImageManager defaultManager];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __130__PHCloudSharedAssetExportRequest__requestVideoURLForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_2;
  v20[3] = &unk_1E5846FA0;
  id v21 = v12;
  id v18 = v12;
  LODWORD(v9) = [v17 requestURLForVideo:v14 options:v15 resultHandler:v20];

  return v9;
}

uint64_t __130__PHCloudSharedAssetExportRequest__requestVideoURLForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __130__PHCloudSharedAssetExportRequest__requestVideoURLForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v8 = @"PHAssetExportRequestVideoFileURLKey";
    v9[0] = v5;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    id v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)_requestImageURLForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 progressHandler:(id)a5 resultHandler:(id)a6 resultHandlerQueue:(id)a7
{
  uint64_t v9 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = a3;
  long long v15 = objc_alloc_init(PHImageRequestOptions);
  [(PHImageRequestOptions *)v15 setVersion:0];
  [(PHImageRequestOptions *)v15 setDeliveryMode:1];
  [(PHImageRequestOptions *)v15 setNetworkAccessAllowed:v9];
  [(PHImageRequestOptions *)v15 setLoadingMode:0x10000];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __130__PHCloudSharedAssetExportRequest__requestImageURLForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke;
  v22[3] = &unk_1E58472C8;
  id v23 = v11;
  id v16 = v11;
  [(PHImageRequestOptions *)v15 setProgressHandler:v22];
  [(PHImageRequestOptions *)v15 setResultHandlerQueue:v13];

  long long v17 = +[PHImageManager defaultManager];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __130__PHCloudSharedAssetExportRequest__requestImageURLForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_2;
  v20[3] = &unk_1E5846F78;
  id v21 = v12;
  id v18 = v12;
  LODWORD(v9) = objc_msgSend(v17, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v14, 0, v15, v20, -1.0, -1.0);

  return v9;
}

uint64_t __130__PHCloudSharedAssetExportRequest__requestImageURLForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __130__PHCloudSharedAssetExportRequest__requestImageURLForAsset_networkAccessAllowed_progressHandler_resultHandler_resultHandlerQueue___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = [v4 objectForKeyedSubscript:@"PHImageFileURLKey"];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v5 setObject:v6 forKeyedSubscript:@"PHAssetExportRequestPhotoFileURLKey"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestFileURLsForAsset:(id)a3 withOptions:(id)a4 networkAccessAllowed:(BOOL)a5 progressHandler:(id)a6 resultHandler:(id)a7 resultHandlerQueue:(id)a8
{
  BOOL v11 = a5;
  id v21 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  uint64_t v18 = [v21 playbackStyle];
  if ((unint64_t)(v18 - 1) < 2) {
    goto LABEL_7;
  }
  if ((unint64_t)(v18 - 4) < 2)
  {
    int v19 = [(PHCloudSharedAssetExportRequest *)self _requestVideoURLForAsset:v21 networkAccessAllowed:v11 progressHandler:v15 resultHandler:v16 resultHandlerQueue:v17];
    uint64_t v20 = 140;
LABEL_8:
    *(_DWORD *)((char *)&self->super.super.isa + v20) = v19;
    goto LABEL_9;
  }
  if (v18 != 3) {
    goto LABEL_9;
  }
  if (!v14 || ([v14 treatLivePhotoAsStill] & 1) != 0)
  {
LABEL_7:
    int v19 = [(PHCloudSharedAssetExportRequest *)self _requestImageURLForAsset:v21 networkAccessAllowed:v11 progressHandler:v15 resultHandler:v16 resultHandlerQueue:v17];
    uint64_t v20 = 136;
    goto LABEL_8;
  }
  [(PHCloudSharedAssetExportRequest *)self _requestLivePhotoURLsForAsset:v21 networkAccessAllowed:v11 progressHandler:v15 resultHandler:v16 resultHandlerQueue:v17];
LABEL_9:
}

- (void)exportWithOptions:(id)a3 networkAccessAllowed:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PHCloudSharedAssetExportRequest.m", 131, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];
  }
  if ([v9 variant] != 1)
  {
    BOOL v11 = [(PHAssetExportRequest *)self variants];
    id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "variant"));
    id v13 = [v11 objectForKeyedSubscript:v12];

    if (!v13)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"PHCloudSharedAssetExportRequest.m", 133, @"Invalid parameter not satisfying: %@", @"(options.variant == PHAssetExportRequestVariantCurrent) || self.variants[@(options.variant)]" object file lineNumber description];
    }
  }
  if (!v10)
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PHCloudSharedAssetExportRequest.m", 134, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v15 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [(PHAssetExportRequest *)self asset];
    id v17 = [v16 uuid];
    uint64_t v18 = [(PHAssetExportRequest *)self asset];
    *(_DWORD *)buf = 138543874;
    v29 = v17;
    __int16 v30 = 2112;
    id v31 = v18;
    __int16 v32 = 2112;
    id v33 = v9;
    _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEFAULT, "[PHCloudSharedAssetExportRequest] Will export asset (%{public}@): %@, options: %@", buf, 0x20u);
  }
  int v19 = [(id)objc_opt_class() _resourceRetrievingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__PHCloudSharedAssetExportRequest_exportWithOptions_networkAccessAllowed_completionHandler___block_invoke;
  block[3] = &unk_1E5846F50;
  void block[4] = self;
  id v25 = v9;
  BOOL v27 = a4;
  id v26 = v10;
  id v20 = v10;
  id v21 = v9;
  dispatch_async(v19, block);
}

void __92__PHCloudSharedAssetExportRequest_exportWithOptions_networkAccessAllowed_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:1];
  uint64_t v2 = [*(id *)(a1 + 32) progress];
  uint64_t v3 = [*(id *)(a1 + 32) asset];
  if ([*(id *)(a1 + 40) shouldStripLocation]) {
    uint64_t v4 = 10;
  }
  else {
    uint64_t v4 = 0;
  }
  [v2 setTotalUnitCount:100];
  id v28 = 0;
  uint64_t v29 = 0;
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v27 = 0;
  [v5 preflightExportWithOptions:v6 assetAvailability:&v29 isProcessingRequired:0 fileURLs:&v28 info:&v27];
  id v7 = v28;
  id v8 = v27;
  *(_DWORD *)(*(void *)(a1 + 32) + 136) = 0;
  *(_DWORD *)(*(void *)(a1 + 32) + 140) = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__PHCloudSharedAssetExportRequest_exportWithOptions_networkAccessAllowed_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E5846F00;
  id v9 = v2;
  id v26 = v9;
  id v10 = (void (**)(void *, void, char *, double))_Block_copy(aBlock);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__PHCloudSharedAssetExportRequest_exportWithOptions_networkAccessAllowed_completionHandler___block_invoke_3;
  v17[3] = &unk_1E5846F28;
  id v11 = v9;
  id v18 = v11;
  v22[1] = (id)(100 - v4);
  objc_copyWeak(v22, &location);
  id v12 = v3;
  char v23 = *(unsigned char *)(a1 + 56);
  id v19 = v12;
  v22[2] = (id)v4;
  id v20 = *(id *)(a1 + 40);
  id v21 = *(id *)(a1 + 48);
  id v13 = (void (**)(void *, id, id))_Block_copy(v17);
  if (v29 == 1) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = 2;
  }
  [*(id *)(a1 + 32) setState:v14];
  if (!v29 && v7 && [v7 count])
  {
    char v16 = 0;
    v10[2](v10, 0, &v16, 1.0);
    v13[2](v13, v7, v8);
  }
  else
  {
    [*(id *)(a1 + 32) _requestFileURLsForAsset:v12 withOptions:*(void *)(a1 + 40) networkAccessAllowed:*(unsigned __int8 *)(a1 + 56) progressHandler:v10 resultHandler:v13 resultHandlerQueue:*(void *)(*(void *)(a1 + 32) + 144)];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __92__PHCloudSharedAssetExportRequest_exportWithOptions_networkAccessAllowed_completionHandler___block_invoke_4;
    v15[3] = &unk_1E5848578;
    v15[4] = *(void *)(a1 + 32);
    [v11 setCancellationHandler:v15];
  }

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
}

uint64_t __92__PHCloudSharedAssetExportRequest_exportWithOptions_networkAccessAllowed_completionHandler___block_invoke_2(uint64_t result, double a2)
{
  if ((uint64_t)llround(a2 * 100.0) <= 99) {
    return objc_msgSend(*(id *)(result + 32), "setCompletedUnitCount:");
  }
  return result;
}

void __92__PHCloudSharedAssetExportRequest_exportWithOptions_networkAccessAllowed_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = a2;
  [v6 setCompletedUnitCount:v5];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _handleImageManagerResultForAsset:*(void *)(a1 + 40) networkAccessAllowed:*(unsigned __int8 *)(a1 + 88) progress:*(void *)(a1 + 32) processingUnitCount:*(void *)(a1 + 80) options:*(void *)(a1 + 48) withFileUrls:v8 info:v7 completionHandler:*(void *)(a1 + 56)];
}

void __92__PHCloudSharedAssetExportRequest_exportWithOptions_networkAccessAllowed_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = +[PHImageManager defaultManager];
  [v2 cancelImageRequest:*(unsigned int *)(*(void *)(a1 + 32) + 136)];

  id v3 = +[PHImageManager defaultManager];
  [v3 cancelImageRequest:*(unsigned int *)(*(void *)(a1 + 32) + 140)];
}

- (void)exportWithOptions:(id)a3 completionHandler:(id)a4
{
}

- (void)preflightExportWithOptions:(id)a3 assetAvailability:(int64_t *)a4 isProcessingRequired:(BOOL *)a5 fileURLs:(id *)a6 info:(id *)a7
{
  id v13 = a3;
  if (!v13)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PHCloudSharedAssetExportRequest.m", 74, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];
  }
  if (!((unint64_t)a4 | (unint64_t)a5))
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PHCloudSharedAssetExportRequest.m", 75, @"Invalid parameter not satisfying: %@", @"assetAvailability || isProcessingRequired" object file lineNumber description];
  }
  if ([v13 variant] != 1)
  {
    uint64_t v14 = [(PHAssetExportRequest *)self variants];
    id v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "variant"));
    char v16 = [v14 objectForKeyedSubscript:v15];

    if (!v16)
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"PHCloudSharedAssetExportRequest.m", 77, @"Invalid parameter not satisfying: %@", @"(options.variant == PHAssetExportRequestVariantCurrent) || self.variants[@(options.variant)]" object file lineNumber description];
    }
  }
  if (a5) {
    *a5 = 0;
  }
  if (a4 || a6 || a7)
  {
    dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
    uint64_t v40 = 0;
    __int16 v41 = &v40;
    uint64_t v42 = 0x2020000000;
    uint64_t v43 = 0;
    uint64_t v34 = 0;
    BOOL v35 = &v34;
    uint64_t v36 = 0x3032000000;
    id v37 = __Block_byref_object_copy__34936;
    id v38 = __Block_byref_object_dispose__34937;
    id v39 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x3032000000;
    id v31 = __Block_byref_object_copy__34936;
    __int16 v32 = __Block_byref_object_dispose__34937;
    id v33 = 0;
    id v19 = [(PHAssetExportRequest *)self asset];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __115__PHCloudSharedAssetExportRequest_preflightExportWithOptions_assetAvailability_isProcessingRequired_fileURLs_info___block_invoke;
    v23[3] = &unk_1E5846ED8;
    id v25 = &v40;
    id v26 = &v34;
    id v27 = &v28;
    id v20 = v18;
    v24 = v20;
    [(PHCloudSharedAssetExportRequest *)self _requestFileURLsForAsset:v19 withOptions:v13 networkAccessAllowed:0 progressHandler:0 resultHandler:v23 resultHandlerQueue:self->_imageManagerResultHandlerQueue];

    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
    if (a4) {
      *a4 = v41[3];
    }
    if (a6) {
      *a6 = (id) v35[5];
    }
    if (a7) {
      *a7 = (id) v29[5];
    }

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v34, 8);

    _Block_object_dispose(&v40, 8);
  }
}

void __115__PHCloudSharedAssetExportRequest_preflightExportWithOptions_assetAvailability_isProcessingRequired_fileURLs_info___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"PHImageErrorKey"];
  if (v7) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (PHCloudSharedAssetExportRequest)initWithAsset:(id)a3 variants:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PHCloudSharedAssetExportRequest;
  uint64_t v4 = [(PHAssetExportRequest *)&v9 initWithAsset:a3 variants:a4];
  if (v4)
  {
    uint64_t v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("PHCloudSharedAssetExportRequest.ImageManagerResultHandlerQueue", v5);
    imageManagerResultHandlerQueue = v4->_imageManagerResultHandlerQueue;
    v4->_imageManagerResultHandlerQueue = (OS_dispatch_queue *)v6;
  }
  return v4;
}

+ (id)variantsForAsset:(id)a3 asUnmodifiedOriginal:(BOOL)a4 error:(id *)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PHCloudSharedAssetExportRequest.m", 66, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  id v12 = &unk_1EEB25FC8;
  id v8 = [v7 uniformTypeIdentifier];
  v13[0] = v8;
  objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  return v9;
}

+ (id)exportRequestForAsset:(id)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v6 = (PHCloudSharedAssetExportRequest *)a3;
  id v7 = v6;
  if (v6
    && (([(PHCloudSharedAssetExportRequest *)v6 isCloudSharedAsset] & 1) != 0
     || ([(PHCloudSharedAssetExportRequest *)v7 isStreamedVideo] & 1) != 0))
  {
    id v8 = [a1 variantsForAsset:v7 asUnmodifiedOriginal:0 error:0];
    objc_super v9 = [[PHCloudSharedAssetExportRequest alloc] initWithAsset:v7 variants:v8];
    id v10 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 138412546;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_DEBUG, "[PHCloudSharedAssetExportRequest] Created export request: %@ for asset: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"Asset %@ is not available or not supported by PHCloudSharedAssetExportRequest.";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v13 = [v11 errorWithDomain:@"PHAssetExportRequestCloudSharedAssetExportRequestErrorDomain" code:0 userInfo:v12];
    PHAssetExportRequestError(0, v13);
    id v8 = (PHCloudSharedAssetExportRequest *)objc_claimAutoreleasedReturnValue();

    uint64_t v14 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412546;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_ERROR, "[PHCloudSharedAssetExportRequest] Failed to create export request for asset: %@, error: %@", (uint8_t *)&v16, 0x16u);
    }

    if (a4)
    {
      id v8 = v8;
      objc_super v9 = 0;
      *a4 = v8;
    }
    else
    {
      objc_super v9 = 0;
    }
  }

  return v9;
}

+ (id)_resourceRetrievingQueue
{
  if (_resourceRetrievingQueue_onceToken != -1) {
    dispatch_once(&_resourceRetrievingQueue_onceToken, &__block_literal_global_34997);
  }
  uint64_t v2 = (void *)_resourceRetrievingQueue__sharedResourceRetrievingQueue;

  return v2;
}

void __59__PHCloudSharedAssetExportRequest__resourceRetrievingQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("PHCloudSharedAssetExportRequest.SharedResourceRetrievingQueue", v2);
  v1 = (void *)_resourceRetrievingQueue__sharedResourceRetrievingQueue;
  _resourceRetrievingQueue__sharedResourceRetrievingQueue = (uint64_t)v0;
}

@end