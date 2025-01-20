@interface QLMediaItemBaseViewController
- (AVAsset)mediaAsset;
- (AVPlayer)player;
- (AVPlayerLayer)playerLayer;
- (BOOL)_assetIsDecodable:(id)a3;
- (BOOL)endOfMediaReached;
- (BOOL)isFullScreen;
- (BOOL)isVisible;
- (BOOL)pause;
- (BOOL)play;
- (BOOL)playable;
- (BOOL)shouldDisplayPlayButtonInNavigationBar;
- (BOOL)togglePlayback;
- (BOOL)visualTracksEnabled;
- (CGSize)imageSize;
- (NSError)error;
- (UIView)playerView;
- (double)elapsedTime;
- (double)mediaDuration;
- (double)mediaVolume;
- (double)remainingTime;
- (float)playerTimeObservationInterval;
- (id)playbackObserverBlock;
- (id)setupPlayerViewWithPlayer:(id)a3;
- (id)toolbarButtonsForTraitCollection:(id)a3;
- (int64_t)playingStatus;
- (void)_updateExternalPlayback;
- (void)_updatePlayingStatus;
- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)hostApplicationDidBecomeActive;
- (void)hostApplicationDidEnterBackground:(id)a3;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4;
- (void)previewDidAppear:(BOOL)a3;
- (void)previewDidDisappear:(BOOL)a3;
- (void)previewIsAppearingWithProgress:(double)a3;
- (void)resetToBeginningAndPlay;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setElapsedTime:(double)a3;
- (void)setError:(id)a3;
- (void)setMediaDuration:(double)a3;
- (void)setMediaVolume:(double)a3;
- (void)setPlayer:(id)a3;
- (void)setRemainingTime:(double)a3;
- (void)stop;
@end

@implementation QLMediaItemBaseViewController

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  objc_storeStrong((id *)&self->_mediaAsset, a3);
  v16 = v10;
  v17 = v11;
  id v13 = v10;
  id v14 = v12;
  id v15 = v11;
  QLRunInBackgroundThread();
}

void __93__QLMediaItemBaseViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(id *a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl()) {
    [MEMORY[0x263EF93E0] primarySession];
  }
  else {
  v2 = [MEMORY[0x263EF93E0] auxiliarySession];
  }
  v3 = v2;
  if (v2)
  {
    id v23 = 0;
    [v2 setParticipatesInNowPlayingAppPolicy:1 error:&v23];
    id v4 = v23;
    v5 = (NSObject **)MEMORY[0x263F62940];
    if (v4)
    {
      v6 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        v6 = *v5;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v4;
        _os_log_impl(&dword_217F61000, v6, OS_LOG_TYPE_ERROR, "Could not set participatesInNowPlayingAppPolicy: %@ #Media", buf, 0xCu);
      }
    }
    v7 = [a1[4] player];
    [v7 setAudioSession:v3];

    id v8 = (id)*MEMORY[0x263EF9060];
    id v9 = [a1[4] player];
    id v10 = [v9 audioSession];
    id v22 = 0;
    [v10 setCategory:v8 error:&v22];
    id v11 = v22;

    if (v11)
    {
      id v12 = *v5;
      if (!*v5)
      {
        QLSInitLogging();
        id v12 = *v5;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v25 = v8;
        __int16 v26 = 2112;
        id v27 = v11;
        _os_log_impl(&dword_217F61000, v12, OS_LOG_TYPE_ERROR, "Could not set category (%@): %@ #Media", buf, 0x16u);
      }
    }
    id v13 = [a1[4] player];
    id v14 = [v13 currentItem];
    id v15 = v14;
    if (v14) {
      [v14 duration];
    }

    [a1[5] isPlayable];
    id v19 = a1[5];
    id v21 = a1[7];
    id v20 = a1[6];
    QLRunInMainThread();
  }
  else
  {
    v16 = (NSObject **)MEMORY[0x263F62940];
    v17 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      v17 = *v16;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217F61000, v17, OS_LOG_TYPE_ERROR, "Could not create audio session #Media", buf, 2u);
    }
    v18 = (void (**)(id, id))a1[7];
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.quicklook.mediaItemAggregatedViewController" code:1000 userInfo:0];
    v18[2](v18, v4);
  }
}

