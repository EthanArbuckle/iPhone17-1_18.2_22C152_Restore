@interface AEPhotosAssetPackageGenerator
+ (void)deleteTemporaryStorageWithTimeout:(double)a3;
- (AEAssetPackage)_ivarQueue_currentPackage;
- (AEPhotosAssetPackageGenerator)initWithAsset:(id)a3;
- (AEPhotosAssetPackageGenerator)initWithAssetReference:(id)a3;
- (BOOL)retrieveGeneratedPackageWithCompletion:(id)a3;
- (NSError)_ivarQueue_lastError;
- (NSProgress)progress;
- (OS_dispatch_group)_packagerWorkGroup;
- (OS_dispatch_queue)_packagerIvarIsolationQueue;
- (PHAsset)_asset;
- (PHAssetExportRequest)_exportRequest;
- (PUPickerAssetPreparationOptions)preparationOptions;
- (PXAssetReference)sourceAssetReference;
- (id)_assetPackageforPHAsset:(id)a3 withAssetExportRequestFileURLs:(id)a4 error:(id *)a5;
- (id)_copyAssetExportFileURLs:(id)a3 forAsset:(id)a4 error:(id *)a5;
- (id)_copyItemAtURL:(id)a3 toOutputDirectory:(id)a4 error:(id *)a5;
- (id)_createOutputDirectoryBaseURLWithIdentifier:(id)a3 error:(id *)a4;
- (id)_generatePackageFromAsset:(id)a3;
- (id)beginGenerating;
- (void)_callCompletionWithResult:(id)a3;
- (void)_commonAEPhotosAssetPackageGeneratorInitWithAsset:(id)a3 assetReference:(id)a4;
- (void)_generatePackageWithAssetExportFileURLs:(id)a3 error:(id)a4;
- (void)_setIvarQueueCurrentPackage:(id)a3;
- (void)_setIvarQueueLastError:(id)a3;
- (void)cancelReviewAssetRequest;
- (void)requestReviewAssetWithCompletionHandler:(id)a3;
- (void)setPreparationOptions:(id)a3;
- (void)set_asset:(id)a3;
@end

@implementation AEPhotosAssetPackageGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__asset, 0);
  objc_storeStrong((id *)&self->__ivarQueue_lastError, 0);
  objc_storeStrong((id *)&self->__ivarQueue_currentPackage, 0);
  objc_storeStrong((id *)&self->__exportRequest, 0);
  objc_storeStrong((id *)&self->__packagerWorkGroup, 0);
  objc_storeStrong((id *)&self->__packagerIvarIsolationQueue, 0);
  objc_storeStrong((id *)&self->_preparationOptions, 0);
  objc_storeStrong((id *)&self->_sourceAssetReference, 0);
}

- (void)set_asset:(id)a3
{
}

- (PHAsset)_asset
{
  return self->__asset;
}

- (void)_setIvarQueueLastError:(id)a3
{
}

- (NSError)_ivarQueue_lastError
{
  return self->__ivarQueue_lastError;
}

- (void)_setIvarQueueCurrentPackage:(id)a3
{
}

- (AEAssetPackage)_ivarQueue_currentPackage
{
  return self->__ivarQueue_currentPackage;
}

- (PHAssetExportRequest)_exportRequest
{
  return self->__exportRequest;
}

- (OS_dispatch_group)_packagerWorkGroup
{
  return self->__packagerWorkGroup;
}

- (OS_dispatch_queue)_packagerIvarIsolationQueue
{
  return self->__packagerIvarIsolationQueue;
}

- (void)setPreparationOptions:(id)a3
{
}

- (PUPickerAssetPreparationOptions)preparationOptions
{
  return self->_preparationOptions;
}

- (PXAssetReference)sourceAssetReference
{
  return self->_sourceAssetReference;
}

- (void)cancelReviewAssetRequest
{
  id v2 = [(AEPhotosAssetPackageGenerator *)self progress];
  [v2 cancel];
}

