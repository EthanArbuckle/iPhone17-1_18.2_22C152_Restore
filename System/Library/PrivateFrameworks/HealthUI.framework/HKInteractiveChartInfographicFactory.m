@interface HKInteractiveChartInfographicFactory
+ (BOOL)infographicSupportedForDisplayType:(id)a3 factorDisplayType:(id)a4 healthStore:(id)a5;
+ (id)_appleSleepingBreathingDisturbancesInfographicForDisplayType:(id)a3;
+ (id)_appleSleepingBreathingDisturbancesItemWithTitleKey:(id)a3 descriptionKey:(id)a4;
+ (id)_appleSleepingWristTemperatureInfographicForDisplayType:(id)a3;
+ (id)_appleSleepingWristTemperatureItemWithTitleKey:(id)a3 descriptionKey:(id)a4;
+ (id)_appleWalkingSteadinessInfographicForDisplayType:(id)a3;
+ (id)_attributedSymbolForAudioClassification:(unint64_t)a3 textStyle:(id)a4;
+ (id)_environmentalAudioExposureInfographic;
+ (id)_exposureLimitTextItem;
+ (id)_factorDescriptionForDisplayType:(id)a3 factorDisplayType:(id)a4;
+ (id)_headphoneAudioExposureInfographic;
+ (id)_itemForAppleWalkingSteadinessInfographicWithClassification:(int64_t)a3;
+ (id)_itemForAudioInfographicWithClassification:(unint64_t)a3 descriptionKey:(id)a4;
+ (id)_itemWithTitleKey:(id)a3 valueKey:(id)a4;
+ (id)_itemWithTitleKey:(id)a3 valueKey:(id)a4 hideSeparator:(BOOL)a5;
+ (id)_pregnancyHealthFactorDescriptionTitleKey:(id)a3 bodyKeys:(id)a4;
+ (id)_undefinedFactorDescriptionViewController:(id)a3 factorDisplayType:(id)a4;
+ (id)_whoExposureTextItem;
+ (id)infographicViewControllerForDisplayType:(id)a3 factorDisplayType:(id)a4 healthStore:(id)a5;
@end

@implementation HKInteractiveChartInfographicFactory

+ (BOOL)infographicSupportedForDisplayType:(id)a3 factorDisplayType:(id)a4 healthStore:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  v9 = v8;
  if (objc_opt_isKindOfClass())
  {
    v9 = v8;
    do
    {
      id v10 = v9;
      v9 = [v10 baseDisplayType];

      objc_opt_class();
    }
    while ((objc_opt_isKindOfClass() & 1) != 0);
  }
  if (v7)
  {
    v11 = objc_msgSend(v9, "hk_chartFactorDescriptionDisplayTypes");
    char v12 = [v11 containsObject:v7];

    if ((v12 & 1) == 0)
    {
LABEL_10:
      BOOL v13 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v14 = 0;
    while (1)
    {
      uint64_t v15 = _supportedDisplayTypes[v14];
      if (v15 == [v9 displayTypeIdentifier]) {
        break;
      }
      if (++v14 == 5) {
        goto LABEL_10;
      }
    }
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

+ (id)infographicViewControllerForDisplayType:(id)a3 factorDisplayType:(id)a4 healthStore:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    id v9 = v7;
    id v7 = [v9 baseDisplayType];
  }
  if ([v7 displayTypeIdentifier] == 172)
  {
    id v10 = [a1 _environmentalAudioExposureInfographic];
  }
  else
  {
    id v10 = 0;
  }
  if ([v7 displayTypeIdentifier] == 173)
  {
    uint64_t v11 = [a1 _headphoneAudioExposureInfographic];

    id v10 = (void *)v11;
  }
  if ([v7 displayTypeIdentifier] == 249)
  {
    uint64_t v12 = [a1 _appleWalkingSteadinessInfographicForDisplayType:v7];

    id v10 = (void *)v12;
  }
  if ([v7 displayTypeIdentifier] == 256)
  {
    uint64_t v13 = [a1 _appleSleepingWristTemperatureInfographicForDisplayType:v7];

    id v10 = (void *)v13;
  }
  if ([v7 displayTypeIdentifier] == 275)
  {
    uint64_t v14 = [a1 _appleSleepingBreathingDisturbancesInfographicForDisplayType:v7];

    id v10 = (void *)v14;
  }
  if (v8)
  {
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      id v15 = v8;
      id v8 = [v15 baseDisplayType];
    }
    uint64_t v16 = [a1 _factorDescriptionForDisplayType:v7 factorDisplayType:v8];

    id v10 = (void *)v16;
  }
  if (v10) {
    v17 = [[HKModalNavigationController alloc] initWithRootViewController:v10];
  }
  else {
    v17 = 0;
  }

  return v17;
}

