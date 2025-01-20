@interface CSLockScreenTestPluginSettings
+ (id)settingsControllerModule;
- (BOOL)disableOnUnlock;
- (BOOL)enableLostModePlugin;
- (BOOL)enablePlugin;
- (BOOL)hideStatusBar;
- (BOOL)hideSubtitle;
- (BOOL)hideTimeAndDate;
- (BOOL)restrictCamera;
- (BOOL)restrictControlCenter;
- (BOOL)restrictLogout;
- (BOOL)restrictMediaControls;
- (BOOL)restrictSiri;
- (BOOL)restrictTodayCenter;
- (BOOL)restrictTouchID;
- (BOOL)restrictUnlock;
- (NSString)subtitleValue;
- (int64_t)backgroundStyle;
- (int64_t)notificationBehavior;
- (int64_t)presentationStyle;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setDefaultValues;
- (void)setDisableOnUnlock:(BOOL)a3;
- (void)setEnableLostModePlugin:(BOOL)a3;
- (void)setEnablePlugin:(BOOL)a3;
- (void)setHideStatusBar:(BOOL)a3;
- (void)setHideSubtitle:(BOOL)a3;
- (void)setHideTimeAndDate:(BOOL)a3;
- (void)setNotificationBehavior:(int64_t)a3;
- (void)setPresentationStyle:(int64_t)a3;
- (void)setRestrictCamera:(BOOL)a3;
- (void)setRestrictControlCenter:(BOOL)a3;
- (void)setRestrictLogout:(BOOL)a3;
- (void)setRestrictMediaControls:(BOOL)a3;
- (void)setRestrictSiri:(BOOL)a3;
- (void)setRestrictTodayCenter:(BOOL)a3;
- (void)setRestrictTouchID:(BOOL)a3;
- (void)setRestrictUnlock:(BOOL)a3;
- (void)setSubtitleValue:(id)a3;
@end

@implementation CSLockScreenTestPluginSettings

- (void)setDefaultValues
{
  [(CSLockScreenTestPluginSettings *)self setPresentationStyle:2];
  [(CSLockScreenTestPluginSettings *)self setBackgroundStyle:1];
  [(CSLockScreenTestPluginSettings *)self setNotificationBehavior:0];
  [(CSLockScreenTestPluginSettings *)self setEnablePlugin:0];
  [(CSLockScreenTestPluginSettings *)self setEnableLostModePlugin:0];
  [(CSLockScreenTestPluginSettings *)self setRestrictSiri:0];
  [(CSLockScreenTestPluginSettings *)self setRestrictCamera:0];
  [(CSLockScreenTestPluginSettings *)self setRestrictUnlock:0];
  [(CSLockScreenTestPluginSettings *)self setRestrictLogout:0];
  [(CSLockScreenTestPluginSettings *)self setRestrictTouchID:0];
  [(CSLockScreenTestPluginSettings *)self setRestrictMediaControls:0];
  [(CSLockScreenTestPluginSettings *)self setRestrictTodayCenter:0];
  [(CSLockScreenTestPluginSettings *)self setRestrictControlCenter:0];
  [(CSLockScreenTestPluginSettings *)self setHideStatusBar:0];
  [(CSLockScreenTestPluginSettings *)self setHideTimeAndDate:0];
  [(CSLockScreenTestPluginSettings *)self setHideSubtitle:0];
  [(CSLockScreenTestPluginSettings *)self setSubtitleValue:0];

  [(CSLockScreenTestPluginSettings *)self setDisableOnUnlock:1];
}

