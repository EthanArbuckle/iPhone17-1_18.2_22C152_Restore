@interface CKAutoloopMovieBalloonView
+ (BOOL)isEnabled;
+ (id)_autoloopAVAudioSessionQueue;
- (BOOL)_applicationStateAcceptableForLooping;
- (BOOL)_shouldAutoPlay;
- (BOOL)_shouldPauseInitialLooping;
- (BOOL)_shouldPresentQuickLookOnTap;
- (BOOL)_thermalStateAcceptableForLooping;
- (BOOL)isJellyfishVideo;
- (BOOL)isListeningToVideoPlayer;
- (BOOL)isMuted;
- (CKAutoloopMovieBalloonView)initWithFrame:(CGRect)a3;
- (CKMovieMediaObject)mediaObject;
- (ISVideoPlayerUIView)videoPlayer;
- (ISWrappedAVAudioSession)audioSession;
- (ISWrappedAVPlayer)avPlayer;
- (NSString)description;
- (UIImageView)muteButton;
- (UIView)snapshotView;
- (void)_removeSnapshot;
- (void)_thermalStateDidChange:(id)a3;
- (void)avPlayer:(id)a3 itemDidPlayToEnd:(id)a4;
- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForAcknowledgementDismissal;
- (void)prepareForAcknowledgementDisplay;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)previewDidChange:(id)a3;
- (void)setAudioSession:(id)a3;
- (void)setAvPlayer:(id)a3;
- (void)setIsJellyfishVideo:(BOOL)a3;
- (void)setIsListeningToVideoPlayer:(BOOL)a3;
- (void)setIsMuted:(BOOL)a3;
- (void)setMediaObject:(id)a3;
- (void)setMuteButton:(id)a3;
- (void)setSnapshotView:(id)a3;
- (void)setVideoPlayer:(id)a3;
- (void)startListeningToVideoPlayer;
- (void)stopListeningToVideoPlayer;
- (void)tapGestureRecognized:(id)a3;
@end

@implementation CKAutoloopMovieBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CKAutoloopMovieBalloonView;
  id v10 = a3;
  [(CKImageBalloonView *)&v12 configureForMediaObject:v10 previewWidth:v7 orientation:v6 hasInvisibleInkEffect:a4];
  -[CKAutoloopMovieBalloonView setMediaObject:](self, "setMediaObject:", v10, v12.receiver, v12.super_class);
  uint64_t v11 = [v10 isJellyfishVideo];

  [(CKAutoloopMovieBalloonView *)self setIsJellyfishVideo:v11];
}

+ (BOOL)isEnabled
{
  Class v2 = NSClassFromString(&cfstr_Iswrappedavpla.isa);
  if (v2) {
    LOBYTE(v2) = NSClassFromString(&cfstr_Isvideoplayeru.isa) != 0;
  }
  return (char)v2;
}

+ (id)_autoloopAVAudioSessionQueue
{
  if (_autoloopAVAudioSessionQueue_onceToken != -1) {
    dispatch_once(&_autoloopAVAudioSessionQueue_onceToken, &__block_literal_global_168);
  }
  Class v2 = (void *)_autoloopAVAudioSessionQueue_queue;

  return v2;
}

void __58__CKAutoloopMovieBalloonView__autoloopAVAudioSessionQueue__block_invoke()
{
  Class v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MobileSMS.AutoloopAVAudioSessionQueue", v2);
  v1 = (void *)_autoloopAVAudioSessionQueue_queue;
  _autoloopAVAudioSessionQueue_queue = (uint64_t)v0;
}

