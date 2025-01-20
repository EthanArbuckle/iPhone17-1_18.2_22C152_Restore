@interface HUQuickControlSwitchView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)_createDecorationIconViewIfNecessary;
- (CGPoint)_knobCenterForMetrics:(id)a3 switchValue:(double)a4;
- (CGRect)_knobFrameForMetrics:(id)a3 switchValue:(double)a4;
- (CGSize)_knobSizeForMetrics:(id)a3;
- (CGSize)intrinsicContentSize;
- (HUDynamicFormattingLabel)supplementaryValueLabel;
- (HUIconView)decorationIconView;
- (HUQuickControlSwitchView)initWithProfile:(id)a3;
- (HUQuickControlSwitchViewProfile)profile;
- (UIImpactFeedbackGenerator)feedbackGenerator;
- (UIView)knobView;
- (UIView)wellView;
- (double)clippedValue;
- (double)switchValue;
- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3;
- (id)value;
- (unint64_t)reachabilityState;
- (void)_actuateTapticFeedback;
- (void)_createSupplementaryValueLabelIfNecessary;
- (void)_prepareForTapticFeedback;
- (void)_updateDecorationIconDescriptorAnimated:(BOOL)a3;
- (void)_updateKnobViewTintColorAnimated:(BOOL)a3;
- (void)_updateSupplementaryValueLabelAnimated:(BOOL)a3;
- (void)_updateUIForReachabilityState:(unint64_t)a3;
- (void)layoutSubviews;
- (void)setClippedValue:(double)a3;
- (void)setDecorationIconView:(id)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setKnobView:(id)a3;
- (void)setProfile:(id)a3;
- (void)setReachabilityState:(unint64_t)a3;
- (void)setSupplementaryValueLabel:(id)a3;
- (void)setSwitchValue:(double)a3;
- (void)setValue:(id)a3;
- (void)setWellView:(id)a3;
@end

@implementation HUQuickControlSwitchView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUQuickControlSwitchView)initWithProfile:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HUQuickControlSwitchView;
  v6 = [(HUQuickControlSwitchView *)&v25 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    v7->_reachabilityState = 0;
    if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
    {
      v8 = [MEMORY[0x1E4F5AE10] controlCenterTertiaryMaterial];
      [(HUQuickControlSwitchView *)v7 setWellView:v8];
    }
    else
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
      [(HUQuickControlSwitchView *)v7 setWellView:v9];

      v8 = [MEMORY[0x1E4F428B8] quaternarySystemFillColor];
      v10 = [(HUQuickControlSwitchView *)v7 wellView];
      [v10 setBackgroundColor:v8];
    }
    v11 = [(HUQuickControlSwitchView *)v7 wellView];
    [v11 setAutoresizingMask:18];

    v12 = [(HUQuickControlSwitchView *)v7 wellView];
    [v12 setClipsToBounds:1];

    v13 = [(HUQuickControlSwitchView *)v7 wellView];
    [(HUQuickControlSwitchView *)v7 addSubview:v13];

    id v14 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [(HUQuickControlSwitchView *)v7 setKnobView:v14];

    v15 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    v16 = [(HUQuickControlSwitchView *)v7 knobView];
    [v16 setBackgroundColor:v15];

    v17 = [(HUQuickControlSwitchView *)v7 knobView];
    [v17 setClipsToBounds:1];

    v18 = [(HUQuickControlSwitchView *)v7 knobView];
    v19 = [v18 layer];
    [v19 setMasksToBounds:0];

    v20 = [(HUQuickControlSwitchView *)v7 knobView];
    [(HUQuickControlSwitchView *)v7 addSubview:v20];

    v21 = [(HUQuickControlSwitchView *)v7 layer];
    [v21 setAllowsGroupOpacity:0];

    LODWORD(v22) = 1148846080;
    [(HUQuickControlSwitchView *)v7 setContentHuggingPriority:0 forAxis:v22];
    LODWORD(v23) = 1148846080;
    [(HUQuickControlSwitchView *)v7 setContentHuggingPriority:1 forAxis:v23];
    [(HUQuickControlSwitchView *)v7 _updateDecorationIconDescriptorAnimated:0];
    [(HUQuickControlSwitchView *)v7 _updateSupplementaryValueLabelAnimated:0];
    [(HUQuickControlSwitchView *)v7 _updateKnobViewTintColorAnimated:0];
    [(HUQuickControlSwitchView *)v7 _prepareForTapticFeedback];
  }

  return v7;
}

