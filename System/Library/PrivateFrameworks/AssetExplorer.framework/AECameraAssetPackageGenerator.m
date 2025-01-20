@interface AECameraAssetPackageGenerator
- (AECameraAssetPackageGenerator)init;
- (OS_dispatch_queue)_generationQueue;
- (void)_populatePackage:(id)a3 fromReviewAsset:(id)a4 withCompletionHandler:(id)a5;
- (void)generatePackageFromReviewAsset:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation AECameraAssetPackageGenerator

- (void).cxx_destruct
{
}

- (OS_dispatch_queue)_generationQueue
{
  return self->__generationQueue;
}

- (void)generatePackageFromReviewAsset:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(AECameraAssetPackageGenerator *)self _generationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__AECameraAssetPackageGenerator_generatePackageFromReviewAsset_withCompletionHandler___block_invoke;
  block[3] = &unk_26489BA28;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __86__AECameraAssetPackageGenerator_generatePackageFromReviewAsset_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) identifier];
  v2 = [[AEMutableAssetPackage alloc] initWithAssetIdentifier:v3];
  [*(id *)(a1 + 40) _populatePackage:v2 fromReviewAsset:*(void *)(a1 + 32) withCompletionHandler:*(void *)(a1 + 48)];
}

- (void)_populatePackage:(id)a3 fromReviewAsset:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, id, void *))a5;
  uint64_t v10 = [v8 playbackStyle];
  if ((unint64_t)(v10 - 1) <= 1)
  {
    v11 = [v8 providedFullsizeImageURL];
    id v12 = [v8 providedFullsizeRenderImageURL];
    v13 = [(id)*MEMORY[0x263F1DB18] identifier];
    id v14 = v7;
    if (v12)
    {
      [v7 storeURL:v12 forType:v13];

      [v7 storeURL:v11 forType:@"com.apple.assetexplorer.editedoriginalimage"];
LABEL_28:

      if (v7)
      {
        v26 = [v8 providedPreviewImage];
        if (v26) {
          [v7 setSidecarObject:v26 forKey:@"com.apple.assetexplorer.asset-preview-image"];
        }
      }
      v25 = 0;
      goto LABEL_33;
    }
    goto LABEL_12;
  }
  if (v10 == 3)
  {
    v11 = [v8 providedFullsizeImageURL];
    id v12 = [v8 providedFullsizeRenderImageURL];
    if (v12 && v11)
    {
      [v7 storeURL:v11 forType:@"com.apple.assetexplorer.editedoriginalimage"];
      v15 = [(id)*MEMORY[0x263F1DB18] identifier];
      v16 = v7;
      v17 = v12;
    }
    else
    {
      if (!v11)
      {
        v27 = PLAssetExplorerGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          int v29 = 138543362;
          uint64_t v30 = 0;
          _os_log_impl(&dword_22B526000, v27, OS_LOG_TYPE_ERROR, "<Camera> Failed to store live photo image URL %{public}@ into live photo asset package!", (uint8_t *)&v29, 0xCu);
        }

        id v7 = 0;
LABEL_17:
        v13 = [v8 providedVideoURL];
        v20 = [v8 providedFullsizeRenderVideoURL];
        if (v20 && v13)
        {
          [v7 storeURL:v13 forType:@"com.apple.assetexplorer.editedoriginalvideo"];
          v21 = [(id)*MEMORY[0x263F1DBC8] identifier];
          v22 = v7;
          v23 = v20;
        }
        else
        {
          if (!v13)
          {
            v28 = PLAssetExplorerGetLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              int v29 = 138543362;
              uint64_t v30 = 0;
              _os_log_impl(&dword_22B526000, v28, OS_LOG_TYPE_ERROR, "<Camera> Failed to store live photo video URL %{public}@ into live photo asset package!", (uint8_t *)&v29, 0xCu);
            }

            v21 = v7;
            id v7 = 0;
            goto LABEL_26;
          }
          v21 = [(id)*MEMORY[0x263F1DBC8] identifier];
          v22 = v7;
          v23 = v13;
        }
        [v22 storeURL:v23 forType:v21];
LABEL_26:

        goto LABEL_27;
      }
      v15 = [(id)*MEMORY[0x263F1DB18] identifier];
      v16 = v7;
      v17 = v11;
    }
    [v16 storeURL:v17 forType:v15];

    goto LABEL_17;
  }
  if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    v11 = [v8 providedVideoURL];
    uint64_t v18 = [v8 providedFullsizeRenderVideoURL];
    id v12 = (void *)v18;
    if (!v11 || v18)
    {
      if (!v11 || !v18) {
        goto LABEL_28;
      }
      [v7 storeURL:v11 forType:@"com.apple.assetexplorer.editedoriginalvideo"];
      v13 = [(id)*MEMORY[0x263F1DBC8] identifier];
      id v14 = v7;
      v19 = v12;
      goto LABEL_13;
    }
    v13 = [(id)*MEMORY[0x263F1DBC8] identifier];
    id v14 = v7;
LABEL_12:
    v19 = v11;
LABEL_13:
    [v14 storeURL:v19 forType:v13];
LABEL_27:

    goto LABEL_28;
  }
  v24 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v29) = 0;
    _os_log_impl(&dword_22B526000, v24, OS_LOG_TYPE_ERROR, "<Camera> Failed to generate an asset package – no suitable data is available", (uint8_t *)&v29, 2u);
  }

  v25 = [MEMORY[0x263F087E8] errorWithDomain:@"AECameraAssetPackageGeneratorErrorDomain" code:-47201 userInfo:0];
  id v7 = 0;
LABEL_33:
  [v7 storeMetadataFromReviewAsset:v8];
  if (v9) {
    v9[2](v9, v7, v25);
  }
}

- (AECameraAssetPackageGenerator)init
{
  v8.receiver = self;
  v8.super_class = (Class)AECameraAssetPackageGenerator;
  v2 = [(AECameraAssetPackageGenerator *)&v8 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x263EF83A8], QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.asset-explorer.camera-package-generation", v3);
    generationQueue = v2->__generationQueue;
    v2->__generationQueue = (OS_dispatch_queue *)v4;

    id v6 = v2;
  }

  return v2;
}

@end