+ (id)settingsControllerModule
{
  v43[2] = *MEMORY[0x1E4F143B8];
  v37 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Test Plugin" valueKeyPath:@"enablePlugin"];
  v36 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Lost Mode Plugin" valueKeyPath:@"enableLostModePlugin"];
  v2 = (void *)MEMORY[0x1E4F94160];
  v43[0] = v37;
  v43[1] = v36;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
  v35 = [v2 sectionWithRows:v3];

  v4 = [MEMORY[0x1E4F94108] rowWithTitle:@"Background Style" valueKeyPath:@"backgroundStyle"];
  v38 = [v4 possibleValues:&unk_1F306BC20 titles:&unk_1F306BC08];

  v5 = [MEMORY[0x1E4F94108] rowWithTitle:@"Notification Behavior" valueKeyPath:@"notificationBehavior"];
  v34 = [v5 possibleValues:&unk_1F306BC50 titles:&unk_1F306BC38];

  v6 = [MEMORY[0x1E4F94108] rowWithTitle:@"Presentation Style" valueKeyPath:@"presentationStyle"];
  v33 = [v6 possibleValues:&unk_1F306BC80 titles:&unk_1F306BC68];

  v31 = (void *)MEMORY[0x1E4F94160];
  v7 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Restrict Siri" valueKeyPath:@"restrictSiri"];
  v42[0] = v7;
  v8 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Restrict Camera" valueKeyPath:@"restrictCamera"];
  v42[1] = v8;
  v9 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Restrict Unlock" valueKeyPath:@"restrictUnlock"];
  v42[2] = v9;
  v10 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Restrict Logout" valueKeyPath:@"restrictLogout"];
  v42[3] = v10;
  v11 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Restrict TouchID" valueKeyPath:@"restrictTouchID"];
  v42[4] = v11;
  v12 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Restrict Media Controls" valueKeyPath:@"restrictMediaControls"];
  v42[5] = v12;
  v13 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Restrict Today Center" valueKeyPath:@"restrictTodayCenter"];
  v42[6] = v13;
  v14 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Restrict Control Center" valueKeyPath:@"restrictControlCenter"];
  v42[7] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:8];
  v32 = [v31 sectionWithRows:v15];

  v16 = (void *)MEMORY[0x1E4F94160];
  v17 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Hide Status Bar" valueKeyPath:@"hideStatusBar"];
  v41[0] = v17;
  v18 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Hide Time & Date" valueKeyPath:@"hideTimeAndDate"];
  v41[1] = v18;
  v19 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Hide Subtitle" valueKeyPath:@"hideSubtitle"];
  v41[2] = v19;
  v20 = [MEMORY[0x1E4F94158] rowWithTitle:@"Subtitle Value" valueKeyPath:@"subtitleValue"];
  v41[3] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:4];
  v30 = [v16 sectionWithRows:v21];

  v22 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Disable on Unlock" valueKeyPath:@"disableOnUnlock"];
  v23 = (void *)MEMORY[0x1E4F94160];
  v40[0] = v33;
  v40[1] = v38;
  v40[2] = v34;
  v40[3] = v22;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];
  v25 = [v23 sectionWithRows:v24];

  v26 = (void *)MEMORY[0x1E4F94160];
  v39[0] = v35;
  v39[1] = v25;
  v39[2] = v32;
  v39[3] = v30;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
  v28 = [v26 moduleWithTitle:@"Lock Screen Test Plugin" contents:v27];

  return v28;
}

- (BOOL)enablePlugin
{
  return self->_enablePlugin;
}

- (void)setEnablePlugin:(BOOL)a3
{
  self->_enablePlugin = a3;
}

- (BOOL)enableLostModePlugin
{
  return self->_enableLostModePlugin;
}

- (void)setEnableLostModePlugin:(BOOL)a3
{
  self->_enableLostModePlugin = a3;
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
}

- (int64_t)notificationBehavior
{
  return self->_notificationBehavior;
}

- (void)setNotificationBehavior:(int64_t)a3
{
  self->_notificationBehavior = a3;
}

- (BOOL)restrictSiri
{
  return self->_restrictSiri;
}

- (void)setRestrictSiri:(BOOL)a3
{
  self->_restrictSiri = a3;
}

- (BOOL)restrictCamera
{
  return self->_restrictCamera;
}

- (void)setRestrictCamera:(BOOL)a3
{
  self->_restrictCamera = a3;
}

- (BOOL)restrictUnlock
{
  return self->_restrictUnlock;
}

- (void)setRestrictUnlock:(BOOL)a3
{
  self->_restrictUnlock = a3;
}

- (BOOL)restrictLogout
{
  return self->_restrictLogout;
}

- (void)setRestrictLogout:(BOOL)a3
{
  self->_restrictLogout = a3;
}

- (BOOL)restrictTouchID
{
  return self->_restrictTouchID;
}

- (void)setRestrictTouchID:(BOOL)a3
{
  self->_restrictTouchID = a3;
}

- (BOOL)restrictMediaControls
{
  return self->_restrictMediaControls;
}

- (void)setRestrictMediaControls:(BOOL)a3
{
  self->_restrictMediaControls = a3;
}

- (BOOL)restrictTodayCenter
{
  return self->_restrictTodayCenter;
}

- (void)setRestrictTodayCenter:(BOOL)a3
{
  self->_restrictTodayCenter = a3;
}

- (BOOL)restrictControlCenter
{
  return self->_restrictControlCenter;
}

- (void)setRestrictControlCenter:(BOOL)a3
{
  self->_restrictControlCenter = a3;
}

- (BOOL)hideStatusBar
{
  return self->_hideStatusBar;
}

- (void)setHideStatusBar:(BOOL)a3
{
  self->_hideStatusBar = a3;
}

- (BOOL)hideTimeAndDate
{
  return self->_hideTimeAndDate;
}

- (void)setHideTimeAndDate:(BOOL)a3
{
  self->_hideTimeAndDate = a3;
}

- (BOOL)hideSubtitle
{
  return self->_hideSubtitle;
}

- (void)setHideSubtitle:(BOOL)a3
{
  self->_hideSubtitle = a3;
}

- (NSString)subtitleValue
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSubtitleValue:(id)a3
{
}

- (BOOL)disableOnUnlock
{
  return self->_disableOnUnlock;
}

- (void)setDisableOnUnlock:(BOOL)a3
{
  self->_disableOnUnlock = a3;
}

- (void).cxx_destruct
{
}

@end