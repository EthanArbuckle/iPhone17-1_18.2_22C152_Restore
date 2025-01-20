@interface MPCScriptedLooper
+ (BOOL)isScriptedLoopingDisabled;
+ (void)setScriptedLoopingDisabled:(BOOL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_CMTimeForFrame:(SEL)a3;
- (AVPlayer)player;
- (BOOL)isExecutingPauseScene;
- (BOOL)isSceneExecutionPaused;
- (MPCSceneCollection)sceneCollection;
- (MPCScriptedLooper)initWithAsset:(id)a3;
- (MPCScriptedLooper)initWithAsset:(id)a3 audioSession:(id)a4;
- (MPCScriptedLooper)initWithAsset:(id)a3 sceneCollection:(id)a4;
- (MPCScriptedLooper)initWithAsset:(id)a3 sceneCollection:(id)a4 audioSession:(id)a5;
- (MPCScriptedLooper)initWithURL:(id)a3 sceneCollection:(id)a4;
- (MPCScriptedLooper)initWithURL:(id)a3 sceneCollection:(id)a4 audioSession:(id)a5;
- (MPNotificationObserver)itemDidPlayToEndObserver;
- (NSError)error;
- (id)currentScene;
- (id)pauseFinishedBlock;
- (id)timeObserver;
- (int64_t)currentLoopCount;
- (int64_t)currentSceneIndex;
- (int64_t)frameForCMTime:(id *)a3;
- (int64_t)status;
- (void)_advanceScene;
- (void)_createSceneCollectionForAssetWithPreloadedKeys:(id)a3;
- (void)_executeCurrentScene;
- (void)_executeSceneCollection;
- (void)_loopIfNeeded;
- (void)_pause;
- (void)_sharedInitWithItem:(id)a3 audioSession:(id)a4;
- (void)_updateRateIfNeeded;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseScenes;
- (void)playScenes;
- (void)restartScenes;
- (void)seekToFrameIfNeeded:(int64_t)a3 completionHandler:(id)a4;
- (void)setCurrentLoopCount:(int64_t)a3;
- (void)setCurrentSceneIndex:(int64_t)a3;
- (void)setError:(id)a3;
- (void)setExecutingPauseScene:(BOOL)a3;
- (void)setItemDidPlayToEndObserver:(id)a3;
- (void)setPauseFinishedBlock:(id)a3;
- (void)setSceneCollection:(id)a3;
- (void)setSceneExecutionPaused:(BOOL)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTimeObserver:(id)a3;
@end

@implementation MPCScriptedLooper

+ (void)setScriptedLoopingDisabled:(BOOL)a3
{
  _MPCScriptedLooperScriptedLoopingDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemDidPlayToEndObserver, 0);
  objc_storeStrong(&self->_timeObserver, 0);
  objc_storeStrong((id *)&self->_sceneCollection, 0);
  objc_storeStrong(&self->_pauseFinishedBlock, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

- (void)setSceneExecutionPaused:(BOOL)a3
{
  self->_sceneExecutionPaused = a3;
}

- (BOOL)isSceneExecutionPaused
{
  return self->_sceneExecutionPaused;
}

- (void)setExecutingPauseScene:(BOOL)a3
{
  self->_executingPauseScene = a3;
}

- (BOOL)isExecutingPauseScene
{
  return self->_executingPauseScene;
}

- (void)setCurrentLoopCount:(int64_t)a3
{
  self->_currentLoopCount = a3;
}

- (int64_t)currentLoopCount
{
  return self->_currentLoopCount;
}

- (void)setCurrentSceneIndex:(int64_t)a3
{
  self->_currentSceneIndex = a3;
}

- (int64_t)currentSceneIndex
{
  return self->_currentSceneIndex;
}

- (void)setItemDidPlayToEndObserver:(id)a3
{
}

- (MPNotificationObserver)itemDidPlayToEndObserver
{
  return self->_itemDidPlayToEndObserver;
}

- (id)timeObserver
{
  return self->_timeObserver;
}

- (void)setSceneCollection:(id)a3
{
}

- (MPCSceneCollection)sceneCollection
{
  return self->_sceneCollection;
}

- (void)setPauseFinishedBlock:(id)a3
{
}

- (id)pauseFinishedBlock
{
  return self->_pauseFinishedBlock;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)_updateRateIfNeeded
{
  if ([(MPCScriptedLooper *)self isExecutingPauseScene]
    || [(MPCScriptedLooper *)self isSceneExecutionPaused])
  {
    id v3 = [(MPCScriptedLooper *)self player];
    [v3 pause];
  }
  else
  {
    id v3 = [(MPCScriptedLooper *)self player];
    [v3 play];
  }
}

- (void)_pause
{
  [(MPCScriptedLooper *)self setExecutingPauseScene:1];
  v4 = [(MPCScriptedLooper *)self player];
  uint64_t v5 = [v4 status];

  if (v5 == 1)
  {
    [(MPCScriptedLooper *)self _updateRateIfNeeded];
    v6 = [(MPCScriptedLooper *)self currentScene];
    uint64_t v7 = [v6 iterations];

    if (v7)
    {
      v8 = [(MPCScriptedLooper *)self sceneCollection];
      [v8 frameRate];
      double v10 = v9;

      if (v10 == 0.0)
      {
        v17 = [MEMORY[0x263F08690] currentHandler];
        [v17 handleFailureInMethod:a2 object:self file:@"MPCScriptedLooper.m" lineNumber:452 description:@"Scene collection frame rate cannot be 0."];
      }
      v11 = [(MPCScriptedLooper *)self currentScene];
      double v12 = (double)[v11 iterations];
      v13 = [(MPCScriptedLooper *)self sceneCollection];
      [v13 frameRate];
      double v15 = v12 / v14;

      dispatch_time_t v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
      id v18 = [(MPCScriptedLooper *)self pauseFinishedBlock];
      dispatch_after(v16, MEMORY[0x263EF83A0], v18);
    }
  }
}

- (void)_advanceScene
{
  unint64_t v3 = [(MPCScriptedLooper *)self currentSceneIndex] + 1;
  v4 = [(MPCSceneCollection *)self->_sceneCollection scenes];
  unint64_t v5 = [v4 count];

  if (v3 >= v5)
  {
    [(MPCScriptedLooper *)self restartScenes];
  }
  else
  {
    [(MPCScriptedLooper *)self setCurrentSceneIndex:v3];
    [(MPCScriptedLooper *)self _executeCurrentScene];
  }
}

- (void)_loopIfNeeded
{
  unint64_t v3 = [(MPCScriptedLooper *)self currentScene];
  uint64_t v4 = [v3 iterations];

  if (v4
    && (int64_t v5 = [(MPCScriptedLooper *)self currentLoopCount] + 1,
        [(MPCScriptedLooper *)self setCurrentLoopCount:v5],
        v5 >= v4))
  {
    [(MPCScriptedLooper *)self setTimeObserver:0];
    [(MPCScriptedLooper *)self setItemDidPlayToEndObserver:0];
    [(MPCScriptedLooper *)self _advanceScene];
  }
  else
  {
    id v6 = [(MPCScriptedLooper *)self currentScene];
    -[MPCScriptedLooper seekToFrameIfNeeded:completionHandler:](self, "seekToFrameIfNeeded:completionHandler:", [v6 startFrame], 0);
  }
}

- (void)_executeCurrentScene
{
  [(MPCScriptedLooper *)self setCurrentLoopCount:0];
  objc_initWeak(&location, self);
  unint64_t v3 = [(MPCScriptedLooper *)self currentScene];
  uint64_t v4 = [v3 startFrame];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__MPCScriptedLooper__executeCurrentScene__block_invoke;
  v5[3] = &unk_2643C0A20;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  [(MPCScriptedLooper *)self seekToFrameIfNeeded:v4 completionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __41__MPCScriptedLooper__executeCurrentScene__block_invoke(uint64_t a1)
{
  v30[1] = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [WeakRetained currentScene];
  uint64_t v5 = [v4 startFrame];
  id v6 = [WeakRetained currentScene];
  uint64_t v7 = [v6 endFrame];

  if (v5 == v7)
  {
    [WeakRetained _pause];
  }
  else
  {
    v8 = [WeakRetained currentScene];
    uint64_t v9 = [v8 endFrame];

    if (v9 == -1)
    {
      id v13 = objc_alloc(MEMORY[0x263F120F0]);
      double v14 = [*(id *)(a1 + 32) player];
      double v15 = [v14 currentItem];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __41__MPCScriptedLooper__executeCurrentScene__block_invoke_2;
      v28[3] = &unk_2643C09F8;
      objc_copyWeak(&v29, v2);
      dispatch_time_t v16 = (void *)[v13 initWithName:*MEMORY[0x263EFA050] object:v15 handler:v28];
      [WeakRetained setItemDidPlayToEndObserver:v16];

      objc_destroyWeak(&v29);
    }
    else
    {
      long long v26 = 0uLL;
      uint64_t v27 = 0;
      double v10 = *(void **)(a1 + 32);
      v11 = [v10 currentScene];
      uint64_t v12 = [v11 endFrame];
      if (v10)
      {
        [v10 _CMTimeForFrame:v12 + 1];
      }
      else
      {
        long long v26 = 0uLL;
        uint64_t v27 = 0;
      }

      v17 = [*(id *)(a1 + 32) player];
      long long v24 = v26;
      uint64_t v25 = v27;
      id v18 = [MEMORY[0x263F08D40] valueWithCMTime:&v24];
      v30[0] = v18;
      v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
      id v20 = MEMORY[0x263EF83A0];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __41__MPCScriptedLooper__executeCurrentScene__block_invoke_3;
      v22[3] = &unk_2643C5FF0;
      objc_copyWeak(&v23, v2);
      v21 = [v17 addBoundaryTimeObserverForTimes:v19 queue:MEMORY[0x263EF83A0] usingBlock:v22];
      [WeakRetained setTimeObserver:v21];

      objc_destroyWeak(&v23);
    }
  }
}

void __41__MPCScriptedLooper__executeCurrentScene__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _loopIfNeeded];
    id WeakRetained = v2;
  }
}

void __41__MPCScriptedLooper__executeCurrentScene__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _loopIfNeeded];
    id WeakRetained = v2;
  }
}

