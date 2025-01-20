@interface CSLockScreenIdleTimerSettings
+ (id)settingsControlModule;
- (BOOL)increaseNotificationScrollLogging;
- (double)unlockSlideForIdleTimerDisabledPercentage;
- (double)unlockSlideForIdleTimerDisabledPercentageIPad;
- (void)setDefaultValues;
- (void)setIncreaseNotificationScrollLogging:(BOOL)a3;
- (void)setUnlockSlideForIdleTimerDisabledPercentage:(double)a3;
- (void)setUnlockSlideForIdleTimerDisabledPercentageIPad:(double)a3;
@end

@implementation CSLockScreenIdleTimerSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)CSLockScreenIdleTimerSettings;
  [(PTSettings *)&v3 setDefaultValues];
  self->_increaseNotificationScrollLogging = 1;
  self->_unlockSlideForIdleTimerDisabledPercentage = 0.2;
  self->_unlockSlideForIdleTimerDisabledPercentageIPad = 0.2;
}

+ (id)settingsControlModule
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v21 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Notification Scroll" valueKeyPath:@"increaseNotificationScrollLogging"];
  v2 = (void *)MEMORY[0x1E4F94160];
  v25[0] = v21;
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  v4 = [v2 sectionWithRows:v3 title:@"Increase Logging For"];

  v5 = (void *)MEMORY[0x1E4F94160];
  v6 = [MEMORY[0x1E4F941D8] row];
  v7 = [v6 valueKeyPath:@"unlockSlideForIdleTimerDisabledPercentage"];
  v8 = [v7 minValue:0.0 maxValue:1.0];
  v24 = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v10 = [v5 sectionWithRows:v9 title:@"Unlock Slide Percentage to Disable Idle Timer (iPhone)"];

  v11 = (void *)MEMORY[0x1E4F94160];
  v12 = [MEMORY[0x1E4F941D8] row];
  v13 = [v12 valueKeyPath:@"unlockSlideForIdleTimerDisabledPercentageIPad"];
  v14 = [v13 minValue:0.0 maxValue:1.0];
  v23 = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v16 = [v11 sectionWithRows:v15 title:@"Unlock Slide Percentage to Disable Idle Timer (iPad)"];

  v17 = (void *)MEMORY[0x1E4F94160];
  v22[0] = v4;
  v22[1] = v10;
  v22[2] = v16;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  v19 = [v17 moduleWithTitle:@"Idle Timer Settings" contents:v18];

  return v19;
}

- (BOOL)increaseNotificationScrollLogging
{
  return self->_increaseNotificationScrollLogging;
}

- (void)setIncreaseNotificationScrollLogging:(BOOL)a3
{
  self->_increaseNotificationScrollLogging = a3;
}

- (double)unlockSlideForIdleTimerDisabledPercentage
{
  return self->_unlockSlideForIdleTimerDisabledPercentage;
}

- (void)setUnlockSlideForIdleTimerDisabledPercentage:(double)a3
{
  self->_unlockSlideForIdleTimerDisabledPercentage = a3;
}

- (double)unlockSlideForIdleTimerDisabledPercentageIPad
{
  return self->_unlockSlideForIdleTimerDisabledPercentageIPad;
}

- (void)setUnlockSlideForIdleTimerDisabledPercentageIPad:(double)a3
{
  self->_unlockSlideForIdleTimerDisabledPercentageIPad = a3;
}

@end