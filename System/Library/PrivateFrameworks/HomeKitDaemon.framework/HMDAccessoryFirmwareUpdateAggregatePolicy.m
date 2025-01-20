@interface HMDAccessoryFirmwareUpdateAggregatePolicy
+ (id)logCategory;
- (BOOL)evaluate;
- (HMDAccessoryFirmwareUpdateAggregatePolicy)initWithPolicies:(id)a3 accessory:(id)a4 workQueue:(id)a5;
- (NSArray)policies;
- (void)_registerForNotifications;
- (void)configure;
- (void)handlePolicyStatusChange:(id)a3;
@end

@implementation HMDAccessoryFirmwareUpdateAggregatePolicy

- (void).cxx_destruct
{
}

- (NSArray)policies
{
  return self->_policies;
}

- (BOOL)evaluate
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = [(HMDAccessoryFirmwareUpdateAggregatePolicy *)self policies];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        if (([*(id *)(*((void *)&v17 + 1) + 8 * v7) status] & 1) == 0)
        {
          v13 = (void *)MEMORY[0x230FBD990]();
          v14 = self;
          v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            v16 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v22 = v16;
            _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Policy status evaluated to NO", buf, 0xCu);
          }

          return 0;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v22 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Policy status evaluated to YES", buf, 0xCu);
  }
  return 1;
}

- (void)handlePolicyStatusChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDAccessoryFirmwareUpdatePolicy *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__HMDAccessoryFirmwareUpdateAggregatePolicy_handlePolicyStatusChange___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __70__HMDAccessoryFirmwareUpdateAggregatePolicy_handlePolicyStatusChange___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) object];
  if ([v2 conformsToProtocol:&unk_26E4C6090]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  uint64_t v5 = [*(id *)(a1 + 40) policies];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) userInfo];
    int v8 = objc_msgSend(v7, "hmf_BOOLForKey:", @"HMDAccessoryFirmwareUpdatePolicyStatusChangedKey");

    v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 40);
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      v14 = v12;
      __int16 v15 = 1024;
      int v16 = v8;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Received updated status from sub policy - %d", (uint8_t *)&v13, 0x12u);
    }
    [*(id *)(a1 + 40) evaluateAndNotify];
  }
}

- (void)_registerForNotifications
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(HMDAccessoryFirmwareUpdateAggregatePolicy *)self policies];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        v9 = [MEMORY[0x263F08A00] defaultCenter];
        [v9 addObserver:self selector:sel_handlePolicyStatusChange_ name:@"HMDAccessoryFirmwareUpdatePolicyStatusChangedNotification" object:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)configure
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(HMDAccessoryFirmwareUpdateAggregatePolicy *)self policies];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) configure];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(HMDAccessoryFirmwareUpdatePolicy *)self setStatus:[(HMDAccessoryFirmwareUpdateAggregatePolicy *)self evaluate]];
  [(HMDAccessoryFirmwareUpdateAggregatePolicy *)self _registerForNotifications];
}

- (HMDAccessoryFirmwareUpdateAggregatePolicy)initWithPolicies:(id)a3 accessory:(id)a4 workQueue:(id)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDAccessoryFirmwareUpdateAggregatePolicy;
  long long v10 = [(HMDAccessoryFirmwareUpdatePolicy *)&v13 initWithAccessory:a4 workQueue:a5];
  long long v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_policies, a3);
  }

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_149187 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_149187, &__block_literal_global_88_149188);
  }
  v2 = (void *)logCategory__hmf_once_v5_149189;
  return v2;
}

void __56__HMDAccessoryFirmwareUpdateAggregatePolicy_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v5_149189;
  logCategory__hmf_once_v5_149189 = v0;
}

@end