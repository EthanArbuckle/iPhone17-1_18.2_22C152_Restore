@interface PHPTPAssetManager
+ (BOOL)_isPrimaryAssetResourceType:(int64_t)a3;
+ (BOOL)_shouldIncludeDiagnosticFile;
- (BOOL)_ensureLivePhotoComponentsAgreeOnConversionRequirementForPTPAssets:(id)a3 withConversionSupport:(id)a4;
- (BOOL)_isPenultimateAssetResource:(id)a3;
- (BOOL)_isPhotoAssetResourceType:(int64_t)a3;
- (BOOL)_isThumbnailSupportedForResourceType:(int64_t)a3;
- (BOOL)_shouldSkipResource:(id)a3 forAsset:(id)a4 conversionSupport:(id)a5 debugAnalytics:(id)a6;
- (BOOL)canDeleteAssets;
- (BOOL)libraryIsAvailable;
- (BOOL)penultimateIsPublic;
- (BOOL)ptpCanDeleteFiles;
- (BOOL)ptpDeletePhotoForAssetHandle:(id)a3;
- (PFMediaCapabilities)peerMediaCapabilities;
- (PHPTPAssetManager)init;
- (PHPTPAssetManager)initWithLibrary:(id)a3;
- (PHPTPDelegate)delegate;
- (PHPhotoLibrary)photoLibrary;
- (id)_assetTypeTranscodeLabelForType:(int64_t)a3;
- (id)_createDiagnosticPTPAssetFromAsset:(id)a3 primaryPTPAsset:(id)a4;
- (id)_createPTPAssetsFromAsset:(id)a3 photosResources:(id)a4 withConversionSupport:(id)a5 includeMetadata:(BOOL)a6 includeAdjustmentOverflowDataBlob:(BOOL)a7;
- (id)_createPTPAssetsFromAsset:(id)a3 photosResources:(id)a4 withConversionSupport:(id)a5 includeMetadata:(BOOL)a6 includeAdjustmentOverflowDataBlob:(BOOL)a7 debugAnalytics:(id)a8;
- (id)_diagnosticFilePathForLibrary:(id)a3 mainFilename:(id)a4 createIfNeeded:(BOOL)a5;
- (id)_enumerateAssetsWithLocalIdentifiers:(id)a3 usingBlock:(id)a4;
- (id)_fetchAssetsForIdentifiers:(id)a3 includeTrash:(BOOL)a4;
- (id)_photosAssetForPTPAssetHandle:(id)a3;
- (id)_primaryResourceForAsset:(id)a3;
- (id)_primaryResourceForAsset:(id)a3 fromResources:(id)a4;
- (id)_ptpAssetReaderForFormatConvertedPTPAsset:(id)a3 ofPhotosAsset:(id)a4 resourcePath:(id)a5 originalResourcePath:(id)a6;
- (id)_ptpAssetWithType:(int64_t)a3 fromPTPAssets:(id)a4 requiresConversion:(BOOL)a5;
- (id)_ptpThumbnailForOriginalVideoAsset:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5;
- (id)_resourceOfType:(int64_t)a3 fromResources:(id)a4;
- (id)_sendFinalizationRequestForAsset:(id)a3 moc:(id)a4;
- (id)popAnalyticsData;
- (id)ptpAssetReaderForAssetHandle:(id)a3;
- (id)ptpImagePropertiesForAssetHandle:(id)a3;
- (id)ptpThumbnailForAssetHandle:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5;
- (int64_t)_imageVersionForAsset:(id)a3 resourceType:(int64_t)a4;
- (int64_t)cplStorageState;
- (int64_t)libraryAvailabilityStatus;
- (unint64_t)countOfAssets;
- (void)_addAssetsNeedingFinalization:(id)a3;
- (void)_ensureDeferredRenderingIsComplete;
- (void)_expungeAsset:(id)a3 withReason:(id)a4;
- (void)_handleMakeResourceReplyForAssetUUID:(id)a3 assetObjectID:(id)a4 moc:(id)a5 success:(BOOL)a6 error:(id)a7;
- (void)_handlePhotoLibraryAvailableNotification;
- (void)_logGreenTeaStatusForPTPAssetHandle:(id)a3 photosAsset:(id)a4;
- (void)_registerForFirstUnlockNotification;
- (void)_requestFinalizationOfNextAsset;
- (void)_startAnalyticsCollection;
- (void)_stopAnalyticsCollectionAndReport;
- (void)_updateConversionResultForPTPAssets:(id)a3 conversionSupport:(id)a4;
- (void)cameraWatcherDidChangeState:(id)a3;
- (void)dealloc;
- (void)photoLibraryDidBecomeUnavailable:(id)a3;
- (void)photoLibraryDidChange:(id)a3;
- (void)ptpEnumerateAllAssetsUsingBlock:(id)a3;
- (void)ptpEnumerateAssetsWithLocalIdentifiers:(id)a3 usingBlock:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setHostCharacteristics:(id)a3;
- (void)setLibraryAvailabilityStatus:(int64_t)a3;
- (void)setPeerMediaCapabilities:(id)a3;
- (void)setPenultimateIsPublic:(BOOL)a3;
@end

@implementation PHPTPAssetManager

void __49__PHPTPAssetManager_cameraWatcherDidChangeState___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 88));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 88);
  *(void *)(v2 + 88) = 0;
}

- (void)cameraWatcherDidChangeState:(id)a3
{
  id v4 = a3;
  char v5 = [(PFCameraViewfinderSessionWatcher *)self->_cameraWatcher isCameraRunning];
  v6 = PLPTPGetLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_DEBUG, "Camera view finder change to running. Canceling inflight request.", buf, 2u);
    }

    *(void *)buf = 0;
    v10 = buf;
    uint64_t v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__19231;
    v13 = __Block_byref_object_dispose__19232;
    id v14 = 0;
    uint64_t v8 = MEMORY[0x1E4F143A8];
    PLRunWithUnfairLock();
    objc_msgSend(*((id *)v10 + 5), "invalidateWithHandler:", &__block_literal_global_19246, v8, 3221225472, __49__PHPTPAssetManager_cameraWatcherDidChangeState___block_invoke, &unk_1E5848D28, self, buf);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_DEBUG, "Camera view finder change to NOT running.", buf, 2u);
    }

    [(PHPTPAssetManager *)self _requestFinalizationOfNextAsset];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_cameraWatcher, 0);
  objc_storeStrong((id *)&self->_finalizationRequestLock_requestInflight, 0);
  objc_storeStrong((id *)&self->_finalizationRequestLock_inflightAssetsRequiringFinalization, 0);
  objc_storeStrong((id *)&self->_finalizationRequestLock_deferredAssets, 0);
  objc_storeStrong((id *)&self->_vendedAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_formatConversionManager, 0);
  objc_storeStrong((id *)&self->_analyticsAsyncDataGroup, 0);
  objc_storeStrong((id *)&self->_analyticsData, 0);

  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)setLibraryAvailabilityStatus:(int64_t)a3
{
  self->_libraryAvailabilityStatus = a3;
}

- (int64_t)libraryAvailabilityStatus
{
  return self->_libraryAvailabilityStatus;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (BOOL)canDeleteAssets
{
  return self->_canDeleteAssets;
}

- (unint64_t)countOfAssets
{
  return self->_countOfAssets;
}

- (PHPTPDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHPTPDelegate *)WeakRetained;
}

- (BOOL)penultimateIsPublic
{
  return [(PHPTPFormatConversionManager *)self->_formatConversionManager penultimateIsPublic];
}

- (void)setPenultimateIsPublic:(BOOL)a3
{
}

- (id)popAnalyticsData
{
  uint64_t v4 = 0;
  char v5 = &v4;
  uint64_t v6 = 0x3032000000;
  BOOL v7 = __Block_byref_object_copy__19231;
  uint64_t v8 = __Block_byref_object_dispose__19232;
  id v9 = 0;
  PLRunWithUnfairLock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __37__PHPTPAssetManager_popAnalyticsData__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) setTimeDisconnected:(double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW)];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 24));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;
}

- (void)_stopAnalyticsCollectionAndReport
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__19231;
  v6[4] = __Block_byref_object_dispose__19232;
  id v7 = [(PHPTPAssetManager *)self popAnalyticsData];
  analyticsAsyncDataGroup = self->_analyticsAsyncDataGroup;
  uint64_t v4 = dispatch_get_global_queue(-32768, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PHPTPAssetManager__stopAnalyticsCollectionAndReport__block_invoke;
  block[3] = &unk_1E58463A8;
  block[4] = v6;
  dispatch_group_notify(analyticsAsyncDataGroup, v4, block);

  _Block_object_dispose(v6, 8);
}

uint64_t __54__PHPTPAssetManager__stopAnalyticsCollectionAndReport__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) report];
}

- (void)_startAnalyticsCollection
{
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__19231;
  v21[4] = __Block_byref_object_dispose__19232;
  id v22 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __46__PHPTPAssetManager__startAnalyticsCollection__block_invoke;
  v18 = &unk_1E5848D28;
  v19 = self;
  v20 = v21;
  PLRunWithUnfairLock();
  v3 = [(PHPTPAssetManager *)self photoLibrary];
  uint64_t v4 = [v3 photoLibrary];

  dispatch_group_enter((dispatch_group_t)self->_analyticsAsyncDataGroup);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__PHPTPAssetManager__startAnalyticsCollection__block_invoke_2;
  v11[3] = &unk_1E5848318;
  id v5 = v4;
  id v12 = v5;
  v13 = self;
  id v14 = v21;
  [v5 performBlock:v11 withPriority:0];
  dispatch_group_enter((dispatch_group_t)self->_analyticsAsyncDataGroup);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PHPTPAssetManager__startAnalyticsCollection__block_invoke_206;
  v7[3] = &unk_1E5848318;
  id v6 = v5;
  id v8 = v6;
  id v9 = self;
  v10 = v21;
  [v6 performBlock:v7 withPriority:0];

  _Block_object_dispose(v21, 8);
}

void __46__PHPTPAssetManager__startAnalyticsCollection__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(PHPTPAnalyticsData);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  [*(id *)(*(void *)(a1 + 32) + 24) setTimeConnected:(double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW)];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setCplState:", objc_msgSend(*(id *)(a1 + 32), "cplStorageState"));
  id v5 = *(void **)(*(void *)(a1 + 32) + 24);
  id v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v6, v5);
}

void __46__PHPTPAssetManager__startAnalyticsCollection__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v3 = [MEMORY[0x1E4F8A950] entityName];
  uint64_t v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = [*(id *)(a1 + 32) managedObjectContext];
  id v9 = 0;
  uint64_t v6 = [v5 countForFetchRequest:v4 error:&v9];
  id v7 = v9;

  if (v6)
  {
    PLRunWithUnfairLock();
  }
  else if (v7)
  {
    id v8 = PLPTPGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "Error fetching count of library assets: %@", buf, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 40) + 40));
}

void __46__PHPTPAssetManager__startAnalyticsCollection__block_invoke_206(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v3 = [MEMORY[0x1E4F8A950] entityName];
  uint64_t v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > %d", @"deferredProcessingNeeded", 0);
  [v4 setPredicate:v5];

  uint64_t v6 = [*(id *)(a1 + 32) managedObjectContext];
  id v10 = 0;
  uint64_t v7 = [v6 countForFetchRequest:v4 error:&v10];
  id v8 = v10;

  if (v7)
  {
    PLRunWithUnfairLock();
  }
  else if (v8)
  {
    id v9 = PLPTPGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v8;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "Error fetching count for assets with pending deferred processing: %@", buf, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 40) + 40));
}

uint64_t __46__PHPTPAssetManager__startAnalyticsCollection__block_invoke_2_214(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setDeferredRenderCount:*(void *)(a1 + 40)];
}

uint64_t __46__PHPTPAssetManager__startAnalyticsCollection__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setLibraryAssetCount:*(void *)(a1 + 40)];
}

uint64_t __49__PHPTPAssetManager_cameraWatcherDidChangeState___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 cancel];
}

- (id)_resourceOfType:(int64_t)a3 fromResources:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = a4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (void)v13) == a3)
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (id)_primaryResourceForAsset:(id)a3 fromResources:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v5 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (!v6)
  {
    uint64_t v8 = 0;
    goto LABEL_24;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v21;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v21 != v9) {
        objc_enumerationMutation(v5);
      }
      id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      unint64_t v12 = [v11 type];
      if (v12 <= 0x14)
      {
        if (((1 << v12) & 0x31FF8) != 0) {
          continue;
        }
        if (((1 << v12) & 0x18E000) != 0)
        {
          long long v13 = PLPTPGetLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v14 = [v11 type];
            *(_DWORD *)buf = 134217984;
            uint64_t v25 = v14;
            _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
          }
          goto LABEL_19;
        }
        if (((1 << v12) & 6) != 0)
        {
          long long v13 = v8;
          uint64_t v8 = v11;
LABEL_19:

          continue;
        }
      }
      if (v12 - 108 > 5 || ((1 << (v12 - 108)) & 0x25) == 0)
      {
        long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
        -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PHPTPAssetManager.m", 1276, @"Unhandled resource type (%lu) in %s", [v11 type], "-[PHPTPAssetManager _primaryResourceForAsset:fromResources:]");
        goto LABEL_19;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  }
  while (v7);
