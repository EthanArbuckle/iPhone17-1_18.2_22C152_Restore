@interface AXUISettingsEditableTextCell
- (AXUISettingsEditableTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (BOOL)_accessibilityIgnoreInternalLabels;
- (BOOL)shouldAllowSelection;
- (BOOL)shouldDisableTextFieldWhenNotEditing;
- (BOOL)textFieldShouldReturn:(id)a3;
- (UITextField)nameTextField;
- (id)textFieldValue:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)initializeView;
- (void)layoutSubviews;
- (void)markNameTextFieldAccessible;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setNameTextField:(id)a3;
- (void)setSelectionStyle:(int64_t)a3;
- (void)setShouldAllowSelection:(BOOL)a3;
- (void)setShouldDisableTextFieldWhenNotEditing:(BOOL)a3;
- (void)setTextFieldValue:(id)a3 specifier:(id)a4;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateText;
@end

@implementation AXUISettingsEditableTextCell

- (BOOL)_accessibilityIgnoreInternalLabels
{
  return 1;
}

- (AXUISettingsEditableTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)AXUISettingsEditableTextCell;
  id v7 = a5;
  v8 = [(PSTableCell *)&v10 initWithStyle:a3 reuseIdentifier:a4 specifier:v7];
  -[PSTableCell setSpecifier:](v8, "setSpecifier:", v7, v10.receiver, v10.super_class);

  if (v8) {
    [(AXUISettingsEditableTextCell *)v8 initializeView];
  }
  return v8;
}

- (void)markNameTextFieldAccessible
{
  [(UITextField *)self->_nameTextField setIsAccessibilityElement:1];
  nameTextField = self->_nameTextField;
  [(UITextField *)nameTextField setAccessibilityRespondsToUserInteraction:1];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)AXUISettingsEditableTextCell;
  [(AXUISettingsEditableTextCell *)&v3 _accessibilityLoadAccessibilityInformation];
  [(AXUISettingsEditableTextCell *)self markNameTextFieldAccessible];
}

- (void)initializeView
{
  objc_super v3 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
  nameTextField = self->_nameTextField;
  self->_nameTextField = v3;

  [(UITextField *)self->_nameTextField setDelegate:self];
  [(UITextField *)self->_nameTextField setReturnKeyType:9];
  v5 = self->_nameTextField;
  v6 = [(PSTableCell *)self specifier];
  id v7 = [(AXUISettingsEditableTextCell *)self textFieldValue:v6];
  [(UITextField *)v5 setText:v7];

  [(AXUISettingsEditableTextCell *)self markNameTextFieldAccessible];
  v8 = [(PSTableCell *)self specifier];
  v9 = [v8 propertyForKey:@"ShouldDisableTextFieldWhenNotEditing"];
  -[AXUISettingsEditableTextCell setShouldDisableTextFieldWhenNotEditing:](self, "setShouldDisableTextFieldWhenNotEditing:", [v9 BOOLValue]);

  if ([(AXUISettingsEditableTextCell *)self shouldDisableTextFieldWhenNotEditing])
  {
    [(UITextField *)self->_nameTextField setEnabled:0];
  }
  objc_super v10 = [(PSTableCell *)self specifier];
  v11 = [v10 propertyForKey:@"ShouldAllowSelection"];
  -[AXUISettingsEditableTextCell setShouldAllowSelection:](self, "setShouldAllowSelection:", [v11 BOOLValue]);

  if ([(AXUISettingsEditableTextCell *)self shouldAllowSelection])
  {
    [(AXUISettingsEditableTextCell *)self setAccessoryType:1];
    [(AXUISettingsEditableTextCell *)self setUserInteractionEnabled:1];
  }
  else
  {
    [(AXUISettingsEditableTextCell *)self setSelectionStyle:0];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AXUISettingsEditableTextCell;
  [(AXUISettingsEditableTextCell *)&v6 setEditing:a3 animated:a4];
  if ([(AXUISettingsEditableTextCell *)self shouldDisableTextFieldWhenNotEditing])
  {
    [(UITextField *)self->_nameTextField setEnabled:v4];
    if (!v4) {
      [(UITextField *)self->_nameTextField resignFirstResponder];
    }
  }
}

- (void)setSelectionStyle:(int64_t)a3
{
  if (![(AXUISettingsEditableTextCell *)self shouldAllowSelection])
  {
    v5.receiver = self;
    v5.super_class = (Class)AXUISettingsEditableTextCell;
    [(AXUISettingsEditableTextCell *)&v5 setSelectionStyle:a3];
  }
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)AXUISettingsEditableTextCell;
  [(PSTableCell *)&v15 layoutSubviews];
  objc_super v3 = [(AXUISettingsEditableTextCell *)self contentView];
  BOOL v4 = [(AXUISettingsEditableTextCell *)self textLabel];
  objc_super v5 = [v4 superview];

  if (v5 == v3) {
    [v4 removeFromSuperview];
  }
  objc_super v6 = [(UITextField *)self->_nameTextField superview];

  if (v6 != v3) {
    [v3 addSubview:self->_nameTextField];
  }
  nameTextField = self->_nameTextField;
  v8 = [v3 backgroundColor];
  [(UITextField *)nameTextField setBackgroundColor:v8];

  v9 = self->_nameTextField;
  objc_super v10 = [v4 font];
  [(UITextField *)v9 setFont:v10];

  v11 = self->_nameTextField;
  [v4 frame];
  -[UITextField setFrame:](v11, "setFrame:");
  v12 = self->_nameTextField;
  v13 = [MEMORY[0x1E4F92E40] appearance];
  v14 = [v13 textColor];
  [(UITextField *)v12 setTextColor:v14];
}

