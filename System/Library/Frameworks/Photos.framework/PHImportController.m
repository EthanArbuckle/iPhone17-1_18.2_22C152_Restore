@interface PHImportController
+ (BOOL)isDeviceVolumeAtURL:(id)a3;
+ (BOOL)isValidFolderAtURL:(id)a3;
+ (id)sharedInstance;
- (BOOL)importInProgress;
- (BOOL)sourceIsConnected:(id)a3;
- (ICDeviceBrowser)deviceBrowser;
- (NSHashTable)observers;
- (NSMutableDictionary)importSources;
- (PHImportController)init;
- (id)filterDuplicates:(id)a3 onSource:(id)a4 library:(id)a5 options:(id)a6 delegate:(id)a7;
- (id)importSourceForURLs:(id)a3 exceptions:(id *)a4;
- (id)importUrls:(id)a3 intoLibrary:(id)a4 withOptions:(id)a5 delegate:(id)a6 performanceDelegate:(id)a7 atEnd:(id)a8;
- (id)importUrls:(id)a3 withOptions:(id)a4 delegate:(id)a5 atEnd:(id)a6;
- (id)processInfoActivityToken;
- (id)supportedTypes;
- (void)_addImportSource:(id)a3;
- (void)_notifyOfFailureToAddImportSource:(id)a3 exceptions:(id)a4;
- (void)_removeImportSourceWithUUID:(id)a3;
- (void)accessSourceList:(id)a3;
- (void)addImportControllerObserver:(id)a3;
- (void)addImportSourceForUrls:(id)a3;
- (void)deviceBrowser:(id)a3 didAddDevice:(id)a4 moreComing:(BOOL)a5;
- (void)deviceBrowser:(id)a3 didRemoveDevice:(id)a4 moreGoing:(BOOL)a5;
- (void)enableDeviceImport;
- (void)importAssets:(id)a3 fromImportSource:(id)a4 intoLibrary:(id)a5 withOptions:(id)a6 progress:(id *)a7 delegate:(id)a8 performanceDelegate:(id)a9 atEnd:(id)a10;
- (void)importAssets:(id)a3 fromImportSource:(id)a4 intoLibraryAtURL:(id)a5 withOptions:(id)a6 progress:(id *)a7 delegate:(id)a8 performanceDelegate:(id)a9 atEnd:(id)a10;
- (void)importAssets:(id)a3 fromImportSource:(id)a4 withOptions:(id)a5 progress:(id *)a6 delegate:(id)a7 atEnd:(id)a8;
- (void)importEnding;
- (void)importStarting;
- (void)removeImportSource:(id)a3;
- (void)setDeviceBrowser:(id)a3;
- (void)setImportInProgress:(BOOL)a3;
- (void)setImportSources:(id)a3;
- (void)setObservers:(id)a3;
- (void)setProcessInfoActivityToken:(id)a3;
@end

@implementation PHImportController

void __36__PHImportController_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_controller;
  sharedInstance_controller = v0;
}

- (PHImportController)init
{
  v7.receiver = self;
  v7.super_class = (Class)PHImportController;
  v2 = [(PHImportController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_sourceListLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;
  }
  return v3;
}

- (void)addImportControllerObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PHImportController_addImportControllerObserver___block_invoke;
  v6[3] = &unk_1E5848DF0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PHImportController *)self accessSourceList:v6];
}

- (void)accessSourceList:(id)a3
{
  p_sourceListLock = &self->_sourceListLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_sourceListLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_sourceListLock);
}

void __50__PHImportController_addImportControllerObserver___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(*(void *)(a1 + 32) + 40) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v11;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v8 = *(void *)(a1 + 32);
          id v7 = *(void **)(a1 + 40);
          v9 = objc_msgSend(*(id *)(v8 + 32), "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * v6), (void)v10);
          [v7 importController:v8 addedImportSource:v9];

          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v4);
    }
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_3410);
  }
  id v2 = (void *)sharedInstance_controller;

  return v2;
}

