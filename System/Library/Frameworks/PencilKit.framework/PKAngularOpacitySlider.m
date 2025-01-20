@interface PKAngularOpacitySlider
+ (void)_layoutGradientMaskLayer:(double)a3 frame:(double)a4 isReversed:(uint64_t)a5;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (CAGradientLayer)alphaGridViewMaskLayer;
- (CAGradientLayer)colorViewMaskLayer;
- (CAShapeLayer)baseShapeLayer;
- (CGSize)sizeThatFits:(CGSize)result;
- (PKAngularOpacitySliderKnobView)sliderKnob;
- (UIColor)color;
- (UIView)colorView;
- (_PKCheckerGridView)alphaGridView;
- (_PKColorAlphaSliderDelegate)delegate;
- (double)_angleForSliderKnobPosition:(double)a3;
- (double)_colorAlphaForSliderKnobAngle:(double *)a1;
- (double)_knobViewFrameForColorAlpha:(double *)a1;
- (double)initWithFrame:(double)a3 startAngle:(double)a4 endAngle:(double)a5 arcRadius:(double)a6 arcWidth:(double)a7;
- (double)maxAlpha;
- (double)minAlpha;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)colorUserInterfaceStyle;
- (void)_colorViewTapGestureHandler:(id)a3;
- (void)_didPanSliderKnob:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAlphaGridView:(id)a3;
- (void)setAlphaGridViewMaskLayer:(id)a3;
- (void)setBaseShapeLayer:(id)a3;
- (void)setColor:(id)a3;
- (void)setColor:(id)a3 animated:(BOOL)a4;
- (void)setColorUserInterfaceStyle:(int64_t)a3;
- (void)setColorView:(id)a3;
- (void)setColorViewMaskLayer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMaxAlpha:(double)a3;
- (void)setMinAlpha:(double)a3;
- (void)setSliderKnob:(id)a3;
@end

@implementation PKAngularOpacitySlider

- (double)initWithFrame:(double)a3 startAngle:(double)a4 endAngle:(double)a5 arcRadius:(double)a6 arcWidth:(double)a7
{
  if (!a1) {
    return 0;
  }
  v39.receiver = a1;
  v39.super_class = (Class)PKAngularOpacitySlider;
  v13 = (double *)objc_msgSendSuper2(&v39, sel_initWithFrame_);
  v14 = v13;
  if (v13)
  {
    v13[57] = a6;
    v13[58] = a7;
    v13[59] = a8;
    v13[60] = a9;
    uint64_t v15 = [MEMORY[0x1E4FB1618] blackColor];
    v16 = (void *)*((void *)v14 + 52);
    *((void *)v14 + 52) = v15;

    v14[56] = 0.0;
    v14[55] = 1.0;
    v17 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
    v18 = [MEMORY[0x1E4FB1618] colorWithWhite:0.95 alpha:1.0];
    v19 = [[_PKCheckerGridView alloc] initWithTileSize:v17 colorA:v18 colorB:a9 / 3.0];
    v20 = (void *)*((void *)v14 + 63);
    *((void *)v14 + 63) = v19;

    [*((id *)v14 + 63) setUserInteractionEnabled:0];
    [v14 addSubview:*((void *)v14 + 63)];
    id v21 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v22 = (void *)*((void *)v14 + 61);
    *((void *)v14 + 61) = v21;

    [v14 addSubview:*((void *)v14 + 61)];
    v23 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v14 action:sel__colorViewTapGestureHandler_];
    [v23 setDelegate:v14];
    [*((id *)v14 + 61) addGestureRecognizer:v23];
    id v24 = objc_alloc_init(MEMORY[0x1E4F39BD0]);
    v25 = (void *)*((void *)v14 + 62);
    *((void *)v14 + 62) = v24;

    [*((id *)v14 + 62) setType:*MEMORY[0x1E4F3A398]];
    objc_msgSend(*((id *)v14 + 62), "setStartPoint:", 0.5, 0.5);
    objc_msgSend(*((id *)v14 + 62), "setEndPoint:", 0.5, 1.0);
    uint64_t v26 = *((void *)v14 + 62);
    v27 = [*((id *)v14 + 61) layer];
    [v27 setMask:v26];

    id v28 = objc_alloc_init(MEMORY[0x1E4F39C88]);
    v29 = (void *)*((void *)v14 + 66);
    *((void *)v14 + 66) = v28;

    [*((id *)v14 + 66) setLineCap:*MEMORY[0x1E4F3A458]];
    [*((id *)v14 + 66) setStrokeStart:0.0];
    [*((id *)v14 + 66) setStrokeEnd:1.0];
    [*((id *)v14 + 66) setFillColor:0];
    id v30 = [MEMORY[0x1E4FB1618] blackColor];
    objc_msgSend(*((id *)v14 + 66), "setStrokeColor:", objc_msgSend(v30, "CGColor"));

    uint64_t v31 = *((void *)v14 + 66);
    v32 = [v14 layer];
    [v32 setMask:v31];

    v33 = [v14 layer];
    [v33 setMasksToBounds:1];

    v34 = [PKAngularOpacitySliderKnobView alloc];
    uint64_t v35 = -[PKAngularOpacitySliderKnobView initWithFrame:](v34, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v36 = (void *)*((void *)v14 + 65);
    *((void *)v14 + 65) = v35;

    [v14 addSubview:*((void *)v14 + 65)];
    v37 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v14 action:sel__didPanSliderKnob_];
    [v37 setMinimumPressDuration:0.0];
    [v37 setAllowableMovement:1.79769313e308];
    [*((id *)v14 + 65) addGestureRecognizer:v37];
    [*((id *)v14 + 65) setAccessibilityIdentifier:@"OpacitySliderKnob"];
    [v14 setAccessibilityIdentifier:@"Opacity"];
    [v14 setAccessibilityLabel:@"Opacity"];
  }
  return v14;
}

