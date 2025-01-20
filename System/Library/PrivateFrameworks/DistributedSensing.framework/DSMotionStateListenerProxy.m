@interface DSMotionStateListenerProxy
+ (id)sharedInstance;
- (DSClientMotionDataOptions)options;
- (DSListenerClientProtocol)lastobserver;
- (DSMotionStateListenerProxy)init;
- (DSProviderDevice)cachedProvider;
- (NSData)cachedData;
- (NSError)error;
- (NSHashTable)observers;
- (NSHashTable)pendingObservers;
- (int)listenerState;
- (void)_addObserver:(id)a3;
- (void)_clearCache;
- (void)_removeObserver:(id)a3;
- (void)_replyWithCachedDataToObserver:(id)a3;
- (void)failedToStartListenerWithError:(id)a3;
- (void)receivedData:(id)a3 fromProvider:(id)a4;
- (void)requestMotionState;
- (void)setCachedData:(id)a3;
- (void)setCachedProvider:(id)a3;
- (void)setError:(id)a3;
- (void)setLastobserver:(id)a3;
- (void)setListenerState:(int)a3;
- (void)setObservers:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPendingObservers:(id)a3;
- (void)startMotionStateListenerWithObserver:(id)a3;
- (void)startedListener;
- (void)stopMotionStateListenerWithObserver:(id)a3;
- (void)stoppedListener;
- (void)updateProviders:(id)a3;
@end

@implementation DSMotionStateListenerProxy

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_proxy;
  return v2;
}

uint64_t __44__DSMotionStateListenerProxy_sharedInstance__block_invoke()
{
  sharedInstance_proxy = objc_alloc_init(DSMotionStateListenerProxy);
  return MEMORY[0x270F9A758]();
}

- (DSMotionStateListenerProxy)init
{
  v14.receiver = self;
  v14.super_class = (Class)DSMotionStateListenerProxy;
  v2 = [(DSListener *)&v14 initWithDispatchQueue:0];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    uint64_t v5 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    pendingObservers = v2->_pendingObservers;
    v2->_pendingObservers = (NSHashTable *)v5;

    v2->_listenerState = 255;
    v7 = objc_alloc_init(DSClientMotionDataOptions);
    options = v2->_options;
    v2->_options = v7;

    [(DSClientMotionDataOptions *)v2->_options setDataSubType:1];
    [(DSClientMotionDataOptions *)v2->_options setDeviceType:1];
    error = v2->_error;
    v2->_error = 0;

    cachedData = v2->_cachedData;
    v2->_cachedData = 0;

    cachedProvider = v2->_cachedProvider;
    v2->_cachedProvider = 0;

    v2->_listenerCount = 0;
    previousIntervalStartTime = v2->_previousIntervalStartTime;
    v2->_previousIntervalStartTime = 0;
  }
  return v2;
}

- (void)startMotionStateListenerWithObserver:(id)a3
{
  *(void *)&v19[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  int v6 = [(DSMotionStateListenerProxy *)v5 listenerState];
  switch(v6)
  {
    case 1:
      [(DSMotionStateListenerProxy *)v5 _addObserver:v4];
      goto LABEL_18;
    case 2:
      [(DSMotionStateListenerProxy *)v5 _addObserver:v4];
      if (objc_opt_respondsToSelector()) {
        [v4 startedListener];
      }
      [(DSMotionStateListenerProxy *)v5 _replyWithCachedDataToObserver:v4];
      goto LABEL_18;
    case 3:
      v10 = [(DSMotionStateListenerProxy *)v5 pendingObservers];
      [v10 addObject:v4];

      v11 = +[DSLogging sharedInstance];
      v12 = [v11 dsLogger];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [(DSMotionStateListenerProxy *)v5 pendingObservers];
        *(_DWORD *)buf = 134217984;
        *(void *)v19 = [v13 count];
        _os_log_impl(&dword_223BD6000, v12, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] adding observer to pending list. Current pending count %lu\n", buf, 0xCu);
      }
      goto LABEL_17;
    case 4:
      goto LABEL_4;
    case 5:
      if (objc_opt_respondsToSelector())
      {
        objc_super v14 = [(DSMotionStateListenerProxy *)v5 error];
        [v4 failedToStartListenerWithError:v14];
      }
      goto LABEL_18;
    default:
      if (v6 == 255)
      {
LABEL_4:
        [(DSMotionStateListenerProxy *)v5 setListenerState:1];
        v7 = +[DSLogging sharedInstance];
        v8 = [v7 dsLogger];

        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          v19[0] = 255;
          LOWORD(v19[1]) = 1024;
          *(_DWORD *)((char *)&v19[1] + 2) = [(DSMotionStateListenerProxy *)v5 listenerState];
          _os_log_impl(&dword_223BD6000, v8, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] State updated from %d to %d\n", buf, 0xEu);
        }

        [(DSMotionStateListenerProxy *)v5 _addObserver:v4];
        v9 = [(DSMotionStateListenerProxy *)v5 options];
        v17.receiver = v5;
        v17.super_class = (Class)DSMotionStateListenerProxy;
        [(DSListener *)&v17 startMotionDataListenerWithOptions:v9];
      }
      else
      {
        v15 = +[DSLogging sharedInstance];
        v12 = [v15 dsLogger];

        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int listenerState = v5->_listenerState;
          *(_DWORD *)buf = 67109120;
          v19[0] = listenerState;
          _os_log_impl(&dword_223BD6000, v12, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] Invalid listener state %d\n", buf, 8u);
        }
LABEL_17:
      }