LABEL_24:

  return v8;
}

- (id)_primaryResourceForAsset:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PHAssetResource assetResourcesForAsset:v4 includeDerivatives:0 includeMetadata:0 includeAdjustmentOverflowDataBlob:0];
  if (![v5 count])
  {
    uint64_t v6 = PLPTPGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [v4 objectID];
      uint64_t v8 = objc_msgSend(v7, "pl_shortURI");
      int v11 = 138412290;
      unint64_t v12 = v8;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Failed to find resources for asset %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v9 = [(PHPTPAssetManager *)self _primaryResourceForAsset:v4 fromResources:v5];

  return v9;
}

- (void)_logGreenTeaStatusForPTPAssetHandle:(id)a3 photosAsset:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!MEMORY[0x19F38A090]()) {
    goto LABEL_15;
  }
  unint64_t v9 = [v7 resourceType];
  if (v9 <= 0x14)
  {
    if (((1 << v9) & 0x1F76) != 0)
    {
      id v10 = [v8 location];

      if (v10) {
        plslogGreenTea();
      }
      plslogGreenTeaTransmittingPhotosOrVideos();
      goto LABEL_15;
    }
    if (((1 << v9) & 0x18E000) != 0)
    {
      int v11 = PLPTPGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v14 = [v7 resourceType];
        _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
      }

      goto LABEL_15;
    }
    if (((1 << v9) & 0x30088) != 0) {
      goto LABEL_15;
    }
  }
  if (v9 - 108 > 5 || ((1 << (v9 - 108)) & 0x25) == 0)
  {
    unint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PHPTPAssetManager.m", 1230, @"Unhandled resource type (%lu) in %s", objc_msgSend(v7, "resourceType"), "-[PHPTPAssetManager _logGreenTeaStatusForPTPAssetHandle:photosAsset:]");
  }
LABEL_15:
}

- (int64_t)_imageVersionForAsset:(id)a3 resourceType:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int64_t v8 = 0;
  switch(a4)
  {
    case 1:
    case 2:
    case 4:
    case 8:
    case 9:
    case 11:
    case 12:
      int64_t v8 = 1;
      goto LABEL_10;
    case 3:
    case 7:
    case 16:
    case 17:
      goto LABEL_7;
    case 5:
    case 6:
    case 10:
      goto LABEL_10;
    case 13:
    case 14:
    case 15:
    case 19:
    case 20:
      unint64_t v9 = PLPTPGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v14 = a4;
        _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
      }
      goto LABEL_9;
    case 18:
      goto LABEL_11;
    default:
      if ((unint64_t)(a4 - 108) <= 5 && ((1 << (a4 - 108)) & 0x25) != 0)
      {
LABEL_7:
        unint64_t v9 = PLPTPGetLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          id v10 = [NSNumber numberWithInteger:a4];
          *(_DWORD *)buf = 138412290;
          int64_t v14 = (int64_t)v10;
          _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_DEBUG, "Unexpected request for an image version for resource type %@", buf, 0xCu);
        }
LABEL_9:

        int64_t v8 = 2;
      }
      else
      {
LABEL_11:
        unint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PHPTPAssetManager.m", 1189, @"Unhandled resource type (%lu) in %s", a4, "-[PHPTPAssetManager _imageVersionForAsset:resourceType:]");

        int64_t v8 = 0;
      }
LABEL_10:

      return v8;
  }
}

- (BOOL)_isThumbnailSupportedForResourceType:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 > 0x14) {
    goto LABEL_10;
  }
  if (((1 << a3) & 0x1F76) != 0) {
    return 1;
  }
  if (((1 << a3) & 0x18E000) != 0)
  {
    id v7 = PLPTPGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v10 = a3;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
    }

    return 0;
  }
  if (((1 << a3) & 0x30088) == 0)
  {
LABEL_10:
    if ((unint64_t)(a3 - 108) > 5 || ((1 << (a3 - 108)) & 0x25) == 0)
    {
      int64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PHPTPAssetManager.m", 1152, @"Unhandled resource type (%lu) in %s", a3, "-[PHPTPAssetManager _isThumbnailSupportedForResourceType:]");
    }
  }
  return 0;
}

- (id)_assetTypeTranscodeLabelForType:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id result = @"original";
  switch(a3)
  {
    case 1:
    case 2:
      return result;
    case 3:
    case 4:
    case 7:
    case 16:
    case 17:
      return @"non-transcoded resource type";
    case 5:
      return @"full size render image";
    case 6:
      return @"full size render video";
    case 8:
    case 12:
      return @"adjustment base original";
    case 9:
      return @"video complement sidecar";
    case 10:
      return @"full size render video complement sidecar";
    case 11:
      return @"spatial over capture video complement";
    case 13:
    case 14:
    case 15:
    case 19:
    case 20:
      id v7 = PLPTPGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v10 = a3;
        _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
      }

      return 0;
    case 18:
      goto LABEL_9;
    default:
      if ((unint64_t)(a3 - 108) <= 5 && ((1 << (a3 - 108)) & 0x25) != 0) {
        return @"non-transcoded resource type";
      }
LABEL_9:
      int64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PHPTPAssetManager.m", 1117, @"Unhandled resource type (%lu) in %s", a3, "-[PHPTPAssetManager _assetTypeTranscodeLabelForType:]");

      return @"unkown";
  }
}

- (BOOL)_isPhotoAssetResourceType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x14) {
    goto LABEL_6;
  }
  if (((1 << a3) & 0x9DECC) != 0) {
    return 0;
  }
  if (((1 << a3) & 0x102132) == 0)
  {
LABEL_6:
    if (a3 != 110)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PHPTPAssetManager.m", 1076, @"Unhandled resource type (%lu) in %s", a3, "-[PHPTPAssetManager _isPhotoAssetResourceType:]");
    }
    return 0;
  }
  return 1;
}

- (BOOL)_isPenultimateAssetResource:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = [v5 type];
  if (v6 > 0x14) {
    goto LABEL_9;
  }
  if (((1 << v6) & 0x306FE) != 0)
  {
LABEL_15:
    BOOL v8 = 0;
    goto LABEL_16;
  }
  if (((1 << v6) & 0x18E000) != 0)
  {
    id v7 = PLPTPGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = [v5 type];
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
    }

    goto LABEL_15;
  }
  if (((1 << v6) & 0x1900) == 0)
  {
LABEL_9:
    if (v6 - 108 > 5 || ((1 << (v6 - 108)) & 0x25) == 0)
    {
      int64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PHPTPAssetManager.m", 1046, @"Unhandled resource type (%lu) in %s", objc_msgSend(v5, "type"), "-[PHPTPAssetManager _isPenultimateAssetResource:]");
    }
    goto LABEL_15;
  }
  BOOL v8 = 1;
LABEL_16:

  return v8;
}

- (id)_ptpThumbnailForOriginalVideoAsset:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  unint64_t v9 = PLPTPGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[PHPTPAssetManager _ptpThumbnailForOriginalVideoAsset:size:compressionQuality:]";
    _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&buf, 0xCu);
  }

  __uint64_t v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  uint64_t v11 = [(PHPTPAssetManager *)self photoLibrary];
  unint64_t v12 = [v11 managedObjectContext];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__19231;
  uint64_t v25 = __Block_byref_object_dispose__19232;
  id v26 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__PHPTPAssetManager__ptpThumbnailForOriginalVideoAsset_size_compressionQuality___block_invoke;
  v16[3] = &unk_1E5844AC8;
  v16[4] = self;
  id v13 = v8;
  id v17 = v13;
  p_long long buf = &buf;
  CGFloat v19 = width;
  CGFloat v20 = height;
  __uint64_t v21 = v10;
  [v12 performBlockAndWait:v16];
  id v14 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v14;
}

void __80__PHPTPAssetManager__ptpThumbnailForOriginalVideoAsset_size_compressionQuality___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F389B10]();
  uint64_t v3 = [*(id *)(a1 + 32) photoLibrary];
  id v4 = [v3 photoLibrary];

  id v5 = (void *)MEMORY[0x1E4F8A950];
  unint64_t v6 = [*(id *)(a1 + 40) objectID];
  id v7 = [v5 assetWithObjectID:v6 inLibrary:v4];

  if (v7)
  {
    id v8 = [v7 pathForOriginalFile];
    unint64_t v9 = *(void **)(*(void *)(a1 + 32) + 48);
    __uint64_t v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:0];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    unint64_t v12 = *(void **)(v11 + 40);
    id v19 = 0;
    id obj = v12;
    char v13 = objc_msgSend(v9, "generatePosterFrameExportForVideoURL:outputData:maximumSize:error:", v10, &obj, &v19, *(double *)(a1 + 56), *(double *)(a1 + 64));
    objc_storeStrong((id *)(v11 + 40), obj);
    id v14 = v19;

    if ((v13 & 1) == 0)
    {
      uint64_t v15 = PLPTPGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        double v22 = *(double *)&v14;
        _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "Unable to generate video thumbnail (original video): %@", buf, 0xCu);
      }
    }
  }
  long long v16 = PLPTPGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    double v17 = (double)(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - *(void *)(a1 + 72)) / 1000000000.0;
    uint64_t v18 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length];
    *(_DWORD *)long long buf = 134218499;
    double v22 = v17;
    __int16 v23 = 2113;
    uint64_t v24 = 0;
    __int16 v25 = 2048;
    uint64_t v26 = v18;
    _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_DEBUG, "Generated thumbnail (original video) in %.3fs, name: %{private}@, size: %ld", buf, 0x20u);
  }
}

- (void)_registerForFirstUnlockNotification
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  int v11 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PHPTPAssetManager__registerForFirstUnlockNotification__block_invoke;
  aBlock[3] = &unk_1E5848D28;
  aBlock[4] = self;
  aBlock[5] = v10;
  uint64_t v2 = _Block_copy(aBlock);
  uint64_t v3 = PLPTPGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_INFO, "Registering for first unlock", buf, 2u);
  }

  id v4 = MEMORY[0x1E4F14428];
  id v5 = v2;
  int v6 = pl_notify_register_dispatch();

  if (v6)
  {
    id v7 = PLPTPGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "Unable to wait for first unlock", buf, 2u);
    }
  }
  _Block_object_dispose(v10, 8);
}

uint64_t __56__PHPTPAssetManager__registerForFirstUnlockNotification__block_invoke(uint64_t a1)
{
  uint64_t result = MKBDeviceUnlockedSinceBoot();
  if (result == 1)
  {
    notify_cancel(*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _handlePhotoLibraryAvailableNotification];
  }
  return result;
}

uint64_t __56__PHPTPAssetManager__registerForFirstUnlockNotification__block_invoke_167(uint64_t result, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) == a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)_handlePhotoLibraryAvailableNotification
{
  uint64_t v3 = [(PHPTPAssetManager *)self photoLibrary];
  if (self->_libraryAvailabilityStatus <= 1 && v3 != 0)
  {
    id v9 = v3;
    [v3 registerChangeObserver:self];
    self->_libraryAvailabilityStatus = 2;
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    char v7 = objc_opt_respondsToSelector();

    uint64_t v3 = v9;
    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      [v8 libraryDidBecomeAvailable];

      uint64_t v3 = v9;
    }
  }
}

- (id)_ptpAssetReaderForFormatConvertedPTPAsset:(id)a3 ofPhotosAsset:(id)a4 resourcePath:(id)a5 originalResourcePath:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v14 = PLPTPGetLog();
  os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, v10);

  long long v16 = PLPTPGetLog();
  double v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    int v22 = 138412290;
    id v23 = v11;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PTP transcode", "PTP format converted asset reader for %@", (uint8_t *)&v22, 0xCu);
  }

  uint64_t v18 = [(PHPTPFormatConversionManager *)self->_formatConversionManager ptpAssetReaderForFormatConvertedPTPAsset:v13 ofPhotosAsset:v10 resourcePath:v11 originalResourcePath:v12];

  id v19 = PLPTPGetLog();
  CGFloat v20 = v19;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v20, OS_SIGNPOST_INTERVAL_END, v15, "PTP transcode", (const char *)&unk_19B30018E, (uint8_t *)&v22, 2u);
  }

  return v18;
}

- (id)_photosAssetForPTPAssetHandle:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PHPTPAssetManager *)self photoLibrary];
  int v6 = [v5 librarySpecificFetchOptions];

  v20[0] = @"PHAssetPropertySetPTP";
  char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [v6 setFetchPropertySets:v7];

  [v6 setIncludeAllBurstAssets:1];
  id v8 = [v4 localIdentifier];
  id v19 = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  id v10 = +[PHAsset fetchAssetsWithLocalIdentifiers:v9 options:v6];

  id v11 = [v10 firstObject];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v14 = PLPTPGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      os_signpost_id_t v15 = [v4 localIdentifier];
      int v17 = 138412290;
      uint64_t v18 = v15;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_ERROR, "Unable to find asset for asset local identifier: %@", (uint8_t *)&v17, 0xCu);
    }
  }

  return v12;
}

