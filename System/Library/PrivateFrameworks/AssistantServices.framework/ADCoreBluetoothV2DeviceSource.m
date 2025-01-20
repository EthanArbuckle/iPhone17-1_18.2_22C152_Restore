@interface ADCoreBluetoothV2DeviceSource
- (ADCoreBluetoothV2DeviceSource)init;
- (id)_createDeviceWithAddress:(id)a3;
- (id)_createDeviceWithUID:(id)a3;
- (id)_deviceWithAddress:(id)a3 createsIfAbsent:(BOOL)a4;
- (id)_deviceWithUID:(id)a3 createsIfAbsent:(BOOL)a4;
- (id)deviceWithAddress:(id)a3;
- (id)deviceWithUID:(id)a3;
- (id)devicesByAddress;
- (id)devicesByDeviceUID;
- (id)headGestureConfigurationForBTAddress:(id)a3;
- (id)queue;
- (void)_aadActivatingWithRetry:(BOOL)a3 andError:(id)a4;
- (void)_aadConnectionInterrupted;
- (void)_handleDeviceFound:(id)a3;
- (void)_handleDeviceLost:(id)a3;
- (void)_invalidate;
- (void)_setupDiscoveryWithRetry:(BOOL)a3;
- (void)aadActivatingWithRetry:(BOOL)a3 andError:(id)a4;
- (void)fetchAddressForDeviceWithCBUUID:(id)a3 completion:(id)a4;
- (void)fetchAudioAccessoryDeviceForBTAddress:(id)a3 completion:(id)a4;
- (void)fetchAudioAccessoryDeviceForCBUUID:(id)a3 completion:(id)a4;
- (void)fetchCBUUIDForDeviceWithAddress:(id)a3 completion:(id)a4;
- (void)handleDeviceFound:(id)a3;
- (void)handleDeviceLost:(id)a3;
- (void)invalidate;
- (void)invalidateDeviceWithAddress:(id)a3 cbuuid:(id)a4;
- (void)sendDeviceConfig:(id)a3 device:(id)a4 completion:(id)a5;
@end

@implementation ADCoreBluetoothV2DeviceSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headGestureConfigurationByAddress, 0);
  objc_storeStrong((id *)&self->_addressByCBUUID, 0);
  objc_storeStrong((id *)&self->_cbuuidByAddress, 0);
  objc_storeStrong((id *)&self->_aaDeviceManager, 0);
  objc_storeStrong((id *)&self->_devicesByDeviceUID, 0);
  objc_storeStrong((id *)&self->_devicesByAddress, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_setupQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)sendDeviceConfig:(id)a3 device:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  group = self->_group;
  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000BAC84;
  v16[3] = &unk_10050E228;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_group_notify(group, queue, v16);
}

- (void)fetchAudioAccessoryDeviceForBTAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFNormalizeMacAddress();
  group = self->_group;
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000BAE30;
  v14[3] = &unk_10050E228;
  v14[4] = self;
  id v15 = v8;
  id v16 = v6;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v8;
  dispatch_group_notify(group, queue, v14);
}

- (void)fetchAudioAccessoryDeviceForCBUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  group = self->_group;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BB150;
  block[3] = &unk_10050E1D8;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_group_notify(group, queue, block);
}

- (void)fetchAddressForDeviceWithCBUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  group = self->_group;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BB45C;
  block[3] = &unk_10050E1D8;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_group_notify(group, queue, block);
}

- (void)fetchCBUUIDForDeviceWithAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  group = self->_group;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BB62C;
  block[3] = &unk_10050E1D8;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_group_notify(group, queue, block);
}

- (void)_aadConnectionInterrupted
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BB934;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_aadActivatingWithRetry:(BOOL)a3 andError:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = AFSiriLogContextDaemon;
  if (v6)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315650;
      *(void *)&location[4] = "-[ADCoreBluetoothV2DeviceSource _aadActivatingWithRetry:andError:]";
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 1024;
      BOOL v16 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Failed to activate discovery, error: %@, will retry: %d", location, 0x1Cu);
      if (v4) {
        goto LABEL_4;
      }
    }
    else if (v4)
    {
LABEL_4:
      objc_initWeak((id *)location, self);
      setupQueue = self->_setupQueue;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000BBC50;
      handler[3] = &unk_100509778;
      objc_copyWeak(&v11, (id *)location);
      notify_register_dispatch("com.apple.AudioAccessory.daemonStarted", (int *)&unk_100580AB0, setupQueue, handler);
      objc_destroyWeak(&v11);
      objc_destroyWeak((id *)location);
      goto LABEL_10;
    }
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315138;
      *(void *)&location[4] = "-[ADCoreBluetoothV2DeviceSource _aadActivatingWithRetry:andError:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Discovery activation failed after a retry", location, 0xCu);
    }
  }
  else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 136315138;
    *(void *)&location[4] = "-[ADCoreBluetoothV2DeviceSource _aadActivatingWithRetry:andError:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s Discovery activation was successful", location, 0xCu);
  }
