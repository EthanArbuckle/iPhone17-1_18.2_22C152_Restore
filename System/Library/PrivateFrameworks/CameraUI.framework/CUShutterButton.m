@interface CUShutterButton
+ (CUShutterButton)shutterButtonWithLayoutStyle:(int64_t)a3;
+ (CUShutterButton)shutterButtonWithSpec:(CAMShutterButtonSpec *)a3;
+ (id)shutterButton;
+ (id)smallShutterButton;
+ (id)smallShutterButtonWithLayoutStyle:(int64_t)a3;
- ($EA90F2AF3C0DC35AB2D8304CE3BCA89E)_timelapseRingSpecForLayoutStyle:(SEL)a3;
- (BOOL)_isSpinningSupportedForLayoutStyle:(int64_t)a3;
- (BOOL)_shouldShowBackgroundViewForMode:(int64_t)a3;
- (BOOL)_shouldShowContrastBorderForMode:(int64_t)a3 layoutStyle:(int64_t)a4;
- (BOOL)isSpinning;
- (BOOL)showDisabled;
- (CAMShutterButtonDelegate)delegate;
- (CAMShutterButtonRingView)_outerView;
- (CAMShutterButtonSpec)spec;
- (CAMTimelapseShutterRingView)_timelapseOuterView;
- (CGSize)_sizeForMode:(int64_t)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CUShutterButton)initWithCoder:(id)a3;
- (CUShutterButton)initWithFrame:(CGRect)a3;
- (CUShutterButton)initWithFrame:(CGRect)a3 layoutStyle:(int64_t)a4 spec:(CAMShutterButtonSpec *)a5;
- (UIColor)contentColor;
- (UIColor)stopModeBackgroundColor;
- (UIEdgeInsets)tappableEdgeInsets;
- (UIImageView)_outerImageView;
- (UIView)_innerView;
- (UIView)_innerViewContrastView;
- (UIView)_spinnerView;
- (UIView)_stopModeBackground;
- (double)_cornerRadiusForMode:(int64_t)a3;
- (id)_contentColor;
- (id)_innerCircleColorForMode:(int64_t)a3 spinning:(BOOL)a4;
- (id)_outerImageForMode:(int64_t)a3 layoutStyle:(int64_t)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)layoutStyle;
- (int64_t)mode;
- (void)_commonCAMShutterButtonInitializationWithLayoutStyle:(int64_t)a3 spec:(CAMShutterButtonSpec *)a4;
- (void)_performHighlightAnimation;
- (void)_performModeSwitchAnimationFromMode:(int64_t)a3 toMode:(int64_t)a4 animated:(BOOL)a5;
- (void)_updateOuterAndInnerLayers;
- (void)_updateSpinningAnimations;
- (void)layoutSubviews;
- (void)setContentColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setMode:(int64_t)a3;
- (void)setMode:(int64_t)a3 animated:(BOOL)a4;
- (void)setShowDisabled:(BOOL)a3;
- (void)setSpec:(CAMShutterButtonSpec *)a3;
- (void)setSpinning:(BOOL)a3;
- (void)setStopModeBackgroundColor:(id)a3;
- (void)setTappableEdgeInsets:(UIEdgeInsets)a3;
- (void)set_spinnerView:(id)a3;
- (void)set_stopModeBackground:(id)a3;
@end

@implementation CUShutterButton

+ (CUShutterButton)shutterButtonWithLayoutStyle:(int64_t)a3
{
  uint64_t v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  CAMShutterButtonSpecForLayoutStyle(a3, (uint64_t)&v14);
  id v5 = objc_alloc((Class)a1);
  double v6 = *MEMORY[0x263F001A8];
  double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
  v12[0] = v14;
  v12[1] = v15;
  uint64_t v13 = v16;
  v10 = objc_msgSend(v5, "initWithFrame:layoutStyle:spec:", a3, v12, v6, v7, v8, v9);
  return (CUShutterButton *)v10;
}

