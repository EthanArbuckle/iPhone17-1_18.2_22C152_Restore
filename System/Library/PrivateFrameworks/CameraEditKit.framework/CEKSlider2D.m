@interface CEKSlider2D
+ (id)backgroundImageWithImage:(id)a3;
- (BOOL)_active;
- (BOOL)_shouldPerformFeedback;
- (BOOL)_wantsGradientLayers;
- (BOOL)isPulsingValueIndicator;
- (BOOL)snapTouchesToDefaultValue;
- (CEKSelectionFeedbackGenerator)_selectionFeedbackGenerator;
- (CEKSlider2D)initWithFrame:(CGRect)a3;
- (CGPoint)_normalizedViewValueForValue:(CGPoint)a3;
- (CGPoint)_valueForNormalizedViewValue:(CGPoint)a3;
- (CGPoint)defaultValue;
- (CGPoint)value;
- (UIImage)backgroundImage;
- (UIImageView)_backgroundImageView;
- (UIImageView)_gridView;
- (UILongPressGestureRecognizer)_pressGestureRecognizer;
- (UIView)_backgroundSnapshotContainerView;
- (UIView)_backgroundSnapshotView1;
- (UIView)_backgroundSnapshotView2;
- (UIView)_defaultValueIndicator;
- (UIView)_gradientsView;
- (UIView)_valueIndicator;
- (double)cornerRadius;
- (id)_blurFilter;
- (id)_createGridImageWithSize:(CGSize)a3;
- (void)_createGradientsViewIfNecessary;
- (void)_destroyGradientsViewIfNecessary;
- (void)_handlePressGesture:(id)a3;
- (void)_performFeedback;
- (void)_prepareFeedback;
- (void)_setActive:(BOOL)a3 animated:(BOOL)a4;
- (void)_setValue:(CGPoint)a3 shouldNotify:(BOOL)a4 animated:(BOOL)a5;
- (void)_startScalingWithScale:(double)a3 duration:(double)a4 repeatCount:(float)a5 timingFunction:(id)a6;
- (void)_stopScalingWithDuration:(double)a3;
- (void)_updateGradientViews;
- (void)layoutSubviews;
- (void)setBackgroundAsSnapshotOfView:(id)a3;
- (void)setBackgroundFromExistingSlider2D:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDefaultValue:(CGPoint)a3;
- (void)setPulsingValueIndicator:(BOOL)a3;
- (void)setSnapTouchesToDefaultValue:(BOOL)a3;
- (void)setValue:(CGPoint)a3;
- (void)setValue:(CGPoint)a3 animated:(BOOL)a4;
- (void)set_active:(BOOL)a3;
@end

@implementation CEKSlider2D

- (CEKSlider2D)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CEKSlider2D;
  v3 = -[CEKSlider2D initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:0];
    gridView = v3->__gridView;
    v3->__gridView = (UIImageView *)v4;

    [(CEKSlider2D *)v3 addSubview:v3->__gridView];
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    defaultValueIndicator = v3->__defaultValueIndicator;
    v3->__defaultValueIndicator = v6;

    v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.8 alpha:1.0];
    [(UIView *)v3->__defaultValueIndicator setBackgroundColor:v8];

    [(CEKSlider2D *)v3 addSubview:v3->__defaultValueIndicator];
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    valueIndicator = v3->__valueIndicator;
    v3->__valueIndicator = v9;

    v11 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIView *)v3->__valueIndicator setBackgroundColor:v11];

    [(CEKSlider2D *)v3 addSubview:v3->__valueIndicator];
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v3 action:sel__handlePressGesture_];
    pressGestureRecognizer = v3->__pressGestureRecognizer;
    v3->__pressGestureRecognizer = (UILongPressGestureRecognizer *)v12;

    [(UILongPressGestureRecognizer *)v3->__pressGestureRecognizer setMinimumPressDuration:0.0];
    [(CEKSlider2D *)v3 addGestureRecognizer:v3->__pressGestureRecognizer];
    v3->_cornerRadius = 22.0;
    v14 = [(CEKSlider2D *)v3 layer];
    [v14 setCornerRadius:22.0];

    v15 = [(CEKSlider2D *)v3 layer];
    [v15 setMasksToBounds:1];

    v3->_snapTouchesToDefaultValue = 1;
    if (CEKHapticsAllowed())
    {
      v16 = objc_alloc_init(CEKSelectionFeedbackGenerator);
      selectionFeedbackGenerator = v3->__selectionFeedbackGenerator;
      v3->__selectionFeedbackGenerator = v16;
    }
    v18 = v3;
  }

  return v3;
}

