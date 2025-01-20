@interface FigCaptureFrameCounter
+ (id)osStateData;
+ (void)initialize;
- (FigCaptureFrameCounter)initWithTitle:(id)a3;
- (NSString)title;
- (double)_frameRateWithFramesCount:(int64_t)a3 firstFramePTS:(id *)a4 lastFramePTS:(id *)a5;
- (double)loggingInterval;
- (id)_summaryIsolated;
- (id)summary;
- (void)_logIntervalFrameRate;
- (void)dealloc;
- (void)incrementWithPTS:(id *)a3;
- (void)setLoggingInterval:(double)a3;
- (void)start;
- (void)stop;
@end

@implementation FigCaptureFrameCounter

- (void)incrementWithPTS:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_started)
  {
    p_totalLastFramePTS = &self->_totalLastFramePTS;
    if ((self->_totalLastFramePTS.flags & 1) == 0
      || (*(_OWORD *)&time1.value = *(_OWORD *)&p_totalLastFramePTS->value,
          time1.epoch = self->_totalLastFramePTS.epoch,
          CMTime time2 = (CMTime)*a3,
          CMTimeCompare(&time1, &time2) < 0))
    {
      int64_t totalFramesCount = self->_totalFramesCount;
      BOOL v9 = totalFramesCount == 0;
      self->_int64_t totalFramesCount = totalFramesCount + 1;
      ++self->_intervalFramesCount;
      if (!totalFramesCount)
      {
        long long v12 = *(_OWORD *)&a3->var0;
        self->_totalFirstFramePTS.epoch = a3->var3;
        *(_OWORD *)&self->_totalFirstFramePTS.value = v12;
        long long v13 = *(_OWORD *)&a3->var0;
        self->_intervalFirstFramePTS.epoch = a3->var3;
        *(_OWORD *)&self->_intervalFirstFramePTS.value = v13;
      }
      long long v14 = *(_OWORD *)&a3->var0;
      self->_totalLastFramePTS.epoch = a3->var3;
      *(_OWORD *)&p_totalLastFramePTS->value = v14;
      long long v15 = *(_OWORD *)&a3->var0;
      self->_intervalLastFramePTS.epoch = a3->var3;
      *(_OWORD *)&self->_intervalLastFramePTS.value = v15;
      char v10 = 1;
    }
    else
    {
      v7 = NSString;
      CMTime time1 = (CMTime)*a3;
      Float64 Seconds = CMTimeGetSeconds(&time1);
      *(_OWORD *)&time1.value = *(_OWORD *)&p_totalLastFramePTS->value;
      time1.epoch = self->_totalLastFramePTS.epoch;
      objc_msgSend(v7, "stringWithFormat:", @"PTS (%f) must be later than last PTS (%f)", *(void *)&Seconds, CMTimeGetSeconds(&time1));
      BOOL v9 = 0;
      char v10 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
    char v10 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  if (v9 && dword_1EB4C5730)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((v10 & 1) == 0)
  {
    v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)start
{
  location[16] = *(id *)MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_started)
  {
    os_unfair_lock_unlock(p_lock);
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    self->_started = 1;
    if (self->_loggingInterval > 0.0)
    {
      v5 = NSString;
      v6 = (objc_class *)objc_opt_class();
      v7 = (const char *)[(id)objc_msgSend(v5 stringWithFormat:@"%@-%@", NSStringFromClass(v6), self->_title), "UTF8String"];
      v8 = (OS_dispatch_queue *)dispatch_queue_create(v7, 0);
      self->_timerQueue = v8;
      self->_timer = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 1uLL, (dispatch_queue_t)v8);
      dispatch_time_t v9 = dispatch_time(0, (uint64_t)(self->_loggingInterval * 1000000000.0));
      dispatch_source_set_timer((dispatch_source_t)self->_timer, v9, (unint64_t)(self->_loggingInterval * 1000000000.0), 0);
      objc_initWeak(location, self);
      timer = self->_timer;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __31__FigCaptureFrameCounter_start__block_invoke;
      handler[3] = &unk_1E5C24580;
      objc_copyWeak(&v12, location);
      dispatch_source_set_event_handler(timer, handler);
      dispatch_resume((dispatch_object_t)self->_timer);
      objc_destroyWeak(&v12);
      objc_destroyWeak(location);
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (FigCaptureFrameCounter)initWithTitle:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigCaptureFrameCounter;
  v4 = [(FigCaptureFrameCounter *)&v6 init];
  if (v4)
  {
    v4->_title = (NSString *)[a3 copy];
    v4->_loggingInterval = 10.0;
    v4->_lock._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock((os_unfair_lock_t)&sWeakFrameCountersLock);
    [(id)sWeakFrameCounters addObject:v4];
    os_unfair_lock_unlock((os_unfair_lock_t)&sWeakFrameCountersLock);
  }
  return v4;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
    sOSStateHandle = [[FigCaptureOSStateHandle alloc] initWithTitle:@"FigCaptureFrameCounter Summaries" queue:0 dataProviderBlock:&__block_literal_global_10];
    sWeakFrameCounters = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:1];
  }
}

