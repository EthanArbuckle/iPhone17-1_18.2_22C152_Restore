@interface HUQuickControlPushButtonView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)isUserInteractionActive;
- (CGSize)intrinsicContentSize;
- (HUIconView)decorationIconView;
- (HUQuickControlPushButtonView)initWithProfile:(id)a3;
- (HUQuickControlPushButtonViewProfile)profile;
- (HUQuickControlRoundButton)roundButton;
- (HUQuickControlViewInteractionDelegate)interactionDelegate;
- (NSString)descriptionText;
- (UIImpactFeedbackGenerator)feedbackGenerator;
- (UILabel)buttonLabel;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3;
- (id)value;
- (unint64_t)controlState;
- (unint64_t)reachabilityState;
- (void)_actuateTapticFeedbackWithIntensity:(double)a3;
- (void)_animateToEnlargeView;
- (void)_animateToShrinkView;
- (void)_contentSizeCategoryDidChange;
- (void)_prepareForTapticFeedback;
- (void)_updateDecorationIconDescriptorAnimated:(BOOL)a3;
- (void)_updateUI;
- (void)_updateUIForReachabilityState:(unint64_t)a3;
- (void)dealloc;
- (void)handleTap:(id)a3;
- (void)layoutSubviews;
- (void)setButtonLabel:(id)a3;
- (void)setControlState:(unint64_t)a3;
- (void)setDecorationIconView:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setProfile:(id)a3;
- (void)setReachabilityState:(unint64_t)a3;
- (void)setRoundButton:(id)a3;
- (void)setUserInteractionActive:(BOOL)a3;
- (void)setValue:(id)a3;
@end

@implementation HUQuickControlPushButtonView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUQuickControlPushButtonView)initWithProfile:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HUQuickControlPushButtonView;
  v6 = [(HUQuickControlPushButtonView *)&v23 init];
  v7 = v6;
  if (v6)
  {
    v6->_userInteractionActive = 0;
    objc_storeStrong((id *)&v6->_profile, a3);
    v7->_reachabilityState = 0;
    v8 = objc_alloc_init(HUQuickControlRoundButton);
    [(HUQuickControlPushButtonView *)v7 setRoundButton:v8];

    v9 = [(HUQuickControlPushButtonView *)v7 roundButton];
    [(HUQuickControlPushButtonView *)v7 addSubview:v9];

    id v10 = objc_alloc_init(MEMORY[0x1E4F6A428]);
    [(HUQuickControlPushButtonView *)v7 setDecorationIconView:v10];

    v11 = [(HUQuickControlPushButtonView *)v7 decorationIconView];
    [v11 setContentMode:1];

    v12 = [(HUQuickControlPushButtonView *)v7 decorationIconView];
    [(HUQuickControlPushButtonView *)v7 addSubview:v12];

    v13 = [(HUQuickControlPushButtonView *)v7 descriptionText];

    if (v13)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F42B38]);
      [(HUQuickControlPushButtonView *)v7 setButtonLabel:v14];

      v15 = [(HUQuickControlPushButtonView *)v7 buttonLabel];
      [(HUQuickControlPushButtonView *)v7 addSubview:v15];

      v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v16 addObserver:v7 selector:sel__contentSizeCategoryDidChange name:*MEMORY[0x1E4F43788] object:0];
    }
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:v7 action:sel_handleTap_];
    [(HUQuickControlPushButtonView *)v7 setLongPressGestureRecognizer:v17];

    v18 = [(HUQuickControlPushButtonView *)v7 longPressGestureRecognizer];
    [v18 setMinimumPressDuration:0.0];

    v19 = [(HUQuickControlPushButtonView *)v7 longPressGestureRecognizer];
    [(HUQuickControlPushButtonView *)v7 addGestureRecognizer:v19];

    [(HUQuickControlPushButtonView *)v7 _prepareForTapticFeedback];
    LODWORD(v20) = 1148846080;
    [(HUQuickControlPushButtonView *)v7 setContentHuggingPriority:0 forAxis:v20];
    LODWORD(v21) = 1148846080;
    [(HUQuickControlPushButtonView *)v7 setContentHuggingPriority:1 forAxis:v21];
  }

  return v7;
}

