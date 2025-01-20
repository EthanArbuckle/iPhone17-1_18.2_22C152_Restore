@interface AVNewsWidgetPlayerBehaviorContext
- (AVNewsWidgetPlayerBehavior)behavior;
- (AVNewsWidgetPlayerBehaviorContext)initWithAVKitOwner:(id)a3;
- (AVPlaybackContentTransitioningView)contentTransitionView;
- (AVPlayer)contentTransitioningPlayer;
- (AVPlayerViewController)playerViewController;
- (BOOL)contentTransitioningView:(id)a3 shouldBeginTransitionWithDirection:(int64_t)a4;
- (BOOL)contentTransitioningViewShouldBeginDragging:(id)a3 locationInView:(CGPoint)a4;
- (BOOL)isContentTransitionInteractive;
- (BOOL)isStartNextContentTransitionButtonEnabled;
- (BOOL)isStartPreviousContentTransitionButtonEnabled;
- (UIView)contentTransitioningOverlayView;
- (UIView)customContentTransitioningInfoPanel;
- (id)contentTransitioningPlayerContentViewForTransition:(id)a3;
- (id)makePlaybackContentContainerWithFrame:(CGRect)a3 activeContentView:(id)a4;
- (int64_t)_transitionDirectionForContentTransitionType:(int64_t)a3;
- (int64_t)activeContentTransitionType;
- (int64_t)contentTransitionTypeForTransitionDirection:(int64_t)a3;
- (void)contentTransitioningViewDidChangeTransitionStatus:(id)a3 oldState:(int64_t)a4 oldTransitionDirection:(int64_t)a5 oldProgress:(double)a6;
- (void)didAddBehavior:(id)a3;
- (void)setBehavior:(id)a3;
- (void)setContentTransitionView:(id)a3;
- (void)setContentTransitioningPlayer:(id)a3;
- (void)setCustomContentTransitioningInfoPanel:(id)a3;
- (void)setStartNextContentTransitionButtonEnabled:(BOOL)a3;
- (void)setStartPreviousContentTransitionButtonEnabled:(BOOL)a3;
- (void)setVideoGravityForTransitioningContent:(id)a3;
- (void)startContentTransition:(int64_t)a3;
- (void)updateStartLeftRightContentTransitionButtonsEnabled;
- (void)viewDidLoad;
- (void)willRemoveBehavior:(id)a3;
@end

@implementation AVNewsWidgetPlayerBehaviorContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentTransitionView, 0);
  objc_storeStrong((id *)&self->_customContentTransitioningInfoPanel, 0);
  objc_storeStrong((id *)&self->_contentTransitioningPlayer, 0);
  objc_destroyWeak((id *)&self->_behavior);

  objc_destroyWeak((id *)&self->_playerViewController);
}

- (void)setContentTransitionView:(id)a3
{
}

- (AVPlaybackContentTransitioningView)contentTransitionView
{
  return self->_contentTransitionView;
}

- (UIView)customContentTransitioningInfoPanel
{
  return self->_customContentTransitioningInfoPanel;
}

- (BOOL)isStartPreviousContentTransitionButtonEnabled
{
  return self->_startPreviousContentTransitionButtonEnabled;
}

- (BOOL)isStartNextContentTransitionButtonEnabled
{
  return self->_startNextContentTransitionButtonEnabled;
}

- (void)setContentTransitioningPlayer:(id)a3
{
}

- (AVPlayer)contentTransitioningPlayer
{
  return self->_contentTransitioningPlayer;
}

- (void)setBehavior:(id)a3
{
}

- (AVNewsWidgetPlayerBehavior)behavior
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_behavior);

  return (AVNewsWidgetPlayerBehavior *)WeakRetained;
}

- (AVPlayerViewController)playerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerViewController);

  return (AVPlayerViewController *)WeakRetained;
}

