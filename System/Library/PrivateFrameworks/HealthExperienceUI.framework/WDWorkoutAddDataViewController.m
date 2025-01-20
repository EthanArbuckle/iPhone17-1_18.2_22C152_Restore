@interface WDWorkoutAddDataViewController
- (BOOL)_isExcludedActivityType:(unint64_t)a3;
- (WDWorkoutAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7;
- (id)_activeEnergyDisplayName;
- (id)_activityTypeDescriptionForIndex:(int64_t)a3;
- (id)_displayTypeForDistanceType:(id)a3;
- (id)_displayTypeForIdentifier:(int64_t)a3;
- (id)_distanceDisplayName;
- (id)_generateSortedActivityTypes;
- (id)_quantityFromEntryItem:(id)a3 unit:(id)a4;
- (id)_sectionsForDistanceType:(id)a3;
- (id)_totalDistance;
- (id)_totalEnergyBurned;
- (id)_unitForDistanceType:(id)a3;
- (id)manualEntryItemsForSection:(int64_t)a3;
- (id)manualEntrySpinner:(id)a3 titleForRow:(int64_t)a4;
- (int64_t)_indexOfActivityType:(unint64_t)a3;
- (int64_t)numberOfRowsInManualEntrySpinner:(id)a3;
- (int64_t)numberOfSections;
- (unint64_t)_activityTypeForIndex:(int64_t)a3;
- (unint64_t)_selectedActivityType;
- (void)_createEntryItems;
- (void)_updateCurrentDistanceTypeWithActivityType:(unint64_t)a3;
- (void)dealloc;
- (void)manualEntryItemDidUpdate:(id)a3;
- (void)saveHKObjectWithCompletion:(id)a3;
- (void)unitPreferencesDidChange:(id)a3;
- (void)validateDataWithCompletion:(id)a3;
@end

@implementation WDWorkoutAddDataViewController

- (WDWorkoutAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)WDWorkoutAddDataViewController;
  v7 = [(WDAddDataViewController *)&v21 initWithDisplayType:a3 healthStore:a4 unitController:a5 initialStartDate:a6 dateCache:a7];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [(WDWorkoutAddDataViewController *)v7 _generateSortedActivityTypes];
    workoutActivityTypePairs = v8->_workoutActivityTypePairs;
    v8->_workoutActivityTypePairs = (NSArray *)v9;

    [(WDWorkoutAddDataViewController *)v8 _createEntryItems];
    v26[0] = v8->_activityTypeEntryItem;
    v26[1] = v8->_activeEnergyEntryItem;
    v26[2] = v8->_distanceEntryItem;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
    v27[0] = v11;
    dateRangeEntryItem = v8->_dateRangeEntryItem;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&dateRangeEntryItem count:1];
    v27[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    sectionsWithDistance = v8->_sectionsWithDistance;
    v8->_sectionsWithDistance = (NSArray *)v13;

    v23[0] = v8->_activityTypeEntryItem;
    v23[1] = v8->_activeEnergyEntryItem;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    v24[0] = v15;
    v22 = v8->_dateRangeEntryItem;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    v24[1] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    sectionsWithoutDistance = v8->_sectionsWithoutDistance;
    v8->_sectionsWithoutDistance = (NSArray *)v17;

    [(WDWorkoutAddDataViewController *)v8 _updateCurrentDistanceTypeWithActivityType:37];
    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v8 selector:sel_unitPreferencesDidChange_ name:*MEMORY[0x1E4F67970] object:0];
  }
  return v8;
}

