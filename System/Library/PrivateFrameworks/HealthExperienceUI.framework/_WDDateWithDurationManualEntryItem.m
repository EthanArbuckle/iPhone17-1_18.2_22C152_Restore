@interface _WDDateWithDurationManualEntryItem
- (_WDDateWithDurationManualEntryItem)initWithMaximumDate:(id)a3;
- (id)generateValue;
- (id)tableViewCells;
- (void)_setupEntryItems;
- (void)beginEditing;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation _WDDateWithDurationManualEntryItem

- (_WDDateWithDurationManualEntryItem)initWithMaximumDate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_WDDateWithDurationManualEntryItem;
  v6 = [(_WDDateWithDurationManualEntryItem *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_maximumStartDate, a3);
    [(_WDDateWithDurationManualEntryItem *)v7 _setupEntryItems];
  }

  return v7;
}

- (id)tableViewCells
{
  v3 = [(WDAddDataManualEntryItem *)self->_startItem tableViewCells];
  v4 = [(WDAddDataManualEntryItem *)self->_durationItem tableViewCells];
  id v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (void)_setupEntryItems
{
  maximumStartDate = self->_maximumStartDate;
  v4 = HABundle();
  id v5 = [v4 localizedStringForKey:@"STARTS" value:&stru_1F04402E8 table:@"AddDataLocalization"];
  v6 = +[WDAddDataManualEntryItem dateTimeItemWithMaximumDate:maximumStartDate highlightWhenEditing:1 displayName:v5];
  startItem = self->_startItem;
  self->_startItem = v6;

  v8 = HKIntegerFormatter();
  objc_super v9 = +[WDAddDataManualEntryItem numericItemWithManualEntryType:1 numberFormatter:v8];
  durationItem = self->_durationItem;
  self->_durationItem = v9;

  v11 = self->_durationItem;
  v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v13 = [v12 localizedStringForKey:@"DURATION" value:&stru_1F04402E8 table:@"HealthUI-Localizable"];
  [(WDAddDataManualEntryItem *)v11 setTitle:v13];

  v14 = self->_durationItem;
  v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v16 = [v15 localizedStringForKey:@"SECONDS_MEDIUM" value:&stru_1F04402E8 table:@"HealthUI-Localizable"];
  [(WDAddDataManualEntryItem *)v14 setSecondaryLabel:v16];

  [(WDAddDataManualEntryItem *)self->_startItem setDelegate:self];
  v17 = self->_durationItem;
  [(WDAddDataManualEntryItem *)v17 setDelegate:self];
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(WDAddDataManualEntryItem *)self delegate];
  [v10 presentViewController:v9 animated:v5 completion:v8];
}

- (id)generateValue
{
  v3 = [(WDAddDataManualEntryItem *)self->_startItem generateValue];
  v4 = [(WDAddDataManualEntryItem *)self->_durationItem generateValue];
  BOOL v5 = v4;
  if (v4) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v9 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F67CA0];
    [v4 doubleValue];
    id v8 = objc_msgSend(v3, "dateByAddingTimeInterval:");
    id v9 = [v7 valueRangeWithMinValue:v3 maxValue:v8];
  }
  return v9;
}

- (void)beginEditing
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumStartDate, 0);
  objc_storeStrong((id *)&self->_durationItem, 0);
  objc_storeStrong((id *)&self->_startItem, 0);
}

@end