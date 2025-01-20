@interface HUQuickControlSliderView
+ (BOOL)requiresConstraintBasedLayout;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_permittedValueRange;
- (BOOL)_createDecorationIconViewIfNecessary;
- (BOOL)showOffState;
- (CGSize)intrinsicContentSize;
- (HUIconView)decorationIconView;
- (HUQuickControlSliderValueOverlayView)valueOverlayView;
- (HUQuickControlSliderView)initWithProfile:(id)a3;
- (HUQuickControlSliderViewProfile)profile;
- (NSLayoutConstraint)overlayTopConstraint;
- (UIImpactFeedbackGenerator)feedbackGenerator;
- (UIView)backgroundView;
- (UIView)borderView;
- (double)primaryNormalizedValue;
- (double)rawSliderValue;
- (double)secondaryNormalizedValue;
- (double)secondarySliderValue;
- (double)sliderValue;
- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3;
- (id)secondaryValue;
- (id)value;
- (unint64_t)reachabilityState;
- (void)_actuateTapticFeedback;
- (void)_prepareForTapticFeedback;
- (void)_updateDecorationIconDescriptorAnimated:(BOOL)a3;
- (void)_updateOffState;
- (void)_updateUIForReachabilityState:(unint64_t)a3;
- (void)layoutSubviews;
- (void)setBackgroundView:(id)a3;
- (void)setBorderView:(id)a3;
- (void)setDecorationIconView:(id)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setOverlayTopConstraint:(id)a3;
- (void)setPrimaryNormalizedValue:(double)a3;
- (void)setProfile:(id)a3;
- (void)setRawSliderValue:(double)a3;
- (void)setReachabilityState:(unint64_t)a3;
- (void)setSecondaryNormalizedValue:(double)a3;
- (void)setSecondarySliderValue:(double)a3;
- (void)setSecondaryValue:(id)a3;
- (void)setShowOffState:(BOOL)a3;
- (void)setSliderValue:(double)a3;
- (void)setValue:(id)a3;
- (void)setValueOverlayView:(id)a3;
@end

