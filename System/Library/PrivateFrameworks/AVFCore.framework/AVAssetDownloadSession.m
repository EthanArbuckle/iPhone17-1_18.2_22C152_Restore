@interface AVAssetDownloadSession
+ (id)assetDownloadSessionWithAsset:(id)a3 destinationURL:(id)a4 options:(id)a5;
+ (id)assetDownloadSessionWithAsset:(id)a3 mediaSelections:(id)a4 destinationURL:(id)a5 options:(id)a6;
+ (id)assetDownloadSessionWithDownloadToken:(unint64_t)a3;
+ (id)assetDownloadSessionWithURL:(id)a3 destinationURL:(id)a4 options:(id)a5;
+ (void)registerDownloadLocation:(id)a3 forURLAsset:(id)a4;
- (AVAssetDownloadSession)init;
- (AVAssetDownloadSession)initWithAsset:(id)a3 mediaSelections:(id)a4 destinationURL:(id)a5 options:(id)a6;
- (AVAssetDownloadSession)initWithDownloadToken:(unint64_t)a3;
- (AVAssetDownloadSession)initWithURL:(id)a3 destinationURL:(id)a4 options:(id)a5;
- (AVMediaSelection)resolvedMediaSelection;
- (BOOL)ensureProgressTimerIsRunningOnQueueWithError:(id *)a3;
- (BOOL)isDefunct;
- (NSArray)loadedTimeRanges;
- (NSError)error;
- (NSURL)URL;
- (NSURL)destinationURL;
- (OpaqueFigAsset)_createDuplicateFigAssetFromAVAsset:(id)a3 options:(id)a4;
- (OpaqueFigAsset)_figAsset;
- (OpaqueFigPlaybackItem)_playbackItem;
- (id)_common_init;
- (id)_errorForFigNotificationPayload:(__CFDictionary *)a3 key:(__CFString *)a4;
- (id)_errorFromAssetNotificationPayload:(id)a3;
- (id)_figAssetNotificationNames;
- (id)_figPlaybackItemNotificationNames;
- (id)_setupFigClientObjectForFileDownload:(id)a3;
- (id)_setupFigClientObjectForStreaming:(id)a3;
- (id)_startOnQueue;
- (id)_startOnQueueFirstTime;
- (id)_verifyDownloadConfigurationForAssetType;
- (id)_weakReference;
- (int)_primeCache;
- (int)_readyForInspection;
- (int)_setFileFigAsset:(OpaqueFigAsset *)a3 options:(id)a4;
- (int64_t)priority;
- (int64_t)status;
- (unint64_t)availableFileSize;
- (unint64_t)countOfBytesReceived;
- (unint64_t)downloadToken;
- (unint64_t)fileSize;
- (void)_addFigAssetListeners;
- (void)_addFigPlaybackItemListeners;
- (void)_downloadFailureCallbackWithError:(id)a3;
- (void)_downloadSuccessCallback;
- (void)_primeCacheOnDispatchQueue;
- (void)_removeFigAssetListeners;
- (void)_removeFigPlaybackItemListeners;
- (void)_sendDidFinishDownloadForMediaSelectionWithMediaSelection:(id)a3;
- (void)_sendDidResolveMediaSelectionWithMediaSelection:(id)a3;
- (void)_sendDownloadFailureToDelegateWithError:(id)a3;
- (void)_sendDownloadSuccessToDelegate;
- (void)_sendLoadedTimeRangesChangedToDelegateWithNewlyLoadedTimeRange:(id)a3 currentLoadedTimeRanges:(id)a4 timeRangeExpectedToLoad:(id)a5 selectedMediaArray:(id)a6;
- (void)_sendProgessUpdateWithExpectedBytesToDownload:(unint64_t)a3 bytesDownloaded:(unint64_t)a4;
- (void)_sendWillDownloadVariants:(id)a3;
- (void)_setupFigClientObjectAsync:(id)a3;
- (void)_startLoadingMetadataOnQueue;
- (void)_transitionToTerminalStatus:(int64_t)a3 error:(id)a4;
- (void)cancelAndReleaseProgressTimerOnQueue;
- (void)dealloc;
- (void)pause;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)start;
- (void)startLoadingMetadata;
- (void)stop;
@end

@implementation AVAssetDownloadSession

- (id)_common_init
{
  v3 = objc_alloc_init(AVAssetDownloadSessionInternal);
  self->_internal = v3;
  if (v3)
  {
    CFRetain(v3);
    self->_internal->weakReference = [[AVWeakReference alloc] initWithReferencedObject:self];
    self->_internal->delegateStorage = objc_alloc_init(AVWeakReferencingDelegateStorage);
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    self->_internal->stateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avassetdownloadsession", v4);
    self->_internal->status = 0;
    self->_internal->error = 0;
    self->_internal->priority = 0;
  }
  else
  {

    return 0;
  }
  return self;
}

- (AVAssetDownloadSession)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetDownloadSession;
  result = [(AVAssetDownloadSession *)&v3 init];
  if (result) {
    return (AVAssetDownloadSession *)[(AVAssetDownloadSession *)result _common_init];
  }
  return result;
}

- (AVAssetDownloadSession)initWithURL:(id)a3 destinationURL:(id)a4 options:(id)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  v69.receiver = self;
  v69.super_class = (Class)AVAssetDownloadSession;
  v9 = [(AVAssetDownloadSession *)&v69 init];
  if (v9)
  {
    v10 = [(AVAssetDownloadSession *)v9 _common_init];
    if (a3) {
      goto LABEL_3;
    }
LABEL_55:
    v47 = v10;
    v53 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v54 = *MEMORY[0x1E4F1C3C8];
    v55 = "URL != nil";
LABEL_57:
    uint64_t v62 = (uint64_t)v55;
    v57 = @"invalid parameter not satisfying: %s";
    v58 = (objc_class *)v10;
    v59 = a2;
    goto LABEL_58;
  }
  v10 = 0;
  if (!a3) {
    goto LABEL_55;
  }
