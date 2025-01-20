@interface AVVolumeButtonControl
- (AVLayoutItemAttributes)layoutAttributes;
- (AVMicaPackage)micaPackage;
- (AVVolumeButtonControl)initWithFrame:(CGRect)a3;
- (BOOL)avkit_shouldPreventExternalGestureRecognizerAtPoint:(CGPoint)a3;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasAlternateAppearance;
- (BOOL)hasFullScreenAppearance;
- (BOOL)isCollapsed;
- (BOOL)isCollapsedOrExcluded;
- (BOOL)isIncluded;
- (BOOL)isLongPressEnabled;
- (BOOL)isRemoved;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)showsHighlightedAppearance;
- (CGPoint)cumulativeTranslationSincePanningBegan;
- (CGPoint)initialPreciseLocationOfTouch;
- (CGPoint)locationOfTouchInWindow;
- (CGPoint)translationOfPanFromPreviousTouch;
- (CGRect)hitRect;
- (CGSize)extrinsicContentSize;
- (CGSize)intrinsicContentSize;
- (NSDirectionalEdgeInsets)hitRectInsets;
- (NSString)micaPackageStateName;
- (NSTimer)longPressTimer;
- (UIImageView)imageView;
- (UISelectionFeedbackGenerator)feedbackGenerator;
- (UIView)micaPackageContainerView;
- (UIViewPropertyAnimator)highlightAnimator;
- (id)accessibilityLabel;
- (id)imageNameForMicaPackageState;
- (int64_t)trackingState;
- (int64_t)volumeControllerType;
- (void)_updateLayoutItem;
- (void)_updateMicaPackage:(id)a3;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutAttributesDidChange;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setCollapsed:(BOOL)a3;
- (void)setCumulativeTranslationSincePanningBegan:(CGPoint)a3;
- (void)setExtrinsicContentSize:(CGSize)a3;
- (void)setHasAlternateAppearance:(BOOL)a3;
- (void)setHasFullScreenAppearance:(BOOL)a3;
- (void)setHighlightAnimator:(id)a3;
- (void)setHitRectInsets:(NSDirectionalEdgeInsets)a3;
- (void)setImageView:(id)a3;
- (void)setIncluded:(BOOL)a3;
- (void)setInitialPreciseLocationOfTouch:(CGPoint)a3;
- (void)setLocationOfTouchInWindow:(CGPoint)a3;
- (void)setLongPressEnabled:(BOOL)a3;
- (void)setLongPressTimer:(id)a3;
- (void)setMicaPackage:(id)a3;
- (void)setMicaPackageContainerView:(id)a3;
- (void)setMicaPackageStateName:(id)a3;
- (void)setNeedsUpdateGlyphRenderingMode;
- (void)setRemoved:(BOOL)a3;
- (void)setShowsHighlightedAppearance:(BOOL)a3;
- (void)setTrackingState:(int64_t)a3;
- (void)setTranslationOfPanFromPreviousTouch:(CGPoint)a3;
- (void)setVolumeControllerType:(int64_t)a3;
- (void)triggerSelectionChangedFeedback;
@end

@implementation AVVolumeButtonControl

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_longPressTimer);
  objc_storeStrong((id *)&self->_micaPackageContainerView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_micaPackage, 0);
  objc_destroyWeak((id *)&self->_highlightAnimator);
  objc_storeStrong((id *)&self->_micaPackageStateName, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);

  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
}

- (int64_t)volumeControllerType
{
  return self->_volumeControllerType;
}

- (BOOL)showsHighlightedAppearance
{
  return self->_showsHighlightedAppearance;
}

- (int64_t)trackingState
{
  return self->_trackingState;
}

- (void)setLongPressTimer:(id)a3
{
}

- (NSTimer)longPressTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_longPressTimer);

  return (NSTimer *)WeakRetained;
}

- (void)setInitialPreciseLocationOfTouch:(CGPoint)a3
{
  self->_initialPreciseLocationOfTouch = a3;
}

