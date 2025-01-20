@interface HKSleepUtilities
+ (CGSize)_barCornerRadiusForCurrentDevice;
+ (double)somnogramBackgroundOpacityWithIsDarkMode:(BOOL)a3 isHighContrast:(BOOL)a4 isGrayScale:(BOOL)a5;
+ (id)_fillStylesFromColors:(id)a3;
+ (id)_findOrCreateSleepChartCacheForSleepDisplayType:(id)a3 cacheIdentifier:(id)a4 cacheController:(id)a5 dataSourceProvider:(id)a6;
+ (id)_generateComparisonSleepSeriesForTimeScope:(int64_t)a3;
+ (id)_generateDailyTimePeriodSeriesForTimeScope:(int64_t)a3;
+ (id)_generateDailyTimePeriodSeriesWithSchedulesForTimeScope:(int64_t)a3;
+ (id)_generateDurationSleepGoalSeriesForTimeScope:(int64_t)a3;
+ (id)_generateDurationSleepSeriesForTimeScope:(int64_t)a3;
+ (id)_generateSleepStageDurationSeriesForTimeScope:(int64_t)a3;
+ (id)_generateSleepStageSeriesForTimeScope:(int64_t)a3;
+ (id)_goalLineMarkerStyle;
+ (id)_goalLineStrokeStyle;
+ (id)_gradientFillColorForSleepAnalysis:(int64_t)a3 gradientPosition:(double)a4;
+ (id)_lessSaturatedColorWithColor:(id)a3;
+ (id)_scheduleMarkerStyleWithColor:(id)a3;
+ (id)_seriesStrokeStyle;
+ (id)_sleepSeriesAxisForSleepSeries:(id)a3 sleepSeriesType:(int64_t)a4 sleepDisplayType:(id)a5 unitController:(id)a6 numericAxisConfigurationOverrides:(id)a7;
+ (id)_sleepSeriesForType:(int64_t)a3 timeScope:(int64_t)a4;
+ (id)buildSleepChartCachesWithDisplayType:(id)a3 dataSourceProvider:(id)a4 cacheController:(id)a5 healthStore:(id)a6;
+ (id)buildSleepGraphSeriesForSleepSeriesType:(int64_t)a3 sleepDisplayType:(id)a4 unitController:(id)a5 numericAxisConfigurationOverrides:(id)a6 timeScope:(int64_t)a7;
+ (id)buildSleepGraphSeriesMappingWithSleepSeriesType:(int64_t)a3 sleepDisplayType:(id)a4 unitController:(id)a5 numericAxisConfigurationOverrides:(id)a6;
+ (id)fillStyleForSleepCategoryValue:(int64_t)a3 isActive:(BOOL)a4;
+ (id)localizedInfographicDescriptionForCategoryValue:(int64_t)a3;
+ (id)localizedInfographicTitleForCategoryValue:(int64_t)a3;
+ (id)sleepDaySummaryNoonAlignedXValue:(id)a3;
+ (id)sleepDaySummaryStandardXValue:(id)a3;
+ (id)sleepDisplayTypesWithHealthStore:(id)a3 sleepDisplayType:(id)a4 unitController:(id)a5 displayTypeController:(id)a6 chartCacheController:(id)a7 sleepChartFormatter:(id)a8 sleepSeriesType:(int64_t)a9 sleepChartCaches:(id)a10 customSleepSeries:(id)a11 isStackedChart:(BOOL)a12;
+ (id)sleepDisplayTypesWithHealthStore:(id)a3 sleepDisplayType:(id)a4 unitController:(id)a5 displayTypeController:(id)a6 chartCacheController:(id)a7 sleepChartFormatter:(id)a8 sleepSeriesType:(int64_t)a9 sleepChartCaches:(id)a10 customSleepSeriesMapping:(id)a11 isStackedChart:(BOOL)a12;
+ (id)sleepDurationNoDataRange;
+ (id)sleepStageContextTitleForSleepValue:(int64_t)a3 timeScope:(int64_t)a4;
+ (id)sleepStageFillStylesWithActiveSleepStage:(id)a3;
+ (id)verticalNumericalAxisWithConfigurationOverrides:(id)a3;
+ (int64_t)_axisPurposeForSleepSeriesType:(int64_t)a3;
+ (void)_applyModificationsToSleepSeries:(id)a3 sleepSeriesType:(int64_t)a4 sleepDisplayType:(id)a5 timeScope:(int64_t)a6 unitController:(id)a7 numericAxisConfigurationOverrides:(id)a8;
@end

@implementation HKSleepUtilities

+ (id)localizedInfographicTitleForCategoryValue:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v4 = v3;
      v5 = @"AWAKE";
      v6 = @"HealthUI-Localizable";
      goto LABEL_8;
    case 3:
      v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v4 = v3;
      v5 = @"ASLEEP_CORE";
      goto LABEL_7;
    case 4:
      v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v4 = v3;
      v5 = @"ASLEEP_DEEP";
      goto LABEL_7;
    case 5:
      v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v4 = v3;
      v5 = @"ASLEEP_REM";
LABEL_7:
      v6 = @"HealthUI-Localizable-Acacia";
LABEL_8:
      v7 = [v3 localizedStringForKey:v5 value:&stru_1F3B9CF20 table:v6];

      break;
    default:
      v7 = &stru_1F3B9CF20;
      break;
  }
  return v7;
}

+ (id)localizedInfographicDescriptionForCategoryValue:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v4 = v3;
      v5 = @"ASLEEP_AWAKE_DESCRIPTION";
      goto LABEL_7;
    case 3:
      v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v4 = v3;
      v5 = @"ASLEEP_CORE_DESCRIPTION";
      goto LABEL_7;
    case 4:
      v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v4 = v3;
      v5 = @"ASLEEP_DEEP_DESCRIPTION";
      goto LABEL_7;
    case 5:
      v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v4 = v3;
      v5 = @"ASLEEP_REM_DESCRIPTION";
