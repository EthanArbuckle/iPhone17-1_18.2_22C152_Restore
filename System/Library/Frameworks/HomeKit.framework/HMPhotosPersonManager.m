@interface HMPhotosPersonManager
+ (id)logCategory;
+ (id)personManagerUUIDFromUserUUID:(id)a3;
- (HMPhotosPersonManager)initWithContext:(id)a3 UUID:(id)a4;
- (HMPhotosPersonManager)initWithUser:(id)a3;
- (id)logIdentifier;
@end

@implementation HMPhotosPersonManager

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_30331 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_30331, &__block_literal_global_30332);
  }
  v2 = (void *)logCategory__hmf_once_v1_30333;

  return v2;
}

uint64_t __36__HMPhotosPersonManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_30333;
  logCategory__hmf_once_v1_30333 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)personManagerUUIDFromUserUUID:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithUUIDString:@"E8A07312-F9F1-47FC-AE77-016826C7FD3F"];
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

- (HMPhotosPersonManager)initWithContext:(id)a3 UUID:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28EB8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 defaultCenter];
  v10 = [(HMPersonManager *)self initWithContext:v8 UUID:v7 zoneName:@"<unavailable>" notificationCenter:v9];

  return v10;
}

- (HMPhotosPersonManager)initWithUser:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  v6 = [v4 uuid];
  id v7 = [v5 personManagerUUIDFromUserUUID:v6];

  id v8 = (void *)HMPhotosPersonManagerZoneNamePrefix;
  v9 = [v4 photosPersonManagerZoneUUID];
  v10 = [v9 UUIDString];
  v11 = [v8 stringByAppendingString:v10];

  v12 = [v4 context];

  v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v14 = [(HMPersonManager *)self initWithContext:v12 UUID:v7 zoneName:v11 notificationCenter:v13];

  return v14;
}

@end