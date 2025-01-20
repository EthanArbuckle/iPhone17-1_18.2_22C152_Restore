@interface MPStoreDownloadManager
+ (id)sharedManager;
- (BOOL)_isActiveDownload:(id)a3;
- (BOOL)_onQueue_hasExistingDownloadForStoreDownload:(id)a3;
- (BOOL)_shouldHideDownload:(id)a3;
- (BOOL)hasFetchedInitialDownloads;
- (BOOL)isUsingNetwork;
- (MPStoreDownloadManager)init;
- (NSArray)activeDownloads;
- (NSArray)downloads;
- (NSArray)userDownloads;
- (id)_existingDownloadForSSDownload:(id)a3;
- (id)_init;
- (id)_observersForAllDownloads;
- (id)_observersForDownload:(id)a3;
- (id)_onQueue_findStoreDownloadWithSSDownload:(id)a3 SSPurchase:(id)a4;
- (id)activeDownloadForMediaItemPersistentID:(unint64_t)a3;
- (id)activeDownloadForStoreID:(int64_t)a3;
- (id)addDownloads:(id)a3;
- (id)downloadForDownloadPersistentIdentifier:(int64_t)a3;
- (id)downloadForMediaItem:(id)a3;
- (id)downloadForMediaItemPersistentID:(unint64_t)a3;
- (id)downloadForStoreID:(int64_t)a3;
- (void)_addNonCancelledDownloadsToActiveList:(id)a3;
- (void)_addPurchaseFinishedHandler:(id)a3 forDownloads:(id)a4;
- (void)_onQueue_addDownloadToMapTables:(id)a3;
- (void)_onQueue_removeDownloadFromMapTables:(id)a3;
- (void)_registerBlockObserver:(id)a3;
- (void)_sendActiveDownloadsDidChangeToObserversWithAddedDownloads:(id)a3 removedDownloads:(id)a4;
- (void)_sendDownloadsDidChangeToObserversWithAddedDownloads:(id)a3 removedDownloads:(id)a4;
- (void)_sendDownloadsDidFinishPurchasesToObserversForDownloads:(id)a3;
- (void)_sendDownloadsDidFinishToObserversForDownloads:(id)a3 notifyDownloadManager:(BOOL)a4 completionHandler:(id)a5;
- (void)_sendDownloadsDidProgressToObserversForDownloads:(id)a3;
- (void)_unregisterBlockObserver:(id)a3;
- (void)_updateActiveDownloadsWithCancelledDownloads:(id)a3;
- (void)_updateActiveDownloadsWithChangedActiveDownloads:(id)a3 inactiveDownloads:(id)a4;
- (void)_updateDownloadsWithAdditions:(id)a3 removals:(id)a4;
- (void)_updateMediaItemPropertiesForFinishedStoreDownload:(id)a3 SSDownload:(id)a4;
- (void)addFinishHandler:(id)a3 forDownloads:(id)a4;
- (void)addObserver:(id)a3 forDownloads:(id)a4;
- (void)cancelDownloads:(id)a3;
- (void)dealloc;
- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4;
- (void)downloadManagerNetworkUsageDidChange:(id)a3;
- (void)pauseDownloads:(id)a3;
- (void)prioritizeDownloads:(id)a3;
- (void)purchaseManager:(id)a3 didFinishPurchasesWithResponses:(id)a4;
- (void)reloadFromServer;
- (void)removeObserver:(id)a3 forDownloads:(id)a4;
- (void)requestPermissionToDownloadWithType:(int64_t)a3 completionHandler:(id)a4;
- (void)restartDownloads:(id)a3;
- (void)resumeDownloads:(id)a3;
@end

@implementation MPStoreDownloadManager

void __39__MPStoreDownloadManager_sharedManager__block_invoke()
{
  uint64_t v0 = [objc_alloc((Class)objc_opt_class()) _init];
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = v0;
}

uint64_t __52__MPStoreDownloadManager_hasFetchedInitialDownloads__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 104);
  return result;
}

void __59__MPStoreDownloadManager_downloadForMediaItemPersistentID___block_invoke(void *a1)
{
  uint64_t v2 = NSMapGet(*(NSMapTable **)(a1[4] + 80), a1 + 6);
  uint64_t v3 = *(void *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __45__MPStoreDownloadManager_downloadForStoreID___block_invoke(void *a1)
{
  uint64_t v2 = NSMapGet(*(NSMapTable **)(a1[4] + 96), a1 + 6);
  uint64_t v3 = *(void *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)downloadForMediaItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 persistentID];
  if (!v5
    || ([(MPStoreDownloadManager *)self downloadForMediaItemPersistentID:v5],
        (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = [v4 valueForProperty:@"storeItemAdamID"];
    v6 = (void *)[v7 longLongValue];

    if (v6)
    {
      v6 = [(MPStoreDownloadManager *)self downloadForStoreID:v6];
    }
  }

  return v6;
}

- (id)downloadForStoreID:(int64_t)a3
{
  if (a3)
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__56245;
    v11 = __Block_byref_object_dispose__56246;
    id v12 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__MPStoreDownloadManager_downloadForStoreID___block_invoke;
    block[3] = &unk_1E57FA120;
    block[5] = &v7;
    block[6] = a3;
    block[4] = self;
    dispatch_sync(accessQueue, block);
    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)downloadForMediaItemPersistentID:(unint64_t)a3
{
  if (a3)
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__56245;
    v11 = __Block_byref_object_dispose__56246;
    id v12 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__MPStoreDownloadManager_downloadForMediaItemPersistentID___block_invoke;
    block[3] = &unk_1E57FA120;
    block[5] = &v7;
    block[6] = a3;
    block[4] = self;
    dispatch_sync(accessQueue, block);
    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)hasFetchedInitialDownloads
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__MPStoreDownloadManager_hasFetchedInitialDownloads__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__MPStoreDownloadManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_56383 != -1) {
    dispatch_once(&sharedManager_onceToken_56383, block);
  }
  uint64_t v2 = (void *)sharedManager_sharedManager;

  return v2;
}

- (void)addObserver:(id)a3 forDownloads:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__MPStoreDownloadManager_addObserver_forDownloads___block_invoke;
    block[3] = &unk_1E57FA038;
    id v11 = v7;
    id v12 = self;
    id v13 = v6;
    dispatch_barrier_sync(accessQueue, block);
  }
}

- (id)_init
{
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  v150.receiver = self;
  v150.super_class = (Class)MPStoreDownloadManager;
  uint64_t v2 = [(MPStoreDownloadManager *)&v150 init];
  if (!v2) {
    return v2;
  }
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.MediaPlayer.MPStoreDownloadManager.accessQueue", MEMORY[0x1E4F14430]);
  accessQueue = v2->_accessQueue;
  v2->_accessQueue = (OS_dispatch_queue *)v3;

  dispatch_queue_t v5 = dispatch_queue_create("com.apple.MediaPlayer.MPStoreDownloadManager.calloutQueue", 0);
  calloutSerialQueue = v2->_calloutSerialQueue;
  v2->_calloutSerialQueue = (OS_dispatch_queue *)v5;

  id v145 = objc_alloc_init(MEMORY[0x1E4F28F58]);
  [v145 setAcquireFunction:_MPStoreDownloadManagerInt64KeyPointerFunctionAcquire];
  [v145 setRelinquishFunction:_MPStoreDownloadManagerInt64KeyPointerFunctionRelinquish];
  [v145 setHashFunction:_MPStoreDownloadManagerInt64KeyPointerFunctionHash];
  [v145 setIsEqualFunction:_MPStoreDownloadManagerInt64KeyPointerFunctionIsEqual];
  [v145 setSizeFunction:_MPStoreDownloadManagerInt64KeyPointerFunctionSize];
  [v145 setDescriptionFunction:_MPStoreDownloadManagerInt64KeyPointerFunctionDescription];
  v143 = (void *)[objc_alloc(MEMORY[0x1E4F28F58]) initWithOptions:5];
  id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  downloads = v2->_downloads;
  v2->_downloads = v7;

  char v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  userDownloads = v2->_userDownloads;
  v2->_userDownloads = v9;

  uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyPointerFunctions:v145 valuePointerFunctions:v143 capacity:0];
  storeIdentifiersToDownloads = v2->_storeIdentifiersToDownloads;
  v2->_storeIdentifiersToDownloads = (NSMapTable *)v11;

  uint64_t v13 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyPointerFunctions:v145 valuePointerFunctions:v143 capacity:0];
  libraryIdentifiersToDownloads = v2->_libraryIdentifiersToDownloads;
  v2->_libraryIdentifiersToDownloads = (NSMapTable *)v13;

  uint64_t v15 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyPointerFunctions:v145 valuePointerFunctions:v143 capacity:0];
  downloadIdentifiersToDownloads = v2->_downloadIdentifiersToDownloads;
  v2->_downloadIdentifiersToDownloads = (NSMapTable *)v15;

  uint64_t v156 = 0;
  v157 = &v156;
  uint64_t v158 = 0x2050000000;
  v17 = (void *)getSSDownloadManagerOptionsClass_softClass;
  uint64_t v159 = getSSDownloadManagerOptionsClass_softClass;
  if (!getSSDownloadManagerOptionsClass_softClass)
  {
    uint64_t v151 = MEMORY[0x1E4F143A8];
    uint64_t v152 = 3221225472;
    v153 = __getSSDownloadManagerOptionsClass_block_invoke;
    v154 = &unk_1E57FA300;
    v155 = &v156;
    __getSSDownloadManagerOptionsClass_block_invoke((uint64_t)&v151);
    v17 = (void *)v157[3];
  }
  v18 = v17;
  _Block_object_dispose(&v156, 8);
  id v144 = objc_alloc_init(v18);
  v19 = [MEMORY[0x1E4F28B50] mainBundle];
  v142 = [v19 bundleIdentifier];

  if ([v142 isEqualToString:@"com.apple.Music"])
  {
    uint64_t v156 = 0;
    v157 = &v156;
    uint64_t v158 = 0x2020000000;
    v20 = (id *)getSSDownloadKindMusicSymbolLoc_ptr_56319;
    uint64_t v159 = getSSDownloadKindMusicSymbolLoc_ptr_56319;
    if (!getSSDownloadKindMusicSymbolLoc_ptr_56319)
    {
      uint64_t v151 = MEMORY[0x1E4F143A8];
      uint64_t v152 = 3221225472;
      v153 = __getSSDownloadKindMusicSymbolLoc_block_invoke_56320;
      v154 = &unk_1E57FA300;
      v155 = &v156;
      v21 = StoreServicesLibrary_56185();
      v22 = dlsym(v21, "SSDownloadKindMusic");
      *(void *)(v155[1] + 24) = v22;
      getSSDownloadKindMusicSymbolLoc_ptr_56319 = *(void *)(v155[1] + 24);
      v20 = (id *)v157[3];
    }
    _Block_object_dispose(&v156, 8);
    if (v20)
    {
      id v23 = *v20;
      id v166 = v23;
      uint64_t v156 = 0;
      v157 = &v156;
      uint64_t v158 = 0x2020000000;
      v24 = (id *)getSSDownloadKindMusicVideoSymbolLoc_ptr;
      uint64_t v159 = getSSDownloadKindMusicVideoSymbolLoc_ptr;
      if (!getSSDownloadKindMusicVideoSymbolLoc_ptr)
      {
        uint64_t v151 = MEMORY[0x1E4F143A8];
        uint64_t v152 = 3221225472;
        v153 = __getSSDownloadKindMusicVideoSymbolLoc_block_invoke;
        v154 = &unk_1E57FA300;
        v155 = &v156;
        v25 = StoreServicesLibrary_56185();
        v26 = dlsym(v25, "SSDownloadKindMusicVideo");
        *(void *)(v155[1] + 24) = v26;
        getSSDownloadKindMusicVideoSymbolLoc_ptr = *(void *)(v155[1] + 24);
        v24 = (id *)v157[3];
      }
      _Block_object_dispose(&v156, 8);
      if (v24)
      {
        id v167 = *v24;
        id v27 = v167;
        v28 = getSSDownloadKindTelevisionEpisode();
        v168 = v28;
        v29 = getSSDownloadKindMovie();
        v169 = v29;
        v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v166 count:4];
        [v144 setDownloadKinds:v30];

        v31 = getSSDownloadKindMovie();
        v164[0] = v31;
        v165[0] = v142;
        v32 = getSSDownloadKindTelevisionEpisode();
        v164[1] = v32;
        v165[1] = v142;
        uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v165 forKeys:v164 count:2];
        downloadKindToRequiredClientBundleIdentifiers = v2->_downloadKindToRequiredClientBundleIdentifiers;
        v2->_downloadKindToRequiredClientBundleIdentifiers = (NSDictionary *)v33;

        goto LABEL_13;
      }
      v135 = [MEMORY[0x1E4F28B00] currentHandler];
      v136 = [NSString stringWithUTF8String:"NSString *getSSDownloadKindMusicVideo(void)"];
      objc_msgSend(v135, "handleFailureInFunction:file:lineNumber:description:", v136, @"MPStoreDownloadManager.m", 45, @"%s", dlerror());
    }
    else
    {
      v133 = [MEMORY[0x1E4F28B00] currentHandler];
      v134 = [NSString stringWithUTF8String:"NSString *getSSDownloadKindMusic(void)"];
      objc_msgSend(v133, "handleFailureInFunction:file:lineNumber:description:", v134, @"MPStoreDownloadManager.m", 44, @"%s", dlerror());
    }
