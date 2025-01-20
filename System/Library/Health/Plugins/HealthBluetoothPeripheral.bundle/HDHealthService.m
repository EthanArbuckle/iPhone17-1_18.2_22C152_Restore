@interface HDHealthService
+ (id)implementedProperties;
+ (id)serviceUUID;
+ (int64_t)serviceType;
- (BOOL)characteristicsDiscovered;
- (BOOL)deliverData;
- (BOOL)processAdvertisementData:(id)a3;
- (BOOL)supportsOperation:(id)a3;
- (BOOL)supportsWritingCharacteristic:(id)a3;
- (HDHealthPeripheral)healthPeripheral;
- (HDHealthService)initWithServiceManager:(id)a3 peripheral:(id)a4 advertisementData:(id)a5 profile:(id)a6;
- (HDProfile)profile;
- (NSString)serviceId;
- (NSUUID)peripheralUUID;
- (id)description;
- (id)servicesInProfile;
- (void)characteristicDataReceived:(id)a3;
- (void)deviceDisconnecting;
- (void)deviceInformationSetOnPeripheral;
- (void)mfaSucceededOnPeripheral;
- (void)performOperation:(id)a3 onPeripheral:(id)a4 withParameters:(id)a5 completion:(id)a6;
- (void)peripheral:(id)a3 didDiscoverCharacteristics:(id)a4;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)readProperty:(id)a3;
- (void)setDeliverData:(BOOL)a3;
- (void)setProfile:(id)a3;
- (void)setServiceId:(id)a3;
- (void)setWritableCharacteristic:(id)a3;
- (void)writeCharacteristic:(id)a3 expectResponse:(BOOL)a4 completion:(id)a5;
@end

@implementation HDHealthService

- (HDHealthService)initWithServiceManager:(id)a3 peripheral:(id)a4 advertisementData:(id)a5 profile:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v35.receiver = self;
  v35.super_class = (Class)HDHealthService;
  v14 = [(HDHealthService *)&v35 init];
  v15 = v14;
  if (v14)
  {
    v14->_deliverData = 1;
    objc_storeWeak((id *)&v14->_serviceManager, v10);
    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    writableCharacteristics = v15->_writableCharacteristics;
    v15->_writableCharacteristics = v16;

    uint64_t v18 = HKCreateSerialDispatchQueue();
    writeQueue = v15->_writeQueue;
    v15->_writeQueue = (OS_dispatch_queue *)v18;

    uint64_t v20 = +[NSMutableArray array];
    pendingWrites = v15->_pendingWrites;
    v15->_pendingWrites = (NSMutableArray *)v20;

    v22 = [(id)objc_opt_class() serviceUUID];
    uint64_t v23 = [v22 UUIDString];
    serviceId = v15->_serviceId;
    v15->_serviceId = (NSString *)v23;

    id v25 = objc_storeWeak((id *)&v15->_healthPeripheral, v11);
    v26 = [v11 cbPeripheral];
    uint64_t v27 = [v26 identifier];
    peripheralUUID = v15->_peripheralUUID;
    v15->_peripheralUUID = (NSUUID *)v27;

    objc_storeWeak((id *)&v15->_profile, v13);
    uint64_t v29 = HKCreateSerialDispatchQueue();
    dataQueue = v15->_dataQueue;
    v15->_dataQueue = (OS_dispatch_queue *)v29;

    v31 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingCharacteristicBuffer = v15->_pendingCharacteristicBuffer;
    v15->_pendingCharacteristicBuffer = v31;

    v33 = 0;
    if ([(HDHealthService *)v15 processAdvertisementData:v12]) {
      v33 = v15;
    }
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (void)deviceDisconnecting
{
  writeQueue = self->_writeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2BB08;
  block[3] = &unk_60820;
  block[4] = self;
  dispatch_async(writeQueue, block);
}

+ (int64_t)serviceType
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  +[NSException raise:NSInvalidArgumentException, @"Subclass %@ must override serviceType.", v3 format];

  return -1;
}

+ (id)serviceUUID
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  +[NSException raise:NSInvalidArgumentException, @"Subclass %@ must override serviceUUID.", v3 format];

  return 0;
}

- (id)servicesInProfile
{
  v2 = +[HDDeviceInformationService serviceUUID];
  v6[0] = v2;
  v3 = +[HDBatteryService serviceUUID];
  v6[1] = v3;
  v4 = +[NSArray arrayWithObjects:v6 count:2];

  return v4;
}