+ (id)_environmentalAudioExposureInfographic
{
  v18[10] = *MEMORY[0x1E4F143B8];
  v17 = [a1 _itemForAudioInfographicWithClassification:1 descriptionKey:@"ENVIRONMENTAL_EXPOSURE_OK_DESCRIPTION"];
  v18[0] = v17;
  v3 = [a1 _itemForAudioInfographicWithClassification:2 descriptionKey:@"ENVIRONMENTAL_EXPOSURE_LOUD_DESCRIPTION"];
  v18[1] = v3;
  v4 = [a1 _exposureLimitTextItem];
  v18[2] = v4;
  v5 = [a1 _itemWithTitleKey:@"EXPOSURE_EXAMPLE_QUANTITY_75" valueKey:@"EXPOSURE_EXAMPLE_DESCRIPTION_75"];
  v18[3] = v5;
  id v6 = [a1 _itemWithTitleKey:@"EXPOSURE_EXAMPLE_QUANTITY_80" valueKey:@"EXPOSURE_EXAMPLE_DESCRIPTION_80"];
  v18[4] = v6;
  id v7 = [a1 _itemWithTitleKey:@"EXPOSURE_EXAMPLE_QUANTITY_90" valueKey:@"EXPOSURE_EXAMPLE_DESCRIPTION_90"];
  v18[5] = v7;
  id v8 = [a1 _itemWithTitleKey:@"EXPOSURE_EXAMPLE_QUANTITY_100" valueKey:@"EXPOSURE_EXAMPLE_DESCRIPTION_100"];
  v18[6] = v8;
  id v9 = [a1 _itemWithTitleKey:@"EXPOSURE_EXAMPLE_QUANTITY_110" valueKey:@"EXPOSURE_EXAMPLE_DESCRIPTION_110"];
  v18[7] = v9;
  id v10 = [a1 _itemWithTitleKey:@"EXPOSURE_EXAMPLE_QUANTITY_120" valueKey:@"EXPOSURE_EXAMPLE_DESCRIPTION_120" hideSeparator:1];
  v18[8] = v10;
  uint64_t v11 = [a1 _whoExposureTextItem];
  v18[9] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:10];

  uint64_t v13 = [[HKInfographicViewController alloc] initWithItems:v12];
  uint64_t v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v15 = [v14 localizedStringForKey:@"SOUND_LEVEL_CLASSIFICATIONS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(HKInfographicViewController *)v13 setTitle:v15];

  return v13;
}

+ (id)_headphoneAudioExposureInfographic
{
  v18[10] = *MEMORY[0x1E4F143B8];
  v17 = [a1 _itemForAudioInfographicWithClassification:1 descriptionKey:@"HEADPHONE_EXPOSURE_OK_DESCRIPTION"];
  v18[0] = v17;
  v3 = [a1 _itemForAudioInfographicWithClassification:2 descriptionKey:@"HEADPHONE_EXPOSURE_LOUD_DESCRIPTION"];
  v18[1] = v3;
  v4 = [a1 _exposureLimitTextItem];
  v18[2] = v4;
  v5 = [a1 _itemWithTitleKey:@"EXPOSURE_EXAMPLE_QUANTITY_75" valueKey:@"EXPOSURE_EXAMPLE_DESCRIPTION_75"];
  v18[3] = v5;
  id v6 = [a1 _itemWithTitleKey:@"EXPOSURE_EXAMPLE_QUANTITY_80" valueKey:@"EXPOSURE_EXAMPLE_DESCRIPTION_80"];
  v18[4] = v6;
  id v7 = [a1 _itemWithTitleKey:@"EXPOSURE_EXAMPLE_QUANTITY_90" valueKey:@"EXPOSURE_EXAMPLE_DESCRIPTION_90"];
  v18[5] = v7;
  id v8 = [a1 _itemWithTitleKey:@"EXPOSURE_EXAMPLE_QUANTITY_100" valueKey:@"EXPOSURE_EXAMPLE_DESCRIPTION_100"];
  v18[6] = v8;
  id v9 = [a1 _itemWithTitleKey:@"EXPOSURE_EXAMPLE_QUANTITY_110" valueKey:@"EXPOSURE_EXAMPLE_DESCRIPTION_110"];
  v18[7] = v9;
  id v10 = [a1 _itemWithTitleKey:@"EXPOSURE_EXAMPLE_QUANTITY_120" valueKey:@"EXPOSURE_EXAMPLE_DESCRIPTION_120" hideSeparator:1];
  v18[8] = v10;
  uint64_t v11 = [a1 _whoExposureTextItem];
  v18[9] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:10];

  uint64_t v13 = [[HKInfographicViewController alloc] initWithItems:v12];
  uint64_t v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v15 = [v14 localizedStringForKey:@"SOUND_LEVEL_CLASSIFICATIONS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(HKInfographicViewController *)v13 setTitle:v15];

  return v13;
}