LABEL_7:
      v6 = [v3 localizedStringForKey:v5 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Acacia"];

      break;
    default:
      v6 = &stru_1F3B9CF20;
      break;
  }
  return v6;
}

+ (id)sleepDaySummaryStandardXValue:(id)a3
{
  id v3 = a3;
  v4 = [v3 calendar];
  v5 = [v3 dateInterval];

  v6 = [v5 startDate];
  v7 = [v5 endDate];
  v8 = HKDateMid();

  uint64_t v9 = objc_msgSend(v8, "hk_morningIndexWithCalendar:", v4);
  v10 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_sleepDayStartForMorningIndex:calendar:", v9 + 1, v4);

  return v10;
}

+ (id)sleepDaySummaryNoonAlignedXValue:(id)a3
{
  id v3 = a3;
  v4 = [v3 calendar];
  v5 = +[HKSleepUtilities sleepDaySummaryStandardXValue:v3];

  v6 = objc_msgSend(v4, "hk_nearestNoonBeforeDateOrEqualToDate:", v5);

  return v6;
}

+ (id)sleepStageContextTitleForSleepValue:(int64_t)a3 timeScope:(int64_t)a4
{
  switch(a3)
  {
    case 0:
    case 1:
      _HKInitializeLogging();
      v5 = (void *)*MEMORY[0x1E4F29FA0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_ERROR)) {
        +[HKSleepUtilities sleepStageContextTitleForSleepValue:timeScope:](v5);
      }
      a4 = (int64_t)&stru_1F3B9CF20;
      break;
    case 2:
      v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      if (a4 == 6) {
        v7 = @"STAGES_OVERLAY_CONTEXT_AWAKE";
      }
      else {
        v7 = @"STAGES_OVERLAY_CONTEXT_AVERAGE_AWAKE";
      }
      goto LABEL_17;
    case 3:
      v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      if (a4 == 6) {
        v7 = @"STAGES_OVERLAY_CONTEXT_CORE";
      }
      else {
        v7 = @"STAGES_OVERLAY_CONTEXT_AVERAGE_CORE";
      }
      goto LABEL_17;
    case 4:
      v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      if (a4 == 6) {
        v7 = @"STAGES_OVERLAY_CONTEXT_DEEP";
      }
      else {
        v7 = @"STAGES_OVERLAY_CONTEXT_AVERAGE_DEEP";
      }
      goto LABEL_17;
    case 5:
      v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      if (a4 == 6) {
        v7 = @"STAGES_OVERLAY_CONTEXT_REM";
      }
      else {
        v7 = @"STAGES_OVERLAY_CONTEXT_AVERAGE_REM";
      }
LABEL_17:
      a4 = [v6 localizedStringForKey:v7 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Acacia"];

      break;
    default:
      break;
  }
  return (id)a4;
}

+ (id)verticalNumericalAxisWithConfigurationOverrides:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(HKSolidFillStyle);
  v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(HKSolidFillStyle *)v4 setColor:v5];

  v6 = objc_alloc_init(HKAxisStyle);
  v7 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartAxisLabelColor");
  v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartAxisLabelFont");
  uint64_t v9 = +[HKAxisLabelStyle labelStyleWithColor:v7 font:v8 horizontalAlignment:2 verticalAlignment:2];
  [(HKAxisStyle *)v6 setLabelStyle:v9];

  [(HKAxisStyle *)v6 setTickPositions:1];
  v10 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartGrayGraphColor");
  v11 = +[HKStrokeStyle strokeStyleWithColor:v10 lineWidth:2.0];
  [(HKAxisStyle *)v6 setAxisLineStyle:v11];

  [(HKAxisStyle *)v6 setFillStyle:v4];
  [(HKAxisStyle *)v6 setFillInnerPadding:10.0];
  [(HKAxisStyle *)v6 setFillOuterPadding:15.0];
  [(HKAxisStyle *)v6 setLocation:1];
  [(HKAxisStyle *)v6 setShowGridLines:1];
  v12 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartGrayGraphColor");
  v13 = [v12 colorWithAlphaComponent:0.5];
  v14 = +[HKStrokeStyle strokeStyleWithColor:v13 lineWidth:HKUIOnePixel()];
  [(HKAxisStyle *)v6 setGridLineStyle:v14];

  v15 = objc_alloc_init(HKNumericAxisConfiguration);
  [(HKAxisConfiguration *)v15 setPreferredStyle:v6];
  if (v3) {
    [(HKNumericAxisConfiguration *)v15 applyOverridesFromNumericAxisConfiguration:v3];
  }
  v16 = [[HKNumericAxis alloc] initWithConfiguration:v15];

  return v16;
}

+ (id)sleepDisplayTypesWithHealthStore:(id)a3 sleepDisplayType:(id)a4 unitController:(id)a5 displayTypeController:(id)a6 chartCacheController:(id)a7 sleepChartFormatter:(id)a8 sleepSeriesType:(int64_t)a9 sleepChartCaches:(id)a10 customSleepSeries:(id)a11 isStackedChart:(BOOL)a12
{
  v31[4] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a10;
  id v24 = a11;
  v25 = v24;
  if (v24)
  {
    v30[0] = &unk_1F3C21C10;
    v30[1] = &unk_1F3C21C28;
    v31[0] = v24;
    v31[1] = v24;
    v30[2] = &unk_1F3C21C40;
    v30[3] = &unk_1F3C21C58;
    v31[2] = v24;
    v31[3] = v24;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:4];
  }
  else
  {
    v26 = 0;
  }
  LOBYTE(v29) = a12;
  v27 = +[HKSleepUtilities sleepDisplayTypesWithHealthStore:v17 sleepDisplayType:v18 unitController:v19 displayTypeController:v20 chartCacheController:v21 sleepChartFormatter:v22 sleepSeriesType:a9 sleepChartCaches:v23 customSleepSeriesMapping:v26 isStackedChart:v29];

  return v27;
}

