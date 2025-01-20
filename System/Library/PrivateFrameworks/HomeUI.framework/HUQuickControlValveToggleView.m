@interface HUQuickControlValveToggleView
+ (BOOL)requiresConstraintBasedLayout;
+ (id)intrinsicSizeDescriptor;
- (BOOL)isUserInteractionActive;
- (BOOL)open;
- (CGSize)intrinsicContentSize;
- (HUCircleView)circleView;
- (HUIconView)iconView;
- (HUQuickControlValveToggleView)initWithProfile:(id)a3;
- (HUQuickControlViewInteractionDelegate)interactionDelegate;
- (HUQuickControlViewProfile)profile;
- (UIColor)backgroundOffColor;
- (UIColor)backgroundOnColor;
- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3;
- (id)value;
- (unint64_t)reachabilityState;
- (void)_handleTap:(id)a3;
- (void)_setupIconView;
- (void)_updateAppearance;
- (void)_updateIconDescriptor;
- (void)_updateUIForReachabilityState:(unint64_t)a3;
- (void)setCircleView:(id)a3;
- (void)setIconView:(id)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setOpen:(BOOL)a3;
- (void)setProfile:(id)a3;
- (void)setReachabilityState:(unint64_t)a3;
- (void)setUserInteractionActive:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)updateConstraints;
@end

@implementation HUQuickControlValveToggleView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (id)intrinsicSizeDescriptor
{
  return +[HUIntrinsicSizeDescriptor descriptorWithIntrinsicSize:flexType:](HUIntrinsicSizeDescriptor, "descriptorWithIntrinsicSize:flexType:", 4, 54.0, 54.0);
}

- (HUQuickControlValveToggleView)initWithProfile:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUQuickControlValveToggleView;
  v6 = -[HUQuickControlValveToggleView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    v7->_reachabilityState = 0;
    v8 = (HUCircleView *)objc_alloc_init(MEMORY[0x1E4F6A418]);
    circleView = v7->_circleView;
    v7->_circleView = v8;

    [(HUQuickControlValveToggleView *)v7 naui_addAutoLayoutSubview:v7->_circleView];
    [(HUQuickControlValveToggleView *)v7 _setupIconView];
    [(HUQuickControlValveToggleView *)v7 _updateAppearance];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v7 action:sel__handleTap_];
    [(HUQuickControlValveToggleView *)v7 addGestureRecognizer:v10];
  }
  return v7;
}

- (UIColor)backgroundOnColor
{
  if (_MergedGlobals_3_10 != -1) {
    dispatch_once(&_MergedGlobals_3_10, &__block_literal_global_7_3);
  }
  v2 = (void *)qword_1EA12E1D8;

  return (UIColor *)v2;
}

void __50__HUQuickControlValveToggleView_backgroundOnColor__block_invoke_2()
{
  uint64_t v0 = HUColorNamed(@"HUQuickControlValveToggleViewBackgroundColorOn");
  v1 = (void *)qword_1EA12E1D8;
  qword_1EA12E1D8 = v0;
}

- (UIColor)backgroundOffColor
{
  if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
  {
    id v2 = [MEMORY[0x1E4F428B8] clearColor];
  }
  else
  {
    if (qword_1EA12E1E0 != -1) {
      dispatch_once(&qword_1EA12E1E0, &__block_literal_global_14_3);
    }
    id v2 = (id)qword_1EA12E1E8;
  }

  return (UIColor *)v2;
}

void __51__HUQuickControlValveToggleView_backgroundOffColor__block_invoke_2()
{
  uint64_t v0 = HUColorNamed(@"HUQuickControlValveToggleViewBackgroundColorOff");
  v1 = (void *)qword_1EA12E1E8;
  qword_1EA12E1E8 = v0;
}

- (void)_setupIconView
{
  v3 = (HUIconView *)objc_alloc_init(MEMORY[0x1E4F6A428]);
  iconView = self->_iconView;
  self->_iconView = v3;

  if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  v6 = (void *)MEMORY[0x1E4F42FE8];
  v7 = [MEMORY[0x1E4F427D8] effectWithStyle:v5];
  v8 = [v6 effectForBlurEffect:v7];
  [(HUIconView *)self->_iconView setVibrancyEffect:v8];

  [(HUQuickControlValveToggleView *)self _updateIconDescriptor];
  [(HUQuickControlValveToggleView *)self naui_addAutoLayoutSubview:self->_iconView];

  [(HUQuickControlValveToggleView *)self setNeedsLayout];
}