- (void)dealloc
{
  baseShapeLayerPathForHitTesting = self->_baseShapeLayerPathForHitTesting;
  if (baseShapeLayerPathForHitTesting)
  {
    CGPathRelease(baseShapeLayerPathForHitTesting);
    self->_baseShapeLayerPathForHitTesting = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PKAngularOpacitySlider;
  [(PKAngularOpacitySlider *)&v4 dealloc];
}

- (void)setColor:(id)a3
{
}

- (void)setColor:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(PKAngularOpacitySlider *)self color];
  [v7 alphaComponent];
  v9 = v8;

  id v10 = v6;
  if (self && ([(UIColor *)self->_color isEqual:v10] & 1) == 0)
  {
    v11 = +[_PKColorAlphaSliderIOS rgbaColorFromColorIfPossible:v10];
    [v10 alphaComponent];
    double v13 = v12;
    [(PKAngularOpacitySlider *)self minAlpha];
    double v15 = fmax(v13, v14);
    [(PKAngularOpacitySlider *)self maxAlpha];
    objc_msgSend(v11, "colorWithAlphaComponent:", fmin(v15, v16));
    v17 = (UIColor *)objc_claimAutoreleasedReturnValue();
    color = self->_color;
    self->_color = v17;
  }
  [(PKAngularOpacitySlider *)self setNeedsLayout];
  if (v4)
  {
    [v10 alphaComponent];
    double v20 = vabdd_f64(*(double *)&v9, v19);
    BOOL v21 = *(double *)&v9 <= v19;
    double v22 = v20 * 0.0666666667;
    v23 = (void *)(uint64_t)fmax(v20 / 0.01, 1.0);
    objc_initWeak(&location, self);
    id v24 = (void *)MEMORY[0x1E4FB1EB0];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __44__PKAngularOpacitySlider_setColor_animated___block_invoke;
    v26[3] = &unk_1E64CB158;
    v27[1] = v23;
    v27[2] = v9;
    BOOL v28 = v21;
    v27[3] = (id)0x3F847AE147AE147BLL;
    objc_copyWeak(v27, &location);
    v26[4] = self;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __44__PKAngularOpacitySlider_setColor_animated___block_invoke_3;
    v25[3] = &unk_1E64C6730;
    v25[4] = self;
    [v24 animateKeyframesWithDuration:6 delay:v26 options:v25 animations:v22 completion:0.0];
    objc_destroyWeak(v27);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PKAngularOpacitySlider *)self layoutIfNeeded];
  }
}

void __44__PKAngularOpacitySlider_setColor_animated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (v1 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = MEMORY[0x1E4F143A8];
    v5 = (id *)(a1 + 40);
    do
    {
      double v6 = -(double)v3;
      if (*(unsigned char *)(a1 + 72)) {
        double v6 = (double)v3;
      }
      double v7 = *(double *)(a1 + 56) + v6 * *(double *)(a1 + 64);
      double v8 = (double)v3 / (double)v1;
      v9 = (void *)MEMORY[0x1E4FB1EB0];
      v11[0] = v4;
      v11[1] = 3221225472;
      v11[2] = __44__PKAngularOpacitySlider_setColor_animated___block_invoke_2;
      v11[3] = &unk_1E64CB130;
      double v10 = 1.0 / (double)v1;
      objc_copyWeak(v12, v5);
      v11[4] = *(void *)(a1 + 32);
      v12[1] = *(id *)&v7;
      [v9 addKeyframeWithRelativeStartTime:v11 relativeDuration:v8 animations:v10];
      objc_destroyWeak(v12);
      ++v3;
      uint64_t v1 = *(void *)(a1 + 48);
    }
    while (v3 < v1);
  }
}

