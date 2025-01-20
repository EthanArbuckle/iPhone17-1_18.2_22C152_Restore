@interface UIColor(HKMenstrualCyclesUI)
+ (id)_hkmcui_colorWithAssetName:()HKMenstrualCyclesUI;
+ (id)hkmc_calendarTodayLabelColor;
+ (id)hkmc_cycleFactorsTimeIntervalBackgroundColor;
+ (id)hkmc_cycleHistoryFilterLabelColor;
+ (id)hkmc_cycleLogCellBackgroundColor;
+ (id)hkmc_doneButtonLoggingCarouselColor;
+ (id)hkmc_fertilityProjectionColor;
+ (id)hkmc_highContrastCycleFactorsTimeIntervalBackgroundColor;
+ (id)hkmc_highContrastMenstruationBackgroundColor;
+ (id)hkmc_highContrastSupplementaryDataBackgroundColor;
+ (id)hkmc_loggingCardBackgroundColor;
+ (id)hkmc_menstruationBackgroundColor;
+ (id)hkmc_menstruationCalendarFutureColor;
+ (id)hkmc_menstruationProjectionHighColor;
+ (id)hkmc_menstruationProjectionLowColor;
+ (id)hkmc_ovulationDayCycleTimelineColor;
+ (id)hkmc_ovulationDayCycleTimelineReversedColor;
+ (id)hkmc_projectionTextColor;
+ (id)hkmc_supplementaryDataBackgroundColor;
+ (id)hkmc_supplementaryDataTextFutureColor;
+ (uint64_t)hkmc_cycleHistoryFilterBackgroundColor;
+ (uint64_t)hkmc_cycleHistoryGradientFadeColor;
+ (uint64_t)hkmc_cycleHistorySectionCellBackgroundColor;
+ (uint64_t)hkmc_fertileWindowColor;
+ (uint64_t)hkmc_fertilityBackgroundColor;
+ (uint64_t)hkmc_fertilityBackgroundFadedColor;
+ (uint64_t)hkmc_highContrastMenstruationColor;
+ (uint64_t)hkmc_highContrastMenstruationLoggingCardGradientAColor;
+ (uint64_t)hkmc_highContrastMenstruationLoggingCardGradientBColor;
+ (uint64_t)hkmc_highContrastRegularDayColor;
+ (uint64_t)hkmc_highContrastSupplementaryDataTextColor;
+ (uint64_t)hkmc_highContrastSupplementaryLoggingCardGradientAColor;
+ (uint64_t)hkmc_highContrastSupplementaryLoggingCardGradientBColor;
+ (uint64_t)hkmc_menstruationColor;
+ (uint64_t)hkmc_menstruationLoggingCardGradientAColor;
+ (uint64_t)hkmc_menstruationLoggingCardGradientBColor;
+ (uint64_t)hkmc_menstruationSelectionTintColor;
+ (uint64_t)hkmc_menstruationTimelineFutureColor;
+ (uint64_t)hkmc_ovulationDayColor;
+ (uint64_t)hkmc_ovulationDayCycleHistoryColor;
+ (uint64_t)hkmc_ovulationDayCycleHistoryFadedColor;
+ (uint64_t)hkmc_regularDayColor;
+ (uint64_t)hkmc_supplementaryDataColor;
+ (uint64_t)hkmc_supplementaryDataSelectionTintColor;
+ (uint64_t)hkmc_supplementaryDataTextColor;
+ (uint64_t)hkmc_supplementaryDataTimelineFutureColor;
+ (uint64_t)hkmc_supplementaryLoggingCardGradientAColor;
+ (uint64_t)hkmc_supplementaryLoggingCardGradientBColor;
@end

@implementation UIColor(HKMenstrualCyclesUI)

+ (id)hkmc_calendarTodayLabelColor
{
  v0 = [MEMORY[0x263F825C8] whiteColor];
  v1 = [MEMORY[0x263F825C8] blackColor];
  v2 = HKUIDynamicColorWithColors();

  return v2;
}

+ (id)_hkmcui_colorWithAssetName:()HKMenstrualCyclesUI
{
  v3 = (void *)MEMORY[0x263F825C8];
  v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  v6 = objc_msgSend(v4, "hkmcui_bundle");
  v7 = [v3 colorNamed:v5 inBundle:v6 compatibleWithTraitCollection:0];

  return v7;
}

+ (uint64_t)hkmc_cycleHistoryFilterBackgroundColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"CycleHistoryFilterBackground");
}

+ (id)hkmc_cycleHistoryFilterLabelColor
{
  v0 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v1 = [MEMORY[0x263F825C8] labelColor];
  v2 = HKUIDynamicColorWithColors();

  return v2;
}