- (void)setSwitchValue:(double)a3
{
  double v4 = fmin(fmax(a3, 0.0), 1.0);
  [(HUQuickControlSwitchView *)self clippedValue];
  BOOL v6 = v4 > 0.5 && v5 < 0.5;
  if (v6
    || (([(HUQuickControlSwitchView *)self clippedValue], v4 < 0.5) ? (BOOL v8 = v7 <= 0.5) : (BOOL v8 = 1), !v8))
  {
    [(HUQuickControlSwitchView *)self _actuateTapticFeedback];
  }
  [(HUQuickControlSwitchView *)self setClippedValue:v4];
  double switchValue = self->_switchValue;
  [(HUQuickControlSwitchView *)self clippedValue];
  if (switchValue != v10)
  {
    [(HUQuickControlSwitchView *)self clippedValue];
    self->_double switchValue = v11;
    [(HUQuickControlSwitchView *)self setNeedsLayout];
    if ([MEMORY[0x1E4F42FF0] _isInAnimationBlock]) {
      [(HUQuickControlSwitchView *)self layoutIfNeeded];
    }
    [(HUQuickControlSwitchView *)self _updateKnobViewTintColorAnimated:1];
  }
}

- (CGSize)intrinsicContentSize
{
  v2 = [(HUQuickControlSwitchView *)self profile];
  v3 = HUQuickControlSliderMetricsForControlSize([v2 controlSize]);
  double v4 = [v3 sizeDescriptor];
  [v4 intrinsicSize];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  v41.receiver = self;
  v41.super_class = (Class)HUQuickControlSwitchView;
  [(HUQuickControlSwitchView *)&v41 layoutSubviews];
  v3 = [(HUQuickControlSwitchView *)self profile];
  double v4 = HUDefaultSwitchMetrics[[v3 controlSize]];

  [(HUQuickControlSwitchView *)self switchValue];
  [(HUQuickControlSwitchView *)self _knobFrameForMetrics:v4 switchValue:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [(HUQuickControlSwitchView *)self knobView];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  v15 = [(HUQuickControlSwitchView *)self knobView];
  [v15 frame];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = [(HUQuickControlSwitchView *)self decorationIconView];
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

  objc_super v25 = [(HUQuickControlSwitchView *)self profile];
  v26 = HUQuickControlSliderMetricsForControlSize([v25 controlSize]);
  [v26 widthToCornerRadiusRatio];
  double v28 = v27;
  [(HUQuickControlSwitchView *)self bounds];
  double v30 = v28 * v29;

  v31 = [(HUQuickControlSwitchView *)self wellView];
  [v31 _setContinuousCornerRadius:v30];

  v32 = [(HUQuickControlSwitchView *)self knobView];
  objc_msgSend(v32, "_setContinuousCornerRadius:", fmax(v30 + -8.0, 0.0));

  [(HUQuickControlSwitchView *)self _knobFrameForMetrics:v4 switchValue:0.0];
  CGRect v43 = CGRectInset(v42, 4.0, 0.0);
  double x = v43.origin.x;
  double y = v43.origin.y;
  double width = v43.size.width;
  double height = v43.size.height;
  v37 = [(HUQuickControlSwitchView *)self supplementaryValueLabel];
  objc_msgSend(v37, "setFrame:", x, y, width, height);

  v38 = [(HUQuickControlSwitchView *)self supplementaryValueLabel];
  [(HUQuickControlSwitchView *)self bringSubviewToFront:v38];

  v39 = [(HUQuickControlSwitchView *)self knobView];
  [(HUQuickControlSwitchView *)self bringSubviewToFront:v39];

  v40 = [(HUQuickControlSwitchView *)self decorationIconView];
  [(HUQuickControlSwitchView *)self bringSubviewToFront:v40];

  [(HUQuickControlSwitchView *)self _updateUIForReachabilityState:[(HUQuickControlSwitchView *)self reachabilityState]];
}

- (CGRect)_knobFrameForMetrics:(id)a3 switchValue:(double)a4
{
  -[HUQuickControlSwitchView _knobSizeForMetrics:](self, "_knobSizeForMetrics:");
  [(HUQuickControlSwitchView *)self _knobCenterForMetrics:a3.var0 switchValue:a4];

  UIRectCenteredAboutPoint();
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (CGSize)_knobSizeForMetrics:(id)a3
{
  [(HUQuickControlSwitchView *)self bounds];
  double v6 = v5 + -16.0;
  [(HUQuickControlSwitchView *)self bounds];
  double v8 = a3.var0 * v7;
  double v9 = v6;
  result.double height = v8;
  result.double width = v9;
  return result;
}

- (CGPoint)_knobCenterForMetrics:(id)a3 switchValue:(double)a4
{
  CGFloat v6 = *MEMORY[0x1E4F1DAD8];
  CGFloat v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(HUQuickControlSwitchView *)self _knobSizeForMetrics:a3.var0];
  v16.size.double width = v8;
  v16.size.double height = v9;
  v16.origin.double x = v6;
  v16.origin.double y = v7;
  CGRect v17 = CGRectInset(v16, -8.0, -8.0);
  double height = v17.size.height;
  [(HUQuickControlSwitchView *)self bounds];
  double v12 = height * 0.5 + (height * 0.5 + v11 - height - height * 0.5) * (1.0 - a4);
  [(HUQuickControlSwitchView *)self bounds];
  double MidX = CGRectGetMidX(v18);
  double v14 = v12;
  result.double y = v14;
  result.double x = MidX;
  return result;
}

- (void)_updateKnobViewTintColorAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__HUQuickControlSwitchView__updateKnobViewTintColorAnimated___block_invoke;
  aBlock[3] = &unk_1E6386018;
  aBlock[4] = self;
  double v4 = _Block_copy(aBlock);
  double v5 = v4;
  if (v3)
  {
    CGFloat v6 = +[HUAnimationSettings settingsWithDuration:3 curve:0.15];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__HUQuickControlSwitchView__updateKnobViewTintColorAnimated___block_invoke_2;
    v8[3] = &unk_1E638DF50;
    id v9 = v5;
    id v7 = +[HUAnimationApplier applyAnimationSettings:v6 withStaticApplier:v8 completion:0];
  }
  else
  {
    (*((void (**)(void *))v4 + 2))(v4);
  }
}