LABEL_10:
  dispatch_group_leave((dispatch_group_t)self->_group);
}

- (void)aadActivatingWithRetry:(BOOL)a3 andError:(id)a4
{
  id v6 = a4;
  setupQueue = self->_setupQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BBDE0;
  block[3] = &unk_10050CA08;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(setupQueue, block);
}

- (void)_handleDeviceLost:(id)a3
{
  id v4 = a3;
  v5 = [v4 bluetoothAddress];
  id v6 = AFNormalizeMacAddress();

  id v7 = [v4 identifier];

  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315650;
    id v14 = "-[ADCoreBluetoothV2DeviceSource _handleDeviceLost:]";
    __int16 v15 = 2112;
    BOOL v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s Device lost: %@ (%@)", (uint8_t *)&v13, 0x20u);
  }
  [(NSMapTable *)self->_cbuuidByAddress removeObjectForKey:v6];
  [(NSMapTable *)self->_addressByCBUUID removeObjectForKey:v7];
  id v9 = [(NSMapTable *)self->_devicesByDeviceUID objectForKey:v7];
  id v10 = [(NSMapTable *)self->_devicesByAddress objectForKey:v7];
  if (v9)
  {
    BOOL v11 = v9;
LABEL_7:
    [v11 invalidate];
    goto LABEL_8;
  }
  id v12 = [(NSMapTable *)self->_devicesByAddress objectForKey:v6];

  if (v12)
  {
    BOOL v11 = v10;
    goto LABEL_7;
  }
LABEL_8:
  [(NSMapTable *)self->_devicesByDeviceUID removeObjectForKey:v7];
  [(NSMapTable *)self->_devicesByAddress removeObjectForKey:v6];
}

- (void)handleDeviceLost:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BC02C;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_handleDeviceFound:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 bluetoothAddress];
    id v7 = AFNormalizeMacAddress();

    id v8 = [v5 identifier];
    [(NSMapTable *)self->_addressByCBUUID setObject:v7 forKey:v8];
    [(NSMapTable *)self->_cbuuidByAddress setObject:v8 forKey:v7];
    id v9 = [(NSMapTable *)self->_devicesByDeviceUID objectForKey:v8];
    id v10 = [(NSMapTable *)self->_devicesByAddress objectForKey:v7];
    if (v9)
    {
      BOOL v11 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v20 = 136315394;
        v21 = "-[ADCoreBluetoothV2DeviceSource _handleDeviceFound:]";
        __int16 v22 = 2112;
        v23 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Device found with UID: %@", (uint8_t *)&v20, 0x16u);
      }
      [v9 updateDevice:v5];
      if (v10) {
        goto LABEL_14;
      }
      devicesByAddress = self->_devicesByAddress;
      int v13 = v9;
      id v14 = v7;
    }
    else
    {
      BOOL v16 = AFSiriLogContextDaemon;
      BOOL v17 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
      if (!v10)
      {
        if (v17)
        {
          int v20 = 136315650;
          v21 = "-[ADCoreBluetoothV2DeviceSource _handleDeviceFound:]";
          __int16 v22 = 2112;
          v23 = v7;
          __int16 v24 = 2112;
          v25 = v8;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Device not found, no need to update device: %@ (%@)", (uint8_t *)&v20, 0x20u);
        }
        goto LABEL_14;
      }
      if (v17)
      {
        int v20 = 136315394;
        v21 = "-[ADCoreBluetoothV2DeviceSource _handleDeviceFound:]";
        __int16 v22 = 2112;
        v23 = v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Device found with address: %@", (uint8_t *)&v20, 0x16u);
      }
      [(NSMapTable *)self->_devicesByDeviceUID setObject:v10 forKey:v8];
      [v10 updateDevice:v5];
      devicesByAddress = self->_devicesByDeviceUID;
      int v13 = v10;
      id v14 = v8;
    }
    [(NSMapTable *)devicesByAddress setObject:v13 forKey:v14];
