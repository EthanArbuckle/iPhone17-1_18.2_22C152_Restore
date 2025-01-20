@interface CSBluetoothManager
+ (id)sharedInstance;
- (BOOL)isAttachingBluetoothSession;
- (BTAccessoryManagerImpl)accessoryManager;
- (BTLocalDeviceImpl)localDevice;
- (BTSessionImpl)bluetoothSession;
- (CSBluetoothManager)init;
- (NSArray)connectedDeviceAddresses;
- (NSArray)pairedDeviceAddresses;
- (NSHashTable)observers;
- (NSMutableDictionary)deviceAddressToDeviceInfoMap;
- (OS_dispatch_group)bluetoothSessionSetupGroup;
- (OS_dispatch_queue)queue;
- (id)_getAddressWithBTDevice:(BTDeviceImpl *)a3;
- (id)_getBluetoothDeviceInfoForDeviceWithBTAddressString:(id)a3;
- (id)_getConnectedBluetoothDeviceAddressesFromLocalDevice:(BTLocalDeviceImpl *)a3;
- (id)_getWirelessSplitterInfoFromLocalDevice:(BTLocalDeviceImpl *)a3;
- (id)_setBluetoothDeviceInfoForDevice:(BTDeviceImpl *)a3;
- (id)getBluetoothDeviceInfoForDeviceWithId:(id)a3;
- (void)CSFirstUnlockMonitor:(id)a3 didReceiveFirstUnlock:(BOOL)a4;
- (void)_attachBluetoothSession;
- (void)_clearBluetoothDeviceInfoForDevice:(BTDeviceImpl *)a3;
- (void)_detachBluetoothSession;
- (void)_fetchAllConnectedDevices;
- (void)_loadAACPCapabilityForDevice:(BTDeviceImpl *)a3 deviceAddress:(id)a4;
- (void)_sessionAttached:(BTSessionImpl *)a3 result:(int)a4;
- (void)_sessionDetached:(BTSessionImpl *)a3;
- (void)_sessionTerminated:(BTSessionImpl *)a3;
- (void)_setUpAccessoryManager;
- (void)_setUpLocalDevice;
- (void)_tearDownAccessoryManager;
- (void)_tearDownLocalDevice;
- (void)accessoryManager:(BTAccessoryManagerImpl *)a3 accessoryEvent:(int)a4 device:(BTDeviceImpl *)a5 accessoryState:(int)a6;
- (void)device:(BTDeviceImpl *)a3 serviceMask:(unsigned int)a4 serviceEventType:(int)a5 serviceSpecificEvent:(unsigned int)a6 result:(int)a7;
- (void)getBTDeviceInfoWithBTAddressString:(id)a3 withCompletion:(id)a4;
- (void)getBTLocalDeviceWithCompletion:(id)a3;
- (void)getConnectedBluetoothDeviceAddressesWithCompletion:(id)a3;
- (void)getWirelessSplitterInfoWithCompletion:(id)a3;
- (void)setAccessoryManager:(BTAccessoryManagerImpl *)a3;
- (void)setBluetoothSession:(BTSessionImpl *)a3;
- (void)setBluetoothSessionSetupGroup:(id)a3;
- (void)setConnectedDeviceAddresses:(id)a3;
- (void)setDeviceAddressToDeviceInfoMap:(id)a3;
- (void)setIsAttachingBluetoothSession:(BOOL)a3;
- (void)setLocalDevice:(BTLocalDeviceImpl *)a3;
- (void)setObservers:(id)a3;
- (void)setPairedDeviceAddresses:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSBluetoothManager

- (void)getBTDeviceInfoWithBTAddressString:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__CSBluetoothManager_getBTDeviceInfoWithBTAddressString_withCompletion___block_invoke;
  v10[3] = &unk_1E62012D8;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(CSBluetoothManager *)self getBTLocalDeviceWithCompletion:v10];
}

- (void)getBTLocalDeviceWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[CSBluetoothManager getBTLocalDeviceWithCompletion:]";
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Trying to access BTLocalDevice", buf, 0xCu);
  }
  bluetoothSessionSetupGroup = self->_bluetoothSessionSetupGroup;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__CSBluetoothManager_getBTLocalDeviceWithCompletion___block_invoke;
  v9[3] = &unk_1E62012B0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_group_notify(bluetoothSessionSetupGroup, queue, v9);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_13518 != -1) {
    dispatch_once(&sharedInstance_onceToken_13518, &__block_literal_global_13519);
  }
  v2 = (void *)sharedInstance_sharedInstance_13520;
  return v2;
}

