@interface JFXCompositionPlayer
+ (Class)compositionClass;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cachedCurrentTimeForCompositionUpdate;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentCMTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackTimeChangedObserverInterval;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)wasCurrentTime;
- (AVPlayer)player;
- (BOOL)JFX_clipDataSourceHasClip:(id)a3;
- (BOOL)isAudioMuted;
- (BOOL)isPlaying;
- (BOOL)isRequestOfTypePendingOrQueued:(unint64_t)a3;
- (BOOL)isRequestOfTypeQueued:(unint64_t)a3;
- (BOOL)pause:(id)a3;
- (BOOL)play:(id)a3;
- (BOOL)restoringPlayerStateAfterCompositionUpdate;
- (BOOL)setAudioMuted:(BOOL)a3 completionBlock:(id)a4;
- (BOOL)updateComposition:(id)a3;
- (BOOL)updateCompositionForClip:(id)a3 completion:(id)a4;
- (BOOL)wasAudioMuted;
- (BOOL)wasPlaying;
- (CGSize)renderSize;
- (JFXAVPlayerViewer)playerView;
- (JFXComposition)composition;
- (JFXCompositionPlayableElementsDataSource)clipsDataSource;
- (JFXCompositionPlayer)initWithClipsDataSource:(id)a3 seekPosition:(int)a4 audioMuted:(BOOL)a5;
- (JFXCompositionPlayerDelegate)playbackDelegate;
- (JFXCompositionPlayerRequest)pendingRequest;
- (NSMutableArray)requestQueue;
- (NSString)displayName;
- (id)firstQueuedRequestOfType:(unint64_t)a3;
- (id)playerPlaybackTimePeriodicObserver;
- (id)playerProVideoPeriodicObserver;
- (id)removeAllRequests;
- (id)removeRequestOfType:(unint64_t)a3;
- (id)requestWithBlock:(id)a3 ofType:(unint64_t)a4 completion:(id)a5;
- (int)currentTime;
- (int)duration;
- (unsigned)parentCode;
- (void)appendRequests:(id)a3;
- (void)cancelQueuedCompositionUpdateRequestFromClip:(id)a3;
- (void)cancelQueuedRequestOfType:(unint64_t)a3;
- (void)checkPendingRequestForTimeOut;
- (void)clearQueuedRequests;
- (void)completePendingRequest:(BOOL)a3 wasCancelled:(BOOL)a4 error:(id)a5;
- (void)completeRequest:(id)a3 success:(BOOL)a4 wasCancelled:(BOOL)a5 error:(id)a6;
- (void)configureCompositorCompletionBlock;
- (void)createPlayer;
- (void)dealloc;
- (void)destroyPlayer;
- (void)dispatchBlockWhenDone:(id)a3;
- (void)doClipCompositionUpdate:(id)a3;
- (void)doMuteAudio:(BOOL)a3;
- (void)doPause;
- (void)doPlay;
- (void)doUpdateComposition;
- (void)enqueueRequest:(id)a3;
- (void)executeNextRequest;
- (void)executeRequestCompletionBlock:(id)a3 success:(BOOL)a4 wasCancelled:(BOOL)a5 error:(id)a6;
- (void)handleChangeAudioMutedCompleted;
- (void)handleClipCompositionUpdateTimedOut;
- (void)handleCompositionRefreshCompleted:(BOOL)a3;
- (void)handlePlaybackBegan;
- (void)handlePlaybackPaused;
- (void)handleReadyForDisplay:(BOOL)a3;
- (void)handleSeekCompleted:(BOOL)a3;
- (void)handleUpdateCompositionCompleted:(BOOL)a3 wasCancelled:(BOOL)a4 error:(id)a5;
- (void)handleUpdateCompositionForClipCompleted:(BOOL)a3;
- (void)notifyPlayerViewSizeChanged;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeCompositorCompletionBlock;
- (void)resetPlaybackTimeChangedObserverInterval;
- (void)seek:(int)a3 cancelQueuedRequest:(BOOL)a4 tolerance:(int)a5 completion:(id)a6;
- (void)seek:(int)a3 tolerance:(int)a4 completion:(id)a5;
- (void)setCachedCurrentTimeForCompositionUpdate:(id *)a3;
- (void)setClipsDataSource:(id)a3;
- (void)setComposition:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setParentCode:(unsigned int)a3;
- (void)setPendingRequest:(id)a3;
- (void)setPlaybackDelegate:(id)a3;
- (void)setPlaybackTimeChangedObserverInterval:(id *)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerPlaybackTimePeriodicObserver:(id)a3;
- (void)setPlayerProVideoPeriodicObserver:(id)a3;
- (void)setPlayerView:(id)a3 completionBlock:(id)a4;
- (void)setRequestQueue:(id)a3;
- (void)setRestoringPlayerStateAfterCompositionUpdate:(BOOL)a3;
- (void)setWasAudioMuted:(BOOL)a3;
- (void)setWasCurrentTime:(id *)a3;
- (void)setWasPlaying:(BOOL)a3;
- (void)setupPlaybackTimeChangedObserver;
- (void)teardownSetPlaceHolder:(BOOL)a3;
- (void)throttleRequestWithCompletionBlock:(id)a3 ofType:(unint64_t)a4;
- (void)warnTooManyLiveCompositors:(id)a3;
@end

@implementation JFXCompositionPlayer

- (JFXCompositionPlayer)initWithClipsDataSource:(id)a3 seekPosition:(int)a4 audioMuted:(BOOL)a5
{
  id v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)JFXCompositionPlayer;
  v10 = [(JFXCompositionPlayer *)&v18 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_clipsDataSource, a3);
    v11->_playbackTimeChangedObserverInterval.epoch = 0;
    *(_OWORD *)&v11->_playbackTimeChangedObserverInterval.value = kDefaultPlaybackTimeObserverInterval;
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    requestQueue = v11->_requestQueue;
    v11->_requestQueue = v12;

    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v11 selector:sel_warnTooManyLiveCompositors_ name:*MEMORY[0x263F617C8] object:0];

    CMTimeFromFrameTime(a4, [(JFXCompositionPlayableElementsDataSource *)v11->_clipsDataSource frameRate], (CMTime *)&v17);
    v11->_wasCurrentTime = v17;
    uint64_t v15 = MEMORY[0x263F010E0];
    *(_OWORD *)&v11->_cachedCurrentTimeForCompositionUpdate.value = *MEMORY[0x263F010E0];
    v11->_cachedCurrentTimeForCompositionUpdate.epoch = *(void *)(v15 + 16);
    v11->_wasAudioMuted = a5;
    v11->_wasPlaying = 0;
    v11->_parentCode = -1;
  }

  return v11;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(JFXCompositionPlayer *)self teardownSetPlaceHolder:0];
  v4.receiver = self;
  v4.super_class = (Class)JFXCompositionPlayer;
  [(JFXCompositionPlayer *)&v4 dealloc];
}

- (void)teardownSetPlaceHolder:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  v5 = JFXLog_DebugPlayback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(JFXCompositionPlayer *)self displayName];
    int v13 = 138543362;
    v14 = v6;
    _os_log_impl(&dword_234C41000, v5, OS_LOG_TYPE_DEFAULT, "Player %{public}@ Tear Down", (uint8_t *)&v13, 0xCu);
  }
  v7 = [(JFXCompositionPlayer *)self playbackDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(JFXCompositionPlayer *)self playbackDelegate];
    [v9 playbackReadyForDisplayChanged:self isReady:0 setPlaceHolder:v3];
  }
  [(JFXCompositionPlayer *)self clearQueuedRequests];
  v10 = [(JFXCompositionPlayer *)self pendingRequest];

  if (v10)
  {
    v11 = [(JFXCompositionPlayer *)self pendingRequest];
    [(JFXCompositionPlayer *)self executeRequestCompletionBlock:v11 success:0 wasCancelled:1 error:0];

    [(JFXCompositionPlayer *)self setPendingRequest:0];
  }
  [(JFXCompositionPlayer *)self destroyPlayer];
  v12 = [(JFXCompositionPlayer *)self playerView];
  [v12 setPlayer:0];
}

- (JFXCompositionPlayableElementsDataSource)clipsDataSource
{
  return self->_clipsDataSource;
}

+ (Class)compositionClass
{
  return (Class)objc_opt_class();
}

- (id)requestWithBlock:(id)a3 ofType:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [[JFXCompositionPlayerRequest alloc] initWithBlock:v9 ofType:a4];

  [(JFXCompositionPlayerRequest *)v10 setPlayer:self];
  [(JFXCompositionPlayerRequest *)v10 setCompletionBlock:v8];

  return v10;
}

- (BOOL)isRequestOfTypePendingOrQueued:(unint64_t)a3
{
  v5 = [(JFXCompositionPlayer *)self pendingRequest];
  uint64_t v6 = [v5 type];

  if (v6 == a3) {
    return 1;
  }
  return [(JFXCompositionPlayer *)self isRequestOfTypeQueued:a3];
}

- (id)firstQueuedRequestOfType:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v4 = [(JFXCompositionPlayer *)self requestQueue];
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
        if ([v9 type] == a3)
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

- (void)checkPendingRequestForTimeOut
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 pendingRequest];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2048;
  double v9 = a3;
  _os_log_error_impl(&dword_234C41000, a2, OS_LOG_TYPE_ERROR, "Request %{public}@ Timed Out because it had not completed executing in %f sec", (uint8_t *)&v6, 0x16u);
}

- (id)removeRequestOfType:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v6 = [(JFXCompositionPlayer *)self requestQueue];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 type] == a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    long long v12 = [(JFXCompositionPlayer *)self requestQueue];
    [v12 removeObjectsInArray:v5];
  }
  return v5;
}

- (id)removeAllRequests
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_super v4 = [(JFXCompositionPlayer *)self requestQueue];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    int v6 = [(JFXCompositionPlayer *)self requestQueue];
    [v3 addObjectsFromArray:v6];

    uint64_t v7 = [(JFXCompositionPlayer *)self requestQueue];
    [v7 removeAllObjects];
  }
  return v3;
}