- (CUShutterButton)initWithFrame:(CGRect)a3 layoutStyle:(int64_t)a4 spec:(CAMShutterButtonSpec *)a5
{
  v13.receiver = self;
  v13.super_class = (Class)CUShutterButton;
  double v7 = -[CUShutterButton initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v8 = v7;
  if (v7)
  {
    long long v9 = *(_OWORD *)&a5->stopSquareSideLength;
    v11[0] = *(_OWORD *)&a5->outerRingDiameter;
    v11[1] = v9;
    double interRingSpacing = a5->interRingSpacing;
    [(CUShutterButton *)v7 _commonCAMShutterButtonInitializationWithLayoutStyle:a4 spec:v11];
  }
  return v8;
}

- (void)_commonCAMShutterButtonInitializationWithLayoutStyle:(int64_t)a3 spec:(CAMShutterButtonSpec *)a4
{
  self->_mode = 0;
  p_spec = &self->_spec;
  long long v6 = *(_OWORD *)&a4->outerRingDiameter;
  long long v7 = *(_OWORD *)&a4->stopSquareSideLength;
  self->_spec.double interRingSpacing = a4->interRingSpacing;
  *(_OWORD *)&self->_spec.outerRingDiameter = v6;
  *(_OWORD *)&self->_spec.stopSquareSideLength = v7;
  self->_layoutStyle = a3;
  double v8 = [MEMORY[0x263F825C8] whiteColor];
  contentColor = self->_contentColor;
  self->_contentColor = v8;

  v10 = [CAMShutterButtonRingView alloc];
  long long v11 = *(_OWORD *)&p_spec->stopSquareSideLength;
  v17[0] = *(_OWORD *)&p_spec->outerRingDiameter;
  v17[1] = v11;
  double interRingSpacing = p_spec->interRingSpacing;
  v12 = [(CAMShutterButtonRingView *)v10 initWithSpec:v17];
  outerView = self->__outerView;
  self->__outerView = v12;

  id v14 = objc_alloc(MEMORY[0x263F82E00]);
  long long v15 = (UIView *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  innerView = self->__innerView;
  self->__innerView = v15;

  [(CAMShutterButtonRingView *)self->__outerView setUserInteractionEnabled:0];
  [(UIView *)self->__innerView setUserInteractionEnabled:0];
  [(CUShutterButton *)self addSubview:self->__outerView];
  [(CUShutterButton *)self addSubview:self->__innerView];
  [(CUShutterButton *)self setAdjustsImageWhenHighlighted:0];
  [(CUShutterButton *)self setAdjustsImageWhenDisabled:0];
  [(CUShutterButton *)self setShowsTouchWhenHighlighted:0];
  [(CUShutterButton *)self _updateOuterAndInnerLayers];
}

- (void)_updateOuterAndInnerLayers
{
  int64_t v3 = [(CUShutterButton *)self mode];
  BOOL v4 = +[CAMShutterUtilities shouldUseImageViewForMode:v3];
  id v5 = [(CUShutterButton *)self _innerView];
  if (v4)
  {
    if (!self->__outerImageView)
    {
      id v6 = objc_alloc(MEMORY[0x263F82828]);
      [(CAMShutterButtonRingView *)self->__outerView frame];
      long long v7 = (UIImageView *)objc_msgSend(v6, "initWithFrame:");
      outerImageView = self->__outerImageView;
      self->__outerImageView = v7;

      [(CUShutterButton *)self insertSubview:self->__outerImageView belowSubview:self->__outerView];
    }
    long long v9 = [(CUShutterButton *)self _outerImageForMode:v3 layoutStyle:self->_layoutStyle];
    [(UIImageView *)self->__outerImageView setImage:v9];
  }
  if (+[CAMShutterUtilities shouldUseTimelapseOuterViewForMode:v3]&& !self->__timelapseOuterView)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    [(CUShutterButton *)self _timelapseRingSpecForLayoutStyle:self->_layoutStyle];
    v10 = [CAMTimelapseShutterRingView alloc];
    [(CAMShutterButtonRingView *)self->__outerView frame];
    v25[0] = v26;
    v25[1] = v27;
    long long v11 = -[CAMTimelapseShutterRingView initWithFrame:spec:](v10, "initWithFrame:spec:", v25);
    timelapseOuterView = self->__timelapseOuterView;
    self->__timelapseOuterView = v11;

    [(CUShutterButton *)self insertSubview:self->__timelapseOuterView belowSubview:self->__outerView];
  }
  if ([(CUShutterButton *)self _shouldShowBackgroundViewForMode:v3])
  {
    id v13 = [(CUShutterButton *)self _stopModeBackground];
    if (!v13)
    {
      id v13 = objc_alloc_init(MEMORY[0x263F82E00]);
      [v13 setUserInteractionEnabled:0];
      [(CUShutterButton *)self set_stopModeBackground:v13];
      [(CUShutterButton *)self insertSubview:v13 belowSubview:v5];
    }
    id v14 = [(CUShutterButton *)self stopModeBackgroundColor];
    [v13 setBackgroundColor:v14];
  }
  BOOL v15 = [(CUShutterButton *)self _shouldShowContrastBorderForMode:v3 layoutStyle:self->_layoutStyle];
  uint64_t v16 = [(CUShutterButton *)self _outerView];
  [v16 setShowContrastBorder:v15];
  v17 = [(CUShutterButton *)self _contentColor];
  [v16 setColor:v17];

  BOOL v18 = [(CUShutterButton *)self isSpinning];
  v19 = [v5 layer];
  id v20 = [(CUShutterButton *)self _innerCircleColorForMode:v3 spinning:v18];
  objc_msgSend(v19, "setBackgroundColor:", objc_msgSend(v20, "CGColor"));

  innerViewContrastView = self->__innerViewContrastView;
  if (v15)
  {
    if (!innerViewContrastView)
    {
      v22 = objc_alloc_init(CAMShutterButtonContrastBackground);
      v23 = self->__innerViewContrastView;
      self->__innerViewContrastView = &v22->super;

      [(UIView *)self->__innerViewContrastView setUserInteractionEnabled:0];
      [(CUShutterButton *)self insertSubview:self->__innerViewContrastView belowSubview:self->__innerView];
      innerViewContrastView = self->__innerViewContrastView;
    }
    double v24 = 1.0;
  }
  else
  {
    double v24 = 0.0;
  }
  [(UIView *)innerViewContrastView setAlpha:v24];
}

- (int64_t)mode
{
  return self->_mode;
}

- (UIView)_innerView
{
  return self->__innerView;
}

- (BOOL)_shouldShowBackgroundViewForMode:(int64_t)a3
{
  BOOL v4 = [(CUShutterButton *)self stopModeBackgroundColor];
  if (v4) {
    BOOL v5 = +[CAMShutterUtilities isStopMode:a3];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (UIColor)stopModeBackgroundColor
{
  return self->_stopModeBackgroundColor;
}

- (BOOL)_shouldShowContrastBorderForMode:(int64_t)a3 layoutStyle:(int64_t)a4
{
  if (a4 == 1) {
    return ((unint64_t)a3 < 0xA) & (0x231u >> a3);
  }
  else {
    return 0;
  }
}

- (CAMShutterButtonRingView)_outerView
{
  return self->__outerView;
}

- (id)_contentColor
{
  v2 = [(CUShutterButton *)self contentColor];
  int64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263F825C8] whiteColor];
  }
  BOOL v5 = v4;

  return v5;
}