+ (id)_appleWalkingSteadinessInfographicForDisplayType:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 _itemForAppleWalkingSteadinessInfographicWithClassification:1];
  id v6 = objc_msgSend(a1, "_itemForAppleWalkingSteadinessInfographicWithClassification:", 2, v5);
  v13[1] = v6;
  id v7 = [a1 _itemForAppleWalkingSteadinessInfographicWithClassification:3];
  v13[2] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];

  id v9 = [[HKInfographicViewController alloc] initWithItems:v8];
  id v10 = [v4 localization];

  uint64_t v11 = [v10 displayName];
  [(HKInfographicViewController *)v9 setTitle:v11];

  return v9;
}

+ (id)_appleSleepingWristTemperatureInfographicForDisplayType:(id)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4FB14D8];
  id v5 = a3;
  id v6 = [v4 plainButtonConfiguration];
  id v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v8 = [v7 localizedStringForKey:@"SLEEPING_WRIST_TEMPERATURE_INFOGRAPHIC_LEARN_MORE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Kali"];
  [v6 setTitle:v8];

  id v9 = [[HKInfographicButtonItem alloc] initWithConfiguration:v6 buttonTapHandler:&__block_literal_global_54];
  id v10 = [a1 _appleSleepingWristTemperatureItemWithTitleKey:@"SLEEPING_WRIST_TEMPERATURE_INFOGRAPHIC_YOUR_BASELINE_TITLE" descriptionKey:@"SLEEPING_WRIST_TEMPERATURE_INFOGRAPHIC_YOUR_BASELINE_BODY"];
  uint64_t v11 = objc_msgSend(a1, "_appleSleepingWristTemperatureItemWithTitleKey:descriptionKey:", @"ESTABLISHING_BASELINE", @"SLEEPING_WRIST_TEMPERATURE_INFOGRAPHIC_ESTABLISHING_BASELINE_BODY", v10);
  v17[1] = v11;
  v17[2] = v9;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];

  uint64_t v13 = [[HKInfographicViewController alloc] initWithItems:v12];
  uint64_t v14 = [v5 localization];

  id v15 = [v14 displayName];
  [(HKInfographicViewController *)v13 setTitle:v15];

  return v13;
}

void __96__HKInteractiveChartInfographicFactory__appleSleepingWristTemperatureInfographicForDisplayType___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v2 = [v1 localizedStringForKey:@"SLEEPING_WRIST_TEMPERATURE_KNOWLEDGE_BASE_ARTICLE_URL" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Kali"];
  id v4 = [v0 URLWithString:v2];

  v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v3 openURL:v4 withOptions:0];
}

