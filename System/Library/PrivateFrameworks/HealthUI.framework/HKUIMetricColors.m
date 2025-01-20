@interface HKUIMetricColors
+ (id)activityColors;
+ (id)allergiesClinicalColors;
+ (id)bodyMeasurementColors;
+ (id)carePlansClinicalColors;
+ (id)categoryColorsWithColor:(id)a3;
+ (id)clinicalNotesClinicalColors;
+ (id)conditionsClinicalColors;
+ (id)defaultClinicalColors;
+ (id)defaultContextViewColorsUsingColor:(id)a3;
+ (id)devicesClinicalColors;
+ (id)disabledContextViewColor;
+ (id)hearingHealthColors;
+ (id)immunizationsClinicalColors;
+ (id)insuranceClinicalColors;
+ (id)labResultsClinicalColors;
+ (id)medicationTrackingColors;
+ (id)medicationsClinicalColors;
+ (id)mindfulnessColors;
+ (id)mobilityColors;
+ (id)nutritionColors;
+ (id)otherColors;
+ (id)pregnancyColors;
+ (id)proceduresClinicalColors;
+ (id)reproductiveHealthColors;
+ (id)respiratoryColors;
+ (id)sleepColors;
+ (id)sleepColorsForSleepAnalysis:(int64_t)a3;
+ (id)socialHistoryClinicalColors;
+ (id)symptomsColors;
+ (id)unknownCategoryClinicalColors;
+ (id)vitalsClinicalColors;
+ (id)vitalsColors;
+ (id)workoutContextViewColors;
- (UIColor)contextViewPrimaryTextColor;
- (UIColor)contextViewSecondaryTextColor;
- (UIColor)keyColor;
- (void)setContextViewPrimaryTextColor:(id)a3;
- (void)setContextViewSecondaryTextColor:(id)a3;
- (void)setKeyColor:(id)a3;
@end

@implementation HKUIMetricColors

- (UIColor)keyColor
{
  return self->_keyColor;
}

+ (id)vitalsColors
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_vitalsKeyColor");
  [v2 setKeyColor:v3];

  v4 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartOverlayPillLightColor");
  [v2 setContextViewPrimaryTextColor:v4];

  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_defaultSecondaryTextColor");
  [v2 setContextViewSecondaryTextColor:v5];

  return v2;
}

+ (id)activityColors
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityKeyColor");
  [v2 setKeyColor:v3];

  v4 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartOverlayPillLightColor");
  [v2 setContextViewPrimaryTextColor:v4];

  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_defaultSecondaryTextColor");
  [v2 setContextViewSecondaryTextColor:v5];

  return v2;
}

+ (id)bodyMeasurementColors
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_bodyMeasurementsKeyColor");
  [v2 setKeyColor:v3];

  v4 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartOverlayPillLightColor");
  [v2 setContextViewPrimaryTextColor:v4];

  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_defaultSecondaryTextColor");
  [v2 setContextViewSecondaryTextColor:v5];

  return v2;
}

+ (id)mindfulnessColors
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_mindfulnessKeyColor");
  [v2 setKeyColor:v3];

  v4 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartOverlayPillDarkColor");
  [v2 setContextViewPrimaryTextColor:v4];

  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_defaultSecondaryTextColor");
  [v2 setContextViewSecondaryTextColor:v5];

  return v2;
}

+ (id)mobilityColors
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_mobilityKeyColor");
  [v2 setKeyColor:v3];

  v4 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartOverlayPillDarkColor");
  [v2 setContextViewPrimaryTextColor:v4];

  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_defaultSecondaryTextColor");
  [v2 setContextViewSecondaryTextColor:v5];

  return v2;
}

+ (id)nutritionColors
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_nutritionKeyColor");
  [v2 setKeyColor:v3];

  v4 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartOverlayPillDarkColor");
  [v2 setContextViewPrimaryTextColor:v4];

  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_defaultSecondaryTextColor");
  [v2 setContextViewSecondaryTextColor:v5];

  return v2;
}

