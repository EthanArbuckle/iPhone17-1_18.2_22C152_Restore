@interface HKDataMetadataOxygenSaturationSection
- (HKDataMetadataOxygenSaturationSection)initWithSample:(id)a3 healthStore:(id)a4 displayTypeController:(id)a5 unitController:(id)a6 subsampleDelegate:(id)a7;
- (HKHealthStore)healthStore;
- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4;
- (id)displayNameForSampleType:(id)a3 displayTypeController:(id)a4;
- (id)displayTypeController;
- (id)formattedHeartRateFromSample:(id)a3;
- (id)heartRateFromSample:(id)a3;
- (id)sectionTitle;
- (id)unitController;
- (unint64_t)numberOfRowsInSection;
- (void)queryForData;
- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5;
@end

@implementation HKDataMetadataOxygenSaturationSection

- (HKDataMetadataOxygenSaturationSection)initWithSample:(id)a3 healthStore:(id)a4 displayTypeController:(id)a5 unitController:(id)a6 subsampleDelegate:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HKDataMetadataOxygenSaturationSection;
  v17 = [(HKDataMetadataOxygenSaturationSection *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sample, a3);
    objc_storeStrong((id *)&v18->_healthStore, a4);
    objc_storeStrong((id *)&v18->_displayTypeController, a5);
    objc_storeStrong((id *)&v18->_unitController, a6);
    objc_storeWeak((id *)&v18->_subsampleDelegate, v16);
  }

  return v18;
}

- (id)sectionTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"RELATED_SAMPLES" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (unint64_t)numberOfRowsInSection
{
  return 1;
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  v5 = [a4 dequeueReusableCellWithIdentifier:@"heartRateCell"];
  cell = self->_cell;
  self->_cell = v5;

  if (!self->_cell)
  {
    v7 = [[HKDataMetadataSimpleTableViewCell alloc] initWithReuseIdentifier:@"heartRateCell"];
    v8 = self->_cell;
    self->_cell = v7;
  }
  v9 = [MEMORY[0x1E4F2B448] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
  v10 = [(HKDataMetadataOxygenSaturationSection *)self displayNameForSampleType:v9 displayTypeController:self->_displayTypeController];
  v11 = NSString;
  v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v13 = [v12 localizedStringForKey:@"SUBSAMPLE_TYPE_AVERAGE %@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  id v14 = objc_msgSend(v11, "stringWithFormat:", v13, v10);
  id v15 = [(HKDataMetadataSimpleTableViewCell *)self->_cell subtitleTextLabel];
  [v15 setText:v14];

  if (self->_heartRateSample)
  {
    id v16 = -[HKDataMetadataOxygenSaturationSection formattedHeartRateFromSample:](self, "formattedHeartRateFromSample:");
    v17 = [(HKDataMetadataSimpleTableViewCell *)self->_cell titleTextLabel];
    [v17 setText:v16];

    [(HKDataMetadataSimpleTableViewCell *)self->_cell setAccessoryType:1];
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v19 = [v18 localizedStringForKey:@"NO_AVERAGE_BEATS_PER_MINUTE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Scandium"];
    id v20 = [(HKDataMetadataSimpleTableViewCell *)self->_cell titleTextLabel];
    [v20 setText:v19];

    [(HKDataMetadataSimpleTableViewCell *)self->_cell setAccessoryType:0];
    [(HKDataMetadataOxygenSaturationSection *)self queryForData];
  }
  objc_super v21 = self->_cell;

  return v21;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  if (!a3 && self->_heartRateSample)
  {
    id v14 = v8;
    v9 = [MEMORY[0x1E4F2B448] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
    v10 = [MEMORY[0x1E4F2B3C0] predicateForSamplesAssociatedWithSample:self->_sample];
    v11 = [(HKDataMetadataOxygenSaturationSection *)self displayNameForSampleType:v9 displayTypeController:self->_displayTypeController];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_subsampleDelegate);
    id v13 = [WeakRetained viewControllerForSampleType:v9 subSamplePredicate:v10 title:v11];

    [v14 pushViewController:v13 animated:v5];
    id v8 = v14;
  }
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (id)displayTypeController
{
  return self->_displayTypeController;
}

- (id)unitController
{
  return self->_unitController;
}

- (id)formattedHeartRateFromSample:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F2B448] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
    v6 = [(HKDataMetadataOxygenSaturationSection *)self heartRateFromSample:v4];
    v7 = [(HKDisplayTypeController *)self->_displayTypeController displayTypeForObjectType:v5];
    id v8 = HKFormattedStringFromValue(v6, v7, self->_unitController, 0, 0);
    v9 = [(HKUnitPreferenceController *)self->_unitController localizedDisplayNameForDisplayType:v7 value:v6];
    v10 = HKFormatValueAndUnit(v8, v9);
  }
  else
  {
    BOOL v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v10 = [v5 localizedStringForKey:@"NO_AVERAGE_BEATS_PER_MINUTE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Scandium"];
  }

  return v10;
}