- (void)_createEntryItems
{
  v3 = [(HKDateCache *)self->super._dateCache oneMinuteBeforeEndOfDayMidnight];
  v4 = +[WDAddDataManualEntryItem twoPartDateRangeItemWithMaximumEndDate:v3];
  dateRangeEntryItem = self->_dateRangeEntryItem;
  self->_dateRangeEntryItem = v4;

  [(WDAddDataManualEntryItem *)self->_dateRangeEntryItem setDelegate:self];
  int64_t v6 = [(WDWorkoutAddDataViewController *)self _indexOfActivityType:37];
  v7 = [WDAddDataManualEntrySpinner alloc];
  v8 = HABundle();
  uint64_t v9 = [v8 localizedStringForKey:@"WORKOUT_ACTIVITY_TYPE" value:&stru_1F04402E8 table:@"AddDataLocalization"];
  v10 = [(WDAddDataManualEntrySpinner *)v7 initWithDisplayName:v9];
  activityTypeEntryItem = self->_activityTypeEntryItem;
  self->_activityTypeEntryItem = v10;

  [(WDAddDataManualEntrySpinner *)self->_activityTypeEntryItem setDataSource:self];
  v12 = self->_activityTypeEntryItem;
  uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithInteger:v6];
  [(WDAddDataManualEntrySpinner *)v12 setValue:v13];

  [(WDAddDataManualEntryItem *)self->_activityTypeEntryItem setDelegate:self];
  id v24 = [MEMORY[0x1E4F67AC0] sharedInstanceForHealthStore:self->super._healthStore];
  v14 = [v24 displayTypeWithIdentifier:&unk_1F0465320];
  [v14 roundingMode];
  v15 = HKDecimalFormatter();
  v16 = +[WDAddDataManualEntryItem numericItemWithManualEntryType:2 numberFormatter:v15];
  activeEnergyEntryItem = self->_activeEnergyEntryItem;
  self->_activeEnergyEntryItem = v16;

  v18 = self->_activeEnergyEntryItem;
  v19 = [(WDWorkoutAddDataViewController *)self _activeEnergyDisplayName];
  [(WDAddDataManualEntryItem *)v18 setTitle:v19];

  [(WDAddDataManualEntryItem *)self->_activeEnergyEntryItem setDelegate:self];
  v20 = [v24 displayTypeWithIdentifier:&unk_1F0465338];
  [v20 roundingMode];
  objc_super v21 = HKDecimalFormatter();
  v22 = +[WDAddDataManualEntryItem numericItemWithManualEntryType:2 numberFormatter:v21];
  distanceEntryItem = self->_distanceEntryItem;
  self->_distanceEntryItem = v22;

  [(WDAddDataManualEntryItem *)self->_distanceEntryItem setTitle:&stru_1F04402E8];
  [(WDAddDataManualEntryItem *)self->_distanceEntryItem setDelegate:self];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WDWorkoutAddDataViewController;
  [(WDWorkoutAddDataViewController *)&v4 dealloc];
}

- (void)unitPreferencesDidChange:(id)a3
{
  distanceEntryItem = self->_distanceEntryItem;
  v5 = [(WDWorkoutAddDataViewController *)self _distanceDisplayName];
  [(WDAddDataManualEntryItem *)distanceEntryItem setTitle:v5];

  activeEnergyEntryItem = self->_activeEnergyEntryItem;
  id v7 = [(WDWorkoutAddDataViewController *)self _activeEnergyDisplayName];
  [(WDAddDataManualEntryItem *)activeEnergyEntryItem setTitle:v7];
}

- (id)_totalDistance
{
  distanceEntryItem = self->_distanceEntryItem;
  objc_super v4 = [(WDWorkoutAddDataViewController *)self _unitForDistanceType:self->_distanceType];
  v5 = [(WDWorkoutAddDataViewController *)self _quantityFromEntryItem:distanceEntryItem unit:v4];

  return v5;
}

- (id)_totalEnergyBurned
{
  v3 = [(WDWorkoutAddDataViewController *)self _displayTypeForIdentifier:10];
  activeEnergyEntryItem = self->_activeEnergyEntryItem;
  v5 = [(HKUnitPreferenceController *)self->super._unitController unitForDisplayType:v3];
  int64_t v6 = [(WDWorkoutAddDataViewController *)self _quantityFromEntryItem:activeEnergyEntryItem unit:v5];

  return v6;
}

