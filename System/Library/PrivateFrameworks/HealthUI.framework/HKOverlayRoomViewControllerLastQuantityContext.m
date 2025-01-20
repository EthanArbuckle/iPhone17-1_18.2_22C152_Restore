@interface HKOverlayRoomViewControllerLastQuantityContext
- (BOOL)attenuated;
- (BOOL)isEqual:(id)a3;
- (HKDisplayType)overlayDisplayType;
- (HKDisplayTypeContextItem)lastUpdatedContextItem;
- (HKInteractiveChartOverlayNamedDataSource)cacheDataSource;
- (HKInteractiveChartOverlayViewController)overlayChartController;
- (HKOverlayRoomApplicationItems)applicationItems;
- (HKOverlayRoomViewControllerLastQuantityContext)initWithOverlayChartController:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5;
- (HKOverlayRoomViewControllerLastQuantityContext)initWithOverlayChartController:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 attenuated:(BOOL)a6;
- (id)_buildContextWithTime:(id)a3 value:(id)a4 isUnitIncludedInValue:(BOOL)a5;
- (id)_buildFullTitle:(id)a3;
- (id)_buildLastQuantityDisplayType;
- (id)_buildLastValueDataSourceWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5;
- (id)_colorForDisplayType:(id)a3;
- (id)_stringValueFromQuantity:(id)a3 unit:(id)a4 isUnitIncludedInValue:(BOOL *)a5;
- (id)sampleTypeForDateRangeUpdates;
- (int64_t)overlayMode;
- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4;
- (void)invalidateContextItem;
- (void)overlayWasExplicitlySelected:(id)a3 chartController:(id)a4;
- (void)setApplicationItems:(id)a3;
- (void)setAttenuated:(BOOL)a3;
- (void)setCacheDataSource:(id)a3;
- (void)setLastUpdatedContextItem:(id)a3;
- (void)setOverlayChartController:(id)a3;
- (void)setOverlayDisplayType:(id)a3;
- (void)setOverlayMode:(int64_t)a3;
- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7;
@end

@implementation HKOverlayRoomViewControllerLastQuantityContext

- (HKOverlayRoomViewControllerLastQuantityContext)initWithOverlayChartController:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5
{
  return [(HKOverlayRoomViewControllerLastQuantityContext *)self initWithOverlayChartController:a3 applicationItems:a4 mode:a5 attenuated:0];
}

- (HKOverlayRoomViewControllerLastQuantityContext)initWithOverlayChartController:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 attenuated:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v27.receiver = self;
  v27.super_class = (Class)HKOverlayRoomViewControllerLastQuantityContext;
  v13 = [(HKOverlayRoomViewControllerLastQuantityContext *)&v27 init];
  v14 = v13;
  if (v13)
  {
    v13->_attenuated = a6;
    objc_storeStrong((id *)&v13->_overlayChartController, a3);
    objc_storeStrong((id *)&v14->_applicationItems, a4);
    v15 = [v12 unitController];
    v16 = [v11 primaryDisplayType];
    v17 = [v12 healthStore];
    uint64_t v18 = [(HKOverlayRoomViewControllerLastQuantityContext *)v14 _buildLastValueDataSourceWithUnitController:v15 displayType:v16 healthStore:v17];
    cacheDataSource = v14->_cacheDataSource;
    v14->_cacheDataSource = (HKInteractiveChartOverlayNamedDataSource *)v18;

    v14->_overlayMode = a5;
    uint64_t v20 = [(HKOverlayRoomViewControllerLastQuantityContext *)v14 _buildLastQuantityDisplayType];
    overlayDisplayType = v14->_overlayDisplayType;
    v14->_overlayDisplayType = (HKDisplayType *)v20;

    v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v23 = [v22 localizedStringForKey:@"NO_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    uint64_t v24 = [(HKOverlayRoomViewControllerLastQuantityContext *)v14 _buildContextWithTime:&stru_1F3B9CF20 value:v23 isUnitIncludedInValue:0];
    lastUpdatedContextItem = v14->_lastUpdatedContextItem;
    v14->_lastUpdatedContextItem = (HKDisplayTypeContextItem *)v24;
  }
  return v14;
}

