@interface CKVideoPlayerBalloonView
- (BOOL)gestureIsOurGesture:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isObservingSceneDisconnects;
- (CKMovieMediaObject)mediaObject;
- (CKReusableVideoPlayer)reusablePlayer;
- (CKVideoPlayerBalloonView)initWithFrame:(CGRect)a3;
- (CKVideoPlayerReusePool)playerPool;
- (NSString)description;
- (UIView)playerView;
- (id)playerItem;
- (id)playerViewController;
- (void)cleanUpPlayerIfNeeded;
- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6;
- (void)doubleTapGestureRecognized:(id)a3;
- (void)layoutSubviews;
- (void)pausePlayback;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)reusablePlayerDidStart;
- (void)reusablePlayerDidStop;
- (void)setMediaObject:(id)a3;
- (void)setObservingSceneDisconnects:(BOOL)a3;
- (void)setPlayerPool:(id)a3;
- (void)setPlayerView:(id)a3;
- (void)setReusablePlayer:(id)a3;
- (void)showPlayerViewController;
- (void)startPlayingInlineVideo;
- (void)tapGestureRecognized:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation CKVideoPlayerBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = a5;
  v11.receiver = self;
  v11.super_class = (Class)CKVideoPlayerBalloonView;
  id v10 = a3;
  [(CKImageBalloonView *)&v11 configureForMediaObject:v10 previewWidth:v7 orientation:v6 hasInvisibleInkEffect:a4];
  -[CKVideoPlayerBalloonView setMediaObject:](self, "setMediaObject:", v10, v11.receiver, v11.super_class);
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CKVideoPlayerBalloonView;
  v4 = [(CKImageBalloonView *)&v8 description];
  v5 = [(CKVideoPlayerBalloonView *)self mediaObject];
  BOOL v6 = [v3 stringWithFormat:@"%@ mediaObject: %@", v4, v5];

  return (NSString *)v6;
}

- (CKVideoPlayerBalloonView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKVideoPlayerBalloonView;
  v3 = -[CKImageBalloonView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CKBalloonView *)v3 doubleTapGestureRecognizer];
    [v5 setDelegate:v4];

    BOOL v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v4 selector:sel_applicationDidEnterBackground_ name:*MEMORY[0x1E4F43710] object:0];
  }
  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  if ([(CKVideoPlayerBalloonView *)self gestureIsOurGesture:a3]
    && ([(CKVideoPlayerBalloonView *)self playerView],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    [v6 preciseLocationInView:self];
    objc_super v8 = -[CKVideoPlayerBalloonView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
    objc_opt_class();
    char v9 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v9 = 1;
  }

  return v9 & 1;
}

- (BOOL)gestureIsOurGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(CKBalloonView *)self doubleTapGestureRecognizer];
  if (v5 == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v6 = [(CKBalloonView *)self tapGestureRecognizer];
    BOOL v7 = v6 == v4;
  }
  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = [(CKVideoPlayerBalloonView *)self gestureIsOurGesture:v7];
  if (v9)
  {
    id v4 = [v8 view];
    if ([v4 isDescendantOfView:self])
    {
      char v10 = 1;
LABEL_10:

      goto LABEL_11;
    }
    if (![(CKVideoPlayerBalloonView *)self gestureIsOurGesture:v8])
    {
      char v10 = 0;
      goto LABEL_10;
    }
LABEL_7:
    objc_super v11 = [v7 view];
    char v10 = [v11 isDescendantOfView:self];

    if (!v9) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if ([(CKVideoPlayerBalloonView *)self gestureIsOurGesture:v8]) {
    goto LABEL_7;
  }
  char v10 = 0;
LABEL_11:

  return v10;
}

- (void)reusablePlayerDidStart
{
  id v2 = [(CKBalloonView *)self invisibleInkEffectController];
  [v2 setSuspended:1];
}

- (void)reusablePlayerDidStop
{
  id v2 = [(CKBalloonView *)self invisibleInkEffectController];
  [v2 setSuspended:0];
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)CKVideoPlayerBalloonView;
  [(CKImageBalloonView *)&v21 layoutSubviews];
  [(CKVideoPlayerBalloonView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(CKBalloonView *)self canUseOpaqueMask])
  {
    objc_super v11 = +[CKUIBehavior sharedBehaviors];
    [(CKBalloonView *)self balloonDescriptor];
    [v11 balloonMaskFrameInsetsWithBalloonShape:v20];
    double v4 = v4 - v12;
    double v6 = v6 - v13;
    double v8 = v8 + v12 + v14;
    double v10 = v10 + v13 + v15;
  }
  v16 = [(CKImageBalloonView *)self tailMask];
  objc_msgSend(v16, "setFrame:", v4, v6, v8, v10);

  v17 = [(CKImageBalloonView *)self outlineMask];
  objc_msgSend(v17, "setFrame:", v4, v6, v8, v10);

  v18 = [(CKImageBalloonView *)self tailMask];
  [(CKVideoPlayerBalloonView *)self bringSubviewToFront:v18];

  v19 = [(CKImageBalloonView *)self outlineMask];
  [(CKVideoPlayerBalloonView *)self bringSubviewToFront:v19];
}

