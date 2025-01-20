@interface CNPropertyPostalAddressEditingCell
- (CNPostalAddressEditorView)addressEditor;
- (UIColor)editorSeparatorColor;
- (double)leftValueMargin;
- (id)variableConstraints;
- (void)layoutChanged:(id)a3;
- (void)layoutMarginsDidChange;
- (void)setAddressEditor:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setEditorSeparatorColor:(id)a3;
- (void)setPresentingDelegate:(id)a3;
- (void)updateWithPropertyItem:(id)a3;
- (void)valueChanged:(id)a3;
@end

@implementation CNPropertyPostalAddressEditingCell

- (void).cxx_destruct
{
}

- (void)setAddressEditor:(id)a3
{
}

- (void)layoutMarginsDidChange
{
  [(CNPropertyPostalAddressEditingCell *)self layoutMargins];
  [(CNPostalAddressEditorView *)self->_addressEditor setLayoutMargins:"setLayoutMargins:"];
  v3.receiver = self;
  v3.super_class = (Class)CNPropertyPostalAddressEditingCell;
  [(CNPropertyPostalAddressEditingCell *)&v3 layoutMarginsDidChange];
}

- (void)setBackgroundColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNPropertyPostalAddressEditingCell;
  id v4 = a3;
  [(CNPropertyPostalAddressEditingCell *)&v6 setBackgroundColor:v4];
  v5 = [(CNPropertyPostalAddressEditingCell *)self addressEditor];
  [v5 setBackgroundColor:v4];
}

- (UIColor)editorSeparatorColor
{
  v2 = [(CNPropertyPostalAddressEditingCell *)self addressEditor];
  objc_super v3 = [v2 separatorColor];

  return (UIColor *)v3;
}

- (void)setEditorSeparatorColor:(id)a3
{
  id v4 = a3;
  id v5 = [(CNPropertyPostalAddressEditingCell *)self addressEditor];
  [v5 setSeparatorColor:v4];
}

- (void)layoutChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CNPropertyCell *)self delegate];
  [v5 propertyCellDidChangeLayout:self];

  uint64_t v6 = [v4 lineCount];
  id v7 = [(CNPropertyEditingCell *)self vseparator];
  [v7 setLineCount:v6];
}

- (void)valueChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CNPropertyCell *)self propertyItem];
  uint64_t v6 = [v4 address];
  [v5 updateLabeledValueWithValue:v6];

  id v9 = [(CNPropertyCell *)self delegate];
  id v7 = [(CNPropertyCell *)self propertyItem];
  v8 = [v4 address];

  [v9 propertyCell:self didUpdateItem:v7 withNewValue:v8];
}

- (void)updateWithPropertyItem:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNPropertyPostalAddressEditingCell;
  [(CNPropertyEditingCell *)&v12 updateWithPropertyItem:v4];
  id v5 = [v4 labeledValue];
  uint64_t v6 = [v5 value];

  id v7 = [(CNPropertyPostalAddressEditingCell *)self addressEditor];
  [v7 setAddress:v6];

  if ([v4 isReadonly]) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = [v4 isSuggested] ^ 1;
  }
  id v9 = [(CNPropertyPostalAddressEditingCell *)self addressEditor];
  [v9 setEnabled:v8];

  int64_t v10 = [(CNPostalAddressEditorView *)self->_addressEditor lineCount];
  v11 = [(CNPropertyEditingCell *)self vseparator];
  [v11 setLineCount:v10];
}

- (void)setPresentingDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNPropertyPostalAddressEditingCell;
  id v4 = a3;
  [(CNPropertyCell *)&v6 setPresentingDelegate:v4];
  id v5 = [(CNPropertyPostalAddressEditingCell *)self addressEditor];
  [v5 setDelegate:v4];
}

- (CNPostalAddressEditorView)addressEditor
{
  addressEditor = self->_addressEditor;
  if (!addressEditor)
  {
    id v4 = [CNPostalAddressEditorView alloc];
    id v5 = -[CNPostalAddressEditorView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    objc_super v6 = self->_addressEditor;
    self->_addressEditor = v5;

    [(CNPostalAddressEditorView *)self->_addressEditor setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNPostalAddressEditorView *)self->_addressEditor addTarget:self action:sel_valueChanged_ forControlEvents:4096];
    [(CNPostalAddressEditorView *)self->_addressEditor addTarget:self action:sel_layoutChanged_ forControlEvents:0x1000000];
    id v7 = [(CNPropertyPostalAddressEditingCell *)self contentView];
    [v7 addSubview:self->_addressEditor];

    uint64_t v8 = [(CNPropertyCell *)self propertyItem];
    id v9 = [v8 labeledValue];
    int64_t v10 = [v9 value];
    [(CNPostalAddressEditorView *)self->_addressEditor setAddress:v10];

    int64_t v11 = [(CNPostalAddressEditorView *)self->_addressEditor lineCount];
    objc_super v12 = [(CNPropertyEditingCell *)self vseparator];
    [v12 setLineCount:v11];

    addressEditor = self->_addressEditor;
  }

  return addressEditor;
}

- (double)leftValueMargin
{
  return 0.0;
}

- (id)variableConstraints
{
  v17[2] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)MEMORY[0x1E4F1CA48];
  v15.receiver = self;
  v15.super_class = (Class)CNPropertyPostalAddressEditingCell;
  id v4 = [(CNPropertyEditingCell *)&v15 variableConstraints];
  id v5 = [v3 arrayWithArray:v4];

  v16[0] = @"labelButton";
  objc_super v6 = [(CNPropertyEditingCell *)self labelButton];
  v16[1] = @"addressEditor";
  v17[0] = v6;
  id v7 = [(CNPropertyPostalAddressEditingCell *)self addressEditor];
  v17[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  if (objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
  {
    id v9 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[labelButton]-0-[addressEditor]-0-|" options:0 metrics:0 views:v8];
    [v5 addObjectsFromArray:v9];
  }
  else
  {
    int64_t v10 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-0-[addressEditor]-0-|" options:0 metrics:0 views:v8];
    [v5 addObjectsFromArray:v10];

    int64_t v11 = (void *)MEMORY[0x1E4F28DC8];
    id v9 = [(CNPropertyEditingCell *)self labelButton];
    objc_super v12 = [(CNPropertyPostalAddressEditingCell *)self contentView];
    v13 = [v11 constraintWithItem:v9 attribute:10 relatedBy:0 toItem:v12 attribute:10 multiplier:1.0 constant:0.0];
    [v5 addObject:v13];
  }

  return v5;
}

@end