- (id)sampleTypeForDateRangeUpdates
{
  v2 = [(HKOverlayRoomViewControllerLastQuantityContext *)self overlayChartController];
  v3 = [v2 primaryDisplayType];
  v4 = [v3 objectType];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  id v8 = a7;
  v9 = [(HKOverlayRoomViewControllerLastQuantityContext *)self sampleTypeForDateRangeUpdates];
  v10 = [(HKOverlayRoomViewControllerLastQuantityContext *)self applicationItems];
  id v11 = [v10 healthStore];

  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __133__HKOverlayRoomViewControllerLastQuantityContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
  v21 = &unk_1E6D518D8;
  id v12 = v8;
  v22 = self;
  id v23 = v12;
  v13 = _Block_copy(&v18);
  if (self->_attenuated
    && (objc_msgSend(v9, "identifier", v18, v19, v20, v21),
        v14 = objc_claimAutoreleasedReturnValue(),
        v15 = (void *)*MEMORY[0x1E4F2A7F0],
        v14,
        v14 == v15))
  {
    uint64_t v16 = [MEMORY[0x1E4F2B0B8] queryForMostRecentAttenuatedEAEQuantityWithHealthStore:v11 completion:v13];
  }
  else
  {
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F2B0B8], "queryForMostRecentQuantityOfType:healthStore:predicate:completion:", v9, v11, 0, v13, v18, v19, v20, v21);
  }
  v17 = (void *)v16;
  [v11 executeQuery:v16];
}

void __133__HKOverlayRoomViewControllerLastQuantityContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  v9 = v8;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __133__HKOverlayRoomViewControllerLastQuantityContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2;
    v12[3] = &unk_1E6D518B0;
    id v10 = v8;
    uint64_t v11 = *(void *)(a1 + 32);
    id v13 = v10;
    uint64_t v14 = v11;
    id v15 = v7;
    id v16 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], v12);
  }
}

void __133__HKOverlayRoomViewControllerLastQuantityContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) endDate];
  v3 = [*(id *)(a1 + 40) applicationItems];
  v4 = [v3 dateCache];
  id v5 = HKMostRecentSampleEndDateText(v2, v4, 0);

  v6 = [*(id *)(a1 + 40) applicationItems];
  id v7 = [v6 unitController];
  id v8 = [*(id *)(a1 + 40) overlayDisplayType];
  v9 = [v7 unitForDisplayType:v8];

  unsigned __int8 v12 = 0;
  id v10 = [*(id *)(a1 + 40) _stringValueFromQuantity:*(void *)(a1 + 48) unit:v9 isUnitIncludedInValue:&v12];
  uint64_t v11 = [*(id *)(a1 + 40) _buildContextWithTime:v5 value:v10 isUnitIncludedInValue:v12];
  [*(id *)(a1 + 40) setLastUpdatedContextItem:v11];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (void)invalidateContextItem
{
  v3 = [(HKOverlayRoomViewControllerLastQuantityContext *)self applicationItems];
  v4 = [v3 unitController];
  id v5 = [(HKOverlayRoomViewControllerLastQuantityContext *)self overlayChartController];
  v6 = [v5 primaryDisplayType];
  id v7 = [(HKOverlayRoomViewControllerLastQuantityContext *)self applicationItems];
  id v8 = [v7 healthStore];
  v9 = [(HKOverlayRoomViewControllerLastQuantityContext *)self _buildLastValueDataSourceWithUnitController:v4 displayType:v6 healthStore:v8];
  cacheDataSource = self->_cacheDataSource;
  self->_cacheDataSource = v9;

  uint64_t v11 = [(HKOverlayRoomViewControllerLastQuantityContext *)self _buildLastQuantityDisplayType];
  overlayDisplayType = self->_overlayDisplayType;
  self->_overlayDisplayType = v11;

  id v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v13 = [v16 localizedStringForKey:@"NO_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v14 = [(HKOverlayRoomViewControllerLastQuantityContext *)self _buildContextWithTime:&stru_1F3B9CF20 value:v13 isUnitIncludedInValue:0];
  lastUpdatedContextItem = self->_lastUpdatedContextItem;
  self->_lastUpdatedContextItem = v14;
}

- (void)overlayWasExplicitlySelected:(id)a3 chartController:(id)a4
{
}

- (id)_buildLastQuantityDisplayType
{
  v3 = [(HKOverlayRoomViewControllerLastQuantityContext *)self overlayChartController];
  v4 = [v3 primaryDisplayType];

  id v5 = [v4 objectType];
  v6 = [v5 identifier];

  id v7 = [(HKOverlayRoomViewControllerLastQuantityContext *)self _colorForDisplayType:v4];
  id v8 = objc_msgSend(v4, "hk_interactiveChartsFormatterForTimeScope:", 5);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 setOverrideStatFormatterItemOptions:&unk_1F3C1F138];
  }
  v9 = [(HKOverlayRoomViewControllerLastQuantityContext *)self overlayChartController];
  id v10 = [(HKOverlayRoomViewControllerLastQuantityContext *)self applicationItems];
  uint64_t v11 = [v10 displayTypeController];
  unsigned __int8 v12 = [v9 displayTypeForQuantityIdentifier:v6 timeScope:5 displayTypeController:v11 overlayColor:v7 cacheDataSource:self->_cacheDataSource alternateLineSeries:0 alternateFormatter:v8 seriesOptions:9];

  return v12;
}

