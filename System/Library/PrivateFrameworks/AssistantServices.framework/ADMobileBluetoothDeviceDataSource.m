@interface ADMobileBluetoothDeviceDataSource
- (ADMobileBluetoothDeviceDataSource)init;
- (id)_connectedDeviceProxies;
- (id)_deviceProxies;
- (id)_deviceProxyWithAddress:(id)a3 createsIfAbsent:(BOOL)a4;
- (id)_deviceProxyWithUID:(id)a3 createsIfAbsent:(BOOL)a4;
- (id)_fetchConnectedDeviceAddresses;
- (id)_fetchPairedDeviceAddresses;
- (id)_pairedDeviceProxies;
- (id)deviceWithAddress:(id)a3;
- (id)deviceWithUID:(id)a3;
- (id)wirelessSplitterSession;
- (void)_attachToSession;
- (void)_cleanUpDeviceProxies;
- (void)_cleanUpWirelessSplitterProxy;
- (void)_detachFromSession;
- (void)_handleInEarStatusChangedForBTDevice:(BTDeviceImpl *)a3 fromAccessoryManager:(BTAccessoryManagerImpl *)a4;
- (void)_handleListeningModeChangedForBTDevice:(BTDeviceImpl *)a3 fromAccessoryManager:(BTAccessoryManagerImpl *)a4;
- (void)_reloadForDevice:(BTDeviceImpl *)a3;
- (void)_resetConnectedDeviceAddresses;
- (void)_resetPairedDeviceAddresses;
- (void)_sessionAttached:(BTSessionImpl *)a3 result:(int)a4;
- (void)_sessionDetached:(BTSessionImpl *)a3;
- (void)_sessionTerminated:(BTSessionImpl *)a3;
- (void)_setUpAccessoryManager;
- (void)_setUpLocalDevice;
- (void)_tearDownAccessoryManager;
- (void)_tearDownLocalDevice;
- (void)accessoryManager:(BTAccessoryManagerImpl *)a3 event:(int)a4 device:(BTDeviceImpl *)a5 state:(int)a6;
- (void)device:(BTDeviceImpl *)a3 serviceMask:(unsigned int)a4 serviceEventType:(int)a5 serviceSpecificEvent:(unsigned int)a6 result:(int)a7;
- (void)getBTDeviceWithAddress:(id)a3 completion:(id)a4;
- (void)getBTDeviceWithDeviceUID:(id)a3 completion:(id)a4;
- (void)getBTLocalDeviceWithCompletion:(id)a3;
- (void)getConnectedDevicesWithCompletion:(id)a3;
- (void)getPairedDevicesWithCompletion:(id)a3;
- (void)invalidate;
- (void)localDevice:(BTLocalDeviceImpl *)a3 event:(int)a4 result:(int)a5;
@end

@implementation ADMobileBluetoothDeviceDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceAddresses, 0);
  objc_storeStrong((id *)&self->_connectedDeviceAddresses, 0);
  objc_storeStrong((id *)&self->_wirelessSplitterSessionProxy, 0);
  objc_storeStrong((id *)&self->_deviceProxiesByDeviceUID, 0);
  objc_storeStrong((id *)&self->_deviceProxiesByAddress, 0);
  objc_storeStrong((id *)&self->_sessionSetupGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)_pairedDeviceProxies
{
  if (self->_pairedDeviceAddresses
    || ([(ADMobileBluetoothDeviceDataSource *)self _fetchPairedDeviceAddresses],
        v3 = (NSArray *)objc_claimAutoreleasedReturnValue(),
        pairedDeviceAddresses = self->_pairedDeviceAddresses,
        self->_pairedDeviceAddresses = v3,
        pairedDeviceAddresses,
        self->_pairedDeviceAddresses))
  {
    id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self->_pairedDeviceAddresses, "count"));
    os_unfair_lock_lock(&self->_deviceProxiesLock);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v6 = self->_pairedDeviceAddresses;
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = -[ADMobileBluetoothDeviceDataSource _deviceProxyWithAddress:createsIfAbsent:](self, "_deviceProxyWithAddress:createsIfAbsent:", *(void *)(*((void *)&v13 + 1) + 8 * i), 1, (void)v13);
          [v5 addObject:v11];
        }
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    os_unfair_lock_unlock(&self->_deviceProxiesLock);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)_fetchPairedDeviceAddresses
{
  localDevice = self->_localDevice;
  v3 = AFSiriLogContextDaemon;
  if (!localDevice)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[ADMobileBluetoothDeviceDataSource _fetchPairedDeviceAddresses]";
      uint64_t v9 = "%s Local device is NULL.";
      v10 = buf;
      v11 = v3;
      uint32_t v12 = 12;
      goto LABEL_21;
    }
