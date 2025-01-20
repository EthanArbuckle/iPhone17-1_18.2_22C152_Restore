@interface CCUISteppedSliderView
- (BOOL)firstStepIsDisabled;
- (BOOL)firstStepIsOff;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (CCUISteppedSliderView)initWithFrame:(CGRect)a3;
- (float)_valueForTouchLocation:(CGPoint)a3;
- (float)_valueFromStep:(unint64_t)a3;
- (id)_additionalTopLevelBlockingGestureRecognizers;
- (id)_createBackgroundViewForStep:(unint64_t)a3;
- (id)_createSeparatorView;
- (unint64_t)_stepFromValue:(float)a3;
- (unint64_t)_stepFromValue:(float)a3 avoidCurrentStep:(BOOL)a4;
- (unint64_t)numberOfSteps;
- (unint64_t)step;
- (void)_adjustStepIfNecessaryForFirstStepBehaviorChange;
- (void)_createSeparatorViewsForNumberOfSteps:(unint64_t)a3;
- (void)_createStepViewsForNumberOfSteps:(unint64_t)a3;
- (void)_handleHoverGestureRecognizer:(id)a3;
- (void)_handleValueTapGestureRecognizer:(id)a3;
- (void)_layoutStepViews;
- (void)_updateStepFromValue:(float)a3 toggleCurrentStep:(BOOL)a4 andUpdateValue:(BOOL)a5;
- (void)_updateStepViewVisibility;
- (void)applyInoperativeAppearance:(BOOL)a3;
- (void)contentModuleWillTransitionToExpandedContentMode:(BOOL)a3;
- (void)didMoveToWindow;
- (void)layoutElasticContentViews;
- (void)setContinuousSliderCornerRadius:(double)a3;
- (void)setFirstStepIsDisabled:(BOOL)a3;
- (void)setFirstStepIsOff:(BOOL)a3;
- (void)setInoperative:(BOOL)a3;
- (void)setNumberOfSteps:(unint64_t)a3;
- (void)setStep:(unint64_t)a3;
- (void)setValue:(float)a3 animated:(BOOL)a4;
- (void)setValue:(float)a3 isAdjusted:(BOOL)a4 andUpdateStep:(BOOL)a5 animated:(BOOL)a6;
- (void)setValueVisible:(BOOL)a3;
@end

@implementation CCUISteppedSliderView

- (CCUISteppedSliderView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CCUISteppedSliderView;
  v3 = -[CCUIBaseSliderView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_numberOfSteps = 2;
    v3->_firstStepIsDisabled = 0;
    v3->_firstStepIsOff = 0;
    v3->_valueAdjustedForSteppedSlider = -1.0;
    [(CCUISteppedSliderView *)v3 _createStepViewsForNumberOfSteps:2];
    [(CCUISteppedSliderView *)v4 bounds];
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v5, v6, v7, v8);
    stepViewsContainer = v4->_stepViewsContainer;
    v4->_stepViewsContainer = (UIView *)v9;

    [(UIView *)v4->_stepViewsContainer setUserInteractionEnabled:0];
    [(UIView *)v4->_stepViewsContainer setClipsToBounds:1];
    v11 = [(CCUIBaseSliderView *)v4 glyphContainerView];
    [v11 addSubview:v4->_stepViewsContainer];

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel__handleValueTapGestureRecognizer_];
    tapGestureRecognizer = v4->_tapGestureRecognizer;
    v4->_tapGestureRecognizer = (UITapGestureRecognizer *)v12;

    [(UITapGestureRecognizer *)v4->_tapGestureRecognizer setDelegate:v4];
    [(UITapGestureRecognizer *)v4->_tapGestureRecognizer setCancelsTouchesInView:0];
    [(UITapGestureRecognizer *)v4->_tapGestureRecognizer setDelaysTouchesEnded:0];
    [(CCUISteppedSliderView *)v4 addGestureRecognizer:v4->_tapGestureRecognizer];
    [(CCUIBaseSliderView *)v4 setShouldProvideBuiltInFeedback:0];
    v14 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v15 = [v14 userInterfaceIdiom];

    if (v15 == 1)
    {
      uint64_t v16 = [objc_alloc(MEMORY[0x1E4FB1800]) initWithTarget:v4 action:sel__handleHoverGestureRecognizer_];
      hoverGestureRecognizer = v4->_hoverGestureRecognizer;
      v4->_hoverGestureRecognizer = (UIHoverGestureRecognizer *)v16;

      [(CCUISteppedSliderView *)v4 addGestureRecognizer:v4->_hoverGestureRecognizer];
    }
  }
  return v4;
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
}

