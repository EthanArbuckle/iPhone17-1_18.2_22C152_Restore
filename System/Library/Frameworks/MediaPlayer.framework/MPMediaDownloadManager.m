@interface MPMediaDownloadManager
+ (MPMediaDownloadManager)sharedManager;
- (BOOL)_hasRequiredAirTrafficEntitlement;
- (BOOL)_isValidMediaAsset:(id)a3;
- (BOOL)hasActiveDownloads;
- (MPMediaDownloadManager)init;
- (NSArray)allMediaDownloadLibraryIdentifiers;
- (id)_downloadProgressConnection;
- (id)_init;
- (id)_keepLocalTaskConnection;
- (id)_statusChangeObservers;
- (id)_updateCacheAndGetItemToReportForATAssetDownloadPauseReasonChange:(id)a3;
- (id)_updateCacheAndGetMediaDownloadToReportForStoreDownloadProgress:(id)a3;
- (id)_updateCacheAndItemToReportForATAssetDownloadProgressChange:(id)a3;
- (id)activeDownloadForMediaItemPersistentID:(int64_t)a3;
- (id)activeDownloadForStoreID:(int64_t)a3;
- (id)downloadForIdentifierSet:(id)a3 downloadState:(int64_t *)a4;
- (int64_t)activeDownloadsCount;
- (void)_notifyObserversOfAssetDownloadProgress:(id)a3;
- (void)_notifyObserversOfDownloadCompleteForAssets:(id)a3 withError:(id)a4;
- (void)_notifyObserversOfDownloadPauseReasonChangedForAssets:(id)a3;
- (void)_prefectchAllATDownloads;
- (void)atcDidDownloadAsset:(id)a3 withError:(id)a4;
- (void)atcDidEnqueueAsset:(id)a3;
- (void)atcDidUpdateAsset:(id)a3 withProgress:(float)a4;
- (void)atcDidUpdateDownloadStateForAssets:(id)a3;
- (void)atcWillEnqueueDownloads:(id)a3 cancelDownloads:(id)a4;
- (void)cancelDownloads:(id)a3;
- (void)dealloc;
- (void)downloadLibraryWithCompletionHandler:(id)a3;
- (void)downloadManager:(id)a3 didAddDownloads:(id)a4 removeDownloads:(id)a5;
- (void)downloadManager:(id)a3 downloadDidFinish:(id)a4;
- (void)downloadManager:(id)a3 downloadDidProgress:(id)a4;
- (void)downloadManager:(id)a3 downloadsDidProgress:(id)a4;
- (void)enqueueAssetForDownload:(int64_t)a3 withCompletionHandler:(id)a4;
- (void)prioritizeDownload:(int64_t)a3;
- (void)registerObserver:(id)a3;
- (void)sendKeepLocalStatusChanged:(int64_t)a3 forLibraryIdentifier:(int64_t)a4 entityType:(int64_t)a5 withCompletionHandler:(id)a6;
- (void)unregisterObserver:(id)a3;
@end

@implementation MPMediaDownloadManager

void __39__MPMediaDownloadManager_sharedManager__block_invoke()
{
  id v0 = [[MPMediaDownloadManager alloc] _init];
  v1 = (void *)sharedManager__sharedManager;
  sharedManager__sharedManager = (uint64_t)v0;
}

- (id)_init
{
  v27.receiver = self;
  v27.super_class = (Class)MPMediaDownloadManager;
  v2 = [(MPMediaDownloadManager *)&v27 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    cachedProgressMap = v2->_cachedProgressMap;
    v2->_cachedProgressMap = (NSMutableDictionary *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mediaplayer.mediadownloadmanager.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mediaplayer.mediadownloadmanager.callout", MEMORY[0x1E4F14430]);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.mediaplayer.mediadownloadmanager.xpcconnections", 0);
    xpcConnectionQueue = v2->_xpcConnectionQueue;
    v2->_xpcConnectionQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:1];
    downloadObservers = v2->_downloadObservers;
    v2->_downloadObservers = (NSHashTable *)v11;

    uint64_t v13 = +[MPStoreDownloadManager sharedManager];
    storeDownloadManager = v2->_storeDownloadManager;
    v2->_storeDownloadManager = (MPStoreDownloadManager *)v13;

    [(MPStoreDownloadManager *)v2->_storeDownloadManager addObserver:v2 forDownloads:0];
    BOOL v15 = [(MPMediaDownloadManager *)v2 _hasRequiredAirTrafficEntitlement];
    v2->_hasRequiredAirTrafficEntitlement = v15;
    if (v15)
    {
      uint64_t v16 = [MEMORY[0x1E4F1CA70] orderedSet];
      cachedATDownloads = v2->_cachedATDownloads;
      v2->_cachedATDownloads = (NSMutableOrderedSet *)v16;

      uint64_t v18 = [MEMORY[0x1E4F1CA70] orderedSet];
      cachedATUnEnqueuedDownloads = v2->_cachedATUnEnqueuedDownloads;
      v2->_cachedATUnEnqueuedDownloads = (NSMutableOrderedSet *)v18;

      uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
      cachedATPausedDownloads = v2->_cachedATPausedDownloads;
      v2->_cachedATPausedDownloads = (NSMutableDictionary *)v20;

      id v22 = [(MPMediaDownloadManager *)v2 _keepLocalTaskConnection];
      id v23 = [(MPMediaDownloadManager *)v2 _downloadProgressConnection];
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      getATStartupCompleteNotification();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_handleATCStartupCompletedNotification, v25, 0, CFNotificationSuspensionBehaviorDrop);
    }
  }
  return v2;
}

- (BOOL)_hasRequiredAirTrafficEntitlement
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = SecTaskCreateFromSelf(0);
  if (v2)
  {
    uint64_t v3 = v2;
    CFErrorRef error = 0;
    CFTypeRef v4 = SecTaskCopyValueForEntitlement(v2, @"com.apple.atc.private", &error);
    CFErrorRef v5 = error;
    if (!v4 || error)
    {
      BOOL v7 = 0;
      LODWORD(v8) = 0;
      if (!v4)
      {
        if (!error)
        {
LABEL_12:
          CFRelease(v3);
          uint64_t v11 = os_log_create("com.apple.amp.mediaplayer", "Download");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v12 = [MEMORY[0x1E4F28B50] mainBundle];
            uint64_t v13 = [v12 bundleIdentifier];
            v14 = (void *)v13;
            BOOL v15 = "cannot";
            if (v8) {
              BOOL v15 = "can";
            }
            *(_DWORD *)buf = 138412546;
            uint64_t v19 = v13;
            __int16 v20 = 2080;
            v21 = v15;
            _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEFAULT, "%@ %s connect to atc", buf, 0x16u);
          }
          return (char)v8;
        }
LABEL_11:
        CFRelease(v5);
        goto LABEL_12;
      }
    }
    else
    {
      CFTypeID v6 = CFGetTypeID(v4);
      BOOL v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v4) != 0;
    }
    CFRelease(v4);
    CFErrorRef v5 = error;
    LODWORD(v8) = v7;
    if (!error) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v8 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v9 = [MEMORY[0x1E4F28B50] mainBundle];
    v10 = [v9 bundleIdentifier];
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = (uint64_t)v10;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "%@ cannot connect to atc [unable to create SecTask]", buf, 0xCu);
  }
  LOBYTE(v8) = 0;
  return (char)v8;
}

