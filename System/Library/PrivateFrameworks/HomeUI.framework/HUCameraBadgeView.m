@interface HUCameraBadgeView
+ (BOOL)requiresConstraintBasedLayout;
- (HUCameraBadgeView)initWithSize:(unint64_t)a3;
- (HULegibilityLabel)label;
- (NSArray)labelConstraints;
- (NSArray)staticConstraints;
- (NSString)labelText;
- (UIVisualEffectView)blurEffectView;
- (UIVisualEffectView)vibrancyEffectView;
- (_UILegibilitySettings)legibilitySettings;
- (unint64_t)size;
- (void)setLabelConstraints:(id)a3;
- (void)setLabelText:(id)a3;
- (void)setStaticConstraints:(id)a3;
- (void)updateConstraints;
@end

@implementation HUCameraBadgeView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUCameraBadgeView)initWithSize:(unint64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)HUCameraBadgeView;
  v4 = [(HUCameraBadgeView *)&v18 init];
  v5 = v4;
  if (v4)
  {
    v4->_size = a3;
    uint64_t v6 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:0];
    legibilitySettings = v5->_legibilitySettings;
    v5->_legibilitySettings = (_UILegibilitySettings *)v6;

    v8 = [HULegibilityLabel alloc];
    v9 = v5->_legibilitySettings;
    double v10 = *MEMORY[0x1E4F440D8];
    v11 = [MEMORY[0x1E4F42A30] systemFontOfSize:6.0];
    uint64_t v12 = [(HULegibilityLabel *)v8 initWithSettings:v9 strength:&stru_1F18F92B8 text:v11 font:*MEMORY[0x1E4F440F8] options:v10];
    label = v5->_label;
    v5->_label = (HULegibilityLabel *)v12;

    [(HULegibilityLabel *)v5->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(HULegibilityLabel *)v5->_label setTextColor:v14];

    double v15 = 15.0;
    if (!v5->_size) {
      double v15 = 13.0;
    }
    v16 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:v15];
    [(HULegibilityLabel *)v5->_label setFont:v16];

    [(HUCameraBadgeView *)v5 addSubview:v5->_label];
  }
  return v5;
}

- (void)updateConstraints
{
  v34[1] = *MEMORY[0x1E4F143B8];
  v3 = [(HUCameraBadgeView *)self staticConstraints];

  if (!v3)
  {
    v4 = [(HUCameraBadgeView *)self heightAnchor];
    v5 = v4;
    double v6 = 27.0;
    if (!self->_size) {
      double v6 = 24.0;
    }
    v7 = [v4 constraintGreaterThanOrEqualToConstant:v6];
    v34[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    [(HUCameraBadgeView *)self setStaticConstraints:v8];

    v9 = (void *)MEMORY[0x1E4F28DC8];
    double v10 = [(HUCameraBadgeView *)self staticConstraints];
    [v9 activateConstraints:v10];
  }
  v11 = [(HUCameraBadgeView *)self labelConstraints];

  if (!v11)
  {
    if (self->_size) {
      double v12 = 11.0;
    }
    else {
      double v12 = 8.0;
    }
    v31 = [(HUCameraBadgeView *)self label];
    v30 = [v31 leadingAnchor];
    v29 = [(HUCameraBadgeView *)self leadingAnchor];
    v28 = [v30 constraintEqualToAnchor:v29 constant:v12];
    v33[0] = v28;
    v27 = [(HUCameraBadgeView *)self label];
    v26 = [v27 trailingAnchor];
    v25 = [(HUCameraBadgeView *)self trailingAnchor];
    v24 = [v26 constraintEqualToAnchor:v25 constant:-v12];
    v33[1] = v24;
    v13 = [(HUCameraBadgeView *)self label];
    v14 = [v13 centerYAnchor];
    double v15 = [(HUCameraBadgeView *)self centerYAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v33[2] = v16;
    v17 = [(HUCameraBadgeView *)self label];
    objc_super v18 = [v17 heightAnchor];
    v19 = [(HUCameraBadgeView *)self heightAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v33[3] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
    [(HUCameraBadgeView *)self setLabelConstraints:v21];

    v22 = (void *)MEMORY[0x1E4F28DC8];
    v23 = [(HUCameraBadgeView *)self labelConstraints];
    [v22 activateConstraints:v23];
  }
  v32.receiver = self;
  v32.super_class = (Class)HUCameraBadgeView;
  [(HUCameraBadgeView *)&v32 updateConstraints];
}

- (void)setLabelText:(id)a3
{
  id v4 = a3;
  id v5 = [(HUCameraBadgeView *)self label];
  [v5 setText:v4];
}

- (NSString)labelText
{
  v2 = [(HUCameraBadgeView *)self label];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (unint64_t)size
{
  return self->_size;
}

- (HULegibilityLabel)label
{
  return self->_label;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (UIVisualEffectView)blurEffectView
{
  return self->_blurEffectView;
}

- (UIVisualEffectView)vibrancyEffectView
{
  return self->_vibrancyEffectView;
}

- (NSArray)staticConstraints
{
  return self->_staticConstraints;
}

- (void)setStaticConstraints:(id)a3
{
}

- (NSArray)labelConstraints
{
  return self->_labelConstraints;
}

- (void)setLabelConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelConstraints, 0);
  objc_storeStrong((id *)&self->_staticConstraints, 0);
  objc_storeStrong((id *)&self->_vibrancyEffectView, 0);
  objc_storeStrong((id *)&self->_blurEffectView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end