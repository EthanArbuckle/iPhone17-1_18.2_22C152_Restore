@interface HKInteractiveChartOverlayViewController
- (BOOL)_deliverCachedDataFromSource:(id)a3 graphSeriesContext:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 startDate:(id)a7 endDate:(id)a8 completion:(id)a9;
- (BOOL)_displayTypeRequiresAverageAndDuration:(id)a3;
- (BOOL)overlayDisplayTypeInstalled;
- (HKDisplayType)overlayDisplayType;
- (HKDisplayType)primaryDisplayType;
- (HKDisplayType)stackedDisplayType;
- (HKInteractiveChartOverlayViewController)initWithHealthStore:(id)a3 primaryDisplayType:(id)a4 unitPreferenceController:(id)a5 dateCache:(id)a6 chartDataCacheController:(id)a7 selectedTimeScopeController:(id)a8 sampleTypeDateRangeController:(id)a9 initialXValue:(id)a10 currentCalendarOverride:(id)a11 options:(unint64_t)a12;
- (HKInteractiveChartOverlayViewController)initWithStackedDisplayTypes:(id)a3 primaryDisplayTypeStackIndex:(id)a4 stackedDisplayTypeHeights:(id)a5 healthStore:(id)a6 unitPreferenceController:(id)a7 dateCache:(id)a8 chartDataCacheController:(id)a9 selectedTimeScopeController:(id)a10 sampleTypeDateRangeController:(id)a11 initialXValue:(id)a12 currentCalendarOverride:(id)a13 options:(unint64_t)a14 timeScopeRanges:(id)a15;
- (HKInteractiveChartOverlayViewController)initWithTimeScopeRanges:(id)a3 healthStore:(id)a4 primaryDisplayType:(id)a5 unitPreferenceController:(id)a6 dateCache:(id)a7 chartDataCacheController:(id)a8 selectedTimeScopeController:(id)a9 sampleTypeDateRangeController:(id)a10 initialXValue:(id)a11 currentCalendarOverride:(id)a12 options:(unint64_t)a13;
- (HKValueRange)initialVisibleDateRange;
- (NSMutableDictionary)customNamedCaches;
- (NSMutableDictionary)overlayChartCaches;
- (UIColor)currentOverlayColor;
- (_HKInteractiveChartOverlayWaitForCacheData)waitForCacheData;
- (double)minimumHeightForChart;
- (id)_dataSourceForDistributionStyle:(int64_t)a3 timeScope:(int64_t)a4 namedPredicate:(id)a5;
- (id)_dataSourceForNamedDataSource:(id)a3 templateDisplayType:(id)a4;
- (id)_dataSourceForQuantityType:(id)a3 timeScope:(int64_t)a4 customDataSource:(id)a5;
- (id)_overlayChartCacheForDataSource:(id)a3 templateDisplayType:(id)a4;
- (id)_overlayChartCacheForDistributionStyle:(int64_t)a3 timeScope:(int64_t)a4 namedPredicate:(id)a5;
- (id)displayTypeForGraphSeries:(id)a3 namedDataSource:(id)a4 templateDisplayType:(id)a5 timeScope:(int64_t)a6 formatter:(id)a7;
- (id)displayTypeForQuantityDistributionStyle:(int64_t)a3 timeScope:(int64_t)a4 overlayColor:(id)a5 options:(int64_t)a6 alternateFormatter:(id)a7 namedPredicate:(id)a8;
- (id)displayTypeForQuantityIdentifier:(id)a3 timeScope:(int64_t)a4 displayTypeController:(id)a5 overlayColor:(id)a6 cacheDataSource:(id)a7 alternateLineSeries:(id)a8 alternateFormatter:(id)a9 seriesOptions:(int64_t)a10;
- (id)lollipopAnnotationColor;
- (id)lollipopExtensionColor;
- (id)seriesSelectionLineColorForGraphView:(id)a3;
- (id)visibleRangeForTimeScope:(int64_t)a3 proposedRange:(id)a4;
- (int64_t)displayMode;
- (void)_commonInitializationWithDisplayType:(id)a3;
- (void)_deliverOrWaitForDataSource:(id)a3 graphSeriesContext:(id)a4 priorityDelegate:(id)a5 timeScope:(int64_t)a6 resolution:(int64_t)a7 startDate:(id)a8 endDate:(id)a9 queryIfNeeded:(BOOL)a10 completion:(id)a11;
- (void)_modifyFormatter:(id)a3 forTitleOptions:(int64_t)a4;
- (void)cachedDataForCustomGraphSeries:(id)a3 timeScope:(int64_t)a4 resolution:(int64_t)a5 startDate:(id)a6 endDate:(id)a7 completion:(id)a8;
- (void)cachedDataForCustomGraphSeries:(id)a3 timeScope:(int64_t)a4 resolution:(int64_t)a5 startDate:(id)a6 endDate:(id)a7 queryIfNeeded:(BOOL)a8 completion:(id)a9;
- (void)cachedDataForQuantityDistributionStyle:(int64_t)a3 timeScope:(int64_t)a4 resolution:(int64_t)a5 startDate:(id)a6 endDate:(id)a7 namedPredicate:(id)a8 completion:(id)a9;
- (void)cachedDataForQuantityIdentifier:(id)a3 timeScope:(int64_t)a4 resolution:(int64_t)a5 startDate:(id)a6 endDate:(id)a7 cacheDataSource:(id)a8 completion:(id)a9;
- (void)cachedDataForStandardDisplayType:(id)a3 timeScope:(int64_t)a4 resolution:(int64_t)a5 startDate:(id)a6 endDate:(id)a7 completion:(id)a8;
- (void)clearDisplayTypeStack;
- (void)clearOverlayDisplayType;
- (void)clearOverlayDisplayTypeWithAutomaticAutoscale:(BOOL)a3;
- (void)configureDisplayTypes:(id)a3 timeScope:(int64_t)a4 stackOffset:(int64_t)a5;
- (void)installOverlayDisplayType:(id)a3;
- (void)installStackedDisplayType:(id)a3;
- (void)setCurrentOverlayColor:(id)a3;
- (void)setCustomNamedCaches:(id)a3;
- (void)setDisplayMode:(int64_t)a3;
- (void)setInitialVisibleDateRange:(id)a3;
- (void)setOverlayChartCaches:(id)a3;
- (void)setOverlayDisplayType:(id)a3;
- (void)setStackedDisplayType:(id)a3;
- (void)setWaitForCacheData:(id)a3;
- (void)unitPreferencesWillUpdate:(id)a3;
@end