- (UIColor)contentColor
{
  return self->_contentColor;
}

- (BOOL)isSpinning
{
  return self->_spinning;
}

- (id)_innerCircleColorForMode:(int64_t)a3 spinning:(BOOL)a4
{
  if (a4) {
    double v6 = 0.2;
  }
  else {
    double v6 = 1.0;
  }
  long long v7 = [MEMORY[0x263F086E0] mainBundle];
  double v8 = [v7 bundleIdentifier];

  int v9 = [v8 isEqualToString:@"com.apple.camera.lockscreen"];
  v10 = +[CAMCaptureCapabilities capabilities];
  int v11 = [v10 featureDevelopmentShowLockIndicator];

  if ((unint64_t)a3 > 9)
  {
    v12 = 0;
  }
  else if (((1 << a3) & 0x1CE) != 0)
  {
    v12 = [MEMORY[0x263F825C8] colorWithRed:0.961 green:0.2 blue:0.2 alpha:v6];
  }
  else
  {
    if ((v11 & v9) == 1) {
      [MEMORY[0x263F825C8] blueColor];
    }
    else {
    id v13 = [(CUShutterButton *)self _contentColor];
    }
    v12 = [v13 colorWithAlphaComponent:v6];
  }
  return v12;
}

- (void)setMode:(int64_t)a3
{
}

- (void)setMode:(int64_t)a3 animated:(BOOL)a4
{
  int64_t mode = self->_mode;
  if (mode != a3)
  {
    BOOL v5 = a4;
    self->_int64_t mode = a3;
    [(CUShutterButton *)self _updateOuterAndInnerLayers];
    int64_t v7 = self->_mode;
    [(CUShutterButton *)self _performModeSwitchAnimationFromMode:mode toMode:v7 animated:v5];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setShowDisabled:(BOOL)a3
{
  if (self->_showDisabled != a3)
  {
    self->_showDisabled = a3;
    int64_t v4 = [(CUShutterButton *)self mode];
    int64_t v5 = [(CUShutterButton *)self mode];
    [(CUShutterButton *)self _performModeSwitchAnimationFromMode:v4 toMode:v5 animated:0];
  }
}

- (void)setTappableEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_tappableEdgeInsets.left
    || a3.top != self->_tappableEdgeInsets.top
    || a3.right != self->_tappableEdgeInsets.right
    || a3.bottom != self->_tappableEdgeInsets.bottom)
  {
    self->_tappableEdgeInsets = a3;
    [(CUShutterButton *)self setNeedsLayout];
  }
}

- (UIEdgeInsets)tappableEdgeInsets
{
  double top = self->_tappableEdgeInsets.top;
  double left = self->_tappableEdgeInsets.left;
  double bottom = self->_tappableEdgeInsets.bottom;
  double right = self->_tappableEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)layoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)CUShutterButton;
  [(CUShutterButton *)&v35 layoutSubviews];
  [(CUShutterButton *)self bounds];
  -[CUShutterButton alignmentRectForFrame:](self, "alignmentRectForFrame:");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIImageView setFrame:](self->__outerImageView, "setFrame:");
  -[CAMTimelapseShutterRingView setFrame:](self->__timelapseOuterView, "setFrame:", v4, v6, v8, v10);
  int64_t v11 = [(CUShutterButton *)self mode];
  v12 = [(CUShutterButton *)self _outerView];
  objc_msgSend(v12, "frameForAlignmentRect:", v4, v6, v8, v10);
  objc_msgSend(v12, "setFrame:");
  id v13 = [(CUShutterButton *)self _innerView];
  double v14 = *MEMORY[0x263F001A8];
  double v15 = *(double *)(MEMORY[0x263F001A8] + 8);
  [(CUShutterButton *)self _sizeForMode:v11];
  double v17 = v16;
  double v19 = v18;
  UIRectGetCenter();
  double v21 = v20;
  double v23 = v22;
  objc_msgSend(v13, "setBounds:", v14, v15, v17, v19);
  objc_msgSend(v13, "setCenter:", v21, v23);
  double v24 = [(CUShutterButton *)self _innerViewContrastView];
  double v25 = CAMPixelWidthForView(self);
  UIRectCenteredAboutPointScale();
  CGRect v37 = CGRectInset(v36, -v25, -v25);
  objc_msgSend(v24, "frameForAlignmentRect:", v37.origin.x, v37.origin.y, v37.size.width, v37.size.height);
  objc_msgSend(v24, "setBounds:", 0.0, 0.0);
  objc_msgSend(v24, "setCenter:", v21, v23);
  [(CUShutterButton *)self _cornerRadiusForMode:v11];
  double v27 = v26;
  v28 = [v13 layer];
  [v28 setCornerRadius:v27];
  if ([(CUShutterButton *)self _shouldShowBackgroundViewForMode:v11])
  {
    v29 = [(CUShutterButton *)self _stopModeBackground];
    [(CUShutterButton *)self _sizeForMode:0];
    objc_msgSend(v29, "setBounds:", v14, v15, v30, v31);
    objc_msgSend(v29, "setCenter:", v21, v23);
    [(CUShutterButton *)self _cornerRadiusForMode:0];
    double v33 = v32;
    v34 = [v29 layer];
    [v34 setCornerRadius:v33];
  }
}

