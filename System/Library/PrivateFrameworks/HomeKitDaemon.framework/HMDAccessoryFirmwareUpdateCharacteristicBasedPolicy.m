@interface HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy
+ (id)logCategory;
- (BOOL)_policyStatusFromCharacteristic:(id)a3;
- (BOOL)evaluate;
- (BOOL)isEqual:(id)a3;
- (HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy)initWithAccessory:(id)a3 serviceType:(id)a4 characteristicType:(id)a5 debounceDuration:(unint64_t)a6 policyHandler:(id)a7 workQueue:(id)a8;
- (HMDCharacteristic)characteristic;
- (HMFTimer)debounceTimer;
- (NSString)characteristicType;
- (NSString)serviceType;
- (id)policyHandler;
- (unint64_t)debounceDuration;
- (unint64_t)hash;
- (void)_startDebounceTimer;
- (void)_stopDebounceTimer;
- (void)configure;
- (void)dealloc;
- (void)handleCharacteristicValuesChanged:(id)a3;
- (void)registerForNotifications;
- (void)setDebounceTimer:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy

- (void).cxx_destruct
{
  objc_storeStrong(&self->_policyHandler, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_debounceTimer, 0);
}

- (unint64_t)debounceDuration
{
  return self->_debounceDuration;
}

- (id)policyHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (NSString)characteristicType
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)serviceType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDebounceTimer:(id)a3
{
}

- (HMFTimer)debounceTimer
{
  return self->_debounceTimer;
}

- (void)_stopDebounceTimer
{
  v3 = [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self debounceTimer];
  [v3 suspend];

  [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self setDebounceTimer:0];
}

- (void)_startDebounceTimer
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x263F42658]), "initWithTimeInterval:options:", 1, (double)-[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy debounceDuration](self, "debounceDuration"));
  [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self setDebounceTimer:v3];

  v4 = [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self debounceTimer];
  [v4 setDelegate:self];

  v5 = [(HMDAccessoryFirmwareUpdatePolicy *)self workQueue];
  v6 = [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self debounceTimer];
  [v6 setDelegateQueue:v5];

  id v7 = [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self debounceTimer];
  [v7 resume];
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self debounceTimer];

  if (v5 == v4)
  {
    BOOL v6 = [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self evaluate];
    [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self _stopDebounceTimer];
    if (v6 != [(HMDAccessoryFirmwareUpdatePolicy *)self status])
    {
      [(HMDAccessoryFirmwareUpdatePolicy *)self setStatus:v6];
      [(HMDAccessoryFirmwareUpdatePolicy *)self notify:v6];
    }
  }
}

- (BOOL)_policyStatusFromCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self policyHandler];
  if (v5)
  {
    BOOL v6 = [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self policyHandler];
    char v7 = ((uint64_t (**)(void, id))v6)[2](v6, v4);
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void)handleCharacteristicValuesChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryFirmwareUpdatePolicy *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __89__HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy_handleCharacteristicValuesChanged___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __89__HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy_handleCharacteristicValuesChanged___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v18 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Received characteristic values changed notification", buf, 0xCu);
  }
  id v6 = [*(id *)(a1 + 40) userInfo];
  char v7 = objc_msgSend(v6, "hmf_arrayForKey:", @"kModifiedCharacteristicsKey");

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __89__HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy_handleCharacteristicValuesChanged___block_invoke_11;
  v16[3] = &unk_264A2D3B8;
  v16[4] = *(void *)(a1 + 32);
  id v8 = objc_msgSend(v7, "na_firstObjectPassingTest:", v16);
  if (v8)
  {
    int v9 = [*(id *)(a1 + 32) _policyStatusFromCharacteristic:v8];
    int v10 = [*(id *)(a1 + 32) status];
    v11 = *(void **)(a1 + 32);
    if (v9 == v10)
    {
      v14 = [v11 debounceTimer];
      int v15 = [v14 isRunning];

      if (v15) {
        [*(id *)(a1 + 32) _stopDebounceTimer];
      }
    }
    else if (v9)
    {
      v12 = [v11 debounceTimer];
      char v13 = [v12 isRunning];

      if ((v13 & 1) == 0) {
        [*(id *)(a1 + 32) _startDebounceTimer];
      }
    }
    else
    {
      [v11 setStatus:0];
      [*(id *)(a1 + 32) notify:0];
    }
  }
}

