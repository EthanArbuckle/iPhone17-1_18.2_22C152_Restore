@interface CEKExpandingSlider
- (BOOL)expanded;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CEKAdditiveAnimator)_animator;
- (CEKExpandingSlider)initWithTitle:(id)a3;
- (CEKExpandingSlider)initWithTitle:(id)a3 minimumValue:(double)a4 maximumValue:(double)a5 defaultValue:(double)a6;
- (CEKExpandingSliderDelegate)delegate;
- (CEKExpandingTickMarksView)_ticksView;
- (CEKSlider)_slider;
- (CGSize)intrinsicContentSize;
- (NSString)title;
- (NSTimer)_expansionAnimationTimer;
- (NSTimer)_markedValueAnimationTimer;
- (UILabel)_titleLabel;
- (UILabel)_valueLabel;
- (UILongPressGestureRecognizer)_gestureRecognizer;
- (UIView)_levelIndicatorView;
- (double)collapsedCenterX;
- (double)markedValue;
- (double)value;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)_expansionAnimationCounter;
- (void)_handleExpansionAnimationTimerFired:(id)a3;
- (void)_handleMarkedValueAnimationTimerFired:(id)a3;
- (void)_handlePress:(id)a3;
- (void)_handleSliderDidChangeValue:(id)a3;
- (void)_setExpanded:(BOOL)a3 animated:(BOOL)a4 shouldNotify:(BOOL)a5;
- (void)_setExpansionAnimationCounter:(unint64_t)a3;
- (void)_setExpansionAnimationTimer:(id)a3;
- (void)_setMarkedValueAnimationTimer:(id)a3;
- (void)_updateColors;
- (void)_updateLabelColorsForProgress:(double)a3;
- (void)_updateMarkedValueAnimated:(BOOL)a3;
- (void)_updateSubviewVisibility;
- (void)_updateTickViewFrameForProgress:(double)a3;
- (void)_updateUIForValue:(double)a3 animated:(BOOL)a4;
- (void)animator:(id)a3 didUpdateValuesForKeys:(id)a4;
- (void)layoutSubviews;
- (void)setCollapsedCenterX:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setMarkedValue:(double)a3;
- (void)setTitle:(id)a3;
- (void)setValue:(double)a3;
- (void)setValue:(double)a3 animated:(BOOL)a4;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CEKExpandingSlider

- (CEKExpandingSlider)initWithTitle:(id)a3
{
  return [(CEKExpandingSlider *)self initWithTitle:a3 minimumValue:-1.0 maximumValue:1.0 defaultValue:0.0];
}

