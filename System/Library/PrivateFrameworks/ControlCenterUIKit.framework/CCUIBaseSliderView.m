@interface CCUIBaseSliderView
- (BOOL)_isInteractionStable;
- (BOOL)_usesVibrantGlyphStyling;
- (BOOL)hasInoperativeAppearance;
- (BOOL)isEditingValue;
- (BOOL)isGlyphVisible;
- (BOOL)isGroupRenderingRequired;
- (BOOL)isInoperative;
- (BOOL)isInteractiveWhenUnexpanded;
- (BOOL)isValueVisible;
- (BOOL)shouldIncludeVolumeButtonsInput;
- (BOOL)shouldIntegralizeContentLayout;
- (BOOL)shouldIntegralizeValueLayout;
- (BOOL)shouldProvideBuiltInFeedback;
- (BOOL)shouldRelaxVisibilityRequirementForButtonInput;
- (BOOL)shouldScaleWithButtonInput;
- (BOOL)usesBuiltInBackgroundView;
- (CCUIBaseSliderView)initWithFrame:(CGRect)a3;
- (CCUICAPackageDescription)glyphPackageDescription;
- (CGPoint)glyphCenter;
- (NSArray)punchOutRenderingViews;
- (NSArray)topLevelBlockingGestureRecognizers;
- (NSString)glyphState;
- (NSString)name;
- (UIColor)glyphTintColor;
- (UIImage)glyphImage;
- (UIPanGestureRecognizer)_panGestureRecognizer;
- (UIView)backgroundView;
- (UIView)elasticBackgroundContentView;
- (UIView)elasticContentBoundaryView;
- (UIView)elasticContentView;
- (UIView)glyphContainerView;
- (_UIFluidSliderInteraction)interaction;
- (double)_effectiveStretchAmount;
- (double)_length;
- (double)continuousSliderCornerRadius;
- (double)elasticContentStretchAmount;
- (double)glyphScale;
- (double)presentationLayoutValue;
- (float)presentationValue;
- (float)value;
- (id)_additionalTopLevelBlockingGestureRecognizers;
- (id)createBackgroundView;
- (unint64_t)behaviorIdentifier;
- (unint64_t)buttonInputStepCount;
- (void)_applyGlyphState:(id)a3 performConfiguration:(BOOL)a4;
- (void)_configureButtonInteraction;
- (void)_configureGroupRenderingMode;
- (void)_configurePanGestureRecognizer;
- (void)_handleFluidSliderInteractionUpdate:(id)a3;
- (void)_layoutElasticContentContainers;
- (void)_setActiveGlyphView:(id)a3;
- (void)_setGlyphState:(id)a3;
- (void)_updateBackgroundViewAppearance;
- (void)_updateGlyphTinting;
- (void)_updateHasInoperativeAppearance;
- (void)_updateInteractionEnabled;
- (void)contentModuleWillTransitionToExpandedContentMode:(BOOL)a3;
- (void)didMoveToWindow;
- (void)layoutElasticContentViews;
- (void)layoutSubviews;
- (void)setBehaviorIdentifier:(unint64_t)a3;
- (void)setButtonInputStepCount:(unint64_t)a3;
- (void)setContinuousSliderCornerRadius:(double)a3;
- (void)setElasticContentStretchAmount:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGlyphImage:(id)a3;
- (void)setGlyphPackageDescription:(id)a3;
- (void)setGlyphScale:(double)a3;
- (void)setGlyphState:(id)a3;
- (void)setGlyphTintColor:(id)a3;
- (void)setGlyphVisible:(BOOL)a3;
- (void)setInoperative:(BOOL)a3;
- (void)setInteractiveWhenUnexpanded:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setShouldIncludeVolumeButtonsInput:(BOOL)a3;
- (void)setShouldProvideBuiltInFeedback:(BOOL)a3;
- (void)setShouldRelaxVisibilityRequirementForButtonInput:(BOOL)a3;
- (void)setShouldScaleWithButtonInput:(BOOL)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setUsesBuiltInBackgroundView:(BOOL)a3;
- (void)setValue:(float)a3;
- (void)setValue:(float)a3 animated:(BOOL)a4;
- (void)setValueVisible:(BOOL)a3;
@end

@implementation CCUIBaseSliderView

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CCUIBaseSliderView *)self isEnabled];
  v6.receiver = self;
  v6.super_class = (Class)CCUIBaseSliderView;
  [(CCUIBaseSliderView *)&v6 setEnabled:v3];
  if (v5 != v3)
  {
    [(CCUIBaseSliderView *)self _updateInteractionEnabled];
    [(CCUIBaseSliderView *)self _updateHasInoperativeAppearance];
  }
}

- (void)_updateInteractionEnabled
{
  if ([(CCUIBaseSliderView *)self isEnabled]) {
    uint64_t v3 = [(CCUIBaseSliderView *)self isUserInteractionEnabled];
  }
  else {
    uint64_t v3 = 0;
  }
  interaction = self->_interaction;
  [(_UIFluidSliderInteraction *)interaction setUserInteractionEnabled:v3];
}

- (void)_updateHasInoperativeAppearance
{
  if ([(CCUIBaseSliderView *)self isInoperative]) {
    int v3 = 1;
  }
  else {
    int v3 = [(CCUIBaseSliderView *)self isEnabled] ^ 1;
  }
  BOOL v4 = v3 & [(CCUIBaseSliderView *)self isValueVisible];
  if (self->_hasInoperativeAppearance != v4)
  {
    self->_hasInoperativeAppearance = v4;
    -[CCUIBaseSliderView applyInoperativeAppearance:](self, "applyInoperativeAppearance:");
  }
}