LABEL_14:
    id v18 = sub_100239BE0(v5);
    if (AFDeviceSupportsBobble() && [v18 isSupported])
    {
      id v19 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v20 = 136315650;
        v21 = "-[ADCoreBluetoothV2DeviceSource _handleDeviceFound:]";
        __int16 v22 = 2112;
        v23 = v7;
        __int16 v24 = 2112;
        v25 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Updating headGestureConfiguration for supported device: %@ (%@)", (uint8_t *)&v20, 0x20u);
      }
      [(NSMapTable *)self->_headGestureConfigurationByAddress setObject:v18 forKey:v7];
    }

    goto LABEL_20;
  }
  __int16 v15 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v20 = 136315138;
    v21 = "-[ADCoreBluetoothV2DeviceSource _handleDeviceFound:]";
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Device found in nil", (uint8_t *)&v20, 0xCu);
  }
LABEL_20:
}

- (void)handleDeviceFound:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BC440;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_setupDiscoveryWithRetry:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_group_enter((dispatch_group_t)self->_group);
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 136315394;
    *(void *)&location[4] = "-[ADCoreBluetoothV2DeviceSource _setupDiscoveryWithRetry:]";
    __int16 v22 = 1024;
    BOOL v23 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s  %d:", location, 0x12u);
  }
  id v6 = (AADeviceManager *)objc_alloc_init(off_100580AB8());
  aaDeviceManager = self->_aaDeviceManager;
  self->_aaDeviceManager = v6;

  [(AADeviceManager *)self->_aaDeviceManager setDispatchQueue:self->_queue];
  objc_initWeak((id *)location, self);
  id v8 = self->_aaDeviceManager;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000BC760;
  v19[3] = &unk_100500D58;
  objc_copyWeak(&v20, (id *)location);
  [(AADeviceManager *)v8 setDeviceFoundHandler:v19];
  id v9 = self->_aaDeviceManager;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000BC7C4;
  v17[3] = &unk_100500D58;
  objc_copyWeak(&v18, (id *)location);
  [(AADeviceManager *)v9 setDeviceLostHandler:v17];
  id v10 = self->_aaDeviceManager;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000BC828;
  v14[3] = &unk_100500D80;
  objc_copyWeak(&v15, (id *)location);
  BOOL v16 = v3;
  [(AADeviceManager *)v10 activateWithCompletion:v14];
  BOOL v11 = self->_aaDeviceManager;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000BC890;
  v12[3] = &unk_10050B790;
  objc_copyWeak(&v13, (id *)location);
  [(AADeviceManager *)v11 setInterruptionHandler:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)location);
}

- (id)queue
{
  return self->_queue;
}

- (id)devicesByDeviceUID
{
  return self->_devicesByDeviceUID;
}

- (id)devicesByAddress
{
  return self->_devicesByAddress;
}

- (id)_createDeviceWithUID:(id)a3
{
  id v4 = a3;
  v5 = [[ADCoreBluetoothV2Device alloc] initWithDeviceUID:v4 dataSource:self];

  return v5;
}

- (id)_createDeviceWithAddress:(id)a3
{
  id v4 = a3;
  v5 = [[ADCoreBluetoothV2Device alloc] initWithAddress:v4 dataSource:self];

  return v5;
}