- (void)setValue:(CGPoint)a3
{
}

- (void)setValue:(CGPoint)a3 animated:(BOOL)a4
{
}

- (void)setBackgroundImage:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_backgroundImage != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_backgroundImage, a3);
    if (!self->__backgroundImageView)
    {
      v6 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:0];
      backgroundImageView = self->__backgroundImageView;
      self->__backgroundImageView = v6;

      [(CEKSlider2D *)self insertSubview:self->__backgroundImageView atIndex:0];
    }
    v8 = [(CEKSlider2D *)self _backgroundImageView];
    [v8 setImage:v9];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setBackgroundAsSnapshotOfView:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(UIView *)self->__backgroundSnapshotView1 removeFromSuperview];
  [(UIView *)self->__backgroundSnapshotView2 removeFromSuperview];
  backgroundSnapshotView1 = self->__backgroundSnapshotView1;
  self->__backgroundSnapshotView1 = 0;

  backgroundSnapshotView2 = self->__backgroundSnapshotView2;
  self->__backgroundSnapshotView2 = 0;

  if (v4)
  {
    if (!self->__backgroundSnapshotContainerView)
    {
      id v7 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      v8 = (UIView *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      backgroundSnapshotContainerView = self->__backgroundSnapshotContainerView;
      self->__backgroundSnapshotContainerView = v8;

      v10 = [(CEKSlider2D *)self _blurFilter];
      v19[0] = v10;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      uint64_t v12 = [(UIView *)self->__backgroundSnapshotContainerView layer];
      [v12 setFilters:v11];

      [(CEKSlider2D *)self insertSubview:self->__backgroundSnapshotContainerView atIndex:0];
    }
    v13 = [v4 snapshotViewAfterScreenUpdates:0];
    v14 = self->__backgroundSnapshotView1;
    self->__backgroundSnapshotView1 = v13;

    v15 = [v4 snapshotViewAfterScreenUpdates:0];
    v16 = self->__backgroundSnapshotView2;
    self->__backgroundSnapshotView2 = v15;

    uint64_t v17 = *MEMORY[0x1E4F3A2F8];
    v18 = [(UIView *)self->__backgroundSnapshotView2 layer];
    [v18 setCompositingFilter:v17];

    [(UIView *)self->__backgroundSnapshotContainerView addSubview:self->__backgroundSnapshotView1];
    [(UIView *)self->__backgroundSnapshotContainerView addSubview:self->__backgroundSnapshotView2];
    [(CEKSlider2D *)self setNeedsLayout];
  }
  [(CEKSlider2D *)self _updateGradientViews];
}

- (void)setBackgroundFromExistingSlider2D:(id)a3
{
  backgroundSnapshotContainerView = self->__backgroundSnapshotContainerView;
  id v5 = a3;
  [(UIView *)backgroundSnapshotContainerView removeFromSuperview];
  v6 = [v5 _backgroundSnapshotContainerView];

  id v7 = [v6 snapshotViewAfterScreenUpdates:0];
  v8 = self->__backgroundSnapshotContainerView;
  self->__backgroundSnapshotContainerView = v7;

  [(CEKSlider2D *)self insertSubview:self->__backgroundSnapshotContainerView atIndex:0];
  [(CEKSlider2D *)self _updateGradientViews];
  [(CEKSlider2D *)self setNeedsLayout];
}