- (void)requestReviewAssetWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(AEPhotosAssetPackageGenerator *)self beginGenerating];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__AEPhotosAssetPackageGenerator_requestReviewAssetWithCompletionHandler___block_invoke;
  v7[3] = &unk_26489BA50;
  id v8 = v4;
  id v6 = v4;
  [(AEPhotosAssetPackageGenerator *)self retrieveGeneratedPackageWithCompletion:v7];
}

void __73__AEPhotosAssetPackageGenerator_requestReviewAssetWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  char v11 = v10;
  if (v10)
  {
    v12 = [v7 reviewAssetFromPackageMetadata];
  }
  else
  {
    v12 = 0;
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __73__AEPhotosAssetPackageGenerator_requestReviewAssetWithCompletionHandler___block_invoke_2;
  v18[3] = &unk_26489BBC8;
  id v21 = *(id *)(a1 + 32);
  char v22 = v11;
  char v23 = a4;
  id v13 = v9;
  id v19 = v13;
  id v14 = v12;
  id v20 = v14;
  v15 = (void (**)(void))MEMORY[0x230F4A730](v18);
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v15[2](v15);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__AEPhotosAssetPackageGenerator_requestReviewAssetWithCompletionHandler___block_invoke_3;
    block[3] = &unk_26489BBF0;
    v17 = v15;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __73__AEPhotosAssetPackageGenerator_requestReviewAssetWithCompletionHandler___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 48);
  if (v1) {
    return (*(uint64_t (**)(void, void, void, void, void))(v1 + 16))(*(void *)(result + 48), *(unsigned __int8 *)(result + 56), *(unsigned __int8 *)(result + 57), *(void *)(result + 32), *(void *)(result + 40));
  }
  return result;
}

