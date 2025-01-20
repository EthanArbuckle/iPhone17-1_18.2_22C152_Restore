@interface LPVisualMediaView
- (BOOL)allowsUserInteractionWithVideoPlayer;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hasEverPlayed;
- (BOOL)hasMuteControl;
- (BOOL)isActive;
- (BOOL)isFullScreen;
- (BOOL)isMuted;
- (BOOL)isParented;
- (BOOL)isPlaying;
- (BOOL)isWaitingForPlayback;
- (BOOL)shouldAllowHighlightToRecognizeSimultaneouslyWithGesture:(id)a3;
- (BOOL)shouldAutoPlay;
- (BOOL)shouldShowMuteButton;
- (BOOL)usesCustomFullScreenImplementation;
- (BOOL)usesSharedAudioSession;
- (CGSize)sizeThatFits:(CGSize)a3;
- (LPVisualMedia)media;
- (LPVisualMediaView)initWithHost:(id)a3;
- (LPVisualMediaView)initWithHost:(id)a3 media:(id)a4 style:(id)a5 posterFrame:(id)a6 posterFrameStyle:(id)a7 configuration:(id)a8;
- (LPVisualMediaViewConfiguration)configuration;
- (UIView)playbackView;
- (double)unobscuredAreaFraction;
- (double)volume;
- (id)_createPosterFrameView;
- (id)_createPulsingLoadIndicator;
- (id)createFullScreenVideoViewController;
- (id)createVideoPlayerView;
- (id)playButtonImage;
- (unint64_t)lastInteractionTimestamp;
- (unsigned)loggingID;
- (void)_buildVisualMediaPlaceholderView;
- (void)_muteButtonHighlightLongPressRecognized:(id)a3;
- (void)_muteButtonTapRecognized:(id)a3;
- (void)_startPlaybackWatchdogTimer;
- (void)_swapVideoPlaceholderForVideoForAutoPlay:(BOOL)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)buildSubviewsIfNeeded;
- (void)componentViewDidMoveToWindow;
- (void)dealloc;
- (void)destroyFullScreenViewController;
- (void)didChangeMutedState:(BOOL)a3;
- (void)didChangePlayingState:(BOOL)a3;
- (void)didEncounterPlaybackError;
- (void)didEncounterPossiblyTransientPlaybackError;
- (void)enterFullScreen;
- (void)fadeInMuteButton;
- (void)fullScreenVideoDidDismiss;
- (void)fullScreenVideoDidPresent;
- (void)fullScreenVideoWillDismiss;
- (void)hideMuteButton;
- (void)hidePlayButtonAnimated:(BOOL)a3;
- (void)layoutComponentView;
- (void)prepareForDisplayWithCompletionHandler:(id)a3;
- (void)recreateFullScreenViewControllerIfNeeded;
- (void)removePlaceholderViews;
- (void)resetToPlaceholderView;
- (void)setActive:(BOOL)a3;
- (void)setAllowsUserInteractionWithVideoPlayer:(BOOL)a3;
- (void)setFullScreen:(BOOL)a3;
- (void)setHasEverPlayed:(BOOL)a3;
- (void)setVolume:(double)a3;
- (void)setWaitingForPlayback:(BOOL)a3;
- (void)showMuteButton;
- (void)showPlayButtonAnimated:(BOOL)a3;
- (void)swapVideoPlaceholderForPlaybackIfNeeded;
- (void)tapRecognized:(id)a3;
- (void)updateMuteButtonWithAnimation:(BOOL)a3;
- (void)updatePlayButtonVisibility;
- (void)userInteractedWithVideoView;
@end

@implementation LPVisualMediaView

- (LPVisualMediaView)initWithHost:(id)a3
{
  return 0;
}

- (LPVisualMediaView)initWithHost:(id)a3 media:(id)a4 style:(id)a5 posterFrame:(id)a6 posterFrameStyle:(id)a7 configuration:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v31 = a5;
  id v30 = a6;
  id v16 = a7;
  id v17 = a8;
  v32.receiver = self;
  v32.super_class = (Class)LPVisualMediaView;
  v18 = [(LPComponentView *)&v32 initWithHost:v14];
  p_isa = (id *)&v18->super.super.super.super.isa;
  v20 = v18;
  if (v18)
  {
    v18->_loggingID = ++initWithHost_media_style_posterFrame_posterFrameStyle_configuration__nextLoggingID;
    objc_storeStrong((id *)&v18->_media, a4);
    objc_storeStrong(p_isa + 53, a5);
    objc_storeStrong(p_isa + 54, a6);
    objc_storeStrong(p_isa + 55, a7);
    uint64_t v21 = objc_msgSend(v17, "copy", v30, v31);
    configuration = v20->_configuration;
    v20->_configuration = (LPVisualMediaViewConfiguration *)v21;

    if (!v20->_configuration)
    {
      v23 = objc_alloc_init(LPVisualMediaViewConfiguration);
      v24 = v20->_configuration;
      v20->_configuration = v23;
    }
    v20->_showingPlayButton = 1;
    v25 = [v15 properties];
    v26 = [v25 accessibilityText];
    [(LPVisualMediaView *)v20 setAccessibilityLabel:v26];

    v27 = +[LPMediaPlaybackManager shared];
    [v27 addMediaPlayer:v20];

    v28 = v20;
  }

  return v20;
}