- (id)_blurFilter
{
  v2 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  [v2 setValue:&unk_1F1A0F788 forKey:@"inputRadius"];
  [v2 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputNormalizeEdges"];
  [v2 setValue:@"low" forKey:@"inputQuality"];
  [v2 setValue:@"low" forKey:@"inputIntermediateBitDepth"];
  return v2;
}

- (void)_updateGradientViews
{
  if ([(CEKSlider2D *)self _wantsGradientLayers])
  {
    [(CEKSlider2D *)self _createGradientsViewIfNecessary];
  }
  else
  {
    [(CEKSlider2D *)self _destroyGradientsViewIfNecessary];
  }
}

- (BOOL)_wantsGradientLayers
{
  return self->__backgroundSnapshotContainerView != 0;
}

- (void)_createGradientsViewIfNecessary
{
  v30[2] = *MEMORY[0x1E4F143B8];
  if (!self->__gradientsView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    id v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v5 = objc_alloc_init(MEMORY[0x1E4F39BD0]);
    id v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.87 green:0.87 blue:0.87 alpha:1.0];
    v30[0] = [v6 CGColor];
    id v7 = [MEMORY[0x1E4FB1618] whiteColor];
    id v8 = [v7 colorWithAlphaComponent:0.05];
    v30[1] = [v8 CGColor];
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    [v5 setColors:v9];

    objc_msgSend(v5, "setStartPoint:", 0.13, 0.76);
    objc_msgSend(v5, "setEndPoint:", 0.88, 0.11);
    v10 = [(UIView *)v4 layer];
    [v10 insertSublayer:v5 atIndex:0];

    id v11 = objc_alloc_init(MEMORY[0x1E4F39BD0]);
    id v12 = [MEMORY[0x1E4FB1618] colorWithRed:0.87 green:0.87 blue:0.87 alpha:1.0];
    v29[0] = [v12 CGColor];
    v13 = [MEMORY[0x1E4FB1618] whiteColor];
    id v14 = [v13 colorWithAlphaComponent:0.0];
    v29[1] = [v14 CGColor];
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    [v11 setColors:v15];

    LODWORD(v16) = 1058642330;
    [v11 setOpacity:v16];
    objc_msgSend(v11, "setStartPoint:", 0.0, 0.0);
    objc_msgSend(v11, "setEndPoint:", 0.45, 0.33);
    uint64_t v17 = [(UIView *)v4 layer];
    [v17 insertSublayer:v11 atIndex:1];

    id v18 = objc_alloc_init(MEMORY[0x1E4F39BD0]);
    id v19 = [MEMORY[0x1E4FB1618] colorWithRed:0.07 green:0.07 blue:0.11 alpha:1.0];
    v28[0] = [v19 CGColor];
    id v20 = [MEMORY[0x1E4FB1618] colorWithRed:0.35 green:0.35 blue:0.35 alpha:0.01];
    v28[1] = [v20 CGColor];
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    [v18 setColors:v21];

    LODWORD(v22) = *(_DWORD *)"333?";
    [v18 setOpacity:v22];
    objc_msgSend(v18, "setStartPoint:", 0.5, 1.0);
    objc_msgSend(v18, "setEndPoint:", 0.5, -0.1);
    [v18 setCompositingFilter:*MEMORY[0x1E4F3A270]];
    v23 = [(UIView *)v4 layer];
    [v23 insertSublayer:v18 atIndex:2];

    gradientsView = self->__gradientsView;
    self->__gradientsView = v4;
    v25 = v4;

    v26 = self->__gradientsView;
    v27 = [(CEKSlider2D *)self _gridView];
    [(CEKSlider2D *)self insertSubview:v26 belowSubview:v27];
  }
}

- (void)_destroyGradientsViewIfNecessary
{
  [(UIView *)self->__gradientsView removeFromSuperview];
  gradientsView = self->__gradientsView;
  self->__gradientsView = 0;
}

- (void)_setValue:(CGPoint)a3 shouldNotify:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  double y = a3.y;
  double v9 = CEKClamp(a3.x, -1.0, 1.0);
  double v10 = CEKClamp(y, -1.0, 1.0);
  if (self->_value.x != v9 || self->_value.y != v10)
  {
    self->_value.x = v9;
    self->_value.double y = v10;
    [(CEKSlider2D *)self setNeedsLayout];
    if (v5)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __47__CEKSlider2D__setValue_shouldNotify_animated___block_invoke;
      v12[3] = &unk_1E63CD380;
      v12[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:131074 delay:v12 options:0 animations:0.25 completion:0.0];
    }
    if (v6) {
      [(CEKSlider2D *)self sendActionsForControlEvents:4096];
    }
  }
}

