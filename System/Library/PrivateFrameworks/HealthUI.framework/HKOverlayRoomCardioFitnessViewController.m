@interface HKOverlayRoomCardioFitnessViewController
- (BOOL)infographicSupportedForDisplayType:(id)a3 healthStore:(id)a4;
- (HKCardioFitnessLevelData)initialCardioFitnessLevelData;
- (HKChartSummaryTrendModel)trendModel;
- (HKDisplayType)representativeDisplayType;
- (HKOverlayContextLocation)preferredContextLocation;
- (HKOverlayRoomCardioFitnessViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 preferredOverlay:(int64_t)a6 analyticsDelegate:(id)a7 interactiveChartOptions:(unint64_t)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10;
- (HKOverlayRoomCardioFitnessViewControllerAnalyticsDelegate)analyticsDelegate;
- (NSMutableArray)contextDelegates;
- (id)_buildCardioFitnessLevelDataSourceWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5 cardioFitnessLevel:(int64_t)a6;
- (id)_buildTrendContextFromApplicationItems:(id)a3 overlayChartController:(id)a4 overlayMode:(int64_t)a5;
- (id)_configureContextSectionsForFullMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5 trendModel:(id)a6;
- (id)_configureContextSectionsForSingleOverlayMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5 trendModel:(id)a6;
- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)controllerTitleWithApplicationItems:(id)a3;
- (id)createChartOverlayViewController;
- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5;
- (id)infographicViewControllerForDisplayType:(id)a3 healthStore:(id)a4;
- (id)initialSelectedContextForMode:(int64_t)a3 containerIndex:(int64_t)a4;
- (id)primaryDisplayTypeWithApplicationItems:(id)a3;
- (id)showAllFiltersButtonTitle;
- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4;
- (int64_t)_cardioFitnessLevelForPreferredOverlay:(int64_t)a3;
- (int64_t)_preferredOverlayForCardioFitnessLevel:(int64_t)a3;
- (int64_t)preferredOverlay;
- (void)contextDidUpdate:(id)a3 withCardioFitnessLevelData:(id)a4;
- (void)didChangeFromContextItem:(id)a3 toContextItem:(id)a4;
- (void)setContextDelegates:(id)a3;
- (void)setInitialCardioFitnessLevelData:(id)a3;
- (void)setPreferredContextLocation:(id)a3;
- (void)setRepresentativeDisplayType:(id)a3;
@end

@implementation HKOverlayRoomCardioFitnessViewController

- (HKOverlayRoomCardioFitnessViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 preferredOverlay:(int64_t)a6 analyticsDelegate:(id)a7 interactiveChartOptions:(unint64_t)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10
{
  id v34 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a9;
  id v19 = a10;
  if ((unint64_t)a6 > 0xB || ((1 << a6) & 0x9E1) == 0)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"HKOverlayRoomCardioFitnessViewController.m", 138, @"Invalid parameter not satisfying: %@", @"_isPreferredOverlaySupported(preferredOverlay)" object file lineNumber description];
  }
  uint64_t v20 = +[HKOverlayRoomTrendContext findInitialDateFromTrendModel:v18];
  v21 = (void *)v20;
  v22 = v34;
  if (v20) {
    v22 = (void *)v20;
  }
  id v23 = v22;

  v35.receiver = self;
  v35.super_class = (Class)HKOverlayRoomCardioFitnessViewController;
  v24 = [(HKOverlayRoomViewController *)&v35 initWithDisplayDate:v23 applicationItems:v16 factorDisplayTypes:v19 mode:a5];

  if (v24)
  {
    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    contextDelegates = v24->_contextDelegates;
    v24->_contextDelegates = v25;

    v24->_preferredOverlay = a6;
    preferredContextLocation = v24->_preferredContextLocation;
    v24->_preferredContextLocation = 0;

    objc_storeWeak((id *)&v24->_analyticsDelegate, v17);
    objc_storeStrong((id *)&v24->_trendModel, a9);
    if (a5 == 3)
    {
      uint64_t v28 = 0;
    }
    else
    {
      unsigned int v29 = [v18 selectTrendInitially];
      if (a5) {
        BOOL v30 = a6 == 0;
      }
      else {
        BOOL v30 = 1;
      }
      if (v30) {
        uint64_t v28 = v29;
      }
      else {
        uint64_t v28 = 1;
      }
    }
    [(HKOverlayRoomViewController *)v24 setShouldSelectInitialOverlay:v28];
    [(HKOverlayRoomViewController *)v24 setAdditionalChartOptions:a8];
  }

  return v24;
}

