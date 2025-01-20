@interface WDBloodGlucoseAddDataViewController
- (WDAddDataManualEntrySpinner)mealTimeEntryItem;
- (id)defaultMetadata;
- (id)manualEntryItemsForSection:(int64_t)a3;
- (id)manualEntrySpinner:(id)a3 titleForRow:(int64_t)a4;
- (int64_t)numberOfRowsInManualEntrySpinner:(id)a3;
- (void)setMealTimeEntryItem:(id)a3;
@end

@implementation WDBloodGlucoseAddDataViewController

- (WDAddDataManualEntrySpinner)mealTimeEntryItem
{
  mealTimeEntryItem = self->_mealTimeEntryItem;
  if (!mealTimeEntryItem)
  {
    v4 = [WDAddDataManualEntrySpinner alloc];
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v6 = [v5 localizedStringForKey:*MEMORY[0x1E4F2A0E8] value:&stru_1F04402E8 table:@"HealthUI-Localizable"];
    v7 = [(WDAddDataManualEntrySpinner *)v4 initWithDisplayName:v6];
    v8 = self->_mealTimeEntryItem;
    self->_mealTimeEntryItem = v7;

    [(WDAddDataManualEntrySpinner *)self->_mealTimeEntryItem setDataSource:self];
    mealTimeEntryItem = self->_mealTimeEntryItem;
  }
  return mealTimeEntryItem;
}

- (id)defaultMetadata
{
  v11.receiver = self;
  v11.super_class = (Class)WDBloodGlucoseAddDataViewController;
  v3 = [(WDAddDataViewController *)&v11 defaultMetadata];
  v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  v5 = (void *)[v3 mutableCopy];

  v6 = [(WDBloodGlucoseAddDataViewController *)self mealTimeEntryItem];
  v7 = [v6 generateValue];
  uint64_t v8 = [v7 integerValue];

  if (v8 != *MEMORY[0x1E4F2B9F0])
  {
    v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:v8];
    [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F2A0E8]];
  }
  return v5;
}

- (id)manualEntryItemsForSection:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WDBloodGlucoseAddDataViewController;
  v4 = [(WDDisplayTypeAddDataViewController *)&v9 manualEntryItemsForSection:a3];
  v5 = (void *)[v4 mutableCopy];

  v6 = [(WDBloodGlucoseAddDataViewController *)self mealTimeEntryItem];
  [v5 addObject:v6];

  v7 = [MEMORY[0x1E4F1C978] arrayWithArray:v5];

  return v7;
}

- (int64_t)numberOfRowsInManualEntrySpinner:(id)a3
{
  return 3;
}

- (id)manualEntrySpinner:(id)a3 titleForRow:(int64_t)a4
{
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"MEAL_TIME_%zd", a4);
  v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v6 = [v5 localizedStringForKey:v4 value:&stru_1F04402E8 table:@"HealthUI-Localizable"];

  return v6;
}

- (void)setMealTimeEntryItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end