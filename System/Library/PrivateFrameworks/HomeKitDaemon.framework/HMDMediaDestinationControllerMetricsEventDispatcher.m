@interface HMDMediaDestinationControllerMetricsEventDispatcher
+ (id)logCategory;
- (HMDMediaDestinationControllerMetricsEventDispatcher)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4 dataSource:(id)a5;
- (HMDMediaDestinationControllerMetricsEventDispatcherDataSource)dataSource;
- (HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent)trackedStagedDestinationIdentifierEvent;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSUUID)identifier;
- (id)dataSourceCurrentDestinationType;
- (id)dataSourceCurrentUser;
- (id)dataSourceCurrentUserPrivilege;
- (id)dataSourceDestinationTypeWithIdentifier:(id)a3;
- (id)dataSourceIsTriggeredOnControllerDevice;
- (id)logIdentifier;
- (void)setDataSource:(id)a3;
- (void)setTrackedStagedDestinationIdentifierEvent:(id)a3;
- (void)startStagedDestinationIdentifierCommittedEventWithStagedDestinationIdentifier:(id)a3;
- (void)submitDailySetDestinationEvent;
- (void)submitFailureEventWithEventErrorCode:(unint64_t)a3 error:(id)a4;
- (void)submitReceivedUpdateDestinationRequestMessageEventWithDestinationIdentifier:(id)a3 existingDestinationIdentifier:(id)a4;
- (void)submitStagedDestinationIdentifierCommittedEventWithCommittedDestinationIdentifier:(id)a3;
- (void)submitTransactionUpdatedDestinationEventWithDestinationIdentifier:(id)a3 existingDestinationIdentifier:(id)a4;
@end

@implementation HMDMediaDestinationControllerMetricsEventDispatcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedStagedDestinationIdentifierEvent, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)setTrackedStagedDestinationIdentifierEvent:(id)a3
{
}

- (HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent)trackedStagedDestinationIdentifierEvent
{
  return (HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent *)objc_getProperty(self, a2, 40, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDMediaDestinationControllerMetricsEventDispatcherDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDMediaDestinationControllerMetricsEventDispatcherDataSource *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)dataSourceIsTriggeredOnControllerDevice
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)self dataSource];
  v4 = v3;
  if (v3)
  {
    [v3 isTriggeredOnControllerDeviceForMediaDestinationControllerMetricsEventDispatcher:self];
    HMFBooleanToString();
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get is triggered on controller device due to no data source", (uint8_t *)&v11, 0xCu);
    }
    v5 = @"NotSet";
  }

  return v5;
}

- (id)dataSourceDestinationTypeWithIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)self dataSource];
    v6 = v5;
    if (v5)
    {
      [v5 mediaDestinationControllerMetricsEventDispatcher:self destinationTypeForDestinationWithIdentifier:v4];
    }
    else
    {
      v8 = (void *)MEMORY[0x230FBD990]();
      v9 = self;
      v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = HMFGetLogIdentifier();
        int v13 = 138543362;
        v14 = v11;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination type due to no data source", (uint8_t *)&v13, 0xCu);
      }
    }
    HMMediaDestinationTypeAsString();
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = @"NotSet";
  }

  return v7;
}

- (id)dataSourceCurrentDestinationType
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)self dataSource];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 currentDestinationTypeForMediaDestinationControllerMetricsEventDispatcher:self];
    v6 = v5;
    if (v5)
    {
      [v5 integerValue];
      HMMediaDestinationTypeAsString();
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = @"NotSet";
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get current destination type due to no data source", (uint8_t *)&v13, 0xCu);
    }
    HMMediaDestinationTypeAsString();
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)dataSourceCurrentUser
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)self dataSource];
  id v4 = [v3 currentUserForMediaDestinationControllerMetricsEventDispatcher:self];
  if (!v4)
  {
    v5 = (void *)MEMORY[0x230FBD990]();
    v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      int v11 = v8;
      __int16 v12 = 2112;
      int v13 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to get current user from data source: %@", (uint8_t *)&v10, 0x16u);
    }
  }

  return v4;
}

