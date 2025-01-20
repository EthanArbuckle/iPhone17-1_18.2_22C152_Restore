@interface AVPlayerItemIntegratedTimelinePeriodicObserver
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_getNextPeriodicFireTimeFromIntegratedCurrentTime:(SEL)a3;
- (AVPlayerItemIntegratedTimelinePeriodicObserver)initWithInterval:(id *)a3 queue:(id)a4 block:(id)a5;
- (BOOL)_doesTimeResideInItemIntegratedTimelineOffsets:(id *)a3 withOffsets:(id)a4 timeMappingOut:(id *)a5;
- (BOOL)hasObserverBeenScheduledYet;
- (void)dealloc;
- (void)rescheduleObserverWithSnapshot:(id)a3 itemToSchedule:(id)a4;
@end

@implementation AVPlayerItemIntegratedTimelinePeriodicObserver

- (AVPlayerItemIntegratedTimelinePeriodicObserver)initWithInterval:(id *)a3 queue:(id)a4 block:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)AVPlayerItemIntegratedTimelinePeriodicObserver;
  v8 = [(AVPlayerItemIntegratedTimelinePeriodicObserver *)&v13 init];
  v9 = v8;
  if (v8)
  {
    int64_t var3 = a3->var3;
    *(_OWORD *)&v8->_interval.value = *(_OWORD *)&a3->var0;
    if (a4) {
      v11 = a4;
    }
    else {
      v11 = MEMORY[0x1E4F14428];
    }
    v9->_interval.epoch = var3;
    v9->_queue = (OS_dispatch_queue *)v11;
    dispatch_retain(v11);
    v9->_block = (id)[a5 copy];
    v9->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v9;
}

- (void)dealloc
{
  [(AVTimebaseObserver *)self->_periodicObserver invalidate];

  dispatch_release((dispatch_object_t)self->_queue);
  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerItemIntegratedTimelinePeriodicObserver;
  [(AVPlayerItemIntegratedTimelinePeriodicObserver *)&v3 dealloc];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_getNextPeriodicFireTimeFromIntegratedCurrentTime:(SEL)a3
{
  memset(&v9, 0, sizeof(v9));
  int32_t timescale = self->_interval.timescale;
  CMTime v8 = *(CMTime *)a4;
  CMTimeConvertScale(&v9, &v8, timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, self->_interval.value+ self->_interval.value * (int)(v9.value / self->_interval.value), self->_interval.timescale);
}

- (BOOL)_doesTimeResideInItemIntegratedTimelineOffsets:(id *)a3 withOffsets:(id)a4 timeMappingOut:(id *)a5
{
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA00] + 48);
  *(_OWORD *)&v22.source.duration.int32_t timescale = *(_OWORD *)(MEMORY[0x1E4F1FA00] + 32);
  *(_OWORD *)&v22.target.start.value = v8;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1FA00] + 80);
  *(_OWORD *)&v22.target.start.epoch = *(_OWORD *)(MEMORY[0x1E4F1FA00] + 64);
  *(_OWORD *)&v22.target.duration.int32_t timescale = v9;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1FA00] + 16);
  *(_OWORD *)&v22.source.start.value = *MEMORY[0x1E4F1FA00];
  *(_OWORD *)&v22.source.start.epoch = v10;
  if (![a4 count])
  {
    if (!a5) {
      return 0;
    }
    goto LABEL_9;
  }
  unint64_t v11 = 1;
  do
  {
    CMTimeMappingMakeFromDictionary(&v22, (CFDictionaryRef)[a4 objectAtIndex:v11 - 1]);
    CMTimeRange range = v22.target;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = *a3;
    int v12 = CMTimeRangeContainsTime(&range, (CMTime *)&v20);
    BOOL v13 = v12 != 0;
    if (v11 >= [a4 count]) {
      break;
    }
    ++v11;
  }
  while (!v12);
  if (a5)
  {
    if (v12)
    {
      BOOL v13 = 1;
      v14 = &v22;
LABEL_10:
      long long v15 = *(_OWORD *)&v14->source.start.epoch;
      *(_OWORD *)&a5->var0.var0.var0 = *(_OWORD *)&v14->source.start.value;
      *(_OWORD *)&a5->var0.var0.int64_t var3 = v15;
      long long v16 = *(_OWORD *)&v14->source.duration.timescale;
      long long v17 = *(_OWORD *)&v14->target.start.value;
      long long v18 = *(_OWORD *)&v14->target.duration.timescale;
      *(_OWORD *)&a5->var1.var0.int64_t var3 = *(_OWORD *)&v14->target.start.epoch;
      *(_OWORD *)&a5->var1.var1.var1 = v18;
      *(_OWORD *)&a5->var0.var1.var1 = v16;
      *(_OWORD *)&a5->var1.var0.var0 = v17;
      return v13;
    }
LABEL_9:
    BOOL v13 = 0;
    v14 = (CMTimeMapping *)MEMORY[0x1E4F1FA00];
    goto LABEL_10;
  }
  return v13;
}