- (id)_quantityFromEntryItem:(id)a3 unit:(id)a4
{
  id v5 = a4;
  int64_t v6 = [a3 generateValue];
  id v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E4F2B370];
    [v6 doubleValue];
    uint64_t v9 = objc_msgSend(v8, "quantityWithUnit:doubleValue:", v5);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_displayTypeForIdentifier:(int64_t)a3
{
  objc_super v4 = [MEMORY[0x1E4F67AC0] sharedInstanceForHealthStore:self->super._healthStore];
  id v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  int64_t v6 = [v4 displayTypeWithIdentifier:v5];

  return v6;
}

- (id)_displayTypeForDistanceType:(id)a3
{
  uint64_t v4 = [a3 code];
  if ((unint64_t)(v4 - 83) > 0x37 || ((1 << (v4 - 83)) & 0x80000048000001) == 0) {
    uint64_t v6 = 8;
  }
  else {
    uint64_t v6 = v4;
  }
  id v7 = [(WDWorkoutAddDataViewController *)self _displayTypeForIdentifier:v6];
  return v7;
}

- (id)_unitForDistanceType:(id)a3
{
  uint64_t v4 = [(WDWorkoutAddDataViewController *)self _displayTypeForDistanceType:self->_distanceType];
  id v5 = [(HKUnitPreferenceController *)self->super._unitController unitForDisplayType:v4];

  return v5;
}

- (id)_distanceDisplayName
{
  v3 = [(WDWorkoutAddDataViewController *)self _displayTypeForDistanceType:self->_distanceType];
  if (v3)
  {
    uint64_t v4 = HABundle();
    id v5 = [v4 localizedStringForKey:@"WORKOUT_TOTAL_DISTANCE_WITH_UNIT %@" value:&stru_1F04402E8 table:@"AddDataLocalization"];

    uint64_t v6 = NSString;
    id v7 = [(HKUnitPreferenceController *)self->super._unitController localizedDisplayNameForDisplayType:v3];
    v8 = objc_msgSend(v6, "stringWithFormat:", v5, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_activeEnergyDisplayName
{
  v3 = [(WDWorkoutAddDataViewController *)self _displayTypeForIdentifier:10];
  if (v3)
  {
    uint64_t v4 = [(HKUnitPreferenceController *)self->super._unitController localizedLongDisplayNameForDisplayType:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)validateDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(WDAddDataManualEntryItem *)self->_dateRangeEntryItem generateValue];
  uint64_t v6 = [v5 startDate];
  id v7 = [v5 endDate];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__WDWorkoutAddDataViewController_validateDataWithCompletion___block_invoke;
  v9[3] = &unk_1E5E7CB88;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(WDAddDataViewController *)self validateMaximumAllowedDurationFor:v6 endDate:v7 competion:v9];
}

void __61__WDWorkoutAddDataViewController_validateDataWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v31 = v5;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_22;
  }

  uint64_t v6 = [*(id *)(a1 + 32) _totalDistance];
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(void *)(v7 + 1096)) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || (uint64_t v9 = [*(id *)(v7 + 1064) validateWorkoutDistance:v6], v7 = *(void *)(a1 + 32), v9 != 1))
  {
    int v16 = 0;
    v15 = 0;
  }
  else
  {
    id v10 = [(id)v7 _displayTypeForDistanceType:*(void *)(v7 + 1096)];
    v11 = [*(id *)(a1 + 32) _unitForDistanceType:*(void *)(*(void *)(a1 + 32) + 1096)];
    v12 = (void *)MEMORY[0x1E4F28ED0];
    [v6 doubleValueForUnit:v11];
    uint64_t v13 = objc_msgSend(v12, "numberWithDouble:");
    v14 = objc_msgSend(v10, "hk_valueFormatterForUnit:", v11);
    v15 = [v14 stringFromValue:v13 displayType:v10 unitController:*(void *)(*(void *)(a1 + 32) + 1048)];

    uint64_t v7 = *(void *)(a1 + 32);
    int v16 = 1;
  }
  uint64_t v17 = [(id)v7 _totalEnergyBurned];
  if (!v17)
  {
    if (!v16) {
      goto LABEL_17;
    }
LABEL_15:
    v28 = NSString;
    v26 = HABundle();
    v27 = [v26 localizedStringForKey:@"OUT_OF_RANGE_ALERT_ONE_ITEM_FORMAT_%@" value:&stru_1F04402E8 table:@"AddDataLocalization"];
    objc_msgSend(v28, "stringWithFormat:", v27, v15);
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    v23 = 0;
LABEL_20:

    id v29 = v32;
    goto LABEL_21;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 1064) validateWorkoutEnergyBurned:v17] == 1)
  {
    v18 = [*(id *)(a1 + 32) _displayTypeForIdentifier:10];
    v19 = [*(id *)(*(void *)(a1 + 32) + 1048) unitForDisplayType:v18];
    v20 = (void *)MEMORY[0x1E4F28ED0];
    [v17 doubleValueForUnit:v19];
    objc_super v21 = objc_msgSend(v20, "numberWithDouble:");
    v22 = objc_msgSend(v18, "hk_valueFormatterForUnit:", v19);
    v23 = [v22 stringFromValue:v21 displayType:v18 unitController:*(void *)(*(void *)(a1 + 32) + 1048)];

    id v24 = NSString;
    v25 = HABundle();
    v26 = v25;
    if (v16)
    {
      v27 = [v25 localizedStringForKey:@"OUT_OF_RANGE_ALERT_TWO_ITEMS_FORMAT_%@_%@" value:&stru_1F04402E8 table:@"AddDataLocalization"];
      objc_msgSend(v24, "stringWithFormat:", v27, v15, v23);
    }
    else
    {
      v27 = [v25 localizedStringForKey:@"OUT_OF_RANGE_ALERT_ONE_ITEM_FORMAT_%@" value:&stru_1F04402E8 table:@"AddDataLocalization"];
      objc_msgSend(v24, "stringWithFormat:", v27, v23, v30);
    }
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (v16) {
    goto LABEL_15;
  }
LABEL_17:
  v23 = 0;
  id v29 = 0;
LABEL_21:
  id v31 = v29;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_22:
}

