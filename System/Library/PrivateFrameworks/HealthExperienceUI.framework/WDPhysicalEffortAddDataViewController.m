@interface WDPhysicalEffortAddDataViewController
- (WDPhysicalEffortAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7;
- (id)defaultEditingItem;
- (id)generateHKObjects;
- (id)manualEntryItemsForSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)manualEntryItemDidUpdate:(id)a3;
- (void)validateDataWithCompletion:(id)a3;
- (void)viewDidLoad;
@end

@implementation WDPhysicalEffortAddDataViewController

- (WDPhysicalEffortAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7
{
  v19.receiver = self;
  v19.super_class = (Class)WDPhysicalEffortAddDataViewController;
  v7 = [(WDAddDataViewController *)&v19 initWithDisplayType:a3 healthStore:a4 unitController:a5 initialStartDate:a6 dateCache:a7];
  if (v7)
  {
    v8 = HKIntegerFormatter();
    uint64_t v9 = +[WDAddDataManualEntryItem numericItemWithManualEntryType:1 numberFormatter:v8];
    physicalEffortItem = v7->_physicalEffortItem;
    v7->_physicalEffortItem = (WDAddDataManualEntryItem *)v9;

    [(WDAddDataManualEntryItem *)v7->_physicalEffortItem setDelegate:v7];
    v11 = v7->_physicalEffortItem;
    v12 = HABundle();
    v13 = [v12 localizedStringForKey:@"PHYSICAL_EFFORT_UNIT" value:&stru_1F04402E8 table:@"AddDataLocalization"];
    [(WDAddDataManualEntryItem *)v11 setTitle:v13];

    v14 = [(HKDateCache *)v7->super._dateCache oneMinuteBeforeEndOfDayMidnight];
    uint64_t v15 = +[WDAddDataManualEntryItem twoPartDateRangeItemWithMaximumEndDate:v14];
    dateRangeItem = v7->_dateRangeItem;
    v7->_dateRangeItem = (WDAddDataManualEntryItem *)v15;

    [(WDAddDataManualEntryItem *)v7->_dateRangeItem setDelegate:v7];
    v17 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)WDPhysicalEffortAddDataViewController;
  [(WDAddDataViewController *)&v3 viewDidLoad];
  [(WDAddDataViewController *)self setSavingEnabled:0];
}

- (id)generateHKObjects
{
  v18[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A888]];
  v4 = [(WDAddDataManualEntryItem *)self->_physicalEffortItem generateValue];
  [v4 doubleValue];
  double v6 = v5;

  v7 = [(WDAddDataManualEntryItem *)self->_dateRangeItem generateValue];
  v8 = (void *)MEMORY[0x1E4F2B388];
  uint64_t v9 = (void *)MEMORY[0x1E4F2B370];
  v10 = [MEMORY[0x1E4F2B618] unitFromString:@"kcal/(kg*hr)"];
  v11 = [v9 quantityWithUnit:v10 doubleValue:v6];
  v12 = [v7 startDate];
  v13 = [v7 endDate];
  v14 = [(WDAddDataViewController *)self defaultMetadata];
  uint64_t v15 = [v8 quantitySampleWithType:v3 quantity:v11 startDate:v12 endDate:v13 metadata:v14];

  v18[0] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];

  return v16;
}

- (int64_t)numberOfSections
{
  return 2;
}

- (id)manualEntryItemsForSection:(int64_t)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    dateRangeItem = self->_dateRangeItem;
    p_dateRangeItem = &dateRangeItem;
    goto LABEL_5;
  }
  if (!a3)
  {
    v7[0] = self->_physicalEffortItem;
    p_dateRangeItem = (WDAddDataManualEntryItem **)v7;
LABEL_5:
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:p_dateRangeItem count:1];
    goto LABEL_7;
  }
  v4 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_7:
  return v4;
}

- (id)defaultEditingItem
{
  return self->_physicalEffortItem;
}

- (void)validateDataWithCompletion:(id)a3
{
  dateRangeItem = self->_dateRangeItem;
  id v5 = a3;
  id v8 = [(WDAddDataManualEntryItem *)dateRangeItem generateValue];
  double v6 = [v8 startDate];
  v7 = [v8 endDate];
  [(WDAddDataViewController *)self validateMaximumAllowedDurationFor:v6 endDate:v7 competion:v5];
}

- (void)manualEntryItemDidUpdate:(id)a3
{
  v4 = [(WDAddDataManualEntryItem *)self->_physicalEffortItem generateValue];

  id v22 = [(WDAddDataManualEntryItem *)self->_dateRangeItem generateValue];
  id v5 = [v22 endDate];
  double v6 = [v22 startDate];
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;

  uint64_t v9 = [(HKUnitPreferenceController *)self->super._unitController unitForDisplayType:self->super._displayType];
  v10 = [(HKDisplayType *)self->super._displayType presentation];
  v11 = [(WDAddDataManualEntryItem *)self->_physicalEffortItem generateValue];
  v12 = [v10 adjustedValueForClientValue:v11];

  v13 = (void *)MEMORY[0x1E4F2B370];
  [v12 doubleValue];
  v14 = objc_msgSend(v13, "quantityWithUnit:doubleValue:", v9);
  validationController = self->super._validationController;
  v16 = [(HKDisplayType *)self->super._displayType objectType];
  uint64_t v17 = [(HKManualEntryValidationController *)validationController validateQuantity:v14 ofType:v16];

  if (v17 == 2
    || (BOOL v18 = v4 != 0,
        objc_super v19 = self->super._validationController,
        [(HKDisplayType *)self->super._displayType sampleType],
        v20 = objc_claimAutoreleasedReturnValue(),
        uint64_t v21 = [(HKManualEntryValidationController *)v19 validateMinimumAllowedDuration:v20 ofType:v8], v20, v21 == 2))
  {
    BOOL v18 = 0;
  }
  [(WDAddDataViewController *)self setSavingEnabled:v18];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalEffortItem, 0);
  objc_storeStrong((id *)&self->_dateRangeItem, 0);
}

@end