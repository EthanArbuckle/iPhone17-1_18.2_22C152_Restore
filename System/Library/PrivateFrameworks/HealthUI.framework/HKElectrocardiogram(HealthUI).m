@interface HKElectrocardiogram(HealthUI)
+ (id)hk_abnormalTimeStampCompositingFilter;
+ (id)hk_defaultTimeStampCompositingFilter;
+ (id)hk_localizedAverageBPM:()HealthUI;
+ (id)hk_positiveNumSymptomsTextColor;
+ (uint64_t)hk_abnormalBPMTextColor;
+ (uint64_t)hk_abnormalCardHeaderColor;
+ (uint64_t)hk_abnormalClassificationTextColor;
+ (uint64_t)hk_abnormalTimeStampTextColor;
+ (uint64_t)hk_defaultBPMTextColor;
+ (uint64_t)hk_defaultCardBackgroundColor;
+ (uint64_t)hk_defaultCardHeaderColor;
+ (uint64_t)hk_defaultClassificationTextColor;
+ (uint64_t)hk_defaultNumSymptomsTextColor;
+ (uint64_t)hk_defaultTimeStampTextColor;
+ (uint64_t)hk_onboardingCardBackgroundColor;
+ (uint64_t)hk_onboardingCardHeaderColor;
- (BOOL)hk_hasPositiveSymptoms;
- (BOOL)hk_isSymptomsNoSymptoms;
- (BOOL)hk_isSymptomsNotSet;
- (__CFString)hk_localizedNumSymptoms;
- (id)_hk_waveformPathsWithNumberOfValues:()HealthUI transform:maximumNumberOfValuesPerPath:shouldResetXValues:initialValuesToOmit:minimumValueInMicrovolts:maximumValueInMicrovolts:;
- (id)_hk_waveformPathsWithPointsPerSecond:()HealthUI pointsPerMillivolt:maximumNumberOfValuesPerPath:shouldResetXValues:initialValuesToOmit:minimumValueInMicrovolts:maximumValueInMicrovolts:;
- (id)hk_BPMTextColor;
- (id)hk_cardHeaderColor;
- (id)hk_classificationTextColor;
- (id)hk_localizedAverageBPM;
- (id)hk_localizedDuration;
- (id)hk_localizedUppercaseNumSymptoms;
- (id)hk_numSymptomsTextColor;
- (id)hk_timeStampCompositingFilter;
- (id)hk_timeStampTextColor;
- (id)hk_waveformPathsWithNumberOfValues:()HealthUI fitToWidth:pointsPerMillivolt:minimumValueInMillivolts:maximumValueInMillivolts:;
- (uint64_t)_hk_classificationHasAbnormalBPMFontColorAndStyle;
- (uint64_t)_hk_classificationHasAbnormalHeaderColorAndStyle;
- (uint64_t)hk_cardBackgroundColor;
- (uint64_t)hk_isClassificationSupported;
- (uint64_t)hk_isPossibleAtrialFibrillation;
- (uint64_t)hk_waveformPathsWithPointsPerSecond:()HealthUI pointsPerMillivolt:minimumValueInMillivolts:maximumValueInMillivolts:;
- (uint64_t)hk_waveformPathsWithPointsPerSecond:()HealthUI pointsPerMillivolt:wrappingDuration:omittingInitialDuration:;
- (uint64_t)hk_waveformPathsWithPointsPerSecond:()HealthUI pointsPerMillivolt:wrappingDuration:omittingInitialDuration:minimumValueInMillivolts:maximumValueInMillivolts:;
@end

@implementation HKElectrocardiogram(HealthUI)

- (id)hk_waveformPathsWithNumberOfValues:()HealthUI fitToWidth:pointsPerMillivolt:minimumValueInMillivolts:maximumValueInMillivolts:
{
  CGAffineTransformMakeScale(&v15, a2 / (double)a7, a3 / 1000.0);
  *(float *)&double v11 = a4 * 1000.0;
  *(float *)&double v12 = a5 * 1000.0;
  v13 = objc_msgSend(a1, "_hk_waveformPathsWithNumberOfValues:transform:maximumNumberOfValuesPerPath:shouldResetXValues:initialValuesToOmit:minimumValueInMicrovolts:maximumValueInMicrovolts:", a7, &v15, 0, 0, 0, v11, v12);
  return v13;
}

