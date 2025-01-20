@interface HKHeartbeatSequenceListMetadataSection
- (HKDisplayTypeController)displayTypeController;
- (HKHealthStore)healthStore;
- (HKHeartbeatSequenceListMetadataSection)initWithEvent:(id)a3 healthStore:(id)a4 displayTypeController:(id)a5 unitController:(id)a6 delegate:(id)a7;
- (HKHeartbeatSequenceListMetadataSectionDelegate)delegate;
- (HKUnitPreferenceController)unitController;
- (NSArray)sequencesSamples;
- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4;
- (id)sectionTitle;
- (unint64_t)numberOfRowsInSection;
- (void)_startAssociatedSequenceQueryForEvent:(id)a3;
- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5;
- (void)setDelegate:(id)a3;
- (void)setDisplayTypeController:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setSequencesSamples:(id)a3;
- (void)setUnitController:(id)a3;
@end

@implementation HKHeartbeatSequenceListMetadataSection

- (HKHeartbeatSequenceListMetadataSection)initWithEvent:(id)a3 healthStore:(id)a4 displayTypeController:(id)a5 unitController:(id)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)HKHeartbeatSequenceListMetadataSection;
  v17 = [(HKHeartbeatSequenceListMetadataSection *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_delegate, v16);
    objc_storeStrong((id *)&v18->_displayTypeController, a5);
    objc_storeStrong((id *)&v18->_unitController, a6);
    objc_storeStrong((id *)&v18->_healthStore, a4);
    [(HKHeartbeatSequenceListMetadataSection *)v18 _startAssociatedSequenceQueryForEvent:v12];
  }

  return v18;
}

- (void)_startAssociatedSequenceQueryForEvent:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F2B3C0] predicateForSamplesAssociatedWithSample:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F29008]);
  v7 = (void *)[v6 initWithKey:*MEMORY[0x1E4F2A9A0] ascending:1];
  objc_initWeak(&location, self);
  id v8 = objc_alloc(MEMORY[0x1E4F2B440]);
  v9 = [MEMORY[0x1E4F2B498] heartbeatSeriesType];
  v16[0] = v7;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__HKHeartbeatSequenceListMetadataSection__startAssociatedSequenceQueryForEvent___block_invoke;
  v13[3] = &unk_1E6D527E0;
  v13[4] = self;
  objc_copyWeak(&v14, &location);
  v11 = (void *)[v8 initWithSampleType:v9 predicate:v5 limit:0 sortDescriptors:v10 resultsHandler:v13];

  id v12 = [(HKHeartbeatSequenceListMetadataSection *)self healthStore];
  [v12 executeQuery:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __80__HKHeartbeatSequenceListMetadataSection__startAssociatedSequenceQueryForEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setSequencesSamples:v6];
    v10 = [WeakRetained delegate];
    [v10 heartbeatSequecesListQueryComplete:WeakRetained];
  }
  else
  {
    int v11 = objc_msgSend(v7, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    id v12 = (void *)*MEMORY[0x1E4F29F50];
    id v13 = *MEMORY[0x1E4F29F50];
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

- (id)sectionTitle
{
  if ([(HKHeartbeatSequenceListMetadataSection *)self numberOfRowsInSection])
  {
    v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v3 = [v2 localizedStringForKey:@"ATRIAL_FIBRILLATION_ASSOCIATED_SEQUENCE_SECTION_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Antimony"];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (unint64_t)numberOfRowsInSection
{
  v2 = [(HKHeartbeatSequenceListMetadataSection *)self sequencesSamples];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  v5 = [(HKHeartbeatSequenceListMetadataSection *)self sequencesSamples];
  id v6 = [v5 objectAtIndexedSubscript:a3];
  id v7 = [v6 endDate];

  id v8 = HKLocalizedStringForDateAndTemplate(v7, 9);
  v9 = HKLocalizedStringForDateAndTemplate(v7, 27);
  v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"_CellReuseIdentifier"];
  int v11 = [v10 textLabel];
  [v11 setText:v8];

  id v12 = [v10 detailTextLabel];
  [v12 setText:v9];

  [v10 setAccessoryType:1];
  return v10;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v9 = [(HKHeartbeatSequenceListMetadataSection *)self sequencesSamples];
  id v11 = [v9 objectAtIndexedSubscript:a3];

  v10 = [[HKBeatToBeatViewController alloc] initWithHeartbeatSeriesSample:v11 healthStore:self->_healthStore displayTypeController:self->_displayTypeController unitController:self->_unitController];
  [v8 pushViewController:v10 animated:v5];
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

- (HKHeartbeatSequenceListMetadataSectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKHeartbeatSequenceListMetadataSectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)sequencesSamples
{
  return self->_sequencesSamples;
}

- (void)setSequencesSamples:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequencesSamples, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end