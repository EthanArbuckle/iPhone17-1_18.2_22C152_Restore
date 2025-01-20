@interface AVVolumeSlider
- (AVLayoutItemAttributes)layoutAttributes;
- (AVVolumeSlider)initWithFrame:(CGRect)a3;
- (AVVolumeSlider)initWithFrame:(CGRect)a3 thumbSize:(double)a4;
- (BOOL)_shouldTrackTouchAtPoint:(CGPoint)a3;
- (BOOL)avkit_shouldPreventExternalGestureRecognizerAtPoint:(CGPoint)a3;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasAlternateAppearance;
- (BOOL)hasChangedLocationAtLeastOnce;
- (BOOL)hasFullScreenAppearance;
- (BOOL)isAnimatingVolumeChange;
- (BOOL)isCollapsed;
- (BOOL)isCollapsedOrExcluded;
- (BOOL)isIncluded;
- (BOOL)isRemoved;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)scrubsWhenTappedAnywhere;
- (CGRect)hitRect;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (CGSize)extrinsicContentSize;
- (CGSize)intrinsicContentSize;
- (UIEdgeInsets)alignmentRectInsets;
- (UIImageView)thumbView;
- (double)thumbSize;
- (id)accessibilityLabel;
- (id)createThumbView;
- (void)_commonInit;
- (void)_endTracking;
- (void)_updateLayoutItem;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)didMoveToWindow;
- (void)layoutAttributesDidChange;
- (void)layoutSubviews;
- (void)setAnimatingVolumeChange:(BOOL)a3;
- (void)setCollapsed:(BOOL)a3;
- (void)setExtrinsicContentSize:(CGSize)a3;
- (void)setHasAlternateAppearance:(BOOL)a3;
- (void)setHasChangedLocationAtLeastOnce:(BOOL)a3;
- (void)setHasFullScreenAppearance:(BOOL)a3;
- (void)setIncluded:(BOOL)a3;
- (void)setRemoved:(BOOL)a3;
- (void)setScrubsWhenTappedAnywhere:(BOOL)a3;
- (void)setThumbSize:(double)a3;
- (void)setThumbView:(id)a3;
- (void)setValue:(float)a3 animated:(BOOL)a4;
@end

@implementation AVVolumeSlider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutAttributes, 0);

  objc_storeStrong((id *)&self->_thumbView, 0);
}

- (void)setScrubsWhenTappedAnywhere:(BOOL)a3
{
  self->_scrubsWhenTappedAnywhere = a3;
}

- (BOOL)scrubsWhenTappedAnywhere
{
  return self->_scrubsWhenTappedAnywhere;
}

- (void)setHasChangedLocationAtLeastOnce:(BOOL)a3
{
  self->_hasChangedLocationAtLeastOnce = a3;
}

- (BOOL)hasChangedLocationAtLeastOnce
{
  return self->_hasChangedLocationAtLeastOnce;
}

- (void)setThumbSize:(double)a3
{
  self->_thumbSize = a3;
}

- (double)thumbSize
{
  return self->_thumbSize;
}

- (void)setAnimatingVolumeChange:(BOOL)a3
{
  self->_animatingVolumeChange = a3;
}

- (BOOL)isAnimatingVolumeChange
{
  return self->_animatingVolumeChange;
}

- (AVLayoutItemAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (BOOL)isRemoved
{
  return self->_removed;
}

- (void)setThumbView:(id)a3
{
}

- (UIImageView)thumbView
{
  return self->_thumbView;
}

- (void)setHasFullScreenAppearance:(BOOL)a3
{
  self->_hasFullScreenAppearance = a3;
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
  v3 = [(AVVolumeSlider *)self layoutAttributes];
  [(AVVolumeSlider *)self intrinsicContentSize];
  objc_msgSend(v3, "setMinimumSize:");

  v4 = [(AVVolumeSlider *)self layoutAttributes];
  if ([(AVVolumeSlider *)self isIncluded]) {
    uint64_t v5 = [(AVVolumeSlider *)self isRemoved] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }
  [v4 setIncluded:v5];

  id v6 = [(AVVolumeSlider *)self layoutAttributes];
  objc_msgSend(v6, "setCollapsed:", -[AVVolumeSlider isCollapsed](self, "isCollapsed"));
}

- (BOOL)_shouldTrackTouchAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if ([(AVVolumeSlider *)self scrubsWhenTappedAnywhere]) {
    return 1;
  }
  v7 = [(AVVolumeSlider *)self thumbView];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(AVVolumeSlider *)self thumbView];
  -[AVVolumeSlider convertRect:fromView:](self, "convertRect:fromView:", v16, v9, v11, v13, v15);
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;

  v28.origin.CGFloat x = v18;
  v28.origin.CGFloat y = v20;
  v28.size.double width = v22;
  v28.size.double height = v24;
  CGRect v29 = CGRectInset(v28, -16.0, -16.0);
  CGFloat v25 = x;
  CGFloat v26 = y;

  return CGRectContainsPoint(v29, *(CGPoint *)&v25);
}

