@interface AVAppStorePlayerView
- (AVAppStorePlayerLayerView)playerLayerView;
- (AVAppStorePlayerView)initWithFrame:(CGRect)a3;
- (AVButton)prominentPlayButton;
- (AVLayoutView)prominentPlayButtonLayoutView;
- (AVMobileChromeControlsStyleSheet)styleSheet;
- (AVObservationController)observationController;
- (AVPlayer)player;
- (AVPlayerViewController)playerViewController;
- (AVPlayerViewControllerDelegate)playerViewControllerDelegate;
- (BOOL)allowsEnteringFullScreen;
- (BOOL)canPausePlaybackWhenExitingFullScreen;
- (BOOL)showsMinimalPlaybackControlsWhenEmbeddedInline;
- (BOOL)showsPlaybackControls;
- (BOOL)updatesNowPlayingInfoCenter;
- (NSMutableDictionary)videoGravityForLayoutClassDictionary;
- (NSString)videoGravity;
- (UIView)contentOverlayView;
- (id)playButtonHandlerForLazyPlayerLoading;
- (int64_t)preferredUnobscuredArea;
- (void)_makeActualVideoViewWithPlayerIfNeeded:(id)a3;
- (void)_makePlayerLayerViewWithPlayer:(id)a3;
- (void)_makePlayerViewControllerWithPlayer:(id)a3;
- (void)_prominentPlayButtonTouchUpInside:(id)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAllowsEnteringFullScreen:(BOOL)a3;
- (void)setCanPausePlaybackWhenExitingFullScreen:(BOOL)a3;
- (void)setClipsToBounds:(BOOL)a3;
- (void)setPlayButtonHandlerForLazyPlayerLoading:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerLayerView:(id)a3;
- (void)setPlayerViewController:(id)a3;
- (void)setPlayerViewControllerDelegate:(id)a3;
- (void)setPreferredUnobscuredArea:(int64_t)a3;
- (void)setProminentPlayButton:(id)a3;
- (void)setProminentPlayButtonLayoutView:(id)a3;
- (void)setShowsMinimalPlaybackControlsWhenEmbeddedInline:(BOOL)a3;
- (void)setShowsPlaybackControls:(BOOL)a3;
- (void)setStyleSheet:(id)a3;
- (void)setUpdatesNowPlayingInfoCenter:(BOOL)a3;
- (void)setVideoGravity:(id)a3;
- (void)setVideoGravity:(id)a3 forLayoutClass:(unint64_t)a4;
- (void)setVideoGravityForLayoutClassDictionary:(id)a3;
@end

