@interface _WDDateBasedAddDataManualEntryItem
- (NSDateFormatter)dateFormatter;
- (_WDDateBasedAddDataManualEntryItem)initWithMaximumDate:(id)a3 highlightWhenEditing:(BOOL)a4 datePickerMode:(int64_t)a5 displayName:(id)a6;
- (id)generateValue;
- (id)tableViewCells;
- (int64_t)datePickerMode;
- (void)_datePickerDidChange:(id)a3;
- (void)_generateValue:(id)a3;
- (void)_saveDisambiguatedDate:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setDatePickerMode:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation _WDDateBasedAddDataManualEntryItem

- (_WDDateBasedAddDataManualEntryItem)initWithMaximumDate:(id)a3 highlightWhenEditing:(BOOL)a4 datePickerMode:(int64_t)a5 displayName:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_WDDateBasedAddDataManualEntryItem;
  v13 = [(_WDDateBasedAddDataManualEntryItem *)&v17 init];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    displayName = v13->_displayName;
    v13->_displayName = (NSString *)v14;

    objc_storeStrong((id *)&v13->_maximumDate, a3);
    v13->_highlightWhenEditing = a4;
    v13->_datePickerMode = a5;
  }

  return v13;
}

- (id)tableViewCells
{
  v12[1] = *MEMORY[0x1E4F143B8];
  tableViewCell = self->_tableViewCell;
  if (!tableViewCell)
  {
    v4 = [(WDAddDataManualEntryItem *)self _createHXUIInlineDatePickerTableViewCellWithTitle:self->_displayName datePickerMode:self->_datePickerMode maxDate:self->_maximumDate];
    v5 = self->_tableViewCell;
    self->_tableViewCell = v4;

    v6 = [(HXUIInlineDatePickerTableViewCell *)self->_tableViewCell datePicker];
    [v6 addTarget:self action:sel__datePickerDidChange_ forControlEvents:4096];

    v7 = self->_tableViewCell;
    v8 = HKUIJoinStringsForAutomationIdentifier();
    [(HXUIInlineDatePickerTableViewCell *)v7 setAccessibilityIdentifier:v8];

    v9 = [(HXUIInlineDatePickerTableViewCell *)self->_tableViewCell datePicker];
    [(_WDDateBasedAddDataManualEntryItem *)self _datePickerDidChange:v9];

    tableViewCell = self->_tableViewCell;
  }
  v12[0] = tableViewCell;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  return v10;
}

- (void)_datePickerDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59___WDDateBasedAddDataManualEntryItem__datePickerDidChange___block_invoke;
  v5[3] = &unk_1E5E7CC70;
  objc_copyWeak(&v6, &location);
  [(_WDDateBasedAddDataManualEntryItem *)self _generateValue:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_saveDisambiguatedDate:(id)a3
{
  id v4 = a3;
  if (self->_maximumDate)
  {
    id v8 = v4;
    uint64_t v5 = HKUIObjectMin();

    id v4 = (id)v5;
  }
  id v9 = v4;
  objc_msgSend(v4, "hk_dateWithTruncatedSecond");
  id v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  chosenDate = self->_chosenDate;
  self->_chosenDate = v6;

  [(HXUIInlineDatePickerTableViewCell *)self->_tableViewCell updateLabelWithDate:self->_chosenDate];
  [(WDAddDataManualEntryItem *)self _didUpdateValue];
}

- (id)generateValue
{
  return self->_chosenDate;
}

- (void)_generateValue:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  id v9 = [v4 currentCalendar];
  id v6 = [(HXUIInlineDatePickerTableViewCell *)self->_tableViewCell datePicker];
  v7 = [v6 date];
  id v8 = [v9 components:126 fromDate:v7];

  [(WDAddDataManualEntryItem *)self _disambiguateDateComponents:v8 withCompletion:v5];
}

- (void)setValue:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(HXUIInlineDatePickerTableViewCell *)self->_tableViewCell datePicker];
    [v4 setDate:v6];

    id v5 = [(HXUIInlineDatePickerTableViewCell *)self->_tableViewCell datePicker];
    [(_WDDateBasedAddDataManualEntryItem *)self _datePickerDidChange:v5];
  }
}

- (void)setDatePickerMode:(int64_t)a3
{
  id v4 = [(HXUIInlineDatePickerTableViewCell *)self->_tableViewCell datePicker];
  [v4 setDatePickerMode:a3];
}

- (void)setTitle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_WDDateBasedAddDataManualEntryItem;
  id v4 = a3;
  [(WDAddDataManualEntryItem *)&v5 setTitle:v4];
  -[HXUIInlineDatePickerTableViewCell setDisplayName:](self->_tableViewCell, "setDisplayName:", v4, v5.receiver, v5.super_class);
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
}

- (int64_t)datePickerMode
{
  return self->_datePickerMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_chosenDate, 0);
  objc_storeStrong((id *)&self->_maximumDate, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_tableViewCell, 0);
}

@end