- (CGPoint)initialPreciseLocationOfTouch
{
  double x = self->_initialPreciseLocationOfTouch.x;
  double y = self->_initialPreciseLocationOfTouch.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMicaPackageContainerView:(id)a3
{
}

- (UIView)micaPackageContainerView
{
  return self->_micaPackageContainerView;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (AVMicaPackage)micaPackage
{
  return self->_micaPackage;
}

- (void)setHighlightAnimator:(id)a3
{
}

- (UIViewPropertyAnimator)highlightAnimator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_highlightAnimator);

  return (UIViewPropertyAnimator *)WeakRetained;
}

- (void)setLocationOfTouchInWindow:(CGPoint)a3
{
  self->_locationOfTouchInWindow = a3;
}

- (CGPoint)locationOfTouchInWindow
{
  double x = self->_locationOfTouchInWindow.x;
  double y = self->_locationOfTouchInWindow.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCumulativeTranslationSincePanningBegan:(CGPoint)a3
{
  self->_cumulativeTranslationSincePanningBegan = a3;
}

- (CGPoint)cumulativeTranslationSincePanningBegan
{
  double x = self->_cumulativeTranslationSincePanningBegan.x;
  double y = self->_cumulativeTranslationSincePanningBegan.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTranslationOfPanFromPreviousTouch:(CGPoint)a3
{
  self->_translationOfPanFromPreviousTouch = a3;
}

- (CGPoint)translationOfPanFromPreviousTouch
{
  double x = self->_translationOfPanFromPreviousTouch.x;
  double y = self->_translationOfPanFromPreviousTouch.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setHitRectInsets:(NSDirectionalEdgeInsets)a3
{
  self->_hitRectInsets = a3;
}

- (NSDirectionalEdgeInsets)hitRectInsets
{
  double top = self->_hitRectInsets.top;
  double leading = self->_hitRectInsets.leading;
  double bottom = self->_hitRectInsets.bottom;
  double trailing = self->_hitRectInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setLongPressEnabled:(BOOL)a3
{
  self->_longPressEnabled = a3;
}

- (BOOL)isLongPressEnabled
{
  return self->_longPressEnabled;
}

- (NSString)micaPackageStateName
{
  return self->_micaPackageStateName;
}

- (AVLayoutItemAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (BOOL)isRemoved
{
  return self->_removed;
}

- (BOOL)hasFullScreenAppearance
{
  return self->_hasFullScreenAppearance;
}

- (void)setHasAlternateAppearance:(BOOL)a3
{
  self->_hasAlternateAppearance = a3;
}

- (BOOL)hasAlternateAppearance
{
  return self->_hasAlternateAppearance;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (BOOL)isIncluded
{
  return self->_included;
}

- (CGSize)extrinsicContentSize
{
  double width = self->_extrinsicContentSize.width;
  double height = self->_extrinsicContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_updateLayoutItem
{
  v3 = [(AVVolumeButtonControl *)self layoutAttributes];
  [(AVVolumeButtonControl *)self intrinsicContentSize];
  objc_msgSend(v3, "setMinimumSize:");

  v4 = [(AVVolumeButtonControl *)self layoutAttributes];
  if ([(AVVolumeButtonControl *)self isIncluded]) {
    uint64_t v5 = [(AVVolumeButtonControl *)self isRemoved] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }
  [v4 setIncluded:v5];

  id v6 = [(AVVolumeButtonControl *)self layoutAttributes];
  objc_msgSend(v6, "setCollapsed:", -[AVVolumeButtonControl isCollapsed](self, "isCollapsed"));
}

- (void)_updateMicaPackage:(id)a3
{
  id v4 = a3;
  if (v4 && ![(AVVolumeButtonControl *)self hasFullScreenAppearance])
  {
    BOOL v34 = [(UIView *)self avkit_isBeingScrolled];
    v35 = [(AVVolumeButtonControl *)self micaPackageStateName];
    [v4 setState:v35 color:0];

    if (v34)
    {
      objc_initWeak(&location, self);
      v36 = [(AVVolumeButtonControl *)self imageNameForMicaPackageState];
      v37 = (void *)MEMORY[0x1E4FB1818];
      v38 = [(AVVolumeButtonControl *)self imageNameForMicaPackageState];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __44__AVVolumeButtonControl__updateMicaPackage___block_invoke;
      v40[3] = &unk_1E5FC4438;
      objc_copyWeak(&v42, &location);
      id v39 = v36;
      id v41 = v39;
      objc_msgSend(v37, "avkit_imageNamed:completion:", v38, v40);

      objc_destroyWeak(&v42);
      objc_destroyWeak(&location);
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v5 = [(AVVolumeButtonControl *)self micaPackageStateName];
    [v4 setState:v5 color:0];
  }
  id v6 = [v4 rootLayer];
  v7 = [v6 superlayer];
  v8 = [(AVVolumeButtonControl *)self micaPackageContainerView];
  v9 = [v8 layer];

  if (v7 != v9)
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    v10 = [(AVVolumeButtonControl *)self micaPackageContainerView];
    [(AVVolumeButtonControl *)self addSubview:v10];

    v11 = [(AVVolumeButtonControl *)self layer];
    [v11 setCompositingFilter:0];

    v12 = [(AVVolumeButtonControl *)self micaPackageContainerView];
    v13 = [v12 layer];
    [v13 setCompositingFilter:0];

    v14 = [(AVVolumeButtonControl *)self micaPackageContainerView];
    v15 = [v14 layer];
    v16 = [v4 rootLayer];
    [v15 addSublayer:v16];

    [MEMORY[0x1E4F39CF8] commit];
  }
  v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
  v18 = [v17 traitCollection];
  if ([v18 userInterfaceIdiom] == 1)
  {
    int64_t v19 = [(AVVolumeButtonControl *)self volumeControllerType];

    if (v19 == 1) {
      double v20 = 1.2;
    }
    else {
      double v20 = 1.0;
    }
  }
  else
  {

    double v20 = 1.0;
  }
  BOOL v21 = [(AVVolumeButtonControl *)self hasFullScreenAppearance];
  double v22 = 20.0;
  if (v21) {
    double v22 = 24.0;
  }
  objc_msgSend(v4, "setTargetSize:", v20 * v22, v20 * v22);
  [(AVVolumeButtonControl *)self bounds];
  UIRectGetCenter();
  double v24 = v23;
  double v26 = v25;
  v27 = [v4 rootLayer];
  [v27 position];
  double v29 = v28;
  double v31 = v30;

  if (v24 != v29 || v26 != v31)
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    v32 = [v4 rootLayer];
    [(AVVolumeButtonControl *)self bounds];
    UIRectGetCenter();
    objc_msgSend(v32, "setPosition:");

    [MEMORY[0x1E4F39CF8] commit];
  }
  v33 = [(AVVolumeButtonControl *)self imageView];
  [v33 removeFromSuperview];

LABEL_17:
}

void __44__AVVolumeButtonControl__updateMicaPackage___block_invoke(uint64_t a1, void *a2)
{
  id v25 = a2;
  v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = [WeakRetained imageNameForMicaPackageState];
  LODWORD(a1) = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (a1)
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    id v6 = objc_loadWeakRetained(v3);
    v7 = [v6 micaPackage];
    v8 = [v7 rootLayer];
    [v8 removeFromSuperlayer];

    id v9 = objc_loadWeakRetained(v3);
    objc_msgSend(v9, "avkit_makeSubtreeDisallowGroupBlending");

    id v10 = objc_loadWeakRetained(v3);
    v11 = [v10 imageView];
    v12 = [v11 layer];
    [v12 setCompositingFilter:*MEMORY[0x1E4F3A2E8]];

    id v13 = objc_loadWeakRetained(v3);
    v14 = [v13 imageView];
    v15 = [MEMORY[0x1E4FB1618] whiteColor];
    [v14 setTintColor:v15];

    id v16 = objc_loadWeakRetained(v3);
    v17 = [v16 imageView];
    [v17 setImage:v25];

    id v18 = objc_loadWeakRetained(v3);
    int64_t v19 = [v18 imageView];
    id v20 = objc_loadWeakRetained(v3);
    [v20 bounds];
    objc_msgSend(v19, "setFrame:");

    id v21 = objc_loadWeakRetained(v3);
    double v22 = [v21 imageView];
    [v22 setContentMode:4];

    id v23 = objc_loadWeakRetained(v3);
    double v24 = [v23 imageView];
    [v23 addSubview:v24];

    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (void)layoutAttributesDidChange
{
  id v3 = [(AVVolumeButtonControl *)self layoutAttributes];
  -[AVVolumeButtonControl setCollapsed:](self, "setCollapsed:", [v3 isCollapsed]);
}

- (CGSize)intrinsicContentSize
{
  v13.receiver = self;
  v13.super_class = (Class)AVVolumeButtonControl;
  [(AVVolumeButtonControl *)&v13 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  [(AVVolumeButtonControl *)self extrinsicContentSize];
  if (v7 > 0.0)
  {
    [(AVVolumeButtonControl *)self extrinsicContentSize];
    double v4 = v8;
  }
  [(AVVolumeButtonControl *)self extrinsicContentSize];
  if (v9 > 0.0)
  {
    [(AVVolumeButtonControl *)self extrinsicContentSize];
    double v6 = v10;
  }
  double v11 = v4;
  double v12 = v6;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(AVVolumeButtonControl *)self hitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (CGRect)hitRect
{
  v26.receiver = self;
  v26.super_class = (Class)AVVolumeButtonControl;
  [(AVVolumeButtonControl *)&v26 hitRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(AVVolumeButtonControl *)self hitRectInsets];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  uint64_t v19 = [(AVVolumeButtonControl *)self effectiveUserInterfaceLayoutDirection];
  if (v19 == 1) {
    double v20 = v18;
  }
  else {
    double v20 = v14;
  }
  if (v19 == 1) {
    double v21 = v14;
  }
  else {
    double v21 = v18;
  }
  double v22 = v4 + v20;
  double v23 = v6 + v12;
  double v24 = v8 - (v20 + v21);
  double v25 = v10 - (v12 + v16);
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVVolumeButtonControl;
  -[AVVolumeButtonControl setBounds:](&v5, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = [(AVVolumeButtonControl *)self micaPackage];
  [(AVVolumeButtonControl *)self _updateMicaPackage:v4];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  double v4 = [a3 view];
  LOBYTE(self) = [v4 isDescendantOfView:self];

  return (char)self;
}

- (id)accessibilityLabel
{
  return AVLocalizedString(@"Mute");
}

- (void)cancelTrackingWithEvent:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVVolumeButtonControl;
  [(AVVolumeButtonControl *)&v5 cancelTrackingWithEvent:a3];
  double v4 = [(AVVolumeButtonControl *)self longPressTimer];
  [v4 invalidate];

  [(AVVolumeButtonControl *)self setTrackingState:0];
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)AVVolumeButtonControl;
  [(AVVolumeButtonControl *)&v9 endTrackingWithTouch:v6 withEvent:v7];
  double v8 = [(AVVolumeButtonControl *)self longPressTimer];
  [v8 invalidate];

  if ([(AVVolumeButtonControl *)self trackingState] == 1)
  {
    [v6 locationInView:self];
    if (-[AVVolumeButtonControl pointInside:withEvent:](self, "pointInside:withEvent:", v7)) {
      [(AVVolumeButtonControl *)self setTrackingState:2];
    }
  }
  [(AVVolumeButtonControl *)self setTrackingState:0];
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)AVVolumeButtonControl;
  BOOL v7 = [(AVVolumeButtonControl *)&v39 continueTrackingWithTouch:v6 withEvent:a4];
  if (v7)
  {
    if ([(AVVolumeButtonControl *)self trackingState] == 1)
    {
      if ([(AVVolumeButtonControl *)self isLongPressEnabled]
        && ([v6 force], v8 > 3.0))
      {
        [(AVVolumeButtonControl *)self setTrackingState:3];
      }
      else
      {
        [(AVVolumeButtonControl *)self hitRect];
        CGFloat v10 = v9;
        CGFloat v12 = v11;
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        [v6 locationInView:self];
        v40.CGFloat x = v17;
        v40.CGFloat y = v18;
        v41.origin.CGFloat x = v10;
        v41.origin.CGFloat y = v12;
        v41.size.double width = v14;
        v41.size.double height = v16;
        [(AVVolumeButtonControl *)self setShowsHighlightedAppearance:CGRectContainsPoint(v41, v40)];
      }
    }
    [v6 preciseLocationInView:self];
    double v20 = v19;
    [(AVVolumeButtonControl *)self initialPreciseLocationOfTouch];
    double v22 = v20 - v21;
    if (v22 < 0.0) {
      double v22 = -v22;
    }
    if (v22 > 15.0 || [(AVVolumeButtonControl *)self trackingState] == 4)
    {
      int64_t v23 = [(AVVolumeButtonControl *)self trackingState];
      if (v23 == 4)
      {
        [v6 preciseLocationInView:self];
        double v25 = v24;
        double v27 = v26;
        [v6 precisePreviousLocationInView:self];
        -[AVVolumeButtonControl setTranslationOfPanFromPreviousTouch:](self, "setTranslationOfPanFromPreviousTouch:", v25 - v28, v27 - v29);
        [(AVVolumeButtonControl *)self cumulativeTranslationSincePanningBegan];
        double v31 = v30;
        double v33 = v32;
        [(AVVolumeButtonControl *)self translationOfPanFromPreviousTouch];
        if (v34 >= 0.0) {
          double v35 = v34;
        }
        else {
          double v35 = -v34;
        }
        [(AVVolumeButtonControl *)self translationOfPanFromPreviousTouch];
        if (v36 < 0.0) {
          double v36 = -v36;
        }
        -[AVVolumeButtonControl setCumulativeTranslationSincePanningBegan:](self, "setCumulativeTranslationSincePanningBegan:", v31 + v35, v33 + v36);
        v37 = [(AVVolumeButtonControl *)self window];
        [v6 preciseLocationInView:v37];
        -[AVVolumeButtonControl setLocationOfTouchInWindow:](self, "setLocationOfTouchInWindow:");

        [(AVVolumeButtonControl *)self sendActionsForControlEvents:0x2000000];
      }
      else if (v23 == 3 || v23 == 1)
      {
        [(AVVolumeButtonControl *)self setTrackingState:4];
      }
    }
  }

  return v7;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)AVVolumeButtonControl;
  BOOL v8 = [(AVVolumeButtonControl *)&v19 beginTrackingWithTouch:v6 withEvent:v7];
  if (v8)
  {
    if ([(AVVolumeButtonControl *)self isLongPressEnabled])
    {
      objc_initWeak(&location, self);
      double v9 = (void *)MEMORY[0x1E4F1CB00];
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      double v15 = __58__AVVolumeButtonControl_beginTrackingWithTouch_withEvent___block_invoke;
      CGFloat v16 = &unk_1E5FC4480;
      objc_copyWeak(&v17, &location);
      CGFloat v10 = [v9 scheduledTimerWithTimeInterval:0 repeats:&v13 block:0.5];
      -[AVVolumeButtonControl setLongPressTimer:](self, "setLongPressTimer:", v10, v13, v14, v15, v16);
      double v11 = [(AVVolumeButtonControl *)self longPressTimer];
      [v11 setTolerance:0.05];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    [(AVVolumeButtonControl *)self setTrackingState:1];
    [v6 preciseLocationInView:self];
    -[AVVolumeButtonControl setInitialPreciseLocationOfTouch:](self, "setInitialPreciseLocationOfTouch:");
  }

  return v8;
}

void __58__AVVolumeButtonControl_beginTrackingWithTouch_withEvent___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained trackingState];

  if (v3 == 1)
  {
    id v4 = objc_loadWeakRetained(v1);
    [v4 setTrackingState:3];
  }
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)AVVolumeButtonControl;
  [(AVVolumeButtonControl *)&v10 layoutSubviews];
  uint64_t v3 = [(AVVolumeButtonControl *)self micaPackageContainerView];
  id v4 = v3;
  if (v3) {
    [v3 transform];
  }
  else {
    memset(&v9, 0, sizeof(v9));
  }
  IsIdentitCGFloat y = CGAffineTransformIsIdentity(&v9);

  if (IsIdentity)
  {
    id v6 = [(AVVolumeButtonControl *)self micaPackageContainerView];
    [(AVVolumeButtonControl *)self bounds];
    objc_msgSend(v6, "setFrame:");

    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    id v7 = [(AVVolumeButtonControl *)self micaPackage];
    BOOL v8 = [v7 rootLayer];
    [(AVVolumeButtonControl *)self bounds];
    UIRectGetCenter();
    objc_msgSend(v8, "setPosition:");

    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (BOOL)avkit_shouldPreventExternalGestureRecognizerAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(AVVolumeButtonControl *)self hitRect];
  CGFloat v9 = x;
  CGFloat v10 = y;

  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (id)imageNameForMicaPackageState
{
  if (imageNameForMicaPackageState_onceToken != -1) {
    dispatch_once(&imageNameForMicaPackageState_onceToken, &__block_literal_global_20544);
  }
  uint64_t v3 = (void *)imageNameForMicaPackageState_imageNamesForStates;
  uint64_t v4 = [(AVVolumeButtonControl *)self micaPackageStateName];
  uint64_t v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = @"half";
  }
  id v7 = [v3 objectForKeyedSubscript:v6];

  return v7;
}

void __53__AVVolumeButtonControl_imageNameForMicaPackageState__block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"mute";
  v2[1] = @"off";
  v3[0] = @"VolumeMuted";
  v3[1] = @"VolumeZero";
  v2[2] = @"min";
  v2[3] = @"half";
  v3[2] = @"VolumeLow";
  v3[3] = @"VolumeMedium";
  v2[4] = @"full";
  v3[4] = @"VolumeHigh";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:5];
  v1 = (void *)imageNameForMicaPackageState_imageNamesForStates;
  imageNameForMicaPackageState_imageNamesForStates = v0;
}

- (void)setNeedsUpdateGlyphRenderingMode
{
  id v3 = [(AVVolumeButtonControl *)self micaPackage];
  [(AVVolumeButtonControl *)self _updateMicaPackage:v3];
}

- (void)setTrackingState:(int64_t)a3
{
  int64_t trackingState = self->_trackingState;
  if (trackingState != a3)
  {
    self->_int64_t trackingState = a3;
    switch(a3)
    {
      case 0:
        if (trackingState == 4) {
          [(AVVolumeButtonControl *)self sendActionsForControlEvents:0x4000000];
        }
        double v5 = *MEMORY[0x1E4F1DAD8];
        double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        -[AVVolumeButtonControl setCumulativeTranslationSincePanningBegan:](self, "setCumulativeTranslationSincePanningBegan:", *MEMORY[0x1E4F1DAD8], v6);
        -[AVVolumeButtonControl setTranslationOfPanFromPreviousTouch:](self, "setTranslationOfPanFromPreviousTouch:", v5, v6);
        -[AVVolumeButtonControl setLocationOfTouchInWindow:](self, "setLocationOfTouchInWindow:", v5, v6);
        goto LABEL_12;
      case 1:
        id v8 = [(AVVolumeButtonControl *)self feedbackGenerator];
        [v8 prepare];

        return;
      case 2:
        uint64_t v7 = 0x400000;
        goto LABEL_8;
      case 3:
        uint64_t v7 = 0x800000;
LABEL_8:
        [(AVVolumeButtonControl *)self sendActionsForControlEvents:v7];
        break;
      case 4:
        [(AVVolumeButtonControl *)self sendActionsForControlEvents:0x1000000];
LABEL_12:
        [(AVVolumeButtonControl *)self setShowsHighlightedAppearance:0];
        break;
      default:
        return;
    }
  }
}

- (void)setShowsHighlightedAppearance:(BOOL)a3
{
  if ([(AVVolumeButtonControl *)self showsHighlightedAppearance] != a3)
  {
    self->_showsHighlightedAppearance = a3;
    double v5 = [(AVVolumeButtonControl *)self highlightAnimator];
    if ([v5 isRunning] && objc_msgSend(v5, "isInterruptible"))
    {
      [v5 stopAnimation:0];
      [v5 finishAnimationAtPosition:2];
    }
    if (([v5 isRunning] & 1) == 0)
    {
      id v6 = objc_alloc(MEMORY[0x1E4FB1ED8]);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __55__AVVolumeButtonControl_setShowsHighlightedAppearance___block_invoke;
      v8[3] = &unk_1E5FC4698;
      v8[4] = self;
      uint64_t v7 = (void *)[v6 initWithDuration:3 curve:v8 animations:0.1];

      [v7 startAnimation];
      [(AVVolumeButtonControl *)self setHighlightAnimator:v7];
      double v5 = v7;
    }
  }
}

void __55__AVVolumeButtonControl_setShowsHighlightedAppearance___block_invoke(uint64_t a1)
{
  memset(&v5, 0, sizeof(v5));
  if ([*(id *)(a1 + 32) showsHighlightedAppearance])
  {
    CGAffineTransformMakeScale(&v5, 0.75, 0.75);
  }
  else
  {
    long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v5.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v5.c = v2;
    *(_OWORD *)&v5.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  id v3 = [*(id *)(a1 + 32) micaPackageContainerView];
  CGAffineTransform v4 = v5;
  [v3 setTransform:&v4];
}

- (void)setHasFullScreenAppearance:(BOOL)a3
{
  if (self->_hasFullScreenAppearance != a3)
  {
    self->_hasFullScreenAppearance = a3;
    id v4 = [(AVVolumeButtonControl *)self micaPackage];
    [(AVVolumeButtonControl *)self _updateMicaPackage:v4];
  }
}

- (void)triggerSelectionChangedFeedback
{
  if ([(AVVolumeButtonControl *)self isTracking])
  {
    id v3 = [(AVVolumeButtonControl *)self feedbackGenerator];
    [v3 selectionChanged];
  }
}

- (void)setMicaPackageStateName:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_micaPackageStateName, "isEqualToString:"))
  {
    id v4 = (NSString *)[v7 copy];
    micaPackageStateName = self->_micaPackageStateName;
    self->_micaPackageStateName = v4;

    id v6 = [(AVVolumeButtonControl *)self micaPackage];
    [(AVVolumeButtonControl *)self _updateMicaPackage:v6];
  }
}

