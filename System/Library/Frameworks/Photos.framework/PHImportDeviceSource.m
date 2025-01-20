@interface PHImportDeviceSource
- (BOOL)canAutolaunch;
- (BOOL)canDeleteContent;
- (BOOL)canEject;
- (BOOL)canReference;
- (BOOL)containsSupportedMedia:(id *)a3;
- (BOOL)ejectAfterDelete;
- (BOOL)isAppleDevice;
- (BOOL)isAvailable;
- (BOOL)isCamera;
- (BOOL)isConnectedDevice;
- (BOOL)isDeleting;
- (BOOL)isEjecting;
- (BOOL)isOptimizedCPLStorage;
- (CGImage)icon;
- (ICCameraDevice)camera;
- (ICCameraDeviceRemovedItemsCoalescer)removalCoalescer;
- (NSArray)avchdAssets;
- (NSMutableDictionary)assetByCameraFile;
- (NSMutableSet)removedCameraFiles;
- (NSProgress)deleteProgress;
- (OS_dispatch_queue)assetByCameraFileAccess;
- (OS_dispatch_queue)deleteEjectQueue;
- (PHImportDeviceSource)initWithDevice:(id)a3;
- (id)assetsByProcessingItem:(id)a3;
- (id)cameraFilesForAssets:(id)a3;
- (id)deleteImportAssets:(id)a3 isConfirmed:(BOOL)a4 atEnd:(id)a5;
- (id)iconSymbolName;
- (id)importAssetForCameraFile:(id)a3 create:(BOOL)a4;
- (id)name;
- (id)path;
- (id)productKind;
- (id)uuid;
- (id)volumePath;
- (void)_removeCameraFiles:(id)a3;
- (void)beginProcessingWithCompletion:(id)a3;
- (void)cameraDevice:(id)a3 didAddItems:(id)a4;
- (void)cameraDevice:(id)a3 didRemoveItems:(id)a4;
- (void)cameraDevice:(id)a3 setAccessState:(unsigned __int8)a4;
- (void)cameraDeviceDidChangeCapability:(id)a3;
- (void)cameraDeviceDidEnableAccessRestriction:(id)a3;
- (void)cameraDeviceDidRemoveAccessRestriction:(id)a3;
- (void)deviceDidBecomeReady:(id)a3;
- (void)deviceDidBecomeReadyWithCompleteContentCatalog:(id)a3;
- (void)deviceFinishedEnumeratingItems:(id)a3;
- (void)didRemoveDevice:(id)a3;
- (void)eject;
- (void)fetchMetadataForRequest:(id)a3 importAsset:(id)a4 completion:(id)a5;
- (void)fetchMetadataUsingRequest:(id)a3 withCompletion:(id)a4;
- (void)fetchThumbnailDataUsingRequest:(id)a3 withCompletion:(id)a4;
- (void)removeAssetForCameraFile:(id)a3;
- (void)sendNextMetadataRequest;
- (void)sendNextThumbnailRequest;
- (void)setAssetByCameraFile:(id)a3;
- (void)setAssetByCameraFileAccess:(id)a3;
- (void)setAvchdAssets:(id)a3;
- (void)setCamera:(id)a3;
- (void)setDeleteEjectQueue:(id)a3;
- (void)setDeleteProgress:(id)a3;
- (void)setEjectAfterDelete:(BOOL)a3;
- (void)setIsEjecting:(BOOL)a3;
- (void)setRemovalCoalescer:(id)a3;
- (void)setRemovedCameraFiles:(id)a3;
@end

@implementation PHImportDeviceSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_avchdAssets, 0);
  objc_storeStrong((id *)&self->_deleteProgress, 0);
  objc_storeStrong((id *)&self->_assetByCameraFileAccess, 0);
  objc_storeStrong((id *)&self->_assetByCameraFile, 0);
  objc_storeStrong((id *)&self->_removedCameraFiles, 0);
  objc_storeStrong((id *)&self->_removalCoalescer, 0);
  objc_storeStrong((id *)&self->_deleteEjectQueue, 0);
  objc_storeStrong((id *)&self->_assetDataRequestQueue, 0);
  objc_storeStrong((id *)&self->_assetDataRequestsByCameraItem, 0);
  objc_storeStrong((id *)&self->_assetThumbnailHighPriorityRequests, 0);
  objc_storeStrong((id *)&self->_assetMetadataRequests, 0);

  objc_storeStrong((id *)&self->_assetThumbnailRequests, 0);
}

- (void)setCamera:(id)a3
{
}

- (ICCameraDevice)camera
{
  return (ICCameraDevice *)objc_getProperty(self, a2, 448, 1);
}

- (void)setAvchdAssets:(id)a3
{
}

- (NSArray)avchdAssets
{
  return self->_avchdAssets;
}

- (void)setDeleteProgress:(id)a3
{
}

- (NSProgress)deleteProgress
{
  return self->_deleteProgress;
}

- (void)setAssetByCameraFileAccess:(id)a3
{
}

- (OS_dispatch_queue)assetByCameraFileAccess
{
  return self->_assetByCameraFileAccess;
}

- (void)setAssetByCameraFile:(id)a3
{
}

- (NSMutableDictionary)assetByCameraFile
{
  return self->_assetByCameraFile;
}

- (void)setEjectAfterDelete:(BOOL)a3
{
  self->_ejectAfterDelete = a3;
}

- (BOOL)ejectAfterDelete
{
  return self->_ejectAfterDelete;
}

- (void)setIsEjecting:(BOOL)a3
{
  self->_isEjecting = a3;
}

- (BOOL)isEjecting
{
  return self->_isEjecting;
}

- (void)setRemovedCameraFiles:(id)a3
{
}

- (NSMutableSet)removedCameraFiles
{
  return self->_removedCameraFiles;
}

- (void)setRemovalCoalescer:(id)a3
{
}

- (ICCameraDeviceRemovedItemsCoalescer)removalCoalescer
{
  return self->_removalCoalescer;
}