+ (id)_appleSleepingBreathingDisturbancesInfographicForDisplayType:(id)a3
{
  v19[5] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4FB14D8];
  id v5 = a3;
  id v6 = [v4 plainButtonConfiguration];
  id v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v8 = [v7 localizedStringForKey:@"SLEEP_BREATHING_DISTURBANCES_INFOGRAPHIC_LEARN_MORE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Nebula"];
  [v6 setTitle:v8];

  id v9 = [[HKInfographicButtonItem alloc] initWithConfiguration:v6 buttonTapHandler:&__block_literal_global_377];
  id v10 = [a1 _appleSleepingBreathingDisturbancesItemWithTitleKey:@"SLEEP_BREATHING_DISTURBANCES_INFOGRAPHIC_SECTION_1_TITLE" descriptionKey:@"SLEEP_BREATHING_DISTURBANCES_INFOGRAPHIC_SECTION_1_BODY"];
  uint64_t v11 = objc_msgSend(a1, "_appleSleepingBreathingDisturbancesItemWithTitleKey:descriptionKey:", @"SLEEP_BREATHING_DISTURBANCES_INFOGRAPHIC_SECTION_2_TITLE", @"SLEEP_BREATHING_DISTURBANCES_INFOGRAPHIC_SECTION_2_BODY", v10);
  v19[1] = v11;
  uint64_t v12 = [a1 _appleSleepingBreathingDisturbancesItemWithTitleKey:@"SLEEP_BREATHING_DISTURBANCES_INFOGRAPHIC_SECTION_3_TITLE" descriptionKey:@"SLEEP_BREATHING_DISTURBANCES_INFOGRAPHIC_SECTION_3_BODY"];
  v19[2] = v12;
  uint64_t v13 = [a1 _appleSleepingBreathingDisturbancesItemWithTitleKey:@"SLEEP_BREATHING_DISTURBANCES_INFOGRAPHIC_SECTION_4_TITLE" descriptionKey:@"SLEEP_BREATHING_DISTURBANCES_INFOGRAPHIC_SECTION_4_BODY"];
  v19[3] = v13;
  v19[4] = v9;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:5];

  id v15 = [[HKInfographicViewController alloc] initWithItems:v14];
  uint64_t v16 = [v5 localization];

  v17 = [v16 displayName];
  [(HKInfographicViewController *)v15 setTitle:v17];

  return v15;
}

void __101__HKInteractiveChartInfographicFactory__appleSleepingBreathingDisturbancesInfographicForDisplayType___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v2 = [v1 localizedStringForKey:@"SLEEP_BREATHING_DISTURBANCES_KNOWLEDGE_BASE_ARTICLE_URL" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Nebula"];
  id v4 = [v0 URLWithString:v2];

  v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v3 openURL:v4 withOptions:0];
}

+ (id)_itemForAudioInfographicWithClassification:(unint64_t)a3 descriptionKey:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4FB2990];
  id v7 = a4;
  id v8 = [a1 _attributedSymbolForAudioClassification:a3 textStyle:v6];
  id v9 = (void *)[v8 mutableCopy];

  id v10 = [MEMORY[0x1E4F2AC28] localizedDisplayNameForClassification:a3];
  id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v12 = [a1 _titleAttributes];
  uint64_t v13 = (void *)[v11 initWithString:v10 attributes:v12];
  [v9 appendAttributedString:v13];

  id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v16 = [v15 localizedStringForKey:v7 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  v17 = (void *)[v14 initWithString:v16];
  v18 = [[HKInfographicContentItem alloc] initWithTitle:v9 description:v17];

  return v18;
}

+ (id)_exposureLimitTextItem
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F28B18]);
  v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v4 = [v3 localizedStringForKey:@"EXPOSURE_LIMIT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v11[0] = *MEMORY[0x1E4FB06F8];
  id v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB28C8], 2);
  v12[0] = v5;
  v11[1] = *MEMORY[0x1E4FB0700];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopValueColor");
  v12[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v8 = (void *)[v2 initWithString:v4 attributes:v7];

  id v9 = [[HKInfographicTextItem alloc] initWithDescription:v8];
  return v9;
}

+ (id)_whoExposureTextItem
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F28B18]);
  v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v4 = [v3 localizedStringForKey:@"EXPOSURE_WHO_RECOMMENDATION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v11[0] = *MEMORY[0x1E4FB06F8];
  id v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB28F8], 2);
  v12[0] = v5;
  v11[1] = *MEMORY[0x1E4FB0700];
  uint64_t v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v12[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v8 = (void *)[v2 initWithString:v4 attributes:v7];

  id v9 = [[HKInfographicTextItem alloc] initWithDescription:v8];
  return v9;
}

+ (id)_itemWithTitleKey:(id)a3 valueKey:(id)a4
{
  return (id)[a1 _itemWithTitleKey:a3 valueKey:a4 hideSeparator:0];
}