- (void)dealloc
{
  v3 = +[LPMediaPlaybackManager shared];
  [v3 removeMediaPlayer:self];

  v4.receiver = self;
  v4.super_class = (Class)LPVisualMediaView;
  [(LPVisualMediaView *)&v4 dealloc];
}

- (LPVisualMediaViewConfiguration)configuration
{
  v2 = (void *)[(LPVisualMediaViewConfiguration *)self->_configuration copy];

  return (LPVisualMediaViewConfiguration *)v2;
}

- (BOOL)isParented
{
  if (self->_fullScreen) {
    return 1;
  }
  v3 = [(LPVisualMediaView *)self window];
  BOOL v2 = v3 != 0;

  return v2;
}

- (void)componentViewDidMoveToWindow
{
  if (self->_hasBuilt && !self->_fullScreen)
  {
    if (![(LPVisualMediaView *)self isParented])
    {
      if (self->_playing)
      {
        self->_BOOL wasPlayingOrWaitingToPlayWhenUnparented = 1;
      }
      else
      {
        BOOL v4 = [(LPVisualMediaView *)self isWaitingForPlayback];
        self->_BOOL wasPlayingOrWaitingToPlayWhenUnparented = v4;
        if (!v4) {
          return;
        }
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__LPVisualMediaView_componentViewDidMoveToWindow__block_invoke;
      block[3] = &unk_1E5B04DF0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
      return;
    }
    BOOL wasPlayingOrWaitingToPlayWhenUnparented = self->_wasPlayingOrWaitingToPlayWhenUnparented;
    [(LPVisualMediaView *)self setPlaying:wasPlayingOrWaitingToPlayWhenUnparented];
  }
}

uint64_t __49__LPVisualMediaView_componentViewDidMoveToWindow__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isParented];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) setPlaying:0];
    v3 = *(void **)(a1 + 32);
    return [v3 setMuted:1];
  }
  return result;
}

- (void)buildSubviewsIfNeeded
{
  if (!self->_hasBuilt)
  {
    [(LPVisualMediaView *)self setUserInteractionEnabled:1];
    v3 = [(LPVisualMediaView *)self layer];
    [v3 setMasksToBounds:1];

    objc_msgSend(MEMORY[0x1E4FB1EB0], "_lp_createFlippedView");
    BOOL v4 = (UIView *)objc_claimAutoreleasedReturnValue();
    containerView = self->_containerView;
    self->_containerView = v4;

    [(LPVisualMediaView *)self addSubview:self->_containerView];
    if (+[LPSettings showDebugIndicators])
    {
      id v6 = [MEMORY[0x1E4FB1618] yellowColor];
      uint64_t v7 = [v6 CGColor];
      v8 = [(UIView *)self->_containerView layer];
      [v8 setBorderColor:v7];

      v9 = [(UIView *)self->_containerView layer];
      [v9 setBorderWidth:3.0];

      v10 = (CATextLayer *)objc_alloc_init(MEMORY[0x1E4F39CE8]);
      debugIndicator = self->_debugIndicator;
      self->_debugIndicator = v10;

      v12 = +[LPActionDisablingCALayerDelegate shared];
      [(CATextLayer *)self->_debugIndicator setDelegate:v12];

      v13 = [NSNumber numberWithUnsignedInt:self->_loggingID];
      id v14 = [v13 stringValue];
      [(CATextLayer *)self->_debugIndicator setString:v14];

      -[CATextLayer setFont:](self->_debugIndicator, "setFont:", [MEMORY[0x1E4FB1798] systemFontOfSize:16.0]);
      [(CATextLayer *)self->_debugIndicator setFontSize:16.0];
      id v15 = [MEMORY[0x1E4FB1618] blackColor];
      -[CATextLayer setForegroundColor:](self->_debugIndicator, "setForegroundColor:", [v15 CGColor]);

      id v16 = [MEMORY[0x1E4FB1618] whiteColor];
      -[CATextLayer setShadowColor:](self->_debugIndicator, "setShadowColor:", [v16 CGColor]);

      LODWORD(v17) = 1.0;
      [(CATextLayer *)self->_debugIndicator setShadowOpacity:v17];
      [(CATextLayer *)self->_debugIndicator setShadowRadius:1.0];
      -[CATextLayer setShadowOffset:](self->_debugIndicator, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      [(UIView *)self _lp_backingScaleFactor];
      -[CATextLayer setContentsScale:](self->_debugIndicator, "setContentsScale:");
      v18 = [(LPVisualMediaView *)self layer];
      [v18 addSublayer:self->_debugIndicator];
    }
    [(LPVisualMediaView *)self _buildVisualMediaPlaceholderView];
    if (![(LPVisualMediaViewConfiguration *)self->_configuration disablePlayback]
      && ![(LPVisualMediaViewConfiguration *)self->_configuration disablePlaybackControls])
    {
      v19 = (UIGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_tapRecognized_];
      tapRecognizer = self->_tapRecognizer;
      self->_tapRecognizer = v19;

      [(UIGestureRecognizer *)self->_tapRecognizer setEnabled:!self->_allowsUserInteractionWithVideoPlayer];
      [(UIView *)self->_containerView addGestureRecognizer:self->_tapRecognizer];
      uint64_t v21 = (UIGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_tapRecognized_];
      playButtonTapRecognizer = self->_playButtonTapRecognizer;
      self->_playButtonTapRecognizer = v21;

      [(UIView *)self->_playButtonContainerView addGestureRecognizer:self->_playButtonTapRecognizer];
    }
    if (![(LPVisualMediaViewConfiguration *)self->_configuration disablePlayback])
    {
      if ([(LPVisualMediaView *)self shouldAutoPlay])
      {
        [(LPVisualMediaView *)self _swapVideoPlaceholderForVideoForAutoPlay:1];
        [(LPVisualMediaView *)self setPlaying:1];
      }
      else if ([(LPVisualMediaViewConfiguration *)self->_configuration allowsLoadingMediaWithAutoPlayDisabled])
      {
        [(LPVisualMediaView *)self beginLoadingMediaForPreroll];
      }
      v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v23 addObserver:self selector:sel_applicationDidEnterBackground_ name:*MEMORY[0x1E4FB2640] object:0];

      v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v24 addObserver:self selector:sel_applicationWillEnterForeground_ name:*MEMORY[0x1E4FB2730] object:0];
    }
    self->_hasBuilt = 1;
  }
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v5 = a3;
  BOOL playing = self->_playing;
  self->_wasPlayingWhenSuspended = playing;
  if (playing) {
    [(LPVisualMediaView *)self setPlaying:0];
  }
  if (self->_fullScreen) {
    [(LPVisualMediaView *)self destroyFullScreenViewController];
  }
  else {
    [(LPVisualMediaView *)self setMuted:1];
  }
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v4 = a3;
  if (self->_wasPlayingWhenSuspended && [(LPVisualMediaView *)self isParented]) {
    [(LPVisualMediaView *)self setPlaying:1];
  }
}

