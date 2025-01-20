@interface HKOverlayRoomWalkingViewController
+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11;
- (HKChartSummaryTrendModel)trendModel;
- (HKOverlayRoomWalkingViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 identifier:(id)a6 preferredOverlay:(int64_t)a7 trendModel:(id)a8 factorDisplayTypes:(id)a9;
- (id)_buildAverageDataSourceTitleFromTimeScope;
- (id)_buildGranularAverageDataSourceTitleFromTimeScope;
- (id)_buildWalkingAverageDataSourceWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5;
- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)controllerTitleWithApplicationItems:(id)a3;
- (id)createChartOverlayViewController;
- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5;
- (id)preferredInitialOverlayIndex;
- (id)primaryDisplayTypeWithApplicationItems:(id)a3;
- (id)showAllFiltersButtonTitle;
- (void)viewDidLoad;
@end

@implementation HKOverlayRoomWalkingViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a6;
  id v21 = a5;
  id v22 = a3;
  v23 = (void *)[objc_alloc((Class)a1) initWithDisplayDate:v20 applicationItems:v21 mode:1 identifier:v22 preferredOverlay:a7 trendModel:v18 factorDisplayTypes:v17];

  [v23 setRestorationUserActivity:v19];
  [v23 setAdditionalChartOptions:a11];
  return v23;
}

- (HKOverlayRoomWalkingViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 identifier:(id)a6 preferredOverlay:(int64_t)a7 trendModel:(id)a8 factorDisplayTypes:(id)a9
{
  id v14 = a3;
  id v31 = a6;
  id v15 = a8;
  id v16 = a9;
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

  v32.receiver = self;
  v32.super_class = (Class)HKOverlayRoomWalkingViewController;
  id v22 = [(HKOverlayRoomViewController *)&v32 initWithDisplayDate:v21 applicationItems:v17 factorDisplayTypes:v16 mode:a5];

  if (v22)
  {
    objc_storeStrong((id *)&v22->_quantityTypeIdentifier, a6);
    v22->_preferredOverlay = a7;
    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    contextDelegates = v22->_contextDelegates;
    v22->_contextDelegates = v23;

    preferredOverlayIndex = v22->_preferredOverlayIndex;
    v22->_preferredOverlayIndex = 0;

    objc_storeStrong((id *)&v22->_trendModel, a8);
    if (a5 == 3)
    {
      uint64_t v26 = 0;
    }
    else
    {
      unsigned int v27 = [v15 selectTrendInitially];
      if (a5) {
        BOOL v28 = a7 == 0;
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
    -[HKOverlayRoomViewController setShouldSelectInitialOverlay:](v22, "setShouldSelectInitialOverlay:", v26, a7, v31);
  }

  return v22;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)HKOverlayRoomWalkingViewController;
  [(HKOverlayRoomViewController *)&v2 viewDidLoad];
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  if ([(NSString *)self->_quantityTypeIdentifier isEqualToString:*MEMORY[0x1E4F2A938]])
  {
    v5 = HKHealthKitFrameworkBundle();
    v6 = v5;
    uint64_t v7 = *MEMORY[0x1E4F29E40];
    v8 = @"WALKING_SPEED";
LABEL_11:
    v9 = [v5 localizedStringForKey:v8 value:&stru_1F3B9CF20 table:v7];
    goto LABEL_12;
  }
  if ([(NSString *)self->_quantityTypeIdentifier isEqualToString:*MEMORY[0x1E4F2A928]])
  {
    v5 = HKHealthKitFrameworkBundle();
    v6 = v5;
    uint64_t v7 = *MEMORY[0x1E4F29E40];
    v8 = @"WALKING_DOUBLE_SUPPORT_PERCENTAGE";
    goto LABEL_11;
  }
  if ([(NSString *)self->_quantityTypeIdentifier isEqualToString:*MEMORY[0x1E4F2A8E0]])
  {
    v5 = HKHealthKitFrameworkBundle();
    v6 = v5;
    uint64_t v7 = *MEMORY[0x1E4F29E40];
    v8 = @"STAIR_ASCENT_SPEED";
    goto LABEL_11;
  }
  if ([(NSString *)self->_quantityTypeIdentifier isEqualToString:*MEMORY[0x1E4F2A8E8]])
  {
    v5 = HKHealthKitFrameworkBundle();
    v6 = v5;
    uint64_t v7 = *MEMORY[0x1E4F29E40];
    v8 = @"STAIR_DESCENT_SPEED";
    goto LABEL_11;
  }
  if ([(NSString *)self->_quantityTypeIdentifier isEqualToString:*MEMORY[0x1E4F2A940]])
  {
    v5 = HKHealthKitFrameworkBundle();
    v6 = v5;
    uint64_t v7 = *MEMORY[0x1E4F29E40];
    v8 = @"WALKING_STEP_LENGTH";
    goto LABEL_11;
  }
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2, self, @"HKOverlayRoomWalkingViewController.m", 133, @"Unsupported identifier (%@)", self->_quantityTypeIdentifier object file lineNumber description];
  v9 = &stru_1F3B9CF20;
LABEL_12:

  return v9;
}

- (id)showAllFiltersButtonTitle
{
  objc_super v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"SHOW_MORE_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F2B2C0];
  quantityTypeIdentifier = self->_quantityTypeIdentifier;
  id v5 = a3;
  v6 = [v3 quantityTypeForIdentifier:quantityTypeIdentifier];
  uint64_t v7 = [v5 displayTypeController];

  v8 = [v7 displayTypeForObjectType:v6];

  return v8;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  v71[3] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [(HKOverlayRoomWalkingViewController *)self primaryDisplayTypeWithApplicationItems:v8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __110__HKOverlayRoomWalkingViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_2;
  aBlock[3] = &unk_1E6D51A80;
  id v11 = v9;
  id v64 = v11;
  id v12 = v8;
  id v65 = v12;
  int64_t v66 = a3;
  v13 = (void (**)(void *))_Block_copy(aBlock);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __110__HKOverlayRoomWalkingViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_3;
  v59[3] = &unk_1E6D51A58;
  id v14 = v11;
  id v60 = v14;
  id v15 = v12;
  id v61 = v15;
  int64_t v62 = a3;
  id v16 = _Block_copy(v59);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __110__HKOverlayRoomWalkingViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_4;
  v54[3] = &unk_1E6D53800;
  v54[4] = self;
  id v17 = v15;
  id v55 = v17;
  id v18 = v10;
  id v56 = v18;
  id v19 = v14;
  id v57 = v19;
  int64_t v58 = a3;
  id v20 = _Block_copy(v54);
  v53 = v13;
  id v21 = v13[2](v13);
  v71[0] = v21;
  v51 = v16;
  id v22 = (*((void (**)(void *, void, uint64_t))v16 + 2))(v16, 0, 2);
  v71[1] = v22;
  v50 = v20;
  v23 = (*((void (**)(void *, NSString *))v20 + 2))(v20, self->_quantityTypeIdentifier);
  v71[2] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:3];

  v25 = [v24 objectAtIndexedSubscript:0];
  uint64_t v26 = [(HKOverlayRoomWalkingViewController *)self trendModel];

  v52 = v17;
  id v49 = v18;
  if (v26)
  {
    unsigned int v27 = [HKOverlayRoomTrendContext alloc];
    BOOL v28 = [(HKOverlayRoomWalkingViewController *)self trendModel];
    v29 = [(HKOverlayRoomTrendContext *)v27 initWithBaseDisplayType:v18 trendModel:v28 overlayChartController:v19 applicationItems:v17 overlayMode:a3];

    v30 = [(HKOverlayRoomViewController *)self chartController];
    [v30 setTrendAccessibilityDelegate:v29];

    uint64_t v31 = [v24 arrayByAddingObject:v29];

    objc_super v32 = [(HKOverlayRoomWalkingViewController *)self trendModel];
    int v33 = [v32 selectTrendInitially];

    v34 = v19;
    if (v33)
    {
      v29 = v29;

      v24 = (void *)v31;
      v35 = v29;
      goto LABEL_7;
    }
    v24 = (void *)v31;
  }
  else
  {
    v29 = 0;
    v34 = v19;
  }
  v35 = v25;
LABEL_7:
  v36 = v53;
  if ((unint64_t)(a3 - 1) >= 2)
  {
    v44 = v49;
    if (a3 != 3)
    {
      v43 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_18;
    }
    uint64_t v45 = [v24 indexOfObject:v35];
    if (v45 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v46 = 0;
    }
    else
    {
      v46 = [NSNumber numberWithUnsignedInteger:v45];
    }
    objc_storeStrong((id *)&self->_preferredOverlayIndex, v46);
    if (v45 != 0x7FFFFFFFFFFFFFFFLL) {

    }
    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v47 = __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v39, 0, v24);
    [v39 addObject:v47];

    v40 = [[HKOverlayContextSectionContainer alloc] initWithContainerTitle:0 overlayContextSections:v39];
    v67 = v40;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
  }
  else
  {
    preferredOverlayIndex = self->_preferredOverlayIndex;
    self->_preferredOverlayIndex = (NSNumber *)&unk_1F3C209F8;

    v38 = [HKOverlayContextSectionContainer alloc];
    v68 = v35;
    id v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
    __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v39, 0, v39);
    v40 = (HKOverlayContextSectionContainer *)objc_claimAutoreleasedReturnValue();
    v69 = v40;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
    v42 = [(HKOverlayContextSectionContainer *)v38 initWithContainerTitle:0 overlayContextSections:v41];
    v70 = v42;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];

    v44 = v49;
  }

  v36 = v53;