- (void)_executeSceneCollection
{
  uint64_t v3 = [(MPCScriptedLooper *)self sceneCollection];
  if (v3
    && (v4 = (void *)v3, int v5 = [(id)objc_opt_class() isScriptedLoopingDisabled], v4, !v5))
  {
    [(MPCScriptedLooper *)self _executeCurrentScene];
  }
  else
  {
    objc_initWeak(&location, self);
    id v6 = objc_alloc(MEMORY[0x263F120F0]);
    uint64_t v7 = [(MPCScriptedLooper *)self player];
    v8 = [v7 currentItem];
    uint64_t v9 = *MEMORY[0x263EFA050];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    id v13 = __44__MPCScriptedLooper__executeSceneCollection__block_invoke;
    double v14 = &unk_2643C09F8;
    objc_copyWeak(&v15, &location);
    double v10 = (void *)[v6 initWithName:v9 object:v8 handler:&v11];
    -[MPCScriptedLooper setItemDidPlayToEndObserver:](self, "setItemDidPlayToEndObserver:", v10, v11, v12, v13, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __44__MPCScriptedLooper__executeSceneCollection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained seekToFrameIfNeeded:0 completionHandler:0];
    id WeakRetained = v2;
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_CMTimeForFrame:(SEL)a3
{
  int64_t v5 = 1000 * a4;
  id v8 = [(MPCScriptedLooper *)self sceneCollection];
  [v8 frameRate];
  CMTimeMake((CMTime *)retstr, v5, (int)(v6 * 1000.0));

  return result;
}

- (void)_createSceneCollectionForAssetWithPreloadedKeys:(id)a3
{
  v45[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v37 = 0;
  uint64_t v5 = [v4 statusOfValueForKey:@"metadata" error:&v37];
  id v6 = v37;
  uint64_t v7 = v6;
  switch(v5)
  {
    case 0:
    case 1:
      id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Video");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v41 = self;
        __int16 v42 = 2048;
        uint64_t v43 = v5;
        _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "MPCScriptedLooper %p: metadataStatus was %ld.", buf, 0x16u);
      }

      break;
    case 2:
      break;
    case 3:
      id v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v44 = *MEMORY[0x263F08608];
      v45[0] = v6;
      dispatch_time_t v16 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
      v17 = [v15 errorWithDomain:@"MPCScriptedLooperErrorDomain" code:0 userInfo:v16];
      [(MPCScriptedLooper *)self setError:v17];

      id v18 = self;
      uint64_t v19 = 2;
      goto LABEL_15;
    case 4:
      id v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Video");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v41 = self;
        _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_INFO, "MPCScriptedLooper %p: Cancelled preloading metadata.", buf, 0xCu);
      }

      id v18 = self;
      uint64_t v19 = 3;
LABEL_15:
      [(MPCScriptedLooper *)v18 setStatus:v19];
      goto LABEL_32;
    default:
      goto LABEL_32;
  }
  id v36 = 0;
  uint64_t v9 = [v4 statusOfValueForKey:@"playable" error:&v36];
  id v10 = v36;
  uint64_t v11 = v10;
  switch(v9)
  {
    case 0:
    case 1:
      uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Video");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v41 = self;
        __int16 v42 = 2048;
        uint64_t v43 = v9;
        _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "MPCScriptedLooper %p: playableStatus was %ld.", buf, 0x16u);
      }

      goto LABEL_9;
    case 2:
LABEL_9:
      if ([v4 isPlayable])
      {
        id v13 = [v4 metadata];
        double v14 = +[MPCScriptedSceneCollectionParser sceneCollectionForMetadataItems:v13];

        [(MPCScriptedLooper *)self setSceneCollection:v14];
        [(MPCScriptedLooper *)self setStatus:1];
      }
      else
      {
        v21 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCScriptedLooperErrorDomain" code:2 userInfo:0];
        [(MPCScriptedLooper *)self setError:v21];

LABEL_18:
        uint64_t v25 = self;
        uint64_t v26 = 2;
LABEL_22:
        [(MPCScriptedLooper *)v25 setStatus:v26];
      }
LABEL_23:
      id v35 = 0;
      uint64_t v28 = [v4 statusOfValueForKey:@"duration" error:&v35];
      id v29 = v35;
      if (v28 == 4)
      {
        v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Video");
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 134217984;
        v41 = self;
        v31 = "MPCScriptedLooper %p: Cancelled preloading duration.";
        v32 = v30;
        os_log_type_t v33 = OS_LOG_TYPE_INFO;
        uint32_t v34 = 12;
        goto LABEL_29;
      }
      if (v28 != 3) {
        goto LABEL_31;
      }
      v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Video");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v41 = self;
        __int16 v42 = 2114;
        uint64_t v43 = (uint64_t)v29;
        v31 = "MPCScriptedLooper %p: Failed to preload duration. error=%{public}@";
        v32 = v30;
        os_log_type_t v33 = OS_LOG_TYPE_ERROR;
        uint32_t v34 = 22;