+ (MPMediaDownloadManager)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedManager__sharedManager;

  return (MPMediaDownloadManager *)v2;
}

uint64_t __43__MPMediaDownloadManager_registerObserver___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    result = objc_msgSend(*(id *)(*(void *)(result + 40) + 64), "containsObject:");
    if ((result & 1) == 0)
    {
      uint64_t v2 = *(void *)(v1 + 32);
      uint64_t v3 = *(void **)(*(void *)(v1 + 40) + 64);
      return [v3 addObject:v2];
    }
  }
  return result;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__MPMediaDownloadManager_registerObserver___block_invoke;
  v7[3] = &unk_1E57F9F98;
  id v8 = v4;
  dispatch_queue_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_downloadObservers, 0);
  objc_storeStrong((id *)&self->_storeDownloadManager, 0);
  objc_storeStrong((id *)&self->__keepLocalTaskConnection, 0);
  objc_storeStrong((id *)&self->__downloadProgressConnection, 0);
  objc_storeStrong((id *)&self->_cachedATPausedDownloads, 0);
  objc_storeStrong((id *)&self->_cachedATUnEnqueuedDownloads, 0);
  objc_storeStrong((id *)&self->_cachedProgressMap, 0);

  objc_storeStrong((id *)&self->_cachedATDownloads, 0);
}

- (id)_downloadProgressConnection
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__MPMediaDownloadManager__downloadProgressConnection__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(xpcConnectionQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __53__MPMediaDownloadManager__downloadProgressConnection__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 96))
  {
    id v3 = *(void **)(v1 + 40);
    if (!v3)
    {
      id v4 = os_log_create("com.apple.amp.mediaplayer", "Download");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        getATMachDownloadObserverServiceName();
        *(_DWORD *)buf = 138543362;
        uint64_t v24 = v5;
        _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "Connecting to %{public}@ ", buf, 0xCu);
      }

      id v6 = objc_alloc(MEMORY[0x1E4F29268]);
      getATMachDownloadObserverServiceName();
      uint64_t v8 = [v6 initWithMachServiceName:v7 options:0];
      uint64_t v9 = *(void *)(a1 + 32);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      id v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE78DDA8];
      v12 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v13 = objc_opt_class();
      getATAssetClass();
      v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
      [v11 setClasses:v14 forSelector:sel_getAllDownloadsWithReplyBlock_ argumentIndex:0 ofReply:1];

      BOOL v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      [v11 setClasses:v15 forSelector:sel_getAllDownloadsWithReplyBlock_ argumentIndex:1 ofReply:1];

      uint64_t v16 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE6F0BF8];
      v17 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v18 = objc_opt_class();
      getATAssetClass();
      uint64_t v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
      [v16 setClasses:v19 forSelector:sel_atcDidUpdateDownloadStateForAssets_ argumentIndex:0 ofReply:0];

      [*(id *)(*(void *)(a1 + 32) + 40) setRemoteObjectInterface:v11];
      [*(id *)(*(void *)(a1 + 32) + 40) setExportedInterface:v16];
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setExportedObject:");
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      [*(id *)(*(void *)(a1 + 32) + 40) setInterruptionHandler:&__block_literal_global_171];
      __int16 v20 = *(void **)(*(void *)(a1 + 32) + 40);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __53__MPMediaDownloadManager__downloadProgressConnection__block_invoke_172;
      v21[3] = &unk_1E57F6EF0;
      objc_copyWeak(&v22, (id *)buf);
      [v20 setInvalidationHandler:v21];
      [*(id *)(*(void *)(a1 + 32) + 40) resume];
      [*(id *)(a1 + 32) _prefectchAllATDownloads];
      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);

      id v3 = *(void **)(*(void *)(a1 + 32) + 40);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
  }
}

void __53__MPMediaDownloadManager__downloadProgressConnection__block_invoke_172(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    getATMachDownloadObserverServiceName();
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "Connection to %{public}@ invalidated", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 5);
    *((void *)WeakRetained + 5) = 0;
  }
}

void __53__MPMediaDownloadManager__downloadProgressConnection__block_invoke_169()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v0 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    getATMachDownloadObserverServiceName();
    int v2 = 138543362;
    uint64_t v3 = v1;
    _os_log_impl(&dword_1952E8000, v0, OS_LOG_TYPE_DEFAULT, "Connection to %{public}@ interrupted", (uint8_t *)&v2, 0xCu);
  }
}

- (id)_keepLocalTaskConnection
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  xpcConnectionQueue = self->_xpcConnectionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__MPMediaDownloadManager__keepLocalTaskConnection__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(xpcConnectionQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __50__MPMediaDownloadManager__keepLocalTaskConnection__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 96) && !*(void *)(v2 + 48))
  {
    id v3 = os_log_create("com.apple.amp.mediaplayer", "Download");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      getATMachKeepLocalRequestHandlerServiceName();
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v4;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "Connecting to %{public}@ ", buf, 0xCu);
    }

    id v5 = objc_alloc(MEMORY[0x1E4F77A48]);
    getATMachKeepLocalRequestHandlerServiceName();
    uint64_t v7 = [v5 initWithMachServiceName:v6 options:0];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 48);
    *(void *)(v8 + 48) = v7;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "setExportedObject:");
    v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE78DCE8];
    [*(id *)(*(void *)(a1 + 32) + 48) setRemoteObjectInterface:v10];
    id v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE78DD48];
    [*(id *)(*(void *)(a1 + 32) + 48) setExportedInterface:v11];
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    [*(id *)(*(void *)(a1 + 32) + 48) setInterruptionHandler:&__block_literal_global_148];
    v12 = *(void **)(*(void *)(a1 + 32) + 48);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__MPMediaDownloadManager__keepLocalTaskConnection__block_invoke_149;
    v13[3] = &unk_1E57F6EF0;
    objc_copyWeak(&v14, (id *)buf);
    [v12 setInvalidationHandler:v13];
    [*(id *)(*(void *)(a1 + 32) + 48) resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);

    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(v2 + 48));
}

