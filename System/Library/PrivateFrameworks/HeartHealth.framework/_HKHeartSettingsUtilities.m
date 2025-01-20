@interface _HKHeartSettingsUtilities
+ (BOOL)isBackgroundHeartRateEnabled;
+ (BOOL)isBradycardiaDetectionEnabled;
+ (BOOL)isBradycardiaDetectionSupportedOnActiveWatch;
+ (BOOL)isBradycardiaDetectionSupportedOnAllWatches;
+ (BOOL)isHeartRateEnabled;
+ (BOOL)isTachycardiaDetectionEnabled;
+ (BOOL)isWristDetectionEnabled;
+ (BOOL)shouldFooterTextDisplayOffConfiguration:(BOOL)a3;
+ (NSString)aFibBurdenAppleSupportURL;
+ (NSString)aFibBurdenArticleLinkURL;
+ (NSString)aFibBurdenDefaultLinkURL;
+ (NSString)aFibBurdenDeviceNotSupportedFooterDescription;
+ (NSString)aFibBurdenFooterDescription;
+ (NSString)aFibBurdenFooterDescriptionWithLink;
+ (NSString)aFibBurdenFooterLinkTitle;
+ (NSString)aFibBurdenHeartRateFooterDescriptionWithLink;
+ (NSString)aFibBurdenHeartRateFooterLinkTitle;
+ (NSString)aFibBurdenHeartRateFooterLinkURL;
+ (NSString)aFibBurdenIRNEnabledFooterDescription;
+ (NSString)aFibBurdenIRNEnabledFooterDescriptionWatch;
+ (NSString)aFibBurdenIRNEnabledFooterDescriptionWithLink;
+ (NSString)aFibBurdenRegionNotSupportedFooterDescription;
+ (NSString)aFibBurdenRegionNotSupportedFooterDescriptionWithLink;
+ (NSString)aFibBurdenRemoteDisabledFooterDescription;
+ (NSString)aFibBurdenRemoteDisabledFooterDescriptionWatch;
+ (NSString)aFibBurdenRemoteDisabledFooterDescriptionWithLink;
+ (NSString)aFibBurdenSectionTitle;
+ (NSString)aFibBurdenSeedExpiryFooterDescription;
+ (NSString)aFibBurdenSeedExpiryFooterDescriptionWatch;
+ (NSString)aFibBurdenSeedExpiryFooterDescriptionWithLink;
+ (NSString)aFibBurdenSetupTitleDescription;
+ (NSString)aFibBurdenTitleDescription;
+ (NSString)aFibBurdenUnavailableDetailText;
+ (NSString)aFibBurdenWristDetectFooterDescriptionWithLink;
+ (NSString)aFibBurdenWristDetectFooterLinkTitle;
+ (NSString)aFibBurdenWristDetectFooterLinkURL;
+ (NSString)bradycardiaLearnMoreLink;
+ (NSString)cardioFitnessAgeDeletedFooterDescription;
+ (NSString)cardioFitnessAgeDeletedFooterDescriptionWithLink;
+ (NSString)cardioFitnessAgeDeletedFooterLinkTitle;
+ (NSString)cardioFitnessAgeDeletedFooterLinkURL;
+ (NSString)cardioFitnessAgeRestrictedFooterDescription;
+ (NSString)cardioFitnessFooterDescription;
+ (NSString)cardioFitnessFooterDescriptionWithLink;
+ (NSString)cardioFitnessFooterLinkTitle;
+ (NSString)cardioFitnessFooterLinkURL;
+ (NSString)cardioFitnessPairedDeviceRegionGatedFooterDescription;
+ (NSString)cardioFitnessPregnantFooterDescription;
+ (NSString)cardioFitnessPregnantFooterDescriptionWithLink;
+ (NSString)cardioFitnessSectionTitle;
+ (NSString)cardioFitnessSetupTitleDescription;
+ (NSString)cardioFitnessTitleDescription;
+ (NSString)cardioFitnessUnavailableDetailText;
+ (NSString)cardioFitnessWristDetectFooterDescription;
+ (NSString)cardioFitnessWristDetectFooterDescriptionWithLink;
+ (NSString)cardioFitnessWristDetectFooterLinkTitle;
+ (NSString)cardioFitnessWristDetectFooterLinkURL;
+ (NSString)detailStatusOffText;
+ (NSString)detailStatusOnText;
+ (NSString)electrocardiogramLearnMoreURL;
+ (NSString)heartRateSectionDescription;
+ (NSString)heartRateThresholdOffDescription;
+ (NSString)irregularHeartRhythmFooterDescription;
+ (NSString)irregularHeartRhythmFooterLinkTitle;
+ (NSString)irregularHeartRhythmFooterLinkURL;
+ (NSString)irregularHeartRhythmSetupTitleDescription;
+ (NSString)irregularHeartRhythmTitleDescription;
+ (NSString)remoteDisabledLinkTitle;
+ (NSString)remoteDisabledLinkURL;
+ (NSString)seedExpiredLinkTitle;
+ (NSString)seedExpiredLinkURL;
+ (NSString)tachycardiaLearnMoreLink;
+ (id)_calculateHeartRateOptionsWithMin:(int64_t)a3 increment:(int64_t)a4 max:(int64_t)a5;
+ (id)bradycardiaHeartRateOptions;
+ (id)bradycardiaHeartThresholdFooterDescriptionWithThresholdValue:(id)a3;
+ (id)heartRateSettingsURL;
+ (id)tachycardiaHeartRateOptions;
+ (id)tachycardiaHeartThresholdFooterDescriptionWithThresholdValue:(id)a3;
+ (int64_t)bradycardiaThresholdHeartRate;
+ (int64_t)bradycardiaWarningThreshold;
+ (int64_t)tachycardiaThresholdHeartRate;
+ (void)_setThresholdHeartRate:(id)a3 detectedEnabledDefaultsKey:(id)a4 thresholdHeartRateDefaultKey:(id)a5;
+ (void)setBradycardiaThresholdHeartRate:(id)a3;
+ (void)setTachycardiaThresholdHeartRate:(id)a3;
@end

