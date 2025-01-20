@interface HMFMemoryMonitor
+ (HMFMemoryMonitor)memoryMonitor;
- (BOOL)isMonitoring;
- (HMFMemoryMonitor)init;
- (NSDate)lastProcessMemoryStateUpdateTime;
- (NSMapTable)memoryObservancesByObserver;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)memoryPressureSource;
- (int64_t)lastProcessMemoryState;
- (int64_t)systemMemoryState;
- (void)addObserver:(id)a3 debounceInterval:(double)a4 events:(id)a5;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setLastProcessMemoryState:(int64_t)a3;
- (void)setLastProcessMemoryStateUpdateTime:(id)a3;
- (void)setMonitoring:(BOOL)a3;
- (void)setSystemMemoryState:(int64_t)a3;
- (void)start;
- (void)stop;
@end

@implementation HMFMemoryMonitor

+ (HMFMemoryMonitor)memoryMonitor
{
  if (_MergedGlobals_2 != -1) {
    dispatch_once(&_MergedGlobals_2, &__block_literal_global_17);
  }
  v2 = (void *)qword_1EB4EEA10;
  return (HMFMemoryMonitor *)v2;
}

uint64_t __33__HMFMemoryMonitor_memoryMonitor__block_invoke()
{
  v0 = objc_alloc_init(HMFMemoryMonitor);
  v1 = (void *)qword_1EB4EEA10;
  qword_1EB4EEA10 = (uint64_t)v0;

  v2 = (void *)qword_1EB4EEA10;
  return [v2 start];
}

- (HMFMemoryMonitor)init
{
  v16.receiver = self;
  v16.super_class = (Class)HMFMemoryMonitor;
  v2 = [(HMFMemoryMonitor *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v4 = (const char *)HMFDispatchQueueName(v2, 0);
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v7 = dispatch_queue_create(v4, v6);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 0x37uLL, (dispatch_queue_t)v3->_queue);
    memoryPressureSource = v3->_memoryPressureSource;
    v3->_memoryPressureSource = (OS_dispatch_source *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1C9C8] distantPast];
    lastProcessMemoryStateUpdateTime = v3->_lastProcessMemoryStateUpdateTime;
    v3->_lastProcessMemoryStateUpdateTime = (NSDate *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    memoryObservancesByObserver = v3->_memoryObservancesByObserver;
    v3->_memoryObservancesByObserver = (NSMapTable *)v13;
  }
  return v3;
}

- (void)dealloc
{
  if (!self->_monitoring) {
    dispatch_resume((dispatch_object_t)self->_memoryPressureSource);
  }
  v3.receiver = self;
  v3.super_class = (Class)HMFMemoryMonitor;
  [(HMFMemoryMonitor *)&v3 dealloc];
}

- (void)addObserver:(id)a3 debounceInterval:(double)a4 events:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v10 = [[HMFMemoryObservance alloc] initWithDebounceInterval:v8 events:a4];
  uint64_t v11 = [(HMFMemoryMonitor *)self memoryObservancesByObserver];
  [v11 setObject:v10 forKey:v12];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = [(HMFMemoryMonitor *)self memoryObservancesByObserver];
  [v5 removeObjectForKey:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)start
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (![(HMFMemoryMonitor *)self isMonitoring])
  {
    [(HMFMemoryMonitor *)self setMonitoring:1];
    objc_initWeak(&location, self);
    v4 = [(HMFMemoryMonitor *)self memoryPressureSource];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __25__HMFMemoryMonitor_start__block_invoke;
    dispatch_source_t v9 = &unk_1E59576C0;
    objc_copyWeak(&v10, &location);
    dispatch_source_set_event_handler(v4, &v6);

    v5 = [(HMFMemoryMonitor *)self memoryPressureSource];
    dispatch_resume(v5);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(p_lock);
}