void __44__PKAngularOpacitySlider_setColor_animated___block_invoke_2(uint64_t a1)
{
  double v2 = -[PKAngularOpacitySlider _knobViewFrameForColorAlpha:](*(double **)(a1 + 32), *(double *)(a1 + 48));
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = [WeakRetained sliderKnob];
  objc_msgSend(v9, "setFrame:", v2, v4, v6, v8);
}

- (double)_knobViewFrameForColorAlpha:(double *)a1
{
  if (!a1) {
    return 0.0;
  }
  [a1 minAlpha];
  double v5 = fmax(a2, v4);
  [a1 maxAlpha];
  double v7 = fmin(v5, v6);
  [a1 minAlpha];
  double v9 = v8;
  [a1 maxAlpha];
  double v11 = a1[57] + (a1[58] - a1[57]) * ((a2 - v9) / (v10 - v9));
  [a1 bounds];
  UIRectGetCenter();
  PKPointOnArc(v12, v13, a1[59], v11);
  double v14 = a2 - v7;
  double v15 = 0.0;
  if (v14 != 0.0)
  {
    +[_PKColorAlphaSliderIOS _outputForResistanceFunction:v14 factor:0.176776695];
    double v15 = v16 * 44.0;
  }
  v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v17 scale];
  UIRectCenteredAboutPointScale();
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  v30.origin.x = v19;
  v30.origin.y = v21;
  v30.size.width = v23;
  v30.size.height = v25;
  CGRectOffset(v30, v15, 0.0);
  uint64_t v26 = [a1 traitCollection];
  [v26 displayScale];
  UIRectIntegralWithScale();
  double v28 = v27;

  return v28;
}

uint64_t __44__PKAngularOpacitySlider_setColor_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setMinAlpha:(double)a3
{
  self->_minAlpha = a3;
  [(PKAngularOpacitySlider *)self setNeedsLayout];
}

- (void)setMaxAlpha:(double)a3
{
  self->_maxAlpha = a3;
  [(PKAngularOpacitySlider *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v54[2] = *MEMORY[0x1E4F143B8];
  v53.receiver = self;
  v53.super_class = (Class)PKAngularOpacitySlider;
  [(PKAngularOpacitySlider *)&v53 layoutSubviews];
  double startAngle = 0.0;
  double arcRadius = 0.0;
  if (self) {
    double arcRadius = self->_arcRadius;
  }
  [(PKAngularOpacitySlider *)self bounds];
  UIRectGetCenter();
  double v6 = v5;
  double v8 = v7;
  [(PKAngularOpacitySlider *)self bounds];
  CGRectGetWidth(v55);
  [(PKAngularOpacitySlider *)self bounds];
  CGRectGetHeight(v56);
  double v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v9 scale];
  UIRectCenteredAboutPointScale();
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = [(PKAngularOpacitySlider *)self color];
  CGFloat v19 = [(PKAngularOpacitySlider *)self colorView];
  objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);
  [v19 _setContinuousCornerRadius:arcRadius];
  [v19 setClipsToBounds:1];
  double v20 = [v18 colorWithAlphaComponent:1.0];
  [v19 setBackgroundColor:v20];

  CGFloat v21 = [(PKAngularOpacitySlider *)self colorViewMaskLayer];
  [v19 bounds];
  +[PKAngularOpacitySlider _layoutGradientMaskLayer:frame:isReversed:](v22, v23, v24, v25, (uint64_t)PKAngularOpacitySlider, v21);

  uint64_t v26 = [(PKAngularOpacitySlider *)self alphaGridView];
  objc_msgSend(v26, "setFrame:", v11, v13, v15, v17);
  [v26 _setContinuousCornerRadius:arcRadius];
  [v26 setClipsToBounds:1];
  double v27 = [(PKAngularOpacitySlider *)self alphaGridViewMaskLayer];
  [v26 bounds];
  +[PKAngularOpacitySlider _layoutGradientMaskLayer:frame:isReversed:](v28, v29, v30, v31, (uint64_t)PKAngularOpacitySlider, v27);

  [v18 alphaComponent];
  double v33 = -[PKAngularOpacitySlider _knobViewFrameForColorAlpha:]((double *)self, v32);
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  v40 = [(PKAngularOpacitySlider *)self sliderKnob];
  objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

  double arcWidth = 0.0;
  double endAngle = 0.0;
  if (self)
  {
    double arcWidth = self->_arcWidth;
    double startAngle = self->_startAngle;
    double endAngle = self->_endAngle;
  }
  v43 = [(PKAngularOpacitySlider *)self baseShapeLayer];
  [v43 setLineWidth:arcWidth];
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v6, v8, arcRadius, startAngle, endAngle);
  id v44 = objc_claimAutoreleasedReturnValue();
  v45 = (const CGPath *)[v44 CGPath];

  [v43 setPath:v45];
  baseShapeLayerPathForHitTesting = self->_baseShapeLayerPathForHitTesting;
  if (baseShapeLayerPathForHitTesting)
  {
    CGPathRelease(baseShapeLayerPathForHitTesting);
    self->_baseShapeLayerPathForHitTesting = 0;
  }
  self->_baseShapeLayerPathForHitTesting = CGPathCreateCopyByStrokingPath(v45, 0, arcWidth, kCGLineCapRound, kCGLineJoinRound, 0.0);
  double v47 = endAngle + -1.57079633;
  *(float *)&double v47 = (startAngle + -1.57079633) / 6.28318531;
  v48 = [NSNumber numberWithFloat:v47];
  v54[0] = v48;
  *(float *)&double v49 = (endAngle + -1.57079633) / 6.28318531;
  v50 = [NSNumber numberWithFloat:v49];
  v54[1] = v50;
  v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
  v52 = [(PKAngularOpacitySlider *)self colorViewMaskLayer];
  [v52 setLocations:v51];
}

