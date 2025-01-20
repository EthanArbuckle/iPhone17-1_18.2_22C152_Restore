@interface HUIHeadphoneLevelUnavailableView
- (BOOL)enabled;
- (BOOL)shouldAutoExpandForView:(id)a3;
- (HUIHeadphoneLevelUnavailableView)initWithFrame:(CGRect)a3;
- (id)contentValue;
@end

@implementation HUIHeadphoneLevelUnavailableView

- (HUIHeadphoneLevelUnavailableView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HUIHeadphoneLevelUnavailableView;
  v3 = -[HUICCCapsuleButton initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)MEMORY[0x263F827E8];
    v5 = [MEMORY[0x263F82818] configurationWithPointSize:4 weight:23.0];
    v6 = [v4 systemImageNamed:@"headphones" withConfiguration:v5];

    v7 = HUICCImageViewWithImage(v6);
    [(HUICCCapsuleButton *)v3 setIconView:v7];

    v8 = [(HUICCCapsuleButton *)v3 titleLabel];
    v9 = hearingLocString();
    [v8 setText:v9];

    v10 = [(HUICCCapsuleButton *)v3 subtitleLabel];
    v11 = hearingLocString();
    [v10 setText:v11];
  }
  return v3;
}

- (id)contentValue
{
  return 0;
}

- (BOOL)enabled
{
  return 1;
}

- (BOOL)shouldAutoExpandForView:(id)a3
{
  return 0;
}

@end