- (void)setValue:(float)a3 isAdjusted:(BOOL)a4 andUpdateStep:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  [(CCUIBaseSliderView *)self value];
  if (*(float *)&v11 != a3)
  {
    float v12 = -1.0;
    if (v8) {
      float v12 = a3;
    }
    self->_valueAdjustedForSteppedSlider = v12;
    if (v7)
    {
      *(float *)&double v11 = a3;
      self->_step = [(CCUISteppedSliderView *)self _stepFromValue:v11];
    }
    v13.receiver = self;
    v13.super_class = (Class)CCUISteppedSliderView;
    *(float *)&double v11 = a3;
    [(CCUIBaseSliderView *)&v13 setValue:v6 animated:v11];
  }
}

- (void)setStep:(unint64_t)a3
{
  if (self->_step != a3 && self->_numberOfSteps >= a3 || self->_valueAdjustedForSteppedSlider != -1.0)
  {
    self->_step = a3;
    -[CCUISteppedSliderView _valueFromStep:](self, "_valueFromStep:");
    -[CCUISteppedSliderView setValue:isAdjusted:andUpdateStep:animated:](self, "setValue:isAdjusted:andUpdateStep:animated:", 0, 0, 0);
    [(CCUISteppedSliderView *)self setNeedsLayout];
  }
}

- (void)setNumberOfSteps:(unint64_t)a3
{
  if (a3 <= 1) {
    unint64_t v3 = 1;
  }
  else {
    unint64_t v3 = a3;
  }
  if (self->_numberOfSteps != v3)
  {
    self->_numberOfSteps = v3;
    [(CCUISteppedSliderView *)self _createStepViewsForNumberOfSteps:v3];
    [(CCUISteppedSliderView *)self _createSeparatorViewsForNumberOfSteps:v3];
    if (!self->_selectionFeedbackGenerator)
    {
      double v5 = [MEMORY[0x1E4FB2290] lightConfiguration];
      id v8 = [v5 tweakedConfigurationForClass:objc_opt_class() usage:@"sliderDetent"];

      BOOL v6 = (UISelectionFeedbackGenerator *)[objc_alloc(MEMORY[0x1E4FB1C18]) initWithConfiguration:v8 view:self];
      selectionFeedbackGenerator = self->_selectionFeedbackGenerator;
      self->_selectionFeedbackGenerator = v6;
    }
  }
}

- (void)setFirstStepIsDisabled:(BOOL)a3
{
  if (self->_firstStepIsDisabled != a3)
  {
    self->_firstStepIsDisabled = a3;
    [(CCUISteppedSliderView *)self _createStepViewsForNumberOfSteps:self->_numberOfSteps];
    [(CCUISteppedSliderView *)self _adjustStepIfNecessaryForFirstStepBehaviorChange];
  }
}

- (void)setFirstStepIsOff:(BOOL)a3
{
  if (self->_firstStepIsOff != a3)
  {
    self->_firstStepIsOff = a3;
    [(CCUISteppedSliderView *)self _createStepViewsForNumberOfSteps:self->_numberOfSteps];
    [(CCUISteppedSliderView *)self _adjustStepIfNecessaryForFirstStepBehaviorChange];
  }
}

- (void)setContinuousSliderCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CCUISteppedSliderView;
  -[CCUIBaseSliderView setContinuousSliderCornerRadius:](&v5, sel_setContinuousSliderCornerRadius_);
  [(UIView *)self->_stepViewsContainer _setContinuousCornerRadius:a3];
}

- (void)setInoperative:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CCUISteppedSliderView;
  -[CCUIBaseSliderView setInoperative:](&v5, sel_setInoperative_);
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setEnabled:!v3];
}

- (void)setValueVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CCUISteppedSliderView;
  -[CCUIBaseSliderView setValueVisible:](&v6, sel_setValueVisible_);
  double v5 = 0.0;
  if (v3) {
    double v5 = 1.0;
  }
  [(UIView *)self->_stepViewsContainer setAlpha:v5];
}