+ (void)_layoutGradientMaskLayer:(double)a3 frame:(double)a4 isReversed:(uint64_t)a5
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  self;
  double v11 = [MEMORY[0x1E4FB1618] whiteColor];
  id v12 = [v11 colorWithAlphaComponent:0.0];
  v16[0] = [v12 CGColor];
  double v13 = [MEMORY[0x1E4FB1618] whiteColor];
  id v14 = [v13 colorWithAlphaComponent:1.0];
  v16[1] = [v14 CGColor];
  double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  [v10 setColors:v15];

  objc_msgSend(v10, "setFrame:", a1, a2, a3, a4);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  if (self) {
    double arcWidth = self->_arcWidth;
  }
  else {
    double arcWidth = 0.0;
  }
  result.height = arcWidth;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)PKAngularOpacitySlider;
  double v7 = -[PKAngularOpacitySlider hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4);
  if (!self || (v11.x = x, v11.CGFloat y = y, !CGPathContainsPoint(self->_baseShapeLayerPathForHitTesting, 0, v11, 0)))
  {

    double v7 = 0;
  }

  return v7;
}

- (void)_colorViewTapGestureHandler:(id)a3
{
  id v14 = a3;
  if ([v14 state] == 3)
  {
    double v4 = [v14 view];
    [v14 locationInView:v4];
    double v6 = v5;
    double v8 = v7;

    double v9 = [(PKAngularOpacitySlider *)(double *)self _angleForSliderKnobPosition:v8];
    double v10 = -[PKAngularOpacitySlider _colorAlphaForSliderKnobAngle:]((double *)self, v9);
    CGPoint v11 = [(PKAngularOpacitySlider *)self color];
    id v12 = [v11 colorWithAlphaComponent:v10];
    [(PKAngularOpacitySlider *)self setColor:v12 animated:1];

    double v13 = [(PKAngularOpacitySlider *)self delegate];
    [v13 _colorAlphaSliderUserDidChangeSlider:self];
  }
}

