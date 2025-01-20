@interface SCNDisplayLink
- (BOOL)_isInvalidated;
- (BOOL)isPaused;
- (BOOL)setPaused:(BOOL)a3 nextFrameTimeHint:(double)a4 lastUpdate:(double)a5;
- (SCNDisplayLink)init;
- (SCNDisplayLink)initWithQueue:(id)a3 screen:(id)a4 policy:(unint64_t)a5 block:(id)a6;
- (float)preferredFrameRate;
- (id)adaptativeFrameRate;
- (int)queuedFrameCount;
- (void)_caDisplayLinkCallback;
- (void)_callbackWithTime:(double)a3;
- (void)_displayLinkCallbackReturningImmediately;
- (void)_displayLinkCallbackWaitingOnFrameCompletionWithTime:(uint64_t)a1;
- (void)dealloc;
- (void)invalidate;
- (void)setAdaptativeFrameRate:(id)a3;
- (void)setNeedsDisplay;
- (void)setPaused:(BOOL)a3;
- (void)setPreferredFrameRate:(float)a3;
@end

@implementation SCNDisplayLink

- (SCNDisplayLink)initWithQueue:(id)a3 screen:(id)a4 policy:(unint64_t)a5 block:(id)a6
{
  v21.receiver = self;
  v21.super_class = (Class)SCNDisplayLink;
  v10 = [(SCNDisplayLink *)&v21 init];
  v11 = v10;
  if (v10)
  {
    v10->_preferredFrameRate = 0.0;
    v10->_paused = 1;
    v10->_queue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
    atomic_store(0, (unsigned int *)&v11->_queuedFrameCount);
    v11->_block = (id)[a6 copy];
    v11->_lastFrameTime = 0.0;
    v11->_runningLock = objc_alloc_init(SCNRecursiveLock);
    if (a4) {
      id v12 = a4;
    }
    else {
      id v12 = (id)MEMORY[0x263F15780];
    }
    v13 = (CADisplayLink *)(id)[v12 displayLinkWithTarget:v11 selector:sel__caDisplayLinkCallback];
    v11->_caDisplayLink = v13;
    [(CADisplayLink *)v13 setPaused:1];
    caDisplayLink = v11->_caDisplayLink;
    uint64_t v15 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [(CADisplayLink *)caDisplayLink addToRunLoop:v15 forMode:*MEMORY[0x263EFF588]];
    if (a5 == 1)
    {
      v11->_coalescingSource = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83B0], 0, 0, (dispatch_queue_t)v11->_queue);
      objc_initWeak(&location, v11);
      coalescingSource = v11->_coalescingSource;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __52__SCNDisplayLink_initWithQueue_screen_policy_block___block_invoke;
      v18[3] = &unk_264009390;
      objc_copyWeak(&v19, &location);
      dispatch_source_set_event_handler(coalescingSource, v18);
      dispatch_resume((dispatch_object_t)v11->_coalescingSource);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
  return v11;
}

- (void)setPreferredFrameRate:(float)a3
{
  if (self->_preferredFrameRate != a3)
  {
    self->_preferredFrameRate = a3;
    [(CADisplayLink *)self->_caDisplayLink setPreferredFramesPerSecond:(uint64_t)a3];
  }
}

- (SCNDisplayLink)init
{
  return 0;
}

void __52__SCNDisplayLink_initWithQueue_screen_policy_block___block_invoke(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));

  -[SCNDisplayLink _displayLinkCallbackReturningImmediately]((uint64_t)Weak);
}

- (void)_displayLinkCallbackReturningImmediately
{
  if (a1 && ([(id)a1 isPaused] & 1) == 0 && (objc_msgSend((id)a1, "_isInvalidated") & 1) == 0)
  {
    if ((int)atomic_fetch_add((atomic_uint *volatile)(a1 + 88), 1u) < 4)
    {
      v2 = (void *)MEMORY[0x210535ED0]();
      if (([(id)a1 isPaused] & 1) == 0 && !*(unsigned char *)(a1 + 57))
      {
        double v3 = COERCE_DOUBLE(atomic_load((unint64_t *)(a1 + 16)));
        (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v3);
      }
      atomic_fetch_add((atomic_uint *volatile)(a1 + 88), 0xFFFFFFFF);
    }
    else
    {
      atomic_fetch_add((atomic_uint *volatile)(a1 + 88), 0xFFFFFFFF);
    }
  }
}

- (void)dealloc
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Unreachable code: -[SCNDisplayLink invalidate] must be called before -[SCNDisplayLink dealloc]", v1, 2u);
}

- (BOOL)isPaused
{
  objc_sync_enter(self);
  BOOL paused = self->_paused;
  objc_sync_exit(self);
  return paused;
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  objc_sync_enter(self);
  if ([(SCNDisplayLink *)self isPaused] != v3)
  {
    self->_BOOL paused = v3;
    if (v3) {
      self->_lastFrameTime = 0.0;
    }
    [(CADisplayLink *)self->_caDisplayLink setPaused:v3];
  }

  objc_sync_exit(self);
}