- (void)setDeleteEjectQueue:(id)a3
{
}

- (OS_dispatch_queue)deleteEjectQueue
{
  return self->_deleteEjectQueue;
}

- (void)_removeCameraFiles:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v6 = [(PHImportDeviceSource *)self deleteEjectQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PHImportDeviceSource__removeCameraFiles___block_invoke;
  block[3] = &unk_1E5848EC0;
  block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

uint64_t __43__PHImportDeviceSource__removeCameraFiles___block_invoke(id *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  v3 = [a1[5] valueForKey:@"PHImportFileUUID"];
  [v2 addSourceFileIdentifiersForRemovedFiles:v3];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a1[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = objc_msgSend(a1[4], "importAssetForCameraFile:create:", v9, 0, (void)v14);
          if (v10)
          {
            [a1[6] addObject:v10];
            [a1[4] removeAssetForCameraFile:v9];
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  if ([a1[6] count])
  {
    id v11 = [a1[4] removalCoalescer];
    [v11 coalesceItems:a1[6]];
  }
  uint64_t result = objc_msgSend(a1[4], "isDeleting", (void)v14);
  if ((result & 1) == 0)
  {
    uint64_t result = [a1[4] ejectAfterDelete];
    if (result)
    {
      v13 = [a1[4] camera];
      [v13 requestEject];

      return [a1[4] setIsEjecting:1];
    }
  }
  return result;
}

- (void)deviceFinishedEnumeratingItems:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = PLImportGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = [v3 name];
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2080;
    uint64_t v9 = "-[PHImportDeviceSource deviceFinishedEnumeratingItems:]";
    _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_DEBUG, "%@ [%s]", (uint8_t *)&v6, 0x16u);
  }
}

- (void)cameraDeviceDidRemoveAccessRestriction:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = PLImportGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [(PHImportDeviceSource *)self camera];
    int v6 = [v5 name];
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_INFO, "%@ state chaged to unlocked", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = [(PHImportDeviceSource *)self camera];
  [(PHImportDeviceSource *)self cameraDevice:v7 setAccessState:2];
}

- (void)cameraDeviceDidEnableAccessRestriction:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = PLImportGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [(PHImportDeviceSource *)self camera];
    int v6 = [v5 name];
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_INFO, "%@ state changed to passcode locked", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = [(PHImportDeviceSource *)self camera];
  [(PHImportDeviceSource *)self cameraDevice:v7 setAccessState:1];
}

- (void)cameraDeviceDidChangeCapability:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__PHImportDeviceSource_cameraDeviceDidChangeCapability___block_invoke;
  v3[3] = &unk_1E5845BD0;
  v3[4] = self;
  [(PHImportSource *)self notifyObserversUsingBlock:v3];
}

uint64_t __56__PHImportDeviceSource_cameraDeviceDidChangeCapability___block_invoke(uint64_t a1, void *a2)
{
  return [a2 capabilitiesDidChangeForImportSource:*(void *)(a1 + 32)];
}

- (void)cameraDevice:(id)a3 didRemoveItems:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  int v8 = PLImportGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [v7 count];
    uint64_t v10 = &stru_1EEAC1950;
    if ((unint64_t)[v7 count] <= 1) {
      id v11 = &stru_1EEAC1950;
    }
    else {
      id v11 = @"s";
    }
    uint64_t v12 = [v7 count];
    if (v12)
    {
      v13 = NSString;
      id v4 = [v7 valueForKey:@"name"];
      uint64_t v5 = [v4 componentsJoinedByString:@", "];
      uint64_t v10 = [v13 stringWithFormat:@" [%@]", v5];
    }
    *(_DWORD *)buf = 136315906;
    v18 = "-[PHImportDeviceSource cameraDevice:didRemoveItems:]";
    __int16 v19 = 2048;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    v22 = v11;
    __int16 v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEBUG, "%s - %lu asset%@ were removed%@", buf, 0x2Au);
    if (v12)
    {
    }
  }

  if ([v7 count])
  {
    [(PHImportDeviceSource *)self _removeCameraFiles:v7];
  }
  else
  {
    long long v14 = PLImportGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      long long v15 = [(PHImportDeviceSource *)self camera];
      long long v16 = [v15 name];
      *(_DWORD *)buf = 138412290;
      v18 = v16;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_DEBUG, "ImageCapture told us that the device '%@' removed no items ... weird!", buf, 0xCu);
    }
  }
}

- (void)cameraDevice:(id)a3 didAddItems:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v6, "addObject:", v12, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [(PHImportSource *)self addItems:v6];
}

- (void)deviceDidBecomeReady:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__PHImportDeviceSource_deviceDidBecomeReady___block_invoke;
  v3[3] = &unk_1E5845BD0;
  v3[4] = self;
  [(PHImportSource *)self notifyObserversUsingBlock:v3];
}

uint64_t __45__PHImportDeviceSource_deviceDidBecomeReady___block_invoke(uint64_t a1, void *a2)
{
  return [a2 capabilitiesDidChangeForImportSource:*(void *)(a1 + 32)];
}

- (void)didRemoveDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(PHImportDeviceSource *)self camera];

  if (v5 == v4)
  {
    int v6 = [(PHImportSource *)self progress];
    [v6 cancel];

    id v8 = [(PHImportDeviceSource *)self camera];
    id v7 = [v8 mediaFiles];
    [(PHImportDeviceSource *)self _removeCameraFiles:v7];
  }
}

- (void)deviceDidBecomeReadyWithCompleteContentCatalog:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLImportGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [v4 name];
    int v7 = 136315394;
    id v8 = "-[PHImportDeviceSource deviceDidBecomeReadyWithCompleteContentCatalog:]";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, "%s - %@", (uint8_t *)&v7, 0x16u);
  }
  [(PHImportSource *)self stopAssetLoading];
}

- (BOOL)containsSupportedMedia:(id *)a3
{
  return 1;
}

- (BOOL)canReference
{
  return 0;
}