LABEL_8:
    id v13 = 0;
    goto LABEL_17;
  }
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[ADMobileBluetoothDeviceDataSource _fetchPairedDeviceAddresses]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = localDevice;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Getting paired devices from local device %p...", buf, 0x16u);
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  memset(buf, 0, sizeof(buf));
  int PairedDevices = BTLocalDeviceGetPairedDevices();
  if (PairedDevices)
  {
    int v6 = PairedDevices;
    id v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      id v8 = self->_localDevice;
      *(_DWORD *)v19 = 136315650;
      v20 = "-[ADMobileBluetoothDeviceDataSource _fetchPairedDeviceAddresses]";
      __int16 v21 = 2048;
      v22 = v8;
      __int16 v23 = 1024;
      LODWORD(v24) = v6;
      uint64_t v9 = "%s Failed getting paired devices from local device %p (result = %d).";
      v10 = v19;
      v11 = v7;
      uint32_t v12 = 28;
LABEL_21:
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v9, v10, v12);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ([0 count]) {
    id v13 = [0 copy];
  }
  else {
    id v13 = &__NSArray0__struct;
  }
  long long v14 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    long long v15 = v14;
    long long v16 = (BTLocalDeviceImpl *)[v13 count];
    v17 = self->_localDevice;
    *(_DWORD *)v19 = 136315650;
    v20 = "-[ADMobileBluetoothDeviceDataSource _fetchPairedDeviceAddresses]";
    __int16 v21 = 2048;
    v22 = v16;
    __int16 v23 = 2048;
    v24 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Got %tu paired devices from local device %p.", v19, 0x20u);
  }
  if (AFIsInternalInstall()) {
    [v13 enumerateObjectsUsingBlock:&stru_1005013E0];
  }

LABEL_17:
  return v13;
}

- (void)_resetPairedDeviceAddresses
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    int v6 = "-[ADMobileBluetoothDeviceDataSource _resetPairedDeviceAddresses]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  pairedDeviceAddresses = self->_pairedDeviceAddresses;
  self->_pairedDeviceAddresses = 0;

  notify_post(AFBluetoothPairedDeviceInfoUpdated);
}

- (id)_connectedDeviceProxies
{
  if (self->_connectedDeviceAddresses
    || ([(ADMobileBluetoothDeviceDataSource *)self _fetchConnectedDeviceAddresses],
        v3 = (NSArray *)objc_claimAutoreleasedReturnValue(),
        connectedDeviceAddresses = self->_connectedDeviceAddresses,
        self->_connectedDeviceAddresses = v3,
        connectedDeviceAddresses,
        self->_connectedDeviceAddresses))
  {
    id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self->_connectedDeviceAddresses, "count"));
    os_unfair_lock_lock(&self->_deviceProxiesLock);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int v6 = self->_connectedDeviceAddresses;
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = -[ADMobileBluetoothDeviceDataSource _deviceProxyWithAddress:createsIfAbsent:](self, "_deviceProxyWithAddress:createsIfAbsent:", *(void *)(*((void *)&v13 + 1) + 8 * i), 1, (void)v13);
          [v5 addObject:v11];
        }
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    os_unfair_lock_unlock(&self->_deviceProxiesLock);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)_fetchConnectedDeviceAddresses
{
  localDevice = self->_localDevice;
  v3 = AFSiriLogContextDaemon;
  if (!localDevice)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[ADMobileBluetoothDeviceDataSource _fetchConnectedDeviceAddresses]";
      uint64_t v9 = "%s Local device is NULL.";
      v10 = buf;
      v11 = v3;
      uint32_t v12 = 12;
      goto LABEL_21;
    }