uint64_t __89__HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy_handleCharacteristicValuesChanged___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) accessory];
  id v5 = [v3 accessory];
  int v6 = HMFEqualObjects();

  if (v6)
  {
    char v7 = [*(id *)(a1 + 32) characteristicType];
    id v8 = [v3 type];
    if ([v7 isEqualToString:v8])
    {
      int v9 = [*(id *)(a1 + 32) serviceType];
      int v10 = [v3 service];
      v11 = [v10 type];
      uint64_t v12 = [v9 isEqualToString:v11];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)evaluate
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self characteristic];
  BOOL v4 = [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self _policyStatusFromCharacteristic:v3];

  id v5 = (void *)MEMORY[0x230FBD990]();
  int v6 = self;
  char v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = HMFBooleanToString();
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Policy status evaluated to %@", (uint8_t *)&v11, 0x16u);
  }
  return v4;
}

- (void)registerForNotifications
{
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  id v3 = [(HMDAccessoryFirmwareUpdatePolicy *)self accessory];
  [v4 addObserver:self selector:sel_handleCharacteristicValuesChanged_ name:@"HMDAccessoryCharacteristicsChangedNotification" object:v3];
}

- (HMDCharacteristic)characteristic
{
  id v3 = [(HMDAccessoryFirmwareUpdatePolicy *)self accessory];
  id v4 = [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self characteristicType];
  id v5 = [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self serviceType];
  int v6 = [v3 findCharacteristicType:v4 forServiceType:v5];

  return (HMDCharacteristic *)v6;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessoryFirmwareUpdatePolicy *)self accessory];
  if (v3)
  {
    id v4 = [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self characteristic];
    int v5 = [v4 deregisterNotificationForClientIdentifier:@"com.apple.HomeKitDaemon.accessoryfirmwareupdate.policy.characteristic"];

    if (v5)
    {
      int v6 = [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self characteristic];
      __int16 v13 = v6;
      char v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
      [v3 setNotificationsEnabled:0 forCharacteristics:v7 clientIdentifier:@"com.apple.HomeKitDaemon.accessoryfirmwareupdate.policy.characteristic"];
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    int v9 = self;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Accessory has been removed - bail out from dealloc", buf, 0xCu);
    }
  }

  v12.receiver = self;
  v12.super_class = (Class)HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy;
  [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)&v12 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)a3;
  if (self == v4)
  {
    char v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v5 = v4;
    }
    else {
      int v5 = 0;
    }
    int v6 = v5;
    if (!v6) {
      goto LABEL_9;
    }
    char v7 = [(HMDAccessoryFirmwareUpdatePolicy *)self accessory];
    id v8 = [(HMDAccessoryFirmwareUpdatePolicy *)v6 accessory];
    int v9 = [v7 isEqual:v8];

    if (!v9) {
      goto LABEL_9;
    }
    int v10 = [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self serviceType];
    int v11 = [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)v6 serviceType];
    int v12 = [v10 isEqualToString:v11];

    if (v12)
    {
      __int16 v13 = [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self characteristicType];
      v14 = [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)v6 characteristicType];
      char v15 = [v13 isEqualToString:v14];
    }
    else
    {
LABEL_9:
      char v15 = 0;
    }
  }
  return v15;
}

- (unint64_t)hash
{
  v2 = [(HMDAccessoryFirmwareUpdatePolicy *)self accessory];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)configure
{
  v7[1] = *MEMORY[0x263EF8340];
  [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self registerForNotifications];
  unint64_t v3 = [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self characteristic];
  [v3 setNotificationEnabled:1 forClientIdentifier:@"com.apple.HomeKitDaemon.accessoryfirmwareupdate.policy.characteristic"];

  id v4 = [(HMDAccessoryFirmwareUpdatePolicy *)self accessory];
  int v5 = [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self characteristic];
  v7[0] = v5;
  int v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [v4 setNotificationsEnabled:1 forCharacteristics:v6 clientIdentifier:@"com.apple.HomeKitDaemon.accessoryfirmwareupdate.policy.characteristic"];

  if ([(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self evaluate]) {
    [(HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy *)self _startDebounceTimer];
  }
  [(HMDAccessoryFirmwareUpdatePolicy *)self setStatus:0];
}

- (HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy)initWithAccessory:(id)a3 serviceType:(id)a4 characteristicType:(id)a5 debounceDuration:(unint64_t)a6 policyHandler:(id)a7 workQueue:(id)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy;
  v18 = [(HMDAccessoryFirmwareUpdatePolicy *)&v23 initWithAccessory:a3 workQueue:a8];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_serviceType, a4);
    objc_storeStrong((id *)&v19->_characteristicType, a5);
    v19->_debounceDuration = a6;
    v20 = _Block_copy(v17);
    id policyHandler = v19->_policyHandler;
    v19->_id policyHandler = v20;
  }
  return v19;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_128205 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_128205, &__block_literal_global_128206);
  }
  v2 = (void *)logCategory__hmf_once_v1_128207;
  return v2;
}

void __66__HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_128207;
  logCategory__hmf_once_v1_128207 = v0;
}

@end