- (void)updateConstraints
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)HUQuickControlValveToggleView;
  [(HUQuickControlValveToggleView *)&v12 updateConstraints];
  v3 = (void *)MEMORY[0x1E4F28DC8];
  v4 = [(HUQuickControlValveToggleView *)self iconView];
  uint64_t v5 = [(HUQuickControlValveToggleView *)self layoutMarginsGuide];
  v6 = objc_msgSend(v3, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v4, v5);
  v13[0] = v6;
  v7 = (void *)MEMORY[0x1E4F28DC8];
  v8 = [(HUQuickControlValveToggleView *)self circleView];
  v9 = objc_msgSend(v7, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v8, self);
  v13[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v11 = objc_msgSend(v10, "na_arrayByFlattening");
  [v3 activateConstraints:v11];
}

- (void)_handleTap:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HUQuickControlValveToggleView *)self conformsToProtocol:&unk_1F1A161E8]
    && (objc_opt_respondsToSelector() & 1) != 0
    && (![(HUQuickControlValveToggleView *)self reachabilityState]
     || [(HUQuickControlValveToggleView *)self reachabilityState] == 1))
  {
    uint64_t v5 = HUQuickControlReachabilityString([(HUQuickControlValveToggleView *)self reachabilityState]);
    v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412802;
      v10 = self;
      __int16 v11 = 2112;
      objc_super v12 = v5;
      __int16 v13 = 2080;
      v14 = "-[HUQuickControlValveToggleView _handleTap:]";
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Control view %@ is in state %@. Ignoring tap gesture in %s", (uint8_t *)&v9, 0x20u);
    }
  }
  else if ([v4 state] == 3)
  {
    [(HUQuickControlValveToggleView *)self setOpen:[(HUQuickControlValveToggleView *)self open] ^ 1];
    [(HUQuickControlValveToggleView *)self setUserInteractionActive:1];
    v7 = [(HUQuickControlValveToggleView *)self interactionDelegate];
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HUQuickControlValveToggleView open](self, "open"));
    [v7 controlView:self valueDidChange:v8];

    [(HUQuickControlValveToggleView *)self setUserInteractionActive:0];
  }
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
  [(HUQuickControlValveToggleView *)self _updateAppearance];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 54.0;
  double v3 = 54.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setUserInteractionActive:(BOOL)a3
{
  BOOL userInteractionActive = self->_userInteractionActive;
  self->_BOOL userInteractionActive = a3;
  if (userInteractionActive != a3)
  {
    id v5 = [(HUQuickControlValveToggleView *)self interactionDelegate];
    [v5 controlView:self interactionStateDidChange:self->_userInteractionActive forFirstTouch:0];
  }
}

- (void)_updateAppearance
{
  if ([(HUQuickControlValveToggleView *)self open]) {
    [(HUQuickControlValveToggleView *)self backgroundOnColor];
  }
  else {
  double v3 = [(HUQuickControlValveToggleView *)self backgroundOffColor];
  }
  id v4 = [(HUQuickControlValveToggleView *)self circleView];
  [v4 setBackgroundColor:v3];

  [(HUQuickControlValveToggleView *)self _updateIconDescriptor];
}

- (void)_updateIconDescriptor
{
  if ([(HUQuickControlValveToggleView *)self open]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  id v6 = [(HUQuickControlValveToggleView *)self iconView];
  id v4 = [(HUQuickControlValveToggleView *)self profile];
  id v5 = [v4 decorationIconDescriptor];
  [v6 updateWithIconDescriptor:v5 displayStyle:v3 animated:0];
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);

  [(HUQuickControlValveToggleView *)self _updateIconDescriptor];
}

- (id)value
{
  double v2 = NSNumber;
  BOOL v3 = [(HUQuickControlValveToggleView *)self open];

  return (id)[v2 numberWithBool:v3];
}

- (void)setValue:(id)a3
{
  uint64_t v4 = [a3 BOOLValue];

  [(HUQuickControlValveToggleView *)self setOpen:v4];
}

- (void)setReachabilityState:(unint64_t)a3
{
  self->_reachabilityState = a3;
  -[HUQuickControlValveToggleView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:");
}

- (void)_updateUIForReachabilityState:(unint64_t)a3
{
  if (a3 <= 2) {
    [(HUQuickControlValveToggleView *)self setAlpha:dbl_1BEA1A9D8[a3]];
  }
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  BOOL v3 = objc_opt_class();

  return (id)[v3 intrinsicSizeDescriptor];
}

- (HUQuickControlViewProfile)profile
{
  return self->_profile;
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

- (BOOL)open
{
  return self->_open;
}

- (BOOL)isUserInteractionActive
{
  return self->_userInteractionActive;
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (HUCircleView)circleView
{
  return self->_circleView;
}

- (void)setCircleView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_storeStrong((id *)&self->_profile, 0);

  objc_storeStrong(&self->_value, 0);
}

@end