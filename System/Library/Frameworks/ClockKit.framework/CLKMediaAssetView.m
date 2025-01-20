@interface CLKMediaAssetView
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_endTimeForOperation:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_startTimeForOperation:(SEL)a3;
- (BOOL)isPlaying;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CLKDevice)device;
- (CLKMediaAsset)mediaAsset;
- (CLKMediaAssetView)initWithFrame:(CGRect)a3 forDevice:(id)a4;
- (CLKMediaAssetViewDelegate)delegate;
- (void)_cancelPlayback;
- (void)_completePlaybackWithOperation:(int64_t)a3;
- (void)_createVideoPlayerViewIfNeeded;
- (void)_mediaServicesWereReset:(id)a3;
- (void)_reset;
- (void)_transitionFromPosterToVideo;
- (void)changeMediaAsset:(id)a3;
- (void)dealloc;
- (void)fadeFromCurtainViewWithDuration:(double)a3 completion:(id)a4;
- (void)fadeToCurtainViewWithDuration:(double)a3 completion:(id)a4;
- (void)hideCurtainView;
- (void)interruptPlayback;
- (void)layoutSubviews;
- (void)pauseVideoPlayerViewIfItExists;
- (void)pauseWithOperation:(int64_t)a3;
- (void)playWithOperation:(int64_t)a3;
- (void)prepareToPlayWithOperation:(int64_t)a3;
- (void)resumeInterruptedPlayback;
- (void)setDelegate:(id)a3;
- (void)showCurtainView;
- (void)videoPlayerViewDidBeginPlaying:(id)a3;
- (void)videoPlayerViewDidPauseAfterPlayingVideoToEnd:(id)a3;
@end

@implementation CLKMediaAssetView

- (CLKMediaAssetView)initWithFrame:(CGRect)a3 forDevice:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CLKMediaAssetView;
  v11 = -[CLKMediaAssetView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_device, a4);
    id v13 = objc_alloc(MEMORY[0x263F82828]);
    [(CLKMediaAssetView *)v12 bounds];
    uint64_t v14 = objc_msgSend(v13, "initWithFrame:");
    posterView = v12->_posterView;
    v12->_posterView = (UIImageView *)v14;

    [(UIImageView *)v12->_posterView setAutoresizingMask:18];
    [(UIImageView *)v12->_posterView setContentMode:1];
    [(CLKMediaAssetView *)v12 addSubview:v12->_posterView];
    [(CLKMediaAssetView *)v12 bringSubviewToFront:v12->_posterView];
    v16 = [MEMORY[0x263F08A00] defaultCenter];
    v17 = CLKget_AVAudioSessionMediaServicesWereResetNotification();
    [v16 addObserver:v12 selector:sel__mediaServicesWereReset_ name:v17 object:0];
  }
  return v12;
}

