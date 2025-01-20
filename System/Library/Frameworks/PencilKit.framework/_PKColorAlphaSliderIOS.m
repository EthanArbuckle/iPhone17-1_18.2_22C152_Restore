@interface _PKColorAlphaSliderIOS
+ (double)_outputForResistanceFunction:(double)a3 factor:(double)a4;
+ (id)rgbaColorFromColorIfPossible:(id)a3;
+ (void)_layoutGradientMaskLayer:(id)a3 frame:(CGRect)a4 isReversed:(BOOL)a5;
- (CAGradientLayer)alphaGridViewMaskLayer;
- (CAGradientLayer)colorViewMaskLayer;
- (CGRect)_knobViewFrameForColorAlpha:(double)a3;
- (CGSize)sizeThatFits:(CGSize)result;
- (UIColor)color;
- (UIView)colorView;
- (_PKCheckerGridView)alphaGridView;
- (_PKColorAlphaSliderDelegate)delegate;
- (_PKColorAlphaSliderIOS)initWithFrame:(CGRect)a3;
- (_PKSliderKnobView)sliderKnobView;
- (double)_sliderKnobViewWidth;
- (double)colorAlphaForSliderKnobXPosition:(double)a3;
- (double)maxAlpha;
- (double)minAlpha;
- (double)sliderKnobXPositionForColorAlpha:(double)a3;
- (int64_t)_uiColorUserInterfaceStyle;
- (int64_t)colorUserInterfaceStyle;
- (void)_colorViewTapGestureHandler:(id)a3;
- (void)_setColorNoLayout:(id)a3;
- (void)didPanSliderKnob:(id)a3;
- (void)layoutSubviews;
- (void)setAlphaGridView:(id)a3;
- (void)setAlphaGridViewMaskLayer:(id)a3;
- (void)setColor:(id)a3;
- (void)setColor:(id)a3 animated:(BOOL)a4;
- (void)setColorUserInterfaceStyle:(int64_t)a3;
- (void)setColorView:(id)a3;
- (void)setColorViewMaskLayer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMaxAlpha:(double)a3;
- (void)setMinAlpha:(double)a3;
- (void)setSliderKnobView:(id)a3;
@end

@implementation _PKColorAlphaSliderIOS

- (_PKColorAlphaSliderIOS)initWithFrame:(CGRect)a3
{
  v27.receiver = self;
  v27.super_class = (Class)_PKColorAlphaSliderIOS;
  v3 = -[_PKColorAlphaSliderIOS initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = [MEMORY[0x1E4FB1618] blackColor];
  color = v3->_color;
  v3->_color = (UIColor *)v4;

  v3->_minAlpha = 0.0;
  v3->_maxAlpha = 1.0;
  v6 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
  v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.95 alpha:1.0];
  v8 = [[_PKCheckerGridView alloc] initWithTileSize:v6 colorA:v7 colorB:6.66666667];
  alphaGridView = v3->_alphaGridView;
  v3->_alphaGridView = v8;

  [(_PKCheckerGridView *)v3->_alphaGridView setUserInteractionEnabled:0];
  [(_PKColorAlphaSliderIOS *)v3 addSubview:v3->_alphaGridView];
  v10 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  colorView = v3->_colorView;
  v3->_colorView = v10;

  [(_PKColorAlphaSliderIOS *)v3 addSubview:v3->_colorView];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v3 action:sel__colorViewTapGestureHandler_];
  [(UIView *)v3->_colorView addGestureRecognizer:v12];
  v13 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E4F39BD0]);
  alphaGridViewMaskLayer = v3->_alphaGridViewMaskLayer;
  v3->_alphaGridViewMaskLayer = v13;

  v15 = v3->_alphaGridViewMaskLayer;
  v16 = [(_PKCheckerGridView *)v3->_alphaGridView layer];
  [v16 setMask:v15];

  v17 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E4F39BD0]);
  colorViewMaskLayer = v3->_colorViewMaskLayer;
  v3->_colorViewMaskLayer = v17;

  v19 = v3->_colorViewMaskLayer;
  v20 = [(UIView *)v3->_colorView layer];
  [v20 setMask:v19];

  v21 = [_PKSliderKnobView alloc];
  uint64_t v22 = -[_PKSliderKnobView initWithFrame:](v21, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  sliderKnobView = v3->_sliderKnobView;
  v3->_sliderKnobView = (_PKSliderKnobView *)v22;

  [(_PKColorAlphaSliderIOS *)v3 addSubview:v3->_sliderKnobView];
  v24 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v3 action:sel_didPanSliderKnob_];
  [v24 setMinimumPressDuration:0.0];
  [v24 setAllowableMovement:1.79769313e308];
  v25 = [(_PKColorAlphaSliderIOS *)v3 sliderKnobView];
  [v25 addGestureRecognizer:v24];

  [(_PKSliderKnobView *)v3->_sliderKnobView setAccessibilityIdentifier:@"OpacitySliderKnob"];
  [(_PKColorAlphaSliderIOS *)v3 setAccessibilityIdentifier:@"Opacity"];

  return v3;
}