LABEL_29:
        _os_log_impl(&dword_21BB87000, v32, v33, v31, buf, v34);
      }
LABEL_30:

LABEL_31:
LABEL_32:
      [(MPCScriptedLooper *)self _executeSceneCollection];

      return;
    case 3:
      v22 = (void *)MEMORY[0x263F087E8];
      uint64_t v38 = *MEMORY[0x263F08608];
      id v39 = v10;
      id v23 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      long long v24 = [v22 errorWithDomain:@"MPCScriptedLooperErrorDomain" code:1 userInfo:v23];
      [(MPCScriptedLooper *)self setError:v24];

      goto LABEL_18;
    case 4:
      uint64_t v27 = os_log_create("com.apple.amp.mediaplaybackcore", "Video");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v41 = self;
        _os_log_impl(&dword_21BB87000, v27, OS_LOG_TYPE_INFO, "MPCScriptedLooper %p: Cancelled preloading playable.", buf, 0xCu);
      }

      uint64_t v25 = self;
      uint64_t v26 = 3;
      goto LABEL_22;
    default:
      goto LABEL_23;
  }
}

- (int64_t)frameForCMTime:(id *)a3
{
  CMTime v9 = *(CMTime *)a3;
  double Seconds = CMTimeGetSeconds(&v9);
  uint64_t v5 = [(MPCScriptedLooper *)self sceneCollection];
  [v5 frameRate];
  int64_t v7 = (uint64_t)(Seconds * v6);

  return v7;
}