- (id)createChartOverlayViewController
{
  if ([(HKOverlayRoomViewController *)self controllerMode] != 3)
  {
    v3 = [(HKOverlayRoomCardioFitnessViewController *)self trendModel];
    int64_t v4 = +[HKOverlayRoomTrendContext findStartingTimeScopeFromTrendModel:v3];

    if (v4 != 8)
    {
      v5 = [(HKOverlayRoomViewController *)self applicationItems];
      v6 = [v5 timeScopeController];
      [v6 setSelectedTimeScope:v4];
    }
  }
  v7 = [(HKOverlayRoomCardioFitnessViewController *)self trendModel];
  if (v7)
  {
    v8 = [(HKOverlayRoomCardioFitnessViewController *)self trendModel];
    int v9 = [v8 selectTrendInitially];

    if (v9) {
      uint64_t v10 = 73728;
    }
    else {
      uint64_t v10 = 0x10000;
    }
  }
  else
  {
    uint64_t v10 = 0x10000;
  }

  v11 = [(HKOverlayRoomViewController *)self primaryDisplayType];
  uint64_t v12 = objc_msgSend(v11, "hk_interactiveChartOptions");
  unint64_t v27 = v10 | [(HKOverlayRoomViewController *)self additionalChartOptions] | v12;

  v26 = [HKInteractiveChartOverlayViewController alloc];
  BOOL v30 = [(HKOverlayRoomViewController *)self applicationItems];
  v31 = [v30 healthStore];
  v24 = [(HKOverlayRoomViewController *)self primaryDisplayType];
  unsigned int v29 = [(HKOverlayRoomViewController *)self applicationItems];
  v13 = [v29 unitController];
  uint64_t v28 = [(HKOverlayRoomViewController *)self applicationItems];
  uint64_t v14 = [v28 dateCache];
  v25 = [(HKOverlayRoomViewController *)self applicationItems];
  v15 = [v25 chartDataCacheController];
  id v16 = [(HKOverlayRoomViewController *)self applicationItems];
  id v17 = [v16 timeScopeController];
  id v18 = [(HKOverlayRoomViewController *)self applicationItems];
  id v19 = [v18 sampleDateRangeController];
  uint64_t v20 = [(HKOverlayRoomViewController *)self displayDate];
  v21 = (void *)v14;
  v22 = [(HKInteractiveChartOverlayViewController *)v26 initWithHealthStore:v31 primaryDisplayType:v24 unitPreferenceController:v13 dateCache:v14 chartDataCacheController:v15 selectedTimeScopeController:v17 sampleTypeDateRangeController:v19 initialXValue:v20 currentCalendarOverride:0 options:v27];

  [(HKInteractiveChartViewController *)v22 setCurrentValueViewDataSourceDelegate:self];
  return v22;
}

- (BOOL)infographicSupportedForDisplayType:(id)a3 healthStore:(id)a4
{
  return 1;
}

- (id)infographicViewControllerForDisplayType:(id)a3 healthStore:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[HKPopulationNormsChartViewController alloc] initWithDisplayType:v6 healthStore:v5];

  if (v7) {
    v8 = [[HKModalNavigationController alloc] initWithRootViewController:v7];
  }
  else {
    v8 = 0;
  }

  return v8;
}

- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  v7 = [(HKOverlayRoomViewController *)self chartController];
  v8 = [v7 stringForValueRange:v6 timeScope:a4];

  return v8;
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  v3 = HKHealthKitFrameworkBundle();
  int64_t v4 = [v3 localizedStringForKey:@"CARDIO_FITNESS" value:&stru_1F3B9CF20 table:@"Localizable-CardioFitness"];

  return v4;
}

- (id)showAllFiltersButtonTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"SHOW_ALL_CARDIO_FITNESS_LEVELS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-CardioFitness"];

  return v3;
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  int64_t v4 = (void *)MEMORY[0x1E4F2B2C0];
  uint64_t v5 = *MEMORY[0x1E4F2A918];
  id v6 = a3;
  v7 = [v4 quantityTypeForIdentifier:v5];
  v8 = [v6 displayTypeController];
  int v9 = [v8 displayTypeForObjectType:v7];

  [(HKOverlayRoomCardioFitnessViewController *)self setRepresentativeDisplayType:v9];
  uint64_t v10 = [v9 displayCategory];
  v11 = [v6 unitController];
  uint64_t v12 = [v6 chartDataCacheController];
  v13 = objc_msgSend(v9, "hk_standardSeriesForTimeScope:displayCategory:unitController:dataCacheController:", 5, v10, v11, v12);

  uint64_t v14 = objc_alloc_init(HKChartCache);
  v15 = [v6 unitController];
  id v16 = [v6 healthStore];
  id v17 = [v9 cardioFitnessDataSourceWithUnitController:v15 healthStore:v16];
  [(HKChartCache *)v14 setDataSource:v17];

  id v18 = +[HKOutstandingFetchOperationManager sharedOperationManager];
  [(HKChartCache *)v14 setOperationManager:v18];

  id v19 = [v6 chartDataCacheController];

  [v19 addCustomChartCache:v14 forDisplayType:v9];
  uint64_t v20 = objc_alloc_init(HKCacheBackedChartSeriesDataSource);
  [(HKCacheBackedChartSeriesDataSource *)v20 setChartCache:v14];
  [v13 setDataSource:v20];
  v21 = objc_alloc_init(HKInteractiveChartCardioFitnessFormatter);
  v22 = [HKInteractiveChartDisplayType alloc];
  id v23 = [v9 objectType];
  v24 = -[HKInteractiveChartDisplayType initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:](v22, "initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:", v13, v9, v21, [v23 code]);

  return v24;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(HKOverlayRoomCardioFitnessViewController *)self contextDelegates];
  [v10 removeAllObjects];

  if ((unint64_t)(a3 - 1) < 2)
  {
    v11 = [HKOverlayContextSectionContainer alloc];
    uint64_t v12 = [(HKOverlayRoomCardioFitnessViewController *)self trendModel];
    v13 = [(HKOverlayRoomCardioFitnessViewController *)self _configureContextSectionsForSingleOverlayMode:a3 applicationItems:v8 overlayChartController:v9 trendModel:v12];
    uint64_t v14 = [(HKOverlayContextSectionContainer *)v11 initWithContainerTitle:0 overlayContextSections:v13];
    v20[0] = v14;
    v15 = (HKOverlayContextSectionContainer **)v20;
LABEL_5:
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

    goto LABEL_7;
  }
  if (a3 == 3)
  {
    id v16 = [HKOverlayContextSectionContainer alloc];
    uint64_t v12 = [(HKOverlayRoomCardioFitnessViewController *)self trendModel];
    v13 = [(HKOverlayRoomCardioFitnessViewController *)self _configureContextSectionsForFullMode:3 applicationItems:v8 overlayChartController:v9 trendModel:v12];
    uint64_t v14 = [(HKOverlayContextSectionContainer *)v16 initWithContainerTitle:0 overlayContextSections:v13];
    id v19 = v14;
    v15 = &v19;
    goto LABEL_5;
  }
  id v17 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_7:

  return v17;
}

