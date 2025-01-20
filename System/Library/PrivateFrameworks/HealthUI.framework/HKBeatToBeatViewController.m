@interface HKBeatToBeatViewController
- (HKBeatToBeatViewController)initWithHRVSample:(id)a3 healthStore:(id)a4 displayTypeController:(id)a5 unitController:(id)a6;
- (HKBeatToBeatViewController)initWithHeartbeatSeriesSample:(id)a3 healthStore:(id)a4 displayTypeController:(id)a5 unitController:(id)a6;
- (HKDisplayTypeController)displayTypeController;
- (HKHealthStore)healthStore;
- (HKUnitPreferenceController)unitController;
- (NSArray)bpmPoints;
- (id)_displayStringForInstantaneousBPM:(double)a3;
- (id)_displayStringForTime:(double)a3;
- (id)_initWithHealthStore:(id)a3 displayTypeController:(id)a4 unitController:(id)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addHeartbeatSeriesSample:(id)a3;
- (void)setBpmPoints:(id)a3;
- (void)setDisplayTypeController:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setUnitController:(id)a3;
- (void)viewDidLoad;
@end

@implementation HKBeatToBeatViewController

- (id)_initWithHealthStore:(id)a3 displayTypeController:(id)a4 unitController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKBeatToBeatViewController;
  v12 = [(HKTableViewController *)&v17 initWithUsingInsetStyling:1];
  p_isa = (id *)&v12->super.super.super.super.super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_healthStore, a3);
    objc_storeStrong(p_isa + 130, a4);
    objc_storeStrong(p_isa + 131, a5);
    v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v15 = [v14 localizedStringForKey:@"BEAT_TO_BEAT_MEASUREMENTS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [p_isa setTitle:v15];
  }
  return p_isa;
}

- (HKBeatToBeatViewController)initWithHeartbeatSeriesSample:(id)a3 healthStore:(id)a4 displayTypeController:(id)a5 unitController:(id)a6
{
  id v10 = a3;
  id v11 = [(HKBeatToBeatViewController *)self _initWithHealthStore:a4 displayTypeController:a5 unitController:a6];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F2B0F0] instantaneousBPMsForHeartbeatSeriesSample:v10];
    bpmPoints = v11->_bpmPoints;
    v11->_bpmPoints = (NSArray *)v12;
  }
  return v11;
}

- (HKBeatToBeatViewController)initWithHRVSample:(id)a3 healthStore:(id)a4 displayTypeController:(id)a5 unitController:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [(HKBeatToBeatViewController *)self _initWithHealthStore:v11 displayTypeController:a5 unitController:a6];
  v13 = v12;
  if (v12)
  {
    v14 = (void *)MEMORY[0x1E4F2B0F0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __97__HKBeatToBeatViewController_initWithHRVSample_healthStore_displayTypeController_unitController___block_invoke;
    v16[3] = &unk_1E6D537D8;
    objc_super v17 = v12;
    [v14 queryForParentSequenceOfHRV:v10 healthStore:v11 completion:v16];
  }
  return v13;
}

void __97__HKBeatToBeatViewController_initWithHRVSample_healthStore_displayTypeController_unitController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __97__HKBeatToBeatViewController_initWithHRVSample_healthStore_displayTypeController_unitController___block_invoke_290;
    v11[3] = &unk_1E6D513B0;
    id v12 = *(id *)(a1 + 32);
    id v13 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
  else
  {
    int v8 = objc_msgSend(v6, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    id v9 = (void *)*MEMORY[0x1E4F29F48];
    id v10 = *MEMORY[0x1E4F29F48];
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __97__HKBeatToBeatViewController_initWithHRVSample_healthStore_displayTypeController_unitController___block_invoke_cold_1(a1, v9);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __97__HKBeatToBeatViewController_initWithHRVSample_healthStore_displayTypeController_unitController___block_invoke_cold_2(a1, v9);
    }
  }
}

uint64_t __97__HKBeatToBeatViewController_initWithHRVSample_healthStore_displayTypeController_unitController___block_invoke_290(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addHeartbeatSeriesSample:*(void *)(a1 + 40)];
}

- (void)_addHeartbeatSeriesSample:(id)a3
{
  v4 = [MEMORY[0x1E4F2B0F0] instantaneousBPMsForHeartbeatSeriesSample:a3];
  bpmPoints = self->_bpmPoints;
  self->_bpmPoints = v4;

  id v6 = [(HKBeatToBeatViewController *)self tableView];
  [v6 reloadData];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)HKBeatToBeatViewController;
  [(HKTableViewController *)&v4 viewDidLoad];
  v3 = [(HKBeatToBeatViewController *)self tableView];
  [v3 setAllowsSelection:0];
}

- (id)_displayStringForInstantaneousBPM:(double)a3
{
  id v5 = [(HKDisplayTypeController *)self->_displayTypeController displayTypeWithIdentifier:&unk_1F3C209E0];
  id v6 = [NSNumber numberWithDouble:a3];
  v7 = HKFormattedStringFromValueForContext(v6, v5, self->_unitController, 0, 0, 1);

  return v7;
}

- (id)_displayStringForTime:(double)a3
{
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
  objc_super v4 = HKLocalizedStringForDateAndTemplate(v3, 29);

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"CellIdentifier"];
  if (!v7) {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"CellIdentifier"];
  }
  int v8 = -[NSArray objectAtIndexedSubscript:](self->_bpmPoints, "objectAtIndexedSubscript:", [v6 row]);
  [v8 bpm];
  id v9 = -[HKBeatToBeatViewController _displayStringForInstantaneousBPM:](self, "_displayStringForInstantaneousBPM:");
  id v10 = [v7 textLabel];
  [v10 setText:v9];

  [v8 time];
  id v11 = -[HKBeatToBeatViewController _displayStringForTime:](self, "_displayStringForTime:");
  id v12 = [v7 detailTextLabel];
  [v12 setText:v11];

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_bpmPoints count];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  objc_super v4 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithIdentifier:", @"com.apple.HealthUI", a4);
  id v5 = [v4 localizedStringForKey:@"BEATS_PER_MINUTE_NUMBERLESS_UNIT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v5;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (void)setDisplayTypeController:(id)a3
{
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (void)setUnitController:(id)a3
{
}

- (NSArray)bpmPoints
{
  return self->_bpmPoints;
}

- (void)setBpmPoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bpmPoints, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __97__HKBeatToBeatViewController_initWithHRVSample_healthStore_displayTypeController_unitController___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_0_5(v3);
  _os_log_debug_impl(&dword_1E0B26000, v2, OS_LOG_TYPE_DEBUG, "%@ HRV parent sample query returned error: %@", v5, 0x16u);
}

void __97__HKBeatToBeatViewController_initWithHRVSample_healthStore_displayTypeController_unitController___block_invoke_cold_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_0_5(v3);
  _os_log_error_impl(&dword_1E0B26000, v2, OS_LOG_TYPE_ERROR, "%@ HRV parent sample query returned error: %@", v5, 0x16u);
}

@end