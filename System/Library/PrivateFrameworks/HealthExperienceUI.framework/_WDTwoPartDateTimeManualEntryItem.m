@interface _WDTwoPartDateTimeManualEntryItem
- (_WDTwoPartDateTimeManualEntryItem)initWithMaximumDate:(id)a3;
- (id)generateValue;
- (id)tableViewCells;
- (void)_datePickerDidChange:(id)a3;
- (void)_generateValue:(id)a3;
- (void)_saveDisambiguatedDate:(id)a3;
- (void)_setupTableViewCells;
- (void)_timePickerDidChange:(id)a3;
- (void)_updateCellLabels;
- (void)setValue:(id)a3;
@end

@implementation _WDTwoPartDateTimeManualEntryItem

- (_WDTwoPartDateTimeManualEntryItem)initWithMaximumDate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_WDTwoPartDateTimeManualEntryItem;
  v6 = [(_WDTwoPartDateTimeManualEntryItem *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_maximumDate, a3);
    [(_WDTwoPartDateTimeManualEntryItem *)v7 _setupTableViewCells];
  }

  return v7;
}

- (id)tableViewCells
{
  v5[2] = *MEMORY[0x1E4F143B8];
  timeTableViewCell = self->_timeTableViewCell;
  v5[0] = self->_dateTableViewCell;
  v5[1] = timeTableViewCell;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  return v3;
}

- (void)_setupTableViewCells
{
  v3 = HABundle();
  v4 = [v3 localizedStringForKey:@"DATE" value:&stru_1F04402E8 table:@"AddDataLocalization"];
  id v5 = [(WDAddDataManualEntryItem *)self _createHXUIInlineDatePickerTableViewCellWithTitle:v4 datePickerMode:1 maxDate:self->_maximumDate];
  dateTableViewCell = self->_dateTableViewCell;
  self->_dateTableViewCell = v5;

  v7 = HABundle();
  v8 = [v7 localizedStringForKey:@"TIME" value:&stru_1F04402E8 table:@"AddDataLocalization"];
  objc_super v9 = [(WDAddDataManualEntryItem *)self _createHXUIInlineDatePickerTableViewCellWithTitle:v8 datePickerMode:0 maxDate:self->_maximumDate];
  timeTableViewCell = self->_timeTableViewCell;
  self->_timeTableViewCell = v9;

  v11 = [(HXUIInlineDatePickerTableViewCell *)self->_dateTableViewCell datePicker];
  [v11 addTarget:self action:sel__datePickerDidChange_ forControlEvents:4096];

  v12 = [(HXUIInlineDatePickerTableViewCell *)self->_timeTableViewCell datePicker];
  [v12 addTarget:self action:sel__timePickerDidChange_ forControlEvents:4096];

  v13 = self->_dateTableViewCell;
  v14 = HKUIJoinStringsForAutomationIdentifier();
  [(HXUIInlineDatePickerTableViewCell *)v13 setAccessibilityIdentifier:v14];

  v15 = self->_timeTableViewCell;
  v16 = HKUIJoinStringsForAutomationIdentifier();
  [(HXUIInlineDatePickerTableViewCell *)v15 setAccessibilityIdentifier:v16];

  v17 = [(HXUIInlineDatePickerTableViewCell *)self->_timeTableViewCell datePicker];
  [(_WDTwoPartDateTimeManualEntryItem *)self _timePickerDidChange:v17];

  id v18 = [(HXUIInlineDatePickerTableViewCell *)self->_dateTableViewCell datePicker];
  [(_WDTwoPartDateTimeManualEntryItem *)self _datePickerDidChange:v18];
}

- (void)_datePickerDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58___WDTwoPartDateTimeManualEntryItem__datePickerDidChange___block_invoke;
  void v5[3] = &unk_1E5E7CC70;
  objc_copyWeak(&v6, &location);
  [(_WDTwoPartDateTimeManualEntryItem *)self _generateValue:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_saveDisambiguatedDate:(id)a3
{
  id v4 = (NSDate *)a3;
  if (self->_maximumDate)
  {
    uint64_t v5 = HKUIObjectMin();

    id v4 = (NSDate *)v5;
  }
  chosenDate = self->_chosenDate;
  self->_chosenDate = v4;
  v7 = v4;

  v8 = self->_chosenDate;
  objc_super v9 = [(HXUIInlineDatePickerTableViewCell *)self->_timeTableViewCell datePicker];
  [v9 setDate:v8];

  [(_WDTwoPartDateTimeManualEntryItem *)self _updateCellLabels];
}

- (void)_timePickerDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58___WDTwoPartDateTimeManualEntryItem__timePickerDidChange___block_invoke;
  void v5[3] = &unk_1E5E7CC70;
  objc_copyWeak(&v6, &location);
  [(_WDTwoPartDateTimeManualEntryItem *)self _generateValue:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_updateCellLabels
{
  dateTableViewCell = self->_dateTableViewCell;
  id v4 = [(HXUIInlineDatePickerTableViewCell *)dateTableViewCell datePicker];
  uint64_t v5 = [v4 date];
  [(HXUIInlineDatePickerTableViewCell *)dateTableViewCell updateLabelWithDate:v5];

  timeTableViewCell = self->_timeTableViewCell;
  v7 = [(HXUIInlineDatePickerTableViewCell *)timeTableViewCell datePicker];
  v8 = [v7 date];
  [(HXUIInlineDatePickerTableViewCell *)timeTableViewCell updateLabelWithDate:v8];

  [(WDAddDataManualEntryItem *)self _didUpdateValue];
}

- (id)generateValue
{
  return self->_chosenDate;
}

- (void)_generateValue:(id)a3
{
  timeTableViewCell = self->_timeTableViewCell;
  id v5 = a3;
  id v6 = [(HXUIInlineDatePickerTableViewCell *)timeTableViewCell datePicker];
  id v14 = [v6 date];

  v7 = [(HXUIInlineDatePickerTableViewCell *)self->_dateTableViewCell datePicker];
  v8 = [v7 date];

  objc_super v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v10 = [v9 components:30 fromDate:v8];
  v11 = [v9 components:96 fromDate:v14];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  objc_msgSend(v12, "setEra:", objc_msgSend(v10, "era"));
  objc_msgSend(v12, "setYear:", objc_msgSend(v10, "year"));
  objc_msgSend(v12, "setMonth:", objc_msgSend(v10, "month"));
  objc_msgSend(v12, "setDay:", objc_msgSend(v10, "day"));
  objc_msgSend(v12, "setHour:", objc_msgSend(v11, "hour"));
  objc_msgSend(v12, "setMinute:", objc_msgSend(v11, "minute"));
  v13 = [v9 timeZone];
  [v12 setTimeZone:v13];

  [(WDAddDataManualEntryItem *)self _disambiguateDateComponents:v12 withCompletion:v5];
}

- (void)setValue:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&self->_chosenDate, a3);
    id v5 = [(HXUIInlineDatePickerTableViewCell *)self->_timeTableViewCell datePicker];
    [v5 setDate:v7];

    id v6 = [(HXUIInlineDatePickerTableViewCell *)self->_dateTableViewCell datePicker];
    [v6 setDate:v7];

    [(_WDTwoPartDateTimeManualEntryItem *)self _updateCellLabels];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chosenDate, 0);
  objc_storeStrong((id *)&self->_maximumDate, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_timeTableViewCell, 0);
  objc_storeStrong((id *)&self->_dateTableViewCell, 0);
}

@end