- (void)_expungeAsset:(id)a3 withReason:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLPTPGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 objectID];
    id v10 = objc_msgSend(v9, "pl_shortURI");
    *(_DWORD *)long long buf = 138543618;
    int v22 = v10;
    __int16 v23 = 2114;
    id v24 = v7;
    _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEFAULT, "Expunging asset: %{public}@, reason: %{public}@", buf, 0x16u);
  }
  id v11 = [(PHPTPAssetManager *)self photoLibrary];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __46__PHPTPAssetManager__expungeAsset_withReason___block_invoke;
  v19[3] = &unk_1E5848578;
  id v12 = v6;
  id v20 = v12;
  id v18 = 0;
  char v13 = [v11 performChangesAndWait:v19 error:&v18];
  id v14 = v18;

  if ((v13 & 1) == 0)
  {
    os_signpost_id_t v15 = PLPTPGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      long long v16 = [v12 objectID];
      int v17 = objc_msgSend(v16, "pl_shortURI");
      *(_DWORD *)long long buf = 138543618;
      int v22 = v17;
      __int16 v23 = 2112;
      id v24 = v14;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "Error trying to expunge asset: %{public}@ (%@)", buf, 0x16u);
    }
  }
}

void __46__PHPTPAssetManager__expungeAsset_withReason___block_invoke(uint64_t a1)
{
  id v2 = +[PHTrashableObjectDeleteRequest deleteRequestForObject:*(void *)(a1 + 32) operation:1];
  v1 = objc_alloc_init(PHAssetDeleteOptions);
  [(PHAssetDeleteOptions *)v1 setExpungeSource:8];
  [v2 setDeleteOptions:v1];
}

- (id)_diagnosticFilePathForLibrary:(id)a3 mainFilename:(id)a4 createIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [a3 pathManager];
  id v9 = [v8 privateDirectoryWithSubType:8 createIfNeeded:v5 error:0];

  id v10 = [v7 stringByDeletingPathExtension];

  id v11 = [v10 stringByAppendingPathExtension:@"DBG"];

  id v12 = [v9 stringByAppendingPathComponent:v11];

  return v12;
}

- (id)_createDiagnosticPTPAssetFromAsset:(id)a3 primaryPTPAsset:(id)a4
{
  id v6 = a3;
  if (self->_provideDiagnosticFile)
  {
    photoLibrary = self->_photoLibrary;
    id v8 = [a4 url];
    id v9 = [v8 lastPathComponent];
    id v10 = [(PHPTPAssetManager *)self _diagnosticFilePathForLibrary:photoLibrary mainFilename:v9 createIfNeeded:0];

    memset(&v17, 0, sizeof(v17));
    id v11 = v10;
    if (lstat((const char *)objc_msgSend(v11, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                           0,
                           0),
           &v17)
      || (v17.st_mode & 0xF000) != 0x8000)
    {
      id v14 = 0;
    }
    else
    {
      id v12 = [PHMutablePTPAsset alloc];
      char v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
      id v14 = [(PHPTPAsset *)v12 initWithPhotosAsset:v6 url:v13 resourceType:113 orientation:1];

      os_signpost_id_t v15 = [v11 lastPathComponent];
      [(PHMutablePTPAsset *)v14 setDcfFilename:v15];
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)_ptpAssetWithType:(int64_t)a3 fromPTPAssets:(id)a4 requiresConversion:(BOOL)a5
{
  int v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        char v13 = objc_msgSend(v12, "resourceHandle", (void)v18);
        if ([v13 resourceType] == a3)
        {
          id v14 = [v12 resourceHandle];
          int v15 = [v14 requiresConversion];

          if (v15 == v5)
          {
            id v16 = v12;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
  id v16 = 0;
LABEL_13:

  return v16;
}

- (BOOL)_ensureLivePhotoComponentsAgreeOnConversionRequirementForPTPAssets:(id)a3 withConversionSupport:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = 1;
  uint64_t v9 = [(PHPTPAssetManager *)self _ptpAssetWithType:1 fromPTPAssets:v6 requiresConversion:1];
  uint64_t v10 = [(PHPTPAssetManager *)self _ptpAssetWithType:9 fromPTPAssets:v6 requiresConversion:1];
  id v11 = (void *)v10;
  if (!v9 && v10)
  {
    uint64_t v9 = [(PHPTPAssetManager *)self _ptpAssetWithType:1 fromPTPAssets:v6 requiresConversion:0];
    id v12 = +[PHPTPConversionSourceHints hintsForPTPAsset:v9 isVideo:0 isRender:0];
    uint64_t v13 = [v7 conversionResultForPTPAsset:v9 sourceHints:v12 forceLegacyConversion:1 assetTypeLabel:@"originalAssetFromVideoComplement"];
    if (v13)
    {
      id v14 = (void *)v13;
      if ([v7 peerSupportsTranscodeChoice])
      {
        int v15 = [v9 updateForTranscodeChoiceWithConversionResult:v14];
        [v6 addObject:v15];
      }
      else
      {
        [v9 updateWithConversionResult:v14];
      }

      BOOL v8 = 1;
    }
    else
    {
      id v16 = PLPTPGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        stat v17 = [v9 resourceHandle];
        uint64_t v18 = [v17 resourceType];
        long long v19 = [v9 relatedUUID];
        int v21 = 134218242;
        uint64_t v22 = v18;
        __int16 v23 = 2114;
        id v24 = v19;
        _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "Unexpected nil PHPTPConversionResult for forced conversion for original asset resource %ld for asset %{public}@", (uint8_t *)&v21, 0x16u);
      }
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (void)_updateConversionResultForPTPAssets:(id)a3 conversionSupport:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v33 = a4;
  v31 = [MEMORY[0x1E4F1CA48] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (([v11 isPhoto] & 1) != 0 || objc_msgSend(v11, "isMovie"))
        {
          id v12 = v11;
          uint64_t v13 = v12;
          if ([v12 isMovie])
          {
            uint64_t v13 = v12;
            if ([v12 isPartOfLivePhoto])
            {
              uint64_t v14 = [v12 isRender] ? 5 : 1;
              uint64_t v13 = [(PHPTPAssetManager *)self _ptpAssetWithType:v14 fromPTPAssets:v6 requiresConversion:0];

              if (!v13)
              {
                int v15 = PLPTPGetLog();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                {
                  id v16 = [v12 resourceHandle];
                  stat v17 = [v16 localIdentifier];
                  *(_DWORD *)long long buf = 138543362;
                  uint64_t v39 = (uint64_t)v17;
                  _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "Unexpected nil assetForSourceHints for live photo still image for asset %{public}@", buf, 0xCu);
                }
                uint64_t v13 = 0;
              }
            }
          }
          uint64_t v18 = +[PHPTPConversionSourceHints hintsForPTPAsset:isVideo:isRender:](PHPTPConversionSourceHints, "hintsForPTPAsset:isVideo:isRender:", v13, [v12 isMovie], objc_msgSend(v12, "isRender"));
          long long v19 = [v12 resourceHandle];
          long long v20 = -[PHPTPAssetManager _assetTypeTranscodeLabelForType:](self, "_assetTypeTranscodeLabelForType:", [v19 resourceType]);
          int v21 = [v33 conversionResultForPTPAsset:v12 sourceHints:v18 forceLegacyConversion:0 assetTypeLabel:v20];

          if (!v21)
          {
            uint64_t v26 = PLPTPGetLog();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v27 = [v12 resourceHandle];
              uint64_t v28 = [v27 resourceType];
              v29 = [v12 relatedUUID];
              *(_DWORD *)long long buf = 134218242;
              uint64_t v39 = v28;
              __int16 v40 = 2114;
              v41 = v29;
              _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_DEBUG, "No PHPTPConversionResult for conversion for original asset resource %ld for asset %{public}@", buf, 0x16u);
            }
            uint64_t v25 = v31;
            goto LABEL_34;
          }
          if ([v21 requiresConversion])
          {
            if ([v33 peerSupportsTranscodeChoice])
            {
              uint64_t v22 = [v12 updateForTranscodeChoiceWithConversionResult:v21];
              if (v22)
              {
                [v31 addObject:v22];
              }
              else
              {
                __int16 v23 = PLPTPGetLog();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  v30 = [v12 resourceHandle];
                  id v24 = [v30 localIdentifier];
                  *(_DWORD *)long long buf = 138543362;
                  uint64_t v39 = (uint64_t)v24;
                  _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_ERROR, "Failed to make converted asset for asset %{public}@", buf, 0xCu);
                }
              }
            }
            else
            {
              [v12 updateWithConversionResult:v21];
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  uint64_t v25 = v31;
  [v6 addObjectsFromArray:v31];
LABEL_34:
}

- (BOOL)_shouldSkipResource:(id)a3 forAsset:(id)a4 conversionSupport:(id)a5 debugAnalytics:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 isLocallyAvailable])
  {
    if (!+[PHPTPAsset isSupportedResourceType:](PHPTPAsset, "isSupportedResourceType:", [v10 type]))
    {
      uint64_t v14 = PLPTPGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = [v10 type];
        id v16 = [v11 objectID];
        objc_msgSend(v16, "pl_shortURI");
        stat v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        int v33 = 134218242;
        uint64_t v34 = v20;
        __int16 v35 = 2114;
        long long v36 = v17;
        uint64_t v18 = "PTP asset resource creation: skipping unsupported type (%lu) for asset (%{public}@)";
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    if ([v11 isVideo]
      && -[PHPTPAssetManager _isPhotoAssetResourceType:](self, "_isPhotoAssetResourceType:", [v10 type]))
    {
      uint64_t v14 = PLPTPGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = [v10 type];
        id v16 = [v11 objectID];
        objc_msgSend(v16, "pl_shortURI");
        stat v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        int v33 = 134218242;
        uint64_t v34 = v15;
        __int16 v35 = 2114;
        long long v36 = v17;
        uint64_t v18 = "PTP asset resource creation: skipping photo type (%lu) for video asset (%{public}@)";
LABEL_11:
        _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v33, 0x16u);

        goto LABEL_12;
      }
      goto LABEL_12;
    }
    if ([v11 isPartOfBurst] && objc_msgSend(v10, "type") == 5)
    {
      uint64_t v14 = PLPTPGetLog();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      __int16 v23 = [v11 objectID];
      id v24 = objc_msgSend(v23, "pl_shortURI");
      int v33 = 138543362;
      uint64_t v34 = (uint64_t)v24;
      uint64_t v25 = "PTP asset resource creation: skipping full size resource for burst asset (%{public}@)";
      goto LABEL_35;
    }
    if ([(PHPTPAssetManager *)self _isPenultimateAssetResource:v10]
      && (![v12 peerSupportsAdjustmentBaseResources]
       || ([v12 penultimateIsPublic] & 1) == 0))
    {
      uint64_t v14 = PLPTPGetLog();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      if ([v12 peerSupportsAdjustmentBaseResources]) {
        uint64_t v27 = @"Y";
      }
      else {
        uint64_t v27 = @"N";
      }
      if ([v12 penultimateIsPublic]) {
        uint64_t v28 = @"Y";
      }
      else {
        uint64_t v28 = @"N";
      }
      __int16 v23 = [v11 objectID];
      id v24 = objc_msgSend(v23, "pl_shortURI");
      int v33 = 138412802;
      uint64_t v34 = (uint64_t)v27;
      __int16 v35 = 2112;
      long long v36 = v28;
      __int16 v37 = 2114;
      v38 = v24;
      uint64_t v25 = "PTP asset resource creation: skipping penultimate resource (peer support: %@, is public: %@) for asset (%{public}@)";
      v29 = v14;
      uint32_t v30 = 32;
LABEL_36:
      _os_log_impl(&dword_19B043000, v29, OS_LOG_TYPE_INFO, v25, (uint8_t *)&v33, v30);

      goto LABEL_12;
    }
    uint64_t v26 = [v11 filename];
    if (v26)
    {
    }
    else
    {
      v31 = [v11 ptpProperties];
      v32 = [v31 originalFilename];

      if (!v32)
      {
        uint64_t v14 = PLPTPGetLog();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
          goto LABEL_12;
        }
        __int16 v23 = [v11 objectID];
        id v24 = objc_msgSend(v23, "pl_shortURI");
        int v33 = 138543362;
        uint64_t v34 = (uint64_t)v24;
        uint64_t v25 = "PTP asset resource creation: skipping resource with missing filename AND originalFilename for asset (%{public}@)";
LABEL_35:
        v29 = v14;
        uint32_t v30 = 12;
        goto LABEL_36;
      }
    }
    BOOL v21 = 0;
    goto LABEL_13;
  }
  uint64_t v14 = PLPTPGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = [v10 type];
    id v16 = [v11 objectID];
    objc_msgSend(v16, "pl_shortURI");
    stat v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v33 = 134218242;
    uint64_t v34 = v19;
    __int16 v35 = 2114;
    long long v36 = v17;
    uint64_t v18 = "PTP asset resource creation: skipping non-local resource (%ld) for asset (%{public}@)";
    goto LABEL_11;
  }
