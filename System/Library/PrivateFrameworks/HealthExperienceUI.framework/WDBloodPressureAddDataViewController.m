@interface WDBloodPressureAddDataViewController
- (BOOL)_systolicAndDiastolicHaveValues;
- (WDBloodPressureAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7;
- (id)defaultEditingItem;
- (id)generateHKObjects;
- (id)manualEntryItemsForSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)manualEntryItemDidUpdate:(id)a3;
- (void)validateDataWithCompletion:(id)a3;
- (void)viewDidLoad;
@end

@implementation WDBloodPressureAddDataViewController

- (WDBloodPressureAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7
{
  id v12 = a3;
  v28.receiver = self;
  v28.super_class = (Class)WDBloodPressureAddDataViewController;
  v13 = [(WDAddDataViewController *)&v28 initWithDisplayType:v12 healthStore:a4 unitController:a5 initialStartDate:a6 dateCache:a7];
  if (v13)
  {
    v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v15 = [v14 localizedStringForKey:@"SYSTOLIC" value:&stru_1F04402E8 table:@"HealthUI-Localizable"];

    v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v17 = [v16 localizedStringForKey:@"DIASTOLIC" value:&stru_1F04402E8 table:@"HealthUI-Localizable"];

    v18 = [(HKDateCache *)v13->super._dateCache oneMinuteBeforeEndOfDayMidnight];
    uint64_t v19 = +[WDAddDataManualEntryItem twoPartDateTimeItemWithMaximumDate:v18];
    dateTimeEntryItem = v13->_dateTimeEntryItem;
    v13->_dateTimeEntryItem = (WDAddDataManualEntryItem *)v19;

    [v12 roundingMode];
    v21 = HKDecimalFormatter();
    uint64_t v22 = +[WDAddDataManualEntryItem numericItemWithManualEntryType:1 numberFormatter:v21];
    systolicEntryItem = v13->_systolicEntryItem;
    v13->_systolicEntryItem = (WDAddDataManualEntryItem *)v22;

    [v12 roundingMode];
    v24 = HKDecimalFormatter();
    uint64_t v25 = +[WDAddDataManualEntryItem numericItemWithManualEntryType:1 numberFormatter:v24];
    diastolicEntryItem = v13->_diastolicEntryItem;
    v13->_diastolicEntryItem = (WDAddDataManualEntryItem *)v25;

    [(WDAddDataManualEntryItem *)v13->_systolicEntryItem setTitle:v15];
    [(WDAddDataManualEntryItem *)v13->_diastolicEntryItem setTitle:v17];
    [(WDAddDataManualEntryItem *)v13->_systolicEntryItem setDelegate:v13];
    [(WDAddDataManualEntryItem *)v13->_diastolicEntryItem setDelegate:v13];
  }
  return v13;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)WDBloodPressureAddDataViewController;
  [(WDAddDataViewController *)&v3 viewDidLoad];
  [(WDAddDataViewController *)self setSavingEnabled:0];
}