+ (id)_itemWithTitleKey:(id)a3 valueKey:(id)a4 hideSeparator:(BOOL)a5
{
  BOOL v21 = a5;
  id v7 = (objc_class *)MEMORY[0x1E4F28B18];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 alloc];
  id v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v12 = [v11 localizedStringForKey:v9 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  uint64_t v13 = [a1 _tableTitleAttributes];
  id v14 = (void *)[v10 initWithString:v12 attributes:v13];

  id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v17 = [v16 localizedStringForKey:v8 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  v18 = (void *)[v15 initWithString:v17];
  v19 = [[HKInfographicTableItem alloc] initWithTitle:v14 value:v18 separatorHidden:v21];

  return v19;
}

+ (id)_attributedSymbolForAudioClassification:(unint64_t)a3 textStyle:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v6 = (void *)MEMORY[0x1E4FB08E0];
  id v7 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:a4];
  id v8 = [v6 fontWithDescriptor:v7 size:0.0];
  id v9 = objc_msgSend(v5, "hk_hearingHealthAudioExposureSymbolForClassification:font:", a3, v8);

  id v10 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v9];
  id v11 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  uint64_t v12 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v10];
  [v11 appendAttributedString:v12];

  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
  [v11 appendAttributedString:v13];

  uint64_t v14 = *MEMORY[0x1E4FB0700];
  id v15 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_hearingHealthAudioExposureColorForClassification:", a3);
  objc_msgSend(v11, "addAttribute:value:range:", v14, v15, 0, objc_msgSend(v11, "length"));

  uint64_t v16 = (void *)[v11 copy];
  return v16;
}

+ (id)_itemForAppleWalkingSteadinessInfographicWithClassification:(int64_t)a3
{
  id v5 = +[HKMobilityUtilities localizedTitleForClassification:](HKMobilityUtilities, "localizedTitleForClassification:");
  uint64_t v6 = +[HKMobilityUtilities localizedDescriptionForClassification:a3];
  id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v8 = [a1 _titleAttributes];
  id v9 = (void *)[v7 initWithString:v5 attributes:v8];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6];
  id v11 = [[HKInfographicContentItem alloc] initWithTitle:v9 description:v10];

  return v11;
}

+ (id)_appleSleepingWristTemperatureItemWithTitleKey:(id)a3 descriptionKey:(id)a4
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v22[0] = *MEMORY[0x1E4FB06F8];
  id v5 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v6 = *MEMORY[0x1E4FB2990];
  id v21 = a4;
  id v7 = a3;
  id v8 = [v5 _preferredFontForTextStyle:v6 variant:66560];
  v23[0] = v8;
  v22[1] = *MEMORY[0x1E4FB0700];
  id v9 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopValueColor");
  v23[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v13 = [v12 localizedStringForKey:v7 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Kali"];

  uint64_t v14 = (void *)[v11 initWithString:v13 attributes:v10];
  id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v17 = [v16 localizedStringForKey:v21 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Kali"];

  v18 = (void *)[v15 initWithString:v17];
  v19 = [[HKInfographicContentItem alloc] initWithTitle:v14 description:v18];

  return v19;
}

+ (id)_appleSleepingBreathingDisturbancesItemWithTitleKey:(id)a3 descriptionKey:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F28B18];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  id v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v11 = [v10 localizedStringForKey:v8 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Nebula"];

  uint64_t v12 = [a1 _titleAttributes];
  uint64_t v13 = (void *)[v9 initWithString:v11 attributes:v12];

  id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v16 = [v15 localizedStringForKey:v7 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Nebula"];

  v17 = (void *)[v14 initWithString:v16];
  v18 = [[HKInfographicContentItem alloc] initWithTitle:v13 description:v17];

  return v18;
}

+ (id)_factorDescriptionForDisplayType:(id)a3 factorDisplayType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 displayTypeIdentifier];
  if (v8 > 136)
  {
    if (v8 == 137)
    {
      if ([v7 displayTypeIdentifier] == 191)
      {
        id v9 = @"WALKING_HEARTRATE_PREGNANCY_TITLE";
        id v10 = &unk_1F3C1F468;
        goto LABEL_20;
      }
    }
    else if (v8 == 248)
    {
      if ([v7 displayTypeIdentifier] == 191)
      {
        id v9 = @"AFIB_BURDEN_PREGNANCY_TITLE";
        id v10 = &unk_1F3C1F498;
        goto LABEL_20;
      }
    }
    else if (v8 == 284 && [v7 displayTypeIdentifier] == 191)
    {
      id v9 = @"STATE_OF_MIND_PREGNANCY_TITLE";
      id v10 = &unk_1F3C1F4B0;
      goto LABEL_20;
    }
  }
  else if (v8 == 3)
  {
    if ([v7 displayTypeIdentifier] == 191)
    {
      id v9 = @"BODY_MASS_PREGNANCY_TITLE";
      id v10 = &unk_1F3C1F438;
      goto LABEL_20;
    }
  }
  else if (v8 == 118)
  {
    if ([v7 displayTypeIdentifier] == 191)
    {
      id v9 = @"RESTING_HEARTRATE_PREGNANCY_TITLE";
      id v10 = &unk_1F3C1F450;
      goto LABEL_20;
    }
  }
  else if (v8 == 124 && [v7 displayTypeIdentifier] == 191)
  {
    id v9 = @"CARDIO_FITNESS_PREGNANCY_TITLE";
    id v10 = &unk_1F3C1F480;
LABEL_20:
    uint64_t v11 = [a1 _pregnancyHealthFactorDescriptionTitleKey:v9 bodyKeys:v10];
    goto LABEL_22;
  }
  uint64_t v11 = [a1 _undefinedFactorDescriptionViewController:v6 factorDisplayType:v7];
LABEL_22:
  uint64_t v12 = (void *)v11;

  return v12;
}