- (void)appendRequests:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    objc_super v4 = [(JFXCompositionPlayer *)self requestQueue];
    [v4 addObjectsFromArray:v5];
  }
}

- (BOOL)isRequestOfTypeQueued:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v4 = [(JFXCompositionPlayer *)self requestQueue];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) type] == a3)
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)clearQueuedRequests
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(JFXCompositionPlayer *)self requestQueue];
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
        [(JFXCompositionPlayer *)self executeRequestCompletionBlock:*(void *)(*((void *)&v9 + 1) + 8 * v7++) success:0 wasCancelled:1 error:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  uint64_t v8 = [(JFXCompositionPlayer *)self requestQueue];
  [v8 removeAllObjects];
}

- (void)cancelQueuedRequestOfType:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(JFXCompositionPlayer *)self requestQueue];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      if ([v10 type] == a3) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    id v11 = v10;

    if (!v11) {
      return;
    }
    [(JFXCompositionPlayer *)self executeRequestCompletionBlock:v11 success:0 wasCancelled:1 error:0];
    long long v12 = [(JFXCompositionPlayer *)self requestQueue];
    [v12 removeObjectIdenticalTo:v11];

    uint64_t v5 = v11;
  }
LABEL_12:
}

- (void)cancelQueuedCompositionUpdateRequestFromClip:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(JFXCompositionPlayer *)self requestQueue];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v6)
  {
LABEL_11:
    id v11 = v5;
    goto LABEL_14;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v17;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v17 != v8) {
      objc_enumerationMutation(v5);
    }
    long long v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
    if ([v10 type] != 5) {
      goto LABEL_9;
    }
    id v11 = v10;
    long long v12 = [v11 clipUUID];
    long long v13 = [v4 uuid];
    char v14 = [v12 isEqualToString:v13];

    if (v14) {
      break;
    }

LABEL_9:
    if (v7 == ++v9)
    {
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        goto LABEL_3;
      }
      goto LABEL_11;
    }
  }

  if (!v11) {
    goto LABEL_15;
  }
  [(JFXCompositionPlayer *)self executeRequestCompletionBlock:v11 success:0 wasCancelled:1 error:0];
  long long v15 = [(JFXCompositionPlayer *)self requestQueue];
  [v15 removeObjectIdenticalTo:v11];

LABEL_14:
LABEL_15:
}

- (void)enqueueRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(JFXCompositionPlayer *)self requestQueue];
  [v5 addObject:v4];

  [v4 didEnqueue];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  objc_msgSend(v4, "setStartTime:");
  uint64_t v6 = JFXLog_DebugPlayback();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

  if (v7)
  {
    uint64_t v8 = JFXLog_DebugPlayback();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[JFXCompositionPlayer enqueueRequest:]((uint64_t)v4, v8);
    }
  }
  uint64_t v9 = [(JFXCompositionPlayer *)self pendingRequest];
  if (v9)
  {
  }
  else
  {
    long long v10 = [(JFXCompositionPlayer *)self requestQueue];
    uint64_t v11 = [v10 count];

    if (v11 == 1) {
      [(JFXCompositionPlayer *)self executeNextRequest];
    }
  }
}

- (void)executeNextRequest
{
  [(JFXCompositionPlayer *)self setPendingRequest:0];
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__JFXCompositionPlayer_executeNextRequest__block_invoke;
  block[3] = &unk_264C0C488;
  block[4] = self;
  objc_copyWeak(&v8, &location);
  id v3 = MEMORY[0x263EF83A0];
  dispatch_async(MEMORY[0x263EF83A0], block);
  dispatch_time_t v4 = dispatch_time(0, 5000000000);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__JFXCompositionPlayer_executeNextRequest__block_invoke_150;
  v5[3] = &unk_264C0B428;
  objc_copyWeak(&v6, &location);
  dispatch_after(v4, v3, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __42__JFXCompositionPlayer_executeNextRequest__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) pendingRequest];

  if (!v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      dispatch_time_t v4 = [*(id *)(a1 + 32) requestQueue];
      uint64_t v5 = [v4 firstObject];

      if (v5)
      {
        id v6 = [*(id *)(a1 + 32) requestQueue];
        [v6 removeObjectAtIndex:0];

        [*(id *)(a1 + 32) setPendingRequest:v5];
        BOOL v7 = JFXLog_DebugPlayback();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = [*(id *)(a1 + 32) pendingRequest];
          int v11 = 138543362;
          long long v12 = v8;
          _os_log_impl(&dword_234C41000, v7, OS_LOG_TYPE_DEFAULT, "Request %{public}@ started", (uint8_t *)&v11, 0xCu);
        }
        [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
        objc_msgSend(v5, "setStartTime:");
        [v5 didBegin];
        uint64_t v9 = [v5 block];
        long long v10 = [v5 uniqueID];
        ((void (**)(void, void *))v9)[2](v9, v10);
      }
    }
  }
}

void __42__JFXCompositionPlayer_executeNextRequest__block_invoke_150(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained checkPendingRequestForTimeOut];
}

- (void)completePendingRequest:(BOOL)a3 wasCancelled:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  uint64_t v9 = [(JFXCompositionPlayer *)self pendingRequest];
  [(JFXCompositionPlayer *)self executeRequestCompletionBlock:v9 success:v6 wasCancelled:v5 error:v8];

  [(JFXCompositionPlayer *)self executeNextRequest];
}

- (void)completeRequest:(id)a3 success:(BOOL)a4 wasCancelled:(BOOL)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __67__JFXCompositionPlayer_completeRequest_success_wasCancelled_error___block_invoke;
  v14[3] = &unk_264C0C4B0;
  v14[4] = self;
  id v15 = v10;
  BOOL v17 = a4;
  BOOL v18 = a5;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

void __67__JFXCompositionPlayer_completeRequest_success_wasCancelled_error___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) pendingRequest];
  id v3 = [v2 uniqueID];
  int v4 = [v3 isEqualToString:*(void *)(a1 + 40)];

  if (v4)
  {
    BOOL v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 57);
    uint64_t v8 = *(void *)(a1 + 48);
    [v5 completePendingRequest:v6 wasCancelled:v7 error:v8];
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "requestQueue", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
LABEL_7:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        char v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
        id v15 = [v14 uniqueID];
        char v16 = [v15 isEqualToString:*(void *)(a1 + 40)];

        if (v16) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v11) {
            goto LABEL_7;
          }
          goto LABEL_16;
        }
      }
      id v17 = v14;

      if (!v17) {
        return;
      }
      [*(id *)(a1 + 32) executeRequestCompletionBlock:v17 success:*(unsigned __int8 *)(a1 + 56) wasCancelled:*(unsigned __int8 *)(a1 + 57) error:*(void *)(a1 + 48)];
      BOOL v18 = [*(id *)(a1 + 32) requestQueue];
      [v18 removeObjectIdenticalTo:v17];

      uint64_t v9 = v17;
    }
LABEL_16:
  }
}

- (void)executeRequestCompletionBlock:(id)a3 success:(BOOL)a4 wasCancelled:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = JFXLog_DebugPlayback();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);

  if (v7)
  {
    if (v13)
    {
      char v14 = JFXLog_DebugPlayback();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v29 = v10;
        _os_log_impl(&dword_234C41000, v14, OS_LOG_TYPE_DEFAULT, "Request %{public}@ was throttled", buf, 0xCu);
      }
    }
    [v10 didCancel];
  }
  else
  {
    if (v13)
    {
      id v15 = JFXLog_DebugPlayback();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
        double v17 = v16;
        BOOL v18 = [(JFXCompositionPlayer *)self pendingRequest];
        [v18 startTime];
        *(_DWORD *)buf = 138543618;
        id v29 = v10;
        __int16 v30 = 2048;
        double v31 = v17 - v19;
        _os_log_impl(&dword_234C41000, v15, OS_LOG_TYPE_DEFAULT, "Request %{public}@ completed in %f sec", buf, 0x16u);
      }
    }
    [v10 didComplete];
  }
  long long v20 = [v10 completionBlock];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__JFXCompositionPlayer_executeRequestCompletionBlock_success_wasCancelled_error___block_invoke;
  block[3] = &unk_264C0C4D8;
  BOOL v26 = a4;
  BOOL v27 = v7;
  id v24 = v11;
  id v25 = v20;
  id v21 = v11;
  id v22 = v20;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __81__JFXCompositionPlayer_executeRequestCompletionBlock_success_wasCancelled_error___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(void *)(a1 + 32));
  }
  return result;
}

- (void)throttleRequestWithCompletionBlock:(id)a3 ofType:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = JFXLog_DebugPlayback();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = +[JFXCompositionPlayerRequest stringFromRequestType:a4];
    uint64_t v9 = [(JFXCompositionPlayer *)self displayName];
    *(_DWORD *)buf = 138543618;
    char v14 = v8;
    __int16 v15 = 2114;
    double v16 = v9;
    _os_log_impl(&dword_234C41000, v7, OS_LOG_TYPE_DEFAULT, "Request type %{public}@ for player %{public}@ throttled because already pending", buf, 0x16u);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__JFXCompositionPlayer_throttleRequestWithCompletionBlock_ofType___block_invoke;
  block[3] = &unk_264C0A3F0;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __66__JFXCompositionPlayer_throttleRequestWithCompletionBlock_ofType___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t, void))(result + 16))(result, 0, 1, 0);
  }
  return result;
}

- (void)dispatchBlockWhenDone:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __46__JFXCompositionPlayer_dispatchBlockWhenDone___block_invoke;
  uint64_t v9 = &unk_264C0C500;
  objc_copyWeak(&v10, &location);
  BOOL v5 = [(JFXCompositionPlayer *)self requestWithBlock:&v6 ofType:6 completion:v4];
  -[JFXCompositionPlayer enqueueRequest:](self, "enqueueRequest:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __46__JFXCompositionPlayer_dispatchBlockWhenDone___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained completeRequest:v3 success:1 wasCancelled:0 error:0];
}