- (void)enableDeviceImport
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PHImportController_enableDeviceImport__block_invoke;
  block[3] = &unk_1E5848578;
  block[4] = self;
  if (enableDeviceImport_onceToken != -1) {
    dispatch_once(&enableDeviceImport_onceToken, block);
  }
}

void __40__PHImportController_enableDeviceImport__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PHImportController_enableDeviceImport__block_invoke_2;
  block[3] = &unk_1E5848578;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __40__PHImportController_enableDeviceImport__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  uint64_t v3 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PHImportController_enableDeviceImport__block_invoke_3;
  block[3] = &unk_1E5848578;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, v3, block);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_processInfoActivityToken, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_importSources, 0);

  objc_storeStrong((id *)&self->_deviceBrowser, 0);
}

- (void)setProcessInfoActivityToken:(id)a3
{
}

- (id)processInfoActivityToken
{
  return self->_processInfoActivityToken;
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setImportSources:(id)a3
{
}

- (NSMutableDictionary)importSources
{
  return self->_importSources;
}

- (void)setDeviceBrowser:(id)a3
{
}

- (ICDeviceBrowser)deviceBrowser
{
  return self->_deviceBrowser;
}

- (void)setImportInProgress:(BOOL)a3
{
  self->_importInProgress = a3;
}

- (void)deviceBrowser:(id)a3 didRemoveDevice:(id)a4 moreGoing:(BOOL)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 setDelegate:0];
    id v7 = PLImportGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v6 name];
      int v10 = 136315394;
      long long v11 = "-[PHImportController deviceBrowser:didRemoveDevice:moreGoing:]";
      __int16 v12 = 2112;
      long long v13 = v8;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEFAULT, "%s - %@", (uint8_t *)&v10, 0x16u);
    }
    v9 = [v6 UUIDString];
    [(PHImportController *)self _removeImportSourceWithUUID:v9];
  }
}

- (void)deviceBrowser:(id)a3 didAddDevice:(id)a4 moreComing:(BOOL)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = PLImportGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v6 name];
      int v10 = 136315394;
      long long v11 = "-[PHImportController deviceBrowser:didAddDevice:moreComing:]";
      __int16 v12 = 2112;
      long long v13 = v8;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEFAULT, "%s - %@", (uint8_t *)&v10, 0x16u);
    }
    v9 = [[PHImportDeviceSource alloc] initWithDevice:v6];
    [(PHImportController *)self _addImportSource:v9];
  }
}

- (void)_removeImportSourceWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__PHImportController__removeImportSourceWithUUID___block_invoke;
    v6[3] = &unk_1E5848DF0;
    v6[4] = self;
    id v7 = v4;
    [(PHImportController *)self accessSourceList:v6];
  }
}

void __50__PHImportController__removeImportSourceWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v2 = [*(id *)(a1 + 32) importSources];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [v3 progress];
    [v4 cancel];

    uint64_t v5 = [*(id *)(a1 + 32) importSources];
    id v6 = [v3 uuid];
    [v5 removeObjectForKey:v6];

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = *(id *)(*(void *)(a1 + 32) + 40);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "importController:removedImportSource:", *(void *)(a1 + 32), v3, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)_addImportSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__PHImportController__addImportSource___block_invoke;
    v6[3] = &unk_1E5848DF0;
    v6[4] = self;
    id v7 = v4;
    [(PHImportController *)self accessSourceList:v6];
  }
}

void __39__PHImportController__addImportSource___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v2 = [*(id *)(a1 + 32) importSources];
  uint64_t v3 = [*(id *)(a1 + 40) uuid];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (!v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) importSources];

    if (!v5)
    {
      id v6 = objc_opt_new();
      [*(id *)(a1 + 32) setImportSources:v6];
    }
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = [*(id *)(a1 + 32) importSources];
    uint64_t v9 = [*(id *)(a1 + 40) uuid];
    [v8 setObject:v7 forKeyedSubscript:v9];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = *(id *)(*(void *)(a1 + 32) + 40);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "importController:addedImportSource:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v15);
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
}