@implementation _HKHeartSettingsUtilities

+ (NSString)heartRateSectionDescription
{
  return (NSString *)HKHeartRateLocalizedString(@"HEART_NOTIFICATION_THRESHOLD_SECTION_TITLE");
}

+ (NSString)heartRateThresholdOffDescription
{
  return (NSString *)HKHeartRateLocalizedString(@"HEART_NOTIFICATION_OFF");
}

+ (NSString)remoteDisabledLinkTitle
{
  return (NSString *)HKHeartRateLocalizedString(@"FEATURE_DISABLED_REMOTELY_LINK");
}

+ (NSString)remoteDisabledLinkURL
{
  return (NSString *)HKHeartRateLocalizedString(@"FEATURE_DISABLED_REMOTELY_LINK_URL");
}

+ (NSString)seedExpiredLinkTitle
{
  return (NSString *)HKHeartRateLocalizedString(@"FEATURE_SEED_EXPIRED_LINK");
}

+ (NSString)seedExpiredLinkURL
{
  return (NSString *)HKHeartRateLocalizedString(@"FEATURE_SEED_EXPIRED_LINK_URL");
}

+ (NSString)detailStatusOnText
{
  return (NSString *)HKHeartRateLocalizedString(@"DETAIL_FEATURE_STATUS_ON_TEXT");
}

+ (NSString)detailStatusOffText
{
  return (NSString *)HKHeartRateLocalizedString(@"DETAIL_FEATURE_STATUS_OFF_TEXT");
}

+ (id)heartRateSettingsURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"bridge:root=com.apple.HeartRateSettings"];
}

+ (BOOL)isHeartRateEnabled
{
  return MEMORY[0x1F40E7D78](a1, a2);
}

+ (BOOL)isWristDetectionEnabled
{
  v2 = HKObjectForNanoPreferencesUserDefaultsKey();
  v3 = v2;
  if (v2) {
    int v4 = [v2 BOOLValue] ^ 1;
  }
  else {
    LOBYTE(v4) = 1;
  }

  return v4;
}

+ (BOOL)isBackgroundHeartRateEnabled
{
  int v3 = [a1 isHeartRateEnabled];
  if (v3)
  {
    LOBYTE(v3) = [a1 isWristDetectionEnabled];
  }
  return v3;
}