void __93__QLMediaItemBaseViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) hasProtectedContent];
  *(unsigned char *)(*(void *)(a1 + 40) + 1200) = [*(id *)(a1 + 40) _assetIsDecodable:*(void *)(a1 + 32)] & (v2 ^ 1);
  int v3 = [*(id *)(a1 + 40) playable];
  id v4 = *(void **)(a1 + 40);
  if (v3)
  {
    [v4 setupPlayerWithMediaAsset:*(void *)(a1 + 32)];
    v5 = *(void **)(a1 + 40);
    v6 = [v5 player];
    uint64_t v7 = [v5 setupPlayerViewWithPlayer:v6];
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = *(void **)(v8 + 1208);
    *(void *)(v8 + 1208) = v7;

    id v10 = [*(id *)(a1 + 40) player];
    id v11 = *(void **)(a1 + 40);
    id v12 = [v11 player];
    [v10 addObserver:v11 forKeyPath:@"rate" options:1 context:v12];

    id v13 = [*(id *)(a1 + 40) player];
    id v14 = *(void **)(a1 + 40);
    id v15 = [v14 player];
    [v13 addObserver:v14 forKeyPath:@"status" options:1 context:v15];

    v16 = [MEMORY[0x263F08A00] defaultCenter];
    v17 = *(void **)(a1 + 40);
    uint64_t v18 = *MEMORY[0x263EFA050];
    id v19 = [v17 player];
    id v20 = [v19 currentItem];
    [v16 addObserver:v17 selector:sel_playerItemDidReachEnd_ name:v18 object:v20];

    memset(&v46, 0, sizeof(v46));
    [*(id *)(a1 + 40) playerTimeObservationInterval];
    CMTimeMakeWithSeconds(&v46, v21, 1000000000);
    id v22 = [*(id *)(a1 + 40) player];
    id v23 = [*(id *)(a1 + 40) playbackObserverBlock];
    CMTime buf = v46;
    uint64_t v24 = [v22 addPeriodicTimeObserverForInterval:&buf queue:0 usingBlock:v23];
    uint64_t v25 = *(void *)(a1 + 40);
    __int16 v26 = *(void **)(v25 + 1160);
    *(void *)(v25 + 1160) = v24;

    *(void *)(*(void *)(a1 + 40) + 1256) = 0;
    id v27 = _Block_copy(*(const void **)(a1 + 56));
    uint64_t v28 = *(void *)(a1 + 40);
    v29 = *(void **)(v28 + 1176);
    *(void *)(v28 + 1176) = v27;

    [*(id *)(a1 + 40) _updatePlayingStatus];
    [*(id *)(a1 + 40) _updateExternalPlayback];
    if ([*(id *)(a1 + 48) processIdentifier] >= 1)
    {
      v30 = [MEMORY[0x263F544E0] sharedAVSystemController];
      v31 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "processIdentifier"));
      uint64_t v32 = *MEMORY[0x263F543D0];
      id v44 = 0;
      [v30 setAttribute:v31 forKey:v32 error:&v44];
      id v33 = v44;

      if (v33)
      {
        v34 = (NSObject **)MEMORY[0x263F62940];
        v35 = *MEMORY[0x263F62940];
        if (!*MEMORY[0x263F62940])
        {
          QLSInitLogging();
          v35 = *v34;
        }
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.value) = 138412290;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v33;
          _os_log_impl(&dword_217F61000, v35, OS_LOG_TYPE_ERROR, "Error setting the PID to inherit the state from: %@ #Media", (uint8_t *)&buf, 0xCu);
        }
      }
    }
  }
  else
  {
    [v4 willChangeValueForKey:@"playingStatus"];
    *(void *)(*(void *)(a1 + 40) + 1256) = 3;
    [*(id *)(a1 + 40) didChangeValueForKey:@"playingStatus"];
    [*(id *)(a1 + 40) didChangePlayingStatus];
    v36 = (NSObject **)MEMORY[0x263F62940];
    if (v2)
    {
      v37 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        v37 = *v36;
      }
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        CMTimeValue v38 = *(void *)(a1 + 32);
        uint64_t v39 = *(void *)(a1 + 40);
        LODWORD(v46.value) = 138412546;
        *(CMTimeValue *)((char *)&v46.value + 4) = v38;
        LOWORD(v46.flags) = 2112;
        *(void *)((char *)&v46.flags + 2) = v39;
        _os_log_impl(&dword_217F61000, v37, OS_LOG_TYPE_ERROR, "Can't play AVAsset with protected content: %@. %@ #Media", (uint8_t *)&v46, 0x16u);
      }
    }
    v40 = *v36;
    if (!*v36)
    {
      QLSInitLogging();
      v40 = *v36;
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      CMTimeValue v41 = *(void *)(a1 + 32);
      uint64_t v42 = *(void *)(a1 + 40);
      LODWORD(v46.value) = 138412546;
      *(CMTimeValue *)((char *)&v46.value + 4) = v41;
      LOWORD(v46.flags) = 2112;
      *(void *)((char *)&v46.flags + 2) = v42;
      _os_log_impl(&dword_217F61000, v40, OS_LOG_TYPE_ERROR, "Asset is not playable: %@. %@ #Media", (uint8_t *)&v46, 0x16u);
    }
    v43 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.quicklook.mediaItemAggregatedViewController" code:1 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (id)setupPlayerViewWithPlayer:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  double v6 = *MEMORY[0x263F00148];
  double v7 = *(double *)(MEMORY[0x263F00148] + 8);
  [(QLMediaItemBaseViewController *)self imageSize];
  objc_msgSend(v5, "setFrame:", v6, v7, v8, v9);
  id v10 = [MEMORY[0x263EFA838] playerLayerWithPlayer:v4];

  playerLayer = self->_playerLayer;
  self->_playerLayer = v10;

  [v5 bounds];
  -[AVPlayerLayer setFrame:](self->_playerLayer, "setFrame:");
  id v12 = [v5 layer];
  [v12 addSublayer:self->_playerLayer];

  [(QLScrollableContentItemViewController *)self setContentView:v5];

  return v5;
}

