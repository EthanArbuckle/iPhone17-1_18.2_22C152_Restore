@interface HKHeartUtilities
+ (id)minMaxStringForHeartRates:(id)a3 displayTypeController:(id)a4 unitController:(id)a5;
@end

@implementation HKHeartUtilities

+ (id)minMaxStringForHeartRates:(id)a3 displayTypeController:(id)a4 unitController:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    v38 = v9;
    v10 = v8;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v43 count:16];
    id v37 = v7;
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v40;
      double v15 = 0.0;
      double v16 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v40 != v14) {
            objc_enumerationMutation(v11);
          }
          v18 = [*(id *)(*((void *)&v39 + 1) + 8 * i) quantity];
          v19 = [MEMORY[0x1E4F2B618] unitFromString:@"count/min"];
          [v18 doubleValueForUnit:v19];
          double v21 = v20;

          if (v16 >= v21) {
            double v16 = v21;
          }
          if (v15 < v21) {
            double v15 = v21;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v13);
    }
    else
    {
      double v15 = 0.0;
      double v16 = 1.79769313e308;
    }

    v23 = v10;
    v24 = [v10 displayTypeWithIdentifier:&unk_1F3C22360];
    v25 = [v24 presentation];
    v26 = [NSNumber numberWithDouble:v16];
    v27 = [v25 adjustedValueForDaemonValue:v26];

    v28 = [v24 presentation];
    v29 = [NSNumber numberWithDouble:v15];
    v30 = [v28 adjustedValueForDaemonValue:v29];

    id v9 = v38;
    v31 = HKFormattedStringFromValueForContext(v27, v24, v38, 0, 0, 1);
    v32 = HKFormattedStringFromValueForContext(v30, v24, v38, 0, 0, 1);
    v33 = NSString;
    v34 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v35 = [v34 localizedStringForKey:@"SHOW_ALL_DATA_MIN_MAX" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v22 = objc_msgSend(v33, "stringWithFormat:", v35, v31, v32);

    id v8 = v23;
    id v7 = v37;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end