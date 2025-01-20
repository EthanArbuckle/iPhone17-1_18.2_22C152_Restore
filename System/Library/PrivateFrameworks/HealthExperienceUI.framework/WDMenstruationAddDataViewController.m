@interface WDMenstruationAddDataViewController
- (BOOL)useSingleStartAndEndDate;
- (WDMenstruationAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7;
- (id)defaultMetadata;
- (id)manualEntryItemsForSection:(int64_t)a3;
- (id)manualEntrySpinner:(id)a3 titleForRow:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfRowsInManualEntrySpinner:(id)a3;
- (int64_t)numberOfSections;
@end

@implementation WDMenstruationAddDataViewController

- (WDMenstruationAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7
{
  v14.receiver = self;
  v14.super_class = (Class)WDMenstruationAddDataViewController;
  v7 = [(WDCategoryAddDataViewController *)&v14 initWithDisplayType:a3 healthStore:a4 unitController:a5 initialStartDate:a6 dateCache:a7];
  if (v7)
  {
    v8 = [WDAddDataManualEntrySpinner alloc];
    v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v10 = [v9 localizedStringForKey:*MEMORY[0x1E4F2A1A8] value:&stru_1F04402E8 table:@"HealthUI-Localizable"];
    uint64_t v11 = [(WDAddDataManualEntrySpinner *)v8 initWithDisplayName:v10];
    isStartOfCycleEntryItem = v7->_isStartOfCycleEntryItem;
    v7->_isStartOfCycleEntryItem = (WDAddDataManualEntrySpinner *)v11;

    [(WDAddDataManualEntrySpinner *)v7->_isStartOfCycleEntryItem setDataSource:v7];
  }
  return v7;
}

- (id)manualEntryItemsForSection:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 2:
      v3 = [(WDCategoryAddDataViewController *)self dateEntryItem];
      v8 = v3;
      v4 = (void *)MEMORY[0x1E4F1C978];
      v5 = &v8;
      goto LABEL_6;
    case 1:
      isStartOfCycleEntryItem = self->_isStartOfCycleEntryItem;
      v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&isStartOfCycleEntryItem count:1];
      break;
    case 0:
      v3 = [(WDCategoryAddDataViewController *)self categoryValueEntryItem];
      v10[0] = v3;
      v4 = (void *)MEMORY[0x1E4F1C978];
      v5 = (void **)v10;
LABEL_6:
      v6 = objc_msgSend(v4, "arrayWithObjects:count:", v5, 1, v8);

      break;
    default:
      v6 = (void *)MEMORY[0x1E4F1CBF0];
      break;
  }
  return v6;
}

- (int64_t)numberOfSections
{
  return 3;
}

- (id)defaultMetadata
{
  v10.receiver = self;
  v10.super_class = (Class)WDMenstruationAddDataViewController;
  v3 = [(WDAddDataViewController *)&v10 defaultMetadata];
  v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  v5 = (void *)[v3 mutableCopy];

  v6 = [(WDAddDataManualEntrySpinner *)self->_isStartOfCycleEntryItem generateValue];
  uint64_t v7 = [v6 integerValue];

  v8 = [MEMORY[0x1E4F28ED0] numberWithBool:v7 == 1];
  [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F2A1A8]];

  return v5;
}

- (BOOL)useSingleStartAndEndDate
{
  return 1;
}

- (int64_t)numberOfRowsInManualEntrySpinner:(id)a3
{
  return 2;
}

- (id)manualEntrySpinner:(id)a3 titleForRow:(int64_t)a4
{
  v5 = HABundle();
  v6 = v5;
  if (a4 == 1) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_1F04402E8 table:@"AddDataLocalization"];

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    v7.receiver = self;
    v7.super_class = (Class)WDMenstruationAddDataViewController;
    v4 = -[WDMenstruationAddDataViewController tableView:titleForHeaderInSection:](&v7, sel_tableView_titleForHeaderInSection_, a3);
  }
  else
  {
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v4 = [v5 localizedStringForKey:@"MENSTRUAL_FLOW" value:&stru_1F04402E8 table:@"HealthUI-Localizable"];
  }
  return v4;
}

- (void).cxx_destruct
{
}

@end