- (BOOL)shouldAutoPlay
{
  return 0;
}

- (void)layoutComponentView
{
  [(LPVisualMediaView *)self buildSubviewsIfNeeded];
  v3 = [(UIView *)self->_containerView superview];

  if (v3 == self)
  {
    [(LPVisualMediaView *)self bounds];
    -[UIView setFrame:](self->_containerView, "setFrame:");
  }
  [(UIView *)self->_containerView bounds];
  -[UIView setFrame:](self->_playbackView, "setFrame:");
  [(UIView *)self->_containerView bounds];
  -[UIView setFrame:](self->_videoPlaceholderView, "setFrame:");
  [(LPVisualMediaView *)self bounds];
  CGRect v43 = CGRectInset(v42, 10.0, 10.0);
  -[CATextLayer setFrame:](self->_debugIndicator, "setFrame:", v43.origin.x, v43.origin.y, v43.size.width, v43.size.height);
  id v4 = [(LPVisualMediaViewStyle *)self->_style playButton];
  id v5 = [v4 backgroundSize];
  [v5 asSize];
  double v7 = v6;
  double v9 = v8;

  -[UIView setBounds:](self->_playButtonContainerView, "setBounds:", 0.0, 0.0, v7, v9);
  [(UIView *)self->_containerView bounds];
  double MidX = CGRectGetMidX(v44);
  [(UIView *)self->_containerView bounds];
  double MidY = CGRectGetMidY(v45);
  v12 = [(UIView *)self->_playButtonContainerView layer];
  objc_msgSend(v12, "setPosition:", MidX, MidY);

  -[UIView setBounds:](self->_playButtonView, "setBounds:", 0.0, 0.0, v7, v9);
  [(UIView *)self->_playButtonView frame];
  -[UIView setFrame:](self->_playButtonView, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  muteButtonView = self->_muteButtonView;
  if (muteButtonView)
  {
    id v14 = [(UIImageView *)muteButtonView image];
    id v15 = +[LPResources muteButton];
    id v16 = [v15 platformImage];
    [(UIImageView *)self->_muteButtonView setImage:v16];

    [(UIImageView *)self->_muteButtonView intrinsicContentSize];
    double v18 = v17;
    double v20 = v19;
    uint64_t v21 = +[LPResources unmuteButton];
    v22 = [v21 platformImage];
    [(UIImageView *)self->_muteButtonView setImage:v22];

    [(UIImageView *)self->_muteButtonView intrinsicContentSize];
    double v24 = v23;
    double v26 = v25;
    [(UIImageView *)self->_muteButtonView setImage:v14];
    v27 = [(LPVisualMediaViewStyle *)self->_style muteButtonPadding];
    objc_msgSend(v27, "asInsetsForLTR:", -[UIView _lp_isLTR](self, "_lp_isLTR"));
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;

    BOOL v36 = [(UIView *)self->_muteButtonContainerView _lp_isLTR];
    double v37 = fmax(v18, v24);
    double v38 = 0.0;
    if (v36)
    {
      [(UIView *)self->_containerView bounds];
      double v38 = v39 - (v35 + v37 + v31);
    }
    double v40 = fmax(v20, v26);
    -[UIView setFrame:](self->_muteButtonContainerView, "setFrame:", v38, 0.0, v35 + v37 + v31, v33 + v40 + v29);
    -[UIImageView setFrame:](self->_muteButtonView, "setFrame:", v31, v29, v37, v40);
  }
  [(UIView *)self->_containerView bounds];
  -[UIView setFrame:](self->_pulsingLoadView, "setFrame:");

  [(LPVisualMediaView *)self updatePlayButtonVisibility];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  posterFrame = self->_posterFrame;
  if (posterFrame) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    posterFrame = self->_posterFrame;
LABEL_7:
    v12 = [(LPImage *)posterFrame platformImage];
    [v12 size];
    sizeFittingInsideSizeMaintainingAspectRatio(v13, v14, width, height);
    double width = v15;
    double v11 = v16;

    goto LABEL_8;
  }
  uint64_t v26 = 0;
  v27 = (double *)&v26;
  uint64_t v28 = 0x3010000000;
  double v29 = &unk_1A37209C1;
  double v7 = (double *)MEMORY[0x1E4F1DB30];
  long long v30 = *MEMORY[0x1E4F1DB30];
  uint64_t v22 = 0;
  double v23 = &v22;
  uint64_t v24 = 0x2020000000;
  video = self->_video;
  char v25 = 1;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __34__LPVisualMediaView_sizeThatFits___block_invoke;
  v21[3] = &unk_1E5B05290;
  v21[5] = &v26;
  v21[6] = &v22;
  v21[4] = self;
  [(LPVideo *)video _intrinsicSizeWithCompletionHandler:v21];
  *((unsigned char *)v23 + 24) = 0;
  double v9 = v27[4];
  double v10 = v27[5];
  if (v9 == *v7 && v10 == v7[1])
  {
    double v11 = width * 0.75;
  }
  else
  {
    sizeFittingInsideSizeMaintainingAspectRatio(v9, v10, width, height);
    double width = v19;
    double v11 = v20;
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
LABEL_8:
  double v17 = width;
  double v18 = v11;
  result.double height = v18;
  result.double width = v17;
  return result;
}

void __34__LPVisualMediaView_sizeThatFits___block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(double *)(v3 + 32) = a2;
  *(double *)(v3 + 40) = a3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v5 = [*(id *)(a1 + 32) host];
    [v5 componentViewDidChangeIntrinsicContentSize:*(void *)(a1 + 32)];
  }
}

