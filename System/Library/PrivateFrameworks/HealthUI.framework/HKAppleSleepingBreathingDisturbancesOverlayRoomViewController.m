@interface HKAppleSleepingBreathingDisturbancesOverlayRoomViewController
+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11;
- (BOOL)supportsHealthFactors;
- (BOOL)supportsShowAllFilters;
- (HKAppleSleepingBreathingDisturbancesOverlayRoomViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 mode:(int64_t)a6 preferredOverlay:(int64_t)a7;
- (HKDisplayType)representativeDisplayType;
- (HKOverlayContextLocation)preferredContextLocation;
- (id)_chartDataSourceWithApplicationItems:(id)a3 displayType:(id)a4;
- (id)_overlayContextContainerWithApplicationItems:(id)a3 overlayChartController:(id)a4 mode:(int64_t)a5;
- (id)_sleepApneaEventDisplayTypeWithApplicationItems:(id)a3;
- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)controllerTitleWithApplicationItems:(id)a3;
- (id)createChartOverlayViewController;
- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5;
- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4;
- (int64_t)preferredOverlay;
- (void)setPreferredContextLocation:(id)a3;
- (void)setRepresentativeDisplayType:(id)a3;
@end

@implementation HKAppleSleepingBreathingDisturbancesOverlayRoomViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  id v15 = a10;
  id v16 = a8;
  id v17 = a6;
  id v18 = a5;
  v19 = [[HKAppleSleepingBreathingDisturbancesOverlayRoomViewController alloc] initWithDisplayDate:v17 applicationItems:v18 factorDisplayTypes:v15 mode:0 preferredOverlay:a7];

  [(HKOverlayRoomViewController *)v19 setRestorationUserActivity:v16];
  [(HKOverlayRoomViewController *)v19 setAdditionalChartOptions:a11];
  return v19;
}

- (HKAppleSleepingBreathingDisturbancesOverlayRoomViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 mode:(int64_t)a6 preferredOverlay:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (a7 && a7 != 11)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HKAppleSleepingBreathingDisturbancesOverlayRoomViewController.m", 63, @"Invalid parameter not satisfying: %@", @"_HKAppleSleepingBreathingDisturbancesIsPreferredOverlaySupported(preferredOverlay)" object file lineNumber description];
  }
  v26.receiver = self;
  v26.super_class = (Class)HKAppleSleepingBreathingDisturbancesOverlayRoomViewController;
  id v17 = [(HKOverlayRoomViewController *)&v26 initWithDisplayDate:v13 applicationItems:v14 factorDisplayTypes:v15 mode:a6];
  id v18 = v17;
  if (v17)
  {
    v17->_preferredOverlay = a7;
    preferredContextLocation = v17->_preferredContextLocation;
    v17->_preferredContextLocation = 0;

    v20 = [v14 displayTypeController];
    uint64_t v21 = [v20 displayTypeWithIdentifier:&unk_1F3C22588];
    representativeDisplayType = v18->_representativeDisplayType;
    v18->_representativeDisplayType = (HKDisplayType *)v21;

    BOOL v23 = a6 != 3 && a7 != 0;
    if (a6) {
      BOOL v24 = v23;
    }
    else {
      BOOL v24 = 0;
    }
    [(HKOverlayRoomViewController *)v18 setShouldSelectInitialOverlay:v24];
  }

  return v18;
}

- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  v7 = [(HKOverlayRoomViewController *)self chartController];
  v8 = [v7 stringForValueRange:v6 timeScope:a4];

  return v8;
}

- (BOOL)supportsHealthFactors
{
  return 1;
}

- (BOOL)supportsShowAllFilters
{
  BOOL v3 = [(HKOverlayRoomViewController *)self healthFactorsEnabled];
  if (v3) {
    LOBYTE(v3) = [(HKOverlayRoomViewController *)self controllerMode] != 3;
  }
  return v3;
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  BOOL v3 = HKHealthKitFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"SLEEP_BREATHING_DISTURBANCES" value:&stru_1F3B9CF20 table:@"Localizable-Nebula"];

  return v4;
}

