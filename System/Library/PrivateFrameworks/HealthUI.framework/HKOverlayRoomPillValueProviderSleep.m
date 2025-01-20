@interface HKOverlayRoomPillValueProviderSleep
- (id)_minMaxValueFromChartPoints:(id)a3 displayType:(id)a4 unitPreferenceController:(id)a5;
- (id)valueFromChartPoints:(id)a3 unit:(id)a4 displayType:(id)a5 timeScope:(int64_t)a6 unitPreferenceController:(id)a7;
@end

@implementation HKOverlayRoomPillValueProviderSleep

- (id)valueFromChartPoints:(id)a3 unit:(id)a4 displayType:(id)a5 timeScope:(int64_t)a6 unitPreferenceController:(id)a7
{
  v7 = -[HKOverlayRoomPillValueProviderSleep _minMaxValueFromChartPoints:displayType:unitPreferenceController:](self, "_minMaxValueFromChartPoints:displayType:unitPreferenceController:", a3, a5, a7, a6);
  v8 = [[HKOverlayPillValue alloc] initWithValueString:v7 unitString:&stru_1F3B9CF20];

  return v8;
}

- (id)_minMaxValueFromChartPoints:(id)a3 displayType:(id)a4 unitPreferenceController:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7 || ![v7 count]) {
    goto LABEL_35;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    double v13 = 1.79769313e308;
    double v14 = -1.79769313e308;
    uint64_t v15 = *(void *)v43;
    double v16 = -1.79769313e308;
    double v17 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v43 != v15) {
          objc_enumerationMutation(v10);
        }
        v19 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v20 = v19;
          [v20 asleepValue];
          double v22 = v21;
          [v20 inBedValue];
          double v24 = v23;

          if (v22 >= v16) {
            double v25 = v22;
          }
          else {
            double v25 = v16;
          }
          if (v22 > 2.22044605e-16) {
            double v16 = v25;
          }
          if (v22 < v17 && v22 > 2.22044605e-16) {
            double v17 = v22;
          }
          if (v24 >= v14) {
            double v27 = v24;
          }
          else {
            double v27 = v14;
          }
          if (v24 > 2.22044605e-16) {
            double v14 = v27;
          }
          if (v24 < v13 && v24 > 2.22044605e-16) {
            double v13 = v24;
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v12);
  }
  else
  {
    double v13 = 1.79769313e308;
    double v14 = -1.79769313e308;
    double v16 = -1.79769313e308;
    double v17 = 1.79769313e308;
  }

  if (v17 != 1.79769313e308 || v13 != 1.79769313e308)
  {
    if (v17 >= 1.79769313e308) {
      double v32 = v13;
    }
    else {
      double v32 = v17;
    }
    if (v17 >= 1.79769313e308) {
      double v33 = v14;
    }
    else {
      double v33 = v16;
    }
    double v34 = vabdd_f64(v32, v33);
    v35 = objc_msgSend(NSNumber, "numberWithDouble:");
    v30 = HKTimePeriodString(v35, 56);

    if (v34 >= 2.22044605e-16)
    {
      v36 = [NSNumber numberWithDouble:v33];
      v37 = HKTimePeriodString(v36, 56);

      v38 = NSString;
      v39 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v40 = [v39 localizedStringForKey:@"OVERLAY_RANGE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      uint64_t v41 = objc_msgSend(v38, "stringWithFormat:", v40, v30, v37, (void)v42);

      v30 = (void *)v41;
    }
  }
  else
  {
LABEL_35:
    v29 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v30 = [v29 localizedStringForKey:@"NO_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  }
  return v30;
}

@end