- (id)_hk_waveformPathsWithNumberOfValues:()HealthUI transform:maximumNumberOfValuesPerPath:shouldResetXValues:initialValuesToOmit:minimumValueInMicrovolts:maximumValueInMicrovolts:
{
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__1;
  v37 = __Block_byref_object_dispose__1;
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  id v32 = objc_alloc_init(MEMORY[0x1E4FB14C0]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __197__HKElectrocardiogram_HealthUI___hk_waveformPathsWithNumberOfValues_transform_maximumNumberOfValuesPerPath_shouldResetXValues_initialValuesToOmit_minimumValueInMicrovolts_maximumValueInMicrovolts___block_invoke;
  v20[3] = &unk_1E6D51640;
  v20[6] = a9;
  v20[7] = a5;
  v20[8] = a7;
  char v26 = a8;
  v20[4] = &v27;
  v20[5] = &v33;
  float v24 = a3;
  float v25 = a2;
  long long v17 = a6[1];
  long long v21 = *a6;
  long long v22 = v17;
  long long v23 = a6[2];
  [a1 _enumerateDataForLead:1 block:v20];
  [(id)v34[5] addObject:v28[5]];
  id v18 = (id)v34[5];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v18;
}

- (uint64_t)hk_waveformPathsWithPointsPerSecond:()HealthUI pointsPerMillivolt:minimumValueInMillivolts:maximumValueInMillivolts:
{
  *(float *)&a5 = *(float *)&a5 * 1000.0;
  *(float *)&a6 = *(float *)&a6 * 1000.0;
  return objc_msgSend(a1, "_hk_waveformPathsWithPointsPerSecond:pointsPerMillivolt:maximumNumberOfValuesPerPath:shouldResetXValues:initialValuesToOmit:minimumValueInMicrovolts:maximumValueInMicrovolts:", 2560, 0, 0, a3, a4, a5, a6);
}

- (uint64_t)hk_waveformPathsWithPointsPerSecond:()HealthUI pointsPerMillivolt:wrappingDuration:omittingInitialDuration:
{
  LODWORD(a7) = -1081711002;
  LODWORD(a8) = 1073951539;
  return objc_msgSend(a1, "hk_waveformPathsWithPointsPerSecond:pointsPerMillivolt:wrappingDuration:omittingInitialDuration:minimumValueInMillivolts:maximumValueInMillivolts:", a3, a4, a5, a6, a7, a8);
}

- (uint64_t)hk_waveformPathsWithPointsPerSecond:()HealthUI pointsPerMillivolt:wrappingDuration:omittingInitialDuration:minimumValueInMillivolts:maximumValueInMillivolts:
{
  v14 = [a1 samplingFrequency];
  CGAffineTransform v15 = [MEMORY[0x1E4F2B618] hertzUnit];
  [v14 doubleValueForUnit:v15];
  double v17 = v16;

  unint64_t v20 = vcvtpd_s64_f64(v17 * a4);
  unint64_t v21 = vcvtpd_s64_f64(v17 * a5);
  *(float *)&double v18 = a6 * 1000.0;
  *(float *)&double v19 = a7 * 1000.0;
  return objc_msgSend(a1, "_hk_waveformPathsWithPointsPerSecond:pointsPerMillivolt:maximumNumberOfValuesPerPath:shouldResetXValues:initialValuesToOmit:minimumValueInMicrovolts:maximumValueInMicrovolts:", v20, 1, v21, a2, a3, v18, v19);
}

- (id)_hk_waveformPathsWithPointsPerSecond:()HealthUI pointsPerMillivolt:maximumNumberOfValuesPerPath:shouldResetXValues:initialValuesToOmit:minimumValueInMicrovolts:maximumValueInMicrovolts:
{
  double v17 = [a1 endDate];
  double v18 = [a1 startDate];
  [v17 timeIntervalSinceDate:v18];
  double v20 = v19 * a2;

  CGFloat v21 = v20 / (double)[a1 numberOfVoltageMeasurements];
  uint64_t v22 = [a1 numberOfVoltageMeasurements];
  CGAffineTransformMakeScale(&v27, v21, a3 / 1000.0);
  *(float *)&double v23 = a4;
  *(float *)&double v24 = a5;
  float v25 = objc_msgSend(a1, "_hk_waveformPathsWithNumberOfValues:transform:maximumNumberOfValuesPerPath:shouldResetXValues:initialValuesToOmit:minimumValueInMicrovolts:maximumValueInMicrovolts:", v22, &v27, a7, a8, a9, v23, v24);
  return v25;
}

- (uint64_t)hk_isClassificationSupported
{
  unint64_t v1 = [a1 privateClassification];
  return (v1 < 0xB) & (0x7FEu >> v1);
}

- (uint64_t)hk_isPossibleAtrialFibrillation
{
  unint64_t v1 = [a1 privateClassification];
  return (v1 < 0xA) & (0x310u >> v1);
}

- (BOOL)hk_hasPositiveSymptoms
{
  return [a1 symptomsStatus] == 2;
}

- (BOOL)hk_isSymptomsNotSet
{
  return [a1 symptomsStatus] == 0;
}

- (BOOL)hk_isSymptomsNoSymptoms
{
  return [a1 symptomsStatus] == 1;
}

- (id)hk_cardHeaderColor
{
  int v1 = objc_msgSend(a1, "_hk_classificationHasAbnormalHeaderColorAndStyle");
  v2 = objc_opt_class();
  if (v1) {
    objc_msgSend(v2, "hk_abnormalCardHeaderColor");
  }
  else {
  v3 = objc_msgSend(v2, "hk_defaultCardHeaderColor");
  }
  return v3;
}

- (uint64_t)hk_cardBackgroundColor
{
  v0 = objc_opt_class();
  return objc_msgSend(v0, "hk_defaultCardBackgroundColor");
}

- (id)hk_classificationTextColor
{
  int v1 = objc_msgSend(a1, "_hk_classificationHasAbnormalHeaderColorAndStyle");
  v2 = objc_opt_class();
  if (v1) {
    objc_msgSend(v2, "hk_abnormalClassificationTextColor");
  }
  else {
  v3 = objc_msgSend(v2, "hk_defaultClassificationTextColor");
  }
  return v3;
}

- (id)hk_timeStampTextColor
{
  int v1 = objc_msgSend(a1, "_hk_classificationHasAbnormalHeaderColorAndStyle");
  v2 = objc_opt_class();
  if (v1) {
    objc_msgSend(v2, "hk_abnormalTimeStampTextColor");
  }
  else {
  v3 = objc_msgSend(v2, "hk_defaultTimeStampTextColor");
  }
  return v3;
}

- (id)hk_timeStampCompositingFilter
{
  int v1 = objc_msgSend(a1, "_hk_classificationHasAbnormalHeaderColorAndStyle");
  v2 = objc_opt_class();
  if (v1) {
    objc_msgSend(v2, "hk_abnormalTimeStampCompositingFilter");
  }
  else {
  v3 = objc_msgSend(v2, "hk_defaultTimeStampCompositingFilter");
  }
  return v3;
}

- (id)hk_BPMTextColor
{
  int v1 = objc_msgSend(a1, "_hk_classificationHasAbnormalBPMFontColorAndStyle");
  v2 = objc_opt_class();
  if (v1) {
    objc_msgSend(v2, "hk_abnormalBPMTextColor");
  }
  else {
  v3 = objc_msgSend(v2, "hk_defaultBPMTextColor");
  }
  return v3;
}

- (id)hk_numSymptomsTextColor
{
  int v1 = objc_msgSend(a1, "hk_hasPositiveSymptoms");
  v2 = objc_opt_class();
  if (v1) {
    objc_msgSend(v2, "hk_positiveNumSymptomsTextColor");
  }
  else {
  v3 = objc_msgSend(v2, "hk_defaultNumSymptomsTextColor");
  }
  return v3;
}

+ (uint64_t)hk_defaultCardHeaderColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "hk_electrocardiogramCardHeaderColor");
}