uint64_t __73__AEPhotosAssetPackageGenerator_requestReviewAssetWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_assetPackageforPHAsset:(id)a3 withAssetExportRequestFileURLs:(id)a4 error:(id *)a5
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v50 = [v7 objectForKeyedSubscript:*MEMORY[0x263F14F90]];
  v49 = [v7 objectForKeyedSubscript:*MEMORY[0x263F14F98]];
  v48 = [v7 objectForKeyedSubscript:*MEMORY[0x263F14F80]];
  id v8 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 uuid];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_22B526000, v8, OS_LOG_TYPE_DEFAULT, "[AEPhotosAssetPackageGenerator] Creating asset package for asset %{public}@ with file URLS: %{public}@", buf, 0x16u);
  }
  if ([v6 isPhoto]) {
    int v10 = [v6 canPlayLoopingVideo] ^ 1;
  }
  else {
    int v10 = 0;
  }
  if ([v6 isVideo]) {
    int v11 = 1;
  }
  else {
    int v11 = [v6 canPlayLoopingVideo];
  }
  if (v50) {
    int v12 = v10;
  }
  else {
    int v12 = 0;
  }
  if (v12 == 1)
  {
    id v13 = v50;
    if ([v6 playbackStyle] == 3)
    {
      if (!v49)
      {
        v17 = PLAssetExplorerGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B526000, v17, OS_LOG_TYPE_ERROR, "[AEPhotosAssetPackageGenerator] No video URL found for Live Photo asset, from asset export request.", buf, 2u);
        }
        id v29 = 0;
        v15 = 0;
        id v14 = 0;
        goto LABEL_57;
      }
      id v14 = v49;
      v15 = 0;
    }
    else
    {
      v15 = 0;
      id v14 = 0;
    }
  }
  else
  {
    if (v49) {
      int v16 = v11;
    }
    else {
      int v16 = 0;
    }
    if (v16 != 1)
    {
      v17 = PLAssetExplorerGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v47 = [v6 uuid];
        if (v10) {
          v18 = @"YES";
        }
        else {
          v18 = @"NO";
        }
        id v19 = v18;
        if (v50) {
          id v20 = @"YES";
        }
        else {
          id v20 = @"NO";
        }
        id v21 = v20;
        char v22 = v19;
        if (v11) {
          char v23 = @"YES";
        }
        else {
          char v23 = @"NO";
        }
        v24 = v23;
        v25 = v21;
        if (v49) {
          v26 = @"YES";
        }
        else {
          v26 = @"NO";
        }
        v27 = v26;
        v28 = v24;
        *(_DWORD *)buf = 138544386;
        *(void *)&buf[4] = v47;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2114;
        v59 = (uint64_t (*)(uint64_t, uint64_t))v21;
        *(_WORD *)v60 = 2114;
        *(void *)&v60[2] = v24;
        *(_WORD *)&v60[10] = 2114;
        *(void *)&v60[12] = v27;
        _os_log_impl(&dword_22B526000, v17, OS_LOG_TYPE_ERROR, "[AEPhotosAssetPackageGenerator] Could not retrieve valid URLs for creating a package for asset: %{public}@. Is image? %{public}@. Photo URL available? %{public}@. Is video or auto/loop? %{public}@. Video URL available? %{public}@.", buf, 0x34u);
      }
      id v29 = 0;
      v15 = 0;
      id v14 = 0;
      id v13 = 0;
      goto LABEL_57;
    }
    id v14 = v49;
    if ([v6 isHighFrameRateVideo])
    {
      v15 = [v6 ALAssetURL];
    }
    else
    {
      v15 = 0;
    }
    id v13 = 0;
  }
  id v30 = v6;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v59 = __Block_byref_object_copy__1229;
  *(void *)v60 = __Block_byref_object_dispose__1230;
  *(void *)&v60[8] = 0;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__1229;
  v56 = __Block_byref_object_dispose__1230;
  id v57 = 0;
  v31 = [MEMORY[0x263F5DB58] defaultFormatChooser];
  v32 = [v31 masterThumbnailFormat];

  objc_msgSend(v32, "sizeWithFallBackSize:", 256.0, 256.0);
  double v34 = v33;
  double v36 = v35;
  id v37 = objc_alloc_init(MEMORY[0x263F14E40]);
  [v37 setVersion:0];
  [v37 setSynchronous:1];
  [v37 setDeliveryMode:1];
  [v37 setNetworkAccessAllowed:0];
  v38 = [MEMORY[0x263F14E38] defaultManager];
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = ___PreviewImageForAsset_block_invoke;
  v51[3] = &unk_26489BC18;
  v51[4] = buf;
  v51[5] = &v52;
  objc_msgSend(v38, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v30, 0, v37, v51, v34, v36);

  if (a5)
  {
    v39 = (void *)v53[5];
    if (v39) {
      *a5 = v39;
    }
  }
  id v29 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(buf, 8);

  if (!v29)
  {
    v17 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v43 = [v30 uuid];
      id v44 = *a5;
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v43;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v44;
      _os_log_impl(&dword_22B526000, v17, OS_LOG_TYPE_ERROR, "[AEPhotosAssetPackageGenerator] Could not generate preview image for asset: %{public}@. Error: %{public}@", buf, 0x16u);
    }
    id v29 = 0;
LABEL_57:
    v40 = 0;
    goto LABEL_58;
  }
  v17 = [v30 uuid];
  v40 = [[AEMutableAssetPackage alloc] initWithAssetIdentifier:v17];
  if (v13)
  {
    v41 = [(id)*MEMORY[0x263F1DB18] identifier];
    [(AEMutableAssetPackage *)v40 storeURL:v13 forType:v41];
  }
  if (v14)
  {
    v42 = [(id)*MEMORY[0x263F1DBC8] identifier];
    [(AEMutableAssetPackage *)v40 storeURL:v14 forType:v42];
  }
  [(AEMutableAssetPackage *)v40 setSidecarObject:v29 forKey:@"com.apple.assetexplorer.asset-preview-image"];
  if (v15) {
    [(AEMutableAssetPackage *)v40 storeURL:v15 forType:@"com.apple.assetexplorer.alasset.url"];
  }
  [(AEMutableAssetPackage *)v40 storeMetadataFromPHAsset:v30 imageURL:v50 adjustmentURL:v48];
LABEL_58:

  return v40;
}

