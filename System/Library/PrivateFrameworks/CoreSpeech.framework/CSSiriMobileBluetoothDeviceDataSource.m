@interface CSSiriMobileBluetoothDeviceDataSource
- (CSSiriMobileBluetoothDeviceDataSource)init;
- (id)_deviceProxies;
- (id)_deviceProxyWithAddress:(id)a3 createsIfAbsent:(BOOL)a4;
- (id)_deviceProxyWithUID:(id)a3 createsIfAbsent:(BOOL)a4;
- (id)deviceWithAddress:(id)a3;
- (id)deviceWithUID:(id)a3;
- (void)_attachToSession;
- (void)_cleanUpDeviceProxies;
- (void)_detachFromSession;
- (void)_reloadForDevice:(BTDeviceImpl *)a3;
- (void)_sessionAttached:(BTSessionImpl *)a3 result:(int)a4;
- (void)_sessionDetached:(BTSessionImpl *)a3;
- (void)_sessionTerminated:(BTSessionImpl *)a3;
- (void)_setUpAccessoryManager;
- (void)_setUpLocalDevice;
- (void)_tearDownAccessoryManager;
- (void)_tearDownLocalDevice;
- (void)accessoryManager:(BTAccessoryManagerImpl *)a3 event:(int)a4 device:(BTDeviceImpl *)a5 state:(int)a6;
- (void)getBTDeviceWithAddress:(id)a3 completion:(id)a4;
- (void)getBTDeviceWithDeviceUID:(id)a3 completion:(id)a4;
- (void)getBTLocalDeviceWithCompletion:(id)a3;
- (void)invalidate;
- (void)localDevice:(BTLocalDeviceImpl *)a3 event:(int)a4 result:(int)a5;
@end

@implementation CSSiriMobileBluetoothDeviceDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceProxiesByDeviceUID, 0);
  objc_storeStrong((id *)&self->_deviceProxiesByAddress, 0);
  objc_storeStrong((id *)&self->_sessionSetupGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)_deviceProxyWithUID:(id)a3 createsIfAbsent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(NSMutableDictionary *)self->_deviceProxiesByDeviceUID objectForKey:v6];
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    v7 = [[CSSiriMobileBluetoothDeviceProxy alloc] initWithDeviceUID:v6 dataSource:self queue:self->_queue];
    [(NSMutableDictionary *)self->_deviceProxiesByDeviceUID setObject:v7 forKey:v6];
  }

  return v7;
}

- (id)_deviceProxyWithAddress:(id)a3 createsIfAbsent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(NSMutableDictionary *)self->_deviceProxiesByAddress objectForKey:v6];
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    v7 = [[CSSiriMobileBluetoothDeviceProxy alloc] initWithAddress:v6 dataSource:self queue:self->_queue];
    [(NSMutableDictionary *)self->_deviceProxiesByAddress setObject:v7 forKey:v6];
  }

  return v7;
}

- (id)deviceWithUID:(id)a3
{
  p_deviceProxiesLock = &self->_deviceProxiesLock;
  id v5 = a3;
  os_unfair_lock_lock(p_deviceProxiesLock);
  id v6 = [(CSSiriMobileBluetoothDeviceDataSource *)self _deviceProxyWithUID:v5 createsIfAbsent:1];

  os_unfair_lock_unlock(p_deviceProxiesLock);
  return v6;
}

- (id)deviceWithAddress:(id)a3
{
  p_deviceProxiesLock = &self->_deviceProxiesLock;
  id v5 = a3;
  os_unfair_lock_lock(p_deviceProxiesLock);
  id v6 = [(CSSiriMobileBluetoothDeviceDataSource *)self _deviceProxyWithAddress:v5 createsIfAbsent:1];

  os_unfair_lock_unlock(p_deviceProxiesLock);
  return v6;
}