+ (uint64_t)hk_defaultCardBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "hk_electrocardiogramCardBackgroundColor");
}

+ (uint64_t)hk_defaultClassificationTextColor
{
  return [MEMORY[0x1E4FB1618] labelColor];
}

+ (uint64_t)hk_abnormalClassificationTextColor
{
  return [MEMORY[0x1E4FB1618] blackColor];
}

+ (uint64_t)hk_defaultTimeStampTextColor
{
  return [MEMORY[0x1E4FB1618] secondaryLabelColor];
}

+ (uint64_t)hk_abnormalTimeStampTextColor
{
  return [MEMORY[0x1E4FB1618] systemGrayColor];
}

+ (id)hk_defaultTimeStampCompositingFilter
{
  return (id)*MEMORY[0x1E4F3A2B8];
}

+ (uint64_t)hk_defaultBPMTextColor
{
  return [MEMORY[0x1E4FB1618] systemGrayColor];
}

+ (uint64_t)hk_defaultNumSymptomsTextColor
{
  return [MEMORY[0x1E4FB1618] systemGrayColor];
}

+ (uint64_t)hk_abnormalCardHeaderColor
{
  return [MEMORY[0x1E4FB1618] systemYellowColor];
}

+ (id)hk_abnormalTimeStampCompositingFilter
{
  return (id)*MEMORY[0x1E4F3A2E0];
}