- (BOOL)isAvailable
{
  id v3 = +[PHImportController sharedInstance];
  LOBYTE(self) = [v3 sourceIsConnected:self];

  return (char)self;
}

- (void)eject
{
  id v3 = [(PHImportDeviceSource *)self deleteEjectQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__PHImportDeviceSource_eject__block_invoke;
  block[3] = &unk_1E5848578;
  block[4] = self;
  dispatch_async(v3, block);
}

void __29__PHImportDeviceSource_eject__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEjecting] & 1) == 0)
  {
    int v2 = [*(id *)(a1 + 32) isDeleting];
    id v3 = *(void **)(a1 + 32);
    if (v2)
    {
      [v3 setEjectAfterDelete:1];
    }
    else
    {
      id v4 = [v3 camera];
      [v4 requestEject];
    }
  }
}

- (BOOL)isDeleting
{
  int v2 = [(PHImportDeviceSource *)self deleteProgress];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)volumePath
{
  return 0;
}

- (BOOL)isConnectedDevice
{
  return 1;
}

- (BOOL)canEject
{
  int v2 = [(ICCameraDevice *)self->_camera capabilities];
  char v3 = [v2 containsObject:*MEMORY[0x1E4F2F300]];

  return v3;
}

- (BOOL)canAutolaunch
{
  return 1;
}

- (BOOL)isOptimizedCPLStorage
{
  return [(ICCameraDevice *)self->_camera iCloudPhotosOptimizeStorageState] == 1;
}

- (BOOL)canDeleteContent
{
  return ![(ICCameraDevice *)self->_camera isLocked];
}

- (BOOL)isAppleDevice
{
  int v2 = [(PHImportDeviceSource *)self camera];
  char v3 = [v2 isAppleDevice];

  return v3;
}

- (id)iconSymbolName
{
  char v3 = [(PHImportDeviceSource *)self camera];
  id v4 = [v3 systemSymbolName];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    int v7 = [(PHImportDeviceSource *)self productKind];
    id v6 = [v7 lowercaseString];
  }

  return v6;
}

- (CGImage)icon
{
  int v2 = [(PHImportDeviceSource *)self camera];
  char v3 = (CGImage *)[v2 icon];

  return v3;
}

- (id)path
{
  return 0;
}

- (BOOL)isCamera
{
  return 1;
}

- (id)productKind
{
  return (id)[(ICCameraDevice *)self->_camera productKind];
}

- (id)name
{
  int v2 = [(PHImportDeviceSource *)self camera];
  char v3 = [v2 name];

  return v3;
}

- (id)cameraFilesForAssets:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "cameraFiles", (void)v12);
        [v4 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)deleteImportAssets:(id)a3 isConfirmed:(BOOL)a4 atEnd:(id)a5
{
  BOOL v6 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = PLImportGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = [v8 count];
    if (v6) {
      long long v12 = @"YES";
    }
    else {
      long long v12 = @"NO";
    }
    long long v13 = _Block_copy(v9);
    *(_DWORD *)buf = 136316162;
    v35 = "-[PHImportDeviceSource deleteImportAssets:isConfirmed:atEnd:]";
    __int16 v36 = 2048;
    id v37 = v8;
    __int16 v38 = 2048;
    uint64_t v39 = v11;
    __int16 v40 = 2112;
    v41 = v12;
    __int16 v42 = 2048;
    v43 = v13;
    _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_DEBUG, "%s - %p[%lu], %@, %p", buf, 0x34u);
  }
  long long v14 = [(PHImportDeviceSource *)self deleteProgress];

  if (v14)
  {
    long long v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28228];
    v33 = @"A delete action is already in progress.";
    long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    uint64_t v17 = v15;
    uint64_t v18 = -7;
  }
  else if (v6)
  {
    if ([v8 count])
    {
LABEL_16:
      __int16 v23 = [(PHImportDeviceSource *)self deleteEjectQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__PHImportDeviceSource_deleteImportAssets_isConfirmed_atEnd___block_invoke;
      block[3] = &unk_1E58487E0;
      block[4] = self;
      id v26 = v8;
      id v27 = v9;
      dispatch_sync(v23, block);

      v22 = [(PHImportDeviceSource *)self deleteProgress];

      __int16 v21 = 0;
      goto LABEL_17;
    }
    __int16 v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28228];
    v29 = @"Requested delete of content but provided no content";
    long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v17 = v19;
    uint64_t v18 = -2;
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28228];
    v31 = @"Requested delete of content without indicating user confirmation";
    long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    uint64_t v17 = v20;
    uint64_t v18 = -1;
  }
  __int16 v21 = [v17 errorWithDomain:@"com.apple.ImportErrorDomain" code:v18 userInfo:v16];

  if (!v21) {
    goto LABEL_16;
  }
  if (v9) {
    (*((void (**)(id, void *))v9 + 2))(v9, v21);
  }
  v22 = 0;
LABEL_17:

  return v22;
}

void __61__PHImportDeviceSource_deleteImportAssets_isConfirmed_atEnd___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isEjecting] & 1) == 0)
  {
    int v2 = [*(id *)(a1 + 32) cameraFilesForAssets:*(void *)(a1 + 40)];
    id v3 = PLImportGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = [v2 count];
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "DELETE: Requesting delete of %lu assets", buf, 0xCu);
    }

    id v4 = [*(id *)(a1 + 32) camera];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __61__PHImportDeviceSource_deleteImportAssets_isConfirmed_atEnd___block_invoke_108;
    id v9 = &unk_1E5845C68;
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    id v5 = [v4 requestDeleteFiles:v2 deleteFailed:&__block_literal_global_26073 completion:&v6];
    objc_msgSend(*(id *)(a1 + 32), "setDeleteProgress:", v5, v6, v7, v8, v9, v10);
  }
}