- (void)setMicaPackage:(id)a3
{
  CGAffineTransform v5 = (AVMicaPackage *)a3;
  p_micaPackage = &self->_micaPackage;
  if (self->_micaPackage != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_micaPackage, a3);
    if (v7)
    {
      [(AVVolumeButtonControl *)self _updateMicaPackage:v7];
      p_micaPackage = (AVMicaPackage **)[(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
    }
  }

  MEMORY[0x1F4181820](p_micaPackage);
}

- (void)setExtrinsicContentSize:(CGSize)a3
{
  if (a3.width != self->_extrinsicContentSize.width || a3.height != self->_extrinsicContentSize.height)
  {
    self->_extrinsicContentSize = a3;
    [(AVVolumeButtonControl *)self invalidateIntrinsicContentSize];
    [(AVVolumeButtonControl *)self _updateLayoutItem];
  }
}

- (void)setRemoved:(BOOL)a3
{
  if (self->_removed != a3)
  {
    self->_removed = a3;
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
    [(AVVolumeButtonControl *)self _updateLayoutItem];
  }
}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
    [(AVVolumeButtonControl *)self _updateLayoutItem];
  }
}

- (void)setIncluded:(BOOL)a3
{
  if (self->_included != a3)
  {
    self->_included = a3;
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
    [(AVVolumeButtonControl *)self _updateLayoutItem];
  }
}

