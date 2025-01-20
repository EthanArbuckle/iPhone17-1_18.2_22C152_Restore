@interface DMCEnrollmentTableViewTextFieldCell
- (DMCEnrollmentTableViewTextFieldCell)initWithType:(unint64_t)a3;
- (double)cellHeight;
- (double)estimatedCellHeight;
- (id)_placeHolderStringForType:(unint64_t)a3;
- (void)layoutSubviews;
@end

@implementation DMCEnrollmentTableViewTextFieldCell

- (DMCEnrollmentTableViewTextFieldCell)initWithType:(unint64_t)a3
{
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v14.receiver = self;
  v14.super_class = (Class)DMCEnrollmentTableViewTextFieldCell;
  v7 = [(DMCEnrollmentTableViewTextFieldCell *)&v14 initWithStyle:1000 reuseIdentifier:v6];

  if (v7)
  {
    [(DMCEnrollmentTableViewTextFieldCell *)v7 setSelectionStyle:0];
    v8 = [MEMORY[0x263F1C550] tertiarySystemFillColor];
    [(DMCEnrollmentTableViewTextFieldCell *)v7 setBackgroundColor:v8];

    v9 = [(DMCEnrollmentTableViewTextFieldCell *)v7 editableTextField];
    v10 = [(DMCEnrollmentTableViewTextFieldCell *)v7 _placeHolderStringForType:a3];
    [v9 setPlaceholder:v10];

    [v9 setAutocorrectionType:1];
    [v9 setAutocapitalizationType:0];
    if (a3) {
      [v9 setSecureTextEntry:1];
    }
    else {
      [v9 setKeyboardType:7];
    }
    [v9 setEnablesReturnKeyAutomatically:1];
    v11 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    [v9 setFont:v11];

    v12 = [MEMORY[0x263F1C550] labelColor];
    [v9 setTextColor:v12];

    [(DMCEnrollmentTableViewTextFieldCell *)v7 setSeparatorStyle:1];
  }
  return v7;
}

- (id)_placeHolderStringForType:(unint64_t)a3
{
  if (a3 <= 1)
  {
    DMCLocalizedString();
    self = (DMCEnrollmentTableViewTextFieldCell *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)DMCEnrollmentTableViewTextFieldCell;
  [(DMCEnrollmentTableViewTextFieldCell *)&v20 layoutSubviews];
  uint64_t v3 = [(DMCEnrollmentTableViewTextFieldCell *)self effectiveUserInterfaceLayoutDirection];
  [(DMCEnrollmentTableViewTextFieldCell *)self bounds];
  double Width = CGRectGetWidth(v21);
  v5 = [(DMCEnrollmentTableViewTextFieldCell *)self textField];
  [v5 frame];
  if (v3) {
    double MinX = CGRectGetMinX(*(CGRect *)&v6);
  }
  else {
    double MinX = CGRectGetMaxX(*(CGRect *)&v6);
  }
  double v11 = Width - MinX;

  v12 = [(DMCEnrollmentTableViewTextFieldCell *)self textField];
  [v12 frame];
  double v14 = v13;
  [(DMCEnrollmentTableViewTextFieldCell *)self bounds];
  CGFloat v15 = CGRectGetWidth(v22) + v11 * -2.0;
  v16 = [(DMCEnrollmentTableViewTextFieldCell *)self textField];
  [v16 frame];
  double v18 = v17;
  v19 = [(DMCEnrollmentTableViewTextFieldCell *)self textField];
  objc_msgSend(v19, "setFrame:", v11, v14, v15, v18);
}

- (double)cellHeight
{
  v2 = [(DMCEnrollmentTableViewTextFieldCell *)self textField];
  objc_msgSend(v2, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  double v4 = v3;

  double result = v4 * 1.2 + 15.0;
  if (result < 50.0) {
    return 50.0;
  }
  return result;
}

- (double)estimatedCellHeight
{
  return 50.0;
}

@end