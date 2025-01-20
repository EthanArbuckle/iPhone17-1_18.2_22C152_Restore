@interface AKRoundedButton
+ (id)roundedButton;
- (UIEdgeInsets)_signInButtonEdgeInsets;
- (void)_updateColor;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation AKRoundedButton

+ (id)roundedButton
{
  v2 = +[AKRoundedButton buttonWithType:0];
  v3 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*MEMORY[0x1E4F43878] weight:*MEMORY[0x1E4F43930]];
  v4 = [v2 titleLabel];
  [v4 setFont:v3];

  v5 = [v2 titleLabel];
  [v5 setAdjustsFontForContentSizeCategory:1];

  v6 = [MEMORY[0x1E4F428B8] whiteColor];
  v7 = [v6 colorWithAlphaComponent:0.75];

  [v2 setTitleColor:v7 forState:4];
  [v2 setTitleColor:v7 forState:1];
  [v2 setTitleColor:v7 forState:5];
  [v2 _signInButtonEdgeInsets];
  objc_msgSend(v2, "setContentEdgeInsets:");
  v8 = [v2 layer];
  [v8 setCornerRadius:10.0];

  v9 = [v2 layer];
  [v9 setMasksToBounds:1];

  [v2 sizeToFit];

  return v2;
}

- (UIEdgeInsets)_signInButtonEdgeInsets
{
  double v2 = 8.0;
  double v3 = 26.0;
  double v4 = 8.0;
  double v5 = 26.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKRoundedButton;
  [(AKRoundedButton *)&v4 setHighlighted:a3];
  [(AKRoundedButton *)self _updateColor];
}

- (void)_updateColor
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __31__AKRoundedButton__updateColor__block_invoke;
  v2[3] = &unk_1E648EF28;
  v2[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v2 animations:0.150000006];
}

void __31__AKRoundedButton__updateColor__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) backgroundColor];
  int v2 = [*(id *)(a1 + 32) isHighlighted];
  double v3 = 1.0;
  if (v2) {
    double v3 = 0.5;
  }
  objc_super v4 = [v5 colorWithAlphaComponent:v3];
  [*(id *)(a1 + 32) setBackgroundColor:v4];
}

@end