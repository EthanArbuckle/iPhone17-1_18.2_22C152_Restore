@interface HKMobilityUtilities
+ (BOOL)_valueRangeMin:(double *)a3 max:(double *)a4 forChartData:(id)a5;
+ (BOOL)chartDataSpansMultipleClassifications:(id)a3;
+ (id)_localizedStringForClassification:(int64_t)a3 narrow:(BOOL)a4;
+ (id)generateAppleWalkingSteadinessDataSourceForTimeScope:(int64_t)a3 displayType:(id)a4 healthStore:(id)a5 quantityType:(id)a6 unitController:(id)a7;
+ (id)generateAppleWalkingSteadinessSeriesForTimeScope:(int64_t)a3 displayType:(id)a4 color:(id)a5;
+ (id)localizedAxisLabelStringForClassification:(int64_t)a3;
+ (id)localizedDescriptionForClassification:(int64_t)a3;
+ (id)localizedTitleForClassification:(int64_t)a3;
+ (id)localizedTitleForWalkingSteadinessEventCategoryValue:(int64_t)a3;
+ (int64_t)classificationForAppleWalkingSteadinessQuantity:(id)a3;
+ (int64_t)classificationForAppleWalkingSteadinessValue:(double)a3;
@end

@implementation HKMobilityUtilities

+ (int64_t)classificationForAppleWalkingSteadinessValue:(double)a3
{
  v5 = (void *)MEMORY[0x1E4F2B370];
  v6 = [MEMORY[0x1E4F2B618] percentUnit];
  v7 = [v5 quantityWithUnit:v6 doubleValue:a3];

  int64_t v8 = [a1 classificationForAppleWalkingSteadinessQuantity:v7];
  return v8;
}

+ (int64_t)classificationForAppleWalkingSteadinessQuantity:(id)a3
{
  v5 = (HKQuantity *)a3;
  v13 = 0;
  HKAppleWalkingSteadinessClassification classificationOut = 0;
  BOOL v6 = HKAppleWalkingSteadinessClassificationForQuantity(v5, &classificationOut, &v13);
  v7 = v13;
  if (!v6)
  {
    _HKInitializeLogging();
    int64_t v8 = (void *)*MEMORY[0x1E4F29F78];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F78], OS_LOG_TYPE_FAULT)) {
      +[HKMobilityUtilities classificationForAppleWalkingSteadinessQuantity:v7];
    }
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"HKMobilityUtilities.m" lineNumber:46 description:@"Unable to classify provided quantity or value"];
  }
  HKAppleWalkingSteadinessClassification v10 = classificationOut;
  if (!classificationOut)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:a1 file:@"HKMobilityUtilities.m" lineNumber:47 description:@"Invalid walking steadiness classification value"];

    HKAppleWalkingSteadinessClassification v10 = classificationOut;
  }

  return v10;
}

+ (id)localizedTitleForClassification:(int64_t)a3
{
  return (id)[a1 _localizedStringForClassification:a3 narrow:0];
}

+ (id)localizedDescriptionForClassification:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v4 = v3;
      v5 = @"APPLE_WALKING_STEADINESS_CLASSIFICATION_DESCRIPTION_VERY_LOW";
      goto LABEL_7;
    case 2:
      v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v4 = v3;
      v5 = @"APPLE_WALKING_STEADINESS_CLASSIFICATION_DESCRIPTION_LOW";
      goto LABEL_7;
    case 1:
      v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v4 = v3;
      v5 = @"APPLE_WALKING_STEADINESS_CLASSIFICATION_DESCRIPTION_OK";
LABEL_7:
      BOOL v6 = [v3 localizedStringForKey:v5 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-WalkingSteadiness"];

      goto LABEL_9;
  }
  BOOL v6 = 0;
LABEL_9:
  return v6;
}

+ (id)localizedAxisLabelStringForClassification:(int64_t)a3
{
  return (id)[a1 _localizedStringForClassification:a3 narrow:1];
}

