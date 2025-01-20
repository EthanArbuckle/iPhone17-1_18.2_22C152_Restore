@interface UNNotificationSettings
+ (BOOL)supportsSecureCoding;
+ (UNNotificationSettings)settingsWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 announcementSetting:(int64_t)a10 criticalAlertSetting:(int64_t)a11 alertStyle:(int64_t)a12 showPreviewsSetting:(int64_t)a13 groupingSetting:(int64_t)a14 providesAppNotificationSettings:(BOOL)a15;
+ (UNNotificationSettings)settingsWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 announcementSetting:(int64_t)a10 criticalAlertSetting:(int64_t)a11 timeSensitiveSetting:(int64_t)a12 alertStyle:(int64_t)a13 showPreviewsSetting:(int64_t)a14 groupingSetting:(int64_t)a15 providesAppNotificationSettings:(BOOL)a16;
+ (UNNotificationSettings)settingsWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 announcementSetting:(int64_t)a10 criticalAlertSetting:(int64_t)a11 timeSensitiveSetting:(int64_t)a12 scheduledDeliverySetting:(int64_t)a13 alertStyle:(int64_t)a14 showPreviewsSetting:(int64_t)a15 groupingSetting:(int64_t)a16 providesAppNotificationSettings:(BOOL)a17;
+ (UNNotificationSettings)settingsWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 announcementSetting:(int64_t)a10 criticalAlertSetting:(int64_t)a11 timeSensitiveSetting:(int64_t)a12 scheduledDeliverySetting:(int64_t)a13 directMessagesSetting:(int64_t)a14 alertStyle:(int64_t)a15 showPreviewsSetting:(int64_t)a16 groupingSetting:(int64_t)a17 providesAppNotificationSettings:(BOOL)a18;
+ (UNNotificationSettings)settingsWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 remoteNotificationsSetting:(int64_t)a10 announcementSetting:(int64_t)a11 criticalAlertSetting:(int64_t)a12 timeSensitiveSetting:(int64_t)a13 scheduledDeliverySetting:(int64_t)a14 directMessagesSetting:(int64_t)a15 alertStyle:(int64_t)a16 showPreviewsSetting:(int64_t)a17 groupingSetting:(int64_t)a18 providesAppNotificationSettings:(BOOL)a19;
+ (UNNotificationSettings)settingsWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 remoteNotificationsSetting:(int64_t)a10 announcementSetting:(int64_t)a11 criticalAlertSetting:(int64_t)a12 timeSensitiveSetting:(int64_t)a13 scheduledDeliverySetting:(int64_t)a14 directMessagesSetting:(int64_t)a15 summarizationSetting:(int64_t)a16 alertStyle:(int64_t)a17 showPreviewsSetting:(int64_t)a18 groupingSetting:(int64_t)a19 providesAppNotificationSettings:(BOOL)a20;
+ (UNNotificationSettings)settingsWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 spokenSetting:(int64_t)a10 criticalAlertSetting:(int64_t)a11 alertStyle:(int64_t)a12 showPreviewsSetting:(int64_t)a13 providesAppNotificationSettings:(BOOL)a14;
+ (id)emptySettings;
- (BOOL)hasEnabledAlertSettings;
- (BOOL)hasEnabledSettings;
- (BOOL)isEligibleForIndexing;
- (BOOL)isEqual:(id)a3;
- (BOOL)providesAppNotificationSettings;
- (UNAlertStyle)alertStyle;
- (UNAuthorizationStatus)authorizationStatus;
- (UNNotificationSetting)alertSetting;
- (UNNotificationSetting)announcementSetting;
- (UNNotificationSetting)badgeSetting;
- (UNNotificationSetting)carPlaySetting;
- (UNNotificationSetting)criticalAlertSetting;
- (UNNotificationSetting)directMessagesSetting;
- (UNNotificationSetting)lockScreenSetting;
- (UNNotificationSetting)notificationCenterSetting;
- (UNNotificationSetting)scheduledDeliverySetting;
- (UNNotificationSetting)soundSetting;
- (UNNotificationSetting)timeSensitiveSetting;
- (UNNotificationSettings)initWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 remoteNotificationsSetting:(int64_t)a10 announcementSetting:(int64_t)a11 criticalAlertSetting:(int64_t)a12 timeSensitiveSetting:(int64_t)a13 scheduledDeliverySetting:(int64_t)a14 directMessagesSetting:(int64_t)a15 summarizationSetting:(int64_t)a16 alertStyle:(int64_t)a17 showPreviewsSetting:(int64_t)a18 groupingSetting:(int64_t)a19 providesAppNotificationSettings:(BOOL)a20;
- (UNNotificationSettings)initWithCoder:(id)a3;
- (UNShowPreviewsSetting)showPreviewsSetting;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)groupingSetting;
- (int64_t)remoteNotificationsSetting;
- (int64_t)summarizationSetting;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNNotificationSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (UNNotificationSettings)settingsWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 remoteNotificationsSetting:(int64_t)a10 announcementSetting:(int64_t)a11 criticalAlertSetting:(int64_t)a12 timeSensitiveSetting:(int64_t)a13 scheduledDeliverySetting:(int64_t)a14 directMessagesSetting:(int64_t)a15 summarizationSetting:(int64_t)a16 alertStyle:(int64_t)a17 showPreviewsSetting:(int64_t)a18 groupingSetting:(int64_t)a19 providesAppNotificationSettings:(BOOL)a20
{
  LOBYTE(v22) = a20;
  v20 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:remoteNotificationsSetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:summarizationSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
                  a17,
                  a18,
                  a19,
                  v22);

  return (UNNotificationSettings *)v20;
}