LABEL_8:
    id v13 = 0;
    goto LABEL_17;
  }
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[ADMobileBluetoothDeviceDataSource _fetchConnectedDeviceAddresses]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = localDevice;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Getting connected devices from local device %p...", buf, 0x16u);
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  memset(buf, 0, sizeof(buf));
  int ConnectedDevices = BTLocalDeviceGetConnectedDevices();
  if (ConnectedDevices)
  {
    int v6 = ConnectedDevices;
    id v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      id v8 = self->_localDevice;
      *(_DWORD *)v19 = 136315650;
      v20 = "-[ADMobileBluetoothDeviceDataSource _fetchConnectedDeviceAddresses]";
      __int16 v21 = 2048;
      v22 = v8;
      __int16 v23 = 1024;
      LODWORD(v24) = v6;
      uint64_t v9 = "%s Failed getting connected devices from local device %p (result = %d).";
      v10 = v19;
      v11 = v7;
      uint32_t v12 = 28;
LABEL_21:
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v9, v10, v12);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ([0 count]) {
    id v13 = [0 copy];
  }
  else {
    id v13 = &__NSArray0__struct;
  }
  long long v14 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    long long v15 = v14;
    long long v16 = (BTLocalDeviceImpl *)[v13 count];
    v17 = self->_localDevice;
    *(_DWORD *)v19 = 136315650;
    v20 = "-[ADMobileBluetoothDeviceDataSource _fetchConnectedDeviceAddresses]";
    __int16 v21 = 2048;
    v22 = v16;
    __int16 v23 = 2048;
    v24 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Got %tu connected devices from local device %p.", v19, 0x20u);
  }
  if (AFIsInternalInstall()) {
    [v13 enumerateObjectsUsingBlock:&stru_1005013C0];
  }

LABEL_17:
  return v13;
}

- (void)_resetConnectedDeviceAddresses
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    int v6 = "-[ADMobileBluetoothDeviceDataSource _resetConnectedDeviceAddresses]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  connectedDeviceAddresses = self->_connectedDeviceAddresses;
  self->_connectedDeviceAddresses = 0;
}

- (id)_deviceProxyWithUID:(id)a3 createsIfAbsent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_deviceProxiesByDeviceUID objectForKey:v6];
  if (!v7 && v6 && v4)
  {
    id v7 = [[ADMobileBluetoothDeviceProxy alloc] initWithDeviceUID:v6 dataSource:self queue:self->_queue];
    [(NSMutableDictionary *)self->_deviceProxiesByDeviceUID setObject:v7 forKey:v6];
  }

  return v7;
}

- (id)_deviceProxyWithAddress:(id)a3 createsIfAbsent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_deviceProxiesByAddress objectForKey:v6];
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    if ([v6 length])
    {
      id v7 = [[ADMobileBluetoothDeviceProxy alloc] initWithAddress:v6 dataSource:self queue:self->_queue];
      [(NSMutableDictionary *)self->_deviceProxiesByAddress setObject:v7 forKey:v6];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (id)wirelessSplitterSession
{
  if (AFSupportsWirelessSplitter())
  {
    p_wirelessSplitterSessionProxyLock = &self->_wirelessSplitterSessionProxyLock;
    os_unfair_lock_lock(&self->_wirelessSplitterSessionProxyLock);
    wirelessSplitterSessionProxy = self->_wirelessSplitterSessionProxy;
    if (!wirelessSplitterSessionProxy)
    {
      int v5 = [[ADMobileBluetoothWirelessSplitterSessionProxy alloc] initWithDataSource:self queue:self->_queue];
      id v6 = self->_wirelessSplitterSessionProxy;
      self->_wirelessSplitterSessionProxy = v5;

      wirelessSplitterSessionProxy = self->_wirelessSplitterSessionProxy;
    }
    id v7 = wirelessSplitterSessionProxy;
    os_unfair_lock_unlock(p_wirelessSplitterSessionProxyLock);
  }
  else
  {
    BOOL v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      v11 = "-[ADMobileBluetoothDeviceDataSource wirelessSplitterSession]";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Wireless Splitter is not supported on this platform.", (uint8_t *)&v10, 0xCu);
    }
    id v7 = 0;
  }
  return v7;
}

