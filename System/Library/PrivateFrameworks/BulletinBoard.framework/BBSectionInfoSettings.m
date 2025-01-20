@interface BBSectionInfoSettings
+ (BOOL)supportsSecureCoding;
+ (id)sectionInfoSettingsForManagedBundleID:(id)a3;
- (BBMuteAssertion)muteAssertion;
- (BBSectionInfoSettings)initWithCoder:(id)a3;
- (BBSectionInfoSettings)initWithDefaultsForSectionType:(int64_t)a3;
- (BBSectionInfoSettings)initWithUNCSectionInfoSettings:(id)a3;
- (BOOL)allowsNotifications;
- (BOOL)hasUserConfiguredDirectMessagesSetting;
- (BOOL)hasUserConfiguredTimeSensitiveSetting;
- (BOOL)isAuthorizedTemporarily;
- (BOOL)isBulletinMutedForThreadIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsCustomSettingsLink;
- (BOOL)showsInLockScreen;
- (BOOL)showsInNotificationCenter;
- (BOOL)showsMessagePreview;
- (BOOL)showsOnExternalDevices;
- (NSDate)authorizationExpirationDate;
- (NSDate)lastUserGrantedAuthorizationDate;
- (NSDictionary)stateCapture;
- (id)_alertTypeDescription;
- (id)_announceSettingDescription;
- (id)_authorizationStatusDescription;
- (id)_bulletinGroupingSettingDescription;
- (id)_contentPreviewSettingDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)toUNCSectionInfoSettings;
- (int64_t)announceSetting;
- (int64_t)authorizationStatus;
- (int64_t)bulletinGroupingSetting;
- (int64_t)carPlaySetting;
- (int64_t)contentPreviewSetting;
- (int64_t)criticalAlertSetting;
- (int64_t)directMessagesSetting;
- (int64_t)lockScreenSetting;
- (int64_t)notificationCenterSetting;
- (int64_t)remoteNotificationsSetting;
- (int64_t)scheduledDeliverySetting;
- (int64_t)sectionType;
- (int64_t)spokenNotificationSetting;
- (int64_t)summarizationSetting;
- (int64_t)timeSensitiveSetting;
- (unint64_t)alertType;
- (unint64_t)hash;
- (unint64_t)pushSettings;
- (void)encodeWithCoder:(id)a3;
- (void)muteSectionUntilDate:(id)a3;
- (void)muteThreadIdentifier:(id)a3 untilDate:(id)a4;
- (void)setAlertType:(unint64_t)a3;
- (void)setAllowsNotifications:(BOOL)a3;
- (void)setAnnounceSetting:(int64_t)a3;
- (void)setAuthorizationExpirationDate:(id)a3;
- (void)setAuthorizationStatus:(int64_t)a3;
- (void)setBulletinGroupingSetting:(int64_t)a3;
- (void)setCarPlaySetting:(int64_t)a3;
- (void)setContentPreviewSetting:(int64_t)a3;
- (void)setCriticalAlertSetting:(int64_t)a3;
- (void)setDirectMessagesSetting:(int64_t)a3;
- (void)setLastUserGrantedAuthorizationDate:(id)a3;
- (void)setLockScreenSetting:(int64_t)a3;
- (void)setMuteAssertion:(id)a3;
- (void)setNotificationCenterSetting:(int64_t)a3;
- (void)setPushSettings:(unint64_t)a3;
- (void)setRemoteNotificationsSetting:(int64_t)a3;
- (void)setScheduledDeliverySetting:(int64_t)a3;
- (void)setShowsCustomSettingsLink:(BOOL)a3;
- (void)setShowsInLockScreen:(BOOL)a3;
- (void)setShowsInNotificationCenter:(BOOL)a3;
- (void)setShowsOnExternalDevices:(BOOL)a3;
- (void)setSpokenNotificationSetting:(int64_t)a3;
- (void)setSummarizationSetting:(int64_t)a3;
- (void)setTimeSensitiveSetting:(int64_t)a3;
- (void)setUserConfiguredDirectMessagesSetting:(BOOL)a3;
- (void)setUserConfiguredTimeSensitiveSetting:(BOOL)a3;
- (void)unmuteSection;
- (void)unmuteThreadIdentifier:(id)a3;
@end

@implementation BBSectionInfoSettings

- (unint64_t)pushSettings
{
  return self->_pushSettings;
}

- (BOOL)allowsNotifications
{
  if ([(BBSectionInfoSettings *)self authorizationStatus] == 2
    || [(BBSectionInfoSettings *)self authorizationStatus] == 3)
  {
    return 1;
  }
  return [(BBSectionInfoSettings *)self isAuthorizedTemporarily];
}