@implementation HUQuickControlSliderView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUQuickControlSliderView)initWithProfile:(id)a3
{
  id v5 = a3;
  v52.receiver = self;
  v52.super_class = (Class)HUQuickControlSliderView;
  v6 = [(HUQuickControlSliderView *)&v52 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    v7->_reachabilityState = 0;
    [(HUQuickControlSliderView *)v7 _permittedValueRange];
    v7->_sliderValue = v8;
    if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
    {
      v9 = [MEMORY[0x1E4F5AE10] controlCenterTertiaryMaterial];
      [(HUQuickControlSliderView *)v7 setBackgroundView:v9];
    }
    else
    {
      v10 = [[HUQuickControlBackgroundEffectView alloc] initWithEffectType:0];
      [(HUQuickControlSliderView *)v7 setBackgroundView:v10];

      v9 = [MEMORY[0x1E4F428B8] quaternarySystemFillColor];
      v11 = [(HUQuickControlSliderView *)v7 backgroundView];
      [v11 setTintColor:v9];
    }
    v12 = [(HUQuickControlSliderView *)v7 backgroundView];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

    v13 = [(HUQuickControlSliderView *)v7 backgroundView];
    [(HUQuickControlSliderView *)v7 addSubview:v13];

    v14 = [(HUQuickControlSliderView *)v7 layer];
    [v14 setAllowsGroupOpacity:0];

    v15 = [(HUQuickControlSliderView *)v7 layer];
    [v15 setAllowsGroupBlending:0];

    v16 = [(HUQuickControlSliderView *)v7 layer];
    [v16 setMasksToBounds:1];

    v17 = [HUQuickControlSliderValueOverlayView alloc];
    [(HUQuickControlSliderView *)v7 bounds];
    v18 = -[HUQuickControlSliderValueOverlayView initWithFrame:](v17, "initWithFrame:");
    [(HUQuickControlSliderView *)v7 setValueOverlayView:v18];

    v19 = [(HUQuickControlSliderView *)v7 profile];
    uint64_t v20 = [v19 showGrabbers];
    v21 = [(HUQuickControlSliderView *)v7 valueOverlayView];
    [v21 setShowGrabbers:v20];

    v22 = [(HUQuickControlSliderView *)v7 valueOverlayView];
    [(HUQuickControlSliderView *)v7 addSubview:v22];

    id v23 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [(HUQuickControlSliderView *)v7 setBorderView:v23];

    v24 = [MEMORY[0x1E4F428B8] clearColor];
    v25 = [(HUQuickControlSliderView *)v7 borderView];
    [v25 setBackgroundColor:v24];

    v26 = [(HUQuickControlSliderView *)v7 borderView];
    v27 = [v26 layer];
    [v27 setBorderWidth:1.0];

    v28 = [MEMORY[0x1E4F428B8] systemBlackColor];
    id v29 = [v28 colorWithAlphaComponent:0.0500000007];
    uint64_t v30 = [v29 CGColor];
    v31 = [(HUQuickControlSliderView *)v7 borderView];
    v32 = [v31 layer];
    [v32 setBorderColor:v30];

    v33 = [(HUQuickControlSliderView *)v7 borderView];
    [v33 setTranslatesAutoresizingMaskIntoConstraints:0];

    v34 = [(HUQuickControlSliderView *)v7 borderView];
    v35 = [v34 layer];
    [v35 setMasksToBounds:1];

    v36 = [(HUQuickControlSliderView *)v7 borderView];
    [(HUQuickControlSliderView *)v7 addSubview:v36];

    v37 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v46 = MEMORY[0x1E4F143A8];
    uint64_t v47 = 3221225472;
    v48 = __44__HUQuickControlSliderView_initWithProfile___block_invoke;
    v49 = &unk_1E6386F20;
    id v50 = v37;
    v38 = v7;
    v51 = v38;
    id v39 = v37;
    v40 = (void (**)(void *, void *))_Block_copy(&v46);
    v41 = [(HUQuickControlSliderView *)v38 backgroundView];
    v40[2](v40, v41);

    v42 = [(HUQuickControlSliderView *)v38 borderView];
    v40[2](v40, v42);

    LODWORD(v43) = 1148846080;
    [(HUQuickControlSliderView *)v38 setContentHuggingPriority:0 forAxis:v43];
    LODWORD(v44) = 1148846080;
    [(HUQuickControlSliderView *)v38 setContentHuggingPriority:1 forAxis:v44];
    [MEMORY[0x1E4F28DC8] activateConstraints:v39];
    [(HUQuickControlSliderView *)v38 _updateOffState];
    [(HUQuickControlSliderView *)v38 _updateDecorationIconDescriptorAnimated:0];
    [(HUQuickControlSliderView *)v38 _prepareForTapticFeedback];
  }
  return v7;
}

