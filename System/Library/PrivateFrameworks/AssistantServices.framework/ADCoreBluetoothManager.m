@interface ADCoreBluetoothManager
+ (void)fetchCBUUIDForConnectedDeviceWithAddress:(id)a3 completion:(id)a4;
+ (void)retrieveConnectedDevicesInfoOnDoAPServiceWithCompletion:(id)a3;
+ (void)retrieveConnectedDevicesInfoWithCompletion:(id)a3;
- (id)_adCoreBluetoothDeviceForPeripheral:(id)a3 RSSI:(id)a4;
- (id)_getPeripheralStateDescriptionFromState:(int64_t)a3;
- (id)_init;
- (void)_connectToPeripherals:(id)a3;
- (void)_didReadRSSI:(id)a3 forPeripheral:(id)a4;
- (void)_retrieveConnectedDevicesInfoOnServices:(id)a3 completion:(id)a4;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)peripheral:(id)a3 didReadRSSI:(id)a4 error:(id)a5;
@end

@implementation ADCoreBluetoothManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_completionWrapper);
  objc_storeStrong((id *)&self->_servicesToScan, 0);
  objc_storeStrong((id *)&self->_peripheralsWithRSSIRead, 0);
  objc_storeStrong((id *)&self->_peripheralsPendingRSSI, 0);
  objc_storeStrong((id *)&self->_cbManager, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)peripheral:(id)a3 didReadRSSI:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002A93FC;
  v15[3] = &unk_10050DC68;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([a3 isEqual:self->_cbManager])
  {
    peripheralsPendingRSSI = self->_peripheralsPendingRSSI;
    v11 = [v8 identifier];
    id v12 = [(NSMutableDictionary *)peripheralsPendingRSSI objectForKey:v11];

    if (v12)
    {
      id v13 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 136315650;
        v15 = "-[ADCoreBluetoothManager centralManager:didFailToConnectPeripheral:error:]";
        __int16 v16 = 2112;
        id v17 = v8;
        __int16 v18 = 2112;
        id v19 = v9;
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s %@: %@", (uint8_t *)&v14, 0x20u);
      }
      [(ADCoreBluetoothManager *)self _didReadRSSI:0 forPeripheral:v8];
    }
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6 = a3;
  v7 = (ADCoreBluetoothManager *)a4;
  if (self->_invalidated)
  {
    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      v11 = "-[ADCoreBluetoothManager centralManager:didConnectPeripheral:]";
      __int16 v12 = 2112;
      id v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@ already invalidated", (uint8_t *)&v10, 0x16u);
    }
  }
  else if ([v6 isEqual:self->_cbManager])
  {
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315394;
      v11 = "-[ADCoreBluetoothManager centralManager:didConnectPeripheral:]";
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s %@ connected, now reading RSSI", (uint8_t *)&v10, 0x16u);
    }
    [(ADCoreBluetoothManager *)v7 readRSSI];
  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  v4 = (NSArray *)a3;
  if ([(NSArray *)v4 isEqual:self->_cbManager])
  {
    v5 = (NSArray *)[(CBCentralManager *)self->_cbManager state];
    uint64_t v6 = (uint64_t)[(CBCentralManager *)self->_cbManager state];
    v7 = AFSiriLogContextDaemon;
    BOOL v8 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v6 > 4)
    {
      if (v8)
      {
        servicesToScan = self->_servicesToScan;
        int v14 = 136315394;
        v15 = "-[ADCoreBluetoothManager centralManagerDidUpdateState:]";
        __int16 v16 = 2112;
        id v17 = servicesToScan;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s retrieving connected devices on services: %@", (uint8_t *)&v14, 0x16u);
      }
      id v13 = [(CBCentralManager *)self->_cbManager retrieveConnectedPeripheralsWithServices:self->_servicesToScan allowAll:1];
      [(ADCoreBluetoothManager *)self _connectToPeripherals:v13];
    }
    else
    {
      if (v8)
      {
        int v14 = 136315394;
        v15 = "-[ADCoreBluetoothManager centralManagerDidUpdateState:]";
        __int16 v16 = 2048;
        id v17 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Invalid CBCentral manager state: %ld", (uint8_t *)&v14, 0x16u);
      }
      self->_invalidated = 1;
      if (self->_group)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_completionWrapper);
        [WeakRetained invoke];
      }
    }
  }
  else
  {
    int v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      cbManager = self->_cbManager;
      int v14 = 136315650;
      v15 = "-[ADCoreBluetoothManager centralManagerDidUpdateState:]";
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = cbManager;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Ignoring update from irrelevant CB manager: %@, current manager is %@", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (void)_didReadRSSI:(id)a3 forPeripheral:(id)a4
{
  id v6 = a4;
  id v10 = [(ADCoreBluetoothManager *)self _adCoreBluetoothDeviceForPeripheral:v6 RSSI:a3];
  -[NSMutableArray addObject:](self->_peripheralsWithRSSIRead, "addObject:");
  peripheralsPendingRSSI = self->_peripheralsPendingRSSI;
  BOOL v8 = [v6 identifier];
  [(NSMutableDictionary *)peripheralsPendingRSSI removeObjectForKey:v8];

  [(CBCentralManager *)self->_cbManager cancelPeripheralConnection:v6];
  group = self->_group;
  if (group) {
    dispatch_group_leave(group);
  }
}

- (void)_connectToPeripherals:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  if (v5)
  {
    id v6 = v5;
    v7 = (OS_dispatch_group *)dispatch_group_create();
    group = self->_group;
    self->_group = v7;

    id v9 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:v6];
    peripheralsPendingRSSI = self->_peripheralsPendingRSSI;
    self->_peripheralsPendingRSSI = v9;

    v11 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:v6];
    peripheralsWithRSSIRead = self->_peripheralsWithRSSIRead;
    self->_peripheralsWithRSSIRead = v11;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v13 = v4;
    id v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          __int16 v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v19 = self->_peripheralsPendingRSSI;
          v20 = [v18 identifier];
          [(NSMutableDictionary *)v19 setObject:v18 forKey:v20];

          [v18 setDelegate:self];
          dispatch_group_enter((dispatch_group_t)self->_group);
          [(CBCentralManager *)self->_cbManager connectPeripheral:v18 options:0];
        }
        id v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v15);
    }

    queue = self->_queue;
    v21 = self->_group;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002A9D88;
    block[3] = &unk_10050E138;
    block[4] = self;
    dispatch_group_notify(v21, queue, block);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_completionWrapper);
    [WeakRetained invoke];
  }
}