void __50__MPMediaDownloadManager__keepLocalTaskConnection__block_invoke_149(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    getATMachKeepLocalRequestHandlerServiceName();
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_ERROR, "Connection to %{public}@ invalidated", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = (void *)*((void *)WeakRetained + 6);
    *((void *)WeakRetained + 6) = 0;
  }
}

void __50__MPMediaDownloadManager__keepLocalTaskConnection__block_invoke_146()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v0 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    getATMachKeepLocalRequestHandlerServiceName();
    int v2 = 138543362;
    uint64_t v3 = v1;
    _os_log_impl(&dword_1952E8000, v0, OS_LOG_TYPE_ERROR, "Connection to %{public}@ interrupted", (uint8_t *)&v2, 0xCu);
  }
}

- (void)_prefectchAllATDownloads
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MPMediaDownloadManager__prefectchAllATDownloads__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __50__MPMediaDownloadManager__prefectchAllATDownloads__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _downloadProgressConnection];
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_78];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__MPMediaDownloadManager__prefectchAllATDownloads__block_invoke_79;
  v4[3] = &unk_1E57ED9D8;
  v4[4] = *(void *)(a1 + 32);
  [v3 getAllDownloadsWithReplyBlock:v4];
}

void __50__MPMediaDownloadManager__prefectchAllATDownloads__block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 72);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MPMediaDownloadManager__prefectchAllATDownloads__block_invoke_2_80;
  block[3] = &unk_1E57FA038;
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __50__MPMediaDownloadManager__prefectchAllATDownloads__block_invoke_2_80(id *a1)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  uint64_t v3 = os_log_create("com.apple.amp.mediaplayer", "Download");
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v5 = objc_msgSend(a1[4], "msv_description");
      *(_DWORD *)buf = 138543362;
      v59 = v5;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "finished getting downloads in ATC pipeline error=%{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "finished getting downloads in ATC pipeline", buf, 2u);
  }

  v42 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [*((id *)a1[5] + 7) userDownloads];
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v54 objects:v64 count:16];
  unint64_t v10 = 0x1E4F28000uLL;
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v55 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * i), "libraryItemIdentifier"));
        [v7 addObject:v14];
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v54 objects:v64 count:16];
    }
    while (v11);
  }
  v41 = v8;

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v15 = *((id *)a1[5] + 1);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v63 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v51 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v50 + 1) + 8 * j);
        if (([v7 containsObject:v20] & 1) == 0) {
          [*((id *)a1[5] + 2) removeObjectForKey:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v50 objects:v63 count:16];
    }
    while (v17);
  }

  [*((id *)a1[5] + 1) removeAllObjects];
  [*((id *)a1[5] + 3) removeAllObjects];
  [*((id *)a1[5] + 4) removeAllObjects];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = a1[6];
  uint64_t v21 = [obj countByEnumeratingWithState:&v46 objects:v62 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v47 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void **)(*((void *)&v46 + 1) + 8 * k);
        if ([a1[5] _isValidMediaAsset:v25])
        {
          v26 = [v25 identifier];
          uint64_t v27 = [v26 longLongValue];

          unint64_t v28 = v10;
          v29 = [*(id *)(v10 + 3792) numberWithLongLong:v27];
          [*((id *)a1[5] + 1) addObject:v29];
          v30 = [[MPMediaDownload alloc] initWithATAsset:v25];
          [v42 addObject:v30];
          [v25 downloadProgress];
          if (v31 <= 0.0
            || ([*((id *)a1[5] + 2) objectForKey:v29],
                v32 = objc_claimAutoreleasedReturnValue(),
                v32,
                v32))
          {
            unint64_t v10 = v28;
            if ([v25 downloadPauseReason])
            {
              uint64_t v33 = 32;
              goto LABEL_33;
            }
          }
          else
          {
            uint64_t v33 = 16;
            unint64_t v10 = v28;
LABEL_33:
            [*(id *)((char *)a1[5] + v33) setObject:v30 forKey:v29];
          }

          continue;
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v46 objects:v62 count:16];
    }
    while (v22);
  }

  id v34 = a1[5];
  v35 = *((void *)v34 + 10);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MPMediaDownloadManager__prefectchAllATDownloads__block_invoke_82;
  block[3] = &unk_1E57F9F98;
  void block[4] = v34;
  id v36 = v42;
  id v45 = v36;
  dispatch_async(v35, block);
  v37 = os_log_create("com.apple.amp.mediaplayer", "Download_Oversize");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    id v38 = a1[5];
    v39 = (void *)*((void *)v38 + 1);
    v40 = [*((id *)v38 + 4) allValues];
    *(_DWORD *)buf = 138543618;
    v59 = v39;
    __int16 v60 = 2114;
    v61 = v40;
    _os_log_impl(&dword_1952E8000, v37, OS_LOG_TYPE_DEFAULT, "ATC's download pipeline: active=%{public}@, paused=%{public}@", buf, 0x16u);
  }
}

void __50__MPMediaDownloadManager__prefectchAllATDownloads__block_invoke_82(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_statusChangeObservers", 0);
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
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 downloadManager:*(void *)(a1 + 32) didEnqueueAssetDownloads:*(void *)(a1 + 40) didRemoveAssetDownloads:0];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __50__MPMediaDownloadManager__prefectchAllATDownloads__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "error %{public}@ connecting to remote object to get downloads in ATC queue", (uint8_t *)&v4, 0xCu);
  }
}

- (id)_statusChangeObservers
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy_;
  long long v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__MPMediaDownloadManager__statusChangeObservers__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__MPMediaDownloadManager__statusChangeObservers__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)_isValidMediaAsset:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  if (!v3) {
    goto LABEL_4;
  }
  id v5 = [v3 identifier];
  if (![v5 longLongValue]) {
    goto LABEL_10;
  }
  char v6 = [v4 downloadOnly];

  if ((v6 & 1) == 0)
  {
    id v5 = [v4 assetType];
    if (([v5 isEqualToString:@"Movie"] & 1) != 0
      || ([v5 isEqualToString:@"Music"] & 1) != 0
      || ([v5 isEqualToString:@"TVEpisode"] & 1) != 0
      || [v5 isEqualToString:@"MusicVideo"])
    {
      BOOL v7 = 1;
LABEL_11:

      goto LABEL_12;
    }
LABEL_10:
    BOOL v7 = 0;
    goto LABEL_11;
  }
LABEL_4:
  BOOL v7 = 0;
LABEL_12:

  return v7;
}

- (void)_notifyObserversOfDownloadPauseReasonChangedForAssets:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    calloutQueue = self->_calloutQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __80__MPMediaDownloadManager__notifyObserversOfDownloadPauseReasonChangedForAssets___block_invoke;
    v6[3] = &unk_1E57F9F98;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(calloutQueue, v6);
  }
}