void __44__HUQuickControlSliderView_initWithProfile___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 topAnchor];
  v6 = [*(id *)(a1 + 40) topAnchor];
  v7 = [v5 constraintEqualToAnchor:v6];
  [v3 addObject:v7];

  double v8 = *(void **)(a1 + 32);
  v9 = [v4 bottomAnchor];
  v10 = [*(id *)(a1 + 40) bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  [v8 addObject:v11];

  v12 = *(void **)(a1 + 32);
  v13 = [v4 leadingAnchor];
  v14 = [*(id *)(a1 + 40) leadingAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  [v12 addObject:v15];

  v16 = *(void **)(a1 + 32);
  id v19 = [v4 trailingAnchor];

  v17 = [*(id *)(a1 + 40) trailingAnchor];
  v18 = [v19 constraintEqualToAnchor:v17];
  [v16 addObject:v18];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_permittedValueRange
{
  double v2 = 0.0;
  double v3 = 1.0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setSliderValue:(double)a3
{
  -[HUQuickControlSliderView setRawSliderValue:](self, "setRawSliderValue:");
  [(HUQuickControlSliderView *)self _permittedValueRange];
  double v7 = fmax(v6, fmin(a3, v5));
  [(HUQuickControlSliderView *)self primaryNormalizedValue];
  BOOL v9 = v8 >= 1.0 || v7 < 1.0;
  if (!v9
    || ([(HUQuickControlSliderView *)self primaryNormalizedValue], v10 > 0.0) && v7 <= 0.0)
  {
    [(HUQuickControlSliderView *)self _actuateTapticFeedback];
  }
  [(HUQuickControlSliderView *)self setPrimaryNormalizedValue:v7];
  double sliderValue = self->_sliderValue;
  [(HUQuickControlSliderView *)self primaryNormalizedValue];
  if (sliderValue != v12)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43__HUQuickControlSliderView_setSliderValue___block_invoke;
    v13[3] = &unk_1E6386018;
    v13[4] = self;
    [(HUQuickControlSliderView *)self naui_performAnimateableConstraintChanges:v13];
  }
}

uint64_t __43__HUQuickControlSliderView_setSliderValue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) primaryNormalizedValue];
  *(void *)(*(void *)(a1 + 32) + 432) = v2;
  double v3 = *(void **)(a1 + 32);

  return [v3 setNeedsLayout];
}

- (void)setSecondarySliderValue:(double)a3
{
  [(HUQuickControlSliderView *)self _permittedValueRange];
  double v7 = fmax(v6, fmin(a3, v5));
  [(HUQuickControlSliderView *)self secondaryNormalizedValue];
  BOOL v9 = v8 >= 1.0 || v7 < 1.0;
  if (!v9
    || ([(HUQuickControlSliderView *)self secondaryNormalizedValue], v10 > 0.0) && v7 <= 0.0)
  {
    [(HUQuickControlSliderView *)self _actuateTapticFeedback];
  }
  [(HUQuickControlSliderView *)self setSecondaryNormalizedValue:v7];
  double secondarySliderValue = self->_secondarySliderValue;
  [(HUQuickControlSliderView *)self secondaryNormalizedValue];
  if (secondarySliderValue != v12)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__HUQuickControlSliderView_setSecondarySliderValue___block_invoke;
    v13[3] = &unk_1E6386018;
    v13[4] = self;
    [(HUQuickControlSliderView *)self naui_performAnimateableConstraintChanges:v13];
  }
}

uint64_t __52__HUQuickControlSliderView_setSecondarySliderValue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) secondaryNormalizedValue];
  *(void *)(*(void *)(a1 + 32) + 440) = v2;
  double v3 = *(void **)(a1 + 32);

  return [v3 setNeedsLayout];
}

- (void)setRawSliderValue:(double)a3
{
  if ((NACGFloatEqualToFloat() & 1) == 0)
  {
    self->_rawSliderValue = a3;
    [(HUQuickControlSliderView *)self _updateOffState];
  }
}