- (id)_createPulsingLoadIndicator
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  id v4 = [(LPVisualMediaViewStyle *)self->_style pulsingLoadIndicatorColor];
  objc_msgSend(v3, "_lp_setBackgroundColor:", v4);

  id v5 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  [v5 setKeyPath:@"opacity"];
  [v5 setFromValue:&unk_1EF712660];
  double v6 = NSNumber;
  [(LPVisualMediaViewStyle *)self->_style pulsingLoadIndicatorMaximumOpacity];
  double v7 = objc_msgSend(v6, "numberWithDouble:");
  [v5 setToValue:v7];

  [(LPVisualMediaViewStyle *)self->_style pulsingLoadIndicatorDuration];
  objc_msgSend(v5, "setDuration:");
  [v5 setFillMode:*MEMORY[0x1E4F39FA0]];
  double v8 = [(LPVisualMediaViewStyle *)self->_style pulsingLoadIndicatorTimingFunction];
  [v5 setTimingFunction:v8];

  LODWORD(v9) = 2139095040;
  [v5 setRepeatCount:v9];
  [v5 setRemovedOnCompletion:0];
  [v5 setAutoreverses:1];
  double v10 = [v3 layer];
  [v10 addAnimation:v5 forKey:@"fade"];

  return v3;
}

- (void)_startPlaybackWatchdogTimer
{
  BOOL v2 = (void *)(self->_playbackWatchdogTimerID + 1);
  self->_playbackWatchdogTimerID = (unint64_t)v2;
  objc_initWeak(&location, self);
  dispatch_time_t v3 = dispatch_time(0, 60000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__LPVisualMediaView__startPlaybackWatchdogTimer__block_invoke;
  block[3] = &unk_1E5B052B8;
  objc_copyWeak(v5, &location);
  v5[1] = v2;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __48__LPVisualMediaView__startPlaybackWatchdogTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *((void *)WeakRetained + 72) == *(void *)(a1 + 40) && *((unsigned char *)WeakRetained + 590)) {
    [WeakRetained resetToPlaceholderView];
  }
}

- (void)_swapVideoPlaceholderForVideoForAutoPlay:(BOOL)a3
{
  id v5 = [(LPVisualMediaView *)self createVideoPlayerView];
  playbackView = self->_playbackView;
  self->_playbackView = v5;

  self->_waitingForPlaybackDueToAutoPlay |= a3;
  [(UIView *)self->_containerView _lp_insertSubview:self->_playbackView belowSubview:self->_videoPlaceholderView];
  if (!a3)
  {
    double v7 = [(LPVisualMediaView *)self _createPulsingLoadIndicator];
    pulsingLoadView = self->_pulsingLoadView;
    self->_pulsingLoadView = v7;

    [(UIView *)self->_containerView _lp_insertSubview:self->_pulsingLoadView aboveSubview:self->_videoPlaceholderView];
  }
  [(LPVisualMediaView *)self _startPlaybackWatchdogTimer];
  if ([(LPVisualMediaView *)self shouldShowMuteButton]
    && ![(LPVisualMediaViewConfiguration *)self->_configuration disablePlaybackControls])
  {
    [(LPVisualMediaView *)self showMuteButton];
  }
  double v9 = [(LPVisualMediaView *)self createFullScreenVideoViewController];
  fullScreenController = self->_fullScreenController;
  self->_fullScreenController = v9;

  [(UIView *)self _lp_setNeedsLayout];
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)hasMuteControl
{
  return [(LPVideo *)self->_video hasAudio];
}

