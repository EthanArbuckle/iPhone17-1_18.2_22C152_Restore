@interface HROverlayRoomViewController
+ (id)_verticalAxis;
+ (void)determineChartabilityOfOntologyConcept:(id)a3 withApplicationItems:(id)a4 completion:(id)a5;
+ (void)determineChartabilityOfUserConcept:(id)a3 records:(id)a4 withApplicationItems:(id)a5 completion:(id)a6;
- (BOOL)hasChart;
- (BOOL)supportsShowAllFilters;
- (HKConcept)ontologyConcept;
- (HKUserDomainConcept)userConcept;
- (HROverlayRoomViewController)initWithOntologyConcept:(id)a3 configuration:(id)a4 displayDate:(id)a5 masterDataSource:(id)a6 seriesDataSources:(id)a7 outOfRangeDataSource:(id)a8 noRangeDataSource:(id)a9 overlayMode:(int64_t)a10 applicationItems:(id)a11;
- (HROverlayRoomViewController)initWithUserConcept:(id)a3 configuration:(id)a4 displayDate:(id)a5 masterDataSource:(id)a6 seriesDataSources:(id)a7 outOfRangeDataSource:(id)a8 noRangeDataSource:(id)a9 overlayMode:(int64_t)a10 applicationItems:(id)a11;
- (NSArray)displayTypes;
- (NSArray)seriesDataSources;
- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)masterDataSource;
- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)noRangeDataSource;
- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)outOfRangeDataSource;
- (_TtP15HealthRecordsUI31MedicalRecordChartConfiguration_)configuration;
- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)controllerTitleWithApplicationItems:(id)a3;
- (id)createChartOverlayViewController;
- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5;
- (id)initialSelectedContextForMode:(int64_t)a3;
- (id)primaryDisplayTypeWithApplicationItems:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDisplayTypes:(id)a3;
- (void)setMasterDataSource:(id)a3;
- (void)setNoRangeDataSource:(id)a3;
- (void)setOntologyConcept:(id)a3;
- (void)setOutOfRangeDataSource:(id)a3;
- (void)setSeriesDataSources:(id)a3;
- (void)setUserConcept:(id)a3;
@end

@implementation HROverlayRoomViewController

- (HROverlayRoomViewController)initWithOntologyConcept:(id)a3 configuration:(id)a4 displayDate:(id)a5 masterDataSource:(id)a6 seriesDataSources:(id)a7 outOfRangeDataSource:(id)a8 noRangeDataSource:(id)a9 overlayMode:(int64_t)a10 applicationItems:(id)a11
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v32 = a4;
  id obj = a6;
  id v18 = a6;
  id v19 = a7;
  id v31 = a8;
  id v30 = a9;
  v34.receiver = self;
  v34.super_class = (Class)HROverlayRoomViewController;
  v20 = [(HKOverlayRoomViewController *)&v34 initWithDisplayDate:a5 applicationItems:a11 factorDisplayTypes:0 mode:a10];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_ontologyConcept, a3);
    objc_storeStrong((id *)&v21->_configuration, a4);
    objc_storeStrong((id *)&v21->_masterDataSource, obj);
    uint64_t v22 = [v19 copy];
    seriesDataSources = v21->_seriesDataSources;
    v21->_seriesDataSources = (NSArray *)v22;

    objc_storeStrong((id *)&v21->_outOfRangeDataSource, a8);
    objc_storeStrong((id *)&v21->_noRangeDataSource, a9);
    v24 = [(id)objc_opt_class() _verticalAxis];
    v25 = [v18 chartDisplayTypeWithVerticalAxis:v24];
    v35[0] = v25;
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    displayTypes = v21->_displayTypes;
    v21->_displayTypes = (NSArray *)v26;
  }
  return v21;
}

