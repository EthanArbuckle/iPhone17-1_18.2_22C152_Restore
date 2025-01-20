@interface ARRenderSyncScheduler
- (ARRenderSyncScheduler)init;
- (ARRenderSyncScheduler)initWithExpectedFramesPerSecond:(int64_t)a3;
- (BOOL)schedulingActive;
- (double)inputJitterBufferInterval;
- (double)vsyncOffset;
- (int64_t)expectedFramesPerSecond;
- (unint64_t)_callbackActionForBlockWithLatency:(double)a3;
- (unint64_t)excessiveCallbackOptions;
- (void)_callback;
- (void)_tryNextBlockWithTotalTried:(unint64_t)a3;
- (void)setExcessiveCallbackOptions:(unint64_t)a3;
- (void)setExpectedFramesPerSecond:(int64_t)a3;
- (void)setInputJitterBufferInterval:(double)a3;
- (void)setSchedulingActive:(BOOL)a3;
- (void)setVsyncOffset:(double)a3;
- (void)submitBlock:(id)a3;
@end

@implementation ARRenderSyncScheduler

- (ARRenderSyncScheduler)init
{
  return [(ARRenderSyncScheduler *)self initWithExpectedFramesPerSecond:60];
}

- (ARRenderSyncScheduler)initWithExpectedFramesPerSecond:(int64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)ARRenderSyncScheduler;
  v4 = [(ARRenderSyncScheduler *)&v17 init];
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    uint64_t v6 = objc_opt_new();
    blocks = v5->_blocks;
    v5->_blocks = (NSMutableArray *)v6;

    v8 = [[ARRollingNumberSeries alloc] initWithWindowSize:7];
    latencies = v5->_latencies;
    v5->_latencies = v8;

    v5->_schedulingActive = 1;
    objc_initWeak(&location, v5);
    v10 = [ARDisplayLink alloc];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__ARRenderSyncScheduler_initWithExpectedFramesPerSecond___block_invoke;
    v14[3] = &unk_1E61852E8;
    objc_copyWeak(&v15, &location);
    uint64_t v11 = [(ARDisplayLink *)v10 initWithPreferredFramesPerSecond:a3 callback:v14];
    displayLink = v5->_displayLink;
    v5->_displayLink = (ARDisplayLink *)v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __57__ARRenderSyncScheduler_initWithExpectedFramesPerSecond___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _callback];
}

- (double)vsyncOffset
{
  [(ARDisplayLink *)self->_displayLink vsyncOffset];
  return result;
}

- (void)setVsyncOffset:(double)a3
{
}

- (int64_t)expectedFramesPerSecond
{
  return [(ARDisplayLink *)self->_displayLink preferredFramesPerSecond];
}

- (void)setExpectedFramesPerSecond:(int64_t)a3
{
}

- (BOOL)schedulingActive
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_schedulingActive;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSchedulingActive:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_schedulingActive = a3;
  if (!a3)
  {
    if ([(ARRenderSyncScheduler *)self excessiveCallbackOptions] == 1)
    {
      v13 = p_lock;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v6 = self->_blocks;
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v16;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
            v12 = [(ARDisplayLink *)self->_displayLink runloop];
            v14[0] = MEMORY[0x1E4F143A8];
            v14[1] = 3221225472;
            v14[2] = __45__ARRenderSyncScheduler_setSchedulingActive___block_invoke;
            v14[3] = &unk_1E61851B0;
            void v14[4] = v11;
            [v12 runOnRunLoop:v14];

            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v8);
      }

      p_lock = v13;
    }
    [(NSMutableArray *)self->_blocks removeAllObjects];
  }
  os_unfair_lock_unlock(p_lock);
}

void __45__ARRenderSyncScheduler_setSchedulingActive___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) block];
  v1[2]();
}

- (void)submitBlock:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_schedulingActive)
  {
    v5 = objc_opt_new();
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    [v5 setEntryTimestamp:v6];

    [v5 setBlock:v4];
    [(NSMutableArray *)self->_blocks addObject:v5];
  }
  else
  {
    uint64_t v7 = [(ARDisplayLink *)self->_displayLink runloop];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __37__ARRenderSyncScheduler_submitBlock___block_invoke;
    v8[3] = &unk_1E6186510;
    id v9 = v4;
    [v7 runOnRunLoop:v8];
  }
  [(NSMutableArray *)self->_blocks count];
  kdebug_trace();
  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __37__ARRenderSyncScheduler_submitBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_callback
{
  [(ARDisplayLink *)self->_displayLink vsyncOffset];
  [(ARRenderSyncScheduler *)self inputJitterBufferInterval];
  [(ARRenderSyncScheduler *)self expectedFramesPerSecond];
  kdebug_trace();
  [(ARRenderSyncScheduler *)self _tryNextBlockWithTotalTried:0];
}

