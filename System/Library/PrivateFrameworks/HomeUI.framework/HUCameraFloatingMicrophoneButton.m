@interface HUCameraFloatingMicrophoneButton
+ (BOOL)requiresConstraintBasedLayout;
+ (id)_createBackgroundEffect;
- (HUCameraFloatingMicrophoneButton)initWithFrame:(CGRect)a3;
- (NAUILayoutConstraintSet)constraintSet;
- (UIImageView)microphoneImageView;
- (UILabel)microphoneLabel;
- (UIVisualEffectView)backgroundView;
- (void)_setupConstraintSet;
- (void)_updateAlpha;
- (void)_updateSelectionState;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation HUCameraFloatingMicrophoneButton

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUCameraFloatingMicrophoneButton)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)HUCameraFloatingMicrophoneButton;
  v3 = -[HUCameraFloatingMicrophoneButton initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F43028]);
    v5 = [(id)objc_opt_class() _createBackgroundEffect];
    uint64_t v6 = [v4 initWithEffect:v5];
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (UIVisualEffectView *)v6;

    [(UIVisualEffectView *)v3->_backgroundView _setCornerRadius:4.0];
    [(UIVisualEffectView *)v3->_backgroundView setUserInteractionEnabled:0];
    [(HUCameraFloatingMicrophoneButton *)v3 naui_addAutoLayoutSubview:v3->_backgroundView];
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    microphoneLabel = v3->_microphoneLabel;
    v3->_microphoneLabel = v8;

    v10 = [MEMORY[0x1E4F6A420] staticPreferredFontForTextStyle:*MEMORY[0x1E4F438C0] traits:64];
    [(UILabel *)v3->_microphoneLabel setFont:v10];

    v11 = _HULocalizedStringWithDefaultValue(@"HUCameraFloatingMicrophoneButtonTitle", @"HUCameraFloatingMicrophoneButtonTitle", 1);
    [(UILabel *)v3->_microphoneLabel setText:v11];

    [(UILabel *)v3->_microphoneLabel _setTextColorFollowsTintColor:1];
    [(UILabel *)v3->_microphoneLabel setBaselineAdjustment:1];
    [(HUCameraFloatingMicrophoneButton *)v3 naui_addAutoLayoutSubview:v3->_microphoneLabel];
    v12 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    microphoneImageView = v3->_microphoneImageView;
    v3->_microphoneImageView = v12;

    [(HUCameraFloatingMicrophoneButton *)v3 naui_addAutoLayoutSubview:v3->_microphoneImageView];
    [(HUCameraFloatingMicrophoneButton *)v3 _setupConstraintSet];
    [(HUCameraFloatingMicrophoneButton *)v3 _updateSelectionState];
  }
  return v3;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HUCameraFloatingMicrophoneButton *)self isSelected] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)HUCameraFloatingMicrophoneButton;
    [(HUCameraFloatingMicrophoneButton *)&v5 setSelected:v3];
    [(HUCameraFloatingMicrophoneButton *)self _updateSelectionState];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUCameraFloatingMicrophoneButton;
  [(HUCameraFloatingMicrophoneButton *)&v4 setHighlighted:a3];
  [(HUCameraFloatingMicrophoneButton *)self _updateAlpha];
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUCameraFloatingMicrophoneButton;
  [(HUCameraFloatingMicrophoneButton *)&v4 setEnabled:a3];
  [(HUCameraFloatingMicrophoneButton *)self _updateAlpha];
}

+ (id)_createBackgroundEffect
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F428C0] colorEffectSaturate:1.5];
  BOOL v3 = [MEMORY[0x1E4F427D8] effectWithBlurRadius:12.0];
  objc_super v4 = (void *)MEMORY[0x1E4F43020];
  objc_super v5 = [MEMORY[0x1E4F428B8] colorWithWhite:0.282352941 alpha:0.72];
  uint64_t v6 = [v4 effectCompositingColor:v5];

  v7 = (void *)MEMORY[0x1E4F43020];
  v11[0] = v3;
  v11[1] = v2;
  v11[2] = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  v9 = [v7 effectCombiningEffects:v8];

  return v9;
}

