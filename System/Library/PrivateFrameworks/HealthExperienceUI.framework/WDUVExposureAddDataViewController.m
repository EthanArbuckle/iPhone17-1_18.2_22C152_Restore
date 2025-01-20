@interface WDUVExposureAddDataViewController
- (WDUVExposureAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7;
- (id)defaultEditingItem;
- (id)generateHKObjects;
- (id)manualEntryItemsForSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)manualEntryItemDidUpdate:(id)a3;
- (void)validateDataWithCompletion:(id)a3;
- (void)viewDidLoad;
@end

@implementation WDUVExposureAddDataViewController

- (WDUVExposureAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7
{
  v19.receiver = self;
  v19.super_class = (Class)WDUVExposureAddDataViewController;
  v7 = [(WDAddDataViewController *)&v19 initWithDisplayType:a3 healthStore:a4 unitController:a5 initialStartDate:a6 dateCache:a7];
  if (v7)
  {
    v8 = HKIntegerFormatter();
    uint64_t v9 = +[WDAddDataManualEntryItem numericItemWithManualEntryType:1 numberFormatter:v8];
    valueEntryItem = v7->_valueEntryItem;
    v7->_valueEntryItem = (WDAddDataManualEntryItem *)v9;

    [(WDAddDataManualEntryItem *)v7->_valueEntryItem setDelegate:v7];
    v11 = v7->_valueEntryItem;
    v12 = HABundle();
    v13 = [v12 localizedStringForKey:@"UV_INDEX" value:&stru_1F04402E8 table:@"AddDataLocalization"];
    [(WDAddDataManualEntryItem *)v11 setTitle:v13];

    v14 = [(HKDateCache *)v7->super._dateCache oneMinuteBeforeEndOfDayMidnight];
    uint64_t v15 = +[WDAddDataManualEntryItem twoPartDateRangeItemWithMaximumEndDate:v14];
    dateRangeEntryItem = v7->_dateRangeEntryItem;
    v7->_dateRangeEntryItem = (WDAddDataManualEntryItem *)v15;

    [(WDAddDataManualEntryItem *)v7->_dateRangeEntryItem setDelegate:v7];
    v17 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)WDUVExposureAddDataViewController;
  [(WDAddDataViewController *)&v3 viewDidLoad];
  [(WDAddDataViewController *)self setSavingEnabled:0];
}

- (id)generateHKObjects
{
  v18[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A908]];
  v4 = [(WDAddDataManualEntryItem *)self->_valueEntryItem generateValue];
  [v4 doubleValue];
  double v6 = v5;

  v7 = [(WDAddDataManualEntryItem *)self->_dateRangeEntryItem generateValue];
  v8 = (void *)MEMORY[0x1E4F2B388];
  uint64_t v9 = (void *)MEMORY[0x1E4F2B370];
  v10 = [MEMORY[0x1E4F2B618] countUnit];
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
    dateRangeEntryItem = self->_dateRangeEntryItem;
    p_dateRangeEntryItem = &dateRangeEntryItem;
    goto LABEL_5;
  }
  if (!a3)
  {
    v7[0] = self->_valueEntryItem;
    p_dateRangeEntryItem = (WDAddDataManualEntryItem **)v7;
LABEL_5:
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:p_dateRangeEntryItem count:1];
    goto LABEL_7;
  }
  v4 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_7:
  return v4;
}

- (id)defaultEditingItem
{
  return self->_valueEntryItem;
}

- (void)validateDataWithCompletion:(id)a3
{
  dateRangeEntryItem = self->_dateRangeEntryItem;
  id v5 = a3;
  id v8 = [(WDAddDataManualEntryItem *)dateRangeEntryItem generateValue];
  double v6 = [v8 startDate];
  v7 = [v8 endDate];
  [(WDAddDataViewController *)self validateMaximumAllowedDurationFor:v6 endDate:v7 competion:v5];
}

- (void)manualEntryItemDidUpdate:(id)a3
{
  v4 = [(WDAddDataManualEntryItem *)self->_valueEntryItem generateValue];

  id v14 = [(WDAddDataManualEntryItem *)self->_dateRangeEntryItem generateValue];
  id v5 = [v14 endDate];
  double v6 = [v14 startDate];
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;

  validationController = self->super._validationController;
  v10 = [(HKDisplayType *)self->super._displayType sampleType];
  uint64_t v11 = [(HKManualEntryValidationController *)validationController validateMinimumAllowedDuration:v10 ofType:v8];

  BOOL v13 = v11 != 2 && v4 != 0;
  [(WDAddDataViewController *)self setSavingEnabled:v13];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueEntryItem, 0);
  objc_storeStrong((id *)&self->_dateRangeEntryItem, 0);
}

@end