- (void)getBTLocalDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  sessionSetupGroup = self->_sessionSetupGroup;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__CSSiriMobileBluetoothDeviceDataSource_getBTLocalDeviceWithCompletion___block_invoke;
  v8[3] = &unk_1E658D3A0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify(sessionSetupGroup, queue, v8);
}

uint64_t __72__CSSiriMobileBluetoothDeviceDataSource_getBTLocalDeviceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 16)) {
    uint64_t v3 = *(void *)(v2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[CSSiriMobileBluetoothDeviceDataSource getBTLocalDeviceWithCompletion:]_block_invoke";
    __int16 v8 = 2048;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_INFO, "%s BTLocalDevice %p", (uint8_t *)&v6, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

- (void)getBTDeviceWithDeviceUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sessionSetupGroup = self->_sessionSetupGroup;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__CSSiriMobileBluetoothDeviceDataSource_getBTDeviceWithDeviceUID_completion___block_invoke;
  block[3] = &unk_1E658D198;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_group_notify(sessionSetupGroup, queue, block);
}

uint64_t __77__CSSiriMobileBluetoothDeviceDataSource_getBTDeviceWithDeviceUID_completion___block_invoke(uint64_t a1)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (os_log_t *)MEMORY[0x1E4F4E368];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    v16[0] = 0;
    v16[1] = 0;
    [*(id *)(a1 + 40) getUUIDBytes:v16];
    int v3 = BTDeviceFromIdentifier();
    if (v3)
    {
      int v4 = v3;
      id v5 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v11 = "-[CSSiriMobileBluetoothDeviceDataSource getBTDeviceWithDeviceUID:completion:]_block_invoke";
        __int16 v12 = 1024;
        LODWORD(v13) = v4;
        _os_log_error_impl(&dword_1C9338000, v5, OS_LOG_TYPE_ERROR, "%s Failed getting device from deviceUID %d", buf, 0x12u);
      }
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 32);
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    id v11 = "-[CSSiriMobileBluetoothDeviceDataSource getBTDeviceWithDeviceUID:completion:]_block_invoke";
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_INFO, "%s BTDevice %p for deviceUID %@", buf, 0x20u);
    id v7 = *v2;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[CSSiriMobileBluetoothDeviceDataSource getBTDeviceWithDeviceUID:completion:]_block_invoke";
    __int16 v12 = 2048;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_INFO, "%s BTAccessoryManager %p", buf, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, v6);
  }
  return result;
}

- (void)getBTDeviceWithAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sessionSetupGroup = self->_sessionSetupGroup;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__CSSiriMobileBluetoothDeviceDataSource_getBTDeviceWithAddress_completion___block_invoke;
  block[3] = &unk_1E658D198;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_group_notify(sessionSetupGroup, queue, block);
}

uint64_t __75__CSSiriMobileBluetoothDeviceDataSource_getBTDeviceWithAddress_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (os_log_t *)MEMORY[0x1E4F4E368];
  if (!*(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  WORD2(v13) = 0;
  LODWORD(v13) = 0;
  objc_msgSend(*(id *)(a1 + 40), "UTF8String", v13);
  int v3 = BTDeviceAddressFromString();
  if (!v3)
  {
    int v8 = BTDeviceFromAddress();
    if (!v8) {
      goto LABEL_8;
    }
    int v9 = v8;
    id v5 = *v2;
    if (!os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[CSSiriMobileBluetoothDeviceDataSource getBTDeviceWithAddress:completion:]_block_invoke";
    __int16 v16 = 1024;
    LODWORD(v17) = v9;
    id v6 = "%s Failed getting device from address %d";
    goto LABEL_17;
  }
  int v4 = v3;
  id v5 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[CSSiriMobileBluetoothDeviceDataSource getBTDeviceWithAddress:completion:]_block_invoke";
    __int16 v16 = 1024;
    LODWORD(v17) = v4;
    id v6 = "%s Failed getting device address from string %d";
LABEL_17:
    _os_log_error_impl(&dword_1C9338000, v5, OS_LOG_TYPE_ERROR, v6, buf, 0x12u);
  }
LABEL_8:
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 32);
LABEL_9:
  id v10 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    uint64_t v15 = "-[CSSiriMobileBluetoothDeviceDataSource getBTDeviceWithAddress:completion:]_block_invoke";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_INFO, "%s BTDevice %p for address %@", buf, 0x20u);
    id v10 = *v2;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[CSSiriMobileBluetoothDeviceDataSource getBTDeviceWithAddress:completion:]_block_invoke";
    __int16 v16 = 2048;
    uint64_t v17 = v7;
    _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_INFO, "%s BTAccessoryManager %p", buf, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, v7);
  }
  return result;
}

