@interface HPRFHeartRateBradycardiaThresholdController
+ (BOOL)isDetectionEnabled;
+ (id)detectionEnabledDefaultsKey;
+ (id)footerText;
+ (id)paneTitleLocalizationKey;
+ (id)thresholdHeartRateDefaultsKey;
+ (id)thresholdHeartRateOptions;
+ (int64_t)thresholdHeartRate;
+ (int64_t)thresholdHeartRateDefault;
+ (void)saveThresholdValue:(id)a3;
- (void)didSelectThresholdValue:(id)a3;
@end

@implementation HPRFHeartRateBradycardiaThresholdController

- (void)didSelectThresholdValue:(id)a3
{
  id v4 = a3;
  id v5 = +[_HKHeartSettingsUtilities bradycardiaWarningThreshold];
  if (v4
    && (uint64_t)[v4 integerValue] >= (uint64_t)v5
    && (id v6 = [(id)objc_opt_class() thresholdHeartRate], v6 != objc_msgSend(v4, "integerValue")))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_B2C0;
    v9[3] = &unk_18800;
    v9[4] = self;
    v7 = +[UIAlertController hkhr_bradycardiaConfirmationControllerWithValue:confirmHandler:cancelHandler:](UIAlertController, "hkhr_bradycardiaConfirmationControllerWithValue:confirmHandler:cancelHandler:", [v4 integerValue], v9, 0);
    [(HPRFHeartRateBradycardiaThresholdController *)self presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)HPRFHeartRateBradycardiaThresholdController;
    [(HPRFHeartRateThresholdController *)&v8 didSelectThresholdValue:v4];
  }
}

+ (BOOL)isDetectionEnabled
{
  return +[_HKHeartSettingsUtilities isBradycardiaDetectionEnabled];
}

+ (id)detectionEnabledDefaultsKey
{
  return kHKHeartRateKeyEnableBradycardiaDetection;
}

+ (int64_t)thresholdHeartRate
{
  return (int64_t)+[_HKHeartSettingsUtilities bradycardiaThresholdHeartRate];
}

+ (int64_t)thresholdHeartRateDefault
{
  return _HKHeartSettingsBradycardiaThresholdHeartRateDefault;
}

+ (id)thresholdHeartRateDefaultsKey
{
  return kHKHeartRateKeyBradycardiaThresholdBPM;
}

+ (id)thresholdHeartRateOptions
{
  return +[_HKHeartSettingsUtilities bradycardiaHeartRateOptions];
}

+ (void)saveThresholdValue:(id)a3
{
}

+ (id)footerText
{
  v2 = objc_msgSend(a1, "localizedThresholdHeartRateStringWithValue:", objc_msgSend(a1, "thresholdHeartRate"));
  v3 = +[_HKHeartSettingsUtilities bradycardiaHeartThresholdFooterDescriptionWithThresholdValue:v2];

  return v3;
}

+ (id)paneTitleLocalizationKey
{
  return @"HEART_NOTIFICATION_BRADYCARDIA_LABEL";
}

@end