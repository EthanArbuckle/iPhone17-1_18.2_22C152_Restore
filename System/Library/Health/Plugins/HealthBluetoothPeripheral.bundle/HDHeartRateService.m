@interface HDHeartRateService
+ (id)serviceUUID;
+ (int64_t)serviceType;
- (BOOL)deliverData;
- (BOOL)supportsOperation:(id)a3;
- (HDHeartRateService)initWithServiceManager:(id)a3 peripheral:(id)a4 advertisementData:(id)a5 profile:(id)a6;
- (int64_t)preferredSensorLocation;
- (void)performOperation:(id)a3 onPeripheral:(id)a4 withParameters:(id)a5 completion:(id)a6;
- (void)peripheral:(id)a3 didDiscoverCharacteristic:(id)a4;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 updateTime:(id)a5 error:(id)a6;
- (void)setDeliverData:(BOOL)a3;
- (void)setPreferredSensorLocation:(int64_t)a3;
@end

@implementation HDHeartRateService

+ (int64_t)serviceType
{
  return 0;
}

+ (id)serviceUUID
{
  return +[CBUUID UUIDWithString:kHDHeartRateService];
}

- (HDHeartRateService)initWithServiceManager:(id)a3 peripheral:(id)a4 advertisementData:(id)a5 profile:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)HDHeartRateService;
  v6 = [(HDHealthService *)&v10 initWithServiceManager:a3 peripheral:a4 advertisementData:a5 profile:a6];
  v7 = v6;
  if (v6)
  {
    v6->_preferredSensorLocation = 256;
    v6->_deliverData = 1;
    v8 = v6;
  }

  return v7;
}

- (BOOL)supportsOperation:(id)a3
{
  return [@"resetEnergyExpended" isEqualToString:a3];
}

- (void)performOperation:(id)a3 onPeripheral:(id)a4 withParameters:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if ([@"resetEnergyExpended" isEqualToString:v9])
  {
    sub_22CD0(self, v12, v11);
  }
  else
  {
    _HKInitializeLogging();
    v13 = HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
      sub_40F58((uint64_t)v9, v13);
    }
    v14 = +[NSError hk_error:307 description:@"Unrecognized operation"];
    (*((void (**)(id, id, void, void *))v11 + 2))(v11, v9, 0, v14);
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristic:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  v7 = [v6 UUID];
  v8 = +[HDHeartRateMeasurement uuid];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    [v14 setNotifyValue:1 forCharacteristic:v6];
  }
  else
  {
    id v10 = +[HDBodySensorLocation uuid];
    unsigned int v11 = [v7 isEqual:v10];

    if (v11)
    {
      [v14 readValueForCharacteristic:v6];
    }
    else
    {
      uint64_t v12 = +[HDHeartRateControlPoint uuid];
      unsigned int v13 = [v7 isEqual:v12];

      if (v13) {
        [(HDHealthService *)self setWritableCharacteristic:v6];
      }
    }
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 updateTime:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(HDHeartRateService *)self deliverData])
  {
    if (v13)
    {
      v21.receiver = self;
      v21.super_class = (Class)HDHeartRateService;
      [(HDHealthService *)&v21 peripheral:v10 didUpdateValueForCharacteristic:v11 updateTime:v12 error:v13];
      goto LABEL_11;
    }
    id v14 = [v11 UUID];
    v15 = +[HDHeartRateMeasurement uuid];
    unsigned int v16 = [v14 isEqual:v15];

    if (v16)
    {
      v17 = [v11 value];
      sub_22AB8(self, (uint64_t)v17);
    }
    else
    {
      v18 = +[HDBodySensorLocation uuid];
      unsigned int v19 = [v14 isEqual:v18];

      if (!v19)
      {
        v20.receiver = self;
        v20.super_class = (Class)HDHeartRateService;
        [(HDHealthService *)&v20 peripheral:v10 didUpdateValueForCharacteristic:v11 updateTime:v12 error:0];
        goto LABEL_10;
      }
      v17 = [v11 value];
      sub_22BE4(self, (uint64_t)v17);
    }

LABEL_10:
  }
LABEL_11:
}

- (BOOL)deliverData
{
  return self->_deliverData;
}

- (void)setDeliverData:(BOOL)a3
{
  self->_deliverData = a3;
}

- (int64_t)preferredSensorLocation
{
  return self->_preferredSensorLocation;
}

- (void)setPreferredSensorLocation:(int64_t)a3
{
  self->_preferredSensorLocation = a3;
}

@end