- (BOOL)play:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(JFXCompositionPlayer *)self isRequestOfTypePendingOrQueued:2];
  if (v5)
  {
    [(JFXCompositionPlayer *)self throttleRequestWithCompletionBlock:v4 ofType:2];
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    id v11 = __29__JFXCompositionPlayer_play___block_invoke;
    id v12 = &unk_264C0C500;
    objc_copyWeak(&v13, &location);
    uint64_t v6 = (void *)MEMORY[0x237DD15A0](&v9);
    uint64_t v7 = -[JFXCompositionPlayer requestWithBlock:ofType:completion:](self, "requestWithBlock:ofType:completion:", v6, 2, v4, v9, v10, v11, v12);
    [(JFXCompositionPlayer *)self enqueueRequest:v7];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return !v5;
}

void __29__JFXCompositionPlayer_play___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v5 = [WeakRetained player];
    uint64_t v6 = [v5 timeControlStatus];

    if (v6 == 2) {
      [v4 completeRequest:v7 success:1 wasCancelled:0 error:0];
    }
    else {
      [v4 doPlay];
    }
  }
}

- (void)setPlaybackTimeChangedObserverInterval:(id *)a3
{
  if (a3->var2)
  {
    CMTime time1 = *(CMTime *)a3;
    CMTime v6 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
    if (CMTimeCompare(&time1, &v6))
    {
      long long v5 = *(_OWORD *)&a3->var0;
      self->_playbackTimeChangedObserverInterval.epoch = a3->var3;
      *(_OWORD *)&self->_playbackTimeChangedObserverInterval.value = v5;
      [(JFXCompositionPlayer *)self setupPlaybackTimeChangedObserver];
    }
  }
}

- (void)resetPlaybackTimeChangedObserverInterval
{
  uint64_t v3 = 0;
  long long v2 = kDefaultPlaybackTimeObserverInterval;
  [(JFXCompositionPlayer *)self setPlaybackTimeChangedObserverInterval:&v2];
}

- (void)handlePlaybackBegan
{
  [(JFXCompositionPlayer *)self removeCompositorCompletionBlock];
  uint64_t v3 = [(JFXCompositionPlayer *)self pendingRequest];
  uint64_t v4 = [v3 type];

  if (v4 == 2) {
    [(JFXCompositionPlayer *)self completePendingRequest:1 wasCancelled:0 error:0];
  }
  long long v5 = [(JFXCompositionPlayer *)self playbackDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(JFXCompositionPlayer *)self playbackDelegate];
    [v7 playbackDidStart:self];
  }
}

- (BOOL)pause:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(JFXCompositionPlayer *)self isRequestOfTypePendingOrQueued:3];
  if (v5)
  {
    [(JFXCompositionPlayer *)self throttleRequestWithCompletionBlock:v4 ofType:3];
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    id v11 = __30__JFXCompositionPlayer_pause___block_invoke;
    id v12 = &unk_264C0C500;
    objc_copyWeak(&v13, &location);
    char v6 = (void *)MEMORY[0x237DD15A0](&v9);
    id v7 = -[JFXCompositionPlayer requestWithBlock:ofType:completion:](self, "requestWithBlock:ofType:completion:", v6, 3, v4, v9, v10, v11, v12);
    [(JFXCompositionPlayer *)self enqueueRequest:v7];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return !v5;
}

void __30__JFXCompositionPlayer_pause___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained player];
    if (v5
      && (char v6 = (void *)v5,
          [v4 player],
          id v7 = objc_claimAutoreleasedReturnValue(),
          uint64_t v8 = [v7 timeControlStatus],
          v7,
          v6,
          v8))
    {
      [v4 doPause];
    }
    else
    {
      [v4 completeRequest:v9 success:1 wasCancelled:0 error:0];
    }
  }
}

- (void)handlePlaybackPaused
{
  [(JFXCompositionPlayer *)self configureCompositorCompletionBlock];
  uint64_t v3 = [(JFXCompositionPlayer *)self pendingRequest];
  uint64_t v4 = [v3 type];

  if (v4 == 3) {
    [(JFXCompositionPlayer *)self completePendingRequest:1 wasCancelled:0 error:0];
  }
  long long v18 = 0uLL;
  uint64_t v19 = 0;
  uint64_t v5 = [(JFXCompositionPlayer *)self player];
  char v6 = v5;
  if (v5)
  {
    [v5 currentTime];
  }
  else
  {
    long long v18 = 0uLL;
    uint64_t v19 = 0;
  }

  id v7 = [(JFXCompositionPlayer *)self clipsDataSource];
  int32_t v8 = [v7 frameRate];
  long long v16 = v18;
  uint64_t v17 = v19;
  uint64_t v9 = FrameTimeFromCMTime(&v16, v8);

  uint64_t v10 = [(JFXCompositionPlayer *)self player];
  uint64_t v11 = [v10 currentItem];
  id v12 = [(id)v11 customVideoCompositor];
  long long v16 = v18;
  uint64_t v17 = v19;
  [v12 signalScheduling:&v16 playerRate:0.0];

  id v13 = [(JFXCompositionPlayer *)self playbackDelegate];
  LOBYTE(v11) = objc_opt_respondsToSelector();

  if (v11)
  {
    char v14 = [(JFXCompositionPlayer *)self playbackDelegate];
    [v14 playbackDidStop:self currentTime:v9];
  }
  __int16 v15 = [(JFXCompositionPlayer *)self composition];
  long long v16 = v18;
  uint64_t v17 = v19;
  [v15 notifyPlaybackDidStopAtTime:&v16];
}

- (void)seek:(int)a3 cancelQueuedRequest:(BOOL)a4 tolerance:(int)a5 completion:(id)a6
{
  BOOL v7 = a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  if (v7) {
    [(JFXCompositionPlayer *)self cancelQueuedRequestOfType:4];
  }
  objc_initWeak(&location, self);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  long long v16 = __70__JFXCompositionPlayer_seek_cancelQueuedRequest_tolerance_completion___block_invoke;
  uint64_t v17 = &unk_264C0C578;
  objc_copyWeak(&v19, &location);
  int v20 = v8;
  int v21 = a5;
  long long v18 = self;
  uint64_t v11 = (void *)MEMORY[0x237DD15A0](&v14);
  id v12 = [JFXCompositionSeekRequest alloc];
  id v13 = -[JFXCompositionSeekRequest initWithBlock:withSeekTime:](v12, "initWithBlock:withSeekTime:", v11, v8, v14, v15, v16, v17);
  [(JFXCompositionPlayerRequest *)v13 setPlayer:self];
  [(JFXCompositionPlayerRequest *)v13 setCompletionBlock:v10];
  [(JFXCompositionPlayer *)self enqueueRequest:v13];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __70__JFXCompositionPlayer_seek_cancelQueuedRequest_tolerance_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    char v6 = [WeakRetained clipsDataSource];
    int32_t v7 = [v6 frameRate];

    memset(v22, 0, 24);
    CMTimeFromFrameTime(*(_DWORD *)(a1 + 48), v7, v22);
    memset(&v21, 0, sizeof(v21));
    CMTimeFromFrameTime(*(_DWORD *)(a1 + 52), v7, &v21);
    uint64_t v8 = [v5 composition];
    uint64_t v9 = v8;
    if (v8) {
      [v8 duration];
    }
    else {
      memset(&time2, 0, sizeof(time2));
    }
    CMTime time1 = v22[0];
    BOOL v10 = CMTimeCompare(&time1, &time2) > 0;

    if (v10)
    {
      uint64_t v11 = [v5 composition];
      id v12 = v11;
      if (v11) {
        [v11 duration];
      }
      else {
        memset(&time1, 0, sizeof(time1));
      }
      v22[0] = time1;
    }
    id v13 = [v5 player];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __70__JFXCompositionPlayer_seek_cancelQueuedRequest_tolerance_completion___block_invoke_2;
    v17[3] = &unk_264C0C550;
    CMTime v18 = v22[0];
    uint64_t v14 = *(void *)(a1 + 32);
    v17[4] = v5;
    v17[5] = v14;
    CMTime time1 = v22[0];
    CMTime v16 = v21;
    CMTime v15 = v21;
    [v13 seekToTime:&time1 toleranceBefore:&v16 toleranceAfter:&v15 completionHandler:v17];
  }
}

__n128 __70__JFXCompositionPlayer_seek_cancelQueuedRequest_tolerance_completion___block_invoke_2(uint64_t a1, char a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __70__JFXCompositionPlayer_seek_cancelQueuedRequest_tolerance_completion___block_invoke_3;
  v4[3] = &unk_264C0C528;
  uint64_t v7 = *(void *)(a1 + 64);
  long long v2 = *(_OWORD *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 32);
  long long v6 = v2;
  char v8 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v4);
  return result;
}

uint64_t __70__JFXCompositionPlayer_seek_cancelQueuedRequest_tolerance_completion___block_invoke_3(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) player];
  uint64_t v3 = [v2 timeControlStatus];

  if (v3 == 2)
  {
    uint64_t v4 = [*(id *)(a1 + 32) player];
    long long v5 = [v4 currentItem];
    long long v6 = [v5 customVideoCompositor];
    [v6 signalSchedulingResetSearch];

    uint64_t v7 = [*(id *)(a1 + 32) player];
    char v8 = [v7 currentItem];
    uint64_t v9 = [v8 customVideoCompositor];
    BOOL v10 = [*(id *)(a1 + 32) player];
    [v10 rate];
    long long v13 = *(_OWORD *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 64);
    objc_msgSend(v9, "signalScheduling:playerRate:", &v13);
  }
  if (([*(id *)(a1 + 40) isRequestOfTypeQueued:4] & 1) == 0)
  {
    uint64_t v11 = [*(id *)(a1 + 40) composition];
    long long v13 = *(_OWORD *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 64);
    [v11 notifyNeedsEffectPropertiesUpdatedForPlaybackTime:&v13];
  }
  return [*(id *)(a1 + 32) handleSeekCompleted:*(unsigned __int8 *)(a1 + 72)];
}

