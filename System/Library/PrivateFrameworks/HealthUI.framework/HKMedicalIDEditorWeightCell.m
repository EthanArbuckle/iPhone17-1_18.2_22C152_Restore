@interface HKMedicalIDEditorWeightCell
- (HKMedicalIDEditorWeightCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSNumber)kilogramValue;
- (id)formattedValue;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)_commonInit;
- (void)_hidePicker;
- (void)_localeDidChange:(id)a3;
- (void)_showPicker;
- (void)beginEditing;
- (void)dealloc;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setKilogramValue:(id)a3;
@end

@implementation HKMedicalIDEditorWeightCell

- (HKMedicalIDEditorWeightCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKMedicalIDEditorWeightCell;
  v4 = [(HKMedicalIDEditorCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(HKMedicalIDEditorWeightCell *)v4 _commonInit];
  }
  return v5;
}

- (void)_commonInit
{
  self->_numberOfRowsForPicker = +[HKMedicalIDWeightPickerDataProvider numberOfRows];
}

- (void)_localeDidChange:(id)a3
{
  [(HKMedicalIDEditorWeightCell *)self _commonInit];
  [(HKMedicalIDEditorCell *)self updateValueLabel];
}

- (void)setKilogramValue:(id)a3
{
  objc_storeStrong((id *)&self->_kilogramValue, a3);
  [(HKMedicalIDEditorCell *)self updateValueLabel];
}

- (id)formattedValue
{
  v3 = +[HKPersonWeightFormatter sharedFormatter];
  v4 = [(HKMedicalIDEditorWeightCell *)self kilogramValue];
  v5 = [v3 stringFromWeightInKilograms:v4];

  return v5;
}

- (void)_showPicker
{
  v3 = [(HKMedicalIDEditorWeightCell *)self kilogramValue];

  if (!v3)
  {
    v4 = NSNumber;
    [(id)objc_opt_class() defaultKilogramValue];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [(HKMedicalIDEditorWeightCell *)self setKilogramValue:v5];
  }
  picker = self->_picker;
  if (!picker)
  {
    objc_super v7 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E4FB1A98]);
    v8 = self->_picker;
    self->_picker = v7;

    [(UIPickerView *)self->_picker setDataSource:self];
    [(UIPickerView *)self->_picker setDelegate:self];
    v9 = +[HKHostingAreaLayoutView viewHostingView:self->_picker];
    v10 = [(HKMedicalIDEditorCell *)self inputTextField];
    [v10 setInputView:v9];

    picker = self->_picker;
  }
  [(UIPickerView *)picker reloadAllComponents];
  v11 = [(HKMedicalIDEditorWeightCell *)self kilogramValue];
  [v11 doubleValue];
  int64_t v12 = +[HKMedicalIDWeightPickerDataProvider rowForWeightInKilograms:](HKMedicalIDWeightPickerDataProvider, "rowForWeightInKilograms:");

  [(UIPickerView *)self->_picker selectRow:v12 inComponent:0 animated:0];
  [(HKMedicalIDEditorWeightCell *)self reloadInputViews];
  id v13 = [(HKMedicalIDEditorCell *)self inputTextField];
  [v13 becomeFirstResponder];
}

- (void)dealloc
{
  [(UIPickerView *)self->_picker setDataSource:0];
  [(UIPickerView *)self->_picker setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)HKMedicalIDEditorWeightCell;
  [(HKMedicalIDEditorCell *)&v3 dealloc];
}

- (void)_hidePicker
{
  id v2 = [(HKMedicalIDEditorCell *)self inputTextField];
  [v2 resignFirstResponder];
}

- (void)beginEditing
{
  v3.receiver = self;
  v3.super_class = (Class)HKMedicalIDEditorWeightCell;
  [(HKMedicalIDEditorCell *)&v3 beginEditing];
  [(HKMedicalIDEditorWeightCell *)self _showPicker];
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return self->_numberOfRowsForPicker;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  return +[HKMedicalIDWeightPickerDataProvider titleForRow:a4];
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  v6 = NSNumber;
  +[HKMedicalIDWeightPickerDataProvider getWeightInKilogramsForRow:a4];
  objc_msgSend(v6, "numberWithDouble:");
  objc_super v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  kilogramValue = self->_kilogramValue;
  self->_kilogramValue = v7;

  [(HKMedicalIDEditorCell *)self valueDidChange];
}

- (NSNumber)kilogramValue
{
  return self->_kilogramValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kilogramValue, 0);
  objc_storeStrong((id *)&self->_picker, 0);
}

@end