- (id)_deviceProxies
{
  p_deviceProxiesLock = &self->_deviceProxiesLock;
  os_unfair_lock_lock(&self->_deviceProxiesLock);
  int v4 = [(NSMutableDictionary *)self->_deviceProxiesByAddress allValues];
  id v5 = [(NSMutableDictionary *)self->_deviceProxiesByDeviceUID allValues];
  os_unfair_lock_unlock(p_deviceProxiesLock);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v4 count]) {
    [v6 addObjectsFromArray:v4];
  }
  if ([v5 count]) {
    [v6 addObjectsFromArray:v5];
  }

  return v6;
}

- (void)_reloadForDevice:(BTDeviceImpl *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v4 = _CSSiriBTDeviceGetAddress(a3);
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [(CSSiriMobileBluetoothDeviceDataSource *)self _deviceProxies];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __58__CSSiriMobileBluetoothDeviceDataSource__reloadForDevice___block_invoke;
          v11[3] = &unk_1E658C0F8;
          id v12 = v4;
          uint64_t v13 = v10;
          [v10 getDeviceInfo:v11];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

void __58__CSSiriMobileBluetoothDeviceDataSource__reloadForDevice___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 address];
  int v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    [v5 reload];
  }
}

- (void)accessoryManager:(BTAccessoryManagerImpl *)a3 event:(int)a4 device:(BTDeviceImpl *)a5 state:(int)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    long long v16 = "-[CSSiriMobileBluetoothDeviceDataSource accessoryManager:event:device:state:]";
    __int16 v17 = 2048;
    __int16 v18 = a3;
    __int16 v19 = 1024;
    int v20 = a4;
    __int16 v21 = 2048;
    v22 = a5;
    __int16 v23 = 1024;
    int v24 = a6;
    _os_log_impl(&dword_1C9338000, v11, OS_LOG_TYPE_INFO, "%s accessoryManager = %p, accessoryEvent = %d, device = %p, state = %d", buf, 0x2Cu);
  }
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__CSSiriMobileBluetoothDeviceDataSource_accessoryManager_event_device_state___block_invoke;
  v13[3] = &unk_1E658C0D0;
  v13[4] = self;
  v13[5] = a3;
  int v14 = a4;
  v13[6] = a5;
  dispatch_async(queue, v13);
}