- (CKAutoloopMovieBalloonView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v29.receiver = self;
  v29.super_class = (Class)CKAutoloopMovieBalloonView;
  uint64_t v7 = -[CKImageBalloonView initWithFrame:](&v29, sel_initWithFrame_);
  if (v7)
  {
    v8 = [MEMORY[0x1E4F8EBC8] auxiliarySession];
    uint64_t v9 = *MEMORY[0x1E4F14F68];
    id v28 = 0;
    [v8 setCategory:v9 error:&v28];
    id v10 = v28;
    if (v10 && IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Failed to change category shared autoloop audio session", v27, 2u);
      }
    }
    [(CKAutoloopMovieBalloonView *)v7 setAudioSession:v8];
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8EBB8]), "initWithFrame:", x, y, width, height);
    videoPlayer = v7->_videoPlayer;
    v7->_videoPlayer = (ISVideoPlayerUIView *)v12;

    v14 = (ISWrappedAVPlayer *)objc_alloc_init(MEMORY[0x1E4F8EBD0]);
    avPlayer = v7->_avPlayer;
    v7->_avPlayer = v14;

    [(ISWrappedAVPlayer *)v7->_avPlayer registerChangeObserver:v7 context:playerObservationContext];
    [(ISWrappedAVPlayer *)v7->_avPlayer setLoopingEnabled:1];
    [(ISWrappedAVPlayer *)v7->_avPlayer setPreventsSleepDuringVideoPlayback:0];
    v16 = v7->_avPlayer;
    v17 = [(CKAutoloopMovieBalloonView *)v7 audioSession];
    [(ISWrappedAVPlayer *)v16 setWrappedAudioSession:v17];

    [(ISVideoPlayerUIView *)v7->_videoPlayer setVideoPlayer:v7->_avPlayer];
    [(CKAutoloopMovieBalloonView *)v7 startListeningToVideoPlayer];
    v18 = v7->_videoPlayer;
    v19 = [(CKImageBalloonView *)v7 tailMask];
    [(CKAutoloopMovieBalloonView *)v7 insertSubview:v18 belowSubview:v19];

    [(ISWrappedAVPlayer *)v7->_avPlayer setDelegate:v7];
    id v20 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v21 = objc_msgSend(v20, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v22 = +[CKUIBehavior sharedBehaviors];
    v23 = [v22 unmuteButtonImage];
    [v21 setImage:v23];

    [(CKAutoloopMovieBalloonView *)v7 setMuteButton:v21];
    [(CKAutoloopMovieBalloonView *)v7 addSubview:v21];
    [(CKAutoloopMovieBalloonView *)v7 setIsMuted:1];
    v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v7 selector:sel__thermalStateDidChange_ name:*MEMORY[0x1E4F287F0] object:0];

    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v7 selector:sel_previewDidChange_ name:@"CKPreviewDidChangeNotification" object:0];
  }
  return v7;
}