- (void)prepareForReuse
{
  [(CKVideoPlayerBalloonView *)self cleanUpPlayerIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)CKVideoPlayerBalloonView;
  [(CKImageBalloonView *)&v3 prepareForReuse];
}

- (void)willMoveToWindow:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKVideoPlayerBalloonView;
  [(CKVideoPlayerBalloonView *)&v3 willMoveToWindow:a3];
}

- (void)prepareForDisplay
{
  v5.receiver = self;
  v5.super_class = (Class)CKVideoPlayerBalloonView;
  [(CKImageBalloonView *)&v5 prepareForDisplay];
  objc_super v3 = +[CKAudioSessionController shareInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__CKVideoPlayerBalloonView_prepareForDisplay__block_invoke;
  v4[3] = &unk_1E5620C40;
  v4[4] = self;
  [v3 activateWithOptions:8 completion:v4];
}

void __45__CKVideoPlayerBalloonView_prepareForDisplay__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) playerPool];
  objc_super v3 = [*(id *)(a1 + 32) mediaObject];
  double v4 = [v3 transferGUID];
  id obj = [v2 existingVideoPlayerForTransferGUID:v4];

  objc_super v5 = obj;
  if (obj)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 824), obj);
    [*(id *)(a1 + 32) showPlayerViewController];
    objc_super v5 = obj;
  }
}

- (CKReusableVideoPlayer)reusablePlayer
{
  reusablePlayer = self->_reusablePlayer;
  if (!reusablePlayer)
  {
    double v4 = [(CKVideoPlayerBalloonView *)self playerPool];
    objc_super v5 = [v4 dequeueAvailableVideoPlayer];
    double v6 = self->_reusablePlayer;
    self->_reusablePlayer = v5;

    double v7 = [(CKMediaObject *)self->_mediaObject transferGUID];
    [(CKReusableVideoPlayer *)self->_reusablePlayer setVideoTransferGUID:v7];

    double v8 = [(CKReusableVideoPlayer *)self->_reusablePlayer playerViewController];
    [v8 setAllowsPictureInPicturePlayback:1];

    double v9 = self->_reusablePlayer;
    double v10 = [(CKVideoPlayerBalloonView *)self playerItem];
    [(CKReusableVideoPlayer *)v9 configureWithPlayerItem:v10];

    [(CKReusableVideoPlayer *)self->_reusablePlayer setDelegate:self];
    reusablePlayer = self->_reusablePlayer;
  }

  return reusablePlayer;
}

- (void)tapGestureRecognized:(id)a3
{
  id v4 = a3;
  if (![(CKObscurableBalloonView *)self isObscured])
  {
    if (self->_playerView && CKIsRunningInMacCatalyst())
    {
      v36.receiver = self;
      v36.super_class = (Class)CKVideoPlayerBalloonView;
      [(CKImageBalloonView *)&v36 tapGestureRecognized:v4];
      goto LABEL_19;
    }
    objc_super v5 = +[CKUIBehavior sharedBehaviors];
    double v6 = [v5 playButtonImage];

    [(CKVideoPlayerBalloonView *)self bounds];
    -[CKVideoPlayerBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [v6 size];
    double v16 = v15;
    double v18 = v17;
    if (CKMainScreenScale_once_24 != -1) {
      dispatch_once(&CKMainScreenScale_once_24, &__block_literal_global_55);
    }
    double v19 = *(double *)&CKMainScreenScale_sMainScreenScale_24;
    char v20 = +[CKUIBehavior sharedBehaviors];
    if ([v20 playsInlineVideo])
    {
      if (v19 == 0.0) {
        double v21 = 1.0;
      }
      else {
        double v21 = v19;
      }
      double v22 = 1.0 / v21;
      double v23 = v16 * v21;
      CGFloat v24 = 1.0 / v21 * (v8 * v21 + floor((v12 * v21 - v16 * v21) * 0.5));
      double v25 = v10 * v21;
      double v26 = v14 * v21;
      double v27 = v18 * v21;
      CGFloat v28 = v22 * (v25 + floor((v26 - v27) * 0.5));
      CGFloat v29 = v23 * v22;
      CGFloat v30 = v27 * v22;
      [v4 locationInView:self];
      v38.x = v31;
      v38.y = v32;
      v39.origin.x = v24;
      v39.origin.y = v28;
      v39.size.width = v29;
      v39.size.height = v30;
      BOOL v33 = CGRectContainsPoint(v39, v38);

      if (v33)
      {
        [(CKVideoPlayerBalloonView *)self startPlayingInlineVideo];
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
    }
    if (CKIsRunningInMacCatalyst())
    {
      v35.receiver = self;
      v35.super_class = (Class)CKVideoPlayerBalloonView;
      [(CKImageBalloonView *)&v35 tapGestureRecognized:v4];
    }
    else
    {
      v34 = [(CKVideoPlayerBalloonView *)self playerViewController];
      [v34 showFullScreenPresentationFromView:self completion:0];
    }
    goto LABEL_18;
  }
  v37.receiver = self;
  v37.super_class = (Class)CKVideoPlayerBalloonView;
  [(CKImageBalloonView *)&v37 tapGestureRecognized:v4];
LABEL_19:
}

- (void)doubleTapGestureRecognized:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CKVideoPlayerBalloonView *)self reusablePlayer];
  char v6 = [v5 isPictureInPictureActive];

  if ((v6 & 1) == 0)
  {
    double v7 = [(CKVideoPlayerBalloonView *)self playerViewController];
    double v8 = [v7 player];
    [v8 pause];
  }
  v9.receiver = self;
  v9.super_class = (Class)CKVideoPlayerBalloonView;
  [(CKBalloonView *)&v9 doubleTapGestureRecognized:v4];
}