- (void)seek:(int)a3 tolerance:(int)a4 completion:(id)a5
{
}

- (void)handleSeekCompleted:(BOOL)a3
{
  BOOL v3 = a3;
  long long v5 = [(JFXCompositionPlayer *)self pendingRequest];
  uint64_t v6 = [v5 type];

  if (v6 == 4)
  {
    [(JFXCompositionPlayer *)self completePendingRequest:v3 wasCancelled:0 error:0];
  }
}

- (BOOL)setAudioMuted:(BOOL)a3 completionBlock:(id)a4
{
  id v6 = a4;
  [(JFXCompositionPlayer *)self cancelQueuedRequestOfType:7];
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__JFXCompositionPlayer_setAudioMuted_completionBlock___block_invoke;
  v10[3] = &unk_264C0C5A0;
  objc_copyWeak(&v11, &location);
  BOOL v12 = a3;
  uint64_t v7 = (void *)MEMORY[0x237DD15A0](v10);
  char v8 = [(JFXCompositionPlayer *)self requestWithBlock:v7 ofType:7 completion:v6];
  [(JFXCompositionPlayer *)self enqueueRequest:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return 1;
}

void __54__JFXCompositionPlayer_setAudioMuted_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    long long v5 = [WeakRetained player];
    int v6 = [v5 isMuted];
    int v7 = *(unsigned __int8 *)(a1 + 40);

    if (v7 == v6)
    {
      [v4 completeRequest:v8 success:1 wasCancelled:0 error:0];
    }
    else
    {
      [v4 doMuteAudio:*(unsigned __int8 *)(a1 + 40)];
      [v4 handleChangeAudioMutedCompleted];
    }
  }
}

- (void)handleChangeAudioMutedCompleted
{
  BOOL v3 = [(JFXCompositionPlayer *)self pendingRequest];
  uint64_t v4 = [v3 type];

  if (v4 == 7)
  {
    [(JFXCompositionPlayer *)self completePendingRequest:1 wasCancelled:0 error:0];
  }
}

- (void)setPlayerView:(id)a3 completionBlock:(id)a4
{
  int v7 = (JFXAVPlayerViewer *)a3;
  p_playerView = &self->_playerView;
  if (self->_playerView != v7)
  {
    BOOL v10 = v7;
    objc_storeStrong((id *)p_playerView, a3);
    id v9 = a4;
    [(JFXCompositionPlayer *)self updateComposition:v9];

    int v7 = v10;
  }
  MEMORY[0x270F9A758](p_playerView, v7);
}

- (void)notifyPlayerViewSizeChanged
{
  BOOL v3 = [(JFXCompositionPlayer *)self playerView];
  [v3 displaySize];
  double v5 = v4;
  double v7 = v6;

  id v8 = [(JFXCompositionPlayer *)self composition];
  [v8 viewSize];
  double v10 = v9;
  double v12 = v11;

  if ((v5 != v10 || v7 != v12) && (v5 != *MEMORY[0x263F001B0] || v7 != *(double *)(MEMORY[0x263F001B0] + 8)))
  {
    id v15 = [(JFXCompositionPlayer *)self composition];
    objc_msgSend(v15, "setViewSize:", v5, v7);
  }
}

- (BOOL)updateComposition:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(JFXCompositionPlayer *)self isRequestOfTypeQueued:1];
  if (v5)
  {
    [(JFXCompositionPlayer *)self throttleRequestWithCompletionBlock:v4 ofType:1];
  }
  else
  {
    if ([(JFXCompositionPlayer *)self isRequestOfTypeQueued:5])
    {
      do
        [(JFXCompositionPlayer *)self cancelQueuedRequestOfType:5];
      while ([(JFXCompositionPlayer *)self isRequestOfTypeQueued:5]);
    }
    objc_initWeak(&location, self);
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    double v12 = __42__JFXCompositionPlayer_updateComposition___block_invoke;
    long long v13 = &unk_264C0C500;
    objc_copyWeak(&v14, &location);
    double v6 = (void *)MEMORY[0x237DD15A0](&v10);
    double v7 = [JFXCompositionUpdateRequest alloc];
    id v8 = -[JFXCompositionUpdateRequest initWithBlock:](v7, "initWithBlock:", v6, v10, v11, v12, v13);
    [(JFXCompositionPlayerRequest *)v8 setCompletionBlock:v4];
    [(JFXCompositionPlayerRequest *)v8 setPlayer:self];
    [(JFXCompositionPlayer *)self enqueueRequest:v8];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return !v5;
}

void __42__JFXCompositionPlayer_updateComposition___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained doUpdateComposition];
}

- (void)doUpdateComposition
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  BOOL v3 = [(JFXCompositionPlayer *)self clipsDataSource];
  uint64_t v4 = [v3 count];

  if (v4 < 1)
  {
LABEL_6:
    id v8 = [(JFXCompositionPlayer *)self playbackDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      uint64_t v10 = [(JFXCompositionPlayer *)self playbackDelegate];
      [v10 playbackReadyForDisplayChanged:self isReady:0 setPlaceHolder:1];
    }
    uint64_t v11 = [(JFXCompositionPlayer *)self composition];

    if (v11)
    {
      double v12 = [(JFXCompositionPlayer *)self player];
      -[JFXCompositionPlayer setWasPlaying:](self, "setWasPlaying:", [v12 timeControlStatus] == 2);

      long long v13 = [(JFXCompositionPlayer *)self player];
      id v14 = v13;
      if (v13)
      {
        [v13 currentTime];
      }
      else
      {
        long long v68 = 0uLL;
        uint64_t v69 = 0;
      }
      long long v66 = v68;
      uint64_t v67 = v69;
      [(JFXCompositionPlayer *)self setWasCurrentTime:&v66];

      uint64_t v23 = [(JFXCompositionPlayer *)self player];
      -[JFXCompositionPlayer setWasAudioMuted:](self, "setWasAudioMuted:", [v23 isMuted]);
    }
    else
    {
      id v15 = objc_alloc((Class)[(id)objc_opt_class() compositionClass]);
      CMTime v16 = [(JFXCompositionPlayer *)self clipsDataSource];
      uint64_t v17 = (void *)[v15 initWithClipsDataSource:v16];
      [(JFXCompositionPlayer *)self setComposition:v17];

      if ([(JFXCompositionPlayer *)self parentCode] != -1)
      {
        uint64_t v18 = [(JFXCompositionPlayer *)self parentCode];
        id v19 = [(JFXCompositionPlayer *)self composition];
        [v19 setParentCode:v18];
      }
    }
    [(JFXCompositionPlayer *)self wasCurrentTime];
    long long v62 = v64;
    uint64_t v63 = v65;
    [(JFXCompositionPlayer *)self setCachedCurrentTimeForCompositionUpdate:&v62];
    id v24 = [(JFXCompositionPlayer *)self playerView];
    [v24 displaySize];
    double v26 = v25;
    double v28 = v27;

    if (v26 != *MEMORY[0x263F001B0] || v28 != *(double *)(MEMORY[0x263F001B0] + 8))
    {
      id v29 = [(JFXCompositionPlayer *)self composition];
      objc_msgSend(v29, "setViewSize:", v26, v28);
    }
    __int16 v30 = [(JFXCompositionPlayer *)self composition];
    [v30 markDirty];

    double v31 = [(JFXCompositionPlayer *)self composition];
    uint64_t v32 = [v31 playerItem];

    [(JFXCompositionPlayer *)self createPlayer];
    v33 = [(JFXCompositionPlayer *)self player];
    [v33 replaceCurrentItemWithPlayerItem:v32];

    v34 = [(JFXCompositionPlayer *)self clipsDataSource];
    char v35 = objc_opt_respondsToSelector();

    if ((v35 & 1) == 0) {
      goto LABEL_23;
    }
    v36 = (void *)MEMORY[0x263F61230];
    v37 = [MEMORY[0x263F1C5C0] currentDevice];
    v38 = objc_msgSend(v37, "jfx_displayColorSpace");
    v39 = [(JFXCompositionPlayer *)self clipsDataSource];
    v40 = [v39 colorSpace];
    v41 = objc_msgSend(v36, "jfx_compareAndChooseLesserColorSpace:right:", v38, v40);

    if (!v41)
    {
LABEL_23:
      v41 = [MEMORY[0x263F61230] rec709GammaColorSpace];
    }
    v42 = [(JFXCompositionPlayer *)self playerView];
    [v42 configureDisplayAttributesForColorSpace:v41];

    v43 = [(JFXCompositionPlayer *)self clipsDataSource];
    char v44 = objc_opt_respondsToSelector();

    if (v44)
    {
      v45 = [(JFXCompositionPlayer *)self clipsDataSource];
      uint64_t v46 = [v45 playerAllowsExternalPlayback];
      v47 = [(JFXCompositionPlayer *)self player];
      [v47 setAllowsExternalPlayback:v46];
    }
    v48 = [(JFXCompositionPlayer *)self player];
    v49 = [(JFXCompositionPlayer *)self playerView];
    [v49 setPlayer:v48];

    v50 = [(JFXCompositionPlayer *)self composition];
    [v50 applyPlayerItemProperties];

    v51 = [v32 customVideoCompositor];
    [v51 setCancelsPendingRequests:0];
    [(JFXCompositionPlayer *)self configureCompositorCompletionBlock];
    memset(&buf, 0, sizeof(buf));
    v52 = [(JFXCompositionPlayer *)self composition];
    v53 = v52;
    if (v52) {
      [v52 duration];
    }
    else {
      memset(&buf, 0, sizeof(buf));
    }

    v54 = [(JFXCompositionPlayer *)self composition];
    v55 = v54;
    if (v54 && (buf.flags & 1) != 0)
    {
      CMTime location = buf;
      CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
      int32_t v57 = CMTimeCompare(&location, &time2);

      if (v57) {
        goto LABEL_33;
      }
    }
    else
    {
    }
    objc_initWeak((id *)&location, self);
    dispatch_time_t v56 = dispatch_time(0, 30000000);
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __43__JFXCompositionPlayer_doUpdateComposition__block_invoke_2;
    v58[3] = &unk_264C0B428;
    objc_copyWeak(&v59, (id *)&location);
    dispatch_after(v56, MEMORY[0x263EF83A0], v58);
    objc_destroyWeak(&v59);
    objc_destroyWeak((id *)&location);
LABEL_33:

    return;
  }
  uint64_t v5 = 0;
  while (1)
  {
    double v6 = [(JFXCompositionPlayer *)self clipsDataSource];
    double v7 = [v6 playableElementAtIndex:v5];

    if (([v7 isAssetUnavailable] & 1) == 0 && (objc_msgSend(v7, "isAssetLoaded") & 1) == 0) {
      break;
    }

    if (v4 == ++v5) {
      goto LABEL_6;
    }
  }
  int v20 = JFXLog_DebugPlayback();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    CMTime v21 = [(JFXCompositionPlayer *)self displayName];
    LODWORD(buf.value) = 138543618;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v21;
    LOWORD(buf.flags) = 2114;
    *(void *)((char *)&buf.flags + 2) = v7;
    _os_log_impl(&dword_234C41000, v20, OS_LOG_TYPE_DEFAULT, "player %{public}@ doUpdateComposition %{public}@ clip not loaded, will try again in 10 mecs", (uint8_t *)&buf, 0x16u);
  }
  objc_initWeak((id *)&buf, self);
  dispatch_time_t v22 = dispatch_time(0, 10000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__JFXCompositionPlayer_doUpdateComposition__block_invoke;
  block[3] = &unk_264C0B428;
  objc_copyWeak(&v71, (id *)&buf);
  dispatch_after(v22, MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v71);
  objc_destroyWeak((id *)&buf);
}

