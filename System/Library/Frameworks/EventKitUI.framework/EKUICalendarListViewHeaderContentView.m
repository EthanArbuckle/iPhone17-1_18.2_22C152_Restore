@interface EKUICalendarListViewHeaderContentView
+ (double)defaultFontSizeForMainText;
+ (double)dynamicFontSizeForMainText;
+ (double)dynamicFontSizeForSecondaryText;
+ (double)isAccessibilityLayout;
- (EKUICalendarListViewHeaderContentView)initWithFrame:(CGRect)a3;
- (UIContentConfiguration)configuration;
- (void)layoutSubviews;
- (void)reloadSubviews;
- (void)setConfiguration:(id)a3;
@end

@implementation EKUICalendarListViewHeaderContentView

- (EKUICalendarListViewHeaderContentView)initWithFrame:(CGRect)a3
{
  v43.receiver = self;
  v43.super_class = (Class)EKUICalendarListViewHeaderContentView;
  v3 = -[EKUICalendarListViewHeaderContentView initWithFrame:](&v43, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    weekDayLabel = v3->_weekDayLabel;
    v3->_weekDayLabel = v4;

    [(UILabel *)v3->_weekDayLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = (void *)MEMORY[0x1E4FB08E0];
    [(id)objc_opt_class() dynamicFontSizeForMainText];
    v7 = objc_msgSend(v6, "boldSystemFontOfSize:");
    [(UILabel *)v3->_weekDayLabel setFont:v7];

    [(EKUICalendarListViewHeaderContentView *)v3 addSubview:v3->_weekDayLabel];
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    altCalendarLabel = v3->_altCalendarLabel;
    v3->_altCalendarLabel = v8;

    [(UILabel *)v3->_altCalendarLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = (void *)MEMORY[0x1E4FB08E0];
    [(id)objc_opt_class() dynamicFontSizeForSecondaryText];
    v11 = objc_msgSend(v10, "boldSystemFontOfSize:");
    [(UILabel *)v3->_altCalendarLabel setFont:v11];

    [(EKUICalendarListViewHeaderContentView *)v3 addSubview:v3->_altCalendarLabel];
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    weekNumberLabel = v3->_weekNumberLabel;
    v3->_weekNumberLabel = v12;

    [(UILabel *)v3->_weekNumberLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = (void *)MEMORY[0x1E4FB08E0];
    [(id)objc_opt_class() dynamicFontSizeForSecondaryText];
    v15 = objc_msgSend(v14, "systemFontOfSize:");
    [(UILabel *)v3->_weekNumberLabel setFont:v15];

    [(EKUICalendarListViewHeaderContentView *)v3 addSubview:v3->_weekNumberLabel];
    v16 = _NSDictionaryOfVariableBindings(&cfstr_WeekdaylabelAl.isa, v3->_weekDayLabel, v3->_altCalendarLabel, v3->_weekNumberLabel, 0);
    [(id)objc_opt_class() isAccessibilityLayout];
    v17 = (void *)MEMORY[0x1E4F28DC8];
    if (v18 == 0.0)
    {
      v35 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(leadingMargin)-[_weekDayLabel(>=0)]-[_altCalendarLabel]-[_weekNumberLabel]" options:0 metrics:&unk_1F0D03E20 views:v16];
      [v17 activateConstraints:v35];

      [(UILabel *)v3->_weekDayLabel setContentHuggingPriority:0 forAxis:0.0];
      uint64_t v36 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3 attribute:6 relatedBy:0 toItem:v3->_weekNumberLabel attribute:6 multiplier:1.0 constant:16.0];
      trailingMarginConstraint = v3->_trailingMarginConstraint;
      v3->_trailingMarginConstraint = (NSLayoutConstraint *)v36;

      [(NSLayoutConstraint *)v3->_trailingMarginConstraint setActive:1];
      v38 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_weekDayLabel attribute:3 relatedBy:0 toItem:v3 attribute:3 multiplier:1.0 constant:8.0];
      [v38 setActive:1];

      v39 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_weekDayLabel attribute:4 relatedBy:0 toItem:v3 attribute:4 multiplier:1.0 constant:-8.0];
      [v39 setActive:1];

      v40 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_altCalendarLabel attribute:10 relatedBy:0 toItem:v3 attribute:10 multiplier:1.0 constant:0.0];
      [v40 setActive:1];

      v28 = (void *)MEMORY[0x1E4F28DC8];
      v29 = v3->_weekNumberLabel;
      double v30 = 1.0;
      double v31 = 0.0;
      uint64_t v32 = 10;
      v33 = v3;
      uint64_t v34 = 10;
    }
    else
    {
      v19 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(leadingMargin)-[_weekDayLabel(>=0)]-(edgeMargin)-|" options:0 metrics:&unk_1F0D03E20 views:v16];
      [v17 activateConstraints:v19];

      v20 = (void *)MEMORY[0x1E4F28DC8];
      v21 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:[_altCalendarLabel]-[_weekNumberLabel]-(>=edgeMargin)-|" options:0 metrics:&unk_1F0D03E20 views:v16];
      [v20 activateConstraints:v21];

      uint64_t v22 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_altCalendarLabel attribute:5 relatedBy:0 toItem:v3 attribute:5 multiplier:1.0 constant:16.0];
      accessibilityLeadingMarginConstraint = v3->_accessibilityLeadingMarginConstraint;
      v3->_accessibilityLeadingMarginConstraint = (NSLayoutConstraint *)v22;

      [(NSLayoutConstraint *)v3->_accessibilityLeadingMarginConstraint setActive:1];
      v24 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_weekDayLabel attribute:3 relatedBy:0 toItem:v3 attribute:3 multiplier:1.0 constant:8.0];
      [v24 setActive:1];

      v25 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_altCalendarLabel attribute:3 relatedBy:0 toItem:v3->_weekDayLabel attribute:4 multiplier:1.0 constant:0.0];
      [v25 setActive:1];

      v26 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_weekNumberLabel attribute:3 relatedBy:0 toItem:v3->_weekDayLabel attribute:4 multiplier:1.0 constant:0.0];
      [v26 setActive:1];

      v27 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_altCalendarLabel attribute:4 relatedBy:0 toItem:v3 attribute:4 multiplier:1.0 constant:-8.0];
      [v27 setActive:1];

      v28 = (void *)MEMORY[0x1E4F28DC8];
      v29 = v3->_weekNumberLabel;
      double v30 = 1.0;
      double v31 = -8.0;
      uint64_t v32 = 4;
      v33 = v3;
      uint64_t v34 = 4;
    }
    v41 = [v28 constraintWithItem:v29 attribute:v32 relatedBy:0 toItem:v33 attribute:v34 multiplier:v30 constant:v31];
    [v41 setActive:1];
  }
  return v3;
}