- (double)_angleForSliderKnobPosition:(double)a3
{
  if (!a1) {
    return 0.0;
  }
  [a1 bounds];
  UIRectGetCenter();
  long double v8 = atan2(a3 - v7, a2 - v6);
  double v9 = fmod(v8, 6.28318531);
  if (v8 <= 6.28318531 && v8 >= 0.0) {
    double v9 = v8;
  }
  if (v9 < 0.0) {
    double v9 = v9 + 6.28318531;
  }
  if (v9 == 0.0) {
    double v11 = 0.0;
  }
  else {
    double v11 = v9;
  }
  id v12 = [a1 color];
  [v12 alphaComponent];
  double v14 = v13;
  [a1 minAlpha];
  double v16 = v15;
  [a1 maxAlpha];
  double v18 = a1[57] + (a1[58] - a1[57]) * ((v14 - v16) / (v17 - v16));

  double v19 = v11 + 6.28318531;
  double v20 = vabdd_f64(v11, v18);
  if (vabdd_f64(v11 + 6.28318531, v18) >= v20)
  {
    double v19 = v11;
    if (vabdd_f64(v11 + -6.28318531, v18) < v20) {
      double v19 = v11 + -6.28318531;
    }
  }
  return fmin(fmax(v19, a1[57]), a1[58]);
}

- (double)_colorAlphaForSliderKnobAngle:(double *)a1
{
  if (!a1) {
    return 0.0;
  }
  double v3 = (a2 - a1[57]) / (a1[58] - a1[57]);
  [a1 minAlpha];
  double v5 = v4;
  [a1 maxAlpha];
  return v6 * v3 + v5 * (1.0 - v3);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  [a4 locationInView:self];
  if (!self) {
    return 0;
  }
  baseShapeLayerPathForHitTesting = self->_baseShapeLayerPathForHitTesting;

  return CGPathContainsPoint(baseShapeLayerPathForHitTesting, 0, *(CGPoint *)&v5, 0);
}

- (void)_didPanSliderKnob:(id)a3
{
  id v11 = a3;
  [v11 locationInView:self];
  double v6 = [(PKAngularOpacitySlider *)(double *)self _angleForSliderKnobPosition:v5];
  double v7 = -[PKAngularOpacitySlider _colorAlphaForSliderKnobAngle:]((double *)self, v6);
  long double v8 = [(PKAngularOpacitySlider *)self color];
  double v9 = [v8 colorWithAlphaComponent:v7];
  [(PKAngularOpacitySlider *)self setColor:v9];

  double v10 = [(PKAngularOpacitySlider *)self delegate];
  if ([v11 state] == 1)
  {
    if (v10 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v10 _colorAlphaSliderUserDidStartDraggingSlider:self];
    }
  }
  else if (([v11 state] == 3 || objc_msgSend(v11, "state") == 4 || objc_msgSend(v11, "state") == 5) {
         && v10
  }
         && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v10 _colorAlphaSliderUserDidEndDraggingSlider:self];
  }
  [v10 _colorAlphaSliderUserDidChangeSlider:self];
}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  if (self->_colorUserInterfaceStyle != a3)
  {
    self->_colorUserInterfaceStyle = a3;
    [(PKAngularOpacitySlider *)self setNeedsLayout];
  }
}

- (UIColor)color
{
  return self->_color;
}

- (int64_t)colorUserInterfaceStyle
{
  return self->_colorUserInterfaceStyle;
}

- (_PKColorAlphaSliderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (_PKColorAlphaSliderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)maxAlpha
{
  return self->_maxAlpha;
}

- (double)minAlpha
{
  return self->_minAlpha;
}

- (UIView)colorView
{
  return self->_colorView;
}

- (void)setColorView:(id)a3
{
}

- (CAGradientLayer)colorViewMaskLayer
{
  return self->_colorViewMaskLayer;
}

- (void)setColorViewMaskLayer:(id)a3
{
}

- (_PKCheckerGridView)alphaGridView
{
  return self->_alphaGridView;
}

- (void)setAlphaGridView:(id)a3
{
}

- (CAGradientLayer)alphaGridViewMaskLayer
{
  return self->_alphaGridViewMaskLayer;
}

- (void)setAlphaGridViewMaskLayer:(id)a3
{
}

- (PKAngularOpacitySliderKnobView)sliderKnob
{
  return self->_sliderKnob;
}

- (void)setSliderKnob:(id)a3
{
}

- (CAShapeLayer)baseShapeLayer
{
  return self->_baseShapeLayer;
}

- (void)setBaseShapeLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseShapeLayer, 0);
  objc_storeStrong((id *)&self->_sliderKnob, 0);
  objc_storeStrong((id *)&self->_alphaGridViewMaskLayer, 0);
  objc_storeStrong((id *)&self->_alphaGridView, 0);
  objc_storeStrong((id *)&self->_colorViewMaskLayer, 0);
  objc_storeStrong((id *)&self->_colorView, 0);
  objc_destroyWeak((id *)&self->delegate);

  objc_storeStrong((id *)&self->_color, 0);
}

@end