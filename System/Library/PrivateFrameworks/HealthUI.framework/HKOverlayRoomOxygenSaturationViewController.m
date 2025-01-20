@interface HKOverlayRoomOxygenSaturationViewController
+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11;
- (HKOverlayRoomOxygenSaturationViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 preferredOverlay:(int64_t)a6 trendModel:(id)a7 factorDisplayTypes:(id)a8;
- (NSMutableArray)contextDelegates;
- (UITapGestureRecognizer)overrideOnboardingRecognizer;
- (id)_buildAverageDataSourceWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5;
- (id)_buildGranularAverageDataSourceTitleFromTimeScope;
- (id)_configureContextSectionsForFullMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)_configureContextSectionsForSingleOverlayMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)_createOverrideOnboardingGestureRecognizer;
- (id)_makeAverageContextForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5 contextDelegate:(id *)a6;
- (id)_makeLatestContextForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)_makePressureOverlayContextForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5 context:(unint64_t)a6 contextDelegate:(id *)a7;
- (id)_makeRangeContextForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)_makeSleepContextForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)controllerTitleWithApplicationItems:(id)a3;
- (id)createChartOverlayViewController;
- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5;
- (id)getChartSummaryTrendModelToModify;
- (id)preferredInitialOverlayIndex;
- (id)primaryDisplayTypeWithApplicationItems:(id)a3;
- (int64_t)preferredOverlay;
- (void)_installOverrideOnboardingGestureRecognizer;
- (void)_overrideOnboardingAction:(id)a3;
- (void)_uninstallOverrideOnboardingGestureRecognizer;
- (void)setContextDelegates:(id)a3;
- (void)setOverrideOnboardingRecognizer:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HKOverlayRoomOxygenSaturationViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a6;
  id v20 = a5;
  v21 = (void *)[objc_alloc((Class)a1) initWithDisplayDate:v19 applicationItems:v20 mode:1 preferredOverlay:a7 trendModel:v17 factorDisplayTypes:v16];

  [v21 setRestorationUserActivity:v18];
  [v21 setAdditionalChartOptions:a11];
  return v21;
}

- (HKOverlayRoomOxygenSaturationViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 preferredOverlay:(int64_t)a6 trendModel:(id)a7 factorDisplayTypes:(id)a8
{
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  id v17 = a4;
  uint64_t v18 = +[HKOverlayRoomTrendContext findInitialDateFromTrendModel:v15];
  id v19 = (void *)v18;
  if (v18) {
    id v20 = (void *)v18;
  }
  else {
    id v20 = v14;
  }
  id v21 = v20;

  v30.receiver = self;
  v30.super_class = (Class)HKOverlayRoomOxygenSaturationViewController;
  v22 = [(HKOverlayRoomViewController *)&v30 initWithDisplayDate:v21 applicationItems:v17 factorDisplayTypes:v16 mode:a5];

  if (v22)
  {
    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    contextDelegates = v22->_contextDelegates;
    v22->_contextDelegates = v23;

    v22->_preferredOverlay = a6;
    preferredOverlayIndex = v22->_preferredOverlayIndex;
    v22->_preferredOverlayIndex = 0;

    objc_storeStrong((id *)&v22->_trendModel, a7);
    if (a5 == 3)
    {
      uint64_t v26 = 0;
    }
    else
    {
      unsigned int v27 = [v15 selectTrendInitially];
      if (a5) {
        BOOL v28 = a6 == 0;
      }
      else {
        BOOL v28 = 1;
      }
      if (v28) {
        uint64_t v26 = v27;
      }
      else {
        uint64_t v26 = 1;
      }
    }
    [(HKOverlayRoomViewController *)v22 setShouldSelectInitialOverlay:v26];
  }

  return v22;
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  v3 = HKHealthKitFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"OXYGEN_SATURATION" value:&stru_1F3B9CF20 table:*MEMORY[0x1E4F29E40]];

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKOverlayRoomOxygenSaturationViewController;
  [(HKOverlayRoomOxygenSaturationViewController *)&v4 viewWillAppear:a3];
  if ([MEMORY[0x1E4F2B860] isAppleInternalInstall]) {
    [(HKOverlayRoomOxygenSaturationViewController *)self _installOverrideOnboardingGestureRecognizer];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([MEMORY[0x1E4F2B860] isAppleInternalInstall]) {
    [(HKOverlayRoomOxygenSaturationViewController *)self _uninstallOverrideOnboardingGestureRecognizer];
  }
  v5.receiver = self;
  v5.super_class = (Class)HKOverlayRoomOxygenSaturationViewController;
  [(HKOverlayRoomOxygenSaturationViewController *)&v5 viewWillDisappear:v3];
}

- (void)_installOverrideOnboardingGestureRecognizer
{
  BOOL v3 = [(HKOverlayRoomOxygenSaturationViewController *)self _createOverrideOnboardingGestureRecognizer];
  [(HKOverlayRoomOxygenSaturationViewController *)self setOverrideOnboardingRecognizer:v3];

  id v6 = [(HKOverlayRoomOxygenSaturationViewController *)self navigationController];
  objc_super v4 = [v6 navigationBar];
  objc_super v5 = [(HKOverlayRoomOxygenSaturationViewController *)self overrideOnboardingRecognizer];
  [v4 addGestureRecognizer:v5];
}

- (void)_uninstallOverrideOnboardingGestureRecognizer
{
  BOOL v3 = [(HKOverlayRoomOxygenSaturationViewController *)self navigationController];
  objc_super v4 = [v3 navigationBar];
  objc_super v5 = [(HKOverlayRoomOxygenSaturationViewController *)self overrideOnboardingRecognizer];
  [v4 removeGestureRecognizer:v5];

  [(HKOverlayRoomOxygenSaturationViewController *)self setOverrideOnboardingRecognizer:0];
}

- (id)_createOverrideOnboardingGestureRecognizer
{
  v2 = [[_HKOxygenSaturationOverrideTapGestureRecognizer alloc] initWithTarget:self action:sel__overrideOnboardingAction_];
  return v2;
}

- (void)_overrideOnboardingAction:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  objc_super v4 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A868]];
  objc_super v5 = [HKFeatureAvailabilityInternalSettingsConfiguration alloc];
  uint64_t v6 = *MEMORY[0x1E4F29DA0];
  uint64_t v7 = *MEMORY[0x1E4F2A998];
  v14[0] = v4;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v9 = [(HKFeatureAvailabilityInternalSettingsConfiguration *)v5 initWithFeatureIdentifier:v6 userDefaultsDomain:v7 userDefaultsFeatureEnabledKey:@"HKRPBloodOxygenSaturationEnabled" userDefaultsDisabledOverrideKey:@"OverrideIsRemoteDisabled" options:15 samplesTypesToDelete:v8];

  v10 = [HKFeatureAvailabilityInternalSettingsViewController alloc];
  v11 = [(HKOverlayRoomViewController *)self applicationItems];
  v12 = [v11 healthStore];
  v13 = [(HKFeatureAvailabilityInternalSettingsViewController *)v10 initWithHealthStore:v12 configuration:v9];

  [(HKOverlayRoomOxygenSaturationViewController *)self showViewController:v13 sender:self];
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F2B2C0];
  uint64_t v4 = *MEMORY[0x1E4F2A868];
  id v5 = a3;
  uint64_t v6 = [v3 quantityTypeForIdentifier:v4];
  uint64_t v7 = [v5 displayTypeController];

  v8 = [v7 displayTypeForObjectType:v6];

  return v8;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if ((unint64_t)(a3 - 1) < 2)
  {
    v10 = [HKOverlayContextSectionContainer alloc];
    v11 = [(HKOverlayRoomOxygenSaturationViewController *)self _configureContextSectionsForSingleOverlayMode:a3 applicationItems:v8 overlayChartController:v9];
    v12 = [(HKOverlayContextSectionContainer *)v10 initWithContainerTitle:0 overlayContextSections:v11];
    v18[0] = v12;
    v13 = (HKOverlayContextSectionContainer **)v18;
LABEL_5:
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

    goto LABEL_7;
  }
  if (a3 == 3)
  {
    id v14 = [HKOverlayContextSectionContainer alloc];
    v11 = [(HKOverlayRoomOxygenSaturationViewController *)self _configureContextSectionsForFullMode:3 applicationItems:v8 overlayChartController:v9];
    v12 = [(HKOverlayContextSectionContainer *)v14 initWithContainerTitle:0 overlayContextSections:v11];
    id v17 = v12;
    v13 = &v17;
    goto LABEL_5;
  }
  id v15 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_7:

  return v15;
}