- (HROverlayRoomViewController)initWithUserConcept:(id)a3 configuration:(id)a4 displayDate:(id)a5 masterDataSource:(id)a6 seriesDataSources:(id)a7 outOfRangeDataSource:(id)a8 noRangeDataSource:(id)a9 overlayMode:(int64_t)a10 applicationItems:(id)a11
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v32 = a4;
  id obj = a6;
  id v18 = a6;
  id v19 = a7;
  id v31 = a8;
  id v30 = a9;
  v34.receiver = self;
  v34.super_class = (Class)HROverlayRoomViewController;
  v20 = [(HKOverlayRoomViewController *)&v34 initWithDisplayDate:a5 applicationItems:a11 factorDisplayTypes:0 mode:a10];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_userConcept, a3);
    objc_storeStrong((id *)&v21->_configuration, a4);
    objc_storeStrong((id *)&v21->_masterDataSource, obj);
    uint64_t v22 = [v19 copy];
    seriesDataSources = v21->_seriesDataSources;
    v21->_seriesDataSources = (NSArray *)v22;

    objc_storeStrong((id *)&v21->_outOfRangeDataSource, a8);
    objc_storeStrong((id *)&v21->_noRangeDataSource, a9);
    v24 = [(id)objc_opt_class() _verticalAxis];
    v25 = [v18 chartDisplayTypeWithVerticalAxis:v24];
    v35[0] = v25;
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    displayTypes = v21->_displayTypes;
    v21->_displayTypes = (NSArray *)v26;
  }
  return v21;
}

+ (void)determineChartabilityOfOntologyConcept:(id)a3 withApplicationItems:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 healthStore];
  v11 = [v7 identifier];
  uint64_t v12 = *MEMORY[0x1E4F29900];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __102__HROverlayRoomViewController_determineChartabilityOfOntologyConcept_withApplicationItems_completion___block_invoke;
  v16[3] = &unk_1E644A938;
  id v18 = v8;
  id v19 = v9;
  id v17 = v7;
  id v13 = v8;
  id v14 = v9;
  id v15 = v7;
  [v10 fetchRecordsForConceptId:v11 keyPath:v12 completion:v16];
}

void __102__HROverlayRoomViewController_determineChartabilityOfOntologyConcept_withApplicationItems_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(_TtC15HealthRecordsUI35MedicalRecordChartabilityDeterminer);
  id v5 = a1[4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __102__HROverlayRoomViewController_determineChartabilityOfOntologyConcept_withApplicationItems_completion___block_invoke_2;
  v6[3] = &unk_1E644A910;
  id v9 = a1[6];
  id v7 = a1[4];
  id v8 = a1[5];
  [(MedicalRecordChartabilityDeterminer *)v4 determineChartabilityForConcept:v5 records:v3 completion:v6];
}

void __102__HROverlayRoomViewController_determineChartabilityOfOntologyConcept_withApplicationItems_completion___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __102__HROverlayRoomViewController_determineChartabilityOfOntologyConcept_withApplicationItems_completion___block_invoke_3;
  v5[3] = &unk_1E644A8E8;
  id v6 = v3;
  id v9 = a1[6];
  id v7 = a1[4];
  id v8 = a1[5];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __102__HROverlayRoomViewController_determineChartabilityOfOntologyConcept_withApplicationItems_completion___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = [v2 shouldProduceAtLeastOneOverlay];
    id v4 = [HROverlayRoomViewController alloc];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) configuration];
    id v7 = [*(id *)(a1 + 32) latestChartableDate];
    id v8 = [*(id *)(a1 + 32) masterDataSource];
    id v9 = [*(id *)(a1 + 32) seriesDataSources];
    v10 = [*(id *)(a1 + 32) outOfRangeDataSource];
    v11 = [*(id *)(a1 + 32) noRangeDataSource];
    id v13 = [(HROverlayRoomViewController *)v4 initWithOntologyConcept:v5 configuration:v6 displayDate:v7 masterDataSource:v8 seriesDataSources:v9 outOfRangeDataSource:v10 noRangeDataSource:v11 overlayMode:v3 applicationItems:*(void *)(a1 + 48)];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v12();
  }
}

+ (void)determineChartabilityOfUserConcept:(id)a3 records:(id)a4 withApplicationItems:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = objc_alloc_init(_TtC15HealthRecordsUI35MedicalRecordChartabilityDeterminer);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __106__HROverlayRoomViewController_determineChartabilityOfUserConcept_records_withApplicationItems_completion___block_invoke;
  v17[3] = &unk_1E644A910;
  id v19 = v10;
  id v20 = v11;
  id v18 = v9;
  id v14 = v10;
  id v15 = v9;
  id v16 = v11;
  [(MedicalRecordChartabilityDeterminer *)v13 determineChartabilityForUserConcept:v15 records:v12 completion:v17];
}