LABEL_71:
    __break(1u);
  }
  v31 = [getSSDownloadManagerClass() IPodDownloadKinds];
  [v144 setDownloadKinds:v31];
LABEL_13:

  [v144 setPersistenceIdentifier:@"com.apple.MediaPlayer.MPStoreDownloadManager"];
  uint64_t v156 = 0;
  v157 = &v156;
  uint64_t v158 = 0x2020000000;
  v35 = (id *)getSSDownloadExternalPropertyBytesDownloadedSymbolLoc_ptr;
  uint64_t v159 = getSSDownloadExternalPropertyBytesDownloadedSymbolLoc_ptr;
  if (!getSSDownloadExternalPropertyBytesDownloadedSymbolLoc_ptr)
  {
    uint64_t v151 = MEMORY[0x1E4F143A8];
    uint64_t v152 = 3221225472;
    v153 = __getSSDownloadExternalPropertyBytesDownloadedSymbolLoc_block_invoke;
    v154 = &unk_1E57FA300;
    v155 = &v156;
    v36 = StoreServicesLibrary_56185();
    v37 = dlsym(v36, "SSDownloadExternalPropertyBytesDownloaded");
    *(void *)(v155[1] + 24) = v37;
    getSSDownloadExternalPropertyBytesDownloadedSymbolLoc_ptr = *(void *)(v155[1] + 24);
    v35 = (id *)v157[3];
  }
  _Block_object_dispose(&v156, 8);
  if (!v35)
  {
    v107 = [MEMORY[0x1E4F28B00] currentHandler];
    v108 = [NSString stringWithUTF8String:"NSString *getSSDownloadExternalPropertyBytesDownloaded(void)"];
    objc_msgSend(v107, "handleFailureInFunction:file:lineNumber:description:", v108, @"MPStoreDownloadManager.m", 61, @"%s", dlerror());

    goto LABEL_71;
  }
  id v38 = *v35;
  v162[0] = v38;
  uint64_t v156 = 0;
  v157 = &v156;
  uint64_t v158 = 0x2020000000;
  v39 = (id *)getSSDownloadExternalPropertyPercentCompleteSymbolLoc_ptr;
  uint64_t v159 = getSSDownloadExternalPropertyPercentCompleteSymbolLoc_ptr;
  if (!getSSDownloadExternalPropertyPercentCompleteSymbolLoc_ptr)
  {
    uint64_t v151 = MEMORY[0x1E4F143A8];
    uint64_t v152 = 3221225472;
    v153 = __getSSDownloadExternalPropertyPercentCompleteSymbolLoc_block_invoke;
    v154 = &unk_1E57FA300;
    v155 = &v156;
    v40 = StoreServicesLibrary_56185();
    v41 = dlsym(v40, "SSDownloadExternalPropertyPercentComplete");
    *(void *)(v155[1] + 24) = v41;
    getSSDownloadExternalPropertyPercentCompleteSymbolLoc_ptr = *(void *)(v155[1] + 24);
    v39 = (id *)v157[3];
  }
  _Block_object_dispose(&v156, 8);
  if (!v39)
  {
    v109 = [MEMORY[0x1E4F28B00] currentHandler];
    v110 = [NSString stringWithUTF8String:"NSString *getSSDownloadExternalPropertyPercentComplete(void)"];
    objc_msgSend(v109, "handleFailureInFunction:file:lineNumber:description:", v110, @"MPStoreDownloadManager.m", 62, @"%s", dlerror());

    goto LABEL_71;
  }
  id v42 = *v39;
  v162[1] = v42;
  uint64_t v156 = 0;
  v157 = &v156;
  uint64_t v158 = 0x2020000000;
  v43 = (id *)getSSDownloadExternalPropertyPolicySizeLimitSymbolLoc_ptr;
  uint64_t v159 = getSSDownloadExternalPropertyPolicySizeLimitSymbolLoc_ptr;
  if (!getSSDownloadExternalPropertyPolicySizeLimitSymbolLoc_ptr)
  {
    uint64_t v151 = MEMORY[0x1E4F143A8];
    uint64_t v152 = 3221225472;
    v153 = __getSSDownloadExternalPropertyPolicySizeLimitSymbolLoc_block_invoke;
    v154 = &unk_1E57FA300;
    v155 = &v156;
    v44 = StoreServicesLibrary_56185();
    v45 = dlsym(v44, "SSDownloadExternalPropertyPolicySizeLimit");
    *(void *)(v155[1] + 24) = v45;
    getSSDownloadExternalPropertyPolicySizeLimitSymbolLoc_ptr = *(void *)(v155[1] + 24);
    v43 = (id *)v157[3];
  }
  _Block_object_dispose(&v156, 8);
  if (!v43)
  {
    v111 = [MEMORY[0x1E4F28B00] currentHandler];
    v112 = [NSString stringWithUTF8String:"NSString *getSSDownloadExternalPropertyPolicySizeLimit(void)"];
    objc_msgSend(v111, "handleFailureInFunction:file:lineNumber:description:", v112, @"MPStoreDownloadManager.m", 63, @"%s", dlerror());

    goto LABEL_71;
  }
  id v46 = *v43;
  v162[2] = v46;
  uint64_t v156 = 0;
  v157 = &v156;
  uint64_t v158 = 0x2020000000;
  v47 = (id *)getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr_56329;
  uint64_t v159 = getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr_56329;
  if (!getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr_56329)
  {
    uint64_t v151 = MEMORY[0x1E4F143A8];
    uint64_t v152 = 3221225472;
    v153 = __getSSDownloadExternalPropertyRentalInformationSymbolLoc_block_invoke_56330;
    v154 = &unk_1E57FA300;
    v155 = &v156;
    v48 = StoreServicesLibrary_56185();
    v49 = dlsym(v48, "SSDownloadExternalPropertyRentalInformation");
    *(void *)(v155[1] + 24) = v49;
    getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr_56329 = *(void *)(v155[1] + 24);
    v47 = (id *)v157[3];
  }
  _Block_object_dispose(&v156, 8);
  if (!v47)
  {
    v113 = [MEMORY[0x1E4F28B00] currentHandler];
    v114 = [NSString stringWithUTF8String:"NSString *getSSDownloadExternalPropertyRentalInformation(void)"];
    objc_msgSend(v113, "handleFailureInFunction:file:lineNumber:description:", v114, @"MPStoreDownloadManager.m", 64, @"%s", dlerror());

    goto LABEL_71;
  }
  id v163 = *v47;
  v50 = (void *)MEMORY[0x1E4F1C978];
  id v51 = v163;
  v52 = [v50 arrayWithObjects:v162 count:4];

  [v144 setPrefetchedDownloadExternalProperties:v52];
  v53 = getSSDownloadPropertyClientBundleIdentifier();
  v160[0] = v53;
  uint64_t v156 = 0;
  v157 = &v156;
  uint64_t v158 = 0x2020000000;
  v54 = (id *)getSSDownloadPropertyDownloadPhaseSymbolLoc_ptr;
  uint64_t v159 = getSSDownloadPropertyDownloadPhaseSymbolLoc_ptr;
  if (!getSSDownloadPropertyDownloadPhaseSymbolLoc_ptr)
  {
    uint64_t v151 = MEMORY[0x1E4F143A8];
    uint64_t v152 = 3221225472;
    v153 = __getSSDownloadPropertyDownloadPhaseSymbolLoc_block_invoke;
    v154 = &unk_1E57FA300;
    v155 = &v156;
    v55 = StoreServicesLibrary_56185();
    v56 = dlsym(v55, "SSDownloadPropertyDownloadPhase");
    *(void *)(v155[1] + 24) = v56;
    getSSDownloadPropertyDownloadPhaseSymbolLoc_ptr = *(void *)(v155[1] + 24);
    v54 = (id *)v157[3];
  }
  _Block_object_dispose(&v156, 8);
  if (!v54)
  {
    v115 = [MEMORY[0x1E4F28B00] currentHandler];
    v116 = [NSString stringWithUTF8String:"NSString *getSSDownloadPropertyDownloadPhase(void)"];
    objc_msgSend(v115, "handleFailureInFunction:file:lineNumber:description:", v116, @"MPStoreDownloadManager.m", 49, @"%s", dlerror());

    goto LABEL_71;
  }
  id v139 = *v54;
  v160[1] = v139;
  uint64_t v156 = 0;
  v157 = &v156;
  uint64_t v158 = 0x2020000000;
  v57 = (id *)getSSDownloadPropertyEncodedErrorDataSymbolLoc_ptr;
  uint64_t v159 = getSSDownloadPropertyEncodedErrorDataSymbolLoc_ptr;
  if (!getSSDownloadPropertyEncodedErrorDataSymbolLoc_ptr)
  {
    uint64_t v151 = MEMORY[0x1E4F143A8];
    uint64_t v152 = 3221225472;
    v153 = __getSSDownloadPropertyEncodedErrorDataSymbolLoc_block_invoke;
    v154 = &unk_1E57FA300;
    v155 = &v156;
    v58 = StoreServicesLibrary_56185();
    v59 = dlsym(v58, "SSDownloadPropertyEncodedErrorData");
    *(void *)(v155[1] + 24) = v59;
    getSSDownloadPropertyEncodedErrorDataSymbolLoc_ptr = *(void *)(v155[1] + 24);
    v57 = (id *)v157[3];
  }
  _Block_object_dispose(&v156, 8);
  if (!v57)
  {
    v117 = [MEMORY[0x1E4F28B00] currentHandler];
    v118 = [NSString stringWithUTF8String:"NSString *getSSDownloadPropertyEncodedErrorData(void)"];
    objc_msgSend(v117, "handleFailureInFunction:file:lineNumber:description:", v118, @"MPStoreDownloadManager.m", 50, @"%s", dlerror());

    goto LABEL_71;
  }
  id v138 = *v57;
  v160[2] = v138;
  uint64_t v156 = 0;
  v157 = &v156;
  uint64_t v158 = 0x2020000000;
  v60 = (id *)getSSDownloadPropertyIsRestoreSymbolLoc_ptr_56335;
  uint64_t v159 = getSSDownloadPropertyIsRestoreSymbolLoc_ptr_56335;
  if (!getSSDownloadPropertyIsRestoreSymbolLoc_ptr_56335)
  {
    uint64_t v151 = MEMORY[0x1E4F143A8];
    uint64_t v152 = 3221225472;
    v153 = __getSSDownloadPropertyIsRestoreSymbolLoc_block_invoke_56336;
    v154 = &unk_1E57FA300;
    v155 = &v156;
    v61 = StoreServicesLibrary_56185();
    v62 = dlsym(v61, "SSDownloadPropertyIsRestore");
    *(void *)(v155[1] + 24) = v62;
    getSSDownloadPropertyIsRestoreSymbolLoc_ptr_56335 = *(void *)(v155[1] + 24);
    v60 = (id *)v157[3];
  }
  _Block_object_dispose(&v156, 8);
  if (!v60)
  {
    v119 = [MEMORY[0x1E4F28B00] currentHandler];
    v120 = [NSString stringWithUTF8String:"NSString *getSSDownloadPropertyIsRestore(void)"];
    objc_msgSend(v119, "handleFailureInFunction:file:lineNumber:description:", v120, @"MPStoreDownloadManager.m", 51, @"%s", dlerror());

    goto LABEL_71;
  }
  id v137 = *v60;
  v160[3] = v137;
  v141 = getSSDownloadPropertyKind();
  v160[4] = v141;
  v140 = getSSDownloadPropertyLibraryItemIdentifier_56192();
  v160[5] = v140;
  uint64_t v156 = 0;
  v157 = &v156;
  uint64_t v158 = 0x2020000000;
  v63 = (id *)getSSDownloadPropertyPreferredAssetFlavorSymbolLoc_ptr;
  uint64_t v159 = getSSDownloadPropertyPreferredAssetFlavorSymbolLoc_ptr;
  if (!getSSDownloadPropertyPreferredAssetFlavorSymbolLoc_ptr)
  {
    uint64_t v151 = MEMORY[0x1E4F143A8];
    uint64_t v152 = 3221225472;
    v153 = __getSSDownloadPropertyPreferredAssetFlavorSymbolLoc_block_invoke;
    v154 = &unk_1E57FA300;
    v155 = &v156;
    v64 = StoreServicesLibrary_56185();
    v65 = dlsym(v64, "SSDownloadPropertyPreferredAssetFlavor");
    *(void *)(v155[1] + 24) = v65;
    getSSDownloadPropertyPreferredAssetFlavorSymbolLoc_ptr = *(void *)(v155[1] + 24);
    v63 = (id *)v157[3];
  }
  _Block_object_dispose(&v156, 8);
  if (!v63)
  {
    v121 = [MEMORY[0x1E4F28B00] currentHandler];
    v122 = [NSString stringWithUTF8String:"NSString *getSSDownloadPropertyPreferredAssetFlavor(void)"];
    objc_msgSend(v121, "handleFailureInFunction:file:lineNumber:description:", v122, @"MPStoreDownloadManager.m", 54, @"%s", dlerror());

    goto LABEL_71;
  }
  id v66 = *v63;
  v160[6] = v66;
  uint64_t v156 = 0;
  v157 = &v156;
  uint64_t v158 = 0x2020000000;
  v67 = (id *)getSSDownloadPropertyReasonSymbolLoc_ptr_56340;
  uint64_t v159 = getSSDownloadPropertyReasonSymbolLoc_ptr_56340;
  if (!getSSDownloadPropertyReasonSymbolLoc_ptr_56340)
  {
    uint64_t v151 = MEMORY[0x1E4F143A8];
    uint64_t v152 = 3221225472;
    v153 = __getSSDownloadPropertyReasonSymbolLoc_block_invoke_56341;
    v154 = &unk_1E57FA300;
    v155 = &v156;
    v68 = StoreServicesLibrary_56185();
    v69 = dlsym(v68, "SSDownloadPropertyReason");
    *(void *)(v155[1] + 24) = v69;
    getSSDownloadPropertyReasonSymbolLoc_ptr_56340 = *(void *)(v155[1] + 24);
    v67 = (id *)v157[3];
  }
  _Block_object_dispose(&v156, 8);
  if (!v67)
  {
    v123 = [MEMORY[0x1E4F28B00] currentHandler];
    v124 = [NSString stringWithUTF8String:"NSString *getSSDownloadPropertyReason(void)"];
    objc_msgSend(v123, "handleFailureInFunction:file:lineNumber:description:", v124, @"MPStoreDownloadManager.m", 55, @"%s", dlerror());

    goto LABEL_71;
  }
  id v70 = *v67;
  v160[7] = v70;
  v71 = getSSDownloadPropertyStoreItemIdentifier_56240();
  v160[8] = v71;
  uint64_t v156 = 0;
  v157 = &v156;
  uint64_t v158 = 0x2020000000;
  v72 = (id *)getSSDownloadPropertyThumbnailImageURLSymbolLoc_ptr;
  uint64_t v159 = getSSDownloadPropertyThumbnailImageURLSymbolLoc_ptr;
  if (!getSSDownloadPropertyThumbnailImageURLSymbolLoc_ptr)
  {
    uint64_t v151 = MEMORY[0x1E4F143A8];
    uint64_t v152 = 3221225472;
    v153 = __getSSDownloadPropertyThumbnailImageURLSymbolLoc_block_invoke;
    v154 = &unk_1E57FA300;
    v155 = &v156;
    v73 = StoreServicesLibrary_56185();
    v74 = dlsym(v73, "SSDownloadPropertyThumbnailImageURL");
    *(void *)(v155[1] + 24) = v74;
    getSSDownloadPropertyThumbnailImageURLSymbolLoc_ptr = *(void *)(v155[1] + 24);
    v72 = (id *)v157[3];
  }
  _Block_object_dispose(&v156, 8);
  if (!v72)
  {
    v125 = [MEMORY[0x1E4F28B00] currentHandler];
    v126 = [NSString stringWithUTF8String:"NSString *getSSDownloadPropertyThumbnailImageURL(void)"];
    objc_msgSend(v125, "handleFailureInFunction:file:lineNumber:description:", v126, @"MPStoreDownloadManager.m", 57, @"%s", dlerror());

    goto LABEL_71;
  }
  id v75 = *v72;
  v160[9] = v75;
  uint64_t v156 = 0;
  v157 = &v156;
  uint64_t v158 = 0x2020000000;
  v76 = (id *)getSSDownloadPropertyTitleSymbolLoc_ptr_56345;
  uint64_t v159 = getSSDownloadPropertyTitleSymbolLoc_ptr_56345;
  if (!getSSDownloadPropertyTitleSymbolLoc_ptr_56345)
  {
    uint64_t v151 = MEMORY[0x1E4F143A8];
    uint64_t v152 = 3221225472;
    v153 = __getSSDownloadPropertyTitleSymbolLoc_block_invoke_56346;
    v154 = &unk_1E57FA300;
    v155 = &v156;
    v77 = StoreServicesLibrary_56185();
    v78 = dlsym(v77, "SSDownloadPropertyTitle");
    *(void *)(v155[1] + 24) = v78;
    getSSDownloadPropertyTitleSymbolLoc_ptr_56345 = *(void *)(v155[1] + 24);
    v76 = (id *)v157[3];
  }
  _Block_object_dispose(&v156, 8);
  if (!v76)
  {
    v127 = [MEMORY[0x1E4F28B00] currentHandler];
    v128 = [NSString stringWithUTF8String:"NSString *getSSDownloadPropertyTitle(void)"];
    objc_msgSend(v127, "handleFailureInFunction:file:lineNumber:description:", v128, @"MPStoreDownloadManager.m", 58, @"%s", dlerror());

    goto LABEL_71;
  }
  id v79 = *v76;
  v160[10] = v79;
  uint64_t v156 = 0;
  v157 = &v156;
  uint64_t v158 = 0x2020000000;
  v80 = (id *)getSSDownloadPropertyHandlerIDSymbolLoc_ptr_56349;
  uint64_t v159 = getSSDownloadPropertyHandlerIDSymbolLoc_ptr_56349;
  if (!getSSDownloadPropertyHandlerIDSymbolLoc_ptr_56349)
  {
    uint64_t v151 = MEMORY[0x1E4F143A8];
    uint64_t v152 = 3221225472;
    v153 = __getSSDownloadPropertyHandlerIDSymbolLoc_block_invoke_56350;
    v154 = &unk_1E57FA300;
    v155 = &v156;
    v81 = StoreServicesLibrary_56185();
    v82 = dlsym(v81, "SSDownloadPropertyHandlerID");
    *(void *)(v155[1] + 24) = v82;
    getSSDownloadPropertyHandlerIDSymbolLoc_ptr_56349 = *(void *)(v155[1] + 24);
    v80 = (id *)v157[3];
  }
  _Block_object_dispose(&v156, 8);
  if (!v80)
  {
    v129 = [MEMORY[0x1E4F28B00] currentHandler];
    v130 = [NSString stringWithUTF8String:"NSString *getSSDownloadPropertyHandlerID(void)"];
    objc_msgSend(v129, "handleFailureInFunction:file:lineNumber:description:", v130, @"MPStoreDownloadManager.m", 59, @"%s", dlerror());

    goto LABEL_71;
  }
  id v83 = *v80;
  v160[11] = v83;
  uint64_t v156 = 0;
  v157 = &v156;
  uint64_t v158 = 0x2020000000;
  v84 = (id *)getSSDownloadPropertyCollectionNameSymbolLoc_ptr;
  uint64_t v159 = getSSDownloadPropertyCollectionNameSymbolLoc_ptr;
  if (!getSSDownloadPropertyCollectionNameSymbolLoc_ptr)
  {
    uint64_t v151 = MEMORY[0x1E4F143A8];
    uint64_t v152 = 3221225472;
    v153 = __getSSDownloadPropertyCollectionNameSymbolLoc_block_invoke;
    v154 = &unk_1E57FA300;
    v155 = &v156;
    v85 = StoreServicesLibrary_56185();
    v86 = dlsym(v85, "SSDownloadPropertyCollectionName");
    *(void *)(v155[1] + 24) = v86;
    getSSDownloadPropertyCollectionNameSymbolLoc_ptr = *(void *)(v155[1] + 24);
    v84 = (id *)v157[3];
  }
  _Block_object_dispose(&v156, 8);
  if (!v84)
  {
    v131 = [MEMORY[0x1E4F28B00] currentHandler];
    v132 = [NSString stringWithUTF8String:"NSString *getSSDownloadPropertyCollectionName(void)"];
    objc_msgSend(v131, "handleFailureInFunction:file:lineNumber:description:", v132, @"MPStoreDownloadManager.m", 60, @"%s", dlerror());

    goto LABEL_71;
  }
  id v161 = *v84;
  v87 = (void *)MEMORY[0x1E4F1C978];
  id v88 = v161;
  v89 = [v87 arrayWithObjects:v160 count:13];

  [v144 setPrefetchedDownloadProperties:v89];
  [v144 setShouldFilterExternalOriginatedDownloads:0];
  uint64_t v90 = [objc_alloc((Class)getSSDownloadManagerClass()) initWithManagerOptions:v144];
  downloadManager = v2->_downloadManager;
  v2->_downloadManager = (SSDownloadManager *)v90;

  [(SSDownloadManager *)v2->_downloadManager addObserver:v2];
  v92 = v2->_downloadManager;
  v148[0] = MEMORY[0x1E4F143A8];
  v148[1] = 3221225472;
  v148[2] = __31__MPStoreDownloadManager__init__block_invoke;
  v148[3] = &unk_1E57F9ED0;
  v93 = v2;
  v149 = v93;
  [(SSDownloadManager *)v92 getDownloadsUsingBlock:v148];
  uint64_t v156 = 0;
  v157 = &v156;
  uint64_t v158 = 0x2050000000;
  v94 = (void *)getSSPurchaseManagerClass_softClass;
  uint64_t v159 = getSSPurchaseManagerClass_softClass;
  if (!getSSPurchaseManagerClass_softClass)
  {
    uint64_t v151 = MEMORY[0x1E4F143A8];
    uint64_t v152 = 3221225472;
    v153 = __getSSPurchaseManagerClass_block_invoke;
    v154 = &unk_1E57FA300;
    v155 = &v156;
    __getSSPurchaseManagerClass_block_invoke((uint64_t)&v151);
    v94 = (void *)v157[3];
  }
  v95 = v94;
  _Block_object_dispose(&v156, 8);
  id v96 = [v95 alloc];
  v97 = NSString;
  v98 = [MEMORY[0x1E4F28B50] mainBundle];
  v99 = [v98 bundleIdentifier];
  v100 = (objc_class *)objc_opt_class();
  v101 = NSStringFromClass(v100);
  v102 = [v97 stringWithFormat:@"%@.%@", v99, v101];
  uint64_t v103 = [v96 initWithManagerIdentifier:v102];
  id v104 = v93[15];
  v93[15] = (id)v103;

  [v93[15] setDelegate:v93];
  id v105 = v93[15];
  v146[0] = MEMORY[0x1E4F143A8];
  v146[1] = 3221225472;
  v146[2] = __31__MPStoreDownloadManager__init__block_invoke_4;
  v146[3] = &unk_1E57F9EF8;
  v147 = v93;
  [v105 getPurchasesUsingBlock:v146];

  return v2;
}

