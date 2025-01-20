@interface AVZoomingBehaviorContext
- (AVObservationController)observationController;
- (AVPlaybackContentContainerView)activeContentView;
- (AVPlaybackContentZoomingView)contentZoomingView;
- (AVPlayerViewController)playerViewController;
- (AVZoomingBehavior)behavior;
- (AVZoomingBehaviorContext)initWithAVKitOwner:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)isZoomingEnabled;
- (CGSize)contentAspectRatio;
- (UITapGestureRecognizer)doubleTapGestureRecognizer;
- (id)makePlaybackContentContainerWithFrame:(CGRect)a3 activeContentView:(id)a4;
- (void)_handleDoubleTapGestureRecognizer:(id)a3;
- (void)_updateZoomingView;
- (void)dealloc;
- (void)didAddBehavior:(id)a3;
- (void)didRemoveBehavior:(id)a3;
- (void)setBehavior:(id)a3;
- (void)setContentAspectRatio:(CGSize)a3;
- (void)setContentZoomingView:(id)a3;
- (void)setDoubleTapGestureRecognizer:(id)a3;
- (void)setObservationController:(id)a3;
- (void)setZoomingEnabled:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AVZoomingBehaviorContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_contentZoomingView, 0);
  objc_destroyWeak((id *)&self->_behavior);

  objc_destroyWeak((id *)&self->_playerViewController);
}

- (void)setDoubleTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return self->_doubleTapGestureRecognizer;
}

- (void)setObservationController:(id)a3
{
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (void)setContentZoomingView:(id)a3
{
}

- (AVPlaybackContentZoomingView)contentZoomingView
{
  return self->_contentZoomingView;
}

- (CGSize)contentAspectRatio
{
  double width = self->_contentAspectRatio.width;
  double height = self->_contentAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isZoomingEnabled
{
  return self->_zoomingEnabled;
}

- (void)setBehavior:(id)a3
{
}

- (AVZoomingBehavior)behavior
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_behavior);

  return (AVZoomingBehavior *)WeakRetained;
}

- (AVPlayerViewController)playerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerViewController);

  return (AVPlayerViewController *)WeakRetained;
}

- (void)_updateZoomingView
{
  [(AVZoomingBehaviorContext *)self contentAspectRatio];
  if (v4 == *MEMORY[0x1E4F1DB30] && v3 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v10 = [(AVZoomingBehaviorContext *)self playerViewController];
    v11 = [v10 playerController];
    [v11 contentDimensions];
    double v7 = v12;
    double v9 = v13;
  }
  else
  {
    [(AVZoomingBehaviorContext *)self contentAspectRatio];
    double v7 = v6;
    double v9 = v8;
  }
  if (v7 > 0.0 && v9 > 0.0)
  {
    v14 = [(AVZoomingBehaviorContext *)self contentZoomingView];
    objc_msgSend(v14, "setContentAspectRatio:", v7, v9);
  }
  v15 = [(AVZoomingBehaviorContext *)self contentZoomingView];
  objc_msgSend(v15, "setZoomingEnabled:", -[AVZoomingBehaviorContext isZoomingEnabled](self, "isZoomingEnabled"));

  v16 = [(AVZoomingBehaviorContext *)self doubleTapGestureRecognizer];
  [v16 setEnabled:1];

  v17 = [(AVZoomingBehaviorContext *)self contentZoomingView];
  v18 = [(AVZoomingBehaviorContext *)self playerViewController];
  objc_msgSend(v17, "setFullScreen:", objc_msgSend(v18, "isPresentedFullScreen"));

  if ([(AVZoomingBehaviorContext *)self isZoomingEnabled])
  {
    v19 = [(AVZoomingBehaviorContext *)self playerViewController];
    int v20 = [v19 isViewLoaded];

    if (v20)
    {
      v21 = [(AVZoomingBehaviorContext *)self contentZoomingView];
      v22 = [v21 pinchGestureRecognizer];

      if (v22)
      {
        v23 = [(AVZoomingBehaviorContext *)self contentZoomingView];
        v24 = [v23 pinchGestureRecognizer];
        v25 = [v24 view];
        v26 = [(AVZoomingBehaviorContext *)self playerViewController];
        v27 = [v26 contentView];

        if (v25 != v27)
        {
          v28 = [(AVZoomingBehaviorContext *)self playerViewController];
          v29 = [v28 contentView];
          v30 = [(AVZoomingBehaviorContext *)self contentZoomingView];
          v31 = [v30 pinchGestureRecognizer];
          [v29 addGestureRecognizer:v31];

          v32 = [(AVZoomingBehaviorContext *)self playerViewController];
          v33 = [v32 contentView];
          v34 = [(AVZoomingBehaviorContext *)self contentZoomingView];
          v35 = [v34 panGestureRecognizer];
          [v33 addGestureRecognizer:v35];
        }
      }
      id v39 = +[AVKitGlobalSettings shared];
      if (([v39 secondGenerationPlayerEnabled] & 1) == 0)
      {
        v36 = [(AVZoomingBehaviorContext *)self doubleTapGestureRecognizer];

        if (v36) {
          return;
        }
        id v39 = (id)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleDoubleTapGestureRecognizer_];
        v37 = [(AVZoomingBehaviorContext *)self playerViewController];
        v38 = [v37 contentView];
        [v38 addGestureRecognizer:v39];

        [v39 setNumberOfTapsRequired:2];
        [v39 setDelegate:self];
        [(AVZoomingBehaviorContext *)self setDoubleTapGestureRecognizer:v39];
      }
    }
  }
}

