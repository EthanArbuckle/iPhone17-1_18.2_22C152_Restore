@interface CSRemoteDarwinDeviceInfo
+ (id)sharedInstance;
- (BOOL)_isRemoteDarwinConnectedWithUUID:(id)a3;
- (BOOL)hasDarwinDeviceConnected;
- (BOOL)hasDarwinDeviceHandleVoiceTrigger;
- (BOOL)isPrimaryVoiceTriggerDeviceWithUUID:(id)a3;
- (BOOL)isRemoteDarwinConnectedWithUUID:(id)a3;
- (CSRemoteDarwinDeviceInfo)init;
- (NSMutableDictionary)deviceUIDMapTable;
- (NSMutableOrderedSet)voiceTriggerEnabledDevices;
- (OS_dispatch_queue)queue;
- (id)fetchDeviceUUIDStringFromUID:(id)a3;
- (id)fetchRichDeviceUIDStringFromUUID:(id)a3;
- (void)addDeviceIDPairToMapTable:(id)a3 withDeviceUID:(id)a4;
- (void)allDeviceDisconnected;
- (void)deviceConnectedWithUUID:(id)a3;
- (void)deviceDisconnectedWithUUID:(id)a3;
- (void)notifyVoiceTriggerDisabledWithDeviceUUID:(id)a3;
- (void)notifyVoiceTriggerEnabledWithDeviceUUID:(id)a3;
- (void)setDeviceUIDMapTable:(id)a3;
- (void)setQueue:(id)a3;
- (void)setVoiceTriggerEnabledDevices:(id)a3;
@end

@implementation CSRemoteDarwinDeviceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_voiceTriggerEnabledDevices, 0);
  objc_storeStrong((id *)&self->_deviceUIDMapTable, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setVoiceTriggerEnabledDevices:(id)a3
{
}

- (NSMutableOrderedSet)voiceTriggerEnabledDevices
{
  return self->_voiceTriggerEnabledDevices;
}

- (void)setDeviceUIDMapTable:(id)a3
{
}

- (NSMutableDictionary)deviceUIDMapTable
{
  return self->_deviceUIDMapTable;
}

- (void)addDeviceIDPairToMapTable:(id)a3 withDeviceUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__CSRemoteDarwinDeviceInfo_addDeviceIDPairToMapTable_withDeviceUID___block_invoke;
  block[3] = &unk_1E6200E38;
  id v12 = v6;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __68__CSRemoteDarwinDeviceInfo_addDeviceIDPairToMapTable_withDeviceUID___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v6 = 136315650;
    id v7 = "-[CSRemoteDarwinDeviceInfo addDeviceIDPairToMapTable:withDeviceUID:]_block_invoke";
    __int16 v8 = 2114;
    uint64_t v9 = v3;
    __int16 v10 = 2114;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Testing: Add (%{public}@, %{public}@) pair into mapping table", (uint8_t *)&v6, 0x20u);
  }
  return [*(id *)(a1[6] + 8) setObject:a1[5] forKeyedSubscript:a1[4]];
}

- (BOOL)_isRemoteDarwinConnectedWithUUID:(id)a3
{
  deviceUIDMapTable = self->_deviceUIDMapTable;
  if (!deviceUIDMapTable) {
    return 0;
  }
  uint64_t v4 = [(NSMutableDictionary *)deviceUIDMapTable objectForKeyedSubscript:a3];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)isRemoteDarwinConnectedWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CSRemoteDarwinDeviceInfo_isRemoteDarwinConnectedWithUUID___block_invoke;
  block[3] = &unk_1E6201328;
  id v9 = v4;
  __int16 v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_async_and_wait(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

uint64_t __60__CSRemoteDarwinDeviceInfo_isRemoteDarwinConnectedWithUUID___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isRemoteDarwinConnectedWithUUID:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)fetchRichDeviceUIDStringFromUUID:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    *(void *)&long long v20 = 0;
    *((void *)&v20 + 1) = &v20;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__4403;
    v23 = __Block_byref_object_dispose__4404;
    id v24 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__CSRemoteDarwinDeviceInfo_fetchRichDeviceUIDStringFromUUID___block_invoke;
    block[3] = &unk_1E6201328;
    v15 = &v20;
    void block[4] = self;
    id v7 = v4;
    id v14 = v7;
    dispatch_async_and_wait(queue, block);
    __int16 v8 = *(void **)(*((void *)&v20 + 1) + 40);
    id v9 = CSLogContextFacilityCoreSpeech;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[CSRemoteDarwinDeviceInfo fetchRichDeviceUIDStringFromUUID:]";
        __int16 v18 = 2114;
        v19 = v8;
        _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Return existing simple UID(%{public}@)", buf, 0x16u);
        id v7 = *(id *)(*((void *)&v20 + 1) + 40);
      }
      else
      {
        id v7 = v8;
      }
    }
    else if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CSRemoteDarwinDeviceInfo fetchRichDeviceUIDStringFromUUID:]";
      _os_log_error_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_ERROR, "%s Can't find corresponding deviceUID from UUID, return existing UUID instead", buf, 0xCu);
    }
    id v11 = v7;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    __int16 v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v20) = 136315138;
      *(void *)((char *)&v20 + 4) = "-[CSRemoteDarwinDeviceInfo fetchRichDeviceUIDStringFromUUID:]";
      _os_log_error_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_ERROR, "%s Invalid deviceUUID", (uint8_t *)&v20, 0xCu);
    }
    id v11 = 0;
  }

  return v11;
}