- (void)_invalidate
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[ADCoreBluetoothV2DeviceSource _invalidate]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = self->_devicesByAddress;
  id v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(NSMapTable *)self->_devicesByAddress objectForKey:*(void *)(*((void *)&v20 + 1) + 8 * (void)v8)];
        [v9 invalidate];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMapTable *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = self->_devicesByDeviceUID;
  id v11 = [(NSMapTable *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = -[NSMapTable objectForKey:](self->_devicesByDeviceUID, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * (void)v14), (void)v16);
        [v15 invalidate];

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSMapTable *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  [(NSMapTable *)self->_devicesByAddress removeAllObjects];
  [(NSMapTable *)self->_devicesByDeviceUID removeAllObjects];
  [(NSMapTable *)self->_cbuuidByAddress removeAllObjects];
  [(NSMapTable *)self->_addressByCBUUID removeAllObjects];
  [(NSMapTable *)self->_headGestureConfigurationByAddress removeAllObjects];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BCE58;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)invalidateDeviceWithAddress:(id)a3 cbuuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BCF24;
  block[3] = &unk_10050DCB8;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (id)_deviceWithUID:(id)a3 createsIfAbsent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  devicesByDeviceUID = self->_devicesByDeviceUID;
  id v8 = [v6 UUIDString];
  id v9 = [(NSMapTable *)devicesByDeviceUID objectForKey:v8];

  if (v9)
  {
    id v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      long long v21 = "-[ADCoreBluetoothV2DeviceSource _deviceWithUID:createsIfAbsent:]";
      __int16 v22 = 2112;
      id v23 = v6;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s  %@: %@", buf, 0x20u);
    }
  }
  else if (v6 && v4)
  {
    id v11 = [(ADCoreBluetoothV2DeviceSource *)self _createDeviceWithUID:v6];
    id v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      long long v21 = "-[ADCoreBluetoothV2DeviceSource _deviceWithUID:createsIfAbsent:]";
      __int16 v22 = 2112;
      id v23 = v6;
      __int16 v24 = 2112;
      id v25 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s  %@ not found, created %@", buf, 0x20u);
    }
    id v13 = self->_devicesByDeviceUID;
    id v14 = [v6 UUIDString];
    [(NSMapTable *)v13 setObject:v11 forKey:v14];

    id v15 = [v6 UUIDString];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000BD2BC;
    v17[3] = &unk_100500D30;
    id v9 = v11;
    id v18 = v9;
    long long v19 = self;
    [(ADCoreBluetoothV2DeviceSource *)self fetchAddressForDeviceWithCBUUID:v15 completion:v17];
  }
  return v9;
}

- (id)_deviceWithAddress:(id)a3 createsIfAbsent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = AFNormalizeMacAddress();
  uint64_t v8 = [(NSMapTable *)self->_devicesByAddress objectForKey:v7];
  if (v8)
  {
    id v9 = (id)v8;
    id v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "-[ADCoreBluetoothV2DeviceSource _deviceWithAddress:createsIfAbsent:]";
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s  %@: %@", buf, 0x20u);
    }
  }
  else if (v4 && [v7 length])
  {
    id v11 = [(ADCoreBluetoothV2DeviceSource *)self _createDeviceWithAddress:v6];
    id v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "-[ADCoreBluetoothV2DeviceSource _deviceWithAddress:createsIfAbsent:]";
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s  %@ not found, created %@", buf, 0x20u);
    }
    [(NSMapTable *)self->_devicesByAddress setObject:v11 forKey:v7];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000BD5DC;
    v14[3] = &unk_100500D30;
    id v9 = v11;
    id v15 = v9;
    long long v16 = self;
    [(ADCoreBluetoothV2DeviceSource *)self fetchCBUUIDForDeviceWithAddress:v7 completion:v14];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)headGestureConfigurationForBTAddress:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = sub_1000BD7D8;
  long long v17 = sub_1000BD7E8;
  id v18 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BD7F0;
  block[3] = &unk_10050C700;
  id v11 = self;
  id v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)deviceWithUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_1000BD7D8;
  long long v16 = sub_1000BD7E8;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BDA18;
  block[3] = &unk_10050C700;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)deviceWithAddress:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_1000BD7D8;
  long long v16 = sub_1000BD7E8;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BDD40;
  block[3] = &unk_10050C700;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (ADCoreBluetoothV2DeviceSource)init
{
  v16.receiver = self;
  v16.super_class = (Class)ADCoreBluetoothV2DeviceSource;
  v2 = [(ADCoreBluetoothV2DeviceSource *)&v16 init];
  if (v2)
  {
    BOOL v3 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[ADCoreBluetoothV2DeviceSource init]";
      __int16 v19 = 2112;
      id v20 = v2;
      _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s Creating %@", buf, 0x16u);
    }
    dispatch_group_t v4 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v4;

    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.assistantd.ADCoreBluetoothV2DeviceSource.setup", v6);

    setupQueue = v2->_setupQueue;
    v2->_setupQueue = (OS_dispatch_queue *)v7;

    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.assistantd.ADCoreBluetoothV2DeviceSource", v9);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v10;

    uint64_t v12 = v2->_setupQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BE124;
    block[3] = &unk_10050E138;
    uint64_t v15 = v2;
    dispatch_async(v12, block);
  }
  return v2;
}

@end