- (int64_t)contentTransitionTypeForTransitionDirection:(int64_t)a3
{
  v4 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
  v5 = [v4 view];
  uint64_t v6 = [v5 effectiveUserInterfaceLayoutDirection];

  int64_t v7 = 1;
  if (v6 == 1) {
    int64_t v7 = 2;
  }
  int64_t v8 = 1;
  if (v6 != 1) {
    int64_t v8 = 2;
  }
  if (a3 != 2) {
    int64_t v8 = 0;
  }
  if (a3 == 3) {
    return v7;
  }
  else {
    return v8;
  }
}

- (void)contentTransitioningViewDidChangeTransitionStatus:(id)a3 oldState:(int64_t)a4 oldTransitionDirection:(int64_t)a5 oldProgress:(double)a6
{
  id v14 = a3;
  uint64_t v9 = [v14 transitionState];
  [v14 transitionProgress];
  double v11 = v10;
  switch([v14 transitionState])
  {
    case 3:
      if (v9 == a4) {
        goto LABEL_9;
      }
      v12 = [(AVNewsWidgetPlayerBehaviorContext *)self behavior];
      [v12 willBeginContentTransition];
      goto LABEL_14;
    case 4:
      if (v9 == a4) {
        goto LABEL_9;
      }
      v12 = [(AVNewsWidgetPlayerBehaviorContext *)self behavior];
      [v12 willCancelContentTransition];
      goto LABEL_14;
    case 5:
      if (v9 == a4) {
        goto LABEL_15;
      }
      [(AVNewsWidgetPlayerBehaviorContext *)self setContentTransitioningPlayer:0];
      v12 = [(AVNewsWidgetPlayerBehaviorContext *)self behavior];
      [v12 didCancelContentTransition];
      goto LABEL_14;
    case 6:
      if (v9 == a4)
      {
LABEL_9:
        if (v11 == a6) {
          goto LABEL_15;
        }
        v12 = [(AVNewsWidgetPlayerBehaviorContext *)self behavior];
        [v14 transitionProgress];
        objc_msgSend(v12, "didUpdateContentTransitionProgress:");
      }
      else
      {
        v12 = [(AVNewsWidgetPlayerBehaviorContext *)self behavior];
        [v12 willCompleteContentTransition];
      }
LABEL_14:

LABEL_15:

      return;
    case 7:
      if (v9 == a4) {
        goto LABEL_15;
      }
      v13 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
      [v13 activeContentViewDidChange];

      [(AVNewsWidgetPlayerBehaviorContext *)self setContentTransitioningPlayer:0];
      v12 = [(AVNewsWidgetPlayerBehaviorContext *)self behavior];
      [v12 didCompleteContentTransition];
      goto LABEL_14;
    default:
      goto LABEL_15;
  }
}

- (id)contentTransitioningPlayerContentViewForTransition:(id)a3
{
  id v4 = a3;
  v5 = [(AVNewsWidgetPlayerBehaviorContext *)self contentTransitionView];
  uint64_t v6 = [v5 incomingContentView];

  if (v6)
  {
    int64_t v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Content view unexpectedly had incomingContentView.", buf, 2u);
    }
  }
  int64_t v8 = [(AVNewsWidgetPlayerBehaviorContext *)self contentTransitioningPlayer];

  if (!v8)
  {
    uint64_t v9 = _AVLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      _os_log_error_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_ERROR, "contentTransitioningPlayer should never be nil here.", v26, 2u);
    }
  }
  double v10 = [(AVNewsWidgetPlayerBehaviorContext *)self contentTransitioningPlayer];

  if (v10)
  {
    double v11 = [__AVPlayerLayerView alloc];
    v12 = [v4 activeContentView];
    [v12 videoContentFrame];
    v13 = -[__AVPlayerLayerView initWithFrame:](v11, "initWithFrame:");

    id v14 = [(__AVPlayerLayerView *)v13 playerLayer];
    v15 = [(AVNewsWidgetPlayerBehaviorContext *)self contentTransitioningPlayer];
    [v14 setPlayer:v15];

    v16 = [v4 activeContentView];
    v17 = [v16 playerLayerView];
    v18 = [v17 pixelBufferAttributes];
    [(__AVPlayerLayerView *)v13 setPixelBufferAttributes:v18];

    v19 = [v4 activeContentView];
    v20 = [v19 playerLayerView];
    -[__AVPlayerLayerView setVideoGravity:](v13, "setVideoGravity:", [v20 videoGravity]);

    v21 = [AVPlaybackContentContainerView alloc];
    [v4 bounds];
    v22 = -[AVPlaybackContentContainerView initWithFrame:playerLayerView:contentOverlayView:](v21, "initWithFrame:playerLayerView:contentOverlayView:", v13, 0);
    v23 = [(AVNewsWidgetPlayerBehaviorContext *)self contentTransitionView];
    v24 = [v23 activeContentView];
    [v24 videoContentFrame];
    -[AVPlaybackContentContainerView setVideoContentFrame:](v22, "setVideoContentFrame:");
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)contentTransitioningView:(id)a3 shouldBeginTransitionWithDirection:(int64_t)a4
{
  [(AVNewsWidgetPlayerBehaviorContext *)self setContentTransitioningPlayer:0];
  int64_t v6 = [(AVNewsWidgetPlayerBehaviorContext *)self contentTransitionTypeForTransitionDirection:a4];
  if (!v6) {
    return 0;
  }
  int64_t v7 = v6;
  int64_t v8 = [(AVNewsWidgetPlayerBehaviorContext *)self behavior];
  uint64_t v9 = [v8 playerForContentTransitionType:v7];

  [(AVNewsWidgetPlayerBehaviorContext *)self setContentTransitioningPlayer:v9];
  double v10 = [(AVNewsWidgetPlayerBehaviorContext *)self contentTransitioningPlayer];
  BOOL v11 = v10 != 0;

  return v11;
}

