@interface CNPropertyGeminiEditingCell
+ (BOOL)shouldIndentWhileEditing;
+ (BOOL)wantsChevron;
+ (BOOL)wantsHorizontalLayout;
- (BOOL)shouldPerformDefaultAction;
- (CNGeminiPickerController)geminiPicker;
- (CNPropertyGeminiEditingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (double)minCellHeight;
- (id)variableConstraints;
- (void)geminiDataSourceDidUpdate:(id)a3;
- (void)performDefaultAction;
- (void)picker:(id)a3 didPickItem:(id)a4;
- (void)pickerDidCancel:(id)a3;
- (void)setGeminiPicker:(id)a3;
@end

@implementation CNPropertyGeminiEditingCell

- (void).cxx_destruct
{
}

- (void)setGeminiPicker:(id)a3
{
}

- (CNGeminiPickerController)geminiPicker
{
  return self->_geminiPicker;
}

- (void)geminiDataSourceDidUpdate:(id)a3
{
  id v4 = a3;
  id v6 = [(CNPropertyGeminiEditingCell *)self geminiPicker];
  v5 = [v4 geminiResult];

  [v6 setGeminiResult:v5];
}

- (void)pickerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = [(CNPropertyCell *)self presentingDelegate];
  [v5 sender:self dismissViewController:v4];

  [(CNPropertyGeminiEditingCell *)self setGeminiPicker:0];
}

- (void)picker:(id)a3 didPickItem:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1B9F8];
  id v7 = a3;
  uint64_t v8 = [v6 channelStringFromSenderIdentity:a4];
  v9 = (void *)v8;
  v10 = &stru_1ED8AC728;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  v11 = v10;

  v12 = [(CNPropertyCell *)self delegate];
  v13 = [(CNPropertyCell *)self propertyItem];
  [v12 propertyCell:self didUpdateItem:v13 withNewValue:v11];

  v14 = [(CNPropertyCell *)self presentingDelegate];
  [v14 sender:self dismissViewController:v7];

  [(CNPropertyGeminiEditingCell *)self setGeminiPicker:0];
}

- (void)performDefaultAction
{
  v3 = [(CNPropertyGeminiEditingCell *)self geminiItem];
  id v7 = [v3 geminiResult];

  id v4 = [[CNGeminiPickerController alloc] initWithGeminiResult:v7];
  [(CNPropertyGeminiEditingCell *)self setGeminiPicker:v4];
  v5 = [(CNPropertyCell *)self propertyItem];
  [v5 setGeminiUpdateDelegate:self];
  [(CNGeminiPickerController *)v4 setDelegate:self];
  id v6 = [(CNPropertyCell *)self presentingDelegate];
  [v6 sender:self presentViewController:v4];
}

- (BOOL)shouldPerformDefaultAction
{
  return 1;
}

- (id)variableConstraints
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v11.receiver = self;
  v11.super_class = (Class)CNPropertyGeminiEditingCell;
  id v4 = [(CNLabeledCell *)&v11 variableConstraints];
  v5 = [v3 arrayWithArray:v4];

  if ((objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
  {
    id v6 = (void *)MEMORY[0x1E4F28DC8];
    id v7 = [(CNPropertySimpleCell *)self labelView];
    uint64_t v8 = [(CNPropertyGeminiEditingCell *)self contentView];
    v9 = [v6 constraintWithItem:v7 attribute:10 relatedBy:0 toItem:v8 attribute:10 multiplier:1.0 constant:0.0];
    [v5 addObject:v9];
  }

  return v5;
}

- (double)minCellHeight
{
  return 44.0;
}

- (CNPropertyGeminiEditingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CNPropertyGeminiEditingCell;
  id v4 = [(CNPropertyCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    id v6 = [(CNPropertySimpleCell *)v4 valueLabel];
    [v6 setNumberOfLines:0];

    id v7 = v5;
  }

  return v5;
}

+ (BOOL)wantsHorizontalLayout
{
  return objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1;
}

+ (BOOL)wantsChevron
{
  return 1;
}

+ (BOOL)shouldIndentWhileEditing
{
  return 0;
}

@end