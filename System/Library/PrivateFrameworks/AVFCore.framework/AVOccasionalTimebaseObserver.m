@interface AVOccasionalTimebaseObserver
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_nextFiringTimeAfterTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_previousFiringTimeBeforeTime:(SEL)a3;
- (AVOccasionalTimebaseObserver)initWithTimebase:(OpaqueCMTimebase *)a3 times:(id)a4 queue:(id)a5 block:(id)a6;
- (void)_effectiveRateChanged;
- (void)_fireBlock;
- (void)_handleTimeDiscontinuity;
- (void)_resetNextFireTime;
- (void)dealloc;
@end

@implementation AVOccasionalTimebaseObserver

- (AVOccasionalTimebaseObserver)initWithTimebase:(OpaqueCMTimebase *)a3 times:(id)a4 queue:(id)a5 block:(id)a6
{
  v27.receiver = self;
  v27.super_class = (Class)AVOccasionalTimebaseObserver;
  v9 = [(AVTimebaseObserver *)&v27 initWithTimebase:a3 queue:a5];
  if (v9)
  {
    if ([a4 count]) {
      goto LABEL_7;
    }
    timerQueue = v9->super._timerQueue;
    if (timerQueue)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__AVOccasionalTimebaseObserver_initWithTimebase_times_queue_block___block_invoke;
      block[3] = &unk_1E57B1E80;
      block[4] = v9;
      dispatch_async(timerQueue, block);
    }
    else
    {
      [(AVTimebaseObserver *)v9 invalidate];
    }
    if ([a4 count])
    {
LABEL_7:
      if (a6)
      {
        v9->_times = (NSArray *)(id)[a4 sortedArrayUsingComparator:&__block_literal_global_10];
        v9->_block = (id)[a6 copy];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __67__AVOccasionalTimebaseObserver_initWithTimebase_times_queue_block___block_invoke_4;
        v24[3] = &unk_1E57B1E80;
        v24[4] = v9;
        [(AVTimebaseObserver *)v9 _finishInitializationWithTimerEventHandler:v24];
        return v9;
      }
      v12 = v9->super._timerQueue;
      if (v12)
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __67__AVOccasionalTimebaseObserver_initWithTimebase_times_queue_block___block_invoke_2;
        v25[3] = &unk_1E57B1E80;
        v25[4] = v9;
        dispatch_async(v12, v25);
      }
      else
      {
        [(AVTimebaseObserver *)v9 invalidate];
      }
      v13 = v9;
      v19 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v20 = *MEMORY[0x1E4F1C3C8];
      v21 = "block != ((void *)0)";
    }
    else
    {
      v22 = v9;
      v19 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v20 = *MEMORY[0x1E4F1C3C8];
      v21 = "[times count] > 0";
    }
    v23 = (void *)[v19 exceptionWithName:v20, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v9, a2, @"invalid parameter not satisfying: %s", v14, v15, v16, v17, v18, (uint64_t)v21), 0 reason userInfo];
    objc_exception_throw(v23);
  }
  return v9;
}

uint64_t __67__AVOccasionalTimebaseObserver_initWithTimebase_times_queue_block___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

uint64_t __67__AVOccasionalTimebaseObserver_initWithTimebase_times_queue_block___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

uint64_t __67__AVOccasionalTimebaseObserver_initWithTimebase_times_queue_block___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  if (!a2)
  {
    memset(&time1, 0, sizeof(time1));
    if (a3) {
      goto LABEL_3;
    }
LABEL_5:
    memset(&v5, 0, sizeof(v5));
    return CMTimeCompare(&time1, &v5);
  }
  [a2 CMTimeValue];
  if (!a3) {
    goto LABEL_5;
  }
LABEL_3:
  [a3 CMTimeValue];
  return CMTimeCompare(&time1, &v5);
}

