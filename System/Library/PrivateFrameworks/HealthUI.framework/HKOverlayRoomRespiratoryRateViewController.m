@interface HKOverlayRoomRespiratoryRateViewController
+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11;
- (HKChartSummaryTrendModel)trendModel;
- (HKOverlayRoomRespiratoryRateViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 preferredOverlay:(int64_t)a6 trendModel:(id)a7 factorDisplayTypes:(id)a8;
- (NSMutableArray)contextDelegates;
- (id)_buildGranularAverageDataSourceTitleFromTimeScope;
- (id)_buildRespiratoryRateAverageDataSourceWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5;
- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)controllerTitleWithApplicationItems:(id)a3;
- (id)createChartOverlayViewController;
- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5;
- (id)preferredInitialOverlayIndex;
- (id)primaryDisplayTypeWithApplicationItems:(id)a3;
- (int64_t)_initialPillForPreference:(int64_t)a3;
- (int64_t)preferredOverlay;
- (void)setContextDelegates:(id)a3;
- (void)setTrendModel:(id)a3;
@end

@implementation HKOverlayRoomRespiratoryRateViewController

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

- (HKOverlayRoomRespiratoryRateViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 preferredOverlay:(int64_t)a6 trendModel:(id)a7 factorDisplayTypes:(id)a8
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
  v30.super_class = (Class)HKOverlayRoomRespiratoryRateViewController;
  v22 = [(HKOverlayRoomViewController *)&v30 initWithDisplayDate:v21 applicationItems:v17 factorDisplayTypes:v16 mode:a5];

  if (v22)
  {
    v22->_preferredOverlay = a6;
    preferredOverlayIndex = v22->_preferredOverlayIndex;
    v22->_preferredOverlayIndex = 0;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    contextDelegates = v22->_contextDelegates;
    v22->_contextDelegates = v24;

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
  v4 = [v3 localizedStringForKey:@"RESPIRATORY_RATE" value:&stru_1F3B9CF20 table:*MEMORY[0x1E4F29E40]];

  return v4;
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F2B2C0];
  uint64_t v4 = *MEMORY[0x1E4F2A898];
  id v5 = a3;
  v6 = [v3 quantityTypeForIdentifier:v4];
  v7 = [v5 displayTypeController];

  v8 = [v7 displayTypeForObjectType:v6];

  return v8;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  v82[4] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [(HKOverlayRoomRespiratoryRateViewController *)self primaryDisplayTypeWithApplicationItems:v8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __118__HKOverlayRoomRespiratoryRateViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_2;
  aBlock[3] = &unk_1E6D51A58;
  id v11 = v9;
  id v74 = v11;
  id v12 = v8;
  id v75 = v12;
  int64_t v76 = a3;
  v13 = (void (**)(void *, void, uint64_t))_Block_copy(aBlock);
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __118__HKOverlayRoomRespiratoryRateViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_3;
  v69[3] = &unk_1E6D51A80;
  id v14 = v11;
  id v70 = v14;
  id v15 = v12;
  id v71 = v15;
  int64_t v72 = a3;
  id v16 = _Block_copy(v69);
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __118__HKOverlayRoomRespiratoryRateViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_4;
  v64[3] = &unk_1E6D51AA8;
  v64[4] = self;
  id v59 = v15;
  id v65 = v59;
  id v17 = v10;
  id v66 = v17;
  id v18 = v14;
  id v67 = v18;
  int64_t v68 = a3;
  id v19 = _Block_copy(v64);
  v62 = v16;
  id v20 = (*((void (**)(void *))v16 + 2))(v16);
  v82[0] = v20;
  id v21 = v13[2](v13, 0, 2);
  v82[1] = v21;
  v60 = v19;
  v22 = (*((void (**)(void *))v19 + 2))(v19);
  v82[2] = v22;
  v63 = (void (**)(void, uint64_t, uint64_t))v13;
  v23 = v13[2](v13, 6, 128);
  v82[3] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:4];

  v25 = [(HKOverlayRoomRespiratoryRateViewController *)self trendModel];

  id v61 = v18;
  if (v25)
  {
    uint64_t v26 = [HKOverlayRoomTrendContext alloc];
    unsigned int v27 = [(HKOverlayRoomRespiratoryRateViewController *)self trendModel];
    id v28 = v17;
    id v29 = v17;
    int64_t v30 = a3;
    v31 = v59;
    v32 = -[HKOverlayRoomTrendContext initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:](v26, "initWithBaseDisplayType:trendModel:overlayChartController:applicationItems:overlayMode:", v29, v27, v18);

    v33 = [(HKOverlayRoomViewController *)self chartController];
    [v33 setTrendAccessibilityDelegate:v32];

    uint64_t v34 = [v24 arrayByAddingObject:v32];

    v24 = (void *)v34;
  }
  else
  {
    id v28 = v17;
    v31 = v59;
    int64_t v30 = a3;
    v32 = 0;
  }
  int64_t v35 = [(HKOverlayRoomRespiratoryRateViewController *)self _initialPillForPreference:[(HKOverlayRoomRespiratoryRateViewController *)self preferredOverlay]];
  if (!v35)
  {
    (*((void (**)(void))v16 + 2))();
    v38 = (HKOverlayRoomTrendContext *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v37 = v38;
    v36 = v63;
    goto LABEL_12;
  }
  if (v35 == 2)
  {
    v38 = v32;
    goto LABEL_10;
  }
  v36 = v63;
  if (v35 == 1)
  {
    v37 = v63[2](v63, 6, 128);
  }
  else
  {
    v37 = 0;
  }
LABEL_12:
  v39 = v28;
  if ((unint64_t)(v30 - 1) >= 2)
  {
    v46 = v61;
    if (v30 != 3)
    {
      v50 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_28;
    }
    if (v37 && (uint64_t v47 = [v24 indexOfObject:v37], v47 != 0x7FFFFFFFFFFFFFFFLL))
    {
      v48 = [NSNumber numberWithUnsignedInteger:v47];
      char v49 = 0;
    }
    else
    {
      v48 = 0;
      char v49 = 1;
    }
    v54 = v31;
    objc_storeStrong((id *)&self->_preferredOverlayIndex, v48);
    if ((v49 & 1) == 0) {

    }
    v55 = [HKOverlayContextSectionContainer alloc];
    v45 = __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v55, 0, v24);
    v77 = v45;
    v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
    v57 = [(HKOverlayContextSectionContainer *)v55 initWithContainerTitle:0 overlayContextSections:v56];
    v78 = v57;
    v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];

    v31 = v54;
    v36 = v63;
  }
  else
  {
    v40 = [NSNumber numberWithUnsignedInteger:0];
    preferredOverlayIndex = self->_preferredOverlayIndex;
    self->_preferredOverlayIndex = v40;

    v42 = [HKOverlayContextSectionContainer alloc];
    v43 = v42;
    v44 = v31;
    if (v37)
    {
      v79 = v37;
      v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
      v45 = v42;
    }
    else
    {
      v45 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v51 = __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v42, 0, v45);
    v80 = v51;
    v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
    v53 = [(HKOverlayContextSectionContainer *)v43 initWithContainerTitle:0 overlayContextSections:v52];
    v81 = v53;
    v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];

    v39 = v28;
    v46 = v61;
    v31 = v44;
    v36 = v63;
    if (!v37) {
      goto LABEL_28;
    }
  }