void __106__HROverlayRoomViewController_determineChartabilityOfUserConcept_records_withApplicationItems_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __106__HROverlayRoomViewController_determineChartabilityOfUserConcept_records_withApplicationItems_completion___block_invoke_2;
  v5[3] = &unk_1E644A8E8;
  id v6 = v3;
  id v9 = a1[6];
  id v7 = a1[4];
  id v8 = a1[5];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __106__HROverlayRoomViewController_determineChartabilityOfUserConcept_records_withApplicationItems_completion___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = [v2 shouldProduceAtLeastOneOverlay];
    id v4 = [HROverlayRoomViewController alloc];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) configuration];
    id v7 = [*(id *)(a1 + 32) latestChartableDate];
    id v8 = [*(id *)(a1 + 32) masterDataSource];
    id v9 = [*(id *)(a1 + 32) seriesDataSources];
    id v10 = [*(id *)(a1 + 32) outOfRangeDataSource];
    id v11 = [*(id *)(a1 + 32) noRangeDataSource];
    id v13 = [(HROverlayRoomViewController *)v4 initWithUserConcept:v5 configuration:v6 displayDate:v7 masterDataSource:v8 seriesDataSources:v9 outOfRangeDataSource:v10 noRangeDataSource:v11 overlayMode:v3 applicationItems:*(void *)(a1 + 48)];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v12 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v12();
  }
}

- (BOOL)supportsShowAllFilters
{
  if ([(HKOverlayRoomViewController *)self controllerMode] == 3) {
    return 0;
  }
  if ([(NSArray *)self->_seriesDataSources count] > 1) {
    return 1;
  }
  if (!self->_outOfRangeDataSource) {
    return 0;
  }
  return self->_noRangeDataSource != 0;
}

- (id)createChartOverlayViewController
{
  id v3 = objc_alloc((Class)[(MedicalRecordChartConfiguration *)self->_configuration chartControllerClass]);
  displayTypes = self->_displayTypes;
  id v17 = v3;
  id v20 = [(HKOverlayRoomViewController *)self applicationItems];
  id v15 = [v20 healthStore];
  id v19 = [(HKOverlayRoomViewController *)self applicationItems];
  id v4 = [v19 unitController];
  id v18 = [(HKOverlayRoomViewController *)self applicationItems];
  uint64_t v5 = [v18 dateCache];
  id v6 = [(HKOverlayRoomViewController *)self applicationItems];
  id v7 = [v6 chartDataCacheController];
  id v8 = [(HKOverlayRoomViewController *)self applicationItems];
  id v9 = [v8 timeScopeController];
  id v10 = [(HKOverlayRoomViewController *)self applicationItems];
  id v11 = [v10 sampleDateRangeController];
  id v12 = [(HKOverlayRoomViewController *)self displayDate];
  id v13 = (void *)[v17 initWithDisplayTypes:displayTypes healthStore:v15 unitPreferenceController:v4 dateCache:v5 chartDataCacheController:v7 selectedTimeScopeController:v9 sampleTypeDateRangeController:v11 initialXValue:v12 currentCalendarOverride:0 options:1280];

  [v13 addChartViewObserver:v13];
  return v13;
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  id v4 = [(HKConcept *)self->_ontologyConcept localizedPreferredName];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(HROverlayRoomViewController *)self title];
  }
  id v7 = v6;

  return v7;
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  return [(NSArray *)self->_displayTypes firstObject];
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v7 = [(id)objc_opt_class() _verticalAxis];
  if (a3 == 1)
  {
    id v8 = [MEMORY[0x1E4F67C90] chartFilterDefaultForSingle];
    unint64_t v9 = 1;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F67C90] chartFilterDefaultForMultiple];
    unint64_t v9 = -1;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v10 count] < v9 && self->_outOfRangeDataSource)
  {
    id v11 = [_TtC15HealthRecordsUI32MedicalRecordChartOverlayContext alloc];
    id v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v13 = [v12 localizedStringForKey:@"RECORDS_OUT_OF_RANGE" value:&stru_1F1D9FF30 table:@"HealthUI-Localizable"];
    id v14 = [(MedicalRecordChartOverlayContext *)v11 initWithTitle:v13 dataSource:self->_outOfRangeDataSource defaultColors:v8 selectedColors:0 verticalAxis:v7];

    [v10 addObject:v14];
  }
  if ([v10 count] < v9 && self->_noRangeDataSource)
  {
    id v15 = [_TtC15HealthRecordsUI32MedicalRecordChartOverlayContext alloc];
    id v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v17 = [v16 localizedStringForKey:@"RECORDS_NO_RANGE" value:&stru_1F1D9FF30 table:@"HealthUI-Localizable"];
    id v18 = [(MedicalRecordChartOverlayContext *)v15 initWithTitle:v17 dataSource:self->_noRangeDataSource defaultColors:v8 selectedColors:0 verticalAxis:v7];

    [v10 addObject:v18];
  }
  if ([v10 count] < v9 && -[NSArray count](self->_seriesDataSources, "count") >= 2)
  {
    seriesDataSources = self->_seriesDataSources;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __103__HROverlayRoomViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke;
    v27[3] = &unk_1E644A960;
    id v28 = v8;
    id v29 = v7;
    id v20 = [(NSArray *)seriesDataSources hk_map:v27];
    [v10 addObjectsFromArray:v20];
  }
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F67BB8]) initWithSectionTitle:0 overlayContextItems:v10];
  id v22 = objc_alloc(MEMORY[0x1E4F67BC0]);
  id v30 = v21;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v24 = (void *)[v22 initWithContainerTitle:0 overlayContextSections:v23];
  v31[0] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];

  return v25;
}