+ (id)bradycardiaHeartThresholdFooterDescriptionWithThresholdValue:(id)a3
{
  id v4 = a3;
  v5 = NSString;
  v6 = HKHeartRateLocalizedString(@"MINUTES_%ld");
  v7 = objc_msgSend(v5, "localizedStringWithFormat:", v6, 10);

  int v8 = objc_msgSend(a1, "shouldFooterTextDisplayOffConfiguration:", objc_msgSend(a1, "isBradycardiaDetectionEnabled"));
  v9 = NSString;
  if (v8)
  {
    v10 = HKHeartRateLocalizedString(@"HEART_NOTIFICATION_BRADYCARDIA_FOOTER_OFF_%@");
    objc_msgSend(v9, "stringWithFormat:", v10, v7, v13);
  }
  else
  {
    v10 = HKHeartRateLocalizedString(@"HEART_NOTIFICATION_BRADYCARDIA_FOOTER_%@_%@");
    objc_msgSend(v9, "stringWithFormat:", v10, v4, v7);
  v11 = };

  return v11;
}

+ (NSString)bradycardiaLearnMoreLink
{
  return (NSString *)HKHeartRateLocalizedString(@"HEART_NOTIFICATION_LEARN_MORE_LINK_URL");
}

+ (BOOL)isBradycardiaDetectionSupportedOnActiveWatch
{
  return [MEMORY[0x1E4F2B860] activePairedWatchSupportsBradycardiaDetection];
}

+ (BOOL)isBradycardiaDetectionSupportedOnAllWatches
{
  return [MEMORY[0x1E4F2B860] allPairedWatchesSupportBradycardiaDetection];
}

+ (BOOL)isBradycardiaDetectionEnabled
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  int v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F2BE88]];
  id v4 = [v3 objectForKey:*MEMORY[0x1E4F2BE68]];
  v5 = v4;
  if (v4) {
    char v6 = [v4 BOOLValue];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

+ (int64_t)bradycardiaThresholdHeartRate
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  int v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F2BE88]];
  id v4 = [v3 objectForKey:*MEMORY[0x1E4F2BE58]];
  v5 = v4;
  if (v4) {
    int64_t v6 = [v4 integerValue];
  }
  else {
    int64_t v6 = 40;
  }

  return v6;
}

+ (int64_t)bradycardiaWarningThreshold
{
  return 50;
}

+ (id)bradycardiaHeartRateOptions
{
  return (id)[a1 _calculateHeartRateOptionsWithMin:40 increment:5 max:50];
}

+ (void)setBradycardiaThresholdHeartRate:(id)a3
{
}

+ (BOOL)isTachycardiaDetectionEnabled
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  int v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F2BE88]];
  id v4 = [v3 objectForKey:*MEMORY[0x1E4F2BE78]];
  v5 = v4;
  if (v4) {
    char v6 = [v4 BOOLValue];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

+ (int64_t)tachycardiaThresholdHeartRate
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  int v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F2BE88]];
  id v4 = [v3 objectForKey:*MEMORY[0x1E4F2BE80]];
  v5 = v4;
  if (v4) {
    int64_t v6 = [v4 integerValue];
  }
  else {
    int64_t v6 = 120;
  }

  return v6;
}

+ (id)tachycardiaHeartRateOptions
{
  return (id)[a1 _calculateHeartRateOptionsWithMin:100 increment:10 max:150];
}

+ (id)tachycardiaHeartThresholdFooterDescriptionWithThresholdValue:(id)a3
{
  id v4 = a3;
  v5 = NSString;
  int64_t v6 = HKHeartRateLocalizedString(@"MINUTES_%ld");
  v7 = objc_msgSend(v5, "localizedStringWithFormat:", v6, 10);

  int v8 = objc_msgSend(a1, "shouldFooterTextDisplayOffConfiguration:", objc_msgSend(a1, "isTachycardiaDetectionEnabled"));
  v9 = NSString;
  if (v8)
  {
    v10 = HKHeartRateLocalizedString(@"HEART_NOTIFICATION_TACHYCARDIA_FOOTER_OFF_%@");
    objc_msgSend(v9, "stringWithFormat:", v10, v7, v13);
  }
  else
  {
    v10 = HKHeartRateLocalizedString(@"HEART_NOTIFICATION_TACHYCARDIA_FOOTER_%@_%@");
    objc_msgSend(v9, "stringWithFormat:", v10, v4, v7);
  v11 = };

  return v11;
}

+ (NSString)tachycardiaLearnMoreLink
{
  return (NSString *)HKHeartRateLocalizedString(@"HEART_NOTIFICATION_LEARN_MORE_LINK_URL");
}

+ (void)setTachycardiaThresholdHeartRate:(id)a3
{
}

