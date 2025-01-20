@interface HKOverlayRoomViewControllerQuantityContext
- (BOOL)isEqual:(id)a3;
- (HKDisplayType)optionalBaseDisplayType;
- (HKOverlayRoomViewControllerIntegratedContextDelegate)optionalDelegate;
- (HKOverlayRoomViewControllerQuantityContext)initWithQuantityIdentifier:(id)a3 overlayChartController:(id)a4 applicationItems:(id)a5 optionalDelegate:(id)a6 seriesOptions:(int64_t)a7 mode:(int64_t)a8 optionalBaseDisplayType:(id)a9;
- (NSString)quantityTypeIdentifier;
- (id)buildContextItemWithValue:(id)a3 unit:(id)a4 valueContext:(id)a5 forTimeScope:(int64_t)a6 isUnitIncludedInValue:(BOOL)a7;
- (id)buildOverlayDisplayTypeForTimeScope:(int64_t)a3;
- (id)representativeDisplayType;
- (id)unitString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5;
- (id)valueContextString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5;
- (id)valueString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5 isUnitIncludedInValue:(BOOL *)a6;
- (int64_t)options;
- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4;
- (void)fetchCachedDataForTimeScope:(int64_t)a3 resolution:(int64_t)a4 dateInterval:(id)a5 completion:(id)a6;
- (void)prepareContextForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6;
- (void)setOptionalBaseDisplayType:(id)a3;
- (void)setOptionalDelegate:(id)a3;
- (void)setOptions:(int64_t)a3;
- (void)setQuantityTypeIdentifier:(id)a3;
@end

@implementation HKOverlayRoomViewControllerQuantityContext

- (HKOverlayRoomViewControllerQuantityContext)initWithQuantityIdentifier:(id)a3 overlayChartController:(id)a4 applicationItems:(id)a5 optionalDelegate:(id)a6 seriesOptions:(int64_t)a7 mode:(int64_t)a8 optionalBaseDisplayType:(id)a9
{
  id v16 = a3;
  id v17 = a6;
  id v18 = a9;
  v22.receiver = self;
  v22.super_class = (Class)HKOverlayRoomViewControllerQuantityContext;
  v19 = [(HKOverlayRoomViewControllerIntegratedContext *)&v22 initWithOverlayChartController:a4 applicationItems:a5 mode:a8];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_quantityTypeIdentifier, a3);
    objc_storeWeak((id *)&v20->_optionalDelegate, v17);
    v20->_options = a7;
    objc_storeStrong((id *)&v20->_optionalBaseDisplayType, a9);
  }

  return v20;
}

- (id)representativeDisplayType
{
  v3 = (void *)MEMORY[0x1E4F2B3B8];
  v4 = [(HKOverlayRoomViewControllerQuantityContext *)self quantityTypeIdentifier];
  v5 = [v3 quantityTypeForIdentifier:v4];

  v6 = [(HKOverlayRoomViewControllerIntegratedContext *)self applicationItems];
  v7 = [v6 displayTypeController];
  v8 = [v7 displayTypeForObjectType:v5];

  return v8;
}

