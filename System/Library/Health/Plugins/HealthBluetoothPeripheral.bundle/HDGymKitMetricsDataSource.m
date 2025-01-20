@interface HDGymKitMetricsDataSource
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (HDGymKitMetricsDataSource)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (HKDataFlowLink)workoutDataFlowLink;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_startObservingMetrics;
- (void)dealloc;
- (void)metricsCollector:(id)a3 didCollectMetrics:(id)a4;
- (void)remote_startTaskServerIfNeeded;
- (void)workoutDataDestination:(id)a3 requestsDataFrom:(id)a4 to:(id)a5;
- (void)workoutDataDestination:(id)a3 requestsFinalDataFrom:(id)a4 to:(id)a5 completion:(id)a6;
@end

@implementation HDGymKitMetricsDataSource

- (HDGymKitMetricsDataSource)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  v15.receiver = self;
  v15.super_class = (Class)HDGymKitMetricsDataSource;
  v6 = [(HDGymKitMetricsDataSource *)&v15 initWithUUID:a3 configuration:a4 client:a5 delegate:a6];
  if (v6)
  {
    _HKInitializeLogging();
    id v7 = objc_alloc((Class)HKDataFlowLink);
    v8 = (HKDataFlowLink *)[v7 initWithProcessor:v6 sourceProtocol:&OBJC_PROTOCOL___HDWorkoutDataSource destinationProtocol:&OBJC_PROTOCOL___HDWorkoutDataDestination loggingCategory:HKLogWorkouts];
    workoutDataFlowLink = v6->_workoutDataFlowLink;
    v6->_workoutDataFlowLink = v8;

    v10 = (NSLock *)objc_alloc_init((Class)NSLock);
    lock = v6->_lock;
    v6->_lock = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    accumulatedMetadata = v6->_accumulatedMetadata;
    v6->_accumulatedMetadata = v12;
  }
  return v6;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  sub_297E8(self);
  v4.receiver = self;
  v4.super_class = (Class)HDGymKitMetricsDataSource;
  [(HDGymKitMetricsDataSource *)&v4 dealloc];
}

+ (id)taskIdentifier
{
  return _HKGymKitMetricsDataSourceServerIdentifier;
}

+ (id)requiredEntitlements
{
  uint64_t v4 = HKPrivateHealthKitEntitlement;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (HKDataFlowLink)workoutDataFlowLink
{
  return self->_workoutDataFlowLink;
}

- (void)workoutDataDestination:(id)a3 requestsDataFrom:(id)a4 to:(id)a5
{
  lock = self->_lock;
  id v7 = a3;
  [(NSLock *)lock lock];
  id v8 = [(NSMutableDictionary *)self->_accumulatedMetadata copy];
  [(NSLock *)self->_lock unlock];
  [v7 addMetadata:v8 dataSource:self];
}

- (void)workoutDataDestination:(id)a3 requestsFinalDataFrom:(id)a4 to:(id)a5 completion:(id)a6
{
  v10 = (void (**)(id, uint64_t, void))a6;
  [(HDGymKitMetricsDataSource *)self workoutDataDestination:a3 requestsDataFrom:a4 to:a5];
  v10[2](v10, 1, 0);
}

- (id)exportedInterface
{
  return +[HKGymKitMetricsDataSource serverInterface];
}

- (id)remoteInterface
{
  return +[HKGymKitMetricsDataSource clientInterface];
}

- (void)remote_startTaskServerIfNeeded
{
  [(HDGymKitMetricsDataSource *)self _startObservingMetrics];
  id v5 = +[NSNotificationCenter defaultCenter];
  v3 = [(HDGymKitMetricsDataSource *)self profile];
  uint64_t v4 = [v3 fitnessMachineManager];
  [v5 addObserver:self selector:"_startObservingMetrics" name:@"HDFitnessMachineMetricsCollectorDidChangeNotification" object:v4];
}

- (void)metricsCollector:(id)a3 didCollectMetrics:(id)a4
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_29CA8;
  v17[3] = &unk_613E8;
  v17[4] = self;
  id v5 = a4;
  v6 = [(HDGymKitMetricsDataSource *)self remoteObjectProxyWithErrorHandler:v17];
  objc_msgSend(v6, "clientRemote_didReceiveMetrics:", v5);
  id v7 = sub_29D10((uint64_t)self, v5);

  lock = self->_lock;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_29ECC;
  v15[3] = &unk_608E8;
  v15[4] = self;
  id v9 = v7;
  id v16 = v9;
  [(NSLock *)lock hk_withLock:v15];
  workoutDataFlowLink = self->_workoutDataFlowLink;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_29EE0;
  v12[3] = &unk_61260;
  id v13 = v9;
  v14 = self;
  id v11 = v9;
  [(HKDataFlowLink *)workoutDataFlowLink sendToDestinationProcessors:v12];
}

- (void)_startObservingMetrics
{
  v3 = [(HDGymKitMetricsDataSource *)self profile];
  uint64_t v4 = [v3 fitnessMachineManager];
  id v5 = [v4 metricsCollector];

  [v5 addObserver:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accumulatedMetadata, 0);
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_workoutDataFlowLink, 0);
}

@end