void __51__MPStoreDownloadManager_addObserver_forDownloads___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) count];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2)
  {
    if (!*(void *)(v3 + 72))
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:1];
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = *(void **)(v5 + 72);
      *(void *)(v5 + 72) = v4;
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 72), "objectForKey:", v12, (void)v20);
          if (!v13)
          {
            uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:1];
            [*(id *)(*(void *)(a1 + 40) + 72) setObject:v13 forKey:v12];
          }
          if (([v13 containsObject:*(void *)(a1 + 48)] & 1) == 0) {
            [v13 addObject:*(void *)(a1 + 48)];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v14 = *(void **)(v3 + 88);
    if (!v14)
    {
      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:1];
      uint64_t v16 = *(void *)(a1 + 40);
      v17 = *(void **)(v16 + 88);
      *(void *)(v16 + 88) = v15;

      v14 = *(void **)(*(void *)(a1 + 40) + 88);
    }
    if (([v14 containsObject:*(void *)(a1 + 48)] & 1) == 0)
    {
      uint64_t v18 = *(void *)(a1 + 48);
      v19 = *(void **)(*(void *)(a1 + 40) + 88);
      [v19 addObject:v18];
    }
  }
}

void __31__MPStoreDownloadManager__init__block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MPStoreDownloadManagerDidFetchInitialDownloadsNotification" object:*(void *)(a1 + 32)];
}

