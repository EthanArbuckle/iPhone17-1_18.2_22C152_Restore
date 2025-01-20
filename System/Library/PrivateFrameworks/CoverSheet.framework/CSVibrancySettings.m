@interface CSVibrancySettings
+ (id)settingsControllerModule;
- (BOOL)boostEnabled;
- (double)minimumLuminanceDifference;
- (double)naturalEffectTypeStrength;
- (void)setBoostEnabled:(BOOL)a3;
- (void)setDefaultValues;
- (void)setMinimumLuminanceDifference:(double)a3;
- (void)setNaturalEffectTypeStrength:(double)a3;
@end

@implementation CSVibrancySettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)CSVibrancySettings;
  [(PTSettings *)&v3 setDefaultValues];
  self->_boostEnabled = 1;
  self->_minimumLuminanceDifference = 0.2;
  self->_naturalEffectTypeStrength = 0.5;
}

+ (id)settingsControllerModule
{
  v20[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Boost Enabled" valueKeyPath:@"boostEnabled"];
  objc_super v3 = [MEMORY[0x1E4F941B8] rowWithTitle:@"Min. Lum. Difference" valueKeyPath:@"minimumLuminanceDifference"];
  v4 = [MEMORY[0x1E4F941B8] rowWithTitle:@"Natural Type Strength" valueKeyPath:@"naturalEffectTypeStrength"];
  v5 = (void *)MEMORY[0x1E4F94160];
  v20[0] = v2;
  v20[1] = v3;
  v20[2] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  v7 = [v5 sectionWithRows:v6 title:@"AOD Reduced Backlight"];

  v8 = (void *)MEMORY[0x1E4F940F8];
  v9 = [MEMORY[0x1E4F94170] action];
  v10 = [v8 rowWithTitle:@"Restore Defaults" action:v9];

  v11 = (void *)MEMORY[0x1E4F94160];
  v19 = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v13 = [v11 sectionWithRows:v12 title:@"Restore Defaults"];

  v14 = (void *)MEMORY[0x1E4F94160];
  v18[0] = v7;
  v18[1] = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v16 = [v14 moduleWithTitle:@"Vibrancy" contents:v15];

  return v16;
}

- (BOOL)boostEnabled
{
  return self->_boostEnabled;
}

- (void)setBoostEnabled:(BOOL)a3
{
  self->_boostEnabled = a3;
}

- (double)minimumLuminanceDifference
{
  return self->_minimumLuminanceDifference;
}

- (void)setMinimumLuminanceDifference:(double)a3
{
  self->_minimumLuminanceDifference = a3;
}

- (double)naturalEffectTypeStrength
{
  return self->_naturalEffectTypeStrength;
}

- (void)setNaturalEffectTypeStrength:(double)a3
{
  self->_naturalEffectTypeStrength = a3;
}

@end