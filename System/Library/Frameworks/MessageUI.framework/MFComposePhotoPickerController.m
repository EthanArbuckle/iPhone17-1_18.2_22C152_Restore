@interface MFComposePhotoPickerController
- (MFComposePhotoPickerController)initWithPreselectedAssetIdentifiers:(id)a3;
- (MFComposePhotoPickerControllerDelegate)delegate;
- (MFComposePhotoPickerProgressManager)progressManager;
- (NSMutableSet)existingAssets;
- (OS_dispatch_queue)assetLoadingQueue;
- (PHPickerViewController)pickerViewController;
- (double)preferredHeightForTraitCollection:(id)a3;
- (id)_loadAssetForPickerResult:(id)a3 completionHandler:(id)a4;
- (void)_loadAssetForPickerResult:(id)a3;
- (void)_photoPickerItemForAssetIdentifier:(id)a3 assetURL:(id)a4 contentType:(id)a5 completionHandler:(id)a6;
- (void)_removeAssetWithIdentifier:(id)a3;
- (void)_setupPickerViewController;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)setAssetLoadingQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExistingAssets:(id)a3;
- (void)setProgressManager:(id)a3;
@end

@implementation MFComposePhotoPickerController

void ___ef_log_MFComposePhotoPickerController_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "MFComposePhotoPickerController");
  v1 = (void *)_ef_log_MFComposePhotoPickerController_log;
  _ef_log_MFComposePhotoPickerController_log = (uint64_t)v0;
}

- (MFComposePhotoPickerController)initWithPreselectedAssetIdentifiers:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MFComposePhotoPickerController;
  v5 = [(MFComposePhotoPickerController *)&v15 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CA80];
    v7 = objc_msgSend(v4, "ef_compactMap:", &__block_literal_global_15);
    uint64_t v8 = [v6 setWithSet:v7];
    existingAssets = v5->_existingAssets;
    v5->_existingAssets = (NSMutableSet *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.email.photopicker.loadingQueue", v11);
    assetLoadingQueue = v5->_assetLoadingQueue;
    v5->_assetLoadingQueue = (OS_dispatch_queue *)v12;

    [(MFComposePhotoPickerController *)v5 _setupPickerViewController];
  }

  return v5;
}

id __70__MFComposePhotoPickerController_initWithPreselectedAssetIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[MFComposePhotoPickerItem assetIdentifierFromContentIdentifier:a2];

  return v2;
}

- (void)_setupPickerViewController
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v3 = (void *)getPHPickerConfigurationClass_softClass;
  uint64_t v22 = getPHPickerConfigurationClass_softClass;
  if (!getPHPickerConfigurationClass_softClass)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __getPHPickerConfigurationClass_block_invoke;
    v17 = &unk_1E5F79A10;
    v18 = &v19;
    __getPHPickerConfigurationClass_block_invoke((uint64_t)&v14);
    v3 = (void *)v20[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v19, 8);
  id v5 = [v4 alloc];
  v6 = [MEMORY[0x1E4F39228] sharedPhotoLibrary];
  v7 = (void *)[v5 initWithPhotoLibrary:v6];

  [v7 setSelection:2];
  [v7 setSelectionLimit:0];
  uint64_t v8 = [(MFComposePhotoPickerController *)self existingAssets];
  v9 = [v8 allObjects];
  [v7 setPreselectedAssetIdentifiers:v9];

  [v7 setPreferredAssetRepresentationMode:2];
  [v7 _setDisabledPrivateCapabilities:64];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v10 = (void *)getPHPickerViewControllerClass_softClass;
  uint64_t v22 = getPHPickerViewControllerClass_softClass;
  if (!getPHPickerViewControllerClass_softClass)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __getPHPickerViewControllerClass_block_invoke;
    v17 = &unk_1E5F79A10;
    v18 = &v19;
    __getPHPickerViewControllerClass_block_invoke((uint64_t)&v14);
    v10 = (void *)v20[3];
  }
  v11 = v10;
  _Block_object_dispose(&v19, 8);
  dispatch_queue_t v12 = (PHPickerViewController *)[[v11 alloc] initWithConfiguration:v7];
  pickerViewController = self->_pickerViewController;
  self->_pickerViewController = v12;

  [(PHPickerViewController *)self->_pickerViewController setDelegate:self];
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v7 = objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_22);
  uint64_t v21 = [v6 setWithArray:v7];

  uint64_t v8 = [(MFComposePhotoPickerController *)self existingAssets];
  uint64_t v22 = [v21 differenceFromSet:v8];

  v20 = [(MFComposePhotoPickerController *)self delegate];
  if (([v22 hasChanges] & 1) == 0)
  {
    v9 = [(MFComposePhotoPickerController *)self progressManager];
    [v9 cancelEverything];

    [v20 photoPickerControllerDidCancel:self];
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v10 = [v22 removals];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v29;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v10);
        }
        [(MFComposePhotoPickerController *)self _removeAssetWithIdentifier:*(void *)(*((void *)&v28 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v11);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v14 = [v22 insertions];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v25;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * v17);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __58__MFComposePhotoPickerController_picker_didFinishPicking___block_invoke_2;
        v23[3] = &unk_1E5F79970;
        v23[4] = v18;
        uint64_t v19 = objc_msgSend(v5, "ef_firstObjectPassingTest:", v23);
        if (v19) {
          [(MFComposePhotoPickerController *)self _loadAssetForPickerResult:v19];
        }

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v15);
  }
}

