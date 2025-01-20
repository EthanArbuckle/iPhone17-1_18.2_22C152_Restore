@interface AFMemoryPressureObserver
+ (id)sharedObserver;
- (AFMemoryPressureObserver)initWithOptions:(unint64_t)a3;
- (void)_addListener:(id)a3;
- (void)_handleMemoryPressureWithFlags:(unint64_t)a3;
- (void)_removeAllListeners;
- (void)_removeListener:(id)a3;
- (void)_startObservingMemoryPressureWithOptions:(unint64_t)a3;
- (void)_stopObservingMemoryPressure;
- (void)addListener:(id)a3;
- (void)dealloc;
- (void)getCurrentConditionWithCompletion:(id)a3;
- (void)invalidate;
- (void)removeAllListeners;
- (void)removeListener:(id)a3;
@end

@implementation AFMemoryPressureObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_handleMemoryPressureWithFlags:(unint64_t)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x19F3A4E70](self, a2);
  int64_t memoryPressureFlags = self->_memoryPressureFlags;
  if (memoryPressureFlags <= 3)
  {
    if (memoryPressureFlags == 2) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 0;
    }
    if (memoryPressureFlags == 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v8;
    }
  }
  else
  {
    switch(memoryPressureFlags)
    {
      case 4:
        uint64_t v7 = 3;
        break;
      case 16:
        uint64_t v7 = 4;
        break;
      case 32:
        uint64_t v7 = 5;
        break;
      default:
        uint64_t v7 = 0;
        break;
    }
  }
  unint64_t v9 = 0;
  self->_int64_t memoryPressureFlags = a3;
  if ((uint64_t)a3 <= 3)
  {
    if (a3 == 1 || a3 == 2) {
      unint64_t v9 = a3;
    }
  }
  else
  {
    switch(a3)
    {
      case 4uLL:
        unint64_t v9 = 3;
        break;
      case 0x10uLL:
        unint64_t v9 = 4;
        break;
      case 0x20uLL:
        unint64_t v9 = 5;
        break;
    }
  }
  v10 = (void *)AFSiriLogContextUtility;
  BOOL v11 = os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO);
  if (v7 == v9)
  {
    if (!v11) {
      goto LABEL_40;
    }
    if ((unint64_t)(v7 - 1) > 4) {
      v12 = @"unknown";
    }
    else {
      v12 = off_1E5927B80[v7 - 1];
    }
    *(_DWORD *)buf = 136315394;
    v43 = "-[AFMemoryPressureObserver _handleMemoryPressureWithFlags:]";
    __int16 v44 = 2112;
    v45 = v12;
    v14 = v10;
    v15 = "%s Memory pressure condition stayed at %@.";
    v16 = v14;
    uint32_t v17 = 22;
  }
  else
  {
    if (!v11) {
      goto LABEL_40;
    }
    if ((unint64_t)(v7 - 1) > 4) {
      v13 = @"unknown";
    }
    else {
      v13 = off_1E5927B80[v7 - 1];
    }
    if (v9 - 1 > 4) {
      v18 = @"unknown";
    }
    else {
      v18 = off_1E5927B80[v9 - 1];
    }
    *(_DWORD *)buf = 136315650;
    v43 = "-[AFMemoryPressureObserver _handleMemoryPressureWithFlags:]";
    __int16 v44 = 2112;
    v45 = v13;
    __int16 v46 = 2112;
    v47 = v18;
    v14 = v10;
    v15 = "%s Memory pressure condition changed from %@ to %@.";
    v16 = v14;
    uint32_t v17 = 32;
  }
  _os_log_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_INFO, v15, buf, v17);

LABEL_40:
  v19 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v20 = v19;
    AFMemoryInfoGetCurrent();
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v43 = "-[AFMemoryPressureObserver _handleMemoryPressureWithFlags:]";
    __int16 v44 = 2112;
    v45 = v21;
    _os_log_impl(&dword_19CF1D000, v20, OS_LOG_TYPE_INFO, "%s Current memory info is %@.", buf, 0x16u);
  }
  if (v7 != v9)
  {
    v22 = [MEMORY[0x1E4F28F80] processInfo];
    v23 = [v22 processName];
    int v24 = [v23 isEqualToString:@"assistantd"];

    if (v24)
    {
      v25 = +[AFAnalytics sharedAnalytics];
      v40[0] = @"processName";
      v26 = [MEMORY[0x1E4F28F80] processInfo];
      v27 = [v26 processName];
      v40[1] = @"memoryPressureChange";
      v41[0] = v27;
      if (v9 - 1 > 4) {
        v28 = @"unknown";
      }
      else {
        v28 = off_1E5927B80[v9 - 1];
      }
      v41[1] = v28;
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
      [v25 logEventWithType:451 context:v29];
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v30 = self->_listeners;
    uint64_t v31 = [(NSHashTable *)v30 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v36 != v33) {
            objc_enumerationMutation(v30);
          }
          objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "memoryPressureObserver:didChangeFromCondition:toCondition:", self, v7, v9, (void)v35);
        }
        uint64_t v32 = [(NSHashTable *)v30 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v32);
    }
  }
}