- (void)_endTracking
{
  v3 = [(AVVolumeSlider *)self _edgeFeedbackGenerator];
  [v3 userInteractionEnded];

  v4 = [(AVVolumeSlider *)self _modulationFeedbackGenerator];
  [v4 deactivate];

  [(AVVolumeSlider *)self setTracking:0];

  [(AVVolumeSlider *)self setHighlighted:0];
}

- (void)layoutAttributesDidChange
{
  id v3 = [(AVVolumeSlider *)self layoutAttributes];
  -[AVVolumeSlider setCollapsed:](self, "setCollapsed:", [v3 isCollapsed]);
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  if (a4)
  {
    [(AVVolumeSlider *)self setAnimatingVolumeChange:1];
    objc_initWeak(&location, self);
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1C58]) initWithDampingRatio:0.75];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1ED8]) initWithDuration:v6 timingParameters:0.35];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__AVVolumeSlider_setValue_animated___block_invoke;
    v10[3] = &unk_1E5FC21A0;
    objc_copyWeak(&v11, &location);
    float v12 = a3;
    [v7 addAnimations:v10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __36__AVVolumeSlider_setValue_animated___block_invoke_2;
    v9[3] = &unk_1E5FC3710;
    v9[4] = self;
    [v7 addCompletion:v9];
    [v7 startAnimation];
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVVolumeSlider;
    -[AVVolumeSlider setValue:animated:](&v8, sel_setValue_animated_, *(double *)&a3);
  }
}

void __36__AVVolumeSlider_setValue_animated___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  LODWORD(v4) = *(_DWORD *)(a1 + 40);
  [WeakRetained setValue:v4];

  id v5 = objc_loadWeakRetained(v2);
  [v5 layoutIfNeeded];
}

