@interface AVTPaddleView
+ (double)defaultPadding;
- (AVPlayer)player;
- (AVPlayerViewController)videoController;
- (AVTCircularButton)addButton;
- (AVTPaddleView)initWithLayoutDirection:(int64_t)a3;
- (AVTPaddleView)initWithLayoutDirection:(int64_t)a3 symbolConfiguration:(id)a4;
- (AVTPaddleViewDelegate)delegate;
- (AVTTouchDownGestureRecognizer)dismissGestureRecognizer;
- (AVTTouchDownGestureRecognizer)tapGestureRecognizer;
- (AVTUILogger)logger;
- (BOOL)automaticallyStartsPlaying;
- (BOOL)isPointInsideTransparentRegion:(CGPoint)a3;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)frameForAddButtonInCoordinateSpace:(id)a3;
- (CGRect)frameForVideoInCoordinateSpace:(id)a3;
- (NSArray)activeConstraints;
- (UIView)addButtonViewContainer;
- (UIView)videoViewContainer;
- (double)padding;
- (id)preCommitBlock;
- (int64_t)layoutDirection;
- (void)_configureWithSymbolConfiguration:(id)a3;
- (void)attachVideoController:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)dismissAnimated:(BOOL)a3;
- (void)drawRect:(CGRect)a3;
- (void)handleDismissGesture;
- (void)handleTapAddButton;
- (void)handleTapGesture;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseVideo;
- (void)playVideo;
- (void)setActiveConstraints:(id)a3;
- (void)setAddButton:(id)a3;
- (void)setAddButtonViewContainer:(id)a3;
- (void)setAutomaticallyStartsPlaying:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissGestureRecognizer:(id)a3;
- (void)setLogger:(id)a3;
- (void)setPadding:(double)a3;
- (void)setPlayer:(id)a3;
- (void)setPreCommitBlock:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setVideoController:(id)a3;
- (void)setVideoViewContainer:(id)a3;
- (void)showAnimated:(BOOL)a3;
- (void)startPlayingIfNecessary;
- (void)stopPlayingIfNecessary;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateLayoutFromPlusButtonView:(id)a3 videoView:(id)a4;
@end

@implementation AVTPaddleView

+ (double)defaultPadding
{
  return 14.0;
}

- (AVTPaddleView)initWithLayoutDirection:(int64_t)a3
{
  return [(AVTPaddleView *)self initWithLayoutDirection:a3 symbolConfiguration:0];
}

- (AVTPaddleView)initWithLayoutDirection:(int64_t)a3 symbolConfiguration:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AVTPaddleView;
  v7 = -[AVTPaddleView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v7)
  {
    [(id)objc_opt_class() defaultPadding];
    v7->_padding = v8;
    v7->_layoutDirection = a3;
    v9 = +[AVTUIEnvironment defaultEnvironment];
    uint64_t v10 = [v9 logger];
    logger = v7->_logger;
    v7->_logger = (AVTUILogger *)v10;

    [(AVTPaddleView *)v7 _configureWithSymbolConfiguration:v6];
  }

  return v7;
}

- (void)dealloc
{
  [(AVTPaddleView *)self stopPlayingIfNecessary];
  v3 = [(AVTPaddleView *)self tapGestureRecognizer];
  [(AVTPaddleView *)self removeGestureRecognizer:v3];

  v4 = [(AVTPaddleView *)self superview];
  v5 = [(AVTPaddleView *)self dismissGestureRecognizer];
  [v4 removeGestureRecognizer:v5];

  [(AVTPaddleView *)self setTapGestureRecognizer:0];
  [(AVTPaddleView *)self setDismissGestureRecognizer:0];
  v6.receiver = self;
  v6.super_class = (Class)AVTPaddleView;
  [(AVTPaddleView *)&v6 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v13 = a4;
  uint64_t v8 = [a3 isEqualToString:@"status"];
  id v9 = v13;
  if (v8)
  {
    id v10 = v13;
    if ([v10 status] == 2)
    {
      v11 = [(AVTPaddleView *)self logger];
      v12 = [v10 error];
      [v11 logPaddleViewVideoPlayerFailed:v12];

      [(AVTPaddleView *)self stopPlayingIfNecessary];
      [(AVTPaddleView *)self startPlayingIfNecessary];
    }

    id v9 = v13;
  }
  MEMORY[0x270F9A758](v8, v9);
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)AVTPaddleView;
  [(AVTPaddleView *)&v2 layoutSubviews];
}