LABEL_18:

  return v43;
}

HKOverlayRoomViewControllerLastQuantityContext *__110__HKOverlayRoomWalkingViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_2(void *a1)
{
  v1 = [[HKOverlayRoomViewControllerLastQuantityContext alloc] initWithOverlayChartController:a1[4] applicationItems:a1[5] mode:a1[6]];
  return v1;
}

id __110__HKOverlayRoomWalkingViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_3(void *a1, uint64_t a2, uint64_t a3)
{
  return +[HKOverlayRoomViewControllerIntegratedContext distributionContextWithStyle:a2 namedPredicate:0 overlayChartController:a1[4] applicationItems:a1[5] optionalDelegate:0 options:a3 mode:a1[6]];
}

id __110__HKOverlayRoomWalkingViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) unitController];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = [*(id *)(a1 + 40) healthStore];
  id v8 = [v4 _buildWalkingAverageDataSourceWithUnitController:v5 displayType:v6 healthStore:v7];

  id v9 = [[_HKWalkingQuantityContextDelegate alloc] initWithCustomDataSource:v8 primaryDisplayType:*(void *)(a1 + 48)];
  if (v9) {
    [*(id *)(*(void *)(a1 + 32) + 1352) addObject:v9];
  }
  v10 = +[HKOverlayRoomViewControllerIntegratedContext quantityContextWithIdentifier:v3 overlayChartController:*(void *)(a1 + 56) applicationItems:*(void *)(a1 + 40) optionalDelegate:v9 seriesOptions:0 mode:*(void *)(a1 + 64)];

  return v10;
}

- (id)createChartOverlayViewController
{
  if ([(HKOverlayRoomViewController *)self controllerMode] != 3)
  {
    id v3 = [(HKOverlayRoomWalkingViewController *)self trendModel];
    int64_t v4 = +[HKOverlayRoomTrendContext findStartingTimeScopeFromTrendModel:v3];

    if (v4 != 8)
    {
      id v5 = [(HKOverlayRoomViewController *)self applicationItems];
      uint64_t v6 = [v5 timeScopeController];
      [v6 setSelectedTimeScope:v4];
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)HKOverlayRoomWalkingViewController;
  uint64_t v7 = [(HKOverlayRoomViewController *)&v9 createChartOverlayViewController];
  return v7;
}

- (id)preferredInitialOverlayIndex
{
  return self->_preferredOverlayIndex;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [HKOverlayRoomWalkingViewController alloc];
  quantityTypeIdentifier = self->_quantityTypeIdentifier;
  int64_t preferredOverlay = self->_preferredOverlay;
  v13 = [(HKOverlayRoomWalkingViewController *)self trendModel];
  id v14 = [(HKOverlayRoomViewController *)self factorDisplayTypes];
  id v15 = [(HKOverlayRoomWalkingViewController *)v10 initWithDisplayDate:v9 applicationItems:v8 mode:a3 identifier:quantityTypeIdentifier preferredOverlay:preferredOverlay trendModel:v13 factorDisplayTypes:v14];

  [(HKOverlayRoomViewController *)v15 setAdditionalChartOptions:[(HKOverlayRoomViewController *)self filteredInteractiveChartOptionsForMode:a3]];
  return v15;
}

- (id)_buildWalkingAverageDataSourceWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[HKQuantityTypeDataSource alloc] initWithUnitController:v8 options:66 displayType:v9 healthStore:v10];

  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __111__HKOverlayRoomWalkingViewController__buildWalkingAverageDataSourceWithUnitController_displayType_healthStore___block_invoke;
  v24 = &unk_1E6D51B68;
  id v25 = v8;
  id v26 = v9;
  id v12 = v9;
  id v13 = v8;
  [(HKQuantityTypeDataSource *)v11 setUserInfoCreationBlock:&v21];
  id v14 = [(HKOverlayRoomWalkingViewController *)self _buildGranularAverageDataSourceTitleFromTimeScope];
  id v15 = NSString;
  id v16 = (objc_class *)objc_opt_class();
  id v17 = NSStringFromClass(v16);
  id v18 = [v15 stringWithFormat:@"%@%@", @"HKOverlayRoomNamedChartCacheDataSource_", v17, v21, v22, v23, v24];

  id v19 = [[HKInteractiveChartOverlayNamedDataSource alloc] initWithDataSource:v11 named:v18 withContextTitleForTimeScope:v14];
  return v19;
}

