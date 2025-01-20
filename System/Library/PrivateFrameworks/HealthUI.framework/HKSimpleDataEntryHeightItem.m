@interface HKSimpleDataEntryHeightItem
- (HKSimpleDataEntryHeightItem)initWithTitle:(id)a3 registrantModelKey:(id)a4 heightInCm:(id)a5 defaultHeightInCm:(id)a6;
- (double)_defaultCentimeterValue;
- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4;
- (id)_formattedValueForDisplay;
- (id)cell;
- (id)formattedKeyAndValue;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)_setHeightValueForPicker:(id)a3 selectedRow:(int64_t)a4;
- (void)_setTextForInputTextField:(id)a3;
- (void)_setupPlaceholder;
- (void)_updateLocaleDependentValues;
- (void)_valueDidChange;
- (void)beginEditing;
- (void)doneButtonTapped:(id)a3;
- (void)localeDidChange:(id)a3;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)updateCellDisplay;
@end

@implementation HKSimpleDataEntryHeightItem

- (HKSimpleDataEntryHeightItem)initWithTitle:(id)a3 registrantModelKey:(id)a4 heightInCm:(id)a5 defaultHeightInCm:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HKSimpleDataEntryHeightItem;
  v15 = [(HKSimpleDataEntryHeightItem *)&v20 init];
  v16 = v15;
  if (v15)
  {
    [(HKSimpleDataEntryHeightItem *)v15 _updateLocaleDependentValues];
    objc_storeStrong((id *)&v16->_title, a3);
    objc_storeStrong((id *)&v16->_registrantModelKey, a4);
    v17 = v14;
    if (!v14)
    {
      v18 = NSNumber;
      [(HKSimpleDataEntryHeightItem *)v16 _defaultCentimeterValue];
      v17 = objc_msgSend(v18, "numberWithDouble:");
    }
    objc_storeStrong((id *)&v16->_defaultValue, v17);
    if (!v14) {

    }
    objc_storeStrong((id *)&v16->_centimeterValue, a5);
  }

  return v16;
}

- (double)_defaultCentimeterValue
{
  double result = 167.64;
  if (!self->_usesImperialUnits) {
    return 168.0;
  }
  return result;
}

- (id)formattedKeyAndValue
{
  v6[1] = *MEMORY[0x1E4F143B8];
  centimeterValue = self->_centimeterValue;
  registrantModelKey = self->_registrantModelKey;
  v6[0] = centimeterValue;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&registrantModelKey count:1];
  return v3;
}

- (id)cell
{
  cell = self->_cell;
  if (!cell)
  {
    v4 = [[HKSimpleDataEntryPlainTextCell alloc] initWithIntention:9 reuseIdentifier:0];
    v5 = self->_cell;
    self->_cell = v4;

    v6 = [(HKSimpleDataEntryPlainTextCell *)self->_cell titleLabel];
    [v6 setText:self->_title];

    v7 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E4FB1A98]);
    picker = self->_picker;
    self->_picker = v7;

    [(UIPickerView *)self->_picker setDelegate:self];
    [(UIPickerView *)self->_picker setDataSource:self];
    [(UIPickerView *)self->_picker reloadAllComponents];
    centimeterValue = self->_centimeterValue;
    if (!centimeterValue) {
      centimeterValue = self->_defaultValue;
    }
    [(NSNumber *)centimeterValue doubleValue];
    double v11 = v10;
    if (self->_usesImperialUnits)
    {
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      id v12 = +[HKPersonHeightFormatter sharedFormatter];
      [v12 getFeet:&v22 inches:&v21 fromCentimeters:v11];

      [(UIPickerView *)self->_picker selectRow:v22 inComponent:0 animated:0];
      id v13 = self->_picker;
      uint64_t v14 = v21;
      uint64_t v15 = 1;
    }
    else
    {
      id v13 = self->_picker;
      uint64_t v14 = (uint64_t)v10;
      uint64_t v15 = 0;
    }
    [(UIPickerView *)v13 selectRow:v14 inComponent:v15 animated:0];
    v16 = +[HKHostingAreaLayoutView viewHostingView:self->_picker];
    v17 = [(HKSimpleDataEntryPlainTextCell *)self->_cell inputTextField];
    [v17 setInputView:v16];

    v18 = [(HKSimpleDataEntryPlainTextCell *)self->_cell inputTextField];
    v19 = [(HKSimpleDataEntryItem *)self accessoryToolbar];
    [v18 setInputAccessoryView:v19];

    [(HKSimpleDataEntryHeightItem *)self _setupPlaceholder];
    [(HKSimpleDataEntryHeightItem *)self updateCellDisplay];
    cell = self->_cell;
  }
  return cell;
}

- (void)beginEditing
{
  v3.receiver = self;
  v3.super_class = (Class)HKSimpleDataEntryHeightItem;
  [(HKSimpleDataEntryItem *)&v3 beginEditing];
  if (!self->_centimeterValue)
  {
    [(HKSimpleDataEntryHeightItem *)self _setHeightValueForPicker:self->_picker selectedRow:[(UIPickerView *)self->_picker selectedRowInComponent:0]];
    [(HKSimpleDataEntryHeightItem *)self _valueDidChange];
  }
}