+ (NSString)irregularHeartRhythmSetupTitleDescription
{
  return (NSString *)HKHeartRateLocalizedString(@"HEART_NOTIFICATION_ATRIAL_FIBRILLATION_ONBOARDING_BUTTON_TITLE");
}

+ (NSString)irregularHeartRhythmTitleDescription
{
  return (NSString *)HKHeartRateLocalizedString(@"HEART_NOTIFICATION_ATRIAL_FIBRILLATION_SWITCH_TITLE");
}

+ (NSString)irregularHeartRhythmFooterDescription
{
  int v3 = HKHeartRateLocalizedString(@"HEART_NOTIFICATION_ATRIAL_FIBRILLATION_NEEDS_GEOLOCATION_FOOTER");
  id v4 = [a1 irregularHeartRhythmFooterLinkTitle];
  v5 = [NSString stringWithFormat:@"%@\n%@", v3, v4];

  return (NSString *)v5;
}

+ (NSString)irregularHeartRhythmFooterLinkTitle
{
  return (NSString *)HKHeartRateLocalizedString(@"HEART_NOTIFICATION_ATRIAL_FIBRILLATION_FOOTER_LINK");
}

+ (NSString)irregularHeartRhythmFooterLinkURL
{
  return (NSString *)HKHeartRateLocalizedString(@"HEART_NOTIFICATION_LEARN_MORE_LINK_URL");
}

+ (NSString)cardioFitnessSectionTitle
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"CARDIO_FITNESS_SECTION_TITLE" value:&stru_1F3B84F70 table:@"HeartRateSettings-CardioFitness"];

  return (NSString *)v3;
}

+ (NSString)cardioFitnessSetupTitleDescription
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_CARDIO_FITNESS_ONBOARDING_BUTTON_TITLE" value:&stru_1F3B84F70 table:@"HeartRateSettings-CardioFitness"];

  return (NSString *)v3;
}

+ (NSString)cardioFitnessUnavailableDetailText
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_CARDIO_FITNESS_STATUS_UNAVAILABLE_TEXT" value:&stru_1F3B84F70 table:@"HeartRateSettings-CardioFitness"];

  return (NSString *)v3;
}

+ (NSString)cardioFitnessTitleDescription
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_CARDIO_FITNESS_SWITCH_TITLE" value:&stru_1F3B84F70 table:@"HeartRateSettings-CardioFitness"];

  return (NSString *)v3;
}

+ (NSString)cardioFitnessFooterDescription
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_CARDIO_FITNESS_FOOTER" value:&stru_1F3B84F70 table:@"HeartRateSettings-CardioFitness"];

  return (NSString *)v3;
}

+ (NSString)cardioFitnessPregnantFooterDescription
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"CARDIO_FITNESS_PREGNANCY_FOOTER" value:&stru_1F3B84F70 table:@"HeartRateSettings-Pregnancy"];

  return (NSString *)v3;
}

+ (NSString)cardioFitnessFooterDescriptionWithLink
{
  int v3 = HKHRHeartHealthBundle();
  id v4 = [v3 localizedStringForKey:@"HEART_NOTIFICATION_CARDIO_FITNESS_FOOTER" value:&stru_1F3B84F70 table:@"HeartRateSettings-CardioFitness"];

  v5 = [a1 cardioFitnessFooterLinkTitle];
  int64_t v6 = [NSString stringWithFormat:@"%@\n%@", v4, v5];

  return (NSString *)v6;
}

+ (NSString)cardioFitnessPregnantFooterDescriptionWithLink
{
  int v3 = HKHRHeartHealthBundle();
  id v4 = [v3 localizedStringForKey:@"CARDIO_FITNESS_PREGNANCY_FOOTER" value:&stru_1F3B84F70 table:@"HeartRateSettings-Pregnancy"];

  v5 = [a1 cardioFitnessFooterLinkTitle];
  int64_t v6 = [NSString stringWithFormat:@"%@\n%@", v4, v5];

  return (NSString *)v6;
}

+ (NSString)cardioFitnessFooterLinkTitle
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_CARDIO_FITNESS_FOOTER_LINK" value:&stru_1F3B84F70 table:@"HeartRateSettings-CardioFitness"];

  return (NSString *)v3;
}

+ (NSString)cardioFitnessFooterLinkURL
{
  return (NSString *)@"x-apple-Health://Heart.healthplugin/CardioFitnessOverview";
}

