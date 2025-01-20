@interface HKSimpleDataEntryMultipleChoiceItem
- (HKSimpleDataEntryMultipleChoiceItem)initWithTitle:(id)a3 registrantModelKey:(id)a4 choices:(id)a5 choiceDisplayNames:(id)a6 defaultChoice:(id)a7;
- (id)cell;
- (id)formattedKeyAndValue;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)_setTextForInputTextField:(id)a3;
- (void)_setupPlaceholder;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)updateCellDisplay;
@end

@implementation HKSimpleDataEntryMultipleChoiceItem

- (HKSimpleDataEntryMultipleChoiceItem)initWithTitle:(id)a3 registrantModelKey:(id)a4 choices:(id)a5 choiceDisplayNames:(id)a6 defaultChoice:(id)a7
{
  id v23 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)HKSimpleDataEntryMultipleChoiceItem;
  v17 = [(HKSimpleDataEntryMultipleChoiceItem *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_title, a3);
    objc_storeStrong((id *)&v18->_registrantModelKey, a4);
    uint64_t v19 = [v14 indexOfObject:v16];
    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v20 = [NSNumber numberWithInteger:v19];
      chosenIndex = v18->_chosenIndex;
      v18->_chosenIndex = (NSNumber *)v20;
    }
    objc_storeStrong((id *)&v18->_choices, a5);
    objc_storeStrong((id *)&v18->_choiceDisplayValues, a6);
  }

  return v18;
}

- (id)formattedKeyAndValue
{
  v6[1] = *MEMORY[0x1E4F143B8];
  registrantModelKey = self->_registrantModelKey;
  v2 = [(NSArray *)self->_choices objectAtIndexedSubscript:[(NSNumber *)self->_chosenIndex integerValue]];
  v6[0] = v2;
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
    [(UIPickerView *)self->_picker selectRow:[(NSNumber *)self->_chosenIndex integerValue] inComponent:0 animated:0];
    v9 = +[HKHostingAreaLayoutView viewHostingView:self->_picker];
    v10 = [(HKSimpleDataEntryPlainTextCell *)self->_cell inputTextField];
    [v10 setInputView:v9];

    v11 = [(HKSimpleDataEntryPlainTextCell *)self->_cell inputTextField];
    v12 = [(HKSimpleDataEntryItem *)self accessoryToolbar];
    [v11 setInputAccessoryView:v12];

    [(HKSimpleDataEntryMultipleChoiceItem *)self _setupPlaceholder];
    [(HKSimpleDataEntryMultipleChoiceItem *)self updateCellDisplay];
    cell = self->_cell;
  }
  return cell;
}

- (void)updateCellDisplay
{
  chosenIndex = self->_chosenIndex;
  if (chosenIndex)
  {
    unint64_t v4 = [(NSNumber *)chosenIndex integerValue];
    if (v4 < [(NSArray *)self->_choiceDisplayValues count])
    {
      id v5 = [(NSArray *)self->_choiceDisplayValues objectAtIndexedSubscript:[(NSNumber *)self->_chosenIndex integerValue]];
      [(HKSimpleDataEntryMultipleChoiceItem *)self _setTextForInputTextField:v5];
    }
  }
}

- (void)_setupPlaceholder
{
  if (![(HKSimpleDataEntryItem *)self placeholderType])
  {
    v3 = [(HKSimpleDataEntryPlainTextCell *)self->_cell inputTextField];
    unint64_t v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v5 = [v4 localizedStringForKey:@"OD_PLACEHOLDER_OPTIONAL" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [v3 setPlaceholder:v5];
  }
  [(HKSimpleDataEntryMultipleChoiceItem *)self _setTextForInputTextField:0];
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

    id v5 = [(HKSimpleDataEntryPlainTextCell *)self->_cell inputTextField];
    uint64_t v6 = HKHealthKeyColor();
  }
  else
  {
    unint64_t v4 = [(HKSimpleDataEntryPlainTextCell *)self->_cell inputTextField];
    [v4 setText:v11];

    id v5 = [(HKSimpleDataEntryPlainTextCell *)self->_cell inputTextField];
    uint64_t v6 = [MEMORY[0x1E4FB1618] labelColor];
  }
  v10 = (void *)v6;
  [v5 setTextColor:v6];
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return [(NSArray *)self->_choices count];
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  return [(NSArray *)self->_choiceDisplayValues objectAtIndex:a4];
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  uint64_t v6 = [NSNumber numberWithInteger:a4];
  chosenIndex = self->_chosenIndex;
  self->_chosenIndex = v6;

  [(HKSimpleDataEntryMultipleChoiceItem *)self updateCellDisplay];
  id v8 = [(HKSimpleDataEntryItem *)self delegate];
  [v8 dataEntryItemDidUpdateValue:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_picker, 0);
  objc_storeStrong((id *)&self->_choices, 0);
  objc_storeStrong((id *)&self->_choiceDisplayValues, 0);
  objc_storeStrong((id *)&self->_chosenIndex, 0);
  objc_storeStrong((id *)&self->_registrantModelKey, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end