- (UNNotificationSettings)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v23 = [v3 decodeIntegerForKey:@"authorizationStatus"];
  uint64_t v22 = [v3 decodeIntegerForKey:@"soundSetting"];
  uint64_t v21 = [v3 decodeIntegerForKey:@"badgeSetting"];
  uint64_t v20 = [v3 decodeIntegerForKey:@"alertSetting"];
  uint64_t v19 = [v3 decodeIntegerForKey:@"criticalAlertSetting"];
  uint64_t v17 = [v3 decodeIntegerForKey:@"timeSensitiveSetting"];
  uint64_t v18 = [v3 decodeIntegerForKey:@"notificationCenterSetting"];
  uint64_t v16 = [v3 decodeIntegerForKey:@"lockScreenSetting"];
  uint64_t v15 = [v3 decodeIntegerForKey:@"carPlaySetting"];
  uint64_t v4 = [v3 decodeIntegerForKey:@"remoteNotificationsSetting"];
  uint64_t v5 = [v3 decodeIntegerForKey:@"announcementSetting"];
  uint64_t v6 = [v3 decodeIntegerForKey:@"scheduledDeliverySetting"];
  uint64_t v7 = [v3 decodeIntegerForKey:@"directMessagesSetting"];
  uint64_t v8 = [v3 decodeIntegerForKey:@"summarizationSetting"];
  uint64_t v9 = [v3 decodeIntegerForKey:@"alertStyle"];
  uint64_t v10 = [v3 decodeIntegerForKey:@"showPreviewsSetting"];
  uint64_t v11 = [v3 decodeIntegerForKey:@"groupingSetting"];
  char v12 = [v3 decodeBoolForKey:@"providesAppNotificationSettings"];

  LOBYTE(v14) = v12;
  return -[UNNotificationSettings initWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:remoteNotificationsSetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:summarizationSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:](self, "initWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:remoteNotificationsSetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:summarizationSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:", v23, v22, v21, v20, v18, v16, v15, v4, v5, v19, v17, v6, v7, v8,
           v9,
           v10,
           v11,
           v14);
}