LABEL_28:
  return v50;
}

id __118__HKOverlayRoomRespiratoryRateViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  return +[HKOverlayRoomViewControllerIntegratedContext distributionContextWithStyle:a2 namedPredicate:0 overlayChartController:a1[4] applicationItems:a1[5] optionalDelegate:0 options:a3 mode:a1[6]];
}

HKOverlayRoomViewControllerLastQuantityContext *__118__HKOverlayRoomRespiratoryRateViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_3(void *a1)
{
  v1 = [[HKOverlayRoomViewControllerLastQuantityContext alloc] initWithOverlayChartController:a1[4] applicationItems:a1[5] mode:a1[6]];
  return v1;
}

id __118__HKOverlayRoomRespiratoryRateViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_4(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) unitController];
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 40) healthStore];
  v6 = [v2 _buildRespiratoryRateAverageDataSourceWithUnitController:v3 displayType:v4 healthStore:v5];

  v7 = [[_HKRespiratoryRateQuantityContextDelegate alloc] initWithCustomDataSource:v6 primaryDisplayType:*(void *)(a1 + 48)];
  if (v7) {
    [*(id *)(*(void *)(a1 + 32) + 1352) addObject:v7];
  }
  id v8 = +[HKOverlayRoomViewControllerIntegratedContext quantityContextWithIdentifier:*MEMORY[0x1E4F2A898] overlayChartController:*(void *)(a1 + 56) applicationItems:*(void *)(a1 + 40) optionalDelegate:v7 seriesOptions:0 mode:*(void *)(a1 + 64)];

  return v8;
}

