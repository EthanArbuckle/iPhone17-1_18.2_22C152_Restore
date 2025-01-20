@interface QLPDFPermissionCell
- (BOOL)_isLargeTextTraitCollection:(id)a3;
- (NSArray)constraints;
- (QLPDFPermissionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)label;
- (UIStackView)stackView;
- (UITextField)textField;
- (void)installConstraintsWithWidth:(double)a3;
- (void)setConstraints:(id)a3;
- (void)setStackView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation QLPDFPermissionCell

- (QLPDFPermissionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)QLPDFPermissionCell;
  v4 = [(QLPDFPermissionCell *)&v20 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    v6 = objc_opt_new();
    [v6 setFont:v5];
    v7 = objc_opt_new();
    [v7 setFont:v5];
    [v7 setSecureTextEntry:1];
    [v7 setKeyboardType:1];
    objc_storeWeak((id *)&v4->_label, v6);
    objc_storeWeak((id *)&v4->_textField, v7);
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = objc_opt_new();
    [(QLPDFPermissionCell *)v4 setStackView:v8];

    v9 = [(QLPDFPermissionCell *)v4 stackView];
    [v9 setAxis:0];

    v10 = [(QLPDFPermissionCell *)v4 stackView];
    [v10 setSpacing:20.0];

    v11 = [(QLPDFPermissionCell *)v4 stackView];
    [v11 setAlignment:0];

    v12 = [(QLPDFPermissionCell *)v4 stackView];
    [v12 setDistribution:0];

    v13 = [(QLPDFPermissionCell *)v4 stackView];
    [v13 addArrangedSubview:v6];

    v14 = [(QLPDFPermissionCell *)v4 stackView];
    [v14 addArrangedSubview:v7];

    v15 = [(QLPDFPermissionCell *)v4 stackView];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    v16 = [(QLPDFPermissionCell *)v4 contentView];
    v17 = [(QLPDFPermissionCell *)v4 stackView];
    [v16 addSubview:v17];

    LODWORD(v18) = 1132134400;
    [v6 setContentHuggingPriority:0 forAxis:v18];
    [(QLPDFPermissionCell *)v4 setSelectionStyle:0];
  }
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4 = [a3 preferredContentSizeCategory];
  v5 = [(QLPDFPermissionCell *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  unsigned __int8 v7 = [v4 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    v8 = [(QLPDFPermissionCell *)self traitCollection];
    unsigned int v9 = [(QLPDFPermissionCell *)self _isLargeTextTraitCollection:v8];

    [(UIStackView *)self->_stackView setAxis:v9];
    v10 = [(QLPDFPermissionCell *)self traitCollection];
    id v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody compatibleWithTraitCollection:v10];

    v11 = [(QLPDFPermissionCell *)self label];
    [v11 setFont:v13];

    v12 = [(QLPDFPermissionCell *)self textField];
    [v12 setFont:v13];
  }
}

- (BOOL)_isLargeTextTraitCollection:(id)a3
{
  UIContentSizeCategory v8 = UIContentSizeCategoryAccessibilityLarge;
  UIContentSizeCategory v9 = UIContentSizeCategoryAccessibilityExtraLarge;
  UIContentSizeCategory v10 = UIContentSizeCategoryAccessibilityExtraExtraLarge;
  UIContentSizeCategory v11 = UIContentSizeCategoryAccessibilityExtraExtraExtraLarge;
  UIContentSizeCategory v12 = UIContentSizeCategoryExtraExtraExtraLarge;
  id v3 = a3;
  v4 = +[NSArray arrayWithObjects:&v8 count:5];
  v5 = objc_msgSend(v3, "preferredContentSizeCategory", v8, v9, v10, v11, v12);

  unsigned __int8 v6 = [v4 containsObject:v5];
  return v6;
}

- (void)installConstraintsWithWidth:(double)a3
{
  v5 = [(QLPDFPermissionCell *)self constraints];

  if (v5)
  {
    unsigned __int8 v6 = [(QLPDFPermissionCell *)self constraints];
    +[NSLayoutConstraint deactivateConstraints:v6];
  }
  v38 = [(QLPDFPermissionCell *)self textField];
  v37 = [v38 widthAnchor];
  v36 = [v37 constraintGreaterThanOrEqualToConstant:a3];
  v39[0] = v36;
  v35 = [(QLPDFPermissionCell *)self label];
  v34 = [v35 widthAnchor];
  v33 = [v34 constraintGreaterThanOrEqualToConstant:a3];
  v39[1] = v33;
  v32 = [(QLPDFPermissionCell *)self stackView];
  v30 = [v32 leadingAnchor];
  v31 = [(QLPDFPermissionCell *)self contentView];
  v29 = [v31 layoutMarginsGuide];
  v28 = [v29 leadingAnchor];
  v27 = [v30 constraintEqualToAnchor:v28];
  v39[2] = v27;
  v26 = [(QLPDFPermissionCell *)self contentView];
  v25 = [v26 layoutMarginsGuide];
  v23 = [v25 bottomAnchor];
  v24 = [(QLPDFPermissionCell *)self stackView];
  v22 = [v24 bottomAnchor];
  v21 = [v23 constraintEqualToAnchor:v22 constant:0.5];
  v39[3] = v21;
  objc_super v20 = [(QLPDFPermissionCell *)self contentView];
  v19 = [v20 layoutMarginsGuide];
  v17 = [v19 trailingAnchor];
  double v18 = [(QLPDFPermissionCell *)self stackView];
  unsigned __int8 v7 = [v18 trailingAnchor];
  UIContentSizeCategory v8 = [v17 constraintEqualToAnchor:v7 constant:8.0];
  v39[4] = v8;
  UIContentSizeCategory v9 = [(QLPDFPermissionCell *)self stackView];
  UIContentSizeCategory v10 = [v9 topAnchor];
  UIContentSizeCategory v11 = [(QLPDFPermissionCell *)self contentView];
  UIContentSizeCategory v12 = [v11 layoutMarginsGuide];
  id v13 = [v12 topAnchor];
  v14 = [v10 constraintEqualToAnchor:v13 constant:0.5];
  v39[5] = v14;
  v15 = +[NSArray arrayWithObjects:v39 count:6];
  [(QLPDFPermissionCell *)self setConstraints:v15];

  v16 = [(QLPDFPermissionCell *)self constraints];
  +[NSLayoutConstraint activateConstraints:v16];
}

- (UILabel)label
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_label);

  return (UILabel *)WeakRetained;
}

- (UITextField)textField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);

  return (UITextField *)WeakRetained;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_textField);

  objc_destroyWeak((id *)&self->_label);
}

@end