- (void)saveHKObjectWithCompletion:(id)a3
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  unint64_t v4 = [(WDWorkoutAddDataViewController *)self _selectedActivityType];
  id v5 = [(WDWorkoutAddDataViewController *)self _totalEnergyBurned];
  uint64_t v6 = [(WDWorkoutAddDataViewController *)self _totalDistance];
  uint64_t v7 = [(WDAddDataManualEntryItem *)self->_dateRangeEntryItem generateValue];
  BOOL v8 = (void *)MEMORY[0x1E4F2B718];
  uint64_t v9 = [v7 startDate];
  id v10 = [v7 endDate];
  v11 = [(WDAddDataViewController *)self defaultMetadata];
  v12 = v8;
  uint64_t v13 = (void *)v6;
  id v32 = [v12 _workoutWithActivityType:v4 startDate:v9 endDate:v10 workoutEvents:0 totalEnergyBurned:v5 totalDistance:v6 device:0 metadata:v11];

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v5)
  {
    v15 = (void *)MEMORY[0x1E4F2B388];
    int v16 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5C0]];
    uint64_t v17 = [v7 startDate];
    v18 = [v7 endDate];
    v19 = [v15 quantitySampleWithType:v16 quantity:v5 startDate:v17 endDate:v18];

    [v14 addObject:v19];
  }
  v20 = _HKWorkoutDistanceTypeForActivityType();
  objc_super v21 = v13;
  if (v20 && v13)
  {
    v22 = (void *)MEMORY[0x1E4F2B388];
    v23 = _HKWorkoutDistanceTypeForActivityType();
    id v24 = [v7 startDate];
    v25 = [v7 endDate];
    v26 = [v22 quantitySampleWithType:v23 quantity:v13 startDate:v24 endDate:v25];

    objc_super v21 = v13;
    [v14 addObject:v26];
  }
  healthStore = self->super._healthStore;
  v39[0] = v32;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __61__WDWorkoutAddDataViewController_saveHKObjectWithCompletion___block_invoke;
  v34[3] = &unk_1E5E7CBD8;
  id v35 = v14;
  v36 = self;
  id v37 = v32;
  id v38 = v33;
  id v29 = v33;
  id v30 = v32;
  id v31 = v14;
  [(HKHealthStore *)healthStore saveObjects:v28 withCompletion:v34];
}