LABEL_18:
      objc_sync_exit(v5);

      return;
  }
}

- (void)stopMotionStateListenerWithObserver:(id)a3
{
  *(void *)&v24[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  int v6 = [(DSMotionStateListenerProxy *)v5 observers];
  char v7 = [v6 containsObject:v4];

  if (v7)
  {
    [(DSMotionStateListenerProxy *)v5 _removeObserver:v4];
    v8 = [(DSMotionStateListenerProxy *)v5 observers];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      if (objc_opt_respondsToSelector()) {
        [v4 stoppedListener];
      }
    }
    else
    {
      int v19 = [(DSMotionStateListenerProxy *)v5 listenerState];
      [(DSMotionStateListenerProxy *)v5 setListenerState:3];
      v20 = +[DSLogging sharedInstance];
      v21 = [v20 dsLogger];

      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v24[0] = v19;
        LOWORD(v24[1]) = 1024;
        *(_DWORD *)((char *)&v24[1] + 2) = [(DSMotionStateListenerProxy *)v5 listenerState];
        _os_log_impl(&dword_223BD6000, v21, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] State updated from %d to %d\n", buf, 0xEu);
      }

      [(DSMotionStateListenerProxy *)v5 setLastobserver:v4];
      v22.receiver = v5;
      v22.super_class = (Class)DSMotionStateListenerProxy;
      [(DSListener *)&v22 stopMotionDataListener];
    }
  }
  else
  {
    v10 = +[DSLogging sharedInstance];
    v11 = [v10 dsLogger];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223BD6000, v11, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] Listener has not called start\n", buf, 2u);
    }

    v12 = [(DSMotionStateListenerProxy *)v5 pendingObservers];
    int v13 = [v12 containsObject:v4];

    if (v13)
    {
      objc_super v14 = [(DSMotionStateListenerProxy *)v5 pendingObservers];
      [v14 removeObject:v4];

      v15 = +[DSLogging sharedInstance];
      v16 = [v15 dsLogger];

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v17 = [(DSMotionStateListenerProxy *)v5 pendingObservers];
        uint64_t v18 = [v17 count];
        *(_DWORD *)buf = 134217984;
        *(void *)v24 = v18;
        _os_log_impl(&dword_223BD6000, v16, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] removed listener from pending start list since it called stop. Current pending count %lu\n", buf, 0xCu);
      }
    }
  }
  objc_sync_exit(v5);
}

- (void)requestMotionState
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(DSMotionStateListenerProxy *)v2 cachedData];
  if (v3
    && ([(DSMotionStateListenerProxy *)v2 cachedProvider],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [(DSMotionStateListenerProxy *)v2 observers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            v10 = [(DSMotionStateListenerProxy *)v2 cachedData];
            v11 = [(DSMotionStateListenerProxy *)v2 cachedProvider];
            [v9 receivedData:v10 fromProvider:v11];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v6);
    }
  }
  else
  {
    v12 = +[DSLogging sharedInstance];
    uint64_t v5 = [v12 dsLogger];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223BD6000, v5, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] No data available\n", buf, 2u);
    }
  }

  objc_sync_exit(v2);
}