@implementation HKInteractiveChartOverlayViewController

- (HKInteractiveChartOverlayViewController)initWithHealthStore:(id)a3 primaryDisplayType:(id)a4 unitPreferenceController:(id)a5 dateCache:(id)a6 chartDataCacheController:(id)a7 selectedTimeScopeController:(id)a8 sampleTypeDateRangeController:(id)a9 initialXValue:(id)a10 currentCalendarOverride:(id)a11 options:(unint64_t)a12
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v30 = a4;
  v32[0] = v30;
  v17 = (void *)MEMORY[0x1E4F1C978];
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  id v25 = a3;
  v26 = [v17 arrayWithObjects:v32 count:1];
  v31.receiver = self;
  v31.super_class = (Class)HKInteractiveChartOverlayViewController;
  v27 = [(HKInteractiveChartViewController *)&v31 initWithDisplayTypes:v26 healthStore:v25 unitPreferenceController:v24 dateCache:v23 chartDataCacheController:v22 selectedTimeScopeController:v21 sampleTypeDateRangeController:v20 initialXValue:v19 currentCalendarOverride:v18 options:a12];

  if (v27) {
    [(HKInteractiveChartOverlayViewController *)v27 _commonInitializationWithDisplayType:v30];
  }

  return v27;
}

- (HKInteractiveChartOverlayViewController)initWithTimeScopeRanges:(id)a3 healthStore:(id)a4 primaryDisplayType:(id)a5 unitPreferenceController:(id)a6 dateCache:(id)a7 chartDataCacheController:(id)a8 selectedTimeScopeController:(id)a9 sampleTypeDateRangeController:(id)a10 initialXValue:(id)a11 currentCalendarOverride:(id)a12 options:(unint64_t)a13
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v36 = a5;
  id v38 = v36;
  v17 = (void *)MEMORY[0x1E4F1C978];
  id v32 = a12;
  id v18 = a11;
  id v31 = a10;
  id v30 = a9;
  id v19 = a8;
  id v29 = a7;
  id v20 = a6;
  id v21 = a4;
  id v28 = a3;
  v34 = [v17 arrayWithObjects:&v38 count:1];
  v39[0] = v34;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
  v37.receiver = self;
  v37.super_class = (Class)HKInteractiveChartOverlayViewController;
  id v27 = v18;
  id v23 = v18;
  id v24 = v19;
  id v25 = [(HKInteractiveChartViewController *)&v37 initWithStackedDisplayTypes:v22 primaryDisplayTypeStackIndex:0 stackedDisplayTypeHeights:0 healthStore:v21 unitPreferenceController:v20 dateCache:v29 chartDataCacheController:v19 selectedTimeScopeController:v30 sampleTypeDateRangeController:v31 initialXValue:v27 currentCalendarOverride:v32 options:a13 timeScopeRanges:v28];

  if (v25) {
    [(HKInteractiveChartOverlayViewController *)v25 _commonInitializationWithDisplayType:v36];
  }

  return v25;
}

- (HKInteractiveChartOverlayViewController)initWithStackedDisplayTypes:(id)a3 primaryDisplayTypeStackIndex:(id)a4 stackedDisplayTypeHeights:(id)a5 healthStore:(id)a6 unitPreferenceController:(id)a7 dateCache:(id)a8 chartDataCacheController:(id)a9 selectedTimeScopeController:(id)a10 sampleTypeDateRangeController:(id)a11 initialXValue:(id)a12 currentCalendarOverride:(id)a13 options:(unint64_t)a14 timeScopeRanges:(id)a15
{
  id v21 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HKInteractiveChartOverlayViewController;
  id v22 = [(HKInteractiveChartViewController *)&v26 initWithStackedDisplayTypes:v21 primaryDisplayTypeStackIndex:a4 stackedDisplayTypeHeights:a5 healthStore:a6 unitPreferenceController:a7 dateCache:a8 chartDataCacheController:a9 selectedTimeScopeController:a10 sampleTypeDateRangeController:a11 initialXValue:a12 currentCalendarOverride:a13 options:a14 timeScopeRanges:a15];
  if (v22)
  {
    id v23 = [v21 firstObject];
    id v24 = [v23 firstObject];

    [(HKInteractiveChartOverlayViewController *)v22 _commonInitializationWithDisplayType:v24];
  }

  return v22;
}

- (void)_commonInitializationWithDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_primaryDisplayType, a3);
  id v5 = a3;
  overlayDisplayType = self->_overlayDisplayType;
  self->_overlayDisplayType = 0;

  currentOverlayColor = self->_currentOverlayColor;
  self->_currentOverlayColor = 0;

  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  overlayChartCaches = self->_overlayChartCaches;
  self->_overlayChartCaches = v8;

  v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  customNamedCaches = self->_customNamedCaches;
  self->_customNamedCaches = v10;

  v12 = [[_HKInteractiveChartOverlayWaitForCacheData alloc] initWithOverlayController:self];
  waitForCacheData = self->_waitForCacheData;
  self->_waitForCacheData = v12;

  initialVisibleDateRange = self->_initialVisibleDateRange;
  self->_initialVisibleDateRange = 0;

  [(HKInteractiveChartViewController *)self addChartViewObserver:self];
}

- (void)unitPreferencesWillUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(HKInteractiveChartOverlayViewController *)self overlayChartCaches];
  [v5 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_27];

  v6 = [(HKInteractiveChartOverlayViewController *)self customNamedCaches];
  [v6 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_284];

  v7.receiver = self;
  v7.super_class = (Class)HKInteractiveChartOverlayViewController;
  [(HKInteractiveChartViewController *)&v7 unitPreferencesWillUpdate:v4];
}

uint64_t __69__HKInteractiveChartOverlayViewController_unitPreferencesWillUpdate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidateCache];
}

uint64_t __69__HKInteractiveChartOverlayViewController_unitPreferencesWillUpdate___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidateCache];
}

- (void)installOverlayDisplayType:(id)a3
{
  id v5 = a3;
  [(HKInteractiveChartOverlayViewController *)self clearOverlayDisplayTypeWithAutomaticAutoscale:v5 == 0];
  if (v5)
  {
    objc_storeStrong((id *)&self->_overlayDisplayType, a3);
    overlayDisplayType = self->_overlayDisplayType;
    v7.receiver = self;
    v7.super_class = (Class)HKInteractiveChartOverlayViewController;
    [(HKInteractiveChartViewController *)&v7 addOverlayDisplayType:overlayDisplayType stackOffset:0];
  }
}