- (void)getPairedDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000E64DC;
    v7[3] = &unk_10050E188;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)getConnectedDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000E6798;
    v7[3] = &unk_10050E188;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (id)deviceWithUID:(id)a3
{
  p_deviceProxiesLock = &self->_deviceProxiesLock;
  id v5 = a3;
  os_unfair_lock_lock(p_deviceProxiesLock);
  id v6 = [(ADMobileBluetoothDeviceDataSource *)self _deviceProxyWithUID:v5 createsIfAbsent:1];

  os_unfair_lock_unlock(p_deviceProxiesLock);
  return v6;
}

- (id)deviceWithAddress:(id)a3
{
  p_deviceProxiesLock = &self->_deviceProxiesLock;
  id v5 = a3;
  os_unfair_lock_lock(p_deviceProxiesLock);
  id v6 = [(ADMobileBluetoothDeviceDataSource *)self _deviceProxyWithAddress:v5 createsIfAbsent:1];

  os_unfair_lock_unlock(p_deviceProxiesLock);
  return v6;
}

- (void)getBTLocalDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  sessionSetupGroup = self->_sessionSetupGroup;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E6B3C;
  v8[3] = &unk_10050E188;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify(sessionSetupGroup, queue, v8);
}

- (void)getBTDeviceWithDeviceUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sessionSetupGroup = self->_sessionSetupGroup;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E6CF8;
  block[3] = &unk_10050E1D8;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_group_notify(sessionSetupGroup, queue, block);
}

- (void)getBTDeviceWithAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sessionSetupGroup = self->_sessionSetupGroup;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E6FBC;
  block[3] = &unk_10050E1D8;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_group_notify(sessionSetupGroup, queue, block);
}

- (id)_deviceProxies
{
  p_deviceProxiesLock = &self->_deviceProxiesLock;
  os_unfair_lock_lock(&self->_deviceProxiesLock);
  id v4 = [(NSMutableDictionary *)self->_deviceProxiesByAddress allValues];
  id v5 = [(NSMutableDictionary *)self->_deviceProxiesByDeviceUID allValues];
  os_unfair_lock_unlock(p_deviceProxiesLock);
  id v6 = objc_alloc_init((Class)NSMutableArray);
  if ([v4 count]) {
    [v6 addObjectsFromArray:v4];
  }
  if ([v5 count]) {
    [v6 addObjectsFromArray:v5];
  }

  return v6;
}

- (void)_handleListeningModeChangedForBTDevice:(BTDeviceImpl *)a3 fromAccessoryManager:(BTAccessoryManagerImpl *)a4
{
  if (a3 && a4)
  {
    id v7 = sub_1000DCD40(a3);
    uint64_t v8 = sub_1000DE674((uint64_t)a3, (uint64_t)a4);
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      long long v26 = "-[ADMobileBluetoothDeviceDataSource _handleListeningModeChangedForBTDevice:fromAccessoryManager:]";
      __int16 v27 = 2112;
      long long v28 = v7;
      __int16 v29 = 2048;
      uint64_t v30 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s address = %@, headphoneListeningMode = %ld", buf, 0x20u);
    }
    if (v7)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = [(ADMobileBluetoothDeviceDataSource *)self _deviceProxies];
      id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          id v14 = 0;
          do
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            long long v15 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v14);
            v16[0] = _NSConcreteStackBlock;
            v16[1] = 3221225472;
            v16[2] = sub_1000E74E4;
            v16[3] = &unk_100501380;
            id v17 = v7;
            v18 = v15;
            uint64_t v19 = v8;
            [v15 getDeviceInfo:v16];

            id v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v12);
      }
    }
  }
}

