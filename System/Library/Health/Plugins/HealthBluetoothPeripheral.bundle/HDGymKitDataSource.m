@interface HDGymKitDataSource
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (HDGymKitDataSource)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (HDWorkoutDataAccumulator)workoutDataAccumulator;
- (HKDataFlowLink)workoutDataFlowLink;
- (id)exportedInterface;
- (id)quantityTypesToIncludeWhilePaused;
- (id)remoteInterface;
- (unint64_t)workoutDataDestinationState;
- (void)addMetadata:(id)a3 dataSource:(id)a4;
- (void)addOtherSamples:(id)a3 dataSource:(id)a4;
- (void)addQuantities:(id)a3 dataSource:(id)a4;
- (void)addWorkoutEvents:(id)a3 dataSource:(id)a4;
- (void)connectionInvalidated;
- (void)remote_setDataSourceConfiguration:(id)a3;
- (void)remote_synchronizeWithCompletion:(id)a3;
- (void)workoutDataDestination:(id)a3 didUpdateConfiguration:(id)a4;
- (void)workoutDataDestination:(id)a3 requestsDataFrom:(id)a4 to:(id)a5;
- (void)workoutDataDestination:(id)a3 requestsFinalDataFrom:(id)a4 to:(id)a5 completion:(id)a6;
@end

@implementation HDGymKitDataSource

- (HDGymKitDataSource)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  v26.receiver = self;
  v26.super_class = (Class)HDGymKitDataSource;
  v13 = [(HDGymKitDataSource *)&v26 initWithUUID:a3 configuration:v11 client:v12 delegate:a6];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_dataSourceConfiguration, a4);
    id v15 = objc_alloc((Class)HDWorkoutBasicDataSource);
    v16 = [v11 workoutConfiguration];
    v17 = (HDWorkoutBasicDataSource *)[v15 initWithConfiguration:v16 client:v12];
    basicDataSource = v14->_basicDataSource;
    v14->_basicDataSource = v17;

    _HKInitializeLogging();
    id v19 = objc_alloc((Class)HKDataFlowLink);
    v20 = (HKDataFlowLink *)[v19 initWithProcessor:v14 sourceProtocol:&OBJC_PROTOCOL___HDWorkoutDataSource destinationProtocol:&OBJC_PROTOCOL___HDWorkoutDataDestination loggingCategory:HKLogWorkouts];
    workoutDataFlowLink = v14->_workoutDataFlowLink;
    v14->_workoutDataFlowLink = v20;

    v22 = v14->_workoutDataFlowLink;
    v23 = [(HDWorkoutBasicDataSource *)v14->_basicDataSource workoutDataFlowLink];
    [(HKDataFlowLink *)v22 addSource:v23];

    v24 = [v11 sampleTypesToCollect];
    [(HDWorkoutBasicDataSource *)v14->_basicDataSource setSampleTypesToCollect:v24];

    sub_1C63C((uint64_t)v14);
  }

  return v14;
}

+ (id)taskIdentifier
{
  return _HKGymKitDataSourceServerIdentifier;
}

+ (id)requiredEntitlements
{
  uint64_t v4 = HKPrivateHealthKitEntitlement;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (void)remote_setDataSourceConfiguration:(id)a3
{
  id v4 = [a3 sampleTypesToCollect];
  [(HDWorkoutBasicDataSource *)self->_basicDataSource setSampleTypesToCollect:v4];
}

- (void)remote_synchronizeWithCompletion:(id)a3
{
}

- (id)exportedInterface
{
  return +[HKGymKitDataSource serverInterface];
}

- (id)remoteInterface
{
  return +[HKGymKitDataSource clientInterface];
}

- (void)connectionInvalidated
{
}

- (HKDataFlowLink)workoutDataFlowLink
{
  return self->_workoutDataFlowLink;
}

- (void)workoutDataDestination:(id)a3 requestsDataFrom:(id)a4 to:(id)a5
{
}

- (void)workoutDataDestination:(id)a3 requestsFinalDataFrom:(id)a4 to:(id)a5 completion:(id)a6
{
}

- (void)workoutDataDestination:(id)a3 didUpdateConfiguration:(id)a4
{
}

- (id)quantityTypesToIncludeWhilePaused
{
  v3 = [(HDWorkoutBasicDataSource *)self->_basicDataSource sampleTypesToCollect];
  id v4 = objc_msgSend(v3, "hk_minus:", self->_localDevicePreferredTypes);

  return v4;
}

- (unint64_t)workoutDataDestinationState
{
  return 1;
}

- (void)addQuantities:(id)a3 dataSource:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1CB70;
  v10[3] = &unk_61238;
  v10[4] = self;
  v5 = objc_msgSend(a3, "hk_filter:", v10, a4);
  if ([v5 count])
  {
    workoutDataFlowLink = self->_workoutDataFlowLink;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1CE34;
    v7[3] = &unk_61260;
    id v8 = v5;
    v9 = self;
    [(HKDataFlowLink *)workoutDataFlowLink sendToDestinationProcessors:v7];
  }
}

- (void)addOtherSamples:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1CF4C;
  v11[3] = &unk_61288;
  v11[4] = self;
  v6 = objc_msgSend(v5, "hk_filter:", v11);
  if ([v6 count])
  {
    workoutDataFlowLink = self->_workoutDataFlowLink;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1CF54;
    v8[3] = &unk_61260;
    id v9 = v5;
    v10 = self;
    [(HKDataFlowLink *)workoutDataFlowLink sendToDestinationProcessors:v8];
  }
}

- (void)addWorkoutEvents:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  workoutDataFlowLink = self->_workoutDataFlowLink;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1D000;
  v8[3] = &unk_61260;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  [(HKDataFlowLink *)workoutDataFlowLink sendToDestinationProcessors:v8];
}

- (void)addMetadata:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  workoutDataFlowLink = self->_workoutDataFlowLink;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1D0AC;
  v8[3] = &unk_61260;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  [(HKDataFlowLink *)workoutDataFlowLink sendToDestinationProcessors:v8];
}

- (HDWorkoutDataAccumulator)workoutDataAccumulator
{
  v2 = [(HKDataFlowLink *)self->_workoutDataFlowLink destinationProcessorsConformingToProtocol:&OBJC_PROTOCOL___HDWorkoutDataAccumulator];
  v3 = [v2 firstObject];

  return (HDWorkoutDataAccumulator *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDevicePreferredTypes, 0);
  objc_storeStrong((id *)&self->_machineSourceTypes, 0);
  objc_storeStrong((id *)&self->_workoutDataFlowLink, 0);
  objc_storeStrong((id *)&self->_basicDataSource, 0);

  objc_storeStrong((id *)&self->_dataSourceConfiguration, 0);
}

@end