- (void)dealloc
{
  [(CKAutoloopMovieBalloonView *)self stopListeningToVideoPlayer];
  v3.receiver = self;
  v3.super_class = (Class)CKAutoloopMovieBalloonView;
  [(CKImageBalloonView *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CKAutoloopMovieBalloonView;
  v4 = [(CKImageBalloonView *)&v8 description];
  v5 = [(CKAutoloopMovieBalloonView *)self mediaObject];
  BOOL v6 = [v3 stringWithFormat:@"%@ mediaObject: %@", v4, v5];

  return (NSString *)v6;
}

- (void)layoutSubviews
{
  v57.receiver = self;
  v57.super_class = (Class)CKAutoloopMovieBalloonView;
  [(CKImageBalloonView *)&v57 layoutSubviews];
  objc_super v3 = [(CKAutoloopMovieBalloonView *)self videoPlayer];
  [(CKAutoloopMovieBalloonView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(CKImageBalloonView *)self imageInsets];
  objc_msgSend(v3, "setFrame:", v5 + v15, v7 + v12, v9 - (v15 + v13), v11 - (v12 + v14));

  v16 = [(CKAutoloopMovieBalloonView *)self videoPlayer];
  if ([(CKImageBalloonView *)self isScheduled])
  {
    v17 = +[CKUIBehavior sharedBehaviors];
    [v17 scheduledImageBalloonAlpha];
    objc_msgSend(v16, "setAlpha:");
  }
  else
  {
    [v16 setAlpha:1.0];
  }

  v18 = [(CKAutoloopMovieBalloonView *)self videoPlayer];
  if ([(CKImageBalloonView *)self isScheduled])
  {
    v19 = [(CKImageBalloonView *)self imageInsetMask];
    [v18 setMaskView:v19];
  }
  else
  {
    [v18 setMaskView:0];
  }

  id v20 = [(CKAutoloopMovieBalloonView *)self muteButton];

  if (v20)
  {
    v21 = [(CKAutoloopMovieBalloonView *)self muteButton];
    [v21 sizeToFit];

    double v22 = *MEMORY[0x1E4F1DB28];
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    v24 = [(CKAutoloopMovieBalloonView *)self muteButton];
    [v24 bounds];
    double v26 = v25;
    double v28 = v27;

    objc_super v29 = +[CKUIBehavior sharedBehaviors];
    v30 = [v29 muteButtonImage];
    [v30 size];
    double v32 = v31;

    v33 = +[CKUIBehavior sharedBehaviors];
    v34 = [v33 unmuteButtonImage];
    [v34 size];
    double v36 = v35;

    if (v32 >= v36) {
      double v37 = v32;
    }
    else {
      double v37 = v36;
    }
    v38 = +[CKUIBehavior sharedBehaviors];
    v39 = [v38 muteButtonImage];
    [v39 size];
    double v41 = v40;

    v42 = +[CKUIBehavior sharedBehaviors];
    v43 = [v42 unmuteButtonImage];
    [v43 size];
    double v45 = v44;

    if (v41 < v45) {
      double v41 = v45;
    }
    v46 = [(CKAutoloopMovieBalloonView *)self muteButton];
    objc_msgSend(v46, "setFrame:", v22, v23, v26, v28);

    v47 = +[CKUIBehavior sharedBehaviors];
    [v47 verticalBalloonBadgeInset];
    double v49 = v41 * 0.5 + v48;

    [(CKAutoloopMovieBalloonView *)self bounds];
    CGFloat v50 = CGRectGetMaxX(v58) - v37 * 0.5;
    v51 = +[CKUIBehavior sharedBehaviors];
    [v51 horizontalBalloonBadgeInset];
    double v53 = v50 - v52;

    if ([(CKBalloonView *)self orientation] == 1)
    {
      v54 = +[CKUIBehavior sharedBehaviors];
      [v54 balloonMaskTailSizeForTailShape:2];
      double v53 = v53 - v55;
    }
    v56 = [(CKAutoloopMovieBalloonView *)self muteButton];
    objc_msgSend(v56, "setCenter:", v53, v49);
  }
}

- (void)setMediaObject:(id)a3
{
  id v6 = a3;
  id v5 = [(CKAutoloopMovieBalloonView *)self mediaObject];

  if (v5 != v6)
  {
    objc_storeStrong((id *)&self->_mediaObject, a3);
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)startListeningToVideoPlayer
{
  if (![(CKAutoloopMovieBalloonView *)self isListeningToVideoPlayer])
  {
    objc_super v3 = [(CKAutoloopMovieBalloonView *)self videoPlayer];
    double v4 = [v3 subviews];
    id v5 = [v4 firstObject];
    id v6 = [v5 layer];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v8 = [(ISVideoPlayerUIView *)self->_videoPlayer subviews];
      double v9 = [v8 firstObject];
      double v10 = [v9 layer];

      [v10 addObserver:self forKeyPath:@"readyForDisplay" options:1 context:0];
    }
    [(CKAutoloopMovieBalloonView *)self setIsListeningToVideoPlayer:1];
  }
}

- (void)stopListeningToVideoPlayer
{
  if ([(CKAutoloopMovieBalloonView *)self isListeningToVideoPlayer])
  {
    objc_super v3 = [(CKAutoloopMovieBalloonView *)self videoPlayer];
    double v4 = [v3 subviews];
    id v5 = [v4 firstObject];
    id v6 = [v5 layer];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v8 = [(CKAutoloopMovieBalloonView *)self videoPlayer];
      double v9 = [v8 subviews];
      double v10 = [v9 firstObject];
      double v11 = [v10 layer];

      [v11 removeObserver:self forKeyPath:@"readyForDisplay"];
    }
    [(CKAutoloopMovieBalloonView *)self setIsListeningToVideoPlayer:0];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a5;
  id v9 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v11 = [v8 objectForKey:@"new"];
    int v12 = [v11 BOOLValue];

    if (v12)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __77__CKAutoloopMovieBalloonView_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_1E5620C40;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __77__CKAutoloopMovieBalloonView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    Class v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "MoviePlayer is ready, clearing content", v5, 2u);
    }
  }
  objc_super v3 = [*(id *)(a1 + 32) layer];
  [v3 setContents:0];

  return [*(id *)(a1 + 32) setImageHidden:1];
}