void __80__MPMediaDownloadManager__notifyObserversOfDownloadPauseReasonChangedForAssets___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_statusChangeObservers", 0);
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
          [v7 downloadManager:*(void *)(a1 + 32) didChangeDownloadPausedReasonForAssets:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_notifyObserversOfDownloadCompleteForAssets:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__MPMediaDownloadManager__notifyObserversOfDownloadCompleteForAssets_withError___block_invoke;
    block[3] = &unk_1E57FA038;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(calloutQueue, block);
  }
}

void __80__MPMediaDownloadManager__notifyObserversOfDownloadCompleteForAssets_withError___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_statusChangeObservers", 0);
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
          [v7 downloadManager:*(void *)(a1 + 32) didFinishAsset:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_notifyObserversOfAssetDownloadProgress:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    calloutQueue = self->_calloutQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__MPMediaDownloadManager__notifyObserversOfAssetDownloadProgress___block_invoke;
    v6[3] = &unk_1E57F9F98;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(calloutQueue, v6);
  }
}

void __66__MPMediaDownloadManager__notifyObserversOfAssetDownloadProgress___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_statusChangeObservers", 0);
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
          [v7 downloadManager:*(void *)(a1 + 32) didUpdateDownloadProgress:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)_updateCacheAndGetMediaDownloadToReportForStoreDownloadProgress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "libraryItemIdentifier"));
  uint64_t v6 = [(NSMutableDictionary *)self->_cachedProgressMap objectForKey:v5];
  [v4 percentComplete];
  if (v6)
  {
    double v8 = v7;
    [(MPMediaDownload *)v6 downloadProgress];
    if (vabdd_f64(v8, v9) <= 0.000001)
    {

      uint64_t v6 = 0;
    }
    else
    {
      [(MPMediaDownload *)v6 setDownloadProgress:v8];
    }
  }
  else
  {
    uint64_t v6 = [[MPMediaDownload alloc] initWithMPStoreDownload:v4];
    if (v6) {
      [(NSMutableDictionary *)self->_cachedProgressMap setObject:v6 forKey:v5];
    }
  }

  return v6;
}

- (id)_updateCacheAndGetItemToReportForATAssetDownloadPauseReasonChange:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = NSNumber;
  uint64_t v6 = [v4 identifier];
  double v7 = objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v6, "longLongValue"));

  double v8 = [(NSMutableDictionary *)self->_cachedATPausedDownloads objectForKey:v7];
  if (v8)
  {
    double v9 = v8;
    uint64_t v10 = [(MPMediaDownload *)v8 downloadPausedReason];
    unint64_t v11 = +[MPMediaDownload MPMediaDownloadPauseReasonForATAsset:v4];
    if (v10 == v11)
    {
      int v12 = v10;
    }
    else
    {
      int v12 = v11;
      [(MPMediaDownload *)v9 setDownloadPausedReason:v11];
      if (![(MPMediaDownload *)v9 downloadPausedReason]) {
        [(NSMutableDictionary *)self->_cachedATPausedDownloads removeObjectForKey:v7];
      }
    }
  }
  else
  {
    int v12 = +[MPMediaDownload MPMediaDownloadPauseReasonForATAsset:v4];
    double v9 = [[MPMediaDownload alloc] initWithATAsset:v4];
    if ([(MPMediaDownload *)v9 downloadPausedReason]) {
      [(NSMutableDictionary *)self->_cachedATPausedDownloads setObject:v9 forKey:v7];
    }
    LODWORD(v10) = 0;
  }
  uint64_t v13 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v14 = "updated";
    int v16 = 136315906;
    if (!v9) {
      id v14 = "not updated";
    }
    uint64_t v17 = v14;
    __int16 v18 = 2114;
    id v19 = v4;
    __int16 v20 = 1024;
    int v21 = v10;
    __int16 v22 = 1024;
    int v23 = v12;
    _os_log_impl(&dword_1952E8000, v13, OS_LOG_TYPE_DEBUG, "%s cache handling state change for %{public}@ - download pause reason (existing:%d, current:%d)", (uint8_t *)&v16, 0x22u);
  }

  return v9;
}

- (id)_updateCacheAndItemToReportForATAssetDownloadProgressChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSNumber;
  uint64_t v6 = [v4 identifier];
  double v7 = objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v6, "longLongValue"));

  double v8 = [(NSMutableDictionary *)self->_cachedProgressMap objectForKey:v7];
  [v4 downloadProgress];
  if (!v8)
  {
    double v8 = [[MPMediaDownload alloc] initWithATAsset:v4];
    if (!v8) {
      goto LABEL_8;
    }
    [(NSMutableDictionary *)self->_cachedProgressMap setObject:v8 forKey:v7];
    goto LABEL_6;
  }
  double v10 = v9;
  [(MPMediaDownload *)v8 downloadProgress];
  if (vabdd_f64(v10, v11) > 0.000001)
  {
    [(MPMediaDownload *)v8 setDownloadProgress:v10];
LABEL_6:
    [(NSMutableDictionary *)self->_cachedATPausedDownloads removeObjectForKey:v7];
    goto LABEL_8;
  }

  double v8 = 0;
LABEL_8:

  return v8;
}

- (void)atcWillEnqueueDownloads:(id)a3 cancelDownloads:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MPMediaDownloadManager_atcWillEnqueueDownloads_cancelDownloads___block_invoke;
  block[3] = &unk_1E57FA038;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __66__MPMediaDownloadManager_atcWillEnqueueDownloads_cancelDownloads___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*(void *)(a1 + 40) + 24) addObject:*(void *)(*((void *)&v16 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v4);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
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
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "removeObject:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)atcDidUpdateDownloadStateForAssets:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy_;
  long long v15 = __Block_byref_object_dispose_;
  id v16 = [MEMORY[0x1E4F1CA48] array];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MPMediaDownloadManager_atcDidUpdateDownloadStateForAssets___block_invoke;
  block[3] = &unk_1E57F9F48;
  id v6 = v4;
  id v8 = v6;
  uint64_t v9 = self;
  uint64_t v10 = &v11;
  dispatch_async(queue, block);
  [(MPMediaDownloadManager *)self _notifyObserversOfDownloadPauseReasonChangedForAssets:v12[5]];

  _Block_object_dispose(&v11, 8);
}