void __31__MPStoreDownloadManager__init__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (!a3)
  {
    id v8 = v5;
    uint64_t v7 = [v5 count];
    id v6 = v8;
    if (v7)
    {
      [*(id *)(a1 + 32) _updateDownloadsWithAdditions:v8 removals:0];
      id v6 = v8;
    }
  }
}

void __31__MPStoreDownloadManager__init__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 104) = 1;
  v1 = *(void **)(a1 + 32);
  id v2 = v1[3];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__MPStoreDownloadManager__init__block_invoke_3;
  block[3] = &unk_1E57F9EA8;
  uint64_t v4 = v1;
  dispatch_async(v2, block);
}

void __31__MPStoreDownloadManager__init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 32), "_shouldHideDownload:", v10, v18) & 1) == 0)
        {
          uint64_t v11 = [v10 downloadPhaseIdentifier];
          soft_SSDownloadPhaseIsFinishedPhase(v11);
          if ((v12 & 1) != 0
            || (getSSDownloadPhaseFailed(),
                uint64_t v13 = objc_claimAutoreleasedReturnValue(),
                int v14 = [v11 isEqual:v13],
                v13,
                v14))
          {
            [v4 addObject:v10];
            [*(id *)(a1 + 32) _updateMediaItemPropertiesForFinishedStoreDownload:0 SSDownload:v10];
          }
          else
          {
            [v18 addObject:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  uint64_t v15 = v18;
  if ([v18 count]) {
    [*(id *)(a1 + 32) _updateDownloadsWithAdditions:v18 removals:0];
  }
  if (objc_msgSend(v4, "count", v18)) {
    [*(id *)(*(void *)(a1 + 32) + 112) finishDownloads:v4];
  }
  uint64_t v16 = *(void **)(a1 + 32);
  v17 = v16[1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__MPStoreDownloadManager__init__block_invoke_2;
  block[3] = &unk_1E57F9EA8;
  long long v20 = v16;
  dispatch_barrier_async(v17, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseManager, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_storeIdentifiersToDownloads, 0);
  objc_storeStrong((id *)&self->_observersForAllDownloads, 0);
  objc_storeStrong((id *)&self->_libraryIdentifiersToDownloads, 0);
  objc_storeStrong((id *)&self->_downloadsToObservers, 0);
  objc_storeStrong((id *)&self->_downloadIdentifiersToDownloads, 0);
  objc_storeStrong((id *)&self->_userDownloads, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_downloadKindToRequiredClientBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_blockObservers, 0);
  objc_storeStrong((id *)&self->_calloutSerialQueue, 0);
  objc_storeStrong((id *)&self->_activeDownloads, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (BOOL)_isActiveDownload:(id)a3
{
  id v3 = [a3 phaseIdentifier];
  uint64_t v4 = v3;
  BOOL v5 = v3
    && (([v3 isEqualToString:@"MPStoreDownloadPhaseDownloading"] & 1) != 0
     || ([v4 isEqualToString:@"MPStoreDownloadPhaseProcessing"] & 1) != 0
     || [v4 isEqualToString:@"MPStoreDownloadPhaseInstalling"]);

  return v5;
}

- (void)_updateActiveDownloadsWithCancelledDownloads:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__MPStoreDownloadManager__updateActiveDownloadsWithCancelledDownloads___block_invoke;
  v7[3] = &unk_1E57F9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(accessQueue, v7);
}

void __71__MPStoreDownloadManager__updateActiveDownloadsWithCancelledDownloads___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) mutableCopy];
  if ([*(id *)(a1 + 40) count]) {
    [v2 removeObjectsInArray:*(void *)(a1 + 40)];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;
}

- (void)_addNonCancelledDownloadsToActiveList:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__MPStoreDownloadManager__addNonCancelledDownloadsToActiveList___block_invoke;
  v7[3] = &unk_1E57F9F98;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

void __64__MPStoreDownloadManager__addNonCancelledDownloadsToActiveList___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  v28 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 40) + 16) mutableCopy];
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "downloadIdentifier"));
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v33 + 1) + 8 * j);
        if (([*(id *)(a1 + 40) _isActiveDownload:v16] & 1) == 0) {
          [v28 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v13);
  }
  uint64_t v27 = a1;

  [v2 removeObjectsInArray:v28];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = v2;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v30;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = *(void **)(*((void *)&v29 + 1) + 8 * k);
        long long v23 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v22, "downloadIdentifier", v27));
        char v24 = [v4 containsObject:v23];

        if ((v24 & 1) == 0) {
          [v5 addObject:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v19);
  }

  uint64_t v25 = *(void *)(v27 + 40);
  uint64_t v26 = *(void **)(v25 + 16);
  *(void *)(v25 + 16) = v5;
}

- (void)_updateMediaItemPropertiesForFinishedStoreDownload:(id)a3 SSDownload:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5)
  {
    if (![v5 isFinished]) {
      goto LABEL_15;
    }
    uint64_t v8 = [v5 failureError];

    if (v8) {
      goto LABEL_15;
    }
    uint64_t v9 = [v5 libraryItemIdentifier];
    if (!v9) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (!v6)
  {
LABEL_15:

    return;
  }
  uint64_t v10 = [v6 downloadPhaseIdentifier];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  id v11 = (void *)getSSDownloadPhaseFinishedSymbolLoc_ptr_56183;
  uint64_t v22 = getSSDownloadPhaseFinishedSymbolLoc_ptr_56183;
  if (!getSSDownloadPhaseFinishedSymbolLoc_ptr_56183)
  {
    uint64_t v12 = StoreServicesLibrary_56185();
    v20[3] = (uint64_t)dlsym(v12, "SSDownloadPhaseFinished");
    getSSDownloadPhaseFinishedSymbolLoc_ptr_56183 = v20[3];
    id v11 = (void *)v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (v11)
  {
    if ([v10 isEqualToString:*v11]
      && ([v7 failureError], uint64_t v13 = objc_claimAutoreleasedReturnValue(), v13, !v13))
    {
      uint64_t v15 = getSSDownloadPropertyLibraryItemIdentifier_56192();
      uint64_t v16 = [v7 valueForProperty:v15];
      uint64_t v9 = [v16 longLongValue];
    }
    else
    {
      uint64_t v9 = 0;
    }

    if (!v9) {
      goto LABEL_15;
    }
LABEL_14:
    uint64_t v14 = [[MPMediaItem alloc] initWithPersistentID:v9];
    [(MPMediaEntity *)v14 invalidateCachedProperties];

    goto LABEL_15;
  }
  id v17 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v18 = [NSString stringWithUTF8String:"NSString *getSSDownloadPhaseFinished(void)"];
  objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, @"MPStoreDownloadManager.m", 66, @"%s", dlerror());

  __break(1u);
}

- (void)_updateDownloadsWithAdditions:(id)a3 removals:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] || objc_msgSend(v7, "count"))
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__MPStoreDownloadManager__updateDownloadsWithAdditions_removals___block_invoke;
    block[3] = &unk_1E57FA038;
    id v10 = v6;
    id v11 = v7;
    uint64_t v12 = self;
    dispatch_barrier_async(accessQueue, block);
  }
}

void __65__MPStoreDownloadManager__updateDownloadsWithAdditions_removals___block_invoke(id *a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[4], "count"));
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[5], "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v3 = a1[4];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v31;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v31 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v30 + 1) + 8 * v6);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v8 = v7;
        }
        else
        {
          getSSPurchaseClass();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v8 = [[MPStoreDownload alloc] initWithType:0 attributes:0];
            [(MPStoreDownload *)v8 _setSSPurchase:v7 SSPurchaseResponse:0];
          }
          else
          {
            uint64_t v35 = 0;
            long long v36 = &v35;
            uint64_t v37 = 0x2050000000;
            uint64_t v9 = (void *)getSSDownloadClass_softClass_56208;
            uint64_t v38 = getSSDownloadClass_softClass_56208;
            if (!getSSDownloadClass_softClass_56208)
            {
              v34[0] = MEMORY[0x1E4F143A8];
              v34[1] = 3221225472;
              v34[2] = __getSSDownloadClass_block_invoke_56209;
              v34[3] = &unk_1E57FA300;
              v34[4] = &v35;
              __getSSDownloadClass_block_invoke_56209((uint64_t)v34);
              uint64_t v9 = (void *)v36[3];
            }
            id v10 = v9;
            _Block_object_dispose(&v35, 8);
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v8 = 0;
              goto LABEL_21;
            }
            uint64_t v8 = [[MPStoreDownload alloc] initWithType:0 attributes:0];
            [(MPStoreDownload *)v8 _setSSDownload:v7];
          }
        }
        if (v8 && (objc_msgSend(a1[6], "_onQueue_hasExistingDownloadForStoreDownload:", v8) & 1) == 0)
        {
          [*((id *)a1[6] + 6) addObject:v8];
          if ([(MPStoreDownload *)v8 reason] != 1 && [(MPStoreDownload *)v8 reason] != 2) {
            [*((id *)a1[6] + 7) addObject:v8];
          }
          [v22 addObject:v8];
          objc_msgSend(a1[6], "_onQueue_addDownloadToMapTables:", v8);
        }
LABEL_21:

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v4);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = a1[5];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v27;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = v15;
        }
        else
        {
          getSSPurchaseClass();
          if (objc_opt_isKindOfClass()) {
            id v17 = v15;
          }
          else {
            id v17 = 0;
          }
          id v18 = v17;
          getSSPurchaseClass();
          if (objc_opt_isKindOfClass()) {
            uint64_t v19 = v15;
          }
          else {
            uint64_t v19 = 0;
          }
          objc_msgSend(a1[6], "_onQueue_findStoreDownloadWithSSDownload:SSPurchase:", v19, v18);
          id v16 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (v16)
        {
          [*((id *)a1[6] + 6) removeObject:v16];
          if ([v16 reason] != 1 && objc_msgSend(v16, "reason") != 2) {
            [*((id *)a1[6] + 7) removeObject:v16];
          }
          [v2 addObject:v16];
          objc_msgSend(a1[6], "_onQueue_removeDownloadFromMapTables:", v16);
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v39 count:16];
    }
    while (v12);
  }

  if ([v22 count] || objc_msgSend(v2, "count"))
  {
    id v20 = a1[6];
    uint64_t v21 = *((void *)v20 + 3);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__MPStoreDownloadManager__updateDownloadsWithAdditions_removals___block_invoke_2;
    block[3] = &unk_1E57FA038;
    void block[4] = v20;
    id v24 = v22;
    id v25 = v2;
    dispatch_async(v21, block);
  }
}

uint64_t __65__MPStoreDownloadManager__updateDownloadsWithAdditions_removals___block_invoke_2(void *a1)
{
  id v2 = (void *)a1[4];
  if ([(id)a1[5] count]) {
    uint64_t v3 = a1[5];
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(id)a1[6] count]) {
    uint64_t v4 = a1[6];
  }
  else {
    uint64_t v4 = 0;
  }

  return [v2 _sendDownloadsDidChangeToObserversWithAddedDownloads:v3 removedDownloads:v4];
}

- (void)_updateActiveDownloadsWithChangedActiveDownloads:(id)a3 inactiveDownloads:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] || objc_msgSend(v7, "count"))
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__MPStoreDownloadManager__updateActiveDownloadsWithChangedActiveDownloads_inactiveDownloads___block_invoke;
    block[3] = &unk_1E57FA038;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    dispatch_barrier_async(accessQueue, block);
  }
}