- (void)importAssets:(id)a3 fromImportSource:(id)a4 intoLibrary:(id)a5 withOptions:(id)a6 progress:(id *)a7 delegate:(id)a8 performanceDelegate:(id)a9 atEnd:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  v22 = (void (**)(id, PHImportResults *, void))a10;
  if ([(PHImportController *)self importInProgress])
  {
    if (v22)
    {
      id v23 = v17;
      v24 = objc_alloc_init(PHImportResults);
      v25 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Import in progress. Cannot start another import session.");
      id v26 = [(PHImportExceptionRecorder *)v24 addExceptionWithType:0 path:0 underlyingError:v25 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportController.m" line:399];
      v22[2](v22, v24, 0);

      id v17 = v23;
    }
  }
  else
  {
    [(PHImportController *)self importStarting];
    [v21 startImporting];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __120__PHImportController_importAssets_fromImportSource_intoLibrary_withOptions_progress_delegate_performanceDelegate_atEnd___block_invoke;
    v27[3] = &unk_1E58424E0;
    v27[4] = self;
    id v28 = v21;
    id v29 = v19;
    id v30 = v17;
    v31 = v22;
    +[PHImporter importAssets:v16 fromImportSource:v30 intoLibrary:v18 withOptions:v29 progress:a7 delegate:v20 atEnd:v27];
  }
}

void __120__PHImportController_importAssets_fromImportSource_intoLibrary_withOptions_progress_delegate_performanceDelegate_atEnd___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) importEnding];
  [*(id *)(a1 + 40) endImporting];
  if ([*(id *)(a1 + 48) deleteAfterImport]
    && [*(id *)(a1 + 56) canDeleteContent])
  {
    id v4 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v17 = v3;
    uint64_t v5 = [v3 importRecords];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (!v6) {
      goto LABEL_14;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = [v10 importAsset];
        if ([v11 canDelete])
        {
          uint64_t v12 = [v10 exceptions];
          uint64_t v13 = [v12 count];

          if (v13) {
            continue;
          }
          uint64_t v11 = [v10 importAsset];
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (!v7)
      {
LABEL_14:

        if ([v4 count])
        {
          uint64_t v14 = *(void **)(a1 + 56);
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __120__PHImportController_importAssets_fromImportSource_intoLibrary_withOptions_progress_delegate_performanceDelegate_atEnd___block_invoke_2;
          v18[3] = &unk_1E5842688;
          id v19 = v4;
          long long v15 = [v14 deleteImportAssets:v19 isConfirmed:1 atEnd:v18];
        }
        else
        {
          long long v15 = 0;
        }

        id v3 = v17;
        goto LABEL_19;
      }
    }
  }
  long long v15 = 0;
LABEL_19:
  uint64_t v16 = *(void *)(a1 + 64);
  if (v16) {
    (*(void (**)(uint64_t, id, void *))(v16 + 16))(v16, v3, v15);
  }
}

void __120__PHImportController_importAssets_fromImportSource_intoLibrary_withOptions_progress_delegate_performanceDelegate_atEnd___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLImportGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [*(id *)(a1 + 32) count];
    if (v3)
    {
      uint64_t v6 = [NSString stringWithFormat:@": %@", v3];
    }
    else
    {
      uint64_t v6 = &stru_1EEAC1950;
    }
    *(_DWORD *)buf = 134218242;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_INFO, "Deleted %lu assets%@", buf, 0x16u);
    if (v3) {
  }
    }
}

- (void)importAssets:(id)a3 fromImportSource:(id)a4 withOptions:(id)a5 progress:(id *)a6 delegate:(id)a7 atEnd:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = +[PHPhotoLibrary systemPhotoLibraryURL];
  [(PHImportController *)self importAssets:v18 fromImportSource:v17 intoLibraryAtURL:v19 withOptions:v16 progress:a6 delegate:v15 performanceDelegate:0 atEnd:v14];
}