- (CEKExpandingSlider)initWithTitle:(id)a3 minimumValue:(double)a4 maximumValue:(double)a5 defaultValue:(double)a6
{
  id v10 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CEKExpandingSlider;
  double v11 = *MEMORY[0x1E4F1DB28];
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v15 = -[CEKExpandingSlider initWithFrame:](&v38, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v12, v13, v14);
  if (v15)
  {
    v16 = [MEMORY[0x1E4FB1618] systemYellowColor];
    [(CEKExpandingSlider *)v15 setTintColor:v16];

    v17 = [[CEKSlider alloc] initWithTitle:v10];
    slider = v15->__slider;
    v15->__slider = v17;

    [(CEKSlider *)v15->__slider setSliderVerticalAlignment:2];
    [(CEKSlider *)v15->__slider setValueLabelVisibility:2];
    [(CEKSlider *)v15->__slider setTitleAlignment:2];
    [(CEKSlider *)v15->__slider setFontStyle:1];
    v19 = [(CEKSlider *)v15->__slider tickMarksConfiguration];
    [v19 setMainTickMarkInterval:5];

    v20 = [(CEKSlider *)v15->__slider tickMarksConfiguration];
    [v20 setTickMarkSpacing:7.0];

    [(CEKSlider *)v15->__slider setInteractiveWhenHidden:1];
    [(CEKSlider *)v15->__slider setMinimumValue:a4];
    [(CEKSlider *)v15->__slider setDefaultValue:a6];
    [(CEKSlider *)v15->__slider setMaximumValue:a5];
    [(CEKSlider *)v15->__slider addTarget:v15 action:sel__handleSliderDidChangeValue_ forControlEvents:4096];
    [(CEKExpandingSlider *)v15 addSubview:v15->__slider];
    v21 = objc_alloc_init(CEKExpandingTickMarksView);
    ticksView = v15->__ticksView;
    v15->__ticksView = v21;

    [(CEKExpandingTickMarksView *)v15->__ticksView setUserInteractionEnabled:0];
    [(CEKExpandingSlider *)v15 addSubview:v15->__ticksView];
    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v11, v12, v13, v14);
    titleLabel = v15->__titleLabel;
    v15->__titleLabel = (UILabel *)v23;

    [(UILabel *)v15->__titleLabel setUserInteractionEnabled:0];
    [(UILabel *)v15->__titleLabel setTextAlignment:1];
    [(UILabel *)v15->__titleLabel setLineBreakMode:0];
    [(UILabel *)v15->__titleLabel setNumberOfLines:0];
    [(UILabel *)v15->__titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v15->__titleLabel setText:v10];
    v25 = CEKFontOfSizeAndStyle(1, 14.0);
    [(UILabel *)v15->__titleLabel setFont:v25];

    [(CEKExpandingSlider *)v15 addSubview:v15->__titleLabel];
    uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v11, v12, v13, v14);
    valueLabel = v15->__valueLabel;
    v15->__valueLabel = (UILabel *)v26;

    [(UILabel *)v15->__valueLabel setUserInteractionEnabled:0];
    [(UILabel *)v15->__valueLabel setTextAlignment:1];
    [(UILabel *)v15->__valueLabel setLineBreakMode:4];
    [(UILabel *)v15->__valueLabel setNumberOfLines:1];
    [(UILabel *)v15->__valueLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v28 = CEKMonospacedStylisticNumeralFontOfSizeAndStyle(1, 14.0);
    [(UILabel *)v15->__valueLabel setFont:v28];

    [(CEKExpandingSlider *)v15 addSubview:v15->__valueLabel];
    v29 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    levelIndicatorView = v15->__levelIndicatorView;
    v15->__levelIndicatorView = v29;

    [(UIView *)v15->__levelIndicatorView setUserInteractionEnabled:0];
    v31 = [(UIView *)v15->__levelIndicatorView layer];
    objc_msgSend(v31, "setAnchorPoint:", 0.5, 0.0);

    v32 = [MEMORY[0x1E4FB1618] systemYellowColor];
    [(UIView *)v15->__levelIndicatorView setBackgroundColor:v32];

    [(CEKExpandingSlider *)v15 addSubview:v15->__levelIndicatorView];
    v15->_markedValue = 1.79769313e308;
    v33 = objc_alloc_init(CEKAdditiveAnimator);
    animator = v15->__animator;
    v15->__animator = v33;

    [(CEKAdditiveAnimator *)v15->__animator setDelegate:v15];
    uint64_t v35 = [objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v15 action:sel__handlePress_];
    gestureRecognizer = v15->__gestureRecognizer;
    v15->__gestureRecognizer = (UILongPressGestureRecognizer *)v35;

    [(UILongPressGestureRecognizer *)v15->__gestureRecognizer setMinimumPressDuration:0.0];
    [(UILongPressGestureRecognizer *)v15->__gestureRecognizer setCancelsTouchesInView:0];
    [(UILongPressGestureRecognizer *)v15->__gestureRecognizer setDelaysTouchesEnded:0];
    [(UILongPressGestureRecognizer *)v15->__gestureRecognizer setDelegate:v15];
    [(CEKExpandingSlider *)v15 addGestureRecognizer:v15->__gestureRecognizer];
    [(CEKExpandingSlider *)v15 _updateUIForValue:0 animated:0.0];
    [(CEKExpandingSlider *)v15 _updateSubviewVisibility];
    [(CEKExpandingSlider *)v15 _updateLabelColorsForProgress:0.0];
    [(CEKExpandingSlider *)v15 _updateColors];
  }

  return v15;
}