void __61__HUQuickControlSwitchView__updateKnobViewTintColorAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) switchValue];
  if (v2 > 0.5 && [*(id *)(a1 + 32) reachabilityState] == 2)
  {
    id v5 = [*(id *)(a1 + 32) profile];
    BOOL v3 = [v5 tintColor];
    double v4 = [*(id *)(a1 + 32) knobView];
    [v4 setBackgroundColor:v3];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F428B8] systemMidGrayColor];
    BOOL v3 = [*(id *)(a1 + 32) knobView];
    [v3 setBackgroundColor:v5];
  }
}

uint64_t __61__HUQuickControlSwitchView__updateKnobViewTintColorAnimated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_prepareForTapticFeedback
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F42AA8]);
  [(HUQuickControlSwitchView *)self setFeedbackGenerator:v3];

  id v4 = [(HUQuickControlSwitchView *)self feedbackGenerator];
  [v4 prepare];
}

- (void)_actuateTapticFeedback
{
  id v3 = [(HUQuickControlSwitchView *)self feedbackGenerator];
  [v3 impactOccurred];

  id v4 = [(HUQuickControlSwitchView *)self feedbackGenerator];
  [v4 prepare];
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  id v3 = HUQuickControlSliderMetricsForControlSize(a3);
  id v4 = [v3 sizeDescriptor];

  return v4;
}