void __61__MPMediaDownloadManager_atcDidUpdateDownloadStateForAssets___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.mediaplayer", "Download_Oversize");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v21 = v3;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "atcDidUpdateDownloadStateForAssets=%{public}@", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 40), "_isValidMediaAsset:", v9, (void)v15))
        {
          uint64_t v10 = *(void **)(*(void *)(a1 + 40) + 8);
          uint64_t v11 = NSNumber;
          long long v12 = [v9 identifier];
          uint64_t v13 = objc_msgSend(v11, "numberWithLongLong:", objc_msgSend(v12, "longLongValue"));
          [v10 addObject:v13];

          long long v14 = [*(id *)(a1 + 40) _updateCacheAndGetItemToReportForATAssetDownloadPauseReasonChange:v9];
          if (v14) {
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v14];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)atcDidUpdateAsset:(id)a3 withProgress:(float)a4
{
  id v5 = a3;
  if ([(MPMediaDownloadManager *)self _isValidMediaAsset:v5])
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__MPMediaDownloadManager_atcDidUpdateAsset_withProgress___block_invoke;
    v7[3] = &unk_1E57F9F98;
    void v7[4] = self;
    id v8 = v5;
    dispatch_async(queue, v7);
  }
}

void __57__MPMediaDownloadManager_atcDidUpdateAsset_withProgress___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  id v2 = [*(id *)(a1 + 32) _updateCacheAndItemToReportForATAssetDownloadProgressChange:*(void *)(a1 + 40)];
  if (v2) {
    [v3 addObject:v2];
  }
  [*(id *)(a1 + 32) _notifyObserversOfAssetDownloadProgress:v3];
}

- (void)atcDidDownloadAsset:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MPMediaDownloadManager *)self _isValidMediaAsset:v6])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__MPMediaDownloadManager_atcDidDownloadAsset_withError___block_invoke;
    block[3] = &unk_1E57FA038;
    id v10 = v6;
    uint64_t v11 = self;
    id v12 = v7;
    dispatch_async(queue, block);
  }
}

void __56__MPMediaDownloadManager_atcDidDownloadAsset_withError___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = NSNumber;
  id v3 = [*(id *)(a1 + 32) identifier];
  id v4 = objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));

  id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  int v6 = [*(id *)(*(void *)(a1 + 40) + 8) containsObject:v4];
  id v7 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 48);
    int v12 = 138543618;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "atc finished %{public}@ with error %{public}@", (uint8_t *)&v12, 0x16u);
  }

  id v10 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKey:v4];
  if (v10) {
    int v11 = 0;
  }
  else {
    int v11 = v6;
  }
  if (v11 == 1) {
    id v10 = [[MPMediaDownload alloc] initWithATAsset:*(void *)(a1 + 32)];
  }
  if (v10) {
    [v5 addObject:v10];
  }
  [*(id *)(*(void *)(a1 + 40) + 16) removeObjectForKey:v4];
  [*(id *)(*(void *)(a1 + 40) + 8) removeObject:v4];
  [*(id *)(*(void *)(a1 + 40) + 32) removeObjectForKey:v4];
  [*(id *)(a1 + 40) _notifyObserversOfDownloadCompleteForAssets:v5 withError:*(void *)(a1 + 48)];
}

- (void)atcDidEnqueueAsset:(id)a3
{
  id v4 = a3;
  if ([(MPMediaDownloadManager *)self _isValidMediaAsset:v4])
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__MPMediaDownloadManager_atcDidEnqueueAsset___block_invoke;
    v6[3] = &unk_1E57F9F98;
    id v7 = v4;
    uint64_t v8 = self;
    dispatch_async(queue, v6);
  }
}

void __45__MPMediaDownloadManager_atcDidEnqueueAsset___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = NSNumber;
  id v3 = [*(id *)(a1 + 32) identifier];
  id v4 = objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));

  [*(id *)(*(void *)(a1 + 40) + 8) addObject:v4];
  id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  int v6 = [[MPMediaDownload alloc] initWithATAsset:*(void *)(a1 + 32)];
  [v5 addObject:v6];
  if ([v5 count])
  {
    id v7 = os_log_create("com.apple.amp.mediaplayer", "Download");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "atc enqueued %{public}@ for download", buf, 0xCu);
    }

    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = *(NSObject **)(v9 + 80);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__MPMediaDownloadManager_atcDidEnqueueAsset___block_invoke_50;
    v11[3] = &unk_1E57F9F98;
    v11[4] = v9;
    id v12 = v5;
    dispatch_async(v10, v11);
  }
}

void __45__MPMediaDownloadManager_atcDidEnqueueAsset___block_invoke_50(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_statusChangeObservers", 0);
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
          [v7 downloadManager:*(void *)(a1 + 32) didEnqueueAssetDownloads:*(void *)(a1 + 40) didRemoveAssetDownloads:0];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)downloadManager:(id)a3 downloadDidFinish:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__MPMediaDownloadManager_downloadManager_downloadDidFinish___block_invoke;
  v8[3] = &unk_1E57F9F98;
  id v9 = v5;
  long long v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __60__MPMediaDownloadManager_downloadManager_downloadDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "libraryItemIdentifier"));
  uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  uint64_t v4 = [*(id *)(a1 + 32) failureError];

  id v5 = os_log_create("com.apple.amp.mediaplayer", "Download");
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = *(void **)(a1 + 32);
      long long v8 = [v7 failureError];
      id v9 = objc_msgSend(v8, "msv_description");
      int v14 = 138543618;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      long long v17 = v9;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_ERROR, "store download finished %{public}@ error=%{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    long long v10 = *(void **)(a1 + 32);
    int v14 = 138543362;
    uint64_t v15 = v10;
    _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "store download finished %{public}@", (uint8_t *)&v14, 0xCu);
  }

  long long v11 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKey:v2];
  if (v11)
  {
    [v3 addObject:v11];
    [*(id *)(*(void *)(a1 + 40) + 16) removeObjectForKey:v2];
  }
  id v12 = *(void **)(a1 + 40);
  uint64_t v13 = [*(id *)(a1 + 32) failureError];
  [v12 _notifyObserversOfDownloadCompleteForAssets:v3 withError:v13];
}

- (void)downloadManager:(id)a3 downloadsDidProgress:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__MPMediaDownloadManager_downloadManager_downloadsDidProgress___block_invoke;
  v8[3] = &unk_1E57F9F98;
  id v9 = v5;
  long long v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __63__MPMediaDownloadManager_downloadManager_downloadsDidProgress___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA48] array];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = objc_msgSend(*(id *)(a1 + 40), "_updateCacheAndGetMediaDownloadToReportForStoreDownloadProgress:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
        if (v8) {
          [v2 addObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 40) _notifyObserversOfAssetDownloadProgress:v2];
}