- (void)queryForData
{
  v3 = [MEMORY[0x1E4F2B448] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
  id v4 = [MEMORY[0x1E4F2B3C0] predicateForSamplesAssociatedWithSample:self->_sample];
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F2B440]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__HKDataMetadataOxygenSaturationSection_queryForData__block_invoke;
  v7[3] = &unk_1E6D527E0;
  v7[4] = self;
  objc_copyWeak(&v8, &location);
  v6 = (void *)[v5 initWithSampleType:v3 predicate:v4 limit:1 sortDescriptors:0 resultsHandler:v7];
  [(HKHealthStore *)self->_healthStore executeQuery:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __53__HKDataMetadataOxygenSaturationSection_queryForData__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if ([v8 count])
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __53__HKDataMetadataOxygenSaturationSection_queryForData__block_invoke_306;
      v14[3] = &unk_1E6D527B8;
      objc_copyWeak(&v16, (id *)(a1 + 40));
      id v15 = v8;
      dispatch_async(MEMORY[0x1E4F14428], v14);

      objc_destroyWeak(&v16);
    }
  }
  else
  {
    int v11 = objc_msgSend(v9, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x1E4F29F48];
    id v13 = *MEMORY[0x1E4F29F48];
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __53__HKDataMetadataOxygenSaturationSection_queryForData__block_invoke_cold_1(a1, v12);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __53__HKDataMetadataOxygenSaturationSection_queryForData__block_invoke_cold_2(a1, v12);
    }
  }
}

void __53__HKDataMetadataOxygenSaturationSection_queryForData__block_invoke_306(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
  v3 = (void *)*((void *)WeakRetained + 7);
  *((void *)WeakRetained + 7) = v2;
  id v4 = v2;

  id v5 = [WeakRetained formattedHeartRateFromSample:v4];
  v6 = [*((id *)WeakRetained + 6) titleTextLabel];
  [v6 setText:v5];

  id v7 = [*((id *)WeakRetained + 6) titleTextLabel];
  [v7 sizeToFit];

  [*((id *)WeakRetained + 6) setAccessoryType:1];
}

- (id)displayNameForSampleType:(id)a3 displayTypeController:(id)a4
{
  id v4 = [a4 displayTypeForObjectType:a3];
  id v5 = v4;
  if (v4)
  {
    v6 = [v4 localization];
    id v7 = [v6 displayName];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)heartRateFromSample:(id)a3
{
  v3 = NSNumber;
  id v4 = [a3 quantity];
  id v5 = [MEMORY[0x1E4F2B618] _countPerMinuteUnit];
  [v4 doubleValueForUnit:v5];
  v6 = objc_msgSend(v3, "numberWithDouble:");

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartRateSample, 0);
  objc_storeStrong((id *)&self->_cell, 0);
  objc_destroyWeak((id *)&self->_subsampleDelegate);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_sample, 0);
}

void __53__HKDataMetadataOxygenSaturationSection_queryForData__block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_0_5(v3);
  _os_log_debug_impl(&dword_1E0B26000, v2, OS_LOG_TYPE_DEBUG, "%@ associated sample query returned error: %@", v5, 0x16u);
}

void __53__HKDataMetadataOxygenSaturationSection_queryForData__block_invoke_cold_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_0_5(v3);
  _os_log_error_impl(&dword_1E0B26000, v2, OS_LOG_TYPE_ERROR, "%@ associated sample query returned error: %@", v5, 0x16u);
}

@end