- (void)pausePlayback
{
  id v3 = [(CKVideoPlayerBalloonView *)self playerViewController];
  id v2 = [v3 player];
  [v2 pause];
}

- (void)cleanUpPlayerIfNeeded
{
  if (self->_reusablePlayer)
  {
    id v3 = [(CKVideoPlayerBalloonView *)self reusablePlayer];
    [v3 willDisappear];

    id v4 = [(CKVideoPlayerBalloonView *)self reusablePlayer];
    int v5 = [v4 isReadyForReuse];

    if (v5)
    {
      char v6 = [(CKVideoPlayerBalloonView *)self reusablePlayer];
      double v7 = [v6 playerViewController];
      double v8 = [v7 player];
      [v8 pause];
    }
  }
  id v14 = [(CKVideoPlayerBalloonView *)self playerView];
  objc_super v9 = [v14 superview];

  if (v9 == self)
  {
    double v10 = [(CKVideoPlayerBalloonView *)self playerViewController];
    [v10 willMoveToParentViewController:0];

    [v14 removeFromSuperview];
    double v11 = [(CKVideoPlayerBalloonView *)self playerViewController];
    [v11 removeFromParentViewController];
  }
  if (self->_reusablePlayer)
  {
    double v12 = [(CKVideoPlayerBalloonView *)self playerPool];
    double v13 = [(CKVideoPlayerBalloonView *)self reusablePlayer];
    [v12 returnPlayerToPool:v13];
  }
  [(CKVideoPlayerBalloonView *)self setReusablePlayer:0];
  [(CKVideoPlayerBalloonView *)self setPlayerView:0];
}

- (void)showPlayerViewController
{
  id v3 = [(CKBalloonView *)self delegate];
  int v4 = [v3 conformsToProtocol:&unk_1EDF9A680];

  if (v4)
  {
    int v5 = [(CKBalloonView *)self delegate];
    char v6 = [(CKVideoPlayerBalloonView *)self reusablePlayer];
    double v7 = [v5 parentViewControllerForReusableVideoPlayer:v6];

    double v8 = [(CKVideoPlayerBalloonView *)self playerViewController];
    objc_super v9 = +[CKUIBehavior sharedBehaviors];
    [v9 defaultAVPlayerViewContorllerControlsInsets];
    uint64_t v11 = v10;
    double v13 = v12;
    uint64_t v15 = v14;
    double v17 = v16;

    if ([(CKBalloonView *)self hasTail])
    {
      double v18 = +[CKUIBehavior sharedBehaviors];
      [v18 balloonMaskTailWidth];
      double v20 = v19;

      [(CKBalloonView *)self balloonDescriptor];
      double v21 = v13 + v20;
      if (v26) {
        double v21 = v13;
      }
      if (v26 == 1) {
        double v17 = v17 + v20;
      }
      else {
        double v13 = v21;
      }
    }
    v25[0] = v11;
    *(double *)&v25[1] = v13;
    v25[2] = v15;
    *(double *)&v25[3] = v17;
    double v22 = [MEMORY[0x1E4F29238] valueWithBytes:v25 objCType:"{UIEdgeInsets=dddd}"];
    [v8 setOverrideLayoutMarginsWhenEmbeddedInline:v22];

    [v7 addChildViewController:v8];
    double v23 = [v8 view];
    [(CKVideoPlayerBalloonView *)self setPlayerView:v23];

    [v8 didMoveToParentViewController:v7];
    CGFloat v24 = [(CKBalloonView *)self invisibleInkEffectController];
    [v24 setSuspended:1];
  }
}

