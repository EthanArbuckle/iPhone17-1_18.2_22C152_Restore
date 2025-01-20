@interface CNMeCardSharingTextFieldTableViewCell
+ (id)cellIdentifier;
- (UITextField)textField;
- (void)layoutSubviews;
- (void)setTextField:(id)a3;
@end

@implementation CNMeCardSharingTextFieldTableViewCell

- (void).cxx_destruct
{
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)CNMeCardSharingTextFieldTableViewCell;
  [(CNMeCardSharingTextFieldTableViewCell *)&v12 layoutSubviews];
  [(CNMeCardSharingTextFieldTableViewCell *)self directionalLayoutMargins];
  double v4 = v3;
  v5 = [(CNMeCardSharingTextFieldTableViewCell *)self contentView];
  [v5 bounds];
  double Width = CGRectGetWidth(v13);
  [(CNMeCardSharingTextFieldTableViewCell *)self directionalLayoutMargins];
  double v8 = v7;
  [(CNMeCardSharingTextFieldTableViewCell *)self directionalLayoutMargins];
  double v10 = Width - (v8 + v9);
  v11 = [(CNMeCardSharingTextFieldTableViewCell *)self contentView];
  [v11 bounds];
  -[UITextField setFrame:](self->_textField, "setFrame:", v4, 0.0, v10, CGRectGetHeight(v14));
}

- (void)setTextField:(id)a3
{
  v5 = (UITextField *)a3;
  p_textField = &self->_textField;
  textField = self->_textField;
  if (textField != v5)
  {
    v11 = v5;
    double v8 = [(UITextField *)textField superview];
    double v9 = [(CNMeCardSharingTextFieldTableViewCell *)self contentView];

    if (v8 != v9) {
      [(UITextField *)*p_textField removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_textField, a3);
    double v10 = [(CNMeCardSharingTextFieldTableViewCell *)self contentView];
    [v10 addSubview:*p_textField];

    v5 = v11;
  }
}

+ (id)cellIdentifier
{
  return @"CNMeCardSharingTextFieldTableViewCell";
}

@end