@implementation AVAppStorePlayerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_videoGravityForLayoutClassDictionary, 0);
  objc_storeStrong((id *)&self->_playerLayerView, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_storeStrong((id *)&self->_prominentPlayButtonLayoutView, 0);
  objc_storeStrong((id *)&self->_prominentPlayButton, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_destroyWeak((id *)&self->_playerViewControllerDelegate);
  objc_storeStrong(&self->_playButtonHandlerForLazyPlayerLoading, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_contentOverlayView, 0);

  objc_storeStrong((id *)&self->_videoGravity, 0);
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (void)setVideoGravityForLayoutClassDictionary:(id)a3
{
}

- (NSMutableDictionary)videoGravityForLayoutClassDictionary
{
  return self->_videoGravityForLayoutClassDictionary;
}

- (void)setPlayerLayerView:(id)a3
{
}

- (AVAppStorePlayerLayerView)playerLayerView
{
  return self->_playerLayerView;
}

- (void)setStyleSheet:(id)a3
{
}

- (AVMobileChromeControlsStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (void)setProminentPlayButtonLayoutView:(id)a3
{
}

- (AVLayoutView)prominentPlayButtonLayoutView
{
  return self->_prominentPlayButtonLayoutView;
}

- (void)setProminentPlayButton:(id)a3
{
}

- (AVButton)prominentPlayButton
{
  return self->_prominentPlayButton;
}

- (int64_t)preferredUnobscuredArea
{
  return self->_preferredUnobscuredArea;
}

- (void)setPlayerViewController:(id)a3
{
}

- (AVPlayerViewController)playerViewController
{
  return self->_playerViewController;
}

- (AVPlayerViewControllerDelegate)playerViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerViewControllerDelegate);

  return (AVPlayerViewControllerDelegate *)WeakRetained;
}

- (id)playButtonHandlerForLazyPlayerLoading
{
  return self->_playButtonHandlerForLazyPlayerLoading;
}

- (AVPlayer)player
{
  return self->_player;
}

- (UIView)contentOverlayView
{
  return self->_contentOverlayView;
}

- (NSString)videoGravity
{
  return self->_videoGravity;
}

- (BOOL)allowsEnteringFullScreen
{
  return self->_allowsEnteringFullScreen;
}

- (BOOL)canPausePlaybackWhenExitingFullScreen
{
  return self->_canPausePlaybackWhenExitingFullScreen;
}

- (BOOL)showsMinimalPlaybackControlsWhenEmbeddedInline
{
  return self->_showsMinimalPlaybackControlsWhenEmbeddedInline;
}

- (BOOL)updatesNowPlayingInfoCenter
{
  return self->_updatesNowPlayingInfoCenter;
}

- (BOOL)showsPlaybackControls
{
  return self->_showsPlaybackControls;
}

- (void)_prominentPlayButtonTouchUpInside:(id)a3
{
  id v4 = a3;
  v5 = [(AVAppStorePlayerView *)self player];
  [(AVAppStorePlayerView *)self _makeActualVideoViewWithPlayerIfNeeded:v5];

  v6 = [(AVAppStorePlayerView *)self playerViewController];
  v7 = [v6 playButtonHandlerForLazyPlayerLoading];

  if (v7)
  {
    v8 = [(AVAppStorePlayerView *)self playerViewController];
    v9 = [v8 playButtonHandlerForLazyPlayerLoading];
    v9[2]();
  }
  v10 = (void *)MEMORY[0x1E4FB1EB0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__AVAppStorePlayerView__prominentPlayButtonTouchUpInside___block_invoke;
  v13[3] = &unk_1E5FC4698;
  id v14 = v4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__AVAppStorePlayerView__prominentPlayButtonTouchUpInside___block_invoke_2;
  v12[3] = &unk_1E5FC3528;
  v12[4] = self;
  id v11 = v4;
  [v10 animateWithDuration:196608 delay:v13 options:v12 animations:0.2 completion:0.0];
}

uint64_t __58__AVAppStorePlayerView__prominentPlayButtonTouchUpInside___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __58__AVAppStorePlayerView__prominentPlayButtonTouchUpInside___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) prominentPlayButtonLayoutView];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) setProminentPlayButtonLayoutView:0];
  v3 = [*(id *)(a1 + 32) prominentPlayButton];
  [v3 removeFromSuperview];

  id v4 = *(void **)(a1 + 32);

  return [v4 setProminentPlayButton:0];
}