- (void)_configureWithSymbolConfiguration:(id)a3
{
  id v38 = a3;
  self->_automaticallyStartsPlaying = 1;
  v4 = [MEMORY[0x263F1C550] clearColor];
  [(AVTPaddleView *)self setBackgroundColor:v4];

  [(AVTPaddleView *)self setAutoresizingMask:0];
  double v5 = *MEMORY[0x263F001B0];
  double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  v7 = [(AVTPaddleView *)self layer];
  objc_msgSend(v7, "setShadowOffset:", v5, v6);

  uint64_t v8 = [(AVTPaddleView *)self layer];
  [v8 setShadowRadius:40.0];

  id v9 = [(AVTPaddleView *)self layer];
  LODWORD(v10) = 1047233823;
  [v9 setShadowOpacity:v10];

  id v11 = objc_alloc(MEMORY[0x263F1CB60]);
  double v12 = *MEMORY[0x263F001A8];
  double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
  v16 = (UIView *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x263F001A8], v13, v14, v15);
  videoViewContainer = self->_videoViewContainer;
  self->_videoViewContainer = v16;

  [(UIView *)self->_videoViewContainer setAutoresizingMask:0];
  v18 = [MEMORY[0x263F1C550] clearColor];
  [(UIView *)self->_videoViewContainer setBackgroundColor:v18];

  [(AVTPaddleView *)self addSubview:self->_videoViewContainer];
  v19 = (AVPlayerViewController *)objc_alloc_init(MEMORY[0x263EFA9C8]);
  videoController = self->_videoController;
  self->_videoController = v19;

  v21 = [MEMORY[0x263F1C550] clearColor];
  v22 = [(AVPlayerViewController *)self->_videoController view];
  [v22 setBackgroundColor:v21];

  [(AVPlayerViewController *)self->_videoController setShowsPlaybackControls:0];
  [(AVPlayerViewController *)self->_videoController setUpdatesNowPlayingInfoCenter:0];
  v23 = [(AVPlayerViewController *)self->_videoController player];
  [v23 setAllowsExternalPlayback:0];

  v24 = [(AVPlayerViewController *)self->_videoController view];
  [v24 setAutoresizingMask:0];

  v25 = self->_videoViewContainer;
  v26 = [(AVPlayerViewController *)self->_videoController view];
  [(UIView *)v25 addSubview:v26];

  v27 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v12, v13, v14, v15);
  addButtonViewContainer = self->_addButtonViewContainer;
  self->_addButtonViewContainer = v27;

  [(UIView *)self->_addButtonViewContainer setAutoresizingMask:0];
  v29 = [MEMORY[0x263F1C550] clearColor];
  [(UIView *)self->_addButtonViewContainer setBackgroundColor:v29];

  [(AVTPaddleView *)self addSubview:self->_addButtonViewContainer];
  v30 = +[AVTCircularButton buttonWithType:0];
  addButton = self->_addButton;
  self->_addButton = v30;

  v32 = self->_addButton;
  if (v38) {
    [(AVTCircularButton *)v32 setSymbolImageWithName:@"plus" configuration:v38];
  }
  else {
    [(AVTCircularButton *)v32 setSymbolImageWithName:@"plus"];
  }
  [(AVTCircularButton *)self->_addButton setAutoresizingMask:0];
  [(UIView *)self->_addButtonViewContainer addSubview:self->_addButton];
  v33 = [[AVTTouchDownGestureRecognizer alloc] initWithTarget:self action:sel_handleTapGesture];
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v33;

  [(AVTPaddleView *)self addGestureRecognizer:self->_tapGestureRecognizer];
  v35 = [[AVTTouchDownGestureRecognizer alloc] initWithTarget:self action:sel_handleDismissGesture];
  dismissGestureRecognizer = self->_dismissGestureRecognizer;
  self->_dismissGestureRecognizer = v35;

  [(AVTTouchDownGestureRecognizer *)self->_dismissGestureRecognizer requireGestureRecognizerToFail:self->_tapGestureRecognizer];
  v37 = [(AVTPaddleView *)self superview];
  [v37 addGestureRecognizer:self->_dismissGestureRecognizer];

  [(AVTPaddleView *)self layoutIfNeeded];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVTPaddleView;
  [(AVTPaddleView *)&v4 traitCollectionDidChange:a3];
  [(AVTPaddleView *)self setNeedsDisplay];
}