- (id)preferredInitialOverlayIndex
{
  return self->_preferredOverlayIndex;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [HKOverlayRoomOxygenSaturationViewController alloc];
  int64_t v11 = [(HKOverlayRoomOxygenSaturationViewController *)self preferredOverlay];
  trendModel = self->_trendModel;
  v13 = [(HKOverlayRoomViewController *)self factorDisplayTypes];
  id v14 = [(HKOverlayRoomOxygenSaturationViewController *)v10 initWithDisplayDate:v9 applicationItems:v8 mode:a3 preferredOverlay:v11 trendModel:trendModel factorDisplayTypes:v13];

  [(HKOverlayRoomViewController *)v14 setAdditionalChartOptions:[(HKOverlayRoomViewController *)self filteredInteractiveChartOptionsForMode:a3]];
  return v14;
}

- (id)createChartOverlayViewController
{
  if ([(HKOverlayRoomViewController *)self controllerMode] != 3)
  {
    int64_t v3 = +[HKOverlayRoomTrendContext findStartingTimeScopeFromTrendModel:self->_trendModel];
    if (v3 != 8)
    {
      int64_t v4 = v3;
      id v5 = [(HKOverlayRoomViewController *)self applicationItems];
      uint64_t v6 = [v5 timeScopeController];
      [v6 setSelectedTimeScope:v4];
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)HKOverlayRoomOxygenSaturationViewController;
  uint64_t v7 = [(HKOverlayRoomViewController *)&v9 createChartOverlayViewController];
  return v7;
}

- (id)getChartSummaryTrendModelToModify
{
  return self->_trendModel;
}

- (id)_configureContextSectionsForSingleOverlayMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [(HKOverlayRoomOxygenSaturationViewController *)self _makeLatestContextForMode:a3 applicationItems:v8 overlayChartController:v9];
  preferredOverlayIndex = self->_preferredOverlayIndex;
  self->_preferredOverlayIndex = (NSNumber *)&unk_1F3C20608;

  trendModel = self->_trendModel;
  if (trendModel && [(HKChartSummaryTrendModel *)trendModel selectTrendInitially])
  {
    v13 = [(HKOverlayRoomOxygenSaturationViewController *)self primaryDisplayTypeWithApplicationItems:v8];
    id v14 = [[HKOverlayRoomTrendContext alloc] initWithBaseDisplayType:v13 trendModel:self->_trendModel overlayChartController:v9 applicationItems:v8 overlayMode:a3];
    id v15 = [(HKOverlayRoomViewController *)self chartController];
    [v15 setTrendAccessibilityDelegate:v14];

    v10 = v14;
  }
  id v16 = [HKOverlayContextSection alloc];
  v22[0] = v10;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  uint64_t v18 = [(HKOverlayContextSection *)v16 initWithSectionTitle:0 overlayContextItems:v17];

  id v21 = v18;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];

  return v19;
}

- (id)_configureContextSectionsForFullMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int64_t v11 = [(HKOverlayRoomOxygenSaturationViewController *)self _makeLatestContextForMode:a3 applicationItems:v8 overlayChartController:v9];
  [v10 addObject:v11];
  v12 = v11;
  v29 = [(HKOverlayRoomOxygenSaturationViewController *)self _makeRangeContextForMode:a3 applicationItems:v8 overlayChartController:v9];
  objc_msgSend(v10, "addObject:");
  id v31 = 0;
  v13 = [(HKOverlayRoomOxygenSaturationViewController *)self _makeAverageContextForMode:a3 applicationItems:v8 overlayChartController:v9 contextDelegate:&v31];
  id v14 = v31;
  [v10 addObject:v13];
  if (v14)
  {
    id v15 = [(HKOverlayRoomOxygenSaturationViewController *)self contextDelegates];
    [v15 addObject:v14];
  }
  if (HKFeatureFlagBloodOxygenSaturationEnabled())
  {
    id v30 = 0;
    id v16 = [(HKOverlayRoomOxygenSaturationViewController *)self _makePressureOverlayContextForMode:a3 applicationItems:v8 overlayChartController:v9 context:1 contextDelegate:&v30];
    id v17 = v30;
    [v10 addObject:v16];
    if (v17)
    {
      uint64_t v18 = [(HKOverlayRoomOxygenSaturationViewController *)self contextDelegates];
      [v18 addObject:v17];
    }
  }
  id v19 = [(HKOverlayRoomOxygenSaturationViewController *)self _makeSleepContextForMode:a3 applicationItems:v8 overlayChartController:v9];
  [v10 addObject:v19];
  id v20 = v12;
  if (self->_trendModel)
  {
    id v21 = [(HKOverlayRoomOxygenSaturationViewController *)self primaryDisplayTypeWithApplicationItems:v8];
    v22 = [[HKOverlayRoomTrendContext alloc] initWithBaseDisplayType:v21 trendModel:self->_trendModel overlayChartController:v9 applicationItems:v8 overlayMode:a3];
    v23 = [(HKOverlayRoomViewController *)self chartController];
    [v23 setTrendAccessibilityDelegate:v22];

    [v10 addObject:v22];
    id v20 = v12;
    if ([(HKChartSummaryTrendModel *)self->_trendModel selectTrendInitially])
    {
      id v20 = v22;
    }
  }
  uint64_t v24 = [v10 indexOfObject:v20];
  if (v24 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v25 = 0;
  }
  else
  {
    v25 = [NSNumber numberWithUnsignedInteger:v24];
  }
  objc_storeStrong((id *)&self->_preferredOverlayIndex, v25);
  if (v24 != 0x7FFFFFFFFFFFFFFFLL) {

  }
  uint64_t v26 = [[HKOverlayContextSection alloc] initWithSectionTitle:0 overlayContextItems:v10];
  v32[0] = v26;
  unsigned int v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];

  return v27;
}