- (void)_handleDoubleTapGestureRecognizer:(id)a3
{
  id v4 = a3;
  v5 = [(AVZoomingBehaviorContext *)self contentZoomingView];
  [v4 locationInView:v5];
  uint64_t v7 = v6;
  uint64_t v9 = v8;

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__AVZoomingBehaviorContext__handleDoubleTapGestureRecognizer___block_invoke;
  v10[3] = &unk_1E5FC36E8;
  v10[4] = self;
  v10[5] = v7;
  v10[6] = v9;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:327680 delay:v10 options:0 animations:0.3 completion:0.0];
}

void __62__AVZoomingBehaviorContext__handleDoubleTapGestureRecognizer___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contentZoomingView];
  objc_msgSend(v2, "zoomToPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = [(AVZoomingBehaviorContext *)self doubleTapGestureRecognizer];

  return v6 == v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 view];
  uint64_t v9 = [v7 view];

  [v6 locationInView:v9];
  double v11 = v10;
  double v13 = v12;

  v14 = objc_msgSend(v8, "hitTest:withEvent:", 0, v11, v13);

  v15 = [(AVZoomingBehaviorContext *)self playerViewController];
  v16 = [v15 contentView];
  LOBYTE(v8) = [v16 isViewDescendantOfPlaybackControlsSubview:v14] ^ 1;

  return (char)v8;
}

- (void)didRemoveBehavior:(id)a3
{
  id v4 = [(AVZoomingBehaviorContext *)self contentZoomingView];
  id v5 = [(AVZoomingBehaviorContext *)self playerViewController];
  id v6 = [v5 contentView];
  id v7 = [v6 playbackContentContainerView];

  if (v4 == v7)
  {
    uint64_t v8 = [(AVZoomingBehaviorContext *)self playerViewController];
    uint64_t v9 = [v8 contentView];
    double v10 = [(AVZoomingBehaviorContext *)self contentZoomingView];
    double v11 = [v10 activeContentView];
    [v9 setPlaybackContentContainerView:v11];
  }
  double v12 = [(AVZoomingBehaviorContext *)self doubleTapGestureRecognizer];
  double v13 = [v12 view];
  v14 = [(AVZoomingBehaviorContext *)self doubleTapGestureRecognizer];
  [v13 removeGestureRecognizer:v14];

  v15 = [(AVZoomingBehaviorContext *)self playerViewController];
  LODWORD(v13) = [v15 isViewLoaded];

  if (v13)
  {
    id v17 = [(AVZoomingBehaviorContext *)self playerViewController];
    v16 = [v17 playbackControlsController];
    [v16 setShowsVideoGravityButton:1];
  }
}