+ (id)sleepDisplayTypesWithHealthStore:(id)a3 sleepDisplayType:(id)a4 unitController:(id)a5 displayTypeController:(id)a6 chartCacheController:(id)a7 sleepChartFormatter:(id)a8 sleepSeriesType:(int64_t)a9 sleepChartCaches:(id)a10 customSleepSeriesMapping:(id)a11 isStackedChart:(BOOL)a12
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v18 = a4;
  id v41 = a5;
  id v39 = a6;
  id v38 = a7;
  id v37 = a8;
  id v19 = a10;
  id v20 = a11;
  if (a12)
  {
    id v21 = +[HKOverlayContextUtilities stackedAxisConfiguration];
  }
  else
  {
    id v21 = 0;
  }
  v36 = v21;
  if (v20)
  {
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __221__HKSleepUtilities_sleepDisplayTypesWithHealthStore_sleepDisplayType_unitController_displayTypeController_chartCacheController_sleepChartFormatter_sleepSeriesType_sleepChartCaches_customSleepSeriesMapping_isStackedChart___block_invoke;
    v46[3] = &unk_1E6D53F18;
    id v50 = a1;
    int64_t v51 = a9;
    id v47 = v18;
    id v48 = v41;
    id v49 = v21;
    [v20 enumerateKeysAndObjectsUsingBlock:v46];
    id v22 = v20;
  }
  else
  {
    id v22 = [a1 buildSleepGraphSeriesMappingWithSleepSeriesType:a9 sleepDisplayType:v18 unitController:v41 numericAxisConfigurationOverrides:v21];
  }
  id v23 = objc_msgSend(v19, "objectForKeyedSubscript:", @"HKSleepChartCacheIdentifierSleepConsistency", a2);
  if ((a9 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    uint64_t v24 = [v19 objectForKeyedSubscript:@"HKSleepChartCacheIdentifierSleepStages"];

    id v23 = (void *)v24;
  }
  if (!v23)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:v35 object:a1 file:@"HKSleepUtilities.m" lineNumber:216 description:@"Sleep chart cache should not be nil!"];
  }
  v25 = (void *)MEMORY[0x1E4F1CAD0];
  v26 = [v22 allValues];
  v27 = [v25 setWithArray:v26];

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __221__HKSleepUtilities_sleepDisplayTypesWithHealthStore_sleepDisplayType_unitController_displayTypeController_chartCacheController_sleepChartFormatter_sleepSeriesType_sleepChartCaches_customSleepSeriesMapping_isStackedChart___block_invoke_2;
  v42[3] = &unk_1E6D53F40;
  BOOL v45 = a12;
  id v43 = v23;
  id v44 = v18;
  id v28 = v18;
  id v29 = v23;
  [v27 enumerateObjectsUsingBlock:v42];
  v30 = [[HKInteractiveChartDisplayType alloc] initWithBaseDisplayType:v28 valueFormatter:v37 dataTypeCode:63 seriesForTimeScopeMapping:v22];
  v52[0] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];

  return v31;
}

void __221__HKSleepUtilities_sleepDisplayTypesWithHealthStore_sleepDisplayType_unitController_displayTypeController_chartCacheController_sleepChartFormatter_sleepSeriesType_sleepChartCaches_customSleepSeriesMapping_isStackedChart___block_invoke(void *a1, void *a2, void *a3)
{
  v5 = (void *)a1[7];
  uint64_t v6 = a1[8];
  uint64_t v7 = a1[4];
  id v8 = a3;
  objc_msgSend(v5, "_applyModificationsToSleepSeries:sleepSeriesType:sleepDisplayType:timeScope:unitController:numericAxisConfigurationOverrides:", v8, v6, v7, (int)objc_msgSend(a2, "intValue"), a1[5], a1[6]);
}

void __221__HKSleepUtilities_sleepDisplayTypesWithHealthStore_sleepDisplayType_unitController_displayTypeController_chartCacheController_sleepChartFormatter_sleepSeriesType_sleepChartCaches_customSleepSeriesMapping_isStackedChart___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = objc_alloc_init(HKCacheBackedChartSeriesDataSource);
  [(HKCacheBackedChartSeriesDataSource *)v3 setChartCache:*(void *)(a1 + 32)];
  [v7 setDataSource:v3];
  if (*(unsigned char *)(a1 + 48))
  {
    v4 = [v7 yAxis];
    if (v4)
    {
      v5 = [*(id *)(a1 + 40) localization];
      uint64_t v6 = [v5 shortenedDisplayName];
      +[HKOverlayContextUtilities setStackedSeriesLegend:v7 title:v6];
    }
  }
}

+ (id)buildSleepGraphSeriesMappingWithSleepSeriesType:(int64_t)a3 sleepDisplayType:(id)a4 unitController:(id)a5 numericAxisConfigurationOverrides:(id)a6
{
  v31[4] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  id v23 = __134__HKSleepUtilities_buildSleepGraphSeriesMappingWithSleepSeriesType_sleepDisplayType_unitController_numericAxisConfigurationOverrides___block_invoke;
  uint64_t v24 = &unk_1E6D53F68;
  id v28 = a1;
  int64_t v29 = a3;
  id v25 = v10;
  id v26 = v11;
  id v27 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  v16 = (void (**)(void *, uint64_t))_Block_copy(&v21);
  id v17 = v16[2](v16, 5);
  id v18 = v16[2](v16, 6);
  v30[0] = &unk_1F3C21C10;
  v30[1] = &unk_1F3C21C28;
  v31[0] = v18;
  v31[1] = v17;
  v30[2] = &unk_1F3C21C40;
  v30[3] = &unk_1F3C21C58;
  v31[2] = v17;
  v31[3] = v17;
  id v19 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v31, v30, 4, v21, v22, v23, v24);

  return v19;
}

