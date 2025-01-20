@interface WDDisplayTypeAddDataViewController
- (WDAddDataManualEntryItem)valueFieldManualEntryItem;
- (id)createValueFieldManualEntryItem;
- (id)defaultEditingItem;
- (id)generateHKObjects;
- (id)manualEntryItemsForSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)_setDefaultValuesIfNecessary;
- (void)_updateManualEntryItemWithCurrentBMI:(id)a3;
- (void)manualEntryItemDidUpdate:(id)a3;
- (void)setValueFieldManualEntryItem:(id)a3;
- (void)validateDataWithCompletion:(id)a3;
- (void)viewDidLoad;
@end

@implementation WDDisplayTypeAddDataViewController

- (id)createValueFieldManualEntryItem
{
  v3 = [(HKUnitPreferenceController *)self->super._unitController unitForDisplayType:self->super._displayType];
  v4 = [(HKDisplayType *)self->super._displayType chartingRules];
  v5 = [v4 allowedDecimalPrecisionRuleForUnit:v3];
  uint64_t v6 = [v5 maximumDecimalPrecision];

  v7 = [(HKDisplayType *)self->super._displayType localization];
  v8 = [v7 labelDisplayName];

  if ([(HKDisplayType *)self->super._displayType displayTypeIdentifier] == 15)
  {
    v9 = [(HKDisplayType *)self->super._displayType localization];
    uint64_t v10 = [v9 displayName];

    v11 = [(HKUnitPreferenceController *)self->super._unitController localizedDisplayNameForDisplayType:self->super._displayType];
    v8 = (void *)v10;
  }
  else
  {
    v11 = &stru_1F04402E8;
  }
  if (![v8 length])
  {
    uint64_t v12 = [(HKUnitPreferenceController *)self->super._unitController localizedDisplayNameForDisplayType:self->super._displayType];

    v8 = (void *)v12;
  }
  if (v6) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }
  [(HKDisplayType *)self->super._displayType roundingMode];
  v14 = HKDecimalFormatter();
  v15 = +[WDAddDataManualEntryItem numericItemWithManualEntryType:v13 numberFormatter:v14];

  [v15 setTitle:v8];
  [v15 setSecondaryLabel:v11];

  return v15;
}

- (void)viewDidLoad
{
  v3 = [(HKDateCache *)self->super._dateCache endOfDayMidnight];
  v4 = +[WDAddDataManualEntryItem twoPartDateTimeItemWithMaximumDate:v3];
  dateTimeEntryItem = self->_dateTimeEntryItem;
  self->_dateTimeEntryItem = v4;

  [(WDAddDataManualEntryItem *)self->_dateTimeEntryItem setDelegate:self];
  uint64_t v6 = [(WDDisplayTypeAddDataViewController *)self createValueFieldManualEntryItem];
  valueFieldManualEntryItem = self->_valueFieldManualEntryItem;
  self->_valueFieldManualEntryItem = v6;

  [(WDAddDataManualEntryItem *)self->_valueFieldManualEntryItem setDelegate:self];
  v8.receiver = self;
  v8.super_class = (Class)WDDisplayTypeAddDataViewController;
  [(WDAddDataViewController *)&v8 viewDidLoad];
  [(WDAddDataViewController *)self setSavingEnabled:0];
  [(WDDisplayTypeAddDataViewController *)self _setDefaultValuesIfNecessary];
}