- (UNNotificationSettings)initWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 remoteNotificationsSetting:(int64_t)a10 announcementSetting:(int64_t)a11 criticalAlertSetting:(int64_t)a12 timeSensitiveSetting:(int64_t)a13 scheduledDeliverySetting:(int64_t)a14 directMessagesSetting:(int64_t)a15 summarizationSetting:(int64_t)a16 alertStyle:(int64_t)a17 showPreviewsSetting:(int64_t)a18 groupingSetting:(int64_t)a19 providesAppNotificationSettings:(BOOL)a20
{
  v27.receiver = self;
  v27.super_class = (Class)UNNotificationSettings;
  result = [(UNNotificationSettings *)&v27 init];
  if (result)
  {
    result->_authorizationStatus = a3;
    result->_soundSetting = a4;
    result->_badgeSetting = a5;
    result->_alertSetting = a6;
    result->_notificationCenterSetting = a7;
    result->_lockScreenSetting = a8;
    result->_carPlaySetting = a9;
    result->_remoteNotificationsSetting = a10;
    result->_showPreviewsSetting = a18;
    result->_criticalAlertSetting = a12;
    result->_timeSensitiveSetting = a13;
    result->_scheduledDeliverySetting = a14;
    result->_directMessagesSetting = a15;
    result->_summarizationSetting = a16;
    result->_alertStyle = a17;
    result->_announcementSetting = a11;
    result->_groupingSetting = a19;
    result->_providesAppNotificationSettings = a20;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings alertSetting](self, "alertSetting"), @"alertSetting");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings alertStyle](self, "alertStyle"), @"alertStyle");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings authorizationStatus](self, "authorizationStatus"), @"authorizationStatus");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings badgeSetting](self, "badgeSetting"), @"badgeSetting");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings carPlaySetting](self, "carPlaySetting"), @"carPlaySetting");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings remoteNotificationsSetting](self, "remoteNotificationsSetting"), @"remoteNotificationsSetting");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings announcementSetting](self, "announcementSetting"), @"announcementSetting");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings criticalAlertSetting](self, "criticalAlertSetting"), @"criticalAlertSetting");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings timeSensitiveSetting](self, "timeSensitiveSetting"), @"timeSensitiveSetting");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings lockScreenSetting](self, "lockScreenSetting"), @"lockScreenSetting");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings notificationCenterSetting](self, "notificationCenterSetting"), @"notificationCenterSetting");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings soundSetting](self, "soundSetting"), @"soundSetting");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings showPreviewsSetting](self, "showPreviewsSetting"), @"showPreviewsSetting");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings groupingSetting](self, "groupingSetting"), @"groupingSetting");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationSettings providesAppNotificationSettings](self, "providesAppNotificationSettings"), @"providesAppNotificationSettings");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings scheduledDeliverySetting](self, "scheduledDeliverySetting"), @"scheduledDeliverySetting");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings directMessagesSetting](self, "directMessagesSetting"), @"directMessagesSetting");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSettings summarizationSetting](self, "summarizationSetting"), @"summarizationSetting");
}

- (UNAuthorizationStatus)authorizationStatus
{
  return self->_authorizationStatus;
}

- (UNNotificationSetting)badgeSetting
{
  return self->_badgeSetting;
}

- (UNNotificationSetting)alertSetting
{
  return self->_alertSetting;
}

- (UNNotificationSetting)soundSetting
{
  return self->_soundSetting;
}

- (UNNotificationSetting)carPlaySetting
{
  return self->_carPlaySetting;
}

- (UNAlertStyle)alertStyle
{
  return self->_alertStyle;
}

- (UNNotificationSetting)scheduledDeliverySetting
{
  return self->_scheduledDeliverySetting;
}

- (UNNotificationSetting)criticalAlertSetting
{
  return self->_criticalAlertSetting;
}

- (UNNotificationSetting)timeSensitiveSetting
{
  return self->_timeSensitiveSetting;
}

- (int64_t)summarizationSetting
{
  return self->_summarizationSetting;
}

- (UNShowPreviewsSetting)showPreviewsSetting
{
  return self->_showPreviewsSetting;
}

- (int64_t)remoteNotificationsSetting
{
  return self->_remoteNotificationsSetting;
}

- (BOOL)providesAppNotificationSettings
{
  return self->_providesAppNotificationSettings;
}