- (id)_makePressureOverlayContextForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5 context:(unint64_t)a6 contextDelegate:(id *)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = HKOxygenSaturationLowBarometricPressureThresholdQuantity();
  if (a6)
  {
    if (a6 != 1)
    {
      v23 = 0;
      id v20 = 0;
      goto LABEL_7;
    }
    id v16 = [MEMORY[0x1E4F2B3C0] predicateForObjectsWithMetadataKey:*MEMORY[0x1E4F2A0E0] operatorType:1 value:v15];
    id v17 = [HKInteractiveChartOverlayPredicate alloc];
    uint64_t v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v19 = [v18 localizedStringForKey:@"SCANDIUM_OVERLAY_LOW_AIR_PRESSURE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Scandium"];
    id v20 = [(HKInteractiveChartOverlayPredicate *)v17 initWithPredicate:v16 name:v19];

    id v21 = [_HKOxygenSaturationIntegratedContextDelegate alloc];
    v22 = [(HKOverlayRoomViewController *)self primaryDisplayType];
    v23 = [(_HKOxygenSaturationIntegratedContextDelegate *)v21 initWithCustomDataSource:0 primaryDisplayType:v22 context:1];
  }
  else
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"HKOverlayRoomOxygenSaturationViewController.m" lineNumber:338 description:@"unsupported context"];
    v23 = 0;
    id v20 = 0;
  }

LABEL_7:
  uint64_t v24 = +[HKOverlayRoomViewControllerIntegratedContext distributionContextWithStyle:0 namedPredicate:v20 overlayChartController:v14 applicationItems:v13 optionalDelegate:v23 options:0 mode:a3];
  if (a7 && v23) {
    *a7 = v23;
  }

  return v24;
}

- (id)_makeLatestContextForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [[HKOverlayRoomViewControllerLastQuantityContext alloc] initWithOverlayChartController:v7 applicationItems:v8 mode:a3];

  return v9;
}

- (id)_makeRangeContextForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  return +[HKOverlayRoomViewControllerIntegratedContext distributionContextWithStyle:0 namedPredicate:0 overlayChartController:a5 applicationItems:a4 optionalDelegate:0 options:2 mode:a3];
}

- (id)_makeAverageContextForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5 contextDelegate:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  v12 = [(HKOverlayRoomOxygenSaturationViewController *)self primaryDisplayTypeWithApplicationItems:v11];
  id v13 = [v11 unitController];
  id v14 = [v11 healthStore];
  id v15 = [(HKOverlayRoomOxygenSaturationViewController *)self _buildAverageDataSourceWithUnitController:v13 displayType:v12 healthStore:v14];

  id v16 = [[_HKOxygenSaturationIntegratedContextDelegate alloc] initWithCustomDataSource:v15 primaryDisplayType:v12 context:0];
  id v17 = v16;
  if (a6) {
    *a6 = v16;
  }
  uint64_t v18 = +[HKOverlayRoomViewControllerIntegratedContext quantityContextWithIdentifier:*MEMORY[0x1E4F2A868] overlayChartController:v10 applicationItems:v11 optionalDelegate:v17 seriesOptions:0 mode:a3];

  return v18;
}