- (CGSize)_sizeForMode:(int64_t)a3
{
  BOOL v4 = +[CAMShutterUtilities isStopMode:a3];
  [(CUShutterButton *)self spec];
  if (v4) {
    double v5 = 0.0;
  }
  else {
    double v5 = (0.0 + 0.0) * -2.0 + 0.0;
  }
  double v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- (CAMShutterButtonSpec)spec
{
  long long v3 = *(_OWORD *)&self[22].stopSquareSideLength;
  *(_OWORD *)&retstr->outerRingDiameter = *(_OWORD *)&self[22].outerRingDiameter;
  *(_OWORD *)&retstr->stopSquareSideLength = v3;
  retstr->double interRingSpacing = self[22].interRingSpacing;
  return self;
}

- (double)_cornerRadiusForMode:(int64_t)a3
{
  BOOL v4 = +[CAMShutterUtilities isStopMode:a3];
  [(CUShutterButton *)self spec];
  if (v4) {
    return 0.0;
  }
  else {
    return ceil(((0.0 + 0.0) * -2.0 + 0.0) * 0.5);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (([(CUShutterButton *)self isEnabled] & 1) == 0)
  {
    if (-[CUShutterButton pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        id v10 = objc_loadWeakRetained((id *)&self->_delegate);
        [v10 shutterButtonTouchAttemptedWhileDisabled:self];
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)CUShutterButton;
  int64_t v11 = -[CUShutterButton hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);

  return v11;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CUShutterButton *)self isHighlighted];
  v6.receiver = self;
  v6.super_class = (Class)CUShutterButton;
  [(CUShutterButton *)&v6 setHighlighted:v3];
  if (v5 != v3) {
    [(CUShutterButton *)self _performHighlightAnimation];
  }
}

- (void)_performHighlightAnimation
{
  int v3 = [(CUShutterButton *)self isHighlighted];
  BOOL v4 = [(CUShutterButton *)self _innerView];
  int v5 = [v4 layer];

  objc_super v6 = [(CUShutterButton *)self _innerViewContrastView];
  id v7 = [v6 layer];

  double v8 = [MEMORY[0x263F15890] animationWithKeyPath:@"transform.scale.xy"];
  [v8 setMass:0.8];
  [v8 setVelocity:0.0];
  if (v3) {
    double v9 = 0.9;
  }
  else {
    double v9 = 1.0;
  }
  if (v3) {
    double v10 = 12.0;
  }
  else {
    double v10 = 100.0;
  }
  UIAnimationDragCoefficient();
  float v12 = v11;
  [v8 setDamping:v10 / v11];
  [v8 setStiffness:300.0 / (float)(v12 * v12)];
  [v8 durationForEpsilon:0.01];
  objc_msgSend(v8, "setDuration:");
  LODWORD(v13) = 1045220557;
  LODWORD(v14) = 0.5;
  LODWORD(v15) = 1.0;
  LODWORD(v16) = 1045220557;
  double v17 = [MEMORY[0x263F15808] functionWithControlPoints:v13 :v16 :v14 :v15];
  [v8 setTimingFunction:v17];

  double v18 = [v5 presentationLayer];
  double v19 = [v18 valueForKeyPath:@"transform.scale.xy"];
  [v8 setFromValue:v19];

  double v20 = [NSNumber numberWithDouble:v9];
  [v8 setToValue:v20];

  [v5 addAnimation:v8 forKey:@"highlightScaleAnimation"];
  [v7 addAnimation:v8 forKey:@"highlightScaleAnimation"];
  memset(&v23, 0, sizeof(v23));
  CATransform3DMakeScale(&v23, v9, v9, 1.0);
  CATransform3D v22 = v23;
  [v5 setTransform:&v22];
  CATransform3D v21 = v23;
  [v7 setTransform:&v21];
}

- (void)setSpinning:(BOOL)a3
{
  if (self->_spinning != a3)
  {
    self->_spinning = a3;
    [(CUShutterButton *)self _updateSpinningAnimations];
  }
}

+ (id)smallShutterButton
{
  int v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = objc_msgSend(v3, "cam_initialLayoutStyle");

  return (id)[a1 smallShutterButtonWithLayoutStyle:v4];
}

+ (id)shutterButton
{
  int v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = objc_msgSend(v3, "cam_initialLayoutStyle");

  return (id)[a1 shutterButtonWithLayoutStyle:v4];
}

+ (CUShutterButton)shutterButtonWithSpec:(CAMShutterButtonSpec *)a3
{
  int v5 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v6 = objc_msgSend(v5, "cam_initialLayoutStyle");

  id v7 = objc_alloc((Class)a1);
  double v8 = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
  long long v12 = *(_OWORD *)&a3->stopSquareSideLength;
  v15[0] = *(_OWORD *)&a3->outerRingDiameter;
  v15[1] = v12;
  double interRingSpacing = a3->interRingSpacing;
  double v13 = objc_msgSend(v7, "initWithFrame:layoutStyle:spec:", v6, v15, v8, v9, v10, v11);
  return (CUShutterButton *)v13;
}

+ (id)smallShutterButtonWithLayoutStyle:(int64_t)a3
{
  if (a3 == 4)
  {
    int v5 = [MEMORY[0x263F82B60] mainScreen];
    [v5 scale];
    double v7 = 1.0 / v6;

    double v8 = v7 + 55.0;
    double v9 = 5.0 - v7;
  }
  else
  {
    double v9 = 5.0;
    double v8 = 47.0;
  }
  id v10 = objc_alloc((Class)a1);
  double v11 = *MEMORY[0x263F001A8];
  double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v13 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
  *(double *)double v17 = v8;
  *(double *)&v17[1] = v9;
  long long v18 = xmmword_209C7AB70;
  uint64_t v19 = 0x4000000000000000;
  double v15 = objc_msgSend(v10, "initWithFrame:layoutStyle:spec:", a3, v17, v11, v12, v13, v14);
  return v15;
}

- (CUShutterButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v9 = objc_msgSend(v8, "cam_initialLayoutStyle");

  uint64_t v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  CAMShutterButtonSpecForLayoutStyle(v9, (uint64_t)&v13);
  v11[0] = v13;
  v11[1] = v14;
  uint64_t v12 = v15;
  return -[CUShutterButton initWithFrame:layoutStyle:spec:](self, "initWithFrame:layoutStyle:spec:", v9, v11, x, y, width, height);
}

- (CUShutterButton)initWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CUShutterButton;
  int v3 = [(CUShutterButton *)&v13 initWithCoder:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

    uint64_t v12 = 0;
    long long v10 = 0u;
    long long v11 = 0u;
    CAMShutterButtonSpecForLayoutStyle(v5, (uint64_t)&v10);
    v8[0] = v10;
    v8[1] = v11;
    uint64_t v9 = v12;
    [(CUShutterButton *)v3 _commonCAMShutterButtonInitializationWithLayoutStyle:v5 spec:v8];
    double v6 = v3;
  }

  return v3;
}

- (CGSize)intrinsicContentSize
{
  double outerRingDiameter = self->_spec.outerRingDiameter;
  double v3 = outerRingDiameter;
  result.double height = v3;
  result.double width = outerRingDiameter;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double outerRingDiameter = self->_spec.outerRingDiameter;
  double v4 = outerRingDiameter;
  result.double height = v4;
  result.double width = outerRingDiameter;
  return result;
}

- (void)setContentColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_contentColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contentColor, a3);
    [(CUShutterButton *)self _updateOuterAndInnerLayers];
  }
}

