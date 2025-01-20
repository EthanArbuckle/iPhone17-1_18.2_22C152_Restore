@interface CLKVideoPlayerView
+ (void)_prewarm;
- (AVQueuePlayer)player;
- (BOOL)_readyToPerformRequest;
- (BOOL)isPlaybackReady;
- (BOOL)pausedViewEnabled;
- (BOOL)playing;
- (CLKVideoPlayerView)initWithFrame:(CGRect)a3;
- (CLKVideoPlayerViewDelegate)delegate;
- (id)_createPlayerItemForVideoURL:(id)a3;
- (int64_t)gravityResize;
- (void)_handleDidPlayToEndTime:(id)a3;
- (void)_hidePausedView;
- (void)_loadVideo:(id)a3;
- (void)_observePlayerItem:(id)a3;
- (void)_pause;
- (void)_performNextRequest;
- (void)_periodicTimeObserverChanged:(id *)a3;
- (void)_play;
- (void)_preroll;
- (void)_queueVideo:(id)a3;
- (void)_seekToTime:(id *)a3;
- (void)_showPausedView;
- (void)_stopObservingPlayerItem;
- (void)dealloc;
- (void)expectPreroll;
- (void)layoutSubviews;
- (void)loadVideo:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)play;
- (void)prepareNextQueuedVideo;
- (void)preroll;
- (void)queueVideo:(id)a3;
- (void)resetRequestState;
- (void)seekToTime:(id *)a3;
- (void)seekToTime:(id *)a3 tolerance:(id *)a4;
- (void)setDelegate:(id)a3;
- (void)setGravityResize:(int64_t)a3;
- (void)setPausedViewEnabled:(BOOL)a3;
@end

@implementation CLKVideoPlayerView

- (CLKVideoPlayerView)initWithFrame:(CGRect)a3
{
  v30.receiver = self;
  v30.super_class = (Class)CLKVideoPlayerView;
  v3 = -[CLKVideoPlayerView initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!v3) {
    return (CLKVideoPlayerView *)v3;
  }
  v4 = [getAVAudioSessionClass() sharedInstance];
  [v4 setRequiresNoAudioResources:1 error:0];

  v5 = [getAVAudioSessionClass() sharedInstance];
  v6 = getAVAudioSessionCategoryAmbient();
  [v5 setCategory:v6 withOptions:1 error:0];

  v3[545] = 1;
  *((void *)v3 + 70) = 1;
  v7 = [_CLKPlayerView alloc];
  uint64_t v8 = -[_CLKPlayerView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v9 = (void *)*((void *)v3 + 51);
  *((void *)v3 + 51) = v8;

  [v3 addSubview:*((void *)v3 + 51)];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2050000000;
  v10 = (void *)getAVQueuePlayerClass_softClass;
  uint64_t v38 = getAVQueuePlayerClass_softClass;
  if (!getAVQueuePlayerClass_softClass)
  {
    *(void *)&long long v31 = MEMORY[0x263EF8330];
    *((void *)&v31 + 1) = 3221225472;
    v32 = __getAVQueuePlayerClass_block_invoke;
    v33 = &unk_26440E380;
    v34 = &v35;
    __getAVQueuePlayerClass_block_invoke((uint64_t)&v31);
    v10 = (void *)v36[3];
  }
  v11 = v10;
  _Block_object_dispose(&v35, 8);
  id v12 = objc_alloc_init(v11);
  v13 = (void *)*((void *)v3 + 52);
  *((void *)v3 + 52) = v12;

  [*((id *)v3 + 52) _setCALayerDestinationIsTVOut:1];
  v14 = [*((id *)v3 + 51) layer];
  [v14 setPlayer:*((void *)v3 + 52)];

  [v3 setGravityResize:*((void *)v3 + 70)];
  v15 = [*((id *)v3 + 51) layer];
  [v15 addObserver:v3 forKeyPath:@"readyForDisplay" options:0 context:&kCLKVideoPlayerLayerKVOContext];

  objc_initWeak(&location, v3);
  _CMTimeMakeWithSeconds(0xFFFFFFFFLL, 0.0);
  long long v16 = v31;
  *((void *)v3 + 61) = v32;
  *(_OWORD *)(v3 + 472) = v16;
  v17 = (void *)*((void *)v3 + 52);
  _CMTimeMakeWithSeconds(60, 10.0);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __36__CLKVideoPlayerView_initWithFrame___block_invoke;
  v26[3] = &unk_26440F010;
  objc_copyWeak(&v27, &location);
  uint64_t v18 = [v17 addPeriodicTimeObserverForInterval:v28 queue:0 usingBlock:v26];
  v19 = (void *)*((void *)v3 + 58);
  *((void *)v3 + 58) = v18;

  v20 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  v21 = (id *)getAVPlayerItemDidPlayToEndTimeNotificationSymbolLoc_ptr;
  uint64_t v38 = getAVPlayerItemDidPlayToEndTimeNotificationSymbolLoc_ptr;
  if (!getAVPlayerItemDidPlayToEndTimeNotificationSymbolLoc_ptr)
  {
    *(void *)&long long v31 = MEMORY[0x263EF8330];
    *((void *)&v31 + 1) = 3221225472;
    v32 = __getAVPlayerItemDidPlayToEndTimeNotificationSymbolLoc_block_invoke;
    v33 = &unk_26440E380;
    v34 = &v35;
    v22 = (void *)AVFoundationLibrary();
    v23 = dlsym(v22, "AVPlayerItemDidPlayToEndTimeNotification");
    *(void *)(v34[1] + 24) = v23;
    getAVPlayerItemDidPlayToEndTimeNotificationSymbolLoc_ptr = *(void *)(v34[1] + 24);
    v21 = (id *)v36[3];
  }
  _Block_object_dispose(&v35, 8);
  if (v21)
  {
    id v24 = *v21;
    [v20 addObserver:v3 selector:sel__handleDidPlayToEndTime_ name:v24 object:0];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    return (CLKVideoPlayerView *)v3;
  }
  dlerror();
  result = (CLKVideoPlayerView *)abort_report_np();
  __break(1u);
  return result;
}

void __36__CLKVideoPlayerView_initWithFrame___block_invoke(uint64_t a1, long long *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v4 = *a2;
  uint64_t v5 = *((void *)a2 + 2);
  [WeakRetained _periodicTimeObserverChanged:&v4];
}

- (void)dealloc
{
  [(AVQueuePlayer *)self->_player removeTimeObserver:self->_periodicTimeObserver];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(CLKVideoPlayerView *)self _stopObservingPlayerItem];
  long long v4 = [(_CLKPlayerView *)self->_playerView layer];
  [v4 removeObserver:self forKeyPath:@"readyForDisplay" context:&kCLKVideoPlayerLayerKVOContext];

  v5.receiver = self;
  v5.super_class = (Class)CLKVideoPlayerView;
  [(CLKVideoPlayerView *)&v5 dealloc];
}

