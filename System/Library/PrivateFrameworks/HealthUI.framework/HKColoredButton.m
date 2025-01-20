@interface HKColoredButton
- (void)setHighlighted:(BOOL)a3;
@end

@implementation HKColoredButton

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKColoredButton;
  -[HKColoredButton setHighlighted:](&v9, sel_setHighlighted_);
  if (v3)
  {
    v5 = [(HKColoredButton *)self titleLabel];
    [v5 setAlpha:0.25];

    v6 = [(HKColoredButton *)self backgroundColor];
    v7 = [v6 colorWithAlphaComponent:0.5];
    [(HKColoredButton *)self setBackgroundColor:v7];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __34__HKColoredButton_setHighlighted___block_invoke;
    v8[3] = &unk_1E6D50ED8;
    v8[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v8 animations:0.15];
  }
}

void __34__HKColoredButton_setHighlighted___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) titleLabel];
  [v2 setAlpha:1.0];

  id v4 = [*(id *)(a1 + 32) backgroundColor];
  BOOL v3 = [v4 colorWithAlphaComponent:1.0];
  [*(id *)(a1 + 32) setBackgroundColor:v3];
}

@end