+ (double)isAccessibilityLayout
{
  [a1 dynamicFontSizeForMainText];
  double v4 = v3;
  [a1 defaultFontSizeForMainText];
  BOOL v6 = v4 <= v5 + 4.0;
  double result = 0.0;
  if (!v6) {
    return 1.0;
  }
  return result;
}

+ (double)defaultFontSizeForMainText
{
  return 16.0;
}

+ (double)dynamicFontSizeForMainText
{
  double v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  double v4 = [v3 fontDescriptor];
  [v4 pointSize];
  double v6 = v5;

  [a1 defaultFontSizeForMainText];
  CalRoundToScreenScale(v6 * (v7 / 11.0));
  return fmin(v8, 26.0);
}

+ (double)dynamicFontSizeForSecondaryText
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  double v3 = [v2 fontDescriptor];
  [v3 pointSize];
  double v5 = v4;

  CalRoundToScreenScale(v5 * 1.27272727);
  return fmin(v6, 22.0);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)EKUICalendarListViewHeaderContentView;
  [(EKUICalendarListViewHeaderContentView *)&v3 layoutSubviews];
  [(EKUICalendarListViewHeaderContentView *)self reloadSubviews];
}

- (UIContentConfiguration)configuration
{
  return (UIContentConfiguration *)self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);

  [(EKUICalendarListViewHeaderContentView *)self reloadSubviews];
}