- (id)initialSelectedContextForMode:(int64_t)a3 containerIndex:(int64_t)a4
{
  if ([(HKOverlayRoomViewController *)self containerIndexForHealthFactors] == a4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(HKOverlayRoomCardioFitnessViewController *)self preferredContextLocation];
  }
  return v5;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  int64_t preferredOverlay = self->_preferredOverlay;
  if (preferredOverlay == 11 || preferredOverlay == 0) {
    int64_t preferredOverlay = [(HKOverlayRoomCardioFitnessViewController *)self _preferredOverlayForCardioFitnessLevel:[(HKCardioFitnessLevelData *)self->_initialCardioFitnessLevelData cardioFitnessLevel]];
  }
  unint64_t v12 = [(HKOverlayRoomViewController *)self filteredInteractiveChartOptionsForMode:a3];
  v13 = [HKOverlayRoomCardioFitnessViewController alloc];
  uint64_t v14 = [(HKOverlayRoomCardioFitnessViewController *)self analyticsDelegate];
  v15 = [(HKOverlayRoomCardioFitnessViewController *)self trendModel];
  id v16 = [(HKOverlayRoomViewController *)self factorDisplayTypes];
  id v17 = [(HKOverlayRoomCardioFitnessViewController *)v13 initWithDisplayDate:v8 applicationItems:v9 mode:a3 preferredOverlay:preferredOverlay analyticsDelegate:v14 interactiveChartOptions:v12 trendModel:v15 factorDisplayTypes:v16];

  return v17;
}

- (void)didChangeFromContextItem:(id)a3 toContextItem:(id)a4
{
  unint64_t v13 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (v13 | v6)
  {
    v7 = [(id)v13 analyticsIdentifier];
    id v8 = [(id)v6 analyticsIdentifier];
    char v9 = [v7 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = [(HKOverlayRoomCardioFitnessViewController *)self analyticsDelegate];
      v11 = [(id)v13 analyticsIdentifier];
      unint64_t v12 = [(id)v6 analyticsIdentifier];
      [v10 didChangeFromOverlayWithIdentifier:v11 toOverlayWithIdentifier:v12];
    }
  }
}

- (void)contextDidUpdate:(id)a3 withCardioFitnessLevelData:(id)a4
{
  id v6 = a4;
  uint64_t v5 = [(HKOverlayRoomCardioFitnessViewController *)self initialCardioFitnessLevelData];

  if (!v5)
  {
    [(HKOverlayRoomCardioFitnessViewController *)self setInitialCardioFitnessLevelData:v6];
    [(HKOverlayRoomViewController *)self setShouldSelectInitialOverlay:1];
    [(HKOverlayRoomViewController *)self reloadOverlayContextItems];
  }
}

- (id)_configureContextSectionsForSingleOverlayMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5 trendModel:(id)a6
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HKOverlayRoomCardioFitnessViewController *)self trendModel];
  if (v11)
  {
    unint64_t v12 = (void *)v11;
    unint64_t v13 = [(HKOverlayRoomCardioFitnessViewController *)self trendModel];
    int v14 = [v13 selectTrendInitially];

    if (v14)
    {
      v15 = [(HKOverlayRoomCardioFitnessViewController *)self _buildTrendContextFromApplicationItems:v9 overlayChartController:v10 overlayMode:a3];
LABEL_11:
      v22 = (_HKCardioFitnessLevelContext *)v15;
      goto LABEL_12;
    }
  }
  int64_t v16 = [(HKOverlayRoomCardioFitnessViewController *)self preferredOverlay];
  if (v16 == 11 || !v16)
  {
    id v17 = [(HKOverlayRoomCardioFitnessViewController *)self initialCardioFitnessLevelData];

    if (!v17)
    {
      v15 = [[_HKCardioFitnessClassificationContext alloc] initWithMode:a3 applicationItems:v9 overlayChartController:v10 delegate:self];
      goto LABEL_11;
    }
  }
  uint64_t v18 = [(HKOverlayRoomCardioFitnessViewController *)self _cardioFitnessLevelForPreferredOverlay:[(HKOverlayRoomCardioFitnessViewController *)self preferredOverlay]];
  if (v18 == -1)
  {
    id v19 = [(HKOverlayRoomCardioFitnessViewController *)self initialCardioFitnessLevelData];
    uint64_t v18 = [v19 cardioFitnessLevel];
  }
  uint64_t v20 = [_HKCardioFitnessLevelContext alloc];
  v21 = [(HKOverlayRoomCardioFitnessViewController *)self representativeDisplayType];
  v22 = [(_HKCardioFitnessLevelContext *)v20 initWithMode:a3 applicationItems:v9 overlayChartController:v10 baseDisplayType:v21 cardioFitnessLevel:v18];

