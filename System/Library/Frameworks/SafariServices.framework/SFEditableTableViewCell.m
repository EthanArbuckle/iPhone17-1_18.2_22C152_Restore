@interface SFEditableTableViewCell
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)isEnabled;
- (SFEditableTableViewCell)initWithEnabledState:(BOOL)a3;
- (SFEditableTableViewCellDelegate)delegate;
- (UIColor)overrideEditableTextFieldTextColor;
- (void)_updateTextFieldTextColor;
- (void)copy:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setOverrideEditableTextFieldTextColor:(id)a3;
- (void)tintColorDidChange;
@end

@implementation SFEditableTableViewCell

- (SFEditableTableViewCell)initWithEnabledState:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFEditableTableViewCell;
  v4 = [(SFEditableTableViewCell *)&v11 initWithStyle:1000 reuseIdentifier:@"editableTableViewCell"];
  v5 = v4;
  if (v4)
  {
    v6 = [(SFEditableTableViewCell *)v4 editableTextField];
    if ([(SFEditableTableViewCell *)v5 _sf_usesLeftToRightLayout]) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 0;
    }
    [v6 setTextAlignment:v7];
    [v6 setAutocapitalizationType:0];
    [v6 setAutocorrectionType:1];
    v8 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v6 setFont:v8];

    [(SFEditableTableViewCell *)v5 setEnabled:v3];
    v9 = v5;
  }
  return v5;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SFEditableTableViewCell;
  [(SFEditableTableViewCell *)&v3 tintColorDidChange];
  [(SFEditableTableViewCell *)self _updateTextFieldTextColor];
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  id v4 = [(SFEditableTableViewCell *)self editableTextField];
  [v4 setEnabled:self->_enabled];
  [(SFEditableTableViewCell *)self _updateTextFieldTextColor];
}

- (void)setOverrideEditableTextFieldTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideEditableTextFieldTextColor, a3);

  [(SFEditableTableViewCell *)self _updateTextFieldTextColor];
}

- (void)_updateTextFieldTextColor
{
  overrideEditableTextFieldTextColor = self->_overrideEditableTextFieldTextColor;
  if (overrideEditableTextFieldTextColor)
  {
    id v5 = [(SFEditableTableViewCell *)self editableTextField];
    [v5 setTextColor:overrideEditableTextFieldTextColor];
  }
  else
  {
    if (self->_enabled) {
      [MEMORY[0x1E4FB1618] labelColor];
    }
    else {
    id v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    id v4 = [(SFEditableTableViewCell *)self editableTextField];
    [v4 setTextColor:v5];
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel_copy_ == a3)
  {
    id v5 = [(SFEditableTableViewCell *)self editableTextField];
    v6 = [v5 text];
    BOOL v4 = [v6 length] != 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SFEditableTableViewCell;
    return -[SFEditableTableViewCell canPerformAction:withSender:](&v8, sel_canPerformAction_withSender_);
  }
  return v4;
}

- (void)copy:(id)a3
{
  id v10 = [(SFEditableTableViewCell *)self editableTextField];
  BOOL v4 = [v10 text];
  id v5 = [(SFEditableTableViewCell *)self _tableView];
  int v6 = [v5 isEditing];

  if (v6)
  {
    uint64_t v7 = [v10 selectedTextRange];
    if (([v7 isEmpty] & 1) == 0)
    {
      uint64_t v8 = [v10 textInRange:v7];

      BOOL v4 = (void *)v8;
    }
  }
  v9 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  objc_msgSend(v9, "safari_setSensitiveString:", v4);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (SFEditableTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFEditableTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIColor)overrideEditableTextFieldTextColor
{
  return self->_overrideEditableTextFieldTextColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideEditableTextFieldTextColor, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end