@interface CNUINavigationListViewDetailCell
+ (CGSize)desiredContentSizeForTitle:(id)a3 subTitle:(id)a4 navigationListStyle:(id)a5;
+ (double)contentViewBottomAnchorConstraintConstantForNavigationListStyle:(id)a3;
+ (double)subtitleLabelFirstBaselineAnchorConstraintConstantForNavigationListStyle:(id)a3;
+ (double)titleLabelFirstBaselineAnchorConstraintConstantForNavigationListStyle:(id)a3;
+ (id)reuseIdentifier;
- (double)contentViewBottomAnchorConstraintConstant;
- (double)minimumContentHeight;
- (double)subtitleLabelFirstBaselineAnchorConstraintConstant;
- (double)titleLabelFirstBaselineAnchorConstraintConstant;
- (int64_t)contentAlignment;
- (void)applyStyle;
- (void)loadContentViewConstraints;
- (void)setContentAlignment:(int64_t)a3;
- (void)updateConstraints;
@end

@implementation CNUINavigationListViewDetailCell

- (int64_t)contentAlignment
{
  return self->_contentAlignment;
}

- (void)applyStyle
{
  id v3 = [(CNUINavigationListViewCell *)self styleApplier];
  [v3 applyNavigationListStyleToDetailCell:self];
}

- (void)updateConstraints
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)CNUINavigationListViewDetailCell;
  [(CNUINavigationListViewCell *)&v13 updateConstraints];
  int64_t v3 = [(CNUINavigationListViewDetailCell *)self contentAlignment];
  v4 = [(CNUINavigationListViewCell *)self titleLabel];
  v5 = [v4 leadingAnchor];
  v6 = [(CNUINavigationListViewDetailCell *)self contentView];
  v7 = [v6 leadingAnchor];
  if (v3 == 1)
  {
    v8 = [v5 constraintEqualToAnchor:v7 constant:5.0];
    [(CNUINavigationListViewCell *)self setTitleLabelLeadingAnchorConstraint:v8];
  }
  else
  {
    v8 = [(CNUINavigationListViewCell *)self navigationListStyle];
    [v8 cellUserActionLeftMargin];
    v9 = objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7);
    [(CNUINavigationListViewCell *)self setTitleLabelLeadingAnchorConstraint:v9];
  }
  v10 = (void *)MEMORY[0x1E4F28DC8];
  v11 = [(CNUINavigationListViewCell *)self titleLabelLeadingAnchorConstraint];
  v14[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v10 activateConstraints:v12];
}

- (void)loadContentViewConstraints
{
  if (![(CNUINavigationListViewCell *)self isContentViewConstraintsLoaded])
  {
    v24.receiver = self;
    v24.super_class = (Class)CNUINavigationListViewDetailCell;
    [(CNUINavigationListViewCell *)&v24 loadContentViewConstraints];
    int64_t v3 = [MEMORY[0x1E4F1CA48] array];
    v4 = [(CNUINavigationListViewDetailCell *)self contentView];
    v5 = [v4 trailingAnchor];
    v6 = [(CNUINavigationListViewCell *)self titleLabel];
    v7 = [v6 trailingAnchor];
    v8 = [v5 constraintEqualToAnchor:v7 constant:5.0];

    [v3 addObject:v8];
    [(CNUINavigationListViewCell *)self setTitleLabelTrailingAnchorConstraint:v8];
    v9 = [(CNUINavigationListViewCell *)self subtitleLabel];
    v10 = [v9 leadingAnchor];
    v11 = [(CNUINavigationListViewCell *)self titleLabel];
    v12 = [v11 leadingAnchor];
    objc_super v13 = [v10 constraintEqualToAnchor:v12];

    [v3 addObject:v13];
    [(CNUINavigationListViewCell *)self setSubtitleLabelLeadingAnchorConstraint:v13];
    v14 = [(CNUINavigationListViewCell *)self subtitleLabel];
    v15 = [v14 trailingAnchor];
    v16 = [(CNUINavigationListViewCell *)self titleLabel];
    v17 = [v16 trailingAnchor];
    v18 = [v15 constraintEqualToAnchor:v17];

    [v3 addObject:v18];
    [(CNUINavigationListViewCell *)self setSubtitleLabelTrailingAnchorConstraint:v18];
    v19 = [(CNUINavigationListViewCell *)self subtitleLabel];
    v20 = [v19 firstBaselineAnchor];
    v21 = [(CNUINavigationListViewCell *)self titleLabel];
    v22 = [v21 firstBaselineAnchor];
    [(CNUINavigationListViewDetailCell *)self subtitleLabelFirstBaselineAnchorConstraintConstant];
    v23 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22);

    [v3 addObject:v23];
    [(CNUINavigationListViewCell *)self setSubtitleLabelFirstBaselineAnchorConstraint:v23];
    [MEMORY[0x1E4F28DC8] activateConstraints:v3];
    [(CNUINavigationListViewCell *)self setContentViewConstraintsLoaded:1];
  }
}