+ (void)_prewarm
{
  id v2 = (id)[getAVAudioSessionClass() sharedInstance];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CLKVideoPlayerView;
  [(CLKVideoPlayerView *)&v3 layoutSubviews];
  [(CLKVideoPlayerView *)self bounds];
  -[_CLKPlayerView setFrame:](self->_playerView, "setFrame:");
  if (self->_pausedViewEnabled)
  {
    [(CLKVideoPlayerView *)self bounds];
    -[UIView setFrame:](self->_pausedView, "setFrame:");
  }
}

- (AVQueuePlayer)player
{
  return self->_player;
}

- (void)setGravityResize:(int64_t)a3
{
  self->_gravityResize = a3;
  if (a3 == 1) {
    goto LABEL_7;
  }
  if (a3)
  {
    id v7 = 0;
    goto LABEL_12;
  }
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  long long v4 = (id *)getAVLayerVideoGravityResizeAspectSymbolLoc_ptr;
  uint64_t v13 = getAVLayerVideoGravityResizeAspectSymbolLoc_ptr;
  if (!getAVLayerVideoGravityResizeAspectSymbolLoc_ptr)
  {
    objc_super v5 = (void *)AVFoundationLibrary();
    v11[3] = (uint64_t)dlsym(v5, "AVLayerVideoGravityResizeAspect");
    getAVLayerVideoGravityResizeAspectSymbolLoc_ptr = v11[3];
    long long v4 = (id *)v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v4)
  {
    __101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
LABEL_7:
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2020000000;
    long long v4 = (id *)getAVLayerVideoGravityResizeAspectFillSymbolLoc_ptr;
    uint64_t v13 = getAVLayerVideoGravityResizeAspectFillSymbolLoc_ptr;
    if (!getAVLayerVideoGravityResizeAspectFillSymbolLoc_ptr)
    {
      v6 = (void *)AVFoundationLibrary();
      v11[3] = (uint64_t)dlsym(v6, "AVLayerVideoGravityResizeAspectFill");
      getAVLayerVideoGravityResizeAspectFillSymbolLoc_ptr = v11[3];
      long long v4 = (id *)v11[3];
    }
    _Block_object_dispose(&v10, 8);
    if (!v4)
    {
      v9 = (_Unwind_Exception *)__101__CLKComplicationTemplateGraphicRectangularLargeImage__enumerateFullColorImageProviderKeysWithBlock___block_invoke_2_cold_1();
      _Block_object_dispose(&v10, 8);
      _Unwind_Resume(v9);
    }
  }
  id v7 = *v4;
LABEL_12:
  uint64_t v8 = [(_CLKPlayerView *)self->_playerView layer];
  [v8 setVideoGravity:v7];
}