- (void)validateDataWithCompletion:(id)a3
{
  v27 = (void (**)(id, BOOL, void *, uint64_t))a3;
  v4 = [(HKManualEntryValidationController *)self->super._validationController supportedQuantityTypes];
  v5 = [(HKDisplayType *)self->super._displayType objectType];
  uint64_t v6 = [v5 identifier];
  int v7 = [v4 containsObject:v6];

  if (v7)
  {
    objc_super v8 = [(HKUnitPreferenceController *)self->super._unitController unitForDisplayType:self->super._displayType];
    v9 = [(HKDisplayType *)self->super._displayType presentation];
    uint64_t v10 = [(WDAddDataManualEntryItem *)self->_valueFieldManualEntryItem generateValue];
    v11 = [v9 adjustedValueForClientValue:v10];

    uint64_t v12 = (void *)MEMORY[0x1E4F2B370];
    [v11 doubleValue];
    uint64_t v13 = objc_msgSend(v12, "quantityWithUnit:doubleValue:", v8);
    validationController = self->super._validationController;
    v15 = [(HKDisplayType *)self->super._displayType objectType];
    uint64_t v16 = [(HKManualEntryValidationController *)validationController validateQuantity:v13 ofType:v15];

    BOOL v17 = v16 == 1;
    BOOL v18 = v16 != 1;
    if (v17)
    {
      v20 = [(HKDisplayType *)self->super._displayType presentation];
      v21 = [v20 adjustedValueForDaemonValue:v11];

      v22 = [(HKDisplayType *)self->super._displayType hk_valueFormatterForUnit:v8];
      v23 = [v22 stringFromValue:v21 displayType:self->super._displayType unitController:self->super._unitController];

      v24 = NSString;
      v25 = HABundle();
      v26 = [v25 localizedStringForKey:@"OUT_OF_RANGE_ALERT_ONE_ITEM_FORMAT_%@" value:&stru_1F04402E8 table:@"AddDataLocalization"];
      v19 = objc_msgSend(v24, "stringWithFormat:", v26, v23);
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
    BOOL v18 = 1;
  }
  v27[2](v27, v18, v19, 1);
}

- (id)generateHKObjects
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v3 = [(WDAddDataManualEntryItem *)self->_dateTimeEntryItem generateValue];
  v4 = [(WDAddDataViewController *)self defaultMetadata];
  v5 = [(WDAddDataManualEntryItem *)self->_valueFieldManualEntryItem generateValue];
  uint64_t v6 = [(HKDisplayType *)self->super._displayType presentation];
  int v7 = [v6 adjustedValueForClientValue:v5];

  objc_super v8 = [(HKUnitPreferenceController *)self->super._unitController unitForDisplayType:self->super._displayType];
  v9 = (void *)MEMORY[0x1E4F2B370];
  [v7 doubleValue];
  uint64_t v10 = objc_msgSend(v9, "quantityWithUnit:doubleValue:", v8);
  v11 = (void *)MEMORY[0x1E4F2B388];
  uint64_t v12 = [(HKDisplayType *)self->super._displayType sampleType];
  uint64_t v13 = [v11 quantitySampleWithType:v12 quantity:v10 startDate:v3 endDate:v3 metadata:v4];

  v16[0] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];

  return v14;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (id)manualEntryItemsForSection:(int64_t)a3
{
  v6[2] = *MEMORY[0x1E4F143B8];
  valueFieldManualEntryItem = self->_valueFieldManualEntryItem;
  v6[0] = self->_dateTimeEntryItem;
  v6[1] = valueFieldManualEntryItem;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  return v4;
}

- (id)defaultEditingItem
{
  return self->_valueFieldManualEntryItem;
}

- (void)_setDefaultValuesIfNecessary
{
  if (![(HKDisplayType *)self->super._displayType displayTypeIdentifier])
  {
    valueFieldManualEntryItem = self->_valueFieldManualEntryItem;
    [(WDDisplayTypeAddDataViewController *)self _updateManualEntryItemWithCurrentBMI:valueFieldManualEntryItem];
  }
}

- (void)_updateManualEntryItemWithCurrentBMI:(id)a3
{
  id v4 = a3;
  healthStore = self->super._healthStore;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__WDDisplayTypeAddDataViewController__updateManualEntryItemWithCurrentBMI___block_invoke;
  v7[3] = &unk_1E5E7CF68;
  id v8 = v4;
  id v6 = v4;
  [(HKHealthStore *)healthStore calculateBMIWithCompletion:v7];
}

void __75__WDDisplayTypeAddDataViewController__updateManualEntryItemWithCurrentBMI___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __75__WDDisplayTypeAddDataViewController__updateManualEntryItemWithCurrentBMI___block_invoke_2;
    v4[3] = &unk_1E5E7CF40;
    id v5 = *(id *)(a1 + 32);
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

uint64_t __75__WDDisplayTypeAddDataViewController__updateManualEntryItemWithCurrentBMI___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setValue:*(void *)(a1 + 40)];
}

- (void)manualEntryItemDidUpdate:(id)a3
{
  id v17 = [(WDAddDataManualEntryItem *)self->_valueFieldManualEntryItem generateValue];
  if (!v17) {
    goto LABEL_4;
  }
  id v4 = [(HKManualEntryValidationController *)self->super._validationController supportedQuantityTypes];
  id v5 = [(HKDisplayType *)self->super._displayType objectType];
  id v6 = [v5 identifier];
  int v7 = [v4 containsObject:v6];

  if (v7)
  {
    id v8 = [(HKUnitPreferenceController *)self->super._unitController unitForDisplayType:self->super._displayType];
    v9 = [(HKDisplayType *)self->super._displayType presentation];
    uint64_t v10 = [v9 adjustedValueForClientValue:v17];

    v11 = (void *)MEMORY[0x1E4F2B370];
    [v10 doubleValue];
    uint64_t v12 = objc_msgSend(v11, "quantityWithUnit:doubleValue:", v8);
    validationController = self->super._validationController;
    v14 = [(HKDisplayType *)self->super._displayType objectType];
    uint64_t v15 = [(HKManualEntryValidationController *)validationController validateQuantity:v12 ofType:v14];

    BOOL v16 = v15 != 2;
  }
  else
  {
LABEL_4:
    BOOL v16 = 0;
  }
  [(WDAddDataViewController *)self setSavingEnabled:v16];
}

- (WDAddDataManualEntryItem)valueFieldManualEntryItem
{
  return self->_valueFieldManualEntryItem;
}

- (void)setValueFieldManualEntryItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueFieldManualEntryItem, 0);
  objc_storeStrong((id *)&self->_dateTimeEntryItem, 0);
}

@end