- (BBSectionInfoSettings)initWithDefaultsForSectionType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BBSectionInfoSettings;
  v4 = [(BBSectionInfoSettings *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(BBSectionInfoSettings *)v4 setAuthorizationStatus:2];
    [(BBSectionInfoSettings *)v5 setNotificationCenterSetting:2];
    if ((a3 | 2) == 2)
    {
      [(BBSectionInfoSettings *)v5 setLockScreenSetting:2];
      [(BBSectionInfoSettings *)v5 setShowsOnExternalDevices:1];
      [(BBSectionInfoSettings *)v5 setContentPreviewSetting:0];
      [(BBSectionInfoSettings *)v5 setAlertType:1];
      [(BBSectionInfoSettings *)v5 setPushSettings:0];
      [(BBSectionInfoSettings *)v5 setCarPlaySetting:0];
      [(BBSectionInfoSettings *)v5 setRemoteNotificationsSetting:2];
      [(BBSectionInfoSettings *)v5 setCriticalAlertSetting:0];
      [(BBSectionInfoSettings *)v5 setTimeSensitiveSetting:0];
      [(BBSectionInfoSettings *)v5 setUserConfiguredTimeSensitiveSetting:0];
      [(BBSectionInfoSettings *)v5 setScheduledDeliverySetting:1];
      [(BBSectionInfoSettings *)v5 setAnnounceSetting:1];
      [(BBSectionInfoSettings *)v5 setDirectMessagesSetting:0];
      [(BBSectionInfoSettings *)v5 setUserConfiguredDirectMessagesSetting:0];
      [(BBSectionInfoSettings *)v5 setSummarizationSetting:2];
    }
    v5->_sectionType = a3;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAuthorizationStatus:", -[BBSectionInfoSettings authorizationStatus](self, "authorizationStatus"));
  v6 = [(BBSectionInfoSettings *)self authorizationExpirationDate];
  [v5 setAuthorizationExpirationDate:v6];

  objc_super v7 = [(BBSectionInfoSettings *)self lastUserGrantedAuthorizationDate];
  [v5 setLastUserGrantedAuthorizationDate:v7];

  v8 = [(BBSectionInfoSettings *)self muteAssertion];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setMuteAssertion:v9];

  objc_msgSend(v5, "setNotificationCenterSetting:", -[BBSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting"));
  objc_msgSend(v5, "setLockScreenSetting:", -[BBSectionInfoSettings lockScreenSetting](self, "lockScreenSetting"));
  objc_msgSend(v5, "setShowsOnExternalDevices:", -[BBSectionInfoSettings showsOnExternalDevices](self, "showsOnExternalDevices"));
  objc_msgSend(v5, "setShowsCustomSettingsLink:", -[BBSectionInfoSettings showsCustomSettingsLink](self, "showsCustomSettingsLink"));
  objc_msgSend(v5, "setContentPreviewSetting:", -[BBSectionInfoSettings contentPreviewSetting](self, "contentPreviewSetting"));
  objc_msgSend(v5, "setAlertType:", -[BBSectionInfoSettings alertType](self, "alertType"));
  objc_msgSend(v5, "setPushSettings:", -[BBSectionInfoSettings pushSettings](self, "pushSettings"));
  objc_msgSend(v5, "setCarPlaySetting:", -[BBSectionInfoSettings carPlaySetting](self, "carPlaySetting"));
  objc_msgSend(v5, "setRemoteNotificationsSetting:", -[BBSectionInfoSettings remoteNotificationsSetting](self, "remoteNotificationsSetting"));
  objc_msgSend(v5, "setCriticalAlertSetting:", -[BBSectionInfoSettings criticalAlertSetting](self, "criticalAlertSetting"));
  objc_msgSend(v5, "setTimeSensitiveSetting:", -[BBSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting"));
  objc_msgSend(v5, "setUserConfiguredTimeSensitiveSetting:", -[BBSectionInfoSettings hasUserConfiguredTimeSensitiveSetting](self, "hasUserConfiguredTimeSensitiveSetting"));
  objc_msgSend(v5, "setBulletinGroupingSetting:", -[BBSectionInfoSettings bulletinGroupingSetting](self, "bulletinGroupingSetting"));
  objc_msgSend(v5, "setAnnounceSetting:", -[BBSectionInfoSettings announceSetting](self, "announceSetting"));
  objc_msgSend(v5, "setScheduledDeliverySetting:", -[BBSectionInfoSettings scheduledDeliverySetting](self, "scheduledDeliverySetting"));
  objc_msgSend(v5, "setDirectMessagesSetting:", -[BBSectionInfoSettings directMessagesSetting](self, "directMessagesSetting"));
  objc_msgSend(v5, "setUserConfiguredDirectMessagesSetting:", -[BBSectionInfoSettings hasUserConfiguredDirectMessagesSetting](self, "hasUserConfiguredDirectMessagesSetting"));
  objc_msgSend(v5, "setSummarizationSetting:", -[BBSectionInfoSettings summarizationSetting](self, "summarizationSetting"));
  return v5;
}

- (int64_t)authorizationStatus
{
  return self->_authorizationStatus;
}

- (void)setScheduledDeliverySetting:(int64_t)a3
{
  self->_scheduledDeliverySetting = a3;
}

- (void)setCarPlaySetting:(int64_t)a3
{
  self->_carPlaySetting = a3;
}

- (void)setAnnounceSetting:(int64_t)a3
{
  self->_announceSetting = a3;
}

- (void)setSummarizationSetting:(int64_t)a3
{
  self->_summarizationSetting = a3;
}

- (void)setContentPreviewSetting:(int64_t)a3
{
  self->_contentPreviewSetting = a3;
}

- (void)setPushSettings:(unint64_t)a3
{
  self->_pushSettings = a3;
}

- (int64_t)notificationCenterSetting
{
  return self->_notificationCenterSetting;
}

- (int64_t)lockScreenSetting
{
  return self->_lockScreenSetting;
}

- (int64_t)contentPreviewSetting
{
  return self->_contentPreviewSetting;
}

- (void)setTimeSensitiveSetting:(int64_t)a3
{
  self->_timeSensitiveSetting = a3;
}

- (void)setRemoteNotificationsSetting:(int64_t)a3
{
  self->_remoteNotificationsSetting = a3;
}

- (void)setShowsOnExternalDevices:(BOOL)a3
{
  self->_showsOnExternalDevices = a3;
}

- (void)setNotificationCenterSetting:(int64_t)a3
{
  self->_notificationCenterSetting = a3;
}

- (void)setLockScreenSetting:(int64_t)a3
{
  self->_lockScreenSetting = a3;
}

- (void)setDirectMessagesSetting:(int64_t)a3
{
  self->_directMessagesSetting = a3;
}

- (void)setAlertType:(unint64_t)a3
{
  self->_alertType = a3;
}

- (void)setCriticalAlertSetting:(int64_t)a3
{
  self->_criticalAlertSetting = a3;
}

- (int64_t)timeSensitiveSetting
{
  return self->_timeSensitiveSetting;
}

- (int64_t)remoteNotificationsSetting
{
  return self->_remoteNotificationsSetting;
}

- (int64_t)carPlaySetting
{
  return self->_carPlaySetting;
}

- (int64_t)summarizationSetting
{
  return self->_summarizationSetting;
}

- (int64_t)scheduledDeliverySetting
{
  return self->_scheduledDeliverySetting;
}

- (int64_t)directMessagesSetting
{
  return self->_directMessagesSetting;
}

- (void)setUserConfiguredTimeSensitiveSetting:(BOOL)a3
{
  self->_userConfiguredTimeSensitiveSetting = a3;
}

- (void)setUserConfiguredDirectMessagesSetting:(BOOL)a3
{
  self->_userConfiguredDirectMessagesSetting = a3;
}

- (void)setAuthorizationStatus:(int64_t)a3
{
  self->_authorizationStatus = a3;
}

- (int64_t)criticalAlertSetting
{
  return self->_criticalAlertSetting;
}

- (int64_t)announceSetting
{
  return self->_announceSetting;
}

- (unint64_t)alertType
{
  return self->_alertType;
}

- (NSDate)authorizationExpirationDate
{
  return self->_authorizationExpirationDate;
}

- (BOOL)showsCustomSettingsLink
{
  return self->_showsCustomSettingsLink;
}

- (int64_t)bulletinGroupingSetting
{
  return self->_bulletinGroupingSetting;
}

- (BOOL)showsOnExternalDevices
{
  return self->_showsOnExternalDevices;
}

- (BBMuteAssertion)muteAssertion
{
  return self->_muteAssertion;
}

- (NSDate)lastUserGrantedAuthorizationDate
{
  return self->_lastUserGrantedAuthorizationDate;
}

- (BOOL)hasUserConfiguredTimeSensitiveSetting
{
  return self->_userConfiguredTimeSensitiveSetting;
}

- (BOOL)hasUserConfiguredDirectMessagesSetting
{
  return self->_userConfiguredDirectMessagesSetting;
}

- (void)setShowsCustomSettingsLink:(BOOL)a3
{
  self->_showsCustomSettingsLink = a3;
}

- (void)setMuteAssertion:(id)a3
{
}

- (void)setLastUserGrantedAuthorizationDate:(id)a3
{
}

- (void)setBulletinGroupingSetting:(int64_t)a3
{
  self->_bulletinGroupingSetting = a3;
}

- (void)setAuthorizationExpirationDate:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings authorizationStatus](self, "authorizationStatus"), @"authorizationStatus");
  v4 = [(BBSectionInfoSettings *)self authorizationExpirationDate];
  [v7 encodeObject:v4 forKey:@"authorizationExpirationDate"];

  v5 = [(BBSectionInfoSettings *)self lastUserGrantedAuthorizationDate];
  [v7 encodeObject:v5 forKey:@"lastUserGrantedAuthorizationDate"];

  v6 = [(BBSectionInfoSettings *)self muteAssertion];
  [v7 encodeObject:v6 forKey:@"muteAssertion"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting"), @"notificationCenterSetting");
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings lockScreenSetting](self, "lockScreenSetting"), @"lockScreenSetting");
  objc_msgSend(v7, "encodeBool:forKey:", -[BBSectionInfoSettings showsOnExternalDevices](self, "showsOnExternalDevices"), @"showsOnExternalDevices");
  objc_msgSend(v7, "encodeBool:forKey:", -[BBSectionInfoSettings showsCustomSettingsLink](self, "showsCustomSettingsLink"), @"showsCustomSettingsLink");
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings contentPreviewSetting](self, "contentPreviewSetting"), @"contentPreviewSetting");
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings alertType](self, "alertType"), @"alertType");
  objc_msgSend(v7, "encodeInt32:forKey:", -[BBSectionInfoSettings pushSettings](self, "pushSettings"), @"pushSettings");
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings carPlaySetting](self, "carPlaySetting"), @"carPlaySetting");
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings remoteNotificationsSetting](self, "remoteNotificationsSetting"), @"remoteNotificationsSetting");
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings criticalAlertSetting](self, "criticalAlertSetting"), @"criticalAlertSetting");
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting"), @"timeSensitiveSetting");
  objc_msgSend(v7, "encodeBool:forKey:", -[BBSectionInfoSettings hasUserConfiguredTimeSensitiveSetting](self, "hasUserConfiguredTimeSensitiveSetting"), @"userConfiguredTimeSensitiveSetting");
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings bulletinGroupingSetting](self, "bulletinGroupingSetting"), @"bulletinGroupingSetting");
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings announceSetting](self, "announceSetting"), @"announceSetting");
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings scheduledDeliverySetting](self, "scheduledDeliverySetting"), @"scheduledDeliverySetting");
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings directMessagesSetting](self, "directMessagesSetting"), @"directMessagesSettingKey");
  objc_msgSend(v7, "encodeBool:forKey:", -[BBSectionInfoSettings hasUserConfiguredDirectMessagesSetting](self, "hasUserConfiguredDirectMessagesSetting"), @"userConfiguredDirectMessagesSetting");
  objc_msgSend(v7, "encodeInteger:forKey:", -[BBSectionInfoSettings summarizationSetting](self, "summarizationSetting"), @"summarizationSetting");
  objc_msgSend(v7, "encodeBool:forKey:", -[BBSectionInfoSettings showsInLockScreen](self, "showsInLockScreen"), @"showsInLockScreen");
  objc_msgSend(v7, "encodeBool:forKey:", -[BBSectionInfoSettings showsInNotificationCenter](self, "showsInNotificationCenter"), @"showsInNotificationCenter");
}

