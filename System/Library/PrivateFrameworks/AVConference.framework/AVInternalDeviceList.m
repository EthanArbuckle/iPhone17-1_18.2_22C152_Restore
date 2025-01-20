@interface AVInternalDeviceList
+ (id)defaultDeviceOfType:(unsigned int)a3;
+ (id)newDeviceList;
- (AVInternalDeviceList)init;
- (id)changeListener;
- (id)deviceList;
- (unsigned)dataSourceControlID;
- (void)dealloc;
- (void)notifyDeviceListChanged;
- (void)setChangeListener:(id)a3;
@end

@implementation AVInternalDeviceList

+ (id)newDeviceList
{
  return 0;
}

+ (id)defaultDeviceOfType:(unsigned int)a3
{
  return 0;
}

- (unsigned)dataSourceControlID
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  deviceList = self->deviceList;
  uint64_t v3 = [(NSMutableArray *)deviceList countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(deviceList);
        }
        v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v7 isBuiltInDevice])
        {
          unsigned int v8 = [v7 getDataSourceControlID];
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v9 = VRTraceErrorLogLevelToCSTR();
            v10 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              int v12 = 136316162;
              uint64_t v13 = v9;
              __int16 v14 = 2080;
              v15 = "-[AVInternalDeviceList dataSourceControlID]";
              __int16 v16 = 1024;
              int v17 = 576;
              __int16 v18 = 2112;
              uint64_t v19 = [v7 deviceID];
              __int16 v20 = 1024;
              unsigned int v21 = v8;
              _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Built-in audio device[%@]'s data source control ID[%u]", (uint8_t *)&v12, 0x2Cu);
            }
          }
          return v8;
        }
      }
      uint64_t v4 = [(NSMutableArray *)deviceList countByEnumeratingWithState:&v23 objects:v22 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  return 0;
}

- (AVInternalDeviceList)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)AVInternalDeviceList;
  v2 = [(AVInternalDeviceList *)&v5 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->changeListener = 0;
    v2->deviceList = (NSMutableArray *)+[AVInternalDeviceList newDeviceList];
    pthread_mutex_init(&v3->listLock, 0);
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  pthread_mutex_destroy(&self->listLock);
  v3.receiver = self;
  v3.super_class = (Class)AVInternalDeviceList;
  [(AVInternalDeviceList *)&v3 dealloc];
}

- (void)notifyDeviceListChanged
{
  v4[5] = *MEMORY[0x1E4F143B8];
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__AVInternalDeviceList_notifyDeviceListChanged__block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = self;
  dispatch_async(global_queue, v4);
}

void __47__AVInternalDeviceList_notifyDeviceListChanged__block_invoke(uint64_t a1)
{
  block[6] = *MEMORY[0x1E4F143B8];
  id v5 = +[AVInternalDeviceList newDeviceList];
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 24));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 8))
  {
    [*(id *)(v2 + 16) setArray:v5];
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__AVInternalDeviceList_notifyDeviceListChanged__block_invoke_2;
    block[3] = &unk_1E6DB5178;
    block[4] = v5;
    block[5] = v3;
    dispatch_async(global_queue, block);
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 24));
  }
  else
  {
    pthread_mutex_unlock((pthread_mutex_t *)(v2 + 24));
  }
}

uint64_t __47__AVInternalDeviceList_notifyDeviceListChanged__block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str = 0;
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = v2 ? (const char *)objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "Calling changeListener %s", v3);
    if (__str)
    {
      __lasts = 0;
      uint64_t v4 = strtok_r(__str, "\n", &__lasts);
      id v5 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v6 = VRTraceErrorLogLevelToCSTR();
          v7 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v12 = v6;
            __int16 v13 = 2080;
            __int16 v14 = "-[AVInternalDeviceList notifyDeviceListChanged]_block_invoke_2";
            __int16 v15 = 1024;
            int v16 = 684;
            __int16 v17 = 2080;
            __int16 v18 = "";
            __int16 v19 = 2080;
            __int16 v20 = v4;
            _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        uint64_t v4 = strtok_r(0, "\n", &__lasts);
      }
      while (v4);
      free(__str);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)deviceList
{
  p_listLock = &self->listLock;
  pthread_mutex_lock(&self->listLock);
  uint64_t v4 = (void *)[MEMORY[0x1E4F1C978] arrayWithArray:self->deviceList];
  pthread_mutex_unlock(p_listLock);
  return v4;
}

- (void)setChangeListener:(id)a3
{
  p_listLock = &self->listLock;
  pthread_mutex_lock(&self->listLock);
  id changeListener = self->changeListener;
  self->id changeListener = (id)[a3 copy];
  pthread_mutex_unlock(p_listLock);
}

- (id)changeListener
{
  p_listLock = &self->listLock;
  pthread_mutex_lock(&self->listLock);
  id changeListener = self->changeListener;
  pthread_mutex_unlock(p_listLock);
  return changeListener;
}

@end