- (id)createChartOverlayViewController
{
  if ([(HKOverlayRoomViewController *)self controllerMode] != 3)
  {
    v3 = [(HKOverlayRoomRespiratoryRateViewController *)self trendModel];
    int64_t v4 = +[HKOverlayRoomTrendContext findStartingTimeScopeFromTrendModel:v3];

    if (v4 != 8)
    {
      id v5 = [(HKOverlayRoomViewController *)self applicationItems];
      v6 = [v5 timeScopeController];
      [v6 setSelectedTimeScope:v4];
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)HKOverlayRoomRespiratoryRateViewController;
  v7 = [(HKOverlayRoomViewController *)&v9 createChartOverlayViewController];
  return v7;
}

- (int64_t)_initialPillForPreference:(int64_t)a3
{
  uint64_t v5 = [(HKOverlayRoomRespiratoryRateViewController *)self trendModel];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(HKOverlayRoomRespiratoryRateViewController *)self trendModel];
    char v8 = [v7 selectTrendInitially];

    if (v8) {
      return 2;
    }
  }
  int64_t result = 0;
  if (a3)
  {
    if (a3 == 9)
    {
      return 1;
    }
    else if (a3 != 11)
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E4F29F28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
        -[HKOverlayRoomRespiratoryRateViewController _initialPillForPreference:](a3, v10);
      }
      return 0;
    }
  }
  return result;
}

- (id)preferredInitialOverlayIndex
{
  return self->_preferredOverlayIndex;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [HKOverlayRoomRespiratoryRateViewController alloc];
  int64_t v11 = [(HKOverlayRoomRespiratoryRateViewController *)self preferredOverlay];
  id v12 = [(HKOverlayRoomRespiratoryRateViewController *)self trendModel];
  v13 = [(HKOverlayRoomViewController *)self factorDisplayTypes];
  id v14 = [(HKOverlayRoomRespiratoryRateViewController *)v10 initWithDisplayDate:v9 applicationItems:v8 mode:a3 preferredOverlay:v11 trendModel:v12 factorDisplayTypes:v13];

  [(HKOverlayRoomViewController *)v14 setAdditionalChartOptions:[(HKOverlayRoomViewController *)self filteredInteractiveChartOptionsForMode:a3]];
  return v14;
}