- (void)applyInoperativeAppearance:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUISteppedSliderView;
  [(CCUIBaseSliderView *)&v4 applyInoperativeAppearance:a3];
  [(CCUISteppedSliderView *)self _updateStepViewVisibility];
}

- (void)layoutElasticContentViews
{
  v5.receiver = self;
  v5.super_class = (Class)CCUISteppedSliderView;
  [(CCUIBaseSliderView *)&v5 layoutElasticContentViews];
  stepViewsContainer = self->_stepViewsContainer;
  objc_super v4 = [(CCUIBaseSliderView *)self elasticContentView];
  [v4 bounds];
  -[UIView setFrame:](stepViewsContainer, "setFrame:");

  [(CCUIBaseSliderView *)self value];
  -[CCUISteppedSliderView _updateStepFromValue:toggleCurrentStep:andUpdateValue:](self, "_updateStepFromValue:toggleCurrentStep:andUpdateValue:", 0, 0);
  [(CCUISteppedSliderView *)self _layoutStepViews];
  [(CCUISteppedSliderView *)self _updateStepViewVisibility];
}

- (void)_layoutStepViews
{
  BOOL v3 = [(CCUIBaseSliderView *)self shouldIntegralizeContentLayout];
  BOOL v4 = [(CCUIBaseSliderView *)self shouldIntegralizeValueLayout];
  objc_super v5 = [(CCUISteppedSliderView *)self traitCollection];
  [v5 displayScale];
  double v45 = v6;

  [(UIView *)self->_stepViewsContainer bounds];
  CGFloat x = v48.origin.x;
  CGFloat y = v48.origin.y;
  CGFloat width = v48.size.width;
  CGFloat height = v48.size.height;
  CGFloat v47 = CGRectGetWidth(v48);
  v49.origin.CGFloat x = x;
  v49.origin.CGFloat y = y;
  v49.size.CGFloat width = width;
  v49.size.CGFloat height = height;
  double v46 = CGRectGetHeight(v49);
  unint64_t numberOfSteps = self->_numberOfSteps;
  unint64_t v12 = numberOfSteps - 1;
  if ((uint64_t)(numberOfSteps - 1) >= 0)
  {
    double v44 = v46 / (double)numberOfSteps - 1.0 / v45;
    double MaxY = 0.0;
    double v14 = 0.0;
    do
    {
      unint64_t v15 = self->_numberOfSteps;
      if (v12 + 1 != v15)
      {
        if (v3)
        {
          UIRectIntegralWithScale();
          double v17 = v16;
          double MaxY = v18;
          double v20 = v19;
          double v22 = v21;
          unint64_t v15 = self->_numberOfSteps;
        }
        else
        {
          double v17 = 0.0;
          double v20 = v47;
          double v22 = 1.0 / v45;
        }
        if (v12 >= v15 - 1)
        {
          v23 = 0;
        }
        else
        {
          v23 = [(NSArray *)self->_separatorViews objectAtIndex:v12];
        }
        objc_msgSend(v23, "setFrame:", v17, MaxY, v20, v22);
        v50.origin.CGFloat x = v17;
        v50.origin.CGFloat y = MaxY;
        v50.size.CGFloat width = v20;
        v50.size.CGFloat height = v22;
        double MaxY = CGRectGetMaxY(v50);
      }
      if (v12) {
        double v24 = v44 - v14;
      }
      else {
        double v24 = v46 - MaxY;
      }
      double v25 = 0.0;
      if (v3)
      {
        CGFloat v26 = v47;
        UIRectIntegralWithScale();
        double v25 = v27;
        double v29 = v28;
        double v31 = v30;
        double v33 = v32;
      }
      else
      {
        double v29 = MaxY;
        CGFloat v26 = v47;
        double v31 = v47;
        double v33 = v24;
      }
      v51.origin.CGFloat x = v25;
      v51.origin.CGFloat y = v29;
      v51.size.CGFloat width = v31;
      v51.size.CGFloat height = v33;
      double v34 = CGRectGetHeight(v51);
      v52.origin.CGFloat x = 0.0;
      v52.origin.CGFloat y = MaxY;
      v52.size.CGFloat width = v26;
      v52.size.CGFloat height = v24;
      double v35 = CGRectGetHeight(v52);
      unint64_t step = self->_step;
      [(CCUIBaseSliderView *)self presentationValue];
      float v38 = v37;
      if (self->_valueAdjustedForSteppedSlider == v37 && v12 + 1 == step)
      {
        unint64_t v40 = [(CCUISteppedSliderView *)self numberOfSteps];
        v53.origin.CGFloat x = v25;
        v53.origin.CGFloat y = v29;
        v53.size.CGFloat width = v31;
        v53.size.CGFloat height = v33;
        double v41 = CGRectGetHeight(v53) * (ceil((float)(v38 * (float)v40)) - (float)(v38 * (float)v40));
        if (v4) {
          UIRoundToScale();
        }
        double v29 = v29 + v41;
        double v33 = v33 - v41;
      }
      double v14 = v34 - v35;
      v42 = [(NSArray *)self->_stepBackgroundViews objectAtIndex:v12];
      objc_msgSend(v42, "setFrame:", v25, v29, v31, v33);
      v54.origin.CGFloat x = v25;
      v54.origin.CGFloat y = v29;
      v54.size.CGFloat width = v31;
      v54.size.CGFloat height = v33;
      double MaxY = CGRectGetMaxY(v54);
    }
    while ((uint64_t)v12-- > 0);
  }
}

