@interface WDAddDataManualEntrySpinner
- (WDAddDataManualEntrySpinner)initWithDisplayName:(id)a3;
- (WDAddDataManualEntrySpinnerDataSource)dataSource;
- (id)generateValue;
- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6;
- (id)tableViewCells;
- (int64_t)_wd_deliveryReason;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)_updateTableViewCellValue;
- (void)setDataSource:(id)a3;
- (void)setTitle:(id)a3;
- (void)setValue:(id)a3;
- (void)set_wd_deliveryReason:(int64_t)a3;
@end

@implementation WDAddDataManualEntrySpinner

- (WDAddDataManualEntrySpinner)initWithDisplayName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDAddDataManualEntrySpinner;
  v5 = [(WDAddDataManualEntrySpinner *)&v9 init];
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
  v13[1] = *MEMORY[0x1E4F143B8];
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
    [v8 selectRow:self->_selectedPickerViewIndex inComponent:0 animated:0];

    objc_super v9 = self->_tableViewCell;
    v10 = HKUIJoinStringsForAutomationIdentifier();
    [(HXUIInlinePickerTableViewCell *)v9 setAccessibilityIdentifier:v10];

    [(WDAddDataManualEntrySpinner *)self _updateTableViewCellValue];
    tableViewCell = self->_tableViewCell;
  }
  v13[0] = tableViewCell;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  return v11;
}

- (id)generateValue
{
  v2 = [(HXUIInlinePickerTableViewCell *)self->_tableViewCell pickerView];
  uint64_t v3 = [v2 selectedRowInComponent:0];

  id v4 = (void *)MEMORY[0x1E4F28ED0];
  return (id)[v4 numberWithInteger:v3];
}

- (void)setValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self->_selectedPickerViewIndex = [v5 integerValue];
    id v4 = [(HXUIInlinePickerTableViewCell *)self->_tableViewCell pickerView];
    [v4 selectRow:self->_selectedPickerViewIndex inComponent:0 animated:0];

    [(WDAddDataManualEntrySpinner *)self _updateTableViewCellValue];
  }
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  int64_t v6 = [WeakRetained numberOfRowsInManualEntrySpinner:self];

  return v6;
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  id v8 = a6;
  id v9 = v8;
  if (!v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v10 = [MEMORY[0x1E4FB08E0] systemFontOfSize:23.5];
    [v9 setFont:v10];

    [v9 setTextAlignment:1];
    [v9 setAdjustsFontSizeToFitWidth:1];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v12 = [WeakRetained manualEntrySpinner:self titleForRow:a4];
  [v9 setText:v12];

  return v9;
}

- (void)_updateTableViewCellValue
{
  tableViewCell = self->_tableViewCell;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v5 = [(HXUIInlinePickerTableViewCell *)self->_tableViewCell pickerView];
  int64_t v6 = objc_msgSend(WeakRetained, "manualEntrySpinner:titleForRow:", self, objc_msgSend(v5, "selectedRowInComponent:", 0));
  [(HXUIInlinePickerTableViewCell *)tableViewCell setValue:v6];

  [(WDAddDataManualEntryItem *)self _didUpdateValue];
}

- (void)setTitle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WDAddDataManualEntrySpinner;
  id v4 = a3;
  [(WDAddDataManualEntryItem *)&v5 setTitle:v4];
  -[HXUIInlinePickerTableViewCell setDisplayName:](self->_tableViewCell, "setDisplayName:", v4, v5.receiver, v5.super_class);
}

- (WDAddDataManualEntrySpinnerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (WDAddDataManualEntrySpinnerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_tableViewCell, 0);
}

- (int64_t)_wd_deliveryReason
{
  v2 = [(WDAddDataManualEntrySpinner *)self generateValue];
  uint64_t v3 = [v2 integerValue];

  if (v3 >= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v3;
  }
  return v4 + 1;
}

- (void)set_wd_deliveryReason:(int64_t)a3
{
  int64_t v4 = 2;
  if (a3 > 2) {
    int64_t v4 = a3;
  }
  id v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:v4 - 1];
  [(WDAddDataManualEntrySpinner *)self setValue:v5];
}

@end