LABEL_3:
  if (([a4 isFileURL] & 1) == 0)
  {
    v56 = v10;
    v53 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v54 = *MEMORY[0x1E4F1C3C8];
    v55 = "[destinationURL isFileURL]";
    goto LABEL_57;
  }
  if (!v10) {
    return v10;
  }
  SEL v63 = a2;
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
  figAssetCreationFlagsForAssetReferenceRestrictions(2);
  v10->_internal->URL = (NSURL *)[a3 copy];
  v10->_internal->destinationURL = (NSURL *)[a4 copy];
  v12 = (void *)[a5 objectForKey:@"AVAssetDownloadSessionPriorityKey"];
  if (v12) {
    v10->_internal->priority = (int)[v12 intValue];
  }
  v10->_internal->cachePrimingDownloadTokenNum = (NSNumber *)objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"AVAssetDownloadSessionCachePrimingDownloadTokenKey"), "copy");
  uint64_t v13 = [a5 objectForKey:@"AVAssetDownloadSessionProtectedContentSupportStorageURLKey"];
  uint64_t v14 = [a5 objectForKey:@"AVAssetDownloadSessionPurchaseBundleKey"];
  uint64_t v15 = [a5 objectForKey:@"AVAssetDownloadSessionAirPlayAuthorizationInfoKey"];
  uint64_t v16 = v15;
  if (v13 || v14 || v15)
  {
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    v18 = v17;
    if (v13) {
      [v17 setValue:v13 forKey:*MEMORY[0x1E4F31C40]];
    }
    if (v14) {
      [v18 setValue:v14 forKey:*MEMORY[0x1E4F31C48]];
    }
    if (v16) {
      [v18 setValue:v16 forKey:*MEMORY[0x1E4F31C38]];
    }
    [v11 setObject:v18 forKey:*MEMORY[0x1E4F31F78]];
  }
  v19 = (void *)[a5 objectForKey:@"AVAssetDownloadSessionHTTPCookiesKey"];
  if ([v19 count])
  {
    v20 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count"));
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    uint64_t v21 = [v19 countByEnumeratingWithState:&v65 objects:v70 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v66 != v23) {
            objc_enumerationMutation(v19);
          }
          uint64_t v25 = [*(id *)(*((void *)&v65 + 1) + 8 * i) properties];
          if (v25) {
            [v20 addObject:v25];
          }
        }
        uint64_t v22 = [v19 countByEnumeratingWithState:&v65 objects:v70 count:16];
      }
      while (v22);
    }
    [v11 setObject:v20 forKey:*MEMORY[0x1E4F31EF8]];
  }
  uint64_t v26 = [a5 objectForKey:@"AVAssetDownloadSessionClientAuditTokenKey"];
  if (v26) {
    [v11 setObject:v26 forKey:*MEMORY[0x1E4F31F60]];
  }
  uint64_t v27 = [a5 objectForKey:@"AVAssetDownloadSessionClientBundleIdentifierKey"];
  if (v27) {
    [v11 setObject:v27 forKey:*MEMORY[0x1E4F31F68]];
  }
  [v11 setObject:v10->_internal->destinationURL forKey:*MEMORY[0x1E4F31FC8]];
  if (v10->_internal->priority == -1) {
    [v11 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F31FD0]];
  }
  uint64_t v28 = [a5 objectForKey:@"AVAssetDownloadSessioniTunesStoreContentInfoKey"];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
    uint64_t v31 = [v29 objectForKey:@"AVAssetDownloadSessioniTunesStoreContentIDKey"];
    uint64_t v32 = [v29 objectForKey:@"AVAssetDownloadSessioniTunesStoreContentTypeKey"];
    v33 = v10;
    v34 = v11;
    uint64_t v35 = [v29 objectForKey:@"AVAssetDownloadSessioniTunesStoreContentUserAgentKey"];
    uint64_t v36 = [v29 objectForKey:@"AVAssetDownloadSessioniTunesStoreContentDownloadParametersKey"];
    uint64_t v37 = [v29 objectForKey:@"AVAssetDownloadSessioniTunesStoreContentDSIDKey"];
    uint64_t v64 = [v29 objectForKey:@"AVAssetDownloadSessioniTunesStoreContentPurchasedMediaKindKey"];
    uint64_t v38 = [v29 objectForKey:@"AVURLAssetiTunesStoreContentRentalIDKey"];
    [v30 setValue:v31 forKey:*MEMORY[0x1E4F325D8]];
    [v30 setValue:v32 forKey:*MEMORY[0x1E4F325F0]];
    uint64_t v39 = v35;
    v11 = v34;
    v10 = v33;
    [v30 setValue:v39 forKey:*MEMORY[0x1E4F325F8]];
    [v30 setValue:v36 forKey:*MEMORY[0x1E4F325C8]];
    [v30 setValue:v37 forKey:*MEMORY[0x1E4F325C0]];
    [v30 setValue:v64 forKey:*MEMORY[0x1E4F325E0]];
    [v30 setValue:v38 forKey:*MEMORY[0x1E4F325E8]];
    [v11 setObject:v30 forKey:*MEMORY[0x1E4F32130]];
  }
  uint64_t v40 = [a5 objectForKey:@"AVAssetDownloadSessionHTTPHeaderFieldsKey"];
  if (v40) {
    [v11 setObject:v40 forKey:*MEMORY[0x1E4F32000]];
  }
  v41 = (void *)[a5 objectForKey:@"AVAssetDownloadSessionMaxSizeAllowedForCellularAccessKey"];
  v42 = (void *)[a5 objectForKey:@"AVAssetDownloadSessionAllowsCellularAccessKey"];
  if (v42)
  {
    int v43 = [v42 BOOLValue];
    if (!v41 || ((v43 ^ ([v41 longLongValue] == 0)) & 1) != 0)
    {
      if ((v43 & 1) == 0) {
        v41 = (void *)[MEMORY[0x1E4F28ED0] numberWithInt:0];
      }
      goto LABEL_43;
    }
    v61 = v10;
    v53 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v54 = *MEMORY[0x1E4F1C3C8];
    v57 = @"AVAssetDownloadSessionMaxSizeAllowedForCellularAccessKey and AVAssetDownloadSessionAllowsCellularAccessKey options are incompatible";
    v58 = (objc_class *)v10;
    v59 = v63;
LABEL_58:
    v60 = objc_msgSend(v53, "exceptionWithName:reason:userInfo:", v54, AVMethodExceptionReasonWithObjectAndSelector(v58, v59, (uint64_t)v57, v48, v49, v50, v51, v52, v62), 0);
    objc_exception_throw(v60);
  }
LABEL_43:
  if (v41) {
    [v11 setObject:v41 forKey:*MEMORY[0x1E4F32028]];
  }
  if (objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"AVAssetDownloadSessionOptimizeAccessForLinearMoviePlaybackKey"), "BOOLValue"))
  {
    uint64_t v44 = *MEMORY[0x1E4F1CFD0];
    [v11 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F32020]];
    [v11 setObject:v44 forKey:*MEMORY[0x1E4F32010]];
    [v11 setObject:v44 forKey:*MEMORY[0x1E4F320C8]];
    [v11 setObject:v44 forKey:*MEMORY[0x1E4F31FA0]];
    [v11 setObject:v44 forKey:*MEMORY[0x1E4F31FA8]];
  }
  uint64_t v45 = [a5 objectForKey:@"AVAssetDownloadSessionAlternativeConfigurationOptionsKey"];
  if (v45) {
    [v11 setObject:v45 forKey:*MEMORY[0x1E4F31F28]];
  }
  if (!v10->_internal->figAsset)
  {
    FigAssetRemoteCreateWithURL();

    v10 = 0;
    if (objc_msgSend(0, "_setFileFigAsset:options:"))
    {

      v10 = 0;
    }
  }

  return v10;
}

- (AVAssetDownloadSession)initWithDownloadToken:(unint64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)AVAssetDownloadSession;
  v5 = [(AVAssetDownloadSession *)&v16 init];
  if (!v5)
  {
    v7 = 0;
    if (a3) {
      return v7;
    }
LABEL_7:
    v9 = v7;
    uint64_t v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v7, a2, @"invalid parameter not satisfying: %s", v10, v11, v12, v13, v14, (uint64_t)"downloadToken > 0"), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  uint64_t v6 = [(AVAssetDownloadSession *)v5 _common_init];
  v7 = (AVAssetDownloadSession *)v6;
  if (!a3) {
    goto LABEL_7;
  }
  if (v6)
  {
    *(void *)(*(void *)(v6 + 8) + 120) = a3;
    FigAssetRemoteCopyAssetWithDownloadToken();

    return 0;
  }
  return v7;
}

- (AVAssetDownloadSession)initWithAsset:(id)a3 mediaSelections:(id)a4 destinationURL:(id)a5 options:(id)a6
{
  v27.receiver = self;
  v27.super_class = (Class)AVAssetDownloadSession;
  uint64_t v11 = [(AVAssetDownloadSession *)&v27 init];
  if (v11)
  {
    uint64_t v12 = [(AVAssetDownloadSession *)v11 _common_init];
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if (a3)
    {
LABEL_3:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v13 = v12;
        v19 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v20 = *MEMORY[0x1E4F1C3C8];
        uint64_t v21 = "(asset != nil && [asset isKindOfClass:[AVURLAsset class]]) || asset == nil";
        goto LABEL_17;
      }
      goto LABEL_7;
    }
  }
  if (![a6 objectForKeyedSubscript:@"AVAssetDownloadTaskDownloadConfigurationKey"])
  {
    uint64_t v25 = v12;
    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    uint64_t v21 = "asset != nil || options[AVAssetDownloadTaskDownloadConfigurationKey] != nil";
LABEL_17:
    uint64_t v26 = (void *)[v19 exceptionWithName:v20, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v12, a2, @"invalid parameter not satisfying: %s", v14, v15, v16, v17, v18, (uint64_t)v21), 0 reason userInfo];
    objc_exception_throw(v26);
  }
LABEL_7:
  if (a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v24 = v12;
      v19 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v20 = *MEMORY[0x1E4F1C3C8];
      uint64_t v21 = "mediaSelections == nil || [mediaSelections isKindOfClass:[NSArray class]]";
      goto LABEL_17;
    }
  }
  if (v12)
  {
    if (a3) {
      uint64_t v22 = (AVURLAsset *)a3;
    }
    else {
      uint64_t v22 = (AVURLAsset *)(id)objc_msgSend((id)objc_msgSend(a6, "objectForKeyedSubscript:", @"AVAssetDownloadTaskDownloadConfigurationKey"), "_asset");
    }
    v12->_internal->asset = v22;
    v12->_internal->URL = (NSURL *)objc_msgSend((id)objc_msgSend(a3, "URL"), "copy");
    v12->_internal->destinationURL = (NSURL *)[a5 copy];
    v12->_internal->downloadToken = [(AVURLAsset *)v12->_internal->asset downloadToken];
    v12->_internal->mediaSelections = (NSArray *)[a4 copy];
    [(AVAssetDownloadSession *)v12 _setupFigClientObjectAsync:a6];
  }
  return v12;
}

- (void)dealloc
{
  if (self->_internal)
  {
    [(AVAssetDownloadSession *)self _removeFigAssetListeners];
    [(AVAssetDownloadSession *)self _removeFigPlaybackItemListeners];
    [(AVAssetDownloadSession *)self cancelAndReleaseProgressTimerOnQueue];
    if (self->_internal->playbackItem)
    {
      uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
      if (FigBaseObject)
      {
        uint64_t v4 = FigBaseObject;
        uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
        uint64_t v6 = v5 ? v5 : 0;
        v7 = *(void (**)(uint64_t))(v6 + 24);
        if (v7) {
          v7(v4);
        }
      }
    }
    if (self->_internal->player)
    {
      uint64_t v8 = FigPlayerGetFigBaseObject();
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
        uint64_t v11 = v10 ? v10 : 0;
        uint64_t v12 = *(void (**)(uint64_t))(v11 + 24);
        if (v12) {
          v12(v9);
        }
      }
    }

    internal = self->_internal;
    stateQueue = internal->stateQueue;
    if (stateQueue)
    {
      dispatch_release(stateQueue);
      internal = self->_internal;
    }
    figAsset = internal->figAsset;
    if (figAsset)
    {
      CFRelease(figAsset);
      internal = self->_internal;
    }
    playbackItem = internal->playbackItem;
    if (playbackItem)
    {
      CFRelease(playbackItem);
      internal = self->_internal;
    }
    player = internal->player;
    if (player)
    {
      CFRelease(player);
      internal = self->_internal;
    }
    assetDownloader = internal->assetDownloader;
    if (assetDownloader)
    {
      CFRelease(assetDownloader);
      internal = self->_internal;
    }

    CFRelease(self->_internal);
  }
  v19.receiver = self;
  v19.super_class = (Class)AVAssetDownloadSession;
  [(AVAssetDownloadSession *)&v19 dealloc];
}