uint64_t __47__CEKSlider2D__setValue_shouldNotify_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setDefaultValue:(CGPoint)a3
{
  double y = a3.y;
  double v5 = CEKClamp(a3.x, -1.0, 1.0);
  double v6 = CEKClamp(y, -1.0, 1.0);
  if (self->_defaultValue.x != v5 || self->_defaultValue.y != v6)
  {
    self->_defaultValue.x = v5;
    self->_defaultValue.double y = v6;
    [(CEKSlider2D *)self setNeedsLayout];
  }
}

- (void)_setActive:(BOOL)a3 animated:(BOOL)a4
{
  if (self->__active != a3)
  {
    BOOL v4 = a4;
    self->__active = a3;
    double v6 = [(CEKSlider2D *)self _valueIndicator];
    if (self->__active)
    {
      id v7 = [MEMORY[0x1E4FB1618] whiteColor];
      uint64_t v8 = [v7 CGColor];
      double v9 = [v6 layer];
      [v9 setShadowColor:v8];

      double v10 = [v6 layer];
      [v10 setShadowRadius:6.0];
    }
    id v11 = [v6 layer];
    objc_msgSend(v11, "setShadowOffset:", 0.0, 0.0);

    if (v4)
    {
      id v12 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"shadowOpacity"];
      [v12 setDuration:0.2];
      if (self->__active) {
        v13 = &unk_1F1A0F798;
      }
      else {
        v13 = &unk_1F1A0F7A8;
      }
      [v12 setFromValue:v13];
      if (self->__active) {
        id v14 = &unk_1F1A0F7A8;
      }
      else {
        id v14 = &unk_1F1A0F798;
      }
      [v12 setToValue:v14];
      [v12 setRemovedOnCompletion:1];
      v15 = [v6 layer];
      [v15 addAnimation:v12 forKey:@"shadowOpacity"];

      if (self->__active) {
        float v16 = 1.0;
      }
      else {
        float v16 = 0.0;
      }
      uint64_t v17 = [v6 layer];
      *(float *)&double v18 = v16;
      [v17 setShadowOpacity:v18];

      [(CEKSlider2D *)self setNeedsLayout];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __35__CEKSlider2D__setActive_animated___block_invoke;
      v22[3] = &unk_1E63CD380;
      v22[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v22 options:0 animations:0.2 completion:0.0];
    }
    else
    {
      if (self->__active) {
        float v19 = 1.0;
      }
      else {
        float v19 = 0.0;
      }
      id v20 = [v6 layer];
      *(float *)&double v21 = v19;
      [v20 setShadowOpacity:v21];

      [(CEKSlider2D *)self setNeedsLayout];
    }
  }
}

uint64_t __35__CEKSlider2D__setActive_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    id v4 = [(CEKSlider2D *)self layer];
    [v4 setCornerRadius:a3];
  }
}