uint64_t __134__HKSleepUtilities_buildSleepGraphSeriesMappingWithSleepSeriesType_sleepDisplayType_unitController_numericAxisConfigurationOverrides___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 56) buildSleepGraphSeriesForSleepSeriesType:*(void *)(a1 + 64) sleepDisplayType:*(void *)(a1 + 32) unitController:*(void *)(a1 + 40) numericAxisConfigurationOverrides:*(void *)(a1 + 48) timeScope:a2];
}

+ (id)buildSleepGraphSeriesForSleepSeriesType:(int64_t)a3 sleepDisplayType:(id)a4 unitController:(id)a5 numericAxisConfigurationOverrides:(id)a6 timeScope:(int64_t)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = [a1 _sleepSeriesForType:a3 timeScope:a7];
  [a1 _applyModificationsToSleepSeries:v15 sleepSeriesType:a3 sleepDisplayType:v14 timeScope:a7 unitController:v13 numericAxisConfigurationOverrides:v12];

  return v15;
}

+ (void)_applyModificationsToSleepSeries:(id)a3 sleepSeriesType:(int64_t)a4 sleepDisplayType:(id)a5 timeScope:(int64_t)a6 unitController:(id)a7 numericAxisConfigurationOverrides:(id)a8
{
  id v14 = a3;
  id v15 = [a1 _sleepSeriesAxisForSleepSeries:v14 sleepSeriesType:a4 sleepDisplayType:a5 unitController:a7 numericAxisConfigurationOverrides:a8];
  [v14 setYAxis:v15];

  id v16 = +[HKSleepAnalysisDataSourceContext sleepAnalysisDataSourceContextWithChartType:a4 timeScope:a6];
  [v14 setSeriesDataSourceContext:v16];
}

+ (id)_sleepSeriesAxisForSleepSeries:(id)a3 sleepSeriesType:(int64_t)a4 sleepDisplayType:(id)a5 unitController:(id)a6 numericAxisConfigurationOverrides:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  uint64_t v16 = [a1 _axisPurposeForSleepSeriesType:a4];
  id v17 = objc_alloc_init(HKNumericAxisConfiguration);
  [(HKAxisConfiguration *)v17 setMaxLabels:8];
  id v18 = +[HKChartAxisDimensionFactory dimensionWithPurpose:v16 displayType:v15 unitController:v14];

  [(HKNumericAxisConfiguration *)v17 setLabelDimension:v18];
  if (v13) {
    [(HKNumericAxisConfiguration *)v17 applyOverridesFromNumericAxisConfiguration:v13];
  }
  if ([v12 conformsToProtocol:&unk_1F3C4EF78]) {
    [(HKAxisConfiguration *)v17 setLabelDataSource:v12];
  }
  id v19 = +[HKSleepUtilities verticalNumericalAxisWithConfigurationOverrides:v17];

  return v19;
}

+ (id)_findOrCreateSleepChartCacheForSleepDisplayType:(id)a3 cacheIdentifier:(id)a4 cacheController:(id)a5 dataSourceProvider:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(void))a6;
  id v13 = [v11 findCustomCachesForDisplayType:v9];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __119__HKSleepUtilities__findOrCreateSleepChartCacheForSleepDisplayType_cacheIdentifier_cacheController_dataSourceProvider___block_invoke;
  v19[3] = &unk_1E6D53F90;
  id v14 = v10;
  id v20 = v14;
  objc_msgSend(v13, "hk_firstObjectPassingTest:", v19);
  id v15 = (HKChartCache *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    id v15 = objc_alloc_init(HKChartCache);
    uint64_t v16 = v12[2](v12);
    [(HKChartCache *)v15 setDataSource:v16];

    id v17 = +[HKOutstandingFetchOperationManager sharedOperationManager];
    [(HKChartCache *)v15 setOperationManager:v17];

    [v11 addCustomChartCache:v15 forDisplayType:v9];
  }

  return v15;
}

uint64_t __119__HKSleepUtilities__findOrCreateSleepChartCacheForSleepDisplayType_cacheIdentifier_cacheController_dataSourceProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 dataSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v6 = [v3 dataSource];
    id v7 = [v6 cacheIdentifier];
    uint64_t v8 = [v7 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)buildSleepChartCachesWithDisplayType:(id)a3 dataSourceProvider:(id)a4 cacheController:(id)a5 healthStore:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)MEMORY[0x1E4F1CA60];
  id v14 = a5;
  id v15 = [v13 dictionary];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __104__HKSleepUtilities_buildSleepChartCachesWithDisplayType_dataSourceProvider_cacheController_healthStore___block_invoke;
  v33[3] = &unk_1E6D53FB8;
  id v16 = v11;
  id v34 = v16;
  id v17 = v12;
  id v35 = v17;
  id v18 = v10;
  id v36 = v18;
  id v19 = [a1 _findOrCreateSleepChartCacheForSleepDisplayType:v18 cacheIdentifier:@"HKSleepChartCacheIdentifierSleepConsistency" cacheController:v14 dataSourceProvider:v33];
  [v15 setObject:v19 forKeyedSubscript:@"HKSleepChartCacheIdentifierSleepConsistency"];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  id v28 = __104__HKSleepUtilities_buildSleepChartCachesWithDisplayType_dataSourceProvider_cacheController_healthStore___block_invoke_2;
  int64_t v29 = &unk_1E6D53FB8;
  id v30 = v16;
  id v31 = v17;
  id v32 = v18;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = [a1 _findOrCreateSleepChartCacheForSleepDisplayType:v20 cacheIdentifier:@"HKSleepChartCacheIdentifierSleepStages" cacheController:v14 dataSourceProvider:&v26];

  objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, @"HKSleepChartCacheIdentifierSleepStages", v26, v27, v28, v29);
  uint64_t v24 = (void *)[v15 copy];

  return v24;
}