- (void)_makePlayerViewControllerWithPlayer:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = [[AVPlayerViewController alloc] initWithNibName:0 bundle:0];
  [(AVAppStorePlayerView *)self setPlayerViewController:v4];

  BOOL v5 = [(AVAppStorePlayerView *)self showsPlaybackControls];
  v6 = [(AVAppStorePlayerView *)self playerViewController];
  [v6 setShowsPlaybackControls:v5];

  BOOL v7 = [(AVAppStorePlayerView *)self updatesNowPlayingInfoCenter];
  v8 = [(AVAppStorePlayerView *)self playerViewController];
  [v8 setUpdatesNowPlayingInfoCenter:v7];

  BOOL v9 = [(AVAppStorePlayerView *)self showsMinimalPlaybackControlsWhenEmbeddedInline];
  v10 = [(AVAppStorePlayerView *)self playerViewController];
  [v10 setShowsMinimalPlaybackControlsWhenEmbeddedInline:v9];

  BOOL v11 = [(AVAppStorePlayerView *)self canPausePlaybackWhenExitingFullScreen];
  v12 = [(AVAppStorePlayerView *)self playerViewController];
  [v12 setCanPausePlaybackWhenExitingFullScreen:v11];

  BOOL v13 = [(AVAppStorePlayerView *)self allowsEnteringFullScreen];
  id v14 = [(AVAppStorePlayerView *)self playerViewController];
  [v14 setAllowsEnteringFullScreen:v13];

  v15 = [(AVAppStorePlayerView *)self videoGravity];
  v16 = [(AVAppStorePlayerView *)self playerViewController];
  [v16 setVideoGravity:v15];

  v17 = [(AVAppStorePlayerView *)self playerViewControllerDelegate];
  v18 = [(AVAppStorePlayerView *)self playerViewController];
  [v18 setDelegate:v17];

  v19 = [(AVAppStorePlayerView *)self playButtonHandlerForLazyPlayerLoading];
  v20 = [(AVAppStorePlayerView *)self playerViewController];
  [v20 setPlayButtonHandlerForLazyPlayerLoading:v19];

  uint64_t v21 = [(AVAppStorePlayerView *)self clipsToBounds];
  v22 = [(AVAppStorePlayerView *)self playerViewController];
  v23 = [v22 view];
  [v23 setClipsToBounds:v21];

  [(AVAppStorePlayerView *)self _continuousCornerRadius];
  double v25 = v24;
  v26 = [(AVAppStorePlayerView *)self playerViewController];
  v27 = [v26 view];
  [v27 _setContinuousCornerRadius:v25];

  v28 = [(AVAppStorePlayerView *)self layer];
  uint64_t v29 = [v28 maskedCorners];
  v30 = [(AVAppStorePlayerView *)self playerViewController];
  v31 = [v30 view];
  v32 = [v31 layer];
  [v32 setMaskedCorners:v29];

  int64_t v33 = [(AVAppStorePlayerView *)self preferredUnobscuredArea];
  v34 = [(AVAppStorePlayerView *)self playerViewController];
  [v34 setPreferredUnobscuredArea:v33];

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v35 = [(AVAppStorePlayerView *)self videoGravityForLayoutClassDictionary];
  v36 = [v35 allKeys];

  uint64_t v37 = [v36 countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v68 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        uint64_t v42 = [v41 unsignedIntegerValue];
        v43 = [(AVAppStorePlayerView *)self videoGravityForLayoutClassDictionary];
        v44 = [v43 objectForKeyedSubscript:v41];

        v45 = [(AVAppStorePlayerView *)self playerViewController];
        [v45 setVideoGravity:v44 forLayoutClass:v42];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v67 objects:v71 count:16];
    }
    while (v38);
  }

  [(AVAppStorePlayerView *)self bounds];
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;
  double v53 = v52;
  v54 = [(AVAppStorePlayerView *)self playerViewController];
  v55 = [v54 view];
  objc_msgSend(v55, "setFrame:", v47, v49, v51, v53);

  v56 = [(AVAppStorePlayerView *)self player];
  v57 = [(AVAppStorePlayerView *)self playerViewController];
  [v57 setPlayer:v56];

  v58 = [(AVAppStorePlayerView *)self playerViewController];
  v59 = [v58 contentOverlayView];
  v60 = [(AVAppStorePlayerView *)self contentOverlayView];
  [v59 addSubview:v60];

  v61 = [(AVAppStorePlayerView *)self contentOverlayView];
  [v61 setTranslatesAutoresizingMaskIntoConstraints:0];

  v62 = (void *)MEMORY[0x1E4F28DC8];
  v63 = [(AVAppStorePlayerView *)self playerViewController];
  v64 = [v63 contentOverlayView];
  v65 = [(AVAppStorePlayerView *)self contentOverlayView];
  v66 = objc_msgSend(v64, "avkit_constraintsFromCenterAndDimensionAnchorsToCenterAndDimensionAnchorsOfItem:", v65);
  [v62 activateConstraints:v66];
}

