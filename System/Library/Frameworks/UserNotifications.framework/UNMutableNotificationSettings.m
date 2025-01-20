@interface UNMutableNotificationSettings
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAlertSetting:(int64_t)a3;
- (void)setAlertStyle:(int64_t)a3;
- (void)setAnnouncementSetting:(int64_t)a3;
- (void)setAuthorizationStatus:(int64_t)a3;
- (void)setBadgeSetting:(int64_t)a3;
- (void)setCarPlaySetting:(int64_t)a3;
- (void)setCriticalAlertSetting:(int64_t)a3;
- (void)setDirectMessagesSetting:(int64_t)a3;
- (void)setGroupingSetting:(int64_t)a3;
- (void)setLockScreenSetting:(int64_t)a3;
- (void)setNotificationCenterSetting:(int64_t)a3;
- (void)setProvidesAppNotificationSettings:(BOOL)a3;
- (void)setRemoteNotificationsSetting:(int64_t)a3;
- (void)setScheduledDeliverySetting:(int64_t)a3;
- (void)setShowPreviewsSetting:(int64_t)a3;
- (void)setSoundSetting:(int64_t)a3;
- (void)setSummarizationSetting:(int64_t)a3;
- (void)setTimeSensitiveSetting:(int64_t)a3;
@end

@implementation UNMutableNotificationSettings

- (void)setAuthorizationStatus:(int64_t)a3
{
  self->super._authorizationStatus = a3;
}

- (void)setSoundSetting:(int64_t)a3
{
  self->super._soundSetting = a3;
}

- (void)setBadgeSetting:(int64_t)a3
{
  self->super._badgeSetting = a3;
}

- (void)setAlertSetting:(int64_t)a3
{
  self->super._alertSetting = a3;
}

- (void)setNotificationCenterSetting:(int64_t)a3
{
  self->super._notificationCenterSetting = a3;
}

- (void)setLockScreenSetting:(int64_t)a3
{
  self->super._lockScreenSetting = a3;
}

- (void)setCarPlaySetting:(int64_t)a3
{
  self->super._carPlaySetting = a3;
}

- (void)setRemoteNotificationsSetting:(int64_t)a3
{
  self->super._remoteNotificationsSetting = a3;
}

- (void)setAlertStyle:(int64_t)a3
{
  self->super._alertStyle = a3;
}

- (void)setShowPreviewsSetting:(int64_t)a3
{
  self->super._showPreviewsSetting = a3;
}

- (void)setCriticalAlertSetting:(int64_t)a3
{
  self->super._criticalAlertSetting = a3;
}

- (void)setProvidesAppNotificationSettings:(BOOL)a3
{
  self->super._providesAppNotificationSettings = a3;
}

- (void)setAnnouncementSetting:(int64_t)a3
{
  self->super._announcementSetting = a3;
}

- (void)setGroupingSetting:(int64_t)a3
{
  self->super._groupingSetting = a3;
}

- (void)setTimeSensitiveSetting:(int64_t)a3
{
  self->super._timeSensitiveSetting = a3;
}

- (void)setScheduledDeliverySetting:(int64_t)a3
{
  self->super._scheduledDeliverySetting = a3;
}

- (void)setDirectMessagesSetting:(int64_t)a3
{
  self->super._directMessagesSetting = a3;
}

- (void)setSummarizationSetting:(int64_t)a3
{
  self->super._summarizationSetting = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[UNNotificationSettings allocWithZone:a3];
  LOBYTE(v6) = self->super._providesAppNotificationSettings;
  return -[UNNotificationSettings initWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:remoteNotificationsSetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:summarizationSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:](v4, "initWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:remoteNotificationsSetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:summarizationSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:", self->super._authorizationStatus, self->super._soundSetting, self->super._badgeSetting, self->super._alertSetting, self->super._notificationCenterSetting, self->super._lockScreenSetting, self->super._carPlaySetting, self->super._remoteNotificationsSetting, self->super._announcementSetting, self->super._criticalAlertSetting, self->super._timeSensitiveSetting, self->super._scheduledDeliverySetting, self->super._directMessagesSetting, self->super._summarizationSetting,
           self->super._alertStyle,
           self->super._showPreviewsSetting,
           self->super._groupingSetting,
           v6);
}

@end