+ (id)assetDownloadSessionWithURL:(id)a3 destinationURL:(id)a4 options:(id)a5
{
  uint64_t v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithURL:a3 destinationURL:a4 options:a5];
  return v5;
}

+ (id)assetDownloadSessionWithDownloadToken:(unint64_t)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDownloadToken:a3];
  return v3;
}

+ (id)assetDownloadSessionWithAsset:(id)a3 destinationURL:(id)a4 options:(id)a5
{
  uint64_t v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAsset:a3 mediaSelections:0 destinationURL:a4 options:a5];
  return v5;
}

+ (void)registerDownloadLocation:(id)a3 forURLAsset:(id)a4
{
  uint64_t v5 = [a4 _figAsset];
  MEMORY[0x1F40ED1C8](v5, a3);
}

+ (id)assetDownloadSessionWithAsset:(id)a3 mediaSelections:(id)a4 destinationURL:(id)a5 options:(id)a6
{
  uint64_t v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAsset:a3 mediaSelections:a4 destinationURL:a5 options:a6];
  return v6;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
}

- (void)start
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__34;
  uint64_t v9 = __Block_byref_object_dispose__34;
  uint64_t v10 = 0;
  [(AVAssetDownloadSession *)self willChangeValueForKey:@"status"];
  stateQueue = self->_internal->stateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__AVAssetDownloadSession_start__block_invoke;
  v4[3] = &unk_1E57B2110;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(stateQueue, v4);
  [(AVAssetDownloadSession *)self didChangeValueForKey:@"status"];
  if (v6[5]) {
    -[AVAssetDownloadSession _transitionToTerminalStatus:error:](self, "_transitionToTerminalStatus:error:", 4);
  }
  _Block_object_dispose(&v5, 8);
}

uint64_t __31__AVAssetDownloadSession_start__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _startOnQueue];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)pause
{
  [(AVAssetDownloadSession *)self willChangeValueForKey:@"status"];
  stateQueue = self->_internal->stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__AVAssetDownloadSession_pause__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_sync(stateQueue, block);
  [(AVAssetDownloadSession *)self didChangeValueForKey:@"status"];
}

uint64_t __31__AVAssetDownloadSession_pause__block_invoke(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 32) + 8);
  if (v1[6] == 1)
  {
    uint64_t v2 = result;
    uint64_t v3 = v1[18];
    if (v3)
    {
      uint64_t VTable = CMBaseObjectGetVTable();
      uint64_t v6 = *(void *)(VTable + 16);
      uint64_t result = VTable + 16;
      uint64_t v5 = v6;
      if (v6) {
        uint64_t v7 = v5;
      }
      else {
        uint64_t v7 = 0;
      }
      uint64_t v11 = *(uint64_t (**)(uint64_t))(v7 + 16);
      if (v11) {
        uint64_t result = v11(v3);
      }
    }
    else
    {
      uint64_t result = v1[3];
      if (result)
      {
        uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
        uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v9) {
          uint64_t v10 = v9;
        }
        else {
          uint64_t v10 = 0;
        }
        uint64_t v12 = *(void (**)(uint64_t, void, void))(v10 + 56);
        if (v12) {
          v12(FigBaseObject, *MEMORY[0x1E4F339A0], *MEMORY[0x1E4F1CFC8]);
        }
        uint64_t result = [*(id *)(v2 + 32) cancelAndReleaseProgressTimerOnQueue];
      }
    }
    *(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 48) = 2;
  }
  return result;
}

- (void)stop
{
  [(AVAssetDownloadSession *)self willChangeValueForKey:@"status"];
  stateQueue = self->_internal->stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__AVAssetDownloadSession_stop__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_sync(stateQueue, block);
  [(AVAssetDownloadSession *)self didChangeValueForKey:@"status"];
}

uint64_t __30__AVAssetDownloadSession_stop__block_invoke(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 32) + 8);
  if ((uint64_t)v1[6] <= 2)
  {
    uint64_t v2 = result;
    uint64_t v3 = v1[18];
    if (v3)
    {
      uint64_t VTable = CMBaseObjectGetVTable();
      uint64_t v6 = *(void *)(VTable + 16);
      uint64_t result = VTable + 16;
      uint64_t v5 = v6;
      if (v6) {
        uint64_t v7 = v5;
      }
      else {
        uint64_t v7 = 0;
      }
      uint64_t v11 = *(uint64_t (**)(uint64_t))(v7 + 24);
      if (v11) {
        uint64_t result = v11(v3);
      }
    }
    else
    {
      uint64_t result = v1[3];
      if (result)
      {
        uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
        uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v9) {
          uint64_t v10 = v9;
        }
        else {
          uint64_t v10 = 0;
        }
        uint64_t v12 = *(void (**)(uint64_t, void, void))(v10 + 56);
        if (v12) {
          v12(FigBaseObject, *MEMORY[0x1E4F339A0], *MEMORY[0x1E4F1CFC8]);
        }
        uint64_t result = [*(id *)(v2 + 32) cancelAndReleaseProgressTimerOnQueue];
      }
    }
    *(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 48) = 5;
  }
  return result;
}

- (void)startLoadingMetadata
{
  stateQueue = self->_internal->stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AVAssetDownloadSession_startLoadingMetadata__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

uint64_t __46__AVAssetDownloadSession_startLoadingMetadata__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startLoadingMetadataOnQueue];
}

- (int64_t)status
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateQueue = self->_internal->stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__AVAssetDownloadSession_status__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__AVAssetDownloadSession_status__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 48);
  return result;
}

- (NSError)error
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__34;
  uint64_t v10 = __Block_byref_object_dispose__34;
  uint64_t v11 = 0;
  stateQueue = self->_internal->stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__AVAssetDownloadSession_error__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  int64_t v3 = (NSError *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __31__AVAssetDownloadSession_error__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 64);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSURL)URL
{
  return self->_internal->URL;
}

- (NSURL)destinationURL
{
  return self->_internal->destinationURL;
}

- (int64_t)priority
{
  return self->_internal->priority;
}

- (unint64_t)fileSize
{
  unint64_t valuePtr = 0;
  unint64_t result = (unint64_t)self->_internal->playbackItem;
  if (result)
  {
    CFNumberRef number = 0;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = *(uint64_t (**)(uint64_t, void, void, CFNumberRef *))(v5 + 48);
    if (v6)
    {
      int v7 = v6(FigBaseObject, *MEMORY[0x1E4F339C0], *MEMORY[0x1E4F1CF80], &number);
      CFNumberRef v8 = number;
      if (!v7)
      {
        CFNumberGetValue(number, kCFNumberLongLongType, &valuePtr);
        CFNumberRef v8 = number;
      }
      if (v8) {
        CFRelease(v8);
      }
    }
    return valuePtr;
  }
  return result;
}

- (unint64_t)availableFileSize
{
  unint64_t valuePtr = 0;
  unint64_t result = (unint64_t)self->_internal->playbackItem;
  if (result)
  {
    CFNumberRef number = 0;
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = *(uint64_t (**)(uint64_t, void, void, CFNumberRef *))(v5 + 48);
    if (v6)
    {
      int v7 = v6(FigBaseObject, *MEMORY[0x1E4F33900], *MEMORY[0x1E4F1CF80], &number);
      CFNumberRef v8 = number;
      if (!v7)
      {
        CFNumberGetValue(number, kCFNumberLongLongType, &valuePtr);
        CFNumberRef v8 = number;
      }
      if (v8) {
        CFRelease(v8);
      }
    }
    return valuePtr;
  }
  return result;
}

- (unint64_t)countOfBytesReceived
{
  unint64_t valuePtr = 0;
  if (self->_internal->assetDownloader)
  {
    CFNumberRef number = 0;
    uint64_t CMBaseObject = FigAssetDownloaderGetCMBaseObject();
    uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v3) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t v6 = *(uint64_t (**)(uint64_t, void, void, CFNumberRef *))(v4 + 48);
    if (v6)
    {
      int v7 = v6(CMBaseObject, *MEMORY[0x1E4F31D00], *MEMORY[0x1E4F1CF80], &number);
      CFNumberRef v8 = number;
      if (!v7)
      {
        CFNumberGetValue(number, kCFNumberLongLongType, &valuePtr);
        CFNumberRef v8 = number;
      }
      if (v8) {
        CFRelease(v8);
      }
    }
    return valuePtr;
  }
  else
  {
    return [(AVAssetDownloadSession *)self availableFileSize];
  }
}