- (BOOL)showsInNotificationCenter
{
  return [(BBSectionInfoSettings *)self notificationCenterSetting] == 2;
}

- (BOOL)showsInLockScreen
{
  return [(BBSectionInfoSettings *)self lockScreenSetting] == 2;
}

- (BBSectionInfoSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BBSectionInfoSettings;
  v5 = [(BBSectionInfoSettings *)&v21 init];
  if (v5)
  {
    -[BBSectionInfoSettings setAuthorizationStatus:](v5, "setAuthorizationStatus:", [v4 decodeIntegerForKey:@"authorizationStatus"]);
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorizationExpirationDate"];
    [(BBSectionInfoSettings *)v5 setAuthorizationExpirationDate:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUserGrantedAuthorizationDate"];
    [(BBSectionInfoSettings *)v5 setLastUserGrantedAuthorizationDate:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"muteAssertion"];
    [(BBSectionInfoSettings *)v5 setMuteAssertion:v8];

    -[BBSectionInfoSettings setNotificationCenterSetting:](v5, "setNotificationCenterSetting:", [v4 decodeIntegerForKey:@"notificationCenterSetting"]);
    -[BBSectionInfoSettings setLockScreenSetting:](v5, "setLockScreenSetting:", [v4 decodeIntegerForKey:@"lockScreenSetting"]);
    -[BBSectionInfoSettings setShowsOnExternalDevices:](v5, "setShowsOnExternalDevices:", [v4 decodeBoolForKey:@"showsOnExternalDevices"]);
    -[BBSectionInfoSettings setShowsCustomSettingsLink:](v5, "setShowsCustomSettingsLink:", [v4 decodeBoolForKey:@"showsCustomSettingsLink"]);
    -[BBSectionInfoSettings setContentPreviewSetting:](v5, "setContentPreviewSetting:", [v4 decodeIntegerForKey:@"contentPreviewSetting"]);
    -[BBSectionInfoSettings setAlertType:](v5, "setAlertType:", [v4 decodeIntegerForKey:@"alertType"]);
    -[BBSectionInfoSettings setPushSettings:](v5, "setPushSettings:", (int)[v4 decodeInt32ForKey:@"pushSettings"]);
    -[BBSectionInfoSettings setCarPlaySetting:](v5, "setCarPlaySetting:", [v4 decodeIntegerForKey:@"carPlaySetting"]);
    -[BBSectionInfoSettings setRemoteNotificationsSetting:](v5, "setRemoteNotificationsSetting:", [v4 decodeIntegerForKey:@"remoteNotificationsSetting"]);
    -[BBSectionInfoSettings setCriticalAlertSetting:](v5, "setCriticalAlertSetting:", [v4 decodeIntegerForKey:@"criticalAlertSetting"]);
    -[BBSectionInfoSettings setTimeSensitiveSetting:](v5, "setTimeSensitiveSetting:", [v4 decodeIntegerForKey:@"timeSensitiveSetting"]);
    -[BBSectionInfoSettings setUserConfiguredTimeSensitiveSetting:](v5, "setUserConfiguredTimeSensitiveSetting:", [v4 decodeBoolForKey:@"userConfiguredTimeSensitiveSetting"]);
    -[BBSectionInfoSettings setBulletinGroupingSetting:](v5, "setBulletinGroupingSetting:", [v4 decodeIntegerForKey:@"bulletinGroupingSetting"]);
    if ([v4 containsValueForKey:@"summarizationSetting"])
    {
      uint64_t v9 = [v4 decodeIntegerForKey:@"summarizationSetting"];
      if (v9) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 2;
      }
    }
    else
    {
      uint64_t v10 = 2;
    }
    [(BBSectionInfoSettings *)v5 setSummarizationSetting:v10];
    if ([v4 containsValueForKey:@"announceSetting"]) {
      unint64_t v11 = [v4 decodeIntegerForKey:@"announceSetting"];
    }
    else {
      unint64_t v11 = 1;
    }
    if (v11 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v11;
    }
    [(BBSectionInfoSettings *)v5 setAnnounceSetting:v12];
    if ([v4 containsValueForKey:@"scheduledDeliverySetting"]) {
      unint64_t v13 = [v4 decodeIntegerForKey:@"scheduledDeliverySetting"];
    }
    else {
      unint64_t v13 = 1;
    }
    if (v13 <= 1) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = v13;
    }
    [(BBSectionInfoSettings *)v5 setScheduledDeliverySetting:v14];
    if ([v4 containsValueForKey:@"directMessagesSettingKey"]) {
      uint64_t v15 = [v4 decodeIntegerForKey:@"directMessagesSettingKey"];
    }
    else {
      uint64_t v15 = 0;
    }
    [(BBSectionInfoSettings *)v5 setDirectMessagesSetting:v15];
    -[BBSectionInfoSettings setUserConfiguredDirectMessagesSetting:](v5, "setUserConfiguredDirectMessagesSetting:", [v4 decodeBoolForKey:@"userConfiguredDirectMessagesSetting"]);
    if ([v4 containsValueForKey:@"allowsNotifications"]) {
      -[BBSectionInfoSettings setAllowsNotifications:](v5, "setAllowsNotifications:", [v4 decodeBoolForKey:@"allowsNotifications"]);
    }
    if ([v4 containsValueForKey:@"showsMessagePreview"]) {
      -[BBSectionInfoSettings setShowsMessagePreview:](v5, "setShowsMessagePreview:", [v4 decodeBoolForKey:@"showsMessagePreview"]);
    }
    if (([v4 containsValueForKey:@"notificationCenterSetting"] & 1) == 0
      && [v4 containsValueForKey:@"showsInNotificationCenter"])
    {
      -[BBSectionInfoSettings setShowsInNotificationCenter:](v5, "setShowsInNotificationCenter:", [v4 decodeBoolForKey:@"showsInNotificationCenter"]);
    }
    if (([v4 containsValueForKey:@"lockScreenSetting"] & 1) == 0
      && [v4 containsValueForKey:@"showsInLockScreen"])
    {
      -[BBSectionInfoSettings setShowsInLockScreen:](v5, "setShowsInLockScreen:", [v4 decodeBoolForKey:@"showsInLockScreen"]);
    }
    if (([v4 containsValueForKey:@"announceSetting"] & 1) == 0
      && [v4 containsValueForKey:@"spokenNotificationSetting"])
    {
      uint64_t v16 = [v4 decodeIntegerForKey:@"spokenNotificationSetting"];
      if (v16)
      {
        if (v16 != 2)
        {
          uint64_t v17 = v16 == 1;
LABEL_42:
          [(BBSectionInfoSettings *)v5 setAnnounceSetting:v17];
          goto LABEL_43;
        }
        BOOL v18 = [(BBSectionInfoSettings *)v5 timeSensitiveSetting] == 0;
        uint64_t v19 = 2;
      }
      else
      {
        BOOL v18 = [(BBSectionInfoSettings *)v5 timeSensitiveSetting] == 2;
        uint64_t v19 = 1;
      }
      if (v18) {
        uint64_t v17 = v19 + 1;
      }
      else {
        uint64_t v17 = v19;
      }
      goto LABEL_42;
    }
  }
