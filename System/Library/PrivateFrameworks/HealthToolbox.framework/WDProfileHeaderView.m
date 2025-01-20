@interface WDProfileHeaderView
+ (BOOL)requiresConstraintBasedLayout;
+ (double)avatarViewSize;
- (BOOL)isNameHidden;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSPersonNameComponentsFormatter)nameFormatter;
- (UILabel)nameLabel;
- (UIView)avatarView;
- (WDProfileHeaderView)initWithFrame:(CGRect)a3;
- (void)_updateFont;
- (void)layoutSubviews;
- (void)setAvatarView:(id)a3;
- (void)setFirstName:(id)a3 lastName:(id)a4;
- (void)setNameFormatter:(id)a3;
- (void)setNameHidden:(BOOL)a3;
- (void)setNameLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WDProfileHeaderView

+ (double)avatarViewSize
{
  return 86.0;
}

- (WDProfileHeaderView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)WDProfileHeaderView;
  v3 = -[WDProfileHeaderView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    nameLabel = v3->_nameLabel;
    v3->_nameLabel = v4;

    [(UILabel *)v3->_nameLabel setAllowsDefaultTighteningForTruncation:1];
    [(UILabel *)v3->_nameLabel setNumberOfLines:0];
    v6 = [MEMORY[0x263F1C658] systemFontOfSize:28.0];
    [(UILabel *)v3->_nameLabel setFont:v6];

    [(UILabel *)v3->_nameLabel setTextAlignment:1];
    v7 = [MEMORY[0x263F1C550] labelColor];
    [(UILabel *)v3->_nameLabel setTextColor:v7];

    [(WDProfileHeaderView *)v3 addSubview:v3->_nameLabel];
    [(WDProfileHeaderView *)v3 _updateFont];
    v8 = (NSPersonNameComponentsFormatter *)objc_alloc_init(MEMORY[0x263F08A78]);
    nameFormatter = v3->_nameFormatter;
    v3->_nameFormatter = v8;

    [(NSPersonNameComponentsFormatter *)v3->_nameFormatter setStyle:0];
    v10 = [MEMORY[0x263F1C550] systemGroupedBackgroundColor];
    [(WDProfileHeaderView *)v3 setBackgroundColor:v10];
  }
  return v3;
}

- (void)_updateFont
{
  uint64_t v3 = *MEMORY[0x263F1D140];
  int IsLargerThanSizeCategory = HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory();
  v5 = (void *)MEMORY[0x263F1C658];
  if (IsLargerThanSizeCategory)
  {
    uint64_t v6 = *MEMORY[0x263F1D260];
    v7 = [MEMORY[0x263F1CB00] traitCollectionWithPreferredContentSizeCategory:v3];
    v8 = [v5 preferredFontForTextStyle:v6 compatibleWithTraitCollection:v7];
    [v8 _scaledValueForValue:28.0];
    double v10 = v9;

    id v12 = [MEMORY[0x263F1C658] systemFontOfSize:v10];
    -[UILabel setFont:](self->_nameLabel, "setFont:");
  }
  else
  {
    id v12 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2F8]];
    v11 = [(WDProfileHeaderView *)self nameLabel];
    [v11 setFont:v12];
  }
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)WDProfileHeaderView;
  [(WDProfileHeaderView *)&v13 layoutSubviews];
  [(WDProfileHeaderView *)self bounds];
  double Width = CGRectGetWidth(v14);
  [(UILabel *)self->_nameLabel frame];
  double v4 = Width + -20.0;
  double v5 = 0.0;
  -[UILabel sizeThatFits:](self->_nameLabel, "sizeThatFits:", Width + -20.0, 0.0);
  double v7 = v6;
  avatarView = self->_avatarView;
  if (avatarView)
  {
    [(UIView *)avatarView frame];
    double v9 = (Width + -86.0) * 0.5;
    -[UIView setFrame:](self->_avatarView, "setFrame:", v9, 56.0, 86.0, 86.0);
    [(UILabel *)self->_nameLabel _firstBaselineOffsetFromTop];
    double v11 = 34.0 - v10;
    if (v11 >= 0.0) {
      double v5 = v11;
    }
    v15.origin.x = v9;
    v15.origin.y = 56.0;
    v15.size.width = 86.0;
    v15.size.height = 86.0;
    double v12 = CGRectGetMaxY(v15) + v5;
  }
  else
  {
    double v12 = 10.0;
  }
  -[UILabel setFrame:](self->_nameLabel, "setFrame:", 10.0, v12, v4, v7);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(WDProfileHeaderView *)self layoutIfNeeded];
  if ([(UILabel *)self->_nameLabel isHidden])
  {
    avatarView = (UILabel *)self->_avatarView;
    if (avatarView) {
      goto LABEL_6;
    }
  }
  if (([(UILabel *)self->_nameLabel isHidden] & 1) == 0)
  {
    avatarView = self->_nameLabel;
LABEL_6:
    [(UILabel *)avatarView frame];
    double v6 = CGRectGetMaxY(v9) + 56.0;
    goto LABEL_7;
  }
  double v6 = 56.0;
LABEL_7:
  double v7 = width;
  result.height = v6;
  result.CGFloat width = v7;
  return result;
}

- (void)setAvatarView:(id)a3
{
  double v5 = (UIView *)a3;
  avatarView = self->_avatarView;
  if (avatarView != v5)
  {
    double v7 = v5;
    [(UIView *)avatarView removeFromSuperview];
    if (v7) {
      [(WDProfileHeaderView *)self addSubview:v7];
    }
    objc_storeStrong((id *)&self->_avatarView, a3);
    double v5 = v7;
  }

  MEMORY[0x270F9A758](avatarView, v5);
}

- (void)setFirstName:(id)a3 lastName:(id)a4
{
  double v6 = (objc_class *)MEMORY[0x263F08A68];
  id v7 = a4;
  id v8 = a3;
  id v12 = objc_alloc_init(v6);
  [v12 setGivenName:v8];

  [v12 setFamilyName:v7];
  CGRect v9 = [(WDProfileHeaderView *)self nameFormatter];
  double v10 = [v9 stringFromPersonNameComponents:v12];
  double v11 = [(WDProfileHeaderView *)self nameLabel];
  [v11 setText:v10];

  [(WDProfileHeaderView *)self setNeedsLayout];
}

- (void)setNameHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WDProfileHeaderView *)self nameLabel];
  [v4 setHidden:v3];
}

- (BOOL)isNameHidden
{
  v2 = [(WDProfileHeaderView *)self nameLabel];
  char v3 = [v2 isHidden];

  return v3;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDProfileHeaderView;
  [(WDProfileHeaderView *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    double v5 = [(WDProfileHeaderView *)self traitCollection];
    double v6 = [v5 preferredContentSizeCategory];
    id v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      [(WDProfileHeaderView *)self _updateFont];
      [(WDProfileHeaderView *)self setNeedsLayout];
    }
  }
}

- (UIView)avatarView
{
  return self->_avatarView;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (NSPersonNameComponentsFormatter)nameFormatter
{
  return self->_nameFormatter;
}

- (void)setNameFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameFormatter, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);

  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end