- (id)dataSourceCurrentUserPrivilege
{
  v2 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)self dataSourceCurrentUser];
  v3 = v2;
  if (v2)
  {
    unint64_t v4 = [v2 privilege];
    if (v4 > 5) {
      v5 = @"None";
    }
    else {
      v5 = off_264A29920[v4];
    }
    v6 = v5;
  }
  else
  {
    v6 = @"NotSet";
  }

  return v6;
}

- (void)submitDailySetDestinationEvent
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  unint64_t v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v20 = 138543362;
    v21 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Submitting daily set destination event", (uint8_t *)&v20, 0xCu);
  }
  v7 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)v4 dataSource];
  v8 = v7;
  if (!v7)
  {
    __int16 v12 = (void *)MEMORY[0x230FBD990]();
    int v13 = v4;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v20 = 138543362;
      v21 = v15;
      v16 = "%{public}@Failed to submit daily set destination event due to no data source";
      v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      uint32_t v19 = 12;
LABEL_10:
      _os_log_impl(&dword_22F52A000, v17, v18, v16, (uint8_t *)&v20, v19);
    }
LABEL_11:

    goto LABEL_12;
  }
  if (([v7 isTriggeredOnControllerDeviceForMediaDestinationControllerMetricsEventDispatcher:v4] & 1) == 0)
  {
    __int16 v12 = (void *)MEMORY[0x230FBD990]();
    int v13 = v4;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v20 = 138543618;
      v21 = v15;
      __int16 v22 = 2112;
      v23 = v8;
      v16 = "%{public}@Skipping daily set destination event due to event not triggered on the controller provided by data source: %@";
      v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_INFO;
      uint32_t v19 = 22;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v9 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)v4 dataSourceCurrentDestinationType];
  int v10 = [[HMDMediaDestinationControllerDailySetDestinationEvent alloc] initWithExistingDestinationType:v9];
  int v11 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)v4 logEventSubmitter];
  [v11 submitLogEvent:v10];

LABEL_12:
}

- (void)submitStagedDestinationIdentifierCommittedEventWithCommittedDestinationIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  v5 = self->_trackedStagedDestinationIdentifierEvent;
  v6 = v5;
  if (v5
    && ([(HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent *)v5 stagedDestinationIdentifier], v7 = objc_claimAutoreleasedReturnValue(), char v8 = HMFEqualObjects(), v7, (v8 & 1) != 0))
  {
    trackedStagedDestinationIdentifierEvent = self->_trackedStagedDestinationIdentifierEvent;
    self->_trackedStagedDestinationIdentifierEvent = 0;

    os_unfair_lock_unlock(&self->_lock);
    int v10 = (void *)MEMORY[0x230FBD990]();
    int v11 = self;
    __int16 v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = HMFGetLogIdentifier();
      int v19 = 138543618;
      int v20 = v13;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@submitting staged destination identifier committed event with committed destination identifier: %@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v14 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)v11 logEventSubmitter];
    [v14 submitLogEvent:v6];
  }
  else
  {

    os_unfair_lock_unlock(&self->_lock);
    uint64_t v15 = (void *)MEMORY[0x230FBD990]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      os_log_type_t v18 = HMFGetLogIdentifier();
      int v19 = 138543362;
      int v20 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Skipping staged destination identifier committed event due to out-dated information", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)startStagedDestinationIdentifierCommittedEventWithStagedDestinationIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    char v8 = HMFGetLogIdentifier();
    int v13 = 138543618;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Tracking staged destination identifier: %@", (uint8_t *)&v13, 0x16u);
  }
  v9 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)v6 dataSourceIsTriggeredOnControllerDevice];
  int v10 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)v6 dataSourceCurrentUserPrivilege];
  int v11 = [[HMDMediaDestinationControllerStagedDestinationIdentifierCommittedEvent alloc] initWithStagedDestinationIdentifier:v4 isTriggeredOnControllerDevice:v9 userPrivilege:v10];
  os_unfair_lock_lock_with_options();
  trackedStagedDestinationIdentifierEvent = v6->_trackedStagedDestinationIdentifierEvent;
  v6->_trackedStagedDestinationIdentifierEvent = v11;

  os_unfair_lock_unlock(&v6->_lock);
}