- (UNNotificationSetting)notificationCenterSetting
{
  return self->_notificationCenterSetting;
}

- (UNNotificationSetting)lockScreenSetting
{
  return self->_lockScreenSetting;
}

- (int64_t)groupingSetting
{
  return self->_groupingSetting;
}

- (UNNotificationSetting)directMessagesSetting
{
  return self->_directMessagesSetting;
}

- (UNNotificationSetting)announcementSetting
{
  return self->_announcementSetting;
}

+ (id)emptySettings
{
  LOBYTE(v4) = 0;
  v2 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:remoteNotificationsSetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:summarizationSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                 0,
                 0,
                 0,
                 v4);

  return v2;
}

- (id)description
{
  v43 = NSString;
  uint64_t v42 = objc_opt_class();
  UNAuthorizationStatus v3 = [(UNNotificationSettings *)self authorizationStatus];
  if ((unint64_t)v3 > UNAuthorizationStatusEphemeral) {
    v41 = 0;
  }
  else {
    v41 = off_1E5F05FA8[v3];
  }
  UNNotificationSetting v4 = [(UNNotificationSettings *)self notificationCenterSetting];
  if ((unint64_t)v4 > UNNotificationSettingEnabled) {
    v40 = 0;
  }
  else {
    v40 = off_1E5F05FD0[v4];
  }
  UNNotificationSetting v5 = [(UNNotificationSettings *)self soundSetting];
  if ((unint64_t)v5 > UNNotificationSettingEnabled) {
    v39 = 0;
  }
  else {
    v39 = off_1E5F05FD0[v5];
  }
  UNNotificationSetting v6 = [(UNNotificationSettings *)self badgeSetting];
  if ((unint64_t)v6 > UNNotificationSettingEnabled) {
    v38 = 0;
  }
  else {
    v38 = off_1E5F05FD0[v6];
  }
  UNNotificationSetting v7 = [(UNNotificationSettings *)self lockScreenSetting];
  if ((unint64_t)v7 > UNNotificationSettingEnabled) {
    v37 = 0;
  }
  else {
    v37 = off_1E5F05FD0[v7];
  }
  UNNotificationSetting v8 = [(UNNotificationSettings *)self carPlaySetting];
  if ((unint64_t)v8 > UNNotificationSettingEnabled) {
    v36 = 0;
  }
  else {
    v36 = off_1E5F05FD0[v8];
  }
  unint64_t v9 = [(UNNotificationSettings *)self remoteNotificationsSetting];
  if (v9 > 2) {
    v35 = 0;
  }
  else {
    v35 = off_1E5F05FD0[v9];
  }
  UNNotificationSetting v10 = [(UNNotificationSettings *)self announcementSetting];
  if ((unint64_t)v10 > UNNotificationSettingEnabled) {
    v34 = 0;
  }
  else {
    v34 = off_1E5F05FD0[v10];
  }
  UNNotificationSetting v11 = [(UNNotificationSettings *)self criticalAlertSetting];
  if ((unint64_t)v11 > UNNotificationSettingEnabled) {
    v33 = 0;
  }
  else {
    v33 = off_1E5F05FD0[v11];
  }
  UNNotificationSetting v12 = [(UNNotificationSettings *)self timeSensitiveSetting];
  if ((unint64_t)v12 > UNNotificationSettingEnabled) {
    v13 = 0;
  }
  else {
    v13 = off_1E5F05FD0[v12];
  }
  UNNotificationSetting v14 = [(UNNotificationSettings *)self alertSetting];
  if ((unint64_t)v14 > UNNotificationSettingEnabled) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = off_1E5F05FD0[v14];
  }
  UNNotificationSetting v16 = [(UNNotificationSettings *)self scheduledDeliverySetting];
  if ((unint64_t)v16 > UNNotificationSettingEnabled) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = off_1E5F05FD0[v16];
  }
  UNNotificationSetting v18 = [(UNNotificationSettings *)self directMessagesSetting];
  if ((unint64_t)v18 > UNNotificationSettingEnabled) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = off_1E5F05FD0[v18];
  }
  unint64_t v20 = [(UNNotificationSettings *)self summarizationSetting];
  if (v20 > 2) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = off_1E5F05FD0[v20];
  }
  UNShowPreviewsSetting v22 = [(UNNotificationSettings *)self showPreviewsSetting];
  if ((unint64_t)v22 > UNShowPreviewsSettingNever) {
    uint64_t v23 = 0;
  }
  else {
    uint64_t v23 = off_1E5F05FE8[v22];
  }
  UNAlertStyle v24 = [(UNNotificationSettings *)self alertStyle];
  if ((unint64_t)v24 > UNAlertStyleAlert) {
    v25 = 0;
  }
  else {
    v25 = off_1E5F06000[v24];
  }
  unint64_t v26 = [(UNNotificationSettings *)self groupingSetting];
  if (v26 > 2) {
    objc_super v27 = 0;
  }
  else {
    objc_super v27 = off_1E5F06018[v26];
  }
  BOOL v28 = [(UNNotificationSettings *)self providesAppNotificationSettings];
  v29 = @"No";
  if (v28) {
    v29 = @"Yes";
  }
  v30 = v29;
  objc_msgSend(v43, "stringWithFormat:", @"<%@: %p; authorizationStatus: %@, notificationCenterSetting: %@, soundSetting: %@, badgeSetting: %@, lockScreenSetting: %@, carPlaySetting: %@, remoteNotifications: %@, announcementSetting: %@, criticalAlertSetting: %@, timeSensitiveSetting: %@, alertSetting: %@, scheduledDeliverySetting: %@, directMessagesSetting: %@, summarizationSetting: %@, showsPreviewsSetting: %@, alertStyle: %@, groupingSetting: %@ providesAppNotificationSettings: %@>",
    v42,
    self,
    v41,
    v40,
    v39,
    v38,
    v37,
    v36,
    v35,
    v34,
    v33,
    v13,
    v15,
    v17,
    v19,
    v21,
    v23,
    v25,
    v27,
  v31 = v30);

  return v31;
}

