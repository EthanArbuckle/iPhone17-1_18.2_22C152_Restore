@interface WDInsulinDeliveryAddDataViewController
- (WDAddDataManualEntryItem)dateTimeEntryItem;
- (WDAddDataManualEntrySpinner)deliveryReasonEntryItem;
- (id)defaultMetadata;
- (id)generateHKObjects;
- (id)manualEntryItemsForSection:(int64_t)a3;
- (id)manualEntrySpinner:(id)a3 titleForRow:(int64_t)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)numberOfRowsInManualEntrySpinner:(id)a3;
- (int64_t)numberOfSections;
- (void)manualEntryItemDidUpdate:(id)a3;
- (void)setDateTimeEntryItem:(id)a3;
- (void)setDeliveryReasonEntryItem:(id)a3;
- (void)validateDataWithCompletion:(id)a3;
@end

@implementation WDInsulinDeliveryAddDataViewController

- (WDAddDataManualEntryItem)dateTimeEntryItem
{
  dateTimeEntryItem = self->_dateTimeEntryItem;
  if (!dateTimeEntryItem)
  {
    v4 = [(HKDateCache *)self->super.super._dateCache endOfDayMidnight];
    v5 = +[WDAddDataManualEntryItem twoPartDateRangeItemWithMaximumEndDate:v4];
    v6 = self->_dateTimeEntryItem;
    self->_dateTimeEntryItem = v5;

    [(WDAddDataManualEntryItem *)self->_dateTimeEntryItem setDelegate:self];
    dateTimeEntryItem = self->_dateTimeEntryItem;
  }
  return dateTimeEntryItem;
}

- (WDAddDataManualEntrySpinner)deliveryReasonEntryItem
{
  deliveryReasonEntryItem = self->_deliveryReasonEntryItem;
  if (!deliveryReasonEntryItem)
  {
    v4 = [WDAddDataManualEntrySpinner alloc];
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v6 = [v5 localizedStringForKey:*MEMORY[0x1E4F2A180] value:&stru_1F04402E8 table:@"HealthUI-Localizable"];
    v7 = [(WDAddDataManualEntrySpinner *)v4 initWithDisplayName:v6];
    v8 = self->_deliveryReasonEntryItem;
    self->_deliveryReasonEntryItem = v7;

    [(WDAddDataManualEntrySpinner *)self->_deliveryReasonEntryItem setDataSource:self];
    [(WDAddDataManualEntrySpinner *)self->_deliveryReasonEntryItem set_wd_deliveryReason:2];
    deliveryReasonEntryItem = self->_deliveryReasonEntryItem;
  }
  return deliveryReasonEntryItem;
}

- (id)defaultMetadata
{
  v10.receiver = self;
  v10.super_class = (Class)WDInsulinDeliveryAddDataViewController;
  v3 = [(WDAddDataViewController *)&v10 defaultMetadata];
  v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  v5 = (void *)[v3 mutableCopy];

  v6 = (void *)MEMORY[0x1E4F28ED0];
  v7 = [(WDInsulinDeliveryAddDataViewController *)self deliveryReasonEntryItem];
  v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "_wd_deliveryReason"));
  [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F2A180]];

  return v5;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (id)manualEntryItemsForSection:(int64_t)a3
{
  v9[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v5 = [(WDInsulinDeliveryAddDataViewController *)self dateTimeEntryItem];
    v6 = [(WDDisplayTypeAddDataViewController *)self valueFieldManualEntryItem];
    v9[1] = v6;
    v7 = [(WDInsulinDeliveryAddDataViewController *)self deliveryReasonEntryItem];
    v9[2] = v7;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  }
  return v3;
}

- (id)generateHKObjects
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v3 = [(WDInsulinDeliveryAddDataViewController *)self dateTimeEntryItem];
  v4 = [v3 generateValue];

  v5 = [(WDInsulinDeliveryAddDataViewController *)self defaultMetadata];
  v6 = [(WDDisplayTypeAddDataViewController *)self valueFieldManualEntryItem];
  v7 = [v6 generateValue];

  v8 = [(HKDisplayType *)self->super.super._displayType presentation];
  v9 = [v8 adjustedValueForClientValue:v7];

  objc_super v10 = [(HKUnitPreferenceController *)self->super.super._unitController unitForDisplayType:self->super.super._displayType];
  v11 = (void *)MEMORY[0x1E4F2B370];
  [v9 doubleValue];
  v12 = objc_msgSend(v11, "quantityWithUnit:doubleValue:", v10);
  v13 = (void *)MEMORY[0x1E4F2B388];
  v14 = [(HKDisplayType *)self->super.super._displayType sampleType];
  v15 = [v4 startDate];
  v16 = [v4 endDate];
  v17 = [v13 quantitySampleWithType:v14 quantity:v12 startDate:v15 endDate:v16 metadata:v5];

  v20[0] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];

  return v18;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v5 = HABundle();
    v4 = [v5 localizedStringForKey:@"INSULIN_DELIVERY_REASON_HELP_TEXT" value:&stru_1F04402E8 table:@"AddDataLocalization"];
  }
  return v4;
}

- (int64_t)numberOfRowsInManualEntrySpinner:(id)a3
{
  return 2;
}

- (id)manualEntrySpinner:(id)a3 titleForRow:(int64_t)a4
{
  return (id)MEMORY[0x1F4121670](a4 + 1, a2, a3);
}

- (void)manualEntryItemDidUpdate:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)WDInsulinDeliveryAddDataViewController;
  [(WDDisplayTypeAddDataViewController *)&v13 manualEntryItemDidUpdate:a3];
  v4 = [(WDInsulinDeliveryAddDataViewController *)self dateTimeEntryItem];
  v5 = [v4 generateValue];

  v6 = [v5 endDate];
  v7 = [v5 startDate];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  validationController = self->super.super._validationController;
  v11 = [(HKDisplayType *)self->super.super._displayType sampleType];
  BOOL v12 = [(HKManualEntryValidationController *)validationController validateMinimumAllowedDuration:v11 ofType:v9] != 2;

  [(WDAddDataViewController *)self setSavingEnabled:v12];
}

- (void)validateDataWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(WDInsulinDeliveryAddDataViewController *)self dateTimeEntryItem];
  v6 = [v5 generateValue];

  objc_initWeak(&location, self);
  v7 = [v6 startDate];
  double v8 = [v6 endDate];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__WDInsulinDeliveryAddDataViewController_validateDataWithCompletion___block_invoke;
  v10[3] = &unk_1E5E7CF18;
  objc_copyWeak(&v12, &location);
  id v9 = v4;
  v10[4] = self;
  id v11 = v9;
  [(WDAddDataViewController *)self validateMaximumAllowedDurationFor:v7 endDate:v8 competion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __69__WDInsulinDeliveryAddDataViewController_validateDataWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a2)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      v8.receiver = *(id *)(a1 + 32);
      v8.super_class = (Class)WDInsulinDeliveryAddDataViewController;
      objc_msgSendSuper2(&v8, sel_validateDataWithCompletion_, v7);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (void)setDateTimeEntryItem:(id)a3
{
}

- (void)setDeliveryReasonEntryItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryReasonEntryItem, 0);
  objc_storeStrong((id *)&self->_dateTimeEntryItem, 0);
}

@end