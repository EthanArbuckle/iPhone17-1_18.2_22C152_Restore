@interface HDFitnessMachineDataCollector
- (HDFitnessMachineDataCollector)initWithFitnessMachineType:(unint64_t)a3 profile:(id)a4;
- (NSDate)machinePreferredUntilDate;
- (double)preferredAggregationIntervalForAggregator:(id)a3;
- (id)identifierForDataAggregator:(id)a3;
- (id)sourceForDataAggregator:(id)a3;
- (void)addObserver:(id)a3;
- (void)dataAggregator:(id)a3 wantsCollectionWithConfiguration:(id)a4;
- (void)handleDataCharacteristic:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setMachineBrand:(id)a3;
- (void)setMachinePreferredUntilDate:(id)a3;
- (void)setMachineStartDate:(id)a3;
- (void)tearDown;
- (void)unitTest_processDatumsByMetric:(id)a3;
@end

@implementation HDFitnessMachineDataCollector

- (HDFitnessMachineDataCollector)initWithFitnessMachineType:(unint64_t)a3 profile:(id)a4
{
  id v6 = a4;
  v33.receiver = self;
  v33.super_class = (Class)HDFitnessMachineDataCollector;
  v7 = [(HDFitnessMachineDataCollector *)&v33 init];
  v8 = v7;
  if (v7)
  {
    v7->_fitnessMachineType = a3;
    objc_storeWeak((id *)&v7->_profile, v6);
    uint64_t v9 = +[NSMapTable strongToWeakObjectsMapTable];
    aggregators = v8->_aggregators;
    v8->_aggregators = (NSMapTable *)v9;

    uint64_t v11 = HKCreateSerialDispatchQueue();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    previousDatums = v8->_previousDatums;
    v8->_previousDatums = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    previousWorkoutMetrics = v8->_previousWorkoutMetrics;
    v8->_previousWorkoutMetrics = v15;

    approximatedStartDate = v8->_approximatedStartDate;
    v8->_approximatedStartDate = 0;

    lastDatumsDate = v8->_lastDatumsDate;
    v8->_lastDatumsDate = 0;

    v19 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    bufferedCharacteristics = v8->_bufferedCharacteristics;
    v8->_bufferedCharacteristics = v19;

    sub_3B9BC((uint64_t)v8);
    v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    bufferedMetrics = v8->_bufferedMetrics;
    v8->_bufferedMetrics = v21;

    if (+[CMFitnessMachine isAvailable])
    {
      v23 = (CMFitnessMachine *)objc_alloc_init((Class)CMFitnessMachine);
      cmFitnessMachine = v8->_cmFitnessMachine;
      v8->_cmFitnessMachine = v23;
    }
    v25 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned];
    v26 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierAppleExerciseTime];
    uint64_t v27 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v25, v26, 0);
    localDevicePreferredObjectTypes = v8->_localDevicePreferredObjectTypes;
    v8->_localDevicePreferredObjectTypes = (NSSet *)v27;

    id v29 = objc_alloc((Class)HKObserverSet);
    v30 = (HKObserverSet *)[v29 initWithName:@"fitness-machine-metrics-observer" loggingCategory:HKLogDataCollection];
    metricsCollectorObservers = v8->_metricsCollectorObservers;
    v8->_metricsCollectorObservers = v30;
  }
  return v8;
}

- (void)setMachineBrand:(id)a3
{
  id v4 = a3;
  v5 = (NSString *)[v4 copy];
  machineBrand = self->_machineBrand;
  self->_machineBrand = v5;

  id v7 = objc_alloc((Class)HKDevice);
  v8 = (HKDevice *)[v7 initWithName:v4 manufacturer:v4 model:0 hardwareVersion:0 firmwareVersion:0 softwareVersion:0 localIdentifier:HKDeviceConnectedGymIdentifier UDIDeviceIdentifier:0];

  device = self->_device;
  self->_device = v8;

  v10 = self->_device;
  unint64_t fitnessMachineType = self->_fitnessMachineType;

  [(HKDevice *)v10 _setFitnessMachineType:fitnessMachineType];
}

- (void)setMachineStartDate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_3BCA4;
  v7[3] = &unk_608E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setMachinePreferredUntilDate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_3BE90;
  v7[3] = &unk_608E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)tearDown
{
  v3 = HKSupportedMetricsForMachineType();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [(NSMapTable *)self->_aggregators objectForKey:*(void *)(*((void *)&v9 + 1) + 8 * (void)v7)];
        [v8 unregisterDataCollector:self];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)handleDataCharacteristic:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_3C048;
  v7[3] = &unk_608E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)dataAggregator:(id)a3 wantsCollectionWithConfiguration:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_3D838;
  v8[3] = &unk_608E8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (id)sourceForDataAggregator:(id)a3
{
  return +[HKSource _connectedGymSource];
}

- (id)identifierForDataAggregator:(id)a3
{
  return @"HDFitnessMachineDataCollector";
}

- (double)preferredAggregationIntervalForAggregator:(id)a3
{
  return 0.0;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_3D964;
  v7[3] = &unk_608E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
  sub_3D970((uint64_t)self);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_3DA84;
  v7[3] = &unk_608E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)unitTest_processDatumsByMetric:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_3DD98;
  v7[3] = &unk_608E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (NSDate)machinePreferredUntilDate
{
  return self->_machinePreferredUntilDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machinePreferredUntilDate, 0);
  objc_storeStrong((id *)&self->_metricsCollectorObservers, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_cmFitnessMachine, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_machineBrand, 0);
  objc_storeStrong((id *)&self->_bufferedMetrics, 0);
  objc_storeStrong((id *)&self->_localDevicePreferredObjectTypes, 0);
  objc_storeStrong((id *)&self->_bufferedCharacteristics, 0);
  objc_storeStrong((id *)&self->_lastDatumsDate, 0);
  objc_storeStrong((id *)&self->_approximatedStartDate, 0);
  objc_storeStrong((id *)&self->_previousWorkoutMetrics, 0);
  objc_storeStrong((id *)&self->_previousDatums, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_aggregators, 0);
}

@end