uint64_t __61__CSRemoteDarwinDeviceInfo_fetchRichDeviceUIDStringFromUUID___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  return MEMORY[0x1F41817F8]();
}

- (BOOL)isPrimaryVoiceTriggerDeviceWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__CSRemoteDarwinDeviceInfo_isPrimaryVoiceTriggerDeviceWithUUID___block_invoke;
  block[3] = &unk_1E6201328;
  void block[4] = self;
  id v9 = v4;
  __int16 v10 = &v11;
  id v6 = v4;
  dispatch_async_and_wait(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

void __64__CSRemoteDarwinDeviceInfo_isPrimaryVoiceTriggerDeviceWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) voiceTriggerEnabledDevices];
  uint64_t v3 = [v2 firstObject];

  id v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = 136315650;
    id v7 = "-[CSRemoteDarwinDeviceInfo isPrimaryVoiceTriggerDeviceWithUUID:]_block_invoke";
    __int16 v8 = 2114;
    id v9 = v3;
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Primary device UUID : %{public}@, input device UUID : %{public}@", (uint8_t *)&v6, 0x20u);
  }
  if ([v3 isEqualToString:*(void *)(a1 + 40)]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  if (!v3 && [*(id *)(a1 + 32) _isRemoteDarwinConnectedWithUUID:*(void *)(a1 + 40)]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (id)fetchDeviceUUIDStringFromUID:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    *(void *)&long long v20 = 0;
    *((void *)&v20 + 1) = &v20;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__4403;
    v23 = __Block_byref_object_dispose__4404;
    id v24 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__CSRemoteDarwinDeviceInfo_fetchDeviceUUIDStringFromUID___block_invoke;
    block[3] = &unk_1E6201328;
    void block[4] = self;
    id v7 = v4;
    id v14 = v7;
    v15 = &v20;
    dispatch_async_and_wait(queue, block);
    __int16 v8 = *(void **)(*((void *)&v20 + 1) + 40);
    if (!v8)
    {
      id v9 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[CSRemoteDarwinDeviceInfo fetchDeviceUUIDStringFromUID:]";
        __int16 v18 = 2114;
        id v19 = v7;
        _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Did not find deviceUID(%{public}@) in mapping table", buf, 0x16u);
        __int16 v8 = *(void **)(*((void *)&v20 + 1) + 40);
      }
      else
      {
        __int16 v8 = 0;
      }
    }
    id v11 = v8;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    __int16 v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v20) = 136315138;
      *(void *)((char *)&v20 + 4) = "-[CSRemoteDarwinDeviceInfo fetchDeviceUUIDStringFromUID:]";
      _os_log_error_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_ERROR, "%s Invalid deviceUID", (uint8_t *)&v20, 0xCu);
    }
    id v11 = 0;
  }

  return v11;
}

void __57__CSRemoteDarwinDeviceInfo_fetchDeviceUUIDStringFromUID___block_invoke(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1[4] + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        __int16 v8 = (void *)a1[5];
        id v9 = objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", v7, (void)v12);
        LODWORD(v8) = [v8 containsString:v9];

        if (v8)
        {
          __int16 v10 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v11 = a1[5];
            *(_DWORD *)buf = 136315650;
            v17 = "-[CSRemoteDarwinDeviceInfo fetchDeviceUUIDStringFromUID:]_block_invoke";
            __int16 v18 = 2114;
            id v19 = v7;
            __int16 v20 = 2114;
            uint64_t v21 = v11;
            _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Found (%{public}@, %{public}@) pair in mapping table", buf, 0x20u);
          }
          objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v22 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (BOOL)hasDarwinDeviceHandleVoiceTrigger
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__CSRemoteDarwinDeviceInfo_hasDarwinDeviceHandleVoiceTrigger__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __61__CSRemoteDarwinDeviceInfo_hasDarwinDeviceHandleVoiceTrigger__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (BOOL)hasDarwinDeviceConnected
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__CSRemoteDarwinDeviceInfo_hasDarwinDeviceConnected__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__CSRemoteDarwinDeviceInfo_hasDarwinDeviceConnected__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (void)allDeviceDisconnected
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CSRemoteDarwinDeviceInfo_allDeviceDisconnected__block_invoke;
  block[3] = &unk_1E6201288;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __49__CSRemoteDarwinDeviceInfo_allDeviceDisconnected__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[CSRemoteDarwinDeviceInfo allDeviceDisconnected]_block_invoke";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  char v3 = [*(id *)(a1 + 32) deviceUIDMapTable];
  [v3 removeAllObjects];

  uint64_t v4 = [*(id *)(a1 + 32) voiceTriggerEnabledDevices];
  [v4 removeAllObjects];
}