+ (id)pregnancyColors
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_pregnancyKeyColor");
  [v2 setKeyColor:v3];

  v4 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartOverlayPillDarkColor");
  [v2 setContextViewPrimaryTextColor:v4];

  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_defaultSecondaryTextColor");
  [v2 setContextViewSecondaryTextColor:v5];

  return v2;
}

+ (id)reproductiveHealthColors
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_reproductiveHealthKeyColor");
  [v2 setKeyColor:v3];

  v4 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartOverlayPillLightColor");
  [v2 setContextViewPrimaryTextColor:v4];

  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_defaultSecondaryTextColor");
  [v2 setContextViewSecondaryTextColor:v5];

  return v2;
}

+ (id)sleepColors
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepKeyColor");
  [v2 setKeyColor:v3];

  v4 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartOverlayPillDarkColor");
  [v2 setContextViewPrimaryTextColor:v4];

  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_defaultSecondaryTextColor");
  [v2 setContextViewSecondaryTextColor:v5];

  return v2;
}

+ (id)sleepColorsForSleepAnalysis:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepColorForSleepAnalysis:", a3);
  [v4 setKeyColor:v5];

  v6 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepPrimaryTextColorForSleepAnalysis:", a3);
  [v4 setContextViewPrimaryTextColor:v6];

  v7 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_defaultSecondaryTextColor");
  [v4 setContextViewSecondaryTextColor:v7];

  return v4;
}

+ (id)hearingHealthColors
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_hearingHealthKeyColor");
  [v2 setKeyColor:v3];

  id v4 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartOverlayPillLightColor");
  [v2 setContextViewPrimaryTextColor:v4];

  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_defaultSecondaryTextColor");
  [v2 setContextViewSecondaryTextColor:v5];

  return v2;
}

+ (id)respiratoryColors
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_respiratoryKeyColor");
  [v2 setKeyColor:v3];

  id v4 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartOverlayPillDarkColor");
  [v2 setContextViewPrimaryTextColor:v4];

  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_defaultSecondaryTextColor");
  [v2 setContextViewSecondaryTextColor:v5];

  return v2;
}

+ (id)otherColors
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_otherKeyColor");
  [v2 setKeyColor:v3];

  id v4 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartOverlayPillLightColor");
  [v2 setContextViewPrimaryTextColor:v4];

  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_defaultSecondaryTextColor");
  [v2 setContextViewSecondaryTextColor:v5];

  return v2;
}

+ (id)symptomsColors
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_symptomsKeyColor");
  [v2 setKeyColor:v3];

  id v4 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartOverlayPillLightColor");
  [v2 setContextViewPrimaryTextColor:v4];

  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_defaultSecondaryTextColor");
  [v2 setContextViewSecondaryTextColor:v5];

  return v2;
}

+ (id)categoryColorsWithColor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setKeyColor:v3];

  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartOverlayPillLightColor");
  [v4 setContextViewPrimaryTextColor:v5];

  v6 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_defaultSecondaryTextColor");
  [v4 setContextViewSecondaryTextColor:v6];

  return v4;
}

+ (id)defaultContextViewColorsUsingColor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setKeyColor:v3];

  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_defaultPrimaryTextColor");
  [v4 setContextViewPrimaryTextColor:v5];

  v6 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_defaultSecondaryTextColor");
  [v4 setContextViewSecondaryTextColor:v6];

  return v4;
}

+ (id)disabledContextViewColor
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  id v3 = [MEMORY[0x1E4FB1618] systemGray4Color];
  [v2 setKeyColor:v3];

  id v4 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_defaultSecondaryTextColor");
  [v2 setContextViewPrimaryTextColor:v4];

  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_defaultSecondaryTextColor");
  [v2 setContextViewSecondaryTextColor:v5];

  return v2;
}

+ (id)workoutContextViewColors
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  id v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_workoutKeyColor");
  [v2 setKeyColor:v3];

  id v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [v2 setContextViewPrimaryTextColor:v4];

  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_defaultSecondaryTextColor");
  [v2 setContextViewSecondaryTextColor:v5];

  return v2;
}

