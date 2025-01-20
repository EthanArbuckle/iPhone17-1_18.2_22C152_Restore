@interface HMMNullRTCSession
+ (id)logCategory;
- (HMMNullRTCSession)initWithUUID:(id)a3 serviceName:(id)a4;
- (HMMRTCSessionVoucher)voucher;
- (NSString)serviceName;
- (NSUUID)uuid;
@end

@implementation HMMNullRTCSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (HMMRTCSessionVoucher)voucher
{
  v3 = [HMMRTCSessionVoucher alloc];
  v4 = [(HMMNullRTCSession *)self uuid];
  v5 = [(HMMNullRTCSession *)self serviceName];
  v6 = [(HMMRTCSessionVoucher *)v3 initWithUUID:v4 serviceName:v5];

  return v6;
}

- (HMMNullRTCSession)initWithUUID:(id)a3 serviceName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMNullRTCSession;
  v9 = [(HMMNullRTCSession *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeStrong((id *)&v10->_serviceName, a4);
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0 != -1) {
    dispatch_once(&logCategory__hmf_once_t0, &__block_literal_global_1655);
  }
  v2 = (void *)logCategory__hmf_once_v1;
  return v2;
}

uint64_t __32__HMMNullRTCSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1;
  logCategory__hmf_once_uint64_t v1 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end