void __61__PHImportDeviceSource_deleteImportAssets_isConfirmed_atEnd___block_invoke_108(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = a3;
  uint64_t v7 = [v5 allKeys];
  id v8 = [v7 objectAtIndexedSubscript:0];

  uint64_t v9 = *MEMORY[0x1E4F2F2F8];
  uint64_t v10 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2F2F8]];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    long long v12 = PLImportGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [v5 objectForKeyedSubscript:v9];
      int v23 = 138412546;
      v24 = v6;
      __int16 v25 = 2112;
      id v26 = v13;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "DELETE: %@\nThe following files failed to delete:\n%@", (uint8_t *)&v23, 0x16u);
    }
  }
  uint64_t v14 = *MEMORY[0x1E4F2F2F0];
  long long v15 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2F2F0]];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    uint64_t v17 = PLImportGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = [v5 objectForKeyedSubscript:v14];
      int v23 = 138412546;
      v24 = v6;
      __int16 v25 = 2112;
      id v26 = v18;
      _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEBUG, "\nDELETE: %@\nThe following files were not deleted:\n%@", (uint8_t *)&v23, 0x16u);
    }
  }
  __int16 v19 = PLImportGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = [v5 objectForKeyedSubscript:v8];
    uint64_t v21 = [v20 count];
    v22 = @"none";
    if (v6) {
      v22 = v6;
    }
    int v23 = 134218242;
    v24 = (__CFString *)v21;
    __int16 v25 = 2112;
    id v26 = v22;
    _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_DEBUG, "DELETE: Deleted Count: %lu, Deleted Error: %@", (uint8_t *)&v23, 0x16u);
  }
  [*(id *)(a1 + 32) setDeleteProgress:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __61__PHImportDeviceSource_deleteImportAssets_isConfirmed_atEnd___block_invoke_106(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLImportGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_ERROR, "Failed to delete %@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)assetsByProcessingItem:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(PHImportDeviceSource *)self importAssetForCameraFile:v4 create:1],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v7 = (void *)v6;
    [v5 addObject:v6];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_21;
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = objc_msgSend(v4, "sidecarFiles", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = +[PHImportDeviceAsset assetFileForFile:*(void *)(*((void *)&v20 + 1) + 8 * i) source:self];
          uint64_t v14 = v13;
          if (v13)
          {
            if ([v13 isSidecar])
            {
              if ([v14 resourceSubType] != 512) {
                [v5 insertObject:v14 atIndex:0];
              }
            }
            else
            {
              [v5 addObject:v14];
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v10);
    }
  }
  else
  {
    long long v15 = PLImportGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = [v4 name];
      *(_DWORD *)buf = 138412290;
      __int16 v25 = v16;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEBUG, "UNSUPPORTED asset '%@'", buf, 0xCu);
    }
    id v8 = [0 fileName];
    id v17 = [(PHImportExceptionRecorder *)self addExceptionWithType:1 path:v8 underlyingError:0 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportDeviceSource.m" line:396];
    uint64_t v7 = 0;
  }

LABEL_21:
  if ([v5 count])
  {
    uint64_t v18 = [(PHImportSource *)self processAssets:v5];
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (void)removeAssetForCameraFile:(id)a3
{
  id v4 = a3;
  assetByCameraFileAccess = self->_assetByCameraFileAccess;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__PHImportDeviceSource_removeAssetForCameraFile___block_invoke;
  v7[3] = &unk_1E5848DF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(assetByCameraFileAccess, v7);
}

void __49__PHImportDeviceSource_removeAssetForCameraFile___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) assetByCameraFile];
  id v2 = [*(id *)(a1 + 40) uuid];
  [v3 removeObjectForKey:v2];
}

- (id)importAssetForCameraFile:(id)a3 create:(BOOL)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  __int16 v19 = __Block_byref_object_copy__26096;
  long long v20 = __Block_byref_object_dispose__26097;
  id v21 = 0;
  assetByCameraFileAccess = self->_assetByCameraFileAccess;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__PHImportDeviceSource_importAssetForCameraFile_create___block_invoke;
  v11[3] = &unk_1E5845C20;
  uint64_t v13 = self;
  uint64_t v14 = &v16;
  id v12 = v6;
  BOOL v15 = a4;
  id v8 = v6;
  dispatch_sync(assetByCameraFileAccess, v11);
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v9;
}

void __56__PHImportDeviceSource_importAssetForCameraFile_create___block_invoke(uint64_t a1)
{
  id v12 = [*(id *)(a1 + 32) uuid];
  id v2 = [*(id *)(a1 + 40) assetByCameraFile];
  uint64_t v3 = [v2 objectForKeyedSubscript:v12];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) && *(unsigned char *)(a1 + 56))
  {
    uint64_t v6 = +[PHImportDeviceAsset assetFileForFile:*(void *)(a1 + 32) source:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v11 = [v9 assetByCameraFile];
    [v11 setObject:v10 forKeyedSubscript:v12];
  }
}

- (void)beginProcessingWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ICEnumerationPrioritizeSpeed"];
  if ([(PHImportSource *)self assetLoadOrder])
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[PHImportSource assetLoadOrder](self, "assetLoadOrder"));
    [v5 setObject:v6 forKeyedSubscript:@"ICEnumerationChronologicalOrder"];
  }
  uint64_t v7 = PLImportGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [(PHImportDeviceSource *)self camera];
    id v9 = [v8 name];
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v9;
    _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_INFO, "Requesting session open for device %@", buf, 0xCu);
  }
  uint64_t v10 = [(PHImportDeviceSource *)self camera];
  [v10 setMediaPresentation:2];

  uint64_t v11 = [(PHImportDeviceSource *)self camera];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__PHImportDeviceSource_beginProcessingWithCompletion___block_invoke;
  v13[3] = &unk_1E5845BF8;
  v13[4] = self;
  id v14 = v4;
  id v12 = v4;
  [v11 requestOpenSessionWithOptions:v5 completion:v13];
}

void __54__PHImportDeviceSource_beginProcessingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!v3)
  {
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v6 = [v10 camera];
    uint64_t v7 = v10;
    id v8 = v6;
    uint64_t v9 = 2;
    goto LABEL_5;
  }
  if ([v3 code] == -9943)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v5 camera];
    uint64_t v7 = v5;
    id v8 = v6;
    uint64_t v9 = 1;