- (id)importUrls:(id)a3 intoLibrary:(id)a4 withOptions:(id)a5 delegate:(id)a6 performanceDelegate:(id)a7 atEnd:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = (void (**)(id, PHImportResults *))a8;
  uint64_t v20 = [v14 count];
  if (v19 && !v20)
  {
    long long v21 = objc_alloc_init(PHImportResults);
    long long v22 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Requested to import an empty asset list");
    long long v23 = v21;
    v24 = v22;
    uint64_t v25 = 337;
LABEL_7:
    id v27 = [(PHImportExceptionRecorder *)v23 addExceptionWithType:0 path:0 underlyingError:v24 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportController.m" line:v25];
    v19[2](v19, v21);

    id v28 = 0;
    goto LABEL_14;
  }
  BOOL v26 = [(PHImportController *)self importInProgress];
  if (v19 && v26)
  {
    long long v21 = objc_alloc_init(PHImportResults);
    long long v22 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Import in progress. Cannot start another import session.");
    long long v23 = v21;
    v24 = v22;
    uint64_t v25 = 346;
    goto LABEL_7;
  }
  v49[0] = 0;
  id v29 = [(PHImportController *)self importSourceForURLs:v14 exceptions:v49];
  id v30 = v49[0];
  if (![v30 count]) {
    goto LABEL_12;
  }
  v31 = +[PHImportResults resultsWithExceptions:v30];
  v32 = v31;
  if (!v19)
  {

LABEL_12:
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__3326;
    v47 = __Block_byref_object_dispose__3327;
    id v48 = objc_alloc_init(MEMORY[0x1E4F28F90]);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __92__PHImportController_importUrls_intoLibrary_withOptions_delegate_performanceDelegate_atEnd___block_invoke;
    v35[3] = &unk_1E58424B8;
    id v36 = v16;
    v37 = self;
    id v38 = v29;
    id v39 = v15;
    id v40 = v17;
    v42 = &v43;
    v41 = v19;
    id v33 = (id)[v38 loadAssetsForLibrary:v39 allowDuplicates:0 order:0 atEnd:v35];
    id v28 = (id)v44[5];

    _Block_object_dispose(&v43, 8);
    goto LABEL_13;
  }
  v19[2](v19, v31);

  id v28 = 0;
LABEL_13:

LABEL_14:

  return v28;
}

void __92__PHImportController_importUrls_intoLibrary_withOptions_delegate_performanceDelegate_atEnd___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  uint64_t v8 = v7;
  if (([*(id *)(a1 + 32) allowDuplicates] & 1) == 0)
  {
    uint64_t v8 = v7;
    if ([v7 count])
    {
      uint64_t v8 = [*(id *)(a1 + 40) filterDuplicates:v7 onSource:*(void *)(a1 + 48) library:*(void *)(a1 + 56) options:*(void *)(a1 + 32) delegate:*(void *)(a1 + 64)];
    }
  }
  if ([v8 count])
  {
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(*(void *)(a1 + 80) + 8);
    id obj = *(id *)(v13 + 40);
    uint64_t v14 = *(void *)(a1 + 64);
    uint64_t v19 = v9;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __92__PHImportController_importUrls_intoLibrary_withOptions_delegate_performanceDelegate_atEnd___block_invoke_2;
    v20[3] = &unk_1E5842490;
    long long v21 = (PHImportResults *)v6;
    id v22 = *(id *)(a1 + 72);
    [v11 importAssets:v8 fromImportSource:v19 intoLibrary:v10 withOptions:v12 progress:&obj delegate:v14 performanceDelegate:0 atEnd:v20];
    objc_storeStrong((id *)(v13 + 40), obj);

    id v15 = v21;
LABEL_13:

    goto LABEL_14;
  }
  if (*(void *)(a1 + 72))
  {
    if ([v6 count])
    {
      id v16 = +[PHImportResults resultsWithExceptions:v6];
    }
    else
    {
      id v17 = PLImportGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v18 = [*(id *)(a1 + 48) name];
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = v18;
        _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_INFO, "Nothing to import from '%@'", buf, 0xCu);
      }
      id v16 = objc_alloc_init(PHImportResults);
    }
    id v15 = v16;
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    goto LABEL_13;
  }
LABEL_14:
}