uint64_t __104__HKSleepUtilities_buildSleepChartCachesWithDisplayType_dataSourceProvider_cacheController_healthStore___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) makeSleepDataSourceFromHealthStore:*(void *)(a1 + 40) representativeDisplayType:*(void *)(a1 + 48)];
}

uint64_t __104__HKSleepUtilities_buildSleepChartCachesWithDisplayType_dataSourceProvider_cacheController_healthStore___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) makeSleepStagesDataSourceFromHealthStore:*(void *)(a1 + 40) representativeDisplayType:*(void *)(a1 + 48)];
}

+ (id)_sleepSeriesForType:(int64_t)a3 timeScope:(int64_t)a4
{
  switch(a3)
  {
    case 0:
      objc_msgSend(a1, "_generateDurationSleepSeriesForTimeScope:", a4, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 1:
      objc_msgSend(a1, "_generateDailyTimePeriodSeriesForTimeScope:", a4, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 2:
      objc_msgSend(a1, "_generateDurationSleepGoalSeriesForTimeScope:", a4, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 3:
      objc_msgSend(a1, "_generateDailyTimePeriodSeriesWithSchedulesForTimeScope:", a4, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 4:
      objc_msgSend(a1, "_generateSleepStageSeriesForTimeScope:", a4, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 5:
      objc_msgSend(a1, "_generateSleepStageDurationSeriesForTimeScope:", a4, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 6:
      objc_msgSend(a1, "_generateComparisonSleepSeriesForTimeScope:", a4, v4);
      a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
      break;
    default:
      break;
  }
  return a1;
}

+ (int64_t)_axisPurposeForSleepSeriesType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 0;
  }
  else {
    return qword_1E0F05A60[a3 - 1];
  }
}

+ (id)_generateDailyTimePeriodSeriesForTimeScope:(int64_t)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepInBedColor");
  v28[0] = v5;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepAsleepColor");
  v28[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];

  uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepInactiveInBedColor");
  v27[0] = v8;
  id v9 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepInactiveAsleepColor");
  v27[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];

  id v11 = &off_1E6D50000;
  if (a3 != 6) {
    id v11 = &off_1E6D50010;
  }
  id v12 = objc_alloc_init(*v11);
  id v13 = [a1 _seriesStrokeStyle];
  [v12 setStrokeStyle:v13];

  id v14 = [MEMORY[0x1E4FB1618] clearColor];
  id v15 = +[HKStrokeStyle strokeStyleWithColor:v14 lineWidth:2.0];
  [v12 setTiledStrokeStyle:v15];

  double v16 = 1.0;
  double v17 = 1.0;
  if (a3 == 6) {
    objc_msgSend(a1, "_barCornerRadiusForCurrentDevice", 1.0, 1.0);
  }
  objc_msgSend(v12, "setCornerRadii:", v17, v16);
  id v18 = [a1 _fillStylesFromColors:v7];
  [v12 setDefaultFillStyles:v18];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __63__HKSleepUtilities__generateDailyTimePeriodSeriesForTimeScope___block_invoke;
  v26[3] = &__block_descriptor_40_e17__16__0__UIColor_8l;
  v26[4] = a1;
  id v19 = objc_msgSend(v7, "hk_map:", v26);
  id v20 = [a1 _fillStylesFromColors:v19];
  [v12 setHighlightedFillStyles:v20];

  id v21 = [a1 _fillStylesFromColors:v10];
  [v12 setInactiveFillStyles:v21];

  id v22 = +[HKNumericMinimumRangeAxisScalingRule ruleWithDefaultYAxisRange:0 axisRangeOverrides:14400.0];
  id v23 = +[HKValueRange valueRangeWithMinValue:&unk_1F3C21C70 maxValue:&unk_1F3C21C88];
  [v22 setAxisBounds:v23];

  [v12 setAxisScalingRule:v22];
  uint64_t v24 = HKCalendarDateTransformPreceding6PM();
  [v12 setStartOfDayTransform:v24];

  return v12;
}

uint64_t __63__HKSleepUtilities__generateDailyTimePeriodSeriesForTimeScope___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _lessSaturatedColorWithColor:a2];
}

+ (id)_generateSleepStageSeriesForTimeScope:(int64_t)a3
{
  v41[5] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepAwakeColor");
  v41[0] = v5;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepAsleepREMColor");
  v41[1] = v6;
  id v7 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepAsleepCoreColor");
  v41[2] = v7;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepAsleepDeepColor");
  v41[3] = v8;
  id v9 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepAsleepColor");
  v41[4] = v9;
  uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:5];

  id v10 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepInactiveAwakeColor");
  v40[0] = v10;
  id v11 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepInactiveAsleepREMColor");
  v40[1] = v11;
  id v12 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepInactiveAsleepCoreColor");
  v40[2] = v12;
  id v13 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepInactiveAsleepDeepColor");
  v40[3] = v13;
  id v14 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepInactiveAsleepColor");
  v40[4] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:5];

  if (a3 == 6)
  {
    double v16 = objc_alloc_init(HKSleepStageDaySeries);
    -[HKSleepStageDaySeries setCornerRadii:](v16, "setCornerRadii:", 5.0, 5.0);
    double v17 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartAxisLabelFont");
    [(HKSleepStageDaySeries *)v16 setSleepStageLabelFont:v17];

    id v18 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLightGrayTextColor");
    [(HKSleepStageDaySeries *)v16 setSleepStageLabelColor:v18];

    id v19 = +[HKSleepUtilities sleepStageFillStylesWithActiveSleepStage:0];
    [(HKSleepStageDaySeries *)v16 setSleepStageFillStyles:v19];

    id v20 = [a1 _gradientFillColorForSleepAnalysis:2 gradientPosition:0.2];
    v39[0] = v20;
    id v21 = [a1 _gradientFillColorForSleepAnalysis:5 gradientPosition:0.35];
    v39[1] = v21;
    id v22 = [a1 _gradientFillColorForSleepAnalysis:3 gradientPosition:0.66];
    v39[2] = v22;
    id v23 = [a1 _gradientFillColorForSleepAnalysis:4 gradientPosition:0.85];
    v39[3] = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];

    id v25 = [[HKMultiGradientFillStyle alloc] initWithColors:v24];
    [(HKSleepStageDaySeries *)v16 setSleepStageBackgroundFillStyle:v25];

    uint64_t v26 = objc_alloc_init(HKSolidFillStyle);
    uint64_t v27 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepInactiveInBedColor");
    [(HKSolidFillStyle *)v26 setColor:v27];

    [(HKSleepStageDaySeries *)v16 setSleepStageBackgroundInactiveFillStyle:v26];
    id v28 = (void *)v38;
  }
  else
  {
    double v16 = objc_alloc_init(HKSleepStageSeries);
    int64_t v29 = [a1 _seriesStrokeStyle];
    [(HKSleepStageDaySeries *)v16 setStrokeStyle:v29];

    id v30 = [MEMORY[0x1E4FB1618] clearColor];
    id v31 = +[HKStrokeStyle strokeStyleWithColor:v30 lineWidth:2.0];
    [(HKSleepStageDaySeries *)v16 setTiledStrokeStyle:v31];

    -[HKSleepStageDaySeries setCornerRadii:](v16, "setCornerRadii:", 1.0, 1.0);
    id v28 = (void *)v38;
    id v32 = [a1 _fillStylesFromColors:v38];
    [(HKSleepStageDaySeries *)v16 setDefaultFillStyles:v32];

    v33 = [a1 _fillStylesFromColors:v38];
    [(HKSleepStageDaySeries *)v16 setHighlightedFillStyles:v33];

    id v34 = [a1 _fillStylesFromColors:v15];
    [(HKSleepStageDaySeries *)v16 setInactiveFillStyles:v34];

    id v35 = [a1 _fillStylesFromColors:v38];
    [(HKSleepStageDaySeries *)v16 setSleepStageFillStyles:v35];

    uint64_t v24 = +[HKNumericMinimumRangeAxisScalingRule ruleWithDefaultYAxisRange:0 axisRangeOverrides:14400.0];
    id v36 = +[HKValueRange valueRangeWithMinValue:&unk_1F3C21C70 maxValue:&unk_1F3C21C88];
    [v24 setAxisBounds:v36];

    [(HKGraphSeries *)v16 setAxisScalingRule:v24];
    HKCalendarDateTransformPreceding6PM();
    uint64_t v26 = (HKSolidFillStyle *)objc_claimAutoreleasedReturnValue();
    [(HKSleepStageDaySeries *)v16 setStartOfDayTransform:v26];
  }

  return v16;
}