- (void)prepareForReuse
{
  v8.receiver = self;
  v8.super_class = (Class)CKAutoloopMovieBalloonView;
  [(CKImageBalloonView *)&v8 prepareForReuse];
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(CKAutoloopMovieBalloonView *)self stopListeningToVideoPlayer];
  double v4 = [(CKAutoloopMovieBalloonView *)self videoPlayer];
  [v4 setMaskView:0];

  id v5 = [(CKAutoloopMovieBalloonView *)self videoPlayer];
  [v5 setAlpha:1.0];

  id v6 = [(CKAutoloopMovieBalloonView *)self avPlayer];
  [v6 replaceCurrentItemWithPlayerItem:0];

  double v7 = [(CKAutoloopMovieBalloonView *)self avPlayer];
  [v7 pause];

  [(CKAutoloopMovieBalloonView *)self setIsMuted:1];
  [(CKAutoloopMovieBalloonView *)self setMediaObject:0];
  [(CKAutoloopMovieBalloonView *)self _removeSnapshot];
}

- (void)prepareForDisplay
{
  v26.receiver = self;
  v26.super_class = (Class)CKAutoloopMovieBalloonView;
  [(CKImageBalloonView *)&v26 prepareForDisplay];
  [(CKAutoloopMovieBalloonView *)self stopListeningToVideoPlayer];
  objc_super v3 = [(CKAutoloopMovieBalloonView *)self videoPlayer];
  [v3 removeFromSuperview];

  double v4 = [(CKAutoloopMovieBalloonView *)self mediaObject];

  if (v4)
  {
    if ([(CKAutoloopMovieBalloonView *)self _shouldAutoPlay])
    {
      id v5 = [(CKAutoloopMovieBalloonView *)self mediaObject];
      id v6 = [v5 fileURL];
      double v7 = CKAVURLAssetForURL(v6);

      objc_super v8 = [MEMORY[0x1E4F16620] playerItemWithAsset:v7];
      id v9 = [(CKAutoloopMovieBalloonView *)self avPlayer];
      [v9 setLoopingEnabled:1];

      double v10 = [(CKAutoloopMovieBalloonView *)self avPlayer];
      [v10 replaceCurrentItemWithPlayerItem:v8];

      [(ISWrappedAVPlayer *)self->_avPlayer setSuppressesAudioRendering:1];
      double v11 = [(CKAutoloopMovieBalloonView *)self avPlayer];
      LODWORD(v12) = 1.0;
      [v11 setRate:v12];

      if ([(CKAutoloopMovieBalloonView *)self _shouldPauseInitialLooping]
        || ![(CKAutoloopMovieBalloonView *)self _thermalStateAcceptableForLooping])
      {
        double v13 = [(CKAutoloopMovieBalloonView *)self avPlayer];
        [v13 pause];
      }
    }
    double v14 = [(CKBalloonView *)self invisibleInkEffectController];
    double v15 = [v14 effectView];

    v16 = [(CKAutoloopMovieBalloonView *)self videoPlayer];
    if (v15)
    {
      [(CKAutoloopMovieBalloonView *)self insertSubview:v16 belowSubview:v15];
    }
    else
    {
      v17 = [(CKImageBalloonView *)self tailMask];
      [(CKAutoloopMovieBalloonView *)self insertSubview:v16 belowSubview:v17];
    }
    [(CKAutoloopMovieBalloonView *)self startListeningToVideoPlayer];
  }
  v18 = [(CKAutoloopMovieBalloonView *)self muteButton];

  if (v18)
  {
    BOOL v19 = [(CKAutoloopMovieBalloonView *)self isJellyfishVideo];
    id v20 = +[CKUIBehavior sharedBehaviors];
    v21 = [v20 theme];
    double v22 = v21;
    if (v19) {
      [v21 jellyfishMuteButtonColor];
    }
    else {
    double v23 = [v21 autoloopMuteButtonColor];
    }

    v24 = [(CKAutoloopMovieBalloonView *)self muteButton];
    [v24 setTintColor:v23];

    double v25 = [(CKAutoloopMovieBalloonView *)self muteButton];
    [(CKAutoloopMovieBalloonView *)self bringSubviewToFront:v25];
  }
}

