@interface HKSimpleDataEntryWeightItem
- (HKSimpleDataEntryWeightItem)initWithTitle:(id)a3 registrantModelKey:(id)a4 weightInKg:(id)a5 defaultWeightInKg:(id)a6;
- (double)_defaultKilogramValue;
- (id)_formattedValueForDisplay;
- (id)cell;
- (id)formattedKeyAndValue;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)_setTextForInputTextField:(id)a3;
- (void)_setWeightValueForSelectedRow:(int64_t)a3;
- (void)_setupPlaceholder;
- (void)_updateLocaleDependentValues;
- (void)_valueDidChange;
- (void)beginEditing;
- (void)localeDidChange:(id)a3;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)updateCellDisplay;
@end

@implementation HKSimpleDataEntryWeightItem

- (HKSimpleDataEntryWeightItem)initWithTitle:(id)a3 registrantModelKey:(id)a4 weightInKg:(id)a5 defaultWeightInKg:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HKSimpleDataEntryWeightItem;
  v15 = [(HKSimpleDataEntryWeightItem *)&v22 init];
  v16 = v15;
  if (v15)
  {
    [(HKSimpleDataEntryWeightItem *)v15 _updateLocaleDependentValues];
    objc_storeStrong((id *)&v16->_title, a3);
    objc_storeStrong((id *)&v16->_registrantModelKey, a4);
    v17 = v14;
    if (!v14)
    {
      v18 = NSNumber;
      [(HKSimpleDataEntryWeightItem *)v16 _defaultKilogramValue];
      v17 = objc_msgSend(v18, "numberWithDouble:");
    }
    objc_storeStrong((id *)&v16->_defaultValue, v17);
    if (!v14) {

    }
    uint64_t v19 = ClampedWeightLoggingOutOfBoundsValues(v13);
    kilogramValue = v16->_kilogramValue;
    v16->_kilogramValue = (NSNumber *)v19;
  }
  return v16;
}

- (id)formattedKeyAndValue
{
  v6[1] = *MEMORY[0x1E4F143B8];
  kilogramValue = self->_kilogramValue;
  registrantModelKey = self->_registrantModelKey;
  v6[0] = kilogramValue;
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
    kilogramValue = self->_kilogramValue;
    if (!kilogramValue) {
      kilogramValue = self->_defaultValue;
    }
    [(NSNumber *)kilogramValue doubleValue];
    int64_t localWeightUnit = self->_localWeightUnit;
    if (localWeightUnit == 1538)
    {
      double v12 = v10 / 0.453592;
    }
    else if (localWeightUnit == 1539)
    {
      double v12 = v10 / 6.35029 * 10.0;
    }
    else
    {
      double v12 = v10 + v10;
    }
    [(UIPickerView *)self->_picker selectRow:llround(v12) inComponent:0 animated:0];
    id v13 = +[HKHostingAreaLayoutView viewHostingView:self->_picker];
    id v14 = [(HKSimpleDataEntryPlainTextCell *)self->_cell inputTextField];
    [v14 setInputView:v13];

    v15 = [(HKSimpleDataEntryPlainTextCell *)self->_cell inputTextField];
    v16 = [(HKSimpleDataEntryItem *)self accessoryToolbar];
    [v15 setInputAccessoryView:v16];

    [(HKSimpleDataEntryWeightItem *)self _setupPlaceholder];
    [(HKSimpleDataEntryWeightItem *)self updateCellDisplay];
    cell = self->_cell;
  }
  return cell;
}

- (void)updateCellDisplay
{
  id v3 = [(HKSimpleDataEntryWeightItem *)self _formattedValueForDisplay];
  [(HKSimpleDataEntryWeightItem *)self _setTextForInputTextField:v3];
}

- (id)_formattedValueForDisplay
{
  if (self->_kilogramValue)
  {
    id v3 = +[HKPersonWeightFormatter sharedFormatter];
    v4 = [v3 stringFromWeightInKilograms:self->_kilogramValue];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)beginEditing
{
  v3.receiver = self;
  v3.super_class = (Class)HKSimpleDataEntryWeightItem;
  [(HKSimpleDataEntryItem *)&v3 beginEditing];
  if (!self->_kilogramValue)
  {
    [(HKSimpleDataEntryWeightItem *)self _setWeightValueForSelectedRow:[(UIPickerView *)self->_picker selectedRowInComponent:0]];
    [(HKSimpleDataEntryWeightItem *)self _valueDidChange];
  }
}

- (void)_setupPlaceholder
{
  if (![(HKSimpleDataEntryItem *)self placeholderType])
  {
    objc_super v3 = [(HKSimpleDataEntryPlainTextCell *)self->_cell inputTextField];
    v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v5 = [v4 localizedStringForKey:@"OD_PLACEHOLDER_OPTIONAL" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [v3 setPlaceholder:v5];
  }
  [(HKSimpleDataEntryWeightItem *)self _setTextForInputTextField:0];
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
  [(HKSimpleDataEntryWeightItem *)self updateCellDisplay];
  id v3 = [(HKSimpleDataEntryItem *)self delegate];
  [v3 dataEntryItemDidUpdateValue:self];
}

- (double)_defaultKilogramValue
{
  return 60.0;
}

- (void)_updateLocaleDependentValues
{
  id v3 = +[HKPersonWeightFormatter sharedFormatter];
  self->_int64_t localWeightUnit = [v3 localWeightUnit];

  int64_t localWeightUnit = self->_localWeightUnit;
  uint64_t v5 = 1451;
  if (localWeightUnit == 14) {
    uint64_t v5 = 1316;
  }
  BOOL v6 = localWeightUnit == 1539;
  int64_t v7 = 1036;
  if (!v6) {
    int64_t v7 = v5;
  }
  self->_numberOfRowsForPicker = v7;
}

- (void)localeDidChange:(id)a3
{
  [(HKSimpleDataEntryWeightItem *)self _updateLocaleDependentValues];
  [(HKSimpleDataEntryWeightItem *)self updateCellDisplay];
}

- (void)_setWeightValueForSelectedRow:(int64_t)a3
{
  int64_t localWeightUnit = self->_localWeightUnit;
  if (localWeightUnit == 1538)
  {
    uint64_t v5 = NSNumber;
    double v6 = (double)a3;
    double v7 = 0.453592;
  }
  else
  {
    uint64_t v5 = NSNumber;
    if (localWeightUnit == 1539)
    {
      double v6 = (double)a3 / 10.0;
      double v7 = 6.35029;
    }
    else
    {
      double v6 = (double)a3;
      double v7 = 0.5;
    }
  }
  id v10 = [v5 numberWithDouble:v6 * v7];
  ClampedWeightLoggingOutOfBoundsValues(v10);
  v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  kilogramValue = self->_kilogramValue;
  self->_kilogramValue = v8;
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
  double v6 = (double)a4;
  int64_t localWeightUnit = self->_localWeightUnit;
  if (localWeightUnit == 14)
  {
    double v6 = v6 * 0.5;
  }
  else if (localWeightUnit == 1539)
  {
    double v6 = v6 / 10.0;
  }
  v8 = +[HKPersonWeightFormatter sharedFormatter];
  v9 = [v8 stringFromWeightValue:self->_localWeightUnit inUnit:v6];

  return v9;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  [(HKSimpleDataEntryWeightItem *)self _setWeightValueForSelectedRow:a4];
  [(HKSimpleDataEntryWeightItem *)self _valueDidChange];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kilogramValue, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_picker, 0);
  objc_storeStrong((id *)&self->_registrantModelKey, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end