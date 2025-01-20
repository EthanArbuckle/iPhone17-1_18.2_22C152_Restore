@interface CNPropertySimpleEditingCell
- (UITextField)textField;
- (id)constantConstraints;
- (id)firstResponderItem;
- (id)valueView;
- (id)variableConstraints;
- (void)dealloc;
- (void)prepareForReuse;
- (void)textFieldChanged:(id)a3;
- (void)updateValueWithPropertyItem:(id)a3;
@end

@implementation CNPropertySimpleEditingCell

- (void).cxx_destruct
{
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)textFieldChanged:(id)a3
{
  id v9 = [a3 object];
  v4 = [(CNPropertyCell *)self propertyItem];
  v5 = [v9 text];
  v6 = [v4 valueForDisplayString:v5];

  v7 = [(CNPropertyCell *)self delegate];
  v8 = [(CNPropertyCell *)self propertyItem];
  [v7 propertyCell:self didUpdateItem:v8 withNewValue:v6];
}

- (id)firstResponderItem
{
  return self->_textField;
}

- (void)prepareForReuse
{
  v3 = [(CNPropertySimpleEditingCell *)self textField];
  [v3 resignFirstResponder];

  v4.receiver = self;
  v4.super_class = (Class)CNPropertySimpleEditingCell;
  [(CNContactCell *)&v4 prepareForReuse];
}

- (void)updateValueWithPropertyItem:(id)a3
{
  id v9 = a3;
  if (([(UITextField *)self->_textField isFirstResponder] & 1) == 0)
  {
    if (v9)
    {
      objc_super v4 = [v9 editingStringValue];
      [(UITextField *)self->_textField setText:v4];

      if ([v9 isReadonly] & 1) != 0 || (objc_msgSend(v9, "isSuggested")) {
        uint64_t v5 = 0;
      }
      else {
        uint64_t v5 = [v9 showValueWithLabelStyle] ^ 1;
      }
      [(UITextField *)self->_textField setUserInteractionEnabled:v5];
      v6 = [v9 placeholderString];
      [(UITextField *)self->_textField setPlaceholder:v6];
    }
    else
    {
      [(UITextField *)self->_textField setText:&stru_1ED8AC728];
      [(UITextField *)self->_textField setPlaceholder:0];
    }
    [(UITextField *)self->_textField _cnui_applyContactStyle];
    v7 = [v9 property];
    id v8 = +[CNKeyboardSettings newKeyboardSettingsForProperty:v7];

    [(UITextField *)self->_textField setKeyboardType:+[CNKeyboardSettings keyboardTypeFromDictionary:v8]];
    [(UITextField *)self->_textField setAutocapitalizationType:+[CNKeyboardSettings autocapitalizationTypeFromDictionary:v8]];
    [(UITextField *)self->_textField setAutocorrectionType:+[CNKeyboardSettings autocorrectionTypeFromDictionary:v8]];
  }
}

- (id)variableConstraints
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v23.receiver = self;
  v23.super_class = (Class)CNPropertySimpleEditingCell;
  objc_super v4 = [(CNPropertyEditingCell *)&v23 variableConstraints];
  uint64_t v5 = [v3 arrayWithArray:v4];

  int v6 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  v7 = (void *)MEMORY[0x1E4F28DC8];
  id v8 = [(CNPropertySimpleEditingCell *)self valueView];
  if (v6)
  {
    id v9 = [(CNPropertyEditingCell *)self labelView];
    v10 = [v7 constraintWithItem:v8 attribute:3 relatedBy:0 toItem:v9 attribute:4 multiplier:1.0 constant:4.0];
    [v5 addObject:v10];

    v11 = [v5 lastObject];
    v12 = v11;
    LODWORD(v13) = 1148846080;
  }
  else
  {
    v14 = [(CNPropertySimpleEditingCell *)self contentView];
    v15 = [v7 constraintWithItem:v8 attribute:10 relatedBy:0 toItem:v14 attribute:10 multiplier:1.0 constant:0.0];
    [v5 addObject:v15];

    v16 = [v5 lastObject];
    LODWORD(v17) = 1148796928;
    [v16 setPriority:v17];

    v18 = (void *)MEMORY[0x1E4F28DC8];
    v19 = [(CNPropertySimpleEditingCell *)self valueView];
    v20 = [(CNPropertySimpleEditingCell *)self contentView];
    v21 = [v18 constraintWithItem:v19 attribute:3 relatedBy:0 toItem:v20 attribute:15 multiplier:1.0 constant:0.0];
    [v5 addObject:v21];

    v11 = [v5 lastObject];
    v12 = v11;
    LODWORD(v13) = 1148813312;
  }
  [v11 setPriority:v13];

  return v5;
}

- (id)constantConstraints
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v13.receiver = self;
  v13.super_class = (Class)CNPropertySimpleEditingCell;
  objc_super v4 = [(CNPropertyEditingCell *)&v13 constantConstraints];
  uint64_t v5 = [v3 arrayWithArray:v4];

  int v6 = (void *)MEMORY[0x1E4F28DC8];
  v7 = [(CNPropertySimpleEditingCell *)self contentView];
  id v8 = [(CNPropertySimpleEditingCell *)self valueView];
  id v9 = [v6 constraintWithItem:v7 attribute:16 relatedBy:0 toItem:v8 attribute:4 multiplier:1.0 constant:0.0];
  [v5 addObject:v9];

  v10 = [v5 lastObject];
  LODWORD(v11) = 1148813312;
  [v10 setPriority:v11];

  return v5;
}

- (id)valueView
{
  textField = self->_textField;
  if (!textField)
  {
    objc_super v4 = [CNTextField alloc];
    uint64_t v5 = -[CNTextField initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    int v6 = self->_textField;
    self->_textField = v5;

    [(UITextField *)self->_textField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)self->_textField setAutocapitalizationType:0];
    [(UITextField *)self->_textField setAutocorrectionType:1];
    [(UITextField *)self->_textField setClearButtonMode:1];
    v7 = [(UITextField *)self->_textField textInputTraits];
    [v7 setReturnKeyGoesToNextResponder:1];

    LODWORD(v8) = 1148846080;
    [(UITextField *)self->_textField setContentHuggingPriority:1 forAxis:v8];
    [(UITextField *)self->_textField _cnui_applyContactStyle];
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:self selector:sel_textFieldChanged_ name:*MEMORY[0x1E4FB3018] object:self->_textField];

    textField = self->_textField;
  }

  return textField;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNPropertySimpleEditingCell;
  [(CNPropertyEditingCell *)&v4 dealloc];
}

@end