uint64_t __53__CSBluetoothManager_getBTLocalDeviceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[CSBluetoothManager getBTLocalDeviceWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Accessing BTLocalDevice", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 32)) {
    uint64_t v4 = *(void *)(v3 + 40);
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[CSBluetoothManager getBTLocalDeviceWithCompletion:]_block_invoke";
    __int16 v9 = 2050;
    uint64_t v10 = v4;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s BTLocalDevice %{public}p", (uint8_t *)&v7, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  }
  return result;
}

void __72__CSBluetoothManager_getBTDeviceInfoWithBTAddressString_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) _getBluetoothDeviceInfoForDeviceWithBTAddressString:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (id)_getBluetoothDeviceInfoForDeviceWithBTAddressString:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = [(NSMutableDictionary *)self->_deviceAddressToDeviceInfoMap allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v12 = [v11 address];
        int v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          v16 = (void *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            v17 = v16;
            v18 = [v11 address];
            *(_DWORD *)buf = 136315651;
            v33 = "-[CSBluetoothManager _getBluetoothDeviceInfoForDeviceWithBTAddressString:]";
            __int16 v34 = 2113;
            double v35 = *(double *)&v11;
            __int16 v36 = 2113;
            v37 = v18;
            _os_log_impl(&dword_1BA1A5000, v17, OS_LOG_TYPE_DEFAULT, "%s Using cached CSBluetoothDeviceInfo: %{private}@ for BTDevice with Address: %{private}@", buf, 0x20u);
          }
          v19 = v11;

          goto LABEL_24;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v38 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v14 = v4;
  [v14 UTF8String];
  BTDeviceAddressFromString();
  if (v14 && self->_bluetoothSession)
  {
    v15 = objc_alloc_init(CSBluetoothDeviceInfo);
    [(NSMutableDictionary *)self->_deviceAddressToDeviceInfoMap setObject:v15 forKey:v14];
    BTDeviceFromAddress();
  }
  else
  {
    v15 = 0;
  }
  uint64_t v20 = mach_absolute_time();
  v21 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v22 = v20 - v5;
    v23 = v21;
    if (_CSMachAbsoluteTimeRate_onceToken != -1) {
      dispatch_once(&_CSMachAbsoluteTimeRate_onceToken, &__block_literal_global_407);
    }
    *(_DWORD *)buf = 136315394;
    v33 = "-[CSBluetoothManager _getBluetoothDeviceInfoForDeviceWithBTAddressString:]";
    __int16 v34 = 2048;
    double v35 = *(double *)&_CSMachAbsoluteTimeRate_rate * (double)v22 / 1000000000.0;
    _os_log_impl(&dword_1BA1A5000, v23, OS_LOG_TYPE_DEFAULT, "%s Elapsed time: %f seconds", buf, 0x16u);

    v21 = CSLogContextFacilityCoreSpeech;
  }
  os_signpost_id_t v24 = os_signpost_id_generate(v21);
  v25 = (id)CSLogContextFacilityCoreSpeech;
  v26 = v25;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA1A5000, v26, OS_SIGNPOST_EVENT, v24, "getBluetoothDeviceInfoForDeviceWithId_latency", "", buf, 2u);
  }

  v19 = v15;