- (void)setStopModeBackgroundColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_stopModeBackgroundColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_stopModeBackgroundColor, a3);
    [(CUShutterButton *)self _updateOuterAndInnerLayers];
  }
}

- (void)setSpec:(CAMShutterButtonSpec *)a3
{
  double interRingSpacing = a3->interRingSpacing;
  long long v5 = *(_OWORD *)&a3->stopSquareSideLength;
  *(_OWORD *)&self->_spec.double outerRingDiameter = *(_OWORD *)&a3->outerRingDiameter;
  *(_OWORD *)&self->_spec.stopSquareSideLength = v5;
  self->_spec.double interRingSpacing = interRingSpacing;
  outerView = self->__outerView;
  long long v7 = *(_OWORD *)&a3->stopSquareSideLength;
  v8[0] = *(_OWORD *)&a3->outerRingDiameter;
  v8[1] = v7;
  double v9 = a3->interRingSpacing;
  [(CAMShutterButtonRingView *)outerView setSpec:v8];
  [(CUShutterButton *)self _updateOuterAndInnerLayers];
}

- (id)_outerImageForMode:(int64_t)a3 layoutStyle:(int64_t)a4
{
  if (a3 == 2 || a3 == 7) {
    long long v5 = @"CAMShutterButtonSlomo";
  }
  else {
    long long v5 = 0;
  }
  if (a4 == 4)
  {
    long long v5 = [(__CFString *)v5 stringByAppendingString:@"Phone"];
  }
  if (v5)
  {
    double v6 = (void *)MEMORY[0x263F827E8];
    long long v7 = CAMCameraUIFrameworkBundle();
    double v8 = [v6 imageNamed:v5 inBundle:v7];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- ($EA90F2AF3C0DC35AB2D8304CE3BCA89E)_timelapseRingSpecForLayoutStyle:(SEL)a3
{
  retstr->var2 = 0.0;
  retstr->var3 = 0.0;
  *(_OWORD *)&retstr->var0 = xmmword_209C7AB80;
  retstr->var2 = CAMPixelWidthForView(self) + 3.0;
  retstr->var3 = CAMPixelWidthForView(self) + 5.0;
  if (a4 == 4)
  {
    retstr->var2 = 4.0 - CAMPixelWidthForView(self);
    retstr->var3 = 6.0;
  }
  return result;
}

- (void)_performModeSwitchAnimationFromMode:(int64_t)a3 toMode:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double v9 = [(CUShutterButton *)self _innerView];
  id v151 = [v9 layer];

  long long v10 = [(CUShutterButton *)self _outerView];
  uint64_t v11 = [v10 layer];

  uint64_t v12 = [(CUShutterButton *)self _outerImageView];
  objc_super v13 = [v12 layer];

  long long v14 = [(CUShutterButton *)self _stopModeBackground];
  uint64_t v15 = [v14 layer];

  double v16 = [(CUShutterButton *)self _timelapseOuterView];
  v150 = [v16 layer];

  BOOL v17 = [(CUShutterButton *)self isSpinning];
  id v18 = [(CUShutterButton *)self _innerCircleColorForMode:a4 spinning:v17];
  uint64_t v19 = [v18 CGColor];

  BOOL v147 = v17;
  int v20 = v5 && ~v17;
  HIDWORD(v149) = +[CAMShutterUtilities shouldUseImageViewForMode:a4];
  LODWORD(v149) = +[CAMShutterUtilities shouldUseTimelapseOuterViewForMode:a4];
  BOOL v142 = [(CUShutterButton *)self _shouldShowBackgroundViewForMode:a4];
  if ([(CUShutterButton *)self showDisabled]) {
    float v21 = 0.4;
  }
  else {
    float v21 = 1.0;
  }
  int v137 = v20;
  v148 = v19;
  if (v20 == 1)
  {
    CATransform3D v22 = [v151 presentationLayer];
    v144 = (void *)v11;
    int64_t v133 = a4;
    int64_t v135 = a3;
    v131 = v15;
    if (v22)
    {
      CATransform3D v23 = [v151 presentationLayer];
      uint64_t v24 = [v23 valueForKeyPath:@"backgroundColor"];
    }
    else
    {
      uint64_t v24 = [v151 valueForKeyPath:@"backgroundColor"];
    }
    v140 = (void *)v24;

    double v25 = [MEMORY[0x263F15760] animationWithKeyPath:@"backgroundColor"];
    [v25 setFromValue:v24];
    [v25 setToValue:v19];
    UIAnimationDragCoefficient();
    [v25 setDuration:v26 * 0.25];
    uint64_t v27 = *MEMORY[0x263F15EB8];
    v28 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
    [v25 setTimingFunction:v28];

    uint64_t v29 = *MEMORY[0x263F15AA8];
    [v25 setFillMode:*MEMORY[0x263F15AA8]];
    [v151 addAnimation:v25 forKey:@"backgroundColorAnimation"];
    double v30 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    double v31 = NSNumber;
    [(UIView *)self->__innerView alpha];
    double v32 = objc_msgSend(v31, "numberWithDouble:");
    [v30 setFromValue:v32];

    UIAnimationDragCoefficient();
    [v30 setDuration:v33 * 0.25];
    v34 = [MEMORY[0x263F15808] functionWithName:v27];
    [v30 setTimingFunction:v34];

    [v30 setFillMode:v29];
    [v151 addAnimation:v30 forKey:@"opacity"];
    objc_super v35 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    CGRect v36 = NSNumber;
    [(CAMShutterButtonRingView *)self->__outerView alpha];
    CGRect v37 = objc_msgSend(v36, "numberWithDouble:");
    [v35 setFromValue:v37];

    UIAnimationDragCoefficient();
    [v35 setDuration:v38 * 0.25];
    v39 = [MEMORY[0x263F15808] functionWithName:v27];
    [v35 setTimingFunction:v39];

    [v35 setFillMode:v29];
    [v144 addAnimation:v35 forKey:@"opacity"];
    v40 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    v41 = NSNumber;
    [(UIImageView *)self->__outerImageView alpha];
    v42 = objc_msgSend(v41, "numberWithDouble:");
    [v40 setFromValue:v42];

    UIAnimationDragCoefficient();
    [v40 setDuration:v43 * 0.25];
    v44 = [MEMORY[0x263F15808] functionWithName:v27];
    [v40 setTimingFunction:v44];

    [v40 setFillMode:v29];
    [v13 addAnimation:v40 forKey:@"opacity"];
    v45 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    v46 = NSNumber;
    [(CAMTimelapseShutterRingView *)self->__timelapseOuterView alpha];
    v47 = objc_msgSend(v46, "numberWithDouble:");
    [v45 setFromValue:v47];

    UIAnimationDragCoefficient();
    [v45 setDuration:v48 * 0.25];
    v49 = [MEMORY[0x263F15808] functionWithName:v27];
    [v45 setTimingFunction:v49];

    [v45 setFillMode:v29];
    [v150 addAnimation:v45 forKey:@"opacity"];

    uint64_t v19 = v148;
    uint64_t v11 = (uint64_t)v144;

    a4 = v133;
    a3 = v135;
    uint64_t v15 = v131;
  }
  BOOL v50 = +[CAMShutterUtilities isStopMode:a4];
  BOOL v51 = +[CAMShutterUtilities isStopMode:a3];
  if (v50)
  {
    [(CUShutterButton *)self _sizeForMode:a4];
    v141 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:");
    v52 = NSNumber;
    [(CUShutterButton *)self _cornerRadiusForMode:a4];
    v53 = objc_msgSend(v52, "numberWithDouble:");
    double v54 = 0.0;
    if (v142) {
      double v54 = 1.0;
    }
    v55 = [NSNumber numberWithDouble:v54];
    v56 = (void *)v11;
    if (v137)
    {
      UIAnimationDragCoefficient();
      float v58 = v57;
      v59 = [v151 presentationLayer];
      int64_t v134 = a4;
      int64_t v136 = a3;
      v132 = v13;
      v130 = v55;
      if (v59)
      {
        v60 = [v151 presentationLayer];
        uint64_t v61 = [v60 valueForKeyPath:@"bounds.size"];
      }
      else
      {
        uint64_t v61 = [v151 valueForKeyPath:@"bounds.size"];
      }

      v76 = [MEMORY[0x263F15890] animationWithKeyPath:@"bounds.size"];
      [v76 setFromValue:v61];
      [v76 setToValue:v141];
      [v76 setMass:0.8];
      double v77 = v58;
      [v76 setDamping:22.0 / v58];
      [v76 setStiffness:300.0 / (float)(v58 * v58)];
      [v76 durationForEpsilon:0.01];
      objc_msgSend(v76, "setDuration:");
      LODWORD(v78) = 1060320051;
      LODWORD(v79) = 0.25;
      LODWORD(v80) = 1.0;
      LODWORD(v81) = 1053609165;
      v82 = [MEMORY[0x263F15808] functionWithControlPoints:v79 :v81 :v78 :v80];
      [v76 setTimingFunction:v82];

      uint64_t v83 = *MEMORY[0x263F15AA8];
      [v76 setFillMode:*MEMORY[0x263F15AA8]];
      v84 = [v151 presentationLayer];
      v138 = (void *)v61;
      v72 = v15;
      if (v84)
      {
        v85 = [v151 presentationLayer];
        v86 = [v85 valueForKeyPath:@"cornerRadius"];
      }
      else
      {
        v86 = [v151 valueForKeyPath:@"cornerRadius"];
      }

      v87 = [MEMORY[0x263F15760] animationWithKeyPath:@"cornerRadius"];
      [v87 setFromValue:v86];
      [v87 setToValue:v53];
      [v87 setDuration:v77 * 0.12];
      LODWORD(v88) = 1041865114;
      LODWORD(v89) = 1043207291;
      LODWORD(v90) = 1061997773;
      LODWORD(v91) = 1.0;
      v92 = [MEMORY[0x263F15808] functionWithControlPoints:v88 :v89 :v90 :v91];
      [v87 setTimingFunction:v92];

      [v87 setFillMode:v83];
      [v151 addAnimation:v76 forKey:@"sizeAnimation"];
      [v151 addAnimation:v87 forKey:@"cornerRadiusAnimation"];
      if (v142)
      {
        uint64_t v93 = [v15 presentationLayer];
        v94 = (void *)v93;
        if (v93) {
          v95 = (void *)v93;
        }
        else {
          v95 = v15;
        }
        id v96 = v95;

        [v96 valueForKeyPath:@"opacity"];
        v97 = v145 = v56;
        v98 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
        [v98 setFromValue:v97];
        [v98 setToValue:v130];
        [v98 setDuration:v77 * 0.25];
        v99 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
        [v98 setTimingFunction:v99];

        v72 = v15;
        [v15 addAnimation:v98 forKey:@"opacityAnimation"];

        v56 = v145;
      }

      v75 = v151;
LABEL_42:
      a4 = v134;
      a3 = v136;
      objc_super v13 = v132;
      uint64_t v15 = v72;
      v55 = v130;
      goto LABEL_43;
    }
  }
  else
  {
    v56 = (void *)v11;
    if (!v51) {
      goto LABEL_44;
    }
    [(CUShutterButton *)self _sizeForMode:a4];
    double v63 = v62;
    v141 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:");
    v53 = [NSNumber numberWithDouble:ceil(v63 * 0.5)];
    BOOL v64 = [(CUShutterButton *)self _shouldShowBackgroundViewForMode:a3];
    double v65 = 0.0;
    if (v142) {
      double v65 = 1.0;
    }
    v55 = [NSNumber numberWithDouble:v65];
    if (v137)
    {
      LODWORD(v66) = 1045220557;
      LODWORD(v67) = 1051931443;
      LODWORD(v68) = 1.0;
      uint64_t v143 = [MEMORY[0x263F15808] functionWithControlPoints:0.0 :v66 :v67 :v68];
      UIAnimationDragCoefficient();
      float v70 = v69;
      v71 = [v151 presentationLayer];
      int64_t v134 = a4;
      int64_t v136 = a3;
      v132 = v13;
      v130 = v55;
      BOOL v129 = v64;
      v72 = v15;
      if (v71)
      {
        v73 = [v151 presentationLayer];
        uint64_t v74 = [v73 valueForKeyPath:@"bounds.size"];
      }
      else
      {
        uint64_t v74 = [v151 valueForKeyPath:@"bounds.size"];
      }
      v100 = (void *)v143;

      v101 = [MEMORY[0x263F15760] animationWithKeyPath:@"bounds.size"];
      v139 = (void *)v74;
      [v101 setFromValue:v74];
      [v101 setToValue:v141];
      double v102 = v70;
      double v103 = v70 * 0.25;
      [v101 setDuration:v103];
      [v101 setTimingFunction:v143];
      uint64_t v104 = *MEMORY[0x263F15AA8];
      [v101 setFillMode:*MEMORY[0x263F15AA8]];
      v105 = [v151 presentationLayer];
      v146 = v56;
      if (v105)
      {
        v106 = [v151 presentationLayer];
        v107 = [v106 valueForKeyPath:@"cornerRadius"];
      }
      else
      {
        v107 = [v151 valueForKeyPath:@"cornerRadius"];
      }

      v108 = [MEMORY[0x263F15760] animationWithKeyPath:@"cornerRadius"];
      [v108 setFromValue:v107];
      [v108 setToValue:v53];
      [v108 setDuration:v102 * 0.22];
      [v108 setTimingFunction:v143];
      [v108 setFillMode:v104];
      [v151 addAnimation:v101 forKey:@"sizeAnimation"];
      [v151 addAnimation:v108 forKey:@"cornerRadiusAnimation"];
      if (v129)
      {
        v109 = v72;
        uint64_t v110 = [v72 presentationLayer];
        v111 = (void *)v110;
        if (v110) {
          v112 = (void *)v110;
        }
        else {
          v112 = v72;
        }
        id v113 = v112;

        v114 = [v113 valueForKeyPath:@"opacity"];
        v115 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
        [v115 setFromValue:v114];
        [v115 setToValue:v130];
        [v115 setDuration:v103];
        v116 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
        [v115 setTimingFunction:v116];

        v72 = v109;
        v117 = v109;
        v100 = (void *)v143;
        [v117 addAnimation:v115 forKey:@"opacityAnimation"];
      }
      v75 = v151;
      v56 = v146;
      goto LABEL_42;
    }
  }
  [v151 removeAllAnimations];
  [v15 removeAllAnimations];
  v75 = v151;
LABEL_43:
  [v75 setValue:v141 forKeyPath:@"bounds.size"];
  [v151 setValue:v53 forKeyPath:@"cornerRadius"];
  [v15 setValue:v55 forKey:@"opacity"];

  uint64_t v19 = v148;
LABEL_44:
  if (v147)
  {
    [v151 bounds];
    UIRectGetCenter();
    double v119 = v118;
    double v121 = v120;
    v122 = [(CUShutterButton *)self _spinnerView];
    objc_msgSend(v122, "setCenter:", v119, v121);
  }
  [v151 setValue:v19 forKeyPath:@"backgroundColor"];
  *(float *)&double v123 = v21;
  [v151 setOpacity:v123];
  if (v149) {
    *(float *)&double v124 = 0.0;
  }
  else {
    *(float *)&double v124 = v21;
  }
  [v56 setOpacity:v124];
  if (HIDWORD(v149)) {
    *(float *)&double v125 = v21;
  }
  else {
    *(float *)&double v125 = 0.0;
  }
  [v13 setOpacity:v125];
  if (v149) {
    *(float *)&double v126 = v21;
  }
  else {
    *(float *)&double v126 = 0.0;
  }
  [v150 setOpacity:v126];
  BOOL v127 = a3 == 3 && a4 == 8;
  uint64_t v128 = v127;
  if (v127 || a3 == 8) {
    [(CAMTimelapseShutterRingView *)self->__timelapseOuterView setAnimating:v128];
  }
}

- (BOOL)_isSpinningSupportedForLayoutStyle:(int64_t)a3
{
  return a3 != 2;
}

- (void)_updateSpinningAnimations
{
  BOOL v3 = [(CUShutterButton *)self isSpinning];
  uint64_t v4 = [(CUShutterButton *)self _isSpinningSupportedForLayoutStyle:[(CUShutterButton *)self layoutStyle]] & v3;
  BOOL v5 = [(CUShutterButton *)self _innerView];
  double v6 = [(CUShutterButton *)self _spinnerView];
  if (!v6)
  {
    double v6 = +[CAMShutterUtilities spinnerViewForLayoutStyle:[(CUShutterButton *)self layoutStyle]];
    [(CUShutterButton *)self set_spinnerView:v6];
  }
  long long v7 = [v6 layer];
  double v8 = [(CUShutterButton *)self _innerCircleColorForMode:[(CUShutterButton *)self mode] spinning:v4];
  if (v4)
  {
    [v5 addSubview:v6];
    [v5 bounds];
    UIRectGetCenter();
    objc_msgSend(v6, "setCenter:");
    [(CUShutterButton *)self spec];
    objc_msgSend(v6, "setBounds:", 0.0, 0.0, v21 + (v22 + v23) * -2.0, v21 + (v22 + v23) * -2.0);
    [v5 setBackgroundColor:v8];
    [v6 setAlpha:1.0];
    double v9 = [v5 layer];
    [v9 removeAnimationForKey:@"sizeAnimation"];

    long long v10 = [v5 layer];
    [v10 removeAnimationForKey:@"backgroundColorAnimation"];

    uint64_t v11 = +[CAMShutterUtilities spinnerAnimation];
    [v7 addAnimation:v11 forKey:@"spinnerRotation"];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x263F82E00];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    void v17[2] = __44__CUShutterButton__updateSpinningAnimations__block_invoke;
    v17[3] = &unk_263FA0CD0;
    id v18 = v5;
    id v19 = v8;
    id v20 = v6;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __44__CUShutterButton__updateSpinningAnimations__block_invoke_2;
    v13[3] = &unk_263FA3638;
    v13[4] = self;
    id v14 = v20;
    id v15 = v7;
    double v16 = @"spinnerRotation";
    [v12 animateWithDuration:327680 delay:v17 options:v13 animations:0.3 completion:0.0];

    uint64_t v11 = v18;
  }
}

