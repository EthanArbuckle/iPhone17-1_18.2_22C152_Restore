@interface HUStatusBannerView
- (void)prepareForReuse;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUStatusBannerView

- (void)prepareForReuse
{
  v3 = [(HUBannerView *)self iconView];
  [v3 setVibrancyEffect:0];

  v4 = [(HUBannerView *)self iconView];
  [v4 setTintColor:0];

  v5.receiver = self;
  v5.super_class = (Class)HUStatusBannerView;
  [(HUBannerView *)&v5 prepareForReuse];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(HUBannerView *)self item];
  v6 = [v5 latestResults];

  v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68A80]];
  uint64_t v8 = [v7 integerValue];

  v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];
  if (!v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = [MEMORY[0x1E4F428B8] systemRedColor];
      v11 = [(HUBannerView *)self iconView];
      [v11 setTintColor:v10];

      v12 = (void *)MEMORY[0x1E4F428C0];
      v13 = [MEMORY[0x1E4F428B8] systemRedColor];
      v14 = [v12 colorEffectMonochromeTint:v13 blendingAmount:1.0 brightnessAdjustment:0.45];
      v15 = [(HUBannerView *)self iconView];
      [v15 setVibrancyEffect:v14];
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)HUStatusBannerView;
  [(HUBannerView *)&v16 updateUIWithAnimation:v3];
}

@end