- (void)dealloc
{
  if (self->_timeObserver)
  {
    v3 = [(CLKVideoPlayerView *)self->_videoPlayerView player];
    [v3 removeTimeObserver:self->_timeObserver];

    id timeObserver = self->_timeObserver;
    self->_id timeObserver = 0;
  }
  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)CLKMediaAssetView;
  [(CLKMediaAssetView *)&v6 dealloc];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIImageView sizeThatFits:](self->_posterView, "sizeThatFits:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(UIImageView *)self->_posterView intrinsicContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)CLKMediaAssetView;
  [(CLKMediaAssetView *)&v15 layoutSubviews];
  double v3 = [(AVSynchronizedLayer *)self->_syncLayer superlayer];
  [v3 bounds];
  -[AVSynchronizedLayer setFrame:](self->_syncLayer, "setFrame:");

  double v4 = [(CALayer *)self->_posterLayer superlayer];
  [v4 bounds];
  -[CALayer setFrame:](self->_posterLayer, "setFrame:");

  v5 = CLKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_21C599000, v5, OS_LOG_TYPE_DEFAULT, "CLKMediaAssetView layoutSubviews", v14, 2u);
  }

  [(CLKMediaAssetView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  _CLKSetViewBoundsAndPositionFromFrame(self->_curtainView, v6, v8, v10, v12);
  _CLKSetViewBoundsAndPositionFromFrame(self->_posterView, v7, v9, v11, v13);
  _CLKSetViewBoundsAndPositionFromFrame(self->_videoPlayerView, v7, v9, v11, v13);
}

- (void)changeMediaAsset:(id)a3
{
  id v5 = a3;
  [(CLKMediaAssetView *)self _cancelPlayback];
  double v6 = [v5 video];
  double v7 = [v6 url];
  double v8 = [(CLKMediaAsset *)self->_mediaAsset video];
  double v9 = [v8 url];

  if (v7 != v9)
  {
    *((unsigned char *)self + 440) &= ~1u;
    [(CALayer *)self->_posterLayer removeFromSuperlayer];
    [(AVSynchronizedLayer *)self->_syncLayer removeFromSuperlayer];
    syncLayer = self->_syncLayer;
    self->_syncLayer = 0;

    posterLayer = self->_posterLayer;
    self->_posterLayer = 0;
  }
  self->_preparedForOperation = 0;
  objc_storeStrong((id *)&self->_mediaAsset, a3);
  double v12 = [v5 image];
  [(UIImageView *)self->_posterView setImage:v12];

  posterView = self->_posterView;
  long long v14 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v17[0] = *MEMORY[0x263F000D0];
  v17[1] = v14;
  v17[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [(UIImageView *)posterView setTransform:v17];
  [(UIImageView *)self->_posterView setAlpha:1.0];
  objc_super v15 = [v5 video];
  v16 = [v15 url];

  if (v16) {
    [(CLKMediaAssetView *)self _createVideoPlayerViewIfNeeded];
  }
  if ((*((unsigned char *)self + 440) & 1) == 0) {
    [(CLKVideoPlayerView *)self->_videoPlayerView setHidden:1];
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_startTimeForOperation:(SEL)a3
{
  [(CLKMediaAsset *)self->_mediaAsset stillDisplayTime];
  v5.n128_f64[0] = fmax(v5.n128_f64[0] + _startTimeForOperation__startTimeOffsets[a4], 0.0);

  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CLKcall_CMTimeMakeWithSeconds(1000, v5);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_endTimeForOperation:(SEL)a3
{
  [(CLKMediaAsset *)self->_mediaAsset stillDisplayTime];
  double v7 = v6 + _endTimeForOperation__endTimeOffsets[a4];
  [(CLKMediaAsset *)self->_mediaAsset videoDuration];
  if (v7 < v8.n128_f64[0]) {
    v8.n128_f64[0] = v7;
  }

  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CLKcall_CMTimeMakeWithSeconds(1000, v8);
}

- (void)prepareToPlayWithOperation:(int64_t)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a3 - 4) > 0xFFFFFFFFFFFFFFFCLL)
  {
    id v36 = [(CLKMediaAsset *)self->_mediaAsset video];
    double v6 = [v36 url];
    if (v6)
    {
      int64_t preparedForOperation = self->_preparedForOperation;

      if (preparedForOperation != a3)
      {
        if ((*((unsigned char *)self + 440) & 1) == 0)
        {
          __n128 v8 = CLKLoggingObjectForDomain(0);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            double v9 = [(CLKMediaAsset *)self->_mediaAsset video];
            double v10 = [v9 url];
            buf.n128_u32[0] = 138412290;
            *(unint64_t *)((char *)buf.n128_u64 + 4) = (unint64_t)v10;
            _os_log_impl(&dword_21C599000, v8, OS_LOG_TYPE_DEFAULT, "Loading video: %@.", (uint8_t *)&buf, 0xCu);
          }
          videoPlayerView = self->_videoPlayerView;
          double v12 = [(CLKMediaAsset *)self->_mediaAsset video];
          [(CLKVideoPlayerView *)videoPlayerView loadVideo:v12];

          [(CLKVideoPlayerView *)self->_videoPlayerView setHidden:0];
          *((unsigned char *)self + 440) |= 1u;
        }
        if (a3 == 2)
        {
          if (!self->_syncLayer)
          {
            double v13 = [MEMORY[0x263F157E8] layer];
            posterLayer = self->_posterLayer;
            self->_posterLayer = v13;

            [(CALayer *)self->_posterLayer setContentsGravity:*MEMORY[0x263F15E18]];
            -[CALayer setContentsRect:](self->_posterLayer, "setContentsRect:", 0.046, 0.046, 0.908, 0.908);
            [MEMORY[0x263F158F8] begin];
            [MEMORY[0x263F158F8] setDisableActions:1];
            id v15 = [(UIImageView *)self->_posterView image];
            -[CALayer setContents:](self->_posterLayer, "setContents:", [v15 CGImage]);

            v16 = [(UIImageView *)self->_posterView image];
            uint64_t v17 = [v16 imageOrientation];

            long long v18 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
            *(_OWORD *)&v49.a = *MEMORY[0x263F000D0];
            *(_OWORD *)&v49.c = v18;
            *(_OWORD *)&v49.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
            if ((unint64_t)(v17 - 1) <= 2) {
              CGAffineTransformMakeRotation(&v49, dbl_21C614CA0[v17 - 1]);
            }
            objc_super v19 = self->_posterLayer;
            CGAffineTransform v48 = v49;
            [(CALayer *)v19 setContentsTransform:&v48];
            [(CALayer *)self->_posterLayer setOpacity:0.0];
            [MEMORY[0x263F158F8] commit];
            id v20 = CLKget_AVSynchronizedLayerClass();
            v21 = [(CLKVideoPlayerView *)self->_videoPlayerView player];
            v22 = [v21 currentItem];
            v23 = [v20 synchronizedLayerWithPlayerItem:v22];
            syncLayer = self->_syncLayer;
            self->_syncLayer = v23;

            v25 = [(CLKMediaAssetView *)self layer];
            [v25 bounds];
            -[AVSynchronizedLayer setFrame:](self->_syncLayer, "setFrame:");

            v26 = [(CLKMediaAssetView *)self layer];
            [v26 addSublayer:self->_syncLayer];

            [(AVSynchronizedLayer *)self->_syncLayer bounds];
            -[CALayer setFrame:](self->_posterLayer, "setFrame:");
            [(AVSynchronizedLayer *)self->_syncLayer addSublayer:self->_posterLayer];
          }
          [(CLKMediaAsset *)self->_mediaAsset stillDisplayTime];
          CLKcall_CMTimeMakeWithSeconds(1000, v27);
          v28 = [(CLKVideoPlayerView *)self->_videoPlayerView player];
          v29 = [v28 currentItem];
          long long v44 = v46;
          uint64_t v45 = v47;
          [v29 setForwardPlaybackEndTime:&v44];

          v30 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
          [v30 setFromValue:&unk_26CCDC4A8];
          [v30 setToValue:&unk_26CCDC4B8];
          [v30 setDuration:0.065];
          [v30 setFillMode:*MEMORY[0x263F15AB0]];
          [v30 setRemovedOnCompletion:0];
          [(CLKMediaAsset *)self->_mediaAsset stillDisplayTime];
          [v30 setBeginTime:v31 + -0.065];
          [(CALayer *)self->_posterLayer addAnimation:v30 forKey:@"poster"];
        }
        else
        {
          v33 = [(CLKVideoPlayerView *)self->_videoPlayerView player];
          v34 = [v33 currentItem];
          __n128 v40 = v42;
          uint64_t v41 = v43;
          [v34 setForwardPlaybackEndTime:&v40];

          [MEMORY[0x263F158F8] begin];
          [MEMORY[0x263F158F8] setDisableActions:1];
          [(CALayer *)self->_posterLayer removeAllAnimations];
          [(CALayer *)self->_posterLayer setOpacity:0.0];
          uint64_t v32 = [MEMORY[0x263F158F8] commit];
        }
        __n128 buf = 0uLL;
        uint64_t v51 = 0;
        CLKget_kCMTimePositiveInfinity(&buf, v32);
        if (a3 == 1)
        {
          CLKget_kCMTimeZero(&v38);
          __n128 buf = v38;
          uint64_t v51 = v39;
        }
        v35 = self->_videoPlayerView;
        [(CLKMediaAssetView *)self _startTimeForOperation:a3];
        __n128 v38 = buf;
        uint64_t v39 = v51;
        [(CLKVideoPlayerView *)v35 seekToTime:v37 tolerance:&v38];
        [(CLKVideoPlayerView *)self->_videoPlayerView preroll];
        self->_int64_t preparedForOperation = a3;
      }
    }
    else
    {
    }
  }
  else
  {
    double v4 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      buf.n128_u32[0] = 134217984;
      *(unint64_t *)((char *)buf.n128_u64 + 4) = a3;
      _os_log_impl(&dword_21C599000, v4, OS_LOG_TYPE_DEFAULT, "Unsupported media view operation: %ld", (uint8_t *)&buf, 0xCu);
    }
  }
}

