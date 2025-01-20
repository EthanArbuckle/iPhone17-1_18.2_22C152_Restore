@interface HKHRAFibBurdenBridgeSettings
+ (id)hiddenSettings;
- (BOOL)settingEnabled;
- (BOOL)settingVisible;
- (BOOL)showOnboarding;
- (HKHRAFibBurdenBridgeSettings)initWithSettingVisible:(BOOL)a3 settingEnabled:(BOOL)a4 showOnboarding:(BOOL)a5 footer:(id)a6;
- (HKHRAFibBurdenFooter)footer;
- (void)setFooter:(id)a3;
- (void)setSettingEnabled:(BOOL)a3;
- (void)setSettingVisible:(BOOL)a3;
- (void)setShowOnboarding:(BOOL)a3;
@end

@implementation HKHRAFibBurdenBridgeSettings

- (HKHRAFibBurdenBridgeSettings)initWithSettingVisible:(BOOL)a3 settingEnabled:(BOOL)a4 showOnboarding:(BOOL)a5 footer:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HKHRAFibBurdenBridgeSettings;
  v11 = [(HKHRAFibBurdenBridgeSettings *)&v15 init];
  v12 = v11;
  if (v11)
  {
    [(HKHRAFibBurdenBridgeSettings *)v11 setSettingVisible:v8];
    [(HKHRAFibBurdenBridgeSettings *)v12 setSettingEnabled:v7];
    [(HKHRAFibBurdenBridgeSettings *)v12 setShowOnboarding:v6];
    [(HKHRAFibBurdenBridgeSettings *)v12 setFooter:v10];
    v13 = v12;
  }

  return v12;
}

+ (id)hiddenSettings
{
  v2 = [[HKHRAFibBurdenBridgeSettings alloc] initWithSettingVisible:0 settingEnabled:0 showOnboarding:0 footer:0];

  return v2;
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

- (BOOL)showOnboarding
{
  return self->_showOnboarding;
}

- (void)setShowOnboarding:(BOOL)a3
{
  self->_showOnboarding = a3;
}

- (HKHRAFibBurdenFooter)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end