- (void)previewIsAppearingWithProgress:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)QLMediaItemBaseViewController;
  -[QLItemViewController previewIsAppearingWithProgress:](&v6, sel_previewIsAppearingWithProgress_);
  double v5 = a3 * 1.5;
  if (a3 * 1.5 > 1.0) {
    double v5 = 1.0;
  }
  [(QLMediaItemBaseViewController *)self setMediaVolume:v5];
}

- (void)previewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)QLMediaItemBaseViewController;
  [(QLScrollableContentItemViewController *)&v6 previewDidAppear:a3];
  [(QLMediaItemBaseViewController *)self setMediaVolume:1.0];
  self->_isVisible = 1;
  id v4 = [(QLItemViewController *)self appearance];
  uint64_t v5 = [v4 presentationMode];

  if (v5 == 4) {
    [(QLMediaItemBaseViewController *)self play];
  }
  [(QLMediaItemBaseViewController *)self _updateExternalPlayback];
}

- (void)previewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLMediaItemBaseViewController;
  [(QLScrollableContentItemViewController *)&v4 previewDidDisappear:a3];
  self->_isVisible = 0;
  [(QLMediaItemBaseViewController *)self _updateExternalPlayback];
  [(QLMediaItemBaseViewController *)self pause];
}

- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)QLMediaItemBaseViewController;
  [(QLItemViewController *)&v6 previewBecameFullScreen:a3 animated:a4];
  self->_isFullScreen = a3;
}

