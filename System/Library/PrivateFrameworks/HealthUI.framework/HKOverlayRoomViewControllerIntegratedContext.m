@interface HKOverlayRoomViewControllerIntegratedContext
+ (id)distributionContextWithStyle:(int64_t)a3 namedPredicate:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 optionalDelegate:(id)a7 options:(int64_t)a8 mode:(int64_t)a9;
+ (id)quantityContextWithIdentifier:(id)a3 overlayChartController:(id)a4 applicationItems:(id)a5 optionalDelegate:(id)a6 seriesOptions:(int64_t)a7 mode:(int64_t)a8;
+ (id)quantityContextWithIdentifier:(id)a3 overlayChartController:(id)a4 applicationItems:(id)a5 optionalDelegate:(id)a6 seriesOptions:(int64_t)a7 mode:(int64_t)a8 optionalBaseDisplayType:(id)a9;
- (BOOL)_obsoleteDateRange:(id)a3;
- (HKDisplayTypeContextItem)lastUpdatedContextItem;
- (HKInteractiveChartOverlayViewController)overlayChartController;
- (HKOverlayRoomApplicationItems)applicationItems;
- (HKOverlayRoomViewControllerIntegratedContext)initWithOverlayChartController:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5;
- (HKSampleType)monitoringSampleType;
- (NSMutableDictionary)displayTypesForTimeScopes;
- (id)_buildMonitoringSampleType;
- (id)_minMaxValueFromChartPoints:(id)a3 displayType:(id)a4 unitPreferenceController:(id)a5 isUnitIncludedInValue:(BOOL *)a6;
- (id)buildContextItemWithValue:(id)a3 unit:(id)a4 valueContext:(id)a5 forTimeScope:(int64_t)a6 isUnitIncludedInValue:(BOOL)a7;
- (id)buildOverlayDisplayTypeForTimeScope:(int64_t)a3;
- (id)contextItemForLastUpdate;
- (id)overlayDisplayTypeForTimeScope:(int64_t)a3;
- (id)representativeDisplayType;
- (id)sampleTypeForDateRangeUpdates;
- (id)unitString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5;
- (id)valueContextString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5;
- (id)valueString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5 isUnitIncludedInValue:(BOOL *)a6;
- (int64_t)overlayMode;
- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4;
- (void)fetchCachedDataForTimeScope:(int64_t)a3 resolution:(int64_t)a4 dateInterval:(id)a5 completion:(id)a6;
- (void)setApplicationItems:(id)a3;
- (void)setDisplayTypesForTimeScopes:(id)a3;
- (void)setLastUpdatedContextItem:(id)a3;
- (void)setMonitoringSampleType:(id)a3;
- (void)setOverlayChartController:(id)a3;
- (void)setOverlayMode:(int64_t)a3;
- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7;
@end

@implementation HKOverlayRoomViewControllerIntegratedContext

+ (id)distributionContextWithStyle:(int64_t)a3 namedPredicate:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 optionalDelegate:(id)a7 options:(int64_t)a8 mode:(int64_t)a9
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  v18 = [[HKOverlayRoomViewControllerDistributionContext alloc] initWithStyle:a3 namedPredicate:v17 overlayChartController:v16 applicationItems:v15 optionalDelegate:v14 options:a8 mode:a9];

  return v18;
}

+ (id)quantityContextWithIdentifier:(id)a3 overlayChartController:(id)a4 applicationItems:(id)a5 optionalDelegate:(id)a6 seriesOptions:(int64_t)a7 mode:(int64_t)a8
{
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [[HKOverlayRoomViewControllerQuantityContext alloc] initWithQuantityIdentifier:v16 overlayChartController:v15 applicationItems:v14 optionalDelegate:v13 seriesOptions:a7 mode:a8 optionalBaseDisplayType:0];

  return v17;
}