- (void)setKeyColor:(id)a3
{
}

- (UIColor)contextViewPrimaryTextColor
{
  return self->_contextViewPrimaryTextColor;
}

- (void)setContextViewPrimaryTextColor:(id)a3
{
}

- (UIColor)contextViewSecondaryTextColor
{
  return self->_contextViewSecondaryTextColor;
}

- (void)setContextViewSecondaryTextColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextViewSecondaryTextColor, 0);
  objc_storeStrong((id *)&self->_contextViewPrimaryTextColor, 0);
  objc_storeStrong((id *)&self->_keyColor, 0);
}

+ (id)defaultClinicalColors
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  id v3 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_49];
  [v2 setContextViewPrimaryTextColor:v3];
  [v2 setContextViewSecondaryTextColor:v3];

  return v2;
}

id __51__HKUIMetricColors_Clinical__defaultClinicalColors__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else {
  id v2 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  return v2;
}

+ (id)allergiesClinicalColors
{
  id v2 = [a1 defaultClinicalColors];
  id v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_allergiesClinicalKeyColor");
  [v2 setKeyColor:v3];

  return v2;
}

+ (id)carePlansClinicalColors
{
  id v2 = [a1 defaultClinicalColors];
  id v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_carePlansClinicalKeyColor");
  [v2 setKeyColor:v3];

  return v2;
}

+ (id)clinicalNotesClinicalColors
{
  id v2 = [a1 defaultClinicalColors];
  id v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_clinicalNotesClinicalKeyColor");
  [v2 setKeyColor:v3];

  return v2;
}

+ (id)conditionsClinicalColors
{
  id v2 = [a1 defaultClinicalColors];
  id v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_conditionsClinicalKeyColor");
  [v2 setKeyColor:v3];

  return v2;
}

+ (id)devicesClinicalColors
{
  id v2 = [a1 defaultClinicalColors];
  id v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_devicesClinicalKeyColor");
  [v2 setKeyColor:v3];

  return v2;
}

+ (id)immunizationsClinicalColors
{
  id v2 = [a1 defaultClinicalColors];
  id v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_immunizationsClinicalKeyColor");
  [v2 setKeyColor:v3];

  return v2;
}

+ (id)insuranceClinicalColors
{
  id v2 = [a1 defaultClinicalColors];
  id v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_insuranceClinicalKeyColor");
  [v2 setKeyColor:v3];

  return v2;
}

+ (id)labResultsClinicalColors
{
  id v2 = [a1 defaultClinicalColors];
  id v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_labResultsClinicalKeyColor");
  [v2 setKeyColor:v3];

  return v2;
}

+ (id)medicationsClinicalColors
{
  id v2 = [a1 defaultClinicalColors];
  id v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_medicationsClinicalKeyColor");
  [v2 setKeyColor:v3];

  return v2;
}

+ (id)medicationTrackingColors
{
  id v2 = [a1 defaultClinicalColors];
  id v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_medicationTrackingKeyColor");
  [v2 setKeyColor:v3];

  return v2;
}

+ (id)proceduresClinicalColors
{
  id v2 = [a1 defaultClinicalColors];
  id v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_proceduresClinicalKeyColor");
  [v2 setKeyColor:v3];

  return v2;
}

+ (id)socialHistoryClinicalColors
{
  id v2 = [a1 defaultClinicalColors];
  id v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_socialHistoryClinicalKeyColor");
  [v2 setKeyColor:v3];

  return v2;
}

+ (id)vitalsClinicalColors
{
  id v2 = [a1 defaultClinicalColors];
  id v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_vitalsClinicalKeyColor");
  [v2 setKeyColor:v3];

  return v2;
}

+ (id)unknownCategoryClinicalColors
{
  id v2 = [a1 defaultClinicalColors];
  id v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_unknownCategoryClinicalKeyColor");
  [v2 setKeyColor:v3];

  return v2;
}

@end