- (void)clearOverlayDisplayType
{
}

- (void)clearOverlayDisplayTypeWithAutomaticAutoscale:(BOOL)a3
{
  BOOL v3 = a3;
  overlayDisplayType = self->_overlayDisplayType;
  if (overlayDisplayType)
  {
    v7.receiver = self;
    v7.super_class = (Class)HKInteractiveChartOverlayViewController;
    [(HKInteractiveChartViewController *)&v7 removeOverlayDisplayType:overlayDisplayType stackOffset:0 automaticAutoscale:v3];
    v6 = self->_overlayDisplayType;
    self->_overlayDisplayType = 0;
  }
}

- (BOOL)overlayDisplayTypeInstalled
{
  return self->_overlayDisplayType != 0;
}

- (void)installStackedDisplayType:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(HKInteractiveChartOverlayViewController *)self clearDisplayTypeStack];
  if (v5)
  {
    objc_storeStrong((id *)&self->_stackedDisplayType, a3);
    v8[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    v7.receiver = self;
    v7.super_class = (Class)HKInteractiveChartOverlayViewController;
    [(HKInteractiveChartViewController *)&v7 addNewDisplayTypeStackWithDisplayTypes:v6];
  }
}

- (void)clearDisplayTypeStack
{
  BOOL v3 = [(HKInteractiveChartOverlayViewController *)self stackedDisplayType];

  if (v3)
  {
    id v4 = [(HKInteractiveChartOverlayViewController *)self stackedDisplayType];
    [(HKInteractiveChartViewController *)self removeStackedDisplayType:v4];

    stackedDisplayType = self->_stackedDisplayType;
    self->_stackedDisplayType = 0;
  }
}

- (id)displayTypeForQuantityDistributionStyle:(int64_t)a3 timeScope:(int64_t)a4 overlayColor:(id)a5 options:(int64_t)a6 alternateFormatter:(id)a7 namedPredicate:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  id v16 = a5;
  v17 = [(HKInteractiveChartOverlayViewController *)self primaryDisplayType];
  id v18 = [(HKInteractiveChartViewController *)self graphSeriesForDisplayType:v17 timeScope:a4 stackOffset:0];

  if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v19 = v18;
  }
  else
  {
    _HKInitializeLogging();
    id v20 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      -[HKInteractiveChartOverlayViewController displayTypeForQuantityDistributionStyle:timeScope:overlayColor:options:alternateFormatter:namedPredicate:]((uint64_t)self, v20);
    }
    id v19 = 0;
  }
  v44 = v15;
  id v21 = [(HKInteractiveChartOverlayViewController *)self _dataSourceForDistributionStyle:a3 timeScope:a4 namedPredicate:v15];
  id v22 = objc_alloc_init(HKQuantityDistributionSeries);
  id v23 = [v19 unselectedStrokeStyle];
  [(HKQuantityDistributionSeries *)v22 setUnselectedStrokeStyle:v23];

  id v24 = [(HKQuantityDistributionSeries *)v22 unselectedStrokeStyle];
  [v24 setStrokeColor:v16];

  id v25 = [v19 inactiveStrokeStyle];
  [(HKQuantityDistributionSeries *)v22 setInactiveStrokeStyle:v25];

  objc_super v26 = [v19 selectedStrokeStyle];
  [(HKQuantityDistributionSeries *)v22 setSelectedStrokeStyle:v26];

  id v27 = [(HKQuantityDistributionSeries *)v22 selectedStrokeStyle];
  [v27 setStrokeColor:v16];

  id v28 = [v19 minMaxLabelStyle];
  [(HKQuantityDistributionSeries *)v22 setMinMaxLabelStyle:v28];

  id v29 = [(HKQuantityDistributionSeries *)v22 minMaxLabelStyle];
  [v29 setTextColor:v16];

  id v30 = [v19 minMaxValueStyle];
  [(HKQuantityDistributionSeries *)v22 setMinMaxValueStyle:v30];

  id v31 = [(HKQuantityDistributionSeries *)v22 minMaxValueStyle];
  [v31 setTextColor:v16];

  id v32 = [v19 minMaxPointStyle];
  [(HKQuantityDistributionSeries *)v22 setMinMaxPointStyle:v32];

  v33 = [(HKQuantityDistributionSeries *)v22 minMaxPointStyle];
  [v33 setStrokeColor:v16];

  v34 = [v19 yAxis];
  [(HKGraphSeries *)v22 setYAxis:v34];

  v35 = [v19 axisScalingRule];
  [(HKGraphSeries *)v22 setAxisScalingRule:v35];

  -[HKQuantityDistributionSeries setZeroCountForGap:](v22, "setZeroCountForGap:", [v19 zeroCountForGap]);
  if ((a6 & 2) != 0) {
    [(HKQuantityDistributionSeries *)v22 setExcludeDistribution:1];
  }
  [(HKGraphSeries *)v22 setDataSource:v21];
  if (v14)
  {
    id v36 = v14;
  }
  else
  {
    objc_super v37 = [(HKInteractiveChartOverlayViewController *)self primaryDisplayType];
    objc_msgSend(v37, "hk_interactiveChartsFormatterForTimeScope:", a4);
    id v36 = (id)objc_claimAutoreleasedReturnValue();
  }
  [(HKInteractiveChartOverlayViewController *)self _modifyFormatter:v36 forTitleOptions:a6];
  id v38 = [HKInteractiveChartDisplayType alloc];
  v39 = [(HKInteractiveChartOverlayViewController *)self primaryDisplayType];
  v40 = [(HKInteractiveChartOverlayViewController *)self primaryDisplayType];
  v41 = [v40 objectType];
  v42 = -[HKInteractiveChartDisplayType initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:](v38, "initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:", v22, v39, v36, [v41 code]);

  return v42;
}