- (void)updateLayoutFromPlusButtonView:(id)a3 videoView:(id)a4
{
  id v114 = a4;
  id v6 = a3;
  v7 = [v6 superview];
  [v6 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(AVTPaddleView *)self superview];
  objc_msgSend(v7, "convertRect:toView:", v16, v9, v11, v13, v15);
  double v110 = v17;
  double v19 = v18;
  CGFloat v115 = v21;
  CGFloat v117 = v20;

  [v6 bounds];
  CGFloat v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  [(AVTPaddleView *)self padding];
  double v31 = v27 + v30 * 2.0;
  [(AVTPaddleView *)self padding];
  CGFloat v33 = v29 + v32 * 2.0;
  v120.origin.x = v23;
  v120.origin.y = v25;
  v120.size.width = v31;
  v120.size.height = v33;
  double Width = CGRectGetWidth(v120);
  v121.origin.x = v23;
  v121.origin.y = v25;
  v121.size.width = v31;
  double v113 = v33;
  v121.size.height = v33;
  double Height = CGRectGetHeight(v121);
  [(AVTPaddleView *)self padding];
  double v112 = v31;
  if (v114)
  {
    v37 = [v114 superview];
    [v114 frame];
    double v39 = v38;
    CGFloat rect_24 = v19;
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    v46 = [(AVTPaddleView *)self superview];
    objc_msgSend(v37, "convertRect:toView:", v46, v39, v41, v43, v45);
    CGFloat v48 = v47;
    CGFloat rect = v47;
    CGFloat v50 = v49;
    CGFloat v52 = v51;
    CGFloat v54 = v53;

    v122.origin.x = v48;
    v122.origin.y = v50;
    v122.size.width = v52;
    v122.size.height = v54;
    double rect_8 = v23;
    double MinY = CGRectGetMinY(v122);
    v123.origin.y = rect_24;
    v123.origin.x = v110;
    v123.size.width = v117;
    v123.size.height = v115;
    double v56 = MinY - CGRectGetMaxY(v123);
    v124.origin.x = v110;
    v124.origin.y = rect_24;
    v124.size.width = v117;
    v124.size.height = v115;
    double v57 = CGRectGetMinY(v124);
    v125.origin.x = rect;
    v125.origin.y = v50;
    double v116 = v52;
    double v118 = v54;
    v125.size.width = v52;
    v125.size.height = v54;
    double v19 = rect_24;
    double v58 = v57 - CGRectGetMaxY(v125);
    CGFloat v23 = rect_8;
    if (v58 < v56) {
      double v58 = v56;
    }
    double v59 = fmax(v58, 0.0);
  }
  else
  {
    double v59 = v36;
    double v116 = Width + Width;
    double v118 = Height + Height;
  }
  [(AVTPaddleView *)self padding];
  double v61 = v60;
  [(AVTPaddleView *)self padding];
  double v63 = v19 - v62;
  int64_t v64 = [(AVTPaddleView *)self layoutDirection];
  double v65 = v113;
  if (v64 == 1)
  {
    CGFloat v66 = v23;
    double v67 = v25;
    double v68 = v31;
    double v69 = v59 + CGRectGetMaxY(*(CGRect *)(&v65 - 3));
    double v70 = v116;
    double v71 = v118;
  }
  else
  {
    v126.origin.x = 0.0;
    v126.origin.y = 0.0;
    double v70 = v116;
    double v71 = v118;
    v126.size.width = v116;
    v126.size.height = v118;
    double v25 = v59 + CGRectGetMaxY(v126);
    double v72 = v59 + v118;
    double v69 = 0.0;
    double v63 = v63 - v72;
  }
  double v73 = v110 - v61;
  double v111 = v63;
  if ([(AVTPaddleView *)self isRTL])
  {
    v127.origin.x = 0.0;
    v127.origin.y = v69;
    v127.size.width = v70;
    v127.size.height = v71;
    double v74 = v73;
    double MaxX = CGRectGetMaxX(v127);
    v128.origin.x = v23;
    v128.origin.y = v25;
    v128.size.width = v31;
    v128.size.height = v113;
    CGFloat v76 = CGRectGetWidth(v128);
    double v77 = v31;
    double v78 = MaxX - v76;
    double rect_16 = v74 - (v70 - v77);
  }
  else
  {
    double v78 = v23;
    double rect_16 = v73;
  }
  v79 = [(AVTPaddleView *)self videoViewContainer];
  objc_msgSend(v79, "setFrame:", 0.0, v69, v70, v71);

  v80 = [(AVTPaddleView *)self videoViewContainer];
  [(AVTPaddleView *)self frameForVideoInCoordinateSpace:v80];
  double v82 = v81;
  CGFloat rect_24a = v69;
  double v84 = v83;
  double v86 = v85;
  double v88 = v87;
  v89 = [(AVTPaddleView *)self videoController];
  v90 = [v89 view];
  objc_msgSend(v90, "setFrame:", v82, v84, v86, v88);

  v91 = [(AVTPaddleView *)self addButtonViewContainer];
  objc_msgSend(v91, "setFrame:", v78, v25, v112, v113);

  v92 = [(AVTPaddleView *)self addButtonViewContainer];
  [(AVTPaddleView *)self frameForAddButtonInCoordinateSpace:v92];
  double v94 = v93;
  double v96 = v95;
  double v98 = v97;
  double v100 = v99;
  v101 = [(AVTPaddleView *)self addButton];
  objc_msgSend(v101, "setFrame:", v94, v96, v98, v100);

  v129.origin.x = 0.0;
  v129.origin.y = rect_24a;
  v129.size.height = v71;
  v129.size.width = v70;
  double MaxY = CGRectGetMaxY(v129);
  v130.origin.x = v78;
  v130.origin.y = v25;
  v130.size.width = v112;
  v130.size.height = v113;
  double v103 = CGRectGetMaxY(v130);
  if (MaxY >= v103) {
    double v104 = MaxY;
  }
  else {
    double v104 = v103;
  }
  -[AVTPaddleView setFrame:](self, "setFrame:", rect_16, v111, v70, v104);
  [(AVTPaddleView *)self setNeedsDisplay];
}

