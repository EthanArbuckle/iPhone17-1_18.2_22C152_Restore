@interface AVPeriodicTimebaseObserver
- (AVPeriodicTimebaseObserver)initWithTimebase:(OpaqueCMTimebase *)a3 interval:(id *)a4 offset:(id *)a5 queue:(id)a6 block:(id)a7;
- (AVPeriodicTimebaseObserver)initWithTimebase:(OpaqueCMTimebase *)a3 interval:(id *)a4 queue:(id)a5 block:(id)a6;
- (void)_effectiveRateChanged;
- (void)_fireBlockForTime:(id *)a3;
- (void)_handleTimeDiscontinuity;
- (void)_resetNextFireTime;
- (void)dealloc;
- (void)initGutsWithTimebase:(OpaqueCMTimebase *)a3 interval:(id *)a4 offset:(id *)a5 queue:(id)a6 block:(id)a7;
@end

@implementation AVPeriodicTimebaseObserver

- (AVPeriodicTimebaseObserver)initWithTimebase:(OpaqueCMTimebase *)a3 interval:(id *)a4 queue:(id)a5 block:(id)a6
{
  v17.receiver = self;
  v17.super_class = (Class)AVPeriodicTimebaseObserver;
  v10 = [(AVTimebaseObserver *)&v17 initWithTimebase:a3 queue:a5];
  v11 = v10;
  if (v10)
  {
    long long v15 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    long long v13 = *MEMORY[0x1E4F1FA48];
    uint64_t v14 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    [(AVPeriodicTimebaseObserver *)v10 initGutsWithTimebase:a3 interval:&v15 offset:&v13 queue:a5 block:a6];
  }
  return v11;
}

- (void)initGutsWithTimebase:(OpaqueCMTimebase *)a3 interval:(id *)a4 offset:(id *)a5 queue:(id)a6 block:(id)a7
{
  if ((a4->var2 & 0x1D) != 1)
  {
    timerQueue = self->super._timerQueue;
    if (timerQueue)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __79__AVPeriodicTimebaseObserver_initGutsWithTimebase_interval_offset_queue_block___block_invoke;
      block[3] = &unk_1E57B1E80;
      block[4] = self;
      dispatch_async(timerQueue, block);
    }
    else
    {
      [(AVTimebaseObserver *)self invalidate];
    }
    if ((a4->var2 & 0x1D) != 1)
    {
      v18 = self;
      v24 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v25 = *MEMORY[0x1E4F1C3C8];
      v26 = "((Boolean)(((interval).flags & (kCMTimeFlags_Valid | kCMTimeFlags_ImpliedValueFlagsMask)) == kCMTimeFlags_Valid))";
      goto LABEL_19;
    }
  }
  CMTime time1 = (CMTime)*a4;
  long long v30 = *MEMORY[0x1E4F1FA48];
  *(_OWORD *)&time2.value = *MEMORY[0x1E4F1FA48];
  CMTimeEpoch v13 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  time2.epoch = v13;
  if (CMTimeCompare(&time1, &time2) <= 0)
  {
    uint64_t v14 = self->super._timerQueue;
    if (v14)
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __79__AVPeriodicTimebaseObserver_initGutsWithTimebase_interval_offset_queue_block___block_invoke_2;
      v33[3] = &unk_1E57B1E80;
      v33[4] = self;
      dispatch_async(v14, v33);
    }
    else
    {
      [(AVTimebaseObserver *)self invalidate];
    }
    CMTime time1 = (CMTime)*a4;
    *(_OWORD *)&time2.value = v30;
    time2.epoch = v13;
    if (CMTimeCompare(&time1, &time2) <= 0)
    {
      v28 = self;
      v24 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v25 = *MEMORY[0x1E4F1C3C8];
      v26 = "((Boolean)(CMTimeCompare(interval, kCMTimeZero) > 0))";
      goto LABEL_19;
    }
  }
  if (!a7)
  {
    objc_super v17 = self->super._timerQueue;
    if (v17)
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __79__AVPeriodicTimebaseObserver_initGutsWithTimebase_interval_offset_queue_block___block_invoke_3;
      v32[3] = &unk_1E57B1E80;
      v32[4] = self;
      dispatch_async(v17, v32);
    }
    else
    {
      [(AVTimebaseObserver *)self invalidate];
    }
    v27 = self;
    v24 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v25 = *MEMORY[0x1E4F1C3C8];
    v26 = "block != ((void *)0)";