- (id)value
{
  double v2 = NSNumber;
  [(HUQuickControlSwitchView *)self switchValue];

  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (void)setValue:(id)a3
{
  [a3 doubleValue];

  -[HUQuickControlSwitchView setSwitchValue:](self, "setSwitchValue:");
}

- (void)setProfile:(id)a3
{
  id v4 = (HUQuickControlSwitchViewProfile *)a3;
  unint64_t v5 = [(HUQuickControlViewProfile *)self->_profile controlSize];
  uint64_t v6 = [(HUQuickControlViewProfile *)v4 controlSize];
  profile = self->_profile;
  self->_profile = v4;

  if (v5 != v6)
  {
    [(HUQuickControlSwitchView *)self invalidateIntrinsicContentSize];
    [(HUQuickControlSwitchView *)self setNeedsLayout];
  }
  [(HUQuickControlSwitchView *)self _updateDecorationIconDescriptorAnimated:1];
  [(HUQuickControlSwitchView *)self _updateSupplementaryValueLabelAnimated:1];

  [(HUQuickControlSwitchView *)self _updateKnobViewTintColorAnimated:1];
}

- (void)_updateDecorationIconDescriptorAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(HUQuickControlSwitchView *)self profile];
  uint64_t v6 = [v5 decorationIconDescriptor];

  if (v6)
  {
    uint64_t v7 = v3 & ~[(HUQuickControlSwitchView *)self _createDecorationIconViewIfNecessary];
    id v11 = [(HUQuickControlSwitchView *)self decorationIconView];
    CGFloat v8 = [(HUQuickControlSwitchView *)self profile];
    id v9 = [v8 decorationIconDescriptor];
    [v11 updateWithIconDescriptor:v9 displayStyle:3 animated:v7];
  }
  else
  {
    double v10 = [(HUQuickControlSwitchView *)self decorationIconView];
    [v10 removeFromSuperview];

    [(HUQuickControlSwitchView *)self setDecorationIconView:0];
  }
}

- (void)_updateSupplementaryValueLabelAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v16 = [(HUQuickControlSwitchView *)self supplementaryValueLabel];
  unint64_t v5 = [v16 dynamicFormattingValue];
  uint64_t v6 = [(HUQuickControlSwitchView *)self profile];
  uint64_t v7 = [v6 supplementaryFormattedValue];
  id v8 = v5;
  id v9 = v7;
  if (v8 == v9)
  {
  }
  else
  {
    double v10 = v9;
    if (v8)
    {
      char v11 = [v8 isEqual:v9];

      if (v11) {
        return;
      }
    }
    else
    {
    }
    [(HUQuickControlSwitchView *)self _createSupplementaryValueLabelIfNecessary];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__HUQuickControlSwitchView__updateSupplementaryValueLabelAnimated___block_invoke;
    aBlock[3] = &unk_1E6386018;
    aBlock[4] = self;
    double v12 = _Block_copy(aBlock);
    double v13 = v12;
    if (v3)
    {
      double v14 = (void *)MEMORY[0x1E4F42FF0];
      v15 = [(HUQuickControlSwitchView *)self supplementaryValueLabel];
      [v14 transitionWithView:v15 duration:5242880 options:v13 animations:0 completion:0.15];
    }
    else
    {
      (*((void (**)(void *))v12 + 2))(v12);
    }
  }
}

void __67__HUQuickControlSwitchView__updateSupplementaryValueLabelAnimated___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) profile];
  double v2 = [v4 supplementaryFormattedValue];
  BOOL v3 = [*(id *)(a1 + 32) supplementaryValueLabel];
  [v3 setDynamicFormattingValue:v2];
}

- (BOOL)_createDecorationIconViewIfNecessary
{
  BOOL v3 = [(HUQuickControlSwitchView *)self decorationIconView];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F6A428]);
    [(HUQuickControlSwitchView *)self setDecorationIconView:v4];

    unint64_t v5 = [(HUQuickControlSwitchView *)self decorationIconView];
    [v5 setDisplayContext:0];

    uint64_t v6 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    uint64_t v7 = [(HUQuickControlSwitchView *)self decorationIconView];
    [v7 setTintColor:v6];

    id v8 = [(HUQuickControlSwitchView *)self decorationIconView];
    [(HUQuickControlSwitchView *)self addSubview:v8];

    [(HUQuickControlSwitchView *)self setNeedsLayout];
  }
  return v3 == 0;
}