void __92__PHImportController_importUrls_intoLibrary_withOptions_delegate_performanceDelegate_atEnd___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 addExceptions:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)importEnding
{
  p_importInProgressLock = &self->_importInProgressLock;
  os_unfair_lock_lock(&self->_importInProgressLock);
  if (self->_importInProgress)
  {
    self->_importInProgress = 0;
    id v4 = [MEMORY[0x1E4F28F80] processInfo];
    [v4 endActivity:self->_processInfoActivityToken];

    id processInfoActivityToken = self->_processInfoActivityToken;
    self->_id processInfoActivityToken = 0;
  }

  os_unfair_lock_unlock(p_importInProgressLock);
}

- (void)importStarting
{
  p_importInProgressLock = &self->_importInProgressLock;
  os_unfair_lock_lock(&self->_importInProgressLock);
  if (!self->_importInProgress)
  {
    self->_importInProgress = 1;
    id v4 = [MEMORY[0x1E4F28F80] processInfo];
    id v5 = [v4 beginActivityWithOptions:0xFFFFFFLL reason:@"Photos Import"];
    id processInfoActivityToken = self->_processInfoActivityToken;
    self->_id processInfoActivityToken = v5;
  }

  os_unfair_lock_unlock(p_importInProgressLock);
}

- (BOOL)importInProgress
{
  dispatch_time_t v2 = self;
  p_importInProgressLock = &self->_importInProgressLock;
  os_unfair_lock_lock(&self->_importInProgressLock);
  LOBYTE(v2) = v2->_importInProgress;
  os_unfair_lock_unlock(p_importInProgressLock);
  return (char)v2;
}

- (id)filterDuplicates:(id)a3 onSource:(id)a4 library:(id)a5 options:(id)a6 delegate:(id)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (![v11 count] || objc_msgSend(v14, "allowDuplicates"))
  {
    id v16 = v11;
    goto LABEL_33;
  }
  if (!v11)
  {
    _PFAssertFailHandler();
LABEL_37:
    _PFAssertFailHandler();
  }
  if (!v13) {
    goto LABEL_37;
  }
  id v16 = (id)[v11 mutableCopy];
  char v37 = 0;
  id v17 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v18 = v11;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (!v19)
  {

LABEL_30:
    if ([v17 count]) {
      [v16 removeObjectsInArray:v17];
    }
    goto LABEL_32;
  }
  uint64_t v20 = v19;
  id v29 = v16;
  id v30 = v14;
  id v31 = v12;
  id v32 = v11;
  uint64_t v21 = 0;
  uint64_t v22 = *(void *)v34;
  while (2)
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      if (*(void *)v34 != v22) {
        objc_enumerationMutation(v18);
      }
      v24 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      if ([v24 isDuplicate])
      {
        if (v37)
        {
          if (v21 == 1) {
            [v17 addObject:v24];
          }
        }
        else
        {
          uint64_t v25 = [v24 duplicateAssetsForLibrary:v13];
          uint64_t v26 = [v25 firstObject];

          uint64_t v27 = [v15 importAsset:v24 asDuplicateOfLibraryAsset:v26 applyToAll:&v37];
          uint64_t v21 = v27;
          if (v27)
          {
            if (v27 == 1)
            {
              [v17 addObject:v24];
            }
            else if (v27 == 2)
            {
              goto LABEL_26;
            }
          }
          else if (v37)
          {
LABEL_26:

            goto LABEL_27;
          }
        }
      }
    }
    uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v20) {
      continue;
    }
    break;
  }
LABEL_27:

  id v12 = v31;
  id v11 = v32;
  id v16 = v29;
  id v14 = v30;
  if (v21 != 2) {
    goto LABEL_30;
  }
  [v29 removeAllObjects];
LABEL_32:

LABEL_33:

  return v16;
}

