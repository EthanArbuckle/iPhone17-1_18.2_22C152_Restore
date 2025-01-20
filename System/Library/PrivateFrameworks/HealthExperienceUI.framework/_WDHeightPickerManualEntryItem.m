@interface _WDHeightPickerManualEntryItem
- (NSString)feetUnitString;
- (NSString)inchUnitString;
- (_WDHeightPickerManualEntryItem)initWithDisplayName:(id)a3;
- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4;
- (id)generateValue;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)tableViewCells;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)_updateTableViewCell;
- (void)setFeetUnitString:(id)a3;
- (void)setInchUnitString:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _WDHeightPickerManualEntryItem

- (_WDHeightPickerManualEntryItem)initWithDisplayName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_WDHeightPickerManualEntryItem;
  v5 = [(_WDHeightPickerManualEntryItem *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;
  }
  return v5;
}

- (id)tableViewCells
{
  v15[1] = *MEMORY[0x1E4F143B8];
  tableViewCell = self->_tableViewCell;
  if (!tableViewCell)
  {
    id v4 = [(WDAddDataManualEntryItem *)self _createHXUIInlinePickerTableViewCellWithTitle:self->_displayName];
    v5 = self->_tableViewCell;
    self->_tableViewCell = v4;

    uint64_t v6 = [(HXUIInlinePickerTableViewCell *)self->_tableViewCell pickerView];
    [v6 setDataSource:self];

    v7 = [(HXUIInlinePickerTableViewCell *)self->_tableViewCell pickerView];
    [v7 setDelegate:self];

    v8 = [(HXUIInlinePickerTableViewCell *)self->_tableViewCell pickerView];
    [v8 selectRow:5 inComponent:0 animated:0];

    objc_super v9 = [(HXUIInlinePickerTableViewCell *)self->_tableViewCell pickerView];
    [v9 selectRow:4 inComponent:1 animated:0];

    v10 = [(HXUIInlinePickerTableViewCell *)self->_tableViewCell pickerView];
    [v10 selectRow:5 inComponent:0 animated:0];

    v11 = self->_tableViewCell;
    v12 = HKUIJoinStringsForAutomationIdentifier();
    [(HXUIInlinePickerTableViewCell *)v11 setAccessibilityIdentifier:v12];

    [(_WDHeightPickerManualEntryItem *)self _updateTableViewCell];
    tableViewCell = self->_tableViewCell;
  }
  v15[0] = tableViewCell;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  return v13;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 2;
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  [MEMORY[0x1E4F67BD8] pickerView:a3 maxWidthForComponent:a4];
  return result;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  int64_t v4 = 12;
  if (a4 != 1) {
    int64_t v4 = 0;
  }
  if (a4) {
    return v4;
  }
  else {
    return 10;
  }
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  v7 = HKLocalizedNoDataString();
  if ((unint64_t)a5 <= 1)
  {
    v8 = HKIntegerFormatter();
    objc_super v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    v10 = [v8 stringFromNumber:v9];

    uint64_t v11 = HKFormatValueAndUnit();

    v7 = (void *)v11;
  }
  return v7;
}

- (void)_updateTableViewCell
{
  v3 = [(HXUIInlinePickerTableViewCell *)self->_tableViewCell pickerView];
  uint64_t v4 = [v3 selectedRowInComponent:0];

  v5 = [(HXUIInlinePickerTableViewCell *)self->_tableViewCell pickerView];
  uint64_t v6 = [v5 selectedRowInComponent:1];

  v7 = HKIntegerFormatter();
  v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:v4];
  id v16 = [v7 stringFromNumber:v8];

  objc_super v9 = HKIntegerFormatter();
  v10 = [MEMORY[0x1E4F28ED0] numberWithInteger:v6];
  uint64_t v11 = [v9 stringFromNumber:v10];

  v12 = NSString;
  v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v14 = [v13 localizedStringForKey:@"FEET_INCH_FORMAT %@ %@" value:&stru_1F04402E8 table:@"HealthUI-Localizable"];
  v15 = objc_msgSend(v12, "stringWithFormat:", v14, v16, v11);

  [(HXUIInlinePickerTableViewCell *)self->_tableViewCell setValue:v15];
  [(WDAddDataManualEntryItem *)self _didUpdateValue];
}

- (id)generateValue
{
  v3 = [(HXUIInlinePickerTableViewCell *)self->_tableViewCell pickerView];
  uint64_t v4 = [v3 selectedRowInComponent:0];

  v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:v4];
  if ([v5 integerValue] >= 1)
  {
    uint64_t v6 = [(HXUIInlinePickerTableViewCell *)self->_tableViewCell pickerView];
    uint64_t v7 = [v6 selectedRowInComponent:0];

    v8 = [(HXUIInlinePickerTableViewCell *)self->_tableViewCell pickerView];
    uint64_t v9 = [v8 selectedRowInComponent:1];

    uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithDouble:(double)v9 / 12.0 + (double)v7];

    v5 = (void *)v10;
  }
  return v5;
}

- (void)setTitle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_WDHeightPickerManualEntryItem;
  id v4 = a3;
  [(WDAddDataManualEntryItem *)&v5 setTitle:v4];
  -[HXUIInlinePickerTableViewCell setDisplayName:](self->_tableViewCell, "setDisplayName:", v4, v5.receiver, v5.super_class);
}

- (NSString)feetUnitString
{
  return self->_feetUnitString;
}

- (void)setFeetUnitString:(id)a3
{
}

- (NSString)inchUnitString
{
  return self->_inchUnitString;
}

- (void)setInchUnitString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inchUnitString, 0);
  objc_storeStrong((id *)&self->_feetUnitString, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_tableViewCell, 0);
}

@end