- (void)stoppedListener
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  int v3 = [(DSMotionStateListenerProxy *)v2 listenerState];
  [(DSMotionStateListenerProxy *)v2 setListenerState:4];
  id v4 = +[DSLogging sharedInstance];
  uint64_t v5 = [v4 dsLogger];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v32 = v3;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = [(DSMotionStateListenerProxy *)v2 listenerState];
    _os_log_impl(&dword_223BD6000, v5, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] State updated from %d to %d\n", buf, 0xEu);
  }

  uint64_t v6 = [(DSMotionStateListenerProxy *)v2 lastobserver];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(DSMotionStateListenerProxy *)v2 lastobserver];
    [v8 stoppedListener];
  }
  [(DSMotionStateListenerProxy *)v2 _clearCache];
  [(DSMotionStateListenerProxy *)v2 setLastobserver:0];
  uint64_t v9 = [(DSMotionStateListenerProxy *)v2 pendingObservers];
  BOOL v10 = [v9 count] == 0;

  if (!v10)
  {
    v11 = +[DSLogging sharedInstance];
    v12 = [v11 dsLogger];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = [(DSMotionStateListenerProxy *)v2 pendingObservers];
      uint64_t v14 = [v13 count];
      *(_DWORD *)buf = 134217984;
      *(void *)v32 = v14;
      _os_log_impl(&dword_223BD6000, v12, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] Current pending observer count: %lu. Restarting listener\n", buf, 0xCu);
    }
    int v15 = [(DSMotionStateListenerProxy *)v2 listenerState];
    [(DSMotionStateListenerProxy *)v2 setListenerState:1];
    long long v16 = +[DSLogging sharedInstance];
    objc_super v17 = [v16 dsLogger];

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = [(DSMotionStateListenerProxy *)v2 listenerState];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v32 = v15;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = v18;
      _os_log_impl(&dword_223BD6000, v17, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] State updated from %d to %d\n", buf, 0xEu);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v19 = [(DSMotionStateListenerProxy *)v2 pendingObservers];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v27;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v19);
          }
          [(DSMotionStateListenerProxy *)v2 _addObserver:*(void *)(*((void *)&v26 + 1) + 8 * v22++)];
        }
        while (v20 != v22);
        uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v20);
    }

    v23 = [(DSMotionStateListenerProxy *)v2 pendingObservers];
    [v23 removeAllObjects];

    v24 = [(DSMotionStateListenerProxy *)v2 options];
    v25.receiver = v2;
    v25.super_class = (Class)DSMotionStateListenerProxy;
    [(DSListener *)&v25 startMotionDataListenerWithOptions:v24];
  }
  objc_sync_exit(v2);
}

- (void)failedToStartListenerWithError:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  int v6 = [(DSMotionStateListenerProxy *)v5 listenerState];
  [(DSMotionStateListenerProxy *)v5 setListenerState:5];
  char v7 = +[DSLogging sharedInstance];
  v8 = [v7 dsLogger];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v21 = v6;
    __int16 v22 = 1024;
    int v23 = [(DSMotionStateListenerProxy *)v5 listenerState];
    _os_log_impl(&dword_223BD6000, v8, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] State updated from %d to %d\n", buf, 0xEu);
  }

  [(DSMotionStateListenerProxy *)v5 setError:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [(DSMotionStateListenerProxy *)v5 observers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 failedToStartListenerWithError:v4];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(DSMotionStateListenerProxy *)v5 observers];
  [v14 removeAllObjects];

  objc_sync_exit(v5);
}

- (void)startedListener
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  int v3 = [(DSMotionStateListenerProxy *)v2 listenerState];
  [(DSMotionStateListenerProxy *)v2 setListenerState:2];
  id v4 = +[DSLogging sharedInstance];
  uint64_t v5 = [v4 dsLogger];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    unsigned int v20 = v3;
    __int16 v21 = 1024;
    int v22 = [(DSMotionStateListenerProxy *)v2 listenerState];
    _os_log_impl(&dword_223BD6000, v5, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] State updated from %d to %d\n", buf, 0xEu);
  }

  int v6 = +[DSLogging sharedInstance];
  char v7 = [v6 dsLogger];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = [(DSListener *)v2 maxListenerClients];
    *(_DWORD *)buf = 67109120;
    unsigned int v20 = v8;
    _os_log_impl(&dword_223BD6000, v7, OS_LOG_TYPE_DEFAULT, "max listener clients %u\n", buf, 8u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = [(DSMotionStateListenerProxy *)v2 observers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 startedListener];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v2);
}