- (BOOL)isValueVisible
{
  return self->_valueVisible;
}

- (BOOL)isInoperative
{
  return self->_inoperative;
}

- (CCUIBaseSliderView)initWithFrame:(CGRect)a3
{
  v28.receiver = self;
  v28.super_class = (Class)CCUIBaseSliderView;
  int v3 = -[CCUIBaseSliderView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  BOOL v4 = v3;
  if (v3)
  {
    v3->_glyphVisible = 1;
    v3->_glyphScale = 1.0;
    objc_storeStrong((id *)&v3->_glyphState, @"*");
    v4->_valueVisible = 1;
    v4->_elasticContentStretchAmount = -1.0;
    [(CCUIBaseSliderView *)v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = -[_CCUIBaseSliderContentView initWithFrame:]([_CCUIBaseSliderContentView alloc], "initWithFrame:", v5, v7, v9, v11);
    [(_CCUIBaseSliderContentView *)v13 setUserInteractionEnabled:0];
    [(_CCUIBaseSliderContentView *)v13 setContainingSliderView:v4];
    objc_storeStrong((id *)&v4->_elasticBackgroundContentView, v13);
    [(CCUIBaseSliderView *)v4 addSubview:v13];
    v14 = -[_CCUIBaseSliderContentView initWithFrame:]([_CCUIBaseSliderContentView alloc], "initWithFrame:", v6, v8, v10, v12);
    [(_CCUIBaseSliderContentView *)v14 setUserInteractionEnabled:0];
    [(_CCUIBaseSliderContentView *)v14 setContainingSliderView:v4];
    objc_storeStrong((id *)&v4->_elasticContentView, v14);
    [(CCUIBaseSliderView *)v4 addSubview:v14];
    v15 = -[_CCUIBaseSliderContentView initWithFrame:]([_CCUIBaseSliderContentView alloc], "initWithFrame:", v6, v8, v10, v12);
    [(_CCUIBaseSliderContentView *)v15 setUserInteractionEnabled:0];
    [(_CCUIBaseSliderContentView *)v15 setContainingSliderView:v4];
    objc_storeStrong((id *)&v4->_elasticContentBoundaryView, v15);
    [(_CCUIBaseSliderContentView *)v14 addSubview:v15];
    v16 = -[_CCUIBaseSliderContentView initWithFrame:]([_CCUIBaseSliderContentView alloc], "initWithFrame:", v6, v8, v10, v12);
    [(_CCUIBaseSliderContentView *)v16 setUserInteractionEnabled:0];
    [(_CCUIBaseSliderContentView *)v16 setContainingSliderView:v4];
    objc_storeStrong((id *)&v4->_glyphContainerView, v16);
    [(_CCUIBaseSliderContentView *)v15 addSubview:v16];
    [(CCUIBaseSliderView *)v4 setUsesBuiltInBackgroundView:1];
    v17 = objc_msgSend(MEMORY[0x1E4FB2120], "configurationWithTrackSize:", v10, v12);
    [v17 setPreferredInputMethods:1];
    objc_initWeak(&location, v4);
    id v18 = objc_alloc(MEMORY[0x1E4FB2118]);
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __36__CCUIBaseSliderView_initWithFrame___block_invoke;
    v25 = &unk_1E6AD4848;
    objc_copyWeak(&v26, &location);
    uint64_t v19 = [v18 initWithConfiguration:v17 handler:&v22];
    interaction = v4->_interaction;
    v4->_interaction = (_UIFluidSliderInteraction *)v19;

    -[CCUIBaseSliderView addInteraction:](v4, "addInteraction:", v4->_interaction, v22, v23, v24, v25);
    [(CCUIBaseSliderView *)v4 _configurePanGestureRecognizer];
    [(CCUIBaseSliderView *)v4 _configureButtonInteraction];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __36__CCUIBaseSliderView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleFluidSliderInteractionUpdate:v3];
}

- (void)setValue:(float)a3
{
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  float v4 = fmax(fmin(a3, 1.0), 0.0);
  if (self->_value != v4)
  {
    BOOL v5 = a4;
    self->_value = v4;
    [(_UIFluidSliderInteraction *)self->_interaction value];
    if ((BSFloatEqualToFloat() & 1) == 0)
    {
      if (v5)
      {
        double v7 = [(CCUIBaseSliderView *)self window];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __40__CCUIBaseSliderView_setValue_animated___block_invoke;
        v10[3] = &unk_1E6AD4870;
        v10[4] = self;
        float v11 = v4;
        +[CCUIContentModuleContext performWithoutAnimationWhileHiddenInWindow:v7 actions:v10];
      }
      else
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __40__CCUIBaseSliderView_setValue_animated___block_invoke_2;
        v8[3] = &unk_1E6AD4870;
        v8[4] = self;
        float v9 = v4;
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v8];
      }
    }
  }
}

uint64_t __40__CCUIBaseSliderView_setValue_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 568) setValue:*(float *)(a1 + 40)];
}

uint64_t __40__CCUIBaseSliderView_setValue_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 568) setValue:*(float *)(a1 + 40)];
}

- (float)presentationValue
{
  if (self->_lastInteractionUpdate)
  {
    [(_UIFluidSliderInteractionUpdate *)self->_lastInteractionUpdate value];
    return v2;
  }
  else
  {
    [(CCUIBaseSliderView *)self value];
  }
  return result;
}