- (void)updateText
{
  id v4 = [(PSTableCell *)self specifier];
  objc_super v3 = [(AXUISettingsEditableTextCell *)self textFieldValue:v4];
  [(UITextField *)self->_nameTextField setText:v3];
}

- (id)textFieldValue:(id)a3
{
  objc_super v3 = (char *)a3;
  id v4 = v3;
  if (v3)
  {
    objc_super v5 = [v3 target];
    objc_super v6 = (int *)MEMORY[0x1E4F92F38];
    if (!v5 || (uint64_t v7 = *(void *)&v4[*MEMORY[0x1E4F92F38]], v5, !v7)) {
      _AXAssert();
    }
    v8 = [v4 target];
    v9 = [v8 performSelector:*(void *)&v4[*v6] withObject:v4];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setTextFieldValue:(id)a3 specifier:(id)a4
{
  id v11 = a3;
  objc_super v5 = (char *)a4;
  objc_super v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 target];
    v8 = (int *)MEMORY[0x1E4F92F40];
    if (!v7 || (uint64_t v9 = *(void *)&v6[*MEMORY[0x1E4F92F40]], v7, !v9)) {
      _AXAssert();
    }
    objc_super v10 = [v6 target];
    [v10 performSelector:*(void *)&v6[*v8] withObject:v11 withObject:v6];
  }
  else
  {
    _AXAssert();
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  if (self->_nameTextField == a3) {
    [a3 resignFirstResponder];
  }
  return 0;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v7 = [(UITextField *)self->_nameTextField text];
  id v4 = [(PSTableCell *)self specifier];
  if (v4)
  {
    objc_super v5 = [(AXUISettingsEditableTextCell *)self textFieldValue:v4];
    char v6 = [v5 isEqualToString:v7];

    if ((v6 & 1) == 0) {
      [(AXUISettingsEditableTextCell *)self setTextFieldValue:v7 specifier:v4];
    }
  }
}

- (UITextField)nameTextField
{
  return self->_nameTextField;
}

- (void)setNameTextField:(id)a3
{
}

- (BOOL)shouldDisableTextFieldWhenNotEditing
{
  return self->_shouldDisableTextFieldWhenNotEditing;
}

- (void)setShouldDisableTextFieldWhenNotEditing:(BOOL)a3
{
  self->_shouldDisableTextFieldWhenNotEditing = a3;
}

- (BOOL)shouldAllowSelection
{
  return self->_shouldAllowSelection;
}

- (void)setShouldAllowSelection:(BOOL)a3
{
  self->_shouldAllowSelection = a3;
}

- (void).cxx_destruct
{
}

@end