- (unint64_t)downloadToken
{
  internal = self->_internal;
  unint64_t result = internal->downloadToken;
  if (!result)
  {
    unint64_t result = (unint64_t)internal->figAsset;
    if (result)
    {
      CFNumberRef number = 0;
      uint64_t CMBaseObject = FigAssetGetCMBaseObject();
      uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v6) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      CFNumberRef v8 = *(uint64_t (**)(uint64_t, void, void, CFNumberRef *))(v7 + 48);
      if (v8)
      {
        int v9 = v8(CMBaseObject, *MEMORY[0x1E4F32220], *MEMORY[0x1E4F1CF80], &number);
        CFNumberRef v10 = number;
        if (v9) {
          BOOL v11 = 1;
        }
        else {
          BOOL v11 = number == 0;
        }
        if (!v11)
        {
          CFNumberGetValue(number, kCFNumberLongLongType, &self->_internal->downloadToken);
          CFNumberRef v10 = number;
        }
        if (v10) {
          CFRelease(v10);
        }
      }
      return self->_internal->downloadToken;
    }
  }
  return result;
}

- (NSArray)loadedTimeRanges
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (AVMediaSelection)resolvedMediaSelection
{
  return 0;
}

- (void)_sendDownloadSuccessToDelegate
{
  delegateStorage = self->_internal->delegateStorage;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __96__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendDownloadSuccessToDelegate__block_invoke;
  v3[3] = &unk_1E57B4B88;
  v3[4] = self;
  [(AVWeakReferencingDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v3];
}

uint64_t __96__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendDownloadSuccessToDelegate__block_invoke(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    unint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v4 = *(void *)(v3 + 32);
      return [a2 assetDownloadSessionDidFinishDownload:v4];
    }
  }
  return result;
}

- (void)_sendDownloadFailureToDelegateWithError:(id)a3
{
  delegateStorage = self->_internal->delegateStorage;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __106__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendDownloadFailureToDelegateWithError___block_invoke;
  v4[3] = &unk_1E57B6D30;
  v4[4] = self;
  v4[5] = a3;
  [(AVWeakReferencingDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v4];
}

uint64_t __106__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendDownloadFailureToDelegateWithError___block_invoke(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    unint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v4 = *(void *)(v3 + 32);
      uint64_t v5 = *(void *)(v3 + 40);
      return [a2 assetDownloadSession:v4 didFailWithError:v5];
    }
  }
  return result;
}

- (void)_sendLoadedTimeRangesChangedToDelegateWithNewlyLoadedTimeRange:(id)a3 currentLoadedTimeRanges:(id)a4 timeRangeExpectedToLoad:(id)a5 selectedMediaArray:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  memset(&v29, 0, sizeof(v29));
  memset(&v28, 0, sizeof(v28));
  CFNumberRef v10 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (a3) {
    CMTimeRangeMakeFromDictionary(&v29, (CFDictionaryRef)a3);
  }
  if (a4)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v11 = [a4 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(a4);
          }
          CFDictionaryRef v15 = *(const __CFDictionary **)(*((void *)&v24 + 1) + 8 * v14);
          memset(&v23, 0, sizeof(v23));
          CMTimeRangeMakeFromDictionary(&v23, v15);
          CMTimeRange v22 = v23;
          objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCMTimeRange:", &v22));
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [a4 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v12);
    }
  }
  if (a5) {
    CMTimeRangeMakeFromDictionary(&v28, (CFDictionaryRef)a5);
  }
  id v16 = [[AVMediaSelection alloc] _initWithAsset:self->_internal->asset selectedMediaArray:a6];
  delegateStorage = self->_internal->delegateStorage;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  CMTimeRange v20 = v29;
  CMTimeRange v21 = v28;
  v19[2] = __196__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendLoadedTimeRangesChangedToDelegateWithNewlyLoadedTimeRange_currentLoadedTimeRanges_timeRangeExpectedToLoad_selectedMediaArray___block_invoke;
  v19[3] = &unk_1E57B6D58;
  v19[4] = self;
  v19[5] = v10;
  v19[6] = v16;
  [(AVWeakReferencingDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v19];
}

uint64_t __196__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendLoadedTimeRangesChangedToDelegateWithNewlyLoadedTimeRange_currentLoadedTimeRanges_timeRangeExpectedToLoad_selectedMediaArray___block_invoke(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    unint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v4 = *(void *)(v3 + 32);
      uint64_t v5 = *(void *)(v3 + 40);
      uint64_t v6 = *(void *)(v3 + 48);
      long long v7 = *(_OWORD *)(v3 + 72);
      v10[0] = *(_OWORD *)(v3 + 56);
      v10[1] = v7;
      v10[2] = *(_OWORD *)(v3 + 88);
      long long v8 = *(_OWORD *)(v3 + 120);
      v9[0] = *(_OWORD *)(v3 + 104);
      v9[1] = v8;
      v9[2] = *(_OWORD *)(v3 + 136);
      return [a2 assetDownloadSession:v4 didLoadTimeRange:v10 totalTimeRangesLoaded:v5 timeRangeExpectedToLoad:v9 forMediaSelection:v6];
    }
  }
  return result;
}

- (void)_sendDidResolveMediaSelectionWithMediaSelection:(id)a3
{
  id v4 = [[AVMediaSelection alloc] _initWithAsset:self->_internal->asset selectedMediaArray:a3];
  delegateStorage = self->_internal->delegateStorage;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __114__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendDidResolveMediaSelectionWithMediaSelection___block_invoke;
  v6[3] = &unk_1E57B6D30;
  v6[4] = self;
  v6[5] = v4;
  [(AVWeakReferencingDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v6];
}

uint64_t __114__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendDidResolveMediaSelectionWithMediaSelection___block_invoke(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    unint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v4 = *(void *)(v3 + 32);
      uint64_t v5 = *(void *)(v3 + 40);
      return [a2 assetDownloadSession:v4 didResolveMediaSelection:v5];
    }
  }
  return result;
}

- (void)_sendDidFinishDownloadForMediaSelectionWithMediaSelection:(id)a3
{
  id v4 = [[AVMediaSelection alloc] _initWithAsset:self->_internal->asset selectedMediaArray:a3];
  delegateStorage = self->_internal->delegateStorage;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __124__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendDidFinishDownloadForMediaSelectionWithMediaSelection___block_invoke;
  v6[3] = &unk_1E57B6D30;
  v6[4] = self;
  v6[5] = v4;
  [(AVWeakReferencingDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v6];
}

uint64_t __124__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendDidFinishDownloadForMediaSelectionWithMediaSelection___block_invoke(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    unint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v4 = *(void *)(v3 + 32);
      uint64_t v5 = *(void *)(v3 + 40);
      return [a2 assetDownloadSession:v4 didFinishDownloadForMediaSelection:v5];
    }
  }
  return result;
}

- (void)_sendProgessUpdateWithExpectedBytesToDownload:(unint64_t)a3 bytesDownloaded:(unint64_t)a4
{
  delegateStorage = self->_internal->delegateStorage;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __128__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendProgessUpdateWithExpectedBytesToDownload_bytesDownloaded___block_invoke;
  v5[3] = &unk_1E57B6D80;
  v5[4] = self;
  v5[5] = a3;
  void v5[6] = a4;
  [(AVWeakReferencingDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v5];
}

uint64_t __128__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendProgessUpdateWithExpectedBytesToDownload_bytesDownloaded___block_invoke(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)result;
    unint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v4 = v3[4];
      uint64_t v5 = v3[5];
      uint64_t v6 = v3[6];
      return [a2 assetDownloadSession:v4 didUpdateProgressWithExpectedBytes:v5 bytesDownloaded:v6];
    }
  }
  return result;
}

- (void)_sendWillDownloadVariants:(id)a3
{
  delegateStorage = self->_internal->delegateStorage;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __92__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendWillDownloadVariants___block_invoke;
  v4[3] = &unk_1E57B6D30;
  v4[4] = self;
  v4[5] = a3;
  [(AVWeakReferencingDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:v4];
}

uint64_t __92__AVAssetDownloadSession_AVAssetDownloadSession_DelegateSupport___sendWillDownloadVariants___block_invoke(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    unint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v4 = *(void *)(v3 + 32);
      uint64_t v5 = *(void *)(v3 + 40);
      return [a2 assetDownloadSession:v4 willDownloadVariants:v5];
    }
  }
  return result;
}

- (void)_downloadSuccessCallback
{
}

- (void)_downloadFailureCallbackWithError:(id)a3
{
}

- (BOOL)ensureProgressTimerIsRunningOnQueueWithError:(id *)a3
{
  internal = self->_internal;
  if (!internal->fileDownloadProgressTimer)
  {
    self->_internal->fileDownloadProgressTimer = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)internal->stateQueue);
    if (!self->_internal->fileDownloadProgressTimer) {
      return AVLocalizedError(@"AVFoundationErrorDomain", -11801, 0) == 0;
    }
    objc_initWeak(&location, self);
    fileDownloadProgressTimer = self->_internal->fileDownloadProgressTimer;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __101__AVAssetDownloadSession_AVAssetDownloadSession_Local__ensureProgressTimerIsRunningOnQueueWithError___block_invoke;
    v7[3] = &unk_1E57B6DA8;
    objc_copyWeak(&v8, &location);
    dispatch_source_set_event_handler(fileDownloadProgressTimer, v7);
    dispatch_source_set_timer((dispatch_source_t)self->_internal->fileDownloadProgressTimer, 0, 0x1DCD6500uLL, 0x5F5E100uLL);
    dispatch_resume((dispatch_object_t)self->_internal->fileDownloadProgressTimer);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return 1;
}