- (void)setUsesBuiltInBackgroundView:(BOOL)a3
{
  if (self->_usesBuiltInBackgroundView != a3)
  {
    BOOL v3 = a3;
    self->_usesBuiltInBackgroundView = a3;
    [(UIView *)self->_backgroundView removeFromSuperview];
    backgroundView = self->_backgroundView;
    self->_backgroundView = 0;

    if (v3)
    {
      double v6 = [(CCUIBaseSliderView *)self createBackgroundView];
      double v7 = [(CCUIBaseSliderView *)self elasticContentBoundaryView];
      [v7 insertSubview:v6 atIndex:0];

      double v8 = [(CCUIBaseSliderView *)self elasticContentBoundaryView];
      [v8 bounds];
      -[UIView setFrame:](v6, "setFrame:");

      [(CCUIBaseSliderView *)self continuousSliderCornerRadius];
      -[UIView _setContinuousCornerRadius:](v6, "_setContinuousCornerRadius:");
      float v9 = self->_backgroundView;
      self->_backgroundView = v6;

      [(CCUIBaseSliderView *)self _updateBackgroundViewAppearance];
    }
  }
}

- (void)setContinuousSliderCornerRadius:(double)a3
{
  self->_continuousSliderCornerRadius = a3;
  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:");
}

- (void)setGlyphVisible:(BOOL)a3
{
  if (self->_glyphVisible != a3)
  {
    self->_glyphVisible = a3;
    [(CCUIBaseSliderView *)self setNeedsLayout];
  }
}

- (void)setGlyphScale:(double)a3
{
  if (self->_glyphScale != a3)
  {
    self->_glyphScale = a3;
    [(CCUIBaseSliderView *)self setNeedsLayout];
  }
}

- (void)setGlyphTintColor:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_glyphTintColor, a3);
    [(CCUIBaseSliderView *)self _updateGlyphTinting];
    [(CCUIBaseSliderView *)self _configureGroupRenderingMode];
  }
}

- (void)setInoperative:(BOOL)a3
{
  if (self->_inoperative != a3)
  {
    self->_inoperative = a3;
    -[_UIFluidSliderInteraction setLocked:](self->_interaction, "setLocked:");
    [(CCUIBaseSliderView *)self _updateHasInoperativeAppearance];
  }
}

- (void)setValueVisible:(BOOL)a3
{
  if (self->_valueVisible != a3)
  {
    self->_valueVisible = a3;
    [(CCUIBaseSliderView *)self _updateHasInoperativeAppearance];
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIBaseSliderView;
  [(CCUIBaseSliderView *)&v4 setUserInteractionEnabled:a3];
  [(CCUIBaseSliderView *)self _updateInteractionEnabled];
}

- (void)didMoveToWindow
{
  v7.receiver = self;
  v7.super_class = (Class)CCUIBaseSliderView;
  [(CCUIBaseSliderView *)&v7 didMoveToWindow];
  if ([(CCUIBaseSliderView *)self _isInAWindow])
  {
    [(CCUIBaseSliderView *)self _effectiveStretchAmount];
    double v4 = v3;
    id v5 = [(_UIFluidSliderInteraction *)self->_interaction configuration];
    double v6 = (void *)[v5 copy];

    [v6 setStretchAmount:v4];
    [(_UIFluidSliderInteraction *)self->_interaction setConfiguration:v6];
  }
}

- (void)layoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)CCUIBaseSliderView;
  [(CCUIBaseSliderView *)&v44 layoutSubviews];
  [(CCUIBaseSliderView *)self bounds];
  if (self->_sizeForValidConfiguration.width == v3 && self->_sizeForValidConfiguration.height == v4)
  {
    BOOL v13 = 0;
  }
  else
  {
    double v6 = v3;
    double v7 = v4;
    self->_sizeForValidConfiguration.width = v3;
    self->_sizeForValidConfiguration.height = v4;
    [(CCUIBaseSliderView *)self _effectiveStretchAmount];
    double v9 = v8;
    double v10 = [(_UIFluidSliderInteraction *)self->_interaction configuration];
    [v10 trackSize];
    BOOL v13 = v7 != v12 || v6 != v11;

    v14 = [(_UIFluidSliderInteraction *)self->_interaction configuration];
    v15 = objc_msgSend(v14, "copyWithTrackSize:", v6, v7);

    [v15 setStretchAmount:v9];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__CCUIBaseSliderView_layoutSubviews__block_invoke;
    aBlock[3] = &unk_1E6AD4340;
    aBlock[4] = self;
    id v16 = v15;
    id v43 = v16;
    v17 = (void (**)(void))_Block_copy(aBlock);
    if ([MEMORY[0x1E4FB1EB0] _isInAnimationBlockWithAnimationsEnabled]) {
      v17[2](v17);
    }
    else {
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v17];
    }
  }
  [(CCUIBaseSliderView *)self bounds];
  UIRectGetCenter();
  double v19 = v18;
  double v21 = v20;
  uint64_t v22 = [(CCUIBaseSliderView *)self elasticBackgroundContentView];
  uint64_t v23 = [(CCUIBaseSliderView *)self elasticContentView];
  objc_msgSend(v22, "setCenter:", v19, v21);
  objc_msgSend(v23, "setCenter:", v19, v21);
  if (self->_glyphVisible) {
    double v24 = 1.0;
  }
  else {
    double v24 = 0.0;
  }
  glyphImageView = self->_glyphImageView;
  if (glyphImageView)
  {
    [(UIImageView *)glyphImageView setAlpha:v24];
    memset(&v41, 0, sizeof(v41));
    double glyphScale = self->_glyphScale;
    if (fabs(glyphScale + -1.0) >= 2.22044605e-16)
    {
      CGAffineTransformMakeScale(&v41, glyphScale, self->_glyphScale);
    }
    else
    {
      long long v27 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v41.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v41.c = v27;
      *(_OWORD *)&v41.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    }
    objc_super v28 = self->_glyphImageView;
    CGAffineTransform v40 = v41;
    [(UIImageView *)v28 setTransform:&v40];
    compensatingGlyphView = self->_compensatingGlyphView;
    v30 = self;
    v31 = compensatingGlyphView;
    if (v30)
    {
      if (objc_opt_isKindOfClass()) {
        v32 = v31;
      }
      else {
        v32 = 0;
      }
    }
    else
    {
      v32 = 0;
    }
    v33 = v32;

    CGAffineTransform v40 = v41;
    [(CCUIPunchOutCompensating *)v33 setTransform:&v40];
  }
  glyphPackageView = self->_glyphPackageView;
  if (glyphPackageView)
  {
    [(CCUICAPackageView *)glyphPackageView setAlpha:v24];
    [(CCUICAPackageView *)self->_glyphPackageView setScale:self->_glyphScale];
    v35 = self->_compensatingGlyphView;
    v36 = self;
    v37 = v35;
    if (v36)
    {
      if (objc_opt_isKindOfClass()) {
        v38 = v37;
      }
      else {
        v38 = 0;
      }
    }
    else
    {
      v38 = 0;
    }
    v39 = v38;

    [(CCUIPunchOutCompensating *)v39 setScale:self->_glyphScale];
  }
  [(CCUIPunchOutCompensating *)self->_compensatingGlyphView ccui_setCompensationAlpha:v24];
  if (!v13) {
    [(CCUIBaseSliderView *)self layoutElasticContentViews];
  }
}