- (void)dealloc
{
  if ([(QLMediaItemBaseViewController *)self playable])
  {
    int v3 = [(QLMediaItemBaseViewController *)self player];
    [v3 removeObserver:self forKeyPath:@"rate"];

    objc_super v4 = [(QLMediaItemBaseViewController *)self player];
    [v4 removeObserver:self forKeyPath:@"status"];

    uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 removeObserver:self];
  }
  v6.receiver = self;
  v6.super_class = (Class)QLMediaItemBaseViewController;
  [(QLMediaItemBaseViewController *)&v6 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(QLMediaItemBaseViewController *)self player];

  if (v13 == a6)
  {
    if (([v10 isEqualToString:@"rate"] & 1) != 0
      || [v10 isEqualToString:@"status"])
    {
      [(QLMediaItemBaseViewController *)self _updatePlayingStatus];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)QLMediaItemBaseViewController;
    [(QLMediaItemBaseViewController *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_updateExternalPlayback
{
  BOOL isVisible = self->_isVisible;
  id v3 = [(QLMediaItemBaseViewController *)self player];
  [v3 setAllowsExternalPlayback:isVisible];
}

- (void)_updatePlayingStatus
{
  id v3 = [(QLMediaItemBaseViewController *)self player];
  objc_super v4 = [v3 error];
  [(QLMediaItemBaseViewController *)self setError:v4];

  uint64_t v5 = [(QLMediaItemBaseViewController *)self player];
  uint64_t v6 = [v5 status];

  if (v6 == 1)
  {
    double v7 = [(QLMediaItemBaseViewController *)self player];
    if (v7)
    {
      double v9 = [(QLMediaItemBaseViewController *)self player];
      [v9 rate];
      if (v10 == 0.0) {
        int64_t v8 = 2;
      }
      else {
        int64_t v8 = 1;
      }
    }
    else
    {
      int64_t v8 = 2;
    }
  }
  else
  {
    if (v6 != 2)
    {
      int64_t v8 = 0;
      goto LABEL_12;
    }
    double v7 = [(QLMediaItemBaseViewController *)self error];
    [(QLItemViewController *)self notifyDelegatesDidFailWithError:v7];
    int64_t v8 = 3;
  }

LABEL_12:
  if (v8 != self->_playingStatus)
  {
    [(QLMediaItemBaseViewController *)self willChangeValueForKey:@"playingStatus"];
    int64_t playingStatus = self->_playingStatus;
    self->_int64_t playingStatus = v8;
    if (!playingStatus)
    {
      id v12 = [(QLMediaItemBaseViewController *)self player];
      uint64_t v13 = [v12 status];

      if (v13 == 1)
      {
        objc_super v14 = [(QLItemViewController *)self appearance];
        uint64_t v15 = [v14 presentationMode];

        if (v15 == 4) {
          [(QLMediaItemBaseViewController *)self play];
        }
      }
      previewItemLoadingBlock = (void (**)(id, void *))self->_previewItemLoadingBlock;
      if (previewItemLoadingBlock)
      {
        v17 = [(QLMediaItemBaseViewController *)self player];
        uint64_t v18 = [v17 error];
        previewItemLoadingBlock[2](previewItemLoadingBlock, v18);

        id v19 = self->_previewItemLoadingBlock;
        self->_previewItemLoadingBlock = 0;
      }
    }
    [(QLMediaItemBaseViewController *)self didChangeValueForKey:@"playingStatus"];
    [(QLMediaItemBaseViewController *)self didChangePlayingStatus];
    id v20 = [(QLItemViewController *)self delegate];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      id v22 = [(QLItemViewController *)self delegate];
      [v22 previewItemViewControllerWantsUpdateOverlay:self animated:0];
    }
  }
}

- (AVPlayer)player
{
  player = self->_player;
  if (!player)
  {
    if (self->_mediaAsset)
    {
      objc_super v4 = (void *)MEMORY[0x263EFA7F0];
      uint64_t v5 = objc_msgSend(MEMORY[0x263EFA800], "playerItemWithAsset:");
      uint64_t v6 = [v4 playerWithPlayerItem:v5];
      double v7 = self->_player;
      self->_player = v6;

      player = self->_player;
    }
    else
    {
      player = 0;
    }
  }

  return player;
}

- (id)toolbarButtonsForTraitCollection:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  if ([(QLMediaItemBaseViewController *)self shouldDisplayPlayButtonInNavigationBar]&& [(QLMediaItemBaseViewController *)self playable])
  {
    objc_super v4 = (void *)[objc_alloc(MEMORY[0x263F629D0]) initWithIdentifier:@"togglePlay"];
    [v4 setPlacement:0];
    int64_t v5 = [(QLMediaItemBaseViewController *)self playingStatus];
    if (v5 == 1) {
      uint64_t v6 = 18;
    }
    else {
      uint64_t v6 = 17;
    }
    if (v5 == 1) {
      double v7 = QLMediaItemViewControllerBarPlayButtonPausedAccessibilityIdentifier;
    }
    else {
      double v7 = QLMediaItemViewControllerBarPlayButtonPlayingAccessibilityIdentifier;
    }
    [v4 setSystemItem:v6];
    [v4 setAccessibilityIdentifier:*v7];
    v10[0] = v4;
    int64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }
  else
  {
    int64_t v8 = (void *)MEMORY[0x263EFFA68];
  }

  return v8;
}

- (CGSize)imageSize
{
  p_imageSize = &self->_imageSize;
  if (self->_imageSize.width == *MEMORY[0x263F001B0]
    && self->_imageSize.height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    int64_t v5 = [(QLMediaItemBaseViewController *)self player];

    if (v5)
    {
      uint64_t v6 = [(QLMediaItemBaseViewController *)self player];
      double v7 = [v6 currentItem];
      int64_t v8 = [v7 asset];
      objc_msgSend(v8, "ql_imageSizeOfFirstVideoTrack");
      p_imageSize->double width = v9;
      p_imageSize->double height = v10;
    }
  }
  double width = p_imageSize->width;
  double height = p_imageSize->height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)endOfMediaReached
{
  id v3 = [(QLMediaItemBaseViewController *)self player];
  objc_super v4 = v3;
  if (v3) {
    [v3 currentTime];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  int64_t v5 = [(QLMediaItemBaseViewController *)self player];
  uint64_t v6 = [v5 currentItem];
  double v7 = [v6 asset];
  int64_t v8 = v7;
  if (v7) {
    [v7 duration];
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  BOOL v9 = CMTimeCompare(&time1, &v11) == 0;

  return v9;
}

- (BOOL)shouldDisplayPlayButtonInNavigationBar
{
  return 1;
}

- (float)playerTimeObservationInterval
{
  return 1.0;
}

- (id)playbackObserverBlock
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__QLMediaItemBaseViewController_playbackObserverBlock__block_invoke;
  v4[3] = &unk_2642F6BA0;
  objc_copyWeak(&v5, &location);
  int v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

void __54__QLMediaItemBaseViewController_playbackObserverBlock__block_invoke(uint64_t a1, CMTime *a2)
{
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CMTime time = *a2;
  [WeakRetained observePlayingTime:&time];

  CMTime time = *a2;
  double v5 = round(CMTimeGetSeconds(&time));
  id v6 = objc_loadWeakRetained(v3);
  [v6 setElapsedTime:v5];

  id v7 = objc_loadWeakRetained(v3);
  int64_t v8 = [v7 player];
  BOOL v9 = [v8 currentItem];
  CGFloat v10 = [v9 asset];
  CMTime v11 = v10;
  if (v10) {
    [v10 duration];
  }
  else {
    memset(&v17, 0, sizeof(v17));
  }
  double v12 = round(CMTimeGetSeconds(&v17));
  id v13 = objc_loadWeakRetained(v3);
  [v13 elapsedTime];
  double v15 = v12 - v14;
  id v16 = objc_loadWeakRetained(v3);
  [v16 setRemainingTime:v15];
}

- (BOOL)play
{
  if (!self->_isVisible) {
    return 0;
  }
  id v3 = [(QLMediaItemBaseViewController *)self player];
  uint64_t v4 = [v3 status];

  if (v4 != 1) {
    return 0;
  }
  if ([(QLMediaItemBaseViewController *)self endOfMediaReached])
  {
    [(QLMediaItemBaseViewController *)self resetToBeginningAndPlay];
  }
  else
  {
    id v6 = [(QLMediaItemBaseViewController *)self player];
    [v6 play];
  }
  return 1;
}

- (BOOL)pause
{
  int v2 = [(QLMediaItemBaseViewController *)self player];
  [v2 pause];

  id v3 = [MEMORY[0x263EF93E0] sharedInstance];
  [v3 silenceOutput:1 error:0];

  return 1;
}

- (void)stop
{
  [(QLMediaItemBaseViewController *)self pause];
  id v3 = [(QLMediaItemBaseViewController *)self player];
  long long v8 = *MEMORY[0x263F010E0];
  uint64_t v9 = *(void *)(MEMORY[0x263F010E0] + 16);
  long long v6 = v8;
  uint64_t v7 = v9;
  long long v4 = v8;
  uint64_t v5 = v9;
  [v3 seekToTime:&v8 toleranceBefore:&v6 toleranceAfter:&v4];
}

- (BOOL)togglePlayback
{
  if ([(QLMediaItemBaseViewController *)self playingStatus] == 1)
  {
    return [(QLMediaItemBaseViewController *)self pause];
  }
  else
  {
    return [(QLMediaItemBaseViewController *)self play];
  }
}

- (double)mediaDuration
{
  id v3 = [(QLMediaItemBaseViewController *)self player];
  if (v3)
  {
    long long v4 = [(QLMediaItemBaseViewController *)self player];
    uint64_t v5 = [v4 currentItem];
    long long v6 = [v5 asset];
    uint64_t v7 = v6;
    if (v6) {
      [v6 duration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);
  }
  else
  {
    double Seconds = 0.0;
  }

  return Seconds;
}

- (void)setMediaVolume:(double)a3
{
  float v3 = a3;
  id v5 = [(QLMediaItemBaseViewController *)self player];
  *(float *)&double v4 = v3;
  [v5 setVolume:v4];
}

- (void)resetToBeginningAndPlay
{
  objc_initWeak(&location, self);
  float v3 = [(QLMediaItemBaseViewController *)self player];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __56__QLMediaItemBaseViewController_resetToBeginningAndPlay__block_invoke;
  v10[3] = &unk_2642F6BC8;
  objc_copyWeak(&v11, &location);
  long long v8 = *MEMORY[0x263F010E0];
  uint64_t v9 = *(void *)(MEMORY[0x263F010E0] + 16);
  long long v6 = v8;
  uint64_t v7 = v9;
  long long v4 = v8;
  uint64_t v5 = v9;
  [v3 seekToTime:&v8 toleranceBefore:&v6 toleranceAfter:&v4 completionHandler:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __56__QLMediaItemBaseViewController_resetToBeginningAndPlay__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    int v2 = [WeakRetained player];
    [v2 play];

    id WeakRetained = v3;
  }
}

- (void)hostApplicationDidEnterBackground:(id)a3
{
  if (([a3 BOOLValue] & 1) == 0)
  {
    self->_mediaWasPausedOnResignActive = [(QLMediaItemBaseViewController *)self playingStatus] == 1;
    [(QLMediaItemBaseViewController *)self pause];
  }
}

- (void)hostApplicationDidBecomeActive
{
  if (self->_mediaWasPausedOnResignActive
    && self->_isVisible
    && [(QLMediaItemBaseViewController *)self playingStatus] != 1)
  {
    [(QLMediaItemBaseViewController *)self play];
  }
  self->_mediaWasPausedOnResignActive = 0;
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(QLItemViewController *)self appearance];
  v13.receiver = self;
  v13.super_class = (Class)QLMediaItemBaseViewController;
  [(QLScrollableContentItemViewController *)&v13 setAppearance:v6 animated:v4];

  uint64_t v8 = [v7 presentationMode];
  uint64_t v9 = [(QLItemViewController *)self appearance];
  uint64_t v10 = [v9 presentationMode];

  if (v8 != v10)
  {
    id v11 = [(QLItemViewController *)self appearance];
    uint64_t v12 = [v11 presentationMode];

    if (v12 == 4) {
      [(QLMediaItemBaseViewController *)self resetToBeginningAndPlay];
    }
  }
}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  if ([a3 isEqualToString:@"togglePlay"]) {
    [(QLMediaItemBaseViewController *)self togglePlayback];
  }
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v6 = v7;
  }
}

- (BOOL)_assetIsDecodable:(id)a3
{
  id v3 = [a3 tracks];
  BOOL v4 = [v3 firstObject];

  LOBYTE(v3) = [v4 isDecodable];
  return (char)v3;
}

- (void)setPlayer:(id)a3
{
}

- (UIView)playerView
{
  return self->_playerView;
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void)setMediaDuration:(double)a3
{
  self->_mediaDuration = a3;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(double)a3
{
  self->_elapsedTime = a3;
}

- (double)remainingTime
{
  return self->_remainingTime;
}

- (void)setRemainingTime:(double)a3
{
  self->_remainingTime = a3;
}

- (int64_t)playingStatus
{
  return self->_playingStatus;
}

- (BOOL)playable
{
  return self->_playable;
}

- (BOOL)visualTracksEnabled
{
  return self->_visualTracksEnabled;
}

- (double)mediaVolume
{
  return self->_mediaVolume;
}

- (AVAsset)mediaAsset
{
  return self->_mediaAsset;
}

- (BOOL)isFullScreen
{
  return self->_isFullScreen;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong(&self->_previewItemLoadingBlock, 0);
  objc_storeStrong((id *)&self->_playbackTimeObserver, 0);
  objc_storeStrong((id *)&self->_player, 0);

  objc_storeStrong((id *)&self->_mediaAsset, 0);
}

@end