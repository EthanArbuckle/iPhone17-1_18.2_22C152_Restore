@interface HMHomePersonManager
+ (id)logCategory;
+ (id)personManagerUUIDFromHomeUUID:(id)a3;
- (HMHomePersonManager)initWithHome:(id)a3;
- (id)logIdentifier;
@end

@implementation HMHomePersonManager

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_13543 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_13543, &__block_literal_global_13544);
  }
  v2 = (void *)logCategory__hmf_once_v1_13545;

  return v2;
}

uint64_t __34__HMHomePersonManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_13545;
  logCategory__hmf_once_v1_13545 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)personManagerUUIDFromHomeUUID:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithUUIDString:@"063D0514-8CFB-4333-AFF0-C2A70F412508"];
  v6 = (void *)MEMORY[0x1E4F29128];
  v7 = [v4 UUIDString];

  v8 = [v7 dataUsingEncoding:4];
  v9 = objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v8);

  return v9;
}

- (id)logIdentifier
{
  v2 = [(HMPersonManager *)self UUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (HMHomePersonManager)initWithHome:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  v6 = [v4 uuid];
  v7 = [v5 personManagerUUIDFromHomeUUID:v6];

  v8 = (void *)HMHomePersonManagerZoneNamePrefix;
  v9 = [v4 personManagerZoneUUID];
  v10 = [v9 UUIDString];
  v11 = [v8 stringByAppendingString:v10];

  v12 = [v4 context];

  v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v14 = [(HMPersonManager *)self initWithContext:v12 UUID:v7 zoneName:v11 notificationCenter:v13];

  return v14;
}

@end