- (id)_buildLastValueDataSourceWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [HKMostRecentValueQuantityTypeDataSource alloc];
  unsigned __int8 v12 = [(HKInteractiveChartViewController *)self->_overlayChartController currentCalendar];
  id v13 = [(HKMostRecentValueQuantityTypeDataSource *)v11 initWithUnitController:v8 displayType:v9 healthStore:v10 currentCalendar:v12 attenuated:self->_attenuated];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __118__HKOverlayRoomViewControllerLastQuantityContext__buildLastValueDataSourceWithUnitController_displayType_healthStore___block_invoke;
  v22[3] = &unk_1E6D51900;
  id v23 = v8;
  id v24 = v9;
  id v14 = v9;
  id v15 = v8;
  [(HKQuantityTypeDataSource *)v13 setUserInfoCreationBlock:v22];
  id v16 = NSString;
  v17 = [v14 objectType];
  uint64_t v18 = [v17 identifier];
  uint64_t v19 = [v16 stringWithFormat:@"LAST_QUANTITY_CONTEXT_%@", v18];

  uint64_t v20 = [[HKInteractiveChartOverlayNamedDataSource alloc] initWithDataSource:v13 named:v19 withContextTitleForTimeScope:0];
  return v20;
}

HKInteractiveChartSinglePointData *__118__HKOverlayRoomViewControllerLastQuantityContext__buildLastValueDataSourceWithUnitController_displayType_healthStore___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v2 unitForDisplayType:v3];
  v6 = objc_alloc_init(HKInteractiveChartSinglePointData);
  id v7 = [v4 mostRecentQuantity];
  [v7 doubleValueForUnit:v5];
  -[HKInteractiveChartSinglePointData setValue:](v6, "setValue:");

  [(HKInteractiveChartSinglePointData *)v6 setUnit:v5];
  [(HKInteractiveChartSinglePointData *)v6 setRecordCount:1];
  id v8 = [v4 statisticsInterval];

  [(HKInteractiveChartSinglePointData *)v6 setStatisticsInterval:v8];
  return v6;
}

- (id)_buildContextWithTime:(id)a3 value:(id)a4 isUnitIncludedInValue:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKOverlayRoomViewControllerLastQuantityContext *)self overlayChartController];
  uint64_t v11 = [v10 primaryDisplayType];

  unsigned __int8 v12 = objc_alloc_init(HKDisplayTypeContextItem);
  if ([v8 length])
  {
    id v13 = [(HKOverlayRoomViewControllerLastQuantityContext *)self _buildFullTitle:v8];
    [(HKDisplayTypeContextItem *)v12 setTitle:v13];
  }
  else
  {
    id v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v14 = [v13 localizedStringForKey:@"LATEST_NO_TIME" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [(HKDisplayTypeContextItem *)v12 setTitle:v14];
  }
  id v15 = objc_msgSend(NSString, "hk_chartOverlayAccessibilityIdentifier:", @"Latest");
  [(HKDisplayTypeContextItem *)v12 setAccessibilityIdentifier:v15];

  [(HKDisplayTypeContextItem *)v12 setInfoHidden:1];
  id v16 = [(HKOverlayRoomViewControllerLastQuantityContext *)self applicationItems];
  v17 = [v16 unitController];
  uint64_t v18 = [v17 localizedDisplayNameForDisplayType:v11];
  [(HKDisplayTypeContextItem *)v12 setUnit:v18];

  -[HKDisplayTypeContextItem setUseTightSpacingBetweenValueAndUnit:](v12, "setUseTightSpacingBetweenValueAndUnit:", [v11 contextItemShouldUseTightSpacingBetweenValueAndUnit]);
  [(HKDisplayTypeContextItem *)v12 setIsUnitIncludedInValue:v5];
  [(HKDisplayTypeContextItem *)v12 setValue:v9];

  uint64_t v19 = +[HKOverlayContextUtilities defaultMetricColorsForOverlayMode:[(HKOverlayRoomViewControllerLastQuantityContext *)self overlayMode]];
  [(HKDisplayTypeContextItem *)v12 setMetricColors:v19];

  uint64_t v20 = +[HKOverlayContextUtilities selectedMetricColorsForCategory:](HKOverlayContextUtilities, "selectedMetricColorsForCategory:", [v11 categoryIdentifier]);
  [(HKDisplayTypeContextItem *)v12 setSelectedMetricColors:v20];

  return v12;
}