- (void)importAssets:(id)a3 fromImportSource:(id)a4 intoLibraryAtURL:(id)a5 withOptions:(id)a6 progress:(id *)a7 delegate:(id)a8 performanceDelegate:(id)a9 atEnd:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  id v34 = a9;
  uint64_t v19 = (void (**)(id, void *, void))a10;
  id v20 = a5;
  uint64_t v21 = [[PHPhotoLibrary alloc] initWithPhotoLibraryURL:v20];

  id v36 = 0;
  LOBYTE(v20) = [(PHPhotoLibrary *)v21 openAndWaitWithUpgrade:0 error:&v36];
  id v22 = v36;
  if ((v20 & 1) == 0)
  {
    long long v23 = objc_opt_new();
    +[PHPhotoLibrary systemPhotoLibraryURL];
    long long v33 = v19;
    id v24 = v22;
    uint64_t v25 = self;
    id v26 = v18;
    id v27 = v17;
    id v28 = v16;
    v30 = id v29 = v15;
    id v31 = [v30 path];

    id v15 = v29;
    id v16 = v28;
    id v17 = v27;
    id v18 = v26;
    self = v25;
    id v22 = v24;
    uint64_t v19 = v33;
    id v32 = (id)[v23 addExceptionWithType:0 path:v31 underlyingError:v22 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportController.m" line:192];
    v19[2](v19, v23, 0);
  }
  [(PHImportController *)self importAssets:v15 fromImportSource:v16 intoLibrary:v21 withOptions:v17 progress:a7 delegate:v18 performanceDelegate:v34 atEnd:v19];
}

- (id)importUrls:(id)a3 withOptions:(id)a4 delegate:(id)a5 atEnd:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *))a6;
  id v14 = [PHPhotoLibrary alloc];
  id v15 = +[PHPhotoLibrary systemPhotoLibraryURL];
  id v16 = [(PHPhotoLibrary *)v14 initWithPhotoLibraryURL:v15];

  id v25 = 0;
  BOOL v17 = [(PHPhotoLibrary *)v16 openAndWaitWithUpgrade:0 error:&v25];
  id v18 = v25;
  if (v17)
  {
    uint64_t v19 = [(PHImportController *)self importUrls:v10 intoLibrary:v16 withOptions:v11 delegate:v12 performanceDelegate:0 atEnd:v13];
  }
  else
  {
    id v20 = objc_opt_new();
    uint64_t v21 = +[PHPhotoLibrary systemPhotoLibraryURL];
    id v22 = [v21 path];

    id v23 = (id)[v20 addExceptionWithType:0 path:v22 underlyingError:v18 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportController.m" line:179];
    v13[2](v13, v20);

    uint64_t v19 = 0;
  }

  return v19;
}

- (void)removeImportSource:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 uuid];
    [(PHImportController *)self _removeImportSourceWithUUID:v5];
  }
  else
  {
    id v6 = PLImportGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "ERROR: attempting to remove a non URL import source (%@)", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_notifyOfFailureToAddImportSource:(id)a3 exceptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__PHImportController__notifyOfFailureToAddImportSource_exceptions___block_invoke;
  v10[3] = &unk_1E5848EC0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PHImportController *)self accessSourceList:v10];
}

void __67__PHImportController__notifyOfFailureToAddImportSource_exceptions___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(a1[4] + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "importController:failedToAddImportSource:exceptions:", a1[4], a1[5], a1[6], (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)importSourceForURLs:(id)a3 exceptions:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count])
  {
    uint64_t v6 = [v5 firstObject];
    if ([v5 count] != 1
      || (id v7 = (void *)MEMORY[0x1E4F8CDF8],
          [MEMORY[0x1E4F8CDF8] photosLibraryType],
          long long v8 = objc_claimAutoreleasedReturnValue(),
          LODWORD(v7) = [v7 url:v6 conformsToType:v8],
          v8,
          !v7)
      || (+[PHImportLibrarySource importLibrarySourceForURL:v6 exceptions:a4], (long long v9 = (PHImportUrlSource *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      long long v9 = [[PHImportUrlSource alloc] initWithURLs:v5];
    }
    if (![(PHImportUrlSource *)v9 containsSupportedMediaWithImportExceptions:a4])
    {
      long long v10 = PLImportGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        uint64_t v13 = v9;
        _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_INFO, "%@ does not contain any importable content", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  else
  {
    long long v9 = 0;
  }

  return v9;
}

- (void)addImportSourceForUrls:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v10 = 0;
  id v5 = [(PHImportController *)self importSourceForURLs:v4 exceptions:&v10];
  id v6 = v10;
  if ([v6 count])
  {
    [(PHImportController *)self _notifyOfFailureToAddImportSource:v5 exceptions:v6];
  }
  else
  {
    [(PHImportController *)self _addImportSource:v5];
    id v7 = PLImportGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      long long v8 = [v5 name];
      uint64_t v9 = [v4 count];
      *(_DWORD *)buf = 138543618;
      int v12 = v8;
      __int16 v13 = 2048;
      uint64_t v14 = v9;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_INFO, "Created source for '%{public}@' containing %lu URL(s)", buf, 0x16u);
    }
  }
}

- (BOOL)sourceIsConnected:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__PHImportController_sourceIsConnected___block_invoke;
  v7[3] = &unk_1E5848318;
  uint64_t v9 = &v10;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  [(PHImportController *)self accessSourceList:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __40__PHImportController_sourceIsConnected___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) importSources];
  id v2 = [*(id *)(a1 + 40) uuid];
  uint64_t v3 = [v4 objectForKeyedSubscript:v2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3 != 0;
}

