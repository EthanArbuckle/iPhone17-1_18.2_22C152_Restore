@interface AMRedModeSettings
+ (id)settingsControllerModule;
- (double)offLuxThreshold;
- (double)onLuxThreshold;
- (void)setDefaultValues;
- (void)setOffLuxThreshold:(double)a3;
- (void)setOnLuxThreshold:(double)a3;
@end

@implementation AMRedModeSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)AMRedModeSettings;
  [(PTSettings *)&v3 setDefaultValues];
  self->_onLuxThreshold = 5.0;
  self->_offLuxThreshold = 10.0;
}

+ (id)settingsControllerModule
{
  v21[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F62320] rowWithTitle:@"Activation Lux Threshold" valueKeyPath:@"onLuxThreshold"];
  objc_super v3 = [v2 minValue:0.1 maxValue:100.0];

  v4 = [MEMORY[0x263F62320] rowWithTitle:@"Deactivation Lux Threshold" valueKeyPath:@"offLuxThreshold"];
  v5 = [v4 minValue:0.1 maxValue:100.0];

  v6 = (void *)MEMORY[0x263F622D8];
  v21[0] = v3;
  v21[1] = v5;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  v8 = [v6 sectionWithRows:v7 title:@"Trigger Conditions - Ambient Illumination"];

  v9 = (void *)MEMORY[0x263F622A0];
  v10 = [MEMORY[0x263F622F8] actionWithSettingsKeyPath:0];
  v11 = [v9 rowWithTitle:@"Restore Defaults" action:v10];

  v12 = (void *)MEMORY[0x263F622D8];
  v20 = v11;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
  v14 = [v12 sectionWithRows:v13];

  v15 = (void *)MEMORY[0x263F622D8];
  v19[0] = v8;
  v19[1] = v14;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v17 = [v15 moduleWithTitle:@"Red Mode" contents:v16];

  return v17;
}

- (double)onLuxThreshold
{
  return self->_onLuxThreshold;
}

- (void)setOnLuxThreshold:(double)a3
{
  self->_onLuxThreshold = a3;
}

- (double)offLuxThreshold
{
  return self->_offLuxThreshold;
}

- (void)setOffLuxThreshold:(double)a3
{
  self->_offLuxThreshold = a3;
}

@end