- (BOOL)contentTransitioningViewShouldBeginDragging:(id)a3 locationInView:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  int64_t v8 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
  if ([v8 hasActiveTransition])
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    double v10 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    BOOL v11 = [v10 player];

    if (!v11)
    {
      LOBYTE(v9) = 0;
      goto LABEL_7;
    }
    v12 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    v13 = [v12 contentView];
    objc_msgSend(v13, "convertPoint:fromView:", v7, x, y);
    double v15 = v14;
    double v17 = v16;

    v18 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    v19 = [v18 contentView];
    int64_t v8 = objc_msgSend(v19, "hitTest:withEvent:", 0, v15, v17);

    v20 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    v21 = [v20 contentView];
    int v9 = [v21 isViewDescendantOfPlaybackControlsSubview:v8] ^ 1;
  }
LABEL_7:

  return v9;
}

- (id)makePlaybackContentContainerWithFrame:(CGRect)a3 activeContentView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  double v10 = [(AVNewsWidgetPlayerBehaviorContext *)self contentTransitionView];

  if (v10)
  {
    BOOL v11 = _AVLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_error_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_ERROR, "Already had a content transition view, which is unexpected.", v19, 2u);
    }
  }
  v12 = [(AVNewsWidgetPlayerBehaviorContext *)self contentTransitionView];
  [v12 removeFromSuperview];

  v13 = -[AVPlaybackContentTransitioningView initWithFrame:activeContentView:]([AVPlaybackContentTransitioningView alloc], "initWithFrame:activeContentView:", v9, x, y, width, height);
  [(AVPlaybackContentTransitioningView *)v13 setContentTransitioningDelegate:self];
  [(AVNewsWidgetPlayerBehaviorContext *)self setContentTransitionView:v13];
  double v14 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
  double v15 = [v14 _transitionController];
  double v16 = [v15 interactiveGestureTracker];
  double v17 = [(AVPlaybackContentTransitioningView *)v13 panGestureRecognizer];
  [v16 setContentTransitioningViewGestureRecognizer:v17];

  return v13;
}