+ (id)_localizedStringForClassification:(int64_t)a3 narrow:(BOOL)a4
{
  BOOL v4 = a4;
  switch(a3)
  {
    case 3:
      v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      BOOL v6 = v5;
      v7 = @"APPLE_WALKING_STEADINESS_CLASSIFICATION_VERY_LOW";
      int64_t v8 = @"APPLE_WALKING_STEADINESS_CLASSIFICATION_NARROW_VERY_LOW";
      goto LABEL_7;
    case 2:
      v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      BOOL v6 = v5;
      v7 = @"APPLE_WALKING_STEADINESS_CLASSIFICATION_LOW";
      int64_t v8 = @"APPLE_WALKING_STEADINESS_CLASSIFICATION_NARROW_LOW";
      goto LABEL_7;
    case 1:
      v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      BOOL v6 = v5;
      v7 = @"APPLE_WALKING_STEADINESS_CLASSIFICATION_OK";
      int64_t v8 = @"APPLE_WALKING_STEADINESS_CLASSIFICATION_NARROW_OK";
LABEL_7:
      if (v4) {
        v9 = v8;
      }
      else {
        v9 = v7;
      }
      HKAppleWalkingSteadinessClassification v10 = [v5 localizedStringForKey:v9 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-WalkingSteadiness"];

      goto LABEL_12;
  }
  HKAppleWalkingSteadinessClassification v10 = 0;
LABEL_12:
  return v10;
}

+ (id)localizedTitleForWalkingSteadinessEventCategoryValue:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      BOOL v4 = v3;
      v5 = @"WALKING_STEADINESS_EVENT_VALUE_INITIAL_LOW";
      goto LABEL_9;
    case 2:
      v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      BOOL v4 = v3;
      v5 = @"WALKING_STEADINESS_EVENT_VALUE_INITIAL_VERY_LOW";
      goto LABEL_9;
    case 3:
      v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      BOOL v4 = v3;
      v5 = @"WALKING_STEADINESS_EVENT_VALUE_REPEAT_LOW";
      goto LABEL_9;
    case 4:
      v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      BOOL v4 = v3;
      v5 = @"WALKING_STEADINESS_EVENT_VALUE_REPEAT_VERY_LOW";
LABEL_9:
      int64_t v8 = [v3 localizedStringForKey:v5 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-WalkingSteadiness"];

      break;
    default:
      _HKInitializeLogging();
      v7 = *MEMORY[0x1E4F29F78];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F78], OS_LOG_TYPE_FAULT)) {
        +[HKMobilityUtilities localizedTitleForWalkingSteadinessEventCategoryValue:](a3, v7);
      }
      int64_t v8 = &stru_1F3B9CF20;
      break;
  }
  return v8;
}

+ (id)generateAppleWalkingSteadinessSeriesForTimeScope:(int64_t)a3 displayType:(id)a4 color:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = +[HKAppleWalkingSteadinessAxis standardAxisWithDisplayType:v7];
  if (a3 == 3)
  {
    HKAppleWalkingSteadinessClassification v10 = [v7 generateScatterPlotSeriesWithColor:v8];
  }
  else
  {
    if (a3 <= 2)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F28EE0], "hk_wholeNumberFormatter");
      v12 = [v7 generateDistributionSeriesWithColor:v8 numberFormatter:v11 lineWidth:0 hasMinMaxOverlay:10.0];

      [v12 setHollowLineRatio:0.6];
      goto LABEL_7;
    }
    HKAppleWalkingSteadinessClassification v10 = [[HKJulianIndexedSevenDayQuantitySeries alloc] initWithColor:v8 lineWidth:8.0 hollowLineRatio:0.5];
  }
  v12 = v10;
LABEL_7:
  [v12 setYAxis:v9];

  return v12;
}

+ (id)generateAppleWalkingSteadinessDataSourceForTimeScope:(int64_t)a3 displayType:(id)a4 healthStore:(id)a5 quantityType:(id)a6 unitController:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = [v14 unitForDisplayType:v11];
  v16 = v15;
  if (a3 == 3)
  {
    v17 = [[HKQuantityTypeDataSource alloc] initWithUnitController:v14 options:2 displayType:v11 healthStore:v12];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __128__HKMobilityUtilities_generateAppleWalkingSteadinessDataSourceForTimeScope_displayType_healthStore_quantityType_unitController___block_invoke;
    v23[3] = &unk_1E6D545F8;
    id v24 = v16;
    [(HKQuantityTypeDataSource *)v17 setUserInfoCreationBlock:v23];
    v18 = v24;
  }
  else
  {
    if (a3 <= 2)
    {
      v17 = [[HKQuantityDistributionDataSource alloc] initWithQuantityType:v13 unitController:v14 healthStore:v12 contextStyle:0 predicate:0 options:1 baseDisplayType:v11 specificStartDate:0 specificEndDate:0 userInfoCreationBlock:&__block_literal_global_56];
      goto LABEL_7;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __128__HKMobilityUtilities_generateAppleWalkingSteadinessDataSourceForTimeScope_displayType_healthStore_quantityType_unitController___block_invoke_3;
    aBlock[3] = &unk_1E6D54640;
    id v22 = v15;
    v19 = _Block_copy(aBlock);
    v17 = [[HKJulianIndexedSevenDayQuantityDataSource alloc] initWithDisplayType:v11 healthStore:v12 quantityType:v13 unitController:v14 intervalUserInfoCreationBlock:v19];

    v18 = v22;
  }

LABEL_7:
  return v17;
}