id __58__MFComposePhotoPickerController_picker_didFinishPicking___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 assetIdentifier];

  return v2;
}

uint64_t __58__MFComposePhotoPickerController_picker_didFinishPicking___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 assetIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  uint64_t v3 = [a3 verticalSizeClass];
  double result = 300.0;
  if (v3 == 1) {
    return 160.0;
  }
  return result;
}

- (void)_removeAssetWithIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _ef_log_MFComposePhotoPickerController();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v4;
    _os_log_impl(&dword_1AF945000, v5, OS_LOG_TYPE_DEFAULT, "Remove asset with identifier %{public}@", buf, 0xCu);
  }

  v6 = [(MFComposePhotoPickerController *)self existingAssets];
  [v6 removeObject:v4];

  v7 = [(MFComposePhotoPickerController *)self progressManager];
  [v7 cancelProgressFor:v4];

  uint64_t v8 = [(MFComposePhotoPickerController *)self pickerViewController];
  id v11 = v4;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  [v8 _stopActivityIndicatorsForAssetsWithIdentifiers:v9];

  v10 = [(MFComposePhotoPickerController *)self delegate];
  [v10 photoPickerController:self didRemoveAsset:v4];
}

- (void)_loadAssetForPickerResult:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 assetIdentifier];
  _ef_log_MFComposePhotoPickerController();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v4 itemProvider];
    uint64_t v8 = [v7 registeredContentTypes];
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v5;
    __int16 v20 = 2114;
    uint64_t v21 = v8;
    _os_log_impl(&dword_1AF945000, v6, OS_LOG_TYPE_DEFAULT, "Adding asset with identifier: %{public}@, registeredContentTypes: %{public}@", buf, 0x16u);
  }
  v9 = [(MFComposePhotoPickerController *)self pickerViewController];
  uint64_t v17 = v5;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  [v9 _startActivityIndicatorsForAssetsWithIdentifiers:v10];

  id v11 = [(MFComposePhotoPickerController *)self assetLoadingQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__MFComposePhotoPickerController__loadAssetForPickerResult___block_invoke;
  v14[3] = &unk_1E5F79770;
  v14[4] = self;
  id v15 = v4;
  id v16 = v5;
  id v12 = v5;
  id v13 = v4;
  dispatch_async(v11, v14);
}

void __60__MFComposePhotoPickerController__loadAssetForPickerResult___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__MFComposePhotoPickerController__loadAssetForPickerResult___block_invoke_2;
  v12[3] = &unk_1E5F79998;
  v12[4] = v2;
  id v13 = *(id *)(a1 + 48);
  id v4 = [v2 _loadAssetForPickerResult:v3 completionHandler:v12];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__MFComposePhotoPickerController__loadAssetForPickerResult___block_invoke_4;
  v8[3] = &unk_1E5F79770;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = *(id *)(a1 + 48);
  v7 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v7 performBlock:v8];
}

void __60__MFComposePhotoPickerController__loadAssetForPickerResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__MFComposePhotoPickerController__loadAssetForPickerResult___block_invoke_3;
  v8[3] = &unk_1E5F79770;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v6;
  v7 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v7 performBlock:v8];
}

