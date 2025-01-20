@interface HMDSharedUserInviteOwnerSendLogEvent
- (BOOL)userAlreadyAddedToShare;
- (HMDSharedUserInviteOwnerSendLogEvent)initWithHome:(id)a3;
- (id)coreAnalyticsEventDictionary;
- (id)coreAnalyticsEventName;
- (int64_t)addUserToShareMS;
- (int64_t)createShareMS;
- (int64_t)sendInvitationMS;
- (int64_t)totalInvitationCreateAndSendMS;
- (unint64_t)coreAnalyticsEventOptions;
- (void)setAddUserToShareMS:(int64_t)a3;
- (void)setCreateShareMS:(int64_t)a3;
- (void)setSendInvitationMS:(int64_t)a3;
- (void)setTotalInvitationCreateAndSendMS:(int64_t)a3;
- (void)setUserAlreadyAddedToShare:(BOOL)a3;
@end

@implementation HMDSharedUserInviteOwnerSendLogEvent

- (void)setTotalInvitationCreateAndSendMS:(int64_t)a3
{
  self->_totalInvitationCreateAndSendMS = a3;
}

- (int64_t)totalInvitationCreateAndSendMS
{
  return self->_totalInvitationCreateAndSendMS;
}

- (void)setUserAlreadyAddedToShare:(BOOL)a3
{
  self->_userAlreadyAddedToShare = a3;
}

- (BOOL)userAlreadyAddedToShare
{
  return self->_userAlreadyAddedToShare;
}

- (void)setSendInvitationMS:(int64_t)a3
{
  self->_sendInvitationMS = a3;
}

- (int64_t)sendInvitationMS
{
  return self->_sendInvitationMS;
}

- (void)setAddUserToShareMS:(int64_t)a3
{
  self->_addUserToShareMS = a3;
}

- (int64_t)addUserToShareMS
{
  return self->_addUserToShareMS;
}

- (void)setCreateShareMS:(int64_t)a3
{
  self->_createShareMS = a3;
}

- (int64_t)createShareMS
{
  return self->_createShareMS;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (id)coreAnalyticsEventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v13.receiver = self;
  v13.super_class = (Class)HMDSharedUserInviteOwnerSendLogEvent;
  v4 = [(HMDSharedUserInviteLogEvent *)&v13 coreAnalyticsEventDictionary];
  [v3 addEntriesFromDictionary:v4];

  v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDSharedUserInviteOwnerSendLogEvent createShareMS](self, "createShareMS"));
  [v3 setObject:v5 forKeyedSubscript:@"createShareMS"];

  v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDSharedUserInviteOwnerSendLogEvent addUserToShareMS](self, "addUserToShareMS"));
  [v3 setObject:v6 forKeyedSubscript:@"addUserToShareMS"];

  v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDSharedUserInviteOwnerSendLogEvent sendInvitationMS](self, "sendInvitationMS"));
  [v3 setObject:v7 forKeyedSubscript:@"sendInvitationMS"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDSharedUserInviteOwnerSendLogEvent userAlreadyAddedToShare](self, "userAlreadyAddedToShare"));
  [v3 setObject:v8 forKeyedSubscript:@"userAlreadyAddedToShare"];

  v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDSharedUserInviteOwnerSendLogEvent totalInvitationCreateAndSendMS](self, "totalInvitationCreateAndSendMS"));
  [v3 setObject:v9 forKeyedSubscript:@"totalInvitationCreateAndSendMS"];

  v10 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDSharedUserInviteOwnerSendLogEvent totalInvitationCreateAndSendMS](self, "totalInvitationCreateAndSendMS")- -[HMDSharedUserInviteOwnerSendLogEvent createShareMS](self, "createShareMS")- (-[HMDSharedUserInviteOwnerSendLogEvent sendInvitationMS](self, "sendInvitationMS")+ -[HMDSharedUserInviteOwnerSendLogEvent addUserToShareMS](self, "addUserToShareMS")));
  [v3 setObject:v10 forKeyedSubscript:@"totalUnassociatedDurationMS"];

  v11 = (void *)[v3 copy];
  return v11;
}

- (id)coreAnalyticsEventName
{
  return @"com.apple.HomeKit.daemon.sharedUserInvite.ownerResidentSendEvent";
}

- (HMDSharedUserInviteOwnerSendLogEvent)initWithHome:(id)a3
{
  v4 = [a3 uuid];
  v7.receiver = self;
  v7.super_class = (Class)HMDSharedUserInviteOwnerSendLogEvent;
  v5 = [(HMDSharedUserInviteLogEvent *)&v7 initWithHomeUUID:v4];

  return v5;
}

@end