- (void)reloadSubviews
{
  objc_super v3 = [(EKUICalendarListContentConfiguration *)self->_configuration weekNumberText];
  [(UILabel *)self->_weekNumberLabel setText:v3];

  double v4 = [(EKUICalendarListContentConfiguration *)self->_configuration secondaryTextColor];
  [(UILabel *)self->_weekNumberLabel setTextColor:v4];

  uint64_t v5 = [(UILabel *)self->_weekNumberLabel text];
  double v6 = 8.0;
  double v7 = 8.0;
  if (v5)
  {
    double v8 = (void *)v5;
    v9 = [(UILabel *)self->_weekNumberLabel text];
    int v10 = [v9 isEqual:&stru_1F0CC2140];

    double v7 = 16.0;
    if (v10) {
      double v7 = 8.0;
    }
  }
  [(NSLayoutConstraint *)self->_trailingMarginConstraint setConstant:v7];
  v11 = [(EKUICalendarListContentConfiguration *)self->_configuration altCalendarText];
  [(UILabel *)self->_altCalendarLabel setText:v11];

  v12 = [(EKUICalendarListContentConfiguration *)self->_configuration secondaryTextColor];
  [(UILabel *)self->_altCalendarLabel setTextColor:v12];

  uint64_t v13 = [(UILabel *)self->_altCalendarLabel text];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(UILabel *)self->_altCalendarLabel text];
    int v16 = [v15 isEqual:&stru_1F0CC2140];

    if (v16) {
      double v6 = 8.0;
    }
    else {
      double v6 = 16.0;
    }
  }
  [(NSLayoutConstraint *)self->_accessibilityLeadingMarginConstraint setConstant:v6];
  v17 = [(EKUICalendarListContentConfiguration *)self->_configuration mainTextColor];
  [(UILabel *)self->_weekDayLabel setTextColor:v17];

  double v18 = [(EKUICalendarListContentConfiguration *)self->_configuration mainText];
  [(UILabel *)self->_weekDayLabel setText:v18];

  [(UILabel *)self->_weekDayLabel frame];
  double v20 = v19;
  weekNumberLabel = self->_weekNumberLabel;
  [(UILabel *)weekNumberLabel frame];
  -[UILabel sizeThatFits:](weekNumberLabel, "sizeThatFits:", v22, v23);
  double v25 = v24;
  [(UILabel *)self->_weekNumberLabel frame];
  double v27 = v25 - v26;
  altCalendarLabel = self->_altCalendarLabel;
  [(UILabel *)altCalendarLabel frame];
  -[UILabel sizeThatFits:](altCalendarLabel, "sizeThatFits:", v29, v30);
  double v32 = v31;
  [(UILabel *)self->_altCalendarLabel frame];
  double v34 = v20 - v27 - (v32 - v33);
  if (v20 < 1.0) {
    [(EKUICalendarListViewHeaderContentView *)self setNeedsLayout];
  }
  weekDayLabel = self->_weekDayLabel;
  [(UILabel *)weekDayLabel frame];
  -[UILabel sizeThatFits:](weekDayLabel, "sizeThatFits:", v36, v37);
  if (v38 > v34)
  {
    id v39 = [(EKUICalendarListContentConfiguration *)self->_configuration mainTextAbbr];
    [(UILabel *)self->_weekDayLabel setText:v39];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityLeadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_trailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_weekNumberLabel, 0);
  objc_storeStrong((id *)&self->_altCalendarLabel, 0);
  objc_storeStrong((id *)&self->_weekDayLabel, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end