LABEL_5:
    [v7 cameraDevice:v8 setAccessState:v9];

    goto LABEL_9;
  }
  uint64_t v11 = PLImportGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v17 = 138412290;
    uint64_t v18 = v4;
    _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_ERROR, "Received error from -[ICCameraDevice requestOpenSessionWithOptions:completion:]: %@", (uint8_t *)&v17, 0xCu);
  }

LABEL_9:
  id v12 = PLImportGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [*(id *)(a1 + 32) camera];
    id v14 = [v13 name];
    uint64_t v15 = [v4 code];
    uint64_t v16 = @"unlocked";
    if (v15 == -9943) {
      uint64_t v16 = @"locked";
    }
    int v17 = 138412546;
    uint64_t v18 = v14;
    __int16 v19 = 2114;
    long long v20 = v16;
    _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_INFO, "Open session for %@ completed. Device is %{public}@", (uint8_t *)&v17, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)cameraDevice:(id)a3 setAccessState:(unsigned __int8)a4
{
  int v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4 == 2)
  {
    if ([(PHImportSource *)self sourceAccessState] != 2)
    {
      uint64_t v11 = PLImportGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        id v12 = [(PHImportDeviceSource *)self camera];
        uint64_t v13 = [v12 name];
        *(_DWORD *)buf = 138412290;
        __int16 v25 = v13;
        _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_DEBUG, "Notifying observers that %@ is unlocked", buf, 0xCu);
      }
      [(PHImportSource *)self setSourceAccessState:2];
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      uint64_t v16 = __52__PHImportDeviceSource_cameraDevice_setAccessState___block_invoke_74;
      int v17 = &unk_1E5845BD0;
      uint64_t v18 = self;
      uint64_t v10 = &v14;
      goto LABEL_11;
    }
  }
  else
  {
    if (v4 != 1)
    {
      [(PHImportSource *)self setSourceAccessState:0];
      goto LABEL_13;
    }
    if ([(PHImportSource *)self sourceAccessState] != 1)
    {
      uint64_t v7 = PLImportGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        id v8 = [(PHImportDeviceSource *)self camera];
        uint64_t v9 = [v8 name];
        *(_DWORD *)buf = 138412290;
        __int16 v25 = v9;
        _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEBUG, "Notifying observers that %@ is locked", buf, 0xCu);
      }
      [(PHImportSource *)self setSourceAccessState:1];
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      uint64_t v21 = __52__PHImportDeviceSource_cameraDevice_setAccessState___block_invoke;
      long long v22 = &unk_1E5845BD0;
      long long v23 = self;
      uint64_t v10 = &v19;
LABEL_11:
      -[PHImportSource notifyObserversUsingBlock:](self, "notifyObserversUsingBlock:", v10, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }
LABEL_13:
}

uint64_t __52__PHImportDeviceSource_cameraDevice_setAccessState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 userRequiredToTrustHostForImportSource:*(void *)(a1 + 32)];
}

uint64_t __52__PHImportDeviceSource_cameraDevice_setAccessState___block_invoke_74(uint64_t a1, void *a2)
{
  return [a2 userHasTrustedHostForImportSource:*(void *)(a1 + 32)];
}

- (void)fetchMetadataForRequest:(id)a3 importAsset:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 representedObject];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__PHImportDeviceSource_fetchMetadataForRequest_importAsset_completion___block_invoke;
  v17[3] = &unk_1E5845BA8;
  id v18 = v11;
  id v19 = v8;
  uint64_t v23 = v12;
  id v20 = v9;
  uint64_t v21 = self;
  id v22 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  id v16 = v11;
  [v16 requestMetadataDictionaryWithOptions:MEMORY[0x1E4F1CC08] completion:v17];
}

void __71__PHImportDeviceSource_fetchMetadataForRequest_importAsset_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = PLImportGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [*(id *)(a1 + 32) name];
    uint64_t v9 = *(void *)(a1 + 40);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v11 = v10 - *(double *)(a1 + 72);
    *(_DWORD *)buf = 138412802;
    id v22 = v8;
    __int16 v23 = 2048;
    uint64_t v24 = v9;
    __int16 v25 = 2048;
    double v26 = v11;
    _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEBUG, "META COMP: %@ <%p> (%gs)", buf, 0x20u);
  }
  uint64_t v12 = [*(id *)(a1 + 48) createMetadataFromProperties:v6];

  [*(id *)(a1 + 48) setMetadata:v12];
  [*(id *)(a1 + 32) flushMetadataCache];
  id v13 = [*(id *)(a1 + 40) asset];
  if (v13 == *(void **)(a1 + 48))
  {
    uint64_t v16 = *(void *)(a1 + 64);
    if (v16) {
      (*(void (**)(uint64_t, void *, void, id))(v16 + 16))(v16, v12, *(void *)(a1 + 40), v5);
    }
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 40);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __71__PHImportDeviceSource_fetchMetadataForRequest_importAsset_completion___block_invoke_71;
    v17[3] = &unk_1E5845B80;
    id v15 = *(void **)(a1 + 56);
    id v20 = *(id *)(a1 + 64);
    id v18 = v12;
    id v19 = v5;
    [v15 fetchMetadataForRequest:v14 importAsset:v13 completion:v17];
  }
}

uint64_t __71__PHImportDeviceSource_fetchMetadataForRequest_importAsset_completion___block_invoke_71(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t, void))(result + 16))(result, a1[4], a3, a1[5]);
  }
  return result;
}

