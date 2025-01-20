@interface WDCategoryAddDataViewController
- (BOOL)_hasCategoryValueEntryItem;
- (BOOL)useDuration;
- (BOOL)useSingleStartAndEndDate;
- (HKValueRange)selectedDateRange;
- (WDAddDataManualEntryItem)categoryValueEntryItem;
- (WDAddDataManualEntryItem)dateEntryItem;
- (WDCategoryAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7;
- (id)_categoryCells;
- (id)_orderedTitlesForCategoryValuePicker;
- (id)generateHKObjects;
- (id)manualEntryItemsForSection:(int64_t)a3;
- (int64_t)_defaultSelectedIndex;
- (int64_t)numberOfSections;
- (void)updateSavingEnabled;
- (void)validateDataWithCompletion:(id)a3;
- (void)viewDidLoad;
@end

@implementation WDCategoryAddDataViewController

- (WDCategoryAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7
{
  v22.receiver = self;
  v22.super_class = (Class)WDCategoryAddDataViewController;
  v7 = [(WDAddDataViewController *)&v22 initWithDisplayType:a3 healthStore:a4 unitController:a5 initialStartDate:a6 dateCache:a7];
  v8 = v7;
  if (v7)
  {
    if ([(WDCategoryAddDataViewController *)v7 useSingleStartAndEndDate])
    {
      v9 = [(HKDateCache *)v8->super._dateCache oneMinuteBeforeEndOfDayMidnight];
      v10 = HABundle();
      v11 = [v10 localizedStringForKey:@"DATE" value:&stru_1F04402E8 table:@"AddDataLocalization"];
      uint64_t v12 = +[WDAddDataManualEntryItem dateTimeItemWithMaximumDate:v9 displayName:v11];
      dateEntryItem = v8->_dateEntryItem;
      v8->_dateEntryItem = (WDAddDataManualEntryItem *)v12;
    }
    else
    {
      BOOL v14 = [(WDCategoryAddDataViewController *)v8 useDuration];
      v15 = [(HKDateCache *)v8->super._dateCache oneMinuteBeforeEndOfDayMidnight];
      if (v14) {
        +[WDAddDataManualEntryItem durationItemWithMaximumDate:v15];
      }
      else {
      uint64_t v16 = +[WDAddDataManualEntryItem twoPartDateRangeItemWithMaximumEndDate:v15];
      }
      v17 = v8->_dateEntryItem;
      v8->_dateEntryItem = (WDAddDataManualEntryItem *)v16;

      [(WDAddDataManualEntryItem *)v8->_dateEntryItem setDelegate:v8];
    }
    v18 = [(WDCategoryAddDataViewController *)v8 _orderedTitlesForCategoryValuePicker];
    if ([v18 count])
    {
      uint64_t v19 = +[WDAddDataManualEntryItem multiSelectItemWithEntries:v18 selectedIndex:[(WDCategoryAddDataViewController *)v8 _defaultSelectedIndex]];
      categoryValueEntryItem = v8->_categoryValueEntryItem;
      v8->_categoryValueEntryItem = (WDAddDataManualEntryItem *)v19;
    }
  }
  return v8;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)WDCategoryAddDataViewController;
  [(WDAddDataViewController *)&v3 viewDidLoad];
  [(WDCategoryAddDataViewController *)self updateSavingEnabled];
}

- (id)_orderedTitlesForCategoryValuePicker
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(HKDisplayType *)self->super._displayType hk_enumeratedValueLabels];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(HKDisplayType *)self->super._displayType wd_valueOrderForAddDataViewController];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (int64_t)_defaultSelectedIndex
{
  objc_super v3 = [(HKDisplayType *)self->super._displayType wd_defaultValueForAddDataViewController];
  if (v3)
  {
    id v4 = [(HKDisplayType *)self->super._displayType wd_valueOrderForAddDataViewController];
    uint64_t v5 = [v4 indexOfObject:v3];

    if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
      int64_t v6 = 0;
    }
    else {
      int64_t v6 = v5;
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (BOOL)useSingleStartAndEndDate
{
  uint64_t v2 = [(HKDisplayType *)self->super._displayType displayTypeIdentifier];
  BOOL result = 1;
  if ((unint64_t)(v2 - 91) > 6 || ((1 << (v2 - 91)) & 0x63) == 0)
  {
    unint64_t v5 = v2 - 236;
    BOOL v6 = v5 > 8;
    uint64_t v7 = (1 << v5) & 0x181;
    if (v6 || v7 == 0) {
      return 0;
    }
  }
  return result;
}

- (BOOL)useDuration
{
  uint64_t v2 = [(HKDisplayType *)self->super._displayType displayTypeIdentifier];
  return v2 == 189 || v2 == 237;
}

- (BOOL)_hasCategoryValueEntryItem
{
  return self->_categoryValueEntryItem != 0;
}

- (int64_t)numberOfSections
{
  if ([(WDCategoryAddDataViewController *)self _hasCategoryValueEntryItem]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)manualEntryItemsForSection:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (![(WDCategoryAddDataViewController *)self _hasCategoryValueEntryItem])
  {
    dateEntryItem = self->_dateEntryItem;
    p_dateEntryItem = &dateEntryItem;
    goto LABEL_7;
  }
  if (!a3)
  {
    categoryValueEntryItem = self->_categoryValueEntryItem;
    p_dateEntryItem = &categoryValueEntryItem;
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    v10[0] = self->_dateEntryItem;
    p_dateEntryItem = (WDAddDataManualEntryItem **)v10;
LABEL_7:
    BOOL v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", p_dateEntryItem, 1, dateEntryItem, categoryValueEntryItem, v10[0]);
    goto LABEL_8;
  }
  BOOL v6 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_8:
  return v6;
}

- (id)generateHKObjects
{
  v17[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(WDCategoryAddDataViewController *)self selectedDateRange];
  id v4 = [(WDAddDataManualEntryItem *)self->_categoryValueEntryItem generateValue];
  uint64_t v5 = [v4 integerValue];

  if ([(WDCategoryAddDataViewController *)self _hasCategoryValueEntryItem])
  {
    BOOL v6 = [(HKDisplayType *)self->super._displayType wd_valueOrderForAddDataViewController];
    uint64_t v7 = [v6 objectAtIndexedSubscript:v5];
    uint64_t v8 = [v7 integerValue];
  }
  else
  {
    uint64_t v8 = 0;
  }
  v9 = [(WDAddDataViewController *)self defaultMetadata];
  v10 = (void *)MEMORY[0x1E4F2ACB0];
  v11 = [(HKDisplayType *)self->super._displayType sampleType];
  long long v12 = [v3 startDate];
  long long v13 = [v3 endDate];
  long long v14 = [v10 categorySampleWithType:v11 value:v8 startDate:v12 endDate:v13 metadata:v9];

  v17[0] = v14;
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];

  return v15;
}

- (HKValueRange)selectedDateRange
{
  BOOL v3 = [(WDCategoryAddDataViewController *)self useSingleStartAndEndDate];
  id v4 = [(WDAddDataManualEntryItem *)self->_dateEntryItem generateValue];
  if (v3)
  {
    uint64_t v5 = [MEMORY[0x1E4F67CA0] valueRangeWithMinValue:v4 maxValue:v4];

    id v4 = (void *)v5;
  }
  return (HKValueRange *)v4;
}

- (void)validateDataWithCompletion:(id)a3
{
  id v8 = a3;
  id v4 = [(HKDisplayType *)self->super._displayType sampleType];
  if ([(WDCategoryAddDataViewController *)self useSingleStartAndEndDate]
    || ![v4 isMaximumDurationRestricted])
  {
    (*((void (**)(id, uint64_t, void, void))v8 + 2))(v8, 1, 0, 0);
  }
  else
  {
    uint64_t v5 = [(WDCategoryAddDataViewController *)self selectedDateRange];
    BOOL v6 = [v5 startDate];
    uint64_t v7 = [v5 endDate];
    [(WDAddDataViewController *)self validateMaximumAllowedDurationFor:v6 endDate:v7 competion:v8];
  }
}

- (void)updateSavingEnabled
{
  if (![(WDCategoryAddDataViewController *)self useSingleStartAndEndDate])
  {
    BOOL v3 = [(WDCategoryAddDataViewController *)self selectedDateRange];
    id v17 = v3;
    if (!v3) {
      goto LABEL_8;
    }
    id v4 = [v3 endDate];
    uint64_t v5 = [v17 startDate];
    [v4 timeIntervalSinceDate:v5];
    double v7 = v6;

    validationController = self->super._validationController;
    v9 = [(HKDisplayType *)self->super._displayType sampleType];
    uint64_t v10 = [(HKManualEntryValidationController *)validationController validateMinimumAllowedDuration:v9 ofType:v7];

    v11 = self->super._validationController;
    long long v12 = [(HKDisplayType *)self->super._displayType sampleType];
    uint64_t v13 = [(HKManualEntryValidationController *)v11 validateMaximumAllowedDuration:v12 ofType:v7];

    if (v10 == 2 || v13 == 2)
    {
LABEL_8:
      long long v15 = self;
      uint64_t v16 = 0;
    }
    else
    {
      long long v15 = self;
      uint64_t v16 = 1;
    }
    [(WDAddDataViewController *)v15 setSavingEnabled:v16];
  }
}

- (WDAddDataManualEntryItem)categoryValueEntryItem
{
  return self->_categoryValueEntryItem;
}

- (WDAddDataManualEntryItem)dateEntryItem
{
  return self->_dateEntryItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateEntryItem, 0);
  objc_storeStrong((id *)&self->_categoryValueEntryItem, 0);
}

- (id)_categoryCells
{
  return 0;
}

@end