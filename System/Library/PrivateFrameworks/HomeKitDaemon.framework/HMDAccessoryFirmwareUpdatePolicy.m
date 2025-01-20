@interface HMDAccessoryFirmwareUpdatePolicy
+ (id)logCategory;
- (BOOL)evaluate;
- (BOOL)status;
- (HMDAccessoryFirmwareUpdatePolicy)initWithAccessory:(id)a3 workQueue:(id)a4;
- (HMDHAPAccessory)accessory;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (void)configure;
- (void)evaluateAndNotify;
- (void)notify:(BOOL)a3;
- (void)setStatus:(BOOL)a3;
@end

@implementation HMDAccessoryFirmwareUpdatePolicy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

- (void)setStatus:(BOOL)a3
{
  self->_status = a3;
}

- (BOOL)status
{
  return self->_status;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (void)notify:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x230FBD990](self, a2);
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = HMFBooleanToString();
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending notification with policy status %@", buf, 0x16u);
  }
  v10 = [MEMORY[0x263F08A00] defaultCenter];
  v11 = objc_msgSend(NSNumber, "numberWithBool:", v3, @"HMDAccessoryFirmwareUpdatePolicyStatusChangedKey");
  v14 = v11;
  v12 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  [v10 postNotificationName:@"HMDAccessoryFirmwareUpdatePolicyStatusChangedNotification" object:v6 userInfo:v12];
}

- (BOOL)evaluate
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Policy status evaluated to YES", (uint8_t *)&v8, 0xCu);
  }
  return 1;
}

- (void)evaluateAndNotify
{
  BOOL v3 = [(HMDAccessoryFirmwareUpdatePolicy *)self evaluate];
  if (v3 != [(HMDAccessoryFirmwareUpdatePolicy *)self status])
  {
    [(HMDAccessoryFirmwareUpdatePolicy *)self setStatus:v3];
    [(HMDAccessoryFirmwareUpdatePolicy *)self notify:v3];
  }
}

- (void)configure
{
}

- (HMDAccessoryFirmwareUpdatePolicy)initWithAccessory:(id)a3 workQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDAccessoryFirmwareUpdatePolicy;
  int v8 = [(HMDAccessoryFirmwareUpdatePolicy *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_accessory, v6);
    objc_storeStrong((id *)&v9->_workQueue, a4);
  }

  return v9;
}

- (id)logIdentifier
{
  v2 = [(HMDAccessoryFirmwareUpdatePolicy *)self accessory];
  BOOL v3 = [v2 logIdentifier];

  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_149160 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_149160, &__block_literal_global_149161);
  }
  v2 = (void *)logCategory__hmf_once_v1_149162;
  return v2;
}

void __47__HMDAccessoryFirmwareUpdatePolicy_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_149162;
  logCategory__hmf_once_v1_149162 = v0;
}

@end