- (void)deviceDisconnectedWithUUID:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__CSRemoteDarwinDeviceInfo_deviceDisconnectedWithUUID___block_invoke;
    v7[3] = &unk_1E6201030;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __55__CSRemoteDarwinDeviceInfo_deviceDisconnectedWithUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) deviceUIDMapTable];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) voiceTriggerEnabledDevices];
  [v3 removeObject:*(void *)(a1 + 40)];
}

- (void)notifyVoiceTriggerDisabledWithDeviceUUID:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__CSRemoteDarwinDeviceInfo_notifyVoiceTriggerDisabledWithDeviceUUID___block_invoke;
    v7[3] = &unk_1E6201030;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __69__CSRemoteDarwinDeviceInfo_notifyVoiceTriggerDisabledWithDeviceUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) voiceTriggerEnabledDevices];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)notifyVoiceTriggerEnabledWithDeviceUUID:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__CSRemoteDarwinDeviceInfo_notifyVoiceTriggerEnabledWithDeviceUUID___block_invoke;
    v7[3] = &unk_1E6201030;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __68__CSRemoteDarwinDeviceInfo_notifyVoiceTriggerEnabledWithDeviceUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) voiceTriggerEnabledDevices];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)deviceConnectedWithUUID:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v23[0] = 0;
    v23[1] = 0;
    int v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];
    [v5 getUUIDBytes:v23];
    uint64_t v6 = (void *)remote_device_copy_device_with_uuid();
    [@"UniqueDeviceID" UTF8String];
    uint64_t v7 = (void *)remote_device_copy_property();
    if (v7)
    {
      id v8 = [NSString stringWithUTF8String:xpc_copy_clean_description()];
      if (v8)
      {
        queue = self->_queue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __52__CSRemoteDarwinDeviceInfo_deviceConnectedWithUUID___block_invoke;
        block[3] = &unk_1E6200E38;
        id v14 = v4;
        id v15 = v8;
        v16 = self;
        dispatch_async(queue, block);
      }
      else
      {
        long long v12 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v18 = "-[CSRemoteDarwinDeviceInfo deviceConnectedWithUUID:]";
          _os_log_error_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_ERROR, "%s Failed to fetch deviceUID", buf, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v11 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v18 = "-[CSRemoteDarwinDeviceInfo deviceConnectedWithUUID:]";
        __int16 v19 = 2114;
        __int16 v20 = @"UniqueDeviceID";
        __int16 v21 = 2114;
        id v22 = v4;
        _os_log_error_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_ERROR, "%s Failed to fetch property of %{public}@ from deviceUUID %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    __int16 v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v18 = "-[CSRemoteDarwinDeviceInfo deviceConnectedWithUUID:]";
      _os_log_error_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_ERROR, "%s Invalid deviceUUIDString", buf, 0xCu);
    }
  }
}

uint64_t __52__CSRemoteDarwinDeviceInfo_deviceConnectedWithUUID___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v6 = 136315650;
    uint64_t v7 = "-[CSRemoteDarwinDeviceInfo deviceConnectedWithUUID:]_block_invoke";
    __int16 v8 = 2114;
    uint64_t v9 = v3;
    __int16 v10 = 2114;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Add (%{public}@, %{public}@) pair into mapping table", (uint8_t *)&v6, 0x20u);
  }
  return [*(id *)(a1[6] + 8) setObject:a1[5] forKeyedSubscript:a1[4]];
}

- (CSRemoteDarwinDeviceInfo)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSRemoteDarwinDeviceInfo;
  id v2 = [(CSRemoteDarwinDeviceInfo *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    deviceUIDMapTable = v2->_deviceUIDMapTable;
    v2->_deviceUIDMapTable = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA70] orderedSet];
    voiceTriggerEnabledDevices = v2->_voiceTriggerEnabledDevices;
    v2->_voiceTriggerEnabledDevices = (NSMutableOrderedSet *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("CSRemoteDarwinDeviceInfo Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4429 != -1) {
    dispatch_once(&sharedInstance_onceToken_4429, &__block_literal_global_4430);
  }
  id v2 = (void *)sharedInstance_sharedInfo;
  return v2;
}

uint64_t __42__CSRemoteDarwinDeviceInfo_sharedInstance__block_invoke()
{
  sharedInstance_sharedInfo = objc_alloc_init(CSRemoteDarwinDeviceInfo);
  return MEMORY[0x1F41817F8]();
}

@end