uint64_t __36__AVVolumeSlider_setValue_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAnimatingVolumeChange:0];
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGRectGetHeight(a3);
  UIRoundToViewScale();
  CGFloat v8 = v7;
  CGFloat v9 = x;
  CGFloat v10 = y;
  CGFloat v11 = width;
  CGFloat v12 = height;

  return CGRectInset(*(CGRect *)&v9, 0.0, v8);
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v20 = a3.size.width;
  CGFloat rect = a3.size.height;
  CGFloat v19 = a3.origin.y;
  CGFloat v9 = a3.origin.x;
  if ([(AVVolumeSlider *)self isEnabled])
  {
    [(AVVolumeSlider *)self thumbSize];
  }
  else
  {
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    double v11 = CGRectGetHeight(v22);
  }
  double v12 = v11;
  double v13 = v11;
  if ([(AVVolumeSlider *)self isTracking])
  {
    v23.origin.CGFloat x = v9;
    v23.origin.CGFloat y = v19;
    v23.size.CGFloat width = v20;
    v23.size.CGFloat height = rect;
    double v14 = CGRectGetHeight(v23);
    if (v12 >= v14) {
      double v13 = v14;
    }
    else {
      double v13 = v12;
    }
  }
  [(AVVolumeSlider *)self effectiveUserInterfaceLayoutDirection];
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGRectGetWidth(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGRectGetMinX(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGRectGetMidY(v26);
  UIPointRoundToViewScale();
  double v17 = v13;
  double v18 = v13;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (id)createThumbView
{
  v7.receiver = self;
  v7.super_class = (Class)AVVolumeSlider;
  id v3 = [(AVVolumeSlider *)&v7 createThumbView];
  [(AVVolumeSlider *)self setThumbView:v3];

  double v4 = [(AVVolumeSlider *)self thumbView];
  id v5 = [MEMORY[0x1E4FB1618] whiteColor];
  [v4 setBackgroundColor:v5];

  [(AVVolumeSlider *)self thumbView];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)cancelTrackingWithEvent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVVolumeSlider;
  [(AVVolumeSlider *)&v4 cancelTrackingWithEvent:a3];
  [(AVVolumeSlider *)self _endTracking];
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  [(AVVolumeSlider *)self bounds];
  -[AVVolumeSlider trackRectForBounds:](self, "trackRectForBounds:");
  double Width = CGRectGetWidth(v29);
  [v5 locationInView:self];
  double v8 = v7;
  [v5 previousLocationInView:self];
  double v10 = v8 - v9;
  if ([(AVVolumeSlider *)self hasChangedLocationAtLeastOnce])
  {
    uint64_t v11 = [(AVVolumeSlider *)self effectiveUserInterfaceLayoutDirection];
    BOOL v12 = Width > 0.0;
    if (Width > 0.0 && v10 != 0.0)
    {
      if (v11 == 1) {
        double v13 = -(v10 / Width);
      }
      else {
        double v13 = v10 / Width;
      }
      [v5 locationInView:self];
      double v15 = v14;
      [(AVVolumeSlider *)self bounds];
      -[AVVolumeSlider trackRectForBounds:](self, "trackRectForBounds:");
      if (v15 >= CGRectGetMinX(v30) || (double v16 = 0.0, v13 <= 0.0))
      {
        [v5 locationInView:self];
        double v18 = v17;
        [(AVVolumeSlider *)self bounds];
        -[AVVolumeSlider trackRectForBounds:](self, "trackRectForBounds:");
        double MaxX = CGRectGetMaxX(v31);
        if (v13 >= 0.0 || v18 <= MaxX) {
          double v16 = 1.0;
        }
        else {
          double v16 = 0.0;
        }
      }
      [(AVVolumeSlider *)self value];
      float v22 = fmin(fmax(v21 + v13 * v16, 0.0), 1.0);
      CGRect v23 = [(AVVolumeSlider *)self _edgeFeedbackGenerator];
      CGRect v24 = [(AVVolumeSlider *)self _edgeFeedbackGenerator];
      [v24 distance];
      [v23 positionUpdated:v25 * v22];

      CGRect v26 = [(AVVolumeSlider *)self _modulationFeedbackGenerator];
      [v26 valueUpdated:v22];

      *(float *)&double v27 = v22;
      [(AVVolumeSlider *)self setValue:0 animated:v27];
      [(AVVolumeSlider *)self sendActionsForControlEvents:4096];
      BOOL v12 = 1;
      [(AVVolumeSlider *)self setHighlighted:1];
    }
  }
  else
  {
    [(AVVolumeSlider *)self setHasChangedLocationAtLeastOnce:v10 != 0.0];
    BOOL v12 = 1;
  }

  return v12;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  [(AVVolumeSlider *)self setHasChangedLocationAtLeastOnce:0];
  [v5 locationInView:self];
  double v7 = v6;
  CGFloat v9 = v8;
  if ([v5 _isPointerTouch])
  {
    double v10 = [(AVVolumeSlider *)self thumbView];
    [v10 frame];
    v16.CGFloat x = v7;
    v16.CGFloat y = v9;
    [(AVVolumeSlider *)self setScrubsWhenTappedAnywhere:!CGRectContainsPoint(v17, v16)];
  }
  else
  {
    [(AVVolumeSlider *)self setScrubsWhenTappedAnywhere:0];
  }
  [v5 locationInView:self];
  BOOL v11 = -[AVVolumeSlider _shouldTrackTouchAtPoint:](self, "_shouldTrackTouchAtPoint:");
  if (v11)
  {
    BOOL v12 = [(AVVolumeSlider *)self _edgeFeedbackGenerator];
    [v12 userInteractionStarted];

    double v13 = [(AVVolumeSlider *)self _modulationFeedbackGenerator];
    [v13 activateWithCompletionBlock:0];

    if ([(AVVolumeSlider *)self scrubsWhenTappedAnywhere])
    {
      [(AVVolumeSlider *)self bounds];
      -[AVVolumeSlider trackRectForBounds:](self, "trackRectForBounds:");
      double v14 = fmin(fmax(v7 / CGRectGetWidth(v18), 0.0), 1.0);
      *(float *)&double v14 = v14;
      [(AVVolumeSlider *)self setValue:0 animated:v14];
      [(AVVolumeSlider *)self sendActionsForControlEvents:4096];
    }
  }

  return v11;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(AVVolumeSlider *)self hitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (CGRect)hitRect
{
  v15.receiver = self;
  v15.super_class = (Class)AVVolumeSlider;
  [(AVVolumeSlider *)&v15 hitRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(AVVolumeSlider *)self effectiveUserInterfaceLayoutDirection];
  double v11 = v4 + -16.0;
  double v12 = v6 + -16.0;
  double v13 = v8 + 32.0;
  double v14 = v10 + 32.0;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  double v4 = [a3 view];
  LOBYTE(self) = [v4 isDescendantOfView:self];

  return (char)self;
}

- (void)layoutSubviews
{
  v47.receiver = self;
  v47.super_class = (Class)AVVolumeSlider;
  [(AVVolumeSlider *)&v47 layoutSubviews];
  double v3 = [(AVVolumeSlider *)self _minTrackView];
  double v4 = [v3 layer];
  [v4 cornerRadius];
  if (v5 == 0.0)
  {
  }
  else
  {
    double v6 = [(AVVolumeSlider *)self thumbView];
    double v7 = [v6 layer];
    [v7 cornerRadius];
    double v9 = v8;

    if (v9 != 0.0)
    {
      uint64_t v10 = *MEMORY[0x1E4F39EA0];
      double v11 = [(AVVolumeSlider *)self thumbView];
      double v12 = [v11 layer];
      [v12 setCornerCurve:v10];

      double v13 = [(AVVolumeSlider *)self thumbView];
      [v13 bounds];
      CGRectGetHeight(v48);
      UIFloorToViewScale();
      double v15 = v14;
      CGPoint v16 = [(AVVolumeSlider *)self thumbView];
      CGRect v17 = [v16 layer];
      [v17 setCornerRadius:v15];

      goto LABEL_9;
    }
  }
  CGRect v18 = [(AVVolumeSlider *)self _minTrackView];
  CGFloat v19 = [v18 layer];
  uint64_t v20 = *MEMORY[0x1E4F39EA0];
  [v19 setCornerCurve:*MEMORY[0x1E4F39EA0]];

  float v21 = [(AVVolumeSlider *)self _minTrackView];
  float v22 = [v21 layer];
  [v22 setCornerRadius:2.5];

  CGRect v23 = [(AVVolumeSlider *)self _maxTrackView];
  CGRect v24 = [v23 layer];
  [v24 setCornerCurve:v20];

  double v25 = [(AVVolumeSlider *)self _maxTrackView];
  CGRect v26 = [v25 layer];
  [v26 setCornerRadius:2.5];

  uint64_t v27 = [(AVVolumeSlider *)self effectiveUserInterfaceLayoutDirection];
  CGRect v28 = [(AVVolumeSlider *)self _minTrackView];
  CGRect v29 = [v28 layer];
  CGRect v30 = v29;
  if (v27)
  {
    [v29 setMaskedCorners:10];

    CGRect v31 = [(AVVolumeSlider *)self _maxTrackView];
    v32 = [v31 layer];
    v33 = v32;
    uint64_t v34 = 5;
  }
  else
  {
    [v29 setMaskedCorners:5];

    CGRect v31 = [(AVVolumeSlider *)self _maxTrackView];
    v32 = [v31 layer];
    v33 = v32;
    uint64_t v34 = 10;
  }
  [v32 setMaskedCorners:v34];

  v35 = [(AVVolumeSlider *)self thumbView];
  v36 = [v35 layer];
  [v36 setCornerCurve:v20];

  v37 = [(AVVolumeSlider *)self thumbView];
  [v37 bounds];
  CGRectGetHeight(v49);
  UIFloorToViewScale();
  double v39 = v38;
  v40 = [(AVVolumeSlider *)self thumbView];
  v41 = [v40 layer];
  [v41 setCornerRadius:v39];

  v42 = [(AVVolumeSlider *)self thumbView];
  +[AVBackdropView configureSlider:self thumbView:v42 loadedTrackView:0];

  [(UIView *)self avkit_makeSubtreeDisallowGroupBlending];
LABEL_9:
  if ([(AVVolumeSlider *)self isEnabled]) {
    double v43 = 1.0;
  }
  else {
    double v43 = 0.5;
  }
  if ([(AVVolumeSlider *)self isCollapsedOrExcluded]) {
    double v44 = 0.0;
  }
  else {
    double v44 = v43;
  }
  [(AVVolumeSlider *)self setAlpha:v44];
  v45 = [(AVVolumeSlider *)self thumbView];
  if ([(AVVolumeSlider *)self isEnabled]) {
    double v46 = 1.0;
  }
  else {
    double v46 = 0.0;
  }
  [v45 setAlpha:v46];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)AVVolumeSlider;
  [(AVVolumeSlider *)&v3 didMoveToWindow];
  [(AVVolumeSlider *)self setNeedsLayout];
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)intrinsicContentSize
{
  BOOL v3 = [(AVVolumeSlider *)self isIncluded];
  [(AVVolumeSlider *)self extrinsicContentSize];
  if (!v3) {
    double v4 = 0.0;
  }
  result.CGFloat height = v5;
  result.CGFloat width = v4;
  return result;
}

- (id)accessibilityLabel
{
  return AVLocalizedString(@"Volume");
}

- (BOOL)avkit_shouldPreventExternalGestureRecognizerAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(AVVolumeSlider *)self isTracking]) {
    return 1;
  }

  return -[AVVolumeSlider _shouldTrackTouchAtPoint:](self, "_shouldTrackTouchAtPoint:", x, y);
}

