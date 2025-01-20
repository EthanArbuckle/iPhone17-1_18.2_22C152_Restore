@interface HUQuickControlRoundButton
- (HUQuickControlRoundButton)initWithFrame:(CGRect)a3;
- (UIView)controlCenterMaterialView;
- (void)layoutSubviews;
- (void)setControlCenterMaterialView:(id)a3;
@end

@implementation HUQuickControlRoundButton

- (HUQuickControlRoundButton)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HUQuickControlRoundButton;
  v3 = -[HUQuickControlRoundButton initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(HUQuickControlRoundButton *)v3 layer];
    [v5 setAllowsGroupOpacity:0];

    [(HUQuickControlRoundButton *)v4 setClipsToBounds:1];
    if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
    {
      uint64_t v6 = [MEMORY[0x1E4F5AE10] controlCenterTertiaryMaterial];
      controlCenterMaterialView = v4->_controlCenterMaterialView;
      v4->_controlCenterMaterialView = (UIView *)v6;

      [(HUQuickControlRoundButton *)v4 addSubview:v4->_controlCenterMaterialView];
    }
  }
  return v4;
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)HUQuickControlRoundButton;
  [(HUQuickControlRoundButton *)&v20 layoutSubviews];
  [(HUQuickControlRoundButton *)self bounds];
  double v4 = v3 * 0.5;
  v5 = [(HUQuickControlRoundButton *)self layer];
  [v5 setCornerRadius:v4];

  if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
  {
    [(HUQuickControlRoundButton *)self frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    v14 = [(HUQuickControlRoundButton *)self controlCenterMaterialView];
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

    v15 = [(HUQuickControlRoundButton *)self layer];
    [v15 cornerRadius];
    double v17 = v16;
    v18 = [(HUQuickControlRoundButton *)self controlCenterMaterialView];
    v19 = [v18 layer];
    [v19 setCornerRadius:v17];
  }
}

- (UIView)controlCenterMaterialView
{
  return self->_controlCenterMaterialView;
}

- (void)setControlCenterMaterialView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end