- (double)value
{
  v2 = [(CEKExpandingSlider *)self _slider];
  [v2 value];
  double v4 = v3;

  return v4;
}

- (void)setValue:(double)a3
{
}

- (void)setValue:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(CEKExpandingSlider *)self value];
  if (v7 != a3)
  {
    v8 = [(CEKExpandingSlider *)self _slider];
    [v8 setValue:a3];

    [(CEKExpandingSlider *)self _updateUIForValue:v4 animated:a3];
  }
}

- (NSString)title
{
  v2 = [(CEKExpandingSlider *)self _slider];
  double v3 = [v2 title];

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(CEKExpandingSlider *)self _slider];
  v5 = [v4 title];
  char v6 = [v9 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    double v7 = [(CEKExpandingSlider *)self _slider];
    [v7 setTitle:v9];

    v8 = [(CEKExpandingSlider *)self _titleLabel];
    [v8 setText:v9];

    [(CEKExpandingSlider *)self setNeedsLayout];
  }
}

- (void)setExpanded:(BOOL)a3
{
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)_setExpanded:(BOOL)a3 animated:(BOOL)a4 shouldNotify:(BOOL)a5
{
  if (self->_expanded != a3)
  {
    BOOL v5 = a5;
    BOOL v6 = a4;
    BOOL v7 = a3;
    self->_BOOL expanded = a3;
    double v9 = 1.0;
    if (!a3)
    {
      [(CEKExpandingSlider *)self _updateSubviewVisibility];
      double v9 = 0.0;
    }
    id v10 = [(CEKExpandingSlider *)self _ticksView];
    [v10 setExpanded:v7 animated:v6];

    [(CEKExpandingSlider *)self setNeedsLayout];
    if (v6)
    {
      [(CEKExpandingSlider *)self _setExpansionAnimationCounter:[(CEKExpandingSlider *)self _expansionAnimationCounter] + 1];
      double v11 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
      double v12 = [(CEKExpandingSlider *)self _animator];
      [v12 setValue:@"CEKExpandingSliderAnimatorProgressKey" forKey:v11 duration:v9 timingCurve:0.35];

      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setAnimationTimingFunction:v11];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __57__CEKExpandingSlider__setExpanded_animated_shouldNotify___block_invoke;
      v17[3] = &unk_1E63CD380;
      v17[4] = self;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __57__CEKExpandingSlider__setExpanded_animated_shouldNotify___block_invoke_2;
      v16[3] = &unk_1E63CD3F0;
      v16[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v17 options:v16 animations:0.35 completion:0.0];
      [MEMORY[0x1E4F39CF8] commit];

      if (!v5) {
        return;
      }
    }
    else
    {
      [(CEKExpandingSlider *)self _updateLabelColorsForProgress:v9];
      [(CEKExpandingSlider *)self _updateMarkedValueAnimated:0];
      if (!v5) {
        return;
      }
    }
    BOOL expanded = self->_expanded;
    double v14 = [(CEKExpandingSlider *)self delegate];
    v15 = v14;
    if (expanded) {
      [v14 sliderWillExpand:self];
    }
    else {
      [v14 sliderWillCollapse:self];
    }
  }
}

uint64_t __57__CEKExpandingSlider__setExpanded_animated_shouldNotify___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __57__CEKExpandingSlider__setExpanded_animated_shouldNotify___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setExpansionAnimationCounter:", objc_msgSend(*(id *)(a1 + 32), "_expansionAnimationCounter") - 1);
  uint64_t result = [*(id *)(a1 + 32) _expansionAnimationCounter];
  if (!result)
  {
    [*(id *)(a1 + 32) _updateSubviewVisibility];
    double v3 = *(void **)(a1 + 32);
    return [v3 _updateMarkedValueAnimated:1];
  }
  return result;
}