+ (NSString)cardioFitnessWristDetectFooterDescription
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_CARDIO_FITNESS_FOOTER_WRIST_DETECT" value:&stru_1F3B84F70 table:@"HeartRateSettings-CardioFitness"];

  return (NSString *)v3;
}

+ (NSString)cardioFitnessWristDetectFooterDescriptionWithLink
{
  int v3 = HKHRHeartHealthBundle();
  id v4 = [v3 localizedStringForKey:@"HEART_NOTIFICATION_CARDIO_FITNESS_FOOTER_WRIST_DETECT" value:&stru_1F3B84F70 table:@"HeartRateSettings-CardioFitness"];

  v5 = [a1 cardioFitnessWristDetectFooterLinkTitle];
  int64_t v6 = objc_msgSend(NSString, "stringWithFormat:", v4, v5);

  return (NSString *)v6;
}

+ (NSString)cardioFitnessWristDetectFooterLinkTitle
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_CARDIO_FITNESS_FOOTER_LINK_PASSCODE" value:&stru_1F3B84F70 table:@"HeartRateSettings-CardioFitness"];

  return (NSString *)v3;
}

+ (NSString)cardioFitnessWristDetectFooterLinkURL
{
  return (NSString *)@"bridge:root=PASSCODE_ID";
}

+ (NSString)cardioFitnessAgeDeletedFooterDescription
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_CARDIO_FITNESS_FOOTER_AGE_DELETED" value:&stru_1F3B84F70 table:@"HeartRateSettings-CardioFitness"];

  return (NSString *)v3;
}

+ (NSString)cardioFitnessAgeDeletedFooterDescriptionWithLink
{
  int v3 = HKHRHeartHealthBundle();
  id v4 = [v3 localizedStringForKey:@"HEART_NOTIFICATION_CARDIO_FITNESS_FOOTER_AGE_DELETED" value:&stru_1F3B84F70 table:@"HeartRateSettings-CardioFitness"];

  v5 = [a1 cardioFitnessAgeDeletedFooterLinkTitle];
  int64_t v6 = objc_msgSend(NSString, "stringWithFormat:", v4, v5);

  return (NSString *)v6;
}

+ (NSString)cardioFitnessAgeDeletedFooterLinkTitle
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_CARDIO_FITNESS_FOOTER_LINK_HEALTH_DETAILS" value:&stru_1F3B84F70 table:@"HeartRateSettings-CardioFitness"];

  return (NSString *)v3;
}

+ (NSString)cardioFitnessAgeDeletedFooterLinkURL
{
  return (NSString *)@"x-apple-health://HealthProfile";
}

+ (NSString)cardioFitnessAgeRestrictedFooterDescription
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_CARDIO_FITNESS_FOOTER_AGE_GATING" value:&stru_1F3B84F70 table:@"HeartRateSettings-CardioFitness"];

  return (NSString *)v3;
}

+ (NSString)cardioFitnessPairedDeviceRegionGatedFooterDescription
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_CARDIO_FITNESS_FOOTER_PAIRED_DEVICE_REGION_GATED" value:&stru_1F3B84F70 table:@"HeartRateSettings-CardioFitness"];

  return (NSString *)v3;
}

+ (NSString)electrocardiogramLearnMoreURL
{
  return (NSString *)@"https://support.apple.com/kb/HT208955";
}

+ (NSString)aFibBurdenSectionTitle
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"AFIB_BURDEN_SECTION_TITLE" value:&stru_1F3B84F70 table:@"HeartRateSettings-AFibBurden"];

  return (NSString *)v3;
}

+ (NSString)aFibBurdenTitleDescription
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_AFIB_BURDEN_SWITCH_TITLE" value:&stru_1F3B84F70 table:@"HeartRateSettings-AFibBurden"];

  return (NSString *)v3;
}

+ (NSString)aFibBurdenSetupTitleDescription
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_AFIB_BURDEN_ONBOARDING_BUTTON_TITLE" value:&stru_1F3B84F70 table:@"HeartRateSettings-AFibBurden"];

  return (NSString *)v3;
}

+ (NSString)aFibBurdenUnavailableDetailText
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_AFIB_BURDEN_STATUS_UNAVAILABLE_TEXT" value:&stru_1F3B84F70 table:@"HeartRateSettings-AFibBurden"];

  return (NSString *)v3;
}