- (void)prepareForAcknowledgementDisplay
{
  if ([(CKAutoloopMovieBalloonView *)self isJellyfishVideo])
  {
    [(CKAutoloopMovieBalloonView *)self setHidden:1];
  }
}

- (void)prepareForAcknowledgementDismissal
{
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)CKAutoloopMovieBalloonView;
  [(CKImageBalloonView *)&v5 didMoveToWindow];
  objc_super v3 = [(CKAutoloopMovieBalloonView *)self window];

  if (v3)
  {
    [(CKAutoloopMovieBalloonView *)self prepareForDisplay];
  }
  else
  {
    double v4 = [(CKAutoloopMovieBalloonView *)self avPlayer];
    [v4 replaceCurrentItemWithPlayerItem:0];
  }
}

- (void)tapGestureRecognized:(id)a3
{
  id v4 = a3;
  [v4 locationInView:self];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  id v9 = [(CKAutoloopMovieBalloonView *)self muteButton];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  if (![(CKAutoloopMovieBalloonView *)self _thermalStateAcceptableForLooping])
  {
    -[CKImageBalloonView tapGestureRecognized:](&v20, sel_tapGestureRecognized_, v4, self, CKAutoloopMovieBalloonView, v21.receiver, v21.super_class, v22.receiver, v22.super_class);
    goto LABEL_11;
  }
  if ([(CKAutoloopMovieBalloonView *)self _shouldPauseInitialLooping])
  {
    kInitialAutoloopWasSuppressed = 1;
    if ([(CKAutoloopMovieBalloonView *)self _shouldPresentQuickLookOnTap])
    {
      v25.origin.double x = v11 + -10.0;
      v25.origin.double y = v13 + -10.0;
      v25.size.double width = v15 + 20.0;
      v25.size.double height = v17 + 20.0;
      v23.double x = v6;
      v23.double y = v8;
      if (!CGRectContainsPoint(v25, v23))
      {
        -[CKImageBalloonView tapGestureRecognized:](&v22, sel_tapGestureRecognized_, v4, v20.receiver, v20.super_class, v21.receiver, v21.super_class, self, CKAutoloopMovieBalloonView);
        goto LABEL_11;
      }
    }
    [(CKAutoloopMovieBalloonView *)self prepareForDisplay];
    v18 = self;
    uint64_t v19 = 0;
  }
  else
  {
    v26.origin.double x = v11 + -10.0;
    v26.origin.double y = v13 + -10.0;
    v26.size.double width = v15 + 20.0;
    v26.size.double height = v17 + 20.0;
    v24.double x = v6;
    v24.double y = v8;
    if (!CGRectContainsPoint(v26, v24))
    {
      -[CKImageBalloonView tapGestureRecognized:](&v21, sel_tapGestureRecognized_, v4, v20.receiver, v20.super_class, self, CKAutoloopMovieBalloonView, v22.receiver, v22.super_class);
      goto LABEL_11;
    }
    uint64_t v19 = [(CKAutoloopMovieBalloonView *)self isMuted] ^ 1;
    v18 = self;
  }
  [(CKAutoloopMovieBalloonView *)v18 setIsMuted:v19];
LABEL_11:
}