- (void)_modifyFormatter:(id)a3 forTitleOptions:(int64_t)a4
{
  char v4 = a4;
  id v10 = a3;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v10;
  if (isKindOfClass)
  {
    id v7 = v10;
    v8 = v7;
    if ((v4 & 0x20) != 0)
    {
      v9 = &unk_1F3C1F2E8;
    }
    else if ((v4 & 0x40) != 0)
    {
      v9 = &unk_1F3C1F300;
    }
    else
    {
      if ((v4 & 0x80) == 0)
      {
LABEL_9:

        id v6 = v10;
        goto LABEL_10;
      }
      v9 = &unk_1F3C1F318;
    }
    [v7 setOverrideStatFormatterItemOptions:v9];
    goto LABEL_9;
  }
LABEL_10:
  MEMORY[0x1F41817F8](isKindOfClass, v6);
}

- (id)displayTypeForQuantityIdentifier:(id)a3 timeScope:(int64_t)a4 displayTypeController:(id)a5 overlayColor:(id)a6 cacheDataSource:(id)a7 alternateLineSeries:(id)a8 alternateFormatter:(id)a9 seriesOptions:(int64_t)a10
{
  v104[1] = *MEMORY[0x1E4F143B8];
  id v16 = a6;
  id v17 = a8;
  id v94 = a9;
  id v18 = (void *)MEMORY[0x1E4F2B2C0];
  id v90 = a7;
  id v19 = a5;
  id v89 = a3;
  v93 = objc_msgSend(v18, "quantityTypeForIdentifier:");
  id v20 = objc_msgSend(v19, "displayTypeForObjectType:");

  v96 = v20;
  v100 = [v20 chartingRules];
  id v21 = [(HKInteractiveChartOverlayViewController *)self primaryDisplayType];
  v99 = self;
  int64_t v91 = a4;
  v98 = [(HKInteractiveChartViewController *)self graphSeriesForDisplayType:v21 timeScope:a4 stackOffset:0];

  id v22 = (HKLineSeries *)v17;
  v92 = v22;
  if (!v22) {
    id v22 = objc_alloc_init(HKLineSeries);
  }
  id v23 = [HKGradientFillStyle alloc];
  id v24 = [v16 colorWithAlphaComponent:0.3];
  id v25 = [v16 colorWithAlphaComponent:0.0];
  v97 = [(HKGradientFillStyle *)v23 initWithFirstColor:v24 secondColor:v25];

  objc_super v26 = [HKGradientFillStyle alloc];
  id v27 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_vitalsKeyColor");
  id v28 = [v27 colorWithAlphaComponent:0.3];
  id v29 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_vitalsKeyColor");
  id v30 = [v29 colorWithAlphaComponent:0.0];
  id v31 = [(HKGradientFillStyle *)v26 initWithFirstColor:v28 secondColor:v30];

  id v32 = objc_alloc_init(HKLineSeriesPresentationStyle);
  v88 = +[HKStrokeStyle strokeStyleWithColor:v16 lineWidth:2.0];
  -[HKLineSeriesPresentationStyle setStrokeStyle:](v32, "setStrokeStyle:");
  v101 = v32;
  [(HKLineSeriesPresentationStyle *)v32 setWaveForm:0];
  id v33 = v16;
  v34 = v100;
  if (a10)
  {
    v35 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_roundedSystemFontWithSize:weight:", 18.0, *MEMORY[0x1E4FB09D0]);
    if ([v100 shouldDisplayUnitForAxisLabels])
    {
      id v36 = [HKDisplayTypeNumberFormatter alloc];
      objc_super v37 = [(HKInteractiveChartViewController *)v99 unitPreferenceController];
      uint64_t v38 = [(HKDisplayTypeNumberFormatter *)v36 initWithDisplayType:v96 unitController:v37];
    }
    else
    {
      v39 = [(HKInteractiveChartViewController *)v99 unitPreferenceController];
      objc_super v37 = [v39 unitForDisplayType:v96];

      uint64_t v38 = objc_msgSend(v96, "hk_numberFormatterForUnit:", v37);
    }
    v40 = (void *)v38;

    v41 = +[HKAxisLabelStyle labelStyleWithColor:v33 font:v35 horizontalAlignment:0 verticalAlignment:2 numberFormatter:v40];
    [(HKLineSeriesPresentationStyle *)v101 setAnnotationStyle:v41];
  }
  v42 = objc_alloc_init(HKLineSeriesPresentationStyle);
  v43 = +[HKStrokeStyle strokeStyleWithColor:v33 lineWidth:2.0];
  [(HKLineSeriesPresentationStyle *)v42 setStrokeStyle:v43];

  [(HKLineSeriesPresentationStyle *)v42 setFillStyle:v97];
  [(HKLineSeriesPresentationStyle *)v42 setWaveForm:0];
  v44 = objc_alloc_init(HKLineSeriesPresentationStyle);
  v45 = HKHealthKeyColor();
  v46 = +[HKStrokeStyle strokeStyleWithColor:v45 lineWidth:2.0];
  [(HKLineSeriesPresentationStyle *)v44 setStrokeStyle:v46];

  v47 = [HKLineSeriesPointMarkerStyle alloc];
  v48 = HKHealthKeyColor();
  uint64_t v49 = [(HKLineSeriesPointMarkerStyle *)v47 initWithColor:v48 radius:0 style:4.0];

  v95 = (void *)v49;
  [(HKLineSeriesPresentationStyle *)v44 setPointMarkerStyle:v49];
  [(HKLineSeriesPresentationStyle *)v44 setFillStyle:v31];
  [(HKLineSeriesPresentationStyle *)v44 setWaveForm:0];
  v50 = [(HKInteractiveChartViewController *)v99 selectedTimeScopeController];
  uint64_t v51 = [v50 selectedTimeScope];

  if (a10)
  {
    char v57 = 0;
  }
  else
  {
    unint64_t v52 = ((unint64_t)a10 >> 2) & 1;
    uint64_t v53 = v52 | [v100 lineChartFlatLastValueForTimeScope:v51];
    [(HKLineSeries *)v22 setFlatLastValue:v53];
    int v54 = [v100 lineChartExtendLastValueForTimeScope:v51];
    [(HKLineSeries *)v22 setExtendLastValue:v52 | v54];
    int v55 = [v100 lineChartExtendFirstValueForTimeScope:v51];
    [(HKLineSeries *)v22 setExtendFirstValue:v52 | v55];
    char v56 = v54 | v55;
    v34 = v100;
    char v57 = v53 | v56;
  }
  int v58 = [v34 lineChartUsesPointMarkerImageForTimeScope:v51];
  if ((v57 & 1) == 0 && v58)
  {
    double v59 = 0.0;
    double v60 = 0.0;
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend((id)objc_msgSend(v98, "performSelector:", sel_unselectedStrokeStyle), "lineWidth");
      double v60 = v61;
    }
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend((id)objc_msgSend(v98, "performSelector:", sel_selectedStrokeStyle), "lineWidth");
      double v59 = v62;
    }
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend((id)objc_msgSend(v98, "performSelector:", sel_strokeStyle), "lineWidth");
      double v60 = v63;
      double v59 = v63;
    }
    v64 = [[HKLineSeriesPointMarkerStyle alloc] initWithColor:v33 radius:~(a10 >> 3) & 1 style:v60 * 0.5];
    v65 = [HKLineSeriesPointMarkerStyle alloc];
    v66 = HKHealthKeyColor();
    v67 = [(HKLineSeriesPointMarkerStyle *)v65 initWithColor:v66 radius:0 style:v59 * 0.5];

    [(HKLineSeriesPresentationStyle *)v101 setPointMarkerStyle:v64];
    [(HKLineSeriesPresentationStyle *)v42 setPointMarkerStyle:v95];
    [(HKLineSeries *)v22 setSelectedPointMarkerStyle:v67];

    v34 = v100;
  }
  unsigned int v68 = [v34 lineChartUsesValueAxisAnnotationForTimeScope:v51];
  if ((a10 & 1) == 0 && ((unint64_t)a10 >> 4) & 1 | v68)
  {
    v69 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_roundedSystemFontWithSize:weight:", 18.0, *MEMORY[0x1E4FB09D0]);
    if ([v34 shouldDisplayUnitForAxisLabels])
    {
      v70 = [HKDisplayTypeNumberFormatter alloc];
      v71 = [(HKInteractiveChartViewController *)v99 unitPreferenceController];
      uint64_t v72 = [(HKDisplayTypeNumberFormatter *)v70 initWithDisplayType:v96 unitController:v71];
    }
    else
    {
      v73 = [(HKInteractiveChartViewController *)v99 unitPreferenceController];
      v71 = [v73 unitForDisplayType:v96];

      uint64_t v72 = objc_msgSend(v96, "hk_numberFormatterForUnit:", v71);
    }
    v74 = (void *)v72;

    v75 = +[HKAxisLabelStyle labelStyleWithColor:v33 font:v69 horizontalAlignment:0 verticalAlignment:2 numberFormatter:v74];
    [(HKLineSeriesPresentationStyle *)v101 setAxisAnnotationStyle:v75];
    [(HKLineSeriesPresentationStyle *)v42 setAxisAnnotationStyle:v75];
    [(HKLineSeriesPresentationStyle *)v44 setAxisAnnotationStyle:v75];

    v34 = v100;
  }
  v104[0] = v101;
  v76 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v104, 1, v33);
  [(HKLineSeries *)v22 setUnhighlightedPresentationStyles:v76];

  v103 = v42;
  v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v103 count:1];
  [(HKLineSeries *)v22 setHighlightedPresentationStyles:v77];

  v102 = v44;
  v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
  [(HKLineSeries *)v22 setSelectedPresentationStyles:v78];

  v79 = [v98 yAxis];
  [(HKGraphSeries *)v22 setYAxis:v79];

  v80 = [(HKGraphSeries *)v22 yAxis];
  [v80 clearAnnotations];

  v81 = [v98 axisScalingRule];
  [(HKGraphSeries *)v22 setAxisScalingRule:v81];

  v82 = [(HKInteractiveChartOverlayViewController *)v99 _dataSourceForQuantityType:v89 timeScope:v91 customDataSource:v90];

  [(HKGraphSeries *)v22 setDataSource:v82];
  if (v94)
  {
    id v83 = v94;
    v84 = v96;
  }
  else
  {
    v84 = v96;
    objc_msgSend(v96, "hk_interactiveChartsFormatterForTimeScope:", v91);
    id v83 = (id)objc_claimAutoreleasedReturnValue();
  }
  v85 = -[HKInteractiveChartDisplayType initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:]([HKInteractiveChartDisplayType alloc], "initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:", v22, v84, v83, [v93 code]);

  return v85;
}