- (CGSize)intrinsicContentSize
{
  uint64_t v2 = [(HUQuickControlSliderView *)self profile];
  double v3 = HUQuickControlSliderMetricsForControlSize([v2 controlSize]);
  id v4 = [v3 sizeDescriptor];
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
  v68.receiver = self;
  v68.super_class = (Class)HUQuickControlSliderView;
  [(HUQuickControlSliderView *)&v68 layoutSubviews];
  [(HUQuickControlSliderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(HUQuickControlSliderView *)self profile];
  double v12 = HUQuickControlSliderMetricsForControlSize([v11 controlSize]);
  [v12 widthToCornerRadiusRatio];
  double v14 = v13;
  [(HUQuickControlSliderView *)self bounds];
  [(HUQuickControlSliderView *)self _setContinuousCornerRadius:v14 * v15];

  [(HUQuickControlSliderView *)self _continuousCornerRadius];
  double v17 = v16;
  v18 = [(HUQuickControlSliderView *)self borderView];
  [v18 _setContinuousCornerRadius:v17];

  id v19 = [(HUQuickControlSliderView *)self profile];
  uint64_t v20 = [v19 controlSize];
  v21 = [(HUQuickControlSliderView *)self valueOverlayView];
  [v21 setControlSize:v20];

  v22 = [(HUQuickControlSliderView *)self profile];
  LODWORD(v20) = [v22 hasSecondaryValue];

  if (!v20)
  {
    id v23 = [(HUQuickControlSliderView *)self profile];
    uint64_t v24 = [v23 preferredFillSection];

    [(HUQuickControlSliderView *)self sliderValue];
    double v26 = v25;
    if (v24)
    {
      [(HUQuickControlSliderView *)self bounds];
      double v10 = (1.0 - v26) * v27;
      goto LABEL_6;
    }
    [(HUQuickControlSliderView *)self bounds];
    double v10 = v26 * v28;
  }
  [(HUQuickControlSliderView *)self sliderValue];
  double v30 = 1.0 - v29;
  [(HUQuickControlSliderView *)self bounds];
  double v6 = v30 * v31;
LABEL_6:
  v32 = [(HUQuickControlSliderView *)self profile];
  int v33 = [v32 hasSecondaryValue];

  if (v33)
  {
    [(HUQuickControlSliderView *)self bounds];
    double v35 = v34 - v6;
    [(HUQuickControlSliderView *)self secondarySliderValue];
    double v37 = v36;
    [(HUQuickControlSliderView *)self bounds];
    double v10 = v35 - v37 * v38;
    id v39 = [(HUQuickControlSliderView *)self valueOverlayView];
    v40 = v39;
    uint64_t v41 = 1;
  }
  else
  {
    id v39 = [(HUQuickControlSliderView *)self valueOverlayView];
    v40 = v39;
    uint64_t v41 = 0;
  }
  [v39 setHasSecondGrabber:v41];

  v42 = [(HUQuickControlSliderView *)self valueOverlayView];
  objc_msgSend(v42, "setFrame:", v4, v6, v8, v10);

  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __42__HUQuickControlSliderView_layoutSubviews__block_invoke;
  v67[3] = &unk_1E638C008;
  v67[4] = self;
  BOOL v43 = __42__HUQuickControlSliderView_layoutSubviews__block_invoke((uint64_t)v67);
  double v44 = [(HUQuickControlSliderView *)self valueOverlayView];
  [v44 setPrimaryGrabberLocation:v43];

  v45 = [(HUQuickControlSliderView *)self profile];
  uint64_t v46 = [v45 tintColor];
  uint64_t v47 = [(HUQuickControlSliderView *)self valueOverlayView];
  [v47 setLayerColor:v46];

  v48 = [(HUQuickControlSliderView *)self profile];
  v49 = [v48 tintColor];
  id v50 = [(HUQuickControlSliderView *)self traitCollection];
  [v50 userInterfaceStyle];
  int v51 = [(HUQuickControlSliderView *)self showOffState];
  v53 = borderColorSurroundingColor(v49, v52, v51);

  id v54 = v53;
  uint64_t v55 = [v54 CGColor];
  v56 = [(HUQuickControlSliderView *)self borderView];
  v57 = [v56 layer];
  [v57 setBorderColor:v55];

  HUDefaultSizeForIconSize();
  double v59 = v58;
  double v61 = v60;
  [(HUQuickControlSliderView *)self bounds];
  double v63 = v62 * 0.5 - v59 * 0.5;
  [(HUQuickControlSliderView *)self bounds];
  double v65 = v64 - v61 - v63 + 4.0;
  v66 = [(HUQuickControlSliderView *)self decorationIconView];
  objc_msgSend(v66, "setFrame:", v63, v65, v59, v61);

  [(HUQuickControlSliderView *)self _updateUIForReachabilityState:[(HUQuickControlSliderView *)self reachabilityState]];
}

BOOL __42__HUQuickControlSliderView_layoutSubviews__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) profile];
  char v3 = [v2 hasSecondaryValue];

  if (v3) {
    return 0;
  }
  double v5 = [*(id *)(a1 + 32) profile];
  uint64_t v6 = [v5 preferredFillSection];

  return v6 != 0;
}