+ (UNNotificationSettings)settingsWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 spokenSetting:(int64_t)a10 criticalAlertSetting:(int64_t)a11 alertStyle:(int64_t)a12 showPreviewsSetting:(int64_t)a13 providesAppNotificationSettings:(BOOL)a14
{
  LOBYTE(v15) = a14;
  return (UNNotificationSettings *)objc_msgSend(a1, "settingsWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, 0, 0, a12, a13,
                                     0,
                                     v15);
}

+ (UNNotificationSettings)settingsWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 announcementSetting:(int64_t)a10 criticalAlertSetting:(int64_t)a11 alertStyle:(int64_t)a12 showPreviewsSetting:(int64_t)a13 groupingSetting:(int64_t)a14 providesAppNotificationSettings:(BOOL)a15
{
  LOBYTE(v16) = a15;
  return (UNNotificationSettings *)objc_msgSend(a1, "settingsWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, 0, 0, a12, a13,
                                     a14,
                                     v16);
}

+ (UNNotificationSettings)settingsWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 announcementSetting:(int64_t)a10 criticalAlertSetting:(int64_t)a11 timeSensitiveSetting:(int64_t)a12 alertStyle:(int64_t)a13 showPreviewsSetting:(int64_t)a14 groupingSetting:(int64_t)a15 providesAppNotificationSettings:(BOOL)a16
{
  LOBYTE(v17) = a16;
  return (UNNotificationSettings *)objc_msgSend(a1, "settingsWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0, 0, a13, a14,
                                     a15,
                                     v17);
}

+ (UNNotificationSettings)settingsWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 announcementSetting:(int64_t)a10 criticalAlertSetting:(int64_t)a11 timeSensitiveSetting:(int64_t)a12 scheduledDeliverySetting:(int64_t)a13 alertStyle:(int64_t)a14 showPreviewsSetting:(int64_t)a15 groupingSetting:(int64_t)a16 providesAppNotificationSettings:(BOOL)a17
{
  LOBYTE(v18) = a17;
  return (UNNotificationSettings *)objc_msgSend(a1, "settingsWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, 0, a14, a15,
                                     a16,
                                     v18);
}