uint64_t __101__AVAssetDownloadSession_AVAssetDownloadSession_Local__ensureProgressTimerIsRunningOnQueueWithError___block_invoke(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  uint64_t v2 = [Weak fileSize];
  uint64_t v3 = [Weak countOfBytesReceived];
  return [Weak _sendProgessUpdateWithExpectedBytesToDownload:v2 bytesDownloaded:v3];
}

- (void)cancelAndReleaseProgressTimerOnQueue
{
  fileDownloadProgressTimer = self->_internal->fileDownloadProgressTimer;
  if (fileDownloadProgressTimer)
  {
    dispatch_source_cancel(fileDownloadProgressTimer);
    uint64_t v4 = self->_internal->fileDownloadProgressTimer;
    if (v4)
    {
      dispatch_release(v4);
      self->_internal->fileDownloadProgressTimer = 0;
    }
  }
}

- (id)_setupFigClientObjectForFileDownload:(id)a3
{
  uint64_t v5 = [(AVAssetDownloadSession *)self _createDuplicateFigAssetFromAVAsset:self->_internal->asset options:a3];
  self->_internal->cachePrimingDownloadTokenNum = (NSNumber *)(id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[AVURLAsset downloadToken](self->_internal->asset, "downloadToken"));
  int v6 = [(AVAssetDownloadSession *)self _setFileFigAsset:v5 options:a3];
  if (!v6)
  {
    CFNumberRef v10 = 0;
    if (!v5) {
      return v10;
    }
    goto LABEL_8;
  }
  signed int v7 = v6;
  URL = self->_internal->URL;
  if (URL) {
    int v9 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:URL forKey:*MEMORY[0x1E4F289D0]];
  }
  else {
    int v9 = 0;
  }
  CFNumberRef v10 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(v7, v9);
  if (v5) {
LABEL_8:
  }
    CFRelease(v5);
  return v10;
}

- (id)_setupFigClientObjectForStreaming:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v63[0] = 2;
  v63[1] = avad_downloadSuccessCallback;
  v63[2] = avad_downloadFailureCallback;
  v63[3] = avad_loadedTimeRangeChangedCallback;
  v63[4] = avad_didResolveMediaSelection;
  v63[5] = avad_didFinishDownloadForMediaSelection;
  v63[6] = 0;
  v63[7] = avad_progressUpdate;
  v63[8] = avad_willDownloadAlternates;
  v63[9] = 0;
  signed int v7 = [(AVAsset *)self->_internal->asset _figAsset];
  if (v7) {
    signed int v7 = (OpaqueFigAsset *)CFRetain(v7);
  }
  self->_internal->figAsset = v7;
  id v8 = (void *)[a3 objectForKey:@"AVMediaCharacteristicAudible"];
  if (v8) {
    [v5 setObject:objc_msgSend(v8, "figDictionary"), AVTranslateAVMediaCharacteristicToFigMediaCharacteristic(@"AVMediaCharacteristicAudible") forKey];
  }
  int v9 = (void *)[a3 objectForKey:@"AVMediaCharacteristicLegible"];
  if (v9) {
    [v5 setObject:objc_msgSend(v9, "figDictionary"), AVTranslateAVMediaCharacteristicToFigMediaCharacteristic(@"AVMediaCharacteristicLegible") forKey];
  }
  CFNumberRef v10 = (void *)[a3 objectForKey:@"AVMediaCharacteristicVisual"];
  if (v10) {
    [v5 setObject:objc_msgSend(v10, "figDictionary"), AVTranslateAVMediaCharacteristicToFigMediaCharacteristic(@"AVMediaCharacteristicVisual") forKey];
  }
  if (v5) {
    [v6 setObject:v5 forKey:*MEMORY[0x1E4F31CB0]];
  }

  int v11 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"AVAssetDownloadSessionDeleteDownloadWhenAssetFinalizesKey"), "BOOLValue");
  uint64_t v12 = (void *)MEMORY[0x1E4F1CFD0];
  if (v11) {
    [v6 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F31C80]];
  }
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"AVAssetDownloadSessionLinkAssetURLToDestinationURLKey"), "BOOLValue"))objc_msgSend(v6, "setObject:forKey:", *v12, *MEMORY[0x1E4F31CA0]); {
  uint64_t v13 = [a3 objectForKey:@"AVAssetDownloadSessionMinimumRequiredMediaBitrateKey"];
  }
  if (v13 || (uint64_t v13 = [a3 objectForKey:@"AVAssetDownloadTaskMinimumRequiredMediaBitrateKey"]) != 0) {
    [v6 setObject:v13 forKey:*MEMORY[0x1E4F31CB8]];
  }
  uint64_t v14 = (void *)[a3 objectForKey:@"AVAssetDownloadTaskMinimumRequiredPresentationSizeKey"];
  if (v14)
  {
    CGSize v62 = (CGSize)*MEMORY[0x1E4F1DB30];
    if (AVCGSizeFromNSValue(v14, &v62))
    {
      CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v62);
      [v6 setObject:DictionaryRepresentation forKey:*MEMORY[0x1E4F31CC8]];
    }
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"AVAssetDownloadSessionShouldStoreEligibleContentKeysKey"), "BOOLValue") & 1) != 0|| objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"AVAssetDownloadTaskShouldStoreEligibleContentKeysKey"), "BOOLValue"))
  {
    [v6 setObject:*v12 forKey:*MEMORY[0x1E4F31CF8]];
  }
  uint64_t v16 = [a3 objectForKey:@"AVAssetDownloadSessionClientBundleIdentifierKey"];
  if (v16) {
    [v6 setObject:v16 forKey:*MEMORY[0x1E4F31C68]];
  }
  uint64_t v17 = [a3 objectForKey:@"AVAssetDownloadSessionAssetNameKey"];
  if (v17) {
    [v6 setObject:v17 forKey:*MEMORY[0x1E4F31C60]];
  }
  uint64_t v18 = [a3 objectForKey:@"AVAssetDownloadSessionAssetImageDataKey"];
  if (v18) {
    [v6 setObject:v18 forKey:*MEMORY[0x1E4F31C58]];
  }
  uint64_t v19 = [a3 objectForKey:@"AVAssetDownloadTaskClientIsCatalyst"];
  if (v19) {
    [v6 setObject:v19 forKey:*MEMORY[0x1E4F31C70]];
  }
  uint64_t v20 = [a3 objectForKey:@"AVAssetDownloadTaskPrefersHDRKey"];
  if (v20 || (uint64_t v20 = [a3 objectForKey:@"AVAssetDownloadTaskAllowHighDynamicRangeKey"]) != 0) {
    [v6 setObject:v20 forKey:*MEMORY[0x1E4F31C50]];
  }
  uint64_t v21 = [a3 objectForKey:@"AVAssetDownloadTaskMediaSelectionPrefersMultichannelOnlyKey"];
  if (v21)
  {
    uint64_t v22 = v21;
    CMTimeRange v23 = (void *)MEMORY[0x1E4F31CE8];
LABEL_40:
    [v6 setObject:v22 forKey:*v23];
    goto LABEL_41;
  }
  uint64_t v24 = [a3 objectForKey:@"AVAssetDownloadSessionMediaSelectionPrefersMultichannelKey"];
  if (v24
    || (uint64_t v24 = [a3 objectForKey:@"AVAssetDownloadTaskMediaSelectionPrefersMultichannelKey"]) != 0)
  {
    uint64_t v22 = v24;
    CMTimeRange v23 = (void *)MEMORY[0x1E4F31CE0];
    goto LABEL_40;
  }