- (id)_copyAssetExportFileURLs:(id)a3 forAsset:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = [a4 uuid];
  uint64_t v10 = [(AEPhotosAssetPackageGenerator *)self _createOutputDirectoryBaseURLWithIdentifier:v9 error:a5];

  v26 = (void *)v10;
  if (v10)
  {
    int v11 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    int v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id v25 = v8;
      uint64_t v15 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          v18 = -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v17, v25);
          id v19 = [(AEPhotosAssetPackageGenerator *)self _copyItemAtURL:v18 toOutputDirectory:v26 error:a5];
          if (!v19)
          {
            id v21 = PLAssetExplorerGetLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              id v22 = *a5;
              *(_DWORD *)buf = 138543618;
              v32 = v12;
              __int16 v33 = 2114;
              id v34 = v22;
              _os_log_impl(&dword_22B526000, v21, OS_LOG_TYPE_ERROR, "[AEPhotosAssetPackageGenerator] Error making local copy of asset export file URLs: %{public}@. Error: %{public}@", buf, 0x16u);
            }

            int v11 = 0;
            goto LABEL_14;
          }
          id v20 = v19;
          [v11 setObject:v19 forKeyedSubscript:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v14) {
          continue;
        }
        break;
      }
LABEL_14:
      id v8 = v25;
    }
  }
  else
  {
    int v12 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      char v23 = *a5;
      *(_DWORD *)buf = 138543362;
      v32 = v23;
      _os_log_impl(&dword_22B526000, v12, OS_LOG_TYPE_ERROR, "[AEPhotosAssetPackageGenerator] Error making local copy of asset export file URLs because the temporary output directory coudln't be created: %{public}@", buf, 0xCu);
    }
    int v11 = 0;
  }

  return v11;
}

- (id)_copyItemAtURL:(id)a3 toOutputDirectory:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (void *)MEMORY[0x263F08850];
  id v9 = a4;
  uint64_t v10 = [v8 defaultManager];
  int v11 = [v7 lastPathComponent];
  int v12 = [v9 URLByAppendingPathComponent:v11];

  if ([v10 copyItemAtURL:v7 toURL:v12 error:a5])
  {
    id v13 = v12;
  }
  else
  {
    uint64_t v14 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = *a5;
      int v17 = 138543874;
      id v18 = v7;
      __int16 v19 = 2114;
      id v20 = v12;
      __int16 v21 = 2114;
      id v22 = v15;
      _os_log_impl(&dword_22B526000, v14, OS_LOG_TYPE_ERROR, "[AEPhotosAssetPackageGenerator] Couldn't copy item at URL '%{public}@' to '%{public}@'. Error: %{public}@", (uint8_t *)&v17, 0x20u);
    }

    id v13 = 0;
  }

  return v13;
}

- (id)_createOutputDirectoryBaseURLWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 lastPathComponent];
  id v7 = NSTemporaryDirectory();
  id v8 = [v7 stringByAppendingPathComponent:v6];

  id v9 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v10 = [NSURL fileURLWithPath:v8];
  if ([v9 fileExistsAtPath:v8])
  {
    int v11 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543618;
      id v21 = v5;
      __int16 v22 = 2114;
      id v23 = v8;
      _os_log_impl(&dword_22B526000, v11, OS_LOG_TYPE_DEFAULT, "[AEPhotosAssetPackageGenerator] Output directory for identifier '%{public}@' already exists at: '%{public}@'. Deleting...", (uint8_t *)&v20, 0x16u);
    }

    if (([v9 removeItemAtURL:v10 error:a4] & 1) == 0)
    {
      int v12 = PLAssetExplorerGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = *a4;
        int v20 = 138543618;
        id v21 = v8;
        __int16 v22 = 2114;
        id v23 = v13;
        _os_log_impl(&dword_22B526000, v12, OS_LOG_TYPE_ERROR, "[AEPhotosAssetPackageGenerator] Error deleting directory '%{public}@'. Error: %{public}@", (uint8_t *)&v20, 0x16u);
      }
    }
  }
  if (*a4) {
    goto LABEL_16;
  }
  int v14 = [v9 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:a4];
  id v15 = PLAssetExplorerGetLog();
  int v16 = v15;
  if (!v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v18 = *a4;
      int v20 = 138543874;
      id v21 = v10;
      __int16 v22 = 2114;
      id v23 = v5;
      __int16 v24 = 2114;
      id v25 = v18;
      _os_log_impl(&dword_22B526000, v16, OS_LOG_TYPE_ERROR, "[AEPhotosAssetPackageGenerator] Unable to create directory '%{public}@' for saving exported asset resources of identifier: %{public}@. Error: %{public}@", (uint8_t *)&v20, 0x20u);
    }