- (BOOL)isCollapsedOrExcluded
{
  if ([(AVVolumeButtonControl *)self isCollapsed]
    || ![(AVVolumeButtonControl *)self isIncluded])
  {
    return 1;
  }
  id v3 = [(AVVolumeButtonControl *)self micaPackage];
  if (v3) {
    BOOL v4 = [(AVVolumeButtonControl *)self isRemoved];
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)setVolumeControllerType:(int64_t)a3
{
  self->_volumeControllerType = a3;
}

- (UISelectionFeedbackGenerator)feedbackGenerator
{
  feedbackGenerator = self->_feedbackGenerator;
  if (!feedbackGenerator)
  {
    BOOL v4 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E4FB1C18]);
    CGAffineTransform v5 = self->_feedbackGenerator;
    self->_feedbackGenerator = v4;

    feedbackGenerator = self->_feedbackGenerator;
  }

  return feedbackGenerator;
}

- (AVVolumeButtonControl)initWithFrame:(CGRect)a3
{
  v30.receiver = self;
  v30.super_class = (Class)AVVolumeButtonControl;
  id v3 = -[AVVolumeButtonControl initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  BOOL v4 = v3;
  if (v3)
  {
    v3->_longPressEnabled = 1;
    v3->_int64_t trackingState = 0;
    v3->_included = 1;
    *(_OWORD *)&v3->_hitRectInsets.double top = AVDefaultHitRectInsets_20550;
    *(_OWORD *)&v3->_hitRectInsets.double bottom = unk_1B0721458;
    v3->_volumeControllerType = 0;
    id v5 = objc_alloc(MEMORY[0x1E4FB1838]);
    [(AVVolumeButtonControl *)v4 bounds];
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:");
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(AVVolumeButtonControl *)v4 bounds];
    uint64_t v9 = objc_msgSend(v8, "initWithFrame:");
    micaPackageContainerView = v4->_micaPackageContainerView;
    v4->_micaPackageContainerView = (UIView *)v9;

    double v11 = [(AVVolumeButtonControl *)v4 layer];
    [v11 setAllowsGroupBlending:0];

    CGFloat v12 = [(UIView *)v4->_micaPackageContainerView layer];
    [v12 setAllowsGroupBlending:0];

    LODWORD(v13) = 1148846080;
    [(AVVolumeButtonControl *)v4 setContentHuggingPriority:0 forAxis:v13];
    LODWORD(v14) = 1148846080;
    [(AVVolumeButtonControl *)v4 setContentHuggingPriority:1 forAxis:v14];
    LODWORD(v15) = 1148846080;
    [(AVVolumeButtonControl *)v4 setContentCompressionResistancePriority:0 forAxis:v15];
    LODWORD(v16) = 1148846080;
    [(AVVolumeButtonControl *)v4 setContentCompressionResistancePriority:1 forAxis:v16];
    [(AVVolumeButtonControl *)v4 setAccessibilityIdentifier:@"Mute Toggle"];
    [(AVVolumeButtonControl *)v4 setIsAccessibilityElement:1];
    [(UIView *)v4 avkit_reevaluateHiddenStateOfItem:v4];
    uint64_t v17 = [(AVVolumeButtonControl *)v4 effectiveUserInterfaceLayoutDirection];
    objc_initWeak(&location, v4);
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    double v26 = __39__AVVolumeButtonControl_initWithFrame___block_invoke;
    double v27 = &unk_1E5FC3DE8;
    objc_copyWeak(&v28, &location);
    +[AVMicaPackage asynchronouslyPrepareMicaPackageWithName:@"VolumeGlyph" layoutDirection:v17 completion:&v24];
    CGFloat v18 = objc_alloc_init(AVLayoutItemAttributes);
    layoutAttributes = v4->_layoutAttributes;
    v4->_layoutAttributes = v18;

    double v20 = v4->_layoutAttributes;
    [(AVVolumeButtonControl *)v4 intrinsicContentSize];
    -[AVLayoutItemAttributes setMinimumSize:](v20, "setMinimumSize:");
    [(AVLayoutItemAttributes *)v4->_layoutAttributes setCollapsed:[(AVVolumeButtonControl *)v4 isCollapsed]];
    [(AVLayoutItemAttributes *)v4->_layoutAttributes setIncluded:[(AVVolumeButtonControl *)v4 isIncluded]];
    [(AVLayoutItemAttributes *)v4->_layoutAttributes setHasFlexibleContentSize:0];
    double v21 = v4->_layoutAttributes;
    double v22 = [(AVVolumeButtonControl *)v4 accessibilityIdentifier];
    [(AVLayoutItemAttributes *)v21 setAccessibilityIdentifier:v22];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __39__AVVolumeButtonControl_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateMicaPackage:v3];

  id v5 = objc_loadWeakRetained(v2);
  [v5 setMicaPackage:v3];
}

@end