LABEL_24:

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAddressToDeviceInfoMap, 0);
  objc_storeStrong((id *)&self->_bluetoothSessionSetupGroup, 0);
  objc_storeStrong((id *)&self->_connectedDeviceAddresses, 0);
  objc_storeStrong((id *)&self->_pairedDeviceAddresses, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setDeviceAddressToDeviceInfoMap:(id)a3
{
}

- (NSMutableDictionary)deviceAddressToDeviceInfoMap
{
  return self->_deviceAddressToDeviceInfoMap;
}

- (void)setAccessoryManager:(BTAccessoryManagerImpl *)a3
{
  self->_accessoryManager = a3;
}

- (BTAccessoryManagerImpl)accessoryManager
{
  return self->_accessoryManager;
}

- (void)setBluetoothSessionSetupGroup:(id)a3
{
}

- (OS_dispatch_group)bluetoothSessionSetupGroup
{
  return self->_bluetoothSessionSetupGroup;
}

- (void)setConnectedDeviceAddresses:(id)a3
{
}

- (NSArray)connectedDeviceAddresses
{
  return self->_connectedDeviceAddresses;
}

- (void)setPairedDeviceAddresses:(id)a3
{
}

- (NSArray)pairedDeviceAddresses
{
  return self->_pairedDeviceAddresses;
}

- (void)setLocalDevice:(BTLocalDeviceImpl *)a3
{
  self->_localDevice = a3;
}

- (BTLocalDeviceImpl)localDevice
{
  return self->_localDevice;
}

- (void)setIsAttachingBluetoothSession:(BOOL)a3
{
  self->_isAttachingBluetoothSession = a3;
}

- (BOOL)isAttachingBluetoothSession
{
  return self->_isAttachingBluetoothSession;
}

- (void)setBluetoothSession:(BTSessionImpl *)a3
{
  self->_bluetoothSession = a3;
}

- (BTSessionImpl)bluetoothSession
{
  return self->_bluetoothSession;
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)CSFirstUnlockMonitor:(id)a3 didReceiveFirstUnlock:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__CSBluetoothManager_CSFirstUnlockMonitor_didReceiveFirstUnlock___block_invoke;
  v4[3] = &unk_1E62013A0;
  v4[4] = self;
  -[CSBluetoothManager getBTLocalDeviceWithCompletion:](self, "getBTLocalDeviceWithCompletion:", v4, a4);
}

uint64_t __65__CSBluetoothManager_CSFirstUnlockMonitor_didReceiveFirstUnlock___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
  id v2 = *(void **)(a1 + 32);
  return [v2 _fetchAllConnectedDevices];
}

- (void)_clearBluetoothDeviceInfoForDevice:(BTDeviceImpl *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = [(CSBluetoothManager *)self _getAddressWithBTDevice:a3];
  if (v4)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_deviceAddressToDeviceInfoMap objectForKey:v4];
    if (v5)
    {
      id v6 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315395;
        uint64_t v8 = "-[CSBluetoothManager _clearBluetoothDeviceInfoForDevice:]";
        __int16 v9 = 2113;
        uint64_t v10 = v4;
        _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Lost BTDevice with address %{private}@", (uint8_t *)&v7, 0x16u);
      }
      [(NSMutableDictionary *)self->_deviceAddressToDeviceInfoMap removeObjectForKey:v4];
    }
  }
}

- (void)_loadAACPCapabilityForDevice:(BTDeviceImpl *)a3 deviceAddress:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (v5)
  {
    id v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315395;
      v17 = "-[CSBluetoothManager _loadAACPCapabilityForDevice:deviceAddress:]";
      __int16 v18 = 2113;
      *(void *)v19 = v5;
      _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Loading AACP capabilities for BTDevice with address %{private}@", buf, 0x16u);
    }
    int v7 = [(NSMutableDictionary *)self->_deviceAddressToDeviceInfoMap objectForKey:v5];
    if (v7)
    {
      uint64_t v8 = mach_absolute_time();
      int AACPCapabilityInteger = BTAccessoryManagerGetAACPCapabilityInteger();
      uint64_t v10 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v17 = "-[CSBluetoothManager _loadAACPCapabilityForDevice:deviceAddress:]";
        __int16 v18 = 1024;
        *(_DWORD *)v19 = AACPCapabilityInteger == 0;
        *(_WORD *)&v19[4] = 1024;
        *(_DWORD *)&v19[6] = 96;
        __int16 v20 = 1024;
        int v21 = 0;
        __int16 v22 = 1024;
        int v23 = 0;
        _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s GetAACPCapability result: BT_SUCCESS=%d, AACP capability bit: %d,  AACP capability supported: %d (%d)", buf, 0x24u);
      }
      [v7 setSupportMph:0];
      uint64_t v11 = mach_absolute_time();
      id v12 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v13 = v11 - v8;
        id v14 = v12;
        if (_CSMachAbsoluteTimeRate_onceToken != -1) {
          dispatch_once(&_CSMachAbsoluteTimeRate_onceToken, &__block_literal_global_407);
        }
        *(_DWORD *)buf = 136315394;
        v17 = "-[CSBluetoothManager _loadAACPCapabilityForDevice:deviceAddress:]";
        __int16 v18 = 2048;
        *(double *)v19 = *(double *)&_CSMachAbsoluteTimeRate_rate * (double)v13 / 1000000000.0;
        _os_log_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_DEFAULT, "%s BT AACP capability retrieval latency %f seconds", buf, 0x16u);
      }
    }
    else
    {
      v15 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315395;
        v17 = "-[CSBluetoothManager _loadAACPCapabilityForDevice:deviceAddress:]";
        __int16 v18 = 2113;
        *(void *)v19 = v5;
        _os_log_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_DEFAULT, "%s Received AACP capabilities for BTDevice with address %{private}@ not in the connected list.", buf, 0x16u);
      }
    }
  }
}