LABEL_16:
    id v17 = 0;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138543618;
    id v21 = v5;
    __int16 v22 = 2114;
    id v23 = v10;
    _os_log_impl(&dword_22B526000, v16, OS_LOG_TYPE_DEFAULT, "[AEPhotosAssetPackageGenerator] Created output directory for identifier '%{public}@' at: '%{public}@'.", (uint8_t *)&v20, 0x16u);
  }

  id v17 = v10;
LABEL_17:

  return v17;
}

- (id)_generatePackageFromAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(AEPhotosAssetPackageGenerator *)self _packagerWorkGroup];
  dispatch_group_enter(v5);
  id v6 = [(AEPhotosAssetPackageGenerator *)self _exportRequest];
  id v7 = [v6 progress];

  LODWORD(v6) = _os_feature_enabled_impl();
  if ((v6 & PLIsLockdownMode()) == 1)
  {
    id v8 = PLPickerGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22B526000, v8, OS_LOG_TYPE_DEFAULT, "Lockdown mode is enabled, excluding location and caption metadata by default.", buf, 2u);
    }
  }
  id v9 = [(AEPhotosAssetPackageGenerator *)self preparationOptions];

  if (v9)
  {
    uint64_t v10 = [(AEPhotosAssetPackageGenerator *)self preparationOptions];
    [v10 shouldIncludeLocation];

    int v11 = [(AEPhotosAssetPackageGenerator *)self preparationOptions];
    [v11 shouldIncludeCaption];

    int v12 = [(AEPhotosAssetPackageGenerator *)self preparationOptions];
    [v12 userEncodingPolicy];
  }
  uint64_t v13 = PUActivityItemSharingPreferencesMake();
  uint64_t v15 = v14;
  id v16 = objc_alloc(MEMORY[0x263F5E3B0]);
  id v17 = [(AEPhotosAssetPackageGenerator *)self _exportRequest];
  id v18 = [v17 variants];
  __int16 v19 = objc_msgSend(v16, "initWithAsset:availableSharingVariants:activityType:preferences:", v4, v18, *MEMORY[0x263F6BD00], v13, v15);

  int v20 = [v19 assetExportRequestOptions];
  [v20 setFlattenSlomoVideos:0];
  id v21 = [(AEPhotosAssetPackageGenerator *)self _exportRequest];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __59__AEPhotosAssetPackageGenerator__generatePackageFromAsset___block_invoke;
  v25[3] = &unk_26489BB90;
  v25[4] = self;
  id v26 = v4;
  long long v27 = v5;
  __int16 v22 = v5;
  id v23 = v4;
  [v21 exportWithOptions:v20 completionHandler:v25];

  return v7;
}

void __59__AEPhotosAssetPackageGenerator__generatePackageFromAsset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v16 = 0;
    id v9 = (void *)[v7 _copyAssetExportFileURLs:v5 forAsset:v8 error:&v16];
    id v10 = v16;
    [*(id *)(a1 + 32) _generatePackageWithAssetExportFileURLs:v9 error:v10];
  }
  else if (v6)
  {
    int v11 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v12;
      __int16 v19 = 2114;
      id v20 = v6;
      _os_log_impl(&dword_22B526000, v11, OS_LOG_TYPE_ERROR, "[AEPhotosAssetPackageGenerator] Error during asset export request for asset: %{public}@. Error: %{public}@", buf, 0x16u);
    }

    uint64_t v13 = [*(id *)(a1 + 32) _packagerIvarIsolationQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__AEPhotosAssetPackageGenerator__generatePackageFromAsset___block_invoke_222;
    block[3] = &unk_26489BB68;
    void block[4] = *(void *)(a1 + 32);
    id v15 = v6;
    dispatch_sync(v13, block);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __59__AEPhotosAssetPackageGenerator__generatePackageFromAsset___block_invoke_222(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setIvarQueueLastError:*(void *)(a1 + 40)];
}