- (void)_stopObservingMemoryPressure
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  memoryPressureSource = self->_memoryPressureSource;
  if (memoryPressureSource)
  {
    dispatch_source_cancel(memoryPressureSource);
    v4 = self->_memoryPressureSource;
    self->_memoryPressureSource = 0;
  }
  v5 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    uint64_t v7 = AFMemoryInfoGetCurrent();
    int v8 = 136315394;
    unint64_t v9 = "-[AFMemoryPressureObserver _stopObservingMemoryPressure]";
    __int16 v10 = 2112;
    BOOL v11 = v7;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s Current memory info is %@.", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_startObservingMemoryPressureWithOptions:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_memoryPressureSource)
  {
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14468], 0, a3 & 0x30 | (a3 >> 1) & 7, (dispatch_queue_t)self->_queue);
    memoryPressureSource = self->_memoryPressureSource;
    self->_memoryPressureSource = v4;

    objc_initWeak((id *)location, self);
    v6 = self->_memoryPressureSource;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __69__AFMemoryPressureObserver__startObservingMemoryPressureWithOptions___block_invoke;
    handler[3] = &unk_1E592B978;
    objc_copyWeak(&v11, (id *)location);
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume((dispatch_object_t)self->_memoryPressureSource);
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)location);
  }
  uint64_t v7 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    int v8 = v7;
    unint64_t v9 = AFMemoryInfoGetCurrent();
    *(_DWORD *)location = 136315394;
    *(void *)&location[4] = "-[AFMemoryPressureObserver _startObservingMemoryPressureWithOptions:]";
    __int16 v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s Current memory info is %@.", location, 0x16u);
  }
}

void __69__AFMemoryPressureObserver__startObservingMemoryPressureWithOptions___block_invoke(uint64_t a1)
{
  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [(dispatch_source_t *)WeakRetained _handleMemoryPressureWithFlags:dispatch_source_get_data(WeakRetained[2])];
    WeakRetained = v2;
  }
}

- (void)_removeAllListeners
{
}

- (void)_removeListener:(id)a3
{
}

- (void)_addListener:(id)a3
{
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AFMemoryPressureObserver_invalidate__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __38__AFMemoryPressureObserver_invalidate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopObservingMemoryPressure];
  v2 = *(void **)(a1 + 32);
  return [v2 _removeAllListeners];
}

- (void)getCurrentConditionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __62__AFMemoryPressureObserver_getCurrentConditionWithCompletion___block_invoke;
    v7[3] = &unk_1E592C6E8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __62__AFMemoryPressureObserver_getCurrentConditionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 24);
  uint64_t v2 = 3;
  uint64_t v3 = 4;
  uint64_t v4 = 5;
  if (v1 != 32) {
    uint64_t v4 = 0;
  }
  if (v1 != 16) {
    uint64_t v3 = v4;
  }
  if (v1 != 4) {
    uint64_t v2 = v3;
  }
  if (v1 == 2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v1 == 1) {
    uint64_t v5 = 1;
  }
  if (v1 <= 3) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = v2;
  }
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v6);
}

- (void)removeAllListeners
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AFMemoryPressureObserver_removeAllListeners__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __46__AFMemoryPressureObserver_removeAllListeners__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeAllListeners];
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__AFMemoryPressureObserver_removeListener___block_invoke;
    v7[3] = &unk_1E592C710;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __43__AFMemoryPressureObserver_removeListener___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeListener:*(void *)(a1 + 40)];
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__AFMemoryPressureObserver_addListener___block_invoke;
    v7[3] = &unk_1E592C710;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __40__AFMemoryPressureObserver_addListener___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addListener:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  [(AFMemoryPressureObserver *)self _stopObservingMemoryPressure];
  v3.receiver = self;
  v3.super_class = (Class)AFMemoryPressureObserver;
  [(AFMemoryPressureObserver *)&v3 dealloc];
}

- (AFMemoryPressureObserver)initWithOptions:(unint64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)AFMemoryPressureObserver;
  id v4 = [(AFMemoryPressureObserver *)&v14 init];
  if (v4)
  {
    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.assistant.memory-pressure-observer", v6);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v7;

    unint64_t v9 = v4->_queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__AFMemoryPressureObserver_initWithOptions___block_invoke;
    v11[3] = &unk_1E592B398;
    uint64_t v12 = v4;
    unint64_t v13 = a3;
    dispatch_async(v9, v11);
  }
  return v4;
}

uint64_t __44__AFMemoryPressureObserver_initWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  return [v5 _startObservingMemoryPressureWithOptions:v6];
}

+ (id)sharedObserver
{
  if (sharedObserver_onceToken != -1) {
    dispatch_once(&sharedObserver_onceToken, &__block_literal_global_18899);
  }
  uint64_t v2 = (void *)sharedObserver_sharedObserver;
  return v2;
}

void __42__AFMemoryPressureObserver_sharedObserver__block_invoke()
{
  v0 = [[AFMemoryPressureObserver alloc] initWithOptions:62];
  uint64_t v1 = (void *)sharedObserver_sharedObserver;
  sharedObserver_sharedObserver = (uint64_t)v0;
}

@end