- (void)submitFailureEventWithEventErrorCode:(unint64_t)a3 error:(id)a4
{
  id v6 = a4;
  if (a3 > 0xB) {
    v7 = @"unknown";
  }
  else {
    v7 = off_264A1BA50[a3];
  }
  id v16 = v7;
  char v8 = NSString;
  v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "code"));
  int v10 = [v8 stringWithFormat:@"%@", v9];

  int v11 = [v6 domain];

  __int16 v12 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)self dataSourceIsTriggeredOnControllerDevice];
  int v13 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)self dataSourceCurrentUserPrivilege];
  uint64_t v14 = [[HMDMediaDestinationControllerFailureLogEvent alloc] initWithDestinationControllerErrorCode:v16 errorCode:v10 errorDomain:v11 isTriggeredOnControllerDevice:v12 userPrivilege:v13];
  __int16 v15 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)self logEventSubmitter];
  [v15 submitLogEvent:v14];
}

- (void)submitTransactionUpdatedDestinationEventWithDestinationIdentifier:(id)a3 existingDestinationIdentifier:(id)a4
{
  id v6 = a3;
  id v12 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)self dataSourceDestinationTypeWithIdentifier:a4];
  v7 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)self dataSourceDestinationTypeWithIdentifier:v6];

  char v8 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)self dataSourceIsTriggeredOnControllerDevice];
  v9 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)self dataSourceCurrentUserPrivilege];
  int v10 = [[HMDMediaDestinationControllerTransactionUpdatedDestinationLogEvent alloc] initWithExistingDestinationType:v12 destinationType:v7 isTriggeredOnControllerDevice:v8 userPrivilege:v9];
  int v11 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)self logEventSubmitter];
  [v11 submitLogEvent:v10];
}

- (void)submitReceivedUpdateDestinationRequestMessageEventWithDestinationIdentifier:(id)a3 existingDestinationIdentifier:(id)a4
{
  id v6 = a3;
  id v12 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)self dataSourceDestinationTypeWithIdentifier:a4];
  v7 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)self dataSourceDestinationTypeWithIdentifier:v6];

  char v8 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)self dataSourceIsTriggeredOnControllerDevice];
  v9 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)self dataSourceCurrentUserPrivilege];
  int v10 = [[HMDMediaDestinationControllerReceivedUpdateDestinationRequestMessageLogEvent alloc] initWithExistingDestinationType:v12 destinationType:v7 isTriggeredOnControllerDevice:v8 userPrivilege:v9];
  int v11 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)self logEventSubmitter];
  [v11 submitLogEvent:v10];
}

- (HMDMediaDestinationControllerMetricsEventDispatcher)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4 dataSource:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDMediaDestinationControllerMetricsEventDispatcher;
  id v12 = [(HMDMediaDestinationControllerMetricsEventDispatcher *)&v15 init];
  int v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_logEventSubmitter, a4);
    objc_storeWeak((id *)&v13->_dataSource, v11);
  }

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12_62149 != -1) {
    dispatch_once(&logCategory__hmf_once_t12_62149, &__block_literal_global_62150);
  }
  v2 = (void *)logCategory__hmf_once_v13_62151;
  return v2;
}

void __66__HMDMediaDestinationControllerMetricsEventDispatcher_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v13_62151;
  logCategory__hmf_once_v13_62151 = v0;
}

@end