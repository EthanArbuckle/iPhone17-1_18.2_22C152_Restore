@interface HMMMLogOrigin
+ (id)logCategory;
+ (id)originWithLogIdentifier:(id)a3;
- (HMMMLogOrigin)initWithLogIdentifier:(id)a3;
- (NSString)logId;
@end

@implementation HMMMLogOrigin

- (void).cxx_destruct
{
}

+ (id)originWithLogIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[HMMMLogOrigin alloc] initWithLogIdentifier:v3];

  return v4;
}

- (HMMMLogOrigin)initWithLogIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMMLogOrigin;
  v6 = [(HMMMLogOrigin *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_logId, a3);
  }

  return v7;
}

- (NSString)logId
{
  return self->_logId;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_22332 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_22332, &__block_literal_global_22333);
  }
  v2 = (void *)logCategory__hmf_once_v1_22334;

  return v2;
}

uint64_t __28__HMMMLogOrigin_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_22334;
  logCategory__hmf_once_v1_22334 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end