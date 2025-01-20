@interface HKCardioFitnessUtilities
+ (BOOL)cardioFitnessLevelChartShouldDisplayLowerBound:(int64_t)a3;
+ (BOOL)cardioFitnessLevelChartShouldDisplayUpperBound:(int64_t)a3;
+ (id)_localizationKeyForCardioFitnessLevel:(int64_t)a3 keyVariant:(id)a4;
+ (id)cardioFitnessDataForBiologicalSex:(int64_t)a3;
+ (id)cardioFitnessDataForBiologicalSex:(int64_t)a3 age:(int64_t)a4;
+ (id)cardioFitnessDataForLevel:(int64_t)a3 biologicalSex:(int64_t)a4 age:(int64_t)a5;
+ (id)cardioFitnessDataForLevel:(int64_t)a3 date:(id)a4 healthStore:(id)a5;
+ (id)cardioFitnessDataForVO2Max:(double)a3 biologicalSex:(int64_t)a4 age:(int64_t)a5;
+ (id)cardioFitnessInteractiveChartViewControllerWithDisplayDate:(id)a3 applicationItems:(id)a4 preferredOverlay:(int64_t)a5 analyticsDelegate:(id)a6 restorationUserActivity:(id)a7 trendModel:(id)a8 factorDisplayTypes:(id)a9 additionalChartOptions:(unint64_t)a10;
+ (id)cardioFitnessLevelDataForChartData:(id)a3;
+ (id)cardioFitnessLevelDateIntervalsWithDateInterval:(id)a3 healthStore:(id)a4;
+ (id)cardioFitnessLookupPropertiesForChartData:(id)a3;
+ (id)classificationIdentifierForIndex:(int64_t)a3;
+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11;
+ (id)effectiveChartPointDateWithStatisticsInterval:(id)a3 startDate:(id)a4 endDate:(id)a5;
+ (id)flattenedCardioFitnessDataForBiologicalSex:(int64_t)a3;
+ (id)localizationKeyForCardioFitnessLevel:(int64_t)a3;
+ (id)localizedStringForCardioFitnessDescription:(int64_t)a3 age:(int64_t)a4;
+ (id)localizedStringForCardioFitnessLevel:(int64_t)a3;
+ (id)localizedStringForCardioFitnessLevelName:(int64_t)a3;
+ (id)localizedStringForCardioFitnessTitle:(int64_t)a3;
+ (id)vo2MaxInteractiveChartViewControllerWithDisplayDate:(id)a3 applicationItems:(id)a4 restorationUserActivity:(id)a5 trendModel:(id)a6 factorDisplayTypes:(id)a7 additionalChartOptions:(unint64_t)a8;
+ (int64_t)cardioFitnessLevelForVO2Max:(double)a3 biologicalSex:(int64_t)a4 age:(int64_t)a5;
+ (int64_t)cardioFitnessLevelForVO2MaxSample:(id)a3 inHealthStore:(id)a4;
@end

@implementation HKCardioFitnessUtilities

+ (id)flattenedCardioFitnessDataForBiologicalSex:(int64_t)a3
{
  return (id)[MEMORY[0x1E4F2ACA0] flattenedCardioFitnessDataForBiologicalSex:a3];
}

+ (id)cardioFitnessDataForBiologicalSex:(int64_t)a3
{
  return (id)[MEMORY[0x1E4F2ACA0] cardioFitnessDataForBiologicalSex:a3];
}

+ (id)cardioFitnessDataForBiologicalSex:(int64_t)a3 age:(int64_t)a4
{
  return (id)[MEMORY[0x1E4F2ACA0] cardioFitnessDataForBiologicalSex:a3 age:a4];
}

+ (id)cardioFitnessDataForVO2Max:(double)a3 biologicalSex:(int64_t)a4 age:(int64_t)a5
{
  return (id)[MEMORY[0x1E4F2ACA0] cardioFitnessDataForVO2Max:a4 biologicalSex:a5 age:a3];
}

+ (id)cardioFitnessDataForLevel:(int64_t)a3 biologicalSex:(int64_t)a4 age:(int64_t)a5
{
  return (id)[MEMORY[0x1E4F2ACA0] cardioFitnessDataForLevel:a3 biologicalSex:a4 age:a5];
}