- (void)_transitionFromPosterToVideo
{
  int64_t transitionOperation = self->_transitionOperation;
  double v4 = _transitionFromPosterToVideo_s_transitionDurationForPlayWithOperation[transitionOperation];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(CALayer *)self->_posterLayer setOpacity:0.0];
  [MEMORY[0x263F158F8] commit];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__CLKMediaAssetView__transitionFromPosterToVideo__block_invoke;
  v7[3] = &unk_26440F180;
  v7[4] = self;
  v7[5] = 0x3FF1333333333333;
  uint64_t v5 = MEMORY[0x21D4AACC0](v7);
  double v6 = (void *)v5;
  if (transitionOperation == 1) {
    [MEMORY[0x263F82E00] animateWithDuration:0x20000 delay:v5 options:0 animations:v4 completion:0.0];
  }
  else {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }
}

uint64_t __49__CLKMediaAssetView__transitionFromPosterToVideo__block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  double v2 = *(void **)(*(void *)(a1 + 32) + 424);
  CGAffineTransform v4 = v5;
  [v2 setTransform:&v4];
  return [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
}

- (void)playWithOperation:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a3 - 4) > 0xFFFFFFFFFFFFFFFCLL)
  {
    double v6 = [(CLKMediaAsset *)self->_mediaAsset video];
    double v7 = [v6 url];

    if (v7)
    {
      if (self->_preparedForOperation != a3) {
        [(CLKMediaAssetView *)self prepareToPlayWithOperation:a3];
      }
      self->_int64_t transitionOperation = a3;
      memset(buf, 0, sizeof(buf));
      uint64_t v25 = 0;
      [(CLKMediaAssetView *)self _endTimeForOperation:a3];
      objc_initWeak(&location, self);
      if (self->_timeObserver)
      {
        __n128 v8 = [(CLKVideoPlayerView *)self->_videoPlayerView player];
        [v8 removeTimeObserver:self->_timeObserver];

        id timeObserver = self->_timeObserver;
        self->_id timeObserver = 0;
      }
      double v10 = [(CLKVideoPlayerView *)self->_videoPlayerView player];
      long long v20 = *(_OWORD *)buf;
      uint64_t v21 = v25;
      double v11 = [MEMORY[0x263F08D40] valueWithCMTime:&v20];
      v23 = v11;
      double v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __39__CLKMediaAssetView_playWithOperation___block_invoke;
      long long v18 = &unk_26440F1A8;
      objc_copyWeak(v19, &location);
      v19[1] = (id)a3;
      double v13 = [v10 addBoundaryTimeObserverForTimes:v12 queue:0 usingBlock:&v15];
      id v14 = self->_timeObserver;
      self->_id timeObserver = v13;

      [(CLKVideoPlayerView *)self->_videoPlayerView play];
      self->_int64_t preparedForOperation = 0;
      *((unsigned char *)self + 440) |= 2u;
      objc_destroyWeak(v19);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    CGAffineTransform v4 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__n128 buf = 134217984;
      *(void *)&buf[4] = a3;
      _os_log_impl(&dword_21C599000, v4, OS_LOG_TYPE_DEFAULT, "Unsupported media view operation: %ld", buf, 0xCu);
    }
  }
}

