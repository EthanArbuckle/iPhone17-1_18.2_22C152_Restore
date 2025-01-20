@interface _WDTwoPartDateRangeManualEntryItem
- (_WDTwoPartDateRangeManualEntryItem)initWithMaximumEndDate:(id)a3;
- (id)generateValue;
- (id)tableViewCells;
- (void)_endItemDidChange;
- (void)_setupEntryItems;
- (void)_startItemDidChange;
- (void)beginEditing;
- (void)manualEntryItemDidUpdate:(id)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation _WDTwoPartDateRangeManualEntryItem

- (_WDTwoPartDateRangeManualEntryItem)initWithMaximumEndDate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_WDTwoPartDateRangeManualEntryItem;
  v6 = [(_WDTwoPartDateRangeManualEntryItem *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_maximumEndDate, a3);
    [(_WDTwoPartDateRangeManualEntryItem *)v7 _setupEntryItems];
  }

  return v7;
}

- (id)tableViewCells
{
  v3 = [(WDAddDataManualEntryItem *)self->_startItem tableViewCells];
  v4 = [(WDAddDataManualEntryItem *)self->_endItem tableViewCells];
  id v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (void)_setupEntryItems
{
  maximumEndDate = self->_maximumEndDate;
  v4 = HABundle();
  id v5 = [v4 localizedStringForKey:@"STARTS" value:&stru_1F04402E8 table:@"AddDataLocalization"];
  v6 = +[WDAddDataManualEntryItem dateTimeItemWithMaximumDate:maximumEndDate highlightWhenEditing:1 displayName:v5];
  startItem = self->_startItem;
  self->_startItem = v6;

  v8 = self->_maximumEndDate;
  objc_super v9 = HABundle();
  v10 = [v9 localizedStringForKey:@"ENDS" value:&stru_1F04402E8 table:@"AddDataLocalization"];
  v11 = +[WDAddDataManualEntryItem dateTimeItemWithMaximumDate:v8 highlightWhenEditing:1 displayName:v10];
  endItem = self->_endItem;
  self->_endItem = v11;

  [(WDAddDataManualEntryItem *)self->_startItem setDelegate:self];
  v13 = self->_endItem;
  [(WDAddDataManualEntryItem *)v13 setDelegate:self];
}

- (void)manualEntryItemDidUpdate:(id)a3
{
  if (self->_startItem == a3) {
    [(_WDTwoPartDateRangeManualEntryItem *)self _startItemDidChange];
  }
  else {
    [(_WDTwoPartDateRangeManualEntryItem *)self _endItemDidChange];
  }
  [(WDAddDataManualEntryItem *)self _didUpdateValue];
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(WDAddDataManualEntryItem *)self delegate];
  [v10 presentViewController:v9 animated:v5 completion:v8];
}

- (void)_startItemDidChange
{
  id v5 = [(WDAddDataManualEntryItem *)self->_startItem generateValue];
  v3 = [(WDAddDataManualEntryItem *)self->_endItem generateValue];
  int IsLarger = HKUIObjectIsLarger();

  if (IsLarger) {
    [(WDAddDataManualEntryItem *)self->_endItem setValue:v5];
  }
}

- (void)_endItemDidChange
{
  id v5 = [(WDAddDataManualEntryItem *)self->_endItem generateValue];
  v3 = [(WDAddDataManualEntryItem *)self->_startItem generateValue];
  int IsSmaller = HKUIObjectIsSmaller();

  if (IsSmaller) {
    [(WDAddDataManualEntryItem *)self->_startItem setValue:v5];
  }
}

- (id)generateValue
{
  v3 = [(WDAddDataManualEntryItem *)self->_startItem generateValue];
  v4 = [(WDAddDataManualEntryItem *)self->_endItem generateValue];
  id v5 = [MEMORY[0x1E4F67CA0] valueRangeWithMinValue:v3 maxValue:v4];

  return v5;
}

- (void)beginEditing
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumEndDate, 0);
  objc_storeStrong((id *)&self->_endItem, 0);
  objc_storeStrong((id *)&self->_startItem, 0);
}

@end