+ (id)quantityContextWithIdentifier:(id)a3 overlayChartController:(id)a4 applicationItems:(id)a5 optionalDelegate:(id)a6 seriesOptions:(int64_t)a7 mode:(int64_t)a8 optionalBaseDisplayType:(id)a9
{
  id v15 = a9;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = [[HKOverlayRoomViewControllerQuantityContext alloc] initWithQuantityIdentifier:v19 overlayChartController:v18 applicationItems:v17 optionalDelegate:v16 seriesOptions:a7 mode:a8 optionalBaseDisplayType:v15];

  return v20;
}

- (HKOverlayRoomViewControllerIntegratedContext)initWithOverlayChartController:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HKOverlayRoomViewControllerIntegratedContext;
  v11 = [(HKOverlayRoomViewControllerIntegratedContext *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_overlayChartController, a3);
    objc_storeStrong((id *)&v12->_applicationItems, a4);
    id v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    displayTypesForTimeScopes = v12->_displayTypesForTimeScopes;
    v12->_displayTypesForTimeScopes = v13;

    monitoringSampleType = v12->_monitoringSampleType;
    v12->_monitoringSampleType = 0;

    lastUpdatedContextItem = v12->_lastUpdatedContextItem;
    v12->_lastUpdatedContextItem = 0;

    v12->_overlayMode = a5;
  }

  return v12;
}

- (id)representativeDisplayType
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"HKOverlayRoomViewController.m" lineNumber:2959 description:@"Subclasses must provide an implementation of representativeDisplayType:"];

  return 0;
}

- (id)buildContextItemWithValue:(id)a3 unit:(id)a4 valueContext:(id)a5 forTimeScope:(int64_t)a6 isUnitIncludedInValue:(BOOL)a7
{
  id v9 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6, a7);
  [v9 handleFailureInMethod:a2 object:self file:@"HKOverlayRoomViewController.m" lineNumber:2964 description:@"Subclasses must provide an implementation of buildContextItemWithValue:unit:valueContext:forTimeScope:isUnitIncludedInValue:"];

  return 0;
}

- (id)buildOverlayDisplayTypeForTimeScope:(int64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"HKOverlayRoomViewController.m" lineNumber:2970 description:@"Subclasses must provide an implementation of buildOverlayDisplayTypeForTimeScope:"];

  return 0;
}