- (void)_updateSubviewVisibility
{
  if ([(CEKExpandingSlider *)self expanded]) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  BOOL v4 = [(CEKExpandingSlider *)self _slider];
  [v4 setAlpha:v3];

  if ([(CEKExpandingSlider *)self expanded]) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  BOOL v6 = [(CEKExpandingSlider *)self _titleLabel];
  [v6 setAlpha:v5];

  if ([(CEKExpandingSlider *)self expanded]) {
    double v7 = 0.0;
  }
  else {
    double v7 = 1.0;
  }
  v8 = [(CEKExpandingSlider *)self _valueLabel];
  [v8 setAlpha:v7];

  if ([(CEKExpandingSlider *)self expanded]) {
    double v9 = 0.0;
  }
  else {
    double v9 = 1.0;
  }
  id v10 = [(CEKExpandingSlider *)self _ticksView];
  [v10 setAlpha:v9];

  if ([(CEKExpandingSlider *)self expanded]) {
    double v11 = 0.0;
  }
  else {
    double v11 = 1.0;
  }
  id v12 = [(CEKExpandingSlider *)self _levelIndicatorView];
  [v12 setAlpha:v11];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)CEKExpandingSlider;
  double v7 = -[CEKExpandingSlider hitTest:withEvent:](&v15, sel_hitTest_withEvent_, a4);
  [(CEKExpandingSlider *)self bounds];
  CGFloat v9 = v8;
  if (![(CEKExpandingSlider *)self expanded])
  {
    id v10 = [(CEKExpandingSlider *)self _ticksView];
    [v10 intrinsicContentSize];
    double v12 = v11;

    [(CEKExpandingSlider *)self collapsedCenterX];
    v18.origin.CGFloat x = v13 + v12 * -0.5;
    v18.origin.CGFloat y = 0.0;
    v18.size.width = v12;
    v18.size.height = v9;
    v17.CGFloat x = x;
    v17.CGFloat y = y;
    if (!CGRectContainsPoint(v18, v17))
    {

      double v7 = 0;
    }
  }
  return v7;
}

- (void)setCollapsedCenterX:(double)a3
{
  if (self->_collapsedCenterX != a3)
  {
    self->_collapsedCenterX = a3;
    [(CEKExpandingSlider *)self setNeedsLayout];
  }
}