- (void)seekToFrameIfNeeded:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a4;
  memset(&v45, 0, sizeof(v45));
  int64_t v7 = [(MPCScriptedLooper *)self player];
  id v8 = v7;
  if (v7) {
    [v7 currentTime];
  }
  else {
    memset(&v45, 0, sizeof(v45));
  }

  CMTime time1 = v45;
  int64_t v9 = [(MPCScriptedLooper *)self frameForCMTime:&time1];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__MPCScriptedLooper_seekToFrameIfNeeded_completionHandler___block_invoke;
  aBlock[3] = &unk_2643C54B8;
  id v34 = v6;
  id v44 = v34;
  id v10 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v11 = v10;
  if (v9 + 1 == a3) {
    v10[2](v10);
  }
  CMTimeValue value = *MEMORY[0x263F010E0];
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x263F010E0] + 8);
  uint64_t v12 = [(MPCScriptedLooper *)self sceneCollection];
  BOOL v13 = v12 == 0;

  CMTimeEpoch epoch = *(void *)(MEMORY[0x263F010E0] + 16);
  CMTimeEpoch v33 = epoch;
  if (v13)
  {
    CMTimeFlags flags = *(_DWORD *)(MEMORY[0x263F010E0] + 12);
    if (flags) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  [(MPCScriptedLooper *)self _CMTimeForFrame:a3];
  CMTimeValue value = time1.value;
  CMTimeFlags flags = time1.flags;
  CMTimeScale timescale = time1.timescale;
  CMTimeEpoch epoch = time1.epoch;
  if ((time1.flags & 1) == 0)
  {
LABEL_10:
    dispatch_time_t v16 = [MEMORY[0x263F087E8] errorWithDomain:@"MPCScriptedLooperErrorDomain" code:3 userInfo:0];
    [(MPCScriptedLooper *)self setError:v16];

    [(MPCScriptedLooper *)self setStatus:2];
    v11[2](v11);
  }
LABEL_11:
  CMTime time1 = v45;
  time2.CMTimeValue value = value;
  time2.CMTimeScale timescale = timescale;
  time2.CMTimeFlags flags = flags;
  time2.CMTimeEpoch epoch = epoch;
  if (!CMTimeCompare(&time1, &time2)) {
    v11[2](v11);
  }
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
  id v18 = (char *)os_signpost_id_generate(v17);

  CFAllocatorRef v19 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  time1.CMTimeValue value = value;
  time1.CMTimeScale timescale = timescale;
  time1.CMTimeFlags flags = flags;
  time1.CMTimeEpoch epoch = epoch;
  id v35 = (__CFString *)CMTimeCopyDescription(v19, &time1);
  CMTime time1 = v45;
  id v20 = (__CFString *)CMTimeCopyDescription(v19, &time1);
  v21 = [(MPCScriptedLooper *)self player];
  v22 = [v21 currentItem];
  id v23 = [v22 asset];
  long long v24 = [v23 URL];

  uint64_t v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Video");
  uint64_t v26 = v25;
  if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    int64_t v27 = [(MPCScriptedLooper *)self currentSceneIndex];
    int64_t v28 = [(MPCScriptedLooper *)self currentLoopCount];
    LODWORD(time1.value) = 138544642;
    *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v35;
    LOWORD(time1.flags) = 2114;
    *(void *)((char *)&time1.flags + 2) = v20;
    HIWORD(time1.epoch) = 2048;
    int64_t v47 = v27;
    __int16 v48 = 2048;
    int64_t v49 = v28;
    __int16 v50 = 2114;
    v51 = v24;
    __int16 v52 = 2048;
    v53 = v18;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v26, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v18, "SeekToTime", "seekToTime: %{public}@ currentTime: %{public}@ currentSceneIndex: %ld currentLoopCount: %ld URL: %{public}@ signpostID: %llu", (uint8_t *)&time1, 0x3Eu);
  }

  if (![(MPCScriptedLooper *)self isSceneExecutionPaused])
  {
    id v29 = [(MPCScriptedLooper *)self player];
    [v29 pause];
  }
  objc_initWeak(&location, self);
  v30 = [(MPCScriptedLooper *)self player];
  v31 = [v30 currentItem];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __59__MPCScriptedLooper_seekToFrameIfNeeded_completionHandler___block_invoke_68;
  v38[3] = &unk_2643C09D0;
  v40[1] = v18;
  objc_copyWeak(v40, &location);
  id v32 = v34;
  id v39 = v32;
  time1.CMTimeValue value = value;
  time1.CMTimeScale timescale = timescale;
  time1.CMTimeFlags flags = flags;
  time1.CMTimeEpoch epoch = epoch;
  *(_OWORD *)&time2.CMTimeValue value = *MEMORY[0x263F010E0];
  time2.CMTimeEpoch epoch = v33;
  long long v36 = *(_OWORD *)&time2.value;
  CMTimeEpoch v37 = v33;
  [v31 seekToTime:&time1 toleranceBefore:&time2 toleranceAfter:&v36 completionHandler:v38];

  objc_destroyWeak(v40);
  objc_destroyWeak(&location);
}