void __39__CLKMediaAssetView_playWithOperation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completePlaybackWithOperation:*(void *)(a1 + 40)];
}

- (void)_completePlaybackWithOperation:(int64_t)a3
{
  CGAffineTransform v5 = [(CLKVideoPlayerView *)self->_videoPlayerView player];
  [v5 removeTimeObserver:self->_timeObserver];

  id timeObserver = self->_timeObserver;
  self->_id timeObserver = 0;

  if (a3 == 1)
  {
    [(CLKVideoPlayerView *)self->_videoPlayerView pause];
    self->_int64_t preparedForOperation = 0;
    *((unsigned char *)self + 440) &= ~2u;
  }
  else
  {
    [(CLKMediaAssetView *)self pauseWithOperation:a3];
  }
  id v7 = [(CLKMediaAssetView *)self delegate];
  [v7 mediaAssetViewDidEndPlaying:self];
}

- (void)pauseWithOperation:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a3 - 4) > 0xFFFFFFFFFFFFFFFCLL)
  {
    double v6 = [(CLKMediaAsset *)self->_mediaAsset video];
    id v7 = [v6 url];

    if (v7)
    {
      if (self->_timeObserver)
      {
        __n128 v8 = [(CLKVideoPlayerView *)self->_videoPlayerView player];
        [v8 removeTimeObserver:self->_timeObserver];

        id timeObserver = self->_timeObserver;
        self->_id timeObserver = 0;
      }
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __40__CLKMediaAssetView_pauseWithOperation___block_invoke;
      v13[3] = &unk_26440E580;
      v13[4] = self;
      double v10 = (void (**)(void))MEMORY[0x21D4AACC0](v13);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __40__CLKMediaAssetView_pauseWithOperation___block_invoke_2;
      v12[3] = &unk_26440F040;
      v12[4] = self;
      double v11 = (void (**)(void, void))MEMORY[0x21D4AACC0](v12);
      if (a3 == 1)
      {
        [MEMORY[0x263F82E00] animateWithDuration:0x10000 delay:v10 options:v11 animations:0.6 completion:0.0];
      }
      else
      {
        v10[2](v10);
        v11[2](v11, 1);
      }
    }
  }
  else
  {
    CGAffineTransform v4 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__n128 buf = 134217984;
      int64_t v15 = a3;
      _os_log_impl(&dword_21C599000, v4, OS_LOG_TYPE_DEFAULT, "Unsupported media view operation: %ld", buf, 0xCu);
    }
  }
}