- (void)downloadManager:(id)a3 downloadDidProgress:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__MPMediaDownloadManager_downloadManager_downloadDidProgress___block_invoke;
  v8[3] = &unk_1E57F9F98;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __62__MPMediaDownloadManager_downloadManager_downloadDidProgress___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v2 = [*(id *)(a1 + 32) _updateCacheAndGetMediaDownloadToReportForStoreDownloadProgress:*(void *)(a1 + 40)];
  if (v2) {
    [v3 addObject:v2];
  }
  [*(id *)(a1 + 32) _notifyObserversOfAssetDownloadProgress:v3];
}

- (void)downloadManager:(id)a3 didAddDownloads:(id)a4 removeDownloads:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__MPMediaDownloadManager_downloadManager_didAddDownloads_removeDownloads___block_invoke;
  block[3] = &unk_1E57FA038;
  id v13 = v7;
  id v14 = v8;
  uint64_t v15 = self;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(calloutQueue, block);
}

void __74__MPMediaDownloadManager_downloadManager_didAddDownloads_removeDownloads___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = +[MPMediaDownload MPMediaDownloadsFromMPStoreDownloads:*(void *)(a1 + 32)];
  id v3 = +[MPMediaDownload MPMediaDownloadsFromMPStoreDownloads:*(void *)(a1 + 40)];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 48), "_statusChangeObservers", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 downloadManager:*(void *)(a1 + 48) didEnqueueAssetDownloads:v2 didRemoveAssetDownloads:v3];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)downloadLibraryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__MPMediaDownloadManager_downloadLibraryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E57F9140;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __63__MPMediaDownloadManager_downloadLibraryWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _keepLocalTaskConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__MPMediaDownloadManager_downloadLibraryWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E57F90A0;
  id v7 = *(id *)(a1 + 40);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v6];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__MPMediaDownloadManager_downloadLibraryWithCompletionHandler___block_invoke_46;
  v4[3] = &unk_1E57F90A0;
  id v5 = *(id *)(a1 + 40);
  [v3 downloadLibraryWithCompletionBlock:v4];
}

void __63__MPMediaDownloadManager_downloadLibraryWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "error %{public}@ initiating a keep local session to download music library", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __63__MPMediaDownloadManager_downloadLibraryWithCompletionHandler___block_invoke_46(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.mediaplayer", "Download");
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = objc_msgSend(v3, "msv_description");
      int v8 = 138543618;
      id v9 = v3;
      __int16 v10 = 2114;
      long long v11 = v6;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "initiated a keep local session to download library with error %{public}@ error=%{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = 0;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "initiated a keep local session to download library with error %{public}@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (id)downloadForIdentifierSet:(id)a3 downloadState:(int64_t *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy_;
  __int16 v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  if (a4) {
    *a4 = 0;
  }
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__MPMediaDownloadManager_downloadForIdentifierSet_downloadState___block_invoke;
  v11[3] = &unk_1E57F4790;
  id v12 = v6;
  long long v13 = self;
  id v14 = &v16;
  uint64_t v15 = a4;
  id v8 = v6;
  dispatch_sync(queue, v11);
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v9;
}

void __65__MPMediaDownloadManager_downloadForIdentifierSet_downloadState___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) library];
  uint64_t v3 = [v2 persistentID];

  if (!v3)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      return;
    }
    goto LABEL_33;
  }
  id v4 = *(void **)(*(void *)(a1 + 40) + 16);
  unint64_t v5 = 0x1E4F28000uLL;
  id v6 = [NSNumber numberWithLongLong:v3];
  uint64_t v7 = [v4 objectForKey:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    goto LABEL_33;
  }
  __int16 v10 = [*(id *)(a1 + 32) universalStore];
  uint64_t v11 = [v10 adamID];

  id v12 = [*(id *)(a1 + 32) universalStore];
  uint64_t v13 = [v12 subscriptionAdamID];

  if (v11 | v13)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v14 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "allValues", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      id v17 = 0;
      uint64_t v18 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(v14);
          }
          __int16 v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (v11 && [*(id *)(*((void *)&v32 + 1) + 8 * i) storeItemID] == v11)
          {
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v20);
            goto LABEL_27;
          }
          if (!v17 && v13)
          {
            if ([v20 storeItemID] == v13) {
              id v17 = v20;
            }
            else {
              id v17 = 0;
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v17 = 0;
    }
LABEL_27:

    uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v30 = *(void *)(v28 + 40);
    v29 = (id *)(v28 + 40);
    if (v30) {
      BOOL v31 = 1;
    }
    else {
      BOOL v31 = v17 == 0;
    }
    if (!v31) {
      objc_storeStrong(v29, v17);
    }

    unint64_t v5 = 0x1E4F28000;
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      goto LABEL_33;
    }
    goto LABEL_22;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
LABEL_33:
    v26 = *(uint64_t **)(a1 + 56);
    if (!v26) {
      return;
    }
    uint64_t v27 = 1;
    goto LABEL_35;
  }
LABEL_22:
  id v21 = *(void **)(*(void *)(a1 + 40) + 32);
  uint64_t v22 = [*(id *)(v5 + 3792) numberWithLongLong:v3];
  uint64_t v23 = [v21 objectForKey:v22];
  uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    v26 = *(uint64_t **)(a1 + 56);
    if (v26)
    {
      uint64_t v27 = 2;
LABEL_35:
      uint64_t *v26 = v27;
    }
  }
}

- (id)activeDownloadForStoreID:(int64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  __int16 v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MPMediaDownloadManager_activeDownloadForStoreID___block_invoke;
  block[3] = &unk_1E57FA120;
  void block[5] = &v7;
  block[6] = a3;
  void block[4] = self;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __51__MPMediaDownloadManager_activeDownloadForStoreID___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = objc_msgSend(*(id *)(a1[4] + 16), "allValues", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v7 storeItemID] == a1[6])
        {
          objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)activeDownloadForMediaItemPersistentID:(int64_t)a3
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy_;
  long long v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MPMediaDownloadManager_activeDownloadForMediaItemPersistentID___block_invoke;
  block[3] = &unk_1E57FA120;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __65__MPMediaDownloadManager_activeDownloadForMediaItemPersistentID___block_invoke(void *a1)
{
  id v2 = *(void **)(a1[4] + 16);
  id v6 = [NSNumber numberWithLongLong:a1[6]];
  uint64_t v3 = [v2 objectForKey:v6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)sendKeepLocalStatusChanged:(int64_t)a3 forLibraryIdentifier:(int64_t)a4 entityType:(int64_t)a5 withCompletionHandler:(id)a6
{
  id v10 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__MPMediaDownloadManager_sendKeepLocalStatusChanged_forLibraryIdentifier_entityType_withCompletionHandler___block_invoke;
  block[3] = &unk_1E57ED9B0;
  int64_t v15 = a4;
  int64_t v16 = a5;
  int64_t v17 = a3;
  void block[4] = self;
  id v14 = v10;
  id v12 = v10;
  dispatch_async(queue, block);
}

void __107__MPMediaDownloadManager_sendKeepLocalStatusChanged_forLibraryIdentifier_entityType_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _keepLocalTaskConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __107__MPMediaDownloadManager_sendKeepLocalStatusChanged_forLibraryIdentifier_entityType_withCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E57ED988;
  long long v14 = *(_OWORD *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 64);
  id v13 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v12];
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __107__MPMediaDownloadManager_sendKeepLocalStatusChanged_forLibraryIdentifier_entityType_withCompletionHandler___block_invoke_45;
  v7[3] = &unk_1E57ED988;
  uint64_t v9 = v6;
  uint64_t v10 = v5;
  uint64_t v11 = v4;
  id v8 = *(id *)(a1 + 40);
  [v3 handleKeepLocalStatusChanged:v4 forLibraryIdentifier:v6 entityType:v5 withCompletionBlock:v7];
}