- (id)createChartOverlayViewController
{
  v25[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HKOverlayRoomViewController *)self applicationItems];
  v22 = [(HKAppleSleepingBreathingDisturbancesOverlayRoomViewController *)self _sleepApneaEventDisplayTypeWithApplicationItems:v3];
  BOOL v24 = v22;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v25[0] = v4;
  v5 = [(HKOverlayRoomViewController *)self primaryDisplayType];
  BOOL v23 = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v25[1] = v6;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];

  v7 = [(HKOverlayRoomViewController *)self primaryDisplayType];
  uint64_t v8 = objc_msgSend(v7, "hk_interactiveChartOptions");
  unint64_t v9 = [(HKOverlayRoomViewController *)self additionalChartOptions] | v8;

  if ([(HKOverlayRoomViewController *)self controllerMode] == 3) {
    uint64_t v10 = v9 | 0x12000;
  }
  else {
    uint64_t v10 = v9;
  }
  v11 = [HKInteractiveChartOverlayViewController alloc];
  v12 = +[HKInteractiveChartStackHeight percentStackHeights:&unk_1F3C1FBB8];
  id v13 = [v3 healthStore];
  id v14 = [v3 unitController];
  id v15 = [v3 dateCache];
  id v16 = [v3 chartDataCacheController];
  id v17 = [v3 timeScopeController];
  id v18 = [v3 sampleDateRangeController];
  v19 = [(HKInteractiveChartOverlayViewController *)v11 initWithStackedDisplayTypes:v21 primaryDisplayTypeStackIndex:&unk_1F3C225A0 stackedDisplayTypeHeights:v12 healthStore:v13 unitPreferenceController:v14 dateCache:v15 chartDataCacheController:v16 selectedTimeScopeController:v17 sampleTypeDateRangeController:v18 initialXValue:0 currentCalendarOverride:0 options:v10 timeScopeRanges:0];

  return v19;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [HKAppleSleepingBreathingDisturbancesOverlayRoomViewController alloc];
  v11 = [(HKOverlayRoomViewController *)self factorDisplayTypes];
  v12 = [(HKAppleSleepingBreathingDisturbancesOverlayRoomViewController *)v10 initWithDisplayDate:v9 applicationItems:v8 factorDisplayTypes:v11 mode:a3 preferredOverlay:[(HKAppleSleepingBreathingDisturbancesOverlayRoomViewController *)self preferredOverlay]];

  [(HKOverlayRoomViewController *)v12 setAdditionalChartOptions:[(HKOverlayRoomViewController *)self filteredInteractiveChartOptionsForMode:a3]];
  return v12;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  if (a3 == 3)
  {
    v7 = -[HKAppleSleepingBreathingDisturbancesOverlayRoomViewController _overlayContextContainerWithApplicationItems:overlayChartController:mode:](self, "_overlayContextContainerWithApplicationItems:overlayChartController:mode:", a4, a5, 3, v5);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v7;
}

- (id)_overlayContextContainerWithApplicationItems:(id)a3 overlayChartController:(id)a4 mode:(int64_t)a5
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7 = [(HKOverlayRoomViewController *)self buildFactorContextSectionForChartController];
  if (v7) {
    [v6 addObject:v7];
  }
  id v8 = [[HKOverlayContextSectionContainer alloc] initWithContainerTitle:0 overlayContextSections:v6];
  v11[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  [(HKAppleSleepingBreathingDisturbancesOverlayRoomViewController *)self setPreferredContextLocation:0];
  return v9;
}

- (id)_chartDataSourceWithApplicationItems:(id)a3 displayType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 unitController];
  id v8 = [v6 healthStore];

  id v9 = [MEMORY[0x1E4F2B618] countUnit];
  uint64_t v10 = [[HKQuantityTypeDataSource alloc] initWithUnitController:v7 options:2 displayType:v5 healthStore:v8];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __114__HKAppleSleepingBreathingDisturbancesOverlayRoomViewController__chartDataSourceWithApplicationItems_displayType___block_invoke;
  v13[3] = &unk_1E6D545F8;
  id v14 = v9;
  id v11 = v9;
  [(HKQuantityTypeDataSource *)v10 setUserInfoCreationBlock:v13];

  return v10;
}

HKInteractiveChartSinglePointData *__114__HKAppleSleepingBreathingDisturbancesOverlayRoomViewController__chartDataSourceWithApplicationItems_displayType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(HKInteractiveChartSinglePointData);
  id v5 = [v3 averageQuantity];
  [v5 doubleValueForUnit:*(void *)(a1 + 32)];
  -[HKInteractiveChartSinglePointData setValue:](v4, "setValue:");

  [(HKInteractiveChartSinglePointData *)v4 setUnit:*(void *)(a1 + 32)];
  -[HKInteractiveChartSinglePointData setRecordCount:](v4, "setRecordCount:", [v3 recordCount]);
  id v6 = [v3 statisticsInterval];

  [(HKInteractiveChartSinglePointData *)v4 setStatisticsInterval:v6];
  return v4;
}

- (id)_sleepApneaEventDisplayTypeWithApplicationItems:(id)a3
{
  id v3 = a3;
  v4 = [v3 displayTypeController];
  id v5 = [v4 displayTypeWithIdentifier:&unk_1F3C225B8];

  id v6 = [HKSleepApneaEventInteractiveChartFormatter alloc];
  v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v8 = [v7 localizedStringForKey:@"SLEEP_APNEA_ALERTS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Nebula"];
  id v9 = [(HKSleepApneaEventInteractiveChartFormatter *)v6 initWithLocalizedCategoryName:v8];

  uint64_t v10 = [v5 displayCategory];
  id v11 = [v3 unitController];
  v12 = [v3 chartDataCacheController];

  id v13 = objc_msgSend(v5, "hk_standardSeriesForTimeScope:displayCategory:unitController:dataCacheController:", 5, v10, v11, v12);

  id v14 = [[HKSleepApneaEventAxis alloc] initWithDisplayType:v5];
  [v13 setYAxis:v14];

  id v15 = [HKInteractiveChartDisplayType alloc];
  id v16 = [v5 objectType];
  id v17 = -[HKInteractiveChartDisplayType initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:](v15, "initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:", v13, v5, v9, [v16 code]);

  return v17;
}

- (int64_t)preferredOverlay
{
  return self->_preferredOverlay;
}

- (HKOverlayContextLocation)preferredContextLocation
{
  return self->_preferredContextLocation;
}

- (void)setPreferredContextLocation:(id)a3
{
}

- (HKDisplayType)representativeDisplayType
{
  return self->_representativeDisplayType;
}

- (void)setRepresentativeDisplayType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representativeDisplayType, 0);
  objc_storeStrong((id *)&self->_preferredContextLocation, 0);
}

@end