- (void)setContentAlignment:(int64_t)a3
{
  if (self->_contentAlignment != a3)
  {
    self->_contentAlignment = a3;
    BOOL v4 = [(CNUINavigationListViewDetailCell *)self contentAlignment] == 1;
    v5 = [(CNUINavigationListViewCell *)self titleLabel];
    [v5 setTextAlignment:v4];

    v6 = [(CNUINavigationListViewCell *)self subtitleLabel];
    [v6 setTextAlignment:v4];

    [(CNUINavigationListViewDetailCell *)self separatorInset];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    int64_t v13 = [(CNUINavigationListViewDetailCell *)self contentAlignment];
    double v14 = 0.0;
    if (v13 != 1) {
      double v14 = 15.0;
    }
    -[CNUINavigationListViewDetailCell setSeparatorInset:](self, "setSeparatorInset:", v8, v14, v10, v12);
    [(CNUINavigationListViewDetailCell *)self setNeedsUpdateConstraints];
  }
}

- (double)titleLabelFirstBaselineAnchorConstraintConstant
{
  int64_t v3 = objc_opt_class();
  BOOL v4 = [(CNUINavigationListViewCell *)self navigationListStyle];
  [v3 titleLabelFirstBaselineAnchorConstraintConstantForNavigationListStyle:v4];
  double v6 = v5;

  return v6;
}

- (double)subtitleLabelFirstBaselineAnchorConstraintConstant
{
  int64_t v3 = objc_opt_class();
  BOOL v4 = [(CNUINavigationListViewCell *)self navigationListStyle];
  [v3 subtitleLabelFirstBaselineAnchorConstraintConstantForNavigationListStyle:v4];
  double v6 = v5;

  return v6;
}

- (double)contentViewBottomAnchorConstraintConstant
{
  int64_t v3 = objc_opt_class();
  BOOL v4 = [(CNUINavigationListViewCell *)self navigationListStyle];
  [v3 contentViewBottomAnchorConstraintConstantForNavigationListStyle:v4];
  double v6 = v5;

  return v6;
}

- (double)minimumContentHeight
{
  v7.receiver = self;
  v7.super_class = (Class)CNUINavigationListViewDetailCell;
  [(CNUINavigationListViewCell *)&v7 minimumContentHeight];
  double v4 = v3;
  [(CNUINavigationListViewDetailCell *)self subtitleLabelFirstBaselineAnchorConstraintConstant];
  return ceil(v4 + v5);
}

+ (id)reuseIdentifier
{
  return @"CNUINavigationListViewDetailCellReuseIdentifier";
}

+ (CGSize)desiredContentSizeForTitle:(id)a3 subTitle:(id)a4 navigationListStyle:(id)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v10 cellUserActionLeftMargin];
  double v12 = v11;
  double v13 = *MEMORY[0x1E4F1DB30];
  double v14 = [v10 detailCellTitleFont];
  v15 = [v10 detailCellSubtitleFont];
  uint64_t v16 = *MEMORY[0x1E4F5A298];
  double v17 = v13;
  if (((*(uint64_t (**)(void, id))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], v8) & 1) == 0)
  {
    if (v14)
    {
      uint64_t v33 = *MEMORY[0x1E4FB06F8];
      v34[0] = v14;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    }
    else
    {
      v18 = 0;
    }
    [v8 sizeWithAttributes:v18];
    double v17 = v19;
  }
  if (((*(uint64_t (**)(uint64_t, id))(v16 + 16))(v16, v9) & 1) == 0)
  {
    if (v15)
    {
      uint64_t v31 = *MEMORY[0x1E4FB06F8];
      v32 = v15;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    }
    else
    {
      v20 = 0;
    }
    [v9 sizeWithAttributes:v20];
    double v13 = v21;
  }
  if (v17 >= v13) {
    double v22 = v17;
  }
  else {
    double v22 = v13;
  }
  [a1 titleLabelFirstBaselineAnchorConstraintConstantForNavigationListStyle:v10];
  double v24 = v23;
  [a1 subtitleLabelFirstBaselineAnchorConstraintConstantForNavigationListStyle:v10];
  double v26 = v25;
  [a1 contentViewBottomAnchorConstraintConstantForNavigationListStyle:v10];
  double v28 = v27;

  double v29 = v12 + 22.0 + 5.0 + v22;
  double v30 = ceil(v24 + v26 + v28);
  result.height = v30;
  result.width = v29;
  return result;
}

+ (double)titleLabelFirstBaselineAnchorConstraintConstantForNavigationListStyle:(id)a3
{
  id v3 = a3;
  double v4 = [v3 detailCellTitleFont];
  [v3 detailCellTitleLabelFirstBaselineAnchorConstraintConstant];
  double v6 = v5;

  [v4 _scaledValueForValue:v6];
  double v8 = ceil(v7);

  return v8;
}

+ (double)subtitleLabelFirstBaselineAnchorConstraintConstantForNavigationListStyle:(id)a3
{
  id v3 = a3;
  double v4 = [v3 detailCellSubtitleFont];
  [v3 detailCellSubtitleLabelFirstBaselineAnchorConstraintConstant];
  double v6 = v5;

  [v4 _scaledValueForValue:v6];
  double v8 = ceil(v7);

  return v8;
}

+ (double)contentViewBottomAnchorConstraintConstantForNavigationListStyle:(id)a3
{
  id v3 = a3;
  double v4 = [v3 detailCellSubtitleFont];
  [v3 detailCellContentViewBottomAnchorConstraintConstant];
  double v6 = v5;

  [v4 _scaledValueForValue:v6];
  double v8 = ceil(v7);

  return v8;
}

@end