- (void)_generatePackageWithAssetExportFileURLs:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AEPhotosAssetPackageGenerator *)self _asset];
  id v9 = [(AEPhotosAssetPackageGenerator *)self _packagerWorkGroup];
  id v10 = dispatch_get_global_queue(25, 0);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__AEPhotosAssetPackageGenerator__generatePackageWithAssetExportFileURLs_error___block_invoke;
  v14[3] = &unk_26489BB40;
  id v15 = v7;
  id v16 = v6;
  id v17 = self;
  id v18 = v8;
  id v11 = v8;
  id v12 = v6;
  id v13 = v7;
  dispatch_group_async(v9, v10, v14);
}

void __79__AEPhotosAssetPackageGenerator__generatePackageWithAssetExportFileURLs_error___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (*(void *)(a1 + 40) && !*(void *)(a1 + 32))
  {
    id v4 = *(void **)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    id v14 = v2;
    v3 = objc_msgSend(v4, "_assetPackageforPHAsset:withAssetExportRequestFileURLs:error:", v5);
    id v6 = v14;

    id v2 = v6;
  }
  else
  {
    v3 = 0;
  }
  id v7 = (void *)[v3 copy];
  uint64_t v8 = [*(id *)(a1 + 48) _packagerIvarIsolationQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79__AEPhotosAssetPackageGenerator__generatePackageWithAssetExportFileURLs_error___block_invoke_2;
  v11[3] = &unk_26489BB18;
  v11[4] = *(void *)(a1 + 48);
  id v12 = v2;
  id v13 = v7;
  id v9 = v7;
  id v10 = v2;
  dispatch_sync(v8, v11);
}

uint64_t __79__AEPhotosAssetPackageGenerator__generatePackageWithAssetExportFileURLs_error___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setIvarQueueLastError:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 _setIvarQueueCurrentPackage:v3];
}

- (void)_callCompletionWithResult:(id)a3
{
  id v4 = (void (**)(id, uint64_t, uint64_t, uint64_t))a3;
  uint64_t v5 = [(AEPhotosAssetPackageGenerator *)self progress];
  uint64_t v6 = [v5 isCancelled];

  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__1229;
  uint64_t v21 = __Block_byref_object_dispose__1230;
  id v22 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__1229;
  id v15 = __Block_byref_object_dispose__1230;
  id v16 = 0;
  if ((v6 & 1) == 0)
  {
    id v9 = [(AEPhotosAssetPackageGenerator *)self _packagerIvarIsolationQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__AEPhotosAssetPackageGenerator__callCompletionWithResult___block_invoke;
    block[3] = &unk_26489BAF0;
    void block[4] = self;
    void block[5] = &v17;
    block[6] = &v11;
    dispatch_sync(v9, block);

    uint64_t v8 = v18[5];
    uint64_t v7 = v12[5];
  }
  v4[2](v4, v8, v7, v6);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
}

uint64_t __59__AEPhotosAssetPackageGenerator__callCompletionWithResult___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_ivarQueue_currentPackage");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_ivarQueue_lastError");
  return MEMORY[0x270F9A758]();
}

- (NSProgress)progress
{
  uint64_t v2 = [(AEPhotosAssetPackageGenerator *)self _exportRequest];
  uint64_t v3 = [v2 progress];

  return (NSProgress *)v3;
}

- (BOOL)retrieveGeneratedPackageWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AEPhotosAssetPackageGenerator *)self _packagerWorkGroup];
  intptr_t v6 = dispatch_group_wait(v5, 0);

  if (v6)
  {
    uint64_t v7 = [(AEPhotosAssetPackageGenerator *)self _packagerWorkGroup];
    uint64_t v8 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__AEPhotosAssetPackageGenerator_retrieveGeneratedPackageWithCompletion___block_invoke_2;
    block[3] = &unk_26489BAA0;
    void block[4] = self;
    id v14 = v4;
    id v9 = v4;
    dispatch_group_notify(v7, v8, block);

    id v10 = v14;
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __72__AEPhotosAssetPackageGenerator_retrieveGeneratedPackageWithCompletion___block_invoke;
    v15[3] = &unk_26489BA50;
    id v16 = v4;
    id v11 = v4;
    [(AEPhotosAssetPackageGenerator *)self _callCompletionWithResult:v15];
    id v10 = v16;
  }

  return v6 == 0;
}

uint64_t __72__AEPhotosAssetPackageGenerator_retrieveGeneratedPackageWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__AEPhotosAssetPackageGenerator_retrieveGeneratedPackageWithCompletion___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __72__AEPhotosAssetPackageGenerator_retrieveGeneratedPackageWithCompletion___block_invoke_3;
  v2[3] = &unk_26489BA50;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _callCompletionWithResult:v2];
}

void __72__AEPhotosAssetPackageGenerator_retrieveGeneratedPackageWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__AEPhotosAssetPackageGenerator_retrieveGeneratedPackageWithCompletion___block_invoke_4;
  v12[3] = &unk_26489BA78;
  id v9 = *(id *)(a1 + 32);
  id v14 = v8;
  id v15 = v9;
  id v13 = v7;
  char v16 = a4;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

uint64_t __72__AEPhotosAssetPackageGenerator_retrieveGeneratedPackageWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

- (id)beginGenerating
{
  id v3 = [(AEPhotosAssetPackageGenerator *)self _asset];
  id v4 = [(AEPhotosAssetPackageGenerator *)self _generatePackageFromAsset:v3];

  return v4;
}

- (AEPhotosAssetPackageGenerator)initWithAsset:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AEPhotosAssetPackageGenerator;
  uint64_t v5 = [(AEPhotosAssetPackageGenerator *)&v8 init];
  intptr_t v6 = v5;
  if (v5) {
    [(AEPhotosAssetPackageGenerator *)v5 _commonAEPhotosAssetPackageGeneratorInitWithAsset:v4 assetReference:0];
  }

  return v6;
}

- (AEPhotosAssetPackageGenerator)initWithAssetReference:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 asset];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10.receiver = self;
    v10.super_class = (Class)AEPhotosAssetPackageGenerator;
    intptr_t v6 = [(AEPhotosAssetPackageGenerator *)&v10 init];
    id v7 = v6;
    if (v6) {
      [(AEPhotosAssetPackageGenerator *)v6 _commonAEPhotosAssetPackageGeneratorInitWithAsset:v5 assetReference:v4];
    }
    self = v7;
    objc_super v8 = self;
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

- (void)_commonAEPhotosAssetPackageGeneratorInitWithAsset:(id)a3 assetReference:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = (OS_dispatch_group *)dispatch_group_create();
  packagerWorkGroup = self->__packagerWorkGroup;
  self->__packagerWorkGroup = v9;

  objc_storeStrong((id *)&self->__asset, a3);
  id v11 = (void *)[v8 copy];

  id v12 = v11;
  if (!v11)
  {
    id v13 = objc_alloc(MEMORY[0x263F5E130]);
    long long v14 = *(_OWORD *)(MEMORY[0x263F5E220] + 16);
    *(_OWORD *)buf = *MEMORY[0x263F5E220];
    *(_OWORD *)&uint8_t buf[16] = v14;
    id v12 = (void *)[v13 initWithSectionObject:0 itemObject:v7 subitemObject:0 indexPath:buf];
  }
  objc_storeStrong((id *)&self->_sourceAssetReference, v12);
  if (!v11) {

  }
  id v22 = 0;
  id v15 = [MEMORY[0x263F14D58] exportRequestForAsset:v7 error:&v22];
  id v16 = v22;
  exportRequest = self->__exportRequest;
  self->__exportRequest = v15;

  id v18 = self->__exportRequest;
  if (!v18)
  {
    uint64_t v19 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_22B526000, v19, OS_LOG_TYPE_ERROR, "[AEPhotosAssetPackageGenerator] Could not create export request for asset: %{public}@. Error: %{public}@", buf, 0x16u);
    }

    id v18 = self->__exportRequest;
  }
  [(PHAssetExportRequest *)v18 setAnalyticsActivityType:*MEMORY[0x263F6BD00]];
  [(PHAssetExportRequest *)self->__exportRequest setShouldSendTimingIntervalsToAnalytics:1];
  id v20 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AssetExplorer.AEPhotosAssetPackageGenerator.ivarQueue", MEMORY[0x263EF83A8]);
  packagerIvarIsolationQueue = self->__packagerIvarIsolationQueue;
  self->__packagerIvarIsolationQueue = v20;
}