+ (NSString)aFibBurdenFooterDescription
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_AFIB_BURDEN_FOOTER" value:&stru_1F3B84F70 table:@"HeartRateSettings-AFibBurden"];

  return (NSString *)v3;
}

+ (NSString)aFibBurdenFooterDescriptionWithLink
{
  int v3 = [a1 aFibBurdenFooterDescription];
  id v4 = [a1 aFibBurdenFooterLinkTitle];
  v5 = [NSString stringWithFormat:@"%@\n%@", v3, v4];

  return (NSString *)v5;
}

+ (NSString)aFibBurdenFooterLinkTitle
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_AFIB_BURDEN_FOOTER_LINK_ABOUT" value:&stru_1F3B84F70 table:@"HeartRateSettings-AFibBurden"];

  return (NSString *)v3;
}

+ (NSString)aFibBurdenArticleLinkURL
{
  return (NSString *)@"x-apple-Health://Heart.healthplugin/AFibBurden";
}

+ (NSString)aFibBurdenAppleSupportURL
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"AFIB_BURDEN_SUPPORT_URL" value:&stru_1F3B84F70 table:@"HeartRateSettings-AFibBurden"];

  return (NSString *)v3;
}

+ (NSString)aFibBurdenDefaultLinkURL
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"AFIB_BURDEN_GENERIC_LEARN_MORE_URL" value:&stru_1F3B84F70 table:@"HeartRateSettings-AFibBurden"];

  return (NSString *)v3;
}

+ (NSString)aFibBurdenHeartRateFooterDescriptionWithLink
{
  int v3 = HKHRHeartHealthBundle();
  id v4 = [v3 localizedStringForKey:@"HEART_NOTIFICATION_AFIB_BURDEN_FOOTER_HEART_RATE" value:&stru_1F3B84F70 table:@"HeartRateSettings-AFibBurden"];

  v5 = [a1 aFibBurdenHeartRateFooterLinkTitle];
  int64_t v6 = objc_msgSend(NSString, "stringWithFormat:", v4, v5);

  return (NSString *)v6;
}

+ (NSString)aFibBurdenHeartRateFooterLinkTitle
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_AFIB_BURDEN_FOOTER_LINK_PRIVACY" value:&stru_1F3B84F70 table:@"HeartRateSettings-AFibBurden"];

  return (NSString *)v3;
}

+ (NSString)aFibBurdenHeartRateFooterLinkURL
{
  return (NSString *)@"bridge:root=PRIVACY_ID";
}

+ (NSString)aFibBurdenWristDetectFooterDescriptionWithLink
{
  int v3 = HKHRHeartHealthBundle();
  id v4 = [v3 localizedStringForKey:@"HEART_NOTIFICATION_AFIB_BURDEN_FOOTER_WRIST_DETECT" value:&stru_1F3B84F70 table:@"HeartRateSettings-AFibBurden"];

  v5 = [a1 aFibBurdenWristDetectFooterLinkTitle];
  int64_t v6 = objc_msgSend(NSString, "stringWithFormat:", v4, v5);

  return (NSString *)v6;
}

+ (NSString)aFibBurdenWristDetectFooterLinkTitle
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_AFIB_BURDEN_FOOTER_LINK_PASSCODE" value:&stru_1F3B84F70 table:@"HeartRateSettings-AFibBurden"];

  return (NSString *)v3;
}

+ (NSString)aFibBurdenWristDetectFooterLinkURL
{
  return (NSString *)@"bridge:root=PASSCODE_ID";
}

+ (NSString)aFibBurdenDeviceNotSupportedFooterDescription
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_AFIB_BURDEN_DEVICE_NOT_SUPPORTED_FOOTER" value:&stru_1F3B84F70 table:@"HeartRateSettings-AFibBurden"];

  return (NSString *)v3;
}

+ (NSString)aFibBurdenIRNEnabledFooterDescription
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_AFIB_BURDEN_IRN_ENABLED_FOOTER" value:&stru_1F3B84F70 table:@"HeartRateSettings-AFibBurden"];

  return (NSString *)v3;
}

+ (NSString)aFibBurdenIRNEnabledFooterDescriptionWithLink
{
  int v3 = [a1 aFibBurdenIRNEnabledFooterDescription];
  id v4 = [a1 aFibBurdenFooterLinkTitle];
  v5 = [NSString stringWithFormat:@"%@\n%@", v3, v4];

  return (NSString *)v5;
}

