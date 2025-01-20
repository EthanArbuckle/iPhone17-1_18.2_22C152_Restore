@interface AVMobileChromelessPlaybackControlButton
+ (AVMobileChromelessPlaybackControlButton)buttonWithAccessibilityIdentifier:(id)a3 withStyleSheet:(id)a4 withPlaybackControlButtonType:(unint64_t)a5;
+ (id)backwardSecondaryButtonWithStyleSheet:(id)a3;
+ (id)forwardSecondaryButtonWithStyleSheet:(id)a3;
+ (id)playPauseButtonWithStyleSheet:(id)a3;
- (AVMicaPackage)playPauseButtonMicaPackage;
- (AVMobileChromelessControlsStyleSheet)styleSheet;
- (CGSize)intrinsicContentSize;
- (NSString)playbackControlButtonIconState;
- (UIView)playPauseButtonMicaPackageContainerView;
- (id)_imageNameForMicaPackageState;
- (id)pointerTargetView;
- (void)_updateMicaPackage;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setPlayPauseButtonMicaPackage:(id)a3;
- (void)setPlayPauseButtonMicaPackageContainerView:(id)a3;
- (void)setPlaybackControlButtonIconState:(id)a3;
- (void)setStyleSheet:(id)a3;
@end

@implementation AVMobileChromelessPlaybackControlButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playPauseButtonMicaPackageContainerView, 0);
  objc_storeStrong((id *)&self->_playPauseButtonMicaPackage, 0);
  objc_storeStrong((id *)&self->_playbackControlButtonIconState, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_storeStrong((id *)&self->_highlightAnimator, 0);

  objc_storeStrong((id *)&self->_highlightView, 0);
}

- (void)setPlayPauseButtonMicaPackageContainerView:(id)a3
{
}

- (UIView)playPauseButtonMicaPackageContainerView
{
  return self->_playPauseButtonMicaPackageContainerView;
}

- (AVMicaPackage)playPauseButtonMicaPackage
{
  return self->_playPauseButtonMicaPackage;
}

- (NSString)playbackControlButtonIconState
{
  return self->_playbackControlButtonIconState;
}

- (AVMobileChromelessControlsStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (void)_updateMicaPackage
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v3 = [(AVMobileChromelessPlaybackControlButton *)self playPauseButtonMicaPackage];
  if (v3) {
    BOOL v4 = [(UIView *)self avkit_isBeingScrolled];
  }
  else {
    BOOL v4 = 0;
  }
  v5 = [v3 rootLayer];
  v6 = [v5 superlayer];
  v7 = [(UIView *)self->_playPauseButtonMicaPackageContainerView layer];

  v8 = [(AVMobileChromelessPlaybackControlButton *)self playbackControlButtonIconState];
  [v3 setState:v8 color:0];

  v9 = [v3 rootLayer];
  LODWORD(v10) = 1.0;
  [v9 setOpacity:v10];

  v11 = _AVLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v47 = "-[AVMobileChromelessPlaybackControlButton _updateMicaPackage]";
    __int16 v48 = 1024;
    BOOL v49 = v4;
    __int16 v50 = 1024;
    BOOL v51 = [(UIView *)self avkit_isBeingScrolled];
    _os_log_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_DEFAULT, "%s : prefers images: %d, isBeingScrolled: %d", buf, 0x18u);
  }

  if (v4 && v6 != v7)
  {
    objc_initWeak((id *)buf, self);
    v12 = (void *)MEMORY[0x1E4FB1818];
    v13 = [(AVMobileChromelessPlaybackControlButton *)self _imageNameForMicaPackageState];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __61__AVMobileChromelessPlaybackControlButton__updateMicaPackage__block_invoke;
    v44[3] = &unk_1E5FC2DA8;
    objc_copyWeak(&v45, (id *)buf);
    objc_msgSend(v12, "avkit_imageNamed:completion:", v13, v44);

    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v14 = [(AVMobileChromelessPlaybackControlButton *)self imageView];
    [v14 removeFromSuperview];

    v15 = [v3 rootLayer];
    v16 = [v15 superlayer];
    v17 = [(UIView *)self->_playPauseButtonMicaPackageContainerView layer];
    BOOL v18 = v16 == v17;

    if (!v18)
    {
      v19 = _AVLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[AVMobileChromelessPlaybackControlButton _updateMicaPackage]";
        _os_log_impl(&dword_1B05B7000, v19, OS_LOG_TYPE_DEFAULT, "%s : setting up micaPackage layer.", buf, 0xCu);
      }

      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      v20 = [(AVMobileChromelessPlaybackControlButton *)self layer];
      [v20 setCompositingFilter:0];

      v21 = [(UIView *)self->_playPauseButtonMicaPackageContainerView layer];
      [v21 setCompositingFilter:0];

      v22 = [(UIView *)self->_playPauseButtonMicaPackageContainerView layer];
      v23 = [v3 rootLayer];
      [v22 addSublayer:v23];

      [(AVMobileChromelessPlaybackControlButton *)self addSubview:self->_playPauseButtonMicaPackageContainerView];
      [MEMORY[0x1E4F39CF8] commit];
    }
    v24 = [(AVMobileChromelessControlsStyleSheet *)self->_styleSheet playPauseButtonFont];
    [v24 pointSize];
    double v26 = v25;
    v27 = [(AVMobileChromelessControlsStyleSheet *)self->_styleSheet playPauseButtonFont];
    [v27 pointSize];
    objc_msgSend(v3, "setTargetSize:", v26, v28);

    [(AVMobileChromelessPlaybackControlButton *)self bounds];
    UIRectGetCenter();
    double v30 = v29;
    double v32 = v31;
    v33 = [v3 rootLayer];
    [v33 position];
    BOOL v36 = v32 == v35 && v30 == v34;

    if (!v36)
    {
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      v37 = [v3 rootLayer];
      [(AVMobileChromelessPlaybackControlButton *)self bounds];
      UIRectGetCenter();
      objc_msgSend(v37, "setPosition:");

      [MEMORY[0x1E4F39CF8] commit];
    }
  }
  v38 = [(AVMobileChromelessPlaybackControlButton *)self imageView];
  v39 = [v38 superview];
  if (v39 == self)
  {
    v40 = [v3 rootLayer];
    v41 = [v40 superlayer];
    v42 = [(UIView *)self->_playPauseButtonMicaPackageContainerView layer];
    BOOL v43 = v41 == v42;

    if (!v43) {
      goto LABEL_21;
    }
    v38 = _AVLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v38, OS_LOG_TYPE_ERROR, "Both the imageView and the micaPackage rootLayer are visible in the hierarchy at the same time.", buf, 2u);
    }
  }
  else
  {
  }
LABEL_21:
}

void __61__AVMobileChromelessPlaybackControlButton__updateMicaPackage__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    v6 = [WeakRetained micaPackage];
    v7 = [v6 rootLayer];
    [v7 removeFromSuperlayer];

    objc_msgSend(WeakRetained, "avkit_makeSubtreeDisallowGroupBlending");
    v8 = [WeakRetained imageView];
    v9 = [v8 layer];
    [v9 setCompositingFilter:*MEMORY[0x1E4F3A2E8]];

    double v10 = [WeakRetained imageView];
    v11 = [MEMORY[0x1E4FB1618] whiteColor];
    [v10 setTintColor:v11];

    v12 = [WeakRetained imageView];
    [v12 setImage:v3];

    v13 = [WeakRetained imageView];
    id v14 = objc_loadWeakRetained(v4);
    [v14 bounds];
    objc_msgSend(v13, "setFrame:");

    v15 = [WeakRetained imageView];
    [v15 setContentMode:4];

    id v16 = objc_loadWeakRetained(v4);
    v17 = [v16 imageView];
    [WeakRetained addSubview:v17];

    [MEMORY[0x1E4F39CF8] commit];
    BOOL v18 = _AVLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      v20 = "-[AVMobileChromelessPlaybackControlButton _updateMicaPackage]_block_invoke";
      _os_log_impl(&dword_1B05B7000, v18, OS_LOG_TYPE_DEFAULT, "%s : ImageView setup; micaPackage rootLayer removed from superlayer.",
        (uint8_t *)&v19,
        0xCu);
    }
  }
}

- (id)_imageNameForMicaPackageState
{
  if (_imageNameForMicaPackageState_onceToken_9900 != -1) {
    dispatch_once(&_imageNameForMicaPackageState_onceToken_9900, &__block_literal_global_9901);
  }
  id v3 = (void *)_imageNameForMicaPackageState_imageNamesForStates_9902;
  uint64_t v4 = [(AVMobileChromelessPlaybackControlButton *)self playbackControlButtonIconState];
  v5 = (void *)v4;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  else {
    v6 = @"pause";
  }
  v7 = [v3 objectForKeyedSubscript:v6];

  return v7;
}