- (void)_updateOffState
{
  char v3 = [(HUQuickControlSliderView *)self profile];
  int v4 = [v3 hasOffState];

  double v5 = self;
  if (v4)
  {
    [(HUQuickControlSliderView *)self rawSliderValue];
    v11[1] = 3221225472;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[2] = __43__HUQuickControlSliderView__updateOffState__block_invoke;
    v11[3] = &unk_1E638FEE8;
    v11[4] = self;
    *(double *)&v11[5] = round(v6 * 100.0) / 100.0;
    __43__HUQuickControlSliderView__updateOffState__block_invoke((uint64_t)v11);
    BOOL v8 = v7 != 0;
    double v5 = self;
  }
  else
  {
    BOOL v8 = 0;
  }
  [(HUQuickControlSliderView *)v5 setShowOffState:v8];
  BOOL v9 = [(HUQuickControlSliderView *)self showOffState];
  double v10 = [(HUQuickControlSliderView *)self valueOverlayView];
  [v10 setOff:v9];

  [(HUQuickControlSliderView *)self _updateDecorationIconDescriptorAnimated:0];
}

void __43__HUQuickControlSliderView__updateOffState__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) profile];
  [v1 preferredFillSection];
}

- (void)_prepareForTapticFeedback
{
  char v3 = (void *)[objc_alloc(MEMORY[0x1E4F42AA8]) initWithStyle:3];
  [(HUQuickControlSliderView *)self setFeedbackGenerator:v3];

  id v4 = [(HUQuickControlSliderView *)self feedbackGenerator];
  [v4 prepare];
}

- (void)_actuateTapticFeedback
{
  char v3 = [(HUQuickControlSliderView *)self feedbackGenerator];
  [v3 impactOccurred];

  id v4 = [(HUQuickControlSliderView *)self feedbackGenerator];
  [v4 prepare];
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  char v3 = HUQuickControlSliderMetricsForControlSize(a3);
  id v4 = [v3 sizeDescriptor];

  return v4;
}

- (id)value
{
  uint64_t v2 = NSNumber;
  [(HUQuickControlSliderView *)self sliderValue];

  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (void)setValue:(id)a3
{
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = &unk_1F19B4DA8;
  }
  [v4 doubleValue];

  -[HUQuickControlSliderView setSliderValue:](self, "setSliderValue:");
}

- (id)secondaryValue
{
  uint64_t v2 = NSNumber;
  [(HUQuickControlSliderView *)self secondarySliderValue];

  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (void)setSecondaryValue:(id)a3
{
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = &unk_1F19B4DA8;
  }
  [v4 doubleValue];

  -[HUQuickControlSliderView setSecondarySliderValue:](self, "setSecondarySliderValue:");
}