- (id)buildContextItemWithValue:(id)a3 unit:(id)a4 valueContext:(id)a5 forTimeScope:(int64_t)a6 isUnitIncludedInValue:(BOOL)a7
{
  BOOL v34 = a7;
  id v11 = a4;
  id v12 = a5;
  id v13 = a3;
  v14 = [(HKOverlayRoomViewControllerQuantityContext *)self representativeDisplayType];
  v15 = objc_alloc_init(HKDisplayTypeContextItem);
  uint64_t v16 = [(HKOverlayRoomViewControllerQuantityContext *)self optionalDelegate];
  if (!v16) {
    goto LABEL_4;
  }
  id v17 = (void *)v16;
  id v18 = [(HKOverlayRoomViewControllerQuantityContext *)self optionalDelegate];
  v19 = [v18 cacheDataSource];

  if (v19)
  {
    v20 = [(HKOverlayRoomViewControllerQuantityContext *)self optionalDelegate];
    v21 = [v20 cacheDataSource];
    objc_super v22 = [v21 contextTitleForTimeScope];
    v23 = v22[2](v22, a6);

    v24 = objc_msgSend(NSString, "hk_chartOverlayAccessibilityIdentifier:", v23);
    [(HKDisplayTypeContextItem *)v15 setAccessibilityIdentifier:v24];
  }
  else
  {
LABEL_4:
    v25 = [v14 localization];
    v23 = [v25 shortenedDisplayName];

    v26 = NSString;
    v24 = [v14 displayTypeIdentifierString];
    v27 = objc_msgSend(v26, "hk_chartOverlayAccessibilityIdentifier:", v24);
    [(HKDisplayTypeContextItem *)v15 setAccessibilityIdentifier:v27];
  }
  [(HKDisplayTypeContextItem *)v15 setTitle:v23];
  [(HKDisplayTypeContextItem *)v15 setInfoHidden:1];
  [(HKDisplayTypeContextItem *)v15 setValue:v13];

  [(HKDisplayTypeContextItem *)v15 setValueContext:v12];
  if (v11)
  {
    [(HKDisplayTypeContextItem *)v15 setUnit:v11];
  }
  else
  {
    v28 = [(HKOverlayRoomViewControllerIntegratedContext *)self applicationItems];
    v29 = [v28 unitController];
    v30 = [v29 localizedDisplayNameForDisplayType:v14];
    [(HKDisplayTypeContextItem *)v15 setUnit:v30];
  }
  -[HKDisplayTypeContextItem setUseTightSpacingBetweenValueAndUnit:](v15, "setUseTightSpacingBetweenValueAndUnit:", [v14 contextItemShouldUseTightSpacingBetweenValueAndUnit]);
  [(HKDisplayTypeContextItem *)v15 setIsUnitIncludedInValue:v34];
  v31 = +[HKOverlayContextUtilities defaultMetricColorsForOverlayMode:[(HKOverlayRoomViewControllerIntegratedContext *)self overlayMode]];
  [(HKDisplayTypeContextItem *)v15 setMetricColors:v31];

  v32 = +[HKOverlayContextUtilities selectedMetricColorsForCategory:](HKOverlayContextUtilities, "selectedMetricColorsForCategory:", [v14 categoryIdentifier]);
  [(HKDisplayTypeContextItem *)v15 setSelectedMetricColors:v32];

  return v15;
}

- (id)buildOverlayDisplayTypeForTimeScope:(int64_t)a3
{
  v21 = [(HKOverlayRoomViewControllerQuantityContext *)self representativeDisplayType];
  v20 = [v21 color];
  v5 = [(HKOverlayRoomViewControllerQuantityContext *)self optionalDelegate];
  char v6 = objc_opt_respondsToSelector();

  id v17 = (id)a3;
  if (v6)
  {
    v7 = [(HKOverlayRoomViewControllerQuantityContext *)self optionalDelegate];
    v19 = [v7 formatterForTimescope:a3];
  }
  else
  {
    v19 = 0;
  }
  v8 = [(HKOverlayRoomViewControllerIntegratedContext *)self overlayChartController];
  v9 = [(HKOverlayRoomViewControllerQuantityContext *)self quantityTypeIdentifier];
  v10 = [(HKOverlayRoomViewControllerIntegratedContext *)self applicationItems];
  id v11 = [v10 displayTypeController];
  id v12 = [(HKOverlayRoomViewControllerQuantityContext *)self optionalDelegate];
  id v13 = [v12 cacheDataSource];
  v14 = [(HKOverlayRoomViewControllerQuantityContext *)self optionalDelegate];
  v15 = [v14 alternateLineSeries];
  id v18 = [v8 displayTypeForQuantityIdentifier:v9 timeScope:v17 displayTypeController:v11 overlayColor:v20 cacheDataSource:v13 alternateLineSeries:v15 alternateFormatter:v19 seriesOptions:self->_options];

  return v18;
}

- (void)fetchCachedDataForTimeScope:(int64_t)a3 resolution:(int64_t)a4 dateInterval:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = [(HKOverlayRoomViewControllerIntegratedContext *)self overlayChartController];
  id v12 = [(HKOverlayRoomViewControllerQuantityContext *)self quantityTypeIdentifier];
  id v13 = [v10 startDate];
  v14 = [v10 endDate];

  v15 = [(HKOverlayRoomViewControllerQuantityContext *)self optionalDelegate];
  uint64_t v16 = [v15 cacheDataSource];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __109__HKOverlayRoomViewControllerQuantityContext_fetchCachedDataForTimeScope_resolution_dateInterval_completion___block_invoke;
  v18[3] = &unk_1E6D51838;
  id v19 = v9;
  id v17 = v9;
  [v11 cachedDataForQuantityIdentifier:v12 timeScope:a3 resolution:0 startDate:v13 endDate:v14 cacheDataSource:v16 completion:v18];
}