LABEL_12:

  [v13 addSkippedResource:v10];
  BOOL v21 = 1;
LABEL_13:

  return v21;
}

- (id)_createPTPAssetsFromAsset:(id)a3 photosResources:(id)a4 withConversionSupport:(id)a5 includeMetadata:(BOOL)a6 includeAdjustmentOverflowDataBlob:(BOOL)a7 debugAnalytics:(id)a8
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v75 = a3;
  id v12 = a4;
  id v71 = a5;
  id v13 = a8;
  uint64_t v14 = PLPTPGetLog();
  v72 = v13;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = [v75 objectID];
    id v16 = objc_msgSend(v15, "pl_shortURI");
    *(_DWORD *)long long buf = 138412546;
    uint64_t v81 = (uint64_t)v16;
    __int16 v82 = 2112;
    uint64_t v83 = (uint64_t)v12;
    _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_DEBUG, "Creating PLPTPAssets for asset (%@) resources: %@", buf, 0x16u);

    id v13 = v72;
  }

  v73 = [MEMORY[0x1E4F1CA48] array];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v17 = v12;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v76 objects:v86 count:16];
  uint64_t v20 = v71;
  id v74 = v17;
  if (v18)
  {
    uint64_t v21 = v18;
    uint64_t v22 = *(void *)v77;
    *(void *)&long long v19 = 138543618;
    long long v70 = v19;
LABEL_5:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v77 != v22) {
        objc_enumerationMutation(v17);
      }
      id v24 = *(void **)(*((void *)&v76 + 1) + 8 * v23);
      BOOL v25 = +[PHPTPAssetManager _isPrimaryAssetResourceType:](PHPTPAssetManager, "_isPrimaryAssetResourceType:", objc_msgSend(v24, "type", v70));
      if (v25 && ([v24 isLocallyAvailable] & 1) == 0) {
        break;
      }
      if (![(PHPTPAssetManager *)self _shouldSkipResource:v24 forAsset:v75 conversionSupport:v20 debugAnalytics:v13])
      {
        uint64_t v26 = [(PHPTPAsset *)[PHMutablePTPAsset alloc] initWithPhotosAsset:v75 photosResource:v24];
        if (v26)
        {
          [v73 addObject:v26];
        }
        else
        {
          uint64_t v27 = PLPTPGetLog();
          BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
          if (v25)
          {
            if (v28)
            {
              v62 = [v75 objectID];
              v63 = objc_msgSend(v62, "pl_shortURI");
              uint64_t v64 = [v24 type];
              *(_DWORD *)long long buf = v70;
              uint64_t v81 = (uint64_t)v63;
              __int16 v82 = 2048;
              uint64_t v83 = v64;
              _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_ERROR, "Error: unable to create PHPTPAsset for PHAssetResource of asset (%{public}@) of type %ld (skipping asset)", buf, 0x16u);
            }
            v61 = 0;
            id v17 = v74;
LABEL_46:
            __int16 v35 = v17;
            id v57 = v73;
            goto LABEL_51;
          }
          if (v28)
          {
            v29 = [v75 objectID];
            uint32_t v30 = objc_msgSend(v29, "pl_shortURI");
            uint64_t v31 = [v24 type];
            *(_DWORD *)long long buf = v70;
            uint64_t v81 = (uint64_t)v30;
            __int16 v82 = 2048;
            uint64_t v83 = v31;
            _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_ERROR, "Error: unable to create PHPTPAsset for PHAssetResource of asset (%{public}@) of type %ld (skipping resource)", buf, 0x16u);

            uint64_t v20 = v71;
          }

          id v13 = v72;
        }

        id v17 = v74;
      }
      if (v21 == ++v23)
      {
        uint64_t v21 = [v17 countByEnumeratingWithState:&v76 objects:v86 count:16];
        if (v21) {
          goto LABEL_5;
        }
        goto LABEL_20;
      }
    }
    uint64_t v27 = PLPTPGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v58 = [v24 type];
      v59 = [v75 objectID];
      v60 = objc_msgSend(v59, "pl_shortURI");
      *(_DWORD *)long long buf = 134218242;
      uint64_t v81 = v58;
      __int16 v82 = 2114;
      uint64_t v83 = (uint64_t)v60;
      _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_INFO, "PHPTPAsset creation: skipping asset because non-local original resource (%ld) for asset (%{public}@)", buf, 0x16u);
    }
    v61 = 0;
    goto LABEL_46;
  }
LABEL_20:

  v32 = PLPTPGetLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v33 = [v73 count];
    uint64_t v34 = [v17 count];
    *(_DWORD *)long long buf = 134218498;
    uint64_t v81 = v33;
    uint64_t v20 = v71;
    __int16 v82 = 2048;
    uint64_t v83 = v34;
    __int16 v84 = 2112;
    v85 = v73;
    _os_log_impl(&dword_19B043000, v32, OS_LOG_TYPE_DEBUG, "Created %lu PHPTPAssets for %lu resources: %@", buf, 0x20u);
  }

  __int16 v35 = [(PHPTPAssetManager *)self _ptpAssetWithType:7 fromPTPAssets:v73 requiresConversion:0];
  uint64_t v36 = [(PHPTPAssetManager *)self _ptpAssetWithType:108 fromPTPAssets:v73 requiresConversion:0];
  uint64_t v27 = v36;
  if (v35 && v36)
  {
    __int16 v37 = PLPTPGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B043000, v37, OS_LOG_TYPE_DEBUG, "Combining adjustment resource with overflow adjustment resource. Removing overflow adjustment resource from created PHPTPAssets", buf, 2u);
    }

    v38 = NSNumber;
    uint64_t v39 = [v35 objectCompressedSize];
    uint64_t v40 = [v39 unsignedIntegerValue];
    v41 = [v27 objectCompressedSize];
    v42 = objc_msgSend(v38, "numberWithUnsignedInteger:", objc_msgSend(v41, "unsignedIntegerValue") + v40);
    [v35 setObjectCompressedSize:v42];

    uint64_t v43 = [v27 url];
    [v35 setOverflowURL:v43];

    [v73 removeObject:v27];
    uint64_t v20 = v71;
  }
  v44 = [(PHPTPAssetManager *)self _ptpAssetWithType:5 fromPTPAssets:v73 requiresConversion:0];
  if (!v44)
  {
    v45 = PLPTPGetLog();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      v46 = [v75 objectID];
      v47 = objc_msgSend(v46, "pl_shortURI");
      v48 = [v75 uuid];
      *(_DWORD *)long long buf = 138543618;
      uint64_t v81 = (uint64_t)v47;
      __int16 v82 = 2112;
      uint64_t v83 = (uint64_t)v48;
      _os_log_impl(&dword_19B043000, v45, OS_LOG_TYPE_INFO, "Skipping full size render video due to missing full size render image: %{public}@ (UUID: %@)", buf, 0x16u);
    }
    v49 = [(PHPTPAssetManager *)self _ptpAssetWithType:10 fromPTPAssets:v73 requiresConversion:0];
    [v73 removeObject:v49];

    uint64_t v20 = v71;
  }
  [(PHPTPAssetManager *)self _updateConversionResultForPTPAssets:v73 conversionSupport:v20];
  [(PHPTPAssetManager *)self _ensureLivePhotoComponentsAgreeOnConversionRequirementForPTPAssets:v73 withConversionSupport:v20];
  if ([v75 isPhoto]) {
    uint64_t v50 = 1;
  }
  else {
    uint64_t v50 = 2;
  }
  v51 = [(PHPTPAssetManager *)self _ptpAssetWithType:v50 fromPTPAssets:v73 requiresConversion:0];
  v52 = [(PHPTPAssetManager *)self _createDiagnosticPTPAssetFromAsset:v75 primaryPTPAsset:v51];
  if (v52)
  {
    v53 = PLPTPGetLog();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      v54 = [v75 objectID];
      objc_msgSend(v54, "pl_shortURI");
      v56 = v55 = v44;
      *(_DWORD *)long long buf = 138412290;
      uint64_t v81 = (uint64_t)v56;
      _os_log_impl(&dword_19B043000, v53, OS_LOG_TYPE_DEBUG, "Adding diagnostic resource for asset %@", buf, 0xCu);

      v44 = v55;
      uint64_t v20 = v71;
    }

    [v73 addObject:v52];
  }
  if ([v73 count])
  {
    id v57 = v73;
  }
  else
  {
    v65 = PLPTPGetLog();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v66 = [v75 objectID];
      objc_msgSend(v66, "pl_shortURI");
      v68 = v67 = v44;
      *(_DWORD *)long long buf = 138543362;
      uint64_t v81 = (uint64_t)v68;
      _os_log_impl(&dword_19B043000, v65, OS_LOG_TYPE_ERROR, "Failed to create PHPTPAssets for library asset '%{public}@'", buf, 0xCu);

      v44 = v67;
      uint64_t v20 = v71;
    }

    id v57 = 0;
  }

  v61 = v57;
  id v17 = v74;
LABEL_51:

  return v61;
}

- (id)_createPTPAssetsFromAsset:(id)a3 photosResources:(id)a4 withConversionSupport:(id)a5 includeMetadata:(BOOL)a6 includeAdjustmentOverflowDataBlob:(BOOL)a7
{
  return [(PHPTPAssetManager *)self _createPTPAssetsFromAsset:a3 photosResources:a4 withConversionSupport:a5 includeMetadata:a6 includeAdjustmentOverflowDataBlob:a7 debugAnalytics:0];
}

- (void)_ensureDeferredRenderingIsComplete
{
  id v9 = [(PHPTPAssetManager *)self photoLibrary];
  uint64_t v3 = [(PHPTPAssetManager *)self photoLibrary];
  id v4 = [v3 librarySpecificFetchOptions];

  id v5 = +[PHAsset fetchAnyCinematicVideosNeedingDeferredProcessingWithOtions:v4];
  if ([v5 count])
  {
    id v6 = [v9 photoLibraryBundle];
    uint64_t v7 = [v6 assetsdClient];
    uint64_t v8 = [v7 notificationClient];
    [v8 asyncNotifyStartOfInterestForUnrenderedCinematicVideoItems];
  }
}

- (id)_fetchAssetsForIdentifiers:(id)a3 includeTrash:(BOOL)a4
{
  BOOL v4 = a4;
  v15[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(PHPTPAssetManager *)self photoLibrary];
  uint64_t v8 = [v7 librarySpecificFetchOptions];

  [v8 setChunkSizeForFetch:200];
  v15[0] = @"PHAssetPropertySetIdentifier";
  v15[1] = @"PHAssetPropertySetPTP";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [v8 setFetchPropertySets:v9];

  [v8 setWantsIncrementalChangeDetails:1];
  [v8 setIncludeTrashedAssets:v4];
  [v8 setCacheSizeForFetch:200];
  id v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:self->_sortAscending];
  uint64_t v14 = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  [v8 setSortDescriptors:v11];

  if ([v6 count]) {
    +[PHAsset fetchAssetsWithLocalIdentifiers:v6 options:v8];
  }
  else {
  id v12 = +[PHAsset fetchAssetsForPTPWithOptions:v8];
  }

  return v12;
}

- (id)_enumerateAssetsWithLocalIdentifiers:(id)a3 usingBlock:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void *, unsigned __int8 *))a4;
  unsigned __int8 v36 = 0;
  uint64_t v8 = [(PHPTPAssetManager *)self _fetchAssetsForIdentifiers:v6 includeTrash:v6 != 0];
  if ([v8 count])
  {
    if ([v8 count])
    {
      unint64_t v9 = 0;
      uint32_t v30 = v8;
      do
      {
        context = (void *)MEMORY[0x19F389B10]();
        id v10 = (void *)MEMORY[0x1E4F28D60];
        uint64_t v11 = [v8 count];
        if (v11 - v9 >= 0xC8) {
          uint64_t v12 = 200;
        }
        else {
          uint64_t v12 = v11 - v9;
        }
        id v13 = objc_msgSend(v10, "indexSetWithIndexesInRange:", v9, v12);
        uint64_t v14 = [v8 objectsAtIndexes:v13];

        uint64_t v15 = +[PHAssetResource assetResourcesForAssets:v14 includeDerivatives:0 includeMetadata:0 includeAdjustmentOverflowDataBlob:0];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v16 = v14;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v33;
LABEL_9:
          uint64_t v20 = 0;
          while (1)
          {
            if (*(void *)v33 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 8 * v20);
            uint64_t v22 = [v15 objectForKeyedSubscript:v21];
            v7[2](v7, v21, v22, &v36);

            if (v36) {
              break;
            }
            if (v18 == ++v20)
            {
              uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v37 count:16];
              if (v18) {
                goto LABEL_9;
              }
              break;
            }
          }
        }

        int v23 = v36;
        uint64_t v8 = v30;
        if (v23) {
          break;
        }
        v9 += 200;
      }
      while (v9 < [v30 count]);
    }
    id v24 = v8;
  }
  else
  {
    uint64_t v25 = [v6 count];
    uint64_t v26 = PLPTPGetLog();
    uint64_t v27 = v26;
    if (v25)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        BOOL v28 = [v6 componentsJoinedByString:@","];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v39 = v28;
        _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_ERROR, "Failed to fetch asset for identifiers: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_DEBUG, "No assets to enumerate", buf, 2u);
    }

    buf[0] = 0;
    v7[2](v7, 0, 0, buf);
    id v24 = 0;
  }

  return v24;
}