- (id)_buildRespiratoryRateAverageDataSourceWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = [[HKQuantityTypeDataSource alloc] initWithUnitController:v8 options:2 displayType:v9 healthStore:v10];

  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __127__HKOverlayRoomRespiratoryRateViewController__buildRespiratoryRateAverageDataSourceWithUnitController_displayType_healthStore___block_invoke;
  id v20 = &unk_1E6D51B68;
  id v21 = v8;
  id v22 = v9;
  id v12 = v9;
  id v13 = v8;
  [(HKQuantityTypeDataSource *)v11 setUserInfoCreationBlock:&v17];
  id v14 = [(HKOverlayRoomRespiratoryRateViewController *)self _buildGranularAverageDataSourceTitleFromTimeScope];
  id v15 = [[HKInteractiveChartOverlayNamedDataSource alloc] initWithDataSource:v11 named:@"HKOverlayRoomNamedChartCacheDataSource_RespiratoryRate" withContextTitleForTimeScope:v14];

  return v15;
}

HKInteractiveChartSinglePointData *__127__HKOverlayRoomRespiratoryRateViewController__buildRespiratoryRateAverageDataSourceWithUnitController_displayType_healthStore___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  uint64_t v5 = [v2 unitForDisplayType:v3];
  v6 = objc_alloc_init(HKInteractiveChartSinglePointData);
  v7 = [v4 averageQuantity];
  [v7 doubleValueForUnit:v5];
  -[HKInteractiveChartSinglePointData setValue:](v6, "setValue:");

  [(HKInteractiveChartSinglePointData *)v6 setUnit:v5];
  -[HKInteractiveChartSinglePointData setRecordCount:](v6, "setRecordCount:", [v4 recordCount]);
  id v8 = [v4 statisticsInterval];

  [(HKInteractiveChartSinglePointData *)v6 setStatisticsInterval:v8];
  return v6;
}

- (id)_buildGranularAverageDataSourceTitleFromTimeScope
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __95__HKOverlayRoomRespiratoryRateViewController__buildGranularAverageDataSourceTitleFromTimeScope__block_invoke;
  v5[3] = &unk_1E6D51B90;
  v5[4] = self;
  v5[5] = a2;
  v2 = _Block_copy(v5);
  uint64_t v3 = _Block_copy(v2);

  return v3;
}

__CFString *__95__HKOverlayRoomRespiratoryRateViewController__buildGranularAverageDataSourceTitleFromTimeScope__block_invoke(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 0:
    case 1:
    case 8:
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)(a1 + 32), @"HKOverlayRoomRespiratoryRateViewController.m", 309, @"Unsupported zoom level (%ld)", a2);
      uint64_t v5 = &stru_1F3B9CF20;
      goto LABEL_10;
    case 2:
      v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v4 = v6;
      v7 = @"OVERLAY_AVERAGE_MONTHLY";
      goto LABEL_9;
    case 3:
      v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v4 = v6;
      v7 = @"OVERLAY_AVERAGE_WEEKLY";
      goto LABEL_9;
    case 4:
    case 5:
      v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v4 = v6;
      v7 = @"OVERLAY_AVERAGE_DAILY";
      goto LABEL_9;
    case 6:
      v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v4 = v6;
      v7 = @"OVERLAY_AVERAGE_HOURLY";
      goto LABEL_9;
    case 7:
      v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v4 = v6;
      v7 = @"OVERLAY_AVERAGE_BYMINUTE";
LABEL_9:
      uint64_t v5 = [v6 localizedStringForKey:v7 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
LABEL_10:

      break;
    default:
      uint64_t v5 = &stru_1F3B9CF20;
      break;
  }
  return v5;
}

- (int64_t)preferredOverlay
{
  return self->_preferredOverlay;
}

- (NSMutableArray)contextDelegates
{
  return self->_contextDelegates;
}

- (void)setContextDelegates:(id)a3
{
}

- (HKChartSummaryTrendModel)trendModel
{
  return self->_trendModel;
}

- (void)setTrendModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendModel, 0);
  objc_storeStrong((id *)&self->_contextDelegates, 0);
  objc_storeStrong((id *)&self->_preferredOverlayIndex, 0);
}

- (void)_initialPillForPreference:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "HKOverlayRoomRespiratoryRateViewController received invalid secondary type: %ld", (uint8_t *)&v2, 0xCu);
}

@end