+ (uint64_t)hkmc_cycleHistorySectionCellBackgroundColor
{
  return [MEMORY[0x263F825C8] tertiarySystemBackgroundColor];
}

+ (uint64_t)hkmc_cycleHistoryGradientFadeColor
{
  return [MEMORY[0x263F825C8] tertiarySystemBackgroundColor];
}

+ (id)hkmc_doneButtonLoggingCarouselColor
{
  v0 = objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"DoneButtonLoggingCarousel");
  v1 = [MEMORY[0x263F825C8] tertiarySystemBackgroundColor];
  v2 = HKUIDynamicColorWithColors();

  return v2;
}

+ (uint64_t)hkmc_fertileWindowColor
{
  return [MEMORY[0x263F825C8] systemTealColor];
}

+ (uint64_t)hkmc_fertilityBackgroundColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"Fertility Background");
}

+ (uint64_t)hkmc_fertilityBackgroundFadedColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"Fertility Background Faded");
}

+ (id)hkmc_fertilityProjectionColor
{
  v0 = (void *)MEMORY[0x263F825C8];
  v1 = objc_msgSend(MEMORY[0x263F827E8], "hkmc_fertilityProjectionImage");
  v2 = [v0 colorWithPatternImage:v1];

  return v2;
}

+ (id)hkmc_loggingCardBackgroundColor
{
  v0 = [MEMORY[0x263F825C8] systemGray4Color];
  v1 = [v0 colorWithAlphaComponent:0.13];
  v2 = [MEMORY[0x263F825C8] systemGray4Color];
  v3 = [v2 colorWithAlphaComponent:0.7];
  v4 = HKUIDynamicColorWithColors();

  return v4;
}

+ (uint64_t)hkmc_menstruationColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"Menstruation");
}

+ (id)hkmc_menstruationCalendarFutureColor
{
  v0 = objc_msgSend(MEMORY[0x263F825C8], "hkmc_menstruationColor");
  v1 = [v0 colorWithAlphaComponent:0.2];

  return v1;
}

+ (uint64_t)hkmc_menstruationTimelineFutureColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"Menstruation Timeline Future");
}

+ (id)hkmc_menstruationBackgroundColor
{
  v0 = objc_msgSend(MEMORY[0x263F825C8], "hkmc_menstruationColor");
  v1 = [v0 colorWithAlphaComponent:0.08];

  v2 = objc_msgSend(MEMORY[0x263F825C8], "hkmc_menstruationColor");
  v3 = [v2 colorWithAlphaComponent:0.24];

  v4 = HKUIDynamicColorWithColors();

  return v4;
}

+ (uint64_t)hkmc_menstruationLoggingCardGradientAColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"MenstruationLoggingCardGradientA");
}

+ (uint64_t)hkmc_menstruationLoggingCardGradientBColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"MenstruationLoggingCardGradientB");
}

+ (id)hkmc_menstruationProjectionHighColor
{
  v0 = (void *)MEMORY[0x263F825C8];
  v1 = objc_msgSend(MEMORY[0x263F827E8], "hkmc_menstruationProjectionHighImage");
  v2 = [v0 colorWithPatternImage:v1];

  return v2;
}

+ (id)hkmc_menstruationProjectionLowColor
{
  v0 = (void *)MEMORY[0x263F825C8];
  v1 = objc_msgSend(MEMORY[0x263F827E8], "hkmc_menstruationProjectionLowImage");
  v2 = [v0 colorWithPatternImage:v1];

  return v2;
}

+ (id)hkmc_projectionTextColor
{
  v0 = [MEMORY[0x263F825C8] whiteColor];
  v1 = [MEMORY[0x263F825C8] blackColor];
  v2 = HKUIDynamicColorWithColors();

  return v2;
}

+ (uint64_t)hkmc_regularDayColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"RegularDay");
}

+ (uint64_t)hkmc_supplementaryDataColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"Supplementary Data");
}

+ (id)hkmc_supplementaryDataBackgroundColor
{
  v0 = objc_msgSend(MEMORY[0x263F825C8], "hkmc_supplementaryDataTextColor");
  v1 = [v0 colorWithAlphaComponent:0.08];

  v2 = objc_msgSend(MEMORY[0x263F825C8], "hkmc_supplementaryDataTextColor");
  v3 = [v2 colorWithAlphaComponent:0.24];

  v4 = HKUIDynamicColorWithColors();

  return v4;
}

+ (id)hkmc_cycleLogCellBackgroundColor
{
  v0 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  v1 = [v0 colorWithAlphaComponent:0.8];

  v2 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  v3 = HKUIDynamicColorWithColors();

  return v3;
}