- (int64_t)cplStorageState
{
  uint64_t v3 = [(PHPTPAssetManager *)self photoLibrary];
  int v4 = [v3 isCloudPhotoLibraryEnabled];

  if (!v4) {
    return 0;
  }
  id v5 = [(PHPTPAssetManager *)self photoLibrary];
  int v6 = [v5 isKeepOriginalsEnabled];

  if (v6) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)libraryIsAvailable
{
  id v2 = [(PHPTPAssetManager *)self photoLibrary];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_handleMakeResourceReplyForAssetUUID:(id)a3 assetObjectID:(id)a4 moc:(id)a5 success:(BOOL)a6 error:(id)a7
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  uint64_t v15 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  v32[0] = v12;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  uint64_t v17 = +[PHAsset fetchAssetsWithObjectIDs:v16 options:v15];
  uint64_t v18 = [v17 firstObject];

  if (v18)
  {
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x2020000000;
    uint64_t v27 = 0;
    uint64_t v21 = MEMORY[0x1E4F143A8];
    id v22 = v14;
    id v23 = v18;
    PLRunWithUnfairLock();
    uint64_t v19 = PLPTPGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = v25[3];
      *(_DWORD *)long long buf = 138412546;
      id v29 = v11;
      __int16 v30 = 2048;
      uint64_t v31 = v20;
      _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_DEBUG, "Re-enqueued finalization for asset (uuid: %@, pending: %lu)", buf, 0x16u);
    }

    [(PHPTPAssetManager *)self _requestFinalizationOfNextAsset];
    _Block_object_dispose(&v24, 8);
  }
}

void __90__PHPTPAssetManager__handleMakeResourceReplyForAssetUUID_assetObjectID_moc_success_error___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) code] == 3072) {
    [*(id *)(*(void *)(a1 + 40) + 80) insertObject:*(void *)(a1 + 48) atIndex:0];
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 40) + 80) count];
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v3 = *(void **)(v2 + 88);
  *(void *)(v2 + 88) = 0;
}

- (id)_sendFinalizationRequestForAsset:(id)a3 moc:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PHPTPAssetManager.m", 559, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PHPTPAssetManager.m", 560, @"Invalid parameter not satisfying: %@", @"moc" object file lineNumber description];

LABEL_3:
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__19231;
  uint64_t v25 = __Block_byref_object_dispose__19232;
  id v26 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__PHPTPAssetManager__sendFinalizationRequestForAsset_moc___block_invoke;
  v16[3] = &unk_1E58480A0;
  id v10 = v7;
  id v17 = v10;
  uint64_t v18 = self;
  uint64_t v20 = &v21;
  id v11 = v9;
  id v19 = v11;
  [v11 performBlockAndWait:v16];
  id v12 = (id)v22[5];

  _Block_object_dispose(&v21, 8);

  return v12;
}

void __58__PHPTPAssetManager__sendFinalizationRequestForAsset_moc___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) uuid];
  BOOL v3 = [*(id *)(a1 + 32) objectID];
  int v4 = [*(id *)(a1 + 40) _primaryResourceForAsset:*(void *)(a1 + 32)];
  id v5 = PLPTPGetLog();
  int v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = [*(id *)(a1 + 32) objectID];
      id v8 = objc_msgSend(v7, "pl_shortURI");
      *(_DWORD *)long long buf = 138543362;
      BOOL v28 = v8;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_INFO, "Requesting finalization of asset: %{public}@", buf, 0xCu);
    }
    id v9 = objc_alloc(MEMORY[0x1E4F8AB58]);
    id v10 = NSString;
    id v11 = [*(id *)(a1 + 32) uuid];
    id v12 = [v10 stringWithFormat:@"ptp-%@", v11];
    id v13 = [v4 backingResourceIdentity];
    int v6 = [v9 initWithTaskIdentifier:v12 assetObjectID:v3 resource:v13];

    id v14 = (void *)MEMORY[0x1E4F8AA90];
    uint64_t v15 = [MEMORY[0x1E4F8B980] systemLibraryURL];
    id v16 = [v14 sharedAssetsdClientForPhotoLibraryURL:v15];

    id v17 = [v16 resourceAvailabilityClient];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __58__PHPTPAssetManager__sendFinalizationRequestForAsset_moc___block_invoke_139;
    v23[3] = &unk_1E5844A78;
    v23[4] = *(void *)(a1 + 40);
    id v24 = v2;
    id v25 = v3;
    id v26 = *(id *)(a1 + 48);
    uint64_t v18 = [v17 sendMakeResourceAvailableRequest:v6 reply:v23];
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = [*(id *)(a1 + 32) objectID];
    id v22 = objc_msgSend(v21, "pl_shortURI");
    *(_DWORD *)long long buf = 138412290;
    BOOL v28 = v22;
    _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Failed to get the original resource for asset: %@", buf, 0xCu);
  }
}

uint64_t __58__PHPTPAssetManager__sendFinalizationRequestForAsset_moc___block_invoke_139(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [*(id *)(a1 + 32) _handleMakeResourceReplyForAssetUUID:*(void *)(a1 + 40) assetObjectID:*(void *)(a1 + 48) moc:*(void *)(a1 + 56) success:a2 error:a6];
}

- (void)_requestFinalizationOfNextAsset
{
  if ([(PFCameraViewfinderSessionWatcher *)self->_cameraWatcher isCameraRunning])
  {
    BOOL v3 = PLPTPGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_INFO, "Camera view finder is running, skipping finalization requests", buf, 2u);
    }
  }
  else
  {
    *(void *)long long buf = 0;
    int v6 = buf;
    uint64_t v7 = 0x3032000000;
    id v8 = __Block_byref_object_copy__19231;
    id v9 = __Block_byref_object_dispose__19232;
    id v10 = 0;
    uint64_t v4 = MEMORY[0x1E4F143A8];
    PLRunWithUnfairLock();
    objc_msgSend(*((id *)v6 + 5), "objectValue", v4, 3221225472, __52__PHPTPAssetManager__requestFinalizationOfNextAsset__block_invoke, &unk_1E5848D28, self, buf);

    _Block_object_dispose(buf, 8);
  }
}

void __52__PHPTPAssetManager__requestFinalizationOfNextAsset__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLPTPGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 80) count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v17 = v3;
    _os_log_impl(&dword_19B043000, v2, OS_LOG_TYPE_INFO, "Camera view finder is NOT running, sending finalization requests (pending:%lu)", buf, 0xCu);
  }

  while (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 80) firstObject];
    if (!v4) {
      break;
    }
    id v5 = *(void **)(a1 + 32);
    id v6 = objc_initWeak((id *)buf, v5);

    id v7 = objc_alloc(MEMORY[0x1E4F8B948]);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__PHPTPAssetManager__requestFinalizationOfNextAsset__block_invoke_125;
    v13[3] = &unk_1E5844A50;
    objc_copyWeak(&v15, (id *)buf);
    id v8 = v4;
    id v14 = v8;
    uint64_t v9 = [v7 initWithBlock:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    id v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v12) {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), v12);
    }
    [*(id *)(*(void *)(a1 + 32) + 80) removeObjectAtIndex:0];
  }
}

id __52__PHPTPAssetManager__requestFinalizationOfNextAsset__block_invoke_125(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [WeakRetained photoLibrary];
    id v6 = [v5 managedObjectContext];
    id v7 = [v3 _sendFinalizationRequestForAsset:v4 moc:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_addAssetsNeedingFinalization:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  id v7 = v4;
  id v5 = v4;
  PLRunWithUnfairLock();
  [(PHPTPAssetManager *)self _requestFinalizationOfNextAsset];
}

uint64_t __51__PHPTPAssetManager__addAssetsNeedingFinalization___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLPTPGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19B043000, v2, OS_LOG_TYPE_DEBUG, "Adding %lu assets to pending finalization queue.", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 40) + 72) addObjectsFromArray:*(void *)(a1 + 32)];
  return [*(id *)(*(void *)(a1 + 40) + 80) addObjectsFromArray:*(void *)(a1 + 32)];
}

- (void)photoLibraryDidBecomeUnavailable:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 libraryDidBecomeUnavailable];
  }
}