- (void)layoutSubviews
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v51.receiver = self;
  v51.super_class = (Class)CEKSlider2D;
  [(CEKSlider2D *)&v51 layoutSubviews];
  [(CEKSlider2D *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(CEKSlider2D *)self _backgroundImageView];

  if (v11)
  {
    id v12 = [(CEKSlider2D *)self _backgroundImageView];
    objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);
  }
  v13 = [(CEKSlider2D *)self _backgroundSnapshotContainerView];
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);

  id v14 = [(CEKSlider2D *)self _backgroundSnapshotView1];
  objc_msgSend(v14, "setFrame:", v4, v6, v8, v10);

  v15 = [(CEKSlider2D *)self _backgroundSnapshotView2];
  objc_msgSend(v15, "setFrame:", v4, v6, v8, v10);

  float v16 = [(CEKSlider2D *)self _gradientsView];
  objc_msgSend(v16, "setFrame:", v4, v6, v8, v10);

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v17 = [(CEKSlider2D *)self _gradientsView];
  double v18 = [v17 layer];
  float v19 = [v18 sublayers];

  uint64_t v20 = [v19 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v48;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v48 != v22) {
          objc_enumerationMutation(v19);
        }
        objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * v23++), "setFrame:", v4, v6, v8, v10);
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v21);
  }

  v24 = [(CEKSlider2D *)self _gridView];
  objc_msgSend(v24, "setFrame:", v4, v6, v8, v10);

  v25 = [(CEKSlider2D *)self _gridView];
  v26 = [v25 image];

  [v26 size];
  if (v28 != v8 || v27 != v10)
  {
    v29 = -[CEKSlider2D _createGridImageWithSize:](self, "_createGridImageWithSize:", v8, v10);
    v30 = [(CEKSlider2D *)self _gridView];
    [v30 setImage:v29];
  }
  v31 = [(CEKSlider2D *)self _valueIndicator];
  v32 = [(CEKSlider2D *)self _defaultValueIndicator];
  [(CEKSlider2D *)self value];
  -[CEKSlider2D _normalizedViewValueForValue:](self, "_normalizedViewValueForValue:");
  double v34 = v33;
  double v36 = v35;
  [(CEKSlider2D *)self defaultValue];
  -[CEKSlider2D _normalizedViewValueForValue:](self, "_normalizedViewValueForValue:");
  double v38 = v37;
  double v40 = v39;
  CEKExpandNormalizedPoint(v34, v36, v4, v6, v8, v10);
  CEKExpandNormalizedPoint(v38, v40, v4, v6, v8, v10);
  double v41 = v8 * 0.085;
  if (self->__active) {
    double v42 = 30.0;
  }
  else {
    double v42 = v8 * 0.085;
  }
  [v31 setBounds:CEKRectWithSize()];
  v43 = [v31 layer];
  [v43 setCornerRadius:v42 * 0.5];

  v44 = [v32 layer];
  [v44 setCornerRadius:v41 * 0.5 * 0.5];

  [v32 setBounds:CEKRectWithSize()];
  [v31 bounds];
  v45 = [(CEKSlider2D *)self traitCollection];
  [v45 displayScale];
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v31, "setCenter:");

  [v32 bounds];
  v46 = [(CEKSlider2D *)self traitCollection];
  [v46 displayScale];
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v32, "setCenter:");
}

- (CGPoint)_normalizedViewValueForValue:(CGPoint)a3
{
  double y = a3.y;
  double v4 = CEKProgress(a3.x, -1.0, 1.0);
  double v5 = 1.0 - CEKProgress(y, -1.0, 1.0);
  double v6 = v4 * 0.833333333 + 0.0833333333;
  double v7 = v5 * 0.833333333 + 0.0833333333;
  result.double y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)_valueForNormalizedViewValue:(CGPoint)a3
{
  double v3 = 1.0 - (a3.y + -0.0833333333) / 0.833333333;
  double v4 = CEKInterpolate(-1.0, 1.0, (a3.x + -0.0833333333) / 0.833333333);
  double v5 = CEKInterpolate(-1.0, 1.0, v3);
  double v6 = v4;
  result.double y = v5;
  result.x = v6;
  return result;
}