- (void)viewDidLoad
{
  v3 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
  id v4 = [v3 playbackControlsController];
  [v4 setShowsVideoGravityButton:0];

  v5 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
  int64_t v6 = [v5 playbackControlsController];
  [v6 setPlaybackControlsIncludeStartContentTransitionButtons:1];

  [(AVNewsWidgetPlayerBehaviorContext *)self updateStartLeftRightContentTransitionButtonsEnabled];
  id v7 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
  int64_t v8 = [v7 _transitionController];
  id v9 = [v8 interactiveGestureTracker];
  double v10 = [(AVNewsWidgetPlayerBehaviorContext *)self contentTransitionView];
  BOOL v11 = [v10 panGestureRecognizer];
  [v9 setContentTransitioningViewGestureRecognizer:v11];

  v12 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
  v13 = [v12 view];
  id v24 = [v13 window];

  double v14 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
  double v15 = [v14 contentView];
  objc_msgSend(v15, "setStyleSheetShouldUseCompactFullScreenItemSize:", objc_msgSend(v24, "avkit_isHostedInAnotherProcess"));

  double v16 = [(AVNewsWidgetPlayerBehaviorContext *)self customContentTransitioningInfoPanel];

  if (v16)
  {
    double v17 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    v18 = [v17 contentView];
    [v18 loadPlaybackControlsViewIfNeeded];

    v19 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    v20 = [v19 contentView];
    v21 = [v20 playbackControlsView];
    v22 = [v21 transportControlsView];
    v23 = [(AVNewsWidgetPlayerBehaviorContext *)self customContentTransitioningInfoPanel];
    [v22 setCustomContentTransitioningInfoPanel:v23];
  }
}

- (void)willRemoveBehavior:(id)a3
{
  id v4 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
  int v5 = [v4 isViewLoaded];

  if (v5)
  {
    int64_t v6 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    id v7 = [v6 playbackControlsController];
    [v7 setPlaybackControlsIncludeStartContentTransitionButtons:0];

    int64_t v8 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    id v9 = [v8 contentView];
    double v10 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    BOOL v11 = [v10 contentView];
    v12 = [v11 playbackContentContainerView];
    [v9 setPlaybackContentContainerView:v12];

    v13 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    double v14 = [v13 _transitionController];
    double v15 = [v14 interactiveGestureTracker];
    [v15 setContentTransitioningViewGestureRecognizer:0];

    double v16 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    double v17 = [v16 contentView];
    [v17 setStyleSheetShouldUseCompactFullScreenItemSize:0];

    id v19 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    v18 = [v19 playbackControlsController];
    [v18 setShowsVideoGravityButton:1];
  }
}

- (void)didAddBehavior:(id)a3
{
  id v4 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
  int v5 = [v4 isViewLoaded];

  if (v5)
  {
    int64_t v6 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    id v7 = [v6 playbackControlsController];
    [v7 setShowsVideoGravityButton:0];
  }
  id v30 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
  if ([v30 isViewLoaded])
  {
    int64_t v8 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    id v9 = [v8 contentView];
    double v10 = [v9 playbackContentContainerView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      return;
    }
    v12 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    v13 = [v12 contentView];
    double v14 = [v13 playbackContentContainerView];
    id v30 = [v14 activeContentView];

    double v15 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    double v16 = [v15 contentView];
    [v30 frame];
    double v17 = -[AVNewsWidgetPlayerBehaviorContext makePlaybackContentContainerWithFrame:activeContentView:](self, "makePlaybackContentContainerWithFrame:activeContentView:", v30);
    [v16 setPlaybackContentContainerView:v17];

    v18 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    id v19 = [v18 playbackControlsController];
    [v19 setPlaybackControlsIncludeStartContentTransitionButtons:1];

    [(AVNewsWidgetPlayerBehaviorContext *)self updateStartLeftRightContentTransitionButtonsEnabled];
    v20 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    v21 = [v20 _transitionController];
    v22 = [v21 interactiveGestureTracker];
    v23 = [(AVNewsWidgetPlayerBehaviorContext *)self contentTransitionView];
    id v24 = [v23 panGestureRecognizer];
    [v22 setContentTransitioningViewGestureRecognizer:v24];

    v25 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    v26 = [v25 view];
    v27 = [v26 window];

    v28 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    v29 = [v28 contentView];
    objc_msgSend(v29, "setStyleSheetShouldUseCompactFullScreenItemSize:", objc_msgSend(v27, "avkit_isHostedInAnotherProcess"));
  }
}