- (void)_tryNextBlockWithTotalTried:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_schedulingActive)
  {
    os_unfair_lock_unlock(p_lock);
    uint64_t v11 = 0;
    goto LABEL_21;
  }
  uint64_t v6 = [(NSMutableArray *)self->_blocks firstObject];
  id v14 = v6;
  if (v6)
  {
    uint64_t v7 = [v6 entryTimestamp];
    [v7 timeIntervalSinceNow];
    double v9 = -v8;

    char v10 = [(ARRenderSyncScheduler *)self _callbackActionForBlockWithLatency:v9];
  }
  else
  {
    char v10 = 0;
  }
  [(NSMutableArray *)self->_blocks count];
  kdebug_trace();
  if (v10)
  {
    [(NSMutableArray *)self->_blocks removeObjectAtIndex:0];
    os_unfair_lock_unlock(p_lock);
    if (v14)
    {
      if (!a3)
      {
        v13 = [v14 block];
        v13[2]();

        self->_reportAdjustments = 1;
        if ((v10 & 2) == 0) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }
      if ([(ARRenderSyncScheduler *)self excessiveCallbackOptions] == 1)
      {
        v12 = [v14 block];
        v12[2]();
      }
      self->_reportAdjustments = 1;
      [(ARRenderSyncScheduler *)self excessiveCallbackOptions];
      goto LABEL_17;
    }
    if (!a3 && self->_reportAdjustments) {
LABEL_17:
    }
      kdebug_trace();
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    if (!a3 && self->_reportAdjustments) {
      goto LABEL_17;
    }
  }
  if ((v10 & 2) != 0)
  {
LABEL_19:
    kdebug_trace();
    [(ARRenderSyncScheduler *)self _tryNextBlockWithTotalTried:a3 + 1];
  }
LABEL_20:
  uint64_t v11 = v14;
LABEL_21:
}

- (unint64_t)_callbackActionForBlockWithLatency:(double)a3
{
  [(ARRenderSyncScheduler *)self inputJitterBufferInterval];
  double v6 = v5;
  [(ARRollingNumberSeries *)self->_latencies count];
  [(ARRollingNumberSeries *)self->_latencies min];
  [(ARRollingNumberSeries *)self->_latencies max];
  kdebug_trace();
  if (!self->_initialLatencyReached)
  {
    if (v6 > a3) {
      return 0;
    }
    self->_initialLatencyReached = 1;
  }
  if ([(ARRollingNumberSeries *)self->_latencies count])
  {
    [(ARRollingNumberSeries *)self->_latencies max];
    if (v7 < v6)
    {
      self->_initialLatencyReached = 0;
      [(ARRollingNumberSeries *)self->_latencies clear];
      return 0;
    }
  }
  [(ARRollingNumberSeries *)self->_latencies appendNumber:a3];
  unint64_t v9 = [(ARRollingNumberSeries *)self->_latencies count];
  if (v9 != [(ARRollingNumberSeries *)self->_latencies windowSize]) {
    return 1;
  }
  [(ARRollingNumberSeries *)self->_latencies min];
  if (v10 <= v6 + 1.0 / (double)[(ARRenderSyncScheduler *)self expectedFramesPerSecond]) {
    return 1;
  }
  self->_initialLatencyReached = 0;
  return 3;
}

- (double)inputJitterBufferInterval
{
  return self->_inputJitterBufferInterval;
}

- (void)setInputJitterBufferInterval:(double)a3
{
  self->_inputJitterBufferInterval = a3;
}

- (unint64_t)excessiveCallbackOptions
{
  return self->_excessiveCallbackOptions;
}

- (void)setExcessiveCallbackOptions:(unint64_t)a3
{
  self->_excessiveCallbackOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocks, 0);
  objc_storeStrong((id *)&self->_latencies, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end