- (void)_observePlayerItem:(id)a3
{
  p_observedItem = &self->_observedItem;
  objc_storeStrong((id *)&self->_observedItem, a3);
  id v6 = a3;
  [(AVPlayerItem *)*p_observedItem addObserver:self forKeyPath:@"status" options:0 context:&kCLKVideoPlayerViewKVOContext];
}

- (void)_stopObservingPlayerItem
{
  [(AVPlayerItem *)self->_observedItem removeObserver:self forKeyPath:@"status" context:&kCLKVideoPlayerViewKVOContext];
  observedItem = self->_observedItem;
  self->_observedItem = 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  v11 = (AVPlayerItem *)a4;
  id v12 = a5;
  if (a6 == &kCLKVideoPlayerViewKVOContext)
  {
    if (self->_observedItem == v11)
    {
      if ([v10 isEqualToString:@"status"])
      {
        if ([(AVPlayerItem *)self->_playerItem status] == AVPlayerItemStatusReadyToPlay)
        {
          [(CLKVideoPlayerView *)self _stopObservingPlayerItem];
          [(CLKVideoPlayerView *)self _performNextRequest];
          uint64_t v13 = [(CLKVideoPlayerView *)self delegate];
          char v14 = objc_opt_respondsToSelector();

          if (v14)
          {
            v15 = [(CLKVideoPlayerView *)self delegate];
            [v15 videoPlayerViewWillBeginPlaying:self];
          }
        }
      }
    }
  }
  else if (a6 == &kCLKVideoPlayerLayerKVOContext)
  {
    if ([v10 isEqualToString:@"readyForDisplay"])
    {
      long long v16 = [(_CLKPlayerView *)self->_playerView layer];
      int v17 = [v16 isReadyForDisplay];

      if (v17) {
        [(CLKVideoPlayerView *)self _performNextRequest];
      }
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)CLKVideoPlayerView;
    [(CLKVideoPlayerView *)&v18 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_handleDidPlayToEndTime:(id)a3
{
  id v4 = a3;
  if ([(AVQueuePlayer *)self->_player actionAtItemEnd] == 1)
  {
    objc_super v5 = [v4 object];
    playerItem = self->_playerItem;

    if (v5 == playerItem)
    {
      [(CLKVideoPlayerView *)self _pause];
      id v12 = block;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      uint64_t v13 = __46__CLKVideoPlayerView__handleDidPlayToEndTime___block_invoke;
LABEL_10:
      v12[2] = v13;
      v12[3] = &unk_26440E580;
      v12[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], v12);
      goto LABEL_11;
    }
  }
  if (![(AVQueuePlayer *)self->_player actionAtItemEnd])
  {
    id v7 = [v4 object];
    p_playerItem = &self->_playerItem;
    v9 = self->_playerItem;

    if (v7 == v9)
    {
      queuedItem = self->_queuedItem;
      if (queuedItem)
      {
        objc_storeStrong((id *)&self->_playerItem, queuedItem);
        v11 = self->_queuedItem;
        self->_queuedItem = 0;

        if ([(AVPlayerItem *)*p_playerItem status] != AVPlayerItemStatusReadyToPlay) {
          [(CLKVideoPlayerView *)self _observePlayerItem:*p_playerItem];
        }
        id v12 = v16;
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        uint64_t v13 = __46__CLKVideoPlayerView__handleDidPlayToEndTime___block_invoke_2;
      }
      else
      {
        char v14 = CLKLoggingObjectForDomain(0);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[CLKVideoPlayerView _handleDidPlayToEndTime:](v14);
        }

        id v12 = v15;
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        uint64_t v13 = __46__CLKVideoPlayerView__handleDidPlayToEndTime___block_invoke_18;
      }
      goto LABEL_10;
    }
  }
LABEL_11:
}

void __46__CLKVideoPlayerView__handleDidPlayToEndTime___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 videoPlayerViewDidPauseAfterPlayingVideoToEnd:*(void *)(a1 + 32)];
}

