@interface WDAddDataManualEntryItem
+ (id)dateItemWithMaximumDate:(id)a3;
+ (id)dateTimeItemWithMaximumDate:(id)a3 displayName:(id)a4;
+ (id)dateTimeItemWithMaximumDate:(id)a3 highlightWhenEditing:(BOOL)a4 displayName:(id)a5;
+ (id)durationItemWithMaximumDate:(id)a3;
+ (id)heightPickerItemWithFeetUnitString:(id)a3 inchUnitString:(id)a4;
+ (id)multiSelectItemWithEntries:(id)a3 selectedIndex:(int64_t)a4;
+ (id)numericItemWithManualEntryType:(unint64_t)a3 numberFormatter:(id)a4;
+ (id)timeItemWithMaximumDate:(id)a3;
+ (id)twoPartDateRangeItemWithMaximumEndDate:(id)a3;
+ (id)twoPartDateTimeItemWithMaximumDate:(id)a3;
- (NSNumber)identifier;
- (NSString)secondaryLabel;
- (NSString)title;
- (WDAddDataManualEntryItemDelegate)delegate;
- (id)_createHXUIInlineDatePickerTableViewCellWithTitle:(id)a3 datePickerMode:(int64_t)a4 maxDate:(id)a5;
- (id)_createHXUIInlinePickerTableViewCellWithTitle:(id)a3;
- (id)_createUITableViewCell;
- (id)_createWDManualDataEntryTableViewCellWithDisplayName:(id)a3 unitName:(id)a4 entryType:(unint64_t)a5 highlightWhenEditing:(BOOL)a6;
- (id)generateValue;
- (id)tableViewCells;
- (void)_didUpdateValue;
- (void)_disambiguateDateComponents:(id)a3 withCompletion:(id)a4;
- (void)cellForItemTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation WDAddDataManualEntryItem

+ (id)dateItemWithMaximumDate:(id)a3
{
  id v3 = a3;
  v4 = [_WDDateBasedAddDataManualEntryItem alloc];
  v5 = HABundle();
  v6 = [v5 localizedStringForKey:@"DATE" value:&stru_1F04402E8 table:@"AddDataLocalization"];
  v7 = [(_WDDateBasedAddDataManualEntryItem *)v4 initWithMaximumDate:v3 highlightWhenEditing:0 datePickerMode:1 displayName:v6];

  return v7;
}

+ (id)timeItemWithMaximumDate:(id)a3
{
  id v3 = a3;
  v4 = [_WDDateBasedAddDataManualEntryItem alloc];
  v5 = HABundle();
  v6 = [v5 localizedStringForKey:@"TIME" value:&stru_1F04402E8 table:@"AddDataLocalization"];
  v7 = [(_WDDateBasedAddDataManualEntryItem *)v4 initWithMaximumDate:v3 highlightWhenEditing:0 datePickerMode:0 displayName:v6];

  return v7;
}

+ (id)dateTimeItemWithMaximumDate:(id)a3 displayName:(id)a4
{
  return (id)[a1 dateTimeItemWithMaximumDate:a3 highlightWhenEditing:0 displayName:a4];
}

+ (id)dateTimeItemWithMaximumDate:(id)a3 highlightWhenEditing:(BOOL)a4 displayName:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  v9 = [[_WDDateBasedAddDataManualEntryItem alloc] initWithMaximumDate:v8 highlightWhenEditing:v5 datePickerMode:2 displayName:v7];

  return v9;
}

+ (id)twoPartDateTimeItemWithMaximumDate:(id)a3
{
  id v3 = a3;
  v4 = [[_WDTwoPartDateTimeManualEntryItem alloc] initWithMaximumDate:v3];

  return v4;
}

+ (id)twoPartDateRangeItemWithMaximumEndDate:(id)a3
{
  id v3 = a3;
  v4 = [[_WDTwoPartDateRangeManualEntryItem alloc] initWithMaximumEndDate:v3];

  return v4;
}

+ (id)durationItemWithMaximumDate:(id)a3
{
  id v3 = a3;
  v4 = [[_WDDateWithDurationManualEntryItem alloc] initWithMaximumDate:v3];

  return v4;
}