void __72__AVMobileChromelessPlaybackControlButton__imageNameForMicaPackageState__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"play";
  v2[1] = @"pause";
  v3[0] = @"play.fill";
  v3[1] = @"pause.fill";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)_imageNameForMicaPackageState_imageNamesForStates_9902;
  _imageNameForMicaPackageState_imageNamesForStates_9902 = v0;
}

- (CGSize)intrinsicContentSize
{
  double v2 = 46.0;
  double v3 = 46.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)AVMobileChromelessPlaybackControlButton;
  [(AVButton *)&v26 layoutSubviews];
  if (self)
  {
    if (self->_playPauseButtonMicaPackage) {
      [(AVMobileChromelessPlaybackControlButton *)self _updateMicaPackage];
    }
    double v3 = [(AVMobileChromelessPlaybackControlButton *)self playPauseButtonMicaPackageContainerView];
    uint64_t v4 = v3;
    if (v3) {
      [v3 transform];
    }
    else {
      memset(&v27, 0, sizeof(v27));
    }
    BOOL IsIdentity = CGAffineTransformIsIdentity(&v27);

    if (IsIdentity)
    {
      [(AVMobileChromelessPlaybackControlButton *)self bounds];
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      id v14 = [(AVMobileChromelessPlaybackControlButton *)self playPauseButtonMicaPackageContainerView];
      objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      v15 = [(AVButton *)self micaPackage];
      id v16 = [v15 rootLayer];
      UIRectGetCenter();
      objc_msgSend(v16, "setPosition:");

      [MEMORY[0x1E4F39CF8] commit];
    }
    else
    {
      v17 = [(AVButton *)self micaPackage];
      BOOL v18 = [v17 rootLayer];
      [(AVMobileChromelessPlaybackControlButton *)self bounds];
      UIRectGetCenter();
      objc_msgSend(v18, "setPosition:");
    }
  }
  [(AVMobileChromelessPlaybackControlButton *)self bounds];
  CGFloat x = v28.origin.x;
  CGFloat y = v28.origin.y;
  CGFloat width = v28.size.width;
  double height = v28.size.height;
  highlightView = self->_highlightView;
  double MidX = CGRectGetMidX(v28);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.double height = height;
  -[UIView setCenter:](highlightView, "setCenter:", MidX, CGRectGetMidY(v29));
  double v25 = [(UIView *)self->_highlightView layer];
  [v25 setCornerRadius:height * 0.5];
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromelessPlaybackControlButton;
  [(AVMobileChromelessPlaybackControlButton *)&v6 didMoveToWindow];
  double v3 = [(AVMobileChromelessPlaybackControlButton *)self window];
  if (v3)
  {
    unint64_t playbackControlButtonType = self->_playbackControlButtonType;

    if (!playbackControlButtonType && !self->_playPauseButtonMicaPackage && !self->_isPreparingMicaPackage)
    {
      self->_isPreparingMicaPackage = 1;
      objc_initWeak(&location, self);
      uint64_t v5 = [(AVMobileChromelessPlaybackControlButton *)self effectiveUserInterfaceLayoutDirection];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __68__AVMobileChromelessPlaybackControlButton__setupMicaPackageIfNeeded__block_invoke;
      v7[3] = &unk_1E5FC3DE8;
      objc_copyWeak(&v8, &location);
      +[AVMicaPackage asynchronouslyPrepareMicaPackageWithName:@"PlayPauseGlyph" layoutDirection:v5 completion:v7];
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __68__AVMobileChromelessPlaybackControlButton__setupMicaPackageIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setPlayPauseButtonMicaPackage:v5];
    v4[1064] = 0;
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AVMobileChromelessPlaybackControlButton;
  if ([(AVMobileChromelessPlaybackControlButton *)&v16 isHighlighted] != a3)
  {
    v15.receiver = self;
    v15.super_class = (Class)AVMobileChromelessPlaybackControlButton;
    [(AVButton *)&v15 setHighlighted:v3];
    if ([(UIViewPropertyAnimator *)self->_highlightAnimator isRunning])
    {
      if ([(UIViewPropertyAnimator *)self->_highlightAnimator isInterruptible])
      {
        [(UIViewPropertyAnimator *)self->_highlightAnimator stopAnimation:1];
        [(UIViewPropertyAnimator *)self->_highlightAnimator finishAnimationAtPosition:2];
        highlightAnimator = self->_highlightAnimator;
        self->_highlightAnimator = 0;
      }
    }
    [(UIViewPropertyAnimator *)self->_highlightAnimator fractionComplete];
    double v7 = v6;
    objc_initWeak(&location, self);
    id v8 = objc_alloc(MEMORY[0x1E4FB1ED8]);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__AVMobileChromelessPlaybackControlButton_setHighlighted___block_invoke;
    v11[3] = &unk_1E5FC46C0;
    objc_copyWeak(&v12, &location);
    BOOL v13 = v3;
    double v9 = (UIViewPropertyAnimator *)[v8 initWithDuration:2 curve:v11 animations:(1.0 - v7) * 0.2];
    double v10 = self->_highlightAnimator;
    self->_highlightAnimator = v9;

    [(UIViewPropertyAnimator *)self->_highlightAnimator startAnimation];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __58__AVMobileChromelessPlaybackControlButton_setHighlighted___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_15;
  }
  memset(&v14, 0, sizeof(v14));
  if (*(unsigned char *)(a1 + 40))
  {
    CGAffineTransformMakeScale(&v14, 1.2, 1.2);
    if (WeakRetained[130])
    {
      memset(&v13, 0, sizeof(v13));
      CGAffineTransformMakeScale(&v13, 0.8, 0.8);
LABEL_7:
      uint64_t v4 = [WeakRetained imageView];
      [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

      id v5 = [WeakRetained imageView];
      CGAffineTransform v12 = v13;
      [v5 setTransform:&v12];

      goto LABEL_11;
    }
    memset(&v13, 0, sizeof(v13));
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v12.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v12.c = v6;
    *(_OWORD *)&v12.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGAffineTransformScale(&v13, &v12, 0.8, 0.8);
  }
  else
  {
    CGAffineTransformMakeScale(&v14, 1.4, 1.4);
    if (WeakRetained[130])
    {
      long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v13.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v13.c = v3;
      *(_OWORD *)&v13.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      goto LABEL_7;
    }
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v13.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v13.c = v7;
    *(_OWORD *)&v13.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  id v8 = WeakRetained[137];
  CGAffineTransform v12 = v13;
  [v8 setTransform:&v12];
LABEL_11:
  char v9 = [WeakRetained isHovered];
  double v10 = 0.0;
  if ((v9 & 1) == 0)
  {
    double v10 = 0.2;
    if (!*(unsigned char *)(a1 + 40)) {
      double v10 = 0.0;
    }
  }
  [WeakRetained[131] setAlpha:v10];
  id v11 = WeakRetained[131];
  CGAffineTransform v13 = v14;
  [v11 setTransform:&v13];
LABEL_15:
}

- (void)setPlaybackControlButtonIconState:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_playbackControlButtonIconState, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_playbackControlButtonIconState, a3);
    [(AVMobileChromelessPlaybackControlButton *)self _updateMicaPackage];
  }
}

