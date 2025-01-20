@interface CNMeCardSharingSettingsNameEditingCell
+ (id)cellIdentifier;
- (UITextField)textField;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setTextField:(id)a3;
@end

@implementation CNMeCardSharingSettingsNameEditingCell

- (void).cxx_destruct
{
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CNMeCardSharingSettingsNameEditingCell;
  [(CNMeCardSharingSettingsNameEditingCell *)&v4 prepareForReuse];
  [(UITextField *)self->_textField removeFromSuperview];
  textField = self->_textField;
  self->_textField = 0;
}

- (void)setTextField:(id)a3
{
  v5 = (UITextField *)a3;
  p_textField = &self->_textField;
  textField = self->_textField;
  v11 = v5;
  if (textField != v5)
  {
    v8 = [(UITextField *)textField superview];
    v9 = [(CNMeCardSharingSettingsNameEditingCell *)self contentView];

    if (v8 == v9) {
      [(UITextField *)*p_textField removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_textField, a3);
    v10 = [(CNMeCardSharingSettingsNameEditingCell *)self contentView];
    [v10 addSubview:*p_textField];
  }
  [(CNMeCardSharingSettingsNameEditingCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)CNMeCardSharingSettingsNameEditingCell;
  [(CNMeCardSharingSettingsNameEditingCell *)&v15 layoutSubviews];
  v3 = [(CNMeCardSharingSettingsNameEditingCell *)self contentView];
  [v3 layoutMargins];
  double v5 = v4;
  v6 = [(CNMeCardSharingSettingsNameEditingCell *)self contentView];
  [v6 bounds];
  double Width = CGRectGetWidth(v16);
  v8 = [(CNMeCardSharingSettingsNameEditingCell *)self contentView];
  [v8 layoutMargins];
  double v10 = v9;
  v11 = [(CNMeCardSharingSettingsNameEditingCell *)self contentView];
  [v11 layoutMargins];
  double v13 = Width - (v10 + v12);
  v14 = [(CNMeCardSharingSettingsNameEditingCell *)self contentView];
  [v14 bounds];
  -[UITextField setFrame:](self->_textField, "setFrame:", v5, 0.0, v13, CGRectGetHeight(v17));
}

+ (id)cellIdentifier
{
  return @"CNMeCardSharingSettingsNameEditingCell";
}

@end