- (void)_handlePressGesture:(id)a3
{
  id v30 = a3;
  uint64_t v4 = [v30 state];
  if ((unint64_t)(v4 - 3) < 3)
  {
    [(CEKSlider2D *)self _setActive:0 animated:1];
    goto LABEL_13;
  }
  if (v4 != 2)
  {
    if (v4 != 1) {
      goto LABEL_13;
    }
    [(CEKSlider2D *)self _setActive:1 animated:1];
    [(CEKSlider2D *)self _prepareFeedback];
  }
  [v30 locationInView:self];
  double v6 = v5;
  double v8 = v7;
  [(CEKSlider2D *)self bounds];
  [(CEKSlider2D *)self _valueForNormalizedViewValue:CEKNormalizePoint(v6, v8, v9, v10, v11, v12)];
  double v14 = v13;
  double v16 = v15;
  if ([(CEKSlider2D *)self snapTouchesToDefaultValue])
  {
    [(CEKSlider2D *)self defaultValue];
    -[CEKSlider2D _normalizedViewValueForValue:](self, "_normalizedViewValueForValue:");
    double v18 = v17;
    double v20 = v19;
    [(CEKSlider2D *)self bounds];
    CEKExpandNormalizedPoint(v18, v20, v21, v22, v23, v24);
    UIDistanceBetweenPoints();
    if (v25 < 10.0)
    {
      [(CEKSlider2D *)self defaultValue];
      double v14 = v26;
      double v16 = v27;
    }
  }
  [(CEKSlider2D *)self value];
  if (v14 * v28 < 0.0 || ([(CEKSlider2D *)self value], v16 * v29 < 0.0))
  {
    [(CEKSlider2D *)self _performFeedback];
    [(CEKSlider2D *)self _prepareFeedback];
  }
  -[CEKSlider2D _setValue:shouldNotify:animated:](self, "_setValue:shouldNotify:animated:", 1, 0, v14, v16);
LABEL_13:
}

- (id)_createGridImageWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (a3.width == *MEMORY[0x1E4F1DB30] && a3.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    CGFloat v12 = 0;
  }
  else
  {
    double v6 = [MEMORY[0x1E4FB17E0] preferredFormat];
    double v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v6, width, height);
    double v8 = CEKRectWithSize();
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __40__CEKSlider2D__createGridImageWithSize___block_invoke;
    v14[3] = &__block_descriptor_80_e40_v16__0__UIGraphicsImageRendererContext_8l;
    *(double *)&v14[4] = v8;
    v14[5] = v9;
    v14[6] = v10;
    v14[7] = v11;
    *(double *)&v14[8] = width;
    *(double *)&v14[9] = height;
    CGFloat v12 = [v7 imageWithActions:v14];
  }
  return v12;
}

void __40__CEKSlider2D__createGridImageWithSize___block_invoke(double *a1, void *a2)
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = a1[6] / 12.0;
  if (a1[8] >= 100.0) {
    double v5 = 4.0;
  }
  else {
    double v5 = 2.0;
  }
  double v6 = v5 * -0.5;
  unint64_t v7 = 1;
  double v8 = a1[7] / 12.0;
  do
  {
    for (unint64_t i = 1; i != 12; ++i)
    {
      if (i == 6 || v7 == 6) {
        double v11 = 1.0;
      }
      else {
        double v11 = 0.3;
      }
      CGFloat v12 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:v11];
      [v12 setFill];

      double v13 = (CGContext *)[v3 CGContext];
      v39.origin.x = v6 + (double)v7 * v4;
      v39.origin.double y = v6 + (double)i * v8;
      v39.size.double width = v5;
      v39.size.double height = v5;
      CGContextFillEllipseInRect(v13, v39);
    }
    ++v7;
  }
  while (v7 != 12);
  double v14 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBF8]);
  double v15 = [MEMORY[0x1E4FB1618] grayColor];
  double v16 = [v15 colorWithAlphaComponent:0.4];

  double v17 = [MEMORY[0x1E4FB1618] clearColor];
  id v18 = v16;
  v34[0] = [v18 CGColor];
  id v19 = v17;
  v34[1] = [v19 CGColor];
  CFArrayRef v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  *(_OWORD *)locations = xmmword_1BEE74700;
  CGFloat v21 = CGGradientCreateWithColors(v14, v20, locations);
  CGFloat v22 = (CGContext *)[v3 CGContext];
  v37.x = a1[8];
  v35.x = 0.0;
  v35.double y = 0.0;
  v37.double y = 0.0;
  CGContextDrawLinearGradient(v22, v21, v35, v37, 0);
  CGGradientRelease(v21);
  CGFloat v23 = [MEMORY[0x1E4FB1618] blackColor];
  CGFloat v24 = [v23 colorWithAlphaComponent:0.6];

  double v25 = [MEMORY[0x1E4FB1618] clearColor];
  id v26 = v24;
  v32[0] = [v26 CGColor];
  id v27 = v25;
  v32[1] = [v27 CGColor];
  CFArrayRef v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  long long v31 = xmmword_1BEE74710;
  double v29 = CGGradientCreateWithColors(v14, v28, (const CGFloat *)&v31);
  id v30 = (CGContext *)[v3 CGContext];
  v38.double y = a1[9];
  v36.x = 0.0;
  v36.double y = 0.0;
  v38.x = 0.0;
  CGContextDrawLinearGradient(v30, v29, v36, v38, 0);
  CGGradientRelease(v29);
  CGColorSpaceRelease(v14);
}