uint64_t __40__CLKMediaAssetView_pauseWithOperation___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 424);
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v5[0] = *MEMORY[0x263F000D0];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v2 setTransform:v5];
  return [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:1.0];
}

uint64_t __40__CLKMediaAssetView_pauseWithOperation___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 408) pause];
  *(void *)(*(void *)(a1 + 32) + 472) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 440) &= ~2u;
  return result;
}

- (BOOL)isPlaying
{
  return (*((unsigned __int8 *)self + 440) >> 1) & 1;
}

- (void)interruptPlayback
{
  if ((*((unsigned char *)self + 440) & 2) != 0) {
    [(CLKVideoPlayerView *)self->_videoPlayerView pause];
  }
}

- (void)resumeInterruptedPlayback
{
  if ((*((unsigned char *)self + 440) & 2) != 0) {
    [(CLKVideoPlayerView *)self->_videoPlayerView play];
  }
}

- (void)_cancelPlayback
{
  if ((*((unsigned char *)self + 440) & 2) != 0)
  {
    posterView = self->_posterView;
    long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v7[0] = *MEMORY[0x263F000D0];
    v7[1] = v4;
    v7[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [(UIImageView *)posterView setTransform:v7];
    [(UIImageView *)self->_posterView setAlpha:1.0];
    [(CLKVideoPlayerView *)self->_videoPlayerView pause];
    self->_int64_t preparedForOperation = 0;
    *((unsigned char *)self + 440) &= ~2u;
    if (self->_timeObserver)
    {
      CGAffineTransform v5 = [(CLKVideoPlayerView *)self->_videoPlayerView player];
      [v5 removeTimeObserver:self->_timeObserver];

      id timeObserver = self->_timeObserver;
      self->_id timeObserver = 0;
    }
  }
}

- (void)_mediaServicesWereReset:(id)a3
{
  kdebug_trace();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__CLKMediaAssetView__mediaServicesWereReset___block_invoke;
  block[3] = &unk_26440E580;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __45__CLKMediaAssetView__mediaServicesWereReset___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reset];
}

- (void)pauseVideoPlayerViewIfItExists
{
}

- (void)_createVideoPlayerViewIfNeeded
{
  long long v3 = CLKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_21C599000, v3, OS_LOG_TYPE_DEFAULT, "CLKMediaAssetView _createVideoPlayerViewIfNeeded", v7, 2u);
  }

  if (!self->_videoPlayerView)
  {
    kdebug_trace();
    long long v4 = [CLKVideoPlayerView alloc];
    [(CLKMediaAssetView *)self bounds];
    CGAffineTransform v5 = -[CLKVideoPlayerView initWithFrame:](v4, "initWithFrame:");
    videoPlayerView = self->_videoPlayerView;
    self->_videoPlayerView = v5;

    [(CLKVideoPlayerView *)self->_videoPlayerView setDelegate:self];
    [(CLKVideoPlayerView *)self->_videoPlayerView setAutoresizingMask:18];
    [(CLKMediaAssetView *)self insertSubview:self->_videoPlayerView belowSubview:self->_posterView];
  }
}

- (void)_reset
{
  long long v3 = CLKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v10 = 0;
    _os_log_impl(&dword_21C599000, v3, OS_LOG_TYPE_DEFAULT, "CLKMediaAssetView _reset", v10, 2u);
  }

  long long v4 = [(CLKMediaAsset *)self->_mediaAsset video];
  CGAffineTransform v5 = [v4 url];

  if (v5)
  {
    double v6 = self->_mediaAsset;
    id v7 = [(CLKMediaAsset *)v6 image];
    __n128 v8 = +[CLKMediaAsset mediaAssetWithImage:v7 forDevice:self->_device];
    [(CLKMediaAssetView *)self changeMediaAsset:v8];

    [(CLKVideoPlayerView *)self->_videoPlayerView setDelegate:0];
    [(CLKVideoPlayerView *)self->_videoPlayerView pause];
    [(CLKVideoPlayerView *)self->_videoPlayerView removeFromSuperview];
    videoPlayerView = self->_videoPlayerView;
    self->_videoPlayerView = 0;

    [(CLKMediaAssetView *)self changeMediaAsset:v6];
  }
}