uint64_t __36__CCUIBaseSliderView_layoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 568) setConfiguration:*(void *)(a1 + 40)];
}

- (void)_layoutElasticContentContainers
{
  [(CCUIBaseSliderView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v23 = *MEMORY[0x1E4F1DAB8];
  long long v24 = v9;
  long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  lastInteractionUpdate = self->_lastInteractionUpdate;
  if (lastInteractionUpdate)
  {
    [(_UIFluidSliderInteractionUpdate *)lastInteractionUpdate trackBounds];
    double v6 = v11;
    double v8 = v12;
    double v14 = v13;
    double v16 = v15;
    v17 = self->_lastInteractionUpdate;
    if (v17)
    {
      [(_UIFluidSliderInteractionUpdate *)v17 trackTransform];
    }
    else
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v20 = 0u;
    }
    long long v23 = v20;
    long long v24 = v21;
    long long v25 = v22;
  }
  else
  {
    double v14 = v3;
    double v16 = v4;
  }
  double v18 = [(CCUIBaseSliderView *)self elasticBackgroundContentView];
  objc_msgSend(v18, "setBounds:", v6, v8, v14, v16);
  long long v20 = v23;
  long long v21 = v24;
  long long v22 = v25;
  [v18 setTransform:&v20];
  double v19 = [(CCUIBaseSliderView *)self elasticContentView];
  objc_msgSend(v19, "setBounds:", v6, v8, v14, v16);
  long long v20 = v23;
  long long v21 = v24;
  long long v22 = v25;
  [v19 setTransform:&v20];
}

- (void)layoutElasticContentViews
{
  double v3 = [(CCUIBaseSliderView *)self elasticContentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIView setFrame:](self->_elasticContentBoundaryView, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_glyphContainerView, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v5, v7, v9, v11);
  [(CCUIBaseSliderView *)self glyphCenter];
  double v13 = v12;
  double v15 = v14;
  -[UIImageView setCenter:](self->_glyphImageView, "setCenter:");
  -[CCUICAPackageView setCenter:](self->_glyphPackageView, "setCenter:", v13, v15);
  compensatingGlyphView = self->_compensatingGlyphView;
  -[CCUIPunchOutCompensating setCenter:](compensatingGlyphView, "setCenter:", v13, v15);
}

- (BOOL)isGroupRenderingRequired
{
  if (![(CCUIBaseSliderView *)self _usesVibrantGlyphStyling]) {
    return 0;
  }
  double v3 = [(CCUIBaseSliderView *)self punchOutRenderingViews];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (NSArray)punchOutRenderingViews
{
  double v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", self->_activeGlyphView, 0);
  return (NSArray *)v2;
}

- (void)contentModuleWillTransitionToExpandedContentMode:(BOOL)a3
{
  self->_expanded = a3;
}

- (NSArray)topLevelBlockingGestureRecognizers
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(CCUIBaseSliderView *)self isInteractiveWhenUnexpanded])
  {
    double v3 = [(CCUIBaseSliderView *)self _panGestureRecognizer];
    v8[0] = v3;
    BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    double v5 = [(CCUIBaseSliderView *)self _additionalTopLevelBlockingGestureRecognizers];
    double v6 = [v4 arrayByAddingObjectsFromArray:v5];
  }
  else
  {
    double v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v6;
}

- (void)setShouldIncludeVolumeButtonsInput:(BOOL)a3
{
  if (self->_shouldIncludeVolumeButtonsInput != a3)
  {
    BOOL v3 = a3;
    self->_shouldIncludeVolumeButtonsInput = a3;
    double v5 = [(_UIFluidSliderInteraction *)self->_interaction configuration];
    id v8 = (id)[v5 copy];

    unint64_t v6 = [v8 preferredInputMethods] & 0xFFFFFFFFFFFFFFFDLL;
    uint64_t v7 = 2;
    if (!v3) {
      uint64_t v7 = 0;
    }
    [v8 setPreferredInputMethods:v6 | v7];
    [(_UIFluidSliderInteraction *)self->_interaction setConfiguration:v8];
    [(CCUIBaseSliderView *)self _configurePanGestureRecognizer];
    [(CCUIBaseSliderView *)self _configureButtonInteraction];
  }
}