- (id)_setBluetoothDeviceInfoForDevice:(BTDeviceImpl *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = -[CSBluetoothManager _getAddressWithBTDevice:](self, "_getAddressWithBTDevice:");
  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_deviceAddressToDeviceInfoMap objectForKey:v5];
    if (!v6)
    {
      int v7 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v11 = "-[CSBluetoothManager _setBluetoothDeviceInfoForDevice:]";
        __int16 v12 = 2112;
        unint64_t v13 = v5;
        _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Found BTDevice with address %@", buf, 0x16u);
      }
      id v6 = objc_alloc_init(CSBluetoothDeviceInfo);
      BTDeviceSupportsHS();
      BTDeviceIsTemporaryPairedNotInContacts();
      uint64_t v8 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315395;
        uint64_t v11 = "-[CSBluetoothManager _setBluetoothDeviceInfoForDevice:]";
        __int16 v12 = 2113;
        unint64_t v13 = v5;
        _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Device with address %{private}@ is temporary paired and not in contacts", buf, 0x16u);
      }
      [(CSBluetoothDeviceInfo *)v6 setAddress:v5];
      [(CSBluetoothDeviceInfo *)v6 setSupportDoAP:0];
      [(CSBluetoothDeviceInfo *)v6 setIsTemporaryPairedNotInContacts:1];
      [(NSMutableDictionary *)self->_deviceAddressToDeviceInfoMap setObject:v6 forKey:v5];
      [(CSBluetoothManager *)self _loadAACPCapabilityForDevice:a3 deviceAddress:v5];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_fetchAllConnectedDevices
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!self->_accessoryManager)
  {
    id v2 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[CSBluetoothManager _fetchAllConnectedDevices]";
      _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Accessory manager is not initialized", buf, 0xCu);
    }
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  *(_OWORD *)buf = 0u;
  long long v4 = 0u;
  BTLocalDeviceGetConnectedDevices();
}

- (void)_tearDownAccessoryManager
{
  if (self->_accessoryManager) {
    self->_accessoryManager = 0;
  }
}