uint64_t __59__MPCScriptedLooper_seekToFrameIfNeeded_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __59__MPCScriptedLooper_seekToFrameIfNeeded_completionHandler___block_invoke_68(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Video");
  uint64_t v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SeekToTime", "finished: %{BOOL}d", (uint8_t *)v10, 8u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (([WeakRetained isSceneExecutionPaused] & 1) == 0)
  {
    id v8 = [WeakRetained player];
    [v8 play];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, a2);
  }
}

- (void)setTimeObserver:(id)a3
{
  id v5 = a3;
  id timeObserver = self->_timeObserver;
  if (timeObserver != v5)
  {
    id v8 = v5;
    if (timeObserver)
    {
      int64_t v7 = [(MPCScriptedLooper *)self player];
      [v7 removeTimeObserver:self->_timeObserver];
    }
    objc_storeStrong(&self->_timeObserver, a3);
    id v5 = v8;
  }
}

- (id)currentScene
{
  uint64_t v3 = [(MPCScriptedLooper *)self sceneCollection];
  id v4 = [v3 scenes];
  id v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", -[MPCScriptedLooper currentSceneIndex](self, "currentSceneIndex"));

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v32[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)MPCScriptedLooperPlayerStatusKVOContext == a6)
  {
    v22 = [(MPCScriptedLooper *)self player];
    uint64_t v23 = [v22 status];

    if (v23 == 1)
    {
      if ([(MPCScriptedLooper *)self isExecutingPauseScene]) {
        [(MPCScriptedLooper *)self _pause];
      }
    }
    else if (v23 == 2)
    {
      long long v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = *MEMORY[0x263F08608];
      uint64_t v25 = [(MPCScriptedLooper *)self player];
      uint64_t v26 = [v25 error];
      v32[0] = v26;
      int64_t v27 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
      int64_t v28 = [v24 errorWithDomain:@"MPCScriptedLooperErrorDomain" code:4 userInfo:v27];
      [(MPCScriptedLooper *)self setError:v28];

      goto LABEL_8;
    }
  }
  else if ((void *)MPCScriptedLooperItemStatusKVOContext == a6)
  {
    BOOL v13 = [(MPCScriptedLooper *)self player];
    double v14 = [v13 currentItem];
    uint64_t v15 = [v14 status];

    if (v15 == 2)
    {
      dispatch_time_t v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v29 = *MEMORY[0x263F08608];
      v17 = [(MPCScriptedLooper *)self player];
      id v18 = [v17 currentItem];
      CFAllocatorRef v19 = [v18 error];
      v30 = v19;
      id v20 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      v21 = [v16 errorWithDomain:@"MPCScriptedLooperErrorDomain" code:5 userInfo:v20];
      [(MPCScriptedLooper *)self setError:v21];

LABEL_8:
      [(MPCScriptedLooper *)self setStatus:2];
      [(MPCScriptedLooper *)self pauseScenes];
    }
  }
}

