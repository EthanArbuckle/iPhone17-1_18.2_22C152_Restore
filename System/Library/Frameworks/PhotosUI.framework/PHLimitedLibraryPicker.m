@interface PHLimitedLibraryPicker
+ (id)firstKeyWindow:(id)a3;
+ (id)topmostPresentedViewController:(id)a3;
+ (void)presentLimitedLibraryPicker:(id)a3 waitForDismissal:(BOOL)a4;
+ (void)presentLimitedLibraryPicker:(id)a3 waitForDismissal:(BOOL)a4 viewController:(id)a5 photoLibrary:(id)a6 completionHandler:(id)a7;
+ (void)presentLimitedLibraryPickerFromViewController:(id)a3 options:(id)a4;
+ (void)presentLimitedLibraryPickerFromViewController:(id)a3 options:(id)a4 completionHandler:(id)a5;
@end

@implementation PHLimitedLibraryPicker

+ (id)topmostPresentedViewController:(id)a3
{
  v3 = [a3 presentedViewController];
  v4 = [v3 presentedViewController];

  if (v4)
  {
    do
    {
      v5 = [v3 presentedViewController];

      v6 = [v5 presentedViewController];

      v3 = v5;
    }
    while (v6);
  }
  else
  {
    v5 = v3;
  }

  return v5;
}

+ (id)firstKeyWindow:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  [a3 connectedScenes];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    unint64_t v7 = 0x263F82000uLL;
    id v19 = v3;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v25 != v6) {
        objc_enumerationMutation(v3);
      }
      v9 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 activationState] != -1)
      {
        id v10 = v9;
        v11 = [v10 windows];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v12 = v11;
        id v13 = (id)[v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v13)
        {
          unint64_t v14 = v7;
          uint64_t v15 = *(void *)v21;
          while (2)
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v21 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
              if ([v17 isKeyWindow])
              {
                id v13 = v17;
                goto LABEL_18;
              }
            }
            id v13 = (id)[v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v13) {
              continue;
            }
            break;
          }
LABEL_18:
          unint64_t v7 = v14;
          id v3 = v19;
        }

        if (v13) {
          break;
        }
      }
      if (++v8 == v5)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_22;
      }
    }
  }
  else
  {
LABEL_22:
    id v13 = 0;
  }

  return v13;
}

+ (void)presentLimitedLibraryPickerFromViewController:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = [a4 objectForKeyedSubscript:@"PHLimitedLibraryPickerClientApplicationIdentifier"];
  id v10 = [MEMORY[0x263F14E98] imagePickerPhotoLibrary];
  [a1 presentLimitedLibraryPicker:v11 waitForDismissal:0 viewController:v9 photoLibrary:v10 completionHandler:v8];
}

+ (void)presentLimitedLibraryPickerFromViewController:(id)a3 options:(id)a4
{
}

+ (void)presentLimitedLibraryPicker:(id)a3 waitForDismissal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unint64_t v7 = [MEMORY[0x263F82438] sharedApplication];
  id v8 = [a1 firstKeyWindow:v7];

  if (v8)
  {
    id v9 = [v8 rootViewController];
    uint64_t v10 = [a1 topmostPresentedViewController:v9];
    if (v10)
    {
      id v11 = v10;

LABEL_7:
      unint64_t v14 = [MEMORY[0x263F14E98] imagePickerPhotoLibrary];
      [a1 presentLimitedLibraryPicker:v6 waitForDismissal:v4 viewController:v11 photoLibrary:v14 completionHandler:0];

      goto LABEL_11;
    }
    id v11 = [v8 rootViewController];

    if (v11) {
      goto LABEL_7;
    }
    id v11 = PLBackendGetLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    id v12 = "Failed to access application top most view controller, unable to present library picker";
    id v13 = buf;
LABEL_10:
    _os_log_impl(&dword_217C33000, v11, OS_LOG_TYPE_ERROR, v12, v13, 2u);
    goto LABEL_11;
  }
  id v11 = PLBackendGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    __int16 v15 = 0;
    id v12 = "Failed to access application key window, unable to present library picker";
    id v13 = (uint8_t *)&v15;
    goto LABEL_10;
  }
LABEL_11:
}