LABEL_19:
    v29 = (void *)[v24 exceptionWithName:v25, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v19, v20, v21, v22, v23, (uint64_t)v26), 0 reason userInfo];
    objc_exception_throw(v29);
  }
  *(void *)&self->_sequenceNum = [a7 copy];
  int64_t var3 = a4->var3;
  *(_OWORD *)(&self->super._invalid + 4) = *(_OWORD *)&a4->var0;
  *(void *)&self->_intervalRequested.flags = var3;
  int64_t v16 = a5->var3;
  *(_OWORD *)((char *)&self->_lastStopTime.epoch + 4) = *(_OWORD *)&a5->var0;
  *(void *)&self->_nonPeriodicOffset.flags = v16;
  *(void *)&self->_lastPeriodicFireTime.flags = v13;
  *(_OWORD *)((char *)&self->_lastIntervalUsed.epoch + 4) = v30;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __79__AVPeriodicTimebaseObserver_initGutsWithTimebase_interval_offset_queue_block___block_invoke_4;
  v31[3] = &unk_1E57B1E80;
  v31[4] = self;
  [(AVTimebaseObserver *)self _finishInitializationWithTimerEventHandler:v31];
}

- (AVPeriodicTimebaseObserver)initWithTimebase:(OpaqueCMTimebase *)a3 interval:(id *)a4 offset:(id *)a5 queue:(id)a6 block:(id)a7
{
  v19.receiver = self;
  v19.super_class = (Class)AVPeriodicTimebaseObserver;
  v12 = [(AVTimebaseObserver *)&v19 initWithTimebase:a3 queue:a6];
  CMTimeEpoch v13 = v12;
  if (v12)
  {
    long long v17 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    long long v15 = *(_OWORD *)&a5->var0;
    int64_t v16 = a5->var3;
    [(AVPeriodicTimebaseObserver *)v12 initGutsWithTimebase:a3 interval:&v17 offset:&v15 queue:a6 block:a7];
  }
  return v13;
}

uint64_t __79__AVPeriodicTimebaseObserver_initGutsWithTimebase_interval_offset_queue_block___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

uint64_t __79__AVPeriodicTimebaseObserver_initGutsWithTimebase_interval_offset_queue_block___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