- (void)photoLibraryDidChange:(id)a3
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  id v91 = a3;
  uint64_t v129 = 0;
  v130 = &v129;
  uint64_t v131 = 0x3032000000;
  v132 = __Block_byref_object_copy__19231;
  v133 = __Block_byref_object_dispose__19232;
  id v134 = 0;
  uint64_t v123 = 0;
  v124 = &v123;
  uint64_t v125 = 0x3032000000;
  v126 = __Block_byref_object_copy__19231;
  v127 = __Block_byref_object_dispose__19232;
  id v128 = 0;
  uint64_t v117 = MEMORY[0x1E4F143A8];
  uint64_t v118 = 3221225472;
  v119 = __43__PHPTPAssetManager_photoLibraryDidChange___block_invoke;
  v120 = &unk_1E5848D28;
  v122 = &v123;
  v121 = self;
  PLRunWithUnfairLock();
  uint64_t v111 = MEMORY[0x1E4F143A8];
  uint64_t v112 = 3221225472;
  v113 = __43__PHPTPAssetManager_photoLibraryDidChange___block_invoke_2;
  v114 = &unk_1E5848D28;
  v116 = &v129;
  v115 = self;
  p_vendedAssetsLocuint64_t k = &self->_vendedAssetsLock;
  PLRunWithUnfairLock();
  v85 = self;
  if (!v130[5]) {
    goto LABEL_87;
  }
  if (photoLibraryDidChange__completedInitialChangeHandling)
  {
    id v4 = objc_msgSend(v91, "changeDetailsForFetchResult:");
    if ([v4 hasIncrementalChanges]) {
      goto LABEL_7;
    }
    char v5 = [(PHPTPAssetManager *)self _fetchAssetsForIdentifiers:0 includeTrash:0];
    uint64_t v6 = +[PHFetchResultChangeDetails changeDetailsFromFetchResult:v130[5] toFetchResult:v5 changedObjects:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    char v5 = [(PHPTPAssetManager *)self _fetchAssetsForIdentifiers:0 includeTrash:0];
    uint64_t v6 = +[PHFetchResultChangeDetails changeDetailsFromFetchResult:v130[5] toFetchResult:v5 changedObjects:MEMORY[0x1E4F1CBF0]];
    photoLibraryDidChange__completedInitialChangeHandling = 1;
  }

  id v4 = (void *)v6;
LABEL_7:
  if (v4)
  {
    uint64_t v7 = PLPTPGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [v4 insertedObjects];
      uint64_t v9 = [v8 count];
      uint64_t v10 = [v4 changedObjects];
      uint64_t v11 = [v10 count];
      id v12 = [v4 removedObjects];
      uint64_t v13 = [v12 count];
      *(_DWORD *)long long buf = 134218496;
      *(void *)v137 = v9;
      *(_WORD *)&v137[8] = 2048;
      *(void *)&v137[10] = v11;
      *(_WORD *)&v137[18] = 2048;
      *(void *)&v137[20] = v13;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEBUG, "CHANGE NOTIFICATION: Inserted IDs: %lu, Changed IDs: %lu, Deleted IDs: %lu", buf, 0x20u);
    }
    unint64_t v14 = 0x1E4F1C000uLL;
    v86 = [MEMORY[0x1E4F1CA48] array];
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v15 = [v4 insertedObjects];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v107 objects:v140 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v108;
      id obj = v15;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v108 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void **)(*((void *)&v107 + 1) + 8 * i);
          unsigned int v20 = objc_msgSend(v19, "deferredProcessingNeeded", p_vendedAssetsLock);
          uint64_t v21 = PLPTPGetLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            id v22 = [v19 objectID];
            uint64_t v23 = objc_msgSend(v22, "pl_shortURI");
            *(_DWORD *)long long buf = 138543618;
            *(void *)v137 = v23;
            *(_WORD *)&v137[8] = 2048;
            *(void *)&v137[10] = v20;
            _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_DEBUG, "Processing insert for asset (%{public}@) (deferredProcessingNeeded: %lu)", buf, 0x16u);

            unint64_t v14 = 0x1E4F1C000uLL;
          }

          if ((unsigned __int16)(v20 - 1) > 1u)
          {
            [v86 addObject:v19];
          }
          else
          {
            id v24 = PLPTPGetLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              id v25 = [v19 objectID];
              id v26 = objc_msgSend(v25, "pl_shortURI");
              uint64_t v27 = [v19 filename];
              int v28 = [v19 savedAssetType];
              *(_DWORD *)long long buf = 67109890;
              *(_DWORD *)v137 = v20;
              *(_WORD *)&v137[4] = 2114;
              *(void *)&v137[6] = v26;
              *(_WORD *)&v137[14] = 2112;
              *(void *)&v137[16] = v27;
              *(_WORD *)&v137[24] = 2048;
              *(void *)&v137[26] = v28;
              _os_log_impl(&dword_19B043000, v24, OS_LOG_TYPE_DEBUG, "Requires camera deferred processing (%d) for asset (%{public}@) (filename: %@, savedAssetType: %ld)", buf, 0x26u);

              unint64_t v14 = 0x1E4F1C000;
            }

            v139 = v19;
            uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v139 count:1];
            [(PHPTPAssetManager *)v85 _addAssetsNeedingFinalization:v29];
          }
        }
        id v15 = obj;
        uint64_t v16 = [obj countByEnumeratingWithState:&v107 objects:v140 count:16];
      }
      while (v16);
    }

    uint64_t v87 = [*(id *)(v14 + 2632) array];
    uint64_t v83 = [*(id *)(v14 + 2632) array];
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    __int16 v30 = [v4 changedObjects];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v103 objects:v138 count:16];
    if (v31)
    {
      uint64_t v88 = *(void *)v104;
      id v84 = v30;
      do
      {
        uint64_t obja = v31;
        for (uint64_t j = 0; j != obja; ++j)
        {
          if (*(void *)v104 != v88) {
            objc_enumerationMutation(v84);
          }
          long long v33 = *(void **)(*((void *)&v103 + 1) + 8 * j);
          long long v34 = objc_msgSend(v33, "objectID", p_vendedAssetsLock);
          int v35 = [v91 trashedStateChangedForPHAssetOID:v34];

          unsigned __int8 v36 = [v33 objectID];
          int v37 = [v91 deferredProcessingNeededChangedForPHAssetOID:v36];

          v38 = [v33 objectID];
          int v39 = [v91 contentOrThumbnailChangedForPHAssetOID:v38];

          uint64_t v40 = PLPTPGetLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            v41 = [v33 objectID];
            uint64_t v42 = objc_msgSend(v41, "pl_shortURI");
            uint64_t v43 = (void *)v42;
            v44 = @"N";
            if (v37) {
              v45 = @"Y";
            }
            else {
              v45 = @"N";
            }
            *(_DWORD *)long long buf = 138544130;
            *(void *)v137 = v42;
            if (v35) {
              v46 = @"Y";
            }
            else {
              v46 = @"N";
            }
            *(_WORD *)&v137[8] = 2112;
            if (v39) {
              v44 = @"Y";
            }
            *(void *)&v137[10] = v45;
            *(_WORD *)&v137[18] = 2112;
            *(void *)&v137[20] = v46;
            *(_WORD *)&v137[28] = 2112;
            *(void *)&v137[30] = v44;
            _os_log_impl(&dword_19B043000, v40, OS_LOG_TYPE_DEBUG, "Processing change for asset (%{public}@) (deferredProcessingNeededChanged: %@, isTrashedChanged: %@, contentChanged: %@)", buf, 0x2Au);
          }
          if (v35)
          {
            if ([(id)v124[5] containsObject:v33])
            {
              v47 = PLPTPGetLog();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
              {
                v48 = [v33 objectID];
                v49 = objc_msgSend(v48, "pl_shortURI");
                *(_DWORD *)long long buf = 138543362;
                *(void *)v137 = v49;
                _os_log_impl(&dword_19B043000, v47, OS_LOG_TYPE_DEBUG, "Not adding changed asset (%{public}@) to delegate", buf, 0xCu);
              }
            }
            else
            {
              char v50 = [v33 isTrashed];
              v51 = v87;
              if ((v50 & 1) == 0)
              {
                v52 = PLPTPGetLog();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                {
                  v53 = [v33 objectID];
                  v54 = objc_msgSend(v53, "pl_shortURI");
                  *(_DWORD *)long long buf = 138543362;
                  *(void *)v137 = v54;
                  _os_log_impl(&dword_19B043000, v52, OS_LOG_TYPE_DEBUG, "Adding changed asset (%{public}@) to delegate", buf, 0xCu);
                }
                v51 = v86;
              }
              [v51 addObject:v33];
            }
          }
          if (v39)
          {
            if ([(id)v124[5] containsObject:v33])
            {
              if (([v33 isTrashed] & 1) != 0
                || [v33 deferredProcessingNeeded] == 1
                || [v33 deferredProcessingNeeded] == 2)
              {
                v55 = PLPTPGetLog();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
                {
                  v56 = [v33 objectID];
                  id v57 = objc_msgSend(v56, "pl_shortURI");
                  int v58 = [v33 isTrashed];
                  unsigned int v59 = [v33 deferredProcessingNeeded];
                  v60 = @"N";
                  if (v58) {
                    v60 = @"Y";
                  }
                  *(_DWORD *)long long buf = 138543874;
                  *(void *)v137 = v57;
                  *(_WORD *)&v137[8] = 2112;
                  *(void *)&v137[10] = v60;
                  *(_WORD *)&v137[18] = 2048;
                  *(void *)&v137[20] = v59;
                  _os_log_impl(&dword_19B043000, v55, OS_LOG_TYPE_DEBUG, "Not adding changed asset (%{public}@) to delegate (isTrashed: %@, deferredProcessingNeeded: %lu)", buf, 0x20u);
                }
              }
              else
              {
                [v86 addObject:v33];
                uint64_t v97 = MEMORY[0x1E4F143A8];
                uint64_t v98 = 3221225472;
                v99 = __43__PHPTPAssetManager_photoLibraryDidChange___block_invoke_117;
                v100 = &unk_1E5848DF0;
                v101 = v85;
                v102 = v33;
                PLRunWithUnfairLock();
              }
            }
            else
            {
              [v83 addObject:v33];
            }
          }
        }
        __int16 v30 = v84;
        uint64_t v31 = [v84 countByEnumeratingWithState:&v103 objects:v138 count:16];
      }
      while (v31);
    }

    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    v61 = [v4 removedObjects];
    uint64_t v62 = [v61 countByEnumeratingWithState:&v93 objects:v135 count:16];
    if (v62)
    {
      uint64_t v63 = *(void *)v94;
      do
      {
        for (uint64_t k = 0; k != v62; ++k)
        {
          if (*(void *)v94 != v63) {
            objc_enumerationMutation(v61);
          }
          v65 = *(void **)(*((void *)&v93 + 1) + 8 * k);
          v66 = PLPTPGetLog();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
          {
            v67 = [v65 objectID];
            v68 = objc_msgSend(v67, "pl_shortURI");
            *(_DWORD *)long long buf = 138543362;
            *(void *)v137 = v68;
            _os_log_impl(&dword_19B043000, v66, OS_LOG_TYPE_DEBUG, "Processing remove for asset (%{public}@)", buf, 0xCu);
          }
          if ([(id)v124[5] containsObject:v65])
          {
            v69 = PLPTPGetLog();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
            {
              long long v70 = [v65 objectID];
              id v71 = objc_msgSend(v70, "pl_shortURI");
              unsigned int v72 = [v65 deferredProcessingNeeded];
              int v73 = [v65 isTrashed];
              *(_DWORD *)long long buf = 138543874;
              *(void *)v137 = v71;
              id v74 = @"N";
              if (v73) {
                id v74 = @"Y";
              }
              *(_WORD *)&v137[8] = 2048;
              *(void *)&v137[10] = v72;
              *(_WORD *)&v137[18] = 2112;
              *(void *)&v137[20] = v74;
              _os_log_impl(&dword_19B043000, v69, OS_LOG_TYPE_DEBUG, "Not removing deleted asset (%{public}@) from delegate (deferredProcessingNeeded: %lu, isTrashed: %@)", buf, 0x20u);
            }
          }
          else
          {
            id v75 = PLPTPGetLog();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
            {
              long long v76 = [v65 objectID];
              long long v77 = objc_msgSend(v76, "pl_shortURI");
              *(_DWORD *)long long buf = 138543362;
              *(void *)v137 = v77;
              _os_log_impl(&dword_19B043000, v75, OS_LOG_TYPE_DEBUG, "Removing asset (%{public}@) from delegate", buf, 0xCu);
            }
            [v87 addObject:v65];
          }
        }
        uint64_t v62 = [v61 countByEnumeratingWithState:&v93 objects:v135 count:16];
      }
      while (v62);
    }

    if ([v86 count] || objc_msgSend(v83, "count") || objc_msgSend(v87, "count"))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v85->_delegate);
      long long v79 = [v86 valueForKey:@"localIdentifier"];
      v80 = [v87 valueForKey:@"localIdentifier"];
      uint64_t v81 = [v83 valueForKey:@"localIdentifier"];
      [WeakRetained addedPhotoKeys:v79 deletedPhotoKeys:v80 changedPhotoKeys:v81 changePendingPhotoKeys:0];
    }
    id v92 = v4;
    PLRunWithUnfairLock();
  }
LABEL_87:
  _Block_object_dispose(&v123, 8);

  _Block_object_dispose(&v129, 8);
}

void __43__PHPTPAssetManager_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(*(void *)(a1 + 32) + 72)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __43__PHPTPAssetManager_photoLibraryDidChange___block_invoke_2(uint64_t a1)
{
}

uint64_t __43__PHPTPAssetManager_photoLibraryDidChange___block_invoke_117(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) removeObject:*(void *)(a1 + 40)];
}

void __43__PHPTPAssetManager_photoLibraryDidChange___block_invoke_121(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) fetchResultAfterChanges];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;
}

- (id)ptpAssetReaderForAssetHandle:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v54[1] = (id)MEMORY[0x1E4F143A8];
  v54[2] = (id)3221225472;
  v54[3] = __50__PHPTPAssetManager_ptpAssetReaderForAssetHandle___block_invoke;
  v54[4] = &unk_1E5848578;
  v54[5] = self;
  PLRunWithUnfairLock();
  char v5 = [(PHPTPAssetManager *)self _photosAssetForPTPAssetHandle:v4];
  uint64_t v6 = +[PHAssetResource assetResourcesForAsset:v5 includeDerivatives:0 includeMetadata:0 includeAdjustmentOverflowDataBlob:0];
  uint64_t v7 = -[PHPTPAssetManager _resourceOfType:fromResources:](self, "_resourceOfType:fromResources:", [v4 resourceType], v6);
  v52 = [(PHPTPAssetManager *)self _createPTPAssetsFromAsset:v5 photosResources:v6 withConversionSupport:self->_formatConversionManager includeMetadata:0 includeAdjustmentOverflowDataBlob:1];
  id v8 = -[PHPTPAssetManager _ptpAssetWithType:fromPTPAssets:requiresConversion:](self, "_ptpAssetWithType:fromPTPAssets:requiresConversion:", [v4 resourceType], v52, objc_msgSend(v4, "requiresConversion"));
  id v9 = [v7 privateFileURL];
  uint64_t v10 = PLPTPGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v56 = v8;
    _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_DEBUG, "Requesting path provider for ptpAsset: %@", buf, 0xCu);
  }

  uint64_t v11 = [v8 resourceHandle];
  if ([v11 resourceType] != 7)
  {
    int v26 = 0;
    goto LABEL_14;
  }
  char v50 = v9;
  id v12 = [v8 overflowURL];

  if (v12)
  {
    v48 = v7;
    v46 = v6;
    uint64_t v13 = NSString;
    unint64_t v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    v47 = v5;
    uint64_t v16 = [v5 uuid];
    uint64_t v17 = [v8 url];
    uint64_t v18 = [v17 path];
    uint64_t v19 = [v18 lastPathComponent];
    uint64_t v11 = [v13 stringWithFormat:@"%@-%@-reassembled-data-%@", v15, v16, v19];

    unsigned int v20 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v21 = NSTemporaryDirectory();
    id v22 = [v21 stringByAppendingPathComponent:v11];
    uint64_t v23 = [v20 fileURLWithPath:v22 isDirectory:0];

    id v24 = (void *)MEMORY[0x1E4F8CBB8];
    id v25 = [v8 url];
    v54[0] = 0;
    int v26 = [v24 writeReassembleAdjustmentsPropertyListAtURL:v25 toURL:v23 error:v54];
    id v27 = v54[0];

    if (v26)
    {
      id v9 = v23;
    }
    else
    {
      uint64_t v29 = PLPTPGetLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v56 = v27;
        _os_log_impl(&dword_19B043000, v29, OS_LOG_TYPE_ERROR, "Error writing combined adjustment data file (%@)", buf, 0xCu);
      }

      id v9 = 0;
    }
    char v5 = v47;
    uint64_t v7 = v48;

    uint64_t v6 = v46;
