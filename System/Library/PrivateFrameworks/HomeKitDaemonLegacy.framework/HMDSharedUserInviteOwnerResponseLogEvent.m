@interface HMDSharedUserInviteOwnerResponseLogEvent
- (HMDSharedUserInviteOwnerResponseLogEvent)initWithHomeUUID:(id)a3;
- (id)coreAnalyticsEventDictionary;
- (id)coreAnalyticsEventName;
- (int64_t)addUserToHomeMS;
- (int64_t)authenticateUserMS;
- (int64_t)joiningReverseShareMS;
- (int64_t)totalOwnerResidentResponseMS;
- (unint64_t)coreAnalyticsEventOptions;
- (void)setAddUserToHomeMS:(int64_t)a3;
- (void)setAuthenticateUserMS:(int64_t)a3;
- (void)setJoiningReverseShareMS:(int64_t)a3;
- (void)setTotalOwnerResidentResponseMS:(int64_t)a3;
@end

@implementation HMDSharedUserInviteOwnerResponseLogEvent

- (void)setTotalOwnerResidentResponseMS:(int64_t)a3
{
  self->_totalOwnerResidentResponseMS = a3;
}

- (int64_t)totalOwnerResidentResponseMS
{
  return self->_totalOwnerResidentResponseMS;
}

- (void)setAddUserToHomeMS:(int64_t)a3
{
  self->_addUserToHomeMS = a3;
}

- (int64_t)addUserToHomeMS
{
  return self->_addUserToHomeMS;
}

- (void)setJoiningReverseShareMS:(int64_t)a3
{
  self->_joiningReverseShareMS = a3;
}

- (int64_t)joiningReverseShareMS
{
  return self->_joiningReverseShareMS;
}

- (void)setAuthenticateUserMS:(int64_t)a3
{
  self->_authenticateUserMS = a3;
}

- (int64_t)authenticateUserMS
{
  return self->_authenticateUserMS;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (id)coreAnalyticsEventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v11.receiver = self;
  v11.super_class = (Class)HMDSharedUserInviteOwnerResponseLogEvent;
  v4 = [(HMDSharedUserInviteLogEvent *)&v11 coreAnalyticsEventDictionary];
  [v3 addEntriesFromDictionary:v4];

  v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDSharedUserInviteOwnerResponseLogEvent authenticateUserMS](self, "authenticateUserMS"));
  [v3 setObject:v5 forKeyedSubscript:@"authenticateUserMS"];

  v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDSharedUserInviteOwnerResponseLogEvent joiningReverseShareMS](self, "joiningReverseShareMS"));
  [v3 setObject:v6 forKeyedSubscript:@"joiningReverseShareMS"];

  v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDSharedUserInviteOwnerResponseLogEvent addUserToHomeMS](self, "addUserToHomeMS"));
  [v3 setObject:v7 forKeyedSubscript:@"addUserToHomeMS"];

  v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDSharedUserInviteOwnerResponseLogEvent totalOwnerResidentResponseMS](self, "totalOwnerResidentResponseMS"));
  [v3 setObject:v8 forKeyedSubscript:@"totalOwnerResidentResponseMS"];

  v9 = (void *)[v3 copy];
  return v9;
}

- (id)coreAnalyticsEventName
{
  return @"com.apple.HomeKit.daemon.sharedUserInvite.ownerResidentResponseEvent";
}

- (HMDSharedUserInviteOwnerResponseLogEvent)initWithHomeUUID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDSharedUserInviteOwnerResponseLogEvent;
  return [(HMDSharedUserInviteLogEvent *)&v4 initWithHomeUUID:a3];
}

@end