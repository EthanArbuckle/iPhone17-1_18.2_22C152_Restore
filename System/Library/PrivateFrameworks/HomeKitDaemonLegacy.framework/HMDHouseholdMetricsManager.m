@interface HMDHouseholdMetricsManager
+ (id)logCategory;
- (HMDHouseholdMetricsClient)client;
- (HMDHouseholdMetricsManager)initWithCountersManager:(id)a3 dataSource:(id)a4 accessoryDetailsManager:(id)a5 dailyScheduler:(id)a6 logEventSubmitter:(id)a7 dateProvider:(id)a8 activityContributors:(id)a9;
- (HMDHouseholdMetricsManager)initWithCountersManager:(id)a3 dataSource:(id)a4 dailyScheduler:(id)a5 logEventSubmitter:(id)a6 dateProvider:(id)a7 requestCountProvider:(id)a8 logEventFactories:(id)a9;
- (HMDHouseholdMetricsMessagingProvider)messagingProvider;
- (HMDHouseholdMetricsServer)server;
- (HMMDateProvider)dateProvider;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)workQueue;
- (void)handleRequest:(id)a3;
- (void)runDailyTask;
- (void)runHomeutilTask;
@end

@implementation HMDHouseholdMetricsManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_messagingProvider, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDHouseholdMetricsMessagingProvider)messagingProvider
{
  return self->_messagingProvider;
}

- (HMDHouseholdMetricsServer)server
{
  return self->_server;
}

- (HMDHouseholdMetricsClient)client
{
  return self->_client;
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (void)runHomeutilTask
{
  v3 = [(HMDHouseholdMetricsManager *)self dateProvider];
  id v5 = [v3 startOfDayByAddingDayCount:0];

  v4 = [(HMDHouseholdMetricsManager *)self server];
  [v4 runHouseholdMetricsDataCollectionAssociatedToDate:v5 forceSubmit:1];
}

- (void)runDailyTask
{
  v3 = [(HMDHouseholdMetricsManager *)self dateProvider];
  id v6 = [v3 startOfDayByAddingDayCount:-1];

  v4 = [(HMDHouseholdMetricsManager *)self server];
  [v4 runHouseholdMetricsDataCollectionAssociatedToDate:v6 forceSubmit:0];

  id v5 = [(HMDHouseholdMetricsManager *)self client];
  [v5 deleteExpiredCounters];
}

- (void)handleRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHouseholdMetricsManager *)self client];
  [v5 handleRequest:v4];
}

- (HMDHouseholdMetricsManager)initWithCountersManager:(id)a3 dataSource:(id)a4 dailyScheduler:(id)a5 logEventSubmitter:(id)a6 dateProvider:(id)a7 requestCountProvider:(id)a8 logEventFactories:(id)a9
{
  id v45 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v46.receiver = self;
  v46.super_class = (Class)HMDHouseholdMetricsManager;
  v21 = [(HMDHouseholdMetricsManager *)&v46 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_dateProvider, a7);
    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"810360B7-987E-4A25-BEC7-9CC06CDDA0F2"];
    messageTargetUUID = v22->_messageTargetUUID;
    v22->_messageTargetUUID = (NSUUID *)v23;

    v25 = [[HMDHouseholdMetricsMessagingProvider alloc] initWithReceiver:v22];
    v44 = v16;
    messagingProvider = v22->_messagingProvider;
    v22->_messagingProvider = v25;

    HMDispatchQueueNameString();
    id v27 = objc_claimAutoreleasedReturnValue();
    v28 = (const char *)[v27 UTF8String];
    v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_attr_make_with_qos_class(v29, QOS_CLASS_BACKGROUND, 0);
    id v30 = v20;
    id v31 = v19;
    id v32 = v18;
    id v33 = v17;
    v35 = id v34 = v15;
    dispatch_queue_t v36 = dispatch_queue_create(v28, v35);
    workQueue = v22->_workQueue;
    v22->_workQueue = (OS_dispatch_queue *)v36;

    id v15 = v34;
    id v17 = v33;
    id v18 = v32;
    id v19 = v31;
    id v20 = v30;

    v38 = [[HMDHouseholdMetricsClient alloc] initWithCountersManager:v45 dateProvider:v18 remoteMessageDispatcher:v22->_messagingProvider requestCountProvider:v19 logEventFactories:v30];
    client = v22->_client;
    v22->_client = v38;

    id v16 = v44;
    v40 = [[HMDHouseholdMetricsServer alloc] initWithDataSource:v15 logEventSubmitter:v17 householdMetricsProvider:v22->_client remoteMessageDispatcher:v22->_messagingProvider logEventFactories:v20 workQueue:v22->_workQueue];
    server = v22->_server;
    v22->_server = v40;

    [v44 registerDailyTaskRunner:v22];
    v42 = v22;
  }

  return v22;
}

- (HMDHouseholdMetricsManager)initWithCountersManager:(id)a3 dataSource:(id)a4 accessoryDetailsManager:(id)a5 dailyScheduler:(id)a6 logEventSubmitter:(id)a7 dateProvider:(id)a8 activityContributors:(id)a9
{
  v44[5] = *MEMORY[0x1E4F143B8];
  id v15 = a9;
  id v38 = a8;
  id v41 = a7;
  id v40 = a6;
  id v16 = a5;
  id v17 = a4;
  id v37 = a3;
  dispatch_queue_t v36 = [[HMDHouseholdMetricsRequestContributor alloc] initWithCountersManager:v37 dateProvider:v38];
  id v18 = [MEMORY[0x1E4F1CA48] arrayWithArray:v15];

  v39 = v18;
  [v18 addObject:v36];
  id v34 = (void *)MEMORY[0x1E4F1CA60];
  v43[0] = @"householdData";
  id v19 = [HMDHouseholdActivityLogEventFactory alloc];
  v35 = (void *)[v18 copy];
  id v20 = [(HMDHouseholdActivityLogEventFactory *)v19 initWithContributors:v35];
  v44[0] = v20;
  v43[1] = @"siriEndpointEnablement";
  v21 = [[HMDSiriEndpointEnablementLogEventFactory alloc] initWithDataSource:v17];
  v44[1] = v21;
  v43[2] = @"networkStability";
  v22 = [HMDHouseholdNetworkStabilityLogEventFactory alloc];
  uint64_t v23 = [v17 networkObserver];
  v24 = [(HMDHouseholdNetworkStabilityLogEventFactory *)v22 initWithNetworkObserver:v23];
  v44[2] = v24;
  v43[3] = @"threadNetworkStability";
  v25 = [HMDHouseholdThreadNetworkStabilityLogEventFactory alloc];
  v26 = [v17 threadNetworkObserver];
  id v27 = [(HMDHouseholdThreadNetworkStabilityLogEventFactory *)v25 initWithThreadNetworkObserver:v26];
  v44[3] = v27;
  v43[4] = @"accessoryCategoriesKey";
  v28 = [v16 householdMetricsLogEventFactory];

  v44[4] = v28;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:5];
  id v30 = [v34 dictionaryWithDictionary:v29];

  id v31 = (void *)[v30 copy];
  id v32 = [(HMDHouseholdMetricsManager *)self initWithCountersManager:v37 dataSource:v17 dailyScheduler:v40 logEventSubmitter:v41 dateProvider:v38 requestCountProvider:v36 logEventFactories:v31];

  return v32;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_93884 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_93884, &__block_literal_global_93885);
  }
  v2 = (void *)logCategory__hmf_once_v1_93886;
  return v2;
}

uint64_t __41__HMDHouseholdMetricsManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_93886;
  logCategory__hmf_once_v1_93886 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end