- (void)receivedData:(id)a3 fromProvider:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = self;
  objc_sync_enter(v8);
  [(DSMotionStateListenerProxy *)v8 setCachedData:v6];
  [(DSMotionStateListenerProxy *)v8 setCachedProvider:v7];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = [(DSMotionStateListenerProxy *)v8 observers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 receivedData:v6 fromProvider:v7];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (void)updateProviders:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(DSMotionStateListenerProxy *)v5 observers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 updateProviders:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)_addObserver:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    unsigned int listenerCount = self->_listenerCount;
    self->_unsigned int listenerCount = listenerCount + 1;
    id v6 = [MEMORY[0x263EFF910] date];
    uint64_t v7 = v6;
    previousIntervalStartTime = self->_previousIntervalStartTime;
    if (listenerCount)
    {
      [(NSDate *)v6 timeIntervalSinceDate:previousIntervalStartTime];
      double v10 = v9;
      [(DSListener *)self avgListenerStartInterval];
      [(DSListener *)self setAvgListenerStartInterval:(v10 + v11 * (double)(self->_listenerCount - 2)) / (double)(self->_listenerCount - 1)];
      previousIntervalStartTime = self->_previousIntervalStartTime;
    }
    self->_previousIntervalStartTime = v7;

    unsigned int v12 = self->_listenerCount;
    if (v12 > [(DSListener *)self maxListenerClients]) {
      [(DSListener *)self setMaxListenerClients:self->_listenerCount];
    }
    long long v13 = [(DSMotionStateListenerProxy *)self observers];
    [v13 addObject:v4];

    long long v14 = +[DSLogging sharedInstance];
    long long v15 = [v14 dsLogger];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v16 = self->_listenerCount;
      v21[0] = 67109120;
      v21[1] = v16;
      long long v17 = "[DSListenerProxy] observer added. Current Listener client count %u\n";
      long long v18 = v15;
      uint32_t v19 = 8;
LABEL_10:
      _os_log_impl(&dword_223BD6000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)v21, v19);
    }
  }
  else
  {
    unsigned int v20 = +[DSLogging sharedInstance];
    long long v15 = [v20 dsLogger];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21[0]) = 0;
      long long v17 = "[DSListenerProxy] observer not found\n";
      long long v18 = v15;
      uint32_t v19 = 2;
      goto LABEL_10;
    }
  }
}

- (void)_removeObserver:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  --self->_listenerCount;
  id v4 = a3;
  uint64_t v5 = [(DSMotionStateListenerProxy *)self observers];
  [v5 removeObject:v4];

  id v6 = +[DSLogging sharedInstance];
  uint64_t v7 = [v6 dsLogger];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int listenerCount = self->_listenerCount;
    v9[0] = 67109120;
    v9[1] = listenerCount;
    _os_log_impl(&dword_223BD6000, v7, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy] observer removed. Current Listener client count %u\n", (uint8_t *)v9, 8u);
  }
}

- (void)_replyWithCachedDataToObserver:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DSMotionStateListenerProxy;
  uint64_t v5 = [(DSListener *)&v11 activeProviders];
  if ([v5 count])
  {
    if (objc_opt_respondsToSelector()) {
      [v4 updateProviders:v5];
    }
    uint64_t v6 = [(DSMotionStateListenerProxy *)self cachedData];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      uint64_t v8 = [(DSMotionStateListenerProxy *)self cachedProvider];

      if (v8)
      {
        if (objc_opt_respondsToSelector())
        {
          double v9 = [(DSMotionStateListenerProxy *)self cachedData];
          uint64_t v10 = [(DSMotionStateListenerProxy *)self cachedProvider];
          [v4 receivedData:v9 fromProvider:v10];
        }
      }
    }
  }
}

- (void)_clearCache
{
  int v3 = +[DSLogging sharedInstance];
  id v4 = [v3 dsLogger];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v9 = 0;
    _os_log_impl(&dword_223BD6000, v4, OS_LOG_TYPE_DEFAULT, "[DSListenerProxy]  resetting proxy cache\n", v9, 2u);
  }

  error = self->_error;
  self->_error = 0;

  cachedData = self->_cachedData;
  self->_cachedData = 0;

  cachedProvider = self->_cachedProvider;
  self->_cachedProvider = 0;

  self->_unsigned int listenerCount = 0;
  previousIntervalStartTime = self->_previousIntervalStartTime;
  self->_previousIntervalStartTime = 0;

  [(DSListener *)self setMaxListenerClients:0];
  [(DSListener *)self setAvgListenerStartInterval:0.0];
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 128, 1);
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)pendingObservers
{
  return (NSHashTable *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPendingObservers:(id)a3
{
}

- (DSClientMotionDataOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (int)listenerState
{
  return self->_listenerState;
}

- (void)setListenerState:(int)a3
{
  self->_int listenerState = a3;
}

- (NSData)cachedData
{
  return self->_cachedData;
}

- (void)setCachedData:(id)a3
{
}

- (DSProviderDevice)cachedProvider
{
  return self->_cachedProvider;
}

- (void)setCachedProvider:(id)a3
{
}

- (DSListenerClientProtocol)lastobserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastobserver);
  return (DSListenerClientProtocol *)WeakRetained;
}

- (void)setLastobserver:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_lastobserver);
  objc_storeStrong((id *)&self->_cachedProvider, 0);
  objc_storeStrong((id *)&self->_cachedData, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_pendingObservers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_previousIntervalStartTime, 0);
}

@end