LABEL_43:

  return v5;
}

- (BOOL)isAuthorizedTemporarily
{
  v3 = [(BBSectionInfoSettings *)self authorizationExpirationDate];
  if (v3)
  {
    id v4 = [(BBSectionInfoSettings *)self authorizationExpirationDate];
    [v4 timeIntervalSinceNow];
    BOOL v6 = v5 > 0.0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BBSectionInfoSettings *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      double v5 = v4;
      int64_t v6 = [(BBSectionInfoSettings *)self authorizationStatus];
      if (v6 == [(BBSectionInfoSettings *)v5 authorizationStatus])
      {
        id v7 = [(BBSectionInfoSettings *)self authorizationExpirationDate];
        v8 = [(BBSectionInfoSettings *)v5 authorizationExpirationDate];
        if (v7 == v8)
        {
          uint64_t v10 = [(BBSectionInfoSettings *)self lastUserGrantedAuthorizationDate];
          unint64_t v11 = [(BBSectionInfoSettings *)v5 lastUserGrantedAuthorizationDate];
          if (v10 == v11)
          {
            uint64_t v12 = [(BBSectionInfoSettings *)self muteAssertion];
            unint64_t v13 = [(BBSectionInfoSettings *)v5 muteAssertion];
            if (!BSEqualObjects()) {
              goto LABEL_30;
            }
            int64_t v14 = [(BBSectionInfoSettings *)self notificationCenterSetting];
            if (v14 != [(BBSectionInfoSettings *)v5 notificationCenterSetting]) {
              goto LABEL_30;
            }
            int64_t v15 = [(BBSectionInfoSettings *)self lockScreenSetting];
            if (v15 != [(BBSectionInfoSettings *)v5 lockScreenSetting]) {
              goto LABEL_30;
            }
            BOOL v16 = [(BBSectionInfoSettings *)self showsOnExternalDevices];
            if (v16 != [(BBSectionInfoSettings *)v5 showsOnExternalDevices]) {
              goto LABEL_30;
            }
            BOOL v17 = [(BBSectionInfoSettings *)self showsCustomSettingsLink];
            if (v17 != [(BBSectionInfoSettings *)v5 showsCustomSettingsLink]) {
              goto LABEL_30;
            }
            int64_t v18 = [(BBSectionInfoSettings *)self contentPreviewSetting];
            if (v18 != [(BBSectionInfoSettings *)v5 contentPreviewSetting]) {
              goto LABEL_30;
            }
            unint64_t v19 = [(BBSectionInfoSettings *)self alertType];
            if (v19 != [(BBSectionInfoSettings *)v5 alertType]) {
              goto LABEL_30;
            }
            unint64_t v20 = [(BBSectionInfoSettings *)self pushSettings];
            if (v20 != [(BBSectionInfoSettings *)v5 pushSettings]) {
              goto LABEL_30;
            }
            int64_t v21 = [(BBSectionInfoSettings *)self carPlaySetting];
            if (v21 != [(BBSectionInfoSettings *)v5 carPlaySetting]) {
              goto LABEL_30;
            }
            int64_t v22 = [(BBSectionInfoSettings *)self remoteNotificationsSetting];
            if (v22 != [(BBSectionInfoSettings *)v5 remoteNotificationsSetting]) {
              goto LABEL_30;
            }
            int64_t v23 = [(BBSectionInfoSettings *)self criticalAlertSetting];
            if (v23 != [(BBSectionInfoSettings *)v5 criticalAlertSetting]) {
              goto LABEL_30;
            }
            int64_t v24 = [(BBSectionInfoSettings *)self timeSensitiveSetting];
            if (v24 == [(BBSectionInfoSettings *)v5 timeSensitiveSetting]
              && (BOOL v25 = [(BBSectionInfoSettings *)self hasUserConfiguredTimeSensitiveSetting], v25 == [(BBSectionInfoSettings *)v5 hasUserConfiguredTimeSensitiveSetting])&& (v26 = [(BBSectionInfoSettings *)self bulletinGroupingSetting], v26 == [(BBSectionInfoSettings *)v5 bulletinGroupingSetting])&& (v27 = [(BBSectionInfoSettings *)self announceSetting], v27 == [(BBSectionInfoSettings *)v5 announceSetting])&& (v28 = [(BBSectionInfoSettings *)self scheduledDeliverySetting], v28 == [(BBSectionInfoSettings *)v5 scheduledDeliverySetting])&& (v29 = [(BBSectionInfoSettings *)self directMessagesSetting], v29 == [(BBSectionInfoSettings *)v5 directMessagesSetting])&& (v30 = [(BBSectionInfoSettings *)self hasUserConfiguredDirectMessagesSetting], v30 == [(BBSectionInfoSettings *)v5 hasUserConfiguredDirectMessagesSetting]))
            {
              int64_t v32 = [(BBSectionInfoSettings *)self summarizationSetting];
              BOOL v9 = v32 == [(BBSectionInfoSettings *)v5 summarizationSetting];
            }
            else
            {
LABEL_30:
              BOOL v9 = 0;
            }
          }
          else
          {
            BOOL v9 = 0;
          }
        }
        else
        {
          BOOL v9 = 0;
        }
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_muteAssertion, 0);
  objc_storeStrong((id *)&self->_lastUserGrantedAuthorizationDate, 0);
  objc_storeStrong((id *)&self->_authorizationExpirationDate, 0);
}

+ (id)sectionInfoSettingsForManagedBundleID:(id)a3
{
  v3 = (void *)MEMORY[0x263F53C50];
  id v4 = a3;
  double v5 = [v3 sharedConnection];
  int64_t v6 = [v5 restrictionEnforcedNotificationSettingsForBundleID:v4];

  if (v6)
  {
    id v7 = objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x263F53E10]);
    v55 = v7;
    if (v7)
    {
      int v8 = [v7 BOOLValue];
      uint64_t v9 = 1;
      if (v8) {
        uint64_t v9 = 2;
      }
    }
    else
    {
      uint64_t v9 = 2;
    }
    uint64_t v51 = v9;
    unint64_t v11 = objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x263F53E30]);
    v54 = v11;
    if (v11)
    {
      int v12 = [v11 BOOLValue];
      uint64_t v13 = 1;
      if (v12) {
        uint64_t v13 = 2;
      }
    }
    else
    {
      uint64_t v13 = 2;
    }
    uint64_t v50 = v13;
    int64_t v14 = objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x263F53E28]);
    v53 = v14;
    if (v14)
    {
      int v15 = [v14 BOOLValue];
      uint64_t v16 = 1;
      if (v15) {
        uint64_t v16 = 2;
      }
    }
    else
    {
      uint64_t v16 = 2;
    }
    uint64_t v48 = v16;
    BOOL v17 = objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x263F53E20]);
    v52 = v17;
    if (v17)
    {
      int v18 = [v17 BOOLValue];
      uint64_t v19 = 1;
      if (v18) {
        uint64_t v19 = 2;
      }
    }
    else
    {
      uint64_t v19 = 2;
    }
    uint64_t v47 = v19;
    unint64_t v20 = objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x263F53E00]);
    v49 = v20;
    if (v20)
    {
      int v21 = [v20 BOOLValue];
      uint64_t v22 = 1;
      if (v21) {
        uint64_t v22 = 2;
      }
    }
    else
    {
      uint64_t v22 = 2;
    }
    uint64_t v46 = v22;
    int64_t v23 = objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x263F53DE8]);
    int64_t v24 = v23;
    if (v23)
    {
      int v25 = [v23 unsignedIntegerValue];
      uint64_t v26 = 1;
      if (v25 == 2) {
        uint64_t v26 = 2;
      }
      if (v25) {
        uint64_t v27 = v26;
      }
      else {
        uint64_t v27 = 0;
      }
    }
    else
    {
      uint64_t v27 = 1;
    }
    int64_t v28 = objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x263F53E08]);
    int64_t v29 = v28;
    if (v28)
    {
      int v30 = [v28 unsignedIntegerValue];
      uint64_t v31 = v30 == 1;
      if (v30 == 2) {
        uint64_t v31 = 2;
      }
      uint64_t v45 = v31;
    }
    else
    {
      uint64_t v45 = 0;
    }
    int64_t v32 = objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x263F53DF0]);
    v33 = v32;
    if (v32) {
      int v34 = [v32 BOOLValue];
    }
    else {
      int v34 = 1;
    }
    v35 = objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x263F53E38]);
    v36 = v35;
    if (v35) {
      int v37 = [v35 BOOLValue];
    }
    else {
      int v37 = 1;
    }
    v38 = objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x263F53E18]);
    v39 = v38;
    if (v38)
    {
      unsigned int v40 = [v38 unsignedIntegerValue];
      if (v40 <= 2) {
        uint64_t v41 = v40 + 1;
      }
      else {
        uint64_t v41 = 0;
      }
    }
    else
    {
      uint64_t v41 = 0;
    }
    uint64_t v42 = 7;
    if (v27 == 2) {
      uint64_t v42 = 39;
    }
    if (v34) {
      v42 |= 8uLL;
    }
    if (v37) {
      uint64_t v43 = v42 | 0x10;
    }
    else {
      uint64_t v43 = v42;
    }
    uint64_t v10 = [[BBSectionInfoSettings alloc] initWithDefaultsForSectionType:0];
    [(BBSectionInfoSettings *)v10 setAuthorizationStatus:v51];
    [(BBSectionInfoSettings *)v10 setNotificationCenterSetting:v50];
    [(BBSectionInfoSettings *)v10 setLockScreenSetting:v48];
    [(BBSectionInfoSettings *)v10 setCarPlaySetting:v47];
    [(BBSectionInfoSettings *)v10 setCriticalAlertSetting:v46];
    [(BBSectionInfoSettings *)v10 setTimeSensitiveSetting:2];
    [(BBSectionInfoSettings *)v10 setAlertType:v27];
    [(BBSectionInfoSettings *)v10 setBulletinGroupingSetting:v45];
    [(BBSectionInfoSettings *)v10 setContentPreviewSetting:v41];
    [(BBSectionInfoSettings *)v10 setPushSettings:v43];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)muteSectionUntilDate:(id)a3
{
  id v4 = +[BBSectionMuteAssertion sectionMuteAssertionUntilDate:a3];
  [(BBSectionInfoSettings *)self setMuteAssertion:v4];
}