- (id)supportedTypes
{
  id v2 = [MEMORY[0x1E4F8CDF8] typesSupportedForImport];
  uint64_t v3 = +[PHImportLibrarySource supportedImportLibraryTypes];
  id v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

uint64_t __40__PHImportController_enableDeviceImport__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setDelegate:");
  id v5 = PLImportGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEFAULT, "Listening for import sources from Image Capture", v7, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 24) start];
}

+ (BOOL)isDeviceVolumeAtURL:(id)a3
{
  return 0;
}

+ (BOOL)isValidFolderAtURL:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v16 = 0;
  uint64_t v4 = *MEMORY[0x1E4F1C658];
  id v15 = 0;
  int v5 = [v3 getResourceValue:&v16 forKey:v4 error:&v15];
  id v6 = v16;
  id v7 = v15;
  if (v5)
  {
    if ([v6 BOOLValue])
    {
      id v8 = (void *)MEMORY[0x1E4F8CDF8];
      uint64_t v9 = +[PHImportLibrarySource supportedImportLibraryTypes];
      LOBYTE(v10) = [v8 url:v3 conformsToOneOfTypes:v9];
    }
    else
    {
      uint64_t v9 = [v3 path];
      uint64_t v12 = [v9 pathComponents];
      if (([v9 isEqualToString:@"/"] & 1) != 0
        || ([v9 isEqualToString:@"/Volumes"] & 1) != 0)
      {
        LOBYTE(v10) = 0;
      }
      else if ([v12 count] == 2 {
             || [v12 count] == 4
      }
             && [v9 hasPrefix:@"/Volumes"])
      {
        uint64_t v14 = [v9 lastPathComponent];
        if (([v14 isEqualToString:@"dev"] & 1) != 0
          || ([v14 isEqualToString:@"var"] & 1) != 0
          || ([v14 isEqualToString:@"bin"] & 1) != 0
          || ([v14 isEqualToString:@"sbin"] & 1) != 0
          || ([v14 isEqualToString:@"cores"] & 1) != 0
          || ([v14 isEqualToString:@"opt"] & 1) != 0
          || ([v14 isEqualToString:@"home"] & 1) != 0
          || ([v14 isEqualToString:@"private"] & 1) != 0
          || ([v14 isEqualToString:@"usr"] & 1) != 0
          || ([v14 isEqualToString:@"tmp"] & 1) != 0
          || ([v14 isEqualToString:@"automount"] & 1) != 0
          || ([v14 isEqualToString:@"net"] & 1) != 0
          || ([v14 isEqualToString:@"Volumes"] & 1) != 0
          || ([v14 isEqualToString:@"Library"] & 1) != 0)
        {
          LOBYTE(v10) = 0;
        }
        else
        {
          int v10 = [v14 isEqualToString:@"System"] ^ 1;
        }
      }
      else
      {
        LOBYTE(v10) = 1;
      }
    }
  }
  else
  {
    uint64_t v9 = PLImportGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      long long v11 = [v3 path];
      *(_DWORD *)buf = 138412546;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "%@ is not a valid folder for import: %@", buf, 0x16u);
    }
    LOBYTE(v10) = 0;
  }

  return v10;
}

@end