- (void)pauseScenes
{
  [(MPCScriptedLooper *)self setSceneExecutionPaused:1];

  [(MPCScriptedLooper *)self _updateRateIfNeeded];
}

- (void)playScenes
{
  [(MPCScriptedLooper *)self setSceneExecutionPaused:0];

  [(MPCScriptedLooper *)self _updateRateIfNeeded];
}

- (void)restartScenes
{
  [(MPCScriptedLooper *)self setCurrentSceneIndex:0];
  [(MPCScriptedLooper *)self setCurrentLoopCount:0];
  if ([(MPCScriptedLooper *)self isExecutingPauseScene])
  {
    [(MPCScriptedLooper *)self setExecutingPauseScene:0];
    uint64_t v3 = [(MPCScriptedLooper *)self pauseFinishedBlock];
    dispatch_block_cancel(v3);
  }

  [(MPCScriptedLooper *)self _executeSceneCollection];
}

- (void)dealloc
{
  uint64_t v3 = [(MPCScriptedLooper *)self player];
  [v3 removeObserver:self forKeyPath:@"status"];

  id v4 = [(MPCScriptedLooper *)self player];
  id v5 = [v4 currentItem];
  [v5 removeObserver:self forKeyPath:@"status"];

  os_signpost_id_t v6 = [(MPCScriptedLooper *)self player];
  int64_t v7 = [(MPCScriptedLooper *)self timeObserver];
  [v6 removeTimeObserver:v7];

  v8.receiver = self;
  v8.super_class = (Class)MPCScriptedLooper;
  [(MPCScriptedLooper *)&v8 dealloc];
}

- (void)_sharedInitWithItem:(id)a3 audioSession:(id)a4
{
  id v6 = a4;
  int64_t v7 = (void *)MEMORY[0x263EFA7F0];
  id v8 = a3;
  uint64_t v9 = [v7 playerWithPlayerItem:0];
  id v10 = v9;
  if (v6) {
    [(AVPlayer *)v9 setAudioSession:v6];
  }
  [(AVPlayer *)v10 replaceCurrentItemWithPlayerItem:v8];
  [(AVPlayer *)v10 setActionAtItemEnd:2];
  player = self->_player;
  self->_player = v10;
  id v12 = v10;

  self->_sceneExecutionPaused = 1;
  [(AVPlayer *)v12 addObserver:self forKeyPath:@"status" options:1 context:MPCScriptedLooperPlayerStatusKVOContext];
  [v8 addObserver:self forKeyPath:@"status" options:1 context:MPCScriptedLooperItemStatusKVOContext];

  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __54__MPCScriptedLooper__sharedInitWithItem_audioSession___block_invoke;
  v15[3] = &unk_2643C5FF0;
  objc_copyWeak(&v16, &location);
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v15);
  id pauseFinishedBlock = self->_pauseFinishedBlock;
  self->_id pauseFinishedBlock = v13;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __54__MPCScriptedLooper__sharedInitWithItem_audioSession___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setExecutingPauseScene:0];
  [WeakRetained _updateRateIfNeeded];
  [WeakRetained _advanceScene];
}

