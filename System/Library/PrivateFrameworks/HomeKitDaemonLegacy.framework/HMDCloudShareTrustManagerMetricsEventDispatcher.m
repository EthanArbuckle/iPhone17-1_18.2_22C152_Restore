@interface HMDCloudShareTrustManagerMetricsEventDispatcher
+ (id)logCategory;
- (BOOL)registered;
- (HMDCloudShareTrustManagerMetricsEventDispatcher)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4 dailyScheduler:(id)a5 dataSource:(id)a6;
- (HMDCloudShareTrustManagerMetricsEventDispatcherDataSource)dataSource;
- (HMDLogEventDailyScheduler)dailyScheduler;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSUUID)identifier;
- (id)logIdentifier;
- (void)registerForDailyTrustManagerEvents;
- (void)setRegistered:(BOOL)a3;
- (void)submitCloudShareTrustStatusDailyEvent;
- (void)submitFailureEventWithEventErrorCode:(int64_t)a3;
- (void)submitFailureEventWithEventErrorCode:(int64_t)a3 error:(id)a4;
- (void)submitTrustActivityEvent:(int64_t)a3;
- (void)submitTrustZoneCreatedEvent;
- (void)submitTrustZoneRemovedEvent;
@end

@implementation HMDCloudShareTrustManagerMetricsEventDispatcher

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_dailyScheduler, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (BOOL)registered
{
  return self->_registered;
}

- (HMDCloudShareTrustManagerMetricsEventDispatcherDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDCloudShareTrustManagerMetricsEventDispatcherDataSource *)WeakRetained;
}

- (HMDLogEventDailyScheduler)dailyScheduler
{
  return (HMDLogEventDailyScheduler *)objc_getProperty(self, a2, 32, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDCloudShareTrustManagerMetricsEventDispatcher *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)submitCloudShareTrustStatusDailyEvent
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCloudShareTrustManagerMetricsEventDispatcher *)self dataSource];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 homeForCloudShareTrustManagerMetricsEventDispatcher:self];
    int v6 = [v4 isFromOwnerForCloudShareTrustManagerMetricsEventDispatcher:self];
    uint64_t v7 = [v4 trustConfigureStateForCloudShareTrustManagerMetricsEventDispatcher:self];
    if (v6)
    {
      uint64_t v8 = [v5 isCurrentDeviceConfirmedPrimaryResident];
      long long v23 = 0u;
      long long v24 = 0u;
      *(_OWORD *)buf = 0u;
      long long v22 = 0u;
      [v4 trustStatusCountsForCloudShareTrustManagerMetricsEventDispatcher:self];
      v9 = [HMDUserCloudShareOwnerAdoptionDailyEvent alloc];
      v20[0] = *(_OWORD *)buf;
      v20[1] = v22;
      v20[2] = v23;
      v20[3] = v24;
      v10 = [(HMDUserCloudShareOwnerAdoptionDailyEvent *)v9 initWithConfigureState:v7 isPrimaryResident:v8 trustStatusCounts:v20];
    }
    else
    {
      v15 = [v5 owner];
      v16 = [v15 cloudShareID];
      BOOL v17 = v16 != 0;

      v10 = [[HMDUserCloudShareParticipantAdoptionDailyEvent alloc] initWithConfigureState:v7 hasOwnerCloudShareID:v17];
    }
    v18 = v10;
    v19 = [(HMDCloudShareTrustManagerMetricsEventDispatcher *)self logEventSubmitter];
    [v19 submitLogEvent:v18];
  }
  else
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to submit daily trust status event due to no data source", buf, 0xCu);
    }
  }
}

- (void)submitFailureEventWithEventErrorCode:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11];
  }
  id v9 = v6;
  uint64_t v7 = [[HMDCloudShareTrustManagerFailureLogEvent alloc] initWithTrustManagerErrorCode:a3 error:v6];
  uint64_t v8 = [(HMDCloudShareTrustManagerMetricsEventDispatcher *)self logEventSubmitter];
  [v8 submitLogEvent:v7];
}

- (void)submitFailureEventWithEventErrorCode:(int64_t)a3
{
}

- (void)submitTrustActivityEvent:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = [(HMDCloudShareTrustManagerMetricsEventDispatcher *)self dataSource];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 homeForCloudShareTrustManagerMetricsEventDispatcher:self];
    uint64_t v8 = [v7 currentUser];
    id v9 = v8;
    if (v8) {
      uint64_t v10 = [v8 privilege];
    }
    else {
      uint64_t v10 = 2;
    }
    v15 = -[HMDCloudShareTrustManagerTrustActivityLogEvent initWithTrustActivityType:privilege:isPrimaryResident:]([HMDCloudShareTrustManagerTrustActivityLogEvent alloc], "initWithTrustActivityType:privilege:isPrimaryResident:", a3, v10, [v7 isCurrentDeviceConfirmedPrimaryResident]);
    v16 = [(HMDCloudShareTrustManagerMetricsEventDispatcher *)self logEventSubmitter];
    [v16 submitLogEvent:v15];
  }
  else
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v17 = 138543362;
      v18 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to submit daily trust status event due to no data source", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)submitTrustZoneRemovedEvent
{
}

- (void)submitTrustZoneCreatedEvent
{
}

- (void)registerForDailyTrustManagerEvents
{
  id v3 = [(HMDCloudShareTrustManagerMetricsEventDispatcher *)self dailyScheduler];
  [v3 registerDailyTaskRunner:self];
}

- (HMDCloudShareTrustManagerMetricsEventDispatcher)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4 dailyScheduler:(id)a5 dataSource:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDCloudShareTrustManagerMetricsEventDispatcher;
  v15 = [(HMDCloudShareTrustManagerMetricsEventDispatcher *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_logEventSubmitter, a4);
    objc_storeStrong((id *)&v16->_dailyScheduler, a5);
    objc_storeWeak((id *)&v16->_dataSource, v14);
  }

  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2 != -1) {
    dispatch_once(&logCategory__hmf_once_t2, &__block_literal_global_5971);
  }
  v2 = (void *)logCategory__hmf_once_v3;
  return v2;
}

uint64_t __62__HMDCloudShareTrustManagerMetricsEventDispatcher_logCategory__block_invoke()
{
  logCategory__hmf_once_id v3 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

@end