void __61__WDWorkoutAddDataViewController_saveHKObjectWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2 && [*(id *)(a1 + 32) count])
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(*(void *)(a1 + 40) + 1040);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__WDWorkoutAddDataViewController_saveHKObjectWithCompletion___block_invoke_2;
    v9[3] = &unk_1E5E7CBB0;
    uint64_t v8 = *(void *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    [v7 addSamples:v6 toWorkout:v8 completion:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __61__WDWorkoutAddDataViewController_saveHKObjectWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)numberOfSections
{
  v2 = [(WDWorkoutAddDataViewController *)self _sectionsForDistanceType:self->_distanceType];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)manualEntryItemsForSection:(int64_t)a3
{
  unint64_t v4 = [(WDWorkoutAddDataViewController *)self _sectionsForDistanceType:self->_distanceType];
  id v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (id)_generateSortedActivityTypes
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v4 = *MEMORY[0x1E4F2BC50];
  for (unint64_t i = *MEMORY[0x1E4F2BC58]; v4 <= i; ++v4)
  {
    if (_HKWorkoutActivityTypeIsValid()
      && (_HKWorkoutActivityTypeIsDeprecated() & 1) == 0
      && ![(WDWorkoutAddDataViewController *)self _isExcludedActivityType:v4])
    {
      uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v4];
      v13[0] = v6;
      uint64_t v7 = HKUILocalizedWorkoutTypeName();
      v13[1] = v7;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
      [v3 addObject:v8];
    }
  }
  [v3 sortUsingComparator:&__block_literal_global_0];
  v12[0] = &unk_1F0465350;
  uint64_t v9 = HKUILocalizedWorkoutTypeName();
  v12[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  [v3 addObject:v10];

  return v3;
}

uint64_t __62__WDWorkoutAddDataViewController__generateSortedActivityTypes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 objectAtIndexedSubscript:1];
  uint64_t v6 = [v4 objectAtIndexedSubscript:1];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (BOOL)_isExcludedActivityType:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 82;
}