HKInteractiveChartAppleWalkingSteadinessData *__128__HKMobilityUtilities_generateAppleWalkingSteadinessDataSourceForTimeScope_displayType_healthStore_quantityType_unitController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = objc_alloc_init(HKInteractiveChartAppleWalkingSteadinessData);
  v5 = [v3 averageQuantity];
  [v5 doubleValueForUnit:*(void *)(a1 + 32)];
  -[HKInteractiveChartSinglePointData setValue:](v4, "setValue:");

  uint64_t v6 = [v3 recordCount];
  [(HKInteractiveChartSinglePointData *)v4 setRecordCount:v6];
  return v4;
}

HKInteractiveChartAppleWalkingSteadinessData *__128__HKMobilityUtilities_generateAppleWalkingSteadinessDataSourceForTimeScope_displayType_healthStore_quantityType_unitController___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = objc_alloc_init(HKInteractiveChartAppleWalkingSteadinessData);
  id v7 = [v5 averageValue];
  [v7 doubleValueForUnit:v4];
  -[HKInteractiveChartSinglePointData setValue:](v6, "setValue:");

  id v8 = [v5 minimumValue];
  [v8 doubleValueForUnit:v4];
  -[HKInteractiveChartSinglePointData setMinValue:](v6, "setMinValue:");

  v9 = [v5 maximumValue];

  [v9 doubleValueForUnit:v4];
  -[HKInteractiveChartSinglePointData setMaxValue:](v6, "setMaxValue:");

  [(HKInteractiveChartSinglePointData *)v6 setUnit:v4];
  [(HKInteractiveChartSinglePointData *)v6 setRepresentsRange:1];
  [(HKInteractiveChartSinglePointData *)v6 setRecordCount:1];
  return v6;
}

HKInteractiveChartAppleWalkingSteadinessData *__128__HKMobilityUtilities_generateAppleWalkingSteadinessDataSourceForTimeScope_displayType_healthStore_quantityType_unitController___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(HKInteractiveChartAppleWalkingSteadinessData);
  [v3 doubleValueForUnit:*(void *)(a1 + 32)];
  double v6 = v5;

  [(HKInteractiveChartSinglePointData *)v4 setValue:v6];
  [(HKInteractiveChartSinglePointData *)v4 setRecordCount:1];
  return v4;
}

+ (BOOL)chartDataSpansMultipleClassifications:(id)a3
{
  double v7 = 0.0;
  double v8 = 0.0;
  int v4 = [a1 _valueRangeMin:&v8 max:&v7 forChartData:a3];
  if (v4)
  {
    uint64_t v5 = [a1 classificationForAppleWalkingSteadinessValue:v8];
    LOBYTE(v4) = v5 != [a1 classificationForAppleWalkingSteadinessValue:v7];
  }
  return v4;
}

+ (BOOL)_valueRangeMin:(double *)a3 max:(double *)a4 forChartData:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v8 = [v7 count];
  if (v8)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      double v13 = -1.79769313e308;
      double v14 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v16, "representsRange", (void)v21)) {
            [v16 minValue];
          }
          else {
            [v16 value];
          }
          double v18 = v17;
          if ([v16 representsRange]) {
            [v16 maxValue];
          }
          else {
            [v16 value];
          }
          if (v14 > v18) {
            double v14 = v18;
          }
          if (v13 < v19) {
            double v13 = v19;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }
    else
    {
      double v13 = -1.79769313e308;
      double v14 = 1.79769313e308;
    }

    if (a3) {
      *a3 = v14;
    }
    if (a4) {
      *a4 = v13;
    }
  }

  return v8 != 0;
}

+ (void)classificationForAppleWalkingSteadinessQuantity:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1;
  double v6 = [a2 debugDescription];
  id v7 = [a3 localizedDescription];
  int v8 = 138740227;
  id v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_fault_impl(&dword_1E0B26000, v5, OS_LOG_TYPE_FAULT, "Unable to classify provided quantity or value: (%{sensitive}@) %@", (uint8_t *)&v8, 0x16u);
}

+ (void)localizedTitleForWalkingSteadinessEventCategoryValue:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_FAULT, "Unable to localize walking steadiness event category value: %llu", (uint8_t *)&v2, 0xCu);
}

@end