- (void)setElasticContentStretchAmount:(double)a3
{
  if (self->_elasticContentStretchAmount != a3)
  {
    self->_elasticContentStretchAmount = a3;
    __asm { FMOV            V0.2D, #-1.0 }
    self->_sizeForValidConfiguration = _Q0;
    [(CCUIBaseSliderView *)self setNeedsLayout];
  }
}

- (double)presentationLayoutValue
{
  BOOL v3 = self->_lastInteractionUpdate;
  BOOL v4 = v3;
  if (v3
    && ([(_UIFluidSliderInteractionUpdate *)v3 trackBounds],
        double v6 = v5,
        double v8 = v7,
        [(_UIFluidSliderInteractionUpdate *)v4 barFrame],
        v6 > 0.0)
    && v8 > 0.0)
  {
    if (v6 <= v8) {
      double v11 = v10 / v8;
    }
    else {
      double v11 = v9 / v6;
    }
  }
  else
  {
    [(CCUIBaseSliderView *)self presentationValue];
    double v11 = v12;
  }

  return v11;
}

- (BOOL)shouldIntegralizeContentLayout
{
  [(CCUIBaseSliderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(CCUIBaseSliderView *)self elasticContentView];
  [v7 bounds];
  BOOL v10 = v6 == v9 && v4 == v8;

  return v10;
}

- (BOOL)shouldIntegralizeValueLayout
{
  BOOL v3 = [(CCUIBaseSliderView *)self shouldIntegralizeContentLayout];
  if (v3)
  {
    LOBYTE(v3) = [(CCUIBaseSliderView *)self _isInteractionStable];
  }
  return v3;
}

- (id)createBackgroundView
{
  return +[CCUIControlCenterMaterialView controlCenterModuleBackgroundMaterial];
}

- (void)setName:(id)a3
{
  id v6 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    double v4 = (NSString *)[v6 copy];
    name = self->_name;
    self->_name = v4;

    [(CCUIBaseSliderView *)self _configureButtonInteraction];
  }
}

- (BOOL)shouldProvideBuiltInFeedback
{
  return [(_UIFluidSliderInteraction *)self->_interaction _feedbackEnabled];
}

- (void)setShouldProvideBuiltInFeedback:(BOOL)a3
{
}

- (BOOL)shouldScaleWithButtonInput
{
  return [(_UIFluidSliderInteraction *)self->_interaction _shouldScaleOnIndirectInput];
}

- (void)setShouldScaleWithButtonInput:(BOOL)a3
{
}

- (void)setShouldRelaxVisibilityRequirementForButtonInput:(BOOL)a3
{
  if (self->_shouldRelaxVisibilityRequirementForButtonInput != a3)
  {
    self->_shouldRelaxVisibilityRequirementForButtonInput = a3;
    [(CCUIBaseSliderView *)self _configureButtonInteraction];
  }
}

- (unint64_t)buttonInputStepCount
{
  double v2 = [(_UIFluidSliderInteraction *)self->_interaction configuration];
  unint64_t v3 = [v2 stepCount];

  return v3;
}

- (void)setButtonInputStepCount:(unint64_t)a3
{
  if ([(CCUIBaseSliderView *)self buttonInputStepCount] != a3)
  {
    double v5 = [(_UIFluidSliderInteraction *)self->_interaction configuration];
    id v6 = (id)[v5 copy];

    [v6 setStepCount:a3];
    [(_UIFluidSliderInteraction *)self->_interaction setConfiguration:v6];
  }
}

- (void)_setActiveGlyphView:(id)a3
{
  p_activeGlyphView = &self->_activeGlyphView;
  id v10 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_activeGlyphView, a3);
    [(CCUIPunchOutCompensating *)self->_compensatingGlyphView removeFromSuperview];
    id v6 = [(CCUIGlyphTinting *)*p_activeGlyphView ccui_punchOutCompensatingCopy];
    compensatingGlyphView = self->_compensatingGlyphView;
    self->_compensatingGlyphView = v6;

    [(CCUIPunchOutCompensating *)self->_compensatingGlyphView setAutoresizingMask:0];
    [(CCUIPunchOutCompensating *)self->_compensatingGlyphView setTintAdjustmentMode:1];
    double v8 = 1.0;
    if (!self->_glyphVisible) {
      double v8 = 0.0;
    }
    [(CCUIPunchOutCompensating *)self->_compensatingGlyphView ccui_setCompensationAlpha:v8];
    double v9 = [(CCUIBaseSliderView *)self glyphContainerView];
    [v9 addSubview:self->_compensatingGlyphView];

    [(CCUIBaseSliderView *)self _updateGlyphTinting];
  }
}

