@interface BWIOSurfacePoller
+ (uint64_t)defaultPoller;
+ (void)trackSurface:(__IOSurface *)a3 useCountIsZeroHandler:(id)a4;
- (BWIOSurfacePoller)init;
- (os_unfair_lock_s)_pollingTimerFired;
- (void)_startPolling;
- (void)_stopPolling;
- (void)dealloc;
- (void)trackSurface:(uint64_t)a3 useCountIsZeroHandler:;
@end

@implementation BWIOSurfacePoller

+ (void)trackSurface:(__IOSurface *)a3 useCountIsZeroHandler:(id)a4
{
  uint64_t v6 = +[BWIOSurfacePoller defaultPoller]();
  -[BWIOSurfacePoller trackSurface:useCountIsZeroHandler:](v6, (uint64_t)a3, (uint64_t)a4);
}

+ (uint64_t)defaultPoller
{
  if (defaultPoller_sOnceToken != -1) {
    dispatch_once(&defaultPoller_sOnceToken, &__block_literal_global_112);
  }
  return defaultPoller_sDefaultPoller;
}

- (void)trackSurface:(uint64_t)a3 useCountIsZeroHandler:
{
  if (a1)
  {
    v5 = [[BWTrackedSurface alloc] initWithSurface:a2 handler:a3];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    uint64_t v4 = [*(id *)(a1 + 24) count];
    [*(id *)(a1 + 24) addObject:v5];
    if (!v4) {
      -[BWIOSurfacePoller _startPolling](a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  }
}

BWIOSurfacePoller *__34__BWIOSurfacePoller_defaultPoller__block_invoke()
{
  result = objc_alloc_init(BWIOSurfacePoller);
  defaultPoller_sDefaultPoller = (uint64_t)result;
  return result;
}

- (BWIOSurfacePoller)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWIOSurfacePoller;
  v2 = [(BWIOSurfacePoller *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_trackedSurfacesLock._os_unfair_lock_opaque = 0;
    v2->_trackedSurfaces = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWIOSurfacePoller;
  [(BWIOSurfacePoller *)&v3 dealloc];
}

- (void)_startPolling
{
  if (a1)
  {
    if (!*(void *)(a1 + 8))
    {
      v2 = FigDispatchQueueCreateWithPriority();
      objc_super v3 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 1uLL, v2);

      dispatch_time_t v4 = dispatch_time(0, 7500000);
      dispatch_source_set_timer(v3, v4, 0x7270E0uLL, 0xB71AFuLL);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __34__BWIOSurfacePoller__startPolling__block_invoke;
      handler[3] = &unk_1E5C24430;
      handler[4] = a1;
      dispatch_source_set_event_handler(v3, handler);
      *(void *)(a1 + 8) = v3;
      dispatch_activate(v3);
    }
  }
}

os_unfair_lock_s *__34__BWIOSurfacePoller__startPolling__block_invoke(uint64_t a1)
{
  return -[BWIOSurfacePoller _pollingTimerFired](*(os_unfair_lock_s **)(a1 + 32));
}

- (os_unfair_lock_s)_pollingTimerFired
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    v2 = result + 4;
    os_unfair_lock_lock(result + 4);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    objc_super v3 = *(void **)(v1 + 24);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (!v4) {
      goto LABEL_16;
    }
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    v7 = 0;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v3);
        }
        if (!IOSurfaceIsInUse((IOSurfaceRef)[*(id *)(*((void *)&v18 + 1) + 8 * i) surface]))
        {
          if (!v7) {
            v7 = (void *)[MEMORY[0x1E4F28E60] indexSet];
          }
          [v7 addIndex:v6 + i];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
      v6 += i;
    }
    while (v5);
    if (v7)
    {
      v10 = (void *)[*(id *)(v1 + 24) objectsAtIndexes:v7];
      [*(id *)(v1 + 24) removeObjectsAtIndexes:v7];
      if (![*(id *)(v1 + 24) count]) {
        -[BWIOSurfacePoller _stopPolling](v1);
      }
    }
    else
    {
LABEL_16:
      v10 = 0;
    }
    os_unfair_lock_unlock(v2);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    result = (os_unfair_lock_s *)[v10 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (result)
    {
      v11 = result;
      uint64_t v12 = *(void *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v10);
          }
          (*(void (**)(void))([*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) handler] + 16))();
          v13 = (os_unfair_lock_s *)((char *)v13 + 1);
        }
        while (v11 != v13);
        result = (os_unfair_lock_s *)[v10 countByEnumeratingWithState:&v14 objects:v22 count:16];
        v11 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)_stopPolling
{
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    if (v2)
    {
      dispatch_source_cancel(v2);

      *(void *)(a1 + 8) = 0;
    }
  }
}

@end