- (void)sendNextMetadataRequest
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_assetDataRequestQueue);
  uint64_t v27 = *MEMORY[0x1E4F28228];
  do
  {
    if (![(NSMutableArray *)self->_assetMetadataRequests count]) {
      break;
    }
    id v3 = [(NSMutableArray *)self->_assetMetadataRequests objectAtIndexedSubscript:0];
    [(NSMutableArray *)self->_assetMetadataRequests removeObjectAtIndex:0];
    int v4 = [v3 requestAsset];
    id v5 = [v4 representedObject];
    id v6 = [v3 completionHandler];
    int v7 = [v3 isCanceled];
    char v8 = v7;
    if (v7)
    {
      uint64_t v9 = PLImportGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        double v10 = [v5 name];
        *(_DWORD *)buf = 138412546;
        v33 = v10;
        __int16 v34 = 2048;
        v35 = v3;
        _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_DEBUG, "META CNCL: %@ <%p>", buf, 0x16u);
      }
      double v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = v27;
      uint64_t v12 = NSString;
      id v13 = [v4 fileName];
      uint64_t v14 = [v12 stringWithFormat:@"Request for metadata for %@ was canceled.", v13];
      v31 = v14;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      uint64_t v16 = [v11 errorWithDomain:@"com.apple.ImportErrorDomain" code:-4 userInfo:v15];
      ((void (**)(void, void, void *, void *))v6)[2](v6, 0, v3, v16);
    }
    else
    {
      int v17 = [v3 requestAsset];
      id v18 = [v17 metadata];

      if (!v18) {
        goto LABEL_12;
      }
      id v19 = PLImportGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        id v20 = [v3 requestAsset];
        uint64_t v21 = [v20 representedObject];
        id v22 = [v21 name];
        *(_DWORD *)buf = 138412546;
        v33 = v22;
        __int16 v34 = 2048;
        v35 = v3;
        _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_DEBUG, "META CACH: %@ <%p>", buf, 0x16u);
      }
      if (v6)
      {
        __int16 v23 = [v3 requestAsset];
        uint64_t v24 = [v23 metadata];
        ((void (**)(void, void *, void *, void))v6)[2](v6, v24, v3, 0);
      }
      else
      {
LABEL_12:
        __int16 v25 = PLImportGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          double v26 = [v5 name];
          *(_DWORD *)buf = 138412546;
          v33 = v26;
          __int16 v34 = 2048;
          v35 = v3;
          _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_DEBUG, "META SEND: %@ <%p>", buf, 0x16u);
        }
        self->_waitingForAssetMetadataRequest = 1;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __47__PHImportDeviceSource_sendNextMetadataRequest__block_invoke;
        v28[3] = &unk_1E5845B58;
        v28[4] = self;
        v29 = v6;
        [(PHImportDeviceSource *)self fetchMetadataForRequest:v3 importAsset:v4 completion:v28];
      }
    }
  }
  while ((v8 & 1) != 0);
}

void __47__PHImportDeviceSource_sendNextMetadataRequest__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  double v11 = *(NSObject **)(v10 + 376);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PHImportDeviceSource_sendNextMetadataRequest__block_invoke_2;
  block[3] = &unk_1E5848578;
  block[4] = v10;
  dispatch_async(v11, block);
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, id, id, id))(v12 + 16))(v12, v7, v8, v9);
  }
}

uint64_t __47__PHImportDeviceSource_sendNextMetadataRequest__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 352) = 0;
  return [*(id *)(a1 + 32) sendNextMetadataRequest];
}

- (void)fetchMetadataUsingRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  assetDataRequestQueue = self->_assetDataRequestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PHImportDeviceSource_fetchMetadataUsingRequest_withCompletion___block_invoke;
  block[3] = &unk_1E58487E0;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(assetDataRequestQueue, block);
}

void __65__PHImportDeviceSource_fetchMetadataUsingRequest_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isCanceled])
  {
    id v2 = PLImportGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      id v3 = [*(id *)(a1 + 32) requestAsset];
      int v4 = [v3 representedObject];
      id v5 = [v4 name];
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v35 = v5;
      __int16 v36 = 2048;
      uint64_t v37 = v6;
      _os_log_impl(&dword_19B043000, v2, OS_LOG_TYPE_DEBUG, "META CNCL: %@ <%p>", buf, 0x16u);
    }
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = *(void **)(a1 + 32);
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28228];
    id v10 = NSString;
    double v11 = [v8 asset];
    id v12 = [v11 fileName];
    id v13 = [v10 stringWithFormat:@"Request for thumbnail for %@ was canceled.", v12];
    v33 = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    id v15 = [v9 errorWithDomain:@"com.apple.ImportErrorDomain" code:-4 userInfo:v14];
    (*(void (**)(uint64_t, void, void *, void *))(v7 + 16))(v7, 0, v8, v15);
  }
  else
  {
    uint64_t v16 = [*(id *)(a1 + 32) requestAsset];
    int v17 = [v16 metadata];

    if (!v17) {
      goto LABEL_10;
    }
    id v18 = PLImportGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      id v19 = [*(id *)(a1 + 32) requestAsset];
      id v20 = [v19 representedObject];
      uint64_t v21 = [v20 name];
      uint64_t v22 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v35 = v21;
      __int16 v36 = 2048;
      uint64_t v37 = v22;
      _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_DEBUG, "META CACH: %@ <%p>", buf, 0x16u);
    }
    uint64_t v23 = *(void *)(a1 + 48);
    if (v23)
    {
      uint64_t v24 = [*(id *)(a1 + 32) requestAsset];
      __int16 v25 = [v24 metadata];
      (*(void (**)(uint64_t, void *, void, void))(v23 + 16))(v23, v25, *(void *)(a1 + 32), 0);
    }
    else
    {
LABEL_10:
      double v26 = PLImportGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v27 = [*(id *)(a1 + 32) requestAsset];
        uint64_t v28 = [v27 representedObject];
        v29 = [v28 name];
        uint64_t v30 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v35 = v29;
        __int16 v36 = 2048;
        uint64_t v37 = v30;
        _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_DEBUG, "META QUED: %@ <%p>", buf, 0x16u);
      }
      [*(id *)(a1 + 32) setCompletionHandler:*(void *)(a1 + 48)];
      [*(id *)(*(void *)(a1 + 40) + 344) addObject:*(void *)(a1 + 32)];
      v31 = *(unsigned char **)(a1 + 40);
      if (!v31[352]) {
        [v31 sendNextMetadataRequest];
      }
    }
  }
}