- (BOOL)setPaused:(BOOL)a3 nextFrameTimeHint:(double)a4 lastUpdate:(double)a5
{
  double v9 = CACurrentMediaTime();
  BOOL v10 = v9 - a5 <= 0.25 || a4 - v9 <= 0.25;
  BOOL v11 = !a3 || v10;
  if (v11)
  {
    [(SCNDisplayLink *)self setPaused:0];
  }
  else
  {
    [(SCNDisplayLink *)self setPaused:1];
    if (a4 != INFINITY)
    {
      CFTimeInterval v12 = CACurrentMediaTime();
      dispatch_time_t v13 = dispatch_time(0, (uint64_t)((a4 - v12 + -0.01) * 1000000000.0));
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __57__SCNDisplayLink_setPaused_nextFrameTimeHint_lastUpdate___block_invoke;
      block[3] = &unk_264004DF8;
      block[4] = self;
      dispatch_after(v13, MEMORY[0x263EF83A0], block);
    }
  }
  return !v11;
}

uint64_t __57__SCNDisplayLink_setPaused_nextFrameTimeHint_lastUpdate___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isInvalidated];
  if ((result & 1) == 0)
  {
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 setPaused:0];
  }
  return result;
}

- (id)adaptativeFrameRate
{
  return self->_adaptativeFrameDuration;
}

- (void)setAdaptativeFrameRate:(id)a3
{
  id adaptativeFrameDuration = self->_adaptativeFrameDuration;
  if (adaptativeFrameDuration != a3)
  {

    self->_id adaptativeFrameDuration = (id)[a3 copy];
  }
}

- (float)preferredFrameRate
{
  return self->_preferredFrameRate;
}

- (int)queuedFrameCount
{
  return atomic_load((unsigned int *)&self->_queuedFrameCount);
}

- (void)_callbackWithTime:(double)a3
{
  if (self->_coalescingSource)
  {
    kdebug_trace();
    atomic_store(*(unint64_t *)&a3, (unint64_t *)&self->_lastDisplayLinkTime);
    coalescingSource = self->_coalescingSource;
    dispatch_source_merge_data(coalescingSource, 1uLL);
  }
  else
  {
    -[SCNDisplayLink _displayLinkCallbackWaitingOnFrameCompletionWithTime:]((uint64_t)self, a3);
  }
}

- (void)_displayLinkCallbackWaitingOnFrameCompletionWithTime:(uint64_t)a1
{
  if (a1)
  {
    id v4 = (id)a1;
    [*(id *)(a1 + 80) lock];
    kdebug_trace();
    if (([(id)a1 isPaused] & 1) == 0 && (objc_msgSend((id)a1, "_isInvalidated") & 1) == 0)
    {
      if ((int)atomic_fetch_add((atomic_uint *volatile)(a1 + 88), 1u) < 4)
      {
        v5 = (void *)MEMORY[0x210535ED0]();
        v6 = *(NSObject **)(a1 + 48);
        v7[0] = MEMORY[0x263EF8330];
        v7[1] = 3221225472;
        v7[2] = __71__SCNDisplayLink__displayLinkCallbackWaitingOnFrameCompletionWithTime___block_invoke;
        v7[3] = &unk_2640093B8;
        v7[4] = a1;
        *(double *)&v7[5] = a2;
        dispatch_sync(v6, v7);
      }
      else
      {
        atomic_fetch_add((atomic_uint *volatile)(a1 + 88), 0xFFFFFFFF);
      }
    }
    [*(id *)(a1 + 80) unlock];
  }
}

uint64_t __71__SCNDisplayLink__displayLinkCallbackWaitingOnFrameCompletionWithTime___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isPaused];
  uint64_t v3 = *(void *)(a1 + 32);
  if ((result & 1) == 0 && !*(unsigned char *)(v3 + 57))
  {
    uint64_t result = (*(uint64_t (**)(double))(*(void *)(v3 + 32) + 16))(*(double *)(a1 + 40));
    uint64_t v3 = *(void *)(a1 + 32);
  }
  atomic_fetch_add((atomic_uint *volatile)(v3 + 88), 0xFFFFFFFF);
  return result;
}

- (void)_caDisplayLinkCallback
{
  [(CADisplayLink *)self->_caDisplayLink targetTimestamp];

  -[SCNDisplayLink _callbackWithTime:](self, "_callbackWithTime:");
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    [(SCNRecursiveLock *)self->_runningLock lock];
    self->_invalidated = 1;
    [(CADisplayLink *)self->_caDisplayLink invalidate];

    self->_caDisplayLink = 0;
    runningLock = self->_runningLock;
    [(SCNRecursiveLock *)runningLock unlock];
  }
}

- (void)setNeedsDisplay
{
}

- (BOOL)_isInvalidated
{
  return self->_invalidated;
}

@end