- (void)handleTap:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HUQuickControlPushButtonView *)self reachabilityState] == 2
    || (id v5 = (void *)MEMORY[0x1E4F2E4F8],
        [(HUQuickControlPushButtonView *)self profile],
        v6 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v5) = objc_msgSend(v5, "hf_isSuspendedStateSupported:", objc_msgSend(v6, "suspendedState")),
        v6,
        (v5 & 1) != 0))
  {
    uint64_t v7 = [v4 state];
    if ((unint64_t)(v7 - 4) >= 2)
    {
      if (v7 != 3)
      {
        if (v7 != 1)
        {
LABEL_13:
          [(HUQuickControlPushButtonView *)self setNeedsLayout];
          goto LABEL_14;
        }
        [(HUQuickControlPushButtonView *)self setUserInteractionActive:1];
        v8 = [(HUQuickControlPushButtonView *)self interactionDelegate];
        [v8 controlView:self interactionStateDidChange:1 forFirstTouch:0];

        [(HUQuickControlPushButtonView *)self _animateToEnlargeView];
        double v9 = 0.5;
LABEL_12:
        [(HUQuickControlPushButtonView *)self _actuateTapticFeedbackWithIntensity:v9];
        goto LABEL_13;
      }
      [(HUQuickControlPushButtonView *)self setControlState:[(HUQuickControlPushButtonView *)self controlState] != 1];
      v13 = [(HUQuickControlPushButtonView *)self interactionDelegate];
      id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HUQuickControlPushButtonView controlState](self, "controlState"));
      [v13 controlView:self valueDidChange:v14];
    }
    v15 = [(HUQuickControlPushButtonView *)self interactionDelegate];
    [v15 controlView:self interactionStateDidChange:1 forFirstTouch:0];

    [(HUQuickControlPushButtonView *)self setUserInteractionActive:0];
    [(HUQuickControlPushButtonView *)self _animateToShrinkView];
    double v9 = 1.0;
    goto LABEL_12;
  }
  id v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v11 = [(HUQuickControlPushButtonView *)self reachabilityState];
    v12 = [(HUQuickControlPushButtonView *)self profile];
    int v16 = 138412802;
    v17 = self;
    __int16 v18 = 2048;
    unint64_t v19 = v11;
    __int16 v20 = 2048;
    uint64_t v21 = [v12 suspendedState];
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@: Ignoring tap gesture for reachabilityState %lu and suspendedState %lu", (uint8_t *)&v16, 0x20u);
  }
LABEL_14:
}

- (void)layoutSubviews
{
  v50.receiver = self;
  v50.super_class = (Class)HUQuickControlPushButtonView;
  [(HUQuickControlPushButtonView *)&v50 layoutSubviews];
  [(HUQuickControlPushButtonView *)self bounds];
  double v4 = v3 * 0.5;
  id v5 = [(HUQuickControlPushButtonView *)self layer];
  [v5 setCornerRadius:v4];

  [(HUQuickControlPushButtonView *)self intrinsicContentSize];
  double v7 = v6;
  double v9 = v8;
  id v10 = [(HUQuickControlPushButtonView *)self roundButton];
  double v11 = 0.0;
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, v7, v9);

  v12 = [(HUQuickControlPushButtonView *)self roundButton];
  [v12 frame];
  double v14 = v13;

  v15 = [(HUQuickControlPushButtonView *)self profile];
  unint64_t v16 = [v15 controlSize];

  if (v16 <= 3) {
    double v11 = dbl_1BEA1A2B0[v16];
  }
  v17 = [(HUQuickControlPushButtonView *)self decorationIconView];
  objc_msgSend(v17, "setFrame:", 0.0, 0.0, v14 * v11, v14 * v11);

  __int16 v18 = [(HUQuickControlPushButtonView *)self profile];
  unint64_t v19 = +[HUQuickControlUtilities iconSizeForQuickControlSize:](HUQuickControlUtilities, "iconSizeForQuickControlSize:", [v18 controlSize]);
  __int16 v20 = [(HUQuickControlPushButtonView *)self decorationIconView];
  [v20 setIconSize:v19];

  uint64_t v21 = [(HUQuickControlPushButtonView *)self roundButton];
  [v21 center];
  double v23 = v22;
  double v25 = v24;
  v26 = [(HUQuickControlPushButtonView *)self decorationIconView];
  objc_msgSend(v26, "setCenter:", v23, v25);

  v27 = [(HUQuickControlPushButtonView *)self buttonLabel];

  if (v27)
  {
    v28 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
    v29 = [(HUQuickControlPushButtonView *)self buttonLabel];
    [v29 setFont:v28];

    v30 = [(HUQuickControlPushButtonView *)self descriptionText];
    v31 = [(HUQuickControlPushButtonView *)self buttonLabel];
    [v31 setText:v30];

    v32 = [MEMORY[0x1E4F428B8] systemGrayColor];
    v33 = [(HUQuickControlPushButtonView *)self buttonLabel];
    [v33 setTextColor:v32];

    v34 = [(HUQuickControlPushButtonView *)self buttonLabel];
    [v34 setTextAlignment:1];

    v35 = [(HUQuickControlPushButtonView *)self buttonLabel];
    [v35 sizeToFit];

    v36 = [(HUQuickControlPushButtonView *)self buttonLabel];
    [v36 setNumberOfLines:3];

    v37 = [(HUQuickControlPushButtonView *)self roundButton];
    [v37 center];
    double v39 = v38;
    v40 = [(HUQuickControlPushButtonView *)self roundButton];
    [v40 center];
    double v42 = v41;
    v43 = [(HUQuickControlPushButtonView *)self roundButton];
    [v43 frame];
    double v45 = v42 + v44 * 0.5 + 14.0;

    v46 = [(HUQuickControlPushButtonView *)self buttonLabel];
    [v46 frame];
    double v48 = v47;
    v49 = [(HUQuickControlPushButtonView *)self buttonLabel];
    objc_msgSend(v49, "setFrame:", v39 - v14 * 0.5, v45, v14, v48);
  }
  [(HUQuickControlPushButtonView *)self _updateUI];
  [(HUQuickControlPushButtonView *)self _updateUIForReachabilityState:[(HUQuickControlPushButtonView *)self reachabilityState]];
}

