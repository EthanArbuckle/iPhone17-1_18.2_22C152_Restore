@interface WDElectrocardiogramAddDataViewController
- (WDElectrocardiogramAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7;
- (id)builderFromDataFile:(id)a3 startDate:(id)a4;
- (id)manualEntryItemsForSection:(int64_t)a3;
- (id)symptomSamplesForElectrocardiogram:(id)a3;
- (int64_t)numberOfSections;
- (void)saveHKObjectWithCompletion:(id)a3;
@end

@implementation WDElectrocardiogramAddDataViewController

- (WDElectrocardiogramAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7
{
  v35[7] = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)WDElectrocardiogramAddDataViewController;
  v7 = [(WDAddDataViewController *)&v34 initWithDisplayType:a3 healthStore:a4 unitController:a5 initialStartDate:a6 dateCache:a7];
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
    v33 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v32 = [v33 localizedStringForKey:@"SINUS_RHYTHM" value:&stru_1F04402E8 table:@"HealthUI-Localizable"];
    v35[0] = v32;
    v31 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v30 = [v31 localizedStringForKey:@"HIGH_HEART_RATE" value:&stru_1F04402E8 table:@"HealthUI-Localizable-Cinnamon"];
    v29 = HKConditionallyRedactedHeartRhythmString();
    v35[1] = v29;
    v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v27 = [v28 localizedStringForKey:@"ATRIAL_FIBRILLATION" value:&stru_1F04402E8 table:@"HealthUI-Localizable"];
    v35[2] = v27;
    v26 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v14 = [v26 localizedStringForKey:@"INCONCLUSIVE_LOW_HEART_RATE" value:&stru_1F04402E8 table:@"HealthUI-Localizable"];
    v35[3] = v14;
    v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v16 = [v15 localizedStringForKey:@"INCONCLUSIVE_HIGH_HEART_RATE" value:&stru_1F04402E8 table:@"HealthUI-Localizable"];
    v35[4] = v16;
    v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v18 = [v17 localizedStringForKey:@"INCONCLUSIVE_POOR_RECORDING" value:&stru_1F04402E8 table:@"HealthUI-Localizable-Cinnamon"];
    v19 = HKConditionallyRedactedHeartRhythmString();
    v35[5] = v19;
    v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v21 = [v20 localizedStringForKey:@"INCONCLUSIVE" value:&stru_1F04402E8 table:@"HealthUI-Localizable"];
    v35[6] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:7];

    uint64_t v23 = +[WDAddDataManualEntryItem multiSelectItemWithEntries:v22 selectedIndex:0];
    electrocardiogramClassificationEntryItem = v8->_electrocardiogramClassificationEntryItem;
    v8->_electrocardiogramClassificationEntryItem = (WDAddDataManualEntryItem *)v23;
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
    electrocardiogramClassificationEntryItem = self->_electrocardiogramClassificationEntryItem;
    p_electrocardiogramClassificationEntryItem = &electrocardiogramClassificationEntryItem;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v7[0] = self->_dateEntryItem;
    p_electrocardiogramClassificationEntryItem = (WDAddDataManualEntryItem **)v7;
LABEL_5:
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:p_electrocardiogramClassificationEntryItem count:1];
    goto LABEL_7;
  }
  v4 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_7:
  return v4;
}

- (void)saveHKObjectWithCompletion:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  uint64_t v4 = [(WDAddDataManualEntryItem *)self->_dateEntryItem generateValue];
  v5 = [(WDAddDataManualEntryItem *)self->_electrocardiogramClassificationEntryItem generateValue];
  unint64_t v6 = [v5 integerValue];

  if (v6 > 6)
  {
    v8 = 0;
    uint64_t v9 = 0;
    double v7 = 65.0;
  }
  else
  {
    double v7 = dbl_1AD749458[v6];
    v8 = off_1E5E7CCD8[v6];
    uint64_t v9 = qword_1AD749490[v6];
  }
  v10 = [(WDElectrocardiogramAddDataViewController *)self builderFromDataFile:v8 startDate:v4];
  uint64_t v29 = *MEMORY[0x1E4F2BAF8];
  v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:136];
  v30[0] = v11;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];

  uint64_t v12 = [MEMORY[0x1E4F2B370] _quantityWithBeatsPerMinute:v7];
  [v10 addAverageHeartRate:v12];
  [v10 addClassification:v9];
  v13 = [v10 finishWithDevice:0 metadata:v23];
  v14 = objc_msgSend(MEMORY[0x1E4F1CB18], "hk_heartRhythmDefaults");
  [v14 setObject:&unk_1F0465368 forKey:*MEMORY[0x1E4F29AB0]];

  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v13, 0);
  v16 = [(WDElectrocardiogramAddDataViewController *)self symptomSamplesForElectrocardiogram:v13];
  v17 = objc_msgSend(v16, "hk_map:", &__block_literal_global_1);
  [v13 UUID];
  v19 = v18 = (void *)v4;
  v27 = v19;
  v28 = v17;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];

  [v15 addObjectsFromArray:v16];
  healthStore = self->super._healthStore;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __71__WDElectrocardiogramAddDataViewController_saveHKObjectWithCompletion___block_invoke_2;
  v25[3] = &unk_1E5E7CBB0;
  id v26 = v24;
  id v22 = v24;
  [(HKHealthStore *)healthStore saveObjects:v15 deleteObjects:0 associations:v20 completion:v25];
  [v13 _setSymptomsStatus:2];
}

uint64_t __71__WDElectrocardiogramAddDataViewController_saveHKObjectWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

uint64_t __71__WDElectrocardiogramAddDataViewController_saveHKObjectWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)builderFromDataFile:(id)a3 startDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = HABundle();
  v8 = [v7 URLForResource:v6 withExtension:@"eadf"];

  uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F2AF80]) initWithData:v9];
  v11 = (void *)[v10 newBuilderWithStartDate:v5];

  return v11;
}

- (id)symptomSamplesForElectrocardiogram:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F2ACB0];
  uint64_t v4 = (void *)MEMORY[0x1E4F2ACB8];
  uint64_t v5 = *MEMORY[0x1E4F29850];
  id v6 = a3;
  double v7 = [v4 categoryTypeForIdentifier:v5];
  v8 = [v6 startDate];
  uint64_t v9 = [v6 endDate];
  v10 = [v6 device];
  v11 = [v6 metadata];
  uint64_t v12 = [v3 categorySampleWithType:v7 value:0 startDate:v8 endDate:v9 device:v10 metadata:v11];

  v13 = (void *)MEMORY[0x1E4F2ACB0];
  v14 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F297B0]];
  v15 = [v6 startDate];
  v16 = [v6 endDate];
  v17 = [v6 device];
  v18 = [v6 metadata];

  v19 = [v13 categorySampleWithType:v14 value:0 startDate:v15 endDate:v16 device:v17 metadata:v18];

  v22[0] = v12;
  v22[1] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_electrocardiogramClassificationEntryItem, 0);
  objc_storeStrong((id *)&self->_dateEntryItem, 0);
}

@end