- (CGRect)frameForAddButtonInCoordinateSpace:(id)a3
{
  id v4 = a3;
  [(AVTPaddleView *)self padding];
  CGFloat v6 = v5;
  v7 = [(AVTPaddleView *)self addButtonViewContainer];
  [v7 bounds];
  CGRect v26 = CGRectInset(v25, v6, v6);
  double x = v26.origin.x;
  double y = v26.origin.y;
  double width = v26.size.width;
  double height = v26.size.height;

  double v12 = [(AVTPaddleView *)self addButtonViewContainer];
  objc_msgSend(v4, "convertRect:fromCoordinateSpace:", v12, x, y, width, height);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (CGRect)frameForVideoInCoordinateSpace:(id)a3
{
  id v4 = a3;
  [(AVTPaddleView *)self padding];
  if (v5 >= 12.0) {
    double v6 = v5;
  }
  else {
    double v6 = 12.0;
  }
  v7 = [(AVTPaddleView *)self videoViewContainer];
  [v7 bounds];
  CGRect v26 = CGRectInset(v25, v6, v6);
  double x = v26.origin.x;
  double y = v26.origin.y;
  double width = v26.size.width;
  double height = v26.size.height;

  double v12 = [(AVTPaddleView *)self videoViewContainer];
  objc_msgSend(v4, "convertRect:fromCoordinateSpace:", v12, x, y, width, height);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (void)handleTapAddButton
{
  v3 = [(AVTPaddleView *)self delegate];

  if (v3)
  {
    id v4 = [(AVTPaddleView *)self delegate];
    [v4 paddleViewTapped:self];
  }
}

- (void)handleTapGesture
{
  v3 = [(AVTPaddleView *)self delegate];

  if (v3)
  {
    id v4 = [(AVTPaddleView *)self delegate];
    [v4 paddleViewTapped:self];
  }
}

- (void)handleDismissGesture
{
  v3 = [(AVTPaddleView *)self delegate];

  if (v3)
  {
    id v4 = [(AVTPaddleView *)self delegate];
    [v4 paddleViewWantsToBeDismissed:self];
  }
}

- (BOOL)isPointInsideTransparentRegion:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v6 = [(AVTPaddleView *)self addButtonViewContainer];
  [v6 frame];
  v10.CGFloat x = x;
  v10.CGFloat y = y;
  if (CGRectContainsPoint(v12, v10))
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    double v8 = [(AVTPaddleView *)self videoViewContainer];
    [v8 frame];
    v11.CGFloat x = x;
    v11.CGFloat y = y;
    BOOL v7 = !CGRectContainsPoint(v13, v11);
  }
  return v7;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)AVTPaddleView;
  BOOL v7 = -[AVTPaddleView pointInside:withEvent:](&v9, sel_pointInside_withEvent_, a4);
  if (v7) {
    LOBYTE(v7) = !-[AVTPaddleView isPointInsideTransparentRegion:](self, "isPointInsideTransparentRegion:", x, y);
  }
  return v7;
}