- (void)_handleInEarStatusChangedForBTDevice:(BTDeviceImpl *)a3 fromAccessoryManager:(BTAccessoryManagerImpl *)a4
{
  if (a3 && a4)
  {
    id v7 = sub_1000DCD40(a3);
    uint64_t v8 = sub_1000DEA84((uint64_t)a3, (uint64_t)a4);
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      long long v26 = "-[ADMobileBluetoothDeviceDataSource _handleInEarStatusChangedForBTDevice:fromAccessoryManager:]";
      __int16 v27 = 2112;
      long long v28 = v7;
      __int16 v29 = 2112;
      uint64_t v30 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s address = %@, headphoneInEarDetectionState = %@", buf, 0x20u);
    }
    if (v7)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = [(ADMobileBluetoothDeviceDataSource *)self _deviceProxies];
      id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          id v14 = 0;
          do
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            long long v15 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v14);
            v16[0] = _NSConcreteStackBlock;
            v16[1] = 3221225472;
            v16[2] = sub_1000E777C;
            v16[3] = &unk_10050D200;
            id v17 = v7;
            v18 = v15;
            id v19 = v8;
            [v15 getDeviceInfo:v16];

            id v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v12);
      }
    }
  }
}

- (void)_reloadForDevice:(BTDeviceImpl *)a3
{
  id v4 = sub_1000DCD40(a3);
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [(ADMobileBluetoothDeviceDataSource *)self _deviceProxies];
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v9);
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_1000E796C;
          v11[3] = &unk_100501358;
          id v12 = v4;
          uint64_t v13 = v10;
          [v10 getDeviceInfo:v11];

          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

- (void)accessoryManager:(BTAccessoryManagerImpl *)a3 event:(int)a4 device:(BTDeviceImpl *)a5 state:(int)a6
{
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    long long v16 = "-[ADMobileBluetoothDeviceDataSource accessoryManager:event:device:state:]";
    __int16 v17 = 2048;
    v18 = a3;
    __int16 v19 = 1024;
    int v20 = a4;
    __int16 v21 = 2048;
    long long v22 = a5;
    __int16 v23 = 1024;
    int v24 = a6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s accessoryManager = %p, accessoryEvent = %d, device = %p, state = %d", buf, 0x2Cu);
  }
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000E7B2C;
  v13[3] = &unk_100501330;
  v13[4] = self;
  v13[5] = a3;
  int v14 = a4;
  v13[6] = a5;
  dispatch_async(queue, v13);
}

- (void)_tearDownAccessoryManager
{
  if (self->_accessoryManager)
  {
    BTAccessoryManagerRemoveCallbacks();
    self->_accessoryManager = 0;
  }
}