void __93__MPStoreDownloadManager__updateActiveDownloadsWithChangedActiveDownloads_inactiveDownloads___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v2 addObjectsFromArray:*(void *)(a1 + 32)];
  [v2 addObjectsFromArray:*(void *)(*(void *)(a1 + 40) + 16)];
  uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 48)];
  [v2 minusSet:v3];

  uint64_t v4 = (void *)[*(id *)(*(void *)(a1 + 40) + 16) mutableCopy];
  uint64_t v5 = [v2 allObjects];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v5;

  uint64_t v8 = (void *)[*(id *)(a1 + 32) mutableCopy];
  [v8 removeObjectsInArray:v4];
  [v4 removeObjectsInArray:*(void *)(a1 + 32)];
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(NSObject **)(v9 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__MPStoreDownloadManager__updateActiveDownloadsWithChangedActiveDownloads_inactiveDownloads___block_invoke_2;
  block[3] = &unk_1E57FA038;
  void block[4] = v9;
  id v14 = v8;
  id v15 = v4;
  id v11 = v4;
  id v12 = v8;
  dispatch_async(v10, block);
}

uint64_t __93__MPStoreDownloadManager__updateActiveDownloadsWithChangedActiveDownloads_inactiveDownloads___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendActiveDownloadsDidChangeToObserversWithAddedDownloads:*(void *)(a1 + 40) removedDownloads:*(void *)(a1 + 48)];
}

- (void)_unregisterBlockObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__MPStoreDownloadManager__unregisterBlockObserver___block_invoke;
    v7[3] = &unk_1E57F9F98;
    void v7[4] = self;
    id v8 = v4;
    dispatch_barrier_async(accessQueue, v7);
  }
}

void __51__MPStoreDownloadManager__unregisterBlockObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v2 + 32);
    *(void *)(v2 + 32) = 0;
  }
}

- (BOOL)_shouldHideDownload:(id)a3
{
  id v4 = a3;
  if (self->_downloadKindToRequiredClientBundleIdentifiers)
  {
    uint64_t v5 = getSSDownloadPropertyKind();
    uint64_t v6 = [v4 valueForProperty:v5];

    id v7 = [(NSDictionary *)self->_downloadKindToRequiredClientBundleIdentifiers objectForKey:v6];
    if (v7)
    {
      if (_NSIsNSString())
      {
        id v8 = getSSDownloadPropertyClientBundleIdentifier();
        uint64_t v9 = [v4 valueForProperty:v8];

        if (v9)
        {
          char v10 = [v9 isEqualToString:v7];
LABEL_10:
          char v11 = v10 ^ 1;
LABEL_13:

          goto LABEL_14;
        }
        goto LABEL_12;
      }
      if (_NSIsNSArray())
      {
        id v12 = getSSDownloadPropertyClientBundleIdentifier();
        uint64_t v9 = [v4 valueForProperty:v12];

        if (v9)
        {
          char v10 = [v7 containsObject:v9];
          goto LABEL_10;
        }
LABEL_12:
        char v11 = 0;
        goto LABEL_13;
      }
    }
    char v11 = 0;
LABEL_14:

    goto LABEL_15;
  }
  char v11 = 0;
LABEL_15:

  return v11;
}

- (void)_sendDownloadsDidProgressToObserversForDownloads:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MPStoreDownloadManager *)self _observersForAllDownloads];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v10 downloadManager:self downloadsDidProgress:v4];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v7);
  }
  uint64_t v19 = v5;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = v4;
  uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * j);
        uint64_t v13 = -[MPStoreDownloadManager _observersForDownload:](self, "_observersForDownload:", v12, v19);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v35 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v24;
          do
          {
            for (uint64_t k = 0; k != v15; ++k)
            {
              if (*(void *)v24 != v16) {
                objc_enumerationMutation(v13);
              }
              id v18 = *(void **)(*((void *)&v23 + 1) + 8 * k);
              if (objc_opt_respondsToSelector()) {
                [v18 downloadManager:self downloadDidProgress:v12];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v35 count:16];
          }
          while (v15);
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v22);
  }
}

- (void)_sendDownloadsDidFinishToObserversForDownloads:(id)a3 notifyDownloadManager:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v23 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v24 = (void (**)(id, id))a5;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v7;
  uint64_t v27 = [v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        char v10 = [(MPStoreDownloadManager *)self _observersForDownload:v9];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v41 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v33;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v33 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v32 + 1) + 8 * j);
              if (objc_opt_respondsToSelector()) {
                [v15 downloadManager:self downloadDidFinish:v9];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v41 count:16];
          }
          while (v12);
        }
      }
      id v7 = obj;
      uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v27);
  }
  if (v23)
  {
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v17 = v7;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v40 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v29;
      do
      {
        for (uint64_t k = 0; k != v19; ++k)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = [*(id *)(*((void *)&v28 + 1) + 8 * k) _SSDownload];
          if (v22) {
            [v16 addObject:v22];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v40 count:16];
      }
      while (v19);
    }

    if ([v16 count]) {
      [(SSDownloadManager *)self->_downloadManager finishDownloads:v16];
    }

    id v7 = obj;
  }
  if (v24) {
    v24[2](v24, v7);
  }
}

- (void)_sendDownloadsDidFinishPurchasesToObserversForDownloads:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = a3;
  uint64_t v14 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v14)
  {
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v6 = [(MPStoreDownloadManager *)self _observersForDownload:v5];
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v16;
          do
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v16 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * j);
              if (objc_opt_respondsToSelector()) {
                [v11 downloadManager:self downloadPurchaseDidFinish:v5];
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v8);
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v14);
  }
}

- (void)_sendDownloadsDidChangeToObserversWithAddedDownloads:(id)a3 removedDownloads:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MPStoreDownloadManager *)self _observersForAllDownloads];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 downloadManager:self didAddDownloads:v6 removeDownloads:v7];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)_sendActiveDownloadsDidChangeToObserversWithAddedDownloads:(id)a3 removedDownloads:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MPStoreDownloadManager *)self _observersForAllDownloads];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 downloadManager:self didAddActiveDownloads:v6 removeActiveDownloads:v7];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)_registerBlockObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__MPStoreDownloadManager__registerBlockObserver___block_invoke;
    v7[3] = &unk_1E57F9F98;
    void v7[4] = self;
    id v8 = v4;
    dispatch_barrier_async(accessQueue, v7);
  }
}

uint64_t __49__MPStoreDownloadManager__registerBlockObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v2 addObject:v6];
}

- (void)_onQueue_removeDownloadFromMapTables:(id)a3
{
  id v4 = a3;
  uint64_t key = [v4 storeItemIdentifier];
  if (key) {
    NSMapRemove(self->_storeIdentifiersToDownloads, &key);
  }
  uint64_t v6 = [v4 libraryItemIdentifier];
  if (v6) {
    NSMapRemove(self->_libraryIdentifiersToDownloads, &v6);
  }
  uint64_t v5 = [v4 downloadIdentifier];
  if (v5) {
    NSMapRemove(self->_downloadIdentifiersToDownloads, &v5);
  }
}

- (BOOL)_onQueue_hasExistingDownloadForStoreDownload:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  uint64_t v5 = [v4 _SSDownload];
  uint64_t v6 = [v4 _SSPurchase];

  id v7 = [(MPStoreDownloadManager *)self _onQueue_findStoreDownloadWithSSDownload:v5 SSPurchase:v6];
  BOOL v8 = v7 != 0;

  return v8;
}

- (id)_onQueue_findStoreDownloadWithSSDownload:(id)a3 SSPurchase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t key = [v6 persistentIdentifier];
  if (!key
    || (NSMapGet(self->_downloadIdentifiersToDownloads, &key), (BOOL v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v9 = getSSDownloadPropertyStoreItemIdentifier_56240();
    uint64_t v10 = [v6 valueForProperty:v9];
    uint64_t v20 = [v10 longLongValue];

    if (!v20)
    {
      uint64_t v11 = getSSDownloadPropertyStoreItemIdentifier_56240();
      uint64_t v12 = objc_msgSend(v7, "valueForDownloadProperty:", v11, 0, key);
      uint64_t v20 = [v12 longLongValue];

      if (!v20) {
        goto LABEL_6;
      }
    }
    BOOL v8 = NSMapGet(self->_storeIdentifiersToDownloads, &v20);
    if (!v8)
    {
LABEL_6:
      uint64_t v13 = getSSDownloadPropertyLibraryItemIdentifier_56192();
      long long v14 = [v6 valueForProperty:v13];
      uint64_t v15 = [v14 longLongValue];
      uint64_t v20 = v15;

      if (v15) {
        goto LABEL_8;
      }
      long long v16 = getSSDownloadPropertyLibraryItemIdentifier_56192();
      long long v17 = [v7 valueForDownloadProperty:v16];
      uint64_t v18 = [v17 longLongValue];
      uint64_t v20 = v18;

      if (v18)
      {
LABEL_8:
        BOOL v8 = NSMapGet(self->_libraryIdentifiersToDownloads, &v20);
      }
      else
      {
        BOOL v8 = 0;
      }
    }
  }

  return v8;
}

- (void)_onQueue_addDownloadToMapTables:(id)a3
{
  id v4 = a3;
  uint64_t key = [v4 storeItemIdentifier];
  if (key) {
    NSMapInsert(self->_storeIdentifiersToDownloads, &key, v4);
  }
  uint64_t v6 = [v4 libraryItemIdentifier];
  if (v6) {
    NSMapInsert(self->_libraryIdentifiersToDownloads, &v6, v4);
  }
  uint64_t v5 = [v4 downloadIdentifier];
  if (v5) {
    NSMapInsert(self->_downloadIdentifiersToDownloads, &v5, v4);
  }
}

- (id)_observersForDownload:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__56245;
    long long v16 = __Block_byref_object_dispose__56246;
    id v17 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__MPStoreDownloadManager__observersForDownload___block_invoke;
    block[3] = &unk_1E57F9F48;
    uint64_t v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(accessQueue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __48__MPStoreDownloadManager__observersForDownload___block_invoke(void *a1)
{
  uint64_t v3 = [*(id *)(a1[4] + 88) count];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v1 = [*(id *)(a1[4] + 88) allObjects];
    id v5 = (id)[v4 initWithArray:v1];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v5);
  if (v3)
  {

    id v5 = (id)v1;
  }

  id v11 = [*(id *)(a1[4] + 72) objectForKey:a1[5]];
  if ([v11 count])
  {
    uint64_t v6 = *(void **)(*(void *)(a1[6] + 8) + 40);
    id v7 = [v11 allObjects];
    [v6 addObjectsFromArray:v7];
  }
  uint64_t v8 = [*(id *)(*(void *)(a1[6] + 8) + 40) count];
  uint64_t v9 = *(void *)(a1[6] + 8);
  if (v8) {
    id v10 = *(void **)(v9 + 40);
  }
  else {
    id v10 = 0;
  }
  objc_storeStrong((id *)(v9 + 40), v10);
}

- (id)_observersForAllDownloads
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__56245;
  id v10 = __Block_byref_object_dispose__56246;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__MPStoreDownloadManager__observersForAllDownloads__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __51__MPStoreDownloadManager__observersForAllDownloads__block_invoke(uint64_t a1)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 88) count];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v1 = [*(id *)(*(void *)(a1 + 32) + 88) allObjects];
    id v5 = (id)[v4 initWithArray:v1];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  obuint64_t j = v5;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);
  uint64_t v6 = obj;
  if (v3)
  {

    uint64_t v6 = (void *)v1;
  }
}

