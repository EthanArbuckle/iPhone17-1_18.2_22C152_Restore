@interface HKOverlayRoomPillValueProviderRelativeData
- (id)_formattedValueFromChartPoints:(id)a3 displayType:(id)a4 unitPreferenceController:(id)a5;
- (id)_unitStringForValueString:(id)a3 displayType:(id)a4 unitPreferenceController:(id)a5;
- (id)valueFromChartPoints:(id)a3 unit:(id)a4 displayType:(id)a5 timeScope:(int64_t)a6 unitPreferenceController:(id)a7;
@end

@implementation HKOverlayRoomPillValueProviderRelativeData

- (id)valueFromChartPoints:(id)a3 unit:(id)a4 displayType:(id)a5 timeScope:(int64_t)a6 unitPreferenceController:(id)a7
{
  id v10 = a7;
  id v11 = a5;
  v12 = [(HKOverlayRoomPillValueProviderRelativeData *)self _formattedValueFromChartPoints:a3 displayType:v11 unitPreferenceController:v10];
  v13 = [(HKOverlayRoomPillValueProviderRelativeData *)self _unitStringForValueString:v12 displayType:v11 unitPreferenceController:v10];

  v14 = [[HKOverlayPillValue alloc] initWithValueString:v12 unitString:v13];
  return v14;
}

- (id)_formattedValueFromChartPoints:(id)a3 displayType:(id)a4 unitPreferenceController:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      v37 = v8;
      id v38 = v7;
      char v13 = 0;
      uint64_t v14 = *(void *)v40;
      double v15 = 0.0;
      double v16 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v40 != v14) {
            objc_enumerationMutation(v10);
          }
          v18 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v19 = [v18 userInfo];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v21 = [v18 userInfo];
            uint64_t v22 = [v21 relativeValueState];
            if (v22
              && (v23 = (void *)v22,
                  [v21 relativeValueState],
                  v24 = objc_claimAutoreleasedReturnValue(),
                  uint64_t v25 = [v24 integerValue],
                  v24,
                  v23,
                  v25 != 3))
            {
              v27 = [v21 relativeValueState];
              BOOL v28 = [v27 integerValue] == 2;

              v13 |= v28;
            }
            else
            {
              [v21 value];
              double v16 = v16 + v26 * (double)[v21 recordCount];
              double v15 = v15 + (double)[v21 recordCount];
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v12);

      if (v15 > 0.0)
      {
        v29 = objc_alloc_init(HKRelativeNumberFormatter);
        v30 = [NSNumber numberWithDouble:v16 / v15];
        id v8 = v37;
        v31 = HKFormattedStringFromValue(v30, v37, v9, 0, v29);

        id v7 = v38;
        goto LABEL_24;
      }
      id v8 = v37;
      id v7 = v38;
      if (v13)
      {
        v32 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v33 = v32;
        v34 = @"ESTABLISHING_BASELINE";
LABEL_22:
        v35 = @"HealthUI-Localizable-Kali";
        goto LABEL_23;
      }
    }
    else
    {
    }
    v32 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v33 = v32;
    v34 = @"NOT_ENOUGH_DATA";
    goto LABEL_22;
  }
  v32 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v33 = v32;
  v34 = @"NO_DATA";
  v35 = @"HealthUI-Localizable";
LABEL_23:
  v31 = [v32 localizedStringForKey:v34 value:&stru_1F3B9CF20 table:v35];

LABEL_24:
  return v31;
}

- (id)_unitStringForValueString:(id)a3 displayType:(id)a4 unitPreferenceController:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v11 = &stru_1F3B9CF20;
  uint64_t v12 = [v10 localizedStringForKey:@"ESTABLISHING_BASELINE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Kali"];
  if (([v7 isEqualToString:v12] & 1) == 0)
  {
    char v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v14 = [v13 localizedStringForKey:@"NOT_ENOUGH_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Kali"];
    char v15 = [v7 isEqualToString:v14];

    if (v15) {
      goto LABEL_5;
    }
    id v10 = [v9 localizedDisplayNameForDisplayType:v8];
    double v16 = NSString;
    uint64_t v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v17 = [v12 localizedStringForKey:@"%@_DEGREES_FROM_BASELINE_UNIT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Kali"];
    objc_msgSend(v16, "stringWithFormat:", v17, v10);
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_5:

  return v11;
}

@end