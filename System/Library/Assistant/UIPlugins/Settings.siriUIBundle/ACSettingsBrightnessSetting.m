@interface ACSettingsBrightnessSetting
- (ACSettingsBrightnessSetting)init;
- (Class)settingsDetailClass;
- (double)value;
- (id)leftImage;
- (id)rightImage;
- (void)addDelta:(double)a3;
- (void)dealloc;
- (void)handleBrightnessDidChangeNotification:(id)a3;
- (void)setValue:(double)a3 isTracking:(BOOL)a4;
@end

@implementation ACSettingsBrightnessSetting

- (ACSettingsBrightnessSetting)init
{
  v7.receiver = self;
  v7.super_class = (Class)ACSettingsBrightnessSetting;
  v2 = [(ACSettingsBrightnessSetting *)&v7 init];
  if (v2)
  {
    uint64_t v3 = ACSettingsLocalizedString(@"SETTING_BRIGHTNESS");
    name = v2->super.super._name;
    v2->super.super._name = (NSString *)v3;

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"handleBrightnessDidChangeNotification:" name:UIScreenBrightnessDidChangeNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  +[PSBrightnessSettingsDetail endBrightnessAdjustmentTransaction];
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIScreenBrightnessDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)ACSettingsBrightnessSetting;
  [(ACSettingsBrightnessSetting *)&v4 dealloc];
}

- (Class)settingsDetailClass
{
  return (Class)objc_opt_class();
}

- (double)value
{
  +[PSBrightnessSettingsDetail currentValue];
  return result;
}

- (void)setValue:(double)a3 isTracking:(BOOL)a4
{
  +[PSBrightnessSettingsDetail beginBrightnessAdjustmentTransaction];
  double v6 = 1.0;
  double v7 = 0.0;
  if (a3 >= 0.0) {
    double v7 = a3;
  }
  if (a3 <= 1.0) {
    double v6 = v7;
  }
  +[PSBrightnessSettingsDetail setValue:v6];
  if (!a4)
  {
    +[PSBrightnessSettingsDetail endBrightnessAdjustmentTransaction];
  }
}

- (void)addDelta:(double)a3
{
}

- (id)leftImage
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = +[UIImage imageNamed:@"Small_Sun" inBundle:v2];

  return v3;
}

- (id)rightImage
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = +[UIImage imageNamed:@"Big_Sun" inBundle:v2];

  return v3;
}

- (void)handleBrightnessDidChangeNotification:(id)a3
{
  objc_super v4 = [(ACSettingsBasicSetting *)self delegate];
  unsigned __int8 v5 = [v4 isTracking];

  if ((v5 & 1) == 0)
  {
    id v6 = [(ACSettingsBasicSetting *)self delegate];
    [v6 settingChangedExternally:self];
  }
}

@end