void __46__CLKVideoPlayerView__handleDidPlayToEndTime___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 videoPlayerViewDidBeginPlayingQueuedVideo:*(void *)(a1 + 32)];
}

void __46__CLKVideoPlayerView__handleDidPlayToEndTime___block_invoke_18(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 videoPlayerViewDidPauseAfterPlayingVideoToEnd:*(void *)(a1 + 32)];
}

- (void)_periodicTimeObserverChanged:(id *)a3
{
  p_willBeginPlayingTime = &self->_willBeginPlayingTime;
  if (self->_willBeginPlayingTime.timescale >= 1)
  {
    __n128 v8 = *(__n128 *)&a3->var0;
    int64_t var3 = a3->var3;
    __n128 v6 = *(__n128 *)&p_willBeginPlayingTime->value;
    int64_t epoch = self->_willBeginPlayingTime.epoch;
    if (_CMTimeCompare((long long *)&v8, (long long *)&v6))
    {
      if (self->_pausedViewEnabled) {
        [(CLKVideoPlayerView *)self _hidePausedView];
      }
      getkCMTimePositiveInfinity(&v8);
      *(__n128 *)&p_willBeginPlayingTime->value = v8;
      p_willBeginPlayingTime->int64_t epoch = var3;
      kdebug_trace();
      id v5 = [(CLKVideoPlayerView *)self delegate];
      [v5 videoPlayerViewDidBeginPlaying:self];
    }
  }
}

- (BOOL)_readyToPerformRequest
{
  if ([(AVPlayerItem *)self->_playerItem status] != AVPlayerItemStatusReadyToPlay) {
    return 0;
  }
  objc_super v3 = [(_CLKPlayerView *)self->_playerView layer];
  if ([v3 isReadyForDisplay]) {
    BOOL v4 = self->_servicingRequest == 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_performNextRequest
{
  if ([(CLKVideoPlayerView *)self _readyToPerformRequest])
  {
    seekRequested = self->_seekRequested;
    if (seekRequested)
    {
      [(NSValue *)seekRequested CMTimeValue];
      [(CLKVideoPlayerView *)self _seekToTime:v5];
    }
    else if ((*((unsigned char *)self + 544) & 2) != 0)
    {
      [(CLKVideoPlayerView *)self _preroll];
    }
    else if (*((unsigned char *)self + 544))
    {
      [(CLKVideoPlayerView *)self _play];
    }
  }
  else
  {
    playerItem = self->_playerItem;
    [(AVPlayerItem *)playerItem status];
  }
}

- (void)_showPausedView
{
  if (!self->_pausedView)
  {
    objc_super v3 = [(_CLKPlayerView *)self->_playerView snapshotViewAfterScreenUpdates:0];
    pausedView = self->_pausedView;
    self->_pausedView = v3;

    id v5 = self->_pausedView;
    [(CLKVideoPlayerView *)self addSubview:v5];
  }
}

- (void)_hidePausedView
{
  [(UIView *)self->_pausedView removeFromSuperview];
  pausedView = self->_pausedView;
  self->_pausedView = 0;
}

- (void)setPausedViewEnabled:(BOOL)a3
{
  self->_pausedViewEnabled = a3;
  if (!a3) {
    [(CLKVideoPlayerView *)self _hidePausedView];
  }
}

- (BOOL)isPlaybackReady
{
  objc_super v3 = [(AVQueuePlayer *)self->_player currentItem];
  if (v3 == self->_playerItem)
  {
    id v5 = [(AVQueuePlayer *)self->_player currentItem];
    BOOL v4 = [v5 status] == 1
      && [(AVQueuePlayer *)self->_player status] == 1
      && (*((unsigned char *)self + 544) & 4) == 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)resetRequestState
{
  self->_servicingRequest = 0;
  *((unsigned char *)self + 544) &= ~1u;
  seekRequested = self->_seekRequested;
  self->_seekRequested = 0;

  *((unsigned char *)self + 544) &= ~2u;
  *((unsigned char *)self + 544) &= ~4u;
}

- (void)loadVideo:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v4 = [a3 url];
  id v5 = CLKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_21C599000, v5, OS_LOG_TYPE_DEFAULT, "CLKVideoPlayerView loadVideo [video url]:%@", (uint8_t *)&v6, 0xCu);
  }

  [(CLKVideoPlayerView *)self _loadVideo:v4];
}