void __107__MPMediaDownloadManager_sendKeepLocalStatusChanged_forLibraryIdentifier_entityType_withCompletionHandler___block_invoke_2(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[6];
    uint64_t v7 = a1[7];
    int v9 = 138544130;
    id v10 = v3;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    __int16 v13 = 1024;
    int v14 = v6;
    __int16 v15 = 1024;
    int v16 = v7;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "error %{public}@ initiating a keep local session for libraryIdentifier %lld, mediaType:%d, keep local status:%d", (uint8_t *)&v9, 0x22u);
  }

  uint64_t v8 = a1[4];
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

void __107__MPMediaDownloadManager_sendKeepLocalStatusChanged_forLibraryIdentifier_entityType_withCompletionHandler___block_invoke_45(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.mediaplayer", "Download");
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = a1[5];
      uint64_t v7 = a1[6];
      uint64_t v8 = a1[7];
      int v9 = objc_msgSend(v3, "msv_description");
      int v14 = 134218754;
      uint64_t v15 = v6;
      __int16 v16 = 1024;
      int v17 = v7;
      __int16 v18 = 1024;
      int v19 = v8;
      __int16 v20 = 2114;
      id v21 = v9;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "initiated a keep local session for libraryIdentifier %llu mediaType:%d new keep local status:%d error=%{public}@", (uint8_t *)&v14, 0x22u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = a1[5];
    uint64_t v11 = a1[6];
    uint64_t v12 = a1[7];
    int v14 = 134218496;
    uint64_t v15 = v10;
    __int16 v16 = 1024;
    int v17 = v11;
    __int16 v18 = 1024;
    int v19 = v12;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "initiated a keep local session for libraryIdentifier %llu mediaType:%d new keep local status:%d", (uint8_t *)&v14, 0x18u);
  }

  uint64_t v13 = a1[4];
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);
  }
}

- (void)enqueueAssetForDownload:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__MPMediaDownloadManager_enqueueAssetForDownload_withCompletionHandler___block_invoke;
  block[3] = &unk_1E57F53B8;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __72__MPMediaDownloadManager_enqueueAssetForDownload_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _keepLocalTaskConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__MPMediaDownloadManager_enqueueAssetForDownload_withCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E57F5158;
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 48);
  void v12[4] = v4;
  id v13 = v3;
  uint64_t v5 = [v2 remoteObjectProxyWithErrorHandler:v12];
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__MPMediaDownloadManager_enqueueAssetForDownload_withCompletionHandler___block_invoke_2_43;
  v9[3] = &unk_1E57F5158;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v11 = v7;
  v9[4] = v8;
  id v10 = v6;
  [v5 enqueueAssetForDownload:v7 withCompletionBlock:v9];
}

void __72__MPMediaDownloadManager_enqueueAssetForDownload_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    id v13 = v3;
    __int16 v14 = 2048;
    uint64_t v15 = v5;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "error %{public}@ enqueuing download persistent id:%lld with atc", buf, 0x16u);
  }

  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__MPMediaDownloadManager_enqueueAssetForDownload_withCompletionHandler___block_invoke_42;
  v9[3] = &unk_1E57F9140;
  id v7 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(v6, v9);
}

void __72__MPMediaDownloadManager_enqueueAssetForDownload_withCompletionHandler___block_invoke_2_43(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.mediaplayer", "Download");
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      id v7 = objc_msgSend(v3, "msv_description");
      *(_DWORD *)buf = 134218242;
      uint64_t v16 = v6;
      __int16 v17 = 2114;
      __int16 v18 = v7;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "finished enqueuing download persistent id: %lld with atc error=%{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "finished enqueuing download persistent id: %lld with atc", buf, 0xCu);
  }

  int v9 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__MPMediaDownloadManager_enqueueAssetForDownload_withCompletionHandler___block_invoke_44;
  v12[3] = &unk_1E57F9140;
  id v10 = *(id *)(a1 + 40);
  id v13 = v3;
  id v14 = v10;
  id v11 = v3;
  dispatch_async(v9, v12);
}

uint64_t __72__MPMediaDownloadManager_enqueueAssetForDownload_withCompletionHandler___block_invoke_44(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __72__MPMediaDownloadManager_enqueueAssetForDownload_withCompletionHandler___block_invoke_42(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)prioritizeDownload:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__MPMediaDownloadManager_prioritizeDownload___block_invoke;
  v4[3] = &unk_1E57F8328;
  void v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

void __45__MPMediaDownloadManager_prioritizeDownload___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134217984;
    uint64_t v24 = v3;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "prioritizing download with persistentId:%lld", buf, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 56) userDownloads];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v9 libraryItemIdentifier] == *(void *)(a1 + 40))
        {
          id v21 = v9;
          id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
          [*(id *)(*(void *)(a1 + 32) + 56) resumeDownloads:v13];
          [*(id *)(*(void *)(a1 + 32) + 56) prioritizeDownloads:v13];
          id v14 = os_log_create("com.apple.amp.mediaplayer", "Download");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 134217984;
            uint64_t v24 = v15;
            _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_DEFAULT, "prioritized download with identifier %llu with the store", buf, 0xCu);
          }

          uint64_t v12 = v4;
          goto LABEL_17;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v10 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134217984;
    uint64_t v24 = v11;
    _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEFAULT, "identifier %llu not found in the store queue", buf, 0xCu);
  }

  uint64_t v12 = [*(id *)(a1 + 32) _downloadProgressConnection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __45__MPMediaDownloadManager_prioritizeDownload___block_invoke_40;
  v16[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v16[4] = *(void *)(a1 + 40);
  id v13 = [v12 remoteObjectProxyWithErrorHandler:v16];
  objc_msgSend(v13, "prioritizeDownloadWithStoreForLibraryIdentifier:withReplyBlock:", MEMORY[0x1E4F143A8], 3221225472, __45__MPMediaDownloadManager_prioritizeDownload___block_invoke_41, &__block_descriptor_40_e17_v16__0__NSError_8l, *(void *)(a1 + 40));
LABEL_17:
}

void __45__MPMediaDownloadManager_prioritizeDownload___block_invoke_40(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    id v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "error %{public}@ prioritizing download identifier %llu with atc", (uint8_t *)&v6, 0x16u);
  }
}

