@interface BWCoreMotionSuppressionStateMonitor
+ (void)initialize;
- (BWCoreMotionSuppressionStateMonitor)initWithSuppressionStateChangeHandler:(id)a3;
- (void)_doStop;
- (void)dealloc;
- (void)start;
@end

@implementation BWCoreMotionSuppressionStateMonitor

+ (void)initialize
{
}

- (BWCoreMotionSuppressionStateMonitor)initWithSuppressionStateChangeHandler:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BWCoreMotionSuppressionStateMonitor;
  v4 = [(BWCoreMotionSuppressionStateMonitor *)&v9 init];
  if (v4)
  {
    if (([MEMORY[0x1E4F22298] isAvailable] & 1) != 0
      && (![MEMORY[0x1E4F22290] instancesRespondToSelector:sel_facedownState]
        ? (uint64_t v5 = 8)
        : (uint64_t v5 = 24),
          ([MEMORY[0x1E4F22298] isSourceAvailable:v5] & 1) != 0
       && (uint64_t v6 = [objc_alloc(MEMORY[0x1E4F22298]) initWithClientType:5],
           (v4->_suppressionManager = (CMSuppressionManager *)v6) != 0)))
    {
      v4->_suppressionState = 0;
      v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
      v4->_eventQueue = v7;
      [(NSOperationQueue *)v7 setMaxConcurrentOperationCount:1];
      v4->_handler = (id)[a3 copy];
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v4;
}

- (void)start
{
  p_monitoringStateLock = &self->_monitoringStateLock;
  os_unfair_lock_lock(&self->_monitoringStateLock);
  if ([MEMORY[0x1E4F22290] instancesRespondToSelector:sel_facedownState]) {
    uint64_t v4 = 24;
  }
  else {
    uint64_t v4 = 8;
  }
  suppressionManager = self->_suppressionManager;
  eventQueue = self->_eventQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__BWCoreMotionSuppressionStateMonitor_start__block_invoke;
  v7[3] = &unk_1E5C291F0;
  v7[4] = self;
  [(CMSuppressionManager *)suppressionManager startSuppressionUpdatesToQueue:eventQueue withOptions:v4 withHandler:v7];
  self->_isMonitoring = 1;
  os_unfair_lock_unlock(p_monitoringStateLock);
}

uint64_t __44__BWCoreMotionSuppressionStateMonitor_start__block_invoke(uint64_t result, void *a2, uint64_t a3)
{
  if (a2 && !a3)
  {
    uint64_t v4 = result;
    int v5 = *(_DWORD *)(*(void *)(result + 32) + 16);
    [a2 timestamp];
    unint64_t v7 = v6;
    unint64_t v8 = [a2 type];
    if (v8 < 3) {
      int v5 = v8;
    }
    int v9 = *(_DWORD *)(*(void *)(v4 + 32) + 20);
    result = [MEMORY[0x1E4F22290] instancesRespondToSelector:sel_facedownState];
    if (result)
    {
      result = [a2 facedownState];
      if ((unint64_t)(result - 1) <= 2) {
        int v9 = result;
      }
      else {
        int v9 = 0;
      }
    }
    uint64_t v11 = *(void *)(v4 + 32);
    if (v5 != *(_DWORD *)(v11 + 16) || v9 != *(_DWORD *)(v11 + 20))
    {
      *(_DWORD *)(v11 + 16) = v5;
      *(_DWORD *)(*(void *)(v4 + 32) + 20) = v9;
      result = *(void *)(*(void *)(v4 + 32) + 32);
      if (result)
      {
        v12 = *(uint64_t (**)(__n128))(result + 16);
        v10.n128_u64[0] = v7;
        return v12(v10);
      }
    }
  }
  return result;
}

- (void)_doStop
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if (*(unsigned char *)(a1 + 44))
    {
      [*(id *)(a1 + 8) stopSuppressionUpdates];
      [*(id *)(a1 + 24) cancelAllOperations];
      [*(id *)(a1 + 24) waitUntilAllOperationsAreFinished];
      *(unsigned char *)(a1 + 44) = 0;
    }
    os_unfair_lock_unlock(v2);
  }
}

- (void)dealloc
{
  -[BWCoreMotionSuppressionStateMonitor _doStop]((uint64_t)self);

  v3.receiver = self;
  v3.super_class = (Class)BWCoreMotionSuppressionStateMonitor;
  [(BWCoreMotionSuppressionStateMonitor *)&v3 dealloc];
}

@end