- (id)pointerTargetView
{
  if (self->_playbackControlButtonType)
  {
    double v2 = [(AVMobileChromelessPlaybackControlButton *)self imageView];
  }
  else
  {
    double v2 = self->_playPauseButtonMicaPackageContainerView;
  }

  return v2;
}

- (void)setPlayPauseButtonMicaPackage:(id)a3
{
  id v5 = (AVMicaPackage *)a3;
  p_playPauseButtonMicaPackage = &self->_playPauseButtonMicaPackage;
  if (self->_playPauseButtonMicaPackage != v5)
  {
    long long v7 = v5;
    objc_storeStrong((id *)p_playPauseButtonMicaPackage, a3);
    id v5 = v7;
    if (v7)
    {
      p_playPauseButtonMicaPackage = (AVMicaPackage **)[(AVMobileChromelessPlaybackControlButton *)self _updateMicaPackage];
      id v5 = v7;
    }
  }

  MEMORY[0x1F41817F8](p_playPauseButtonMicaPackage, v5);
}

- (void)setStyleSheet:(id)a3
{
  id v5 = (AVMobileChromelessControlsStyleSheet *)a3;
  if (self->_styleSheet != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->_styleSheet, a3);
    styleSheet = self->_styleSheet;
    if (self->_playbackControlButtonType) {
      [(AVMobileChromelessControlsStyleSheet *)styleSheet secondaryPlaybackControlsFont];
    }
    else {
    long long v7 = [(AVMobileChromelessControlsStyleSheet *)styleSheet playPauseButtonFont];
    }
    [(AVButton *)self setInlineFont:v7];
    [(AVMobileChromelessPlaybackControlButton *)self setNeedsLayout];

    [(AVMobileChromelessPlaybackControlButton *)self setNeedsLayout];
    id v5 = v8;
  }
}