void __60__MFComposePhotoPickerController__loadAssetForPickerResult___block_invoke_3(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    id v4 = [v2 delegate];
    [v4 photoPickerController:*(void *)(a1 + 40) didAddItem:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = [v2 pickerViewController];
    v11[0] = *(void *)(a1 + 48);
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v5 deselectAssetsWithIdentifiers:v6];
  }
  v7 = [*(id *)(a1 + 40) progressManager];
  [v7 cancelProgressFor:*(void *)(a1 + 48)];

  uint64_t v8 = [*(id *)(a1 + 40) pickerViewController];
  uint64_t v10 = *(void *)(a1 + 48);
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  [v8 _stopActivityIndicatorsForAssetsWithIdentifiers:v9];
}

void __60__MFComposePhotoPickerController__loadAssetForPickerResult___block_invoke_4(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    id v4 = [v2 existingAssets];
    [v4 addObject:*(void *)(a1 + 48)];

    uint64_t v5 = [*(id *)(a1 + 40) progressManager];
    [v5 setProgress:*(void *)(a1 + 32) for:*(void *)(a1 + 48)];

    uint64_t v6 = _ef_log_MFComposePhotoPickerController();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v7;
      _os_log_impl(&dword_1AF945000, v6, OS_LOG_TYPE_DEFAULT, "Added asset with identifier: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = [v2 pickerViewController];
    uint64_t v12 = *(void *)(a1 + 48);
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    [v8 deselectAssetsWithIdentifiers:v9];

    uint64_t v6 = [*(id *)(a1 + 40) pickerViewController];
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    [v6 _stopActivityIndicatorsForAssetsWithIdentifiers:v10];
  }
}

- (id)_loadAssetForPickerResult:(id)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 itemProvider];
  id v9 = [v6 assetIdentifier];
  if (!v8)
  {
    uint64_t v10 = _ef_log_MFComposePhotoPickerController();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MFComposePhotoPickerController _loadAssetForPickerResult:completionHandler:]((uint64_t)v9, v10);
    }
    goto LABEL_11;
  }
  uint64_t v10 = [v8 registeredContentTypes];
  uint64_t v11 = +[MFComposePhotoPickerItem bestTypeToLoadFrom:v10];
  uint64_t v12 = _ef_log_MFComposePhotoPickerController();
  id v13 = v12;
  if (!v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MFComposePhotoPickerController _loadAssetForPickerResult:completionHandler:]((uint64_t)v9, (uint64_t)v10, v13);
    }

LABEL_11:
    uint64_t v17 = 0;
    goto LABEL_12;
  }
  uint64_t v14 = v12;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [v11 identifier];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v9;
    __int16 v25 = 2114;
    long long v26 = v15;
    _os_log_impl(&dword_1AF945000, v14, OS_LOG_TYPE_DEFAULT, "Loading representation for assetIdentifier: %{public}@ with type: %{public}@", buf, 0x16u);
  }
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __78__MFComposePhotoPickerController__loadAssetForPickerResult_completionHandler___block_invoke;
  v19[3] = &unk_1E5F799C0;
  objc_copyWeak(&v23, (id *)buf);
  id v20 = v9;
  id v16 = v11;
  id v21 = v16;
  id v22 = v7;
  uint64_t v17 = [v8 loadFileRepresentationForContentType:v16 openInPlace:0 completionHandler:v19];

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

LABEL_12:

  return v17;
}

void __78__MFComposePhotoPickerController__loadAssetForPickerResult_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!v6 || v7)
  {
    uint64_t v12 = _ef_log_MFComposePhotoPickerController();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __78__MFComposePhotoPickerController__loadAssetForPickerResult_completionHandler___block_invoke_cold_2();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v14 = 0;
    uint64_t v10 = objc_msgSend(v9, "mf_copyFileAtURLToContainer:securityScoped:preferredFileName:error:", v6, 0, 0, &v14);
    id v11 = v14;

    if (!v10 || v11)
    {
      id v13 = _ef_log_MFComposePhotoPickerController();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __78__MFComposePhotoPickerController__loadAssetForPickerResult_completionHandler___block_invoke_cold_1();
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      [WeakRetained _photoPickerItemForAssetIdentifier:*(void *)(a1 + 32) assetURL:v10 contentType:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
    }
  }
}