- (id)manualEntryItemsForSection:(int64_t)a3
{
  v6[3] = *MEMORY[0x1E4F143B8];
  systolicEntryItem = self->_systolicEntryItem;
  v6[0] = self->_dateTimeEntryItem;
  v6[1] = systolicEntryItem;
  v6[2] = self->_diastolicEntryItem;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  return v4;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (id)defaultEditingItem
{
  return self->_systolicEntryItem;
}

- (void)validateDataWithCompletion:(id)a3
{
  v40 = (void (**)(id, uint64_t, void *, uint64_t))a3;
  v4 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A620]];
  v5 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A618]];
  v6 = [(HKManualEntryValidationController *)self->super._validationController supportedQuantityTypes];
  v7 = [v4 identifier];
  if ([v6 containsObject:v7])
  {
    v8 = [v5 identifier];
    int v9 = [v6 containsObject:v8];

    if (!v9)
    {
      v29 = 0;
      uint64_t v30 = 1;
      goto LABEL_14;
    }
    v7 = [(HKUnitPreferenceController *)self->super._unitController unitForDisplayType:self->super._displayType];
    v10 = [(HKDisplayType *)self->super._displayType presentation];
    v11 = [(WDAddDataManualEntryItem *)self->_systolicEntryItem generateValue];
    [v10 adjustedValueForClientValue:v11];
    id v12 = v38 = v5;

    v13 = [(HKDisplayType *)self->super._displayType presentation];
    v14 = [(WDAddDataManualEntryItem *)self->_diastolicEntryItem generateValue];
    v39 = [v13 adjustedValueForClientValue:v14];

    v15 = (void *)MEMORY[0x1E4F2B370];
    [v12 doubleValue];
    uint64_t v16 = objc_msgSend(v15, "quantityWithUnit:doubleValue:", v7);
    v17 = (void *)MEMORY[0x1E4F2B370];
    [v39 doubleValue];
    uint64_t v18 = objc_msgSend(v17, "quantityWithUnit:doubleValue:", v7);
    v37 = (void *)v16;
    uint64_t v19 = [(HKManualEntryValidationController *)self->super._validationController validateQuantity:v16 ofType:v4];
    v36 = (void *)v18;
    uint64_t v20 = [(HKManualEntryValidationController *)self->super._validationController validateQuantity:v18 ofType:v38];
    v21 = [(HKDisplayType *)self->super._displayType hk_valueFormatterForUnit:v7];
    v35 = v12;
    uint64_t v22 = [v21 stringFromValue:v12 displayType:self->super._displayType unitController:self->super._unitController];

    v23 = [(HKDisplayType *)self->super._displayType hk_valueFormatterForUnit:v7];
    uint64_t v24 = [v23 stringFromValue:v39 displayType:self->super._displayType unitController:self->super._unitController];

    if (v19 == 1 && v20 == 1)
    {
      uint64_t v25 = NSString;
      v26 = HABundle();
      v27 = [v26 localizedStringForKey:@"OUT_OF_RANGE_ALERT_TWO_ITEMS_FORMAT_%@_%@" value:&stru_1F04402E8 table:@"AddDataLocalization"];
      objc_super v28 = (void *)v24;
      uint64_t v34 = v24;
    }
    else
    {
      objc_super v28 = (void *)v24;
      if (v19 != 1)
      {
        v31 = (void *)v22;
        v32 = v35;
        v5 = v38;
        if (v20 != 1)
        {
          v29 = 0;
          uint64_t v30 = 1;
          goto LABEL_12;
        }
        v33 = NSString;
        v26 = HABundle();
        v27 = [v26 localizedStringForKey:@"OUT_OF_RANGE_ALERT_ONE_ITEM_FORMAT_%@" value:&stru_1F04402E8 table:@"AddDataLocalization"];
        v29 = objc_msgSend(v33, "stringWithFormat:", v27, v28);
LABEL_11:

        uint64_t v30 = 0;
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v25 = NSString;
      v26 = HABundle();
      v27 = [v26 localizedStringForKey:@"OUT_OF_RANGE_ALERT_ONE_ITEM_FORMAT_%@" value:&stru_1F04402E8 table:@"AddDataLocalization"];
    }
    v31 = (void *)v22;
    v29 = objc_msgSend(v25, "stringWithFormat:", v27, v22, v34);
    v32 = v35;
    v5 = v38;
    goto LABEL_11;
  }
  v29 = 0;
  uint64_t v30 = 1;
LABEL_13:

LABEL_14:
  v40[2](v40, v30, v29, 1);
}