LABEL_41:
  uint64_t v25 = [a3 objectForKey:@"AVAssetDownloadTaskPrefersLosslessAudioKey"];
  if (v25) {
    [v6 setObject:v25 forKey:*MEMORY[0x1E4F31CD0]];
  }
  uint64_t v26 = [a3 objectForKey:@"AVAssetDownloadTaskMaximumAudioSampleRateKey"];
  if (v26) {
    [v6 setObject:v26 forKey:*MEMORY[0x1E4F31CA8]];
  }
  long long v27 = (void *)[a3 objectForKey:@"AVAssetDownloadSessionAllowsExpensiveNetworkAccessKey"];
  if (v27 && ([v27 BOOLValue] & 1) == 0) {
    [v6 setObject:*v12 forKey:*MEMORY[0x1E4F31C90]];
  }
  CMTimeRange v28 = (void *)[a3 objectForKey:@"AVAssetDownloadSessionAllowsConstrainedNetworkAccessKey"];
  if (v28 && ([v28 BOOLValue] & 1) == 0) {
    [v6 setObject:*v12 forKey:*MEMORY[0x1E4F31C88]];
  }
  uint64_t v29 = [a3 objectForKey:@"AVAssetDownloadSessionDebugIdentifierKey"];
  if (v29) {
    [v6 setObject:v29 forKey:*MEMORY[0x1E4F31C78]];
  }
  if ([a3 objectForKey:@"AVAssetDownloadSessionDownloadInterstitials"]) {
    [v6 setObject:*v12 forKey:*MEMORY[0x1E4F31C98]];
  }
  uint64_t v30 = [a3 objectForKey:@"AVAssetDownloadSessionRetryErrorKey"];
  if (v30) {
    [v6 setObject:v30 forKey:*MEMORY[0x1E4F31CF0]];
  }
  uint64_t v31 = [a3 objectForKey:@"AVAssetDownloadTaskMinimumRequiredMediaBitrateForHEVCKey"];
  if (v31) {
    [v6 setObject:v31 forKey:*MEMORY[0x1E4F31CC0]];
  }
  uint64_t v32 = [a3 objectForKey:@"AVAssetDownloadTaskPrefersMostCompatibleRenditionKey"];
  if (v32) {
    [v6 setObject:v32 forKey:*MEMORY[0x1E4F31CD8]];
  }
  if (![v6 count])
  {

    id v6 = 0;
  }
  v33 = (void *)[MEMORY[0x1E4F1CA48] array];
  v34 = (void *)[a3 objectForKey:@"AVAssetDownloadSessionMediaSelectionKey"];
  if (v34) {
    objc_msgSend(v33, "addObject:", objc_msgSend(v34, "_selectedMediaArray"));
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  mediaSelections = self->_internal->mediaSelections;
  uint64_t v36 = [(NSArray *)mediaSelections countByEnumeratingWithState:&v58 objects:v65 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v59 != v38) {
          objc_enumerationMutation(mediaSelections);
        }
        objc_msgSend(v33, "addObject:", objc_msgSend(*(id *)(*((void *)&v58 + 1) + 8 * i), "_selectedMediaArray"));
      }
      uint64_t v37 = [(NSArray *)mediaSelections countByEnumeratingWithState:&v58 objects:v65 count:16];
    }
    while (v37);
  }
  uint64_t v40 = [a3 objectForKey:@"AVAssetDownloadTaskMediaSelectionsForMultichannelKey"];
  if (v40)
  {
    v41 = (void *)v40;
    v42 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v43 = [v41 countByEnumeratingWithState:&v54 objects:v64 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v55 != v45) {
            objc_enumerationMutation(v41);
          }
          objc_msgSend(v42, "addObject:", objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * j), "_selectedMediaArray"));
        }
        uint64_t v44 = [v41 countByEnumeratingWithState:&v54 objects:v64 count:16];
      }
      while (v44);
    }
  }
  v47 = (const void *)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AVAssetDownloadTaskDownloadConfigurationKey"), "_copyFigDownloadConfig");
  internal = self->_internal;
  p_assetDownloader = &internal->assetDownloader;
  stateQueue = internal->stateQueue;
  signed int v49 = FigRemoteStreamingAssetDownloadOrchestratorCreate();
  if (v49) {
    uint64_t v50 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(v49, 0);
  }
  else {
    uint64_t v50 = 0;
  }
  [(AVAssetDownloadSession *)self _addFigAssetListeners];

  if (v47) {
    CFRelease(v47);
  }
  return v50;
}

- (void)_setupFigClientObjectAsync:(id)a3
{
  asset = self->_internal->asset;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__AVAssetDownloadSession_AVAssetDownloadSession_Local___setupFigClientObjectAsync___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  v4[5] = a3;
  [(AVAsset *)asset loadValuesAsynchronouslyForKeys:&unk_1EE5E1B48 completionHandler:v4];
}

void __83__AVAssetDownloadSession_AVAssetDownloadSession_Local___setupFigClientObjectAsync___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  long long v1 = *(_OWORD *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 80);
  v3[1] = 3221225472;
  v3[2] = __83__AVAssetDownloadSession_AVAssetDownloadSession_Local___setupFigClientObjectAsync___block_invoke_2;
  v3[3] = &unk_1E57B2098;
  long long v4 = v1;
  dispatch_async(v2, v3);
}

void *__83__AVAssetDownloadSession_AVAssetDownloadSession_Local___setupFigClientObjectAsync___block_invoke_2(uint64_t a1)
{
  signed int v7 = 0;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 136) statusOfValueForKey:@"streaming" error:&v7];
  int v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 136) _isStreaming];
  unint64_t result = *(void **)(a1 + 32);
  if (*(void *)(result[1] + 40) != 2) {
    goto LABEL_10;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = v2
     ? [result _setupFigClientObjectForStreaming:v4]
     : [result _setupFigClientObjectForFileDownload:v4];
  signed int v7 = (void *)v5;
  unint64_t result = *(void **)(a1 + 32);
  uint64_t v6 = result[1];
  if (*(unsigned char *)(v6 + 56))
  {
    [result _startLoadingMetadataOnQueue];
    unint64_t result = *(void **)(a1 + 32);
    uint64_t v6 = result[1];
  }
  if (*(void *)(v6 + 48) != 1)
  {
LABEL_10:
    if (!v7) {
      return result;
    }
    return objc_msgSend(*(id *)(a1 + 32), "_transitionToTerminalStatus:error:", 4);
  }
  unint64_t result = (void *)[result _startOnQueueFirstTime];
  signed int v7 = result;
  if (result) {
    return objc_msgSend(*(id *)(a1 + 32), "_transitionToTerminalStatus:error:", 4);
  }
  return result;
}

- (id)_weakReference
{
  return self->_internal->weakReference;
}

- (OpaqueFigAsset)_figAsset
{
  return self->_internal->figAsset;
}

- (int)_setFileFigAsset:(OpaqueFigAsset *)a3 options:(id)a4
{
  if (!a3 || self->_internal->figAsset)
  {
    return FigSignalErrorAt();
  }
  else
  {
    self->_internal->figAsset = (OpaqueFigAsset *)CFRetain(a3);
    [(AVAssetDownloadSession *)self _addFigAssetListeners];
    uint64_t CMBaseObject = FigAssetGetCMBaseObject();
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    int v9 = *(void (**)(uint64_t, void, void))(v8 + 56);
    if (v9) {
      v9(CMBaseObject, *MEMORY[0x1E4F32288], *MEMORY[0x1E4F1CFD0]);
    }
    *(_DWORD *)&v28[8] = 0;
    FigSharedPlayerGetDefaultEngineTopology();
    *(void *)CMTimeRange v28 = 320;
    int result = FigSharedPlayerCreate();
    if (!result)
    {
      self->_internal->player = *(OpaqueFigPlayer **)&v28[4];
      long long v27 = 0;
      internal = self->_internal;
      player = internal->player;
      figAsset = internal->figAsset;
      uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v14) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = 0;
      }
      uint64_t v16 = *(uint64_t (**)(OpaqueFigPlayer *, OpaqueFigAsset *, uint64_t, void, OpaqueFigPlaybackItem **))(v15 + 96);
      if (v16)
      {
        int result = v16(player, figAsset, 64, 0, &v27);
        if (!result)
        {
          self->_internal->playbackItem = v27;
          uint64_t v17 = [a4 objectForKey:@"AVAssetDownloadSessionAssetNameKey"];
          uint64_t v18 = [a4 objectForKey:@"AVAssetDownloadSessionAssetImageDataKey"];
          uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
          uint64_t v20 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v20) {
            uint64_t v21 = v20;
          }
          else {
            uint64_t v21 = 0;
          }
          uint64_t v22 = *(void (**)(uint64_t, void, uint64_t))(v21 + 56);
          if (v22) {
            v22(FigBaseObject, *MEMORY[0x1E4F338B8], v17);
          }
          uint64_t v23 = FigPlaybackItemGetFigBaseObject();
          uint64_t v24 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v24) {
            uint64_t v25 = v24;
          }
          else {
            uint64_t v25 = 0;
          }
          uint64_t v26 = *(void (**)(uint64_t, void, uint64_t))(v25 + 56);
          if (v26) {
            v26(v23, *MEMORY[0x1E4F338B0], v18);
          }
          [(AVAssetDownloadSession *)self _addFigPlaybackItemListeners];
          return 0;
        }
      }
      else
      {
        return -12782;
      }
    }
  }
  return result;
}

- (OpaqueFigPlaybackItem)_playbackItem
{
  return self->_internal->playbackItem;
}

- (void)_startLoadingMetadataOnQueue
{
  assetDownloader = self->_internal->assetDownloader;
  if (assetDownloader)
  {
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = *(void (**)(CMBaseObject *))(v5 + 48);
    if (v6) {
      v6(assetDownloader);
    }
  }
  self->_internal->didStartLoadingMetadata = 1;
}