- (id)_additionalTopLevelBlockingGestureRecognizers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_tapGestureRecognizer;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (void)_updateStepViewVisibility
{
  BOOL v3 = [(CCUIBaseSliderView *)self hasInoperativeAppearance];
  unint64_t numberOfSteps = self->_numberOfSteps;
  if (numberOfSteps)
  {
    unint64_t v5 = 0;
    if (v3) {
      double v6 = 0.6;
    }
    else {
      double v6 = 1.0;
    }
    do
    {
      unint64_t v7 = numberOfSteps - 1;
      unint64_t step = self->_step;
      uint64_t v9 = [(NSArray *)self->_stepBackgroundViews objectAtIndexedSubscript:v5];
      if (v5 == v7)
      {
        v10 = 0;
      }
      else
      {
        v10 = [(NSArray *)self->_separatorViews objectAtIndexedSubscript:v5];
      }
      unint64_t v11 = self->_step;
      if (self->_isHoverHighlighting
        && ((hoverStep = self->_hoverStep, v5 > v11 - 1) ? (BOOL v13 = hoverStep >= v5) : (BOOL v13 = 0),
            v13 ? (BOOL v14 = hoverStep > v11 - 1) : (BOOL v14 = 0),
            v14))
      {
        double v22 = v9;
        double v21 = 0.2;
      }
      else
      {
        if (v5 < v11)
        {
          unint64_t v15 = [(CCUISteppedSliderView *)self visualStylingProviderForCategory:2];
          BOOL v16 = [(CCUISteppedSliderView *)self firstStepIsOff];
          if (v5) {
            BOOL v17 = 0;
          }
          else {
            BOOL v17 = v16;
          }
          if (v17 || v5 == step - 1)
          {
            uint64_t v18 = [v15 _visualStylingForStyle:5];
          }
          else
          {
            uint64_t v18 = [v15 _controlCenterKeyLineOnLightVisualStyling];
          }
          v23 = (void *)v18;
          objc_msgSend(v10, "mt_replaceVisualStyling:", v18);
          [v9 setAlpha:v6];

          goto LABEL_28;
        }
        double v19 = [(CCUISteppedSliderView *)self visualStylingProviderForCategory:1];
        double v20 = [v19 _visualStylingForStyle:1];
        objc_msgSend(v10, "mt_replaceVisualStyling:", v20);

        double v21 = 0.0;
        double v22 = v9;
      }
      [v22 setAlpha:v21];
LABEL_28:

      ++v5;
      unint64_t numberOfSteps = self->_numberOfSteps;
    }
    while (v5 < numberOfSteps);
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)CCUISteppedSliderView;
  [(CCUIBaseSliderView *)&v3 didMoveToWindow];
  [(CCUISteppedSliderView *)self setNeedsLayout];
}