+ (UNNotificationSettings)settingsWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 announcementSetting:(int64_t)a10 criticalAlertSetting:(int64_t)a11 timeSensitiveSetting:(int64_t)a12 scheduledDeliverySetting:(int64_t)a13 directMessagesSetting:(int64_t)a14 alertStyle:(int64_t)a15 showPreviewsSetting:(int64_t)a16 groupingSetting:(int64_t)a17 providesAppNotificationSettings:(BOOL)a18
{
  LOBYTE(v19) = a18;
  return (UNNotificationSettings *)objc_msgSend(a1, "settingsWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:remoteNotificationsSetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:", a3, a4, a5, a6, a7, a8, a9, 0, a10, a11, a12, a13, a14, a15,
                                     a16,
                                     a17,
                                     v19);
}

+ (UNNotificationSettings)settingsWithAuthorizationStatus:(int64_t)a3 soundSetting:(int64_t)a4 badgeSetting:(int64_t)a5 alertSetting:(int64_t)a6 notificationCenterSetting:(int64_t)a7 lockScreenSetting:(int64_t)a8 carPlaySetting:(int64_t)a9 remoteNotificationsSetting:(int64_t)a10 announcementSetting:(int64_t)a11 criticalAlertSetting:(int64_t)a12 timeSensitiveSetting:(int64_t)a13 scheduledDeliverySetting:(int64_t)a14 directMessagesSetting:(int64_t)a15 alertStyle:(int64_t)a16 showPreviewsSetting:(int64_t)a17 groupingSetting:(int64_t)a18 providesAppNotificationSettings:(BOOL)a19
{
  LOBYTE(v21) = a19;
  uint64_t v19 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:remoteNotificationsSetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:summarizationSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, 0,
                  a16,
                  a17,
                  a18,
                  v21);

  return (UNNotificationSettings *)v19;
}

- (BOOL)hasEnabledSettings
{
  return [(UNNotificationSettings *)self hasEnabledAlertSettings]
      || [(UNNotificationSettings *)self soundSetting] == UNNotificationSettingEnabled
      || [(UNNotificationSettings *)self badgeSetting] == UNNotificationSettingEnabled
      || [(UNNotificationSettings *)self announcementSetting] == UNNotificationSettingEnabled;
}

- (BOOL)hasEnabledAlertSettings
{
  return [(UNNotificationSettings *)self alertSetting] == UNNotificationSettingEnabled
      && [(UNNotificationSettings *)self alertStyle]
      || [(UNNotificationSettings *)self lockScreenSetting] == UNNotificationSettingEnabled
      || [(UNNotificationSettings *)self notificationCenterSetting] == UNNotificationSettingEnabled
      || [(UNNotificationSettings *)self carPlaySetting] == UNNotificationSettingEnabled
      || [(UNNotificationSettings *)self criticalAlertSetting] == UNNotificationSettingEnabled;
}

