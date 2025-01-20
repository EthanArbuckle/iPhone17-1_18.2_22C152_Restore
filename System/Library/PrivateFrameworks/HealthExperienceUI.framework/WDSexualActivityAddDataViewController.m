@interface WDSexualActivityAddDataViewController
- (WDSexualActivityAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7;
- (id)generateHKObjects;
- (id)manualEntryItemsForSection:(int64_t)a3;
- (int64_t)numberOfSections;
@end

@implementation WDSexualActivityAddDataViewController

- (WDSexualActivityAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7
{
  v25[3] = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)WDSexualActivityAddDataViewController;
  v7 = [(WDAddDataViewController *)&v24 initWithDisplayType:a3 healthStore:a4 unitController:a5 initialStartDate:a6 dateCache:a7];
  v8 = v7;
  if (v7)
  {
    v9 = [(HKDateCache *)v7->super._dateCache oneMinuteBeforeEndOfDayMidnight];
    v10 = HABundle();
    v11 = [v10 localizedStringForKey:@"DATE" value:&stru_1F04402E8 table:@"AddDataLocalization"];
    uint64_t v12 = +[WDAddDataManualEntryItem dateTimeItemWithMaximumDate:v9 displayName:v11];
    dateEntryItem = v8->_dateEntryItem;
    v8->_dateEntryItem = (WDAddDataManualEntryItem *)v12;

    [(WDAddDataManualEntryItem *)v8->_dateEntryItem setDelegate:v8];
    v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v15 = [v14 localizedStringForKey:@"PROTECTION_UNSPECIFIED" value:&stru_1F04402E8 table:@"HealthUI-Localizable"];
    v25[0] = v15;
    v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v17 = [v16 localizedStringForKey:@"PROTECTION_USED" value:&stru_1F04402E8 table:@"HealthUI-Localizable"];
    v25[1] = v17;
    v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v19 = [v18 localizedStringForKey:@"PROTECTION_NOT_USED" value:&stru_1F04402E8 table:@"HealthUI-Localizable"];
    v25[2] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];

    uint64_t v21 = +[WDAddDataManualEntryItem multiSelectItemWithEntries:v20 selectedIndex:0];
    protectionUsedEntryItem = v8->_protectionUsedEntryItem;
    v8->_protectionUsedEntryItem = (WDAddDataManualEntryItem *)v21;
  }
  return v8;
}

- (int64_t)numberOfSections
{
  return 2;
}

- (id)manualEntryItemsForSection:(int64_t)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    protectionUsedEntryItem = self->_protectionUsedEntryItem;
    p_protectionUsedEntryItem = &protectionUsedEntryItem;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v7[0] = self->_dateEntryItem;
    p_protectionUsedEntryItem = (WDAddDataManualEntryItem **)v7;
LABEL_5:
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:p_protectionUsedEntryItem count:1];
    goto LABEL_7;
  }
  v4 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_7:
  return v4;
}

- (id)generateHKObjects
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v3 = [(WDAddDataManualEntryItem *)self->_dateEntryItem generateValue];
  v4 = [(WDAddDataViewController *)self defaultMetadata];
  v5 = v4;
  if (!v4) {
    v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  v6 = (void *)[v4 mutableCopy];

  v7 = [(WDAddDataManualEntryItem *)self->_protectionUsedEntryItem generateValue];
  uint64_t v8 = [v7 integerValue];

  if (v8 == 1)
  {
    uint64_t v9 = MEMORY[0x1E4F1CC38];
  }
  else
  {
    if (v8 != 2) {
      goto LABEL_8;
    }
    uint64_t v9 = MEMORY[0x1E4F1CC28];
  }
  [v6 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F2A1D8]];
LABEL_8:
  v10 = (void *)MEMORY[0x1E4F2ACB0];
  v11 = [(HKDisplayType *)self->super._displayType sampleType];
  uint64_t v12 = [v10 categorySampleWithType:v11 value:0 startDate:v3 endDate:v3 metadata:v6];

  v15[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionUsedEntryItem, 0);
  objc_storeStrong((id *)&self->_dateEntryItem, 0);
}

@end