void *__77__CSSiriMobileBluetoothDeviceDataSource_accessoryManager_event_device_state___block_invoke(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[4] == *(void *)(a1 + 40) && *(_DWORD *)(a1 + 56) <= 6u) {
    return (void *)[result _reloadForDevice:*(void *)(a1 + 48)];
  }
  return result;
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
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(CSSiriMobileBluetoothDeviceDataSource *)self _tearDownAccessoryManager];
  if (!self->_session)
  {
    id v10 = *MEMORY[0x1E4F4E368];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v16 = 136315138;
    __int16 v17 = "-[CSSiriMobileBluetoothDeviceDataSource _setUpAccessoryManager]";
    uint64_t v7 = "%s Session is NULL.";
    uint64_t v8 = v10;
    uint32_t v9 = 12;
    goto LABEL_10;
  }
  int Default = BTAccessoryManagerGetDefault();
  if (Default)
  {
    int v4 = Default;
    id v5 = *MEMORY[0x1E4F4E368];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR)) {
      return;
    }
    session = self->_session;
    int v16 = 136315650;
    __int16 v17 = "-[CSSiriMobileBluetoothDeviceDataSource _setUpAccessoryManager]";
    __int16 v18 = 2048;
    __int16 v19 = session;
    __int16 v20 = 1024;
    LODWORD(v21) = v4;
    uint64_t v7 = "%s Failed getting default accessory manager from session %p (result = %d).";
    uint64_t v8 = v5;
    uint32_t v9 = 28;
    goto LABEL_10;
  }
  int v11 = BTAccessoryManagerAddCallbacks();
  if (v11)
  {
    int v12 = v11;
    uint64_t v13 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR))
    {
      accessoryManager = self->_accessoryManager;
      long long v15 = self->_session;
      int v16 = 136315906;
      __int16 v17 = "-[CSSiriMobileBluetoothDeviceDataSource _setUpAccessoryManager]";
      __int16 v18 = 2048;
      __int16 v19 = accessoryManager;
      __int16 v20 = 2048;
      __int16 v21 = v15;
      __int16 v22 = 1024;
      int v23 = v12;
      uint64_t v7 = "%s Failed adding callbacks to accessory manager %p from session %p (result = %d).";
      uint64_t v8 = v13;
      uint32_t v9 = 38;
LABEL_10:
      _os_log_error_impl(&dword_1C9338000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v16, v9);
    }
  }
}

- (void)localDevice:(BTLocalDeviceImpl *)a3 event:(int)a4 result:(int)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint32_t v9 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    int v14 = "-[CSSiriMobileBluetoothDeviceDataSource localDevice:event:result:]";
    __int16 v15 = 2048;
    int v16 = a3;
    __int16 v17 = 1024;
    int v18 = a4;
    __int16 v19 = 1024;
    int v20 = a5;
    _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_INFO, "%s localDevice = %p, event = %d, uint64_t result = %d", buf, 0x22u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CSSiriMobileBluetoothDeviceDataSource_localDevice_event_result___block_invoke;
  block[3] = &unk_1E658C3A8;
  block[4] = self;
  void block[5] = a3;
  int v12 = a4;
  dispatch_async(queue, block);
}

void *__66__CSSiriMobileBluetoothDeviceDataSource_localDevice_event_result___block_invoke(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[3] == *(void *)(a1 + 40) && *(_DWORD *)(a1 + 48) == 11) {
    return (void *)[result _cleanUpDeviceProxies];
  }
  return result;
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
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(CSSiriMobileBluetoothDeviceDataSource *)self _tearDownLocalDevice];
  if (!self->_session)
  {
    id v10 = *MEMORY[0x1E4F4E368];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v16 = 136315138;
    __int16 v17 = "-[CSSiriMobileBluetoothDeviceDataSource _setUpLocalDevice]";
    uint64_t v7 = "%s Session is NULL.";
    uint64_t v8 = v10;
    uint32_t v9 = 12;
    goto LABEL_10;
  }
  int Default = BTLocalDeviceGetDefault();
  if (Default)
  {
    int v4 = Default;
    id v5 = *MEMORY[0x1E4F4E368];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR)) {
      return;
    }
    session = self->_session;
    int v16 = 136315650;
    __int16 v17 = "-[CSSiriMobileBluetoothDeviceDataSource _setUpLocalDevice]";
    __int16 v18 = 2048;
    __int16 v19 = session;
    __int16 v20 = 1024;
    LODWORD(v21) = v4;
    uint64_t v7 = "%s Failed getting default local device from session %p (result = %d).";
    uint64_t v8 = v5;
    uint32_t v9 = 28;
    goto LABEL_10;
  }
  int v11 = BTLocalDeviceAddCallbacks();
  if (v11)
  {
    int v12 = v11;
    uint64_t v13 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = self->_session;
      localDevice = self->_localDevice;
      int v16 = 136315906;
      __int16 v17 = "-[CSSiriMobileBluetoothDeviceDataSource _setUpLocalDevice]";
      __int16 v18 = 2048;
      __int16 v19 = localDevice;
      __int16 v20 = 2048;
      uint64_t v21 = v15;
      __int16 v22 = 1024;
      int v23 = v12;
      uint64_t v7 = "%s Failed adding callbacks to local device %p from session %p (result = %d).";
      uint64_t v8 = v13;
      uint32_t v9 = 38;
LABEL_10:
      _os_log_error_impl(&dword_1C9338000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v16, v9);
    }
  }
}