+ (id)backgroundImageWithImage:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1E018];
  id v4 = a3;
  double v5 = [v3 contextWithOptions:0];
  double v6 = (void *)[objc_alloc(MEMORY[0x1E4F1E050]) initWithImage:v4];

  unint64_t v7 = [MEMORY[0x1E4F1E040] filterWithName:@"CIColorControls"];
  [v7 setValue:v6 forKey:@"inputImage"];
  [v7 setValue:&unk_1F1A0F7B8 forKey:@"inputSaturation"];
  double v8 = [v7 valueForKey:@"outputImage"];
  uint64_t v9 = [MEMORY[0x1E4F1E040] filterWithName:@"CIGaussianBlur"];
  [v9 setValue:v8 forKey:@"inputImage"];
  [v9 setValue:&unk_1F1A0F988 forKey:@"inputRadius"];
  uint64_t v10 = [v9 valueForKey:@"outputImage"];

  [v6 extent];
  double v11 = (CGImage *)objc_msgSend(v5, "createCGImage:fromRect:", v10);
  CGFloat v12 = [MEMORY[0x1E4FB1818] imageWithCGImage:v11];
  CGImageRelease(v11);

  return v12;
}

- (void)setPulsingValueIndicator:(BOOL)a3
{
  if (self->_pulsingValueIndicator != a3)
  {
    self->_pulsingValueIndicator = a3;
    if (a3)
    {
      LODWORD(v3) = 2139095040;
      [(CEKSlider2D *)self _startScalingWithScale:0 duration:2.0 repeatCount:0.75 timingFunction:v3];
    }
    else
    {
      [(CEKSlider2D *)self _stopScalingWithDuration:0.25];
    }
  }
}

- (void)_startScalingWithScale:(double)a3 duration:(double)a4 repeatCount:(float)a5 timingFunction:(id)a6
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  if (!v10)
  {
    id v10 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
  }
  double v11 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.scale"];
  [v11 setTimingFunction:v10];
  [v11 setDuration:a4];
  v22[0] = &unk_1F1A0F9A0;
  CGFloat v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  v22[1] = v12;
  double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  [v11 setValues:v13];

  *(float *)&double v14 = a5;
  [v11 setRepeatCount:v14];
  [v11 setAutoreverses:1];
  double v15 = [(CEKSlider2D *)self _valueIndicator];
  double v16 = [v15 layer];

  [v16 addAnimation:v11 forKey:@"pulsingTransform"];
  long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v21[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v21[5] = v17;
  long long v18 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v21[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v21[7] = v18;
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v21[0] = *MEMORY[0x1E4F39B10];
  v21[1] = v19;
  long long v20 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v21[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v21[3] = v20;
  [v16 setTransform:v21];
}

- (void)_stopScalingWithDuration:(double)a3
{
  id v4 = [(CEKSlider2D *)self _valueIndicator];
  double v5 = [v4 layer];

  double v6 = (long long *)MEMORY[0x1E4F39B10];
  if (a3 > 0.0)
  {
    uint64_t v7 = [v5 presentationLayer];
    double v8 = (void *)v7;
    if (v7) {
      uint64_t v9 = (void *)v7;
    }
    else {
      uint64_t v9 = v5;
    }
    id v10 = v9;

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    if (v10) {
      [v10 transform];
    }
    double v11 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
    [v11 setDuration:a3];
    CGFloat v12 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
    [v11 setTimingFunction:v12];

    long long v28 = v36;
    long long v29 = v37;
    long long v30 = v38;
    long long v31 = v39;
    long long v24 = v32;
    long long v25 = v33;
    long long v26 = v34;
    long long v27 = v35;
    double v13 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v24];
    [v11 setFromValue:v13];

    long long v14 = v6[5];
    long long v28 = v6[4];
    long long v29 = v14;
    long long v15 = v6[7];
    long long v30 = v6[6];
    long long v31 = v15;
    long long v16 = v6[1];
    long long v24 = *v6;
    long long v25 = v16;
    long long v17 = v6[3];
    long long v26 = v6[2];
    long long v27 = v17;
    long long v18 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v24];
    [v11 setToValue:v18];

    [v5 addAnimation:v11 forKey:@"stopScalingAnimation"];
  }
  [v5 removeAnimationForKey:@"pulsingTransform"];
  long long v19 = v6[5];
  v23[4] = v6[4];
  v23[5] = v19;
  long long v20 = v6[7];
  v23[6] = v6[6];
  v23[7] = v20;
  long long v21 = v6[1];
  v23[0] = *v6;
  v23[1] = v21;
  long long v22 = v6[3];
  v23[2] = v6[2];
  v23[3] = v22;
  [v5 setTransform:v23];
}