- (void)didAddBehavior:(id)a3
{
  id v4 = [(AVZoomingBehaviorContext *)self playerViewController];
  if ([v4 isViewLoaded])
  {
    id v5 = [(AVZoomingBehaviorContext *)self playerViewController];
    id v6 = [v5 contentView];
    id v7 = [v6 playbackContentContainerView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_5;
    }
    uint64_t v9 = [(AVZoomingBehaviorContext *)self playerViewController];
    double v10 = [v9 contentView];
    double v11 = [v10 playbackContentContainerView];
    id v4 = [v11 activeContentView];

    double v12 = [(AVZoomingBehaviorContext *)self playerViewController];
    double v13 = [v12 contentView];
    [v4 frame];
    v14 = -[AVZoomingBehaviorContext makePlaybackContentContainerWithFrame:activeContentView:](self, "makePlaybackContentContainerWithFrame:activeContentView:", v4);
    [v13 setPlaybackContentContainerView:v14];

    v15 = [(AVZoomingBehaviorContext *)self playerViewController];
    v16 = [v15 playbackControlsController];
    [v16 setPlaybackControlsIncludeStartContentTransitionButtons:1];
  }
LABEL_5:
  id v17 = [(AVZoomingBehaviorContext *)self playerViewController];
  v18 = [v17 playbackControlsController];
  [v18 setShowsVideoGravityButton:0];

  [(AVZoomingBehaviorContext *)self _updateZoomingView];
  id v19 = [(AVZoomingBehaviorContext *)self observationController];
  [v19 startObservingNotificationForName:@"AVPlayerControllerContentDimensionsChangedNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_16822];
}

void __43__AVZoomingBehaviorContext_didAddBehavior___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v5 = [a4 object];
  id v6 = [v8 playerViewController];
  id v7 = [v6 playerController];

  if (v5 == v7) {
    [v8 _updateZoomingView];
  }
}

- (void)viewDidLoad
{
  [(AVZoomingBehaviorContext *)self _updateZoomingView];
  id v4 = [(AVZoomingBehaviorContext *)self playerViewController];
  double v3 = [v4 playbackControlsController];
  [v3 setShowsVideoGravityButton:0];
}

- (id)makePlaybackContentContainerWithFrame:(CGRect)a3 activeContentView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  double v10 = [(AVZoomingBehaviorContext *)self contentZoomingView];

  if (v10)
  {
    double v11 = _AVLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v17 = 0;
      _os_log_error_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_ERROR, "Shouldn't already have a contentZooming view.", v17, 2u);
    }
  }
  double v12 = -[AVPlaybackContentZoomingView initWithFrame:activeContentView:]([AVPlaybackContentZoomingView alloc], "initWithFrame:activeContentView:", v9, x, y, width, height);
  double v13 = [v9 playerLayerView];

  if (!v13)
  {
    v14 = [__AVPlayerLayerView alloc];
    [v9 bounds];
    v15 = -[__AVPlayerLayerView initWithFrame:](v14, "initWithFrame:");
    [v9 setPlayerLayerView:v15];

    [v9 layoutIfNeeded];
  }
  [(AVZoomingBehaviorContext *)self setContentZoomingView:v12];

  return v12;
}

- (AVPlaybackContentContainerView)activeContentView
{
  id v2 = [(AVZoomingBehaviorContext *)self contentZoomingView];
  double v3 = [v2 activeContentView];

  return (AVPlaybackContentContainerView *)v3;
}

- (void)setContentAspectRatio:(CGSize)a3
{
  if (a3.width != self->_contentAspectRatio.width || a3.height != self->_contentAspectRatio.height)
  {
    self->_contentAspectRatio = a3;
    [(AVZoomingBehaviorContext *)self _updateZoomingView];
  }
}

- (void)setZoomingEnabled:(BOOL)a3
{
  self->_zoomingEnabled = a3;
  [(AVZoomingBehaviorContext *)self _updateZoomingView];
}

- (void)dealloc
{
  double v3 = [(AVZoomingBehaviorContext *)self observationController];
  [v3 stopAllObservation];

  v4.receiver = self;
  v4.super_class = (Class)AVZoomingBehaviorContext;
  [(AVZoomingBehaviorContext *)&v4 dealloc];
}

- (AVZoomingBehaviorContext)initWithAVKitOwner:(id)a3
{
  id v4 = a3;
  if (self)
  {
    id v5 = objc_storeWeak((id *)&self->_playerViewController, v4);
    [v4 setRequiresImmediateAssetInspection:1];

    id v6 = [[AVObservationController alloc] initWithOwner:self];
    observationController = self->_observationController;
    self->_observationController = v6;

    self->_contentAspectRatio = (CGSize)*MEMORY[0x1E4F1DB30];
    self->_zoomingEnabled = 1;
  }

  return self;
}

@end