- (void)unmuteSection
{
}

- (void)muteThreadIdentifier:(id)a3 untilDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BBSectionInfoSettings *)self muteAssertion];
  if (v8
    && (uint64_t v9 = (void *)v8,
        [(BBSectionInfoSettings *)self muteAssertion],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v10,
        v9,
        (isKindOfClass & 1) == 0))
  {
    uint64_t v16 = BBLogGeneral;
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR)) {
      -[BBSectionInfoSettings muteThreadIdentifier:untilDate:]((uint64_t)v6, v16);
    }
  }
  else if (v6 && [v6 length])
  {
    int v12 = [(BBSectionInfoSettings *)self muteAssertion];

    if (!v12)
    {
      uint64_t v13 = +[BBThreadsMuteAssertion threadsMuteAssertion];
      [(BBSectionInfoSettings *)self setMuteAssertion:v13];
    }
    int64_t v14 = [(BBSectionInfoSettings *)self muteAssertion];
    [v14 setMutedUntilDate:v7 forThreadIdentifier:v6];
  }
  else
  {
    int v15 = BBLogGeneral;
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR)) {
      -[BBSectionInfoSettings muteThreadIdentifier:untilDate:](v15);
    }
  }
}

- (void)unmuteThreadIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BBSectionInfoSettings *)self muteAssertion];
  if (v5
    && (id v6 = (void *)v5,
        [(BBSectionInfoSettings *)self muteAssertion],
        id v7 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        v6,
        (isKindOfClass & 1) == 0))
  {
    unint64_t v11 = BBLogGeneral;
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR)) {
      -[BBSectionInfoSettings unmuteThreadIdentifier:]((uint64_t)v4, v11);
    }
  }
  else if (v4 && [v4 length])
  {
    uint64_t v9 = [(BBSectionInfoSettings *)self muteAssertion];
    [v9 setUnmutedForThreadIdentifier:v4];
  }
  else
  {
    uint64_t v10 = BBLogGeneral;
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR)) {
      -[BBSectionInfoSettings unmuteThreadIdentifier:](v10);
    }
  }
}

- (BOOL)isBulletinMutedForThreadIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BBSectionInfoSettings *)self muteAssertion];
  id v6 = [MEMORY[0x263EFF910] now];
  char v7 = [v5 isActiveForThreadIdentifier:v4 currentDate:v6];

  return v7;
}

- (NSDictionary)stateCapture
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(BBSectionInfoSettings *)self _authorizationStatusDescription];
  [v3 setValue:v4 forKey:@"Authorized"];

  uint64_t v5 = [(BBSectionInfoSettings *)self authorizationExpirationDate];
  id v6 = [v5 description];
  [v3 setValue:v6 forKey:@"Authorization Expiration Date"];

  char v7 = [(BBSectionInfoSettings *)self lastUserGrantedAuthorizationDate];
  uint64_t v8 = [v7 description];
  [v3 setValue:v8 forKey:@"Last User Granted Authorizated"];

  uint64_t v9 = [(BBSectionInfoSettings *)self muteAssertion];
  uint64_t v10 = [v9 description];
  [v3 setValue:v10 forKey:@"Mute Configuration"];

  if ([(BBSectionInfoSettings *)self notificationCenterSetting])
  {
    unint64_t v11 = BBStringFromBool([(BBSectionInfoSettings *)self notificationCenterSetting] == 2);
    [v3 setValue:v11 forKey:@"NotificationCenter"];
  }
  if ([(BBSectionInfoSettings *)self lockScreenSetting])
  {
    int v12 = BBStringFromBool([(BBSectionInfoSettings *)self lockScreenSetting] == 2);
    [v3 setValue:v12 forKey:@"LockScreen"];
  }
  if ([(BBSectionInfoSettings *)self carPlaySetting])
  {
    uint64_t v13 = BBStringFromBool([(BBSectionInfoSettings *)self carPlaySetting] == 2);
    [v3 setValue:v13 forKey:@"CarPlay"];
  }
  if ([(BBSectionInfoSettings *)self remoteNotificationsSetting])
  {
    int64_t v14 = BBStringFromBool([(BBSectionInfoSettings *)self remoteNotificationsSetting] == 2);
    [v3 setValue:v14 forKey:@"RemoteNotifications"];
  }
  if ([(BBSectionInfoSettings *)self criticalAlertSetting])
  {
    int v15 = BBStringFromBool([(BBSectionInfoSettings *)self criticalAlertSetting] == 2);
    [v3 setValue:v15 forKey:@"CriticalAlerts"];
  }
  if ([(BBSectionInfoSettings *)self timeSensitiveSetting])
  {
    uint64_t v16 = BBStringFromBool([(BBSectionInfoSettings *)self timeSensitiveSetting] == 2);
    [v3 setValue:v16 forKey:@"TimeSensitive"];

    BOOL v17 = BBStringFromBool([(BBSectionInfoSettings *)self hasUserConfiguredTimeSensitiveSetting]);
    [v3 setValue:v17 forKey:@"UserConfiguredTimeSensitive"];
  }
  if ([(BBSectionInfoSettings *)self announceSetting])
  {
    int v18 = [(BBSectionInfoSettings *)self _announceSettingDescription];
    [v3 setValue:v18 forKey:@"AnnounceNotifications"];
  }
  if ([(BBSectionInfoSettings *)self scheduledDeliverySetting])
  {
    uint64_t v19 = BBStringFromBool([(BBSectionInfoSettings *)self scheduledDeliverySetting] == 2);
    [v3 setValue:v19 forKey:@"ScheduledDelivery"];
  }
  if ([(BBSectionInfoSettings *)self directMessagesSetting])
  {
    unint64_t v20 = BBStringFromBool([(BBSectionInfoSettings *)self directMessagesSetting] == 2);
    [v3 setValue:v20 forKey:@"DirectMessages"];

    int v21 = BBStringFromBool([(BBSectionInfoSettings *)self hasUserConfiguredDirectMessagesSetting]);
    [v3 setValue:v21 forKey:@"UserConfiguredDirectMessages"];
  }
  if ([(BBSectionInfoSettings *)self summarizationSetting])
  {
    uint64_t v22 = BBStringFromBool([(BBSectionInfoSettings *)self summarizationSetting] == 2);
    [v3 setValue:v22 forKey:@"Summarization"];
  }
  int64_t v23 = BBStringFromBool([(BBSectionInfoSettings *)self showsOnExternalDevices]);
  [v3 setValue:v23 forKey:@"ShowsOnExternalDevices"];

  int64_t v24 = BBStringFromBool([(BBSectionInfoSettings *)self showsCustomSettingsLink]);
  [v3 setValue:v24 forKey:@"CustomSettingsLink"];

  int v25 = [(BBSectionInfoSettings *)self _contentPreviewSettingDescription];
  [v3 setValue:v25 forKey:@"ContentPreviewSetting"];

  uint64_t v26 = [(BBSectionInfoSettings *)self _alertTypeDescription];
  [v3 setValue:v26 forKey:@"AlertType"];

  uint64_t v27 = BBStringFromBool([(BBSectionInfoSettings *)self pushSettings] & 1);
  [v3 setValue:v27 forKey:@"PushSettingsBadgeSupported"];

  int64_t v28 = BBStringFromBool(([(BBSectionInfoSettings *)self pushSettings] >> 3) & 1);
  [v3 setValue:v28 forKey:@"PushSettingsBadgeEnabled"];

  int64_t v29 = BBStringFromBool(([(BBSectionInfoSettings *)self pushSettings] >> 1) & 1);
  [v3 setValue:v29 forKey:@"PushSettingsSoundSupported"];

  int v30 = BBStringFromBool(([(BBSectionInfoSettings *)self pushSettings] >> 4) & 1);
  [v3 setValue:v30 forKey:@"PushSettingsSoundEnabled"];

  uint64_t v31 = BBStringFromBool(([(BBSectionInfoSettings *)self pushSettings] >> 2) & 1);
  [v3 setValue:v31 forKey:@"PushSettingsAlertSupported"];

  int64_t v32 = BBStringFromBool(([(BBSectionInfoSettings *)self pushSettings] >> 5) & 1);
  [v3 setValue:v32 forKey:@"PushSettingsAlertEnabled"];

  v33 = [(BBSectionInfoSettings *)self _bulletinGroupingSettingDescription];
  [v3 setValue:v33 forKey:@"GroupingSetting"];

  return (NSDictionary *)v3;
}

