@interface HUQuickControlStepperSeparatorView
- (HUQuickControlStepperSeparatorView)initWithFrame:(CGRect)a3;
@end

@implementation HUQuickControlStepperSeparatorView

- (HUQuickControlStepperSeparatorView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HUQuickControlStepperSeparatorView;
  v3 = -[HUQuickControlStepperSeparatorView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F428B8] systemGrayColor];
    v5 = [v4 colorWithAlphaComponent:0.3];
    [(HUQuickControlStepperSeparatorView *)v3 setBackgroundColor:v5];

    v6 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E0]];
    v7 = [(HUQuickControlStepperSeparatorView *)v3 layer];
    [v7 setCompositingFilter:v6];
  }
  return v3;
}

@end