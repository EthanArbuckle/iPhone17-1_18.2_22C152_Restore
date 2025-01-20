@interface _HKRoundedRectBuddyButton
- (_HKRoundedRectBuddyButton)initWithFrame:(CGRect)a3;
- (void)_setUpConstraints;
- (void)_updateForContentSizeCategory:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation _HKRoundedRectBuddyButton

- (_HKRoundedRectBuddyButton)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_HKRoundedRectBuddyButton;
  v3 = -[_HKRoundedRectBuddyButton initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_HKRoundedRectBuddyButton *)v3 _setContinuousCornerRadius:8.0];
    -[_HKRoundedRectBuddyButton setDirectionalLayoutMargins:](v4, "setDirectionalLayoutMargins:", 14.0, 16.0, 14.0, 16.0);
    v5 = [MEMORY[0x1E4FB1618] whiteColor];
    [(_HKRoundedRectBuddyButton *)v4 setTitleColor:v5 forState:0];

    v6 = [(_HKRoundedRectBuddyButton *)v4 titleLabel];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 setAllowsDefaultTighteningForTruncation:1];
    [v6 setTextAlignment:1];
    [(_HKRoundedRectBuddyButton *)v4 _setUpConstraints];
    v7 = [(_HKRoundedRectBuddyButton *)v4 traitCollection];
    v8 = [v7 preferredContentSizeCategory];
    [(_HKRoundedRectBuddyButton *)v4 _updateForContentSizeCategory:v8];
  }
  return v4;
}

- (void)_setUpConstraints
{
  v3 = [(_HKRoundedRectBuddyButton *)self heightAnchor];
  v4 = [v3 constraintGreaterThanOrEqualToConstant:50.0];
  [v4 setActive:1];

  id v18 = [(_HKRoundedRectBuddyButton *)self titleLabel];
  v5 = [(_HKRoundedRectBuddyButton *)self layoutMarginsGuide];
  v6 = [v18 topAnchor];
  v7 = [v5 topAnchor];
  v8 = [v6 constraintGreaterThanOrEqualToAnchor:v7];
  [v8 setActive:1];

  v9 = [v18 bottomAnchor];
  objc_super v10 = [v5 bottomAnchor];
  v11 = [v9 constraintLessThanOrEqualToAnchor:v10];
  [v11 setActive:1];

  v12 = [v18 leadingAnchor];
  v13 = [v5 leadingAnchor];
  v14 = [v12 constraintGreaterThanOrEqualToAnchor:v13];
  [v14 setActive:1];

  v15 = [v18 trailingAnchor];
  v16 = [v5 trailingAnchor];
  v17 = [v15 constraintLessThanOrEqualToAnchor:v16];
  [v17 setActive:1];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_HKRoundedRectBuddyButton;
  -[_HKRoundedRectBuddyButton setHighlighted:](&v11, sel_setHighlighted_);
  v5 = [(_HKRoundedRectBuddyButton *)self titleLabel];
  v6 = v5;
  if (v3)
  {
    [v5 setAlpha:0.25];
    v7 = [(_HKRoundedRectBuddyButton *)self backgroundColor];
    v8 = v7;
    double v9 = 0.5;
  }
  else
  {
    [v5 setAlpha:1.0];
    v7 = [(_HKRoundedRectBuddyButton *)self backgroundColor];
    v8 = v7;
    double v9 = 1.0;
  }
  objc_super v10 = [v7 colorWithAlphaComponent:v9];
  [(_HKRoundedRectBuddyButton *)self setBackgroundColor:v10];
}

- (void)_updateForContentSizeCategory:(id)a3
{
  id v12 = a3;
  v4 = [(_HKRoundedRectBuddyButton *)self titleLabel];
  if ([v12 isEqualToString:*MEMORY[0x1E4FB27F0]])
  {
    v5 = [MEMORY[0x1E4FB1648] system];
    uint64_t v6 = [v5 preferredContentSizeCategory];

    v7 = (void *)v6;
  }
  else
  {
    v7 = v12;
  }
  id v13 = v7;
  HKUIContentSizeCategoryBounded(v7, (void *)*MEMORY[0x1E4FB27D0], (void *)*MEMORY[0x1E4FB2780]);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  double v9 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v8];
  objc_super v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908] compatibleWithTraitCollection:v9];
  objc_super v11 = objc_msgSend(v10, "hk_fontByAddingSymbolicTraits:", 0x8000);
  [v4 setFont:v11];

  [v4 setNumberOfLines:!UIContentSizeCategoryIsAccessibilityCategory(v8)];
  [(_HKRoundedRectBuddyButton *)self setNeedsDisplay];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKRoundedRectBuddyButton;
  [(_HKRoundedRectBuddyButton *)&v9 traitCollectionDidChange:v4];
  v5 = [(_HKRoundedRectBuddyButton *)self traitCollection];
  uint64_t v6 = [v5 preferredContentSizeCategory];

  if (v4)
  {
    v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(_HKRoundedRectBuddyButton *)self _updateForContentSizeCategory:v6];
    }
  }
}

@end