- (void)_makePlayerLayerViewWithPlayer:(id)a3
{
  id v4 = a3;
  BOOL v5 = [AVAppStorePlayerLayerView alloc];
  [(AVAppStorePlayerView *)self bounds];
  v6 = -[AVAppStorePlayerLayerView initWithFrame:](v5, "initWithFrame:");
  [(AVAppStorePlayerView *)self setPlayerLayerView:v6];

  id v8 = [(AVAppStorePlayerView *)self playerLayerView];
  BOOL v7 = [v8 layer];
  [v7 setPlayer:v4];
}

- (void)_makeActualVideoViewWithPlayerIfNeeded:(id)a3
{
  id v8 = a3;
  id v4 = [(AVAppStorePlayerView *)self playerViewController];
  if (v4
    || ([(AVAppStorePlayerView *)self playerLayerView],
        (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_3:

    goto LABEL_4;
  }
  if (AVAppStorePlayerViewDisableVideo_onceToken != -1) {
    dispatch_once(&AVAppStorePlayerViewDisableVideo_onceToken, &__block_literal_global_47);
  }
  if (!AVAppStorePlayerViewDisableVideo_AVAppStorePlayerViewDisableVideo)
  {
    if (AVAppStorePlayerViewUsePlayerLayerOnly_onceToken != -1) {
      dispatch_once(&AVAppStorePlayerViewUsePlayerLayerOnly_onceToken, &__block_literal_global_3);
    }
    if (AVAppStorePlayerViewUsePlayerLayerOnly_AVAppStorePlayerViewUsePlayerLayerOnly)
    {
      [(AVAppStorePlayerView *)self _makePlayerLayerViewWithPlayer:v8];
      id v4 = [(AVAppStorePlayerView *)self playerLayerView];
      [(AVAppStorePlayerView *)self insertSubview:v4 atIndex:0];
    }
    else
    {
      [(AVAppStorePlayerView *)self _makePlayerViewControllerWithPlayer:v8];
      id v4 = [(AVAppStorePlayerView *)self playerViewController];
      BOOL v7 = [v4 view];
      [(AVAppStorePlayerView *)self insertSubview:v7 atIndex:0];
    }
    goto LABEL_3;
  }
LABEL_4:
  BOOL v5 = [(AVAppStorePlayerView *)self observationController];
  [v5 stopAllObservation];

  observationController = self->_observationController;
  self->_observationController = 0;
}

- (void)layoutSubviews
{
  v57.receiver = self;
  v57.super_class = (Class)AVAppStorePlayerView;
  [(AVAppStorePlayerView *)&v57 layoutSubviews];
  v3 = [(AVAppStorePlayerView *)self contentOverlayView];
  id v4 = [v3 superview];

  if (v4 == self)
  {
    [(AVAppStorePlayerView *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    BOOL v13 = [(AVAppStorePlayerView *)self contentOverlayView];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    id v14 = [(AVAppStorePlayerView *)self layoutMarginsGuide];
    [v14 layoutFrame];
    double Width = CGRectGetWidth(v58);

    v16 = [(AVAppStorePlayerView *)self layoutMarginsGuide];
    [v16 layoutFrame];
    double Height = CGRectGetHeight(v59);

    v18 = [(AVAppStorePlayerView *)self styleSheet];
    [v18 defaultItemInlineSize];
    double v20 = v19;

    if (v20 < Width) {
      double v20 = Width;
    }
    uint64_t v21 = [(AVAppStorePlayerView *)self styleSheet];
    [v21 maximumProminentPlayButtonDimension];
    double v23 = v22;

    if (v20 >= v23) {
      double v20 = v23;
    }
    double v24 = [(AVAppStorePlayerView *)self styleSheet];
    [v24 minimumProminentPlayButtonDimension];
    double v26 = v25;

    if (v26 >= Height) {
      double Height = v26;
    }
    v27 = [(AVAppStorePlayerView *)self styleSheet];
    [v27 maximumProminentPlayButtonDimension];
    double v29 = v28;

    if (Height >= v29) {
      double v30 = v29;
    }
    else {
      double v30 = Height;
    }
    if (v20 >= v30) {
      double v31 = v30;
    }
    else {
      double v31 = v20;
    }
    [(AVAppStorePlayerView *)self bounds];
    CGFloat v32 = (CGRectGetWidth(v60) - v31) * 0.5;
    [(AVAppStorePlayerView *)self bounds];
    CGFloat v33 = CGRectGetMinX(v61) + v32;
    [(AVAppStorePlayerView *)self bounds];
    CGFloat v34 = (CGRectGetHeight(v62) - v31) * 0.5;
    [(AVAppStorePlayerView *)self bounds];
    CGFloat v35 = v34 + CGRectGetMinY(v63);
    v36 = [(AVAppStorePlayerView *)self prominentPlayButtonLayoutView];
    objc_msgSend(v36, "setFrame:", v33, v35, v31, v31);

    uint64_t v37 = [(AVAppStorePlayerView *)self prominentPlayButton];
    objc_msgSend(v37, "setExtrinsicContentSize:", v31, v31);
  }
  [(AVAppStorePlayerView *)self bounds];
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v46 = [(AVAppStorePlayerView *)self playerLayerView];
  objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

  [(AVAppStorePlayerView *)self bounds];
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  v55 = [(AVAppStorePlayerView *)self playerViewController];
  v56 = [v55 view];
  objc_msgSend(v56, "setFrame:", v48, v50, v52, v54);
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVAppStorePlayerView;
  -[AVAppStorePlayerView _setContinuousCornerRadius:](&v7, sel__setContinuousCornerRadius_);
  double v5 = [(AVAppStorePlayerView *)self playerViewController];
  double v6 = [v5 view];
  [v6 _setContinuousCornerRadius:a3];
}

- (void)setClipsToBounds:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AVAppStorePlayerView;
  -[AVAppStorePlayerView setClipsToBounds:](&v7, sel_setClipsToBounds_);
  double v5 = [(AVAppStorePlayerView *)self playerViewController];
  double v6 = [v5 view];
  [v6 setClipsToBounds:v3];
}

- (void)setPlayButtonHandlerForLazyPlayerLoading:(id)a3
{
  id v4 = a3;
  double v5 = (void *)[v4 copy];
  id playButtonHandlerForLazyPlayerLoading = self->_playButtonHandlerForLazyPlayerLoading;
  self->_id playButtonHandlerForLazyPlayerLoading = v5;

  id v7 = [(AVAppStorePlayerView *)self playerViewController];
  [v7 setPlayButtonHandlerForLazyPlayerLoading:v4];
}

- (void)setVideoGravity:(id)a3 forLayoutClass:(unint64_t)a4
{
  if (a3)
  {
    id v6 = a3;
    id v7 = [(AVAppStorePlayerView *)self videoGravityForLayoutClassDictionary];
    double v8 = [NSNumber numberWithUnsignedInteger:a4];
    [v7 setObject:v6 forKeyedSubscript:v8];

    id v9 = [(AVAppStorePlayerView *)self playerViewController];
    [v9 setVideoGravity:v6 forLayoutClass:a4];
  }
}

- (void)setPlayer:(id)a3
{
  double v5 = (AVPlayer *)a3;
  p_player = &self->_player;
  if (self->_player != v5)
  {
    double v19 = v5;
    objc_storeStrong((id *)p_player, a3);
    id v7 = [(AVAppStorePlayerView *)self playerViewController];
    [v7 setPlayer:v19];

    double v8 = [(AVAppStorePlayerView *)self observationController];
    [v8 stopAllObservation];

    id v9 = [(AVAppStorePlayerView *)self player];
    [v9 rate];
    if (v10 == 0.0)
    {
      if (AVAppStorePlayerViewDisableVideo_onceToken != -1) {
        dispatch_once(&AVAppStorePlayerViewDisableVideo_onceToken, &__block_literal_global_47);
      }
      int v11 = AVAppStorePlayerViewDisableVideo_AVAppStorePlayerViewDisableVideo;

      if (!v11)
      {
        observationController = [(AVAppStorePlayerView *)self playerViewController];
        if (!observationController)
        {
          observationController = [(AVAppStorePlayerView *)self playerLayerView];
          if (!observationController)
          {
            uint64_t v15 = [(AVAppStorePlayerView *)self player];
            if (!v15) {
              goto LABEL_9;
            }
            v16 = (void *)v15;
            v17 = [(AVAppStorePlayerView *)self observationController];

            if (v17) {
              goto LABEL_9;
            }
            v18 = [[AVObservationController alloc] initWithOwner:self];
            observationController = self->_observationController;
            self->_observationController = v18;
          }
        }

LABEL_9:
        BOOL v13 = [(AVAppStorePlayerView *)self observationController];
        id v14 = (id)[v13 startObserving:v19 keyPath:@"rate" observationHandler:&__block_literal_global_24];

        goto LABEL_12;
      }
    }
    else
    {
    }
    p_player = (AVPlayer **)[(AVAppStorePlayerView *)self _makeActualVideoViewWithPlayerIfNeeded:v19];
  }
LABEL_12:

  MEMORY[0x1F4181820](p_player);
}

void __34__AVAppStorePlayerView_setPlayer___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v2 = [v6 player];
  [v2 rate];
  float v4 = v3;

  if (v4 != 0.0)
  {
    double v5 = [v6 player];
    [v6 _makeActualVideoViewWithPlayerIfNeeded:v5];
  }
}

- (void)setPlayerViewControllerDelegate:(id)a3
{
  p_playerViewControllerDelegate = &self->_playerViewControllerDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_playerViewControllerDelegate, v5);
  id v6 = [(AVAppStorePlayerView *)self playerViewController];
  [v6 setDelegate:v5];
}

- (void)setPreferredUnobscuredArea:(int64_t)a3
{
  self->_preferredUnobscuredArea = a3;
  id v4 = [(AVAppStorePlayerView *)self playerViewController];
  [v4 setPreferredUnobscuredArea:a3];
}

- (void)setVideoGravity:(id)a3
{
  objc_storeStrong((id *)&self->_videoGravity, a3);
  id v5 = a3;
  id v6 = [(AVAppStorePlayerView *)self playerViewController];
  [v6 setVideoGravity:v5];
}

- (void)setAllowsEnteringFullScreen:(BOOL)a3
{
  BOOL v3 = a3;
  self->_allowsEnteringFullScreen = a3;
  id v4 = [(AVAppStorePlayerView *)self playerViewController];
  [v4 setAllowsEnteringFullScreen:v3];
}

- (void)setCanPausePlaybackWhenExitingFullScreen:(BOOL)a3
{
  BOOL v3 = a3;
  self->_canPausePlaybackWhenExitingFullScreen = a3;
  id v4 = [(AVAppStorePlayerView *)self playerViewController];
  [v4 setCanPausePlaybackWhenExitingFullScreen:v3];
}

- (void)setShowsMinimalPlaybackControlsWhenEmbeddedInline:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showsMinimalPlaybackControlsWhenEmbeddedInline = a3;
  id v4 = [(AVAppStorePlayerView *)self playerViewController];
  [v4 setShowsMinimalPlaybackControlsWhenEmbeddedInline:v3];
}

