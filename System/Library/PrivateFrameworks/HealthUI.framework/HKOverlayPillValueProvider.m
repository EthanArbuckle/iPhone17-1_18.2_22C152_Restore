@interface HKOverlayPillValueProvider
- (id)_formattedQuantity:(id)a3 displayType:(id)a4;
- (id)_formattedQuantityRange:(id)a3 displayType:(id)a4;
- (id)_quantityRangeFromChartPoints:(id)a3 unit:(id)a4 displayType:(id)a5 unitPreferenceController:(id)a6;
- (id)_unitFromQuantityRange:(id)a3 displayType:(id)a4;
- (id)_valueFromQuantityRange:(id)a3 displayType:(id)a4;
- (id)valueFromChartPoints:(id)a3 unit:(id)a4 displayType:(id)a5 timeScope:(int64_t)a6 unitPreferenceController:(id)a7;
@end

@implementation HKOverlayPillValueProvider

- (id)valueFromChartPoints:(id)a3 unit:(id)a4 displayType:(id)a5 timeScope:(int64_t)a6 unitPreferenceController:(id)a7
{
  id v11 = a5;
  v12 = [(HKOverlayPillValueProvider *)self _quantityRangeFromChartPoints:a3 unit:a4 displayType:v11 unitPreferenceController:a7];
  v13 = [(HKOverlayPillValueProvider *)self _valueFromQuantityRange:v12 displayType:v11];
  v14 = [(HKOverlayPillValueProvider *)self _unitFromQuantityRange:v12 displayType:v11];

  v15 = [[HKOverlayPillValue alloc] initWithValueString:v13 unitString:v14];
  return v15;
}

- (id)_valueFromQuantityRange:(id)a3 displayType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v12 = [v11 localizedStringForKey:@"NO_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    goto LABEL_5;
  }
  v8 = [v6 minimum];
  v9 = [v6 maximum];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = [v6 maximum];
    uint64_t v12 = [(HKOverlayPillValueProvider *)self _formattedQuantity:v11 displayType:v7];
LABEL_5:
    v13 = (void *)v12;

    goto LABEL_7;
  }
  v13 = [(HKOverlayPillValueProvider *)self _formattedQuantityRange:v6 displayType:v7];
LABEL_7:

  return v13;
}

- (id)_unitFromQuantityRange:(id)a3 displayType:(id)a4
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [a4 objectType];
    id v7 = [v5 unitStringForType:v6];
  }
  else
  {
    id v7 = &stru_1F3B9CF20;
  }
  return v7;
}

- (id)_quantityRangeFromChartPoints:(id)a3 unit:(id)a4 displayType:(id)a5 unitPreferenceController:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v9 && [v9 count])
  {
    id v33 = v12;
    id v34 = v11;
    id v35 = v10;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (!v14)
    {
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      goto LABEL_20;
    }
    uint64_t v15 = v14;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v37;
    while (1)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(v13);
        }
        v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (!v17
          || ([*(id *)(*((void *)&v36 + 1) + 8 * i) minYValue],
              v21 = objc_claimAutoreleasedReturnValue(),
              uint64_t v22 = [v21 compare:v17],
              v21,
              v22 == -1))
        {
          uint64_t v23 = [v20 minYValue];

          uint64_t v17 = v23;
          if (v16)
          {
LABEL_13:
            v24 = [v20 maxYValue];
            uint64_t v25 = [v24 compare:v16];

            if (v25 != 1) {
              continue;
            }
          }
        }
        else if (v16)
        {
          goto LABEL_13;
        }
        uint64_t v26 = [v20 maxYValue];

        uint64_t v16 = v26;
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (!v15)
      {
LABEL_20:

        if (v17 | v16)
        {
          v28 = (void *)MEMORY[0x1E4F2B370];
          [(id)v17 doubleValue];
          v29 = objc_msgSend(v28, "quantityWithUnit:doubleValue:", v35);
          v30 = (void *)MEMORY[0x1E4F2B370];
          id v10 = v35;
          [(id)v16 doubleValue];
          v31 = objc_msgSend(v30, "quantityWithUnit:doubleValue:", v35);
          v27 = (void *)[objc_alloc(MEMORY[0x1E4F2B380]) initWithMinimum:v29 maximum:v31 isMinimumInclusive:1 isMaximumInclusive:1];
        }
        else
        {
          v27 = 0;
          id v10 = v35;
        }
        id v12 = v33;

        id v11 = v34;
        goto LABEL_24;
      }
    }
  }
  v27 = 0;
LABEL_24:

  return v27;
}

- (id)_formattedQuantity:(id)a3 displayType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(HKQuantityFormattingParameters);
  [(HKQuantityFormattingParameters *)v7 setOmitUnit:1];
  v8 = [v5 objectType];

  id v9 = [v6 localizedStringForType:v8 parameters:v7];

  return v9;
}

- (id)_formattedQuantityRange:(id)a3 displayType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(HKQuantityFormattingParameters);
  [(HKQuantityFormattingParameters *)v7 setOmitUnit:1];
  v8 = [v5 objectType];

  id v9 = [v6 localizedStringForType:v8 parameters:v7];

  return v9;
}

@end