- (id)description
{
  id v3 = [(BBSectionInfoSettings *)self _authorizationStatusDescription];
  id v4 = [@" Section settings" stringByAppendingFormat:@": authorized = %@", v3];

  uint64_t v5 = [(BBSectionInfoSettings *)self authorizationExpirationDate];
  id v6 = [v4 stringByAppendingFormat:@", authorization expiration date = %@", v5];

  char v7 = [(BBSectionInfoSettings *)self lastUserGrantedAuthorizationDate];
  uint64_t v8 = [v6 stringByAppendingFormat:@", last user granted authorization date = %@", v7];

  uint64_t v9 = [(BBSectionInfoSettings *)self muteAssertion];
  uint64_t v10 = [v8 stringByAppendingFormat:@", mute configuration = %@", v9];

  if ([(BBSectionInfoSettings *)self notificationCenterSetting])
  {
    if ([(BBSectionInfoSettings *)self notificationCenterSetting] == 2) {
      unint64_t v11 = @"YES";
    }
    else {
      unint64_t v11 = @"NO";
    }
    uint64_t v12 = [v10 stringByAppendingFormat:@", notification center = %@", v11];

    uint64_t v10 = (void *)v12;
  }
  if ([(BBSectionInfoSettings *)self lockScreenSetting])
  {
    if ([(BBSectionInfoSettings *)self lockScreenSetting] == 2) {
      uint64_t v13 = @"YES";
    }
    else {
      uint64_t v13 = @"NO";
    }
    uint64_t v14 = [v10 stringByAppendingFormat:@", lock screen = %@", v13];

    uint64_t v10 = (void *)v14;
  }
  if ([(BBSectionInfoSettings *)self scheduledDeliverySetting])
  {
    if ([(BBSectionInfoSettings *)self scheduledDeliverySetting] == 2) {
      int v15 = @"YES";
    }
    else {
      int v15 = @"NO";
    }
    uint64_t v16 = [v10 stringByAppendingFormat:@", scheduled delivery = %@", v15];

    uint64_t v10 = (void *)v16;
  }
  if ([(BBSectionInfoSettings *)self carPlaySetting])
  {
    if ([(BBSectionInfoSettings *)self carPlaySetting] == 2) {
      BOOL v17 = @"YES";
    }
    else {
      BOOL v17 = @"NO";
    }
    uint64_t v18 = [v10 stringByAppendingFormat:@", CarPlay = %@", v17];

    uint64_t v10 = (void *)v18;
  }
  if ([(BBSectionInfoSettings *)self remoteNotificationsSetting])
  {
    if ([(BBSectionInfoSettings *)self remoteNotificationsSetting] == 2) {
      uint64_t v19 = @"YES";
    }
    else {
      uint64_t v19 = @"NO";
    }
    uint64_t v20 = [v10 stringByAppendingFormat:@", remote notifications = %@", v19];

    uint64_t v10 = (void *)v20;
  }
  if ([(BBSectionInfoSettings *)self criticalAlertSetting])
  {
    if ([(BBSectionInfoSettings *)self criticalAlertSetting] == 2) {
      int v21 = @"YES";
    }
    else {
      int v21 = @"NO";
    }
    uint64_t v22 = [v10 stringByAppendingFormat:@", critical alert = %@", v21];

    uint64_t v10 = (void *)v22;
  }
  if ([(BBSectionInfoSettings *)self timeSensitiveSetting])
  {
    if ([(BBSectionInfoSettings *)self timeSensitiveSetting] == 2) {
      int64_t v23 = @"YES";
    }
    else {
      int64_t v23 = @"NO";
    }
    int64_t v24 = [v10 stringByAppendingFormat:@", time sensitive = %@", v23];

    if ([(BBSectionInfoSettings *)self hasUserConfiguredTimeSensitiveSetting]) {
      int v25 = @"YES";
    }
    else {
      int v25 = @"NO";
    }
    uint64_t v10 = [v24 stringByAppendingFormat:@", user configured time sensitive = %@", v25];
  }
  if ([(BBSectionInfoSettings *)self announceSetting])
  {
    uint64_t v26 = [(BBSectionInfoSettings *)self _announceSettingDescription];
    uint64_t v27 = [v10 stringByAppendingFormat:@", announce setting = %@", v26];

    uint64_t v10 = (void *)v27;
  }
  if ([(BBSectionInfoSettings *)self directMessagesSetting])
  {
    if ([(BBSectionInfoSettings *)self directMessagesSetting] == 2) {
      int64_t v28 = @"YES";
    }
    else {
      int64_t v28 = @"NO";
    }
    int64_t v29 = [v10 stringByAppendingFormat:@", direct messages = %@", v28];

    if ([(BBSectionInfoSettings *)self hasUserConfiguredDirectMessagesSetting]) {
      int v30 = @"YES";
    }
    else {
      int v30 = @"NO";
    }
    uint64_t v10 = [v29 stringByAppendingFormat:@", user configured direct messages = %@", v30];
  }
  if ([(BBSectionInfoSettings *)self summarizationSetting])
  {
    if ([(BBSectionInfoSettings *)self summarizationSetting] == 2) {
      uint64_t v31 = @"YES";
    }
    else {
      uint64_t v31 = @"NO";
    }
    uint64_t v32 = [v10 stringByAppendingFormat:@", summarization = %@", v31];

    uint64_t v10 = (void *)v32;
  }
  if ([(BBSectionInfoSettings *)self showsOnExternalDevices]) {
    v33 = @"YES";
  }
  else {
    v33 = @"NO";
  }
  int v34 = [v10 stringByAppendingFormat:@", shows on external devices = %@", v33];

  if ([(BBSectionInfoSettings *)self showsCustomSettingsLink]) {
    v35 = @"YES";
  }
  else {
    v35 = @"NO";
  }
  v36 = [v34 stringByAppendingFormat:@", shows custom settings = %@", v35];

  int v37 = [(BBSectionInfoSettings *)self _contentPreviewSettingDescription];
  v38 = [v36 stringByAppendingFormat:@", content preview setting = %@", v37];

  v39 = [(BBSectionInfoSettings *)self _alertTypeDescription];
  unsigned int v40 = [v38 stringByAppendingFormat:@", Alert style = %@", v39];

  uint64_t v41 = BBPushSettingsDescription([(BBSectionInfoSettings *)self pushSettings]);
  uint64_t v42 = [v40 stringByAppendingFormat:@", Push settings = %@", v41];

  uint64_t v43 = [(BBSectionInfoSettings *)self _bulletinGroupingSettingDescription];
  v44 = [v42 stringByAppendingFormat:@", grouping = %@", v43];

  v48.receiver = self;
  v48.super_class = (Class)BBSectionInfoSettings;
  uint64_t v45 = [(BBSectionInfoSettings *)&v48 description];
  uint64_t v46 = [v45 stringByAppendingString:v44];

  return v46;
}