- (void)attachVideoController:(id)a3
{
  id v4 = (AVPlayerViewController *)a3;
  [(AVTPaddleView *)self stopPlayingIfNecessary];
  double v5 = [(AVPlayerViewController *)v4 player];
  player = self->_player;
  self->_player = v5;

  [(AVPlayer *)self->_player setAllowsExternalPlayback:0];
  [(AVPlayer *)self->_player addObserver:self forKeyPath:@"status" options:1 context:0];
  videoController = self->_videoController;
  self->_videoController = v4;
  double v8 = v4;

  [(AVTPaddleView *)self frameForVideoInCoordinateSpace:self->_videoViewContainer];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = [(AVPlayerViewController *)self->_videoController view];
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  double v18 = [(AVPlayerViewController *)self->_videoController view];
  [v18 setAutoresizingMask:18];

  videoViewContainer = self->_videoViewContainer;
  id v20 = [(AVPlayerViewController *)self->_videoController view];
  [(UIView *)videoViewContainer addSubview:v20];
}

- (void)startPlayingIfNecessary
{
  if (!self->_player)
  {
    id v6 = [(id)objc_opt_class() videoItem];
    v3 = (AVPlayer *)[objc_alloc(MEMORY[0x263EFA860]) initWithPlayerItem:v6];
    [(AVPlayer *)v3 setPreventsDisplaySleepDuringVideoPlayback:0];
    [(AVPlayer *)v3 addObserver:self forKeyPath:@"status" options:1 context:0];
    player = self->_player;
    self->_player = v3;
    double v5 = v3;

    [(AVPlayer *)self->_player setAllowsExternalPlayback:0];
    [(AVPlayerViewController *)self->_videoController setPlayer:self->_player];
    [(AVPlayer *)self->_player play];
  }
}

- (void)stopPlayingIfNecessary
{
  player = self->_player;
  if (player)
  {
    [(AVPlayer *)player removeObserver:self forKeyPath:@"status"];
    [(AVPlayer *)self->_player pause];
    [(AVPlayerViewController *)self->_videoController setPlayer:0];
    id v4 = self->_player;
    self->_player = 0;
  }
}

- (void)didMoveToWindow
{
  v18.receiver = self;
  v18.super_class = (Class)AVTPaddleView;
  [(AVTPaddleView *)&v18 didMoveToWindow];
  v3 = [(AVTPaddleView *)self dismissGestureRecognizer];
  id v4 = [v3 view];
  double v5 = [(AVTPaddleView *)self superview];

  if (v4 != v5)
  {
    id v6 = [(AVTPaddleView *)self dismissGestureRecognizer];
    BOOL v7 = [v6 view];
    double v8 = [(AVTPaddleView *)self dismissGestureRecognizer];
    [v7 removeGestureRecognizer:v8];

    double v9 = [(AVTPaddleView *)self superview];
    double v10 = [(AVTPaddleView *)self dismissGestureRecognizer];
    [v9 addGestureRecognizer:v10];
  }
  objc_initWeak(&location, self);
  double v11 = [(AVTPaddleView *)self preCommitBlock];

  if (!v11)
  {
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    double v14 = __32__AVTPaddleView_didMoveToWindow__block_invoke;
    double v15 = &unk_263FF09D8;
    objc_copyWeak(&v16, &location);
    [(AVTPaddleView *)self setPreCommitBlock:&v12];
    objc_msgSend(MEMORY[0x263F158F8], "addCommitHandler:forPhase:", self->_preCommitBlock, 1, v12, v13, v14, v15);
    objc_destroyWeak(&v16);
  }
  objc_destroyWeak(&location);
}