void __43__JFXCompositionPlayer_doUpdateComposition__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained doUpdateComposition];
}

void __43__JFXCompositionPlayer_doUpdateComposition__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained pendingRequest];
  uint64_t v2 = [v1 type];

  if (v2 == 1) {
    [WeakRetained completePendingRequest:1 wasCancelled:0 error:0];
  }
}

- (void)handleUpdateCompositionCompleted:(BOOL)a3 wasCancelled:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a5;
  char v9 = JFXLog_DebugPlayback();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [(JFXCompositionPlayer *)self displayName];
    LODWORD(buf.value) = 138543362;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v10;
    _os_log_impl(&dword_234C41000, v9, OS_LOG_TYPE_DEFAULT, "player %{public}@ composition update completed", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v11 = [(JFXCompositionPlayer *)self pendingRequest];
  BOOL v12 = [v11 type] == 1;

  if (v12)
  {
    if ([(JFXCompositionPlayer *)self wasAudioMuted]
      && ![(JFXCompositionPlayer *)self isRequestOfTypePendingOrQueued:7])
    {
      [(JFXCompositionPlayer *)self setAudioMuted:[(JFXCompositionPlayer *)self wasAudioMuted] completionBlock:0];
    }
    long long v13 = [(JFXCompositionPlayer *)self removeRequestOfType:6];
    if ([(JFXCompositionPlayer *)self isRequestOfTypeQueued:4])
    {
      id v14 = [(JFXCompositionPlayer *)self firstQueuedRequestOfType:4];
      id v15 = v14;
      if (v14 && ![v14 seekTime])
      {
        CMTime v16 = [(JFXCompositionPlayer *)self removeRequestOfType:4];
        [(JFXCompositionPlayer *)self seek:1 tolerance:0 completion:0];
        [(JFXCompositionPlayer *)self appendRequests:v16];
      }
      objc_initWeak((id *)&buf, self);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __76__JFXCompositionPlayer_handleUpdateCompositionCompleted_wasCancelled_error___block_invoke_2;
      v27[3] = &unk_264C0C5C8;
      objc_copyWeak(&v28, (id *)&buf);
      v27[4] = self;
      [(JFXCompositionPlayer *)self dispatchBlockWhenDone:v27];
      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)&buf);
    }
    else
    {
      [(JFXCompositionPlayer *)self setRestoringPlayerStateAfterCompositionUpdate:1];
      memset(&buf, 0, sizeof(buf));
      memset(&v35, 0, sizeof(v35));
      uint64_t v17 = [(JFXCompositionPlayer *)self composition];
      uint64_t v18 = v17;
      if (v17) {
        [v17 duration];
      }
      else {
        memset(&v35, 0, sizeof(v35));
      }

      [(JFXCompositionPlayer *)self wasCurrentTime];
      CMTime time2 = v35;
      CMTimeMinimum(&buf, &time1, &time2);
      id v19 = [(JFXCompositionPlayer *)self clipsDataSource];
      CMTimeMake(&v32, 0, [v19 timeScale]);
      CMTime v31 = buf;
      CMTimeMaximum(&time2, &v31, &v32);
      CMTime buf = time2;

      int v20 = [(JFXCompositionPlayer *)self clipsDataSource];
      int32_t v21 = [v20 timeScale];
      CMTime time2 = buf;
      uint64_t v22 = FrameTimeFromCMTime(&time2, v21);

      BOOL v23 = [(JFXCompositionPlayer *)self isRequestOfTypePendingOrQueued:3];
      id v24 = [(JFXCompositionPlayer *)self removeAllRequests];
      if (!v22) {
        [(JFXCompositionPlayer *)self seek:1 cancelQueuedRequest:0 tolerance:0 completion:0];
      }
      objc_initWeak((id *)&time2, self);
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __76__JFXCompositionPlayer_handleUpdateCompositionCompleted_wasCancelled_error___block_invoke;
      v29[3] = &unk_264C0C5C8;
      objc_copyWeak(&v30, (id *)&time2);
      v29[4] = self;
      [(JFXCompositionPlayer *)self seek:v22 cancelQueuedRequest:0 tolerance:0 completion:v29];
      if ([(JFXCompositionPlayer *)self wasPlaying] && !v23) {
        [(JFXCompositionPlayer *)self play:0];
      }
      [(JFXCompositionPlayer *)self appendRequests:v24];
      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)&time2);
    }
    [(JFXCompositionPlayer *)self appendRequests:v13];
    long long v25 = *MEMORY[0x263F010E0];
    uint64_t v26 = *(void *)(MEMORY[0x263F010E0] + 16);
    [(JFXCompositionPlayer *)self setWasCurrentTime:&v25];
    [(JFXCompositionPlayer *)self setWasPlaying:0];
    [(JFXCompositionPlayer *)self setWasAudioMuted:0];
    [(JFXCompositionPlayer *)self completePendingRequest:v6 wasCancelled:v5 error:v8];
  }
}

void __76__JFXCompositionPlayer_handleUpdateCompositionCompleted_wasCancelled_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v11 = *MEMORY[0x263F010E0];
    uint64_t v12 = *(void *)(MEMORY[0x263F010E0] + 16);
    [WeakRetained setCachedCurrentTimeForCompositionUpdate:&v11];
    [v3 setRestoringPlayerStateAfterCompositionUpdate:0];
    uint64_t v4 = [*(id *)(a1 + 32) composition];
    BOOL v5 = [*(id *)(a1 + 32) player];
    BOOL v6 = v5;
    if (v5) {
      [v5 currentTime];
    }
    else {
      memset(v10, 0, sizeof(v10));
    }
    [v4 notifyPlaybackDidStopAtTime:v10];

    double v7 = [v3 playbackDelegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      char v9 = [v3 playbackDelegate];
      [v9 playbackReadyForDisplayChanged:*(void *)(a1 + 32) isReady:1 setPlaceHolder:1];
    }
  }
}

void __76__JFXCompositionPlayer_handleUpdateCompositionCompleted_wasCancelled_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v11 = *MEMORY[0x263F010E0];
    uint64_t v12 = *(void *)(MEMORY[0x263F010E0] + 16);
    [WeakRetained setCachedCurrentTimeForCompositionUpdate:&v11];
    uint64_t v4 = [*(id *)(a1 + 32) composition];
    BOOL v5 = [*(id *)(a1 + 32) player];
    BOOL v6 = v5;
    if (v5) {
      [v5 currentTime];
    }
    else {
      memset(v10, 0, sizeof(v10));
    }
    [v4 notifyPlaybackDidStopAtTime:v10];

    double v7 = [v3 playbackDelegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      char v9 = [v3 playbackDelegate];
      [v9 playbackReadyForDisplayChanged:*(void *)(a1 + 32) isReady:1 setPlaceHolder:1];
    }
  }
}

- (BOOL)updateCompositionForClip:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(JFXCompositionPlayer *)self isRequestOfTypeQueued:1];
  if (v8)
  {
    [(JFXCompositionPlayer *)self throttleRequestWithCompletionBlock:v7 ofType:5];
  }
  else
  {
    [(JFXCompositionPlayer *)self cancelQueuedCompositionUpdateRequestFromClip:v6];
    objc_initWeak(&location, self);
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    CMTime v16 = __60__JFXCompositionPlayer_updateCompositionForClip_completion___block_invoke;
    uint64_t v17 = &unk_264C0C5F0;
    objc_copyWeak(&v20, &location);
    uint64_t v18 = self;
    id v9 = v6;
    id v19 = v9;
    uint64_t v10 = (void *)MEMORY[0x237DD15A0](&v14);
    long long v11 = [JFXCompositionPlayableElementUpdateRequest alloc];
    uint64_t v12 = -[JFXCompositionPlayableElementUpdateRequest initWithBlock:withClip:](v11, "initWithBlock:withClip:", v10, v9, v14, v15, v16, v17, v18);
    [(JFXCompositionPlayerRequest *)v12 setPlayer:self];
    [(JFXCompositionPlayerRequest *)v12 setCompletionBlock:v7];
    [(JFXCompositionPlayer *)self enqueueRequest:v12];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return !v8;
}