_TtC15HealthRecordsUI32MedicalRecordChartOverlayContext *__103__HROverlayRoomViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [_TtC15HealthRecordsUI32MedicalRecordChartOverlayContext alloc];
  uint64_t v5 = [v3 displayName];
  id v6 = [(MedicalRecordChartOverlayContext *)v4 initWithTitle:v5 dataSource:v3 defaultColors:*(void *)(a1 + 32) selectedColors:0 verticalAxis:*(void *)(a1 + 40)];

  return v6;
}

- (id)initialSelectedContextForMode:(int64_t)a3
{
  return 0;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithOntologyConcept:self->_ontologyConcept configuration:self->_configuration displayDate:v9 masterDataSource:self->_masterDataSource seriesDataSources:self->_seriesDataSources outOfRangeDataSource:self->_outOfRangeDataSource noRangeDataSource:self->_noRangeDataSource overlayMode:a3 applicationItems:v8];

  return v10;
}

+ (id)_verticalAxis
{
  return (id)[MEMORY[0x1E4F67B80] standardNumericYAxisWithConfigurationOverrides:0];
}

- (BOOL)hasChart
{
  return self->_hasChart;
}

- (HKConcept)ontologyConcept
{
  return self->_ontologyConcept;
}

- (void)setOntologyConcept:(id)a3
{
}

- (HKUserDomainConcept)userConcept
{
  return self->_userConcept;
}

- (void)setUserConcept:(id)a3
{
}

- (_TtP15HealthRecordsUI31MedicalRecordChartConfiguration_)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSArray)displayTypes
{
  return self->_displayTypes;
}

- (void)setDisplayTypes:(id)a3
{
}

- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)masterDataSource
{
  return self->_masterDataSource;
}

- (void)setMasterDataSource:(id)a3
{
}

- (NSArray)seriesDataSources
{
  return self->_seriesDataSources;
}

- (void)setSeriesDataSources:(id)a3
{
}

- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)outOfRangeDataSource
{
  return self->_outOfRangeDataSource;
}

- (void)setOutOfRangeDataSource:(id)a3
{
}

- (_TtC15HealthRecordsUI28MedicalRecordChartDataSource)noRangeDataSource
{
  return self->_noRangeDataSource;
}

- (void)setNoRangeDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noRangeDataSource, 0);
  objc_storeStrong((id *)&self->_outOfRangeDataSource, 0);
  objc_storeStrong((id *)&self->_seriesDataSources, 0);
  objc_storeStrong((id *)&self->_masterDataSource, 0);
  objc_storeStrong((id *)&self->_displayTypes, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_userConcept, 0);
  objc_storeStrong((id *)&self->_ontologyConcept, 0);
}

@end