- (BOOL)_shouldPerformFeedback
{
  return 1;
}

- (void)_prepareFeedback
{
  if ([(CEKSlider2D *)self _shouldPerformFeedback])
  {
    selectionFeedbackGenerator = self->__selectionFeedbackGenerator;
    [(CEKSelectionFeedbackGenerator *)selectionFeedbackGenerator prepareFeedback];
  }
}

- (void)_performFeedback
{
  if ([(CEKSlider2D *)self _shouldPerformFeedback])
  {
    selectionFeedbackGenerator = self->__selectionFeedbackGenerator;
    [(CEKSelectionFeedbackGenerator *)selectionFeedbackGenerator performFeedback];
  }
}

- (CGPoint)value
{
  double x = self->_value.x;
  double y = self->_value.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)defaultValue
{
  double x = self->_defaultValue.x;
  double y = self->_defaultValue.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)snapTouchesToDefaultValue
{
  return self->_snapTouchesToDefaultValue;
}

- (void)setSnapTouchesToDefaultValue:(BOOL)a3
{
  self->_snapTouchesToDefaultValue = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (BOOL)isPulsingValueIndicator
{
  return self->_pulsingValueIndicator;
}

- (UIView)_backgroundSnapshotView1
{
  return self->__backgroundSnapshotView1;
}

- (UIView)_backgroundSnapshotView2
{
  return self->__backgroundSnapshotView2;
}

- (UIView)_backgroundSnapshotContainerView
{
  return self->__backgroundSnapshotContainerView;
}

- (UIImageView)_backgroundImageView
{
  return self->__backgroundImageView;
}

- (UIView)_gradientsView
{
  return self->__gradientsView;
}

- (UIImageView)_gridView
{
  return self->__gridView;
}

- (UIView)_valueIndicator
{
  return self->__valueIndicator;
}

- (UIView)_defaultValueIndicator
{
  return self->__defaultValueIndicator;
}

- (BOOL)_active
{
  return self->__active;
}

- (void)set_active:(BOOL)a3
{
  self->__active = a3;
}

- (UILongPressGestureRecognizer)_pressGestureRecognizer
{
  return self->__pressGestureRecognizer;
}

- (CEKSelectionFeedbackGenerator)_selectionFeedbackGenerator
{
  return self->__selectionFeedbackGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->__pressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__defaultValueIndicator, 0);
  objc_storeStrong((id *)&self->__valueIndicator, 0);
  objc_storeStrong((id *)&self->__gridView, 0);
  objc_storeStrong((id *)&self->__gradientsView, 0);
  objc_storeStrong((id *)&self->__backgroundImageView, 0);
  objc_storeStrong((id *)&self->__backgroundSnapshotContainerView, 0);
  objc_storeStrong((id *)&self->__backgroundSnapshotView2, 0);
  objc_storeStrong((id *)&self->__backgroundSnapshotView1, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
}

@end