uint64_t __44__CUShutterButton__updateSpinningAnimations__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 48);
  return [v2 setAlpha:0.0];
}

uint64_t __44__CUShutterButton__updateSpinningAnimations__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isSpinning];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 40) removeFromSuperview];
    BOOL v3 = *(void **)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    return [v3 removeAnimationForKey:v4];
  }
  return result;
}

- (void)setLayoutStyle:(int64_t)a3
{
  int64_t layoutStyle = self->_layoutStyle;
  if (layoutStyle != a3)
  {
    self->_int64_t layoutStyle = a3;
    uint64_t v11 = 0;
    long long v9 = 0u;
    long long v10 = 0u;
    CAMShutterButtonSpecForLayoutStyle(a3, (uint64_t)&v9);
    v7[0] = v9;
    v7[1] = v10;
    uint64_t v8 = v11;
    [(CUShutterButton *)self setSpec:v7];
    BOOL v6 = [(CUShutterButton *)self _isSpinningSupportedForLayoutStyle:layoutStyle];
    if (v6 != [(CUShutterButton *)self _isSpinningSupportedForLayoutStyle:a3]) {
      [(CUShutterButton *)self _updateSpinningAnimations];
    }
  }
}

- (CAMShutterButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMShutterButtonDelegate *)WeakRetained;
}

- (BOOL)showDisabled
{
  return self->_showDisabled;
}

- (UIImageView)_outerImageView
{
  return self->__outerImageView;
}

- (CAMTimelapseShutterRingView)_timelapseOuterView
{
  return self->__timelapseOuterView;
}

- (UIView)_innerViewContrastView
{
  return self->__innerViewContrastView;
}

- (UIView)_stopModeBackground
{
  return self->__stopModeBackground;
}

- (void)set_stopModeBackground:(id)a3
{
}

- (UIView)_spinnerView
{
  return self->__spinnerView;
}

- (void)set_spinnerView:(id)a3
{
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__spinnerView, 0);
  objc_storeStrong((id *)&self->__stopModeBackground, 0);
  objc_storeStrong((id *)&self->__innerViewContrastView, 0);
  objc_storeStrong((id *)&self->__innerView, 0);
  objc_storeStrong((id *)&self->__timelapseOuterView, 0);
  objc_storeStrong((id *)&self->__outerImageView, 0);
  objc_storeStrong((id *)&self->__outerView, 0);
  objc_storeStrong((id *)&self->_stopModeBackgroundColor, 0);
  objc_storeStrong((id *)&self->_contentColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end