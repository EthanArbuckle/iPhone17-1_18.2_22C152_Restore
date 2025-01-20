@interface HKNaturalScaleDistanceMeasurementFormatter
- (BOOL)returnsUnitWithValueForDisplay;
- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5;
- (int64_t)_precisionWithDisplayType:(id)a3 unit:(id)a4 andNumber:(double)a5;
- (void)adjustedFormatInformationForUnit:(id)a3 number:(id)a4 displayType:(id)a5 handler:(id)a6;
@end

@implementation HKNaturalScaleDistanceMeasurementFormatter

- (BOOL)returnsUnitWithValueForDisplay
{
  return 1;
}

- (void)adjustedFormatInformationForUnit:(id)a3 number:(id)a4 displayType:(id)a5 handler:(id)a6
{
  v46[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v12 = (void (**)(id, id, double))a6;
  id v13 = v10;
  [a4 doubleValue];
  double v15 = v14;
  double v16 = (float)(1.0
              / __exp10f((float)-[HKNaturalScaleDistanceMeasurementFormatter _precisionWithDisplayType:unit:andNumber:](self, "_precisionWithDisplayType:unit:andNumber:", v11, v13)));
  if (v15 <= 100.0 && v15 >= v16)
  {
    id v17 = v13;
    goto LABEL_33;
  }
  v18 = [MEMORY[0x1E4F1CA48] array];
  if ([v13 _isMetricDistance])
  {
    v19 = [MEMORY[0x1E4F2B618] meterUnitWithMetricPrefix:9];
    v46[0] = v19;
    v20 = [MEMORY[0x1E4F2B618] meterUnit];
    v46[1] = v20;
    v21 = [MEMORY[0x1E4F2B618] meterUnitWithMetricPrefix:5];
    v46[2] = v21;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
  }
  else
  {
    v19 = [MEMORY[0x1E4F2B618] mileUnit];
    v45[0] = v19;
    v20 = [MEMORY[0x1E4F2B618] yardUnit];
    v45[1] = v20;
    v21 = [MEMORY[0x1E4F2B618] footUnit];
    v45[2] = v21;
    v22 = [MEMORY[0x1E4F2B618] inchUnit];
    v45[3] = v22;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];
  }
  v37 = self;
  v38 = v12;
  if (v15 >= v16) {
    [v39 objectEnumerator];
  }
  else {
    [v39 reverseObjectEnumerator];
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v41;
LABEL_12:
    uint64_t v27 = 0;
    while (1)
    {
      if (*(void *)v41 != v26) {
        objc_enumerationMutation(v23);
      }
      v28 = *(void **)(*((void *)&v40 + 1) + 8 * v27);
      if ([v28 isEqual:v13]) {
        break;
      }
      if ([v11 displayTypeIdentifier] == 110
        || [v11 displayTypeIdentifier] != 110
        && ([MEMORY[0x1E4F2B618] yardUnit],
            v29 = objc_claimAutoreleasedReturnValue(),
            char v30 = [v28 isEqual:v29],
            v29,
            (v30 & 1) == 0))
      {
        [v18 addObject:v28];
      }
      if (v25 == ++v27)
      {
        uint64_t v25 = [v23 countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v25) {
          goto LABEL_12;
        }
        break;
      }
    }
  }

  if (![v18 count])
  {
    double v31 = v15;
    id v17 = v13;
    goto LABEL_32;
  }
  id v17 = v13;
  double v31 = v15;
  while (1)
  {
    v32 = v17;
    v33 = [v18 lastObject];
    [v32 _valueByConvertingValue:v33 toUnit:v31];
    double v31 = v34;
    id v17 = v33;

    [v18 removeLastObject];
    float v35 = __exp10f((float)[(HKNaturalScaleDistanceMeasurementFormatter *)v37 _precisionWithDisplayType:v11 unit:v17 andNumber:v31]);
    if (v15 >= v16) {
      break;
    }
    if (v31 >= (float)(1.0 / v35)) {
      goto LABEL_31;
    }
LABEL_28:
    uint64_t v36 = [v18 count];

    if (!v36) {
      goto LABEL_32;
    }
  }
  if (v31 > 100.0) {
    goto LABEL_28;
  }
LABEL_31:

LABEL_32:
  double v15 = v31;
  v12 = v38;
LABEL_33:
  v12[2](v12, v17, v15);
}

- (int64_t)_precisionWithDisplayType:(id)a3 unit:(id)a4 andNumber:(double)a5
{
  id v7 = a4;
  v8 = [a3 chartingRules];
  v9 = [v8 allowedDecimalPrecisionRuleForUnit:v7];

  int64_t v10 = [v9 decimalPrecisionForValue:a5];
  return v10;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__11;
  uint64_t v24 = __Block_byref_object_dispose__11;
  id v25 = 0;
  id v11 = [v10 unitForDisplayType:v9];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__HKNaturalScaleDistanceMeasurementFormatter_stringFromNumber_displayType_unitController___block_invoke;
  v16[3] = &unk_1E6D53E20;
  id v12 = v9;
  id v17 = v12;
  id v13 = v10;
  id v18 = v13;
  v19 = &v20;
  [(HKNaturalScaleDistanceMeasurementFormatter *)self adjustedFormatInformationForUnit:v11 number:v8 displayType:v12 handler:v16];
  id v14 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v14;
}

void __90__HKNaturalScaleDistanceMeasurementFormatter_stringFromNumber_displayType_unitController___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v20 = a2;
  v5 = [v20 _foundationUnit];
  if (v5)
  {
    v6 = [*(id *)(a1 + 32) chartingRules];
    id v7 = [v6 allowedDecimalPrecisionRuleForUnit:v20];

    id v8 = [v7 numberFormatter];
    id v9 = [NSNumber numberWithDouble:a3];
    id v10 = [v8 stringFromNumber:v9 displayType:*(void *)(a1 + 32) unitController:*(void *)(a1 + 40)];

    id v11 = *(void **)(a1 + 40);
    id v12 = [NSNumber numberWithDouble:a3];
    id v13 = [v11 localizedDisplayNameForUnit:v20 value:v12];

    id v14 = NSString;
    double v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    double v16 = [v15 localizedStringForKey:@"VALUE_UNIT_FORMAT %@ %@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    uint64_t v17 = objc_msgSend(v14, "stringWithFormat:", v16, v10, v13);
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
  }
}

@end