- (unint64_t)hash
{
  v37 = objc_msgSend(NSNumber, "numberWithInteger:", -[UNNotificationSettings alertSetting](self, "alertSetting"));
  uint64_t v3 = [v37 hash];
  v36 = objc_msgSend(NSNumber, "numberWithInteger:", -[UNNotificationSettings alertStyle](self, "alertStyle"));
  uint64_t v4 = [v36 hash] ^ v3;
  v35 = objc_msgSend(NSNumber, "numberWithInteger:", -[UNNotificationSettings authorizationStatus](self, "authorizationStatus"));
  uint64_t v5 = [v35 hash];
  v34 = objc_msgSend(NSNumber, "numberWithInteger:", -[UNNotificationSettings badgeSetting](self, "badgeSetting"));
  uint64_t v6 = v4 ^ v5 ^ [v34 hash];
  v33 = objc_msgSend(NSNumber, "numberWithInteger:", -[UNNotificationSettings carPlaySetting](self, "carPlaySetting"));
  uint64_t v7 = [v33 hash];
  v32 = objc_msgSend(NSNumber, "numberWithInteger:", -[UNNotificationSettings remoteNotificationsSetting](self, "remoteNotificationsSetting"));
  uint64_t v8 = v7 ^ [v32 hash];
  v31 = objc_msgSend(NSNumber, "numberWithInteger:", -[UNNotificationSettings announcementSetting](self, "announcementSetting"));
  uint64_t v9 = v6 ^ v8 ^ [v31 hash];
  v30 = objc_msgSend(NSNumber, "numberWithInteger:", -[UNNotificationSettings criticalAlertSetting](self, "criticalAlertSetting"));
  uint64_t v10 = [v30 hash];
  v29 = objc_msgSend(NSNumber, "numberWithInteger:", -[UNNotificationSettings timeSensitiveSetting](self, "timeSensitiveSetting"));
  uint64_t v11 = v10 ^ [v29 hash];
  BOOL v28 = objc_msgSend(NSNumber, "numberWithInteger:", -[UNNotificationSettings lockScreenSetting](self, "lockScreenSetting"));
  uint64_t v12 = v11 ^ [v28 hash];
  v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[UNNotificationSettings notificationCenterSetting](self, "notificationCenterSetting"));
  uint64_t v14 = v9 ^ v12 ^ [v13 hash];
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[UNNotificationSettings soundSetting](self, "soundSetting"));
  uint64_t v16 = [v15 hash];
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[UNNotificationSettings groupingSetting](self, "groupingSetting"));
  uint64_t v18 = v16 ^ [v17 hash];
  uint64_t v19 = objc_msgSend(NSNumber, "numberWithInteger:", -[UNNotificationSettings scheduledDeliverySetting](self, "scheduledDeliverySetting"));
  uint64_t v20 = v18 ^ [v19 hash];
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithInteger:", -[UNNotificationSettings directMessagesSetting](self, "directMessagesSetting"));
  uint64_t v22 = v20 ^ [v21 hash];
  uint64_t v23 = objc_msgSend(NSNumber, "numberWithInteger:", -[UNNotificationSettings summarizationSetting](self, "summarizationSetting"));
  uint64_t v24 = v14 ^ v22 ^ [v23 hash];
  v25 = objc_msgSend(NSNumber, "numberWithBool:", -[UNNotificationSettings providesAppNotificationSettings](self, "providesAppNotificationSettings"));
  unint64_t v26 = v24 ^ [v25 hash];

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_19;
  }
  UNNotificationSetting v5 = [(UNNotificationSettings *)self alertSetting];
  if (v5 != [v4 alertSetting]) {
    goto LABEL_19;
  }
  UNAlertStyle v6 = [(UNNotificationSettings *)self alertStyle];
  if (v6 != [v4 alertStyle]) {
    goto LABEL_19;
  }
  UNAuthorizationStatus v7 = [(UNNotificationSettings *)self authorizationStatus];
  if (v7 != [v4 authorizationStatus]) {
    goto LABEL_19;
  }
  UNNotificationSetting v8 = [(UNNotificationSettings *)self badgeSetting];
  if (v8 != [v4 badgeSetting]) {
    goto LABEL_19;
  }
  UNNotificationSetting v9 = [(UNNotificationSettings *)self carPlaySetting];
  if (v9 != [v4 carPlaySetting]) {
    goto LABEL_19;
  }
  int64_t v10 = [(UNNotificationSettings *)self remoteNotificationsSetting];
  if (v10 != [v4 remoteNotificationsSetting]) {
    goto LABEL_19;
  }
  UNNotificationSetting v11 = [(UNNotificationSettings *)self announcementSetting];
  if (v11 != [v4 announcementSetting]) {
    goto LABEL_19;
  }
  UNNotificationSetting v12 = [(UNNotificationSettings *)self lockScreenSetting];
  if (v12 != [v4 lockScreenSetting]) {
    goto LABEL_19;
  }
  UNNotificationSetting v13 = [(UNNotificationSettings *)self notificationCenterSetting];
  if (v13 != [v4 notificationCenterSetting]) {
    goto LABEL_19;
  }
  UNNotificationSetting v14 = [(UNNotificationSettings *)self soundSetting];
  if (v14 == [v4 soundSetting]
    && (int64_t v15 = [(UNNotificationSettings *)self groupingSetting],
        v15 == [v4 groupingSetting])
    && (int v16 = [(UNNotificationSettings *)self providesAppNotificationSettings],
        v16 == [v4 providesAppNotificationSettings])
    && (UNNotificationSetting v17 = [(UNNotificationSettings *)self criticalAlertSetting],
        v17 == [v4 criticalAlertSetting])
    && (UNNotificationSetting v18 = [(UNNotificationSettings *)self timeSensitiveSetting],
        v18 == [v4 timeSensitiveSetting])
    && (UNNotificationSetting v19 = [(UNNotificationSettings *)self scheduledDeliverySetting],
        v19 == [v4 scheduledDeliverySetting])
    && (UNNotificationSetting v20 = [(UNNotificationSettings *)self directMessagesSetting],
        v20 == [v4 directMessagesSetting]))
  {
    int64_t v21 = [(UNNotificationSettings *)self summarizationSetting];
    BOOL v22 = v21 == [v4 summarizationSetting];
  }
  else
  {
LABEL_19:
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)isEligibleForIndexing
{
  if ([(UNNotificationSettings *)self authorizationStatus] != UNAuthorizationStatusAuthorized) {
    return 0;
  }
  if ([(UNNotificationSettings *)self alertSetting] == UNNotificationSettingEnabled
    && [(UNNotificationSettings *)self alertStyle]
    || [(UNNotificationSettings *)self lockScreenSetting] == UNNotificationSettingEnabled)
  {
    return 1;
  }
  return [(UNNotificationSettings *)self notificationCenterSetting] == UNNotificationSettingEnabled;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v23 = [UNMutableNotificationSettings alloc];
  UNAuthorizationStatus v22 = [(UNNotificationSettings *)self authorizationStatus];
  UNNotificationSetting v21 = [(UNNotificationSettings *)self soundSetting];
  UNNotificationSetting v20 = [(UNNotificationSettings *)self badgeSetting];
  UNNotificationSetting v19 = [(UNNotificationSettings *)self alertSetting];
  UNNotificationSetting v18 = [(UNNotificationSettings *)self notificationCenterSetting];
  UNNotificationSetting v17 = [(UNNotificationSettings *)self lockScreenSetting];
  UNNotificationSetting v16 = [(UNNotificationSettings *)self carPlaySetting];
  int64_t v15 = [(UNNotificationSettings *)self remoteNotificationsSetting];
  UNNotificationSetting v4 = [(UNNotificationSettings *)self announcementSetting];
  UNNotificationSetting v5 = [(UNNotificationSettings *)self criticalAlertSetting];
  UNNotificationSetting v6 = [(UNNotificationSettings *)self timeSensitiveSetting];
  UNNotificationSetting v7 = [(UNNotificationSettings *)self scheduledDeliverySetting];
  UNNotificationSetting v8 = [(UNNotificationSettings *)self directMessagesSetting];
  int64_t v9 = [(UNNotificationSettings *)self summarizationSetting];
  UNAlertStyle v10 = [(UNNotificationSettings *)self alertStyle];
  UNShowPreviewsSetting v11 = [(UNNotificationSettings *)self showPreviewsSetting];
  int64_t v12 = [(UNNotificationSettings *)self groupingSetting];
  LOBYTE(v14) = [(UNNotificationSettings *)self providesAppNotificationSettings];
  return -[UNNotificationSettings initWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:remoteNotificationsSetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:summarizationSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:](v23, "initWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:remoteNotificationsSetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:summarizationSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:", v22, v21, v20, v19, v18, v17, v16, v15, v4, v5, v6, v7, v8, v9,
           v10,
           v11,
           v12,
           v14);
}

@end