- (void)setProfile:(id)a3
{
  id v4 = (HUQuickControlSliderViewProfile *)a3;
  unint64_t v5 = [(HUQuickControlViewProfile *)self->_profile controlSize];
  uint64_t v6 = [(HUQuickControlViewProfile *)v4 controlSize];
  profile = self->_profile;
  self->_profile = v4;

  [(HUQuickControlSliderView *)self _updateOffState];
  [(HUQuickControlSliderView *)self setNeedsLayout];
  if (v5 != v6)
  {
    [(HUQuickControlSliderView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setReachabilityState:(unint64_t)a3
{
  self->_reachabilityState = a3;
  -[HUQuickControlSliderView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:");
}

- (void)_updateUIForReachabilityState:(unint64_t)a3
{
  if (a3 <= 2) {
    [(HUQuickControlSliderView *)self setAlpha:dbl_1BEA1A5A0[a3]];
  }
}

- (void)_updateDecorationIconDescriptorAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(HUQuickControlSliderView *)self profile];
  uint64_t v6 = [v5 decorationIconDescriptor];

  if (v6)
  {
    uint64_t v7 = v3 & ~[(HUQuickControlSliderView *)self _createDecorationIconViewIfNecessary];
    BOOL v8 = [(HUQuickControlSliderView *)self decorationIconView];
    BOOL v9 = [(HUQuickControlSliderView *)self profile];
    double v10 = [v9 decorationIconDescriptor];
    [v8 updateWithIconDescriptor:v10 displayStyle:3 animated:v7];

    v11 = [(HUQuickControlSliderView *)self profile];
    double v12 = [v11 tintColor];
    LODWORD(v9) = HUIsLightColor(v12);

    if (v9) {
      [MEMORY[0x1E4F428B8] systemGrayTintColor];
    }
    else {
    id v15 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    }
    double v14 = [(HUQuickControlSliderView *)self decorationIconView];
    [v14 setTintColor:v15];
  }
  else
  {
    double v13 = [(HUQuickControlSliderView *)self decorationIconView];
    [v13 removeFromSuperview];

    [(HUQuickControlSliderView *)self setDecorationIconView:0];
  }
}

- (BOOL)_createDecorationIconViewIfNecessary
{
  BOOL v3 = [(HUQuickControlSliderView *)self decorationIconView];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F6A428]);
    [(HUQuickControlSliderView *)self setDecorationIconView:v4];

    unint64_t v5 = [(HUQuickControlSliderView *)self decorationIconView];
    [v5 setDisplayContext:0];

    uint64_t v6 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    uint64_t v7 = [(HUQuickControlSliderView *)self decorationIconView];
    [v7 setTintColor:v6];

    BOOL v8 = [(HUQuickControlSliderView *)self decorationIconView];
    [(HUQuickControlSliderView *)self addSubview:v8];

    [(HUQuickControlSliderView *)self setNeedsLayout];
  }
  return v3 == 0;
}

- (HUQuickControlSliderViewProfile)profile
{
  return self->_profile;
}

- (unint64_t)reachabilityState
{
  return self->_reachabilityState;
}

- (double)sliderValue
{
  return self->_sliderValue;
}

- (double)secondarySliderValue
{
  return self->_secondarySliderValue;
}

- (BOOL)showOffState
{
  return self->_showOffState;
}

- (void)setShowOffState:(BOOL)a3
{
  self->_showOffState = a3;
}

- (double)rawSliderValue
{
  return self->_rawSliderValue;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)borderView
{
  return self->_borderView;
}

- (void)setBorderView:(id)a3
{
}

- (HUQuickControlSliderValueOverlayView)valueOverlayView
{
  return self->_valueOverlayView;
}

- (void)setValueOverlayView:(id)a3
{
}

- (NSLayoutConstraint)overlayTopConstraint
{
  return self->_overlayTopConstraint;
}

- (void)setOverlayTopConstraint:(id)a3
{
}

- (HUIconView)decorationIconView
{
  return self->_decorationIconView;
}

- (void)setDecorationIconView:(id)a3
{
}

- (double)primaryNormalizedValue
{
  return self->_primaryNormalizedValue;
}

- (void)setPrimaryNormalizedValue:(double)a3
{
  self->_primaryNormalizedValue = a3;
}

- (double)secondaryNormalizedValue
{
  return self->_secondaryNormalizedValue;
}

- (void)setSecondaryNormalizedValue:(double)a3
{
  self->_secondaryNormalizedValue = a3;
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_decorationIconView, 0);
  objc_storeStrong((id *)&self->_overlayTopConstraint, 0);
  objc_storeStrong((id *)&self->_valueOverlayView, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end