@interface HMDSharedUserInviteAcceptLogEvent
- (HMDSharedUserInviteAcceptLogEvent)initWithHomeUUID:(id)a3;
- (id)coreAnalyticsEventDictionary;
- (id)coreAnalyticsEventName;
- (int64_t)MKFCKSharedHomeLandMS;
- (int64_t)addUserToShareMS;
- (int64_t)createHomeMS;
- (int64_t)createMKFCKSharedUserDataRootMS;
- (int64_t)createReverseShareMS;
- (int64_t)discoverPrimaryResidentMS;
- (int64_t)joinOwnerShareMS;
- (int64_t)processSharedHomeRecordMS;
- (int64_t)residentSyncDataReceivedMS;
- (int64_t)residentSyncRequestMS;
- (int64_t)sendAcceptanceToOwnerMS;
- (int64_t)sharedUserTotalMS;
- (int64_t)totalInvitationAcceptanceMS;
- (unint64_t)coreAnalyticsEventOptions;
- (void)setAddUserToShareMS:(int64_t)a3;
- (void)setCreateHomeMS:(int64_t)a3;
- (void)setCreateMKFCKSharedUserDataRootMS:(int64_t)a3;
- (void)setCreateReverseShareMS:(int64_t)a3;
- (void)setDiscoverPrimaryResidentMS:(int64_t)a3;
- (void)setJoinOwnerShareMS:(int64_t)a3;
- (void)setMKFCKSharedHomeLandMS:(int64_t)a3;
- (void)setProcessSharedHomeRecordMS:(int64_t)a3;
- (void)setResidentSyncDataReceivedMS:(int64_t)a3;
- (void)setResidentSyncRequestMS:(int64_t)a3;
- (void)setSendAcceptanceToOwnerMS:(int64_t)a3;
- (void)setSharedUserTotalMS:(int64_t)a3;
- (void)setTotalInvitationAcceptanceMS:(int64_t)a3;
@end

@implementation HMDSharedUserInviteAcceptLogEvent

- (void)setSharedUserTotalMS:(int64_t)a3
{
  self->_sharedUserTotalMS = a3;
}

- (int64_t)sharedUserTotalMS
{
  return self->_sharedUserTotalMS;
}

- (void)setResidentSyncDataReceivedMS:(int64_t)a3
{
  self->_residentSyncDataReceivedMS = a3;
}

- (int64_t)residentSyncDataReceivedMS
{
  return self->_residentSyncDataReceivedMS;
}

- (void)setResidentSyncRequestMS:(int64_t)a3
{
  self->_residentSyncRequestMS = a3;
}

- (int64_t)residentSyncRequestMS
{
  return self->_residentSyncRequestMS;
}

- (void)setDiscoverPrimaryResidentMS:(int64_t)a3
{
  self->_discoverPrimaryResidentMS = a3;
}

- (int64_t)discoverPrimaryResidentMS
{
  return self->_discoverPrimaryResidentMS;
}

- (void)setCreateHomeMS:(int64_t)a3
{
  self->_createHomeMS = a3;
}

- (int64_t)createHomeMS
{
  return self->_createHomeMS;
}

- (void)setProcessSharedHomeRecordMS:(int64_t)a3
{
  self->_processSharedHomeRecordMS = a3;
}

- (int64_t)processSharedHomeRecordMS
{
  return self->_processSharedHomeRecordMS;
}

- (void)setMKFCKSharedHomeLandMS:(int64_t)a3
{
  self->_MKFCKSharedHomeLandMS = a3;
}

- (int64_t)MKFCKSharedHomeLandMS
{
  return self->_MKFCKSharedHomeLandMS;
}

- (void)setTotalInvitationAcceptanceMS:(int64_t)a3
{
  self->_totalInvitationAcceptanceMS = a3;
}

- (int64_t)totalInvitationAcceptanceMS
{
  return self->_totalInvitationAcceptanceMS;
}

- (void)setSendAcceptanceToOwnerMS:(int64_t)a3
{
  self->_sendAcceptanceToOwnerMS = a3;
}

