@interface HMDBackingStoreCacheGroup
- (CKRecordZoneSubscription)subscription;
- (CKServerChangeToken)serverChangeToken;
- (HMDBackingStoreCacheGroup)initWithGroupID:(int64_t)a3 zone:(id)a4 rootRecord:(id)a5 serverChangeToken:(id)a6 subscriptionName:(id)a7 owner:(id)a8 subscription:(id)a9;
- (HMDBackingStoreCacheZone)zone;
- (NSString)owner;
- (NSString)rootRecordName;
- (NSString)subscriptionName;
- (id)dumpDebug;
- (int64_t)groupID;
- (void)setGroupID:(int64_t)a3;
- (void)setServerChangeToken:(id)a3;
- (void)setSubscription:(id)a3;
@end

@implementation HMDBackingStoreCacheGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_subscriptionName, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_rootRecordName, 0);
  objc_destroyWeak((id *)&self->_zone);
}

- (void)setSubscription:(id)a3
{
}

- (CKRecordZoneSubscription)subscription
{
  return (CKRecordZoneSubscription *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)owner
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)subscriptionName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setServerChangeToken:(id)a3
{
}

- (CKServerChangeToken)serverChangeToken
{
  return (CKServerChangeToken *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)rootRecordName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (HMDBackingStoreCacheZone)zone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_zone);
  return (HMDBackingStoreCacheZone *)WeakRetained;
}

- (void)setGroupID:(int64_t)a3
{
  self->_groupID = a3;
}

- (int64_t)groupID
{
  return self->_groupID;
}

- (id)dumpDebug
{
  v3 = [MEMORY[0x263F089D8] string];
  objc_msgSend(v3, "appendFormat:", @"zone_group: %lu (%p)\n", -[HMDBackingStoreCacheGroup groupID](self, "groupID"), self);
  v4 = [(HMDBackingStoreCacheGroup *)self zone];
  objc_msgSend(v3, "appendFormat:", @"  zone: %p\n", v4);

  v5 = [(HMDBackingStoreCacheGroup *)self rootRecordName];
  [v3 appendFormat:@"  root: %@\n", v5];

  v6 = [(HMDBackingStoreCacheGroup *)self owner];
  [v3 appendFormat:@"  owner: %@\n", v6];

  v7 = [(HMDBackingStoreCacheGroup *)self subscriptionName];
  [v3 appendFormat:@"  subs: %@\n", v7];

  v8 = [(HMDBackingStoreCacheGroup *)self serverChangeToken];
  [v3 appendFormat:@"  token: %@\n", v8];

  v9 = [(HMDBackingStoreCacheGroup *)self subscription];
  [v3 appendFormat:@"  subscription: %@\n", v9];

  return v3;
}

- (HMDBackingStoreCacheGroup)initWithGroupID:(int64_t)a3 zone:(id)a4 rootRecord:(id)a5 serverChangeToken:(id)a6 subscriptionName:(id)a7 owner:(id)a8 subscription:(id)a9
{
  id v15 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)HMDBackingStoreCacheGroup;
  v18 = [(HMDBackingStoreCacheGroup *)&v25 init];
  v19 = v18;
  if (v18)
  {
    v18->_groupID = a3;
    objc_storeWeak((id *)&v18->_zone, v15);
    objc_storeStrong((id *)&v19->_rootRecordName, a5);
    objc_storeStrong((id *)&v19->_serverChangeToken, a6);
    objc_storeStrong((id *)&v19->_subscriptionName, a7);
    objc_storeStrong((id *)&v19->_owner, a8);
    objc_storeStrong((id *)&v19->_subscription, a9);
    v20 = v19;
  }

  return v19;
}

@end