- (void)_photoPickerItemForAssetIdentifier:(id)a3 assetURL:(id)a4 contentType:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, MFComposePhotoPickerItem *))a6;
  if ([v11 conformsToType:*MEMORY[0x1E4F44400]])
  {
    id v26 = 0;
    uint64_t v13 = *MEMORY[0x1E4F1C538];
    id v25 = 0;
    int v14 = [v10 getResourceValue:&v26 forKey:v13 error:&v25];
    uint64_t v15 = (MFComposePhotoPickerItem *)v26;
    id v16 = v25;
    if (v14)
    {
      if (([(MFComposePhotoPickerItem *)v15 conformsToType:*MEMORY[0x1E4F44410]] & 1) != 0
        || ([(MFComposePhotoPickerItem *)v15 conformsToType:*MEMORY[0x1E4F44460]] & 1) != 0
        || [(MFComposePhotoPickerItem *)v15 conformsToType:*MEMORY[0x1E4F443D0]])
      {
        uint64_t v17 = [[MFComposePhotoPickerItem alloc] initWithAssetIdentifier:v9 assetURL:v10 assetData:0 contentType:v11];
        v12[2](v12, v17);
      }
      else
      {
        uint64_t v17 = [MEMORY[0x1E4F734C0] dataWithContentsOfURL:v10];
        uint64_t v19 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v19 removeItemAtURL:v10 error:0];

        id v20 = [(MFComposePhotoPickerItem *)v15 identifier];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __108__MFComposePhotoPickerController__photoPickerItemForAssetIdentifier_assetURL_contentType_completionHandler___block_invoke;
        v21[3] = &unk_1E5F799E8;
        id v22 = v9;
        long long v24 = v12;
        id v23 = v15;
        +[MFMediaExporter jpegRepresentationForImageData:v17 inputContentType:v20 completion:v21];
      }
    }
    else
    {
      uint64_t v18 = _ef_log_MFComposePhotoPickerController();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[MFComposePhotoPickerController _photoPickerItemForAssetIdentifier:assetURL:contentType:completionHandler:]((uint64_t)v10, v18);
      }

      v12[2](v12, 0);
    }
  }
  else
  {
    uint64_t v15 = [[MFComposePhotoPickerItem alloc] initWithAssetIdentifier:v9 assetURL:v10 assetData:0 contentType:v11];
    v12[2](v12, v15);
  }
}

void __108__MFComposePhotoPickerController__photoPickerItemForAssetIdentifier_assetURL_contentType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = [MFComposePhotoPickerItem alloc];
    uint64_t v5 = [(MFComposePhotoPickerItem *)v4 initWithAssetIdentifier:*(void *)(a1 + 32) assetURL:0 assetData:v3 contentType:*MEMORY[0x1E4F44410]];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    _ef_log_MFComposePhotoPickerController();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = [*(id *)(a1 + 40) identifier];
      __108__MFComposePhotoPickerController__photoPickerItemForAssetIdentifier_assetURL_contentType_completionHandler___block_invoke_cold_1(v7, v8, v9, v6);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (MFComposePhotoPickerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFComposePhotoPickerControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PHPickerViewController)pickerViewController
{
  return self->_pickerViewController;
}

- (NSMutableSet)existingAssets
{
  return self->_existingAssets;
}

- (void)setExistingAssets:(id)a3
{
}

- (MFComposePhotoPickerProgressManager)progressManager
{
  return self->_progressManager;
}

- (void)setProgressManager:(id)a3
{
}

- (OS_dispatch_queue)assetLoadingQueue
{
  return self->_assetLoadingQueue;
}

- (void)setAssetLoadingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetLoadingQueue, 0);
  objc_storeStrong((id *)&self->_progressManager, 0);
  objc_storeStrong((id *)&self->_existingAssets, 0);
  objc_storeStrong((id *)&self->_pickerViewController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_loadAssetForPickerResult:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF945000, a2, OS_LOG_TYPE_ERROR, "Could not load asset %{public}@ because no item provider was provided.", (uint8_t *)&v2, 0xCu);
}

- (void)_loadAssetForPickerResult:(NSObject *)a3 completionHandler:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_1(&dword_1AF945000, a2, a3, "Cannot load asset %{public}@, because neither of the registeredContentTypes - %{public}@ are supported.", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __78__MFComposePhotoPickerController__loadAssetForPickerResult_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1AF945000, v0, v1, "Error copying asset %{public}@, error: %{public}@");
}

void __78__MFComposePhotoPickerController__loadAssetForPickerResult_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1AF945000, v0, v1, "Error loading asset %{public}@, error: %{public}@");
}

- (void)_photoPickerItemForAssetIdentifier:(uint64_t)a1 assetURL:(NSObject *)a2 contentType:completionHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF945000, a2, OS_LOG_TYPE_ERROR, "Error getting contentType value from url: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __108__MFComposePhotoPickerController__photoPickerItemForAssetIdentifier_assetURL_contentType_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "Error exporting asset %{public}@ with contentType %{public}@ as JPEG", buf, 0x16u);
}

@end