- (id)_startOnQueueFirstTime
{
  id v38 = 0;
  int valuePtr = 0;
  CFTypeRef cf = 0;
  internal = self->_internal;
  assetDownloader = internal->assetDownloader;
  if (assetDownloader)
  {
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    CFNumberRef v10 = *(uint64_t (**)(CMBaseObject *))(v6 + 8);
    if (v10) {
      signed int v11 = v10(assetDownloader);
    }
    else {
      signed int v11 = -12782;
    }
    id result = 0;
    goto LABEL_13;
  }
  if (!internal->playbackItem || (figAsset = internal->figAsset) == 0)
  {
    id result = 0;
    goto LABEL_21;
  }
  char v35 = 0;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v15 = *(uint64_t (**)(OpaqueFigAsset *, void, char *))(v9 + 24);
  if (v15)
  {
    int v16 = v15(figAsset, *MEMORY[0x1E4F32188], &v35);
    int valuePtr = v16;
    if (v16) {
      goto LABEL_62;
    }
    if (v35)
    {
      id result = [(AVAssetDownloadSession *)self _verifyDownloadConfigurationForAssetType];
      id v38 = result;
      if (result)
      {
        signed int v11 = 0;
        goto LABEL_14;
      }
    }
    uint64_t v17 = self->_internal;
    if (!v17->cachePrimingDownloadTokenNum)
    {
      char v34 = 0;
      uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
      uint64_t v22 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v22) {
        uint64_t v23 = v22;
      }
      else {
        uint64_t v23 = 0;
      }
      uint64_t v25 = *(void (**)(uint64_t, void, void))(v23 + 56);
      if (v25) {
        v25(FigBaseObject, *MEMORY[0x1E4F339A0], *MEMORY[0x1E4F1CFD0]);
      }
      playbackItem = self->_internal->playbackItem;
      uint64_t v27 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v27) {
        uint64_t v28 = v27;
      }
      else {
        uint64_t v28 = 0;
      }
      uint64_t v29 = *(uint64_t (**)(OpaqueFigPlaybackItem *, void, char *))(v28 + 48);
      if (!v29)
      {
        signed int v11 = -12782;
        int valuePtr = -12782;
LABEL_54:
        id result = 0;
        goto LABEL_14;
      }
      int v16 = v29(playbackItem, 0, &v34);
      int valuePtr = v16;
      if (!v16)
      {
        if (v34)
        {
          int v16 = [(AVAssetDownloadSession *)self _readyForInspection];
LABEL_50:
          int valuePtr = v16;
          if (!v16) {
            goto LABEL_51;
          }
          goto LABEL_62;
        }
LABEL_51:
        uint64_t CMBaseObject = FigAssetGetCMBaseObject();
        uint64_t v31 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v31) {
          uint64_t v32 = v31;
        }
        else {
          uint64_t v32 = 0;
        }
        v33 = *(void (**)(uint64_t, void, void, CFTypeRef *))(v32 + 48);
        if (v33)
        {
          v33(CMBaseObject, *MEMORY[0x1E4F32218], *MEMORY[0x1E4F1CF80], &cf);
          if (cf)
          {
            CFNumberGetValue((CFNumberRef)cf, kCFNumberIntType, &valuePtr);
            if (!valuePtr) {
              [(AVAssetDownloadSession *)self _transitionToTerminalStatus:3 error:0];
            }
          }
        }
        [(AVAssetDownloadSession *)self ensureProgressTimerIsRunningOnQueueWithError:&v38];
        signed int v11 = valuePtr;
        id result = v38;
        goto LABEL_14;
      }
LABEL_62:
      signed int v11 = v16;
      goto LABEL_54;
    }
    uint64_t v18 = v17->figAsset;
    uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v19) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = 0;
    }
    uint64_t v24 = *(uint64_t (**)(OpaqueFigAsset *, void, char *))(v20 + 24);
    if (v24)
    {
      int v16 = v24(v18, *MEMORY[0x1E4F321D8], &v35);
      int valuePtr = v16;
      if (!v16)
      {
        if (v35)
        {
          int v16 = [(AVAssetDownloadSession *)self _primeCache];
          goto LABEL_50;
        }
        goto LABEL_51;
      }
      goto LABEL_62;
    }
  }
  id result = 0;
  signed int v11 = -12782;
LABEL_13:
  int valuePtr = v11;
LABEL_14:
  if (v11 && !result)
  {
    URL = self->_internal->URL;
    if (URL) {
      uint64_t v14 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:URL forKey:*MEMORY[0x1E4F289D0]];
    }
    else {
      uint64_t v14 = 0;
    }
    id result = (id)AVLocalizedErrorWithUnderlyingOSStatus(v11, v14);
    id v38 = result;
  }
LABEL_21:
  if (cf)
  {
    CFRelease(cf);
    return v38;
  }
  return result;
}

- (id)_startOnQueue
{
  id v18 = 0;
  internal = self->_internal;
  int64_t status = internal->status;
  if (status != 2)
  {
    id result = 0;
    if (status) {
      goto LABEL_26;
    }
    id result = [(AVAssetDownloadSession *)self _startOnQueueFirstTime];
    id v18 = result;
LABEL_25:
    self->_internal->int64_t status = 1;
LABEL_26:
    if (self->_internal->playbackItem)
    {
      [(AVAssetDownloadSession *)self ensureProgressTimerIsRunningOnQueueWithError:&v18];
      return v18;
    }
    return result;
  }
  assetDownloader = internal->assetDownloader;
  if (!assetDownloader)
  {
    id result = internal->playbackItem;
    if (!result) {
      goto LABEL_25;
    }
    uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v17 = *(void (**)(uint64_t, void, void))(v11 + 56);
    if (v17) {
      v17(FigBaseObject, *MEMORY[0x1E4F339A0], *MEMORY[0x1E4F1CFD0]);
    }
    goto LABEL_24;
  }
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v12 = *(uint64_t (**)(CMBaseObject *))(v8 + 8);
  if (!v12)
  {
    signed int v14 = -12782;
    goto LABEL_15;
  }
  signed int v13 = v12(assetDownloader);
  if (!v13)
  {
LABEL_24:
    id result = 0;
    goto LABEL_25;
  }
  signed int v14 = v13;
LABEL_15:
  URL = self->_internal->URL;
  if (URL) {
    int v16 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:URL forKey:*MEMORY[0x1E4F289D0]];
  }
  else {
    int v16 = 0;
  }
  return (id)AVLocalizedErrorWithUnderlyingOSStatus(v14, v16);
}

- (void)_transitionToTerminalStatus:(int64_t)a3 error:(id)a4
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  char v7 = 0;
  stateQueue = self->_internal->stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __90__AVAssetDownloadSession_AVAssetDownloadSession_Local___transitionToTerminalStatus_error___block_invoke;
  v5[3] = &unk_1E57B6DD0;
  v5[4] = self;
  v5[5] = a4;
  void v5[6] = v6;
  void v5[7] = a3;
  dispatch_async(stateQueue, v5);
  _Block_object_dispose(v6, 8);
}

uint64_t __90__AVAssetDownloadSession_AVAssetDownloadSession_Local___transitionToTerminalStatus_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"status"];
  uint64_t result = [*(id *)(a1 + 32) willChangeValueForKey:@"error"];
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3 >= 3)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v5 = *(void *)(v4 + 48);
    if (v5 != v3 && v5 <= 2)
    {
      char v7 = *(void **)(v4 + 64);
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 64) = *(id *)(a1 + 40);

      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = *(void *)(a1 + 56);
      if ((unint64_t)(*(void *)(a1 + 56) - 3) <= 1) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
    }
    [*(id *)(a1 + 32) cancelAndReleaseProgressTimerOnQueue];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 72) delegate])
      {
        uint64_t v8 = *(void **)(a1 + 32);
        if (*(void *)(a1 + 40)) {
          objc_msgSend(v8, "_sendDownloadFailureToDelegateWithError:");
        }
        else {
          [v8 _sendDownloadSuccessToDelegate];
        }
      }
      else
      {
        if (*(void *)(a1 + 56) == 3) {
          uint64_t v9 = @"AVAssetDownloadSessionDownloadSucceededNotification";
        }
        else {
          uint64_t v9 = @"AVAssetDownloadSessionDownloadFailedNotification";
        }
        uint64_t v10 = [MEMORY[0x1E4F28EA0] notificationWithName:v9 object:*(void *)(a1 + 32) userInfo:0];
        global_queue = dispatch_get_global_queue(21, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __90__AVAssetDownloadSession_AVAssetDownloadSession_Local___transitionToTerminalStatus_error___block_invoke_2;
        block[3] = &unk_1E57B1E80;
        block[4] = v10;
        dispatch_async(global_queue, block);
      }
    }
    [*(id *)(a1 + 32) didChangeValueForKey:@"error"];
    return [*(id *)(a1 + 32) didChangeValueForKey:@"status"];
  }
  return result;
}

uint64_t __90__AVAssetDownloadSession_AVAssetDownloadSession_Local___transitionToTerminalStatus_error___block_invoke_2(uint64_t a1)
{
  int v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotification:v3];
}

- (id)_errorForFigNotificationPayload:(__CFDictionary *)a3 key:(__CFString *)a4
{
  if (!a3) {
    return 0;
  }
  CFTypeID v6 = CFGetTypeID(a3);
  if (v6 != CFDictionaryGetTypeID()) {
    return 0;
  }
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a3, a4);
  signed int valuePtr = 0;
  if (!Value) {
    return 0;
  }
  CFNumberRef v8 = Value;
  CFTypeID v9 = CFGetTypeID(Value);
  if (v9 != CFNumberGetTypeID()) {
    return 0;
  }
  CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
  return (id)AVLocalizedErrorWithUnderlyingOSStatus(valuePtr, 0);
}