- (void)setWaitingForPlayback:(BOOL)a3
{
  if (self->_waitingForPlayback != a3)
  {
    self->_waitingForPlayback = a3;
    if (!a3)
    {
      [(UIView *)self _lp_setNeedsLayout];
      self->_waitingForPlaybackDueToAutoPlay = 0;
    }
  }
}

- (unint64_t)lastInteractionTimestamp
{
  return self->_lastInteractionTimestamp;
}

- (double)unobscuredAreaFraction
{
  [(LPVisualMediaView *)self bounds];
  BOOL IsEmpty = CGRectIsEmpty(v18);
  double result = 0.0;
  if (!IsEmpty)
  {
    id v5 = [(LPVisualMediaView *)self window];
    [v5 bounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    [(LPVisualMediaView *)self bounds];
    -[LPVisualMediaView convertRect:toView:](self, "convertRect:toView:", 0);
    v21.origin.x = v7;
    v21.origin.y = v9;
    v21.size.double width = v11;
    v21.size.double height = v13;
    CGRect v20 = CGRectIntersection(v19, v21);
    CGFloat v14 = v20.size.width * v20.size.height;
    [(LPVisualMediaView *)self bounds];
    double v16 = v15;
    [(LPVisualMediaView *)self bounds];
    return v14 / (v16 * v17);
  }
  return result;
}

- (void)userInteractedWithVideoView
{
  self->_lastInteractionTimestamp = mach_absolute_time();
}

- (id)createVideoPlayerView
{
}

- (void)prepareForDisplayWithCompletionHandler:(id)a3
{
}

- (id)createFullScreenVideoViewController
{
  return 0;
}

- (BOOL)usesCustomFullScreenImplementation
{
  return 0;
}

- (void)resetToPlaceholderView
{
  [(LPVisualMediaView *)self didChangePlayingState:0];
  dispatch_time_t v3 = [(LPVisualMediaView *)self _createPosterFrameView];
  videoPlaceholderView = self->_videoPlaceholderView;
  self->_videoPlaceholderView = v3;

  [(UIView *)self->_containerView _lp_insertSubview:self->_videoPlaceholderView belowSubview:self->_playButtonContainerView];
  [(UIView *)self->_playbackView removeFromSuperview];
  playbackView = self->_playbackView;
  self->_playbackView = 0;

  [(UIView *)self->_pulsingLoadView removeFromSuperview];
  pulsingLoadView = self->_pulsingLoadView;
  self->_pulsingLoadView = 0;

  [(UIImageView *)self->_muteButtonView removeFromSuperview];
  muteButtonView = self->_muteButtonView;
  self->_muteButtonView = 0;

  [(UIView *)self->_muteButtonContainerView removeFromSuperview];
  muteButtonContainerView = self->_muteButtonContainerView;
  self->_muteButtonContainerView = 0;

  [(LPVisualMediaView *)self destroyFullScreenViewController];
  self->_wasPlayingWhenSuspended = 0;
  self->_BOOL wasPlayingOrWaitingToPlayWhenUnparented = 0;
  self->_waitingForPlayback = 0;
  self->_BOOL playing = 0;
  self->_fullScreen = 0;
  [(LPVisualMediaView *)self setHidden:0];
  [(UIView *)self _lp_setNeedsLayout];
  id v9 = [(LPComponentView *)self host];
  [v9 componentViewDidChangeMediaState:self];
}

- (void)removePlaceholderViews
{
  [(UIView *)self->_videoPlaceholderView removeFromSuperview];
  videoPlaceholderView = self->_videoPlaceholderView;
  self->_videoPlaceholderView = 0;

  [(UIView *)self->_pulsingLoadView removeFromSuperview];
  pulsingLoadView = self->_pulsingLoadView;
  self->_pulsingLoadView = 0;
}

- (void)didChangePlayingState:(BOOL)a3
{
  if (self->_playing != a3)
  {
    BOOL v3 = a3;
    if (a3)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __43__LPVisualMediaView_didChangePlayingState___block_invoke;
      v7[3] = &unk_1E5B04DF0;
      v7[4] = self;
      [(LPVisualMediaView *)self prepareForDisplayWithCompletionHandler:v7];
    }
    self->_BOOL playing = v3;
    [(UIView *)self _lp_setNeedsLayout];
    id v5 = +[LPMediaPlaybackManager shared];
    [v5 mediaPlayer:self didChangePlayingState:v3];

    double v6 = [(LPComponentView *)self host];
    [v6 componentViewDidChangeMediaState:self];
  }
}

uint64_t __43__LPVisualMediaView_didChangePlayingState___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) removePlaceholderViews];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 566)) {
    *(unsigned char *)(v3 + 566) = 1;
  }
  return result;
}

- (void)didEncounterPlaybackError
{
  self->_waitingForPlayback = 0;
  [(LPVisualMediaView *)self removePlaceholderViews];
}

- (void)didEncounterPossiblyTransientPlaybackError
{
  self->_waitingForPlayback = 0;
  [(LPVisualMediaView *)self resetToPlaceholderView];
}