- (id)_authorizationStatusDescription
{
  unint64_t v2 = [(BBSectionInfoSettings *)self authorizationStatus];
  if (v2 > 4) {
    return @"<invalid>";
  }
  else {
    return off_264297150[v2];
  }
}

- (id)_alertTypeDescription
{
  unint64_t v2 = [(BBSectionInfoSettings *)self alertType];
  if (v2 > 2) {
    return @"<invalid>";
  }
  else {
    return off_264297178[v2];
  }
}

- (id)_contentPreviewSettingDescription
{
  unint64_t v2 = [(BBSectionInfoSettings *)self contentPreviewSetting];
  if (v2 > 3) {
    return @"<invalid>";
  }
  else {
    return off_264297190[v2];
  }
}

- (id)_bulletinGroupingSettingDescription
{
  unint64_t v2 = [(BBSectionInfoSettings *)self bulletinGroupingSetting];
  if (v2 > 2) {
    return @"<invalid>";
  }
  else {
    return off_2642971B0[v2];
  }
}

- (id)_announceSettingDescription
{
  unint64_t v2 = [(BBSectionInfoSettings *)self announceSetting];
  if (v2 > 3) {
    return 0;
  }
  else {
    return off_2642971C8[v2];
  }
}

- (unint64_t)hash
{
  int64_t v3 = [(BBSectionInfoSettings *)self authorizationStatus];
  id v4 = [(BBSectionInfoSettings *)self authorizationExpirationDate];
  uint64_t v5 = [v4 hash] ^ v3;
  id v6 = [(BBSectionInfoSettings *)self lastUserGrantedAuthorizationDate];
  uint64_t v7 = [v6 hash];
  uint64_t v8 = [(BBSectionInfoSettings *)self muteAssertion];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  int64_t v10 = [(BBSectionInfoSettings *)self notificationCenterSetting];
  int64_t v11 = v10 ^ [(BBSectionInfoSettings *)self lockScreenSetting];
  uint64_t v12 = v9 ^ v11 ^ [(BBSectionInfoSettings *)self showsOnExternalDevices];
  uint64_t v13 = [(BBSectionInfoSettings *)self showsCustomSettingsLink];
  int64_t v14 = v13 ^ [(BBSectionInfoSettings *)self contentPreviewSetting];
  unint64_t v15 = v12 ^ v14 ^ [(BBSectionInfoSettings *)self alertType];
  unint64_t v16 = [(BBSectionInfoSettings *)self pushSettings];
  int64_t v17 = v16 ^ [(BBSectionInfoSettings *)self carPlaySetting];
  int64_t v18 = v17 ^ [(BBSectionInfoSettings *)self remoteNotificationsSetting];
  int64_t v19 = v18 ^ [(BBSectionInfoSettings *)self criticalAlertSetting];
  int64_t v20 = v19 ^ [(BBSectionInfoSettings *)self timeSensitiveSetting];
  unint64_t v21 = v15 ^ v20 ^ [(BBSectionInfoSettings *)self hasUserConfiguredTimeSensitiveSetting];
  int64_t v22 = [(BBSectionInfoSettings *)self bulletinGroupingSetting];
  int64_t v23 = v22 ^ [(BBSectionInfoSettings *)self announceSetting];
  int64_t v24 = v23 ^ [(BBSectionInfoSettings *)self scheduledDeliverySetting];
  int64_t v25 = v24 ^ [(BBSectionInfoSettings *)self directMessagesSetting];
  int64_t v26 = v25 ^ [(BBSectionInfoSettings *)self hasUserConfiguredDirectMessagesSetting];
  unint64_t v27 = v21 ^ v26 ^ [(BBSectionInfoSettings *)self summarizationSetting];

  return v27;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setAllowsNotifications:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [(BBSectionInfoSettings *)self setAuthorizationStatus:v3];
}