- (void)_updateColors
{
  double v3 = [(CEKExpandingSlider *)self tintColor];
  BOOL v4 = [(CEKExpandingSlider *)self _slider];
  [v4 setTintColor:v3];

  double v5 = [(CEKExpandingSlider *)self tintColor];
  BOOL v6 = [(CEKExpandingSlider *)self _levelIndicatorView];
  [v6 setBackgroundColor:v5];

  if (![(CEKExpandingSlider *)self expanded])
  {
    [(CEKExpandingSlider *)self _updateLabelColorsForProgress:0.0];
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CEKExpandingSlider;
  [(CEKExpandingSlider *)&v3 tintColorDidChange];
  [(CEKExpandingSlider *)self _updateColors];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CEKExpandingSlider;
  [(CEKExpandingSlider *)&v4 traitCollectionDidChange:a3];
  [(CEKExpandingSlider *)self _updateColors];
}

- (CGSize)intrinsicContentSize
{
  v2 = [(CEKExpandingSlider *)self _ticksView];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v92.receiver = self;
  v92.super_class = (Class)CEKExpandingSlider;
  [(CEKExpandingSlider *)&v92 layoutSubviews];
  [(CEKExpandingSlider *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CEKExpandingSlider *)self _slider];
  CGFloat v86 = v6;
  CGFloat v87 = v4;
  CGFloat v84 = v10;
  CGFloat v85 = v8;
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  if ([(CEKExpandingSlider *)self expanded]) {
    double v12 = 1.0;
  }
  else {
    double v12 = 0.0;
  }
  double v13 = [(CEKExpandingSlider *)self _animator];
  double v89 = v12;
  [v13 setValue:@"CEKExpandingSliderAnimatorProgressKey" forKey:0 duration:v12 timingCurve:0.0];

  double v14 = [(CEKExpandingSlider *)self _slider];
  [v14 frameForTitleLabel];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  uint64_t v23 = [(CEKExpandingSlider *)self _slider];
  -[CEKExpandingSlider convertRect:fromView:](self, "convertRect:fromView:", v23, v16, v18, v20, v22);
  CGFloat v90 = v24;
  CGFloat v91 = v25;
  double v27 = v26;
  CGFloat v29 = v28;

  v30 = [(CEKExpandingSlider *)self _slider];
  [v30 frameForValueLabel];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  v39 = [(CEKExpandingSlider *)self _slider];
  -[CEKExpandingSlider convertRect:fromView:](self, "convertRect:fromView:", v39, v32, v34, v36, v38);
  double v83 = v40;

  v41 = [(CEKExpandingSlider *)self _slider];
  [v41 frameForLevelIndicator];
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  v50 = [(CEKExpandingSlider *)self _slider];
  -[CEKExpandingSlider convertRect:fromView:](self, "convertRect:fromView:", v50, v43, v45, v47, v49);
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;
  double v58 = v57;

  v59 = [(CEKExpandingSlider *)self _titleLabel];
  [v59 intrinsicContentSize];
  double v61 = v60;

  v62 = [(CEKExpandingSlider *)self _valueLabel];
  [v62 intrinsicContentSize];
  double v64 = v63;

  if ([(CEKExpandingSlider *)self expanded])
  {
    v93.origin.CGFloat x = v90;
    v93.size.width = v91;
    v93.origin.CGFloat y = v27;
    v93.size.height = v29;
    CGFloat v65 = CGRectGetMaxX(v93) - v61;
    v66 = [(CEKExpandingSlider *)self _titleLabel];
    objc_msgSend(v66, "setFrame:", v65, v27, v61, 18.0);

    v94.origin.CGFloat y = v86;
    v94.origin.CGFloat x = v87;
    v94.size.height = v84;
    v94.size.width = v85;
    CGRectGetMidX(v94);
    UIRoundToViewScale();
    double v68 = v67;
    v69 = [(CEKExpandingSlider *)self _valueLabel];
    objc_msgSend(v69, "setFrame:", v68, v83, v64, 18.0);
  }
  else
  {
    [(CEKExpandingSlider *)self collapsedCenterX];
    CGFloat v88 = v56;
    UIRoundToViewScale();
    CGFloat v70 = v29;
    double v72 = v71;
    v73 = [(CEKExpandingSlider *)self _titleLabel];
    objc_msgSend(v73, "setFrame:", v72, v27, v61, 18.0);

    [(CEKExpandingSlider *)self collapsedCenterX];
    UIRoundToViewScale();
    double v75 = v74;
    v95.origin.CGFloat x = v90;
    v95.size.width = v91;
    v95.origin.CGFloat y = v27;
    v95.size.height = v70;
    CGFloat v76 = CGRectGetMaxY(v95) + -1.0;
    v77 = [(CEKExpandingSlider *)self _valueLabel];
    objc_msgSend(v77, "setFrame:", v75, v76, v64, 18.0);

    [(CEKExpandingSlider *)self collapsedCenterX];
    double v79 = v78 + -0.5;
    double v56 = v88;
    v96.origin.CGFloat x = v52;
    v96.origin.CGFloat y = v54;
    v96.size.width = v88;
    v96.size.height = v58;
    double v54 = CGRectGetMaxY(v96) + -10.0;
    double v58 = 10.0;
    double v52 = v79;
  }
  v80 = [(CEKExpandingSlider *)self _levelIndicatorView];
  objc_msgSend(v80, "setFrame:", v52, v54, v56, v58);

  v81 = [(CEKExpandingSlider *)self _animator];
  char v82 = [v81 isAnimating];

  if ((v82 & 1) == 0) {
    [(CEKExpandingSlider *)self _updateTickViewFrameForProgress:v89];
  }
}

- (void)animator:(id)a3 didUpdateValuesForKeys:(id)a4
{
  double v5 = [(CEKExpandingSlider *)self _animator];
  [v5 valueForKey:@"CEKExpandingSliderAnimatorProgressKey"];
  double v7 = v6;

  [(CEKExpandingSlider *)self _updateTickViewFrameForProgress:v7];
  [(CEKExpandingSlider *)self _updateLabelColorsForProgress:v7];
}

- (void)_updateTickViewFrameForProgress:(double)a3
{
  double v5 = [(CEKExpandingSlider *)self _ticksView];
  [v5 intrinsicContentSize];
  double v7 = v6;
  double v9 = v8;

  double v10 = [(CEKExpandingSlider *)self _slider];
  [v10 frameForTicksView];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v19 = [(CEKExpandingSlider *)self _slider];
  -[CEKExpandingSlider convertRect:fromView:](self, "convertRect:fromView:", v19, v12, v14, v16, v18);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  [(CEKExpandingSlider *)self collapsedCenterX];
  double v27 = CEKInterpolate(v26 + v7 * -0.5, v21, a3);
  double v28 = CEKInterpolate(v7, v25, a3);
  id v29 = [(CEKExpandingSlider *)self _ticksView];
  objc_msgSend(v29, "setFrame:", v27, v23, v28, v9);
}

- (void)_updateLabelColorsForProgress:(double)a3
{
  double v5 = CEKInterpolateClamped(1.0, 0.6, a3);
  double v6 = [MEMORY[0x1E4FB1618] labelColor];
  double v7 = [v6 colorWithAlphaComponent:v5];
  double v8 = [(CEKExpandingSlider *)self _titleLabel];
  [v8 setTextColor:v7];

  if ([(CEKExpandingSlider *)self expanded])
  {
    double v16 = 0.0;
    double v17 = 0.0;
    double v15 = 0.0;
    double v9 = [(CEKExpandingSlider *)self tintColor];
    double v10 = [(CEKExpandingSlider *)self traitCollection];
    double v11 = [v9 resolvedColorWithTraitCollection:v10];

    [v11 getRed:&v17 green:&v16 blue:&v15 alpha:0];
    double v17 = CEKInterpolateClamped(1.0, v17, a3);
    double v16 = CEKInterpolateClamped(1.0, v16, a3);
    double v15 = CEKInterpolateClamped(1.0, v15, a3);
    double v12 = [MEMORY[0x1E4FB1618] colorWithRed:v17 green:v16 blue:v15 alpha:1.0];
    double v13 = [(CEKExpandingSlider *)self _valueLabel];
    [v13 setTextColor:v12];
  }
  else
  {
    double v11 = [MEMORY[0x1E4FB1618] labelColor];
    double v14 = [(CEKExpandingSlider *)self _valueLabel];
    [v14 setTextColor:v11];
  }
}

- (void)_updateMarkedValueAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CEKExpandingSlider *)self _gestureRecognizer];
  uint64_t v6 = [v5 state];

  if ((unint64_t)(v6 - 1) < 2
    || ([(CEKExpandingSlider *)self _markedValueAnimationTimer],
        double v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    [(CEKExpandingSlider *)self markedValue];
    double v9 = v8;
  }
  else
  {
    double v9 = 1.79769313e308;
  }
  id v10 = [(CEKExpandingSlider *)self _slider];
  [v10 setMarkedValue:v3 animated:v9];
}