- (void)setGlyphImage:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_glyphImage != v5)
  {
    double v18 = v5;
    objc_storeStrong((id *)&self->_glyphImage, a3);
    glyphImageView = self->_glyphImageView;
    if (self->_glyphImage)
    {
      if (!glyphImageView)
      {
        id v7 = objc_alloc(MEMORY[0x1E4FB1838]);
        double v8 = (UIImageView *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        double v9 = self->_glyphImageView;
        self->_glyphImageView = v8;

        [(UIImageView *)self->_glyphImageView setContentMode:4];
        [(UIImageView *)self->_glyphImageView setTintAdjustmentMode:1];
        [(UIImageView *)self->_glyphImageView setUserInteractionEnabled:0];
        id v10 = [(CCUIBaseSliderView *)self glyphContainerView];
        [v10 addSubview:self->_glyphImageView];

        glyphImageView = self->_glyphImageView;
      }
      [(UIImageView *)glyphImageView setImage:v18];
      [(UIImageView *)self->_glyphImageView sizeToFit];
      double v11 = 1.0;
      if (!self->_glyphVisible) {
        double v11 = 0.0;
      }
      [(UIImageView *)self->_glyphImageView setAlpha:v11];
      [(CCUIBaseSliderView *)self _setActiveGlyphView:self->_glyphImageView];
      compensatingGlyphView = self->_compensatingGlyphView;
      double v13 = self;
      double v14 = compensatingGlyphView;
      if (v13)
      {
        if (objc_opt_isKindOfClass()) {
          double v15 = v14;
        }
        else {
          double v15 = 0;
        }
      }
      else
      {
        double v15 = 0;
      }
      v17 = v15;

      [(CCUIPunchOutCompensating *)v17 setImage:v18];
      [(CCUIPunchOutCompensating *)v17 sizeToFit];

      [(CCUIBaseSliderView *)self _configureGroupRenderingMode];
      [(CCUIBaseSliderView *)self setGlyphPackageDescription:0];
    }
    else
    {
      [(UIImageView *)glyphImageView removeFromSuperview];
      double v16 = self->_glyphImageView;
      self->_glyphImageView = 0;
    }
    double v5 = v18;
  }
}

- (void)setGlyphPackageDescription:(id)a3
{
  double v5 = (CCUICAPackageDescription *)a3;
  p_glyphPackageDescription = &self->_glyphPackageDescription;
  if (self->_glyphPackageDescription != v5)
  {
    double v19 = v5;
    objc_storeStrong((id *)&self->_glyphPackageDescription, a3);
    glyphPackageView = self->_glyphPackageView;
    if (*p_glyphPackageDescription)
    {
      if (!glyphPackageView)
      {
        double v8 = objc_alloc_init(CCUICAPackageView);
        double v9 = self->_glyphPackageView;
        self->_glyphPackageView = v8;

        [(CCUICAPackageView *)self->_glyphPackageView setAutoresizingMask:0];
        id v10 = [(CCUIBaseSliderView *)self glyphContainerView];
        [v10 addSubview:self->_glyphPackageView];

        glyphPackageView = self->_glyphPackageView;
      }
      -[CCUICAPackageView setPackageDescription:](glyphPackageView, "setPackageDescription:");
      [(CCUIBaseSliderView *)self _setActiveGlyphView:self->_glyphPackageView];
      compensatingGlyphView = self->_compensatingGlyphView;
      float v12 = self;
      double v13 = compensatingGlyphView;
      if (v12)
      {
        if (objc_opt_isKindOfClass()) {
          double v14 = v13;
        }
        else {
          double v14 = 0;
        }
      }
      else
      {
        double v14 = 0;
      }
      double v16 = v14;

      [(CCUIPunchOutCompensating *)v16 setPackageDescription:*p_glyphPackageDescription];
      v17 = [(CCUIBaseSliderView *)self glyphState];
      [(CCUIBaseSliderView *)self _applyGlyphState:v17 performConfiguration:1];

      double v18 = 1.0;
      if (!self->_glyphVisible) {
        double v18 = 0.0;
      }
      [(CCUICAPackageView *)self->_glyphPackageView setAlpha:v18];
      [(CCUIBaseSliderView *)self setGlyphImage:0];
    }
    else
    {
      [(CCUICAPackageView *)glyphPackageView removeFromSuperview];
      double v15 = self->_glyphPackageView;
      self->_glyphPackageView = 0;
    }
    double v5 = v19;
  }
}

- (void)_applyGlyphState:(id)a3 performConfiguration:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (__CFString *)a3;
  glyphPackageView = self->_glyphPackageView;
  if (glyphPackageView) {
    BOOL v8 = @"*" == v6;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    [(CCUICAPackageView *)glyphPackageView setStateName:v6];
    compensatingGlyphView = self->_compensatingGlyphView;
    id v10 = self;
    double v11 = compensatingGlyphView;
    if (v10)
    {
      if (objc_opt_isKindOfClass()) {
        float v12 = v11;
      }
      else {
        float v12 = 0;
      }
    }
    else
    {
      float v12 = 0;
    }
    double v13 = v12;

    [(CCUIPunchOutCompensating *)v13 setStateName:v6];
    if (v4)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __60__CCUIBaseSliderView__applyGlyphState_performConfiguration___block_invoke;
      v14[3] = &unk_1E6AD41E8;
      v14[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v14];
      [(CCUIBaseSliderView *)self _configureGroupRenderingMode];
      [(CCUIBaseSliderView *)self _updateGlyphTinting];
    }
  }
}

uint64_t __60__CCUIBaseSliderView__applyGlyphState_performConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (BOOL)_usesVibrantGlyphStyling
{
  return self->_glyphTintColor == 0;
}

