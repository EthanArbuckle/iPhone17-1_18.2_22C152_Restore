@interface SCATCameraPointPickerEditableTableCellWithStepper
- (void)_updateTextFieldWidth:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation SCATCameraPointPickerEditableTableCellWithStepper

- (void)textFieldDidBeginEditing:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCATCameraPointPickerEditableTableCellWithStepper;
  id v4 = a3;
  [(AXUISettingsEditableTableCellWithStepper *)&v5 textFieldDidEndEditing:v4];
  -[SCATCameraPointPickerEditableTableCellWithStepper _updateTextFieldWidth:](self, "_updateTextFieldWidth:", v4, v5.receiver, v5.super_class);
}

- (void)textFieldDidEndEditing:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCATCameraPointPickerEditableTableCellWithStepper;
  id v4 = a3;
  [(AXUISettingsEditableTableCellWithStepper *)&v5 textFieldDidEndEditing:v4];
  -[SCATCameraPointPickerEditableTableCellWithStepper _updateTextFieldWidth:](self, "_updateTextFieldWidth:", v4, v5.receiver, v5.super_class);
}

- (void)_updateTextFieldWidth:(id)a3
{
  id v3 = a3;
  [v3 frame];
  objc_msgSend(v3, "setFrame:");
}

@end