void __60__JFXCompositionPlayer_updateCompositionForClip_completion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = [*(id *)(a1 + 32) composition];
    if (v4
      && (BOOL v5 = (void *)v4,
          [*(id *)(a1 + 32) player],
          id v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          v5,
          v6))
    {
      [WeakRetained doClipCompositionUpdate:*(void *)(a1 + 40)];
    }
    else
    {
      [WeakRetained completeRequest:v7 success:0 wasCancelled:1 error:0];
      [*(id *)(a1 + 32) updateComposition:0];
    }
  }
}

- (void)doClipCompositionUpdate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(JFXCompositionPlayer *)self composition];
  [v5 noteEffectChangeForClip:v4];

  id v6 = [(JFXCompositionPlayer *)self player];
  id v7 = [v6 currentItem];
  BOOL v8 = [v7 customVideoCompositor];

  id v9 = [v8 refreshCompletionBlock];

  if (!v9)
  {
    objc_initWeak(&location, self);
    dispatch_time_t v10 = dispatch_time(0, 30000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__JFXCompositionPlayer_doClipCompositionUpdate___block_invoke;
    block[3] = &unk_264C0B428;
    objc_copyWeak(&v16, &location);
    dispatch_after(v10, MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  long long v11 = [(JFXCompositionPlayer *)self player];
  uint64_t v12 = v11;
  if (v11) {
    [v11 currentTime];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  long long v13 = [(JFXCompositionPlayer *)self player];
  [v13 rate];
  objc_msgSend(v8, "signalScheduling:playerRate:", v14);
}

void __48__JFXCompositionPlayer_doClipCompositionUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleUpdateCompositionForClipCompleted:1];
}

- (void)handleUpdateCompositionForClipCompleted:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(JFXCompositionPlayer *)self pendingRequest];
  uint64_t v6 = [v5 type];

  if (v6 == 5)
  {
    [(JFXCompositionPlayer *)self completePendingRequest:v3 wasCancelled:0 error:0];
  }
}

- (void)configureCompositorCompletionBlock
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(JFXCompositionPlayer *)self player];
  id v4 = [(id)v3 currentItem];
  BOOL v5 = [v4 customVideoCompositor];

  objc_initWeak(&location, self);
  uint64_t v6 = [v5 refreshCompletionBlock];
  LOBYTE(v3) = v6 == 0;

  if (v3)
  {
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    long long v11 = __58__JFXCompositionPlayer_configureCompositorCompletionBlock__block_invoke;
    uint64_t v12 = &unk_264C0C640;
    objc_copyWeak(&v13, &location);
    [v5 setRefreshCompletionBlock:&v9];
    id v7 = JFXLog_DebugPlayback();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [(JFXCompositionPlayer *)self displayName];
      *(_DWORD *)CMTime buf = 138543362;
      id v16 = v8;
      _os_log_impl(&dword_234C41000, v7, OS_LOG_TYPE_DEFAULT, "player %{public}@ Installed compositor refresh completion block", buf, 0xCu);
    }
    objc_destroyWeak(&v13);
  }
  objc_destroyWeak(&location);
}

void __58__JFXCompositionPlayer_configureCompositorCompletionBlock__block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__JFXCompositionPlayer_configureCompositorCompletionBlock__block_invoke_2;
  v3[3] = &unk_264C0C618;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
}

void __58__JFXCompositionPlayer_configureCompositorCompletionBlock__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleCompositionRefreshCompleted:*(unsigned __int8 *)(a1 + 40)];
}

- (void)handleCompositionRefreshCompleted:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(JFXCompositionPlayer *)self pendingRequest];
  uint64_t v6 = [v5 type];

  if (v6 == 1)
  {
    id v7 = [(JFXCompositionPlayer *)self pendingRequest];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v9 = [(JFXCompositionPlayer *)self pendingRequest];
      [v9 setRefreshCompletedReceived];
      if ([v9 hasCompleted]) {
        [(JFXCompositionPlayer *)self handleUpdateCompositionCompleted:1 wasCancelled:0 error:0];
      }
    }
  }
  else
  {
    [(JFXCompositionPlayer *)self handleUpdateCompositionForClipCompleted:v3];
  }
}

- (void)handleClipCompositionUpdateTimedOut
{
}

- (void)removeCompositorCompletionBlock
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v3 = [(JFXCompositionPlayer *)self player];
  id v4 = [v3 currentItem];
  char v5 = [v4 customVideoCompositor];

  uint64_t v6 = [v5 refreshCompletionBlock];

  if (v6)
  {
    [v5 setRefreshCompletionBlock:0];
    id v7 = JFXLog_DebugPlayback();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [(JFXCompositionPlayer *)self displayName];
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_234C41000, v7, OS_LOG_TYPE_DEFAULT, "Player %{public}@ removed compositor refresh completion block", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)doPlay
{
  [(JFXCompositionPlayer *)self removeCompositorCompletionBlock];
  BOOL v3 = [(JFXCompositionPlayer *)self player];
  [v3 play];

  id v4 = [(JFXCompositionPlayer *)self composition];
  [v4 notifyPlaybackWillBegin];
}

- (void)doPause
{
  id v2 = [(JFXCompositionPlayer *)self player];
  [v2 pause];
}

- (BOOL)isPlaying
{
  id v2 = [(JFXCompositionPlayer *)self player];
  BOOL v3 = [v2 timeControlStatus] == 2;

  return v3;
}

- (void)doMuteAudio:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(JFXCompositionPlayer *)self player];
  [v4 setMuted:v3];
}

- (BOOL)isAudioMuted
{
  id v2 = [(JFXCompositionPlayer *)self player];
  char v3 = [v2 isMuted];

  return v3;
}

- (CGSize)renderSize
{
  uint64_t v3 = [(JFXCompositionPlayer *)self composition];
  if (!v3) {
    goto LABEL_4;
  }
  id v4 = (void *)v3;
  char v5 = [(JFXCompositionPlayer *)self composition];
  uint64_t v6 = [v5 videoComposition];

  if (v6)
  {
    id v7 = [(JFXCompositionPlayer *)self composition];
    BOOL v8 = [v7 videoComposition];
    [v8 renderSize];
    double v10 = v9;
    double v12 = v11;

    id v13 = [(JFXCompositionPlayer *)self composition];
    uint64_t v14 = [v13 videoComposition];
    [v14 renderScale];
    double v16 = v15;

    double v17 = v10 * v16;
    double v18 = v12 * v16;
  }
  else
  {
LABEL_4:
    id v19 = [(JFXCompositionPlayer *)self playerView];
    [v19 displaySize];
    double v21 = v20;
    double v23 = v22;
    double v17 = *MEMORY[0x263F001B0];
    double v18 = *(double *)(MEMORY[0x263F001B0] + 8);

    if (v21 != v17 || v23 != v18)
    {
      long long v25 = [(JFXCompositionPlayer *)self clipsDataSource];
      [v25 renderSize];
      double v27 = v26;
      double v29 = v28;

      id v30 = [(JFXCompositionPlayer *)self playerView];
      [v30 displaySize];
      double v32 = v31;
      double v34 = v33;

      CMTime v35 = [(JFXCompositionPlayer *)self clipsDataSource];
      [v35 imageScale];
      double v37 = v36;

      double v38 = v32 * v37 / v27;
      if (v38 >= v34 * v37 / v29) {
        double v38 = v34 * v37 / v29;
      }
      double v39 = 1.0;
      if (v38 <= 1.0) {
        double v39 = v38;
      }
      double v17 = CGSizeIntegral(v27 * v39);
      double v18 = v40;
    }
  }
  double v41 = v17;
  double v42 = v18;
  result.height = v42;
  result.width = v41;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentCMTime
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  char v5 = [(JFXCompositionPlayer *)self player];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 currentTime];
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  [(JFXCompositionPlayer *)self cachedCurrentTimeForCompositionUpdate];
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  CGSize result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&time1, &time2);
  if (result)
  {
    BOOL v8 = [(JFXCompositionPlayer *)self clipsDataSource];
    int32_t v9 = [v8 timeScale];

    CMTime time2 = (CMTime)*retstr;
    CGSize result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)FrameTimeFromCMTime(&time2, v9);
    if (result <= 1)
    {
      int v10 = (int)result;
      double v11 = JFXLog_DebugPlayback();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        double v12 = [(JFXCompositionPlayer *)self displayName];
        [(JFXCompositionPlayer *)self cachedCurrentTimeForCompositionUpdate];
        CMTimeFlags v13 = FrameTimeFromCMTime(v14, v9);
        LODWORD(time2.value) = 138412802;
        *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v12;
        LOWORD(time2.flags) = 1024;
        *(CMTimeFlags *)((char *)&time2.flags + 2) = v13;
        WORD1(time2.epoch) = 1024;
        HIDWORD(time2.epoch) = v10;
        _os_log_debug_impl(&dword_234C41000, v11, OS_LOG_TYPE_DEBUG, "player %@ using cached current time at %d and player time is %d", (uint8_t *)&time2, 0x18u);
      }
      CGSize result = [(JFXCompositionPlayer *)self cachedCurrentTimeForCompositionUpdate];
      *(CMTime *)retstr = time2;
    }
  }
  return result;
}