- (void)setExtrinsicContentSize:(CGSize)a3
{
  if (a3.width != self->_extrinsicContentSize.width || a3.height != self->_extrinsicContentSize.height)
  {
    self->_extrinsicContentSize = a3;
    [(AVVolumeSlider *)self invalidateIntrinsicContentSize];
    [(AVVolumeSlider *)self _updateLayoutItem];
  }
}

- (void)setRemoved:(BOOL)a3
{
  if (self->_removed != a3)
  {
    self->_removed = a3;
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
    [(AVVolumeSlider *)self _updateLayoutItem];
  }
}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    [(AVVolumeSlider *)self _updateLayoutItem];
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
  }
}

- (void)setIncluded:(BOOL)a3
{
  if (self->_included != a3)
  {
    self->_included = a3;
    [(AVVolumeSlider *)self _updateLayoutItem];
    [(UIView *)self avkit_reevaluateHiddenStateOfItem:self];
    [(AVVolumeSlider *)self invalidateIntrinsicContentSize];
  }
}

- (BOOL)isCollapsedOrExcluded
{
  if ([(AVVolumeSlider *)self isCollapsed] || ![(AVVolumeSlider *)self isIncluded]) {
    return 1;
  }

  return [(AVVolumeSlider *)self isRemoved];
}

