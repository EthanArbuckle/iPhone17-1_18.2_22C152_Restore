@interface HKMedicalIDEditorPickerCell
- (NSArray)possibleValues;
- (id)formattedValue;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)chosenValueIndex;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)_hidePicker;
- (void)_showPicker;
- (void)beginEditing;
- (void)dealloc;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setChosenValueIndex:(int64_t)a3;
- (void)setPossibleValues:(id)a3;
@end

@implementation HKMedicalIDEditorPickerCell

- (id)formattedValue
{
  unint64_t chosenValueIndex = self->_chosenValueIndex;
  if (chosenValueIndex >= [(NSArray *)self->_possibleValues count])
  {
    v4 = 0;
  }
  else
  {
    v4 = [(NSArray *)self->_possibleValues objectAtIndexedSubscript:self->_chosenValueIndex];
  }
  return v4;
}

- (void)setChosenValueIndex:(int64_t)a3
{
  self->_unint64_t chosenValueIndex = a3;
  [(HKMedicalIDEditorCell *)self updateValueLabel];
}

- (void)_showPicker
{
  picker = self->_picker;
  if (!picker)
  {
    v4 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E4FB1A98]);
    v5 = self->_picker;
    self->_picker = v4;

    [(UIPickerView *)self->_picker setDataSource:self];
    [(UIPickerView *)self->_picker setDelegate:self];
    v6 = +[HKHostingAreaLayoutView viewHostingView:self->_picker];
    v7 = [(HKMedicalIDEditorCell *)self inputTextField];
    [v7 setInputView:v6];

    picker = self->_picker;
  }
  [(UIPickerView *)picker reloadAllComponents];
  [(UIPickerView *)self->_picker selectRow:self->_chosenValueIndex inComponent:0 animated:0];
  [(HKMedicalIDEditorPickerCell *)self reloadInputViews];
  id v8 = [(HKMedicalIDEditorCell *)self inputTextField];
  [v8 becomeFirstResponder];
}

- (void)_hidePicker
{
  id v2 = [(HKMedicalIDEditorCell *)self inputTextField];
  [v2 resignFirstResponder];
}

- (void)dealloc
{
  [(UIPickerView *)self->_picker setDataSource:0];
  [(UIPickerView *)self->_picker setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)HKMedicalIDEditorPickerCell;
  [(HKMedicalIDEditorCell *)&v3 dealloc];
}

- (void)beginEditing
{
  v3.receiver = self;
  v3.super_class = (Class)HKMedicalIDEditorPickerCell;
  [(HKMedicalIDEditorCell *)&v3 beginEditing];
  [(HKMedicalIDEditorPickerCell *)self _showPicker];
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return [(NSArray *)self->_possibleValues count];
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  return [(NSArray *)self->_possibleValues objectAtIndexedSubscript:a4];
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  self->_unint64_t chosenValueIndex = -[UIPickerView selectedRowInComponent:](self->_picker, "selectedRowInComponent:", 0, a4, a5);
  [(HKMedicalIDEditorCell *)self valueDidChange];
}

- (int64_t)chosenValueIndex
{
  return self->_chosenValueIndex;
}

- (NSArray)possibleValues
{
  return self->_possibleValues;
}

- (void)setPossibleValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleValues, 0);
  objc_storeStrong((id *)&self->_picker, 0);
}

@end