- (void)_setUpAccessoryManager
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  p_accessoryManager = &self->_accessoryManager;
  if (BTAccessoryManagerGetDefault())
  {
    uint64_t v3 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      long long v6 = "-[CSBluetoothManager _setUpAccessoryManager]";
      _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Failed to get default accessory manager", (uint8_t *)&v5, 0xCu);
    }
    *p_accessoryManager = 0;
  }
  else if (BTAccessoryManagerAddCallbacks())
  {
    long long v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      long long v6 = "-[CSBluetoothManager _setUpAccessoryManager]";
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Failed to add accessory manager callbacks", (uint8_t *)&v5, 0xCu);
    }
  }
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(CSBluetoothManager *)self _tearDownLocalDevice];
  if (!self->_bluetoothSession)
  {
    uint64_t v8 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v14 = 136315138;
    long long v15 = "-[CSBluetoothManager _setUpLocalDevice]";
    uint64_t v7 = "%s Bluetooth Session is NULL";
    long long v9 = v8;
    uint32_t v10 = 12;
    goto LABEL_11;
  }
  int Default = BTLocalDeviceGetDefault();
  if (Default)
  {
    int v4 = Default;
    uint64_t v5 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      return;
    }
    bluetoothSession = self->_bluetoothSession;
    int v14 = 136315650;
    long long v15 = "-[CSBluetoothManager _setUpLocalDevice]";
    __int16 v16 = 2050;
    long long v17 = bluetoothSession;
    __int16 v18 = 1026;
    int v19 = v4;
    uint64_t v7 = "%s Failed to get default local device from session %{public}p, (result = %{public}d)";
    goto LABEL_10;
  }
  int v11 = BTLocalDeviceAddCallbacks();
  if (v11)
  {
    int v12 = v11;
    uint64_t v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      long long v13 = self->_bluetoothSession;
      int v14 = 136315650;
      long long v15 = "-[CSBluetoothManager _setUpLocalDevice]";
      __int16 v16 = 2050;
      long long v17 = v13;
      __int16 v18 = 1026;
      int v19 = v12;
      uint64_t v7 = "%s Failed to add local device callback from session %{public}p, (result = %{public}d";
LABEL_10:
      long long v9 = v5;
      uint32_t v10 = 28;
LABEL_11:
      _os_log_error_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v14, v10);
    }
  }
}

- (void)_sessionTerminated:(BTSessionImpl *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[CSBluetoothManager _sessionTerminated:]";
    __int16 v9 = 2048;
    uint32_t v10 = a3;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s session = %p", (uint8_t *)&v7, 0x16u);
  }
  if (self->_bluetoothSession == a3)
  {
    if (a3)
    {
      BTServiceRemoveCallbacks();
      self->_bluetoothSession = 0;
    }
    [(NSMutableDictionary *)self->_deviceAddressToDeviceInfoMap removeAllObjects];
    [(CSBluetoothManager *)self _tearDownAccessoryManager];
    [(CSBluetoothManager *)self _attachBluetoothSession];
  }
  else
  {
    long long v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[CSBluetoothManager _sessionTerminated:]";
      _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, "%s terminated session is different from currently attached session, ignore", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_sessionDetached:(BTSessionImpl *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[CSBluetoothManager _sessionDetached:]";
    __int16 v9 = 2048;
    uint32_t v10 = a3;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s session = %p", (uint8_t *)&v7, 0x16u);
  }
  if (self->_bluetoothSession == a3)
  {
    [(CSBluetoothManager *)self _tearDownLocalDevice];
    if (self->_bluetoothSession)
    {
      BTServiceRemoveCallbacks();
      self->_bluetoothSession = 0;
    }
    [(NSMutableDictionary *)self->_deviceAddressToDeviceInfoMap removeAllObjects];
    [(CSBluetoothManager *)self _tearDownAccessoryManager];
  }
  else
  {
    long long v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[CSBluetoothManager _sessionDetached:]";
      _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, "%s detached session is different from currently attached session, ignore", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_sessionAttached:(BTSessionImpl *)a3 result:(int)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    __int16 v9 = "-[CSBluetoothManager _sessionAttached:result:]";
    __int16 v10 = 2050;
    uint64_t v11 = a3;
    __int16 v12 = 1026;
    int v13 = a4;
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s session = %{public}p, uint64_t result = %{public}d", (uint8_t *)&v8, 0x1Cu);
  }
  self->_isAttachingBluetoothSession = 0;
  if (!a4)
  {
    [(CSBluetoothManager *)self _detachBluetoothSession];
    self->_bluetoothSession = a3;
    if (a3) {
      BTServiceAddCallbacks();
    }
    [(CSBluetoothManager *)self _setUpLocalDevice];
    [(CSBluetoothManager *)self _setUpAccessoryManager];
    [(CSBluetoothManager *)self _fetchAllConnectedDevices];
  }
  dispatch_group_leave((dispatch_group_t)self->_bluetoothSessionSetupGroup);
}

- (void)accessoryManager:(BTAccessoryManagerImpl *)a3 accessoryEvent:(int)a4 device:(BTDeviceImpl *)a5 accessoryState:(int)a6
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a4 == 22)
  {
    int v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v12 = "-[CSBluetoothManager accessoryManager:accessoryEvent:device:accessoryState:]";
      _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
    queue = self->_queue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __76__CSBluetoothManager_accessoryManager_accessoryEvent_device_accessoryState___block_invoke;
    v10[3] = &unk_1E6201378;
    v10[4] = self;
    void v10[5] = a5;
    dispatch_async(queue, v10);
  }
}