- (MPCScriptedLooper)initWithAsset:(id)a3 sceneCollection:(id)a4 audioSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MPCScriptedLooper;
  id v11 = [(MPCScriptedLooper *)&v15 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sceneCollection, a4);
    v12->_status = 1;
    dispatch_block_t v13 = [MEMORY[0x263EFA800] playerItemWithAsset:v8];
    [(MPCScriptedLooper *)v12 _sharedInitWithItem:v13 audioSession:v10];
    [(MPCScriptedLooper *)v12 _executeSceneCollection];
  }
  return v12;
}

- (MPCScriptedLooper)initWithAsset:(id)a3 sceneCollection:(id)a4
{
  return [(MPCScriptedLooper *)self initWithAsset:a3 sceneCollection:a4 audioSession:0];
}

- (MPCScriptedLooper)initWithURL:(id)a3 sceneCollection:(id)a4 audioSession:(id)a5
{
  id v8 = (void *)MEMORY[0x263EFA470];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 assetWithURL:a3];
  id v12 = [(MPCScriptedLooper *)self initWithAsset:v11 sceneCollection:v10 audioSession:v9];

  return v12;
}

- (MPCScriptedLooper)initWithURL:(id)a3 sceneCollection:(id)a4
{
  return [(MPCScriptedLooper *)self initWithURL:a3 sceneCollection:a4 audioSession:0];
}

- (MPCScriptedLooper)initWithAsset:(id)a3 audioSession:(id)a4
{
  v18[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MPCScriptedLooper;
  id v8 = [(MPCScriptedLooper *)&v17 init];
  if (v8)
  {
    id v9 = [MEMORY[0x263EFA800] playerItemWithAsset:v6];
    [(MPCScriptedLooper *)v8 _sharedInitWithItem:v9 audioSession:v7];
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__8339;
    void v15[4] = __Block_byref_object_dispose__8340;
    id v16 = v8;
    v18[0] = @"metadata";
    v18[1] = @"duration";
    v18[2] = @"playable";
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __48__MPCScriptedLooper_initWithAsset_audioSession___block_invoke;
    v12[3] = &unk_2643C67A0;
    double v14 = v15;
    id v13 = v6;
    [v13 loadValuesAsynchronouslyForKeys:v10 completionHandler:v12];

    _Block_object_dispose(v15, 8);
  }

  return v8;
}

void __48__MPCScriptedLooper_initWithAsset_audioSession___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__MPCScriptedLooper_initWithAsset_audioSession___block_invoke_2;
  block[3] = &unk_2643C67A0;
  long long v2 = *(_OWORD *)(a1 + 32);
  id v1 = (id)v2;
  long long v4 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __48__MPCScriptedLooper_initWithAsset_audioSession___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40)) {
    return [*(id *)(*(void *)(*(void *)(result + 40) + 8) + 40) _createSceneCollectionForAssetWithPreloadedKeys:*(void *)(result + 32)];
  }
  return result;
}

- (MPCScriptedLooper)initWithAsset:(id)a3
{
  return [(MPCScriptedLooper *)self initWithAsset:a3 audioSession:0];
}

+ (BOOL)isScriptedLoopingDisabled
{
  return _MPCScriptedLooperScriptedLoopingDisabled;
}

@end