+ (id)_undefinedFactorDescriptionViewController:(id)a3 factorDisplayType:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4F28B18];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  id v10 = [a1 _tableTitleAttributes];
  uint64_t v11 = (void *)[v9 initWithString:@"Undefined Factor Description" attributes:v10];

  uint64_t v12 = NSString;
  uint64_t v13 = [v8 localization];

  id v14 = [v13 displayName];
  id v15 = [v7 localization];

  uint64_t v16 = [v15 displayName];
  v17 = [v12 stringWithFormat:@"No description is available for %@ with the factor %@.", v14, v16];

  v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v17];
  v19 = [[HKInfographicContentItem alloc] initWithTitle:v11 description:v18];
  v25[0] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];

  id v21 = [[HKInfographicViewController alloc] initWithItems:v20];
  v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v23 = [v22 localizedStringForKey:@"LIFE_FACTOR" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-AFibBurden"];
  [(HKInfographicViewController *)v21 setTitle:v23];

  return v21;
}

+ (id)_pregnancyHealthFactorDescriptionTitleKey:(id)a3 bodyKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v9 = [v8 localizedStringForKey:v6 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pregnancy"];

  id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v11 = [a1 _titleAttributes];
  uint64_t v12 = (void *)[v10 initWithString:v9 attributes:v11];

  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 1;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __91__HKInteractiveChartInfographicFactory__pregnancyHealthFactorDescriptionTitleKey_bodyKeys___block_invoke;
  v23 = &unk_1E6D54380;
  v25 = v26;
  id v13 = v12;
  id v24 = v13;
  id v14 = objc_msgSend(v7, "hk_map:", &v20);
  id v15 = [HKInfographicViewController alloc];
  uint64_t v16 = -[HKInfographicViewController initWithItems:](v15, "initWithItems:", v14, v20, v21, v22, v23);
  v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v18 = [v17 localizedStringForKey:@"LIFE_FACTOR" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-AFibBurden"];
  [(HKInfographicViewController *)v16 setTitle:v18];

  _Block_object_dispose(v26, 8);
  return v16;
}

HKInfographicContentItem *__91__HKInteractiveChartInfographicFactory__pregnancyHealthFactorDescriptionTitleKey_bodyKeys___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a2;
  id v5 = [v3 bundleWithIdentifier:@"com.apple.HealthUI"];
  id v6 = [v5 localizedStringForKey:v4 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pregnancy"];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v8 + 24))
  {
    *(unsigned char *)(v8 + 24) = 0;
    id v9 = [[HKInfographicContentItem alloc] initWithTitle:*(void *)(a1 + 32) description:v7];
  }
  else
  {
    id v9 = [[HKInfographicTextItem alloc] initWithDescription:v7];
  }
  id v10 = v9;

  return v10;
}

@end