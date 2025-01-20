@interface HKAudioExposureUtilities
+ (double)_rounded:(double)a3;
+ (double)maximumDurationInSecondsForLEQ:(double)a3 days:(int64_t)a4;
+ (id)_classificationValueWithLEQ:(double)a3 duration:(double)a4 days:(int64_t)a5;
+ (id)computeLEQFromAudioExposureValues:(id)a3;
+ (id)localizedDisplayNameForClassification:(unint64_t)a3;
+ (id)localizedDisplayNameForClassification:(unint64_t)a3 isEmbedded:(BOOL)a4;
+ (unint64_t)classifyLEQ:(id)a3 forDuration:(double)a4 overDays:(int64_t)a5;
@end

@implementation HKAudioExposureUtilities

+ (id)localizedDisplayNameForClassification:(unint64_t)a3
{
  return (id)[a1 localizedDisplayNameForClassification:a3 isEmbedded:0];
}

+ (id)localizedDisplayNameForClassification:(unint64_t)a3 isEmbedded:(BOOL)a4
{
  v4 = @"AUDIO_EXPOSURE_CLASSIFICATION_UNAVAILABLE";
  if (a3 == 1) {
    v4 = @"AUDIO_EXPOSURE_CLASSIFICATION_OK";
  }
  if (a3 == 2) {
    v5 = @"AUDIO_EXPOSURE_CLASSIFICATION_LOUD";
  }
  else {
    v5 = v4;
  }
  if (a4)
  {
    v5 = [(__CFString *)v5 stringByAppendingString:@"_EMBEDDED"];
  }
  v6 = HKHealthKitFrameworkBundle();
  v7 = [v6 localizedStringForKey:v5 value:&stru_1EEC60288 table:@"Localizable-DataTypes"];

  return v7;
}

+ (unint64_t)classifyLEQ:(id)a3 forDuration:(double)a4 overDays:(int64_t)a5
{
  if (!a3) {
    return 0;
  }
  id v8 = a3;
  v9 = +[HKUnit decibelAWeightedSoundPressureLevelUnit];
  [v8 doubleValueForUnit:v9];
  double v11 = v10;

  v12 = [a1 _classificationValueWithLEQ:a5 duration:v11 days:a4];
  v13 = v12;
  if (v12)
  {
    if ([v12 integerValue] < 80) {
      unint64_t v14 = 1;
    }
    else {
      unint64_t v14 = 2;
    }
  }
  else
  {
    unint64_t v14 = 0;
  }

  return v14;
}

+ (id)computeLEQFromAudioExposureValues:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = (void *)[v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v20;
    double v7 = 0.0;
    double v8 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v4);
        }
        double v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v10 duration];
        double v12 = v11;
        [v10 value];
        double v8 = v8 + v12 * __exp10(v13 / 10.0);
        [v10 duration];
        double v7 = v7 + v14;
      }
      v5 = (void *)[v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
    if (v7 > 0.0 && v8 > 0.0)
    {
      [a1 _rounded:(double)(log10(v8 / v7) * 10.0)];
      double v16 = v15;
      v17 = +[HKUnit decibelAWeightedSoundPressureLevelUnit];
      v5 = +[HKQuantity quantityWithUnit:v17 doubleValue:v16];
    }
  }

  return v5;
}

+ (double)maximumDurationInSecondsForLEQ:(double)a3 days:(int64_t)a4
{
  if (a4 < 1) {
    return 0.0;
  }
  double v4 = (80.0 - a3) * 2.30258509 / 10.0;
  long double v5 = log(40.0 / (double)7uLL * (double)a4);
  return exp(v4 + v5) * (double)0xE10uLL;
}

+ (id)_classificationValueWithLEQ:(double)a3 duration:(double)a4 days:(int64_t)a5
{
  if (a4 < 2.22507386e-308 || a5 < 1)
  {
    uint64_t v6 = 0;
  }
  else
  {
    [a1 _rounded:(double)(a3 + log10(a4 / (double)0xE10uLL / (40.0 / (double)7uLL * (double)a5)) * 10.0)];
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithDouble:");
  }

  return v6;
}

+ (double)_rounded:(double)a3
{
  return round(a3 * 100.0) / 100.0;
}

@end