LABEL_14:

    if (v9) {
      goto LABEL_15;
    }
LABEL_9:
    int v28 = 0;
    goto LABEL_26;
  }
  int v26 = 0;
  id v9 = v50;
  if (!v50) {
    goto LABEL_9;
  }
LABEL_15:
  [(PHPTPAssetManager *)self _logGreenTeaStatusForPTPAssetHandle:v4 photosAsset:v5];
  if ([v4 requiresConversion])
  {
    uint64_t v30 = [(PHPTPAssetManager *)self _primaryResourceForAsset:v5 fromResources:v6];
    if (v30)
    {
      uint64_t v31 = v30;
      [v9 path];
      long long v32 = v49 = v7;
      [v31 privateFileURL];
      long long v33 = v51 = v9;
      [v33 path];
      v35 = long long v34 = v6;
      int v28 = [(PHPTPAssetManager *)self _ptpAssetReaderForFormatConvertedPTPAsset:v8 ofPhotosAsset:v5 resourcePath:v32 originalResourcePath:v35];

      uint64_t v6 = v34;
      id v9 = v51;

      uint64_t v7 = v49;
      id v53 = v5;
      PLRunWithUnfairLock();
    }
    else
    {
      uint64_t v31 = PLPTPGetLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        [v5 objectID];
        uint64_t v42 = v41 = v7;
        objc_msgSend(v42, "pl_shortURI");
        v44 = id v43 = v9;
        *(_DWORD *)long long buf = 138412290;
        id v56 = v44;
        _os_log_impl(&dword_19B043000, v31, OS_LOG_TYPE_ERROR, "Failed to get the original resource for asset: %@", buf, 0xCu);

        id v9 = v43;
        uint64_t v7 = v41;
      }
      int v28 = 0;
    }
  }
  else
  {
    unsigned __int8 v36 = [PHPTPAssetReader alloc];
    int v37 = v9;
    v38 = v36;
    int v39 = v37;
    uint64_t v31 = [v37 path];
    if (v26) {
      uint64_t v40 = [(PHPTPAssetReader *)v38 initWithTemporaryFileDeletedOnDeallocPath:v31];
    }
    else {
      uint64_t v40 = [(PHPTPAssetReader *)v38 initWithPath:v31];
    }
    int v28 = (void *)v40;
    id v9 = v39;
  }

LABEL_26:

  return v28;
}

uint64_t __50__PHPTPAssetManager_ptpAssetReaderForAssetHandle___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v2 = [v1 downloadedCount] + 1;

  return [v1 setDownloadedCount:v2];
}

uint64_t __50__PHPTPAssetManager_ptpAssetReaderForAssetHandle___block_invoke_107(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v2 = [*(id *)(a1 + 40) kind];

  return [v1 incrementConversionCountForAssetType:v2];
}

- (BOOL)ptpDeletePhotoForAssetHandle:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(PHPTPAssetManager *)self _photosAssetForPTPAssetHandle:v4];
  uint64_t v6 = [v5 ptpProperties];
  uint64_t v7 = [v6 ptpTrashedState];

  id v8 = PLPTPGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [v4 resourceType];
    uint64_t v10 = [v5 objectID];
    uint64_t v11 = objc_msgSend(v10, "pl_shortURI");
    *(_DWORD *)long long buf = 134218242;
    uint64_t v29 = v9;
    __int16 v30 = 2114;
    uint64_t v31 = v11;
    _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEBUG, "Attempting to delete resource (%lu) for asset: %{public}@", buf, 0x16u);
  }
  id v12 = [(PHPTPAssetManager *)self photoLibrary];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __50__PHPTPAssetManager_ptpDeletePhotoForAssetHandle___block_invoke;
  v24[3] = &unk_1E5847910;
  id v13 = v4;
  id v25 = v13;
  id v26 = v5;
  uint64_t v27 = v7;
  id v23 = 0;
  id v14 = v5;
  char v15 = [v12 performChangesAndWait:v24 error:&v23];
  id v16 = v23;

  uint64_t v17 = [(PHPTPAssetManager *)self _photosAssetForPTPAssetHandle:v13];
  if (+[PHPTPUtilities shouldExpungeAsset:v17])
  {
    uint64_t v18 = PLPTPGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = [v17 objectID];
      unsigned int v20 = objc_msgSend(v19, "pl_shortURI");
      uint64_t v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "resourceType"));
      *(_DWORD *)long long buf = 138543618;
      uint64_t v29 = (uint64_t)v20;
      __int16 v30 = 2112;
      uint64_t v31 = v21;
      _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_INFO, "Expunge asset %{public}@ for asset resource: %@", buf, 0x16u);
    }
    [(PHPTPAssetManager *)self _expungeAsset:v17 withReason:@"PTP client deleted the asset"];
  }

  return v15;
}

void __50__PHPTPAssetManager_ptpDeletePhotoForAssetHandle___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int64_t v2 = +[PHPTPAsset ptpTrashedStateForResourceType:](PHPTPAsset, "ptpTrashedStateForResourceType:", [*(id *)(a1 + 32) resourceType]);
  uint64_t v3 = +[PHAssetChangeRequest changeRequestForAsset:*(void *)(a1 + 40)];
  [v3 setPtpTrashedState:*(void *)(a1 + 48) | v2];
  id v4 = PLPTPGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    int v6 = 134218240;
    uint64_t v7 = v5;
    __int16 v8 = 2048;
    int64_t v9 = v2;
    _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_DEFAULT, "Updated asset trashed state (old: 0x%llx, new: 0x%llx)", (uint8_t *)&v6, 0x16u);
  }
}

- (BOOL)ptpCanDeleteFiles
{
  int64_t v2 = [(PHPTPAssetManager *)self photoLibrary];
  char v3 = [v2 isCloudPhotoLibraryEnabled] ^ 1;

  return v3;
}

- (id)ptpImagePropertiesForAssetHandle:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (-[PHPTPAssetManager _isThumbnailSupportedForResourceType:](self, "_isThumbnailSupportedForResourceType:", [v4 resourceType]))
  {
    uint64_t v5 = [(PHPTPAssetManager *)self _photosAssetForPTPAssetHandle:v4];
    int v6 = +[PHAssetResource assetResourcesForAsset:v5 includeDerivatives:0 includeMetadata:0 includeAdjustmentOverflowDataBlob:0];
    uint64_t v7 = -[PHPTPAssetManager _resourceOfType:fromResources:](self, "_resourceOfType:fromResources:", [v4 resourceType], v6);
    id v8 = objc_alloc(MEMORY[0x1E4F8CC48]);
    int64_t v9 = [v7 privateFileURL];
    uint64_t v10 = (void *)[v8 initWithMediaURL:v9 detail:2 timeZoneLookup:0 shouldCache:0];

    uint64_t v11 = [v10 ptpMediaMetadata];
  }
  else
  {
    id v12 = PLPTPGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 134217984;
      uint64_t v15 = [v4 resourceType];
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEBUG, "Resource type %ld doe snot support image properties", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v11 = 0;
  }

  return v11;
}

- (id)ptpThumbnailForAssetHandle:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"PHPTPAssetManager.m", 270, @"Invalid parameter not satisfying: %@", @"[ptpAssetHandle isKindOfClass:[PHPTPAssetHandle class]]" object file lineNumber description];
  }
  BOOL v11 = -[PHPTPAssetManager _isThumbnailSupportedForResourceType:](self, "_isThumbnailSupportedForResourceType:", [v10 resourceType]);
  id v12 = PLPTPGetLog();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v13)
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEBUG, "Requesting thumbnail for asset handle: %@", (uint8_t *)&buf, 0xCu);
    }

    if (width >= height) {
      double height = width;
    }
    id v12 = +[PHImageManager defaultManager];
    int v14 = [(PHPTPAssetManager *)self _photosAssetForPTPAssetHandle:v10];
    if (!v14)
    {
      uint64_t v17 = 0;
LABEL_42:

      goto LABEL_43;
    }
    if ([v10 resourceType] == 2 && objc_msgSend(v14, "hasAdjustments"))
    {
      *(float *)&double v15 = a5;
      -[PHPTPAssetManager _ptpThumbnailForOriginalVideoAsset:size:compressionQuality:](self, "_ptpThumbnailForOriginalVideoAsset:size:compressionQuality:", v14, height, height, v15);
      uint64_t v16 = (__CFData *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v18 = objc_alloc_init(PHImageRequestOptions);
      -[PHImageRequestOptions setVersion:](v18, "setVersion:", -[PHPTPAssetManager _imageVersionForAsset:resourceType:](self, "_imageVersionForAsset:resourceType:", v14, [v10 resourceType]));
      [(PHImageRequestOptions *)v18 setSynchronous:1];
      [(PHImageRequestOptions *)v18 setResizeMode:1];
      [(PHImageRequestOptions *)v18 setDeliveryMode:1];
      [(PHImageRequestOptions *)v18 setNetworkAccessAllowed:0];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v58 = 0x2020000000;
      uint64_t v59 = 0;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __72__PHPTPAssetManager_ptpThumbnailForAssetHandle_size_compressionQuality___block_invoke;
      v42[3] = &unk_1E5844A28;
      v42[4] = self;
      id v19 = v10;
      id v43 = v19;
      id v20 = v14;
      id v44 = v20;
      double v47 = height;
      double v48 = height;
      uint64_t v21 = v18;
      v45 = v21;
      p_long long buf = &buf;
      -[NSObject requestNewCGImageForAsset:targetSize:contentMode:options:resultHandler:](v12, "requestNewCGImageForAsset:targetSize:contentMode:options:resultHandler:", v20, 0, v21, v42, height, height);
      if (*(void *)(*((void *)&buf + 1) + 24))
      {
        uint64_t v16 = [MEMORY[0x1E4F1CA58] data];
        id v22 = [(id)*MEMORY[0x1E4F44410] identifier];
        id v23 = CGImageDestinationCreateWithData(v16, v22, 1uLL, 0);

        if (v23)
        {
          if ([v19 orientation] == 1)
          {
            CFDictionaryRef v24 = 0;
          }
          else
          {
            v55[0] = *MEMORY[0x1E4F2F428];
            uint64_t v40 = [NSNumber numberWithDouble:height];
            uint64_t v30 = *MEMORY[0x1E4F2FE48];
            v56[0] = v40;
            v56[1] = MEMORY[0x1E4F1CC38];
            uint64_t v31 = *MEMORY[0x1E4F2FCA0];
            v55[1] = v30;
            v55[2] = v31;
            uint64_t v32 = NSNumber;
            [v19 orientation];
            long long v33 = [v32 numberWithInteger:PFOrientationInverse()];
            v56[2] = v33;
            CFDictionaryRef v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:3];
          }
          CGImageDestinationAddImage(v23, *(CGImageRef *)(*((void *)&buf + 1) + 24), v24);
          if (!CGImageDestinationFinalize(v23))
          {
            long long v34 = PLPTPGetLog();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              v41 = [v20 objectID];
              int v35 = objc_msgSend(v41, "pl_shortURI");
              uint64_t v36 = [v19 resourceType];
              *(_DWORD *)v49 = 134218498;
              char v50 = v23;
              __int16 v51 = 2114;
              v52 = v35;
              __int16 v53 = 2048;
              uint64_t v54 = v36;
              _os_log_impl(&dword_19B043000, v34, OS_LOG_TYPE_ERROR, "Failed to finalize CGImageDestinationRef (%p) for asset %{public}@ and resource %ld", v49, 0x20u);
            }
          }
          CFRelease(v23);
          CGImageRelease(*(CGImageRef *)(*((void *)&buf + 1) + 24));
          char v29 = 1;
        }
        else
        {
          id v26 = PLPTPGetLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            uint64_t v27 = [v20 objectID];
            objc_msgSend(v27, "pl_shortURI");
            int v28 = (CGImageDestination *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v49 = 138543362;
            char v50 = v28;
            _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_ERROR, "Failed to create a CGImageDestinationRef for asset %{public}@", v49, 0xCu);
          }
          CGImageRelease(*(CGImageRef *)(*((void *)&buf + 1) + 24));
          char v29 = 0;
          CFDictionaryRef v24 = v16;
          uint64_t v16 = 0;
        }
      }
      else
      {
        if (-[PHPTPAssetManager _isPhotoAssetResourceType:](self, "_isPhotoAssetResourceType:", [v19 resourceType]))
        {
          uint64_t v16 = 0;
        }
        else
        {
          *(float *)&double v25 = a5;
          -[PHPTPAssetManager _ptpThumbnailForOriginalVideoAsset:size:compressionQuality:](self, "_ptpThumbnailForOriginalVideoAsset:size:compressionQuality:", v20, height, height, v25);
          uint64_t v16 = (__CFData *)objc_claimAutoreleasedReturnValue();
        }
        char v29 = 1;
      }

      _Block_object_dispose(&buf, 8);
      if ((v29 & 1) == 0)
      {
        uint64_t v17 = 0;
LABEL_41:

        goto LABEL_42;
      }
    }
    if (![(__CFData *)v16 length])
    {

      int v37 = PLPTPGetLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v10;
        _os_log_impl(&dword_19B043000, v37, OS_LOG_TYPE_ERROR, "No thumbnail for asset handle: %@", (uint8_t *)&buf, 0xCu);
      }

      uint64_t v16 = 0;
    }
    uint64_t v16 = v16;
    uint64_t v17 = v16;
    goto LABEL_41;
  }
  if (v13)
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEBUG, "No thumbnail for asset handle: %@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v17 = 0;
LABEL_43:

  return v17;
}

