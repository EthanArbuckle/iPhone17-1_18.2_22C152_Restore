@interface HKMedicalIDEditorHeightCell
- (HKMedicalIDEditorHeightCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSNumber)centimeterValue;
- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4;
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
- (void)setCentimeterValue:(id)a3;
@end

@implementation HKMedicalIDEditorHeightCell

- (HKMedicalIDEditorHeightCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKMedicalIDEditorHeightCell;
  v4 = [(HKMedicalIDEditorCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(HKMedicalIDEditorHeightCell *)v4 _commonInit];
  }
  return v5;
}

- (void)_commonInit
{
  id v3 = +[HKPersonHeightFormatter sharedFormatter];
  self->_usesImperialUnits = [v3 usesImperialUnits];
}

- (void)_localeDidChange:(id)a3
{
  [(HKMedicalIDEditorHeightCell *)self _commonInit];
  [(HKMedicalIDEditorCell *)self updateValueLabel];
}

- (id)formattedValue
{
  id v3 = +[HKPersonHeightFormatter sharedFormatter];
  v4 = [(HKMedicalIDEditorHeightCell *)self centimeterValue];
  v5 = [v3 localizedStringFromHeightInCentimeters:v4];

  return v5;
}

- (void)setCentimeterValue:(id)a3
{
  objc_storeStrong((id *)&self->_centimeterValue, a3);
  [(HKMedicalIDEditorCell *)self updateValueLabel];
}

- (void)_showPicker
{
  id v3 = [(HKMedicalIDEditorHeightCell *)self centimeterValue];

  if (!v3)
  {
    v4 = NSNumber;
    +[HKMedicalIDHeightPickerDataProvider defaultCentimeterValue];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [(HKMedicalIDEditorHeightCell *)self setCentimeterValue:v5];
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
  v11 = [(HKMedicalIDEditorHeightCell *)self centimeterValue];
  [v11 doubleValue];
  double v13 = v12;

  if (self->_usesImperialUnits)
  {
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    v14 = +[HKPersonHeightFormatter sharedFormatter];
    [v14 getFeet:&v20 inches:&v19 fromCentimeters:v13];

    [(UIPickerView *)self->_picker selectRow:v20 inComponent:0 animated:0];
    v15 = self->_picker;
    uint64_t v16 = v19;
    uint64_t v17 = 1;
  }
  else
  {
    v15 = self->_picker;
    uint64_t v16 = (uint64_t)v13;
    uint64_t v17 = 0;
  }
  [(UIPickerView *)v15 selectRow:v16 inComponent:v17 animated:0];
  [(HKMedicalIDEditorHeightCell *)self reloadInputViews];
  v18 = [(HKMedicalIDEditorCell *)self inputTextField];
  [v18 becomeFirstResponder];
}

- (void)dealloc
{
  [(UIPickerView *)self->_picker setDataSource:0];
  [(UIPickerView *)self->_picker setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)HKMedicalIDEditorHeightCell;
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
  v3.super_class = (Class)HKMedicalIDEditorHeightCell;
  [(HKMedicalIDEditorCell *)&v3 beginEditing];
  [(HKMedicalIDEditorHeightCell *)self _showPicker];
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return self->_usesImperialUnits + 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return +[HKMedicalIDHeightPickerDataProvider numberOfRowsInComponent:a4];
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  if (self->_usesImperialUnits)
  {
    +[HKPickerViewTitleMeasurer pickerView:a3 maxWidthForComponent:a4];
  }
  else
  {
    [a3 frame];
    return v5;
  }
  return result;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  return +[HKMedicalIDHeightPickerDataProvider titleForRow:a4 inComponent:a5];
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v7 = a3;
  id v15 = v7;
  if (self->_usesImperialUnits)
  {
    double v8 = fmax((double)[v7 selectedRowInComponent:0], 0.0);
    double v9 = fmax((double)[v15 selectedRowInComponent:1], 0.0);
    v10 = NSNumber;
    v11 = +[HKPersonHeightFormatter sharedFormatter];
    [v11 centimetersFromFeet:v8 inches:v9];
    objc_msgSend(v10, "numberWithDouble:");
    double v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    centimeterValue = self->_centimeterValue;
    self->_centimeterValue = v12;
  }
  else
  {
    v14 = [NSNumber numberWithInteger:a4];
    v11 = self->_centimeterValue;
    self->_centimeterValue = v14;
  }

  [(HKMedicalIDEditorCell *)self valueDidChange];
}

- (NSNumber)centimeterValue
{
  return self->_centimeterValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centimeterValue, 0);
  objc_storeStrong((id *)&self->_picker, 0);
}

@end