- (void)_sessionTerminated:(BTSessionImpl *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[CSSiriMobileBluetoothDeviceDataSource _sessionTerminated:]";
    __int16 v8 = 2048;
    uint32_t v9 = a3;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s session = %p", (uint8_t *)&v6, 0x16u);
  }
  if (self->_session == a3)
  {
    [(CSSiriMobileBluetoothDeviceDataSource *)self _tearDownAccessoryManager];
    [(CSSiriMobileBluetoothDeviceDataSource *)self _tearDownLocalDevice];
    if (self->_session)
    {
      BTServiceRemoveCallbacks();
      self->_session = 0;
    }
    [(CSSiriMobileBluetoothDeviceDataSource *)self _attachToSession];
  }
}

- (void)_sessionDetached:(BTSessionImpl *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[CSSiriMobileBluetoothDeviceDataSource _sessionDetached:]";
    __int16 v8 = 2048;
    uint32_t v9 = a3;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s session = %p", (uint8_t *)&v6, 0x16u);
  }
  if (self->_session == a3)
  {
    [(CSSiriMobileBluetoothDeviceDataSource *)self _cleanUpDeviceProxies];
    [(CSSiriMobileBluetoothDeviceDataSource *)self _tearDownAccessoryManager];
    [(CSSiriMobileBluetoothDeviceDataSource *)self _tearDownLocalDevice];
    if (self->_session)
    {
      BTServiceRemoveCallbacks();
      self->_session = 0;
    }
  }
}

- (void)_sessionAttached:(BTSessionImpl *)a3 result:(int)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v19 = "-[CSSiriMobileBluetoothDeviceDataSource _sessionAttached:result:]";
    __int16 v20 = 2048;
    uint64_t v21 = a3;
    __int16 v22 = 1024;
    int v23 = a4;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_INFO, "%s session = %p, uint64_t result = %d", buf, 0x1Cu);
  }
  self->_attachingToSession = 0;
  if (!a4)
  {
    [(CSSiriMobileBluetoothDeviceDataSource *)self _detachFromSession];
    self->_session = a3;
    if (a3) {
      BTServiceAddCallbacks();
    }
    [(CSSiriMobileBluetoothDeviceDataSource *)self _setUpLocalDevice];
    [(CSSiriMobileBluetoothDeviceDataSource *)self _setUpAccessoryManager];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    __int16 v8 = [(CSSiriMobileBluetoothDeviceDataSource *)self _deviceProxies];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * v12++) reload];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
  dispatch_group_leave((dispatch_group_t)self->_sessionSetupGroup);
}

- (void)_attachToSession
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_attachingToSession)
  {
    uint64_t v2 = *MEMORY[0x1E4F4E368];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v10 = 136315138;
    uint64_t v11 = "-[CSSiriMobileBluetoothDeviceDataSource _attachToSession]";
    int v3 = "%s Already attaching to session!";
    int v4 = v2;
    uint32_t v5 = 12;
LABEL_7:
    _os_log_error_impl(&dword_1C9338000, v4, OS_LOG_TYPE_ERROR, v3, (uint8_t *)&v10, v5);
    return;
  }
  [(CSSiriMobileBluetoothDeviceDataSource *)self _detachFromSession];
  int v7 = BTSessionAttachWithQueue();
  __int16 v8 = *MEMORY[0x1E4F4E368];
  if (v7)
  {
    int v9 = v7;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v10 = 136315394;
    uint64_t v11 = "-[CSSiriMobileBluetoothDeviceDataSource _attachToSession]";
    __int16 v12 = 1024;
    int v13 = v9;
    int v3 = "%s Failed attaching to bt session %d";
    int v4 = v8;
    uint32_t v5 = 18;
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[CSSiriMobileBluetoothDeviceDataSource _attachToSession]";
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_INFO, "%s Attaching to session", (uint8_t *)&v10, 0xCu);
  }
  self->_attachingToSession = 1;
  dispatch_group_enter((dispatch_group_t)self->_sessionSetupGroup);
}