- (id)displayTypeForGraphSeries:(id)a3 namedDataSource:(id)a4 templateDisplayType:(id)a5 timeScope:(int64_t)a6 formatter:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a3;
  id v14 = [(HKInteractiveChartOverlayViewController *)self _dataSourceForNamedDataSource:a4 templateDisplayType:v12];
  [v13 setDataSource:v14];

  id v15 = [HKInteractiveChartDisplayType alloc];
  id v16 = [v12 sampleType];
  id v17 = -[HKInteractiveChartDisplayType initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:](v15, "initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:", v13, v12, v11, [v16 code]);

  return v17;
}

- (void)cachedDataForQuantityDistributionStyle:(int64_t)a3 timeScope:(int64_t)a4 resolution:(int64_t)a5 startDate:(id)a6 endDate:(id)a7 namedPredicate:(id)a8 completion:(id)a9
{
  id v16 = a9;
  id v17 = a7;
  id v18 = a6;
  id v20 = [(HKInteractiveChartOverlayViewController *)self _dataSourceForDistributionStyle:a3 timeScope:a4 namedPredicate:a8];
  LOBYTE(v19) = 1;
  [(HKInteractiveChartOverlayViewController *)self _deliverOrWaitForDataSource:v20 graphSeriesContext:0 priorityDelegate:0 timeScope:a4 resolution:a5 startDate:v18 endDate:v17 queryIfNeeded:v19 completion:v16];
}

- (void)cachedDataForQuantityIdentifier:(id)a3 timeScope:(int64_t)a4 resolution:(int64_t)a5 startDate:(id)a6 endDate:(id)a7 cacheDataSource:(id)a8 completion:(id)a9
{
  id v16 = a9;
  id v17 = a7;
  id v18 = a6;
  id v20 = [(HKInteractiveChartOverlayViewController *)self _dataSourceForQuantityType:a3 timeScope:a4 customDataSource:a8];
  LOBYTE(v19) = 1;
  [(HKInteractiveChartOverlayViewController *)self _deliverOrWaitForDataSource:v20 graphSeriesContext:0 priorityDelegate:0 timeScope:a4 resolution:a5 startDate:v18 endDate:v17 queryIfNeeded:v19 completion:v16];
}