+ (id)numericItemWithManualEntryType:(unint64_t)a3 numberFormatter:(id)a4
{
  id v5 = a4;
  v6 = objc_alloc_init(_WDNumberBasedAddDataManualEntryItem);
  [(_WDNumberBasedAddDataManualEntryItem *)v6 setManualEntryType:a3];
  [(_WDNumberBasedAddDataManualEntryItem *)v6 setNumberFormatter:v5];

  return v6;
}

+ (id)multiSelectItemWithEntries:(id)a3 selectedIndex:(int64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(_WDMultiSelectManualEntryItem);
  [(_WDMultiSelectManualEntryItem *)v6 setTitles:v5];

  [(_WDMultiSelectManualEntryItem *)v6 setSelectedIndex:a4];
  return v6;
}

+ (id)heightPickerItemWithFeetUnitString:(id)a3 inchUnitString:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[_WDHeightPickerManualEntryItem alloc] initWithDisplayName:v6];
  [(_WDHeightPickerManualEntryItem *)v7 setFeetUnitString:v6];

  [(_WDHeightPickerManualEntryItem *)v7 setInchUnitString:v5];
  return v7;
}

- (id)_createUITableViewCell
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:0];
  return v2;
}

- (id)_createWDManualDataEntryTableViewCellWithDisplayName:(id)a3 unitName:(id)a4 entryType:(unint64_t)a5 highlightWhenEditing:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a3;
  v11 = [[WDManualDataEntryTableViewCell alloc] initWithDisplayName:v10 unitName:v9 dataEntryType:a5];

  [(WDManualDataEntryTableViewCell *)v11 setShouldHighlightWhenEditing:v6];
  return v11;
}

- (id)_createHXUIInlineDatePickerTableViewCellWithTitle:(id)a3 datePickerMode:(int64_t)a4 maxDate:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [[HXUIInlineDatePickerTableViewCell alloc] initWithTitle:v8 datePickerMode:a4 maxDate:v7];

  return v9;
}

- (id)_createHXUIInlinePickerTableViewCellWithTitle:(id)a3
{
  id v3 = a3;
  v4 = [[HXUIInlinePickerTableViewCell alloc] initWithTitle:v3];

  return v4;
}

- (void)_didUpdateValue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained manualEntryItemDidUpdate:self];
}

- (void)_disambiguateDateComponents:(id)a3 withCompletion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v9 = objc_msgSend(v8, "hk_disambiguatedDSTDatesForComponents:", v6);
  if ([v9 count] == 1)
  {
    id v10 = [v9 firstObject];
    v7[2](v7, v10);
  }
  else
  {
    v24 = self;
    v25 = v8;
    id v26 = v6;
    v11 = v7;
    v12 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
    id v13 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v13 setDateStyle:3];
    [v13 setTimeStyle:3];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v9;
    uint64_t v14 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x1E4FB1410];
          v20 = [v13 stringFromDate:v18];
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __71__WDAddDataManualEntryItem__disambiguateDateComponents_withCompletion___block_invoke;
          v28[3] = &unk_1E5E7CC48;
          v21 = v11;
          v28[4] = v18;
          v29 = v21;
          v22 = [v19 actionWithTitle:v20 style:0 handler:v28];

          [v12 addAction:v22];
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v15);
    }

    v23 = [(WDAddDataManualEntryItem *)v24 delegate];
    [v23 presentViewController:v12 animated:1 completion:0];

    id v8 = v25;
    id v6 = v26;
    id v7 = v11;
  }
}

uint64_t __71__WDAddDataManualEntryItem__disambiguateDateComponents_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setValue:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x1E4F29FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = NSStringFromSelector(a2);
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2114;
    v11 = self;
    _os_log_impl(&dword_1AD1A4000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ has been called on %{public}@, which does not implement this method. This is probably a mistake.", (uint8_t *)&v8, 0x16u);
  }
}

- (void)cellForItemTapped:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 beginEditing];
  }
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (WDAddDataManualEntryItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WDAddDataManualEntryItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)generateValue
{
  return 0;
}

- (id)tableViewCells
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end