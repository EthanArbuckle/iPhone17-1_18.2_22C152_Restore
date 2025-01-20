@interface NSDateComponentsFormatter(MKRelativeFormatting)
+ (id)_mapkit_descriptionForTimeSinceDate:()MKRelativeFormatting;
+ (id)_mapkit_descriptionForTimeSinceDate:()MKRelativeFormatting referenceDate:smallestUnit:timeUntilNextUpdate:;
+ (uint64_t)_mapkit_descriptionForTimeSinceDate:()MKRelativeFormatting referenceDate:;
+ (uint64_t)_mapkit_descriptionForTimeSinceDate:()MKRelativeFormatting referenceDate:smallestUnit:;
@end

@implementation NSDateComponentsFormatter(MKRelativeFormatting)

+ (id)_mapkit_descriptionForTimeSinceDate:()MKRelativeFormatting referenceDate:smallestUnit:timeUntilNextUpdate:
{
  [a3 timeIntervalSinceDate:a4];
  if (v8 < 0.0) {
    double v9 = -v8;
  }
  else {
    double v9 = v8;
  }
  *((void *)&v11 + 1) = a5;
  *(void *)&long long v11 = a5 - 16;
  uint64_t v10 = v11 >> 4;
  if (v10)
  {
    if (v10 == 1)
    {
      double v12 = 3600.0;
    }
    else
    {
      double v12 = 60.0;
      if (v10 == 7) {
        double v12 = 10.0;
      }
    }
  }
  else
  {
    double v12 = 86400.0;
  }
  BOOL v13 = v8 >= 0.0 || v9 < v12;
  if (v13)
  {
    if (a6)
    {
      double v14 = v8 + v12;
      BOOL v13 = v8 < 0.0;
      double v15 = 0.0;
      if (v13) {
        double v15 = v14;
      }
      *a6 = v15;
    }
    v16 = _MKLocalizedStringFromThisBundle(@"Just now");
  }
  else
  {
    if (v9 < 60.0 && v12 < 60.0)
    {
      unint64_t v21 = vcvtmd_u64_f64(v9);
      v19 = _MKLocalizedStringFromThisBundle(@"Date_relative_time_seconds_ago");
      if (a6) {
        *a6 = 1.0;
      }
      v29 = 0;
      v16 = objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v19, @"%d", &v29, v21);
      v20 = v29;
    }
    else if (v9 >= 3600.0 || v12 >= 3600.0)
    {
      if (v9 >= 86400.0 || v12 >= 86400.0)
      {
        unint64_t v25 = vcvtmd_u64_f64(v9 / 86400.0);
        v19 = _MKLocalizedStringFromThisBundle(@"Date_relative_time_days_ago");
        if (a6) {
          *a6 = -(v9 - (double)(v25 + 1) * 86400.0);
        }
        v26 = 0;
        v16 = objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v19, @"%d", &v26, v25);
        v20 = v26;
      }
      else
      {
        unint64_t v24 = vcvtmd_u64_f64(v9 / 3600.0);
        v19 = _MKLocalizedStringFromThisBundle(@"Date_relative_time_hours_ago");
        if (a6) {
          *a6 = -(v9 - (double)(v24 + 1) * 3600.0);
        }
        v27 = 0;
        v16 = objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v19, @"%d", &v27, v24);
        v20 = v27;
      }
    }
    else
    {
      unint64_t v18 = vcvtmd_u64_f64(v9 / 60.0);
      v19 = _MKLocalizedStringFromThisBundle(@"Date_relative_time_minutes_ago");
      if (a6) {
        *a6 = -(v9 - (double)(v18 + 1) * 60.0);
      }
      v28 = 0;
      v16 = objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v19, @"%d", &v28, v18);
      v20 = v28;
    }
    id v22 = v20;
  }

  return v16;
}

+ (uint64_t)_mapkit_descriptionForTimeSinceDate:()MKRelativeFormatting referenceDate:smallestUnit:
{
  return objc_msgSend(a1, "_mapkit_descriptionForTimeSinceDate:referenceDate:smallestUnit:timeUntilNextUpdate:", a3, a4, a5, 0);
}

+ (uint64_t)_mapkit_descriptionForTimeSinceDate:()MKRelativeFormatting referenceDate:
{
  return objc_msgSend(a1, "_mapkit_descriptionForTimeSinceDate:referenceDate:smallestUnit:", a3, a4, 64);
}

+ (id)_mapkit_descriptionForTimeSinceDate:()MKRelativeFormatting
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  v6 = [v4 date];
  v7 = objc_msgSend(a1, "_mapkit_descriptionForTimeSinceDate:referenceDate:", v5, v6);

  return v7;
}

@end