- (void)rescheduleObserverWithSnapshot:(id)a3 itemToSchedule:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v7 = (void *)[a3 currentSegment];
  long long v46 = 0uLL;
  CMTimeEpoch v47 = 0;
  if (a3) {
    [a3 currentTime];
  }
  uint64_t v8 = [a4 timebase];
  CMTime v45 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  CMTime v43 = start;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1FA00] + 48);
  long long v41 = *(_OWORD *)(MEMORY[0x1E4F1FA00] + 32);
  *(_OWORD *)&v42.start.unsigned int value = v9;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1FA00] + 80);
  *(_OWORD *)&v42.start.epoch = *(_OWORD *)(MEMORY[0x1E4F1FA00] + 64);
  *(_OWORD *)&v42.duration.int32_t timescale = v10;
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F1FA00] + 16);
  long long v39 = *MEMORY[0x1E4F1FA00];
  long long v40 = v11;
  v38 = 0;
  uint64_t v12 = [v7 segmentType];
  BOOL v13 = v12 == 1 && objc_msgSend((id)objc_msgSend(v7, "interstitialEvent"), "timelineOccupancy") == 0;
  if (a4)
  {
    MEMORY[0x199715030](self->_mutex);
    *(_OWORD *)&otherRange.start.unsigned int value = v46;
    otherRange.start.epoch = v47;
    [(AVPlayerItemIntegratedTimelinePeriodicObserver *)self _getNextPeriodicFireTimeFromIntegratedCurrentTime:&otherRange];
    otherRange.CMTime start = v43;
    [a3 mapTime:&otherRange toSegment:&v38 atSegmentOffset:&start];
    uint64_t v14 = [a4 _integratedTimelineOffsets];
    otherRange.CMTime start = v43;
    BOOL v15 = [(AVPlayerItemIntegratedTimelinePeriodicObserver *)self _doesTimeResideInItemIntegratedTimelineOffsets:&otherRange withOffsets:v14 timeMappingOut:&v39];
    if (v15)
    {
      BOOL v16 = v15;
      if (v7)
      {
        [v7 timeMapping];
      }
      else
      {
        long long v35 = 0u;
        memset(&v36, 0, sizeof(v36));
        long long v34 = 0u;
        long long v33 = 0u;
      }
      CMTimeRange range = v36;
      CMTimeRange otherRange = v42;
      if (!CMTimeRangeContainsTimeRange(&range, &otherRange))
      {
LABEL_29:
        MEMORY[0x199715040](self->_mutex);
        return;
      }
      int v17 = 0;
      char v18 = !v16;
      if (v38 != v7) {
        char v18 = 1;
      }
      if ((v18 & 1) == 0 && !v13)
      {
        if (v12 == 1)
        {
          CMTime lhs = v43;
          CMTime rhs = v42.start;
          CMTimeSubtract(&otherRange.start, &lhs, &rhs);
          CMTime start = otherRange.start;
        }
        memset(&otherRange, 0, 24);
        int32_t timescale = self->_interval.timescale;
        *(_OWORD *)&lhs.unsigned int value = v39;
        lhs.epoch = v40;
        int v17 = 1;
        CMTimeConvertScale(&otherRange.start, &lhs, timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        memset(&lhs, 0, sizeof(lhs));
        CMTimeMake(&lhs, otherRange.start.value / self->_interval.value * self->_interval.value, self->_interval.timescale);
        CMTime rhs = otherRange.start;
        CMTime v30 = lhs;
        CMTimeSubtract(&v31, &rhs, &v30);
        CMTime rhs = start;
        CMTimeAdd(&v45, &v31, &rhs);
        long long v20 = *(_OWORD *)&v42.start.value;
        *(_OWORD *)&self->_observedTimeMapping.source.duration.int32_t timescale = v41;
        *(_OWORD *)&self->_observedTimeMapping.target.start.unsigned int value = v20;
        long long v21 = *(_OWORD *)&v42.duration.timescale;
        *(_OWORD *)&self->_observedTimeMapping.target.start.epoch = *(_OWORD *)&v42.start.epoch;
        *(_OWORD *)&self->_observedTimeMapping.target.duration.int32_t timescale = v21;
        long long v22 = v40;
        *(_OWORD *)&self->_observedTimeMapping.source.start.unsigned int value = v39;
        *(_OWORD *)&self->_observedTimeMapping.source.start.epoch = v22;
      }
    }
    else
    {
      int v17 = 0;
    }
    [(AVTimebaseObserver *)self->_periodicObserver invalidate];

    self->_periodicObserver = 0;
    if (v17)
    {
      if (dword_1E9356B30)
      {
        LODWORD(rhs.value) = 0;
        LOBYTE(v30.value) = 0;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int value = rhs.value;
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, v30.value)) {
          unsigned int v25 = value;
        }
        else {
          unsigned int v25 = value & 0xFFFFFFFE;
        }
        if (v25)
        {
          otherRange.CMTime start = v45;
          Float64 Seconds = CMTimeGetSeconds(&otherRange.start);
          LODWORD(lhs.value) = 136315650;
          *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)"-[AVPlayerItemIntegratedTimelinePeriodicObserver resch"
                                                                  "eduleObserverWithSnapshot:itemToSchedule:]";
          LOWORD(lhs.flags) = 2048;
          *(void *)((char *)&lhs.flags + 2) = self;
          HIWORD(lhs.epoch) = 2048;
          Float64 v49 = Seconds;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __96__AVPlayerItemIntegratedTimelinePeriodicObserver_rescheduleObserverWithSnapshot_itemToSchedule___block_invoke;
      v29[3] = &unk_1E57B7340;
      v29[4] = self;
      self->_hasBeenScheduled = 1;
      v27 = [AVPeriodicTimebaseObserver alloc];
      *(_OWORD *)&otherRange.start.unsigned int value = *(_OWORD *)&self->_interval.value;
      queue = self->_queue;
      otherRange.start.epoch = self->_interval.epoch;
      CMTime lhs = v45;
      self->_periodicObserver = [(AVPeriodicTimebaseObserver *)v27 initWithTimebase:v8 interval:&otherRange offset:&lhs queue:queue block:v29];
    }
    goto LABEL_29;
  }
}