- (int64_t)_indexOfActivityType:(unint64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = -1;
  workoutActivityTypePairs = self->_workoutActivityTypePairs;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__WDWorkoutAddDataViewController__indexOfActivityType___block_invoke;
  v6[3] = &unk_1E5E7CC20;
  v6[4] = &v7;
  v6[5] = a3;
  [(NSArray *)workoutActivityTypePairs enumerateObjectsUsingBlock:v6];
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __55__WDWorkoutAddDataViewController__indexOfActivityType___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 objectAtIndexedSubscript:0];
  uint64_t v8 = [v7 integerValue];
  uint64_t v9 = *(void *)(a1 + 40);

  if (v8 == v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (id)_activityTypeDescriptionForIndex:(int64_t)a3
{
  id v3 = [(NSArray *)self->_workoutActivityTypePairs objectAtIndexedSubscript:a3];
  int64_t v4 = [v3 objectAtIndexedSubscript:1];

  return v4;
}

- (unint64_t)_activityTypeForIndex:(int64_t)a3
{
  id v3 = [(NSArray *)self->_workoutActivityTypePairs objectAtIndexedSubscript:a3];
  int64_t v4 = [v3 objectAtIndexedSubscript:0];
  unint64_t v5 = [v4 integerValue];

  return v5;
}

- (unint64_t)_selectedActivityType
{
  id v3 = [(WDAddDataManualEntrySpinner *)self->_activityTypeEntryItem generateValue];
  int64_t v4 = v3;
  if (v3) {
    unint64_t v5 = -[WDWorkoutAddDataViewController _activityTypeForIndex:](self, "_activityTypeForIndex:", [v3 integerValue]);
  }
  else {
    unint64_t v5 = 37;
  }

  return v5;
}

- (id)_sectionsForDistanceType:(id)a3
{
  id v3 = &OBJC_IVAR___WDWorkoutAddDataViewController__sectionsWithDistance;
  if (!a3) {
    id v3 = &OBJC_IVAR___WDWorkoutAddDataViewController__sectionsWithoutDistance;
  }
  return *(id *)((char *)&self->super.super.super.super.super.super.isa + *v3);
}

- (void)_updateCurrentDistanceTypeWithActivityType:(unint64_t)a3
{
  _HKWorkoutDistanceTypeForActivityType();
  int64_t v4 = (HKQuantityType *)objc_claimAutoreleasedReturnValue();
  if (v4 != self->_distanceType)
  {
    obj = v4;
    if ((-[HKQuantityType isEqual:](v4, "isEqual:") & 1) == 0)
    {
      objc_storeStrong((id *)&self->_distanceType, obj);
      distanceEntryItem = self->_distanceEntryItem;
      uint64_t v6 = [(WDWorkoutAddDataViewController *)self _distanceDisplayName];
      [(WDAddDataManualEntryItem *)distanceEntryItem setTitle:v6];

      [(WDAddDataViewController *)self reloadManualEntryItemsAndReloadTableView:[(WDWorkoutAddDataViewController *)self isViewLoaded]];
    }
  }
  MEMORY[0x1F41817F8]();
}

- (int64_t)numberOfRowsInManualEntrySpinner:(id)a3
{
  return [(NSArray *)self->_workoutActivityTypePairs count];
}

- (id)manualEntrySpinner:(id)a3 titleForRow:(int64_t)a4
{
  return [(WDWorkoutAddDataViewController *)self _activityTypeDescriptionForIndex:a4];
}

- (void)manualEntryItemDidUpdate:(id)a3
{
  v18 = (WDAddDataManualEntrySpinner *)a3;
  if (self->_activityTypeEntryItem == v18) {
    [(WDWorkoutAddDataViewController *)self _updateCurrentDistanceTypeWithActivityType:[(WDWorkoutAddDataViewController *)self _selectedActivityType]];
  }
  int64_t v4 = [(WDWorkoutAddDataViewController *)self _totalEnergyBurned];
  if (v4) {
    BOOL v5 = [(HKManualEntryValidationController *)self->super._validationController validateWorkoutEnergyBurned:v4] != 2;
  }
  else {
    BOOL v5 = 1;
  }
  uint64_t v6 = [(WDWorkoutAddDataViewController *)self _totalDistance];
  uint64_t v7 = (void *)v6;
  if (self->_distanceType) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8
    && [(HKManualEntryValidationController *)self->super._validationController validateWorkoutDistance:v6] == 2)
  {
    BOOL v5 = 0;
  }
  uint64_t v9 = [(WDAddDataManualEntryItem *)self->_dateRangeEntryItem generateValue];
  uint64_t v10 = [v9 endDate];
  v11 = [v9 startDate];
  [v10 timeIntervalSinceDate:v11];
  double v13 = v12;

  validationController = self->super._validationController;
  v15 = [(HKDisplayType *)self->super._displayType sampleType];
  uint64_t v16 = [(HKManualEntryValidationController *)validationController validateMinimumAllowedDuration:v15 ofType:v13];

  BOOL v17 = v16 != 2 && v5;
  [(WDAddDataViewController *)self setSavingEnabled:v17];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRangeEntryItem, 0);
  objc_storeStrong((id *)&self->_activeEnergyEntryItem, 0);
  objc_storeStrong((id *)&self->_distanceEntryItem, 0);
  objc_storeStrong((id *)&self->_activityTypeEntryItem, 0);
  objc_storeStrong((id *)&self->_sectionsWithoutDistance, 0);
  objc_storeStrong((id *)&self->_sectionsWithDistance, 0);
  objc_storeStrong((id *)&self->_distanceType, 0);
  objc_storeStrong((id *)&self->_workoutActivityTypePairs, 0);
}

@end