- (void)cachedDataForCustomGraphSeries:(id)a3 timeScope:(int64_t)a4 resolution:(int64_t)a5 startDate:(id)a6 endDate:(id)a7 completion:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a3;
  id v20 = [v17 dataSource];
  id v18 = [v17 seriesDataSourceContext];
  LOBYTE(v19) = 1;
  [(HKInteractiveChartOverlayViewController *)self _deliverOrWaitForDataSource:v20 graphSeriesContext:v18 priorityDelegate:v17 timeScope:a4 resolution:a5 startDate:v16 endDate:v15 queryIfNeeded:v19 completion:v14];
}

- (void)cachedDataForCustomGraphSeries:(id)a3 timeScope:(int64_t)a4 resolution:(int64_t)a5 startDate:(id)a6 endDate:(id)a7 queryIfNeeded:(BOOL)a8 completion:(id)a9
{
  id v16 = a9;
  id v17 = a7;
  id v18 = a6;
  id v19 = a3;
  id v22 = [v19 dataSource];
  id v20 = [v19 seriesDataSourceContext];
  LOBYTE(v21) = a8;
  [(HKInteractiveChartOverlayViewController *)self _deliverOrWaitForDataSource:v22 graphSeriesContext:v20 priorityDelegate:v19 timeScope:a4 resolution:a5 startDate:v18 endDate:v17 queryIfNeeded:v21 completion:v16];
}

- (void)cachedDataForStandardDisplayType:(id)a3 timeScope:(int64_t)a4 resolution:(int64_t)a5 startDate:(id)a6 endDate:(id)a7 completion:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a3;
  id v18 = [(HKInteractiveChartViewController *)self chartDataCacheController];
  id v21 = [v18 interactiveChartsCacheForDisplayType:v17 timeScope:a4];

  id v19 = objc_alloc_init(HKCacheBackedChartSeriesDataSource);
  [(HKCacheBackedChartSeriesDataSource *)v19 setChartCache:v21];
  LOBYTE(v20) = 1;
  [(HKInteractiveChartOverlayViewController *)self _deliverOrWaitForDataSource:v19 graphSeriesContext:0 priorityDelegate:0 timeScope:a4 resolution:a5 startDate:v16 endDate:v15 queryIfNeeded:v20 completion:v14];
}

- (void)_deliverOrWaitForDataSource:(id)a3 graphSeriesContext:(id)a4 priorityDelegate:(id)a5 timeScope:(int64_t)a6 resolution:(int64_t)a7 startDate:(id)a8 endDate:(id)a9 queryIfNeeded:(BOOL)a10 completion:(id)a11
{
  id v24 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  id v20 = a9;
  id v21 = a11;
  BOOL v22 = [(HKInteractiveChartOverlayViewController *)self _deliverCachedDataFromSource:v24 graphSeriesContext:v17 timeScope:a6 resolution:a7 startDate:v19 endDate:v20 completion:v21];
  if (v22 || !a10)
  {
    if (!v22 && !a10) {
      (*((void (**)(id, void, uint64_t, void))v21 + 2))(v21, MEMORY[0x1E4F1CBF0], 1, 0);
    }
  }
  else
  {
    id v23 = [(HKInteractiveChartOverlayViewController *)self waitForCacheData];
    [v23 addWaitForDataSource:v24 graphSeriesContext:v17 timeScope:a6 resolution:a7 startDate:v19 endDate:v20 priorityDelegate:v18 completion:v21];
  }
}

- (double)minimumHeightForChart
{
  v8.receiver = self;
  v8.super_class = (Class)HKInteractiveChartOverlayViewController;
  [(HKInteractiveChartViewController *)&v8 minimumHeightForChart];
  double v3 = v2;
  if (objc_msgSend(MEMORY[0x1E4FB1BA8], "hk_currentDeviceHas4InchScreen"))
  {
    BOOL v4 = objc_msgSend(MEMORY[0x1E4FB1BA8], "hk_currentDeviceHasDisplayZoomedEnabled") == 0;
    double v5 = 280.0;
    double v6 = 225.0;
  }
  else
  {
    if (!objc_msgSend(MEMORY[0x1E4FB1BA8], "hk_currentDeviceHas4Point7InchScreen")) {
      return v3;
    }
    BOOL v4 = objc_msgSend(MEMORY[0x1E4FB1BA8], "hk_currentDeviceHasDisplayZoomedEnabled") == 0;
    double v5 = 390.0;
    double v6 = 335.0;
  }
  if (v4) {
    return v5;
  }
  else {
    return v6;
  }
}

- (id)visibleRangeForTimeScope:(int64_t)a3 proposedRange:(id)a4
{
  id v5 = a4;
  double v6 = [(HKInteractiveChartOverlayViewController *)self initialVisibleDateRange];

  id v7 = v5;
  if (v6)
  {
    id v7 = [(HKInteractiveChartOverlayViewController *)self initialVisibleDateRange];

    [(HKInteractiveChartOverlayViewController *)self setInitialVisibleDateRange:0];
  }

  return v7;
}

- (void)configureDisplayTypes:(id)a3 timeScope:(int64_t)a4 stackOffset:(int64_t)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 count] == 1)
  {
    v9 = [v8 objectAtIndexedSubscript:0];
    id v10 = [(HKInteractiveChartViewController *)self graphSeriesForDisplayType:v9 timeScope:a4 stackOffset:a5];

    [v10 setAllowsSelection:1];
  }
  else
  {
    id v11 = [(HKInteractiveChartViewController *)self graphSeriesForDisplayType:self->_overlayDisplayType timeScope:a4 stackOffset:a5];
    BOOL v22 = v11;
    if (v11) {
      unsigned int v24 = [v11 allowsSelection] ^ 1;
    }
    else {
      unsigned int v24 = 0;
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v23 = v8;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(HKDisplayType **)(*((void *)&v25 + 1) + 8 * i);
          id v18 = [(HKInteractiveChartViewController *)self graphSeriesForDisplayType:v17 timeScope:a4 stackOffset:a5];
          id v19 = v18;
          if (v17 != self->_overlayDisplayType) {
            [v18 setAllowsSelection:v24];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v14);
    }

    id v20 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
    id v21 = [v20 graphView];

    if (v24) {
      [v21 setMoveSelectedSeriesToFront:0];
    }

    id v8 = v23;
  }
}