- (void)_handlePress:(id)a3
{
  uint64_t v4 = [a3 state];
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 == 1)
    {
      [(CEKExpandingSlider *)self _setExpanded:1 animated:1 shouldNotify:1];
      double v14 = [(CEKExpandingSlider *)self _markedValueAnimationTimer];
      [v14 invalidate];

      [(CEKExpandingSlider *)self _setMarkedValueAnimationTimer:0];
      double v15 = [(CEKExpandingSlider *)self _expansionAnimationTimer];
      [v15 invalidate];

      [(CEKExpandingSlider *)self _setExpansionAnimationTimer:0];
    }
  }
  else
  {
    double v5 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v6 = [(CEKExpandingSlider *)self _slider];
    [v6 animationDuration];
    double v8 = [v5 timerWithTimeInterval:self target:sel__handleMarkedValueAnimationTimerFired_ selector:0 userInfo:0 repeats:1.0 - v7];
    [(CEKExpandingSlider *)self _setMarkedValueAnimationTimer:v8];

    double v9 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    id v10 = [(CEKExpandingSlider *)self _markedValueAnimationTimer];
    uint64_t v11 = *MEMORY[0x1E4F1C4B0];
    [v9 addTimer:v10 forMode:*MEMORY[0x1E4F1C4B0]];

    double v12 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__handleExpansionAnimationTimerFired_ selector:0 userInfo:0 repeats:1.0];
    [(CEKExpandingSlider *)self _setExpansionAnimationTimer:v12];

    id v16 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    double v13 = [(CEKExpandingSlider *)self _expansionAnimationTimer];
    [v16 addTimer:v13 forMode:v11];
  }
}