- (void)_updateUI
{
  if ([(HUQuickControlPushButtonView *)self controlState] == 1
    || ([(HUQuickControlPushButtonView *)self profile],
        double v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 toggleColorScheme],
        v3,
        (v4 & 1) == 0))
  {
    id v5 = [(HUQuickControlPushButtonView *)self profile];
    double v6 = [v5 tintColor];
    double v7 = [(HUQuickControlPushButtonView *)self roundButton];
    [v7 setBackgroundColor:v6];

    double v8 = [(HUQuickControlPushButtonView *)self roundButton];
    double v9 = [v8 controlCenterMaterialView];
    [v9 setHidden:1];

    uint64_t v10 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  }
  else
  {
    if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials]) {
      [MEMORY[0x1E4F428B8] clearColor];
    }
    else {
    double v11 = [MEMORY[0x1E4F428B8] quaternarySystemFillColor];
    }
    v12 = [(HUQuickControlPushButtonView *)self roundButton];
    [v12 setBackgroundColor:v11];

    double v13 = [(HUQuickControlPushButtonView *)self roundButton];
    double v14 = [v13 controlCenterMaterialView];
    [v14 setHidden:0];

    uint64_t v10 = [MEMORY[0x1E4F428B8] systemMidGrayColor];
  }
  v15 = (void *)v10;
  unint64_t v16 = [(HUQuickControlPushButtonView *)self decorationIconView];
  [v16 setTintColor:v15];

  [(HUQuickControlPushButtonView *)self _updateDecorationIconDescriptorAnimated:0];
}

- (CGSize)intrinsicContentSize
{
  v2 = [(HUQuickControlPushButtonView *)self profile];
  double v3 = HUQuickControlPushButtonMetricsForControlSize([v2 controlSize]);
  char v4 = [v3 sizeDescriptor];
  [v4 intrinsicSize];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)_contentSizeCategoryDidChange
{
  double v3 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
  char v4 = [(HUQuickControlPushButtonView *)self buttonLabel];
  [v4 setFont:v3];

  [(HUQuickControlPushButtonView *)self setNeedsLayout];
}

- (void)dealloc
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlPushButtonView;
  [(HUQuickControlPushButtonView *)&v4 dealloc];
}

- (void)_updateDecorationIconDescriptorAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(HUQuickControlPushButtonView *)self decorationIconView];
  double v5 = [(HUQuickControlPushButtonView *)self profile];
  double v6 = [v5 decorationIconDescriptor];
  [v7 updateWithIconDescriptor:v6 displayStyle:3 animated:v3];
}

- (void)_animateToEnlargeView
{
  [(HUQuickControlPushButtonView *)self transform];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&t2.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&t2.c = v3;
  *(_OWORD *)&t2.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  if (CGAffineTransformEqualToTransform(&t1, &t2)
    && [(HUQuickControlPushButtonView *)self reachabilityState] == 2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __53__HUQuickControlPushButtonView__animateToEnlargeView__block_invoke;
    v4[3] = &unk_1E6386018;
    v4[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:0x10000 delay:v4 options:0 animations:0.2 completion:0.0];
  }
}

uint64_t __53__HUQuickControlPushButtonView__animateToEnlargeView__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 transform];
    long long v3 = *(void **)(a1 + 32);
  }
  else
  {
    long long v3 = 0;
    memset(&v6, 0, sizeof(v6));
  }
  CGAffineTransformScale(&v7, &v6, 1.1, 1.1);
  CGAffineTransform v5 = v7;
  return [v3 setTransform:&v5];
}

