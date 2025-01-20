@interface HUEditableTextCell
- (BOOL)isDisabled;
- (HUEditableTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UITextField)textField;
- (void)prepareForReuse;
- (void)setDisabled:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation HUEditableTextCell

- (HUEditableTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v32.receiver = self;
  v32.super_class = (Class)HUEditableTextCell;
  v4 = [(HUEditableTextCell *)&v32 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F42F10]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    textField = v4->_textField;
    v4->_textField = (UITextField *)v6;

    v8 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [(UITextField *)v4->_textField setFont:v8];

    [(UITextField *)v4->_textField setAdjustsFontForContentSizeCategory:1];
    [(UITextField *)v4->_textField setReturnKeyType:9];
    [(UITextField *)v4->_textField setClearButtonMode:3];
    v9 = [(HUEditableTextCell *)v4 contentView];
    [v9 addSubview:v4->_textField];

    v10 = [MEMORY[0x1E4F1CA48] array];
    [(UITextField *)v4->_textField setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [(UITextField *)v4->_textField topAnchor];
    v12 = [(HUEditableTextCell *)v4 contentView];
    v13 = [v12 layoutMarginsGuide];
    v14 = [v13 topAnchor];
    v15 = [v11 constraintEqualToAnchor:v14];
    [v10 addObject:v15];

    v16 = [(UITextField *)v4->_textField bottomAnchor];
    v17 = [(HUEditableTextCell *)v4 contentView];
    v18 = [v17 layoutMarginsGuide];
    v19 = [v18 bottomAnchor];
    v20 = [v16 constraintEqualToAnchor:v19];
    [v10 addObject:v20];

    v21 = [(UITextField *)v4->_textField leadingAnchor];
    v22 = [(HUEditableTextCell *)v4 contentView];
    v23 = [v22 layoutMarginsGuide];
    v24 = [v23 leadingAnchor];
    v25 = [v21 constraintEqualToAnchor:v24];
    [v10 addObject:v25];

    v26 = [(UITextField *)v4->_textField trailingAnchor];
    v27 = [(HUEditableTextCell *)v4 contentView];
    v28 = [v27 layoutMarginsGuide];
    v29 = [v28 trailingAnchor];
    v30 = [v26 constraintEqualToAnchor:v29];
    [v10 addObject:v30];

    [MEMORY[0x1E4F28DC8] activateConstraints:v10];
  }
  return v4;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HUEditableTextCell;
  [(HUEditableTextCell *)&v7 setSelected:a3 animated:a4];
  if (v4)
  {
    uint64_t v6 = [(HUEditableTextCell *)self textField];
    [v6 becomeFirstResponder];
  }
}

- (void)setDisabled:(BOOL)a3
{
  BOOL v4 = !a3;
  id v5 = [(HUEditableTextCell *)self textField];
  [v5 setEnabled:v4];

  if (v4) {
    [MEMORY[0x1E4F428B8] labelColor];
  }
  else {
  uint64_t v6 = [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  objc_super v7 = [(HUEditableTextCell *)self textField];
  [v7 setTextColor:v6];

  id v8 = [(HUEditableTextCell *)self textField];
  [v8 setClearButtonMode:v4];
}

- (void)prepareForReuse
{
  v8.receiver = self;
  v8.super_class = (Class)HUEditableTextCell;
  [(HUEditableTextCell *)&v8 prepareForReuse];
  v3 = [(HUEditableTextCell *)self textField];
  [v3 setText:0];

  BOOL v4 = [(HUEditableTextCell *)self textField];
  [v4 setPlaceholder:0];

  id v5 = [(HUEditableTextCell *)self textField];
  [v5 setDelegate:0];

  uint64_t v6 = [(HUEditableTextCell *)self textField];
  [v6 setEnabled:1];

  objc_super v7 = [(HUEditableTextCell *)self textField];
  [v7 endEditing:1];
}

- (UITextField)textField
{
  return self->_textField;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void).cxx_destruct
{
}

@end