- (void)queueVideo:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  objc_super v3 = [a3 url];
  BOOL v4 = CLKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_21C599000, v4, OS_LOG_TYPE_DEFAULT, "CLKVideoPlayerView queueVideo [video url] :%@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)prepareNextQueuedVideo
{
  queuedItem = self->_queuedItem;
  if (queuedItem)
  {
    p_playerItem = (id *)&self->_playerItem;
    objc_storeStrong((id *)&self->_playerItem, queuedItem);
    int v5 = self->_queuedItem;
    self->_queuedItem = 0;

    if ([*p_playerItem status] != 1)
    {
      id v6 = *p_playerItem;
      [(CLKVideoPlayerView *)self _observePlayerItem:v6];
    }
  }
}

- (void)pause
{
  if (self->_playing) {
    [(CLKVideoPlayerView *)self _pause];
  }
}

- (void)play
{
  if (!self->_playing)
  {
    kdebug_trace();
    self->_playing = 1;
    if ([(CLKVideoPlayerView *)self _readyToPerformRequest])
    {
      [(CLKVideoPlayerView *)self _play];
    }
    else
    {
      *((unsigned char *)self + 544) |= 1u;
    }
  }
}

- (void)seekToTime:(id *)a3
{
  getkCMTimePositiveInfinity(&v6);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [(CLKVideoPlayerView *)self seekToTime:&v5 tolerance:&v6];
}

- (void)seekToTime:(id *)a3 tolerance:(id *)a4
{
  kdebug_trace();
  int64_t var3 = a4->var3;
  *(_OWORD *)&self->_seekWithTolerance.value = *(_OWORD *)&a4->var0;
  self->_seekWithTolerance.int64_t epoch = var3;
  if ([(CLKVideoPlayerView *)self _readyToPerformRequest])
  {
    long long v10 = *(_OWORD *)&a3->var0;
    int64_t v11 = a3->var3;
    [(CLKVideoPlayerView *)self _seekToTime:&v10];
  }
  else
  {
    long long v10 = *(_OWORD *)&a3->var0;
    int64_t v11 = a3->var3;
    uint64_t v8 = [MEMORY[0x263F08D40] valueWithCMTime:&v10];
    seekRequested = self->_seekRequested;
    self->_seekRequested = v8;
  }
}

- (void)expectPreroll
{
  *((unsigned char *)self + 544) |= 4u;
}

- (void)preroll
{
  *((unsigned char *)self + 544) &= ~4u;
  kdebug_trace();
  if ([(CLKVideoPlayerView *)self _readyToPerformRequest])
  {
    [(CLKVideoPlayerView *)self _preroll];
  }
  else
  {
    *((unsigned char *)self + 544) |= 2u;
  }
}