- (id)_overlayChartCacheForDistributionStyle:(int64_t)a3 timeScope:(int64_t)a4 namedPredicate:(id)a5
{
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 localizedNameKey];
  }
  else
  {
    id v11 = &stru_1F3B9CF20;
  }
  id v12 = [[_HKInteractiveChartDistributionStyleKey alloc] initWithDistributionStyle:a3 timeScope:a4 predicateName:v11];
  uint64_t v13 = [(HKInteractiveChartOverlayViewController *)self overlayChartCaches];
  uint64_t v14 = [v13 objectForKey:v12];

  if (!v14)
  {
    v39 = v11;
    uint64_t v15 = [(HKInteractiveChartOverlayViewController *)self primaryDisplayType];
    id v16 = [(HKInteractiveChartOverlayViewController *)self primaryDisplayType];
    id v17 = [v16 objectType];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v36 = [MEMORY[0x1E4F28B00] currentHandler];
      [v36 handleFailureInMethod:a2, self, @"HKInteractiveChartOverlayViewController.m", 722, @"Distribution overlay supported only for quantity types not %@", v17 object file lineNumber description];
    }
    id v18 = v17;
    objc_super v37 = v18;
    id v19 = [(HKInteractiveChartOverlayViewController *)self primaryDisplayType];
    BOOL v20 = [(HKInteractiveChartOverlayViewController *)self _displayTypeRequiresAverageAndDuration:v19];

    uint64_t v21 = v20;
    if ([v15 contextItemShouldDisplayEventCountForDistributionStyle:a3]) {
      uint64_t v21 = v20 | 2;
    }
    BOOL v22 = [v18 identifier];
    uint64_t v38 = v15;
    id v23 = (void *)*MEMORY[0x1E4F2A7F0];

    if (v22 == v23) {
      uint64_t v24 = v21 | 4;
    }
    else {
      uint64_t v24 = v21;
    }
    long long v25 = [HKQuantityDistributionDataSource alloc];
    long long v26 = [(HKInteractiveChartViewController *)self unitPreferenceController];
    long long v27 = [(HKInteractiveChartViewController *)self healthStore];
    long long v28 = [v10 predicate];
    id v29 = [(HKInteractiveChartOverlayViewController *)self primaryDisplayType];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __107__HKInteractiveChartOverlayViewController__overlayChartCacheForDistributionStyle_timeScope_namedPredicate___block_invoke;
    v40[3] = &__block_descriptor_40_e48__24__0___HKQuantityDistributionData_8__HKUnit_16l;
    v40[4] = v24;
    uint64_t v30 = [(HKQuantityDistributionDataSource *)v25 initWithQuantityType:v37 unitController:v26 healthStore:v27 contextStyle:a3 predicate:v28 options:v24 baseDisplayType:v29 specificStartDate:0 specificEndDate:0 userInfoCreationBlock:v40];

    uint64_t v14 = objc_alloc_init(HKChartCache);
    [(HKChartCache *)v14 setDataSource:v30];
    id v31 = +[HKOutstandingFetchOperationManager sharedOperationManager];
    [(HKChartCache *)v14 setOperationManager:v31];

    id v32 = [(HKInteractiveChartOverlayViewController *)self overlayChartCaches];
    [v32 setObject:v14 forKey:v12];

    id v33 = [(HKInteractiveChartViewController *)self chartDataCacheController];
    v34 = [(HKInteractiveChartOverlayViewController *)self primaryDisplayType];
    [v33 addCustomChartCache:v14 forDisplayType:v34];

    id v11 = v39;
  }

  return v14;
}

HKInteractiveChartSinglePointEventIdentifierData *__107__HKInteractiveChartOverlayViewController__overlayChartCacheForDistributionStyle_timeScope_namedPredicate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if ((*(unsigned char *)(a1 + 32) & 2) != 0)
  {
    id v9 = a3;
    id v10 = a2;
    double v6 = objc_alloc_init(HKInteractiveChartSinglePointEventIdentifierData);
    id v11 = [v10 minimumValue];
    [v11 doubleValueForUnit:v9];
    -[HKInteractiveChartSinglePointData setMinValue:](v6, "setMinValue:");

    id v12 = [v10 maximumValue];
    [v12 doubleValueForUnit:v9];
    -[HKInteractiveChartSinglePointData setMaxValue:](v6, "setMaxValue:");

    [(HKInteractiveChartSinglePointData *)v6 setUnit:v9];
    [(HKInteractiveChartSinglePointData *)v6 setRepresentsRange:1];
    uint64_t v13 = [v10 contextIdentifiers];

    [(HKInteractiveChartSinglePointEventIdentifierData *)v6 setIdentifiers:v13];
  }
  else
  {
    id v4 = a3;
    id v5 = a2;
    double v6 = objc_alloc_init(HKInteractiveChartSinglePointData);
    id v7 = [v5 minimumValue];
    [v7 doubleValueForUnit:v4];
    -[HKInteractiveChartSinglePointData setMinValue:](v6, "setMinValue:");

    id v8 = [v5 maximumValue];

    [v8 doubleValueForUnit:v4];
    -[HKInteractiveChartSinglePointData setMaxValue:](v6, "setMaxValue:");

    [(HKInteractiveChartSinglePointData *)v6 setUnit:v4];
    [(HKInteractiveChartSinglePointData *)v6 setRepresentsRange:1];
  }
  return v6;
}

- (BOOL)_displayTypeRequiresAverageAndDuration:(id)a3
{
  return [a3 categoryIdentifier] == 12;
}

- (id)_overlayChartCacheForDataSource:(id)a3 templateDisplayType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HKInteractiveChartOverlayViewController *)self customNamedCaches];
  id v9 = [v6 name];
  id v10 = [v8 objectForKey:v9];

  if (!v10)
  {
    id v10 = objc_alloc_init(HKChartCache);
    id v11 = [v6 dataSource];
    [(HKChartCache *)v10 setDataSource:v11];

    id v12 = +[HKOutstandingFetchOperationManager sharedOperationManager];
    [(HKChartCache *)v10 setOperationManager:v12];

    uint64_t v13 = [(HKInteractiveChartOverlayViewController *)self customNamedCaches];
    uint64_t v14 = [v6 name];
    [v13 setObject:v10 forKey:v14];

    uint64_t v15 = [(HKInteractiveChartViewController *)self chartDataCacheController];
    [v15 addCustomChartCache:v10 forDisplayType:v7];
  }
  return v10;
}