- (void)setColor:(id)a3
{
}

- (void)setColor:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(_PKColorAlphaSliderIOS *)self _setColorNoLayout:a3];
  [(_PKColorAlphaSliderIOS *)self setNeedsLayout];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44___PKColorAlphaSliderIOS_setColor_animated___block_invoke;
  aBlock[3] = &unk_1E64C61C0;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v7 = v6;
  if (v4) {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:6 delay:v6 usingSpringWithDamping:0 initialSpringVelocity:0.0666666667 options:0.0 animations:1.0 completion:0.0];
  }
  else {
    (*((void (**)(void *))v6 + 2))(v6);
  }
}

- (void)_setColorNoLayout:(id)a3
{
  id v12 = a3;
  if ((-[UIColor isEqual:](self->_color, "isEqual:") & 1) == 0)
  {
    BOOL v4 = [(id)objc_opt_class() rgbaColorFromColorIfPossible:v12];
    [v12 alphaComponent];
    double v6 = v5;
    [(_PKColorAlphaSliderIOS *)self minAlpha];
    double v8 = fmax(v6, v7);
    [(_PKColorAlphaSliderIOS *)self maxAlpha];
    objc_msgSend(v4, "colorWithAlphaComponent:", fmin(v8, v9));
    v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
    color = self->_color;
    self->_color = v10;
  }
}

- (void)setMinAlpha:(double)a3
{
  self->_minAlpha = a3;
  [(_PKColorAlphaSliderIOS *)self setNeedsLayout];
}

- (void)setMaxAlpha:(double)a3
{
  self->_maxAlpha = a3;
  [(_PKColorAlphaSliderIOS *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v51.receiver = self;
  v51.super_class = (Class)_PKColorAlphaSliderIOS;
  [(_PKColorAlphaSliderIOS *)&v51 layoutSubviews];
  [(_PKColorAlphaSliderIOS *)self bounds];
  CGRectGetWidth(v52);
  [(_PKColorAlphaSliderIOS *)self bounds];
  UIRectGetCenter();
  v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 scale];
  UIRectCenteredAboutPointScale();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(_PKColorAlphaSliderIOS *)self colorView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = [(_PKColorAlphaSliderIOS *)self colorView];
  [v13 bounds];
  CGFloat v14 = CGRectGetHeight(v53) * 0.5;
  v15 = [(_PKColorAlphaSliderIOS *)self colorView];
  [v15 _setContinuousCornerRadius:v14];

  v16 = [(_PKColorAlphaSliderIOS *)self colorView];
  [v16 setClipsToBounds:1];

  v17 = [(_PKColorAlphaSliderIOS *)self color];
  v18 = +[PKInkingTool convertColor:v17 fromUserInterfaceStyle:1 to:[(_PKColorAlphaSliderIOS *)self _uiColorUserInterfaceStyle]];
  v19 = [v18 colorWithAlphaComponent:1.0];
  v20 = [(_PKColorAlphaSliderIOS *)self colorView];
  [v20 setBackgroundColor:v19];

  v21 = objc_opt_class();
  uint64_t v22 = [(_PKColorAlphaSliderIOS *)self colorViewMaskLayer];
  v23 = [(_PKColorAlphaSliderIOS *)self colorView];
  [v23 bounds];
  objc_msgSend(v21, "_layoutGradientMaskLayer:frame:isReversed:", v22, 0);

  [(_PKColorAlphaSliderIOS *)self bounds];
  CGRectGetWidth(v54);
  [(_PKColorAlphaSliderIOS *)self bounds];
  UIRectGetCenter();
  v24 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v24 scale];
  UIRectCenteredAboutPointScale();
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  v33 = [(_PKColorAlphaSliderIOS *)self alphaGridView];
  objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

  v34 = [(_PKColorAlphaSliderIOS *)self alphaGridView];
  [v34 bounds];
  CGFloat v35 = CGRectGetHeight(v55) * 0.5;
  v36 = [(_PKColorAlphaSliderIOS *)self alphaGridView];
  [v36 _setContinuousCornerRadius:v35];

  v37 = [(_PKColorAlphaSliderIOS *)self alphaGridView];
  [v37 setClipsToBounds:1];

  v38 = objc_opt_class();
  v39 = [(_PKColorAlphaSliderIOS *)self alphaGridViewMaskLayer];
  v40 = [(_PKColorAlphaSliderIOS *)self alphaGridView];
  [v40 bounds];
  objc_msgSend(v38, "_layoutGradientMaskLayer:frame:isReversed:", v39, 1);

  v41 = [(_PKColorAlphaSliderIOS *)self color];
  [v41 alphaComponent];
  -[_PKColorAlphaSliderIOS _knobViewFrameForColorAlpha:](self, "_knobViewFrameForColorAlpha:");
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  v50 = [(_PKColorAlphaSliderIOS *)self sliderKnobView];
  objc_msgSend(v50, "setFrame:", v43, v45, v47, v49);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 20.0;
  result.height = v3;
  return result;
}

