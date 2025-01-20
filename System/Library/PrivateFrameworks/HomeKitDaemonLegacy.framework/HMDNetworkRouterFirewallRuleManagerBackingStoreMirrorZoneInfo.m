@interface HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorZoneInfo
- (BOOL)ignoreChangeToken;
- (BOOL)zoneHasChanged;
- (BOOL)zoneWasDeleted;
- (CKRecordZoneID)zoneID;
- (HMBLocalZone)mirroredLocalZone;
- (HMDNetworkRouterFirewallRuleCloudZone)cloudZone;
- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorZoneInfo)initWithZoneID:(id)a3;
- (NSMutableSet)recordIDs;
- (void)forceRefresh;
- (void)markChanged;
- (void)markDeleted;
- (void)setCloudZone:(id)a3;
- (void)setMirroredLocalZone:(id)a3;
@end

@implementation HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorZoneInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirroredLocalZone, 0);
  objc_storeStrong((id *)&self->_cloudZone, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
}

- (void)setMirroredLocalZone:(id)a3
{
}

- (HMBLocalZone)mirroredLocalZone
{
  return self->_mirroredLocalZone;
}

- (void)setCloudZone:(id)a3
{
}

- (HMDNetworkRouterFirewallRuleCloudZone)cloudZone
{
  return self->_cloudZone;
}

- (BOOL)ignoreChangeToken
{
  return self->_ignoreChangeToken;
}

- (BOOL)zoneWasDeleted
{
  return self->_zoneWasDeleted;
}

- (BOOL)zoneHasChanged
{
  return self->_zoneHasChanged;
}

- (NSMutableSet)recordIDs
{
  return self->_recordIDs;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)forceRefresh
{
  self->_ignoreChangeToken = 1;
}

- (void)markDeleted
{
  self->_zoneWasDeleted = 1;
}

- (void)markChanged
{
  self->_zoneHasChanged = 1;
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorZoneInfo)initWithZoneID:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorZoneInfo;
  v6 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorZoneInfo *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_zoneID, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
    recordIDs = v7->_recordIDs;
    v7->_recordIDs = (NSMutableSet *)v8;

    v10 = v7;
  }

  return v7;
}

@end