- (void)setIsMuted:(BOOL)a3
{
  if (self->_isMuted == a3) {
    return;
  }
  BOOL v3 = a3;
  self->_BOOL isMuted = a3;
  double v5 = [(CKAutoloopMovieBalloonView *)self audioSession];
  CGFloat v6 = [v5 category];
  id v7 = v6;
  if (!v3)
  {

    uint64_t v13 = *MEMORY[0x1E4F14F98];
    if (([v7 isEqualToString:*MEMORY[0x1E4F14F98]] & 1) == 0)
    {
      double v14 = [(CKAutoloopMovieBalloonView *)self audioSession];
      id v41 = 0;
      [v14 setCategory:v13 error:&v41];
      id v15 = v41;

      if (v15 && IMOSLoggingEnabled())
      {
        double v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Failed to change category shared autoloop audio session to AVAudioSessionCategoryPlayback", buf, 2u);
        }
      }
    }
    double v12 = [(CKAutoloopMovieBalloonView *)self audioSession];
    double v17 = [v12 audioSession];
    [v17 setActive:1 error:0];

    goto LABEL_18;
  }
  uint64_t v8 = *MEMORY[0x1E4F14F68];
  char v9 = [v6 isEqualToString:*MEMORY[0x1E4F14F68]];

  if ((v9 & 1) == 0)
  {
    double v10 = [(CKAutoloopMovieBalloonView *)self audioSession];
    id v43 = 0;
    [v10 setCategory:v8 error:&v43];
    id v7 = v43;

    if (v7 && IMOSLoggingEnabled())
    {
      double v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Failed to change category shared autoloop audio session to AVAudioSessionCategoryAmbient", buf, 2u);
      }
    }
    double v12 = [(id)objc_opt_class() _autoloopAVAudioSessionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__CKAutoloopMovieBalloonView_setIsMuted___block_invoke;
    block[3] = &unk_1E5620C40;
    block[4] = self;
    dispatch_async(v12, block);
LABEL_18:
  }
  [(ISWrappedAVPlayer *)self->_avPlayer setSuppressesAudioRendering:v3];
  [(ISWrappedAVPlayer *)self->_avPlayer setActionAtItemEnd:v3 ^ 1];
  BOOL isMuted = self->_isMuted;
  uint64_t v19 = +[CKUIBehavior sharedBehaviors];
  objc_super v20 = v19;
  if (isMuted) {
    [v19 muteButtonImage];
  }
  else {
  objc_super v21 = [v19 unmuteButtonImage];
  }

  objc_super v22 = [MEMORY[0x1E4F431B0] transition];
  [v22 setStyle:3];
  CGPoint v23 = [(CKAutoloopMovieBalloonView *)self muteButton];
  [v23 _setSymbolImage:v21 withSymbolTransition:v22];

  if (!self->_isMuted)
  {
    [(CKAutoloopMovieBalloonView *)self _removeSnapshot];
    CGPoint v24 = [(CKAutoloopMovieBalloonView *)self videoPlayer];
    CGRect v25 = [v24 snapshotViewAfterScreenUpdates:0];

    [(CKAutoloopMovieBalloonView *)self setSnapshotView:v25];
    CGRect v26 = [(CKAutoloopMovieBalloonView *)self videoPlayer];
    [(CKAutoloopMovieBalloonView *)self insertSubview:v25 aboveSubview:v26];

    uint64_t v27 = MEMORY[0x192FBA870]("kCMTimeZero", @"CoreMedia");
    uint64_t v40 = *(void *)(v27 + 16);
    *(_OWORD *)buf = *(_OWORD *)v27;
    avPlayer = self->_avPlayer;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __41__CKAutoloopMovieBalloonView_setIsMuted___block_invoke_110;
    v36[3] = &unk_1E5621EA8;
    id v37 = v25;
    v38 = self;
    long long v34 = *(_OWORD *)buf;
    uint64_t v35 = v40;
    long long v32 = *(_OWORD *)buf;
    uint64_t v33 = v40;
    long long v30 = *(_OWORD *)buf;
    uint64_t v31 = v40;
    id v29 = v25;
    [(ISWrappedAVPlayer *)avPlayer seekToTime:&v34 toleranceBefore:&v32 toleranceAfter:&v30 completionHandler:v36];
  }
  [(CKAutoloopMovieBalloonView *)self setNeedsLayout];
}

void __41__CKAutoloopMovieBalloonView_setIsMuted___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) audioSession];
  v1 = [v2 audioSession];
  [v1 setActive:0 withOptions:1 error:0];
}