- (void)_setUpAccessoryManager
{
  [(ADMobileBluetoothDeviceDataSource *)self _tearDownAccessoryManager];
  if (!self->_session)
  {
    id v10 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v16 = 136315138;
    __int16 v17 = "-[ADMobileBluetoothDeviceDataSource _setUpAccessoryManager]";
    id v7 = "%s Session is NULL.";
    uint64_t v8 = v10;
    uint32_t v9 = 12;
    goto LABEL_10;
  }
  int Default = BTAccessoryManagerGetDefault();
  if (Default)
  {
    int v4 = Default;
    id v5 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      return;
    }
    session = self->_session;
    int v16 = 136315650;
    __int16 v17 = "-[ADMobileBluetoothDeviceDataSource _setUpAccessoryManager]";
    __int16 v18 = 2048;
    __int16 v19 = session;
    __int16 v20 = 1024;
    LODWORD(v21) = v4;
    id v7 = "%s Failed getting default accessory manager from session %p (result = %d).";
    uint64_t v8 = v5;
    uint32_t v9 = 28;
    goto LABEL_10;
  }
  int v11 = BTAccessoryManagerAddCallbacks();
  if (v11)
  {
    int v12 = v11;
    uint64_t v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      accessoryManager = self->_accessoryManager;
      long long v15 = self->_session;
      int v16 = 136315906;
      __int16 v17 = "-[ADMobileBluetoothDeviceDataSource _setUpAccessoryManager]";
      __int16 v18 = 2048;
      __int16 v19 = accessoryManager;
      __int16 v20 = 2048;
      __int16 v21 = v15;
      __int16 v22 = 1024;
      int v23 = v12;
      id v7 = "%s Failed adding callbacks to accessory manager %p from session %p (result = %d).";
      uint64_t v8 = v13;
      uint32_t v9 = 38;
LABEL_10:
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v16, v9);
    }
  }
}

- (void)localDevice:(BTLocalDeviceImpl *)a3 event:(int)a4 result:(int)a5
{
  uint32_t v9 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    int v14 = "-[ADMobileBluetoothDeviceDataSource localDevice:event:result:]";
    __int16 v15 = 2048;
    int v16 = a3;
    __int16 v17 = 1024;
    int v18 = a4;
    __int16 v19 = 1024;
    int v20 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s localDevice = %p, event = %d, result = %d", buf, 0x22u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E7FB4;
  block[3] = &unk_10050CD00;
  block[4] = self;
  void block[5] = a3;
  int v12 = a4;
  dispatch_async(queue, block);
}

- (void)_tearDownLocalDevice
{
  if (self->_localDevice)
  {
    BTLocalDeviceRemoveCallbacks();
    self->_localDevice = 0;
  }
}

- (void)_setUpLocalDevice
{
  [(ADMobileBluetoothDeviceDataSource *)self _tearDownLocalDevice];
  if (!self->_session)
  {
    id v10 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v16 = 136315138;
    __int16 v17 = "-[ADMobileBluetoothDeviceDataSource _setUpLocalDevice]";
    id v7 = "%s Session is NULL.";
    uint64_t v8 = v10;
    uint32_t v9 = 12;
    goto LABEL_10;
  }
  int Default = BTLocalDeviceGetDefault();
  if (Default)
  {
    int v4 = Default;
    id v5 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      return;
    }
    session = self->_session;
    int v16 = 136315650;
    __int16 v17 = "-[ADMobileBluetoothDeviceDataSource _setUpLocalDevice]";
    __int16 v18 = 2048;
    __int16 v19 = session;
    __int16 v20 = 1024;
    LODWORD(v21) = v4;
    id v7 = "%s Failed getting default local device from session %p (result = %d).";
    uint64_t v8 = v5;
    uint32_t v9 = 28;
    goto LABEL_10;
  }
  int v11 = BTLocalDeviceAddCallbacks();
  if (v11)
  {
    int v12 = v11;
    uint64_t v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = self->_session;
      localDevice = self->_localDevice;
      int v16 = 136315906;
      __int16 v17 = "-[ADMobileBluetoothDeviceDataSource _setUpLocalDevice]";
      __int16 v18 = 2048;
      __int16 v19 = localDevice;
      __int16 v20 = 2048;
      __int16 v21 = v15;
      __int16 v22 = 1024;
      int v23 = v12;
      id v7 = "%s Failed adding callbacks to local device %p from session %p (result = %d).";
      uint64_t v8 = v13;
      uint32_t v9 = 38;
LABEL_10:
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v16, v9);
    }
  }
}