- (void)videoPlayerViewDidBeginPlaying:(id)a3
{
  long long v4 = CLKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_21C599000, v4, OS_LOG_TYPE_DEFAULT, "CLKMediaAssetView videoPlayerViewDidBeginPlaying", v6, 2u);
  }

  [(CLKMediaAssetView *)self _transitionFromPosterToVideo];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained mediaAssetViewDidBeginPlaying:self];
}

- (void)videoPlayerViewDidPauseAfterPlayingVideoToEnd:(id)a3
{
  long long v3 = CLKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v4 = 0;
    _os_log_impl(&dword_21C599000, v3, OS_LOG_TYPE_DEFAULT, "CLKMediaAssetView videoPlayerViewDidPauseAfterPlayingVideoToEnd", v4, 2u);
  }
}

- (void)showCurtainView
{
  if (!self->_curtainView)
  {
    id v3 = objc_alloc(MEMORY[0x263F82E00]);
    [(CLKVideoPlayerView *)self->_videoPlayerView bounds];
    long long v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    curtainView = self->_curtainView;
    self->_curtainView = v4;

    double v6 = [MEMORY[0x263F825C8] blackColor];
    [(UIView *)self->_curtainView setBackgroundColor:v6];

    [(CLKMediaAssetView *)self addSubview:self->_curtainView];
    id v7 = self->_curtainView;
    [(CLKMediaAssetView *)self bringSubviewToFront:v7];
  }
}

- (void)hideCurtainView
{
  [(UIView *)self->_curtainView removeFromSuperview];
  curtainView = self->_curtainView;
  self->_curtainView = 0;
}

- (void)fadeToCurtainViewWithDuration:(double)a3 completion:(id)a4
{
  double v6 = (void (**)(id, uint64_t))a4;
  [(CLKMediaAssetView *)self showCurtainView];
  if (a3 >= 0.00000011920929)
  {
    [(UIView *)self->_curtainView setAlpha:0.0];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__CLKMediaAssetView_fadeToCurtainViewWithDuration_completion___block_invoke;
    _OWORD v7[3] = &unk_26440E580;
    v7[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:v7 animations:v6 completion:a3];
  }
  else if (v6)
  {
    v6[2](v6, 1);
  }
}

uint64_t __62__CLKMediaAssetView_fadeToCurtainViewWithDuration_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:1.0];
}

- (void)fadeFromCurtainViewWithDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__CLKMediaAssetView_fadeFromCurtainViewWithDuration_completion___block_invoke;
  v11[3] = &unk_26440F1D0;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  uint64_t v8 = MEMORY[0x21D4AACC0](v11);
  double v9 = (void *)v8;
  if (a3 >= 0.00000011920929)
  {
    [(CLKMediaAssetView *)self showCurtainView];
    [(UIView *)self->_curtainView setAlpha:1.0];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __64__CLKMediaAssetView_fadeFromCurtainViewWithDuration_completion___block_invoke_2;
    v10[3] = &unk_26440E580;
    v10[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:v10 animations:v9 completion:a3];
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, 1);
  }
}

uint64_t __64__CLKMediaAssetView_fadeFromCurtainViewWithDuration_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) hideCurtainView];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __64__CLKMediaAssetView_fadeFromCurtainViewWithDuration_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:0.0];
}

- (CLKMediaAsset)mediaAsset
{
  return self->_mediaAsset;
}

- (CLKDevice)device
{
  return self->_device;
}

- (CLKMediaAssetViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CLKMediaAssetViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_posterLayer, 0);
  objc_storeStrong((id *)&self->_syncLayer, 0);
  objc_storeStrong(&self->_timeObserver, 0);
  objc_storeStrong((id *)&self->_curtainView, 0);
  objc_storeStrong((id *)&self->_posterView, 0);
  objc_storeStrong((id *)&self->_mediaAsset, 0);

  objc_storeStrong((id *)&self->_videoPlayerView, 0);
}

@end