+ (id)cardioFitnessDataForLevel:(int64_t)a3 date:(id)a4 healthStore:(id)a5
{
  return (id)[MEMORY[0x1E4F2ACA0] cardioFitnessDataForLevel:a3 date:a4 healthStore:a5];
}

+ (int64_t)cardioFitnessLevelForVO2Max:(double)a3 biologicalSex:(int64_t)a4 age:(int64_t)a5
{
  return [MEMORY[0x1E4F2ACA0] cardioFitnessLevelForVO2Max:a4 biologicalSex:a5 age:a3];
}

+ (int64_t)cardioFitnessLevelForVO2MaxSample:(id)a3 inHealthStore:(id)a4
{
  return [MEMORY[0x1E4F2ACA0] cardioFitnessLevelForVO2MaxSample:a3 inHealthStore:a4];
}

+ (id)cardioFitnessLevelDateIntervalsWithDateInterval:(id)a3 healthStore:(id)a4
{
  return (id)[MEMORY[0x1E4F2ACA0] cardioFitnessLevelDateIntervalsWithDateInterval:a3 healthStore:a4];
}

+ (id)_localizationKeyForCardioFitnessLevel:(int64_t)a3 keyVariant:(id)a4
{
  id v5 = a4;
  if ((unint64_t)(a3 + 1) > 4)
  {
    v6 = 0;
  }
  else
  {
    v6 = [(__CFString *)off_1E6D53058[a3 + 1] stringByReplacingOccurrencesOfString:@"%@" withString:v5];
  }

  return v6;
}

+ (id)localizationKeyForCardioFitnessLevel:(int64_t)a3
{
  return (id)[a1 _localizationKeyForCardioFitnessLevel:a3 keyVariant:@"LEVEL"];
}

+ (id)localizedStringForCardioFitnessLevel:(int64_t)a3
{
  v3 = [a1 localizationKeyForCardioFitnessLevel:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v5 = [v4 localizedStringForKey:v3 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-CardioFitness"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)localizedStringForCardioFitnessTitle:(int64_t)a3
{
  v3 = [a1 _localizationKeyForCardioFitnessLevel:a3 keyVariant:@"TITLE"];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v5 = [v4 localizedStringForKey:v3 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-CardioFitness"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)classificationIdentifierForIndex:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 4) {
    return 0;
  }
  else {
    return off_1E6D53080[a3 + 1];
  }
}

+ (id)localizedStringForCardioFitnessLevelName:(int64_t)a3
{
  v3 = [a1 _localizationKeyForCardioFitnessLevel:a3 keyVariant:@"LEVEL_NAME"];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v5 = [v4 localizedStringForKey:v3 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-CardioFitness"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)localizedStringForCardioFitnessDescription:(int64_t)a3 age:(int64_t)a4
{
  if (a4 <= 59) {
    v4 = @"DESCRIPTION";
  }
  else {
    v4 = @"DESCRIPTION_OLDER";
  }
  id v5 = [a1 _localizationKeyForCardioFitnessLevel:a3 keyVariant:v4];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v7 = [v6 localizedStringForKey:v5 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-CardioFitness"];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  return +[HKCardioFitnessUtilities vo2MaxInteractiveChartViewControllerWithDisplayDate:a6 applicationItems:a5 restorationUserActivity:a8 trendModel:a9 factorDisplayTypes:a10 additionalChartOptions:a11];
}

+ (id)cardioFitnessLookupPropertiesForChartData:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v20;
    double v7 = 0.0;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v10 value];
        double v8 = v8 + v11;
        double v7 = v7 + (double)[v10 age];
      }
      v5 += v4;
      uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v4);
    if (v5)
    {
      double v12 = v8 / (double)v5;
      double v13 = v7 / (double)v5;
      v14 = [v3 lastObject];
      v15 = [v14 unit];
      uint64_t v16 = [v14 biologicalSex];
      uint64_t v4 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F2ACA8]);
      [(id)v4 setBiologicalSex:v16];
      [(id)v4 setAge:vcvtad_u64_f64(v13)];
      v17 = [MEMORY[0x1E4F2B370] quantityWithUnit:v15 doubleValue:v12];
      [(id)v4 setVo2MaxQuantity:v17];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }

  return (id)v4;
}

