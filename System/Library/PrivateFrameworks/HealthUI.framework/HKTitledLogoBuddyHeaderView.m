@interface HKTitledLogoBuddyHeaderView
- (HKTitledLogoBuddyHeaderView)initWithTopInset:(double)a3 linkButtonTitle:(id)a4;
- (UIImage)logoImage;
- (double)bottomPadding;
- (id)logoImageView;
- (void)_updateForCurrentSizeCategory;
- (void)setLogoImage:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HKTitledLogoBuddyHeaderView

- (HKTitledLogoBuddyHeaderView)initWithTopInset:(double)a3 linkButtonTitle:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)HKTitledLogoBuddyHeaderView;
  v4 = [(HKTitledBuddyHeaderView *)&v19 initWithTopInset:a4 linkButtonTitle:a3];
  if (v4)
  {
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    logoImageView = v4->_logoImageView;
    v4->_logoImageView = v5;

    [(UIImageView *)v4->_logoImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HKTitledLogoBuddyHeaderView *)v4 addSubview:v4->_logoImageView];
    v7 = [(UIImageView *)v4->_logoImageView centerXAnchor];
    v8 = [(HKTitledLogoBuddyHeaderView *)v4 centerXAnchor];
    v9 = [v7 constraintEqualToAnchor:v8];
    [v9 setActive:1];

    v10 = [(HKTitledBuddyHeaderView *)v4 titleLabel];
    v11 = [v10 firstBaselineAnchor];
    v12 = [(UIImageView *)v4->_logoImageView bottomAnchor];
    uint64_t v13 = [v11 constraintEqualToAnchor:v12 constant:0.0];
    titleLabelFirstBaselineAnchor = v4->_titleLabelFirstBaselineAnchor;
    v4->_titleLabelFirstBaselineAnchor = (NSLayoutConstraint *)v13;

    [(NSLayoutConstraint *)v4->_titleLabelFirstBaselineAnchor setActive:1];
    [(HKTitledLogoBuddyHeaderView *)v4 _updateForCurrentSizeCategory];
    v15 = [(UIImageView *)v4->_logoImageView topAnchor];
    v16 = [(HKTitledLogoBuddyHeaderView *)v4 topAnchor];
    v17 = [v15 constraintGreaterThanOrEqualToAnchor:v16];
    [v17 setActive:1];
  }
  return v4;
}

- (void)_updateForCurrentSizeCategory
{
  v4.receiver = self;
  v4.super_class = (Class)HKTitledLogoBuddyHeaderView;
  [(HKTitledBuddyHeaderView *)&v4 _updateForCurrentSizeCategory];
  v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2980]];
  [v3 _scaledValueForValue:44.0];
  -[NSLayoutConstraint setConstant:](self->_titleLabelFirstBaselineAnchor, "setConstant:");
}

- (void)setLogoImage:(id)a3
{
}

- (UIImage)logoImage
{
  return [(UIImageView *)self->_logoImageView image];
}

- (id)logoImageView
{
  return self->_logoImageView;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    v5 = [(HKTitledLogoBuddyHeaderView *)self traitCollection];
    v6 = [v5 preferredContentSizeCategory];
    v7 = [v9 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    id v4 = v9;
    if ((v8 & 1) == 0)
    {
      [(HKTitledLogoBuddyHeaderView *)self _updateForCurrentSizeCategory];
      id v4 = v9;
    }
  }
}

- (double)bottomPadding
{
  return 34.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabelFirstBaselineAnchor, 0);
  objc_storeStrong((id *)&self->_logoImageView, 0);
}

@end