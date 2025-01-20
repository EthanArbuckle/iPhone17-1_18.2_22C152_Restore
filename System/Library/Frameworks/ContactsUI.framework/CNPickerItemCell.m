@interface CNPickerItemCell
- (BOOL)isPlaceholder;
- (CNPickerItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UITextField)textField;
- (void)beginEditing;
- (void)endEditing;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setPlaceholder:(BOOL)a3;
- (void)setTextField:(id)a3;
- (void)setTextFieldHidden:(BOOL)a3;
@end

@implementation CNPickerItemCell

- (void).cxx_destruct
{
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (void)setTextField:(id)a3
{
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextFieldHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CNPickerItemCell *)self textField];
  [v5 setHidden:v3];

  id v6 = [(CNPickerItemCell *)self textLabel];
  [v6 setHidden:v3 ^ 1];
}

- (void)endEditing
{
  BOOL v3 = [(CNPickerItemCell *)self textField];
  v4 = [v3 text];
  -[CNPickerItemCell setTextFieldHidden:](self, "setTextFieldHidden:", [v4 length] == 0);

  v5 = [(CNPickerItemCell *)self textField];
  LODWORD(v4) = [v5 isFirstResponder];

  if (v4)
  {
    id v6 = [(CNPickerItemCell *)self textField];
    [v6 resignFirstResponder];
  }
}

- (void)beginEditing
{
  [(CNPickerItemCell *)self setTextFieldHidden:0];
  id v3 = [(CNPickerItemCell *)self textField];
  [v3 becomeFirstResponder];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CNPickerItemCell;
  [(CNPickerItemCell *)&v4 prepareForReuse];
  id v3 = [(CNPickerItemCell *)self textField];
  [v3 setText:&stru_1ED8AC728];

  [(CNPickerItemCell *)self setTextFieldHidden:1];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CNPickerItemCell;
  [(CNPickerItemCell *)&v13 layoutSubviews];
  id v3 = [(CNPickerItemCell *)self textLabel];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(CNPickerItemCell *)self textField];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (CNPickerItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CNPickerItemCell;
  double v4 = [(CNPickerItemCell *)&v11 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB1D70]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    textField = v4->_textField;
    v4->_textField = (UITextField *)v6;

    [(UITextField *)v4->_textField setAutoresizingMask:18];
    [(UITextField *)v4->_textField setClearButtonMode:1];
    [(UITextField *)v4->_textField setHidden:1];
    [(UITextField *)v4->_textField _cnui_applyContactStyle];
    double v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
    [(UITextField *)v4->_textField setFont:v8];

    double v9 = [(CNPickerItemCell *)v4 contentView];
    [v9 addSubview:v4->_textField];
  }
  return v4;
}

@end