- (id)_makeSleepContextForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  return +[HKOverlayRoomViewControllerIntegratedContext distributionContextWithStyle:6 namedPredicate:0 overlayChartController:a5 applicationItems:a4 optionalDelegate:0 options:128 mode:a3];
}

- (id)_buildAverageDataSourceWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[HKQuantityTypeDataSource alloc] initWithUnitController:v10 options:2 displayType:v9 healthStore:v8];

  [(HKQuantityTypeDataSource *)v11 setUserInfoCreationBlock:&__block_literal_global_20];
  v12 = [(HKOverlayRoomOxygenSaturationViewController *)self _buildGranularAverageDataSourceTitleFromTimeScope];
  id v13 = [[HKInteractiveChartOverlayNamedDataSource alloc] initWithDataSource:v11 named:@"HKOverlayRoomNamedChartCacheDataSource_OxygenSaturation" withContextTitleForTimeScope:v12];

  return v13;
}

HKInteractiveChartSinglePointData *__113__HKOverlayRoomOxygenSaturationViewController__buildAverageDataSourceWithUnitController_displayType_healthStore___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F2B618];
  id v3 = a2;
  int64_t v4 = [v2 percentUnit];
  id v5 = objc_alloc_init(HKInteractiveChartSinglePointData);
  uint64_t v6 = [v3 averageQuantity];
  [v6 doubleValueForUnit:v4];
  -[HKInteractiveChartSinglePointData setValue:](v5, "setValue:");

  [(HKInteractiveChartSinglePointData *)v5 setUnit:v4];
  id v7 = [v3 statisticsInterval];
  [(HKInteractiveChartSinglePointData *)v5 setStatisticsInterval:v7];

  uint64_t v8 = [v3 recordCount];
  [(HKInteractiveChartSinglePointData *)v5 setRecordCount:v8];

  return v5;
}

- (id)_buildGranularAverageDataSourceTitleFromTimeScope
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __96__HKOverlayRoomOxygenSaturationViewController__buildGranularAverageDataSourceTitleFromTimeScope__block_invoke;
  v5[3] = &unk_1E6D51B90;
  v5[4] = self;
  v5[5] = a2;
  v2 = _Block_copy(v5);
  id v3 = _Block_copy(v2);

  return v3;
}

__CFString *__96__HKOverlayRoomOxygenSaturationViewController__buildGranularAverageDataSourceTitleFromTimeScope__block_invoke(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 0:
    case 1:
    case 8:
      int64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)(a1 + 32), @"HKOverlayRoomOxygenSaturationViewController.m", 479, @"Unsupported zoom level (%ld)", a2);
      id v5 = &stru_1F3B9CF20;
      goto LABEL_10;
    case 2:
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      int64_t v4 = v6;
      id v7 = @"SCANDIUM_OVERLAY_AVERAGE_MONTHLY";
      goto LABEL_9;
    case 3:
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      int64_t v4 = v6;
      id v7 = @"SCANDIUM_OVERLAY_AVERAGE_WEEKLY";
      goto LABEL_9;
    case 4:
    case 5:
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      int64_t v4 = v6;
      id v7 = @"SCANDIUM_OVERLAY_AVERAGE_DAILY";
      goto LABEL_9;
    case 6:
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      int64_t v4 = v6;
      id v7 = @"SCANDIUM_OVERLAY_AVERAGE_HOURLY";
      goto LABEL_9;
    case 7:
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      int64_t v4 = v6;
      id v7 = @"SCANDIUM_OVERLAY_AVERAGE_BYMINUTE";
LABEL_9:
      id v5 = [v6 localizedStringForKey:v7 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Scandium"];
LABEL_10:

      break;
    default:
      id v5 = &stru_1F3B9CF20;
      break;
  }
  return v5;
}

- (NSMutableArray)contextDelegates
{
  return self->_contextDelegates;
}

- (void)setContextDelegates:(id)a3
{
}

- (int64_t)preferredOverlay
{
  return self->_preferredOverlay;
}

- (UITapGestureRecognizer)overrideOnboardingRecognizer
{
  return self->_overrideOnboardingRecognizer;
}

- (void)setOverrideOnboardingRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideOnboardingRecognizer, 0);
  objc_storeStrong((id *)&self->_contextDelegates, 0);
  objc_storeStrong((id *)&self->_trendModel, 0);
  objc_storeStrong((id *)&self->_preferredOverlayIndex, 0);
}

@end