void __25__HMFMemoryMonitor_start__block_invoke(uint64_t a1)
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v52 = WeakRetained;
    v2 = [WeakRetained memoryPressureSource];
    uintptr_t data = dispatch_source_get_data(v2);

    uintptr_t v50 = data;
    if (data)
    {
      uint64_t v8 = 1;
    }
    else if ((data & 2) != 0)
    {
      uint64_t v8 = 2;
    }
    else if ((data & 4) != 0)
    {
      uint64_t v8 = 3;
    }
    else if ((data & 0x10) != 0)
    {
      uint64_t v8 = 4;
    }
    else
    {
      if ((data & 0x20) == 0)
      {
        v4 = (void *)MEMORY[0x19F3A87A0]();
        id v5 = v52;
        uint64_t v6 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v7 = HMFGetLogIdentifier(v5);
          *(_DWORD *)buf = 138543618;
          v66 = v7;
          __int16 v67 = 2048;
          uintptr_t v68 = v50;
          _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring unknown memory pressure source event: %lu", buf, 0x16u);
        }
        goto LABEL_52;
      }
      uint64_t v8 = 5;
    }
    dispatch_source_t v9 = (void *)MEMORY[0x19F3A87A0]();
    v55 = (os_unfair_lock_s *)v52;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier(v55);
      id v12 = HMFStringFromMemoryEvent(v8);
      *(_DWORD *)buf = 138543618;
      v66 = v11;
      __int16 v67 = 2112;
      uintptr_t v68 = (uintptr_t)v12;
      _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_INFO, "%{public}@Received memory event: %@", buf, 0x16u);
    }
    v53 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v13 = v55;
    lock = v55 + 2;
    os_unfair_lock_lock_with_options();
    v14 = [MEMORY[0x1E4F1C9C8] now];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v15 = [(os_unfair_lock_s *)v55 memoryObservancesByObserver];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v60 objects:buf count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v61;
      obuint64_t j = v15;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v61 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v60 + 1) + 8 * i);
          uint64_t v20 = [(os_unfair_lock_s *)v13 memoryObservancesByObserver];
          v21 = [(id)v20 objectForKey:v19];

          v22 = [v21 lastUpdateDate];
          [v14 timeIntervalSinceDate:v22];
          double v24 = v23;
          [v21 debounceInterval];
          LOBYTE(v20) = v24 < v25;

          if ((v20 & 1) == 0)
          {
            v26 = [v21 events];
            v27 = [NSNumber numberWithInteger:v8];
            int v28 = [v26 containsObject:v27];

            if (v28)
            {
              [v21 setLastUpdateDate:v14];
              [v53 addObject:v19];
            }
          }

          uint64_t v13 = v55;
        }
        v15 = obj;
        uint64_t v16 = [obj countByEnumeratingWithState:&v60 objects:buf count:16];
      }
      while (v16);
    }

    os_unfair_lock_unlock(lock);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v29 = v53;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v57;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v57 != v31) {
            objc_enumerationMutation(v29);
          }
          objc_msgSend(*(id *)(*((void *)&v56 + 1) + 8 * j), "memoryMonitor:didReceiveMemoryEvent:", v55, v8, v50);
        }
        uint64_t v30 = [v29 countByEnumeratingWithState:&v56 objects:v64 count:16];
      }
      while (v30);
    }

    if ((v50 & 7) != 0)
    {
      uint64_t v33 = v50 & 1;
      if ((v50 & 2) != 0) {
        uint64_t v33 = 2;
      }
      if ((v50 & 4) != 0) {
        uint64_t v34 = 3;
      }
      else {
        uint64_t v34 = v33;
      }
      v35 = v55 + 2;
      os_unfair_lock_lock_with_options();
      if (*(void *)&v55[4]._os_unfair_lock_opaque == v34)
      {
        os_unfair_lock_unlock(v35);
      }
      else
      {
        *(void *)&v55[4]._os_unfair_lock_opaque = v34;
        os_unfair_lock_unlock(v35);
        v41 = +[HMFNotificationCenter defaultCenter];
        v42 = off_1E5957DD8[v34];
        v69 = @"HMFSystemMemoryStateUpdateKey";
        v70[0] = v42;
        v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:&v69 count:1];
        [v41 postNotificationName:@"HMFMemoryMonitorSystemMemoryStateDidChangeNotification" object:v55 userInfo:v43];
      }
      goto LABEL_51;
    }
    if ((v50 & 0x20) != 0) {
      uint64_t v36 = 2;
    }
    else {
      uint64_t v36 = (v50 >> 4) & 1;
    }
    v37 = [(os_unfair_lock_s *)v55 lastProcessMemoryStateUpdateTime];
    if (v37)
    {
      v38 = [MEMORY[0x1E4F1C9C8] now];
      v39 = [(os_unfair_lock_s *)v55 lastProcessMemoryStateUpdateTime];
      [v38 timeIntervalSinceDate:v39];
      if (v40 <= 5.0)
      {
        BOOL v44 = [(os_unfair_lock_s *)v55 lastProcessMemoryState] == v36;

        if (v44)
        {
LABEL_51:

LABEL_52:
          id WeakRetained = v52;
          goto LABEL_53;
        }
      }
      else
      {
      }
    }
    os_unfair_lock_lock_with_options();
    uint64_t v45 = [MEMORY[0x1E4F1C9C8] now];
    v46 = *(void **)&v55[12]._os_unfair_lock_opaque;
    *(void *)&v55[12]._os_unfair_lock_opaque = v45;

    *(void *)&v55[6]._os_unfair_lock_opaque = v36;
    os_unfair_lock_unlock(v55 + 2);
    v47 = +[HMFNotificationCenter defaultCenter];
    v48 = off_1E5957DF8[v36];
    v69 = @"HMFProcessMemoryStateUpdateKey";
    v70[0] = v48;
    v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:&v69 count:1];
    [v47 postNotificationName:@"HMFMemoryMonitorProcessMemoryPressureNotification" object:v55 userInfo:v49];

    goto LABEL_51;
  }
LABEL_53:
}

- (void)stop
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(HMFMemoryMonitor *)self isMonitoring])
  {
    [(HMFMemoryMonitor *)self setMonitoring:0];
    v4 = [(HMFMemoryMonitor *)self memoryPressureSource];
    dispatch_suspend(v4);
  }
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)systemMemoryState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t systemMemoryState = self->_systemMemoryState;
  os_unfair_lock_unlock(p_lock);
  return systemMemoryState;
}

- (int64_t)lastProcessMemoryState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t lastProcessMemoryState = self->_lastProcessMemoryState;
  os_unfair_lock_unlock(p_lock);
  return lastProcessMemoryState;
}

- (void)setSystemMemoryState:(int64_t)a3
{
  self->_int64_t systemMemoryState = a3;
}

- (void)setLastProcessMemoryState:(int64_t)a3
{
  self->_int64_t lastProcessMemoryState = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_source)memoryPressureSource
{
  return self->_memoryPressureSource;
}

- (BOOL)isMonitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (NSDate)lastProcessMemoryStateUpdateTime
{
  return self->_lastProcessMemoryStateUpdateTime;
}

- (void)setLastProcessMemoryStateUpdateTime:(id)a3
{
}

- (NSMapTable)memoryObservancesByObserver
{
  return (NSMapTable *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryObservancesByObserver, 0);
  objc_storeStrong((id *)&self->_lastProcessMemoryStateUpdateTime, 0);
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end