- (void)setCustomContentTransitioningInfoPanel:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int64_t v6 = _AVLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    double v16 = "-[AVNewsWidgetPlayerBehaviorContext setCustomContentTransitioningInfoPanel:]";
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v15, 0x16u);
  }

  objc_storeStrong((id *)&self->_customContentTransitioningInfoPanel, a3);
  id v7 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
  int v8 = [v7 isViewLoaded];

  if (v8)
  {
    id v9 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    double v10 = [v9 contentView];
    [v10 loadPlaybackControlsViewIfNeeded];

    BOOL v11 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    v12 = [v11 contentView];
    v13 = [v12 playbackControlsView];
    double v14 = [v13 transportControlsView];
    [v14 setCustomContentTransitioningInfoPanel:v5];
  }
}

- (void)updateStartLeftRightContentTransitionButtonsEnabled
{
  v3 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
  id v4 = [v3 view];
  uint64_t v5 = [v4 effectiveUserInterfaceLayoutDirection];

  int64_t v6 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
  id v7 = [v6 playbackControlsController];
  if (v5) {
    BOOL v8 = [(AVNewsWidgetPlayerBehaviorContext *)self isStartNextContentTransitionButtonEnabled];
  }
  else {
    BOOL v8 = [(AVNewsWidgetPlayerBehaviorContext *)self isStartPreviousContentTransitionButtonEnabled];
  }
  [v7 setStartLeftwardContentTransitionButtonEnabled:v8];

  id v9 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
  double v10 = [v9 playbackControlsController];
  if (v5) {
    BOOL v11 = [(AVNewsWidgetPlayerBehaviorContext *)self isStartPreviousContentTransitionButtonEnabled];
  }
  else {
    BOOL v11 = [(AVNewsWidgetPlayerBehaviorContext *)self isStartNextContentTransitionButtonEnabled];
  }
  [v10 setStartRightwardContentTransitionButtonEnabled:v11];

  if ([(AVNewsWidgetPlayerBehaviorContext *)self isStartNextContentTransitionButtonEnabled]|| [(AVNewsWidgetPlayerBehaviorContext *)self isStartPreviousContentTransitionButtonEnabled])
  {
    objc_initWeak(&location, self);
    v12 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    v13 = [v12 playbackControlsController];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __88__AVNewsWidgetPlayerBehaviorContext_updateStartLeftRightContentTransitionButtonsEnabled__block_invoke;
    v16[3] = &unk_1E5FC3998;
    objc_copyWeak(&v17, &location);
    [v13 setContentTransitionAction:v16];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    id v15 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
    double v14 = [v15 playbackControlsController];
    [v14 setContentTransitionAction:0];
  }
}

void __88__AVNewsWidgetPlayerBehaviorContext_updateStartLeftRightContentTransitionButtonsEnabled__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained activeContentTransitionType];
    int64_t v6 = _AVLog();
    id v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138412290;
        id v9 = v4;
        _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Warning: Attempted to start content transition on a %@, which was already transitioning. Ignoring.", (uint8_t *)&v8, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315394;
        id v9 = "-[AVNewsWidgetPlayerBehaviorContext updateStartLeftRightContentTransitionButtonsEnabled]_block_invoke";
        __int16 v10 = 2048;
        uint64_t v11 = a2;
        _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s %ld", (uint8_t *)&v8, 0x16u);
      }

      [v4 startContentTransition:a2];
    }
  }
}

- (void)setStartPreviousContentTransitionButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v6 = "NO";
    int v7 = 136315650;
    int v8 = "-[AVNewsWidgetPlayerBehaviorContext setStartPreviousContentTransitionButtonEnabled:]";
    __int16 v10 = "startPreviousContentTransitionButtonEnabled";
    __int16 v9 = 2080;
    if (v3) {
      int64_t v6 = "YES";
    }
    __int16 v11 = 2080;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
  }

  self->_startPreviousContentTransitionButtonEnabled = v3;
  [(AVNewsWidgetPlayerBehaviorContext *)self updateStartLeftRightContentTransitionButtonsEnabled];
}

