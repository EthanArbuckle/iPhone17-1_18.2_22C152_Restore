@interface HPRFHeartRateTachycardiaThresholdController
+ (BOOL)isDetectionEnabled;
+ (id)detectionEnabledDefaultsKey;
+ (id)footerText;
+ (id)paneTitleLocalizationKey;
+ (id)thresholdHeartRateDefaultsKey;
+ (id)thresholdHeartRateOptions;
+ (int64_t)thresholdHeartRate;
+ (int64_t)thresholdHeartRateDefault;
+ (void)saveThresholdValue:(id)a3;
@end

@implementation HPRFHeartRateTachycardiaThresholdController

+ (BOOL)isDetectionEnabled
{
  return +[_HKHeartSettingsUtilities isTachycardiaDetectionEnabled];
}

+ (id)detectionEnabledDefaultsKey
{
  return kHKHeartRateKeyEnableStationaryDiscordanceDetection;
}

+ (int64_t)thresholdHeartRate
{
  return (int64_t)+[_HKHeartSettingsUtilities tachycardiaThresholdHeartRate];
}

+ (int64_t)thresholdHeartRateDefault
{
  return _HKHeartSettingsTachycardiaThresholdHeartRateDefault;
}

+ (id)thresholdHeartRateDefaultsKey
{
  return kHKHeartRateKeyStationaryDiscordanceMinimumBPM;
}

+ (id)thresholdHeartRateOptions
{
  return +[_HKHeartSettingsUtilities tachycardiaHeartRateOptions];
}

+ (void)saveThresholdValue:(id)a3
{
}

+ (id)footerText
{
  v2 = objc_msgSend(a1, "localizedThresholdHeartRateStringWithValue:", objc_msgSend(a1, "thresholdHeartRate"));
  v3 = +[_HKHeartSettingsUtilities tachycardiaHeartThresholdFooterDescriptionWithThresholdValue:v2];

  return v3;
}

+ (id)paneTitleLocalizationKey
{
  return @"HEART_NOTIFICATION_TACHYCARDIA_LABEL";
}

@end