+ (uint64_t)hk_abnormalBPMTextColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "hk_appKeyColor");
}

+ (id)hk_positiveNumSymptomsTextColor
{
  v0 = +[HKDisplayCategory categoryWithID:11];
  int v1 = [v0 color];

  return v1;
}

+ (uint64_t)hk_onboardingCardHeaderColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "hk_electrocardiogramCardOnboardingHeaderColor");
}

+ (uint64_t)hk_onboardingCardBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "hk_electrocardiogramCardOnboardingBackgroundColor");
}

+ (id)hk_localizedAverageBPM:()HealthUI
{
  if (a3)
  {
    v3 = NSNumber;
    [a3 _beatsPerMinute];
    v4 = objc_msgSend(v3, "numberWithDouble:");
    v5 = objc_msgSend(MEMORY[0x1E4F28EE0], "hk_heartRateNumberFormatter");
    v6 = [v5 stringFromNumber:v4];

    v7 = NSString;
    v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v9 = [v8 localizedStringForKey:@"AVERAGE_BEATS_PER_MINUTE_SHORT_%@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Cinnamon"];
    v10 = HKConditionallyRedactedHeartRhythmString();
    double v11 = objc_msgSend(v7, "localizedStringWithFormat:", v10, v6);
  }
  else
  {
    v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v6 = [v4 localizedStringForKey:@"NO_AVERAGE_BEATS_PER_MINUTE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Cinnamon"];
    double v11 = HKConditionallyRedactedHeartRhythmString();
  }

  return v11;
}

- (id)hk_localizedAverageBPM
{
  v2 = objc_opt_class();
  v3 = [a1 averageHeartRate];
  v4 = objc_msgSend(v2, "hk_localizedAverageBPM:", v3);

  return v4;
}

- (id)hk_localizedDuration
{
  v2 = objc_msgSend(MEMORY[0x1E4F28C00], "hk_fullStyleDateComponentsFormatter");
  v3 = [a1 startDate];
  v4 = [a1 endDate];
  v5 = [v2 stringFromDate:v3 toDate:v4];

  return v5;
}

- (__CFString)hk_localizedNumSymptoms
{
  v2 = NSNumber;
  v3 = [a1 _localizedSymptoms];
  v4 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));

  if (objc_msgSend(a1, "hk_isSymptomsNotSet"))
  {
    v5 = &stru_1F3B9CF20;
  }
  else
  {
    if (objc_msgSend(a1, "hk_isSymptomsNoSymptoms"))
    {

      v4 = &unk_1F3C202C0;
    }
    v6 = NSString;
    v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v8 = [v7 localizedStringForKey:@"SYMPTOM_COUNT_NUMBERED_UNIT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Cinnamon"];
    v9 = HKConditionallyRedactedHeartRhythmString();
    objc_msgSend(v6, "localizedStringWithFormat:", v9, objc_msgSend(v4, "integerValue"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)hk_localizedUppercaseNumSymptoms
{
  int v1 = objc_msgSend(a1, "hk_localizedNumSymptoms");
  v2 = [v1 localizedUppercaseString];

  return v2;
}

- (uint64_t)_hk_classificationHasAbnormalHeaderColorAndStyle
{
  unint64_t v1 = [a1 privateClassification];
  return (v1 < 0xB) & (0x770u >> v1);
}

- (uint64_t)_hk_classificationHasAbnormalBPMFontColorAndStyle
{
  return 0;
}

@end