- (void)device:(BTDeviceImpl *)a3 serviceMask:(unsigned int)a4 serviceEventType:(int)a5 serviceSpecificEvent:(unsigned int)a6 result:(int)a7
{
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E82E8;
  v8[3] = &unk_1005012D0;
  int v9 = a5;
  v8[4] = self;
  dispatch_async(queue, v8);
}

- (void)_sessionTerminated:(BTSessionImpl *)a3
{
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[ADMobileBluetoothDeviceDataSource _sessionTerminated:]";
    __int16 v8 = 2048;
    int v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s session = %p", (uint8_t *)&v6, 0x16u);
  }
  if (self->_session == a3)
  {
    [(ADMobileBluetoothDeviceDataSource *)self _tearDownAccessoryManager];
    [(ADMobileBluetoothDeviceDataSource *)self _tearDownLocalDevice];
    if (self->_session)
    {
      BTServiceRemoveCallbacks();
      self->_session = 0;
    }
    [(ADMobileBluetoothDeviceDataSource *)self _attachToSession];
  }
}

- (void)_sessionDetached:(BTSessionImpl *)a3
{
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[ADMobileBluetoothDeviceDataSource _sessionDetached:]";
    __int16 v8 = 2048;
    int v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s session = %p", (uint8_t *)&v6, 0x16u);
  }
  if (self->_session == a3)
  {
    [(ADMobileBluetoothDeviceDataSource *)self _cleanUpWirelessSplitterProxy];
    [(ADMobileBluetoothDeviceDataSource *)self _cleanUpDeviceProxies];
    [(ADMobileBluetoothDeviceDataSource *)self _tearDownAccessoryManager];
    [(ADMobileBluetoothDeviceDataSource *)self _tearDownLocalDevice];
    if (self->_session)
    {
      BTServiceRemoveCallbacks();
      self->_session = 0;
    }
  }
}

- (void)_sessionAttached:(BTSessionImpl *)a3 result:(int)a4
{
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v19 = "-[ADMobileBluetoothDeviceDataSource _sessionAttached:result:]";
    __int16 v20 = 2048;
    __int16 v21 = a3;
    __int16 v22 = 1024;
    int v23 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s session = %p, result = %d", buf, 0x1Cu);
  }
  self->_attachingToSession = 0;
  if (!a4)
  {
    [(ADMobileBluetoothDeviceDataSource *)self _detachFromSession];
    self->_session = a3;
    if (a3) {
      BTServiceAddCallbacks();
    }
    [(ADMobileBluetoothDeviceDataSource *)self _setUpLocalDevice];
    [(ADMobileBluetoothDeviceDataSource *)self _setUpAccessoryManager];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    __int16 v8 = [(ADMobileBluetoothDeviceDataSource *)self _deviceProxies];
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        int v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) reload];
          int v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }

    if (AFSupportsWirelessSplitter()) {
      [(ADMobileBluetoothWirelessSplitterSessionProxy *)self->_wirelessSplitterSessionProxy reload];
    }
  }
  dispatch_group_leave((dispatch_group_t)self->_sessionSetupGroup);
}

- (void)_attachToSession
{
  if (self->_attachingToSession)
  {
    v2 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v10 = 136315138;
    uint64_t v11 = "-[ADMobileBluetoothDeviceDataSource _attachToSession]";
    v3 = "%s Already attaching to session!";
    int v4 = v2;
    uint32_t v5 = 12;
LABEL_7:
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, v3, (uint8_t *)&v10, v5);
    return;
  }
  [(ADMobileBluetoothDeviceDataSource *)self _detachFromSession];
  int v7 = BTSessionAttachWithQueue();
  __int16 v8 = AFSiriLogContextDaemon;
  if (v7)
  {
    int v9 = v7;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v10 = 136315394;
    uint64_t v11 = "-[ADMobileBluetoothDeviceDataSource _attachToSession]";
    __int16 v12 = 1024;
    int v13 = v9;
    v3 = "%s Failed attaching to bt session %d";
    int v4 = v8;
    uint32_t v5 = 18;
    goto LABEL_7;
  }
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[ADMobileBluetoothDeviceDataSource _attachToSession]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Attaching to session", (uint8_t *)&v10, 0xCu);
  }
  self->_attachingToSession = 1;
  dispatch_group_enter((dispatch_group_t)self->_sessionSetupGroup);
}