- (int)currentTime
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  memset(&v15, 0, sizeof(v15));
  uint64_t v3 = [(JFXCompositionPlayer *)self player];
  id v4 = v3;
  if (v3) {
    [v3 currentTime];
  }
  else {
    memset(&v15, 0, sizeof(v15));
  }

  char v5 = [(JFXCompositionPlayer *)self clipsDataSource];
  int32_t v6 = [v5 timeScale];

  CMTime time2 = v15;
  unsigned int v7 = FrameTimeFromCMTime(&time2, v6);
  [(JFXCompositionPlayer *)self cachedCurrentTimeForCompositionUpdate];
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  if (CMTimeCompare(&time1, &time2) && v7 <= 1)
  {
    BOOL v8 = JFXLog_DebugPlayback();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v10 = [(JFXCompositionPlayer *)self displayName];
      [(JFXCompositionPlayer *)self cachedCurrentTimeForCompositionUpdate];
      CMTimeFlags v11 = FrameTimeFromCMTime(v13, v6);
      LODWORD(time2.value) = 138412802;
      *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v10;
      LOWORD(time2.flags) = 1024;
      *(CMTimeFlags *)((char *)&time2.flags + 2) = v11;
      WORD1(time2.epoch) = 1024;
      HIDWORD(time2.epoch) = v7;
      _os_log_debug_impl(&dword_234C41000, v8, OS_LOG_TYPE_DEBUG, "player %@ using cached current time at %d and player time is %d", (uint8_t *)&time2, 0x18u);
    }
    [(JFXCompositionPlayer *)self cachedCurrentTimeForCompositionUpdate];
    return FrameTimeFromCMTime(v12, v6);
  }
  return v7;
}

- (int)duration
{
  uint64_t v3 = [(JFXCompositionPlayer *)self composition];
  id v4 = v3;
  if (v3) {
    [v3 duration];
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  char v5 = [(JFXCompositionPlayer *)self clipsDataSource];
  int v6 = FrameTimeFromCMTime(v8, [v5 frameRate]);

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 != &sJFXCompositionPlayerContext)
  {
    v36.receiver = self;
    v36.super_class = (Class)JFXCompositionPlayer;
    [(JFXCompositionPlayer *)&v36 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_30;
  }
  uint64_t v13 = [(JFXCompositionPlayer *)self player];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    id v15 = [(JFXCompositionPlayer *)self player];
    if (v15 != v11)
    {

      goto LABEL_13;
    }
    int v16 = [v10 isEqualToString:@"timeControlStatus"];

    if (v16)
    {
      uint64_t v17 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      uint64_t v18 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      id v19 = (void *)v18;
      if (v17 && v18 && ([v17 isEqual:v18] & 1) != 0) {
        goto LABEL_28;
      }
      double v20 = [(JFXCompositionPlayer *)self player];
      uint64_t v21 = [v20 timeControlStatus];

      if (v21)
      {
        if (v21 != 2)
        {
LABEL_28:

          goto LABEL_29;
        }
        objc_initWeak(&location, self);
        v42[0] = MEMORY[0x263EF8330];
        v42[1] = 3221225472;
        v42[2] = __71__JFXCompositionPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke;
        v42[3] = &unk_264C0B428;
        double v22 = &v43;
        objc_copyWeak(&v43, &location);
        double v23 = MEMORY[0x263EF83A0];
        id v24 = v42;
      }
      else
      {
        objc_initWeak(&location, self);
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __71__JFXCompositionPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
        v40[3] = &unk_264C0B428;
        double v22 = &v41;
        objc_copyWeak(&v41, &location);
        double v23 = MEMORY[0x263EF83A0];
        id v24 = v40;
      }
      dispatch_async(v23, v24);
      objc_destroyWeak(v22);
      objc_destroyWeak(&location);
      goto LABEL_28;
    }
  }
LABEL_13:
  uint64_t v25 = [(JFXCompositionPlayer *)self playerView];
  if (v25)
  {
    double v26 = (void *)v25;
    id v27 = [(JFXCompositionPlayer *)self playerView];
    if (v27 == v11)
    {
      int v28 = [v10 isEqualToString:@"readyForDisplay"];

      if (v28)
      {
        double v29 = [v12 objectForKey:*MEMORY[0x263F081B8]];
        char v30 = [v29 BOOLValue];

        objc_initWeak(&location, self);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __71__JFXCompositionPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
        block[3] = &unk_264C0C618;
        objc_copyWeak(&v38, &location);
        char v39 = v30;
        dispatch_async(MEMORY[0x263EF83A0], block);
        objc_destroyWeak(&v38);
        objc_destroyWeak(&location);
        goto LABEL_30;
      }
    }
    else
    {
    }
  }
  uint64_t v31 = [(JFXCompositionPlayer *)self player];
  if (!v31) {
    goto LABEL_30;
  }
  uint64_t v17 = (void *)v31;
  id v32 = [(JFXCompositionPlayer *)self player];
  if (v32 != v11)
  {

LABEL_29:
    goto LABEL_30;
  }
  int v33 = [v10 isEqualToString:@"status"];

  if (v33)
  {
    double v34 = [(JFXCompositionPlayer *)self player];
    CMTime v35 = [v34 error];

    if (v35 && [v35 code] == -11819) {
      dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_49);
    }
  }
LABEL_30:
}

void __71__JFXCompositionPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handlePlaybackBegan];
}

void __71__JFXCompositionPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handlePlaybackPaused];
}

void __71__JFXCompositionPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleReadyForDisplay:*(unsigned __int8 *)(a1 + 40)];
}

void __71__JFXCompositionPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_4()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"mediaserverdCrashed" object:0];
}

- (void)handleReadyForDisplay:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3
    && ([(JFXCompositionPlayer *)self pendingRequest],
        char v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 type],
        v5,
        v6 == 1))
  {
    unsigned int v7 = [(JFXCompositionPlayer *)self pendingRequest];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      return;
    }
    int32_t v9 = [(JFXCompositionPlayer *)self pendingRequest];
    [v9 setReadyForDisplayReceived];
    id v10 = [(JFXCompositionPlayer *)self player];
    id v11 = [v10 currentItem];
    id v12 = [v11 customVideoCompositor];

    uint64_t v13 = [v12 refreshCompletionBlock];

    if (v13)
    {
      if ([v9 hasCompleted]) {
        [(JFXCompositionPlayer *)self handleUpdateCompositionCompleted:1 wasCancelled:0 error:0];
      }
    }
    else
    {
      int v16 = [(JFXCompositionPlayer *)self player];
      uint64_t v17 = [v16 timeControlStatus];

      if (v17 == 2)
      {
        uint64_t v18 = JFXLog_playback();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[JFXCompositionPlayer handleReadyForDisplay:](v18, v19, v20, v21, v22, v23, v24, v25);
        }
      }
      objc_initWeak(&location, self);
      dispatch_time_t v26 = dispatch_time(0, 30000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __46__JFXCompositionPlayer_handleReadyForDisplay___block_invoke;
      block[3] = &unk_264C0B428;
      objc_copyWeak(&v30, &location);
      dispatch_after(v26, MEMORY[0x263EF83A0], block);
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    uint64_t v14 = [(JFXCompositionPlayer *)self playbackDelegate];
    char v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) == 0) {
      return;
    }
    if (v3)
    {
      long long v27 = *MEMORY[0x263F010E0];
      uint64_t v28 = *(void *)(MEMORY[0x263F010E0] + 16);
      [(JFXCompositionPlayer *)self setCachedCurrentTimeForCompositionUpdate:&v27];
    }
    int32_t v9 = [(JFXCompositionPlayer *)self playbackDelegate];
    [v9 playbackReadyForDisplayChanged:self isReady:v3 setPlaceHolder:1];
  }
}

void __46__JFXCompositionPlayer_handleReadyForDisplay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleUpdateCompositionCompleted:1 wasCancelled:0 error:0];
}

- (void)createPlayer
{
  BOOL v3 = [(JFXCompositionPlayer *)self player];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263EFA7F0]);
    char v5 = [(JFXCompositionPlayer *)self composition];
    uint64_t v6 = [v5 playerItem];
    unsigned int v7 = (void *)[v4 initWithPlayerItem:v6];
    [(JFXCompositionPlayer *)self setPlayer:v7];

    BOOL v8 = [(JFXCompositionPlayer *)self player];
    [v8 addObserver:self forKeyPath:@"timeControlStatus" options:3 context:&sJFXCompositionPlayerContext];

    int32_t v9 = [(JFXCompositionPlayer *)self player];
    [v9 setActionAtItemEnd:1];

    objc_initWeak(&location, self);
    id v10 = [(JFXCompositionPlayer *)self player];
    CMTimeMake(&v18, 1, 3);
    uint64_t v11 = MEMORY[0x263EF83A0];
    id v12 = MEMORY[0x263EF83A0];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __36__JFXCompositionPlayer_createPlayer__block_invoke;
    v16[3] = &unk_264C0A328;
    objc_copyWeak(&v17, &location);
    uint64_t v13 = [v10 addPeriodicTimeObserverForInterval:&v18 queue:v11 usingBlock:v16];
    [(JFXCompositionPlayer *)self setPlayerProVideoPeriodicObserver:v13];

    [(JFXCompositionPlayer *)self setupPlaybackTimeChangedObserver];
    uint64_t v14 = [(JFXCompositionPlayer *)self playerView];
    [v14 addObserver:self forKeyPath:@"readyForDisplay" options:1 context:&sJFXCompositionPlayerContext];

    char v15 = [(JFXCompositionPlayer *)self player];
    [v15 addObserver:self forKeyPath:@"status" options:1 context:&sJFXCompositionPlayerContext];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __36__JFXCompositionPlayer_createPlayer__block_invoke(uint64_t a1, long long *a2)
{
  BOOL v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v5 = [WeakRetained player];
  uint64_t v6 = [v5 currentItem];
  unsigned int v7 = [v6 customVideoCompositor];
  id v8 = objc_loadWeakRetained(v3);
  int32_t v9 = [v8 player];
  [v9 rate];
  long long v10 = *a2;
  uint64_t v11 = *((void *)a2 + 2);
  objc_msgSend(v7, "signalScheduling:playerRate:", &v10);
}

