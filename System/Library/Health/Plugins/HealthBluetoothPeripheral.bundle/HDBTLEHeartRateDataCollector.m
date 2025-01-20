@interface HDBTLEHeartRateDataCollector
+ (id)observedType;
- (BOOL)canResumeCollectionFromLastSensorDatum;
- (BOOL)disabled;
- (Class)sensorDatumClassForAggregator:(id)a3;
- (HDBTLEHeartRateDataCollector)initWithProfile:(id)a3;
- (NSString)description;
- (id)dataCollectorDiagnosticDescription;
- (id)identifierForDataAggregator:(id)a3;
- (id)sourceForDataAggregator:(id)a3;
- (void)dataAggregator:(id)a3 wantsCollectionWithConfiguration:(id)a4;
- (void)setDisabled:(BOOL)a3;
- (void)startOneShotCollectionForService:(id)a3;
- (void)updateHistoricalDataForcedUpdate:(BOOL)a3 completion:(id)a4;
- (void)updateHistoricalDataWithCompletion:(id)a3;
@end

@implementation HDBTLEHeartRateDataCollector

- (HDBTLEHeartRateDataCollector)initWithProfile:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDBTLEHeartRateDataCollector;
  v5 = [(HDBTLEHeartRateDataCollector *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v6->_state = 0;
    v9 = v6->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_B51C;
    block[3] = &unk_60820;
    v12 = v6;
    dispatch_async(v9, block);
    objc_storeStrong(&qword_75E50, v6);
  }
  return v6;
}

- (void)startOneShotCollectionForService:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_C21C;
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
  v8[2] = sub_CC24;
  v8[3] = &unk_608E8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (id)sourceForDataAggregator:(id)a3
{
  return +[HKSource _localDeviceSource];
}

- (id)identifierForDataAggregator:(id)a3
{
  return @"HDBTLEHeartRateDataCollector";
}

- (Class)sensorDatumClassForAggregator:(id)a3
{
  return (Class)objc_opt_class();
}

- (BOOL)canResumeCollectionFromLastSensorDatum
{
  return 0;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  unint64_t state = self->_state;
  if (state > 2) {
    CFStringRef v5 = @"Unknown";
  }
  else {
    CFStringRef v5 = off_60B20[state];
  }
  return +[NSString stringWithFormat:@"<%@:%p %@>", v3, self, v5];
}

- (id)dataCollectorDiagnosticDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)updateHistoricalDataForcedUpdate:(BOOL)a3 completion:(id)a4
{
}

- (void)updateHistoricalDataWithCompletion:(id)a3
{
}

+ (id)observedType
{
  return +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
}

- (BOOL)disabled
{
  return self->disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->disabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedService, 0);
  objc_storeStrong((id *)&self->_pendingSessions, 0);
  objc_storeStrong((id *)&self->_oneShotServices, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end