- (void)updateMuteButtonWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(LPVisualMediaView *)self isMuted]) {
    +[LPResources muteButton];
  }
  else {
  id v5 = +[LPResources unmuteButton];
  }
  id v13 = [v5 platformImage];

  muteButtonView = self->_muteButtonView;
  if (v3)
  {
    CGFloat v7 = [MEMORY[0x1E4F41A60] replaceDownUpTransition];
    [(UIImageView *)muteButtonView setSymbolImage:v13 withContentTransition:v7];
  }
  else
  {
    [(UIImageView *)self->_muteButtonView setImage:v13];
  }
  double v8 = [(LPVisualMedia *)self->_video properties];
  id v9 = [v8 _overlappingControlsColor];
  double v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  double v12 = v11;

  [(UIImageView *)self->_muteButtonView _lp_setTintColor:v12];
}

- (void)didChangeMutedState:(BOOL)a3
{
  BOOL v3 = a3;
  [(LPVisualMediaView *)self updateMuteButtonWithAnimation:1];
  id v5 = +[LPMediaPlaybackManager shared];
  [v5 mediaPlayer:self didChangeMutedState:v3];
}

- (void)updatePlayButtonVisibility
{
  BOOL playing = self->_playing;
  BOOL v4 = !self->_playing;
  if ([(LPVisualMediaView *)self shouldAutoPlay])
  {
    BOOL v5 = [(LPVisualMediaView *)self hasEverPlayed];
    BOOL v4 = !playing && v5;
  }
  int v6 = [(LPVisualMediaView *)self isWaitingForPlayback];
  if (self->_wasPlayingWhenSuspended)
  {
    CGFloat v7 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v8 = [v7 applicationState];

    if (v8 == 2)
    {
      if (!self->_showingPlayButton) {
        return;
      }
      goto LABEL_14;
    }
  }
  int v9 = v4 & ~v6;
  if (self->_showingPlayButton == v9) {
    return;
  }
  if (!v9)
  {
LABEL_14:
    BOOL v10 = !self->_waitingForPlaybackDueToAutoPlay;
    [(LPVisualMediaView *)self hidePlayButtonAnimated:v10];
    return;
  }

  [(LPVisualMediaView *)self showPlayButtonAnimated:1];
}

- (void)showPlayButtonAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showingPlayButton = 1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__LPVisualMediaView_showPlayButtonAnimated___block_invoke;
  aBlock[3] = &unk_1E5B04DF0;
  aBlock[4] = self;
  BOOL v4 = _Block_copy(aBlock);
  BOOL v5 = v4;
  if (v3) {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:0x20000 delay:v4 options:0 animations:0.2 completion:0.0];
  }
  else {
    (*((void (**)(void *))v4 + 2))(v4);
  }
}

uint64_t __44__LPVisualMediaView_showPlayButtonAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 456) setHidden:0];
  BOOL v2 = [*(id *)(*(void *)(a1 + 32) + 456) layer];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v8[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v8[5] = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v8[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v8[7] = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v8[0] = *MEMORY[0x1E4F39B10];
  v8[1] = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v8[3] = v6;
  [v2 setTransform:v8];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 464), "_lp_setOpacity:", 1.0);
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 496), "_lp_setOpacity:", 1.0);
}

- (void)hidePlayButtonAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showingPlayButton = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__LPVisualMediaView_hidePlayButtonAnimated___block_invoke;
  aBlock[3] = &unk_1E5B04DF0;
  aBlock[4] = self;
  long long v5 = (void (**)(void))_Block_copy(aBlock);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__LPVisualMediaView_hidePlayButtonAnimated___block_invoke_2;
  v7[3] = &unk_1E5B052E0;
  v7[4] = self;
  long long v6 = (void (**)(void *, uint64_t))_Block_copy(v7);
  if (v3)
  {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:v6 completion:0.2];
  }
  else
  {
    v5[2](v5);
    v6[2](v6, 1);
  }
}

uint64_t __44__LPVisualMediaView_hidePlayButtonAnimated___block_invoke(uint64_t a1)
{
  CATransform3DMakeScale(&v5, 0.4, 0.4, 1.0);
  BOOL v2 = [*(id *)(*(void *)(a1 + 32) + 456) layer];
  CATransform3D v4 = v5;
  [v2 setTransform:&v4];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 464), "_lp_setOpacity:", 0.0);
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 496), "_lp_setOpacity:", 0.0);
}

uint64_t __44__LPVisualMediaView_hidePlayButtonAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setHidden:*(unsigned char *)(*(void *)(a1 + 32) + 564) == 0];
}

- (void)showMuteButton
{
  if (!self->_muteButtonView)
  {
    BOOL v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    muteButtonContainerView = self->_muteButtonContainerView;
    self->_muteButtonContainerView = v3;

    CATransform3D v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    muteButtonView = self->_muteButtonView;
    self->_muteButtonView = v5;

    id v11 = +[LPResources muteButton];
    CGFloat v7 = [v11 platformImage];
    [(UIImageView *)self->_muteButtonView setImage:v7];

    [(UIImageView *)self->_muteButtonView setContentMode:1];
    [(UIView *)self->_muteButtonContainerView addSubview:self->_muteButtonView];
    [(LPVisualMediaView *)self updateMuteButtonWithAnimation:0];
    uint64_t v8 = self->_muteButtonContainerView;
    [(LPVisualMediaViewStyle *)self->_style muteButtonOpacity];
    -[UIView _lp_setOpacity:](v8, "_lp_setOpacity:");
    id v12 = (id)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel__muteButtonHighlightLongPressRecognized_];
    [v12 setMinimumPressDuration:0.001];
    [v12 setDelegate:self];
    [(UIView *)self->_muteButtonContainerView addGestureRecognizer:v12];
    int v9 = self->_muteButtonContainerView;
    BOOL v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__muteButtonTapRecognized_];
    [(UIView *)v9 addGestureRecognizer:v10];

    [(UIView *)self->_containerView addSubview:self->_muteButtonContainerView];
    [(UIView *)self->_muteButtonContainerView setUserInteractionEnabled:!self->_allowsUserInteractionWithVideoPlayer];
    [(UIView *)self->_muteButtonContainerView setHidden:self->_allowsUserInteractionWithVideoPlayer];
    [(UIView *)self _lp_setNeedsLayout];
  }
}