- (void)setupPlaybackTimeChangedObserver
{
  BOOL v3 = [(JFXCompositionPlayer *)self player];

  if (v3)
  {
    id v4 = [(JFXCompositionPlayer *)self playerPlaybackTimePeriodicObserver];

    if (v4)
    {
      char v5 = [(JFXCompositionPlayer *)self player];
      uint64_t v6 = [(JFXCompositionPlayer *)self playerPlaybackTimePeriodicObserver];
      [v5 removeTimeObserver:v6];
    }
    id v7 = objc_initWeak(&location, self);
    id v8 = [(JFXCompositionPlayer *)self clipsDataSource];
    int v9 = [v8 frameRate];

    player = self->_player;
    [(JFXCompositionPlayer *)self playbackTimeChangedObserverInterval];
    uint64_t v11 = MEMORY[0x263EF83A0];
    id v12 = MEMORY[0x263EF83A0];
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    int v16 = __56__JFXCompositionPlayer_setupPlaybackTimeChangedObserver__block_invoke;
    id v17 = &unk_264C0C670;
    int v19 = v9;
    objc_copyWeak(&v18, &location);
    uint64_t v13 = [(AVPlayer *)player addPeriodicTimeObserverForInterval:v20 queue:v11 usingBlock:&v14];
    -[JFXCompositionPlayer setPlayerPlaybackTimePeriodicObserver:](self, "setPlayerPlaybackTimePeriodicObserver:", v13, v14, v15, v16, v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __56__JFXCompositionPlayer_setupPlaybackTimeChangedObserver__block_invoke(uint64_t a1, long long *a2)
{
  int32_t v3 = *(_DWORD *)(a1 + 40);
  long long v14 = *a2;
  uint64_t v15 = *((void *)a2 + 2);
  uint64_t v4 = FrameTimeFromCMTime(&v14, v3);
  char v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);
  id v7 = [WeakRetained pendingRequest];
  if ([v7 type] == 1) {
    goto LABEL_5;
  }
  id v8 = objc_loadWeakRetained(v5);
  char v9 = [v8 restoringPlayerStateAfterCompositionUpdate];

  if ((v9 & 1) == 0)
  {
    id v10 = objc_loadWeakRetained(v5);
    uint64_t v11 = [v10 playbackDelegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id WeakRetained = objc_loadWeakRetained(v5);
      id v7 = [WeakRetained playbackDelegate];
      id v13 = objc_loadWeakRetained(v5);
      [v7 playbackTimeDidChange:v13 currentTime:v4];

LABEL_5:
    }
  }
}

- (void)destroyPlayer
{
  int32_t v3 = [(JFXCompositionPlayer *)self player];
  uint64_t v4 = v3;
  if (v3) {
    [v3 currentTime];
  }
  else {
    memset(v25, 0, sizeof(v25));
  }
  char v5 = [(JFXCompositionPlayer *)self clipsDataSource];
  uint64_t v6 = FrameTimeFromCMTime(v25, [v5 frameRate]);

  id v7 = [(JFXCompositionPlayer *)self player];
  uint64_t v8 = [v7 timeControlStatus];

  if (v8 == 2)
  {
    char v9 = [(JFXCompositionPlayer *)self playbackDelegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      uint64_t v11 = [(JFXCompositionPlayer *)self playbackDelegate];
      [v11 playbackDidStop:self currentTime:v6];
    }
  }
  char v12 = [(JFXCompositionPlayer *)self player];

  if (v12)
  {
    id v13 = [(JFXCompositionPlayer *)self playbackDelegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      uint64_t v15 = [(JFXCompositionPlayer *)self playbackDelegate];
      [v15 playerWillBeDestroyed:self];
    }
    int v16 = [(JFXCompositionPlayer *)self player];
    [v16 removeObserver:self forKeyPath:@"timeControlStatus" context:&sJFXCompositionPlayerContext];

    id v17 = [(JFXCompositionPlayer *)self playerView];
    [v17 removeObserver:self forKeyPath:@"readyForDisplay" context:&sJFXCompositionPlayerContext];

    id v18 = [(JFXCompositionPlayer *)self player];
    [v18 removeObserver:self forKeyPath:@"status" context:&sJFXCompositionPlayerContext];

    int v19 = [(JFXCompositionPlayer *)self player];
    [v19 replaceCurrentItemWithPlayerItem:0];

    uint64_t v20 = [(JFXCompositionPlayer *)self player];
    uint64_t v21 = [(JFXCompositionPlayer *)self playerProVideoPeriodicObserver];
    [v20 removeTimeObserver:v21];

    [(JFXCompositionPlayer *)self setPlayerProVideoPeriodicObserver:0];
    uint64_t v22 = [(JFXCompositionPlayer *)self player];
    uint64_t v23 = [(JFXCompositionPlayer *)self playerPlaybackTimePeriodicObserver];
    [v22 removeTimeObserver:v23];

    [(JFXCompositionPlayer *)self setPlayerPlaybackTimePeriodicObserver:0];
    uint64_t v24 = [(JFXCompositionPlayer *)self playerView];
    [v24 setPlayer:0];
  }
  [(JFXCompositionPlayer *)self setPlayer:0];
}

- (void)warnTooManyLiveCompositors:(id)a3
{
  id v4 = a3;
  char v5 = JFXLog_playback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(JFXCompositionPlayer *)v4 warnTooManyLiveCompositors:v5];
  }
}

- (BOOL)JFX_clipDataSourceHasClip:(id)a3
{
  id v4 = a3;
  char v5 = [(JFXCompositionPlayer *)self clipsDataSource];
  uint64_t v6 = [v5 count];

  if (v6 < 1)
  {
    BOOL v9 = 0;
  }
  else
  {
    uint64_t v7 = [(JFXCompositionPlayer *)self clipsDataSource];
    uint64_t v8 = [(id)v7 playableElementAtIndex:0];

    LOBYTE(v7) = [v8 isEqual:v4];
    if (v7)
    {
      BOOL v9 = 1;
    }
    else
    {
      uint64_t v10 = 1;
      do
      {
        uint64_t v11 = v10;
        if (v6 == v10) {
          break;
        }
        char v12 = [(JFXCompositionPlayer *)self clipsDataSource];
        id v13 = [v12 playableElementAtIndex:v11];

        LODWORD(v12) = [v13 isEqual:v4];
        uint64_t v10 = v11 + 1;
      }
      while (!v12);
      BOOL v9 = v11 < v6;
    }
  }

  return v9;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (unsigned)parentCode
{
  return self->_parentCode;
}

- (void)setParentCode:(unsigned int)a3
{
  self->_parentCode = a3;
}

- (JFXCompositionPlayerDelegate)playbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackDelegate);
  return (JFXCompositionPlayerDelegate *)WeakRetained;
}

- (void)setPlaybackDelegate:(id)a3
{
}

- (JFXAVPlayerViewer)playerView
{
  return self->_playerView;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackTimeChangedObserverInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (void)setClipsDataSource:(id)a3
{
}

- (JFXComposition)composition
{
  return self->_composition;
}

- (void)setComposition:(id)a3
{
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (id)playerProVideoPeriodicObserver
{
  return self->_playerProVideoPeriodicObserver;
}

- (void)setPlayerProVideoPeriodicObserver:(id)a3
{
}

- (id)playerPlaybackTimePeriodicObserver
{
  return self->_playerPlaybackTimePeriodicObserver;
}

- (void)setPlayerPlaybackTimePeriodicObserver:(id)a3
{
}

- (JFXCompositionPlayerRequest)pendingRequest
{
  return self->_pendingRequest;
}

- (void)setPendingRequest:(id)a3
{
}

- (NSMutableArray)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)wasCurrentTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- (void)setWasCurrentTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_wasCurrentTime.epoch = a3->var3;
  *(_OWORD *)&self->_wasCurrentTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cachedCurrentTimeForCompositionUpdate
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[6];
  return self;
}

- (void)setCachedCurrentTimeForCompositionUpdate:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_cachedCurrentTimeForCompositionUpdate.epoch = a3->var3;
  *(_OWORD *)&self->_cachedCurrentTimeForCompositionUpdate.value = v3;
}

- (BOOL)wasAudioMuted
{
  return self->_wasAudioMuted;
}

- (void)setWasAudioMuted:(BOOL)a3
{
  self->_wasAudioMuted = a3;
}

- (BOOL)wasPlaying
{
  return self->_wasPlaying;
}

- (void)setWasPlaying:(BOOL)a3
{
  self->_wasPlaying = a3;
}

- (BOOL)restoringPlayerStateAfterCompositionUpdate
{
  return self->_restoringPlayerStateAfterCompositionUpdate;
}

- (void)setRestoringPlayerStateAfterCompositionUpdate:(BOOL)a3
{
  self->_restoringPlayerStateAfterCompositionUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_pendingRequest, 0);
  objc_storeStrong(&self->_playerPlaybackTimePeriodicObserver, 0);
  objc_storeStrong(&self->_playerProVideoPeriodicObserver, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_clipsDataSource, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_destroyWeak((id *)&self->_playbackDelegate);
  objc_storeStrong((id *)&self->_displayName, 0);
}

- (void)enqueueRequest:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "Request %{public}@ queued", (uint8_t *)&v2, 0xCu);
}

void __70__JFXCompositionPlayer_seek_cancelQueuedRequest_tolerance_completion___block_invoke_cold_1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)CMTime buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_234C41000, log, OS_LOG_TYPE_ERROR, "player %{public}@ seek request exception %{public}@", buf, 0x16u);
}

- (void)handleReadyForDisplay:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)warnTooManyLiveCompositors:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 object];
  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F617D0]];
  uint64_t v8 = [a1 object];
  BOOL v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F617D8]];
  uint64_t v10 = [a2 displayName];
  int v11 = 138412802;
  char v12 = v7;
  __int16 v13 = 2112;
  char v14 = v9;
  __int16 v15 = 2112;
  int v16 = v10;
  _os_log_debug_impl(&dword_234C41000, a3, OS_LOG_TYPE_DEBUG, "Warning! Too many compositors alive (%@)! Exceeded max of %@ player %@", (uint8_t *)&v11, 0x20u);
}

@end