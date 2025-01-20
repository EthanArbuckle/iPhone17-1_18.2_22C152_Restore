@interface HMDPrimaryResidentChangeMonitor
+ (id)logCategory;
- (BOOL)dataSourceHasResidentDevices;
- (BOOL)hasResidentDevices;
- (BOOL)isCurrentDevicePrimaryResident;
- (HMDPrimaryResidentChangeMonitor)initWithIdentifier:(id)a3 notificationCenter:(id)a4;
- (HMDPrimaryResidentChangeMonitorDataSource)dataSource;
- (NSNotificationCenter)notificationCenter;
- (NSUUID)confirmedPrimaryResidentDeviceIdentifier;
- (NSUUID)identifier;
- (id)confirmedPrimaryResidentDevice;
- (id)logIdentifier;
- (void)configureWithHome:(id)a3;
- (void)notifyChangeToConfirmedPrimaryResidentDeviceIdentifier;
- (void)notifyChangeToHasResidentDevices;
- (void)notifyChangeToIsCurrentPrimaryResident;
- (void)refreshConfirmedPrimaryResidentDeviceIdentifierWithDevice:(id)a3;
- (void)refreshCurrentDevicePrimaryResidentWithDevice:(id)a3;
- (void)refreshHasResidentDevices;
- (void)refreshMonitor;
- (void)registerForNotificationsWithHome:(id)a3;
- (void)setConfirmedPrimaryResidentDeviceIdentifier:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setHasResidentDevices:(BOOL)a3;
- (void)setIsCurrentDevicePrimaryResident:(BOOL)a3;
@end

@implementation HMDPrimaryResidentChangeMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_confirmedPrimaryResidentDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfirmedPrimaryResidentDeviceIdentifier:(id)a3
{
}

- (NSUUID)confirmedPrimaryResidentDeviceIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHasResidentDevices:(BOOL)a3
{
  self->_hasResidentDevices = a3;
}

- (BOOL)hasResidentDevices
{
  return self->_hasResidentDevices;
}

- (void)setIsCurrentDevicePrimaryResident:(BOOL)a3
{
  self->_isCurrentDevicePrimaryResident = a3;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  return self->_isCurrentDevicePrimaryResident;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDPrimaryResidentChangeMonitorDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDPrimaryResidentChangeMonitorDataSource *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDPrimaryResidentChangeMonitor *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)notifyChangeToHasResidentDevices
{
  id v3 = [(HMDPrimaryResidentChangeMonitor *)self notificationCenter];
  [v3 postNotificationName:@"HMDPrimaryResidentChangeMonitorHasResidentDevicesChangeNotification" object:self];
}

- (void)notifyChangeToConfirmedPrimaryResidentDeviceIdentifier
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Posting HMDPrimaryResidentChangeMonitorConfirmedDeviceIdentifierChangeNotification notification", (uint8_t *)&v8, 0xCu);
  }
  v7 = [(HMDPrimaryResidentChangeMonitor *)v4 notificationCenter];
  [v7 postNotificationName:@"HMDPrimaryResidentChangeMonitorConfirmedDeviceIdentifierChangeNotification" object:v4];
}

- (void)notifyChangeToIsCurrentPrimaryResident
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Posting HMDPrimaryResidentChangeMonitorIsCurrentDeviceChangeNotification notification", (uint8_t *)&v8, 0xCu);
  }
  v7 = [(HMDPrimaryResidentChangeMonitor *)v4 notificationCenter];
  [v7 postNotificationName:@"HMDPrimaryResidentChangeMonitorIsCurrentDeviceChangeNotification" object:v4];
}

- (BOOL)dataSourceHasResidentDevices
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDPrimaryResidentChangeMonitor *)self dataSource];
  v4 = v3;
  if (v3)
  {
    char v5 = [v3 hasResidentDevicesForPrimaryResidentChangeMonitor:self];
  }
  else
  {
    v6 = (void *)MEMORY[0x1D9452090]();
    v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to source has resident devices due to no data source", (uint8_t *)&v11, 0xCu);
    }
    char v5 = 0;
  }

  return v5;
}

- (id)confirmedPrimaryResidentDevice
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDPrimaryResidentChangeMonitor *)self dataSource];
  v4 = v3;
  if (v3)
  {
    char v5 = [v3 confirmedPrimaryResidentDeviceForPrimaryResidentChangeMonitor:self];
  }
  else
  {
    v6 = (void *)MEMORY[0x1D9452090]();
    v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get confirmed primary resident device due to no data source", (uint8_t *)&v11, 0xCu);
    }
    char v5 = 0;
  }

  return v5;
}

- (void)refreshHasResidentDevices
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDPrimaryResidentChangeMonitor *)self dataSourceHasResidentDevices];
  if (v3 != [(HMDPrimaryResidentChangeMonitor *)self hasResidentDevices])
  {
    v4 = (void *)MEMORY[0x1D9452090]();
    char v5 = self;
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      int v8 = HMFBooleanToString();
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Updating has resident devices: %@", (uint8_t *)&v9, 0x16u);
    }
    [(HMDPrimaryResidentChangeMonitor *)v5 setHasResidentDevices:v3];
    [(HMDPrimaryResidentChangeMonitor *)v5 notifyChangeToHasResidentDevices];
  }
}