void __67__AVOccasionalTimebaseObserver_initWithTimebase_times_queue_block___block_invoke_4(uint64_t a1)
{
  v2 = (void *)MEMORY[0x199715AE0]();
  [*(id *)(a1 + 32) _fireBlock];
  v3 = *(void **)(a1 + 32);
  if (v3[4]) {
    [v3 _resetNextFireTime];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVOccasionalTimebaseObserver;
  [(AVTimebaseObserver *)&v3 dealloc];
}

- (void)_fireBlock
{
  if (!self->super._invalid) {
    (*((void (**)(void))self->_block + 2))();
  }
}

- (void)_effectiveRateChanged
{
  if (self->super._timerSource)
  {
    timebase = self->super._timebase;
    if (timebase)
    {
      Float64 Rate = CMTimebaseGetRate(timebase);
      currentFloat64 Rate = self->super._currentRate;
      if (Rate != currentRate)
      {
        self->super._lastFloat64 Rate = currentRate;
        self->super._currentFloat64 Rate = Rate;
        BOOL v6 = Rate == 0.0 || self->super._timerSource == 0;
        if (!v6 && (currentRate == 0.0 || Rate > 0.0 == currentRate <= 0.0))
        {
          [(AVOccasionalTimebaseObserver *)self _resetNextFireTime];
        }
      }
    }
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_previousFiringTimeBeforeTime:(SEL)a3
{
  NSUInteger v7 = [(NSArray *)self->_times count];
  times = self->_times;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__AVOccasionalTimebaseObserver__previousFiringTimeBeforeTime___block_invoke;
  v11[3] = &unk_1E57B4628;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a4;
  v11[4] = self;
  v11[5] = v7;
  result = [(NSArray *)times indexOfObjectPassingTest:v11];
  if (result == ($3CC8671D27C23BF42ADDB32F2B5E48AE *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
    retstr->var3 = *(void *)(v10 + 16);
  }
  else
  {
    result = [(NSArray *)self->_times objectAtIndex:result];
    if (result)
    {
      return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result CMTimeValue];
    }
    else
    {
      retstr->var0 = 0;
      *(void *)&retstr->var1 = 0;
      retstr->var3 = 0;
    }
  }
  return result;
}

uint64_t __62__AVOccasionalTimebaseObserver__previousFiringTimeBeforeTime___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  memset(&v12, 0, sizeof(v12));
  if (a2) {
    [a2 CMTimeValue];
  }
  CMTime time1 = v12;
  CMTime time2 = *(CMTime *)(a1 + 48);
  if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0) {
    return 0;
  }
  if (*(void *)(a1 + 40) > (unint64_t)(a3 + 1))
  {
    v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "objectAtIndex:");
    if (v8) {
      [v8 CMTimeValue];
    }
    else {
      memset(&v9, 0, sizeof(v9));
    }
    CMTime time1 = *(CMTime *)(a1 + 48);
    if (CMTimeCompare(&v9, &time1) < 0) {
      return 0;
    }
  }
  uint64_t result = 1;
  *a4 = 1;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_nextFiringTimeAfterTime:(SEL)a3
{
  times = self->_times;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__AVOccasionalTimebaseObserver__nextFiringTimeAfterTime___block_invoke;
  v9[3] = &__block_descriptor_56_e15_B32__0_8Q16_B24l;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
  uint64_t result = [(NSArray *)times indexOfObjectPassingTest:v9];
  if (result == ($3CC8671D27C23BF42ADDB32F2B5E48AE *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
    retstr->var3 = *(void *)(v8 + 16);
  }
  else
  {
    uint64_t result = [(NSArray *)self->_times objectAtIndex:result];
    if (result)
    {
      return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result CMTimeValue];
    }
    else
    {
      retstr->var0 = 0;
      *(void *)&retstr->var1 = 0;
      retstr->var3 = 0;
    }
  }
  return result;
}

BOOL __57__AVOccasionalTimebaseObserver__nextFiringTimeAfterTime___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  memset(&v10, 0, sizeof(v10));
  if (a2) {
    [a2 CMTimeValue];
  }
  CMTime time1 = v10;
  CMTime v8 = *(CMTime *)(a1 + 32);
  int32_t v6 = CMTimeCompare(&time1, &v8);
  if (v6 >= 1) {
    *a4 = 1;
  }
  return v6 > 0;
}

- (void)_resetNextFireTime
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MEMORY[0x1E4F1F9F8];
  CMTimeValue value = *MEMORY[0x1E4F1F9F8];
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  __n128 v12 = 0uLL;
  uint64_t v13 = 0;
  AVTimebaseObserver_figTimebaseGetTime(&v12);
  currentFloat64 Rate = self->super._currentRate;
  if (currentRate <= 0.0)
  {
    CMTimeFlags flags = *(_DWORD *)(v3 + 12);
    CMTimeEpoch epoch = *(void *)(v3 + 16);
  }
  else
  {
    __n128 v9 = v12;
    uint64_t v10 = v13;
    [(AVOccasionalTimebaseObserver *)self _nextFiringTimeAfterTime:&v9];
    CMTimeValue value = fireTime.value;
    CMTimeFlags flags = fireTime.flags;
    CMTimeScale timescale = fireTime.timescale;
    CMTimeEpoch epoch = fireTime.epoch;
    currentFloat64 Rate = self->super._currentRate;
  }
  if (currentRate < 0.0)
  {
    __n128 v9 = v12;
    uint64_t v10 = v13;
    [(AVOccasionalTimebaseObserver *)self _previousFiringTimeBeforeTime:&v9];
    CMTimeValue value = fireTime.value;
    CMTimeFlags flags = fireTime.flags;
    CMTimeScale timescale = fireTime.timescale;
    CMTimeEpoch epoch = fireTime.epoch;
  }
  if (flags)
  {
    timebase = self->super._timebase;
    if (timebase)
    {
      timerSource = self->super._timerSource;
      if (timerSource)
      {
        fireTime.CMTimeValue value = value;
        fireTime.CMTimeScale timescale = timescale;
        fireTime.CMTimeFlags flags = flags;
        fireTime.CMTimeEpoch epoch = epoch;
        CMTimebaseSetTimerDispatchSourceNextFireTime(timebase, timerSource, &fireTime, 0);
      }
    }
  }
}

- (void)_handleTimeDiscontinuity
{
  if (self->super._timerSource)
  {
    if (self->super._timebase) {
      [(AVOccasionalTimebaseObserver *)self _resetNextFireTime];
    }
  }
}

@end