- (BBSectionInfoSettings)initWithUNCSectionInfoSettings:(id)a3
{
  id v4 = a3;
  if (v4
    && (v15.receiver = self,
        v15.super_class = (Class)BBSectionInfoSettings,
        (self = [(BBSectionInfoSettings *)&v15 init]) != 0))
  {
    -[BBSectionInfoSettings setAuthorizationStatus:](self, "setAuthorizationStatus:", [v4 authorizationStatus]);
    uint64_t v5 = [v4 authorizationExpirationDate];
    [(BBSectionInfoSettings *)self setAuthorizationExpirationDate:v5];

    id v6 = [v4 lastUserGrantedAuthorizationDate];
    [(BBSectionInfoSettings *)self setLastUserGrantedAuthorizationDate:v6];

    uint64_t v7 = [v4 muteAssertion];
    uint64_t v8 = +[BBUNCoreConversion toBBMuteAssertion:v7];
    [(BBSectionInfoSettings *)self setMuteAssertion:v8];

    -[BBSectionInfoSettings setNotificationCenterSetting:](self, "setNotificationCenterSetting:", [v4 notificationCenterSetting]);
    -[BBSectionInfoSettings setLockScreenSetting:](self, "setLockScreenSetting:", [v4 lockScreenSetting]);
    -[BBSectionInfoSettings setShowsOnExternalDevices:](self, "setShowsOnExternalDevices:", [v4 showsOnExternalDevices]);
    -[BBSectionInfoSettings setShowsCustomSettingsLink:](self, "setShowsCustomSettingsLink:", [v4 showsCustomSettingsLink]);
    -[BBSectionInfoSettings setContentPreviewSetting:](self, "setContentPreviewSetting:", [v4 contentPreviewSetting]);
    -[BBSectionInfoSettings setAlertType:](self, "setAlertType:", [v4 alertType]);
    -[BBSectionInfoSettings setPushSettings:](self, "setPushSettings:", [v4 pushSettings]);
    -[BBSectionInfoSettings setCarPlaySetting:](self, "setCarPlaySetting:", [v4 carPlaySetting]);
    -[BBSectionInfoSettings setRemoteNotificationsSetting:](self, "setRemoteNotificationsSetting:", [v4 remoteNotificationsSetting]);
    -[BBSectionInfoSettings setCriticalAlertSetting:](self, "setCriticalAlertSetting:", [v4 criticalAlertSetting]);
    -[BBSectionInfoSettings setTimeSensitiveSetting:](self, "setTimeSensitiveSetting:", [v4 timeSensitiveSetting]);
    -[BBSectionInfoSettings setUserConfiguredTimeSensitiveSetting:](self, "setUserConfiguredTimeSensitiveSetting:", [v4 hasUserConfiguredTimeSensitiveSetting]);
    -[BBSectionInfoSettings setBulletinGroupingSetting:](self, "setBulletinGroupingSetting:", [v4 bulletinGroupingSetting]);
    unint64_t v9 = [v4 announceSetting];
    if (v9 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v9;
    }
    [(BBSectionInfoSettings *)self setAnnounceSetting:v10];
    unint64_t v11 = [v4 scheduledDeliverySetting];
    if (v11 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v11;
    }
    [(BBSectionInfoSettings *)self setScheduledDeliverySetting:v12];
    -[BBSectionInfoSettings setDirectMessagesSetting:](self, "setDirectMessagesSetting:", [v4 directMessagesSetting]);
    -[BBSectionInfoSettings setUserConfiguredDirectMessagesSetting:](self, "setUserConfiguredDirectMessagesSetting:", [v4 hasUserConfiguredDirectMessagesSetting]);
    -[BBSectionInfoSettings setAllowsNotifications:](self, "setAllowsNotifications:", [v4 allowsNotifications]);
    -[BBSectionInfoSettings setShowsMessagePreview:](self, "setShowsMessagePreview:", [v4 showsMessagePreview]);
    -[BBSectionInfoSettings setShowsInNotificationCenter:](self, "setShowsInNotificationCenter:", [v4 showsInNotificationCenter]);
    -[BBSectionInfoSettings setShowsInLockScreen:](self, "setShowsInLockScreen:", [v4 showsInLockScreen]);
    self = self;
    uint64_t v13 = self;
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)toUNCSectionInfoSettings
{
  int64_t v3 = +[BBUNCoreConversion toUNCSectionType:[(BBSectionInfoSettings *)self sectionType]];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F842E0]) initWithDefaultsForSectionType:v3];
  objc_msgSend(v4, "setAuthorizationStatus:", -[BBSectionInfoSettings authorizationStatus](self, "authorizationStatus"));
  uint64_t v5 = [(BBSectionInfoSettings *)self authorizationExpirationDate];
  [v4 setAuthorizationExpirationDate:v5];

  id v6 = [(BBSectionInfoSettings *)self lastUserGrantedAuthorizationDate];
  [v4 setLastUserGrantedAuthorizationDate:v6];

  uint64_t v7 = [(BBSectionInfoSettings *)self muteAssertion];
  uint64_t v8 = +[BBUNCoreConversion toUNCMuteAssertion:v7];
  [v4 setMuteAssertion:v8];

  objc_msgSend(v4, "setNotificationCenterSetting:", -[BBSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting"));
  objc_msgSend(v4, "setLockScreenSetting:", -[BBSectionInfoSettings lockScreenSetting](self, "lockScreenSetting"));
  objc_msgSend(v4, "setShowsOnExternalDevices:", -[BBSectionInfoSettings showsOnExternalDevices](self, "showsOnExternalDevices"));
  objc_msgSend(v4, "setShowsCustomSettingsLink:", -[BBSectionInfoSettings showsCustomSettingsLink](self, "showsCustomSettingsLink"));
  objc_msgSend(v4, "setContentPreviewSetting:", -[BBSectionInfoSettings contentPreviewSetting](self, "contentPreviewSetting"));
  objc_msgSend(v4, "setAlertType:", -[BBSectionInfoSettings alertType](self, "alertType"));
  objc_msgSend(v4, "setPushSettings:", -[BBSectionInfoSettings pushSettings](self, "pushSettings"));
  objc_msgSend(v4, "setCarPlaySetting:", -[BBSectionInfoSettings carPlaySetting](self, "carPlaySetting"));
  objc_msgSend(v4, "setRemoteNotificationsSetting:", -[BBSectionInfoSettings remoteNotificationsSetting](self, "remoteNotificationsSetting"));
  objc_msgSend(v4, "setCriticalAlertSetting:", -[BBSectionInfoSettings criticalAlertSetting](self, "criticalAlertSetting"));
  objc_msgSend(v4, "setTimeSensitiveSetting:", -[BBSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting"));
  objc_msgSend(v4, "setUserConfiguredTimeSensitiveSetting:", -[BBSectionInfoSettings hasUserConfiguredTimeSensitiveSetting](self, "hasUserConfiguredTimeSensitiveSetting"));
  objc_msgSend(v4, "setBulletinGroupingSetting:", -[BBSectionInfoSettings bulletinGroupingSetting](self, "bulletinGroupingSetting"));
  unint64_t v9 = [(BBSectionInfoSettings *)self announceSetting];
  if (v9 <= 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v9;
  }
  [v4 setAnnounceSetting:v10];
  unint64_t v11 = [(BBSectionInfoSettings *)self scheduledDeliverySetting];
  if (v11 <= 1) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = v11;
  }
  [v4 setScheduledDeliverySetting:v12];
  objc_msgSend(v4, "setDirectMessagesSetting:", -[BBSectionInfoSettings directMessagesSetting](self, "directMessagesSetting"));
  objc_msgSend(v4, "setUserConfiguredDirectMessagesSetting:", -[BBSectionInfoSettings hasUserConfiguredDirectMessagesSetting](self, "hasUserConfiguredDirectMessagesSetting"));
  objc_msgSend(v4, "setAllowsNotifications:", -[BBSectionInfoSettings allowsNotifications](self, "allowsNotifications"));
  objc_msgSend(v4, "setShowsMessagePreview:", -[BBSectionInfoSettings showsMessagePreview](self, "showsMessagePreview"));
  objc_msgSend(v4, "setShowsInNotificationCenter:", -[BBSectionInfoSettings showsInNotificationCenter](self, "showsInNotificationCenter"));
  objc_msgSend(v4, "setShowsInLockScreen:", -[BBSectionInfoSettings showsInLockScreen](self, "showsInLockScreen"));
  return v4;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (BOOL)showsMessagePreview
{
  return [(BBSectionInfoSettings *)self contentPreviewSetting] != 3;
}

- (void)setShowsInNotificationCenter:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [(BBSectionInfoSettings *)self setNotificationCenterSetting:v3];
}

- (void)setShowsInLockScreen:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [(BBSectionInfoSettings *)self setLockScreenSetting:v3];
}

- (int64_t)spokenNotificationSetting
{
  int64_t v2 = [(BBSectionInfoSettings *)self announceSetting];
  if ((unint64_t)(v2 - 1) > 2) {
    return 0;
  }
  else {
    return qword_2176FF8F0[v2 - 1];
  }
}

- (void)setSpokenNotificationSetting:(int64_t)a3
{
  if (a3 == 2)
  {
    if ([(BBSectionInfoSettings *)self timeSensitiveSetting] == 2) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 3;
    }
  }
  else
  {
    uint64_t v4 = a3 == 1;
  }
  [(BBSectionInfoSettings *)self setAnnounceSetting:v4];
}

- (void)muteThreadIdentifier:(os_log_t)log untilDate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_217675000, log, OS_LOG_TYPE_ERROR, "BBSectionInfoSettings: Must provide valid thread identifier in order to mute a thread", v1, 2u);
}

- (void)muteThreadIdentifier:(uint64_t)a1 untilDate:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_217675000, a2, OS_LOG_TYPE_ERROR, "BBSectionInfoSettings: Cannot mute thread because section is already muted. Thread ID:%@", (uint8_t *)&v2, 0xCu);
}

- (void)unmuteThreadIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_217675000, log, OS_LOG_TYPE_ERROR, "BBSectionInfoSettings: Must provide valid thread identifier in order to unmute a thread", v1, 2u);
}

- (void)unmuteThreadIdentifier:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_217675000, a2, OS_LOG_TYPE_ERROR, "BBSectionInfoSettings: Cannot unmute thread because section is already muted. Thread ID:%@", (uint8_t *)&v2, 0xCu);
}

@end