- (void)_detachFromSession
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(CSSiriMobileBluetoothDeviceDataSource *)self _tearDownAccessoryManager];
  [(CSSiriMobileBluetoothDeviceDataSource *)self _tearDownLocalDevice];
  session = self->_session;
  p_session = &self->_session;
  if (session)
  {
    BTServiceRemoveCallbacks();
    uint32_t v5 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
    {
      int v6 = *p_session;
      int v7 = 136315394;
      __int16 v8 = "-[CSSiriMobileBluetoothDeviceDataSource _detachFromSession]";
      __int16 v9 = 2048;
      int v10 = v6;
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s Detaching from session %p", (uint8_t *)&v7, 0x16u);
    }
    BTSessionDetachWithQueue();
    *p_session = 0;
  }
}

- (void)_cleanUpDeviceProxies
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v3 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[CSSiriMobileBluetoothDeviceDataSource _cleanUpDeviceProxies]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
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
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v10++) invalidate];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "invalidate", (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CSSiriMobileBluetoothDeviceDataSource_invalidate__block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __51__CSSiriMobileBluetoothDeviceDataSource_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanUpDeviceProxies];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _detachFromSession];
}

- (CSSiriMobileBluetoothDeviceDataSource)init
{
  v21.receiver = self;
  v21.super_class = (Class)CSSiriMobileBluetoothDeviceDataSource;
  id v2 = [(CSSiriMobileBluetoothDeviceDataSource *)&v21 init];
  if (v2)
  {
    int v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("CSSiriMobileBluetoothDeviceDataSource", v3);

    uint32_t v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    dispatch_group_t v6 = dispatch_group_create();
    uint64_t v7 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v6;

    *((_DWORD *)v2 + 14) = 0;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v8;

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v11 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v10;

    dispatch_group_enter(*((dispatch_group_t *)v2 + 6));
    uint64_t v12 = *((void *)v2 + 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__CSSiriMobileBluetoothDeviceDataSource_init__block_invoke;
    block[3] = &unk_1E658D4D8;
    id v20 = v2;
    dispatch_async(v12, block);
    id v13 = *((id *)v2 + 1);
    uint64_t v14 = +[CSSiriQueueMonitor sharedMonitor];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __45__CSSiriMobileBluetoothDeviceDataSource_init__block_invoke_2;
    v17[3] = &unk_1E658C0A8;
    id v18 = v13;
    id v15 = v13;
    [v14 addQueue:v15 heartBeatInterval:v17 timeoutInterval:5.0 timeoutHandler:5.0];
  }
  return (CSSiriMobileBluetoothDeviceDataSource *)v2;
}

void __45__CSSiriMobileBluetoothDeviceDataSource_init__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _attachToSession];
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  dispatch_group_leave(v2);
}

void __45__CSSiriMobileBluetoothDeviceDataSource_init__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"Queue %s did not respond to watchdog and is likely blocked.", dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 32)));
  id v2 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    dispatch_queue_t v4 = "-[CSSiriMobileBluetoothDeviceDataSource init]_block_invoke_2";
    __int16 v5 = 2112;
    dispatch_group_t v6 = v1;
    _os_log_fault_impl(&dword_1C9338000, v2, OS_LOG_TYPE_FAULT, "%s %@", buf, 0x16u);
  }
}

@end