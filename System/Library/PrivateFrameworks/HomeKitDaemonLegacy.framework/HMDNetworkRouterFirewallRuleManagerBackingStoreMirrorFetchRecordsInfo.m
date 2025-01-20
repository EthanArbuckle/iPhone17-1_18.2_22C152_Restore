@interface HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchRecordsInfo
- (CKRecordID)recordID;
- (CKRecordZoneID)zoneID;
- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchRecordsInfo)initWithActivity:(id)a3 options:(id)a4 promise:(id)a5 database:(id)a6 useAnonymousRequests:(BOOL)a7 zoneID:(id)a8 recordID:(id)a9 desiredKeys:(id)a10;
- (NSArray)desiredKeys;
- (NSMutableSet)records;
@end

@implementation HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchRecordsInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
}

- (NSMutableSet)records
{
  return self->_records;
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchRecordsInfo)initWithActivity:(id)a3 options:(id)a4 promise:(id)a5 database:(id)a6 useAnonymousRequests:(BOOL)a7 zoneID:(id)a8 recordID:(id)a9 desiredKeys:(id)a10
{
  BOOL v11 = a7;
  id v28 = a8;
  id v27 = a9;
  id v17 = a10;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = [a6 container];
  v29.receiver = self;
  v29.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchRecordsInfo;
  v22 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *)&v29 initWithActivity:v20 options:v19 container:v21 useAnonymousRequests:v11 promise:v18];

  if (v22)
  {
    objc_storeStrong((id *)&v22->_zoneID, a8);
    objc_storeStrong((id *)&v22->_recordID, a9);
    objc_storeStrong((id *)&v22->_desiredKeys, a10);
    uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", v27, v28);
    records = v22->_records;
    v22->_records = (NSMutableSet *)v23;

    v25 = v22;
  }

  return v22;
}

@end