uint64_t __109__HKOverlayRoomViewControllerQuantityContext_fetchCachedDataForTimeScope_resolution_dateInterval_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)valueString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5 isUnitIncludedInValue:(BOOL *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(HKOverlayRoomViewControllerQuantityContext *)self optionalDelegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    v15 = [(HKOverlayRoomViewControllerQuantityContext *)self optionalDelegate];
    uint64_t v16 = [v15 valueString:v10 applicationItems:v11 representativeDisplayType:v12];
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)HKOverlayRoomViewControllerQuantityContext;
    uint64_t v16 = [(HKOverlayRoomViewControllerIntegratedContext *)&v18 valueString:v10 applicationItems:v11 representativeDisplayType:v12 isUnitIncludedInValue:a6];
  }

  return v16;
}

- (id)unitString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HKOverlayRoomViewControllerQuantityContext *)self optionalDelegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [(HKOverlayRoomViewControllerQuantityContext *)self optionalDelegate];
    char v14 = [v13 unitString:v8 applicationItems:v9 representativeDisplayType:v10];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HKOverlayRoomViewControllerQuantityContext;
    char v14 = [(HKOverlayRoomViewControllerIntegratedContext *)&v16 unitString:v8 applicationItems:v9 representativeDisplayType:v10];
  }

  return v14;
}

- (id)valueContextString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HKOverlayRoomViewControllerQuantityContext *)self optionalDelegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [(HKOverlayRoomViewControllerQuantityContext *)self optionalDelegate];
    char v14 = [v13 valueContextString:v8 applicationItems:v9 representativeDisplayType:v10];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HKOverlayRoomViewControllerQuantityContext;
    char v14 = [(HKOverlayRoomViewControllerIntegratedContext *)&v16 valueContextString:v8 applicationItems:v9 representativeDisplayType:v10];
  }

  return v14;
}

- (void)prepareContextForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6
{
  id v18 = a3;
  uint64_t v9 = [(HKOverlayRoomViewControllerQuantityContext *)self optionalBaseDisplayType];
  if (v9)
  {
    id v10 = (void *)v9;
    id v11 = [(HKOverlayRoomViewControllerQuantityContext *)self optionalBaseDisplayType];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v13 = [(HKOverlayRoomViewControllerQuantityContext *)self optionalBaseDisplayType];
      char v14 = [v13 graphSeriesForTimeScope:a5];
      v15 = [v18 startDate];
      objc_super v16 = [v18 endDate];
      id v17 = +[HKValueRange valueRangeWithMinValue:v15 maxValue:v16];

      [v14 hasAnyDataLoadedInXAxisRange:v17 dateZoom:a5 resolution:a6];
    }
  }
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKOverlayRoomViewControllerQuantityContext *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      char v6 = [(HKOverlayRoomViewControllerQuantityContext *)self quantityTypeIdentifier];
      v7 = [(HKOverlayRoomViewControllerQuantityContext *)v5 quantityTypeIdentifier];

      if (v6 == v7
        && (int64_t v8 = [(HKOverlayRoomViewControllerQuantityContext *)self options],
            v8 == [(HKOverlayRoomViewControllerQuantityContext *)v5 options]))
      {
        uint64_t v9 = [(HKOverlayRoomViewControllerQuantityContext *)self optionalDelegate];
        id v10 = [v9 cacheDataSource];
        id v11 = [v10 name];
        char v12 = [(HKOverlayRoomViewControllerQuantityContext *)v5 optionalDelegate];
        id v13 = [v12 cacheDataSource];
        char v14 = [v13 name];
        BOOL v15 = v11 == v14;
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (NSString)quantityTypeIdentifier
{
  return self->_quantityTypeIdentifier;
}

- (void)setQuantityTypeIdentifier:(id)a3
{
}

- (HKOverlayRoomViewControllerIntegratedContextDelegate)optionalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_optionalDelegate);
  return (HKOverlayRoomViewControllerIntegratedContextDelegate *)WeakRetained;
}

- (void)setOptionalDelegate:(id)a3
{
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (HKDisplayType)optionalBaseDisplayType
{
  return self->_optionalBaseDisplayType;
}

- (void)setOptionalBaseDisplayType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionalBaseDisplayType, 0);
  objc_destroyWeak((id *)&self->_optionalDelegate);
  objc_storeStrong((id *)&self->_quantityTypeIdentifier, 0);
}

@end