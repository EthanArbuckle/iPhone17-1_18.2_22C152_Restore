@interface CNPropertyRelatedNameEditingCell
- (CNPropertyRelatedNameEditingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)performAccessoryAction;
@end

@implementation CNPropertyRelatedNameEditingCell

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1B910];
  id v7 = a3;
  v8 = [v6 stringFromContact:a4 style:0];
  v9 = [(CNPropertyCell *)self propertyItem];
  v10 = [v9 valueForDisplayString:v8];

  v11 = [(CNPropertyCell *)self delegate];
  v12 = [(CNPropertyCell *)self propertyItem];
  [v11 propertyCell:self didUpdateItem:v12 withNewValue:v10];

  v13 = [(CNPropertyCell *)self presentingDelegate];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__CNPropertyRelatedNameEditingCell_contactPicker_didSelectContact___block_invoke;
  v14[3] = &unk_1E549B488;
  v14[4] = self;
  [v13 sender:self dismissViewController:v7 completionHandler:v14];
}

uint64_t __67__CNPropertyRelatedNameEditingCell_contactPicker_didSelectContact___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) regainFocus];
}

- (void)contactPickerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = [(CNPropertyCell *)self presentingDelegate];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__CNPropertyRelatedNameEditingCell_contactPickerDidCancel___block_invoke;
  v6[3] = &unk_1E549B488;
  v6[4] = self;
  [v5 sender:self dismissViewController:v4 completionHandler:v6];
}

uint64_t __59__CNPropertyRelatedNameEditingCell_contactPickerDidCancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) regainFocus];
}

- (void)performAccessoryAction
{
  v5 = objc_alloc_init(CNContactPickerViewController);
  [(CNContactPickerViewController *)v5 setDelegate:self];
  [(CNContactPickerViewController *)v5 setMode:2];
  v3 = [(CNPropertySimpleEditingCell *)self textField];
  [v3 resignFirstResponder];

  id v4 = [(CNPropertyCell *)self presentingDelegate];
  [v4 sender:self presentViewController:v5];
}

- (CNPropertyRelatedNameEditingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CNPropertyRelatedNameEditingCell;
  id v4 = [(CNPropertyEditingCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(CNPropertyRelatedNameEditingCell *)v4 setEditingAccessoryType:2];
  }
  return v5;
}

@end