- (void)startPlayingInlineVideo
{
  [(CKVideoPlayerBalloonView *)self showPlayerViewController];
  id v3 = +[CKAudioSessionController shareInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__CKVideoPlayerBalloonView_startPlayingInlineVideo__block_invoke;
  v4[3] = &unk_1E5620C40;
  v4[4] = self;
  [v3 activateWithOptions:8 completion:v4];
}

void __51__CKVideoPlayerBalloonView_startPlayingInlineVideo__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) playerViewController];
  v1 = [v2 player];
  [v1 play];
}

- (id)playerViewController
{
  id v2 = [(CKVideoPlayerBalloonView *)self reusablePlayer];
  id v3 = [v2 playerViewController];

  return v3;
}

- (CKVideoPlayerReusePool)playerPool
{
  playerPool = self->_playerPool;
  if (playerPool) {
    goto LABEL_4;
  }
  int v4 = [(CKBalloonView *)self delegate];
  int v5 = [v4 conformsToProtocol:&unk_1EDF9A680];

  if (v5)
  {
    char v6 = [(CKBalloonView *)self delegate];
    double v7 = [v6 videoPlayerReusePool];
    double v8 = self->_playerPool;
    self->_playerPool = v7;

    playerPool = self->_playerPool;
LABEL_4:
    objc_super v9 = playerPool;
    goto LABEL_6;
  }
  objc_super v9 = 0;
LABEL_6:

  return v9;
}

- (id)playerItem
{
  id v2 = [(CKVideoPlayerBalloonView *)self mediaObject];
  id v3 = [v2 fileURL];

  int v4 = CKAVURLAssetForURL(v3);
  int v5 = [MEMORY[0x1E4F16620] playerItemWithAsset:v4];

  return v5;
}

- (void)setPlayerView:(id)a3
{
  int v5 = (UIView *)a3;
  p_playerView = &self->_playerView;
  playerView = self->_playerView;
  if (playerView != v5)
  {
    uint64_t v15 = v5;
    if ([(UIView *)playerView isDescendantOfView:self]) {
      [(UIView *)*p_playerView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_playerView, a3);
    if (CKIsRunningInMacCatalyst())
    {
      double v8 = [MEMORY[0x1E4F428B8] clearColor];
      [(UIView *)*p_playerView setBackgroundColor:v8];
    }
    else
    {
      double v8 = +[CKUIBehavior sharedBehaviors];
      objc_super v9 = [v8 theme];
      uint64_t v10 = [v9 transcriptBackgroundColor];
      [(UIView *)*p_playerView setBackgroundColor:v10];
    }
    uint64_t v11 = [(CKBalloonView *)self invisibleInkEffectController];
    double v12 = [v11 effectView];

    double v13 = *p_playerView;
    if (v12) {
      [(CKVideoPlayerBalloonView *)self insertSubview:v13 belowSubview:v12];
    }
    else {
      [(CKVideoPlayerBalloonView *)self addSubview:v13];
    }
    uint64_t v14 = *p_playerView;
    [(CKVideoPlayerBalloonView *)self bounds];
    -[UIView setFrame:](v14, "setFrame:");
    [(UIView *)*p_playerView setAutoresizingMask:18];
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
    [(UIView *)*p_playerView setAlpha:1.0];

    int v5 = v15;
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKVideoPlayerBalloonView;
  [(CKBalloonView *)&v7 traitCollectionDidChange:a3];
  if (self->_playerView)
  {
    int v4 = +[CKUIBehavior sharedBehaviors];
    int v5 = [v4 theme];
    char v6 = [v5 transcriptBackgroundColor];
    [(UIView *)self->_playerView setBackgroundColor:v6];
  }
}

- (CKMovieMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (void)setMediaObject:(id)a3
{
}

- (UIView)playerView
{
  return self->_playerView;
}

- (void)setReusablePlayer:(id)a3
{
}

- (void)setPlayerPool:(id)a3
{
}

- (BOOL)isObservingSceneDisconnects
{
  return self->_observingSceneDisconnects;
}

- (void)setObservingSceneDisconnects:(BOOL)a3
{
  self->_observingSceneDisconnects = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPool, 0);
  objc_storeStrong((id *)&self->_reusablePlayer, 0);
  objc_storeStrong((id *)&self->_playerView, 0);

  objc_storeStrong((id *)&self->_mediaObject, 0);
}

@end