+ (id)_generateSleepStageDurationSeriesForTimeScope:(int64_t)a3
{
  v15[5] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepAwakeColor");
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepAsleepREMColor", v5);
  v15[1] = v6;
  id v7 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepAsleepCoreColor");
  v15[2] = v7;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepAsleepDeepColor");
  v15[3] = v8;
  id v9 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepInactiveInBedColor");
  v15[4] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:5];

  id v11 = off_1E6D50038;
  if (a3 != 6) {
    id v11 = off_1E6D50040;
  }
  id v12 = objc_alloc_init(*v11);
  objc_msgSend(v12, "setCornerRadii:", 1.0, 1.0);
  id v13 = [a1 _fillStylesFromColors:v10];
  [v12 setSleepStageFillStyles:v13];

  [v12 setGoalLineStrokeStyle:0];
  [v12 setGoalLineMarkerStyle:0];
  [v12 setTiledStrokeStyle:0];
  [v12 setUnselectedStrokeStyle:0];

  return v12;
}

+ (id)sleepStageFillStylesWithActiveSleepStage:(id)a3
{
  v17[6] = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3 == 0;
  uint64_t v4 = [a3 integerValue];
  uint64_t v5 = v4 == 2 || v3;
  uint64_t v6 = v4 == 5 || v3;
  uint64_t v7 = v4 == 3 || v3;
  uint64_t v8 = v4 == 4 || v3;
  id v9 = +[HKSleepUtilities fillStyleForSleepCategoryValue:2 isActive:v5];
  v17[0] = v9;
  id v10 = +[HKSleepUtilities fillStyleForSleepCategoryValue:5 isActive:v6];
  v17[1] = v10;
  id v11 = +[HKSleepUtilities fillStyleForSleepCategoryValue:3 isActive:v7];
  v17[2] = v11;
  id v12 = +[HKSleepUtilities fillStyleForSleepCategoryValue:4 isActive:v8];
  v17[3] = v12;
  id v13 = +[HKSleepUtilities fillStyleForSleepCategoryValue:0 isActive:v3];
  v17[4] = v13;
  id v14 = +[HKSleepUtilities fillStyleForSleepCategoryValue:1 isActive:v3];
  v17[5] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:6];

  return v15;
}