- (id)_existingDownloadForSSDownload:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__56245;
    long long v16 = __Block_byref_object_dispose__56246;
    id v17 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__MPStoreDownloadManager__existingDownloadForSSDownload___block_invoke;
    block[3] = &unk_1E57F9F48;
    id v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(accessQueue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __57__MPStoreDownloadManager__existingDownloadForSSDownload___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_findStoreDownloadWithSSDownload:SSPurchase:", *(void *)(a1 + 40), 0);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_addPurchaseFinishedHandler:(id)a3 forDownloads:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, void *))a3;
  id v8 = a4;
  if (![v8 count])
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"MPStoreDownloadManager.m" lineNumber:947 description:@"Downloads must not be empty."];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "_SSPurchaseResponse", (void)v18);

        if (v15)
        {
          if (v7) {
            v7[2](v7, v14);
          }
        }
        else
        {
          long long v16 = [[_MPStoreDownloadBlockObserver alloc] initWithDownload:v14];
          [(_MPStoreDownloadBlockObserver *)v16 setDidFinishPurchaseHandler:v7];
          [(MPStoreDownloadManager *)self _registerBlockObserver:v16];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)downloadManagerNetworkUsageDidChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = [(MPStoreDownloadManager *)self _observersForAllDownloads];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
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
          [v9 downloadManagerNetworkUsageDidChange:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v34 = (MPStoreDownload *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v47;
    long long v10 = "com.apple.amp.mediaplayer";
    do
    {
      uint64_t v11 = 0;
      uint64_t v37 = v8;
      do
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v46 + 1) + 8 * v11);
        if (![(MPStoreDownloadManager *)self _shouldHideDownload:v12])
        {
          long long v13 = [(MPStoreDownloadManager *)self _existingDownloadForSSDownload:v12];
          if (v13)
          {
            uint64_t v14 = v13;
            [v13 _setSSDownload:v12];
            accessQueue = self->_accessQueue;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __66__MPStoreDownloadManager_downloadManager_downloadStatesDidChange___block_invoke;
            block[3] = &unk_1E57F9F98;
            void block[4] = self;
            long long v16 = v14;
            v45 = v16;
            dispatch_barrier_sync(accessQueue, block);
          }
          else
          {
            id v17 = os_log_create(v10, "Download");
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v51 = v12;
              _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_ERROR, "Download did change %{public}@ with no existing download.", buf, 0xCu);
            }

            long long v16 = [[MPStoreDownload alloc] initWithType:0 attributes:0];
            [v36 addObject:v16];
            [(MPStoreDownload *)v16 _setSSDownload:v12];
          }
          long long v18 = os_log_create(v10, "Download");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v51 = v12;
            __int16 v52 = 2114;
            v53 = v16;
            _os_log_impl(&dword_1952E8000, v18, OS_LOG_TYPE_DEFAULT, "Download did change: %{public}@. Download: %{public}@", buf, 0x16u);
          }

          BOOL v19 = [(MPStoreDownload *)v16 _isCanceled];
          long long v20 = [v12 downloadPhaseIdentifier];
          long long v21 = v20;
          if (v19)
          {
            BOOL v22 = 0;
            if (!v16) {
              goto LABEL_26;
            }
            goto LABEL_22;
          }
          uint64_t v23 = v9;
          long long v24 = v10;
          id v25 = v6;
          soft_SSDownloadPhaseIsFinishedPhase(v20);
          if ((v26 & 1) != 0
            || (getSSDownloadPhaseFailed(),
                uint64_t v27 = objc_claimAutoreleasedReturnValue(),
                int v28 = [v21 isEqual:v27],
                v27,
                v28))
          {
            [v35 addObject:v16];
            [(MPStoreDownloadManager *)self _updateMediaItemPropertiesForFinishedStoreDownload:v16 SSDownload:v12];
            goto LABEL_20;
          }
          if ([(MPStoreDownload *)v16 _isCanceled])
          {
LABEL_20:
            BOOL v22 = 0;
          }
          else
          {
            [(MPStoreDownload *)v34 addObject:v16];
            BOOL v22 = [(MPStoreDownloadManager *)self _isActiveDownload:v16];
          }
          id v6 = v25;
          long long v10 = v24;
          uint64_t v9 = v23;
          uint64_t v8 = v37;
          if (!v16)
          {
LABEL_26:

            goto LABEL_27;
          }
LABEL_22:
          if (v22) {
            long long v29 = v39;
          }
          else {
            long long v29 = v38;
          }
          [v29 addObject:v16];
          goto LABEL_26;
        }
LABEL_27:
        ++v11;
      }
      while (v8 != v11);
      uint64_t v30 = [v6 countByEnumeratingWithState:&v46 objects:v58 count:16];
      uint64_t v8 = v30;
    }
    while (v30);
  }

  long long v31 = os_log_create("com.apple.amp.mediaplayer", "Download_Oversize");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    id v51 = v6;
    __int16 v52 = 2114;
    v53 = v34;
    __int16 v54 = 2114;
    id v55 = v36;
    __int16 v56 = 2114;
    id v57 = v35;
    _os_log_impl(&dword_1952E8000, v31, OS_LOG_TYPE_DEFAULT, "Download states did change: %{public}@, progressed downloads: %{public}@, added downloads: %{public}@, finished: %{public}@", buf, 0x2Au);
  }

  if ([(MPStoreDownload *)v34 count])
  {
    calloutSerialQueue = self->_calloutSerialQueue;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __66__MPStoreDownloadManager_downloadManager_downloadStatesDidChange___block_invoke_51;
    v42[3] = &unk_1E57F9F98;
    v42[4] = self;
    uint64_t v43 = v34;
    dispatch_async(calloutSerialQueue, v42);
  }
  [v36 removeObjectsInArray:v35];
  if ([v35 count])
  {
    long long v33 = self->_calloutSerialQueue;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __66__MPStoreDownloadManager_downloadManager_downloadStatesDidChange___block_invoke_2;
    v40[3] = &unk_1E57F9F98;
    v40[4] = self;
    id v41 = v35;
    dispatch_async(v33, v40);
  }
  if ([v36 count]) {
    [(MPStoreDownloadManager *)self _updateDownloadsWithAdditions:v36 removals:0];
  }
  [(MPStoreDownloadManager *)self _updateActiveDownloadsWithChangedActiveDownloads:v39 inactiveDownloads:v38];
}

uint64_t __66__MPStoreDownloadManager_downloadManager_downloadStatesDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_addDownloadToMapTables:", *(void *)(a1 + 40));
}

uint64_t __66__MPStoreDownloadManager_downloadManager_downloadStatesDidChange___block_invoke_51(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDownloadsDidProgressToObserversForDownloads:*(void *)(a1 + 40)];
}

void __66__MPStoreDownloadManager_downloadManager_downloadStatesDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__MPStoreDownloadManager_downloadManager_downloadStatesDidChange___block_invoke_3;
  v3[3] = &unk_1E57F9F70;
  v3[4] = v2;
  id v4 = v1;
  [v2 _sendDownloadsDidFinishToObserversForDownloads:v4 notifyDownloadManager:1 completionHandler:v3];
}

uint64_t __66__MPStoreDownloadManager_downloadManager_downloadStatesDidChange___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDownloadsWithAdditions:0 removals:*(void *)(a1 + 40)];
}

- (void)purchaseManager:(id)a3 didFinishPurchasesWithResponses:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v20 = self;
  uint64_t v23 = [(MPStoreDownloadManager *)self downloads];
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v5;
  uint64_t v24 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v24)
  {
    uint64_t v22 = *(void *)v33;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v7;
        uint64_t v8 = *(void **)(*((void *)&v32 + 1) + 8 * v7);
        uint64_t v9 = [v8 purchase];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v10 = v23;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v29 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              long long v16 = [v15 _SSPurchase];
              int v17 = [v16 isEqual:v9];

              if (v17)
              {
                [v15 _setSSPurchase:0 SSPurchaseResponse:v8];
                if (([v15 isFinished] & 1) == 0) {
                  [v6 addObject:v15];
                }
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v12);
        }

        uint64_t v7 = v25 + 1;
      }
      while (v25 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v24);
  }

  calloutSerialQueue = v20->_calloutSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__MPStoreDownloadManager_purchaseManager_didFinishPurchasesWithResponses___block_invoke;
  block[3] = &unk_1E57F9F98;
  void block[4] = v20;
  id v27 = v6;
  id v19 = v6;
  dispatch_async(calloutSerialQueue, block);
}

uint64_t __74__MPStoreDownloadManager_purchaseManager_didFinishPurchasesWithResponses___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDownloadsDidFinishPurchasesToObserversForDownloads:*(void *)(a1 + 40)];
}

- (void)requestPermissionToDownloadWithType:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = v6;
  if (a3 == 1)
  {
    if (v6)
    {
      calloutSerialQueue = self->_calloutSerialQueue;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __80__MPStoreDownloadManager_requestPermissionToDownloadWithType_completionHandler___block_invoke_2;
      v13[3] = &unk_1E57FA198;
      uint64_t v14 = v6;
      dispatch_async(calloutSerialQueue, v13);
      uint64_t v9 = v14;
      goto LABEL_9;
    }
  }
  else
  {
    if (a3 != 2)
    {
      uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "Download");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = (objc_class *)objc_opt_class();
        uint64_t v12 = NSStringFromClass(v11);
        *(_DWORD *)buf = 138543618;
        long long v18 = v12;
        __int16 v19 = 2048;
        int64_t v20 = a3;
        _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] UNKNOWN PURCHASE TYPE: %li", buf, 0x16u);
      }
      goto LABEL_9;
    }
    if (v6)
    {
      uint64_t v8 = self->_calloutSerialQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__MPStoreDownloadManager_requestPermissionToDownloadWithType_completionHandler___block_invoke;
      block[3] = &unk_1E57FA198;
      long long v16 = v6;
      dispatch_async(v8, block);
      uint64_t v9 = v16;
LABEL_9:
    }
  }
}

uint64_t __80__MPStoreDownloadManager_requestPermissionToDownloadWithType_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__MPStoreDownloadManager_requestPermissionToDownloadWithType_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reloadFromServer
{
}

- (void)removeObserver:(id)a3 forDownloads:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__MPStoreDownloadManager_removeObserver_forDownloads___block_invoke;
    block[3] = &unk_1E57FA038;
    id v11 = v7;
    uint64_t v12 = self;
    id v13 = v6;
    dispatch_barrier_sync(accessQueue, block);
  }
}

void __54__MPStoreDownloadManager_removeObserver_forDownloads___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v2 = *(id *)(a1 + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v26 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v8 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 72), "objectForKey:", v7, (void)v25);
          [v8 removeObject:*(void *)(a1 + 48)];
          if (![v8 count]) {
            [*(id *)(*(void *)(a1 + 40) + 72) removeObjectForKey:v7];
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v4);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 40) + 88) removeObject:*(void *)(a1 + 48)];
    if (![*(id *)(*(void *)(a1 + 40) + 88) count])
    {
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = *(void **)(v9 + 88);
      *(void *)(v9 + 88) = 0;
    }
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v12 = [*(id *)(*(void *)(a1 + 40) + 72) keyEnumerator];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v33 + 1) + 8 * j);
          long long v18 = [*(id *)(*(void *)(a1 + 40) + 72) objectForKey:v17];
          if ([v18 containsObject:*(void *)(a1 + 48)]
            && (![*(id *)(a1 + 32) count]
             || [*(id *)(a1 + 32) containsObject:v17]))
          {
            [v18 removeObject:*(void *)(a1 + 48)];
          }
          if (![v18 count]) {
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v14);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v2 = v11;
    uint64_t v19 = [v2 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v30;
      do
      {
        for (uint64_t k = 0; k != v20; ++k)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*(void *)(a1 + 40) + 72) removeObjectForKey:*(void *)(*((void *)&v29 + 1) + 8 * k)];
        }
        uint64_t v20 = [v2 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v20);
    }
  }
  if (![*(id *)(*(void *)(a1 + 40) + 72) count])
  {
    uint64_t v23 = *(void *)(a1 + 40);
    uint64_t v24 = *(void **)(v23 + 72);
    *(void *)(v23 + 72) = 0;
  }
}

- (void)prioritizeDownloads:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v4 = [a3 reverseObjectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v31 count:16];
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
        uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v10 = [v9 _SSDownload];
        id v11 = v10;
        if (v10)
        {
          downloadManager = self->_downloadManager;
          if (downloadManager)
          {
            v20[0] = MEMORY[0x1E4F143A8];
            v20[1] = 3221225472;
            v20[2] = __46__MPStoreDownloadManager_prioritizeDownloads___block_invoke;
            v20[3] = &unk_1E57FA148;
            v20[4] = v9;
            id v21 = v10;
            [(SSDownloadManager *)downloadManager moveDownload:v21 afterDownload:0 completionBlock:v20];

            goto LABEL_18;
          }
          uint64_t v14 = os_log_create("com.apple.amp.mediaplayer", "Download");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPStoreDownloadErrorDomain" code:-5002 userInfo:0];
            *(_DWORD *)buf = 138543618;
            long long v28 = v9;
            __int16 v29 = 2114;
            long long v30 = v17;
            _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_ERROR, "Failed to move download: %{public}@ with error: %{public}@", buf, 0x16u);