- (void)_updateAlpha
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(HUCameraFloatingMicrophoneButton *)self isEnabled])
  {
    if ([(HUCameraFloatingMicrophoneButton *)self isHighlighted]) {
      double v3 = 0.4;
    }
    else {
      double v3 = 1.0;
    }
  }
  else
  {
    double v3 = 0.4;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v4 = [(HUCameraFloatingMicrophoneButton *)self microphoneLabel];
  v15[0] = v4;
  objc_super v5 = [(HUCameraFloatingMicrophoneButton *)self microphoneImageView];
  v15[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setAlpha:v3];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_updateSelectionState
{
  if ([(HUCameraFloatingMicrophoneButton *)self isSelected]) {
    objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
  }
  else {
  double v3 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  }
  [(HUCameraFloatingMicrophoneButton *)self setTintColor:v3];

  if ([(HUCameraFloatingMicrophoneButton *)self isSelected]) {
    objc_super v4 = @"floatingMicrophoneOn";
  }
  else {
    objc_super v4 = @"floatingMicrophoneOff";
  }
  HUImageNamed(v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v5 = [v7 imageWithRenderingMode:2];
  uint64_t v6 = [(HUCameraFloatingMicrophoneButton *)self microphoneImageView];
  [v6 setImage:v5];
}

- (void)_setupConstraintSet
{
  double v3 = (NAUILayoutConstraintSet *)[objc_alloc(MEMORY[0x1E4F7A100]) initWithOwningView:self constraintBuilder:&__block_literal_global_169];
  constraintSet = self->_constraintSet;
  self->_constraintSet = v3;
}

id __55__HUCameraFloatingMicrophoneButton__setupConstraintSet__block_invoke(uint64_t a1, void *a2)
{
  v32[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28DC8];
  id v3 = a2;
  v31 = [v3 backgroundView];
  v30 = objc_msgSend(v2, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v31, v3);
  v32[0] = v30;
  v29 = [v3 heightAnchor];
  v28 = [v29 constraintEqualToConstant:45.0];
  v32[1] = v28;
  v27 = [v3 microphoneImageView];
  v26 = [v27 leadingAnchor];
  v25 = [v3 leadingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25 constant:20.0];
  v32[2] = v24;
  v23 = [v3 microphoneImageView];
  v22 = [v23 centerYAnchor];
  v21 = [v3 centerYAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v32[3] = v20;
  v19 = [v3 microphoneLabel];
  uint64_t v17 = [v19 leadingAnchor];
  v18 = [v3 microphoneImageView];
  v16 = [v18 trailingAnchor];
  objc_super v4 = [v17 constraintEqualToAnchor:v16 constant:4.0];
  v32[4] = v4;
  objc_super v5 = [v3 microphoneLabel];
  uint64_t v6 = [v5 centerYAnchor];
  id v7 = [v3 centerYAnchor];
  uint64_t v8 = [v6 constraintEqualToAnchor:v7];
  v32[5] = v8;
  uint64_t v9 = [v3 microphoneLabel];
  uint64_t v10 = [v9 trailingAnchor];
  long long v11 = [v3 trailingAnchor];

  long long v12 = [v10 constraintEqualToAnchor:v11 constant:-20.0];
  v32[6] = v12;
  long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:7];
  objc_msgSend(v13, "na_arrayByFlattening");
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)updateConstraints
{
  v4.receiver = self;
  v4.super_class = (Class)HUCameraFloatingMicrophoneButton;
  [(HUCameraFloatingMicrophoneButton *)&v4 updateConstraints];
  id v3 = [(HUCameraFloatingMicrophoneButton *)self constraintSet];
  [v3 activateIfNeeded];
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (UILabel)microphoneLabel
{
  return self->_microphoneLabel;
}

- (UIImageView)microphoneImageView
{
  return self->_microphoneImageView;
}

- (NAUILayoutConstraintSet)constraintSet
{
  return self->_constraintSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraintSet, 0);
  objc_storeStrong((id *)&self->_microphoneImageView, 0);
  objc_storeStrong((id *)&self->_microphoneLabel, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end