void __72__PHPTPAssetManager_ptpThumbnailForAssetHandle_size_compressionQuality___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a2
    && objc_msgSend(*(id *)(a1 + 32), "_isPhotoAssetResourceType:", objc_msgSend(*(id *)(a1 + 40), "resourceType")))
  {
    id v4 = PLPTPGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [*(id *)(a1 + 48) objectID];
      int v6 = objc_msgSend(v5, "pl_shortURI");
      uint64_t v7 = DCIM_NSStringFromCGSize();
      uint64_t v8 = *(void *)(a1 + 56);
      int v9 = 138543874;
      id v10 = v6;
      __int16 v11 = 2114;
      id v12 = v7;
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_ERROR, "Image manager did not return a thumbnail for asset %{public}@ for size %{public}@ with options %{public}@", (uint8_t *)&v9, 0x20u);
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a2;
}

- (void)ptpEnumerateAssetsWithLocalIdentifiers:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__PHPTPAssetManager_ptpEnumerateAssetsWithLocalIdentifiers_usingBlock___block_invoke;
  v9[3] = &unk_1E5844A00;
  v9[4] = self;
  id v10 = v6;
  id v7 = v6;
  id v8 = [(PHPTPAssetManager *)self _enumerateAssetsWithLocalIdentifiers:a3 usingBlock:v9];
}

void __71__PHPTPAssetManager_ptpEnumerateAssetsWithLocalIdentifiers_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = v13;
  id v9 = v7;
  if (!v13)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v8 = 0;
  }
  id v10 = [*(id *)(a1 + 32) _createPTPAssetsFromAsset:v8 photosResources:v9 withConversionSupport:*(void *)(*(void *)(a1 + 32) + 48) includeMetadata:0 includeAdjustmentOverflowDataBlob:1];
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v10 copyItems:1];
  (*(void (**)(uint64_t, void *, uint64_t))(v11 + 16))(v11, v12, a4);
}

- (void)ptpEnumerateAllAssetsUsingBlock:(id)a3
{
  id v4 = a3;
  [(PHPTPAssetManager *)self _ensureDeferredRenderingIsComplete];
  uint64_t v5 = objc_alloc_init(PHPTPDebugAnalytics);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__PHPTPAssetManager_ptpEnumerateAllAssetsUsingBlock___block_invoke;
  void v10[3] = &unk_1E58449D8;
  uint64_t v11 = v5;
  id v12 = v4;
  v10[4] = self;
  id v6 = v5;
  id v7 = v4;
  id v8 = [(PHPTPAssetManager *)self _enumerateAssetsWithLocalIdentifiers:0 usingBlock:v10];
  [(PHPTPDebugAnalytics *)v6 reportResourceCounts];
  id v9 = v8;
  PLRunWithUnfairLock();
}

void __53__PHPTPAssetManager_ptpEnumerateAllAssetsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = PLPTPGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = [v8 count];
    uint64_t v11 = [v7 objectID];
    id v12 = objc_msgSend(v11, "pl_shortURI");
    *(_DWORD *)long long buf = 134218498;
    uint64_t v23 = v10;
    __int16 v24 = 2112;
    double v25 = v12;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_DEBUG, "Processing %lu resources for asset %@: %@", buf, 0x20u);
  }
  if (!v7) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  id v13 = [v7 ptpProperties];
  int v14 = [v13 deferredProcessingNeeded];

  if (v14)
  {
    uint64_t v15 = PLPTPGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = [v7 uuid];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v23 = (uint64_t)v16;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEBUG, "Found asset requiring finalization (uuid: %@)", buf, 0xCu);
    }
    uint64_t v17 = *(void **)(a1 + 32);
    id v21 = v7;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    [v17 _addAssetsNeedingFinalization:v18];
  }
  else
  {
    uint64_t v18 = [*(id *)(a1 + 32) _createPTPAssetsFromAsset:v7 photosResources:v8 withConversionSupport:*(void *)(*(void *)(a1 + 32) + 48) includeMetadata:0 includeAdjustmentOverflowDataBlob:1 debugAnalytics:*(void *)(a1 + 40)];
    uint64_t v19 = *(void *)(a1 + 48);
    id v20 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v18 copyItems:1];
    (*(void (**)(uint64_t, void *, uint64_t))(v19 + 16))(v19, v20, a4);

    [*(id *)(a1 + 40) countResourceTypes:v18];
  }
}

void __53__PHPTPAssetManager_ptpEnumerateAllAssetsUsingBlock___block_invoke_75(uint64_t a1)
{
}

- (void)setHostCharacteristics:(id)a3
{
  char v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 objectForKeyedSubscript:@"PLPTPHostCharacteristicsKeyMake"];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F8CF38]];

  id v7 = [v4 objectForKeyedSubscript:@"PLPTPHostCharacteristicsKeyOS"];
  [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F8CF10]];

  id v8 = [v4 objectForKeyedSubscript:@"PLPTPHostCharacteristicsKeyOSVersion"];
  [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F8CF58]];

  id v9 = [v4 objectForKeyedSubscript:@"PLPTPHostCharacteristicsKeyTransport"];

  [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F8CF30]];
  [v5 setObject:@"YES" forKeyedSubscript:*MEMORY[0x1E4F8CEE8]];
  id v10 = v5;
  PLRunWithUnfairLock();
}

uint64_t __44__PHPTPAssetManager_setHostCharacteristics___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) updateWithPlatformInformation:*(void *)(a1 + 40)];
}

- (PFMediaCapabilities)peerMediaCapabilities
{
  return [(PHPTPFormatConversionManager *)self->_formatConversionManager peerMediaCapabilities];
}

- (void)setPeerMediaCapabilities:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLPTPGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, "Set peer media capabilities: %@", buf, 0xCu);
  }

  [(PHPTPFormatConversionManager *)self->_formatConversionManager setPeerMediaCapabilities:v4];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  id v8 = v4;
  id v6 = v4;
  PLRunWithUnfairLock();
  self->_sortAscending = objc_msgSend(v6, "sortSourceEnumerationAscending", v7, 3221225472, __46__PHPTPAssetManager_setPeerMediaCapabilities___block_invoke, &unk_1E5848DF0, self);
}

void __46__PHPTPAssetManager_setPeerMediaCapabilities___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  id v2 = [*(id *)(a1 + 40) platformInformation];
  [v1 updateWithPlatformInformation:v2];
}

- (void)setDelegate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (PFCameraViewfinderSessionWatcher *)a3;
  id v5 = PLPTPGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138412290;
    uint64_t v17 = v4;
    _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, "setDelegate: %@", (uint8_t *)&v16, 0xCu);
  }

  id v6 = objc_storeWeak((id *)&self->_delegate, v4);
  if (v4)
  {
    uint64_t v7 = PLPTPGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      cameraWatcher = self->_cameraWatcher;
      int v16 = 134217984;
      uint64_t v17 = cameraWatcher;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEBUG, "Starting camera viewfinder watching (%p)", (uint8_t *)&v16, 0xCu);
    }

    [(PFCameraViewfinderSessionWatcher *)self->_cameraWatcher startWatching];
    [(PHPTPAssetManager *)self _startAnalyticsCollection];
    if (objc_opt_respondsToSelector()) {
      [(PFCameraViewfinderSessionWatcher *)v4 libraryDidBecomeAvailable];
    }
  }
  else
  {
    [(PHPhotoLibrary *)self->_photoLibrary unregisterChangeObserver:self];
    id v9 = [(PHPTPAssetManager *)self photoLibrary];
    id v10 = [v9 photoLibraryBundle];
    uint64_t v11 = [v10 assetsdClient];
    id v12 = [v11 notificationClient];
    [v12 asyncNotifyEndOfInterestForUnrenderedCinematicVideoItems];

    [(PHPTPAssetManager *)self _stopAnalyticsCollectionAndReport];
    id v13 = PLPTPGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v14 = self->_cameraWatcher;
      int v16 = 134217984;
      uint64_t v17 = v14;
      _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEBUG, "Stopping camera viewfinder watching (%p)", (uint8_t *)&v16, 0xCu);
    }

    [(PFCameraViewfinderSessionWatcher *)self->_cameraWatcher stopWatching];
    uint64_t v15 = self->_cameraWatcher;
    self->_cameraWatcher = 0;
  }
}

- (void)dealloc
{
  [(PHPTPFormatConversionManager *)self->_formatConversionManager invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PHPTPAssetManager;
  [(PHPTPAssetManager *)&v3 dealloc];
}

- (PHPTPAssetManager)initWithLibrary:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PHPTPAssetManager;
  id v6 = [(PHPTPAssetManager *)&v24 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    v7->_libraryAvailabilityStatus = 2;
    id v8 = (NSFileManager *)objc_alloc_init(MEMORY[0x1E4F28CB8]);
    fileManager = v7->_fileManager;
    v7->_fileManager = v8;

    id v10 = objc_alloc_init(PHPTPFormatConversionManager);
    formatConversionManager = v7->_formatConversionManager;
    v7->_formatConversionManager = v10;

    v7->_sortAscending = 1;
    if (MKBDeviceUnlockedSinceBoot() != 1) {
      [(PHPTPAssetManager *)v7 _registerForFirstUnlockNotification];
    }
    v7->_vendedAssetsLock._os_unfair_lock_opaque = 0;
    v7->_analyticsDataLock._os_unfair_lock_opaque = 0;
    dispatch_group_t v12 = dispatch_group_create();
    analyticsAsyncDataGroup = v7->_analyticsAsyncDataGroup;
    v7->_analyticsAsyncDataGroup = (OS_dispatch_group *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    finalizationRequestLock_deferredAssets = v7->_finalizationRequestLock_deferredAssets;
    v7->_finalizationRequestLock_deferredAssets = (NSMutableArray *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    finalizationRequestLock_inflightAssetsRequiringFinalization = v7->_finalizationRequestLock_inflightAssetsRequiringFinalization;
    v7->_finalizationRequestLock_inflightAssetsRequiringFinalization = (NSMutableArray *)v16;

    uint64_t v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.photos.PHPTPAssetManager.finalizationrequestqueue", v19);
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F8CBE8]) initWithDispatchQueue:v20 delegate:v7];
    cameraWatcher = v7->_cameraWatcher;
    v7->_cameraWatcher = (PFCameraViewfinderSessionWatcher *)v21;

    v7->_finalizationRequestLock._os_unfair_lock_opaque = 0;
    v7->_provideDiagnosticFile = [(id)objc_opt_class() _shouldIncludeDiagnosticFile];
    [(PHPhotoLibrary *)v7->_photoLibrary registerChangeObserver:v7];
    [(PHPhotoLibrary *)v7->_photoLibrary registerAvailabilityObserver:v7];
  }
  return v7;
}

- (PHPTPAssetManager)init
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [PHPhotoLibrary alloc];
  id v4 = +[PHPhotoLibrary systemPhotoLibraryURL];
  id v5 = [(PHPhotoLibrary *)v3 initWithPhotoLibraryURL:v4];

  id v11 = 0;
  BOOL v6 = [(PHPhotoLibrary *)v5 openAndWaitWithUpgrade:0 error:&v11];
  id v7 = v11;
  if (v6)
  {
    self = [(PHPTPAssetManager *)self initWithLibrary:v5];
    id v8 = self;
  }
  else
  {
    id v9 = PLPTPGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "Failed to open photo library (ERROR: %@)", buf, 0xCu);
    }

    id v8 = 0;
  }

  return v8;
}

+ (BOOL)_isPrimaryAssetResourceType:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 > 0x14) {
    goto LABEL_9;
  }
  if (((1 << a3) & 0x31FF8) == 0)
  {
    if (((1 << a3) & 0x18E000) != 0)
    {
      BOOL v6 = PLPTPGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 134217984;
        int64_t v10 = a3;
        _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_DEBUG, "Unsupported resource type %ld", buf, 0xCu);
      }

      return 0;
    }
    if (((1 << a3) & 6) != 0) {
      return 1;
    }
LABEL_9:
    if ((unint64_t)(a3 - 108) > 5 || ((1 << (a3 - 108)) & 0x25) == 0)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PHPTPAssetManager.m", 1011, @"Unhandled resource type (%lu) in %s", a3, "+[PHPTPAssetManager _isPrimaryAssetResourceType:]");
    }
  }
  return 0;
}

+ (BOOL)_shouldIncludeDiagnosticFile
{
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"PLCameraProvideDiagnosticFile", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat))
  {
    BOOL v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v2 = 1;
  }
  return !v2;
}

@end