void __76__CSBluetoothManager_accessoryManager_accessoryEvent_device_accessoryState___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _getAddressWithBTDevice:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _loadAACPCapabilityForDevice:*(void *)(a1 + 40) deviceAddress:v2];
}

- (void)device:(BTDeviceImpl *)a3 serviceMask:(unsigned int)a4 serviceEventType:(int)a5 serviceSpecificEvent:(unsigned int)a6 result:(int)a7
{
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__CSBluetoothManager_device_serviceMask_serviceEventType_serviceSpecificEvent_result___block_invoke;
  v8[3] = &unk_1E6201350;
  int v9 = a7;
  int v10 = a5;
  unsigned int v11 = a6;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(queue, v8);
}

id __86__CSBluetoothManager_device_serviceMask_serviceEventType_serviceSpecificEvent_result___block_invoke(id result)
{
  if (!*((_DWORD *)result + 12))
  {
    int v1 = *((_DWORD *)result + 13);
    if (v1 == 1)
    {
      if (*((_DWORD *)result + 14) == 12)
      {
        uint64_t v2 = *((void *)result + 5);
        uint64_t v3 = (void *)*((void *)result + 4);
        return (id)[v3 _clearBluetoothDeviceInfoForDevice:v2];
      }
    }
    else if (!v1 && *((_DWORD *)result + 14) == 11)
    {
      return (id)[*((id *)result + 4) _setBluetoothDeviceInfoForDevice:*((void *)result + 5)];
    }
  }
  return result;
}

- (void)_attachBluetoothSession
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isAttachingBluetoothSession)
  {
    uint64_t v3 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      long long v6 = "-[CSBluetoothManager _attachBluetoothSession]";
      _os_log_error_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_ERROR, "%s Already Attaching Bluetooth Session", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    [(CSBluetoothManager *)self _detachBluetoothSession];
    if (!BTSessionAttachWithQueue())
    {
      int v4 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315138;
        long long v6 = "-[CSBluetoothManager _attachBluetoothSession]";
        _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Start attaching bluetooth session", (uint8_t *)&v5, 0xCu);
      }
      self->_isAttachingBluetoothSession = 1;
      dispatch_group_enter((dispatch_group_t)self->_bluetoothSessionSetupGroup);
    }
  }
}

- (void)_detachBluetoothSession
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(CSBluetoothManager *)self _tearDownLocalDevice];
  bluetoothSession = self->_bluetoothSession;
  p_bluetoothSession = &self->_bluetoothSession;
  if (bluetoothSession)
  {
    BTServiceRemoveCallbacks();
    int v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      long long v6 = *p_bluetoothSession;
      int v7 = 136315394;
      int v8 = "-[CSBluetoothManager _detachBluetoothSession]";
      __int16 v9 = 2050;
      int v10 = v6;
      _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Detaching bluetooth session : %{public}p", (uint8_t *)&v7, 0x16u);
    }
    BTSessionDetachWithQueue();
  }
}

- (id)_getWirelessSplitterInfoFromLocalDevice:(BTLocalDeviceImpl *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
LABEL_5:
    long long v6 = 0;
    goto LABEL_6;
  }
  int IsSharingEnabled = BTLocalDeviceIsSharingEnabled();
  if (IsSharingEnabled)
  {
    int v4 = IsSharingEnabled;
    int v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int buf = 136315394;
      buf_4 = "-[CSBluetoothManager _getWirelessSplitterInfoFromLocalDevice:]";
      __int16 buf_12 = 1024;
      int buf_14 = v4;
      _os_log_error_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_ERROR, "%s Failed to get sharing enable flag : %d", (uint8_t *)&buf, 0x12u);
    }
    goto LABEL_5;
  }
  long long v6 = objc_alloc_init(CSBluetoothWirelessSplitterInfo);
  [(CSBluetoothWirelessSplitterInfo *)v6 setSplitterEnabled:0];
LABEL_6:
  return v6;
}