- (void)_detachFromSession
{
  [(ADMobileBluetoothDeviceDataSource *)self _tearDownAccessoryManager];
  [(ADMobileBluetoothDeviceDataSource *)self _tearDownLocalDevice];
  session = self->_session;
  p_session = &self->_session;
  if (session)
  {
    BTServiceRemoveCallbacks();
    uint32_t v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v6 = *p_session;
      int v7 = 136315394;
      __int16 v8 = "-[ADMobileBluetoothDeviceDataSource _detachFromSession]";
      __int16 v9 = 2048;
      int v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Detaching from session %p", (uint8_t *)&v7, 0x16u);
    }
    BTSessionDetachWithQueue();
    *p_session = 0;
  }
}

- (void)_cleanUpWirelessSplitterProxy
{
  if (AFSupportsWirelessSplitter())
  {
    v3 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      __int16 v8 = "-[ADMobileBluetoothDeviceDataSource _cleanUpWirelessSplitterProxy]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
    }
    p_wirelessSplitterSessionProxyLock = &self->_wirelessSplitterSessionProxyLock;
    os_unfair_lock_lock(&self->_wirelessSplitterSessionProxyLock);
    wirelessSplitterSessionProxy = self->_wirelessSplitterSessionProxy;
    self->_wirelessSplitterSessionProxy = 0;
    int v6 = wirelessSplitterSessionProxy;

    os_unfair_lock_unlock(p_wirelessSplitterSessionProxyLock);
    [(ADMobileBluetoothWirelessSplitterSessionProxy *)v6 invalidate];
  }
}

- (void)_cleanUpDeviceProxies
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v27 = "-[ADMobileBluetoothDeviceDataSource _cleanUpDeviceProxies]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  os_unfair_lock_lock(&self->_deviceProxiesLock);
  int v4 = [(NSMutableDictionary *)self->_deviceProxiesByAddress allValues];
  [(NSMutableDictionary *)self->_deviceProxiesByAddress removeAllObjects];
  uint32_t v5 = [(NSMutableDictionary *)self->_deviceProxiesByDeviceUID allValues];
  [(NSMutableDictionary *)self->_deviceProxiesByDeviceUID removeAllObjects];
  os_unfair_lock_unlock(&self->_deviceProxiesLock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      int v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)v10) invalidate];
        int v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v5;
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      long long v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v15), "invalidate", (void)v16);
        long long v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E8DA8;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (ADMobileBluetoothDeviceDataSource)init
{
  v22.receiver = self;
  v22.super_class = (Class)ADMobileBluetoothDeviceDataSource;
  id v2 = [(ADMobileBluetoothDeviceDataSource *)&v22 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("ADMobileBluetoothDeviceDataSource", v4);
    id v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;

    dispatch_group_t v7 = dispatch_group_create();
    id v8 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v7;

    *((_DWORD *)v2 + 14) = 0;
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    int v10 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v9;

    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    id v12 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v11;

    *((_DWORD *)v2 + 20) = 0;
    dispatch_group_enter(*((dispatch_group_t *)v2 + 6));
    id v13 = *((void *)v2 + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000E8FD8;
    block[3] = &unk_10050E138;
    id v21 = v2;
    dispatch_async(v13, block);
    id v14 = *((id *)v2 + 1);
    long long v15 = +[ADQueueMonitor sharedMonitor];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000E9018;
    v18[3] = &unk_10050C458;
    id v19 = v14;
    id v16 = v14;
    [v15 addQueue:v16 heartBeatInterval:v18 timeoutInterval:5.0 timeoutHandler:5.0];
  }
  return (ADMobileBluetoothDeviceDataSource *)v2;
}

@end