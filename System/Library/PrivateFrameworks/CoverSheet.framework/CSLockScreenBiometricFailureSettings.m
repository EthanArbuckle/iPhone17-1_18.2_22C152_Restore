@interface CSLockScreenBiometricFailureSettings
+ (id)settingsControllerModule;
- (BOOL)jiggleLock;
- (BOOL)showPasscode;
- (BOOL)vibrate;
- (BOOL)waitUntilButtonUp;
- (void)setDefaultValues;
- (void)setJiggleLock:(BOOL)a3;
- (void)setShowPasscode:(BOOL)a3;
- (void)setVibrate:(BOOL)a3;
- (void)setWaitUntilButtonUp:(BOOL)a3;
@end

@implementation CSLockScreenBiometricFailureSettings

- (void)setDefaultValues
{
  [(CSLockScreenBiometricFailureSettings *)self setJiggleLock:1];
  [(CSLockScreenBiometricFailureSettings *)self setVibrate:1];
  [(CSLockScreenBiometricFailureSettings *)self setShowPasscode:1];

  [(CSLockScreenBiometricFailureSettings *)self setWaitUntilButtonUp:1];
}

+ (id)settingsControllerModule
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Jiggle Lock" valueKeyPath:@"jiggleLock"];
  v13[0] = v2;
  v3 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Vibrate" valueKeyPath:@"vibrate"];
  v13[1] = v3;
  v4 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Passcode" valueKeyPath:@"showPasscode"];
  v13[2] = v4;
  v5 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Wait Until Button Up" valueKeyPath:@"waitUntilButtonUp"];
  v13[3] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];

  v7 = [MEMORY[0x1E4F94160] sectionWithRows:v6];
  v8 = (void *)MEMORY[0x1E4F94160];
  v12 = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  v10 = [v8 moduleWithTitle:@"Failure Settings" contents:v9];

  return v10;
}

- (BOOL)jiggleLock
{
  return *(&self->super.__isObservingChildren + 1);
}

- (void)setJiggleLock:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 1) = a3;
}

- (BOOL)vibrate
{
  return *(&self->super.__isObservingChildren + 2);
}

- (void)setVibrate:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 2) = a3;
}

- (BOOL)showPasscode
{
  return *(&self->super.__isObservingChildren + 3);
}

- (void)setShowPasscode:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 3) = a3;
}

- (BOOL)waitUntilButtonUp
{
  return *(&self->super.__isObservingChildren + 4);
}

- (void)setWaitUntilButtonUp:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 4) = a3;
}

@end