- (id)_adCoreBluetoothDeviceForPeripheral:(id)a3 RSSI:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = -[ADCoreBluetoothManager _getPeripheralStateDescriptionFromState:](self, "_getPeripheralStateDescriptionFromState:", [v7 state]);
  id v9 = [ADCoreBluetoothDevice alloc];
  id v10 = [v7 identifier];
  v11 = [v7 name];

  __int16 v12 = [(ADCoreBluetoothDevice *)v9 initWithIdentifier:v10 name:v11 RSSI:v6 state:v8];
  unint64_t counter = self->_counter;
  self->_unint64_t counter = counter + 1;
  id v14 = +[NSString stringWithFormat:@"%tu", counter];
  [(ADCoreBluetoothDevice *)v12 setIndex:v14];

  return v12;
}

- (id)_getPeripheralStateDescriptionFromState:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"unknown";
  }
  else {
    return off_100509B98[a3];
  }
}

- (void)_retrieveConnectedDevicesInfoOnServices:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002A9FD4;
  block[3] = &unk_10050E1D8;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (id)_init
{
  v12.receiver = self;
  v12.super_class = (Class)ADCoreBluetoothManager;
  v2 = [(ADCoreBluetoothManager *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ADCoreBluetoothManagerQueue", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v2->_invalidated = 0;
    v2->_unint64_t counter = 0;
    id v6 = v2->_queue;
    id v7 = +[ADQueueMonitor sharedMonitor];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1002AA5A0;
    v10[3] = &unk_10050C458;
    v11 = v6;
    BOOL v8 = v6;
    [v7 addQueue:v8 heartBeatInterval:v10 timeoutInterval:5.0 timeoutHandler:5.0];
  }
  return v2;
}

+ (void)fetchCBUUIDForConnectedDeviceWithAddress:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)CBController);
  id v8 = objc_alloc_init((Class)CBDevice);
  [v8 setIdentifier:v5];
  id v9 = objc_alloc_init((Class)CBDeviceRequest);
  [v9 setRequestFlags:64];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002AA7D4;
  v12[3] = &unk_100509B50;
  id v13 = v5;
  id v14 = v6;
  id v10 = v6;
  id v11 = v5;
  [v7 performDeviceRequest:v9 device:v8 completion:v12];
}

+ (void)retrieveConnectedDevicesInfoOnDoAPServiceWithCompletion:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [[ADCoreBluetoothManager alloc] _init];
    id v5 = +[CBUUID UUIDWithString:CBUUIDDoAPServiceString];
    id v7 = v5;
    id v6 = +[NSArray arrayWithObjects:&v7 count:1];
    [v4 _retrieveConnectedDevicesInfoOnServices:v6 completion:v3];
  }
}

+ (void)retrieveConnectedDevicesInfoWithCompletion:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [[ADCoreBluetoothManager alloc] _init];
    [v4 _retrieveConnectedDevicesInfoOnServices:&__NSArray0__struct completion:v3];
  }
}

@end