@interface HDHealthPeripheral
+ (id)implementedProperties;
- (BOOL)hasServiceWithUUID:(id)a3;
- (BOOL)updateCBPeripheral:(id)a3;
- (CBPeripheral)cbPeripheral;
- (HDHealthPeripheral)initWithCBPeripheral:(id)a3 name:(id)a4 serviceManager:(id)a5 profile:(id)a6;
- (HKDevice)deviceInformation;
- (NSString)name;
- (NSString)stateDescription;
- (NSUUID)identifier;
- (id)healthServiceForType:(int64_t)a3;
- (int64_t)state;
- (void)addHealthService:(id)a3;
- (void)disconnectServices;
- (void)discoverServices;
- (void)getProperty:(id)a3 withHandler:(id)a4;
- (void)performOperation:(id)a3 withParameters:(id)a4 completion:(id)a5;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didModifyServices:(id)a4;
- (void)peripheral:(id)a3 didReadRSSI:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)service:(id)a3 didReadProperty:(id)a4 value:(id)a5 error:(id)a6;
- (void)writeCharacteristic:(id)a3 expectResponse:(BOOL)a4 completion:(id)a5;
@end

@implementation HDHealthPeripheral

- (HDHealthPeripheral)initWithCBPeripheral:(id)a3 name:(id)a4 serviceManager:(id)a5 profile:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HDHealthPeripheral;
  v15 = [(HDHealthPeripheral *)&v26 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_cbPeripheral, a3);
    [v11 setDelegate:v16];
    objc_storeStrong((id *)&v16->_name, a4);
    v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    healthServices = v16->_healthServices;
    v16->_healthServices = v17;

    objc_storeWeak((id *)&v16->_serviceManager, v13);
    objc_storeWeak((id *)&v16->_profile, v14);
    uint64_t v19 = HKCreateSerialDispatchQueue();
    servicesQueue = v16->_servicesQueue;
    v16->_servicesQueue = (OS_dispatch_queue *)v19;

    v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    serviceForProperty = v16->_serviceForProperty;
    v16->_serviceForProperty = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    propertiesAwaiting = v16->_propertiesAwaiting;
    v16->_propertiesAwaiting = v23;
  }
  return v16;
}

- (NSUUID)identifier
{
  return (NSUUID *)[(CBPeripheral *)self->_cbPeripheral identifier];
}

- (int64_t)state
{
  return [(CBPeripheral *)self->_cbPeripheral state];
}

- (NSString)stateDescription
{
  unint64_t v2 = [(HDHealthPeripheral *)self state];
  if (v2 > 3) {
    return (NSString *)@"Unknown";
  }
  else {
    return (NSString *)*(&off_60958 + v2);
  }
}

- (BOOL)updateCBPeripheral:(id)a3
{
  id v5 = a3;
  cbPeripheral = self->_cbPeripheral;
  p_cbPeripheral = &self->_cbPeripheral;
  v8 = [(CBPeripheral *)cbPeripheral identifier];
  v9 = [v5 identifier];
  unsigned __int8 v10 = [v8 isEqual:v9];

  if (v10)
  {
    objc_storeStrong((id *)p_cbPeripheral, a3);
  }
  else
  {
    _HKInitializeLogging();
    id v11 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
      sub_3F5BC(v11, v5, (id *)p_cbPeripheral);
    }
  }

  return v10;
}

- (void)discoverServices
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  p_cbPeripheral = &self->_cbPeripheral;
  id v5 = [(CBPeripheral *)self->_cbPeripheral services];
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)v9) UUID];
        [v3 addObject:v10];

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  id v11 = [(NSMutableDictionary *)self->_healthServices allKeys];
  [v3 addObjectsFromArray:v11];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = [(NSMutableDictionary *)self->_healthServices allValues];
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v16) servicesInProfile];
        [v3 addObjectsFromArray:v17];

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  v18 = *p_cbPeripheral;
  uint64_t v19 = [v3 allObjects];
  [(CBPeripheral *)v18 discoverServices:v19];

  _HKInitializeLogging();
  v20 = HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG)) {
    sub_3F6B8((uint64_t)v3, p_cbPeripheral, v20);
  }
}

- (void)addHealthService:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() serviceUUID];
  servicesQueue = self->_servicesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_56BC;
  block[3] = &unk_607A8;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(servicesQueue, block);
}

- (BOOL)hasServiceWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  servicesQueue = self->_servicesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5798;
  block[3] = &unk_607D0;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(servicesQueue, block);
  LOBYTE(servicesQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)servicesQueue;
}

- (id)healthServiceForType:(int64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_58E0;
  uint64_t v11 = sub_58F0;
  id v12 = 0;
  servicesQueue = self->_servicesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_58F8;
  block[3] = &unk_607F8;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(servicesQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)disconnectServices
{
  servicesQueue = self->_servicesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5AA8;
  block[3] = &unk_60820;
  block[4] = self;
  dispatch_async(servicesQueue, block);
}

- (void)performOperation:(id)a3 withParameters:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  servicesQueue = self->_servicesQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_5EE0;
  v15[3] = &unk_60848;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(servicesQueue, v15);
}