+ (void)deleteTemporaryStorageWithTimeout:(double)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22B526000, v4, OS_LOG_TYPE_DEFAULT, "Beginning clean of temporary asset package storage", buf, 2u);
  }

  uint64_t v5 = NSTemporaryDirectory();
  intptr_t v6 = [MEMORY[0x263F08850] defaultManager];
  if (v5
    && [v5 containsString:@"Plugin"]
    && [v6 fileExistsAtPath:v5])
  {
    id v7 = [NSURL URLWithString:v5];
    id v16 = 0;
    id v8 = [v6 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:0 options:1 error:&v16];
    id v9 = v16;
    if (!v8)
    {
      objc_super v10 = PLAssetExplorerGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v9;
        _os_log_impl(&dword_22B526000, v10, OS_LOG_TYPE_ERROR, "Failed to get contents of tmp directory with error %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v8 = 0;
  }
  if ([v8 count])
  {
    id v11 = px_dispatch_queue_create_serial();
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __67__AEPhotosAssetPackageGenerator_deleteTemporaryStorageWithTimeout___block_invoke;
    v12[3] = &unk_26489BAC8;
    id v13 = v8;
    double v15 = a3;
    id v14 = v6;
    dispatch_async(v11, v12);
  }
  else
  {
    id v11 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22B526000, v11, OS_LOG_TYPE_DEFAULT, "No temporary asset packages to clean up", buf, 2u);
    }
  }
}

void __67__AEPhotosAssetPackageGenerator_deleteTemporaryStorageWithTimeout___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  double Current = CFAbsoluteTimeGetCurrent();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    id v7 = 0;
    uint64_t v8 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v3);
        }
        objc_super v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (CFAbsoluteTimeGetCurrent() - Current > *(double *)(a1 + 48))
        {
          id v16 = PLAssetExplorerGetLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22B526000, v16, OS_LOG_TYPE_DEFAULT, "Timed out deleting temporary asset package storage", buf, 2u);
          }

          goto LABEL_19;
        }
        id v11 = *(void **)(a1 + 40);
        id v20 = 0;
        int v12 = [v11 removeItemAtURL:v10 error:&v20];
        id v13 = v20;
        if (v12)
        {
          ++v7;
        }
        else
        {
          id v14 = PLAssetExplorerGetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            double v15 = [v10 path];
            *(_DWORD *)buf = 138412546;
            double v26 = *(double *)&v15;
            __int16 v27 = 2114;
            id v28 = v13;
            _os_log_impl(&dword_22B526000, v14, OS_LOG_TYPE_ERROR, "Failed to delete temporary asset package at %@: %{public}@", buf, 0x16u);
          }
          ++v6;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v33 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v6 = 0;
    id v7 = 0;
  }
LABEL_19:

  double v17 = CFAbsoluteTimeGetCurrent();
  id v18 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134218752;
    double v26 = v17 - Current;
    __int16 v27 = 2048;
    id v28 = v7;
    __int16 v29 = 2048;
    uint64_t v30 = v19;
    __int16 v31 = 2048;
    uint64_t v32 = v6;
    _os_log_impl(&dword_22B526000, v18, OS_LOG_TYPE_DEFAULT, "Finished deleting temporary asset package storage in %lf seconds. Deleted %lu of %lu with %lu failures", buf, 0x2Au);
  }
}

@end