- (void)setStartNextContentTransitionButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v6 = "NO";
    int v7 = 136315650;
    int v8 = "-[AVNewsWidgetPlayerBehaviorContext setStartNextContentTransitionButtonEnabled:]";
    __int16 v10 = "startNextContentTransitionButtonEnabled";
    __int16 v9 = 2080;
    if (v3) {
      int64_t v6 = "YES";
    }
    __int16 v11 = 2080;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
  }

  self->_startNextContentTransitionButtonEnabled = v3;
  [(AVNewsWidgetPlayerBehaviorContext *)self updateStartLeftRightContentTransitionButtonsEnabled];
}

- (BOOL)isContentTransitionInteractive
{
  v2 = [(AVNewsWidgetPlayerBehaviorContext *)self contentTransitionView];
  char v3 = [v2 isTransitionInteractive];

  return v3;
}

- (int64_t)activeContentTransitionType
{
  char v3 = [(AVNewsWidgetPlayerBehaviorContext *)self contentTransitionView];
  uint64_t v4 = [v3 transitionState];

  if ((unint64_t)(v4 - 3) > 4) {
    return 0;
  }
  uint64_t v5 = [(AVNewsWidgetPlayerBehaviorContext *)self contentTransitionView];
  int64_t v6 = -[AVNewsWidgetPlayerBehaviorContext contentTransitionTypeForTransitionDirection:](self, "contentTransitionTypeForTransitionDirection:", [v5 transitionDirection]);

  return v6;
}

- (UIView)contentTransitioningOverlayView
{
  v2 = [(AVNewsWidgetPlayerBehaviorContext *)self contentTransitionView];
  char v3 = [v2 incomingContentView];
  uint64_t v4 = [v3 contentOverlayView];

  return (UIView *)v4;
}

- (int64_t)_transitionDirectionForContentTransitionType:(int64_t)a3
{
  uint64_t v4 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
  uint64_t v5 = [v4 view];
  uint64_t v6 = [v5 effectiveUserInterfaceLayoutDirection];

  int64_t v7 = 2;
  if (v6 != 1) {
    int64_t v7 = 3;
  }
  int64_t v8 = 2;
  if (v6 == 1) {
    int64_t v8 = 3;
  }
  if (a3 != 1) {
    int64_t v8 = 0;
  }
  if (a3 == 2) {
    return v7;
  }
  else {
    return v8;
  }
}

- (void)startContentTransition:(int64_t)a3
{
  id v5 = [(AVNewsWidgetPlayerBehaviorContext *)self contentTransitionView];
  objc_msgSend(v5, "performTransition:", -[AVNewsWidgetPlayerBehaviorContext _transitionDirectionForContentTransitionType:](self, "_transitionDirectionForContentTransitionType:", a3));
}

- (void)setVideoGravityForTransitioningContent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    uint64_t v12 = "-[AVNewsWidgetPlayerBehaviorContext setVideoGravityForTransitioningContent:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v6 = [(AVNewsWidgetPlayerBehaviorContext *)self contentTransitionView];
  int64_t v7 = [v6 incomingContentView];
  int64_t v8 = [v7 playerLayerView];
  [v8 setVideoGravity:AVVideoGravityFromString(v4)];

  __int16 v9 = [(AVNewsWidgetPlayerBehaviorContext *)self playerViewController];
  __int16 v10 = [v9 contentView];
  [v10 setNeedsLayout];
}

- (AVNewsWidgetPlayerBehaviorContext)initWithAVKitOwner:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVNewsWidgetPlayerBehaviorContext;
  id v5 = [(AVNewsWidgetPlayerBehaviorContext *)&v8 init];
  if (v5)
  {
    uint64_t v6 = _AVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v10 = "-[AVNewsWidgetPlayerBehaviorContext initWithAVKitOwner:]";
      __int16 v11 = 1024;
      int v12 = 47;
      __int16 v13 = 2048;
      id v14 = v5;
      _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
    }

    objc_storeWeak((id *)&v5->_playerViewController, v4);
    *(_WORD *)&v5->_startNextContentTransitionButtonEnabled = 257;
  }

  return v5;
}

@end