- (void)refreshConfirmedPrimaryResidentDeviceIdentifierWithDevice:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    v6 = [v4 identifier];
  }
  else
  {
    v6 = 0;
  }
  v7 = [(HMDPrimaryResidentChangeMonitor *)self confirmedPrimaryResidentDeviceIdentifier];
  char v8 = HMFEqualObjects();

  if ((v8 & 1) == 0)
  {
    int v9 = (void *)MEMORY[0x1D9452090]();
    uint64_t v10 = self;
    __int16 v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = 138543874;
      v14 = v12;
      __int16 v15 = 2112;
      v16 = v6;
      __int16 v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating confirmed primary resident device identifier: %@ using device: %@", (uint8_t *)&v13, 0x20u);
    }
    [(HMDPrimaryResidentChangeMonitor *)v10 setConfirmedPrimaryResidentDeviceIdentifier:v6];
    [(HMDPrimaryResidentChangeMonitor *)v10 notifyChangeToConfirmedPrimaryResidentDeviceIdentifier];
  }
}

- (void)refreshCurrentDevicePrimaryResidentWithDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 isCurrentDevice];
    if (v6 == [(HMDPrimaryResidentChangeMonitor *)self isCurrentDevicePrimaryResident])goto LABEL_9; {
  }
    }
  else
  {
    if (![(HMDPrimaryResidentChangeMonitor *)self isCurrentDevicePrimaryResident]) {
      goto LABEL_9;
    }
    uint64_t v6 = 0;
  }
  v7 = (void *)MEMORY[0x1D9452090]();
  char v8 = self;
  int v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    __int16 v11 = HMFBooleanToString();
    int v12 = 138543874;
    int v13 = v10;
    __int16 v14 = 2112;
    __int16 v15 = v11;
    __int16 v16 = 2112;
    __int16 v17 = v5;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating is current device primary resident: %@ using device: %@", (uint8_t *)&v12, 0x20u);
  }
  [(HMDPrimaryResidentChangeMonitor *)v8 setIsCurrentDevicePrimaryResident:v6];
  [(HMDPrimaryResidentChangeMonitor *)v8 notifyChangeToIsCurrentPrimaryResident];
LABEL_9:
}

- (void)refreshMonitor
{
  id v3 = [(HMDPrimaryResidentChangeMonitor *)self confirmedPrimaryResidentDevice];
  [(HMDPrimaryResidentChangeMonitor *)self refreshCurrentDevicePrimaryResidentWithDevice:v3];
  [(HMDPrimaryResidentChangeMonitor *)self refreshConfirmedPrimaryResidentDeviceIdentifierWithDevice:v3];
  [(HMDPrimaryResidentChangeMonitor *)self refreshHasResidentDevices];
}

- (void)registerForNotificationsWithHome:(id)a3
{
  id v4 = a3;
  id v6 = [(HMDPrimaryResidentChangeMonitor *)self notificationCenter];
  [v6 addObserver:self selector:sel_handlePrimaryResidentChangedNotification_ name:@"HMDResidentDeviceManagerAddResidentNotification" object:0];
  [v6 addObserver:self selector:sel_handlePrimaryResidentChangedNotification_ name:@"HMDResidentDeviceManagerRemoveResidentNotification" object:0];
  [v6 addObserver:self selector:sel_handlePrimaryResidentChangedNotification_ name:@"HMDResidentDeviceConfirmedStateChangedNotification" object:0];
  [v6 addObserver:self selector:sel_handlePrimaryResidentChangedNotification_ name:@"HMDResidentDeviceManagerUpdateResidentNotification" object:0];
  char v5 = [v4 residentDeviceManager];

  [v6 addObserver:self selector:sel_handlePrimaryResidentChangedNotification_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:v5];
}

- (void)configureWithHome:(id)a3
{
  [(HMDPrimaryResidentChangeMonitor *)self registerForNotificationsWithHome:a3];
  [(HMDPrimaryResidentChangeMonitor *)self refreshMonitor];
}

- (HMDPrimaryResidentChangeMonitor)initWithIdentifier:(id)a3 notificationCenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  int v9 = v8;
  if (!v8)
  {
LABEL_7:
    __int16 v14 = (void *)_HMFPreconditionFailure();
    return (HMDPrimaryResidentChangeMonitor *)+[HMDPrimaryResidentChangeMonitor logCategory];
  }
  v16.receiver = self;
  v16.super_class = (Class)HMDPrimaryResidentChangeMonitor;
  uint64_t v10 = [(HMDPrimaryResidentChangeMonitor *)&v16 init];
  __int16 v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, a3);
    objc_storeStrong((id *)&v11->_notificationCenter, a4);
    confirmedPrimaryResidentDeviceIdentifier = v11->_confirmedPrimaryResidentDeviceIdentifier;
    v11->_confirmedPrimaryResidentDeviceIdentifier = 0;
  }
  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_78590 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_78590, &__block_literal_global_78591);
  }
  v2 = (void *)logCategory__hmf_once_v8_78592;
  return v2;
}

uint64_t __46__HMDPrimaryResidentChangeMonitor_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v8_78592;
  logCategory__hmf_once_v8_78592 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end