- (id)getBluetoothDeviceInfoForDeviceWithId:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__13495;
  long long v23 = __Block_byref_object_dispose__13496;
  id v24 = 0;
  uint64_t v5 = mach_absolute_time();
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CSBluetoothManager_getBluetoothDeviceInfoForDeviceWithId___block_invoke;
  block[3] = &unk_1E6201328;
  block[4] = self;
  id v7 = v4;
  id v17 = v7;
  __int16 v18 = &v19;
  dispatch_sync(queue, block);
  uint64_t v8 = mach_absolute_time();
  __int16 v9 = (id)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v10 = v8 - v5;
    if (_CSMachAbsoluteTimeRate_onceToken != -1) {
      dispatch_once(&_CSMachAbsoluteTimeRate_onceToken, &__block_literal_global_407);
    }
    *(_DWORD *)int buf = 136315394;
    long long v26 = "-[CSBluetoothManager getBluetoothDeviceInfoForDeviceWithId:]";
    __int16 v27 = 2048;
    double v28 = *(double *)&_CSMachAbsoluteTimeRate_rate * (double)v10 / 1000000000.0;
    _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Elapsed time: %f seconds", buf, 0x16u);
  }

  os_signpost_id_t v11 = os_signpost_id_generate((os_log_t)CSLogContextFacilityCoreSpeech);
  uint64_t v12 = (id)CSLogContextFacilityCoreSpeech;
  uint64_t v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)int buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA1A5000, v13, OS_SIGNPOST_EVENT, v11, "getBluetoothDeviceInfoForDeviceWithId_latency", "", buf, 2u);
  }

  id v14 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v14;
}

void __60__CSBluetoothManager_getBluetoothDeviceInfoForDeviceWithId___block_invoke(void *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = [*(id *)(a1[4] + 80) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v8 = [v7 deviceIdentifier];
        int v9 = [v8 isEqualToString:a1[5]];

        if (v9)
        {
          unint64_t v10 = (void *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            os_signpost_id_t v11 = v10;
            uint64_t v12 = [v7 deviceIdentifier];
            *(_DWORD *)int buf = 136315651;
            uint64_t v20 = "-[CSBluetoothManager getBluetoothDeviceInfoForDeviceWithId:]_block_invoke";
            __int16 v21 = 2113;
            long long v22 = v7;
            __int16 v23 = 2113;
            id v24 = v12;
            _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Using cached CSBluetoothDeviceInfo: %{private}@ for BTDevice with identifier: %{private}@", buf, 0x20u);
          }
          objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v25 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  uint64_t v13 = (void *)a1[5];
  if (v13 && *(void *)(a1[4] + 32) && !*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    memset(uu, 0, sizeof(uu));
    uuid_parse((const char *)[v13 UTF8String], uu);
    if (!uuid_is_null(uu)) {
      BTDeviceFromIdentifier();
    }
  }
}

- (id)_getAddressWithBTDevice:(BTDeviceImpl *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
LABEL_5:
    id v7 = 0;
    goto LABEL_7;
  }
  uint64_t v16 = 0;
  memset(v15, 0, sizeof(v15));
  int AddressString = BTDeviceGetAddressString();
  if (AddressString)
  {
    int v5 = AddressString;
    long long v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315650;
      unint64_t v10 = "-[CSBluetoothManager _getAddressWithBTDevice:]";
      __int16 v11 = 2048;
      uint64_t v12 = a3;
      __int16 v13 = 1024;
      int v14 = v5;
      _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, "%s Failed getting address from BTDevice %p (uint64_t result = %d).", (uint8_t *)&v9, 0x1Cu);
    }
    goto LABEL_5;
  }
  id v7 = (void *)[[NSString alloc] initWithUTF8String:v15];
LABEL_7:
  return v7;
}

- (id)_getConnectedBluetoothDeviceAddressesFromLocalDevice:(BTLocalDeviceImpl *)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CSLogContextFacilityCoreSpeech;
  if (!a3)
  {
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[CSBluetoothManager _getConnectedBluetoothDeviceAddressesFromLocalDevice:]";
      uint64_t v8 = "%s Local device is NULL.";
      int v9 = buf;
      unint64_t v10 = v3;
      uint32_t v11 = 12;
      goto LABEL_19;
    }