+ (id)hkmc_cycleFactorsTimeIntervalBackgroundColor
{
  v0 = objc_msgSend(MEMORY[0x263F825C8], "hkmc_regularDayColor");
  v1 = [MEMORY[0x263F825C8] quaternarySystemFillColor];
  v2 = HKUIDynamicColorWithColors();

  return v2;
}

+ (id)hkmc_highContrastCycleFactorsTimeIntervalBackgroundColor
{
  v0 = objc_msgSend(MEMORY[0x263F825C8], "hkmc_highContrastRegularDayColor");
  v1 = [MEMORY[0x263F825C8] quaternarySystemFillColor];
  v2 = HKUIDynamicColorWithColors();

  return v2;
}

+ (uint64_t)hkmc_supplementaryDataTextColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"Supplementary Data Text");
}

+ (id)hkmc_supplementaryDataTextFutureColor
{
  v1 = objc_msgSend(a1, "hkmc_supplementaryDataTextColor");
  v2 = [v1 colorWithAlphaComponent:0.2];

  return v2;
}

+ (uint64_t)hkmc_supplementaryDataTimelineFutureColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"Supplementary Data Timeline Future");
}

+ (uint64_t)hkmc_supplementaryLoggingCardGradientAColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"SupplementaryLoggingCardGradientA");
}

+ (uint64_t)hkmc_supplementaryLoggingCardGradientBColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"SupplementaryLoggingCardGradientB");
}

+ (uint64_t)hkmc_menstruationSelectionTintColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"MenstruationSelectionTint");
}

+ (uint64_t)hkmc_supplementaryDataSelectionTintColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"SupplementaryDataSelectionTint");
}

+ (uint64_t)hkmc_highContrastRegularDayColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"HighContrastRegularDay");
}

+ (uint64_t)hkmc_highContrastMenstruationColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"HighContrastMenstruation");
}

+ (id)hkmc_highContrastMenstruationBackgroundColor
{
  v0 = objc_msgSend(MEMORY[0x263F825C8], "hkmc_highContrastMenstruationColor");
  v1 = [v0 colorWithAlphaComponent:0.08];

  v2 = objc_msgSend(MEMORY[0x263F825C8], "hkmc_highContrastMenstruationColor");
  v3 = [v2 colorWithAlphaComponent:0.24];

  v4 = HKUIDynamicColorWithColors();

  return v4;
}

+ (uint64_t)hkmc_highContrastSupplementaryDataTextColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"HighContrastSupplementaryData");
}

+ (id)hkmc_highContrastSupplementaryDataBackgroundColor
{
  v0 = objc_msgSend(MEMORY[0x263F825C8], "hkmc_highContrastSupplementaryDataTextColor");
  v1 = [v0 colorWithAlphaComponent:0.08];

  v2 = objc_msgSend(MEMORY[0x263F825C8], "hkmc_highContrastSupplementaryDataTextColor");
  v3 = [v2 colorWithAlphaComponent:0.24];

  v4 = HKUIDynamicColorWithColors();

  return v4;
}

+ (uint64_t)hkmc_highContrastSupplementaryLoggingCardGradientAColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"HighContrastSupplementaryLoggingCardGradientA");
}

+ (uint64_t)hkmc_highContrastSupplementaryLoggingCardGradientBColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"HighContrastSupplementaryLoggingCardGradientB");
}

+ (uint64_t)hkmc_highContrastMenstruationLoggingCardGradientAColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"HighContrastMenstruationLoggingCardGradientA");
}

+ (uint64_t)hkmc_highContrastMenstruationLoggingCardGradientBColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"HighContrastMenstruationLoggingCardGradientB");
}

+ (uint64_t)hkmc_ovulationDayColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"Ovulation Day");
}

+ (id)hkmc_ovulationDayCycleTimelineColor
{
  v0 = (void *)MEMORY[0x263F825C8];
  v1 = objc_msgSend(MEMORY[0x263F827E8], "hkmc_ovulationDayImage");
  v2 = [v0 colorWithPatternImage:v1];

  return v2;
}

+ (id)hkmc_ovulationDayCycleTimelineReversedColor
{
  v0 = (void *)MEMORY[0x263F825C8];
  v1 = objc_msgSend(MEMORY[0x263F827E8], "hkmc_ovulationDayReversedImage");
  v2 = [v0 colorWithPatternImage:v1];

  return v2;
}

+ (uint64_t)hkmc_ovulationDayCycleHistoryColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"Ovulation Day Cycle History");
}

+ (uint64_t)hkmc_ovulationDayCycleHistoryFadedColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "_hkmcui_colorWithAssetName:", @"Ovulation Day Cycle History Faded");
}

@end