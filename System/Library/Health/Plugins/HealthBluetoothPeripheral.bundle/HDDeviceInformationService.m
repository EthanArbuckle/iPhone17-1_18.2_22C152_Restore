@interface HDDeviceInformationService
+ (id)implementedProperties;
+ (id)serviceUUID;
+ (int64_t)serviceType;
- (BOOL)deviceInformationHasBeenLoaded;
- (BOOL)fetchLimitedCharacteristics;
- (HDDeviceInformationService)initWithServiceManager:(id)a3 peripheral:(id)a4 advertisementData:(id)a5 profile:(id)a6;
- (NSMutableArray)pendingDeviceInformationLoadedBlocks;
- (NSMutableDictionary)characteristics;
- (NSMutableDictionary)propertyValues;
- (NSMutableSet)propertiesLeftToFetch;
- (NSString)firmwareRevision;
- (NSString)hardwareRevision;
- (NSString)manufacturerName;
- (NSString)modelNumber;
- (NSString)serialNumber;
- (NSString)softwareRevision;
- (OS_dispatch_queue)queue;
- (void)performWhenDeviceInformationHasBeenLoaded:(id)a3;
- (void)peripheral:(id)a3 didDiscoverCharacteristic:(id)a4;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 updateTime:(id)a5 error:(id)a6;
- (void)readProperty:(id)a3;
- (void)setCharacteristics:(id)a3;
- (void)setDeviceInformationHasBeenLoaded:(BOOL)a3;
- (void)setFetchLimitedCharacteristics:(BOOL)a3;
- (void)setPendingDeviceInformationLoadedBlocks:(id)a3;
- (void)setPropertiesLeftToFetch:(id)a3;
- (void)setPropertyValues:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation HDDeviceInformationService

- (HDDeviceInformationService)initWithServiceManager:(id)a3 peripheral:(id)a4 advertisementData:(id)a5 profile:(id)a6
{
  v18.receiver = self;
  v18.super_class = (Class)HDDeviceInformationService;
  v6 = [(HDHealthService *)&v18 initWithServiceManager:a3 peripheral:a4 advertisementData:a5 profile:a6];
  if (v6)
  {
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = +[NSMutableDictionary dictionary];
    characteristics = v6->_characteristics;
    v6->_characteristics = (NSMutableDictionary *)v9;

    uint64_t v11 = +[NSMutableDictionary dictionary];
    propertyValues = v6->_propertyValues;
    v6->_propertyValues = (NSMutableDictionary *)v11;

    uint64_t v13 = +[NSMutableSet set];
    propertiesLeftToFetch = v6->_propertiesLeftToFetch;
    v6->_propertiesLeftToFetch = (NSMutableSet *)v13;

    v6->_deviceInformationHasBeenLoaded = 0;
    v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingDeviceInformationLoadedBlocks = v6->_pendingDeviceInformationLoadedBlocks;
    v6->_pendingDeviceInformationLoadedBlocks = v15;

    sub_19C70((uint64_t)v6);
  }
  return v6;
}

+ (int64_t)serviceType
{
  return -3;
}

+ (id)serviceUUID
{
  return +[CBUUID UUIDWithString:kHDDeviceInformationService];
}

- (NSString)manufacturerName
{
  return (NSString *)sub_19DBC(self, @"manufacturerName");
}

- (NSString)modelNumber
{
  return (NSString *)sub_19DBC(self, @"modelNumber");
}

- (NSString)serialNumber
{
  return (NSString *)sub_19DBC(self, @"serialNumber");
}

- (NSString)hardwareRevision
{
  return (NSString *)sub_19DBC(self, @"hardwareRevision");
}

- (NSString)firmwareRevision
{
  return (NSString *)sub_19DBC(self, @"firmwareRevision");
}

- (NSString)softwareRevision
{
  return (NSString *)sub_19DBC(self, @"softwareRevision");
}

- (void)performWhenDeviceInformationHasBeenLoaded:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1A044;
  v7[3] = &unk_609F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

+ (id)implementedProperties
{
  v2 = _PropertyNamesToCharacteristicIdentifiers();
  v3 = [v2 allKeys];

  return v3;
}

- (void)readProperty:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1A50C;
  v7[3] = &unk_608E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)peripheral:(id)a3 didDiscoverCharacteristic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1A770;
  block[3] = &unk_607A8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 updateTime:(id)a5 error:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1AA78;
  v16[3] = &unk_608C0;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(queue, v16);
}

- (BOOL)fetchLimitedCharacteristics
{
  return self->_fetchLimitedCharacteristics;
}

- (void)setFetchLimitedCharacteristics:(BOOL)a3
{
  self->_fetchLimitedCharacteristics = a3;
}

- (NSMutableDictionary)characteristics
{
  return self->_characteristics;
}

- (void)setCharacteristics:(id)a3
{
}

- (NSMutableDictionary)propertyValues
{
  return self->_propertyValues;
}

- (void)setPropertyValues:(id)a3
{
}

- (NSMutableSet)propertiesLeftToFetch
{
  return self->_propertiesLeftToFetch;
}

- (void)setPropertiesLeftToFetch:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)deviceInformationHasBeenLoaded
{
  return self->_deviceInformationHasBeenLoaded;
}

- (void)setDeviceInformationHasBeenLoaded:(BOOL)a3
{
  self->_deviceInformationHasBeenLoaded = a3;
}

- (NSMutableArray)pendingDeviceInformationLoadedBlocks
{
  return self->_pendingDeviceInformationLoadedBlocks;
}

- (void)setPendingDeviceInformationLoadedBlocks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDeviceInformationLoadedBlocks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_propertiesLeftToFetch, 0);
  objc_storeStrong((id *)&self->_propertyValues, 0);

  objc_storeStrong((id *)&self->_characteristics, 0);
}

@end