LABEL_12:
  id v23 = [[HKOverlayContextLocation alloc] initWithContainerIndex:0 sectionIndex:0 itemIndex:0];
  [(HKOverlayRoomCardioFitnessViewController *)self setPreferredContextLocation:v23];

  v24 = [HKOverlayContextSection alloc];
  v30[0] = v22;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  v26 = [(HKOverlayContextSection *)v24 initWithSectionTitle:0 overlayContextItems:v25];

  unsigned int v29 = v26;
  unint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];

  return v27;
}

- (id)_configureContextSectionsForFullMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5 trendModel:(id)a6
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v37 = a4;
  id v10 = a5;
  id v36 = a6;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int64_t v12 = [(HKOverlayRoomCardioFitnessViewController *)self _cardioFitnessLevelForPreferredOverlay:[(HKOverlayRoomCardioFitnessViewController *)self preferredOverlay]];
  unint64_t v13 = 0;
  for (uint64_t i = 3; i != -1; --i)
  {
    v15 = [_HKCardioFitnessLevelContext alloc];
    int64_t v16 = [(HKOverlayRoomCardioFitnessViewController *)self representativeDisplayType];
    id v17 = [(_HKCardioFitnessLevelContext *)v15 initWithMode:a3 applicationItems:v37 overlayChartController:v10 baseDisplayType:v16 cardioFitnessLevel:i];

    [v11 addObject:v17];
    if (v12 == i)
    {
      uint64_t v18 = v17;

      unint64_t v13 = v18;
    }
  }
  if (v36)
  {
    id v19 = [(HKOverlayRoomCardioFitnessViewController *)self _buildTrendContextFromApplicationItems:v37 overlayChartController:v10 overlayMode:a3];
    uint64_t v20 = [HKOverlayContextSection alloc];
    v40[0] = v19;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    v22 = [(HKOverlayContextSection *)v20 initWithSectionTitle:0 overlayContextItems:v21];

    id v23 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v24 = [v23 localizedStringForKey:@"CARDIO_FITNESS_LEVELS_VIEW_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-CardioFitness"];
  }
  else
  {
    v22 = 0;
    v24 = 0;
  }
  v25 = [[HKOverlayContextSection alloc] initWithSectionTitle:v24 overlayContextItems:v11];
  if (v13)
  {
    if (v36 && [v36 selectTrendInitially])
    {
      v26 = [HKOverlayContextLocation alloc];
      BOOL v27 = 0;
      uint64_t v28 = 0;
    }
    else
    {
      uint64_t v29 = [v11 indexOfObject:v13];
      v26 = [HKOverlayContextLocation alloc];
      BOOL v27 = v22 != 0;
      uint64_t v28 = v29;
    }
    BOOL v30 = [(HKOverlayContextLocation *)v26 initWithContainerIndex:0 sectionIndex:v27 itemIndex:v28];
    [(HKOverlayRoomCardioFitnessViewController *)self setPreferredContextLocation:v30];
  }
  if (v22)
  {
    v39[0] = v22;
    v39[1] = v25;
    v31 = (void *)MEMORY[0x1E4F1C978];
    v32 = (HKOverlayContextSection **)v39;
    uint64_t v33 = 2;
  }
  else
  {
    v38 = v25;
    v31 = (void *)MEMORY[0x1E4F1C978];
    v32 = &v38;
    uint64_t v33 = 1;
  }
  id v34 = [v31 arrayWithObjects:v32 count:v33];

  return v34;
}