- (void)fetchCachedDataForTimeScope:(int64_t)a3 resolution:(int64_t)a4 dateInterval:(id)a5 completion:(id)a6
{
  v8 = (void *)MEMORY[0x1E4F28B00];
  id v10 = a6;
  id v9 = [v8 currentHandler];
  [v9 handleFailureInMethod:a2 object:self file:@"HKOverlayRoomViewController.m" lineNumber:2978 description:@"Subclasses must provide an implementation of fetchCachedDataForTimeScope:resolution:dateInterval:completion:"];

  (*((void (**)(id, void, void, void))v10 + 2))(v10, MEMORY[0x1E4F1CBF0], 0, 0);
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (id)valueString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5 isUnitIncludedInValue:(BOOL *)a6
{
  id v10 = a5;
  id v11 = a3;
  v12 = [a4 unitController];
  id v13 = [(HKOverlayRoomViewControllerIntegratedContext *)self _minMaxValueFromChartPoints:v11 displayType:v10 unitPreferenceController:v12 isUnitIncludedInValue:a6];

  return v13;
}

- (id)unitString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5
{
  return 0;
}

- (id)valueContextString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5
{
  return 0;
}

- (id)sampleTypeForDateRangeUpdates
{
  v3 = [(HKOverlayRoomViewControllerIntegratedContext *)self monitoringSampleType];

  if (!v3)
  {
    v4 = [(HKOverlayRoomViewControllerIntegratedContext *)self _buildMonitoringSampleType];
    [(HKOverlayRoomViewControllerIntegratedContext *)self setMonitoringSampleType:v4];
  }
  return [(HKOverlayRoomViewControllerIntegratedContext *)self monitoringSampleType];
}

- (id)overlayDisplayTypeForTimeScope:(int64_t)a3
{
  v5 = [(HKOverlayRoomViewControllerIntegratedContext *)self displayTypesForTimeScopes];
  v6 = [NSNumber numberWithInteger:a3];
  v7 = [v5 objectForKey:v6];

  if (!v7)
  {
    v7 = [(HKOverlayRoomViewControllerIntegratedContext *)self buildOverlayDisplayTypeForTimeScope:a3];
    v8 = [(HKOverlayRoomViewControllerIntegratedContext *)self displayTypesForTimeScopes];
    id v9 = [NSNumber numberWithInteger:a3];
    [v8 setObject:v7 forKeyedSubscript:v9];
  }
  return v7;
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __131__HKOverlayRoomViewControllerIntegratedContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
  v15[3] = &unk_1E6D51888;
  v15[4] = self;
  id v16 = v11;
  id v17 = v12;
  int64_t v18 = a5;
  id v13 = v12;
  id v14 = v11;
  [(HKOverlayRoomViewControllerIntegratedContext *)self fetchCachedDataForTimeScope:a5 resolution:a6 dateInterval:v14 completion:v15];
}

void __131__HKOverlayRoomViewControllerIntegratedContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (a3)
  {
    if (![*(id *)(a1 + 32) _obsoleteDateRange:*(void *)(a1 + 40)])
    {
      v7 = [*(id *)(a1 + 32) representativeDisplayType];
      char v28 = 0;
      v8 = *(void **)(a1 + 32);
      id v9 = [v8 applicationItems];
      id v10 = [v8 valueString:v5 applicationItems:v9 representativeDisplayType:v7 isUnitIncludedInValue:&v28];

      id v11 = *(void **)(a1 + 32);
      id v12 = [v11 applicationItems];
      id v13 = [v11 unitString:v5 applicationItems:v12 representativeDisplayType:v7];

      id v14 = *(void **)(a1 + 32);
      id v15 = [v14 applicationItems];
      id v16 = [v14 valueContextString:v5 applicationItems:v15 representativeDisplayType:v7];

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __131__HKOverlayRoomViewControllerIntegratedContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2;
      block[3] = &unk_1E6D51860;
      block[4] = *(void *)(a1 + 32);
      id v22 = v10;
      id v23 = v13;
      id v24 = v16;
      id v17 = *(void **)(a1 + 48);
      uint64_t v26 = *(void *)(a1 + 56);
      char v27 = v28;
      id v25 = v17;
      id v18 = v16;
      id v19 = v13;
      id v20 = v10;
      dispatch_async(MEMORY[0x1E4F14428], block);

      goto LABEL_7;
    }
    v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v6();
LABEL_7:
}

uint64_t __131__HKOverlayRoomViewControllerIntegratedContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) buildContextItemWithValue:*(void *)(a1 + 40) unit:*(void *)(a1 + 48) valueContext:*(void *)(a1 + 56) forTimeScope:*(void *)(a1 + 72) isUnitIncludedInValue:*(unsigned __int8 *)(a1 + 80)];
  [*(id *)(a1 + 32) setLastUpdatedContextItem:v2];

  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  return v3();
}

- (BOOL)_obsoleteDateRange:(id)a3
{
  id v4 = a3;
  id v5 = [(HKOverlayRoomViewControllerIntegratedContext *)self overlayChartController];
  v6 = [v5 primaryGraphViewController];
  v7 = [v6 graphView];
  v8 = [v7 effectiveVisibleRangeActive];

  id v9 = [v8 startDate];
  id v10 = [v8 endDate];
  id v11 = [v4 startDate];
  id v12 = [v4 endDate];

  BOOL v13 = [v9 compare:v11] || objc_msgSend(v10, "compare:", v12);
  return v13;
}