LABEL_16:
          }
        }
        else
        {
          uint64_t v13 = [v9 _SSPurchase];
          uint64_t v14 = v13;
          if (v13)
          {
            purchaseManager = self->_purchaseManager;
            if (!purchaseManager)
            {
              uint64_t v17 = os_log_create("com.apple.amp.mediaplayer", "Download");
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                long long v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPStoreDownloadErrorDomain" code:-5002 userInfo:0];
                *(_DWORD *)buf = 138543618;
                long long v28 = v9;
                __int16 v29 = 2114;
                long long v30 = v18;
                _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_ERROR, "Failed to move purchase: %{public}@ with error: %{public}@", buf, 0x16u);
              }
              goto LABEL_16;
            }
            uint64_t v26 = v13;
            long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
            v19[0] = MEMORY[0x1E4F143A8];
            v19[1] = 3221225472;
            v19[2] = __46__MPStoreDownloadManager_prioritizeDownloads___block_invoke_49;
            v19[3] = &unk_1E57FA170;
            v19[4] = v9;
            [(SSPurchaseManager *)purchaseManager movePurchases:v16 afterPurchase:0 withCompletionBlock:v19];
          }
        }

LABEL_18:
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v31 count:16];
    }
    while (v6);
  }
}

void __46__MPStoreDownloadManager_prioritizeDownloads___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = os_log_create("com.apple.amp.mediaplayer", "Download");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "Failed to move download: %{public}@ with error: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  else
  {
    [*(id *)(a1 + 40) prioritizeAboveDownload:0 completionBlock:0];
  }
}

void __46__MPStoreDownloadManager_prioritizeDownloads___block_invoke_49(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    int v6 = os_log_create("com.apple.amp.mediaplayer", "Download");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_ERROR, "Failed to move purchase: %{public}@ with error: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (id)downloadForDownloadPersistentIdentifier:(int64_t)a3
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  __int16 v10 = __Block_byref_object_copy__56245;
  id v11 = __Block_byref_object_dispose__56246;
  id v12 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MPStoreDownloadManager_downloadForDownloadPersistentIdentifier___block_invoke;
  block[3] = &unk_1E57FA120;
  void block[5] = &v7;
  block[6] = a3;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __66__MPStoreDownloadManager_downloadForDownloadPersistentIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = NSMapGet(*(NSMapTable **)(a1[4] + 64), a1 + 6);
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)restartDownloads:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v36 + 1) + 8 * v10) _SSDownload];
        if (v11) {
          [v5 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v8);
  }

  [(MPStoreDownloadManager *)self _updateDownloadsWithAdditions:v6 removals:0];
  id v12 = dispatch_group_create();
  if ([v5 count])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v32 + 1) + 8 * v17++) _addOverridePhaseIdentifier:@"MPStoreDownloadPhaseWaiting"];
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v15);
    }

    dispatch_group_enter(v12);
    downloadManager = self->_downloadManager;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __43__MPStoreDownloadManager_restartDownloads___block_invoke;
    v27[3] = &unk_1E57FA060;
    id v28 = v13;
    __int16 v29 = self;
    id v30 = v5;
    long long v31 = v12;
    [(SSDownloadManager *)downloadManager restartDownloads:v30 completionBlock:v27];
  }
  calloutSerialQueue = self->_calloutSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MPStoreDownloadManager_restartDownloads___block_invoke_48;
  block[3] = &unk_1E57F9F98;
  void block[4] = self;
  id v20 = v6;
  id v26 = v20;
  dispatch_async(calloutSerialQueue, block);
  id v21 = self->_calloutSerialQueue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __43__MPStoreDownloadManager_restartDownloads___block_invoke_2;
  v23[3] = &unk_1E57F9F98;
  v23[4] = self;
  id v24 = v20;
  id v22 = v20;
  dispatch_group_notify(v12, v21, v23);
}

void __43__MPStoreDownloadManager_restartDownloads___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v16 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v9 _removeOverridePhaseIdentifier:@"MPStoreDownloadPhaseWaiting"];
        uint64_t v10 = *(void **)(a1 + 40);
        id v11 = [v9 _SSDownload];
        id v12 = [v10 _existingDownloadForSSDownload:v11];

        if (!v12)
        {
          if (!v6) {
            id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v6 addObject:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  if (v16)
  {
    id v13 = os_log_create("com.apple.amp.mediaplayer", "Download");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      id v22 = v14;
      __int16 v23 = 2114;
      id v24 = v16;
      _os_log_impl(&dword_1952E8000, v13, OS_LOG_TYPE_ERROR, "Failed to restart downloads %{public}@ with error %{public}@", buf, 0x16u);
    }
  }
  if ([v6 count])
  {
    uint64_t v15 = os_log_create("com.apple.amp.mediaplayer", "Download");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v6;
      _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_ERROR, "Finished attempted restart with removed downloads: %{public}@", buf, 0xCu);
    }

    [*(id *)(a1 + 40) _updateDownloadsWithAdditions:0 removals:v6];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __43__MPStoreDownloadManager_restartDownloads___block_invoke_48(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDownloadsDidProgressToObserversForDownloads:*(void *)(a1 + 40)];
}

uint64_t __43__MPStoreDownloadManager_restartDownloads___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDownloadsDidProgressToObserversForDownloads:*(void *)(a1 + 40)];
}

- (void)resumeDownloads:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v35 + 1) + 8 * v10) _SSDownload];
        if (v11) {
          [v5 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v8);
  }

  id v12 = dispatch_group_create();
  if ([v5 count])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v32;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * v17++) _addOverridePhaseIdentifier:@"MPStoreDownloadPhaseWaiting"];
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v15);
    }

    dispatch_group_enter(v12);
    downloadManager = self->_downloadManager;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __42__MPStoreDownloadManager_resumeDownloads___block_invoke;
    v27[3] = &unk_1E57FA0C8;
    id v28 = v13;
    id v29 = v5;
    id v30 = v12;
    [(SSDownloadManager *)downloadManager resumeDownloads:v29 completionBlock:v27];
  }
  calloutSerialQueue = self->_calloutSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MPStoreDownloadManager_resumeDownloads___block_invoke_47;
  block[3] = &unk_1E57F9F98;
  void block[4] = self;
  id v20 = v6;
  id v26 = v20;
  dispatch_async(calloutSerialQueue, block);
  id v21 = self->_calloutSerialQueue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __42__MPStoreDownloadManager_resumeDownloads___block_invoke_2;
  v23[3] = &unk_1E57F9F98;
  v23[4] = self;
  id v24 = v20;
  id v22 = v20;
  dispatch_group_notify(v12, v21, v23);
}

void __42__MPStoreDownloadManager_resumeDownloads___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8++), "_removeOverridePhaseIdentifier:", @"MPStoreDownloadPhaseWaiting", (void)v11);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v6);
  }

  if (v3)
  {
    uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "Download");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v10;
      __int16 v17 = 2114;
      id v18 = v3;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_ERROR, "Failed to resume downloads %{public}@ with error %{public}@", buf, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __42__MPStoreDownloadManager_resumeDownloads___block_invoke_47(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDownloadsDidProgressToObserversForDownloads:*(void *)(a1 + 40)];
}

uint64_t __42__MPStoreDownloadManager_resumeDownloads___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDownloadsDidProgressToObserversForDownloads:*(void *)(a1 + 40)];
}

- (void)pauseDownloads:(id)a3
{
  long long v27 = self;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  id v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  id v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v48 != v9) {
          objc_enumerationMutation(v4);
        }
        long long v11 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        long long v12 = objc_msgSend(v11, "_SSDownload", v27);
        if (v12)
        {
          [v11 _addOverridePhaseIdentifier:@"MPStoreDownloadPhasePaused"];
          if (!v8) {
            uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
          }
          [v8 addObject:v11];
          [v31 addObject:v12];
          [v30 addObject:v11];
        }
        else
        {
          long long v13 = [v11 _SSPurchase];
          if (v13)
          {
            [v11 _addOverridePhaseIdentifier:@"MPStoreDownloadPhaseCanceled"];
            if (!v7) {
              uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
            }
            [v7 addObject:v11];
            [v29 addObject:v13];
            [v28 addObject:v11];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }

  long long v14 = dispatch_group_create();
  uint64_t v15 = v27;
  if ([v31 count])
  {
    if (v27->_downloadManager)
    {
      dispatch_group_enter(v14);
      downloadManager = v27->_downloadManager;
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __41__MPStoreDownloadManager_pauseDownloads___block_invoke;
      v43[3] = &unk_1E57FA0C8;
      uint64_t v44 = v8;
      id v45 = v31;
      long long v46 = v14;
      [(SSDownloadManager *)downloadManager pauseDownloads:v45 completionBlock:v43];

      __int16 v17 = v44;
    }
    else
    {
      __int16 v17 = os_log_create("com.apple.amp.mediaplayer", "Download");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPStoreDownloadErrorDomain" code:-5002 userInfo:0];
        *(_DWORD *)buf = 138543618;
        __int16 v52 = v31;
        __int16 v53 = 2114;
        __int16 v54 = v18;
        _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_ERROR, "Failed to pause downloads %{public}@ with error %{public}@", buf, 0x16u);
      }
    }
  }
  if (objc_msgSend(v29, "count", v27))
  {
    if (v15->_purchaseManager)
    {
      dispatch_group_enter(v14);
      purchaseManager = v15->_purchaseManager;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __41__MPStoreDownloadManager_pauseDownloads___block_invoke_45;
      v37[3] = &unk_1E57FA0F0;
      long long v38 = v7;
      id v39 = v29;
      id v40 = v28;
      uint64_t v41 = v15;
      uint64_t v42 = v14;
      [(SSPurchaseManager *)purchaseManager cancelPurchases:v39 withCompletionBlock:v37];

      uint64_t v20 = v38;
    }
    else
    {
      uint64_t v20 = os_log_create("com.apple.amp.mediaplayer", "Download");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPStoreDownloadErrorDomain" code:-5002 userInfo:0];
        *(_DWORD *)buf = 138543618;
        __int16 v52 = v31;
        __int16 v53 = 2114;
        __int16 v54 = v21;
        _os_log_impl(&dword_1952E8000, v20, OS_LOG_TYPE_ERROR, "Failed to pause downloads %{public}@ with error %{public}@", buf, 0x16u);
      }
    }
  }
  calloutSerialQueue = v15->_calloutSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__MPStoreDownloadManager_pauseDownloads___block_invoke_46;
  block[3] = &unk_1E57F9F98;
  void block[4] = v15;
  id v23 = v4;
  id v36 = v23;
  dispatch_async(calloutSerialQueue, block);
  id v24 = v15->_calloutSerialQueue;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __41__MPStoreDownloadManager_pauseDownloads___block_invoke_2;
  v32[3] = &unk_1E57FA038;
  v32[4] = v15;
  id v33 = v23;
  id v34 = v7;
  id v25 = v7;
  id v26 = v23;
  dispatch_group_notify(v14, v24, v32);
}

void __41__MPStoreDownloadManager_pauseDownloads___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v8++), "_removeOverridePhaseIdentifier:", @"MPStoreDownloadPhasePaused", (void)v14);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v6);
  }

  uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "Download");
  uint64_t v10 = v9;
  if (v3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      long long v12 = objc_msgSend(v3, "msv_description");
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v11;
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_ERROR, "Paused downloads %{public}@ error=%{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = v13;
    _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEFAULT, "Paused downloads %{public}@", buf, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __41__MPStoreDownloadManager_pauseDownloads___block_invoke_45(uint64_t a1, char a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * v10++) _removeOverridePhaseIdentifier:@"MPStoreDownloadPhaseCanceled"];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v8);
  }

  uint64_t v11 = os_log_create("com.apple.amp.mediaplayer", "Download");
  long long v12 = v11;
  if (v5)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      long long v14 = objc_msgSend(v5, "msv_description");
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v13;
      __int16 v32 = 2114;
      id v33 = v14;
      _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_ERROR, "Caneled purchases %{public}@ error=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v31 = v15;
      _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEFAULT, "Caneled purchases %{public}@", buf, 0xCu);
    }

    if (a2)
    {
      [*(id *)(a1 + 56) _updateDownloadsWithAdditions:0 removals:*(void *)(a1 + 48)];
      goto LABEL_24;
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = *(id *)(a1 + 48);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v20++), "_setCanceled:", 0, (void)v21);
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v18);
  }