+ (AVMobileChromelessPlaybackControlButton)buttonWithAccessibilityIdentifier:(id)a3 withStyleSheet:(id)a4 withPlaybackControlButtonType:(unint64_t)a5
{
  id v9 = a4;
  v29.receiver = a1;
  v29.super_class = (Class)&OBJC_METACLASS___AVMobileChromelessPlaybackControlButton;
  uint64_t v10 = objc_msgSendSuper2(&v29, sel_customHighlightedAnimationButtonWithAccessibilityIdentifier_, a3);
  *(unsigned char *)(v10 + 1064) = 0;
  objc_storeStrong((id *)(v10 + 1072), a4);
  *(void *)(v10 + 1040) = a5;
  if (a5)
  {
    id v11 = [v9 secondaryPlaybackControlsFont];
    [(id)v10 setInlineFont:v11];

    if (a5 == 2) {
      CGAffineTransform v12 = @"gobackward.10";
    }
    else {
      CGAffineTransform v12 = @"goforward.10";
    }
    [(id)v10 setImageName:v12];
  }
  else
  {
    [(id)v10 setImageName:@"AVMobileImageNameNoImage"];
    id v13 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    CGAffineTransform v14 = *(void **)(v10 + 1096);
    *(void *)(v10 + 1096) = v13;

    [*(id *)(v10 + 1096) setUserInteractionEnabled:0];
    objc_super v15 = [*(id *)(v10 + 1096) layer];
    [v15 setAllowsGroupBlending:1];

    [(id)v10 addSubview:*(void *)(v10 + 1096)];
    objc_super v16 = [v9 playPauseButtonFont];
    [(id)v10 setInlineFont:v16];

    [(id)v10 setPlaybackControlButtonIconState:@"pause"];
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  BOOL v18 = *(void **)(v10 + 1048);
  *(void *)(v10 + 1048) = v17;

  [*(id *)(v10 + 1048) setUserInteractionEnabled:0];
  int v19 = *(void **)(v10 + 1048);
  v20 = [MEMORY[0x1E4FB1618] whiteColor];
  [v19 setBackgroundColor:v20];

  [*(id *)(v10 + 1048) setAlpha:0.0];
  objc_msgSend(*(id *)(v10 + 1048), "setFrame:", 0.0, 0.0, 46.0, 46.0);
  uint64_t v21 = [*(id *)(v10 + 1048) layer];
  [*(id *)(v10 + 1048) frame];
  [v21 setCornerRadius:v22 * 0.5];

  v23 = [MEMORY[0x1E4FB1618] whiteColor];
  [(id)v10 setTintColor:v23];

  [(id)v10 setAutoresizingMask:0];
  v24 = [(id)v10 imageView];
  [v24 setContentMode:1];

  memset(&v28, 0, sizeof(v28));
  CGAffineTransformMakeScale(&v28, 1.4, 1.4);
  double v25 = *(void **)(v10 + 1048);
  CGAffineTransform v27 = v28;
  [v25 setTransform:&v27];
  [(id)v10 insertSubview:*(void *)(v10 + 1048) atIndex:0];

  return (AVMobileChromelessPlaybackControlButton *)(id)v10;
}

+ (id)backwardSecondaryButtonWithStyleSheet:(id)a3
{
  return +[AVMobileChromelessPlaybackControlButton buttonWithAccessibilityIdentifier:@"Backward Secondary Control" withStyleSheet:a3 withPlaybackControlButtonType:2];
}

+ (id)forwardSecondaryButtonWithStyleSheet:(id)a3
{
  return +[AVMobileChromelessPlaybackControlButton buttonWithAccessibilityIdentifier:@"Forward Secondary Control" withStyleSheet:a3 withPlaybackControlButtonType:1];
}

+ (id)playPauseButtonWithStyleSheet:(id)a3
{
  return +[AVMobileChromelessPlaybackControlButton buttonWithAccessibilityIdentifier:@"Play/Pause" withStyleSheet:a3 withPlaybackControlButtonType:0];
}

@end