+ (id)cardioFitnessLevelDataForChartData:(id)a3
{
  uint64_t v4 = [a1 cardioFitnessLookupPropertiesForChartData:a3];
  unint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 vo2MaxQuantity];
    double v7 = [v5 vo2MaxQuantity];
    double v8 = [v7 _unit];
    [v6 doubleValueForUnit:v8];
    double v10 = v9;

    double v11 = objc_msgSend(a1, "cardioFitnessDataForVO2Max:biologicalSex:age:", objc_msgSend(v5, "biologicalSex"), objc_msgSend(v5, "age"), v10);
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

+ (id)effectiveChartPointDateWithStatisticsInterval:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_msgSend(a3, "hk_approximateDuration");
  if (v9 <= (double)(unint64_t)*MEMORY[0x1E4F296E8])
  {
    HKUIMidDate(v7, v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = v8;
  }
  double v11 = v10;

  return v11;
}

+ (id)cardioFitnessInteractiveChartViewControllerWithDisplayDate:(id)a3 applicationItems:(id)a4 preferredOverlay:(int64_t)a5 analyticsDelegate:(id)a6 restorationUserActivity:(id)a7 trendModel:(id)a8 factorDisplayTypes:(id)a9 additionalChartOptions:(unint64_t)a10
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a4;
  id v21 = a3;
  long long v22 = [[HKOverlayRoomCardioFitnessViewController alloc] initWithDisplayDate:v21 applicationItems:v20 mode:1 preferredOverlay:a5 analyticsDelegate:v19 interactiveChartOptions:0 trendModel:v17 factorDisplayTypes:v16];

  [(HKOverlayRoomViewController *)v22 setRestorationUserActivity:v18];
  [(HKOverlayRoomViewController *)v22 setAdditionalChartOptions:a10];
  return v22;
}

+ (id)vo2MaxInteractiveChartViewControllerWithDisplayDate:(id)a3 applicationItems:(id)a4 restorationUserActivity:(id)a5 trendModel:(id)a6 factorDisplayTypes:(id)a7 additionalChartOptions:(unint64_t)a8
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = [v14 displayTypeController];
  id v19 = [v18 displayTypeWithIdentifier:&unk_1F3C207A0];

  if (v16 || v17 && [v17 count])
  {
    id v20 = [[HKOverlayRoomFactorAndTrendViewController alloc] initWithBaseChartDisplayType:v19 trendModel:v16 factorDisplayTypes:v17 displayDate:v13 applicationItems:v14 mode:1 timeScopeRanges:0 initialTimeScope:8 wrappedOverlay:0 overrideFirstWeekday:-1 overrideCalendar:0 additionalChartOptions:a8];
    [(HKOverlayRoomViewController *)v20 setRestorationUserActivity:v15];
  }
  else
  {
    v29 = [HKInteractiveChartViewController alloc];
    v32[0] = v19;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    v30 = [v14 healthStore];
    id v21 = [v14 unitController];
    [v14 dateCache];
    long long v22 = v31 = v13;
    [v14 chartDataCacheController];
    v23 = id v28 = v15;
    uint64_t v24 = [v14 timeScopeController];
    v25 = [v14 sampleDateRangeController];
    id v20 = -[HKInteractiveChartViewController initWithDisplayTypes:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:](v29, "initWithDisplayTypes:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:", v27, v30, v21, v22, v23, v24, v25, v31, 0, objc_msgSend(v19, "hk_interactiveChartOptions"));

    id v15 = v28;
    id v13 = v31;
  }
  return v20;
}

+ (BOOL)cardioFitnessLevelChartShouldDisplayUpperBound:(int64_t)a3
{
  return a3 < 3;
}

+ (BOOL)cardioFitnessLevelChartShouldDisplayLowerBound:(int64_t)a3
{
  return a3 > 0;
}

@end