- (void)_updateGlyphTinting
{
  BOOL v3 = [(CCUIBaseSliderView *)self _usesVibrantGlyphStyling];
  compensatingGlyphView = self->_compensatingGlyphView;
  if (v3)
  {
    [(CCUIPunchOutCompensating *)compensatingGlyphView setHidden:0];
    [(CCUIPunchOutCompensating *)self->_compensatingGlyphView ccui_updatePunchOutCompensationIfNecessary];
  }
  else
  {
    [(CCUIPunchOutCompensating *)compensatingGlyphView setHidden:1];
  }
  activeGlyphView = self->_activeGlyphView;
  id v6 = [(CCUIBaseSliderView *)self glyphTintColor];
  [(CCUIGlyphTinting *)activeGlyphView ccui_applyGlyphTintColor:v6];
}

- (void)_configureGroupRenderingMode
{
  uint64_t v3 = [(CCUIBaseSliderView *)self _usesVibrantGlyphStyling];
  [self ccui_configureForGroupRenderingMode:v3];
}

- (void)_setGlyphState:(id)a3
{
  double v5 = (__CFString *)a3;
  glyphState = (__CFString *)self->_glyphState;
  if (glyphState != v5)
  {
    BOOL v7 = glyphState == @"*";
    BOOL v8 = v5;
    objc_storeStrong((id *)&self->_glyphState, a3);
    [(CCUIBaseSliderView *)self _applyGlyphState:self->_glyphState performConfiguration:v7];
    double v5 = v8;
  }
}

- (void)setGlyphState:(id)a3
{
  BOOL v4 = @"*";
  if (a3) {
    BOOL v4 = (__CFString *)a3;
  }
  double v5 = v4;
  [(CCUIBaseSliderView *)self _setGlyphState:v5];
}

- (CGPoint)glyphCenter
{
  uint64_t v3 = [(CCUIBaseSliderView *)self glyphContainerView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5 * 0.5;
  double v9 = v7 - v5 * 0.5;
  if ([(CCUIBaseSliderView *)self shouldIntegralizeContentLayout])
  {
    id v10 = [(CCUIBaseSliderView *)self traitCollection];
    [v10 displayScale];
    UIPointRoundToScale();
    double v12 = v11;
    double v14 = v13;

    double v15 = v12;
    double v16 = v14;
  }
  else
  {
    double v15 = v8;
    double v16 = v9;
  }
  result.y = v16;
  result.x = v15;
  return result;
}

- (UIPanGestureRecognizer)_panGestureRecognizer
{
  return (UIPanGestureRecognizer *)[(_UIFluidSliderInteraction *)self->_interaction _panGestureRecognizer];
}

- (id)_additionalTopLevelBlockingGestureRecognizers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (double)_length
{
  [(CCUIBaseSliderView *)self bounds];
  if (v2 <= v3) {
    return v3;
  }
  else {
    return v2;
  }
}

- (void)_configurePanGestureRecognizer
{
  id v2 = [(CCUIBaseSliderView *)self _panGestureRecognizer];
  [v2 setCancelsTouchesInView:0];
  [v2 setDelaysTouchesEnded:0];
}

- (void)_configureButtonInteraction
{
  id v4 = [(_UIFluidSliderInteraction *)self->_interaction _volumeButtonInteraction];
  if (v4)
  {
    objc_msgSend(v4, "_setWantsRelaxedVisibilityRequirement:", -[CCUIBaseSliderView shouldRelaxVisibilityRequirementForButtonInput](self, "shouldRelaxVisibilityRequirementForButtonInput"));
    double v3 = [(CCUIBaseSliderView *)self name];
    [v4 _setName:v3];
  }
}

- (void)_updateBackgroundViewAppearance
{
  BOOL v3 = [(CCUIBaseSliderView *)self hasInoperativeAppearance];
  double v6 = self->_backgroundView;
  id v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(UIView *)v6 setHasInoperativeAppearance:v3];
  }
}

- (double)_effectiveStretchAmount
{
  [(CCUIBaseSliderView *)self elasticContentStretchAmount];
  double v4 = v3;
  double v5 = [(CCUIBaseSliderView *)self traitCollection];
  [v5 displayScale];
  if (v4 >= 0.0)
  {
    if (v4 > 0.0 && v4 < 1.0)
    {
      [(CCUIBaseSliderView *)self _length];
      UIFloorToScale();
      double v4 = v11;
    }
  }
  else
  {
    [(CCUIBaseSliderView *)self _length];
    double v6 = [(CCUIBaseSliderView *)self window];
    [v6 bounds];

    if (!self->_expanded) {
      CCUILayoutGutter();
    }
    UIRoundToScale();
    double v8 = v7;
    UIRoundToScale();
    if (v9 <= v8) {
      double v4 = v9;
    }
    else {
      double v4 = v8;
    }
  }

  return v4;
}

- (BOOL)_isInteractionStable
{
  lastInteractionUpdate = self->_lastInteractionUpdate;
  return !lastInteractionUpdate
      || [(_UIFluidSliderInteractionUpdate *)lastInteractionUpdate interactionState] == 0;
}