+ (id)_gradientFillColorForSleepAnalysis:(int64_t)a3 gradientPosition:(double)a4
{
  uint64_t v6 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  BOOL v7 = [v6 accessibilityContrast] == 1;

  uint64_t v8 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  BOOL v9 = [v8 userInterfaceStyle] == 2;

  +[HKSleepUtilities somnogramBackgroundOpacityWithIsDarkMode:v9 isHighContrast:v7 isGrayScale:0];
  double v11 = v10;
  id v12 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepColorForSleepAnalysis:", a3);
  id v13 = [v12 colorWithAlphaComponent:v11];

  id v14 = [HKMultiGradientFillColor alloc];
  id v15 = [NSNumber numberWithDouble:a4];
  double v16 = [(HKMultiGradientFillColor *)v14 initWithColor:v13 location:v15];

  return v16;
}

+ (CGSize)_barCornerRadiusForCurrentDevice
{
  v2 = [MEMORY[0x1E4F2B860] sharedBehavior];
  if ([v2 isiPad]) {
    double v3 = 3.0;
  }
  else {
    double v3 = 1.0;
  }

  double v4 = v3;
  double v5 = v3;
  result.height = v5;
  result.width = v4;
  return result;
}

+ (id)fillStyleForSleepCategoryValue:(int64_t)a3 isActive:(BOOL)a4
{
  uint64_t v6 = objc_alloc_init(HKSolidFillStyle);
  if (a4) {
    objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepColorForSleepAnalysis:", a3);
  }
  else {
  BOOL v7 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepInactiveColorForSleepAnalysis:", a3);
  }
  [(HKSolidFillStyle *)v6 setColor:v7];

  return v6;
}

+ (id)_fillStylesFromColors:(id)a3
{
  return (id)objc_msgSend(a3, "hk_map:", &__block_literal_global_46);
}

HKSolidFillStyle *__42__HKSleepUtilities__fillStylesFromColors___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = objc_alloc_init(HKSolidFillStyle);
  [(HKSolidFillStyle *)v3 setColor:v2];

  return v3;
}

+ (double)somnogramBackgroundOpacityWithIsDarkMode:(BOOL)a3 isHighContrast:(BOOL)a4 isGrayScale:(BOOL)a5
{
  if (a5)
  {
    double result = 0.35;
    goto LABEL_8;
  }
  if (!a3)
  {
    double result = 0.45;
LABEL_8:
    if (!a4) {
      return 0.25;
    }
    return result;
  }
  double result = 0.5;
  if (a4) {
    return 0.75;
  }
  return result;
}

+ (id)_generateDailyTimePeriodSeriesWithSchedulesForTimeScope:(int64_t)a3
{
  double v5 = objc_msgSend(a1, "_generateDailyTimePeriodSeriesForTimeScope:");
  uint64_t v6 = MEMORY[0x1E4F1CBF0];
  [v5 setDefaultFillStyles:MEMORY[0x1E4F1CBF0]];
  [v5 setHighlightedFillStyles:v6];
  [v5 setInactiveFillStyles:v6];
  [v5 setStrokeStyle:0];
  [v5 setTiledStrokeStyle:0];
  BOOL v7 = [a1 _goalLineStrokeStyle];
  [v5 setGoalLineStrokeStyle:v7];

  if (a3 == 6)
  {
    [v5 setUpperGoalLineMarkerStyle:0];
    [v5 setLowerGoalLineMarkerStyle:0];
  }
  else
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepAsleepColor");
    BOOL v9 = [a1 _scheduleMarkerStyleWithColor:v8];
    [v5 setLowerGoalLineMarkerStyle:v9];

    double v10 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepAsleepColor");
    double v11 = [a1 _scheduleMarkerStyleWithColor:v10];
    [v5 setUpperGoalLineMarkerStyle:v11];
  }
  return v5;
}

+ (id)_generateComparisonSleepSeriesForTimeScope:(int64_t)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if (a3 == 6)
  {
    double v4 = objc_alloc_init(HKSleepComparisonDaySeries);
    [a1 _barCornerRadiusForCurrentDevice];
    -[HKSleepComparisonDaySeries setCornerRadii:](v4, "setCornerRadii:");
    double v5 = [a1 fillStyleForSleepCategoryValue:0 isActive:1];
    v14[0] = v5;
    uint64_t v6 = [a1 fillStyleForSleepCategoryValue:_HKCategoryValueSleepAnalysisDefaultAsleepValue() isActive:1];
    v14[1] = v6;
    BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    [(HKSleepComparisonDaySeries *)v4 setDefaultFillStyles:v7];

    uint64_t v8 = [NSNumber numberWithDouble:0.0];
    BOOL v9 = [NSNumber numberWithDouble:43200.0];
    double v10 = +[HKValueRange valueRangeWithMinValue:v8 maxValue:v9];

    double v11 = +[HKNumericFixedAxisScalingRule ruleWithDefaultAxisBounds:v10 axisBoundsOverrides:0];
  }
  else
  {
    objc_msgSend(a1, "_generateDailyTimePeriodSeriesForTimeScope:");
    double v4 = (HKSleepComparisonDaySeries *)objc_claimAutoreleasedReturnValue();
    double v10 = +[HKValueRange valueRangeWithMinValue:&unk_1F3C21C70 maxValue:&unk_1F3C22A10];
    double v11 = +[HKNumericMinimumRangeAxisScalingRule ruleWithDefaultYAxisRange:0 axisRangeOverrides:3600.0];
  }
  id v12 = v11;
  [v11 setNoDataAxisBounds:v10];
  [(HKGraphSeries *)v4 setAxisScalingRule:v12];

  return v4;
}

