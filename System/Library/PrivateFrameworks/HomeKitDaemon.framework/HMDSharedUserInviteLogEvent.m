@interface HMDSharedUserInviteLogEvent
- (BOOL)IDSAvailable;
- (BOOL)iCloudSignedIn;
- (BOOL)manateeAvailable;
- (BOOL)networkAvailable;
- (HMDSharedUserInviteLogEvent)initWithHomeUUID:(id)a3;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)description;
- (NSUUID)sessionIdentifier;
- (int64_t)IDSRegistrationError;
- (int64_t)IDSRegistrationStatus;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)invitationType;
- (void)setICloudSignedIn:(BOOL)a3;
- (void)setIDSAvailable:(BOOL)a3;
- (void)setIDSRegistrationError:(int64_t)a3;
- (void)setIDSRegistrationStatus:(int64_t)a3;
- (void)setInvitationType:(unint64_t)a3;
- (void)setManateeAvailable:(BOOL)a3;
- (void)setNetworkAvailable:(BOOL)a3;
- (void)setSessionIdentifier:(id)a3;
@end

@implementation HMDSharedUserInviteLogEvent

- (void).cxx_destruct
{
}

- (void)setIDSRegistrationError:(int64_t)a3
{
  self->_IDSRegistrationError = a3;
}

- (int64_t)IDSRegistrationError
{
  return self->_IDSRegistrationError;
}

- (void)setIDSRegistrationStatus:(int64_t)a3
{
  self->_IDSRegistrationStatus = a3;
}

- (int64_t)IDSRegistrationStatus
{
  return self->_IDSRegistrationStatus;
}

- (void)setIDSAvailable:(BOOL)a3
{
  self->_IDSAvailable = a3;
}

- (BOOL)IDSAvailable
{
  return self->_IDSAvailable;
}

- (void)setNetworkAvailable:(BOOL)a3
{
  self->_networkAvailable = a3;
}

- (BOOL)networkAvailable
{
  return self->_networkAvailable;
}

- (void)setManateeAvailable:(BOOL)a3
{
  self->_manateeAvailable = a3;
}

- (BOOL)manateeAvailable
{
  return self->_manateeAvailable;
}

- (void)setICloudSignedIn:(BOOL)a3
{
  self->_iCloudSignedIn = a3;
}

- (BOOL)iCloudSignedIn
{
  return self->_iCloudSignedIn;
}

- (void)setInvitationType:(unint64_t)a3
{
  self->_invitationType = a3;
}

- (unint64_t)invitationType
{
  return self->_invitationType;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (NSUUID)sessionIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(HMDSharedUserInviteLogEvent *)self sessionIdentifier];
  v5 = [v4 UUIDString];
  [v3 setObject:v5 forKeyedSubscript:@"sessionIdentifier"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDSharedUserInviteLogEvent invitationType](self, "invitationType"));
  [v3 setObject:v6 forKeyedSubscript:@"invitationType"];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDSharedUserInviteLogEvent iCloudSignedIn](self, "iCloudSignedIn"));
  [v3 setObject:v7 forKeyedSubscript:@"iCloudSignedIn_BOOL"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDSharedUserInviteLogEvent manateeAvailable](self, "manateeAvailable"));
  [v3 setObject:v8 forKeyedSubscript:@"manateeAvailable_BOOL"];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDSharedUserInviteLogEvent networkAvailable](self, "networkAvailable"));
  [v3 setObject:v9 forKeyedSubscript:@"networkAvailable_BOOL"];

  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDSharedUserInviteLogEvent IDSAvailable](self, "IDSAvailable"));
  [v3 setObject:v10 forKeyedSubscript:@"IDSAvailable_BOOL"];

  v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDSharedUserInviteLogEvent IDSRegistrationStatus](self, "IDSRegistrationStatus"));
  [v3 setObject:v11 forKeyedSubscript:@"IDSRegistrationStatus"];

  v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDSharedUserInviteLogEvent IDSRegistrationError](self, "IDSRegistrationError"));
  [v3 setObject:v12 forKeyedSubscript:@"IDSRegistrationError"];

  v13 = (void *)[v3 copy];
  return (NSDictionary *)v13;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.sharedUserInvite.BaseEvent";
}

- (NSString)description
{
  v2 = NSString;
  id v3 = [(HMDSharedUserInviteLogEvent *)self coreAnalyticsEventDictionary];
  v4 = [v2 stringWithFormat:@"%@", v3];

  return (NSString *)v4;
}

- (HMDSharedUserInviteLogEvent)initWithHomeUUID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDSharedUserInviteLogEvent;
  return [(HMMHomeLogEvent *)&v4 initWithHomeUUID:a3];
}

@end