+ (void)presentLimitedLibraryPicker:(id)a3 waitForDismissal:(BOOL)a4 viewController:(id)a5 photoLibrary:(id)a6 completionHandler:(id)a7
{
  BOOL v10 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  __int16 v15 = objc_alloc_init(PHLimitedLibraryPickerDelegate);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __117__PHLimitedLibraryPicker_presentLimitedLibraryPicker_waitForDismissal_viewController_photoLibrary_completionHandler___block_invoke;
  block[3] = &unk_2642C5618;
  v16 = v15;
  v38 = v16;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  [(PHLimitedLibraryPickerDelegate *)v16 setDismissalBlock:v17];
  [(PHLimitedLibraryPickerDelegate *)v16 setFinishedPickingBlock:v14];
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __117__PHLimitedLibraryPicker_presentLimitedLibraryPicker_waitForDismissal_viewController_photoLibrary_completionHandler___block_invoke_29;
  aBlock[3] = &unk_2642C5498;
  id v18 = v13;
  id v28 = v18;
  id v19 = v11;
  id v29 = v19;
  long long v20 = v16;
  uint64_t v30 = v20;
  id v21 = v12;
  id v31 = v21;
  v32 = &v33;
  long long v22 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v22[2](v22);
  }
  else
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __117__PHLimitedLibraryPicker_presentLimitedLibraryPicker_waitForDismissal_viewController_photoLibrary_completionHandler___block_invoke_34;
    v25[3] = &unk_2642C54C0;
    long long v26 = v22;
    dispatch_sync(MEMORY[0x263EF83A0], v25);
  }
  if (*((unsigned char *)v34 + 24) && v10)
  {
    dispatch_block_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    long long v23 = PLBackendGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      __int16 v24 = 0;
      _os_log_impl(&dword_217C33000, v23, OS_LOG_TYPE_DEBUG, "Limited library picker done", (uint8_t *)&v24, 2u);
    }
  }
  _Block_object_dispose(&v33, 8);
}

void __117__PHLimitedLibraryPicker_presentLimitedLibraryPicker_waitForDismissal_viewController_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDismissalBlock:0];
  v1 = PLBackendGetLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_217C33000, v1, OS_LOG_TYPE_DEBUG, "Presented limited library dismissed", v2, 2u);
  }
}

void __117__PHLimitedLibraryPicker_presentLimitedLibraryPicker_waitForDismissal_viewController_photoLibrary_completionHandler___block_invoke_29(void *a1)
{
  v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217C33000, v2, OS_LOG_TYPE_DEBUG, "Preparing to show limited library picker", buf, 2u);
  }

  id v3 = [[PHPickerConfiguration alloc] initWithPhotoLibraryAndOnlyReturnsIdentifiers:a1[4]];
  [(PHPickerConfiguration *)v3 setSelectionLimit:0];
  [(PHPickerConfiguration *)v3 setMinimumSelectionLimit:0];
  [(PHPickerConfiguration *)v3 _setPurposedLimitedLibraryApplicationIdentifier:a1[5]];
  [(PHPickerConfiguration *)v3 _setDisabledPrivateCapabilities:7];
  BOOL v4 = [[PHPickerViewController alloc] initWithConfiguration:v3];
  uint64_t v5 = a1[6];
  id v6 = [(PHPickerViewController *)v4 presentationController];
  [v6 setDelegate:v5];

  [(PHPickerViewController *)v4 setDelegate:a1[6]];
  unint64_t v7 = (void *)a1[7];
  if (v7)
  {
    [v7 presentViewController:v4 animated:1 completion:&__block_literal_global_1000];
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
  }
  else
  {
    id v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_217C33000, v8, OS_LOG_TYPE_ERROR, "Failed to determine root view controller", v9, 2u);
    }
  }
}

uint64_t __117__PHLimitedLibraryPicker_presentLimitedLibraryPicker_waitForDismissal_viewController_photoLibrary_completionHandler___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __117__PHLimitedLibraryPicker_presentLimitedLibraryPicker_waitForDismissal_viewController_photoLibrary_completionHandler___block_invoke_32()
{
  v0 = PLBackendGetLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_217C33000, v0, OS_LOG_TYPE_DEBUG, "Presented limited library picker", v1, 2u);
  }
}

@end