- (void)sendNextThumbnailRequest
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_assetDataRequestQueue);
  __int16 v34 = self;
  p_assetThumbnailHighPriorityRequests = &self->_assetThumbnailHighPriorityRequests;
  if (![(NSMutableArray *)*p_assetThumbnailHighPriorityRequests count]) {
    p_assetThumbnailHighPriorityRequests = &v34->_assetThumbnailRequests;
  }
  int v4 = *p_assetThumbnailHighPriorityRequests;
  uint64_t v33 = *MEMORY[0x1E4F2F318];
  uint64_t v32 = *MEMORY[0x1E4F2F310];
  uint64_t v31 = *MEMORY[0x1E4F28228];
  while ([(NSMutableArray *)v4 count])
  {
    id v5 = [(NSMutableArray *)v4 objectAtIndexedSubscript:0];
    [(NSMutableArray *)v4 removeObjectAtIndex:0];
    uint64_t v6 = [v5 requestAsset];
    uint64_t v7 = [v6 representedObject];
    uint64_t v8 = [v5 completionHandler];
    id v9 = (void (**)(void, void, void, void))v8;
    if (!v7 || !v8)
    {
      id v10 = PLImportGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        double v11 = _Block_copy(v9);
        *(_DWORD *)buf = 138412546;
        v47 = v7;
        __int16 v48 = 2112;
        uint64_t v49 = (uint64_t)v11;
        _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_ERROR, "Expect to have non-nil cameraFile and completionHandler: %@, %@", buf, 0x16u);
      }
    }
    int v12 = [v5 isCanceled];
    id v13 = PLImportGetLog();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (v12)
    {
      if (v14)
      {
        id v15 = [v7 name];
        uint64_t v16 = [v5 longestSide];
        *(_DWORD *)buf = 138412802;
        v47 = v15;
        __int16 v48 = 2048;
        uint64_t v49 = v16;
        __int16 v50 = 2048;
        v51 = v5;
        _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEBUG, "THMB CNCL: %@ (%lu) <%p>", buf, 0x20u);
      }
      if (!v9) {
        goto LABEL_19;
      }
      int v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v44 = v31;
      id v18 = NSString;
      id v19 = [v6 fileName];
      id v20 = [v18 stringWithFormat:@"Request for thumbnail for %@ was canceled.", v19];
      v45 = v20;
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      uint64_t v22 = [v17 errorWithDomain:@"com.apple.ImportErrorDomain" code:-4 userInfo:v21];
      ((void (**)(void, void, void *, void *))v9)[2](v9, 0, v5, v22);
    }
    else
    {
      if (v14)
      {
        uint64_t v23 = [v7 name];
        uint64_t v24 = [v5 longestSide];
        *(_DWORD *)buf = 138412802;
        v47 = v23;
        __int16 v48 = 2048;
        uint64_t v49 = v24;
        __int16 v50 = 2048;
        v51 = v5;
        _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEBUG, "THMB SEND: %@ (%lu) <%p>", buf, 0x20u);
      }
      v34->_waitingForAssetThumbnailRequest = 1;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      uint64_t v26 = v25;
      v42[0] = v33;
      uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "longestSide"));
      v42[1] = v32;
      v43[0] = v27;
      v43[1] = MEMORY[0x1E4F1CC28];
      uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __48__PHImportDeviceSource_sendNextThumbnailRequest__block_invoke;
      v35[3] = &unk_1E5845B30;
      id v29 = v7;
      id v36 = v29;
      id v30 = v5;
      uint64_t v41 = v26;
      id v37 = v30;
      uint64_t v38 = v34;
      id v39 = v6;
      __int16 v40 = v9;
      [v29 requestThumbnailDataWithOptions:v28 completion:v35];

      id v19 = v36;
    }

LABEL_19:
    if ((v12 & 1) == 0) {
      break;
    }
  }
}

void __48__PHImportDeviceSource_sendNextThumbnailRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = PLImportGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [*(id *)(a1 + 32) name];
    uint64_t v9 = [*(id *)(a1 + 40) longestSide];
    uint64_t v10 = *(void *)(a1 + 40);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v12 = v11 - *(double *)(a1 + 72);
    *(_DWORD *)buf = 138413058;
    uint64_t v27 = v8;
    __int16 v28 = 2048;
    uint64_t v29 = v9;
    __int16 v30 = 2048;
    uint64_t v31 = v10;
    __int16 v32 = 2048;
    double v33 = v12;
    _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEBUG, "THMB COMP: %@ (%lu) <%p> (%gs)", buf, 0x2Au);
  }
  if (!v5)
  {
    id v13 = PLImportGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      BOOL v14 = [*(id *)(a1 + 32) name];
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = v14;
      __int16 v28 = 2048;
      uint64_t v29 = v15;
      _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEBUG, "WARNING: ICC returned nil image data for %@ <%p>", buf, 0x16u);
    }
  }
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v16 = *(void **)(a1 + 48);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __48__PHImportDeviceSource_sendNextThumbnailRequest__block_invoke_65;
  v22[3] = &unk_1E5845B08;
  v22[4] = v16;
  uint64_t v18 = *(void *)(a1 + 56);
  id v19 = *(id *)(a1 + 64);
  id v24 = v6;
  id v25 = v19;
  id v23 = v5;
  id v20 = v6;
  id v21 = v5;
  [v16 fetchMetadataForRequest:v17 importAsset:v18 completion:v22];
}

void __48__PHImportDeviceSource_sendNextThumbnailRequest__block_invoke_65(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = a1[4];
  id v6 = *(NSObject **)(v5 + 376);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PHImportDeviceSource_sendNextThumbnailRequest__block_invoke_2;
  block[3] = &unk_1E5848578;
  void block[4] = v5;
  dispatch_async(v6, block);
  uint64_t v7 = a1[7];
  if (v7) {
    (*(void (**)(uint64_t, void, id, void))(v7 + 16))(v7, a1[5], v4, a1[6]);
  }
}