- (void)hideMuteButton
{
}

- (void)fadeInMuteButton
{
  muteButtonContainerView = self->_muteButtonContainerView;
  [(LPVisualMediaViewStyle *)self->_style muteButtonOpacity];
  -[UIView _lp_setOpacity:](muteButtonContainerView, "_lp_setOpacity:");
  objc_msgSend(MEMORY[0x1E4F39C90], "_lp_springWithMass:stiffness:damping:", 2.0, 100.0, 50.0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 setKeyPath:@"opacity"];
  [v7 setFromValue:&unk_1EF712660];
  CATransform3D v4 = NSNumber;
  [(LPVisualMediaViewStyle *)self->_style muteButtonOpacity];
  CATransform3D v5 = objc_msgSend(v4, "numberWithDouble:");
  [v7 setToValue:v5];

  long long v6 = [(UIView *)self->_muteButtonContainerView layer];
  [v6 addAnimation:v7 forKey:@"fadeIn"];
}

- (BOOL)shouldShowMuteButton
{
  return 0;
}

- (BOOL)isMuted
{
  return 0;
}

- (id)_createPosterFrameView
{
  if (self->_posterFrame)
  {
    BOOL v3 = [LPImageView alloc];
    CATransform3D v4 = [(LPComponentView *)self host];
    CATransform3D v5 = [(LPImageView *)v3 initWithHost:v4 image:self->_posterFrame properties:0 style:self->_posterFrameStyle];
  }
  else
  {
    CATransform3D v5 = (LPImageView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  }
  long long v6 = [MEMORY[0x1E4FB1618] blackColor];
  [(UIView *)v5 _lp_setBackgroundColor:v6];

  return v5;
}

- (void)setAllowsUserInteractionWithVideoPlayer:(BOOL)a3
{
  BOOL v3 = a3;
  self->_allowsUserInteractionWithVideoPlayer = a3;
  BOOL v5 = !a3;
  [(UIView *)self->_muteButtonContainerView setUserInteractionEnabled:v5];
  [(UIView *)self->_muteButtonContainerView setHidden:v3];
  tapRecognizer = self->_tapRecognizer;

  [(UIGestureRecognizer *)tapRecognizer setEnabled:v5];
}

- (id)playButtonImage
{
  return +[LPResources playButton];
}

- (void)_buildVisualMediaPlaceholderView
{
  BOOL v3 = [(LPVisualMediaView *)self playButtonImage];
  id v25 = [v3 platformImage];

  CATransform3D v4 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  [(UIView *)v4 addTarget:self action:sel_tapRecognized_ forControlEvents:0x2000];
  BOOL v5 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
  long long v6 = [v25 imageWithRenderingMode:2];
  [v5 setImage:v6];

  [v5 setCornerStyle:4];
  id v7 = [MEMORY[0x1E4FB14C8] effectWithStyle:1];
  uint64_t v8 = [v5 background];
  [v8 setVisualEffect:v7];

  int v9 = [(LPVisualMediaViewStyle *)self->_style playButton];
  BOOL v10 = [v9 color];
  [v5 setBaseForegroundColor:v10];

  id v11 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.15];
  [v5 setBaseBackgroundColor:v11];

  id v12 = (void *)MEMORY[0x1E4FB1830];
  id v13 = [(LPVisualMediaViewStyle *)self->_style playButton];
  CGFloat v14 = [v13 size];
  double v15 = [v14 width];
  [v15 value];
  double v16 = objc_msgSend(v12, "configurationWithPointSize:");

  [v5 setPreferredSymbolConfigurationForImage:v16];
  [(UIView *)v4 setPreferredBehavioralStyle:1];
  [(UIView *)v4 setConfiguration:v5];
  [(UIView *)v4 setContentMode:4];
  double v17 = [MEMORY[0x1E4FB1618] blackColor];
  [(UIView *)v4 setTintColor:v17];

  CGRect v18 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  if ([(LPVisualMediaViewConfiguration *)self->_configuration disablePlayback]
    || [(LPVisualMediaViewConfiguration *)self->_configuration disablePlaybackControls])
  {
    CGRect v19 = [(LPVisualMediaViewStyle *)self->_style playButton];
    [v19 disabledOpacity];
    -[UIView setAlpha:](v4, "setAlpha:");
  }
  [(UIView *)v18 addSubview:v4];
  CGRect v20 = [(LPVisualMediaView *)self _createPosterFrameView];
  videoPlaceholderView = self->_videoPlaceholderView;
  self->_videoPlaceholderView = v20;

  [(UIView *)self->_containerView addSubview:self->_videoPlaceholderView];
  [(UIView *)self->_containerView addSubview:v18];
  playButtonContainerView = self->_playButtonContainerView;
  self->_playButtonContainerView = v18;
  double v23 = v18;

  playButtonView = self->_playButtonView;
  self->_playButtonView = v4;
}