- (void)contentModuleWillTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CCUISteppedSliderView;
  -[CCUIBaseSliderView contentModuleWillTransitionToExpandedContentMode:](&v6, sel_contentModuleWillTransitionToExpandedContentMode_);
  selectionFeedbackGenerator = self->_selectionFeedbackGenerator;
  if (v3) {
    [(UISelectionFeedbackGenerator *)selectionFeedbackGenerator userInteractionStarted];
  }
  else {
    [(UISelectionFeedbackGenerator *)selectionFeedbackGenerator userInteractionEnded];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v5 = a4;
  id v6 = [(CCUIBaseSliderView *)self _panGestureRecognizer];

  return v6 == v5;
}

- (void)_createStepViewsForNumberOfSteps:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
  id v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_stepBackgroundViews;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10++), "removeFromSuperview", (void)v14);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if (a3)
  {
    uint64_t v11 = 0;
    do
    {
      unint64_t v12 = -[CCUISteppedSliderView _createBackgroundViewForStep:](self, "_createBackgroundViewForStep:", v11, (void)v14);
      [(UIView *)self->_stepViewsContainer addSubview:v12];
      [(NSArray *)v5 addObject:v12];

      ++v11;
    }
    while (a3 != v11);
  }
  stepBackgroundViews = self->_stepBackgroundViews;
  self->_stepBackgroundViews = v5;

  [(CCUISteppedSliderView *)self setNeedsLayout];
}

- (void)_createSeparatorViewsForNumberOfSteps:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 - 1;
  for (i = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3 - 1];
  {
    id v6 = [(CCUISteppedSliderView *)self _createSeparatorView];
    [(UIView *)self->_stepViewsContainer addSubview:v6];
    [(NSArray *)i addObject:v6];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = self->_separatorViews;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11++), "removeFromSuperview", (void)v13);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  separatorViews = self->_separatorViews;
  self->_separatorViews = i;

  [(CCUISteppedSliderView *)self setNeedsLayout];
}

- (id)_createBackgroundViewForStep:(unint64_t)a3
{
  if (a3 || ![(CCUISteppedSliderView *)self firstStepIsOff])
  {
    BOOL v3 = +[CCUIControlCenterMaterialView _lightFillView];
  }
  else
  {
    BOOL v3 = +[CCUIControlCenterMaterialView _tertiaryView];
  }
  unint64_t v4 = v3;
  [v3 setUserInteractionEnabled:0];
  return v4;
}

- (id)_createSeparatorView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v2 setUserInteractionEnabled:0];
  return v2;
}

- (void)_adjustStepIfNecessaryForFirstStepBehaviorChange
{
  [(CCUIBaseSliderView *)self value];
  unint64_t v3 = -[CCUISteppedSliderView _stepFromValue:](self, "_stepFromValue:");
  if (self->_step != v3)
  {
    [(CCUISteppedSliderView *)self setStep:v3];
  }
}

- (unint64_t)_stepFromValue:(float)a3
{
  return -[CCUISteppedSliderView _stepFromValue:avoidCurrentStep:](self, "_stepFromValue:avoidCurrentStep:", 0);
}

- (unint64_t)_stepFromValue:(float)a3 avoidCurrentStep:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(CCUISteppedSliderView *)self firstStepIsDisabled]) {
    unint64_t v7 = 1;
  }
  else {
    unint64_t v7 = [(CCUISteppedSliderView *)self firstStepIsOff];
  }
  unint64_t numberOfSteps = self->_numberOfSteps;
  unint64_t v9 = vcvtps_u32_f32((float)numberOfSteps * a3);
  if (v7 > v9) {
    unint64_t v9 = v7;
  }
  if (numberOfSteps >= v9) {
    unint64_t result = v9;
  }
  else {
    unint64_t result = self->_numberOfSteps;
  }
  if (v4 && result == self->_step)
  {
    if (result - 1 <= v7) {
      return v7;
    }
    else {
      --result;
    }
  }
  return result;
}

- (float)_valueFromStep:(unint64_t)a3
{
  unint64_t numberOfSteps = self->_numberOfSteps;
  if (numberOfSteps) {
    return (float)a3 / (float)numberOfSteps;
  }
  else {
    return 0.0;
  }
}

- (float)_valueForTouchLocation:(CGPoint)a3
{
  double y = a3.y;
  [(CCUISteppedSliderView *)self bounds];
  CGFloat Height = CGRectGetHeight(v6);
  return (Height - y) / Height;
}