LABEL_8:
    id v12 = 0;
    goto LABEL_15;
  }
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSBluetoothManager _getConnectedBluetoothDeviceAddressesFromLocalDevice:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Getting connected devices from local device %p...", buf, 0x16u);
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  memset(buf, 0, sizeof(buf));
  int ConnectedDevices = BTLocalDeviceGetConnectedDevices();
  if (ConnectedDevices)
  {
    int v6 = ConnectedDevices;
    uint64_t v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v16 = 136315650;
      uint64_t v17 = "-[CSBluetoothManager _getConnectedBluetoothDeviceAddressesFromLocalDevice:]";
      __int16 v18 = 2048;
      uint64_t v19 = a3;
      __int16 v20 = 1024;
      LODWORD(v21) = v6;
      uint64_t v8 = "%s Failed getting connected devices from local device %p (result = %d).";
      int v9 = v16;
      unint64_t v10 = v7;
      uint32_t v11 = 28;
LABEL_19:
      _os_log_error_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_ERROR, v8, v9, v11);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ([0 count]) {
    id v12 = 0;
  }
  else {
    id v12 = (id)MEMORY[0x1E4F1CBF0];
  }
  __int16 v13 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = v13;
    *(_DWORD *)uint64_t v16 = 136315650;
    uint64_t v17 = "-[CSBluetoothManager _getConnectedBluetoothDeviceAddressesFromLocalDevice:]";
    __int16 v18 = 2048;
    uint64_t v19 = (BTLocalDeviceImpl *)[v12 count];
    __int16 v20 = 2048;
    __int16 v21 = a3;
    _os_log_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_DEFAULT, "%s Got %tu connected devices from local device %p.", v16, 0x20u);
  }
LABEL_15:
  return v12;
}

- (void)getConnectedBluetoothDeviceAddressesWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__CSBluetoothManager_getConnectedBluetoothDeviceAddressesWithCompletion___block_invoke;
  v6[3] = &unk_1E6201300;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CSBluetoothManager *)self getBTLocalDeviceWithCompletion:v6];
}

void __73__CSBluetoothManager_getConnectedBluetoothDeviceAddressesWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) _getConnectedBluetoothDeviceAddressesFromLocalDevice:a2];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)getWirelessSplitterInfoWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__CSBluetoothManager_getWirelessSplitterInfoWithCompletion___block_invoke;
  v6[3] = &unk_1E6201300;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CSBluetoothManager *)self getBTLocalDeviceWithCompletion:v6];
}

void __60__CSBluetoothManager_getWirelessSplitterInfoWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) _getWirelessSplitterInfoFromLocalDevice:a2];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (CSBluetoothManager)init
{
  if (+[CSUtils isDarwinOS])
  {
    id v3 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CSBluetoothManager;
    id v4 = [(CSBluetoothManager *)&v15 init];
    if (v4)
    {
      dispatch_queue_t v5 = dispatch_queue_create("CSBluetoothManager Queue", 0);
      int v6 = (void *)*((void *)v4 + 2);
      *((void *)v4 + 2) = v5;

      dispatch_group_t v7 = dispatch_group_create();
      uint64_t v8 = (void *)*((void *)v4 + 8);
      *((void *)v4 + 8) = v7;

      *((unsigned char *)v4 + 8) = 0;
      uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
      unint64_t v10 = (void *)*((void *)v4 + 10);
      *((void *)v4 + 10) = v9;

      dispatch_group_enter(*((dispatch_group_t *)v4 + 8));
      uint32_t v11 = *((void *)v4 + 2);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __26__CSBluetoothManager_init__block_invoke;
      block[3] = &unk_1E6201288;
      id v14 = v4;
      dispatch_async(v11, block);
    }
    self = (CSBluetoothManager *)v4;
    id v3 = self;
  }

  return v3;
}

void __26__CSBluetoothManager_init__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _attachBluetoothSession];
  uint64_t v2 = +[CSFirstUnlockMonitor sharedInstance];
  [v2 addObserver:*(void *)(a1 + 32)];

  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  dispatch_group_leave(v3);
}

uint64_t __36__CSBluetoothManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_13520 = objc_alloc_init(CSBluetoothManager);
  return MEMORY[0x1F41817F8]();
}

@end