void __96__AVPlayerItemIntegratedTimelinePeriodicObserver_rescheduleObserverWithSnapshot_itemToSchedule___block_invoke(uint64_t a1, CMTime *a2)
{
  v4 = (void *)MEMORY[0x199715AE0]();
  memset(&v12, 0, sizeof(v12));
  uint64_t v5 = *(void *)(a1 + 32);
  CMTime v11 = *a2;
  long long v6 = *(_OWORD *)(v5 + 72);
  *(_OWORD *)&fromRange.start.unsigned int value = *(_OWORD *)(v5 + 56);
  *(_OWORD *)&fromRange.start.epoch = v6;
  *(_OWORD *)&fromRange.duration.int32_t timescale = *(_OWORD *)(v5 + 88);
  long long v7 = *(_OWORD *)(v5 + 120);
  *(_OWORD *)&v9.start.unsigned int value = *(_OWORD *)(v5 + 104);
  *(_OWORD *)&v9.start.epoch = v7;
  *(_OWORD *)&v9.duration.int32_t timescale = *(_OWORD *)(v5 + 136);
  CMTimeMapTimeFromRangeToRange(&v12, &v11, &fromRange, &v9);
  uint64_t v8 = *(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16);
  fromRange.CMTime start = v12;
  v8();
}

- (BOOL)hasObserverBeenScheduledYet
{
  MEMORY[0x199715030](self->_mutex, a2);
  BOOL hasBeenScheduled = self->_hasBeenScheduled;
  MEMORY[0x199715040](self->_mutex);
  return hasBeenScheduled;
}

@end