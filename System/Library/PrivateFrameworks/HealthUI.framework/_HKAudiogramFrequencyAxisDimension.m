@interface _HKAudiogramFrequencyAxisDimension
- (double)niceStepSizeLargerThan:(double)a3;
- (double)ticksPerStepSize:(double)a3;
- (id)endingLabelsFactorOverride;
- (id)formatterForLabelStepSize:(double)a3;
- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4;
@end

@implementation _HKAudiogramFrequencyAxisDimension

- (double)niceStepSizeLargerThan:(double)a3
{
  return 1.0;
}

- (double)ticksPerStepSize:(double)a3
{
  return 0.0;
}

- (id)formatterForLabelStepSize:(double)a3
{
  return 0;
}

- (id)endingLabelsFactorOverride
{
  return 0;
}

- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4
{
  [a3 doubleValue];
  double v5 = v4;
  if (v4 < 0.0 || v4 > 6.0)
  {
    v7 = &stru_1F3B9CF20;
    goto LABEL_13;
  }
  +[HKAudiogramChartPoint frequencyFromAxisValue:v4];
  double v9 = v8;
  v10 = HKNumberFormatterFromTemplate(1);
  if (v9 / 1000.0 >= 1.0)
  {
    v15 = [NSNumber numberWithDouble:v9 / 1000.0];
    v7 = [v10 stringFromNumber:v15];

    v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v13 = v12;
    v14 = @"KILOHERTZ_NUMBERLESS_UNIT";
    goto LABEL_11;
  }
  v11 = [NSNumber numberWithDouble:v9];
  v7 = [v10 stringFromNumber:v11];

  if (v5 == 0.0)
  {
    v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v13 = v12;
    v14 = @"HERTZ_NUMBERLESS_UNIT";
LABEL_11:
    v16 = [v12 localizedStringForKey:v14 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    uint64_t v17 = [(__CFString *)v7 stringByAppendingString:v16];

    v7 = (__CFString *)v17;
  }

LABEL_13:
  return v7;
}

@end