uint64_t __48__PHImportDeviceSource_sendNextThumbnailRequest__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 336) = 0;
  return [*(id *)(a1 + 32) sendNextThumbnailRequest];
}

- (void)fetchThumbnailDataUsingRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  assetDataRequestQueue = self->_assetDataRequestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PHImportDeviceSource_fetchThumbnailDataUsingRequest_withCompletion___block_invoke;
  block[3] = &unk_1E58487E0;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(assetDataRequestQueue, block);
}

void __70__PHImportDeviceSource_fetchThumbnailDataUsingRequest_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) isCanceled];
  id v3 = PLImportGetLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 32) requestAsset];
      id v6 = [v5 representedObject];
      id v7 = [v6 name];
      uint64_t v8 = [*(id *)(a1 + 32) longestSide];
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      __int16 v30 = v7;
      __int16 v31 = 2048;
      uint64_t v32 = v8;
      __int16 v33 = 2048;
      uint64_t v34 = v9;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "THMB CNCL: %@ (%lu) <%p>", buf, 0x20u);
    }
    uint64_t v10 = *(void *)(a1 + 48);
    double v11 = *(void **)(a1 + 32);
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28228];
    id v13 = NSString;
    id v14 = [v11 asset];
    uint64_t v15 = [v14 fileName];
    uint64_t v16 = [v13 stringWithFormat:@"Request for thumbnail for %@ was canceled.", v15];
    __int16 v28 = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    uint64_t v18 = [v12 errorWithDomain:@"com.apple.ImportErrorDomain" code:-4 userInfo:v17];
    (*(void (**)(uint64_t, void, void *, void *))(v10 + 16))(v10, 0, v11, v18);
  }
  else
  {
    if (v4)
    {
      id v19 = [*(id *)(a1 + 32) requestAsset];
      id v20 = [v19 representedObject];
      id v21 = [v20 name];
      uint64_t v22 = [*(id *)(a1 + 32) longestSide];
      uint64_t v23 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      __int16 v30 = v21;
      __int16 v31 = 2048;
      uint64_t v32 = v22;
      __int16 v33 = 2048;
      uint64_t v34 = v23;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "THMB QUED: %@ (%lu) <%p>", buf, 0x20u);
    }
    int v24 = [*(id *)(a1 + 32) priority];
    id v25 = &OBJC_IVAR___PHImportDeviceSource__assetThumbnailRequests;
    if (v24 == 1) {
      id v25 = &OBJC_IVAR___PHImportDeviceSource__assetThumbnailHighPriorityRequests;
    }
    id v14 = *(id *)(*(void *)(a1 + 40) + *v25);
    [*(id *)(a1 + 32) setCompletionHandler:*(void *)(a1 + 48)];
    [v14 addObject:*(void *)(a1 + 32)];
    uint64_t v26 = *(unsigned char **)(a1 + 40);
    if (!v26[336]) {
      [v26 sendNextThumbnailRequest];
    }
  }
}

- (id)uuid
{
  id v3 = [(ICCameraDevice *)self->_camera UUIDString];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PHImportDeviceSource;
    id v5 = [(PHImportSource *)&v8 uuid];
  }
  id v6 = v5;

  return v6;
}

- (PHImportDeviceSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PHImportDeviceSource;
  id v6 = [(PHImportSource *)&v36 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_camera, a3);
    [v5 setDelegate:v7];
    uint64_t v8 = objc_opt_new();
    assetByCameraFile = v7->_assetByCameraFile;
    v7->_assetByCameraFile = (NSMutableDictionary *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("assetByCameraFile access", 0);
    assetByCameraFileAccess = v7->_assetByCameraFileAccess;
    v7->_assetByCameraFileAccess = (OS_dispatch_queue *)v10;

    objc_initWeak(&location, v7);
    id v12 = [ICCameraDeviceRemovedItemsCoalescer alloc];
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    uint64_t v32 = __39__PHImportDeviceSource_initWithDevice___block_invoke;
    __int16 v33 = &unk_1E5845AD8;
    objc_copyWeak(&v34, &location);
    uint64_t v13 = [(ICCameraDeviceRemovedItemsCoalescer *)v12 initWithSource:v7 block:&v30];
    removalCoalescer = v7->_removalCoalescer;
    v7->_removalCoalescer = (ICCameraDeviceRemovedItemsCoalescer *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("Import Asset Delete/Eject", 0);
    deleteEjectQueue = v7->_deleteEjectQueue;
    v7->_deleteEjectQueue = (OS_dispatch_queue *)v15;

    uint64_t v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    assetThumbnailRequests = v7->_assetThumbnailRequests;
    v7->_assetThumbnailRequests = v17;

    id v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    assetMetadataRequests = v7->_assetMetadataRequests;
    v7->_assetMetadataRequests = v19;

    id v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    assetThumbnailHighPriorityRequests = v7->_assetThumbnailHighPriorityRequests;
    v7->_assetThumbnailHighPriorityRequests = v21;

    uint64_t v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int v24 = dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_USER_INITIATED, -1);
    dispatch_queue_t v25 = dispatch_queue_create("com.photos.import.devicesource.assetdatarequests", v24);
    assetDataRequestQueue = v7->_assetDataRequestQueue;
    v7->_assetDataRequestQueue = (OS_dispatch_queue *)v25;

    uint64_t v27 = objc_msgSend(MEMORY[0x1E4F28E10], "weakToStrongObjectsMapTable", v30, v31, v32, v33);
    assetDataRequestsByCameraItem = v7->_assetDataRequestsByCameraItem;
    v7->_assetDataRequestsByCameraItem = (NSMapTable *)v27;

    [(PHImportSource *)v7 setSourceAccessState:0];
    [(PHImportSource *)v7 setOpen:1];
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __39__PHImportDeviceSource_initWithDevice___block_invoke(uint64_t a1, void *a2)
{
  int v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained removeAssets:v3];
}

@end