+ (NSString)aFibBurdenIRNEnabledFooterDescriptionWatch
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_AFIB_BURDEN_IRN_ENABLED_FOOTER_WATCH" value:&stru_1F3B84F70 table:@"HeartRateSettings-AFibBurden"];

  return (NSString *)v3;
}

+ (NSString)aFibBurdenRegionNotSupportedFooterDescription
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_AFIB_BURDEN_REGION_NOT_SUPPORTED_FOOTER" value:&stru_1F3B84F70 table:@"HeartRateSettings-AFibBurden"];

  return (NSString *)v3;
}

+ (NSString)aFibBurdenRemoteDisabledFooterDescription
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_AFIB_BURDEN_REMOTE_DISABLED_FOOTER" value:&stru_1F3B84F70 table:@"HeartRateSettings-AFibBurden"];

  return (NSString *)v3;
}

+ (NSString)aFibBurdenRemoteDisabledFooterDescriptionWatch
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_AFIB_BURDEN_REMOTE_DISABLED_FOOTER_WATCH" value:&stru_1F3B84F70 table:@"HeartRateSettings-AFibBurden"];

  return (NSString *)v3;
}

+ (NSString)aFibBurdenRemoteDisabledFooterDescriptionWithLink
{
  int v3 = [a1 aFibBurdenRemoteDisabledFooterDescription];
  id v4 = [a1 remoteDisabledLinkTitle];
  v5 = [NSString stringWithFormat:@"%@\n%@", v3, v4];

  return (NSString *)v5;
}

+ (NSString)aFibBurdenSeedExpiryFooterDescription
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_AFIB_BURDEN_SEED_EXPIRY_FOOTER" value:&stru_1F3B84F70 table:@"HeartRateSettings-AFibBurden"];

  return (NSString *)v3;
}

+ (NSString)aFibBurdenSeedExpiryFooterDescriptionWatch
{
  id v2 = HKHRHeartHealthBundle();
  int v3 = [v2 localizedStringForKey:@"HEART_NOTIFICATION_AFIB_BURDEN_SEED_EXPIRY_FOOTER_WATCH" value:&stru_1F3B84F70 table:@"HeartRateSettings-AFibBurden"];

  return (NSString *)v3;
}

+ (NSString)aFibBurdenSeedExpiryFooterDescriptionWithLink
{
  int v3 = [a1 aFibBurdenSeedExpiryFooterDescription];
  id v4 = [a1 seedExpiredLinkTitle];
  v5 = [NSString stringWithFormat:@"%@\n%@", v3, v4];

  return (NSString *)v5;
}

+ (NSString)aFibBurdenRegionNotSupportedFooterDescriptionWithLink
{
  int v3 = [a1 aFibBurdenRegionNotSupportedFooterDescription];
  id v4 = [a1 remoteDisabledLinkTitle];
  v5 = [NSString stringWithFormat:@"%@\n%@", v3, v4];

  return (NSString *)v5;
}

+ (BOOL)shouldFooterTextDisplayOffConfiguration:(BOOL)a3
{
  if ([a1 isHeartRateEnabled]) {
    return [a1 isWristDetectionEnabled] & a3 ^ 1;
  }
  else {
    return 1;
  }
}

+ (void)_setThresholdHeartRate:(id)a3 detectedEnabledDefaultsKey:(id)a4 thresholdHeartRateDefaultKey:(id)a5
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *MEMORY[0x1E4F2BE88];
  BOOL v8 = a3 != 0;
  v9 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = (void *)[[v9 alloc] initWithSuiteName:v7];
  [v13 setBool:v8 forKey:v11];
  [v13 setObject:v12 forKey:v10];

  id v14 = objc_alloc_init(MEMORY[0x1E4F79CE0]);
  v15 = (void *)MEMORY[0x1E4F1CAD0];
  v18[0] = v11;
  v18[1] = v10;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v17 = [v15 setWithArray:v16];

  [v14 synchronizeUserDefaultsDomain:v7 keys:v17];
  if (a3) {
    HKHRSubmitNotificationsEnabledSignal();
  }
}

+ (id)_calculateHeartRateOptionsWithMin:(int64_t)a3 increment:(int64_t)a4 max:(int64_t)a5
{
  for (i = [MEMORY[0x1E4F1CA48] array];
  {
    v9 = [NSNumber numberWithInteger:a3];
    [i addObject:v9];
  }

  return i;
}

@end