+ (id)sleepDurationNoDataRange
{
  id v2 = (void *)MEMORY[0x1E4F2B370];
  double v3 = [MEMORY[0x1E4F2B618] hourUnit];
  double v4 = [v2 quantityWithUnit:v3 doubleValue:0.0];

  double v5 = (void *)MEMORY[0x1E4F2B370];
  uint64_t v6 = [MEMORY[0x1E4F2B618] hourUnit];
  BOOL v7 = [v5 quantityWithUnit:v6 doubleValue:12.0];

  uint64_t v8 = +[HKValueRange valueRangeWithMinValue:v4 maxValue:v7];

  return v8;
}

+ (id)_generateDurationSleepSeriesForTimeScope:(int64_t)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  double v3 = &off_1E6D4FFE0;
  if (a3 == 6) {
    double v3 = off_1E6D4FFD8;
  }
  id v4 = objc_alloc_init(*v3);
  double v5 = [v4 axisScalingRule];
  int v6 = [v5 conformsToProtocol:&unk_1F3CD4A00];

  if (v6)
  {
    BOOL v7 = +[HKSleepUtilities sleepDurationNoDataRange];
    uint64_t v8 = [v4 axisScalingRule];
    [v8 setNoDataAxisBounds:v7];
  }
  [v4 setGoalLineStrokeStyle:0];
  [v4 setGoalLineMarkerStyle:0];
  BOOL v9 = [MEMORY[0x1E4FB1618] clearColor];
  double v10 = +[HKStrokeStyle strokeStyleWithColor:v9 lineWidth:3.0];
  [v4 setTiledStrokeStyle:v10];

  double v11 = objc_alloc_init(HKStrokeStyle);
  id v12 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.0];
  [(HKStrokeStyle *)v11 setStrokeColor:v12];

  [(HKStrokeStyle *)v11 setLineWidth:3.0];
  [(HKStrokeStyle *)v11 setBlendMode:22];
  [v4 setUnselectedStrokeStyle:v11];
  objc_msgSend(v4, "setCornerRadii:", 1.0, 1.0);
  id v13 = objc_alloc_init(HKSolidFillStyle);
  id v14 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepAsleepColor");
  [(HKSolidFillStyle *)v13 setColor:v14];

  id v15 = objc_alloc_init(HKSolidFillStyle);
  double v16 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepInBedColor");
  [(HKSolidFillStyle *)v15 setColor:v16];

  v25[0] = v13;
  v25[1] = v15;
  double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  [v4 setDefaultFillStyles:v17];

  id v18 = objc_alloc_init(HKSolidFillStyle);
  id v19 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepInactiveAsleepColor");
  [(HKSolidFillStyle *)v18 setColor:v19];

  id v20 = objc_alloc_init(HKSolidFillStyle);
  id v21 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepInactiveInBedColor");
  [(HKSolidFillStyle *)v20 setColor:v21];

  v24[0] = v18;
  v24[1] = v20;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  [v4 setInactiveFillStyles:v22];

  return v4;
}

+ (id)_generateDurationSleepGoalSeriesForTimeScope:(int64_t)a3
{
  if (a3 == 6)
  {
    id v4 = objc_alloc_init(HKSleepDurationDaySeries);
    double v5 = [a1 _goalLineStrokeStyle];
    [(HKSleepDurationSeries *)v4 setGoalLineStrokeStyle:v5];

    [(HKBarSeries *)v4 setTiledStrokeStyle:0];
    [(HKSleepDurationSeries *)v4 setDefaultFillStyles:0];
    [(HKSleepDurationSeries *)v4 setGoalLineMarkerStyle:0];
  }
  else
  {
    id v4 = objc_alloc_init(HKSleepDurationSeries);
    int v6 = [a1 _goalLineStrokeStyle];
    [(HKSleepDurationSeries *)v4 setGoalLineStrokeStyle:v6];

    [(HKBarSeries *)v4 setTiledStrokeStyle:0];
    [(HKSleepDurationSeries *)v4 setDefaultFillStyles:0];
    BOOL v7 = [a1 _goalLineMarkerStyle];
    [(HKSleepDurationSeries *)v4 setGoalLineMarkerStyle:v7];
  }
  return v4;
}

+ (id)_goalLineStrokeStyle
{
  id v2 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepAsleepColor");
  double v3 = +[HKStrokeStyle strokeStyleWithColor:v2 lineWidth:2.0];

  [v3 setDashStyle:0];
  return v3;
}

+ (id)_scheduleMarkerStyleWithColor:(id)a3
{
  id v3 = a3;
  id v4 = [[HKLineSeriesPointMarkerStyle alloc] initWithColor:v3 radius:1 style:4.0];

  return v4;
}

+ (id)_goalLineMarkerStyle
{
  id v2 = [HKLineSeriesPointMarkerStyle alloc];
  id v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepAsleepColor");
  id v4 = [(HKLineSeriesPointMarkerStyle *)v2 initWithColor:v3 radius:1 style:4.0];

  return v4;
}

+ (id)_lessSaturatedColorWithColor:(id)a3
{
  double v8 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v5 = 0.0;
  [a3 getHue:&v8 saturation:&v7 brightness:&v6 alpha:&v5];
  id v3 = [MEMORY[0x1E4FB1618] colorWithHue:v8 saturation:v7 * 0.5 brightness:v6 alpha:v5];
  return v3;
}

+ (id)_seriesStrokeStyle
{
  id v2 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.0];
  id v3 = +[HKStrokeStyle strokeStyleWithColor:v2 lineWidth:2.0];
  [v3 setBlendMode:22];

  return v3;
}

+ (void)sleepStageContextTitleForSleepValue:(void *)a1 timeScope:.cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  int v4 = 138543362;
  double v5 = v3;
  _os_log_error_impl(&dword_1E0B26000, v1, OS_LOG_TYPE_ERROR, "%{public}@: Can't create stage context title for unsupported sleep category value", (uint8_t *)&v4, 0xCu);
}

@end