void __41__CKAutoloopMovieBalloonView_setIsMuted___block_invoke_110(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__CKAutoloopMovieBalloonView_setIsMuted___block_invoke_2;
  v4[3] = &unk_1E5620AF8;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __41__CKAutoloopMovieBalloonView_setIsMuted___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F42FF0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__CKAutoloopMovieBalloonView_setIsMuted___block_invoke_3;
  v4[3] = &unk_1E5620C40;
  id v5 = *(id *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__CKAutoloopMovieBalloonView_setIsMuted___block_invoke_4;
  v3[3] = &unk_1E5620BF0;
  v3[4] = *(void *)(a1 + 40);
  [v2 animateWithDuration:v4 animations:v3 completion:0.3];
}

uint64_t __41__CKAutoloopMovieBalloonView_setIsMuted___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __41__CKAutoloopMovieBalloonView_setIsMuted___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeSnapshot];
}

- (BOOL)_thermalStateAcceptableForLooping
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v3 = [v2 thermalState];

  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 134218240;
      uint64_t v7 = v3;
      __int16 v8 = 1024;
      BOOL v9 = v3 < 2;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "thermalState: %ld is acceptable: %{BOOL}d.", (uint8_t *)&v6, 0x12u);
    }
  }
  return v3 < 2;
}

- (void)_thermalStateDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CKAutoloopMovieBalloonView__thermalStateDidChange___block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __53__CKAutoloopMovieBalloonView__thermalStateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = [MEMORY[0x1E4F28F80] processInfo];
      uint64_t v4 = [v3 thermalState];
      int v5 = [*(id *)(a1 + 32) _thermalStateAcceptableForLooping];
      int v6 = @"NO";
      if (v5) {
        int v6 = @"YES";
      }
      int v8 = 134218242;
      uint64_t v9 = v4;
      __int16 v10 = 2112;
      double v11 = v6;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Thermal state changed to %lu, setting loop playback to paused:%@", (uint8_t *)&v8, 0x16u);
    }
  }
  return [*(id *)(a1 + 32) prepareForDisplay];
}

- (BOOL)_applicationStateAcceptableForLooping
{
  return +[CKApplicationState isApplicationActive];
}

- (void)_removeSnapshot
{
  uint64_t v3 = [(CKAutoloopMovieBalloonView *)self snapshotView];
  [v3 removeFromSuperview];

  [(CKAutoloopMovieBalloonView *)self setSnapshotView:0];
}

- (BOOL)_shouldAutoPlay
{
  if (self->_mediaObject)
  {
    uint64_t v3 = [(CKAutoloopMovieBalloonView *)self mediaObject];
    uint64_t v4 = [v3 messageContext];
    int v5 = [v4 isSenderUnknown];

    if (v5)
    {
      int v6 = IMOSLoggingEnabled();
      if (v6)
      {
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          __int16 v22 = 0;
          int v8 = "_shouldAutoPlay: NO because media object of view has context with unknown sender.";
          uint64_t v9 = (uint8_t *)&v22;
LABEL_17:
          _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, v8, v9, 2u);
          goto LABEL_18;
        }
        goto LABEL_18;
      }
      return v6;
    }
    __int16 v10 = [(CKAutoloopMovieBalloonView *)self window];

    if (!v10)
    {
      int v6 = IMOSLoggingEnabled();
      if (v6)
      {
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          int v8 = "_shouldAutoPlay: NO because view is not in a window.";
          uint64_t v9 = buf;
          goto LABEL_17;
        }
        goto LABEL_18;
      }
      return v6;
    }
    double v11 = [(CKAutoloopMovieBalloonView *)self mediaObject];
    uint64_t v12 = [v11 messageContext];
    int v13 = [v12 isSenderUnauthenticated];

    int v14 = IMOSLoggingEnabled();
    if (v13)
    {
      if (v14)
      {
        id v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          __int16 v20 = 0;
          double v16 = "_shouldAutoPlay: NO because media object of view has context with unauthenticated sender.";
          double v17 = (uint8_t *)&v20;
LABEL_22:
          _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, v16, v17, 2u);
          goto LABEL_23;
        }
        goto LABEL_23;
      }
    }
    else if (v14)
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        __int16 v19 = 0;
        double v16 = "_shouldAutoPlay: YES because everything seems to be fine.";
        double v17 = (uint8_t *)&v19;
        goto LABEL_22;
      }
LABEL_23:
    }
    LOBYTE(v6) = v13 ^ 1;
    return v6;
  }
  int v6 = IMOSLoggingEnabled();
  if (v6)
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = 0;
      int v8 = "_shouldAutoPlay: NO because view has no media object at all.";
      uint64_t v9 = (uint8_t *)&v23;
      goto LABEL_17;
    }