- (void)writeCharacteristic:(id)a3 expectResponse:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  servicesQueue = self->_servicesQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_6130;
  v13[3] = &unk_60870;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(servicesQueue, v13);
}

+ (id)implementedProperties
{
  CFStringRef v4 = @"RSSIdb";
  unint64_t v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void)getProperty:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  servicesQueue = self->_servicesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6440;
  block[3] = &unk_60898;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(servicesQueue, block);
}

- (void)service:(id)a3 didReadProperty:(id)a4 value:(id)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  servicesQueue = self->_servicesQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_6820;
  v16[3] = &unk_608C0;
  v16[4] = self;
  id v17 = v10;
  id v18 = v9;
  id v19 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_async(servicesQueue, v16);
}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    _HKInitializeLogging();
    id v8 = HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG)) {
      sub_3F7C8((uint64_t)v6, (uint64_t)v7, v8);
    }
    id v9 = +[NSError hk_error:302 description:@"The device modified its service requiring a new discovery."];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceManager);
    id v11 = [(HDHealthPeripheral *)self identifier];
    [WeakRetained servicesInvalidatedForDevice:v11 withError:v9];
  }
}

- (void)peripheral:(id)a3 didReadRSSI:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG)) {
    sub_3F840();
  }
  servicesQueue = self->_servicesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6C14;
  block[3] = &unk_607A8;
  void block[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(servicesQueue, block);
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  id v8 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG)) {
    sub_3F8AC(v8, v6, (uint64_t)v7);
  }
  servicesQueue = self->_servicesQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_6D18;
  v11[3] = &unk_608E8;
  id v12 = v6;
  id v13 = self;
  id v10 = v6;
  dispatch_async(servicesQueue, v11);
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  _HKInitializeLogging();
  id v11 = HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2114;
    id v24 = v10;
    _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "|>- didDiscoverCharacteristicsForService: %@, %@, error: %{public}@", buf, 0x20u);
  }
  servicesQueue = self->_servicesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_75BC;
  block[3] = &unk_607A8;
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(servicesQueue, block);
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  _HKInitializeLogging();
  id v11 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG))
  {
    __int16 v21 = v11;
    id v22 = [v9 value];
    *(_DWORD *)buf = 138413058;
    id v30 = v8;
    __int16 v31 = 2112;
    id v32 = v9;
    __int16 v33 = 2112;
    v34 = v22;
    __int16 v35 = 2114;
    id v36 = v10;
    _os_log_debug_impl(&dword_0, v21, OS_LOG_TYPE_DEBUG, "|>- peripheral:didUpdateValueForCharacteristic: %@, %@, %@, error: %{public}@", buf, 0x2Au);
  }
  id v12 = [v9 UUID];
  id v13 = +[CBUUID UUIDWithString:@"2A00"];
  unsigned int v14 = [v12 isEqual:v13];

  if (v14)
  {
    _HKInitializeLogging();
    id v15 = HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG)) {
      sub_3F960((uint64_t)v9, v15);
    }
  }
  else
  {
    id v16 = [v9 service];
    id v17 = [v16 UUID];

    if (v17)
    {
      id v18 = +[NSDate date];
      servicesQueue = self->_servicesQueue;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_7CAC;
      v23[3] = &unk_60910;
      v23[4] = self;
      id v24 = v17;
      id v25 = v8;
      id v26 = v9;
      id v27 = v18;
      id v28 = v10;
      id v20 = v18;
      dispatch_async(servicesQueue, v23);
    }
  }
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  _HKInitializeLogging();
  id v11 = HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2114;
    id v25 = v10;
    _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "|>- peripheral:didWriteValueForCharacteristic: %@, %@, error: %{public}@", buf, 0x20u);
  }
  id v12 = [v9 service];
  id v13 = [v12 UUID];

  if (v13)
  {
    servicesQueue = self->_servicesQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_7ECC;
    block[3] = &unk_60938;
    void block[4] = self;
    id v16 = v13;
    id v17 = v8;
    id v18 = v9;
    id v19 = v10;
    dispatch_async(servicesQueue, block);
  }
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  _HKInitializeLogging();
  id v10 = HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412802;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2114;
    id v16 = v9;
    _os_log_debug_impl(&dword_0, v10, OS_LOG_TYPE_DEBUG, "|>- peripheral:didUpdateNotificationStateForCharacteristic: %@, %@, error: %{public}@", (uint8_t *)&v11, 0x20u);
  }
}

- (CBPeripheral)cbPeripheral
{
  return self->_cbPeripheral;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (HKDevice)deviceInformation
{
  return self->_deviceInformation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertiesAwaiting, 0);
  objc_storeStrong((id *)&self->_serviceForProperty, 0);
  objc_storeStrong((id *)&self->_servicesQueue, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_destroyWeak((id *)&self->_serviceManager);
  objc_storeStrong((id *)&self->_healthServices, 0);
  objc_storeStrong((id *)&self->_deviceInformation, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_cbPeripheral, 0);
}

@end