- (id)_buildFullTitle:(id)a3
{
  uint64_t v3 = NSString;
  id v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  v6 = [v4 bundleWithIdentifier:@"com.apple.HealthUI"];
  id v7 = [v6 localizedStringForKey:@"LATEST_WITH_TIME" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  id v8 = objc_msgSend(v3, "stringWithFormat:", v7, v5);

  return v8;
}

- (id)_colorForDisplayType:(id)a3
{
  uint64_t v3 = +[HKDisplayCategory categoryWithID:](HKDisplayCategory, "categoryWithID:", [a3 categoryIdentifier]);
  id v4 = [v3 color];

  return v4;
}

- (id)_stringValueFromQuantity:(id)a3 unit:(id)a4 isUnitIncludedInValue:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = [(HKOverlayRoomViewControllerLastQuantityContext *)self overlayChartController];
    uint64_t v11 = [v10 primaryDisplayType];

    unsigned __int8 v12 = [v11 presentation];
    id v13 = NSNumber;
    [v8 doubleValueForUnit:v9];
    id v14 = objc_msgSend(v13, "numberWithDouble:");
    id v15 = [v12 adjustedValueForDaemonValue:v14];

    id v16 = objc_msgSend(v11, "hk_valueFormatterForUnit:", v9);
    v17 = [(HKOverlayRoomViewControllerLastQuantityContext *)self applicationItems];
    uint64_t v18 = [v17 unitController];
    uint64_t v19 = [v16 stringFromValue:v15 displayType:v11 unitController:v18];

    if (a5) {
      *a5 = 1;
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v19 = [v11 localizedStringForKey:@"NO_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (int64_t)overlayMode
{
  return self->_overlayMode;
}

- (void)setOverlayMode:(int64_t)a3
{
  self->_overlayMode = a3;
}

- (HKInteractiveChartOverlayViewController)overlayChartController
{
  return self->_overlayChartController;
}

- (void)setOverlayChartController:(id)a3
{
}

- (HKOverlayRoomApplicationItems)applicationItems
{
  return self->_applicationItems;
}

- (void)setApplicationItems:(id)a3
{
}

- (HKDisplayType)overlayDisplayType
{
  return self->_overlayDisplayType;
}

- (void)setOverlayDisplayType:(id)a3
{
}

- (HKDisplayTypeContextItem)lastUpdatedContextItem
{
  return self->_lastUpdatedContextItem;
}

- (void)setLastUpdatedContextItem:(id)a3
{
}

- (HKInteractiveChartOverlayNamedDataSource)cacheDataSource
{
  return self->_cacheDataSource;
}

- (void)setCacheDataSource:(id)a3
{
}

- (BOOL)attenuated
{
  return self->_attenuated;
}

- (void)setAttenuated:(BOOL)a3
{
  self->_attenuated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDataSource, 0);
  objc_storeStrong((id *)&self->_lastUpdatedContextItem, 0);
  objc_storeStrong((id *)&self->_overlayDisplayType, 0);
  objc_storeStrong((id *)&self->_applicationItems, 0);
  objc_storeStrong((id *)&self->_overlayChartController, 0);
}

@end