- (id)_dataSourceForDistributionStyle:(int64_t)a3 timeScope:(int64_t)a4 namedPredicate:(id)a5
{
  id v5 = [(HKInteractiveChartOverlayViewController *)self _overlayChartCacheForDistributionStyle:a3 timeScope:a4 namedPredicate:a5];
  id v6 = objc_alloc_init(HKCacheBackedChartSeriesDataSource);
  [(HKCacheBackedChartSeriesDataSource *)v6 setChartCache:v5];

  return v6;
}

- (id)_dataSourceForQuantityType:(id)a3 timeScope:(int64_t)a4 customDataSource:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(HKInteractiveChartViewController *)self displayTypeController];
  id v11 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:v9];

  id v12 = [v10 displayTypeForObjectType:v11];

  if (v8)
  {
    uint64_t v13 = [(HKInteractiveChartOverlayViewController *)self _overlayChartCacheForDataSource:v8 templateDisplayType:v12];
  }
  else
  {
    uint64_t v14 = [(HKInteractiveChartViewController *)self chartDataCacheController];
    uint64_t v13 = [v14 interactiveChartsCacheForDisplayType:v12 timeScope:a4];
  }
  uint64_t v15 = objc_alloc_init(HKCacheBackedChartSeriesDataSource);
  [(HKCacheBackedChartSeriesDataSource *)v15 setChartCache:v13];

  return v15;
}

- (id)_dataSourceForNamedDataSource:(id)a3 templateDisplayType:(id)a4
{
  id v4 = [(HKInteractiveChartOverlayViewController *)self _overlayChartCacheForDataSource:a3 templateDisplayType:a4];
  id v5 = objc_alloc_init(HKCacheBackedChartSeriesDataSource);
  [(HKCacheBackedChartSeriesDataSource *)v5 setChartCache:v4];

  return v5;
}

- (BOOL)_deliverCachedDataFromSource:(id)a3 graphSeriesContext:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 startDate:(id)a7 endDate:(id)a8 completion:(id)a9
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v37 = a4;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  long long v50 = 0uLL;
  int64_t v51 = 0;
  if (v14)
  {
    [v14 blockPathForX:v15 zoom:a5 resolution:a6];
    long long v48 = 0uLL;
    uint64_t v49 = 0;
    [v14 blockPathForX:v16 zoom:a5 resolution:a6];
  }
  else
  {
    long long v48 = 0uLL;
    uint64_t v49 = 0;
  }
  long long v46 = v50;
  int64_t v47 = v51;
  long long v44 = v48;
  uint64_t v45 = v49;
  int v18 = [v14 hasAllBlocksAvailableBetweenStartPath:&v46 endPath:&v44];
  BOOL v19 = v18;
  if (v18)
  {
    BOOL v32 = v18;
    id v33 = v17;
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v21 = v50;
    if ((uint64_t)v50 <= (uint64_t)v48)
    {
      int64_t v35 = a6;
      id v36 = v14;
      int64_t v34 = a5;
      do
      {
        uint64_t v39 = v21;
        *(void *)&long long v46 = v21;
        *((void *)&v46 + 1) = a5;
        int64_t v47 = a6;
        BOOL v22 = [v14 cachedBlockForPath:&v46 context:v37];
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        uint64_t v38 = v22;
        id v23 = [v22 chartPoints];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v52 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v41 != v26) {
                objc_enumerationMutation(v23);
              }
              long long v28 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              id v29 = [v28 minXValueAsGenericType];
              uint64_t v30 = [v28 maxXValueAsGenericType];
              if ((objc_msgSend(v30, "hk_isBeforeDate:", v15) & 1) == 0
                && (objc_msgSend(v29, "hk_isAfterDate:", v16) & 1) == 0)
              {
                [v20 addObject:v28];
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v40 objects:v52 count:16];
          }
          while (v25);
        }

        uint64_t v21 = v39 + 1;
        a6 = v35;
        id v14 = v36;
        a5 = v34;
      }
      while (v39 < (uint64_t)v48);
    }
    id v17 = v33;
    (*((void (**)(id, id, uint64_t, void))v33 + 2))(v33, v20, 1, 0);

    BOOL v19 = v32;
  }

  return v19;
}

- (id)lollipopAnnotationColor
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopBackgroundColor");
}

- (id)lollipopExtensionColor
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopStickColor");
}

- (id)seriesSelectionLineColorForGraphView:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopStickColor", a3);
}

- (HKDisplayType)primaryDisplayType
{
  return self->_primaryDisplayType;
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(int64_t)a3
{
  self->_displayMode = a3;
}

- (HKValueRange)initialVisibleDateRange
{
  return self->_initialVisibleDateRange;
}

- (void)setInitialVisibleDateRange:(id)a3
{
}

- (HKDisplayType)overlayDisplayType
{
  return self->_overlayDisplayType;
}

- (void)setOverlayDisplayType:(id)a3
{
}

- (UIColor)currentOverlayColor
{
  return self->_currentOverlayColor;
}

- (void)setCurrentOverlayColor:(id)a3
{
}

- (NSMutableDictionary)overlayChartCaches
{
  return self->_overlayChartCaches;
}

- (void)setOverlayChartCaches:(id)a3
{
}

- (NSMutableDictionary)customNamedCaches
{
  return self->_customNamedCaches;
}

- (void)setCustomNamedCaches:(id)a3
{
}

- (_HKInteractiveChartOverlayWaitForCacheData)waitForCacheData
{
  return self->_waitForCacheData;
}

- (void)setWaitForCacheData:(id)a3
{
}

- (HKDisplayType)stackedDisplayType
{
  return self->_stackedDisplayType;
}

- (void)setStackedDisplayType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackedDisplayType, 0);
  objc_storeStrong((id *)&self->_waitForCacheData, 0);
  objc_storeStrong((id *)&self->_customNamedCaches, 0);
  objc_storeStrong((id *)&self->_overlayChartCaches, 0);
  objc_storeStrong((id *)&self->_currentOverlayColor, 0);
  objc_storeStrong((id *)&self->_overlayDisplayType, 0);
  objc_storeStrong((id *)&self->_initialVisibleDateRange, 0);
  objc_storeStrong((id *)&self->_primaryDisplayType, 0);
}

- (void)displayTypeForQuantityDistributionStyle:(uint64_t)a1 timeScope:(NSObject *)a2 overlayColor:options:alternateFormatter:namedPredicate:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Unable to determine the base series for an overlay", (uint8_t *)&v2, 0xCu);
}

@end