- (id)_createPlayerItemForVideoURL:(id)a3
{
  id v5 = a3;
  if (([(NSURL *)self->_assetURL isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_assetURL, a3);
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2050000000;
    __n128 v6 = (void *)getAVURLAssetClass_softClass;
    uint64_t v22 = getAVURLAssetClass_softClass;
    if (!getAVURLAssetClass_softClass)
    {
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      long long v16 = __getAVURLAssetClass_block_invoke;
      int v17 = &unk_26440E380;
      objc_super v18 = &v19;
      __getAVURLAssetClass_block_invoke((uint64_t)&v14);
      __n128 v6 = (void *)v20[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v19, 8);
    uint64_t v8 = [v7 URLAssetWithURL:v5 options:0];
    asset = self->_asset;
    self->_asset = v8;
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  long long v10 = (void *)getAVPlayerItemClass_softClass;
  uint64_t v22 = getAVPlayerItemClass_softClass;
  if (!getAVPlayerItemClass_softClass)
  {
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    long long v16 = __getAVPlayerItemClass_block_invoke;
    int v17 = &unk_26440E380;
    objc_super v18 = &v19;
    __getAVPlayerItemClass_block_invoke((uint64_t)&v14);
    long long v10 = (void *)v20[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v19, 8);
  id v12 = [v11 playerItemWithAsset:self->_asset];

  return v12;
}

- (void)_preroll
{
  objc_super v3 = [getAVAudioSessionClass() sharedInstance];
  [v3 setRequiresNoAudioResources:1 error:0];

  BOOL v4 = [getAVAudioSessionClass() sharedInstance];
  id v5 = getAVAudioSessionCategoryAmbient();
  [v4 setCategory:v5 withOptions:1 error:0];

  self->_servicingRequest = 2;
  kdebug_trace();
  player = self->_player;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__CLKVideoPlayerView__preroll__block_invoke;
  v7[3] = &unk_26440F040;
  v7[4] = self;
  [(AVQueuePlayer *)player prerollAtRate:v7 completionHandler:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0))];
}

uint64_t __30__CLKVideoPlayerView__preroll__block_invoke(uint64_t a1, uint64_t a2)
{
  kdebug_trace();
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 552));
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 552));
    [v6 videoPlayerView:*(void *)(a1 + 32) didFinishPrerolling:a2];
  }
  *(void *)(*(void *)(a1 + 32) + 504) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 544) &= ~2u;
  id v7 = *(void **)(a1 + 32);

  return [v7 _performNextRequest];
}

- (void)_play
{
  objc_super v3 = [getAVAudioSessionClass() sharedInstance];
  [v3 setRequiresNoAudioResources:1 error:0];

  BOOL v4 = [getAVAudioSessionClass() sharedInstance];
  char v5 = getAVAudioSessionCategoryAmbient();
  [v4 setCategory:v5 withOptions:1 error:0];

  kdebug_trace();
  player = self->_player;
  if (player)
  {
    [(AVQueuePlayer *)player currentTime];
  }
  else
  {
    long long v7 = 0uLL;
    int64_t v8 = 0;
  }
  *(_OWORD *)&self->_willBeginPlayingTime.value = v7;
  self->_willBeginPlayingTime.int64_t epoch = v8;
  [(AVQueuePlayer *)self->_player play];
  *((unsigned char *)self + 544) &= ~1u;
  [(CLKVideoPlayerView *)self _performNextRequest];
}

- (void)_pause
{
  self->_playing = 0;
  *((unsigned char *)self + 544) &= ~1u;
  p_willBeginPlayingTime = &self->_willBeginPlayingTime;
  _CMTimeMakeWithSeconds(0xFFFFFFFFLL, 0.0);
  $95D729B680665BEAEFA1D6FCA8238556 *p_willBeginPlayingTime = v4;
  [(AVQueuePlayer *)self->_player pause];
  if (self->_pausedViewEnabled) {
    [(CLKVideoPlayerView *)self _showPausedView];
  }
}

- (void)_seekToTime:(id *)a3
{
  char v5 = [getAVAudioSessionClass() sharedInstance];
  [v5 setRequiresNoAudioResources:1 error:0];

  id v6 = [getAVAudioSessionClass() sharedInstance];
  long long v7 = getAVAudioSessionCategoryAmbient();
  [v6 setCategory:v7 withOptions:1 error:0];

  self->_servicingRequest = 1;
  kdebug_trace();
  player = self->_player;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __34__CLKVideoPlayerView__seekToTime___block_invoke;
  v12[3] = &unk_26440F068;
  v12[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a3;
  $95D729B680665BEAEFA1D6FCA8238556 seekWithTolerance = self->_seekWithTolerance;
  $95D729B680665BEAEFA1D6FCA8238556 v9 = self->_seekWithTolerance;
  [(AVQueuePlayer *)player seekToTime:&v11 toleranceBefore:&seekWithTolerance toleranceAfter:&v9 completionHandler:v12];
}

uint64_t __34__CLKVideoPlayerView__seekToTime___block_invoke(uint64_t a1)
{
  kdebug_trace();
  *(void *)(*(void *)(a1 + 32) + 504) = 0;
  id v2 = *(void **)(*(void *)(a1 + 32) + 512);
  if (v2)
  {
    [v2 CMTimeValue];
  }
  else
  {
    long long v8 = 0uLL;
    uint64_t v9 = 0;
  }
  long long v6 = *(_OWORD *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 56);
  if (!_CMTimeCompare(&v6, &v8))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    $95D729B680665BEAEFA1D6FCA8238556 v4 = *(void **)(v3 + 512);
    *(void *)(v3 + 512) = 0;
  }
  return [*(id *)(a1 + 32) _performNextRequest];
}