- (void)updateCellDisplay
{
  id v3 = [(HKSimpleDataEntryHeightItem *)self _formattedValueForDisplay];
  [(HKSimpleDataEntryHeightItem *)self _setTextForInputTextField:v3];
}

- (id)_formattedValueForDisplay
{
  if (self->_centimeterValue)
  {
    id v3 = +[HKPersonHeightFormatter sharedFormatter];
    v4 = [v3 localizedStringFromHeightInCentimeters:self->_centimeterValue];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_setupPlaceholder
{
  if (![(HKSimpleDataEntryItem *)self placeholderType])
  {
    id v3 = [(HKSimpleDataEntryPlainTextCell *)self->_cell inputTextField];
    v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v5 = [v4 localizedStringForKey:@"OD_PLACEHOLDER_OPTIONAL" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [v3 setPlaceholder:v5];
  }
  [(HKSimpleDataEntryHeightItem *)self _setTextForInputTextField:0];
}

- (void)_setTextForInputTextField:(id)a3
{
  id v11 = a3;
  if (-[HKSimpleDataEntryItem placeholderType](self, "placeholderType") == 1 && ![v11 length])
  {
    v7 = [(HKSimpleDataEntryPlainTextCell *)self->_cell inputTextField];
    v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v9 = [v8 localizedStringForKey:@"OD_PICKER_CHOOSE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [v7 setText:v9];

    v5 = [(HKSimpleDataEntryPlainTextCell *)self->_cell inputTextField];
    uint64_t v6 = HKHealthKeyColor();
  }
  else
  {
    v4 = [(HKSimpleDataEntryPlainTextCell *)self->_cell inputTextField];
    [v4 setText:v11];

    v5 = [(HKSimpleDataEntryPlainTextCell *)self->_cell inputTextField];
    uint64_t v6 = [MEMORY[0x1E4FB1618] labelColor];
  }
  double v10 = (void *)v6;
  [v5 setTextColor:v6];
}

- (void)_valueDidChange
{
  [(HKSimpleDataEntryHeightItem *)self updateCellDisplay];
  id v3 = [(HKSimpleDataEntryItem *)self delegate];
  [v3 dataEntryItemDidUpdateValue:self];
}

- (void)_updateLocaleDependentValues
{
  id v3 = +[HKPersonHeightFormatter sharedFormatter];
  self->_usesImperialUnits = [v3 usesImperialUnits];
}

- (void)localeDidChange:(id)a3
{
  [(HKSimpleDataEntryHeightItem *)self _updateLocaleDependentValues];
  [(HKSimpleDataEntryHeightItem *)self updateCellDisplay];
}

- (void)doneButtonTapped:(id)a3
{
  id v3 = [(HKSimpleDataEntryPlainTextCell *)self->_cell inputTextField];
  [v3 resignFirstResponder];
}

- (void)_setHeightValueForPicker:(id)a3 selectedRow:(int64_t)a4
{
  id v6 = a3;
  id v14 = v6;
  if (self->_usesImperialUnits)
  {
    double v7 = fmax((double)[v6 selectedRowInComponent:0], 0.0);
    double v8 = fmax((double)[v14 selectedRowInComponent:1], 0.0);
    v9 = NSNumber;
    double v10 = +[HKPersonHeightFormatter sharedFormatter];
    [v10 centimetersFromFeet:v7 inches:v8];
    objc_msgSend(v9, "numberWithDouble:");
    id v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    centimeterValue = self->_centimeterValue;
    self->_centimeterValue = v11;
  }
  else
  {
    id v13 = [NSNumber numberWithInteger:a4];
    double v10 = self->_centimeterValue;
    self->_centimeterValue = v13;
  }
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return self->_usesImperialUnits + 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  int64_t v4 = 12;
  if (!a4) {
    int64_t v4 = 10;
  }
  if (self->_usesImperialUnits) {
    return v4;
  }
  else {
    return 300;
  }
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
  id v8 = a3;
  if (self->_usesImperialUnits)
  {
    v9 = +[HKPersonHeightFormatter sharedFormatter];
    double v10 = v9;
    double v11 = (double)a4;
    if (a5) {
      [v9 formattedValueForInches:v11];
    }
    else {
    uint64_t v12 = [v9 formattedValueForFeet:v11];
    }
  }
  else
  {
    double v10 = +[HKPersonHeightFormatter sharedFormatter];
    uint64_t v12 = [v10 formattedValueForCentimeters:(double)a4];
  }
  id v13 = (void *)v12;

  return v13;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  -[HKSimpleDataEntryHeightItem _setHeightValueForPicker:selectedRow:](self, "_setHeightValueForPicker:selectedRow:", a3, a4, a5);
  [(HKSimpleDataEntryHeightItem *)self _valueDidChange];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centimeterValue, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_picker, 0);
  objc_storeStrong((id *)&self->_registrantModelKey, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end