@interface CNContactContainerPickerCell
- (BOOL)allowsDeselection;
- (CNContactContainerPickerCell)init;
- (void)setAllowsDeselection:(BOOL)a3;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation CNContactContainerPickerCell

- (void)setAllowsDeselection:(BOOL)a3
{
  self->_allowsDeselection = a3;
}

- (BOOL)allowsDeselection
{
  return self->_allowsDeselection;
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CNContactContainerPickerCell;
  [(CNContactContainerPickerCell *)&v15 updateConfigurationUsingState:v4];
  v5 = [(CNContactContainerPickerCell *)self defaultContentConfiguration];
  v6 = [(CNContactContainerPickerCell *)self contentConfiguration];
  v7 = [v6 text];
  [v5 setText:v7];

  if ([v4 isHighlighted])
  {
    if (![(CNContactContainerPickerCell *)self allowsDeselection]) {
      goto LABEL_7;
    }
  }
  else
  {
    char v8 = [v4 isSelected];
    if (![(CNContactContainerPickerCell *)self allowsDeselection])
    {
LABEL_7:
      v9 = [MEMORY[0x1E4FB1618] grayColor];
      v10 = [MEMORY[0x1E4FB1618] grayColor];
      v11 = @"link.circle.fill";
      goto LABEL_9;
    }
    if ((v8 & 1) == 0)
    {
      v9 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
      v10 = 0;
      v11 = @"circle";
      goto LABEL_9;
    }
  }
  v9 = 0;
  v10 = 0;
  v11 = @"checkmark.circle.fill";
LABEL_9:
  v12 = [MEMORY[0x1E4FB1818] systemImageNamed:v11];
  [v5 setImage:v12];

  v13 = [v5 imageProperties];
  [v13 setTintColor:v9];

  v14 = [v5 textProperties];
  [v14 setColor:v10];

  [(CNContactContainerPickerCell *)self setContentConfiguration:v5];
}

- (CNContactContainerPickerCell)init
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactContainerPickerCell;
  result = [(CNContactContainerPickerCell *)&v3 init];
  if (result) {
    result->_allowsDeselection = 1;
  }
  return result;
}

@end