- (void)_loadVideo:(id)a3
{
  id v4 = a3;
  [(CLKVideoPlayerView *)self resetRequestState];
  [(CLKVideoPlayerView *)self _stopObservingPlayerItem];
  [(CLKVideoPlayerView *)self _pause];
  [(AVQueuePlayer *)self->_player removeAllItems];
  playerItem = self->_playerItem;
  self->_playerItem = 0;

  queuedItem = self->_queuedItem;
  self->_queuedItem = 0;

  if (v4)
  {
    uint64_t v7 = [getAVAudioSessionClass() sharedInstance];
    [v7 setRequiresNoAudioResources:1 error:0];

    long long v8 = [getAVAudioSessionClass() sharedInstance];
    uint64_t v9 = getAVAudioSessionCategoryAmbient();
    [v8 setCategory:v9 withOptions:1 error:0];

    long long v10 = [(CLKVideoPlayerView *)self _createPlayerItemForVideoURL:v4];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = self->_playerItem;
    self->_playerItem = v10;

    id v12 = self->_playerItem;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = CLKLoggingObjectForDomain(0);
    uint64_t v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v21 = 0;
        _os_log_impl(&dword_21C599000, v14, OS_LOG_TYPE_DEFAULT, "CLKVideoPlayerView loadVideo [success]", v21, 2u);
      }

      [(CLKVideoPlayerView *)self _observePlayerItem:self->_playerItem];
      [(AVQueuePlayer *)self->_player insertItem:self->_playerItem afterItem:0];
      [(AVQueuePlayer *)self->_player setActionAtItemEnd:1];
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CLKVideoPlayerView _loadVideo:]((uint64_t)v4, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }
}

- (void)_queueVideo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_playerItem)
    {
      if (self->_queuedItem)
      {
        char v5 = CLKLoggingObjectForDomain(0);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          -[CLKVideoPlayerView _queueVideo:]((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
        }
      }
      else
      {
        id v12 = [getAVAudioSessionClass() sharedInstance];
        [v12 setRequiresNoAudioResources:1 error:0];

        $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = [getAVAudioSessionClass() sharedInstance];
        uint64_t v14 = getAVAudioSessionCategoryAmbient();
        [v13 setCategory:v14 withOptions:1 error:0];

        kdebug_trace();
        uint64_t v15 = [(CLKVideoPlayerView *)self _createPlayerItemForVideoURL:v4];
        queuedItem = self->_queuedItem;
        self->_queuedItem = v15;

        uint64_t v17 = self->_queuedItem;
        uint64_t v18 = CLKLoggingObjectForDomain(0);
        uint64_t v19 = v18;
        if (v17)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v26 = 0;
            _os_log_impl(&dword_21C599000, v19, OS_LOG_TYPE_DEFAULT, "CLKVideoPlayerView _createPlayerItemForVideoURL [success]", v26, 2u);
          }

          [(AVQueuePlayer *)self->_player insertItem:self->_queuedItem afterItem:0];
          [(AVQueuePlayer *)self->_player setActionAtItemEnd:0];
        }
        else
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[CLKVideoPlayerView _loadVideo:]((uint64_t)v4, v19, v20, v21, v22, v23, v24, v25);
          }
        }
        kdebug_trace();
      }
    }
    else
    {
      [(CLKVideoPlayerView *)self _loadVideo:v4];
    }
  }
}

- (CLKVideoPlayerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CLKVideoPlayerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)gravityResize
{
  return self->_gravityResize;
}

- (BOOL)pausedViewEnabled
{
  return self->_pausedViewEnabled;
}

- (BOOL)playing
{
  return self->_playing;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_seekRequested, 0);
  objc_storeStrong((id *)&self->_pausedView, 0);
  objc_storeStrong(&self->_periodicTimeObserver, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_queuedItem, 0);
  objc_storeStrong((id *)&self->_observedItem, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->_player, 0);

  objc_storeStrong((id *)&self->_playerView, 0);
}

- (void)_handleDidPlayToEndTime:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21C599000, log, OS_LOG_TYPE_ERROR, "Trying to AVPlayerActionAtItemEndAdvance without a _queuedItem. This shouldn't happen.", v1, 2u);
}

- (void)_loadVideo:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_queueVideo:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end