- (void)_handleFluidSliderInteractionUpdate:(id)a3
{
  id v25 = a3;
  double v5 = self->_lastInteractionUpdate;
  double v6 = v5;
  if (v5) {
    BOOL v7 = [(_UIFluidSliderInteractionUpdate *)v5 interactionState] == 1;
  }
  else {
    BOOL v7 = 0;
  }
  uint64_t v8 = [v25 interactionState];
  BOOL v9 = [(CCUIBaseSliderView *)self isEditingValue];
  [(CCUIBaseSliderView *)self presentationValue];
  float v11 = v10;
  [(CCUIBaseSliderView *)self value];
  float v13 = v12;
  BOOL shouldSendEditingControlEvents = self->_shouldSendEditingControlEvents;
  char v15 = [(_UIFluidSliderInteraction *)self->_interaction isLocked];
  BOOL v16 = shouldSendEditingControlEvents;
  if (!v7 && v8 == 1)
  {
    v17 = v25;
    if (v15) {
      goto LABEL_10;
    }
    BOOL v16 = 1;
    self->_editingValue = 1;
    self->_BOOL shouldSendEditingControlEvents = 1;
    if (v9) {
      goto LABEL_10;
    }
    [(CCUIBaseSliderView *)self sendActionsForControlEvents:0x10000];
  }
  v17 = v25;
LABEL_10:
  if ([v17 interactionState] == 1) {
    int v18 = [v25 isTracking] ^ 1;
  }
  else {
    int v18 = 0;
  }
  int isReceivingIndirectInputUpdates = self->_isReceivingIndirectInputUpdates;
  self->_int isReceivingIndirectInputUpdates = v18;
  int v20 = isReceivingIndirectInputUpdates == v18 || !v16;
  if ((v20 & 1) == 0 && v18) {
    [(CCUIBaseSliderView *)self sendActionsForControlEvents:CCUIBaseSliderViewControlEventIndirectInputDidBegin];
  }
  objc_storeStrong((id *)&self->_lastInteractionUpdate, a3);
  [(_UIFluidSliderInteraction *)self->_interaction value];
  *(float *)&double v21 = fmax(fmin(v21, 1.0), 0.0);
  self->_value = *(float *)&v21;
  [(CCUIBaseSliderView *)self _layoutElasticContentContainers];
  [(CCUIBaseSliderView *)self layoutElasticContentViews];
  [(CCUIBaseSliderView *)self value];
  if (v13 != v22) {
    [(CCUIBaseSliderView *)self sendActionsForControlEvents:4096];
  }
  [(CCUIBaseSliderView *)self presentationValue];
  if (v11 != v23) {
    [(CCUIBaseSliderView *)self sendActionsForControlEvents:CCUIBaseSliderViewControlEventPresentationValueChanged];
  }
  if (((v20 | v18) & 1) == 0) {
    [(CCUIBaseSliderView *)self sendActionsForControlEvents:CCUIBaseSliderViewControlEventIndirectInputDidEnd];
  }
  if ([(CCUIBaseSliderView *)self _isInteractionStable])
  {
    self->_editingValue = 0;
    self->_BOOL shouldSendEditingControlEvents = 0;
    if (v9 && v16) {
      [(CCUIBaseSliderView *)self sendActionsForControlEvents:0x40000];
    }
  }
  if ([(_UIFluidSliderInteractionUpdate *)v6 isTracking]
    && ([v25 isTracking] & 1) == 0)
  {
    long long v24 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v24 _deactivateReachability];
  }
}

- (float)value
{
  return self->_value;
}

- (BOOL)isEditingValue
{
  return self->_editingValue;
}

- (BOOL)usesBuiltInBackgroundView
{
  return self->_usesBuiltInBackgroundView;
}

- (double)continuousSliderCornerRadius
{
  return self->_continuousSliderCornerRadius;
}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (CCUICAPackageDescription)glyphPackageDescription
{
  return self->_glyphPackageDescription;
}

- (NSString)glyphState
{
  return self->_glyphState;
}

- (BOOL)isGlyphVisible
{
  return self->_glyphVisible;
}

- (UIColor)glyphTintColor
{
  return self->_glyphTintColor;
}

- (BOOL)isInteractiveWhenUnexpanded
{
  return self->_interactiveWhenUnexpanded;
}

- (void)setInteractiveWhenUnexpanded:(BOOL)a3
{
  self->_interactiveWhenUnexpanded = a3;
}

- (_UIFluidSliderInteraction)interaction
{
  return self->_interaction;
}

- (UIView)elasticBackgroundContentView
{
  return self->_elasticBackgroundContentView;
}

- (UIView)elasticContentBoundaryView
{
  return self->_elasticContentBoundaryView;
}

- (UIView)glyphContainerView
{
  return self->_glyphContainerView;
}

- (BOOL)shouldRelaxVisibilityRequirementForButtonInput
{
  return self->_shouldRelaxVisibilityRequirementForButtonInput;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)behaviorIdentifier
{
  return self->_behaviorIdentifier;
}

- (void)setBehaviorIdentifier:(unint64_t)a3
{
  self->_behaviorIdentifier = a3;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)elasticContentView
{
  return self->_elasticContentView;
}

- (BOOL)shouldIncludeVolumeButtonsInput
{
  return self->_shouldIncludeVolumeButtonsInput;
}

- (double)elasticContentStretchAmount
{
  return self->_elasticContentStretchAmount;
}

- (BOOL)hasInoperativeAppearance
{
  return self->_hasInoperativeAppearance;
}

- (double)glyphScale
{
  return self->_glyphScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elasticContentView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_glyphContainerView, 0);
  objc_storeStrong((id *)&self->_elasticContentBoundaryView, 0);
  objc_storeStrong((id *)&self->_elasticBackgroundContentView, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_glyphTintColor, 0);
  objc_storeStrong((id *)&self->_glyphState, 0);
  objc_storeStrong((id *)&self->_glyphPackageDescription, 0);
  objc_storeStrong((id *)&self->_glyphImage, 0);
  objc_storeStrong((id *)&self->_lastInteractionUpdate, 0);
  objc_storeStrong((id *)&self->_compensatingGlyphView, 0);
  objc_storeStrong((id *)&self->_activeGlyphView, 0);
  objc_storeStrong((id *)&self->_glyphPackageView, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
}

@end