uint64_t __79__AVPeriodicTimebaseObserver_initGutsWithTimebase_interval_offset_queue_block___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __79__AVPeriodicTimebaseObserver_initGutsWithTimebase_interval_offset_queue_block___block_invoke_4(uint64_t a1)
{
  v2 = (void *)MEMORY[0x199715AE0]();
  objc_msgSend(*(id *)(a1 + 32), "_fireBlockForTime:", &v4, AVTimebaseObserver_figTimebaseGetTime(&v4).n128_f64[0]);
  v3 = *(void **)(a1 + 32);
  if (v3[4]) {
    [v3 _resetNextFireTime];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVPeriodicTimebaseObserver;
  [(AVTimebaseObserver *)&v3 dealloc];
}

- (void)_fireBlockForTime:(id *)a3
{
  if (!self->super._invalid)
  {
    uint64_t v3 = *(void *)&self->_sequenceNum;
    __n128 v4 = *(void (**)(uint64_t, $3CC8671D27C23BF42ADDB32F2B5E48AE *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(v3 + 16);
    $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
    v4(v3, &v5, a3);
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
        uint64_t v6 = MEMORY[0x1E4F1F9F8];
        long long v10 = *MEMORY[0x1E4F1F9F8];
        *(_OWORD *)((char *)&self->_intervalRequested.epoch + 4) = *MEMORY[0x1E4F1F9F8];
        uint64_t v7 = *(void *)(v6 + 16);
        *(void *)&self->_lastIntervalUsed.flags = v7;
        __n128 v13 = 0uLL;
        uint64_t v14 = 0;
        AVTimebaseObserver_figTimebaseGetTime(&v13);
        if (self->super._currentRate == 0.0)
        {
          *(__n128 *)((char *)&self->_lastNonperiodicFireTime.epoch + 4) = v13;
          *(void *)&self->_lastStopTime.flags = v14;
          v8 = (void *)MEMORY[0x199715AE0]();
          __n128 v11 = v13;
          uint64_t v12 = v14;
          [(AVPeriodicTimebaseObserver *)self _fireBlockForTime:&v11];
        }
        else
        {
          lastFloat64 Rate = self->super._lastRate;
          if (lastRate != 0.0)
          {
            [(AVPeriodicTimebaseObserver *)self _resetNextFireTime];
            return;
          }
          *(_OWORD *)((char *)&self->_lastNonperiodicFireTime.epoch + 4) = v10;
          *(void *)&self->_lastStopTime.flags = v7;
          v8 = (void *)MEMORY[0x199715AE0]();
          __n128 v11 = v13;
          uint64_t v12 = v14;
          [(AVPeriodicTimebaseObserver *)self _fireBlockForTime:&v11];
          if (self->super._timebase)
          {
            *(__n128 *)((char *)&self->_lastPeriodicFireTime.epoch + 4) = v13;
            *(void *)&self->_lastNonperiodicFireTime.flags = v14;
            [(AVPeriodicTimebaseObserver *)self _resetNextFireTime];
          }
        }
      }
    }
  }
}

- (void)_resetNextFireTime
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  __n128 v24 = 0uLL;
  CMTimeEpoch v25 = 0;
  AVTimebaseObserver_figTimebaseGetTime(&v24);
  uint64_t v3 = (int64_t *)((char *)&self->_intervalRequested.epoch + 4);
  p_CMTimeScale timescale = &self->_lastIntervalUsed.timescale;
  if (self->_lastIntervalUsed.timescale)
  {
    CMTimeValue value = *v3;
    int32_t value_high = HIDWORD(self->_lastIntervalUsed.value);
    uint64_t v28 = *(void *)p_timescale;
    int epoch = self->_lastIntervalUsed.epoch;
  }
  else
  {
    double v5 = fabs(self->super._currentRate);
    CMTime time = *(CMTime *)(&self->super._invalid + 4);
    if (CMTimeGetSeconds(&time) / v5 >= 0.005)
    {
      CMTimeValue value = *(void *)(&self->super._invalid + 4);
      int32_t value_high = HIDWORD(self->_intervalRequested.value);
      uint64_t v28 = *(void *)&self->_intervalRequested.timescale;
      int epoch_high = self->_intervalRequested.epoch;
    }
    else
    {
      CMTimeMakeWithSeconds(&time, v5 * 0.005, HIDWORD(self->_intervalRequested.value));
      CMTimeValue value = time.value;
      int32_t value_high = time.timescale;
      uint64_t v28 = *(void *)&time.flags;
      int epoch_high = HIDWORD(time.epoch);
    }
    int epoch = epoch_high;
    CMTimeValue *v3 = value;
    HIDWORD(self->_lastIntervalUsed.value) = value_high;
    *(void *)p_CMTimeScale timescale = v28;
    LODWORD(self->_lastIntervalUsed.epoch) = epoch;
  }
  v9 = (_OWORD *)((char *)&self->_lastPeriodicFireTime.epoch + 4);
  if ((self->_lastNonperiodicFireTime.timescale & 0x1D) == 1)
  {
    memset(&time, 0, sizeof(time));
    *(_OWORD *)&time2.CMTimeValue value = *v9;
    time2.int epoch = *(void *)&self->_lastNonperiodicFireTime.flags;
    CMTimeConvertScale(&time, &time2, value_high, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    CMTimeMake(&time2, time.value / value * value, value_high);
    CMTimeScale timescale = time2.timescale;
    CMTimeFlags flags = time2.flags;
    CMTimeScale v27 = time2.timescale;
    CMTimeValue v12 = time2.value;
    int64_t v26 = time2.value;
    CMTimeEpoch v13 = time2.epoch;
    uint64_t v14 = MEMORY[0x1E4F1F9F8];
    _OWORD *v9 = *MEMORY[0x1E4F1F9F8];
    *(void *)&self->_lastNonperiodicFireTime.CMTimeFlags flags = *(void *)(v14 + 16);
    lhs.CMTimeScale timescale = timescale;
    lhs.CMTimeFlags flags = flags;
    lhs.int epoch = v13;
    CMTime v20 = *(CMTime *)((char *)&self->_lastStopTime.epoch + 4);
    lhs.CMTimeValue value = v12;
    CMTimeAdd(&time2, &lhs, &v20);
    int64_t v26 = time2.value;
    CMTimeFlags v15 = time2.flags;
    CMTimeScale v27 = time2.timescale;
    CMTimeEpoch v16 = time2.epoch;
  }
  else
  {
    int64_t v26 = *(int64_t *)((char *)&self->_lastIntervalUsed.epoch + 4);
    CMTimeFlags v15 = self->_lastPeriodicFireTime.timescale;
    CMTimeScale v27 = HIDWORD(self->_lastPeriodicFireTime.value);
    CMTimeEpoch v16 = *(void *)&self->_lastPeriodicFireTime.flags;
  }
  currentFloat64 Rate = self->super._currentRate;
  if (currentRate <= 0.0)
  {
    if (currentRate < 0.0)
    {
      while (1)
      {
        time.CMTimeValue value = v26;
        time.CMTimeScale timescale = v27;
        time.CMTimeFlags flags = v15;
        time.int epoch = v16;
        *(__n128 *)&time2.CMTimeValue value = v24;
        time2.int epoch = v25;
        if (CMTimeCompare(&time, &time2) < 0 || (v15 & 0x1D) != 1) {
          break;
        }
        time2.CMTimeValue value = v26;
        time2.CMTimeScale timescale = v27;
        time2.CMTimeFlags flags = v15;
        time2.int epoch = v16;
        lhs.CMTimeValue value = value;
        lhs.CMTimeScale timescale = value_high;
        *(void *)&lhs.CMTimeFlags flags = v28;
        HIDWORD(lhs.epoch) = epoch;
        CMTimeSubtract(&time, &time2, &lhs);
        int64_t v26 = time.value;
        CMTimeFlags v15 = time.flags;
        CMTimeScale v27 = time.timescale;
        CMTimeEpoch v16 = time.epoch;
      }
    }
  }
  else
  {
    while (1)
    {
      time.CMTimeValue value = v26;
      time.CMTimeScale timescale = v27;
      time.CMTimeFlags flags = v15;
      time.int epoch = v16;
      *(__n128 *)&time2.CMTimeValue value = v24;
      time2.int epoch = v25;
      if (CMTimeCompare(&time, &time2) > 0 || (v15 & 0x1D) != 1) {
        break;
      }
      time2.CMTimeValue value = v26;
      time2.CMTimeScale timescale = v27;
      time2.CMTimeFlags flags = v15;
      time2.int epoch = v16;
      lhs.CMTimeValue value = value;
      lhs.CMTimeScale timescale = value_high;
      *(void *)&lhs.CMTimeFlags flags = v28;
      HIDWORD(lhs.epoch) = epoch;
      CMTimeAdd(&time, &time2, &lhs);
      int64_t v26 = time.value;
      CMTimeFlags v15 = time.flags;
      CMTimeScale v27 = time.timescale;
      CMTimeEpoch v16 = time.epoch;
    }
  }
  timebase = self->super._timebase;
  if (timebase)
  {
    timerSource = self->super._timerSource;
    if (timerSource)
    {
      time.CMTimeValue value = v26;
      time.CMTimeScale timescale = v27;
      time.CMTimeFlags flags = v15;
      time.int epoch = v16;
      CMTimebaseSetTimerDispatchSourceNextFireTime(timebase, timerSource, &time, 0);
    }
  }
  *(int64_t *)((char *)&self->_lastIntervalUsed.epoch + 4) = v26;
  HIDWORD(self->_lastPeriodicFireTime.value) = v27;
  self->_lastPeriodicFireTime.CMTimeScale timescale = v15;
  *(void *)&self->_lastPeriodicFireTime.CMTimeFlags flags = v16;
}

- (void)_handleTimeDiscontinuity
{
  if (self->super._timerSource && self->super._timebase)
  {
    uint64_t v3 = (void *)MEMORY[0x199715AE0]();
    __n128 v7 = 0uLL;
    CMTimeEpoch v8 = 0;
    AVTimebaseObserver_figTimebaseGetTime(&v7);
    *(__n128 *)&time1.CMTimeValue value = v7;
    time1.int epoch = v8;
    CMTime v5 = *(CMTime *)((char *)&self->_lastNonperiodicFireTime.epoch + 4);
    if (CMTimeCompare(&time1, &v5))
    {
      *(__n128 *)&time1.CMTimeValue value = v7;
      time1.int epoch = v8;
      [(AVPeriodicTimebaseObserver *)self _fireBlockForTime:&time1];
      __n128 v4 = (_OWORD *)MEMORY[0x1E4F1F9F8];
      *(void *)&self->_lastStopTime.CMTimeFlags flags = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      *(_OWORD *)((char *)&self->_lastNonperiodicFireTime.epoch + 4) = *v4;
      if (self->super._timebase)
      {
        if (self->super._currentRate != 0.0)
        {
          *(__n128 *)((char *)&self->_lastPeriodicFireTime.epoch + 4) = v7;
          *(void *)&self->_lastNonperiodicFireTime.CMTimeFlags flags = v8;
          [(AVPeriodicTimebaseObserver *)self _resetNextFireTime];
        }
      }
    }
  }
}

@end