LABEL_24:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

uint64_t __41__MPStoreDownloadManager_pauseDownloads___block_invoke_46(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDownloadsDidProgressToObserversForDownloads:*(void *)(a1 + 40)];
}

uint64_t __41__MPStoreDownloadManager_pauseDownloads___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _sendDownloadsDidProgressToObserversForDownloads:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 _sendDownloadsDidFinishToObserversForDownloads:v3 notifyDownloadManager:1 completionHandler:0];
}

- (void)cancelDownloads:(id)a3
{
  uint64_t v35 = self;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v59 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "_SSDownload", v35);
        if (v13)
        {
          [v5 addObject:v13];
          [v4 addObject:v12];
        }
        else
        {
          long long v14 = [v12 _SSPurchase];
          if (v14)
          {
            [v6 addObject:v14];
            [v37 addObject:v12];
          }
        }
        [v12 _setCanceled:1];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v58 objects:v68 count:16];
    }
    while (v9);
  }

  uint64_t v15 = dispatch_group_create();
  id v16 = v35;
  if ([v5 count])
  {
    if (v35->_downloadManager)
    {
      dispatch_group_enter(v15);
      [(MPStoreDownloadManager *)v35 _updateActiveDownloadsWithCancelledDownloads:v4];
      downloadManager = v35->_downloadManager;
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __42__MPStoreDownloadManager_cancelDownloads___block_invoke;
      v53[3] = &unk_1E57FA060;
      __int16 v54 = v5;
      id v55 = v4;
      uint64_t v56 = v35;
      id v57 = v15;
      [(SSDownloadManager *)downloadManager cancelDownloads:v54 completionBlock:v53];

      uint64_t v18 = v54;
    }
    else
    {
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v19 = v4;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v49 objects:v67 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v50;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v50 != v22) {
              objc_enumerationMutation(v19);
            }
            objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * j), "_setCanceled:", 0, v35);
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v49 objects:v67 count:16];
        }
        while (v21);
      }

      uint64_t v18 = os_log_create("com.apple.amp.mediaplayer", "Download");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        long long v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPStoreDownloadErrorDomain" code:-5002 userInfo:0];
        *(_DWORD *)buf = 138543618;
        v64 = v5;
        __int16 v65 = 2114;
        id v66 = v24;
        _os_log_impl(&dword_1952E8000, v18, OS_LOG_TYPE_ERROR, "Failed to cancel downloads %{public}@ with error %{public}@", buf, 0x16u);
      }
      id v16 = v35;
    }
  }
  if (objc_msgSend(v6, "count", v35))
  {
    if (v16->_purchaseManager)
    {
      dispatch_group_enter(v15);
      [(MPStoreDownloadManager *)v16 _updateActiveDownloadsWithCancelledDownloads:v37];
      purchaseManager = v16->_purchaseManager;
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __42__MPStoreDownloadManager_cancelDownloads___block_invoke_43;
      v44[3] = &unk_1E57FA090;
      id v45 = v6;
      id v46 = v37;
      long long v47 = v16;
      long long v48 = v15;
      [(SSPurchaseManager *)purchaseManager cancelPurchases:v45 withCompletionBlock:v44];

      long long v26 = v45;
    }
    else
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v27 = v37;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v40 objects:v62 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v41;
        do
        {
          for (uint64_t k = 0; k != v29; ++k)
          {
            if (*(void *)v41 != v30) {
              objc_enumerationMutation(v27);
            }
            [*(id *)(*((void *)&v40 + 1) + 8 * k) _setCanceled:0];
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v40 objects:v62 count:16];
        }
        while (v29);
      }

      long long v26 = os_log_create("com.apple.amp.mediaplayer", "Download");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        __int16 v32 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPStoreDownloadErrorDomain" code:-5002 userInfo:0];
        *(_DWORD *)buf = 138543618;
        v64 = v6;
        __int16 v65 = 2114;
        id v66 = v32;
        _os_log_impl(&dword_1952E8000, v26, OS_LOG_TYPE_ERROR, "Failed to cancel purchases %{public}@ with error %{public}@", buf, 0x16u);
      }
      id v16 = v36;
    }
  }
  calloutSerialQueue = v16->_calloutSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MPStoreDownloadManager_cancelDownloads___block_invoke_44;
  block[3] = &unk_1E57F9F98;
  void block[4] = v16;
  id v39 = v7;
  id v34 = v7;
  dispatch_group_notify(v15, calloutSerialQueue, block);
}

void __42__MPStoreDownloadManager_cancelDownloads___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.mediaplayer", "Download");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = objc_msgSend(v3, "msv_description");
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v6;
      __int16 v21 = 2114;
      uint64_t v22 = v7;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "Cancelled downloads %{public}@ error=%{public}@", buf, 0x16u);
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12++), "_setCanceled:", 0, (void)v14);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }

    [*(id *)(a1 + 48) _addNonCancelledDownloadsToActiveList:*(void *)(a1 + 40)];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v13;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "Cancelled downloads %{public}@", buf, 0xCu);
    }

    [*(id *)(a1 + 48) _updateDownloadsWithAdditions:0 removals:*(void *)(a1 + 40)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __42__MPStoreDownloadManager_cancelDownloads___block_invoke_43(uint64_t a1, int a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "Download");
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = objc_msgSend(v5, "msv_description");
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = v8;
      __int16 v23 = 1024;
      int v24 = a2;
      __int16 v25 = 2114;
      long long v26 = v9;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "Cancelled purchases %{public}@, result %d error=%{public}@", buf, 0x1Cu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v10;
      __int16 v23 = 1024;
      int v24 = a2;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "Cancelled purchases %{public}@, result %d", buf, 0x12u);
    }

    if (a2)
    {
      [*(id *)(a1 + 48) _updateDownloadsWithAdditions:0 removals:*(void *)(a1 + 40)];
      goto LABEL_17;
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "_setCanceled:", 0, (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }

  [*(id *)(a1 + 48) _addNonCancelledDownloadsToActiveList:*(void *)(a1 + 40)];
LABEL_17:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __42__MPStoreDownloadManager_cancelDownloads___block_invoke_44(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDownloadsDidFinishToObserversForDownloads:*(void *)(a1 + 40) notifyDownloadManager:1 completionHandler:0];
}

- (void)addFinishHandler:(id)a3 forDownloads:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, void *))a3;
  id v8 = a4;
  if (![v8 count])
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"MPStoreDownloadManager.m" lineNumber:397 description:@"Downloads must not be empty."];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v14, "isFinished", (void)v17))
        {
          if (v7) {
            v7[2](v7, v14);
          }
        }
        else
        {
          uint64_t v15 = [[_MPStoreDownloadBlockObserver alloc] initWithDownload:v14];
          [(_MPStoreDownloadBlockObserver *)v15 setDidFinishDownloadHandler:v7];
          [(MPStoreDownloadManager *)self _registerBlockObserver:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (id)addDownloads:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v35;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v35 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v34 + 1) + 8 * v7);
        id location = 0;
        p_id location = &location;
        uint64_t v30 = 0x3032000000;
        uint64_t v31 = __Block_byref_object_copy__56245;
        __int16 v32 = __Block_byref_object_dispose__56246;
        id v33 = 0;
        accessQueue = self->_accessQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __39__MPStoreDownloadManager_addDownloads___block_invoke;
        block[3] = &unk_1E57F9F48;
        void block[5] = v8;
        block[6] = &location;
        void block[4] = self;
        dispatch_sync(accessQueue, block);
        if (p_location[5])
        {
          objc_msgSend(v20, "addObject:");
        }
        else
        {
          uint64_t v10 = [v8 _SSPurchase];
          if (v10)
          {
            [v16 addObject:v10];
            [v18 addObject:v8];
            [v20 addObject:v8];
          }
        }
        _Block_object_dispose(&location, 8);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v5);
  }

  if ([v18 count]) {
    [(MPStoreDownloadManager *)self _updateDownloadsWithAdditions:v18 removals:0];
  }
  if (objc_msgSend(v16, "count", v16))
  {
    if (self->_purchaseManager)
    {
      objc_initWeak(&location, self);
      purchaseManager = self->_purchaseManager;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __39__MPStoreDownloadManager_addDownloads___block_invoke_2;
      v24[3] = &unk_1E57F9FC0;
      objc_copyWeak(&v26, &location);
      id v25 = v18;
      [(SSPurchaseManager *)purchaseManager addPurchases:v17 withCompletionBlock:v24];

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_initWeak(&location, self);
      calloutSerialQueue = self->_calloutSerialQueue;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __39__MPStoreDownloadManager_addDownloads___block_invoke_5;
      v21[3] = &unk_1E57FA010;
      v21[4] = self;
      id v22 = v18;
      objc_copyWeak(&v23, &location);
      dispatch_async(calloutSerialQueue, v21);
      objc_destroyWeak(&v23);

      objc_destroyWeak(&location);
    }
  }
  if ([v20 count]) {
    uint64_t v13 = v20;
  }
  else {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v14 = v13;

  return v14;
}

void __39__MPStoreDownloadManager_addDownloads___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) _SSDownload];
  id v3 = [*(id *)(a1 + 40) _SSPurchase];
  uint64_t v4 = objc_msgSend(v2, "_onQueue_findStoreDownloadWithSSDownload:SSPurchase:", v7, v3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __39__MPStoreDownloadManager_addDownloads___block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (a3) {
    char v8 = 0;
  }
  else {
    char v8 = a2;
  }
  if ((v8 & 1) == 0 && WeakRetained)
  {
    id v9 = WeakRetained[3];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __39__MPStoreDownloadManager_addDownloads___block_invoke_3;
    v10[3] = &unk_1E57F9F98;
    uint64_t v11 = WeakRetained;
    id v12 = *(id *)(a1 + 32);
    dispatch_async(v9, v10);
  }
}

void __39__MPStoreDownloadManager_addDownloads___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__MPStoreDownloadManager_addDownloads___block_invoke_6;
  v4[3] = &unk_1E57F9FE8;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  id v5 = *(id *)(a1 + 40);
  [v2 _sendDownloadsDidFinishToObserversForDownloads:v3 notifyDownloadManager:0 completionHandler:v4];

  objc_destroyWeak(&v6);
}

void __39__MPStoreDownloadManager_addDownloads___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateDownloadsWithAdditions:0 removals:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void __39__MPStoreDownloadManager_addDownloads___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__MPStoreDownloadManager_addDownloads___block_invoke_4;
  v4[3] = &unk_1E57F9F70;
  id v5 = v2;
  id v6 = *(id *)(a1 + 40);
  [v5 _sendDownloadsDidFinishToObserversForDownloads:v3 notifyDownloadManager:0 completionHandler:v4];
}

uint64_t __39__MPStoreDownloadManager_addDownloads___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDownloadsWithAdditions:0 removals:*(void *)(a1 + 40)];
}

- (id)activeDownloadForStoreID:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(MPStoreDownloadManager *)self activeDownloads];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "storeItemIdentifier", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)activeDownloadForMediaItemPersistentID:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(MPStoreDownloadManager *)self activeDownloads];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "libraryItemIdentifier", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)isUsingNetwork
{
  return [(SSDownloadManager *)self->_downloadManager isUsingNetwork];
}

- (NSArray)userDownloads
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__56245;
  id v10 = __Block_byref_object_dispose__56246;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__MPStoreDownloadManager_userDownloads__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __39__MPStoreDownloadManager_userDownloads__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)downloads
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__56245;
  id v11 = __Block_byref_object_dispose__56246;
  id v12 = 0;
  accessQueue = self->_accessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__MPStoreDownloadManager_downloads__block_invoke;
  v6[3] = &unk_1E57F9F20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(accessQueue, v6);
  if ([(id)v8[5] count]) {
    uint64_t v3 = (void *)v8[5];
  }
  else {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __35__MPStoreDownloadManager_downloads__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)activeDownloads
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__56245;
  id v10 = __Block_byref_object_dispose__56246;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__MPStoreDownloadManager_activeDownloads__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __41__MPStoreDownloadManager_activeDownloads__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)dealloc
{
  [(SSDownloadManager *)self->_downloadManager removeObserver:self];
  [(SSPurchaseManager *)self->_purchaseManager setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MPStoreDownloadManager;
  [(MPStoreDownloadManager *)&v3 dealloc];
}

- (MPStoreDownloadManager)init
{
  return 0;
}

@end