- (id)generateHKObjects
{
  v29[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HKUnitPreferenceController *)self->super._unitController unitForDisplayType:self->super._displayType];
  v4 = [(WDAddDataManualEntryItem *)self->_systolicEntryItem generateValue];
  v5 = [(WDAddDataManualEntryItem *)self->_diastolicEntryItem generateValue];
  v6 = [(HKDisplayType *)self->super._displayType presentation];
  objc_super v28 = [v6 adjustedValueForClientValue:v4];

  v7 = [(HKDisplayType *)self->super._displayType presentation];
  v26 = [v7 adjustedValueForClientValue:v5];

  v8 = (void *)MEMORY[0x1E4F2B370];
  [v28 doubleValue];
  v27 = (void *)v3;
  int v9 = objc_msgSend(v8, "quantityWithUnit:doubleValue:", v3);
  v10 = (void *)MEMORY[0x1E4F2B370];
  [v26 doubleValue];
  v11 = objc_msgSend(v10, "quantityWithUnit:doubleValue:", v3);
  id v12 = [(WDAddDataManualEntryItem *)self->_dateTimeEntryItem generateValue];
  v13 = [(WDAddDataViewController *)self defaultMetadata];
  v14 = (void *)MEMORY[0x1E4F2B388];
  v15 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A620]];
  uint64_t v16 = [v14 quantitySampleWithType:v15 quantity:v9 startDate:v12 endDate:v12 metadata:v13];

  v17 = (void *)MEMORY[0x1E4F2B388];
  uint64_t v18 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A618]];
  uint64_t v19 = [v17 quantitySampleWithType:v18 quantity:v11 startDate:v12 endDate:v12 metadata:v13];

  uint64_t v20 = (void *)MEMORY[0x1E4F2AE50];
  v21 = [MEMORY[0x1E4F2B2C0] correlationTypeForIdentifier:*MEMORY[0x1E4F29938]];
  uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v16, v19, 0);
  v23 = [v20 correlationWithType:v21 startDate:v12 endDate:v12 objects:v22 metadata:v13];

  v29[0] = v23;
  v29[1] = v16;
  v29[2] = v19;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];

  return v24;
}

- (BOOL)_systolicAndDiastolicHaveValues
{
  uint64_t v3 = [(WDAddDataManualEntryItem *)self->_systolicEntryItem generateValue];

  v4 = [(WDAddDataManualEntryItem *)self->_diastolicEntryItem generateValue];

  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

- (void)manualEntryItemDidUpdate:(id)a3
{
  if (![(WDBloodPressureAddDataViewController *)self _systolicAndDiastolicHaveValues])goto LABEL_11; {
  v4 = [(HKManualEntryValidationController *)self->super._validationController supportedQuantityTypes];
  }
  uint64_t v5 = *MEMORY[0x1E4F2A620];
  if ([v4 containsObject:*MEMORY[0x1E4F2A620]])
  {
    v6 = [(HKManualEntryValidationController *)self->super._validationController supportedQuantityTypes];
    uint64_t v7 = *MEMORY[0x1E4F2A618];
    int v8 = [v6 containsObject:*MEMORY[0x1E4F2A618]];

    if (v8)
    {
      v4 = [(HKUnitPreferenceController *)self->super._unitController unitForDisplayType:self->super._displayType];
      int v9 = [(HKDisplayType *)self->super._displayType presentation];
      v10 = [(WDAddDataManualEntryItem *)self->_systolicEntryItem generateValue];
      v26 = [v9 adjustedValueForClientValue:v10];

      v11 = [(HKDisplayType *)self->super._displayType presentation];
      id v12 = [(WDAddDataManualEntryItem *)self->_diastolicEntryItem generateValue];
      v13 = [v11 adjustedValueForClientValue:v12];

      v14 = (void *)MEMORY[0x1E4F2B370];
      [v26 doubleValue];
      v15 = objc_msgSend(v14, "quantityWithUnit:doubleValue:", v4);
      uint64_t v16 = (void *)MEMORY[0x1E4F2B370];
      [v13 doubleValue];
      v17 = objc_msgSend(v16, "quantityWithUnit:doubleValue:", v4);
      validationController = self->super._validationController;
      uint64_t v19 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:v5];
      uint64_t v20 = [(HKManualEntryValidationController *)validationController validateQuantity:v15 ofType:v19];

      v21 = self->super._validationController;
      uint64_t v22 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:v7];
      uint64_t v23 = [(HKManualEntryValidationController *)v21 validateQuantity:v17 ofType:v22];

      BOOL v25 = v20 != 2 && v23 != 2;
      goto LABEL_13;
    }
LABEL_11:
    BOOL v25 = 0;
    goto LABEL_14;
  }
  BOOL v25 = 0;
LABEL_13:

LABEL_14:
  [(WDAddDataViewController *)self setSavingEnabled:v25];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diastolicEntryItem, 0);
  objc_storeStrong((id *)&self->_systolicEntryItem, 0);
  objc_storeStrong((id *)&self->_dateTimeEntryItem, 0);
}

@end