- (void)_handleValueTapGestureRecognizer:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3)
  {
    [v4 locationInView:self];
    -[CCUISteppedSliderView _valueForTouchLocation:](self, "_valueForTouchLocation:");
    -[CCUISteppedSliderView _updateStepFromValue:toggleCurrentStep:andUpdateValue:](self, "_updateStepFromValue:toggleCurrentStep:andUpdateValue:", 1, 1);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__CCUISteppedSliderView__handleValueTapGestureRecognizer___block_invoke;
    v7[3] = &unk_1E6AD41E8;
    v7[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
    id v5 = [(CCUISteppedSliderView *)self window];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__CCUISteppedSliderView__handleValueTapGestureRecognizer___block_invoke_2;
    v6[3] = &unk_1E6AD41E8;
    v6[4] = self;
    +[CCUIContentModuleContext performWithoutAnimationWhileHiddenInWindow:v5 actions:v6];

    [(CCUISteppedSliderView *)self sendActionsForControlEvents:4096];
    [(CCUISteppedSliderView *)self sendActionsForControlEvents:CCUIBaseSliderViewControlEventPresentationValueChanged];
  }
}

uint64_t __58__CCUISteppedSliderView__handleValueTapGestureRecognizer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutStepViews];
}

uint64_t __58__CCUISteppedSliderView__handleValueTapGestureRecognizer___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __58__CCUISteppedSliderView__handleValueTapGestureRecognizer___block_invoke_3;
  v2[3] = &unk_1E6AD41E8;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:v2 animations:0.1];
}

uint64_t __58__CCUISteppedSliderView__handleValueTapGestureRecognizer___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStepViewVisibility];
}

- (void)_updateStepFromValue:(float)a3 toggleCurrentStep:(BOOL)a4 andUpdateValue:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t step = self->_step;
  unint64_t v8 = -[CCUISteppedSliderView _stepFromValue:avoidCurrentStep:](self, "_stepFromValue:avoidCurrentStep:", a4);
  self->_unint64_t step = v8;
  if (v5)
  {
    [(CCUISteppedSliderView *)self _valueFromStep:v8];
    -[CCUISteppedSliderView setValue:isAdjusted:andUpdateStep:animated:](self, "setValue:isAdjusted:andUpdateStep:animated:", 0, 0, 0);
    unint64_t v8 = self->_step;
  }
  if (step != v8)
  {
    selectionFeedbackGenerator = self->_selectionFeedbackGenerator;
    [(UISelectionFeedbackGenerator *)selectionFeedbackGenerator selectionChanged];
  }
}

- (void)_handleHoverGestureRecognizer:(id)a3
{
  int isHoverHighlighting = self->_isHoverHighlighting;
  unint64_t hoverStep = self->_hoverStep;
  id v6 = a3;
  uint64_t v7 = [v6 state];
  [v6 locationInView:self];
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  stepBackgroundViews = self->_stepBackgroundViews;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__CCUISteppedSliderView__handleHoverGestureRecognizer___block_invoke;
  v14[3] = &unk_1E6AD4250;
  v14[5] = v9;
  v14[6] = v11;
  v14[4] = self;
  [(NSArray *)stepBackgroundViews enumerateObjectsUsingBlock:v14];
  int v13 = v7 != 3;
  self->_int isHoverHighlighting = v13;
  if (isHoverHighlighting != v13 || hoverStep != self->_hoverStep) {
    [(CCUISteppedSliderView *)self setNeedsLayout];
  }
}

uint64_t __55__CCUISteppedSliderView__handleHoverGestureRecognizer___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  [a2 frame];
  uint64_t result = UIRectContainsPointInYAxis();
  if (result)
  {
    *(void *)(*(void *)(a1 + 32) + 688) = a3;
    *a4 = 1;
  }
  return result;
}

- (unint64_t)numberOfSteps
{
  return self->_numberOfSteps;
}

- (BOOL)firstStepIsDisabled
{
  return self->_firstStepIsDisabled;
}

- (BOOL)firstStepIsOff
{
  return self->_firstStepIsOff;
}

- (unint64_t)step
{
  return self->_step;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_stepViewsContainer, 0);
  objc_storeStrong((id *)&self->_separatorViews, 0);
  objc_storeStrong((id *)&self->_stepBackgroundViews, 0);
}

@end