- (void)_primeCacheOnDispatchQueue
{
  uint64_t v8 = 0;
  CFTypeID v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  stateQueue = self->_internal->stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__AVAssetDownloadSession_AVAssetDownloadSession_Local___primeCacheOnDispatchQueue__block_invoke;
  v7[3] = &unk_1E57B2160;
  void v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(stateQueue, v7);
  signed int v4 = *((_DWORD *)v9 + 6);
  if (v4)
  {
    URL = self->_internal->URL;
    if (URL) {
      CFTypeID v6 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:URL forKey:*MEMORY[0x1E4F289D0]];
    }
    else {
      CFTypeID v6 = 0;
    }
    [(AVAssetDownloadSession *)self _transitionToTerminalStatus:4 error:AVLocalizedErrorWithUnderlyingOSStatus(v4, v6)];
  }
  _Block_object_dispose(&v8, 8);
}

void *__82__AVAssetDownloadSession_AVAssetDownloadSession_Local___primeCacheOnDispatchQueue__block_invoke(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (*(void *)(result[1] + 48) == 1)
  {
    uint64_t result = (void *)[result _primeCache];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (int)_primeCache
{
  internal = self->_internal;
  cachePrimingDownloadTokenNum = internal->cachePrimingDownloadTokenNum;
  if (cachePrimingDownloadTokenNum)
  {
    if (internal->playbackItem)
    {
      uint64_t FigBaseObject = FigPlaybackItemGetFigBaseObject();
      uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v6) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      uint64_t v8 = *(uint64_t (**)(uint64_t, void, NSNumber *))(v7 + 56);
      if (v8) {
        LODWORD(cachePrimingDownloadTokenNum) = v8(FigBaseObject, *MEMORY[0x1E4F33928], cachePrimingDownloadTokenNum);
      }
      else {
        LODWORD(cachePrimingDownloadTokenNum) = -12782;
      }

      self->_internal->cachePrimingDownloadTokenNum = 0;
    }
    else
    {
      LODWORD(cachePrimingDownloadTokenNum) = 0;
    }
  }
  return (int)cachePrimingDownloadTokenNum;
}

- (int)_readyForInspection
{
  uint64_t v2 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVAssetDownloadSessionFileSizeAvailableNotification" object:self userInfo:0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v2);
  return 0;
}

- (id)_verifyDownloadConfigurationForAssetType
{
  CFTypeRef cf = 0;
  uint64_t CMBaseObject = FigAssetGetCMBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v5 + 48);
  if (!v6)
  {
    signed int v7 = -12782;
    goto LABEL_10;
  }
  signed int v7 = v6(CMBaseObject, *MEMORY[0x1E4F32188], *MEMORY[0x1E4F1CF80], &cf);
  if (v7)
  {
LABEL_10:
    uint64_t v9 = AVLocalizedErrorWithUnderlyingOSStatus(v7, 0);
    goto LABEL_11;
  }
  if (!FigCFEqual() || self->_internal->assetDownloader)
  {
    uint64_t v8 = 0;
    goto LABEL_12;
  }
  uint64_t v9 = AVLocalizedError(@"AVFoundationErrorDomain", -11838, 0);
LABEL_11:
  uint64_t v8 = (void *)v9;
LABEL_12:
  if (cf) {
    CFRelease(cf);
  }
  return v8;
}

- (OpaqueFigAsset)_createDuplicateFigAssetFromAVAsset:(id)a3 options:(id)a4
{
  uint64_t v6 = [a3 _figAsset];
  id v16 = 0;
  uint64_t v17 = 0;
  figAssetCreationFlagsForAssetReferenceRestrictions(2);
  signed int v7 = (void *)MEMORY[0x1E4F1CF80];
  if (v6
    && ((CMBaseObject = FigAssetGetCMBaseObject(), (uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0)
      ? (uint64_t v10 = 0)
      : (uint64_t v10 = v9),
        (int v11 = *(void (**)(uint64_t, void, void, id *))(v10 + 48)) != 0
     && (v11(CMBaseObject, *MEMORY[0x1E4F321F8], *v7, &v16), v16)))
  {
    id v12 = (id)[v16 mutableCopy];
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  signed int v13 = v12;
  objc_msgSend(v12, "setObject:forKey:", self->_internal->destinationURL, *MEMORY[0x1E4F31FC8], v16);
  uint64_t v14 = [a4 objectForKey:@"AVAssetDownloadSessionClientBundleIdentifierKey"];
  if (v14) {
    [v13 setObject:v14 forKey:*MEMORY[0x1E4F31F68]];
  }
  FigAssetRemoteCreateWithURL();

  return v17;
}

- (id)_errorFromAssetNotificationPayload:(id)a3
{
  uint64_t v5 = (void *)[a3 objectForKey:*MEMORY[0x1E4F32140]];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    signed int v7 = [v5 code];
    return (id)AVErrorWithNSErrorAndOSStatus(v6, v7, 0);
  }
  else
  {
    uint64_t v9 = *MEMORY[0x1E4F32170];
    return [(AVAssetDownloadSession *)self _errorForFigNotificationPayload:a3 key:v9];
  }
}

- (id)_figAssetNotificationNames
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F31EC8], *MEMORY[0x1E4F31EC0], *MEMORY[0x1E4F31ED8], *MEMORY[0x1E4F31ED0], *MEMORY[0x1E4F31EE8], 0);
}

- (void)_addFigAssetListeners
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(AVAssetDownloadSession *)self _figAsset])
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    id v4 = [(AVAssetDownloadSession *)self _weakReference];
    CFRetain(v4);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [(AVAssetDownloadSession *)self _figAssetNotificationNames];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, avAssetDownloadSession_figAssetNotificationCallback, *(void *)(*((void *)&v10 + 1) + 8 * v9++), -[AVAssetDownloadSession _figAsset](self, "_figAsset"), 0);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_removeFigAssetListeners
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(AVAssetDownloadSession *)self _figAsset])
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    id v4 = [(AVAssetDownloadSession *)self _weakReference];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [(AVAssetDownloadSession *)self _figAssetNotificationNames];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, avAssetDownloadSession_figAssetNotificationCallback, *(void *)(*((void *)&v10 + 1) + 8 * v9++), -[AVAssetDownloadSession _figAsset](self, "_figAsset"));
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
    CFRelease(v4);
  }
}

- (id)_figPlaybackItemNotificationNames
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F33558], *MEMORY[0x1E4F33640], 0);
}

- (void)_addFigPlaybackItemListeners
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_internal->playbackItem)
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    id v4 = [(AVAssetDownloadSession *)self _weakReference];
    CFRetain(v4);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [(AVAssetDownloadSession *)self _figPlaybackItemNotificationNames];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [v3 addListenerWithWeakReference:v4 callback:avAssetDownloadSession_figPlaybackItemNotificationCallback name:*(void *)(*((void *)&v10 + 1) + 8 * v9++) object:self->_internal->playbackItem flags:0];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_removeFigPlaybackItemListeners
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_internal->playbackItem)
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    id v4 = [(AVAssetDownloadSession *)self _weakReference];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [(AVAssetDownloadSession *)self _figPlaybackItemNotificationNames];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [v3 removeListenerWithWeakReference:v4 callback:avAssetDownloadSession_figPlaybackItemNotificationCallback name:*(void *)(*((void *)&v10 + 1) + 8 * v9++) object:self->_internal->playbackItem];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
    CFRelease(v4);
  }
}

- (BOOL)isDefunct
{
  unsigned __int8 v19 = 0;
  figAsset = self->_internal->figAsset;
  id v4 = *(void **)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  if (*v5 < 5uLL) {
    goto LABEL_26;
  }
  uint64_t v6 = (uint64_t (*)(OpaqueFigAsset *, unsigned __int8 *))v5[11];
  if (!v6) {
    goto LABEL_26;
  }
  int v7 = v6(figAsset, &v19);
  int v8 = v19;
  if (!v19)
  {
    if (v7) {
      goto LABEL_26;
    }
    player = self->_internal->player;
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
    long long v11 = v10 ? (void *)v10 : 0;
    if (*v11 >= 5uLL && (long long v12 = (uint64_t (*)(OpaqueFigPlayer *, unsigned __int8 *))v11[11]) != 0) {
      int v13 = v12(player, &v19);
    }
    else {
      int v13 = -12782;
    }
    int v8 = v19;
    if (!v19)
    {
      if (v13) {
        goto LABEL_26;
      }
      assetDownloader = self->_internal->assetDownloader;
      uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 8);
      id v16 = v15 ? (void *)v15 : 0;
      if (*v16 < 5uLL)
      {
        LOBYTE(v17) = 0;
      }
      else
      {
        uint64_t v17 = (unsigned int (*)(CMBaseObject *, unsigned __int8 *))v16[11];
        if (v17) {
          LOBYTE(v17) = v17(assetDownloader, &v19) == 0;
        }
      }
      int v8 = v19;
      if (!v19 && (v17 & 1) == 0) {
LABEL_26:
      }
        int v8 = 1;
    }
  }
  return v8 == 1;
}

@end