- (void)_handleMarkedValueAnimationTimerFired:(id)a3
{
  [(CEKExpandingSlider *)self _setMarkedValueAnimationTimer:0];
  [(CEKExpandingSlider *)self _updateMarkedValueAnimated:1];
}

- (void)_handleExpansionAnimationTimerFired:(id)a3
{
  [(CEKExpandingSlider *)self _setExpansionAnimationTimer:0];
  [(CEKExpandingSlider *)self _setExpanded:0 animated:1 shouldNotify:1];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_handleSliderDidChangeValue:(id)a3
{
  [a3 value];
  -[CEKExpandingSlider _updateUIForValue:animated:](self, "_updateUIForValue:animated:", 0);
  [(CEKExpandingSlider *)self sendActionsForControlEvents:4096];
}

- (void)_updateUIForValue:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(CEKExpandingSlider *)self _slider];
  double v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3 * 100.0];
  double v9 = [v7 formattedIntegerStringFromNumber:v8];
  id v10 = [(CEKExpandingSlider *)self _valueLabel];
  [v10 setAttributedText:v9];

  uint64_t v11 = [(CEKExpandingSlider *)self _ticksView];
  [v11 setSelectedValue:v4 animated:a3];

  [(CEKExpandingSlider *)self setNeedsLayout];
}

- (CEKExpandingSliderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CEKExpandingSliderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)markedValue
{
  return self->_markedValue;
}

- (void)setMarkedValue:(double)a3
{
  self->_markedValue = a3;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (double)collapsedCenterX
{
  return self->_collapsedCenterX;
}

- (UILabel)_titleLabel
{
  return self->__titleLabel;
}

- (UILabel)_valueLabel
{
  return self->__valueLabel;
}

- (UIView)_levelIndicatorView
{
  return self->__levelIndicatorView;
}

- (CEKExpandingTickMarksView)_ticksView
{
  return self->__ticksView;
}

- (CEKSlider)_slider
{
  return self->__slider;
}

- (UILongPressGestureRecognizer)_gestureRecognizer
{
  return self->__gestureRecognizer;
}

- (CEKAdditiveAnimator)_animator
{
  return self->__animator;
}

- (unint64_t)_expansionAnimationCounter
{
  return self->__expansionAnimationCounter;
}

- (void)_setExpansionAnimationCounter:(unint64_t)a3
{
  self->__expansionAnimationCounter = a3;
}

- (NSTimer)_expansionAnimationTimer
{
  return self->__expansionAnimationTimer;
}

- (void)_setExpansionAnimationTimer:(id)a3
{
}

- (NSTimer)_markedValueAnimationTimer
{
  return self->__markedValueAnimationTimer;
}

- (void)_setMarkedValueAnimationTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__markedValueAnimationTimer, 0);
  objc_storeStrong((id *)&self->__expansionAnimationTimer, 0);
  objc_storeStrong((id *)&self->__animator, 0);
  objc_storeStrong((id *)&self->__gestureRecognizer, 0);
  objc_storeStrong((id *)&self->__slider, 0);
  objc_storeStrong((id *)&self->__ticksView, 0);
  objc_storeStrong((id *)&self->__levelIndicatorView, 0);
  objc_storeStrong((id *)&self->__valueLabel, 0);
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end