- (id)_buildTrendContextFromApplicationItems:(id)a3 overlayChartController:(id)a4 overlayMode:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(HKOverlayRoomCardioFitnessViewController *)self primaryDisplayTypeWithApplicationItems:v9];
  id v11 = [HKOverlayRoomTrendContext alloc];
  int64_t v12 = [(HKOverlayRoomCardioFitnessViewController *)self trendModel];
  unint64_t v13 = [(HKOverlayRoomTrendContext *)v11 initWithBaseDisplayType:v10 trendModel:v12 overlayChartController:v8 applicationItems:v9 overlayMode:a5];

  int v14 = [(HKOverlayRoomViewController *)self chartController];
  [v14 setTrendAccessibilityDelegate:v13];

  return v13;
}

- (id)_buildCardioFitnessLevelDataSourceWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5 cardioFitnessLevel:(int64_t)a6
{
  v7 = [a4 cardioFitnessDataSourceWithUnitController:a3 healthStore:a5];
  id v8 = [HKInteractiveChartOverlayNamedDataSource alloc];
  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"HKCardioFitnessLevel_%ld", a6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __140__HKOverlayRoomCardioFitnessViewController__buildCardioFitnessLevelDataSourceWithUnitController_displayType_healthStore_cardioFitnessLevel___block_invoke;
  v12[3] = &__block_descriptor_40_e18___NSString_16__0q8l;
  v12[4] = a6;
  id v10 = [(HKInteractiveChartOverlayNamedDataSource *)v8 initWithDataSource:v7 named:v9 withContextTitleForTimeScope:v12];

  return v10;
}

id __140__HKOverlayRoomCardioFitnessViewController__buildCardioFitnessLevelDataSourceWithUnitController_displayType_healthStore_cardioFitnessLevel___block_invoke(uint64_t a1)
{
  return +[HKCardioFitnessUtilities localizedStringForCardioFitnessTitle:*(void *)(a1 + 32)];
}

- (int64_t)_cardioFitnessLevelForPreferredOverlay:(int64_t)a3
{
  if ((unint64_t)(a3 - 5) >= 4) {
    return -1;
  }
  else {
    return 8 - a3;
  }
}

- (int64_t)_preferredOverlayForCardioFitnessLevel:(int64_t)a3
{
  if ((unint64_t)a3 >= 4) {
    return 0;
  }
  else {
    return 8 - a3;
  }
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

- (HKCardioFitnessLevelData)initialCardioFitnessLevelData
{
  return self->_initialCardioFitnessLevelData;
}

- (void)setInitialCardioFitnessLevelData:(id)a3
{
}

- (HKDisplayType)representativeDisplayType
{
  return self->_representativeDisplayType;
}

- (void)setRepresentativeDisplayType:(id)a3
{
}

- (HKOverlayRoomCardioFitnessViewControllerAnalyticsDelegate)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
  return (HKOverlayRoomCardioFitnessViewControllerAnalyticsDelegate *)WeakRetained;
}

- (HKChartSummaryTrendModel)trendModel
{
  return self->_trendModel;
}

- (HKOverlayContextLocation)preferredContextLocation
{
  return self->_preferredContextLocation;
}

- (void)setPreferredContextLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContextLocation, 0);
  objc_storeStrong((id *)&self->_trendModel, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_representativeDisplayType, 0);
  objc_storeStrong((id *)&self->_initialCardioFitnessLevelData, 0);
  objc_storeStrong((id *)&self->_contextDelegates, 0);
}

@end