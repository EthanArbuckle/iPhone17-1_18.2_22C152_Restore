@interface HMDUserSettingsPerHomeLogEvent
- (BOOL)isAdmin;
- (BOOL)isAnnounceAccessAllowed;
- (BOOL)isOwner;
- (BOOL)isPersonalRequestsEnabled;
- (BOOL)isRecognizeMyVoiceEnabled;
- (BOOL)isRemoteAccessAllowed;
- (HMDUserSettingsPerHomeLogEvent)initWithUser:(id)a3;
- (HMDUserSettingsPerHomeLogEvent)initWithUser:(id)a3 userDataController:(id)a4 homeUUID:(id)a5;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (unint64_t)camerasAccessLevel;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDUserSettingsPerHomeLogEvent

- (unint64_t)camerasAccessLevel
{
  return self->_camerasAccessLevel;
}

- (BOOL)isAnnounceAccessAllowed
{
  return self->_isAnnounceAccessAllowed;
}

- (BOOL)isPersonalRequestsEnabled
{
  return self->_isPersonalRequestsEnabled;
}

- (BOOL)isRecognizeMyVoiceEnabled
{
  return self->_isRecognizeMyVoiceEnabled;
}

- (BOOL)isRemoteAccessAllowed
{
  return self->_isRemoteAccessAllowed;
}

- (BOOL)isAdmin
{
  return self->_isAdmin;
}

- (BOOL)isOwner
{
  return self->_isOwner;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUserSettingsPerHomeLogEvent isOwner](self, "isOwner"));
  [v3 setObject:v4 forKeyedSubscript:@"isOwner"];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUserSettingsPerHomeLogEvent isAdmin](self, "isAdmin"));
  [v3 setObject:v5 forKeyedSubscript:@"isAdmin"];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUserSettingsPerHomeLogEvent isRemoteAccessAllowed](self, "isRemoteAccessAllowed"));
  [v3 setObject:v6 forKeyedSubscript:@"isRemoteAccessAllowed"];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUserSettingsPerHomeLogEvent isRecognizeMyVoiceEnabled](self, "isRecognizeMyVoiceEnabled"));
  [v3 setObject:v7 forKeyedSubscript:@"isRecognizeMyVoiceEnabled"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUserSettingsPerHomeLogEvent isPersonalRequestsEnabled](self, "isPersonalRequestsEnabled"));
  [v3 setObject:v8 forKeyedSubscript:@"isPersonalRequestsEnabled"];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUserSettingsPerHomeLogEvent isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed"));
  [v3 setObject:v9 forKeyedSubscript:@"isAnnounceAccessAllowed"];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserSettingsPerHomeLogEvent camerasAccessLevel](self, "camerasAccessLevel"));
  [v3 setObject:v10 forKeyedSubscript:@"camerasAccessLevel"];

  v11 = (void *)[v3 copy];
  return (NSDictionary *)v11;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.userSettings";
}

- (HMDUserSettingsPerHomeLogEvent)initWithUser:(id)a3 userDataController:(id)a4 homeUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDUserSettingsPerHomeLogEvent;
  v10 = [(HMMHomeLogEvent *)&v12 initWithHomeUUID:a5];
  if (v10)
  {
    v10->_isOwner = [v8 isOwner];
    v10->_isAdmin = [v8 isAdministrator];
    v10->_isRemoteAccessAllowed = [v8 isRemoteAccessAllowed];
    v10->_isRecognizeMyVoiceEnabled = [v9 isRecognizeMyVoiceEnabled];
    v10->_isPersonalRequestsEnabled = [v9 assistantAccessControlActivityNotificationsEnabledForPersonalRequests];
    v10->_isAnnounceAccessAllowed = [v8 isAnnounceAccessAllowed];
    v10->_camerasAccessLevel = [v8 camerasAccessLevel];
  }

  return v10;
}

- (HMDUserSettingsPerHomeLogEvent)initWithUser:(id)a3
{
  id v4 = a3;
  v5 = [v4 userDataController];
  v6 = [v4 home];
  v7 = [v6 uuid];
  id v8 = [(HMDUserSettingsPerHomeLogEvent *)self initWithUser:v4 userDataController:v5 homeUUID:v7];

  return v8;
}

@end