void __32__AVTPaddleView_didMoveToWindow__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained window];

  if (v1)
  {
    if ([WeakRetained automaticallyStartsPlaying]) {
      [WeakRetained startPlayingIfNecessary];
    }
  }
  else
  {
    [WeakRetained stopPlayingIfNecessary];
  }
  [WeakRetained setPreCommitBlock:0];
}

- (void)showAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(AVTPaddleView *)self setAlpha:0.0];
  double v5 = 0.2;
  if (!v3) {
    double v5 = 0.0;
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__AVTPaddleView_showAnimated___block_invoke;
  v6[3] = &unk_263FF03D8;
  v6[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v6 animations:0 completion:v5];
}

uint64_t __30__AVTPaddleView_showAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)dismissAnimated:(BOOL)a3
{
  double v3 = 0.2;
  if (!a3) {
    double v3 = 0.0;
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__AVTPaddleView_dismissAnimated___block_invoke;
  v5[3] = &unk_263FF03D8;
  v5[4] = self;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__AVTPaddleView_dismissAnimated___block_invoke_2;
  v4[3] = &unk_263FF04A0;
  v4[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v5 animations:v4 completion:v3];
}

uint64_t __33__AVTPaddleView_dismissAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __33__AVTPaddleView_dismissAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)playVideo
{
}

- (void)pauseVideo
{
}

- (void)drawRect:(CGRect)a3
{
  id v4 = [(AVTPaddleView *)self videoViewContainer];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  uint64_t v13 = [(AVTPaddleView *)self addButtonViewContainer];
  [v13 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = +[AVTUIColorRepository paddleViewBackgroundColor];
  double v23 = [(AVTPaddleView *)self traitCollection];
  double v24 = [v22 resolvedColorWithTraitCollection:v23];
  [v24 setFill];

  +[AVTPaddlePathGenerator paddlePathWithBaseRect:contentRect:radius:topToBottom:rightToLeft:](AVTPaddlePathGenerator, "paddlePathWithBaseRect:contentRect:radius:topToBottom:rightToLeft:", [(AVTPaddleView *)self layoutDirection] == 1, [(AVTPaddleView *)self isRTL], v15, v17, v19, v21, v6, v8, v10, v12, 0x4028000000000000);
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  [v25 fill];
}

- (BOOL)automaticallyStartsPlaying
{
  return self->_automaticallyStartsPlaying;
}

- (void)setAutomaticallyStartsPlaying:(BOOL)a3
{
  self->_automaticallyStartsPlaying = a3;
}

- (double)padding
{
  return self->_padding;
}

- (void)setPadding:(double)a3
{
  self->_padding = a3;
}

- (AVTPaddleViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTPaddleViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)videoViewContainer
{
  return self->_videoViewContainer;
}

- (void)setVideoViewContainer:(id)a3
{
}

- (UIView)addButtonViewContainer
{
  return self->_addButtonViewContainer;
}

- (void)setAddButtonViewContainer:(id)a3
{
}

- (AVTCircularButton)addButton
{
  return self->_addButton;
}

- (void)setAddButton:(id)a3
{
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (AVPlayerViewController)videoController
{
  return self->_videoController;
}

- (void)setVideoController:(id)a3
{
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (AVTTouchDownGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (AVTTouchDownGestureRecognizer)dismissGestureRecognizer
{
  return self->_dismissGestureRecognizer;
}

- (void)setDismissGestureRecognizer:(id)a3
{
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (id)preCommitBlock
{
  return self->_preCommitBlock;
}

- (void)setPreCommitBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_preCommitBlock, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_videoController, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_addButtonViewContainer, 0);
  objc_storeStrong((id *)&self->_videoViewContainer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end