- (void)_commonInit
{
  self->_included = 1;
  self->_scrubsWhenTappedAnywhere = 0;
  BOOL v3 = objc_alloc_init(AVLayoutItemAttributes);
  layoutAttributes = self->_layoutAttributes;
  self->_layoutAttributes = v3;

  double v5 = self->_layoutAttributes;
  [(AVVolumeSlider *)self intrinsicContentSize];
  -[AVLayoutItemAttributes setMinimumSize:](v5, "setMinimumSize:");
  [(AVLayoutItemAttributes *)self->_layoutAttributes setCollapsed:[(AVVolumeSlider *)self isCollapsed]];
  [(AVLayoutItemAttributes *)self->_layoutAttributes setIncluded:[(AVVolumeSlider *)self isIncluded]];
  [(AVLayoutItemAttributes *)self->_layoutAttributes setHasFlexibleContentSize:0];
  double v6 = self->_layoutAttributes;
  double v7 = [(AVVolumeSlider *)self accessibilityIdentifier];
  [(AVLayoutItemAttributes *)v6 setAccessibilityIdentifier:v7];

  objc_msgSend(MEMORY[0x1E4FB1818], "avkit_flatWhiteResizableTemplateImage");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [(AVVolumeSlider *)self minimumTrackImageForState:0];

  if (v8 != v9)
  {
    [(AVVolumeSlider *)self setMinimumTrackImage:v9 forState:0];
    [(AVVolumeSlider *)self setMaximumTrackImage:v9 forState:0];
    [(AVVolumeSlider *)self setThumbImage:v9 forState:0];
    [(AVVolumeSlider *)self setSemanticContentAttribute:0];
  }
}

- (AVVolumeSlider)initWithFrame:(CGRect)a3 thumbSize:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVVolumeSlider;
  double v5 = -[AVVolumeSlider initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = v5;
  if (v5)
  {
    v5->_thumbSize = a4;
    [(AVVolumeSlider *)v5 _commonInit];
  }
  return v6;
}

- (AVVolumeSlider)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVVolumeSlider;
  BOOL v3 = -[AVVolumeSlider initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    v3->_thumbSize = 9.0;
    [(AVVolumeSlider *)v3 _commonInit];
  }
  return v4;
}

@end