- (int64_t)sendAcceptanceToOwnerMS
{
  return self->_sendAcceptanceToOwnerMS;
}

- (void)setAddUserToShareMS:(int64_t)a3
{
  self->_addUserToShareMS = a3;
}

- (int64_t)addUserToShareMS
{
  return self->_addUserToShareMS;
}

- (void)setCreateReverseShareMS:(int64_t)a3
{
  self->_createReverseShareMS = a3;
}

- (int64_t)createReverseShareMS
{
  return self->_createReverseShareMS;
}

- (void)setCreateMKFCKSharedUserDataRootMS:(int64_t)a3
{
  self->_createMKFCKSharedUserDataRootMS = a3;
}

- (int64_t)createMKFCKSharedUserDataRootMS
{
  return self->_createMKFCKSharedUserDataRootMS;
}

- (void)setJoinOwnerShareMS:(int64_t)a3
{
  self->_joinOwnerShareMS = a3;
}

- (int64_t)joinOwnerShareMS
{
  return self->_joinOwnerShareMS;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (id)coreAnalyticsEventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v17.receiver = self;
  v17.super_class = (Class)HMDSharedUserInviteAcceptLogEvent;
  v4 = [(HMDSharedUserInviteLogEvent *)&v17 coreAnalyticsEventDictionary];
  [v3 addEntriesFromDictionary:v4];

  v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDSharedUserInviteAcceptLogEvent joinOwnerShareMS](self, "joinOwnerShareMS"));
  [v3 setObject:v5 forKeyedSubscript:@"joinOwnerShareMS"];

  v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDSharedUserInviteAcceptLogEvent createMKFCKSharedUserDataRootMS](self, "createMKFCKSharedUserDataRootMS"));
  [v3 setObject:v6 forKeyedSubscript:@"createMKFCKSharedUserDataRootMS"];

  v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDSharedUserInviteAcceptLogEvent createReverseShareMS](self, "createReverseShareMS"));
  [v3 setObject:v7 forKeyedSubscript:@"createReverseShareMS"];

  v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDSharedUserInviteAcceptLogEvent addUserToShareMS](self, "addUserToShareMS"));
  [v3 setObject:v8 forKeyedSubscript:@"addUserToShareMS"];

  v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDSharedUserInviteAcceptLogEvent sendAcceptanceToOwnerMS](self, "sendAcceptanceToOwnerMS"));
  [v3 setObject:v9 forKeyedSubscript:@"sendAcceptanceToOwnerMS"];

  v10 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDSharedUserInviteAcceptLogEvent totalInvitationAcceptanceMS](self, "totalInvitationAcceptanceMS"));
  [v3 setObject:v10 forKeyedSubscript:@"totalInvitationAcceptanceMS"];

  v11 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDSharedUserInviteAcceptLogEvent createHomeMS](self, "createHomeMS"));
  [v3 setObject:v11 forKeyedSubscript:@"createHomeMS"];

  v12 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDSharedUserInviteAcceptLogEvent discoverPrimaryResidentMS](self, "discoverPrimaryResidentMS"));
  [v3 setObject:v12 forKeyedSubscript:@"discoverPrimaryResidentMS"];

  v13 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDSharedUserInviteAcceptLogEvent residentSyncDataReceivedMS](self, "residentSyncDataReceivedMS"));
  [v3 setObject:v13 forKeyedSubscript:@"residentSyncDataReceivedMS"];

  v14 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDSharedUserInviteAcceptLogEvent sharedUserTotalMS](self, "sharedUserTotalMS"));
  [v3 setObject:v14 forKeyedSubscript:@"sharedUserTotalMS"];

  v15 = (void *)[v3 copy];
  return v15;
}

- (id)coreAnalyticsEventName
{
  return @"com.apple.HomeKit.daemon.sharedUserInvite.sharedUserAcceptEvent";
}

- (HMDSharedUserInviteAcceptLogEvent)initWithHomeUUID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDSharedUserInviteAcceptLogEvent;
  return [(HMDSharedUserInviteLogEvent *)&v4 initWithHomeUUID:a3];
}

@end