- (void)_animateToShrinkView
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __52__HUQuickControlPushButtonView__animateToShrinkView__block_invoke;
  v2[3] = &unk_1E6386018;
  v2[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:0x10000 delay:v2 options:0 animations:0.2 completion:0.0];
}

uint64_t __52__HUQuickControlPushButtonView__animateToShrinkView__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

- (void)_prepareForTapticFeedback
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F42AA8]);
  [(HUQuickControlPushButtonView *)self setFeedbackGenerator:v3];

  id v4 = [(HUQuickControlPushButtonView *)self feedbackGenerator];
  [v4 prepare];
}

- (void)_actuateTapticFeedbackWithIntensity:(double)a3
{
  CGAffineTransform v5 = [(HUQuickControlPushButtonView *)self feedbackGenerator];
  [v5 impactOccurredWithIntensity:a3];

  id v6 = [(HUQuickControlPushButtonView *)self feedbackGenerator];
  [v6 prepare];
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  id v3 = HUQuickControlPushButtonMetricsForControlSize(a3);
  id v4 = [v3 sizeDescriptor];

  return v4;
}

- (void)setProfile:(id)a3
{
  id v4 = (HUQuickControlPushButtonViewProfile *)a3;
  unint64_t v5 = [(HUQuickControlViewProfile *)self->_profile controlSize];
  uint64_t v6 = [(HUQuickControlViewProfile *)v4 controlSize];
  profile = self->_profile;
  self->_profile = v4;

  if (v5 != v6)
  {
    [(HUQuickControlPushButtonView *)self invalidateIntrinsicContentSize];
    [(HUQuickControlPushButtonView *)self setNeedsLayout];
  }

  [(HUQuickControlPushButtonView *)self _updateUI];
}

- (id)value
{
  long long v2 = NSNumber;
  unint64_t v3 = [(HUQuickControlPushButtonView *)self controlState];

  return (id)[v2 numberWithUnsignedInteger:v3];
}

- (void)setValue:(id)a3
{
  -[HUQuickControlPushButtonView setControlState:](self, "setControlState:", (int)[a3 intValue]);

  [(HUQuickControlPushButtonView *)self _updateUI];
}

- (void)setReachabilityState:(unint64_t)a3
{
  self->_reachabilityState = a3;
  -[HUQuickControlPushButtonView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:");
}

- (void)_updateUIForReachabilityState:(unint64_t)a3
{
  if (a3 >= 2)
  {
    if (a3 != 2) {
      return;
    }
    goto LABEL_5;
  }
  id v4 = (void *)MEMORY[0x1E4F2E4F8];
  unint64_t v5 = [(HUQuickControlPushButtonView *)self profile];
  uint64_t v6 = objc_msgSend(v4, "hf_isSuspendedStateSupported:", objc_msgSend(v5, "suspendedState"));

  if (v6)
  {
LABEL_5:
    uint64_t v6 = 1;
    double v7 = 1.0;
    goto LABEL_6;
  }
  double v7 = 0.5;
LABEL_6:
  [(HUQuickControlPushButtonView *)self setAlpha:v7];

  [(HUQuickControlPushButtonView *)self setUserInteractionEnabled:v6];
}

- (HUQuickControlViewInteractionDelegate)interactionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);

  return (HUQuickControlViewInteractionDelegate *)WeakRetained;
}

- (void)setInteractionDelegate:(id)a3
{
}

- (unint64_t)reachabilityState
{
  return self->_reachabilityState;
}

- (HUQuickControlPushButtonViewProfile)profile
{
  return self->_profile;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
}

- (BOOL)isUserInteractionActive
{
  return self->_userInteractionActive;
}

- (void)setUserInteractionActive:(BOOL)a3
{
  self->_userInteractionActive = a3;
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (HUQuickControlRoundButton)roundButton
{
  return self->_roundButton;
}

- (void)setRoundButton:(id)a3
{
}

- (HUIconView)decorationIconView
{
  return self->_decorationIconView;
}

- (void)setDecorationIconView:(id)a3
{
}

- (UILabel)buttonLabel
{
  return self->_buttonLabel;
}

- (void)setButtonLabel:(id)a3
{
}

- (unint64_t)controlState
{
  return self->_controlState;
}

- (void)setControlState:(unint64_t)a3
{
  self->_controlState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonLabel, 0);
  objc_storeStrong((id *)&self->_decorationIconView, 0);
  objc_storeStrong((id *)&self->_roundButton, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_profile, 0);

  objc_destroyWeak((id *)&self->_interactionDelegate);
}

@end