- (void)characteristicDataReceived:(id)a3
{
  id v4 = a3;
  if ([(HDHealthService *)self deliverData])
  {
    if (self && (unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_deviceInformationLoaded), (v5 & 1) != 0))
    {
      dataQueue = self->_dataQueue;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_2BF44;
      v8[3] = &unk_608E8;
      v8[4] = self;
      id v9 = v4;
      dispatch_async(dataQueue, v8);
    }
    else
    {
      sub_2BFFC((uint64_t)self, v4);
    }
  }
  else
  {
    _HKInitializeLogging();
    v6 = HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG)) {
      sub_414AC(v6);
    }
  }
}

- (BOOL)supportsOperation:(id)a3
{
  return 0;
}

- (void)performOperation:(id)a3 onPeripheral:(id)a4 withParameters:(id)a5 completion:(id)a6
{
  id v7 = a3;
  id v8 = a5;
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG)) {
    sub_415AC();
  }
}

- (void)setWritableCharacteristic:(id)a3
{
  id v4 = a3;
  writeQueue = self->_writeQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2C668;
  v7[3] = &unk_608E8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(writeQueue, v7);
}

- (BOOL)supportsWritingCharacteristic:(id)a3
{
  id v4 = [(id)objc_opt_class() uuid];
  unsigned __int8 v5 = [(NSMutableDictionary *)self->_writableCharacteristics objectForKeyedSubscript:v4];
  LOBYTE(self) = v5 != 0;

  return (char)self;
}

- (void)writeCharacteristic:(id)a3 expectResponse:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  writeQueue = self->_writeQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_2C850;
  v13[3] = &unk_61608;
  id v14 = v8;
  id v15 = v9;
  v13[4] = self;
  BOOL v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(writeQueue, v13);
}

+ (id)implementedProperties
{
  return &__NSArray0__struct;
}

- (void)readProperty:(id)a3
{
  id v3 = a3;
  _HKInitializeLogging();
  id v4 = HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG)) {
    sub_41690((uint64_t)v3, v4);
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(HDHealthService *)self peripheral:v6 didDiscoverCharacteristic:*(void *)(*((void *)&v12 + 1) + 8 * (void)v11)];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
  sub_2C540((uint64_t)self);
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG)) {
    sub_41708();
  }
  writeQueue = self->_writeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2CC30;
  block[3] = &unk_607A8;
  block[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(writeQueue, block);
}

- (id)description
{
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  id v4 = [(id)objc_opt_class() serviceUUID];
  unsigned __int8 v5 = [v4 UUIDString];
  id v6 = +[NSString stringWithFormat:@"%@ %@", v3, v5];

  return v6;
}

- (void)mfaSucceededOnPeripheral
{
  dataQueue = self->_dataQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2CDF0;
  block[3] = &unk_60820;
  block[4] = self;
  dispatch_async(dataQueue, block);
}

- (void)deviceInformationSetOnPeripheral
{
  dataQueue = self->_dataQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2D004;
  block[3] = &unk_60820;
  block[4] = self;
  dispatch_async(dataQueue, block);
}

- (BOOL)processAdvertisementData:(id)a3
{
  return 1;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (HDHealthPeripheral)healthPeripheral
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_healthPeripheral);

  return (HDHealthPeripheral *)WeakRetained;
}

- (NSUUID)peripheralUUID
{
  return self->_peripheralUUID;
}

- (BOOL)deliverData
{
  return self->_deliverData;
}

- (void)setDeliverData:(BOOL)a3
{
  self->_deliverData = a3;
}

- (NSString)serviceId
{
  return self->_serviceId;
}

- (void)setServiceId:(id)a3
{
}

- (BOOL)characteristicsDiscovered
{
  return self->_characteristicsDiscovered;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingWrites, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_writableCharacteristics, 0);
  objc_destroyWeak((id *)&self->_serviceManager);
  objc_storeStrong((id *)&self->_serviceId, 0);
  objc_storeStrong((id *)&self->_peripheralUUID, 0);
  objc_destroyWeak((id *)&self->_healthPeripheral);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_deviceEntity, 0);
  objc_storeStrong((id *)&self->_pendingCharacteristicBuffer, 0);

  objc_storeStrong((id *)&self->_dataQueue, 0);
}

@end