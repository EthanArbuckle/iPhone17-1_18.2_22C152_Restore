@interface HKMedicalIDEditorDateCell
- (NSDate)dateValue;
- (id)formattedValue;
- (void)_configureDatePicker;
- (void)_dateChanged:(id)a3;
- (void)_hideDatePicker;
- (void)_showDatePicker;
- (void)beginEditing;
- (void)setDateValue:(id)a3;
@end

@implementation HKMedicalIDEditorDateCell

- (id)formattedValue
{
  v3 = (void *)formattedValue___dateFormatter;
  if (!formattedValue___dateFormatter)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v5 = (void *)formattedValue___dateFormatter;
    formattedValue___dateFormatter = (uint64_t)v4;

    [(id)formattedValue___dateFormatter setDateStyle:2];
    v3 = (void *)formattedValue___dateFormatter;
  }
  v6 = [(HKMedicalIDEditorDateCell *)self dateValue];
  v7 = [v3 stringFromDate:v6];

  return v7;
}

- (void)setDateValue:(id)a3
{
  objc_storeStrong((id *)&self->_dateValue, a3);
  [(HKMedicalIDEditorCell *)self updateValueLabel];
}

- (void)_configureDatePicker
{
  if (!self->_picker)
  {
    v3 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E4FB16B0]);
    picker = self->_picker;
    self->_picker = v3;

    [(UIDatePicker *)self->_picker setPreferredDatePickerStyle:1];
    [(UIDatePicker *)self->_picker setDatePickerMode:1];
    v5 = [MEMORY[0x1E4F1C9C8] date];
    [(UIDatePicker *)self->_picker setMaximumDate:v5];

    v6 = (void *)MEMORY[0x1E4F1C9C8];
    v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v8 = objc_msgSend(v6, "hk_minimumDateForBirthDateWithCalendar:", v7);
    [(UIDatePicker *)self->_picker setMinimumDate:v8];

    v9 = +[HKHostingAreaLayoutView viewHostingView:self->_picker];
    v10 = [(HKMedicalIDEditorCell *)self inputTextField];
    [v10 setInputView:v9];

    [(UIDatePicker *)self->_picker addTarget:self action:sel__dateChanged_ forControlEvents:4096];
  }
  if (self->_dateValue)
  {
    -[UIDatePicker setDate:](self->_picker, "setDate:");
  }
  else
  {
    v11 = [MEMORY[0x1E4F1C9C8] date];
    [(UIDatePicker *)self->_picker setDate:v11];
  }
  [(HKMedicalIDEditorDateCell *)self reloadInputViews];
}

- (void)_showDatePicker
{
  [(HKMedicalIDEditorDateCell *)self _configureDatePicker];
  if (!self->_dateValue)
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
    dateValue = self->_dateValue;
    self->_dateValue = v3;

    [(HKMedicalIDEditorCell *)self updateValueLabel];
  }
  id v5 = [(HKMedicalIDEditorCell *)self inputTextField];
  [v5 becomeFirstResponder];
}

- (void)_hideDatePicker
{
  id v2 = [(HKMedicalIDEditorCell *)self inputTextField];
  [v2 resignFirstResponder];
}

- (void)_dateChanged:(id)a3
{
  id v4 = [(UIDatePicker *)self->_picker date];
  dateValue = self->_dateValue;
  self->_dateValue = v4;

  [(HKMedicalIDEditorCell *)self valueDidChange];
}

- (void)beginEditing
{
  v3.receiver = self;
  v3.super_class = (Class)HKMedicalIDEditorDateCell;
  [(HKMedicalIDEditorCell *)&v3 beginEditing];
  [(HKMedicalIDEditorDateCell *)self _showDatePicker];
}

- (NSDate)dateValue
{
  return self->_dateValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateValue, 0);
  objc_storeStrong((id *)&self->_picker, 0);
}

@end