- (void)_createSupplementaryValueLabelIfNecessary
{
  v23[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HUQuickControlSwitchView *)self supplementaryValueLabel];

  if (!v3)
  {
    id v4 = objc_alloc_init(HUDynamicFormattingLabel);
    [(HUQuickControlSwitchView *)self setSupplementaryValueLabel:v4];

    uint64_t v22 = *MEMORY[0x1E4F42510];
    unint64_t v5 = [(HUQuickControlSwitchView *)self profile];
    uint64_t v6 = [v5 tintColor];
    v23[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v8 = [(HUQuickControlSwitchView *)self supplementaryValueLabel];
    [v8 setDefaultAttributes:v7];

    id v9 = __69__HUQuickControlSwitchView__createSupplementaryValueLabelIfNecessary__block_invoke(*MEMORY[0x1E4F43870]);
    v21[0] = v9;
    double v10 = __69__HUQuickControlSwitchView__createSupplementaryValueLabelIfNecessary__block_invoke(*MEMORY[0x1E4F43890]);
    v21[1] = v10;
    char v11 = __69__HUQuickControlSwitchView__createSupplementaryValueLabelIfNecessary__block_invoke(*MEMORY[0x1E4F43880]);
    v21[2] = v11;
    double v12 = __69__HUQuickControlSwitchView__createSupplementaryValueLabelIfNecessary__block_invoke(*MEMORY[0x1E4F43888]);
    v21[3] = v12;
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
    double v14 = [(HUQuickControlSwitchView *)self supplementaryValueLabel];
    [v14 setPreferredFonts:v13];

    v15 = [(HUQuickControlSwitchView *)self supplementaryValueLabel];
    [v15 setTextAlignment:1];

    id v16 = [(HUQuickControlSwitchView *)self supplementaryValueLabel];
    [v16 setBaselineAdjustment:1];

    CGRect v17 = [(HUQuickControlSwitchView *)self supplementaryValueLabel];
    [v17 setAllowsDefaultTighteningForTruncation:1];

    CGRect v18 = [(HUQuickControlSwitchView *)self supplementaryValueLabel];
    [v18 setAdjustsFontSizeToFitWidth:1];

    double v19 = [(HUQuickControlSwitchView *)self supplementaryValueLabel];
    [v19 setMinimumScaleFactor:0.75];

    double v20 = [(HUQuickControlSwitchView *)self supplementaryValueLabel];
    [(HUQuickControlSwitchView *)self insertSubview:v20 atIndex:0];
  }
}

id __69__HUQuickControlSwitchView__createSupplementaryValueLabelIfNecessary__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F6A420];
  double v2 = [MEMORY[0x1E4F42A38] defaultFontDescriptorWithTextStyle:a1];
  BOOL v3 = [v1 fontDescriptorWithMonospacedDigitsForFontDescriptor:v2];

  id v4 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v3 size:0.0];

  return v4;
}

- (void)setReachabilityState:(unint64_t)a3
{
  if (self->_reachabilityState != a3)
  {
    self->_reachabilityState = a3;
    -[HUQuickControlSwitchView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:");
  }
}

- (void)_updateUIForReachabilityState:(unint64_t)a3
{
  if (a3 <= 2) {
    [(HUQuickControlSwitchView *)self setAlpha:dbl_1BEA1A378[a3]];
  }

  [(HUQuickControlSwitchView *)self _updateKnobViewTintColorAnimated:1];
}

- (unint64_t)reachabilityState
{
  return self->_reachabilityState;
}

- (HUQuickControlSwitchViewProfile)profile
{
  return self->_profile;
}

- (UIView)wellView
{
  return self->_wellView;
}

- (void)setWellView:(id)a3
{
}

- (UIView)knobView
{
  return self->_knobView;
}

- (void)setKnobView:(id)a3
{
}

- (HUDynamicFormattingLabel)supplementaryValueLabel
{
  return self->_supplementaryValueLabel;
}

- (void)setSupplementaryValueLabel:(id)a3
{
}

- (HUIconView)decorationIconView
{
  return self->_decorationIconView;
}

- (void)setDecorationIconView:(id)a3
{
}

- (double)clippedValue
{
  return self->_clippedValue;
}

- (void)setClippedValue:(double)a3
{
  self->_clippedValue = a3;
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (double)switchValue
{
  return self->_switchValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_decorationIconView, 0);
  objc_storeStrong((id *)&self->_supplementaryValueLabel, 0);
  objc_storeStrong((id *)&self->_knobView, 0);
  objc_storeStrong((id *)&self->_wellView, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end