- (BOOL)shouldAllowHighlightToRecognizeSimultaneouslyWithGesture:(id)a3
{
  CATransform3D v4 = [a3 view];
  LOBYTE(self) = v4 != self->_muteButtonContainerView;

  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)swapVideoPlaceholderForPlaybackIfNeeded
{
  if (!self->_playbackView) {
    [(LPVisualMediaView *)self _swapVideoPlaceholderForVideoForAutoPlay:0];
  }
}

- (void)tapRecognized:(id)a3
{
  [(LPVisualMediaView *)self userInteractedWithVideoView];
  if (self->_playbackView)
  {
    if (!self->_fullScreen && (self->_playing || self->_waitingForPlayback))
    {
      [(LPVisualMediaView *)self enterFullScreen];
      return;
    }
  }
  else
  {
    [(LPVisualMediaView *)self swapVideoPlaceholderForPlaybackIfNeeded];
  }
  BOOL v4 = !self->_playing;

  [(LPVisualMediaView *)self setPlaying:v4];
}

- (void)destroyFullScreenViewController
{
  [(LPFullScreenVideoController *)self->_fullScreenController dismiss];
  fullScreenController = self->_fullScreenController;
  self->_fullScreenController = 0;
}

- (void)recreateFullScreenViewControllerIfNeeded
{
  if (!self->_fullScreenController)
  {
    BOOL v3 = [(LPVisualMediaView *)self createFullScreenVideoViewController];
    fullScreenController = self->_fullScreenController;
    self->_fullScreenController = v3;
  }
}

- (void)enterFullScreen
{
  if ([(LPVisualMediaView *)self usesCustomFullScreenImplementation])
  {
    [(LPVisualMediaView *)self enterCustomFullScreen];
  }
  else
  {
    self->_fullScreen = 1;
    [(LPVisualMediaView *)self recreateFullScreenViewControllerIfNeeded];
    fullScreenController = self->_fullScreenController;
    [(LPFullScreenVideoController *)fullScreenController present];
  }
}

- (void)fullScreenVideoDidPresent
{
  [(LPVisualMediaView *)self setMuted:0];
  [(LPVisualMediaView *)self setPlaying:1];

  [(LPVisualMediaView *)self setHidden:1];
}

- (void)fullScreenVideoWillDismiss
{
  [(LPVisualMediaView *)self setMuted:1];
  [(LPVisualMediaView *)self setHidden:0];

  [(LPVisualMediaView *)self hideMuteButton];
}

- (void)fullScreenVideoDidDismiss
{
  self->_fullScreen = 0;
}

- (void)_muteButtonHighlightLongPressRecognized:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 state];
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    muteButtonContainerView = self->_muteButtonContainerView;
    [(LPVisualMediaViewStyle *)self->_style muteButtonHighlightedOpacity];
  }
  else
  {
    muteButtonContainerView = self->_muteButtonContainerView;
    [(LPVisualMediaViewStyle *)self->_style muteButtonOpacity];
  }
  -[UIView _lp_setOpacity:](muteButtonContainerView, "_lp_setOpacity:");
LABEL_6:
}

- (void)_muteButtonTapRecognized:(id)a3
{
  [(LPVisualMediaView *)self userInteractedWithVideoView];
  uint64_t v4 = [(LPVisualMediaView *)self isMuted] ^ 1;

  [(LPVisualMediaView *)self setMuted:v4];
}

- (BOOL)isActive
{
  return ![(LPVisualMediaView *)self isMuted];
}

- (void)setActive:(BOOL)a3
{
}

- (BOOL)usesSharedAudioSession
{
  return self->_usesSharedAudioSession;
}

- (BOOL)allowsUserInteractionWithVideoPlayer
{
  return self->_allowsUserInteractionWithVideoPlayer;
}

- (BOOL)isWaitingForPlayback
{
  return self->_waitingForPlayback;
}

- (BOOL)isFullScreen
{
  return self->_fullScreen;
}

- (void)setFullScreen:(BOOL)a3
{
  self->_fullScreen = a3;
}

- (BOOL)hasEverPlayed
{
  return self->_hasEverPlayed;
}

- (void)setHasEverPlayed:(BOOL)a3
{
  self->_hasEverPlayed = a3;
}

- (double)volume
{
  return self->_volume;
}

- (void)setVolume:(double)a3
{
  self->_volume = a3;
}

- (LPVisualMedia)media
{
  return self->_media;
}

- (UIView)playbackView
{
  return self->_playbackView;
}

- (unsigned)loggingID
{
  return self->_loggingID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_media, 0);
  objc_storeStrong((id *)&self->_fullScreenController, 0);
  objc_storeStrong((id *)&self->_playButtonTapRecognizer, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_debugIndicator, 0);
  objc_storeStrong((id *)&self->_playbackView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_pulsingLoadView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_videoPlaceholderView, 0);
  objc_storeStrong((id *)&self->_muteButtonView, 0);
  objc_storeStrong((id *)&self->_muteButtonContainerView, 0);
  objc_storeStrong((id *)&self->_playButtonView, 0);
  objc_storeStrong((id *)&self->_playButtonContainerView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_posterFrameStyle, 0);
  objc_storeStrong((id *)&self->_posterFrame, 0);
  objc_storeStrong((id *)&self->_style, 0);

  objc_storeStrong((id *)&self->_video, 0);
}

@end