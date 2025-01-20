@interface AXRedirectedEventDetector
+ (void)flushEvents;
+ (void)setFlushEventsTimerDelay:(double)a3;
- (AXDispatchTimer)flushEventsTimer;
- (AXRedirectedEventDetector)init;
- (BOOL)isRedirectedEvent:(id)a3;
- (NSMutableArray)recentEvents;
- (double)_elapsedTimeFrom:(unint64_t)a3 to:(unint64_t)a4;
- (void)_flushEventsIfNecessary;
- (void)addEvent:(id)a3;
- (void)setFlushEventsTimer:(id)a3;
- (void)setRecentEvents:(id)a3;
@end

@implementation AXRedirectedEventDetector

- (AXRedirectedEventDetector)init
{
  v10.receiver = self;
  v10.super_class = (Class)AXRedirectedEventDetector;
  v2 = [(AXRedirectedEventDetector *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("AXRedirectedEventDetector", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    recentEvents = v2->_recentEvents;
    v2->_recentEvents = v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F48318]) initWithTargetSerialQueue:v2->_queue];
    flushEventsTimer = v2->_flushEventsTimer;
    v2->_flushEventsTimer = (AXDispatchTimer *)v7;

    [(AXDispatchTimer *)v2->_flushEventsTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  }
  return v2;
}

- (void)_flushEventsIfNecessary
{
  if (AXNeedsEventFlush == 1)
  {
    v2 = [(AXRedirectedEventDetector *)self recentEvents];
    [v2 removeAllObjects];

    AXNeedsEventFlush = 0;
  }
}

- (void)addEvent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38__AXRedirectedEventDetector_addEvent___block_invoke;
    v7[3] = &unk_1E5586470;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

void __38__AXRedirectedEventDetector_addEvent___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _flushEventsIfNecessary];
  v2 = [*(id *)(a1 + 32) recentEvents];
  [v2 addObject:*(void *)(a1 + 40)];

  objc_initWeak(&location, *(id *)(a1 + 32));
  dispatch_queue_t v3 = [*(id *)(a1 + 32) flushEventsTimer];
  double v4 = *(double *)&AXFlushEventsTimerDelay;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__AXRedirectedEventDetector_addEvent___block_invoke_2;
  v5[3] = &unk_1E5586A10;
  objc_copyWeak(&v6, &location);
  [v3 afterDelay:v5 processBlock:0 cancelBlock:v4];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __38__AXRedirectedEventDetector_addEvent___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained recentEvents];
  [v1 removeAllObjects];
}

- (BOOL)isRedirectedEvent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__AXRedirectedEventDetector_isRedirectedEvent___block_invoke;
    block[3] = &unk_1E5586A38;
    block[4] = self;
    id v10 = v4;
    v11 = &v12;
    dispatch_sync(queue, block);
    BOOL v7 = *((unsigned char *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void __47__AXRedirectedEventDetector_isRedirectedEvent___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _flushEventsIfNecessary];
  int v2 = [*(id *)(a1 + 40) type];
  dispatch_queue_t v3 = [*(id *)(a1 + 40) clientId];
  uint64_t v4 = [*(id *)(a1 + 40) HIDTime];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = objc_msgSend(*(id *)(a1 + 32), "recentEvents", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "_elapsedTimeFrom:to:", objc_msgSend(v10, "HIDTime"), v4);
        double v12 = v11;
        if ([v10 type] == v2)
        {
          v13 = [v10 clientId];
          char v14 = [v13 isEqualToString:v3];

          if ((v14 & 1) == 0 && v12 < 0.5)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
            goto LABEL_13;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (double)_elapsedTimeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  unsigned int v6 = dword_1E91B34D0;
  if (!dword_1E91B34D0)
  {
    mach_timebase_info((mach_timebase_info_t)&_elapsedTimeFrom_to___TimebaseInfo);
    unsigned int v6 = dword_1E91B34D0;
  }
  return (double)((a4 - a3) * _elapsedTimeFrom_to___TimebaseInfo / v6) / 1000000000.0;
}

- (NSMutableArray)recentEvents
{
  return self->_recentEvents;
}

- (void)setRecentEvents:(id)a3
{
}

- (AXDispatchTimer)flushEventsTimer
{
  return self->_flushEventsTimer;
}

- (void)setFlushEventsTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flushEventsTimer, 0);
  objc_storeStrong((id *)&self->_recentEvents, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

+ (void)flushEvents
{
  AXNeedsEventFlush = 1;
}

+ (void)setFlushEventsTimerDelay:(double)a3
{
  AXFlushEventsTimerDelay = *(void *)&a3;
}

@end