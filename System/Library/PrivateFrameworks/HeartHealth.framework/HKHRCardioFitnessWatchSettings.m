@interface HKHRCardioFitnessWatchSettings
+ (id)hiddenSettings;
- (BOOL)settingEnabled;
- (BOOL)settingVisible;
- (HKHRCardioFitnessFooter)footer;
- (HKHRCardioFitnessWatchSettings)initWithSettingVisible:(BOOL)a3 settingEnabled:(BOOL)a4 statusText:(id)a5 footer:(id)a6;
- (NSString)statusText;
- (void)setFooter:(id)a3;
- (void)setSettingEnabled:(BOOL)a3;
- (void)setSettingVisible:(BOOL)a3;
- (void)setStatusText:(id)a3;
@end

@implementation HKHRCardioFitnessWatchSettings

- (HKHRCardioFitnessWatchSettings)initWithSettingVisible:(BOOL)a3 settingEnabled:(BOOL)a4 statusText:(id)a5 footer:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HKHRCardioFitnessWatchSettings;
  v12 = [(HKHRCardioFitnessWatchSettings *)&v16 init];
  v13 = v12;
  if (v12)
  {
    [(HKHRCardioFitnessWatchSettings *)v12 setSettingVisible:v8];
    [(HKHRCardioFitnessWatchSettings *)v13 setSettingEnabled:v7];
    [(HKHRCardioFitnessWatchSettings *)v13 setStatusText:v10];
    [(HKHRCardioFitnessWatchSettings *)v13 setFooter:v11];
    v14 = v13;
  }

  return v13;
}

+ (id)hiddenSettings
{
  v2 = [HKHRCardioFitnessWatchSettings alloc];
  v3 = +[_HKHeartSettingsUtilities cardioFitnessUnavailableDetailText];
  v4 = [(HKHRCardioFitnessWatchSettings *)v2 initWithSettingVisible:0 settingEnabled:0 statusText:v3 footer:0];

  return v4;
}

- (BOOL)settingVisible
{
  return self->_settingVisible;
}

- (void)setSettingVisible:(BOOL)a3
{
  self->_settingVisible = a3;
}

- (BOOL)settingEnabled
{
  return self->_settingEnabled;
}

- (void)setSettingEnabled:(BOOL)a3
{
  self->_settingEnabled = a3;
}

- (NSString)statusText
{
  return self->_statusText;
}

- (void)setStatusText:(id)a3
{
}

- (HKHRCardioFitnessFooter)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footer, 0);

  objc_storeStrong((id *)&self->_statusText, 0);
}

@end