void __45__MPMediaDownloadManager_prioritizeDownload___block_invoke_41(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.mediaplayer", "Download");
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = objc_msgSend(v3, "msv_description");
      int v9 = 134218242;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      uint64_t v12 = v7;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "prioritized download for identifier %llu with atc error=%{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 134217984;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "prioritized download for identifier %llu with atc", (uint8_t *)&v9, 0xCu);
  }
}

- (BOOL)hasActiveDownloads
{
  id v3 = [(MPStoreDownloadManager *)self->_storeDownloadManager userDownloads];
  if ([v3 count]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(NSMutableOrderedSet *)self->_cachedATDownloads count] != 0;
  }

  return v4;
}

- (int64_t)activeDownloadsCount
{
  id v3 = [(MPStoreDownloadManager *)self->_storeDownloadManager userDownloads];
  uint64_t v4 = [v3 count];
  int64_t v5 = [(NSMutableOrderedSet *)self->_cachedATDownloads count] + v4;

  return v5;
}

- (NSArray)allMediaDownloadLibraryIdentifiers
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  uint64_t v4 = [(MPStoreDownloadManager *)self->_storeDownloadManager userDownloads];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (([v9 isCanceled] & 1) == 0)
        {
          uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "libraryItemIdentifier"));
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }
  queue = self->_queue;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  long long v18 = __60__MPMediaDownloadManager_allMediaDownloadLibraryIdentifiers__block_invoke;
  long long v19 = &unk_1E57F9F98;
  long long v20 = self;
  id v21 = v3;
  id v12 = v3;
  dispatch_sync(queue, &v16);
  id v13 = [(MPMediaDownloadManager *)self _downloadProgressConnection];
  id v14 = [v12 array];

  return (NSArray *)v14;
}

void __60__MPMediaDownloadManager_allMediaDownloadLibraryIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "addObject:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)cancelDownloads:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__MPMediaDownloadManager_cancelDownloads___block_invoke;
  v7[3] = &unk_1E57F9F98;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __42__MPMediaDownloadManager_cancelDownloads___block_invoke(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [v3 valueForKey:@"longLongValue"];
  uint64_t v5 = [v2 dictionaryWithObjects:v3 forKeys:v4];

  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [*(id *)(*(void *)(a1 + 40) + 56) downloads];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v51 != v9) {
          objc_enumerationMutation(obj);
        }
        __int16 v11 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v11, "libraryItemIdentifier"));
        id v13 = [v5 objectForKey:v12];

        if (v13)
        {
          [v6 setObject:v11 forKey:v12];
          [v5 removeObjectForKey:v12];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v8);
  }
  id v14 = (void *)MEMORY[0x1E4F1CA70];
  uint64_t v15 = [v5 allKeys];
  uint64_t v16 = [v14 orderedSetWithArray:v15];

  uint64_t v17 = [v6 allKeys];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v47 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v46 + 1) + 8 * j);
        if ([*(id *)(*(void *)(a1 + 40) + 8) containsObject:v22]) {
          [v16 addObject:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v19);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v23 = *(id *)(*(void *)(a1 + 40) + 24);
  uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v55 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v43;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v43 != v26) {
          objc_enumerationMutation(v23);
        }
        [v16 addObject:*(void *)(*((void *)&v42 + 1) + 8 * k)];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v42 objects:v55 count:16];
    }
    while (v25);
  }

  uint64_t v28 = +[MPMediaLibrary deviceMediaLibrary];
  v54[0] = @"keepLocal";
  v54[1] = @"keepLocalStatus";
  v54[2] = @"keepLocalStatusReason";
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:3];
  uint64_t v30 = [v16 array];
  [v28 setValues:&unk_1EE6ED568 forProperties:v29 forItemPersistentIDs:v30];

  BOOL v31 = [*(id *)(a1 + 40) _keepLocalTaskConnection];
  long long v32 = [v31 remoteObjectProxyWithErrorHandler:&__block_literal_global_27];
  [v32 cancelDownloadsForMediaTypes:&unk_1EE6ED580];

  long long v33 = *(void **)(*(void *)(a1 + 40) + 56);
  long long v34 = [v6 allValues];
  [v33 cancelDownloads:v34];

  [*(id *)(*(void *)(a1 + 40) + 8) removeAllObjects];
  [*(id *)(*(void *)(a1 + 40) + 24) removeAllObjects];
  [*(id *)(*(void *)(a1 + 40) + 16) removeAllObjects];
  [*(id *)(*(void *)(a1 + 40) + 32) removeAllObjects];
  uint64_t v35 = *(void *)(a1 + 40);
  id v36 = *(NSObject **)(v35 + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MPMediaDownloadManager_cancelDownloads___block_invoke_36;
  block[3] = &unk_1E57F9F98;
  id v40 = obj;
  uint64_t v41 = v35;
  id v37 = obj;
  dispatch_async(v36, block);
}

void __42__MPMediaDownloadManager_cancelDownloads___block_invoke_36(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = +[MPMediaDownload MPMediaDownloadsFromMPStoreDownloads:*(void *)(a1 + 32)];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "_statusChangeObservers", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 downloadManager:*(void *)(a1 + 40) didCancelAssets:v2];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

void __42__MPMediaDownloadManager_cancelDownloads___block_invoke_24(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = os_log_create("com.apple.amp.mediaplayer", "Download");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_ERROR, "error %{public}@ cancelling downloads with ATC", (uint8_t *)&v4, 0xCu);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__MPMediaDownloadManager_unregisterObserver___block_invoke;
  v7[3] = &unk_1E57F9F98;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __45__MPMediaDownloadManager_unregisterObserver___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return objc_msgSend(*(id *)(*(void *)(result + 40) + 64), "removeObject:");
  }
  return result;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->__downloadProgressConnection invalidate];
  [(NSXPCConnection *)self->__keepLocalTaskConnection invalidate];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  getATStartupCompleteNotification();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);
  v5.receiver = self;
  v5.super_class = (Class)MPMediaDownloadManager;
  [(MPMediaDownloadManager *)&v5 dealloc];
}

- (MPMediaDownloadManager)init
{
  return 0;
}

@end