id __36__FigCaptureFrameCounter_initialize__block_invoke()
{
  return +[FigCaptureFrameCounter osStateData];
}

+ (id)osStateData
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  os_unfair_lock_lock((os_unfair_lock_t)&sWeakFrameCountersLock);
  id v3 = (id)[(id)sWeakFrameCounters allObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)&sWeakFrameCountersLock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "summary"), objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "title"));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return v2;
}

- (void)dealloc
{
  if (self->_started) {
    [(FigCaptureFrameCounter *)self stop];
  }

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureFrameCounter;
  [(FigCaptureFrameCounter *)&v3 dealloc];
}

- (double)loggingInterval
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_loggingInterval = 0.0;
  os_unfair_lock_unlock(p_lock);
  return 0.0;
}

- (void)setLoggingInterval:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_started)
  {
    os_unfair_lock_unlock(p_lock);
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    self->_loggingInterval = a3;
    os_unfair_lock_unlock(p_lock);
  }
}

uint64_t __31__FigCaptureFrameCounter_start__block_invoke(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _logIntervalFrameRate];
}

- (void)_logIntervalFrameRate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t intervalFramesCount = self->_intervalFramesCount;
  $95D729B680665BEAEFA1D6FCA8238556 intervalFirstFramePTS = self->_intervalFirstFramePTS;
  $95D729B680665BEAEFA1D6FCA8238556 intervalLastFramePTS = self->_intervalLastFramePTS;
  [(FigCaptureFrameCounter *)self _frameRateWithFramesCount:intervalFramesCount firstFramePTS:&intervalFirstFramePTS lastFramePTS:&intervalLastFramePTS];
  self->_int64_t intervalFramesCount = 0;
  self->_$95D729B680665BEAEFA1D6FCA8238556 intervalFirstFramePTS = self->_intervalLastFramePTS;
  self->_$95D729B680665BEAEFA1D6FCA8238556 intervalLastFramePTS = *($95D729B680665BEAEFA1D6FCA8238556 *)*(void *)&MEMORY[0x1E4F1FA48];
  os_unfair_lock_unlock(p_lock);
  if (dword_1EB4C5730)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)stop
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL started = self->_started;
  if (self->_started)
  {
    self->_BOOL started = 0;
    timer = self->_timer;
    if (timer)
    {
      dispatch_source_cancel(timer);
      dispatch_release((dispatch_object_t)self->_timer);
      self->_timer = 0;
    }
    timerQueue = self->_timerQueue;
    if (timerQueue)
    {
      dispatch_release(timerQueue);
      self->_timerQueue = 0;
    }
    [(FigCaptureFrameCounter *)self _summaryIsolated];
    uint64_t v7 = (long long *)MEMORY[0x1E4F1FA48];
    self->_int64_t totalFramesCount = 0;
    long long v8 = *v7;
    *(_OWORD *)&self->_totalFirstFramePTS.value = *v7;
    int64_t v9 = *((void *)v7 + 2);
    self->_totalFirstFramePTS.epoch = v9;
    *(_OWORD *)&self->_totalLastFramePTS.value = v8;
    self->_intervalFirstFramePTS.epoch = v9;
    self->_intervalLastFramePTS.epoch = v9;
    self->_totalLastFramePTS.epoch = v9;
    self->_int64_t intervalFramesCount = 0;
    *(_OWORD *)&self->_intervalFirstFramePTS.value = v8;
    *(_OWORD *)&self->_intervalLastFramePTS.value = v8;
  }
  os_unfair_lock_unlock(p_lock);
  if (!started || dword_1EB4C5730 == 0)
  {
    if (started) {
      return;
    }
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  }
  else
  {
    long long v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose();
}

- (id)summary
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(FigCaptureFrameCounter *)self _summaryIsolated];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_summaryIsolated
{
  os_unfair_lock_assert_owner(&self->_lock);
  int64_t totalFramesCount = self->_totalFramesCount;
  $95D729B680665BEAEFA1D6FCA8238556 totalFirstFramePTS = self->_totalFirstFramePTS;
  $95D729B680665BEAEFA1D6FCA8238556 totalLastFramePTS = self->_totalLastFramePTS;
  [(FigCaptureFrameCounter *)self _frameRateWithFramesCount:totalFramesCount firstFramePTS:&totalFirstFramePTS lastFramePTS:&totalLastFramePTS];
  return (id)[NSString stringWithFormat:@"Total frames %ld, fps %f", self->_totalFramesCount, v4];
}

- (double)_frameRateWithFramesCount:(int64_t)a3 firstFramePTS:(id *)a4 lastFramePTS:(id *)a5
{
  memset(&v10, 0, sizeof(v10));
  CMTime lhs = *(CMTime *)a5;
  CMTime v8 = *(CMTime *)a4;
  CMTimeSubtract(&v10, &lhs, &v8);
  CMTime lhs = v10;
  double Seconds = CMTimeGetSeconds(&lhs);
  double result = 0.0;
  if (a3 >= 1 && Seconds > 0.0) {
    return (double)a3 / Seconds;
  }
  return result;
}

- (NSString)title
{
  return self->_title;
}

@end