- (void)_colorViewTapGestureHandler:(id)a3
{
  id v12 = a3;
  if ([v12 state] == 3)
  {
    double v4 = [v12 view];
    [v12 locationInView:v4];
    double v6 = v5;

    [(_PKColorAlphaSliderIOS *)self colorAlphaForSliderKnobXPosition:v6];
    double v8 = v7;
    double v9 = [(_PKColorAlphaSliderIOS *)self color];
    double v10 = [v9 colorWithAlphaComponent:v8];
    [(_PKColorAlphaSliderIOS *)self setColor:v10 animated:1];

    double v11 = [(_PKColorAlphaSliderIOS *)self delegate];
    [v11 _colorAlphaSliderUserDidChangeSlider:self];
  }
}

- (double)_sliderKnobViewWidth
{
  v2 = [(_PKColorAlphaSliderIOS *)self sliderKnobView];
  objc_msgSend(v2, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v4 = v3;

  return v4;
}

- (double)sliderKnobXPositionForColorAlpha:(double)a3
{
  [(_PKColorAlphaSliderIOS *)self minAlpha];
  double v6 = v5;
  [(_PKColorAlphaSliderIOS *)self maxAlpha];
  double v8 = (a3 - v6) / (v7 - v6);
  [(_PKColorAlphaSliderIOS *)self bounds];
  double Width = CGRectGetWidth(v14);
  [(_PKColorAlphaSliderIOS *)self _sliderKnobViewWidth];
  double v11 = Width - v10;
  [(_PKColorAlphaSliderIOS *)self _sliderKnobViewWidth];
  return v12 * 0.5 + v8 * v11;
}

- (double)colorAlphaForSliderKnobXPosition:(double)a3
{
  [(_PKColorAlphaSliderIOS *)self _sliderKnobViewWidth];
  double v6 = a3 + v5 * -0.5;
  [(_PKColorAlphaSliderIOS *)self bounds];
  double Width = CGRectGetWidth(v14);
  [(_PKColorAlphaSliderIOS *)self _sliderKnobViewWidth];
  double v9 = v6 / (Width - v8);
  [(_PKColorAlphaSliderIOS *)self minAlpha];
  double v11 = v10;
  [(_PKColorAlphaSliderIOS *)self maxAlpha];
  return v12 * v9 + v11 * (1.0 - v9);
}

- (void)didPanSliderKnob:(id)a3
{
  id v18 = a3;
  [v18 locationInView:self];
  -[_PKColorAlphaSliderIOS colorAlphaForSliderKnobXPosition:](self, "colorAlphaForSliderKnobXPosition:");
  double v5 = v4;
  double v6 = [(_PKColorAlphaSliderIOS *)self color];
  double v7 = [v6 colorWithAlphaComponent:v5];
  [(_PKColorAlphaSliderIOS *)self setColor:v7];

  if ([v18 state] != 1)
  {
    if ([v18 state] != 3 && objc_msgSend(v18, "state") != 4 && objc_msgSend(v18, "state") != 5) {
      goto LABEL_12;
    }
    uint64_t v13 = [(_PKColorAlphaSliderIOS *)self delegate];
    if (!v13) {
      goto LABEL_12;
    }
    CGRect v14 = (void *)v13;
    v15 = [(_PKColorAlphaSliderIOS *)self delegate];
    char v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) == 0) {
      goto LABEL_12;
    }
    double v12 = [(_PKColorAlphaSliderIOS *)self delegate];
    [v12 _colorAlphaSliderUserDidEndDraggingSlider:self];
    goto LABEL_11;
  }
  uint64_t v8 = [(_PKColorAlphaSliderIOS *)self delegate];
  if (v8)
  {
    double v9 = (void *)v8;
    double v10 = [(_PKColorAlphaSliderIOS *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      double v12 = [(_PKColorAlphaSliderIOS *)self delegate];
      [v12 _colorAlphaSliderUserDidStartDraggingSlider:self];
LABEL_11:
    }
  }
LABEL_12:
  v17 = [(_PKColorAlphaSliderIOS *)self delegate];
  [v17 _colorAlphaSliderUserDidChangeSlider:self];
}