HKInteractiveChartSinglePointData *__111__HKOverlayRoomWalkingViewController__buildWalkingAverageDataSourceWithUnitController_displayType_healthStore___block_invoke(uint64_t a1, void *a2)
{
  objc_super v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v2 unitForDisplayType:v3];
  uint64_t v6 = objc_alloc_init(HKInteractiveChartSinglePointData);
  uint64_t v7 = [v4 averageQuantity];
  [v7 doubleValueForUnit:v5];
  -[HKInteractiveChartSinglePointData setValue:](v6, "setValue:");

  [(HKInteractiveChartSinglePointData *)v6 setUnit:v5];
  id v8 = [v4 statisticsInterval];
  [(HKInteractiveChartSinglePointData *)v6 setStatisticsInterval:v8];

  uint64_t v9 = [v4 recordCount];
  [(HKInteractiveChartSinglePointData *)v6 setRecordCount:v9];

  return v6;
}

- (id)_buildAverageDataSourceTitleFromTimeScope
{
  return &__block_literal_global_344_0;
}

id __79__HKOverlayRoomWalkingViewController__buildAverageDataSourceTitleFromTimeScope__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v1 = [v0 localizedStringForKey:@"AVERAGE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v1;
}

- (id)_buildGranularAverageDataSourceTitleFromTimeScope
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__HKOverlayRoomWalkingViewController__buildGranularAverageDataSourceTitleFromTimeScope__block_invoke;
  v5[3] = &unk_1E6D51B90;
  v5[4] = self;
  v5[5] = a2;
  objc_super v2 = _Block_copy(v5);
  uint64_t v3 = _Block_copy(v2);

  return v3;
}

__CFString *__87__HKOverlayRoomWalkingViewController__buildGranularAverageDataSourceTitleFromTimeScope__block_invoke(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 0:
    case 1:
    case 8:
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)(a1 + 32), @"HKOverlayRoomWalkingViewController.m", 332, @"Unsupported zoom level (%ld)", a2);
      id v5 = &stru_1F3B9CF20;
      goto LABEL_10;
    case 2:
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v4 = v6;
      uint64_t v7 = @"OVERLAY_AVERAGE_MONTHLY";
      goto LABEL_9;
    case 3:
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v4 = v6;
      uint64_t v7 = @"OVERLAY_AVERAGE_WEEKLY";
      goto LABEL_9;
    case 4:
    case 5:
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v4 = v6;
      uint64_t v7 = @"OVERLAY_AVERAGE_DAILY";
      goto LABEL_9;
    case 6:
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v4 = v6;
      uint64_t v7 = @"OVERLAY_AVERAGE_HOURLY";
      goto LABEL_9;
    case 7:
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v4 = v6;
      uint64_t v7 = @"OVERLAY_AVERAGE_BYMINUTE";
LABEL_9:
      id v5 = [v6 localizedStringForKey:v7 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
LABEL_10:

      break;
    default:
      id v5 = &stru_1F3B9CF20;
      break;
  }
  return v5;
}

- (HKChartSummaryTrendModel)trendModel
{
  return self->_trendModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendModel, 0);
  objc_storeStrong((id *)&self->_contextDelegates, 0);
  objc_storeStrong((id *)&self->_quantityTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_preferredOverlayIndex, 0);
}

@end