LABEL_18:

    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)_shouldPauseInitialLooping
{
  uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v4 = [v3 stringForKey:@"DisableLoopingFilenameKey"];

  if (v4)
  {
    int v5 = [(CKAutoloopMovieBalloonView *)self mediaObject];
    int v6 = [v5 fileURL];
    uint64_t v7 = [v6 lastPathComponent];

    if (kInitialAutoloopWasSuppressed) {
      char v8 = 0;
    }
    else {
      char v8 = [v7 isEqualToString:v4];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldPresentQuickLookOnTap
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"DisableAutoloopTapToQuicklookKey"];

  return v3 ^ 1;
}

- (void)avPlayer:(id)a3 itemDidPlayToEnd:(id)a4
{
  if (![(CKAutoloopMovieBalloonView *)self isMuted])
  {
    [(CKAutoloopMovieBalloonView *)self setIsMuted:1];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if ((v6 & 2) != 0 && (void *)playerObservationContext == a5)
  {
    id v18 = v8;
    BOOL v9 = [(CKAutoloopMovieBalloonView *)self _shouldAutoPlay];
    id v8 = v18;
    if (v9)
    {
      BOOL v10 = [(CKAutoloopMovieBalloonView *)self _shouldPauseInitialLooping];
      id v8 = v18;
      if (!v10)
      {
        BOOL v11 = [(CKAutoloopMovieBalloonView *)self _thermalStateAcceptableForLooping];
        id v8 = v18;
        if (v11)
        {
          BOOL v12 = [(CKAutoloopMovieBalloonView *)self _applicationStateAcceptableForLooping];
          id v8 = v18;
          if (v12)
          {
            int v13 = [(CKAutoloopMovieBalloonView *)self avPlayer];
            [v13 rate];
            float v15 = v14;

            id v8 = v18;
            if (v15 == 0.0)
            {
              double v16 = [(CKAutoloopMovieBalloonView *)self avPlayer];
              LODWORD(v17) = 1.0;
              [v16 setRate:v17];

              id v8 = v18;
            }
          }
        }
      }
    }
  }
}

- (void)previewDidChange:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v7 = [v4 object];
    id v8 = [(CKMediaObject *)self->_mediaObject transferGUID];
    BOOL v9 = [v7 transferGUID];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      if (IMOSLoggingEnabled())
      {
        BOOL v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          BOOL v12 = [(CKMediaObject *)self->_mediaObject transferGUID];
          int v15 = 138412546;
          double v16 = v7;
          __int16 v17 = 2112;
          id v18 = v12;
          _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Got updated preview %@ for %@", (uint8_t *)&v15, 0x16u);
        }
      }
      mediaObject = self->_mediaObject;
      float v14 = +[CKUIBehavior sharedBehaviors];
      [v14 previewMaxWidth];
      -[CKImageBalloonView configureForMediaObject:previewWidth:orientation:](self, "configureForMediaObject:previewWidth:orientation:", mediaObject, 1);
    }
  }
}

- (CKMovieMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (BOOL)isJellyfishVideo
{
  return self->_isJellyfishVideo;
}

- (void)setIsJellyfishVideo:(BOOL)a3
{
  self->_isJellyfishVideo = a3;
}

- (UIImageView)muteButton
{
  return self->_muteButton;
}

- (void)setMuteButton:(id)a3
{
}

- (ISVideoPlayerUIView)videoPlayer
{
  return self->_videoPlayer;
}

- (void)setVideoPlayer:(id)a3
{
}

- (ISWrappedAVPlayer)avPlayer
{
  return self->_avPlayer;
}

- (void)setAvPlayer:(id)a3
{
}

- (ISWrappedAVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setAudioSession:(id)a3
{
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
}

- (BOOL)isListeningToVideoPlayer
{
  return self->_isListeningToVideoPlayer;
}

- (void)setIsListeningToVideoPlayer:(BOOL)a3
{
  self->_isListeningToVideoPlayer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_avPlayer, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_muteButton, 0);

  objc_storeStrong((id *)&self->_mediaObject, 0);
}

@end