- (CGRect)_knobViewFrameForColorAlpha:(double)a3
{
  [(_PKColorAlphaSliderIOS *)self minAlpha];
  double v6 = fmax(a3, v5);
  [(_PKColorAlphaSliderIOS *)self maxAlpha];
  double v8 = fmin(v6, v7);
  [(_PKColorAlphaSliderIOS *)self sliderKnobXPositionForColorAlpha:v8];
  double v9 = a3 - v8;
  double v10 = 0.0;
  if (v9 != 0.0)
  {
    +[_PKColorAlphaSliderIOS _outputForResistanceFunction:v9 factor:0.176776695];
    double v10 = v11 * 44.0;
  }
  double v12 = [(_PKColorAlphaSliderIOS *)self sliderKnobView];
  objc_msgSend(v12, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

  [(_PKColorAlphaSliderIOS *)self bounds];
  CGRectGetMidY(v35);
  uint64_t v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v13 scale];
  UIRectCenteredAboutPointScale();
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v36.origin.x = v15;
  v36.origin.y = v17;
  v36.size.width = v19;
  v36.size.height = v21;
  CGRectOffset(v36, v10, 0.0);
  uint64_t v22 = [(_PKColorAlphaSliderIOS *)self traitCollection];
  [v22 displayScale];
  UIRectIntegralWithScale();
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  double v31 = v24;
  double v32 = v26;
  double v33 = v28;
  double v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

+ (double)_outputForResistanceFunction:(double)a3 factor:(double)a4
{
  if (a3 == 0.0) {
    return 0.0;
  }
  double v4 = fabs(a3);
  return a3 / v4 * (a4 * a4 * -0.5 + a4 * sqrt(v4 + a4 * a4 * 0.25));
}

+ (id)rgbaColorFromColorIfPossible:(id)a3
{
  v8[3] = *(double *)MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 getRed:0 green:0 blue:0 alpha:0])
  {
    id v4 = v3;
LABEL_5:
    double v5 = v4;
    goto LABEL_7;
  }
  if ([v3 getWhite:&v7 alpha:v8])
  {
    id v4 = [MEMORY[0x1E4FB1618] colorWithRed:v7 green:v7 blue:v7 alpha:v8[0]];
    goto LABEL_5;
  }
  double v5 = 0;
LABEL_7:

  return v5;
}

+ (void)_layoutGradientMaskLayer:(id)a3 frame:(CGRect)a4 isReversed:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v19[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  double v11 = v10;
  if (v5) {
    double v12 = 1.0;
  }
  else {
    double v12 = 0.0;
  }
  if (v5) {
    double v13 = 0.0;
  }
  else {
    double v13 = 1.0;
  }
  objc_msgSend(v10, "setStartPoint:", v12, 0.5);
  objc_msgSend(v11, "setEndPoint:", v13, 0.5);
  double v14 = [MEMORY[0x1E4FB1618] whiteColor];
  id v15 = [v14 colorWithAlphaComponent:0.0];
  v19[0] = [v15 CGColor];
  double v16 = [MEMORY[0x1E4FB1618] whiteColor];
  id v17 = [v16 colorWithAlphaComponent:1.0];
  v19[1] = [v17 CGColor];
  double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  [v11 setColors:v18];

  objc_msgSend(v11, "setFrame:", x, y, width, height);
}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  if (self->_colorUserInterfaceStyle != a3)
  {
    self->_colorUserInterfaceStyle = a3;
    [(_PKColorAlphaSliderIOS *)self setNeedsLayout];
  }
}

- (int64_t)_uiColorUserInterfaceStyle
{
  if ([(_PKColorAlphaSliderIOS *)self colorUserInterfaceStyle])
  {
    return [(_PKColorAlphaSliderIOS *)self colorUserInterfaceStyle];
  }
  else
  {
    id v4 = [(_PKColorAlphaSliderIOS *)self traitCollection];
    int64_t v5 = [v4 userInterfaceStyle];

    return v5;
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

- (_PKSliderKnobView)sliderKnobView
{
  return self->_sliderKnobView;
}

- (void)setSliderKnobView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliderKnobView, 0);
  objc_storeStrong((id *)&self->_alphaGridViewMaskLayer, 0);
  objc_storeStrong((id *)&self->_alphaGridView, 0);
  objc_storeStrong((id *)&self->_colorViewMaskLayer, 0);
  objc_storeStrong((id *)&self->_colorView, 0);
  objc_destroyWeak((id *)&self->delegate);

  objc_storeStrong((id *)&self->_color, 0);
}

@end