- (void)setUpdatesNowPlayingInfoCenter:(BOOL)a3
{
  BOOL v3 = a3;
  self->_updatesNowPlayingInfoCenter = a3;
  id v4 = [(AVAppStorePlayerView *)self playerViewController];
  [v4 setUpdatesNowPlayingInfoCenter:v3];
}

- (void)setShowsPlaybackControls:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showsPlaybackControls = a3;
  id v4 = [(AVAppStorePlayerView *)self playerViewController];
  [v4 setShowsPlaybackControls:v3];
}

- (void)dealloc
{
  BOOL v3 = [(AVAppStorePlayerView *)self observationController];
  [v3 stopAllObservation];

  v4.receiver = self;
  v4.super_class = (Class)AVAppStorePlayerView;
  [(AVAppStorePlayerView *)&v4 dealloc];
}

- (AVAppStorePlayerView)initWithFrame:(CGRect)a3
{
  v29.receiver = self;
  v29.super_class = (Class)AVAppStorePlayerView;
  BOOL v3 = -[AVAppStorePlayerView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (AVAppStorePlayerViewDisableVideo_onceToken != -1) {
      dispatch_once(&AVAppStorePlayerViewDisableVideo_onceToken, &__block_literal_global_47);
    }
    if (AVAppStorePlayerViewDisableVideo_AVAppStorePlayerViewDisableVideo)
    {
      id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      [(AVAppStorePlayerView *)v3 bounds];
      uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
      contentOverlayView = v3->_contentOverlayView;
      v3->_contentOverlayView = (UIView *)v5;

      [(AVAppStorePlayerView *)v3 contentOverlayView];
    }
    else
    {
      id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      videoGravityForLayoutClassDictionary = v3->_videoGravityForLayoutClassDictionary;
      v3->_videoGravityForLayoutClassDictionary = v7;

      uint64_t v9 = +[AVButton buttonWithAccessibilityIdentifier:@"Central Play" isSecondGeneration:0];
      prominentPlayButton = v3->_prominentPlayButton;
      v3->_prominentPlayButton = (AVButton *)v9;

      [(AVButton *)v3->_prominentPlayButton setClampsHitRectInsetsWhenContainedInScrollableView:1];
      [(AVButton *)v3->_prominentPlayButton setImageName:@"play.fill"];
      int v11 = (void *)MEMORY[0x1E4FB08E0];
      uint64_t v12 = *MEMORY[0x1E4FB2928];
      BOOL v13 = [(AVAppStorePlayerView *)v3 traitCollection];
      id v14 = [v11 preferredFontForTextStyle:v12 compatibleWithTraitCollection:v13];
      [(AVButton *)v3->_prominentPlayButton setFullScreenFont:v14];

      [(AVButton *)v3->_prominentPlayButton addTarget:v3 action:sel__prominentPlayButtonTouchUpInside_ forControlEvents:64];
      uint64_t v15 = [AVLayoutView alloc];
      [(AVAppStorePlayerView *)v3 bounds];
      uint64_t v16 = -[AVLayoutView initWithFrame:](v15, "initWithFrame:");
      prominentPlayButtonLayoutView = v3->_prominentPlayButtonLayoutView;
      v3->_prominentPlayButtonLayoutView = (AVLayoutView *)v16;

      [(AVLayoutView *)v3->_prominentPlayButtonLayoutView setShapeStyle:1];
      [(AVView *)v3->_prominentPlayButtonLayoutView setIgnoresTouches:1];
      v18 = [AVMobileChromeControlsStyleSheet alloc];
      double v19 = [MEMORY[0x1E4FB1BA8] mainScreen];
      double v20 = [v19 traitCollection];
      uint64_t v21 = [(AVMobileChromeControlsStyleSheet *)v18 initWithTraitCollection:v20 shouldUseCompactFullScreenSize:0];
      styleSheet = v3->_styleSheet;
      v3->_styleSheet = (AVMobileChromeControlsStyleSheet *)v21;

      id v23 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      [(AVAppStorePlayerView *)v3 bounds];
      uint64_t v24 = objc_msgSend(v23, "initWithFrame:");
      double v25 = v3->_contentOverlayView;
      v3->_contentOverlayView = (UIView *)v24;

      double v26 = [(AVAppStorePlayerView *)v3 contentOverlayView];
      [(AVAppStorePlayerView *)v3 addSubview:v26];

      [(AVAppStorePlayerView *)v3 prominentPlayButtonLayoutView];
    v27 = };
    [(AVAppStorePlayerView *)v3 addSubview:v27];
  }
  return v3;
}

@end