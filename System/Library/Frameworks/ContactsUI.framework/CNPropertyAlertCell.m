@interface CNPropertyAlertCell
+ (BOOL)shouldIndentWhileEditing;
+ (BOOL)wantsChevron;
- (BOOL)allowsCellSelection;
- (BOOL)shouldPerformDefaultAction;
- (CNPropertyAlertCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)alertGroup;
- (void)performDefaultAction;
- (void)picker:(id)a3 didPickItem:(id)a4;
- (void)pickerDidCancel:(id)a3;
- (void)setCardGroupItem:(id)a3;
@end

@implementation CNPropertyAlertCell

- (void)pickerDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = [(CNPropertyCell *)self presentingDelegate];
  [v5 sender:self dismissViewController:v4];
}

- (void)picker:(id)a3 didPickItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CNPropertyCell *)self delegate];
  v9 = [(CNPropertyCell *)self propertyItem];
  [v8 propertyCell:self didUpdateItem:v9 withNewValue:v6];

  if (([(CNPropertyAlertCell *)self isEditing] & 1) == 0)
  {
    v10 = [(CNPropertyCell *)self propertyItem];
    [v10 saveChangesImmediately:1];
  }
  id v11 = [(CNPropertyCell *)self presentingDelegate];
  [v11 sender:self dismissViewController:v7];
}

- (void)performDefaultAction
{
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v5 = [MEMORY[0x1E4FB1F48] keyWindow];
    id v6 = [v5 firstResponder];
    [v6 resignFirstResponder];
  }
  id v7 = [(CNPropertyCell *)self propertyItem];
  v8 = [v7 property];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F1ADA0]];

  if (v9) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2;
  }
  id v11 = [(CNPropertyAlertCell *)self alertItem];
  v12 = [v11 labeledValue];
  id v15 = [v12 value];

  v13 = [[CNTonePickerController alloc] initWithAlertType:v10 activityAlert:v15];
  [(CNTonePickerController *)v13 setDelegate:self];
  v14 = [(CNPropertyCell *)self presentingDelegate];
  [v14 sender:self presentViewController:v13];
}

- (BOOL)shouldPerformDefaultAction
{
  return 1;
}

- (BOOL)allowsCellSelection
{
  v2 = [(CNPropertyAlertCell *)self alertGroup];
  char v3 = [v2 allowsDisplayModePickerActions];

  return v3;
}

- (void)setCardGroupItem:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNPropertyAlertCell;
  -[CNPropertyCell setCardGroupItem:](&v7, sel_setCardGroupItem_);
  if (a3)
  {
    id v5 = [(CNPropertyAlertCell *)self alertGroup];
    int v6 = [v5 allowsDisplayModePickerActions];

    if (v6) {
      [(CNLabeledCell *)self addChevron];
    }
    else {
      [(CNLabeledCell *)self removeChevron];
    }
  }
}

- (id)alertGroup
{
  v2 = [(CNPropertyCell *)self propertyItem];
  char v3 = [v2 group];

  return v3;
}

- (CNPropertyAlertCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CNPropertyAlertCell;
  uint64_t v4 = [(CNPropertyCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  id v5 = v4;
  if (v4)
  {
    int v6 = [(CNPropertySimpleCell *)v4 valueLabel];
    [v6 setNumberOfLines:0];
  }
  return v5;
}

+ (BOOL)shouldIndentWhileEditing
{
  return 0;
}

+ (BOOL)wantsChevron
{
  return 1;
}

@end