- (id)contextItemForLastUpdate
{
  v3 = [(HKOverlayRoomViewControllerIntegratedContext *)self lastUpdatedContextItem];

  if (!v3)
  {
    id v4 = [(HKOverlayRoomViewControllerIntegratedContext *)self applicationItems];
    id v5 = [v4 timeScopeController];
    uint64_t v6 = [v5 selectedTimeScope];

    v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v8 = [v7 localizedStringForKey:@"NO_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    id v9 = [(HKOverlayRoomViewControllerIntegratedContext *)self buildContextItemWithValue:v8 unit:0 valueContext:0 forTimeScope:v6 isUnitIncludedInValue:0];
    [(HKOverlayRoomViewControllerIntegratedContext *)self setLastUpdatedContextItem:v9];
  }
  return [(HKOverlayRoomViewControllerIntegratedContext *)self lastUpdatedContextItem];
}

- (id)_buildMonitoringSampleType
{
  v2 = [(HKOverlayRoomViewControllerIntegratedContext *)self representativeDisplayType];
  v3 = [v2 objectType];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_minMaxValueFromChartPoints:(id)a3 displayType:(id)a4 unitPreferenceController:(id)a5 isUnitIncludedInValue:(BOOL *)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v12 = [v11 localizedStringForKey:@"NO_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  if (!v8 || ![v8 count])
  {
    id v27 = v12;
    goto LABEL_26;
  }
  v34 = v12;
  id v36 = v10;
  id v37 = v9;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v14)
  {
    id v16 = 0;
    id v17 = 0;
    goto LABEL_20;
  }
  uint64_t v15 = v14;
  id v16 = 0;
  id v17 = 0;
  uint64_t v18 = *(void *)v40;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v40 != v18) {
        objc_enumerationMutation(v13);
      }
      id v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      if (!v16
        || ([*(id *)(*((void *)&v39 + 1) + 8 * i) minYValue],
            v21 = objc_claimAutoreleasedReturnValue(),
            uint64_t v22 = [v21 compare:v16],
            v21,
            v22 == -1))
      {
        uint64_t v23 = objc_msgSend(v20, "minYValue", v34);

        id v16 = (void *)v23;
        if (v17)
        {
LABEL_13:
          id v24 = objc_msgSend(v20, "maxYValue", v34);
          uint64_t v25 = [v24 compare:v17];

          if (v25 != 1) {
            continue;
          }
        }
      }
      else if (v17)
      {
        goto LABEL_13;
      }
      uint64_t v26 = objc_msgSend(v20, "maxYValue", v34);

      id v17 = (void *)v26;
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v43 count:16];
  }
  while (v15);
LABEL_20:

  char v28 = objc_alloc_init(HKInteractiveChartNumberRangeFormatter);
  v29 = v28;
  if (a6) {
    *a6 = 1;
  }
  id v10 = v36;
  id v9 = v37;
  uint64_t v30 = -[HKInteractiveChartNumberRangeFormatter stringForMinimumValue:maximumValue:displayType:unitPreferenceController:](v28, "stringForMinimumValue:maximumValue:displayType:unitPreferenceController:", v16, v17, v37, v36, v34);
  v31 = (void *)v30;
  id v12 = v35;
  if (v30) {
    v32 = (void *)v30;
  }
  else {
    v32 = v35;
  }
  id v27 = v32;

LABEL_26:
  return v27;
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

- (HKSampleType)monitoringSampleType
{
  return self->_monitoringSampleType;
}

- (void)setMonitoringSampleType:(id)a3
{
}

- (NSMutableDictionary)displayTypesForTimeScopes
{
  return self->_displayTypesForTimeScopes;
}

- (void)setDisplayTypesForTimeScopes:(id)a3
{
}

- (HKDisplayTypeContextItem)lastUpdatedContextItem
{
  return self->_lastUpdatedContextItem;
}

- (void)setLastUpdatedContextItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedContextItem, 0);
  objc_storeStrong((id *)&self->_displayTypesForTimeScopes, 0);
  objc_storeStrong((id *)&self->_monitoringSampleType, 0);
  objc_storeStrong((id *)&self->_applicationItems, 0);
  objc_storeStrong((id *)&self->_overlayChartController, 0);
}

@end