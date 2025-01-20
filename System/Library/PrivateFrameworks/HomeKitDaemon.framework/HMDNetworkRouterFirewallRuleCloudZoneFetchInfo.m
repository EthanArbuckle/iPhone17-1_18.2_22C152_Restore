@interface HMDNetworkRouterFirewallRuleCloudZoneFetchInfo
+ (id)logCategory;
- (CKServerChangeToken)changeToken;
- (CKServerChangeToken)originalChangeToken;
- (HMBLocalZoneMirrorInput)mirrorInput;
- (HMDNetworkRouterFirewallRuleCloudZoneFetchInfo)initWithOptions:(id)a3 changeToken:(id)a4 promise:(id)a5 database:(id)a6 useAnonymousRequests:(BOOL)a7 interestedRecordIDs:(id)a8 mirrorInput:(id)a9;
- (NSSet)interestedRecordIDs;
- (void)finishWithError:(id)a3;
- (void)setChangeToken:(id)a3;
- (void)setMirrorInput:(id)a3;
@end

@implementation HMDNetworkRouterFirewallRuleCloudZoneFetchInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirrorInput, 0);
  objc_storeStrong((id *)&self->_originalChangeToken, 0);
  objc_storeStrong((id *)&self->_changeToken, 0);
  objc_storeStrong((id *)&self->_interestedRecordIDs, 0);
}

- (void)setMirrorInput:(id)a3
{
}

- (HMBLocalZoneMirrorInput)mirrorInput
{
  return self->_mirrorInput;
}

- (CKServerChangeToken)originalChangeToken
{
  return self->_originalChangeToken;
}

- (void)setChangeToken:(id)a3
{
}

- (CKServerChangeToken)changeToken
{
  return self->_changeToken;
}

- (NSSet)interestedRecordIDs
{
  return self->_interestedRecordIDs;
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(HMDNetworkRouterFirewallRuleCloudZoneFetchInfo *)self mirrorInput];
  [v5 abort];

  v6.receiver = self;
  v6.super_class = (Class)HMDNetworkRouterFirewallRuleCloudZoneFetchInfo;
  [(HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *)&v6 finishWithError:v4];
}

- (HMDNetworkRouterFirewallRuleCloudZoneFetchInfo)initWithOptions:(id)a3 changeToken:(id)a4 promise:(id)a5 database:(id)a6 useAnonymousRequests:(BOOL)a7 interestedRecordIDs:(id)a8 mirrorInput:(id)a9
{
  BOOL v10 = a7;
  id v29 = a4;
  id v28 = a8;
  id v27 = a9;
  v16 = (objc_class *)MEMORY[0x263F424F0];
  id v17 = a6;
  id v18 = a5;
  id v19 = a3;
  id v20 = [v16 alloc];
  v21 = [v19 label];
  v22 = (void *)[v20 initWithName:v21];

  v23 = [v17 container];

  v30.receiver = self;
  v30.super_class = (Class)HMDNetworkRouterFirewallRuleCloudZoneFetchInfo;
  v24 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *)&v30 initWithActivity:v22 options:v19 container:v23 useAnonymousRequests:v10 promise:v18];

  if (v24)
  {
    objc_storeStrong((id *)&v24->_changeToken, a4);
    objc_storeStrong((id *)&v24->_originalChangeToken, a4);
    objc_storeStrong((id *)&v24->_interestedRecordIDs, a8);
    objc_storeStrong((id *)&v24->_mirrorInput, a9);
    v25 = v24;
  }

  return v24;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_202629 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_202629, &__block_literal_global_202630);
  }
  v2 = (void *)logCategory__hmf_once_v1_202631;
  return v2;
}

void __61__HMDNetworkRouterFirewallRuleCloudZoneFetchInfo_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_202631;
  logCategory__hmf_once_v1_202631 = v0;
}

@end