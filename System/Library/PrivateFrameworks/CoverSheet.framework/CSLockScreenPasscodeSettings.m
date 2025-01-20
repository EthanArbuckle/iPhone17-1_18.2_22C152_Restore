@interface CSLockScreenPasscodeSettings
+ (id)settingsControllerModule;
- (double)lightenSourceOverColorAlpha;
- (double)lightenSourceOverColorWhite;
- (double)plusDColorAlpha;
- (double)plusDColorWhite;
- (void)setDefaultValues;
- (void)setLightenSourceOverColorAlpha:(double)a3;
- (void)setLightenSourceOverColorWhite:(double)a3;
- (void)setPlusDColorAlpha:(double)a3;
- (void)setPlusDColorWhite:(double)a3;
@end

@implementation CSLockScreenPasscodeSettings

- (void)setDefaultValues
{
  [(CSLockScreenPasscodeSettings *)self setLightenSourceOverColorWhite:1.0];
  [(CSLockScreenPasscodeSettings *)self setLightenSourceOverColorAlpha:0.25];
  [(CSLockScreenPasscodeSettings *)self setPlusDColorWhite:0.0];

  [(CSLockScreenPasscodeSettings *)self setPlusDColorAlpha:0.2];
}

+ (id)settingsControllerModule
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F94148] rowWithTitle:@"LightenSourceOver White" valueKeyPath:@"lightenSourceOverColorWhite"];
  v3 = [v2 between:0.0 and:1.0];

  v4 = [MEMORY[0x1E4F94148] rowWithTitle:@"LightenSourceOver Alpha" valueKeyPath:@"lightenSourceOverColorAlpha"];
  v5 = [v4 between:0.0 and:1.0];

  v6 = [MEMORY[0x1E4F94148] rowWithTitle:@"plusD White" valueKeyPath:@"plusDColorWhite"];
  v7 = [v6 between:0.0 and:1.0];

  v8 = [MEMORY[0x1E4F94148] rowWithTitle:@"plusD Alpha" valueKeyPath:@"plusDColorAlpha"];
  v9 = [v8 between:0.0 and:1.0];

  v10 = (void *)MEMORY[0x1E4F94160];
  v18[0] = v3;
  v18[1] = v5;
  v18[2] = v7;
  v18[3] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
  v12 = [v10 sectionWithRows:v11];

  v13 = (void *)MEMORY[0x1E4F94160];
  v17 = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v15 = [v13 moduleWithTitle:@"Passcode Settings" contents:v14];

  return v15;
}

- (double)lightenSourceOverColorWhite
{
  return self->_lightenSourceOverColorWhite;
}

- (void)setLightenSourceOverColorWhite:(double)a3
{
  self->_lightenSourceOverColorWhite = a3;
}

- (double)lightenSourceOverColorAlpha
{
  return self->_lightenSourceOverColorAlpha;
}

- (void)setLightenSourceOverColorAlpha:(double)a3
{
  self->_lightenSourceOverColorAlpha = a3;
}

- (double)plusDColorWhite
{
  return self->_plusDColorWhite;
}

- (void)setPlusDColorWhite:(double)a3
{
  self->_plusDColorWhite = a3;
}

- (double)plusDColorAlpha
{
  return self->_plusDColorAlpha;
}

- (void)setPlusDColorAlpha:(double)a3
{
  self->_plusDColorAlpha = a3;
}

@end