@interface HMDHouseholdMetricsManager
+ (id)logCategory;
- (HMDHouseholdMetricsClient)client;
- (HMDHouseholdMetricsManager)initWithCountersManager:(id)a3 dataSource:(id)a4 accessoryDetailsManager:(id)a5 metricsHomeDataChangedManager:(id)a6 dailyScheduler:(id)a7 logEventSubmitter:(id)a8 dateProvider:(id)a9 activityContributors:(id)a10;
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
    uint64_t v23 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"810360B7-987E-4A25-BEC7-9CC06CDDA0F2"];
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

- (HMDHouseholdMetricsManager)initWithCountersManager:(id)a3 dataSource:(id)a4 accessoryDetailsManager:(id)a5 metricsHomeDataChangedManager:(id)a6 dailyScheduler:(id)a7 logEventSubmitter:(id)a8 dateProvider:(id)a9 activityContributors:(id)a10
{
  v50[5] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v40 = a6;
  id v17 = a9;
  id v18 = a10;
  id v44 = a8;
  id v43 = a7;
  id v19 = a5;
  v48 = v15;
  objc_super v46 = v17;
  id v20 = [[HMDHouseholdMetricsRequestContributor alloc] initWithCountersManager:v15 dateProvider:v17];
  v21 = [MEMORY[0x263EFF980] arrayWithArray:v18];

  v42 = v20;
  [v21 addObject:v20];
  v39 = (void *)MEMORY[0x263EFF9A0];
  v49[0] = @"householdData";
  v22 = [HMDHouseholdActivityLogEventFactory alloc];
  v41 = v21;
  uint64_t v23 = (void *)[v21 copy];
  v24 = [(HMDHouseholdActivityLogEventFactory *)v22 initWithContributors:v23];
  v50[0] = v24;
  v49[1] = @"siriEndpointEnablement";
  v25 = [[HMDSiriEndpointEnablementLogEventFactory alloc] initWithDataSource:v16];
  v50[1] = v25;
  v49[2] = @"networkStability";
  v26 = [HMDHouseholdNetworkStabilityLogEventFactory alloc];
  id v27 = [v16 networkObserver];
  v28 = [(HMDHouseholdNetworkStabilityLogEventFactory *)v26 initWithNetworkObserver:v27];
  v50[2] = v28;
  v49[3] = @"threadNetworkStability";
  v29 = [HMDHouseholdThreadNetworkStabilityLogEventFactory alloc];
  v47 = v16;
  id v30 = [v16 threadNetworkObserver];
  id v31 = [(HMDHouseholdThreadNetworkStabilityLogEventFactory *)v29 initWithThreadNetworkObserver:v30];
  v50[3] = v31;
  v49[4] = @"accessoryCategoriesKey";
  id v32 = [v19 householdMetricsLogEventFactory];

  v50[4] = v32;
  id v33 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:5];
  id v34 = [v39 dictionaryWithDictionary:v33];

  if (isInternalBuild())
  {
    v35 = [v40 householdMetricsLogEventFactory];
    [v34 setObject:v35 forKeyedSubscript:@"homeDataChangedKey"];
  }
  dispatch_queue_t v36 = (void *)[v34 copy];
  v37 = [(HMDHouseholdMetricsManager *)self initWithCountersManager:v48 dataSource:v47 dailyScheduler:v43 logEventSubmitter:v44 dateProvider:v46 requestCountProvider:v42 logEventFactories:v36];

  return v37;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_111344 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_111344, &__block_literal_global_111345);
  }
  v2 = (void *)logCategory__hmf_once_v1_111346;
  return v2;
}

void __41__HMDHouseholdMetricsManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_111346;
  logCategory__hmf_once_v1_111346 = v0;
}

@end